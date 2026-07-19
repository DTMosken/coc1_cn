package classes.items.consumables
{
   import classes.CoC;
   import classes.Creature;
   import classes.Monster;
   import classes.Player;
   import classes.internals.Utils;
   import classes.items.Consumable;
   import classes.scenes.combat.AvoidDamageParameters;
   import classes.scenes.combat.Combat;
   import flash.Boot;
   
   public final class WingStick extends Consumable
   {
      
      public function WingStick()
      {
         if(Boot.skip_constructor)
         {
            return;
         }
         super("W.Stick","Wingstick","a wingstick",16,"A tri-bladed throwing weapon. Though good for only a single use, it\'s guaranteed to do high damage if it hits. Inflicts 40 to 100 base damage, affected by strength.");
         addTags("Thrown");
      }
      
      override public function useItem() : Boolean
      {
         var _loc4_:Number = NaN;
         outputText("你向敌人投掷了一个回旋镖！它笔直而准确地飞去，仿佛有自己的意识一般，在空中划出一道弧线飞向[themonster]！\n");
         var _loc1_:Combat = get_combat();
         var _loc2_:Creature = get_player();
         var _loc3_:Creature = get_monster();
         if(Boolean(_loc1_.combatAvoidDamage(new AvoidDamageParameters(true,false,false,null,null,get_monster().standardDodgeFunc(get_player(),10),_loc2_,_loc3_)).attackFailed))
         {
            outputText("不知怎么的，[themonster]的");
            if(!get_monster().get_plural())
            {
               outputText("");
            }
            outputText("惊人速度让[monster.him]躲过了旋转的刀刃！这个致命的装置在撞击到远处的物体时粉碎了。");
         }
         else
         {
            get_game().combat.damageType = "PhysicalR";
            _loc4_ = get_monster().reduceDamageCombat(50 + Utils.rand(61) + get_player().get_str() * 2);
            outputText("[Themonster]被回旋镖击中了！它在割伤[monster.him]的同时也碎裂了。");
            _loc4_ = get_game().combat.doDamage(_loc4_,true,true);
         }
         return false;
      }
      
      override public function getMaxStackSize() : int
      {
         return 20;
      }
      
      override public function canUse() : Boolean
      {
         if(get_game().get_inCombat())
         {
            return true;
         }
         outputText("没有目标可以投掷！");
         return false;
      }
   }
}

