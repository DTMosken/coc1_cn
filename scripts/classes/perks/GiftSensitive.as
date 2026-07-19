package classes.perks
{
   import classes.Perk;
   import classes.PerkType;
   import classes.internals._ValueFunc.NumberFunc_Impl_;
   import flash.Boot;
   
   public class GiftSensitive extends PerkType
   {
      
      public function GiftSensitive()
      {
         if(Boot.skip_constructor)
         {
            return;
         }
         super("Sensitive","Sensitive","Gains sensitivity faster.");
         boost("敏感度增加",NumberFunc_Impl_.fromFloatFun(bonus),true);
      }
      
      override public function keepOnAscension(param1:Boolean = false) : Boolean
      {
         return true;
      }
      
      override public function desc(param1:Perk = undefined) : String
      {
         return "敏感度成长速率提升 " + int(Math.round(100 * (bonus() - 1))) + "％。";
      }
      
      public function bonus() : Number
      {
         return 1.25;
      }
   }
}

