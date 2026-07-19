package classes.scenes.monsters
{
   import classes.Monster;
   import classes.Player;
   import classes.StatusEffect;
   import classes.StatusEffects;
   import classes.statusEffects.combat.BasiliskSlowDebuff;
   import flash.Boot;
   
   public class StareMonster extends Monster
   {
      
      public function StareMonster()
      {
         if(Boot.skip_constructor)
         {
            return;
         }
         super();
      }
      
      public static function speedReduce(param1:Player, param2:Number = 0) : void
      {
         var _loc3_:BasiliskSlowDebuff = param1.createOrFindStatusEffect(StatusEffects.BasiliskSlow);
         _loc3_.applyEffect(param2);
      }
   }
}

