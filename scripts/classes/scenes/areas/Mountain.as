package classes.scenes.areas
{
   import classes.BaseContent;
   import classes.CoC;
   import classes.DynStat;
   import classes.ImageManager;
   import classes.PerkLib;
   import classes.Player;
   import classes.SettingsGlobalFetishes;
   import classes.StatusEffects;
   import classes._FlagDict.FlagDict_Impl_;
   import classes.display.SpriteDb;
   import classes.globalFlags.KFLAGS;
   import classes.internals.GuiOutput;
   import classes.internals.Utils;
   import classes.internals._OneOf.OneOf_Impl_;
   import classes.items.ConsumableLib;
   import classes.scenes.Camp;
   import classes.scenes.Inventory;
   import classes.scenes.api.Encounter;
   import classes.scenes.api.EncounterDef;
   import classes.scenes.api.Encounters;
   import classes.scenes.api.FnHelpers;
   import classes.scenes.api.IExplorable;
   import classes.scenes.api._Encounters.EncounterChance_Impl_;
   import classes.scenes.api._Encounters.EncounterOrDef_Impl_;
   import classes.scenes.areas.mountain.HellHoundScene;
   import classes.scenes.areas.mountain.InfestedHellhoundScene;
   import classes.scenes.areas.mountain.MinotaurScene;
   import classes.scenes.areas.mountain.NephilaSlimeScene;
   import classes.scenes.areas.mountain.Salon;
   import classes.scenes.areas.mountain.WormsScene;
   import classes.scenes.quests.urtaQuest.MinotaurLord;
   import flash.Boot;
   import haxe.IMap;
   import haxe.ds.Either;
   
   public class Mountain extends BaseContent implements IExplorable
   {
      
      public var wormsScene:WormsScene;
      
      public var salon:Salon;
      
      public var nephilaSlimeScene:NephilaSlimeScene;
      
      public var minotaurScene:MinotaurScene;
      
      public var infestedHellhoundScene:InfestedHellhoundScene;
      
      public var hellHoundScene:HellHoundScene;
      
      public var _explorationEncounter:Encounter;
      
      public function Mountain(param1:GuiOutput = undefined)
      {
         if(Boot.skip_constructor)
         {
            return;
         }
         _explorationEncounter = null;
         nephilaSlimeScene = new NephilaSlimeScene();
         salon = new Salon();
         wormsScene = new WormsScene();
         infestedHellhoundScene = new InfestedHellhoundScene();
         super();
         minotaurScene = new MinotaurScene(param1);
         hellHoundScene = new HellHoundScene(param1);
      }
      
      public function minotaurRouter() : void
      {
         spriteSelect(SpriteDb.get_s_minotaur());
         if(int(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,2300) % 16) == 0 && get_player().hasPerk(PerkLib.MinotaurCumAddict) && Utils.rand(3) == 0 && get_addictionEnabled())
         {
            minotaurScene.minoAddictionBadEndEncounter();
         }
         else if(!get_player().hasStatusEffect(StatusEffects.TF2) && (get_player().level <= 5 || get_player().get_str() <= 40))
         {
            clearOutput();
            if(get_silly())
            {
               outputText("在穿越险恶的山路时，你路过了一个不祥的洞穴。散落的白骨和死亡的气息让你不由得加快了脚步。然而，就在你走过时，你听到了一声低沉的咆哮和粗重的鼻息，一个长着牛头的怪物男人走了出来。他眼中燃烧着地狱般的怒火，手里拿着一把巨大的斧头，带着明显的愤怒向你逼近。当他走到光线中时，你看到他全身赤裸，勃起的巨大阴茎像他本人一样愤怒，在他跟踪你时，不断地流出先列腺液。[pg]");
               outputText("你在试图逃跑时跌倒了，意识到自己完全无能为力。牛头人高高地耸立在你面前，举起斧头准备给你致命一击。就在他准备挥下斧头时，一场巨大的爆炸震动了整个山腰，让牛头人在结果你之前踉跄了一下。你困惑地环顾四周，试图理解这奇怪的新转折，并注意到有大约半打人从更上面的小路走来。他们看起来像是一群穿着蓝色衣服、拿着奇怪武器的乌合之众。最高大的男人拿着一把由多个旋转管子组成的武器，并开始旋转枪管。一秒钟后，伴随着你听不懂的语言的尖叫声，一阵铅雨开始将牛头人撕成一团血肉模糊的云雾。[pg]");
               outputText("一个同样气势逼人、戴着眼罩的黑人开始向野兽发射罐子，罐子剧烈地爆炸了。[say:你这衣衫褴褛的野兽！]他嘲笑道。[say:你应该找个和你一样大的人，小伙子！嘿嘿嘿！][pg]");
               get_images().showImage("encounter-stranger");
               outputText("接下来走上小路的是一个穿着闪亮防护服的怪人，手里拿着一把燃烧着火焰的武器。他自由地走进爆炸和枪火中，开始点燃野兽。[pg]");
               outputText("[say:唔唔唔噜唔！！！！！唔噜唔噜唔！]怪人透过面具嘟囔着。[pg]");
               outputText("[say:我喜欢我的牛排全熟，你这疯狂的家伙！]黑人大喊道。[pg]");
               outputText("野兽倒下，变成了一堆烧焦的血肉模糊的尸体。当你重新站起来时，你听到身后传来一阵奇怪的声音。你转过身，发现一个穿着考究、戴着滑雪面罩、抽着烟的男人。[say:你不知道山里很危险吗，]男人带着浓重的口音说道。[say:如果你不小心的话，你会在这里被干掉的。][pg]");
               outputText("你感谢了那个男人和他的团队，但他们对你的感激不屑一顾。[say:不，不！]那个带着口音的男人说。[say:就像他们说的那样，每个人都有一次机会。]说完，他摸了摸手腕上的手表，消失了。团队的其他成员继续赶路。[pg]");
               outputText("当他们离开时，拿着链枪的巨人用一种可怕的口音大喊道，[say:你放开三明治！三明治是我的！][pg]");
               outputText("伴随着这句话，当他们走远时，又一阵子弹雨打破了现场的宁静，让你安全地躲过了牛头人，但对刚才到底发生了什么感到完全困惑。");
            }
            else
            {
               get_images().showImage("monster-minotaur");
               outputText("在穿越险恶的山路时，你路过了一个不祥的洞穴。散落的白骨和死亡的气息让你不由得加快了脚步。然而，就在你走过时，你听到了一声低沉的咆哮和粗重的鼻息，一个长着牛头的怪物男人走了出来。他眼中燃烧着地狱般的怒火，手里拿着一把巨大的斧头，带着明显的愤怒向你逼近。当他走到光线中时，你看到他全身赤裸，勃起的巨大阴茎像他本人一样愤怒，在他跟踪你时，不断地流出先列腺液。[pg]");
               outputText("你在试图逃跑时跌倒了，意识到自己完全无能为力。牛头人高高地耸立在你面前，举起斧头准备给你致命一击。就在他准备挥下斧头时，另一个兽人从侧面撞向了他。他们两个开始为了强暴你的荣誉而战，给了你逃跑的机会。你趁他们打架时悄悄溜走——也许你现在应该避开山脉？[pg]");
               dynStats(DynStat.Lib(-1));
            }
            get_player().createStatusEffect(StatusEffects.TF2,0,0,0,0);
            doNext(get_camp().returnToCampUseOneHour);
         }
         else if(!get_player().hasStatusEffect(StatusEffects.MinoPlusCowgirl) || Utils.rand(10) == 0)
         {
            clearOutput();
            if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,892) == 1 && get_player().cowScore() >= 4 && get_player().lactationQ() >= 200 && get_player().biggestTitSize() >= 3 && get_player().minotaurAddicted())
            {
               outputText("当你经过山腰上一道阴暗的裂缝时，你听到了从里面传来的熟悉的牛娘的叫声。知道接下来会发生什么，你小心翼翼地靠近，在拐角处偷看。[pg]");
               outputText("两个类人生物的轮廓进入了你的视线，他们都有明显的牛类特征——尾巴、角和蹄子而不是脚。由于他们完全赤裸，他们的性别一目了然。第一个是原始女性气质的缩影，有着一对巨大的、像乳房一样的乳房和宽阔的适合生育的臀部。另一个是男性气质的顶峰，有着宽阔、肌肉发达的胸膛，一根巨大的像马一样的阴茎，以及一对更适合种马而不是人的沉重睾丸。你再次偶然发现了一个牛娘正在和她的牛头人情人进行一场并不那么秘密的幽会。");
               unlockCodexEntry(2048);
               unlockCodexEntry(2045);
               outputText("[pg]你在一个突出的岩石后面安顿下来，预测接下来会发生什么。你看到小恶魔和地精的鲜明轮廓在这个临时剧院周围占据了类似的位置，这个圆形的空地边缘被巨石和角落包围，各种生物都可能藏在里面。你想知道他们是否和你一样渴望即将到来的表演。令人陶醉的即将发生性行为的气味在空气中升起……随之而来的是一种男性的气味，一种让你的胃因期待而咕咕叫的气味。新鲜牛头人精液的令人垂涎的香气飘入你的鼻子，让你整个身体都因需要而颤抖。你的[vagOrAss]立刻");
               if(get_player().hasVagina())
               {
                  outputText("湿润了");
               }
               else
               {
                  outputText("抽痛着");
               }
               outputText("，渴望被填满");
               if(get_player().hasCock())
               {
                  outputText("，而[eachCock]则挺立起来，紧绷着你的[armor]");
               }
               outputText("。[pg]");
               get_images().showImage("minotaur-cumslut");
               outputText("从你的位置几乎看不清，但你可以想象：半透明的先列腺液从牛头人的马眼滴落，渗到你的舌头上。一想到这里，你的全身就颤抖起来，不知道是因为厌恶还是渴望。你想象着自己的嘴唇包裹住那根巨大的马鞭，榨干它所有美味的精液。一想到这里，你的身体就像正午的太阳一样炽热，充满了需求，对牛娘的嫉妒，但最重要的是兴奋。[pg]");
               outputText("从想象的白日梦中回过神来，你把注意力转回了眼前的表演。你想知道自己是否可以走过去加入他们，或者是否应该像过去一样，只是留在这里观看。");
               menu();
               addButton(0,"加入",minotaurScene.joinBeingAMinoCumSlut);
               addButton(1,"观看",minotaurScene.watchAMinoCumSlut);
            }
            else
            {
               FlagDict_Impl_.arrayWriteInt(KFLAGS.flags,892,1);
               if(!get_player().hasStatusEffect(StatusEffects.MinoPlusCowgirl))
               {
                  get_player().createStatusEffect(StatusEffects.MinoPlusCowgirl,0,0,0,0);
               }
               else
               {
                  get_player().addStatusValue(StatusEffects.MinoPlusCowgirl,1,1);
               }
               outputText("当你经过山腰上一个阴暗的裂缝时，你听到从里面传出牛的声音。你想知道一头牛是怎么上来的，但考虑到这片土地的危险，你小心翼翼地靠近，并在拐角处偷看。[pg]");
               outputText("你看到的不是一头牛，而是两个巨大的人形生物，有着明显的牛类特征——尾巴、角" + (get_noFur() ? "" : "、口鼻") + "，以及代替脚的蹄子。然而，他们仍然是两足行走的，而且由于他们一丝不挂，性别一目了然。一个有着巨大的、像乳房一样的胸部和宽阔的臀部，另一个有着巨大的、像马一样的肉棒和一对沉重的睾丸，这更适合种马而不是人。你偶然发现了一个牛娘和一个牛头人。");
               unlockCodexEntry(2048);
               unlockCodexEntry(2045);
               outputText("[pg]你的大脑一部分注意到了被扔在一旁的衣物碎片，以及空气中弥漫的即将发生性行为的令人陶醉的气味，但你的注意力被这对伴侣的动作牢牢吸引住了。牛娘转过身，把手放在一个低矮的壁架上，弯下腰，丰满的屁股对着牛头人。牛头人一步就拉近了他们之间的距离。[pg]");
               outputText("她大声叫着，几乎是在呻吟，牛头人用两只巨大的手抓住了她柔软的屁股。她的尾巴翘起，露出一个闪闪发光的湿润小穴，阴唇已经因为渴望而分开。当他迅速变硬的牛鞭擦过她的胯部时，她又发出了一声牛叫。当他调整姿势时，你无法移开视线，他那张开的、蘑菇状的龟头推挤着她的下体，引出了她又一声呻吟。[pg]");
               get_images().showImage("minotaur-cumslut-encounter");
               outputText("牛头人用力一挺，插入了牛娘渴望的肉洞，将自己埋入了一道——两道他那巨大肉棒上的三道脊环。她发出一半痛苦、一半狂喜的尖叫，并向后推挤，渴望他全部的长度。在稍微后退之后，他推得更深，将他巨大的肉棒每一寸都插入了他心甘情愿的伴侣体内，她在快感中扭动，正如她所希望的那样被刺穿。[pg]");
               outputText("这对伴侣很快就进入了节奏，伴随着无数的咕哝声、呻吟声和过度性交的喘息声。对你来说，这几乎是一场暴力的袭击，肯定会让他们俩都青肿酸痛，但牛娘伸出的舌头和压倒性的渴望表情告诉你并非如此。她享受着每一次抽插，以及牛头人强有力的手对她摇晃的屁股和沉重的乳房进行的抚摸、摸索和看似痛苦的挤压。他也没好到哪里去，他的眼睛因为欲望而变得呆滞，继续操着他找到的肉洞，几乎是在蹂躏它的主人。");
               doNext(minotaurScene.continueMinoVoyeurism);
            }
         }
         else if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,20) == 3 && Utils.rand(2) == 0 && get_player().get_inte() / 10 + Utils.rand(20) < 15)
         {
            minotaurScene.minoAddictionFuck();
         }
         else if(Utils.rand(5) == 0 && softLevelMin(10))
         {
            clearOutput();
            get_images().showImage("monster-minotaurlord");
            outputText("你管好自己的事，沿着蜿蜒的小路走着。你花时间欣赏风景，直到你看到一个黑影向你逼近。你转过身，看到了一个牛头人！然而，他比你见过的其他牛头人要大得多。你估计他有十一英尺高，挥舞着一条链鞭。他打算强暴你！");
            startCombat(new MinotaurLord());
         }
         else
         {
            minotaurScene.getRapedByMinotaur(true);
         }
      }
      
      public function minotaurChance() : Number
      {
         if(get_player().hasPerk(PerkLib.MinotaurCumAddict))
         {
            return 3;
         }
         if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,20) > 0)
         {
            return 2;
         }
         return 1;
      }
      
      public function isDiscovered() : Boolean
      {
         return FlagDict_Impl_.arrayReadInt(KFLAGS.flags,2300) > 0;
      }
      
      public function hike() : void
      {
         clearOutput();
         get_images().showImage("area-mountain");
         if(get_player().cor < 90)
         {
            outputText("你在山里的徒步旅行虽然没有结果，但展现了令人愉快的景色，并为你提供了良好的锻炼和放松。");
            dynStats(DynStat.Tou(0.25),DynStat.Spe(0.5),DynStat.Lust(get_player().lib / 10 - 15));
         }
         else
         {
            outputText("在你在山里徒步旅行时，你堕落的大脑不断重播你最淫秽扭曲的性遭遇，总是想象着新的变态方式来制造快感。");
            outputText("[pg]没有掠食者闻到你散发出的强烈性气味，这真是个奇迹。");
            dynStats(DynStat.Tou(0.25),DynStat.Spe(0.5),DynStat.Lib(0.25),DynStat.Lust(get_player().lib / 10));
         }
         doNext(get_camp().returnToCampUseOneHour);
      }
      
      public function get_explorationEncounter() : Encounter
      {
         var _gthis:Mountain = this;
         var _loc1_:FnHelpers = Encounters.fn;
         if(_explorationEncounter == null)
         {
            _explorationEncounter = Encounters.group("mountain",get_game().commonEncounters.get_withImpGob(),EncounterOrDef_Impl_.fromDef(new EncounterDef("salon",null,_loc1_.not(salon.isDiscovered),OneOf_Impl_.fromA(salon.hairDresser),null)),EncounterOrDef_Impl_.fromDef(new EncounterDef("highmountains",null,EncounterChance_Impl_.fromBoolFun(function():Boolean
            {
               if(!_gthis.get_game().highMountains.isDiscovered())
               {
                  if(_gthis.get_player().level < 5)
                  {
                     return FlagDict_Impl_.arrayReadInt(KFLAGS.flags,2300) >= 40;
                  }
                  return true;
               }
               return false;
            }),OneOf_Impl_.fromA(get_game().highMountains.discover),null)),EncounterOrDef_Impl_.fromDef(new EncounterDef("snowangel",function():Number
            {
               if(_gthis.isSaturnalia())
               {
                  return 1;
               }
               return 0.1;
            },EncounterChance_Impl_.fromBoolFun(function():Boolean
            {
               if(_gthis.get_player().get_gender() > 0 && FlagDict_Impl_.arrayReadInt(KFLAGS.flags,639) == 0 && FlagDict_Impl_.arrayReadInt(KFLAGS.flags,638) == 0)
               {
                  if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,640) > 1)
                  {
                     return !_gthis.get_player().hasKeyItem("North Star Key");
                  }
                  return false;
               }
               return false;
            }),OneOf_Impl_.fromA(get_game().xmas.snowAngel.gatsSpectacularRouter),null)),EncounterOrDef_Impl_.fromDef(new EncounterDef("jackfrost",null,EncounterChance_Impl_.fromBoolFun(function():Boolean
            {
               if(_gthis.isSaturnalia() && FlagDict_Impl_.arrayReadInt(KFLAGS.flags,645) < int(_gthis.get_date().getFullYear()))
               {
                  return _gthis.get_silly();
               }
               return false;
            }),OneOf_Impl_.fromA(get_game().xmas.jackFrost.meetJackFrostInTheMountains),null)),EncounterOrDef_Impl_.fromDef(new EncounterDef("hellhound",null,null,OneOf_Impl_.fromA(hellHoundScene.hellhoundEncounter),[get_game().commonEncounters.furriteMod])),EncounterOrDef_Impl_.fromDef(new EncounterDef("infhhound",function():Number
            {
               return _gthis.get_parasiteRating() / 4;
            },EncounterChance_Impl_.fromBoolFun(function():Boolean
            {
               return _gthis.get_parasiteRating() > 0;
            }),OneOf_Impl_.fromA(infestedHellhoundScene.infestedHellhoundEncounter),[get_game().commonEncounters.furriteMod])),EncounterOrDef_Impl_.fromDef(new EncounterDef("worms1",null,EncounterChance_Impl_.fromBoolFun(function():Boolean
            {
               return _gthis.get_fetishSettings().parasites == -1;
            }),OneOf_Impl_.fromA(wormsScene.wormToggle),null)),EncounterOrDef_Impl_.fromDef(new EncounterDef("worms2",function():Number
            {
               return _gthis.get_parasiteRating() / 2;
            },EncounterChance_Impl_.fromBoolFun(function():Boolean
            {
               if(_gthis.get_parasiteRating() != 0)
               {
                  if(_gthis.get_player().hasStatusEffect(StatusEffects.Infested))
                  {
                     return !_gthis.get_player().hasStatusEffect(StatusEffects.MetWorms);
                  }
                  return true;
               }
               return false;
            }),OneOf_Impl_.fromA(wormsScene.wormEncounter),null)),EncounterOrDef_Impl_.fromDef(new EncounterDef("minotaur",minotaurChance,null,OneOf_Impl_.fromA(minotaurRouter),[get_game().commonEncounters.furriteMod])),EncounterOrDef_Impl_.fromDef(new EncounterDef("factory",null,EncounterChance_Impl_.fromBoolFun(function():Boolean
            {
               if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,2017) >= 1)
               {
                  return FlagDict_Impl_.arrayReadInt(KFLAGS.flags,2020) <= 0;
               }
               return false;
            }),OneOf_Impl_.fromA(get_game().dungeons.enterFactory),null)),EncounterOrDef_Impl_.fromDef(new EncounterDef("ceraph",function():Number
            {
               if(_gthis.get_player().get_lust() >= 33)
               {
                  return 1;
               }
               return 0.5;
            },EncounterChance_Impl_.fromBoolFun(function():Boolean
            {
               if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,2657) == 0)
               {
                  return !_gthis.get_game().ceraphFollowerScene.ceraphIsFollower();
               }
               return false;
            }),OneOf_Impl_.fromA(ceraphFn),[_loc1_.ifLevelMin(2)])),EncounterOrDef_Impl_.fromDef(new EncounterDef("hhound_master",EncounterChance_Impl_.fromFloatConst(2),EncounterChance_Impl_.fromBoolFun(function():Boolean
            {
               if((_gthis.get_noFur() || _gthis.get_player().face.type == 2) && _gthis.get_player().cor >= 60 && (_gthis.get_player().dogCocks() >= 2 || _gthis.get_player().hasVagina() && _gthis.get_player().get_pregnancyType() == 6) && (_gthis.get_player().tail.type == 2 || _gthis.get_player().lowerBody.type == 2 || _gthis.get_player().hair.color == "midnight black" || _gthis.get_player().ears.type == 2))
               {
                  if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,141) != 0)
                  {
                     if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,141) == 1 && _gthis.get_player().hasKeyItem("Marae\'s Lethicite"))
                     {
                        return _gthis.get_player().keyItemv2("Marae\'s Lethicite") < 3;
                     }
                     return false;
                  }
                  return true;
               }
               return false;
            }),OneOf_Impl_.fromA(hellHoundScene.HellHoundMasterEncounter),null)),EncounterOrDef_Impl_.fromDef(new EncounterDef("nephila",function():Number
            {
               return _gthis.get_parasiteRating() / 2;
            },EncounterChance_Impl_.fromBoolFun(function():Boolean
            {
               if(_gthis.get_parasiteRating() != 0 && _gthis.get_nephilaEnabled())
               {
                  return !_gthis.get_player().hasStatusEffect(StatusEffects.ParasiteNephila);
               }
               return false;
            }),OneOf_Impl_.fromA(nephilaSlimeScene.encounterNephila),null)),EncounterOrDef_Impl_.fromDef(new EncounterDef("coal",EncounterChance_Impl_.fromFloatConst(0.05),null,OneOf_Impl_.fromA(findCoal),null)),EncounterOrDef_Impl_.fromDef(new EncounterDef("hike",EncounterChance_Impl_.fromFloatConst(0.2),null,OneOf_Impl_.fromA(hike),null)));
         }
         return _explorationEncounter;
      }
      
      public function findCoal() : void
      {
         get_game().xmas.nieve.set_coalFound(true);
         outputText("你走了一条比平时风景差得多的路线，来到一个似乎是旧挖掘场的地方。有一些木梁，生锈到无法使用的采矿设备，以及一个离山不远就塌陷的洞穴。当你在营地的遗迹中搜寻时，你发现了一个小而几乎空了的板条箱，里面留下了一些煤块。你不是那种拒绝免费东西的人，你把它们收集起来，放进你的[pouch]里。");
         get_inventory().takeItem(get_consumables().COAL___,get_camp().returnToCampUseOneHour);
      }
      
      public function explore() : void
      {
         clearOutput();
         get_player().location = "山脉";
         var _loc1_:IMap = KFLAGS.flags;
         FlagDict_Impl_.arrayWriteInt(_loc1_,2300,FlagDict_Impl_.arrayReadInt(_loc1_,2300) + 1);
         get_explorationEncounter().execEncounter();
      }
      
      public function discover() : void
      {
         FlagDict_Impl_.arrayWriteInt(KFLAGS.flags,2300,1);
         get_images().showImage("area-mountain");
         outputText("头顶雷声轰鸣，把你从思绪中震醒。高空之上，乌云环绕着远处的一座山峰。当你抬头凝视它时，你的直觉感到一种不祥的预感。");
         outputText("[pg]<b>你发现了高山！</b>");
         doNext(get_camp().returnToCampUseOneHour);
      }
      
      public function ceraphFn() : void
      {
         if(get_game().ceraphScene.hasExhibition() && Utils.rand(2) < 1)
         {
            get_game().ceraphScene.friendlyNeighborhoodSpiderManCeraph();
         }
         else
         {
            get_game().ceraphScene.encounterCeraph();
         }
      }
   }
}

