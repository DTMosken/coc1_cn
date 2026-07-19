package classes.masteries
{
   import classes.MasteryType;
   import flash.Boot;
   
   public class BowMastery extends MasteryType
   {
      
      public function BowMastery()
      {
         if(Boot.skip_constructor)
         {
            return;
         }
         super("Bow","Bow","Weapon","Bow mastery");
      }
      
      override public function onLevel(param1:int, param2:Boolean = true) : void
      {
         super.onLevel(param1,param2);
         var _loc3_:String = "伤害和命中率提高，疲劳消耗降低。";
         if(param2 && _loc3_ != "")
         {
            outputText(_loc3_ + "[pg-]");
         }
      }
   }
}

