package classes.scenes.combat
{
   import classes.BaseContent;
   import classes.CoC;
   import classes.Creature;
   import classes.Monster;
   import classes.Player;
   import classes.internals.Utils;
   import flash.Boot;
   import haxe.Log;
   
   public class CombatAttackBuilder extends BaseContent
   {
      
      public static var EVASION_SPEED:String = "Speed";
      
      public static var EVASION_EVADE:String = "Evade";
      
      public static var EVASION_FLEXIBILITY:String = "Flexibility";
      
      public static var EVASION_MISDIRECTION:String = "Misdirection";
      
      public static var EVASION_UNHINDERED:String = "Unhindered";
      
      public static var EVASION_BLIND:String = "Blind";
      
      public var hasExecuted:Boolean;
      
      public var combatReactions:Object;
      
      public var attackingMonster:Monster;
      
      public var attackResults:Object;
      
      public var attack:AvoidDamageParameters;
      
      public function CombatAttackBuilder(param1:Monster = undefined)
      {
         if(Boot.skip_constructor)
         {
            return;
         }
         hasExecuted = false;
         attackResults = {
            "dodge":null,
            "parry":false,
            "block":false,
            "counter":false,
            "attackHit":true,
            "attackFailed":false
         };
         combatReactions = {
            "speed":"",
            "evade":"",
            "misdirection":"",
            "unhandled":"",
            "block":"",
            "parry":"",
            "flexibility":"",
            "blind":"",
            "counter":""
         };
         attack = new AvoidDamageParameters(false,false,false,false,null,null,null,null);
         super();
         if(param1 == null)
         {
            param1 = get_game().monster;
         }
         attack.toHitChance = get_player().standardDodgeFunc(param1);
         attackingMonster = param1;
      }
      
      public function setHitChance(param1:Number) : CombatAttackBuilder
      {
         attack.toHitChance = param1;
         return this;
      }
      
      public function setCustomParry(param1:String) : CombatAttackBuilder
      {
         combatReactions.parry = param1;
         return this;
      }
      
      public function setCustomDeflect(param1:String) : CombatAttackBuilder
      {
         combatReactions.parry = combatReactions.block = combatReactions.counter = param1;
         return this;
      }
      
      public function setCustomCounter(param1:String) : CombatAttackBuilder
      {
         combatReactions.counter = param1;
         return this;
      }
      
      public function setCustomBlock(param1:String) : CombatAttackBuilder
      {
         combatReactions.block = param1;
         return this;
      }
      
      public function setCustomAvoid(param1:String) : CombatAttackBuilder
      {
         combatReactions.flexibility = combatReactions.misdirection = combatReactions.evade = combatReactions.speed = combatReactions.unhandled = param1;
         return this;
      }
      
      public function outputAttackFailed() : void
      {
         var _loc1_:String = attackingMonster.get_themonster() + attackingMonster.get_possessive() + "的攻击[if (monster.plural) {}]";
         if(Boolean(attackResults.counter))
         {
            if(combatReactions.counter.length == 0)
            {
               outputText("你格挡并反击了敌人的攻击！");
            }
            else
            {
               outputText(combatReactions.counter);
            }
         }
         else if(attackResults.dodge == "Speed")
         {
            if(combatReactions.speed.length == 0)
            {
               attackingMonster.outputPlayerDodged(Utils.rand(3));
            }
            else
            {
               outputText(combatReactions.speed);
            }
         }
         else if(attackResults.dodge == "Evade")
         {
            if(combatReactions.evade.length == 0)
            {
               outputText("利用你躲避攻击的技巧，你预判并侧步躲开了" + _loc1_ + "。\n");
            }
            else
            {
               outputText(combatReactions.evade);
            }
         }
         else if(attackResults.dodge == "Misdirection")
         {
            if(combatReactions.misdirection.length == 0)
            {
               outputText("利用拉斐尔的教导，你预判并侧步躲开了" + _loc1_ + "。\n");
            }
            else
            {
               outputText(combatReactions.misdirection);
            }
         }
         else if(attackResults.dodge == "Flexibility")
         {
            if(combatReactions.flexibility.length == 0)
            {
               outputText("凭借你惊人的柔韧性，你挤出了" + _loc1_ + "的攻击范围。\n");
            }
            else
            {
               outputText(combatReactions.flexibility);
            }
         }
         else if(attackResults.dodge == "Blind")
         {
            if(combatReactions.blind.length == 0)
            {
               outputText(attackingMonster.get_Themonster() + "的盲目攻击完全没有打中你。\n");
            }
            else
            {
               outputText(combatReactions.blind);
            }
         }
         else if(attackResults.dodge != null)
         {
            if(combatReactions.evade.length == 0)
            {
               outputText("利用你卓越的战斗技巧，你成功地完全避开了攻击。\n");
            }
            else
            {
               outputText(combatReactions.evade);
            }
         }
         else if(Boolean(attackResults.parry))
         {
            if(combatReactions.parry.length == 0)
            {
               outputText("你成功地用你的[weapon]格挡了" + _loc1_ + "。\n");
            }
            else
            {
               outputText(combatReactions.parry);
            }
         }
         else if(Boolean(attackResults.block))
         {
            if(combatReactions.block.length == 0)
            {
               outputText("你用你的[shield]挡住了" + attackingMonster.get_themonster() + attackingMonster.get_possessive() + "的" + Utils.cnName(attackingMonster.get_weaponVerb()) + "！\n");
            }
            else
            {
               outputText(combatReactions.block);
            }
         }
      }
      
      public function isSuccessfulHit() : Boolean
      {
         return Boolean(attackResults.attackHit);
      }
      
      public function isSuccessfulBlock() : Boolean
      {
         return Boolean(attackResults.block);
      }
      
      public function isParried() : Boolean
      {
         return Boolean(attackResults.parry);
      }
      
      public function isDodged() : Boolean
      {
         return attackResults.dodge != null;
      }
      
      public function isCountered() : Boolean
      {
         return Boolean(attackResults.counter);
      }
      
      public function isBlocked() : Boolean
      {
         return Boolean(attackResults.block);
      }
      
      public function getResults() : Object
      {
         if(!hasExecuted)
         {
            Log.trace("Warning: Tried to get attack results without executing attack first.",{
               "fileName":"src/classes/scenes/combat/CombatAttackBuilder.hx",
               "lineNumber":99,
               "className":"classes.scenes.combat.CombatAttackBuilder",
               "methodName":"getResults"
            });
         }
         return attackResults;
      }
      
      public function getObject() : AvoidDamageParameters
      {
         return attack;
      }
      
      public function getDodgeType() : String
      {
         return attackResults.dodge;
      }
      
      public function executeAttack(param1:Boolean = true) : CombatAttackBuilder
      {
         attackResults = attackingMonster.combatAvoidDamage(attack);
         hasExecuted = true;
         if(param1 && !isSuccessfulHit())
         {
            outputAttackFailed();
         }
         return this;
      }
      
      public function canParry() : CombatAttackBuilder
      {
         attack.doParry = true;
         return this;
      }
      
      public function canDodge() : CombatAttackBuilder
      {
         attack.doDodge = true;
         return this;
      }
      
      public function canCounter() : CombatAttackBuilder
      {
         attack.doCounter = true;
         return this;
      }
      
      public function canBlock() : CombatAttackBuilder
      {
         attack.doBlock = true;
         return this;
      }
   }
}

