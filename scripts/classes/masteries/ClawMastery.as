package classes.masteries
{
   import classes.MasteryType;
   import classes.Player;
   import classes.items.Weapon;
   import flash.Boot;
   
   public class ClawMastery extends MasteryType
   {
      
      public function ClawMastery()
      {
         if(Boot.skip_constructor)
         {
            return;
         }
         super("Claw","Claw","Weapon","Claw mastery");
      }
      
      override public function onLevel(param1:int, param2:Boolean = true) : void
      {
         super.onLevel(param1,param2);
         var _loc3_:String = "伤害和命中率略微提升。";
         switch(param1)
         {
            case 2:
               _loc3_ += "[pg-]<b>无尽连打</b>已解锁！";
               break;
            case 3:
               _loc3_ += "[pg-]你现在可以用爪子格挡攻击了。";
         }
         if(get_player().get_weapon().isHybrid())
         {
            _loc3_ += "[pg-](你目前使用的是混合武器，它使用所有适用精通的平均等级)";
         }
         if(param2 && _loc3_ != "")
         {
            outputText(_loc3_ + "[pg-]");
         }
      }
   }
}

