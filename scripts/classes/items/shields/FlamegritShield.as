package classes.items.shields
{
   import classes.internals._ValueFunc.NumberFunc_Impl_;
   import classes.items.Shield;
   import classes.scenes.Camp;
   import flash.Boot;
   
   public class FlamegritShield extends Shield
   {
      
      public function FlamegritShield()
      {
         if(Boot.skip_constructor)
         {
            return;
         }
         super("Flamegrit Shield","FlamegritShield","Flamegrit Shield","a Flamegrit Shield",14,1500,"This large, black and gold circular shield pulses constantly with orange waves of energy. An image of an everlasting flame is engraved in its center. This shield will help you regain health every turn, proportional to the number of followers and lovers in your camp.\n\n<i>Inquisitors knew that only through unity would they prevail against the demon menace, and some say they fell due to betrayal.</i>");
         boost("生命恢复 (固定值)",NumberFunc_Impl_.fromFloatFun(getHealMag),false);
         _headerName = "Flamegrit Shield";
      }
      
      public function getHealMag() : Number
      {
         return int(Math.round((get_camp().followersCount() + get_camp().loversCount()) * 1.75));
      }
   }
}

