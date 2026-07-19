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
   
   public class FrogGirlPink extends Monster
   {
      
      public function FrogGirlPink()
      {
         if(Boot.skip_constructor)
         {
            return;
         }
         super();
         set_a("");
         set_short("pink frog-girl");
         imageName = "froggirlpink";
         set_long("");
         set_race("frog-girl");
         createVagina(false,5,2);
         createBreastRow(Appearance.breastCupInverse("C"));
         ass.analLooseness = 2;
         ass.analWetness = 0;
         set_tallness(62);
         hips.rating = 10;
         butt.rating = 10;
         skin.tone = "pink";
         hair.color = "purple";
         hair.length = 10;
         initStrTouSpeInte(50,55,85,45);
         initLibSensCor(50,40,50);
         set_weaponName("tongue");
         set_weaponVerb("lash");
         set_weaponAttack(5);
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
         outputText("粉红色的蛙女对你微笑，用她带蹼的手托着她的乳房。然后她开始淫荡地在你眼前摇晃它们。那两团乳房弹跳的方式相当催眠，让你的目光一直被它们吸引。");
         get_player().takeLustDamage(10 + Utils.rand(8));
      }
      
      override public function performCombatAction() : void
      {
         var _loc1_:MonsterAI = new MonsterAI();
         _loc1_.add(drug,1,!get_player().hasStatusEffect(StatusEffects.Stunned),15,FATIGUE_NONE,CombatRange.Melee);
         _loc1_.add(tease,1,true,10,FATIGUE_MAGICAL,CombatRange.Tease);
         _loc1_.add(eAttack,1,true,0,FATIGUE_PHYSICAL,CombatRange.Melee);
         _loc1_.exec();
      }
      
      public function drug() : void
      {
         outputText("粉红色的蛙女用舌头抽打你。");
         var _loc1_:CombatAttackBuilder = new CombatAttackBuilder().canBlock().canDodge();
         if(_loc1_.executeAttack().isSuccessfulHit())
         {
            outputText("她的唾液让你的心跳开始加速，一股温暖的感觉在你的下体涌动。");
            get_player().takeDamage(get_str() / 2 + get_weaponAttack() + Utils.rand(5));
            get_player().createStatusEffect(StatusEffects.FrogPoison,0,0,0,0);
         }
      }
   }
}

