package haxe.macro
{
   import flash.Boot;
   
   public final class Access
   {
      
      public static const __isenum:Boolean = true;
      
      public static var AAbstract:Access = new Access("AAbstract",9,null);
      
      public static var ADynamic:Access = new Access("ADynamic",4,null);
      
      public static var AExtern:Access = new Access("AExtern",8,null);
      
      public static var AFinal:Access = new Access("AFinal",7,null);
      
      public static var AInline:Access = new Access("AInline",5,null);
      
      public static var AMacro:Access = new Access("AMacro",6,null);
      
      public static var AOverload:Access = new Access("AOverload",10,null);
      
      public static var AOverride:Access = new Access("AOverride",3,null);
      
      public static var APrivate:Access = new Access("APrivate",1,null);
      
      public static var APublic:Access = new Access("APublic",0,null);
      
      public static var AStatic:Access = new Access("AStatic",2,null);
      
      public static var __constructs__:Array = ["APublic","APrivate","AStatic","AOverride","ADynamic","AInline","AMacro","AFinal","AExtern","AAbstract","AOverload"];
      
      public var tag:String;
      
      public var index:int;
      
      public var params:Array;
      
      public const __enum__:Boolean = true;
      
      public function Access(param1:String, param2:int, param3:Array)
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

