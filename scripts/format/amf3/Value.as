package format.amf3
{
   import flash.Boot;
   import haxe.IMap;
   import haxe.io.Bytes;
   
   public final class Value
   {
      
      public static const __isenum:Boolean = true;
      
      public static var ANull:Value = new Value("ANull",1,null);
      
      public static var AUndefined:Value = new Value("AUndefined",0,null);
      
      public static var __constructs__:Array = ["AUndefined","ANull","ABool","AInt","ANumber","AString","ADate","AObject","AArray","AVector","AXml","ABytes","AMap"];
      
      public var tag:String;
      
      public var index:int;
      
      public var params:Array;
      
      public const __enum__:Boolean = true;
      
      public function Value(param1:String, param2:int, param3:Array)
      {
         tag = param1;
         index = param2;
         params = param3;
      }
      
      public static function AArray(param1:Array, param2:IMap = undefined) : Value
      {
         return new Value("AArray",8,[param1,param2]);
      }
      
      public static function ABool(param1:Boolean) : Value
      {
         return new Value("ABool",2,[param1]);
      }
      
      public static function ABytes(param1:Bytes) : Value
      {
         return new Value("ABytes",11,[param1]);
      }
      
      public static function ADate(param1:Date) : Value
      {
         return new Value("ADate",6,[param1]);
      }
      
      public static function AInt(param1:int) : Value
      {
         return new Value("AInt",3,[param1]);
      }
      
      public static function AMap(param1:IMap) : Value
      {
         return new Value("AMap",12,[param1]);
      }
      
      public static function ANumber(param1:Number) : Value
      {
         return new Value("ANumber",4,[param1]);
      }
      
      public static function AObject(param1:IMap, param2:Object = undefined, param3:String = undefined) : Value
      {
         return new Value("AObject",7,[param1,param2,param3]);
      }
      
      public static function AString(param1:String) : Value
      {
         return new Value("AString",5,[param1]);
      }
      
      public static function AVector(param1:Vector.<Value>, param2:String = undefined) : Value
      {
         return new Value("AVector",9,[param1,param2]);
      }
      
      public static function AXml(param1:Xml) : Value
      {
         return new Value("AXml",10,[param1]);
      }
      
      final public function toString() : String
      {
         return Boot.enum_to_string(this);
      }
   }
}

