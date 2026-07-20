package classes.masteries
{
   import classes.MasteryLib;
   import classes.MasteryType;
   import classes.Player;
   import classes.internals._ValueFunc.NumberFunc_Impl_;
   import flash.Boot;
   
   public class CastingMastery extends MasteryType
   {
      
      public function CastingMastery()
      {
         if(Boot.skip_constructor)
         {
            return;
         }
         super("Casting","Casting","General","Casting mastery");
         boost("法术消耗",NumberFunc_Impl_.fromFloatFun(costReduction),false);
      }
      
      override public function onLevel(param1:int, param2:Boolean = true) : void
      {
         super.onLevel(param1,param2);
         var _loc3_:String = null;
         switch(param1)
         {
            case 1:
            case 2:
            case 3:
            case 4:
            case 5:
               _loc3_ = "法术消耗降低。";
         }
         if(param2 && _loc3_ != "")
         {
            outputText(_loc3_ + "[pg-]");
         }
      }
      
      public function costReduction() : Number
      {
         return -10 * get_player().masteryLevel(MasteryLib.Casting);
      }
   }
}

