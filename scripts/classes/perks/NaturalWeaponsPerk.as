package classes.perks
{
   import classes.PerkType;
   import classes.internals._ValueFunc.NumberFunc_Impl_;
   import flash.Boot;
   
   public class NaturalWeaponsPerk extends PerkType
   {
      
      public function NaturalWeaponsPerk()
      {
         if(Boot.skip_constructor)
         {
            return;
         }
         super("Natural Weapons","Natural Weapons","Enhances attacks and abilities that make use of your transformed body parts.","You choose the \'Natural Weapons\' perk, granting you greater affinity with your transformed body. Transformation-granted physical attacks will be improved, most commonly increasing damage by 20%. May also add other bonuses, depending on the attack.");
         boost("肉体伤害",NumberFunc_Impl_.fromFloat(1.2),true);
      }
   }
}

