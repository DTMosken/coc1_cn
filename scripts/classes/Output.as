package classes
{
   import classes.display.GameViewData;
   import classes.globalFlags.KGAMECLASS;
   import classes.internals.GuiOutput;
   import coc.view.ButtonData;
   import coc.view.ButtonDataList;
   import coc.view.CoCButton;
   import coc.view.StatsView;
   import coc.view.Theme;
   import flash.Boot;
   import flash.events.Event;
   
   public class Output implements GuiOutput
   {
      
      public static var init__:Boolean;
      
      public static var _instance:Output;
      
      public static var MAX_BUTTON_INDEX:int = 14;
      
      public static var ALL_SLOTS:Array = [0,1,2,3,4,5,6,7,8,9,10,11,12,13,14];
      
      public static var ROWS:Array = [[0,1,2,3,4],[5,6,7,8,9],[10,11,12,13,14]];
      
      public static var COLS:Array = [[0,5,10],[1,6,11],[2,7,12],[3,8,13],[4,9,14]];
      
      public static var HISTORY_MAX:int = 20;
      
      public static var currentScene:String = "";
      
      public var buttons:ButtonDataList;
      
      public var _imageText:String;
      
      public var _currentText:String;
      
      public function Output()
      {
         if(Boot.skip_constructor)
         {
            return;
         }
         buttons = new ButtonDataList();
         _imageText = "";
         _currentText = "";
         if(Output._instance != null)
         {
            throw new Error("创建了多个 Output 实例");
         }
      }
      
      public static function init() : Output
      {
         return Output._instance;
      }
      
      public static function updateLoc() : void
      {
      }
      
      public function updateGameViews(param1:Event) : void
      {
         var _loc5_:* = null as CoCButton;
         KGAMECLASS.kGAMECLASS.stage.removeEventListener(Event.ENTER_FRAME,updateGameViews);
         GameViewData.htmlText = _currentText;
         GameViewData.imageText = _imageText;
         var _loc2_:Array = [];
         var _loc3_:int = 0;
         var _loc4_:Array = KGAMECLASS.kGAMECLASS.mainView.bottomButtons;
         while(_loc3_ < int(_loc4_.length))
         {
            _loc5_ = _loc4_[_loc3_];
            _loc3_++;
            _loc2_.push(_loc5_.buttonData());
         }
         GameViewData.bottomButtons = _loc2_;
         GameViewData.menuButtons = [KGAMECLASS.kGAMECLASS.mainView.newGameButton.buttonData(),KGAMECLASS.kGAMECLASS.mainView.dataButton.buttonData(),KGAMECLASS.kGAMECLASS.mainView.statsButton.buttonData(),KGAMECLASS.kGAMECLASS.mainView.levelButton.buttonData(),KGAMECLASS.kGAMECLASS.mainView.perksButton.buttonData(),KGAMECLASS.kGAMECLASS.mainView.appearanceButton.buttonData()];
         GameViewData.inputNeeded = KGAMECLASS.kGAMECLASS.mainView.nameBox.visible;
         GameViewData.inputText = KGAMECLASS.kGAMECLASS.mainView.nameBox.text;
         GameViewData.flush();
      }
      
      public function text(param1:String) : GuiOutput
      {
         KGAMECLASS.kGAMECLASS.mainView.hideTestInputPanel();
         param1 = KGAMECLASS.kGAMECLASS.parser.parse(param1);
         _currentText += param1;
         return this;
      }
      
      public function statScreenRefresh() : void
      {
         KGAMECLASS.kGAMECLASS.mainView.statsView.show();
         KGAMECLASS.kGAMECLASS.mainViewManager.refreshStats();
      }
      
      public function showUpDown() : void
      {
         var _loc1_:StatStore = KGAMECLASS.kGAMECLASS.oldStats;
         var _loc2_:StatsView = KGAMECLASS.kGAMECLASS.mainView.statsView;
         var _loc3_:Player = KGAMECLASS.kGAMECLASS.player;
         if(_loc3_.get_str() > _loc1_.str)
         {
            _loc2_.showStatUp("str");
         }
         if(_loc3_.get_tou() > _loc1_.tou)
         {
            _loc2_.showStatUp("tou");
         }
         if(_loc3_.get_spe() > _loc1_.spe)
         {
            _loc2_.showStatUp("spe");
         }
         if(_loc3_.get_inte() > _loc1_.inte)
         {
            _loc2_.showStatUp("inte");
         }
         if(_loc3_.sens > _loc1_.sens)
         {
            _loc2_.showStatUp("sens");
         }
         if(_loc3_.lib > _loc1_.lib)
         {
            _loc2_.showStatUp("lib");
         }
         if(_loc3_.cor > _loc1_.cor)
         {
            _loc2_.showStatUp("cor");
         }
         if(_loc3_.get_HP() > _loc1_.hp)
         {
            _loc2_.showStatUp("HP");
         }
         if(_loc3_.get_lust() > _loc1_.lust)
         {
            _loc2_.showStatUp("lust");
         }
         if(_loc3_.get_fatigue() > _loc1_.fatigue)
         {
            _loc2_.showStatUp("fatigue");
         }
         if(_loc3_.hunger > _loc1_.hunger)
         {
            _loc2_.showStatUp("hunger");
         }
         if(_loc3_.get_str() < _loc1_.str)
         {
            _loc2_.showStatDown("str");
         }
         if(_loc3_.get_tou() < _loc1_.tou)
         {
            _loc2_.showStatDown("tou");
         }
         if(_loc3_.get_spe() < _loc1_.spe)
         {
            _loc2_.showStatDown("spe");
         }
         if(_loc3_.get_inte() < _loc1_.inte)
         {
            _loc2_.showStatDown("inte");
         }
         if(_loc3_.sens < _loc1_.sens)
         {
            _loc2_.showStatDown("sens");
         }
         if(_loc3_.lib < _loc1_.lib)
         {
            _loc2_.showStatDown("lib");
         }
         if(_loc3_.cor < _loc1_.cor)
         {
            _loc2_.showStatDown("cor");
         }
         if(_loc3_.get_HP() < _loc1_.hp)
         {
            _loc2_.showStatDown("HP");
         }
         if(_loc3_.get_lust() < _loc1_.lust)
         {
            _loc2_.showStatDown("lust");
         }
         if(_loc3_.get_fatigue() < _loc1_.fatigue)
         {
            _loc2_.showStatDown("fatigue");
         }
         if(_loc3_.hunger < _loc1_.hunger)
         {
            _loc2_.showStatDown("hunger");
         }
      }
      
      public function showStats() : void
      {
         KGAMECLASS.kGAMECLASS.mainView.statsView.show();
         KGAMECLASS.kGAMECLASS.mainViewManager.refreshStats();
         KGAMECLASS.kGAMECLASS.mainViewManager.tweenInStats();
      }
      
      public function setExitButton(param1:String = undefined, param2:Object = undefined, param3:int = 14, param4:Boolean = false, param5:int = 0) : CoCButton
      {
         if(param1 == null)
         {
            param1 = "离开";
         }
         if(param2 == null)
         {
            param2 = KGAMECLASS.kGAMECLASS.camp.returnToCampUseOneHour;
         }
         buttons.exitName = param1;
         buttons.exitPosition = param3;
         if(buttons.get_lengthFiltered() >= 14 || param4)
         {
            buttons.submenu(param2,param4,param5);
         }
         else
         {
            button(param3).show(param1,param2,"","",true);
            flush();
         }
         return button(param3);
      }
      
      public function removeButton(param1:int = -1, param2:String = undefined) : CoCButton
      {
         var _loc3_:CoCButton = button(param1,param2);
         _loc3_.hide();
         flush();
         return _loc3_;
      }
      
      public function raw(param1:String) : Output
      {
         KGAMECLASS.kGAMECLASS.parser.resetBreaks();
         _currentText += param1;
         return this;
      }
      
      public function menuIsEmpty(param1:int = -1) : Boolean
      {
         var _loc4_:int = 0;
         if(param1 < 0)
         {
            param1 = 14;
         }
         var _loc2_:int = 0;
         var _loc3_:int = param1 + 1;
         while(_loc2_ < _loc3_)
         {
            _loc4_ = _loc2_++;
            if(buttonIsVisible(_loc4_))
            {
               return false;
            }
         }
         return true;
      }
      
      public function menuHasOptions(param1:int = -1) : Boolean
      {
         var _loc4_:int = 0;
         if(param1 < 0)
         {
            param1 = 14;
         }
         var _loc2_:int = 0;
         var _loc3_:int = param1 + 1;
         while(_loc2_ < _loc3_)
         {
            _loc4_ = _loc2_++;
            if(buttonIsEnabled(_loc4_))
            {
               return true;
            }
         }
         return false;
      }
      
      public function menu(param1:Boolean = true) : void
      {
         var _loc4_:int = 0;
         Theme.current.buttonReset();
         if(param1)
         {
            buttons.clear();
         }
         var _loc2_:int = 0;
         var _loc3_:int = 15;
         while(_loc2_ < _loc3_)
         {
            _loc4_ = _loc2_++;
            KGAMECLASS.kGAMECLASS.mainView.hideBottomButton(_loc4_);
         }
         flush();
      }
      
      public function hideUpDown() : void
      {
         KGAMECLASS.kGAMECLASS.mainView.statsView.hideUpDown();
         KGAMECLASS.kGAMECLASS.oldStats = new StatStore(0,0,0,0,0,0,0,0,0,0,0);
      }
      
      public function hideStats() : void
      {
         if(!KGAMECLASS.kGAMECLASS.mainViewManager.buttonsTweened)
         {
            KGAMECLASS.kGAMECLASS.mainView.statsView.hide();
         }
         KGAMECLASS.kGAMECLASS.mainViewManager.tweenOutStats();
      }
      
      public function hideMenus() : void
      {
         KGAMECLASS.kGAMECLASS.mainView.hideAllMenuButtons();
      }
      
      public function header(param1:String) : GuiOutput
      {
         return text(formatHeader(param1));
      }
      
      public function getEmptyButtons(param1:int = -1) : Array
      {
         var _loc5_:int = 0;
         if(param1 < 0)
         {
            param1 = 14;
         }
         var _loc2_:Array = [];
         var _loc3_:int = 0;
         var _loc4_:int = param1 + 1;
         while(_loc3_ < _loc4_)
         {
            _loc5_ = _loc3_++;
            if(!buttonIsVisible(_loc5_))
            {
               _loc2_.push(_loc5_);
            }
         }
         return _loc2_;
      }
      
      public function getButtonText(param1:int) : String
      {
         if(param1 < 0 || param1 > 14)
         {
            return "";
         }
         return button(param1).get_labelText();
      }
      
      public function getAvailableButtons(param1:int = -1) : Array
      {
         var _loc5_:int = 0;
         if(param1 < 0)
         {
            param1 = 14;
         }
         var _loc2_:Array = [];
         var _loc3_:int = 0;
         var _loc4_:int = param1 + 1;
         while(_loc3_ < _loc4_)
         {
            _loc5_ = _loc3_++;
            if(buttonIsVisible(_loc5_) && buttonIsEnabled(_loc5_))
            {
               _loc2_.push(_loc5_);
            }
         }
         return _loc2_;
      }
      
      public function formatHeader(param1:String) : String
      {
         return "<font size=\"36\" face=\"Alibaba PuHuiTi 3 95 ExtraBold\"><u>" + param1 + "</u></font>\n";
      }
      
      public function flush() : void
      {
         KGAMECLASS.kGAMECLASS.mainViewManager.setText(_currentText,_imageText);
         KGAMECLASS.kGAMECLASS.stage.addEventListener(Event.ENTER_FRAME,updateGameViews);
      }
      
      public function doYesNo(param1:Function, param2:Function) : void
      {
         menu();
         addButton(0,"确定",param1);
         addButton(1,"取消",param2);
      }
      
      public function doNext(param1:Function) : void
      {
         if(KGAMECLASS.kGAMECLASS.mainView.getButtonText(0).indexOf("游戏结束") != -1)
         {
            return;
         }
         menu();
         addButton(0,"继续",param1);
      }
      
      public function disableButton(param1:int = -1, param2:String = undefined) : CoCButton
      {
         var _loc3_:CoCButton = button(param1,param2);
         _loc3_.disable();
         flush();
         return _loc3_;
      }
      
      public function clearText() : GuiOutput
      {
         Output.updateLoc();
         _currentText = "";
         _imageText = "";
         KGAMECLASS.kGAMECLASS.mainView.clearOutputText();
         KGAMECLASS.kGAMECLASS.resetParsers();
         GameViewData.clear();
         return this;
      }
      
      public function clear(param1:Boolean = false) : GuiOutput
      {
         Output.updateLoc();
         if(param1)
         {
            if(KGAMECLASS.kGAMECLASS.get_gameState() != 3)
            {
               KGAMECLASS.kGAMECLASS.mainView.hideMenuButton("data");
            }
            KGAMECLASS.kGAMECLASS.mainView.hideMenuButton("appearance");
            KGAMECLASS.kGAMECLASS.mainView.hideMenuButton("level");
            KGAMECLASS.kGAMECLASS.mainView.hideMenuButton("perks");
            KGAMECLASS.kGAMECLASS.mainView.hideMenuButton("stats");
         }
         _currentText = "";
         _imageText = "";
         KGAMECLASS.kGAMECLASS.mainView.clearOutputText();
         KGAMECLASS.kGAMECLASS.mainView.resetNameBox();
         KGAMECLASS.kGAMECLASS.mainView.resetMainFocus();
         KGAMECLASS.kGAMECLASS.resetParsers();
         GameViewData.clear();
         return this;
      }
      
      public function buttonTextIsOneOf(param1:int, param2:Array) : Boolean
      {
         var _loc4_:String = getButtonText(param1);
         return param2.indexOf(_loc4_) != -1;
      }
      
      public function buttonIsVisible(param1:int) : Boolean
      {
         if(param1 < 0 || param1 > 14)
         {
            return false;
         }
         return button(param1).visible;
      }
      
      public function buttonIsEnabled(param1:int) : Boolean
      {
         if(param1 < 0 || param1 > 14)
         {
            return false;
         }
         return button(param1).enabled;
      }
      
      public function buttonCount() : int
      {
         var _loc4_:int = 0;
         var _loc1_:int = 0;
         var _loc2_:int = 0;
         var _loc3_:int = 15;
         while(_loc2_ < _loc3_)
         {
            _loc4_ = _loc2_++;
            if(buttonIsVisible(_loc4_))
            {
               _loc1_++;
            }
         }
         return _loc1_;
      }
      
      public function button(param1:int = -1, param2:String = undefined) : CoCButton
      {
         if(param2 != null)
         {
            param1 = KGAMECLASS.kGAMECLASS.mainView.indexOfButtonWithLabel(param2);
         }
         return KGAMECLASS.kGAMECLASS.mainView.bottomButtons[param1];
      }
      
      public function addRowButtonDisabled(param1:int, param2:String = undefined, param3:String = undefined, param4:String = undefined) : CoCButton
      {
         if(param2 == null)
         {
            param2 = "";
         }
         if(param3 == null)
         {
            param3 = "";
         }
         if(param4 == null)
         {
            param4 = "";
         }
         return addLimitedButtonDisabled(Output.ROWS[param1],param2,param3,param4);
      }
      
      public function addRowButton(param1:int, param2:String = undefined, param3:Function = undefined) : CoCButton
      {
         if(param2 == null)
         {
            param2 = "";
         }
         return addLimitedButton(Output.ROWS[param1],param2,param3);
      }
      
      public function addNextButtonDisabled(param1:String = undefined, param2:String = undefined, param3:String = undefined) : CoCButton
      {
         var _loc7_:int = 0;
         var _loc8_:* = null as CoCButton;
         if(param1 == null)
         {
            param1 = "";
         }
         if(param2 == null)
         {
            param2 = "";
         }
         if(param3 == null)
         {
            param3 = "";
         }
         var _loc4_:int = -1;
         var _loc5_:int = 0;
         var _loc6_:int = 15;
         while(_loc5_ < _loc6_)
         {
            _loc7_ = _loc5_++;
            if(!KGAMECLASS.kGAMECLASS.mainView.bottomButtons[_loc7_].visible)
            {
               _loc4_ = _loc7_;
               break;
            }
         }
         if(_loc4_ == -1)
         {
            _loc8_ = new CoCButton(param1,null,param2,param3,buttons.get_length(),false,false,true,0,0,0);
            _loc8_.pushData();
            return _loc8_;
         }
         _loc8_ = button(_loc4_);
         _loc8_.showDisabled(param1,param2,param3);
         flush();
         return _loc8_;
      }
      
      public function addNextButton(param1:String = undefined, param2:Function = undefined) : CoCButton
      {
         var _loc5_:int = 0;
         if(param1 == null)
         {
            param1 = "";
         }
         var _loc3_:int = 0;
         var _loc4_:int = 15;
         while(_loc3_ < _loc4_)
         {
            _loc5_ = _loc3_++;
            if(!KGAMECLASS.kGAMECLASS.mainView.bottomButtons[_loc5_].visible)
            {
               return addButton(_loc5_,param1,param2);
            }
         }
         var _loc6_:CoCButton = new CoCButton(param1,param2,"","",buttons.get_length(),false,true,true,0,0,0);
         _loc6_.pushData();
         return _loc6_;
      }
      
      public function addLimitedButtonDisabled(param1:Array, param2:String = undefined, param3:String = undefined, param4:String = undefined) : CoCButton
      {
         var _loc7_:int = 0;
         if(param2 == null)
         {
            param2 = "";
         }
         if(param3 == null)
         {
            param3 = "";
         }
         if(param4 == null)
         {
            param4 = "";
         }
         var _loc5_:int = -1;
         var _loc6_:int = 0;
         while(_loc6_ < int(param1.length))
         {
            _loc7_ = int(param1[_loc6_]);
            _loc6_++;
            if(!KGAMECLASS.kGAMECLASS.mainView.bottomButtons[_loc7_].visible)
            {
               _loc5_ = _loc7_;
               break;
            }
         }
         if(_loc5_ == -1)
         {
            return new CoCButton("",null,"","",0,true,true,true,0,0,0);
         }
         var _loc8_:CoCButton = button(_loc5_);
         _loc8_.showDisabled(param2,param3,param4);
         flush();
         return _loc8_;
      }
      
      public function addLimitedButton(param1:Array, param2:String = undefined, param3:Function = undefined) : CoCButton
      {
         var _loc5_:int = 0;
         if(param2 == null)
         {
            param2 = "";
         }
         var _loc4_:int = 0;
         while(_loc4_ < int(param1.length))
         {
            _loc5_ = int(param1[_loc4_]);
            _loc4_++;
            if(!KGAMECLASS.kGAMECLASS.mainView.bottomButtons[_loc5_].visible)
            {
               return addButton(_loc5_,param2,param3);
            }
         }
         return new CoCButton("",null,"","",0,true,true,true,0,0,0);
      }
      
      public function addImage(param1:String) : GuiOutput
      {
         param1 = KGAMECLASS.kGAMECLASS.secondaryParser.parse(param1);
         _imageText += param1;
         return this;
      }
      
      public function addColButtonDisabled(param1:int, param2:String = undefined, param3:String = undefined, param4:String = undefined) : CoCButton
      {
         if(param2 == null)
         {
            param2 = "";
         }
         if(param3 == null)
         {
            param3 = "";
         }
         if(param4 == null)
         {
            param4 = "";
         }
         return addLimitedButtonDisabled(Output.COLS[param1],param2,param3,param4);
      }
      
      public function addColButton(param1:int, param2:String = undefined, param3:Function = undefined) : CoCButton
      {
         if(param2 == null)
         {
            param2 = "";
         }
         return addLimitedButton(Output.COLS[param1],param2,param3);
      }
      
      public function addButtonDisabled(param1:int, param2:String = undefined, param3:String = undefined, param4:String = undefined) : CoCButton
      {
         if(param2 == null)
         {
            param2 = "";
         }
         if(param3 == null)
         {
            param3 = "";
         }
         if(param4 == null)
         {
            param4 = "";
         }
         var _loc5_:CoCButton = button(param1);
         _loc5_.showDisabled(param2,param3,param4);
         flush();
         return _loc5_;
      }
      
      public function addButton(param1:int, param2:String = undefined, param3:Function = undefined) : CoCButton
      {
         if(param2 == null)
         {
            param2 = "";
         }
         var _loc4_:CoCButton = button(param1);
         if(param3 == null)
         {
            _loc4_.hide();
         }
         else
         {
            _loc4_.show(param2,param3);
         }
         flush();
         return _loc4_;
      }
   }
}

