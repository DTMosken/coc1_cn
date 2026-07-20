package classes.scenes.npcs
{
   import classes.CoC;
   import classes.Cock;
   import classes.DynStat;
   import classes.ImageManager;
   import classes.Monster;
   import classes.PerkLib;
   import classes.Player;
   import classes.PregnancyStore;
   import classes.TimeAwareInterface;
   import classes._FlagDict.FlagDict_Impl_;
   import classes.display.SpriteDb;
   import classes.globalFlags.KFLAGS;
   import classes.internals.Utils;
   import classes.internals._OneOf.OneOf_Impl_;
   import classes.scenes.Camp;
   import classes.scenes.api.Encounter;
   import classes.scenes.api.EncounterDef;
   import classes.scenes.api.Encounters;
   import classes.scenes.api._Encounters.EncounterChance_Impl_;
   import classes.scenes.combat.Combat;
   import classes.scenes.places.TelAdre;
   import classes.scenes.seasonal.AprilFools;
   import coc.view.CoCButton;
   import flash.Boot;
   import haxe.IMap;
   import haxe.ds.Either;
   
   public class HelScene extends NPCAwareContent implements TimeAwareInterface
   {
      
      public var pregnancy:PregnancyStore;
      
      public var helSexualAmbushEncounter:Encounter;
      
      public var checkedHeliaIsabellaThreesome:int;
      
      public function HelScene()
      {
         var _gthis:HelScene;
         if(Boot.skip_constructor)
         {
            return;
         }
         checkedHeliaIsabellaThreesome = 0;
         _gthis = this;
         super();
         var _loc1_:Either = OneOf_Impl_.fromA(helSexualAmbush);
         helSexualAmbushEncounter = Encounters.build(new EncounterDef("helSexualAmbush",null,EncounterChance_Impl_.fromBoolFun(function():Boolean
         {
            if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,705) == 1 && FlagDict_Impl_.arrayReadInt(KFLAGS.flags,706) == 0 && _gthis.get_player().get_gender() > 0)
            {
               return !_gthis.get_game().helScene.followerHel();
            }
            return false;
         }),_loc1_,null));
         pregnancy = new PregnancyStore(968,967);
         pregnancy.addPregnancyEventSet(25,[300,200,100]);
         CoC.timeAwareClassAdd(this);
      }
      
      public function watchIsabellaAndHelFight() : void
      {
         spriteChooser();
         clearOutput();
         get_images().showImage("helia-isabella-fight");
         outputText("你觉得这不关你的事，于是躲在一旁，看着这两个红发女郎把对方打得落花流水。[pg]");
         outputText("作为唯一“全副武装”的人，赫尔占据了主动，向前猛冲，发动了一连串快速的攻击，伊莎贝拉勉强用盾牌挡开。然而，在最后一次攻击中，火蜥蜴露出了破绽，被猛击打飞，穿过空地。牛娘在赫尔反应过来之前冲了过去，抓住她的腿，试图把她举起来。然而，在她得手之前，赫尔向上踢去，脚重重地踢在伊莎贝拉那巨大的乳沟下方。[pg]");
         outputText("牛娘发出一声痛苦的[say: 哞哞]声，赫尔顺势滚身站起，捡回了她的剑。伊莎贝拉踉跄后退，捂着乳房，一点乳汁弄脏了她衬衫的前襟，浸湿了布料，让你能清楚地看到她那肿胀的四乳头。[pg]");
         outputText("[say: 你这个婊子！]伊莎贝拉厉声说道，用蹄子在地上摩擦。[say: 我会让你付出代价的，坏女孩！][pg]");
         outputText("[say: 放马过来吧，母牛！]赫尔回应道，眨眼间她们就交锋在一起，你来我往，互不相让。当她们缠斗在一起时，就像是一场美丽而致命的芭蕾，旋转的钢铁、挥舞的尾巴和弹跳的乳肉交织在一起。从某种程度上来说，这甚至有些性感，两个红发女孩互相旋转、刺击，在惊险的闪避中肌肤相亲，赫尔的剑与伊莎贝拉的盾牌碰撞出耀眼的火花。[pg]");
         outputText("突然，一根长矛猛地扎在你几英尺外的地上，正中赫尔和伊莎贝拉之间。紧接着，一根又一根长矛呼啸着划破空气。还没等你眨眼，天空中就下起了长矛雨，你能听到豺狼人逼近时发出的阵阵狂笑。你拼命迈动[legs]逃跑，而赫尔和伊莎贝拉则被迫躲在牛娘巨大的盾牌后面，在豺狼人发动猛烈攻击时，两人都发出了愤怒和恐惧的尖叫。[pg]");
         outputText("当投射物攻击暂停时，你能听到赫尔大喊：[say: 我们下次再算账，母牛！][pg]");
         outputText("[say: 走着瞧，坏女孩！]伊莎贝拉喊道，随后两人分开，消失在灌木丛中，以躲避狩猎小队。");
         doNext(get_camp().returnToCampUseOneHour);
      }
      
      public function timeChangeLarge() : Boolean
      {
         if(get_game().time.hours == 23 && get_helFollower().followerHel() && FlagDict_Impl_.arrayReadInt(KFLAGS.flags,966) >= 150 && FlagDict_Impl_.arrayReadInt(KFLAGS.flags,963) == 0)
         {
            get_helSpawnScene().heliaBonusPointsAward();
            return true;
         }
         if(get_game().time.hours == 8 && get_helFollower().followerHel() && FlagDict_Impl_.arrayReadInt(KFLAGS.flags,965) == 1)
         {
            get_helSpawnScene().helGotKnockedUp();
            return true;
         }
         if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,479) == 1 && FlagDict_Impl_.arrayReadInt(KFLAGS.flags,493) > 0 && get_helFollower().helAffection() >= 100 && FlagDict_Impl_.arrayReadFloat(KFLAGS.flags,696) == 0 && get_game().time.hours == 2)
         {
            get_helFollower().heliaFollowerIntro();
            return true;
         }
         if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,479) == -1 && get_game().time.hours == 6)
         {
            get_game().dungeons.heltower.morningAfterHeliaDungeonAgreements();
            return true;
         }
         if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,960) == 2 && (get_game().time.hours == 2 || get_game().time.hours == 3 || get_game().time.hours == 4) && FlagDict_Impl_.arrayReadInt(KFLAGS.flags,961) >= 7 && FlagDict_Impl_.arrayReadInt(KFLAGS.flags,973) == 0)
         {
            get_helSpawnScene().helspawnIsASlut();
            return true;
         }
         §§push(false);
         §§push(false);
         §§push(false);
         §§push(false);
         var _loc1_:int;
         checkedHeliaIsabellaThreesome = (_loc1_ = checkedHeliaIsabellaThreesome) + 1;
         if(_loc1_ == 0)
         {
            §§pop();
            §§push(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,393) == 1);
         }
         if(§§pop())
         {
            §§pop();
            §§push(get_game().isabellaFollowerScene.isabellaAtCamp());
         }
         if(§§pop())
         {
            §§pop();
            §§push(get_game().time.hours == 2);
         }
         if(§§pop())
         {
            §§pop();
            §§push(int(get_game().time.days % 11) == 0);
         }
         if(§§pop())
         {
            if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,397) == 0)
            {
               spriteSelect(SpriteDb.get_s_isabella());
               followrIzzyxSallyThreesomePretext();
               return true;
            }
            if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,397) == 1)
            {
               spriteSelect(SpriteDb.get_s_isabella());
               isabellaXHelThreeSomeCampStart();
               return true;
            }
         }
         if(Utils.trueOnceInN(5) && !get_player().isGenderless() && get_game().time.hours == 2 && FlagDict_Impl_.arrayReadString(KFLAGS.flags,701) == "Helia" && FlagDict_Impl_.arrayReadInt(KFLAGS.flags,705) == 1 && get_game().time.days - 1 > get_helFollower().saveContent.lastTimeSex)
         {
            get_helFollower().heliaNightlyNeeds();
            return true;
         }
         return false;
      }
      
      public function timeChange() : Boolean
      {
         var _loc1_:* = null as IMap;
         checkedHeliaIsabellaThreesome = 0;
         pregnancy.pregnancyAdvance();
         if(get_game().time.hours > 23)
         {
            if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,961) > 0)
            {
               _loc1_ = KFLAGS.flags;
               FlagDict_Impl_.arrayWriteInt(_loc1_,961,FlagDict_Impl_.arrayReadInt(_loc1_,961) + 1);
            }
            if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,706) == 1)
            {
               FlagDict_Impl_.arrayWriteInt(KFLAGS.flags,706,0);
            }
         }
         if(get_game().time.hours == 3 && followerHel() && FlagDict_Impl_.arrayReadString(KFLAGS.flags,701) == "Helia" && Utils.rand(10) == 0)
         {
            get_game().helFollower.sleepyNightMareHel();
            return true;
         }
         return false;
      }
      
      public function telHelToGetOffTheMInoCock() : void
      {
         clearOutput();
         outputText("当你和你的爱人躺在性爱后的余韵中时，一个念头闪过你的脑海：赫尔刚刚在小穴里接了一大股牛头人的精液。这……这可不太好。你把这事告诉了她，并补充说");
         if(get_player().minotaurAddicted())
         {
            outputText("你有亲身体会");
         }
         else
         {
            outputText("你听说过");
         }
         outputText("他们的精液会让人上瘾，你不想让她染上这玩意儿。");
         outputText("[pg][say:嗯？]她回答道，对你挑了挑眉。[say:你说的“上瘾”是什么意思？牛精液怎么可能会让人上瘾；这他妈的有什么道理？]");
         outputText("[pg]你耸耸肩，告诉她事实就是如此");
         if(marbleFollower())
         {
            outputText("，就像牛娘的母乳会让人上瘾一样");
         }
         outputText("。");
         outputText("[pg][say:好吧，妈的，[name]。我也不想对牛头人的精液上瘾，但是……现在我他妈该怎么办？那些公牛是这附近最棒的炮友……当然，在场的人除外，]她眨了眨眼补充道。");
         outputText("[pg]你觉得你可以主动提出满足她的需求……或者干脆去他妈的，让她继续随心所欲地操牛头人。");
         menu();
         addButton(0,"没关系",helCanFuckMinosWhenever);
         addButton(1,"满足她",satisfyHelSoSheStopsMinoFucking);
      }
      
      public function telHelSTOPATTACKINGMEYOUBITCH() : void
      {
         spriteChooser();
         clearOutput();
         outputText("即使知道她并不想真的伤害你，你还是要求火蜥蜴停止攻击你。[pg]");
         outputText("她叹了口气，但把脸埋进你的脖子，深深地吸了一口气。当她满意时，她向后靠了靠，说道，[say: 我现在记住你的气味了。如果我提前闻到你……我会尽量不对你发脾气。但如果你想让我保持清醒，你最好准备好在我们见面时尝试一种不同的切磋。好吗？][pg]");
         outputText("你轻轻拍了拍她的脸颊，告诉她没问题。[pg]");
         FlagDict_Impl_.arrayWriteInt(KFLAGS.flags,393,1);
         helChatMenu();
      }
      
      public function stuffIzzyAndSalamanderWithDicks() : void
      {
         spriteChooser();
         clearOutput();
         get_images().showImage("helia-isabella-threesome-dick");
         var _loc1_:int = -1;
         var _loc2_:int = -1;
         var _loc3_:int = -1;
         var _loc4_:int = -1;
         var _loc5_:int = int(get_player().cocks.length);
         while(_loc5_ > 0)
         {
            _loc5_--;
            if(get_player().cockArea(_loc5_) <= 85)
            {
               if(_loc1_ == -1)
               {
                  _loc1_ = _loc5_;
               }
               else if(_loc2_ == -1)
               {
                  _loc2_ = _loc5_;
               }
               else if(_loc3_ == -1)
               {
                  _loc3_ = _loc5_;
               }
               else if(_loc4_ == -1)
               {
                  _loc4_ = _loc5_;
                  break;
               }
            }
         }
         outputText("你站起身，开始脱下你的[armor]。你的胯部一解脱，" + get_player().SMultiCockDesc() + "就弹了出来，因为看到赫尔爬到伊莎贝拉身上，将她的E罩杯压在母牛产奶的乳房上，并给了她一个深深的吻，它已经完全硬了。你退后了一会儿，看着这个吻，刚好能瞥见伊莎贝拉宽大平坦的舌头与赫尔细长的舌头交织在一起。[pg]");
         outputText("两个女孩巨大的乳房紧紧压在一起，在她们之间形成了一道屏障，迫使赫尔保持背部拱起。她回头瞥了你一眼，诱人地扭动着宽大的臀部，翘起火红的尾巴，让你清楚地看到她湿透的小穴和丰满双臀间紧致的后庭。[pg]");
         outputText("这就是你所需要的全部邀请。你在两个红发女郎身后跪下，将你的" + get_player().cockDescript(_loc1_) + "刺入赫尔的小穴，引得火蜥蜴发出一声尖锐的呻吟。");
         if(_loc2_ >= 0)
         {
            outputText("与此同时，你的" + get_player().cockDescript(_loc2_) + "轻松地滑入伊莎贝拉的小穴，这突如其来的插入让牛娘倒吸了一口凉气。");
         }
         outputText("你抓住赫尔的臀部用力挺进，沉醉于她小穴难以置信的火热与紧致，你的" + get_player().cockDescript(_loc1_) + "滑入其中，直到没入根部");
         if(_loc2_ >= 0)
         {
            outputText("，你的" + get_player().cockDescript(_loc2_) + "也同样停留在伊莎贝拉的深处；你能感觉到牛娘急促的心跳传遍全身，使她本就紧致的小穴随着你的粗壮有节奏地收缩");
         }
         outputText("。[pg]");
         outputText("现在深深地没入");
         if(_loc2_ == -1)
         {
            outputText("她");
         }
         else
         {
            outputText("她们");
         }
         outputText("的深处，你开始微微摇晃臀部，看着女孩们互相挑逗，从亲吻到重度爱抚，互相抓揉吮吸着对方的乳房，双手在彼此的身体上性感地游走。然而，在火蜥蜴一个眼神的刺激下，你开始将臀部撞向她的屁股，用短促有力的抽插操着");
         if(_loc2_ == -1)
         {
            outputText("她");
         }
         else
         {
            outputText("她们");
         }
         outputText("，让");
         if(_loc2_ == -1)
         {
            outputText("她");
         }
         else
         {
            outputText("她们");
         }
         outputText("尽可能多地被你的肉棒填满。[pg]");
         if(_loc2_ == -1)
         {
            outputText("考虑到伊莎贝拉一直被冷落，你带着湿润的吧唧声从赫尔体内抽出，将肉棒拍打在牛娘的小穴上。她倒吸一口凉气，越过火蜥蜴的肩膀看着压在她裂口上的巨大阴茎。[pg]");
            if(get_player().cocks[_loc1_].cockLength > 9)
            {
               if(isabellaAccent())
               {
                  outputText("[say:我通常不玩这么……大的……东西，但为了你，我破例一次。把你的肉棒给我！][pg]");
               }
               else
               {
                  outputText("[say:我通常不玩这么……笨重的……东西，但为了你，我破例一次。把你的肉棒给我！][pg]");
               }
            }
            outputText("你依然抓着赫尔的臀部，滑入伊莎贝拉体内。她比你想象的还要紧，尽管她已经湿透了，你还是得费点力气才能把你的" + get_player().cockDescript(_loc1_) + "推进去。当你埋入她体内一半时，你开始往外抽，赫尔适时地吸吮她的乳房，让她呻吟出声。你再次猛地插到底，这次把肉棒连根没入她体内。伊莎贝拉发出一声近乎高潮的“哞——”，你开始认真地操她，借着赫尔的臀部发力，用你的" + get_player().cockDescript(_loc1_) + "猛捣牛娘的小穴。[pg]");
            outputText("你这样持续了大概两分钟，然后从牛娘体内抽出，再次猛地插进火蜥蜴火热的小穴里。毫无防备的赫尔倒吸一口凉气，喷出一点乳汁，洒满了伊莎贝拉本就汗湿的胸膛。现在从吸吮和操弄的组合中解脱出来的伊莎贝拉在赫尔身下扭动，不知怎么地让两人摆出了69的姿势，而你继续操着火蜥蜴。现在处于更公平的位置，你看到赫尔的头在伊莎贝拉诱人的大腿间上下点动，看着牛娘伸出舌头，给赫尔一个长长湿润的舔舐，然后顺着你的" + get_player().cockDescript(_loc1_) + "底部向上舔。伊莎贝拉舌头划过你阴茎的奇异感觉让你浑身一颤，导致你操赫尔的动作停顿了一下。不过，你给了牛娘一个鼓励的点头，然后重新开始，尽可能快而狠地捣弄她。[pg]");
            outputText("这几分钟的时光仿佛是永恒的极乐，但很快你的两个小甜心就变得焦躁不安起来。你从赫尔体内抽出，给她们一个交换位置的机会，让伊莎贝拉紧致的牛穴对准你的肉棒，而赫尔的脸则在它上方。火蜥蜴对你的肉棒送上了一个赞赏的吻，品尝着仍附着在上面的自己的汁液，咧嘴一笑，然后伸出长长的舌头，在伊莎贝拉的小阴蒂上轻弹。这让那条缝隙向你敞开，你毫不犹豫地滑了进去。这次进去容易多了，你很快就埋得足够深，以至于你的胯部压在了赫尔的鼻子上，让两个女孩都扭动起来。你突发奇想，抬起牛娘毛茸茸的双腿，让它们靠在你的胸前，她的蹄子在你的肩膀上摇晃，让你能以更好的角度进入她。你再次开始在她体内抽插，速度比以前慢，操得更温柔但也更坚定。[pg]");
            outputText("操着牛娘紧致的小穴，加上赫尔偶尔长长而性感的舔舐，让你越来越接近高潮，你能感觉到伊莎贝拉急促的呼吸和围绕着你肉棒的收缩也在回应着你。即使是赫尔，在牛娘那令人难以置信的口交服侍下，也随着不断累积的快感而喘息着。[pg]");
            outputText("但你并不满足于仅仅在这里射精。你尽力忍住高潮，看着赫尔和伊莎贝拉互相舔舐直到高潮，两个丰满的红发女孩在达到高潮时都尖叫着表达她们的快感。伊莎贝拉紧紧夹住你的肉棒，试图榨干它——但你拒绝现在就结束，而是把自己从她那浸满淫液的穴里拔出来，大声让女孩们跪下。[pg]");
            outputText("虽然她们还在从自己的高潮中恢复，但还是颤抖着照做了。在你的几个简单指示下，她们基本上抱在了一起，伊莎贝拉那巨大的、充满乳汁的乳房紧紧压在赫尔柔软的E罩杯上。你俯下身，向上挺进，将你的肉棒推入两对乳房之间。女孩们喘息着，既觉得有趣又感到兴奋，因为你开始了你的双重乳交，你的臀部猛烈地撞击着她们的乳房，力度大到足以让她们在你的操弄下产生乳震。[pg]");
            outputText("赫尔和伊莎贝拉突然相视一笑，同时伸出了舌头。伊莎贝拉那巨大平坦的舌头巧妙地包裹住你肉棒的粗细，而赫尔那柔软细长的舌头则在你的尿道口上下滑动，作为回报对你进行舌交。这在几秒钟内就起效了，让你在狂喜中尖叫出声，疯狂地挺动臀部。你的龟头在女孩们身上爆发，第一团精液直接拍在伊莎贝拉的脸上，第二团抹在赫尔的脖子和下巴上；剩下的像间歇泉一样喷向空中，然后落在她们的乳房上，在你结束之前，把她们俩弄得一团糟，浑身都是精液。");
         }
         else if(_loc3_ == -1 || _loc4_ == -1)
         {
            outputText("现在你用超乎常人的双重天赋同时操着两个女孩，进入了稳定有力的抽插节奏。女孩们在你猛烈的操弄下尖叫呻吟，只有在互相亲吻或吮吸时才会停下那甜美的娇喘。然而，就在你找到节奏时，你突然被推倒在地，伊莎贝拉和赫尔用她们带蹄或带鳞的脚调皮地踢了你一下。她们交换了位置，让伊莎贝拉在前面，面对着你坐在你的" + get_player().cockDescript(_loc1_) + "上，而赫尔坐在她身后，被你的" + get_player().cockDescript(_loc2_) + "刺穿。");
            if(_loc3_ > -1)
            {
               outputText("而你的" + get_player().cockDescript(_loc3_) + "甚至现在还在刺穿她紧致的屁股");
            }
            outputText("。[pg]");
            outputText("赫尔在伊莎贝拉的肩膀上咧嘴笑着，抓住牛娘那乳白色的乳房，用拇指和食指捏住她四个乳头中的一个。[say:伊莎贝拉，我觉得我们亲爱的[name]出了很多汗……][pg]");
            if(isabellaAccent())
            {
               outputText("[say:哦，是的！]伊莎贝拉说道，现在也咧嘴笑了起来。你开始担心了，但在两个大块头女人的压制下，以及所有肉棒同时被骑乘的强烈快感中，你对即将发生的事情几乎无能为力。[say:哦，是的，]伊莎贝拉重复道，[say:而且我觉得我们的勇者需要洗个澡！][pg]");
            }
            else
            {
               outputText("[say: 哦，是的！]伊莎贝拉说道，现在也咧嘴笑了起来。你开始感到担忧，但在两个将你按倒在地的大块头女人和所有的阴茎同时被骑乘的强烈快感之间，你对即将发生的事情几乎无能为力。[say: 哦，是的，]伊莎贝拉重复道，[say: 而且我认为我们的勇者需要洗个澡！][pg]");
            }
            outputText("你还没来得及说一句话，赫尔就捏住了伊莎贝拉肿胀的乳头，你立刻被牛娘乳头喷涌而出的浓稠、奶油般的乳汁瀑布冲刷，似乎无穷无尽地流到你身上。你喘着粗气咳嗽着，很快嘴里就充满了母乳，因为赫尔将伊莎贝拉的乳汁流向你的脸。在牛奶浴下你忍不住笑了起来，拼命地想要舔舐流到你身上的大量牛奶。[pg]");
            outputText("与此同时，你的阴茎仍然被红发女郎们用力地骑乘着。她们俩都配合着对方的节奏向前挺动臀部，保持着稳定而强烈的节奏，在");
            if(_loc3_ == -1)
            {
               outputText("两根");
            }
            else
            {
               outputText("所有三根");
            }
            outputText("根肉棒都在使用中。不过令人惊讶的是，她们反而是先高潮的——伊莎贝拉发出一声尖锐的“哞——”，下体紧紧收缩，夹紧了你的" + get_player().cockDescript(_loc1_) + "，被双重快感淹没。赫尔紧随其后，疯狂地加快节奏，让自己达到了高潮。[pg]");
            outputText("她们现在截然不同却又不断加快的速度让你达到了极限，而且非常猛烈。你猛地仰起头，射精了，将浓稠的精液射入她们两人的子宫里");
            if(_loc3_ > -1)
            {
               outputText("以及赫尔的屁股里");
            }
            outputText("。你挺动臀部撞向她们，将肉棒尽可能深地插进去，同时释放出第二股、第三股精液，直到你的精液开始从女孩们的穴里溢出，把她们的大腿以及你的臀部和双腿都涂满了你的白浊。");
         }
         else
         {
            outputText("虽然你已经把女孩们操得很爽了，但这远远不够。你向后仰身，直到你最前面的两根肉棒从她们体内拔出，然后开始重新调整姿势。两个女孩睁大眼睛，看着你挺起四根肉棒对准她们。[pg]");
            outputText("[say: 卧槽，你在干——] [say: 哞哞哞！][pg]");
            outputText("你将四根肉棒全部猛插进她们体内，把你的" + get_player().cockDescript(_loc1_) + "埋进赫尔的屁股，你的" + get_player().cockDescript(_loc2_) + "插进她的小穴，你的" + get_player().cockDescript(_loc3_) + "插进伊莎贝拉的小穴，而你的" + get_player().cockDescript(_loc4_) + "则捅进她紧致的后庭。[pg]");
            outputText("当你把肉棒塞进她们的洞里，直到你的臀部紧紧贴在赫尔张开的屁股上时，两个女孩都尖叫呻吟起来。你抓住她宽大的臀部，开始慢慢向后摇晃，然后再次猛烈向前撞击，让她们都在狂喜中尖叫。你狂笑着，开始猛烈地操弄这两个可怜的女孩，肉棒抽插的速度如此之快，以至于她们很快就张大嘴巴吐出舌头，双眼翻白——当你同时操弄她们的四个洞时，她们几乎失去了知觉。[pg]");
            outputText("不幸的是，同时用四根肉棒做爱很快就让你达到了极限。你大声吼叫着，声音大得仿佛连地面都在震动，你将精液倾泻进她们体内，把她们的小穴和屁股灌得满满的，精液甚至开始从你的肉棒周围漏出来。你心满意足地仰面倒下，大口喘着粗气。");
         }
         get_player().orgasm("Dick");
         dynStats(DynStat.Sens(-3));
         get_helFollower().saveContent.lastTimeSex = get_game().time.days;
         get_helFollower().helAffection(5);
         doNext(izzySallyThreeSomeFollowup);
      }
      
      public function spriteChooser() : void
      {
         if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,397) >= 1 && FlagDict_Impl_.arrayReadInt(KFLAGS.flags,966) < 150)
         {
            spriteSelect(SpriteDb.get_s_hel_sprite_BB());
         }
         else if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,397) == 0 && FlagDict_Impl_.arrayReadInt(KFLAGS.flags,966) >= 150)
         {
            spriteSelect(SpriteDb.get_s_hel_sprite_PF());
         }
         else if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,397) >= 1 && FlagDict_Impl_.arrayReadInt(KFLAGS.flags,966) >= 150)
         {
            spriteSelect(SpriteDb.get_s_hel_sprite_BB_PF());
         }
         else
         {
            spriteSelect(SpriteDb.get_s_hel_sprite());
         }
      }
      
      public function skipTownOnIsabellaAndHelsFight() : void
      {
         spriteChooser();
         clearOutput();
         outputText("好吧，你绝对不想卷入其中——最好让她们自己一决高下，免得危及你和任何一个女孩的关系。你径直走回营地，听到远处传来一阵尖锐的牛叫、闷哼和叫喊声，你一点也不觉得惊讶。[pg]");
         FlagDict_Impl_.arrayWriteInt(KFLAGS.flags,397,-1);
         doNext(get_camp().returnToCampUseOneHour);
      }
      
      public function satisfyHelSoSheStopsMinoFucking() : void
      {
         clearOutput();
         outputText("沉思片刻后，你对火蜥蜴露出一个充满欲望的笑容，告诉她你只能亲自满足她那巨大的性欲了。她似乎对你的提议感到惊讶，用力地朝你眨了眨眼。");
         outputText("[pg][say:哎呀，这提议可真不得了，]她笑着翻身跨坐在你的[hips]上。[say:小心别许下你无法兑现的承诺，我的爱人……我们火蜥蜴的性欲可是强得惊人。如果你跟不上，那可就太遗憾了……]");
         if(get_player().lib >= 50)
         {
            outputText("[pg]你抓住赫尔的肩膀，把她扔到地上，你的");
            if(get_player().hasCock())
            {
               outputText("[cock]硬了起来，准备再战");
            }
            if(get_player().get_gender() == 3)
            {
               outputText("并且你的");
            }
            if(get_player().hasVagina())
            {
               outputText("[vagina]已经被你淫荡的分泌物浸透了");
            }
            if(get_player().get_gender() == 0)
            {
               outputText("屁股已经准备好再次被操了");
            }
            outputText("。");
            outputText("[pg][say: 好了，我们有了一个好的开始！]赫尔笑着，把你拉进她柔软温暖的乳沟里。[say: 来吧，我的爱人——让我看看你的本事！]");
         }
         else
         {
            outputText("[pg]你做了个鬼脸，但决定最好还是努力跟上这只淫荡的火蜥蜴，而不是冒着你的朋友对");
            if(get_player().hasCock())
            {
               outputText("另一根鸡巴的");
            }
            outputText("精液上瘾的风险。你点点头，同意在她需要的时候满足她。");
            outputText("[pg]她对你微笑着，长着爪子的手紧紧抓住你的[skinfurscales]。[say: 别担心，我的爱人。我会小心不弄伤你的……太多。]");
         }
         if(get_player().get_lust() < 33)
         {
            dynStats(DynStat.Lust(0.1));
            get_player().set_lust(33);
         }
         FlagDict_Impl_.arrayWriteInt(KFLAGS.flags,705,1);
         FlagDict_Impl_.arrayWriteInt(KFLAGS.flags,393,1);
         helFuckMenu();
      }
      
      public function salamanderXIsabellaPlainsIntro() : void
      {
         spriteChooser();
         clearOutput();
         get_images().showImage("helia-isabella-fight");
         outputText("你走在玛瑞斯广阔的平原上，很快就发现自己被淹没在齐腰高的草丛中，像是在杂草的海洋中跋涉。漫无目的地走了几分钟后，你听到远处传来一声惊讶而低沉的牛叫，紧接着是钢铁碰撞的清脆声。你知道伊莎贝拉的营地离这里不远，于是你准备好你的[weapon]，以最快的速度向牛娘的营地赶去。[pg]");
         outputText("你高举[weapon]冲进伊莎贝拉的营地。令你惊恐的是，红发牛娘正举着她巨大的塔盾，死死盯着火蜥蜴赫尔。而火蜥蜴手持长剑，蓄势待发！[pg]");
         outputText("[say: 你死定了，你这个大奶子婊子，]赫尔咆哮着，用剑做了一个快速的假动作。[pg]");
         outputText("伊莎贝拉迅速闪避——对于她的体型来说，这动作出奇地敏捷——并威胁性地跺着蹄子。[say: 我绝不会让你偷走我的奶，粗鲁的野蛮人！][pg]");
         outputText("[say: 我才不想要你的奶，你这头蠢牛！]赫尔厉声反驳。[say: 我只想要回我那该死的头巾！][pg]");
         outputText("伊莎贝拉傲慢地哼了一声，巨大的乳房在薄薄的衬衫下颤动。你顺着目光看向伊莎贝拉丰满的臀部，果然，牛娘在她的尾巴上系了一个亮蓝色的蝴蝶结。[say: 它已经不是你的了，坏女孩！这是伊莎贝拉光明正大找到的。][pg]");
         outputText("没等伊莎贝拉说完，火蜥蜴就跃入空中，将长剑狠狠劈向牛娘勉强举起的盾牌上。这一击的力道让两人都踉跄了一下，给了你在流血事件发生前介入的机会！");
         menu();
         addButton(0,"外交",salamanderXIsabellaDiplomacy);
         addButton(1,"旁观",watchIsabellaAndHelFight);
         addButton(2,"离开",skipTownOnIsabellaAndHelsFight);
      }
      
      public function salamanderXIsabellaDiplomacy2() : void
      {
         spriteChooser();
         clearOutput();
         outputText("既然你已经引起了这两位红发女郎的注意，你坚持要知道这里到底发生了什么事。[pg]");
         outputText("赫尔瞪着伊莎贝拉说道：[say: 这头……母牛……几个月前偷了我的头巾，而且还不肯还给我。][pg]");
         outputText("伊莎贝拉愤愤不平地哼了一声，对火蜥蜴嗤之以鼻。[say: 别听这个小骗子胡说，[name]。我是在豺狼人手里找到它的，绝对没有偷。][pg]");
         outputText("[say: 嘿……她怎么知道你的名字，[name]？]赫尔问道，双臂交叉抱在她那丰满的胸前，对你皱起眉头。[pg]");
         outputText("牛娘皱起眉头。[say: 是啊！我也想问同样的问题。][pg]");
         outputText("接下来的几分钟里，你向她们解释了你是如何依次遇到她们的，赫尔和伊莎贝拉都半信半疑地点了点头。向这两个试图恐吓你的女人解释清楚后，你");
         if(get_player().cor < 50)
         {
            outputText("在她们审视的目光下陷入了沉默。");
         }
         else
         {
            outputText("恶狠狠地瞪着她们，仿佛在挑战她们，看谁敢用轻率的评论来评价你自己的性经历。");
         }
         outputText("[pg]");
         outputText("[say: 那么，]伊莎贝拉终于开口了，将目光从你身上移向火蜥蜴。[say: 你们俩是……恋人，对吧？而伊莎贝拉刚才还想揍你一顿呢！][pg]");
         outputText("[say: 是啊，]赫尔轻蔑地回答道，[say: 而且，我想既然你是[name]的朋友……你大概还算不错。虽然刚才是我占上风，你这个无礼的婊子。][pg]");
         outputText("当赫尔向伊莎贝拉伸出手时，你的脸上浮现出傻乎乎的笑容。牛娘警惕地握住了她的手。两个女孩较劲似的加快了握手的节奏，直到她们那两对巨大的乳房都跟着晃动起来。[pg]");
         outputText("[say: 哦……还有这个，]伊莎贝拉说着，松开了");
         if(get_silly())
         {
            outputText("(挤奶)");
         }
         else
         {
            outputText("握手");
         }
         outputText("的动作，从尾巴上解下蓝色的蝴蝶结递给赫尔。赫尔高兴地喘了口气，一把抓过蝴蝶结绑在额头上——这让她看起来像个半裸的突击队员——不过很快就被她红色的长发遮住了。[pg]");
         outputText("[say: 是啊。你人还不错。] 赫尔说着，终于把剑收回了鞘中。[say: 谢谢你把我妈妈的头巾还给我。][pg]");
         outputText("[say: 不……客气，]伊莎贝拉在向你们俩道别前说道。你很快也跟着向女孩们道别，然后踏上回营地的路，为你可能促成了她们之间的友谊而感到自豪。");
         get_isabellaFollowerScene().isabellaAffection(5);
         get_helFollower().helAffection(5);
         FlagDict_Impl_.arrayWriteInt(KFLAGS.flags,397,1);
         doNext(get_camp().returnToCampUseOneHour);
      }
      
      public function salamanderXIsabellaDiplomacy() : void
      {
         spriteChooser();
         clearOutput();
         if(get_player().get_str() > 60)
         {
            outputText("这两位女战士比你预想的更快恢复过来，咆哮着冲向对方。你所能做的就是跳到她们中间，试图将她们分开。你承受了她们攻击的冲击，但勉强挡住了她们，直到她们从战斗的狂热中冷静下来，认出了你。[pg]");
            outputText("[say: [name]！？]她们同时脱口而出，对你的介入感到惊讶。");
         }
         else
         {
            outputText("这两位女战士比你预想的更快恢复过来，咆哮着冲向对方。你所能做的就是跳到她们中间，试图将她们分开。不幸的是，两个女人同时发动的攻击几乎瞬间就压倒了你；她们攻击的力道将你击倒在地，你立刻发现自己被蹄子和爪子踩踏。有那么一瞬间，你的生活在你眼前闪过，伊莎贝拉和赫尔把你揍得屁滚尿流，她们在上面打得不可开交，几乎没有注意到你的存在。[pg]");
            outputText("让你松了一口气的是，几秒钟后你听到伊莎贝拉和赫尔同时喊道：[say: [name]！]。这两个女人暂时停止了争吵来帮助你；很快，你的头就靠在了伊莎贝拉那深邃的乳沟上，而赫尔则用一根长长的平原草绑住你胸骨上的伤口。[pg]");
         }
         get_player().takeDamage(10);
         statScreenRefresh();
         doNext(salamanderXIsabellaDiplomacy2);
      }
      
      public function runAwayFromFoxGirls() : void
      {
         spriteChooser();
         clearOutput();
         outputText("你礼貌地找了个借口，说你把东西忘在营地了。三个女孩异口同声地发出[say: 噢——]的声音，但并没有刻意挽留你。当你走出去时，你回头看了一眼，正好看到赫尔对你眨了眨眼，而那两只双性狐狸兽人正爬上她的腿。至少今天有人能爽一爽了。[pg]");
         doNext(get_telAdre().barTelAdre);
      }
      
      public function receiveCorruptRimjobsFromHel() : void
      {
         spriteChooser();
         clearOutput();
         outputText("看到火蜥蜴狂战士跪在地上的样子，你下半身的欲火被点燃了，没过多久你就脱下了[armor]向她逼近。她抬头看着你，咬紧牙关似乎准备攻击——你先发制人，狠狠地踢了她的胸口一脚，把她仰面踢倒，然后跪下来跨坐在她身上，用膝盖把她的手臂压在下面，同时把你的[asshole]悬在她的脸部上方。[pg]");
         outputText("她很快就明白了你的意图，你感觉到她那分叉的蛇信子般的舌头伸了出来，开始探索你的大腿、臀瓣和胯部。");
         if(get_player().hasVagina())
         {
            outputText("她的舌头开始瞄准你的" + get_player().vaginaDescript(0) + "，但你迅速在她的奶子上拍了一下作为惩罚。你还有别的计划！");
         }
         outputText("[pg]");
         outputText("过了一会儿，她长长的舌头顺着你的[ass]游走，让你感到一阵阵愉悦的战栗，但这还只是前戏。你强迫自己放松括约肌，她的舌头在你的[asshole]上舔了一次，两次，三次。眨眼间，她就进去了！当她细长的舌头在你体内抽插扭动，挑逗并取悦你敏感的肠道肌肉时，你忍不住喘息起来，而她则越探越深。[pg]");
         outputText("在你的深处，她将光滑、布满鳞片的手按在你的[ass]上，开始尽可能快地弹动舌头，在你的屁股里进进出出。你像个荡妇一样喘息呻吟");
         if(get_player().biggestTitSize() >= 1)
         {
            outputText("，揉捏着你的乳房，");
         }
         outputText("你挺动臀部，将下体撞向她的脸，当她用力且快速地操你的屁股时，你几乎无法支撑自己的体重。[pg]");
         outputText("最后，你再也受不了了，感觉到高潮即将到来。火蜥蜴可能从你绞紧她舌头的方式感觉到了这一点，她在你的[ass]上狠狠拍了一下，然后尽可能深地插了进去！你冲破了临界点，尖叫着、颤抖着，以至于瘫倒在泥土上，在愉悦中扭动着，而她的舌头慢慢地从你的[asshole]中退了出来。[pg]");
         outputText("你睁大眼睛，喘着粗气，挣扎着站起来，从她仰卧的身体上抓了几颗宝石，然后踉踉跄跄地回到营地，从这场性爱中恢复过来。");
         get_player().orgasm("Anal");
         var _loc1_:IMap = KFLAGS.flags;
         FlagDict_Impl_.arrayWriteInt(_loc1_,394,FlagDict_Impl_.arrayReadInt(_loc1_,394) + 1);
         var _loc2_:int = 395;
         FlagDict_Impl_.arrayWriteInt(KFLAGS.flags,_loc2_,FlagDict_Impl_.arrayReadInt(KFLAGS.flags,_loc2_) - 1);
         get_helFollower().helAffection(-15);
         if(get_game().get_inCombat())
         {
            get_combat().cleanupAfterCombat();
         }
         else
         {
            doNext(postHelFuckBuddyFollowup);
         }
      }
      
      public function rapingHelsAssMeansYourCorruptCauseAnalIsEvil() : void
      {
         spriteChooser();
         var _loc1_:int = get_player().cockThatFits(85);
         var _loc2_:int = get_player().cockThatFits2(85);
         clearOutput();
         outputText("你的肉棒已经在你的" + Utils.cnName(get_player().get_armorName()) + "里硬了起来，你绕到倒地的火蜥蜴身后，在她长满鳞片的背上狠狠地踢了一脚。她惊叫一声，脸朝下摔倒在地，留下她肌肉发达的屁股和长长而炽热的尾巴在空中诱人地摇晃着。你咧嘴一笑，急忙把你的[armor]扔到一边，撕下她的比基尼泳裤，露出了她小穴的裂口，以及你真正的战利品——她紧致的小菊花，几乎隐藏在她尾巴的阴影里。正当你准备索取胜利的战利品时，仍然不屈服的火蜥蜴用那条尾巴猛烈地抽打了过来！[pg]");
         outputText("她太累了，而你的技巧又太高超，这次攻击根本无法命中。相反，你抓住她宽阔的臀部向前猛冲，将你的" + get_player().cockDescript(_loc1_) + "狠狠地插进她的屁股里");
         if(_loc2_ >= 0)
         {
            outputText("，同时将你的" + get_player().cockDescript(_loc2_) + "插进她等待的阴道里，对这个无助的狂战士进行双重打击");
         }
         outputText("趁她虚弱的时候。她惊讶地尖叫起来，弓起背，痛苦地扭动着。[pg]");
         outputText("她紧得像丝绸做的老虎钳！她的括约肌紧紧地夹住你的肉棒，让你每前进一寸都要费尽力气，而且里面非常热。你几乎担心自己会被烫伤，但你已经进来了，这种强烈的高温感觉令人难以置信。你继续用力往里顶；在最后几英寸，她痛苦又快乐地呻吟和咕哝着，直到你一插到底，整根肉棒都埋在她的屁眼里");
         if(_loc2_ >= 0)
         {
            outputText("和阴道里");
         }
         outputText("。[pg]");
         outputText("就在你准备拔出进行下一次抽插时，你发现她正回头看着你，脸上写满了愤怒和仇恨。好吧，你可不能容忍这种事，对吧？你向前伸出手，一把抓住她的头发，猛地将她的头向后扯。她尖叫一声，紧紧地夹住了你的肉棒");
         if(_loc2_ >= 0)
         {
            outputText("");
         }
         outputText("，用她紧绷的肌肉榨取着你。你邪恶地咧嘴一笑，然后拔出肉棒，直到只剩下龟头埋在她的体内，接着你发出一声愉悦的闷哼，猛地一挺，将肉棒完全插回她的体内。她再次尖叫，这次是痛苦与快感交织的叫声，她的舌头从嘴里伸出，肌肉紧紧地收缩着包裹住你。你拔出，再插进去，然后不断重复。你持续了整整一分钟，猛烈地操着她的屁眼，她开始像个荡妇一样呻吟，一只手揉捏着自己的乳房，另一只手蹂躏着自己的阴蒂。[pg]");
         outputText("[say:哦，对，操我的屁眼！就是这样！]她尖叫着，在高潮到来时紧紧夹住你的肉棒。当她的淫液从阴户喷涌而出，溅落在你的[legs]上时，你将自己完全推入。她那由愤怒转为狂喜的叫声，只会让你的高潮更加美妙。你给了她最后几秒钟的猛烈抽插，然后你咆哮着在她体内爆发，将你的精液深深地射进她的屁眼");
         if(_loc2_ >= 0)
         {
            outputText("和阴道");
         }
         outputText("，用你的精液填满她，直到你被榨干并在她体内软下来。[pg]");
         outputText("你猛地一下把自己从她体内拔了出来；失去了你的支撑，她瘫倒在一侧，当又一波漫长的高潮袭来时，她浑身颤抖着，下意识地用手指抚慰着自己。这景象让你有些兴奋，但你决定把她留在那里，返回营地，当然，走之前你没忘记顺走她的钱袋。");
         get_player().orgasm("Dick");
         var _loc3_:IMap = KFLAGS.flags;
         FlagDict_Impl_.arrayWriteInt(_loc3_,394,FlagDict_Impl_.arrayReadInt(_loc3_,394) + 1);
         var _loc4_:int = 395;
         FlagDict_Impl_.arrayWriteInt(KFLAGS.flags,_loc4_,FlagDict_Impl_.arrayReadInt(KFLAGS.flags,_loc4_) - 1);
         get_helFollower().helAffection(-15);
         if(get_game().get_inCombat())
         {
            get_combat().cleanupAfterCombat();
         }
         else
         {
            doNext(postHelFuckBuddyFollowup);
         }
      }
      
      public function pussyOutOfHelSexAmbush() : void
      {
         clearOutput();
         outputText("你把赫尔从你身上推开，告诉她你现在对做爱不感兴趣。");
         outputText("[pg][say: 什么，]她面无表情地说。[say: 什么！？]");
         outputText("[pg][say: 不跟你做爱，]你回答。");
         outputText("[pg][say: 我。但是。什么。你说过。我们。但是……不管怎样，去你的。]");
         outputText("[pg]你耸了耸肩，回到营地，而赫尔则因欲望而半疯，开始自慰，在你离开时怒视着你的背影。");
         doNext(get_camp().returnToCampUseOneHour);
         get_helFollower().helAffection(-20);
      }
      
      public function postMinoThreesomeDecisionTime() : void
      {
         spriteChooser();
         clearOutput();
         outputText("当她结束这个吻时，她用手肘撑着身体向后靠，对着你微笑，出乎意料地漂亮。这一次，你在遇到她之后并没有感到极度疲惫——在做爱前没有战斗让你筋疲力尽——所以也许现在是采访你这位红发女战士的好时机。[pg]");
         helChatMenu();
      }
      
      public function postHelFuckBuddyFollowup() : void
      {
         spriteChooser();
         if(followerHel())
         {
            get_helFollower().saveContent.lastTimeSex = get_game().time.days;
            get_camp().returnToCampUseOneHour();
            return;
         }
         if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,393) == 0)
         {
            get_camp().returnToCampUseOneHour();
            return;
         }
         clearOutput();
         outputText("大约一个小时后你醒来，仍然依偎在赫尔身边，交织在性爱后的休憩中。你花了几分钟时间沐浴在她存在的温暖中，但你知道你还有任务要处理。你在她的脸颊上轻轻啄了一下，唤醒了她，她很快就将你的举动升级为一个漫长的、舌头交缠的吻。[pg]");
         outputText("你们俩重新穿好衣服，一路上都在互相挑逗和调情——你在她丰满的屁股上轻轻拍了一下，她则娇羞地用尾巴扫过你的大腿——但很快你们就必须分开了。你给了赫尔一个深吻，然后看着她漫步走向平原深处，自己也踏上了回营地的路。");
         doNext(get_camp().returnToCampUseOneHour);
      }
      
      public function nomOnIzzyTitWithSallyMancer() : void
      {
         spriteChooser();
         clearOutput();
         get_images().showImage("helia-isabella-drinkmilk");
         outputText("嗯，这是一个你无法拒绝的提议。当你说你需要喝点东西时，女孩们的脸都明显亮了起来。赫尔挪到一边，让你依偎在伊莎贝拉的腿上，坐在她旁边。当伊莎贝拉把她的乳头递给你时，你已经开始微微流口水了");
         if(get_player().hasCock())
         {
            outputText("，当你握住她柔软、温暖且饱满的乳房时，你的[armor]明显地撑起了一个帐篷，展示着你的兴奋");
         }
         else
         {
            outputText("，当你握住她柔软、温暖且饱满的乳房时，你的乳头因兴奋而变硬");
         }
         outputText("。[pg]");
         outputText("她的乳晕很大，直径约有三英寸，尽管与她那高耸的乳房相比，它们仍然显得很小。她向你展示的四个乳头都已经开始渗出小滴的乳汁，你忍不住用舌头轻舔它们，舔舐着乳汁，让牛娘的脊背一阵颤栗。在她还没来得及恢复之前，你眼角余光看到赫尔的尾巴滑进了伊莎贝拉的裙子里，牛娘发出了一声尖锐、高亢的喘息。[pg]");
         outputText("你没有发表评论，因为她正抓住你们俩的后脑勺，把你们的脸按进她充满乳汁的乳房里，强迫你和赫尔要么喝奶，要么窒息。你张大嘴巴，一口气将四个乳头全部含入口中，第一口吸吮就立刻得到了奶油般美味乳汁的奖励。你必须大口吞咽才能跟上她乳房涌出的巨大流量，无论你吸吮多久，似乎都无法减少她近乎无尽的供应。你成功做到的是让伊莎贝拉仰起头，发出一声狂喜的呻吟，把你的脸更深地按进她漏奶的乳房里。");
         get_player().refillHunger(40);
         outputText("[pg]突然，你像火箭一样冲向地面！伊莎贝拉砰的一声仰面摔倒，发出一声低沉的牛叫，紧接着你和赫尔也摔了下来，赫尔依然带着凶猛的决心死死咬住伊莎贝拉的乳头。气喘吁吁的巨乳盾女喘着粗气说，");
         if(isabellaAccent())
         {
            outputText("[say: 我想要你。我需要你。你们两个都要。就在这里，现在。][pg]");
         }
         else
         {
            outputText("[say: 我想要你。我需要你。你们两个都要。就在这里，现在。][pg]");
         }
         outputText("这终于让赫尔从伊莎贝拉的乳头上移开了。这只火蜥蜴带着坏笑，嘴边还滴着母乳，说道：[say: 噢，三人行。这还差不多！你觉得呢，亲爱的？想不想加入一点女孩间的游戏？][pg]");
         dynStats(DynStat.Lust(40));
         get_player().changeFatigue(-40);
         menu();
         addButtonDisabled(0,"肉棒");
         addButtonDisabled(1,"小穴");
         if(get_player().hasCock() && get_player().hasVagina())
         {
            outputText("你需要决定用哪个性器官来对付这两个火辣的红发女郎。[pg]");
            if(get_player().hasCockThatFits(85))
            {
               addButton(0,"肉棒",stuffIzzyAndSalamanderWithDicks);
            }
            else
            {
               outputText("<b>你太大了，没法用你的男性器官操她们……</b>");
            }
            addButton(1,"小穴",izzySallyThreeSomeVagoozlaz);
         }
         else if(get_player().hasVagina())
         {
            addButton(1,"小穴",izzySallyThreeSomeVagoozlaz);
         }
         else if(get_player().hasCock())
         {
            if(get_player().hasCockThatFits(85))
            {
               addButton(0,"肉棒",stuffIzzyAndSalamanderWithDicks);
            }
            else
            {
               outputText("<b>你太大了，没法用你的男性器官操她们……</b>[pg]");
            }
         }
         else
         {
            outputText("不幸的是，你没什么能贡献的……");
         }
         addButton(2,"离开",noThreesomeSexWithSallyAndIssyLastMinute);
      }
      
      public function noThreesomeSexWithSallyAndIssyLastMinute() : void
      {
         spriteChooser();
         clearOutput();
         outputText("你怀着沉重的心情告诉女孩们你不得不放弃。虽然她们看起来都很失望，但赫尔很快用沙哑的声音低语道：[say: 别担心，你这头大母牛。我会好好照顾你的……][pg]");
         outputText("你轻笑一声，挺着圆滚滚的肚子走回营地");
         if(get_player().balls > 0)
         {
            outputText("，蛋蛋憋得比湖水还蓝");
         }
         outputText("。");
         if(get_game().time.hours < 6)
         {
            doNext(playerMenu);
         }
         else
         {
            doNext(get_camp().returnToCampUseOneHour);
         }
      }
      
      public function nagaCoilsUpHel() : void
      {
         spriteChooser();
         clearOutput();
         get_images().showImage("helia-nagacoil");
         var _loc1_:int = get_player().cockThatFits(85);
         var _loc2_:int = get_player().cockThatFits2(85);
         outputText("你滑行着靠近火蜥蜴，告诉她，是的，你确实需要发泄一下。她听后咧嘴一笑，拉近了你们之间的距离，伸出手抚摸你的蛇身。[say:嗯。性感的尾巴，亲爱的，]她说道，伸出手臂，用她光滑且布满鳞片的双手捏了捏你的[ass]。[say:这么漂亮的尾巴要是不用，那可真是太可惜了，你知道的……]她补充道，还对你眨了眨眼。[pg]");
         outputText("你立刻心领神会，在她脱衣服的时候也脱下了你的[armor]，让你能清楚地看到她光滑的私处和那对又大又软的乳房。看到她赤裸的身体，你的" + get_player().cockDescript(_loc1_) + "迅速从你爬虫类下半身的藏身处滑了出来；她一把抓住它开始套弄，让它完全勃起，而你则将尾巴缠绕在她的脚上。当你用强健的尾巴在她身上缠绕了一整圈，将她的双臂束缚在身体两侧并将她从地上拉起时，她因为腹部突然传来的紧绷感而喘息起来。[pg]");
         outputText("现在你的情人已经完全任你摆布，你向后靠去，将她拉近，让她的胯部对准你的" + get_player().cockDescript(_loc1_));
         if(_loc2_ >= 0)
         {
            outputText("，让她的屁股对准你的" + get_player().cockDescript(_loc2_));
         }
         outputText("。当你开始将她放低，让她坐到你的肉棒上时");
         if(_loc2_ >= 0)
         {
            outputText("");
         }
         outputText("，她喘息着扭动身体，因为无法控制插入的深度而挣扎着。[say:深一点，再深一点，]她恳求着，哀求般地亲吻着你的肩膀和脖子。[say:我需要你插得更深，该死！更深！][pg]");
         outputText("你顺从地将她强压下去，让她的臀部猛烈地撞击你，将你的阳具直没至柄；她快乐地尖叫着，当你插到底，直到再也没有更多的肉棒可以塞进她体内时，她颤抖着。她终于挣扎着抽出了手臂，环抱住你的肩膀，将你拉入一个深吻，将她长长的分叉舌头探入你的口中。[pg]");
         outputText("你作为奖励，将她从你的肉棒上拔出一半");
         if(_loc2_ >= 0)
         {
            outputText("");
         }
         outputText("，然后再次猛地将她按下去。你用尾巴开始让她在你的胯部上下弹跳，粗暴地把她当成一个无助的性玩具。当你猛烈地抽插她时，她尖叫、呻吟、喘息，只有在弹跳到最高点时，你才会放慢速度，抓住她的乳房揉捏。你给她的粗暴抽插带来的纯粹快感，加上你对她挺立的小乳头的熟练攻势，很快就把她推向了高潮。她弓起背尖叫着，在她高潮时乞求你更用力地操她。你尽你所能地满足她，将她猛烈地按在你的肉棒上");
         if(_loc2_ >= 0)
         {
            outputText("");
         }
         outputText("比以往任何时候都用力，直到你害怕会把她的内脏撕裂。[pg]");
         outputText("不过你还没完全尽兴。当她的高潮刚刚平息，你就把她从你的肉棒上拔了出来，用尾巴卷住她倒吊起来。你把她的头降到和你的" + get_player().cockDescript(_loc1_) + "平齐的位置，她毫无遮掩的小穴就这样毫无防备地展现在你面前。不需要你的鼓励，她就把你的肉棒含进嘴里，用双乳夹着它往她那饥渴的小嘴里送。与此同时，你也开始对付她的小穴，用舌头狠狠地操弄着，同时将一根、两根、三根手指滑进她的屁眼。这种双重刺激让她发出了深沉而愉悦的呻吟。[pg]");
         outputText("但随着她继续用乳交伺候你并吸吮你的龟头，你很快就感觉到高潮即将来临。察觉到你即将爆发，她将速度加快到了几乎令人发狂的节奏，但你依然强忍着……直到她将那细长的舌头直接滑进了你的尿道。那不可思议的、直击灵魂的快感让你彻底崩溃；你挺起腰肢，把肉棒狠狠地顶在她的脸上，猛烈地射精，将浓稠的精液射入她等待着的嘴里。她急切地吞咽着你的精液，而你则将越来越多的精液泵入她的嘴里，同时继续用舌头操弄她的小穴，用手指抠挖她的屁眼，直到她再次高潮。她在你尾巴紧紧的束缚中尖叫扭动着，悬在半空中，嘴里还滴落着你的精液。[pg]");
         outputText("经历了");
         if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,393) == 0)
         {
            outputText("战斗和");
         }
         outputText("剧烈高潮的消耗，你精疲力尽地仰面瘫倒，松开了你的火蜥蜴情人。她爬到你身边，在你的[chest]上蹭了蹭，也用自己的尾巴缠住了你。很快，你便沉入平静安详的梦乡。");
         get_player().orgasm("Generic");
         var _loc3_:IMap = KFLAGS.flags;
         FlagDict_Impl_.arrayWriteInt(_loc3_,394,FlagDict_Impl_.arrayReadInt(_loc3_,394) + 1);
         _loc3_ = KFLAGS.flags;
         FlagDict_Impl_.arrayWriteInt(_loc3_,395,FlagDict_Impl_.arrayReadInt(_loc3_,395) + 1);
         get_helFollower().helAffection(5);
         if(get_game().get_inCombat())
         {
            get_combat().cleanupAfterCombat();
         }
         else
         {
            doNext(postHelFuckBuddyFollowup);
         }
      }
      
      public function nagaCoilsUpAnalNaga() : void
      {
         spriteChooser();
         clearOutput();
         get_images().showImage("helia-nagaanal");
         outputText("你滑行着靠近火蜥蜴，告诉她，是的，你确实需要发泄一下。她听后咧嘴一笑，拉近了你们之间的距离，伸出手抚摸你的蛇身。[say:嗯。性感的尾巴，亲爱的，]她说道，伸出手臂，用她光滑且布满鳞片的双手捏了捏你的[ass]。[say:这么漂亮的尾巴要是不用，那可真是太可惜了，你知道的……]她补充道，还对你眨了眨眼。[pg]");
         outputText("你脑海中灵光一闪，迅速脱下你的[armor]，她也照做了。她在你面前双手双膝着地，像个孩子一样，一把抓住了你的尾巴。一拿到手，她就急切地把嘴凑上去，像吸吮鸡巴一样吸吮着你的尾尖。这奇怪的感觉让你浑身一颤，但当她把尾巴翘向你时，你也做出了回应，把她熄灭的尾尖含进嘴里，用口水将其涂满。[pg]");
         outputText("当你们两人的尾巴都得到充分润滑后，火蜥蜴爬到你身后，将她的背紧紧贴着你的背。出乎意料地，她甚至握住了你的手，同时她的尾巴滑入了你的[ass]瓣之间。你也投桃报李，很快将你的尾尖抵住她紧致却放松的屁眼，而她的尾巴也开始滑入你的[asshole]。当那根滚烫、扭动的尾巴鸡巴推入你体内时，你喘息着，每一寸都在努力榨取快感，同时你也把自己的尾巴深深推入她体内，力度之大让她猛吸了一口气，双膝发软。");
         get_player().buttChange(40,true,true,false);
         outputText("[pg]");
         outputText("她继续强行进入你体内，将她越来越粗的尾巴进一步扭动进你的[asshole]，随着尾巴变粗，将你的后穴撑得大大的。不过，最终她无法再进入你体内更多，你也无法再进入她体内更多。[say:准备好来一场狂野的骑乘了吗，亲爱的？]她问道，扭过头在你肩膀上印下一个温柔的吻。你急切地点点头，开始上下弹跳。[pg]");
         outputText("你用尾巴撑起身体，几乎把她的尾巴从你体内拔出，同时她也从你的尾巴上离开。你们俩像娼妇一样喘息呻吟，当你们再次猛地坐下，用滚烫的火蜥蜴后臀填满你的屁股，而她也用你的尾巴填满她的屁股时，这种感觉更是加倍。[say:哦，操，爽！]她尖叫着，紧紧抓住你的手，在你的尾尖上疯狂地扭动，当你继续弹跳时，将你撞入她的屁眼，加快你自己的节奏以跟上你的情人。[pg]");
         outputText("你将自己狠狠地撞向她滚烫的尾巴，拔出直到只剩尾尖，然后再次撞击，一遍又一遍，直到你的屁股因快感和她体内的火焰而燃烧，你的爱人也因即将到来的高潮而尖叫。伴随着最后一声巨大的咆哮，你将自己重重地刺入她的尾巴，将其吞入体内，直到只剩下一小截根部露在外面。你和她一起放声大叫，一阵令人失去理智的高潮如海啸般席卷了你，让你在她的尾巴上扭动挣扎，将你的尾巴深深地插入你的爱人体内，让她忍不住在快感和痛苦中哀嚎。[pg]");
         outputText("当你恢复理智时，你正仰面躺着，气喘吁吁。慢慢地，你的火蜥蜴爱人挣扎着站了起来，但一秒钟后又瘫倒在你身上。她似乎很满足，用鼻子蹭着你的[chest]，抚摸着你的脸颊。你同样筋疲力尽，很快就进入了甜美的梦乡。");
         get_player().orgasm("Anal");
         var _loc1_:IMap = KFLAGS.flags;
         FlagDict_Impl_.arrayWriteInt(_loc1_,394,FlagDict_Impl_.arrayReadInt(_loc1_,394) + 1);
         _loc1_ = KFLAGS.flags;
         FlagDict_Impl_.arrayWriteInt(_loc1_,395,FlagDict_Impl_.arrayReadInt(_loc1_,395) + 1);
         get_helFollower().helAffection(5);
         if(get_game().get_inCombat())
         {
            get_combat().cleanupAfterCombat();
         }
         else
         {
            doNext(postHelFuckBuddyFollowup);
         }
      }
      
      public function mountHel() : void
      {
         spriteChooser();
         var _loc1_:int = get_player().cockThatFits(85);
         if(_loc1_ < 0)
         {
            _loc1_ = get_player().smallestCockIndex();
         }
         clearOutput();
         get_images().showImage("helia-mount");
         outputText("你小跑着来到火蜥蜴面前，正当你想告诉她一些你们可以一起实现的幻想时，她却先说出了自己的想法！[say:哦，玛莱，]她咕噜着，伸出手抚摸你光秃秃的侧腹，[say:我一直想要一匹属于自己的战马。这样吧……你让我骑你，也许我也会让你骑我？][pg]");
         outputText("好吧，这有点出乎意料，不过没关系。自从来到这个世界，你听过比这更奇怪的事情，而且你发现周围有很多人都能欣赏你那威严的马半身。你对她点了点头，还没等你反应过来，火蜥蜴已经翻身骑上了你的背，双臂紧紧抱住你人类的腰，将她那巨大柔软的乳房压在你的背上。[pg]");
         outputText("[say:驾，]她在你耳边沙哑地低语，她那长着鳞片和爪子的脚在你的侧腹轻轻戳了一下。[pg]");
         outputText("你开始小跑，让她环绕在你臀部的手臂引导你在广阔的平原上穿梭。一路上，她不断在你耳边轻声鼓励，偶尔停下来，用她的乳房在你背上诱人地摩擦，或者让她悬垂的尾巴拂过你的" + get_player().cockDescript(_loc1_) + "。不过，最终她将目光锁定在远处山丘上一棵倾斜的孤树上，并指引你向那里走去。[pg]");
         outputText("当你们到达时，她优雅地从你背上滑下，大声笑了起来。[say:哦，太好玩了！非常感谢你，朋友。在遇到你之前，我从未骑过马——半人马——但我想我会习惯的。哦！想象一下，你和我，勇敢的冒险家和她忠诚的战马，像——嘿，我看到你脸上的表情了。别笑，该死！][pg]");
         outputText("你强忍住笑声，温柔地提醒她某项义务。[say:嗯。好吧，公平交易。你让我骑了你，所以……]她说着，摇晃着宽阔结实的臀部，甩着尾巴向你走来。[say:……我让你骑我。]她把脸凑近你，在你的嘴唇上印下一吻，滑入一点她长长的分叉舌头。不久之后，你的[armor]被丢弃在地上，她自己的比基尼也被随意地扔到一边。她跪下来，用两只长满鳞片的手抓住你渐渐变硬的" + get_player().cockDescript(_loc1_) + "，把它套弄得坚挺起来，一边动作一边用舌头快速润滑，直到你的肉棒在你身下变得湿漉漉的。[pg]");
         outputText("赤裸而美丽，曲线优美而肌肉发达，火蜥蜴在你身下转过身，走到树前。她双脚分开，抓住粗壮光滑的树干。她回头看了你一眼，调皮地眨了眨眼。[say:别担心，亲爱的，我比看起来还要强壮。来吧——让我看看你的本事。][pg]");
         outputText("你有点担心会把她弄坏，但这是她要求的。你小跑上前，将前蹄搭在她的肩膀上，将一部分重量压在她身上，你的" + get_player().cockDescript(_loc1_) + "急切地顶着她紧实的臀瓣。在你的重压和肉棒的戳刺下，她喘息着、呻吟着，如此绝望地寻找着一个可以填满的洞。最后，你滑入她的双腿之间，进入了她的阴户，将你整整" + Utils.num2Text(int(get_player().cocks[_loc1_].cockLength)) + "英寸的肉棒猛地插入她滚烫的深处。你因她内壁的极度高温而喘息颤抖，但当你的肉棒将她填满到根部时，你的爱人只能发出狂喜的尖叫。[pg]");
         outputText("[say:来吧，该死！]她回过头厉声说道，因为承受了你半人马的部分重量，她的脸上布满了汗水。[say:操我——像野兽一样操我。]你顺从了，本能接管了一切，你的臀部开始挺动突刺，将你的肉棒在她的体内进进出出。[say:就是这样！对，让我怀孕，让我做你的母马，用马精填满我。别停——别停。天哪，别停——继续操！][pg]");
         outputText("你猛烈地撞击着她，无情而残暴，操得足够用力，甚至能弄断一个人类女孩的臀部。但这个女人——当你像使唤役用野兽一样操她时，她高兴地又哭又笑，你的马半身试图把她当成一匹她非常想成为的母马，像一匹获奖的种马一样让她怀孕。[pg]");
         outputText("你不断地操弄、挺动、突刺，直到火蜥蜴发出一声尖锐的叫声，她那冒着热气的内部肌肉像老虎钳一样紧紧夹住。你闷哼一声，最后一次刺穿她，然后你的" + get_player().cockDescript(_loc1_) + "在里面爆发，用你的半人马精液将她填满到边缘");
         if(get_player().cumQ() >= 500)
         {
            outputText("直到它开始从你的肉棒周围溢出，积聚在她张开的双腿之间");
         }
         outputText("。[pg]");
         outputText("你保持着那个姿势好几分钟，你的" + get_player().cockDescript(_loc1_) + "深深地插在她的体内，她紧紧抓住树干，气喘吁吁，从高潮中缓过神来。最后，她放低了臀部，让你从她身上下来。你只走了几步就瘫倒在侧，筋疲力尽。片刻之后，你感觉到火蜥蜴爱人温暖的身体蜷缩在你的肚子上，双臂紧紧环抱着你的侧腹。[pg]");
         outputText("[say:你确定我不能说服你留下来吗？我是认真的，我需要一匹战马……更何况是一匹能让我感觉像一只被配种的野生动物的战马……]");
         if(get_player().cor < 50)
         {
            outputText("可悲的是，作为勇者的职责让你无法接受她的提议，即使你想。你如实告诉了她，她沉重地叹了口气。");
         }
         else
         {
            outputText("你无法想象在这个世界上有那么多渴望的阴户还空虚着的时候，只对其中一个许下承诺，尽管你用一个更礼貌的借口敷衍了她。");
         }
         outputText("[say:好吧，你还是会回到我身边的，对吧？我可能会想念我的小马驹的。][pg]");
         outputText("你轻笑着向她保证，只要一有空你就会回来。很快，你们俩就在平原上那棵孤零零的树下，进入了心满意足的安稳梦乡。");
         get_player().orgasm("Dick");
         var _loc2_:IMap = KFLAGS.flags;
         FlagDict_Impl_.arrayWriteInt(_loc2_,394,FlagDict_Impl_.arrayReadInt(_loc2_,394) + 1);
         _loc2_ = KFLAGS.flags;
         FlagDict_Impl_.arrayWriteInt(_loc2_,395,FlagDict_Impl_.arrayReadInt(_loc2_,395) + 1);
         get_helFollower().helAffection(5);
         if(get_game().get_inCombat())
         {
            get_combat().cleanupAfterCombat();
         }
         else
         {
            doNext(postHelFuckBuddyFollowup);
         }
      }
      
      public function minosRBadNoFuck2() : void
      {
         clearOutput();
         spriteChooser();
         outputText("[say: 妈的，[name]。我可不想对牛头人的精液上瘾，但是……现在我他妈该怎么办？那些公牛是这附近最棒的床伴了……当然，在场的人除外，]她眨了眨眼补充道。");
         outputText("[pg]你觉得你可以主动提出满足她的需求……或者干脆去他妈的，让她继续随心所欲地操牛头人。");
         menu();
         addButton(0,"没关系",helCanFuckMinosWhenever).hint("你觉得这太麻烦了，不值得，就让她和牛头人以及其他生物做她的“事”吧。");
         addButton(1,"满足她",satisfyHelSoSheStopsMinoFucking).hint("只要她和你在一起，她就不再需要其他任何东西了——不管上不上瘾。");
      }
      
      public function minosRBadNoFuck() : void
      {
         clearOutput();
         spriteChooser();
         outputText("你想知道她是否只是没有意识到牛头人精液的危险，或者她只是不在乎。无论哪种方式，你都不会袖手旁观。");
         outputText("[pg]你走近这对男女，试图把他们分开。他们一开始太沉迷于性爱了，并没有真正关心，但当他们注意到你的干预时，他们开始无意识地反抗，像赶走烦人的昆虫一样把你拍开。[if (strength > 90) {你设法把他们推开，你巨大的力量压倒了这两个野兽|这需要你付出巨大的努力，但你设法把这两个野兽推开了}].[pg]牛头人的阴茎从赫莉娅的阴户中退出，发出一声清晰的“啵”声，他们混合的汁液呈拉丝状涂满了他们的腿和地面。牛头人本能地对你做出反应，准备攻击，但你设法用迅速的一击击中了他已经受伤的腹部，使他失去了行动能力，这只野兽发出一声长长痛苦的呻吟，然后他决定今天不是他的好日子。你转过身，面对赫莉娅。[pg][say: 怎么了，亲爱的？如果你想操我，我们可以晚点再做！如果你想操他，自己去找一个，好吗？]她说道，明显对在性交中途被打断感到恼火。你叹了口气，告诉她你只是帮了她。她的脸扭曲成轻微的困惑。[say: 亲爱的，我操过的牛头人几乎和我打成肉酱的一样多。我从来没有费心去数，但有很多。你怎么可能是在帮我？]");
         outputText("[pg]你告诉她，牛头人的精液是一种成瘾物质，如果时间长了，她就会成为它的奴隶，心智完全被它占据。");
         outputText("[pg][say:嗯？]她回答道，对你挑了挑眉。[say:你说的“上瘾”是什么意思？牛精液怎么可能会让人上瘾；这他妈的有什么道理？]");
         if(!get_player().hasPerk(PerkLib.HistoryAlchemist))
         {
            outputText("[pg]你耸了耸肩，告诉她事实就是如此" + (marbleFollower() ? "，就像牛娘的母乳也会让人上瘾一样" : "") + "。");
         }
         else
         {
            outputText("[pg]如果你要猜的话，你敢打赌这个物种的精液中含有某种腐化产生的激素，原本是为了辅助泌乳牛受精，现在却变成了对所有物种都有效的通用触发器。它还会引起多巴胺和血清素的大量释放，增强受害者的高潮强度，让杏仁核将其与快感联系起来，并随着血清素受体下调以实现体内平衡，从而建立一个成瘾的反馈循环，导致在“注射”几天后出现抑郁，并产生需要更多精液才能恢复到以前“正常”精神状态的感觉。[pg]赫莉娅盯着你。[say: 你他妈的到底回不回答我？][pg]你摇了摇头。嘟囔了一会儿，告诉她事情就是这样。");
         }
         outputText("[pg]她在消化这些信息时微微皱起了眉头。你想知道她打算怎么处理这件事。");
         doNext(minosRBadNoFuck2);
      }
      
      public function loseToSalamander() : void
      {
         var loss:Boolean;
         var _g:HelScene;
         spriteChooser();
         clearOutput();
         if(get_player().get_HP() < 1)
         {
            outputText("你在离昏迷的豺狼人仅几步之遥的地方倒在地上，狂战士的猛攻带来的痛苦和疲惫让你不堪重负。");
         }
         else
         {
            outputText("你的性欲太过强烈，大脑再也无法集中精力思考任何事情，只剩下对释放的绝望渴望。你双腿一软，瘫倒在地");
         }
         if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,396) == 1)
         {
            outputText("，躺在离被击败的豺狼人仅几步之遥的地方。[pg]你抬起头，看到那个火蜥蜴女孩正居高临下地看着你，慢慢脱下她的比基尼，露出丰满的双乳和已经闪烁着润滑液光泽的剃光了毛的小穴。她第一次开口说话了。[say: 好吧！]她咧嘴笑着惊呼，[say: 你的[weapon]用得还不错嘛。妈的，这附近很难找到值得我花时间的人了。]她朝被击败的豺狼人点了点头。[say: ……而且你长得也不赖。你知道吗，打完一架之后，没有什么比好好干一炮更爽的了，对吧？你觉得呢？]你被这个鲁莽的狂战士突然变得平静友好的态度吓了一跳，张开嘴想回答她，但她迅速把长满鳞片的脚跟踩在你的胸口上。你明白了她的意思，闭上了嘴；你在这里没有太多选择，所以还不如好好享受。[pg]");
         }
         else
         {
            outputText("。[pg]你抬起头，看到那个火蜥蜴女孩正居高临下地看着你，慢慢脱下她的比基尼，露出丰满的双乳和闪闪发光的小穴。[say: 你是个值得尊敬的对手，你知道吗？来吧，输了也不丢人，]她说着，伸出一只手拉你起来。你颤抖着握住她的手——她一把将你拉进一个粗暴的吻中。[pg][say: 但是，战利品归胜利者所有，]她说着，把胸部贴向你。好吧，你还不如好好享受一下……");
         }
         var _loc1_:int = 0;
         if(Utils.rand(4) == 0 && get_player().get_gender() > 0)
         {
            menu();
            _g = this;
            loss = true;
            addButton(0,"继续",function():void
            {
               _g.helTailPegging(loss);
            });
            return;
         }
         if(get_player().hasCock() && (get_player().get_gender() == 1 || Utils.rand(4) < 3) && get_player().hasCockThatFits(85))
         {
            _loc1_ = get_player().cockThatFits(85);
            outputText("火蜥蜴动作娴熟地脱下你的[armor]，");
            if(get_player().get_gender() == 3)
            {
               outputText("露出你的" + get_player().vaginaDescript(0) + "和");
            }
            outputText("让你那早已坚挺、蓄势待发的" + get_player().cockDescript(_loc1_) + "弹了出来。她跪下来跨坐在你身上，用两只布满光滑鳞片、长着利爪的手紧紧握住你的" + get_player().cockDescript(_loc1_) + "。你一时有些紧张，目光闪烁地看着她那长而锋利的指甲。看到你眼中的担忧，她友善地笑了起来。[say:嘿，别担心，亲爱的。我可不会毁了这么好的一根肉棒……至少，在尝过味道之前不会……]她咧嘴笑着说。为了强调，她俯下身，用她那长长的分叉舌头缓慢而性感地舔舐着你的" + get_player().cockDescript(_loc1_) + "。[pg]");
            outputText("尝到肉棒的味道，她发出充满情欲的呻吟，开始用一只手套弄你的[cock]，另一只手游移到她沉甸甸的乳房上开始抚摸，先是抓揉了一会儿其中一只，然后又伸手去拧另一只的乳头，用力之大让她自己都疼得皱起了眉头。她就这样表演了一两分钟，配合着自己的自慰节奏套弄着你的肉棒。你硬得不能再硬了，当你终于能把目光从她那诱人的双乳上移开时，你能看到有水珠顺着她的大腿流下，这表明她也为你做好了准备。[pg]");
            outputText("[say:准备好迎接天底下最棒的性爱了吗？]她傲慢地问，将她的小穴对准你的龟头。然而，在她坐下来之前，她迅速抓住你的双手，把它们放在她的乳房上。她重重地压在你的手上，同时沉下身子，吞没了你的龟头。她那湿滑的穴肉里感觉像着了火一样，燃烧着对你的渴望和她本命元素的火焰。你敏感的肉棒周围突然爆发出的热量让你倒吸一口凉气，勉强才压抑住想要射精的冲动。[pg]");
            outputText("[say:哦，你喜欢这热度，是吧？这让你很爽吗？那，尝尝这个怎么样！]她大笑着，突然将你猛地塞进她体内，一直吞没到你的肉棒根部。你高兴地喘息着，大脑被肉棒周围燃烧感带来的一半痛苦、一半快感麻痹了。你张着嘴，看到有机会，你那火热的情人把她燃烧的尾巴甩了过来。当她把尾巴尖射进你嘴里时，你吓得差点尖叫起来，生怕把舌头烧掉，但那里的火焰似乎已经冷却到了可以承受的温度。[say:继续啊，]她坐在你的肉棒上一动不动，扭动着尾巴怂恿道。[say:吸它！][pg]");
            outputText("为了让她继续套弄你的肉棒，你开始像吸吮她自己的肉棒一样吸吮她的尾巴，舔舐着下面，轻咬着柔软、有弹性的鳞片。她满意地开始在你的" + get_player().cockDescript(_loc1_) + "上抬起身子，让它尝到平原上仁慈而凉爽的空气——然后再次猛地坐下，将你吞没在她灼热的温度中。你们俩就这样持续了一段时间，你忙着揉捏她的乳房、吸吮她的尾巴，而她则操着你的" + get_player().cockDescript(_loc1_) + "，冷空气和灼热深处之间的强烈反差让你的大脑兴奋不已。[pg]");
            outputText("终于，你再也受不了了。你感觉到胯下不断增加的压力，预示着即将到来的高潮。你紧紧抓住她柔软的乳房，最后用力吸了一口她的尾巴尖，同时将一股精液射进她的深处");
            if(get_player().get_gender() == 3)
            {
               outputText("你的小穴也开始将淫液喷在她长满鳞片的大腿上");
            }
            outputText("。她因这感觉而喘息，抓住你的臀部，因为又有一股精液射进了她体内。她喘着粗气，给了你最后一次猛烈的冲刺，自己也高潮了，在体内紧紧夹住你的" + get_player().cockDescript(_loc1_) + "，发出了如同向天际呐喊的战吼般狂野的尖叫。");
            outputText("她瘫倒在你身上，大口喘着粗气。[say:那。太。棒。了，]她笑着，伸手捏了一下你的乳头，然后把头埋在你身上。你的肉棒开始在她体内疲软，精液顺着你的肉棒流了出来，但她似乎并不打算马上离开，你不得不承认，她紧贴着你的温暖感觉非常棒。火蜥蜴最后对你咧嘴一笑，把尾巴从你唇边抽走。片刻之后，她把它像枕头一样滑到你头下，闭上眼睛，筋疲力尽。很快，你也进入了甜美的梦乡。[pg]");
         }
         else if(get_player().hasVagina())
         {
            outputText("[say:嗯，我一直很喜欢和另一个女人翻云覆雨，]火蜥蜴承认道，脱下你盔甲的速度快得让你不禁觉得她经验丰富。");
            if(get_player().get_gender() == 3)
            {
               outputText("[say:虽然不完全是个女人，对吧？]她笑着，在你的" + get_player().cockDescript(_loc1_) + "上快速撸动了一下。");
            }
            outputText("她向前迈了一步，跪在你的肩膀上，把你的手臂按在地上，把她的小穴推向你的脸。[say:我更喜欢占据主动！现在舔吧，我或许也会让你爽一爽。][pg]");
            outputText("你顺从地把脸凑到她双腿之间，试探性地舔了一下她那流着淫水的小穴阴唇。你突然退缩了，感觉舌头像是着了火一样。似乎是为了安抚你，火蜥蜴做出了一个一反常态的温柔手势，用她长满鳞片的手指穿过你的[hair]，她锋利的爪子只是刚好拂过你的头皮。[say:来吧，来吧，]她坚持着，把你的脸重新推向她。你做好了再次被烫伤的准备，但当你再次舔她时，你发现她的阴唇第二次变凉了。没有再犹豫，你开始你的服侍，用克制的技巧探索她那欢迎你的小穴。她舒服地喘息着，再次鼓励地抚摸你的头，同时她的另一只手落到你的[chest]上，开始玩弄你的乳头。[pg]");
            outputText("几分钟后，你那火热的情人开始随着你的舔舐、亲吻和轻咬而挺动臀部。她的呼吸现在变得更加急促，她的双手都放在了你的乳房上，粗暴地揉捏着你的乳头，作为对你服务的奖励。你能感觉到她的高潮正在酝酿，于是加倍努力，让她越来越接近高潮……[pg]");
            outputText("[say: 哦，见鬼，不行！]她厉声说道，抓住你的额头，把你的头按在草地上。[say: 你别想这么容易就完事……我答应过也会让你爽的，亲爱的。]她那灵活的尾巴在她的肩膀上方甩入视线，曾经覆盖在上面的火焰神秘地消失了。她对你咧嘴一笑，一个利落的动作，将尾巴尖含进嘴里。当她松开时，尾巴尖闪烁着湿润的光泽。然后它就从视线中消失了。[pg]");
            outputText("你突然感觉到你的" + get_player().vaginaDescript(0) + "的阴唇被什么东西挠了一下。当她的尾巴滑过你的阴蒂时，你因那快感的火花而喘息，然后它开始扭动着穿过你小穴的阴唇。你的情人低头对你微笑着，托起她自己的乳房，让你腾出手来继续你的服侍。每舔几下，你就会被迫停下来喘息或颤抖，因为她的尾巴在你的" + get_player().vaginaDescript(0) + "里蠕动，像一根肉棒和一根熟练的手指一样同时操着你，不是进进出出地抽插，而是像触手一样在你深处扭动。");
            get_player().cuntChange(20,true,true,false);
            outputText("[pg]");
            outputText("然而，天下没有不散的筵席，很快火蜥蜴滚烫的小穴就在她高潮时收缩着夹紧了你的舌头，把淫水喷得你满脸满脖子都是。你给了她最后一次狠狠的舌交，加快速度，让她达到了尖叫、颤抖的高潮。她高潮的力量带来了一个受欢迎的副作用，她的尾巴开始在你体内疯狂地抽打，猛击着你的小穴，让你也达到了一个巨大的、令人大脑麻木的高潮");
            if(get_player().hasCock())
            {
               outputText("，你的肉棒射出一大股浓精，喷在她的脸上，同时你的小穴也在尾巴的抽插下迎来了高潮");
            }
            outputText("。[pg]");
            outputText("在你的思绪平复之前，你的新朋友已经瘫倒在你身上，脸颊靠在你的[chest]上。她的呼吸和你一样急促，眼皮似乎突然变得沉重起来。她微笑着，慢慢地将沾满淫液的尾巴从你的" + get_player().vaginaDescript(0) + "中抽出，像枕头一样垫在你的头下，柔软而温暖，虽然有点湿润。看她似乎不打算去任何地方，你也闭上眼睛，沉沉地睡去。");
         }
         else
         {
            if(get_player().get_gender() == 0)
            {
               outputText("[say: 嗯，让我看看这是什么，]火蜥蜴说着，一把扯下你的[armor]，露出你无性别的下体。[say: 哎呀，这可真是……与众不同。好吧，算你倒霉，我想……]她声音渐弱，走上前来，把她的小穴推到你脸上。[say: 现在舔吧，也许我能想出个办法让你也爽一爽。][pg]");
            }
            else if(get_player().hasCock())
            {
               outputText("[say: 妈的。真让人印象深刻，但连我都受不了那个。不过也许我还能用……其他方法让你爽，]她眨了眨眼说道。[pg]");
            }
            else
            {
               outputText("[say: 妈的。真让人印象深刻，但连我都受不了那个。不过也许我还能用……其他方法让你爽，]她眨了眨眼说道。[pg]");
            }
            outputText("你顺从地把脸凑到她双腿之间，试探性地舔了舔她流着淫液的阴唇。你突然缩了回来，感觉舌头像是着了火。似乎是为了安抚你，火蜥蜴做出了一个一反常态的温柔动作，用她长满鳞片的手指穿过你的[hair]，锋利的爪子仅仅是轻轻拂过你的头皮。[say: 来吧，来吧，]她坚持着，把你的脸再次推向她。你做好了再次被烫伤的准备，但当你再次舔她时，你发现她的阴唇第二次变凉了。没有进一步的犹豫，你开始你的口交服务，用娴熟的技巧探索她那欢迎你的小穴。她舒服得喘着粗气，再次鼓励地抚摸着你的头，同时她的另一只手托起她的乳房，开始玩弄她的乳头。[pg]");
            outputText("几分钟后，你那火热的情人开始随着你的舔舐、亲吻和轻咬而挺动臀部。她的呼吸现在变得更加急促，她的双手都放在了你的乳房上，粗暴地揉捏着你的乳头，作为对你服务的奖励。你能感觉到她的高潮正在酝酿，于是加倍努力，让她越来越接近高潮……[pg]");
            outputText("[say: 哦，见鬼，不行！]她厉声说道，抓住你的额头，把你的头按在草地上。[say: 你别想这么容易就完事……我答应过也会让你爽的，亲爱的。]她那灵活的尾巴在她的肩膀上方甩入视线，曾经覆盖在上面的火焰神秘地消失了。她对你咧嘴一笑，一个利落的动作，将尾巴尖含进嘴里。当她松开时，尾巴尖闪烁着湿润的光泽。然后它就从视线中消失了。[pg]");
            outputText("当你感觉到你的" + get_player().assholeDescript() + "边缘突然受到压力时，你倒吸了一口凉气。你睁大了眼睛，但你那火热的情人只是微笑着，增加了对你后庭的压力，直到你强迫自己放松，让她的尾巴尖进入你的屁股。每舔几下，你就会被迫停下来喘息或颤抖，因为她的尾巴在你的[asshole]里蠕动，像一根肉棒和一根熟练的手指一样同时操你，不是进出抽插，而是像触手一样在你的深处扭动。");
            get_player().orgasm("Anal");
            get_player().buttChange(20,true,true,false);
            outputText("[pg]");
            outputText("然而，天下没有不散的筵席，很快，火蜥蜴火热的小穴在射精时收缩，紧紧夹住你的舌头，将淫液喷了你一脸一脖子。你给了她最后一次狠狠的舌交，加快了速度，让她在尖叫和颤抖中达到了高潮。她高潮的力量带来了一个受欢迎的副作用，她的尾巴开始在你体内疯狂地抽打，猛击你的屁股，让你也达到了一个巨大的、令人大脑一片空白的高潮。[pg]");
            outputText("在你的思绪平复之前，你的新朋友已经瘫倒在你身上，脸颊靠在你的[chest]上。她的呼吸和你一样急促，眼皮似乎突然变得沉重起来。她微笑着，慢慢地将尾巴从你的[asshole]中抽出，像枕头一样垫在你的头下，柔软而温暖，虽然有点湿润。看她似乎不打算去任何地方，你也闭上眼睛，沉沉地睡去。");
         }
         if(get_player().hasCock())
         {
            get_player().orgasm("Dick");
         }
         else
         {
            get_player().orgasm("VaginalAnal");
         }
         dynStats(DynStat.Sens(1));
         var _loc2_:IMap = KFLAGS.flags;
         FlagDict_Impl_.arrayWriteInt(_loc2_,394,FlagDict_Impl_.arrayReadInt(_loc2_,394) + 1);
         _loc2_ = KFLAGS.flags;
         FlagDict_Impl_.arrayWriteInt(_loc2_,395,FlagDict_Impl_.arrayReadInt(_loc2_,395) + 1);
         get_helFollower().helAffection(5);
         get_combat().cleanupAfterCombat();
      }
      
      public function leaveMinotaurHelThreesome() : void
      {
         spriteChooser();
         clearOutput();
         outputText("你带着自嘲的微笑摇了摇头，转身离开，让她继续享受她的乐趣。");
         FlagDict_Impl_.arrayWriteInt(KFLAGS.flags,395,0);
         doNext(get_camp().returnToCampUseOneHour);
      }
      
      public function leaveIsabellaSallyBehind() : void
      {
         spriteChooser();
         clearOutput();
         outputText("你婉拒了牛娘的提议，但告诉这两个红发女孩没有你也要玩得开心。虽然有些失望，但当你转身走回营地时，她们还是向你挥了挥手。");
         if(get_game().time.hours < 6)
         {
            doNext(playerMenu);
         }
         else
         {
            doNext(get_camp().returnToCampUseOneHour);
         }
      }
      
      public function leaveHelAfterMinoThreeSomeChat() : void
      {
         spriteChooser();
         clearOutput();
         outputText("遗憾的是，你知道自己还有事情要处理，于是你站起身清理你的[armor]，并给了你的火蜥蜴恋人一个快速的告别吻。然而，正当你准备返回营地时，你感觉到她强壮的手臂环绕在你的腰间，将你锁定在原地，她那长长的爬行动物舌头伸出来挑逗你的耳朵。[pg]");
         outputText("[say: 我们很快会再见的，我的爱人，]她低语着，在你的脖子上印下一个吻。[pg]");
         outputText("你告诉她一定会的，然后动身返回营地。");
         dynStats(DynStat.Lust(2));
         doNext(get_camp().returnToCampUseOneHour);
      }
      
      public function izzySallyThreeSomeVagoozlaz() : void
      {
         spriteChooser();
         clearOutput();
         get_images().showImage("helia-isabella-threesome-vagoo");
         outputText("你迅速脱下你的[armor]，看到两个丰满的红发女郎拥抱在一起互相爱抚着等你，你已经湿透了。当你终于摆脱了碍事的布料，你跪倒在地，将自己插入女孩们中间。经过几句深思熟虑的指导，你让你们三个摆成了一个类似三角形的姿势，你的头埋在赫尔的大腿间，伊莎贝拉的舌头则在爱抚你的[vagina]。[pg]");
         outputText("当牛娘那宽得异乎寻常的舌头拖过你湿透的穴口，试探性地舔舐时，你忍不住浑身一颤。在你的对面，你看到赫尔将两根手指滑入伊莎贝拉的小穴，惹得她发出一声喘息般的哞叫。当伊莎贝拉又给了你一个漫长而缓慢的舔舐时，你决定开始对付火蜥蜴的私处。你分开她的双腿，将她的尾巴推向后方，露出了她那肉欲通道的巨大裂口。[pg]");
         outputText("你把脸埋进她的胯部，将舌头滑入她的体内，火蜥蜴内壁强烈的热度让你微微皱眉。你将舌头滑入她体内，在她那火热、天鹅绒般的通道里快速舔弄，尽可能与伊莎贝拉的动作保持同步。你找到了自己的节奏，伊莎贝拉用她巨大的牛舌每让你喘息和因快感而颤抖一次，你就在赫尔的肉洞里舔弄和吸吮两次。[pg]");
         if(get_player().hasCock())
         {
            outputText("当你继续舔弄赫尔时，你突然感觉到肚子上有一阵爬行的感觉。你惊恐地低下头，看到她那披着鳞甲的尾巴正蜿蜒着爬过你的身体。它紧紧地缠绕住[onecock]，虽然它拒绝移动。你呻吟着，试图挺起臀部迎合她盘绕的尾巴，但伊莎贝拉紧紧抓住你的[hips]，让你连一英寸都动弹不得。你沮丧地试图用某种方式取悦你被紧紧束缚的肉棒，但甚至无法用手握住它。你放弃了，回到舔弄赫尔小穴的工作上，立刻得到了肉棒被用力撸动作为奖励。现在你明白了！你开始加倍努力地舔弄火蜥蜴，每舔一下，她就撸动一下。[pg]");
         }
         outputText("与此同时，伊莎贝拉已经完全将自己埋在你的腹股沟里。你早就知道她的舌头凭借其大小和形状赋予了她极强的口交能力，但她运用舌头的技巧更是让你发狂。她的动作很慢，但这只会让她牛舌每一次漫长而甜美的舔弄变得更加美妙，在舔舐的间隙挑逗着你。仁慈的是，她将两根手指滑入你的[vagina]，在舌头抽插的间隙，将它们探入你现在已经湿透的穴中。[pg]");
         outputText("牛娘的手指和舌头交替操弄的结合");
         if(get_player().hasCock())
         {
            outputText("以及赫尔套弄着你的[cock]");
         }
         outputText("正迅速将你逼向极限。你开始尽可能用力且快速地用舌头操弄这只火蜥蜴，将尽可能多的手指滑入她饥渴的小穴，甚至把拇指塞进她紧致的小屁眼，想尽一切办法让她在你高潮的同时也达到高潮。[pg]");
         outputText("这招非常管用：伴随着一声尖叫，赫尔紧紧夹住你入侵的手指和舌头，随着高潮的降临，她的阴道肌肉开始痉挛收缩。你能听到伊莎贝拉在你身后开始狂喜地哞哞叫，令人极度愉悦的震动顺着你的[vagina]传遍全身。你放任自己，沉浸在高潮的极乐中，随着牛娘");
         if(get_player().hasCock())
         {
            outputText("和火蜥蜴的双重夹击");
         }
         outputText("将你送上顶峰。你在高潮时对着赫尔的小穴尖叫，引发了她自己高潮的顶峰，而伊莎贝拉则在赫尔拳交她的母牛小穴时狂喜地尖叫，直到她也猛烈地高潮。当赫尔的淫液喷射到你的脸上，用她的汁液覆盖你时，你向后退缩，你看到她和伊莎贝拉也发生了同样的事情，因为你的[vagina]释放了积蓄的淫液，溅了牛娘一身。[pg]");
         outputText("现在，女孩们浑身被汗水和淫液浸透，瘫倒在你的周围。伊莎贝拉满足地叹了口气，翻过身，把头依偎在你的胸前；片刻之后，赫尔也做了同样的动作");
         if(get_player().hasCock())
         {
            outputText("，用她温暖的尾巴充满爱意地缠绕着你的[cock]");
         }
         outputText("。[pg]");
         outputText("[say: 太棒了。说真的，]火蜥蜴说道，仍然因为刚才的经历而喘息着。[say: 我的意思是，天哪，你们两个。我们……我们真的需要多做几次。][pg]");
         if(isabellaAccent())
         {
            outputText("[say: 嗯，是的，]伊莎贝拉打了个长长的哈欠说道。[say: 我们确实应该。但现在，我们必须休息了。][pg]");
         }
         else
         {
            outputText("[say: 嗯，是的，]伊莎贝拉打了个长长的哈欠说道。[say: 我们确实必须如此。但现在，我们必须休息了。][pg]");
         }
         outputText("[say: 是啊。休息……休息很好，]赫尔说道，她试图忍住自己的哈欠，但失败了。你微笑着，双臂环抱住你那两位美丽、丰满的红发女郎，让睡意将你淹没。");
         get_player().orgasm("Vaginal");
         dynStats(DynStat.Sens(-3));
         get_helFollower().saveContent.lastTimeSex = get_game().time.days;
         get_isabellaFollowerScene().isabellaAffection(4);
         get_helFollower().helAffection(5);
         if(get_game().time.hours < 6)
         {
            doNext(playerMenu);
         }
         else
         {
            doNext(get_camp().returnToCampUseFourHours);
         }
      }
      
      public function izzySallyThreeSomeFollowup() : void
      {
         spriteChooser();
         clearOutput();
         outputText("现在，女孩们浑身沾满了汗水和精液，仰面倒在你的身边。伊莎贝拉满足地叹了口气，翻过身来，把头靠在你的胸膛上蹭了蹭；片刻之后，赫尔也做了同样的动作，用她温暖的尾巴充满爱意地缠住你的[cock]。[pg]");
         outputText("[say: 太棒了。说真的，]火蜥蜴说道，仍然因为刚才的经历而喘息着。[say: 我的意思是，天哪，你们两个。我们……我们真的需要多来几次。][pg]");
         if(isabellaAccent())
         {
            outputText("[say: 嗯，是的，]伊莎贝拉打了个长长的哈欠说道。[say: 我们确实应该。但现在，我们必须休息了。][pg]");
         }
         else
         {
            outputText("[say: 嗯，是的，]伊莎贝拉打了个长长的哈欠说道。[say: 我们确实必须如此。但现在，我们必须休息了。][pg]");
         }
         outputText("[say: 是啊。休息……休息很好，]赫尔说道，她试图忍住自己的哈欠，但失败了。你微笑着，双臂环抱住你那两位美丽、丰满的红发女郎，让睡意将你淹没。");
         if(get_game().time.hours < 6)
         {
            doNext(playerMenu);
         }
         else
         {
            doNext(get_camp().returnToCampUseFourHours);
         }
      }
      
      public function isabellaXHelThreeSomePlainsStart() : void
      {
         spriteChooser();
         clearOutput();
         get_images().showImage("helia-isabella-milkoffer");
         outputText("在草原上漫步时，平原上相对的寂静突然被远处一声高亢、沙哑的牛叫声打破。你顿时担心伊莎贝拉和赫尔是不是又要互相撕破喉咙了，于是开始朝着那越来越响的“哞哞哞哞哞”声跑去。[pg]");
         outputText("你冲出草丛，闯入伊莎贝拉的营地，震惊地看到赫尔正坐在牛娘的腿上，双手放在伊莎贝拉丰满的乳房上，嘴里还含着她的一个乳头。看到你走近，伊莎贝拉从赫尔的臀部抬起一只手，有些不好意思地向你挥了挥手。[pg]");
         outputText("[say: [name]……很高兴——哞——见到你！] 随着赫尔继续吸吮她巨大的乳房，她的声音渐渐变成了一声长长而狂喜的呻吟。赫尔只是摇了摇尾巴，向你眨了眨眼，算是打过招呼了。[say: 也许你也想来一杯，不是吗？] 伊莎贝拉提议道，拍了拍赫尔没有在吸吮的那个巧克力色的乳房。[pg]");
         outputText("你确实感到口渴，而伊莎贝拉的邀请也确实……很诱人，而且因为能和这位丰满的火蜥蜴共进晚餐，这邀请变得更加令人兴奋。");
         menu();
         addButton(0,"喝奶",nomOnIzzyTitWithSallyMancer);
         addButton(1,"离开",leaveIsabellaSallyBehind);
      }
      
      public function isabellaXHelThreeSomeCampStart() : void
      {
         spriteChooser();
         outputText("[pg]<b>夜里发生了一些奇怪的事情……</b>[pg]");
         outputText("当你准备就寝时，你注意到伊莎贝拉走出了营地。出于对这位丰满牛娘安全的些许担忧，你动身前往营地边缘。没过多久你就找到了她，这多亏了营地附近灌木丛中传来的一阵轻柔、低沉的哞哞声。[pg]");
         outputText("你拨开灌木丛，发现牛娘坐在地上，一只手正抚摸着火蜥蜴赫尔的头发。赫尔此刻正坐在牛娘的腿上，双手放在伊莎贝拉丰满的乳房上，嘴里还含着她的四乳头之一。看到你走近，伊莎贝拉把手从赫尔头上移开，有些不好意思地向你挥了挥手。[pg]");
         outputText("[say: [name]……很高兴——哞——见到你！] 随着赫尔继续吸吮她巨大的乳头，她的声音渐渐变成了一声长长、狂喜的呻吟。赫尔只是稍微摇了摇尾巴，眨了眨眼，算是对你的回应。");
         if(isabellaAccent())
         {
            outputText("[say: 也许你也想来点喝的，不是吗？] 伊莎贝拉提议道，拍了拍赫尔没有在吸吮的那个巧克力色的乳房。[pg]");
         }
         else
         {
            outputText("[say: 也许你也想来点喝的，不是吗？] 伊莎贝拉提议道，拍了拍赫尔没有在吸吮的那个巧克力色的乳房。[pg]");
         }
         outputText("你确实感到口渴，而伊莎贝拉的邀请也确实……很诱人，而且因为能和这位丰满的火蜥蜴共进晚餐，这邀请变得更加令人兴奋。");
         menu();
         addButton(0,"喝奶",nomOnIzzyTitWithSallyMancer);
         addButton(1,"离开",playerMenu);
      }
      
      public function heliasFoxyFourSomeFluffs() : void
      {
         clearOutput();
         spriteChooser();
         outputText("当赫尔从酒保那里拿房间钥匙时，你把手伸进舞宽松的束腰外衣里，轻轻捏了捏她柔软的D罩杯。你搂住性感的双性狐狸兽人们，挽着她们的手臂，跟着赫尔上楼来到私人房间，一路上欣赏着这只火蜥蜴几乎衣不蔽体的屁股随着每一步微微摇晃的独特风景。[pg]");
         outputText("你们四人溜进今晚的房间，房间不大，但有一张宽大柔软的床。狐狸双胞胎迫不及待地脱下衣服，露出她们丰满的D罩杯、8英寸长的红色肉棒，以及闪闪发光、松弛的小穴。赫尔把她的鳞片比基尼扔到一边，让她那沉甸甸的E罩杯自由弹跳，并用手臂搂住双胞胎柔软的棕褐色肩膀，让这三具赤裸的身体一起展现在你面前。[pg]");
         outputText("[say: 那么你想用哪些部位呢？]她看着你混合的性征问道。");
         menu();
         if(get_player().hasCock())
         {
            addButton(0,"作为男性",foxyFluffsFoursomeAsMale);
         }
         else
         {
            addButtonDisabled(0,"作为男性");
         }
         if(get_player().hasVagina())
         {
            addButton(1,"作为女性",foxyFluffGirlsFuckSex);
         }
         else
         {
            addButtonDisabled(1,"作为女性");
         }
      }
      
      public function heliaSparIntensity() : int
      {
         var _loc1_:int = 0;
         _loc1_ += int(Math.floor(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,966) / 5));
         _loc1_ += FlagDict_Impl_.arrayReadInt(KFLAGS.flags,2302);
         if(_loc1_ > 100)
         {
            _loc1_ = 100;
         }
         return _loc1_;
      }
      
      public function heliaPlusFoxyFluffs() : void
      {
         spriteChooser();
         clearOutput();
         get_images().showImage("helia-fox-foursome-intro");
         if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,417) == 0)
         {
            FlagDict_Impl_.arrayWriteInt(KFLAGS.flags,417,1);
            outputText("你向赫尔眨了眨眼，让她把你介绍给她的狐狸朋友们。她吹了声响亮的口哨，向女孩们挥手示意她们回来。两个狐狸女孩像小女孩一样咯咯笑着，端着满满的酒杯，带着色眯眯的笑容漫步回来。赫尔往后挪了挪，让其中一个醉醺醺地坐到她的腿上，而另一个则爬到你身上，她那沉甸甸的乳房紧贴着你的胸膛，而且……嘿，等一下！你低头看着那根顶在你肚子上的、虽然不大但坚硬如铁的肉棒，它那小小的肉结已经微微膨胀了。看来这对双性人双胞胎已经准备好大干一场了。[pg]");
            outputText("当你注意到这对姐妹的额外器官时，赫尔咧嘴笑了。[say: 米可，舞，这位是[name]，]她说着，用她那长满鳞片的手抚摸着……米可的？……大腿，引得狐狸女孩发出一声性感的呻吟。作为回应，舞把脸埋进你的脖子里，她丰满的嘴唇拂过你敏感的肌肤。她轻柔的抚摸让你的皮肤因愉悦而刺痛，同时她那坚硬的肉棒进一步压进你的肚子，在你的[armor]上留下了一小块湿润的污渍。[pg]");
            outputText("[say: 嗯，想和姐姐还有我一起玩吗？]舞大口喝了一口啤酒后，一边蹭着你的脖子一边发出呼噜声。赫尔和米可都用充满希望和期待的眼神看着你。你要吗？[pg]");
            menu();
            addButton(0,"四人行",heliasFoxyFourSomeFluffs);
            addButton(14,"离开",runAwayFromFoxGirls);
         }
         else
         {
            outputText("你吹了一声响亮的口哨，把米可和舞从吧台那边叫了回来。两只双性狐狸兽人咧嘴笑着，滑进你和赫尔所在的卡座。舞诱惑地爬到你的腿上，给了你一个带着酒气的吻，任由她那根小巧的狐狸肉棒顶在你的肚子上。[pg]");
            outputText("赫尔被逗乐了，她调皮地摸了一把米可丰满的胸部，说道：[say: 哎呀呀，[name]，想来一场狐狸四人行吗？嗯，我想这可以安排，你们说呢，女孩们？]");
            doNext(heliasFoxyFourSomeFluffs);
         }
      }
      
      public function helVaginaTaur69() : void
      {
         spriteChooser();
         clearOutput();
         outputText("你小跑着来到火蜥蜴面前，正当你想告诉她几个你们可以一起实现的幻想时，她却先说出了自己的想法！[say: 噢，玛莱，]她发出咕噜声，伸出手抚摸你光洁的侧腹，[say: 我一直想要一匹属于自己的战马。这样吧——让我骑你，我会给你一些非常特别的东西……][pg]");
         outputText("好吧，这有些出乎意料，但是……自从来到这个世界，你听过比这奇怪得多的事情，而且说实话，你周围也没多少人能欣赏你这威严的马半身。你对她点了点头，还没等你反应过来，火蜥蜴已经翻身骑到了你的背上，双臂紧紧环抱住你人类的腰部，将她那对硕大柔软的乳房压在你的背上。[say: 驾，]她用沙哑的声音在你耳边低语，长满鳞片和利爪的双脚轻轻踢了踢你的侧腹。[pg]");
         outputText("你开始小跑，任由放在你马肩隆上的双手引导你在广阔的平原上四处奔跑。一路上，她不断在你耳边轻声鼓励，偶尔停下来用奶子在你的背上诱人地摩擦，让她垂下的尾巴拂过你的" + get_player().vaginaDescript(0) + "和[ass]。不过，她最终看中了一片特别高大的青草地，草几乎长到了你的耳朵那么高。你刚一到达，她就优雅地从你背上滑下来，放声大笑。[say: 噢，太好玩了。谢谢你，朋友。在遇到你之前，我从来没骑过马——半人马——但我想我会习惯的。噢！想象一下，你和我，勇敢的冒险家和她忠诚的战马，像这样冲入战场——嘿，我看到你脸上的表情了。别笑，该死！][pg]");
         outputText("你强忍住笑意，温柔地提醒她还有某项义务没有履行。[say: 嗯。好吧，你让我骑了你，所以我想这很公平，]她说着，摇曳着宽阔结实的臀部，甩着尾巴向你走来。[say: ……前提是我得好好照顾我忠诚的坐骑。]她把你的脸拉近，在你的嘴唇上印下一吻，顺势滑入了一点她那长长的分叉舌头。她结束了亲吻，很快就把你的[armor]扔到了地上，她自己的比基尼也被随意地丢在一旁，然后退后了一步；你还没来得及向她伸出手，她就已经消失在高高的草丛中了！[pg]");
         outputText("当她抱着一捆打结的粗草绳回来时，你开始觉得自己被耍了。她用另一个吻堵住了你的抗议，然后滑回你的马半身，将两条编织的草绳甩过你的背部并系紧，在你的身下做成了一个类似挽具的东西。当火蜥蜴滑入挽具时，你惊讶地叫出声来，她让你支撑着她的全部重量，同时她在你身下移动并调整到一个舒适的位置。低头看去，你几乎看不到她——她与你反向躺着，她的腿从你手臂附近的吊带里伸出来，她的肩膀靠在你的后腿之间。[pg]");
         outputText("过了一会儿，她安顿下来，一动不动。你只能感觉到她呼出的热气喷在你的腹部，以及她压在你背上的重量。然而没过多久，火蜥蜴伸出一只长着爪子、布满鳞片的手，用一根手指顺着你敏感的大腿内侧向上划过，让你因期待而颤抖。最终，它蜿蜒向上，来到你湿润、等待着的" + get_player().vaginaDescript(0) + "，用指关节拂过你焦急的阴唇。[pg]");
         outputText("你几乎没有准备好迎接接下来发生的事情。毫无预兆地，火蜥蜴将她的手臂猛地插入你的小穴，重重地捣进你的子宫颈。");
         get_player().cuntChange(50,true,true,false);
         outputText("你尖叫着尥蹶子，差点把她从挽具上甩下来。她疯狂地笑着，强行将更多的手臂塞进你毫无防备的深处，直到她的手肘都埋进了半人马的小穴里。你喘息着、挣扎着、嘶鸣着，但任何试图将她的手臂从你的" + get_player().vaginaDescript(0) + "中拔出的举动，只会给她充足的机会再次把它猛塞进去。[pg]");
         outputText("她捶打着你的子宫颈，像一根巨大的肉结阴茎一样用拳头操你。你花了一分钟才适应这种巨大的插入感，但很快你就开始摇晃臀部，发出愉悦的嘶鸣。");
         if(get_player().hasCock())
         {
            outputText("既然你平静下来了，火蜥蜴趁机用她空闲的手抓住[onecock]，将它送入嘴中。她分叉的爬行类舌头探出，舔舐着你的柱身，随着你越来越多的部分滑过她薄薄的嘴唇，深入她的喉咙");
            if(get_player().shortestCockLength() <= 24)
            {
               outputText("，直到你直没入根");
            }
            outputText("。当她开始配合着拳交的节奏吸吮时，你淫荡地呻吟起来，双管齐下的快感让你的大脑几乎麻木。");
         }
         outputText("这感觉太单方面了，但她脆弱的下体刚好在你的触及范围之外——但这并不能阻止你。[pg]");
         outputText("带着邪恶的微笑，你一把抓起女人扭动的尾巴，像拿鞭子一样握住它，将其盘起，直到只有一英尺左右伸出你的手腕。接着，你俯下身，用尾巴戳刺她，盲目地试图将其尖端塞进她空虚的小穴。最后，你找到了目标，她的尾巴滑过她的臀部，进入了她的裂口。你将尾巴向前刺入它的主人体内，引出一声愉悦的娇呼");
         if(get_player().hasCock())
         {
            outputText("从你被包裹的阴茎周围");
         }
         outputText("。紧紧抓住她那火热的红色尾巴，你开始用力、快速、甚至带着报复性地操她，而她则继续攻击你的" + get_player().vaginaDescript(0));
         if(get_player().hasCock())
         {
            outputText("和肿胀的阴茎");
         }
         outputText("。[pg]");
         outputText("这不可能永远持续下去。你很快就感觉到即将高潮的明显压力在你的" + get_player().vaginaDescript(0) + "深处积聚。");
         if(get_player().hasCock())
         {
            outputText("和肉棒");
         }
         outputText("。而且你并不孤单：在你猛烈的尾交下，火蜥蜴尖叫着达到了高潮，你感觉到一股女孩的淫液喷到了你的下腹。你也不甘落后，当你的高潮袭来时，你紧紧夹住她入侵的拳头，强烈的快感几乎让你摔倒");
         if(get_player().hasCock())
         {
            outputText("并用精液填满她的喉咙");
         }
         outputText("。[pg]");
         outputText("你的身体花了一分钟才平静下来；当它平静下来时，你的火蜥蜴情人从她的挽具中滑出，瘫倒在地上，浑身浸透了你和她的混合精液。你的意志力已经耗尽，你倒在她旁边的地上，陷入了不安的、伤痕累累的睡眠中。[pg]");
         get_player().orgasm("Vaginal");
         var _loc1_:IMap = KFLAGS.flags;
         FlagDict_Impl_.arrayWriteInt(_loc1_,394,FlagDict_Impl_.arrayReadInt(_loc1_,394) + 1);
         _loc1_ = KFLAGS.flags;
         FlagDict_Impl_.arrayWriteInt(_loc1_,395,FlagDict_Impl_.arrayReadInt(_loc1_,395) + 1);
         get_helFollower().helAffection(5);
         if(get_game().get_inCombat())
         {
            get_combat().cleanupAfterCombat();
         }
         else
         {
            doNext(postHelFuckBuddyFollowup);
         }
      }
      
      public function helTailWanksYourDickBecauseSheLovesYouDesuDesuHoraHora() : void
      {
         spriteChooser();
         clearOutput();
         get_images().showImage("helia-tailwank");
         var _loc1_:int = get_player().biggestCockIndex();
         outputText("你思索了片刻，然后慢悠悠地走到那只火热的火蜥蜴面前。她起初倒吸了一口凉气，但当你告诉她要好好利用那条粗壮灵活的尾巴时，她露出了如狼似虎的笑容。你把手移到她的肩膀上，把她按倒跪下；她很快就开始帮你脱掉[armor]。摆弄了一会儿后，你的" + get_player().cockDescript(_loc1_) + "弹了出来，已经开始变硬了；她用长着爪子、布满鳞片的手握住它，试探性地套弄了几下，但你很快提醒她，你心里想的是另一个姿势。[pg]");
         outputText("火蜥蜴向后靠去，让她的尾巴从双腿间滑过，像蛇一样向你游来。她尾巴的表面，曾经闪耀着炽热的光芒，现在只剩下红色的鳞片；你有一瞬间的犹豫，但当尾尖第一次触碰到你的腿时，就足以让你平静下来——她很热，但还不至于烫伤你。你的" + get_player().cockDescript(_loc1_) + "开始因为期待而跳动，那条慢吞吞的尾尖从地面开始，缓慢而性感地向你的胯部移动，在你大腿内侧和" + get_player().assDescript() + "的敏感皮肤上流连忘返，最后滑到了你的" + get_player().cockDescript(_loc1_) + "上。[pg]");
         outputText("你浑身颤抖，喘着粗气，因为她的尾巴在你的" + get_player().cockDescript(_loc1_) + "上缠绕了一圈，两圈，直到把你的整根肉棒都包裹在闷热的鳞片血肉中。你渴望能抓住什么东西，渴望能操点什么，于是你抓住了她缠绕在你阴茎上的粗大尾根，试图催促她履行职责。然而，她带着羞涩的微笑拒绝了你。[pg]");
         outputText("[say:来吧，朋友，]她说着，轻轻捏了捏你的阴茎。[say:既然这事儿这么一边倒，我只好从挑逗你中寻找我的乐趣了。][pg]");
         outputText("你正准备骂她，她又捏了一下你的阴茎，让你的话语融化在一声夹杂着快感和痛苦的尖叫中。她笑了，开始用尾巴绞弄你，随着她的盘绕收紧你的阴茎，尾尖慢慢地在你的身体上向上移动，挤压、榨取着它，直到你感觉自己快要爆炸了。慢慢地，她的尾巴滑到你的脖子上，用温暖包裹着你的喉咙，同时她开始加倍地挤压和绞弄你那可怜的、受尽折磨的阴茎，总是刚好在你快要射精的时候停下来。一次又一次，似乎过了几个世纪，她一直把你留在那儿，悬在极乐与痛苦的边缘，迫使越来越多的精液积聚在你酸痛的阴茎里。[pg]");
         outputText("终于，你再也受不了了。你尖叫着，挺动着臀部，火蜥蜴几乎要把你的阴茎从身体上绞下来了，一股股精液喷射在她赤裸的腹部和胸部。然而，当第一股精液离开你的" + get_player().cockDescript(_loc1_) + "时，她的尾巴松开了你的阴茎，然后紧紧勒住你的喉咙，让你窒息。你的整个身体都在抽搐，紧贴着她起伏，疯狂地挣扎着，因为一次巨大的、压抑已久的高潮席卷了你缺氧的身体。[pg]");
         outputText("当她松开你时，你忍不住瘫倒在她的腿上。你只隐约感觉到她把尾巴从你身上抽走。她用长着爪子的手指，从她柔软的乳房上刮下一滩精液，滑进嘴里。[say:嗯，又咸又美味；正是我喜欢的味道，亲爱的，]她笑着，把更多你的精液舀进她饥渴的嘴里。而你，却沉沉睡去，心满意足，平静安宁。[pg]");
         get_player().orgasm("Dick");
         var _loc2_:IMap = KFLAGS.flags;
         FlagDict_Impl_.arrayWriteInt(_loc2_,394,FlagDict_Impl_.arrayReadInt(_loc2_,394) + 1);
         _loc2_ = KFLAGS.flags;
         FlagDict_Impl_.arrayWriteInt(_loc2_,395,FlagDict_Impl_.arrayReadInt(_loc2_,395) + 1);
         get_helFollower().helAffection(5);
         if(get_game().get_inCombat())
         {
            get_combat().cleanupAfterCombat();
         }
         else
         {
            doNext(postHelFuckBuddyFollowup);
         }
      }
      
      public function helTailPegging(param1:Boolean = false) : void
      {
         spriteChooser();
         clearOutput();
         get_images().showImage("helia-tailpeg");
         if(!param1)
         {
            outputText("你同意了她的提议，思考了片刻后，脱下了你的[armor]，问她能不能用那条长长的、灵活的尾巴操你。[say:哦，这主意我绝对赞成！]她为自己的机智笑了起来。[say:好吧，那就继续吧。双手双膝着地，把屁股撅起来。][pg]");
         }
         else
         {
            outputText("[say:双手双膝着地，把屁股撅起来，]她说。[pg]");
         }
         outputText("你按照她的要求，四肢着地，让她能清楚地看到你脆弱的[ass]。你回头看去，只见她如狼似虎地笑着，把尾巴伸了过来，尾巴上之前的火焰已经熄灭了。她轻轻吸吮了一下尾尖，把它弄湿，然后跨坐在你的臀部上，准备用后入式操你。她的尾巴从嘴里滑落，像一根阴茎一样在双腿间蜿蜒，对准了你的[asshole]。[pg]");
         outputText("你咬紧牙关，握紧拳头，准备迎接即将到来的肏弄。很快，你感觉到她的尾尖压在你的后门上，寻找着入口。你尽力让自己放松，但她只用了一秒钟就强行进入了你的身体，随着几英寸长的尾巴陷入，撑开并拉伸了你的穴口，你发出了一声夹杂着痛苦和快感的喘息。");
         get_player().buttChange(40,true,true,false);
         outputText("[pg]");
         outputText("在深深插入你的体内后，她把光滑、布满鳞片的手放在你的[ass]上，开始猛烈地撞击你的屁股，快速地抽插着她的尾巴。你像个荡妇一样喘息呻吟着，几乎无法支撑自己的体重，因为她又狠又快地操着你的屁股，粗暴的肏弄仿佛要撕裂你娇嫩的内脏。[pg]");
         outputText("最终，你再也承受不住了，感觉到高潮即将来临。火蜥蜴从你绞紧她尾巴的方式中察觉到了这一点，在你的[ass]上狠狠地拍了一巴掌，然后尽其所能地深深撞入。你冲破了极限，尖叫着，剧烈地颤抖着，瘫倒在泥土上");
         if(get_player().get_gender() > 0)
         {
            outputText("，伴随着你的");
            if(get_player().hasCock())
            {
               outputText("阴茎");
               if(get_player().hasVagina())
               {
                  outputText("和");
               }
            }
            if(get_player().hasVagina())
            {
               outputText("阴道");
            }
            outputText("收缩着，喷射得你的情人满身都是");
         }
         outputText("，当她的尾巴慢慢从你的[asshole]中抽出时，你在快感中扭动着。[pg]");
         outputText("看到你瘫倒在自己快感的泥潭中扭动，一定唤起了这位狂战士心中的某种柔情。片刻之后，她把你从地上抱起来，让你的头依偎在她柔软的乳房之间，抚摸着你的脸颊，充满爱意地对你微笑。你心满意足地进入了深沉、平静的梦乡。");
         get_player().orgasm("Anal");
         var _loc2_:IMap = KFLAGS.flags;
         FlagDict_Impl_.arrayWriteInt(_loc2_,394,FlagDict_Impl_.arrayReadInt(_loc2_,394) + 1);
         _loc2_ = KFLAGS.flags;
         FlagDict_Impl_.arrayWriteInt(_loc2_,395,FlagDict_Impl_.arrayReadInt(_loc2_,395) + 1);
         get_helFollower().helAffection(5);
         if(get_game().get_inCombat())
         {
            get_combat().cleanupAfterCombat();
         }
         else
         {
            doNext(postHelFuckBuddyFollowup);
         }
      }
      
      public function helSexualAmbush() : void
      {
         clearOutput();
         outputText("当你在周围走动时，你听到快速逼近的脚步声。你警觉地举起[weapon]转身——刚好看到一只燃烧的火蜥蜴将你猛扑倒在地。你们俩向后翻滚，最终停下来时，赫尔跨坐在你身上，已经脱掉了她的鳞片比基尼，并抓挠着你的[armor]——你可以看到她的大腿被她的汁液弄得湿滑，她的皮肤因兴奋而泛红。");
         outputText("[pg][say: 来吧，[name]，]她咆哮着，把上衣扔到一边，让她那对大而有弹性的乳房重获自由。[say: 你不想让我操牛头人？好……但我需要你。现在！]");
         dynStats(DynStat.Lust(10 + get_player().lib / 20));
         if(get_player().get_lust() < 33)
         {
            get_player().set_lust(33);
         }
         FlagDict_Impl_.arrayWriteInt(KFLAGS.flags,706,1);
         helFuckMenu(true);
      }
      
      public function helPossessionShitPoopCock() : void
      {
         spriteChooser();
         clearOutput();
         outputText("趁着火蜥蜴毫无防备，你将自己化为无形，向她滑翔而去。[say:嘿！等等！你他妈在干什么？]当你以幽灵形态靠近她时，她大喊道。[pg]");
         outputText("你冷笑一声，回答道：[say:我要变成幽灵了！]然后猛地扑向她。[pg]");
         outputText("当你伸展你的幽灵力量，将自己注入火蜥蜴的脑海时，她发出一声震惊的喘息。她挣扎着，无助地挥舞着手臂，抓挠着自己的头骨，但你远在她的手指触及范围之外。凭借意志力，你压制了她对身体的控制，并直接接管了她。你扭了扭脖子和指关节，快速感受了一下你的新解剖结构。它比你习惯的要热——热得多——但这是拥有如此火辣身体的公平代价。你戏弄地捏了捏她的大乳房，感觉到一阵快感传遍你的胸膛。哦，她很<i>敏感</i>！你轻轻摇晃着你那火热的新尾巴，开始在平原上慢跑，寻找醒着的人来分享乐趣。[pg]");
         outputText("[say:说真的，这他妈是怎么回事！？]你不情愿的宿主尖叫着，挣扎着想要打破你对她的控制。你疯狂地大笑着，把她推回她大脑中原始的小角落，继续奔跑，扫描地平线，寻找生命的迹象。随着火蜥蜴挣扎着想要夺回控制权，当你没花太长时间就看到一个蹦蹦跳跳的身影在平原上弹跳时，你松了一口气，她高高的兔子耳朵在她可爱、圆润的脸庞周围欢快地拍打着。你邪恶地笑着，径直冲向那个兔女郎！[pg]");
         outputText("她看到你靠近，吓得跳了起来，把她之前隐藏的双手从她 14 英寸的兔子肉棒上移开。然而，她似乎认出了火蜥蜴，带着尴尬的神情说道：[say:呃，嗨！嗯……既然我还在发情期，我们能不能……]你向前跃起，扑倒了兔女郎，当你用火蜥蜴的爪子抓住她坚硬如石的肉棒时，你的嘴唇紧紧地贴在她的嘴唇上。打破亲吻，你开始抚摸兔女郎，在心里暗自发笑，因为火蜥蜴终于放弃了抵抗，可以说，似乎听天由命了。兔子只是在困惑的恍惚中抬头看着你，抚摸着她小小的乳头，而你则将她与你火蜥蜴的阴道对齐。[pg]");
         outputText("[say:如果你让她射在我里面，我他妈会杀了你！]当你滑下等待着的兔子肉棒塔时，火蜥蜴的声音咆哮着，当她的龟头轻松滑入你光滑的小穴时，你愉悦地叹息着。兔女郎对突然爆发的热量喘息着，但你感觉到她几乎立刻开始渗出先列腺液，当你滑下她的肉棒时，给了你更多的润滑。你紧紧夹住兔子臀部周围紧绷的大腿肌肉，拧着她的肉棒，因为它粗大的静脉以恰到好处的方式摩擦着你。终于到底了，你感觉到一对沉重的圆形球体抵在你的屁股上。[pg]");
         outputText("突然，在你满足的时刻，你失去了控制，因为火蜥蜴拼命地想把你从她的脑海中赶出去。她抓住兔女郎的肩膀开始弹跳，速度比你想象的要快，将自己猛烈地撞击在兔子肉棒上，直到它发痛。你痛苦地尖叫着，试图夺回控制权，但太迟了！兔女郎的眼中燃烧着强烈的火焰，当你重新夺回你们共享大脑的所有权时，兔子已经把你扔到背上，抓住了你的臀部。兔子色欲地咧嘴笑着，开始尽可能用力、尽可能快地捣鼓你的小穴，直到她的舌头从嘴里伸出来，你能感觉到她的肉棒渗出令人难以置信的大量先列腺液。[pg]");
         outputText("你只能勉强在兔子强暴的快感和痛苦中思考，你决定改变一下情况。你释放了对火蜥蜴的控制，将你的幽灵形态从她身上滑出……然后进入了兔女郎体内！她被色欲淹没了，几乎没有注意到你，更不用说抵抗了，当你抓住缰绳时。当你恢复用你令人印象深刻的兔子肉棒捣鼓火蜥蜴滚烫的小穴时，你高兴地大叫，利用她宽阔的臀部作为杠杆，深深地插入她体内。[pg]");
         outputText("现在她独自在脑海中，在快感中尖叫着，试图咒骂你，但只成功地在向天大喊，当她高潮时，她湿透的小穴像一个热丝钳一样紧紧夹住你的肉棒。她抓住你的肩膀，把你拉倒在她身上，把你可爱的小兔子脸埋进她巨大、汗水湿透的乳沟里，当她度过高潮时，现在把她的臀部撞向你的臀部，而你继续捣鼓她。[pg]");
         outputText("当你的肉棒根部膨胀时，你的眼睛睁得大大的，精液现在从里面涌出。你把肉棒从滚烫的深处拔出来，拼命地想把任何正在你的肉棒上向上移动的东西拔出来。[pg]");
         outputText("在你的脑海里，你听到兔女郎结结巴巴地说：[say:蛋蛋蛋蛋……要下蛋了！][pg]");
         outputText("操蛋！现在被一种令人麻木的快感折磨着，你只能被动地看着火蜥蜴把你扔到背上，把你的兔子肉棒夹在她巨大的乳房之间。[say:既然你很好心没有让这东西射在我里面，]她咧嘴笑着说，弹了弹你现在膨胀的肉棒，当她在乳房之间抽插它时，[say:我会做个好女孩，帮你解决你的小问题。][pg]");
         if(get_player().hasFuckableNipples())
         {
            outputText("好吧，你不能让她独享所有的乐趣！仍然把你的下半身留在兔女郎体内，你把两根手指滑进你饥渴的乳头穴之一。你咧嘴笑着，伸展你的乳头操穴，向前弯腰，让你胸部的嘴唇亲吻你附身的兔子肉棒的尖端。当你把自己压在兔子肉棒上时，你颤抖着，把最初的几英寸放进你的[chest]里，即使火蜥蜴继续乳交你的柱子的长度。你和火蜥蜴进入了一种节奏，齐声起伏，当你把蛋从兔子体内哄出来，推向你的乳头穴时。[pg]");
            outputText("你的眼睛翻白，长长的舌头从嘴里伸出来，你完全屈服于快感。第一颗蛋从你膨胀的兔子肉棒中冒出来，让你发出高潮的尖叫，因为它发射到你正在高潮的乳头穴中。你的[chest]顶部随着冲击向上倾斜，然后当蛋从你体内猛烈地撞击到你等待的乳头嘴里时，再次倾斜。爬行动物女人大笑着，把肉棒从你的乳头里拔出来，把它挤在自己的双峰之间，结束了你的高潮，因为她饥渴地舔着你胸部洞里的兔子精液，让它倒在自己身上，当蛋在她的胸部破裂时。[pg]");
         }
         else
         {
            outputText("你只能点点头，挺起臀部，因为她用乳房操你的兔子肉棒，在你借来的长度上上下抽插。蛋现在几乎到了你肉棒肿胀的尖端，当第一颗蛋从你体内射出时，你的大脑被高潮彻底粉碎了。你大声尖叫，疯狂地挺起臀部，在巨大的乳房之间抽插，拼命地想把剩下的负荷推出去。你的眼睛翻白，长长的舌头从嘴里伸出来，你完全屈服于快感。[pg]");
            outputText("卵开始全速从你的肉棒中射出。第一颗直接打在伴侣的脸上，在她的下巴上碎裂，蛋黄状的内容物涂满了她。当粘液从她脸上滴落时，她只是笑着，继续在她的双乳间套弄你的肉棒，而下一颗卵则滚落停在你自己那对兔乳之间。当卵从你现在肿胀的肉棒中喷涌而出时，你满足地叹了口气，最终停了下来，在火蜥蜴的乳房和脸上留下了一大滩精液。[pg]");
         }
         outputText("当你的高潮消退后，你从那个可怜的、被精液浸透的兔女郎体内拔了出来。当你和火蜥蜴挽着手踉跄着离开时，她只是眨了眨眼，挥手告别。[pg]");
         outputText("[say:去你的，]后者笑着说道。一大团精液从她的下巴滴落到她的乳房上，正好溅在她坚挺的乳头上方。[say:不过，那还真是……一种绝妙的三飞方式。][pg]");
         outputText("你大笑着，打了一个长长而满足的哈欠。在火蜥蜴的邀请下，你们在不远处的草丛中找到了一片隐蔽的空地，依偎在一起小睡，以消除性爱后的疲劳。");
         get_player().orgasm("Generic");
         var _loc1_:IMap = KFLAGS.flags;
         FlagDict_Impl_.arrayWriteInt(_loc1_,394,FlagDict_Impl_.arrayReadInt(_loc1_,394) + 1);
         _loc1_ = KFLAGS.flags;
         FlagDict_Impl_.arrayWriteInt(_loc1_,395,FlagDict_Impl_.arrayReadInt(_loc1_,395) + 1);
         get_helFollower().helAffection(5);
         if(get_game().get_inCombat())
         {
            get_combat().cleanupAfterCombat();
         }
         else
         {
            doNext(postHelFuckBuddyFollowup);
         }
      }
      
      public function helMinotaurThreesome() : void
      {
         spriteChooser();
         FlagDict_Impl_.arrayWriteInt(KFLAGS.flags,390,0);
         FlagDict_Impl_.arrayWriteInt(KFLAGS.flags,392,0);
         clearOutput();
         get_images().showImage("helia-threesome-minotaur");
         outputText("当你在草原上漫步时，你在炎热的空气中擦了擦额头，想知道这附近的普通居民都去哪儿了——通常你现在应该已经遇到点什么了。你的思绪隐隐转向了你的火蜥蜴朋友，如果在经历了那些脱节的遭遇之后你还能这么叫她的话，而且如果你的下半身的骚动有任何暗示的话，你很确定你有点想她了。[pg]");
         outputText("你继续漫无目的地走了几分钟，比平时在平原上走得更靠近山脉。然而，当你继续走的时候，你突然听到一声像牛一样的吼叫！你摆出战斗姿态，举起你的[weapon]，几乎可以肯定这吼声一定是一只游荡的牛头人发出的，但你什么也看不见。你竖起耳朵，开始追踪那一次又一次重复的声音。你的目光锁定在附近的一座小山上，你迅速跑到山顶，准备干预正在发生的任何袭击。[pg]");
         outputText("好吧，那确实是个牛头人。但如果说有什么袭击正在发生的话，那就是那个可怜的兽人正在受害。你看到你的火蜥蜴朋友，她的剑和比基尼被随意地扔在一边，正狂热地骑在牛头人的牛巴上，在他的肉棒上弹跳着，因为他塞进她体内的充实感而大声呻吟着。[pg]");
         outputText("她从肩膀上方注意到了你的靠近，停止了揉捏她丰满的乳房，只为了向你挥手。[say: 嘿，亲爱的！我——呃！——我通常会向你挥剑，但是——哦，是的！——我有点——快点，你这个软蛋混蛋！操我！——现在很忙。][pg]");
         outputText("你忍不住对这荒谬的一幕笑了起来。她转过头对你咧嘴一笑，但当她双腿间的牛头人挺动臀部，将他的阴茎深深埋入她欢迎的阴户时，她停下来喘息着。[saystart]好吧，别光站在那里，杀手！");
         if(get_player().hasCock())
         {
            outputText("我还有一个洞需要填满！[sayend]");
         }
         else
         {
            outputText("这里有足够的牛头人可以分享，所以来吧！[sayend]");
         }
         menu();
         if(get_player().hasCockThatFits(85))
         {
            addButton(0,"操她的屁股",fuckHerAss);
         }
         else
         {
            addButtonDisabled(0,"操她的屁股");
         }
         addButton(1,"舔牛头人",helMinoThreeSomeLickItsDick);
         addButton(2,"牛头人很坏",minosRBadNoFuck).hint("你不想靠近牛头人的精液，她也不应该。");
         addButton(4,"否",leaveMinotaurHelThreesome);
      }
      
      public function helMinoThreeSomeLickItsDick() : void
      {
         spriteChooser();
         clearOutput();
         get_images().showImage("helia-threesome-minotaur-minolick");
         outputText("好吧，你当然不会错过这样的机会。你急忙脱下你的" + Utils.cnName(get_player().get_armorName()) + "，走到可怜的牛头人面前。看到他那呆滞、半昏迷的表情，你差点没忍住笑出声来。打量着他，你可以看到他的屁股下面有一大滩公牛精液，或者粘在火蜥蜴的大腿上，因为她还在他的肉棒上弹跳，这表明他已经被强暴了半打次了。你几乎为这个可怜的家伙感到难过，但话又说回来，你有点怀疑如果他赢了，你的朋友也会像他现在这样。所以，脱下你的[armor]后，你跪在他那像公牛一样的口鼻上，把他的鼻子强行塞进你的[assholeorpussy]里。[pg]");
         outputText("不过，你得狠狠地扇他一巴掌，他才会真正有所行动。但当他开始行动时，感觉简直像在天堂。他的舌头又大又平，而且非常湿润，舔着你的大腿和屁股，让你因为这种奇怪但并非完全不愉快的感觉而发抖。不过，他终于来到了他的奖品面前。当他试探性地舔了舔你等待的洞穴时，你因期待而颤抖。你在[hips]之间鼓励性地挤压了一下，足以让他开始工作。他巨大的舌头终于穿透了你，滑入你等待的、敏感的洞穴，当他用舌头涂抹你的内壁时，你高兴得喘不过气来。[pg]");
         outputText("你高兴地开始在他的口鼻上扭动臀部，骑着他的舌头，就像骑着一根涂满润滑油的、能抓握的肉棒。你从牛头人看向面对着你的火蜥蜴，她像你被他的舌头刺穿一样被公牛的肉棒刺穿。你觉得她很漂亮——在他的肉棒上狂野地扭动，她的红发在微风中飘扬，她巨大的乳房随着她的动作弹跳。你忍不住越过公牛的身体，在她的嘴唇上深深地吻了一下。她吓了一跳，错过了一次冲刺，但眨眼间就回吻了你，当你们开始同步操公牛时，她那爬行动物的舌头与你的舌头交织在一起，你们扭动的臀部变得同步。然而，太快了，你能感觉到公牛体内的紧张感在增加，他开始对着你的");
         if(get_player().hasVagina())
         {
            outputText("胯下");
         }
         else
         {
            outputText("屁股");
         }
         outputText("，宣告着他即将到来的高潮。[pg]");
         outputText("[say: 算你厉害，]火蜥蜴大笑着，更加用力地撞击着他的骨盆。[say: 再给我来最后一发美味的浓浆。快点，该死的……射在里面！][pg]");
         outputText("伴随着一声巨大的咆哮，牛头人将他的臀部狠狠地撞向她的身体，应声高潮，将她灌满了牛精，以至于精液开始反向喷射，将他毛茸茸的胸膛涂满了自己的精液。这景象足以让你越过边缘，你向下压在公牛的鼻子上，大声呼喊着，你自己的高潮也随之而来，你的[assholeorpussy]紧紧夹住他的舌头，将其困在你的体内，高潮的余韵震撼着你的身体");
         if(get_player().hasCock())
         {
            outputText("同时[eachcock]将它的存货喷射到牛头人胸前的一片狼藉中");
         }
         outputText("。[pg]");
         outputText("终于，你的高潮结束了，你从牛头人身上滚了下来。他摇摇晃晃地站起来，把一把宝石扔在趴着的火蜥蜴身上，然后跌跌撞撞地走开去恢复体力。你从瘫软的状态中抬起头，看到你的朋友在浓稠的精液池中打滚——她的，你的，牛头人的——大口喘着粗气。一股巨大的精液像瀑布一样从她的小穴里涌出，那是半打积攒的牛头人高潮同时释放出来的。看到你盯着她看，你的朋友轻笑了一声，站起来走到你身边，依偎着你，她的头在你的胸前靠了一会儿，然后她抬起头，在你的嘴唇上印下了一个出乎意料的温柔的吻。[pg]");
         get_player().orgasm("VaginalAnal");
         dynStats(DynStat.Sens(-2));
         var _loc1_:IMap = KFLAGS.flags;
         FlagDict_Impl_.arrayWriteInt(_loc1_,395,FlagDict_Impl_.arrayReadInt(_loc1_,395) + 1);
         get_helFollower().helAffection(5);
         _loc1_ = KFLAGS.flags;
         FlagDict_Impl_.arrayWriteInt(_loc1_,394,FlagDict_Impl_.arrayReadInt(_loc1_,394) + 1);
         doNext(postMinoThreesomeDecisionTime);
      }
      
      public function helFuckMenu(param1:Boolean = false) : void
      {
         var _g1:HelScene;
         var dlcPrice:String;
         var dlcPitch:String;
         var dlcName:String;
         var _g:AprilFools;
         spriteChooser();
         var _loc2_:Function = declineHelSexings;
         if(param1)
         {
            _loc2_ = pussyOutOfHelSexAmbush;
         }
         menu();
         addButtonDisabled(0,"被舔");
         addButtonDisabled(1,"操她小穴");
         addButtonDisabled(2,"操她屁股");
         addButtonDisabled(3,"被尾巴干");
         addButtonDisabled(4,"尾交");
         addButtonDisabled(5,"双插");
         addButtonDisabled(6,"被口交");
         addButtonDisabled(7,"盘绕交配","必须是拥有合适鸡巴的娜迦。");
         addButtonDisabled(8,"尾巴插屁股","必须是娜迦。");
         addButtonDisabled(9,"骑乘她","必须是拥有合适鸡巴的半人马形态。");
         addButtonDisabled(10,"倒挂69","必须是拥有阴道的半人马形态。");
         addButtonDisabled(11,"附身");
         if(get_player().get_lust() < 33)
         {
            outputText("[pg]<b>你现在真的没有心情做爱。</b>");
            addButton(14,"离开",_loc2_);
            return;
         }
         var _loc3_:Function = null;
         if(get_player().hasVagina())
         {
            _loc3_ = getLickedByHel;
         }
         var _loc4_:Function = null;
         var _loc5_:Function = null;
         var _loc6_:Function = null;
         var _loc7_:Function = null;
         var _loc8_:Function = null;
         if(isAprilFools() && FlagDict_Impl_.arrayReadInt(KFLAGS.flags,2210) == 0)
         {
            outputText("[pg]<b>需要赫莉娅 DLC！</b>");
            menu();
            _g = get_game().aprilFools;
            dlcName = "Helia DLC";
            dlcPitch = "获取赫莉娅 DLC 即可与赫莉娅做爱！该 DLC 还包含海量史诗级内容，包括不死鸟之塔和黏黏护甲！";
            dlcPrice = "$4.99";
            addButton(0,"获取 DLC",function():void
            {
               _g.DLCPrompt(dlcName,dlcPitch,dlcPrice);
            }).hint("了解赫莉娅 DLC！");
            addButton(14,"离开",declineHelSexings);
            return;
         }
         if(get_player().hasCock())
         {
            if(get_player().hasCockThatFits(85))
            {
               _loc4_ = beatUpHelAndStealHerWalletFromHerVagina;
               _loc5_ = fuckHelsAss;
            }
            else
            {
               outputText("[pg]<b>你太大了，无法插入这只火蜥蜴。</b>");
            }
            _loc6_ = helTailWanksYourDickBecauseSheLovesYouDesuDesuHoraHora;
            if(get_player().cockTotal() > 1 && get_player().hasCockThatFits(85) && get_player().cockThatFits2(85) >= 0)
            {
               _loc7_ = dpHel;
            }
            _loc8_ = helBlowsYou;
         }
         if(get_player().isNaga())
         {
            if(get_player().hasCockThatFits(85))
            {
               addButton(7,"缠绕操",nagaCoilsUpHel);
            }
            addButton(8,"尾交",nagaCoilsUpAnalNaga);
         }
         if(get_player().isTaur())
         {
            if(get_player().hasCockThatFits(85))
            {
               addButton(9,"骑乘她",mountHel);
            }
            if(get_player().hasVagina())
            {
               addButton(10,"倒挂69",helVaginaTaur69);
            }
         }
         if(get_player().hasPerk(PerkLib.Incorporeality))
         {
            addButton(11,"附身",helPossessionShitPoopCock);
         }
         addButton(0,"被舔",_loc3_);
         addButton(1,"操小穴",_loc4_);
         addButton(2,"操屁眼",_loc5_);
         _g1 = this;
         addButton(3,"被尾巴干",function():void
         {
            _g1.helTailPegging();
         });
         addButton(4,"尾巴打飞机",_loc6_);
         addButton(5,"双龙入洞",_loc7_);
         addButton(6,"被口交",_loc8_);
         addButton(14,"离开",_loc2_);
      }
      
      public function helDefeatedNormal(param1:Boolean = false) : void
      {
         spriteChooser();
         if(param1)
         {
            clearOutput();
         }
         if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,396) == 1)
         {
            outputText("突然，她用火热的眼睛抬头看着你，咧嘴笑得合不拢嘴。[say: 刚才真是太他妈爽了！]她大喊着，突然爆发出爽朗的笑声。前一刻你还在为自己的生命担忧，但看到这个愤怒的狂战士突然大笑起来，你也忍不住跟着笑了起来。[pg]");
            outputText("[say: 哎呀，天哪，]她一边说一边用力摇头，长发在空中飞舞。[say: 你的招式真要命，朋友。我认识一些牛头人，为了能像你这样大杀四方，他们宁愿一个月不把鸡巴插进任何东西里。嘿，听着，抱歉我刚才袭击了你。当我热血沸腾的时候，我就是忍不住想砍任何会动的东西，你懂吧？][pg]");
            outputText("她突然咧嘴一笑，把剑扔到一边。[say: 说到热血沸腾……嘿，胜者为王，败者暖床嘛。我们来发泄一下怎么样，嗯？打完一架之后，没有什么比好好干一炮更爽的了，你懂的吧？]");
         }
         else
         {
            outputText("突然，她用火热的眼睛抬头看着你，咧嘴笑得合不拢嘴。[say: 妈的，你真厉害，]她说着，突然笑了起来。[say: 不过我差点就赢了。下次小心点你的屁股，不然我可能会把这坏男孩插进去！]说到最后，她粗鲁地用尾巴比划了一下。[pg]");
            outputText("[say: 不过，毕竟胜者为王，败者暖床嘛。我们来发泄一下怎么样，嗯？打完一架之后，没有什么比好好干一炮更爽的了，你懂的吧？]");
         }
         helFuckMenu();
      }
      
      public function helDefeatedCorrupt() : void
      {
         var clear:Boolean;
         var _g:HelScene;
         spriteChooser();
         outputText("看她气喘吁吁的样子，你估计你有一分钟左右的时间可以趁她虚弱时占她便宜……你要这么做吗？");
         menu();
         if(get_player().get_lust() < 33)
         {
            if(get_player().get_lust() < 33)
            {
               outputText("[pg]你现在还没性奋到想操她的地步。");
            }
         }
         else
         {
            if(get_player().hasCock())
            {
               if(get_player().hasCockThatFits(85))
               {
                  addButton(0,"强暴后庭",rapingHelsAssMeansYourCorruptCauseAnalIsEvil);
               }
               else
               {
                  outputText("[pg]你的肉棒太大了，无法操她的后庭。");
               }
            }
            addButton(1,"接受舔肛",receiveCorruptRimjobsFromHel);
         }
         _g = this;
         clear = true;
         addButton(4,"等待",function():void
         {
            _g.helDefeatedNormal(clear);
         });
      }
      
      public function helChatMenu() : void
      {
         spriteChooser();
         get_images().showImage("helia-interview");
         if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,391) == 0)
         {
            menu();
            addButton(0,"关于她",askHelAboutHer);
            addButton(14,"离开",bugOutAfterHelMinoThreesome);
         }
         else
         {
            menu();
            if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,390) == 0)
            {
               addButton(1,"狂暴？",berserkMode);
            }
            if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,392) == 0)
            {
               addButton(2,"为何攻击我",askHelAboutAttackingYou);
            }
            addButton(3,"再来一次",askMommaHelForSecondsAfterDinner);
            addButton(4,"牛头人很坏",telHelToGetOffTheMInoCock);
            addButton(14,"离开",leaveHelAfterMinoThreeSomeChat);
         }
      }
      
      public function helCanFuckMinosWhenever() : void
      {
         clearOutput();
         outputText("你决定不阻止赫尔强暴牛头人的行为。你的火蜥蜴朋友多操几个牛头人也不会有什么坏处，对吧？你确信她能自己处理好上瘾的问题，或者根本就不会上瘾。");
         doNext(helChatMenu);
      }
      
      public function helBlowsYouCamp() : void
      {
         spriteChooser();
         var _loc1_:int = get_player().biggestCockIndex();
         clearOutput();
         get_images().showImage("helia-getblown");
         outputText("有什么沉重的东西在你的下半身周围移动和摩擦，把你从睡梦中惊醒。你沮丧地呻吟了一声，转动身体，迷迷糊糊地想换个更舒服的姿势，并推开任何打扰你的东西。");
         outputText("[pg]伴随着一次不那么温柔的推搡，你的身体被推回了原来的位置。你吃了一惊，睁开眼睛，看到了袭击你的人：赫莉娅。");
         outputText("[pg][say: 站着别动，让我吸这根肉棒，该死！]她说着，抚摸着你马一样的肉棒。你揉了揉眼睛，告诉她你非常乐意给她想要的。你告诉她跪下，同时你从床上起来，掏出你的" + get_player().cockDescript(_loc1_) + "。她咧嘴一笑，跪倒在地，迅速脱下她的鳞片比基尼，而你则抚摸着自己直到勃起。你拉近了你们之间的距离，火蜥蜴迅速将你的肉棒含入嘴中，色情地吸吮着，同时开始诱人地抚摸自己的乳房。[pg]");
         outputText("她的嘴里异常火热，甚至在她长长的分叉舌头急切地舔舐你的肉棒时，似乎要烧伤你敏感的" + get_player().cockDescript(_loc1_) + "。然而，在几秒钟的极乐之后，她向后倾斜并抓住你的屁股，强迫你跪下，同时她仰面躺下，将你的肉棒推入她的双乳之间并含入嘴中。[pg]");
         outputText("她用手抓住自己的双乳，开始沿着你的肉棒上下套弄，拼命地挤压你的" + get_player().cockDescript(_loc1_) + "，同时她灵活的尾巴开始滑入她空虚的小穴，在用乳交服侍你的同时取悦自己。你抓住她的肩膀，在一种狂野的冲动下，俯身亲吻了这只火蜥蜴。她回应了你，将舌头伸进你的嘴里，并加倍努力地进行乳交。你们这样持续了几分钟，让她用柔软如枕的乳房粗暴地挤压你，同时用尾巴操自己。然而，最终你感觉到腹股沟处即将高潮的压力越来越大，你将自己猛地挺进她的嘴里");
         if(get_player().cocks[_loc1_].cockLength >= 6)
         {
            outputText("，让她深喉你");
         }
         outputText("当你高潮并用");
         if(get_player().cumQ() <= 30)
         {
            outputText("喷射出");
         }
         else if(get_player().cumQ() <= 100)
         {
            outputText("射出几股");
         }
         else
         {
            outputText("喷洒出");
         }
         outputText("精液。当你从她体内拔出时，她咽下了你给她的一切，心满意足地叹了口气。[pg]");
         outputText("精疲力竭的你瘫倒在她柔软的乳房上。她对你微笑着，抚摸着你的脸颊，你渐渐进入了宁静的梦乡。");
         get_player().orgasm("Dick");
         var _loc2_:IMap = KFLAGS.flags;
         FlagDict_Impl_.arrayWriteInt(_loc2_,394,FlagDict_Impl_.arrayReadInt(_loc2_,394) + 1);
         _loc2_ = KFLAGS.flags;
         FlagDict_Impl_.arrayWriteInt(_loc2_,395,FlagDict_Impl_.arrayReadInt(_loc2_,395) + 1);
         get_helFollower().helAffection(5);
         if(get_game().get_inCombat())
         {
            get_combat().cleanupAfterCombat();
         }
         else
         {
            doNext(postHelFuckBuddyFollowup);
         }
      }
      
      public function helBlowsYou() : void
      {
         spriteChooser();
         var _loc1_:int = get_player().biggestCockIndex();
         clearOutput();
         get_images().showImage("helia-getblown");
         outputText("你同意了她的提议，告诉她跪下，同时你掏出你的" + get_player().cockDescript(_loc1_) + "并脱下你的[armor]。她咧嘴一笑，跪倒在地，迅速脱下她的鳞片比基尼，而你则抚摸着自己直到勃起。你拉近了你们之间的距离，火蜥蜴迅速将你的肉棒含入嘴中，色情地吸吮着，同时开始诱人地抚摸自己的乳房。[pg]");
         outputText("她的嘴里异常火热，甚至在她长长的分叉舌头急切地舔舐你的肉棒时，似乎要烧伤你敏感的" + get_player().cockDescript(_loc1_) + "。然而，在几秒钟的极乐之后，她向后倾斜并抓住你的屁股，强迫你跪下，同时她仰面躺下，将你的肉棒推入她的双乳之间并含入嘴中。[pg]");
         outputText("她用手抓住自己的双乳，开始沿着你的肉棒上下套弄，拼命地挤压你的" + get_player().cockDescript(_loc1_) + "，同时她灵活的尾巴开始滑入她空虚的小穴，在用乳交服侍你的同时取悦自己。你抓住她的肩膀，在一种狂野的冲动下，俯身亲吻了这只火蜥蜴。她回应了你，将舌头伸进你的嘴里，并加倍努力地进行乳交。你们这样持续了几分钟，让她用柔软如枕的乳房粗暴地挤压你，同时用尾巴操自己。然而，最终你感觉到腹股沟处即将高潮的压力越来越大，你将自己猛地挺进她的嘴里");
         if(get_player().cocks[_loc1_].cockLength >= 6)
         {
            outputText("，让她深喉你");
         }
         outputText("当你高潮并用");
         if(get_player().cumQ() <= 30)
         {
            outputText("喷射出");
         }
         else if(get_player().cumQ() <= 100)
         {
            outputText("射出几股");
         }
         else
         {
            outputText("喷洒出");
         }
         outputText("精液。当你从她体内拔出时，她咽下了你给她的一切，心满意足地叹了口气。[pg]");
         outputText("精疲力竭的你瘫倒在她柔软的乳房上。她对你微笑着，抚摸着你的脸颊，你渐渐进入了宁静的梦乡。");
         get_player().orgasm("Dick");
         var _loc2_:IMap = KFLAGS.flags;
         FlagDict_Impl_.arrayWriteInt(_loc2_,394,FlagDict_Impl_.arrayReadInt(_loc2_,394) + 1);
         _loc2_ = KFLAGS.flags;
         FlagDict_Impl_.arrayWriteInt(_loc2_,395,FlagDict_Impl_.arrayReadInt(_loc2_,395) + 1);
         get_helFollower().helAffection(5);
         if(get_game().get_inCombat())
         {
            get_combat().cleanupAfterCombat();
         }
         else
         {
            doNext(postHelFuckBuddyFollowup);
         }
      }
      
      public function greetHelAsFuckbuddies() : void
      {
         spriteChooser();
         clearOutput();
         outputText("你来到了广阔的平原上。很快，你便开始享受在这片炎热干燥的广阔地带漫步，在齐腰高的草丛中缓缓前行。但没过多久，你就听到了快速逼近的脚步声。你做好了战斗准备，但惊喜地看到赫尔穿过高高的草丛，她宽阔的臀部在靠近时诱人地摇曳着。[pg]");
         outputText("[say:嘿，[name]，]她说着，迅速给了你一个紧紧的拥抱。你回抱了她，并在接下来的几分钟里与你的火蜥蜴情人愉快地交谈着。过了一会儿，赫尔从你的拥抱中退开，轻轻摇晃了一下她丰满的胸部，问道，[say:那么，我的爱人，想发泄一下吗？]");
         if(get_player().get_lust() < 40)
         {
            get_player().set_lust(40);
            dynStats(DynStat.Lust(1));
         }
         helFuckMenu();
      }
      
      public function getLickedByHel() : void
      {
         spriteChooser();
         clearOutput();
         get_images().showImage("helia-getlicked");
         outputText("你同意了她的提议，并指示她跪下，同时你脱下你的[armor]，露出你的 " + get_player().vaginaDescript(0) + "。她咧嘴一笑，跪在你面前，迅速丢掉她那鳞片比基尼，你抓住她的肩膀，将你的女性特征压在她的嘴唇上。她那长长的分叉舌头向前探出，挑逗着你的阴唇。[pg]");
         outputText("火蜥蜴用她光滑、长满鳞片的手抓住你的[ass]，同时将她那奇妙的长舌头滑入你的 " + get_player().vaginaDescript(0) + "，舔舐和逗弄你敏感小穴的每一寸，她一寸一寸地深入，直到整整八英寸都推入你体内，她充满欲望的舌交让你欲火焚身。在不断累积的快感驱使下，你把她推倒仰面躺下，将你的小穴压在她的嘴上，随着她继续熟练的攻势，你挺动着臀部，让你在快感中颤抖和扭动。[pg]");
         outputText("就在她舔舐你的 " + get_player().vaginaDescript(0) + " 时，你感觉到后门突然传来一阵压力。你回头看去，只见她尾巴的最尖端正压在你的[asshole]上，试图让你的快感加倍。你试着放松括约肌，让几英寸进入你的屁股，即使这样也足以让你喘息，因为她灵巧的尾尖与她长长的舌头协同工作。[pg]");
         outputText("你只能忍受这种对待一分钟左右就高潮了，你尖叫着享受快感，同时挺身顶入她的脸，用淫液浸湿了她");
         if(get_player().hasCock())
         {
            outputText("同时[eachcock]将精液射在她的红发上");
            if(get_player().cumQ() >= 500)
            {
               outputText("，让她沐浴在精液流中");
            }
         }
         outputText("。当她分叉的舌头和尾巴慢慢从你的深处抽出时，你颤抖着喘息，当疲惫感席卷而来时，你忍不住瘫倒在她诱人的乳房上。[pg]");
         outputText("当你进入满足、宁静的梦乡时，她轻笑了一声，抚摸着你的脸颊。");
         get_player().orgasm("Vaginal");
         var _loc1_:IMap = KFLAGS.flags;
         FlagDict_Impl_.arrayWriteInt(_loc1_,394,FlagDict_Impl_.arrayReadInt(_loc1_,394) + 1);
         _loc1_ = KFLAGS.flags;
         FlagDict_Impl_.arrayWriteInt(_loc1_,395,FlagDict_Impl_.arrayReadInt(_loc1_,395) + 1);
         get_helFollower().helAffection(5);
         if(get_game().get_inCombat())
         {
            get_combat().cleanupAfterCombat();
         }
         else
         {
            doNext(postHelFuckBuddyFollowup);
         }
      }
      
      public function fuckHerAss() : void
      {
         spriteChooser();
         clearOutput();
         get_images().showImage("helia-threesome-minotaur-buttfuck");
         var _loc1_:int = get_player().cockThatFits(85);
         if(_loc1_ < 0)
         {
            _loc1_ = 0;
         }
         outputText("好吧，要是让操她那火辣美臀的机会溜走，那你可就太蠢了。你迅速脱下[armor]，握住你的" + get_player().cockDescript(_loc1_) + "，一边把它撸硬，一边靠近火蜥蜴和她的牛头人。你在火蜥蜴身后跪下，把她的尾巴推开（这可不容易，因为她正开心地在牛头人身上颠簸着），露出她的另一个洞。你将龟头滑入，遇到了不小的阻力，因为你的情人在交欢中很难放松肌肉，但你最终还是强行挤了进去，惹得她双唇间溢出一声低沉而充满情欲的娇吟。[pg]");
         outputText("你伸手想搂住她的臀部，但当你摸到一双粗糙长毛的手已经牢牢抓在那里时，你缩了回来。[say: 嘿，抱歉了亲爱的，]火蜥蜴有些不好意思地说。[say: 先到先得嘛！]不过，仿佛是为了补偿你，她拉起你的手，引导着它们覆上她那对硕大的E罩杯，让你有东西可以抓握。与此同时，她开始更快地骑乘那头公牛的肉棒，让你的阴茎在火热的菊穴里一次又一次地进出。[pg]");
         outputText("意识到你在这里的角色主要是被动的，你配合着她的节奏挺动臀部，开始把玩她的乳房，享受着紧如台钳的屁股包裹着你的" + get_player().cockDescript(_loc1_) + "，以及手中火蜥蜴柔软可塑的双乳所带来的双重快感。[say: 哦，对，男孩们！]她大叫着，弓起背疯狂地耸动。[say: 更深！对，来吧，更深一点！]她尖叫着，抓住你的手，重重地坐下，将你和牛头人的肉棒一次又一次地尽可能深地埋入体内。[say: 就是这样！操我的洞，操我的洞，操操操，操死我！][pg]");
         outputText("高潮时她发出响彻云霄的尖叫，在你的掌控中痉挛着。她紧紧抓住你的手，在体内的肉棒上颠簸起伏，攀上了令人大脑空白的高潮。她的肌肉收紧，在你继续操她屁股时死死夹住你，但那头公牛受不了了。他大吼一声，捏紧火蜥蜴的臀部，将精液猛烈地射入她体内，力道之大甚至有几股精液反向喷出，溅满了他自己的胸膛。[pg]");
         outputText("看到公牛射精的画面让你也达到了极限。你粗暴地捏了一把火蜥蜴的乳房，在射精前尽可能深地挺入她的屁股，将积蓄已久的精液如洪流般释放在她的洞里。双重感官刺激让她倒吸一口凉气，在你的怀中战栗着。你和牛头人的精液倾注进她体内，将她填满，直到精液顺着大腿流下，在她的膝盖下汇聚成一滩。[pg]");
         outputText("片刻的宁静之后，火蜥蜴紧紧握住你的手，从牛头人身上滚了下来，带着你一起，让她躺在你的胸前，你的肉棒依然埋在她的屁股里。休息了一分钟后，牛头人摇摇晃晃地站了起来，把一袋宝石扔给了他的新朋友，然后踉踉跄跄地离开了。[pg]");
         outputText("看到牛头人满身精液地走开，她忍不住大笑起来。[say:哦，可怜的家伙，]她笑着说，[say:离家太远，结果撞见了我。就像我认识的某个人一样。]令你惊讶的是，她翻身压在你身上，给了你一个长长的吻，闭着眼睛，尾巴在身后轻轻摇摆。");
         get_player().orgasm("Dick");
         dynStats(DynStat.Sens(-2));
         var _loc2_:IMap = KFLAGS.flags;
         FlagDict_Impl_.arrayWriteInt(_loc2_,395,FlagDict_Impl_.arrayReadInt(_loc2_,395) + 1);
         get_helFollower().helAffection(5);
         _loc2_ = KFLAGS.flags;
         FlagDict_Impl_.arrayWriteInt(_loc2_,394,FlagDict_Impl_.arrayReadInt(_loc2_,394) + 1);
         doNext(postMinoThreesomeDecisionTime);
      }
      
      public function fuckHelsAss() : void
      {
         spriteChooser();
         clearOutput();
         get_images().showImage("helia-buttfuck");
         var _loc1_:int = get_player().cockThatFits(get_helFollower().heliaAnalCapacity());
         outputText("你告诉她，是的，你想发泄一下，并示意她四肢着地趴下。[pg]");
         outputText("[say: 噢，我想我知道我们都想要什么，]她说着，露出如狼似虎的笑容，脱下暴露的比基尼，四肢着地趴下，转过身将她肌肉紧实的屁股对着你。她诱惑地将尾巴高高翘起，像是在说“过来呀”一样摇晃着，然后把它挪开，露出下面属于你的奖品——她紧致的小菊花。[pg]");
         outputText("你在这只火蜥蜴身后跪下，开始套弄你的肉棒，让它完全勃起。在期待的时刻，她向后伸出一只手，轻松地将一根手指滑入她的后庭，一直插到第二个指关节。[say: 别害羞，亲爱的，]她抽出手指说道。[say: 你看着的可不是什么处女穴，所以来吧……操我的屁股！][pg]");
         outputText("这就是你所需要的全部鼓励。你对准目标，缓慢而坚定地插了进去。天哪，她紧得就像丝滑的台钳，她的括约肌死死地夹住你的肉棒，让你每深入一寸都要费尽力气。当你的" + get_player().cockDescript(_loc1_) + "强行挤入时，她呻吟着喘息，咬着下唇承受着最后几寸的深入，直到你一插到底，整根肉棒都埋进了她的屁眼。[pg]");
         outputText("正当你准备拔出来时，你突然感到肩膀和脖子上传来一阵灼热的压力——你低头一看，发现她的尾巴紧紧地缠住了你，上面的火焰此刻已经平息。[say: 噢，对，对，对。就留在里面，等一下。让我好好品味一下，]她呻吟着，自顾自地微笑着，一只手开始揉捏自己的乳房。你顺从了她，在她温暖有力的尾巴上蹭了一会儿，然后向外抽出，直到只剩下龟头还埋在她的体内。[pg]");
         outputText("你舒服地闷哼一声，一鼓作气将肉棒完全插进了她的屁股里。她尖叫起来，不是因为痛苦而是因为快感，舌头从嘴里伸出，尾巴紧紧地缠住你。你拔出，然后插入，再来一次。你保持这个节奏长达一分钟，不断地操干着她的屁眼，而她则抚摸着自己，淫荡地呻吟着。[pg]");
         outputText("[say: 哦，对，操我的屁股。就是这样！] 当她高潮到来时，她紧紧夹住你的肉棒，你将自己完全推入，她的淫液溅到了你的[legs]上，从她的小穴中喷涌而出，而她的尾巴则紧紧勒住你，变得越来越紧、越来越热，几乎让你无法呼吸。[pg]");
         outputText("这只会让你的高潮更加美妙。你给了她最后几秒钟的猛烈抽插，然后你咆哮着在她体内爆发，将你的精液深深地射进她的肠道，用你的种子填满她。[pg]");
         outputText("[say: 哦。哦，哇，] 当你从她的屁股里拔出时，火蜥蜴终于开口了，咧嘴笑着。[say: 哦，我喜欢被好好地操屁股，而你……该死，你真棒。过来，亲爱的。] 她四脚朝天地躺下，张开双臂。你倒进她的怀抱并亲吻她，用舌头探索她的嘴。最后，你退了回来，将脸颊依偎在她柔软的乳房上，疲惫感突然袭来。[pg]");
         outputText("当你渐渐进入甜美平静的梦乡时，她抚摸着你的脸颊。");
         get_player().orgasm("Dick");
         var _loc2_:IMap = KFLAGS.flags;
         FlagDict_Impl_.arrayWriteInt(_loc2_,394,FlagDict_Impl_.arrayReadInt(_loc2_,394) + 1);
         _loc2_ = KFLAGS.flags;
         FlagDict_Impl_.arrayWriteInt(_loc2_,395,FlagDict_Impl_.arrayReadInt(_loc2_,395) + 1);
         get_helFollower().helAffection(5);
         if(get_game().get_inCombat())
         {
            get_combat().cleanupAfterCombat();
         }
         else
         {
            doNext(postHelFuckBuddyFollowup);
         }
      }
      
      public function fuckBuddyHel() : Boolean
      {
         return FlagDict_Impl_.arrayReadInt(KFLAGS.flags,393) == 1;
      }
      
      public function foxyFluffsFoursomeAsMale() : void
      {
         spriteChooser();
         clearOutput();
         get_images().showImage("helia-fox-foursome-male");
         var _loc1_:int = get_player().cockThatFits(85);
         if(_loc1_ < 0)
         {
            _loc1_ = get_player().smallestCockIndex();
         }
         outputText("你脱下你的[armor]，握住你的" + get_player().cockDescript(_loc1_) + "。米可醉醺醺地咯咯笑着，仰面躺在床上，开始抚摸她那带结的肉棒。赫莉娅和舞跪在地上，赫尔将自己埋在米可张开的双腿间，而她的妹妹则用柔软的双手环住你的" + get_player().cockDescript(_loc1_) + "，引导它进入她的嘴里。当舞为你口交时，你的手穿过她银色的头发，她撸动着你肉棒的根部，湿润的舌头在龟头和柱体上轻弹，丰满的嘴唇包裹着你的粗壮，发出可爱的[say: 噢。]她继续了一分钟，让你把手放在她的头上，引导她口交的速度和力度。[pg]");
         outputText("你现在坚硬如铁，湿漉漉的，你调皮地把舞推开，告诉她去照顾她的双胞胎姐妹。她带着沾满你先列腺液的淫荡笑容，与赫尔交换了位置，站在她姐姐张开的双腿间，将自己的犬型肉棒对准米可湿润准备好的小穴。舞压了进去，滑进她姐姐的肉结里；当舞开始缓慢而温柔地操她姐姐时，你看着双胞胎脸上迅速蔓延的狂喜表情，咧嘴笑了，她动作很轻，直到你和赫尔就位。[pg]");
         outputText("你走到舞的身后，将你的" + get_player().cockDescript(_loc1_) + "放在她柔软丰满的臀瓣之间，让她乱伦的抽插动作摩擦你的肉棒。你双手环住她的臀部，滑入她的体内，当她丝绸般的肉壁挤压你入侵的肉棒时，你呻吟出声。舞在你的怀里变得慵懒，你迅速主动向前挺动臀部，将你的肉棒推入她体内，同时将她的肉棒推入她姐姐体内。你控制了节奏，让舞的臀部与你的臀部同步移动。当你将舞的肉结完全推入米可现在大张的小穴时，你看到一小股先列腺液从下面狐狸女孩未使用的肉棒中滴落。[pg]");
         outputText("看到机会，赫莉娅爬上床，将自己刺穿在米可坚硬的犬型肉棒上，以逆乘骑的姿势骑在狐狸女孩身上，这样她柔软的乳房就压在舞较小的胸部上。赫尔双臂环绕着舞的肩膀，开始在米可的肉棒上弹跳，随着每一次动作将肉结吞入又吐出，将她的小穴撑得大大的。[pg]");
         outputText("你越过舞的肩膀，给了赫尔一个漫长而热烈的吻，当你的抽插和赫尔的弹跳同步时，你们的舌头交织在一起。现在既被插入又插入别人，狐狸女孩们在压倒性的快感中几乎瘫软，只能被动地屈服于你和赫莉娅，相信你们会在她们的大脑完全麻木之前让她们达到高潮。[pg]");
         outputText("你结束了亲吻，开始加快速度。你开始将肉棒猛撞进舞渴望的小穴，越操越狠，而赫尔弹跳得越来越快，现在已经无法将米可膨胀的肉结拔出。舞巨大的肉结也同样锁在她姐姐体内，让她根本无法拔出太远。随着每一次抽插，你开始将臀部拉得离舞更远，每一次大幅度的抽插都用更多的" + get_player().cockDescript(_loc1_) + "撞击她，将你的胯部猛撞进她的屁股，让她在她的双胞胎姐妹体内结得更深，直到她们俩的舌头都从嘴里滚落出来。[pg]");
         outputText("双胞胎同时高潮，两人都发出一声欢愉的哀号，她们的肉结在瞬间急剧膨胀。狐狸精液四处喷洒，填满了赫尔和米可的子宫，然后从她们的小穴中喷涌而出，用她们自己的精液覆盖了这对姐妹。随着体内突然的结扎，赫尔向后仰起头尖叫，度过了她自己的高潮。在你也射精之前，你设法在舞痉挛的通道里进行了最后几次绝望的抽插，将浓稠滚烫的精液倾泻进狐狸女孩等待的子宫里。[pg]");
         outputText("当快感淹没你时，你只能颤抖和喘息。你把脸埋进舞的脖子里，当最后一点精液在她体内深处爆炸时，你咬了她一口。舞向你挺起臀部，挤压你的肉棒，榨干你的每一滴精液，直到你的肉棒完全耗尽。你呻吟着从她体内抽出，在你这样做的同时，从她体内拖出了一道滚烫的白色精液瀑布。");
         get_player().orgasm("Dick");
         dynStats(DynStat.Sens(-1));
         doNext(foxyFluffOutro);
      }
      
      public function foxyFluffOutro() : void
      {
         spriteChooser();
         clearOutput();
         outputText("现在浑身沾满精液和汗水，你、赫尔和双胞胎瘫倒在床上，都因为这场四人行的消耗而喘息着。随着她们粗大的肉结现在萎缩回正常大小，女孩们擦去她们光滑乳房和大腿上的精液时看起来相当可爱。赫尔满足地呻吟着，用手指从她松弛的小穴里抠出一点狐狸精液。[pg]");
         outputText("你微笑着张开双臂，狐狸双胞胎依偎过来，把头靠在你的[chest]上。赫尔微笑着爬到你身上，给了你一个漫长而充满爱意的吻。[say:太棒了，爱人们，]火蜥蜴低声说道，用手臂环住双胞胎。她们咯咯地笑着，半醉半睡。被三具温暖性感的身体包围着，你很快就进入了梦乡。[pg]");
         outputText("<b>3小时后……</b>[pg]");
         outputText("你醒来发现自己被盖在被子里，你的衣服整齐地叠在旁边。看起来有人在你们的小型狂欢后把你清理干净并盖好了被子。当你听到旁边响亮的呼噜声时，你甚至不需要猜是谁照顾了你。你拉开被子，果然发现赫莉娅蜷缩在你身边，她温暖的尾巴充当了你们俩的枕头。你笑了笑，给了她一个长吻，然后收拾好你的东西。你让火蜥蜴继续睡觉，自己则回到了营地。");
         get_helFollower().helAffection(5);
         get_helFollower().saveContent.lastTimeSex = get_game().time.days;
         doNext(get_camp().returnToCampUseFourHours);
      }
      
      public function foxyFluffGirlsFuckSex() : void
      {
         spriteChooser();
         clearOutput();
         get_images().showImage("helia-fox-foursome-female");
         outputText("你脱下你的[armor]，调皮地把狐狸女孩们推到床上，在赫尔的帮助下，分开她们的双腿，露出她们坚硬的肉棒。你依偎在舞的大腿间，将她的肉棒含进嘴里，直到肉结分开你的嘴唇。她尝起来有麝香、汗水和咸咸的先列腺液的味道，当第一滴美味的精液接触到你的舌头时，一股电流般的寒意顺着你的脊椎窜上。[pg]");
         outputText("你和赫尔都为这对双性双胞胎口交，看到女孩们手牵手，在你们的口交服务下向后仰着头，觉得很有趣。你花了一分钟左右的时间吸吮和舔舐她们的犬型肉棒，让她们为即将到来的好戏做好准备。[pg]");
         if(get_player().hasFuckableNipples())
         {
            outputText("现在女孩们已经湿透了，你把她们拉得尽可能近，并露出你闪闪发光、湿润的乳头穴。你将两根手指滑入你[chest]等待的洞里，示意女孩们插入你。虽然对你异于常人的解剖结构有些吃惊，但几句鼓励的话就足以让这对姐妹站起来，抓住你的肩膀寻求支撑。[pg]");
            outputText("她们轻松地插了进去，将她们双胞胎的犬型肉棒滑入你的乳房，直到她们的肉结压在你的嘴唇上。你在插入时颤抖，感受着两根肉棒滑入你[chest]的非人感觉。当她们开始操你的乳房时，你感觉到赫尔跪在你身后，用她长满鳞片的手臂环住你的腰，将她的尾巴滑入你的双腿之间。你只有一秒钟的时间来准备迎接即将到来的攻击，然后她的尾巴滑入你的[vagina]，强行进入你的爱之隧道，直到你能感觉到她尖锐的尾尖在你的子宫上蠕动和戳刺。[pg]");
            outputText("你让女孩们一起狠狠地操你，双胞胎猛撞你的乳房，直到她们快要结扎，而赫尔用她巨大的尾巴操你的小穴。你几乎要高潮了，但看到这一幕，三个人同时从你体内抽出。你还没完呢！[pg]");
         }
         outputText("双胞胎把你和赫尔抱起来扔到床上，并排仰面躺下。双胞胎笼罩着你，舞抚摸着她带结的肉棒，靠近你等待的[vagina]。看到米可将她的肉棒拍在赫尔等待的小穴上，你握住火蜥蜴的手，咬紧牙关期待着。[pg]");
         outputText("舞抓住你的[hips]，以一个缓慢而慵懒的动作将她的犬型肉棒滑入你体内，推入直到她粗壮肿胀的肉结压在你的嘴唇上。当她的肉棒轻轻抚摸你的肉壁时，你呻吟出声，滴下足够的先列腺液让你在过程中得到很好的润滑。舞的肉结抵着你的嘴唇，在你体内进行了几次快速有力的抽插，然后退到顶端，只留下一英寸的红色肉棒在你体内，然后猛地撞击到底，以一次强有力的抽插将她的肉结撞入你体内。");
         get_player().cuntChange(24,true,true,false);
         outputText("[pg]");
         outputText("当你的小穴嘴唇被拉得很宽时，你在快感中尖叫，你的隧道不得不大幅扩张以容纳巨大的入侵者。现在结扎了，舞只能对你进行短促而用力的抽插，将她的臀部猛撞进你的腹股沟，直到你的大腿上涂满了她自由泄漏的女性汁液。当舞开始粗暴地捣你时，赫尔松开你的手，将米可翻转到你身边的背上，与她的爱人交换位置，骑在她的肉棒上。火蜥蜴发出一声响亮的欢愉大叫，她抓住狐狸女孩丰满的乳房，开始在她结扎的肉棒上弹跳。[pg]");
         outputText("不想落后，你抓住舞把她扔到床上，让你在上面，她的肉结完全埋在你体内。你抓住她柔软坚挺的乳房寻求支撑，开始用你的臀部摩擦她的臀部，当你攻击她粗壮的肉棒时，让女孩像个婊子一样呻吟。舞只能俯身抓住她姐姐的手，就像你抓住赫尔的手一样。双胞胎紧紧抱在一起，你和赫尔狠狠地骑着她们，很快就把狐狸女孩变成了一对喘息着、蠕动着的动物，她们疯狂地向你挺动臀部，将比你想象中更多的犬型肉棒撞入你体内。赫尔对你咧嘴一笑，将她的尾巴滑过你的腰，紧紧地抱着你，女孩们越来越接近高潮——你也是。[pg]");
         get_player().orgasm("Vaginal");
         outputText("突然，米可发出一声尖锐的叫声，将臀部猛撞进赫尔的臀部。你只能看到她和赫尔同时高潮时的表情，白色的狐狸精液从火蜥蜴滚烫的小穴中滴落。[say: 要……要去了……]舞呜咽着，只给你片刻准备时间，她就抓住你的手臂，把你拉倒在她的胸前，把你的脸埋在她沉重的乳房之间。她像手提钻一样操你现在暴露的小穴。将她的肉结在你体内进进出出，直到你无法思考。你高潮了，你的[vagina]夹紧了她的犬型肉棒。爆炸性的快感波浪穿过你，让你在双性狐狸兽人的怀里痉挛，只勉强意识到她把精液射进你体内深处，用浓稠滚烫的精液涂满你的肉壁。你埋在舞的胸前度过了高潮，颤抖着喘息着，她一遍又一遍地吻你，让她粗壮的肉结在你体内萎缩，直到她自己的精液漏出来，弄脏了她光滑的大腿和双腿。");
         dynStats(DynStat.Sens(-1));
         doNext(foxyFluffOutro);
      }
      
      public function followrIzzyxSallyThreesomePretext() : void
      {
         spriteChooser();
         outputText("[pg]<b>夜里发生了一些奇怪的事情……</b>[pg]");
         outputText("你才睡了几个小时，就听到营地外突然传来一声惊人的撞击声。你跳了起来，试图收拾装备，同时确认营地里的一切和每个人都在。你只花了一瞬间就发现伊莎贝拉不见了！[pg]");
         outputText("你走出营地，听到一声又一声的撞击声，随着你的靠近，声音越来越大。[pg]");
         outputText("你加快步伐，很快就来到了营地边缘。在那里，伊莎贝拉除了拿着盾牌外一丝不挂，正面对着一个笼罩在黑暗中的对手，只能看到对方挥舞着一把长长的弯刀。[pg]");
         outputText("[say: [name]！]伊莎贝拉喘着气，看到你走过来松了一口气。");
         if(isabellaAccent())
         {
            outputText("[say: 太好了，现在我们可以去对付这个粗野的野蛮人了！][pg]");
         }
         else
         {
            outputText("[say: 太好了，现在我们可以去对付这个粗野的野蛮人了！][pg]");
         }
         outputText("你举起[weapon]，准备与这个阴影中的恶棍战斗……却看到火蜥蜴赫尔走上前来，睁大眼睛盯着你。[pg]");
         outputText("[say: [name]！搞什么鬼！？]赫尔质问道，目光在你和红发牛娘之间来回扫视。[pg]");
         outputText("你被打了个措手不及，开始向你的同伴介绍赫尔。伊莎贝拉皱着眉头说，");
         if(isabellaAccent())
         {
            outputText("[say: 我认识这个小婊砸，[name]。][pg]");
         }
         else
         {
            outputText("[say: 我认识这个小婊砸，[name]。][pg]");
         }
         outputText("赫尔冷笑道：[say: 你最好认识，母牛。我们已经纠缠好几个月了。现在，把我母亲的头巾还给我，不然我就把我的爪脚狠狠踹进你的肥臀里！][pg]");
         outputText("伊莎贝拉举起盾牌，用蹄子威胁性地踢了一下地面，而赫尔也准备好了她的剑。意识到这可能会迅速升级为流血事件，你赶紧挡在两个红发女孩中间，不让她们有机会把对方打得屁滚尿流。[pg]");
         outputText("[say: [name]！]她们齐声喊道，因为无法越过你靠近对手而感到沮丧。[pg]");
         outputText("既然你已经成功吸引了她们的全部注意力，你要求她们给出一个极其欠缺的解释。[pg]");
         outputText("赫尔瞪着伊莎贝拉说道：[say: 这头……母牛……几个月前偷了我的头巾，而且还不肯还给我。][pg]");
         outputText("伊莎贝拉愤愤不平地哼了一声，对火蜥蜴嗤之以鼻。");
         if(isabellaAccent())
         {
            outputText("[say: 别听这小骗子瞎说，[name]。我是在豺狼人手里找到的，绝对没有偷。][pg]");
         }
         else
         {
            outputText("[say: 别听这小骗子瞎说，[name]。我是在豺狼人手里找到的，绝对没有偷。][pg]");
         }
         outputText("[say: 你他妈的明明就偷了！] 赫尔厉声喝道，挥舞着手中的剑。[say: [name]，你到底为什么要护着那头肥牛，啊？让我教训她！][pg]");
         outputText("你翻了个白眼，解释说伊莎贝拉现在是你的同伴，虽然你很喜欢赫尔，但你不能容忍朋友之间发生暴力冲突。花了几分钟时间，你才让火蜥蜴那被战斗冲昏的头脑冷静下来。当她终于明白过来时，她慢慢退后，放下了剑。伊莎贝拉也小心翼翼地放下了盾牌。[pg]");
         if(isabellaAccent())
         {
            outputText("[say: 这么说，] 伊莎贝拉终于开口了，将目光从你身上移向火蜥蜴。[say: 你们俩是……恋人，对吧？我还差点把你揍一顿呢！][pg]");
         }
         else
         {
            outputText("[say: 这么说，] 伊莎贝拉终于开口了，将目光从你身上移向火蜥蜴。[say: 你们俩是……恋人，对吧？我还差点把你揍一顿呢！][pg]");
         }
         outputText("[say: 是啊，] 赫尔轻嗤了一声回答道，[say: 而且，我想既然你是[name]的朋友……你大概也还算不错。][pg]");
         outputText("当赫尔向伊莎贝拉伸出手时，你脸上泛起了一丝傻笑。牛娘警惕地握住了她的手。两个女孩较劲似的加快了握手的节奏，直到她们那两对巨大的乳房都跟着晃动起来。[pg]");
         outputText("[say: 哦，给你，] 伊莎贝拉说着，打断了");
         if(get_silly())
         {
            outputText("(挤奶)");
         }
         else
         {
            outputText("握手");
         }
         outputText("的动作，从尾巴上解下蓝色的蝴蝶结递给赫尔。赫尔高兴地喘了口气，一把抓过蝴蝶结绑在额头上——这让她看起来像个半裸的突击队员——不过很快就被她红色的长发遮住了。[pg]");
         outputText("[say: 是啊。你人还不错。] 赫尔说着，终于把剑收回了鞘中。[say: 谢谢你把我妈妈的头巾还给我。][pg]");
         outputText("[say: 不……客气，] 伊莎贝拉看着赫尔消失在夜色中说道。你如释重负地叹了口气，回到营地，试图在太阳升起前睡个好觉。");
         FlagDict_Impl_.arrayWriteInt(KFLAGS.flags,397,1);
         doNext(playerMenu);
      }
      
      override public function followerHel() : Boolean
      {
         if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,479) == 2)
         {
            return true;
         }
         if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,493) == 1)
         {
            return false;
         }
         if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,479) > 0)
         {
            return true;
         }
         return false;
      }
      
      public function encounterAJerkInThePlains() : void
      {
         spriteChooser();
         var _loc1_:IMap = KFLAGS.flags;
         FlagDict_Impl_.arrayWriteInt(_loc1_,396,FlagDict_Impl_.arrayReadInt(_loc1_,396) + 1);
         if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,395) > 0 && int(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,395) % 5) == 0 && FlagDict_Impl_.arrayReadInt(KFLAGS.flags,705) == 0)
         {
            helMinotaurThreesome();
            return;
         }
         if(fuckBuddyHel())
         {
            greetHelAsFuckbuddies();
            return;
         }
         if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,396) == 1)
         {
            clearOutput();
            outputText("平原上的高草似乎在你周围无限延伸，你的视线只被平缓起伏的丘陵所打破。如果你不是在豺狼人的领地边缘徘徊，你几乎可以称这里为一个宁静的地方。然而，当你小心翼翼地穿过广阔的草原时，你保持着警惕。[pg]");
            outputText("突然，你听到最近的山丘那边传来一声刺耳的尖叫。你竖起耳朵，隐约能听到钢铁碰撞的声音，以及用力时发出的咕哝声和痛苦的呻吟。是战斗的声音！好吧，你毕竟是勇者，如果这不意味着你有责任去弄清楚发生了什么，那才怪了。你做好战斗准备，准备好你的[weapon]，冲上山顶！[pg]");
            outputText("你到达时，战斗似乎正接近尾声，你看到其中一名战士伴随着一声“<i>哎哟</i>”，一屁股坐在了泥土里。倒下的战士是一名豺狼人掷矛手，她绝望地抓着剩下的一根标枪，妄图阻止彻底的失败。[pg]");
            outputText("站在她上方的是另一个女人，外貌隐约像人类，除了从她丰满的臀部伸出的长长且燃烧着火焰的尾巴，以及覆盖在她腿部、背部和前臂上的鳞片。她带着邪恶的笑容，走到对手面前，将豺狼人最后一根标枪踢到够不着的地方，巩固了她的统治地位，同时她将长而弯曲的剑入鞘，伸手去解她暴露的胸罩带子，准备享受她的战利品。然而，突然间，她的目光转向了山丘，察觉到了你的靠近。她的眼睛亮了起来，随意地踢了战败的豺狼人的头，将其击晕，然后再次拔出剑。伴随着一声野性的咆哮，她径直向你冲来！[pg]");
         }
         else
         {
            outputText("你正在离豺狼人营地不远的草原上探索，突然听到一声野蛮的战吼。你转过身，正好看到你之前交手过的火蜥蜴狂战士向你扑来，她的尾巴上燃烧着火焰，剑在空中划出一道弧线向你劈来。你迅速蹲下并翻滚，刚好躲过了第一波攻击，同时准备好你的[weapon]迎战。[pg]");
            outputText("[say:嘿，高手！]她说道，摆出战斗姿势，咧嘴笑着。[say:谁准备好再来一场了！？]");
         }
         unlockCodexEntry(2051);
         startCombat(new Hel());
      }
      
      public function dpHel() : void
      {
         spriteChooser();
         var _loc1_:int = get_player().cockThatFits(get_helFollower().heliaCapacity());
         var _loc2_:int = get_player().cockThatFits2(get_helFollower().heliaCapacity());
         clearOutput();
         get_images().showImage("helia-doublepenetration");
         outputText("你告诉她，是的，你想发泄一下。你开始解开你的[armor]，她的眼睛立刻睁得大大的。[say: 你还多长了点东西，是吧！]她大笑着，看起来印象深刻。[say: 好吧，我想我们也能照顾好那根 " + get_player().cockDescript(_loc2_) + "。只要坐下来放松就好，亲爱的！][pg]");
         outputText("你点点头，坐在高高的草丛上，你的火蜥蜴情人脱下衣服跨坐在你身上。她左手抓住你的 " + get_player().cockDescript(_loc1_) + "，右手抓住你的 " + get_player().cockDescript(_loc2_) + "，迅速开始套弄，让它们完全勃起，甚至还挤出了几滴先列腺液。这样弄了大概一分钟后，你已经硬得不能再硬了，看到这，火蜥蜴露出了如狼似虎的笑容。[pg]");
         outputText("[say: 哦，我想我知道我们都想要什么，]她说着，跪起身来，将你的 " + get_player().cockDescript(_loc1_) + " 的头部对准她的阴唇，并将你的 " + get_player().cockDescript(_loc2_) + " 滑入她肌肉发达的臀瓣之间。你倒吸了一口凉气，感觉到强烈的热量从她的穴口散发出来，让等待变得几乎无法忍受。[say: 别担心，亲爱的，]她笑着，慢慢地将自己刺穿在你的双茎上，[say: 我不会烧伤你的……暂时不会！]突然，她猛地坐下，将两根肉棒齐根没入。她因体内突然的充实感而狂喜地尖叫起来。她的头向后仰，舌头伸了出来；她暂时被自己的动作惊呆了，但慢慢恢复过来，几秒钟后就能开始在你的肉棒上起伏了。[pg]");
         outputText("[say: 必须承认，]她深吸了一口气，随着你的肉棒在体内退到头部，说道，");
         if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,786) == 0)
         {
            outputText("[say: 你是我的第一个多根肉棒。该死，从没想过会是这样！]");
         }
         else
         {
            outputText("[say: 你太棒了！我想我永远也习惯不了这样的性爱！]");
         }
         outputText("她说着，再次猛地坐下。你们俩都喘息着，在快感中呻吟，很快她几乎就在你的男子气概上跳跃，在她闷热的深处将你的两根肉棒榨干。你们保持这样长达一分钟，让她在你的肉棒上弹跳，同时她开始淫荡地呻吟。[pg]");
         outputText("[say: 哦，是的，操我的穴。就是这样！]她尖叫着，在高潮到来时夹紧了你的肉棒，并用双臂环住你的脖子，把你的脸按进她柔软的乳沟里，差点让你窒息。[pg]");
         outputText("这只会让你的高潮更加美妙。你最后几次挺动臀部顶入她体内，然后咆哮着在她体内爆发，将你的精液泵入她的阴道和屁股深处，用你的种子填满她，直到你的肉棒在里面软化，精液从你的肉棒周围溢出。慢慢地，她把你的头从她的胸前松开，尽管你很不情愿离开那充满欲望的深处。相反，你把她推倒仰面躺下，依偎在她的胸前，突然感到精疲力竭。[pg]");
         outputText("[say: 真他妈的爽，]火蜥蜴终于说道，咧嘴笑着，开始抚摸你的脸颊。[say: 哦，该死，两根肉棒真是太他妈棒了。]当你把脸颊依偎在她柔软的乳房上，慢慢进入愉快、宁静的梦乡时，她自言自语地笑着。");
         get_player().orgasm("Dick");
         var _loc3_:IMap = KFLAGS.flags;
         FlagDict_Impl_.arrayWriteInt(_loc3_,394,FlagDict_Impl_.arrayReadInt(_loc3_,394) + 1);
         _loc3_ = KFLAGS.flags;
         FlagDict_Impl_.arrayWriteInt(_loc3_,395,FlagDict_Impl_.arrayReadInt(_loc3_,395) + 1);
         _loc3_ = KFLAGS.flags;
         FlagDict_Impl_.arrayWriteInt(_loc3_,786,FlagDict_Impl_.arrayReadInt(_loc3_,786) + 1);
         get_helFollower().helAffection(5);
         if(get_game().get_inCombat())
         {
            get_combat().cleanupAfterCombat();
         }
         else
         {
            doNext(postHelFuckBuddyFollowup);
         }
      }
      
      public function declineHelSexings() : void
      {
         spriteChooser();
         clearOutput();
         outputText("你感谢她的好意，但婉言谢绝了。[pg]");
         if(get_game().get_inCombat())
         {
            outputText("[say: 哎，真扫兴。你真没意思，]她撅起嘴，捡起剑收回鞘中。[say: 好吧，至少拿着这个，]她补充道，朝你扔了几颗宝石。你向她道谢，看着她翻过山丘，朝着她要去的方向走去。");
         }
         outputText("[say: 下次见，朋友——也许到那时我们能找点乐子！]她回头喊道，并挥了挥手。[pg]");
         outputText("你点点头，向她挥手告别，然后回到了营地。");
         get_helFollower().helAffection(1);
         if(get_game().get_inCombat())
         {
            get_combat().cleanupAfterCombat();
         }
         else
         {
            doNext(get_camp().returnToCampUseOneHour);
         }
      }
      
      public function bugOutAfterHelMinoThreesome() : void
      {
         clearOutput();
         spriteChooser();
         outputText("转念一想，你宁愿现在保持简单，即使这意味着要用武力而不是言语来击退她未来的攻势。你再次吻了她，并在临走前捏了捏她的乳房，然后一言不发地起身离开。[pg]");
         FlagDict_Impl_.arrayWriteInt(KFLAGS.flags,395,0);
         doNext(get_camp().returnToCampUseOneHour);
      }
      
      public function berserkMode() : void
      {
         spriteChooser();
         clearOutput();
         outputText("你趁机询问了她那相当暴力、狂怒的战斗风格。[pg]");
         outputText("她笑了，从她嘴里发出的声音出奇地像个小女孩。[saystart]拜托，难道你从来没有气得想杀光所有东西吗？就是那种感觉。每天早上我离开营地的时候，我都会花一个小时左右的时间去想我讨厌的一切——恶魔，豺狼人");
         if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,397) == 0)
         {
            outputText("，那头肥牛伊莎贝拉");
         }
         outputText("——然后我就对我看到的任何东西发泄。嘿，别用那种眼神看我，你是我在这里遇到过的唯一一个还算过得去的人。[sayend][pg]");
         outputText("她又吻了你。[pg]");
         outputText("[say: ……而且你比还算过得去要好得多。][pg]");
         FlagDict_Impl_.arrayWriteInt(KFLAGS.flags,390,1);
         helChatMenu();
      }
      
      public function beatUpHelAndStealHerWalletFromHerVagina() : void
      {
         spriteChooser();
         clearOutput();
         get_images().showImage("helia-vagfuck");
         var _loc1_:int = get_player().cockThatFits(get_helFollower().heliaCapacity());
         outputText("你告诉她，当然，你可以发泄一下。她依然咧嘴笑着，脱下暴露的鳞片比基尼，仰面躺下，已经开始用手指抠弄自己的小穴。你也跟着脱下[armor]，跨坐在她的臀部上。她向前伸出手，用长着鳞片和爪子的手抓住了你的" + get_player().cockDescript(_loc1_) + "，让你心跳漏了一拍，然后她微笑着开始套弄。她的另一只手继续抠弄着小穴，为你的" + get_player().cockDescript(_loc1_) + "的插入做准备。你暂时满足于让她主导，抓住她宽阔的臀部，就在深红色鳞片变成柔软肌肤的上方，当她开始引导你进入她的肉缝时，你紧张了起来。[pg]");
         outputText("你阴茎的顶端擦过她小穴的阴唇——那里滚烫无比，让你在她的抓握下微微退缩。但这只火蜥蜴并没有松手，而是引导着你的龟头进入她滚烫的小穴，然后抓住你的" + get_player().assDescript() + "，用力一拉，将你剩下的部分全部推了进去！当她最深处爆炸般的热量淹没你时，你倒吸了一口凉气，除了她滚烫的小穴和收缩在你阴茎上的肌肉外，你的大脑对任何感觉都麻木了，她已经开始榨取你了。[pg]");
         outputText("你抓住她的臀部，开始向她体内挺进，你的节奏由她紧紧抓住你" + get_player().assDescript() + "的双手来引导和衡量。当你第一次拔出时，你被一种压倒性的凉爽感击中——当你抽出时，曾经看似炎热干燥的空气对你的阴茎来说却显得仁慈般凉爽。然而，当你只剩下龟头在外面时，她的双臂紧紧抱住你的屁股，开始把你往回推。你咧嘴一笑，猛地撞进她体内，让你火热的情人发出一声突如其来的愉悦呻吟。你加快了节奏，在她滚烫的深处进进出出，在凉爽的空气中穿梭，又快又狠地操着她。她在你的攻势下呻吟扭动，最终松开你的屁股，抓住她那又大又软的乳房，挤压着自己的乳头。[pg]");
         outputText("你坚持了几分钟，操着她滚烫的小穴，而她则玩弄着自己的乳房为你呻吟，但你能感觉到她的高潮就要来了——而你还没完事。她高潮了，小穴紧紧夹住你的" + get_player().cockDescript(_loc1_) + "，她向着天空高喊出她的愉悦，声音比任何战吼都要响亮，她把乳房挤在一起，像个荡妇一样弓起背。看到她巨大的乳房紧紧挤在一起，这个机会太好了，不容错过，你从她体内抽出，向前扑去，趁着她高潮时，用力将你的" + get_player().cockDescript(_loc1_) + "插进她柔软的乳房之间。[pg]");
         outputText("她因为这突如其来的变化喘息了一声，但随即对你露出了狼一般的笑容。她毫不迟疑地用手托起自己的乳房，开始在你的肉棒上套弄，拼命地挤压你的[cock]，同时她那灵活的尾巴滑入了她现在空虚的小穴，在她用乳交取悦你的同时取悦着自己。你抓住她的肩膀，被狂野的冲动所驱使，俯下身亲吻了这只火蜥蜴。她回应了你，将舌头伸进你的嘴里，并加倍用力地用乳房夹弄着你。[pg]");
         outputText("你终于高潮了！你咬紧牙关，从亲吻中抽离，向她的乳肉中做出了最后一次强有力的挺进。你的爱人没有停下，她将你的肉棒含入嘴里，开始用她的舌头、嘴唇和双手榨取它");
         if(get_player().hasVagina())
         {
            outputText("同时松开她的乳房去抠挖你的" + get_player().vaginaDescript(0));
         }
         outputText("。你用手穿过她的头发，一次又一次地将精液射入她的嘴里，直到她的脸颊开始鼓起。当你射完后，她大声地咽了下去，舔了舔嘴唇，对你咧嘴一笑，以至于有一小点精液从她的脸颊漏了出来。[pg]");
         outputText("精疲力竭的你忍不住瘫倒在她的乳沟里，你的脸颊靠在她柔软的乳房之间。你对她微笑，并托起其中一个，而她也微笑着开始抚摸你的脸颊。你的眼皮感觉很沉重，疲惫感开始席卷你。慢慢地，你在爱人的怀抱中进入了平静的梦乡。");
         get_player().orgasm("Generic");
         var _loc2_:IMap = KFLAGS.flags;
         FlagDict_Impl_.arrayWriteInt(_loc2_,394,FlagDict_Impl_.arrayReadInt(_loc2_,394) + 1);
         _loc2_ = KFLAGS.flags;
         FlagDict_Impl_.arrayWriteInt(_loc2_,395,FlagDict_Impl_.arrayReadInt(_loc2_,395) + 1);
         get_helFollower().helAffection(5);
         if(get_game().get_inCombat())
         {
            get_combat().cleanupAfterCombat();
         }
         else
         {
            doNext(postHelFuckBuddyFollowup);
         }
      }
      
      public function beatUpHel() : void
      {
         spriteChooser();
         clearOutput();
         if(get_monster().get_HP() < 1)
         {
            outputText("火蜥蜴无法抵挡你的猛攻，单膝跪地，勉强用剑支撑着身体。");
         }
         else
         {
            outputText("她气喘吁吁，双膝发抖，瘫倒在地上，沉重地倚靠在她的剑上。");
         }
         outputText("[pg]");
         if(get_player().cor < 85)
         {
            helDefeatedNormal();
         }
         else
         {
            helDefeatedCorrupt();
         }
      }
      
      public function askMommaHelForSecondsAfterDinner() : void
      {
         spriteChooser();
         clearOutput();
         outputText("你俯下身，抓住火蜥蜴丰满结实的屁股，咧嘴笑着问她是不是还想要。[pg]");
         outputText("[say: 随时奉陪，我的爱人，]她笑着，对你眨了眨眼。");
         if(get_player().get_lust() < 40)
         {
            get_player().set_lust(40);
            dynStats(DynStat.Lust(1));
         }
         helFuckMenu();
      }
      
      public function askHelAboutHer() : void
      {
         spriteChooser();
         clearOutput();
         outputText("你想了一会儿，然后问起她的情况。[pg]");
         outputText("[say: 谁，我？]她问道，似乎很惊讶。[say: 怎么……狂野的、匿名的性爱对你来说还不够好吗？再说，你也没有自我介绍过。][pg]");
         outputText("你笑了，向她伸出一只手。[say: 我叫[name]。很高兴认识你。][pg]");
         outputText("[say: 我是赫莉娅。或者叫我赫尔，如果你愿意的话。我也很高兴认识你，[name]，]她说着，握了握你的手。[pg]");
         outputText("你告诉她你作为村庄勇者的角色，以及你是如何来到这个陌生新世界的。你尽量长话短说，但即便如此，这也绝不是什么轻松的轶事。你把你的故事讲到了你们在这里相遇的时刻。你的爱人微笑着，俯下身，再次温柔地吻了你。[pg]");
         outputText("你花了一分钟时间恢复，然后问她有什么故事。[pg]");
         outputText("[say: 哦，没你那么宏大，] 她笑着，把脸颊贴在你的[chest]上。[say: 我没有什么催人泪下的故事；老实说，恶魔对我影响不大。我的父母是猎人，就在这片平原上。爸爸在我出生前就死了——在一次去山里的时候被一些鹰身女妖撕碎了。妈妈把我养大，教我如何战斗，如何在这里生存。那时我们还有其他人。十几个火蜥蜴。我被教导，每一个死去的同伴，都是仇恨和愤怒的理由，要疯狂地投入战斗，让敌人受苦——并且热爱每一次打击，每一次胜利，甚至热爱失败。但在这里生活很艰难。当恶魔没有出现时，豺狼人把我们一个个挑走，怪物们从四面八方来到平原上寻找食物和宝藏。][pg]");
         outputText("[say: 最终只剩下我一个人了。我对此感到愤怒和疯狂，但事实就是如此。那大概是一年前的事了，当时我部落的最后一个人被豺狼人当做俘虏带走了。从那以后我就一直在努力生存。杀戮，偷窃，强奸。然后你出现了。你是我在这里遇到的第一个能和我势均力敌的人。][pg]");
         outputText("她又给了你一个吻，然后陷入了沉默。");
         FlagDict_Impl_.arrayWriteInt(KFLAGS.flags,391,1);
         helChatMenu();
      }
      
      public function askHelAboutAttackingYou() : void
      {
         spriteChooser();
         clearOutput();
         FlagDict_Impl_.arrayWriteInt(KFLAGS.flags,393,0);
         outputText("既然你终于让这个好斗的火蜥蜴平静下来了，你问她为什么总是攻击你。[pg]");
         outputText("[say: 嘿，我没有别的意思。只是……有时候我控制不住自己。我在这里花了太长时间杀戮和强奸一切，我想我只是不知道还能怎么做。你知道我永远不会真的伤害你，对吧？哦，我只是在戏弄和玩耍，但你很特别。你是个好[guy]。我想是最好的之一。][pg]");
         outputText("你觉得你还是可以要求她停止攻击你。在这里少一个威胁总没坏处，也许——只是也许——你们见面时可以省去那些繁文缛节，直接进入真正有趣的部分。[pg]");
         FlagDict_Impl_.arrayWriteInt(KFLAGS.flags,392,1);
         menu();
         addButton(0,"停止",telHelSTOPATTACKINGMEYOUBITCH);
         addButton(1,"什么都不说",helChatMenu);
      }
   }
}

