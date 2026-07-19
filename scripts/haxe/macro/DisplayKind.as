package haxe.macro
{
   import flash.Boot;
   
   public final class DisplayKind
   {
      
      public static const __isenum:Boolean = true;
      
      public static var DKCall:DisplayKind = new DisplayKind("DKCall",0,null);
      
      public static var DKDot:DisplayKind = new DisplayKind("DKDot",1,null);
      
      public static var DKMarked:DisplayKind = new DisplayKind("DKMarked",3,null);
      
      public static var DKStructure:DisplayKind = new DisplayKind("DKStructure",2,null);
      
      public static var __constructs__:Array = ["DKCall","DKDot","DKStructure","DKMarked","DKPattern"];
      
      public var tag:String;
      
      public var index:int;
      
      public var params:Array;
      
      public const __enum__:Boolean = true;
      
      public function DisplayKind(param1:String, param2:int, param3:Array)
      {
         tag = param1;
         index = param2;
         params = param3;
      }
      
      public static function DKPattern(param1:Boolean) : DisplayKind
      {
         return new DisplayKind("DKPattern",4,[param1]);
      }
      
      final public function toString() : String
      {
         return Boot.enum_to_string(this);
      }
   }
}

