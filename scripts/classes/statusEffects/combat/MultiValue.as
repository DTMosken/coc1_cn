package classes.statusEffects.combat
{
   import classes.internals._ValueFunc.NumberFunc_Impl_;
   import flash.Boot;
   
   public class MultiValue
   {
      
      public var valueArray:Array;
      
      public var multi:Boolean;
      
      public function MultiValue(param1:Object = undefined, param2:Array = undefined)
      {
         if(Boot.skip_constructor)
         {
            return;
         }
         valueArray = [];
         multi = false;
         if(param1 != null)
         {
            multi = param1;
         }
         if(param2 != null)
         {
            valueArray = param2;
         }
      }
      
      public function calcValue() : Number
      {
         var _loc4_:* = null as Function;
         var _loc1_:Number = multi ? 1 : 0;
         var _loc2_:int = 0;
         var _loc3_:Array = valueArray;
         while(_loc2_ < int(_loc3_.length))
         {
            _loc4_ = _loc3_[_loc2_];
            _loc2_++;
            if(multi)
            {
               _loc1_ *= NumberFunc_Impl_.resolve(_loc4_);
            }
            else
            {
               _loc1_ += NumberFunc_Impl_.resolve(_loc4_);
            }
         }
         return _loc1_;
      }
   }
}

