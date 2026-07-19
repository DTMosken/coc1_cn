package classes.statusEffects.combat
{
   import classes.CoC;
   import classes.Creature;
   import classes.Monster;
   import classes.StatusEffect;
   import classes.StatusEffectType;
   import classes.internals.Utils;
   import flash.Boot;
   
   public class DivineWindBuff extends TimedStatusEffect
   {
      
      public static var init__:Boolean;
      
      public static var TYPE:StatusEffectType;
      
      public var casterSpellPower:Number;
      
      public function DivineWindBuff(param1:int = 1)
      {
         if(Boot.skip_constructor)
         {
            return;
         }
         casterSpellPower = Number(Math.NaN);
         super(DivineWindBuff.TYPE,"");
         setDuration(param1);
         setUpdateString("神圣之风席卷了战场。");
         setRemoveString("风的魔力消退了，其治愈效果也随之消失。");
      }
      
      override public function onCombatRound() : void
      {
         var _loc4_:* = null as Monster;
         var _loc1_:Number = healCalc();
         var _loc2_:int = 0;
         var _loc3_:Array = StatusEffect.get_game().monsterArray;
         while(_loc2_ < int(_loc3_.length))
         {
            _loc4_ = _loc3_[_loc2_];
            _loc2_++;
            if(Utils.rand(4) < 2)
            {
               StatusEffect.get_game().outputText("[pg-]" + _loc4_.get_capitalA() + _loc4_.get_short() + "被治愈了！");
               _loc4_.HPChange(_loc1_,true);
               StatusEffect.get_game().outputText("[pg-]");
            }
         }
         if(Utils.rand(4) < 3)
         {
            StatusEffect.get_game().player.HPChange(_loc1_,true);
         }
         super.onCombatRound();
      }
      
      public function healCalc() : Number
      {
         return int((get_host().level + get_host().get_inte() / 1.5 + Utils.rand(get_host().get_inte())) * get_host().spellMod()) * 0.6;
      }
   }
}

