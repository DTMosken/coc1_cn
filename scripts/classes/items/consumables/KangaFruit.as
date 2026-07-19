package classes.items.consumables
{
   import classes.CoC;
   import classes.Cock;
   import classes.CockTypesEnum;
   import classes.DynStat;
   import classes.PerkLib;
   import classes.Player;
   import classes._FlagDict.FlagDict_Impl_;
   import classes.globalFlags.KFLAGS;
   import classes.internals.Utils;
   import classes.items.Consumable;
   import classes.items.Mutations;
   import flash.Boot;
   import haxe.IMap;
   
   public class KangaFruit extends Consumable
   {
      
      public static var STANDARD:int = 0;
      
      public static var ENHANCED:int = 1;
      
      public var type:int;
      
      public function KangaFruit(param1:int = 0)
      {
         if(Boot.skip_constructor)
         {
            return;
         }
         type = 0;
         var _loc2_:String = null;
         var _loc3_:String = null;
         var _loc4_:String = null;
         var _loc5_:String = null;
         var _loc6_:int = 0;
         type = param1;
         switch(type)
         {
            case 0:
               _loc2_ = "KangaFt";
               _loc3_ = "Kanga Fruit";
               _loc4_ = "a piece of kanga fruit";
               _loc5_ = "一个黄色的、纤维状的管状荚囊。末端的裂口露出了里面许多块状的小种子。一股淡淡的发酵气味从它们身上飘散出来。";
               _loc6_ = 6;
               break;
            case 1:
               _loc2_ = "MghtyVg";
               _loc3_ = "MightyVeggie";
               _loc4_ = "a mightily enhanced piece of kanga fruit";
               _loc5_ = "一个黄色的、纤维状的管状荚囊。末端的裂口露出了里面许多凹凸不平的小种子。它们散发着轻微的发酵气味。由于露米的强化，它微微发光。";
               _loc6_ = 6;
         }
         super(_loc2_,_loc3_,_loc4_,_loc6_,_loc5_);
      }
      
      override public function useItem() : Boolean
      {
         var _loc3_:* = null as Player;
         var _loc5_:int = 0;
         var _loc1_:String = "kangaFruit";
         var _loc2_:int = type == 1 ? 3 : 1;
         get_mutations().initTransformation([2,2],_loc2_);
         outputText("你捏住荚囊的中间，迫使末端张开。你舀出一把散发着酵母味的种子，把它们塞进嘴里。呸！尝起来像湿透的烤焦面包……然而，你发现自己又抓了一把……");
         if(get_player().get_inte() < 10 && !get_player().isTFResistant())
         {
            if(get_player().get_inte() < 8 && get_player().kangaScore() >= 5)
            {
               outputText("[pg]当你啃食着这种纤维状的水果时，你原本就空洞的大脑继续变得更加空白，除了你慢慢咀嚼和吞咽你最喜欢的食物时下巴的动作外，什么也没留下。吞咽。咀嚼。吞咽。你甚至没有注意到你的姿势变差了，或者你的手臂变短了。你没有任何想法，开始弯下腰，但继续咀嚼着你爪子里的食物，仿佛这是世界上最正常的事情。牙齿咬进了你的一根手指，让你痛得叫了起来。凭借你仅存的理智，你看着你抽痛的爪子，发现你的袋鼠果已经吃完了！");
               outputText("[pg]你仍然很饿，满怀期待地舔着嘴唇，深吸了一大口气。附近还有更多那种美妙的水果！你用你那极其强壮的腿跳着去寻找它，随着每一次跳跃，它们的形状变得越来越野性。现在完全受本能驱使，你找到了几根从地里长出来的茎。你的肚子咕咕叫，提醒着你的饥饿，你开始大口吃起袋鼠果……");
               outputText("[pg]随着你仅存的自我意识进一步流失，你的身体现在已经完全变成了一只野生袋鼠，而你的心智也退化到了与之匹配的程度。吃完找到的那几颗果实后，你继续寻找更多美味的食物。虽然你后来路过了你的营地，但你没有任何记忆，也没有任何认出的迹象，只有一种淡淡的舒适和熟悉感。这里没有食物，所以你蹦跳着离开了。");
               get_game().gameOver();
               return false;
            }
            outputText("[pg]在咀嚼的过程中，你的心智变得越来越平静。你发现自己甚至很难想起你的任务，更不用说你的名字了。<b>也许再吃点袋鼠果会有帮助？</b>");
         }
         if(get_player().get_spe100() < 70 && Utils.rand(3) == 0)
         {
            if(get_player().get_spe100() < 40)
            {
               dynStats(DynStat.Spe(1));
            }
            dynStats(DynStat.Spe(1));
            outputText("[pg]吃下袋鼠果后，你的双腿充满了力量。你感觉自己能打破跳远纪录！带着这股新获得的力量，你尝试着进行了几次原地和助跑跳跃。你的步伐似乎也变大了；每一次有力的蹬地甚至能让你腾空而起。");
         }
         if(get_player().get_inte() > 2 && Utils.rand(3) == 0 && get_changes() < get_changeLimit())
         {
            if(get_player().get_inte() > 30)
            {
               outputText("[pg]你感到……焦躁不安。你环顾四周，试图决定哪个方向最有可能找到更多食物，暂时忘记了其他顾虑。你正准备出发寻找时，你的思绪重新集中，意识到你已经在营地里储存了一些。");
            }
            else if(get_player().get_inte() > 10)
            {
               outputText("[pg]你边吃边走神；你想象着如果能永远奔跑下去会是什么样子，在玛瑞斯的荒野上蹦跳，享受运动带来的纯粹快乐。你最后一次把袋鼠果送到嘴边，却发现上面已经没有能吃的部分了。这个想法让你猛地回过神来。");
            }
            else
            {
               outputText("[pg]吃着吃着，你忘却了一切，只是呆呆地盯着地上爬行的虫子。过了一会儿，你注意到嘴里唾液那乏味的味道，才意识到自己已经坐在那里，嚼着同一口食物整整五分钟了。你茫然地咽下去，又咬了一口，然后继续盯着地面。今天还有别的事要做吗？");
            }
            dynStats(DynStat.Inte(-1));
         }
         if(get_changes() < get_changeLimit() && Utils.rand(4) == 0 && get_player().hips.rating < 40)
         {
            outputText("[pg]当你的髋骨明显变宽时，你摇摇晃晃的，但不知怎么的，你并没有摔倒。事实上，在新的加宽站姿下，你甚至感觉更加稳定了。");
            var _temp_1:* = get_player().hips;
            _temp_1.rating = _temp_1.rating + 1;
            set_changes(get_changes() + 1);
         }
         if(Utils.rand(4) == 0)
         {
            get_mutations().restoreArms(_loc1_);
         }
         get_mutations().removeFeatheryHair();
         if(get_changes() < get_changeLimit() && Utils.rand(5) == 0 && get_player().eyes.type > 0)
         {
            if(get_player().eyes.type == 2)
            {
               outputText("[pg]你感到眼睛一阵刺痛，眨了眨眼。感觉就像黑色的白内障刚刚从你身上脱落，你不需要看自己的倒影就知道你的眼睛已经恢复了人类的模样。");
            }
            else
            {
               outputText("[pg]你眨了眨眼，踉跄了一下，一阵眩晕感似乎要把你的[feet]从你身下抽走。当你站稳并睁开眼睛时，你意识到似乎有些不同。你的视力不知怎么地改变了。");
               if(get_player().eyes.type == 1 || get_player().eyes.type == 7)
               {
                  outputText("你的蜘蛛眼不见了！</b>");
               }
               outputText("<b>你又拥有了正常的人类眼睛。</b>");
            }
            get_player().eyes.type = 0;
            get_player().eyes.count = 2;
            set_changes(get_changes() + 1);
         }
         if(get_player().ballSize >= 4 && get_changes() < get_changeLimit() && Utils.rand(2) == 0)
         {
            _loc3_ = get_player();
            --_loc3_.ballSize;
            var _temp_2:* = get_player();
            _temp_2.cumMultiplier = _temp_2.cumMultiplier + 1;
            outputText("[pg]你的[sack]紧紧贴着腹股沟，在变化时微微颤动。变化结束后，你轻轻捏了捏你的[balls]，发现它们变小了。即使体积减小了，它们感觉起来还是和以前一样重。");
            set_changes(get_changes() + 1);
         }
         if(get_player().hasVagina() && get_player().getClitLength() >= 4 && get_changes() < get_changeLimit() && Utils.rand(5) == 0)
         {
            outputText("[pg]痛苦的刺痛感穿过你的[clit]，一直延伸到肿胀的阴蒂包皮。天哪，感觉就像着火了一样痛！痛苦在它的长度上上下下蔓延，当疼痛终于消退时，这个女性器官已经缩小了一半。");
            get_player().setClitLength(get_player().getClitLength() / 2);
            set_changes(get_changes() + 1);
         }
         var _loc4_:int = get_player().biggestCockIndex();
         if(get_player().hasCock())
         {
            if(get_player().cocks[_loc4_].cockLength >= 16 && get_changes() < get_changeLimit() && Utils.rand(5) == 0)
            {
               outputText("[pg]一股翻滚的灼热地狱之火在你的" + get_player().cockDescript(_loc4_) + "中燃烧，让你痛得在泥土里弯下腰。你前后摇晃，泪水不受控制地顺着脸颊流下。当疼痛消退，你能够再次移动时，你发现这个可怜的器官已经失去了将近一半的大小。");
               var _temp_3:* = get_player().cocks[_loc4_];
               _temp_3.cockLength = _temp_3.cockLength / 2;
               var _temp_4:* = get_player().cocks[_loc4_];
               _temp_4.cockThickness = _temp_4.cockThickness / 1.5;
               if(get_player().cocks[_loc4_].cockThickness * 6 > get_player().cocks[_loc4_].cockLength)
               {
                  var _temp_5:* = get_player().cocks[_loc4_];
                  _temp_5.cockThickness = _temp_5.cockThickness - 0.2;
               }
               if(get_player().cocks[_loc4_].cockThickness * 8 > get_player().cocks[_loc4_].cockLength)
               {
                  var _temp_6:* = get_player().cocks[_loc4_];
                  _temp_6.cockThickness = _temp_6.cockThickness - 0.2;
               }
               if(get_player().cocks[_loc4_].cockThickness < 0.5)
               {
                  get_player().cocks[_loc4_].cockThickness = 0.5;
               }
               set_changes(get_changes() + 1);
            }
            if(get_player().countCocksOfType(CockTypesEnum.KANGAROO) < get_player().cockTotal() && (type == 1 && Utils.rand(2) == 0) && get_changes() < get_changeLimit())
            {
               outputText("[pg]你感觉到阴茎末端一阵剧烈的刺痛，猛地拉下衣服检查。在你的眼前，它的顶端塌陷成一个狭窄的尖端，后面的阴茎干开始收紧，呈现出圆锥形，然后缩回");
               if(get_player().hasSheath())
               {
                  outputText("你的阴茎鞘");
               }
               else
               {
                  outputText("在它根部形成的一个阴茎鞘");
               }
               outputText("。<b>你现在拥有了袋鼠的阴茎！</b>");
               _loc5_ = 0;
               while(_loc5_ < get_player().cockTotal())
               {
                  if(get_player().cocks[_loc5_].get_cockType() != CockTypesEnum.KANGAROO)
                  {
                     get_player().cocks[_loc5_].set_cockType(CockTypesEnum.KANGAROO);
                     break;
                  }
                  _loc5_++;
               }
               set_changes(get_changes() + 1);
            }
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
         if(get_mutations().tfNoFur() && get_player().face.type != 9 && (get_player().hasFur() && get_player().lowerBody.type == 14 || type == 1) && get_changes() < get_changeLimit() && Utils.rand(4) == 0)
         {
            if(get_player().face.type == 0 || get_player().face.type == 5 || get_player().face.type == 4 || get_player().face.type == 8)
            {
               outputText("[pg]你的鼻根突然一阵剧痛，就像有人在捏着它往外拉一样。你因疼痛闭上眼睛，双手捂住脸，能感觉到鼻子和上颚正在移动并拉长。你站在那里浑身发抖，这种感觉持续了大约二十秒。当疼痛消退后，你用手摸遍了整张脸；你摸到的是一个突出的长口鼻，末端长着胡须，一对扁平的鼻孔下是兔唇。你睁开眼睛，证实了这一点。<b>你现在长着一张袋鼠脸！哎呀妈呀！</b>");
            }
            else
            {
               outputText("[pg]你的鼻子一阵刺痛。当你把视线集中在鼻尖时，它抽搐着变成了一个类似于拉长的兔子口鼻的形状，还长着兔唇和胡须。<b>你现在长着一张袋鼠脸！</b>");
            }
            set_changes(get_changes() + 1);
            get_player().face.type = 9;
         }
         if(get_mutations().tfNoFur() && !get_player().hasFur() && (get_player().lowerBody.type == 14 || type == 1) && get_changes() < get_changeLimit() && Utils.rand(4) == 0)
         {
            set_changes(get_changes() + 1);
            outputText("[pg]你的[skindesc]到处都痒得厉害，你滑稽地试图同时抓挠所有地方。");
            get_player().skin.type = 1;
            get_player().skin.desc = "fur";
            get_player().skin.furColor = "棕色";
            get_player().underBody.restore();
            outputText("当你把手收回来时，你注意到手背上长出了[furcolor]的皮毛。你全身都在重复这一幕，被这东西覆盖了。<b>你现在有皮毛了！</b>");
         }
         if(get_player().lowerBody.type != 14 && (type == 1 || get_player().tail.type == 12) && get_changes() < get_changeLimit() && Utils.rand(4) == 0)
         {
            if(get_player().isTaur())
            {
               outputText("[pg]你的后腿突然摇晃并瘫软，导致你侧身摔倒。尽管你努力尝试，但你无法让它们停止痉挛以便重新站起来；当一种针扎般的感觉席卷你的下半身时，你疯狂地挥舞着你的蹄子。脊柱上隐隐作痛，让你痛苦地呻吟；就好像有人把整个书架放在你的肩膀上，你的脊柱被压缩得远远超出了极限。经过一分钟的痛苦后，压力消失了，你低头看着你的腿。不仅你的后腿不见了，而且你的前腿也变成了狗腿的形状，脚极长，中间的脚趾很突出！你开始揉搓双腿以恢复知觉，并尝试移动新脚。<b>你现在有袋鼠腿了！</b>");
            }
            else if(get_player().hasTailInsteadOfLegs())
            {
               outputText("[pg]你的尾巴颤抖着，然后剧烈地摇晃，让你脸朝下摔倒在地。当你试图弯下腰去看它时，你只能从眼角余光看到尾巴尖正在缩小，离开你的视野。你腰部以下的鳞片皮肤紧绷得令人难以忍受，然后裂开；你从中挣脱出来，却发现自己长出了一双长腿！当你摇摇晃晃地用你那新长出的、细长的脚站起来时，开始长出了一些毛发。<b>你现在有了袋鼠的腿！</b>[if (isNaga) { 现在，你打算拿那张巨大的蛇皮蜕怎么办？}]");
            }
            else if(get_player().lowerBody.type == 8)
            {
               outputText("[pg]你的史莱姆团不由自主地缩小并分开，露出了你的胯部。羞耻感淹没了你，你试图把它们拉到一起，但缩小的速度比你移动黏糊糊身体的速度还要快。没过多久，你已经没有多余的史莱姆可以移动了，你的下半身现在变成了一双湿滑的趾行腿，脚又长又窄。它们在空气中变干，当你寻找东西遮挡身体时，开始长出了一些毛发。<b>你现在拥有了袋鼠腿！</b>你叹了口气。看来这意味着又要穿回内裤了。");
            }
            else
            {
               outputText("[pg]随着跖骨的变长，你的脚开始发出咔咔声并发生变形。骨骼重组的疼痛让你的膝盖发软，你摔倒在地。在经历了感觉像是脚被拉扯的十五秒后，这种感觉停止了。你低头看着你的腿；它们大致变成了狗腿的形状，但脚非常长，中间的脚趾很突出！当你站起来时，你发现无论是平脚站立还是踮起脚尖站立，你都觉得同样舒服！<b>你现在拥有了袋鼠腿！</b>");
            }
            get_player().lowerBody.type = 14;
            get_player().lowerBody.legCount = 2;
            set_changes(get_changes() + 1);
         }
         if(get_player().tail.type != 12 && get_changes() < get_changeLimit() && Utils.rand(4) == 0 && (type == 1 || get_player().ears.type == 8))
         {
            if(get_player().tail.type == 0)
            {
               outputText("[pg]下半身一阵痛苦的压迫感让你站得笔直，动弹不得。起初你以为可能是胀气。不……有什么东西正在你的尾骨末端生长。为了不加剧疼痛，你一动不动地站着，有什么粗壮的东西从你衣服的后面顶了出来。疼痛消退后，你伸长脖子回头看；一条长长的、锥形的尾巴现在连在你的屁股上，而且已经长出了一层薄薄的毛发！<b>你现在拥有了袋鼠尾巴！</b>");
            }
            else if(get_player().tail.type == 5 || get_player().tail.type == 6)
            {
               outputText("[pg]你一吃完，你那甲壳状的后背就颤抖着裂开了。你尽力去查看，似乎绒毛正成团地脱落，甲壳也在剥落。当痉挛开始折磨你的身体并迫使你倒下时，");
               if(get_player().tail.type == 6)
               {
                  outputText("空心毒刺从末端掉落，连同毒腺一起脱落。");
               }
               else
               {
                  outputText("吐丝器从末端掉落，带走了你最后的蛛丝。");
               }
               outputText("等你恢复意识时，昆虫的甲壳已经完全脱落，取而代之的是一条又长又粗的肉质尾巴，取代了你引以为傲的昆虫腹部。<b>你现在有了一条袋鼠尾巴！</b>你擦去嘴边溢出的口水，漫不经心地摆动着你的新尾巴。");
            }
            else
            {
               outputText("[pg]你吃东西的时候，尾巴抽动了一下。它开始感觉变得肥大肿胀，你尽力想看看自己的屁股。你看到的景象与你的感觉一致，你的尾巴变粗并伸展成一个长长的圆锥形。<b>你现在有了一条袋鼠尾巴！</b>");
            }
            get_player().tail.type = 12;
            set_changes(get_changes() + 1);
         }
         if(get_player().ears.type != 8 && get_changes() < get_changeLimit() && Utils.rand(4) == 0)
         {
            if(get_player().ears.type == 7)
            {
               outputText("[pg]你的耳朵变硬并向两侧移动！你伸手去摸，发现它们向外指，而不是上下指；它们现在感觉也变宽了一点。当你触摸它们时，你能感觉到它们在原地旋转，以回应附近的声音。<b>你现在有了一对袋鼠耳朵！</b>");
            }
            else
            {
               outputText("[pg]你的耳朵痛苦地扭曲着，就像被向上猛拉一样，你捂住脑袋。摸索着它们，你发现它们正在生长！它们向上伸展，超过了你的指尖，然后拉扯感停止了。你小心翼翼地顺着它们的长度摸索；它们又长又硬，但现在向外指，并且随着你的倾听而旋转。<b>你现在有了一对袋鼠耳朵！</b>");
            }
            set_changes(get_changes() + 1);
            get_player().ears.type = 8;
         }
         if(!get_player().hasPerk(PerkLib.Diapause) && get_player().kangaScore() > 4 && Utils.rand(4) == 0 && get_changes() < get_changeLimit() && get_player().hasVagina())
         {
            get_player().createPerk(PerkLib.Diapause,0,0,0,0);
            outputText("[pg]你的子宫发出隆隆声，里面的东西发生了变化。\r\n<b>(你获得了滞育特质。当液体摄入不足时，怀孕将不会进展，而当液体充足时，怀孕进展会快得多。)</b>");
            set_changes(get_changes() + 1);
         }
         if(Utils.rand(4) == 0 && get_player().hasGills() && get_changes() < get_changeLimit())
         {
            get_mutations().updateGills();
         }
         if(get_changes() == 0)
         {
            outputText("[pg]它似乎没有任何效果，但你确实感觉休息得更好了。");
            get_player().changeFatigue(-40);
         }
         get_player().refillHunger(20);
         var _loc6_:IMap = KFLAGS.flags;
         FlagDict_Impl_.arrayWriteInt(_loc6_,2077,FlagDict_Impl_.arrayReadInt(_loc6_,2077) + get_changes());
         return false;
      }
   }
}

