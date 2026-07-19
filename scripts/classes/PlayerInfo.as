package classes
{
   import classes._FlagDict.FlagDict_Impl_;
   import classes.globalFlags.KFLAGS;
   import classes.internals.Utils;
   import classes.items.Armor;
   import classes.items.Jewelry;
   import classes.items.JewelryLib;
   import classes.items.Undergarment;
   import classes.items.Weapon;
   import classes.scenes.Camp;
   import classes.scenes.Inventory;
   import classes.scenes.combat.Combat;
   import coc.view.CoCButton;
   import coc.view.MainView;
   import coc.view.Theme;
   import flash.Boot;
   import flash.events.TextEvent;
   import haxe.IMap;
   import haxe.ds.StringMap;
   
   public class PlayerInfo extends BaseContent
   {
      
      public var tempStatPoints:int;
      
      public var tempStat:IMap;
      
      public function PlayerInfo()
      {
         if(Boot.skip_constructor)
         {
            return;
         }
         super();
      }
      
      public function tfResistOption() : void
      {
         var choice1:int;
         var _g1:PlayerInfo;
         var choice:int;
         var _g:PlayerInfo;
         clearOutput();
         var _loc1_:Boolean = get_player().perkv2(PerkLib.TransformationResistance) == 0;
         outputText("当启用变形抵抗时，变形道具改变你的几率会降低，并且你不会因为过度使用变形道具而触发坏结局。");
         outputText("[pg]变形抵抗目前已[b:" + (_loc1_ ? "启用" : "禁用") + "]。");
         menu();
         _g = this;
         choice = 0;
         addButton(0,"启用",function():void
         {
            _g.setResistance(choice);
         }).disableIf(_loc1_,"该特质已启用。");
         _g1 = this;
         choice1 = 1;
         addButton(1,"禁用",function():void
         {
            _g1.setResistance(choice1);
         }).disableIf(!_loc1_,"该特质已禁用。");
         addButton(14,"返回",displayPerks);
      }
      
      public function subtractAttribute(param1:String) : void
      {
         var _loc2_:* = null as StringMap;
         var _loc3_:* = null as StringMap;
         var _loc4_:* = null as String;
         var _loc5_:int = 0;
         if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,2140) == 1)
         {
            _loc2_ = tempStat;
            tempStatPoints += param1 in StringMap.reserved ? _loc2_.getReserved(param1) : _loc2_.h[param1];
            _loc3_ = tempStat;
            if(param1 in StringMap.reserved)
            {
               _loc3_.setReserved(param1,0);
            }
            else
            {
               _loc3_.h[param1] = 0;
            }
         }
         else
         {
            _loc4_ = param1;
            _loc2_ = tempStat;
            _loc5_ = (_loc4_ in StringMap.reserved ? _loc2_.getReserved(_loc4_) : _loc2_.h[_loc4_]) - 1;
            _loc3_ = tempStat;
            if(_loc4_ in StringMap.reserved)
            {
               _loc3_.setReserved(_loc4_,_loc5_);
            }
            else
            {
               _loc3_.h[_loc4_] = _loc5_;
            }
            ++tempStatPoints;
         }
         attributeMenu();
      }
      
      public function setTolerance(param1:int) : void
      {
         get_player().setPerkValue(PerkLib.AscensionTolerance,2,param1);
         ascToleranceOption();
      }
      
      public function setResistance(param1:int) : void
      {
         get_player().setPerkValue(PerkLib.TransformationResistance,2,param1);
         tfResistOption();
      }
      
      public function setMight(param1:int) : void
      {
         get_player().setPerkValue(PerkLib.Battlemage,1,param1);
         mightOption();
      }
      
      public function setCharge(param1:int) : void
      {
         get_player().setPerkValue(PerkLib.Spellsword,1,param1);
         chargeOption();
      }
      
      public function raiseLevel() : void
      {
         var _temp_1:* = get_player();
         _temp_1.XP = _temp_1.XP - get_player().requiredXP();
         var _temp_2:* = get_player();
         _temp_2.level = _temp_2.level + 1;
         var _temp_3:* = get_player();
         _temp_3.perkPoints = _temp_3.perkPoints + 1;
         switch(get_player().age)
         {
            case 1:
               var _temp_4:* = get_player();
               _temp_4.statPoints = _temp_4.statPoints + 6;
               break;
            case 3:
               var _temp_5:* = get_player();
               _temp_5.statPoints = _temp_5.statPoints + 2;
               break;
            default:
               var _temp_6:* = get_player();
               _temp_6.statPoints = _temp_6.statPoints + 5;
         }
         if(get_player().level % 2 == 0)
         {
            var _temp_7:* = get_player();
            _temp_7.ascensionPerkPoints = _temp_7.ascensionPerkPoints + 1;
         }
      }
      
      public function perkSkip() : void
      {
         clearListener();
         get_returnMenu()();
      }
      
      public function perkSelect(param1:PerkType) : void
      {
         clearListener();
         applyPerk(param1);
      }
      
      public function perkListDisplay(param1:PerkType = undefined) : void
      {
         var _loc7_:* = null as PerkType;
         var _loc8_:* = null as String;
         var _loc9_:* = null as String;
         var _loc10_:* = null as Array;
         var _loc11_:int = 0;
         var _loc12_:* = null as PerkType;
         var _loc13_:* = null as String;
         var _loc14_:* = null as String;
         var _loc2_:PlayerInfo = this;
         var _loc3_:Array = PerkTree.availablePerks(get_player());
         var _loc4_:Array = [];
         var _loc5_:int = 0;
         var _loc6_:Array = PerkTree.obtainablePerks();
         while(_loc5_ < int(_loc6_.length))
         {
            _loc7_ = _loc6_[_loc5_];
            _loc5_++;
            if(!_loc2_.get_player().hasPerk(_loc7_) && !Boolean(_loc3_.contains(_loc7_)))
            {
               _loc4_.push(_loc7_);
            }
         }
         _loc6_ = _loc4_;
         get_mainView().stage.addEventListener(TextEvent.LINK,perkLinkHandler);
         outputText("[pg]你有" + Utils.numberOfThings(int(Math.floor(get_player().perkPoints)),"特质点") + "。[pg]");
         _loc5_ = 0;
         while(_loc5_ < int(_loc3_.length))
         {
            _loc7_ = _loc3_[_loc5_];
            _loc5_++;
            _loc8_ = Utils.cnName(_loc7_.get_name());
            outputText("[pg-][bu:<a href=\"event:" + _loc7_.get_id() + "\">" + _loc8_ + "</a>]");
            if(param1 == _loc7_)
            {
               _loc9_ = Utils.cnName(_loc7_.get_longDesc());
               outputText("[pg-]" + _loc9_);
               _loc10_ = get_game().perkTree.listUnlocks(_loc7_);
               if(int(_loc10_.length) > 0)
               {
                  outputText("[pg-][b:解锁:] <ul>");
                  _loc11_ = 0;
                  while(_loc11_ < int(_loc10_.length))
                  {
                     _loc12_ = _loc10_[_loc11_];
                     _loc11_++;
                     _loc13_ = Utils.cnName(_loc12_.get_name());
                     _loc14_ = Utils.cnName(_loc12_.get_longDesc());
                     outputText("<li>" + _loc13_ + " (" + _loc14_ + ")</li>");
                  }
                  outputText("</ul>[pg-]");
               }
               else
               {
                  outputText("[pg]");
               }
            }
         }
         outputText("[pg]");
         _loc5_ = 0;
         while(_loc5_ < int(_loc6_.length))
         {
            _loc7_ = _loc6_[_loc5_];
            _loc5_++;
            _loc8_ = Utils.cnName(_loc7_.get_name());
            outputText("[pg-][u:<a href=\"event:" + _loc7_.get_id() + "\">" + _loc8_ + "</a>] ");
            outputText(" [i:需要: " + getRequirements(_loc7_) + "]");
            if(param1 == _loc7_)
            {
               _loc9_ = Utils.cnName(_loc7_.get_longDesc());
               outputText("[pg-]" + _loc9_ + "[pg]");
            }
         }
         menu();
         addButton(1,"跳过",perkSkip);
      }
      
      public function perkLinkHandler(param1:TextEvent) : void
      {
         var sel:PerkType;
         var _g:PlayerInfo;
         clearListener();
         var _loc2_:int = get_mainView().mainText.scrollV;
         var _loc3_:PerkType = PerkType.lookupPerk(param1.text);
         clearOutput();
         outputText("你选择了以下特质：");
         var _loc4_:String = Utils.cnName(_loc3_.get_name());
         outputText("[pg-][b:" + _loc4_ + "]");
         perkListDisplay(_loc3_);
         _g = this;
         sel = _loc3_;
         addButton(0,"确定",function():void
         {
            _g.perkSelect(sel);
         }).disableIf(!_loc3_.available(get_player()));
         get_mainView().mainText.scrollV = _loc2_;
      }
      
      public function perkDatabase(param1:int = 0, param2:int = 20) : void
      {
         var page2:int;
         var _g1:PlayerInfo;
         var page1:int;
         var _g:PlayerInfo;
         var _loc11_:* = null as PerkType;
         var _loc12_:* = null as Perk;
         var _loc13_:Boolean = false;
         var _loc14_:* = null as String;
         var _loc15_:* = null as String;
         var _loc16_:* = null as Array;
         var _loc17_:int = 0;
         var _loc18_:* = null as Array;
         var _loc19_:* = null as Requirement;
         var _loc3_:PlayerInfo = this;
         var _loc4_:String = "#" + StringTools.hex(Theme.current.get_textColor(),6);
         var _loc5_:String = "#228822";
         var _loc6_:String = "#aa8822";
         var _loc7_:String = "#aa2222";
         var _loc8_:Array = PerkTree.obtainablePerks();
         var _loc9_:Array = _loc8_.slice(param1 * param2,(param1 + 1) * param2);
         clearOutput();
         displayHeader("全部特质（" + (1 + param1 * param2) + "-" + (param1 * param2 + int(_loc9_.length)) + "/" + int(_loc8_.length) + "）");
         var _loc10_:int = 0;
         while(_loc10_ < int(_loc9_.length))
         {
            _loc11_ = _loc9_[_loc10_];
            _loc10_++;
            _loc12_ = get_player().perk(get_player().findPerk(_loc11_));
            _loc13_ = _loc12_ != null;
            _loc14_ = _loc4_;
            if(!_loc13_)
            {
               _loc14_ = _loc11_.available(get_player()) ? _loc5_ : _loc6_;
            }
            _loc15_ = Utils.cnName(_loc11_.get_name());
            outputText("<font color=\"" + _loc14_ + "\">[b:" + _loc15_ + "]</font>：");
            outputText(_loc13_ ? Utils.cnName(_loc11_.desc(_loc12_)) : Utils.cnName(_loc11_.get_longDesc()));
            if(_loc13_)
            {
               outputText("[pg-]");
            }
            else
            {
               _loc16_ = [];
               _loc17_ = 0;
               _loc18_ = _loc11_.requirements;
               while(_loc17_ < int(_loc18_.length))
               {
                  _loc19_ = _loc18_[_loc17_];
                  _loc17_++;
                  _loc16_.push("<font color=\'" + (Boolean(_loc19_.fn(_loc3_.get_player())) ? _loc4_ : _loc7_) + "\'>" + _loc19_.text + "</font>");
               }
               _loc18_ = _loc16_;
               outputText("<li>[b:解锁条件：]" + _loc18_.join("，") + "。</li>");
            }
         }
         menu();
         addButton(0,"特质",displayPerks);
         addButtonDisabled(1,"百科");
         _g = this;
         page1 = param1 + 1;
         addButton(4,"下一页",function():void
         {
            _g.perkDatabase(page1);
         }).disableIf((param1 + 1) * param2 >= int(_loc8_.length));
         _g1 = this;
         page2 = param1 - 1;
         addButton(9,"上一页",function():void
         {
            _g1.perkDatabase(page2);
         }).disableIf(param1 <= 0);
         addButton(14,"返回",get_returnMenu());
      }
      
      public function perkBuyMenu() : void
      {
         clearOutput();
         var _loc1_:Array = PerkTree.availablePerks(get_player());
         if(int(_loc1_.length) == 0)
         {
            get_images().showImage("event-cross");
            outputText("[b:你目前不满足任何特质的条件。] 以防你将来满足条件，你将保留你的" + Utils.numberOfThings(int(Math.floor(get_player().perkPoints)),"perk point") + "。");
            doNext(get_returnMenu());
            return;
         }
         get_images().showImage("event-arrow-up");
         outputText("请从列表中选择一个特质，然后点击“确定”。你可以点击“跳过”来保留你的特质点数以供稍后使用。");
         perkListDisplay();
      }
      
      public function mightOption() : void
      {
         var choice1:int;
         var _g1:PlayerInfo;
         var choice:int;
         var _g:PlayerInfo;
         clearOutput();
         var _loc1_:Boolean = get_player().perkv1(PerkLib.Battlemage) == 0;
         outputText("当战斗法师启用时，力量将在战斗开始时自动施放。");
         outputText("[pg]战斗法师当前已[b:" + (_loc1_ ? "启用" : "禁用") + "]。");
         menu();
         _g = this;
         choice = 0;
         addNextButton("启用",function():void
         {
            _g.setMight(choice);
         }).disableIf(_loc1_,"该特质已被启用。");
         _g1 = this;
         choice1 = 1;
         addNextButton("禁用",function():void
         {
            _g1.setMight(choice1);
         }).disableIf(!_loc1_,"该特质已被禁用。");
         addButton(14,"返回",displayPerks);
      }
      
      public function levelUpGo() : void
      {
         var _loc1_:int = 0;
         var _loc2_:int = 0;
         var _loc3_:int = 0;
         clearOutput();
         hideMenus();
         if(get_player().canLevelUp())
         {
            _loc1_ = int(Math.floor(get_player().perkPoints));
            _loc2_ = int(Math.floor(get_player().statPoints));
            _loc3_ = int(Math.floor(get_player().maxHP()));
            if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,2140) == 1)
            {
               while(get_player().canLevelUp())
               {
                  raiseLevel();
               }
            }
            else
            {
               raiseLevel();
            }
            _loc1_ = int(Math.floor(get_player().perkPoints - _loc1_));
            _loc2_ = int(Math.floor(get_player().statPoints - _loc2_));
            _loc3_ = int(Math.floor(get_player().maxHP() - _loc3_));
            outputText("[b:你现在是 " + get_player().level + " 级了！]");
            outputText("[pg]你的生命值增加了" + _loc3_ + "，并且你获得了 " + Utils.numberOfThings(_loc2_," 属性点") + " 和 " + Utils.numberOfThings(_loc1_," 特质点") + "！");
            if(get_player().statsMaxed())
            {
               outputText("[pg][b:" + (get_player().statPoints > _loc2_ ? "你总共有 " + get_player().statPoints + " 属性" + Utils.pluralize(int(Math.floor(get_player().statPoints)),"点") + "，但你" : "你") + "的属性目前无法进一步提升。]");
            }
            if(!get_player().canBuyPerks())
            {
               outputText("[pg][b:" + (get_player().perkPoints > _loc1_ ? "你总共有 " + get_player().perkPoints + " 特质" + Utils.pluralize(int(Math.floor(get_player().perkPoints)),"点") + "，但你" : "你") + "目前不符合获得任何新特质的条件。]");
            }
            if(get_player().canBuyStats())
            {
               doNext(initAttributeMenu);
            }
            else if(get_player().canBuyPerks())
            {
               doNext(perkBuyMenu);
            }
            else
            {
               doNext(get_returnMenu());
            }
         }
         else if(get_player().canBuyStats())
         {
            initAttributeMenu();
         }
         else if(get_player().canBuyPerks())
         {
            perkBuyMenu();
         }
         else
         {
            outputText("[b:错误。在玩家角色无法升级或获得特质时触发了升级。请将重现此漏洞的步骤报告至讨论区。]");
            doNext(get_returnMenu());
         }
      }
      
      public function initAttributeMenu() : void
      {
         tempStatPoints = int(Math.floor(get_player().statPoints));
         var _loc1_:IMap = new StringMap();
         if("str" in StringMap.reserved)
         {
            _loc1_.setReserved("str",0);
         }
         else
         {
            _loc1_.h["str"] = 0;
         }
         if("tou" in StringMap.reserved)
         {
            _loc1_.setReserved("tou",0);
         }
         else
         {
            _loc1_.h["tou"] = 0;
         }
         if("spe" in StringMap.reserved)
         {
            _loc1_.setReserved("spe",0);
         }
         else
         {
            _loc1_.h["spe"] = 0;
         }
         if("int" in StringMap.reserved)
         {
            _loc1_.setReserved("int",0);
         }
         else
         {
            _loc1_.h["int"] = 0;
         }
         tempStat = _loc1_;
         attributeMenu();
      }
      
      public function increase(param1:String) : int
      {
         --tempStatPoints;
         var _loc2_:String = param1;
         var _loc3_:StringMap = tempStat;
         var _loc4_:int = int((_loc2_ in StringMap.reserved ? _loc3_.getReserved(_loc2_) : _loc3_.h[_loc2_]) + 1);
         var _loc5_:StringMap = tempStat;
         if(_loc2_ in StringMap.reserved)
         {
            _loc5_.setReserved(_loc2_,_loc4_);
         }
         else
         {
            _loc5_.h[_loc2_] = _loc4_;
         }
         return _loc4_;
      }
      
      public function get_returnMenu() : Function
      {
         var newRound:Boolean;
         var _g:Combat;
         if(get_game().get_inCombat())
         {
            _g = get_game().combat;
            newRound = false;
            return function():void
            {
               _g.combatMenu(newRound);
            };
         }
         return playerMenu;
      }
      
      public function getRequirements(param1:PerkType) : String
      {
         var _loc8_:* = null as Requirement;
         var _loc9_:* = null as String;
         var _loc2_:Boolean = get_game().mainViewManager.isDarkTheme();
         var _loc3_:String = _loc2_ ? "#ffffff" : "#000000";
         var _loc4_:String = _loc2_ ? "#ff4444" : "#aa2222";
         var _loc5_:Array = [];
         var _loc6_:int = 0;
         var _loc7_:Array = param1.requirements;
         while(_loc6_ < int(_loc7_.length))
         {
            _loc8_ = _loc7_[_loc6_];
            _loc6_++;
            _loc9_ = Boolean(_loc8_.fn(get_player())) ? _loc3_ : _loc4_;
            _loc5_.push("<font color=\"" + _loc9_ + "\">" + _loc8_.text + "</font>");
         }
         return _loc5_.join(", ");
      }
      
      public function finishAttributes() : void
      {
         var _loc4_:* = null as String;
         clearOutput();
         var _loc1_:String = "str";
         var _loc2_:StringMap = tempStat;
         var _loc3_:int = int(_loc1_ in StringMap.reserved ? _loc2_.getReserved(_loc1_) : _loc2_.h[_loc1_]);
         if(_loc3_ > 0)
         {
            _loc4_ = _loc1_;
            if(_loc4_ == "int")
            {
               outputText("[pg-]你在这个世界与各种生物战斗的经历磨炼了你的心智" + (_loc3_ < 3 ? " slightly" : "") + "。");
            }
            else if(_loc4_ == "spe")
            {
               outputText("[pg-]战斗的经历驱使你移动得" + (_loc3_ < 3 ? "稍微" : "") + "更快了。");
            }
            else if(_loc4_ == "str")
            {
               outputText("[pg-]经过这段时间的冒险，你感觉你的肌肉变得" + (_loc3_ < 3 ? "稍微" : "明显") + "强壮了。");
            }
            else if(_loc4_ == "tou")
            {
               outputText("[pg-]经历了这么多战斗，你感觉自己变得" + (_loc3_ < 3 ? "稍微" : "") + "更坚韧了。");
            }
         }
         _loc1_ = "tou";
         _loc2_ = tempStat;
         _loc3_ = int(_loc1_ in StringMap.reserved ? _loc2_.getReserved(_loc1_) : _loc2_.h[_loc1_]);
         if(_loc3_ > 0)
         {
            _loc4_ = _loc1_;
            if(_loc4_ == "int")
            {
               outputText("[pg-]你在这个世界与各种生物战斗的经历磨炼了你的心智" + (_loc3_ < 3 ? " slightly" : "") + "。");
            }
            else if(_loc4_ == "spe")
            {
               outputText("[pg-]战斗的经历驱使你移动得" + (_loc3_ < 3 ? "稍微" : "") + "更快了。");
            }
            else if(_loc4_ == "str")
            {
               outputText("[pg-]经过这段时间的冒险，你感觉你的肌肉变得" + (_loc3_ < 3 ? "稍微" : "明显") + "强壮了。");
            }
            else if(_loc4_ == "tou")
            {
               outputText("[pg-]经历了这么多战斗，你感觉自己变得" + (_loc3_ < 3 ? "稍微" : "") + "更坚韧了。");
            }
         }
         _loc1_ = "spe";
         _loc2_ = tempStat;
         _loc3_ = int(_loc1_ in StringMap.reserved ? _loc2_.getReserved(_loc1_) : _loc2_.h[_loc1_]);
         if(_loc3_ > 0)
         {
            _loc4_ = _loc1_;
            if(_loc4_ == "int")
            {
               outputText("[pg-]你在这个世界与各种生物战斗的经历磨炼了你的心智" + (_loc3_ < 3 ? " slightly" : "") + "。");
            }
            else if(_loc4_ == "spe")
            {
               outputText("[pg-]战斗的经历驱使你移动得" + (_loc3_ < 3 ? "稍微" : "") + "更快了。");
            }
            else if(_loc4_ == "str")
            {
               outputText("[pg-]经过这段时间的冒险，你感觉你的肌肉变得" + (_loc3_ < 3 ? "稍微" : "明显") + "强壮了。");
            }
            else if(_loc4_ == "tou")
            {
               outputText("[pg-]经历了这么多战斗，你感觉自己变得" + (_loc3_ < 3 ? "稍微" : "") + "更坚韧了。");
            }
         }
         _loc1_ = "int";
         _loc2_ = tempStat;
         _loc3_ = int(_loc1_ in StringMap.reserved ? _loc2_.getReserved(_loc1_) : _loc2_.h[_loc1_]);
         if(_loc3_ > 0)
         {
            _loc4_ = _loc1_;
            if(_loc4_ == "int")
            {
               outputText("[pg-]你在这个世界与各种生物战斗的经历磨炼了你的心智" + (_loc3_ < 3 ? " slightly" : "") + "。");
            }
            else if(_loc4_ == "spe")
            {
               outputText("[pg-]战斗的经历驱使你移动得" + (_loc3_ < 3 ? "稍微" : "") + "更快了。");
            }
            else if(_loc4_ == "str")
            {
               outputText("[pg-]经过这段时间的冒险，你感觉你的肌肉变得" + (_loc3_ < 3 ? "稍微" : "明显") + "强壮了。");
            }
            else if(_loc4_ == "tou")
            {
               outputText("[pg-]经历了这么多战斗，你感觉自己变得" + (_loc3_ < 3 ? "稍微" : "") + "更坚韧了。");
            }
         }
         if(tempStatPoints > 0)
         {
            outputText("[pg]你可以稍后分配剩余的属性点。");
         }
         _loc2_ = tempStat;
         var _loc5_:Object = "str" in StringMap.reserved ? _loc2_.getReserved("str") : _loc2_.h["str"];
         var _loc6_:StringMap = tempStat;
         var _loc7_:Object = "tou" in StringMap.reserved ? _loc6_.getReserved("tou") : _loc6_.h["tou"];
         var _loc8_:StringMap = tempStat;
         var _loc9_:Object = "spe" in StringMap.reserved ? _loc8_.getReserved("spe") : _loc8_.h["spe"];
         var _loc10_:StringMap = tempStat;
         dynStats(DynStat.Str(_loc5_),DynStat.Tou(_loc7_),DynStat.Spe(_loc9_),DynStat.Inte("int" in StringMap.reserved ? _loc10_.getReserved("int") : _loc10_.h["int"]),DynStat.NoScale);
         get_player().statPoints = tempStatPoints;
         if(get_player().canBuyPerks())
         {
            doNext(perkBuyMenu);
         }
         else
         {
            doNext(get_returnMenu());
         }
      }
      
      public function dumpStatusEffects(param1:Creature = undefined) : void
      {
         clearOutput();
         var _loc2_:Creature = param1;
         get_game().debugMenu.dumpEffects(_loc2_ != null ? _loc2_ : get_player());
         doNext(displayStats);
      }
      
      public function dumpBonusStats(param1:Creature = undefined) : void
      {
         clearOutput();
         var _loc2_:Creature = param1;
         get_game().debugMenu.dumpBonuses(_loc2_ != null ? _loc2_ : get_player());
         doNext(displayStats);
      }
      
      public function doubleAttackSet(param1:int) : void
      {
         FlagDict_Impl_.arrayWriteInt(KFLAGS.flags,867,param1);
         doubleAttackOptions();
      }
      
      public function doubleAttackOptions() : void
      {
         var choice2:int;
         var _g2:PlayerInfo;
         var choice1:int;
         var _g1:PlayerInfo;
         var choice:int;
         var _g:PlayerInfo;
         var _loc5_:int = 0;
         clearOutput();
         menu();
         var _loc1_:int = FlagDict_Impl_.arrayReadInt(KFLAGS.flags,867);
         var _loc2_:Array = ["总是连击：你总是进行双重攻击，力量加值上限为60。","动态连击：你总是进行双重攻击，除非你的力量超过60。","单次攻击：你总是在战斗中对敌人进行单次攻击。"];
         var _loc3_:int = 0;
         var _loc4_:int = int(_loc2_.length);
         while(_loc3_ < _loc4_)
         {
            _loc5_ = _loc3_++;
            if(_loc5_ == _loc1_)
            {
               outputText("[pg-][b:" + _loc2_[_loc5_] + "]");
            }
            else
            {
               outputText("[pg-]" + _loc2_[_loc5_]);
            }
         }
         _g = this;
         choice = 0;
         addButton(0,"总是连击",function():void
         {
            _g.doubleAttackSet(choice);
         }).disableIf(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,867) == 0,"这是当前的设置。");
         _g1 = this;
         choice1 = 1;
         addButton(1,"动态连击",function():void
         {
            _g1.doubleAttackSet(choice1);
         }).disableIf(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,867) == 1,"这是当前的设置。");
         _g2 = this;
         choice2 = 2;
         addButton(2,"单次攻击",function():void
         {
            _g2.doubleAttackSet(choice2);
         }).disableIf(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,867) == 2,"当前已是此设置。");
         addButton(14,"返回",displayPerks);
      }
      
      public function displayStats() : void
      {
         var andThen6:Function;
         var _g10:PlayerInfo;
         var andThen5:Function;
         var target3:Creature;
         var _g9:PlayerInfo;
         var _g8:PlayerInfo;
         var andThen4:Function;
         var target2:Creature;
         var _g7:PlayerInfo;
         var _g6:PlayerInfo;
         var andThen3:Function;
         var target1:Creature;
         var _g5:PlayerInfo;
         var _g4:PlayerInfo;
         var andThen2:Function;
         var target:Creature;
         var _g3:PlayerInfo;
         var _g2:PlayerInfo;
         var andThen1:Function;
         var _g1:PlayerInfo;
         var andThen:Function;
         var _g:PlayerInfo;
         var link:Function;
         var _loc10_:* = null as Stat;
         var _loc16_:Boolean = false;
         var _loc17_:Boolean = false;
         var _loc18_:Boolean = false;
         var _loc19_:Boolean = false;
         var _loc20_:Boolean = false;
         var _loc21_:Boolean = false;
         var _loc22_:* = null as String;
         var _loc24_:* = null as String;
         var _loc26_:Boolean = false;
         var _loc27_:Boolean = false;
         var _loc28_:Boolean = false;
         var _loc29_:Boolean = false;
         var _loc30_:Boolean = false;
         var _loc35_:* = null as Cock;
         var _loc43_:Number = NaN;
         var _loc45_:* = null as String;
         var _loc48_:* = null as String;
         get_mainView().stage.addEventListener(TextEvent.LINK,displayStatSummary);
         spriteSelect(null);
         imageSelect(null);
         clearOutput();
         displayHeader("属性");
         link = function(param1:String):String
         {
            return "[u:<a href=\"event:" + param1 + "\">" + param1 + "</a>]";
         };
         var _loc1_:StatSection = new StatSection("战斗属性");
         var _loc2_:* = get_player().regeneration(false,false);
         var _loc3_:* = get_player().regeneration(true,false);
         var _loc4_:Number = Math.round(get_player().maxHP() * Number(_loc2_.percent) / 100) + Number(_loc2_.bonus);
         var _loc5_:Number = Math.round(get_player().maxHP() * Number(_loc3_.percent) / 100) + Number(_loc3_.bonus);
         var _loc6_:Boolean = _loc4_ != _loc5_;
         _loc1_.addStat(link("攻击伤害"),"" + get_game().combat.calcWeaponDamage() + (get_player().hasPerk(PerkLib.DoubleAttack) ? " (连击：" + get_game().combat.calcWeaponDamage(true) + ")" : ""));
         _loc1_.addStat(link("物理伤害"),"" + int(Math.round(100 * get_player().physMod())) + "%");
         _loc1_.addStat(link("挑逗几率"),get_player().getBonusStat("挑逗几率") + get_player().get_upperGarment().get_sexiness() + get_player().get_lowerGarment().get_sexiness());
         _loc1_.addStat(link("挑逗伤害"),get_player().getBonusStat("挑逗伤害"));
         _loc1_.addStat(link("暴击率"),"" + int(Math.round(get_player().getBaseCritChance())) + "%");
         _loc1_.addStat(link("武器暴击率"),"" + int(Math.round(get_player().getMeleeCritBonus())) + "%");
         _loc1_.addStat(link("闪避几率"),"" + int(Math.round(get_player().getEvasionChance())) + "%");
         _loc1_.addStat(link("招架几率"),"" + (get_player().canParry() ? int(Math.round(get_player().parryChance())) : 0) + "%",get_player().hasPerk(PerkLib.Parry));
         _loc1_.addStat(link("护甲"),"" + get_player().get_armorDef());
         _loc1_.addStat("伤害抵抗","" + (100 - get_player().damagePercent(true,false,false,true)) + "-" + (100 - get_player().damagePercent(false,true,false,true)) + "% (越高越好)");
         _loc1_.addStat("生命恢复" + (_loc6_ ? " (战斗)" : ""),"" + _loc5_ + " (" + Number(_loc3_.percent) + "% + " + Number(_loc3_.bonus) + ")");
         _loc1_.addStat("生命恢复 (非战斗)","" + _loc4_ + " (" + Number(_loc2_.percent) + "% + " + Number(_loc2_.bonus) + ")",_loc6_);
         _loc1_.addStat(link("欲望抗性"),"" + (100 - int(Math.round(get_player().lustPercent()))) + "% (越高越好)");
         _loc1_.addStat(link("法术修正"),"" + int(Math.round(100 * get_player().spellMod())) + "%");
         _loc1_.addStat(link("法术消耗"),"" + get_player().spellCost(100) + "%");
         _loc1_.addStat("细剑技能","" + get_player().get_rapierTraining() + " / 4",get_player().get_rapierTraining() != 0);
         _loc1_.display();
         var _loc7_:StatSection = new StatSection("子嗣");
         var _loc8_:Array = [new Stat("分娩次数",get_player().statusEffectv1(StatusEffects.Birthed),null,null),new Stat("与艾米莉的窝数",FlagDict_Impl_.arrayReadInt(KFLAGS.flags,40) + FlagDict_Impl_.arrayReadInt(KFLAGS.flags,162),null,null),new Stat("产下的伯努瓦蛋",FlagDict_Impl_.arrayReadInt(KFLAGS.flags,572),null,null),new Stat("产下的伯努瓦特蛋",FlagDict_Impl_.arrayReadInt(KFLAGS.flags,1190),null,null),new Stat("与腐化魔女的孩子",FlagDict_Impl_.arrayReadInt(KFLAGS.flags,2651) + FlagDict_Impl_.arrayReadInt(KFLAGS.flags,2650),null,null),new Stat("与科顿的孩子",FlagDict_Impl_.arrayReadInt(KFLAGS.flags,675),null,null),new Stat("与艾德琳的孩子",FlagDict_Impl_.arrayReadInt(KFLAGS.flags,69),null,null),new Stat("烬后代（雄性）",FlagDict_Impl_.arrayReadInt(KFLAGS.flags,554),null,null),new Stat("烬后代（雌性）",FlagDict_Impl_.arrayReadInt(KFLAGS.flags,555),null,null),new Stat("烬后代（扶他）",FlagDict_Impl_.arrayReadInt(KFLAGS.flags,556),null,null),new Stat("与烬的孩子总数",get_game().emberScene.emberChildren(),null,null),new Stat("产下的烬龙蛋",FlagDict_Impl_.arrayReadInt(KFLAGS.flags
         ,557),null,null),new Stat("与伊莎贝拉的孩子 (男)",get_game().isabellaScene.getIsabellaChildType(1),null,null),new Stat("与伊莎贝拉的孩子 (女)",get_game().isabellaScene.getIsabellaChildType(2),null,null),new Stat("与伊莎贝拉的孩子 (扶他)",get_game().isabellaScene.getIsabellaChildType(3),null,null),new Stat("与伊莎贝拉的孩子总数",get_game().isabellaScene.totalIsabellaChildren(),null,null),new Stat("与伊兹玛的孩子（鲨鱼娘）",FlagDict_Impl_.arrayReadInt(KFLAGS.flags,251),null,null),new Stat("与伊兹玛的孩子（虎鲨）",FlagDict_Impl_.arrayReadInt(KFLAGS.flags,252),null,null),new Stat("与伊兹玛的孩子总数",get_game().izmaScene.totalIzmaChildren(),null,null),new Stat("与凯莉的孩子（男）",FlagDict_Impl_.arrayReadInt(KFLAGS.flags,1213),null,null),new Stat("与凯莉的孩子（女）",FlagDict_Impl_.arrayReadInt(KFLAGS.flags,908) - FlagDict_Impl_.arrayReadInt(KFLAGS.flags,1213),null,null),new Stat("与凯莉的孩子总数",FlagDict_Impl_.arrayReadInt(KFLAGS.flags,908),null,null),new Stat("基哈的后代 (男)",FlagDict_Impl_.arrayReadInt(KFLAGS.flags,2195),null,null),new Stat("基哈的后代 (女)",FlagDict_Impl_.arrayReadInt(KFLAGS
         .flags,2196),null,null),new Stat("基哈的后代 (扶他)",FlagDict_Impl_.arrayReadInt(KFLAGS.flags,2197),null,null),new Stat("与基哈的孩子总数",get_game().kihaFollowerScene.totalKihaChildren(),null,null),new Stat("与琳妮特的孩子",FlagDict_Impl_.arrayReadInt(KFLAGS.flags,1024),null,null),new Stat("与玛布尔的孩子",FlagDict_Impl_.arrayReadInt(KFLAGS.flags,8),null,null),new Stat("与米内瓦的孩子",FlagDict_Impl_.arrayReadInt(KFLAGS.flags,2091),null,null),new Stat("与菲拉的蚂蚁孩子",FlagDict_Impl_.arrayReadInt(KFLAGS.flags,874),null,null),new Stat("与菲拉的蛛化精灵孩子",FlagDict_Impl_.arrayReadInt(KFLAGS.flags,894),null,null),new Stat("与菲拉的孩子总数",FlagDict_Impl_.arrayReadInt(KFLAGS.flags,874) + FlagDict_Impl_.arrayReadInt(KFLAGS.flags,894),null,null),new Stat("与希拉的孩子（小袋鼠）",FlagDict_Impl_.arrayReadInt(KFLAGS.flags,763),null,null),new Stat("与希拉的孩子（小恶魔）",FlagDict_Impl_.arrayReadInt(KFLAGS.flags,859),null,null),new Stat("与希拉的孩子总数",FlagDict_Impl_.arrayReadInt(KFLAGS.flags,763) + FlagDict_Impl_.arrayReadInt(KFLAGS.flags,859),null,null),new Stat("与苏菲的孩子",get_game()
         .sophieBimbo.sophieChildren(),null,null),new Stat("为苏菲受精的卵",FlagDict_Impl_.arrayReadInt(KFLAGS.flags,94),null,"" + (FlagDict_Impl_.arrayReadInt(KFLAGS.flags,94) + get_game().sophieBimbo.sophieChildren())),new Stat("与塔玛妮的孩子",FlagDict_Impl_.arrayReadInt(KFLAGS.flags,1204),null,"" + FlagDict_Impl_.arrayReadInt(KFLAGS.flags,1204) + " (经历自然选择之后)"),new Stat("与乌尔塔的孩子",get_game().urtaPregs.urtaKids(),null,null),new Stat("成年牛头人后代",FlagDict_Impl_.arrayReadInt(KFLAGS.flags,326),null,null)];
         var _loc9_:int = 0;
         while(_loc9_ < int(_loc8_.length))
         {
            _loc10_ = _loc8_[_loc9_];
            _loc9_++;
            _loc7_.add(_loc10_);
         }
         _loc7_.display();
         var _loc11_:StatSection = new StatSection("身体属性");
         var _loc12_:String = Utils.addComma(int(Math.round(get_player().cumQ())));
         var _loc13_:String = Utils.addComma(int(Math.round(get_player().cumCapacity())));
         var _loc14_:String = "" + int(Math.floor(get_player().hunger)) + " / 100 (";
         var _loc15_:Number = get_player().hunger;
         if(_loc15_ <= 0 == true)
         {
            _loc22_ = "<font color=\"#ff0000\">濒死</font>";
         }
         else
         {
            _loc21_ = _loc15_ < 10;
            if(_loc21_ == true)
            {
               _loc22_ = "<font color=\"#C00000\">极度饥饿</font>";
            }
            else
            {
               _loc20_ = _loc15_ < 25;
               if(_loc20_ == true)
               {
                  _loc22_ = "<font color=\"#800000\">很饿</font>";
               }
               else
               {
                  _loc19_ = _loc15_ < 50;
                  if(_loc19_ == true)
                  {
                     _loc22_ = "饥饿";
                  }
                  else
                  {
                     _loc18_ = _loc15_ < 75;
                     if(_loc18_ == true)
                     {
                        _loc22_ = "还不饿";
                     }
                     else
                     {
                        _loc17_ = _loc15_ < 90;
                        if(_loc17_ == true)
                        {
                           _loc22_ = "<font color=\"#008000\">饱足</font>";
                        }
                        else
                        {
                           _loc16_ = _loc15_ < 100;
                           _loc22_ = _loc16_ == true ? "<font color=\"#00C000\">吃饱了</font>" : "<font color=\"#00C000\">吃撑</font>";
                        }
                     }
                  }
               }
            }
         }
         var _loc23_:String = _loc14_ + _loc22_ + ")";
         var _loc25_:Number = get_player().sexOrientation;
         if(_loc25_ >= 90 == true)
         {
            _loc24_ = "只受男性吸引";
         }
         else
         {
            _loc30_ = _loc25_ >= 70;
            if(_loc30_ == true)
            {
               _loc24_ = "受男性吸引";
            }
            else
            {
               _loc29_ = _loc25_ > 60;
               if(_loc29_ == true)
               {
                  _loc24_ = "偏好男性，双性好奇";
               }
               else
               {
                  _loc28_ = _loc25_ >= 40;
                  if(_loc28_ == true)
                  {
                     _loc24_ = "双性恋";
                  }
                  else
                  {
                     _loc27_ = _loc25_ > 30;
                     if(_loc27_ == true)
                     {
                        _loc24_ = "偏好女性，双性好奇";
                     }
                     else
                     {
                        _loc26_ = _loc25_ > 10;
                        _loc24_ = _loc26_ == true ? "受女性吸引" : "只受女性吸引";
                     }
                  }
               }
            }
         }
         _loc24_ += " (" + get_player().sexOrientation + ")";
         _loc9_ = 1;
         if(get_player().hasPerk(PerkLib.MaraesGiftFertility))
         {
            _loc9_++;
         }
         if(get_player().hasPerk(PerkLib.BroodMother))
         {
            _loc9_++;
         }
         if(get_player().hasPerk(PerkLib.FerasBoonBreedingBitch))
         {
            _loc9_++;
         }
         if(get_player().hasPerk(PerkLib.MagicalFertility))
         {
            _loc9_++;
         }
         if(get_player().hasPerk(PerkLib.FerasBoonWideOpen) || get_player().hasPerk(PerkLib.FerasBoonMilkingTwat))
         {
            _loc9_++;
         }
         var _loc31_:Number = 0;
         var _loc32_:Number = 0;
         var _loc33_:int = 0;
         var _loc34_:Array = get_player().cocks;
         while(_loc33_ < int(_loc34_.length))
         {
            _loc35_ = _loc34_[_loc33_];
            _loc33_++;
            _loc31_ += _loc35_.cockLength;
            _loc32_ += _loc35_.cockThickness;
         }
         _loc11_.addStat("饱腹度",_loc23_,get_survival());
         _loc11_.addStat("肛门容量",int(Math.round(get_player().analCapacity())));
         _loc11_.addStat("肛门松弛度",int(Math.round(get_player().ass.analLooseness)));
         _loc11_.addStat("丰饶评级 (基础)",int(Math.round(get_player().fertility)));
         _loc11_.addStat("丰饶评级 (含特质)",int(Math.round(get_player().totalFertility())));
         _loc11_.addStat("男子气概评级",get_player().virilityQ(),get_player().cumQ() > 0);
         _loc11_.addStat("精液产量","" + _loc12_ + " / " + _loc13_ + "mL (" + int(Math.round(get_player().cumQ() / get_player().cumCapacity() * 100)) + "%)",get_player().cumQ() > 0 && get_realistic());
         _loc11_.addStat("精液产量","" + _loc12_ + "mL",get_player().cumQ() > 0 && !get_realistic());
         _loc11_.addStat("产奶量","" + Utils.addComma(int(Math.round(get_player().lactationQ()))) + "mL",get_player().lactationQ() > 0);
         _loc11_.addStat("距离上次母乳喂养他人的小时数",get_player().statusEffectv2(StatusEffects.Feeder) + (get_player().statusEffectv2(StatusEffects.Feeder) >= 72 ? " (太久了！敏感度正在增加！)" : ""),get_player().hasStatusEffect(StatusEffects.Feeder));
         _loc11_.addStat("性取向",_loc24_);
         _loc11_.addStat("怀孕速度倍率","? (因滞育而变化)",get_player().hasPerk(PerkLib.Diapause));
         _loc11_.addStat("怀孕速度倍率",_loc9_,!get_player().hasPerk(PerkLib.Diapause));
         _loc11_.addStat("阴茎总数",get_player().cockTotal(),get_player().hasCock());
         _loc11_.addStat("阴茎总长度",Measurements.numInchesOrCentimetres(_loc31_),get_player().hasCock());
         _loc11_.addStat("阴茎总粗度",Measurements.numInchesOrCentimetres(_loc32_),get_player().hasCock());
         _loc11_.addStat("阴道容量",int(Math.round(get_player().vaginalCapacity())),get_player().hasVagina());
         _loc11_.addStat("阴道松弛度",int(Math.round(get_player().looseness())),get_player().hasVagina());
         _loc11_.addStat("产卵管卵子总数",get_player().eggs(),get_player().hasOvipositor());
         _loc11_.addStat("产卵管受精卵数",get_player().fertilizedEggs(),get_player().hasOvipositor());
         _loc11_.addStat("史莱姆渴求","生效中！你目前正在流失力量和速度。你应该找点体液。",get_player().statusEffectv1(StatusEffects.SlimeCraving) >= 18);
         var _loc36_:Number = 2;
         if(get_player().hasPerk(PerkLib.SlimeCore))
         {
            _loc36_ /= 2;
         }
         if(get_player().get_jewelry().get_id() == get_jewelries().AQUARING.get_id())
         {
            _loc36_ /= 2;
         }
         _loc11_.addStat("储存的史莱姆","" + (17 - get_player().statusEffectv1(StatusEffects.SlimeCraving)) * _loc36_ + "小时，之后你将开始失去力量。",get_player().hasStatusEffect(StatusEffects.SlimeCraving) && get_player().statusEffectv1(StatusEffects.SlimeCraving) < 18);
         _loc11_.display();
         var _loc37_:StatSection = new StatSection("种族评分");
         _loc34_ = [new Stat("人类",get_player().humanScore(),null,null),new Stat("变异体",get_player().mutantScore(),null,null),new Stat("恶魔",get_player().demonScore(),null,null),new Stat("地精",get_player().goblinScore(),null,null),new Stat("史莱姆",get_player().gooScore(),null,null),new Stat("牛",get_player().cowScore(),null,null),new Stat("牛头人",get_player().minoScore(),null,null),new Stat("猫",get_player().catScore(),null,null),new Stat("蜥蜴",get_player().lizardScore(),null,null),new Stat("火蜥蜴",get_player().salamanderScore(),null,null),new Stat("龙",get_player().dragonScore(),null,null),new Stat("娜迦",get_player().nagaScore(),null,null),new Stat("沙地陷阱",get_player().sandTrapScore(),null,null),new Stat("鸟类",get_player().harpyScore(),null,null),new Stat("鲨鱼",get_player().sharkScore(),null,null),new Stat("塞壬",get_player().sirenScore(),null,null),new Stat("犬",get_player().dogScore(),null,null),new Stat("狼",get_player().wolfScore(),null,null),new Stat("狐狸",get_player().foxScore(),null,null),new Stat("狐妖",get_player()
         .kitsuneScore(),null,null),new Stat("针鼹",get_player().echidnaScore(),null,null),new Stat("老鼠",get_player().mouseScore(),null,null),new Stat("雪貂",get_player().ferretScore(),null,null),new Stat("浣熊",get_player().raccoonScore(),null,null),new Stat("兔子",get_player().bunnyScore(),null,null),new Stat("袋鼠",get_player().kangaScore(),null,null),new Stat("马",get_player().horseScore(),null,null),new Stat("鹿",get_player().deerScore(),null,null),new Stat("萨堤尔",get_player().satyrScore(),null,null),new Stat("犀牛",get_player().rhinoScore(),null,null),new Stat("蜘蛛",get_player().spiderScore(),null,null),new Stat("猪",get_player().pigScore(),null,null),new Stat("蜜蜂",get_player().beeScore(),null,null),new Stat("鸡蛇",get_player().cockatriceScore(),null,null),new Stat("小熊猫",get_player().redPandaScore(),null,null),new Stat("树妖",get_player().dryadScore(),null,null),new Stat("美人鱼",get_player().mermaidScore(),null,null)];
         _loc33_ = 0;
         while(_loc33_ < int(_loc34_.length))
         {
            _loc10_ = _loc34_[_loc33_];
            _loc33_++;
            _loc37_.add(_loc10_);
         }
         _loc37_.display();
         var _loc38_:StatSection = new StatSection("杂项统计");
         _loc33_ = FlagDict_Impl_.arrayReadInt(KFLAGS.flags,2078);
         _loc38_.addStat("营地人口",get_camp().getCampPopulation(),get_camp().getCampPopulation() > 0);
         _loc38_.addStat("腐化林地状态",_loc33_ < 100 ? "剩余" + (100 - _loc33_) + "%" : "已灭绝",_loc33_ > 0);
         _loc38_.addStat("交易获得的蛋",FlagDict_Impl_.arrayReadInt(KFLAGS.flags,653),FlagDict_Impl_.arrayReadInt(KFLAGS.flags,653) > 0);
         _loc38_.addStat("利用猫科柔韧找乐子的次数",FlagDict_Impl_.arrayReadInt(KFLAGS.flags,67),FlagDict_Impl_.arrayReadInt(KFLAGS.flags,67) > 0);
         _loc38_.addStat("在竞技场群交的次数",FlagDict_Impl_.arrayReadInt(KFLAGS.flags,334),FlagDict_Impl_.arrayReadInt(KFLAGS.flags,334) > 0);
         _loc38_.addStat("竞技场胜利次数",FlagDict_Impl_.arrayReadInt(KFLAGS.flags,335),FlagDict_Impl_.arrayReadInt(KFLAGS.flags,334) > 0);
         _loc38_.addStat("施法次数",FlagDict_Impl_.arrayReadInt(KFLAGS.flags,868),FlagDict_Impl_.arrayReadInt(KFLAGS.flags,868) > 0);
         _loc38_.addStat("坏结局次数",FlagDict_Impl_.arrayReadInt(KFLAGS.flags,2104),FlagDict_Impl_.arrayReadInt(KFLAGS.flags,2104) > 0);
         _loc38_.addStat("高潮次数",FlagDict_Impl_.arrayReadInt(KFLAGS.flags,2001),FlagDict_Impl_.arrayReadInt(KFLAGS.flags,2001) > 0);
         _loc38_.display();
         var _loc39_:StatSection = new StatSection("成瘾");
         _loc39_.addStat("玛布尔奶","" + (get_player().hasPerk(PerkLib.MarbleResistant) ? 0 : (get_player().hasPerk(PerkLib.MarblesMilk) ? 100 : int(Math.round(get_game().marbleScene.get_marbleAddiction())))) + "%",get_game().marbleScene.get_knowAddiction() > 0);
         _loc39_.addStat("牛头人精液",!get_player().hasPerk(PerkLib.MinotaurCumAddict) ? "" + int(Math.round(FlagDict_Impl_.arrayReadFloat(KFLAGS.flags,18) / 10)) * 10 + "%" : (get_player().hasPerk(PerkLib.MinotaurCumResistance) ? "0% (Immune)" : "100+%"),FlagDict_Impl_.arrayReadInt(KFLAGS.flags,340) > 0 || FlagDict_Impl_.arrayReadFloat(KFLAGS.flags,18) > 0 || get_player().hasPerk(PerkLib.MinotaurCumAddict) || get_player().hasPerk(PerkLib.MinotaurCumResistance));
         _loc39_.display();
         var _loc40_:StatSection = new StatSection("人际关系统计");
         var _loc41_:int = FlagDict_Impl_.arrayReadInt(KFLAGS.flags,218) + FlagDict_Impl_.arrayReadInt(KFLAGS.flags,219) + FlagDict_Impl_.arrayReadInt(KFLAGS.flags,220);
         var _loc42_:String = "";
         if(get_game().urta.urtaLove())
         {
            _loc43_ = FlagDict_Impl_.arrayReadFloat(KFLAGS.flags,711);
            if(_loc43_ == -1)
            {
               _loc42_ = "<font color=\"#008000\">恋人+</font>";
            }
            else if(_loc43_ == 0)
            {
               _loc42_ = "恋人";
            }
            else if(_loc43_ == 1)
            {
               _loc42_ = "<font color=\"#800000\">离开</font>";
            }
         }
         else if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,12) == -1)
         {
            _loc42_ = "羞愧";
         }
         else if(FlagDict_Impl_.arrayReadFloat(KFLAGS.flags,29) < 30)
         {
            _loc42_ = int(Math.round(FlagDict_Impl_.arrayReadFloat(KFLAGS.flags,29) * 3.3333)) + "%";
         }
         else
         {
            _loc42_ = "准备表白";
         }
         _loc40_.addStat("艾米莉的好感度",FlagDict_Impl_.arrayReadInt(KFLAGS.flags,38),FlagDict_Impl_.arrayReadInt(KFLAGS.flags,35) > 0);
         _loc40_.addStat("阿瑞安的健康值",get_game().arianScene.arianHealth(),FlagDict_Impl_.arrayReadInt(KFLAGS.flags,934) > 0);
         _loc40_.addStat("阿瑞安性交次数",FlagDict_Impl_.arrayReadInt(KFLAGS.flags,942),FlagDict_Impl_.arrayReadInt(KFLAGS.flags,942) > 0);
         _loc40_.addStat("[Benoit Name] Affection","" + get_game().bazaar.benoit.benoitAffection() + "%",get_game().bazaar.benoit.benoitAffection() > 0);
         _loc40_.addStat("布鲁克好感度",get_game().telAdre.brooke.brookeAffection(),FlagDict_Impl_.arrayReadInt(KFLAGS.flags,920) > 0);
         _loc40_.addStat("被塞拉芙夺走的身体部位",_loc41_,_loc41_ > 0);
         _loc40_.addStat("烬的好感度","" + get_game().emberScene.emberAffection() + "%",get_game().emberScene.emberAffection() > 0);
         _loc40_.addStat("烬的切磋强度",get_game().emberScene.emberSparIntensity(),get_game().emberScene.emberSparIntensity() > 0);
         _loc40_.addStat("赫莉亚的好感度","" + get_game().helFollower.helAffection() + "%",get_game().helFollower.helAffection() > 0);
         _loc40_.addStat("赫莉亚奖励点数",FlagDict_Impl_.arrayReadInt(KFLAGS.flags,966),get_game().helFollower.helAffection() >= 100);
         _loc40_.addStat("赫莉亚切磋强度",get_game().helScene.heliaSparIntensity(),get_game().helFollower.followerHel());
         _loc40_.addStat("伊莎贝拉的好感度","" + (get_game().isabellaFollowerScene.isabellaFollower() ? 100 : FlagDict_Impl_.arrayReadInt(KFLAGS.flags,368)) + "%",FlagDict_Impl_.arrayReadInt(KFLAGS.flags,368) > 0);
         _loc40_.addStat("凯瑟琳的服从度",get_game().telAdre.katherine.submissiveness(),FlagDict_Impl_.arrayReadInt(KFLAGS.flags,398) >= 4);
         _loc40_.addStat("对凯尔特的顺从度","" + Math.min(100,int(Math.round(get_player().statusEffectv2(StatusEffects.Kelt) / 130 * 100))) + "%",get_player().hasStatusEffect(StatusEffects.Kelt) && FlagDict_Impl_.arrayReadInt(KFLAGS.flags,725) == 0 && FlagDict_Impl_.arrayReadInt(KFLAGS.flags,2030) == 0);
         _loc40_.addStat("小A的自信心","" + get_game().anemoneScene.kidAXP() + "%",FlagDict_Impl_.arrayReadInt(KFLAGS.flags,454) > 0);
         _loc40_.addStat("基哈的好感度","" + (get_game().kihaFollowerScene.followerKiha() ? 100 : FlagDict_Impl_.arrayReadInt(KFLAGS.flags,422)) + "%",FlagDict_Impl_.arrayReadInt(KFLAGS.flags,421) >= 2 || get_game().kihaFollowerScene.followerKiha());
         _loc40_.addStat("洛蒂的鼓励","" + get_game().telAdre.lottie.lottieMorale() + " (越高越好)",FlagDict_Impl_.arrayReadInt(KFLAGS.flags,281) > 0);
         _loc40_.addStat("洛蒂的身材","" + get_game().telAdre.lottie.lottieTone() + " (越高越好)",FlagDict_Impl_.arrayReadInt(KFLAGS.flags,281) > 0);
         _loc40_.addStat("琳妮特的认可度",get_game().mountain.salon.lynnetteApproval(),get_game().mountain.salon.lynnetteApproval() != 0);
         _loc40_.addStat("玛布尔的好感度","" + get_game().marbleScene.get_marbleAffection() + "%",get_game().marbleScene.get_marbleAffection() > 0);
         _loc40_.addStat("欧卡的态度",FlagDict_Impl_.arrayReadInt(KFLAGS.flags,503),FlagDict_Impl_.arrayReadInt(KFLAGS.flags,503) > 0);
         _loc40_.addStat("帕布罗的好感度","" + FlagDict_Impl_.arrayReadInt(KFLAGS.flags,2328) + "%",get_game().telAdre.pablo.pabloAffection() > 0);
         _loc40_.addStat("露比的好感度","" + get_game().telAdre.rubi.rubiAffection() + "%",get_game().telAdre.rubi.rubiAffection() > 0);
         _loc40_.addStat("露比的腔道容量","" + get_game().telAdre.rubi.rubiCapacity() + "%",get_game().telAdre.rubi.rubiAffection() > 0);
         _loc40_.addStat("希拉的腐化","" + get_game().sheilaScene.sheilaCorruption() + (get_game().sheilaScene.sheilaCorruption() > 100 ? " (是的，它可以超过100)" : ""),FlagDict_Impl_.arrayReadInt(KFLAGS.flags,761) != 0);
         _loc40_.addStat("西尔维娅的好感度","" + get_game().sylviaScene.get_sylviaGetAff() + "%",get_game().sylviaScene.get_sylviaProg() > 0);
         _loc40_.addStat("西尔维娅的支配度","" + get_game().sylviaScene.get_sylviaGetDom() + "%",get_game().sylviaScene.get_sylviaProg() > 0);
         _loc40_.addStat("瓦莱里娅的体液","" + FlagDict_Impl_.arrayReadInt(KFLAGS.flags,2200) + "%",get_game().valeria.valeriaFluidsEnabled());
         _loc40_.addStat("乌尔塔的" + (FlagDict_Impl_.arrayReadFloat(KFLAGS.flags,29) < 30 ? "好感度" : "状态"),_loc42_,FlagDict_Impl_.arrayReadInt(KFLAGS.flags,12) != 0 && !get_urtaDisabled());
         _loc40_.addStat("爱子好感度",Utils.boundInt(0,FlagDict_Impl_.arrayReadInt(KFLAGS.flags,2356),100) + "%",FlagDict_Impl_.arrayReadInt(KFLAGS.flags,2353) > 0);
         _loc40_.addStat("爱子腐化",get_game().forest.aikoScene.get_aikoCorruption(),FlagDict_Impl_.arrayReadInt(KFLAGS.flags,2353) > 0);
         _loc40_.display();
         var _loc44_:StatSection = new StatSection("当前状态效果");
         _loc43_ = get_player().statusEffectv1(StatusEffects.ParasiteEel);
         var _loc46_:Number = get_player().statusEffectv2(StatusEffects.ParasiteEelNeedCum);
         if(_loc46_ == 1)
         {
            _loc45_ = "小恶魔";
         }
         else if(_loc46_ == 2)
         {
            _loc45_ = "牛头人";
         }
         else if(_loc46_ == 4)
         {
            _loc45_ = "老鼠";
         }
         else if(_loc46_ == 10)
         {
            _loc45_ = "海葵";
         }
         else if(_loc46_ == 39)
         {
            _loc45_ = "触手怪";
         }
         else
         {
            _loc45_ = "ERROR";
         }
         var _loc47_:String = get_player().hasStatusEffect(StatusEffects.ParasiteEelNeedCum) ? "[pg-]Eel parasite" + (_loc43_ > 1 ? "s" : "") + " hunger" + (_loc43_ > 1 ? "" : "s") + " for [b:" + _loc45_ + "] cum" : "";
         _loc46_ = get_player().statusEffectv2(StatusEffects.ParasiteNephilaNeedCum);
         if(_loc46_ == 1)
         {
            _loc48_ = "小恶魔";
         }
         else if(_loc46_ == 2)
         {
            _loc48_ = "牛头人";
         }
         else if(_loc46_ == 4)
         {
            _loc48_ = "老鼠";
         }
         else if(_loc46_ == 10)
         {
            _loc48_ = "海葵";
         }
         else
         {
            _loc48_ = "ERROR";
         }
         _loc44_.addStat("发情",int(Math.round(get_player().statusEffectv3(StatusEffects.Heat))) + " 小时剩余",get_player().get_inHeat());
         _loc44_.addStat("发情期",int(Math.round(get_player().statusEffectv3(StatusEffects.Rut))) + " 小时剩余",get_player().get_inRut());
         _loc44_.addStat("鳗鱼寄生虫数量","" + _loc43_ + _loc47_,get_player().hasStatusEffect(StatusEffects.ParasiteEel));
         _loc44_.addStat("涅菲拉寄生虫感染等级","" + get_player().statusEffectv1(StatusEffects.ParasiteNephila) + "[pg-]Nephila parasites hunger for " + int(Math.round(get_player().statusEffectv3(StatusEffects.ParasiteNephilaNeedCum))) + " liters of [b:" + _loc48_ + "] cum",get_player().hasStatusEffect(StatusEffects.ParasiteNephila));
         _loc44_.addStat("催情膏",int(Math.round(get_player().statusEffectv1(StatusEffects.Luststick))) + " 小时剩余",get_player().statusEffectv1(StatusEffects.Luststick) > 0);
         _loc44_.addStat("涂抹催情膏",int(Math.round(get_player().statusEffectv1(StatusEffects.LustStickApplied))) + " 小时剩余",get_player().statusEffectv1(StatusEffects.LustStickApplied) > 0);
         _loc44_.addStat("淫荡之舌",int(Math.round(get_player().statusEffectv1(StatusEffects.LustyTongue))) + " 小时剩余",get_player().statusEffectv1(StatusEffects.LustyTongue) > 0);
         _loc44_.addStat("黑猫啤酒",get_player().statusEffectv1(StatusEffects.BlackCatBeer) + " 小时剩余（欲望抗性降低20%，物理抗性提高25%）",get_player().statusEffectv1(StatusEffects.BlackCatBeer) > 0);
         _loc44_.addStat("乌玛的按摩",get_player().statusEffectv3(StatusEffects.UmasMassage) + " 小时剩余。",get_player().statusEffectv1(StatusEffects.UmasMassage) > 0);
         _loc44_.addStat("性功能障碍",get_player().statusEffectv1(StatusEffects.Dysfunction) + " 小时剩余。（无法自慰）",get_player().statusEffectv1(StatusEffects.Dysfunction) > 0);
         _loc44_.addStat("醉酒",get_player().statusEffectv1(StatusEffects.PhoukaWhiskeyAffect) + " 小时剩余。",get_player().statusEffectv1(StatusEffects.PhoukaWhiskeyAffect) > 0);
         _loc44_.addStat("疲劳","" + get_player().statusEffectv2(StatusEffects.GlobalFatigue) + " hours remaining. (increases fatigue costs by " + get_player().statusEffectv1(StatusEffects.GlobalFatigue) + "%)",get_player().statusEffectv2(StatusEffects.GlobalFatigue) > 0);
         _loc44_.display();
         if(get_player().statPoints > 0)
         {
            outputText("[pg-][b:你有 " + int(Math.floor(get_player().statPoints)) + " 点属性（" + Utils.pluralize(int(Math.floor(get_player().statPoints)),"point") + "）可供分配。]");
         }
         if(get_player().perkPoints > 0)
         {
            outputText("[pg-][b:你有 " + int(Math.floor(get_player().perkPoints)) + " 点特质（" + Utils.pluralize(int(Math.floor(get_player().perkPoints)),"point") + "）可供使用。]");
         }
         menu();
         addButtonDisabled(0,"属性");
         if(get_player().canBuyStats())
         {
            _g = this;
            andThen = initAttributeMenu;
            addButton(0,"属性提升",function():void
            {
               _g.cleanUpStats(andThen);
            });
         }
         _g1 = this;
         andThen1 = displayMastery;
         addButton(1,"精通",function():void
         {
            _g1.cleanUpStats(andThen1);
         });
         if(get_game().get_inCombat() && (CoC_Settings.debugBuild || get_debug()))
         {
            _g2 = this;
            _g3 = this;
            target = get_player();
            andThen2 = function():void
            {
               _g3.dumpStatusEffects(target);
            };
            addButton(5,"导出效果",function():void
            {
               _g2.cleanUpStats(andThen2);
            });
            _g4 = this;
            _g5 = this;
            target1 = get_player();
            andThen3 = function():void
            {
               _g5.dumpBonusStats(target1);
            };
            addButton(6,"导出特质",function():void
            {
               _g4.cleanUpStats(andThen3);
            });
            _g6 = this;
            _g7 = this;
            target2 = get_monster();
            andThen4 = function():void
            {
               _g7.dumpStatusEffects(target2);
            };
            addButton(10,"目标效果",function():void
            {
               _g6.cleanUpStats(andThen4);
            });
            _g8 = this;
            _g9 = this;
            target3 = get_monster();
            andThen5 = function():void
            {
               _g9.dumpBonusStats(target3);
            };
            addButton(11,"目标特质",function():void
            {
               _g8.cleanUpStats(andThen5);
            });
         }
         _g10 = this;
         andThen6 = get_returnMenu();
         addButton(14,"返回",function():void
         {
            _g10.cleanUpStats(andThen6);
         });
      }
      
      public function displayStatSummary(param1:TextEvent) : void
      {
         clearOutput();
         get_mainView().stage.removeEventListener(TextEvent.LINK,displayStatSummary);
         var _loc2_:String = param1.text;
         if(_loc2_ == "护甲")
         {
            displayArmorSummary();
         }
         else if(_loc2_ == "招架几率")
         {
            if(!get_player().canParry())
            {
               outputText("[pg-][b: 目前无法格挡。][pg]");
            }
            outputText("[pg-][b:基础:] " + int(Math.round((get_player().get_spe() - 50) / 5)) + "%" + get_player().getBonusStatSummary("招架几率"));
         }
         else if(_loc2_ == "挑逗伤害")
         {
            outputText(get_player().getBonusStatSummary("挑逗伤害"));
         }
         else if(_loc2_ == "挑逗几率")
         {
            outputText("[pg-][b:性感度:] " + (get_player().get_upperGarment().get_sexiness() + get_player().get_lowerGarment().get_sexiness()) + get_player().getBonusStatSummary("挑逗几率"));
         }
         else
         {
            if(_loc2_ == "攻击伤害")
            {
               displayAttackDamageSummary();
               return;
            }
            if(_loc2_ == "暴击率")
            {
               outputText("[pg-][b:基础:] 5%" + get_player().getBonusStatSummary("暴击率"));
            }
            else if(_loc2_ == "欲望抗性")
            {
               outputText("[pg-][b:基础:] " + (100 - get_player().getLustPercentBase()) + "%" + get_player().getBonusStatSummary("欲望抗性"));
            }
            else if(_loc2_ == "武器暴击率")
            {
               outputText(get_player().getBonusStatSummary("武器暴击率"));
            }
            else if(_loc2_ == "法术修正")
            {
               outputText("[pg-][b:基础:] 100%" + get_player().getBonusStatSummary("法术修正"));
            }
            else if(_loc2_ == "法术消耗")
            {
               outputText("[pg-][b:基础:] 100%" + get_player().getBonusStatSummary("法术消耗"));
            }
            else if(_loc2_ == "物理伤害")
            {
               outputText("[pg-][b:基础:] 100" + get_player().getBonusStatSummary("物理伤害"));
            }
            else if(_loc2_ == "闪避几率")
            {
               outputText("[pg-][b:基础:] " + int(Math.round(get_player().get_spe() / 10)) + "%" + get_player().getBonusStatSummary("闪避几率"));
            }
         }
         doNext(displayStats);
      }
      
      public function displayPerks() : void
      {
         var _g:PlayerInfo;
         var _loc4_:* = null as Perk;
         var _loc5_:* = null as String;
         var _loc6_:* = null as String;
         var _loc7_:Boolean = false;
         clearOutput();
         displayHeader("特质");
         var _loc1_:Array = [];
         var _loc2_:int = 0;
         var _loc3_:Array = get_player().get_perks();
         while(_loc2_ < int(_loc3_.length))
         {
            _loc4_ = _loc3_[_loc2_];
            _loc2_++;
            _loc5_ = Utils.cnName(_loc4_.get_perkName());
            _loc6_ = Utils.cnName(_loc4_.get_perkDesc());
            _loc1_.push("[pg-][b:" + _loc5_ + "] - " + _loc6_);
         }
         outputText(_loc1_.join(""));
         menu();
         addButtonDisabled(0,"特质");
         _g = this;
         addButton(1,"百科",function():void
         {
            _g.perkDatabase();
         });
         addButton(14,"返回",get_returnMenu());
         if(get_player().perkPoints > 0)
         {
            outputText("[pg][b:你有 " + int(Math.floor(get_player().perkPoints)) + " 特质 " + Utils.pluralize(int(Math.floor(get_player().perkPoints)),"point") + " 可供分配。]");
            addNextButton("购买特质",perkBuyMenu);
         }
         if(get_player().hasPerk(PerkLib.DoubleAttack))
         {
            outputText("[pg-][b:你可以调整你的双重攻击设置。]");
            addNextButton("连击选项",doubleAttackOptions).hint("设置双重攻击选项。");
         }
         if(get_player().hasPerk(PerkLib.AscensionTolerance))
         {
            outputText("[pg-][b:你可以调整你的腐化耐受阈值。]");
            addNextButton("耐受选项",ascToleranceOption).hint("设置是否应用腐化耐受。");
         }
         if(get_player().hasPerk(PerkLib.Battlemage))
         {
            outputText("[pg-][b:你可以设置是否在战斗开始时自动施放力量。]");
            addNextButton("力量选项",mightOption).hint("设置是否自动施放力量。");
         }
         if(get_player().hasPerk(PerkLib.Spellsword))
         {
            _loc7_ = get_player().masteryLevel(MasteryLib.TerrestrialFire) >= 2;
            outputText("[pg-][b:你可以设置是否在战斗开始时自动施放武器充能" + (_loc7_ ? "或引燃" : "") + "。]");
            addNextButton("充能选项",chargeOption).hint("设置是否自动施放武器充能" + (_loc7_ ? "或引燃" : "") + "。");
         }
         if(get_player().hasPerk(PerkLib.TransformationResistance))
         {
            outputText("[pg-][b:你可以启用或禁用你的变形抗性。]");
            addNextButton("变形抗性",tfResistOption).hint("选择是否抵抗变形并避免坏结局。");
         }
      }
      
      public function displayMastery() : void
      {
         var displayCategory:Function;
         var _gthis:PlayerInfo = this;
         spriteSelect(null);
         imageSelect(null);
         clearOutput();
         displayHeader("精通");
         displayCategory = function(param1:String, param2:Array):void
         {
            var _loc3_:* = null as MasteryType;
            var _loc7_:int = 0;
            var _loc8_:* = null as String;
            var _loc4_:StatSection = new StatSection(param1);
            var _loc5_:int = 0;
            var _loc6_:int = int(param2.length);
            while(_loc5_ < _loc6_)
            {
               _loc7_ = _loc5_++;
               _loc3_ = param2[_loc7_];
               if(_gthis.get_player().hasMastery(_loc3_))
               {
                  _loc8_ = "" + _gthis.get_player().masteryLevel(_loc3_) + " / " + _loc3_.get_maxLevel();
                  if(_gthis.get_player().masteryLevel(_loc3_) == _loc3_.get_maxLevel())
                  {
                     _loc8_ += " (满级)";
                  }
                  else
                  {
                     _loc8_ += " (经验: " + _gthis.get_player().masteryXP(_loc3_) + " / " + _gthis.get_player().masteryMaxXP(_loc3_) + ")";
                  }
                  _loc4_.addStat(_loc3_.get_name(),_loc8_);
               }
            }
            _loc4_.display();
         };
         displayCategory("通用精通",MasteryLib.MASTERY_GENERAL);
         displayCategory("武器精通",MasteryLib.MASTERY_WEAPONS);
         displayCategory("制造精通",MasteryLib.MASTERY_CRAFTING);
         menu();
         if(get_player().canBuyStats())
         {
            addButton(0,"属性提升",initAttributeMenu);
         }
         else
         {
            addButton(0,"属性",displayStats);
         }
         addButtonDisabled(1,"精通");
         addButton(14,"返回",get_returnMenu());
      }
      
      public function displayAttackDamageSummary() : void
      {
         outputText("[b:基础属性:] " + get_combat().totalStatBonus(true,false) + (get_player().hasPerk(PerkLib.DoubleAttack) ? " (双重攻击为 " + get_combat().totalStatBonus(true,true) + ")" : ""));
         outputText("[pg-][bu:计算得出的武器伤害:] " + get_player().get_weaponAttack());
         outputText("[pg-]\t[b:武器伤害 (基础):] " + get_player().get_weapon().get_attack());
         outputText("[pg-]\t[b:精通特质:] " + 2 * get_player().get_weapon().masteryLevel());
         var _loc1_:String = get_player().getBonusStatSummary("武器伤害","\t\t");
         if(_loc1_ != "")
         {
            _loc1_ = "[pg-]\t[bu:武器伤害特质:]" + _loc1_;
         }
         var _loc2_:String = get_player().getBonusStatSummary("攻击伤害","\t");
         if(_loc2_ != "")
         {
            _loc2_ = "[pg-][bu: 攻击伤害特质:]" + _loc2_;
         }
         var _loc3_:String = "";
         if(get_player().get_weapon().isUnarmed())
         {
            _loc3_ = get_player().getBonusStatSummary("肉体伤害","\t");
            if(_loc3_ != "")
            {
               _loc3_ = "[pg-][bu: 身体伤害特质 (徒手):]" + _loc3_;
            }
         }
         var _loc4_:String = get_player().getBonusStatSummary("物理伤害","\t");
         if(_loc4_ != "")
         {
            _loc4_ = "[pg-][bu: 物理伤害特质:]" + _loc4_;
         }
         var _loc5_:String = get_player().getBonusStatSummary("全局伤害","\t");
         if(_loc5_ != "")
         {
            _loc5_ = "[pg-][bu: 全局伤害特质:]" + _loc5_;
         }
         outputText(_loc1_ + _loc2_ + _loc3_ + _loc4_ + _loc5_);
         doNext(displayStats);
      }
      
      public function displayArmorSummary() : void
      {
         outputText("[b:" + get_player().get_armor().get_tooltipHeader() + ":] " + get_player().get_armor().get_def());
         outputText("[pg-][b:" + get_player().get_upperGarment().get_tooltipHeader() + ":] " + get_player().get_upperGarment().get_armorDef());
         outputText("[pg-][b:" + get_player().get_lowerGarment().get_tooltipHeader() + ":] " + get_player().get_lowerGarment().get_armorDef());
         outputText("[pg-][b:杂项:] " + get_player().armorMiscBonuses());
         outputText(get_player().getBonusStatSummary("护甲"));
      }
      
      public function clearListener() : void
      {
         get_mainView().stage.removeEventListener(TextEvent.LINK,perkLinkHandler);
      }
      
      public function cleanUpStats(param1:Function) : void
      {
         get_mainView().stage.removeEventListener(TextEvent.LINK,displayStatSummary);
         param1();
      }
      
      public function chargeOption() : void
      {
         var choice1:int;
         var _g1:PlayerInfo;
         var choice:int;
         var _g:PlayerInfo;
         clearOutput();
         var _loc1_:Boolean = get_player().perkv1(PerkLib.Spellsword) == 0;
         var _loc2_:Boolean = get_player().masteryLevel(MasteryLib.TerrestrialFire) >= 2;
         outputText("当启用魔剑士时，战斗开始时将自动施放武器充能" + (_loc2_ ? "或引燃" : "") + "。");
         outputText("[pg]魔剑士目前已[b:" + (_loc1_ ? "启用" : "禁用") + "]。");
         menu();
         _g = this;
         choice = 0;
         addNextButton("启用",function():void
         {
            _g.setCharge(choice);
         }).disableIf(_loc1_,"该特质已启用。");
         _g1 = this;
         choice1 = 1;
         addNextButton("禁用",function():void
         {
            _g1.setCharge(choice1);
         }).disableIf(!_loc1_,"该特质已禁用。");
         addButton(14,"返回",displayPerks);
      }
      
      public function attributeMenu() : void
      {
         var _loc5_:* = null as String;
         var _loc6_:* = null as String;
         var _loc7_:int = 0;
         var _loc8_:* = null as StringMap;
         var _loc9_:Boolean = false;
         var _loc10_:* = null as StringMap;
         var _loc11_:* = null as Object;
         var _loc12_:* = null as StringMap;
         var _loc13_:* = null as String;
         var _loc14_:* = null as CoCButton;
         var _loc1_:IMap = new StringMap();
         if("str" in StringMap.reserved)
         {
            _loc1_.setReserved("str","力量");
         }
         else
         {
            _loc1_.h["str"] = "力量";
         }
         if("tou" in StringMap.reserved)
         {
            _loc1_.setReserved("tou","体质");
         }
         else
         {
            _loc1_.h["tou"] = "体质";
         }
         if("spe" in StringMap.reserved)
         {
            _loc1_.setReserved("spe","速度");
         }
         else
         {
            _loc1_.h["spe"] = "速度";
         }
         if("int" in StringMap.reserved)
         {
            _loc1_.setReserved("int","智力");
         }
         else
         {
            _loc1_.h["int"] = "智力";
         }
         var _loc2_:IMap = _loc1_;
         clearOutput();
         outputText("你还有[b:" + tempStatPoints + "]点属性点可以分配。[pg]");
         menu();
         var _loc3_:int = 0;
         var _loc4_:Array = ["str","tou","spe","int"];
         while(_loc3_ < int(_loc4_.length))
         {
            _loc5_ = _loc4_[_loc3_];
            _loc3_++;
            _loc6_ = _loc5_ in StringMap.reserved ? _loc2_.getReserved(_loc5_) : _loc2_.h[_loc5_];
            _loc7_ = int(Math.floor(get_player().getStatByString(_loc5_)));
            _loc8_ = tempStat;
            _loc9_ = int(_loc7_ + (_loc5_ in StringMap.reserved ? _loc8_.getReserved(_loc5_) : _loc8_.h[_loc5_])) >= get_player().getMaxStats(_loc5_);
            outputText("[pg-]" + _loc6_ + ": ");
            if(_loc7_ < get_player().getMaxStats(_loc5_))
            {
               _loc10_ = tempStat;
               _loc11_ = _loc5_ in StringMap.reserved ? _loc10_.getReserved(_loc5_) : _loc10_.h[_loc5_];
               _loc12_ = tempStat;
               outputText("" + _loc7_ + " + [b:" + _loc11_ + "] -> " + (int(_loc7_ + (_loc5_ in StringMap.reserved ? _loc12_.getReserved(_loc5_) : _loc12_.h[_loc5_]))));
            }
            else
            {
               outputText("" + _loc7_ + " (最大值)");
            }
            _loc13_ = Utils.cnName(_loc5_.toUpperCase());
            addRowButton(0,"增加" + _loc13_,(function(param1:Array, param2:Array):Function
            {
               var _g:Array = param1;
               var attribute:Array = param2;
               return function():void
               {
                  _g[0].addAttribute(attribute[0]);
               };
            })([this],[_loc5_])).hint("增加 1 点" + _loc6_ + "。[pg]Shift-点击增加全部。","增加" + _loc6_).disableIf(_loc9_,"你的 " + _loc6_ + " 已达到最大值。").disableIf(tempStatPoints <= 0,"你没有更多的属性点可分配了。");
            _loc14_ = addRowButton(1,"减少" + _loc13_,(function(param1:Array, param2:Array):Function
            {
               var _g:Array = param1;
               var attribute:Array = param2;
               return function():void
               {
                  _g[0].subtractAttribute(attribute[0]);
               };
            })([this],[_loc5_])).hint("减少 1 点" + _loc6_ + "。[pg]Shift-点击减少全部。","减少" + _loc6_);
            _loc10_ = tempStat;
            _loc14_.disableIf((_loc5_ in StringMap.reserved ? _loc10_.getReserved(_loc5_) : _loc10_.h[_loc5_]) <= 0,"你还没有在" + _loc6_ + "上分配任何点数。");
         }
         addButton(4,"重置",initAttributeMenu);
         addButton(9,"确定",finishAttributes);
      }
      
      public function ascToleranceOption() : void
      {
         var choice1:int;
         var _g1:PlayerInfo;
         var choice:int;
         var _g:PlayerInfo;
         clearOutput();
         var _loc1_:Boolean = get_player().perkv2(PerkLib.AscensionTolerance) == 0;
         var _loc2_:int = int(Math.floor(get_player().perkv1(PerkLib.AscensionTolerance) * 5));
         outputText("当启用腐化耐受时，在大多数腐化事件中，腐化阈值将被调整 " + _loc2_ + "。");
         outputText("[pg]腐化耐受当前已[b:" + (_loc1_ ? "启用" : "禁用") + "]。");
         if(_loc1_)
         {
            outputText("[pg][b:禁用此功能后，一些营地追随者可能会立即离开你。请提前保存！]");
         }
         menu();
         _g = this;
         choice = 0;
         addNextButton("启用",function():void
         {
            _g.setTolerance(choice);
         }).disableIf(_loc1_,"该特质已启用。");
         _g1 = this;
         choice1 = 1;
         addNextButton("禁用",function():void
         {
            _g1.setTolerance(choice1);
         }).disableIf(!_loc1_,"该特质已被禁用。");
         addButton(14,"返回",displayPerks);
      }
      
      public function applyPerk(param1:PerkType) : void
      {
         clearOutput();
         var _loc2_:Player = get_player();
         --_loc2_.perkPoints;
         var _loc3_:String = Utils.cnName(param1.get_name());
         outputText("[b:已获得 " + _loc3_ + " 特质]！");
         get_player().createPerk(param1,param1.defaultValue1,param1.defaultValue2,param1.defaultValue3,param1.defaultValue4);
         if(param1 == PerkLib.StrongBack2 || param1 == PerkLib.StrongBack)
         {
            get_inventory().unlockSlots();
         }
         if(param1 == PerkLib.Tank2)
         {
            get_player().HPChange(get_player().get_tou(),false);
            statScreenRefresh();
         }
         doNext(get_player().perkPoints > 0 ? perkBuyMenu : get_returnMenu());
      }
      
      public function addAttribute(param1:String) : void
      {
         var _loc2_:int = 0;
         if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,2140) == 1)
         {
            _loc2_ = get_player().getMaxStats(param1) - get_player().getStatByString(param1);
            while(tempStatPoints >= 1 && _loc2_ > increase(param1))
            {
            }
         }
         else
         {
            increase(param1);
         }
         attributeMenu();
      }
   }
}

