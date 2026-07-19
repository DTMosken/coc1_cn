package classes.display
{
   import haxe.IMap;
   
   public class GameViewData
   {
      
      public static var init__:Boolean;
      
      public static var screenType:ScreenType;
      
      public static var htmlText:String;
      
      public static var imageText:String;
      
      public static var inputText:String;
      
      public static var playerStatData:Object;
      
      public static var monsterStatData:Array;
      
      public static var selectMonster:Function;
      
      public static var injectedDisplaySettings:IMap;
      
      public static var onSettingsUpdated:Function;
      
      public static var stashData:Array;
      
      public static var settingPaneData:SettingPaneData;
      
      public static var mapData:MapData;
      
      public static var menuButtons:Array = [];
      
      public static var bottomButtons:Array = [];
      
      public static var inputNeeded:Boolean = false;
      
      public static var showMonsterStats:Boolean = false;
      
      public static var menuData:Array = [];
      
      public static var views:Array = [];
      
      public function GameViewData()
      {
      }
      
      public static function clear() : void
      {
         var _loc3_:* = null as GameView;
         var _loc1_:int = 0;
         var _loc2_:Array = GameViewData.views;
         while(_loc1_ < int(_loc2_.length))
         {
            _loc3_ = _loc2_[_loc1_];
            _loc1_++;
            _loc3_.clear();
         }
      }
      
      public static function flush() : void
      {
         var _loc3_:* = null as GameView;
         var _loc1_:int = 0;
         var _loc2_:Array = GameViewData.views;
         while(_loc1_ < int(_loc2_.length))
         {
            _loc3_ = _loc2_[_loc1_];
            _loc1_++;
            _loc3_.flush();
         }
      }
      
      public static function subscribe(param1:GameView) : void
      {
         GameViewData.views.push(param1);
      }
      
      public static function unsubscribe(param1:GameView) : void
      {
         GameViewData.views.remove(param1);
      }
   }
}

