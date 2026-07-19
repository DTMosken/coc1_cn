package classes.scenes.camp
{
   import classes.CoC;
   import classes.Monster;
   import classes.internals.WeightedChoice;
   import classes.items.WeaponLib;
   import flash.Boot;
   
   public class ScarredBlade extends Monster
   {
      
      public function ScarredBlade()
      {
         if(Boot.skip_constructor)
         {
            return;
         }
         super();
         set_a("");
         set_short("scarred blade");
         set_plural(false);
         createBreastRow();
         set_initedGenitals(true);
         balls = 0;
         ballSize = 0;
         set_tallness(36);
         skin.tone = "metallic";
         set_long("你正在对战的这把剑绝非寻常之物。这是一把注入了魔晶石的金属弯刀，刀身上刻满了伤痕。它似乎渴望着血肉。");
         pronoun1 = "它";
         pronoun2 = "它";
         pronoun3 = "它的";
         initStrTouSpeInte(80,100,75,50);
         initLibSensCor(0,0,100);
         set_weaponName("scarred blade");
         set_weaponVerb("slash");
         set_weaponAttack(50);
         set_armorName("lethicite");
         set_armorDef(15);
         bonusHP = 400;
         set_lust(0);
         lustVuln = 0;
         temperment = 1;
         level = 17;
         set_gems(0);
         set_drop(new WeightedChoice(get_weapons().B_SCARB,1));
         checkMonster();
      }
      
      override public function won(param1:Boolean, param2:Boolean = false) : void
      {
         get_game().sheilaScene.badEndScarredBlade();
      }
      
      override public function defeated(param1:Boolean) : void
      {
         get_game().sheilaScene.breakScarredBlade();
      }
   }
}

