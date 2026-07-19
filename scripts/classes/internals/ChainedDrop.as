package classes.internals
{
   import classes.CoC_Settings;
   import classes.ItemType;
   import flash.Boot;
   
   public class ChainedDrop implements RandomChoice
   {
      
      public var defaultItem:ItemType;
      
      public var choices:Array;
      
      public function ChainedDrop(param1:ItemType = undefined)
      {
         if(Boot.skip_constructor)
         {
            return;
         }
         choices = [];
         defaultItem = param1;
      }
      
      public function roll() : ItemType
      {
         return choose();
      }
      
      public function elseDrop(param1:ItemType) : ChainedDrop
      {
         defaultItem = param1;
         return this;
      }
      
      public function choose() : Object
      {
         var _loc3_:* = null;
         var _loc1_:int = 0;
         var _loc2_:Array = choices;
         while(_loc1_ < int(_loc2_.length))
         {
            _loc3_ = _loc2_[_loc1_];
            _loc1_++;
            if(Math.random() < Number(_loc3_.weight))
            {
               return _loc3_.value;
            }
         }
         return defaultItem;
      }
      
      public function add(param1:ItemType, param2:Number) : ChainedDrop
      {
         if(param2 < 0 || param2 > 1)
         {
            CoC_Settings.error("无效的概率值 " + param2);
         }
         choices.push({
            "value":param1,
            "weight":param2
         });
         return this;
      }
   }
}

