package classes.items.shields
{
   import classes.Player;
   import classes._FlagDict.FlagDict_Impl_;
   import classes.globalFlags.KFLAGS;
   import classes.internals.Utils;
   import classes.items.Shield;
   import flash.Boot;
   import haxe.IMap;
   
   public class DragonShellShield extends Shield
   {
      
      public function DragonShellShield()
      {
         if(Boot.skip_constructor)
         {
            return;
         }
         super("DrgnShl","Dragon Shield","dragon-shell shield","a dragon-shell shield",14,1500,"A durable shield that has been forged from the remains of the dragon egg you found in the swamp. Absorbs any fluid attacks you can catch, rendering them useless.");
      }
      
      override public function useText() : void
      {
         if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,535) == 0)
         {
            clearOutput();
            outputText("你翻转着这面坚固的盾牌仔细检查，对它的工艺感到满意，并调整了绑带，使其紧密贴合你的手臂。你试着挥舞了几下，却发现由于材质出乎意料的轻盈，每次挥动都会让你失去平衡。不过，你最终还是掌握了诀窍，在挥动时施加足够的重量以加快其在空中的速度，同时向前迈出一条腿来稳住自己，并试着用它猛击附近的一块岩石。你高兴地笑了起来，因为");
            if(get_player().get_str() < 80)
            {
               outputText("岩石表面的碎屑");
            }
            else
            {
               outputText("破碎的巨大岩石碎片");
            }
            outputText("向四面八方飞溅。");
            outputText("[pg]在又练习了几次猛击和移动，以熟悉它的重量后，你觉得你已经准备好带着你的新护具去面对敌人了。最后一件事……你脱下盾牌，将绑带朝下，往表面吐了口唾沫。令人满意的是，液体一接触到外壳就消失了。");
         }
         else
         {
            outputText("你装备了" + Utils.cnName(get_longName()) + "。");
         }
         var _loc1_:IMap = KFLAGS.flags;
         FlagDict_Impl_.arrayWriteInt(_loc1_,535,FlagDict_Impl_.arrayReadInt(_loc1_,535) + 1);
      }
      
      override public function get_description() : String
      {
         _description = FlagDict_Impl_.arrayReadInt(KFLAGS.flags,524) > 0 ? "一面坚固的盾牌，由烬在好感度满时给你的龙蛋壳锻造而成。" : "一面坚固的盾牌，由你在沼泽中发现的龙蛋残骸锻造而成。";
         var _loc1_:String = super.get_description();
         return _loc1_ + "\n特殊效果：吸收任何你能接住的液体攻击，使其变得毫无用处";
      }
   }
}

