package lime._internal.format
{
   import flash.Boot;
   
   public final class BMPType
   {
      
      public static const __isenum:Boolean = true;
      
      public static var BITFIELD:BMPType = new BMPType("BITFIELD",1,null);
      
      public static var ICO:BMPType = new BMPType("ICO",2,null);
      
      public static var RGB:BMPType = new BMPType("RGB",0,null);
      
      public static var __constructs__:Array = ["RGB","BITFIELD","ICO"];
      
      public var tag:String;
      
      public var index:int;
      
      public var params:Array;
      
      public const __enum__:Boolean = true;
      
      public function BMPType(param1:String, param2:int, param3:Array)
      {
         tag = param1;
         index = param2;
         params = param3;
      }
      
      final public function toString() : String
      {
         return Boot.enum_to_string(this);
      }
   }
}

