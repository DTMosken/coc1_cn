package classes.perks
{
   import classes.Perk;
   import classes.PerkType;
   import classes.internals._ValueFunc.NumberFunc_Impl_;
   import flash.Boot;
   
   public class AscensionMysticalityPerk extends PerkType
   {
      
      public function AscensionMysticalityPerk()
      {
         if(Boot.skip_constructor)
         {
            return;
         }
         super("Ascension: Mysticality","Ascension: Mysticality","","Increases spell effect multiplier by 5% per level, multiplicatively.");
         boost("法术修正",NumberFunc_Impl_.fromFloatFun(getMultiplier),true);
      }
      
      override public function keepOnAscension(param1:Boolean = false) : Boolean
      {
         return true;
      }
      
      public function getMultiplier() : Number
      {
         return 1 + getOwnValue(0) * 0.05;
      }
      
      override public function desc(param1:Perk = undefined) : String
      {
         return "(等级：" + param1.value1 + "/" + 10 + ") 以乘算方式提升 " + param1.value1 * 5 + "% 法术效果倍率。";
      }
   }
}

