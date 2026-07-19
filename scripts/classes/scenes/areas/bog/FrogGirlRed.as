package classes.scenes.areas.bog
{
   import classes.Appearance;
   import classes.Monster;
   import classes.PerkLib;
   import classes.Player;
   import classes.StatusEffects;
   import classes.internals.MonsterAI;
   import classes.internals.Utils;
   import classes.scenes.combat.CombatAttackBuilder;
   import classes.scenes.combat.CombatRange;
   import flash.Boot;
   
   public class FrogGirlRed extends Monster
   {
      
      public function FrogGirlRed()
      {
         if(Boot.skip_constructor)
         {
            return;
         }
         super();
         set_a("");
         set_short("red frog-girl");
         imageName = "froggirlred";
         set_long("");
         set_race("frog-girl");
         createVagina(false,5,2);
         createBreastRow(Appearance.breastCupInverse("C"));
         ass.analLooseness = 2;
         ass.analWetness = 0;
         set_tallness(62);
         hips.rating = 10;
         butt.rating = 10;
         skin.tone = "red";
         hair.color = "dark red";
         hair.length = 10;
         initStrTouSpeInte(50,55,85,45);
         initLibSensCor(50,40,50);
         set_weaponName("tongue");
         set_weaponVerb("lash");
         set_weaponAttack(10);
         normalAttackAvoid.doParry = false;
         normalAttackAvoid.doCounter = false;
         set_armorName("skin");
         set_armorDef(5);
         bonusHP = 150;
         set_lust(30);
         temperment = 3;
         level = 10;
         set_gems(10 + Utils.rand(50));
         set_drop(NO_DROP);
         createPerk(PerkLib.PoisonImmune,0,0,0,0);
         checkMonster();
      }
      
      public function tease() : void
      {
         outputText("红色的蛙女微微张开她健美的双腿，带着一抹微笑，将她闪闪发光的小穴暴露在你的视线中。她伸手到入口处将其拨开，炫耀她美丽的粉红色内壁。女孩发出一声轻微的呻吟，同时给你一个挑逗的眼神，乞求你占有她。");
         get_player().takeLustDamage(5 + Utils.rand(5));
      }
      
      public function poison() : void
      {
         outputText("红色的蛙女用她强壮的双腿踢你。");
         var _loc1_:CombatAttackBuilder = new CombatAttackBuilder().canParry().canBlock().canDodge();
         if(_loc1_.executeAttack().isSuccessfulHit())
         {
            get_player().takeDamage(get_str() * 0.75 + get_weaponAttack() + Utils.rand(10));
            outputText("她的皮肤与你接触，开始让你感到有些头晕目眩……");
            get_player().createStatusEffect(StatusEffects.Poison,0,1,0,0);
         }
      }
      
      override public function performCombatAction() : void
      {
         var _loc1_:MonsterAI = new MonsterAI();
         _loc1_.add(poison,1,!get_player().hasStatusEffect(StatusEffects.Poison),15,FATIGUE_NONE,CombatRange.Melee);
         _loc1_.add(tease,1,true,10,FATIGUE_MAGICAL,CombatRange.Tease);
         _loc1_.add(eAttack,2,true,0,FATIGUE_PHYSICAL,CombatRange.Melee);
         _loc1_.exec();
      }
   }
}

