package classes.items.consumables
{
   import classes.Appearance;
   import classes.Cock;
   import classes.CockTypesEnum;
   import classes.DynStat;
   import classes.Player;
   import classes._FlagDict.FlagDict_Impl_;
   import classes.globalFlags.KFLAGS;
   import classes.internals.Utils;
   import classes.items.Consumable;
   import classes.items.Mutations;
   import flash.Boot;
   import haxe.IMap;
   
   public class GoldenRind extends Consumable
   {
      
      public function GoldenRind()
      {
         if(Boot.skip_constructor)
         {
            return;
         }
         super("GldRind","Golden Rind","a golden rind",6,"This shimmering citrus peel is shaped like a corkscrew. It smells sweet and sour at the same time.");
      }
      
      override public function useItem() : Boolean
      {
         var _loc4_:int = 0;
         var _loc5_:int = 0;
         var _loc1_:String = "deerTFs";
         var _loc2_:int = 0;
         var _loc3_:int = 0;
         outputText("你把这片水果塞进嘴里，咀嚼时享受着它的香甜与酸爽。一股类似青柠的酸味刺激着你的感官，你感觉到身体深处传来一阵刺痛。");
         get_player().refillHunger(10);
         get_mutations().initTransformation([2,3],2);
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
         if(Utils.rand(3) == 0 && get_changes() < get_changeLimit() && get_player().ears.type != 17)
         {
            if(get_player().ears.type == -1)
            {
               outputText("[pg]你的头顶长出两个痛苦的肿块，形成水滴状的耳朵，上面覆盖着短毛。");
            }
            if(get_player().ears.type == 0)
            {
               outputText("[pg]你的耳朵在脸上痛苦地拉扯着，开始发生变化，向上移动到头顶，变成了直立的兽耳。");
            }
            if(get_player().ears.type == 2)
            {
               outputText("[pg]你的耳朵改变了形状，从狗耳变成了鹿耳！");
            }
            if(get_player().ears.type > 2)
            {
               outputText("[pg]你的耳朵改变了形状，变成了水滴状的鹿耳！");
            }
            outputText("<b>你现在拥有了鹿耳。</b>");
            get_player().ears.type = 17;
            set_changes(get_changes() + 1);
         }
         if(Utils.rand(3) == 0 && get_changes() < get_changeLimit() && get_player().ears.type == 17 && get_player().tail.type != 24)
         {
            outputText("[pg]你感觉到屁股上方一阵紧缩，就像有一只巨大的手在捏你。紧接着发出一声奇怪的\"噗\"声，紧缩感消失了。你转来转去，终于勉强伸长脖子，看到了你那<b>毛茸茸、一甩一甩的鹿尾巴。</b>");
            get_player().tail.type = 24;
            set_changes(get_changes() + 1);
         }
         if(Utils.rand(3) == 0 && get_changes() < get_changeLimit() && get_player().horns.type == 0)
         {
            outputText("[pg]你感到额头传来巨大的压力，你伸出手，摸到了两个新长出的角包。");
            get_player().horns.type = 5;
            get_player().horns.value = 1;
            set_changes(get_changes() + 1);
         }
         if(Utils.rand(3) == 0 && get_changes() < get_changeLimit() && get_player().horns.value > 0 && get_player().horns.type != 5)
         {
            outputText("[pg]你感觉到你的角向外延伸时传来一阵奇怪的扭曲感。你伸手去摸，意识到你现在长出了<b>分叉的雄鹿角。</b>");
            get_player().horns.type = 5;
            get_player().horns.value = 4;
            set_changes(get_changes() + 1);
         }
         if(Utils.rand(3) == 0 && get_changes() < get_changeLimit() && get_player().horns.type == 5 && get_player().horns.value < 30)
         {
            outputText("[pg]你感觉到你的鹿角传来一阵奇怪的扭曲感，它们向外延伸并分叉。你伸手去摸，发现你的鹿角现在分叉更多了。");
            if(get_player().horns.value < 20 && Utils.rand(2) == 0)
            {
               var _temp_1:* = get_player().horns;
               _temp_1.value = _temp_1.value + (1 + Utils.rand(4));
            }
            var _temp_2:* = get_player().horns;
            _temp_2.value = _temp_2.value + 1;
            outputText("数了数鹿角上的分叉数后，<b>你有 " + get_player().horns.value + " 个分叉。</b>");
            if(get_player().horns.value >= 30)
            {
               outputText("<b> 看来你的鹿角不能再尖了。</b>");
            }
            set_changes(get_changes() + 1);
         }
         if(get_mutations().tfNoFur() && Utils.rand(4) == 0 && get_changes() < get_changeLimit() && get_player().horns.value > 0 && !get_player().hasFur())
         {
            outputText("[pg]有那么一瞬间，仿佛有一缕阳光穿透了树冠。你眨了眨眼，发现你的皮毛变得斑驳起来，上面点缀着较浅的、阳光般的斑点。");
            get_player().skin.type = 1;
            get_player().skin.adj = "";
            get_player().skin.desc = "fur";
            get_player().skin.furColor = "棕色";
            get_player().underBody.type = 3;
            get_player().copySkinToUnderBody({"furColor":"white"});
            set_changes(get_changes() + 1);
         }
         if(Utils.rand(3) == 0 && get_changes() < get_changeLimit() && get_player().ears.type == 17 && (get_player().face.type != 0 && get_player().face.type != 23))
         {
            outputText("[pg]你的脸开始发热，突然你的视线被烟雾吞没。你一边咳嗽一边挥散烟雾，注意到你的面部特征发生了显著的变化。摸了摸自己，你确认你<b>再次拥有了一张正常的人类脸庞</b>。");
            get_player().face.type = 0;
            set_changes(get_changes() + 1);
         }
         if(Utils.rand(4) == 0 && get_changes() < get_changeLimit() && get_player().hasFur() && get_player().ears.type == 17 && get_player().tail.type == 24 && get_player().face.type != 23)
         {
            outputText("[pg]你感觉到下巴传来一阵摩擦声，鼻窦感到巨大的压力，脸颊向内收缩，紧接着下半张脸向前突出。你疯狂（又小心翼翼）地摸着自己的脸，惊讶地发现你<b>获得了鹿一般精致的面部特征。</b>");
            get_player().face.type = 23;
            set_changes(get_changes() + 1);
         }
         if(Utils.rand(4) == 0 && get_changes() < get_changeLimit() && get_player().ears.type == 17 && get_player().tail.type == 24 && get_player().hasFur() && get_player().lowerBody.type != 21)
         {
            if(get_player().lowerBody.type == 1)
            {
               outputText("[pg]你的蹄子传来一阵尖锐的刺痛感，伴随着一声响亮的“咔嚓”声。你惊恐地低下头，在两只蹄子之间来回跳跃，意识到你那坚实沉重的蹄子已经被精致的分趾蹄所取代。你眯起眼睛，还注意到你的双腿整体变细了一些——如果你非要猜的话，你觉得你现在看起来<b>更像鹿而不是马</b>。");
            }
            else
            {
               outputText("[pg]你感到脚部传来一阵奇怪的紧绷感，随着重心的偏移，你差点摔倒。不知为何，你现在正踮着脚尖保持平衡。你惊讶地低头看去，只见双腿变得纤细修长，脚部拉长并在末端变暗，直到你稳稳地站立在<b>两条优雅的鹿腿</b>上。");
            }
            get_player().lowerBody.type = 21;
            if(!get_player().isTaur() && !get_player().isBiped())
            {
               get_player().lowerBody.legCount = 2;
            }
            set_changes(get_changes() + 1);
         }
         if(Utils.rand(3) == 0 && get_changes() < get_changeLimit() && int(get_player().cocks.length) > 0)
         {
            _loc4_ = -1;
            _loc5_ = 0;
            while(_loc5_ < int(get_player().cocks.length))
            {
               if(get_player().cocks[_loc5_].get_cockType() != CockTypesEnum.HORSE)
               {
                  _loc4_ = _loc5_;
                  break;
               }
               _loc5_++;
            }
            if(_loc4_ != -1)
            {
               if(get_player().cocks[_loc4_].get_cockType() == CockTypesEnum.HUMAN || get_player().cocks[_loc4_].get_cockType().get_Index() > 2)
               {
                  outputText("[pg]你的" + get_player().cockDescript(_loc4_) + "开始感觉有些奇怪……你拉下裤子查看，发现它颜色变深，同时根部传来一阵紧绷感，皮肤似乎在那里聚拢。一个阴茎鞘开始在你的肉棒根部形成，收紧并将你的肉棒拉入深处。一股灼热感包围了你的阴茎，它突然长成了一根马鸡巴，让它以前的尺寸相形见绌。皮肤呈斑驳的棕黑色，感觉比平时更敏感。你的双手不可抗拒地被它吸引，你开始自慰，以极大的力量喷射出精液。");
               }
               if(get_player().cocks[_loc4_].get_cockType() == CockTypesEnum.DOG)
               {
                  outputText("[pg]你的" + Appearance.cockNoun(CockTypesEnum.DOG) + "开始感觉有些奇怪……你拉下衣服查看，发现它颜色变深。你感到" + Appearance.cockNoun(CockTypesEnum.DOG) + "的顶端越来越紧，因为它变平并向外展开。你的肉棒从阴茎鞘中推出，一寸又一寸的兽肉生长得超过了它传统的尺寸。你注意到你的阴茎结消失了，多余的肉从你的阴茎鞘中推出了更多新鲜的马鸡巴。<b>你的双手被这根奇怪的新" + Appearance.cockNoun(CockTypesEnum.HORSE) + "所吸引</b>，你开始自慰，以极大的力量喷射出浓稠的精液。");
               }
               get_player().cocks[_loc4_].set_cockType(CockTypesEnum.HORSE);
               get_player().increaseCock(_loc4_,4);
               dynStats(DynStat.Lib(5),DynStat.Sens(4),DynStat.Lust(35));
               outputText("<b> 你现在有了一根");
               if(get_player().countCocksOfType(CockTypesEnum.HORSE) > 1)
               {
                  outputText("额外的");
               }
               outputText("马鸡巴。</b>");
               set_changes(get_changes() + 1);
            }
         }
         if(Utils.rand(3) == 0 && get_player().tone > 20)
         {
            if(get_player().tone > 50)
            {
               get_player().modTone(20,2 + Utils.rand(3));
            }
            else
            {
               get_player().modTone(20,2);
            }
         }
         if(Utils.rand(3) == 0 && get_player().thickness > 20)
         {
            if(get_player().thickness > 50)
            {
               get_player().modThickness(20,2 + Utils.rand(3));
            }
            else
            {
               get_player().modThickness(20,2);
            }
         }
         var _loc6_:IMap = KFLAGS.flags;
         FlagDict_Impl_.arrayWriteInt(_loc6_,2077,FlagDict_Impl_.arrayReadInt(_loc6_,2077) + get_changes());
         return false;
      }
   }
}

