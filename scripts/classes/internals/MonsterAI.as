package classes.internals
{
   import classes.BaseContent;
   import classes.CoC;
   import classes.Monster;
   import classes.Player;
   import classes.StatusEffects;
   import classes.scenes.combat.CombatDistance;
   import classes.scenes.combat.CombatRange;
   import classes.scenes.combat.CombatRangeData;
   import flash.Boot;
   
   public class MonsterAI extends BaseContent implements RandomAction
   {
      
      public static var FATIGUE_NONE:int = 0;
      
      public static var FATIGUE_MAGICAL:int = 1;
      
      public static var FATIGUE_PHYSICAL:int = 2;
      
      public static var FATIGUE_MAGICAL_HEAL:int = 3;
      
      public static var spellCostCharge:int = 10;
      
      public static var spellCostBlind:int = 8;
      
      public static var spellCostWhitefire:int = 15;
      
      public static var spellCostArouse:int = 10;
      
      public static var spellCostHeal:int = 15;
      
      public static var spellCostMight:int = 10;
      
      public var waitWeight:int;
      
      public var sum:Number;
      
      public var rangedAmount:int;
      
      public var meleeAmount:int;
      
      public var flyingAmount:int;
      
      public var availableActions:Array;
      
      public function MonsterAI()
      {
         if(Boot.skip_constructor)
         {
            return;
         }
         sum = 0;
         waitWeight = 0;
         flyingAmount = 0;
         meleeAmount = 0;
         rangedAmount = 0;
         availableActions = [];
         super();
      }
      
      public function updateAbilityAmounts(param1:CombatRange, param2:Number) : void
      {
         sum += param2;
         switch(param1.index)
         {
            case 0:
               meleeAmount += 1;
               break;
            case 1:
            case 2:
            case 3:
            case 4:
               rangedAmount += 1;
               break;
            case 5:
               rangedAmount += 1;
               flyingAmount += 1;
               break;
            default:
            case 6:
         }
      }
      
      public function exec() : void
      {
         sum = Math.max(1,sum);
         get_monster().prefersRanged = false;
         if(waitWeight / int(availableActions.length) > 0.3 && get_monster().shouldWait())
         {
            add(get_game().monsterAbilities.wait,sum / 3,true,0,0,CombatRange.Self);
         }
         if(rangedAmount / int(availableActions.length) >= 0.3)
         {
            get_monster().prefersRanged = true;
         }
         if(get_monster().canMove())
         {
            switch(get_monster().distance.index)
            {
               case 0:
                  add(get_game().monsterAbilities.distanceSelf,sum / 5,get_monster().shouldMove(CombatDistance.Distant),15,2,CombatRange.Self);
                  break;
               case 1:
                  add(get_game().monsterAbilities.approach,sum / 5,get_monster().shouldMove(CombatDistance.Melee),15,2,CombatRange.Self);
            }
         }
         if(int(availableActions.length) == 0)
         {
            if(canExecute(true,0,0,get_monster().getRegularAttackRange()))
            {
               get_monster().eAttack();
            }
            else
            {
               get_game().monsterAbilities.wait();
            }
            return;
         }
         var _loc1_:MonsterAction = availableActions[0];
         var _loc2_:Number = Math.random() * sum;
         var _loc3_:int = 0;
         while(_loc2_ > 0 && _loc3_ < int(availableActions.length))
         {
            _loc1_ = availableActions[_loc3_];
            _loc2_ -= _loc1_.weight;
            _loc3_++;
         }
         get_monster().changeFatigue(_loc1_.cost,_loc1_.fatigueType);
         _loc1_.action();
         if(_loc1_.actionType.index == 6)
         {
            get_combatRangeData().closeDistance(get_monster());
         }
      }
      
      public function canExecute(param1:Boolean = true, param2:Number = 0, param3:int = 0, param4:CombatRange = undefined) : Boolean
      {
         if(param4 == null)
         {
            param4 = CombatRange.Melee;
         }
         if(param1 && get_monster().hasFatigue(param2,param3))
         {
            return get_combatRangeData().canReach(get_monster(),get_player(),get_monster().distance,param4);
         }
         return false;
      }
      
      public function addWhitefire() : void
      {
         add(get_game().monsterAbilities.whitefire,1,get_monster().get_lust() < 50,15,1,CombatRange.Ranged);
      }
      
      public function addWhiteMagic() : void
      {
         addWhitefire();
         addBlind();
         addChargeweapon();
      }
      
      public function addMight() : void
      {
         add(get_game().monsterAbilities.might,1,get_monster().get_lust() > 50,10,1,CombatRange.Self);
      }
      
      public function addHeal() : void
      {
         add(get_game().monsterAbilities.heal,1,get_monster().get_lust() > 60,15,3,CombatRange.Self);
      }
      
      public function addChargeweapon() : void
      {
         add(get_game().monsterAbilities.chargeweapon,1,get_monster().get_lust() < 50,10,1,CombatRange.Self);
      }
      
      public function addBlind() : void
      {
         add(get_game().monsterAbilities.blind,1,get_monster().get_lust() < 50 && !get_player().hasStatusEffect(StatusEffects.Blind),8,1,CombatRange.Ranged);
      }
      
      public function addBlackMagic() : void
      {
         addArouse();
         addHeal();
         addMight();
      }
      
      public function addArouse() : void
      {
         add(get_game().monsterAbilities.arouse,1,get_monster().get_lust() < 50,10,1,CombatRange.Ranged);
      }
      
      public function add(param1:Function, param2:Number = 1, param3:Boolean = true, param4:Number = 0, param5:int = 0, param6:CombatRange = undefined) : MonsterAI
      {
         if(param6 == null)
         {
            param6 = CombatRange.Melee;
         }
         if(canExecute(param3,param4,param5,param6))
         {
            availableActions.push(new MonsterAction(param1,param2,param3,param4,param5,param6));
            updateAbilityAmounts(param6,param2);
         }
         else if(param3 && !get_monster().hasFatigue(param4,param5))
         {
            waitWeight += 1;
         }
         return this;
      }
   }
}

