package classes.scenes.dungeons.deepCave
{
   import classes.CoC;
   import classes.CockTypesEnum;
   import classes.DynStat;
   import classes.Monster;
   import classes.PerkLib;
   import classes.Player;
   import classes.StatusEffects;
   import classes.Vagina;
   import classes.internals.MonsterAI;
   import classes.internals.Utils;
   import classes.internals.WeightedChoice;
   import classes.items.ConsumableLib;
   import classes.scenes.combat.CombatRange;
   import flash.Boot;
   
   public class Zetaz extends Monster
   {
      
      public function Zetaz()
      {
         if(Boot.skip_constructor)
         {
            return;
         }
         super();
         set_a("");
         set_short("Zetaz");
         imageName = "zetaz";
         set_long("泽塔兹已经从一个小不点变成了你见过的最大的小恶魔！虽然他有着你所期望在小恶魔身上看到的熟悉的红色皮肤、弯曲的尖角和翅膀，但他的脚现在变成了蹄子，身体覆盖着厚厚的肌肉。如果外观的巨大变化能说明什么的话，那就是在过去的" + (get_game().time.days < 60 ? "几周" : "几个月") + "里，他不得不变得和你一样坚强。泽塔兹仍然穿着标志性的小恶魔缠腰布，尽管它随着他的动作而鼓起和移动，这表明他疲软时的尺寸相当可观，而且阴囊又大又饱满。他的肩膀上裹着镶钉的皮革，手腕上戴着金属护腕。这只小恶魔显然至少投资了一点额外的保护装备。看起来他没有携带武器。");
         set_race("Imp");
         createCock(Utils.rand(2) + 11,2.5,CockTypesEnum.DEMON);
         balls = 2;
         ballSize = 1;
         cumMultiplier = 3;
         set_hoursSinceCum(20);
         createBreastRow(0);
         ass.analLooseness = 1;
         ass.analWetness = 0;
         set_tallness(49);
         hips.rating = 0;
         butt.rating = 2;
         lowerBody.type = 14;
         skin.tone = "red";
         hair.color = "black";
         hair.length = 5;
         initStrTouSpeInte(65,60,45,52);
         initLibSensCor(55,35,100);
         set_weaponName("claws");
         set_weaponVerb("claw-slash");
         set_armorName("leathery skin");
         bonusHP = 350;
         set_lust(40);
         lustVuln = 0.35;
         temperment = 1;
         level = 12;
         set_gems(Utils.rand(55) + 150);
         additionalXP = 100;
         set_drop(new WeightedChoice(get_consumables().BIMBOLQ,1));
         wings.type = 5;
         createPerk(PerkLib.ImprovedSelfControl,0,0,0,0);
         checkMonster();
      }
      
      public function zetazTaunt() : void
      {
         if(!hasStatusEffect(StatusEffects.round))
         {
            createStatusEffect(StatusEffects.round,1,0,0,0);
            outputText("泽塔兹问道，[saystart]你到底知不知道你把我的生活搞得有多糟，");
            if(get_player().humanScore() >= 4)
            {
               outputText("人类");
            }
            else
            {
               outputText("“人类”");
            }
            outputText("？不，当然没有。这就是我期望从你们这种人身上看到的态度！[sayend]");
         }
         else
         {
            addStatusValue(StatusEffects.round,1,1);
            if(statusEffectv1(StatusEffects.round) == 2)
            {
               outputText("[say:我失去了我的职位！而且当你搞砸了工厂的时候？我差点连命都没了！你毁了所有的一切！]泽塔兹尖叫道。");
            }
            else if(statusEffectv1(StatusEffects.round) == 3)
            {
               outputText("泽塔兹咆哮着，[say:你知道躲避莉希丝有多难吗？你到底知不知道！？我不得不住在这个臭气熏天的丛林里，就在我找到一些朋友，让这里变得适合居住的时候，你出现了，毁了所有的一切！]");
            }
            else if(statusEffectv1(StatusEffects.round) == 4)
            {
               outputText("泽塔兹解释道，[say:我不会放你走的。我要打垮你。]");
            }
            else if(statusEffectv1(StatusEffects.round) == 5)
            {
               outputText("[say:顺从我真的有那么糟糕吗？你见过工厂。我们会让你吃饱穿暖，并为你提供无尽的快乐。你会尝到天堂的滋味，并为一个更伟大的目标服务。现在还不晚。如果你心甘情愿地跟我走，我可以确保他们找到一台好机器来榨干你，]小恶魔领主提议道。");
            }
            else if(statusEffectv1(StatusEffects.round) == 6)
            {
               outputText("[say:你为什么还不倒下？]泽塔兹难以置信地质问。");
            }
            else if(statusEffectv1(StatusEffects.round) == 7)
            {
               outputText("小恶魔领主建议道，[say:如果你放弃并让我操你的屁股，也许我会放你走。]");
            }
            else if(statusEffectv1(StatusEffects.round) == 8)
            {
               outputText("泽塔兹喘着粗气，[say:放弃吧！我可不像你很久以前遇到的那个弱者！我是经历了地狱才来到这里的，我不会因为你出现来破坏我的心血就放弃它！]");
            }
            else
            {
               outputText("他默默地瞪着你。");
            }
         }
      }
      
      override public function won(param1:Boolean, param2:Boolean = false) : void
      {
         if(param2)
         {
            outputText("[pg]你的敌人似乎并没有被吓退到在意的地步……");
            doNext(get_game().combat.endLustLoss);
         }
         else
         {
            get_game().dungeons.deepcave.loseToZetaz();
         }
      }
      
      public function potion() : void
      {
         outputText("泽塔兹从抽屉里抓起一个瓶子，朝你的方向掷来！");
         if(get_player().hasPerk(PerkLib.Evade) && Utils.rand(4) == 0 || get_player().hasPerk(PerkLib.Flexibility) && Utils.rand(6) == 0 || get_player().get_spe() > 65 && Utils.rand(10) == 0 || get_player().hasPerk(PerkLib.Misdirection) && Utils.rand(100) < 20 && get_player().get_armorName() == "red, high-society bodysuit")
         {
            outputText("你在瓶子砸在墙上粉碎的前一刻侧身躲开，红色的液体浸透了挂毯！");
         }
         else
         {
            outputText("你试图躲避，但脆弱的玻璃在你身上碎裂，让你沾满了黏糊糊的红色液体。它渗入你的[skindesc]中，留下一阵令人愉悦的刺痛感。哦，不……");
            if(!get_player().hasStatusEffect(StatusEffects.TemporaryHeat))
            {
               get_player().createStatusEffect(StatusEffects.TemporaryHeat,0,1,0,0);
            }
         }
      }
      
      override public function performCombatAction() : void
      {
         zetazTaunt();
         outputText("[pg]");
         if(get_lust() > 50 && HPRatio() <= 0.5)
         {
            outputText("小恶魔领主因伤痛和从他破烂的缠腰布下升起的跳动阴茎而颤抖。他抚摸着它，低声嘟囔了一会儿。你太专注于看他自慰的奇观了，差点没看到他的瘀伤和伤口正在愈合！泽塔兹松开了他肿胀的阴茎，它稍微瘪了下去。他用某种黑魔法将他的一些欲望转化为了生命值！");
            addHP(0.25 * maxHP());
            set_lust(get_lust() - 20);
            get_player().takeLustDamage(2,true);
            return;
         }
         var _loc1_:MonsterAI = new MonsterAI();
         _loc1_.add(potion,1,true,10,FATIGUE_PHYSICAL,CombatRange.Tease);
         _loc1_.add(gust,1,true,10,FATIGUE_PHYSICAL,CombatRange.Omni);
         _loc1_.add(gigaArouse,1,true,10,FATIGUE_MAGICAL,CombatRange.Tease);
         _loc1_.add(eAttack,1,true,0,FATIGUE_PHYSICAL,CombatRange.Melee);
         _loc1_.exec();
      }
      
      override public function handleFear() : Boolean
      {
         if(get_lust() > 50)
         {
            set_lust(get_lust() - 10);
            outputText("泽塔兹眨了眨眼，一边抚摸自己一边摇了摇头。一秒钟后，他肿胀的阴茎失去了一些硬度，但他的目光变得清晰了。他不知怎么地消耗了他的一些欲望来清除你的魔法！");
            return true;
         }
         return Boolean(super.handleFear());
      }
      
      override public function handleBlind() : Boolean
      {
         if(get_lust() > 50)
         {
            set_lust(get_lust() - 10);
            outputText("泽塔兹眨了眨眼，一边抚摸自己一边摇了摇头。一秒钟后，他肿胀的阴茎失去了一些硬度，但他的目光变得清晰了。他不知怎么地消耗了他的一些欲望来清除你的魔法！");
            return true;
         }
         return Boolean(super.handleBlind());
      }
      
      public function gust() : void
      {
         var _loc1_:Number = NaN;
         outputText("小恶魔猛地一跃跳到半空中，用力拍打着翅膀，悬浮在卧室的中央。他飞行的力量扬起灰尘，让房间变成了一场令人致盲的龙卷风！小物件砸在你身上，");
         if(get_player().get_tou() > 60)
         {
            outputText("造成了轻微的伤害");
         }
         else
         {
            _loc1_ = 1 + Utils.rand(6);
            outputText("让你受了点轻伤");
            get_player().takeDamage(_loc1_,true);
         }
         outputText("同时灰尘迷住了你的眼睛，让你暂时失明！");
         get_player().createStatusEffect(StatusEffects.Blind,1,0,0,0);
      }
      
      public function gigaArouse() : void
      {
         outputText("你看到" + get_a() + Utils.cnName(get_short()) + "对你做出熟悉的奥术手势，但他的动作看起来比你预想的小恶魔要夸张得多。[pg]");
         var _loc1_:CoC = get_game();
         var _loc2_:Array = [DynStat.Lust(Utils.rand(get_player().lib / 10) + get_player().cor / 10 + 15)];
         if(int(_loc2_.length) == 0)
         {
            _loc1_.player.dynStats();
         }
         else if(int(_loc2_.length) == 1)
         {
            _loc1_.player.dynStats(_loc2_[0]);
         }
         else if(int(_loc2_.length) == 2)
         {
            _loc1_.player.dynStats(_loc2_[0],_loc2_[1]);
         }
         else if(int(_loc2_.length) == 3)
         {
            _loc1_.player.dynStats(_loc2_[0],_loc2_[1],_loc2_[2]);
         }
         else if(int(_loc2_.length) == 4)
         {
            _loc1_.player.dynStats(_loc2_[0],_loc2_[1],_loc2_[2],_loc2_[3]);
         }
         else if(int(_loc2_.length) == 5)
         {
            _loc1_.player.dynStats(_loc2_[0],_loc2_[1],_loc2_[2],_loc2_[3],_loc2_[4]);
         }
         else if(int(_loc2_.length) == 6)
         {
            _loc1_.player.dynStats(_loc2_[0],_loc2_[1],_loc2_[2],_loc2_[3],_loc2_[4],_loc2_[5]);
         }
         else if(int(_loc2_.length) == 7)
         {
            _loc1_.player.dynStats(_loc2_[0],_loc2_[1],_loc2_[2],_loc2_[3],_loc2_[4],_loc2_[5],_loc2_[6]);
         }
         else if(int(_loc2_.length) == 8)
         {
            _loc1_.player.dynStats(_loc2_[0],_loc2_[1],_loc2_[2],_loc2_[3],_loc2_[4],_loc2_[5],_loc2_[6],_loc2_[7]);
         }
         else if(int(_loc2_.length) == 9)
         {
            _loc1_.player.dynStats(_loc2_[0],_loc2_[1],_loc2_[2],_loc2_[3],_loc2_[4],_loc2_[5],_loc2_[6],_loc2_[7],_loc2_[8]);
         }
         else if(int(_loc2_.length) == 10)
         {
            _loc1_.player.dynStats(_loc2_[0],_loc2_[1],_loc2_[2],_loc2_[3],_loc2_[4],_loc2_[5],_loc2_[6],_loc2_[7],_loc2_[8],_loc2_[9]);
         }
         else if(int(_loc2_.length) == 11)
         {
            _loc1_.player.dynStats(_loc2_[0],_loc2_[1],_loc2_[2],_loc2_[3],_loc2_[4],_loc2_[5],_loc2_[6],_loc2_[7],_loc2_[8],_loc2_[9],_loc2_[10]);
         }
         else if(int(_loc2_.length) == 12)
         {
            _loc1_.player.dynStats(_loc2_[0],_loc2_[1],_loc2_[2],_loc2_[3],_loc2_[4],_loc2_[5],_loc2_[6],_loc2_[7],_loc2_[8],_loc2_[9],_loc2_[10],_loc2_[11]);
         }
         else if(int(_loc2_.length) == 13)
         {
            _loc1_.player.dynStats(_loc2_[0],_loc2_[1],_loc2_[2],_loc2_[3],_loc2_[4],_loc2_[5],_loc2_[6],_loc2_[7],_loc2_[8],_loc2_[9],_loc2_[10],_loc2_[11],_loc2_[12]);
         }
         else if(int(_loc2_.length) == 14)
         {
            _loc1_.player.dynStats(_loc2_[0],_loc2_[1],_loc2_[2],_loc2_[3],_loc2_[4],_loc2_[5],_loc2_[6],_loc2_[7],_loc2_[8],_loc2_[9],_loc2_[10],_loc2_[11],_loc2_[12],_loc2_[13]);
         }
         else if(int(_loc2_.length) == 15)
         {
            _loc1_.player.dynStats(_loc2_[0],_loc2_[1],_loc2_[2],_loc2_[3],_loc2_[4],_loc2_[5],_loc2_[6],_loc2_[7],_loc2_[8],_loc2_[9],_loc2_[10],_loc2_[11],_loc2_[12],_loc2_[13],_loc2_[14]);
         }
         else if(int(_loc2_.length) == 16)
         {
            _loc1_.player.dynStats(_loc2_[0],_loc2_[1],_loc2_[2],_loc2_[3],_loc2_[4],_loc2_[5],_loc2_[6],_loc2_[7],_loc2_[8],_loc2_[9],_loc2_[10],_loc2_[11],_loc2_[12],_loc2_[13],_loc2_[14],_loc2_[15]);
         }
         else if(int(_loc2_.length) == 17)
         {
            _loc1_.player.dynStats(_loc2_[0],_loc2_[1],_loc2_[2],_loc2_[3],_loc2_[4],_loc2_[5],_loc2_[6],_loc2_[7],_loc2_[8],_loc2_[9],_loc2_[10],_loc2_[11],_loc2_[12],_loc2_[13],_loc2_[14],_loc2_[15],_loc2_[16]);
         }
         else if(int(_loc2_.length) == 18)
         {
            _loc1_.player.dynStats(_loc2_[0],_loc2_[1],_loc2_[2],_loc2_[3],_loc2_[4],_loc2_[5],_loc2_[6],_loc2_[7],_loc2_[8],_loc2_[9],_loc2_[10],_loc2_[11],_loc2_[12],_loc2_[13],_loc2_[14],_loc2_[15],_loc2_[16],_loc2_[17]);
         }
         else if(int(_loc2_.length) == 19)
         {
            _loc1_.player.dynStats(_loc2_[0],_loc2_[1],_loc2_[2],_loc2_[3],_loc2_[4],_loc2_[5],_loc2_[6],_loc2_[7],_loc2_[8],_loc2_[9],_loc2_[10],_loc2_[11],_loc2_[12],_loc2_[13],_loc2_[14],_loc2_[15],_loc2_[16],_loc2_[17],_loc2_[18]);
         }
         else
         {
            if(int(_loc2_.length) != 20)
            {
               throw "Too many rest arguments";
            }
            _loc1_.player.dynStats(_loc2_[0],_loc2_[1],_loc2_[2],_loc2_[3],_loc2_[4],_loc2_[5],_loc2_[6],_loc2_[7],_loc2_[8],_loc2_[9],_loc2_[10],_loc2_[11],_loc2_[12],_loc2_[13],_loc2_[14],_loc2_[15],_loc2_[16],_loc2_[17],_loc2_[18],_loc2_[19]);
         }
         if(get_player().get_lust100() < 30)
         {
            outputText("你的下体随着令人愉悦的温暖而跳动，让你回想起美好的性爱记忆。");
         }
         if(get_player().get_lust100() >= 30 && get_player().get_lust100() < 60)
         {
            outputText("随着你的身体被一阵情欲的狂潮击中，血液迅速涌向你的腹股沟。");
         }
         if(get_player().get_lust100() >= 60)
         {
            outputText("你闭上眼睛，想象着自己给泽塔兹口交，然后骑在他身上，让他用你诱人的肉体满足他的欲望，你的嘴巴开始流口水。这不自然的幻象将强烈的欲望脉冲传遍你的全身，让你的身体都在颤抖。");
         }
         if(int(get_player().cocks.length) > 0)
         {
            if(get_player().get_lust100() >= 60 && int(get_player().cocks.length) > 0)
            {
               outputText("你感觉到" + get_player().SMultiCockDesc() + "滴下先列腺液，随着你的每一次心跳而跳动，渴望被触摸。");
            }
            if(get_player().get_lust100() >= 30 && get_player().get_lust100() < 60 && int(get_player().cocks.length) == 1)
            {
               outputText(get_player().SMultiCockDesc() + "变硬并抽搐着，让你更加分心。");
            }
         }
         if(int(get_player().vaginas.length) > 0)
         {
            if(get_player().get_lust100() >= 60 && get_player().vaginas[0].vaginalWetness == 1 && int(get_player().vaginas.length) == 1)
            {
               outputText("你的[vagina]明显变湿了，感觉非常空虚。");
            }
            if(get_player().get_lust100() >= 60 && get_player().vaginas[0].vaginalWetness == 2 && int(get_player().vaginas.length) > 0)
            {
               outputText("你的胯部因为女孩的欲望变得黏糊糊的，这清楚地向" + get_a() + Utils.cnName(get_short()) + "表明你的身体有多么欢迎这个法术。");
            }
            if(get_player().get_lust100() >= 60 && get_player().vaginas[0].vaginalWetness == 3 && int(get_player().vaginas.length) == 1)
            {
               outputText("你的[vagina]变得泥泞湿润，滴落着渴望被骑乘和操弄的欲望。");
            }
            if(get_player().get_lust100() >= 60 && get_player().vaginas[0].vaginalWetness == 4 && int(get_player().vaginas.length) > 0)
            {
               outputText("当你的胯部屈服于恶魔的魔法时，浓稠的爱液顺着你的大腿内侧流下。你想知道" + get_a() + Utils.cnName(get_short()) + "的阴茎在你体内的感觉会是什么样？");
            }
            if(get_player().get_lust100() >= 60 && get_player().vaginas[0].vaginalWetness == 5 && int(get_player().vaginas.length) == 1)
            {
               outputText("你的[vagina]瞬间用你渴望的醉人证据浸湿了你的腹股沟。你想知道当" + get_a() + Utils.cnName(get_short()) + "的阴茎插入你体内时，你能让它变得多滑？");
            }
         }
         if(get_player().get_lust() >= get_player().maxLust())
         {
            doNext(get_game().combat.endLustLoss);
         }
      }
      
      override public function defeated(param1:Boolean) : void
      {
         get_game().dungeons.deepcave.defeatZetaz();
      }
   }
}

