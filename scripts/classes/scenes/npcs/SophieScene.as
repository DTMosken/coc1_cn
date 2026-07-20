package classes.scenes.npcs
{
   import classes.BaseContent;
   import classes.CoC;
   import classes.CoC_Settings;
   import classes.Cock;
   import classes.DynStat;
   import classes.DynStatOp;
   import classes.Monster;
   import classes.PerkLib;
   import classes.Player;
   import classes.PregnancyStore;
   import classes.StatusEffects;
   import classes.TimeAwareInterface;
   import classes.Vagina;
   import classes._FlagDict.FlagDict_Impl_;
   import classes.display.SpriteDb;
   import classes.globalFlags.KFLAGS;
   import classes.internals.Utils;
   import classes.items.ConsumableLib;
   import classes.scenes.Camp;
   import classes.scenes.areas.highMountains.Harpy;
   import classes.scenes.combat.Combat;
   import flash.Boot;
   import haxe.IMap;
   
   public class SophieScene extends BaseContent implements TimeAwareInterface
   {
      
      public var pregnancy:PregnancyStore;
      
      public var checkedSophie:int;
      
      public function SophieScene()
      {
         if(Boot.skip_constructor)
         {
            return;
         }
         checkedSophie = 0;
         super();
         pregnancy = new PregnancyStore(93,738);
         pregnancy.addPregnancyEventSet(25,[150,120,100]);
         CoC.timeAwareClassAdd(this);
      }
      
      public function tooBigForOwnGoodSophieLossRape() : void
      {
         get_sophieBimbo().sophieSprite();
         clearOutput();
         var _loc1_:int = get_player().biggestCockIndex();
         outputText("索菲伸出一只长着爪子的脚想拉下你的盔甲，但你的" + get_player().cockDescript(_loc1_) + "自己弹了出来。她震惊地退缩，差点摔倒在她那" + (get_noFur() ? "" : "长满羽毛的") + "屁股上。索菲尖叫道：[say: 你是怎么藏住那个怪物的！？我受不了那个！]她用翅膀和脚猛烈地抽打你的头。一次特别有力的击打落在你耳朵上方，眼前一黑……[pg]");
         outputText("几个小时后，你在剧烈的头痛中醒来。你坐起身，一阵新的刺痛感震撼了你的世界，差点让你再次平躺下去。那个鹰身女妖……她把你扔在山脚下，甚至懒得把你的裤裆盖好！你的" + get_player().cockDescript(_loc1_) + "正在颤抖、坚硬，并滴着先列腺液。它的整个表面都布满了淡黄色的唇印，从你感觉有多累来看，索菲找到了让你多次射精的方法。身上盖着这么多吻痕，你会硬上好几个小时。你站起[feet]，走回营地。");
         get_player().orgasm("Dick");
         dynStats(DynStat.Sens(5));
         sophieFucked();
         luststickApplication(16);
         get_combat().cleanupAfterCombat();
      }
      
      public function tinyDickSupremeSophieLoss() : void
      {
         get_sophieBimbo().sophieSprite();
         clearOutput();
         outputText("索菲低头看着你");
         if(get_player().get_HP() < 1)
         {
            outputText("被打败的");
         }
         else
         {
            outputText("自慰的");
         }
         outputText("样子，叽叽喳喳地说，[say:嗯，这很容易。你确定你不想要这个吗？]她的爪子勾住你的[armor]，熟练地把它撕下来，将你的[skindesc]暴露在清冽的山风中。这景象实际上让她愣了一下。鹰身女妖主母难以置信地问，[say:嗯，就这？我以为我能闻到你的男人味，但你简直就像个女孩。我是说，我甚至感觉不到它在里面。操你比操一个矮人还要不爽。][pg]");
         outputText("她的话刺痛了你，让你的[cock]萎缩得更小了，这反而刺激了索菲进行更厉害的嘲讽。她宣布，[say:我还是会用你的精液做肥料，反正生出来的蛋都会是女孩。这不好吗？" + get_player().mf("也许她会没有奶子，然后被嘲笑一辈子，就像她那个伪娘老爸一样。","也许她会像她那个伪娘老爸一样，有一对漂亮的大奶子。") + "我知道，只要我的小穴一碰到你，你就会射出来。这么小的鸡巴根本不可能承受真正的性爱。][pg]");
         outputText("你太尴尬了，以至于即使有这位性感的裸体主母跨坐在你身上，你也硬不起来。你全身羞得通红，想要证明她错了的欲望与想要逃离不断嘲弄的欲望交织在一起，但你的");
         if(get_player().get_HP() < 1)
         {
            outputText("伤口");
         }
         else
         {
            outputText("欲望");
         }
         outputText("让你在专横的鹰身女妖面前动弹不得。索菲窃笑着，将她的爪子悬在你的" + get_player().cockDescript(0) + "上，问道，[say:你想当个小女孩吗？我可以帮你。]她的爪子威胁地咔嚓作响，但在你做出任何反应之前，她张开爪状的脚，将柔软的脚底压在你的阴茎上。虽然你想反抗她，但你的[cock]却不听使唤，在她柔软的脚底板下硬了起来。[pg]");
         outputText("索菲窃笑着，[say:作为一个女孩，你还真是有恋足癖。还是说你只是想让我更容易找到这个小家伙？我之前说的话是认真的——你的小鸡巴一闻到我漂亮小穴的味道就会射出来。你会喷得很快，我不得不趴在你身上，才能接住一些精液给我的卵子受精。][pg]");
         outputText("她的声音背后有一种嗡嗡的震动，让你感到不安，但你把这种担忧推开，转而专注于你是多么的羞愧。最糟糕的是，每一次挑逗和嘲弄都让你越来越兴奋，直到你能感觉到你的先列腺液粘在她的脚上。她为什么要这样对你？她以前是那么好……[pg]");
         outputText("仿佛看穿了你的心思，索菲回答道，[say:这是为了你好。也许有一天你会长大，长出一根像样的鸡巴让我操，但在此之前，你只是一个小男孩，最好还是当个女孩。]你竟然开始哭泣，但同时你的[hips]也跟着她的脚抬起，你那小小的鸡巴把它变成了一个先列腺液的滑水道。索菲窃笑着，[say:你准备好了，]然后把脚收回来，拉出一条条液体。她走下来，脸上带着一种心照不宣、近乎残忍的微笑看着你。[pg]");
         outputText("当她弯下腿开始靠近时，她那发情的小穴里流出的液体滴在了你的肚子上。她冷笑着，[say:我很惊讶你还没射，小女孩。我现在越来越近了，你觉得你多久会开始喷？现在？不，但你很快就会喷了。]你呆呆地看着索菲的小穴悬停在你的上方，继续缓慢地向你的[cock]下降。天哪，你为什么这么硬？当她的小穴离你只有一英尺远时，你的鸡巴已经开始自己抽动了。不，不，不，你在心里惊慌失措，想着你能想到的最无聊、最可怕的事情。");
         if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,35) > 0 && get_player().cor > 50)
         {
            outputText("你想象着艾米莉的声音喋喋不休地说着腐化有多可怕，但这无济于事！你");
         }
         else
         {
            outputText("这无济于事；你");
         }
         outputText("的眼睛死死盯着索菲那粉红色嘴唇般的阴唇，看着它慢慢靠近。[pg]");
         outputText("一股潮湿的体温拂过你的" + get_player().cockDescript(0) + "，它又抽动了一下。你在痛苦和狂喜中大叫起来，那根小鸡巴抽动了一会儿，然后把一股黏糊糊的白色黏液射到了你的肚子上。索菲顺势压了下来，她巨大的小穴吵闹地吞下了你的[cock]，就像一只鸟吞下了一条只有它几分之一大小的虫子。");
         if(get_player().cumQ() < 50)
         {
            outputText("你将最后一股精液射进她的肉褶里，在释放的快感中弓起了背。索菲冷笑了一声，[say:不出我所料，你只能挤出这么几滴。算你走运，我的卵子受孕能力很强，这点量也够用了。]");
         }
         else if(get_player().cumQ() < 250)
         {
            outputText("你将精液射进她的肉褶里，在释放的快感中弓起了背。索菲低头冷笑了一下，但很快惊讶就爬上了她的脸庞。你还在不停地射精，白色的黏液彻底涂满了她湿漉漉的肉缝。索菲若有所思地说，[say:看来你那根小小的女孩鸡巴里还是藏了点好东西的嘛？可惜你高潮的样子还是像个无助的婊子。]");
         }
         else
         {
            outputText("你将浓稠的精液如波涛般射进她的肉褶里，短短几秒钟就用乳白色的液体填满了它们。她的肚子因为大量的灌精而鼓了起来，但大部分精液还是从她那几乎没被塞住的小穴口流了出来。索菲震惊地低头看着，问道，[say:哇哦，像你这样的小女孩是从哪弄来这么多精液的？也许你该把那根小鸡鸡养大点，这样别人就不会对这些感到那么惊讶了，对吧？]");
         }
         outputText("[pg]");
         outputText("年长的鹰身女妖从你身上爬起，拍了拍自己的肚子。她的脚踩在你的胸口上，把你推向了");
         if(get_player().cumQ() >= 400)
         {
            outputText("浸满精液的");
         }
         outputText("巢穴表面，同时对你发号施令，[say:把你那根可悲的鸡巴弄掉，或者把它变成男人的尺寸。如果你想听我的建议，你当个女孩会比当男孩更可爱。]嘲讽完后，她俯下身给了你一个漫长而湿润的吻。你的[cock]立刻恢复了完全的硬度，或者至少在你这个尺寸下算是完全勃起了。这个吻持续了很久，直到你完全被她吞噬，你甚至把她的嘴唇吸进嘴里，只为了尝到更多的甜味。她带着会意的微笑退开，而你的鸡巴又开始滴下先列腺液。鹰身女妖解释道，[say:尝了那么多我的唇彩，你至少会硬上八个小时。][pg]");
         outputText("索菲张开她粗壮的大腿，露出她小穴里乳粉色的肉褶，她甚至用手指把它扒开。鸟身女妖命令道，[say:过来舔我。你会欲火焚身到无法自理，所以你最好一边玩你那根小鸡鸡一边让我爽。][pg]");
         outputText("你不确定自己是否同意这个逻辑，或者只是情况太糟糕而无法抗拒，但你把脸埋进她的阴户，开始舔舐鹰身女妖的小穴和里面混合的体液。[pg]");
         outputText("你很快就失去了时间概念，但从你的[cock]有多酸痛来看，你肯定又高潮了好几次。索菲肉缝里那股刺鼻的味道在你的嘴里萦绕，混合着你自己精液的咸味，你穿上衣服，感到非常羞愧。谢天谢地，索菲在巢穴的另一边睡着了，所以你毫不费力地溜了出去。");
         get_player().orgasm("Generic");
         dynStats(DynStat.Sens(5));
         sophieFucked();
         luststickApplication(8);
         get_combat().cleanupAfterCombat();
      }
      
      public function timeChangeLarge() : Boolean
      {
         §§push(false);
         var _loc1_:int;
         checkedSophie = (_loc1_ = checkedSophie) + 1;
         if(_loc1_ == 0)
         {
            §§pop();
            §§push(get_game().time.hours == 6);
         }
         if(§§pop())
         {
            if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,754) == 0 && FlagDict_Impl_.arrayReadInt(KFLAGS.flags,1081) == 0 && FlagDict_Impl_.arrayReadInt(KFLAGS.flags,755) >= 5 && !pregnancy.get_isPregnant() && get_player().hasCock() && !sophieAtCamp())
            {
               get_sophieFollowerScene().sophieFollowerIntro();
               return true;
            }
            if(FlagDict_Impl_.arrayReadString(KFLAGS.flags,701) == "Sophie" && get_player().hasCock())
            {
               if(get_sophieBimbo().bimboSophieAtCamp() && Utils.rand(2) == 0 && get_player().hasCockThatFits(get_sophieBimbo().sophieCapacity()))
               {
                  outputText("[pg]<b><u>那天早上发生了一件奇怪的事……</u></b>");
                  if(pregnancy.get_event() >= 2)
                  {
                     get_sophieBimbo().fuckYoPregnantHarpyWaifu(true);
                  }
                  else
                  {
                     get_sophieBimbo().sophieFenCraftedSex(true);
                  }
                  return true;
               }
               if(get_sophieFollowerScene().sophieFollower() && get_player().get_lust100() >= 50 && get_player().smallestCockArea() <= 5 && FlagDict_Impl_.arrayReadInt(KFLAGS.flags,1081) == 0)
               {
                  get_sophieFollowerScene().sophieSmallDongTeases();
                  return true;
               }
            }
         }
         return false;
      }
      
      public function timeChange() : Boolean
      {
         var _loc2_:int = 0;
         var _loc3_:* = null as IMap;
         if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,283) > 0)
         {
            return false;
         }
         var _loc1_:Boolean = false;
         checkedSophie = 0;
         pregnancy.pregnancyAdvance();
         if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,96) > 0)
         {
            _loc2_ = 96;
            FlagDict_Impl_.arrayWriteInt(KFLAGS.flags,_loc2_,FlagDict_Impl_.arrayReadInt(KFLAGS.flags,_loc2_) - 1);
         }
         if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,746) == 1 && get_sophieFollowerScene().sophieFollower() && FlagDict_Impl_.arrayReadInt(KFLAGS.flags,1081) == 0)
         {
            get_sophieFollowerScene().sophieDaughterDebimboUpdate();
            _loc1_ = true;
         }
         if(!sophieAtCamp())
         {
            if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,1081) == 0 && pregnancy.get_isPregnant() && pregnancy.get_incubation() == 0)
            {
               _loc3_ = KFLAGS.flags;
               FlagDict_Impl_.arrayWriteInt(_loc3_,94,FlagDict_Impl_.arrayReadInt(_loc3_,94) + 1);
               pregnancy.knockUpForce();
            }
         }
         else
         {
            if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,742) > 0)
            {
               _loc2_ = 742;
               FlagDict_Impl_.arrayWriteInt(KFLAGS.flags,_loc2_,FlagDict_Impl_.arrayReadInt(KFLAGS.flags,_loc2_) - 1);
               if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,742) == 0)
               {
                  get_sophieBimbo().sophiesEggHatches();
                  _loc1_ = true;
               }
            }
            if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,741) > 0)
            {
               _loc2_ = 741;
               FlagDict_Impl_.arrayWriteInt(KFLAGS.flags,_loc2_,FlagDict_Impl_.arrayReadInt(KFLAGS.flags,_loc2_) - 1);
               if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,741) < 1)
               {
                  FlagDict_Impl_.arrayWriteInt(KFLAGS.flags,741,1);
               }
               else
               {
                  switch(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,741))
                  {
                     case 100:
                     case 200:
                     case 325:
                        sophiesDaughterDescript();
                        _loc1_ = true;
                  }
               }
            }
            if(pregnancy.get_isPregnant())
            {
               if(pregnancy.get_type() == 25)
               {
                  _loc2_ = pregnancy.eventTriggered();
                  switch(_loc2_)
                  {
                     case 1:
                     case 2:
                     case 3:
                        sophiesPregnancyDescript(_loc2_);
                        _loc1_ = true;
                        break;
                     default:
                        if(pregnancy.get_incubation() == 0)
                        {
                           get_sophieBimbo().sophieBirthsEgg();
                           pregnancy.knockUpForce();
                           FlagDict_Impl_.arrayWriteInt(KFLAGS.flags,742,150 + Utils.rand(30));
                           FlagDict_Impl_.arrayWriteInt(KFLAGS.flags,737,551);
                           _loc1_ = true;
                        }
                  }
               }
               if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,737) >= 552)
               {
                  if(get_sophieBimbo().bimboSophie())
                  {
                     get_sophieBimbo().sophieGotKnockedUp();
                  }
                  else
                  {
                     get_sophieFollowerScene().sophieFertilityKnockedUpExpired();
                  }
                  FlagDict_Impl_.arrayWriteInt(KFLAGS.flags,737,551);
                  _loc1_ = true;
               }
            }
            else if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,737) == 0)
            {
               if(get_player().hasCock())
               {
                  if(get_sophieBimbo().bimboSophie())
                  {
                     get_sophieBimbo().sophieGoesIntoSeason();
                  }
                  else
                  {
                     get_sophieFollowerScene().sophieFollowerGoesIntoSeas();
                  }
                  FlagDict_Impl_.arrayWriteInt(KFLAGS.flags,737,720);
                  _loc1_ = true;
               }
            }
            else
            {
               _loc2_ = 737;
               FlagDict_Impl_.arrayWriteInt(KFLAGS.flags,_loc2_,FlagDict_Impl_.arrayReadInt(KFLAGS.flags,_loc2_) - 1);
               if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,737) == 552)
               {
                  if(get_sophieBimbo().bimboSophie())
                  {
                     get_sophieBimbo().sophieSeasonExpiration();
                  }
                  else
                  {
                     get_sophieFollowerScene().sophieFertilityExpired();
                  }
                  _loc1_ = true;
               }
               if(get_game().time.hours == 10 && (!get_player().hasPerk(PerkLib.LuststickAdapted) || Utils.rand(3) == 0) && get_sophieBimbo().bimboSophie() && !get_sophieBimbo().sophieIsInSeason() && FlagDict_Impl_.arrayReadInt(KFLAGS.flags,742) == 0)
               {
                  get_sophieBimbo().bimboSophieLustStickSurprise();
                  _loc1_ = true;
               }
            }
         }
         return _loc1_;
      }
      
      public function tellSophieYoureForagingForStuff() : void
      {
         get_sophieBimbo().sophieSprite();
         clearOutput();
         outputText("你向她解释说，你只是在寻找能帮助你完成任务的补给品。索菲危险地眯起眼睛，警告你：[say: 别打我们蛋的主意！当然，我相信像你这么可爱的小点心是绝对不会这么做的。你说的任务是怎么回事？][pg]");
         outputText("你花了一点时间才让她明白情况，但在冗长的解释之后，这只鹰身女妖终于明白了。她不理解你的理由，但至少她知道你的任务对你来说有多重要。索菲叹了口气，显然对这个话题感到无聊，她张开粗壮的大腿，开始用手指在她那肿胀的阴户入口处画圈。看到她如此明目张胆地自慰，你微微睁大了眼睛，而你自己的身体也因为兴奋而发热。虽然她的姿势很开放，但这只不知羞耻的鹰身女妖似乎并不想要一个伴侣。你领会了她的暗示，知道她不想再谈了，于是爬了下去。[pg]");
         dynStats(DynStat.Lust(10 + get_player().lib / 4));
         if(get_player().get_inte100() < 50)
         {
            dynStats(DynStat.Inte(1));
         }
         doNext(get_camp().returnToCampUseOneHour);
      }
      
      public function sophiesPregnancyDescript(param1:int) : void
      {
         if(param1 == 1)
         {
            if(get_sophieBimbo().bimboSophie())
            {
               outputText("[pg]索菲独自坐在你舒适的铺盖上。这个长着羽毛的雌性似乎已经喜欢上了你休息的地方。你那鸟脑子的性奴显然渴望尽可能地靠近你，或者至少是靠近你那充满父爱的气味。沉浸在淫荡的幻想中，她抚摸着肚子上微微隆起的肿块，这明显的迹象表明你那充满活力的种子已经在她孕育卵子的子宫里发挥了魔力。她的一只手漫不经心地滑入双腿之间，手指轻轻把玩着湿润的阴部，另一只手则揉着肚子。");
               outputText("[pg]终于注意到你注视着她的身体，索菲抬起头，带着多情的微笑看着你，她那粗壮、丰满的大腿张开，向你展示她紧致肿胀的小穴。这个金发无脑花瓶向你展示她怀孕的身体，向你展示你男子气概的成果，并诱惑你与她火辣、淫荡的身体玩耍。[pg]");
            }
            else
            {
               outputText("[pg]索菲独自坐在你舒适的铺盖上。这个长着羽毛的雌性似乎已经喜欢上了你休息的地方。你那身材丰满的魔物娘情人显然渴望尽可能地靠近你，或者至少是靠近你那充满父爱的气味。沉浸在淫荡的幻想中，她抚摸着肚子上微微隆起的肿块，这明显的迹象表明你那充满活力的种子已经在她孕育卵子的子宫里发挥了魔力。她的一只手漫不经心地滑入双腿之间，手指轻轻把玩着湿润的阴部，另一只手则揉着肚子。");
               outputText("[pg]终于注意到你停留在她身体上的目光，索菲抬起头，带着多情的微笑看着你，她那丰满、肥沃的大腿张开，向你炫耀着她紧致红肿的小穴。这位主妇向你展示着她怀孕的身体，向你展示你男子气概的成果，并诱惑你与她火热、充满欲望的身体玩耍。[pg]");
            }
            dynStats(DynStat.Lust(3));
         }
         else if(param1 == 2)
         {
            if(get_sophieBimbo().bimboSophie())
            {
               outputText("[pg]像往常一样，索菲躺在你的铺盖上。每天，她肚子里孕育着卵的丰满隆起似乎都在变大。这位确实怀孕了的女人带着母爱，悠闲地抚摸着她孕育着卵的肚子。她甚至在抚摸自己身体时，对着不断长大的隆起轻声咕哝，显然很喜欢自己又怀上了一枚卵的事实。没过多久，她就看到了你；她那丰满的嘴唇上绽放出一个大大的傻笑，急忙从你的毯子上爬起来，蹦蹦跳跳地向你走来。随着她的每一步，她那妖娆的身体都在摇晃和弹跳，她那丰满的胸部在起伏和颤动，她那成熟圆润的臀部像果冻一样颤抖，她为你摇摆着她那多产的臀部。");
               outputText("[pg][say: 你在这儿啊，[name]！快，看看我！你的卵在我肚子里变得<b>这么</b>大了！快看，我有多大，多性感！]这个无脑花瓶女人叽叽喳喳地说着，把她那曲线优美的身体贴在你身上，确保你能感觉到她那大而柔软的乳房和不断长大的孕肚。从她身体的触感来看，你确信她那原本就丰满的、像无脑花瓶一样的乳房因为怀孕而变得更大了。[say: 谢谢你让我怀孕什么的！][pg]");
            }
            else
            {
               outputText("[pg]像往常一样，索菲躺在你的铺盖上。每天，她肚子里孕育着卵的丰满隆起似乎都在变大。这位确实怀孕了的女人带着母爱，悠闲地抚摸着她孕育着卵的肚子。她甚至在抚摸自己身体时，对着不断长大的隆起轻声咕哝，显然很喜欢自己又怀上了一枚卵的事实。没过多久，她就看到了你；她那嘴唇上绽放出一个大大的傻笑，急忙从你的毯子上爬起来，蹦蹦跳跳地向你走来。随着她的每一步，她那妖娆的身体都在摇晃和弹跳，她那丰满的胸部在起伏和颤动，她那成熟圆润的臀部像果冻一样颤抖，她为你摇摆着她那多产的臀部。");
               outputText("[pg][say: 嘿，[name]。看看我！那个卵在我肚子里变得这么大了。你不知道这感觉有多好，]这个自信的女人叽叽喳喳地说着，把她那曲线优美的身体贴在你身上，确保你能感觉到她那大而柔软的乳房和不断长大的孕肚。从她身体的触感来看，你确信她那原本就丰满的乳房因为怀孕而变得更大了。[say: 也许再过一个月左右，我会让你再来一次……][pg]");
            }
            dynStats(DynStat.Lust(5));
         }
         else if(param1 == 3)
         {
            if(get_sophieBimbo().bimboSophie())
            {
               outputText("[pg]再一次，你怀孕的无脑花瓶懒洋洋地躺在你的铺盖上，她的脸埋在你的枕头里，深深地呼吸着你的气味。即使她处于这样一种——脆弱的……姿势，脸朝下，屁股朝上，你也能清楚地看到她那孕育着卵的肚子又大又圆的隆起。你那长着羽毛的荡妇怀孕了，你确信用不了多久她就会产下那枚撑大子宫的卵。仿佛感觉到了你的目光，索菲开始摇摆她那圆润、让人想打屁股的臀部，她的腿似乎也张得更开了。当她回头看你时，你的怀疑得到了证实；她那丰满的无脑花瓶嘴唇向你飞吻，用充满欲望的眼睛看着你。");
               outputText("[pg]这只多情的鹰身女妖几乎是从你的床上跳了起来，她那妖娆的身体随着每一步都在弹跳，蹦蹦跳跳地向你走来。尽管她已经身怀六甲，但索菲似乎把自己照顾得很好，这位充满母性魅力的鹰身女妖很好地适应了怀着沉重卵的状态。趁着你一时分心，这个兴奋、快乐的无脑花瓶向你扑来，把你扑倒并开心地拥抱你。她把她那沉甸甸的孕肚和巨大、挺拔的乳房贴在你身上，说道，[say: 噢！很快就要生了，索菲妈妈马上就要为你生下这枚漂亮的大卵了，宝贝！]她凑上前，在你的脸颊上印下了一个大大的湿吻，然后把手滑向她那圆润隆起的肚子。[say: 这也会是一枚非常大的卵！别担心，我很擅长产卵，而且我的小穴会为你保持得紧紧的，宝贝！][pg]");
            }
            else
            {
               outputText("[pg]再一次，你怀孕的鹰身女妖懒洋洋地躺在你的铺盖上，她的脸埋在你的枕头里，深深地呼吸着你的气味。即使她处于这样一种——脆弱的……姿势，脸朝下，屁股朝上，你也能清楚地看到她那孕育着卵的肚子又大又圆的隆起。这个长着羽毛的荡妇怀孕了，你确信用不了多久她就会产下那枚撑大子宫的卵。仿佛感觉到了你的目光，索菲开始摇摆她那圆润、让人想打屁股的臀部，她的腿似乎也张得更开了。当她回头看你时，你的怀疑得到了证实；她撅起嘴唇向你飞吻，用充满欲望的眼睛看着你。");
               outputText("[pg]这只多情的鹰身女妖几乎是从你的床上跳了起来，她那妖娆的身体随着每一步都在弹跳，蹦蹦跳跳地向你走来。尽管她已经身怀六甲，但索菲似乎把自己照顾得很好，这位充满母性魅力的鹰身女妖很好地适应了怀着沉重卵的状态。趁着你一时分心，她向你扑来，把你扑倒并开心地拥抱你。她把她那沉甸甸的孕肚和巨大、挺拔的乳房贴在你身上，说道，[say: 很快就到时候了……不知不觉中，我就会生下这枚肿胀的大卵，而你就在旁边看着！]她凑上前，在你的脸颊上印下了一个大大的湿吻，然后把手滑向她那圆润隆起的肚子。[say: 这也会是一枚非常大的卵！别担心，我很擅长产卵，而且我的小穴在它出来后就会为你准备好！][pg]");
            }
            dynStats(DynStat.Lust(5));
         }
      }
      
      public function sophiesDaughterDescript() : void
      {
         if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,741) == 325)
         {
            outputText("[pg]你可爱的小鹰身女妖还只是一只小雏鸟。她的身体娇小，像个孩子，羽毛毛茸茸、蓬松松的，让你这小女儿的手脚看起来就像长了绒球一样。这只小鹰身女妖看起来已经有四五岁了，和同龄的人类小孩一样精力充沛。她四处扑腾，从一样东西爬到另一样东西上。谢天谢地，这个吵闹的小宝贝很快就耗尽了她那爆炸般的精力，突然倒在地上，缩成毛茸茸的一团，开始打盹。[pg]");
         }
         if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,741) == 200)
         {
            outputText("[pg]你可爱的小鹰身女妖开始长大了！她的身体比以前大多了，虽然婴儿肥已经分布在她更大的身躯上，看起来比你习惯看到的那些大屁股鹰身女妖要瘦长一些。她的羽毛甚至开始变得光滑，尽管她仍然是个毛茸茸的球。你确信，用不了多久，鹰身女妖标志性的曲线就会开始显现。她作为小雏鸟时散发出的精力依然驱使着她去“恐吓”你的营地，四处乱窜，从一个地方扑腾到另一个地方，什么都要插一脚。你毛茸茸的女儿似乎能比以前保持更长时间的活跃，尽管你仍然时不时看到她蜷缩起来打盹。[pg]");
         }
         if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,741) == 100)
         {
            outputText("[pg]你环顾四周，寻找你正在发育的女儿，发现她和你的");
            if(get_sophieBimbo().bimboSophie())
            {
               outputText("吵闹的无脑花瓶");
            }
            else
            {
               outputText("成熟的鹰身女妖");
            }
            outputText("正在共度美好的母女时光。索菲正在帮小女孩化妆，教她如何使用她族人非常喜欢的金色催情唇膏。你不太确定这对你的女儿来说是否合适，但话又说回来，鹰身女妖不就是这样的吗？除了催情唇膏，你同居的");
            if(get_sophieBimbo().bimboSophie())
            {
               outputText("无脑花瓶");
            }
            else
            {
               outputText("鸟类女友");
            }
            outputText("接着弄她的头发和指甲，同时喋喋不休地谈论着你，以及她计划要生的所有女儿。");
            outputText("[pg]你的女儿长得真快！她的身体已经开始发育，胸前长出了柔软的乳包。她的臀部开始膨胀，变成了鹰身女妖闻名遐迩的标志性生育臀和圆润好抓的屁股。[pg]");
         }
      }
      
      public function sophieWonCombat() : void
      {
         get_sophieBimbo().sophieSprite();
         FlagDict_Impl_.arrayWriteInt(KFLAGS.flags,755,0);
         if(get_player().hasCock())
         {
            if(get_player().cockThatFits(232) < 0)
            {
               tooBigForOwnGoodSophieLossRape();
            }
            else if(get_player().biggestCockArea() <= 5)
            {
               tinyDickSupremeSophieLoss();
            }
            else
            {
               normalLossRapuuuuSophie();
            }
         }
         else
         {
            SophieLossRapeNoDonguuuu();
         }
      }
      
      public function sophieVictoryPussyGrind() : void
      {
         get_sophieBimbo().sophieSprite();
         clearOutput();
         outputText("索菲");
         if(get_monster().get_HP() < 1)
         {
            outputText("被打得无力反抗，半昏迷地瘫倒在地上。");
         }
         else
         {
            outputText("欲火焚身，无力反抗，正用力地用拳头操着她那巨大的小穴。你把她长满羽毛的手臂从发情的小穴里拉出来，推到一边。");
         }
         outputText("这只鹰身女妖需要学习一下如何享受另一个女人的抚摸。你强行掰开她的大腿，但还没等你做什么，她就又合上了。你烦躁地低吼一声，在她" + (get_noFur() ? "" : "长满羽毛") + "的屁股上拍了一巴掌，然后把它们完全拉开。索菲恢复了理智，瞪着你骂道：[say: 小女孩，我不想要也不需要你，更不需要你的小穴。][pg]");
         outputText("[say:闭嘴，你这长满羽毛的老太婆。我赢了，我想感觉那肥厚的鸟唇在我的阴蒂上摩擦，]你回答道。索菲不悦地颤抖了一下，但当你");
         if(get_player().isTaur())
         {
            outputText("把你四只脚中的一只滑到她的膝盖下，顺着她的身体向上滑时，她停止了抗议。");
         }
         else if(get_player().isGoo())
         {
            outputText("用你史莱姆般的下半身吞没她的一条腿，并向她靠近时，她停止了抗议。");
         }
         else if(get_player().hasTailInsteadOfLegs())
         {
            outputText("把你的[if (isNaga){蛇一样的 |[if (isMer) {鱼一样的 }]}]尾巴滑入她的双腿之间，顺着她的身体向上滑时，她停止了抗议。");
         }
         else
         {
            outputText("把你的腿勾在她的腿下，顺着她的身体向上滑时，她停止了抗议。");
         }
         outputText("你挪近了一些，直到你能感觉到她下体的热气扑面而来。带着情色的精准，你降低你的" + get_player().vaginaDescript(0) + "，直到索菲那巨大、肿胀的阴唇接触到你自己的。你们俩都舒服地喘息着，但从她的语气中可以明显看出，这位鸟类主母并不喜欢这样。[pg]");
         if(get_player().getClitLength() < 2)
         {
            outputText("你的[clit]在你的阴唇内肿胀起来，变成了一个坚硬的快乐小凸起。你开心地呻吟着，开始把你的" + get_player().vaginaDescript(0) + "在索菲湿润的裂口上前后摩擦，每次撞到她自己迅速充血的阴蒂时都会颤抖。");
         }
         else if(get_player().getClitLength() < 5)
         {
            outputText("你的" + get_player().clitDescript() + "肿胀起来，像一根微型阴茎一样从你的阴唇中突出。你快乐地呻吟着，开始在索菲湿润的阴道上前后抽插你的" + get_player().vaginaDescript(0) + "，当你的[clit]不断地滑进滑出时，你颤抖着。鹰身女妖自己的阴蒂也很快变硬，当你的臀部在她的身上旋转时，你感觉到它愉快地撞击着你。");
         }
         else
         {
            outputText("你的[clit]肿胀起来，长到了像阴茎一样淫秽的大小。你快乐地呻吟着，开始抚摸这个极其敏感的突起。在此期间，你的臀部继续将你的" + get_player().vaginaDescript(0) + "压在鹰身女妖的阴部上，你感觉到她自己的阴蒂也开始发芽变硬。它在你们被淫液浸湿的身体之间摩擦，让你的臀部在令人愉悦的感觉中颤抖和抽搐。");
         }
         outputText("随着剪刀式摩擦的加剧，空气中充满了响亮的挤压声和液体声，没过多久，索菲的身体就被一层薄薄的汗水覆盖，并泛起红晕。");
         if(get_player().biggestTitSize() >= 1)
         {
            outputText("你捏住一个[nipple]");
         }
         else
         {
            outputText("你弓起背");
         }
         outputText("并用沙哑的声音质问，[say:自慰怎么可能比这感觉更好？你感觉不到我们把彼此弄得多湿吗？我的小穴简直在燃烧着渴望，我能感觉到这让你有多热。承认吧，我的小穴感觉棒极了。][pg]");
         outputText("这位一向镇定的年长鹰身女妖在回答时实际上看起来有点迷茫和困惑，[say:感觉还行……我的意思是，这比自慰好……]你死死地盯着她的眼睛，停止了下半身的动作。索菲不满地咕哝了一声，回头用一种恳求、渴望的眼神看着你。她的大腿笨拙地在你身上摩擦，但当她无法让它感觉像你做的那样好时，她很快就放弃了。[pg]");
         outputText("[say:好吧，好吧！感觉棒极了……求你别停，]索菲乞求道。她托起自己丰满的乳房，挑逗着自己的乳头，试图诱惑你恢复动作。她对你带来的快感的屈服正是你想听到的话。你回到了激烈的剪刀式摩擦中，并加快了速度，直到你们俩都因为用力而颤抖，浑身被汗水浸透。一只盘旋的鹰身女妖喊道，[say:荡——妇——！]但你对那只鸟竖起了中指，并附带了一个诱惑的眼神。她厌恶地飞走了，很快就被遗忘了。[pg]");
         outputText("淫液开始顺着你的" + get_player().assDescript() + "的缝隙流下，片刻之后你就高潮了。");
         if(get_player().cockTotal() > 0)
         {
            outputText("" + get_player().SMultiCockDesc() + "爆发了，将精液溅了她一身。鸟人看着这乱七八糟的景象，就像看着浪费掉的潜力一样，但这只会让你笑得更开心。");
            if(get_player().cumQ() >= 400)
            {
               if(get_player().cumQ() < 1000)
               {
                  outputText("精液像雨点般落下，直到她被彻底涂满。");
               }
               else
               {
                  outputText("精液像雨点般落下，直到她被彻底涂满，巢穴里也充满了你的精液坑。");
               }
            }
         }
         outputText("索菲咕哝着呻吟着，你那有节奏的研磨变成了类似癫痫发作的痉挛。疯狂的摩擦将她推向了边缘，让她的大腿抽搐，双腿张开。");
         if(get_player().vaginas[0].vaginalWetness >= 5)
         {
            outputText("汁液从结合的阴部喷射而出");
         }
         else if(get_player().vaginas[0].vaginalWetness >= 3)
         {
            outputText("汁液浸透了筑巢材料");
         }
         else if(get_player().vaginas[0].vaginalWetness >= 2)
         {
            outputText("汁液从成对的阴部滴落");
         }
         else
         {
            outputText("索菲的阴部用她的汁液浸透了你自己的阴部");
         }
         outputText("直到你们从彼此身上倒下，精疲力竭地揉着你们娇嫩的阴部。年长的鸟人不情愿地承认，");
         if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,98) == 0)
         {
            outputText("[say:小可爱，你确实很懂怎么玩弄小穴，但我就是不喜欢做这种事。别指望我会成为那种随叫随到舔你小穴的女同鸟荡妇。]");
         }
         else if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,98) < 6)
         {
            outputText("[say:小可爱，你每次都能让我爽翻天，但我还是不想和别的女孩搞在一起。我更喜欢让一个年轻男人进我的巢穴，让他蹂躏我。]");
         }
         else
         {
            outputText("[say: 我不知道你是怎么让我高潮的，但如果你能停下来，我会很感激的。]");
         }
         outputText("[pg]");
         outputText("[say: 别以为我已经放弃你了。总有一天你会回心转意的，]你一边穿衣服一边宣布。完事后神清气爽，你拍了拍她" + (get_noFur() ? "" : "长满羽毛") + "的屁股，跳出她的巢穴，爬下山去。");
         get_player().orgasm("Vaginal");
         dynStats(DynStat.Sens(-1));
         sophieFucked(false);
         get_combat().cleanupAfterCombat();
      }
      
      public function sophieRouter() : void
      {
         if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,90) == 0)
         {
            meetSophie();
         }
         else
         {
            meetSophieRepeat();
         }
      }
      
      public function sophieMeetingGotLost() : void
      {
         get_sophieBimbo().sophieSprite();
         clearOutput();
         outputText("你解释说你正在探索群山，并羞怯地承认你迷路了。索菲咯咯地笑了起来，[say: 那你很幸运我在这里。有些其他的女孩，她们可能会占你的便宜。年轻的鹰身女妖们都忙着受精和下蛋，她们可不像我这样懂得欣赏好伙伴和愉快的谈话。][pg]");
         outputText("这位年长的鹰身女妖斜倚在她的巢里，一边说话一边把手伸进她肌肉发达的大腿之间，");
         if(get_player().totalCocks() > 0)
         {
            outputText("[say: 你愿意留下来帮助一位孤独的主妇满足她的需求吗？][pg]");
            doYesNo(consensualSexSelector,shootDownSophieSex);
         }
         else if(get_player().biggestLactation() >= 1.5)
         {
            outputText("[say: 哎呀，你可真是一头奶水充足的小母牛，不是吗？介意分享一下吗？][pg]");
            doYesNo(cramANippleInIt,shootDownSophieSex);
         }
         else
         {
            outputText("[say: 嗯，真可惜你没有阴茎，不然你就可以让我见识见识我错过了什么。] 这位欲求不满的鸟人花了大半个小时向你询问外面的世界，在谈话中途还自慰高潮了好几次。等她精疲力尽后，她向你道谢，然后躺下准备小睡。她的尾羽蓬松起来，显然是在下逐客令。");
            dynStats(DynStat.Lust(10 + get_player().lib / 4));
            if(get_player().get_inte100() < 50)
            {
               dynStats(DynStat.Inte(1));
            }
            doNext(get_camp().returnToCampUseOneHour);
         }
      }
      
      public function sophieMeetingChoseSex() : void
      {
         get_sophieBimbo().sophieSprite();
         clearOutput();
         if(get_player().totalCocks() == 0)
         {
            outputText("索菲上下打量着你");
            if(get_player().hasVagina())
            {
               outputText("并坚持道，[say: 好吧，继续找吧；如果我想要个女孩，我现在正忙着和我的侄女们在一起呢。]");
            }
            else
            {
               outputText("。");
            }
            outputText("她转过身，向你抖了抖尾羽，这显然是在下逐客令。");
            if(get_player().hasVagina())
            {
               outputText("你该怎么做？");
               menu();
               addButton(0,"强上",FirstTimeSophieForceSex);
               setExitButton();
               return;
            }
            doNext(get_camp().returnToCampUseOneHour);
            return;
         }
         outputText("索菲退到巢穴的另一边，诱人地张开她肌肉发达的大腿。这位鹰身女妖要求道，[say: 那就来吧，我已经好久没有被这么强壮的年轻标本伺候过了。别让我等太久，小可爱。][pg]");
         outputText("仿佛你能拒绝这位充满母性的鹰身女妖那曲线优美、性感的身体似的……");
         doNext(consensualSexSelector);
      }
      
      public function sophieLostCombat() : void
      {
         var _g:Combat;
         get_sophieBimbo().sophieSprite();
         FlagDict_Impl_.arrayWriteInt(KFLAGS.flags,755,0);
         outputText("");
         if(get_monster().get_HP() < 1)
         {
            outputText("她伤得太重无法战斗，凄惨地蜷缩在巢穴里。");
         }
         else
         {
            outputText("她发情得太厉害，已经构不成威胁了，正开心地自慰着。");
         }
         menu();
         addButtonDisabled(0,"用肉棒");
         addButtonDisabled(1,"磨豆腐");
         addButtonDisabled(2,"操阴蒂");
         addButtonDisabled(3,"变荡妇");
         if(get_player().get_lust() >= 33 && get_player().hasCock())
         {
            if(get_player().cockThatFits(232) == -1)
            {
               addButton(0,"用肉棒",maleVictorySophieRapeHUGE);
            }
            else
            {
               addButton(0,"用肉棒",maleVictorySophieRape);
            }
         }
         if(get_player().get_lust() >= 33 && get_player().hasVagina())
         {
            addButton(1,"磨豆腐",sophieVictoryPussyGrind);
            if(get_player().getClitLength() >= 5)
            {
               addButton(2,"操阴蒂",fuckDatClit);
            }
         }
         if(get_player().hasItem(get_consumables().BIMBOLQ))
         {
            addButton(3,"把她变成无脑花瓶",get_sophieBimbo().bimbotizeMeCaptainSophie);
         }
         _g = get_combat();
         addButton(14,"离开",function():void
         {
            _g.cleanupAfterCombat();
         });
      }
      
      public function sophieLookingForDemons() : void
      {
         get_sophieBimbo().sophieSprite();
         clearOutput();
         outputText("索菲仰起头大笑起来。[say: 别担心这里会有什么恶魔。只要有恶魔蠢到敢靠近我们的巢穴，我们就会给他一个终生难忘的“足交”。]为了说明这一点，这位胸部丰满的鹰身女妖抬起腿，自豪地展示了她那剃刀般锋利的爪子。");
         if((get_player().isCorruptEnough(60) || get_player().get_lust100() > 60 || get_player().lib > 70) && get_player().hasCock())
         {
            outputText("尽管情况危险，你的目光还是落在了她双腿之间完全暴露的私处。你点头同意她的话，借此争取了几秒钟的时间来观察她的阴道。它泛着粉红色，比人类的要大得多；也许是因为她产下的蛋的尺寸？[pg]");
            outputText("[saystart]嗯……你是不是觉得聊天太无聊了，");
            if(get_player().get_tallness() <= 48)
            {
               outputText("小");
            }
            else if(get_player().get_tallness() >= 72)
            {
               outputText("大");
            }
            outputText("[boy]？你好像看到了你想要的东西，[sayend]这位曲线优美的鸟身女妖观察着你。[say: 来我的巢里吧，[name]；我已经好久没有被好好……受精过了。]索菲放松下来，等待你的回应。[pg]");
            outputText("她的话语深深印入你的脑海，一种想要跟她走的冲动几乎要战胜你的自制力。你深吸一口气，清醒了头脑。你要跟她走吗？");
            doYesNo(consensualSexSelector,shootDownSophieSex);
            return;
         }
         outputText("你咽了口唾沫，点了点头，非常清楚鹰身女妖不喜欢恶魔出现在她们的筑巢地。索菲笑了笑，转过身去，向你抖了抖紫色的尾羽，这显然是在下逐客令。");
         doNext(get_camp().returnToCampUseOneHour);
      }
      
      public function sophieFucked(param1:Boolean = true) : void
      {
         var _loc2_:* = null as IMap;
         if(!pregnancy.get_isPregnant() && param1)
         {
            pregnancy.knockUpForce(25,48 + Utils.rand(48));
         }
         if(!param1)
         {
            _loc2_ = KFLAGS.flags;
            FlagDict_Impl_.arrayWriteInt(_loc2_,98,FlagDict_Impl_.arrayReadInt(_loc2_,98) + 1);
            if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,96) <= 0)
            {
               FlagDict_Impl_.arrayWriteInt(KFLAGS.flags,96,72 + Utils.rand(100));
               _loc2_ = KFLAGS.flags;
               FlagDict_Impl_.arrayWriteInt(_loc2_,97,FlagDict_Impl_.arrayReadInt(_loc2_,97) + 1);
            }
            else
            {
               _loc2_ = KFLAGS.flags;
               FlagDict_Impl_.arrayWriteInt(_loc2_,96,FlagDict_Impl_.arrayReadInt(_loc2_,96) + Utils.rand(72));
            }
         }
         _loc2_ = KFLAGS.flags;
         FlagDict_Impl_.arrayWriteInt(_loc2_,91,FlagDict_Impl_.arrayReadInt(_loc2_,91) + 1);
      }
      
      public function sophieAtCamp() : Boolean
      {
         if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,283) > 0)
         {
            return false;
         }
         if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,1081) != 0)
         {
            return false;
         }
         if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,282) > 0)
         {
            return true;
         }
         if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,747) > 0)
         {
            return true;
         }
         return false;
      }
      
      public function shootDownSophieSex() : void
      {
         get_sophieBimbo().sophieSprite();
         clearOutput();
         outputText("索菲撅了一会儿嘴，身子前倾，更好地展示她的乳沟。[say: 真的吗？好吧，如果你改变主意了，随时回来找我。]她转过身，向你抖了抖尾羽，这显然是在下逐客令。你爬了下去，小心翼翼地避开其他巢穴，准备回去查看你的营地和传送门。");
         doNext(get_camp().returnToCampUseOneHour);
         if(get_player().get_lib100() > 25)
         {
            dynStats(DynStat.Lib(-1));
         }
         if(get_player().get_lust100() > 50)
         {
            dynStats(DynStat.Lust(-5));
         }
      }
      
      public function repeatBreastFeeding() : void
      {
         get_sophieBimbo().sophieSprite();
         clearOutput();
         outputText("你同意了，并爬完了剩下的路来到她的巢穴，发现索菲已经在那里等你了。");
         doNext(cramANippleInIt);
      }
      
      public function postSophieSexSnuggle() : void
      {
         get_sophieBimbo().sophieSprite();
         clearOutput();
         outputText("你四仰八叉地躺在索菲的巢里，任由她用翅膀保护性地包裹住你。她的手一直没闲着，交替着手淫");
         if(get_player().cockTotal() > 1)
         {
            outputText("你的每一根");
         }
         outputText("[cocks]或她自己沾满精液的小穴。这只鹰身女妖让自己高潮了好几次，显然很享受你的不适和她阴道的充实感。在这种快乐地狱中度过了几个小时后，你能感觉到你的身体又在酝酿着一发，索菲在你耳边低语，[say: 放松，为我全都喷出来吧。][pg]");
         outputText("她的羽毛挠着");
         if(get_player().cockTotal() > 1)
         {
            outputText("你所有的");
         }
         outputText("[cocks]");
         if(get_player().balls > 0)
         {
            outputText("和蛋蛋");
         }
         outputText("，同时她的手在抚摸和挤压，没过多久，你又一次为这只自信的鹰身女妖高潮了。白色的精液");
         if(get_player().cumQ() < 50)
         {
            outputText("喷射在你的身体上");
         }
         else if(get_player().cumQ() < 500)
         {
            outputText("溅满你的身体");
         }
         else if(get_player().cumQ() < 1000)
         {
            outputText("用浓稠的精液浸透你的身体");
         }
         else
         {
            outputText("在你的身体上爆发，汇成一条浓稠的河流顺着山流下");
         }
         outputText("，她熟练的双手让你释放了出来。你深深地陷入她的怀抱，叹了口气，终于开始软了下来。[pg]");
         outputText("你向她道谢，并");
         if(get_player().cor > 50)
         {
            outputText("差点给了她一个告别吻，但在最后一刻忍住了。她打趣道，[say: 太可惜了，那感觉挺好的。][pg]");
         }
         else
         {
            outputText("在她的脸颊上亲了一下，因为你太清楚她嘴唇的危险了。她打趣道，[say: 哦，太可惜了。我还想抚摸你入睡呢。][pg]");
         }
         get_player().removeStatusEffect(StatusEffects.Luststick);
         dynStats(DynStat.Lib(FlagDict_Impl_.arrayReadFloat(KFLAGS.flags,2071),DynStatOp.Eq));
         dynStats(DynStat.Lib(1),DynStat.Sens(1));
         doNext(get_camp().returnToCampUseFourHours);
      }
      
      public function postSexSophieSnuggleTurnedDown() : void
      {
         get_sophieBimbo().sophieSprite();
         clearOutput();
         outputText("你拒绝了她的提议，并向她保证你会没事的。当你试图穿衣服时，索菲咯咯地笑着，你看到她琥珀色的眼睛注视着你试图带着勃起的阴茎爬下山。她似乎对你的困境感到非常有趣。");
         dynStats(DynStat.Lib(1),DynStat.Sens(1));
         doNext(get_camp().returnToCampUseOneHour);
      }
      
      public function normalLossRapuuuuSophie() : void
      {
         get_sophieBimbo().sophieSprite();
         clearOutput();
         var _loc1_:int = get_player().cockThatFits(232);
         outputText("索菲带着怜悯的表情看着你被欲望折磨的身体。鹰身女妖漫步走过来，若有所思地说，[say:这真是浪费时间。你很容易就能进入状态，不是吗？为什么你下次不直接来操我，跳过所有的前戏呢？]这位充满母性的鸟身女妖花了一点时间梳理她羽毛般的头发，同时看着你的双手在你的" + get_player().cockDescript(_loc1_) + "");
         if(get_player().hasVagina())
         {
            outputText("和" + get_player().vaginaDescript(0) + "");
         }
         outputText("上无情地抽插。虽然她的眼中充满了温暖，但她脸上挂着的笑容却一点也不友善。[pg]");
         outputText("鹰身女妖俯下身，用她肿胀的乳房蹭过你的");
         if(get_player().biggestTitSize() >= 1)
         {
            outputText(get_player().allBreastsDescript());
         }
         else
         {
            outputText("胸部");
         }
         outputText("。你因为突然增加的压力而扭动着身体，但索菲靠得更近，在你的耳边低语，[say:你对索菲妈妈发情了呢。]她的手滑进你的[armor]里，一边脱你的衣服，一边对你进行着试探性的揉捏。[pg]");
         outputText("[say:哦哦，你简直要滴水了。" + get_player().mf("男孩","女孩") + "，你确定你不想要这个吗？哦吼，我刚刚感觉到你在我手里抽动了一下。你想要的！]鹰身女妖主母大声宣布。她的话在你的脑海中嗡嗡作响，啃噬着你的不情愿；你几乎确信你确实想要这个。你刚才反抗索菲的时候一定是搞错了。这位美丽的巨乳鹰身女妖只是在给你你想要的东西。当你点头回应时，她的脸上浮现出美丽的笑容。她高兴地叽叽喳喳地说，[say:好[boy]。][pg]");
         outputText("她的赞美让你感到一种幸福的、痒痒的感觉，让你渴望取悦这只鹰身女妖。这似乎……不对劲。你刚才不是还在和她战斗吗？索菲察觉到了你的困惑，把你的头拉进她的乳沟里，一直温柔地安抚你。[say:不，不，这就是你想要的。感觉到你有多硬了吗？那只是你对索菲妈妈需求的一小部分。你想要我的释放。]这些话在你的耳边嗡嗡作响，打消了你对自己怎么会落到这步田地的疑虑。她是对的——这就是你想要的。[pg]");
         outputText("索菲对你的顺从感到满意，她跨过你的腰，骑在你的身上。她长满羽毛的腿其实有点痒，但她小穴周围那光滑、略带粉红色的皮肤要求你毫无疑问地关注。水珠挂在守卫着她入口的巨大阴唇上，诱惑着你进入，感受它们包裹着你。年长的女人抓住你的鸡巴，会意地揉了揉；她已经完全掌控了你。她那宽阔的、适合产卵的臀部降了下来，将她性器官光滑的血肉压在你的" + get_player().cockDescript(_loc1_) + "上，让你预演一下接下来会发生什么。");
         if(get_player().balls > 0)
         {
            outputText("汁液滴落在你的[balls]上，它们翻滚着，为你的鹰身女妖情人积攒着浓稠的精液。");
         }
         outputText("你抓住她的臀部，紧贴着她扭动身体，直到你的" + get_player().cockDescript(_loc1_) + "恰好对准位置。[pg]");
         outputText("索菲的臀部压了下来，用她那巨大的小穴吞没了你的" + get_player().cockDescript(_loc1_) + "。起初感觉并没有多好，直到她的双腿锁住你的背部，开始用力挤压。她肌肉发达的大腿几乎将你固定在一个紧密、布满羽毛的拥抱中。这种紧绷感传递到她湿润的阴户，感觉就像她那巨大的肉洞试图从你的" + get_player().cockDescript(_loc1_) + "里榨出精液。这位年长鹰身女妖的呼吸拂过你的");
         if(get_player().get_tallness() >= 72)
         {
            outputText("脖子");
         }
         else if(get_player().get_tallness() > 48)
         {
            outputText(get_player().faceDescript());
         }
         else
         {
            outputText("头");
         }
         outputText("，她开始真正进入状态。她涂着金色唇彩的嘴在光线下闪烁，将柔软的双唇贴在你的唇上。她甜美的味道让你头晕目眩，同时她粗暴地用舌头侵犯你的嘴。这感觉粗暴、野蛮，而且如此火辣，以至于你的" + get_player().cockDescript(_loc1_) + "已经开始危险地发麻。[pg]");
         outputText("你通过舔舐和吸吮她的嘴唇来反击，甚至把舌头伸进她的嘴里与她的舌头纠缠。她在退开前在你嘴里娇喘，拉出银丝。[say: 哦，好[boy]。真是个年轻、精力充沛的标本。我的嘴唇会让你在接下来的八个小时配种里一直保持勃起和坚挺。再给妈妈一个吻以防万一，]索菲命令道。你毫不犹豫、毫无遗憾地贴上她的嘴唇，就像一个溺水的人抓住救生筏一样。她全程紧紧挤压着你，你的背部在达到高潮时弓起。精液从你的肉棒喷射而出，深深射入那火热、湿润的深处。");
         if(get_player().cumQ() < 50)
         {
            outputText("当快感的狂潮席卷全身时，你紧紧抓住她的手臂，勉强支撑着。");
         }
         else if(get_player().cumQ() < 250)
         {
            outputText("当快感的狂潮挤出越来越多的精液时，你紧紧抓住她的手臂。很难保持清醒，但你还是挺过来了。");
         }
         else
         {
            outputText("当快感的狂潮逼出越来越大的精液浪潮时，你紧紧抓住她的手臂。索菲的肚子实际上因为所有的精液而鼓了起来");
            if(get_player().cumQ() >= 1500)
            {
               outputText("，甚至有一些溢出来淹没了巢穴");
            }
            outputText("。很难保持清醒，但你还是勉强坚持住了，脸上挂着傻笑。");
         }
         outputText("当你把最后一点白色粘液射入她的深处时，索菲的臀部把你拉得更紧了。她喃喃道：[say: 第一次射精还不错。]她的声音变得嗡嗡作响，建议道：[say: 你现在变得更硬了，小[boy]。嗯，你很快就会再射的。]这些话钻进你的心里，似乎把更多的血液挤进了你的" + get_player().cockDescript(_loc1_) + "。它变得如此坚硬以至于有些疼痛，她肉壁的紧致几乎让人无法忍受。当你第二次、第三次、第四次射精时，这位鸟身女妖的脸上露出了温柔但心领神会的微笑……");
         get_player().orgasm("Dick");
         dynStats(DynStat.Sens(5));
         sophieFucked();
         luststickApplication(8);
         get_combat().cleanupAfterCombat();
      }
      
      public function meetSophieRepeat() : void
      {
         get_sophieBimbo().sophieSprite();
         clearOutput();
         if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,96) > 0)
         {
            outputText("在探索群山的过程中，你又一次靠近了鹰身女妖的巢穴。糟了。背景中一直有一种持续不断的、令人烦躁的嗡嗡声，让你很难集中注意力。你爬上一个壁架，发现自己又回到了索菲巢穴的边缘。该死。她怒视着你，举起了一只爪子。要开打了！[pg]");
            startCombat(new Sophie());
            return;
         }
         if(get_player().totalCocks() > 0)
         {
            if(Utils.rand(2) == 0 && !pregnancy.get_isPregnant())
            {
               outputText("在探索群山的过程中，你又一次靠近了鹰身女妖的巢穴，索菲拍打着翅膀朝你飞来。她的乳房诱人地晃动着，还没等你阻止，她就用爪子勾住了你用来固定小袋子的腰带。她拍打翅膀的力量将你拉离了山体，将你悬在离地数百英尺的高空，带着你飞回她的巢穴。");
               if(get_player().get_tallness() > 72)
               {
                  outputText("这只鹰身女妖吃力地承受着你的体重，当她把你带到她的巢穴时，显然已经气喘吁吁了。");
               }
               else
               {
                  outputText("谢天谢地，飞行时间很短，当她把你带到她的巢穴时，你还能很好地欣赏到山腰的景色。");
               }
               outputText("索菲松开爪子，你利落地落在了另一边。她喘着粗气，[say: 繁殖时间到了。" + get_player().mf("男孩","女孩") + "，现在就来让我受孕。][pg]");
               if(get_player().get_lust100() < 60 || Utils.rand(3) <= 1)
               {
                  outputText("她的需求放大了这种冲动，让你难以抗拒。看起来如果你现在拒绝她，她可能也会试图强上你。你要屈服于她的要求吗？");
                  menu();
                  addButton(0,"同意",consensualSexSelector);
                  addButton(1,"否",fightSophie);
               }
               else
               {
                  outputText("她的需求放大了这种冲动，而你已经被挑起了性欲，根本无法抗拒。");
                  doNext(consensualSexSelector);
               }
               return;
            }
            if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,91) > 0)
            {
               outputText("在探索群山的过程中，你又一次靠近了鹰身女妖的巢穴，索菲拍打着翅膀朝你飞来。她的乳房诱人地晃动着，还没等你阻止，她就用爪子勾住了你用来固定小袋子的腰带。她拍打翅膀的力量将你拉离了山体，将你悬在离地数百英尺的高空，带着你飞回她的巢穴。");
               if(get_player().get_tallness() > 72)
               {
                  outputText("这只鹰身女妖吃力地承受着你的体重，当她把你带到她的巢穴时，显然已经气喘吁吁了。");
               }
               else
               {
                  outputText("谢天谢地，飞行时间很短，当她把你带到她的巢穴时，你还能很好地欣赏到山腰的景色。");
               }
               outputText("索菲松开你，扑通一声倒在你对面，显然累坏了。她问道，[saystart]你大老远爬上来就是为了看我吗？真是太贴心了！");
               if(pregnancy.get_isPregnant())
               {
                  outputText("我还没生下你的蛋呢，不过如果你想的话，解决一下你那调皮的小冲动应该也会很有趣。");
               }
               else
               {
                  outputText("我已经生下你上次的蛋了，所以你为什么不过来给妈妈一点甜头尝尝呢？");
               }
               outputText("[sayend] 她的双腿张开，邀请你再次品尝她的欢愉。[pg]");
            }
            else
            {
               outputText("在探索群山时，你不知不觉又靠近了鹰身女妖的巢穴。你听到微风中传来微弱的嗡嗡声，但没有理会，而是专注于攀登岩石山。你爬上一个壁架，发现自己再次与鹰身女妖索菲面对面。她正捏着自己的一个乳头，抚摸着她湿润小穴的入口。它因为欲望而泛着鲜艳的粉红色，索菲在愉悦的喘息间解释道，[say: 自从上次见到你，小可爱，我就一直在想你。我平时就是个发情的骚货，但我真的很想让像你这样精力充沛的" + get_player().mf("男孩","种马") + "来给我的蛋受精。]她张开双腿向后靠去，向你提出了一个半是建议、半是命令的提议，[say: 过来，把它插进我里面。我保证我会比处女还要紧，比魅魔还要湿。][pg]");
            }
            outputText("(她的话语深深印入你的脑海，想要跟她走的欲望几乎要战胜你的自制力。你深吸一口气，清醒了一下头脑。你是跟她走，拒绝她，还是试图掌控局面，成为主导者？你可能需要和她打一架才能支配她……)");
            dynStats(DynStat.Lust(20));
            menu();
            addButton(0,"同意",consensualSexSelector);
            addButton(1,"拒绝",shootDownSophieSex);
            addButton(2,"支配",fightSophie);
            return;
         }
         if(get_player().biggestLactation() < 1)
         {
            outputText("你的攀登让你再次回到了鹰身女妖的巢穴。索菲飞落到你身边警告说，[say: 小可爱，像你这样的" + get_player().mf("无性人","女孩") + "不属于这里。年轻的鹰身女妖不太懂怎么交流，她们会把你当成竞争对手。][pg]");
            outputText("你是觉得她的话有道理，爬下山去，还是和索菲打一架，或者继续攀登？");
            menu();
            addButton(0,"和索菲战斗",FirstTimeSophieForceSex);
            addButton(1,"继续攀登",PCIgnoresSophieAndHarpyIsFought);
            setExitButton();
            return;
         }
         outputText("你的攀登让你再次回到了鹰身女妖的巢穴。索菲飞落到你身边，饥渴地舔了舔嘴唇。她问道，[say: 你介意来我的巢穴分享一点你的奶水吗？我真的很渴望喝到可爱女孩的奶水。][pg]");
         outputText("你同意给这只饥饿的鹰身女妖喂奶吗？");
         menu();
         addButton(0,"同意",cramANippleInIt);
         addButton(1,"拒绝",shootDownSophieSex);
         addButton(2,"和她战斗",FirstTimeSophieForceSex);
      }
      
      public function meetSophie() : void
      {
         get_sophieBimbo().sophieSprite();
         var _loc1_:IMap = KFLAGS.flags;
         FlagDict_Impl_.arrayWriteInt(_loc1_,90,FlagDict_Impl_.arrayReadInt(_loc1_,90) + 1);
         clearOutput();
         outputText("你带着缓慢而疲惫的决心，在山口间进行着艰苦的跋涉。随着你越爬越高，你感觉自己几乎可以伸手触摸到环绕在山顶的无处不在的云层。当你靠近鹰身女妖的筑巢区时，空气中充满了数十只鹰身女妖翅膀拍打的声音。它们飞走并在远处盘旋，似乎暂时满足于观察你。你环顾四周，发现了许多装满卵的巢穴，然后决定最好远离它们。母亲们并没有走远。你继续向上攀登，特别小心不去打扰那些巢穴，但这番努力白费了。[pg]");
         outputText("当你把自己拉上一个特别狭窄的壁架时，你与一只鹰身女妖奇异的面容面对面了。她一定是听到了你攀爬的声音，过来查看。现在她离你只有几英寸远，看着");
         if(get_player().get_tallness() <= 48)
         {
            outputText("下面");
         }
         else if(get_player().get_tallness() >= 72)
         {
            outputText("上面");
         }
         outputText("用她那好奇的琥珀色眼睛看着你。一股淡淡的甜香从她身上飘来，她用长而尖的舌头舔了舔涂着黄色唇彩的嘴唇。你向旁边迈了一步，试图远离身后陡峭的悬崖，但鹰身女妖用双手抓住了你的肩膀，用一种非常令人安心的语气说道，[say: 放松点，小可爱，我不会把你掉下去的。][pg]");
         outputText("当鹰身女妖感觉到你的肌肉开始放松时，她讨好地笑了笑，你也有机会好好地、近距离地看看她。她有两对翅膀：一对从背部长出的大翅膀，以及一对似乎是手臂和翅膀结合体的副翅膀。较小的那对翅膀在手腕后方变厚，展示出长而有光泽的羽毛。你原本以为是粉红色头发的东西，实际上是一团长长的、毛茸茸的羽毛，垂到她的肩膀上。最后也是最难忽视的是她的乳房。与你之前惊吓到的那些鹰身女妖身上微小的花蕾相比，这个女人的奶子太巨大了。在体型相似的人类身上，它们至少是DD罩杯！[pg]");
         outputText("[say: 哇，你注意到我的乳房真是太好了！其他鹰身女妖因为它们对我那么刻薄……我觉得她们是嫉妒，]鹰身女妖暗示道。她把一只手从你的肩膀上拿开，开始用它梳理自己的“头发”，把羽毛整理成更令人愉悦的形状，同时自我介绍道，[say: 我在这里很少能看到像你这样可爱的" + get_player().mf("男孩","女孩") + "，而且带着这么沉重的乳房很难飞得很远。我的名字叫索菲！是什么风把你这样美味的一口肉吹到了我的小窝里？][pg]");
         if(get_player().cor < 33)
         {
            outputText("出于礼貌，");
         }
         else if(get_player().cor < 66)
         {
            outputText("几乎忘了你的礼貌，");
         }
         else
         {
            outputText("渴望让你的名字传遍这片土地，");
         }
         outputText("你把目光从她的乳房上移开，并做了自我介绍。当她用像翅膀一样的手臂环绕着她的奶子并把它们挤在一起，挤出更深的乳沟时，你很难集中注意力在自我介绍上。这位主妇般的鹰身女妖正满怀期待地看着你，你突然意识到她还在等你的回答。你为什么来这里？");
         unlockCodexEntry(2042);
         menu();
         addButton(0,"采集",tellSophieYoureForagingForStuff);
         addButton(1,"迷路了",sophieMeetingGotLost);
         addButton(2,"寻找恶魔",sophieLookingForDemons);
         addButton(3,"性爱",sophieMeetingChoseSex);
      }
      
      public function maleVictorySophieRapeHUGE() : void
      {
         get_sophieBimbo().sophieSprite();
         var _loc1_:int = get_player().biggestCockIndex();
         clearOutput();
         outputText("你不满足于简单的胜利，脱下衣服，露出你");
         if(get_player().get_lust100() > 90)
         {
            outputText("滴着液体的");
         }
         else if(get_player().get_lust100() > 50)
         {
            outputText("坚硬的");
         }
         else
         {
            outputText("正在变硬的");
         }
         outputText("肉棒。这只鹰身女妖甚至没有注意到你的裸体，直到你抓住她爪子上方的大腿。她虚弱地挣扎着，但你强行把她的脚举过头顶，将她按在地上。她粗壮的大腿和宽大湿滑的阴道是完美的诱惑。[pg]");
         outputText("你把你的" + get_player().cockDescript(_loc1_) + "向前推，打算用你巨大的肉棒蹂躏索菲的洞，但它塞不进去。绝望中，你把你的肉棒在她的阴唇上滑动，刺激她湿滑的裂口，用鹰身女妖的淫水润滑你的" + get_player().cockDescript(_loc1_) + "，但当你退后试图把它塞进去时……它还是塞不进去！索菲在你身下咕哝着，恼怒地叫道：[say:这行不通的，[boy]！你对鹰身女妖的阴道来说太大了，即使是像我这样经验丰富的也不行！]你伸手惩罚性地拍了拍她的屁股，那股慢慢传到她粗壮大腿上的颤动让你有了一个主意。[pg]");
         outputText("你把手握成拳头，推入她宽大、湿漉漉的洞里，收集了一把她的体液。你把它抽出来，涂抹在她肌肉发达的大腿和你那青筋暴起、未润滑的" + get_player().cockDescript(_loc1_) + "表面，然后再进去取更多。半分钟内，她的胯部和你的肉棒都沾满了索菲惊人的淫水。你把你的" + get_player().cockDescript(_loc1_) + "放在她双腿之间，把她的脚拉到一起，把你的肉棒夹在柔软的大腿肉的台钳里。这感觉太美妙了，虽然索菲似乎对这种情况很不高兴，但她半心半意的挣扎只会让她的腿感觉更好。[pg]");
         outputText("当你把这个鹰身女妖当成性玩具一样使用时，她的眼角泛起了泪花。她看起来如此可怜，以至于你居然对这位可怜的主母产生了一丝怜悯。你用右手将她的双踝并拢，腾出左手探到你的" + get_player().cockDescript(_loc1_) + "下方，然后推入她的阴道。面对突如其来的巨大侵入，索菲的眼睛都变成了斗鸡眼，但她的臀部却本能地摇晃着，似乎想从入侵者那里榨出一些精液。你插得足够深，感觉到了她子宫的屏障，在拔出准备下一次插入之前，你轻轻地顶了顶它。鹰身女妖已经停止了哭泣，开始用她的大腿夹紧又放松地环绕着你的" + get_player().cockDescript(_loc1_) + "。她尽可能地用快感来回报你的仁慈，并将她的双乳挤压着包住你的" + get_player().cockDescript(_loc1_));
         if(get_player().cocks[_loc1_].cockLength < 36)
         {
            outputText("每次它推入它们时。");
         }
         else
         {
            outputText("当它越过它们推向她的嘴唇时。");
         }
         if(get_player().cocks[_loc1_].cockLength >= 40)
         {
            outputText("她把" + get_player().cockHead(_loc1_) + "吸进嘴里，用舌头在它周围旋转");
            if(get_player().cocks[_loc1_].cockLength < 50)
            {
               outputText("在你退后之前。");
            }
            else
            {
               outputText("在她把它放出来之前，然后再向前推。");
            }
         }
         if(get_player().cocks[_loc1_].cockLength >= 50)
         {
            outputText("当它从她头上滑过时，她的舌头伸出来舔了舔下面。");
         }
         outputText("你迟钝地注意到，虽然该地区还有很多其他的鹰身女妖，但她们都忙着在头顶盘旋和自慰，没有以任何方式干预。索菲可能是她们中最好、最体面的一个，而你却在强迫她。你低下头，感到有些内疚，但每次你的拳头敲击她的子宫颈时，她的嘴都张开着，眼睛有点对眼；看来她并没有那么介意。索菲呻吟着，[say:哦，好大，好有男子气概。我想如果你继续这样在我的阴蒂上摩擦你的肉棒，我就要高-高-高-哦-呜呜呜呜呜潮了！][pg]");
         outputText("她的身体在你身下因高潮而抽搐，起伏、紧绷的大腿肌肉将你挤压至高潮。成股的精液溅在她的");
         if(get_player().cocks[_loc1_].cockLength < 36)
         {
            outputText("奶子上");
         }
         else if(get_player().cocks[_loc1_].cockLength < 50)
         {
            outputText("脸上");
         }
         else if(get_player().cocks[_loc1_].cockLength < 100)
         {
            outputText("巢穴里");
         }
         else
         {
            outputText("和山腰");
         }
         outputText("。");
         if(get_player().cumQ() >= 500)
         {
            outputText("紧紧地夹着，你陶醉在浓稠的精液团扭曲你的" + get_player().cockDescript(_loc1_) + "的感觉中，它们喷射而出。精液湿漉漉地飞溅，把你那曲线优美的受害者弄得一团糟");
            if(get_player().cocks[_loc1_].cockLength >= 50)
            {
               outputText("的巢穴");
            }
            outputText("。");
            if(get_player().cumQ() >= 2000)
            {
               outputText("等你结束时，你成功地完全淹没了她的巢穴，浸透了她的身体，并让一股精液洪流顺着山腰流下。");
            }
         }
         outputText("索菲");
         if(get_player().cocks[_loc1_].cockLength < 50)
         {
            outputText("在你高潮时，在你的" + get_player().cockDescript(_loc1_) + "底部印满了吻，但那令人酥麻的口服药物只会让感觉更好。");
         }
         else
         {
            outputText("一直把她那掺了药的唇彩涂满你的" + get_player().cockHead(_loc1_) + "！那种酥麻感让你的高潮更加美妙，但你知道你现在已经吸收了很多那玩意儿。");
         }
         outputText("[pg]");
         outputText("索菲向后靠去，舀起一把你的白色粘液塞进她那浸满润滑液的阴户里，然后立刻睡着了。她会这么做也是意料之中。" + get_player().SMultiCockDesc() + "依然坚挺，而且你确信在相当长的一段时间内情况只会变得更糟。你低头看着这位鹰身女妖母亲，考虑着再来一次，但决定还是找个醒着的伴侣更好。");
         luststickApplication(8);
         get_player().orgasm("Dick");
         dynStats(DynStat.Sens(-1));
         sophieFucked();
         get_combat().cleanupAfterCombat();
      }
      
      public function maleVictorySophieRape() : void
      {
         get_sophieBimbo().sophieSprite();
         var _loc1_:int = get_player().cockThatFits(232);
         clearOutput();
         outputText("索菲");
         if(get_monster().get_HP() < 1)
         {
            outputText("被打得无力反抗，半昏迷地瘫倒在地上。");
         }
         else
         {
            outputText("已经发情得无法自拔，正用力地用拳头操弄着自己宽大的小穴。");
         }
         outputText("不满足于简单的胜利，你脱下衣服，露出你");
         if(get_player().get_lust100() > 90)
         {
            outputText("滴着液体的");
         }
         else if(get_player().get_lust100() > 50)
         {
            outputText("坚硬的");
         }
         else
         {
            outputText("正在变硬的");
         }
         outputText("肉棒。这只鹰身女妖甚至没有注意到你的裸体，直到你抓住她爪子上方的大腿。她虚弱地挣扎着，但你强行把她的脚举过头顶，将她按在地上。她粗壮的大腿和宽大湿滑的阴道是完美的诱惑。[pg]");
         outputText("你强行将你的" + get_player().cockDescript(_loc1_) + "插入那等待着的洞穴，惊讶于它夹得有多紧。索菲在你身下咕哝着挣扎，但在你的钳制和尴尬的角度下，她无处可逃。她脸上半昏迷的表情让你很难分辨她是在试图逃跑，还是仅仅想占据一个更主动的位置。这都不重要；她大腿肌肉的每一次挣扎和收缩，只会让她湿滑的阴户更紧地夹住你的肉棒。你前后摇摆着臀部，挑逗道：[say:这不就是你想要的吗，索菲？你知道你很享受这个。只是别指望你唇彩里的那些东西还能再暗算我！][pg]");
         outputText("肉体碰撞的啪啪声在凉爽的山间空气中回荡，即使你正在强暴她们中的一员，附近的其它鹰身女妖似乎也毫不在意。她们中有几个似乎栖息在巢穴边缘，抚摸着自己。看来她们对索菲的遭遇并不怎么感兴趣。你越来越用力地捣弄着她的小穴，看着她的大腿和乳房随着操弄的力度而晃动。她抬起手臂想稳住乳房，但手指却环绕住挺立的乳头，开始捏拉起来。索菲喘息着：[say:哦，天哪，是的！让我怀孕吧，你这该死的" + get_player().mf("种马","性感婊子") + "。把你那年轻美味的精液塞进我体内！][pg]");
         outputText("她显然开始享受起来了。这只鹰身女妖在你身下扭动着高潮了，她的翅膀不受控制地扑腾拍打着，扬起阵阵灰尘。随着她大腿每一次颤抖的肌肉收缩，那条天鹅绒般的隧道紧紧地夹住你。你只是继续猛烈地捣弄，每一次抽插都溅出淫水。当索菲开始平息下来时，她尖叫着呻吟起来，但你加快了速度，用无情而猛烈的抽插猛击她的小穴。过度刺激让她翻起了白眼，双手无力地从乳头上滑落。那不受束缚的肉体淫秽地晃动着，让你在随心所欲地享用这位年长女性时，有了些观赏的乐趣。[pg]");
         outputText("你的下腹部涌起一阵热流，这是你即将高潮的明显迹象。你深深地插入她体内，弯下腰，在射精时咬住她的乳头。精液从你的" + get_player().cockDescript(_loc1_) + "中喷涌而出，灌满了她的小穴，索菲也迎来了又一次极乐的高潮。你怀疑她现在是否还清醒，但你根本不在乎。");
         if(get_player().cumQ() < 50)
         {
            outputText("精液喷射进她体内，直到你心满意足。");
         }
         else if(get_player().cumQ() < 300)
         {
            outputText("精液喷射进她体内，直到你心满意足，她的肚子也因为精液的灌注而微微隆起。");
         }
         else if(get_player().cumQ() < 1000)
         {
            outputText("精液在她体内爆发，直到她的肚子被你的精液撑得像怀孕一样，你也心满意足。");
         }
         else
         {
            outputText("精液在她体内爆发，直到她的肚子看起来像是怀上了你的精液。当她体内没有空间时，精液顺着你的肉棒喷射出来，巢穴很快就被这不断上涨的性爱极乐之潮淹没了。你叹了口气，终于满足了。");
         }
         outputText("当你拔出时，索菲那被彻底操过的小穴大张着，流出白色的液体。照这个速度，用不了多久她就会产下一枚蛋了。");
         get_player().orgasm("Dick");
         dynStats(DynStat.Sens(-1));
         sophieFucked();
         get_combat().cleanupAfterCombat();
      }
      
      public function luststickApplication(param1:Number = 4) : void
      {
         if(get_player().hasPerk(PerkLib.LuststickAdapted))
         {
            return;
         }
         var _loc2_:IMap = KFLAGS.flags;
         FlagDict_Impl_.arrayWriteInt(_loc2_,285,FlagDict_Impl_.arrayReadInt(_loc2_,285) + int(Math.floor(param1 / 2)));
         if(!get_player().hasCock())
         {
            return;
         }
         if(param1 > 20)
         {
            param1 = 20;
         }
         if(get_player().hasStatusEffect(StatusEffects.Luststick))
         {
            if(get_player().statusEffectv1(StatusEffects.Luststick) < 20)
            {
               if(get_player().statusEffectv1(StatusEffects.Luststick) + param1 > 20)
               {
                  param1 = 20 - get_player().statusEffectv1(StatusEffects.Luststick);
               }
               get_player().addStatusValue(StatusEffects.Luststick,1,param1);
            }
         }
         else
         {
            FlagDict_Impl_.arrayWriteFloat(KFLAGS.flags,2071,get_player().lib);
            get_player().createStatusEffect(StatusEffects.Luststick,param1,0,0,0);
         }
      }
      
      public function get_sophieFollowerScene() : SophieFollowerScene
      {
         return get_game().sophieFollowerScene;
      }
      
      public function get_sophieBimbo() : SophieBimbo
      {
         return get_game().sophieBimbo;
      }
      
      public function fuckDatClit() : void
      {
         get_sophieBimbo().sophieSprite();
         clearOutput();
         outputText("索菲");
         if(get_monster().get_HP() < 1)
         {
            outputText("被打得无力反抗，半昏迷地瘫倒在地上。");
         }
         else
         {
            outputText("欲火焚身，无力反抗，正用力地用拳头操着她那巨大的小穴。你把她长满羽毛的手臂从发情的小穴里拉出来，推到一边。");
         }
         outputText("这只鹰身女妖需要学习一下如何享受另一个女人的抚摸。你强行掰开她的大腿，但还没等你做什么，她就又合上了。你烦躁地低吼一声，在她" + (get_noFur() ? "" : "长满羽毛") + "的屁股上拍了一巴掌，然后把它们完全拉开。索菲恢复了理智，瞪着你骂道：[say: 小女孩，我不想要也不需要你，更不需要你的小穴。][pg]");
         outputText("你大笑起来，向索菲明确表示你不打算用你的小穴。当你抚摸自己的外阴并把玩自己时，她看起来很困惑，但随着你的阴蒂一英寸一英寸地变长，她脸上的表情慢慢变成了恍然大悟。这只鹰身女妖看起来甚至有点高兴，她评论道：[say: 好吧，也许这还不算太糟。你不能让我的卵受精，但那东西看起来比我的手指爽多了。来吧，我的小拉拉荡妇；让我感受一下你的阴蒂。][pg]");
         outputText("这还差不多！你把突然变得急不可耐的鹰身女妖翻过身来，将你" + get_player().clitDescript() + "的顶端压在她湿润的阴唇上。它们比人类女性的要大得多，几乎毫不费力地就把你肿胀的女孩鸡巴吸了进去。她又热又湿，她的肌肉紧紧地挤压着你，让你的[legs]发软。你抓住她背上的翅膀，死死地抱住。考虑到你的[clit]有多敏感，这可能不是个好主意。你必须不断挣扎，才能不让自己的身体变成一团抽搐的果冻。当你的本能接管一切，迫使你深深地插入她那流着口水的产卵孔时，她舒服地弓起了背。[pg]");
         outputText("索菲热情地呻吟着，[saystart]嗯，就是这样！让我看看你那根鸡巴一样的阴蒂到底有多爽。我想如果你能用那玩意儿射精，我们就能省去所有这些打斗了。我没说你可以停下来听我说话，对吧？继续操！我想");
         if(Utils.rand(2) == 0)
         {
            outputText("看看你高潮的时候它会不会变粗。");
         }
         else
         {
            outputText("感受你被挤压到高潮的感觉。");
         }
         outputText("[sayend] 她的内壁开始更用力地伺候你，从根部到顶端挤压按摩着你的阴蒂，夺走了你剩余的力气。你倒在她身上，尽管你尽了最大努力继续操她，但她那不断收紧的通道让你胸部以下的任何肌肉都无法协调运动。她的乳房在你身下摇晃，尽管你决心要享受自己，但你还是伸手去揉捏那对超大的鹰身女妖奶子。她的乳头在你的手指间坚挺勃起，仅仅是抚摸它们，就让她的阴道收缩得更紧了。[pg]");
         outputText("充满母性的鹰身女妖呻吟着发出更多命令，[say: 就是这样；放松，让我来接管，小女孩。我们会让彼此都感觉很爽的。]虽然她没有任何立场命令你，但你能感觉到你的身体正在接受她的话。你意识到她正在使用某种强迫手段来帮助自己，但你太放松了，性奋得根本不在乎。你低下头，轻轻抚摸着她的乳头，而你的阴蒂则被索菲的小穴像挤牛奶一样粗暴地榨取着。即使她命令你放松，你的[hips]仍然兴奋地颤抖和挺动，你知道高潮快到了。[pg]");
         outputText("索菲挤压节奏的快速加快让你达到了高潮，你放松的身体因为微小的颤动而扭曲，而你的阴蒂在她体内充血膨胀。感觉太爽了，你翻着白眼，努力坚持着。");
         if(get_player().totalCocks() > 0)
         {
            outputText("当高潮冲击你的腹股沟时，白色的液体从[eachcock]喷发而出。");
            if(get_player().cumQ() < 50)
            {
               outputText("它在索菲的背上留下了一小滩白色的屈服之液。");
            }
            else if(get_player().cumQ() < 250)
            {
               outputText("它在索菲的背上留下了一大滩浓稠的精液。");
            }
            else
            {
               outputText("它在索菲的背上留下了一大滩浓稠的精液，飞溅开来，把巢穴都填满了。");
            }
         }
         outputText("她喘着粗气，但离高潮还差得远，她发出呼噜声，[say: 我还没完呢，小可爱。就让那根小阴蒂在我里面硬着，让我挤压直到我高潮。如果你受不了，可以晕过去。][pg]");
         outputText("她还没……还没完？你试图拔出来，但在强迫和高潮的疲惫下，这是不可能的。啊！她又挤压了一下，你的眼睛瞬间对眼了。一切都还是那么敏感！你受不了多久的。");
         if(get_player().vaginas[0].vaginalWetness >= 4)
         {
            outputText("淫液顺着你的[legs]流下，你的身体正享受着这种待遇。");
         }
         outputText("索菲已经控制了局面，你的无助感只会加剧你被迫承受的快感。鹰身女妖扭动着臀部，将翅膀弯曲着盖在你身上，紧紧地抱住你，强迫你再次高潮。你翻着白眼，开始流口水，被鹰身女妖弄晕了过去。[pg]");
         outputText("几个小时后，你在山脚下醒来。你的[armor]穿回了身上，宝石袋感觉轻了一些。也许下次你会三思而后行，不再把像[clit]这样敏感的东西塞进一个湿滑的夹子里？不过，你可能还得再去拜访她一次。你现在还在因为那些高潮的余韵而浑身发麻。");
         get_monster().set_lust(98);
         get_monster().set_HP(2);
         get_player().set_lust(get_player().maxLust());
         FlagDict_Impl_.arrayWriteFloat(KFLAGS.flags,89,get_monster().XP);
         get_combat().cleanupAfterCombat();
         get_player().orgasm("Vaginal");
         dynStats(DynStat.Sens(1));
      }
      
      public function fightSophie() : void
      {
         get_sophieBimbo().sophieSprite();
         startCombatImmediate(new Sophie());
         var _loc1_:IMap = KFLAGS.flags;
         FlagDict_Impl_.arrayWriteInt(_loc1_,96,FlagDict_Impl_.arrayReadInt(_loc1_,96) + Utils.rand(24));
      }
      
      public function cramANippleInIt() : void
      {
         var _loc1_:* = null as IMap;
         get_sophieBimbo().sophieSprite();
         get_player().boostLactation(0.01);
         clearOutput();
         if(!get_game().get_inCombat())
         {
            outputText("索菲后退一步，跪在地上，用翅膀保持平衡。你故意缓慢地拉开你的[armor]，一次一个地露出你的" + get_player().allBreastsDescript() + "。索菲舔了舔嘴唇，耐心地等待着分享你的恩赐。[pg]");
         }
         else if(get_monster().get_lust() >= get_monster().maxLust())
         {
            outputText("索菲喘着粗气，跪直了身子。她勉强保持着平衡，将四根手指深深地插入她那滴着淫液的阴户，用拇指拨弄着她的阴蒂。当你慢慢脱下衣服时，这只鹰身女妖张开嘴，用她那光泽的嘴唇乞求你的乳汁。[pg]");
         }
         else
         {
            outputText("你把这只晕头转向、被打败的鹰身女妖拉起来，让她跪着。当你脱下衣服，将你的" + get_player().allBreastsDescript() + "暴露在凉爽的山风中时，她摇摇晃晃地站不稳。索菲挣扎着恢复意识，眼睛睁得更大了，这只饥饿的鹰身女妖高兴地张大嘴巴，呈“O”型，乞求你的乳汁。[pg]");
         }
         outputText("你在柔软、垫着东西的巢穴里找了个舒服的姿势，把索菲拉倒在你身上。她那光泽的琥珀色嘴唇撅起，在你的胸前探索，试图找到乳头。当你把手放在她的后脑勺上，引导她靠近你的");
         if(int(get_player().breastRows.length) > 1)
         {
            outputText("上-");
         }
         outputText("最左边的[nipple]时，这只鹰身女妖一点也没有反抗。她的嘴巴咬住并开始吸吮；她的嘴唇逗弄着你敏感的乳房，留下令人愉悦的刺痛感。索菲一边自慰，一边含着乳头发出咕噜声和呻吟声。[pg]");
         if(get_player().biggestLactation() < 2)
         {
            outputText("她吸吮得越来越用力，直到你感觉到乳汁流出。一股令人愉悦的母乳从你的[nipple]流进她的嘴里。索菲的手臂环绕着你的背，让她紧紧地贴着你，同时她兴奋地吸吮着你的液体营养。她那");
            if(get_monster().get_HP() < 1)
            {
               outputText("伤痕累累的");
            }
            else
            {
               outputText("充满情欲的");
            }
            outputText("脸上流露出纯粹的满足感，你对她对牛奶的奇怪热爱感到好奇。鹰身女妖吸空了第一个乳头，然后转向了");
            if(get_player().totalNipples() > 2)
            {
               outputText("下一个");
            }
            else
            {
               outputText("另一个");
            }
            outputText("，闭上眼睛，在你的怀抱中放松下来。");
            if(get_player().totalNipples() > 2)
            {
               outputText("这个乳头也没坚持多久，她不得不转向下一个，");
               if(get_player().totalNipples() < 5)
               {
                  outputText("在吸完最后一个之前。");
               }
               else
               {
                  outputText("然后是下一个，一直持续到你被完全吸干。");
               }
            }
            outputText("[pg]");
         }
         else if(get_player().biggestLactation() < 3.5)
         {
            outputText("她用力吮吸着，但考虑到你出奶的速度，这似乎有些多余。母乳涌入她的口中，流速之快让她瞪大了眼睛。她的双臂紧紧抱住你的后背，仿佛担心你会退缩并拒绝她。她努力吞咽着你分泌出的所有乳汁，但脸上的表情却充满了纯粹的幸福。你不得不怀疑，到底是什么让一只鸟如此喜爱乳汁。她的眼睛微微闭上，靠在你的[nipple]上放松下来。乳汁最终被吸干了，她不得不转向你的");
            if(get_player().totalNipples() == 2)
            {
               outputText("另一个");
            }
            else
            {
               outputText("下一个");
            }
            outputText("[nipple]。这次吮吸持续的时间几乎和第一次一样长，直到她喝完。");
            if(get_player().totalBreasts() > 2)
            {
               if(get_player().totalNipples() > 2)
               {
                  outputText("她从点缀在你" + get_player().allBreastsDescript() + "上的每一个乳头吸吮，直到她的肚子吃得饱饱的，发出咕噜咕噜的声音。");
               }
               else
               {
                  outputText("她依次从每个乳房吸吮，直到她的肚子吃得饱饱的，发出咕噜咕噜的声音。");
               }
            }
            else if(get_player().totalNipples() > 2)
            {
               outputText("她依次从每个乳头吸吮，直到她的肚子吃得饱饱的，发出咕噜咕噜的声音。");
            }
            outputText("[pg]");
         }
         else
         {
            outputText("她用力吮吸了一会儿，结果被你喷涌而出的乳汁呛得直咳嗽。母乳喷洒在她的脸上，她只能带着狂喜的表情看着自己引发的这一切。索菲倾身向前，再次含住，她的喉咙明显而频繁地吞咽着，努力跟上你乳汁流出的速度。她的双臂环抱住你的后背，紧紧锁在一起，试图抱紧你，即使你的乳汁从她的嘴角喷射出来。她幸福的表情让你不禁怀疑，到底是什么让一只鹰身女妖如此热爱乳汁。她的眼睑下垂，靠在[nipple]上放松下来。吮吸持续了很久，直到你的乳汁减缓成合理的涓涓细流。满足于吸干了一个喷乳口后，索菲转向了");
            if(get_player().totalNipples() == 2)
            {
               outputText("另一个");
            }
            else
            {
               outputText("下一个");
            }
            outputText("乳头，并重新开始这个循环。");
            if(get_player().totalNipples() >= 4)
            {
               outputText("考虑到你所有的乳头，这持续了相当长的一段时间。");
            }
            outputText("[pg]");
         }
         outputText("索菲退了回来，伴随着");
         if(get_player().biggestLactation() >= 3.5)
         {
            outputText("一声极其响亮的饱嗝，脸涨得通红。");
         }
         else if(get_player().biggestLactation() >= 2)
         {
            outputText("一声满足的饱嗝。");
         }
         else
         {
            outputText("一声满足的“啊”。");
         }
         outputText("她擦去唇边的一点乳汁，说道，[saystart]");
         if(get_game().get_inCombat())
         {
            if(get_monster().get_HP() < 1)
            {
               outputText("你知道你不需要把我揍一顿才能让我喝你的奶，对吧？它太美味了，让人无法拒绝！[sayend][pg]");
            }
            else
            {
               outputText("嗯，你确实知道如何在给女人她想要的东西之前，让她热血沸腾，不是吗？");
               if(get_player().totalCocks() > 0)
               {
                  outputText("也许下次你会让我尝尝你的“另一种”奶？");
               }
               outputText("[sayend]");
               if(get_player().totalCocks() > 0)
               {
                  outputText("鹰身女妖笑着温柔地抚摸着你的后背，低语道：[say: 已经很久了，你知道的……][pg]");
                  dynStats(DynStat.Lust(25));
               }
               else
               {
                  outputText("[pg]");
               }
            }
            FlagDict_Impl_.arrayWriteInt(KFLAGS.flags,755,0);
         }
         else
         {
            outputText("真美味！我已经很久没有遇到能给我带来这么新鲜乳汁的人了。");
            if(get_player().totalCocks() > 0)
            {
               outputText("也许下次你会让我尝尝你的“另一种”乳汁？[sayend] 鹰身女妖笑着温柔地抚摸着你的后背，低语道：[say: 已经很久了，你知道的……][pg]");
               dynStats(DynStat.Lust(25));
               _loc1_ = KFLAGS.flags;
               FlagDict_Impl_.arrayWriteInt(_loc1_,755,FlagDict_Impl_.arrayReadInt(_loc1_,755) + 1);
            }
            else
            {
               outputText("[sayend][pg]");
            }
         }
         get_player().boostLactation(0.1);
         outputText("丰满的鹰身女妖揉着圆滚滚的肚子，从你身上爬了起来。她不小心打了个可爱的小嗝，脸涨得通红。为了掩饰尴尬，她转过身去，挥了挥尾羽打发你走。看来索菲对事情的结果相当满意。");
         if(get_player().cor > 60)
         {
            outputText("你调皮地拍了拍她宽大的屁股，在她报复之前开始往下爬。");
         }
         dynStats(DynStat.Lust(-50));
         _loc1_ = KFLAGS.flags;
         FlagDict_Impl_.arrayWriteInt(_loc1_,92,FlagDict_Impl_.arrayReadInt(_loc1_,92) + 1);
         get_player().orgasm("Tits");
         if(get_game().get_inCombat())
         {
            get_combat().cleanupAfterCombat();
         }
         else
         {
            doNext(get_camp().returnToCampUseOneHour);
         }
         if(get_player().hasStatusEffect(StatusEffects.Feeder))
         {
            get_player().addStatusValue(StatusEffects.Feeder,1,1);
            get_player().changeStatusValue(StatusEffects.Feeder,2,0);
         }
      }
      
      public function consensualSophieSexNoFit() : void
      {
         get_sophieBimbo().sophieSprite();
         var _loc1_:int = get_player().biggestCockIndex();
         var _loc2_:IMap = KFLAGS.flags;
         FlagDict_Impl_.arrayWriteInt(_loc2_,755,FlagDict_Impl_.arrayReadInt(_loc2_,755) + 1);
         clearOutput();
         outputText("她张开的双腿如此诱人地向你招手，你根本无法抗拒。你扯下你的[armor]，和她一起跳进她的巢里，因为离这位丰满的女人如此之近，你愉快地硬了起来。索菲把一只手放在");
         if(get_player().biggestTitSize() < 1)
         {
            outputText("在你的胸膛上");
         }
         else
         {
            outputText("在你的" + get_player().allBreastsDescript() + "之间");
         }
         outputText("，用缓慢而有节奏的动作在你的[skindesc]上游移。她吹嘘道，[say: 上次有个心甘情愿的伴侣来到我的巢穴，他只花了一会儿功夫就让我受孕了。他根本应付不了这一切。] 为了强调，她把你拉进她的胸怀，用双乳夹住你的头。[pg]");
         outputText("索菲将你从她丰满的胸脯中释放出来，但你却不紧不慢地退出来；你甚至停下来舔了舔她挺立的乳头。鹰身女妖抓住你的臀部，把你拉到她身上，顺势揉捏着你的" + get_player().assDescript() + "。随着");
         if(get_player().get_tallness() <= 48)
         {
            outputText("她的双乳压在你的脸上");
         }
         else if(get_player().get_tallness() < 72)
         {
            outputText("她的双乳摩擦着你的");
            if(get_player().biggestTitSize() >= 1)
            {
               outputText("自己的");
            }
            else
            {
               outputText("胸部");
            }
         }
         else
         {
            outputText("她的双乳压在你的肚子上");
         }
         outputText("，你的" + get_player().cockDescript(_loc1_) + "开始沿着巢穴底部生长。当它在她身下变长时，令人愉悦地摩擦着她的下唇。她震惊地睁大眼睛，惊呼道：[say: 这比牛头人的还要大！虽然我这辈子下过几百个蛋，但这并不意味着我能操一根怪物般的巨屌。你该不会不知道，长着这么大一根肉棒，你更应该待在某个恶魔动物园里，而不是在一个美丽的鹰身女妖的巢穴里吧。][pg]");
         if(get_player().cor < 50)
         {
            outputText("她的戏弄和嘲讽比预想的还要刺痛你，让你感到糟糕和羞愧。你全身都因尴尬而泛红");
         }
         else
         {
            outputText("她的戏弄和嘲讽比预想的还要刺痛你，让你感到恼火和屈辱。你全身都因被迫的尴尬而泛红");
         }
         outputText("直到她柔软的手贴上你的脸颊，用温柔的声音安抚道：[say: 别担心，亲爱的。是那头野兽里面的东西让我想要你。自从恶魔接管这里以来，我一直在榨取像你这样可爱的" + get_player().mf("种马","扶他") + "，而你只是我最新的战利品。你没意见吧？你不介意我为我那些饥渴的卵子释放压力吧？你当然不介意。] 她的言语带着不可思议的分量，驱散了你心中的任何不情愿或担忧，取而代之的是顺从。索菲真的很懂怎么做。你不愿意也无法抗拒她那带有羞辱性的举动，而最糟糕的是：你并不介意。成为战利品似乎也没那么糟；她可是要让你用精液填满她的小穴的……[pg]");
         outputText("索菲的翅膀向前卷曲，越过她的肩膀，轻轻地将你推开。当你倒在巢穴柔软的内衬上时，你的" + get_player().cockDescript(_loc1_) + "翘起指向天空。鹰身女妖那如翅膀般的手臂用羽毛般的柔软环绕着你，在你的根部挠痒痒。她开始用她那巨大的双乳挤压着你的肉棒，身体沿着你的肉棒上下滑动。索菲用一种听起来更像是命令而不是询问的声音问道：[say: 你要让我尝尝吗，[name]？我想知道什么样的精液会在我的子宫里播种。][pg]");
         outputText("她俯下身，在你的嘴唇上吻了一下，然后低语道：[say: 做个乖[boy]，给妈妈挤出一点先列腺液来。] 她紧紧握住你的根部，将她长满羽毛的手臂向上拖到" + get_player().cockHead(_loc1_) + "，挤出了");
         if(get_player().cumQ() < 50)
         {
            outputText("一小滴");
         }
         else if(get_player().cumQ() < 250)
         {
            outputText("一滴");
         }
         else if(get_player().cumQ() < 1000)
         {
            outputText("一大股");
         }
         else
         {
            outputText("如泉涌般的");
         }
         outputText("先列腺液。索菲娇嗔道：[say: 真是个多产的[boy]，] 然后带着会心的微笑吸溜着吞下了这粘稠的美味。她转过身，让她的尾羽在你的脸上挠痒痒，然后坐在你的肚子上。因为她很轻，所以并没有让你感到不适，而她那出乎意料柔软的鸟脚底开始摩擦");
         if(get_player().balls > 0)
         {
            outputText("你的[balls]，小心翼翼地不让她的爪子勾到它们");
         }
         else
         {
            outputText("你的大腿，小心翼翼地不让她的爪子勾到你");
         }
         outputText("。她大腿上肌肉发达的肉像老虎钳一样收缩，就像一个阴茎环，迫使更多的血液流入你已经过度兴奋的" + get_player().cockDescript(_loc1_) + "。[pg]");
         outputText("你的身体在她身下扭曲蠕动，渴望更多的刺激，比平时更加兴奋。你的咕哝和呻吟变得越来越狂热，直到索菲向后靠，把手指放在你的嘴唇上。她命令道：[say: 嘘；我知道我唇彩里的花粉让你很难不马上射精，但你需要等到我准备好接受你的种子。]你哀怨地呜咽，但无济于事。感觉高潮近在咫尺，你伸手就能触及，但它就是不来。索菲残忍地咯咯笑着，用指尖在肿胀的" + get_player().cockHead(_loc1_) + "周围画圈，向你保证：[say: 你很快就能射了，我保证。等一下；一旦你的龟头进入我的小穴，你就会射出所有的种子。你的鹰身女妖女王命令你！]她的话似乎……不知怎么的，很沉重；就像它们背后有某种力量或重量。[pg]");
         outputText("索菲站起来，开始拍打翅膀，扬起灰尘和碎屑，迫使你在她离地时遮住眼睛。她的手锁住你的" + get_player().cockDescript(_loc1_) + "，引导她来到它的上方。当她降低身体时，水珠从她的阴道滴落，滚过你娇嫩敏感的皮肤，将你的" + get_player().cockHead(_loc1_) + "种在她被蛋撑宽的阴唇内。她的主翼疯狂地拍打着，努力在没有手臂帮助的情况下保持在空中，但你几乎没有注意到。你的" + get_player().cockDescript(_loc1_) + "正在为这位母性的鹰身女妖疯狂射精，用精液填满她等待的子宫。");
         if(get_player().cumQ() >= 1000)
         {
            outputText("没过多久，她的肚子就胀了起来，她滑了下来，塞满了她无法承受的黏糊糊的白色液体。");
            if(get_player().cumQ() >= 2000)
            {
               outputText("你继续喷射，用一波波的精液浸透了你自己和巢穴，直到它和她一样满。");
            }
            if(get_player().cumQ() >= 4000)
            {
               outputText("一波精液从你极端的产量中滑下山坡。");
            }
         }
         outputText("[pg]");
         outputText("鹰身女妖咯咯地笑着，给了你一个长长湿吻，让你的鸡巴抽搐");
         if(get_player().balls > 0)
         {
            outputText("你的蛋蛋翻腾");
         }
         outputText("。她仰面躺下");
         if(get_player().cumQ() >= 2000)
         {
            outputText("在浸满精液的巢穴里");
         }
         outputText("抚摸着她的腹部，显然很享受再下一个蛋的想法。索菲呻吟着，[saystart]嗯，这么年轻的人有这么强效的种子。");
         if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,91) == 0)
         {
            outputText("你知道在过去，我们曾经把男人像这样困住一整天吗？我们会像这样一直抚摸他们，得到一整天的高潮。那太棒了。当然，我们现在生育能力很强，一次高潮就足以让一个卵子受精。看来你很幸运，嗯？");
         }
         else if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,91) <= 2)
         {
            outputText("你真的很喜欢我榨干你，不是吗？那一定是你不断回来要更多的原因。");
         }
         else if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,91) <= 10)
         {
            outputText("你对");
            if(Utils.rand(2) == 0)
            {
               outputText("老女人");
            }
            else
            {
               outputText("鹰身女妖");
            }
            outputText("有恋物癖，还是你只是爱上了我？我已经有一段时间没有像你这样的仰慕者了。我们有一个词来形容像你这样的" + get_player().mf("男孩","荡妇") + "——变态。我开玩笑的，我开玩笑的。像你这样的变态有如此压抑、强效的精液，我知道你喜欢把它给我。");
         }
         else
         {
            outputText("你上瘾了，不是吗？嘘，别回答。我知道你喜欢用鼻子蹭我的乳房，在我的小穴里喷射。快点回来，这样我们就可以下更多的蛋了——其他女孩都嫉妒死我了。");
         }
         outputText("[sayend][pg]");
         outputText("你挣扎着站起身，惊讶地发现");
         if(get_player().cockTotal() > 1)
         {
            outputText("你的每一根");
         }
         outputText("[cocks]依然坚挺。索菲咯咯地笑着，[saystart]");
         if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,91) == 0)
         {
            outputText("抱歉啦小可爱，这唇彩会让你一直硬邦邦的。它是为了帮助你的");
            if(get_player().balls > 0)
            {
               outputText("蛋蛋");
            }
            else
            {
               outputText("身体");
            }
            outputText("重新充满精液。如果你愿意，我们可以抱在一起，直到药效过去。");
         }
         else
         {
            outputText("对不起，我刚才太投入了，弄得你沾满了我的唇彩，是不是呀小可爱？不如你过来和我依偎几个小时，我可以帮你撸，直到药效过去？");
         }
         outputText("[sayend][pg]");
         luststickApplication(4);
         get_player().orgasm("Dick");
         sophieFucked();
         outputText("你要接受她的提议吗？");
         doYesNo(postSophieSexSnuggle,postSexSophieSnuggleTurnedDown);
      }
      
      public function consensualSexSelector() : void
      {
         get_sophieBimbo().sophieSprite();
         if(get_player().cockThatFits(232) < 0)
         {
            consensualSophieSexNoFit();
         }
         else
         {
            consensualHotSophieDickings();
         }
      }
      
      public function consensualHotSophieDickings() : void
      {
         get_sophieBimbo().sophieSprite();
         clearOutput();
         var _loc1_:IMap = KFLAGS.flags;
         FlagDict_Impl_.arrayWriteInt(_loc1_,755,FlagDict_Impl_.arrayReadInt(_loc1_,755) + 1);
         var _loc2_:int = get_player().cockThatFits(232);
         if(_loc2_ < 0)
         {
            CoC_Settings.error("");
            outputText("错误：没有找到合适的阴茎，但却调用了“fits”场景。");
            doNext(playerMenu);
            get_game().set_inCombat(false);
            return;
         }
         if(_loc2_ > int(get_player().cocks.length) - 1)
         {
            CoC_Settings.error("");
            outputText("错误：选择的阴茎超过了索菲性爱的最大阴茎数。请在帖子中报告错误。");
            doNext(playerMenu);
            get_game().set_inCombat(false);
            return;
         }
         outputText("她张开的双腿如此诱人地向你招手，你根本无法抗拒。你扯下你的[armor]，和她一起跳进她的巢里，因为离这位丰满的女人如此之近，你愉快地硬了起来。索菲把一只手放在");
         if(get_player().biggestTitSize() < 1)
         {
            outputText("在你的胸膛上");
         }
         else
         {
            outputText("在你的" + get_player().allBreastsDescript() + "之间");
         }
         outputText("，用缓慢而有节奏的动作在你的[skindesc]上游移。她吹嘘道，[say: 上次有个心甘情愿的伴侣来到我的巢穴，他只花了一会儿功夫就让我受孕了。他根本应付不了这一切。] 为了强调，她把你拉进她的胸怀，用双乳夹住你的头。[pg]");
         outputText("索菲将你从她丰满的胸脯中释放出来，但你却不紧不慢地退出来；你甚至停下来舔了舔她挺立的乳头。鹰身女妖抓住你的臀部，把你拉到她身上，顺势揉捏着你的" + get_player().assDescript() + "。随着");
         if(get_player().biggestTitSize() >= 1)
         {
            outputText("她的乳房摩擦着你的乳房");
         }
         else if(get_player().get_tallness() <= 48)
         {
            outputText("她的双乳压在你的脸上");
         }
         else
         {
            outputText("她的双乳压在你的肚子上");
         }
         outputText("，");
         if(get_player().totalCocks() > 1)
         {
            outputText("你的每一根");
         }
         outputText("[cocks]开始在她的胯部和微微张开的缝隙上戳刺。");
         if(get_player().cockArea(_loc2_) <= 6)
         {
            outputText("她皱起眉头，问道：[say:就这么点？你这么小，还不如把它切了当个女孩！你会是个可爱的小女孩的，你知道吗？]");
         }
         else if(get_player().cockArea(_loc2_) < 150)
         {
            outputText("她咧嘴一笑，调侃道：[say:你还在等什么？你不会是被我这么大的小穴吓到了吧？相信我，我的肌肉会把它夹得很紧的。你应该担心的是，你这个色鬼，怎么占一个饥渴的老女人的便宜。]");
         }
         else
         {
            outputText("她高兴地睁大了眼睛，但还是调侃你：[say:哦，玛莱啊，你可真是个大男孩，不是吗？你确定我能吃得下吗？把这么大、这么美味的肉棒强塞给一个可怜的老女人，你应该感到羞耻！]");
         }
         if(get_player().cockTotal() > 1 && get_player().biggestCockArea() > 232)
         {
            outputText("她的手推开你那根肿胀的" + get_player().cockDescript(get_player().biggestCockIndex()) + "，试图更好地够到你的" + get_player().cockDescript(_loc2_) + "。她咕哝道：[say:很诱人，但好东西太多了。]");
         }
         outputText("[pg]");
         outputText("她的调侃和嘲讽比预想的还要刺痛你，");
         if(get_player().cor < 75)
         {
            outputText("让你感到糟糕和羞愧。你的全身因尴尬而涨得通红");
         }
         else
         {
            outputText("让你对这个年长的鹰身女妖感到有些恼火。你的全身因愤怒和性奋而涨得通红");
         }
         outputText("直到她柔软的手贴在你的脸颊上，用温柔的声音安抚道：[saystart]别担心，亲爱的。是你体内的东西让我想要你。准确地说，是你");
         if(get_player().balls > 0)
         {
            outputText("蛋蛋");
         }
         else
         {
            outputText("肉棒");
         }
         outputText("里的东西。自从恶魔接管这里以来，我一直在榨取像你这样可爱的" + get_player().mf("种马","扶他") + "，而你是我最新的猎物。你没意见吧？你不介意我为了我饥渴的卵子而释放你所有的压力吧？你当然不介意。[sayend]她的话语带着不容置疑的分量，驱散了你心中的任何不情愿或担忧，取而代之的是接受。索菲真的很懂怎么做。她已经把你诱惑到了可以插入的地步。成为猎物也没那么糟；你可以操这个自信的老女人，直到你把精液射满她的卵子。[pg]");
         outputText("索菲柔声说道：[say:来吧，[boy]，让你的" + get_player().cockDescript(_loc2_) + "尝尝味道。]你顺从了她的请求，向前挺动臀部，");
         if(get_player().cockArea(_loc2_) <= 6)
         {
            outputText("将你的" + get_player().cockDescript(_loc2_) + "插入那过大的阴道中。");
         }
         else if(get_player().cockArea(_loc2_) <= 150)
         {
            outputText("将你的" + get_player().cockDescript(_loc2_) + "深深埋入她巨大的裂口中。");
         }
         else
         {
            outputText("慢慢地将你的" + get_player().cockDescript(_loc2_) + "挤进她巨大的裂口中，发现它勉强能容纳你。");
         }
         outputText("她温暖" + (get_noFur() ? "" : "、长满羽毛") + "的大腿在你身后合拢，双爪锁在一起，将你的" + get_player().cockDescript(_loc2_) + "固定在她小穴那湿漉漉的肉壁中。她“囚禁”你的举动使得湿滑的肉壁紧紧挤压着你的粗度，正如她所承诺的那样。你的臀部带着一种本能的渴望摇摆着，却被索菲肌肉发达的大腿阻挡了。没有抽插，没有反复的插入。只有她的肌肉缓慢的节奏，挤压并按摩着你的" + get_player().cockDescript(_loc2_) + "。[pg]");
         outputText("感觉很好，但无法控制这种行为让你因欲望而发狂。");
         if(get_player().get_tallness() <= 48)
         {
            outputText("你靠在她的乳房上，用鼻子蹭了蹭她的乳头，然后把它吸进嘴里。");
         }
         else if(get_player().get_tallness() < 72)
         {
            outputText("你俯下身，拉起她的乳房，以便把乳头吸进嘴里。");
         }
         else
         {
            outputText("你很想吸她的乳头，但你太高了，所以你只好用拇指和食指捏住她的两个乳头。");
         }
         outputText("鹰身女妖舒服地喘息着，双手抱住你的头，用她那长着长指甲的灵巧指尖抚摸你的耳后。她把你拉");
         if(get_player().get_tallness() < 72)
         {
            outputText("起来");
         }
         else
         {
            outputText("下来");
         }
         outputText("，然后吻了你，重新掌握了主动权，让你品尝到她嘴里的甜美。她的嘴唇留下了一阵令人愉悦的刺痛感，这感觉似乎一直延伸到你的腹股沟，让你的");
         if(get_player().balls == 0)
         {
            outputText("前列腺");
         }
         else
         {
            outputText("蛋蛋");
         }
         outputText("紧缩了一下。[pg]");
         outputText("当索菲退开时，你喘息着呻吟。一缕闪烁着金光的唾液在你们之间拉丝，你的眼神恳求她给你释放。鹰身女妖把你的");
         if(get_player().get_tallness() <= 48)
         {
            outputText("头重新按回她的双乳之间");
         }
         else
         {
            outputText("身体紧紧贴向她，将她的乳房挤压在你们两人之间");
         }
         outputText("，并加快了阴道收缩的节奏。她的腿部肌肉随着这淫荡的节奏紧绷，强行改变你的姿势，以不同的方式摩擦她那被蛋撑开的阴户。她揉乱你的头发，哼出了一道强有力的命令：[say: 射给我，" + get_player().mf("男孩","我的小甜心") + "；让我的蛋受精。][pg]");
         outputText("服从的冲动震撼了你的内心深处。在持续不断的、如同老虎钳般的挤压下，你就算想反抗也无能为力。你的" + get_player().cockDescript(_loc2_) + "抽搐着，开始向你年长情人的收缩着的爱之隧道里倾泻。索菲喘息着：[say: 好[boy]！全射给我吧。] 当你不断地射精，射精，再射精时，她的手指穿过你的[hair]。");
         if(get_player().cumQ() >= 500)
         {
            if(get_player().cumQ() < 1000)
            {
               outputText("到最后，精液开始从鹰身女妖的小穴里喷涌而出，因为你灌入的精液已经超出了她身体的承受极限。");
            }
            else
            {
               outputText("很快，精液就从鹰身女妖的小穴里喷涌而出，因为那巨大的精液喷发量让她可怜的、毫无准备的身体不堪重负。");
            }
            if(get_player().cumQ() >= 4000)
            {
               outputText("她的巢穴里充满了精液，甚至开始溢出边缘，顺着岩石流下，形成一条小河。");
            }
         }
         outputText("你叹了口气，为这位充满母性的鹰身女妖射出了每一滴精液，直到你的");
         if(get_player().balls > 0)
         {
            outputText(get_player().ballsDescriptLight());
         }
         else
         {
            outputText(get_player().cockDescript(_loc2_) + "和前列腺");
         }
         outputText("感到酸痛。[pg]");
         outputText("在这次交欢中彻底耗尽了体力，你靠在她柔软的、长满绒毛的胸膛上，试图平复呼吸。她紧致的隧道继续挤压和翻搅，将你尿道里最后一点黏液榨干。索菲呻吟着：[saystart]嗯，这么年轻就有这么强劲的种子。");
         if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,91) == 0)
         {
            outputText("你知道在过去，我们曾经把男人像这样困住一整天吗？我们会像这样一直抚摸他们，得到一整天的高潮。那太棒了。当然，我们现在生育能力很强，一次高潮就足以让一个卵子受精。看来你很幸运，嗯？");
         }
         else if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,91) <= 2)
         {
            outputText("你真的很喜欢我榨干你，不是吗？那一定是你不断回来要更多的原因。");
         }
         else if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,91) <= 10)
         {
            outputText("你对");
            if(Utils.rand(2) == 0)
            {
               outputText("老女人");
            }
            else
            {
               outputText("鹰身女妖");
            }
            outputText("有恋物癖，还是你只是爱上了我？我已经有一段时间没有像你这样的仰慕者了。我们有一个词来形容像你这样的" + get_player().mf("男孩","荡妇") + "——变态。我开玩笑的，我开玩笑的。像你这样的变态有如此压抑、强效的精液，我知道你喜欢把它给我。");
         }
         else
         {
            outputText("你上瘾了，不是吗？嘘，别回答。我知道你喜欢用鼻子蹭我的乳房，在我的小穴里喷射。快点回来，这样我们就可以下更多的蛋了——其他女孩都嫉妒死我了。");
         }
         outputText("[sayend][pg]");
         outputText("她的双腿慢慢松开，放开了你，让你倒回");
         if(get_player().cumQ() < 1000)
         {
            outputText("她柔软的巢穴表面");
         }
         else if(get_player().cumQ() < 4000)
         {
            outputText("她柔软、沾满精液的巢穴表面");
         }
         else
         {
            outputText("你把她的巢穴变成的巨大精液水坑里");
         }
         outputText("。你挣扎着站起来，惊叹于");
         if(get_player().cockTotal() > 1)
         {
            outputText("你的每一根");
         }
         outputText("[cocks]依然如此坚挺。索菲咯咯地笑着，[saystart]");
         if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,91) == 0)
         {
            outputText("抱歉啦小可爱，这唇彩会让你一直硬邦邦的。它是为了帮助你的");
            if(get_player().balls > 0)
            {
               outputText("蛋蛋");
            }
            else
            {
               outputText("身体");
            }
            outputText("重新充满精液。如果你愿意，我们可以抱在一起，直到药效过去。");
         }
         else
         {
            outputText("对不起，我刚才太投入了，弄得你沾满了我的唇彩，是不是呀小可爱？不如你过来和我依偎几个小时，我可以帮你撸，直到药效过去？");
         }
         outputText("[sayend][pg]");
         luststickApplication(4);
         get_player().orgasm("Dick");
         sophieFucked();
         outputText("你要接受她的提议吗？");
         doYesNo(postSophieSexSnuggle,postSexSophieSnuggleTurnedDown);
      }
      
      public function SophieLossRapeNoDonguuuu() : void
      {
         var _loc1_:* = null as IMap;
         get_sophieBimbo().sophieSprite();
         clearOutput();
         outputText("你彻底被打败了，瘫倒在地。索菲没有停手，无情地用翅膀拍打你，直到你失去知觉。[pg]");
         outputText("当你醒来时，你已经在山脚下了，感觉就像是从整座山上摔下来一样。显然索菲足够小心，没有把你摔死，但她在路上也没给你任何优待。哎呀。");
         dynStats(DynStat.Str(-1),DynStat.Tou(-1));
         get_combat().cleanupAfterCombat();
         if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,96) <= 0)
         {
            FlagDict_Impl_.arrayWriteInt(KFLAGS.flags,96,72 + Utils.rand(100));
            _loc1_ = KFLAGS.flags;
            FlagDict_Impl_.arrayWriteInt(_loc1_,97,FlagDict_Impl_.arrayReadInt(_loc1_,97) + 1);
         }
         else
         {
            _loc1_ = KFLAGS.flags;
            FlagDict_Impl_.arrayWriteInt(_loc1_,96,FlagDict_Impl_.arrayReadInt(_loc1_,96) + Utils.rand(72));
         }
      }
      
      public function PCIgnoresSophieAndHarpyIsFought() : void
      {
         outputText("[pg]一只鹰身女妖从天而降，发起了攻击！");
         startCombat(new Harpy());
         spriteSelect(SpriteDb.get_s_harpy());
      }
      
      public function FirstTimeSophieForceSex() : void
      {
         get_sophieBimbo().sophieSprite();
         clearOutput();
         outputText("你说，[say: 除非我满足了，否则我哪儿也不去。别担心，我一定会好好舔你的。][pg]");
         outputText("索菲的大眼睛因为你的话惊讶地睁大了，她展开翅膀反击道，[say: 那你最好祈祷你能应付得了我。]她抬起脚以示警告。[pg]");
         outputText("这将是一场战斗！");
         startCombat(new Sophie());
      }
   }
}

