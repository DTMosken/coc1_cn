package classes.perks
{
   import classes.PerkType;
   import classes.internals._ValueFunc.NumberFunc_Impl_;
   import flash.Boot;
   
   public class DemonBiologyBerk extends PerkType
   {
      
      public function DemonBiologyBerk()
      {
         if(Boot.skip_constructor)
         {
            return;
         }
         super("Demonic Biology","Demonic Biology","Your body has been altered to possess some demonic properties. You have 20 more maximum fatigue, but hunger and fatigue can only be recovered by having sex after combat. The lustier your opponent, the more fatigue and hunger are recovered.","Your body has been altered to possess some demonic properties. You have 20 more maximum fatigue, but hunger and fatigue can only be recovered by having sex after combat. The lustier your opponent, the more fatigue and hunger are recovered.");
         boost("最大疲劳度",NumberFunc_Impl_.fromInt(20),false);
      }
   }
}

