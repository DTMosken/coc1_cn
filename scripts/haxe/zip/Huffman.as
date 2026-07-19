package haxe.zip
{
   import flash.Boot;
   
   public final class Huffman
   {
      
      public static const __isenum:Boolean = true;
      
      public static var __constructs__:Array = ["Found","NeedBit","NeedBits"];
      
      public var tag:String;
      
      public var index:int;
      
      public var params:Array;
      
      public const __enum__:Boolean = true;
      
      public function Huffman(param1:String, param2:int, param3:Array)
      {
         tag = param1;
         index = param2;
         params = param3;
      }
      
      public static function Found(param1:int) : Huffman
      {
         return new Huffman("Found",0,[param1]);
      }
      
      public static function NeedBit(param1:Huffman, param2:Huffman) : Huffman
      {
         return new Huffman("NeedBit",1,[param1,param2]);
      }
      
      public static function NeedBits(param1:int, param2:Array) : Huffman
      {
         return new Huffman("NeedBits",2,[param1,param2]);
      }
      
      final public function toString() : String
      {
         return Boot.enum_to_string(this);
      }
   }
}

