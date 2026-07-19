package classes.items.consumables
{
   import classes.BreastRow;
   import classes.Cock;
   import classes.CockTypesEnum;
   import classes.DynStat;
   import classes.Player;
   import classes._FlagDict.FlagDict_Impl_;
   import classes.globalFlags.KFLAGS;
   import classes.internals.Utils;
   import classes.items.Consumable;
   import classes.items.Mutations;
   import classes.lists.ColorLists;
   import flash.Boot;
   import haxe.IMap;
   
   public class ImpFood extends Consumable
   {
      
      public function ImpFood()
      {
         if(Boot.skip_constructor)
         {
            return;
         }
         super("ImpFood","Imp Food","a parcel of imp food",6,"This is a small parcel of reddish-brown bread stuffed with some kind of meat. It smells delicious.");
      }
      
      override public function useItem() : Boolean
      {
         var _loc3_:* = null as Array;
         var _loc4_:* = null as String;
         var _loc5_:* = null as Player;
         var _loc6_:Number = NaN;
         var _loc7_:Number = NaN;
         var _loc8_:int = 0;
         var _loc1_:String = "impFood";
         var _loc2_:int = 0;
         get_mutations().initTransformation([2,2]);
         if(int(get_player().cocks.length) > 0)
         {
            outputText("这食物尝起来很奇怪，而且很腐败——你实在想不出更好的词来形容它，但它就是不干净。");
            get_player().refillHunger(20);
            if(get_player().cocks[0].cockLength < 12 && get_changes() < get_changeLimit())
            {
               _loc2_ = int(get_player().increaseCock(0,Utils.rand(2) + 2));
               outputText("[pg]");
               get_player().lengthChange(_loc2_,1);
               set_changes(get_changes() + 1);
            }
            outputText("[pg]非人的活力蔓延全身，让你精神焕发！\n");
            get_player().HPChange(30 + get_player().get_tou() / 3,true);
            dynStats(DynStat.Lust(3),DynStat.Cor(1));
            if(Utils.rand(30) == 0 && ColorLists.IMP_SKIN.indexOf(get_player().skin.tone) == -1)
            {
               if(get_player().hasFur())
               {
                  outputText("[pg]在你的毛发之下，你的皮肤");
               }
               else
               {
                  outputText("[pg]你的[skindesc]");
               }
               _loc3_ = ColorLists.IMP_SKIN;
               _loc4_ = _loc3_[Utils.rand(int(_loc3_.length))];
               get_player().skin.tone = _loc4_;
               outputText("开始褪色，直到你变得像白化病患者一样苍白。然后，从你的头顶开始，一种红色的色调像波浪一样席卷你的全身，让你完全变成了[skintone]。");
               get_player().arms.updateClaws(get_player().arms.claws.type);
            }
         }
         else
         {
            outputText("这食物尝起来……找不到更好的词来形容，有些腐败。\n");
            get_player().refillHunger(20);
            get_player().HPChange(20 + get_player().get_tou() / 3,true);
            dynStats(DynStat.Lust(3),DynStat.Cor(1));
         }
         if(Utils.rand(5) == 0 && ColorLists.IMP_SKIN.indexOf(get_player().skin.tone) == -1 && get_changes() < get_changeLimit())
         {
            if(get_player().hasFur())
            {
               outputText("[pg]在你的毛发之下，你的皮肤");
            }
            else
            {
               outputText("[pg]你的[skindesc]");
            }
            _loc3_ = ColorLists.IMP_SKIN;
            _loc4_ = _loc3_[Utils.rand(int(_loc3_.length))];
            get_player().skin.tone = _loc4_;
            outputText("开始褪色，直到你变得像白化病患者一样苍白。然后，从你的头顶开始，一种红色的色调像波浪一样席卷你的全身，让你完全变成了[skintone]。");
            dynStats(DynStat.Cor(2));
            get_player().skin.type = 0;
            get_player().arms.updateClaws(get_player().arms.claws.type);
            set_changes(get_changes() + 1);
         }
         if(Utils.rand(2) == 0 && get_player().get_tallness() > 42 && get_changes() < get_changeLimit())
         {
            outputText("[pg]你的皮肤一阵发麻，让你闭上眼睛打了个寒颤。当你再次睁开眼睛时，世界似乎……不同了。经过一番调查，你发现自己变矮了！");
            _loc5_ = get_player();
            _loc5_.set_tallness(_loc5_.get_tallness() - (1 + Utils.rand(3)));
            set_changes(get_changes() + 1);
         }
         if(Utils.rand(3) == 0 && get_changes() < get_changeLimit() && get_player().wings.type != 13 && get_player().isCorruptEnough(25))
         {
            if(get_player().wings.type == 5 && get_player().isCorruptEnough(50))
            {
               outputText("[pg]");
               outputText("你那对小恶魔翅膀伸展并生长着，因为附着在如此堕落的身体上而愉悦地刺痛着。你越过肩膀伸手去抚摸它们，它们展开变成了巨大的小恶魔翅膀。<b>你的小恶魔翅膀长大了！</b>");
               get_player().wings.type = 13;
            }
            else if(get_player().rearBody.type == 3)
            {
               outputText("[pg]");
               outputText("你肩膀周围的肌肉不舒服地挤成一团，发生改变以支撑从你背部长出的新的蝙蝠状翅膀。你尽可能地扭过头去查看，发现你的鳍已经变成了小恶魔翅膀！");
               get_player().rearBody.restore();
               get_player().wings.type = 5;
            }
            else if(get_player().wings.type == 0)
            {
               outputText("[pg]");
               outputText("你的肩膀紧绷起来，传来一阵绞痛。伴随着一股惊人的力量，一对小恶魔翅膀从你的背上长出，在你的[armor]背面撕开了两个洞。<b>你现在拥有了小恶魔翅膀。</b>");
               get_player().wings.type = 5;
            }
            else
            {
               outputText("[pg]");
               outputText("你肩膀周围的肌肉不舒服地隆起，改变了结构以支撑你的翅膀，你感觉到它们的重量在增加。你尽力扭过头去查看，发现它们已经变成了");
               if([1,4,10,5].indexOf(get_player().wings.type) != -1)
               {
                  outputText("小巧的");
                  get_player().wings.type = 5;
               }
               else
               {
                  outputText("巨大的");
                  get_player().wings.type = 13;
               }
               outputText("<b>小恶魔翅膀！</b>");
            }
            dynStats(DynStat.Cor(2));
            set_changes(get_changes() + 1);
         }
         if(get_player().tail.type != 28 && get_changes() < get_changeLimit() && Utils.rand(3) == 0)
         {
            if(get_player().tail.type != 0)
            {
               outputText("[pg]");
               if(get_player().tail.type == 5 || get_player().tail.type == 6)
               {
                  outputText("你感觉到昆虫般的腹部传来一阵刺痛，它在拉伸、变窄，外骨骼剥落，变成了一条小恶魔的尾巴，末端还带着一团圆圆的绒毛。");
               }
               else
               {
                  outputText("你感觉到尾巴传来一阵刺痛。你惊讶地发现它变成了一条小恶魔的尾巴，末端还带着一团绒毛。");
               }
               outputText("<b>你的尾巴变成了小恶魔的尾巴！</b>");
            }
            else
            {
               outputText("[pg]你的后背积聚起一阵疼痛，变得越来越明显。伴随着一声响亮的撕裂声，压力突然消失了。<b>你意识到你现在有了一条小恶魔的尾巴</b>……末端还带着一团绒毛。");
            }
            dynStats(DynStat.Cor(2));
            get_player().tail.type = 28;
            set_changes(get_changes() + 1);
         }
         if(["red","orange"].indexOf(get_player().skin.tone) != -1 && get_player().tail.type == 28 && get_player().lowerBody.type != 27 && Utils.rand(3) == 0 && get_changes() < get_changeLimit())
         {
            outputText("[pg]你臀部以下的每一块肌肉和肌腱都感到刺痛，你开始踉跄。坐下几秒钟后，你的" + get_player().feet() + "爆发出剧痛。有什么坚硬的东西从里面刺穿了你的脚底，你的[feet]残忍地裂开并弯曲。疼痛慢慢减轻，你的目光顺着一条瘦削的人类腿看去，它在脚部裂成三个长长的爪子，后面还有一个较小的爪子用来保持平衡。当你放松时，你的脚轻松地抓住了地面。<b>你的下半身现在变成了小恶魔的样子。</b>");
            get_player().lowerBody.type = 27;
            get_player().lowerBody.legCount = 2;
            dynStats(DynStat.Cor(2));
            set_changes(get_changes() + 1);
         }
         if(get_player().horns.type == 11 && ["red","orange"].indexOf(get_player().skin.tone) != -1 && get_player().ears.type != 20 && Utils.rand(3) == 0 && get_changes() < get_changeLimit())
         {
            outputText("[pg]你的头突然阵阵作痛，让你弯下腰紧紧抱住它。你感觉到你的耳朵变长并微微向内卷曲，末端尖尖的，和精灵的耳朵有些相似。然而，这些耳朵从你头部的两侧突出，呈锥形，专注于你周围的每一个声音。你突然意识到。<b>你的耳朵现在变成了小恶魔的耳朵！</b>");
            get_player().ears.type = 20;
            dynStats(DynStat.Cor(2));
            set_changes(get_changes() + 1);
         }
         if((get_player().horns.value == 0 || get_player().horns.type != 11) && get_changes() < get_changeLimit() && Utils.rand(2) == 0)
         {
            if(get_player().horns.value == 0)
            {
               outputText("[pg]一对尖尖的小恶魔角从你的额头上长了出来。它们看起来有点可爱。<b>你长角了！</b>");
            }
            else
            {
               outputText("[pg]");
               outputText("你的角发生变化，变成了两根尖锐的小恶魔角。");
            }
            get_player().horns.value = 2;
            get_player().horns.type = 11;
            dynStats(DynStat.Cor(2));
            set_changes(get_changes() + 1);
         }
         if(["red","orange"].indexOf(get_player().skin.tone) != -1 && get_player().arms.claws.type != 8 && Utils.rand(3) == 0 && get_changes() < get_changeLimit())
         {
            if(get_player().arms.type != 0)
            {
               outputText("[pg]你的手臂扭曲变形，变回了类似人类的手臂。但你意识到，这仅仅是个开始。");
            }
            if(get_player().arms.claws.type == 0)
            {
               outputText("[pg]你的双手突然感到一阵剧痛，你只能将它们蜷缩在身前。贴着身体，你感觉到它们变成了三根长长的爪子，还有一根较小的爪子取代了你的拇指，但同样灵活。<b>你长出了小恶魔的爪子！</b>");
            }
            else
            {
               outputText("[pg]你的爪子突然开始变化，开始变回正常的手。但就在变回之前，它们伸展成了三根长长的爪子，还有一根较小的爪子形成了一个尖锐的拇指。<b>你长出了小恶魔的爪子！</b>");
            }
            get_player().arms.setType(4,8);
            dynStats(DynStat.Cor(2));
            set_changes(get_changes() + 1);
         }
         if(["red","dark red"].indexOf(get_player().hair.color) == -1 && Utils.rand(3) == 0 && get_changes() < get_changeLimit())
         {
            outputText("[pg]你的头发突然开始脱落，迅速掉落在你周围，直到完全掉光。正当你以为一切都结束时，你的头上又长出了更多的头发，微微卷曲，颜色也变了。");
            if(Utils.rand(2) != 0)
            {
               get_player().hair.color = "red";
            }
            else
            {
               get_player().hair.color = "dark red";
            }
            outputText("<b>你现在拥有了[haircolor]的</b>");
            if(get_player().hair.type != 0)
            {
               outputText("<b>人类</b>");
            }
            outputText("<b>头发！</b>");
            get_player().hair.type = 0;
            get_player().hair.length = 1;
            set_changes(get_changes() + 1);
         }
         if(get_player().biggestTitSize() >= 1 && get_changes() < get_changeLimit() && Utils.rand(3) == 0 && !get_hyper())
         {
            _loc6_ = 0;
            _loc7_ = 0;
            _loc8_ = 0;
            while(_loc8_ < int(get_player().breastRows.length))
            {
               if(get_player().breastRows[_loc8_].breastRating > _loc6_)
               {
                  if(get_player().breastRows[_loc8_].breastRating > 10)
                  {
                     var _temp_1:* = get_player().breastRows[_loc8_];
                     _temp_1.breastRating = _temp_1.breastRating - (2 + Utils.rand(3));
                     if(_loc7_ == 0)
                     {
                        outputText("[pg]你胸前的[breasts]晃动了一下，然后紧缩起来，在这个过程中缩小了好几个罩杯！");
                     }
                     else
                     {
                        outputText("变化向下蔓延到你的第" + Utils.num2TextOrdinal(_loc8_ + 1) + "排[breasts]。它们大幅度缩小，减小了几个罩杯。");
                     }
                  }
                  else
                  {
                     var _temp_2:* = get_player().breastRows[_loc8_];
                     _temp_2.breastRating = _temp_2.breastRating - 1;
                     if(_loc7_ == 0)
                     {
                        outputText("[pg]突然之间，你的重心发生了变化。你的背部感到一阵轻松，你花了一会儿才意识到你的" + get_player().breastDescript(_loc8_) + "变小了！");
                     }
                     else
                     {
                        outputText("你的第" + Utils.num2TextOrdinal(_loc8_ + 1) + "排" + get_player().breastDescript(_loc8_) + "在缩小的时候微微颤动了一下，失去了一些分量。");
                     }
                  }
                  _loc7_++;
               }
               _loc8_++;
            }
            set_changes(get_changes() + 1);
         }
         if(get_player().bRows() > 1 && Utils.rand(3) == 0 && get_changes() < get_changeLimit() && !get_hyper())
         {
            get_mutations().removeExtraBreastRow(_loc1_);
         }
         if(get_player().averageNipplesPerBreast() > 1 && Utils.rand(3) == 0 && get_changes() < get_changeLimit())
         {
            outputText("[pg]一种奇怪的灼烧感充满了你的乳房，你往[armor]里看去，发现你多余的乳头不见了！<b>你失去了多余的乳头！</b>");
            dynStats(DynStat.Sens(-3));
            _loc8_ = 0;
            while(_loc8_ < get_player().bRows())
            {
               get_player().breastRows[_loc8_].nipplesPerBreast = 1;
               _loc8_++;
            }
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
         if(Utils.rand(5) == 0 && get_changes() < get_changeLimit())
         {
            get_mutations().updateOvipositionPerk(_loc1_);
         }
         if(get_player().impScore() >= 4 && get_changes() < get_changeLimit() && !get_hyper())
         {
            if(get_player().bRows() > 1)
            {
               outputText("[pg]当你的重心发生变化时，你踉跄着后退，虽然你在摔倒前调整了过来，但你只能惊讶地看着你多余的乳房缩小，完全消失在你的身体里。甚至连乳头也逐渐褪去，直到完全消失。<b>因为你是个小恶魔，你失去了多余的乳房！</b>");
               get_player().breastRows.resize(1);
            }
            if(get_player().biggestTitSize() >= 1)
            {
               outputText("[pg]突然之间，你的重心发生了变化。你的背部感到一阵轻松，你花了一会儿才意识到你的乳房变平了！<b>因为你是个小恶魔，你失去了你的乳房！</b>");
               get_player().breastRows[0].breastRating = 0;
            }
            if(get_player().averageNipplesPerBreast() > 1)
            {
               outputText("[pg]你的乳房充满了一种奇怪的灼烧感，你低头看向你的[armor]，发现你多余的乳头不见了！<b>因为变成了小恶魔，你失去了多余的乳头！</b>");
               _loc8_ = 0;
               while(_loc8_ < get_player().bRows())
               {
                  get_player().breastRows[_loc8_].nipplesPerBreast = 1;
                  _loc8_++;
               }
            }
            if(get_player().nippleLength > 0.25)
            {
               outputText("[pg]一种奇怪的灼烧感传遍全身，你低头看向你的[armor]，发现你的乳头变小了！<b>因为变成了小恶魔，你的乳头变小了！</b>");
               get_player().nippleLength = 0.25;
            }
            if(get_player().hasVagina())
            {
               outputText("[pg]腹股沟突然传来一阵剧痛，让你跪倒在地。你拨开护甲，眼睁睁地看着你的小穴闭合，从你的身体上完全消失。<b>因为变成了小恶魔，你的小穴消失了！</b>");
               get_player().removeVagina();
            }
            if(!get_player().hasCock())
            {
               outputText("[pg]双腿之间的压力不断增加，你勉强及时脱下护甲，看着一根肉棒从你身上长出来。<b>因为变成了小恶魔，你长出了一根肉棒！</b>");
               get_player().createCock();
               get_player().cocks[0].cockLength = 12;
               get_player().cocks[0].cockThickness = 2;
               get_player().cocks[0].set_cockType(CockTypesEnum.HUMAN);
            }
            if(get_player().balls == 0)
            {
               outputText("[pg]大腿之间形成了一种奇怪的、令人不快的压力。你脱下护甲，看到你长出了蛋蛋。<b>因为变成了小恶魔，你长出了蛋蛋！</b>");
               get_player().balls = 2;
               get_player().ballSize = 2;
            }
            set_changes(get_changes() + 1);
            dynStats(DynStat.Cor(20));
         }
         var _loc9_:IMap = KFLAGS.flags;
         FlagDict_Impl_.arrayWriteInt(_loc9_,2077,FlagDict_Impl_.arrayReadInt(_loc9_,2077) + get_changes());
         return false;
      }
   }
}

