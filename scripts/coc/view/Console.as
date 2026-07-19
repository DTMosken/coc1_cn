package coc.view
{
   import classes.GameLogo;
   import classes.InputManager;
   import classes.Output;
   import classes.display.GameView;
   import classes.display.GameViewData;
   import classes.display.MapData;
   import classes.display.SettingData;
   import classes.globalFlags.KGAMECLASS;
   import classes.internals.StringUtil;
   import classes.internals.Utils;
   import flash.Boot;
   import flash.display.BitmapData;
   import flash.display.Graphics;
   import flash.display.Sprite;
   import flash.events.FocusEvent;
   import flash.events.KeyboardEvent;
   import flash.events.TextEvent;
   import flash.geom.ColorTransform;
   import flash.geom.Matrix;
   import flash.geom.Rectangle;
   import flash.text.TextField;
   import flash.text.TextFormat;
   import haxe.IMap;
   import haxe.ds.StringMap;
   import lime.text.Font;
   import lime.utils.Assets;
   import openfl.display._internal.FlashGraphics;
   
   public class Console extends Sprite implements GameView
   {
      
      public static var FGC:uint = 1550475;
      
      public static var BGC:uint = 1974825;
      
      public static var PRC:uint = 4490554;
      
      public static var CMC:uint = 1939955;
      
      public static var RED:uint = 15537429;
      
      public static var ORG:uint = 16151552;
      
      public static var PRP:uint = 10181046;
      
      public static function labelMap(param1:ButtonData):String
      {
         return Console.cleanLabel(param1.text);
      }
      public var specialPrefixed:Array;
      
      public var doCamp:String;
      
      public var combatMenu:String;
      
      public var _suggestions:Array;
      
      public var _prompted:Boolean;
      
      public var _minLen:int;
      
      public var _metaCommands:Object;
      
      public var _mainText:TextField;
      
      public var _locked:Boolean;
      
      public var _lastSuggestion:int;
      
      public var _lastLen:int;
      
      public var _doAutoClear:Boolean;
      
      public var _charsPerLine:Number;
      
      public var _charWidth:Number;
      
      public var _charHeight:Number;
      
      public function Console(param1:int = 0, param2:int = 0)
      {
         var percent1:Number;
         var _g1:Console;
         var percent:Number;
         var _g:Console;
         if(Boot.skip_constructor)
         {
            return;
         }
         _prompted = false;
         _metaCommands = {};
         specialPrefixed = [];
         combatMenu = Type.getClassName(Type.getClass(KGAMECLASS.kGAMECLASS.combat)) + "/combatMenu";
         doCamp = Type.getClassName(Type.getClass(KGAMECLASS.kGAMECLASS.camp)) + "/doCamp";
         _doAutoClear = false;
         _suggestions = [];
         _lastSuggestion = -1;
         _charsPerLine = 0;
         _charHeight = 0;
         _charWidth = 0;
         _locked = false;
         _lastLen = 0;
         _minLen = 0;
         super();
         _g = this;
         percent = 1;
         _g1 = this;
         percent1 = 0.75;
         var _loc3_:Function = function():void
         {
            _g1.setBGOpacity(percent1);
         };
         _metaCommands = {
            "_hidegame":{
               "func":function():void
               {
                  _g.setBGOpacity(percent);
               },
               "help":"如果默认UI在控制台后面渲染，则隐藏它"
            },
            "_showgame":{
               "func":_loc3_,
               "help":"将在控制台后面渲染默认UI，对调试很有用"
            },
            "_stats":{
               "func":showStats,
               "help":"显示玩家和怪物的属性"
            },
            "_debug":{
               "func":Console.callDebug,
               "help":"如果可能，打开调试菜单"
            },
            "_clear":{
               "func":clearScreen,
               "help":"清除并重新显示屏幕"
            },
            "_autoclear":{
               "func":toggleAutoClear,
               "help":"切换是否在每个场景调用 _clear"
            },
            "_tt":{
               "func":showToolTip,
               "help":"显示按钮的工具提示文本。支持Tab键补全。"
            },
            "_help":{
               "func":showHelp,
               "help":"显示此菜单"
            }
         };
         GameViewData.subscribe(this);
         _mainText = new TextField();
         _mainText.type = "dynamic";
         _mainText.width = param2;
         _mainText.height = param1;
         _mainText.wordWrap = true;
         _mainText.multiline = true;
         _mainText.selectable = true;
         _mainText.embedFonts = true;
         var _loc4_:TextFormat = _mainText.defaultTextFormat;
         _loc4_.font = Assets.getFont("res/fonts/SourceCodePro-Semibold.otf").name;
         _loc4_.color = 1550475;
         _loc4_.size = 16;
         _loc4_.leading = -4;
         _mainText.defaultTextFormat = _loc4_;
         _mainText.textColor = 1550475;
         addChild(_mainText);
         setBGOpacity(1);
         KGAMECLASS.kGAMECLASS.stage.addEventListener(KeyboardEvent.KEY_DOWN,onKeyDown,false,99);
         KGAMECLASS.kGAMECLASS.stage.addEventListener(FocusEvent.KEY_FOCUS_CHANGE,Console.onFocusChange);
         updateCharInfo();
      }
      
      public static function onFocusChange(param1:FocusEvent) : void
      {
         param1.preventDefault();
      }
      
      public static function callDebug() : Boolean
      {
         var _loc1_:InputManager = KGAMECLASS.kGAMECLASS.inputManager;
         _loc1_.KeyHandler(new KeyboardEvent("",true,false,0,68));
         _loc1_.KeyHandler(new KeyboardEvent("",true,false,0,69));
         _loc1_.KeyHandler(new KeyboardEvent("",true,false,0,66));
         _loc1_.KeyHandler(new KeyboardEvent("",true,false,0,85));
         _loc1_.KeyHandler(new KeyboardEvent("",true,false,0,71));
         return true;
      }
      
      public static function statDataText(param1:Object, param2:int, param3:int) : String
      {
         var _loc4_:String = "\n" + Console.padRight(param1.name,param2) + Console.padLeft(Std.string(Math.floor(Number(param1.value))),param3);
         if(Boolean(param1.showMax))
         {
            _loc4_ += "/" + Console.padLeft("" + Number(param1.max),param3);
         }
         return _loc4_;
      }
      
      public static function padLeft(param1:String, param2:int, param3:String = undefined) : String
      {
         if(param3 == null)
         {
            param3 = " ";
         }
         return StringUtil.repeat(param3,int(Math.max(0,param2 - param1.length))) + param1;
      }
      
      public static function padRight(param1:String, param2:int, param3:String = undefined) : String
      {
         if(param3 == null)
         {
            param3 = " ";
         }
         return param1 + StringUtil.repeat(param3,int(Math.max(0,param2 - param1.length)));
      }
      
      public static function get_timeText() : String
      {
         if(GameViewData.playerStatData == null)
         {
            return "";
         }
         var _loc1_:* = GameViewData.playerStatData.time;
         return "D" + int(_loc1_.day) + "@" + Console.padLeft(_loc1_.hour,2,"0") + ":" + _loc1_.minutes + _loc1_.ampm;
      }
      
      public static function needName() : Boolean
      {
         if(GameViewData.inputNeeded)
         {
            return GameViewData.inputText == "";
         }
         return false;
      }
      
      public static function availableLinks() : Array
      {
         var _loc1_:String = GameViewData.htmlText;
         var _loc2_:EReg = new EReg("<a href=\"event:([^\"]+)\">","gi");
         var _loc3_:Array = [];
         while(_loc2_.match(_loc1_))
         {
            _loc3_.push(_loc2_.matched(1));
            _loc1_ = _loc2_.matchedRight();
         }
         return _loc3_;
      }
      
      public static function colorUintToString(param1:uint) : String
      {
         var _loc2_:String = "#000000";
         var _loc3_:String = Utils.toRadix(param1,16);
         return _loc2_.substr(0,_loc2_.length - _loc3_.length) + _loc3_;
      }
      
      public static function relabelled(param1:ButtonData, param2:String) : ButtonData
      {
         return new ButtonData(Console.cleanLabel(param2),param1.callback,param1.toolTipText,param1.toolTipHeader,param1.enabled);
      }
      
      public static function cleanLabel(param1:String) : String
      {
         return new EReg("\\s","g").replace(param1,"-");
      }
      
      public function updateCharInfo() : void
      {
         var _loc1_:TextField = new TextField();
         _loc1_.defaultTextFormat = _mainText.defaultTextFormat;
         _loc1_.embedFonts = _mainText.embedFonts;
         _loc1_.appendText("W");
         _charWidth = _loc1_.textWidth;
         _charHeight = _loc1_.textHeight;
         _charsPerLine = Math.floor((width - 4) / _charWidth);
      }
      
      public function toggleAutoClear() : void
      {
         _doAutoClear = !_doAutoClear;
         appendColoredText(16151552,"\n自动清理已" + (_doAutoClear ? "开启" : "关闭"));
      }
      
      public function startupHelp() : void
      {
         _mainText.htmlText = "";
         showHelp();
         displayMain();
         showPrompt();
      }
      
      public function showToolTip(param1:String = undefined) : void
      {
         var _loc2_:String = "\n未知命令。用法：_tt [command]";
         if(param1 == null || param1.length <= 0)
         {
            appendColoredText(16151552,_loc2_);
            return;
         }
         param1 = StringUtil.trim(param1);
         var _loc3_:Array = getCommandButtons(param1,true);
         if(int(_loc3_.length) == 0)
         {
            appendColoredText(16151552,_loc2_);
            return;
         }
         var _loc4_:TextField = new TextField();
         var _loc5_:ButtonData = _loc3_[0];
         _loc4_.htmlText = KGAMECLASS.kGAMECLASS.parser.parse(_loc5_.toolTipHeader);
         appendColoredText(1939955,"\n" + _loc4_.text + "\n" + StringUtil.repeat("-",_loc4_.text.length));
         _loc4_.htmlText = KGAMECLASS.kGAMECLASS.parser.parse(_loc5_.toolTipText);
         appendColoredText(1550475,"\n" + _loc4_.text);
      }
      
      public function showStats() : void
      {
         var _loc6_:* = null;
         var _loc1_:String = "";
         var _loc2_:int = 0;
         var _loc3_:int = 0;
         var _loc4_:int = 0;
         var _loc5_:Array = GameViewData.playerStatData.stats;
         while(_loc4_ < int(_loc5_.length))
         {
            _loc6_ = _loc5_[_loc4_];
            _loc4_++;
            _loc2_ = int(Math.max(_loc2_,_loc6_.name.length));
            _loc3_ = int(Math.max(_loc3_,("" + Number(_loc6_.max)).length));
         }
         _loc2_ += 4;
         _loc4_ = 0;
         _loc5_ = GameViewData.playerStatData.stats;
         while(_loc4_ < int(_loc5_.length))
         {
            _loc6_ = _loc5_[_loc4_];
            _loc4_++;
            _loc1_ += Console.statDataText(_loc6_,_loc2_,_loc3_);
         }
         appendColoredText(1939955,_loc1_);
         showMonsterStats(_loc2_,_loc3_);
      }
      
      public function showPrompt() : void
      {
         _prompted = true;
         if(Console.needName())
         {
            appendColoredText(4490554,"\n名称:");
         }
         else
         {
            appendColoredText(4490554,"\n[" + Output.currentScene + "]" + Console.get_timeText() + ">");
         }
         appendColoredText(1550475," ");
         _minLen = _mainText.text.length;
         var _loc1_:Array = availableLabels();
         if(int(_loc1_.length) == 1)
         {
            appendColoredText(1550475,_loc1_[0]);
         }
      }
      
      public function showMonsterStats(param1:int = 0, param2:int = 0) : void
      {
         var _loc6_:* = null;
         var _loc7_:int = 0;
         var _loc8_:* = null as Array;
         var _loc9_:* = null;
         var _loc3_:String = "";
         var _loc4_:int = 0;
         var _loc5_:Array = GameViewData.monsterStatData;
         while(_loc4_ < int(_loc5_.length))
         {
            _loc6_ = _loc5_[_loc4_];
            _loc4_++;
            _loc7_ = 0;
            _loc8_ = _loc6_.stats;
            while(_loc7_ < int(_loc8_.length))
            {
               _loc9_ = _loc8_[_loc7_];
               _loc7_++;
               param1 = int(Math.max(param1,_loc9_.name.length));
               param2 = int(Math.max(param2,("" + Number(_loc9_.max)).length));
            }
            _loc3_ += "\n" + StringUtil.repeat("-",param1 + param2 + param2 + 1) + "\n" + _loc6_.name;
            _loc7_ = 0;
            _loc8_ = _loc6_.stats;
            while(_loc7_ < int(_loc8_.length))
            {
               _loc9_ = _loc8_[_loc7_];
               _loc7_++;
               _loc3_ += Console.statDataText(_loc9_,param1,param2);
            }
         }
         appendColoredText(16151552,_loc3_);
      }
      
      public function showHelp() : void
      {
         var _loc4_:* = null as String;
         var _loc5_:* = null;
         var _loc6_:* = null as String;
         appendColoredText(1550475,"\n在提示符下输入\"可用命令\"中列出的命令，然后按[enter]执行。" + "\n按[tab]将触发自动补全，再次按[tab]将在建议选项中循环切换。" + "\n\n元命令：");
         var _loc1_:int = 0;
         var _loc2_:int = 0;
         var _loc3_:Array = Reflect.fields(_metaCommands);
         while(_loc2_ < int(_loc3_.length))
         {
            _loc4_ = _loc3_[_loc2_];
            _loc2_++;
            _loc5_ = Reflect.field(_metaCommands,_loc4_);
            _loc6_ = Reflect.field(_loc5_,"cmd");
            _loc1_ = Utils.maxInt(_loc1_,_loc6_.length);
         }
         _loc1_ += 4;
         _loc2_ = 0;
         _loc3_ = Reflect.fields(_metaCommands);
         while(_loc2_ < int(_loc3_.length))
         {
            _loc4_ = _loc3_[_loc2_];
            _loc2_++;
            _loc5_ = Reflect.field(_metaCommands,_loc4_);
            _loc6_ = Reflect.field(_loc5_,"help");
            appendColoredText(10181046,"\n" + Console.padRight(_loc4_,_loc1_));
            appendColoredText(1550475,_loc6_);
         }
         appendColoredText(16151552,"\n\n要禁用控制台界面，请在调试菜单中选择\"控制台\"选项。");
      }
      
      public function showAvailableCommands() : void
      {
         var _loc1_:* = null as Array;
         if(!Console.needName())
         {
            appendColoredText(1550475,"\n\n可用命令有:");
            listCommands(availableLabels());
            _loc1_ = disabledLabels();
            if(int(_loc1_.length) > 0)
            {
               appendColoredText(1550475,"\n\n已禁用的命令有:");
               listCommands(disabledLabels());
            }
         }
      }
      
      public function setBGOpacity(param1:Number) : void
      {
         graphics.clear();
         var _loc2_:Graphics = graphics;
         var _loc3_:BitmapData = null;
         FlashGraphics.bitmapFill[_loc2_] = _loc3_;
         _loc2_.beginFill(1974825,param1);
         graphics.drawRect(0,0,width,height);
         _loc2_ = graphics;
         _loc3_ = null;
         FlashGraphics.bitmapFill[_loc2_] = _loc3_;
         _loc2_.endFill();
      }
      
      public function readCommand() : String
      {
         return StringUtil.trim(_mainText.text.substring(_minLen,_mainText.length));
      }
      
      public function onKeyDown(param1:KeyboardEvent = undefined) : void
      {
         var _loc5_:* = null as String;
         var _loc6_:Boolean = false;
         if(_locked)
         {
            param1.stopImmediatePropagation();
            return;
         }
         var _loc2_:int = _mainText.text.length;
         var _loc3_:int = int(param1.charCode);
         var _loc4_:String = _loc3_ < 65536 ? String["fromCharCode"](_loc3_) : Boot.fromCodePoint(_loc3_);
         switch(int(param1.charCode))
         {
            case 8:
               if(_loc2_ > _minLen)
               {
                  _mainText.replaceText(_loc2_ - 1,_loc2_,"");
               }
               break;
            case 9:
               autoComplete();
               break;
            case 13:
               _locked = true;
               _lastLen = _mainText.length;
               _loc6_ = handleCommand(readCommand());
               if(!_prompted)
               {
                  showPrompt();
               }
               _locked = false;
               if(_loc6_)
               {
                  flush();
               }
               break;
            default:
               _loc5_ = StringUtil.restrict(_loc4_," -~\n");
               if(_loc5_.length > 0)
               {
                  appendColoredText(1550475,_loc5_);
               }
         }
         if(param1.keyCode != 9)
         {
            _lastSuggestion = -1;
         }
         param1.stopImmediatePropagation();
      }
      
      public function normalButtons(param1:Boolean = true) : Array
      {
         var _loc5_:* = null as ButtonData;
         var _loc2_:Array = [];
         var _loc3_:int = 0;
         var _loc4_:Array = GameViewData.bottomButtons.concat(GameViewData.menuButtons);
         while(_loc3_ < int(_loc4_.length))
         {
            _loc5_ = _loc4_[_loc3_];
            _loc3_++;
            if(_loc5_.enabled == param1 && _loc5_.visible)
            {
               _loc2_.push(_loc5_);
            }
         }
         return _loc2_;
      }
      
      public function listCommands(param1:Array) : void
      {
         var _loc8_:* = null as String;
         var _loc2_:int = 5;
         var _loc3_:int = int(Math.floor(_charsPerLine / _loc2_));
         var _loc4_:int = _loc2_ * _loc3_;
         var _loc5_:String = "";
         var _loc6_:String = "";
         var _loc7_:int = 0;
         while(_loc7_ < int(param1.length))
         {
            _loc8_ = param1[_loc7_];
            _loc8_ = Console.padRight(_loc8_,int(Math.ceil(_loc8_.length / _loc3_) * _loc3_));
            if(_loc6_.length + _loc8_.length > _loc4_)
            {
               _loc5_ += "\n" + _loc6_;
               _loc6_ = "";
            }
            _loc6_ += _loc8_;
            _loc7_++;
         }
         _loc5_ += "\n" + _loc6_ + "\n";
         appendColoredText(1939955,_loc5_);
      }
      
      public function imageToAscii() : void
      {
         var _loc12_:int = 0;
         var _loc13_:int = 0;
         var _loc14_:uint = 0;
         var _loc15_:uint = 0;
         var _loc16_:* = null as String;
         updateCharInfo();
         var _loc1_:String = " .,:;i1tfLCG08@";
         var _loc2_:int = int(width - 4);
         var _loc3_:Number = _charsPerLine / _loc2_;
         var _loc4_:Matrix = new Matrix();
         _loc4_.scale(_loc3_,_loc3_ * _charWidth / _charHeight);
         var _loc5_:BitmapData = new GameLogo(0,0);
         var _loc6_:Number = _loc2_ / _loc5_.width;
         _loc4_.scale(_loc6_,_loc6_);
         var _loc7_:BitmapData = new BitmapData(int(_loc5_.width * _loc4_.a),int(_loc5_.height * _loc4_.d),true,0);
         var _loc8_:ColorTransform = new ColorTransform(1,1,1);
         _loc7_.draw(_loc5_,_loc4_,_loc8_,null,null,true);
         var _loc9_:uint = uint(int(_loc7_.getPixel(0,0)));
         var _loc10_:String = "<FONT COLOR=\'" + Console.colorUintToString(_loc9_) + "\'>";
         var _loc11_:int = 0;
         while(_loc11_ < _loc7_.height)
         {
            _loc12_ = 0;
            while(_loc12_ < _loc7_.width)
            {
               _loc13_ = int(_loc7_.getPixel32(_loc12_,_loc11_));
               _loc14_ = uint(_loc13_ >> 24 & 0xFF);
               _loc15_ = uint(_loc13_ & 0xFFFFFF);
               _loc16_ = _loc1_.charAt(int(Math.round(_loc14_ / 255 * (_loc1_.length - 1))));
               if(_loc15_ != _loc9_)
               {
                  _loc10_ += "</FONT><FONT COLOR=\'" + Console.colorUintToString(_loc15_) + "\'>";
                  _loc9_ = _loc15_;
               }
               _loc10_ += _loc16_;
               _loc12_++;
            }
            _loc10_ += "\n";
            _loc11_++;
         }
         _loc10_ += "</FONT>";
         _mainText.htmlText = "";
         _mainText.htmlText = _loc10_;
      }
      
      public function handleStorage() : void
      {
         var _loc3_:* = null;
         var _loc4_:* = null as Array;
         var _loc5_:int = 0;
         var _loc6_:* = null as Array;
         var _loc7_:* = null as ButtonData;
         specialPrefixed = [];
         var _loc1_:int = 0;
         var _loc2_:Array = GameViewData.stashData;
         while(_loc1_ < int(_loc2_.length))
         {
            _loc3_ = _loc2_[_loc1_];
            _loc1_++;
            appendColoredText(1550475,"\n" + new EReg("</?b>","g").replace(_loc3_.description,""));
            _loc4_ = [];
            _loc5_ = 0;
            _loc6_ = _loc3_.buttons;
            while(_loc5_ < int(_loc6_.length))
            {
               _loc7_ = _loc6_[_loc5_];
               _loc5_++;
               _loc4_.push(_loc7_.text);
            }
            listCommands(_loc4_);
            _loc5_ = 0;
            _loc6_ = _loc3_.buttons;
            while(_loc5_ < int(_loc6_.length))
            {
               _loc7_ = _loc6_[_loc5_];
               _loc5_++;
               specialPrefixed.push(Console.relabelled(_loc7_,"take:" + _loc7_.text));
            }
         }
      }
      
      public function handleMainMenu() : void
      {
         var _loc4_:* = null as ButtonData;
         imageToAscii();
         var _loc1_:Array = [];
         var _loc2_:int = 0;
         var _loc3_:Array = GameViewData.menuData;
         while(_loc2_ < int(_loc3_.length))
         {
            _loc4_ = _loc3_[_loc2_];
            _loc2_++;
            _loc1_.push(Console.relabelled(_loc4_,_loc4_.text));
         }
         specialPrefixed = _loc1_;
      }
      
      public function handleEnterSettings() : void
      {
         var _loc4_:* = null as SettingData;
         var _loc5_:int = 0;
         var _loc6_:* = null as Array;
         var _loc7_:* = null as ButtonData;
         specialPrefixed = [];
         var _loc1_:String = "";
         var _loc2_:int = 0;
         var _loc3_:Array = GameViewData.settingPaneData.settings;
         while(_loc2_ < int(_loc3_.length))
         {
            _loc4_ = _loc3_[_loc2_];
            _loc2_++;
            if(_loc4_.get_label() != "")
            {
               _loc1_ += "\n\n" + _loc4_.name + ": " + _loc4_.currentValue + "\n" + _loc4_.get_label();
            }
            _loc5_ = 0;
            _loc6_ = _loc4_.get_buttons();
            while(_loc5_ < int(_loc6_.length))
            {
               _loc7_ = _loc6_[_loc5_];
               _loc5_++;
               specialPrefixed.push(Console.relabelled(_loc7_,StringUtil.trim(_loc4_.name + ":" + _loc7_.text)));
            }
         }
         appendColoredText(1550475,_loc1_);
      }
      
      public function handleDungeonMap() : Boolean
      {
         var _loc2_:int = 0;
         var _loc3_:* = null as Array;
         var _loc4_:* = null as Array;
         var _loc5_:int = 0;
         var _loc6_:* = null as String;
         var _loc7_:* = null as String;
         var _loc8_:* = null as TextField;
         var _loc1_:MapData = GameViewData.mapData;
         switch(_loc1_.index)
         {
            case 0:
               _loc2_ = int(_loc1_.params[0]);
               _loc3_ = _loc1_.params[1];
               _loc4_ = _loc1_.params[2];
               _loc5_ = int(_loc1_.params[3]);
               return handleAlternativeMap(_loc2_,_loc3_,_loc4_,_loc5_);
            case 1:
               _loc6_ = _loc1_.params[0];
               _loc7_ = _loc1_.params[1];
               _loc8_ = new TextField();
               _loc8_.htmlText = _loc6_ + _loc7_;
               appendColoredText(1550475,"\n" + _loc8_.text);
               return true;
            default:
               return;
         }
      }
      
      public function handleCommand(param1:String) : Boolean
      {
         var _loc6_:* = null as String;
         var _loc7_:* = null;
         var _loc8_:* = null as ArgumentError;
         _prompted = false;
         if(Console.needName())
         {
            KGAMECLASS.kGAMECLASS.mainView.nameBox.text = param1;
            GameViewData.inputText = param1;
            if(!Console.needName())
            {
               showAvailableCommands();
            }
            return false;
         }
         var _loc3_:String = param1.toLowerCase();
         var _loc4_:Array = new EReg("\\s+","g").split(_loc3_);
         var _loc5_:Array = Reflect.fields(_metaCommands);
         if(!(_loc5_.contains(_loc3_) || int(_loc4_.length) > 1 && Boolean(_loc5_.contains(_loc4_[0]))))
         {
            var _loc9_:Array = getCommandButtons(_loc3_);
            if(int(_loc9_.length) >= 1)
            {
               return true;
            }
            var _loc10_:Array = [];
            var _loc11_:int = 0;
            var _loc12_:Array = Console.availableLinks();
            while(_loc11_ < int(_loc12_.length))
            {
               _loc6_ = _loc12_[_loc11_];
               _loc11_++;
               if(_loc6_.toLowerCase() == _loc3_)
               {
                  _loc10_.push(_loc6_);
               }
            }
            _loc12_ = _loc10_;
            if(int(_loc12_.length) > 0)
            {
               stage.dispatchEvent(new TextEvent(TextEvent.LINK,false,false,_loc12_[0]));
               return true;
            }
            if(param1.length > 0)
            {
               appendColoredText(1550475,"\n指令\"" + param1 + "\"无法识别。");
               showAvailableCommands();
            }
            return false;
         }
         _loc6_ = _loc4_.shift();
         _loc7_ = Reflect.field(Reflect.field(_metaCommands,_loc6_),"func");
         try
         {
            return _loc7_.apply(this,_loc4_);
         }
         catch(_loc_e_:ArgumentError)
         {
            _loc8_ = _loc_e_;
            appendColoredText(16151552,"该命令提供的参数过多！");
            return false;
         }
      }
      
      public function handleAlternativeMap(param1:int, param2:Array, param3:Array, param4:int) : Boolean
      {
         var _loc7_:* = null as String;
         var _loc10_:* = null as String;
         var _loc11_:* = null as String;
         var _loc12_:* = null as String;
         var _loc13_:int = 0;
         var _loc14_:int = 0;
         var _loc15_:int = 0;
         var _loc16_:int = 0;
         var _loc17_:uint = 0;
         var _loc18_:* = null as String;
         var _loc19_:* = null as String;
         var _loc20_:* = null as String;
         var _loc21_:* = null as String;
         var _loc5_:String = "   ";
         var _loc6_:String = "";
         var _loc8_:IMap = new StringMap();
         var _loc9_:int = 0;
         while(_loc9_ < int(param2.length))
         {
            _loc10_ = "";
            _loc11_ = "";
            _loc12_ = "";
            _loc13_ = 0;
            _loc14_ = param1;
            while(_loc13_ < _loc14_)
            {
               _loc15_ = _loc13_++;
               _loc16_ = _loc9_ + _loc15_;
               if(int(param2[_loc16_]) == 1 || int(param2[_loc16_]) == -1)
               {
                  _loc10_ += _loc5_;
                  _loc11_ += _loc5_;
                  _loc12_ += _loc5_;
                  _loc9_ += param1;
               }
               else
               {
                  if(param4 == _loc16_)
                  {
                     _loc7_ = "@";
                  }
                  else
                  {
                     switch(int(param2[_loc16_]))
                     {
                        case 0:
                           _loc7_ = " ";
                           break;
                        case 2:
                           _loc7_ = "L";
                           break;
                        case 3:
                           _loc7_ = "^";
                           break;
                        case 4:
                           _loc7_ = "v";
                           break;
                        case 5:
                           _loc7_ = "Z";
                           break;
                        case 6:
                           _loc7_ = "N";
                           break;
                        case 7:
                           _loc7_ = "T";
                           break;
                        default:
                           _loc7_ = "?";
                     }
                  }
                  if(_loc7_ in StringMap.reserved)
                  {
                     _loc8_.setReserved(_loc7_,true);
                  }
                  else
                  {
                     _loc8_.h[_loc7_] = true;
                  }
                  _loc17_ = uint(param3[_loc16_]);
                  _loc18_ = uint((_loc17_ & 1) - (_loc17_ & 0x10)) > 0 ? "┴" : "─";
                  _loc19_ = uint((_loc17_ & 2) - (_loc17_ & 0x20)) > 0 ? "┬" : "─";
                  _loc20_ = uint((_loc17_ & 4) - (_loc17_ & 0x40)) > 0 ? "├" : "│";
                  _loc21_ = uint((_loc17_ & 8) - (_loc17_ & 0x80)) > 0 ? "┤" : "│";
                  _loc10_ += "┌" + _loc18_ + "┐";
                  _loc11_ += "" + _loc21_ + _loc7_ + _loc20_;
                  _loc12_ += "└" + _loc19_ + "┘";
               }
            }
            if(StringUtil.trim(_loc10_).length > 0)
            {
               _loc6_ += "\n" + _loc10_ + "\n" + _loc11_ + "\n" + _loc12_;
            }
            _loc9_ += param1;
         }
         var _loc22_:IMap = new StringMap();
         if("@" in StringMap.reserved)
         {
            _loc22_.setReserved("@","玩家");
         }
         else
         {
            _loc22_.h["@"] = "玩家";
         }
         if("L" in StringMap.reserved)
         {
            _loc22_.setReserved("L","上锁的房间");
         }
         else
         {
            _loc22_.h["L"] = "上锁的房间";
         }
         if("^" in StringMap.reserved)
         {
            _loc22_.setReserved("^","向上的楼梯");
         }
         else
         {
            _loc22_.h["^"] = "向上的楼梯";
         }
         if("v" in StringMap.reserved)
         {
            _loc22_.setReserved("v","向下的楼梯");
         }
         else
         {
            _loc22_.h["v"] = "向下的楼梯";
         }
         if("Z" in StringMap.reserved)
         {
            _loc22_.setReserved("Z","上下楼梯");
         }
         else
         {
            _loc22_.h["Z"] = "上下楼梯";
         }
         if("N" in StringMap.reserved)
         {
            _loc22_.setReserved("N","NPC");
         }
         else
         {
            _loc22_.h["N"] = "NPC";
         }
         if("T" in StringMap.reserved)
         {
            _loc22_.setReserved("T","商人");
         }
         else
         {
            _loc22_.h["T"] = "商人";
         }
         if("?" in StringMap.reserved)
         {
            _loc22_.setReserved("?","未知");
         }
         else
         {
            _loc22_.h["?"] = "未知";
         }
         var _loc23_:IMap = _loc22_;
         _loc10_ = "";
         var _loc24_:IMap = _loc23_;
         var _loc25_:IMap = _loc24_;
         var _loc26_:* = _loc24_.keys();
         while(Boolean(_loc26_.hasNext()))
         {
            _loc11_ = _loc26_.next();
            _loc12_ = _loc25_.get(_loc11_);
            _loc18_ = _loc11_;
            _loc19_ = _loc18_;
            _loc20_ = _loc12_;
            if(_loc19_ in StringMap.reserved ? Boolean(_loc8_.existsReserved(_loc19_)) : _loc19_ in _loc8_.h)
            {
               _loc10_ += "\n" + _loc19_ + " - " + _loc20_;
            }
         }
         if(_loc10_.length > 0)
         {
            _loc6_ += "\n图例：" + _loc10_;
         }
         appendColoredText(1550475,_loc6_);
         return true;
      }
      
      public function getCommandButtons(param1:String, param2:Boolean = false) : Array
      {
         var _loc7_:* = null as ButtonData;
         var _loc3_:Array = normalButtons();
         if(param2)
         {
            _loc3_ = _loc3_.concat(normalButtons(false));
         }
         var _loc4_:Array = [];
         var _loc5_:int = 0;
         var _loc6_:Array = specialPrefixed;
         while(_loc5_ < int(_loc6_.length))
         {
            _loc7_ = _loc6_[_loc5_];
            _loc5_++;
            if(_loc7_.visible && (_loc7_.enabled || param2))
            {
               _loc4_.push(_loc7_);
            }
         }
         _loc6_ = _loc4_;
         _loc3_ = _loc3_.concat(_loc6_);
         var _loc8_:Array = [];
         _loc5_ = 0;
         var _loc9_:Array = _loc3_;
         while(_loc5_ < int(_loc9_.length))
         {
            _loc7_ = _loc9_[_loc5_];
            _loc5_++;
            if(StringUtil.trim(new EReg("\\s","g").replace(_loc7_.text,"-").toLowerCase()) == param1.toLowerCase())
            {
               _loc8_.push(_loc7_);
            }
         }
         return _loc8_;
      }
      
      public function flush() : void
      {
         if(_locked)
         {
            return;
         }
         _mainText.replaceText(_lastLen,_mainText.length,"");
         displayMain();
         showPrompt();
      }
      
      public function dispose() : void
      {
         KGAMECLASS.kGAMECLASS.stage.removeEventListener(KeyboardEvent.KEY_DOWN,onKeyDown);
         KGAMECLASS.kGAMECLASS.stage.removeEventListener(FocusEvent.KEY_FOCUS_CHANGE,Console.onFocusChange);
         GameViewData.unsubscribe(this);
      }
      
      public function displayMain() : void
      {
         var _loc1_:* = null as String;
         var _loc3_:* = null as TextField;
         var _loc5_:int = 0;
         var _loc6_:* = null as Array;
         var _loc7_:* = null;
         var _loc8_:* = null as String;
         var _loc9_:* = null as String;
         var _loc10_:Number = NaN;
         var _loc11_:* = null as String;
         var _loc12_:* = null as Array;
         if(_doAutoClear)
         {
            _mainText.htmlText = "";
         }
         specialPrefixed = [];
         var _loc2_:Boolean = false;
         switch(GameViewData.screenType.index)
         {
            case 0:
               _loc2_ = false;
               break;
            case 1:
               handleMainMenu();
               break;
            case 2:
               handleEnterSettings();
               break;
            case 3:
               handleStorage();
               break;
            case 4:
               _loc2_ = handleDungeonMap();
         }
         if(!_loc2_)
         {
            _loc3_ = new TextField();
            _loc3_.htmlText = new EReg("\r","g").replace(GameViewData.htmlText,"\n");
            _loc1_ = _loc3_.text;
            _loc1_ = new EReg("\\x{2019}","g").replace(_loc1_,"\'");
            _loc1_ = new EReg("\\x{201D}","g").replace(_loc1_,"\"");
            _loc1_ = new EReg("\\x{201D}","g").replace(_loc1_,"\"");
            _loc1_ = new EReg("\\x{2014}","g").replace(_loc1_,"--");
            _loc1_ = new EReg("\\x{2500}","g").replace(_loc1_,"-");
            _loc1_ = new EReg("\r","g").replace(_loc1_,"\n");
            _loc1_ = StringUtil.restrict(_loc1_," -~\n");
            appendColoredText(1550475,"\n" + _loc1_);
         }
         _loc1_ = "";
         var _loc4_:* = GameViewData.playerStatData;
         if((_loc4_ != null ? _loc4_.stats : null) != null)
         {
            _loc5_ = 0;
            _loc6_ = GameViewData.playerStatData.stats;
            while(_loc5_ < int(_loc6_.length))
            {
               _loc7_ = _loc6_[_loc5_];
               _loc5_++;
               if(!(_loc7_.name == "Level:" || !(Boolean(_loc7_.isUp) ? Boolean(_loc7_.isUp) : Boolean(_loc7_.isDown))))
               {
                  _loc8_ = StringTools.replace(_loc7_.name,":","");
                  _loc9_ = Boolean(_loc7_.isUp) ? "增加了" : "减少了";
                  _loc10_ = Math.floor(Number(_loc7_.value));
                  _loc11_ = Boolean(_loc7_.showMax) ? "/" + Number(_loc7_.max) : "";
                  _loc1_ += "\nYour " + _loc8_ + " has " + _loc9_ + " to " + _loc10_ + _loc11_;
               }
            }
         }
         if(Output.currentScene == doCamp)
         {
            _loc6_ = [];
            _loc5_ = 0;
            _loc12_ = GameViewData.playerStatData.stats;
            while(_loc5_ < int(_loc12_.length))
            {
               _loc7_ = _loc12_[_loc5_];
               _loc5_++;
               if(_loc7_.name == "Level:")
               {
                  _loc6_.push(_loc7_);
               }
            }
            _loc7_ = _loc6_[0];
            if(Boolean(_loc7_.isUp))
            {
               _loc1_ += "\n你有足够的经验值升级。";
            }
         }
         if(_loc1_.length > 0)
         {
            appendColoredText(1939955,"\n" + _loc1_);
         }
         if(Output.currentScene == combatMenu)
         {
            showMonsterStats();
         }
         showAvailableCommands();
      }
      
      public function disabledLabels() : Array
      {
         var _loc5_:* = null as ButtonData;
         var _loc1_:Function = Console.labelMap;
         var _loc2_:Array = [];
         var _loc3_:int = 0;
         var _loc4_:Array = normalButtons(false);
         while(_loc3_ < int(_loc4_.length))
         {
            _loc5_ = _loc4_[_loc3_];
            _loc3_++;
            _loc2_.push(_loc1_(_loc5_));
         }
         return _loc2_;
      }
      
      public function clearScreen() : void
      {
         _mainText.htmlText = "";
         displayMain();
      }
      
      public function clear() : void
      {
         _prompted = false;
         if(_doAutoClear)
         {
            _mainText.htmlText = "";
            _lastLen = _mainText.length;
         }
         if(_locked)
         {
            return;
         }
         _lastLen = _mainText.length;
      }
      
      public function availableLabels() : Array
      {
         var _loc5_:* = null as ButtonData;
         var _loc1_:Array = normalButtons();
         var _loc2_:Array = [];
         var _loc3_:int = 0;
         var _loc4_:Array = specialPrefixed;
         while(_loc3_ < int(_loc4_.length))
         {
            _loc5_ = _loc4_[_loc3_];
            _loc3_++;
            if(_loc5_.enabled && _loc5_.visible)
            {
               _loc2_.push(_loc5_);
            }
         }
         _loc4_ = _loc1_.concat(_loc2_);
         var _loc6_:Array = [];
         _loc3_ = 0;
         while(_loc3_ < int(_loc4_.length))
         {
            _loc5_ = _loc4_[_loc3_];
            _loc3_++;
            _loc6_.push(Console.labelMap(_loc5_));
         }
         return _loc6_.concat(Console.availableLinks());
      }
      
      public function autoComplete() : void
      {
         var _loc1_:* = null as String;
         var _loc2_:* = null as String;
         var _loc3_:* = null as EReg;
         var _loc4_:* = null as Array;
         var _loc5_:int = 0;
         var _loc6_:* = null as Array;
         var _loc7_:* = null as String;
         var _loc8_:* = null as Array;
         if(Console.needName())
         {
            return;
         }
         if(_lastSuggestion < 0)
         {
            _loc1_ = readCommand();
            _loc2_ = "";
            if(new EReg("^_tt","").match(_loc1_))
            {
               _loc2_ = "_tt ";
               _loc1_ = StringUtil.trim(_loc1_.substr(4));
            }
            _loc3_ = new EReg("^" + _loc1_,"i");
            _suggestions = availableLabels();
            if(_loc2_ == "_tt ")
            {
               _suggestions = _suggestions.concat(disabledLabels());
            }
            _loc4_ = [];
            _loc5_ = 0;
            _loc6_ = _suggestions;
            while(_loc5_ < int(_loc6_.length))
            {
               _loc7_ = _loc6_[_loc5_];
               _loc5_++;
               if(_loc3_.match(_loc7_))
               {
                  _loc4_.push(_loc7_);
               }
            }
            _loc6_ = [];
            _loc5_ = 0;
            _loc8_ = _loc4_;
            while(_loc5_ < int(_loc8_.length))
            {
               _loc7_ = _loc8_[_loc5_];
               _loc5_++;
               _loc6_.push(_loc2_ + _loc7_);
            }
            _suggestions = _loc6_;
         }
         if(int(_suggestions.length) > 0)
         {
            _lastSuggestion = int((_lastSuggestion + 1) % int(_suggestions.length));
            _mainText.replaceText(_minLen,_mainText.length,_suggestions[_lastSuggestion]);
         }
      }
      
      public function appendColoredText(param1:uint, param2:String) : void
      {
         var _loc3_:int = _mainText.text.length;
         _mainText.appendText(param2);
         if(_loc3_ == _mainText.length)
         {
            return;
         }
         var _loc4_:TextFormat = _mainText.getTextFormat(_loc3_,_mainText.length);
         _loc4_.color = param1;
         _mainText.setTextFormat(_loc4_,_loc3_,_mainText.text.length);
         _mainText.setSelection(_mainText.length,_mainText.length);
      }
   }
}

