package classes
{
   import classes._FlagDict.FlagDict_Impl_;
   import classes.globalFlags.KFLAGS;
   import classes.globalFlags.KGAMECLASS;
   import coc.view.CoCButton;
   import coc.view.MainView;
   import flash.Boot;
   import haxe.IMap;
   
   public class ControlBindings
   {
      
      public var bindings:Bindings;
      
      public function ControlBindings(param1:InputManager = undefined)
      {
         if(Boot.skip_constructor)
         {
            return;
         }
         bindings = KGAMECLASS.kGAMECLASS.bindings;
         run(param1);
      }
      
      public static function get_mainView() : MainView
      {
         return KGAMECLASS.kGAMECLASS.mainView;
      }
      
      public static function get_player() : Player
      {
         return KGAMECLASS.kGAMECLASS.player;
      }
      
      public static function get_saves() : Saves
      {
         return KGAMECLASS.kGAMECLASS.saves;
      }
      
      public static function get_gameSettings() : GameSettings
      {
         return KGAMECLASS.kGAMECLASS.gameSettings;
      }
      
      public static function get_flags() : IMap
      {
         return KFLAGS.flags;
      }
      
      public static function executeClick(param1:int, param2:Array = undefined) : Boolean
      {
         var _loc3_:Boolean = true;
         if(param2 != null)
         {
            _loc3_ = ControlBindings.get_mainView().buttonTextIsOneOf(param1,param2);
         }
         if(ControlBindings.get_mainView().buttonIsVisible(param1) && _loc3_)
         {
            ControlBindings.get_mainView().toolTipView.hide();
            ControlBindings.get_mainView().clickButton(param1);
            return true;
         }
         return false;
      }
      
      public static function menuButton(param1:String, param2:Function, param3:Boolean = false) : void
      {
         if(ControlBindings.get_mainView().menuButtonIsVisible(param1) && (ControlBindings.get_player().loaded || !param3))
         {
            param2();
         }
      }
      
      public function run(param1:InputManager) : void
      {
         var _gthis:ControlBindings;
         var _loc3_:int = 0;
         _gthis = this;
         param1.AddBindableControl("显示属性","在可用时显示属性面板",function():void
         {
            ControlBindings.menuButton("stats",KGAMECLASS.kGAMECLASS.playerInfo.displayStats,true);
         },ControlBindings.get_mainView().statsButton);
         param1.AddBindableControl("升级","在可用时显示升级页面",function():void
         {
            ControlBindings.menuButton("level",KGAMECLASS.kGAMECLASS.playerInfo.levelUpGo,true);
         },ControlBindings.get_mainView().levelButton);
         param1.AddBindableControl("快速保存1","将当前游戏快速保存至槽位1",function():void
         {
            _gthis.bindings.execQuickSave(1);
         });
         param1.AddBindableControl("快速保存2","将当前游戏快速保存至槽位2",function():void
         {
            _gthis.bindings.execQuickSave(2);
         });
         param1.AddBindableControl("快速保存3","将当前游戏快速保存至槽位3",function():void
         {
            _gthis.bindings.execQuickSave(3);
         });
         param1.AddBindableControl("快速保存4","将当前游戏快速保存至槽位4",function():void
         {
            _gthis.bindings.execQuickSave(4);
         });
         param1.AddBindableControl("快速保存5","将当前游戏快速保存至槽位5",function():void
         {
            _gthis.bindings.execQuickSave(5);
         });
         param1.AddBindableControl("快速读取1","从槽位1快速读取当前游戏",function():void
         {
            _gthis.bindings.execQuickLoad(1);
         });
         param1.AddBindableControl("快速读取2","从槽位2快速读取当前游戏",function():void
         {
            _gthis.bindings.execQuickLoad(2);
         });
         param1.AddBindableControl("快速读取3","从槽位3快速读取当前游戏",function():void
         {
            _gthis.bindings.execQuickLoad(3);
         });
         param1.AddBindableControl("快速读取4","从槽位4快速读取当前游戏",function():void
         {
            _gthis.bindings.execQuickLoad(4);
         });
         param1.AddBindableControl("快速读取5","从槽位5快速读取当前游戏",function():void
         {
            _gthis.bindings.execQuickLoad(5);
         });
         param1.AddBindableControl("显示菜单","显示主菜单",function():void
         {
            if(ControlBindings.get_mainView().menuButtonIsVisible("newGame") && ControlBindings.get_mainView().menuButtonHasLabel("newGame","主菜单"))
            {
               KGAMECLASS.kGAMECLASS.mainMenu.mainMenu();
            }
         });
         param1.AddBindableControl("数据菜单","显示存档/读档菜单",function():void
         {
            ControlBindings.menuButton("data",ControlBindings.get_saves().saveLoad);
         },ControlBindings.get_mainView().dataButton);
         param1.AddBindableControl("选项","显示设置菜单",function():void
         {
            if(ControlBindings.get_mainView().menuButtonIsVisible("newGame") && ControlBindings.get_mainView().menuButtonHasLabel("newGame","主菜单"))
            {
               KGAMECLASS.kGAMECLASS.gameSettings.quickSettings();
            }
         });
         param1.AddBindableControl("外貌页面","显示外貌页面",function():void
         {
            ControlBindings.menuButton("appearance",KGAMECLASS.kGAMECLASS.playerAppearance.appearance);
         },ControlBindings.get_mainView().appearanceButton);
         param1.AddBindableControl("否","对任何可用的提示回答否",function():void
         {
            ControlBindings.executeClick(1,["No"]);
         });
         param1.AddBindableControl("是","对任何可用的提示回答“是”",function():void
         {
            ControlBindings.executeClick(0,["Yes"]);
         });
         param1.AddBindableControl("显示特质","显示特质页面",function():void
         {
            ControlBindings.menuButton("perks",KGAMECLASS.kGAMECLASS.playerInfo.displayPerks);
         });
         param1.AddBindableControl("继续","半智能地点击文本，尝试在不发生性行为的情况下离开胜利菜单",function():void
         {
            var _loc4_:* = null;
            var _loc1_:Array = [{
               "index":0,
               "labels":["继续","返回","后退","离开","算了","恢复","退出","好的","确定","折返"]
            },{
               "index":14,
               "labels":["继续","返回","后退","离开","算了","放弃","恢复","退出","好的","确定","继续"]
            },{
               "index":1,
               "labels":["继续","返回","后退","离开","算了","放弃","恢复","退出","好的","确定","后退"]
            }];
            var _loc2_:Array = KGAMECLASS.kGAMECLASS.output.getAvailableButtons();
            if(int(_loc2_.length) == 1)
            {
               ControlBindings.executeClick(int(_loc2_[0]));
               return;
            }
            var _loc3_:int = 0;
            while(_loc3_ < int(_loc1_.length))
            {
               _loc4_ = _loc1_[_loc3_];
               _loc3_++;
               if(ControlBindings.executeClick(int(_loc4_.index),_loc4_.labels))
               {
                  return;
               }
            }
         });
         param1.AddBindableControl("切换背景","切换文本显示区域的背景填充",function():void
         {
            ControlBindings.get_gameSettings().cycleBackground();
         });
         var _loc2_:int = 0;
         while(_loc2_ < 15)
         {
            _loc3_ = _loc2_++;
            param1.AddBindableControl("按钮" + (_loc3_ + 1),"激活按钮" + (_loc3_ + 1),(function(param1:Array):Function
            {
               var index:Array = param1;
               return function():Boolean
               {
                  return ControlBindings.executeClick(int(index[0]));
               };
            })([_loc3_]),ControlBindings.get_mainView().bottomButtons[_loc3_]);
         }
         param1.addCheatControl("作弊！获得鹰嘴豆泥","获得免费鹰嘴豆泥的作弊码",function(param1:int):void
         {
            var _loc4_:* = null as IMap;
            var _loc2_:Array = [38,40,37,39];
            var _loc3_:int = FlagDict_Impl_.arrayReadInt(ControlBindings.get_flags(),27);
            if(_loc3_ < int(_loc2_.length) && int(_loc2_[_loc3_]) == param1)
            {
               _loc4_ = ControlBindings.get_flags();
               FlagDict_Impl_.arrayWriteInt(_loc4_,27,FlagDict_Impl_.arrayReadInt(_loc4_,27) + 1);
               if(_loc3_ == 3)
               {
                  FlagDict_Impl_.arrayWriteInt(ControlBindings.get_flags(),27,0);
                  if(ControlBindings.get_player().loaded && ControlBindings.get_mainView().getButtonText(0).indexOf("游戏结束") == -1)
                  {
                     KGAMECLASS.kGAMECLASS.inventory.giveHumanizer();
                  }
               }
               return;
            }
            FlagDict_Impl_.arrayWriteInt(ControlBindings.get_flags(),27,0);
         });
         param1.addCheatControl("作弊！访问调试菜单","访问调试菜单并生成任何物品或更改属性的作弊码。",function(param1:int):void
         {
            var _loc4_:* = null as IMap;
            var _loc2_:Array = [68,69,66,85,71];
            var _loc3_:int = FlagDict_Impl_.arrayReadInt(KFLAGS.flags,2064);
            if(_loc3_ < int(_loc2_.length) && int(_loc2_[_loc3_]) == param1)
            {
               _loc4_ = KFLAGS.flags;
               FlagDict_Impl_.arrayWriteInt(_loc4_,2064,FlagDict_Impl_.arrayReadInt(_loc4_,2064) + 1);
               if(_loc3_ == 4)
               {
                  FlagDict_Impl_.arrayWriteInt(KFLAGS.flags,2064,0);
                  if(KGAMECLASS.kGAMECLASS.player != null && KGAMECLASS.kGAMECLASS.player.loaded && KGAMECLASS.kGAMECLASS.mainView.getButtonText(0).indexOf("游戏结束") == -1 && (KGAMECLASS.kGAMECLASS.debug && !KGAMECLASS.kGAMECLASS.get_hardcore() || CoC_Settings.debugBuild))
                  {
                     KGAMECLASS.kGAMECLASS.debugMenu.accessDebugMenu();
                  }
               }
               return;
            }
            FlagDict_Impl_.arrayWriteInt(KFLAGS.flags,2064,0);
         });
         param1.BindKeyToControl(83,"显示属性");
         param1.BindKeyToControl(76,"升级");
         param1.BindKeyToControl(112,"快速存档1");
         param1.BindKeyToControl(113,"快速存档2");
         param1.BindKeyToControl(114,"快速保存3");
         param1.BindKeyToControl(115,"快速保存4");
         param1.BindKeyToControl(116,"快速保存5");
         param1.BindKeyToControl(117,"快速读取1");
         param1.BindKeyToControl(118,"快速读取2");
         param1.BindKeyToControl(119,"快速读取3");
         param1.BindKeyToControl(120,"快速读取4");
         param1.BindKeyToControl(121,"快速读取5");
         param1.BindKeyToControl(8,"显示菜单");
         param1.BindKeyToControl(79,"选项");
         param1.BindKeyToControl(68,"数据菜单");
         param1.BindKeyToControl(65,"外貌页面");
         param1.BindKeyToControl(78,"否");
         param1.BindKeyToControl(89,"是");
         param1.BindKeyToControl(80,"显示特质");
         param1.BindKeyToControl(13,"继续");
         param1.BindKeyToControl(32,"继续",false);
         param1.BindKeyToControl(36,"切换背景");
         param1.BindKeyToControl(49,"按钮1");
         param1.BindKeyToControl(50,"按钮2");
         param1.BindKeyToControl(51,"按钮3");
         param1.BindKeyToControl(52,"按钮4");
         param1.BindKeyToControl(53,"按钮5");
         param1.BindKeyToControl(54,"按钮6");
         param1.BindKeyToControl(55,"按钮7");
         param1.BindKeyToControl(56,"按钮8");
         param1.BindKeyToControl(57,"按钮9");
         param1.BindKeyToControl(48,"按钮10");
         param1.BindKeyToControl(81,"按钮6",false);
         param1.BindKeyToControl(87,"按钮7",false);
         param1.BindKeyToControl(69,"按钮8",false);
         param1.BindKeyToControl(82,"按钮9",false);
         param1.BindKeyToControl(84,"按钮10",false);
         param1.BindKeyToControl(65,"按钮11",false);
         param1.BindKeyToControl(83,"按钮12",false);
         param1.BindKeyToControl(68,"按钮13",false);
         param1.BindKeyToControl(70,"按钮14",false);
         param1.BindKeyToControl(71,"按钮15",false);
         param1.RegisterDefaults();
      }
   }
}

