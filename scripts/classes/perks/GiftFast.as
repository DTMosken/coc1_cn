package classes.perks
{
   import classes.Perk;
   import classes.PerkType;
   import classes.internals._ValueFunc.NumberFunc_Impl_;
   import flash.Boot;
   
   public class GiftFast extends PerkType
   {
      
      public function GiftFast()
      {
         if(Boot.skip_constructor)
         {
            return;
         }
         super("Fast","Fast","Gains speed faster.");
         boost("速度增益",NumberFunc_Impl_.fromFloatFun(bonus),true);
      }
      
      override public function keepOnAscension(param1:Boolean = false) : Boolean
      {
         return true;
      }
      
      override public function desc(param1:Perk = undefined) : String
      {
         return "速度成长速率提升 " + int(Math.round(100 * (bonus() - 1))) + "％。";
      }
      
      public function bonus() : Number
      {
         if(host.isChild())
         {
            return 1.4;
         }
         return 1.25;
      }
   }
}

