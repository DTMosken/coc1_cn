package classes
{
   import classes._FlagDict.FlagDict_Impl_;
   import classes.globalFlags.KFLAGS;
   import coc.view.BitmapDataSprite;
   import coc.view.Color;
   import coc.view.MainView;
   import coc.view.StatsView;
   import coc.view.Theme;
   import flash.Boot;
   import flash.display.Bitmap;
   import flash.display.BitmapData;
   import flash.display.Graphics;
   import flash.events.KeyboardEvent;
   import flash.events.TimerEvent;
   import flash.filters.DropShadowFilter;
   import flash.geom.Matrix;
   import flash.utils.Timer;
   import openfl.display._internal.FlashGraphics;
   
   public class MainViewManager extends BaseContent
   {
      
      public var statsHidden:Boolean;
      
      public var registeredShiftKey:Boolean;
      
      public var buttonsTweened:Boolean;
      
      public function MainViewManager()
      {
         if(Boot.skip_constructor)
         {
            return;
         }
         buttonsTweened = false;
         statsHidden = false;
         registeredShiftKey = false;
         super();
      }
      
      public function tweenOutStats() : void
      {
         var _gthis:MainViewManager = this;
         var _loc1_:Timer = new Timer(20,21);
         if(statsHidden)
         {
            return;
         }
         statsHidden = true;
         _loc1_.addEventListener(TimerEvent.TIMER,function(param1:TimerEvent):void
         {
            var _loc2_:StatsView = _gthis.get_mainView().statsView;
            _loc2_.x -= 10;
            var _loc3_:StatsView = _gthis.get_mainView().statsView;
            _loc3_.alpha -= 0.05;
            if(_gthis.get_mainView().statsView.alpha < 0)
            {
               _gthis.get_mainView().statsView.alpha = 0;
            }
         });
         _loc1_.addEventListener(TimerEvent.TIMER_COMPLETE,function(param1:TimerEvent):void
         {
            _gthis.get_mainView().statsView.x = -200;
            _gthis.get_mainView().statsView.alpha = 0;
         });
         _loc1_.start();
      }
      
      public function tweenInStats() : void
      {
         var _gthis:MainViewManager = this;
         var _loc1_:Timer = new Timer(20,21);
         if(!statsHidden)
         {
            return;
         }
         statsHidden = false;
         _loc1_.addEventListener(TimerEvent.TIMER,function(param1:TimerEvent):void
         {
            var _loc2_:StatsView = _gthis.get_mainView().statsView;
            _loc2_.x += 10;
            var _loc3_:StatsView = _gthis.get_mainView().statsView;
            _loc3_.alpha += 0.05;
         });
         _loc1_.addEventListener(TimerEvent.TIMER_COMPLETE,function(param1:TimerEvent):void
         {
            _gthis.get_mainView().statsView.x = 0;
            _gthis.get_mainView().statsView.alpha = 1;
         });
         _loc1_.start();
      }
      
      public function showSpriteBitmap(param1:BitmapData) : void
      {
         if(param1 == null)
         {
            return;
         }
         var _loc2_:BitmapDataSprite = get_mainView().sprite;
         _loc2_.visible = true;
         var _loc3_:Number = 80 / param1.height;
         _loc2_.scaleX = _loc3_;
         _loc2_.scaleY = _loc3_;
         _loc2_.graphics.clear();
         var _loc4_:Graphics = _loc2_.graphics;
         var _loc5_:Matrix = null;
         FlashGraphics.bitmapFill[_loc4_] = param1;
         _loc4_.beginBitmapFill(param1,_loc5_,false,false);
         _loc2_.graphics.drawRect(0,0,param1.width,param1.height);
         _loc4_ = _loc2_.graphics;
         var _loc6_:BitmapData = null;
         FlashGraphics.bitmapFill[_loc4_] = _loc6_;
         _loc4_.endFill();
         var _loc7_:DropShadowFilter = new DropShadowFilter();
         _loc7_.strength = 0.4;
         if(!isDarkTheme())
         {
            if(int(_loc2_.filters.length) < 1)
            {
               _loc2_.filters = [_loc7_];
            }
         }
         else
         {
            _loc2_.filters = [];
         }
      }
      
      public function showImageBitmap(param1:BitmapData, param2:int = 0, param3:int = 0) : void
      {
         if(param1 == null)
         {
            return;
         }
         get_mainView().image.x = param2;
         get_mainView().image.y = param3;
         var _loc4_:BitmapDataSprite = get_mainView().image;
         _loc4_.visible = true;
         _loc4_.graphics.clear();
         var _loc5_:Graphics = _loc4_.graphics;
         var _loc6_:Matrix = null;
         FlashGraphics.bitmapFill[_loc5_] = param1;
         _loc5_.beginBitmapFill(param1,_loc6_,false,false);
         _loc4_.graphics.drawRect(0,0,param1.width,param1.height);
         _loc5_ = _loc4_.graphics;
         var _loc7_:BitmapData = null;
         FlashGraphics.bitmapFill[_loc5_] = _loc7_;
         _loc5_.endFill();
         var _loc8_:DropShadowFilter = new DropShadowFilter();
         _loc8_.strength = 0.4;
         if(!isDarkTheme())
         {
            if(int(_loc4_.filters.length) < 1)
            {
               _loc4_.filters = [_loc8_];
            }
         }
         else
         {
            _loc4_.filters = [];
         }
      }
      
      public function set_theme(param1:Theme) : Theme
      {
         return Theme.set_current(param1);
      }
      
      public function setText(param1:String, param2:String = undefined) : void
      {
         if(param2 == null)
         {
            param2 = "";
         }
         get_mainView().resetTextFormat();
         get_mainView().setOutputText(param1,param2);
      }
      
      public function registerShiftKeys() : void
      {
         if(!registeredShiftKey)
         {
            get_mainView().stage.addEventListener(KeyboardEvent.KEY_DOWN,keyPressed);
            get_mainView().stage.addEventListener(KeyboardEvent.KEY_UP,keyReleased);
            registeredShiftKey = true;
         }
      }
      
      public function refreshStats() : void
      {
         get_mainView().statsView.toggleHungerBar(get_survival() && FlagDict_Impl_.arrayReadFloat(KFLAGS.flags,711) != 0.75);
         get_mainView().statsView.refreshStats(get_game());
         get_mainView().monsterStatsView.refreshStats(get_game());
         if(!get_mainView().sprite.visible)
         {
            refreshMinimap();
         }
         applyTheme();
      }
      
      public function refreshMinimap() : void
      {
         if(!get_game().get_inCombat() && (get_inDungeon() || get_game().inRoomedDungeon))
         {
            get_mainView().minimapView.show();
            if(get_game().dungeons.usingAlternative)
            {
               get_mainView().minimapView.refreshIconMinimap();
               get_game().dungeons.map.redraw(get_mainView().dungeonMap);
            }
            else
            {
               get_mainView().minimapView.minidungeonMap.visible = false;
               get_mainView().minimapView.mapView.htmlText = get_game().dungeons.map.chooseRoomToDisplay();
            }
         }
         else
         {
            get_mainView().minimapView.hide();
            get_mainView().minimapView.mapView.htmlText = "";
         }
         get_mainView().minimapView.refreshHtmlText();
      }
      
      public function keyReleased(param1:KeyboardEvent) : void
      {
         if(param1.keyCode == 16)
         {
            FlagDict_Impl_.arrayWriteInt(KFLAGS.flags,2140,0);
         }
      }
      
      public function keyPressed(param1:KeyboardEvent) : void
      {
         if(param1.keyCode == 16)
         {
            FlagDict_Impl_.arrayWriteInt(KFLAGS.flags,2140,1);
         }
      }
      
      public function isDarkTheme() : Boolean
      {
         return Theme.current.get_isDark();
      }
      
      public function hideSprite() : void
      {
         get_mainView().sprite.visible = false;
      }
      
      public function hideImage() : void
      {
         get_mainView().image.visible = false;
      }
      
      public function get_theme() : Theme
      {
         return Theme.current;
      }
      
      public function colorLustPlus() : String
      {
         if(isDarkTheme())
         {
            return "#ff00ff";
         }
         return "#ff00ff";
      }
      
      public function colorHpPlus() : String
      {
         if(isDarkTheme())
         {
            return "#00ff00";
         }
         return "#008000";
      }
      
      public function colorHpNeutral() : String
      {
         if(isDarkTheme())
         {
            return "#0000ff";
         }
         return "#000080";
      }
      
      public function colorHpMinus() : String
      {
         if(isDarkTheme())
         {
            return "#ff0000";
         }
         return "#800000";
      }
      
      public function applyTheme() : void
      {
         get_mainView().background.set_bitmap(get_theme().get_mainBg());
         get_mainView().monsterStatsView.setBackgroundBitmap(get_theme().get_monsterBg());
         var _loc1_:String = get_displaySettings().oldFont ? "Lucida Sans Typewriter" : "Alibaba PuHuiTi 3 85 Bold";
         get_mainView().statsView.setTheme(_loc1_,get_theme().get_sideTextColor(),get_theme().get_barAlpha());
         get_mainView().monsterStatsView.setTheme(_loc1_,get_theme().get_sideTextColor(),get_theme().get_barAlpha());
         get_mainView().minimapView.setTheme();
         get_mainView().stage.color = Color.parseColorString(get_theme().get_stageColor());
      }
   }
}

