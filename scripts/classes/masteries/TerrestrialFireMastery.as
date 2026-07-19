package classes.masteries
{
   import classes.MasteryType;
   import classes.PerkLib;
   import flash.Boot;
   
   public class TerrestrialFireMastery extends MasteryType
   {
      
      public function TerrestrialFireMastery()
      {
         if(Boot.skip_constructor)
         {
            return;
         }
         super("Terrestrial Fire","Terrestrial Fire","General","Terresterial Fire mastery",1.5,5,false);
      }
      
      override public function onLevel(param1:int, param2:Boolean = true) : void
      {
         super.onLevel(param1,param2);
         var _loc3_:String = "你解锁了";
         switch(param1)
         {
            case 1:
               _loc3_ += "法术协同，以及新一阶的法术！";
               break;
            case 2:
               _loc3_ += "新一阶的法术！";
               if(get_player().hasPerk(PerkLib.Spellsword))
               {
                  _loc3_ += "[pg-]你的魔剑士特质现在可以与引燃配合使用了。";
               }
               break;
            case 3:
               _loc3_ += "新一阶的法术！";
               break;
            case 4:
               _loc3_ += "新一阶的法术！";
               break;
            case 5:
               _loc3_ = "[pg-]你觉得你可以将你的法术融合出惊人的效果，但你不太确定该怎么做。";
               break;
            default:
               _loc3_ = "";
         }
         if(param2 && _loc3_ != "")
         {
            outputText(_loc3_ + "[pg-]");
         }
      }
      
      override public function onAttach(param1:Boolean = true) : void
      {
      }
   }
}

