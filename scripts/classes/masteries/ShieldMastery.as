package classes.masteries
{
   import classes.MasteryType;
   import flash.Boot;
   
   public class ShieldMastery extends MasteryType
   {
      
      public function ShieldMastery()
      {
         if(Boot.skip_constructor)
         {
            return;
         }
         super("Shield","Shield","General","Shield mastery");
      }
      
      override public function onLevel(param1:int, param2:Boolean = true) : void
      {
         super.onLevel(param1,param2);
         var _loc3_:String = "";
         switch(param1)
         {
            case 1:
               _loc3_ = "[pg-]<b>盾击</b>已解锁！";
               break;
            case 2:
            case 3:
            case 4:
               _loc3_ = "[pg-]盾击伤害增加，疲劳消耗减少。";
               break;
            case 5:
               _loc3_ = "[pg-]盾击伤害增加，疲劳消耗减少。";
               _loc3_ += "[pg-]格挡几率增加。";
         }
         if(param2 && _loc3_ != "")
         {
            outputText(_loc3_ + "[pg-]");
         }
      }
   }
}

