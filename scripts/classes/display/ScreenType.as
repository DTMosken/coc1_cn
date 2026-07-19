package classes.display
{
   import flash.Boot;
   
   public final class ScreenType
   {
      
      public static const __isenum:Boolean = true;
      
      public static var Default:ScreenType = new ScreenType("Default",0,null);
      
      public static var DungeonMap:ScreenType = new ScreenType("DungeonMap",4,null);
      
      public static var MainMenu:ScreenType = new ScreenType("MainMenu",1,null);
      
      public static var OptionsMenu:ScreenType = new ScreenType("OptionsMenu",2,null);
      
      public static var StashView:ScreenType = new ScreenType("StashView",3,null);
      
      public static var __constructs__:Array = ["Default","MainMenu","OptionsMenu","StashView","DungeonMap"];
      
      public var tag:String;
      
      public var index:int;
      
      public var params:Array;
      
      public const __enum__:Boolean = true;
      
      public function ScreenType(param1:String, param2:int, param3:Array)
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

