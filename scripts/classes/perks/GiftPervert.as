package classes.perks
{
   import classes.Perk;
   import classes.PerkType;
   import classes.internals._ValueFunc.NumberFunc_Impl_;
   import flash.Boot;
   
   public class GiftPervert extends PerkType
   {
      
      public function GiftPervert()
      {
         if(Boot.skip_constructor)
         {
            return;
         }
         super("Pervert","Pervert","Gains corruption faster. Reduces corruption requirement for high-corruption variant of scenes.");
         boost("腐化增加",NumberFunc_Impl_.fromFloatFun(bonus),true);
      }
      
      override public function keepOnAscension(param1:Boolean = false) : Boolean
      {
         return true;
      }
      
      override public function desc(param1:Perk = undefined) : String
      {
         return "腐化度成长速率提升 " + int(Math.round(100 * (bonus() - 1))) + "%。降低高腐化度场景的腐化度要求。";
      }
      
      public function bonus() : Number
      {
         return 1.25;
      }
   }
}

