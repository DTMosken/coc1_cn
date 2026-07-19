package classes.scenes.dungeons.wizardTower
{
   import classes.CoC;
   import classes.Creature;
   import classes.Monster;
   import classes.PerkLib;
   import classes.Player;
   import classes.StatusEffectType;
   import classes.StatusEffects;
   import classes.internals.MonsterAI;
   import classes.internals.Utils;
   import classes.items.Shield;
   import classes.items.Weapon;
   import classes.scenes.combat.AvoidDamageParameters;
   import classes.scenes.combat.CombatRange;
   import flash.Boot;
   
   public class SentinelOfBlasphemy extends Monster
   {
      
      public var sealedRound:int;
      
      public function SentinelOfBlasphemy()
      {
         if(Boot.skip_constructor)
         {
            return;
         }
         sealedRound = 0;
         super();
         set_a("");
         set_short("Sentinel of Blasphemy");
         imageName = "blasphsent";
         set_long("");
         initStrTouSpeInte(80,80,25,100);
         initLibSensCor(30,30,0);
         lustVuln = 0.6;
         set_tallness(72);
         createBreastRow(0,1);
         initGenderless();
         set_drop(NO_DROP);
         ignoreLust = true;
         level = 22;
         bonusHP = 800;
         set_weaponName("staff");
         set_weaponVerb("shot");
         set_weaponAttack(20);
         set_armorName("cracked stone");
         set_armorDef(30);
         set_lust(10);
         bonusLust = 20;
         additionalXP = 500;
         createPerk(PerkLib.PoisonImmune,0,0,0,0);
         createPerk(PerkLib.BleedImmune,0,0,0,0);
         checkMonster();
      }
      
      public function sealMagical() : void
      {
         outputText("长袍哨兵以虔诚的姿态将法杖举向天空，它的每一个肢体都以非人的精准度锁定在原位，关节处扬起微小的尘土。一道微弱的光波从这座活雕像身上向外扩散，准确无误地朝你袭来。");
         outputText("\n光波击中了你，其效果虽然抽象但立竿见影；你的声音卡在喉咙里，连说话的概念都从脑海中消失了。<b>你的魔法攻击被封印了！</b>");
         get_player().createStatusEffect(StatusEffects.SentinelOmniSilence,3,0,0,0);
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
               outputText("你对" + get_themonster() + "造成了擦伤！");
            }
            else if(_loc5_)
            {
               outputText("你" + param1.get_attackVerb() + "了" + get_themonster() + "，打得" + pronoun2 + "碎片四溅！");
            }
            else if(_loc6_)
            {
               outputText(get_Themonster() + "在你强力的" + param1.get_attackNoun() + "下碎裂了！");
            }
            else
            {
               outputText("你用强大的" + param1.get_attackNoun() + "[b:粉碎]了" + get_themonster() + "！");
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
      
      override public function performCombatAction() : void
      {
         if(Utils.rand(get_lust() - 35) > Utils.rand(100))
         {
            humanity();
            return;
         }
         var _loc1_:MonsterAI = new MonsterAI();
         _loc1_.add(eAttack,2,true,0,FATIGUE_NONE,CombatRange.Ranged);
         _loc1_.add(sealMagical,1,!get_player().hasStatusEffect(StatusEffects.SentinelOmniSilence) && get_game().combat.combatRound >= sealedRound + 2,15,FATIGUE_MAGICAL,CombatRange.Omni);
         var _loc2_:Number = countPositiveBuffs();
         _loc1_.add(dispel,_loc2_,true,25,FATIGUE_MAGICAL,CombatRange.Omni);
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
         outputText("长袍哨兵在施法中途突然停止了攻击。它向后仰去，看着自己颤抖的石头双手，仿佛突然顿悟了什么。");
         outputText("\n然后它跪了下来，双手合十祈祷。它很快就会恢复，但你刚才的举动绝对影响到了它！");
         set_lust(get_lust() - 15);
         set_fatigue(get_fatigue() - 5);
      }
      
      public function dispel() : void
      {
         var _loc2_:int = 0;
         var _loc3_:* = null as Array;
         var _loc4_:* = null as StatusEffectType;
         var _loc5_:* = null as StatusEffectType;
         outputText("长袍哨兵一只手举向天空，另一只手放在胸前。它指向天空的手闪烁着魔法能量，然后向你发射过来！");
         var _loc1_:* = combatAvoidDamage(new AvoidDamageParameters(true,false,false,null,null,null,null,null));
         if(_loc1_.dodge != null)
         {
            outputText("[pg]你及时躲开了，避开了魔法攻击。");
         }
         else if(get_player().get_shield() == get_game().shields.DRGNSHL && Utils.rand(3) == 0)
         {
            outputText("[pg]你被攻击命中了，但幸好你及时举起了盾牌。法术被吸收并无效化了！");
         }
         else
         {
            outputText("[pg]你被法术击中了！虽然不疼，但你感觉自己明显有些不同了。你感觉……被净化了。<b>所有正面增益效果已被移除！</b>");
            _loc2_ = 0;
            _loc3_ = StatusEffects.dispellablePositiveEffects;
            while(_loc2_ < int(_loc3_.length))
            {
               _loc4_ = _loc3_[_loc2_];
               _loc2_++;
               _loc5_ = _loc4_;
               if(get_player().indexOfStatusEffect(_loc5_) != -1)
               {
                  get_player().removeStatusEffect(_loc5_);
               }
            }
         }
         set_fatigue(get_fatigue() + 25);
      }
      
      public function countPositiveBuffs() : Number
      {
         var _loc4_:* = null as StatusEffectType;
         var _loc5_:* = null as StatusEffectType;
         var _loc1_:Number = 0;
         var _loc2_:int = 0;
         var _loc3_:Array = StatusEffects.dispellablePositiveEffects;
         while(_loc2_ < int(_loc3_.length))
         {
            _loc4_ = _loc3_[_loc2_];
            _loc2_++;
            _loc5_ = _loc4_;
            if(get_player().indexOfStatusEffect(_loc5_) != -1)
            {
               _loc1_++;
            }
         }
         return _loc1_;
      }
   }
}

