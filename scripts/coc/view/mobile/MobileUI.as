package coc.view.mobile
{
   import classes.SettingsGlobalDisplay;
   import classes.display.BindDisplay;
   import classes.display.GameView;
   import classes.display.GameViewData;
   import classes.display.MapData;
   import classes.display.SettingData;
   import classes.display.SettingPane;
   import classes.display.SettingParams;
   import classes.globalFlags.KGAMECLASS;
   import coc.view.BitmapDataSprite;
   import coc.view.Block;
   import coc.view.ButtonData;
   import coc.view.CoCButton;
   import coc.view.CoCScrollPane;
   import coc.view.Color;
   import coc.view.FlowDirection;
   import coc.view.LayoutConfig;
   import coc.view.LayoutType;
   import coc.view.Theme;
   import coc.view.ThemeObserver;
   import coc.view.ToolTipView;
   import flash.Boot;
   import flash.display.Bitmap;
   import flash.display.DisplayObject;
   import flash.display.InteractiveObject;
   import flash.display.Sprite;
   import flash.events.Event;
   import flash.events.KeyboardEvent;
   import flash.events.MouseEvent;
   import flash.events.TimerEvent;
   import flash.geom.Point;
   import flash.geom.Rectangle;
   import flash.text.Font;
   import flash.text.TextField;
   import flash.text.TextFormat;
   import flash.utils.Timer;
   import openfl.utils.Assets;
   
   public class MobileUI extends Sprite implements ThemeObserver, GameView
   {
      
      public static var init__:Boolean;
      
      public static var defaultTextFormat:TextFormat;
      
      public static var PADDING:int = 15;
      
      public static var BUTTONS_WIDTH_PORTRAIT:int = 490;
      
      public static var BUTTONS_HEIGHT_PORTRAIT:int = 250;
      
      public static var BUTTONS_WIDTH_LANDSCAPE:int = 335;
      
      public static var BUTTONS_HEIGHT_LANDSCAPE:int = 385;
      
      public var softKeyboardTimer:Timer;
      
      public var _view:Sprite;
      
      public var _toolTipView:ToolTipView;
      
      public var _textBackground:BitmapDataSprite;
      
      public var _statsView:StatsView;
      
      public var _statUpdates:StatsView;
      
      public var _stash:StashView;
      
      public var _settings:SettingPane;
      
      public var _quickStats:QuickStatsView;
      
      public var _monViews:Array;
      
      public var _mainTextVBox:Block;
      
      public var _mainTextPane:CoCScrollPane;
      
      public var _mainText:TextField;
      
      public var _mainMenu:MainMenu;
      
      public var _mainFocus:DisplayObject;
      
      public var _leftDrawer:MenuButtonDrawer;
      
      public var _inputText:TextField;
      
      public var _drawers:Drawers;
      
      public var _buttonContainer:Block;
      
      public var _bottomButtons:Array;
      
      public var _background:BitmapDataSprite;
      
      public function MobileUI()
      {
         if(Boot.skip_constructor)
         {
            return;
         }
         softKeyboardTimer = new Timer(100,1);
         _monViews = [];
         _leftDrawer = new MenuButtonDrawer();
         _quickStats = new QuickStatsView();
         _bottomButtons = [];
         super();
         new MobileSettings();
         addEventListener(Event.ADDED_TO_STAGE,init);
      }
      
      public static function resizeGrid(param1:Block, param2:int, param3:int, param4:int, param5:int) : void
      {
         param1.get_layoutConfig().type = LayoutType.Grid(param2,param3);
         param1.unscaledResize(param4,param5);
         param1.doLayout();
      }
      
      public function updateSettingPane() : void
      {
         var _loc3_:* = null as SettingData;
         var _loc4_:* = null as Array;
         var _loc5_:int = 0;
         var _loc6_:* = null as Array;
         var _loc7_:* = null as ButtonData;
         var _loc8_:* = null as BindDisplay;
         var _loc9_:* = null as CoCButton;
         var _loc1_:int = 0;
         var _loc2_:Array = GameViewData.settingPaneData.settings;
         while(_loc1_ < int(_loc2_.length))
         {
            _loc3_ = _loc2_[_loc1_];
            _loc1_++;
            _loc4_ = [];
            _loc5_ = 0;
            _loc6_ = _loc3_.get_buttons();
            while(_loc5_ < int(_loc6_.length))
            {
               _loc7_ = _loc6_[_loc5_];
               _loc5_++;
               _loc4_.push(new SettingParams(_loc7_.text,_loc7_.callback,_loc3_.get_label(),_loc7_.text == _loc3_.currentValue,_loc3_.labelOverridden));
            }
            _loc8_ = _settings.addOrUpdateToggleSettings(_loc3_.name,_loc4_);
            _loc5_ = 0;
            _loc6_ = _loc8_.buttons;
            while(_loc5_ < int(_loc6_.length))
            {
               _loc9_ = _loc6_[_loc5_];
               _loc5_++;
               _loc9_.removeEventListener(MouseEvent.CLICK,_loc9_.click);
               _loc9_.removeEventListener(MouseEvent.CLICK,settingClick);
               _loc9_.addEventListener(MouseEvent.CLICK,settingClick);
            }
         }
         _settings.update();
      }
      
      public function update(param1:String) : void
      {
         _background.set_bitmap(Theme.current.get_mainBg());
         _textBackground.visible = _mainTextPane.visible;
         switch(KGAMECLASS.kGAMECLASS.get_displaySettings().textBackground)
         {
            case 0:
               _textBackground.alpha = Theme.current.get_textBgAlpha();
               _textBackground.set_fillColor(Color.parseColorString(Theme.current.get_textBgColor()));
               _textBackground.set_bitmap(Theme.current.get_textBgImage());
               break;
            case 1:
               _textBackground.alpha = 1;
               _textBackground.set_fillColor(16777215);
               _textBackground.set_bitmap(null);
               break;
            case 2:
               _textBackground.alpha = 1;
               _textBackground.set_fillColor(15455654);
               _textBackground.set_bitmap(null);
               break;
            case 3:
               _textBackground.alpha = 0.4;
               _textBackground.set_fillColor(16777215);
               _textBackground.set_bitmap(null);
               break;
            default:
               _textBackground.alpha = 0;
         }
      }
      
      public function smoothMove(param1:Event) : void
      {
         var _loc2_:Number = AIRWrapper.getKeyboardY();
         var _loc3_:Point = _view.globalToLocal(new Point(0,_loc2_));
         _inputText.y = _loc3_.y - _inputText.height;
      }
      
      public function showToolTip(param1:DisplayObject, param2:String, param3:String) : void
      {
         var _loc4_:* = null as Rectangle;
         var _loc5_:Number = NaN;
         if(param3 == null || param3 == "" || !param1.visible)
         {
            _toolTipView.hide();
            return;
         }
         _toolTipView.set_header(param2);
         _toolTipView.set_text(KGAMECLASS.kGAMECLASS.secondaryParser.parse(param3));
         var _loc6_:String = ScreenScaling.get_orientation();
         if(_loc6_ == "default" || _loc6_ == "upsideDown")
         {
            _loc5_ = ScreenScaling.safeBounds().width / MobileUI.BUTTONS_WIDTH_PORTRAIT;
            _loc4_ = new Rectangle(0,0,MobileUI.BUTTONS_WIDTH_PORTRAIT,MobileUI.BUTTONS_HEIGHT_PORTRAIT * _loc5_);
         }
         else
         {
            _loc5_ = ScreenScaling.safeBounds().height / MobileUI.BUTTONS_WIDTH_PORTRAIT;
            _loc4_ = new Rectangle(0,0,MobileUI.BUTTONS_WIDTH_PORTRAIT * _loc5_,MobileUI.BUTTONS_WIDTH_PORTRAIT);
         }
         _toolTipView.showInBounds(_loc4_,param1);
      }
      
      public function showMonsterTooltip(param1:MouseEvent) : void
      {
         var _loc2_:Object = param1.currentTarget;
         var _loc3_:MonsterStatView = _loc2_ as MonsterStatView;
         if(_loc3_ != null)
         {
            showToolTip(_loc3_,_loc3_.get_toolTipHeader(),_loc3_.get_toolTipText());
         }
      }
      
      public function showButtonTooltip(param1:MouseEvent) : void
      {
         var _loc2_:Object = param1.currentTarget;
         var _loc3_:CoCButton = _loc2_ as CoCButton;
         if(_loc3_ != null)
         {
            showToolTip(_loc3_,_loc3_.toolTipHeader,_loc3_.toolTipText);
         }
      }
      
      public function settingClick(param1:MouseEvent) : void
      {
         var _loc2_:DisplayObject = param1.target;
         var _loc3_:CoCButton = null;
         while(_loc2_ != null)
         {
            if(_loc2_ is CoCButton)
            {
               _loc3_ = _loc2_ as CoCButton;
               break;
            }
            _loc2_ = _loc2_.parent;
         }
         if(_loc3_ == null)
         {
            return;
         }
         _loc3_.click();
         updateSettingPane();
      }
      
      public function resetTextFormat() : void
      {
         MobileUI.defaultTextFormat.font = Assets.getFont("res/fonts/NotoSerif-Regular.ttf").fontName;
         MobileUI.defaultTextFormat.bold = false;
         MobileUI.defaultTextFormat.italic = false;
         MobileUI.defaultTextFormat.underline = false;
         MobileUI.defaultTextFormat.bullet = false;
         MobileUI.defaultTextFormat.size = KGAMECLASS.kGAMECLASS.get_displaySettings().fontSize;
         MobileUI.defaultTextFormat.color = Theme.current.get_textColor();
         _mainText.defaultTextFormat = MobileUI.defaultTextFormat;
      }
      
      public function redraw(param1:Event) : void
      {
         var _loc2_:Number = NaN;
         var _loc3_:Number = NaN;
         var _loc5_:Number = NaN;
         var _loc11_:* = null as MonsterStatView;
         var _loc12_:* = null as Rectangle;
         if(!visible)
         {
            return;
         }
         var _loc4_:Rectangle = ScreenScaling.safeBounds();
         var _loc6_:String = ScreenScaling.get_orientation();
         var _loc7_:String = _loc6_;
         if(_loc7_ == "rotatedLeft")
         {
            _loc5_ = _loc4_.width / _loc4_.height;
            MobileUI.resizeGrid(_buttonContainer,8,2,MobileUI.BUTTONS_WIDTH_LANDSCAPE,MobileUI.BUTTONS_HEIGHT_LANDSCAPE);
            _buttonContainer.y = 0;
            _buttonContainer.x = 0;
            MobileUI.resizeGrid(_quickStats,2,2,int(_buttonContainer.get_innerWidth()),60);
            _quickStats.x = _buttonContainer.x + 15;
            _quickStats.y = _buttonContainer.y + _buttonContainer.get_height() + 15;
            _mainTextPane.set_x(_buttonContainer.get_width());
            _mainTextPane.set_y(15);
            _mainTextPane.set_width(MobileUI.BUTTONS_WIDTH_PORTRAIT * _loc5_ - _buttonContainer.get_width() - 40);
            _mainTextPane.set_height(MobileUI.BUTTONS_WIDTH_PORTRAIT - 30);
         }
         else if(_loc7_ == "rotatedRight")
         {
            _loc5_ = _loc4_.width / _loc4_.height;
            MobileUI.resizeGrid(_buttonContainer,8,2,MobileUI.BUTTONS_WIDTH_LANDSCAPE,MobileUI.BUTTONS_HEIGHT_LANDSCAPE);
            _buttonContainer.y = 0;
            _buttonContainer.x = MobileUI.BUTTONS_WIDTH_PORTRAIT * _loc5_ - _buttonContainer.get_width();
            MobileUI.resizeGrid(_quickStats,2,2,int(_buttonContainer.get_innerWidth()),60);
            _quickStats.x = _buttonContainer.x + 15;
            _quickStats.y = _buttonContainer.y + _buttonContainer.get_height() + 15;
            _mainTextPane.set_x(40);
            _mainTextPane.set_y(15);
            _mainTextPane.set_width(_buttonContainer.x - _mainTextPane.x);
            _mainTextPane.set_height(MobileUI.BUTTONS_WIDTH_PORTRAIT - 30);
         }
         else
         {
            while(true)
            {
               if(_loc7_ != "default")
               {
                  if(_loc7_ != "upsideDown")
                  {
                     break;
                  }
               }
               _loc5_ = _loc4_.height / _loc4_.width;
               MobileUI.resizeGrid(_buttonContainer,5,3,MobileUI.BUTTONS_WIDTH_PORTRAIT,MobileUI.BUTTONS_HEIGHT_PORTRAIT);
               _buttonContainer.y = _buttonContainer.get_width() * _loc5_ - _buttonContainer.get_height();
               _buttonContainer.x = 0;
               MobileUI.resizeGrid(_quickStats,1,3,int(_buttonContainer.get_innerWidth()),30);
               _quickStats.x = 15;
               _quickStats.y = 15;
               if(_quickStats.visible)
               {
                  _mainTextPane.set_y(_quickStats.y + _quickStats.get_height() + 15);
               }
               else
               {
                  _mainTextPane.set_y(15);
               }
               _mainTextPane.set_x(15);
               _mainTextPane.set_height(_buttonContainer.y - _mainTextPane.y);
               _mainTextPane.set_width(MobileUI.BUTTONS_WIDTH_PORTRAIT - 30);
               break;
            }
         }
         var _loc8_:int = int(_mainTextPane.get_width() - 15);
         _textBackground.setSize(_mainTextPane.get_width(),_mainTextPane.get_height());
         _textBackground.x = _mainTextPane.x;
         _textBackground.y = _mainTextPane.y;
         _mainText.width = _loc8_;
         var _loc9_:int = 0;
         var _loc10_:Array = _monViews;
         while(_loc9_ < int(_loc10_.length))
         {
            _loc11_ = _loc10_[_loc9_];
            _loc9_++;
            _loc11_.flush();
            _loc11_.setSize(_loc8_,0);
         }
         _statUpdates.x = 0;
         _statUpdates.y = 0;
         _statUpdates.set_height(0);
         _statUpdates.set_width(_loc8_);
         _statUpdates.doLayout();
         _mainTextVBox.set_height(0);
         _mainTextVBox.set_width(_loc8_);
         _mainTextVBox.scaleX = 1;
         _mainTextVBox.doLayout();
         _mainTextPane.content.width = _loc8_;
         _mainTextPane.update();
         _mainTextPane.draw();
         _quickStats.doLayout();
         _statsView.doLayout();
         if(_bottomButtons[4].isNavButton())
         {
            fixDungeonNav();
         }
         _buttonContainer.doLayout();
         _background.scaleX = 1;
         _background.scaleY = 1;
         if(_loc6_ == "default" || _loc6_ == "upsideDown")
         {
            _loc3_ = _loc4_.width / MobileUI.BUTTONS_WIDTH_PORTRAIT;
            _loc2_ = ScreenScaling.get_fullScreenHeight() / _background.height;
         }
         else
         {
            _loc3_ = _loc4_.height / MobileUI.BUTTONS_WIDTH_PORTRAIT;
            _loc2_ = ScreenScaling.get_fullScreenWidth() / _background.width;
         }
         _background.scaleY = _loc2_;
         _background.scaleX = _loc2_;
         if(_inputText != null)
         {
            _inputText.width = _mainTextPane.get_width() - 15;
            _inputText.height = 40;
            _inputText.x = _mainTextPane.x;
            if(stage.softKeyboardRect.height > 0)
            {
               smoothMove(param1);
            }
            else
            {
               _inputText.y = _mainTextPane.y + _mainTextPane.get_height() - _inputText.height;
            }
         }
         if(_mainFocus != null)
         {
            _mainFocus.x = _mainTextPane.x;
            _mainFocus.y = _mainTextPane.y;
            _mainFocus.width = _mainTextPane.get_width();
            _mainFocus.height = _mainTextPane.get_height();
            if(param1 != null)
            {
               flush();
            }
         }
         if(_loc6_ == "default" || _loc6_ == "upsideDown")
         {
            _loc5_ = _loc4_.height / _loc4_.width;
            _loc12_ = new Rectangle(0,0,MobileUI.BUTTONS_WIDTH_PORTRAIT,MobileUI.BUTTONS_WIDTH_PORTRAIT * _loc5_);
         }
         else
         {
            _loc5_ = _loc4_.width / _loc4_.height;
            _loc12_ = new Rectangle(0,0,MobileUI.BUTTONS_WIDTH_PORTRAIT * _loc5_,MobileUI.BUTTONS_WIDTH_PORTRAIT);
         }
         if(_mainMenu != null)
         {
            _mainMenu.setSize(_loc12_.width,_loc12_.height);
         }
         _drawers.setSize(_loc12_.width,_loc12_.height);
         _drawers.scaleX = _drawers.scaleY = _loc3_;
         _drawers.set_x(_loc4_.x);
         _drawers.set_y(_loc4_.y);
      }
      
      public function init(param1:Event) : void
      {
         MobileSettings.set_mobileUI(this);
         removeEventListener(Event.ADDED_TO_STAGE,init);
         Theme.subscribe(this);
         GameViewData.subscribe(this);
         ScreenScaling.init(stage);
         _drawers = new Drawers();
         _drawers.setSize(ScreenScaling.get_screenWidth(),ScreenScaling.get_screenHeight());
         _buttonContainer = new Block(new LayoutConfig(LayoutType.Grid(5,3),null,15,null,null,null,null,5));
         _buttonContainer.set_width(490);
         _buttonContainer.set_height(250);
         _bottomButtons = addButtons(_buttonContainer,15);
         _mainText = new TextField();
         _mainText.multiline = true;
         _mainText.wordWrap = true;
         _mainText.antiAliasType = "advanced";
         _mainText.embedFonts = true;
         _mainText.width = _buttonContainer.get_innerWidth() - 4;
         _mainText.autoSize = "left";
         _background = new BitmapDataSprite(null,null,false,0,0,0,0,true,"",0,true,1,true);
         _textBackground = new BitmapDataSprite(null,null,true,0,0,0,0,true,"",16777215,false,1,true);
         addChild(_background);
         addChild(_drawers);
         _view = new Sprite();
         _view.addChild(_textBackground);
         _mainTextPane = new CoCScrollPane();
         _mainTextPane.set_autoHideScrollBar(true);
         _view.addChild(_quickStats);
         _view.addChild(_mainTextPane);
         _mainTextVBox = new Block(new LayoutConfig(LayoutType.Flow(FlowDirection.Column),true,null,null,null,null,null,null));
         var _loc2_:MonsterStatView = new MonsterStatView(0);
         _loc2_.addEventListener(MouseEvent.MOUSE_DOWN,showMonsterTooltip);
         _loc2_.addEventListener(MouseEvent.MOUSE_OVER,showMonsterTooltip);
         _loc2_.addEventListener(MouseEvent.MOUSE_OUT,hideTooltip);
         _loc2_.addEventListener(MouseEvent.MOUSE_UP,hideTooltip);
         _mainTextVBox.addElement(_loc2_);
         _monViews.push(_loc2_);
         _loc2_ = new MonsterStatView(1);
         _loc2_.addEventListener(MouseEvent.MOUSE_DOWN,showMonsterTooltip);
         _loc2_.addEventListener(MouseEvent.MOUSE_OVER,showMonsterTooltip);
         _loc2_.addEventListener(MouseEvent.MOUSE_OUT,hideTooltip);
         _loc2_.addEventListener(MouseEvent.MOUSE_UP,hideTooltip);
         _mainTextVBox.addElement(_loc2_);
         _monViews.push(_loc2_);
         _loc2_ = new MonsterStatView(2);
         _loc2_.addEventListener(MouseEvent.MOUSE_DOWN,showMonsterTooltip);
         _loc2_.addEventListener(MouseEvent.MOUSE_OVER,showMonsterTooltip);
         _loc2_.addEventListener(MouseEvent.MOUSE_OUT,hideTooltip);
         _loc2_.addEventListener(MouseEvent.MOUSE_UP,hideTooltip);
         _mainTextVBox.addElement(_loc2_);
         _monViews.push(_loc2_);
         _loc2_ = new MonsterStatView(3);
         _loc2_.addEventListener(MouseEvent.MOUSE_DOWN,showMonsterTooltip);
         _loc2_.addEventListener(MouseEvent.MOUSE_OVER,showMonsterTooltip);
         _loc2_.addEventListener(MouseEvent.MOUSE_OUT,hideTooltip);
         _loc2_.addEventListener(MouseEvent.MOUSE_UP,hideTooltip);
         _mainTextVBox.addElement(_loc2_);
         _monViews.push(_loc2_);
         _mainTextVBox.addElement(_mainText);
         _statUpdates = new StatsView(true);
         _mainTextVBox.addElement(_statUpdates);
         _mainTextPane.addChild(_mainTextVBox);
         _view.addChild(_buttonContainer);
         _toolTipView = new ToolTipView(_view);
         _toolTipView.hide();
         _view.addChild(_toolTipView);
         _drawers.addElement(_view,"CONTENT");
         _drawers.addElement(_leftDrawer,"LEFT");
         _statsView = new StatsView();
         _drawers.addElement(_statsView,"RIGHT");
         _mainMenu = new MainMenu();
         _mainMenu.visible = false;
         _view.addChild(_mainMenu);
         _stash = new StashView(hookButton);
         clear();
         stage.addEventListener(Event.RESIZE,redraw);
         update(null);
         redraw(null);
      }
      
      public function hookButton(param1:CoCButton) : void
      {
         param1.addEventListener(MouseEvent.MOUSE_OVER,showButtonTooltip);
         param1.addEventListener(MouseEvent.MOUSE_DOWN,showButtonTooltip);
         param1.addEventListener(MouseEvent.MOUSE_OUT,hideTooltip);
         param1.addEventListener(MouseEvent.MOUSE_UP,hideTooltip);
      }
      
      public function hideTooltip(param1:MouseEvent) : void
      {
         _toolTipView.hide();
      }
      
      public function handleSoftKeyboard(param1:Event) : void
      {
         softKeyboardTimer.removeEventListener(TimerEvent.TIMER_COMPLETE,redraw);
         softKeyboardTimer.reset();
         softKeyboardTimer.addEventListener(TimerEvent.TIMER_COMPLETE,checkHeight);
         softKeyboardTimer.start();
         addEventListener(Event.ENTER_FRAME,smoothMove);
         _inputText.addEventListener(KeyboardEvent.KEY_DOWN,handleKeys);
      }
      
      public function handleOrientationChange() : void
      {
         redraw(null);
         if(_mainFocus != null)
         {
            flush();
         }
      }
      
      public function handleKeys(param1:KeyboardEvent) : void
      {
         if(param1.keyCode == 13)
         {
            stage.focus = null;
            _inputText.removeEventListener(KeyboardEvent.KEY_DOWN,handleKeys);
            _inputText.y = _mainTextPane.y + _mainTextPane.get_height() - _inputText.height;
         }
      }
      
      public function handleInput(param1:Event) : void
      {
         GameViewData.inputText = _inputText.text;
         KGAMECLASS.kGAMECLASS.mainView.nameBox.text = _inputText.text;
      }
      
      public function flush() : void
      {
         var _loc2_:* = null as Array;
         var _loc3_:* = null as Array;
         var _loc4_:* = null as ButtonData;
         var _loc5_:* = null as ButtonData;
         var _loc6_:* = null as ButtonData;
         var _loc7_:Number = NaN;
         var _loc8_:int = 0;
         var _loc9_:* = null as CoCButton;
         var _loc10_:* = null as MapData;
         var _loc11_:int = 0;
         var _loc12_:* = null as String;
         var _loc13_:* = null as String;
         var _loc1_:String = GameViewData.htmlText;
         _mainText.htmlText = _loc1_ != null ? _loc1_ : "";
         _quickStats.refreshStats();
         _statsView.refreshStats();
         _statUpdates.refreshStats();
         if(_mainFocus != null)
         {
            _view.removeChild(_mainFocus);
            _mainFocus = null;
         }
         _textBackground.visible = true;
         _mainMenu.visible = false;
         _drawers.closeDrawers();
         _leftDrawer.flush();
         switch(GameViewData.screenType.index)
         {
            case 0:
               _mainTextPane.visible = true;
               if(_mainFocus != null)
               {
                  _view.removeChild(_mainFocus);
               }
               applyButtons(GameViewData.bottomButtons);
               if(_bottomButtons[6].isNavButton())
               {
                  _loc2_ = GameViewData.bottomButtons;
                  _loc3_ = [_loc2_[0],_loc2_[1],_loc2_[2],_loc2_[5],_loc2_[6],_loc2_[7],_loc2_[10],_loc2_[11],_loc2_[12],_loc2_[3],_loc2_[4],_loc2_[8],_loc2_[9],_loc2_[13],_loc2_[14]];
                  applyButtons(_loc3_);
                  _bottomButtons[4].position = 6;
                  _bottomButtons[6].position = 10;
                  _bottomButtons[7].position = 11;
                  _bottomButtons[8].position = 12;
               }
               if(_bottomButtons[4].get_labelText() == "Prev Page")
               {
                  _loc2_ = GameViewData.bottomButtons.slice(0);
                  _loc4_ = _loc2_.splice(14,1)[0];
                  _loc5_ = _loc2_.splice(9,1)[0];
                  _loc6_ = _loc2_.splice(4,1)[0];
                  _loc2_ = _loc2_.concat([_loc6_,_loc5_,_loc4_]);
                  applyButtons(_loc2_);
               }
               break;
            case 1:
               _mainTextPane.visible = false;
               _loc7_ = ScreenScaling.get_screenHeight() / ScreenScaling.get_screenWidth();
               _textBackground.visible = false;
               _mainMenu.show(GameViewData.menuData,MobileUI.BUTTONS_WIDTH_PORTRAIT,_loc7_ * MobileUI.BUTTONS_WIDTH_PORTRAIT);
               break;
            case 2:
               _mainTextPane.visible = false;
               _settings = new SettingPane(int(_mainTextPane.x),int(_mainTextPane.y),int(_mainTextPane.get_width()),int(_mainTextPane.get_height()),150);
               _settings.mobile = true;
               _settings.name = GameViewData.settingPaneData.name;
               _settings.addHelpLabel().htmlText = "<b><u>" + GameViewData.settingPaneData.title + "</u></b>\n" + GameViewData.settingPaneData.description;
               updateSettingPane();
               _mainFocus = _settings;
               _settings.set_dragContent(true);
               _view.addChild(_mainFocus);
               _settings.draw();
               applyButtons(GameViewData.bottomButtons);
               _loc8_ = 0;
               _loc2_ = _bottomButtons;
               while(_loc8_ < int(_loc2_.length))
               {
                  _loc9_ = _loc2_[_loc8_];
                  _loc8_++;
                  if(_loc9_.get_labelText() == "Controls")
                  {
                     _loc9_.visible = false;
                  }
               }
               break;
            case 3:
               _mainTextPane.visible = false;
               _mainFocus = _stash;
               _view.addChild(_mainFocus);
               _stash.draw();
               applyButtons(GameViewData.bottomButtons);
               break;
            case 4:
               _loc10_ = GameViewData.mapData;
               switch(_loc10_.index)
               {
                  case 0:
                     _loc8_ = int(_loc10_.params[0]);
                     _loc2_ = _loc10_.params[1];
                     _loc3_ = _loc10_.params[2];
                     _loc11_ = int(_loc10_.params[3]);
                     _mainTextPane.visible = false;
                     _mainFocus = KGAMECLASS.kGAMECLASS.mainView.dungeonMap;
                     _view.addChild(_mainFocus);
                     break;
                  case 1:
                     _loc12_ = _loc10_.params[0];
                     _loc13_ = _loc10_.params[1];
                     _mainText.htmlText = _loc12_ + _loc13_;
               }
               applyButtons(GameViewData.bottomButtons);
         }
         if(GameViewData.inputNeeded)
         {
            if(_inputText == null)
            {
               _inputText = new TextField();
               _view.addChild(_inputText);
            }
            _inputText.defaultTextFormat = _mainText.defaultTextFormat;
            _inputText.backgroundColor = 15790320;
            _inputText.borderColor = 0;
            _inputText.background = true;
            _inputText.border = true;
            _inputText.type = "input";
            _inputText.selectable = true;
            _inputText.needsSoftKeyboard = true;
            _inputText.addEventListener(Event.CHANGE,handleInput);
         }
         else if(_inputText != null)
         {
            _view.removeChild(_inputText);
            _inputText = null;
         }
         _view.addChild(_toolTipView);
         redraw(null);
      }
      
      public function fixDungeonNav() : void
      {
         var _loc1_:Array = GameViewData.bottomButtons.slice(11,13);
         var _loc2_:String = ScreenScaling.get_orientation();
         if(_loc2_ == "rotatedRight" || _loc2_ == "rotatedLeft")
         {
            _loc1_.reverse();
         }
         _loc1_[0].applyTo(_bottomButtons[7]);
         _loc1_[1].applyTo(_bottomButtons[8]);
      }
      
      public function dispose() : void
      {
         Theme.unsubscribe(this);
         GameViewData.unsubscribe(this);
         stage.removeEventListener(Event.RESIZE,redraw);
         AIRWrapper.removeOrientationEventListener(stage);
         parent.removeChild(this);
      }
      
      public function clear() : void
      {
         var _loc3_:* = null as CoCButton;
         _mainText.text = "";
         _mainTextPane.resetScroll();
         resetTextFormat();
         var _loc1_:int = 0;
         var _loc2_:Array = _bottomButtons;
         while(_loc1_ < int(_loc2_.length))
         {
            _loc3_ = _loc2_[_loc1_];
            _loc1_++;
            _loc3_.hide();
         }
      }
      
      public function checkHeight(param1:Event) : void
      {
         softKeyboardTimer.removeEventListener(TimerEvent.TIMER_COMPLETE,checkHeight);
         smoothMove(param1);
         removeEventListener(Event.ENTER_FRAME,smoothMove);
      }
      
      public function btnFun(param1:String) : void
      {
         _mainText.text = param1;
      }
      
      public function applyButtons(param1:Array) : void
      {
         var _loc4_:int = 0;
         var _loc2_:int = 0;
         var _loc3_:int = int(param1.length);
         while(_loc2_ < _loc3_)
         {
            _loc4_ = _loc2_++;
            param1[_loc4_].applyTo(_bottomButtons[_loc4_]);
         }
      }
      
      public function addButtons(param1:Block, param2:int) : Array
      {
         var _loc6_:int = 0;
         var _loc7_:* = null as CoCButton;
         var _loc3_:Array = [];
         var _loc4_:int = 0;
         var _loc5_:int = param2;
         while(_loc4_ < _loc5_)
         {
            _loc6_ = _loc4_++;
            _loc7_ = new CoCButton();
            _loc7_.position = _loc6_;
            _loc7_.show("Button " + _loc6_,(function(param1:Array, param2:Array):Function
            {
               var _g:Array = param1;
               var text:Array = param2;
               return function():void
               {
                  _g[0].btnFun(text[0]);
               };
            })([this],["Button " + _loc6_ + " was clicked!"]));
            hookButton(_loc7_);
            param1.addElement(_loc7_);
            _loc3_.push(_loc7_);
         }
         param1.doLayout();
         return _loc3_;
      }
   }
}

