package classes.scenes.combat
{
   import classes.BaseContent;
   import classes.Creature;
   import classes.Monster;
   import classes.PerkLib;
   import classes.Player;
   import flash.Boot;
   
   public class CombatRangeData extends BaseContent
   {
      
      public static var FATIGUE_NONE:int = 0;
      
      public static var FATIGUE_MAGICAL:int = 1;
      
      public static var FATIGUE_PHYSICAL:int = 2;
      
      public static var FATIGUE_MAGICAL_HEAL:int = 3;
      
      public function CombatRangeData()
      {
         if(Boot.skip_constructor)
         {
            return;
         }
         super();
      }
      
      public function resetDistance() : void
      {
         get_monster().distance = CombatDistance.Melee;
         get_monster().extraDistance = 0;
      }
      
      public function movePlayerDistant(param1:Monster) : void
      {
         param1.distance = CombatDistance.Distant;
         if(param1.hasPerk(PerkLib.Opportunist))
         {
            param1.attackOfOpportunity();
         }
      }
      
      public function moveMonsterDistant(param1:Monster) : void
      {
         param1.distance = CombatDistance.Distant;
         if(get_player().hasPerk(PerkLib.Opportunist))
         {
            get_player().attackOfOpportunity();
         }
      }
      
      public function moveDistantSafe(param1:Monster) : void
      {
         param1.distance = CombatDistance.Distant;
      }
      
      public function closeDistance(param1:Monster) : void
      {
         param1.extraDistance = int(Math.max(param1.extraDistance - 1,0));
         if(param1.extraDistance == 0)
         {
            param1.distance = CombatDistance.Melee;
         }
      }
      
      public function canReach(param1:Creature, param2:Creature, param3:CombatDistance, param4:CombatRange) : Boolean
      {
         var _loc5_:Boolean = param1.isFlying || param2.isFlying;
         var _loc6_:Boolean = param1.isFlying && param2.isFlying;
         switch(param4.index)
         {
            case 0:
               if(!_loc6_)
               {
                  if(!_loc5_)
                  {
                     if(param3.index == 0)
                     {
                        return true;
                     }
                     return false;
                  }
                  return false;
               }
               return true;
               break;
            case 1:
            case 2:
            case 3:
            case 4:
               return true;
            case 5:
               if(!_loc5_)
               {
                  if(param3.index == 0)
                  {
                     return true;
                  }
                  return false;
               }
               return true;
               break;
            case 6:
               if(!_loc6_)
               {
                  if(!_loc5_)
                  {
                     if(param3.index != 0)
                     {
                        return param2.extraDistance < 2;
                     }
                     return true;
                  }
                  return false;
               }
               return true;
               break;
            default:
               return;
         }
      }
   }
}

