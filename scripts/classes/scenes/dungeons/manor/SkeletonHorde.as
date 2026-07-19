package classes.scenes.dungeons.manor
{
   import classes.Appearance;
   import classes.CoC;
   import classes.Monster;
   import classes.PerkLib;
   import classes.StatusEffects;
   import classes.internals.Utils;
   import classes.internals.WeightedChoice;
   import flash.Boot;
   
   public class SkeletonHorde extends Monster
   {
      
      public function SkeletonHorde(param1:Boolean = false)
      {
         if(Boot.skip_constructor)
         {
            return;
         }
         super();
         if(param1)
         {
            return;
         }
         set_a("");
         set_short("Horde of Skeletons");
         imageName = "necromancer";
         set_long("*骨骼碰撞声加剧*");
         set_initedGenitals(true);
         pronoun1 = "它们";
         pronoun2 = "它们";
         pronoun3 = "它们的";
         createBreastRow(Appearance.breastCupInverse("E"));
         ass.analLooseness = 1;
         ass.analWetness = 0;
         createStatusEffect(StatusEffects.BonusACapacity,30,0,0,0);
         set_tallness(35 + Utils.rand(4));
         hips.rating = 8;
         butt.rating = 8;
         skin.tone = "dark green";
         hair.color = "purple";
         hair.length = 4;
         initStrTouSpeInte(20,60,35,42);
         initLibSensCor(45,45,60);
         bonusHP = 230;
         set_weaponName("fists");
         set_weaponVerb("tiny punch");
         set_armorName("leather straps");
         set_lust(0);
         temperment = 2;
         set_drop(new WeightedChoice());
         level = 15;
         set_gems(Utils.rand(5) + 5);
         lustVuln = 0;
         createPerk(PerkLib.BleedImmune,0,0,0,0);
         createPerk(PerkLib.PoisonImmune,0,0,0,0);
         unitHP = 100;
         unitAmount = 4;
         set_plural(true);
         checkMonster();
      }
      
      override public function won(param1:Boolean, param2:Boolean = false) : void
      {
         get_game().dungeons.manor.loseToNecro();
      }
      
      public function recombobulateWeapon() : void
      {
         var _loc1_:Number = Utils.rand(4);
         var _loc2_:Number = _loc1_;
         if(_loc2_ == 0)
         {
            set_weaponVerb("stab");
            set_weaponName("pitchfork");
            set_weaponAttack(50);
         }
         else if(_loc2_ == 1)
         {
            set_weaponVerb("slash");
            set_weaponName("rusty sword");
            set_weaponAttack(70);
         }
         else if(_loc2_ == 2)
         {
            set_weaponVerb("crush");
            set_weaponName("rusty mace");
            set_weaponAttack(60);
         }
         else if(_loc2_ == 3)
         {
            set_weaponVerb("slap");
            set_weaponName("femur");
            set_weaponAttack(30);
         }
         else
         {
            set_weaponVerb("pick");
            set_weaponName("pickaxe");
            set_weaponAttack(40);
         }
      }
      
      override public function performCombatAction() : void
      {
         unitAmount = Math.ceil(get_HP() / 100);
         outputText("\n");
         var _loc1_:Number = 0;
         while(_loc1_ < unitAmount)
         {
            recombobulateWeapon();
            eAttack();
            _loc1_++;
         }
      }
      
      override public function maxHP() : Number
      {
         return unitAmount * 100;
      }
      
      override public function handleFear() : Boolean
      {
         outputText("骷髅们没有受到任何恐怖幻象的影响！[pg]");
         removeStatusEffect(StatusEffects.Fear);
         return true;
      }
      
      override public function get_plural() : Boolean
      {
         return unitAmount != 1;
      }
      
      override public function defeated(param1:Boolean) : void
      {
         get_game().dungeons.manor.defeatNecro();
      }
   }
}

