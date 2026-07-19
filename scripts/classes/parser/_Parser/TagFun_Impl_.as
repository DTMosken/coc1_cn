package classes.parser._Parser
{
   import classes.parser.TagVal;
   
   public final class TagFun_Impl_
   {
      
      public function TagFun_Impl_()
      {
      }
      
      public static function _new(param1:Function) : Function
      {
         return param1;
      }
      
      public static function fromString(param1:String) : Function
      {
         var value:String = param1;
         return function():TagVal
         {
            return TagVal.TagString(value);
         };
      }
      
      public static function fromBool(param1:Boolean) : Function
      {
         var value:Boolean = param1;
         return function():TagVal
         {
            return TagVal.TagBool(value);
         };
      }
      
      public static function fromInt(param1:int) : Function
      {
         var value:int = param1;
         return function():TagVal
         {
            return TagVal.TagInt(value);
         };
      }
      
      public static function fromFloat(param1:Number) : Function
      {
         var value:Number = param1;
         return function():TagVal
         {
            return TagVal.TagFloat(value);
         };
      }
      
      public static function fromStringFun(param1:Function) : Function
      {
         var value:Function = param1;
         return function():TagVal
         {
            return TagVal.TagString(value());
         };
      }
      
      public static function fromBoolFun(param1:Function) : Function
      {
         var value:Function = param1;
         return function():TagVal
         {
            return TagVal.TagBool(Boolean(value()));
         };
      }
      
      public static function fromIntFun(param1:Function) : Function
      {
         var value:Function = param1;
         return function():TagVal
         {
            return TagVal.TagInt(int(value()));
         };
      }
      
      public static function fromFloatFun(param1:Function) : Function
      {
         var value:Function = param1;
         return function():TagVal
         {
            return TagVal.TagFloat(Number(value()));
         };
      }
   }
}

