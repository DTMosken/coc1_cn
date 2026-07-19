package classes.perks
{
   import classes.Perk;
   import classes.PerkType;
   import classes.internals._ValueFunc.NumberFunc_Impl_;
   import flash.Boot;
   
   public class GiftFrigid extends PerkType
   {
      
      public function GiftFrigid()
      {
         if(Boot.skip_constructor)
         {
            return;
         }
         super("Frigid","Frigid","Gains sensitivity slower.");
         boost("敏感度增加",NumberFunc_Impl_.fromFloatFun(bonus),true);
      }
      
      override public function keepOnAscension(param1:Boolean = false) : Boolean
      {
         return true;
      }
      
      override public function desc(param1:Perk = undefined) : String
      {
         return "敏感度成长速率降低 " + int(Math.round(100 * (1 - bonus()))) + "％。";
      }
      
      public function bonus() : Number
      {
         return 0.9;
      }
   }
}

