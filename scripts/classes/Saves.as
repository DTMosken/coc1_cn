package classes
{
   import classes._FlagDict.FlagDict_Impl_;
   import classes._Saves.StatusConversions;
   import classes._StatusEffect.DataStore;
   import classes.globalFlags.KFLAGS;
   import classes.internals.Utils;
   import classes.items.Armor;
   import classes.items.ArmorLib;
   import classes.items.Equippable;
   import classes.items.Jewelry;
   import classes.items.JewelryLib;
   import classes.items.Shield;
   import classes.items.ShieldLib;
   import classes.items.Undergarment;
   import classes.items.UndergarmentLib;
   import classes.items.Weapon;
   import classes.saves.FileSaver;
   import classes.saves.FileSaverStandalone;
   import classes.saves.SelfSaver;
   import classes.scenes.Inventory;
   import coc.view.ButtonData;
   import coc.view.ButtonDataList;
   import coc.view.CoCButton;
   import coc.view.MainView;
   import coc.view.ThemeLoader;
   import flash.Boot;
   import flash.net.SharedObject;
   import flash.utils.ByteArray;
   import flash.utils.Dictionary;
   import haxe.Exception;
   import haxe.IMap;
   import haxe.Log;
   import haxe.ds.IntMap;
   import haxe.ds.ObjectMap;
   import haxe.ds.StringMap;
   import haxe.iterators.MapKeyValueIterator;
   import lime.utils.Log;
   
   public class Saves extends BaseContent
   {
      
      public static var SAVE_FILE_CURRENT_INTEGER_FORMAT_VERSION:int = 817;
      
      public var versionProperties:IMap;
      
      public var saveFileNames:Array;
      
      public var notes:String;
      
      public var latestSaveTime:Number;
      
      public var latestSaveSlot:int;
      
      public var latestSaveFile:*;
      
      public var gameStateSet:Function;
      
      public var gameStateGet:Function;
      
      public var fileSaver:FileSaver;
      
      public function Saves(param1:Function = undefined, param2:Function = undefined)
      {
         if(Boot.skip_constructor)
         {
            return;
         }
         latestSaveFile = null;
         latestSaveTime = 0;
         latestSaveSlot = -1;
         notes = "";
         var _loc3_:IMap = new StringMap();
         if("test" in StringMap.reserved)
         {
            _loc3_.setReserved("test",0);
         }
         else
         {
            _loc3_.h["test"] = 0;
         }
         if("legacy" in StringMap.reserved)
         {
            _loc3_.setReserved("legacy",100);
         }
         else
         {
            _loc3_.h["legacy"] = 100;
         }
         if("0.8.3f7" in StringMap.reserved)
         {
            _loc3_.setReserved("0.8.3f7",124);
         }
         else
         {
            _loc3_.h["0.8.3f7"] = 124;
         }
         if("0.8.3f8" in StringMap.reserved)
         {
            _loc3_.setReserved("0.8.3f8",125);
         }
         else
         {
            _loc3_.h["0.8.3f8"] = 125;
         }
         if("0.8.4.3" in StringMap.reserved)
         {
            _loc3_.setReserved("0.8.4.3",119);
         }
         else
         {
            _loc3_.h["0.8.4.3"] = 119;
         }
         if("latest" in StringMap.reserved)
         {
            _loc3_.setReserved("latest",120);
         }
         else
         {
            _loc3_.h["latest"] = 120;
         }
         versionProperties = _loc3_;
         saveFileNames = ["CoC_1","CoC_2","CoC_3","CoC_4","CoC_5","CoC_6","CoC_7","CoC_8","CoC_9","CoC_10","CoC_11","CoC_12","CoC_13","CoC_14"];
         super();
         gameStateGet = param1;
         gameStateSet = param2;
         fileSaver = new FileSaverStandalone();
      }
      
      public function unFuckSave() : void
      {
         var _loc1_:* = null as String;
         var _loc3_:* = null as IMap;
         var _loc8_:* = null as PerkType;
         var _loc9_:int = 0;
         var _loc10_:* = null as PerkType;
         var _loc11_:* = null as PerkType;
         var _loc12_:int = 0;
         if(get_player().wings.type == 9 && get_player().wings.color == "no")
         {
            _loc1_ = get_player().hasFur() ? get_player().skin.furColor : get_player().hair.color;
            get_player().wings.color = _loc1_;
         }
         if(get_player().hasPerk(PerkLib.ElvenBounty))
         {
            if(get_player().perkv1(PerkLib.ElvenBounty) == 15)
            {
               get_player().setPerkValue(PerkLib.ElvenBounty,1,0);
               get_player().addPerkValue(PerkLib.ElvenBounty,2,15);
            }
         }
         while(get_player().hasStatusEffect(StatusEffects.KnockedBack))
         {
            get_player().removeStatusEffect(StatusEffects.KnockedBack);
         }
         get_player().removeStatusEffect(StatusEffects.Tentagrappled);
         if(Boolean(Math.isNaN(get_game().time.minutes)))
         {
            get_game().time.minutes = 0;
         }
         if(Boolean(Math.isNaN(get_game().time.hours)))
         {
            get_game().time.hours = 0;
         }
         if(Boolean(Math.isNaN(get_game().time.days)))
         {
            get_game().time.days = 0;
         }
         if(get_player().get_gems() < 0)
         {
            get_player().set_gems(0);
         }
         if(get_player().hasStatusEffect(StatusEffects.SlimeCraving) && get_player().statusEffectv4(StatusEffects.SlimeCraving) == 1)
         {
            get_player().changeStatusValue(StatusEffects.SlimeCraving,3,get_player().statusEffectv2(StatusEffects.SlimeCraving));
            get_player().changeStatusValue(StatusEffects.SlimeCraving,4,1);
         }
         if(!(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,986) is CockTypesEnum || Std.isOfType(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,986),Number)))
         {
            outputText("\n<b>露比的阴茎类型无效。默认将其设为人类。</b>\n");
            FlagDict_Impl_.arrayWriteInt(KFLAGS.flags,986,0);
         }
         if(!(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,668) is CockTypesEnum || Std.isOfType(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,668),Number)))
         {
            outputText("\n<b>乳胶粘液娘的阴茎类型无效。默认将其设为人类。</b>\n");
            FlagDict_Impl_.arrayWriteInt(KFLAGS.flags,668,0);
         }
         var _loc2_:Array = FlagDict_Impl_.arrayReadString(KFLAGS.flags,1217).split("^");
         if(int(_loc2_.length) < 7 && FlagDict_Impl_.arrayReadString(KFLAGS.flags,1217) != "")
         {
            get_game().telAdre.katherine.get_breasts().set_lactationLevel(0);
         }
         if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,1238) < 816)
         {
            if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,41) > 0)
            {
               if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,1195) != 0)
               {
                  return;
               }
               FlagDict_Impl_.arrayWriteInt(KFLAGS.flags,1195,25);
            }
            if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,630) > 0)
            {
               if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,1196) != 0)
               {
                  return;
               }
               if(get_player().hasPerk(PerkLib.SpiderOvipositor))
               {
                  FlagDict_Impl_.arrayWriteInt(KFLAGS.flags,1196,15);
               }
               else
               {
                  FlagDict_Impl_.arrayWriteInt(KFLAGS.flags,1196,26);
               }
            }
            if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,673) > 0)
            {
               if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,674) != 0)
               {
                  return;
               }
               FlagDict_Impl_.arrayWriteInt(KFLAGS.flags,674,25);
            }
            if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,553) > 0)
            {
               if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,1208) != 0)
               {
                  return;
               }
               FlagDict_Impl_.arrayWriteInt(KFLAGS.flags,1208,25);
            }
            if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,271) > 0)
            {
               if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,1197) != 0)
               {
                  return;
               }
               FlagDict_Impl_.arrayWriteInt(KFLAGS.flags,1197,25);
            }
            if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,960) > 0)
            {
               get_game().helScene.pregnancy.knockUpForce();
            }
            else if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,967) > 0)
            {
               if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,968) > 3)
               {
                  return;
               }
               FlagDict_Impl_.arrayWriteInt(KFLAGS.flags,968,65536 * FlagDict_Impl_.arrayReadInt(KFLAGS.flags,968) + 25);
            }
            if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,905) > 0)
            {
               if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,1212) != 0)
               {
                  return;
               }
               FlagDict_Impl_.arrayWriteInt(KFLAGS.flags,1212,25);
            }
            if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,2) == 25)
            {
               return;
            }
            if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,2) == 5)
            {
               return;
            }
            if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,2) == 1)
            {
               FlagDict_Impl_.arrayWriteInt(KFLAGS.flags,2,25);
            }
            if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,2) == 2)
            {
               FlagDict_Impl_.arrayWriteInt(KFLAGS.flags,2,5);
            }
            if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,891) > 0)
            {
               if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,1198) != 0)
               {
                  return;
               }
               FlagDict_Impl_.arrayWriteInt(KFLAGS.flags,1198,15);
               _loc3_ = KFLAGS.flags;
               FlagDict_Impl_.arrayWriteInt(_loc3_,891,FlagDict_Impl_.arrayReadInt(_loc3_,891) * 24);
            }
            if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,762) > 0)
            {
               if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,1211) != 0)
               {
                  return;
               }
               FlagDict_Impl_.arrayWriteInt(KFLAGS.flags,1211,25);
               if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,762) >= 4)
               {
                  FlagDict_Impl_.arrayWriteInt(KFLAGS.flags,762,0);
               }
               else
               {
                  FlagDict_Impl_.arrayWriteInt(KFLAGS.flags,762,24 * (4 - FlagDict_Impl_.arrayReadInt(KFLAGS.flags,762)));
               }
            }
            if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,93) != 0 && FlagDict_Impl_.arrayReadInt(KFLAGS.flags,738) != 0)
            {
               return;
            }
            if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,93) > 0 && FlagDict_Impl_.arrayReadInt(KFLAGS.flags,738) == 0)
            {
               FlagDict_Impl_.arrayWriteInt(KFLAGS.flags,738,FlagDict_Impl_.arrayReadInt(KFLAGS.flags,93));
               FlagDict_Impl_.arrayWriteInt(KFLAGS.flags,93,25);
            }
            else if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,93) == 0 && FlagDict_Impl_.arrayReadInt(KFLAGS.flags,738) > 0)
            {
               FlagDict_Impl_.arrayWriteInt(KFLAGS.flags,93,25);
            }
            if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,1205) != 0)
            {
               return;
            }
            if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,57) > 0)
            {
               FlagDict_Impl_.arrayWriteInt(KFLAGS.flags,1205,25);
               _loc3_ = KFLAGS.flags;
               FlagDict_Impl_.arrayWriteInt(_loc3_,57,FlagDict_Impl_.arrayReadInt(_loc3_,57) * 24);
               FlagDict_Impl_.arrayWriteInt(KFLAGS.flags,1206,int(get_player().statusEffectv3(StatusEffects.Tamani)));
            }
            if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,1199) != 0)
            {
               return;
            }
            if(get_player().hasStatusEffect(StatusEffects.Tamani))
            {
               if(get_player().statusEffectv1(StatusEffects.Tamani) == -500)
               {
                  FlagDict_Impl_.arrayWriteInt(KFLAGS.flags,1200,0);
                  FlagDict_Impl_.arrayWriteInt(KFLAGS.flags,1203,1);
               }
               else
               {
                  FlagDict_Impl_.arrayWriteInt(KFLAGS.flags,1200,int(get_player().statusEffectv1(StatusEffects.Tamani) * 24));
               }
               FlagDict_Impl_.arrayWriteInt(KFLAGS.flags,1204,int(get_player().statusEffectv2(StatusEffects.Tamani)));
               FlagDict_Impl_.arrayWriteInt(KFLAGS.flags,1201,int(get_player().statusEffectv3(StatusEffects.Tamani)));
               FlagDict_Impl_.arrayWriteInt(KFLAGS.flags,1202,int(get_player().statusEffectv4(StatusEffects.Tamani)));
               if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,1200) > 0)
               {
                  FlagDict_Impl_.arrayWriteInt(KFLAGS.flags,1199,25);
               }
               get_player().removeStatusEffect(StatusEffects.Tamani);
            }
            if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,589) == 26 || FlagDict_Impl_.arrayReadInt(KFLAGS.flags,589) == 15)
            {
               return;
            }
            if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,589) > 0)
            {
               if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,589) == 1)
               {
                  FlagDict_Impl_.arrayWriteInt(KFLAGS.flags,589,26);
               }
               else
               {
                  FlagDict_Impl_.arrayWriteInt(KFLAGS.flags,589,15);
               }
               FlagDict_Impl_.arrayWriteInt(KFLAGS.flags,588,24 * (8 - FlagDict_Impl_.arrayReadInt(KFLAGS.flags,588)));
            }
            switch(get_player().get_buttPregnancyType())
            {
               case 2:
                  get_player().buttKnockUpForce(26,get_player().get_buttPregnancyIncubation());
                  break;
               case 3:
                  get_player().buttKnockUpForce(15,get_player().get_buttPregnancyIncubation());
                  break;
               case 4:
                  get_player().buttKnockUpForce(27,get_player().get_buttPregnancyIncubation());
                  break;
               case 5:
                  get_player().buttKnockUpForce(28,get_player().get_buttPregnancyIncubation());
                  break;
               case 15:
               case 26:
               case 27:
               case 28:
                  return;
            }
            if(FlagDict_Impl_.arrayReadString(KFLAGS.flags,1217) != "")
            {
               return;
            }
            if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,400) != 0)
            {
               FlagDict_Impl_.arrayWriteInt(KFLAGS.flags,402,1);
               FlagDict_Impl_.arrayWriteString(KFLAGS.flags,1223,"neon pink");
               FlagDict_Impl_.arrayWriteInt(KFLAGS.flags,1218,200);
            }
            if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,586) == 26)
            {
               return;
            }
            if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,586) == 15)
            {
               return;
            }
            if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,586) == 25)
            {
               return;
            }
            if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,586) > 0)
            {
               FlagDict_Impl_.arrayWriteInt(KFLAGS.flags,789,FlagDict_Impl_.arrayReadInt(KFLAGS.flags,586));
               if(get_player().hasPerk(PerkLib.SpiderOvipositor))
               {
                  FlagDict_Impl_.arrayWriteInt(KFLAGS.flags,586,15);
               }
               else
               {
                  FlagDict_Impl_.arrayWriteInt(KFLAGS.flags,586,26);
               }
            }
            else if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,789) > 0)
            {
               FlagDict_Impl_.arrayWriteInt(KFLAGS.flags,586,25);
               FlagDict_Impl_.arrayWriteInt(KFLAGS.flags,789,384 - FlagDict_Impl_.arrayReadInt(KFLAGS.flags,789));
            }
            if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,722) > 0 && FlagDict_Impl_.arrayReadInt(KFLAGS.flags,68) == 0)
            {
               if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,68) > 0)
               {
                  FlagDict_Impl_.arrayWriteInt(KFLAGS.flags,723,25);
               }
               FlagDict_Impl_.arrayWriteInt(KFLAGS.flags,724,FlagDict_Impl_.arrayReadInt(KFLAGS.flags,68));
               FlagDict_Impl_.arrayWriteInt(KFLAGS.flags,68,FlagDict_Impl_.arrayReadInt(KFLAGS.flags,722));
               FlagDict_Impl_.arrayWriteInt(KFLAGS.flags,722,31);
            }
            else if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,68) > 0 && FlagDict_Impl_.arrayReadInt(KFLAGS.flags,722) == 0)
            {
               FlagDict_Impl_.arrayWriteInt(KFLAGS.flags,722,25);
            }
         }
         if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,1272) > 0 && FlagDict_Impl_.arrayReadInt(KFLAGS.flags,1243) == 0)
         {
            FlagDict_Impl_.arrayWriteInt(KFLAGS.flags,1243,1);
         }
         while(int(get_inventory().gearStorage.length) < 45)
         {
            get_inventory().gearStorage.push(new ItemSlot());
         }
         if(get_player().hasKeyItem("Laybans"))
         {
            FlagDict_Impl_.arrayWriteInt(KFLAGS.flags,1242,1);
         }
         _loc3_ = new ObjectMap();
         _loc3_[PerkLib.AscensionDesires] = 10;
         _loc3_[PerkLib.AscensionEndurance] = 10;
         _loc3_[PerkLib.AscensionFertility] = 15;
         _loc3_[PerkLib.AscensionMoralShifter] = 10;
         _loc3_[PerkLib.AscensionMysticality] = 10;
         _loc3_[PerkLib.AscensionTolerance] = 20;
         _loc3_[PerkLib.AscensionVirility] = 15;
         _loc3_[PerkLib.AscensionWisdom] = 5;
         var _loc4_:IMap = _loc3_;
         var _loc5_:IMap = _loc4_;
         var _loc6_:IMap = _loc5_;
         var _loc7_:* = _loc5_.keys();
         while(Boolean(_loc7_.hasNext()))
         {
            _loc8_ = _loc7_.next();
            _loc9_ = int(_loc6_.get(_loc8_));
            _loc10_ = _loc8_;
            _loc11_ = _loc10_;
            _loc12_ = _loc9_;
            if(get_player().hasPerk(_loc11_))
            {
               get_player().setPerkValue(_loc11_,1,Math.min(get_player().perkv1(_loc11_),_loc12_));
            }
         }
         if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,2066) == 0 || FlagDict_Impl_.arrayReadInt(KFLAGS.flags,2999) == 3)
         {
            FlagDict_Impl_.arrayWriteInt(KFLAGS.flags,2999,0);
         }
         FlagDict_Impl_.arrayWriteInt(KFLAGS.flags,2140,0);
      }
      
      public function selectSaveButton(param1:String, param2:int) : void
      {
         haxe.Log.trace("Saving game with name",{
            "fileName":"src/classes/Saves.hx",
            "lineNumber":233,
            "className":"classes.Saves",
            "methodName":"selectSaveButton",
            "customParams":[saveFileNames[param2],"at index",param2]
         });
         saveGame(param1,true);
      }
      
      public function selectLoadButton(param1:String, param2:int) : void
      {
         haxe.Log.trace("Loading save with name",{
            "fileName":"src/classes/Saves.hx",
            "lineNumber":203,
            "className":"classes.Saves",
            "methodName":"selectLoadButton",
            "customParams":[saveFileNames[param2],"at index",param2]
         });
         loadGame(param1);
      }
      
      public function saveToFile() : void
      {
         clearOutput();
         saveGameObject("文件",true);
      }
      
      public function saveScreen() : void
      {
         clearOutput();
         if(get_hardcore())
         {
            saveGame(get_hardcoreSlot());
            outputText("[pg]你不能复制硬核模式的存档文件！你当前的进度已保存。");
            doNext(playerMenu);
            return;
         }
         promptInput({
            "x":210,
            "y":620,
            "width":550,
            "maxChars":54
         });
         displayLastSaveHeader();
         outputText("[pg]如果你不想更改备注，请将底部的备注框留空。");
         displaySlotsHeader();
         var _loc1_:ButtonDataList = displaySaveFiles(selectSaveButton);
         _loc1_.submenu(saveLoad,false,_loc1_.page);
      }
      
      public function savePermObject() : void
      {
         var _loc3_:* = null;
         var _loc4_:* = null;
         var _loc5_:* = null;
         var _loc6_:int = 0;
         var _loc7_:Boolean = false;
         var _loc8_:* = null as Exception;
         var _loc2_:SharedObject = SharedObject.getLocal("CoC_Main","/");
         _loc2_.data.exists = true;
         _loc2_.data.version = "hgg 1.7.0";
         try
         {
            _loc2_.data.flags = null;
            _loc3_ = {};
            _loc4_ = new MapKeyValueIterator(get_achievements());
            while(Boolean(_loc4_.hasNext()))
            {
               _loc5_ = _loc4_.next();
               _loc6_ = int(_loc5_.key);
               _loc7_ = Boolean(_loc5_.value);
               if(_loc7_)
               {
                  _loc3_[Std.string(_loc6_)] = 1;
               }
            }
            _loc2_.data.achievements = _loc3_;
            if(get_game().permObjVersionID != 0)
            {
               _loc2_.data.permObjVersionID = get_game().permObjVersionID;
            }
            _loc2_.data.selfSaving = SelfSaver.save(true);
            _loc2_.data.controls = get_game().inputManager.SaveBindsToObj();
            _loc2_.flush();
         }
         catch(_loc_e_:*)
         {
            return;
         }
      }
      
      public function saveLoad() : void
      {
         var gameOver:Boolean;
         var _gthis:Saves = this;
         get_game().mainMenu.hideMainMenu();
         get_mainView().eventTestInput.x = -10207.5;
         get_mainView().eventTestInput.y = -1055.1;
         gameOver = get_player().gameOver || get_mainView().getButtonText(0) == "游戏结束";
         var _loc1_:Boolean = get_player().loaded && !gameOver;
         clearOutput();
         outputText("<font color=\"" + get_mainViewManager().colorHpMinus() + "\">\n<font size=\"22\">[b:如果你想让游戏正常运行，请记住使用 Flash 播放器来玩。]</font></font>\n");
         outputText("通过浏览器游玩很容易导致许多不同的问题。请使用 Adobe 官方的 Flash 播放器，否则你很可能会遇到 bug。[pg]");
         outputText("<b>我的存档在哪里？</b>\n");
         outputText("在 Windows Vista/7 中：<pre>Users/{username}/Appdata/Roaming/Macromedia/Flash Player/#Shared Objects/{GIBBERISH}/</pre>[pg]");
         outputText("在该文件夹中，它们将保存在与游戏运行位置相对应的文件夹里。如果你将 .swf 文件保存到了硬盘（要玩这个版本你就必须这么做），那么它们会在一个名为 localhost 的文件夹中。[pg]");
         outputText("存档文件将被命名为CoC_1.sol、CoC_2.sol、CoC_3.sol 等。[pg]");
         outputText("<b>为什么我的存档总是消失？</b>\n");
         outputText("有很多情况会清除 Flash 本地共享文件。如果你的浏览器或播放器设置为删除 Flash cookie 或数据，就会发生这种情况。CCleaner也会删除它们。CoC或其更新永远不会删除你的游戏存档——如果存档消失了，那肯定是其他东西把存档清除了。[pg]");
         menu();
         addButton(0,"保存",saveScreen).disableIf(!_loc1_);
         addButton(1,"读取",loadScreen);
         addButton(2,"删除",deleteScreen);
         addButton(3,"自动保存：" + (get_player().autoSave ? "开" : "关"),autosaveToggle).hideIf(!get_player().loaded);
         addButton(5,"保存到文件",saveToFile).disableIf(!_loc1_).disableIf(get_hardcore(),"硬核模式下不允许此操作。");
         addButton(6,"读取文件",loadFromFile);
         addButton(14,"返回",function():void
         {
            if(gameOver)
            {
               _gthis.get_game().gameOver(true);
            }
            else if(int(_gthis.gameStateGet()) == 3 || !_gthis.get_player().loaded)
            {
               _gthis.get_game().mainMenu.mainMenu();
            }
            else
            {
               _gthis.playerMenu();
            }
         });
      }
      
      public function saveGameObject(param1:String, param2:Boolean, param3:Boolean = false) : void
      {
         var slot1:String;
         var _g:Saves;
         var _loc5_:* = null as SharedObject;
         var _loc6_:* = null as SharedObject;
         var _loc9_:* = null;
         var _loc10_:* = null;
         var _loc11_:* = null;
         var _loc12_:int = 0;
         var _loc13_:* = null;
         var _loc14_:* = null as Array;
         var _loc15_:* = null as Array;
         var _loc16_:* = null as Cock;
         var _loc17_:* = null as Array;
         var _loc18_:* = null as Vagina;
         var _loc19_:* = null as Array;
         var _loc20_:* = null as BreastRow;
         var _loc21_:* = null as Array;
         var _loc22_:* = null as Perk;
         var _loc23_:* = null as Array;
         var _loc24_:int = 0;
         var _loc25_:* = null as Array;
         var _loc26_:* = null as Mastery;
         var _loc27_:* = null as Array;
         var _loc28_:* = null as StatusEffect;
         var _loc29_:* = null as Array;
         var _loc30_:int = 0;
         var _loc31_:* = null as Array;
         var _loc32_:* = null as KeyItem;
         var _loc33_:* = null as Array;
         var _loc34_:int = 0;
         var _loc35_:* = null as Array;
         var _loc36_:* = null as ItemSlot;
         var _loc37_:* = null as Array;
         var _loc38_:int = 0;
         var _loc39_:* = null as Array;
         var _loc40_:int = 0;
         var _loc41_:int = 0;
         var _loc42_:* = null as Array;
         var _loc43_:int = 0;
         var _loc44_:* = null as Array;
         var _loc45_:* = null as ItemType;
         var _loc46_:* = null as Error;
         var _loc48_:* = null as ByteArray;
         var _loc49_:* = null as Function;
         var _loc50_:* = null as String;
         var _loc51_:* = null;
         var _loc52_:* = null as String;
         var _loc53_:* = null as String;
         var _loc54_:* = null;
         var _loc55_:* = null;
         var _loc56_:* = null as StringMap;
         var _loc57_:* = null as Object;
         if(get_player().slotName != "VOID")
         {
            get_player().slotName = param1;
         }
         CoC.saveAllAwareClasses(get_game());
         if(param2)
         {
            _loc5_ = SharedObject.getLocal("CoC_File","/");
         }
         else
         {
            _loc5_ = SharedObject.getLocal(param1,"/");
         }
         _loc5_.data.exists = true;
         _loc5_.data.version = "hgg 1.7.0";
         FlagDict_Impl_.arrayWriteInt(KFLAGS.flags,1238,817);
         var _loc7_:Number = Date.now().getTime();
         _loc5_.data.saveTime = _loc7_;
         if(param2)
         {
            get_miscSettings().lastFileSaveTime = _loc7_;
         }
         _loc5_.data.short = get_player().get_short();
         _loc5_.data.a = get_player().get_a();
         var _loc8_:String = get_game().getInput();
         if(param3 && _loc8_ != "")
         {
            _loc5_.data.notes = _loc8_;
            notes = _loc8_;
         }
         else
         {
            _loc5_.data.notes = notes;
         }
         if(get_hardcore())
         {
            _loc5_.data.notes = "<font color=\"#ff0000\">硬核模式</font>";
         }
         try
         {
            _loc9_ = {};
            _loc10_ = new MapKeyValueIterator(KFLAGS.flags);
            while(Boolean(_loc10_.hasNext()))
            {
               _loc11_ = _loc10_.next();
               _loc12_ = int(_loc11_.key);
               _loc13_ = _loc11_.value;
               _loc9_[Std.string(_loc12_)] = _loc13_;
            }
            _loc5_.data.flags = _loc9_;
            _loc5_.data.armor = {};
            _loc5_.data.weapon = {};
            _loc5_.data.jewelry = {};
            _loc5_.data.shield = {};
            _loc5_.data.upperGarment = {};
            _loc5_.data.lowerGarment = {};
            _loc5_.data.armor.id = get_player().get_armor().get_id();
            _loc5_.data.weapon.id = get_player().get_weapon().get_id();
            _loc5_.data.jewelry.id = get_player().get_jewelry().get_id();
            _loc5_.data.shield.id = get_player().get_shield().get_id();
            _loc5_.data.upperGarment.id = get_player().get_upperGarment().get_id();
            _loc5_.data.lowerGarment.id = get_player().get_lowerGarment().get_id();
            _loc5_.data.previouslyWornClothes = get_player().previouslyWornClothes;
            _loc5_.data.armorName = get_player().get_modArmorName();
            _loc5_.data.nipplesPierced = get_player().nipplesPierced;
            _loc5_.data.nipplesPShort = get_player().nipplesPShort;
            _loc5_.data.nipplesPLong = get_player().nipplesPLong;
            _loc5_.data.lipPierced = get_player().lipPierced;
            _loc5_.data.lipPShort = get_player().lipPShort;
            _loc5_.data.lipPLong = get_player().lipPLong;
            _loc5_.data.tonguePierced = get_player().tonguePierced;
            _loc5_.data.tonguePShort = get_player().tonguePShort;
            _loc5_.data.tonguePLong = get_player().tonguePLong;
            _loc5_.data.eyebrowPierced = get_player().eyebrowPierced;
            _loc5_.data.eyebrowPShort = get_player().eyebrowPShort;
            _loc5_.data.eyebrowPLong = get_player().eyebrowPLong;
            _loc5_.data.earsPierced = get_player().earsPierced;
            _loc5_.data.earsPShort = get_player().earsPShort;
            _loc5_.data.earsPLong = get_player().earsPLong;
            _loc5_.data.nosePierced = get_player().nosePierced;
            _loc5_.data.nosePShort = get_player().nosePShort;
            _loc5_.data.nosePLong = get_player().nosePLong;
            _loc5_.data.str = get_player().get_str();
            _loc5_.data.tou = get_player().get_tou();
            _loc5_.data.spe = get_player().get_spe();
            _loc5_.data.inte = get_player().get_inte();
            _loc5_.data.lib = get_player().lib;
            _loc5_.data.sens = get_player().sens;
            _loc5_.data.cor = get_player().cor;
            _loc5_.data.fatigue = get_player().get_fatigue();
            _loc5_.data.HP = get_player().get_HP();
            _loc5_.data.lust = get_player().get_lust();
            _loc5_.data.hunger = get_player().hunger;
            _loc5_.data.XP = get_player().XP;
            _loc5_.data.level = get_player().level;
            _loc5_.data.gems = get_player().get_gems();
            _loc5_.data.perkPoints = get_player().perkPoints;
            _loc5_.data.statPoints = get_player().statPoints;
            _loc5_.data.ascensionPerkPoints = get_player().ascensionPerkPoints;
            _loc5_.data.age = get_player().age;
            _loc5_.data.startingAge = get_player().startingAge;
            _loc5_.data.startingRace = get_player().startingRace;
            _loc5_.data.lostVirginity = get_player().lostVirginity;
            _loc5_.data.femininity = get_player().get_femininity();
            _loc5_.data.thickness = get_player().thickness;
            _loc5_.data.tone = get_player().tone;
            _loc5_.data.tallness = get_player().get_tallness();
            _loc5_.data.furColor = get_player().skin.furColor;
            _loc5_.data.hairColor = get_player().hair.color;
            _loc5_.data.hairType = get_player().hair.type;
            _loc5_.data.hairAdj = get_player().hair.adj;
            _loc5_.data.hairFlowerColor = get_player().hair.flowerColor;
            _loc5_.data.gillType = get_player().gills.type;
            _loc5_.data.armType = get_player().arms.type;
            _loc5_.data.hairLength = get_player().hair.length;
            _loc5_.data.beardLength = get_player().beard.length;
            _loc5_.data.eyeType = get_player().eyes.type;
            _loc5_.data.eyeCount = get_player().eyes.count;
            _loc5_.data.beardStyle = get_player().beard.style;
            _loc5_.data.skinType = get_player().skin.type;
            _loc5_.data.skinTone = get_player().skin.tone;
            _loc5_.data.skinDesc = get_player().skin.desc;
            _loc5_.data.skinAdj = get_player().skin.adj;
            _loc5_.data.faceType = get_player().face.type;
            _loc5_.data.tongueType = get_player().tongue.type;
            _loc5_.data.earType = get_player().ears.type;
            _loc5_.data.earValue = get_player().ears.value;
            _loc5_.data.antennae = get_player().antennae.type;
            _loc5_.data.horns = get_player().horns.value;
            _loc5_.data.hornType = get_player().horns.type;
            _loc5_.data.underBody = get_player().underBody.toObject();
            _loc5_.data.neck = get_player().neck.toObject();
            _loc5_.data.rearBody = get_player().rearBody.toObject();
            _loc5_.data.clawTone = get_player().arms.claws.tone;
            _loc5_.data.clawType = get_player().arms.claws.type;
            _loc5_.data.wingType = get_player().wings.type;
            _loc5_.data.wingColor = get_player().wings.color;
            _loc5_.data.wingColor2 = get_player().wings.color2;
            _loc5_.data.lowerBody = get_player().lowerBody.type;
            _loc5_.data.legCount = get_player().lowerBody.legCount;
            _loc5_.data.incorporeal = get_player().lowerBody.incorporeal;
            _loc5_.data.tailType = get_player().tail.type;
            _loc5_.data.tailVenum = get_player().tail.venom;
            _loc5_.data.tailRecharge = get_player().tail.recharge;
            _loc5_.data.hipRating = get_player().hips.rating;
            _loc5_.data.buttRating = get_player().butt.rating;
            _loc5_.data.udder = get_player().udder.toObject();
            _loc5_.data.balls = get_player().balls;
            _loc5_.data.cumMultiplier = get_player().cumMultiplier;
            _loc5_.data.ballSize = get_player().ballSize;
            _loc5_.data.hoursSinceCum = get_player().get_hoursSinceCum();
            _loc5_.data.fertility = get_player().fertility;
            _loc5_.data.sexOrientation = get_player().sexOrientation;
            _loc5_.data.pregnancyIncubation = get_player().get_pregnancyIncubation();
            _loc5_.data.pregnancyType = get_player().get_pregnancyType();
            _loc5_.data.buttPregnancyIncubation = get_player().get_buttPregnancyIncubation();
            _loc5_.data.buttPregnancyType = get_player().get_buttPregnancyType();
            _loc14_ = [];
            _loc12_ = 0;
            _loc15_ = get_player().cocks;
            while(_loc12_ < int(_loc15_.length))
            {
               _loc16_ = _loc15_[_loc12_];
               _loc12_++;
               _loc10_ = {};
               _loc16_.serialize(_loc10_);
               _loc14_.push(_loc10_);
            }
            _loc5_.data.cocks = _loc14_;
            _loc15_ = [];
            _loc12_ = 0;
            _loc17_ = get_player().vaginas;
            while(_loc12_ < int(_loc17_.length))
            {
               _loc18_ = _loc17_[_loc12_];
               _loc12_++;
               _loc10_ = {};
               _loc18_.serialize(_loc10_);
               _loc15_.push(_loc10_);
            }
            _loc5_.data.vaginas = _loc15_;
            _loc5_.data.nippleLength = get_player().nippleLength;
            _loc17_ = [];
            _loc12_ = 0;
            _loc19_ = get_player().breastRows;
            while(_loc12_ < int(_loc19_.length))
            {
               _loc20_ = _loc19_[_loc12_];
               _loc12_++;
               _loc17_.push({
                  "breasts":_loc20_.breasts,
                  "breastRating":_loc20_.breastRating,
                  "nipplesPerBreast":_loc20_.nipplesPerBreast,
                  "lactationMultiplier":_loc20_.lactationMultiplier,
                  "milkFullness":_loc20_.milkFullness,
                  "fuckable":_loc20_.fuckable,
                  "fullness":_loc20_.fullness
               });
            }
            _loc5_.data.breastRows = _loc17_;
            _loc19_ = [];
            _loc12_ = 0;
            _loc21_ = get_player().get_perks();
            while(_loc12_ < int(_loc21_.length))
            {
               _loc22_ = _loc21_[_loc12_];
               _loc12_++;
               _loc19_.push({
                  "id":_loc22_.get_ptype().get_id(),
                  "value1":_loc22_.value1,
                  "value2":_loc22_.value2,
                  "value3":_loc22_.value3,
                  "value4":_loc22_.value4
               });
            }
            _loc5_.data.perks = _loc19_;
            _loc23_ = [];
            _loc24_ = 0;
            _loc25_ = get_player().get_masteries();
            while(_loc24_ < int(_loc25_.length))
            {
               _loc26_ = _loc25_[_loc24_];
               _loc24_++;
               _loc23_.push({
                  "id":_loc26_.get_mtype().get_id(),
                  "level":_loc26_.get_level(),
                  "xp":_loc26_.get_xp(),
                  "isPermed":_loc26_.get_isPermed()
               });
            }
            _loc5_.data.masteries = _loc23_;
            _loc25_ = [];
            _loc24_ = 0;
            _loc27_ = get_player().statusEffects;
            while(_loc24_ < int(_loc27_.length))
            {
               _loc28_ = _loc27_[_loc24_];
               _loc24_++;
               _loc25_.push({
                  "statusAffectName":_loc28_.get_stype().get_id(),
                  "value1":_loc28_.value1,
                  "value2":_loc28_.value2,
                  "value3":_loc28_.value3,
                  "value4":_loc28_.value4,
                  "dataStore":_loc28_.dataStore
               });
            }
            _loc5_.data.statusAffects = _loc25_;
            _loc29_ = [];
            _loc30_ = 0;
            _loc31_ = get_player().keyItems;
            while(_loc30_ < int(_loc31_.length))
            {
               _loc32_ = _loc31_[_loc30_];
               _loc30_++;
               _loc29_.push({
                  "keyName":_loc32_.keyName,
                  "value1":_loc32_.value1,
                  "value2":_loc32_.value2,
                  "value3":_loc32_.value3,
                  "value4":_loc32_.value4
               });
            }
            _loc5_.data.keyItems = _loc29_;
            _loc33_ = [];
            _loc34_ = 0;
            _loc35_ = get_inventory().itemStorage;
            while(_loc34_ < int(_loc35_.length))
            {
               _loc36_ = _loc35_[_loc34_];
               _loc34_++;
               _loc33_.push({
                  "id":_loc36_.itype.get_id(),
                  "quantity":_loc36_.quantity,
                  "unlocked":_loc36_.unlocked,
                  "damage":_loc36_.damage
               });
            }
            _loc5_.data.itemStorage = _loc33_;
            _loc37_ = [];
            _loc38_ = 0;
            _loc39_ = get_inventory().gearStorage;
            while(_loc38_ < int(_loc39_.length))
            {
               _loc36_ = _loc39_[_loc38_];
               _loc38_++;
               _loc37_.push({
                  "id":_loc36_.itype.get_id(),
                  "quantity":_loc36_.quantity,
                  "unlocked":_loc36_.unlocked,
                  "damage":_loc36_.damage
               });
            }
            _loc5_.data.gearStorage = _loc37_;
            _loc40_ = get_player().ass.analWetness;
            _loc41_ = get_player().ass.analLooseness;
            _loc5_.data.ass = {
               "analWetness":_loc40_,
               "analLooseness":_loc41_,
               "fullness":get_player().ass.fullness
            };
            _loc5_.data.gameState = int(gameStateGet());
            _loc5_.data.minutes = get_game().time.minutes;
            _loc5_.data.hours = get_game().time.hours;
            _loc5_.data.days = get_game().time.days;
            _loc5_.data.autoSave = get_player().autoSave;
            _loc5_.data.isabellaOffspringData = get_game().isabellaScene.isabellaOffspringData.copy();
            _loc42_ = [];
            _loc43_ = 0;
            _loc44_ = get_player().itemSlots;
            while(_loc43_ < int(_loc44_.length))
            {
               _loc36_ = _loc44_[_loc43_];
               _loc43_++;
               _loc45_ = _loc36_.itype;
               _loc42_.push({
                  "id":(_loc45_ != null ? _loc45_.get_id() : null),
                  "quantity":_loc36_.quantity,
                  "unlocked":_loc36_.unlocked,
                  "damage":_loc36_.damage
               });
            }
            _loc5_.data.items = _loc42_;
            _loc5_.data.selfSaving = SelfSaver.save();
         }
         catch(_loc_e_:Error)
         {
            _loc46_ = _loc_e_;
            outputText("保存时发生处理错误。请报告以下信息：\n\n");
            outputText(_loc46_.message + "\n\n" + _loc46_.getStackTrace());
            doNext(playerMenu);
            return;
         }
         var _loc47_:Boolean = false;
         if(param2)
         {
            _loc48_ = new ByteArray();
            _loc48_.writeObject({"data":_loc5_.data});
            _loc5_.clear();
            _g = this;
            slot1 = param1;
            _loc49_ = function(param1:Boolean):void
            {
               _g.finishSave(slot1,param1);
            };
            _loc47_ = fileSaver.save(_loc48_,_loc49_);
            if(_loc47_)
            {
               return;
            }
         }
         else
         {
            _loc5_.flush();
            _loc5_ = SharedObject.getLocal(param1,"/");
            _loc6_ = SharedObject.getLocal(param1 + "_backup","/");
            _loc12_ = 0;
            _loc9_ = _loc5_.data;
            _loc10_ = _loc6_.data;
            _loc11_ = _loc9_;
            _loc13_ = _loc11_;
            _loc14_ = Reflect.fields(_loc11_);
            _loc24_ = 0;
            while(_loc24_ < int(_loc14_.length))
            {
               _loc50_ = _loc14_[_loc24_++];
               _loc51_ = Reflect.field(_loc13_,_loc50_);
               _loc52_ = _loc50_;
               _loc53_ = _loc52_;
               _loc54_ = _loc51_;
               _loc12_++;
               _loc55_ = _loc54_;
               _loc10_[_loc53_] = _loc55_;
            }
            _loc56_ = versionProperties;
            _loc57_ = "latest" in StringMap.reserved ? _loc56_.getReserved("latest") : _loc56_.h["latest"];
            if(_loc12_ < _loc57_)
            {
               clearOutput();
               outputText("<b>中止保存。你当前的存档文件已损坏，需要提交bug报告。</b>");
               outputText("[pg]在CoC的存档文件夹中，应该有一对名为 \"" + param1 + ".sol\" 和 \"" + param1 + "_backup.sol\"");
               outputText("[pg]<b>我们需要这两个文件，以及一份简短的报告，说明你在上次保存到出现此消息之间在游戏中做了什么。</b>[pg]");
               outputText("当你把文件发给我们后，你可以把 _backup 文件覆盖到你的旧存档上，以便从你上一次的存档继续游戏。[pg]");
               outputText("或者，你也可以直接点击恢复按钮，用备份覆盖损坏的存档……但我们真的希望你能先提供存档！");
               _loc47_ = true;
            }
            else
            {
               _loc6_.flush();
            }
            clearOutput();
            outputText("已保存至槽位 " + param1 + "！");
         }
         finishSave(param1,_loc47_);
      }
      
      public function saveGame(param1:String, param2:Boolean = false) : void
      {
         var _loc3_:SharedObject = SharedObject.getLocal(param1,"/");
         if(get_player().slotName != param1 && Boolean(_loc3_.data.exists) && param2)
         {
            confirmOverwrite(param1);
            return;
         }
         get_player().slotName = param1;
         saveGameObject(param1,false,param2);
      }
      
      public function restore(param1:String) : void
      {
         var _loc10_:* = null as String;
         var _loc11_:* = null;
         clearOutput();
         var _loc2_:SharedObject = SharedObject.getLocal(param1 + "_backup","/");
         var _loc3_:SharedObject = SharedObject.getLocal(param1,"/");
         var _loc4_:* = _loc3_.data;
         var _loc5_:* = _loc2_.data;
         var _loc6_:* = _loc5_;
         var _loc7_:* = _loc6_;
         var _loc8_:Array = Reflect.fields(_loc6_);
         var _loc9_:int = 0;
         while(_loc9_ < int(_loc8_.length))
         {
            _loc10_ = Reflect.field(_loc7_,_loc8_[_loc9_++]);
            _loc11_ = Reflect.field(_loc5_,_loc10_);
            _loc4_[_loc10_] = _loc11_;
         }
         _loc3_.flush();
         clearOutput();
         outputText("已恢复备份：" + param1);
         menu();
         doNext(playerMenu);
      }
      
      public function resolveStatus(param1:Object, param2:StatusConversions) : void
      {
         var _loc3_:String = param1.statusAffectName;
         if(_loc3_ == "Camp Rathazul")
         {
            param2.rathazul_campFollower = true;
         }
         else if(_loc3_ == "DungeonShutDown")
         {
            FlagDict_Impl_.arrayWriteInt(KFLAGS.flags,2024,1);
         }
         else if(_loc3_ == "FactoryIncubusDefeated")
         {
            FlagDict_Impl_.arrayWriteInt(KFLAGS.flags,2022,1);
         }
         else if(_loc3_ == "FactoryOmnibusDefeated")
         {
            FlagDict_Impl_.arrayWriteInt(KFLAGS.flags,2023,1);
         }
         else if(_loc3_ == "FactoryOverload")
         {
            FlagDict_Impl_.arrayWriteInt(KFLAGS.flags,2024,2);
         }
         else if(_loc3_ == "FactorySuccubusDefeated")
         {
            FlagDict_Impl_.arrayWriteInt(KFLAGS.flags,2021,1);
         }
         else if(_loc3_ == "Found Factory")
         {
            FlagDict_Impl_.arrayWriteInt(KFLAGS.flags,2020,1);
         }
         else if(_loc3_ == "IncubusBribed")
         {
            FlagDict_Impl_.arrayWriteInt(KFLAGS.flags,2025,1);
         }
         else
         {
            if(_loc3_ == "Lactation EnNumbere")
            {
               return;
            }
            if(_loc3_ == "Marae Complete")
            {
               FlagDict_Impl_.arrayWriteInt(KFLAGS.flags,2018,1);
            }
            else if(_loc3_ == "Marae\'s Lethicite")
            {
               get_player().createKeyItem("Marae\'s Lethicite",3,0,0,0);
            }
            else if(_loc3_ == "Marae\'s Quest Start")
            {
               FlagDict_Impl_.arrayWriteInt(KFLAGS.flags,2017,1);
            }
            else if(_loc3_ == "Met Marae")
            {
               FlagDict_Impl_.arrayWriteInt(KFLAGS.flags,2015,1);
            }
            else if(_loc3_ == "TakenGro+")
            {
               FlagDict_Impl_.arrayWriteInt(KFLAGS.flags,2027,5 - int(Number(param1.value1)));
            }
            else if(_loc3_ == "TakenLactaid")
            {
               FlagDict_Impl_.arrayWriteInt(KFLAGS.flags,2026,5 - int(Number(param1.value1)));
            }
            else if(_loc3_ == "metRathazul")
            {
               param2.rathazul_metRathazul = true;
               param2.rathazul_campOffer = int(Number(param1.value3)) > 0;
               param2.rathazul_mixologyXP = int(Number(param1.value2)) * 4;
            }
            else
            {
               CoC_Settings.error("找不到状态效果 \"" + param1.statusAffectName + "\"");
            }
         }
      }
      
      public function purgeTheMutant() : void
      {
         var _loc1_:SharedObject = SharedObject.getLocal(FlagDict_Impl_.arrayReadString(KFLAGS.flags,63),"/");
         var _loc2_:Array = ["被病毒炸弹袭击了","被肃清了","被气化了","被轨道核平了","膝盖中了一箭","自刎了","失去了现实矩阵的凝聚力","已被净化","遭遇了以下错误：(404) 未找到色情内容","已被删除"];
         clearOutput();
         var _loc3_:Array = _loc2_;
         outputText(FlagDict_Impl_.arrayReadString(KFLAGS.flags,63) + "" + _loc3_[Utils.rand(int(_loc3_.length))] + "。");
         _loc1_.clear();
         doNext(deleteScreen);
      }
      
      public function openSave() : void
      {
         fileSaver.load(loadGame,saveLoad);
      }
      
      public function loadScreen() : void
      {
         clearOutput();
         displayLastSaveHeader();
         displaySlotsHeader();
         var _loc1_:ButtonDataList = displaySaveFilesUsed(selectLoadButton);
         _loc1_.submenu(saveLoad,false,_loc1_.page);
      }
      
      public function loadSaveDisplay(param1:SharedObject, param2:String, param3:Boolean = false, param4:Boolean = false) : String
      {
         var _loc14_:* = null as Object;
         if(!param1.data.exists)
         {
            return param2 + ":  <b>空</b>\r     \r";
         }
         var _loc5_:* = param1.data.notes != null ? param1.data.notes : "";
         param1.data.notes = _loc5_;
         var _loc6_:String = StringTools.lpad(Std.string(param1.data.hours),"0",2);
         var _loc7_:String = StringTools.lpad(Std.string(param1.data.minutes),"0",2);
         var _loc8_:String = param2;
         _loc8_ += "：<b>";
         if(param3)
         {
            _loc8_ += "<font color=\"#5050f0\">最新</font> ";
         }
         if(param4)
         {
            _loc8_ += "<font color=\"#FF0000\">当前</font> ";
         }
         _loc8_ += "" + Std.string(param1.data.short) + "</b>";
         if(param1.data.notes != "" && param1.data.notes != "没有可用的注释。")
         {
            _loc8_ += " - <i>" + Std.string(param1.data.notes) + "</i>";
         }
         _loc8_ += "\n    天数 - " + Std.string(param1.data.days) + " | 时间：" + _loc6_ + ":" + _loc7_ + " | 性别 - ";
         if(param1.data.cocks.length > 0 && param1.data.vaginas.length > 0)
         {
            _loc8_ += "H";
         }
         else if(param1.data.cocks.length > 0)
         {
            _loc8_ += "男";
         }
         else if(param1.data.vaginas.length > 0)
         {
            _loc8_ += "女";
         }
         else
         {
            _loc8_ += "U";
         }
         var _loc9_:* = param1.data.selfSaving;
         var _loc10_:* = _loc9_ != null ? _loc9_.playersettings : null;
         var _loc11_:* = _loc10_ != null ? _loc10_.data : null;
         var _loc12_:* = _loc11_ != null ? _loc11_.modes : null;
         var _loc13_:Object = _loc12_ != null ? _loc12_.difficulty : null;
         if(_loc13_ == null)
         {
            _loc14_ = int(param1.data.flags[2990]);
            _loc13_ = _loc14_ != null ? int(_loc14_) : 0;
            if(Boolean(param1.data.flags[99]))
            {
               _loc13_ = -2;
            }
         }
         _loc8_ += " | 难度 - ";
         if(_loc13_ == null)
         {
            _loc8_ += "<font color=\"#808000\">未知</font>";
         }
         else
         {
            _loc14_ = _loc13_;
            if(_loc14_ == -2)
            {
               _loc8_ += "<font color=\"#008000\">简单</font>";
            }
            else if(_loc14_ == 0)
            {
               _loc8_ += "<font color=\"#808000\">普通</font>";
            }
            else if(_loc14_ == 1)
            {
               _loc8_ += "<font color=\"#800000\">困难</font>";
            }
            else if(_loc14_ == 2)
            {
               _loc8_ += "<font color=\"#C00000\">噩梦</font>";
            }
            else if(_loc14_ == 3)
            {
               _loc8_ += "<font color=\"#FF0000\">极限</font>";
            }
            else
            {
               _loc8_ += "<font color=\"#808000\">未知</font>";
            }
         }
         return _loc8_ + "\n";
      }
      
      public function loadPermObject() : void
      {
         var _loc3_:* = null;
         var _loc4_:* = null;
         var _loc5_:* = null;
         var _loc6_:* = null as Array;
         var _loc7_:int = 0;
         var _loc8_:* = null as String;
         var _loc9_:* = null;
         var _loc10_:* = null as String;
         var _loc11_:* = null as String;
         var _loc12_:* = null;
         var _loc13_:* = null as Object;
         var _loc1_:String = "CoC_Main";
         var _loc2_:SharedObject = SharedObject.getLocal(_loc1_,"/");
         if(_loc2_.data.exists)
         {
            if(_loc2_.data.achievements != null)
            {
               _loc3_ = _loc2_.data.achievements;
               _loc4_ = _loc3_;
               _loc5_ = _loc4_;
               _loc6_ = Reflect.fields(_loc4_);
               _loc7_ = 0;
               while(_loc7_ < int(_loc6_.length))
               {
                  _loc8_ = _loc6_[_loc7_++];
                  _loc9_ = Reflect.field(_loc5_,_loc8_);
                  _loc10_ = _loc8_;
                  _loc11_ = _loc10_;
                  _loc12_ = _loc9_;
                  _loc13_ = Std.parseInt(_loc11_);
                  if(_loc13_ != null && _loc12_ > 0)
                  {
                     get_achievements().h[int(_loc13_)] = true;
                  }
               }
            }
            if(_loc2_.data.permObjVersionID != null)
            {
               get_game().permObjVersionID = _loc2_.data.permObjVersionID;
            }
            if(get_game().permObjVersionID < 1039900)
            {
               get_achievements().remove(10);
               get_achievements().remove(11);
               get_achievements().remove(110);
               get_achievements().remove(111);
               get_game().permObjVersionID = 1039900;
               savePermObject();
            }
            if(_loc2_.data.selfSaving == null)
            {
               _loc2_.data.selfSaving = {};
            }
            SelfSaver.load(_loc2_.data.selfSaving,true);
            if(get_displaySettings().autoLoadTheme && !get_game().gameSettings.autoloaded)
            {
               get_game().gameSettings.waitTheme = get_displaySettings().lastTheme;
               new ThemeLoader(get_game().gameSettings.autoTheme).autoload();
               get_game().gameSettings.autoloaded = true;
            }
            get_game().inputManager.showHotkeys(get_displaySettings().showHotkeys);
            if(_loc2_.data.flags)
            {
               get_game().gameSettings.convertOldSettings(_loc2_.data.flags);
            }
            if(_loc2_.data.controls != null)
            {
               get_game().inputManager.LoadBindsFromObj(_loc2_.data.controls);
            }
         }
      }
      
      public function loadLatest(param1:Function) : Boolean
      {
         var _loc2_:int = getLatestSaveSlot();
         var _loc3_:String = "";
         if(_loc2_ == -2)
         {
            autoLoadFiles(param1);
            return false;
         }
         if(_loc2_ >= 0)
         {
            _loc3_ = saveFileNames[_loc2_];
            return loadGame(_loc3_,true);
         }
         return false;
      }
      
      public function loadGameObject(param1:*, param2:String = undefined) : void
      {
         var _g1:Player;
         var _g:Player;
         var _loc3_:* = null as ItemSlot;
         var _loc4_:* = null as String;
         var _loc5_:int = 0;
         var _loc6_:* = null as Player;
         var _loc7_:* = null;
         var _loc8_:* = null as Object;
         var _loc9_:* = null as Object;
         var _loc10_:* = null as Object;
         var _loc11_:* = null as Object;
         var _loc12_:* = null as Object;
         var _loc13_:* = null as Object;
         var _loc14_:* = null as Object;
         var _loc15_:* = null as Object;
         var _loc16_:* = null as Object;
         var _loc17_:* = null as Object;
         var _loc18_:* = null as Object;
         var _loc19_:* = null as Object;
         var _loc20_:* = null as Object;
         var _loc21_:* = null as Object;
         var _loc22_:* = null as Object;
         var _loc23_:* = null as String;
         var _loc24_:int = 0;
         var _loc25_:* = null as Array;
         var _loc26_:* = null as String;
         var _loc27_:* = null as Object;
         var _loc28_:* = null as Object;
         var _loc29_:* = null as Object;
         var _loc30_:* = null as Object;
         var _loc31_:* = null as Object;
         var _loc32_:* = null as Object;
         var _loc33_:* = null as String;
         var _loc34_:* = null as String;
         var _loc35_:* = null as Cock;
         var _loc36_:* = null as Vagina;
         var _loc37_:* = null as Object;
         var _loc38_:int = 0;
         var _loc39_:int = 0;
         var _loc40_:Boolean = false;
         var _loc41_:* = null as BreastRow;
         var _loc42_:Boolean = false;
         var _loc43_:Boolean = false;
         var _loc44_:Boolean = false;
         var _loc45_:Boolean = false;
         var _loc46_:* = null as String;
         var _loc47_:* = null as PerkType;
         var _loc48_:* = null as Perk;
         var _loc49_:Boolean = false;
         var _loc50_:* = null as MasteryType;
         var _loc51_:* = null as StatusConversions;
         var _loc52_:* = null as StatusEffectType;
         var _loc53_:* = null as StatusEffect;
         var _loc54_:* = null as Object;
         var _loc55_:* = null as IMap;
         var _loc56_:* = null as IMap;
         var _loc57_:* = null;
         var _loc58_:* = null;
         var _loc59_:* = null as String;
         var _loc60_:* = null as ItemType;
         var _loc61_:* = null as Object;
         var _loc62_:* = null as ItemSlot;
         var _loc63_:* = null as Equippable;
         if(param2 == null)
         {
            param2 = "VOID";
         }
         get_game().dungeonLoc = 0;
         get_game().inDungeon = false;
         get_game().inRoomedDungeon = false;
         get_game().inRoomedDungeonResume = null;
         get_game().mainView.endCombatView();
         get_game().mainView.monsterStatsView.hide();
         get_player().slotName = param2;
         if(param1.exists)
         {
            _loc6_ = get_game().newPlayer();
            KFLAGS.flags.h = new Dictionary();
            get_inventory().clearStorage();
            get_inventory().clearGearStorage();
            _loc6_.set_short(param1.short);
            _loc6_.set_a(param1.a);
            notes = param1.notes;
            if(param1.flags != null)
            {
               _loc7_ = param1.flags;
               FlagDict_Impl_.load(KFLAGS.flags,_loc7_);
            }
            if(param1.versionID != null)
            {
               get_game().versionID = param1.versionID;
            }
            _loc6_.nipplesPierced = param1.nipplesPierced;
            _loc6_.nipplesPShort = param1.nipplesPShort;
            _loc6_.nipplesPLong = param1.nipplesPLong;
            _loc6_.lipPierced = param1.lipPierced;
            _loc6_.lipPShort = param1.lipPShort;
            _loc6_.lipPLong = param1.lipPLong;
            _loc6_.tonguePierced = param1.tonguePierced;
            _loc6_.tonguePShort = param1.tonguePShort;
            _loc6_.tonguePLong = param1.tonguePLong;
            _loc6_.eyebrowPierced = param1.eyebrowPierced;
            _loc6_.eyebrowPShort = param1.eyebrowPShort;
            _loc6_.eyebrowPLong = param1.eyebrowPLong;
            _loc6_.earsPierced = param1.earsPierced;
            _loc6_.earsPShort = param1.earsPShort;
            _loc6_.earsPLong = param1.earsPLong;
            _loc6_.nosePierced = param1.nosePierced;
            _loc6_.nosePShort = param1.nosePShort;
            _loc6_.nosePLong = param1.nosePLong;
            _loc6_.set_str(param1.str);
            _loc6_.set_tou(param1.tou);
            _loc6_.set_spe(param1.spe);
            _loc6_.set_inte(param1.inte);
            _loc6_.lib = param1.lib;
            _loc6_.sens = param1.sens;
            _loc6_.cor = param1.cor;
            _loc6_.set_fatigue(param1.fatigue);
            if(param1.weaponId != null && param1.weapon == null)
            {
               param1.weapon = {"id":param1.weaponId};
            }
            if(param1.shieldId != null && param1.shield == null)
            {
               param1.shield = {"id":param1.shieldId};
            }
            if(param1.jewelryId != null && param1.jewelry == null)
            {
               param1.jewelry = {"id":param1.jewelryId};
            }
            if(param1.upperGarmentId != null && param1.upperGarment == null)
            {
               param1.upperGarment = {"id":param1.upperGarmentId};
            }
            if(param1.lowerGarmentId != null && param1.lowerGarment == null)
            {
               param1.lowerGarment = {"id":param1.lowerGarmentId};
            }
            if(param1.armorId != null && param1.armor == null)
            {
               param1.armor = {"id":param1.armorId};
            }
            findAndEquip(param1,"weapon",_loc6_.setWeapon,_loc6_.setWeaponHiddenField,_loc6_.getUnarmedWeapon());
            findAndEquip(param1,"shield",_loc6_.setShield,_loc6_.setShieldHiddenField,ShieldLib.NOTHING);
            findAndEquip(param1,"jewelry",_loc6_.setJewelry,_loc6_.setJewelryHiddenField,JewelryLib.NOTHING);
            _g = _loc6_;
            findAndEquip(param1,"upperGarment",function(param1:Undergarment):Undergarment
            {
               return _g.setUndergarment(param1);
            },_loc6_.setUpperUndergarmentHiddenField,UndergarmentLib.NOTHING);
            _g1 = _loc6_;
            findAndEquip(param1,"lowerGarment",function(param1:Undergarment):Undergarment
            {
               return _g1.setUndergarment(param1);
            },_loc6_.setLowerUndergarmentHiddenField,UndergarmentLib.NOTHING);
            findAndEquip(param1,"armor",_loc6_.setArmor,_loc6_.setArmorHiddenField,ArmorLib.NOTHING);
            if(param1.previouslyWornClothes != null)
            {
               _loc6_.previouslyWornClothes = param1.previouslyWornClothes;
            }
            _loc6_.set_HP(param1.HP);
            _loc6_.set_lust(param1.lust);
            if(param1.teaseLevel > 0 || param1.teaseXP > 0)
            {
               _loc6_.teaseSkillToMastery(param1.teaseLevel,param1.teaseXP);
            }
            _loc8_ = param1.hunger;
            _loc6_.hunger = _loc8_ != null ? Number(_loc8_) : 50;
            _loc6_.XP = param1.XP;
            _loc6_.level = param1.level;
            _loc9_ = param1.gems;
            _loc6_.set_gems(_loc9_ != null ? int(_loc9_) : 0);
            _loc10_ = param1.perkPoints;
            _loc6_.perkPoints = _loc10_ != null ? Number(_loc10_) : 0;
            _loc11_ = param1.statPoints;
            _loc6_.statPoints = _loc11_ != null ? Number(_loc11_) : 0;
            _loc12_ = param1.ascensionPerkPoints;
            _loc6_.ascensionPerkPoints = _loc12_ != null ? Number(_loc12_) : 0;
            _loc13_ = param1.age;
            _loc6_.set_age(_loc13_ != null ? int(_loc13_) : 0);
            _loc14_ = param1.startingAge;
            _loc6_.startingAge = _loc14_ != null ? int(_loc14_) : _loc6_.age;
            if(param1.startingRace != null)
            {
               _loc6_.startingRace = param1.startingRace;
            }
            if(param1.lostVirginity != null)
            {
               _loc6_.lostVirginity = param1.lostVirginity;
            }
            _loc15_ = param1.femininity;
            _loc6_.set_femininity(_loc15_ != null ? Number(_loc15_) : 50);
            _loc16_ = param1.eyeType;
            _loc6_.eyes.setType(_loc16_ != null ? int(_loc16_) : 0,param1.eyeCount);
            _loc17_ = param1.beardLength;
            _loc6_.beard.length = _loc17_ != null ? Number(_loc17_) : 0;
            _loc18_ = param1.beardStyle;
            _loc6_.beard.style = _loc18_ != null ? int(_loc18_) : 0;
            _loc19_ = param1.tone;
            _loc6_.tone = _loc19_ != null ? Number(_loc19_) : 50;
            _loc20_ = param1.thickness;
            _loc6_.thickness = _loc20_ != null ? Number(_loc20_) : 50;
            _loc6_.set_tallness(param1.tallness);
            if(param1.furColor == null || param1.furColor == "no")
            {
               _loc6_.skin.furColor = param1.hairColor;
            }
            else
            {
               _loc6_.skin.furColor = param1.furColor;
            }
            _loc6_.hair.color = param1.hairColor;
            _loc21_ = param1.hairType;
            _loc6_.hair.type = _loc21_ != null ? int(_loc21_) : 0;
            if(param1.hairAdj != null)
            {
               _loc6_.hair.adj = param1.hairAdj;
            }
            if(param1.hairFlowerColor != null)
            {
               _loc6_.hair.flowerColor = param1.hairFlowerColor;
            }
            if(_loc6_.hair.type == 11)
            {
               _loc6_.hair.type = 10;
            }
            if(param1.gillType != null)
            {
               _loc6_.gills.type = param1.gillType;
            }
            else if(param1.gills == null)
            {
               _loc6_.gills.type = 0;
            }
            else
            {
               _loc6_.gills.type = param1.gills ? 1 : 0;
            }
            _loc22_ = param1.armType;
            _loc6_.arms.set_type(_loc22_ != null ? int(_loc22_) : 0);
            _loc6_.hair.length = param1.hairLength;
            _loc6_.skin.type = param1.skinType;
            _loc23_ = param1.skinAdj;
            _loc6_.skin.adj = _loc23_ != null ? _loc23_ : "";
            _loc6_.skin.tone = param1.skinTone;
            _loc6_.skin.desc = param1.skinDesc;
            if(_loc6_.skin.type == 4)
            {
               _loc6_.skin.adj = "";
               _loc6_.skin.desc = "skin";
               _loc6_.skin.type = 0;
            }
            _loc24_ = 0;
            _loc25_ = ["黏液","乳胶","橡胶","厚实","光滑"];
            while(_loc24_ < int(_loc25_.length))
            {
               _loc26_ = _loc25_[_loc24_];
               _loc24_++;
               if(_loc6_.skin.desc.indexOf(_loc26_) != -1)
               {
                  _loc6_.skin.adj = _loc26_;
                  if(_loc6_.hasGooSkin())
                  {
                     _loc6_.skin.desc = "goo";
                  }
                  else if(_loc6_.hasScales())
                  {
                     _loc6_.skin.desc = "scales";
                  }
                  else if(_loc6_.hasFur())
                  {
                     _loc6_.skin.desc = "fur";
                  }
                  else if(_loc6_.hasPlainSkin())
                  {
                     _loc6_.skin.desc = "skin";
                  }
                  break;
               }
            }
            _loc6_.face.type = param1.faceType;
            _loc27_ = param1.tongueType;
            _loc6_.tongue.type = _loc27_ != null ? int(_loc27_) : 0;
            _loc28_ = param1.earType;
            _loc6_.ears.type = _loc28_ != null ? int(_loc28_) : 0;
            _loc29_ = param1.earValue;
            _loc6_.ears.value = _loc29_ != null ? Number(_loc29_) : 0;
            _loc30_ = param1.antennae;
            _loc6_.antennae.type = _loc30_ != null ? int(_loc30_) : 0;
            _loc6_.horns.value = param1.horns;
            _loc31_ = param1.hornType;
            _loc6_.horns.type = _loc31_ != null ? int(_loc31_) : 0;
            if(param1.underBody != null)
            {
               _loc6_.underBody.setAllProps(param1.underBody);
            }
            if(param1.neck != null)
            {
               _loc6_.neck.setAllProps(param1.neck);
            }
            if(param1.rearBody != null)
            {
               _loc6_.rearBody.setAllProps(param1.rearBody);
            }
            _loc26_ = param1.clawTone;
            _loc6_.arms.claws.tone = _loc26_ != null ? _loc26_ : "";
            _loc32_ = param1.clawType;
            _loc6_.arms.claws.set_type(_loc32_ != null ? int(_loc32_) : 0);
            _loc6_.wings.type = param1.wingType;
            _loc33_ = param1.wingColor;
            _loc6_.wings.color = _loc33_ != null ? _loc33_ : "no";
            _loc34_ = param1.wingColor2;
            _loc6_.wings.color2 = _loc34_ != null ? _loc34_ : "no";
            _loc6_.lowerBody.type = param1.lowerBody;
            _loc6_.lowerBody.incorporeal = param1.incorporeal;
            _loc6_.tail.type = param1.tailType;
            _loc6_.tail.venom = param1.tailVenum;
            _loc6_.tail.recharge = param1.tailRecharge;
            _loc6_.hips.rating = param1.hipRating;
            _loc6_.butt.rating = param1.buttRating;
            if(_loc6_.hasDragonWings() && (["","no"].indexOf(_loc6_.wings.color) != -1 || ["","no"].indexOf(_loc6_.wings.color2) != -1))
            {
               _loc6_.wings.color = _loc6_.skin.tone;
               _loc6_.wings.color2 = _loc6_.skin.tone;
            }
            if(_loc6_.wings.type == 8)
            {
               _loc6_.wings.restore();
               _loc6_.rearBody.setAllProps({"type":3});
            }
            if(_loc6_.lowerBody.type == 4)
            {
               _loc6_.lowerBody.type = 1;
               _loc6_.lowerBody.legCount = 4;
            }
            if(_loc6_.lowerBody.type == 24)
            {
               _loc6_.lowerBody.type = 21;
               _loc6_.lowerBody.legCount = 4;
            }
            if(param1.legCount != null)
            {
               _loc6_.lowerBody.legCount = param1.legCount;
            }
            else
            {
               switch(_loc6_.lowerBody.type)
               {
                  case 3:
                  case 8:
                  case 32:
                     _loc6_.lowerBody.legCount = 1;
                     break;
                  case 4:
                     _loc6_.lowerBody.legCount = 4;
                     _loc6_.lowerBody.type = 1;
                     break;
                  case 11:
                     _loc6_.lowerBody.legCount = 4;
                     break;
                  case 16:
                     _loc6_.lowerBody.legCount = 8;
                     break;
                  case 24:
                     _loc6_.lowerBody.legCount = 4;
                     _loc6_.lowerBody.type = 21;
                     break;
                  default:
                     _loc6_.lowerBody.legCount = 2;
               }
            }
            switch(_loc6_.underBody.type)
            {
               case 2:
                  _loc6_.underBody.type = 1;
                  break;
               case 5:
                  _loc6_.underBody.type = 3;
            }
            if(_loc6_.arms.type == 4)
            {
               switch(_loc6_.arms.claws.type)
               {
                  case 1:
                     _loc6_.arms.set_type(14);
                     break;
                  case 2:
                     _loc6_.arms.set_type(13);
               }
            }
            if(param1.udder != null)
            {
               _loc6_.udder.setAllProps(param1.udder);
            }
            _loc6_.balls = param1.balls;
            _loc6_.cumMultiplier = param1.cumMultiplier;
            _loc6_.ballSize = param1.ballSize;
            _loc6_.set_hoursSinceCum(param1.hoursSinceCum);
            _loc6_.fertility = param1.fertility;
            _loc6_.sexOrientation = param1.sexOrientation;
            if(param1.sexOrientation == null || Boolean(Math.isNaN(_loc6_.sexOrientation)))
            {
               _loc6_.sexOrientation = 50;
            }
            _loc6_.knockUpForce(param1.pregnancyType,param1.pregnancyIncubation);
            _loc6_.buttKnockUpForce(param1.buttPregnancyType,param1.buttPregnancyIncubation);
            _loc6_.cocks.resize(0);
            if(param1.cocks is Array)
            {
               _loc24_ = 0;
               _loc25_ = param1.cocks;
               while(_loc24_ < int(_loc25_.length))
               {
                  _loc7_ = _loc25_[_loc24_];
                  _loc24_++;
                  _loc35_ = new Cock();
                  _loc35_.deserialize(_loc7_);
                  _loc6_.cocks.push(_loc35_);
               }
            }
            _loc6_.vaginas.resize(0);
            if(param1.vaginas is Array)
            {
               _loc24_ = 0;
               _loc25_ = param1.vaginas;
               while(_loc24_ < int(_loc25_.length))
               {
                  _loc7_ = _loc25_[_loc24_];
                  _loc24_++;
                  _loc36_ = new Vagina();
                  _loc36_.deserialize(_loc7_);
                  _loc6_.vaginas.push(_loc36_);
               }
            }
            if(_loc6_.hasVagina() && _loc6_.vaginaType() != 5 && _loc6_.vaginaType() != 0)
            {
               _loc6_.vaginaType(0);
            }
            _loc37_ = param1.nippleLength;
            _loc6_.nippleLength = _loc37_ != null ? Number(_loc37_) : 0.25;
            _loc24_ = 0;
            _loc38_ = int(param1.breastRows.length);
            while(_loc24_ < _loc38_)
            {
               _loc39_ = _loc24_++;
               _loc40_ = _loc6_.createBreastRow();
               if(!_loc40_)
               {
                  lime.utils.Log.warn("存档中 breastRows 数量过多？数量：" + Std.string(param1.breastRows.length),{
                     "fileName":"src/classes/Saves.hx",
                     "lineNumber":1299,
                     "className":"classes.Saves",
                     "methodName":"loadGameObject"
                  });
                  break;
               }
               _loc41_ = _loc6_.breastRows[_loc39_];
               _loc7_ = param1.breastRows[_loc39_];
               _loc41_.breasts = Number(_loc7_.breasts);
               _loc41_.nipplesPerBreast = Math.max(1,Number(_loc7_.nipplesPerBreast));
               _loc41_.breastRating = Math.max(0,Number(_loc7_.breastRating));
               _loc41_.lactationMultiplier = Math.max(0,Number(_loc7_.lactationMultiplier));
               _loc41_.milkFullness = Number(_loc7_.milkFullness);
               _loc41_.fuckable = Boolean(_loc7_.fuckable);
               _loc41_.fullness = Number(_loc7_.fullness);
            }
            if(int(_loc6_.breastRows.length) == 0)
            {
               _loc6_.createBreastRow();
            }
            _loc40_ = false;
            _loc42_ = false;
            _loc43_ = false;
            _loc44_ = false;
            _loc45_ = false;
            _loc24_ = 0;
            _loc38_ = int(param1.perks.length);
            while(_loc24_ < _loc38_)
            {
               _loc39_ = _loc24_++;
               _loc7_ = param1.perks[_loc39_];
               _loc46_ = _loc7_.id;
               _loc4_ = _loc46_ != null ? _loc46_ : _loc7_.perkName;
               if(_loc4_ == "History: Whote")
               {
                  _loc4_ = "History: Whore";
               }
               if(_loc4_ == "Lusty Regeneration")
               {
                  _loc42_ = true;
               }
               else if(_loc4_ == "LustyRegeneration")
               {
                  _loc4_ = "Lusty Regeneration";
                  _loc42_ = true;
               }
               if(_loc4_.indexOf("History:") != -1)
               {
                  _loc40_ = true;
               }
               if(_loc4_ == "Ancestral Archery")
               {
                  _loc44_ = true;
               }
               if(_loc4_ == "Spellcasting Affinity")
               {
                  _loc45_ = true;
               }
               _loc47_ = PerkType.lookupPerk(_loc4_);
               if(_loc47_ != null)
               {
                  _loc6_.createPerk(_loc47_,Number(_loc7_.value1),Number(_loc7_.value2),Number(_loc7_.value3),Number(_loc7_.value4));
                  _loc48_ = _loc6_.perk(_loc6_.get_numPerks() - 1);
                  if(Boolean(Math.isNaN(_loc48_.value1)))
                  {
                     if(_loc48_.get_perkName() == "Wizard\'s Focus")
                     {
                        _loc48_.value1 = 0.3;
                     }
                     else
                     {
                        _loc48_.value1 = 0;
                     }
                  }
                  if(_loc48_.get_perkName() == "Wizard\'s Focus")
                  {
                     if(_loc48_.value1 == 0 || _loc48_.value1 < 0.1)
                     {
                        _loc48_.value1 = 0.5;
                     }
                  }
               }
            }
            if(_loc40_ == false && FlagDict_Impl_.arrayReadInt(KFLAGS.flags,418) != 0)
            {
               _loc6_.createPerk(PerkLib.HistoryWhore,0,0,0,0);
            }
            if(hasViridianCockSock(get_game().player) == true && _loc42_ == false)
            {
               _loc6_.createPerk(PerkLib.LustyRegeneration,0,0,0,0);
            }
            if(_loc44_)
            {
               _loc6_.removePerk(PerkLib.AncestralArchery);
               _loc6_.perkPoints += 1;
               outputText("\n先祖箭术特质已不再使用，特质点已退还。\n");
            }
            if(_loc45_)
            {
               _loc6_.removePerk(PerkLib.SpellcastingAffinity);
            }
            if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,1169) == 0)
            {
               if(FlagDict_Impl_.arrayReadString(KFLAGS.flags,1151) is String)
               {
                  _loc46_ = FlagDict_Impl_.arrayReadString(KFLAGS.flags,1151);
                  if(_loc46_.indexOf("lower back.lower back") != -1)
                  {
                     FlagDict_Impl_.arrayWriteString(KFLAGS.flags,1151,_loc46_.split(".")[0] + ".");
                  }
               }
               _loc25_ = [1143,1144,1141,1142];
               _loc24_ = 0;
               _loc38_ = 0;
               while(_loc38_ < int(_loc25_.length))
               {
                  _loc39_ = int(_loc25_[_loc38_]);
                  _loc38_++;
                  if(_loc39_ in KFLAGS.flags.h)
                  {
                     _loc24_++;
                     KFLAGS.flags.remove(_loc39_);
                  }
               }
               _loc6_.set_gems(_loc6_.get_gems() + 50 * _loc24_);
               FlagDict_Impl_.arrayWriteInt(KFLAGS.flags,1169,1);
            }
            if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,1091) == 1)
            {
               FlagDict_Impl_.arrayWriteInt(KFLAGS.flags,1091,0);
            }
            if(param1.masteries != null)
            {
               _loc5_ = 0;
               while(_loc5_ < param1.masteries.length)
               {
                  _loc4_ = param1.masteries[_loc5_].id;
                  _loc24_ = int(param1.masteries[_loc5_].level);
                  _loc38_ = int(param1.masteries[_loc5_].xp);
                  _loc49_ = Boolean(param1.masteries[_loc5_].isPermed);
                  _loc50_ = MasteryType.lookupMastery(_loc4_);
                  if(_loc50_ != null)
                  {
                     _loc6_.addMastery(_loc50_,_loc24_,_loc38_,false);
                     if(_loc49_)
                     {
                        _loc6_.permMastery(_loc50_);
                     }
                  }
                  _loc5_++;
               }
            }
            if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,868) > 0 && !_loc6_.hasMastery(MasteryLib.Casting))
            {
               _loc6_.spellsCastToMastery(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,868));
            }
            _loc51_ = new StatusConversions(null,null,null,null);
            _loc24_ = 0;
            _loc38_ = int(param1.statusAffects.length);
            while(_loc24_ < _loc38_)
            {
               _loc39_ = _loc24_++;
               _loc7_ = param1.statusAffects[_loc39_];
               _loc52_ = StatusEffectType.lookupStatusEffect(_loc7_.statusAffectName);
               if(_loc52_ == null)
               {
                  resolveStatus(_loc7_,_loc51_);
               }
               else
               {
                  if(_loc7_.statusAffectName == "Kelt" && Number(_loc7_.value1) > 0)
                  {
                     _loc6_.bowSkillToMastery(int(Number(_loc7_.value1)));
                     _loc7_.value1 = 0;
                  }
                  _loc53_ = _loc6_.createStatusEffect(_loc52_,Number(_loc7_.value1),Number(_loc7_.value2),Number(_loc7_.value3),Number(_loc7_.value4),false);
                  if(_loc7_.dataStore != null && int(Reflect.fields(_loc7_.dataStore).length) > 0)
                  {
                     _loc53_.dataStore = new DataStore(_loc7_.dataStore.duration,_loc7_.dataStore.removeString,_loc7_.dataStore.updateString,_loc7_.dataStore.hipRatingChange,_loc7_.dataStore.weaponID);
                  }
               }
            }
            if(param1.keyItems != null)
            {
               _loc24_ = 0;
               _loc38_ = int(param1.keyItems.length);
               while(_loc24_ < _loc38_)
               {
                  _loc39_ = _loc24_++;
                  _loc7_ = param1.keyItems[_loc39_];
                  _loc6_.createKeyItem(_loc7_.keyName,Number(_loc7_.value1),Number(_loc7_.value2),Number(_loc7_.value3),Number(_loc7_.value4));
               }
            }
            if(param1.itemStorage != null)
            {
               _loc5_ = 0;
               _loc25_ = get_inventory().itemStorage;
               while(_loc5_ < param1.itemStorage.length)
               {
                  get_inventory().createStorage();
                  _loc3_ = _loc25_[_loc5_];
                  _loc7_ = param1.itemStorage[_loc5_];
                  _loc3_.set_unlocked(Boolean(_loc7_.unlocked));
                  if(_loc7_.shortName != null && _loc7_.shortName != "")
                  {
                     if(_loc7_.shortName.indexOf("Gro+") != -1)
                     {
                        _loc7_.id = "GroPlus";
                     }
                     else if(_loc7_.shortName.indexOf("Sp Honey") != -1)
                     {
                        _loc7_.id = "SpHoney";
                     }
                  }
                  if(int(_loc7_.quantity) > 0)
                  {
                     _loc46_ = _loc7_.id;
                     _loc3_.setItemAndQty(ItemType.lookupItem(_loc46_ != null ? _loc46_ : _loc7_.shortName),int(_loc7_.quantity));
                     _loc54_ = int(_loc7_.damage);
                     _loc3_.damage = _loc54_ != null ? int(_loc54_) : 0;
                  }
                  else
                  {
                     _loc3_.emptySlot();
                  }
                  _loc5_++;
               }
            }
            get_inventory().initializeGearStorage();
            if(param1.gearStorage != null)
            {
               _loc5_ = 0;
               while(_loc5_ < param1.gearStorage.length && _loc5_ < int(get_inventory().gearStorage.length))
               {
                  _loc7_ = param1.gearStorage[_loc5_];
                  _loc3_ = get_inventory().gearStorage[_loc5_];
                  _loc3_.set_unlocked(Boolean(_loc7_.unlocked));
                  if(_loc7_.shortName == null && _loc7_.id == null || _loc7_.quantity == null || _loc7_.quantity == 0)
                  {
                     _loc3_.emptySlot();
                  }
                  else
                  {
                     _loc46_ = _loc7_.id;
                     _loc3_.setItemAndQty(ItemType.lookupItem(_loc46_ != null ? _loc46_ : _loc7_.shortName),_loc7_.quantity);
                     _loc54_ = int(_loc7_.damage);
                     _loc3_.damage = _loc54_ != null ? int(_loc54_) : 0;
                  }
                  _loc5_++;
               }
            }
            _loc7_ = param1.selfSaving;
            SelfSaver.load(_loc7_ != null ? _loc7_ : {});
            _loc6_.ass.analLooseness = param1.ass.analLooseness;
            _loc6_.ass.analWetness = param1.ass.analWetness;
            _loc6_.ass.fullness = param1.ass.fullness;
            gameStateSet(param1.gameState);
            get_game().time.minutes = param1.minutes;
            get_game().time.hours = param1.hours;
            get_game().time.days = param1.days;
            _loc54_ = param1.autoSave;
            _loc6_.autoSave = _loc54_ != null && Boolean(_loc54_);
            _loc55_ = new IntMap();
            _loc55_.h[2301] = "exploredLake";
            _loc55_.h[2300] = "exploredMountain";
            _loc55_.h[2298] = "exploredForest";
            _loc55_.h[2299] = "exploredDesert";
            _loc55_.h[2297] = "explored";
            _loc55_.h[2311] = "monk";
            _loc55_.h[2310] = "sand";
            _loc55_.h[2065] = "giacomo";
            _loc56_ = _loc55_;
            _loc57_ = new MapKeyValueIterator(_loc56_);
            while(Boolean(_loc57_.hasNext()))
            {
               _loc58_ = _loc57_.next();
               _loc24_ = int(_loc58_.key);
               _loc46_ = _loc58_.value;
               if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,_loc24_) == 0 && Reflect.hasField(param1,_loc46_))
               {
                  FlagDict_Impl_.arrayWriteInt(KFLAGS.flags,_loc24_,Reflect.field(param1,_loc46_));
               }
            }
            if(param1.beeProgress == 1)
            {
               get_game().forest.beeGirlScene.setTalked();
            }
            get_game().isabellaScene.isabellaOffspringData = [];
            if(param1.isabellaOffspringData != null)
            {
               _loc5_ = 0;
               while(_loc5_ < param1.isabellaOffspringData.length)
               {
                  get_game().isabellaScene.isabellaOffspringData.push(int(param1.isabellaOffspringData[_loc5_]));
                  get_game().isabellaScene.isabellaOffspringData.push(int(param1.isabellaOffspringData[_loc5_ + 1]));
                  _loc5_ += 2;
               }
            }
            get_inventory().unlockSlots();
            if(param1.items != null)
            {
               _loc25_ = param1.items;
               _loc24_ = 0;
               _loc38_ = int(_loc25_.length);
               while(_loc24_ < _loc38_)
               {
                  _loc39_ = _loc24_++;
                  _loc57_ = _loc25_[_loc39_];
                  _loc46_ = _loc57_.shortName;
                  if(_loc46_ != null)
                  {
                     if(_loc46_.indexOf("Gro+") != -1)
                     {
                        _loc57_.id = "GroPlus";
                     }
                     else if(_loc46_.indexOf("Sp Honey") != -1)
                     {
                        _loc57_.id = "SpHoney";
                     }
                  }
                  _loc59_ = _loc57_.id;
                  _loc60_ = ItemType.lookupItem(_loc59_ != null ? _loc59_ : _loc46_);
                  if(_loc60_ == null)
                  {
                     _loc6_.itemSlots[_loc39_].emptySlot();
                  }
                  else
                  {
                     _loc6_.itemSlots[_loc39_].setItemAndQty(_loc60_,_loc57_.quantity);
                     _loc61_ = _loc57_.damage;
                     _loc6_.itemSlots[_loc39_].damage = _loc61_ != null ? int(_loc61_) : 0;
                  }
               }
            }
            else
            {
               _loc24_ = 0;
               while(_loc24_ < 10)
               {
                  _loc38_ = _loc24_++;
                  _loc62_ = _loc6_.itemSlot(_loc38_);
                  _loc57_ = Reflect.field(param1,"itemSlot" + Std.string(_loc38_ + 1));
                  if(_loc57_ == null)
                  {
                     if(_loc38_ < 5)
                     {
                        haxe.Log.trace("Error loading old save items",{
                           "fileName":"src/classes/Saves.hx",
                           "lineNumber":1625,
                           "className":"classes.Saves",
                           "methodName":"loadGameObject"
                        });
                     }
                     break;
                  }
                  _loc46_ = _loc57_.id;
                  _loc60_ = ItemType.lookupItem(_loc46_ != null ? _loc46_ : _loc57_.shortName);
                  _loc62_.setItemAndQty(_loc60_,_loc57_.quantity);
                  _loc61_ = _loc57_.damage;
                  _loc62_.damage = _loc61_ != null ? int(_loc61_) : 0;
               }
            }
            _loc63_ = _loc6_.get_armor();
            _loc6_.addBonusStats(_loc63_.bonusStats);
            _loc63_ = _loc6_.get_weapon();
            _loc6_.addBonusStats(_loc63_.bonusStats);
            _loc63_ = _loc6_.get_jewelry();
            _loc6_.addBonusStats(_loc63_.bonusStats);
            _loc63_ = _loc6_.get_shield();
            _loc6_.addBonusStats(_loc63_.bonusStats);
            _loc63_ = _loc6_.get_upperGarment();
            _loc6_.addBonusStats(_loc63_.bonusStats);
            _loc63_ = _loc6_.get_lowerGarment();
            _loc6_.addBonusStats(_loc63_.bonusStats);
            CoC.loadAllAwareClasses(get_game());
            applyConversions(_loc51_);
            unFuckSave();
            _loc6_.loaded = true;
            doNext(playerMenu);
         }
      }
      
      public function loadGame(param1:String, param2:Boolean = false) : Boolean
      {
         var slot1:String;
         var _g:Saves;
         var _loc5_:* = null as Object;
         var _loc6_:* = null as StringMap;
         var _loc7_:* = null as String;
         var _loc8_:* = null as SharedObject;
         var _loc3_:* = param1 == "File" ? latestSaveFile.data : SharedObject.getLocal(param1,"/").data;
         var _loc4_:int = int(Reflect.fields(_loc3_).length);
         if(_loc3_.version == null)
         {
            _loc6_ = versionProperties;
            _loc5_ = "legacy" in StringMap.reserved ? _loc6_.getReserved("legacy") : _loc6_.h["legacy"];
         }
         else
         {
            _loc7_ = _loc3_.version;
            _loc6_ = versionProperties;
            _loc5_ = _loc7_ in StringMap.reserved ? _loc6_.getReserved(_loc7_) : _loc6_.h[_loc7_];
         }
         if(_loc5_ == null)
         {
            _loc6_ = versionProperties;
            _loc5_ = "latest" in StringMap.reserved ? _loc6_.getReserved("latest") : _loc6_.h["latest"];
         }
         if(_loc4_ < _loc5_)
         {
            clearOutput();
            outputText("<b>中止读取。当前存档文件缺少一些预期的属性。</b>[pg]");
            _loc8_ = SharedObject.getLocal(param1 + "_backup","/");
            if(_loc8_.data.exists)
            {
               outputText("你想读取这个槽位的备份版本吗？");
               menu();
               _g = this;
               slot1 = param1 + "_backup";
               addButton(0,"是",function():Boolean
               {
                  return _g.loadGame(slot1);
               });
               addButton(1,"否",saveLoad);
            }
            else
            {
               menu();
               addButton(0,"继续",saveLoad);
            }
            return false;
         }
         clearOutput();
         loadGameObject(_loc3_,param1);
         loadPermObject();
         get_game().mainMenu.hideMainMenu();
         hideMenus();
         outputText("游戏已加载");
         if(get_player().slotName == "VOID")
         {
            get_player().slotName = param1;
         }
         statScreenRefresh();
         if(param2)
         {
            playerMenu();
         }
         else
         {
            doNext(playerMenu);
         }
         return true;
      }
      
      public function loadFromFile() : void
      {
         openSave();
      }
      
      public function hasViridianCockSock(param1:Player) : Boolean
      {
         var _loc4_:* = null as Cock;
         var _loc2_:int = 0;
         var _loc3_:Array = param1.cocks;
         while(_loc2_ < int(_loc3_.length))
         {
            _loc4_ = _loc3_[_loc2_];
            _loc2_++;
            if(_loc4_.sock == "viridian")
            {
               return true;
            }
         }
         return false;
      }
      
      public function getSaveName(param1:int) : String
      {
         var _loc2_:SharedObject = SharedObject.getLocal(saveFileNames[getLatestSaveSlot()],"/");
         return _loc2_.data.short;
      }
      
      public function getLatestSaveSlot() : int
      {
         var _loc4_:int = 0;
         var _loc5_:* = null as SharedObject;
         var _loc1_:int = 0;
         var _loc2_:int = 0;
         var _loc3_:int = int(saveFileNames.length);
         while(_loc2_ < _loc3_)
         {
            _loc4_ = _loc2_++;
            _loc5_ = SharedObject.getLocal(saveFileNames[_loc4_],"/");
            if(_loc5_.data.saveTime > latestSaveTime)
            {
               latestSaveTime = _loc5_.data.saveTime;
               latestSaveSlot = _loc4_;
            }
         }
         if(get_miscSettings().lastFileSaveName != "" && get_miscSettings().lastFileSaveTime > latestSaveTime)
         {
            latestSaveSlot = -2;
         }
         return latestSaveSlot;
      }
      
      public function finishSave(param1:String, param2:Boolean) : void
      {
         var slotName:String;
         var _g:Saves;
         if(param2)
         {
            menu();
            addButton(0,"继续",playerMenu);
            _g = this;
            slotName = param1;
            addButton(9,"恢复",function():void
            {
               _g.restore(slotName);
            });
         }
         else
         {
            savePermObject();
            doNext(playerMenu);
         }
      }
      
      public function findAndEquip(param1:*, param2:String, param3:Function, param4:Function, param5:ItemType) : void
      {
         var _loc7_:* = null as ItemType;
         var _loc6_:* = Reflect.field(param1,param2);
         if(_loc6_ == null || _loc6_.id == null)
         {
            param3(param5);
         }
         else
         {
            _loc7_ = ItemType.lookupItem(_loc6_.id);
            if(_loc7_ == null)
            {
               _loc7_ = param5;
            }
            param4(_loc7_);
         }
      }
      
      public function displaySlotsHeader() : void
      {
         outputText("[pg][bu:存档槽：游戏天数，游戏时间，性别，难度][pg-]");
      }
      
      public function displaySaveFilesUsed(param1:Function) : ButtonDataList
      {
         return displaySaveFiles(param1,true);
      }
      
      public function displaySaveFiles(param1:Function, param2:Boolean = false) : ButtonDataList
      {
         var _loc6_:* = null as SharedObject;
         var _loc3_:ButtonDataList = new ButtonDataList();
         var _loc4_:int = getLatestSaveSlot();
         var _loc5_:int = 0;
         while(_loc5_ < int(saveFileNames.length))
         {
            _loc6_ = SharedObject.getLocal(saveFileNames[_loc5_],"/");
            rawOutputText(loadSaveDisplay(_loc6_,Std.string(_loc5_ + 1),_loc4_ == _loc5_,get_player().slotName == saveFileNames[_loc5_]));
            _loc3_.add("存档槽 " + (_loc5_ + 1),(function(param1:Array, param2:Array, param3:Array):Function
            {
               var _g:Array = param1;
               var index:Array = param2;
               var slotName:Array = param3;
               return function():void
               {
                  _g[0](slotName[0],int(index[0]));
               };
            })([param1],[_loc5_],[saveFileNames[_loc5_]])).disableIf(param2 && !_loc6_.data.exists);
            _loc5_++;
         }
         return _loc3_;
      }
      
      public function displayLastSaveHeader() : void
      {
         if(get_player().slotName != "VOID")
         {
            outputText("[pg][b:上次保存或加载自：" + get_player().slotName + "]");
         }
      }
      
      public function deleteScreen() : void
      {
         var _gthis:Saves = this;
         clearOutput();
         displayLastSaveHeader();
         displaySlotsHeader();
         var _loc1_:Function = function(param1:String, param2:int):void
         {
            FlagDict_Impl_.arrayWriteString(KFLAGS.flags,63,_gthis.saveFileNames[param2]);
            _gthis.confirmDelete();
         };
         var _loc2_:ButtonDataList = displaySaveFilesUsed(_loc1_);
         outputText("\n<b>一旦删除，你的存档将永远消失。</b>");
         _loc2_.submenu(saveLoad,false,_loc2_.page);
      }
      
      public function confirmOverwrite(param1:String) : void
      {
         var slot1:String;
         var _g:Saves;
         clearOutput();
         outputText("你即将覆盖以下存档槽位：" + param1 + "。");
         outputText("[pg]<b>你确定吗？</b>");
         _g = this;
         slot1 = param1;
         doYesNo(function():void
         {
            _g.saveGame(slot1);
         },saveScreen);
      }
      
      public function confirmDelete() : void
      {
         clearOutput();
         outputText("你即将删除以下存档：<b>" + FlagDict_Impl_.arrayReadString(KFLAGS.flags,63) + "</b>");
         outputText("[pg]你确定要删除它吗？");
         doYesNo(purgeTheMutant,deleteScreen);
      }
      
      public function autosaveToggle() : void
      {
         get_player().autoSave = !get_player().autoSave;
         saveLoad();
      }
      
      public function autoLoadFiles(param1:Function) : void
      {
         var _loc4_:* = null as Array;
         var _loc5_:* = null as String;
         var _loc6_:* = null as String;
         var _loc7_:* = null as FileSaverStandalone;
         getLatestSaveSlot();
         var _loc2_:String = get_miscSettings().lastFileSaveName;
         var _loc3_:Number = get_miscSettings().lastFileSaveTime;
         if(get_gameplaySettings().preload == 0 || _loc2_ == "" || _loc3_ < latestSaveTime)
         {
            param1();
            return;
         }
         if(get_gameplaySettings().preload == 2)
         {
            _loc5_ = get_gameplaySettings().preloadPath;
            _loc6_ = _loc5_.charAt(_loc5_.length - 1);
            if(_loc6_ != "/" && _loc6_ != "\\" && _loc5_ != "")
            {
               _loc5_ += "/";
            }
            _loc4_ = [_loc5_ + _loc2_];
         }
         else
         {
            _loc4_ = [_loc2_,"./Saves/" + _loc2_];
         }
         _loc7_ = new FileSaverStandalone();
         _loc7_.autoLoad(_loc4_,loadGame,get_game().mainMenu.mainMenu);
      }
      
      public function applyConversions(param1:StatusConversions) : void
      {
         var _loc2_:int = 0;
         var _loc3_:int = 0;
         if(param1.rathazul_metRathazul)
         {
            get_game().rathazul.saveContent.metRathazul = true;
            get_game().rathazul.saveContent.campOffer = param1.rathazul_campOffer;
            §§push(1297);
            if(!(1297 is Number))
            {
               throw "Class cast error";
            }
            _loc2_ = int(§§pop());
            _loc3_ = Utils.maxInts(get_game().rathazul.get_mixologyXP(),FlagDict_Impl_.arrayReadInt(KFLAGS.flags,_loc2_),param1.rathazul_mixologyXP);
            get_game().rathazul.set_mixologyXP(_loc3_);
            KFLAGS.flags.remove(_loc2_);
         }
         if(param1.rathazul_campFollower)
         {
            get_game().rathazul.saveContent.campFollower = true;
         }
      }
   }
}

