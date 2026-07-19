package classes.statusEffects.combat
{
   import classes.Creature;
   import classes.Player;
   import classes.StatusEffectType;
   import flash.Boot;
   
   public class VineTangled extends TimedStatusEffect
   {
      
      public static var init__:Boolean;
      
      public static var TYPE:StatusEffectType;
      
      public function VineTangled(param1:int = 3)
      {
         if(Boot.skip_constructor)
         {
            return;
         }
         super(VineTangled.TYPE,"");
         setDuration(param1);
      }
      
      override public function onRemove() : void
      {
         get_host().isImmobilized = false;
         super.onRemove();
      }
      
      override public function onCombatRound() : void
      {
         get_host().immobilize();
         super.onCombatRound();
      }
      
      override public function onCombatEnd() : void
      {
         get_host().isImmobilized = false;
         super.onCombatEnd();
      }
      
      override public function apply(param1:Boolean) : void
      {
         if(get_playerHost() != null)
         {
            setUpdateString("藤蔓缠绕着你的[legs]，将你固定在原地。");
            setRemoveString("你成功地将你的[legs]从藤蔓中挣脱出来！");
         }
         get_host().immobilize();
         super.apply(param1);
      }
   }
}

