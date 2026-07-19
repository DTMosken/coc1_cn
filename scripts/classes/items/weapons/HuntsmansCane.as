package classes.items.weapons
{
   import classes.Monster;
   import classes.internals.Utils;
   import classes.internals._ValueFunc.NumberFunc_Impl_;
   import classes.items.Weapon;
   import flash.Boot;
   
   public class HuntsmansCane extends Weapon
   {
      
      public function HuntsmansCane()
      {
         if(Boot.skip_constructor)
         {
            return;
         }
         super("H. Cane","Huntsman\'s Cane","huntsman\'s cane","a cane that once belonged to Erlking",["swing","strike"],0,400,"A lightweight staff that once belonged to the Erlking. This ebony-black cane is made of polished wood and topped with a golden cap in the shape of a deer\'s head. It seems too light and delicate to be an effective weapon, but you could use it as such, though at the risk of breaking it.");
         addTags("Staff");
         boost("欲望抗性",NumberFunc_Impl_.fromFloat(1.5),true);
         boost("攻击伤害",NumberFunc_Impl_.fromFloat(0.5),true);
         boost("腐化增加",NumberFunc_Impl_.fromFloat(0.25),true);
      }
      
      override public function useText() : void
      {
         outputText("你装备了轻巧的手杖，想知道这么小的一根棍子是否有效。然而，手里拿着手杖，你感到非常专注，你怀疑有什么能分散你对目标的注意力。");
      }
      
      override public function describeAttack(param1:Object) : void
      {
         var _loc2_:Monster = param1.target;
         var _loc3_:Monster = _loc2_ != null ? _loc2_ : get_monster();
         var _loc4_:Object = param1.damage;
         var _loc5_:int = _loc4_ != null ? int(_loc4_) : 0;
         var _loc6_:* = param1.attackResult;
         var _loc7_:Object = _loc6_ != null ? Boolean(_loc6_.attackHit) : null;
         var _loc8_:Object = _loc7_ != null ? _loc7_ : param1.hit;
         var _loc9_:Boolean = _loc8_ != null ? Boolean(_loc8_) : true;
         var _loc10_:Object = param1.crit;
         var _loc11_:Boolean = _loc10_ != null && Boolean(_loc10_);
         if(_loc9_)
         {
            if(Utils.rand(2) == 0)
            {
               outputText("你在空中挥舞着你的手杖。轻巧的木头发出响亮的[i:咔嚓]声，这可能比痛苦更吵闹。");
            }
            else
            {
               outputText("你像挥舞剑一样挥舞着你的手杖，在空中划过。它砰的一声打在你的对手身上，但似乎并没有对他们造成太大的伤害。");
            }
            if(_loc11_)
            {
               outputText("<b>暴击。</b>");
            }
            outputText(get_combat().getDamageText(_loc5_));
         }
         else if(Utils.rand(2) == 0)
         {
            outputText("你挥舞手杖划破空气，完全没有击中敌人。");
         }
         else
         {
            outputText("你用手杖刺向敌人。手杖闪烁着金光，但并没有击中任何东西。");
         }
      }
   }
}

