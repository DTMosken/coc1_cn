package classes.perks
{
   import classes.Perk;
   import classes.PerkType;
   import classes.internals._ValueFunc.NumberFunc_Impl_;
   import flash.Boot;
   
   public class AscensionMartialityPerk extends PerkType
   {
      
      public function AscensionMartialityPerk()
      {
         if(Boot.skip_constructor)
         {
            return;
         }
         super("Ascension: Martiality","Ascension: Martiality","","Increases physical damage by 2.5% per level, multiplicatively.");
         boost("物理伤害",NumberFunc_Impl_.fromFloatFun(getMultiplier),true);
      }
      
      override public function keepOnAscension(param1:Boolean = false) : Boolean
      {
         return true;
      }
      
      public function getMultiplier() : Number
      {
         return 1 + getOwnValue(0) * 0.025;
      }
      
      override public function desc(param1:Perk = undefined) : String
      {
         return "(等级：" + param1.value1 + "/" + 10 + ") 以乘算方式提升 " + param1.value1 * 2.5 + "% 物理伤害。";
      }
   }
}

