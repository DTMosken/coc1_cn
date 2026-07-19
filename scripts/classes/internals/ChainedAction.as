package classes.internals
{
   import classes.CoC_Settings;
   import flash.Boot;
   
   public class ChainedAction implements RandomAction
   {
      
      public var probs:Array;
      
      public var defaultAction:Function;
      
      public var actions:Array;
      
      public function ChainedAction(param1:Object = undefined)
      {
         if(Boot.skip_constructor)
         {
            return;
         }
         probs = [];
         actions = [];
         defaultAction = param1;
      }
      
      public function exec() : void
      {
         var _loc3_:int = 0;
         var _loc1_:int = 0;
         var _loc2_:int = int(actions.length);
         while(_loc1_ < _loc2_)
         {
            _loc3_ = _loc1_++;
            if(Math.random() < Number(probs[_loc3_]))
            {
               actions[_loc3_]();
               return;
            }
         }
         if(defaultAction != null)
         {
            defaultAction();
         }
      }
      
      public function elseAction(param1:Function) : ChainedAction
      {
         defaultAction = param1;
         return this;
      }
      
      public function add(param1:Function, param2:Number) : ChainedAction
      {
         if(param2 < 0 || param2 > 1)
         {
            CoC_Settings.error("无效的概率值 " + param2);
         }
         actions.push(param1);
         probs.push(param2);
         return this;
      }
   }
}

