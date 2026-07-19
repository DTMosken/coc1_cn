package classes.parser
{
   import flash.Boot;
   
   public final class TagVal
   {
      
      public static const __isenum:Boolean = true;
      
      public static var __constructs__:Array = ["TagString","TagBool","TagInt","TagFloat"];
      
      public var tag:String;
      
      public var index:int;
      
      public var params:Array;
      
      public const __enum__:Boolean = true;
      
      public function TagVal(param1:String, param2:int, param3:Array)
      {
         tag = param1;
         index = param2;
         params = param3;
      }
      
      public static function TagBool(param1:Boolean) : TagVal
      {
         return new TagVal("TagBool",1,[param1]);
      }
      
      public static function TagFloat(param1:Number) : TagVal
      {
         return new TagVal("TagFloat",3,[param1]);
      }
      
      public static function TagInt(param1:int) : TagVal
      {
         return new TagVal("TagInt",2,[param1]);
      }
      
      public static function TagString(param1:String) : TagVal
      {
         return new TagVal("TagString",0,[param1]);
      }
      
      final public function toString() : String
      {
         return Boot.enum_to_string(this);
      }
   }
}

