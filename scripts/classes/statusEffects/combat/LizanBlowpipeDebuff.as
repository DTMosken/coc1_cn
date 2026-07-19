package classes.statusEffects.combat
{
   import classes.Creature;
   import classes.DynStat;
   import classes.StatusEffectType;
   import flash.Boot;
   
   public class LizanBlowpipeDebuff extends CombatBuff
   {
      
      public static var init__:Boolean;
      
      public static var TYPE:StatusEffectType;
      
      public function LizanBlowpipeDebuff()
      {
         if(Boot.skip_constructor)
         {
            return;
         }
         super(LizanBlowpipeDebuff.TYPE,"str","tou","spe","sens");
      }
      
      public function debuffTouSens() : void
      {
         var _loc1_:Number = 5;
         if(!get_host().isPureEnough(50))
         {
            _loc1_ = 10;
         }
         buffHost(DynStat.Tou(-_loc1_),DynStat.Sens(_loc1_));
      }
      
      public function debuffStrSpe() : void
      {
         var _loc1_:Number = 5;
         if(!get_host().isPureEnough(50))
         {
            _loc1_ = 10;
         }
         buffHost(DynStat.Str(-_loc1_),DynStat.Spe(-_loc1_));
      }
   }
}

