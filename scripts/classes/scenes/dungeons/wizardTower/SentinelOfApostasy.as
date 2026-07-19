package classes.scenes.dungeons.wizardTower
{
   import classes.CoC;
   import classes.Creature;
   import classes.Monster;
   import classes.PerkLib;
   import classes.Player;
   import classes.StatusEffects;
   import classes.internals.MonsterAI;
   import classes.internals.Utils;
   import classes.items.Weapon;
   import classes.scenes.combat.AvoidDamageParameters;
   import classes.scenes.combat.CombatRange;
   import flash.Boot;
   
   public class SentinelOfApostasy extends Monster
   {
      
      public var sealedRound:int;
      
      public function SentinelOfApostasy()
      {
         if(Boot.skip_constructor)
         {
            return;
         }
         sealedRound = 0;
         super();
         set_a("");
         set_short("Sentinel of Apostasy");
         imageName = "apostsent";
         set_long("");
         initStrTouSpeInte(100,80,70,50);
         initLibSensCor(30,30,0);
         lustVuln = 0.5;
         set_tallness(72);
         createBreastRow(0,1);
         initGenderless();
         set_drop(NO_DROP);
         ignoreLust = true;
         level = 22;
         bonusHP = 800;
         set_weaponName("spear");
         set_weaponVerb("stab");
         set_weaponAttack(25);
         set_armorName("cracked stone");
         set_armorDef(40);
         set_lust(10);
         bonusLust = 20;
         additionalXP = 500;
         createPerk(PerkLib.PoisonImmune,0,0,0,0);
         createPerk(PerkLib.BleedImmune,0,0,0,0);
         checkMonster();
      }
      
      public function sealPhysical() : void
      {
         outputText("重甲哨兵以虔诚的姿势将长矛举向天空，每一个肢体都以非人的精度锁定在原位，关节处升起小团尘土。一道微弱的光波从这座活雕像身上向外脉动，准确无误地向你游荡而来。");
         outputText("\n光芒击中了你，它的效果虽然抽象但立竿见影；你的肌肉感到麻木，四肢沉重。<b>你的物理攻击被封印了！</b>");
         get_player().createStatusEffect(StatusEffects.SentinelPhysicalDisabled,3,0,0,0);
         sealedRound = get_game().combat.combatRound;
         set_fatigue(get_fatigue() + 15);
      }
      
      override public function replacesDescribeAttacked(param1:Weapon, param2:int, param3:Boolean = false) : Boolean
      {
         var _loc4_:Boolean = false;
         var _loc5_:Boolean = false;
         var _loc6_:Boolean = false;
         if(!param1.isChanneling())
         {
            _loc4_ = param2 < 15 || param2 < maxHP() * 0.05;
            _loc5_ = param2 < 50 || param2 < maxHP() * 0.2;
            _loc6_ = param2 < 100 || param2 < maxHP() * 0.33;
            if(param2 <= 0)
            {
               outputText("你的" + param1.get_attackNoun() + "被" + get_themonster() + "毫发无伤地弹开了。");
            }
            else if(_loc4_)
            {
               outputText("你擦伤了" + get_themonster() + "！");
            }
            else if(_loc5_)
            {
               outputText("你" + param1.get_attackVerb() + "了" + get_themonster() + "，打得" + pronoun2 + "碎片横飞！");
            }
            else if(_loc6_)
            {
               outputText(get_Themonster() + "在你强力的" + param1.get_attackNoun() + "下破裂开来！");
            }
            else
            {
               outputText("你用强力的" + param1.get_attackNoun() + "[b:粉碎]了" + get_themonster() + "！");
            }
            if(param3)
            {
               outputText("[b:暴击！]");
            }
            outputText(get_game().combat.getDamageText(param2));
            return true;
         }
         return false;
      }
      
      public function piercingStrike() : void
      {
         outputText("重甲哨兵向后仰去，双手紧握长矛，以非人的速度向前猛冲，发动了穿刺攻击！");
         var _loc1_:* = combatAvoidDamage(new AvoidDamageParameters(true,false,true,null,true,null,null,null));
         if(_loc1_.dodge != null)
         {
            outputText("\n你勉强躲过了这强力的一刺。");
         }
         else if(Boolean(_loc1_.block))
         {
            outputText("\n你在最后一刻举起盾牌，费了九牛二虎之力才挡住了这强力的一刺。");
         }
         else
         {
            outputText("\n你没能躲开这强力的一刺，长矛的尖端准确无误地击中了你，完全刺穿了你的盔甲，无视了任何防御！");
            get_player().takeDamage(100 + Utils.rand(30),true);
         }
         set_fatigue(get_fatigue() + 10);
      }
      
      override public function performCombatAction() : void
      {
         if(Utils.rand(get_lust() - 35) > Utils.rand(100))
         {
            humanity();
            return;
         }
         var _loc1_:MonsterAI = new MonsterAI();
         _loc1_.add(eAttack,2,true,0,FATIGUE_NONE,CombatRange.Melee);
         _loc1_.add(sealPhysical,1,!get_player().hasStatusEffect(StatusEffects.SentinelPhysicalDisabled) && get_game().combat.combatRound >= sealedRound + 2,15,FATIGUE_MAGICAL,CombatRange.Omni);
         _loc1_.add(piercingStrike,get_player().damagePercent(false,false,false,true) > 50 ? 2 : 1,true,10,FATIGUE_PHYSICAL,CombatRange.ChargingMelee);
         _loc1_.exec();
      }
      
      override public function outputDefaultTeaseReaction(param1:Number) : void
      {
         if(param1 == 0)
         {
            outputText("[pg]" + get_capitalA() + Utils.cnName(get_short()) + "似乎没有受到任何影响。");
         }
         outputText("[pg]" + get_capitalA() + Utils.cnName(get_short()) + "没有表现出任何情绪，但你敢发誓你的表现让它停顿了一下……哪怕只有一瞬间。");
      }
      
      public function humanity() : void
      {
         outputText("身披重甲的哨兵在攻击中途突然停了下来。它向后退去，看着自己颤抖的石头双手，仿佛突然顿悟了什么。");
         outputText("\n然后它垂下肩膀仰望天空，姿势完全放弃了战斗的架势。它很快就会恢复，但你刚才的举动绝对影响到了它！");
         set_lust(get_lust() - 15);
         set_fatigue(get_fatigue() - 5);
      }
   }
}

