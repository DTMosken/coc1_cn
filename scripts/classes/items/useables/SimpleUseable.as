package classes.items.useables
{
   import classes.items.Useable;
   import flash.Boot;
   
   public class SimpleUseable extends Useable
   {
      
      public var canUseText:String;
      
      public var canUseFunction:Function;
      
      public function SimpleUseable(param1:String = undefined, param2:String = undefined, param3:String = undefined, param4:Number = 0, param5:String = undefined, param6:String = undefined, param7:Object = undefined)
      {
         if(Boot.skip_constructor)
         {
            return;
         }
         super(param1,param2,param3,param4,param5);
         canUseFunction = param7;
         canUseText = param6;
         invUseOnly = true;
      }
      
      override public function canUse() : Boolean
      {
         clearOutput();
         if(canUseFunction != null)
         {
            canUseFunction();
         }
         else
         {
            outputText(canUseText);
         }
         return false;
      }
   }
}

