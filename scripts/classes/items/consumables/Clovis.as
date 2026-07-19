package classes.items.consumables
{
   import classes.BreastRow;
   import classes.DynStat;
   import classes.Player;
   import classes._FlagDict.FlagDict_Impl_;
   import classes.globalFlags.KFLAGS;
   import classes.internals.Utils;
   import classes.internals._OneOf.OneOf_Impl_;
   import classes.items.Consumable;
   import classes.items.Mutations;
   import flash.Boot;
   import haxe.IMap;
   import haxe.ds.Either;
   
   public class Clovis extends Consumable
   {
      
      public function Clovis()
      {
         if(Boot.skip_constructor)
         {
            return;
         }
         super("Clovis","Clovis","a bottle of Clovis",6,"This bottle is in the shape of a 4-leaf-clover and contains a soft pink potion. An image of a sheep is on the label along with text, [say: Clovis - to help you to live in clover.]");
      }
      
      override public function useItem() : Boolean
      {
         var _loc2_:* = null as Player;
         var _loc3_:* = null as Array;
         var _loc1_:String = "clovis";
         get_mutations().initTransformation([2,2]);
         outputText("你打开了克洛维斯的瓶子，它甜美的气味让你感到无忧无虑。你喝下里面的液体，放松地享受它带来的感觉，仿佛被一大朵毛茸茸的云彩拥抱着。");
         if(get_player().get_inte() > 90 && Utils.rand(3) == 0 && get_changes() < get_changeLimit())
         {
            dynStats(DynStat.Inte(-(Utils.rand(2) + 1)));
            outputText("[pg]药水带给你的平静感慢慢褪去，变成了一种呆滞的幸福感。你对世界上的一切都不在乎了，甚至不在乎你变笨了一点。");
         }
         if(Utils.rand(3) == 0 && get_changes() < get_changeLimit())
         {
            dynStats(DynStat.Tou(Utils.rand(2) + 1));
            outputText("[pg]当你喝完药水时，你感到一阵固执的骄傲感席卷全身。你确信现在没有什么能阻止你，即使是恶魔也不行。");
         }
         if(get_player().get_spe() < 75 && Utils.rand(3) == 0 && get_changes() < get_changeLimit())
         {
            dynStats(DynStat.Spe(Utils.rand(2) + 1));
            outputText("[pg]你感到一种奇怪的冲动，想要在附近溪流的岩石间跳跃，内心深处有一种脚步稳健和敏捷度增加的感觉。令你惊讶的是，你毫不费力地跳了过去。潮湿且不平坦的岩石对你提升的速度来说根本不算挑战。");
         }
         if(Utils.rand(3) == 0 && get_changes() < get_changeLimit())
         {
            dynStats(DynStat.Sens(-(Utils.rand(2) + 1)));
            outputText("[pg]你感觉触觉变得迟钝，一种轻微的麻木感传遍全身，仿佛真的被棉花包裹着一样。麻木感最终消退，让你不再那么容易受到敌人淫荡触摸的影响。");
         }
         if(Utils.rand(3) == 0 && get_changes() < get_changeLimit())
         {
            dynStats(DynStat.Cor(-(Utils.rand(3) + 2)));
            outputText("[pg]你闭上眼睛，感觉头脑变得更加清醒，一种纯净的白色光芒灼烧着你的身体。它用毛茸茸的柔软包裹着你，驱逐着你体内的污秽，起初有些灼痛，但随后变得舒缓。当你睁开眼睛时，你感觉自己在这个试图吞噬你的淫乱世界中，重新夺回了一些纯洁。");
            set_changes(get_changes() + 1);
         }
         if(get_player().get_tallness() > 67 && Utils.rand(2) == 0 && get_changes() < get_changeLimit())
         {
            _loc2_ = get_player();
            _loc2_.set_tallness(_loc2_.get_tallness() - (1 + Utils.rand(4)));
            outputText("[pg]你眨了眨眼，感觉重心变低了。你低下头，意识到地面离你更近了。你似乎变矮了！");
            set_changes(get_changes() + 1);
         }
         if(get_player().butt.rating < 6 && Utils.rand(3) == 0 && get_changes() < get_changeLimit())
         {
            var _temp_1:* = get_player().butt;
            _temp_1.rating = _temp_1.rating + (1 + Utils.rand(2));
            if(get_player().butt.rating > 6)
            {
               get_player().butt.rating = 6;
            }
            outputText("[pg]你感觉你的衣服在你的[butt]周围绷紧了，你的臀部正在变大。谢天谢地，在你的衣服被撑破之前，它停止了生长。当你用手抚摸紧绷的布料时，你忍不住揉捏起现在更加丰满的肉体。");
         }
         if(get_player().neck.type != 0 && get_changes() < get_changeLimit() && Utils.rand(4) == 0)
         {
            get_mutations().restoreNeck(_loc1_);
         }
         if(get_player().rearBody.type != 0 && get_changes() < get_changeLimit() && Utils.rand(5) == 0)
         {
            get_mutations().restoreRearBody(_loc1_);
         }
         if(get_player().ears.type != 19 && Utils.rand(3) == 0 && get_changes() < get_changeLimit())
         {
            if(get_player().ears.type == -1)
            {
               outputText("[pg]两个疼痛的肉包开始从你的头上长出来，长成水滴状并垂了下来。不仅如此，上面还覆盖着一层羊毛。");
            }
            else
            {
               outputText("[pg]你感觉你的耳朵在移动并拉长，变得更加松垂。它们呈现出更像水滴的形状，可爱地垂在你的头部两侧，上面还长出了一层轻柔的羊毛。");
            }
            get_player().ears.type = 19;
            outputText("<b>你现在有了绵羊耳朵！</b>");
            set_changes(get_changes() + 1);
         }
         if(get_player().tail.type != 27 && Utils.rand(3) == 0 && get_changes() < get_changeLimit())
         {
            outputText("[pg]你感觉你[butt]上方的肉在打结并发生变化。它扭曲着缠绕在一起，拉长后笔直地垂下。伴随着轻微的噗声，一层柔软蓬松的羊毛覆盖了它，你的新尾巴呈现出绵羊般毛茸茸的外观。");
            get_player().tail.type = 27;
            outputText("<b>你现在有了绵羊尾巴！</b>");
            set_changes(get_changes() + 1);
         }
         if(get_player().lowerBody.type != 21 && get_player().tail.type == 27 && Utils.rand(3) == 0 && get_changes() < get_changeLimit())
         {
            outputText("[pg]你感觉脚部传来一阵奇怪的紧绷感，随着重心的转移，你差点摔倒。不知为何，你现在是用脚趾在保持平衡。你惊讶地低头看去，只见你的双腿变细变短，双脚拉长并在末端变暗，一切都在变形，直到你靠两条绵羊腿保持平衡，上面还长着可爱的小蹄子。");
            get_player().lowerBody.type = 21;
            get_player().lowerBody.legCount = 2;
            outputText("<b>你现在长出了绵羊蹄！</b>");
            set_changes(get_changes() + 1);
         }
         if(get_player().horns.type != 9 && get_player().horns.type != 10 && get_player().ears.type == 19 && Utils.rand(3) == 0 && get_changes() < get_changeLimit())
         {
            if(get_player().horns.type != 0)
            {
               outputText("[pg]你感觉你的角突然碎裂，大块大块地掉落，直到它们剥落成虚无。");
            }
            outputText("[pg]一阵剧痛袭来，你紧紧抱住头。一对角慢慢从你的头骨中长出，向外向前卷曲成半圆形。那带有罗纹的卷角让你想起了英格纳姆的绵羊角。<b>你现在长出了绵羊角！</b>");
            get_player().horns.type = 9;
            get_player().horns.value = 1;
            set_changes(get_changes() + 1);
         }
         if(get_mutations().tfNoFur() && Utils.rand(3) == 0 && get_changes() < get_changeLimit() && get_player().lowerBody.legCount == 2 && get_player().lowerBody.type == 21 && get_player().horns.type == 9 && get_player().tail.type == 27 && get_player().ears.type == 19 && !get_player().hasWool())
         {
            _loc3_ = ["白色","黑色","灰色","银色","棕色","红褐色"];
            if(!get_player().hasFur())
            {
               outputText("[pg]伴随着几乎听得见的“噗”的一声，柔软的羊毛从你的身体上爆发出来。羊毛覆盖了你的整个中段和大腿，厚实而蓬松。它并没有完全隐藏你的性征，而是以一种诱人的方式遮掩着它们。你忍不住用手抚摸着你柔软的[furcolor]羊毛，陶醉在那毛茸茸的触感中。<b>你现在长出了绵羊毛！</b>");
            }
            else
            {
               outputText("[pg]你感觉你的毛发突然竖了起来，每一个毛囊都突然脱落，让你的皮肤变得光秃秃的。当你站在一堆脱落的毛发中时，你感到皮肤刺痛，你确信这不是因为寒冷。伴随着几乎可以听见的*砰*的一声，柔软的羊毛从你的身体里爆发出来。羊毛覆盖了你所有的腹部和大腿，厚实而蓬松。它并没有完全隐藏你的性特征，而是以一种诱人的方式遮蔽了它们。你忍不住用手抚摸你柔软的[furcolor]羊毛，陶醉在毛绒绒的感觉中。<b>你现在有了羊毛！</b>");
            }
            get_player().skin.type = 7;
            get_player().skin.desc = "wool";
            get_player().setFurColor(OneOf_Impl_.fromA(_loc3_),3);
            set_changes(get_changes() + 1);
         }
         if(get_player().horns.type == 9 && get_player().hasWool() && get_player().get_femininity() <= 45 && Utils.rand(3) == 0 && get_changes() < get_changeLimit())
         {
            outputText("[pg]你感到头部一阵熟悉的疼痛。你的角在生长！更多的带肋的角从你的头皮中长出，你的角在变粗的同时慢慢地完全卷曲。一旦一整圈角完成，它们就会变长，直到尖端朝前，塞在你的耳朵下面。你敬畏地用手指抚摸着你卷曲的角。这些可能会造成严重的伤害！或者至少能击晕你的敌人。<b>你现在有了公羊的角！</b>");
            get_player().horns.type = 10;
            get_player().horns.value = 2;
            set_changes(get_changes() + 1);
         }
         if(get_player().horns.type == 10 && Utils.rand(3) == 0 && get_changes() < get_changeLimit())
         {
            outputText("[pg]你呻吟着捂住头，因为你的角伸长了，变得更长了。");
            get_player().horns.type = 10;
            var _temp_2:* = get_player().horns;
            _temp_2.value = _temp_2.value + (1 + Utils.rand(3));
            set_changes(get_changes() + 1);
         }
         if(get_player().hasWool() && get_player().hair.type != 8 && get_player().get_femininity() >= 65 && Utils.rand(3) == 0 && get_changes() < get_changeLimit())
         {
            outputText("[pg]你的头发突然蓬松起来，就像充满了静电一样。你试图把它弄平，但似乎无法把它弄直。它像垫子一样不断弹回。你在附近的水坑里照了照。你的头发现在厚得多，变得相当卷曲和蓬松，就像羊毛一样。你意识到<b>你现在有了羊毛般的头发！</b>");
            get_player().hair.type = 8;
            set_changes(get_changes() + 1);
         }
         if(get_player().hips.rating < 10 && get_player().get_femininity() >= 65 && Utils.rand(3) == 0 && get_changes() < get_changeLimit())
         {
            outputText("[pg]你抓着自己的胯部，感觉它们在发生变化，变得更宽，甚至改变了你的站姿。你的胯部现在看起来更适合绵羊了，又大又好抱。");
            var _temp_3:* = get_player().hips;
            _temp_3.rating = _temp_3.rating + (Utils.rand(2) + 1);
            if(get_player().hips.rating > 10)
            {
               get_player().hips.rating = 10;
            }
            set_changes(get_changes() + 1);
         }
         if(get_player().breastRows[0].breastRating < 5 && get_player().get_femininity() >= 65 && Utils.rand(3) == 0 && get_changes() < get_changeLimit())
         {
            var _temp_4:* = get_player().breastRows[0];
            _temp_4.breastRating = _temp_4.breastRating + (Utils.rand(2) + 1);
            if(get_player().breastRows[0].breastRating > 5)
            {
               get_player().breastRows[0].breastRating = 5;
            }
            outputText("[pg]你的乳房在衣服里感到紧绷和疼痛，它们正在不断变大，直到达到[breastcup]才停下来。你揉捏着柔软的双球，逐渐适应了变大的乳房。");
            set_changes(get_changes() + 1);
         }
         var _loc4_:IMap = KFLAGS.flags;
         FlagDict_Impl_.arrayWriteInt(_loc4_,2077,FlagDict_Impl_.arrayReadInt(_loc4_,2077) + get_changes());
         return false;
      }
   }
}

