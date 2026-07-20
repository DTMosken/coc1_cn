package classes
{
   import classes.display.GameViewData;
   import classes.display.ScreenType;
   import classes.display.Setting;
   import classes.display.SettingPane;
   import classes.display.SettingPaneData;
   import classes.display.SettingParams;
   import classes.globalFlags.KGAMECLASS;
   import classes.internals.Utils;
   import classes.saves.SelfSaver;
   import classes.saves.SelfSaving;
   import coc.view.ButtonDataList;
   import coc.view.CoCButton;
   import coc.view.MainView;
   import coc.view.Theme;
   import coc.view.ThemeLoader;
   import coc.view.ThemeObserver;
   import flash.Boot;
   import flash.display.DisplayObjectContainer;
   import flash.events.Event;
   import flash.text.TextField;
   import flash.text.TextFormat;
   import haxe.IMap;
   import haxe.ds.StringMap;
   
   public class GameSettings extends BaseContent implements ThemeObserver, SelfDebug, SelfSaving
   {
      
      public static var GLOBAL:Boolean = true;
      
      public static var LOCAL:Boolean = false;
      
      public static var GAMEPLAY:int = 0;
      
      public static var DISPLAY:int = 1;
      
      public static var FETISH:int = 2;
      
      public static var MODES:int = 3;
      
      public static var NPC:int = 4;
      
      public static var WARNING:int = 5;
      
      public static var PANES_CONFIG:Array = [["settingPaneGameplay","游戏玩法","游戏设置","你可以更改各种功能的运作方式。"],["settingPaneDisplay","显示","显示设置","你可以根据自己的喜好自定义界面的各个方面。"],["settingPaneFetish","性癖","性癖设置","你可以开启或关闭奇怪和极端的性癖。\n<b>警告：可能会覆盖其他设置。</b>"],["settingGameMods","游戏模式","游戏模式","你可以开启或关闭各种特殊功能，并调整游戏难度。"],["settingNPCMods","NPC","NPC设置","你可以在这里对NPC进行各种更改。"],["settingPaneWarning","警告","未加载存档","\n此选项卡中的设置是<b>本地</b>设置，保存在你的角色中。加载存档或开始新游戏以访问这些选项。\n\n"]];
      
      public var waitTheme:String;
      
      public var settingsGlobal:SettingsGlobal;
      
      public var saveVersion:int;
      
      public var saveName:String;
      
      public var readyForTheme:Boolean;
      
      public var quickReturn:Boolean;
      
      public var playerSettings:GameSettingsPlayer;
      
      public var panes:Array;
      
      public var overridePanes:Array;
      
      public var nameToIndex:IMap;
      
      public var lastDisplayedPane:SettingPane;
      
      public var initializedPanes:Boolean;
      
      public var globalSave:Boolean;
      
      public var displayingWarning:Boolean;
      
      public var autoloaded:Boolean;
      
      public function GameSettings()
      {
         if(Boot.skip_constructor)
         {
            return;
         }
         globalSave = true;
         saveVersion = 2;
         saveName = "settings";
         settingsGlobal = new SettingsGlobal(null,null,null,null);
         autoloaded = false;
         waitTheme = "";
         readyForTheme = false;
         nameToIndex = new StringMap();
         panes = [];
         quickReturn = false;
         overridePanes = [];
         initializedPanes = false;
         displayingWarning = false;
         super();
         SelfSaver.register(this);
         DebugMenu.register(this);
         Theme.subscribe(this);
         playerSettings = new GameSettingsPlayer();
         GameViewData.onSettingsUpdated = updateSettings;
      }
      
      public static function injectSettings(param1:SettingPane) : void
      {
         var _loc10_:* = null;
         var _loc11_:int = 0;
         var _loc12_:Boolean = false;
         var _loc13_:* = null as Array;
         var _loc14_:* = null as Array;
         var _loc15_:int = 0;
         var _loc16_:* = null as Setting;
         var _loc2_:StringMap = GameViewData.injectedDisplaySettings;
         var _loc3_:* = _loc2_.h;
         var _loc4_:* = _loc2_.rh;
         var _loc5_:int = 0;
         var _loc6_:* = _loc3_;
         var _loc7_:int = _loc5_;
         var _loc8_:Boolean = §§hasnext(_loc6_,_loc7_);
         if(!_loc8_ && _loc4_ != null)
         {
            _loc3_ = _loc4_;
            _loc6_ = _loc3_;
            _loc5_ = 0;
            _loc7_ = _loc5_;
            _loc4_ = null;
            _loc8_ = §§hasnext(_loc6_,_loc7_);
         }
         var _loc9_:int = _loc7_;
         while(true)
         {
            _loc10_ = _loc3_;
            _loc11_ = _loc5_;
            _loc12_ = §§hasnext(_loc10_,_loc11_);
            if(!_loc12_ && _loc4_ != null)
            {
               _loc3_ = _loc4_;
               _loc10_ = _loc3_;
               _loc5_ = 0;
               _loc11_ = _loc5_;
               _loc4_ = null;
               _loc12_ = §§hasnext(_loc10_,_loc11_);
            }
            _loc9_ = _loc11_;
            if(!_loc12_)
            {
               break;
            }
            _loc13_ = §§nextvalue(_loc9_,_loc3_);
            _loc5_ = _loc9_;
            _loc14_ = _loc13_;
            _loc15_ = 0;
            while(_loc15_ < int(_loc14_.length))
            {
               _loc16_ = _loc14_[_loc15_];
               _loc15_++;
               param1.addOrUpdateToggleSettings(_loc16_.label,_loc16_.options);
            }
         }
      }
      
      public function updateSettings() : void
      {
         setOrUpdateSettings(lastDisplayedPane);
         GameViewData.flush();
      }
      
      public function update(param1:String) : void
      {
         var _loc4_:* = null as SettingPane;
         var _loc5_:* = null as SettingPane;
         get_display().lastTheme = Theme.current.get_name();
         var _loc2_:int = 0;
         var _loc3_:Array = panes;
         while(_loc2_ < int(_loc3_.length))
         {
            _loc4_ = _loc3_[_loc2_];
            _loc2_++;
            _loc5_ = _loc4_;
            _loc5_.themeColors();
         }
      }
      
      public function toggleImagePack(param1:Boolean) : Function
      {
         var value:Boolean = param1;
         var _gthis:GameSettings = this;
         return function():void
         {
            _gthis.get_display().images = value;
            _gthis.setOrUpdateSettings(_gthis.lastDisplayedPane);
         };
      }
      
      public function toggleHotkeys() : void
      {
         get_display().showHotkeys = !get_display().showHotkeys;
         get_game().inputManager.showHotkeys(get_display().showHotkeys);
         setOrUpdateSettings(lastDisplayedPane);
      }
      
      public function toggleDebug(param1:Boolean) : Function
      {
         var value:Boolean = param1;
         var _gthis:GameSettings = this;
         return function():void
         {
            _gthis.set_debug(value);
            if(_gthis.get_hardcore())
            {
               _gthis.set_debug(false);
            }
            _gthis.setOrUpdateSettings(_gthis.lastDisplayedPane);
         };
      }
      
      public function toggleAutoTheme() : void
      {
         get_display().autoLoadTheme = !get_display().autoLoadTheme;
         themeMenu();
      }
      
      public function themeMenu() : void
      {
         var _loc4_:* = null as String;
         hideSettingPane();
         clearOutput();
         outputText("看到这行字时，说明正式文本尚未录入或正在赶来的路上。");
         menu();
         addButton(0,"自动加载：" + (get_display().autoLoadTheme ? "开启" : "关闭"),toggleAutoTheme).hint(get_display().autoLoadTheme ? "打开游戏时，将根据 themes 文件夹中的 AutoLoad.xml 自动加载自定义主题。" : "启用后，在打开游戏时自动加载自定义主题。");
         var _loc1_:ButtonDataList = new ButtonDataList();
         var _loc2_:int = 0;
         var _loc3_:Array = Theme.themeList();
         while(_loc2_ < int(_loc3_.length))
         {
            _loc4_ = _loc3_[_loc2_];
            _loc2_++;
            addNextButton(Utils.cnName2(_loc4_),(function(param1:Array, param2:Array):Function
            {
               var _g:Array = param1;
               var theme:Array = param2;
               return function():void
               {
                  _g[0].setTheme(theme[0]);
               };
            })([this],[_loc4_])).disableIf(Theme.current.get_name() == _loc4_,"这是当前主题。");
         }
         addNextButton("自定义",loadTheme).hint("加载外部主题。");
         setExitButton("返回",returnToSettings);
      }
      
      public function setupWarningPane() : void
      {
         var _loc1_:SettingPane = panes[5];
         _loc1_.addOrUpdateToggleSettings("覆盖",[new SettingParams("覆盖",localOverride,"<font size=\"14\">如果你必须在加载前出于某种原因更改本地设置，请点击“覆盖”。</font>",false,true)]);
         _loc1_.hideSearch();
      }
      
      public function setupNPCPane() : void
      {
         var _gthis9:GameSettings;
         var value9:*;
         var property9:String;
         var obj9:*;
         var _gthis8:GameSettings;
         var value8:*;
         var property8:String;
         var obj8:*;
         var _gthis7:GameSettings;
         var value7:*;
         var property7:String;
         var obj7:*;
         var _gthis6:GameSettings;
         var value6:*;
         var property6:String;
         var obj6:*;
         var _gthis5:GameSettings;
         var value5:*;
         var property5:String;
         var obj5:*;
         var _gthis4:GameSettings;
         var value4:*;
         var property4:String;
         var obj4:*;
         var _gthis3:GameSettings;
         var value3:*;
         var property3:String;
         var obj3:*;
         var _gthis2:GameSettings;
         var value2:*;
         var property2:String;
         var obj2:*;
         var _gthis1:GameSettings;
         var value:*;
         var property1:String;
         var obj1:*;
         var _gthis:GameSettings;
         var value1:*;
         var property:String;
         var obj:*;
         var _loc1_:SettingPane = panes[4];
         var _loc2_:* = get_hardcore() ? false : true;
         obj = playerSettings.settingsLocal.npc;
         property = "lowStandards";
         value1 = _loc2_;
         _gthis = this;
         var _loc3_:SettingParams = new SettingParams("开启",function():void
         {
            obj[property] = value1;
            _gthis.setOrUpdateSettings(_gthis.lastDisplayedPane);
         },"NPC在很多情况下会忽略体型偏好。不过性别偏好除外，你仍然需要有正确的洞。",get_npc().lowStandards,null);
         obj1 = playerSettings.settingsLocal.npc;
         property1 = "lowStandards";
         value = false;
         _gthis1 = this;
         _loc1_.addOrUpdateToggleSettings("低标准",[_loc3_,new SettingParams("关闭",function():void
         {
            obj1[property1] = value;
            _gthis1.setOrUpdateSettings(_gthis1.lastDisplayedPane);
         },get_hardcore() ? "硬核模式下不允许开启。" : "NPC将会有体型偏好。",!get_npc().lowStandards,null)]);
         obj2 = playerSettings.settingsLocal.npc;
         property2 = "shouldraChild";
         value2 = true;
         _gthis2 = this;
         var _loc4_:SettingParams = new SettingParams("小孩",function():void
         {
            obj2[property2] = value2;
            _gthis2.setOrUpdateSettings(_gthis2.lastDisplayedPane);
         },"舒尔德拉是一个小女孩。",get_npc().shouldraChild,null);
         obj3 = playerSettings.settingsLocal.npc;
         property3 = "shouldraChild";
         value3 = false;
         _gthis3 = this;
         _loc1_.addOrUpdateToggleSettings("舒尔德拉",[_loc4_,new SettingParams("年轻女子",function():void
         {
            obj3[property3] = value3;
            _gthis3.setOrUpdateSettings(_gthis3.lastDisplayedPane);
         },"你可以让舒尔德拉变成一个小女孩。",!get_npc().shouldraChild,null)]);
         obj4 = playerSettings.settingsLocal.npc;
         property4 = "gargoyleChild";
         value4 = true;
         _gthis4 = this;
         var _loc5_:SettingParams = new SettingParams("小孩",function():void
         {
            obj4[property4] = value4;
            _gthis4.setOrUpdateSettings(_gthis4.lastDisplayedPane);
         },"石像鬼是一个小女孩。",get_npc().gargoyleChild,null);
         obj5 = playerSettings.settingsLocal.npc;
         property5 = "gargoyleChild";
         value5 = false;
         _gthis5 = this;
         _loc1_.addOrUpdateToggleSettings("石像鬼",[_loc5_,new SettingParams("成熟",function():void
         {
            obj5[property5] = value5;
            _gthis5.setOrUpdateSettings(_gthis5.lastDisplayedPane);
         },"你可以让石像鬼变成一个小女孩。",!get_npc().gargoyleChild,null)]);
         obj6 = playerSettings.settingsLocal.npc;
         property6 = "genericLoliShota";
         value6 = true;
         _gthis6 = this;
         var _loc6_:SettingParams = new SettingParams("更多小孩",function():void
         {
            obj6[property6] = value6;
            _gthis6.setOrUpdateSettings(_gthis6.lastDisplayedPane);
         },"一些次要的、未命名的角色现在会更年轻。",get_npc().genericLoliShota,null);
         obj7 = playerSettings.settingsLocal.npc;
         property7 = "genericLoliShota";
         value7 = false;
         _gthis7 = this;
         _loc1_.addOrUpdateToggleSettings("通用NPC",[_loc6_,new SettingParams("正常",function():void
         {
            obj7[property7] = value7;
            _gthis7.setOrUpdateSettings(_gthis7.lastDisplayedPane);
         },"你可以让一些次要的、未命名的角色更年轻。",!get_npc().genericLoliShota,null)]);
         obj8 = playerSettings.settingsLocal.npc;
         property8 = "urtaDisabled";
         value8 = true;
         _gthis8 = this;
         var _loc7_:SettingParams = new SettingParams("不存在",function():void
         {
            obj8[property8] = value8;
            _gthis8.setOrUpdateSettings(_gthis8.lastDisplayedPane);
         },"乌尔塔不存在，除非你已经和她互动多次。",get_npc().urtaDisabled,null);
         obj9 = playerSettings.settingsLocal.npc;
         property9 = "urtaDisabled";
         value9 = false;
         _gthis9 = this;
         _loc1_.addOrUpdateToggleSettings("乌尔塔",[_loc7_,new SettingParams("存在",function():void
         {
            obj9[property9] = value9;
            _gthis9.setOrUpdateSettings(_gthis9.lastDisplayedPane);
         },"乌尔塔存在。",!get_npc().urtaDisabled,null)]);
      }
      
      public function setupModesPane() : void
      {
         var _gthis15:GameSettings;
         var value15:*;
         var property15:String;
         var obj15:*;
         var _gthis14:GameSettings;
         var value14:*;
         var property14:String;
         var obj14:*;
         var _gthis13:GameSettings;
         var value13:*;
         var property13:String;
         var obj13:*;
         var _gthis12:GameSettings;
         var value12:*;
         var property12:String;
         var obj12:*;
         var _gthis11:GameSettings;
         var value11:*;
         var property11:String;
         var obj11:*;
         var _gthis10:GameSettings;
         var value10:*;
         var property10:String;
         var obj10:*;
         var _gthis9:GameSettings;
         var value9:*;
         var property9:String;
         var obj9:*;
         var _gthis8:GameSettings;
         var value8:*;
         var property8:String;
         var obj8:*;
         var _gthis7:GameSettings;
         var value7:*;
         var property7:String;
         var obj7:*;
         var _gthis6:GameSettings;
         var value6:*;
         var property6:String;
         var obj6:*;
         var _gthis5:GameSettings;
         var value5:*;
         var property5:String;
         var obj5:*;
         var _gthis4:GameSettings;
         var value4:*;
         var property4:String;
         var obj4:*;
         var _gthis3:GameSettings;
         var value3:*;
         var property3:String;
         var obj3:*;
         var _gthis2:GameSettings;
         var value2:*;
         var property2:String;
         var obj2:*;
         var _gthis1:GameSettings;
         var value1:*;
         var property1:String;
         var obj1:*;
         var _gthis:GameSettings;
         var value:*;
         var property:String;
         var obj:*;
         var _loc1_:SettingPane = panes[3];
         _loc1_.addOrUpdateToggleSettings("游戏难度",[new SettingParams("选择",difficultySelectionMenu,getDifficultyText(),false,true)]);
         _loc1_.addOrUpdateToggleSettings("启用生存模式",[new SettingParams("启用",enableSurvivalPrompt,"<b>启用生存模式：</b>\n<font size=\"14\">" + (get_modes().survival ? "生存模式已启用。" : "你需要进食才能生存。") + "</font>",get_modes().survival,true)]);
         _loc1_.addOrUpdateToggleSettings("启用真实模式",[new SettingParams("启用",enableRealisticPrompt,"<b>启用真实模式：</b>\n<font size=\"14\">" + (get_modes().realistic ? "真实模式已启用。" : "限制精液产量，并对过大的身体部位施加惩罚。") + "</font>",get_modes().realistic,true)]);
         _loc1_.addOrUpdateToggleSettings("启用硬核模式",[new SettingParams("启用",chooseModeHardcoreSlot,"<b>启用硬核模式：</b>\n<font size=\"14\">" + (get_modes().hardcore ? "硬核模式已启用。" : "作弊将被禁用，且坏结局会删除你的存档。") + "</font>",get_modes().hardcore,true)]);
         obj = playerSettings.settingsLocal.modes;
         property = "silly";
         value = true;
         _gthis = this;
         var _loc2_:SettingParams = new SettingParams("开启",function():void
         {
            obj[property] = value;
            _gthis.setOrUpdateSettings(_gthis.lastDisplayedPane);
         },"可能会发生疯狂、荒谬而且很搞笑的事情。",get_modes().silly,null);
         obj1 = playerSettings.settingsLocal.modes;
         property1 = "silly";
         value1 = false;
         _gthis1 = this;
         _loc1_.addOrUpdateToggleSettings("搞怪模式",[_loc2_,new SettingParams("关闭",function():void
         {
            obj1[property1] = value1;
            _gthis1.setOrUpdateSettings(_gthis1.lastDisplayedPane);
         },"你是个无可救药、毫无幽默感的老古板。",!get_modes().silly,null)]);
         obj2 = playerSettings.settingsLocal.modes;
         property2 = "hyper";
         value2 = true;
         _gthis2 = this;
         var _loc3_:SettingParams = new SettingParams("开启",function():void
         {
            obj2[property2] = value2;
            _gthis2.setOrUpdateSettings(_gthis2.lastDisplayedPane);
         },"只有缩小药水和鹰嘴豆泥能缩小性征。男魅魔药水不会影响胸部，魅魔乳汁也不会影响阴茎。",get_modes().hyper,null);
         obj3 = playerSettings.settingsLocal.modes;
         property3 = "hyper";
         value3 = false;
         _gthis3 = this;
         _loc1_.addOrUpdateToggleSettings("夸张尺寸",[_loc3_,new SettingParams("关闭",function():void
         {
            obj3[property3] = value3;
            _gthis3.setOrUpdateSettings(_gthis3.lastDisplayedPane);
         },get_hardcore() ? "硬核模式下不允许。" : "男性强化药水会缩小女性性征，反之亦然。",!get_modes().hyper,null)]);
         obj4 = playerSettings.settingsLocal.modes;
         property4 = "temptation";
         value4 = true;
         _gthis4 = this;
         var _loc4_:SettingParams = new SettingParams("开启",function():void
         {
            obj4[property4] = value4;
            _gthis4.setOrUpdateSettings(_gthis4.lastDisplayedPane);
         },"玩家可能无法抗拒与怪物发生性行为。",get_modes().temptation,null);
         obj5 = playerSettings.settingsLocal.modes;
         property5 = "temptation";
         value5 = false;
         _gthis5 = this;
         _loc1_.addOrUpdateToggleSettings("诱惑",[_loc4_,new SettingParams("关闭",function():void
         {
            obj5[property5] = value5;
            _gthis5.setOrUpdateSettings(_gthis5.lastDisplayedPane);
         },"玩家可以完全控制自己的性欲。",!get_modes().temptation,null)]);
         obj6 = playerSettings.settingsLocal.modes;
         property6 = "taint";
         value6 = true;
         _gthis6 = this;
         var _loc5_:SettingParams = new SettingParams("开启",function():void
         {
            obj6[property6] = value6;
            _gthis6.setOrUpdateSettings(_gthis6.lastDisplayedPane);
         },"玩家每小时会获得少量的腐化。可以通过找到解药来阻止。",get_modes().taint,null);
         obj7 = playerSettings.settingsLocal.modes;
         property7 = "taint";
         value7 = false;
         _gthis7 = this;
         _loc1_.addOrUpdateToggleSettings("污秽蔓延",[_loc5_,new SettingParams("关闭",function():void
         {
            obj7[property7] = value7;
            _gthis7.setOrUpdateSettings(_gthis7.lastDisplayedPane);
         },"玩家不会随时间获得腐化。",!get_modes().taint,null)]);
         obj8 = playerSettings.settingsLocal.modes;
         property8 = "cooldowns";
         value8 = true;
         _gthis8 = this;
         var _loc6_:SettingParams = new SettingParams("开启",function():void
         {
            obj8[property8] = value8;
            _gthis8.setOrUpdateSettings(_gthis8.lastDisplayedPane);
         },"法术和技能有冷却时间。",get_modes().cooldowns,null);
         obj9 = playerSettings.settingsLocal.modes;
         property9 = "cooldowns";
         value9 = false;
         _gthis9 = this;
         _loc1_.addOrUpdateToggleSettings("短休",[_loc6_,new SettingParams("关闭",function():void
         {
            obj9[property9] = value9;
            _gthis9.setOrUpdateSettings(_gthis9.lastDisplayedPane);
         },"法术和技能没有冷却时间。",!get_modes().cooldowns,null)]);
         obj10 = playerSettings.settingsLocal.modes;
         property10 = "scaling";
         value10 = true;
         _gthis10 = this;
         var _loc7_:SettingParams = new SettingParams("开启",function():void
         {
            obj10[property10] = value10;
            _gthis10.setOrUpdateSettings(_gthis10.lastDisplayedPane);
         },"敌方等级会随你的等级动态调整。",get_modes().scaling,null);
         obj11 = playerSettings.settingsLocal.modes;
         property11 = "scaling";
         value11 = false;
         _gthis11 = this;
         _loc1_.addOrUpdateToggleSettings("常规训练",[_loc7_,new SettingParams("关闭",function():void
         {
            obj11[property11] = value11;
            _gthis11.setOrUpdateSettings(_gthis11.lastDisplayedPane);
         },"敌方等级不会随你的等级动态调整。",!get_modes().scaling,null)]);
         obj12 = playerSettings.settingsLocal.modes;
         property12 = "longHaul";
         value12 = true;
         _gthis12 = this;
         var _loc8_:SettingParams = new SettingParams("开启",function():void
         {
            obj12[property12] = value12;
            _gthis12.setOrUpdateSettings(_gthis12.lastDisplayedPane);
         },"在返回营地之前，你可能会遇到多次遭遇战。",get_modes().longHaul,null);
         obj13 = playerSettings.settingsLocal.modes;
         property13 = "longHaul";
         value13 = false;
         _gthis13 = this;
         _loc1_.addOrUpdateToggleSettings("长途跋涉",[_loc8_,new SettingParams("关闭",function():void
         {
            obj13[property13] = value13;
            _gthis13.setOrUpdateSettings(_gthis13.lastDisplayedPane);
         },"每次探索只会触发一次遭遇战。",!get_modes().longHaul,null)]);
         obj14 = playerSettings.settingsLocal.modes;
         property14 = "oldAscension";
         value14 = true;
         _gthis14 = this;
         var _loc9_:SettingParams = new SettingParams("开启",function():void
         {
            obj14[property14] = value14;
            _gthis14.setOrUpdateSettings(_gthis14.lastDisplayedPane);
         },"飞升不会重置你的角色。此模式未经过平衡。",get_modes().oldAscension,null);
         obj15 = playerSettings.settingsLocal.modes;
         property15 = "oldAscension";
         value15 = false;
         _gthis15 = this;
         _loc1_.addOrUpdateToggleSettings("旧版飞升",[_loc9_,new SettingParams("关闭",function():void
         {
            obj15[property15] = value15;
            _gthis15.setOrUpdateSettings(_gthis15.lastDisplayedPane);
         },"飞升会重置你的角色。",!get_modes().oldAscension,null)]);
      }
      
      public function setupGameplayPane() : void
      {
         var _gthis9:GameSettings;
         var value9:*;
         var property9:String;
         var obj9:*;
         var _gthis8:GameSettings;
         var value8:*;
         var property8:String;
         var obj8:*;
         var _gthis7:GameSettings;
         var value7:*;
         var property7:String;
         var obj7:*;
         var _gthis6:GameSettings;
         var value6:*;
         var property6:String;
         var obj6:*;
         var _gthis5:GameSettings;
         var value5:*;
         var property5:String;
         var obj5:*;
         var _gthis4:GameSettings;
         var value4:*;
         var property4:String;
         var obj4:*;
         var _gthis3:GameSettings;
         var value3:*;
         var property3:String;
         var obj3:*;
         var _gthis2:GameSettings;
         var value2:*;
         var property2:String;
         var obj2:*;
         var _gthis1:GameSettings;
         var value1:*;
         var property1:String;
         var obj1:*;
         var _gthis:GameSettings;
         var value:*;
         var property:String;
         var obj:*;
         var _loc1_:SettingPane = panes[0];
         obj = settingsGlobal.gameplay;
         property = "autoLevel";
         value = true;
         _gthis = this;
         var _loc2_:SettingParams = new SettingParams("开启",function():void
         {
            obj[property] = value;
            _gthis.setOrUpdateSettings(_gthis.lastDisplayedPane);
         },"积累足够的经验后，将自动升级。",get_gameplay().autoLevel,null);
         obj1 = settingsGlobal.gameplay;
         property1 = "autoLevel";
         value1 = false;
         _gthis1 = this;
         _loc1_.addOrUpdateToggleSettings("自动升级",[_loc2_,new SettingParams("关闭",function():void
         {
            obj1[property1] = value1;
            _gthis1.setOrUpdateSettings(_gthis1.lastDisplayedPane);
         },"通过点击“升级”按钮手动升级。",!get_gameplay().autoLevel,null)]);
         _loc1_.addOrUpdateToggleSettings("调试模式",[new SettingParams("开启",toggleDebug(true),"启用某些调试功能，逃跑必定成功，且可以忽略坏结局。",get_debug(),null),new SettingParams("关闭",toggleDebug(false),get_hardcore() ? "硬核模式下不允许。" : "调试模式已禁用。",!get_debug(),null)]);
         obj2 = settingsGlobal.gameplay;
         property2 = "quickloadAnywhere";
         value2 = true;
         _gthis2 = this;
         var _loc3_:SettingParams = new SettingParams("开启",function():void
         {
            obj2[property2] = value2;
            _gthis2.setOrUpdateSettings(_gthis2.lastDisplayedPane);
         },"你现在可以在任何地方快速读档。\n警告：实验性功能。可能会出现故障。",get_gameplay().quickloadAnywhere,null);
         obj3 = settingsGlobal.gameplay;
         property3 = "quickloadAnywhere";
         value3 = false;
         _gthis3 = this;
         _loc1_.addOrUpdateToggleSettings("随时快速读档",[_loc3_,new SettingParams("关闭",function():void
         {
            obj3[property3] = value3;
            _gthis3.setOrUpdateSettings(_gthis3.lastDisplayedPane);
         },"你只能在可以存档的区域快速读档。",!get_gameplay().quickloadAnywhere,null)]);
         obj4 = settingsGlobal.gameplay;
         property4 = "quicksaveConfirm";
         value4 = true;
         _gthis4 = this;
         var _loc4_:SettingParams = new SettingParams("开启",function():void
         {
            obj4[property4] = value4;
            _gthis4.setOrUpdateSettings(_gthis4.lastDisplayedPane);
         },"快速存档确认对话框已启用。",get_gameplay().quicksaveConfirm,null);
         obj5 = settingsGlobal.gameplay;
         property5 = "quicksaveConfirm";
         value5 = false;
         _gthis5 = this;
         _loc1_.addOrUpdateToggleSettings("快速存档确认",[_loc4_,new SettingParams("关闭",function():void
         {
            obj5[property5] = value5;
            _gthis5.setOrUpdateSettings(_gthis5.lastDisplayedPane);
         },"快速保存确认对话框已禁用。",!get_gameplay().quicksaveConfirm,null)]);
         obj6 = settingsGlobal.gameplay;
         property6 = "quickloadConfirm";
         value6 = true;
         _gthis6 = this;
         var _loc5_:SettingParams = new SettingParams("开启",function():void
         {
            obj6[property6] = value6;
            _gthis6.setOrUpdateSettings(_gthis6.lastDisplayedPane);
         },"快速读取确认对话框已启用。",get_gameplay().quickloadConfirm,null);
         obj7 = settingsGlobal.gameplay;
         property7 = "quickloadConfirm";
         value7 = false;
         _gthis7 = this;
         _loc1_.addOrUpdateToggleSettings("快速读取确认",[_loc5_,new SettingParams("关闭",function():void
         {
            obj7[property7] = value7;
            _gthis7.setOrUpdateSettings(_gthis7.lastDisplayedPane);
         },"快速读取确认对话框已禁用。",!get_gameplay().quickloadConfirm,null)]);
         obj8 = settingsGlobal.gameplay;
         property8 = "preload";
         value8 = 1;
         _gthis8 = this;
         var _loc6_:SettingParams = new SettingParams("自动",function():void
         {
            obj8[property8] = value8;
            _gthis8.setOrUpdateSettings(_gthis8.lastDisplayedPane);
         },preloadText(),get_gameplay().preload == 1,null);
         var _loc7_:SettingParams = new SettingParams("自定义",setCustomPath,preloadText(),false,true);
         obj9 = settingsGlobal.gameplay;
         property9 = "preload";
         value9 = 0;
         _gthis9 = this;
         _loc1_.addOrUpdateToggleSettings("预加载存档文件",[_loc6_,_loc7_,new SettingParams("关闭",function():void
         {
            obj9[property9] = value9;
            _gthis9.setOrUpdateSettings(_gthis9.lastDisplayedPane);
         },"游戏将不会尝试预加载文件。",get_gameplay().preload == 0,null)]);
      }
      
      public function setupFetishPane() : void
      {
         var _gthis15:GameSettings;
         var value15:*;
         var property15:String;
         var obj15:*;
         var _gthis14:GameSettings;
         var value14:*;
         var property14:String;
         var obj14:*;
         var _gthis13:GameSettings;
         var value13:*;
         var property13:String;
         var obj13:*;
         var _gthis12:GameSettings;
         var value12:*;
         var property12:String;
         var obj12:*;
         var _gthis11:GameSettings;
         var value11:*;
         var property11:String;
         var obj11:*;
         var _gthis10:GameSettings;
         var value10:*;
         var property10:String;
         var obj10:*;
         var _gthis9:GameSettings;
         var value9:*;
         var property9:String;
         var obj9:*;
         var _gthis8:GameSettings;
         var value8:*;
         var property8:String;
         var obj8:*;
         var _gthis7:GameSettings;
         var value7:*;
         var property7:String;
         var obj7:*;
         var _gthis6:GameSettings;
         var value6:*;
         var property6:String;
         var obj6:*;
         var _gthis5:GameSettings;
         var value5:*;
         var property5:String;
         var obj5:*;
         var _gthis4:GameSettings;
         var value4:*;
         var property4:String;
         var obj4:*;
         var _gthis3:GameSettings;
         var value3:*;
         var property3:String;
         var obj3:*;
         var _gthis2:GameSettings;
         var value2:*;
         var property2:String;
         var obj2:*;
         var _gthis1:GameSettings;
         var value1:*;
         var property1:String;
         var obj1:*;
         var _gthis:GameSettings;
         var value:*;
         var property:String;
         var obj:*;
         var _loc1_:SettingPane = panes[2];
         obj = settingsGlobal.fetishes;
         property = "addiction";
         value = true;
         _gthis = this;
         var _loc2_:SettingParams = new SettingParams("开启",function():void
         {
            obj[property] = value;
            _gthis.setOrUpdateSettings(_gthis.lastDisplayedPane);
         },"你可能会对某些物质成瘾。",get_fetish().addiction,null);
         obj1 = settingsGlobal.fetishes;
         property1 = "addiction";
         value1 = false;
         _gthis1 = this;
         _loc1_.addOrUpdateToggleSettings("成瘾",[_loc2_,new SettingParams("关闭",function():void
         {
            obj1[property1] = value1;
            _gthis1.setOrUpdateSettings(_gthis1.lastDisplayedPane);
         },"你完全不会成瘾，但现有的成瘾状态不会被移除。可能会阻止某些剧情发展。",!get_fetish().addiction,null)]);
         obj2 = settingsGlobal.fetishes;
         property2 = "furry";
         value2 = true;
         _gthis2 = this;
         var _loc3_:SettingParams = new SettingParams("开启",function():void
         {
            obj2[property2] = value2;
            _gthis2.setOrUpdateSettings(_gthis2.lastDisplayedPane);
         },"你会遇到各种口鼻、吻部，以及全身都覆盖毛皮或鳞片的生物。",get_fetish().furry,null);
         obj3 = settingsGlobal.fetishes;
         property3 = "furry";
         value3 = false;
         _gthis3 = this;
         _loc1_.addOrUpdateToggleSettings("福瑞",[_loc3_,new SettingParams("关闭",function():void
         {
            obj3[property3] = value3;
            _gthis3.setOrUpdateSettings(_gthis3.lastDisplayedPane);
         },"福瑞（兽人）已禁用。你只会遇到魔物人类和兽耳人类。",!get_fetish().furry,null)]);
         obj4 = settingsGlobal.fetishes;
         property4 = "watersports";
         value4 = true;
         _gthis4 = this;
         var _loc4_:SettingParams = new SettingParams("开启",function():void
         {
            obj4[property4] = value4;
            _gthis4.setOrUpdateSettings(_gthis4.lastDisplayedPane);
         },"圣水玩法已启用。你这个变态。",get_fetish().watersports,null);
         obj5 = settingsGlobal.fetishes;
         property5 = "watersports";
         value5 = false;
         _gthis5 = this;
         _loc1_.addOrUpdateToggleSettings("圣水（尿液）",[_loc4_,new SettingParams("关闭",function():void
         {
            obj5[property5] = value5;
            _gthis5.setOrUpdateSettings(_gthis5.lastDisplayedPane);
         },"你不会看到圣水玩法的场景。",!get_fetish().watersports,null)]);
         obj6 = settingsGlobal.fetishes;
         property6 = "gore";
         value6 = true;
         _gthis6 = this;
         var _loc5_:SettingParams = new SettingParams("开启",function():void
         {
            obj6[property6] = value6;
            _gthis6.setOrUpdateSettings(_gthis6.lastDisplayedPane);
         },"你可能会看到极端的性暴力或血腥场景。",get_fetish().gore,null);
         obj7 = settingsGlobal.fetishes;
         property7 = "gore";
         value7 = false;
         _gthis7 = this;
         _loc1_.addOrUpdateToggleSettings("血腥",[_loc5_,new SettingParams("关闭",function():void
         {
            obj7[property7] = value7;
            _gthis7.setOrUpdateSettings(_gthis7.lastDisplayedPane);
         },"你不会看到极端的性暴力或血腥场景。",!get_fetish().gore,null)]);
         obj8 = settingsGlobal.fetishes;
         property8 = "filth";
         value8 = true;
         _gthis8 = this;
         var _loc6_:SettingParams = new SettingParams("开启",function():void
         {
            obj8[property8] = value8;
            _gthis8.setOrUpdateSettings(_gthis8.lastDisplayedPane);
         },"你会遇到令人作呕的污秽生物、渗出的脓液等等。",get_fetish().filth,null);
         obj9 = settingsGlobal.fetishes;
         property9 = "filth";
         value9 = false;
         _gthis9 = this;
         _loc1_.addOrUpdateToggleSettings("污秽",[_loc6_,new SettingParams("关闭",function():void
         {
            obj9[property9] = value9;
            _gthis9.setOrUpdateSettings(_gthis9.lastDisplayedPane);
         },"你不会遇到令人作呕的污秽事件。",!get_fetish().filth,null)]);
         obj10 = settingsGlobal.fetishes;
         property10 = "parasites";
         value10 = 2;
         _gthis10 = this;
         var _loc7_:SettingParams = new SettingParams("开启",function():void
         {
            obj10[property10] = value10;
            _gthis10.setOrUpdateSettings(_gthis10.lastDisplayedPane);
         },"你可能会遇到寄生虫。",get_fetish().parasites == 2,null);
         obj11 = settingsGlobal.fetishes;
         property11 = "parasites";
         value11 = 1;
         _gthis11 = this;
         var _loc8_:SettingParams = new SettingParams("低",function():void
         {
            obj11[property11] = value11;
            _gthis11.setOrUpdateSettings(_gthis11.lastDisplayedPane);
         },"你可能会遇到寄生虫，但概率会降低。",get_fetish().parasites == 1,null);
         obj12 = settingsGlobal.fetishes;
         property12 = "parasites";
         value12 = 0;
         _gthis12 = this;
         _loc1_.addOrUpdateToggleSettings("寄生虫",[_loc7_,_loc8_,new SettingParams("关闭",function():void
         {
            obj12[property12] = value12;
            _gthis12.setOrUpdateSettings(_gthis12.lastDisplayedPane);
         },"你不会遇到寄生虫。",get_fetish().parasites == 0,null)]);
         obj13 = settingsGlobal.fetishes;
         property13 = "underage";
         value13 = 2;
         _gthis13 = this;
         var _loc9_:SettingParams = new SettingParams("开启",function():void
         {
            obj13[property13] = value13;
            _gthis13.setOrUpdateSettings(_gthis13.lastDisplayedPane);
         },"没有太年轻这一说。",get_fetish().underage == 2,null);
         obj14 = settingsGlobal.fetishes;
         property14 = "underage";
         value14 = 1;
         _gthis14 = this;
         var _loc10_:SettingParams = new SettingParams("部分",function():void
         {
            obj14[property14] = value14;
            _gthis14.setOrUpdateSettings(_gthis14.lastDisplayedPane);
         },"启用未成年内容，但不会太小（没有婴儿或幼儿）。",get_fetish().underage == 1,null);
         obj15 = settingsGlobal.fetishes;
         property15 = "underage";
         value15 = 0;
         _gthis15 = this;
         _loc1_.addOrUpdateToggleSettings("未成年",[_loc9_,_loc10_,new SettingParams("关闭",function():void
         {
            obj15[property15] = value15;
            _gthis15.setOrUpdateSettings(_gthis15.lastDisplayedPane);
         },"你不会看到涉及儿童的性内容。",get_fetish().underage == 0,null)]);
      }
      
      public function setupDisplayPane() : void
      {
         var _gthis10:GameSettings;
         var value10:*;
         var property10:String;
         var obj10:*;
         var _gthis9:GameSettings;
         var value9:*;
         var property9:String;
         var obj9:*;
         var _gthis8:GameSettings;
         var value8:*;
         var property8:String;
         var obj8:*;
         var _gthis7:GameSettings;
         var value7:*;
         var property7:String;
         var obj7:*;
         var _gthis6:GameSettings;
         var value6:*;
         var property6:String;
         var obj6:*;
         var _gthis5:GameSettings;
         var value5:*;
         var property5:String;
         var obj5:*;
         var _gthis4:GameSettings;
         var value4:*;
         var property4:String;
         var obj4:*;
         var _gthis3:GameSettings;
         var value3:*;
         var property3:String;
         var obj3:*;
         var _gthis2:GameSettings;
         var value2:*;
         var property2:String;
         var obj2:*;
         var _gthis1:GameSettings;
         var value1:*;
         var property1:String;
         var obj1:*;
         var _gthis:GameSettings;
         var value:*;
         var property:String;
         var obj:*;
         var _loc1_:SettingPane = panes[1];
         _loc1_.addOrUpdateToggleSettings("主题",[new SettingParams("选择",themeMenu,"",false,null)]);
         _loc1_.addOrUpdateToggleSettings("文本背景",[new SettingParams("选择",menuTextBackground,"",false,null)]);
         _loc1_.addOrUpdateToggleSettings("字体大小",[new SettingParams("调整",fontSettingsMenu,"<b>字体大小：" + get_display().fontSize + "</b>",false,true)]);
         GameSettings.injectSettings(_loc1_);
         obj = settingsGlobal.display;
         property = "sprites";
         value = 2;
         _gthis = this;
         var _loc2_:SettingParams = new SettingParams("新版",function():void
         {
            obj[property] = value;
            _gthis.setOrUpdateSettings(_gthis.lastDisplayedPane);
         },"你喜欢看漂亮的图片。现在将显示新的16位精灵图。",get_display().sprites == 2,null);
         obj1 = settingsGlobal.display;
         property1 = "sprites";
         value1 = 1;
         _gthis1 = this;
         var _loc3_:SettingParams = new SettingParams("旧版",function():void
         {
            obj1[property1] = value1;
            _gthis1.setOrUpdateSettings(_gthis1.lastDisplayedPane);
         },"你喜欢看漂亮的图片。现在将显示旧的8位精灵图。",get_display().sprites == 1,null);
         obj2 = settingsGlobal.display;
         property2 = "sprites";
         value2 = 0;
         _gthis2 = this;
         _loc1_.addOrUpdateToggleSettings("立绘",[_loc2_,_loc3_,new SettingParams("关闭",function():void
         {
            obj2[property2] = value2;
            _gthis2.setOrUpdateSettings(_gthis2.lastDisplayedPane);
         },"只有文字。没有别的。",get_display().sprites == 0,null)]);
         _loc1_.addOrUpdateToggleSettings("图片包",[new SettingParams("开启",toggleImagePack(true),"图片包当前已启用。",get_display().images,null),new SettingParams("关闭",toggleImagePack(false),"将不会显示图像包中的图像。",!get_display().images,null)]);
         obj3 = settingsGlobal.display;
         property3 = "time12Hour";
         value3 = true;
         _gthis3 = this;
         _loc2_ = new SettingParams("12小时制",function():void
         {
            obj3[property3] = value3;
            _gthis3.setOrUpdateSettings(_gthis3.lastDisplayedPane);
         },"时间将以12小时制显示。（上午/下午）",get_display().time12Hour,null);
         obj4 = settingsGlobal.display;
         property4 = "time12Hour";
         value4 = false;
         _gthis4 = this;
         _loc1_.addOrUpdateToggleSettings("时间格式",[_loc2_,new SettingParams("24小时制",function():void
         {
            obj4[property4] = value4;
            _gthis4.setOrUpdateSettings(_gthis4.lastDisplayedPane);
         },"时间将以24小时制显示。",!get_display().time12Hour,null)]);
         obj5 = settingsGlobal.display;
         property5 = "metric";
         value5 = false;
         _gthis5 = this;
         _loc3_ = new SettingParams("英制",function():void
         {
            obj5[property5] = value5;
            _gthis5.setOrUpdateSettings(_gthis5.lastDisplayedPane);
         },"各种测量值将以英制单位（英寸、英尺）显示。",!get_display().metric,null);
         obj6 = settingsGlobal.display;
         property6 = "metric";
         value6 = true;
         _gthis6 = this;
         _loc1_.addOrUpdateToggleSettings("度量单位",[_loc3_,new SettingParams("公制",function():void
         {
            obj6[property6] = value6;
            _gthis6.setOrUpdateSettings(_gthis6.lastDisplayedPane);
         },"各种测量值将以公制单位（厘米、米）显示。",get_display().metric,null)]);
         obj7 = settingsGlobal.display;
         property7 = "animateStatBars";
         value7 = true;
         _gthis7 = this;
         var _loc4_:SettingParams = new SettingParams("开启",function():void
         {
            obj7[property7] = value7;
            _gthis7.setOrUpdateSettings(_gthis7.lastDisplayedPane);
         },"属性条和数字在发生变化时会播放动画。",get_display().animateStatBars,null);
         obj8 = settingsGlobal.display;
         property8 = "animateStatBars";
         value8 = false;
         _gthis8 = this;
         _loc1_.addOrUpdateToggleSettings("属性条动画",[_loc4_,new SettingParams("关闭",function():void
         {
            obj8[property8] = value8;
            _gthis8.setOrUpdateSettings(_gthis8.lastDisplayedPane);
         },"属性将不会播放动画。",!get_display().animateStatBars,null)]);
         obj9 = settingsGlobal.display;
         property9 = "oldFont";
         value9 = false;
         _gthis9 = this;
         var _loc5_:SettingParams = new SettingParams("新",function():void
         {
            obj9[property9] = value9;
            _gthis9.setOrUpdateSettings(_gthis9.lastDisplayedPane);
         },"将使用 Palatino Linotype 字体。这是当前字体。",!get_display().oldFont,null);
         obj10 = settingsGlobal.display;
         property10 = "oldFont";
         value10 = true;
         _gthis10 = this;
         _loc1_.addOrUpdateToggleSettings("侧边栏字体",[_loc5_,new SettingParams("旧",function():void
         {
            obj10[property10] = value10;
            _gthis10.setOrUpdateSettings(_gthis10.lastDisplayedPane);
         },"将使用 Lucida Sans Typewriter 字体。这是旧版字体。",get_display().oldFont,null)]);
         _loc1_.addOrUpdateToggleSettings("显示快捷键",[new SettingParams("开启",toggleHotkeys,"快捷键将显示在按钮上。",get_display().showHotkeys,null),new SettingParams("关闭",toggleHotkeys,"按钮上将不会显示快捷键。",!get_display().showHotkeys,null)]);
      }
      
      public function set_npc(param1:SettingsNPC) : SettingsNPC
      {
         get_local().npc = param1;
         return param1;
      }
      
      public function set_modes(param1:SettingsModes) : SettingsModes
      {
         get_local().modes = param1;
         return param1;
      }
      
      public function set_misc(param1:SettingsGlobalMisc) : SettingsGlobalMisc
      {
         get_global().misc = param1;
         return param1;
      }
      
      public function set_local(param1:SettingsLocal) : SettingsLocal
      {
         return playerSettings.settingsLocal = param1;
      }
      
      public function set_global(param1:SettingsGlobal) : SettingsGlobal
      {
         return settingsGlobal = param1;
      }
      
      public function set_gameplay(param1:SettingsGlobalGameplay) : SettingsGlobalGameplay
      {
         get_global().gameplay = param1;
         return param1;
      }
      
      public function set_fetish(param1:SettingsGlobalFetishes) : SettingsGlobalFetishes
      {
         get_global().fetishes = param1;
         return param1;
      }
      
      public function set_display(param1:SettingsGlobalDisplay) : SettingsGlobalDisplay
      {
         get_global().display = param1;
         return param1;
      }
      
      public function setTheme(param1:String) : void
      {
         Theme.set_current(Theme.getTheme(param1));
         applyTheme();
      }
      
      public function setOrUpdateSettings(param1:SettingPane) : void
      {
         disableHardcoreCheatSettings();
         switch(paneIndex(param1))
         {
            case 0:
               setupGameplayPane();
               break;
            case 1:
               setupDisplayPane();
               break;
            case 2:
               setupFetishPane();
               break;
            case 3:
               setupModesPane();
               break;
            case 4:
               setupNPCPane();
               break;
            case 5:
               setupWarningPane();
         }
         param1.update();
         GameViewData.settingPaneData = new SettingPaneData(GameSettings.PANES_CONFIG[paneIndex(param1)],param1.settingData);
      }
      
      public function setCustomPath() : void
      {
         var _loc1_:String = "";
         var _loc2_:int = 4096;
         hideSettingPane();
         clearOutput();
         outputText("输入你保存存档的文件夹路径。");
         menu();
         promptInput({
            "width":700,
            "maxChars":_loc2_,
            "restrict":_loc1_,
            "text":(get_gameplay().preloadPath != null ? get_gameplay().preloadPath : "")
         });
         onInputChanged(setClearButton);
         outputText("[pg++]注意（主要针对Windows系统）：");
         outputText("[pg-] • 你可以使用绝对路径（例如 C:\\Games\\CoC），或者相对路径（例如 .\\Saves）。");
         outputText("[pg-] • 相对路径是相对于 swf 文件所在的位置，而不是你的 Flash 播放器。");
         outputText("[pg-] • 使用 / 或 \\ 来分隔文件夹应该都没问题。");
         outputText("[pg-] • 你无法使用环境变量，例如 %APPDATA%。");
         outputText("[pg-] • 任何清除你 Flash 存档的操作也会清除此设置。");
         addNextButton("确定",saveCustomPath);
         addNextButton("清除",clearInput).disableIf(getInput().length == 0);
         setExitButton("返回",returnToSettings);
      }
      
      public function setClearButton(param1:Event) : void
      {
         button(null,"清除").disableEnable(getInput().length == 0);
      }
      
      public function setButtons() : void
      {
         menu();
         var _loc1_:int = 0;
         while(_loc1_ < int(panes.length))
         {
            if(_loc1_ != 5)
            {
               addRowButton(paneGlobal(_loc1_) ? 0 : 1,paneButton(_loc1_),(function(param1:Array, param2:Array):Function
               {
                  var _g:Array = param1;
                  var pane:Array = param2;
                  return function():void
                  {
                     _g[0].displaySettingPane(pane[0]);
                  };
               })([this],[panes[_loc1_]])).disableIf(lastDisplayedPane == panes[_loc1_]);
            }
            _loc1_++;
         }
         addRowButton(0,"操作",displayControls);
         setExitButton(get_player().charCreation ? "继续" : "返回",exitSettings);
      }
      
      public function saveToObject() : Object
      {
         return settingsGlobal;
      }
      
      public function saveCustomPath() : void
      {
         get_gameplay().preload = 2;
         get_gameplay().preloadPath = getInput();
         returnToSettings();
      }
      
      public function returnToSettings() : void
      {
         displaySettingPane(lastDisplayedPane);
      }
      
      public function resetControlsYes() : void
      {
         get_game().inputManager.ResetToDefaults();
         clearOutput();
         outputText("按键已重置为默认设置！");
         doNext(displayControls);
      }
      
      public function resetControls() : void
      {
         get_game().inputManager.HideBindingPane();
         clearOutput();
         outputText("你确定要将所有当前绑定的按键重置为默认设置吗？");
         doYesNo(resetControlsYes,displayControls);
      }
      
      public function reset() : void
      {
         settingsGlobal = new SettingsGlobal(null,null,null,null);
      }
      
      public function quickSettings() : void
      {
         quickReturn = true;
         enterSettings();
      }
      
      public function preloadText() : String
      {
         var _loc3_:Boolean = false;
         var _loc4_:Boolean = false;
         var _loc1_:String = "";
         var _loc2_:int = get_gameplay().preload;
         if(_loc2_ == 1 == true)
         {
            _loc1_ = "<b>预加载存档文件：<font color=\"#008000\">自动</font></b>\n<font size=\"14\">在启动时尝试预加载上一个存档，以便立即“继续”。\n如果是保存到文件，CoC 会检查其自身文件夹，然后检查任何“Saves”子文件夹。</font>";
         }
         else
         {
            _loc4_ = _loc2_ == 2;
            if(_loc4_ == true)
            {
               _loc1_ = "<b>预加载存档文件：<font color=\"#008000\">自定义</font></b>\n<font size=\"14\">在启动时尝试预加载上一个存档，以便立即“继续”。\n检查位于 \'" + get_gameplay().preloadPath + "\' 的文件存档。</font>";
            }
            else
            {
               _loc3_ = _loc2_ == 0;
               if(_loc3_ == true)
               {
                  _loc1_ = "游戏不会尝试预加载文件。";
               }
            }
         }
         return _loc1_;
      }
      
      public function paneName(param1:Object, param2:SettingPane = undefined) : String
      {
         if(param1 == null)
         {
            param1 = paneIndex(param2);
         }
         return GameSettings.PANES_CONFIG[param1][0];
      }
      
      public function paneIndex(param1:SettingPane) : int
      {
         var _loc5_:* = null as IMap;
         var _loc6_:* = null as String;
         var _loc7_:* = null as StringMap;
         var _loc10_:int = 0;
         var _loc2_:IMap = nameToIndex;
         var _loc3_:String = param1.name;
         var _loc4_:StringMap = _loc2_;
         if(_loc3_ in StringMap.reserved ? _loc4_.existsReserved(_loc3_) : _loc3_ in _loc4_.h)
         {
            _loc5_ = nameToIndex;
            _loc6_ = param1.name;
            _loc7_ = _loc5_;
            if(_loc6_ in StringMap.reserved)
            {
               return _loc7_.getReserved(_loc6_);
            }
            return _loc7_.h[_loc6_];
         }
         var _loc8_:int = 0;
         var _loc9_:int = int(GameSettings.PANES_CONFIG.length);
         while(_loc8_ < _loc9_)
         {
            _loc10_ = _loc8_++;
            if(param1.name == paneName(_loc10_))
            {
               return _loc10_;
            }
         }
         return -1;
      }
      
      public function paneHeader(param1:Object, param2:SettingPane = undefined) : String
      {
         if(param1 == null)
         {
            param1 = paneIndex(param2);
         }
         return GameSettings.PANES_CONFIG[param1][2];
      }
      
      public function paneGlobal(param1:Object, param2:SettingPane = undefined) : Boolean
      {
         if(param1 == null)
         {
            param1 = paneIndex(param2);
         }
         if(param1 != 3)
         {
            return param1 != 4;
         }
         return false;
      }
      
      public function paneDesc(param1:Object, param2:SettingPane = undefined) : String
      {
         if(param1 == null)
         {
            param1 = paneIndex(param2);
         }
         return GameSettings.PANES_CONFIG[param1][3];
      }
      
      public function paneButton(param1:Object, param2:SettingPane = undefined) : String
      {
         if(param1 == null)
         {
            param1 = paneIndex(param2);
         }
         return GameSettings.PANES_CONFIG[param1][1];
      }
      
      public function onAscend(param1:Boolean) : void
      {
      }
      
      public function npcSet(param1:String, param2:*) : Function
      {
         var obj:* = playerSettings.settingsLocal.npc;
         var property1:String = param1;
         var value1:* = param2;
         var _gthis:GameSettings = this;
         return function():void
         {
            obj[property1] = value1;
            _gthis.setOrUpdateSettings(_gthis.lastDisplayedPane);
         };
      }
      
      public function modeSet(param1:String, param2:*) : Function
      {
         var obj:* = playerSettings.settingsLocal.modes;
         var property1:String = param1;
         var value1:* = param2;
         var _gthis:GameSettings = this;
         return function():void
         {
            obj[property1] = value1;
            _gthis.setOrUpdateSettings(_gthis.lastDisplayedPane);
         };
      }
      
      public function menuTextBackground() : void
      {
         var type4:int;
         var _g4:GameSettings;
         var type3:int;
         var _g3:GameSettings;
         var type2:int;
         var _g2:GameSettings;
         var type1:int;
         var _g1:GameSettings;
         var type:int;
         var _g:GameSettings;
         hideSettingPane();
         clearOutput();
         outputText("看到这行字时，说明正式文本尚未录入或正在赶来的路上。");
         menu();
         _g = this;
         type = 0;
         addNextButton("主题",function():void
         {
            _g.chooseTextBackground(type);
         }).disableIf(get_display().textBackground == 0,"这是当前设置。");
         _g1 = this;
         type1 = 3;
         addNextButton("普通",function():void
         {
            _g1.chooseTextBackground(type1);
         }).disableIf(get_display().textBackground == 3,"这是当前设置。");
         _g2 = this;
         type2 = 1;
         addNextButton("白色",function():void
         {
            _g2.chooseTextBackground(type2);
         }).disableIf(get_display().textBackground == 1,"这是当前设置。");
         _g3 = this;
         type3 = 2;
         addNextButton("棕褐色",function():void
         {
            _g3.chooseTextBackground(type3);
         }).disableIf(get_display().textBackground == 2,"这是当前设置。");
         _g4 = this;
         type4 = -1;
         addNextButton("透明",function():void
         {
            _g4.chooseTextBackground(type4);
         }).disableIf(get_display().textBackground == -1,"这是当前设置。");
         setExitButton("返回",returnToSettings);
      }
      
      public function localOverride() : void
      {
         hideSettingPane();
         clearOutput();
         outputText("覆盖将允许你编辑这些设置，下次加载存档时，此选项卡中的设置将不会被加载，而是保留你现在设置的内容。");
         outputText("[pg]你确定要覆盖吗？");
         doYesNo(confirmOverride,returnToSettings);
      }
      
      public function loadTheme() : void
      {
         menu();
         setExitButton("取消",themeMenu);
         new ThemeLoader(applyTheme,true).load();
      }
      
      public function load(param1:int, param2:*) : void
      {
         if(param1 < 2)
         {
            if(Reflect.hasField(param2,"autoLoadTheme"))
            {
               settingsGlobal.display.autoLoadTheme = Reflect.field(param2,"autoLoadTheme");
            }
            if(Reflect.hasField(param2,"lastTheme"))
            {
               settingsGlobal.display.lastTheme = Reflect.field(param2,"lastTheme");
            }
         }
         Utils.recursiveLoad(param2,settingsGlobal);
      }
      
      public function lastTheme() : void
      {
         var _loc1_:* = null as Theme;
         if(readyForTheme)
         {
            _loc1_ = Theme.getTheme(get_display().lastTheme);
            if(_loc1_ != null)
            {
               Theme.set_current(_loc1_);
               get_mainViewManager().applyTheme();
            }
         }
      }
      
      public function hideSettingPane() : void
      {
         GameViewData.screenType = ScreenType.Default;
         get_mainView().mainText.visible = true;
         var _loc1_:SettingPane = displayingWarning ? panes[5] : lastDisplayedPane;
         if(_loc1_ != null && _loc1_.parent != null)
         {
            _loc1_.parent.removeChild(_loc1_);
         }
         displayingWarning = false;
      }
      
      public function hideControls() : void
      {
         get_game().inputManager.HideBindingPane();
         returnToSettings();
      }
      
      public function get_npc() : SettingsNPC
      {
         return get_local().npc;
      }
      
      public function get_modes() : SettingsModes
      {
         return get_local().modes;
      }
      
      public function get_misc() : SettingsGlobalMisc
      {
         return get_global().misc;
      }
      
      public function get_local() : SettingsLocal
      {
         return playerSettings.settingsLocal;
      }
      
      public function get_global() : SettingsGlobal
      {
         return settingsGlobal;
      }
      
      public function get_gameplay() : SettingsGlobalGameplay
      {
         return get_global().gameplay;
      }
      
      public function get_fetish() : SettingsGlobalFetishes
      {
         return get_global().fetishes;
      }
      
      public function get_display() : SettingsGlobalDisplay
      {
         return get_global().display;
      }
      
      public function get_debugName() : String
      {
         return "设置";
      }
      
      public function get_debugHint() : String
      {
         return "";
      }
      
      public function getDifficultyText() : String
      {
         var _loc1_:String = "<b>难度：";
         var _loc2_:int = get_difficulty();
         if(_loc2_ == -2)
         {
            _loc1_ += "<font color=\"#008000\">简单</font></b>\n<font size=\"14\">战斗更加轻松，且可以无视坏结局。</font>";
         }
         else if(_loc2_ == 0)
         {
            _loc1_ += "<font color=\"#808000\">普通</font></b>\n<font size=\"14\">敌方属性无加成。遭遇坏结局后可以带着惩罚继续游戏。</font>";
         }
         else if(_loc2_ == 1)
         {
            _loc1_ += "<font color=\"#800000\">困难</font></b>\n<font size=\"14\">敌方生命值增加25%，造成的伤害增加15%。坏结局会直接毁掉你的游戏进度。</font>";
         }
         else if(_loc2_ == 2)
         {
            _loc1_ += "<font color=\"#C00000\">梦魇</font></b>\n<font size=\"14\">敌方生命值增加50%，造成的伤害增加30%。</font>";
         }
         else if(_loc2_ == 3)
         {
            _loc1_ += "<font color=\"#FF0000\">极限</font></b>\n<font size=\"14\">敌方生命值增加100%，造成的伤害增加50%。</font>";
         }
         else
         {
            _loc1_ += "代码出错了！</b>";
         }
         return _loc1_;
      }
      
      public function gameplaySet(param1:String, param2:*) : Function
      {
         var obj:* = settingsGlobal.gameplay;
         var property1:String = param1;
         var value1:* = param2;
         var _gthis:GameSettings = this;
         return function():void
         {
            obj[property1] = value1;
            _gthis.setOrUpdateSettings(_gthis.lastDisplayedPane);
         };
      }
      
      public function fontSettingsMenu() : void
      {
         var change2:int;
         var _g2:GameSettings;
         var change1:int;
         var _g1:GameSettings;
         var change:int;
         var _g:GameSettings;
         hideSettingPane();
         clearOutput();
         outputText("字体大小当前设置为 " + get_display().fontSize + "。[pg]");
         outputText("看到这行字时，说明正式文本尚未录入或正在赶来的路上。");
         menu();
         _g = this;
         change = -1;
         addButton(0,"缩小字体",function():void
         {
            _g.adjustFontSize(change);
         });
         _g1 = this;
         change1 = 1;
         addButton(1,"放大字体",function():void
         {
            _g1.adjustFontSize(change1);
         });
         _g2 = this;
         change2 = 0;
         addButton(2,"重置大小",function():void
         {
            _g2.adjustFontSize(change2);
         });
         setExitButton("返回",returnToSettings);
      }
      
      public function fetishSet(param1:String, param2:*) : Function
      {
         var obj:* = settingsGlobal.fetishes;
         var property1:String = param1;
         var value1:* = param2;
         var _gthis:GameSettings = this;
         return function():void
         {
            obj[property1] = value1;
            _gthis.setOrUpdateSettings(_gthis.lastDisplayedPane);
         };
      }
      
      public function exitSettings() : void
      {
         disableHardcoreCheatSettings();
         GameViewData.settingPaneData = null;
         GameViewData.screenType = ScreenType.Default;
         get_game().saves.savePermObject();
         hideSettingPane();
         if(quickReturn)
         {
            quickReturn = false;
            get_game().mainMenu.continueButton();
         }
         else if(get_player().charCreation)
         {
            get_game().charCreation.startTheGame();
         }
         else
         {
            get_game().mainMenu.mainMenu();
         }
      }
      
      public function enterSettings(param1:int = -1) : void
      {
         var _loc2_:* = null as SettingPane;
         get_game().saves.savePermObject();
         get_game().mainMenu.hideMainMenu();
         hideMenus();
         if(!initializedPanes)
         {
            configurePanes();
         }
         if(param1 < 0)
         {
            _loc2_ = lastDisplayedPane != null ? lastDisplayedPane : panes[0];
         }
         else
         {
            _loc2_ = panes[param1];
         }
         if(get_player().charCreation && param1 == 3)
         {
            get_modes().survival = false;
            get_modes().realistic = false;
            get_modes().hardcore = false;
            get_modes().hardcoreSlot = null;
         }
         clearOutput();
         displaySettingPane(_loc2_);
      }
      
      public function enterSFWMode() : void
      {
         hideSettingPane();
         clearOutput();
         outputText("敬请期待。");
         doNext(returnToSettings);
      }
      
      public function enableSurvivalPrompt() : void
      {
         hideSettingPane();
         clearOutput();
         outputText("你确定要开启生存模式吗？");
         outputText("[pg]你将无法关闭它！（除非你立即重新读档。）");
         doYesNo(enableSurvivalForReal,returnToSettings);
      }
      
      public function enableSurvivalForReal() : void
      {
         clearOutput();
         outputText("生存模式现已启用。");
         get_player().hunger = 80;
         get_modes().survival = true;
         doNext(returnToSettings);
      }
      
      public function enableRealisticPrompt() : void
      {
         hideSettingPane();
         clearOutput();
         outputText("你确定要开启真实模式吗？");
         outputText("[pg]你将无法关闭它！（除非你立即重新读档。）");
         doYesNo(enableRealisticForReal,returnToSettings);
      }
      
      public function enableRealisticForReal() : void
      {
         clearOutput();
         outputText("真实模式现已启用。");
         get_modes().realistic = true;
         doNext(returnToSettings);
      }
      
      public function displaySettingPane(param1:SettingPane) : void
      {
         hideSettingPane();
         lastDisplayedPane = param1;
         get_mainView().mainText.visible = false;
         KGAMECLASS.kGAMECLASS.mainView.nameBox.visible = false;
         var _loc2_:int = paneIndex(param1);
         if(initializedPanes && overridePanes.indexOf(_loc2_) < 0 && !paneGlobal(_loc2_) && !get_player().loaded && !get_player().charCreation)
         {
            displayingWarning = true;
            param1 = panes[5];
         }
         get_mainView().setMainFocus(param1,false,true);
         setOrUpdateSettings(param1);
         GameViewData.settingPaneData = new SettingPaneData(GameSettings.PANES_CONFIG[paneIndex(param1)],param1.settingData);
         GameViewData.screenType = ScreenType.OptionsMenu;
         setButtons();
      }
      
      public function displaySet(param1:String, param2:*) : Function
      {
         var obj:* = settingsGlobal.display;
         var property1:String = param1;
         var value1:* = param2;
         var _gthis:GameSettings = this;
         return function():void
         {
            obj[property1] = value1;
            _gthis.setOrUpdateSettings(_gthis.lastDisplayedPane);
         };
      }
      
      public function displayControls() : void
      {
         hideSettingPane();
         get_mainView().hideAllMenuButtons();
         get_game().inputManager.DisplayBindingPane();
         menu();
         addButton(0,"重置按键",resetControls);
         addButton(1,"清除按键",clearControls);
         addButton(14,"返回",hideControls);
      }
      
      public function disableHardcoreCheatSettings() : void
      {
         if(get_hardcore())
         {
            set_debug(false);
            if(get_easyMode())
            {
               get_modes().difficulty = 0;
            }
            get_modes().hyper = false;
            get_npc().lowStandards = false;
         }
      }
      
      public function difficultySelectionMenu() : void
      {
         var newDifficulty4:int;
         var _g4:GameSettings;
         var newDifficulty3:int;
         var _g3:GameSettings;
         var newDifficulty2:int;
         var _g2:GameSettings;
         var newDifficulty1:int;
         var _g1:GameSettings;
         var newDifficulty:int;
         var _g:GameSettings;
         hideSettingPane();
         clearOutput();
         outputText("你可以选择一个难度来设定战斗的艰难程度。\n");
         outputText("\n<b>简单：</b>敌方伤害-50%，可以忽略坏结局。硬核模式下不可用。");
         outputText("\n<b>普通：</b>敌方属性无变化。");
         outputText("\n<b>困难：</b>敌方+25%生命值，+15%伤害。");
         outputText("\n<b>梦魇：</b>敌方+50%生命值，+30%伤害。");
         outputText("\n<b>极限：</b>敌方+100%生命值，+50%伤害。");
         menu();
         _g = this;
         newDifficulty = -2;
         addButton(0,"简单",function():void
         {
            _g.chooseDifficulty(newDifficulty);
         }).disableIf(get_hardcore(),"硬核模式下不可用。");
         _g1 = this;
         newDifficulty1 = 0;
         addButton(1,"普通",function():void
         {
            _g1.chooseDifficulty(newDifficulty1);
         });
         _g2 = this;
         newDifficulty2 = 1;
         addButton(2,"困难",function():void
         {
            _g2.chooseDifficulty(newDifficulty2);
         });
         _g3 = this;
         newDifficulty3 = 2;
         addButton(3,"梦魇",function():void
         {
            _g3.chooseDifficulty(newDifficulty3);
         });
         _g4 = this;
         newDifficulty4 = 3;
         addButton(4,"极限",function():void
         {
            _g4.chooseDifficulty(newDifficulty4);
         });
         setExitButton("返回",returnToSettings);
      }
      
      public function debugMenu(param1:Boolean = true) : void
      {
         var _loc2_:SettingsGlobalFetishes = Utils.copy(settingsGlobal.fetishes);
         _loc2_.nephila = false;
         get_game().debugMenu.debugCompEdit(settingsGlobal.fetishes,_loc2_);
      }
      
      public function cycleQuality() : void
      {
         if(get_mainView().stage.quality == "low")
         {
            get_mainView().stage.quality = "medium";
         }
         else if(get_mainView().stage.quality == "medium")
         {
            get_mainView().stage.quality = "high";
         }
         else if(get_mainView().stage.quality == "high")
         {
            get_mainView().stage.quality = "low";
         }
      }
      
      public function cycleBackground() : void
      {
         get_display().textBackground = Utils.loopInt(-1,get_display().textBackground,3);
         get_mainView().setTextBackground(get_display().textBackground);
      }
      
      public function currySettings(param1:*, param2:String, param3:*) : Function
      {
         var obj:* = param1;
         var property:String = param2;
         var value:* = param3;
         var _gthis:GameSettings = this;
         return function():void
         {
            obj[property] = value;
            _gthis.setOrUpdateSettings(_gthis.lastDisplayedPane);
         };
      }
      
      public function convertOldSettings(param1:Array) : void
      {
         var _loc2_:int = 273;
         var _loc3_:int = 1042;
         var _loc4_:int = 1298;
         var _loc5_:int = 1299;
         var _loc6_:int = 2777;
         var _loc7_:int = 2792;
         var _loc8_:int = 2793;
         var _loc9_:int = 2976;
         var _loc10_:int = 2980;
         var _loc11_:int = 2982;
         var _loc12_:int = 2983;
         var _loc13_:int = 2984;
         var _loc14_:int = 2986;
         var _loc15_:int = 2987;
         var _loc16_:int = 2988;
         var _loc17_:int = 2994;
         settingsGlobal.gameplay.autoLevel = param1[_loc13_] != 0;
         settingsGlobal.gameplay.quicksaveConfirm = param1[_loc5_] == 0;
         settingsGlobal.gameplay.quickloadConfirm = param1[_loc4_] == 0;
         settingsGlobal.display.fontSize = param1[_loc3_] > 0 ? int(param1[_loc3_]) : 20;
         settingsGlobal.display.oldFont = param1[_loc16_] != 0;
         settingsGlobal.display.sprites = param1[_loc2_];
         settingsGlobal.display.images = param1[_loc11_] != 0;
         settingsGlobal.display.animateStatBars = param1[_loc9_] != 0;
         settingsGlobal.display.time12Hour = param1[_loc17_] != 0;
         settingsGlobal.display.metric = param1[_loc15_] != 0;
         settingsGlobal.display.textBackground = param1[_loc12_];
         settingsGlobal.fetishes.furry = param1[_loc6_] == 0;
         settingsGlobal.fetishes.watersports = param1[_loc14_] != 0;
         settingsGlobal.fetishes.gore = param1[_loc8_] != 0;
         settingsGlobal.fetishes.underage = param1[_loc7_] + 1;
         settingsGlobal.misc.hermUnlocked = param1[_loc10_] != 0;
      }
      
      public function confirmOverride() : void
      {
         overridePanes.push(paneIndex(lastDisplayedPane));
         returnToSettings();
      }
      
      public function configurePanes() : void
      {
         var _loc7_:int = 0;
         var _loc8_:* = null as SettingPane;
         var _loc9_:* = null as TextField;
         var _loc10_:int = 0;
         var _loc11_:* = null as IMap;
         var _loc12_:* = null as String;
         var _loc13_:* = null as StringMap;
         var _loc14_:int = 0;
         var _loc1_:int = int(Math.floor(get_game().mainView.mainText.x));
         var _loc2_:int = int(Math.floor(get_game().mainView.mainText.x));
         var _loc3_:int = int(Math.floor(get_game().mainView.mainText.width)) + 16;
         var _loc4_:int = int(Math.floor(get_game().mainView.mainText.height));
         var _loc5_:int = 0;
         var _loc6_:int = int(GameSettings.PANES_CONFIG.length);
         while(_loc5_ < _loc6_)
         {
            _loc7_ = _loc5_++;
            _loc8_ = new SettingPane(_loc1_,_loc2_,_loc3_,_loc4_);
            _loc8_.name = paneName(_loc7_);
            _loc9_ = _loc8_.addHelpLabel();
            _loc9_.htmlText = get_game().formatHeader(paneHeader(_loc7_)) + paneDesc(_loc7_) + "\n\n";
            if(_loc7_ != 5)
            {
               if(paneGlobal(_loc7_))
               {
                  _loc9_.htmlText += "这些设置是<b>全局</b>设置，将在所有存档中保持一致。\n\n";
               }
               else
               {
                  _loc9_.htmlText += "这些设置为<b>本地</b>生效，仅对当前存档有效。\n\n";
               }
            }
            _loc10_ = int(panes.push(_loc8_));
            _loc11_ = nameToIndex;
            _loc12_ = _loc8_.name;
            _loc13_ = _loc11_;
            _loc14_ = _loc10_ - 1;
            if(_loc12_ in StringMap.reserved)
            {
               _loc13_.setReserved(_loc12_,_loc14_);
            }
            else
            {
               _loc13_.h[_loc12_] = _loc14_;
            }
            setOrUpdateSettings(_loc8_);
         }
         initializedPanes = true;
      }
      
      public function clearControlsYes() : void
      {
         get_game().inputManager.ClearAllBinds();
         clearOutput();
         outputText("按键绑定已清除！");
         doNext(displayControls);
      }
      
      public function clearControls() : void
      {
         get_game().inputManager.HideBindingPane();
         clearOutput();
         outputText("你确定要清除所有当前绑定的按键吗？");
         doYesNo(clearControlsYes,displayControls);
      }
      
      public function chooseTextBackground(param1:int) : void
      {
         get_display().textBackground = param1;
         get_mainView().setTextBackground(get_display().textBackground);
         menuTextBackground();
         Theme.set_current(Theme.current);
      }
      
      public function chooseModeHardcoreSlot() : void
      {
         var slot13:int;
         var _g13:Function;
         var slot12:int;
         var _g12:Function;
         var slot11:int;
         var _g11:Function;
         var slot10:int;
         var _g10:Function;
         var slot9:int;
         var _g9:Function;
         var slot8:int;
         var _g8:Function;
         var slot7:int;
         var _g7:Function;
         var slot6:int;
         var _g6:Function;
         var slot5:int;
         var _g5:Function;
         var slot4:int;
         var _g4:Function;
         var slot3:int;
         var _g3:Function;
         var slot2:int;
         var _g2:Function;
         var slot1:int;
         var _g1:Function;
         var slot:int;
         var _g:Function;
         var _gthis:GameSettings = this;
         hideSettingPane();
         clearOutput();
         outputText("你选择了硬核模式。在此模式下，游戏会强制自动保存，如果你遭遇坏结局，你的存档将被<b>删除</b>！");
         outputText("[pg]调试模式、简单模式、低标准和夸张尺寸在此游戏模式下被禁用。");
         outputText("[pg]请选择一个存档槽进行保存。你不能创建多个存档副本。");
         menu();
         var _loc1_:Function = function(param1:int):void
         {
            _gthis.get_modes().hardcoreSlot = "CoC_" + param1;
            _gthis.get_modes().hardcore = true;
            _gthis.disableHardcoreCheatSettings();
            _gthis.setOrUpdateSettings(_gthis.lastDisplayedPane);
            _gthis.returnToSettings();
         };
         _g = _loc1_;
         slot = 1;
         addButton(0,"存档槽" + 1,function():void
         {
            _g(slot);
         });
         _g1 = _loc1_;
         slot1 = 2;
         addButton(1,"存档槽" + 2,function():void
         {
            _g1(slot1);
         });
         _g2 = _loc1_;
         slot2 = 3;
         addButton(2,"存档槽" + 3,function():void
         {
            _g2(slot2);
         });
         _g3 = _loc1_;
         slot3 = 4;
         addButton(3,"存档槽" + 4,function():void
         {
            _g3(slot3);
         });
         _g4 = _loc1_;
         slot4 = 5;
         addButton(4,"存档槽" + 5,function():void
         {
            _g4(slot4);
         });
         _g5 = _loc1_;
         slot5 = 6;
         addButton(5,"存档槽" + 6,function():void
         {
            _g5(slot5);
         });
         _g6 = _loc1_;
         slot6 = 7;
         addButton(6,"存档槽" + 7,function():void
         {
            _g6(slot6);
         });
         _g7 = _loc1_;
         slot7 = 8;
         addButton(7,"存档槽" + 8,function():void
         {
            _g7(slot7);
         });
         _g8 = _loc1_;
         slot8 = 9;
         addButton(8,"存档槽" + 9,function():void
         {
            _g8(slot8);
         });
         _g9 = _loc1_;
         slot9 = 10;
         addButton(9,"存档槽" + 10,function():void
         {
            _g9(slot9);
         });
         _g10 = _loc1_;
         slot10 = 11;
         addButton(10,"存档槽" + 11,function():void
         {
            _g10(slot10);
         });
         _g11 = _loc1_;
         slot11 = 12;
         addButton(11,"存档槽" + 12,function():void
         {
            _g11(slot11);
         });
         _g12 = _loc1_;
         slot12 = 13;
         addButton(12,"存档槽" + 13,function():void
         {
            _g12(slot12);
         });
         _g13 = _loc1_;
         slot13 = 14;
         addButton(13,"存档槽" + 14,function():void
         {
            _g13(slot13);
         });
         setExitButton("返回",returnToSettings);
      }
      
      public function chooseDifficulty(param1:int = 0) : void
      {
         get_modes().difficulty = param1;
         setOrUpdateSettings(lastDisplayedPane);
         returnToSettings();
      }
      
      public function autoTheme() : void
      {
         var _loc1_:* = null as Theme;
         if(readyForTheme)
         {
            _loc1_ = Theme.getTheme(waitTheme);
            if(_loc1_ != null)
            {
               Theme.set_current(_loc1_);
               get_mainViewManager().applyTheme();
            }
         }
      }
      
      public function applyTheme() : void
      {
         get_mainViewManager().applyTheme();
         themeMenu();
      }
      
      public function adjustFontSize(param1:int) : void
      {
         var _loc2_:TextFormat = get_mainView().mainText.getTextFormat();
         if(_loc2_.size == null || param1 == 0)
         {
            _loc2_.size = 20;
         }
         _loc2_.size = Utils.boundInt(14,int(_loc2_.size + param1),32);
         get_mainView().mainText.setTextFormat(_loc2_);
         get_display().fontSize = _loc2_.size;
         setOrUpdateSettings(lastDisplayedPane);
         fontSettingsMenu();
      }
   }
}

