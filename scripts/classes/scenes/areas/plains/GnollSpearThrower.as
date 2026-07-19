package classes.scenes.areas.plains
{
   import classes.Appearance;
   import classes.CoC;
   import classes.Creature;
   import classes.Monster;
   import classes.PerkLib;
   import classes.Player;
   import classes.StatusEffects;
   import classes.internals.ChainedDrop;
   import classes.internals.MonsterAI;
   import classes.internals.Utils;
   import classes.items.ConsumableLib;
   import classes.scenes.combat.AvoidDamageParameters;
   import classes.scenes.combat.CombatRange;
   import flash.Boot;
   
   public class GnollSpearThrower extends Monster
   {
      
      public function GnollSpearThrower()
      {
         if(Boot.skip_constructor)
         {
            return;
         }
         super();
         set_a("");
         set_short("gnoll spear-thrower");
         imageName = "gnollspearthrower";
         set_long("你正在和一只豺狼人战斗。她是性感丰满的女人和暴躁愤怒的鬣狗的混合体，显然打算惩罚你这个入侵者。她深褐色的" + (get_game().get_noFur() ? "皮肤在身体的大部分地方都暴露在外，只有小腿和前臂被带有斑点的粗糙皮毛覆盖。她有两个巨大的D罩杯乳房，顶端是黑色的乳头" : "，带有斑点的兽皮融入了覆盖她腹部和两个D罩杯乳房的柔软奶油色皮毛中，留下两个黑色的乳头从皮毛中探出") + "。一块粗糙的缠腰布系在她的腰间，遮住了她的下体。一条皮带勒过她沉甸甸的双乳，在背上固定着一篓标枪。大大的碟形耳朵锁定着你，毫无疑问她能听到你的一举一动。锐利、深邃的眼睛紧盯着你的身体，充满了攻击性和一丝欲望。");
         set_race("Gnoll");
         createVagina(false,4,2);
         createBreastRow(Appearance.breastCupInverse("D"));
         ass.analLooseness = 4;
         ass.analWetness = 0;
         createStatusEffect(StatusEffects.BonusACapacity,25,0,0,0);
         set_tallness(72);
         hips.rating = 6;
         butt.rating = 2;
         skin.tone = "tawny";
         skin.setType(1);
         hair.color = "black";
         hair.length = 22;
         initStrTouSpeInte(85,60,100,50);
         initLibSensCor(65,45,60);
         set_weaponName("teeth");
         set_weaponVerb("bite");
         set_weaponAttack(0);
         normalAttackAvoid.doParry = false;
         normalAttackAvoid.doCounter = false;
         set_weaponPerk([]);
         set_weaponValue(25);
         set_armorName("skin");
         set_armorDef(2);
         bonusHP = 250;
         set_lust(30);
         lustVuln = 0.35;
         temperment = 2;
         level = 10;
         set_gems(10 + Utils.rand(5));
         set_drop(new ChainedDrop().add(get_consumables().GROPLUS,0.2).add(get_consumables().INCUBID,0.5).add(get_consumables().GNOLSPT,0.5).elseDrop(get_consumables().BROWN_D));
         checkMonster();
      }
      
      override public function won(param1:Boolean, param2:Boolean = false) : void
      {
         if(get_short() == "alpha gnoll")
         {
            get_game().urtaQuest.loseToGnollPrincessAndGetGangBanged();
         }
         else if(param2)
         {
            outputText("[pg]你的敌人似乎并没有被吓退……");
            doNext(get_game().combat.endLustLoss);
         }
         else
         {
            get_game().plains.gnollSpearThrowerScene.hyenaSpearLossAnal();
         }
      }
      
      override public function performCombatAction() : void
      {
         var _loc1_:MonsterAI = new MonsterAI();
         _loc1_.add(eAttack,1,true,0,FATIGUE_NONE,CombatRange.Ranged);
         _loc1_.add(hyenaPhysicalAttack,1,true,0,FATIGUE_NONE,CombatRange.Melee);
         _loc1_.add(hyenaJavelinAttack,1,true,10,FATIGUE_PHYSICAL,CombatRange.Ranged);
         _loc1_.add(hyenaSnapKicku,1,true,5,FATIGUE_NONE,CombatRange.Melee);
         _loc1_.add(hyenaArousalAttack,1,true,0,FATIGUE_NONE,CombatRange.Tease);
         _loc1_.exec();
      }
      
      public function hyenaSnapKicku() : void
      {
         var _loc1_:Number = 0;
         var _loc2_:* = combatAvoidDamage(new AvoidDamageParameters(true,false,true,null,null,null,null,null));
         if(_loc2_.dodge == EVASION_BLIND)
         {
            outputText("豺狼人试图用残忍的猛踢抓住你，但由于她失明了，她完全没有踢中。");
            return;
         }
         if(_loc2_.dodge == EVASION_SPEED)
         {
            outputText("豺狼人对你咧嘴一笑，然后大步向前并转身。一条长满斑点的腿向上向外猛踢，在空中闪过，踢向你的[chest]。你及时后退了一步，削弱了这一击的力量。爪子轻轻地击中了你的躯干，然后这只雌性鬣狗向后弹开，怒视着你。");
            return;
         }
         if(_loc2_.dodge == EVASION_EVADE)
         {
            outputText("利用你躲避攻击的技巧，你预判并侧身躲开了" + get_a() + Utils.cnName(get_short()) + "的猛踢。\n");
            return;
         }
         if(_loc2_.dodge == EVASION_MISDIRECTION)
         {
            outputText("利用拉斐尔的教导，你预判并侧身躲开了" + get_a() + Utils.cnName(get_short()) + "的猛踢。\n");
            return;
         }
         if(_loc2_.dodge == EVASION_FLEXIBILITY)
         {
            outputText("凭借你令人难以置信的柔韧性，你挤出了" + get_a() + Utils.cnName(get_short()) + "猛踢的轨迹。");
            return;
         }
         if(_loc2_.dodge != null)
         {
            outputText("你设法躲开了豺狼人的踢击");
            return;
         }
         if(Boolean(_loc2_.block))
         {
            outputText("你及时举起盾牌，挡住了豺狼人的踢击。");
            return;
         }
         _loc1_ = get_player().biggestTitSize();
         if(_loc1_ > 20)
         {
            _loc1_ = 20;
         }
         _loc1_ += get_player().reduceDamage(get_str(),this);
         if(_loc1_ <= 0)
         {
            outputText("豺狼人试图用一记弹踢击中你的[chest]，但你设法挡住了这凶狠的一击。");
         }
         else
         {
            outputText("豺狼人黑色的眼睛里闪过一丝光芒，然后她大步向前并转身。一条长满斑点的长腿猛地踢出，重重地踢在你的[chest]上");
            if(get_player().biggestTitSize() >= 1)
            {
               outputText("，一阵剧痛传遍了敏感的肌肤");
            }
            outputText("。即使你被撞得连连后退，你心中那一小部分背叛你的意识还是忍不住注意到了她缠腰布下闪过的一抹深色肌肤。");
            get_player().takeDamage(_loc1_,true);
            get_player().takeLustDamage(2,true);
         }
      }
      
      public function hyenaPhysicalAttack() : void
      {
         var _loc1_:Number = 0;
         _loc1_ = get_player().reduceDamage(get_str() + get_weaponAttack(),this);
         if(_loc1_ <= 0)
         {
            _loc1_ = 0;
            if(Utils.rand(get_player().get_armorDef() + get_player().get_tou()) < get_player().get_armorDef())
            {
               outputText("你面前的豺狼人突然冲了过来，速度快得几乎看不清。双拳砸在你的[armor]上，力量大得让你踉跄，但这股力量被吸收了，没有造成任何实质性的伤害。当足以咬碎骨头的下巴在你的脖子处闪现时，你设法向侧面扭动，让愤怒的鬣狗从你身边滑过。");
            }
            else
            {
               outputText("你格挡并弹开了" + get_a() + Utils.cnName(get_short()) + "向你发起的每一次" + Utils.cnName(get_weaponVerb()) + "。");
            }
         }
         else if(_loc1_ < 10)
         {
            outputText("豺狼人向前跑去，黑色的眼睛里充满愤怒，双拳擦过你的胸膛。擦伤让她失去了平衡，闪烁着象牙光泽的下巴险些咬到你的喉咙。你向后推，踉跄着远离这只愤怒的鬣狗。");
         }
         else
         {
            outputText("豺狼人向前冲去，速度快得几乎无法察觉，然后双拳砸在你的躯干上。还没等你恢复过来，象牙般的下巴就在你眼前闪现，你感觉到锋利的牙齿开始咬住你脖子上的[skindesc]。令人失明的疼痛让你向后猛退，远离牙齿，在逃离下巴时留下了愤怒的擦伤。你滚开后爬起来，当你试图摆脱打击带来的疼痛时，鬣狗自信地向你走来。");
         }
         if(_loc1_ > 0)
         {
            get_player().takeDamage(_loc1_,true);
         }
         outputText("\n");
      }
      
      public function hyenaJavelinAttack() : void
      {
         var _loc1_:Number = 0;
         var _loc2_:Number = 0;
         var _loc3_:* = combatAvoidDamage(new AvoidDamageParameters(true,false,true,null,null,null,null,null));
         if(_loc3_.dodge == EVASION_BLIND)
         {
            outputText("豺狼人从背后抽出一根标枪向你掷来，但由于她失明了，标枪偏离了目标。");
            return;
         }
         if(_loc3_.dodge == EVASION_SPEED)
         {
            outputText("豺狼人从肩上抽出一根深色的长木标枪。她长满斑点的手臂向前挥出，将标枪射向空中。长矛在远处闪烁着，向你脆弱的身体飞来。就在你看到厄运向你飞来时，一种躲避的原始本能将你拉倒，你感觉到巨大的标枪从你耳边擦过时带来的风。");
            return;
         }
         if(_loc3_.dodge == EVASION_EVADE)
         {
            outputText("利用你躲避攻击的技巧，你预判并侧身躲开了" + get_a() + Utils.cnName(get_short()) + "投掷的长矛。\n");
            return;
         }
         if(_loc3_.dodge == EVASION_MISDIRECTION)
         {
            outputText("利用拉斐尔的教导，你预判并侧身躲开了" + get_a() + Utils.cnName(get_short()) + "投掷的长矛。\n");
            return;
         }
         if(_loc3_.dodge == EVASION_FLEXIBILITY)
         {
            outputText("凭借你令人难以置信的柔韧性，你挤出了" + get_a() + Utils.cnName(get_short()) + "投掷长矛的轨迹。");
            return;
         }
         if(_loc3_.dodge != null)
         {
            outputText("你成功躲开了豺狼人的长矛");
            return;
         }
         if(Boolean(_loc3_.block))
         {
            outputText("你及时举起盾牌，挡住了豺狼人投掷的长矛。");
            return;
         }
         if(get_player().hasPerk(PerkLib.Resolute) && get_player().get_tou() >= 75)
         {
            outputText("你坚决无视长矛，当它击中你时，你把钝尖拨开。\n");
            return;
         }
         if(Utils.rand(3) >= 1)
         {
            outputText("豺狼人从肩上抽出一根黑色的长标枪。她长满斑点的手臂向前挥出，将标枪射向空中。你试图向侧面扑倒，但为时已晚。粗壮的枪杆重重地砸在你的背上。巨大的冲击力让你感到阵阵疼痛。然而，枪尖并没有刺穿你，而是似乎爆炸成一种粘稠的粘液，瞬间与你的[armor]粘合在一起。这根四英尺长的沉重枪杆笨拙地把你往下拉，勾住东西，让你失去平衡。你试图把标枪从身上扯下来，却发现它已经粘在你身上了。要把它取下来需要时间和精力；而当一只占主导地位的鬣狗在跟踪你时，这是不可能做到的。");
            get_player().createOrFindStatusEffect(StatusEffects.GnollSpear);
            get_player().takeDamage(25 + Utils.rand(20),true);
         }
         else
         {
            outputText("豺狼人从肩上抽出一根深色的长木标枪。她长满斑点的手臂向前挥出，将标枪射向空中。标枪闪过中间的距离，砸在你的胸膛上。钝尖并没有刺穿你，但撞击造成的瘀伤让你感到阵阵疼痛。");
            get_player().takeDamage(25 + Utils.rand(20),true);
         }
      }
      
      public function hyenaArousalAttack() : void
      {
         var _loc1_:Number = Utils.rand(150);
         if(get_player().cor + get_player().lib > _loc1_ + 50)
         {
            outputText("豺狼人脸上浮现出一丝苦笑，然后向你冲来。她的速度快得让人看不清，她飞扑向前，你拼命地准备迎接撞击，但撞击并没有到来。她没有攻击你，而是用两只长满斑点的爪子夹住你的脖子后面，把你的头拉下来，让你的脸贴在她的皮革缠腰布上。一股强烈的麝香味刺痛了你的鼻子，薄薄的皮革后面坚实的肌肤让你的脸感到一阵刺痛。她把你按在那里，紧贴着她的腹股沟好一会儿，欲望在你体内深处滋长，然后你才找到力量和意志挣脱开来。这位亚马逊战士咧嘴一笑，让你踉跄后退，试图摆脱她身体的感觉。");
            get_player().takeLustDamage(25 + get_player().lib / 20 + get_player().sens / 5,true);
         }
         else if(20 + get_player().cor + get_player().lib > _loc1_)
         {
            outputText("豺狼人脸上浮现出慵懒的笑容，然后向你冲来。她的速度快得让人看不清，她飞扑向前，你拼命地准备迎接撞击，但撞击并没有到来。她没有攻击你，而是用两只长满斑点的爪子夹住你的脖子后面，把你的头拉下来，让你的脸贴在她的皮革缠腰布上。一股强烈的麝香味刺痛了你的鼻子，薄薄的皮革后面坚实的肌肤让你的脸感到一阵刺痛。出于本能，你挣脱了她的束缚，踉跄着逃离了充斥你脑海的感觉，尽管你心中仍燃起了一些欲望。");
            get_player().takeLustDamage(15 + get_player().lib / 20 + get_player().sens / 5,true);
         }
         else
         {
            outputText("豺狼人黑色的眼睛里闪过一丝心领神会的光芒，然后她向前冲去。当她靠近你并开始用两只长满斑点的爪子锁住你的脖子后面时，你的肌肉紧绷起来。她把你拉向她散发着麝香味的胯部，但就在你擦过她的缠腰布时，你扭身躲开了。这只鬣狗沮丧地咆哮着，让你不禁怀疑这是否就是她所谓的前戏。");
         }
      }
      
      override public function eAttack() : void
      {
         var _loc1_:Number = 0;
         if(playerAvoidDamage(new AvoidDamageParameters(null,null,null,null,null,null,null,null)))
         {
            return;
         }
         _loc1_ = get_player().reduceDamage(get_str() + get_weaponAttack(),this);
         if(_loc1_ <= 0)
         {
            _loc1_ = 0;
            if(Utils.rand(get_player().get_armorDef() + get_player().get_tou()) < get_player().get_armorDef())
            {
               outputText("你面前的豺狼人突然冲了过来，速度快得几乎看不清。双拳砸在你的[armor]上，力量大得让你踉跄，但这股力量被吸收了，没有造成任何实质性的伤害。当足以咬碎骨头的下巴在你的脖子处闪现时，你设法向侧面扭动，让愤怒的鬣狗从你身边滑过。");
            }
            else
            {
               outputText("你格挡并弹开了" + get_a() + Utils.cnName(get_short()) + "向你发起的每一次" + Utils.cnName(get_weaponVerb()) + "。");
            }
         }
         else if(_loc1_ < 10)
         {
            outputText("豺狼人向前跑去，黑色的眼睛里充满愤怒，双拳擦过你的胸膛。擦伤让她失去了平衡，闪烁着象牙光泽的下巴险些咬到你的喉咙。你向后推，踉跄着远离这只愤怒的鬣狗。");
         }
         else
         {
            outputText("豺狼人向前冲去，速度快得几乎无法察觉，然后双拳砸在你的躯干上。还没等你恢复过来，象牙般的下巴就在你眼前闪现，你感觉到锋利的牙齿开始咬住你脖子上的[skindesc]。令人失明的疼痛让你向后猛退，远离牙齿，在逃离下巴时留下了愤怒的擦伤。你滚开后爬起来，当你试图摆脱打击带来的疼痛时，鬣狗自信地向你走来。");
         }
         if(_loc1_ > 0)
         {
            get_player().takeDamage(_loc1_,true);
         }
         statScreenRefresh();
         outputText("\n");
      }
      
      override public function defeated(param1:Boolean) : void
      {
         if(get_short() == "alpha gnoll")
         {
            get_game().clearOutput();
            outputText("豺狼人首领被打败了！在继续前进之前，你可以利用她快速、自愿地操一顿来满足你的欲望。见鬼，你甚至可以给她喂点你从地精那里拿来的魅魔乳汁——这可能会让她变得更性感。你要这么做吗？");
            get_game().output.menu();
            get_game().output.addButton(0,"操她",get_game().urtaQuest.winRapeHyenaPrincess);
            get_game().output.addButton(1,"魅魔乳汁",get_game().urtaQuest.useSuccubiMilkOnGnollPrincesses);
            get_game().output.addButton(14,"离开",get_game().urtaQuest.urtaNightSleep);
         }
         else
         {
            get_game().plains.gnollSpearThrowerScene.hyenaVictory();
         }
      }
   }
}

