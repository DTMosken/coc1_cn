package classes
{
   import classes._FlagDict.FlagDict_Impl_;
   import classes.globalFlags.KFLAGS;
   import classes.internals.Profiling;
   import classes.internals.Utils;
   import classes.items.ArmorLib;
   import classes.items.ConsumableLib;
   import classes.items.JewelryLib;
   import classes.items.ShieldLib;
   import classes.items.UndergarmentLib;
   import classes.items.UseableLib;
   import classes.items.WeaponLib;
   import classes.menus.GenderDebug;
   import classes.scenes.Inventory;
   import coc.view.ButtonData;
   import coc.view.ButtonDataList;
   import coc.view.CoCButton;
   import coc.view.CoCScrollPane;
   import coc.view.Console;
   import coc.view.MainView;
   import coc.view.selfDebug.DebugComp;
   import coc.view.selfDebug.DebuggableSave;
   import com.bit101.components.HBox;
   import com.bit101.components.VBox;
   import com.bit101.components.Window;
   import flash.Boot;
   import flash.display.BitmapData;
   import flash.display.DisplayObject;
   import flash.display.DisplayObjectContainer;
   import flash.display.Graphics;
   import flash.display.Sprite;
   import flash.events.Event;
   import flash.events.KeyboardEvent;
   import flash.events.MouseEvent;
   import flash.events.TextEvent;
   import flash.text.TextField;
   import haxe.Exception;
   import haxe.Log;
   import haxe.Serializer;
   import haxe.Unserializer;
   import openfl.display._internal.FlashGraphics;
   
   public class DebugMenu extends BaseContent
   {
      
      public static var init__:Boolean;
      
      public static var COLOR_CONSTANTS:Array;
      
      public static var SKIN_ADJ_CONSTANTS:Array;
      
      public static var SKIN_DESC_CONSTANTS:Array;
      
      public static var HAIR_LENGTH_CONSTANTS:Array;
      
      public static var HORN_COUNT_CONSTANTS:Array;
      
      public static var BEARD_LENGTH_CONSTANTS:Array;
      
      public static var TAIL_COUNT_CONSTANTS:Array;
      
      public static var LEG_COUNT_CONSTANTS:Array;
      
      public static var selfDebugClasses:Array = [];
      
      public static var SKIN_TYPE_CONSTANTS:Array = [{
         "value":0,
         "label":"(0) PLAIN"
      },{
         "value":1,
         "label":"(1) FUR"
      },{
         "value":2,
         "label":"(2) LIZARD_SCALES"
      },{
         "value":3,
         "label":"(3) GOO"
      },{
         "value":4,
         "label":"(4) UNDEFINED"
      },{
         "value":5,
         "label":"(5) DRAGON_SCALES"
      },{
         "value":6,
         "label":"(6) FISH_SCALES"
      },{
         "value":7,
         "label":"(7) WOOL"
      },{
         "value":8,
         "label":"(8) FEATHERED"
      },{
         "value":10,
         "label":"(10) STALK"
      },{
         "value":11,
         "label":"(11) WOODEN"
      }];
      
      public static var HAIR_TYPE_CONSTANTS:Array = [{
         "value":0,
         "label":"(0) 普通"
      },{
         "value":1,
         "label":"(1) 羽毛"
      },{
         "value":2,
         "label":"(2) 幽灵"
      },{
         "value":3,
         "label":"(3) 凝胶"
      },{
         "value":4,
         "label":"(4) 海葵"
      },{
         "value":5,
         "label":"(5) 尖刺"
      },{
         "value":6,
         "label":"(6) 蛇怪棘刺"
      },{
         "value":7,
         "label":"(7) 蛇怪羽冠"
      },{
         "value":8,
         "label":"(8) 羊毛"
      },{
         "value":10,
         "label":"(10) 藤蔓"
      }];
      
      public static var FACE_TYPE_CONSTANTS:Array = [{
         "value":0,
         "label":"(0) 人类"
      },{
         "value":1,
         "label":"(1) 马"
      },{
         "value":2,
         "label":"(2) 狗"
      },{
         "value":3,
         "label":"(3) 牛/牛头人"
      },{
         "value":4,
         "label":"(4) 鲨鱼牙"
      },{
         "value":5,
         "label":"(5) 蛇牙"
      },{
         "value":6,
         "label":"(6) 猫娘"
      },{
         "value":7,
         "label":"(7) 蜥蜴"
      },{
         "value":8,
         "label":"(8) 兔子"
      },{
         "value":9,
         "label":"(9) 袋鼠"
      },{
         "value":10,
         "label":"(10) 蜘蛛牙"
      },{
         "value":11,
         "label":"(11) 狐狸"
      },{
         "value":12,
         "label":"(12) 龙"
      },{
         "value":13,
         "label":"(13) 浣熊面纹"
      },{
         "value":14,
         "label":"(14) 浣熊"
      },{
         "value":15,
         "label":"(15) 龅牙"
      },{
         "value":16,
         "label":"(16) 老鼠"
      },{
         "value":17,
         "label":"(17) 雪貂面纹"
      },{
         "value":18,
         "label":"(18) 雪貂"
      },{
         "value":19,
         "label":"(19) 猪"
      },{
         "value":20,
         "label":"(20) 野猪"
      },{
         "value":21,
         "label":"(21) 犀牛"
      },{
         "value":22,
         "label":"(22) 针鼹"
      },{
         "value":23,
         "label":"(23) 鹿"
      },{
         "value":24,
         "label":"(24) 狼"
      },{
         "value":25,
         "label":"(25) 鸡蛇"
      },{
         "value":27,
         "label":"(27) 小熊猫"
      },{
         "value":28,
         "label":"(28) 猫"
      }];
      
      public static var TONGUE_TYPE_CONSTANTS:Array = [{
         "value":0,
         "label":"(0) 人类"
      },{
         "value":1,
         "label":"(1) 蛇"
      },{
         "value":2,
         "label":"(2) 恶魔"
      },{
         "value":3,
         "label":"(3) 龙"
      },{
         "value":4,
         "label":"(4) 针鼹"
      },{
         "value":5,
         "label":"(5) 蜥蜴"
      },{
         "value":6,
         "label":"(6) 猫"
      }];
      
      public static var EYE_TYPE_CONSTANTS:Array = [{
         "value":0,
         "label":"(0) 人类"
      },{
         "value":2,
         "label":"(2) 蚁狮黑眼"
      },{
         "value":3,
         "label":"(3) 蜥蜴"
      },{
         "value":4,
         "label":"(4) 龙"
      },{
         "value":5,
         "label":"(5) 蛇怪"
      },{
         "value":6,
         "label":"(6) 狼"
      },{
         "value":7,
         "label":"(7) 蜘蛛"
      },{
         "value":8,
         "label":"(8) 鸡蛇"
      },{
         "value":9,
         "label":"(9) 猫"
      }];
      
      public static var EAR_TYPE_CONSTANTS:Array = [{
         "value":0,
         "label":"(0) 人类"
      },{
         "value":1,
         "label":"(1) 马"
      },{
         "value":2,
         "label":"(2) 狗"
      },{
         "value":3,
         "label":"(3) 牛"
      },{
         "value":4,
         "label":"(4) 精灵"
      },{
         "value":5,
         "label":"(5) 猫"
      },{
         "value":6,
         "label":"(6) 蜥蜴"
      },{
         "value":7,
         "label":"(7) 兔子"
      },{
         "value":8,
         "label":"(8) 袋鼠"
      },{
         "value":9,
         "label":"(9) 狐狸"
      },{
         "value":10,
         "label":"(10) 龙"
      },{
         "value":11,
         "label":"(11) 浣熊"
      },{
         "value":12,
         "label":"(12) 老鼠"
      },{
         "value":13,
         "label":"(13) 雪貂"
      },{
         "value":14,
         "label":"(14) 猪"
      },{
         "value":15,
         "label":"(15) 犀牛"
      },{
         "value":16,
         "label":"(16) 针鼹"
      },{
         "value":17,
         "label":"(17) 鹿"
      },{
         "value":18,
         "label":"(18) 狼"
      },{
         "value":19,
         "label":"(19) 绵羊"
      },{
         "value":20,
         "label":"(20) 小恶魔"
      },{
         "value":21,
         "label":"(21) 鸡蛇"
      },{
         "value":22,
         "label":"(22) 小熊猫"
      }];
      
      public static var HORN_TYPE_CONSTANTS:Array = [{
         "value":0,
         "label":"(0) 无"
      },{
         "value":1,
         "label":"(1) 恶魔"
      },{
         "value":2,
         "label":"(2) 牛头怪"
      },{
         "value":3,
         "label":"(3) 龙角x2"
      },{
         "value":4,
         "label":"(4) 龙角x4(12英寸长)"
      },{
         "value":5,
         "label":"(5) 鹿角"
      },{
         "value":6,
         "label":"(6) 山羊"
      },{
         "value":7,
         "label":"(7) 独角兽"
      },{
         "value":8,
         "label":"(8) 犀牛"
      },{
         "value":9,
         "label":"(9) 绵羊"
      },{
         "value":10,
         "label":"(10) 公羊"
      },{
         "value":11,
         "label":"(11) 小恶魔"
      },{
         "value":12,
         "label":"(12) 木头"
      },{
         "value":13,
         "label":"(13) 羚羊"
      }];
      
      public static var ANTENNA_TYPE_CONSTANTS:Array = [{
         "value":0,
         "label":"(0) 无"
      },{
         "value":2,
         "label":"(2) 蜜蜂"
      },{
         "value":3,
         "label":"(3) 鸡蛇"
      }];
      
      public static var GILLS_TYPE_CONSTANTS:Array = [{
         "value":0,
         "label":"(0) 无"
      },{
         "value":1,
         "label":"(1) 海葵"
      },{
         "value":2,
         "label":"(2) 鱼"
      },{
         "value":3,
         "label":"(3) 人鱼"
      }];
      
      public static var BEARD_STYLE_CONSTANTS:Array = [{
         "value":0,
         "label":"(0) 正常"
      },{
         "value":1,
         "label":"(1) 山羊胡"
      },{
         "value":2,
         "label":"(2) 干净"
      },{
         "value":3,
         "label":"(3) 粗犷"
      }];
      
      public static var ARM_TYPE_CONSTANTS:Array = [{
         "value":0,
         "label":"(0) 人类"
      },{
         "value":1,
         "label":"(1) 哈比"
      },{
         "value":2,
         "label":"(2) 蜘蛛"
      },{
         "value":3,
         "label":"(3) 蜜蜂"
      },{
         "value":5,
         "label":"(5) 蝾螈"
      },{
         "value":6,
         "label":"(6) 狼"
      }];
      
      public static var CLAW_TYPE_CONSTANTS:Array = [{
         "value":0,
         "label":"(0) NORMAL"
      },{
         "value":1,
         "label":"(1) LIZARD"
      },{
         "value":2,
         "label":"(2) DRAGON"
      },{
         "value":3,
         "label":"(3) SALAMANDER"
      },{
         "value":4,
         "label":"(4) CAT"
      },{
         "value":5,
         "label":"(5) DOG"
      },{
         "value":6,
         "label":"(6) FOX"
      },{
         "value":7,
         "label":"(7) MANTIS"
      },{
         "value":8,
         "label":"(8) IMP"
      },{
         "value":9,
         "label":"(9) COCKATRICE"
      },{
         "value":10,
         "label":"(10) RED PANDA"
      },{
         "value":11,
         "label":"(11) FERRET"
      },{
         "value":12,
         "label":"(12) WOLF"
      }];
      
      public static var TAIL_TYPE_CONSTANTS:Array = [{
         "value":0,
         "label":"(0) NONE"
      },{
         "value":1,
         "label":"(1) HORSE"
      },{
         "value":2,
         "label":"(2) DOG"
      },{
         "value":3,
         "label":"(3) DEMONIC"
      },{
         "value":4,
         "label":"(4) COW"
      },{
         "value":5,
         "label":"(5) SPIDER_ADBOMEN"
      },{
         "value":6,
         "label":"(6) BEE_ABDOMEN"
      },{
         "value":7,
         "label":"(7) SHARK"
      },{
         "value":8,
         "label":"(8) CAT"
      },{
         "value":9,
         "label":"(9) LIZARD"
      },{
         "value":10,
         "label":"(10) RABBIT"
      },{
         "value":11,
         "label":"(11) HARPY"
      },{
         "value":12,
         "label":"(12) KANGAROO"
      },{
         "value":13,
         "label":"(13) FOX"
      },{
         "value":14,
         "label":"(14) DRACONIC"
      },{
         "value":15,
         "label":"(15) RACCOON"
      },{
         "value":16,
         "label":"(16) MOUSE"
      },{
         "value":17,
         "label":"(17) FERRET"
      },{
         "value":19,
         "label":"(19) PIG"
      },{
         "value":20,
         "label":"(20) SCORPION"
      },{
         "value":21,
         "label":"(21) GOAT"
      },{
         "value":22,
         "label":"(22) RHINO"
      },{
         "value":23,
         "label":"(23) ECHIDNA"
      },{
         "value":24,
         "label":"(24) DEER"
      },{
         "value":25,
         "label":"(25) SALAMANDER"
      },{
         "value":26,
         "label":"(26) WOLF"
      },{
         "value":27,
         "label":"(27) SHEEP"
      },{
         "value":28,
         "label":"(28) IMP"
      },{
         "value":29,
         "label":"(29) COCKATRICE"
      },{
         "value":30,
         "label":"(30) RED_PANDA"
      }];
      
      public static var WING_TYPE_CONSTANTS:Array = [{
         "value":0,
         "label":"(0) NONE"
      },{
         "value":1,
         "label":"(1) BEE_LIKE_SMALL"
      },{
         "value":2,
         "label":"(2) BEE_LIKE_LARGE"
      },{
         "value":4,
         "label":"(4) HARPY"
      },{
         "value":5,
         "label":"(5) IMP"
      },{
         "value":6,
         "label":"(6) BAT_LIKE_TINY"
      },{
         "value":7,
         "label":"(7) BAT_LIKE_LARGE"
      },{
         "value":9,
         "label":"(9) FEATHERED_LARGE"
      },{
         "value":10,
         "label":"(10) DRACONIC_SMALL"
      },{
         "value":11,
         "label":"(11) DRACONIC_LARGE"
      },{
         "value":12,
         "label":"(12) GIANT_DRAGONFLY"
      },{
         "value":13,
         "label":"(13) IMP_LARGE"
      },{
         "value":16,
         "label":"(16) WOODEN"
      },{
         "value":17,
         "label":"(17) WILLOW"
      },{
         "value":18,
         "label":"(18) WEEPING"
      }];
      
      public static var LOWER_TYPE_CONSTANTS:Array = [{
         "value":0,
         "label":"(0) HUMAN"
      },{
         "value":1,
         "label":"(1) HOOFED"
      },{
         "value":2,
         "label":"(2) DOG"
      },{
         "value":3,
         "label":"(3) NAGA"
      },{
         "value":5,
         "label":"(5) DEMONIC_HIGH_HEELS"
      },{
         "value":6,
         "label":"(6) DEMONIC_CLAWS"
      },{
         "value":7,
         "label":"(7) BEE"
      },{
         "value":8,
         "label":"(8) GOO"
      },{
         "value":9,
         "label":"(9) CAT"
      },{
         "value":10,
         "label":"(10) LIZARD"
      },{
         "value":11,
         "label":"(11) PONY"
      },{
         "value":12,
         "label":"(12) BUNNY"
      },{
         "value":13,
         "label":"(13) HARPY"
      },{
         "value":14,
         "label":"(14) KANGAROO"
      },{
         "value":15,
         "label":"(15) CHITINOUS_SPIDER_LEGS"
      },{
         "value":16,
         "label":"(16) DRIDER"
      },{
         "value":17,
         "label":"(17) FOX"
      },{
         "value":18,
         "label":"(18) DRAGON"
      },{
         "value":19,
         "label":"(19) RACCOON"
      },{
         "value":20,
         "label":"(20) FERRET"
      },{
         "value":21,
         "label":"(21) CLOVEN_HOOFED"
      },{
         "value":23,
         "label":"(23) ECHIDNA"
      },{
         "value":25,
         "label":"(25) SALAMANDER"
      },{
         "value":26,
         "label":"(26) WOLF"
      },{
         "value":27,
         "label":"(27) IMP"
      },{
         "value":28,
         "label":"(28) COCKATRICE"
      },{
         "value":29,
         "label":"(29) RED_PANDA"
      },{
         "value":30,
         "label":"(30) ROOT_LEGS"
      },{
         "value":32,
         "label":"(31) MERMAID"
      }];
      
      public var selfDebugPage:int;
      
      public var selectedScene:*;
      
      public var selectStack:Array;
      
      public var changeMenu:ButtonDataList;
      
      public var _console:Console;
      
      public function DebugMenu()
      {
         if(Boot.skip_constructor)
         {
            return;
         }
         selfDebugPage = 0;
         changeMenu = new ButtonDataList();
         selectStack = [];
         super();
      }
      
      public static function register(param1:SelfDebug) : void
      {
         if(DebugMenu.selfDebugClasses.indexOf(param1) < 0)
         {
            DebugMenu.selfDebugClasses.push(param1);
         }
      }
      
      public static function unregister(param1:SelfDebug) : void
      {
         if(DebugMenu.selfDebugClasses.indexOf(param1) >= 0)
         {
            DebugMenu.selfDebugClasses.splice(DebugMenu.selfDebugClasses.indexOf(param1),1);
         }
      }
      
      public static function valueAsLabel(param1:Object) : Object
      {
         return {
            "value":param1,
            "label":Std.string(param1)
         };
      }
      
      public function xpChangeApply(param1:Number = 0) : void
      {
         var _temp_1:* = get_player();
         _temp_1.XP = _temp_1.XP + param1;
         get_player().XP = int(Math.ceil(get_player().XP));
         statScreenRefresh();
         statChangeExperienceMenu();
      }
      
      public function warningScreen() : void
      {
         clearOutput();
         outputText("警告：此功能处于实验阶段，将大幅改变用户界面和输入方式。" + "\n仅当您习惯使用主机风格的输入方式时才启用此功能");
         menu();
         addNextButton("启用",enableConsole);
         addNextButton("取消",accessDebugMenu);
      }
      
      public function testScene(param1:*) : void
      {
         var e:TextEvent;
         var _g:DebugMenu;
         var _loc9_:* = null as String;
         var _loc12_:* = null;
         var _loc13_:* = null as Exception;
         clearOutput();
         selectedScene = param1;
         var _loc3_:Class = Type.getClass(param1);
         var _loc4_:Class = Type.getSuperClass(_loc3_);
         var _loc5_:Array = _loc4_ != null ? Type.getInstanceFields(_loc4_) : [];
         var _loc6_:Array = [];
         var _loc7_:int = 0;
         var _loc8_:Array = Type.getInstanceFields(_loc3_);
         while(_loc7_ < int(_loc8_.length))
         {
            _loc9_ = _loc8_[_loc7_];
            _loc7_++;
            if(!Boolean(_loc5_.contains(_loc9_)))
            {
               _loc6_.push(_loc9_);
            }
         }
         _loc8_ = _loc6_;
         _loc8_.sort(Reflect.compare);
         var _loc10_:Array = [];
         var _loc11_:Array = [];
         _loc7_ = 0;
         while(_loc7_ < int(_loc8_.length))
         {
            _loc9_ = _loc8_[_loc7_];
            _loc7_++;
            try
            {
               _loc12_ = Reflect.getProperty(param1,_loc9_);
               if(Reflect.isFunction(_loc12_))
               {
                  _loc10_.push(_loc9_);
               }
               else if(Type.getClass(_loc12_) != null)
               {
                  _loc11_.push(_loc9_);
               }
            }
            catch(_loc_e_:*)
            {
            }
         }
         if(int(_loc11_.length) > 0)
         {
            outputText("<b><u>变量</u></b>\n");
         }
         _loc7_ = 0;
         while(_loc7_ < int(_loc11_.length))
         {
            _loc9_ = _loc11_[_loc7_];
            _loc7_++;
            outputText("<u><a href=\"event:" + _loc9_ + "\">" + _loc9_ + "</a></u>\n");
         }
         if(int(_loc10_.length) > 0)
         {
            outputText("<b><u>方法</u></b>\n");
         }
         _loc7_ = 0;
         while(_loc7_ < int(_loc10_.length))
         {
            _loc9_ = _loc10_[_loc7_];
            _loc7_++;
            outputText("<u><a href=\"event:" + _loc9_ + "\">" + _loc9_ + "</a></u>\n");
         }
         get_mainView().mainText.addEventListener(TextEvent.LINK,linkhandler);
         menu();
         _g = this;
         e = new TextEvent(TextEvent.LINK,false,false,"-1");
         addButton(0,"返回",function():void
         {
            _g.linkhandler(e);
         });
      }
      
      public function statChangeMenu() : void
      {
         var stats6:Function;
         var _g6:DebugMenu;
         var stats5:Function;
         var _g5:DebugMenu;
         var stats4:Function;
         var _g4:DebugMenu;
         var stats3:Function;
         var _g3:DebugMenu;
         var stats2:Function;
         var _g2:DebugMenu;
         var stats1:Function;
         var _g1:DebugMenu;
         var stats:Function;
         var _g:DebugMenu;
         clearOutput();
         outputText("你想修改哪个属性？");
         menu();
         _g = this;
         stats = DynStat.Str;
         addButton(0,"力量",function():void
         {
            _g.statChangeAttributeMenu(stats);
         });
         _g1 = this;
         stats1 = DynStat.Tou;
         addButton(1,"体质",function():void
         {
            _g1.statChangeAttributeMenu(stats1);
         });
         _g2 = this;
         stats2 = DynStat.Spe;
         addButton(2,"速度",function():void
         {
            _g2.statChangeAttributeMenu(stats2);
         });
         _g3 = this;
         stats3 = DynStat.Inte;
         addButton(3,"智力",function():void
         {
            _g3.statChangeAttributeMenu(stats3);
         });
         _g4 = this;
         stats4 = DynStat.Lib;
         addButton(5,"性欲",function():void
         {
            _g4.statChangeAttributeMenu(stats4);
         });
         _g5 = this;
         stats5 = DynStat.Sens;
         addButton(6,"敏感度",function():void
         {
            _g5.statChangeAttributeMenu(stats5);
         });
         _g6 = this;
         stats6 = DynStat.Cor;
         addButton(7,"腐化",function():void
         {
            _g6.statChangeAttributeMenu(stats6);
         });
         addButton(10,"经验值",statChangeExperienceMenu);
         addButton(14,"返回",accessDebugMenu);
      }
      
      public function statChangeExperienceMenu() : void
      {
         var increment5:Number;
         var _g5:DebugMenu;
         var increment4:Number;
         var _g4:DebugMenu;
         var increment3:Number;
         var _g3:DebugMenu;
         var increment2:Number;
         var _g2:DebugMenu;
         var increment1:Number;
         var _g1:DebugMenu;
         var increment:Number;
         var _g:DebugMenu;
         var _gthis:DebugMenu = this;
         var levelButton:Function = function(param1:int, param2:int):void
         {
            var increment:Number;
            var _g:DebugMenu;
            var _loc3_:String = "最高等级";
            var _loc4_:int = int(_gthis.get_game().levelCap);
            var _loc5_:Boolean = param2 < 0;
            if(!_loc5_)
            {
               _loc3_ = Utils.capitalizeFirstLetter(Utils.numberOfThings(param2,"等级"));
               _loc4_ = _gthis.get_player().potentialLevel() + param2;
            }
            var _loc6_:DebugMenu = _gthis;
            _g = _gthis;
            increment = _gthis.get_player().xpToLevel(_loc4_);
            _loc6_.addButton(param1,_loc3_,function():void
            {
               _g.xpChangeApply(increment);
            }).hint("获得足够的经验以达到" + (_loc5_ ? "最高等级。" : "等级 " + _loc4_ + "。")).disableIf(_gthis.get_player().potentialLevel() >= _gthis.get_game().levelCap,"你的经验已足够达到最高等级。");
         };
         clearOutput();
         outputText("增加或减少多少？");
         if(get_player().XP >= get_player().requiredXP())
         {
            outputText("[pg]你当前的经验值足以让你升到 " + get_player().potentialLevel() + " 级。");
         }
         menu();
         _g = this;
         increment = 50;
         addButton(0,"增加50",function():void
         {
            _g.xpChangeApply(increment);
         });
         _g1 = this;
         increment1 = 100;
         addButton(1,"增加100",function():void
         {
            _g1.xpChangeApply(increment1);
         });
         _g2 = this;
         increment2 = 500;
         addButton(2,"增加500",function():void
         {
            _g2.xpChangeApply(increment2);
         });
         _g3 = this;
         increment3 = 1000;
         addButton(3,"增加1000",function():void
         {
            _g3.xpChangeApply(increment3);
         });
         _g4 = this;
         increment4 = 5000;
         addButton(4,"增加5000",function():void
         {
            _g4.xpChangeApply(increment4);
         });
         _g5 = this;
         increment5 = -get_player().XP;
         addButton(5,"重置为0",function():void
         {
            _g5.xpChangeApply(increment5);
         });
         levelButton(6,1);
         levelButton(7,5);
         levelButton(8,10);
         levelButton(9,-1);
         addButton(14,"返回",statChangeMenu);
      }
      
      public function statChangeAttributeMenu(param1:Function) : void
      {
         var increment9:Number;
         var stats10:Function;
         var _g9:DebugMenu;
         var increment8:Number;
         var stats9:Function;
         var _g8:DebugMenu;
         var increment7:Number;
         var stats8:Function;
         var _g7:DebugMenu;
         var increment6:Number;
         var stats7:Function;
         var _g6:DebugMenu;
         var increment5:Number;
         var stats6:Function;
         var _g5:DebugMenu;
         var increment4:Number;
         var stats5:Function;
         var _g4:DebugMenu;
         var increment3:Number;
         var stats4:Function;
         var _g3:DebugMenu;
         var increment2:Number;
         var stats3:Function;
         var _g2:DebugMenu;
         var increment1:Number;
         var stats2:Function;
         var _g1:DebugMenu;
         var increment:Number;
         var stats1:Function;
         var _g:DebugMenu;
         clearOutput();
         outputText("增加或减少多少？");
         menu();
         _g = this;
         stats1 = param1;
         increment = 1;
         addButton(0,"加 1",function():void
         {
            _g.statChangeApply(stats1,increment);
         });
         _g1 = this;
         stats2 = param1;
         increment1 = 5;
         addButton(1,"加 5",function():void
         {
            _g1.statChangeApply(stats2,increment1);
         });
         _g2 = this;
         stats3 = param1;
         increment2 = 10;
         addButton(2,"加 10",function():void
         {
            _g2.statChangeApply(stats3,increment2);
         });
         _g3 = this;
         stats4 = param1;
         increment3 = 25;
         addButton(3,"加 25",function():void
         {
            _g3.statChangeApply(stats4,increment3);
         });
         _g4 = this;
         stats5 = param1;
         increment4 = 50;
         addButton(4,"增加 50",function():void
         {
            _g4.statChangeApply(stats5,increment4);
         });
         _g5 = this;
         stats6 = param1;
         increment5 = -1;
         addButton(5,"减少 1",function():void
         {
            _g5.statChangeApply(stats6,increment5);
         });
         _g6 = this;
         stats7 = param1;
         increment6 = -5;
         addButton(6,"减少 5",function():void
         {
            _g6.statChangeApply(stats7,increment6);
         });
         _g7 = this;
         stats8 = param1;
         increment7 = -10;
         addButton(7,"减少 10",function():void
         {
            _g7.statChangeApply(stats8,increment7);
         });
         _g8 = this;
         stats9 = param1;
         increment8 = -25;
         addButton(8,"减少 25",function():void
         {
            _g8.statChangeApply(stats9,increment8);
         });
         _g9 = this;
         stats10 = param1;
         increment9 = -50;
         addButton(9,"减去 50",function():void
         {
            _g9.statChangeApply(stats10,increment9);
         });
         addButton(14,"返回",statChangeMenu);
      }
      
      public function statChangeApply(param1:Function, param2:Number = 0) : void
      {
         dynStats(param1(param2));
         statScreenRefresh();
         statChangeAttributeMenu(param1);
      }
      
      public function showChangeMenu(param1:Function, param2:Array, param3:Function) : void
      {
         var constant:Array;
         var back:Function = param1;
         var setValue:Function = param3;
         var _gthis:DebugMenu = this;
         changeMenu.clear();
         var _loc4_:int = 0;
         while(_loc4_ < int(param2.length))
         {
            constant = [param2[_loc4_]];
            _loc4_++;
            changeMenu.add(constant[0].label,(function(param1:Array):Function
            {
               var constant:Array = param1;
               return function():void
               {
                  setValue(constant[0].value);
                  _gthis.dumpPlayerData();
                  _gthis.changeMenu.submenu(back,false,_gthis.changeMenu.page);
               };
            })(constant));
         }
         dumpPlayerData();
         changeMenu.submenu(back,false,0);
      }
      
      public function setList(param1:*) : void
      {
         var _loc5_:* = null as String;
         var _loc6_:* = null;
         var _loc7_:* = null as ItemType;
         clearOutput();
         outputText("选择一个项目。");
         var _loc2_:ButtonDataList = new ButtonDataList();
         var _loc3_:int = 0;
         var _loc4_:Array = Type.getInstanceFields(Type.getClass(param1));
         while(_loc3_ < int(_loc4_.length))
         {
            _loc5_ = _loc4_[_loc3_];
            _loc3_++;
            _loc6_ = Reflect.field(param1,_loc5_);
            _loc7_ = _loc6_ as ItemType;
            if(_loc7_ != null)
            {
               _loc2_.push(_loc7_.buttonData((function(param1:Array, param2:Array, param3:Array):Function
               {
                  var _g:Array = param1;
                  var nextAction:Array = param2;
                  var itype:Array = param3;
                  return function():void
                  {
                     _g[0].takeItemMenuless(itype[0],nextAction[0]);
                  };
               })([get_inventory()],[itemSpawnMenu],[_loc7_])));
            }
         }
         _loc2_.submenu(itemSpawnMenu,true);
      }
      
      public function selfDebug() : void
      {
         var debugClass:Array;
         var _gthis:DebugMenu;
         var _loc3_:* = null as String;
         _gthis = this;
         clearOutput();
         menu();
         var _loc1_:int = 0;
         var _loc2_:Array = DebugMenu.selfDebugClasses;
         while(_loc1_ < int(_loc2_.length))
         {
            debugClass = [_loc2_[_loc1_]];
            _loc1_++;
            _loc3_ = debugClass[0].get_debugName();
            if(_loc3_.length > 0)
            {
               addNextButton(_loc3_,(function(param1:Array):Function
               {
                  var debugClass:Array = param1;
                  return function():void
                  {
                     _gthis.selfDebugPage = _gthis.get_output().buttons.page;
                     debugClass[0].debugMenu();
                  };
               })(debugClass)).hint(debugClass[0].get_debugHint());
            }
         }
         setExitButton("返回",function():void
         {
            _gthis.selfDebugPage = 0;
            _gthis.accessDebugMenu();
         },14,true,selfDebugPage);
      }
      
      public function saveFlag(param1:int = 0) : void
      {
         var _loc2_:String = getInput();
         var _loc3_:Object = Std.parseInt(_loc2_);
         var _loc4_:Number = Std.parseFloat(_loc2_);
         var _loc5_:String = _loc2_.toLowerCase();
         if(_loc5_ == "true")
         {
            §§push(FlagDict_Impl_);
            §§push(KFLAGS.flags);
            var _temp_1:* = param1;
            §§push(_temp_1);
            if(!(_temp_1 is Number))
            {
               throw "Class cast error";
            }
            §§pop().arrayWriteBool(§§pop(),int(§§pop()),true);
         }
         else if(_loc5_ == "false")
         {
            §§push(FlagDict_Impl_);
            §§push(KFLAGS.flags);
            var _temp_2:* = param1;
            §§push(_temp_2);
            if(!(_temp_2 is Number))
            {
               throw "Class cast error";
            }
            §§pop().arrayWriteBool(§§pop(),int(§§pop()),false);
         }
         else if(!Boolean(Math.isNaN(_loc4_)))
         {
            if(_loc3_ == _loc4_)
            {
               §§push(FlagDict_Impl_);
               §§push(KFLAGS.flags);
               var _temp_3:* = param1;
               §§push(_temp_3);
               if(!(_temp_3 is Number))
               {
                  throw "Class cast error";
               }
               §§pop().arrayWriteInt(§§pop(),int(§§pop()),_loc3_);
            }
            else
            {
               §§push(FlagDict_Impl_);
               §§push(KFLAGS.flags);
               var _temp_4:* = param1;
               §§push(_temp_4);
               if(!(_temp_4 is Number))
               {
                  throw "Class cast error";
               }
               §§pop().arrayWriteFloat(§§pop(),int(§§pop()),_loc4_);
            }
         }
         else
         {
            §§push(FlagDict_Impl_);
            §§push(KFLAGS.flags);
            var _temp_5:* = param1;
            §§push(_temp_5);
            if(!(_temp_5 is Number))
            {
               throw "Class cast error";
            }
            §§pop().arrayWriteString(§§pop(),int(§§pop()),_loc2_);
         }
         flagEditor();
      }
      
      public function resetUrta() : void
      {
         clearOutput();
         outputText("你是不是做错了什么，让乌尔塔伤透了心，或者导致乌尔塔的任务失败了？如果你想的话，你可以重置她。");
         doYesNo(reallyResetUrta,resetNPCMenu);
      }
      
      public function resetSheila() : void
      {
         clearOutput();
         outputText("你对希拉做了什么错事吗？把她变成了恶魔？失去了获得她魂石的机会？没问题，你可以直接重置她！");
         doYesNo(reallyResetSheila,resetNPCMenu);
      }
      
      public function resetNPCMenu() : void
      {
         clearOutput();
         outputText("你想重置哪个NPC？");
         menu();
         if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,12) < 0 || FlagDict_Impl_.arrayReadFloat(KFLAGS.flags,711) == -1)
         {
            addButton(0,"乌尔塔",resetUrta);
         }
         if(get_game().jojoScene.isJojoCorrupted() || FlagDict_Impl_.arrayReadInt(KFLAGS.flags,80) > 0)
         {
            addButton(1,"乔乔",resetJojo);
         }
         if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,537) > 0)
         {
            addButton(2,"烬",resetEmber);
         }
         if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,1210) > 0 || FlagDict_Impl_.arrayReadInt(KFLAGS.flags,764) > 0 || FlagDict_Impl_.arrayReadInt(KFLAGS.flags,765) < 0 || FlagDict_Impl_.arrayReadInt(KFLAGS.flags,765) >= 6)
         {
            addButton(6,"希拉",resetSheila);
         }
         addButton(14,"返回",accessDebugMenu);
      }
      
      public function resetJojo() : void
      {
         clearOutput();
         outputText("你对乔乔做了什么错事吗？腐化了他？不小心把他从游戏中移除了？没问题！");
         doYesNo(reallyResetJojo,resetNPCMenu);
      }
      
      public function resetEmber() : void
      {
         clearOutput();
         outputText("你摧毁了装有烬的蛋吗？想要恢复那颗蛋以便带走它吗？");
         doYesNo(reallyResetEmber,resetNPCMenu);
      }
      
      public function reallyResetUrta() : void
      {
         clearOutput();
         if(FlagDict_Impl_.arrayReadFloat(KFLAGS.flags,711) == -1)
         {
            outputText("不知为何，你有一种感觉，乌尔塔似乎已经回到了特尔阿德雷。");
            FlagDict_Impl_.arrayWriteFloat(KFLAGS.flags,711,0);
         }
         if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,12) < 0)
         {
            outputText("你有一种感觉，乌尔塔终于走出了抑郁，恢复了正常。");
            FlagDict_Impl_.arrayWriteInt(KFLAGS.flags,12,0);
         }
         doNext(resetNPCMenu);
      }
      
      public function reallyResetSheila() : void
      {
         clearOutput();
         if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,1210) > 0)
         {
            outputText("你终于可以再次遇到希拉了！");
            FlagDict_Impl_.arrayWriteInt(KFLAGS.flags,1210,0);
         }
         if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,764) > 0)
         {
            outputText("希拉不再是恶魔了；她现在恢复正常了。");
            FlagDict_Impl_.arrayWriteInt(KFLAGS.flags,764,0);
            FlagDict_Impl_.arrayWriteInt(KFLAGS.flags,760,30);
         }
         if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,765) < 0)
         {
            outputText("任何错失的魂石机会现在都找回来了。");
            FlagDict_Impl_.arrayWriteInt(KFLAGS.flags,765,0);
         }
         doNext(resetNPCMenu);
      }
      
      public function reallyResetJojo() : void
      {
         clearOutput();
         if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,2311) > 1)
         {
            outputText("乔乔不再被腐化了！");
            FlagDict_Impl_.arrayWriteInt(KFLAGS.flags,2311,0);
         }
         if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,80) > 0)
         {
            outputText("乔乔已重生。");
            FlagDict_Impl_.arrayWriteInt(KFLAGS.flags,80,0);
         }
         doNext(resetNPCMenu);
      }
      
      public function reallyResetEmber() : void
      {
         clearOutput();
         if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,537) > 0)
         {
            outputText("蛋现在已恢复。去沼泽里找它吧！下次尽量别再摧毁它了。");
            FlagDict_Impl_.arrayWriteInt(KFLAGS.flags,537,0);
         }
         doNext(resetNPCMenu);
      }
      
      public function linkhandler(param1:TextEvent) : void
      {
         var _loc3_:* = null;
         get_mainView().mainText.removeEventListener(TextEvent.LINK,linkhandler);
         if(param1.text == "-1")
         {
            if(int(selectStack.length) > 0)
            {
               testScene(selectStack.pop());
            }
            else
            {
               selectedScene = null;
               selectStack = [];
               accessDebugMenu();
            }
            return;
         }
         var _loc2_:* = Reflect.getProperty(selectedScene,param1.text);
         if(Reflect.isFunction(_loc2_))
         {
            _loc3_ = selectedScene;
            clearOutput();
            doNext(accessDebugMenu);
            selectedScene = null;
            selectStack = [];
            _loc2_.apply(_loc3_,[]);
         }
         else
         {
            selectStack.push(selectedScene);
            testScene(_loc2_);
         }
      }
      
      public function itemSpawnMenu() : void
      {
         var lib6:*;
         var _g6:DebugMenu;
         var lib5:*;
         var _g5:DebugMenu;
         var lib4:*;
         var _g4:DebugMenu;
         var lib3:*;
         var _g3:DebugMenu;
         var lib2:*;
         var _g2:DebugMenu;
         var lib1:*;
         var _g1:DebugMenu;
         var lib:*;
         var _g:DebugMenu;
         clearOutput();
         outputText("选择一个类别。");
         menu();
         _g = this;
         lib = get_weapons();
         addButton(0,"武器",function():void
         {
            _g.setList(lib);
         });
         _g1 = this;
         lib1 = get_consumables();
         addButton(1,"消耗品",function():void
         {
            _g1.setList(lib1);
         });
         _g2 = this;
         lib2 = get_jewelries();
         addButton(2,"首饰",function():void
         {
            _g2.setList(lib2);
         });
         _g3 = this;
         lib3 = get_shields();
         addButton(3,"盾牌",function():void
         {
            _g3.setList(lib3);
         });
         _g4 = this;
         lib4 = get_useables();
         addButton(4,"可用物品",function():void
         {
            _g4.setList(lib4);
         });
         _g5 = this;
         lib5 = get_armors();
         addButton(5,"护甲",function():void
         {
            _g5.setList(lib5);
         });
         _g6 = this;
         lib6 = get_undergarments();
         addButton(6,"内衣",function():void
         {
            _g6.setList(lib6);
         });
         addButton(14,"返回",accessDebugMenu);
      }
      
      public function flagEditor() : void
      {
         clearOutput();
         outputText("这里是Flag编辑器。你可以在这里编辑flag。关于flag的参考，请查看kFLAGS.as类文件。请输入0到2999之间的任意数字。");
         outputText("[pg]<b>警告：这可能会破坏你的存档文件，所以在使用前请备份你的存档！</b>");
         menu();
         addButton(0,"确定",editFlag);
         addButton(4,"确定",accessDebugMenu);
         promptInput({
            "maxChars":4,
            "restrict":"0-9"
         });
      }
      
      public function enableConsole() : void
      {
         _console = new Console(int(get_mainView().get_height()),int(get_mainView().get_width()));
         get_mainView().stage.addChild(_console);
         clearOutput();
         menu();
         doNext(accessDebugMenu);
         _console.startupHelp();
      }
      
      public function editFlag() : void
      {
         var flagId1:int;
         var _g:DebugMenu;
         var _loc1_:Object = Std.parseInt(getInput());
         clearOutput();
         menu();
         if(_loc1_ < 0 || _loc1_ >= 3000)
         {
            outputText("该flag不存在！");
            doNext(flagEditor);
            return;
         }
         promptInput({
            "maxChars":127,
            "text":Std.string(FlagDict_Impl_.arrayReadString(KFLAGS.flags,int(_loc1_)))
         });
         _g = this;
         flagId1 = _loc1_;
         addButton(0,"保存",function():void
         {
            _g.saveFlag(flagId1);
         });
         addButton(1,"放弃",flagEditor);
      }
      
      public function echo() : void
      {
         var back:Object;
         var _g1:Function;
         var _g:Function;
         var inputHandler:Function;
         var onUp:Function;
         var resizeHandler:Function;
         var dragSprite:Sprite;
         var tlabel:TextField;
         var eventWindow:Window;
         var _gthis:DebugMenu = this;
         var sprSize:int = 10;
         var titleHeight:int = 20;
         var showParsed:Boolean = true;
         var mainView1:MainView = get_mainView();
         var eventTestInput:TextField = mainView1.eventTestInput;
         clearOutput();
         mainView1.showTestInputPanel();
         eventWindow = new Window(mainView1,0,0,"原始文本");
         eventWindow.set_hasMinimizeButton(true);
         tlabel = new TextField();
         tlabel.defaultTextFormat = mainView1.mainText.defaultTextFormat;
         tlabel.textColor = 8553090;
         tlabel.text = "在此输入文本";
         tlabel.selectable = false;
         tlabel.background = false;
         tlabel.multiline = true;
         tlabel.wordWrap = true;
         tlabel.visible = eventTestInput.text.length == 0;
         dragSprite = new Sprite();
         var _loc1_:Graphics = dragSprite.graphics;
         var _loc2_:BitmapData = null;
         FlashGraphics.bitmapFill[_loc1_] = _loc2_;
         _loc1_.beginFill(16777215,0);
         dragSprite.graphics.drawRect(0,0,sprSize,sprSize);
         _loc1_ = dragSprite.graphics;
         _loc2_ = null;
         FlashGraphics.bitmapFill[_loc1_] = _loc2_;
         _loc1_.endFill();
         dragSprite.graphics.lineStyle(1,5263440);
         dragSprite.graphics.moveTo(0,sprSize - 1);
         dragSprite.graphics.lineTo(sprSize - 1,0);
         dragSprite.graphics.moveTo(sprSize / 2 - 1,sprSize - 1);
         dragSprite.graphics.lineTo(sprSize - 1,sprSize / 2 - 1);
         dragSprite.useHandCursor = true;
         dragSprite.buttonMode = true;
         eventWindow.addEventListener(Event.RESIZE,function(param1:Object = undefined):void
         {
            eventWindow.draw();
            eventTestInput.width = tlabel.width = eventWindow.get_content().parent.width;
            eventTestInput.height = tlabel.height = eventWindow.get_content().parent.height;
            dragSprite.x = eventWindow.get_width() - sprSize;
            dragSprite.y = eventWindow.get_height() - sprSize - titleHeight;
         });
         eventTestInput.x = 0;
         eventTestInput.y = 0;
         eventTestInput.background = false;
         eventTestInput.border = false;
         resizeHandler = function(param1:MouseEvent):void
         {
            if(!param1.buttonDown)
            {
               dragSprite.dispatchEvent(new MouseEvent(MouseEvent.MOUSE_UP));
            }
            var _loc2_:Number = Math.max(eventWindow.mouseX,2 * sprSize);
            var _loc3_:Number = Math.max(eventWindow.mouseY,2 * sprSize + titleHeight);
            eventWindow.setSize(_loc2_ + sprSize,_loc3_ + sprSize);
            Log.trace("testing",{
               "fileName":"src/classes/DebugMenu.hx",
               "lineNumber":311,
               "className":"classes.DebugMenu",
               "methodName":"echo"
            });
         };
         onUp = function(param1:MouseEvent):Boolean
         {
            return dragSprite.dispatchEvent(new MouseEvent(MouseEvent.MOUSE_UP));
         };
         dragSprite.addEventListener(MouseEvent.MOUSE_DOWN,function(param1:MouseEvent = undefined):void
         {
            mainView1.stage.addEventListener(MouseEvent.MOUSE_MOVE,resizeHandler);
            mainView1.stage.addEventListener(MouseEvent.MOUSE_UP,onUp);
         });
         dragSprite.addEventListener(MouseEvent.MOUSE_UP,function(param1:MouseEvent = undefined):void
         {
            mainView1.stage.removeEventListener(MouseEvent.MOUSE_MOVE,resizeHandler);
            mainView1.stage.removeEventListener(MouseEvent.MOUSE_UP,onUp);
         });
         eventWindow.addChild(tlabel);
         eventWindow.addChild(eventTestInput);
         eventWindow.addChild(dragSprite);
         var _loc3_:Function = function():void
         {
            eventWindow.set_x(0);
            eventWindow.set_y(mainView1.mainText.y);
            eventWindow.setSize(mainView1.statsView.get_width(),mainView1.mainText.height);
         };
         inputHandler = function(param1:Event):String
         {
            var _loc3_:* = null as String;
            mainView1.clearOutputText();
            var _loc2_:String = eventTestInput.text;
            tlabel.visible = _loc2_.length == 0;
            if(showParsed)
            {
               _gthis.get_game().resetParsers();
               return mainView1.mainText.htmlText = _gthis.get_game().parser.parse(_loc2_);
            }
            return mainView1.mainText.text = _loc2_;
         };
         var _loc4_:Function = function(param1:Object = undefined):void
         {
            if(param1 == null)
            {
               param1 = false;
            }
            eventTestInput.removeEventListener(Event.CHANGE,inputHandler);
            mainView1.addChild(eventTestInput);
            mainView1.removeChild(eventWindow);
            _gthis.get_game().stage.addEventListener(KeyboardEvent.KEY_DOWN,_gthis.get_game().inputManager.KeyHandler);
            mainView1.hideTestInputPanel();
            if(param1)
            {
               _gthis.accessDebugMenu();
            }
            else
            {
               _gthis.outputText(eventTestInput.text);
               _gthis.doNext(_gthis.accessDebugMenu);
            }
         };
         _loc3_();
         _g = _loc4_;
         doNext(function():void
         {
            _g();
         });
         addNextButton("切换解析",function():void
         {
            showParsed = !showParsed;
            inputHandler(null);
         });
         addNextButton("清除文本",function():void
         {
            eventTestInput.text = "";
            inputHandler(null);
         });
         addNextButton("重置位置",_loc3_);
         _g1 = _loc4_;
         back = true;
         addButton(14,"返回",function():void
         {
            _g1(back);
         });
         inputHandler(null);
         get_game().stage.removeEventListener(KeyboardEvent.KEY_DOWN,get_game().inputManager.KeyHandler);
         eventTestInput.addEventListener(Event.CHANGE,inputHandler);
      }
      
      public function dumpWrapper(param1:Function) : void
      {
         clearOutput();
         param1();
         doNext(accessDebugMenu);
      }
      
      public function dumpPlayerData() : void
      {
         var _loc4_:* = null as String;
         clearOutput();
         get_game().playerAppearance.appearance();
         outputText("[pg]");
         var _loc1_:Array = [];
         var _loc2_:int = 0;
         var _loc3_:Array = ["hairorfur","skin","skin.noadj","skinfurscales","skintone","underbody.skinfurscales","underbody.skintone","face"];
         while(_loc2_ < int(_loc3_.length))
         {
            _loc4_ = _loc3_[_loc2_];
            _loc2_++;
            _loc1_.push("\\[" + _loc4_ + "\\] = [" + _loc4_ + "]");
         }
         _loc4_ = _loc1_.join("\n");
         outputText("[pg]" + _loc4_);
         menu();
      }
      
      public function dumpEffectsMenu() : void
      {
         var func1:Function;
         var target1:Creature;
         var _g3:DebugMenu;
         var _g2:DebugMenu;
         var func:Function;
         var target:Creature;
         var _g1:DebugMenu;
         var _g:DebugMenu;
         menu();
         _g = this;
         _g1 = this;
         target = get_player();
         func = function():void
         {
            _g1.dumpEffects(target);
         };
         addNextButton("状态效果",function():void
         {
            _g.dumpWrapper(func);
         });
         _g2 = this;
         _g3 = this;
         target1 = get_player();
         func1 = function():void
         {
            _g3.dumpBonuses(target1);
         };
         addNextButton("额外属性",function():void
         {
            _g2.dumpWrapper(func1);
         });
         setExitButton("返回",accessDebugMenu);
      }
      
      public function dumpEffects(param1:Creature = undefined) : void
      {
         var _loc4_:* = null as StatusEffect;
         if(param1 == null)
         {
            param1 = get_player();
         }
         var _loc2_:int = 0;
         var _loc3_:Array = param1.statusEffects;
         while(_loc2_ < int(_loc3_.length))
         {
            _loc4_ = _loc3_[_loc2_];
            _loc2_++;
            outputText("\'" + _loc4_.get_stype().get_id() + "\': " + _loc4_.value1 + "" + _loc4_.value2 + "" + _loc4_.value3 + "" + _loc4_.value4 + "\n");
         }
      }
      
      public function dumpBonuses(param1:Creature = undefined) : void
      {
         if(param1 == null)
         {
            param1 = get_player();
         }
         outputText(param1.getBonusStatSummaryAll());
      }
      
      public function debugConsole() : void
      {
         if(_console == null)
         {
            warningScreen();
         }
         else
         {
            _console.dispose();
            get_mainView().stage.removeChild(_console);
            _console = null;
         }
      }
      
      public function debugCompEdit(param1:DebuggableSave, param2:DebuggableSave) : void
      {
         var onUpdate:Function;
         var resetButton:CoCButton;
         var savedButton:CoCButton;
         var edited:DebuggableSave;
         var saved:DebuggableSave = param1;
         var reset:DebuggableSave = param2;
         var _gthis:DebugMenu = this;
         clearOutput();
         menu();
         edited = Unserializer.run(Serializer.run(saved));
         var _loc3_:CoCScrollPane = buildDebugDisplay(edited._debug());
         savedButton = addNextButtonDisabled("保存");
         resetButton = addNextButtonDisabled("恢复默认");
         onUpdate = function(param1:Event = undefined):void
         {
            var _loc2_:Boolean = Utils.equals(edited,saved);
            var _loc3_:Boolean = Utils.equals(saved,reset);
            savedButton.show("保存",function():void
            {
               Utils.extend(saved,edited);
               _gthis.selfDebug();
            }).disableIf(_loc2_);
            resetButton.show("恢复默认",function():void
            {
               Utils.extend(saved,reset);
               _gthis.selfDebug();
            }).disableIf(_loc3_);
         };
         _loc3_.content.addEventListener(DebugComp.UPDATED,onUpdate,true);
         get_mainView().setMainFocus(_loc3_,false,true);
         onUpdate();
         setExitButton("取消",selfDebug);
      }
      
      public function buildDebugDisplay(param1:Array) : CoCScrollPane
      {
         var pane:CoCScrollPane;
         var _loc6_:* = null as DebugComp;
         var _loc7_:* = null as HBox;
         var _loc2_:VBox = new VBox();
         _loc2_.set_padding(3);
         var _loc3_:Array = [];
         var _loc4_:Number = 0;
         var _loc5_:int = 0;
         while(_loc5_ < int(param1.length))
         {
            _loc6_ = param1[_loc5_];
            _loc5_++;
            _loc7_ = _loc6_.displayObject();
            _loc6_.nameLabel.defaultTextFormat = get_game().mainView.mainText.defaultTextFormat;
            _loc6_.hintLabel.defaultTextFormat = get_game().mainView.mainText.defaultTextFormat;
            if(_loc6_.hintLabel.text.length == 0)
            {
               _loc7_.removeChild(_loc6_.hintLabel);
            }
            _loc2_.addChild(_loc7_);
            _loc3_.push(_loc7_);
            _loc4_ = Math.max(_loc4_,_loc6_.nameLabel.width);
         }
         _loc5_ = 0;
         while(_loc5_ < int(param1.length))
         {
            _loc6_ = param1[_loc5_];
            _loc5_++;
            _loc6_.nameLabel.autoSize = "none";
            _loc6_.nameLabel.width = _loc4_;
            _loc6_.hintLabel.wordWrap = false;
            _loc6_.hintLabel.width = Math.min(_loc6_.hintLabel.width,735 - _loc4_ - _loc6_.comp.displayObject().width);
            _loc6_.hintLabel.wordWrap = true;
         }
         pane = new CoCScrollPane();
         pane.set_width(500);
         pane.addChild(_loc2_);
         pane.set_dragContent(false);
         _loc2_.addEventListener(Event.RESIZE,function(param1:*):void
         {
            pane.update();
         });
         return pane;
      }
      
      public function bodyPartEditorTorso() : void
      {
         var setValue7:Function;
         var constants7:Array;
         var back8:Function;
         var _g7:DebugMenu;
         var setValue6:Function;
         var constants6:Array;
         var back7:Function;
         var _g6:DebugMenu;
         var setValue5:Function;
         var constants5:Array;
         var back6:Function;
         var _g5:DebugMenu;
         var setValue4:Function;
         var constants4:Array;
         var back5:Function;
         var _g4:DebugMenu;
         var setValue3:Function;
         var constants3:Array;
         var back4:Function;
         var _g3:DebugMenu;
         var setValue2:Function;
         var constants2:Array;
         var back3:Function;
         var _g2:DebugMenu;
         var setValue1:Function;
         var constants1:Array;
         var back2:Function;
         var _g1:DebugMenu;
         var setValue:Function;
         var constants:Array;
         var back1:Function;
         var _g:DebugMenu;
         var _gthis:DebugMenu = this;
         menu();
         dumpPlayerData();
         var _loc1_:Function = bodyPartEditorTorso;
         _g = this;
         back1 = _loc1_;
         constants = DebugMenu.ARM_TYPE_CONSTANTS;
         setValue = function(param1:int):void
         {
            _gthis.get_player().arms.set_type(param1);
         };
         addButton(0,"手臂类型",function():void
         {
            _g.showChangeMenu(back1,constants,setValue);
         });
         _g1 = this;
         back2 = _loc1_;
         constants1 = DebugMenu.CLAW_TYPE_CONSTANTS;
         setValue1 = function(param1:int):void
         {
            _gthis.get_player().arms.claws.set_type(param1);
         };
         addButton(1,"爪子类型",function():void
         {
            _g1.showChangeMenu(back2,constants1,setValue1);
         });
         _g2 = this;
         back3 = _loc1_;
         constants2 = DebugMenu.COLOR_CONSTANTS;
         setValue2 = function(param1:String):void
         {
            _gthis.get_player().arms.claws.tone = param1;
         };
         addButton(2,"爪色调",function():void
         {
            _g2.showChangeMenu(back3,constants2,setValue2);
         });
         _g3 = this;
         back4 = _loc1_;
         constants3 = DebugMenu.TAIL_TYPE_CONSTANTS;
         setValue3 = function(param1:int):void
         {
            _gthis.get_player().tail.type = param1;
         };
         addButton(3,"尾巴类型",function():void
         {
            _g3.showChangeMenu(back4,constants3,setValue3);
         });
         _g4 = this;
         back5 = _loc1_;
         constants4 = DebugMenu.TAIL_COUNT_CONSTANTS;
         setValue4 = function(param1:int):void
         {
            _gthis.get_player().tail.venom = param1;
         };
         addButton(4,"尾巴数量",function():void
         {
            _g4.showChangeMenu(back5,constants4,setValue4);
         });
         _g5 = this;
         back6 = _loc1_;
         constants5 = DebugMenu.WING_TYPE_CONSTANTS;
         setValue5 = function(param1:int):void
         {
            _gthis.get_player().wings.type = param1;
         };
         addButton(5,"翅膀类型",function():void
         {
            _g5.showChangeMenu(back6,constants5,setValue5);
         });
         _g6 = this;
         back7 = _loc1_;
         constants6 = DebugMenu.LOWER_TYPE_CONSTANTS;
         setValue6 = function(param1:int):void
         {
            _gthis.get_player().lowerBody.type = param1;
         };
         addButton(6,"下半身类型",function():void
         {
            _g6.showChangeMenu(back7,constants6,setValue6);
         });
         _g7 = this;
         back8 = _loc1_;
         constants7 = DebugMenu.LEG_COUNT_CONSTANTS;
         setValue7 = function(param1:int):void
         {
            _gthis.get_player().lowerBody.legCount = param1;
         };
         addButton(7,"腿部数量",function():void
         {
            _g7.showChangeMenu(back8,constants7,setValue7);
         });
         addButton(14,"返回",bodyPartEditorRoot);
      }
      
      public function bodyPartEditorSkin() : void
      {
         var setValue7:Function;
         var constants7:Array;
         var back8:Function;
         var _g7:DebugMenu;
         var setValue6:Function;
         var constants6:Array;
         var back7:Function;
         var _g6:DebugMenu;
         var setValue5:Function;
         var constants5:Array;
         var back6:Function;
         var _g5:DebugMenu;
         var setValue4:Function;
         var constants4:Array;
         var back5:Function;
         var _g4:DebugMenu;
         var setValue3:Function;
         var constants3:Array;
         var back4:Function;
         var _g3:DebugMenu;
         var setValue2:Function;
         var constants2:Array;
         var back3:Function;
         var _g2:DebugMenu;
         var setValue1:Function;
         var constants1:Array;
         var back2:Function;
         var _g1:DebugMenu;
         var setValue:Function;
         var constants:Array;
         var back1:Function;
         var _g:DebugMenu;
         var _gthis:DebugMenu = this;
         menu();
         dumpPlayerData();
         var _loc1_:Function = bodyPartEditorSkin;
         _g = this;
         back1 = _loc1_;
         constants = DebugMenu.SKIN_TYPE_CONSTANTS;
         setValue = function(param1:int):void
         {
            _gthis.get_player().skin.type = param1;
         };
         addButton(1,"皮肤类型",function():void
         {
            _g.showChangeMenu(back1,constants,setValue);
         });
         _g1 = this;
         back2 = _loc1_;
         constants1 = DebugMenu.COLOR_CONSTANTS;
         setValue1 = function(param1:String):void
         {
            _gthis.get_player().skin.tone = param1;
         };
         addButton(2,"皮肤颜色",function():void
         {
            _g1.showChangeMenu(back2,constants1,setValue1);
         });
         _g2 = this;
         back3 = _loc1_;
         constants2 = DebugMenu.SKIN_ADJ_CONSTANTS;
         setValue2 = function(param1:String):void
         {
            _gthis.get_player().skin.adj = param1 == "(none)" ? "" : param1;
         };
         addButton(3,"皮肤修饰",function():void
         {
            _g2.showChangeMenu(back3,constants2,setValue2);
         });
         _g3 = this;
         back4 = _loc1_;
         constants3 = DebugMenu.SKIN_DESC_CONSTANTS;
         setValue3 = function(param1:String):void
         {
            _gthis.get_player().skin.desc = param1 == "(default)" ? "" : param1;
         };
         addButton(4,"皮肤描述",function():void
         {
            _g3.showChangeMenu(back4,constants3,setValue3);
         });
         _g4 = this;
         back5 = _loc1_;
         constants4 = DebugMenu.COLOR_CONSTANTS;
         setValue4 = function(param1:String):void
         {
            _gthis.get_player().skin.furColor = param1;
         };
         addButton(7,"毛皮颜色",function():void
         {
            _g4.showChangeMenu(back5,constants4,setValue4);
         });
         _g5 = this;
         back6 = _loc1_;
         constants5 = DebugMenu.HAIR_TYPE_CONSTANTS;
         setValue5 = function(param1:int):void
         {
            _gthis.get_player().hair.type = param1;
         };
         addButton(10,"头发类型",function():void
         {
            _g5.showChangeMenu(back6,constants5,setValue5);
         });
         _g6 = this;
         back7 = _loc1_;
         constants6 = DebugMenu.COLOR_CONSTANTS;
         setValue6 = function(param1:String):void
         {
            _gthis.get_player().hair.color = param1;
         };
         addButton(11,"头发颜色",function():void
         {
            _g6.showChangeMenu(back7,constants6,setValue6);
         });
         _g7 = this;
         back8 = _loc1_;
         constants7 = DebugMenu.HAIR_LENGTH_CONSTANTS;
         setValue7 = function(param1:Number):void
         {
            _gthis.get_player().hair.length = param1;
         };
         addButton(12,"头发长度",function():void
         {
            _g7.showChangeMenu(back8,constants7,setValue7);
         });
         addButton(14,"返回",bodyPartEditorRoot);
      }
      
      public function bodyPartEditorRoot() : void
      {
         menu();
         dumpPlayerData();
         addButton(0,"头部",bodyPartEditorHead);
         addButton(1,"皮肤与毛发",bodyPartEditorSkin);
         addButton(2,"躯干与四肢",bodyPartEditorTorso);
         addButton(14,"返回",accessDebugMenu);
      }
      
      public function bodyPartEditorHead() : void
      {
         var setValue9:Function;
         var constants9:Array;
         var back10:Function;
         var _g9:DebugMenu;
         var setValue8:Function;
         var constants8:Array;
         var back9:Function;
         var _g8:DebugMenu;
         var setValue7:Function;
         var constants7:Array;
         var back8:Function;
         var _g7:DebugMenu;
         var setValue6:Function;
         var constants6:Array;
         var back7:Function;
         var _g6:DebugMenu;
         var setValue5:Function;
         var constants5:Array;
         var back6:Function;
         var _g5:DebugMenu;
         var setValue4:Function;
         var constants4:Array;
         var back5:Function;
         var _g4:DebugMenu;
         var setValue3:Function;
         var constants3:Array;
         var back4:Function;
         var _g3:DebugMenu;
         var setValue2:Function;
         var constants2:Array;
         var back3:Function;
         var _g2:DebugMenu;
         var setValue1:Function;
         var constants1:Array;
         var back2:Function;
         var _g1:DebugMenu;
         var setValue:Function;
         var constants:Array;
         var back1:Function;
         var _g:DebugMenu;
         var _gthis:DebugMenu = this;
         menu();
         dumpPlayerData();
         var _loc1_:Function = bodyPartEditorHead;
         _g = this;
         back1 = _loc1_;
         constants = DebugMenu.FACE_TYPE_CONSTANTS;
         setValue = function(param1:int):void
         {
            _gthis.get_player().face.type = param1;
         };
         addButton(0,"面部类型",function():void
         {
            _g.showChangeMenu(back1,constants,setValue);
         });
         _g1 = this;
         back2 = _loc1_;
         constants1 = DebugMenu.TONGUE_TYPE_CONSTANTS;
         setValue1 = function(param1:int):void
         {
            _gthis.get_player().tongue.type = param1;
         };
         addButton(1,"舌头类型",function():void
         {
            _g1.showChangeMenu(back2,constants1,setValue1);
         });
         _g2 = this;
         back3 = _loc1_;
         constants2 = DebugMenu.EYE_TYPE_CONSTANTS;
         setValue2 = function(param1:int):void
         {
            _gthis.get_player().eyes.setType(param1);
         };
         addButton(2,"眼睛类型",function():void
         {
            _g2.showChangeMenu(back3,constants2,setValue2);
         });
         _g3 = this;
         back4 = _loc1_;
         constants3 = DebugMenu.EAR_TYPE_CONSTANTS;
         setValue3 = function(param1:int):void
         {
            _gthis.get_player().ears.type = param1;
         };
         addButton(3,"耳朵类型",function():void
         {
            _g3.showChangeMenu(back4,constants3,setValue3);
         });
         _g4 = this;
         back5 = _loc1_;
         constants4 = DebugMenu.ANTENNA_TYPE_CONSTANTS;
         setValue4 = function(param1:int):void
         {
            _gthis.get_player().antennae.type = param1;
         };
         addButton(4,"触角类型",function():void
         {
            _g4.showChangeMenu(back5,constants4,setValue4);
         });
         _g5 = this;
         back6 = _loc1_;
         constants5 = DebugMenu.HORN_TYPE_CONSTANTS;
         setValue5 = function(param1:int):void
         {
            _gthis.get_player().horns.type = param1;
         };
         addButton(5,"角类型",function():void
         {
            _g5.showChangeMenu(back6,constants5,setValue5);
         });
         _g6 = this;
         back7 = _loc1_;
         constants6 = DebugMenu.HORN_COUNT_CONSTANTS;
         setValue6 = function(param1:int):void
         {
            _gthis.get_player().horns.value = param1;
         };
         addButton(6,"角数量",function():void
         {
            _g6.showChangeMenu(back7,constants6,setValue6);
         });
         _g7 = this;
         back8 = _loc1_;
         constants7 = DebugMenu.GILLS_TYPE_CONSTANTS;
         setValue7 = function(param1:int):void
         {
            _gthis.get_player().gills.type = param1;
         };
         addButton(7,"鳃类型",function():void
         {
            _g7.showChangeMenu(back8,constants7,setValue7);
         });
         _g8 = this;
         back9 = _loc1_;
         constants8 = DebugMenu.BEARD_STYLE_CONSTANTS;
         setValue8 = function(param1:int):void
         {
            _gthis.get_player().beard.style = param1;
         };
         addButton(8,"胡须样式",function():void
         {
            _g8.showChangeMenu(back9,constants8,setValue8);
         });
         _g9 = this;
         back10 = _loc1_;
         constants9 = DebugMenu.BEARD_LENGTH_CONSTANTS;
         setValue9 = function(param1:Number):void
         {
            _gthis.get_player().beard.length = param1;
         };
         addButton(9,"胡须长度",function():void
         {
            _g9.showChangeMenu(back10,constants9,setValue9);
         });
         addButton(14,"返回",bodyPartEditorRoot);
      }
      
      public function ageChangeMenu() : void
      {
         var newAge3:int;
         var _g3:DebugMenu;
         var newAge2:int;
         var _g2:DebugMenu;
         var newAge1:int;
         var _g1:DebugMenu;
         var newAge:int;
         var _g:DebugMenu;
         clearOutput();
         outputText("选择你的新年龄。");
         outputText("[pg]你现在是" + get_player().ageDesc("儿童","青少年","成年人","长者") + "。[pg]");
         menu();
         _g = this;
         newAge = 1;
         addButton(0,"儿童",function():void
         {
            _g.ageChangeApply(newAge);
         });
         _g1 = this;
         newAge1 = 2;
         addButton(1,"青少年",function():void
         {
            _g1.ageChangeApply(newAge1);
         });
         _g2 = this;
         newAge2 = 0;
         addButton(2,"成年",function():void
         {
            _g2.ageChangeApply(newAge2);
         });
         _g3 = this;
         newAge3 = 3;
         addButton(3,"老年",function():void
         {
            _g3.ageChangeApply(newAge3);
         });
         addButton(14,"返回",accessDebugMenu);
      }
      
      public function ageChangeApply(param1:int = 0) : void
      {
         clearOutput();
         get_player().set_age(param1);
         if(get_player().get_HP() > get_player().maxHP())
         {
            get_player().set_HP(get_player().maxHP());
         }
         if(get_player().get_fatigue() > get_player().maxFatigue())
         {
            get_player().set_fatigue(get_player().maxFatigue());
         }
         statScreenRefresh();
         outputText("你的身躯扭曲变形，不断重塑，最终让你变成了一具" + get_player().ageDesc("幼童","青少年","成年人","老年人") + "的身体。");
         doNext(accessDebugMenu);
      }
      
      public function accessDebugMenu() : void
      {
         var selected:*;
         var _g:DebugMenu;
         var _loc1_:* = null as GenderDebug;
         var _loc2_:* = null as String;
         Profiling.LogProfilingReport();
         if(!get_game().get_inCombat())
         {
            _loc1_ = new GenderDebug(get_game(),get_game().output,get_game().player,accessDebugMenu);
            hideMenus();
            clearOutput();
            outputText("欢迎来到超级秘密的调试菜单！");
            menu();
            addButton(0,"生成物品",itemSpawnMenu).hint("生成任何你选择的物品，包括通常在游戏中无法获得的物品。");
            addButton(1,"修改属性",statChangeMenu).hint("修改你的核心属性。");
            addButton(2,"Flag编辑器",flagEditor).hint("编辑任何Flag。[pg]警告：这可能会弄坏你的存档！");
            addButton(3,"重置NPC",resetNPCMenu).hint("选择一个NPC进行重置。");
            addButton(4,"终止怀孕",abortPregnancy).disableIf(!get_player().isPregnant(),"你没有怀孕。");
            addButton(5,"转储状态效果",dumpEffectsMenu).hint("显示你的状态效果");
            addButton(6,"身体部位编辑器",bodyPartEditorRoot).hint("检查并微调玩家的身体部位");
            _g = this;
            selected = get_game();
            addButton(7,"场景测试",function():void
            {
               _g.testScene(selected);
            }).hint("手动触发一个场景。");
            addButton(8,_loc1_.getButtonText(),_loc1_.enter).hint(_loc1_.getButtonHint());
            addButton(9,"修改年龄",ageChangeMenu).hint("我又几岁了来着？");
            addNextButton("场景构建",echo).hint("测试一下。");
            addNextButton("存档编辑",selfDebug).hint("编辑使用新存档系统而非标志的角色、地点和物品。");
            _loc2_ = _console != null ? "切换回默认UI" : "切换为使用控制台UI";
            addNextButton("控制台",debugConsole).hint(_loc2_);
            addButton(14,"退出",playerMenu);
         }
         if(get_game().get_inCombat())
         {
            clearOutput();
            outputText("你举起魔杖转了一圈，但什么也没发生。看来它只有在你不在战斗中时才起作用。");
            doNext(playerMenu);
         }
      }
      
      public function abortPregnancy() : void
      {
         clearOutput();
         outputText("你感觉子宫里有什么东西正在溶解。液体从你的[vagina]流出，你的子宫现在感觉空荡荡的。<b>你不再怀孕了！</b>");
         get_player().knockUpForce();
         doNext(accessDebugMenu);
      }
   }
}

