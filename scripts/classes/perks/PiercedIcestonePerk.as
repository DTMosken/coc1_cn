package classes.perks
{
   import classes.Perk;
   import classes.PerkType;
   import classes.internals._ValueFunc.NumberFunc_Impl_;
   import flash.Boot;
   
   public class PiercedIcestonePerk extends PerkType
   {
      
      public function PiercedIcestonePerk()
      {
         if(Boot.skip_constructor)
         {
            return;
         }
         super("Pierced: Icestone","Pierced: Icestone","You\'ve been pierced with Icestone and your lust seems to stay a bit lower than before.");
         boost("最低欲望",NumberFunc_Impl_.fromFloatFun(minLustBoost),false);
      }
      
      public function minLustBoost() : Number
      {
         return -getOwnValue(0);
      }
      
      override public function desc(param1:Perk = undefined) : String
      {
         return "最低性欲降低 " + Math.round(param1.value1) + "。";
      }
   }
}

