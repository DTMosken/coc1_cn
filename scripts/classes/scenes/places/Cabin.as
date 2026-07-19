package classes.scenes.places
{
   import classes.BaseContent;
   import classes.CoC;
   import classes.DynStat;
   import classes.ImageManager;
   import classes.ItemSlot;
   import classes.PerkLib;
   import classes.Player;
   import classes._FlagDict.FlagDict_Impl_;
   import classes.globalFlags.KFLAGS;
   import classes.internals.Utils;
   import classes.items.UseableLib;
   import classes.scenes.Camp;
   import classes.scenes.Inventory;
   import coc.view.CoCButton;
   import flash.Boot;
   import haxe.IMap;
   
   public class Cabin extends BaseContent
   {
      
      public static var BEDBEARS_MAX:int = 10;
      
      public static var STAND:int = 0;
      
      public static var BED:int = 1;
      
      public static var DESK:int = 2;
      
      public function Cabin()
      {
         if(Boot.skip_constructor)
         {
            return;
         }
         super();
      }
      
      public function waitButton(param1:int = 9) : void
      {
         var _g:Camp;
         addButton(param1,"等待",get_camp().doWait).hint("等待4个小时。[pg]按住Shift点击可等待至夜幕降临。");
         if(get_player().get_fatigue() > 30 || get_player().get_hp100() <= 90)
         {
            addButton(param1,"休息",get_camp().rest);
         }
         if(get_game().time.hours >= 21 || get_game().time.hours < 6)
         {
            _g = get_camp();
            addButton(param1,"睡觉",function():void
            {
               _g.doSleep();
            }).hint("休息一晚");
         }
      }
      
      public function studyPorn() : void
      {
         clearOutput();
         outputText("你从书架上拿下那本明显标着色情内容的书。你环顾四周，确保自己有绝对的隐私。[pg]");
         outputText("你舔了舔嘴唇，翻阅着书页，欣赏着里面相当……细致的插图。一个蜂女被一群小恶魔轮奸，一个牛头人被两个地精口交……画师的脑子里绝对装满了下流的东西。随着你翻动书页，你注意到周围的空气似乎变热了一些；你把这归结为天气原因，直到你看完并合上书。[pg]");
         dynStats(DynStat.Lib(2),DynStat.Lust(20 + get_player().lib / 10));
         outputText("你的脑海里已经充满了性欲。你把那本色情书放回了书架。");
         doNext(get_camp().returnToCampUseOneHour);
      }
      
      public function studyEtiquetteGuide() : void
      {
         clearOutput();
         outputText("你从书架上拿下一本名为“礼仪指南”的书");
         switch(readLocation())
         {
            case 1:
               outputText("然后坐在床上");
               break;
            case 2:
               outputText("然后坐在椅子上，把书放在书桌上");
               break;
            default:
               outputText("");
         }
         outputText("。你翻开书，开始研读里面的内容。[pg]");
         outputText("你仔细阅读这本奇怪的书，试图改善自己的举止，尽管你对书中描绘的刻板印象感到有些冒犯。不过，这本书在如何面对下流的挑逗时保持贞洁和礼仪方面，确实有一些好主意。[pg]");
         dynStats(DynStat.Lib(-2),DynStat.Cor(-2));
         outputText("读完这本花哨的书后，你小心翼翼地把它放回书架上。");
         doNext(get_camp().returnToCampUseOneHour);
      }
      
      public function studyCombatManual() : void
      {
         clearOutput();
         outputText("你从书架上拿下一本名为“战斗手册”的书");
         switch(readLocation())
         {
            case 1:
               outputText("然后坐在床上");
               break;
            case 2:
               outputText("然后坐在椅子上，把书放在书桌上");
         }
         outputText("。你翻开书，开始研读里面的内容。[pg]");
         var _loc1_:Number = Utils.rand(3);
         if(_loc1_ == 0)
         {
            outputText("你学到了几种看起来相当有用的新防御姿势。");
            dynStats(DynStat.Tou(2));
         }
         else if(_loc1_ == 1)
         {
            outputText("快速浏览一遍后，你翻到了书的末尾。你没有学到任何新的战斗招式，但对战斗和策略的整体机制和流程的复习还是很有帮助的。");
            dynStats(DynStat.Inte(2));
         }
         else
         {
            outputText("通读这本手册让你深入了解了如何在不暴露破绽的情况下，将更多的体重投入到攻击中。非常有用。");
            dynStats(DynStat.Str(2));
         }
         outputText("[pg]从这本破书里学完你能学到的东西后，你合上书，把它放回书架上。");
         doNext(get_camp().returnToCampUseOneHour);
      }
      
      public function spiderBedding() : void
      {
         clearOutput();
         outputText("你把你现在的床单换成了不死裁缝为你制作的蜘蛛丝床单。它们有一种奢华光滑、清新的感觉，换完后，它们的设计成为了你床铺的点睛之笔。你会睡得像皇室一样。");
         resetBeddingPerks();
         get_player().createPerk(PerkLib.SpiderBedding);
         doNext(enterCabin);
      }
      
      public function set_bedBears(param1:int) : int
      {
         FlagDict_Impl_.arrayWriteInt(KFLAGS.flags,2796,Utils.boundInt(0,param1,10));
         return param1;
      }
      
      public function setAlarm(param1:int = 6) : void
      {
         clearOutput();
         outputText("闹钟已设置为在早上" + param1 + "点响起。");
         FlagDict_Impl_.arrayWriteInt(KFLAGS.flags,2114,param1);
         doNext(enterCabin);
      }
      
      public function resetBeddingPerks() : void
      {
         get_player().removePerk(PerkLib.MothBedding);
         get_player().removePerk(PerkLib.SpiderBedding);
      }
      
      public function readYGuide() : void
      {
         clearOutput();
         outputText("当你伸手去书架上拿瑜伽指南时，你突然意识到你根本没有把它放在那里，而是带在身上。你纳闷这是为什么？也许在旅途中会有用？[pg]");
         if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,244) == 1)
         {
            outputText("翻了几页后，你不得不承认你完全看不懂这本书里的内容。也许它需要读者已经熟悉瑜伽的基础知识？[pg]");
            outputText("也许你应该把它带给健身房的科顿？");
         }
         else if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,244) == 3)
         {
            if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,176) == 0)
            {
               outputText("虽然科顿能从这本书里学到一些东西，但你仍然很难理解它。更何况你甚至还没有练过瑜伽。也许你应该去健身房拜访一下科顿？");
            }
            else if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,176) == 1)
            {
               outputText("既然你已经上过第一节瑜伽课了，你终于能看懂这本书的一部分了。虽然这还不足以让你自己练习瑜伽，但这是一个好的开始。你有一种感觉，更多的瑜伽课会帮助你更好地掌握这本书试图教授的内容。[pg]");
            }
            else if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,176) >= 2 && FlagDict_Impl_.arrayReadInt(KFLAGS.flags,176) < 5)
            {
               outputText("既然你已经上过几节瑜伽课了，你可以自己练习书上介绍的一些较简单的姿势了。你确信，如果你继续参加瑜伽课，你将掌握书上展示的所有姿势。[pg]");
               get_player().modTone(52,1);
               get_player().changeFatigue(20);
               dynStats(DynStat.Spe(0.5));
            }
            else if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,176) >= 5)
            {
               outputText("在和科顿上了许多节瑜伽课后，你现在甚至能掌握书上介绍的最难的姿势了。经过大约一个小时的强化瑜伽练习后，你让自己休息一下。[pg]");
               get_player().modTone(52,1);
               get_player().changeFatigue(20);
               dynStats(DynStat.Spe(1.1));
            }
         }
         doNext(get_camp().returnToCampUseOneHour);
      }
      
      public function readTGuide() : void
      {
         clearOutput();
         outputText("出于某种原因，你决定再看一眼《旅行者指南》。[pg]");
         outputText("那个疯狂的商人说你可能不需要这个，他是对的。这本书写得非常简单，显然是为那些从未离开过城墙的城市居民准备的。书中充斥着幼稚的插图和愚蠢的短语，从告诉人们他们需要什么以及该做什么的意义上来说，这本书提供了信息，但天真地淡化了森林和强盗的危险。如果不是这么便宜，你肯定会对那个商人发火。然而，他说得对，把这个给那些对道路危险一无所知的白痴，可以省去回答一堆愚蠢问题的时间。");
         outputText("[pg]你叹了口气，想知道自己为什么又要读这东西。……至少它没花你太多时间。");
         menu();
         addButton(0,"继续",enterCabin);
      }
      
      public function readLocation() : int
      {
         if(get_hasDesk() && get_hasDeskChair())
         {
            return 2;
         }
         if(get_hasBed())
         {
            return 1;
         }
         return 0;
      }
      
      public function readHComic() : void
      {
         clearOutput();
         outputText("当你把手伸向书架去拿你的变态漫画时，你突然想到你根本就没有把它放在那里，而是还带在身上。你想知道为什么？也许它在你的旅行中会有用？[pg]");
         outputText("你仔细阅读了这本色情书。故事讲述了一群姐妹，她们都有着大得不可思议的胸部，而且同样饥渴，为了满足自己的欲望，她们不断地陷入各种不幸的遭遇中。虽然这本漫画非常有趣，而且色情程度极高，但你还是忍不住对故事和所有角色的夸张程度感到好笑。如果世界真的像书里那样，人类余生都会像发情的长耳大野兔一样疯狂交配，什么事也做不成。虽然这确实是一个诱人的提议，但每个人总有精疲力竭的时候。");
         outputText("[pg]由于你还记得部分内容，这次的效果有所减弱。");
         outputText("[pg]看完后，你把变态漫画放回了[inv]里。");
         dynStats(DynStat.Lib(1),DynStat.Lust(15));
         doNext(get_camp().returnToCampUseOneHour);
      }
      
      public function readDPlants() : void
      {
         clearOutput();
         outputText("你把手伸向书架，从中取出了那本标有“危险植物”的书。虽然你很确定自己还记得其中的大部分内容，但也许再读一遍仍然会有所收获？");
         outputText("[pg]在这个时代，你觉得自己能识字算是很幸运了。在读这本书时，识字确实派上了用场。这本书显然是由见多识广——但渴望女人——的男人写的，叙述沉闷地陈述了世界上各种类型的有毒和食肉植物。其中真正吸引你的一章是关于“侵犯植物”的。这一章喋喋不休地讲述了一整类经过特殊培育的植物，它们的目的是折磨或吸食人类，而不会对他们造成永久性伤害和杀害。这些植物中的大多数都试图与人类交配，并且对人类生殖的复杂性过于迟钝，除了给人带来无尽的折磨之外，没有任何价值。这些植物从巨大的蹒跚怪物到附着在人身上的小型动植物混合体不等。当你读完这本书时，你忍不住对外面许多不自然的植物种类感到不寒而栗，并想知道是哪个变态创造了这样的怪物。");
         outputText("[pg]读完后，你默默地合上了书。虽然你觉得没有学到任何新东西，但偶尔读一本写得很好的书感觉还是不错的。");
         dynStats(DynStat.Inte(0.1));
         doNext(get_camp().returnToCampUseOneHour);
      }
      
      public function numberOfBooks() : Number
      {
         var _loc1_:Number = 0;
         _loc1_++;
         if(get_player().hasKeyItem("Dangerous Plants"))
         {
            _loc1_++;
         }
         if(get_player().hasKeyItem("Traveler\'s Guide"))
         {
            _loc1_++;
         }
         if(get_player().hasKeyItem("Hentai Comic"))
         {
            _loc1_++;
         }
         if(get_player().hasKeyItem("Yoga Guide"))
         {
            _loc1_++;
         }
         if(get_player().hasKeyItem("Carpenter\'s Toolbox"))
         {
            _loc1_++;
         }
         if(get_player().hasKeyItem("Izma\'s Book - Combat Manual"))
         {
            _loc1_++;
         }
         if(get_player().hasKeyItem("Izma\'s Book - Etiquette Guide"))
         {
            _loc1_++;
         }
         if(get_player().hasKeyItem("Izma\'s Book - Porn"))
         {
            _loc1_++;
         }
         return _loc1_;
      }
      
      public function normalBedding() : void
      {
         clearOutput();
         outputText("你拿出你那朴素的床单，把它们放回床上。虽然它们可能没什么特别的，但把它们换回来总让人感到一种莫名的安心。");
         resetBeddingPerks();
         doNext(enterCabin);
      }
      
      public function mothBedding() : void
      {
         clearOutput();
         outputText("你把旧寝具换成了从玛瑞斯那里得到的丝绸床单。完成后，你感到一种满足感，但总觉得这里似乎有什么东西和你在一起。[b: 你感到自己莫名地变得更强了。]");
         resetBeddingPerks();
         get_player().createPerk(PerkLib.MothBedding);
         doNext(enterCabin);
      }
      
      public function menuStudy() : void
      {
         clearOutput();
         menu();
         outputText("你的书架上目前有以下书籍：");
         outputText("[pg]百科 - 描述了玛瑞斯的一些奇特之处。\n");
         addButton(0,"百科",get_camp().codex.accessCodexMenu).hint("阅读有关玛瑞斯的一些奇特之处。");
         if(get_player().hasKeyItem("Dangerous Plants"))
         {
            outputText("危险植物 - 一本介绍玛瑞斯一些奇特植物的书。\n");
            addButton(1,"危险植物",readDPlants).hint("这是一本名为《危险植物》的书。正如书名所述，这本书记载了关于这个领域各种危险植物的信息。");
         }
         if(get_player().hasKeyItem("Traveler\'s Guide"))
         {
            outputText("《旅行者指南》 - 一本非常基础的玛瑞斯注意事项指南。\n");
            addButton(2,"《旅行者指南》",readTGuide).hint("这本旅行者指南与其说是一本书，不如说是一本小册子，但它仍然包含了一些关于避免当地陷阱的有用信息。");
         }
         if(get_player().hasKeyItem("Hentai Comic"))
         {
            outputText("变态漫画——一本非典型的色情艺术品，与你在英格纳姆见过的任何东西都不同。\n");
            addButton(3,"变态漫画",readHComic).hint("这本画风奇特的漫画书里充满了私通、性爱和超大眼球的画面。");
         }
         if(get_player().hasKeyItem("Yoga Guide"))
         {
            outputText("瑜伽指南——一本为体型异常者准备的瑜伽指导书。\n");
            addButton(4,"瑜伽指南",readYGuide).hint("这本皮面装订的书名为《非人型生物瑜伽》。里面有许多半人马、娜迦以及各种其他奇特体型生物摆出各种姿势的插图。");
         }
         if(get_player().hasKeyItem("Carpenter\'s Toolbox"))
         {
            outputText("木匠手册——你建造新东西时的可靠助手。\n");
            addButtonDisabled(5,"木匠手册","除非你正在积极建造什么东西，否则你真的找不到任何理由去读它。");
         }
         if(get_player().hasKeyItem("Izma\'s Book - Combat Manual"))
         {
            outputText("战斗手册——一本你从伊兹玛那里买来的战斗指导小册子。\n");
            addButton(6,"C.Manual",studyCombatManual);
         }
         if(get_player().hasKeyItem("Izma\'s Book - Etiquette Guide"))
         {
            outputText("礼仪指南——关于如何成为一个友善的玛瑞斯人的指导。从伊兹玛处购买\n");
            addButton(7,"E.Guide",studyEtiquetteGuide);
         }
         if(get_player().hasKeyItem("Izma\'s Book - Porn"))
         {
            outputText("色情杂志——从伊兹玛处购买的自慰辅助用品。\n");
            addButton(8,"色情杂志",studyPorn);
         }
         outputText("\n你想学习哪本书？");
         addButton(14,"返回",enterCabin);
      }
      
      public function menuFurniture() : void
      {
         menu();
         clearOutput();
         outputText("你想建造什么家具？[pg]");
         get_camp().cabinProgress.checkMaterials();
         if(!get_hasBed() && !get_hasTable() && !get_hasBookshelf() && !get_hasDesk())
         {
            outputText("[pg]你的小屋空空如也。[pg]");
         }
         if(get_hasBed() && get_hasNightstand() && get_hasDresser() && get_hasTable() && get_hasTableChair1() && get_hasTableChair2() && get_hasBookshelf() && get_hasDesk() && get_hasDeskChair())
         {
            outputText("[pg]你已经建造了所有可用的家具！[pg]");
         }
         if(!get_hasBed())
         {
            addButton(0,"床",constructFurnitureBedPrompt);
         }
         if(get_hasBed() && !get_hasNightstand())
         {
            addButton(1,"床头柜",constructFurnitureNightstandPrompt);
         }
         if(get_hasBed() && !get_hasDresser())
         {
            addButton(2,"梳妆台",constructFurnitureDresserPrompt);
         }
         if(!get_hasTable())
         {
            addButton(3,"桌子",constructFurnitureTablePrompt);
         }
         if(get_hasTable() && (!get_hasTableChair1() || !get_hasTableChair2()))
         {
            addButton(4,"椅子",constructFurnitureChairPrompt);
         }
         if(!get_hasBookshelf())
         {
            addButton(5,"书架",constructFurnitureBookshelfPrompt);
         }
         if(!get_hasDesk())
         {
            addButton(6,"书桌",constructFurnitureDeskPrompt);
         }
         if(get_hasDesk() && !get_hasDeskChair())
         {
            addButton(7,"书桌椅",constructFurnitureChairForDeskPrompt);
         }
         addButton(14,"返回",enterCabin);
      }
      
      public function menuAlarm() : void
      {
         var timeSet3:int;
         var _g3:Cabin;
         var timeSet2:int;
         var _g2:Cabin;
         var timeSet1:int;
         var _g1:Cabin;
         var timeSet:int;
         var _g:Cabin;
         clearOutput();
         outputText("设置你希望闹钟叫醒你的时间。");
         outputText("[pg]注意：在某些情况下，例如与某些同伴一起睡觉时，将不会使用闹钟。");
         menu();
         _g = this;
         timeSet = 6;
         addButton(0,"早上6点",function():void
         {
            _g.setAlarm(timeSet);
         });
         _g1 = this;
         timeSet1 = 7;
         addButton(1,"早上7点",function():void
         {
            _g1.setAlarm(timeSet1);
         });
         _g2 = this;
         timeSet2 = 8;
         addButton(2,"早上8点",function():void
         {
            _g2.setAlarm(timeSet2);
         });
         _g3 = this;
         timeSet3 = 9;
         addButton(3,"早上9点",function():void
         {
            _g3.setAlarm(timeSet3);
         });
         addButton(14,"返回",enterCabin);
      }
      
      public function hasBedding() : Boolean
      {
         if(!get_player().hasKeyItem("Moth Bedding"))
         {
            return get_player().hasKeyItem("Spider-Silk Bedding");
         }
         return true;
      }
      
      public function get_hasTableChair2() : Boolean
      {
         return FlagDict_Impl_.arrayReadInt(KFLAGS.flags,2011) > 0;
      }
      
      public function get_hasTableChair1() : Boolean
      {
         return FlagDict_Impl_.arrayReadInt(KFLAGS.flags,2010) > 0;
      }
      
      public function get_hasTable() : Boolean
      {
         return FlagDict_Impl_.arrayReadInt(KFLAGS.flags,2009) > 0;
      }
      
      public function get_hasNightstand() : Boolean
      {
         return FlagDict_Impl_.arrayReadInt(KFLAGS.flags,2007) > 0;
      }
      
      public function get_hasDresser() : Boolean
      {
         return FlagDict_Impl_.arrayReadInt(KFLAGS.flags,2008) > 0;
      }
      
      public function get_hasDeskChair() : Boolean
      {
         return FlagDict_Impl_.arrayReadInt(KFLAGS.flags,2013) > 0;
      }
      
      public function get_hasDesk() : Boolean
      {
         return FlagDict_Impl_.arrayReadInt(KFLAGS.flags,2012) > 0;
      }
      
      public function get_hasBookshelf() : Boolean
      {
         return FlagDict_Impl_.arrayReadInt(KFLAGS.flags,2014) > 0;
      }
      
      public function get_hasBed() : Boolean
      {
         return FlagDict_Impl_.arrayReadInt(KFLAGS.flags,2006) > 0;
      }
      
      public function get_bedBears() : int
      {
         return Utils.boundInt(0,FlagDict_Impl_.arrayReadInt(KFLAGS.flags,2796),10);
      }
      
      public function enterCabin() : void
      {
         var _gthis:Cabin;
         var _loc1_:int = 0;
         var _loc2_:Number = NaN;
         _gthis = this;
         menu();
         clearOutput();
         get_images().showImage("location-cabin");
         outputText("[bu: 你的小屋]\n");
         outputText("你在你的小屋里。你身后是一扇通往营地的门。门旁边有一扇窗户，可以让阳光照进来。");
         if(get_hasBed())
         {
            outputText("[pg]你的床在其中一个角落里。它是由木制框架构成的，框架上铺着床垫。上面盖着床单。一个枕头靠在床头板上。");
            if(get_bedBears() > 0)
            {
               bedBearDesc();
            }
            if(get_inventory().itemStorageSize() > 0)
            {
               _loc1_ = 0;
               if(get_player().hasKeyItem("Camp - Chest"))
               {
                  _loc1_++;
               }
               if(get_player().hasKeyItem("Camp - Murky Chest"))
               {
                  _loc1_++;
               }
               if(get_player().hasKeyItem("Camp - Ornate Chest"))
               {
                  _loc1_++;
               }
               outputText("你的储物" + (_loc1_ == 1 ? "箱" : "箱") + "放在你的床前。");
            }
         }
         if(get_hasNightstand())
         {
            outputText("[pg]你的床边放着一个床头柜。");
            if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,2113) > 0)
            {
               outputText("你的床头柜上放着一个闹钟。它目前设置为在上午" + FlagDict_Impl_.arrayReadInt(KFLAGS.flags,2114) + "点响起。");
            }
            if(get_player().hasKeyItem("Equipment Storage - Jewelry Box") && !get_hasDresser())
            {
               outputText("你的床头柜上放着一个首饰盒。");
            }
         }
         if(get_hasDresser())
         {
            outputText("[pg]你的梳妆台靠在床对面的墙上。");
            if(get_player().hasKeyItem("Equipment Storage - Jewelry Box"))
            {
               outputText("你的首饰盒存放在梳妆台里。");
            }
         }
         if(get_hasTable())
         {
            outputText("[pg]窗户旁边放着一张桌子。");
            if(get_hasTableChair1() && !get_hasTableChair2())
            {
               outputText("桌子旁放着一把椅子。");
            }
            if(get_hasTableChair1() && get_hasTableChair2())
            {
               outputText("桌子两边各放着一把椅子。");
            }
         }
         if(get_hasBookshelf())
         {
            _loc2_ = numberOfBooks();
            outputText("[pg]门对面的角落里放着一个书架。它目前存放着 " + Utils.num2Text(_loc2_) + " 本书");
            if(_loc2_ > 1)
            {
               outputText("");
            }
            outputText("。");
         }
         if(get_hasDesk())
         {
            if(get_hasBookshelf())
            {
               outputText("[pg]书架旁边放着一张书桌。");
            }
            else
            {
               outputText("[pg]门对面的角落里放着一张书桌。");
            }
            outputText("它有一个抽屉，用来存放书写和学习用品。");
            if(get_hasDeskChair())
            {
               outputText("书桌下塞着一把做工精良的椅子。它为你提供了一个坐下来学习的地方。");
            }
         }
         if(get_game().forest.kitsuneScene.saveContent.statueLocation != "")
         {
            outputText("[pg]你从森林神龛里拿来的金色雕像放在" + (get_game().forest.kitsuneScene.saveContent.statueLocation == "corner" ? "你卧室的角落里" : "你的" + get_game().forest.kitsuneScene.saveContent.statueLocation + "上") + "，它的九条尾巴在[sun]光下闪闪发光。");
         }
         get_game().akky.locationDesc("小屋",true,false);
         outputText("[pg]你想做些什么？");
         if(get_hasBookshelf())
         {
            addButton(0,"书架",menuStudy).hint("看看你书架上目前有哪些书。这包括你的百科。");
         }
         else
         {
            addButton(0,"百科",get_camp().codex.accessCodexMenu).hint("阅读有关玛瑞斯的一些奇特之处。");
         }
         if(get_hasNightstand() && FlagDict_Impl_.arrayReadInt(KFLAGS.flags,2113) > 0)
         {
            addButton(1,"设置闹钟",menuAlarm).hint("你可以使用这个时钟来调整你的起床时间。");
         }
         addButton(2,"物品栏",get_inventory().inventoryMenu).hint("查看或使用你的物品。");
         addButton(3,"储藏",get_inventory().stash).hint("你的藏匿处为许多不同种类的物品提供安全（或相对安全）的存储空间。");
         addButton(4,"家具",menuFurniture).hint("为你的小屋制作一些新家具，或者只是看看你存放的建筑材料。");
         if(get_camp().petsCount() > 0)
         {
            addButton(5,"宠物",cabinPetsMenu).hint("查看你拥有的任何宠物并与它们互动。");
         }
         if(get_hasBed() && (get_player().hasItem(get_useables().TELBEAR) || get_bedBears() > 0))
         {
            addButton(6,"泰迪熊",cabinBearMenu);
         }
         if(get_game().forest.kitsuneScene.saveContent.statueLocation != "")
         {
            addButton(7,"冥想",get_game().forest.kitsuneScene.meditateLikeAKitsuneEhQuestionMark).hint("向雕像祈祷。");
            addButton(8,"拿走雕像",function():void
            {
               _gthis.get_inventory().takeItem(_gthis.get_useables().GLDSTAT,_gthis.enterCabin);
               _gthis.get_game().forest.kitsuneScene.saveContent.statueLocation = "";
            }).hint("将雕像放入你的[inv]中。");
         }
         waitButton(9);
         if(hasBedding())
         {
            addNextButton("床品菜单",beddingMenu).hint("更换你当前的床品");
         }
         addButton(14,"离开小屋",playerMenu).hint("回到营地的外部区域。");
      }
      
      public function constructFurnitureTablePrompt() : void
      {
         clearOutput();
         outputText("你想制作一张桌子吗？（花费：20个钉子和15块木头。）[pg]");
         get_camp().cabinProgress.checkMaterials();
         if(get_player().hasKeyItem("Carpenter\'s Toolbox"))
         {
            if(get_player().keyItemv1("Carpenter\'s Toolbox") >= 20 && FlagDict_Impl_.arrayReadInt(KFLAGS.flags,2005) >= 15)
            {
               doYesNo(constructFurnitureTable,menuFurniture);
            }
            else
            {
               get_camp().cabinProgress.errorNotEnough();
               doNext(playerMenu);
            }
         }
         else
         {
            get_camp().cabinProgress.errorNotHave();
            doNext(playerMenu);
         }
      }
      
      public function constructFurnitureTable() : void
      {
         clearOutput();
         outputText("做一张桌子看起来相当容易，");
         if(get_hasDesk())
         {
            outputText("而且你已经做过一张书桌了，");
         }
         outputText("所以你考虑跳过说明书，但最后还是决定看一眼木匠手册。[pg]");
         outputText("一开始，你从你的木材堆里挑了几块合适的木头，把它们锯成合适的长度。然后你把未来的桌腿钉在未来的桌面上。完成后，你用工具箱里找到的油漆给你的新桌子刷上漆，结束了你的工作。[pg]");
         outputText("油漆干得很快，总共花了一个小时，你的桌子就完成了。[pg]");
         outputText("[b: 你已经完成了新桌子的建造！][pg]");
         get_player().addKeyValue("Carpenter\'s Toolbox",1,-20);
         var _loc1_:IMap = KFLAGS.flags;
         FlagDict_Impl_.arrayWriteInt(_loc1_,2005,FlagDict_Impl_.arrayReadInt(_loc1_,2005) - 15);
         FlagDict_Impl_.arrayWriteInt(KFLAGS.flags,2009,1);
         get_player().changeFatigue(50);
         doNext(get_camp().returnToCampUseOneHour);
      }
      
      public function constructFurnitureNightstandPrompt() : void
      {
         clearOutput();
         outputText("你想制作一个床头柜吗？（花费：20个钉子和10个木材。）[pg]");
         get_camp().cabinProgress.checkMaterials();
         if(get_player().hasKeyItem("Carpenter\'s Toolbox"))
         {
            if(get_player().keyItemv1("Carpenter\'s Toolbox") >= 20 && FlagDict_Impl_.arrayReadInt(KFLAGS.flags,2005) >= 10)
            {
               doYesNo(constructFurnitureNightstand,menuFurniture);
            }
            else
            {
               get_camp().cabinProgress.errorNotEnough();
               doNext(playerMenu);
            }
         }
         else
         {
            get_camp().cabinProgress.errorNotHave();
            doNext(playerMenu);
         }
      }
      
      public function constructFurnitureNightstand() : void
      {
         clearOutput();
         outputText("你拿起木工手册，寻找制作床头柜的说明。似乎有几种款式，你决定选择一种桌面下有几个抽屉的。[pg]");
         outputText("首先，你根据书上的尺寸把一些木头截成长条。接着，你把这些部件拼在一起，用锤子用力敲进几根钉子。最后，你用工具箱里找到的一些旧油漆给床头柜上色，让它看起来更精致一些。[pg]");
         outputText("油漆干得相对较快，你只花了一个小时就完成了床头柜！[pg]");
         outputText("[b: 你已经完成了新床头柜的制作！][pg]");
         get_player().addKeyValue("Carpenter\'s Toolbox",1,-20);
         var _loc1_:IMap = KFLAGS.flags;
         FlagDict_Impl_.arrayWriteInt(_loc1_,2005,FlagDict_Impl_.arrayReadInt(_loc1_,2005) - 10);
         FlagDict_Impl_.arrayWriteInt(KFLAGS.flags,2007,1);
         get_player().changeFatigue(20);
         doNext(get_camp().returnToCampUseOneHour);
      }
      
      public function constructFurnitureDresserPrompt() : void
      {
         clearOutput();
         outputText("你想制作一个梳妆台吗？（花费：50个钉子和30个木材。）[pg]");
         get_camp().cabinProgress.checkMaterials();
         if(get_player().hasKeyItem("Carpenter\'s Toolbox"))
         {
            if(get_player().keyItemv1("Carpenter\'s Toolbox") >= 50 && FlagDict_Impl_.arrayReadInt(KFLAGS.flags,2005) >= 30)
            {
               doYesNo(constructFurnitureDresser,menuFurniture);
            }
            else
            {
               get_camp().cabinProgress.errorNotEnough();
               doNext(playerMenu);
            }
         }
         else
         {
            get_camp().cabinProgress.errorNotHave();
            doNext(playerMenu);
         }
      }
      
      public function constructFurnitureDresser() : void
      {
         clearOutput();
         outputText("为了更好地存放一些衣服，你决定制作一个储物柜。你拿起木工手册，开始寻找合适的家具。最终，你发现了一个简单但实用的梳妆台，并决定制作它。[pg]");
         outputText("你首先把一些木头截成合适的长度，然后把它们拼在一起，用钉子固定好。完成这部分后，你尝试制作几个抽屉，但第一次尝试并不成功。不过你有足够的木材再试一次，你制作的下一个抽屉刚好合适。再制作两个后，你给它们加上把手，然后把它们放进梳妆台的插槽里。[pg]");
         outputText("最后，你用工具箱里找到的一点油漆给你的新作品上色，让它看起来不那么粗糙。[pg]");
         outputText("幸运的是，油漆干得相当快。话又说回来，它本来就很干。你花了两个小时，现在你的梳妆台完成了。[pg]");
         outputText("[b: 你已经完成了新梳妆台的制作！]\n（你可以在里面存放一些内衣。）[pg]");
         get_player().addKeyValue("Carpenter\'s Toolbox",1,-50);
         var _loc1_:IMap = KFLAGS.flags;
         FlagDict_Impl_.arrayWriteInt(_loc1_,2005,FlagDict_Impl_.arrayReadInt(_loc1_,2005) - 30);
         FlagDict_Impl_.arrayWriteInt(KFLAGS.flags,2008,1);
         get_player().changeFatigue(60);
         doNext(get_camp().returnToCampUseOneHour);
      }
      
      public function constructFurnitureDeskPrompt() : void
      {
         clearOutput();
         outputText("你想建造一张书桌吗？(花费：60个钉子和20份木材。)[pg]");
         get_camp().cabinProgress.checkMaterials();
         if(get_player().hasKeyItem("Carpenter\'s Toolbox"))
         {
            if(get_player().keyItemv1("Carpenter\'s Toolbox") >= 60 && FlagDict_Impl_.arrayReadInt(KFLAGS.flags,2005) >= 20)
            {
               doYesNo(constructFurnitureDesk,menuFurniture);
            }
            else
            {
               get_camp().cabinProgress.errorNotEnough();
               doNext(playerMenu);
            }
         }
         else
         {
            get_camp().cabinProgress.errorNotHave();
            doNext(playerMenu);
         }
      }
      
      public function constructFurnitureDesk() : void
      {
         clearOutput();
         get_player().addKeyValue("Carpenter\'s Toolbox",1,-60);
         var _loc1_:IMap = KFLAGS.flags;
         FlagDict_Impl_.arrayWriteInt(_loc1_,2005,FlagDict_Impl_.arrayReadInt(_loc1_,2005) - 20);
         outputText("做一张书桌似乎很容易，");
         if(get_hasTable())
         {
            outputText("而且你已经做过一张桌子了，");
         }
         outputText("所以你考虑跳过说明书，但最后还是决定看一眼木匠手册。[pg]");
         outputText("一开始，你从你的储藏处挑选了几块合适的木头，把它们截成合适的长度。然后你把未来的桌腿钉在未来的桌面上。完成后，你继续你的工作，用你在工具箱里找到的油漆粉刷你的新书桌。[pg]");
         outputText("因为你想让你的书桌有一个抽屉，所以你用一点木头做了一个，钉好后也给它刷了漆。[pg]");
         outputText("油漆一干，你就完工了。从开始到结束只花了你两个小时。[pg]");
         outputText("[b: 你已经完成了新书桌的建造！][pg]");
         FlagDict_Impl_.arrayWriteInt(KFLAGS.flags,2012,1);
         get_player().changeFatigue(60);
         doNext(get_camp().returnToCampUseTwoHours);
      }
      
      public function constructFurnitureChairPrompt() : void
      {
         clearOutput();
         outputText("你想建造一把椅子吗？(花费：40个钉子和10份木材。)[pg]");
         get_camp().cabinProgress.checkMaterials();
         if(get_player().hasKeyItem("Carpenter\'s Toolbox"))
         {
            if(get_player().keyItemv1("Carpenter\'s Toolbox") >= 40 && FlagDict_Impl_.arrayReadInt(KFLAGS.flags,2005) >= 10)
            {
               doYesNo(constructFurnitureChair,menuFurniture);
            }
            else
            {
               get_camp().cabinProgress.errorNotEnough();
               doNext(playerMenu);
            }
         }
         else
         {
            get_camp().cabinProgress.errorNotHave();
            doNext(playerMenu);
         }
      }
      
      public function constructFurnitureChairForDeskPrompt() : void
      {
         clearOutput();
         outputText("你想建造一把椅子吗？(花费：40个钉子和10份木材。)[pg]");
         get_camp().cabinProgress.checkMaterials();
         if(get_player().hasKeyItem("Carpenter\'s Toolbox"))
         {
            if(get_player().keyItemv1("Carpenter\'s Toolbox") >= 40 && FlagDict_Impl_.arrayReadInt(KFLAGS.flags,2005) >= 10)
            {
               doYesNo(constructFurnitureChairForDesk,menuFurniture);
            }
            else
            {
               get_camp().cabinProgress.errorNotEnough();
               doNext(playerMenu);
            }
         }
         else
         {
            get_camp().cabinProgress.errorNotHave();
            doNext(playerMenu);
         }
      }
      
      public function constructFurnitureChairForDesk() : void
      {
         clearOutput();
         outputText("你下定决心要造一把椅子，于是你研究了木匠手册，学习如何着手去做。[pg]");
         outputText("首先，你挑选了几块木头，并根据它们的新用途调整了长度。在将它们对齐成椅子的形状后，你用有力的锤击将几根钉子钉入到位。作为最后的修饰，你用在工具箱里找到的旧油漆给它刷了一层。[pg]");
         outputText("经过短暂的干燥，你的椅子终于完成了，你只花了一个小时就完成了它。[pg]");
         outputText("[b: 你已经完成了新椅子的制作！][pg]");
         get_player().addKeyValue("Carpenter\'s Toolbox",1,-40);
         var _loc1_:IMap = KFLAGS.flags;
         FlagDict_Impl_.arrayWriteInt(_loc1_,2005,FlagDict_Impl_.arrayReadInt(_loc1_,2005) - 10);
         FlagDict_Impl_.arrayWriteInt(KFLAGS.flags,2013,1);
         get_player().changeFatigue(20);
         doNext(get_camp().returnToCampUseOneHour);
      }
      
      public function constructFurnitureChair() : void
      {
         clearOutput();
         outputText("你下定决心要造一把椅子，于是你研究了木匠手册，学习如何着手去做。[pg]");
         outputText("首先，你挑了几块木头，调整它们的长度以适应新的用途。把它们按照椅子的样子对齐后，你用有力的锤击把钉子钉到位。作为最后的润色，你用工具箱里找到的旧油漆给它刷上漆。[pg]");
         outputText("经过短暂的干燥，你的椅子终于完成了，你只花了一个小时就完成了它。[pg]");
         outputText("[b: 你已经完成了新椅子的制作！][pg]");
         get_player().addKeyValue("Carpenter\'s Toolbox",1,-40);
         var _loc1_:IMap = KFLAGS.flags;
         FlagDict_Impl_.arrayWriteInt(_loc1_,2005,FlagDict_Impl_.arrayReadInt(_loc1_,2005) - 10);
         if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,2010) >= 1)
         {
            FlagDict_Impl_.arrayWriteInt(KFLAGS.flags,2011,1);
         }
         else
         {
            outputText("[b: 当然，你可以再做一把椅子。][pg]");
            FlagDict_Impl_.arrayWriteInt(KFLAGS.flags,2010,1);
         }
         get_player().changeFatigue(20);
         doNext(get_camp().returnToCampUseOneHour);
      }
      
      public function constructFurnitureBookshelfPrompt() : void
      {
         clearOutput();
         outputText("你想制作一个书架吗？（花费：75个钉子和25块木头。）[pg]");
         get_camp().cabinProgress.checkMaterials();
         if(get_player().hasKeyItem("Carpenter\'s Toolbox"))
         {
            if(get_player().keyItemv1("Carpenter\'s Toolbox") >= 75 && FlagDict_Impl_.arrayReadInt(KFLAGS.flags,2005) >= 25)
            {
               doYesNo(constructFurnitureBookshelf,menuFurniture);
            }
            else
            {
               get_camp().cabinProgress.errorNotEnough();
               doNext(playerMenu);
            }
         }
         else
         {
            get_camp().cabinProgress.errorNotHave();
            doNext(playerMenu);
         }
      }
      
      public function constructFurnitureBookshelf() : void
      {
         clearOutput();
         outputText("有个地方能把书摆放整齐就好了。想到这里，你开始翻阅木匠手册，寻找制作书架的说明。[pg]");
         outputText("你从木柴堆里收集了适量的木材，开始将它们调整到所需的长度。你把木块对齐，然后用几根钉子将它们固定在一起。最后，你用工具箱里找到的旧油漆给它刷了一层，让它看起来更光滑。[pg]");
         outputText("油漆干得很快，仅仅两个小时，你的书架就完工了！这个新作品可以放三排书，但你怀疑自己能不能把它填满。在玛瑞斯，书似乎是一种稀缺商品。[pg]");
         outputText("[b: 你已经完成了新书架的建造！][pg-](现在可以通过你的新书架访问百科菜单了。)[pg]");
         if(get_player().hasKeyItem("Dangerous Plants") || get_player().hasKeyItem("Traveler\'s Guide") || get_player().hasKeyItem("Hentai Comic") || get_player().hasKeyItem("Yoga Guide"))
         {
            outputText("你花了一些时间把你已经拥有的书放进去。不过还是有很多空位。[pg]");
         }
         get_player().addKeyValue("Carpenter\'s Toolbox",1,-75);
         var _loc1_:IMap = KFLAGS.flags;
         FlagDict_Impl_.arrayWriteInt(_loc1_,2005,FlagDict_Impl_.arrayReadInt(_loc1_,2005) - 25);
         FlagDict_Impl_.arrayWriteInt(KFLAGS.flags,2014,1);
         get_player().changeFatigue(50);
         doNext(get_camp().returnToCampUseOneHour);
      }
      
      public function constructFurnitureBedPrompt() : void
      {
         clearOutput();
         outputText("你想建造一张床吗？（花费：45个钉子和25块木头。）[pg]");
         get_camp().cabinProgress.checkMaterials();
         if(get_player().hasKeyItem("Carpenter\'s Toolbox"))
         {
            if(get_player().keyItemv1("Carpenter\'s Toolbox") >= 45 && FlagDict_Impl_.arrayReadInt(KFLAGS.flags,2005) >= 25)
            {
               doYesNo(constructFurnitureBed,menuFurniture);
            }
            else
            {
               get_camp().cabinProgress.errorNotEnough();
               doNext(playerMenu);
            }
         }
         else
         {
            get_camp().cabinProgress.errorNotHave();
            doNext(playerMenu);
         }
      }
      
      public function constructFurnitureBed() : void
      {
         clearOutput();
         outputText("你从工具箱里拿出木工手册，翻到建造床的说明那页。仔细考虑了一会儿后，你决定做一个双人床，因为——考虑到这个世界的性质——你可能需要那额外的空间。你又读了一遍说明，然后决定开始动手。[pg]");
         outputText("你拿起一些木板，开始制作床架。把框架拼好后，你用钉子把它固定住。[pg]");
         outputText("接着，你加上一块木板来支撑床垫。");
         outputText("[pg]当你对床的成品感到满意后，你走到外面拿来你的铺盖卷。你毫不费力地把它改造成了床垫、床单和枕头。");
         outputText("[pg]总而言之，你花了两个小时才完成床的制作。[pg]");
         outputText("[b: 你的新床可以使用了！（睡眠恢复的生命值和疲劳值增加50%！）]");
         get_player().addKeyValue("Carpenter\'s Toolbox",1,-45);
         var _loc1_:IMap = KFLAGS.flags;
         FlagDict_Impl_.arrayWriteInt(_loc1_,2005,FlagDict_Impl_.arrayReadInt(_loc1_,2005) - 25);
         FlagDict_Impl_.arrayWriteInt(KFLAGS.flags,2006,1);
         get_player().changeFatigue(40);
         doNext(get_camp().returnToCampUseTwoHours);
      }
      
      public function cabinPetsMenu() : void
      {
         clearOutput();
         outputText("在这里，你可以与小屋里的任何宠物互动。");
         menu();
         if(get_game().akky.isOwned())
         {
            get_game().akky.menuButton(cabinPetsMenu,0,"小屋");
         }
         addButton(14,"返回",enterCabin);
      }
      
      public function cabinBearTake() : void
      {
         clearOutput();
         get_inventory().takeItem(get_useables().TELBEAR,null,null,null,false);
         set_bedBears(get_bedBears() - 1);
         outputText("你从床上拿起一只熊。");
         doNext(cabinBearMenu);
      }
      
      public function cabinBearSnuggle() : void
      {
         clearOutput();
         switch(get_bedBears())
         {
            case 0:
            case 1:
               outputText("你爬上床，紧紧抱住泰迪熊，把脸贴在它的头顶，摇晃着身体，将烦恼抛诸脑后。你满足地叹了口气，对着泰迪熊温柔地笑了笑，然后下了床" + (get_bedBears() == 0 ? "，并把它带在身边。" : "，把它重新塞回被窝里。"));
               break;
            case 2:
               outputText("你爬上床，将两只泰迪熊紧紧抱在怀里，一只胳膊搂着一只，把脸埋在它们中间，摇晃着身体，久久不愿松开。你满足地叹了口气，对着泰迪熊们温柔地笑了笑，然后下了床，让它们依偎在一起。");
               break;
            case 3:
            case 4:
            case 5:
            case 6:
            case 7:
            case 8:
            case 9:
               outputText("你爬进泰迪熊堆里，把它们聚拢成一个毛茸茸的拥抱堆，而你就在正中央。你把脸埋在温暖的绒毛里，紧紧地抱住它们，沉浸在这种感觉中，直到完全满足。你满足地叹了口气，对着泰迪熊们温柔地笑了笑，然后下了床。");
               break;
            default:
               outputText("你的床上已经堆满了毛茸茸的泰迪熊，你纵身一跃，加入了它们的行列。被这支毛茸茸的军队四面八方地簇拥着，世界上所有的敌意都烟消云散了。在你这毛茸茸的堡垒里，只有舒适、安全与和平。你张开双臂，尽可能多地抱住泰迪熊，最后紧紧地挤了挤它们，然后起身继续你的一天。");
         }
         doNext(enterCabin);
      }
      
      public function cabinBearMenu() : void
      {
         clearOutput();
         if(get_bedBears() > 0)
         {
            bedBearDesc();
         }
         if(get_player().hasItem(get_useables().TELBEAR))
         {
            if(get_bedBears() == 0)
            {
               outputText("你想让你的泰迪熊把你的床当成它的家吗？");
            }
            else if(get_bedBears() == 10)
            {
               outputText("[pg]没有空间放更多的熊了。");
            }
            else
            {
               outputText("[pg]你想给你熟睡的" + Utils.pluralize(get_bedBears(),"companion") + "一个新朋友吗？");
            }
         }
         menu();
         if(get_player().hasItem(get_useables().TELBEAR) && get_bedBears() < 10)
         {
            addNextButton("是",cabinBearAdd).hint(get_bedBears() == 0 ? "战场可不是泰迪熊该待的地方。" : (get_bedBears() == 1 ? "你不在的时候，可不想让它孤零零的。" : "你的怀抱足够分给每一只熊。"));
            addNextButton("否",enterCabin).hint(get_bedBears() == 0 ? "绝不抛下任何一个战友。" : (get_bedBears() == 1 ? "第一只熊可能会吃醋的。" : "目前这些熊已经够了。"));
         }
         if(get_bedBears() > 0)
         {
            addNextButton("带上",cabinBearTake).hint(get_bedBears() == 1 && !get_player().hasItem(get_useables().TELBEAR) ? "你需要它的陪伴。" : "带上" + Utils.pluralize(get_bedBears(),"这只","一只") + "熊。").disableIf(get_player().roomInExistingStack(get_useables().TELBEAR) < 0 && get_player().emptySlot() < 0,"你的背包已经没有空间了。");
         }
         addNextButton("依偎",cabinBearSnuggle).hint("此刻你只想好好抱抱。");
         addButton(14,"返回",enterCabin);
      }
      
      public function cabinBearAdd() : void
      {
         clearOutput();
         get_player().consumeItem(get_useables().TELBEAR);
         set_bedBears(get_bedBears() + 1);
         outputText("你把泰迪熊放在床上，把它塞在被子下面。");
         doNext(cabinBearMenu);
      }
      
      public function beddingMenu() : void
      {
         menu();
         addNextButton("普通寝具",normalBedding).hint("使用你普通的寝具。").disableIf(!get_player().hasPerk(PerkLib.MothBedding) && !get_player().hasPerk(PerkLib.SpiderBedding));
         if(get_player().hasKeyItem("Moth Bedding"))
         {
            addNextButton("飞蛾寝具",mothBedding).hint("将你的旧寝具换成玛瑞斯制作的丝绸床单。").disableIf(get_player().hasPerk(PerkLib.MothBedding));
         }
         if(get_player().hasKeyItem("Spider-Silk Bedding"))
         {
            addNextButton("蜘蛛丝寝具",spiderBedding).hint("换上你的蜘蛛丝床单。").disableIf(get_player().hasPerk(PerkLib.SpiderBedding));
         }
         setExitButton("返回",enterCabin);
      }
      
      public function bedBearDesc() : void
      {
         var _loc1_:String = "";
         switch(get_bedBears())
         {
            case 0:
               _loc1_ = "你的床上没有泰迪熊。";
               break;
            case 1:
               _loc1_ = "你的泰迪熊被塞在被子里，安然无恙。";
               break;
            case 2:
               _loc1_ = "一对泰迪熊依偎在床上。";
               break;
            case 3:
            case 4:
            case 5:
               _loc1_ = "几只小熊给床增添了一丝童趣。";
               break;
            case 6:
            case 7:
            case 8:
            case 9:
               _loc1_ = "你的床上铺满了泰迪熊。";
               break;
            default:
               _loc1_ = "你的泰迪熊后宫在床上闲逛，几乎没有留给你睡觉的空间。";
         }
         outputText(_loc1_);
      }
   }
}

