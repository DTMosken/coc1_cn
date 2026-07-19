package coc.script
{
   import flash.Boot;
   
   public final class VType
   {
      
      public static const __isenum:Boolean = true;
      
      public static var VNull:VType = new VType("VNull",4,null);
      
      public static var __constructs__:Array = ["VFloat","VInt","VBool","VString","VNull"];
      
      public var tag:String;
      
      public var index:int;
      
      public var params:Array;
      
      public const __enum__:Boolean = true;
      
      public function VType(param1:String, param2:int, param3:Array)
      {
         tag = param1;
         index = param2;
         params = param3;
      }
      
      public static function VBool(param1:Boolean) : VType
      {
         return new VType("VBool",2,[param1]);
      }
      
      public static function VFloat(param1:Number) : VType
      {
         return new VType("VFloat",0,[param1]);
      }
      
      public static function VInt(param1:int) : VType
      {
         return new VType("VInt",1,[param1]);
      }
      
      public static function VString(param1:String) : VType
      {
         return new VType("VString",3,[param1]);
      }
      
      final public function toString() : String
      {
         return Boot.enum_to_string(this);
      }
   }
}

