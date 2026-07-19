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
   
   public class SharkTooth extends Consumable
   {
      
      public function SharkTooth(param1:Boolean = false)
      {
         if(Boot.skip_constructor)
         {
            return;
         }
         super(param1 ? "TSTooth" : "Shark.T",param1 ? "T.Shark Tooth" : "Shark Tooth",param1 ? "a glowing tiger shark tooth" : "a sharp shark tooth",6,param1 ? "It looks like a normal shark tooth, though with an odd purple glow." : "A glinting, white tooth. It\'s very sharp and intimidating.");
      }
      
      override public function useItem() : Boolean
      {
         sharkTooth(get_id() == "TSTooth" ? 1 : 0);
         return false;
      }
      
      public function sharkTooth(param1:Number) : void
      {
         var _loc2_:String = "sharkTooth";
         if(param1 == 1)
         {
            _loc2_ += "-tigershark";
         }
         get_mutations().initTransformation([2,2],2);
         if(param1 == 0)
         {
            outputText("你不知道为什么，但你决定吃掉这颗尖锐的牙齿。令你惊讶的是，它实际上非常脆，变成了一种带有鱼腥味的粉末。你觉得它一定只是一片做成鲨鱼牙齿形状的药片。");
         }
         else if(param1 == 1)
         {
            outputText("你不知道为什么，但你决定吃掉这颗尖锐发光的牙齿。令你惊讶的是，它实际上非常脆，碎成了一种带有鱼腥味的粉末。也许它只是一片做成鲨鱼牙齿形状的药片。");
         }
         if((get_player().get_str100() < 60 && param1 == 1 || get_player().get_str100() < 50) && Utils.rand(3) == 0)
         {
            dynStats(DynStat.Str(1 + Utils.rand(2)));
            outputText("[pg]一阵痛苦的涟漪穿过你身体的肌肉。花了几秒钟，但你很快意识到你现在变得更强壮了一点。");
         }
         if((get_player().get_spe100() < 100 && param1 == 1 || get_player().get_spe100() < 75) && Utils.rand(3) == 0)
         {
            dynStats(DynStat.Spe(1 + Utils.rand(3)));
            outputText("[pg]毫无预兆地打了个冷颤，你走路时差点绊倒自己。尝试了几次后，你意识到你的肌肉变得更敏捷了。");
         }
         if(get_player().get_sens100() > 25 && Utils.rand(1.5) == 0 && get_changes() < get_changeLimit())
         {
            dynStats(DynStat.Sens(-1 - Utils.rand(3)));
            outputText("[pg]花了一段时间，但你最终意识到你的身体变得不那么敏感了。");
         }
         if((get_player().get_lib100() < 100 && param1 == 1 || get_player().get_lib100() < 75) && Utils.rand(3) == 0 && get_changes() < get_changeLimit())
         {
            dynStats(DynStat.Lib(1 + Utils.rand(3)));
            outputText("[pg]随着你的性欲高涨，你的皮肤泛起了一阵红晕。");
         }
         if(get_player().get_inte100() > 40 && Utils.rand(3) == 0 && get_changes() < get_changeLimit())
         {
            dynStats(DynStat.Inte(-(1 + Utils.rand(3))));
            outputText("[pg]你摇了摇头，努力集中思绪，感觉有点迟钝。");
         }
         if(param1 == 1 && (get_player().get_gender() == 0 || !get_player().hasVagina() && get_changes() < get_changeLimit() && Utils.rand(3) == 0))
         {
            set_changes(get_changes() + 1);
            if(get_player().balls > 0)
            {
               outputText("[pg]你的[balls]后面开始发痒，但在你伸手去抓之前，不适感就消失了。片刻之后，一种温暖湿润的感觉拂过你的[sack]，出于对这种感觉的好奇，<b>你抬起你的蛋蛋，露出了你新长出的阴道。</b>");
            }
            else if(get_player().hasCock())
            {
               outputText("[pg]你的腹股沟开始发痒，就在你的[cocks]下方。你把阴茎拨到一边以便看得更清楚，你能够看着<b>你的皮肤裂开，长出一个新的阴道，甚至还有一个小巧的阴蒂。</b>");
            }
            else
            {
               outputText("[pg]你的腹股沟开始发痒，但在你采取行动之前就消失了。出于对这种断断续续的感觉的好奇，<b>你偷看了一眼你的[armor]下面，发现了你崭新的阴道，甚至还有阴唇和一个小巧的阴蒂。</b>");
            }
            get_player().createVagina();
            get_player().setClitLength(0.25);
            dynStats(DynStat.Sens(10));
         }
         if(param1 == 1 && !get_player().hasCock() && get_changes() < get_changeLimit() && Utils.rand(3) == 0)
         {
            if(!get_player().hasVagina())
            {
               outputText("[pg]你感到原本平坦的胯部突然传来一阵刺痛，你弯下腰，痛苦地呻吟着。你的双手保护性地捂住那里——在你的手指下，它正以惊人的方式肿胀起来！脱下衣服，你看到了令人震惊的一幕：曾经光滑的肉体像有生命的粘土一样肿胀流动，重塑成男性生殖器的形状！当疼痛消退时，你自豪地拥有了一根新的人类形状的阴茎");
            }
            else
            {
               outputText("[pg]你感到你的" + get_player().vaginaDescript() + "上方突然传来一阵刺痛，你弯下腰，痛苦地呻吟着。你的双手保护性地捂住那里——在你的手指下，它正以惊人的方式肿胀起来！脱下衣服，你看到了令人震惊的一幕：曾经光滑的肉体像有生命的粘土一样肿胀流动，重塑成男性生殖器的形状！当疼痛消退时，你自豪地不仅拥有了一个[vagina]，还有一根新的人类形状的阴茎");
            }
            if(get_player().balls == 0)
            {
               outputText("和一对蛋蛋");
               get_player().balls = 2;
               get_player().ballSize = 2;
            }
            outputText("！");
            get_player().createCock(7,1.4);
            dynStats(DynStat.Lib(4),DynStat.Sens(5),DynStat.Lust(20));
            set_changes(get_changes() + 1);
         }
         if(param1 == 1 && (get_player().balls == 0 || get_player().balls == 2) && get_player().hasCock() && get_changes() < get_changeLimit() && Utils.rand(3) == 0)
         {
            if(get_player().balls == 2)
            {
               outputText("[pg]你倒吸一口凉气，腹部突然传来一阵剧痛。几秒钟内，又有两颗睾丸落入你的[sack]中，你的皮肤被撑开以容纳它们。当疼痛消退后，你检查了<b>你新长出的四颗睾丸。</b>");
               get_player().balls = 4;
            }
            else if(get_player().balls == 0)
            {
               outputText("[pg]你倒吸一口凉气，腹部突然传来一阵剧痛。几秒钟内，两颗睾丸落入一个新的阴囊中，你的皮肤被撑开以容纳它们。当疼痛消退后，你检查了<b>你新长出的一对睾丸。</b>");
               get_player().balls = 2;
               get_player().ballSize = 2;
            }
            dynStats(DynStat.Lib(2),DynStat.Sens(3),DynStat.Lust(10));
            set_changes(get_changes() + 1);
         }
         if(get_changes() < get_changeLimit() && int(get_player().breastRows.length) > 1 && Utils.rand(3) == 0 && !get_hyper())
         {
            get_mutations().removeExtraBreastRow(_loc2_);
         }
         if(get_player().neck.type != 0 && get_changes() < get_changeLimit() && Utils.rand(4) == 0)
         {
            get_mutations().restoreNeck(_loc2_);
         }
         if(get_player().hasNonSharkRearBody() && get_changes() < get_changeLimit() && Utils.rand(5) == 0)
         {
            get_mutations().restoreRearBody(_loc2_);
         }
         if(Utils.rand(5) == 0)
         {
            get_mutations().updateOvipositionPerk(_loc2_);
         }
         if(get_player().face.type != 4 && Utils.rand(3) == 0 && get_changes() < get_changeLimit())
         {
            outputText("[pg]");
            if(get_player().face.type > 0 && get_player().face.type < 4)
            {
               outputText("你的[face]爆发出剧痛，重塑成更像人类的面容。");
            }
            get_player().face.type = 4;
            outputText("你紧紧捂住嘴，口腔里传来一阵剧痛。你的牙龈移动，下巴的骨头重新复位。你眨了几下眼睛，想知道刚才发生了什么。你走到一个水坑前看自己的倒影，你被你所看到的景象彻底惊呆了。在你的正常牙齿前面长出了一排可伸缩的鲨鱼尖牙，你的脸也稍微拉长以容纳它们！它们甚至让你有点害怕。\n（获得：“撕咬”特殊攻击）");
            set_changes(get_changes() + 1);
         }
         if(get_changes() < get_changeLimit() && Utils.rand(5) == 0 && get_player().eyes.type != 0)
         {
            if(get_player().eyes.type == 2)
            {
               outputText("[pg]你感到眼睛一阵刺痛，你眨了眨眼。感觉就像黑色的白内障刚刚从你身上脱落，你不需要看自己的倒影就知道你的眼睛已经恢复了人类的模样。");
            }
            else
            {
               outputText("[pg]你眨了眨眼，踉跄了一下，一阵眩晕感袭来，几乎让你的[feet]失去支撑。当你稳住身形睁开眼睛时，你意识到似乎有些不同了。你的视觉不知怎么的发生了变化。");
               if(get_player().eyes.type == 1 || get_player().eyes.type == 7)
               {
                  outputText("你的蛛形怪物眼睛不见了！</b>");
               }
               outputText("<b>你又有了正常的、类人生物的眼睛。</b>");
            }
            get_player().eyes.type = 0;
            get_player().eyes.count = 2;
            set_changes(get_changes() + 1);
         }
         if(get_player().tail.type != 7 && Utils.rand(3) == 0 && get_changes() < get_changeLimit())
         {
            set_changes(get_changes() + 1);
            if(get_player().tail.type == 0)
            {
               outputText("[pg]一阵阵疼痛顺着你的脊椎向下蔓延，让你惊讶地喘着粗气，双手双膝着地。感觉到背部末端有隆起，你及时脱下你的[armor]，一条完全成型的鲨鱼尾巴破体而出。你甩动了几下，惊讶于它的灵活性。在对你的衣服进行了一些修改后，你准备好带着你全新的鲨鱼尾巴出发了。");
            }
            else
            {
               outputText("[pg]一阵阵疼痛顺着你的脊椎向下蔓延到你的尾巴。你感觉到尾巴隆起，直到它爆裂成一条巨大而灵活的鲨鱼尾巴。你试探性地甩动它，发现它很容易控制。");
            }
            get_player().tail.type = 7;
         }
         if(get_player().gills.type != 2 && get_player().tail.type == 7 && get_player().face.type == 4 && get_changes() < get_changeLimit() && Utils.rand(3) == 0)
         {
            get_mutations().updateGills(2);
         }
         if(get_player().hair.color != "silver" && Utils.rand(4) == 0 && get_changes() < get_changeLimit())
         {
            set_changes(get_changes() + 1);
            outputText("[pg]你感到头皮发麻，伸手摸了摸头想一探究竟。令你惊讶的是，你的头发颜色变成了银色，就像鲨鱼娘一样！");
            get_player().hair.color = "silver";
         }
         if((get_player().skin.tone != "rough gray" && get_player().skin.tone != "orange and black striped" || !get_player().hasPlainSkin()) && Utils.rand(7) == 0 && get_changes() < get_changeLimit())
         {
            outputText("[pg]");
            if(get_player().isFurryOrScaley())
            {
               outputText("你的[skindesc]脱落，堆积在地板上，露出下面柔软的皮肤。");
            }
            else if(get_player().hasGooSkin())
            {
               outputText("你黏糊糊的皮肤凝固了，随着你的身体开始凝固成更正常的形态，皮肤也变厚了。");
            }
            else if(param1 == 0)
            {
               outputText("你的皮肤发痒和刺痛，变得稍微粗糙并变成灰色。");
            }
            if(param1 == 0)
            {
               outputText("你突然停止移动，猛地倒吸一口凉气，全身一阵颤栗。你的皮肤开始改变和变形，变得稍微厚实，并变成闪亮的灰色。你的皮肤现在摸起来也出奇地粗糙，就像海洋哺乳动物一样。你微笑着，用手抚摸着你新的鲨鱼皮肤。");
               get_player().skin.type = 0;
               get_player().skin.desc = "skin";
               get_player().skin.tone = "rough gray";
               get_player().underBody.restore();
               get_player().arms.updateClaws(get_player().arms.claws.type);
               set_changes(get_changes() + 1);
            }
            else
            {
               outputText("你的皮肤开始发麻发痒，然后迅速变成闪亮的橙色，上面布满了随机的黑色条纹。你在附近的水池里快速看了一眼，发现你的皮肤在外观和质地上都发生了变异，变得更像虎鲨人了！");
               get_player().skin.type = 0;
               get_player().skin.desc = "skin";
               get_player().skin.tone = "橙黑条纹的";
               get_player().underBody.restore();
               get_player().arms.updateClaws(get_player().arms.claws.type);
               set_changes(get_changes() + 1);
            }
         }
         if((get_player().wings.type != 0 || get_player().rearBody.type != 3) && get_changes() < get_changeLimit() && Utils.rand(3) == 0)
         {
            outputText("[pg]");
            if(get_player().wings.type != 0)
            {
               outputText("你的翅膀向内折叠，与你的背部融合在一起。");
            }
            outputText("你痛苦地呻吟着瘫倒在地，几乎立刻就后悔吃了那颗牙齿。你开始大汗淋漓，大口喘气，感觉肩胛骨之间的空间在变移。你急忙脱下你的" + Utils.cnName(get_player().get_armorName()) + "，就在这时，一个奇怪的鳍状结构从你的肩膀之间爆裂而出。你仔细检查了它，并对你的[armor]做了一些修改，以适应你的新鳍。");
            get_player().rearBody.type = 3;
            get_player().wings.restore();
            set_changes(get_changes() + 1);
         }
         if(get_changes() == 0)
         {
            outputText("[pg]什么也没发生。真奇怪。");
         }
         get_player().refillHunger(5);
         var _loc3_:IMap = KFLAGS.flags;
         FlagDict_Impl_.arrayWriteInt(_loc3_,2077,FlagDict_Impl_.arrayReadInt(_loc3_,2077) + get_changes());
      }
   }
}

