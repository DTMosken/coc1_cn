package classes.scenes.api._Encounters
{
   public final class EncounterChance_Impl_
   {
      
      public function EncounterChance_Impl_()
      {
      }
      
      public static function _new(param1:Function) : Function
      {
         return param1;
      }
      
      public static function fromBoolFun(param1:Function) : Function
      {
         var v:Function = param1;
         return function():Number
         {
            if(Boolean(v()))
            {
               return 1;
            }
            return 0;
         };
      }
      
      public static function fromFloatConst(param1:Number) : Function
      {
         var v:Number = param1;
         return function():Number
         {
            return v;
         };
      }
      
      public static function fromBoolConst(param1:Boolean) : Function
      {
         var v:Boolean = param1;
         return function():Number
         {
            if(v)
            {
               return 1;
            }
            return 0;
         };
      }
   }
}

