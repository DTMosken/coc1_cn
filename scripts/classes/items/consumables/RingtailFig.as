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
   
   public class RingtailFig extends Consumable
   {
      
      public function RingtailFig()
      {
         if(Boot.skip_constructor)
         {
            return;
         }
         super("RingFig","Ringtail Fig","a ringtail fig",6,"A dried fig with two lobes and thin dark rings just below its stem. The skin is wrinkly, and it looks vaguely like a bulging scrotum.");
      }
      
      override public function useItem() : Boolean
      {
         var _loc1_:String = "ringtailFig";
         get_mutations().initTransformation([2,3,3]);
         outputText("你掰开果实，挖出果肉，贪婪地吃了起来。它很甜，带着种子的微小颗粒感，你很快就把两半都吃光了。");
         if(get_player().get_spe100() < 80 && Utils.rand(3) == 0 && get_changes() < get_changeLimit())
         {
            outputText("[pg]你抽搐了一下，转头看了看四周，感觉更清醒了些。这绝对有助于保护你的私人空间免受侵犯。");
            if(get_player().get_spe100() < 40)
            {
               dynStats(DynStat.Spe(1));
            }
            dynStats(DynStat.Spe(1));
         }
         if(get_player().get_sens100() < 80 && Utils.rand(3) == 0 && get_changes() < get_changeLimit())
         {
            outputText("[pg]起皱的果皮在手中突然变得异常清晰，你扔掉了剩下的果实。你惊奇地用手指摸了摸自己——现在你甚至能更清晰地感觉到[skinfurscales]上最轻微的压力！");
            if(get_player().get_sens100() < 60)
            {
               dynStats(DynStat.Sens(2));
            }
            dynStats(DynStat.Sens(2));
         }
         if(Utils.rand(4) == 0 && get_player().get_tou100() > 50 && get_changes() < get_changeLimit())
         {
            outputText("[pg]你发现自己希望可以整天坐着吃东西，在你能打起精神活动之前，先懒散地呆上一会儿，什么也不做。");
            if(get_player().get_tou100() > 75)
            {
               dynStats(DynStat.Tou(-1));
            }
            dynStats(DynStat.Tou(-1));
         }
         if(get_player().hasCock())
         {
            if(get_player().balls > 0 && get_player().ballSize < 15 && Utils.rand(4) == 0 && get_changes() < get_changeLimit())
            {
               outputText("[pg]你的[balls]膨胀起来，撑开了阴囊的皮肤。把它们露出来，你可以看到它们长大了好几[if (metric) {厘米|英寸}]！太神奇了！");
               var _temp_1:* = get_player();
               _temp_1.ballSize = _temp_1.ballSize + (2 + Utils.rand(3));
               dynStats(DynStat.Lib(1));
            }
         }
         if(get_player().balls == 0 && get_player().hasFur() && get_player().face.type == 14 && Utils.rand(3) == 0 && get_changes() < get_changeLimit())
         {
            outputText("[pg]吃东西的时候，你思考着自己戴着面具的样子；你突然意识到，你危险地接近了经典的小偷漫画形象。真的，只要一个不起眼的大袋子和匆忙的步伐，每个人都会立刻把你往最坏的方面想。在一阵短暂的恼怒中，你希望自己有这样一个袋子来装东西，渴望挑战一些假设。顺着这个思路想了几分钟后，你小腹一阵绞痛，疼得你弯下腰，你急忙露出下半身检查那个区域。就在你看着的时候，你的胯部形成了一个肉球，两个肿块从肚脐下方移到了肉球里。<b>看来你终究还是长出了一个阴囊。</b>");
            get_player().balls = 2;
            get_player().ballSize = 1;
            set_changes(get_changes() + 1);
         }
         if(Utils.rand(4) == 0 && get_player().thickness < 80 && get_changes() < get_changeLimit())
         {
            outputText(get_player().modThickness(80,2));
            set_changes(get_changes() + 1);
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
         if(get_player().tail.type != 15 && Utils.rand(4) == 0 && get_changes() < get_changeLimit())
         {
            if(get_player().tail.type == 0)
            {
               outputText("[pg]一阵战栗穿过你的脊椎，迫使你倒在地上；尽管你试图再次站起来，但你的身体却僵住了。你能感觉到从你的背部传来一阵对脊椎的拉扯感，就好像有人试图把它拔出来一样！几个结节沿着你的背部形成，长成新的椎骨，并将旧的椎骨向下推入你的[armor]中。那里产生了一种不舒服的压力，因为正在发生的任何发育都在努力摆脱束缚。最后，变移停止了，你又能动了；你做的第一件事就是松开下装，让一条乱蓬蓬的尾巴滑出来。<b>它不由自主地抽动着，蓬松成一条有环纹的浣熊尾巴！</b>");
            }
            else
            {
               outputText("[pg]你的尾巴因疼痛而变得僵硬，很快你的身体也跟着僵硬起来。感觉就像你的脊椎试图把生长物从你的身体上推下来……你勉强转过头，看到的几乎就是这样！一条新的有环纹的蓬松尾巴在原来的尾巴后面长出来，深色条纹和浅色条纹交替。很快它就长到了全长，当你的旧尾巴从末端断开，像熟透的果实一样掉到地上溶解时，你流下了一滴眼泪。<b>你现在有了一条浣熊尾巴！</b>");
            }
            get_player().tail.type = 15;
            set_changes(get_changes() + 1);
         }
         if(get_mutations().tfNoFur() && (get_player().lowerBody.type == 19 && get_player().ears.type == 11) && !get_player().hasFur() && get_changes() < get_changeLimit() && Utils.rand(4) == 0)
         {
            outputText("[pg]你打了个寒颤，觉得有点冷。就在你开始希望有什么东西可以盖一下的时候，你的请求似乎得到了满足；浓密、毛茸茸的皮毛开始长满你的全身！你惊慌地拉扯着那些毛簇，但它们根深蒂固，而且……实际上相当柔软。嗯。");
            get_player().skin.type = 1;
            get_player().skin.adj = "";
            get_player().skin.desc = "fur";
            get_player().skin.furColor = "灰色";
            get_player().underBody.restore();
            outputText("<b>你现在有了一身温暖的[furcolor]浣熊皮毛！</b>");
            set_changes(get_changes() + 1);
         }
         if(get_player().tail.type == 15 && get_player().ears.type != 11 && Utils.rand(4) == 0 && get_changes() < get_changeLimit())
         {
            if(get_player().ears.type == 2 || get_player().ears.type == 7 || get_player().ears.type == 8)
            {
               outputText("[pg]你的耳朵受到挤压，耳道暂时收缩。你摇摇头恢复听觉，伸手去摸耳廓，却发现取而代之的是一对短粗的蛋形耳朵。<b>你现在有了浣熊耳朵！</b>");
            }
            else if(get_player().ears.type == 1 || get_player().ears.type == 3 || get_player().ears.type == 5)
            {
               outputText("[pg]你的耳朵发麻。嗯。现在它们尖端感觉更圆润了吗？<b>看来你长出了浣熊耳朵。</b>");
            }
            else
            {
               outputText("[pg]你的耳朵竖起并极其不舒服地拉伸着，从你的[hair]中探出。你用手捂住它们，感觉它们变成了放在你头顶上的小蛋形装饰品。<b>你有了浣熊耳朵！</b>");
            }
            get_player().ears.type = 11;
            set_changes(get_changes() + 1);
         }
         if(get_player().ears.type == 11 && get_player().lowerBody.type != 19 && get_changes() < get_changeLimit() && Utils.rand(4) == 0)
         {
            if(get_player().hasTailInsteadOfLegs())
            {
               outputText("[pg]你的身体突然伸直并像望远镜一样伸缩，没有了[if (isNaga) {蛇|下}]半身的长度来固定你，你只能脸朝下趴在泥土里。一阵鳞片掉落的沙沙声和刮擦声响起，一阵可怕的痉挛抓住了你，你的后半身继续移动，俯冲到你的[butt]下面，让你感觉非常臃肿。当你曾经突出的尾巴缩小到大约你躯干的长度时，一种令人作呕的撕裂声充满了你的脑海，它爆裂开来，露出了两条新腿！当你检查毛茸茸的腿和长脚趾、敏感的脚时，破烂的[if (isNaga) {蛇|鱼}]皮继续融入你的腹股沟。<b>看来你现在有了浣熊的后爪……</b>而且胃部不适。");
               dynStats(DynStat.Lust(-30));
               get_player().changeFatigue(5);
            }
            else if(get_player().isGoo())
            {
               outputText("[pg]你黏糊糊的下盘开始剧烈沸腾，还没等你做出任何反应，它就蒸发了！你只坐在构成你[butt]的一小块半干的黏液垫上，身下突然出现的凸起足以把你推倒仰面躺下。你漫不经心地想知道发生了什么，但又看不见，于是你闭上眼睛，试图集中注意力感受下半身能感觉到的任何感觉。你感觉到……一阵膨胀，接着是虚弱的肌肉第一次试图收缩，将脆弱、折叠的四肢拉开并放平。当你的注意力向下转移时，你感觉到脚趾在扭动——比你记忆中的脚趾长得多。几分钟里，你一动不动地躺着，小心翼翼地测试着肌肉，随着你的身体变得坚实，但当你终于能再次移动并好好看看你的腿时，你所看到的并没有让你感到惊讶。<b>你有了毛茸茸的腿和一双长脚趾的浣熊爪子！</b>");
            }
            else if(get_player().lowerBody.type == 1 || get_player().lowerBody.type == 7 || get_player().lowerBody.type == 11 || get_player().lowerBody.type == 15 || get_player().isTaur())
            {
               outputText("[pg]你的[feet]突然感觉非常……宽大。你试探性地走了几步，发现它们比平时迟钝得多，也笨重得多。走着走着，你的一只脚");
               if(get_player().lowerBody.type == 1 || get_player().lowerBody.type == 11)
               {
                  outputText("刚好及时从蹄子里弹了出来");
               }
               else
               {
                  outputText("在长靴里松动了，你烦躁地把它拔了出来，结果");
               }
               outputText("却踩在了一块尖锐的石头上！你把咒骂咽了回去，检查着这只新的光脚。它看起来很像人类的脚，只是脚趾几乎有两倍长。你发现你甚至可以用它们捡东西；那块尖石头被你用脚趾夹起放到手里，然后远远地扔了出去。脱落的[foot]很快在地上与它的另一半作伴，露出了更多长长的脚趾。");
               if(get_player().isTaur())
               {
                  outputText("有那么几分钟，你用你那四只灵活的脚自娱自乐……你甚至发明了一个游戏，在身体下方用两只脚抛接石头，同时用另外两只脚保持平衡。然而没过多久，你的下腹部发出一阵咕噜声，一阵灼痛让你没接住石头。预感到即将发生的事情，你小心翼翼地躺下，闭上眼睛，咬住一团柔软的布。疼痛很快再次袭来，让你失去了意识，当你醒来时，你的后腿已经不见了。");
               }
               outputText("<b>你现在拥有了两条毛茸茸的、长着长脚趾的浣熊腿。</b>");
            }
            else
            {
               outputText("[pg]你的脚趾不由自主地扭动起来，引起了你的注意。低头看去，你可以看到它们正在改变现在的形状，拉长成椭圆形。当变化停止时，你的脚看起来像人类的，但长着长长且灵活的脚趾！");
               if((get_player().lowerBody.type == 0 || get_player().lowerBody.type == 5 || get_player().lowerBody.type == 6) && !get_player().hasFur())
               {
                  outputText("用感觉像是第二双手的东西走路的感觉太奇怪了，以至于你都没注意到腿上长出了发痒的毛发……");
               }
               outputText("<b>你现在拥有了浣熊爪子！</b>");
            }
            get_player().lowerBody.type = 19;
            get_player().lowerBody.legCount = 2;
            set_changes(get_changes() + 1);
         }
         if(get_player().face.type != 13 && get_player().face.type != 14 && Utils.rand(4) == 0 && get_changes() < get_changeLimit())
         {
            if(get_player().face.type == 0 || get_player().face.type == 4 || get_player().face.type == 5 || get_player().face.type == 8)
            {
               outputText("[pg]一阵突如其来的疲惫感席卷全身，你眼睛周围的脸部变得有些麻木。");
               if(get_player().face.type == 4 || get_player().face.type == 5 || get_player().face.type == 8)
               {
                  outputText("你突出的牙齿一开始发出嘈杂的打颤声，然后震动逐渐减弱，直到你再也感觉不到它们比其他牙齿更突出了！");
               }
               outputText("你微微摇了摇头，等待体力恢复，然后检查自己的外貌。");
               if((get_player().skin.tone == "ebony" || get_player().skin.tone == "black") && (get_player().hasPlainSkin() || get_player().hasGooSkin()) || (get_player().hair.color == "black" || get_player().hair.color == "midnight") && get_player().isFurryOrScaley())
               {
                  outputText("起初似乎没有什么不同。奇怪……你凑近一看，发现在你原本就漆黑的脸上，出现了一个更深的、面纹状的轮廓。<b>你现在拥有了几乎看不见的浣熊面纹。</b>");
               }
               else
               {
                  outputText("一个深色、几乎是黑色的面纹遮住了你眼睛周围和鼻子最上方的[skinfurscales]，让你看起来像个罪犯！<b>你现在拥有了浣熊面纹！</b>");
               }
            }
            else
            {
               outputText("[pg]一阵突如其来的偏头痛席卷了你，你痛苦地捂住头，你的鼻子塌陷回了人类的尺寸。你眼睛周围出现了一块令人担忧的麻木区域，你脑海中闪过几个可怕的预感，直到它像来时一样突然消失。在水桶里检查自己的倒影，你发现");
               if((get_player().hair.color == "black" || get_player().hair.color == "midnight") && get_player().isFurryOrScaley())
               {
                  outputText("你的脸似乎恢复了正常的形状，尽管仍然覆盖着[skinfurscales]。你凑近一看，发现在你原本就漆黑的脸上，出现了一个更深的、面纹状的轮廓。<b>在你原本正常的人类脸庞上，现在有了一个几乎看不见的浣熊面纹。</b>");
               }
               else if((get_player().skin.tone == "ebony" || get_player().skin.tone == "black") && (get_player().hasPlainSkin() || get_player().hasGooSkin()))
               {
                  outputText("你的脸似乎恢复了正常的形状。你凑近一看，发现在你原本就漆黑的脸上，出现了一个更深的、面纹状的轮廓。<b>在你正常的人类脸庞上，现在有了一个几乎看不见的浣熊面纹。</b>");
               }
               else
               {
                  outputText("你的脸恢复了人类的尺寸，但眼睛周围和鼻子上被一个黑色的面纹遮住了！<b>你现在拥有了一张带有浣熊面纹的人形脸庞！</b>");
               }
            }
            get_player().face.type = 13;
            set_changes(get_changes() + 1);
         }
         else if(get_mutations().tfNoFur() && get_player().face.type == 13 && get_player().lowerBody.type == 19 && get_player().hasFur() && Utils.rand(4) == 0 && get_changes() < get_changeLimit())
         {
            outputText("[pg]你的脸因紧绷而感到刺痛，你揉了揉鼻梁试图缓解。这个动作引发了你骨骼结构的微小滑动，你的鼻子向前伸长了！你闭上眼睛，等待鼻腔的压力消退，当你睁开眼睛时，一个长着胡须、顶端有一个黑色鼻子的三角形尖吻映入眼帘！<b>你现在有了一张浣熊的脸！</b>");
            set_changes(get_changes() + 1);
            get_player().face.type = 14;
         }
         else if(Utils.rand(2) == 0 && get_changes() < get_changeLimit() && (get_player().face.type != 13 && get_player().face.type != 14))
         {
            outputText("[pg]你突然感到疲倦，眼皮变得很沉重。照了照镜子，你看到眼睛下面开始形成小小的黑眼圈。");
            get_player().changeFatigue(10);
            set_changes(get_changes() + 1);
         }
         if(get_changes() == 0)
         {
            outputText("[pg]你打了个哈欠，觉得你真的需要睡个午觉。");
            get_player().changeFatigue(5);
         }
         get_player().refillHunger(30);
         var _loc2_:IMap = KFLAGS.flags;
         FlagDict_Impl_.arrayWriteInt(_loc2_,2077,FlagDict_Impl_.arrayReadInt(_loc2_,2077) + get_changes());
         return false;
      }
   }
}

