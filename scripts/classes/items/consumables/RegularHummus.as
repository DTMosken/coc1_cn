package classes.items.consumables
{
   import classes.Ass;
   import classes.BreastRow;
   import classes.Cock;
   import classes.CockTypesEnum;
   import classes.PerkLib;
   import classes.Player;
   import classes.StatusEffects;
   import classes.Vagina;
   import classes._FlagDict.FlagDict_Impl_;
   import classes.globalFlags.KFLAGS;
   import classes.internals.Utils;
   import classes.items.Consumable;
   import classes.items.Mutations;
   import classes.lists.ColorLists;
   import flash.Boot;
   import haxe.IMap;
   
   public class RegularHummus extends Consumable
   {
      
      public static var ITEM_VALUE:int = 100;
      
      public function RegularHummus()
      {
         if(Boot.skip_constructor)
         {
            return;
         }
         super("Hummus ","Hummanus","a jar of cheesy-looking hummus",100,"This small clay jar contains a substance known as hummanus. Given the label, it\'s probably going to help you regain lost humanity.");
      }
      
      override public function useItem() : Boolean
      {
         var _loc3_:* = null as Array;
         var _loc4_:* = null as String;
         var _loc5_:* = null as Player;
         var _loc6_:int = 0;
         var _loc7_:* = null as Vagina;
         var _loc8_:* = null as Ass;
         var _loc1_:String = "regularHummus";
         var _loc2_:int = 0;
         get_mutations().initTransformation([2,2]);
         outputText("你打开小陶罐，露出一种颜色很浅的糊状物，闻起来出奇的美味。你开始用手指吃它，一直希望有一些饼干……");
         get_player().refillHunger(10);
         if(get_player().humanScore() > 4)
         {
            outputText("[pg]你眨了眨眼，世界在你周围扭曲。你感觉比一段时间以来更像你自己了，但具体是怎样还不能立刻看出来。也许你应该看看你自己？");
         }
         else
         {
            outputText("[pg]当世界在你周围旋转时，你大叫起来。你意识到你的整个身体在滑动和滑落，改变和变形，但在感觉的海洋中，你不知道到底是什么在改变。你几乎要昏过去了，然后一切都结束了。也许你最好看看你自己，看看发生了什么变化？");
         }
         if(Utils.rand(4) == 0 && get_changes() < get_changeLimit())
         {
            get_mutations().restoreLegs(_loc1_);
         }
         if(Utils.rand(5) == 0)
         {
            get_mutations().updateOvipositionPerk(_loc1_);
         }
         if(get_player().hasPerk(PerkLib.Incorporeality) && get_player().perkv4(PerkLib.Incorporeality) == 0 && get_changes() < get_changeLimit() && Utils.rand(4) == 0)
         {
            outputText("[pg]你的身体不知怎么地感觉比刚才更结实、更实质了。你集中注意力几秒钟，试图将自己推回无形的状态，但你似乎再也做不到了。\n<b>(失去特质：无形！)</b>");
            get_player().removePerk(PerkLib.Incorporeality);
            get_player().lowerBody.incorporeal = false;
            set_changes(get_changes() + 1);
         }
         if(get_player().lowerBody.incorporeal && get_changes() < get_changeLimit() && Utils.rand(4) == 0)
         {
            outputText("[pg]你的[legs]感到一种奇怪的感觉，因为它们开始感觉更结实了。它们变得更加不透明，直到最后，你再也无法看穿你的[legs]。");
            get_player().lowerBody.incorporeal = false;
            set_changes(get_changes() + 1);
         }
         if(get_player().neck.type != 0 && get_changes() < get_changeLimit() && Utils.rand(5) == 0)
         {
            get_mutations().restoreNeck(_loc1_);
         }
         if(get_player().hasNonSharkRearBody() && get_changes() < get_changeLimit() && Utils.rand(5) == 0)
         {
            get_mutations().restoreRearBody(_loc1_);
         }
         if(ColorLists.HUMAN_SKIN.indexOf(get_player().skin.tone) == -1 && get_changes() < get_changeLimit() && Utils.rand(5) == 0)
         {
            set_changes(get_changes() + 1);
            outputText("[pg]过了一会儿你才注意到，<b>");
            if(get_player().hasFur())
            {
               outputText("你[furcolor]的[skindesc]下的皮肤");
            }
            else
            {
               outputText("你的[skindesc]");
            }
            outputText("已经变成了");
            _loc3_ = ColorLists.HUMAN_SKIN;
            _loc4_ = _loc3_[Utils.rand(int(_loc3_.length))];
            get_player().skin.tone = _loc4_;
            outputText("[skintone]色。</b>");
            get_player().underBody.skin.tone = get_player().skin.tone;
            get_player().arms.updateClaws(get_player().arms.claws.type);
         }
         if(!get_player().hasPlainSkin() && (get_player().ears.type == 0 || get_player().ears.type == 4) && Utils.rand(4) == 0 && get_changes() < get_changeLimit())
         {
            outputText("[pg]一种缓慢积聚的瘙痒感蔓延至你的全身，当你漫不经心地抓挠时，你发现你的[skinfurscales]");
            if(get_player().hasScales())
            {
               outputText("正在");
            }
            else
            {
               outputText("正在");
            }
            outputText("掉落到地上，露出下面完美无瑕的皮肤。<b>你现在拥有了正常的皮肤。</b>");
            get_player().skin.restore();
            get_player().underBody.restore();
            set_changes(get_changes() + 1);
         }
         if(Utils.rand(4) == 0)
         {
            get_mutations().restoreArms(_loc1_);
         }
         if(get_player().face.type != 0 && get_changes() < get_changeLimit() && Utils.rand(4) == 0)
         {
            outputText("[pg]突如其来的剧痛席卷了你的[face]，随着骨骼扭曲和下颌线移位，你的面容变得十分狰狞。疼痛慢慢消失，留下你捂着脸抽泣。当你把手拿开时，你意识到自己已经恢复了一张完全正常的、人类的脸。");
            get_player().face.type = 0;
            set_changes(get_changes() + 1);
         }
         if(get_player().tongue.type != 0 && get_changes() < get_changeLimit() && Utils.rand(4) == 0)
         {
            outputText("[pg]你感觉到嘴里有些奇怪，你的舌头开始萎缩后退，直到感觉变得光滑圆润。<b>你意识到你的舌头变回了人类的舌头！</b>");
            get_player().tongue.type = 0;
            set_changes(get_changes() + 1);
         }
         if(get_changes() < get_changeLimit() && Utils.rand(5) == 0 && (get_player().eyes.type != 0 || get_player().eyes.count > 2))
         {
            if(get_player().eyes.type == 2)
            {
               outputText("[pg]你感到眼睛一阵刺痛，眨了眨眼。感觉就像黑色的白内障刚刚从你眼中脱落，你甚至不需要看自己的倒影就知道，你的眼睛已经恢复了人类的模样。");
            }
            else
            {
               outputText("[pg]你眨了眨眼，踉跄了一下，一阵眩晕感袭来，几乎让你的[feet]失去支撑。当你稳住身形睁开眼睛时，你意识到似乎有些不同了。你的视觉不知怎么的发生了变化。");
               if(get_player().eyes.type == 1 || get_player().eyes.type == 7)
               {
                  outputText("<b>你的蛛形怪物眼睛消失了！</b>");
               }
               outputText("<b>你再次拥有了正常的、类人的眼睛。</b>");
            }
            get_player().eyes.type = 0;
            get_player().eyes.count = 2;
            set_changes(get_changes() + 1);
         }
         if(get_player().ears.type != 0 && get_player().face.type == 0 && get_changes() < get_changeLimit() && Utils.rand(4) == 0)
         {
            outputText("[pg]哎哟，你的头好痛！感觉就像你的耳朵被从头上硬生生拔了出来，当你伸手去捂住疼痛的脑袋时，你发现它们已经消失了！你头晕目眩，摇摇晃晃，几乎失去了平衡感，差点摔倒好几次，直到<b>一对正常的、人类的耳朵从你头部两侧长了出来。</b>你几乎都快忘了人类耳朵是什么感觉了！");
            get_player().ears.type = 0;
            set_changes(get_changes() + 1);
         }
         if(Utils.rand(4) == 0 && get_player().hasGills() && get_changes() < get_changeLimit())
         {
            get_mutations().updateGills();
         }
         if(get_player().hasStatusEffect(StatusEffects.BlackNipples) && get_changes() < get_changeLimit() && Utils.rand(3) == 0)
         {
            get_mutations().removeBlackNipples(_loc1_);
         }
         if(get_changes() < get_changeLimit() && get_player().hair.type != 0 && Utils.rand(3) == 0)
         {
            outputText("[pg]你感到头皮发麻，伸手摸了摸头顶，感觉有些奇怪。你把手拿开，看向最近的反光面。<b>你的头发又恢复正常了！</b>");
            get_player().hair.type = 0;
            if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,66) != 0)
            {
               FlagDict_Impl_.arrayWriteInt(KFLAGS.flags,66,0);
            }
            set_changes(get_changes() + 1);
         }
         if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,66) != 0 && get_changes() < get_changeLimit() && Utils.rand(3) == 0)
         {
            outputText("[pg]你感到头皮发痒，意识到了这种变化。<b>你的头发又开始正常生长了！</b>");
            FlagDict_Impl_.arrayWriteInt(KFLAGS.flags,66,0);
            get_player().hair.type = 0;
            set_changes(get_changes() + 1);
         }
         if(get_player().antennae.type != 0 && Utils.rand(3) == 0 && get_changes() < get_changeLimit())
         {
            get_mutations().removeAntennae();
         }
         if(get_changes() < get_changeLimit() && (get_player().horns.type != 0 || get_player().horns.value != 0) && Utils.rand(5) == 0)
         {
            outputText("[pg]你的");
            if(get_player().horns.type == 7 || get_player().horns.type == 8)
            {
               outputText("角");
            }
            else
            {
               outputText("角");
            }
            outputText("碎裂，大块大块地掉落，直到完全剥落消失。");
            get_player().horns.value = 0;
            get_player().horns.type = 0;
            set_changes(get_changes() + 1);
         }
         if((get_player().wings.type != 0 || get_player().rearBody.type == 3) && Utils.rand(5) == 0 && get_changes() < get_changeLimit())
         {
            get_mutations().removeWings(_loc1_);
         }
         if(get_player().tail.type != 0 && Utils.rand(5) == 0 && get_changes() < get_changeLimit())
         {
            outputText("[pg]你感觉到你的背后有什么东西在变移。接着，有什么东西从你的背后脱落，掉在了地上。<b>你不再有尾巴了！</b>");
            get_player().tail.type = 0;
            get_player().tail.venom = 0;
            get_player().tail.recharge = 5;
            set_changes(get_changes() + 1);
         }
         if(Utils.rand(2) == 0 && get_changes() < get_changeLimit() && get_player().get_tallness() < (get_player().isChild() ? 42 : 58))
         {
            _loc2_ = Utils.rand(5) + 3;
            if(_loc2_ < 5)
            {
               outputText("[pg]你感到有些不舒服，因为你发现自己失去了平衡。低头一看，你发现自己长高了[i:slightly]。");
            }
            if(_loc2_ >= 5 && _loc2_ < 7)
            {
               outputText("[pg]你感到头晕目眩，有些不舒服，但很快意识到这是因为身高突然增加所致。");
            }
            if(_loc2_ == 7)
            {
               outputText("[pg]你踉跄着向前走去，头晕目眩地捂住脑袋。你花了一会儿时间才恢复平衡，站起身来，感觉自己明显长高了。");
            }
            _loc5_ = get_player();
            _loc5_.set_tallness(_loc5_.get_tallness() + _loc2_);
            set_changes(get_changes() + 1);
         }
         if(Utils.rand(2) == 0 && get_changes() < get_changeLimit() && get_player().get_tallness() > (get_player().isChild() ? 60 : 74))
         {
            outputText("[pg]你的皮肤一阵发麻，让你闭上眼睛打了个寒颤。当你再次睁开眼睛时，世界似乎……变得不同了。经过一番调查，你发现自己变矮了！\n");
            _loc5_ = get_player();
            _loc5_.set_tallness(_loc5_.get_tallness() - (3 + Utils.rand(5)));
            set_changes(get_changes() + 1);
         }
         if(get_player().totalCocks() > 1 && Utils.rand(3) == 0 && get_changes() < get_changeLimit())
         {
            get_player().killCocks(1);
            outputText("[pg]你的胯部一阵刺痛，产生了一种奇怪的感觉。解开你的[armor]，<b>你发现你的一根阴茎完全消失了！</b>");
            set_changes(get_changes() + 1);
         }
         if((get_player().balls > 0 || get_player().hasStatusEffect(StatusEffects.Uniball)) && Utils.rand(3) == 0 && get_changes() < get_changeLimit())
         {
            if(get_player().ballSize > 2)
            {
               if(get_player().ballSize > 5)
               {
                  var _temp_1:* = get_player();
                  _temp_1.ballSize = _temp_1.ballSize - (1 + Utils.rand(3));
               }
               var _temp_2:* = get_player();
               _temp_2.ballSize = _temp_2.ballSize - 1;
               outputText("[pg]你的阴囊慢慢缩小，稳定在一个较小的尺寸。<b>你的[balls]");
               if(get_player().balls == 1 || get_player().hasStatusEffect(StatusEffects.Uniball))
               {
                  outputText("现在变小了。</b>");
               }
               else
               {
                  outputText("现在变小了。</b>");
               }
               set_changes(get_changes() + 1);
            }
            else if(get_player().balls > 2)
            {
               get_player().balls = 2;
               if(get_player().hasStatusEffect(StatusEffects.Uniball))
               {
                  get_player().removeStatusEffect(StatusEffects.Uniball);
               }
               outputText("[pg]你的阴囊慢慢缩小，直到它们似乎达到了正常大小。<b>你能感觉到你多余的睾丸融合在了一起，只留下了一对睾丸。</b>");
               set_changes(get_changes() + 1);
            }
            else if(get_player().balls == 1 || get_player().hasStatusEffect(StatusEffects.Uniball))
            {
               get_player().balls = 2;
               if(get_player().hasStatusEffect(StatusEffects.Uniball))
               {
                  get_player().removeStatusEffect(StatusEffects.Uniball);
               }
               outputText("[pg]你的阴囊慢慢缩小，你感觉到腹股沟处释放了巨大的压力。<b>你的单睾丸分裂了，留下了一对睾丸。</b>");
               set_changes(get_changes() + 1);
            }
         }
         if(get_player().hasCock() && get_changes() < get_changeLimit())
         {
            _loc6_ = get_player().findFirstCockNotOfType(CockTypesEnum.HUMAN);
            if(Utils.rand(3) == 0 && _loc6_ != -1)
            {
               outputText("[pg]一种奇怪的刺痛感从你的" + get_player().cockDescript(_loc6_) + "后面开始，慢慢爬过它的整个长度。虽然既不是特别令人兴奋也不是不舒服，但随着感觉的加剧，你确实紧张地动了动。你忍住了解开[armor]检查的冲动，但从感觉上看，你的阴茎正在改变形状。最终，变形的感觉消退了，<b>给你留下了一根完全人类的阴茎。</b>");
               get_player().cocks[_loc6_].set_cockType(CockTypesEnum.HUMAN);
               set_changes(get_changes() + 1);
            }
         }
         if(get_player().hasCock() && get_player().biggestCockLength() > 7 && Utils.rand(3) == 0 && get_changes() < get_changeLimit())
         {
            _loc6_ = get_player().biggestCockIndex();
            if(int(get_player().cocks.length) == 1)
            {
               outputText("[pg]你感到一阵刺痛，你的阴茎缩小了！");
            }
            else
            {
               outputText("[pg]你感到一阵刺痛，你最大的阴茎缩小了！");
            }
            var _temp_3:* = get_player().cocks[_loc6_];
            _temp_3.cockLength = _temp_3.cockLength - (Utils.rand(10) + 2) / 10;
            if(get_player().cocks[_loc6_].cockThickness > 1)
            {
               outputText("你的" + get_player().cockDescript(_loc6_) + "肯定也变细了一点。");
               var _temp_4:* = get_player().cocks[_loc6_];
               _temp_4.cockThickness = _temp_4.cockThickness - (Utils.rand(4) + 1) / 10;
            }
            set_changes(get_changes() + 1);
         }
         if(get_changes() < get_changeLimit() && int(get_player().breastRows.length) > 1 && Utils.rand(3) == 0)
         {
            get_mutations().removeExtraBreastRow(_loc1_);
         }
         if(get_player().averageNipplesPerBreast() > 1 && Utils.rand(4) == 0 && get_changes() < get_changeLimit())
         {
            outputText("[pg]你的乳头感到一阵紧绷，每个乳房上的四个乳头中有三个完全消退，剩下的乳头移到了乳房的中间。<b>你每个乳房上只剩下一个乳头。</b>");
            _loc6_ = 0;
            while(_loc6_ < get_player().bRows())
            {
               get_player().breastRows[_loc6_].nipplesPerBreast = 1;
               _loc6_++;
            }
            set_changes(get_changes() + 1);
         }
         if(get_changes() < get_changeLimit() && Utils.rand(3) == 0 && get_player().biggestTitSize() > 4)
         {
            get_player().shrinkTits();
            set_changes(get_changes() + 1);
         }
         if(get_changes() < get_changeLimit() && Utils.rand(3) == 0 && get_player().vaginaType() == 5 && get_player().hasVagina())
         {
            outputText("[pg]有什么看不见的东西拂过你的性器官，让你感到一阵刺痛。解开衣服，你看了看你的阴道，发现它已经变回了自然的肉色。");
            get_player().vaginaType(0);
            set_changes(get_changes() + 1);
         }
         if(get_changes() < get_changeLimit() && Utils.rand(3) == 0 && get_player().hasVagina() && get_player().vaginas[0].vaginalWetness > 2)
         {
            outputText("[pg]从你的" + get_player().vaginaDescript(0) + "中流出的不断流淌的液体减慢了，让你感觉自己不再像一个性感的滑梯。");
            _loc7_ = get_player().vaginas[0];
            --_loc7_.vaginalWetness;
            set_changes(get_changes() + 1);
         }
         if(get_player().hasVagina() && get_player().fertility > 10 && Utils.rand(3) == 0 && get_changes() < get_changeLimit())
         {
            if(get_player().fertility >= 30)
            {
               outputText("[pg]感觉你过度亢奋的生殖器官稍微平息了一些。");
            }
            else
            {
               outputText("[pg]你感觉体内稍微干涸了一些；留下一种奇妙的宁静感。");
            }
            var _temp_5:* = get_player();
            _temp_5.fertility = _temp_5.fertility - (1 + Utils.rand(3));
            if(get_player().fertility < 10)
            {
               get_player().fertility = 10;
            }
            set_changes(get_changes() + 1);
         }
         if(get_player().hasCock() && get_player().cumMultiplier > 5 && Utils.rand(3) == 0 && get_changes() < get_changeLimit())
         {
            outputText("[pg]你感到一阵奇怪的酥麻感从你的");
            if(get_player().balls > 0)
            {
               outputText("睾丸");
            }
            else
            {
               outputText("下体");
            }
            outputText("传来，你能感觉到密度在降低。你觉得现在产生的精液会变少了。");
            var _temp_6:* = get_player();
            _temp_6.cumMultiplier = _temp_6.cumMultiplier - (1 + Utils.rand(20) / 10);
            if(get_player().cumMultiplier < 1)
            {
               get_player().cumMultiplier = 1;
            }
            set_changes(get_changes() + 1);
         }
         if(get_player().ass.analWetness > 0 && Utils.rand(3) == 0 && get_changes() < get_changeLimit())
         {
            outputText("[pg]你的[ass]突然产生了一种不舒服的、类似抽吸的感觉，让那里感觉比以前更干燥了。<b>你的屁眼湿润度略微下降了。</b>");
            _loc8_ = get_player().ass;
            --_loc8_.analWetness;
            set_changes(get_changes() + 1);
         }
         var _loc9_:IMap = KFLAGS.flags;
         FlagDict_Impl_.arrayWriteInt(_loc9_,2077,FlagDict_Impl_.arrayReadInt(_loc9_,2077) + get_changes());
         return false;
      }
   }
}

