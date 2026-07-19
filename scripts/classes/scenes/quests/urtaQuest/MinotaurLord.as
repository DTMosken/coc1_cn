package classes.scenes.quests.urtaQuest
{
   import classes.CoC;
   import classes.CockTypesEnum;
   import classes.Creature;
   import classes.ItemType;
   import classes.Monster;
   import classes.Player;
   import classes.ReactionContext;
   import classes.StatusEffects;
   import classes._FlagDict.FlagDict_Impl_;
   import classes.internals.ChainedDrop;
   import classes.internals.MonsterAI;
   import classes.internals.Utils;
   import classes.items.ConsumableLib;
   import classes.items.Weapon;
   import classes.scenes.combat.AvoidDamageParameters;
   import classes.scenes.combat.CombatRange;
   import flash.Boot;
   import haxe.IMap;
   
   public class MinotaurLord extends Monster
   {
      
      public function MinotaurLord()
      {
         if(Boot.skip_constructor)
         {
            return;
         }
         super();
         set_a("");
         set_short("minotaur lord");
         imageName = "minotaurlord";
         if(FlagDict_Impl_.arrayReadFloat(get_flags(),711) == 0.75)
         {
            set_long("在你面前的是你见过的最大的牛头怪。这个毛茸茸的怪物足有十一英尺高，肌肉厚实到即使隔着厚厚的毛发也清晰可见。一个带有标签的皮项圈表明了他作为“宠物”的身份，尽管这在力大无穷的牛头怪身上显得格格不入。他的双腿和双臂就像粗壮的树干，令人敬畏且不可阻挡，每一次动作都凶猛地弯曲着。这只能是一个牛头怪领主，一个在力量和男子气概上远超他那些低级同类的牛头怪。在他的手中，挥舞着一条巨大的链条，连接在他的项圈上，但现在被用作临时武器。一块简单的遮羞布围在他的腹股沟上，但这几乎无法掩盖那巨大、勃起的长度，把它撑得像个帐篷。它看起来更像是一个简单的布制避孕套，而不是任何种类的衣服，长长的、散发着麝香的先列腺液像丝带一样滴落在地上。在下面，沉重的睾丸，每一个都轻易有篮球那么大，在一个紧绷的、晃荡的阴囊里摇摆。你几乎能闻到他为你准备的液体恩赐，他散发出的麝香让你觉得这是个好主意……");
         }
         else
         {
            set_long("在你面前的是你见过的最大的牛头怪。这个毛茸茸的怪物足有十一英尺高，肌肉厚实到即使隔着厚厚的毛发也清晰可见。他的双腿和双臂就像粗壮的树干，令人敬畏且不可阻挡，每一次动作都凶猛地弯曲着。这只能是一个牛头怪领主，一个在力量和男子气概上远超他那些低级同类的牛头怪。在他的手中，挥舞着一条巨大的链条，连接在他的项圈上，但现在被用作临时武器。一块简单的遮羞布围在他的腹股沟上，但这几乎无法掩盖那巨大、勃起的长度，把它撑得像个帐篷。它看起来更像是一个简单的布制避孕套，而不是任何种类的衣服，长长的、散发着麝香的先列腺液像丝带一样滴落在地上。在下面，沉重的睾丸，每一个都轻易有篮球那么大，在一个紧绷的、晃荡的阴囊里摇摆。你几乎能闻到他为你准备的液体恩赐，他散发出的麝香让你觉得这是个好主意……");
         }
         set_race("Minotaur");
         createCock(Utils.rand(37),2 + Utils.rand(3),CockTypesEnum.HORSE);
         balls = 2;
         ballSize = 2 + Utils.rand(13);
         cumMultiplier = 1.5;
         set_hoursSinceCum(ballSize * 10);
         createBreastRow(0);
         ass.analLooseness = 4;
         ass.analWetness = 1;
         createStatusEffect(StatusEffects.BonusACapacity,50,0,0,0);
         set_tallness(132);
         hips.rating = 4;
         butt.rating = 5;
         lowerBody.type = 1;
         skin.tone = "red";
         skin.type = 1;
         skin.desc = "shaggy fur";
         var _loc1_:Array = ["black","brown"];
         var _loc2_:String = _loc1_[Utils.rand(int(_loc1_.length))];
         hair.color = _loc2_;
         hair.length = 3;
         face.type = 3;
         initStrTouSpeInte(125,90,30,30);
         initLibSensCor(70,25,85);
         set_weaponName("chain");
         set_weaponVerb("chain-whip");
         set_weaponAttack(50);
         normalAttackAvoid.doParry = false;
         normalAttackAvoid.doCounter = false;
         set_armorName("thick fur");
         bonusHP = 700;
         set_lust(50);
         lustVuln = 0.33;
         temperment = 1;
         level = 15;
         additionalXP = 50;
         set_gems(Utils.rand(15) + 25);
         if(FlagDict_Impl_.arrayReadFloat(get_flags(),711) != 0.75)
         {
            set_drop(new ChainedDrop().add(get_consumables().MINOCUM,0.2).add(get_consumables().MINOBLO,0.5).elseDrop(null));
         }
         else
         {
            set_drop(NO_DROP);
         }
         tail.type = 4;
         special1 = get_game().mountain.minotaurScene.minoPheromones;
         checkMonster();
      }
      
      override public function won(param1:Boolean, param2:Boolean = false) : void
      {
         if(FlagDict_Impl_.arrayReadFloat(get_flags(),711) == 0.75)
         {
            if(param1)
            {
               get_game().urtaQuest.urtaLosesToMinotaurRoughVersion();
            }
            else
            {
               get_game().urtaQuest.urtaSubmitsToMinotaurBadEnd();
            }
         }
         else
         {
            get_game().mountain.minotaurScene.getRapedByMinotaur();
         }
      }
      
      override public function struggle() : void
      {
         if(get_player().hasStatusEffect(StatusEffects.MinotaurEntangled))
         {
            clearOutput();
            if(get_player().get_str() / 9 + Utils.rand(20) + 1 >= 15)
            {
               outputText("你用尽每一分力量和狡黠，疯狂地扭动着，从锁链抓握的薄弱处挣脱出来，重获自由！成功了！[pg]");
               get_player().removeStatusEffect(StatusEffects.MinotaurEntangled);
               if(FlagDict_Impl_.arrayReadFloat(get_flags(),711) == 0.75)
               {
                  outputText("[say:不！你个蠢货！你让她跑了！快点解决她！我需要我的那份！]魅魔愤怒地啐道。[pg]");
               }
            }
            else
            {
               outputText("你拼命扭动挣扎，但锁链依然死死地勒着，将你绑在原地。该死！你不能就这样输掉！[pg]");
            }
         }
      }
      
      override public function react(param1:ReactionContext) : Boolean
      {
         var _loc2_:int = 0;
         if(param1.index == 3)
         {
            if(get_player().hasStatusEffect(StatusEffects.MinotaurEntangled))
            {
               clearOutput();
               outputText("你叹了口气，在锁链中放松下来，注视着那个天赋异禀的牛头人，等待着他想要施加的任何粗暴对待。他那充满麝香味、纯粹的雄性气息随风飘向你，你感觉到情欲的液滴顺着大腿流下。看着先列腺液从他的蛋蛋上滴落，你舔了舔嘴唇，渴望能趴下去膜拜它们。你为什么还要试图反抗这种命运呢？");
               _loc2_ = 30 + Utils.rand(5);
               get_player().takeLustDamage(_loc2_,true,false);
               return false;
            }
         }
         return true;
      }
      
      override public function performCombatAction() : void
      {
         if(get_player().hasStatusEffect(StatusEffects.MinotaurEntangled))
         {
            minotaurCumPress();
            return;
         }
         var _loc1_:MonsterAI = new MonsterAI();
         _loc1_.add(minotaurDrankMalk,1,get_HP() < 300 && statusEffectv1(StatusEffects.MinoMilk) < 4 && FlagDict_Impl_.arrayReadFloat(get_flags(),711) == 0.75,10,FATIGUE_MAGICAL_HEAL,CombatRange.Self);
         _loc1_.add(minotaurDisarm,0.25,get_player().canDisarm(),10,FATIGUE_PHYSICAL,CombatRange.Ranged);
         _loc1_.add(minotaurLordEntangle,1,!hasStatusEffect(StatusEffects.Timer) && !get_player().hasStatusEffect(StatusEffects.MinotaurEntangled),10,FATIGUE_PHYSICAL,CombatRange.Ranged);
         _loc1_.add(minotaurPrecumTease,0.5,true,0,FATIGUE_NONE,CombatRange.Tease);
         _loc1_.add(eAttack,2,true,0,FATIGUE_NONE,CombatRange.Ranged);
         _loc1_.exec();
      }
      
      public function minotaurPrecumTease() : void
      {
         outputText("牛头人对你笑了笑，掀起他的缠腰布，向你弹了一下。浓稠的先列腺液在空中成群结队地飞舞，");
         if(Utils.rand(2) == 0)
         {
            outputText("在你反应过来之前就拍到了你的脸上！你擦去眼睛和鼻子上那黏糊糊的像鼻涕一样的东西，");
            if(get_player().get_lust100() >= 70)
            {
               outputText("想都没想就吞进了嘴里。你贪婪地大口吞咽着这强效的、令人迷醉的催情剂，甚至还依次舔舐了每根手指，将每一滴都吸进你那饥渴的喉咙里。");
            }
            else
            {
               outputText("感觉你的心脏因为欲望而狂跳。");
            }
            get_player().takeLustDamage(15 + get_player().lib / 8 + get_player().sens / 8);
         }
         else
         {
            outputText("擦过你的头，但光是那气味就足以让你双腿发软。");
            if(FlagDict_Impl_.arrayReadFloat(get_flags(),711) == 0.75)
            {
               outputText("那野兽般的气味似乎钻进了你的体内，麝香般的香气在你的腹股沟烧出一条液态的火路，让你的马鸡巴硬得离谱。");
            }
            else
            {
               outputText("那野兽般的气味似乎钻进了你的体内，麝香般的香气在你的腹股沟烧出一条液态的火路。");
            }
            get_player().takeLustDamage(11 + get_player().lib / 10);
         }
         if(get_player().get_lust100() <= 75)
         {
            outputText("你因渴望而颤抖，只想把脸埋在那块遮羞布下，吸干每一滴黏稠的美味。");
         }
         else
         {
            outputText("<b>你呻吟着，一遍又一遍地舔着嘴唇，渴望在嘴里尝到他的味道。</b>");
         }
      }
      
      public function minotaurLordEntangle() : void
      {
         outputText("牛头人领主挥舞着他的锁链，在空中划出一道宽阔的弧线！\n");
         createStatusEffect(StatusEffects.Timer,2 + Utils.rand(4),0,0,0);
         if(Boolean(combatAvoidDamage(new AvoidDamageParameters(true,false,false,null,null,null,null,null)).attackFailed))
         {
            outputText("你跳过了这笨拙的挥击，让锁链从你身下无害地飞过！");
         }
         else
         {
            outputText("你试图躲避，但你太慢了，锁链抽打在你的臀部，即使隔着盔甲，强大的冲击力也让你痛苦地瘀伤了。惯性带着鞭子的后半部分绕着你转，一秒钟内，锁链就把你紧紧缠住，你的手臂被固定在身体两侧，行动受限。");
            if(FlagDict_Impl_.arrayReadFloat(get_flags(),711) == 0.75)
            {
               outputText("[pg][say: 哈哈哈！好孩子，菲多！把那个婊子拴起来！] 魅魔高兴地大笑。");
            }
            outputText("[pg]<b>你被牛头人领主的锁链缠住了，任由他摆布，除非你能挣脱！</b>");
            get_player().createStatusEffect(StatusEffects.MinotaurEntangled,0,0,0,0);
         }
      }
      
      public function minotaurDrankMalk() : void
      {
         outputText("牛头人领主大声地哼了一声，转头看向他的女主人。[say:怎么了，菲多，[boy]？你渴了吗？]庞大的牛头人点了点头。");
         if(statusEffectv1(StatusEffects.MinoMilk) < 3)
         {
            outputText("[say:接住！]魅魔向牛头人扔去一个装有乳白色物质的瓶子。他一把抓住并拔开瓶塞，满脸享受地迅速将里面的东西一饮而尽。喝完后，他看起来更加精力充沛，准备好战斗了，而且他的肉棒看起来也更硬了！");
            addHP(300);
            set_lust(get_lust() + 10);
            if(!hasStatusEffect(StatusEffects.MinoMilk))
            {
               createStatusEffect(StatusEffects.MinoMilk,1,0,0,0);
            }
            else
            {
               addStatusValue(StatusEffects.MinoMilk,1,1);
            }
         }
         else
         {
            outputText("[say:那太糟糕了！我们的奶都喝光了……不过别担心，我亲爱的宠物，等你解决掉这个贱人后，我会让你想喝多少就喝多少。]魅魔漫不经心地检查着自己长长的指甲，回答道。");
            outputText("[pg]牛头人瞪着你，打了个响鼻，显然对没有得到他的那份感到非常生气……");
            addStatusValue(StatusEffects.MinoMilk,1,1);
         }
      }
      
      public function minotaurDisarm() : void
      {
         if(FlagDict_Impl_.arrayReadFloat(get_flags(),711) == 0.75)
         {
            outputText("这个巨型牛头人威胁地将他的锁链举到半空中，显然是想把你打倒。凭借你训练有素的反应，你迅速用你的戟挡住了他的攻击。当锁链伴随着一声巨响撞击在你的戟上并缠绕在上面时，你向后退缩了。你得意地对牛头人笑了笑，却只看到他轻蔑的笑容。他用力一拉，把戟从你手中夺走，扔到了房间的角落里。该死！");
            outputText("[pg]魅魔疯狂地大笑起来。[say: 好孩子，菲多！把那个狐狸婊子的玩具拿走，这样她就更容易玩弄了！] 牛头人挺起胸膛，为取悦了女主人而感到自豪。");
            get_player().setUnarmed();
         }
         else
         {
            outputText("这个巨型牛头人威胁地将他的锁链举到半空中，显然是想把你打倒。凭借你训练有素的反应，你迅速用你的[weapon]挡住了他的攻击。当锁链伴随着一声巨响撞击在你的[weapon]上并缠绕在上面时，你向后退缩了。你得意地对牛头人笑了笑，却只看到他轻蔑的笑容。");
            if(!get_player().get_weapon().isAttached())
            {
               outputText("他用力一拉，把[weapon]从你手中夺走，扔到了房间的角落里。该死！");
               get_player().disarm();
            }
         }
      }
      
      public function minotaurCumPress() : void
      {
         outputText("牛头人领主拉扯着锁链的末端，把你拉向他，让你转了一圈又一圈，转得你头晕目眩。你能感觉到锁链从你的[skinfurscales]上松开，你离他越近，你的活动空间就越大。然而，头晕让你除了跌跌撞撞之外很难做任何事情。你扑通一声撞到了什么湿润、粘稠、海绵状的东西上。你喘着粗气，吸入了一大口牛头人的麝香，这让你的头以一种完全不同的方式旋转起来。你把自己从你降落的那个汗流浃背、浸满精液的睾丸上拉开，抬起头，欣赏着那高耸的马屌，上面有三圈包皮。一滴像你头一样大的先列腺液砸在你的脸上，让你踉跄后退，用麻醉般的欲望迟钝了你的感官。你跌倒在几英尺外的膝盖上，强迫性地舔舐着它。一旦它消失了，");
         if(get_player().get_lust() >= get_player().maxLust())
         {
            outputText("你站起来，饥渴难耐，想要更多。");
         }
         else
         {
            outputText("你意识到你一直在做什么。你的尴尬给了你重新摆出战斗姿势的力量，但这很难，因为");
            if(get_player().hasCock())
            {
               outputText("坚硬");
               if(get_player().get_lust100() >= 80)
               {
                  outputText("且滴着水");
               }
               outputText("你的肉棒已经变成了这样。");
            }
            else if(get_player().hasVagina())
            {
               outputText("你的小穴变得湿润了。");
            }
            else
            {
               outputText("你的腹股沟感到兴奋。");
            }
            outputText("你想再尝一次……");
         }
         get_player().takeLustDamage(22 + get_player().lib / 8 + get_player().sens / 8);
         get_player().removeStatusEffect(StatusEffects.MinotaurEntangled);
      }
      
      override public function defeated(param1:Boolean) : void
      {
         get_game().clearOutput();
         outputText("牛头怪领主被击败了！");
         if(FlagDict_Impl_.arrayReadFloat(get_flags(),711) == 0.75)
         {
            outputText("在继续前进之前，你可以用他来快速来一发，满足你的欲望。你要这么做吗？");
            get_game().output.menu();
            get_game().output.addButton(0,"操他",get_game().urtaQuest.winRapeAMinoLordAsUrta);
            get_game().output.addButton(14,"离开",get_game().urtaQuest.beatMinoLordOnToSuccubi);
         }
         else
         {
            get_game().mountain.minotaurScene.minoVictoryRapeChoices();
         }
      }
   }
}

