package classes.perks
{
   import classes.PerkType;
   import classes.internals._ValueFunc.NumberFunc_Impl_;
   import flash.Boot;
   
   public class EvadePerk extends PerkType
   {
      
      public function EvadePerk()
      {
         if(Boot.skip_constructor)
         {
            return;
         }
         super("Evade","Evade","Increases chances of evading enemy attacks.","You choose the \'Evade\' perk, allowing you to avoid enemy attacks more often!");
         boost("闪避几率",NumberFunc_Impl_.fromInt(10),false);
         setEnemyDesc("目标有额外 <b>10%</b> 的几率闪避。");
      }
      
      override public function keepOnAscension(param1:Boolean = false) : Boolean
      {
         return false;
      }
   }
}

