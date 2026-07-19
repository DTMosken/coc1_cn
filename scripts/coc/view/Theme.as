package coc.view
{
   import flash.Boot;
   import flash.display.Bitmap;
   import haxe.Exception;
   import haxe.IMap;
   import haxe.ds.Option;
   import haxe.ds.StringMap;
   
   public class Theme
   {
      
      public static var init__:Boolean;
      
      public static var _THEMES:IMap;
      
      public static var DEFAULT_THEME:Theme;
      
      public static var PARCHMENT:Theme;
      
      public static var MARBLE:Theme;
      
      public static var STONE:Theme;
      
      public static var OBSIDIAN:Theme;
      
      public static var BLACK:Theme;
      
      public static var current:Theme;
      
      public static var UPDATE:String = "coc$themeupdated";
      
      public static var _THEME_NAMES:Array = [];
      
      public static var _subscribers:Array = [];
      
      public var _textColors:Option;
      
      public var _textBgColor:String;
      
      public var _textBgAlpha:Number;
      
      public var _statbar:Option;
      
      public var _stageColor:String;
      
      public var _parent:Theme;
      
      public var _navButtons:Object;
      
      public var _name:String;
      
      public var _medButtons:Array;
      
      public var _isDark:Boolean;
      
      public var _buttonBgs:Array;
      
      public var _button:int;
      
      public var _bitmaps:IMap;
      
      public var _barAlpha:Number;
      
      public function Theme(param1:String = undefined, param2:* = undefined, param3:Theme = undefined)
      {
         var _loc4_:* = null as IMap;
         var _loc5_:* = null;
         var _loc6_:int = 0;
         var _loc7_:* = null as Array;
         var _loc8_:* = null as String;
         var _loc9_:* = null;
         var _loc10_:* = null as Bitmap;
         var _loc11_:* = null as StringMap;
         var _loc12_:* = null as Array;
         if(Boot.skip_constructor)
         {
            return;
         }
         _button = 0;
         _textBgAlpha = Number(Math.NaN);
         _textBgColor = null;
         _isDark = false;
         _barAlpha = Number(Math.NaN);
         _bitmaps = new StringMap();
         _textColors = Option.None;
         _statbar = Option.None;
         _name = param1;
         _parent = param3;
         if(Reflect.hasField(param2,"statbar"))
         {
            _loc4_ = new StringMap();
            _loc5_ = Reflect.field(param2,"statbar");
            _loc6_ = 0;
            _loc7_ = Reflect.fields(_loc5_);
            while(_loc6_ < int(_loc7_.length))
            {
               _loc8_ = _loc7_[_loc6_];
               _loc6_++;
               _loc9_ = Reflect.field(_loc5_,_loc8_);
               if(_loc8_ in StringMap.reserved)
               {
                  _loc4_.setReserved(_loc8_,_loc9_);
               }
               else
               {
                  _loc4_.h[_loc8_] = _loc9_;
               }
            }
            _statbar = Option.Some(_loc4_);
         }
         _loc7_ = ["mainBg","sidebarBg","monsterBg","minimapBg","tooltipBg","textBgImage","textBgCombatImage","statbarBottomBg","arrowUp","arrowDown","CoCLogo","disclaimerBg","warningImage","mmBackground","mmBackgroundPlayer","mmTransition","mmUp","mmDown","mmUpDown","mmNPC","mmTrader","mmConnect","mmConnectH","mmLocked","mmLockedV","mmExit"];
         _loc6_ = 0;
         while(_loc6_ < int(_loc7_.length))
         {
            _loc8_ = _loc7_[_loc6_];
            _loc6_++;
            if(Reflect.hasField(param2,_loc8_))
            {
               _loc4_ = _bitmaps;
               _loc10_ = Reflect.field(param2,_loc8_);
               _loc11_ = _loc4_;
               if(_loc8_ in StringMap.reserved)
               {
                  _loc11_.setReserved(_loc8_,_loc10_);
               }
               else
               {
                  _loc11_.h[_loc8_] = _loc10_;
               }
            }
         }
         if(Reflect.hasField(param2,"stageColor"))
         {
            _stageColor = Reflect.field(param2,"stageColor");
         }
         if(Reflect.hasField(param2,"barAlpha"))
         {
            _barAlpha = Reflect.field(param2,"barAlpha");
         }
         if(Reflect.hasField(param2,"isDark"))
         {
            _isDark = Reflect.field(param2,"isDark");
         }
         if(Reflect.hasField(param2,"textBgColor"))
         {
            _textBgColor = Reflect.field(param2,"textBgColor");
         }
         if(Reflect.hasField(param2,"textBgAlpha"))
         {
            _textBgAlpha = Reflect.field(param2,"textBgAlpha");
         }
         if(Reflect.hasField(param2,"buttonBgs"))
         {
            _buttonBgs = Reflect.field(param2,"buttonBgs");
         }
         if(Reflect.hasField(param2,"medButtons"))
         {
            _medButtons = Reflect.field(param2,"medButtons");
         }
         if(Reflect.hasField(param2,"navButtons"))
         {
            _navButtons = Reflect.field(param2,"navButtons");
         }
         if(Reflect.hasField(param2,"textColors"))
         {
            _loc6_ = 0;
            _loc12_ = Reflect.fields(param2.textColors);
            while(_loc6_ < int(_loc12_.length))
            {
               _loc8_ = _loc12_[_loc6_];
               _loc6_++;
               _loc5_ = Reflect.field(param2.textColors,_loc8_);
               if(_loc5_ is String)
               {
                  setTextColor(_loc8_,Color.parseColorString(_loc5_));
               }
               else if(Std.isOfType(_loc5_,int))
               {
                  setTextColor(_loc8_,_loc5_);
               }
               else
               {
                  if(!Std.isOfType(_loc5_,Number))
                  {
                     throw Exception.thrown("Theme: unknown color format in " + param1 + ": " + _loc8_);
                  }
                  setTextColor(_loc8_,int(Number(_loc5_)));
               }
            }
         }
         _loc11_ = Theme._THEMES;
         if(param1 in StringMap.reserved)
         {
            _loc11_.setReserved(param1,this);
         }
         else
         {
            _loc11_.h[param1] = this;
         }
         if(!Boolean(Theme._THEME_NAMES.contains(param1)))
         {
            Theme._THEME_NAMES.push(param1);
         }
      }
      
      public static function getTheme(param1:String) : Theme
      {
         var _loc3_:* = null as StringMap;
         var _loc2_:StringMap = Theme._THEMES;
         if(param1 in StringMap.reserved ? _loc2_.existsReserved(param1) : param1 in _loc2_.h)
         {
            _loc3_ = Theme._THEMES;
            return param1 in StringMap.reserved ? _loc3_.getReserved(param1) : _loc3_.h[param1];
         }
         return null;
      }
      
      public static function themeList() : Array
      {
         return Theme._THEME_NAMES.copy();
      }
      
      public static function subscribe(param1:ThemeObserver) : void
      {
         if(!Boolean(Theme._subscribers.contains(param1)))
         {
            Theme._subscribers.push(param1);
         }
      }
      
      public static function unsubscribe(param1:ThemeObserver) : void
      {
         Theme._subscribers.remove(param1);
      }
      
      public static function set_current(param1:Theme) : Theme
      {
         var _loc6_:int = 0;
         Theme.current = param1;
         var _loc2_:int = 0;
         var _loc3_:int = int(Theme._subscribers.length);
         var _loc4_:int = _loc3_ - 1;
         var _loc5_:int = _loc2_;
         while(_loc4_ >= _loc5_)
         {
            _loc6_ = _loc4_--;
            Theme._subscribers[_loc6_].update("coc$themeupdated");
         }
         return param1;
      }
      
      public function textColorFor(param1:String) : uint
      {
         var _loc4_:* = null as IMap;
         var _loc5_:* = null as Theme;
         var _loc6_:* = null as Object;
         var _loc2_:Option = _textColors;
         var _loc3_:Theme = _parent;
         switch(_loc2_.index)
         {
            case 0:
               _loc4_ = _loc2_.params[0];
               if(param1 in StringMap.reserved ? Boolean(_loc4_.existsReserved(param1)) : param1 in _loc4_.h)
               {
                  return param1 in StringMap.reserved ? _loc4_.getReserved(param1) : _loc4_.h[param1];
               }
               if(Boolean(["sideBar","minimap","mainMenu"].contains(param1)))
               {
                  return textColorFor("default");
               }
               _loc5_ = _parent;
               _loc6_ = _loc5_ != null ? _loc5_.textColorFor(param1) : null;
               if(_loc6_ != null)
               {
                  return _loc6_;
               }
               return 0;
               break;
            case 1:
               if(_loc3_ == null)
               {
                  return 0;
               }
               return _parent.textColorFor(param1);
               break;
            default:
               return;
         }
      }
      
      public function setTextColor(param1:String, param2:uint) : uint
      {
         var _loc4_:* = null as IMap;
         var _loc3_:Option = _textColors;
         switch(_loc3_.index)
         {
            case 0:
               _loc4_ = _loc3_.params[0];
               if(param1 in StringMap.reserved)
               {
                  _loc4_.setReserved(param1,param2);
               }
               else
               {
                  _loc4_.h[param1] = param2;
               }
               break;
            case 1:
               _loc4_ = new StringMap();
               if(param1 in StringMap.reserved)
               {
                  _loc4_.setReserved(param1,param2);
               }
               else
               {
                  _loc4_.h[param1] = param2;
               }
               _textColors = Option.Some(_loc4_);
         }
         return param2;
      }
      
      public function nextButton() : int
      {
         _button = int((_button + 1) % int(get_buttonBgs().length));
         return _button;
      }
      
      public function medButtonBackground(param1:int = 0) : Bitmap
      {
         return get_medButtons()[int(param1 % int(get_medButtons().length))];
      }
      
      public function get_warningImage() : Bitmap
      {
         return getBitmap("warningImage");
      }
      
      public function get_tooltipTextColor() : uint
      {
         return textColorFor("tooltip");
      }
      
      public function get_tooltipBg() : Bitmap
      {
         return getBitmap("tooltipBg");
      }
      
      public function get_textColor() : uint
      {
         return textColorFor("default");
      }
      
      public function get_textBgImage() : Bitmap
      {
         return getBitmap("textBgImage");
      }
      
      public function get_textBgCombatImage() : Bitmap
      {
         return getBitmap("textBgCombatImage");
      }
      
      public function get_textBgColor() : String
      {
         if(_textBgColor != null)
         {
            return _textBgColor;
         }
         if(_parent != null)
         {
            return _parent.get_textBgColor();
         }
         return "#FFFFFF";
      }
      
      public function get_textBgAlpha() : Number
      {
         if(!Boolean(Math.isNaN(_textBgAlpha)))
         {
            return _textBgAlpha;
         }
         if(_parent != null)
         {
            return _parent.get_textBgAlpha();
         }
         return 0.4;
      }
      
      public function get_statbarBottomBg() : Bitmap
      {
         return getBitmap("statbarBottomBg");
      }
      
      public function get_statbar() : IMap
      {
         var _loc3_:* = null as IMap;
         var _loc1_:Option = _statbar;
         var _loc2_:Theme = _parent;
         switch(_loc1_.index)
         {
            case 0:
               return _loc1_.params[0];
            case 1:
               if(_loc2_ == null)
               {
                  return new StringMap();
               }
               return _parent.get_statbar();
               break;
            default:
               return;
         }
      }
      
      public function get_stageColor() : String
      {
         if(_stageColor != null)
         {
            return _stageColor;
         }
         if(_parent != null)
         {
            return _parent.get_stageColor();
         }
         return "";
      }
      
      public function get_sidebarBg() : Bitmap
      {
         return getBitmap("sidebarBg");
      }
      
      public function get_sideTextColor() : uint
      {
         return textColorFor("sideBar");
      }
      
      public function get_navButtons() : Object
      {
         var _loc2_:* = null;
         var _loc3_:* = null as Theme;
         var _loc1_:* = _navButtons;
         if(_loc1_ != null)
         {
            _loc2_ = _loc1_;
         }
         else
         {
            _loc3_ = _parent;
            _loc2_ = _loc3_ != null ? _loc3_.get_navButtons() : null;
         }
         if(_loc2_ != null)
         {
            return _loc2_;
         }
         return {
            "north":null,
            "south":null,
            "east":null,
            "west":null
         };
      }
      
      public function get_name() : String
      {
         return _name;
      }
      
      public function get_monsterBg() : Bitmap
      {
         return getBitmap("monsterBg");
      }
      
      public function get_mmUpDown() : Bitmap
      {
         return getBitmap("mmUpDown");
      }
      
      public function get_mmUp() : Bitmap
      {
         return getBitmap("mmUp");
      }
      
      public function get_mmTransition() : Bitmap
      {
         return getBitmap("mmTransition");
      }
      
      public function get_mmTrader() : Bitmap
      {
         return getBitmap("mmTrader");
      }
      
      public function get_mmNPC() : Bitmap
      {
         return getBitmap("mmNPC");
      }
      
      public function get_mmLockedV() : Bitmap
      {
         return getBitmap("mmLockedV");
      }
      
      public function get_mmLocked() : Bitmap
      {
         return getBitmap("mmLocked");
      }
      
      public function get_mmExit() : Bitmap
      {
         return getBitmap("mmExit");
      }
      
      public function get_mmDown() : Bitmap
      {
         return getBitmap("mmDown");
      }
      
      public function get_mmConnectH() : Bitmap
      {
         return getBitmap("mmConnectH");
      }
      
      public function get_mmConnect() : Bitmap
      {
         return getBitmap("mmConnect");
      }
      
      public function get_mmBackgroundPlayer() : Bitmap
      {
         return getBitmap("mmBackgroundPlayer");
      }
      
      public function get_mmBackground() : Bitmap
      {
         return getBitmap("mmBackground");
      }
      
      public function get_minimapTextColor() : uint
      {
         return textColorFor("minimap");
      }
      
      public function get_minimapBg() : Bitmap
      {
         return getBitmap("minimapBg");
      }
      
      public function get_menuTextColor() : uint
      {
         return textColorFor("mainMenu");
      }
      
      public function get_medButtons() : Array
      {
         if(_medButtons != null)
         {
            return _medButtons;
         }
         if(_parent != null)
         {
            return _parent.get_medButtons();
         }
         return [];
      }
      
      public function get_mainBg() : Bitmap
      {
         return getBitmap("mainBg");
      }
      
      public function get_isDark() : Boolean
      {
         if(_isDark || _parent != null)
         {
            return _parent.get_isDark();
         }
         return false;
      }
      
      public function get_disclaimerBg() : Bitmap
      {
         return getBitmap("disclaimerBg");
      }
      
      public function get_buttonTextColor() : uint
      {
         return textColorFor("button");
      }
      
      public function get_buttonBgs() : Array
      {
         if(_buttonBgs != null)
         {
            return _buttonBgs;
         }
         if(_parent != null)
         {
            return _parent.get_buttonBgs();
         }
         return [];
      }
      
      public function get_barAlpha() : Number
      {
         if(!Boolean(Math.isNaN(_barAlpha)))
         {
            return _barAlpha;
         }
         if(_parent != null)
         {
            return _parent.get_barAlpha();
         }
         return 0.4;
      }
      
      public function get_arrowUp() : Bitmap
      {
         return getBitmap("arrowUp");
      }
      
      public function get_arrowDown() : Bitmap
      {
         return getBitmap("arrowDown");
      }
      
      public function get_CoCLogo() : Bitmap
      {
         return getBitmap("CoCLogo");
      }
      
      public function getBitmap(param1:String) : Bitmap
      {
         var _loc3_:* = null as StringMap;
         var _loc2_:StringMap = _bitmaps;
         if(param1 in StringMap.reserved ? _loc2_.existsReserved(param1) : param1 in _loc2_.h)
         {
            _loc3_ = _bitmaps;
            if(param1 in StringMap.reserved)
            {
               return _loc3_.getReserved(param1);
            }
            return _loc3_.h[param1];
         }
         if(_parent != null)
         {
            return _parent.getBitmap(param1);
         }
         return null;
      }
      
      public function buttonReset() : void
      {
         _button = 0;
      }
      
      public function buttonBackground(param1:int = 0) : Bitmap
      {
         return get_buttonBgs()[int(param1 % int(get_buttonBgs().length))];
      }
   }
}

