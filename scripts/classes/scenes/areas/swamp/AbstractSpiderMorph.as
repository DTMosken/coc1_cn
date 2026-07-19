package classes.scenes.areas.swamp
{
   import classes.CoC;
   import classes.Creature;
   import classes.Monster;
   import classes.Player;
   import classes.StatusEffect;
   import classes.StatusEffects;
   import classes.internals.MonsterAI;
   import classes.internals.Utils;
   import classes.items.Weapon;
   import classes.scenes.combat.AvoidDamageParameters;
   import classes.scenes.combat.CombatDistance;
   import classes.scenes.combat.CombatRange;
   import classes.statusEffects.combat.WebDebuff;
   import flash.Boot;
   
   public class AbstractSpiderMorph extends Monster
   {
      
      public function AbstractSpiderMorph()
      {
         if(Boot.skip_constructor)
         {
            return;
         }
         super();
      }
      
      public function spiderSilence() : void
      {
         outputText(get_capitalA() + Utils.cnName(get_short()) + "直接向你的脸喷射出一股浓缩的蛛丝！");
         var _loc1_:Array = ["[BLIND]盲目的蛛丝射击偏得离谱，完全没有射中你。","[SPEED]你向后仰身，让它们从头顶无害地飞过，避开了攻击。","[EVADE]你闪避着把武器往后一拉，蛛丝射偏了，完全没有射中。","[MISDIRECTION]你那迷惑性的动作让你轻松地侧身躲过了蛛丝！","[FLEXIBILITY]在最后一刻，你以猫一般的敏捷身手扑向一旁，避开了[monster.his]攻击。","[UNHANDLED]你成功地在武器脱手前将其拉回。","[BLOCK]你举起盾牌挡住了黏糊糊的蛛丝，然后用你的[weapon]一挥将它们清除。"];
         if(!playerAvoidDamage(new AvoidDamageParameters(true,false,true,null,true,null,null,null),_loc1_))
         {
            outputText("它们在你移动之前击中了你，覆盖了你的大部分鼻子和嘴巴，让你难以呼吸。当你不断挣扎只为了吸入空气时，你将无法使用你的魔法！\n");
            get_player().createStatusEffect(StatusEffects.WebSilence,0,0,0,0);
         }
      }
      
      public function spiderMorphWebAttack() : void
      {
         var _loc2_:* = null as WebDebuff;
         outputText("转向一侧，" + get_a() + Utils.cnName(get_short()) + "抬起[monster.his]腹部，朝你的方向喷射出一股蛛网！");
         var _loc1_:Array = ["[BLIND]由于失明，" + get_capitalA() + Utils.cnName(get_short()) + "的攻击完全落空了。","[SPEED]你闪身躲开，避开了黏糊糊的蛛丝！","[EVADE]你闪避开来，避开了黏糊糊的蛛丝！","[MISDIRECTION]你那迷惑性的动作让你轻松地侧身躲过了黏糊糊的蛛丝！","[FLEXIBILITY]在最后一刻，你以猫一般的敏捷身手扑向一旁，避开了[monster.his]攻击。","[BLOCK]你举起盾牌挡住了黏糊糊的蛛丝，然后用你的[weapon]一挥将它们清除。","[UNHANDLED]你成功地翻滚躲开了黏糊糊的蛛丝。"];
         if(!playerAvoidDamage(new AvoidDamageParameters(true,false,true,null,false,null,null,null),_loc1_))
         {
            _loc2_ = get_player().statusEffectByType(StatusEffects.Web);
            if(_loc2_ == null)
            {
               outputText("丝状的蛛网击中了你，将你缠绕起来，让你很难以任何速度移动。");
               if(get_player().canFly())
               {
                  outputText("你的翅膀在束缚中无用地挣扎着，再也无法快速拍打来帮助你。");
               }
               outputText("\n");
               _loc2_ = new WebDebuff();
               get_player().addStatusEffect(_loc2_);
            }
            else
            {
               outputText("丝状的蛛网击中了你，压得你喘不过气来，进一步限制了你的行动。\n");
            }
            _loc2_.increase();
         }
      }
      
      public function spiderDisarm() : void
      {
         outputText(get_capitalA() + Utils.cnName(get_short()) + "移动身体并喷射出蛛丝，瞄准你的[weapon]射出一根紧绷的蛛丝。");
         var _loc1_:Array = ["[BLIND]盲目的蛛丝射击偏得离谱，完全没有射中你。","[SPEED]你把武器往后一拉，蛛丝射偏了，完全没有射中。","[EVADE]你闪避着把武器往后一拉，蛛丝射偏了，完全没有射中！","[MISDIRECTION]你那迷惑性的动作让你轻松地侧身躲过了蛛丝！","[FLEXIBILITY]在最后一刻，你以猫一般的敏捷身手扑向一旁，避开了[monster.his]攻击。","[UNHANDLED]你成功地在武器脱手前将其拉回。"];
         if(!playerAvoidDamage(new AvoidDamageParameters(true,false,false,null,false,null,null,null),_loc1_))
         {
            if(get_player().get_weapon().isFist())
            {
               outputText("蛛网击中了你的");
               if(get_player().get_weaponName() == "spiked gauntlet")
               {
                  outputText("护手，但它非常牢固地固定在你的手上，所以攻击未能解除你的武装。\n");
               }
               else
               {
                  outputText("护手，但它们非常牢固地固定在你的手上，所以攻击未能解除你的武装。\n");
               }
            }
            else
            {
               outputText("你反应不够快，粘稠的蛛网将你的[weapon]从你手中扯出，粘在了附近的一棵树上。现在没办法把它拿回来了，你只能徒手战斗了！");
               get_player().disarm();
            }
         }
      }
      
      override public function performCombatAction() : void
      {
         var _loc1_:MonsterAI = new MonsterAI();
         _loc1_.add(spiderSilence,20,!get_player().hasStatusEffect(StatusEffects.WebSilence) && get_player().hasSpells(),10,FATIGUE_PHYSICAL,CombatRange.Ranged);
         _loc1_.add(spiderDisarm,20,get_player().canDisarm(),10,FATIGUE_PHYSICAL,CombatRange.Ranged);
         _loc1_.add(spiderMorphWebAttack,33,get_player().get_spe() >= 2 && !get_player().hasStatusEffect(StatusEffects.Web),10,FATIGUE_PHYSICAL,CombatRange.Ranged);
         _loc1_.add(eAttack,25,true,0,FATIGUE_NONE,CombatRange.Melee);
         _loc1_.add(get_game().monsterAbilities.approach,10,distance == CombatDistance.Distant,15,FATIGUE_PHYSICAL,CombatRange.Self);
         _loc1_.add(getBitten,get_player().get_spe() < 2 ? 100 : 10,true,5,FATIGUE_PHYSICAL,CombatRange.Melee);
         _loc1_.exec();
      }
      
      public function getBitten() : void
      {
         if(get_player().get_spe() < 2 && get_player().hasStatusEffect(StatusEffects.Web))
         {
            outputText("这只蛛形怪物慢慢地向前走去，而你在成堆的蛛网下挣扎着，[monster.his]手臂轻轻地环绕在你的背上，给了你一个温柔的拥抱。" + mf("他","她") + "的毒牙以极其缓慢的速度滑入你的脖子，立刻在你体内引发了一股灼热感，让你感到头晕目眩、浑身无力。");
            if(get_player().hasCock())
            {
               outputText(get_player().SMultiCockDesc() + "变得坚硬如石，无力地喷射着，突然间你变得如此兴奋，以至于它开始浸湿你的[armor]");
               if(get_player().hasVagina())
               {
                  outputText("连同你的[vagina]");
               }
               outputText("。");
            }
            else if(get_player().hasVagina())
            {
               outputText("你的[vagina]变得湿透了，而且非常敏感，你的每一步和每一个动作都在提醒你，你那湿透的阴唇之间强烈需要什么东西。");
            }
            outputText("当[monster.his]毒液注入你体内时，这个蜘蛛" + mf("男孩","女孩") + "把手伸进你的装备里玩弄你的[nipple]，在[monster.his]毒液和乳头玩弄的双重刺激下，你像个荡妇一样呻吟起来。[pg]");
            if(hasVagina())
            {
               outputText("这个俏皮的女王暂时耗尽了她的催情毒素，终于退后了一步，欣赏着她的杰作，并对你抛了个媚眼。你");
            }
            else
            {
               outputText("这个自信的雄性暂时耗尽了他的催情毒素，终于退后一步，欣赏着他的杰作，并对你抛了个淫荡的媚眼。你");
            }
            if(get_player().get_lust() + 60 * get_player().lustVuln >= get_player().maxLust())
            {
               outputText("摇摇晃晃，彻底被击败，即将屈服于你的欲望。");
            }
            else
            {
               outputText("努力不让自己倒下，并当场开始自慰。");
            }
            get_player().takeLustDamage(60,true);
            outputText("\n");
            return;
         }
         outputText("蜘蛛" + mf("男孩","女孩") + "张着[monster.his]嘴向前扑来，[monster.his]两颗针状的毒牙迅速逼近。");
         var _loc1_:Array = ["[BLIND]由于失明，" + get_capitalA() + Utils.cnName(get_short()) + "的攻击完全落空了。","[SPEED]你闪身躲开，避开了[monster.his]撕咬！","[EVADE]你闪避开来，避开了撕咬！","[MISDIRECTION]你那迷惑性的动作让你轻松地侧身躲过了蜘蛛的撕咬！","[FLEXIBILITY]在最后一刻，你以猫一般的敏捷身手扑向一旁，避开了[monster.his]攻击。","[BLOCK]你及时举起盾牌，并且有足够的力量承受住对手扑击的重量。","[UNHANDLED]你成功地翻滚躲开了撕咬。"];
         var _loc2_:AvoidDamageParameters = new AvoidDamageParameters(true,false,true,null,true,null,null,null);
         if(!playerAvoidDamage(_loc2_,_loc1_))
         {
            if(Utils.rand(5) == 0)
            {
               outputText("你的反应太慢了，还没等你想到躲闪，[monster.he]就已经深深地咬了你一口，将大量的毒液注入你的体内。不自然的燥热席卷全身，汇聚在你的腹股沟，直到你淫荡地将臀部顶在蜘蛛人的大腿上。" + mf("他","她") + "拔出毒牙，向后退去，");
               if(hasVagina())
               {
                  outputText("随意地揉捏着她的乳房，而你用因毒液而放大的瞳孔注视着，慢慢地抚摸着自己。当她停下来时，你摇了摇头，控制住自己，想起你应该是在和这个" + mf("男孩","女孩") + "战斗！");
               }
               else
               {
                  outputText("随意地套弄着他那相对较短却粗壮的肉棒，而你用因毒液而放大的瞳孔注视着，慢慢地抚摸着自己。当他停下来时，你摇了摇头，控制住自己，想起你应该是在和这个" + mf("男孩","女孩") + "战斗！");
               }
               get_player().takeLustDamage(50,true);
            }
            else
            {
               outputText("你的反应太慢了，还没等你躲闪，[monster.he]就已经咬了你一口，留下了一种灼热的毒液，温暖了你的血液，激起了你的欲望。");
               get_player().takeLustDamage(30,true);
            }
         }
      }
   }
}

