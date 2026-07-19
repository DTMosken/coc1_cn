package classes.perks
{
   import classes.Perk;
   import classes.PerkType;
   import classes.internals._ValueFunc.NumberFunc_Impl_;
   import flash.Boot;
   
   public class PiercedCrimstonePerk extends PerkType
   {
      
      public function PiercedCrimstonePerk()
      {
         if(Boot.skip_constructor)
         {
            return;
         }
         super("Pierced: Crimstone","Pierced: Crimstone","You\'ve been pierced with Crimstone and your lust seems to stay a bit higher than before.");
         boost("最低欲望",NumberFunc_Impl_.fromFloatFun(minLustBoost),false);
      }
      
      public function minLustBoost() : Number
      {
         return getOwnValue(0);
      }
      
      override public function desc(param1:Perk = undefined) : String
      {
         return "最低性欲提高 " + Math.round(param1.value1) + "。";
      }
   }
}

