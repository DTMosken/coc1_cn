package classes.items.consumables
{
   import classes.DynStat;
   import classes.Player;
   import classes._FlagDict.FlagDict_Impl_;
   import classes.globalFlags.KFLAGS;
   import classes.internals.Utils;
   import classes.items.Consumable;
   import classes.items.Mutations;
   import flash.Boot;
   import haxe.IMap;
   
   public class WinterPudding extends Consumable
   {
      
      public function WinterPudding()
      {
         if(Boot.skip_constructor)
         {
            return;
         }
         super("W.Pddng","WinterPudding","a slice of winter pudding",35,"A slice of delicious Winter Pudding. It smells wonderful.\n\nNote: Eating this might cause antlers to grow from your head.");
      }
      
      override public function useItem() : Boolean
      {
         var _loc2_:int = 0;
         var _loc1_:String = "winterPudding";
         set_changes(0);
         set_changeLimit(2);
         outputText("你把这块难消化的布丁塞进嘴里，白兰地奶油酱和苦涩的黑糖露的味道在你的嘴里混合。从它厚实的海绵状质地可以看出，它对你来说绝对不是什么好东西，所以它这么稀有大概也是件好事。");
         get_player().refillHunger(30);
         if(get_player().thickness < 100 || get_player().tone > 0)
         {
            outputText(get_player().modTone(0,2));
            outputText(get_player().modThickness(100,2));
         }
         outputText("[pg]你舔干净嘴唇，回味着温特布丁的味道。你感觉有点焦躁不安……");
         dynStats(DynStat.Lust(10 + get_player().lib / 10),DynStat.NoScale);
         if(get_player().horns.value == 0 && Utils.rand(2) == 0)
         {
            outputText("[pg]你听到头顶传来树枝断裂的声音。你头部两侧的小突起呈直线向外延伸，最终像一棵微型树一样向多个方向散开。调查了从你头上长出的奇特附属物后，情况变得明朗起来。<b>你长出了鹿角！</b>");
            get_player().horns.type = 5;
            _loc2_ = Utils.rand(12);
            get_player().horns.value = 4 + _loc2_;
            set_changes(get_changes() + 1);
         }
         else if(get_player().horns.value > 0 && get_player().horns.type != 5 && Utils.rand(2) == 0)
         {
            outputText("[pg]你听到头顶传来树枝断裂的声音。你头上的角开始疯狂地扭曲和旋转，它们的质地和大小发生了巨大的变化，直到它们看起来更像树木而不是其他任何东西。它们桀骜不驯地向外延伸，你得出了一个结论：<b>你不知怎么地长出了鹿角！</b>");
            get_player().horns.type = 5;
            _loc2_ = Utils.rand(12);
            get_player().horns.value = 4 + _loc2_;
            set_changes(get_changes() + 1);
         }
         if(Utils.rand(5) == 0)
         {
            get_mutations().updateOvipositionPerk(_loc1_);
         }
         var _loc3_:IMap = KFLAGS.flags;
         FlagDict_Impl_.arrayWriteInt(_loc3_,2077,FlagDict_Impl_.arrayReadInt(_loc3_,2077) + get_changes());
         return false;
      }
   }
}

