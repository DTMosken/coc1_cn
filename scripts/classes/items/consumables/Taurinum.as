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
   
   public class Taurinum extends Consumable
   {
      
      public function Taurinum()
      {
         if(Boot.skip_constructor)
         {
            return;
         }
         super("Taurico","Taurinum","a vial of Taurinum",6,"This is a long flared vial with a small label that reads, \"Taurinum\". It is likely this potion is tied to centaurs in some way.");
      }
      
      override public function useItem() : Boolean
      {
         get_mutations().initTransformation([3]);
         get_player().slimeFeed();
         outputText("你喝下药水，对强烈的味道做出了鬼脸。");
         if(get_changes() < get_changeLimit() && Utils.rand(2) == 0 && get_player().get_spe100() < 80)
         {
            outputText("[pg]喝下药水后，你感觉快了一点。");
            dynStats(DynStat.Spe(1));
         }
         if(get_changes() < get_changeLimit() && Utils.rand(2) == 0 && get_player().lowerBody.type == 1 && !get_player().isTaur())
         {
            set_changes(get_changes() + 1);
            outputText("[pg]当你感觉到你的脊梁骨折断时，巨大的痛苦笼罩着你。痛苦并没有停止，当你的脊柱变长，从你的背部长出新的肉，你腿部的骨头弯曲和扭曲时，你晕了过去。随着变化的完成，肌肉群变移并重新排列，当你的意识恢复时，疼痛消失了。<b>你现在有了半人马的下半身</b>。");
            if(get_player().get_gender() > 0)
            {
               outputText("花了一点时间适应你的新身体后，你注意到你的生殖器现在位于你半人马身体的后腿之间。");
            }
            dynStats(DynStat.Spe(3));
            get_player().lowerBody.legCount = 4;
            if(get_player().tail.type == 0)
            {
               get_player().tail.type = 1;
            }
         }
         if(get_player().lowerBody.type != 1 && !get_player().isTaur())
         {
            if(get_changes() < get_changeLimit() && Utils.rand(3) == 0)
            {
               set_changes(get_changes() + 1);
               if(get_player().hasTailInsteadOfLegs())
               {
                  outputText("[pg]当你的蜿蜒的[if (isNaga) {蛇}]尾巴撕裂成两半，变移成腿时，你倒下了。疼痛是巨大的，特别是在你的新脚向内卷曲并变成蹄子时！");
                  get_player().lowerBody.type = 1;
                  get_player().tail.type = 1;
               }
               else
               {
                  if(get_player().lowerBody.type == 0)
                  {
                     get_player().lowerBody.type = 1;
                     if(get_player().tail.type == 0)
                     {
                        get_player().tail.type = 1;
                     }
                  }
                  outputText("[pg]当你感觉到你的脊梁骨折断时，巨大的痛苦笼罩着你。痛苦并没有停止，当你的脊柱变长，从你的背部长出新的肉，你腿部的骨头弯曲和扭曲时，你晕了过去。随着变化的完成，肌肉群变移并重新排列，当你的意识恢复时，疼痛消失了。<b>你现在有了野兽的下半身！</b>");
               }
               if(get_player().get_gender() > 0)
               {
                  outputText("花了一点时间适应你的新身体后，你注意到你的生殖器现在位于你身体的后腿之间。");
               }
               dynStats(DynStat.Spe(3));
               get_player().lowerBody.legCount = 4;
               set_changes(get_changes() + 1);
            }
         }
         var _loc1_:IMap = KFLAGS.flags;
         FlagDict_Impl_.arrayWriteInt(_loc1_,2077,FlagDict_Impl_.arrayReadInt(_loc1_,2077) + get_changes());
         return false;
      }
   }
}

