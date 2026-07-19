package classes.scenes.camp
{
   import classes.BaseContent;
   import classes.CoC;
   import classes.DebugMenu;
   import classes.DynStat;
   import classes.Output;
   import classes.Player;
   import classes.SelfDebug;
   import classes._FlagDict.FlagDict_Impl_;
   import classes.globalFlags.KFLAGS;
   import classes.internals.Utils;
   import classes.internals._OneOf.OneOf_Impl_;
   import classes.items.Weapon;
   import classes.items.WeaponLib;
   import classes.items.weapons.IceWeapon;
   import classes.saves.SelfSaver;
   import classes.saves.SelfSaving;
   import classes.scenes.Camp;
   import classes.scenes.api.Encounter;
   import classes.scenes.api.EncounterDef;
   import classes.scenes.api.Encounters;
   import classes.scenes.api._Encounters.EncounterChance_Impl_;
   import classes.scenes.camp._CabinProgress.SaveContent;
   import coc.view.CoCButton;
   import flash.Boot;
   import haxe.IMap;
   import haxe.ds.Either;
   import haxe.ds.StringMap;
   
   public class CabinProgress extends BaseContent implements SelfDebug, SelfSaving
   {
      
      public var saveVersion:int;
      
      public var saveName:String;
      
      public var saveContent:SaveContent;
      
      public var globalSave:Boolean;
      
      public var _forestEncounter:Encounter;
      
      public function CabinProgress()
      {
         if(Boot.skip_constructor)
         {
            return;
         }
         _forestEncounter = null;
         globalSave = false;
         saveVersion = 1;
         saveName = "cabin";
         saveContent = new SaveContent(null,null);
         super();
         SelfSaver.register(this);
         DebugMenu.register(this);
      }
      
      public function thinkOfCabin() : void
      {
         outputText("你满怀惆怅地回想起你的故乡英格纳姆，它就在传送门的另一边，近在咫尺却又远在天涯。一种思乡之情涌上心头。你在营地里漫无目的地走着，脑海中突然闪过一个念头。[pg]");
         outputText("为什么不建一座像家里那样的房子呢？好吧，至少建个小屋。你在建筑方面并非毫无经验，而且这里有充足的材料。不过工具是个问题……随着思绪的飘飞，思乡之情开始消散。如果在玛瑞斯找不到你熟悉的乡村生活的痕迹，那你就只能自己动手建一个了。[pg]");
         outputText("你连地点都选好了……");
         FlagDict_Impl_.arrayWriteInt(KFLAGS.flags,2004,2);
         doNext(get_camp().returnToCampUseOneHour);
      }
      
      public function startThinkingOfMaterials() : void
      {
         outputText("你的场地现在又平整又漂亮。是时候考虑用什么材料来建小屋了。最简单的材料就是木头。这附近没有多少毛石，但有很多树。木头显然是最佳选择。[pg]");
         if(get_player().hasKeyItem("Carpenter\'s Toolbox"))
         {
            outputText("幸运的是，你在特尔阿德雷找到了那家木匠店，并买了一套工具。里面有斧头、手斧、剥皮铲，还有一堆其他工具。把原木加工成小屋基本横梁所需的一切都在里面。这套工具相当重，但你还是设法把它扛过沙漠带回了营地。你最好物尽其用！");
         }
         else if(hasLargeAxe())
         {
            outputText("幸好你找到了那把大斧头，对吧？那会让工作变得轻松。[pg]");
            outputText("不过仔细想想，光有一把斧头是不够的。你至少还需要一把手斧和一把剥皮铲。也许在什么地方你能买到包含所有必需品的工具箱。特尔阿德雷也许有？[pg]");
         }
         else
         {
            outputText("可惜你不能用手把树打倒并塑形。你至少需要一把斧头才能开始。如果你能找到的话，还需要一些其他的工具……");
         }
         FlagDict_Impl_.arrayWriteInt(KFLAGS.flags,2004,4);
         doNext(get_camp().returnToCampUseOneHour);
      }
      
      public function saveToObject() : Object
      {
         return saveContent;
      }
      
      public function reset() : void
      {
         saveContent.foundWood = false;
         saveContent.calledKiha = false;
      }
      
      public function punchTreeMinecraftStyle() : void
      {
         clearOutput();
         if(get_player().get_str() >= 90)
         {
            outputText("当你拥有纯粹的力量时，谁还需要斧头呢？你稳住身形，捏得指关节咔咔作响，然后用你强大的力量一拳打在树上。裂缝开始出现，你继续挥拳。当裂缝足够大时，一块木头断裂了。奇怪的是，这棵树竟然漂浮了起来。");
         }
         else
         {
            outputText("当你拥有纯粹的力量时，谁还需要斧头呢？你稳住身形，捏得指关节咔咔作响，然后用尽全力一拳打在树上。这需要费些力气，当你在打树的时候，出现了一道裂缝。随着你不断挥拳，裂缝越来越大。当裂缝足够大时，原木直接断裂，而这棵树竟然奇怪地漂浮了起来。");
         }
         outputText("你耸了耸肩，捡起那块木头。就在这时，你听到一声巨响，树倒了下来，裂成了许多木块！令人惊讶的是，它们聚集成了一捆。你捡起这捆木头，发现它很容易携带。你回到了营地。");
         awardAchievement("搞到木头",165,true,true);
         getWoodAndLeave("Punch");
      }
      
      public function prepareLocation() : void
      {
         outputText("有些人可能会觉得，在你肩负着如此重要的任务时，考虑建房子是很愚蠢的，但你根本不知道这任务要花多长时间。坦白说，你已经厌倦了醒来时浑身沾满露水，或者被突如其来的暴风雨淋成落汤鸡。一座坚固的、充满英格纳姆风格的小屋，对你每晚的恢复大有裨益。幸运的是，你还没感冒。[pg]");
         outputText("小屋的选址在一座小山上，距离传送门和周边地区足够近，可以看清周围的情况。在这个距离，你能看到你探索过的几个地方，主要是森林和湖泊。如果遭到袭击，这里也是个防守的好地方。而且这里的排水应该很好，你的小屋不会被冲走或泡坏。虽然想想有些痛苦，但这可能会成为你的永久住所。还是尽量建好点吧。[pg]");
         outputText("清理场地花了一些时间。首先把森林里的落叶杂物推到一边堆起来。接下来是石头。有些石头必须从地里撬出来。幸运的是，石头并不多。这工作量很大，但做完后让你感觉很好。");
         get_player().changeFatigue(50);
         FlagDict_Impl_.arrayWriteInt(KFLAGS.flags,2004,3);
         doNext(get_camp().returnToCampUseOneHour);
      }
      
      public function onAscend(param1:Boolean) : void
      {
         reset();
      }
      
      public function noThanks2() : void
      {
         outputText("[pg]决定现在不建小屋了，你回到了营地中心。");
         doNext(playerMenu);
      }
      
      public function noThanks() : void
      {
         clearOutput();
         outputText("你耸耸肩，打消了这个念头，继续你的探索。");
         doNext(get_game().exploration.currArea);
      }
      
      public function maxWoodSupply() : int
      {
         return 999;
      }
      
      public function maxStoneSupply() : int
      {
         return 999;
      }
      
      public function maxNailSupply() : int
      {
         return int(200 + get_player().keyItemv1("Carpenter\'s Nail Box"));
      }
      
      public function load(param1:int, param2:*) : void
      {
         Utils.recursiveLoad(param2,saveContent);
      }
      
      public function initiateCabin() : void
      {
         clearOutput();
         if(get_player().hasKeyItem("Nails"))
         {
            get_player().removeKeyItem("Nails");
         }
         if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,2004) >= 10)
         {
            FlagDict_Impl_.arrayWriteInt(KFLAGS.flags,2003,1);
         }
         if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,2003) == 1)
         {
            get_game().cabin.enterCabin();
            return;
         }
         if(get_player().get_fatigue() <= get_player().maxFatigue() - 50 || FlagDict_Impl_.arrayReadInt(KFLAGS.flags,2004) <= 1)
         {
            switch(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,2004))
            {
               case 1:
                  thinkOfCabin();
                  break;
               case 2:
                  prepareLocation();
                  break;
               case 3:
                  startThinkingOfMaterials();
                  break;
               case 4:
                  checkToolbox();
                  break;
               case 5:
                  drawCabinPlans();
                  break;
               case 6:
                  buildCabinPart1();
                  break;
               case 7:
                  buildCabinPart2();
                  break;
               case 8:
                  buildCabinPart3();
                  break;
               case 9:
                  buildCabinPart4();
                  break;
               case 10:
                  enterCabinFirstTime();
                  break;
               default:
                  thinkOfCabin();
            }
         }
         else
         {
            outputText("你太累了，无法继续建造小屋！");
            doNext(playerMenu);
         }
      }
      
      public function incrementWoodSupply(param1:int) : void
      {
         var _loc2_:* = null as IMap;
         if(param1 > 0)
         {
            outputText("[pg]<b>(+" + param1 + " 木材！");
            _loc2_ = KFLAGS.flags;
            FlagDict_Impl_.arrayWriteInt(_loc2_,2005,FlagDict_Impl_.arrayReadInt(_loc2_,2005) + param1);
            if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,2005) >= maxWoodSupply())
            {
               FlagDict_Impl_.arrayWriteInt(KFLAGS.flags,2005,maxWoodSupply());
               outputText("你的木材容量已满。");
            }
            outputText(")</b>");
            _loc2_ = KFLAGS.flags;
            FlagDict_Impl_.arrayWriteInt(_loc2_,2100,FlagDict_Impl_.arrayReadInt(_loc2_,2100) + param1);
         }
      }
      
      public function incrementNailSupply(param1:int) : void
      {
         if(param1 > 0)
         {
            outputText("[pg]<b>(+" + param1 + " 钉子！");
            get_player().addKeyValue("Carpenter\'s Toolbox",1,param1);
            if(get_player().keyItemv1("Carpenter\'s Toolbox") >= maxNailSupply())
            {
               get_player().addKeyValue("Carpenter\'s Toolbox",1,-(get_player().keyItemv1("Carpenter\'s Toolbox") - maxNailSupply()));
               outputText("你的钉子已经装满了。");
            }
            outputText(")</b>");
         }
      }
      
      public function hasLargeAxe() : Boolean
      {
         var _loc1_:Array = [get_weapons().L__AXE,get_weapons().KIHAAXE];
         if(!get_player().hasItemArrayAny(_loc1_))
         {
            if(get_player().get_weapon().isAxe())
            {
               return get_player().get_weapon().isLarge();
            }
            return false;
         }
         return true;
      }
      
      public function get_forestEncounter() : Encounter
      {
         var _gthis:CabinProgress;
         var _loc1_:* = null as Encounter;
         var _loc2_:* = null as Either;
         _gthis = this;
         if(_forestEncounter != null)
         {
            _loc1_ = _forestEncounter;
         }
         else
         {
            _loc2_ = OneOf_Impl_.fromA(gatherWoods);
            _loc1_ = Encounters.build(new EncounterDef("木材",null,EncounterChance_Impl_.fromBoolFun(function():Boolean
            {
               if((FlagDict_Impl_.arrayReadInt(KFLAGS.flags,2004) >= 4 || _gthis.get_player().hasKeyItem("Carpenter\'s Toolbox")) && FlagDict_Impl_.arrayReadInt(KFLAGS.flags,2005) < _gthis.maxWoodSupply())
               {
                  if(!_gthis.get_player().hasFatigue(_gthis.getChoppingFatigue() * 0.8,_gthis.get_player().FATIGUE_PHYSICAL))
                  {
                     return !_gthis.saveContent.foundWood;
                  }
                  return true;
               }
               return false;
            }),_loc2_,null));
         }
         return _forestEncounter = _loc1_;
      }
      
      public function get_debugName() : String
      {
         return "小木屋";
      }
      
      public function get_debugHint() : String
      {
         return "";
      }
      
      public function getWoodAndLeave(param1:String) : void
      {
         var timeUsed:int;
         var _g:Camp;
         incrementWoodSupply(getChoppingQuantity(param1));
         get_player().changeFatigue(getChoppingFatigue(param1),get_player().FATIGUE_PHYSICAL);
         _g = get_camp();
         timeUsed = getChoppingTime(param1);
         doNext(function():void
         {
            _g.returnToCamp(timeUsed);
         });
      }
      
      public function getHelpFromKiha() : void
      {
         saveContent.calledKiha = true;
         clearOutput();
         outputText("意识到你有一个拿着巨斧的同伴，你决定叫她来帮忙。你把双手放在脸前，在嘴边围成一个圆筒，大声呼喊奇哈过来。");
         outputText("[pg]唉，她似乎没有来。也许，你需要更大声一点。当然，你现在在树林深处。你深吸一口气，扯着嗓子大喊，呼唤你的龙人女战士来帮忙。过了一会儿，一种危险感袭来，紧接着是拍打翅膀的声音。惊慌失措的奇哈将她的斧头砸在附近的地上，气喘吁吁。[say: 怎——怎么了！？恶魔在哪里！？笨——]她停下来，喘了口气，盯着你，平复了一下情绪。[say: 笨——笨蛋？到底怎么了？]");
         outputText("[pg]你本来希望她能用她的巨斧帮你在这里收集木材，但你的解释似乎让她露出了震惊的表情。");
         outputText("[pg][say: 你叫得好像你马上就要惨死了一样！]母龙尖叫道。你一开始叫得没那么卖力，但她没听见，所以也没别的办法。奇哈叹了口气，因为赶来这里太累了，懒得争辩。[say: 如果你不是快死了，就别叫我，笨蛋，]她啐了一口。你看着她穿过树林走开，留给你的木材并没有比之前多，而你的音色却更差了。");
         doNext(get_camp().returnToCampUseOneHour);
      }
      
      public function getChoppingTime(param1:String) : int
      {
         var _loc2_:IMap = new StringMap();
         if("Toolbox" in StringMap.reserved)
         {
            _loc2_.setReserved("Toolbox",2);
         }
         else
         {
            _loc2_.h["Toolbox"] = 2;
         }
         if("Large Axe" in StringMap.reserved)
         {
            _loc2_.setReserved("Large Axe",2);
         }
         else
         {
            _loc2_.h["Large Axe"] = 2;
         }
         if("Fel Axe" in StringMap.reserved)
         {
            _loc2_.setReserved("Fel Axe",2);
         }
         else
         {
            _loc2_.h["Fel Axe"] = 2;
         }
         if("Ice Axe" in StringMap.reserved)
         {
            _loc2_.setReserved("Ice Axe",1);
         }
         else
         {
            _loc2_.h["Ice Axe"] = 1;
         }
         if("Punch" in StringMap.reserved)
         {
            _loc2_.setReserved("Punch",2);
         }
         else
         {
            _loc2_.h["Punch"] = 2;
         }
         var _loc3_:IMap = _loc2_;
         return param1 in StringMap.reserved ? _loc3_.getReserved(param1) : _loc3_.h[param1];
      }
      
      public function getChoppingQuantity(param1:String) : int
      {
         var _loc2_:IMap = new StringMap();
         var _loc3_:Number = 10 + get_player().get_str() / 10;
         if("Toolbox" in StringMap.reserved)
         {
            _loc2_.setReserved("Toolbox",_loc3_);
         }
         else
         {
            _loc2_.h["Toolbox"] = _loc3_;
         }
         _loc3_ = 15 + get_player().get_str() / 8;
         if("Large Axe" in StringMap.reserved)
         {
            _loc2_.setReserved("Large Axe",_loc3_);
         }
         else
         {
            _loc2_.h["Large Axe"] = _loc3_;
         }
         _loc3_ = 15 + get_player().get_str() / 8;
         if("Fel Axe" in StringMap.reserved)
         {
            _loc2_.setReserved("Fel Axe",_loc3_);
         }
         else
         {
            _loc2_.h["Fel Axe"] = _loc3_;
         }
         _loc3_ = 0;
         if("Ice Axe" in StringMap.reserved)
         {
            _loc2_.setReserved("Ice Axe",_loc3_);
         }
         else
         {
            _loc2_.h["Ice Axe"] = _loc3_;
         }
         _loc3_ = 10 + get_player().get_str() / 10;
         if("Punch" in StringMap.reserved)
         {
            _loc2_.setReserved("Punch",_loc3_);
         }
         else
         {
            _loc2_.h["Punch"] = _loc3_;
         }
         var _loc4_:IMap = _loc2_;
         return int(Number(param1 in StringMap.reserved ? _loc4_.getReserved(param1) : _loc4_.h[param1]));
      }
      
      public function getChoppingFatigue(param1:String = undefined) : int
      {
         if(param1 == null)
         {
            param1 = "minimum";
         }
         var _loc2_:int = 999;
         var _loc3_:IMap = new StringMap();
         if("Toolbox" in StringMap.reserved)
         {
            _loc3_.setReserved("Toolbox",50);
         }
         else
         {
            _loc3_.h["Toolbox"] = 50;
         }
         if("Large Axe" in StringMap.reserved)
         {
            _loc3_.setReserved("Large Axe",40);
         }
         else
         {
            _loc3_.h["Large Axe"] = 40;
         }
         if("Fel Axe" in StringMap.reserved)
         {
            _loc3_.setReserved("Fel Axe",25);
         }
         else
         {
            _loc3_.h["Fel Axe"] = 25;
         }
         if("Ice Axe" in StringMap.reserved)
         {
            _loc3_.setReserved("Ice Axe",10);
         }
         else
         {
            _loc3_.h["Ice Axe"] = 10;
         }
         if("Punch" in StringMap.reserved)
         {
            _loc3_.setReserved("Punch",50);
         }
         else
         {
            _loc3_.h["Punch"] = 50;
         }
         var _loc4_:IMap = _loc3_;
         if(param1 == "minimum")
         {
            _loc2_ = int(Math.min(_loc2_,"Toolbox" in StringMap.reserved ? _loc4_.getReserved("Toolbox") : _loc4_.h["Toolbox"]));
            if(hasLargeAxe())
            {
               _loc2_ = int(Math.min(_loc2_,"Large Axe" in StringMap.reserved ? _loc4_.getReserved("Large Axe") : _loc4_.h["Large Axe"]));
            }
            if(get_player().hasItemIncludeEquipped(get_weapons().FEL_AXE))
            {
               _loc2_ = int(Math.min(_loc2_,"Fel Axe" in StringMap.reserved ? _loc4_.getReserved("Fel Axe") : _loc4_.h["Fel Axe"]));
            }
            if(get_player().hasItemIncludeEquipped(get_weapons().ICEAXE))
            {
               _loc2_ = int(Math.min(_loc2_,"Ice Axe" in StringMap.reserved ? _loc4_.getReserved("Ice Axe") : _loc4_.h["Ice Axe"]));
            }
            if(get_silly() && get_player().get_str() >= 70)
            {
               _loc2_ = int(Math.min(_loc2_,"Punch" in StringMap.reserved ? _loc4_.getReserved("Punch") : _loc4_.h["Punch"]));
            }
         }
         else
         {
            _loc2_ = int(param1 in StringMap.reserved ? _loc4_.getReserved(param1) : _loc4_.h[param1]);
         }
         return _loc2_;
      }
      
      public function gatherWoods() : void
      {
         var tool2:String;
         var _g2:CabinProgress;
         var tool1:String;
         var _g1:CabinProgress;
         var tool:String;
         var _g:CabinProgress;
         saveContent.foundWood = true;
         clearOutput();
         outputText("当你在树林间穿梭时，你琢磨着木材可能有哪些用途。这里有一些相当笔直坚韧的树干，粗细适中，不需要花上一整天就能砍倒，非常适合用来做木工。");
         menu();
         if(get_player().hasKeyItem("Carpenter\'s Toolbox"))
         {
            _g = this;
            tool = "Toolbox";
            addNextButton("工具箱",function():void
            {
               _g.chopTree(tool);
            }).hint("你的木匠工具箱里有一把基础的斧头。虽然不是最好的，但也够用了。").disableIf(!get_player().hasFatigue(getChoppingFatigue("Toolbox") * 0.8,get_player().FATIGUE_PHYSICAL),"你太累了，干不了这个。");
         }
         if(get_player().hasItemIncludeEquipped(get_weapons().FEL_AXE))
         {
            _g1 = this;
            tool1 = "Large Axe";
            addNextButton("斧头",function():void
            {
               _g1.chopTree(tool1);
            }).hint("你有一把伐木斧，非常适合用来砍树。").disableIf(!get_player().hasFatigue(getChoppingFatigue("Fel Axe") * 0.8,get_player().FATIGUE_PHYSICAL),"你太累了，干不了这个。");
         }
         else if(hasLargeAxe())
         {
            _g2 = this;
            tool2 = "Large Axe";
            addNextButton("斧头",function():void
            {
               _g2.chopTree(tool2);
            }).hint("你随身带着一把大斧头。").disableIf(!get_player().hasFatigue(getChoppingFatigue("Large Axe") * 0.8,get_player().FATIGUE_PHYSICAL),"你太累了，干不了这个。");
         }
         if(get_player().hasItemIncludeEquipped(get_weapons().ICEAXE))
         {
            addNextButton("冰镐",attemptIceChopping).hint("如果你真的想的话，你可以试试用你的冰镐。").disableIf(!get_player().hasFatigue(getChoppingFatigue("Ice Axe"),get_player().FATIGUE_PHYSICAL),"你太累了，干不了这个。");
         }
         if(get_silly() && get_camp().followerKiha() && !saveContent.calledKiha)
         {
            addNextButton("奇哈",getHelpFromKiha).hint("奇哈有一把斧头。");
         }
         if(get_silly() && get_player().get_str() >= 70)
         {
            addNextButton("徒手撸树",punchTreeMinecraftStyle).hint("你突然产生了一种想要用拳头打树的奇怪冲动。你要打树吗？").disableIf(!get_player().hasFatigue(getChoppingFatigue("Punch") * 0.8,get_player().FATIGUE_PHYSICAL),"你太累了，干不了这个。");
         }
         if(!get_output().menuHasOptions())
         {
            outputText("[pg]不幸的是，你目前没有任何办法能真正砍倒一棵树。");
         }
         addButton(14,"离开",noThanks);
      }
      
      public function errorNotHave() : void
      {
         outputText("[pg][b: 你没有建造所需的工具。]");
      }
      
      public function errorNotEnough() : void
      {
         outputText("[pg][b: 你的资源不足。你可以从特尔阿德雷的木匠店购买更多钉子，并从森林或幽深森林获取更多木材。]");
      }
      
      public function enterCabinFirstTime() : void
      {
         clearOutput();
         outputText("你走进了新建成的小屋。你对自己的杰作感到自豪。不过，你的小屋里空空如也。[pg]");
         doNext(get_game().cabin.enterCabin);
      }
      
      public function drawCabinPlans() : void
      {
         outputText("既然你已经砍伐了一些树木，你现在可以制定一些计划了。你首先取下你砍伐的树木的一些内皮，并将其捣平。这能做成原始但有用的纸张。从你的营火中取出一块木炭，用刀片削几下，就能削出一个不错的笔尖。现在你可以为你的小屋画一些图纸了。[pg]");
         outputText("你回想英格纳姆的房屋，试图记住关于它们的外观和结构的每一个细节。");
         if(get_player().get_inte() >= 60)
         {
            outputText("幸运的是，你早期的木工训练并没有被遗忘。没过多久，你就完成了一套完整的图纸。");
         }
         else
         {
            outputText("制定计划花费了你很多精力。你真希望自己有更多的建筑经验！但是，你还是根据记忆凑合着完成了图纸。希望它们能经受住时间的考验……");
         }
         FlagDict_Impl_.arrayWriteInt(KFLAGS.flags,2004,6);
         doNext(get_camp().returnToCampUseOneHour);
      }
      
      public function doCabinWork4() : void
      {
         clearOutput();
         get_player().addKeyValue("Carpenter\'s Toolbox",1,-200);
         var _loc1_:IMap = KFLAGS.flags;
         FlagDict_Impl_.arrayWriteInt(_loc1_,2005,FlagDict_Impl_.arrayReadInt(_loc1_,2005) - 50);
         outputText("你走回你的小木屋施工现场，继续工作。你拿出书，翻开书页，直到你看到关于如何铺设木地板的说明。[pg]");
         outputText("按照说明，你在地上铺了一些木头，并测量每块木头之间的间隙，使其保持一致。[pg]");
         outputText("接下来，你铺设木板并将它们钉在适当的位置。这需要时间和精力，但当你完成地板的铺设时，你的小木屋已经有了准备打磨的木地板。你花了接下来的几个小时给地板刷漆和打磨。[pg]");
         outputText("花时间刷完漆后，你让地板晾干。[pg]");
         outputText("[b: 你已经完成了地板的铺设！][pg]");
         outputText("[b: 恭喜！你已经完成了小屋的结构！]\n幸运的是，《木匠指南》中也有一份关于如何制作家具的目录。接下来，你需要建造一些家具，为你的小屋增加实用性和舒适度。[pg]");
         FlagDict_Impl_.arrayWriteInt(KFLAGS.flags,2004,10);
         FlagDict_Impl_.arrayWriteInt(KFLAGS.flags,2003,1);
         get_player().changeFatigue(100);
         doNext(enterCabinFirstTime);
      }
      
      public function doCabinWork3() : void
      {
         clearOutput();
         get_player().addKeyValue("Carpenter\'s Toolbox",1,-100);
         var _loc1_:IMap = KFLAGS.flags;
         FlagDict_Impl_.arrayWriteInt(_loc1_,2005,FlagDict_Impl_.arrayReadInt(_loc1_,2005) - 50);
         outputText("你走回你的小木屋施工现场，继续工作。你拿出书，翻开书页，直到你看到关于如何建造一扇门的说明。[pg]");
         outputText("按照说明，你建造了一扇带有窗户的木门。你搭好门框，并将门安装到位。[pg]");
         outputText("接下来，你翻开书页，直到看到关于如何建造带有功能性百叶窗的窗户的说明。在将木头钉成框架之前，你测量并将其切割成正确的尺寸。接下来，你制作了两扇百叶窗，并将百叶窗安装到窗框中。最后，你将窗户安装到位。[pg]");
         outputText("[b: 你已经完成了门窗的安装！][pg]");
         FlagDict_Impl_.arrayWriteInt(KFLAGS.flags,2004,9);
         get_player().changeFatigue(100);
         doNext(get_camp().returnToCampUseFourHours);
      }
      
      public function doCabinWork2Part2() : void
      {
         clearOutput();
         get_game().time.hours = 0;
         var _temp_1:* = get_game().time;
         _temp_1.days = _temp_1.days + 1;
         get_player().set_HP(get_player().maxHP());
         get_player().set_fatigue(0);
         outputText("黎明一到，你吃过饭后，就立刻回去工作。从屋顶开始，你在椽子上钉上横木。这些为你简陋的屋顶提供了钉钉子的表面。你小心翼翼地在结构上保持平衡，将木板一块一块地钉在横木上，封住屋顶。然后你对墙壁做同样的事情。这绝对很简陋，但目前来说已经足够了。[pg]");
         outputText("你很高兴能放下锤子，拿起画笔。刷漆是一项乏味的工作，但压力远没有那么大。到一天结束时，你的小木屋看起来几乎完工了。真的只需要一扇好门和百叶窗了。[pg]");
         outputText("[b: 你已经完成了墙壁和屋顶的建造！][pg]");
         get_player().addKeyValue("Carpenter\'s Toolbox",1,-200);
         var _loc1_:IMap = KFLAGS.flags;
         FlagDict_Impl_.arrayWriteInt(_loc1_,2005,FlagDict_Impl_.arrayReadInt(_loc1_,2005) - 75);
         get_player().changeFatigue(100);
         FlagDict_Impl_.arrayWriteInt(KFLAGS.flags,2004,8);
         doNext(get_camp().returnToCampUseEightHours);
      }
      
      public function doCabinWork2Part1() : void
      {
         clearOutput();
         outputText("你花了几分钟时间查阅你的计划、木工手册和你自己的记忆。英格纳姆的建筑非常简单。没有奇怪的曲线或任何东西。所以书中的基本框架说明应该足够了。你开始测量木板，将它们锯成合适的长度，并按适当的比例钉起来。你小心翼翼地勾勒出窗户和门的框架，并检查你的几何形状。[pg]");
         outputText("小木屋不是很大，所以一个人完全可以完成。但这需要大量的工作。当你竖起墙壁并将它们钉入到位时，你能感觉到疲劳在累积。接下来是两端的桁架，以支撑中央屋顶梁。制作它们很容易，但将它们搬到顶部并钉入到位则更加令人筋疲力尽。至少屋脊梁很短，很容易安装到位。[pg]");
         outputText("接下来是椽子。一旦你弄清楚了正确的切割方法，这比其他部分要容易得多。这些根本不需要花太多时间。当你完成时，太阳已经开始下山了。继续工作的冲动很强烈，但睡眠是必要的。你把铺盖卷拖到搭好框架的小木屋里，在这里睡了一夜。");
         get_player().changeFatigue(100);
         doNext(doCabinWork2Part2);
      }
      
      public function doCabinWork1() : void
      {
         clearOutput();
         outputText("在开始之前，你翻阅了工具箱附带的手册，并将其中的小屋图纸与你自己的进行了比较。[pg]");
         if(get_player().get_inte() >= 60)
         {
            outputText("很高兴看到你的记忆力没有让你失望！你的图纸应该非常管用，而且这本手册很好地复习了打地基的基本原则。[pg]");
         }
         else
         {
            outputText("哇……木工活比你想象的要多得多。你花了一些时间，利用手册中的信息对你的地基图纸进行了一些重大修正。[pg]");
         }
         outputText("首先，你放下一根地基梁作为基准线，并在每个角落堆叠毛石，使其离地约一英尺高。然后你在每两个石墩之间放一堆，中间也放一堆。伴随着一声响亮的咕哝，你将砍伐好的木材抬到两条长边上，开始凿刻凹槽。");
         if(get_camp().companionsCount() > 0)
         {
            outputText("声音吸引了你的一些同伴。");
         }
         outputText("[pg]");
         outputText("你开始按照说明书建造一个木制框架。使用你的锤子和钉子，你把木制框架拼装起来并立起。然后你添加了临时支撑，以确保它不会倒塌。你又制作了两个相同形状的框架。最后，你又建造了一个框架，这次的框架设计有门和窗户。[pg]");
         if(get_game().rathazul.followerRathazul())
         {
            outputText("[say: 哎呀，哎呀。你在建什么？] 拉萨祖尔问道。[pg]");
         }
         if(get_game().jojoScene.jojoFollower())
         {
            outputText("[say: 你在建什么东西吗？]乔乔问道。[pg]");
         }
         if(get_camp().marbleFollower())
         {
            outputText("[say: 亲爱的，你在建小木屋吗？真不错，]玛布尔说道。[pg]");
         }
         if(get_camp().companionsCount() > 0)
         {
            outputText("你宣布，是的，你正在建造一座小木屋。[pg]");
         }
         outputText("凿好凹槽后，你将地基梁锤打在一起。拿起钉子、锤子和木板，你在地基梁之间敲入一些托梁，然后在上面铺设地板。这个过程花了一整天的时间，你已经筋疲力尽了，但这是一个很好的开始！[pg]");
         outputText("今晚你甚至可以把铺盖卷扔到这里来。[pg]");
         outputText("[b: 你已经完成了地基的建造！]\n你现在可以开始建造框架和墙壁了。[pg]");
         get_player().addKeyValue("Carpenter\'s Toolbox",1,-100);
         var _loc1_:IMap = KFLAGS.flags;
         FlagDict_Impl_.arrayWriteInt(_loc1_,2005,FlagDict_Impl_.arrayReadInt(_loc1_,2005) - 50);
         get_player().changeFatigue(100);
         FlagDict_Impl_.arrayWriteInt(KFLAGS.flags,2004,7);
         doNext(get_camp().returnToCampUseEightHours);
      }
      
      public function debugMenu(param1:Boolean = true) : void
      {
         get_game().debugMenu.debugCompEdit(saveContent,new SaveContent(null,null));
      }
      
      public function chopTree(param1:String) : void
      {
         clearOutput();
         if(param1 == "Large Axe")
         {
            outputText("虽然这把超大的战斧在战斗中显得笨重，但对付一个不会动的目标肯定很有效。你进行了一次全力、沉重、不顾一切的挥击，将斧刃狠狠地砸进面前的树干中。它轻松地深深陷入；然而，你发现把它拔出来是一件乏味的事情。尽管如此，这显然是有效的，你能够及时完成两侧的砍伐，将树放倒。你砍掉树枝，将木材加工成更易于运输的形状，带着战利品上路。");
         }
         else
         {
            outputText("面对眼前的一棵树，你在两个点上挥动斧头，直到形成一个楔口，然后[walk]绕到另一侧，制造一个大得多的楔口。这是一个耗时的过程，需要消耗相当多的体力才能完成，但这种技术是可靠的" + (param1 == "Fel Axe" ? "，而且你用来完成这项工作的工具非常理想" : "") + "。树倒下了，最后将其砍成更易于运输的碎块的任务消耗了剩下的大部分时间。");
         }
         getWoodAndLeave(param1);
      }
      
      public function checkToolbox() : void
      {
         if(get_player().hasKeyItem("Carpenter\'s Toolbox"))
         {
            outputText("既然你有了工具箱，你应该可以开始建造你的小屋了。[pg]");
            outputText("你从工具箱里拿出了那本随附的书。书名是\"木匠指南\"，你翻开书。书中有好几百页，大部分页面上都配有插图，讲解如何使用工具以及如何建造各种项目。你一页一页地翻阅着这本书。[pg]");
            dynStats(DynStat.Inte(1));
            FlagDict_Impl_.arrayWriteInt(KFLAGS.flags,2004,5);
         }
         else
         {
            outputText("你缺少一个工具箱。也许有商店卖这个？[pg]");
         }
         doNext(playerMenu);
      }
      
      public function checkMaterials(param1:int = 0) : void
      {
         outputText("[pg-]");
         if(param1 == 1)
         {
            outputText("<b>");
         }
         outputText("钉子：" + get_player().keyItemv1("Carpenter\'s Toolbox") + "/" + maxNailSupply() + "\n");
         if(param1 == 1)
         {
            outputText("</b>");
         }
         if(param1 == 2)
         {
            outputText("<b>");
         }
         outputText("木材：" + FlagDict_Impl_.arrayReadInt(KFLAGS.flags,2005) + "/" + maxWoodSupply() + "\n");
         if(param1 == 2)
         {
            outputText("</b>");
         }
         if(param1 == 3)
         {
            outputText("<b>");
         }
         outputText("石头：" + FlagDict_Impl_.arrayReadInt(KFLAGS.flags,2267) + "/" + maxStoneSupply() + "\n");
         if(param1 == 3)
         {
            outputText("</b>");
         }
      }
      
      public function buildCabinPart4() : void
      {
         clearOutput();
         outputText("你可以继续建造你的小木屋。你要开始为你的小木屋铺设地板吗？（花费：200个钉子和50块木头。）[pg]");
         checkMaterials();
         if(get_player().hasKeyItem("Carpenter\'s Toolbox"))
         {
            if(get_player().keyItemv1("Carpenter\'s Toolbox") >= 200 && FlagDict_Impl_.arrayReadInt(KFLAGS.flags,2005) >= 50)
            {
               doYesNo(doCabinWork4,noThanks2);
            }
            else
            {
               errorNotEnough();
               doNext(playerMenu);
            }
         }
         else
         {
            errorNotHave();
            doNext(playerMenu);
         }
      }
      
      public function buildCabinPart3() : void
      {
         clearOutput();
         outputText("你可以继续建造你的小木屋。你要开始为你的小木屋安装门窗吗？（花费：100个钉子和50块木头。）\n");
         checkMaterials();
         if(get_player().hasKeyItem("Carpenter\'s Toolbox"))
         {
            if(get_player().keyItemv1("Carpenter\'s Toolbox") >= 100 && FlagDict_Impl_.arrayReadInt(KFLAGS.flags,2005) >= 50)
            {
               doYesNo(doCabinWork3,noThanks2);
            }
            else
            {
               errorNotEnough();
               doNext(playerMenu);
            }
         }
         else
         {
            errorNotHave();
            doNext(playerMenu);
         }
      }
      
      public function buildCabinPart2() : void
      {
         clearOutput();
         outputText("既然你已经打好了坚实的地基，是时候竖起墙壁和屋顶了。这需要大量的钉子，可能和工具箱能装下的一样多。你还需要相当多的木材，如果你的计算正确的话，大约需要75个单位。[pg]");
         outputText("你知道这将是漫长而艰苦的一天。[pg]");
         outputText("为了保护，你还需要一些油漆。[pg]");
         outputText("竖起墙壁和屋顶？（成本：200个钉子和75个木材）[pg]");
         checkMaterials();
         if(get_player().hasKeyItem("Carpenter\'s Toolbox"))
         {
            if(get_player().keyItemv1("Carpenter\'s Toolbox") >= 200 && FlagDict_Impl_.arrayReadInt(KFLAGS.flags,2005) >= 75)
            {
               doYesNo(doCabinWork2Part1,noThanks2);
            }
            else
            {
               errorNotEnough();
               doNext(playerMenu);
            }
         }
         else
         {
            errorNotHave();
            doNext(playerMenu);
         }
      }
      
      public function buildCabinPart1() : void
      {
         if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,2005) < 10 && !get_player().hasKeyItem("Carpenter\'s Toolbox"))
         {
            outputText("没有任何工具和木材，你永远无法启动这个项目。在开始之前，你需要这两样东西。木材很容易找到；附近就有一片森林。工具可能有点棘手……");
            doNext(playerMenu);
            return;
         }
         outputText("你有了工具和完成的图纸。现在你终于可以开始建小屋了。你需要建造的第一件事是地基和地板。你清理出的空地上有足够的毛石来建造一些简单的石墩。[pg]");
         outputText("你估计建造地板大约需要100根钉子和50单位的木材。你想现在开始吗？[pg]");
         checkMaterials();
         if(get_player().keyItemv1("Carpenter\'s Toolbox") >= 100 && FlagDict_Impl_.arrayReadInt(KFLAGS.flags,2005) >= 50)
         {
            doYesNo(doCabinWork1,noThanks2);
         }
         else
         {
            errorNotEnough();
            doNext(playerMenu);
         }
      }
      
      public function attemptIceChopping() : void
      {
         clearOutput();
         outputText("你[if (silly) {觉得你要尝试一种天真——呃，尼芙式的伐木方法，于是你}]准备好了你的冰冻斧。附魔的冰霜比普通的冰耐用得多，你重重地将它挥向树皮，斧刃没入将近半个手掌的深度。一个不错的开始，直到你试图把它拔出来。木头的纤维刮擦着冰面，摩擦力很难克服。经过一段时间的拉扯，你终于把斧刃拔了出来。你深吸一口气，决定再次挥击，同样将它卡了进去。不过这一次，斧头更湿润了，拔出来也稍微容易了一些。你心想，再来一次，然后用尽全力砍向树干。第一刀完成了，是时候砍第二刀并形成第一个楔口了。");
         outputText("[pg]当你试图拔出斧头时，斧柄折断了。");
         IceWeapon.removeAllIceWeapons();
         doNext(gatherWoods);
      }
   }
}

