package classes.scenes.places.owca
{
   import classes.Appearance;
   import classes.CoC;
   import classes.CockTypesEnum;
   import classes.Monster;
   import classes.StatusEffects;
   import classes.internals.Utils;
   import flash.Boot;
   
   public class Farmers extends Monster
   {
      
      public function Farmers()
      {
         if(Boot.skip_constructor)
         {
            return;
         }
         super();
         set_a("");
         set_short("farmers");
         imageName = "farmers";
         set_long("这是一群三十个愤怒的村民，除了头上长出的微小角状突起和几乎可以冒充头发的白色绒毛外，他们几乎都长得像人类。他们都拿着干草叉或其他日常使用的简陋农具。瑞贝克在他们身后用惊恐的眼神盯着这场战斗，被突如其来的变故吓得瘫痪了。");
         set_race("Humans?");
         set_plural(true);
         pronoun1 = "他们";
         pronoun2 = "他们";
         pronoun3 = "他们的";
         createCock(9,2,CockTypesEnum.HUMAN);
         balls = 2;
         ballSize = 1;
         cumMultiplier = 3;
         createVagina(false,3,2);
         createBreastRow(Appearance.breastCupInverse("A"));
         ass.analLooseness = 4;
         ass.analWetness = 5;
         set_tallness(Utils.rand(8) + 70);
         hips.rating = 8;
         butt.rating = 8;
         skin.tone = "red";
         hair.color = "black";
         hair.length = 15;
         initStrTouSpeInte(40,50,99,99);
         initLibSensCor(35,35,20);
         set_weaponName("pitchforks");
         set_weaponVerb("stab");
         set_armorName("chitin");
         bonusHP = 500;
         lustVuln = 0;
         temperment = 3;
         level = 10;
         set_gems(Utils.rand(25) + 40);
         horns.type = 1;
         horns.value = 2;
         tail.type = 3;
         set_drop(NO_DROP);
         checkMonster();
      }
      
      override public function won(param1:Boolean, param2:Boolean = false) : void
      {
         get_game().owca.loseToOwca();
      }
      
      override public function performCombatAction() : void
      {
         createStatusEffect(StatusEffects.Attacks,4,0,0,0);
         eAttack();
      }
      
      override public function defeated(param1:Boolean) : void
      {
         get_game().owca.beatUpOwca();
      }
   }
}

