package classes.items.consumables
{
   import classes.CoC;
   import classes.DynStat;
   import classes.Monster;
   import classes.Player;
   import classes._FlagDict.FlagDict_Impl_;
   import classes.globalFlags.KFLAGS;
   import classes.internals.Utils;
   import classes.items.Consumable;
   import classes.items.Mutations;
   import flash.Boot;
   import haxe.IMap;
   
   public class Beondegi extends Consumable
   {
      
      public function Beondegi()
      {
         if(Boot.skip_constructor)
         {
            return;
         }
         super("Beondegi","Beondegi","a beondegi",6,"Dark colored and squishy pasta-like bulbs.");
      }
      
      override public function useItem() : Boolean
      {
         var _loc1_:String = "Beondegi";
         dynStats(DynStat.Cor(3));
         outputText("你从包里拿出蚕蛹仔细端详。它闻起来有淡淡的坚果味，还带着一丝海水的咸香。你把它放进嘴里，发现味道和气味差不多，口感则像意大利面。它可能更适合用来煮汤，但你就这么直接吃也没什么问题。");
         if(get_game().get_inCombat() && get_monster().get_short() == "pod")
         {
            outputText("[pg]你刚嚼完，就觉得这个荚囊异常舒适，不再像是一个你必须对抗的威胁。显然你还是得离开，但也许它的危险被夸大了。");
            get_monster().cripple();
            return false;
         }
         get_mutations().initTransformation([1,2,3]);
         if(get_changes() < get_changeLimit() && get_player().hasFur() && Utils.trueOnceInN(5))
         {
            get_mutations().removeFur();
         }
         if(Utils.trueOnceInN(3))
         {
            outputText(get_player().modThickness(0,5));
         }
         if(get_changes() < get_changeLimit() && Utils.trueOnceInN(3) && get_player().ears.type != 24)
         {
            outputText("[pg]你的耳朵拉伸弯曲，所有的声音感觉在瞬间变得震耳欲聋，让你忍不住退缩。当你睁开眼睛时，你发现自己倒在地上，然后爬了起来。摸了摸头，你似乎长出了内部有小脊的[b:巨大的蝙蝠耳朵]。幸运的是，现在的噪音不像变形中途那样震耳欲聋了。");
            get_player().ears.type = 24;
            set_changes(get_changes() + 1);
         }
         if(get_changes() < get_changeLimit() && Utils.trueOnceInN(3) && get_player().wings.type != 7)
         {
            outputText("[pg]你肩膀周围的肌肉不舒服地聚拢在一起，随着你感觉到翅膀重量的增加，它们改变了结构以支撑你的翅膀。你尽可能地扭过头去查看，发现它们已经变成了[b:巨大的蝙蝠状恶魔翅膀]！");
            get_player().wings.type = 7;
            set_changes(get_changes() + 1);
         }
         if(get_changes() < get_changeLimit() && Utils.trueOnceInN(3) && get_player().lowerBody.legCount != 2)
         {
            get_mutations().restoreLegs(_loc1_);
         }
         if(get_changes() < get_changeLimit() && Utils.trueOnceInN(3) && get_player().lowerBody.legCount == 2 && get_player().lowerBody.type != 33)
         {
            get_player().lowerBody.type = 33;
            outputText("[pg]你的膝盖断了！你在震惊中仰面倒下，就在这极短的一瞬间，你曾经拥有的双腿扭曲变形，变成了肌肉发达的[b:长着爪子的蝙蝠腿]！");
            set_changes(get_changes() + 1);
         }
         if(get_changes() < get_changeLimit() && Utils.trueOnceInN(3) && get_mutations().tfNoFur() && get_player().face.type != 30)
         {
            get_player().face.type = 30;
            outputText("[pg]你鼻子里一种燃烧般、闷热的感觉让你大声呻吟，它的结构扭曲着，直到你的脸变得像[b:蝙蝠]一样。");
            set_changes(get_changes() + 1);
         }
         get_player().refillHunger(20);
         var _loc2_:IMap = KFLAGS.flags;
         FlagDict_Impl_.arrayWriteInt(_loc2_,2077,FlagDict_Impl_.arrayReadInt(_loc2_,2077) + get_changes());
         return false;
      }
   }
}

