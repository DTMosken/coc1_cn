package classes.items.consumables
{
   import classes.Ass;
   import classes.Cock;
   import classes.DynStat;
   import classes.PerkLib;
   import classes.Player;
   import classes.StatusEffects;
   import classes._FlagDict.FlagDict_Impl_;
   import classes.globalFlags.KFLAGS;
   import classes.internals.Utils;
   import classes.items.Consumable;
   import classes.items.Mutations;
   import classes.lists.ColorLists;
   import flash.Boot;
   import haxe.IMap;
   
   public class GoblinAle extends Consumable
   {
      
      public function GoblinAle()
      {
         if(Boot.skip_constructor)
         {
            return;
         }
         super("Gob.Ale","Goblin Ale","a flagon of potent goblin ale",6,"This sealed flagon of \'Goblin Ale\' sloshes noisily with alcoholic brew. Judging by the markings on the flagon, it\'s a VERY strong drink, and not to be trifled with.");
      }
      
      override public function useItem() : Boolean
      {
         var _loc2_:* = null as Player;
         var _loc3_:Number = NaN;
         var _loc4_:* = null as Ass;
         var _loc5_:* = null as Ass;
         var _loc1_:String = "goblinAle";
         get_player().slimeFeed();
         get_mutations().initTransformation([2,3,4,5]);
         outputText("你喝下了麦酒，发现它的口感异常顺滑，但酒劲很大。你舔了舔嘴唇，打了个喷嚏，感觉有点微醺。");
         dynStats(DynStat.Lust(15));
         if(get_player().get_str100() > 50)
         {
            dynStats(DynStat.Str(-1));
            if(get_player().get_str100() > 70)
            {
               dynStats(DynStat.Str(-1));
            }
            if(get_player().get_str100() > 90)
            {
               dynStats(DynStat.Str(-2));
            }
            outputText("[pg]你感觉有点虚弱，但也许只是酒精的作用。");
         }
         if(get_player().get_tou100() > 50)
         {
            outputText("[pg]你咯咯笑着戳了戳自己，当你意识到自己变得有多柔软时，你笑得更厉害了。");
            dynStats(DynStat.Tou(-1));
            if(get_player().get_tou100() > 70)
            {
               dynStats(DynStat.Tou(-1));
            }
            if(get_player().get_tou100() > 90)
            {
               dynStats(DynStat.Tou(-2));
            }
         }
         if(get_changes() < get_changeLimit() && get_player().hair.type == 4 && Utils.rand(2) == 0)
         {
            outputText("[pg]当你喝下这烈性麦酒时，你的头开始感觉变重了——而且不仅仅是因为酒精！你伸出手，发现你的触手变得柔软，甚至有些纤维化。你拉下一根，发现它摸起来光滑、如丝般柔顺，而且呈纤维状；你看着它溶解成许多细细的、像头发一样的发丝。<b>你的头发现在恢复正常了！</b>");
            get_player().hair.type = 0;
            set_changes(get_changes() + 1);
         }
         if(Utils.rand(2) == 0 && get_player().get_tallness() > 48)
         {
            set_changes(get_changes() + 1);
            outputText("[pg]天旋地转，而且不仅仅是因为酒劲！你的视线离地面更近了。真有趣！");
            _loc2_ = get_player();
            _loc2_.set_tallness(_loc2_.get_tallness() - (1 + Utils.rand(5)));
         }
         if(Utils.rand(3) == 0 && get_player().get_spe100() < 50 && get_changes() < get_changeLimit())
         {
            dynStats(DynStat.Spe(1 + Utils.rand(2)));
            outputText("[pg]你感觉想跳舞，但当你迈步时却踉跄了一下，因为你的双腿反应比你想象的还要快。是酒精让你变迟钝了，还是你真的变快了？你迈出一步，失去平衡，差点摔个狗啃泥。绝对是两者都有。");
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
         if(Utils.rand(4) == 0)
         {
            get_mutations().restoreArms(_loc1_);
         }
         if(int(get_player().cocks.length) > 1 && Utils.rand(3) == 0 && get_changes() < get_changeLimit())
         {
            outputText("[pg]");
            get_player().killCocks(1);
            set_changes(get_changes() + 1);
         }
         if(get_changes() < get_changeLimit() && Utils.rand(3) == 0 && get_player().hasVagina() && get_player().statusEffectv1(StatusEffects.BonusVCapacity) < 40)
         {
            if(!get_player().hasStatusEffect(StatusEffects.BonusVCapacity))
            {
               get_player().createStatusEffect(StatusEffects.BonusVCapacity,0,0,0,0);
            }
            get_player().addStatusValue(StatusEffects.BonusVCapacity,1,5);
            outputText("[pg]你的" + get_player().vaginaDescript(0) + "里突然感到一阵……空虚。不知为何，你知道自己可以容纳更大尺寸的……插入了。");
            set_changes(get_changes() + 1);
         }
         if(get_changes() < get_changeLimit() && Utils.rand(4) == 0 && get_player().fertility < 40 && get_player().hasVagina())
         {
            var _temp_1:* = get_player();
            _temp_1.fertility = _temp_1.fertility + (2 + Utils.rand(5));
            set_changes(get_changes() + 1);
            outputText("[pg]你感觉很奇怪。不知为何……变得易孕了。你不知道还能怎么形容，但你已经准备好成为一位母亲了。");
         }
         else if(int(get_player().cocks.length) == 1 && Utils.rand(2) == 0 && get_changes() < get_changeLimit() && !get_hyper())
         {
            if(get_player().cocks[0].cockLength > 12)
            {
               set_changes(get_changes() + 1);
               _loc3_ = 0;
               outputText("[pg]");
               if(get_player().cocks[0].cockLength < 6 && get_player().cocks[0].cockLength >= 2.9)
               {
                  var _temp_2:* = get_player().cocks[0];
                  _temp_2.cockLength = _temp_2.cockLength - 0.5;
                  _loc3_ -= 0.5;
               }
               _loc3_ += get_player().increaseCock(0,(Utils.rand(3) + 1) * -1);
               get_player().lengthChange(_loc3_,1);
            }
         }
         if(get_player().wings.type != 0 && get_changes() < get_changeLimit() && Utils.rand(4) == 0)
         {
            if(get_player().rearBody.type == 3)
            {
               outputText("[pg]你的背部一阵刺痛，感觉变轻了。有什么东西“扑通”一声掉在你身后，当你转头看时，发现你的鳍掉下来了。这可能是你喝过最好（也是最糟）的酒了！<b>你不再有鳍了！</b>");
               get_player().rearBody.restore();
            }
            else
            {
               outputText("[pg]你的肩膀一阵刺痛，感觉变轻了。有什么东西“扑通”一声掉在你身后，当你转头看时，发现你的翅膀掉下来了。这可能是你喝过最好（也是最糟）的酒了！<b>你不再有翅膀了！</b>");
            }
            get_player().wings.restore();
            set_changes(get_changes() + 1);
         }
         if(get_player().antennae.type != 0 && get_changes() < get_changeLimit() && Utils.rand(3) == 0)
         {
            get_mutations().removeAntennae();
         }
         if(get_changes() < get_changeLimit() && Utils.rand(5) == 0 && get_player().eyes.type > 0)
         {
            if(get_player().eyes.type == 2)
            {
               outputText("[pg]你感到眼睛一阵刺痛，眨了眨眼。感觉就像黑色的白内障刚刚从你身上脱落，你不需要看倒影就知道你的眼睛已经恢复了人类的模样。");
            }
            else
            {
               outputText("[pg]你眨了眨眼，踉跄了一下，一阵眩晕感差点让你站不稳[feet]。当你站稳并睁开眼睛时，你意识到有些不同。你的视觉不知怎么改变了。");
               if(get_player().eyes.type == 1 || get_player().eyes.type == 7)
               {
                  outputText("你的蜘蛛复眼消失了！</b>");
               }
               outputText("<b>你再次拥有了正常的人类眼睛。</b>");
            }
            get_player().eyes.type = 0;
            get_player().eyes.count = 2;
            set_changes(get_changes() + 1);
         }
         if(get_changes() < get_changeLimit() && get_player().bRows() > 1 && Utils.rand(3) == 0)
         {
            get_mutations().removeExtraBreastRow(_loc1_);
         }
         if(!get_player().hasPlainSkin() && get_changes() < get_changeLimit() && Utils.rand(4) == 0 && get_player().face.type == 0)
         {
            if(get_player().hasFur())
            {
               outputText("[pg]你的皮毛痒个不停，于是你开始抓挠。它开始大把大把地脱落，随后整片皮毛从你身上剥落。几秒钟内，你的皮肤就变得光秃秃的了。<b>你失去了你的皮毛！</b>");
            }
            if(get_player().hasScales())
            {
               outputText("[pg]你的鳞片痒个不停，于是你开始抓挠。它们开始大片大片地脱落，没过一会儿，你就站在了一堆鳞片之中。<b>你失去了你的鳞片！</b>");
            }
            if(get_player().hasGooSkin())
            {
               outputText("[pg]你的[skindesc]痒个不停，随着你的抓挠，它开始发生变化，变成了正常的人类皮肤。<b>你的皮肤再次恢复了正常！</b>");
            }
            get_player().skin.adj = "";
            get_player().skin.desc = "skin";
            get_player().skin.type = 0;
            get_player().underBody.restore();
            set_changes(get_changes() + 1);
         }
         if(ColorLists.GOBLIN_SKIN.indexOf(get_player().skin.tone) == -1 && get_changes() < get_changeLimit() && Utils.rand(2) == 0)
         {
            if(Utils.rand(10) != 0)
            {
               get_player().skin.tone = "dark green";
            }
            else if(Utils.rand(2) == 0)
            {
               get_player().skin.tone = "pale yellow";
            }
            else
            {
               get_player().skin.tone = "grayish-blue";
            }
            get_player().arms.updateClaws(get_player().arms.claws.type);
            set_changes(get_changes() + 1);
            outputText("[pg]哇哦，真奇怪。你刚才产生了幻觉，觉得你的");
            if(get_player().hasFur())
            {
               outputText("皮肤");
            }
            else
            {
               outputText(Utils.cnName(get_player().skin.desc));
            }
            outputText("变成了[skintone]。不可能！它没有变回去，颜色真的变了！");
         }
         if(get_player().face.type != 0 && get_changes() < get_changeLimit() && Utils.rand(4) == 0 && get_player().ears.type == 4)
         {
            set_changes(get_changes() + 1);
            get_player().face.type = 0;
            outputText("[pg]你又猛烈地打了个喷嚏。好痛！你摸了摸鼻子，发现你的脸变回了更正常的模样。<b>你又拥有了一张人类的脸！</b>");
         }
         if(get_player().ears.type != 4 && get_changes() < get_changeLimit() && Utils.rand(3) == 0)
         {
            outputText("[pg]当你的[hair]微微移动时，一阵奇怪的刺痛感传遍了你的头皮。你伸手去摸，碰到了<b>你那新长出的尖尖的精灵耳朵</b>。你敢打赌它们看起来一定很可爱！");
            set_changes(get_changes() + 1);
            get_player().ears.type = 4;
         }
         if(Utils.rand(4) == 0 && get_player().hasGills() && get_changes() < get_changeLimit())
         {
            get_mutations().updateGills();
         }
         if(get_player().hasStatusEffect(StatusEffects.BlackNipples) && get_changes() < get_changeLimit() && Utils.rand(3) == 0)
         {
            get_mutations().removeBlackNipples(_loc1_);
         }
         if(get_changes() < get_changeLimit() && Utils.rand(3) == 0 && get_player().vaginaType() == 5 && get_player().hasVagina())
         {
            outputText("[pg]有什么看不见的东西拂过你的下体，让你感到一阵刺痛。解开衣服，你看了看你的阴道，发现它已经变回了自然的肉色。");
            get_player().vaginaType(0);
            set_changes(get_changes() + 1);
         }
         if(get_changes() < get_changeLimit() && Utils.rand(4) == 0 && (get_player().ass.analWetness > 0 && !get_player().hasPerk(PerkLib.MaraesGiftButtslut) || get_player().ass.analWetness > 1))
         {
            outputText("[pg]你感到结肠一阵收缩，你的[asshole]向内吸去。起初你感到一阵剧痛，但谢天谢地，疼痛逐渐消退了。你的屁股似乎变得干燥紧致了。");
            _loc4_ = get_player().ass;
            --_loc4_.analWetness;
            if(get_player().ass.analLooseness > 1)
            {
               _loc5_ = get_player().ass;
               --_loc5_.analLooseness;
            }
            set_changes(get_changes() + 1);
         }
         if(get_changes() < get_changeLimit() && Utils.rand(3) == 0)
         {
            if(Utils.rand(2) == 0)
            {
               get_player().modFem(85,3);
            }
            if(Utils.rand(2) == 0)
            {
               get_player().modThickness(20,3);
            }
            if(Utils.rand(2) == 0)
            {
               get_player().modTone(15,5);
            }
         }
         get_player().refillHunger(15);
         var _loc6_:IMap = KFLAGS.flags;
         FlagDict_Impl_.arrayWriteInt(_loc6_,2077,FlagDict_Impl_.arrayReadInt(_loc6_,2077) + get_changes());
         return false;
      }
   }
}

