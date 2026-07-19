package coc.view
{
   import classes.SettingsGlobalDisplay;
   import classes.globalFlags.KGAMECLASS;
   import com.bit101.components.TextFieldVScroll;
   import flash.Boot;
   import flash.display.Bitmap;
   import flash.display.DisplayObject;
   import flash.display.Sprite;
   import flash.events.Event;
   import flash.events.KeyboardEvent;
   import flash.events.MouseEvent;
   import flash.events.TimerEvent;
   import flash.text.Font;
   import flash.text.TextField;
   import flash.text.TextFormat;
   import openfl.utils.Assets;
   
   public class MainView extends Block implements ThemeObserver
   {
      
      public static var init__:Boolean;
      
      public static var buttonBackgrounds:Array;
      
      public static var navButtons:Object;
      
      public static var mediumButtons:Array;
      
      public static var BOTTOM_HGAP:Number;
      
      public static var BOTTOM_Y:Number;
      
      public static var MONSTER_H:Number;
      
      public static var MENU_NEW_MAIN:String = "newGame";
      
      public static var MENU_DATA:String = "data";
      
      public static var MENU_STATS:String = "stats";
      
      public static var MENU_LEVEL:String = "level";
      
      public static var MENU_PERKS:String = "perks";
      
      public static var MENU_APPEARANCE:String = "appearance";
      
      public static var GAP:Number = 4;
      
      public static var BTN_W:Number = 150;
      
      public static var BTN_H:Number = 40;
      
      public static var BTN_MW:Number = 98.66666666666667;
      
      public static var SCREEN_W:Number = 1000;
      
      public static var SCREEN_H:Number = 800;
      
      public static var TOPROW_Y:Number = 0;
      
      public static var TOPROW_H:Number = 50;
      
      public static var TOPROW_NUMBTNS:Number = 6;
      
      public static var STATBAR_W:Number = 205;
      
      public static var STATBAR_Y:Number = 52;
      
      public static var STATBAR_H:Number = 602;
      
      public static var TEXTZONE_X:Number = 208;
      
      public static var TEXTZONE_Y:Number = 52;
      
      public static var TEXTZONE_W:Number = 770;
      
      public static var VSCROLLBAR_W:Number = 15;
      
      public static var TEXTZONE_H:Number = 602;
      
      public static var DUNGEONMAP_X:Number = 218;
      
      public static var DUNGEONMAP_Y:Number = 77;
      
      public static var SPRITE_W:Number = 80;
      
      public static var SPRITE_H:Number = 80;
      
      public static var SPRITE_X:Number = 4;
      
      public static var SPRITE_Y:Number = 716;
      
      public static var TOPROW_W:Number = 983;
      
      public static var BOTTOM_X:Number = 209;
      
      public static var BOTTOM_COLS:Number = 5;
      
      public static var BOTTOM_ROWS:Number = 3;
      
      public static var BOTTOM_BUTTON_COUNT:int = 15;
      
      public static var BOTTOM_H:Number = 132;
      
      public static var BOTTOM_W:Number = 770;
      
      public static var MONSTER_X:Number = 982;
      
      public static var MONSTER_Y:Number = 52;
      
      public static var MONSTER_W:Number = 160;
      
      public var topRow:Block;
      
      public var toolTipView:ToolTipView;
      
      public var textBG:BitmapDataSprite;
      
      public var testInputShown:Boolean;
      
      public var statsView:StatsView;
      
      public var statsButton:CoCButton;
      
      public var sprite:BitmapDataSprite;
      
      public var sideBarDecoration:Sprite;
      
      public var scrollBar:TextFieldVScroll;
      
      public var perksButton:CoCButton;
      
      public var newGameButton:CoCButton;
      
      public var nameBox:TextField;
      
      public var monsterStatsView:MonsterStatsView;
      
      public var minimapView:MinimapView;
      
      public var mainTextCoords:Object;
      
      public var mainText:TextField;
      
      public var levelButton:CoCButton;
      
      public var image:BitmapDataSprite;
      
      public var eventTestInput:TextField;
      
      public var dungeonMap:Block;
      
      public var dataButton:CoCButton;
      
      public var currentActiveButtons:Array;
      
      public var bottomButtons:Array;
      
      public var blackBackground:BitmapDataSprite;
      
      public var background:BitmapDataSprite;
      
      public var appearanceButton:CoCButton;
      
      public var allButtons:Array;
      
      public var _onBottomButtonClick:Function;
      
      public var _mainFocus:DisplayObject;
      
      public var MONSTER_OFFSET:Number;
      
      public function MainView()
      {
         if(Boot.skip_constructor)
         {
            return;
         }
         mainTextCoords = {
            "x":0,
            "y":0
         };
         testInputShown = false;
         MONSTER_OFFSET = 0;
         super();
         addElement(blackBackground = new BitmapDataSprite(null,ButtonBackground2,false,-1000,-800,800,1000,false,"",0,false,1,true),new LayoutHint(null,null,null,null,null,null,null));
         addElement(background = new BitmapDataSprite(null,Background1,false,0,0,800,1000,false,"",0,true,1,true));
         addElement(topRow = new Block(new LayoutConfig(LayoutType.Grid(1,6),null,4,null,null,null,null,null),0,0,MainView.TOPROW_W,50,""));
         topRow.addElement(newGameButton = new CoCButton("新游戏",null,"开始新游戏。","新游戏",1,false,true,true,0,0,0));
         topRow.addElement(dataButton = new CoCButton("数据",null,"保存或加载你的文件。","数据",2,false,true,true,0,0,0));
         topRow.addElement(statsButton = new CoCButton("属性",null,"查看你的属性。","属性",3,false,true,true,0,0,0));
         topRow.addElement(levelButton = new CoCButton("升级",null,"","",4,false,true,true,0,0,0));
         topRow.addElement(perksButton = new CoCButton("特质",null,"查看你的特质。","特质",5,false,true,true,0,0,0));
         topRow.addElement(appearanceButton = new CoCButton("外貌",null,"查看你的详细外貌信息。","外貌",6,false,true,true,0,0,0));
         addElement(textBG = new BitmapDataSprite(null,null,true,208,52,602,770,false,"",16777215,false,0.4,true));
         addElement(dungeonMap = new Block(null,MainView.DUNGEONMAP_X,MainView.DUNGEONMAP_Y,100,100,""));
         mainText = addTextField(new TextFieldParameters(null,null,null,null,755,602,208,52,new DefaultTextFormatParameters("Alibaba PuHuiTi 3 95 ExtraBold",20,null,false,false,false,null,null,null,null,null,null,null),null,true,true,true,null,null,null,null));
         scrollBar = new TextFieldVScroll(mainText);
         scrollBar.name = "scrollBar";
         scrollBar.set_x(mainText.x + mainText.width);
         scrollBar.set_y(mainText.y);
         scrollBar.set_height(mainText.height);
         scrollBar.set_width(15);
         addElement(scrollBar);
         initNameBox();
         eventTestInput = addTextField(new TextFieldParameters("",null,"input",null,751,598,208,52,new DefaultTextFormatParameters("Alibaba PuHuiTi 3 95 ExtraBold",20,null,false,false,false,null,null,null,null,null,null,null),null,true,true,null,true,16777215,true,false));
         addElement(sprite = new BitmapDataSprite(null,null,true,MainView.SPRITE_X,MainView.SPRITE_Y,0,0,false,"",0,false,1,true));
         statsView = new StatsView(this);
         minimapView = new MinimapView(this);
         statsView.y = MainView.STATBAR_Y;
         statsView.hide();
         addElement(statsView);
         addElement(minimapView);
         dungeonMap.visible = false;
         addElement(image = new BitmapDataSprite(null,null,false,0,0,0,0,false,"",0,false,1,true));
         formatMiscItems();
         allButtons = [];
         createBottomButtons();
         monsterStatsView = new MonsterStatsView(this);
         monsterStatsView.hide();
         addElement(monsterStatsView);
         var _loc4_:CoCButton = newGameButton;
         var _loc3_:CoCButton = _loc4_;
         allButtons.push(_loc3_);
         _loc4_ = dataButton;
         _loc3_ = _loc4_;
         allButtons.push(_loc3_);
         _loc4_ = statsButton;
         _loc3_ = _loc4_;
         allButtons.push(_loc3_);
         _loc4_ = levelButton;
         _loc3_ = _loc4_;
         allButtons.push(_loc3_);
         _loc4_ = perksButton;
         _loc3_ = _loc4_;
         allButtons.push(_loc3_);
         _loc4_ = appearanceButton;
         _loc3_ = _loc4_;
         allButtons.push(_loc3_);
         toolTipView = new ToolTipView(this);
         toolTipView.hide();
         addElement(toolTipView);
         hookBottomButtons();
         hookAllButtons();
         hookAllMonsters();
         set_width(1000);
         set_height(800);
         scaleX = 1;
         scaleY = 1;
         Theme.subscribe(this);
      }
      
      public function updateCombatView() : void
      {
         if(monsterStatsView.moved)
         {
            return;
         }
         monsterStatsView.moved = true;
         moveCombatView();
      }
      
      public function update(param1:String) : void
      {
         if(textBG.visible)
         {
            setTextBackground(KGAMECLASS.kGAMECLASS.get_displaySettings().textBackground);
         }
      }
      
      public function showTestInputPanel() : void
      {
         if(testInputShown)
         {
            return;
         }
         var _loc1_:int = int(statsView.x);
         var _loc2_:int = int(statsView.y);
         var _loc3_:int = int(statsView.get_width());
         eventTestInput.multiline = true;
         eventTestInput.x = monsterStatsView.x - _loc3_;
         eventTestInput.y = monsterStatsView.y;
         eventTestInput.height = monsterStatsView.get_height();
         eventTestInput.width = monsterStatsView.get_width() + _loc3_;
         eventTestInput.type = "input";
         eventTestInput.visible = true;
         eventTestInput.selectable = true;
         eventTestInput.wordWrap = true;
         scrollBar.visible = false;
         statsView.hide();
         KGAMECLASS.kGAMECLASS.stage.removeEventListener(KeyboardEvent.KEY_DOWN,KGAMECLASS.kGAMECLASS.inputManager.KeyHandler);
         testInputShown = true;
      }
      
      public function showNameBox(param1:Boolean = true) : TextField
      {
         if(param1)
         {
            nameBox.x = mainText.x + 5;
            nameBox.y = mainText.y + 3 + mainText.textHeight;
         }
         nameBox.visible = true;
         return nameBox;
      }
      
      public function showMenuButton(param1:String) : void
      {
         var _loc2_:CoCButton = getMenuButtonByName(param1);
         _loc2_.visible = true;
      }
      
      public function showMainText() : void
      {
         setTextBackground(KGAMECLASS.kGAMECLASS.get_displaySettings().textBackground);
         mainText.visible = true;
         scrollBar.set_activated(true);
      }
      
      public function showCurrentBottomButtons() : void
      {
         var _loc3_:int = 0;
         if(currentActiveButtons == null)
         {
            return;
         }
         var _loc1_:int = 0;
         var _loc2_:Array = currentActiveButtons;
         while(_loc1_ < int(_loc2_.length))
         {
            _loc3_ = int(_loc2_[_loc1_]);
            _loc1_++;
            bottomButtons[_loc3_].visible = true;
         }
      }
      
      public function showBottomButtonDisabled(param1:int, param2:String, param3:String = undefined, param4:String = undefined) : CoCButton
      {
         if(param3 == null)
         {
            param3 = "";
         }
         if(param4 == null)
         {
            param4 = "";
         }
         var _loc5_:CoCButton = bottomButtons[param1];
         if(_loc5_ != null)
         {
            return _loc5_.showDisabled(param2,param3,param4);
         }
         return null;
      }
      
      public function showBottomButton(param1:int, param2:String, param3:Object = undefined, param4:String = undefined, param5:String = undefined) : CoCButton
      {
         if(param4 == null)
         {
            param4 = "";
         }
         if(param5 == null)
         {
            param5 = "";
         }
         var _loc6_:CoCButton = bottomButtons[param1];
         if(_loc6_ != null)
         {
            return _loc6_.show(param2,param3,param4,param5);
         }
         return null;
      }
      
      public function showAllMenuButtons() : void
      {
         showMenuButton("newGame");
         showMenuButton("data");
         showMenuButton("stats");
         showMenuButton("level");
         showMenuButton("perks");
         showMenuButton("appearance");
      }
      
      public function set_onStatsClick(param1:Function) : Function
      {
         return statsButton.callback = param1;
      }
      
      public function set_onPerksClick(param1:Function) : Function
      {
         return perksButton.callback = param1;
      }
      
      public function set_onNewGameClick(param1:Function) : Function
      {
         return newGameButton.callback = param1;
      }
      
      public function set_onLevelClick(param1:Function) : Function
      {
         return levelButton.callback = param1;
      }
      
      public function set_onDataClick(param1:Function) : Function
      {
         return dataButton.callback = param1;
      }
      
      public function set_onBottomButtonClick(param1:Function) : Function
      {
         return _onBottomButtonClick = param1;
      }
      
      public function set_onAppearanceClick(param1:Function) : Function
      {
         return appearanceButton.callback = param1;
      }
      
      public function setTextBackground(param1:int = 0) : void
      {
         if(param1 >= 0)
         {
            textBG.visible = true;
         }
         switch(param1)
         {
            case 0:
               textBG.alpha = Theme.current.get_textBgAlpha();
               textBG.set_fillColor(Color.parseColorString(Theme.current.get_textBgColor()));
               textBG.set_bitmap(monsterStatsView.moved ? Theme.current.get_textBgCombatImage() : Theme.current.get_textBgImage());
               break;
            case 1:
               textBG.alpha = 1;
               textBG.set_fillColor(16777215);
               textBG.set_bitmap(null);
               break;
            case 2:
               textBG.alpha = 1;
               textBG.set_fillColor(15455654);
               textBG.set_bitmap(null);
               break;
            case 3:
               textBG.alpha = 0.4;
               textBG.set_fillColor(16777215);
               textBG.set_bitmap(null);
               break;
            default:
               clearTextBackground();
         }
      }
      
      public function setOutputText(param1:String, param2:String = undefined) : void
      {
         if(param2 == null)
         {
            param2 = "";
         }
         mainText.htmlText = param2 + "<u>​</u>" + param1;
         mainText.setSelection(0,0);
         scrollBar.draw();
      }
      
      public function setMenuButton(param1:String, param2:String = undefined, param3:Object = undefined) : void
      {
         if(param2 == null)
         {
            param2 = "";
         }
         var _loc4_:CoCButton = getMenuButtonByName(param1);
         if(_loc4_ == null)
         {
            throw new ArgumentError("MainView.setMenuButton：无效的菜单按钮名称：" + param1);
         }
         if(param2 != "")
         {
            _loc4_.set_labelText(param2);
            _loc4_.toolTipHeader = param2;
         }
         if(param3 != null)
         {
            _loc4_.callback = param3;
         }
      }
      
      public function setMainFocus(param1:DisplayObject, param2:Boolean = false, param3:Boolean = false) : void
      {
         if(param3)
         {
            param1.height = 602;
            param1.width = 770;
         }
         param1.x = 208;
         param1.y = 52;
         addElementAt(param1,getElementIndex(mainText) + 1);
         if(param2)
         {
            clearTextBackground();
         }
         mainText.visible = false;
         scrollBar.set_activated(false);
         param1.visible = true;
         _mainFocus = param1;
      }
      
      public function setButtonText(param1:int, param2:String) : void
      {
         bottomButtons[param1].set_labelText(param2);
      }
      
      public function setButton(param1:int, param2:String = undefined, param3:Object = undefined, param4:String = undefined) : void
      {
         if(param2 == null)
         {
            param2 = "";
         }
         if(param4 == null)
         {
            param4 = "";
         }
         if(param1 < 0 || param1 >= MainView.BOTTOM_BUTTON_COUNT)
         {
            return;
         }
         if(param2 != "")
         {
            showBottomButton(param1,param2,param3,param4);
         }
         else
         {
            hideBottomButton(param1);
         }
      }
      
      public function resetTextFormat() : void
      {
         var _loc1_:TextFormat = new TextFormat();
         _loc1_.font = Assets.getFont("res/fonts/NotoSerif-Regular.ttf").fontName;
         _loc1_.bold = false;
         _loc1_.italic = false;
         _loc1_.underline = false;
         _loc1_.bullet = false;
         _loc1_.size = KGAMECLASS.kGAMECLASS.get_displaySettings().fontSize;
         _loc1_.color = Theme.current.get_textColor();
         mainText.defaultTextFormat = _loc1_;
      }
      
      public function resetNameBox() : void
      {
         var _loc1_:String = nameBox.text;
         initNameBox();
         nameBox.text = _loc1_;
      }
      
      public function resetMainFocus() : void
      {
         var _loc2_:* = null as Error;
         if(_mainFocus != null)
         {
            try
            {
               removeElement(_mainFocus);
            }
            catch(_loc_e_:Error)
            {
               _loc2_ = _loc_e_;
            }
         }
         mainText.visible = true;
         scrollBar.set_activated(true);
         setTextBackground(KGAMECLASS.kGAMECLASS.get_displaySettings().textBackground);
      }
      
      public function promptName(param1:String = undefined) : void
      {
         if(param1 == null)
         {
            param1 = "";
         }
         promptInput({
            "maxChars":16,
            "text":param1
         });
      }
      
      public function promptInput(param1:Object) : void
      {
         var _loc2_:Number = mainText.x + 5;
         var _loc3_:Number = mainText.y + 3 + mainText.textHeight;
         var _loc4_:int = 165;
         var _loc5_:int = 0;
         var _loc6_:String = "";
         var _loc7_:String = null;
         nameBox.x = param1.x != null ? Number(param1.x) : _loc2_;
         nameBox.y = param1.y != null ? Number(param1.y) : _loc3_;
         nameBox.width = param1.width != null ? Number(param1.width) : _loc4_;
         nameBox.maxChars = param1.maxChars != null ? int(param1.maxChars) : _loc5_;
         nameBox.text = param1.text != null ? param1.text : _loc6_;
         nameBox.restrict = param1.restrict != null ? param1.restrict : _loc7_;
         nameBox.visible = true;
      }
      
      public function moveCombatViewBack(param1:TimerEvent = undefined) : void
      {
         var _loc2_:TextFieldVScroll = scrollBar;
         _loc2_.set_x(_loc2_.x + 160);
         var _loc3_:BitmapDataSprite = textBG;
         _loc3_.set_width(_loc3_.width + 160);
         setTextBackground(KGAMECLASS.kGAMECLASS.get_displaySettings().textBackground);
         var _loc4_:MonsterStatsView = monsterStatsView;
         _loc4_.x += 160;
         var _loc5_:TextField = mainText;
         _loc5_.width += 160;
         mainText.htmlText = mainText.htmlText;
      }
      
      public function moveCombatView(param1:TimerEvent = undefined) : void
      {
         var _loc2_:TextFieldVScroll = scrollBar;
         _loc2_.set_x(_loc2_.x - 160);
         var _loc3_:BitmapDataSprite = textBG;
         _loc3_.set_width(_loc3_.width - 160);
         var _loc4_:MonsterStatsView = monsterStatsView;
         _loc4_.x -= 160;
         var _loc5_:TextField = mainText;
         _loc5_.width -= 160;
         monsterStatsView.setBackgroundBitmap(Theme.current.get_monsterBg());
         monsterStatsView.refreshStats(KGAMECLASS.kGAMECLASS);
         setTextBackground(KGAMECLASS.kGAMECLASS.get_displaySettings().textBackground);
      }
      
      public function menuButtonIsVisible(param1:String) : Boolean
      {
         return getMenuButtonByName(param1).visible;
      }
      
      public function menuButtonHasLabel(param1:String, param2:String) : Boolean
      {
         return getMenuButtonByName(param1).get_labelText() == param2;
      }
      
      public function invert() : void
      {
         blackBackground.visible = !blackBackground.visible;
      }
      
      public function initNameBox() : void
      {
         if(nameBox != null && contains(nameBox))
         {
            removeElement(nameBox);
         }
         nameBox = addTextField(new TextFieldParameters(null,null,"input",null,165,25,null,null,new DefaultTextFormatParameters(Assets.getFont("res/fonts/pala.ttf").fontName,16,null,null,null,null,null,null,null,null,null,null,null),null,null,null,null,true,16777215,true,false));
         nameBox.type = "input";
      }
      
      public function indexOfButtonWithLabel(param1:String) : int
      {
         var _loc4_:int = 0;
         var _loc2_:int = 0;
         var _loc3_:int = int(bottomButtons.length);
         while(_loc2_ < _loc3_)
         {
            _loc4_ = _loc2_++;
            if(getButtonText(_loc4_) == param1)
            {
               return _loc4_;
            }
         }
         return -1;
      }
      
      public function hoverMonster(param1:MouseEvent) : void
      {
         var _loc2_:Object = param1.target;
         var _loc3_:OneMonsterView = _loc2_ as OneMonsterView;
         if(_loc3_ != null && _loc3_.visible && _loc3_.toolTipText != "")
         {
            toolTipView.set_header(_loc3_.toolTipHeader);
            toolTipView.set_text(KGAMECLASS.kGAMECLASS.secondaryParser.parse(_loc3_.toolTipText));
            toolTipView.showForMonster(_loc3_);
         }
         else
         {
            toolTipView.hide();
         }
      }
      
      public function hoverButton(param1:MouseEvent) : void
      {
         var _loc2_:Object = param1.target;
         var _loc3_:CoCButton = _loc2_ as CoCButton;
         if(_loc3_ != null && _loc3_.visible && _loc3_.toolTipText != null && _loc3_.toolTipText != "")
         {
            toolTipView.set_header(_loc3_.toolTipHeader);
            toolTipView.set_text(KGAMECLASS.kGAMECLASS.secondaryParser.parse(_loc3_.toolTipText));
            toolTipView.showForElement(_loc3_);
         }
         else
         {
            toolTipView.hide();
         }
      }
      
      public function hookMonster(param1:Sprite) : void
      {
         param1.mouseChildren = false;
         param1.addEventListener(MouseEvent.ROLL_OVER,hoverMonster);
         param1.addEventListener(MouseEvent.ROLL_OUT,dimButton);
      }
      
      public function hookButton(param1:Sprite) : void
      {
         param1.mouseChildren = false;
         param1.addEventListener(MouseEvent.ROLL_OVER,hoverButton);
         param1.addEventListener(MouseEvent.ROLL_OUT,dimButton);
      }
      
      public function hookBottomButtons() : void
      {
         var _loc1_:* = null as Sprite;
         var _loc4_:* = null as CoCButton;
         var _loc2_:int = 0;
         var _loc3_:Array = bottomButtons;
         while(_loc2_ < int(_loc3_.length))
         {
            _loc4_ = _loc3_[_loc2_];
            _loc2_++;
            _loc1_ = _loc4_;
            _loc1_.addEventListener(MouseEvent.CLICK,executeBottomButtonClick);
         }
      }
      
      public function hookAllMonsters() : void
      {
         var _loc1_:* = null as Sprite;
         var _loc4_:* = null as OneMonsterView;
         var _loc2_:int = 0;
         var _loc3_:Array = monsterStatsView.monsterViews;
         while(_loc2_ < int(_loc3_.length))
         {
            _loc4_ = _loc3_[_loc2_];
            _loc2_++;
            _loc1_ = _loc4_;
            hookMonster(_loc1_);
         }
      }
      
      public function hookAllButtons() : void
      {
         var _loc1_:* = null as Sprite;
         var _loc4_:* = null as CoCButton;
         var _loc2_:int = 0;
         var _loc3_:Array = allButtons;
         while(_loc2_ < int(_loc3_.length))
         {
            _loc4_ = _loc3_[_loc2_];
            _loc2_++;
            _loc1_ = _loc4_;
            hookButton(_loc1_);
         }
      }
      
      public function hideTestInputPanel() : void
      {
         if(!testInputShown)
         {
            return;
         }
         KGAMECLASS.kGAMECLASS.stage.removeEventListener(KeyboardEvent.KEY_DOWN,KGAMECLASS.kGAMECLASS.inputManager.KeyHandler);
         KGAMECLASS.kGAMECLASS.stage.addEventListener(KeyboardEvent.KEY_DOWN,KGAMECLASS.kGAMECLASS.inputManager.KeyHandler);
         var _loc1_:int = int(mainTextCoords.x);
         var _loc2_:int = int(mainTextCoords.y);
         eventTestInput.visible = false;
         eventTestInput.selectable = false;
         scrollBar.visible = true;
         testInputShown = false;
      }
      
      public function hideSprite() : void
      {
         sprite.visible = false;
      }
      
      public function hideMenuButton(param1:String) : void
      {
         var _loc2_:CoCButton = getMenuButtonByName(param1);
         _loc2_.visible = false;
      }
      
      public function hideMainText() : void
      {
         clearTextBackground();
         resetTextFormat();
         mainText.visible = false;
         scrollBar.set_activated(false);
      }
      
      public function hideImage() : void
      {
         image.visible = false;
      }
      
      public function hideCurrentBottomButtons() : void
      {
         var _loc3_:int = 0;
         var _loc4_:* = null as CoCButton;
         currentActiveButtons = [];
         var _loc1_:int = 0;
         var _loc2_:int = MainView.BOTTOM_BUTTON_COUNT;
         while(_loc1_ < _loc2_)
         {
            _loc3_ = _loc1_++;
            _loc4_ = bottomButtons[_loc3_];
            if(_loc4_.visible == true)
            {
               currentActiveButtons.push(_loc3_);
               _loc4_.visible = false;
            }
         }
      }
      
      public function hideBottomButton(param1:int) : CoCButton
      {
         var _loc2_:CoCButton = bottomButtons[param1];
         if(_loc2_ != null)
         {
            return _loc2_.hide();
         }
         return null;
      }
      
      public function hideAllMenuButtons() : void
      {
         hideMenuButton("newGame");
         hideMenuButton("data");
         hideMenuButton("stats");
         hideMenuButton("level");
         hideMenuButton("perks");
         hideMenuButton("appearance");
      }
      
      public function hasButton(param1:String) : Boolean
      {
         return indexOfButtonWithLabel(param1) != -1;
      }
      
      public function getMenuButtonByName(param1:String) : CoCButton
      {
         var _loc2_:String = param1;
         if(_loc2_ == "appearance")
         {
            return appearanceButton;
         }
         if(_loc2_ == "data")
         {
            return dataButton;
         }
         if(_loc2_ == "level")
         {
            return levelButton;
         }
         if(_loc2_ == "newGame")
         {
            return newGameButton;
         }
         if(_loc2_ == "perks")
         {
            return perksButton;
         }
         if(_loc2_ == "stats")
         {
            return statsButton;
         }
         return null;
      }
      
      public function getButtonText(param1:int) : String
      {
         var _loc2_:CoCButton = bottomButtons[param1];
         var _loc3_:String = _loc2_ != null ? _loc2_.get_labelText() : null;
         if(_loc3_ != null)
         {
            return _loc3_;
         }
         return "";
      }
      
      public function formatMiscItems() : void
      {
         sideBarDecoration = getElementByName("statsBarMarker");
         hideSprite();
         hideImage();
      }
      
      public function expandTestInput() : void
      {
         var _loc2_:* = null as TextField;
         var _loc3_:* = null as BitmapDataSprite;
         var _loc4_:* = null as TextField;
         var _loc5_:* = null as BitmapDataSprite;
         var _loc1_:int = 0;
         if(eventTestInput.width == mainText.width)
         {
            eventTestInput.width = statsView.get_width() + monsterStatsView.get_width();
            eventTestInput.height = monsterStatsView.get_height();
            _loc1_ = int(208 - (mainText.width - eventTestInput.width));
            _loc2_ = mainText;
            _loc2_.x -= _loc1_;
            _loc3_ = textBG;
            _loc3_.x -= _loc1_;
            _loc4_ = eventTestInput;
            _loc4_.x -= _loc1_;
            _loc5_ = background;
            _loc5_.x -= _loc1_;
         }
         else
         {
            _loc1_ = int(208 - (mainText.width - eventTestInput.width));
            _loc2_ = mainText;
            _loc2_.x += _loc1_;
            _loc3_ = textBG;
            _loc3_.x += _loc1_;
            _loc4_ = eventTestInput;
            _loc4_.x += _loc1_;
            eventTestInput.width = mainText.width;
            eventTestInput.height = mainText.height;
            _loc5_ = background;
            _loc5_.x += _loc1_;
         }
      }
      
      public function executeBottomButtonClick(param1:Event) : void
      {
         toolTipView.hide();
      }
      
      public function endCombatView() : void
      {
         if(!monsterStatsView.moved)
         {
            return;
         }
         monsterStatsView.moved = false;
         moveCombatViewBack();
         monsterStatsView.resetStats(KGAMECLASS.kGAMECLASS);
         monsterStatsView.hide();
      }
      
      public function dimButton(param1:MouseEvent) : void
      {
         toolTipView.hide();
      }
      
      public function createBottomButtons() : void
      {
         var _gthis:MainView;
         var _loc3_:int = 0;
         var _loc4_:int = 0;
         var _loc5_:* = null as CoCButton;
         var _loc9_:int = 0;
         _gthis = this;
         bottomButtons = [];
         var _loc6_:Function = function(param1:int, param2:CoCButton):void
         {
            if(_gthis._onBottomButtonClick != null)
            {
               _gthis._onBottomButtonClick(param1);
            }
         };
         var _loc7_:int = 0;
         var _loc8_:int = MainView.BOTTOM_BUTTON_COUNT;
         while(_loc7_ < _loc8_)
         {
            _loc9_ = _loc7_++;
            _loc3_ = int(_loc9_ / 5);
            _loc4_ = int(_loc9_ % 5);
            _loc5_ = new CoCButton("",null,"","",_loc9_,false,true,false,0,MainView.BOTTOM_X + MainView.BOTTOM_HGAP + _loc4_ * (MainView.BOTTOM_HGAP * 2 + 150),MainView.BOTTOM_Y + _loc3_ * 44);
            _loc5_.preCallback = (function(param1:Array, param2:Array):Function
            {
               var _g:Array = param1;
               var index:Array = param2;
               return function(param1:CoCButton):void
               {
                  _g[0](int(index[0]),param1);
               };
            })([_loc6_],[_loc9_]);
            bottomButtons.push(_loc5_);
            addElement(_loc5_);
         }
         allButtons = allButtons.concat(bottomButtons);
      }
      
      public function clickButton(param1:int) : void
      {
         bottomButtons[param1].click();
      }
      
      public function clearTextBackground() : void
      {
         textBG.visible = false;
      }
      
      public function clearOutputText() : void
      {
         mainText.htmlText = "";
         resetTextFormat();
         scrollBar.draw();
      }
      
      public function clearBottomButtons() : void
      {
         var _loc3_:int = 0;
         var _loc1_:int = 0;
         var _loc2_:int = MainView.BOTTOM_BUTTON_COUNT;
         while(_loc1_ < _loc2_)
         {
            _loc3_ = _loc1_++;
            setButton(_loc3_);
         }
      }
      
      public function buttonTextIsOneOf(param1:int, param2:Array) : Boolean
      {
         return param2.indexOf(getButtonText(param1)) != -1;
      }
      
      public function buttonIsVisible(param1:int) : Boolean
      {
         if(param1 < 0 || param1 > MainView.BOTTOM_BUTTON_COUNT)
         {
            return false;
         }
         return bottomButtons[param1].visible;
      }
      
      public function appendOutputText(param1:String) : void
      {
         var _loc2_:TextField = mainText;
         _loc2_.htmlText += param1;
         scrollBar.draw();
      }
   }
}

