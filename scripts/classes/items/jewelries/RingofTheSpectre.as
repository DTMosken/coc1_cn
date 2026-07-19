package classes.items.jewelries
{
   import classes.internals._ValueFunc.NumberFunc_Impl_;
   import classes.items.Jewelry;
   import flash.Boot;
   
   public class RingofTheSpectre extends Jewelry
   {
      
      public function RingofTheSpectre()
      {
         if(Boot.skip_constructor)
         {
            return;
         }
         super("SpectrRing","Specter Ring","Ring of the Specter","a plain silver ring",0,1,5000,"An enchanted plain-looking silver ring. It boosts the wearer\'s agility and critical precision, at the cost of reducing their health. It\'s likely that whoever crafted this wished to remain inconspicuous, and perhaps went too far in pursuing this end. ","Ring");
         boost("闪避几率",NumberFunc_Impl_.fromInt(20),false);
         boost("暴击率",NumberFunc_Impl_.fromInt(15),false);
         boost("最大生命值",NumberFunc_Impl_.fromFloat(0.6),true);
      }
   }
}

