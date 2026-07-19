package classes.perks
{
   import classes.Perk;
   import classes.PerkType;
   import classes.internals._ValueFunc.NumberFunc_Impl_;
   import flash.Boot;
   
   public class HistoryDEUSVULTPerk extends PerkType
   {
      
      public function HistoryDEUSVULTPerk()
      {
         if(Boot.skip_constructor)
         {
            return;
         }
         super("History: Paladin","History: Paladin","Trained from birth to fight with holy purpose, you grow stronger and sate your lusts by vanquishing demons.");
         boost("全局伤害",NumberFunc_Impl_.fromFloatFun(getDeusVultDamage),true);
         boost("欲望抗性",NumberFunc_Impl_.fromFloatFun(getDeusVultLustRes),true);
         boost("最低性欲",NumberFunc_Impl_.fromInt(-2),false);
      }
      
      override public function keepOnAscension(param1:Boolean = false) : Boolean
      {
         return true;
      }
      
      public function getDeusVultLustRes() : Number
      {
         if(getOwnValue(1) == 0)
         {
            return 1.17;
         }
         return 1;
      }
      
      public function getDeusVultDamage() : Number
      {
         if(getOwnValue(1) == 0)
         {
            return 1 + getOwnValue(0) * 0.01;
         }
         return 0.75;
      }
      
      override public function desc(param1:Perk = undefined) : String
      {
         if(param1.value2 == 0)
         {
            return "使你的伤害提高<b>" + param1.value1 + "%</b>。使欲望抗性提高<b>15%</b>";
         }
         return "<b>腐化：</b>使伤害降低<b>25%</b>";
      }
   }
}

