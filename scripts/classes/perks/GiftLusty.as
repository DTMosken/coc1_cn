package classes.perks
{
   import classes.Perk;
   import classes.PerkType;
   import classes.internals._ValueFunc.NumberFunc_Impl_;
   import flash.Boot;
   
   public class GiftLusty extends PerkType
   {
      
      public function GiftLusty()
      {
         if(Boot.skip_constructor)
         {
            return;
         }
         super("Lusty","Lusty","Gains libido faster.");
         boost("性欲增加",NumberFunc_Impl_.fromFloatFun(bonus),true);
      }
      
      override public function keepOnAscension(param1:Boolean = false) : Boolean
      {
         return true;
      }
      
      override public function desc(param1:Perk = undefined) : String
      {
         return "欲望成长速率提升 " + int(Math.round(100 * (bonus() - 1))) + "％。";
      }
      
      public function bonus() : Number
      {
         return 1.25;
      }
   }
}

