package format.png
{
   import flash.Boot;
   import haxe.io.Bytes;
   
   public final class Chunk
   {
      
      public static const __isenum:Boolean = true;
      
      public static var CEnd:Chunk = new Chunk("CEnd",0,null);
      
      public static var __constructs__:Array = ["CEnd","CHeader","CData","CPalette","CUnknown"];
      
      public var tag:String;
      
      public var index:int;
      
      public var params:Array;
      
      public const __enum__:Boolean = true;
      
      public function Chunk(param1:String, param2:int, param3:Array)
      {
         tag = param1;
         index = param2;
         params = param3;
      }
      
      public static function CData(param1:Bytes) : Chunk
      {
         return new Chunk("CData",2,[param1]);
      }
      
      public static function CHeader(param1:Object) : Chunk
      {
         return new Chunk("CHeader",1,[param1]);
      }
      
      public static function CPalette(param1:Bytes) : Chunk
      {
         return new Chunk("CPalette",3,[param1]);
      }
      
      public static function CUnknown(param1:String, param2:Bytes) : Chunk
      {
         return new Chunk("CUnknown",4,[param1,param2]);
      }
      
      final public function toString() : String
      {
         return Boot.enum_to_string(this);
      }
   }
}

