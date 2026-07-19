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
   
   public class EmberTFs extends Consumable
   {
      
      public function EmberTFs(param1:int = 0)
      {
         var _loc2_:* = null as String;
         var _loc3_:* = null as String;
         var _loc4_:* = null as String;
         var _loc5_:* = null as String;
         var _loc6_:int = 0;
         if(Boot.skip_constructor)
         {
            return;
         }
         if(param1 == 1)
         {
            _loc2_ = "DrakHrt";
            _loc3_ = "DrakeHeart";
            _loc4_ = "a drake\'s heart flower";
            _loc5_ = "一朵罕见而美丽的花。它可以制成精致的香水。传说中，龙族会将这种花送给他们想要追求的对象。";
            _loc6_ = 50;
         }
         else
         {
            _loc2_ = "EmberBl";
            _loc3_ = "Ember\'s Blood";
            _loc4_ = "Embers\'s blood";
            _loc5_ = "烬的龙血。无法买卖。立即消耗。>>>不应该看到我。<<<";
            _loc6_ = 0;
         }
         super(_loc2_,_loc3_,_loc4_,_loc6_,_loc5_);
         addTags("Transformative");
      }
      
      override public function useItem() : Boolean
      {
         var _loc2_:int = 0;
         var _loc4_:* = null as Array;
         var _loc5_:int = 0;
         var _loc6_:Number = NaN;
         var _loc7_:Number = NaN;
         var _loc8_:* = null as String;
         var _loc1_:String = "EmberTFs-" + get_shortName();
         var _loc3_:Boolean = _loc1_ == "EmberTFs-DrakeHeart";
         get_mutations().initTransformation(null,2);
         if(_loc3_)
         {
            outputText("你把花拿到鼻子前闻了闻。它散发着精致的香气。你突然产生了一种想吃掉它的奇怪欲望。你把花塞进嘴里咀嚼起来。不知怎么的，它尝起来像香草。不知不觉中，你感到一种奇怪的刺痛感：你可能正在发生变化！");
         }
         if(get_changes() < get_changeLimit() && get_player().countCocksOfType(CockTypesEnum.DRAGON) < get_player().totalCocks() && Utils.rand(3) == 0)
         {
            _loc2_ = 0;
            _loc4_ = [];
            _loc2_ = get_player().cockTotal();
            while(_loc2_ > 0)
            {
               _loc2_--;
               if(get_player().cocks[_loc2_].get_cockType() != CockTypesEnum.DRAGON)
               {
                  _loc4_[int(_loc4_.length)] = _loc2_;
               }
            }
            _loc5_ = int(_loc4_[Utils.rand(int(_loc4_.length))]);
            outputText("[pg]你的" + get_player().cockDescript(_loc5_) + "感到一阵刺痛，就像有针在上面扫过。你拉开你的[armor]看着它发生变化；顶端变长并变细，像长矛一样；阴茎干上形成了一系列隆起，让它看起来几乎像分节一样，底部肿胀出一个突出的阴茎结。你忍不住抚摸它，直到它开始滴下预精；");
            if(get_player().get_sens100() >= 50)
            {
               outputText("然而，直到你按压你那新生的、敏感的阴茎结，你才成功射精，并在它最终完成变化时享受着最后几下快感的痉挛。");
            }
            else
            {
               outputText("但你严厉地控制住自己的手，把它们塞进腋窝，任由这令人兴奋的变化顺其自然地进行。");
            }
            outputText("<b>你现在拥有了一根龙的阴茎。</b>");
            dynStats(DynStat.Sens(10),DynStat.Lust(10));
            set_changes(get_changes() + 1);
            get_player().cocks[_loc5_].set_cockType(CockTypesEnum.DRAGON);
            get_player().cocks[_loc5_].knotMultiplier = 1.3;
         }
         if(get_changes() < get_changeLimit() && int(get_player().breastRows.length) > 1 && Utils.rand(3) == 0 && !get_hyper())
         {
            get_mutations().removeExtraBreastRow(_loc1_);
         }
         if(Utils.rand(5) == 0)
         {
            get_mutations().updateOvipositionPerk(_loc1_);
         }
         if(get_mutations().tfNoFur() && get_changes() < get_changeLimit() && Utils.rand(3) == 0 && get_player().face.type != 12 && (FlagDict_Impl_.arrayReadInt(KFLAGS.flags,524) > 0 ? FlagDict_Impl_.arrayReadInt(KFLAGS.flags,531) == 0 : !get_noFur()))
         {
            outputText("[pg]你尖叫起来，你的脸突然扭曲了；你的面部骨骼开始在皮肤下重新排列，重构成一个细长的口鼻。剧痛撕裂了你的下巴，你的牙齿被粗暴地从牙龈中挤出，长出了一排排新的尖牙——细长而锋利。你的下颌线开始长出奇怪的增生物；小刺沿着你的口鼻下方生长，让你的面容变得越来越不似人类。");
            outputText("[pg]最后，疼痛平息下来，你找了一个方便的水坑来检查你改变后的外貌。");
            outputText("[pg]你的头变成了一个爬行动物的口鼻，下巴下方有小倒刺。<b>你现在有了一张龙脸。</b>");
            get_player().face.type = 12;
            set_changes(get_changes() + 1);
         }
         if(!get_player().hasDragonHorns(true) && get_changes() < get_changeLimit() && Utils.rand(5) == 0)
         {
            get_mutations().gainDraconicHorns(_loc1_);
         }
         if(get_changes() < get_changeLimit() && Utils.rand(3) == 0 && get_player().ears.type != 10)
         {
            get_player().ears.type = 10;
            outputText("[pg]一种刺痛感突然充满了你的耳朵；令人不快，但并不算痛。这种感觉越来越强烈，直到你再也受不了，伸手去抓它们。令你惊讶的是，你发现它们像过热的蜡烛一样融化了。当它们消失得无影无踪时，你惊慌失措，暂时失聪和发呆，在混乱中跌跌撞撞。然后，突然之间，你的听力恢复了。你庆幸地摸索着，发现你现在有一对爬行动物的耳孔，在头部的两侧各一个。突然一阵剧痛袭向你的太阳穴，你感觉到骨刺从你头部的两侧爆裂而出，每侧三根，它们很快被皮肤褶皱包裹，看起来像鳍一样。稍微耐心一点，你开始像调整耳朵一样调整这些鳍来帮助你听声音。<b>你现在有了龙耳！</b>");
            set_changes(get_changes() + 1);
         }
         if(get_changes() < get_changeLimit() && Utils.rand(3) == 0 && get_player().tongue.type != 3)
         {
            outputText("[pg]你的舌头突然从嘴里掉了出来，并在变长的同时开始起伏。有一瞬间，它不受控制地狂乱摆动；但随后平静下来，你发现你可以随意控制它，几乎就像四肢一样。你能够将它伸长到近4英尺，并将其缩回嘴里，直到它看起来像正常的人类舌头。<b>你现在有了龙舌。</b>");
            get_player().tongue.type = 3;
            set_changes(get_changes() + 1);
         }
         if(get_mutations().tfNoFur() && !get_player().hasDragonScales() && get_changes() < get_changeLimit() && Utils.rand(3) == 0)
         {
            outputText("[pg]刺痛的不适感突然在你的全身爆发，就像你每一寸皮肤都突然长出了针刺。你抓挠着自己，希望能缓解这种感觉；当你看着你的手时，你注意到你的[skinFurScales]的小碎片挂在你的手指上。尽管如此，你还是继续抓挠自己，当你终于停下来时，你打量了一下自己。新的盾状鳞片长了出来，取代了你剥落的[skinFurScales]。它们很光滑，看起来几乎和铁一样坚硬。");
            get_player().skin.setProps({
               "type":5,
               "adj":"坚韧的",
               "desc":"盾形龙鳞"
            });
            get_player().underBody.type = 1;
            get_player().copySkinToUnderBody({"desc":"腹部龙鳞"});
            outputText("<b>你的身体现在覆盖着[skinTone]的盾状龙鳞，[underBody.skinTone]的腹部鳞片覆盖着你的下半身。</b>");
         }
         if(get_player().eyes.type != 4 && get_player().hasDragonScales() && get_player().ears.type == 10 && get_player().hasDragonHorns() && get_changes() < get_changeLimit() && Utils.rand(4) == 0)
         {
            if(get_player().hasReptileEyes())
            {
               outputText("[pg]你的眼睛在外观上发生了轻微的变化。");
            }
            else
            {
               outputText("[pg]你感到眼睛突然一阵剧痛，它们开始改变形状。你的瞳孔开始拉长，变成了垂直的竖瞳，虹膜的颜色也发生了改变。");
               outputText("\n疼痛消退后，你借着附近水坑的倒影检查自己的眼睛。你注视着自己那双充满骄傲与凶性的全新龙眼，垂直的竖瞳配上燃烧般的橙色虹膜。");
               outputText("它们即使在黑暗中也闪烁着光芒。由于眼角还挂着几滴泪水，视线有些模糊。为了看得更清楚，你眨眼挤掉残存的泪水，却突然意识到，你刚才眨动的是你的第二层眼睑。");
            }
            outputText("<b>你现在拥有了凶猛的龙眼。</b>");
            get_player().eyes.type = 4;
            set_changes(get_changes() + 1);
         }
         if(get_player().lowerBody.type != 18 && get_changes() < get_changeLimit() && Utils.rand(3) == 0)
         {
            if(get_player().lowerBody.type == 16)
            {
               outputText("[pg]一种令人不安的感觉在你的蜘蛛腹部蔓延，你发现自己失去了对腰部以下身体的控制。随着腹部肉眼可见地肿胀，你的蜘蛛腿疯狂地挥舞着，体内的压力不断积聚，甲壳发出不祥的碎裂声……然后猛地炸开了！你满脸嫌恶地擦去脸上的血肉碎块，奇怪自己为什么感觉不到疼痛。翻过身来，你看到在沾满蜘蛛粘液的地方，长出了一双新的腿，除了覆盖着鳞片以及长着野兽般的爪子作为脚之外，看起来和人类的腿差不多。<b>你现在拥有了龙脚。</b>");
            }
            else if(get_player().hasTailInsteadOfLegs())
            {
               outputText("[pg]你脸朝下摔倒在地，痛苦地嘶嘶尖叫——感觉就像有人抓住了你尾巴的尖端，恶毒地把它拉直，然后用刀从中间劈开！你腰部以下瘫痪了，绝望地抓挠着泥土试图减轻痛苦，当疼痛消退时，你只能感谢幸运星的眷顾。低头看向你尾巴曾经所在的地方，虽然鳞片还在，但你意识到你又变成了两足动物，你新脚的脚趾上长着野兽般的爪子。<b>你现在有了龙脚。</b>");
            }
            else if(get_player().isGoo())
            {
               outputText("[pg]一种奇怪的刺痛感充满了你的全身，你看着你那黏糊糊的身体开始起伏颤抖；你试图让它停下来，但你无法控制它。在你眼前，它塑造成了腿的形状，彩色的史莱姆变得越来越浓密厚实，表面膜的纹理变得像鳞片一样。在你完全意识到发生了什么之前，史莱姆就像水结冰一样凝固了，让你再次拥有了人形的腿，尽管脚尖长着爪子，外观非常像爬行动物。<b>你现在有了龙脚。</b>");
            }
            else if(get_player().lowerBody.type == 1)
            {
               outputText("[pg]你痛苦地咆哮着，你的腿断裂并重组，你的蹄子似乎突然爆炸了，里面的骨头扭曲成可怕的三趾附肢，比任何东西都更像某种可怕的蜥蜴怪物的附肢。<b>你现在有了龙脚。</b>");
            }
            else if(get_player().isTaur())
            {
               outputText("[pg]你大叫起来，一阵阵的剧痛突然撕裂了你四足的身体，让你重重地摔在地上。言语无法形容肌肉和骨骼剧烈扭曲、移位和塌陷时的痛苦。当一切都结束时，你踉跄着站起来，发现自己又用两条腿站立了。虽然覆盖着鳞片，并且长着某种怪物蜥蜴的爪子而不是脚，但它们看起来就像你以前的人类腿。<b>你现在有了龙脚。</b>");
            }
            else
            {
               outputText("[pg]你痛苦地尖叫着，因为你感觉到脚上的骨头突然断裂并重组，脚趾融合在一起，骨头从融合的肉块中肿胀出来。当疼痛结束时，你意识到你仍然站立在看起来像人类的腿上，但你的脚变得像某种两足爬行杀手的脚一样，有着用来抓住地面的强有力的爪子。<b>你现在有了龙脚。</b>");
            }
            get_player().lowerBody.type = 18;
            get_player().lowerBody.legCount = 2;
            set_changes(get_changes() + 1);
         }
         if(get_player().tail.type != 14 && get_changes() < get_changeLimit() && Utils.rand(3) == 0)
         {
            if(get_player().tail.type == 0)
            {
               outputText("[pg]你的[butt]突然传来一阵隐隐的钝痛，让你忍不住伸手去捂；你能感觉到尾骨上方有一个不祥的肿块，随着每一次心跳越肿越大。突然之间，它似乎炸开了，向外突出并延伸，直到悬在你的脚踝附近，皮肉下变得坚硬且布满鳞片。<b>你长出了一条龙尾；又长又粗，肌肉发达，却又十分灵活。</b>");
            }
            else
            {
               outputText("[pg]一种冰冷的感觉充满了你的身后，你的尾巴突然变得异常麻木。你扭过头，看着它融化并变成了一条爬行动物的附肢，粗壮有力，修长灵活，末端逐渐变细，长满了邪恶的尖刺。<b>你现在有了一条龙尾。</b>");
            }
            get_player().tail.type = 14;
            set_changes(get_changes() + 1);
         }
         if((get_player().wings.type != 11 || get_player().rearBody.type == 3) && get_changes() < get_changeLimit() && Utils.rand(3) == 0)
         {
            if(get_player().wings.type == 0)
            {
               outputText("[pg]一阵阵剧痛突然袭向你的肩胛骨，你痛苦地弯下腰；你的背部感觉像是在肿胀，血肉和肌肉都在膨胀。伴随着一声突然的撕裂声，疼痛感减轻了，你直起身来。现在你的背上长出了一对小巧的革质翅膀，看起来和蝙蝠的翅膀没什么两样。<b>你现在有了小巧的龙翼。它们还不够大，无法用来飞行，但看起来很可爱。</b>");
               get_player().wings.type = 10;
            }
            else if(get_player().wings.type == 10)
            {
               outputText("[pg]一种并不令人讨厌的刺痛感充满了你的翅膀，几乎（但还没有完全）淹没了它们变得更大更强壮时那种奇怪的、痒痒的感觉。你把它们展开——它们伸展得比你的手臂还要长——并试探性地拍打了一下，强大的推力掀起了一阵狂风，几乎把你整个人带离地面。<b>你现在拥有了完全长成的龙翼，能够让你在空中优雅地飞行！</b>");
               get_player().wings.type = 11;
            }
            else if(get_player().rearBody.type == 3)
            {
               outputText("[pg]一阵麻木感突然充满了你的鳍。当这种感觉消失时，它感觉……不一样了。回头一看，你发现它已经被一对新的小翅膀取代了，你只能用龙的翅膀来形容它们。<b>你那鲨鱼般的鳍变成了龙翼。</b>");
               get_player().rearBody.restore();
               get_player().wings.type = 10;
            }
            else
            {
               outputText("[pg]一阵麻木感突然充满了你的翅膀。当这种感觉消失时，它们感觉……不一样了。回头一看，你发现它们已经被一对新的小翅膀取代了，你只能用龙的翅膀来形容它们。<b>你的翅膀变成了龙翼。</b>");
               get_player().wings.type = 10;
            }
            if(["","no"].indexOf(get_player().wings.color) != -1 || ["","no"].indexOf(get_player().wings.color2) != -1)
            {
               get_player().wings.color = get_player().skin.tone;
               get_player().wings.color2 = get_player().skin.tone;
            }
            set_changes(get_changes() + 1);
         }
         if(!_loc3_ && !get_player().hasDragonRearBody() && (get_player().hasDragonNeck() || FlagDict_Impl_.arrayReadInt(KFLAGS.flags,531) == 1) && get_player().dragonScore() >= 4 && get_player().hasDraconicBackSide() && get_changes() < get_changeLimit() && Utils.rand(3) == 0)
         {
            _loc6_ = get_player().fetchEmberRearBody();
            _loc7_ = _loc6_;
            if(_loc7_ == 1)
            {
               outputText("[pg]你突然感到脊椎上方一阵刺痛。你急于想知道原因，于是弯下你的[if (hasDragonNeck) {龙颈|尾巴}]仔细查看。看着你的[if (hasDragonNeck) {背部|尾巴}]，你看到一小块一小块的毛发开始从你长满鳞片的皮肤上长出来。毛发越长越长，斑块也越来越大，直到它们慢慢合并成一条位于你脊椎正上方的垂直条纹。");
               outputText("[pg]沿着你的脊椎，长出了一排鬃毛；从脖子根部开始，一直延伸到尾巴，在尾尖形成一小撮毛。它的颜色和你头上的头发一样，但更短更密；它长成了一条厚厚的垂直带状，大约两英寸宽。它让你隐约想起马的鬃毛。<b>你现在背上长着毛茸茸的鬃毛。</b>");
               get_player().rearBody.setAllProps({
                  "type":1,
                  "color":get_player().hair.color
               });
            }
            else if(_loc7_ == 2)
            {
               outputText("[pg]你突然感到脊椎传来一阵剧痛。你急于想知道原因，于是弯下你的[if (hasDragonNeck) {龙颈|尾巴}]仔细查看。你在越来越剧烈的疼痛中看着你的[if (hasDragonNeck) {背部|尾巴}]，小突起开始从你的脊椎中冒出来，越长越大，直到你感到一阵突如其来的剧痛，小刺开始刺破你的皮肤。你强忍着越来越剧烈的疼痛，继续看着它们慢慢变长，向后弯曲，直到最后疼痛停止。");
               outputText("[pg]顺着你的脊椎，一排短小、钢灰色且向后弯曲的尖刺突了出来；从你的脖子根部开始，一直延伸到你的尾巴，在尾尖处结束。它们长成了一条粗大的垂直带，大约一英寸宽，两英寸高。这让你隐约联想到马的鬃毛。");
               outputText("<b>你的后背现在装饰着一排弯曲的尖刺。</b>");
               get_player().rearBody.setAllProps({"type":2});
            }
         }
         if(get_player().neck.type != 1 && get_changes() < get_changeLimit() && Utils.rand(4) == 0)
         {
            get_mutations().restoreNeck(_loc1_);
         }
         if(!_loc3_ && !get_player().hasDragonNeck() && get_player().dragonScore() >= 6 && get_player().hasDraconicBackSide() && get_player().face.type == 12 && get_changes() < get_changeLimit())
         {
            get_mutations().restoreNeck(_loc1_ + "-forceRestoreNeck");
            _loc5_ = 4 + Utils.rand(5);
            if(!get_player().hasNormalNeck())
            {
               get_player().neck.modify(_loc5_);
               outputText("[pg]伴随着比上次轻微的疼痛，你的脖子又长长了几英寸，达到了" + get_player().neck.len + "英寸。");
            }
            else
            {
               get_player().neck.modify(_loc5_,1);
               outputText("[pg]在你" + (_loc3_ ? "吃完花" : "喝完烬的龙血") + "之后，你的脖子突然感到一阵剧痛。你的皮肤被拉伸，脊椎也长长了一点。你的脖子比正常人类长了几英寸，达到了" + get_player().neck.len + "英寸。");
            }
            if(get_player().hasDragonNeck() && !get_player().neck.pos)
            {
               outputText("[pg]当伸长终于停止后，你的脊椎开始重新调整它在你头部的位置，直到它固定在你的后脑勺上。之后，你想试试你新的龙颈，开始弯曲你的脖子，发现你可以像蛇弯曲尾巴一样轻松地弯曲它。你急切地想看看自己从后面看起来是什么样子，于是迅速转过头去。盯着你那宏伟的龙族背影，你惊讶得张大了嘴巴和眼睛。你打量着你的尾巴，你那完全被鳞片覆盖的背部，最后，你展开了你的翅膀。这是你第一次能看到它们身上的每一片鳞片。你从各个角度观察它们，慢慢地拍打它们，只是为了看着它们移动。");
               outputText("<b>你现在拥有了完全长成的龙颈。</b>");
               get_player().neck.pos = true;
            }
            set_changes(get_changes() + 1);
         }
         if(get_player().arms.type != 13 && get_player().hasDragonScales() && get_player().lowerBody.type == 18 && get_changes() < get_changeLimit() && Utils.rand(3) == 0)
         {
            outputText("[pg]你心不在焉地抓着你的二头肌，但无论你怎么抓，都无法消除那种瘙痒感。在忽略了它好一会儿之后，你终于烦躁地低头看去，却发现你的手臂已经变成了某种爬行动物杀手的样子，长着盾牌状的[skintone]鳞片，强壮、粗厚、弯曲的钢灰色爪子取代了你的指甲。");
            outputText("<b>你现在拥有了龙臂。</b>");
            get_player().arms.setType(13,2);
            set_changes(get_changes() + 1);
         }
         if(get_player().arms.type == 13 && get_player().hasDragonScales() && get_player().arms.claws.type != 2 && get_changes() < get_changeLimit() && Utils.rand(3) == 0)
         {
            outputText("[pg]你的[claws]发生了一些变化，变得更像龙了。");
            get_player().arms.updateClaws(2);
            outputText("<b>你现在拥有了[claws]。</b>");
            set_changes(get_changes() + 1);
         }
         if(get_player().dragonScore() >= 4 && get_changes() < get_changeLimit() && !get_player().hasPerk(PerkLib.Dragonfire))
         {
            outputText("[pg]你感觉到体内有什么东西正在觉醒……接着，一种突如其来的窒息感扼住了你的喉咙，让你跪倒在地，紧紧抓着脖子大口喘气。感觉就像有什么东西卡在了你的气管里，正抓挠着向上爬。你干呕着，咳嗽着，然后，伴随着一种近乎痛苦的释然感，你从身体深处发出一声震耳欲聋的咆哮……伴随着足以让泥块和碎石四处飞溅的原力。你带着敬畏与惊讶交织的心情，看着那个被你硬生生在地上轰出的小坑。");
            outputText("[pg]看来" + (_loc3_ ? "这朵花" : "烬的龙血") + "唤醒了你体内的某种力量……然而，你的喉咙和胸口感到非常酸痛；你怀疑在休息之前，你无法再强行发出第二次这样的冲击了。(<b>获得特质：龙火！</b>)");
            get_player().createPerk(PerkLib.Dragonfire,0,0,0,0);
            if(get_game().emberScene.emberAffection() >= 75 && !_loc3_)
            {
               outputText("[pg]烬立刻凑上前来，用又一个吻来安抚你受创的喉咙和嘴巴。");
            }
            set_changes(get_changes() + 1);
         }
         if(get_player().dragonScore() >= 4 && Utils.rand(3) == 0 && get_player().get_gender() > 0 && (_loc3_ || get_player().hasCock() && get_game().emberScene.emberHasVagina() || get_player().hasVagina() && get_game().emberScene.emberHasCock()))
         {
            outputText("[pg]一阵突如其来的情欲涌过你的");
            if(get_player().hasCock())
            {
               outputText(get_player().cockDescript(0));
               if(get_player().hasVagina())
               {
                  outputText("和");
               }
            }
            if(get_player().hasVagina())
            {
               outputText(get_player().vaginaDescript());
            }
            _loc8_ = _loc3_ ? "一只龙兽" : get_game().emberScene.emberMF("他","她");
            outputText("，让你希望" + (_loc3_ ? "能有一条龙来陪伴你" : "你能做的不仅仅是这些") + "。你现在满脑子想的都是操" + _loc8_ + "；");
            if(get_player().hasCock() && (get_game().emberScene.emberHasVagina() || _loc3_))
            {
               if(_loc3_)
               {
                  outputText("用你的精液填满子宫，让那些卵受精");
               }
               else
               {
                  outputText("用你的精液填满她的子宫，让她的卵受精");
                  if(get_player().hasVagina() && (get_game().emberScene.emberHasCock() || _loc3_))
                  {
                     outputText("，甚至同时");
                  }
               }
            }
            else if(get_player().hasVagina() && (get_game().emberScene.emberHasCock() || _loc3_))
            {
               outputText("将那根坚硬、不断喷射的肉棒吞进你自己的" + get_player().vaginaDescript(0));
            }
            outputText("……太迟了，你意识到<b>" + (_loc3_ ? "这朵花" : "烬的血") + "已经让你的龙族身体进入了");
            if(get_player().hasCock() && (get_game().emberScene.emberHasVagina() || _loc3_) && (Utils.rand(2) == 0 || !get_player().hasVagina()))
            {
               outputText("发情期");
               get_player().goIntoRut(false);
            }
            else
            {
               outputText("发情期");
               get_player().goIntoHeat(false);
            }
            outputText("</b>。");
         }
         var _loc9_:IMap = KFLAGS.flags;
         FlagDict_Impl_.arrayWriteInt(_loc9_,2077,FlagDict_Impl_.arrayReadInt(_loc9_,2077) + get_changes());
         return false;
      }
   }
}

