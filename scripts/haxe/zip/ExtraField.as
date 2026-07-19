package haxe.zip
{
   import flash.Boot;
   import haxe.io.Bytes;
   
   public final class ExtraField
   {
      
      public static const __isenum:Boolean = true;
      
      public static var FUtf8:ExtraField = new ExtraField("FUtf8",2,null);
      
      public static var __constructs__:Array = ["FUnknown","FInfoZipUnicodePath","FUtf8"];
      
      public var tag:String;
      
      public var index:int;
      
      public var params:Array;
      
      public const __enum__:Boolean = true;
      
      public function ExtraField(param1:String, param2:int, param3:Array)
      {
         tag = param1;
         index = param2;
         params = param3;
      }
      
      public static function FInfoZipUnicodePath(param1:String, param2:int) : ExtraField
      {
         return new ExtraField("FInfoZipUnicodePath",1,[param1,param2]);
      }
      
      public static function FUnknown(param1:int, param2:Bytes) : ExtraField
      {
         return new ExtraField("FUnknown",0,[param1,param2]);
      }
      
      final public function toString() : String
      {
         return Boot.enum_to_string(this);
      }
   }
}

