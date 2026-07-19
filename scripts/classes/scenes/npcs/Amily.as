package classes.scenes.npcs
{
   import classes.Appearance;
   import classes.CoC;
   import classes.Creature;
   import classes.Monster;
   import classes.Player;
   import classes.ReactionContext;
   import classes.StatusEffect;
   import classes.StatusEffects;
   import classes.internals.MonsterAI;
   import classes.internals.Utils;
   import classes.scenes.combat.AvoidDamageParameters;
   import classes.scenes.combat.CombatRange;
   import classes.statusEffects.combat.AmilyVenomDebuff;
   import flash.Boot;
   
   public class Amily extends Monster
   {
      
      public function Amily()
      {
         if(Boot.skip_constructor)
         {
            return;
         }
         super();
         set_a("");
         set_short("Amily");
         imageName = "amily";
         set_long("你正在和艾米莉战斗。这个鼠人穿着破烂的衣服，手里拿着刀，愤怒地瞪着你。她压低身子，确保自己能迅速拉近你们之间的距离，或者逃跑。");
         set_race("Mouse-Morph");
         createVagina(false,1,1);
         createStatusEffect(StatusEffects.BonusVCapacity,48,0,0,0);
         createBreastRow(Appearance.breastCupInverse("C"));
         ass.analLooseness = 0;
         ass.analWetness = 0;
         set_tallness(62);
         hips.rating = 6;
         butt.rating = 2;
         var _loc1_:String = get_game().get_noFur() ? "tan" : "tawny";
         skin.tone = _loc1_;
         skin.setType(get_game().get_noFur() ? 0 : 1);
         hair.color = "brown";
         hair.length = 5;
         initStrTouSpeInte(30,30,85,60);
         initLibSensCor(45,45,10);
         set_weaponName("knife");
         set_weaponVerb("slash");
         set_weaponAttack(6);
         set_armorName("rags");
         set_armorDef(1);
         bonusHP = 20;
         set_lust(20);
         lustVuln = 0.85;
         level = 4;
         set_gems(2 + Utils.rand(5));
         set_drop(NO_DROP);
         checkMonster();
      }
      
      override public function teased(param1:Number) : void
      {
         if(hasStatusEffect(StatusEffects.Concentration))
         {
            outputText("艾米莉脸颊绯红；她的专注只会让她更加注意你的部位！");
            param1 += 25 + param1;
            removeStatusEffect(StatusEffects.Concentration);
            applyTease(param1);
         }
         else
         {
            super.teased(param1);
         }
      }
      
      override public function react(param1:ReactionContext) : Boolean
      {
         if(param1.index == 0)
         {
            if(hasStatusEffect(StatusEffects.Concentration) && !get_game().combat.isWieldingRangedWeapon() && get_player().statusEffectv1(StatusEffects.CounterAB) != 1)
            {
               outputText("由于艾米莉完全集中注意力在你的动作上，她轻松地滑步躲开了你的攻击。[pg]");
               return false;
            }
         }
         return true;
      }
      
      override public function performCombatAction() : void
      {
         var _loc1_:MonsterAI = new MonsterAI();
         _loc1_.add(amilyConcentration,1,!hasStatusEffect(StatusEffects.Concentration),10,FATIGUE_PHYSICAL,CombatRange.Self);
         _loc1_.add(amilyDartGo,1,true,10,FATIGUE_PHYSICAL,CombatRange.Ranged);
         _loc1_.add(doubleAttack,1,true,5,FATIGUE_PHYSICAL,CombatRange.ChargingMelee);
         _loc1_.add(eAttack,1,true,0,FATIGUE_NONE,CombatRange.ChargingMelee);
         _loc1_.exec();
      }
      
      public function doubleAttack() : void
      {
         createStatusEffect(StatusEffects.Attacks,2,0,0,0);
         eAttack();
      }
      
      override public function defeated(param1:Boolean) : void
      {
         get_game().amilyScene.conquerThatMouseBitch();
      }
      
      public function amilyDartGo() : void
      {
         var _loc2_:* = null as AmilyVenomDebuff;
         var _loc1_:* = combatAvoidDamage(new AvoidDamageParameters(true,false,false,null,null,null,null,null));
         if(Boolean(_loc1_.attackFailed))
         {
            outputText("艾米莉向你冲来，挥舞着她的刀，动作相当缓慢。你轻松地躲开了攻击；但这只是一个佯攻，她的另一只手试图用毒镖攻击你。幸运的是，你成功地避开了它。");
         }
         else
         {
            outputText("艾米莉向你冲来，挥舞着她的刀，动作出奇地慢。你轻松地躲开了攻击；但这只是一个佯攻——她的另一只手试图用毒镖攻击你。然而，她只划伤了你，仅仅让你的肌肉感到轻微的麻木。");
            _loc2_ = get_player().createOrFindStatusEffect(StatusEffects.AmilyVenom);
            _loc2_.increase();
            if(get_player().get_spe() <= 2 && get_player().get_str() <= 2)
            {
               outputText("你变得如此虚弱，甚至无法尝试保护自己，艾米莉的攻击如雨点般落在你无助的身体上。");
               get_player().takeDamage(8999);
            }
         }
      }
      
      public function amilyConcentration() : void
      {
         outputText("艾米莉深吸一口气，试图集中注意力观察你的动作。");
         createStatusEffect(StatusEffects.Concentration,0,0,0,0);
      }
   }
}

