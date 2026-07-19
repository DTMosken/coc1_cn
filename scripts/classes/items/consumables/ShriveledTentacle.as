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
   
   public class ShriveledTentacle extends Consumable
   {
      
      public function ShriveledTentacle()
      {
         if(Boot.skip_constructor)
         {
            return;
         }
         super("DryTent","Dry Tentacle","a shriveled tentacle",6,"A dried tentacle from one of the lake anemones. It\'s probably edible, but the stingers are still a little active.");
      }
      
      override public function useItem() : Boolean
      {
         var _loc1_:String = "shriveledTentacle";
         var _loc2_:int = 0;
         get_mutations().initTransformation([2,3]);
         outputText("你咀嚼着那根橡胶般的触手；它的质地和味道有点像鱿鱼，但半休眠的刺细胞让你的嘴巴感到敏感的刺痛。");
         if(Utils.rand(3) == 0 && get_player().get_tou100() < 50 && get_changes() < get_changeLimit())
         {
            outputText("[pg]你的皮肤感觉湿冷，有点像橡胶。你试探性地摸了摸自己，发现几乎感觉不到指尖的压力。在好奇心的驱使下，你轻轻地在自己的手臂上打了一拳；你最多只感觉到一阵隐隐的悸动！");
            dynStats(DynStat.Tou(1),DynStat.Sens(-1));
         }
         if(Utils.rand(3) == 0 && get_player().get_spe100() > 40 && get_changes() < get_changeLimit())
         {
            outputText("[pg]一种针扎般的感觉从你的胃部一直辐射到膝盖，就好像你的腿睡着了一样。你微微摇晃着站起来，踉跄地走了几步，让血液重新流回腿部。这种感觉消退了，但你的优雅并没有恢复，你又踉跄了一下。在接下来的一段时间里，你四处走动时必须更加小心。");
            dynStats(DynStat.Spe(-1));
         }
         if(Utils.rand(3) == 0 && get_player().cor < 20 && get_changes() < get_changeLimit())
         {
            outputText("[pg]你打了个寒颤，一种突如其来的寒意流遍了你的四肢。");
            set_changes(get_changes() + 1);
            dynStats(DynStat.Cor(1));
         }
         if(get_player().neck.type != 0 && get_changes() < get_changeLimit() && Utils.rand(4) == 0)
         {
            get_mutations().restoreNeck(_loc1_);
         }
         if(get_player().hasNonSharkRearBody() && get_changes() < get_changeLimit() && Utils.rand(5) == 0)
         {
            get_mutations().restoreRearBody(_loc1_);
         }
         if(Utils.rand(5) == 0)
         {
            get_mutations().updateOvipositionPerk(_loc1_);
         }
         if(Utils.rand(4) == 0 && get_changes() < get_changeLimit() && get_player().tail.type == 6)
         {
            outputText("[pg]随着触手残留毒液的轻微刺痛感传遍你的全身，它开始在你的股沟上方聚集并加剧。回头一看，你注意到你的腹部在颤抖和收缩；伴随着“啪”的一声，几丁质的附肢顺利地从你的臀部分离，掉在地上。<b>你不再拥有蜂娘腹部了！</b>[pg]");
            get_player().tail.type = 0;
            set_changes(get_changes() + 1);
         }
         if(Utils.rand(4) == 0 && (get_player().wings.type == 1 || get_player().wings.type == 2) && get_changes() < get_changeLimit())
         {
            outputText("[pg]你的翅膀不由自主地抽搐和拍打着。你尽力伸长脖子去看它们；从你能看到的来看，它们似乎正在萎缩和卷曲。它们开始看起来很像刚长出来时的样子，湿漉漉的，崭新的。<b>就在你注视的时候，它们完全萎缩了，然后缩回了你的体内。</b>");
            get_player().wings.type = 0;
            set_changes(get_changes() + 1);
         }
         if(get_player().gills.type == 1 && get_player().hair.type != 4 && get_changes() < get_changeLimit() && Utils.rand(5) == 0)
         {
            outputText("[pg]你的平衡感完全消失了，随着质量集中在你的头部，你一屁股坐在了地上。你伸出手，当你感觉到原本应该是头发的地方有一根令人不安的粗壮、蠕动的东西时，你发出了一声尖叫。把它拉到眼前，你注意到它仍然连在你的头上；更重要的是，它的颜色和你以前的头发一样。<b>你现在用蠕动的触手代替了头发！</b>当你凝视着它时，一股温和的热量开始弥漫你的手。这些触手一定是在发育它们特有的毒刺！你赶紧松开手；你必须小心，不要让它们在任何时候摩擦到你的皮肤。另一方面，它们很短，你发现你现在可以像控制其他肌肉一样弯曲和伸展它们，所以这应该不会太难。你现在决定采用一种大胆的、被风吹过的造型。");
            get_player().hair.type = 4;
            get_player().hair.length = 5;
            if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,66) == 0)
            {
               outputText("<b>（你的头发已经停止生长了。）</b>");
               FlagDict_Impl_.arrayWriteInt(KFLAGS.flags,66,1);
            }
            set_changes(get_changes() + 1);
            set_changes(get_changes() + 1);
            set_changes(get_changes() + 1);
         }
         if(Utils.rand(5) == 0 && get_player().gills.type != 1 && get_player().skin.tone == "aphotic blue-black" && get_changes() < get_changeLimit())
         {
            get_mutations().updateGills(1);
         }
         if(Utils.rand(5) == 0 && get_changes() < get_changeLimit() && get_player().skin.tone != "aphotic blue-black")
         {
            outputText("[pg]你心不在焉地咬下最后一点触手，然后把手抽开，痛得倒吸一口凉气。你是怎么把手指咬得这么重的？低头一看，答案显而易见；<b>你的手，连同你其余的皮肤，现在变成了和休眠触手一样深不见底的颜色！</b>");
            get_player().skin.tone = "aphotic blue-black";
            get_player().arms.updateClaws(get_player().arms.claws.type);
            set_changes(get_changes() + 1);
         }
         if(get_player().hair.type == 4 && get_player().hair.length < 36 && Utils.rand(2) == 0 && get_changes() < get_changeLimit())
         {
            _loc2_ = 5 + Utils.rand(3);
            var _temp_1:* = get_player().hair;
            _temp_1.length = _temp_1.length + _loc2_;
            outputText("[pg]当你费力地咀嚼着橡胶般的干海葵时，你的头开始感觉更重了。利用你新获得的控制力，你像蛇一样将自己的一根触手向前伸出；把它举到你能看到的地方，你注意到的第一件事是它看起来长了很多。<b>你的头部触手现在长了" + Utils.num2Text(_loc2_) + "英寸！</b>");
            set_changes(get_changes() + 1);
         }
         get_player().refillHunger(20);
         var _loc3_:IMap = KFLAGS.flags;
         FlagDict_Impl_.arrayWriteInt(_loc3_,2077,FlagDict_Impl_.arrayReadInt(_loc3_,2077) + get_changes());
         return false;
      }
   }
}

