package classes.scenes.monsters
{
   import classes.BaseContent;
   import classes.BreastRow;
   import classes.Cock;
   import classes.DynStat;
   import classes.Monster;
   import classes.PerkLib;
   import classes.Player;
   import classes.Vagina;
   import classes.internals.Utils;
   import classes.items.ConsumableLib;
   import classes.scenes.Camp;
   import classes.scenes.Inventory;
   import classes.scenes.combat.Combat;
   import classes.scenes.combat.CombatDistance;
   import flash.Boot;
   
   public class MimicScene extends BaseContent
   {
      
      public static var APPEARANCE_ROCK:int = 0;
      
      public static var APPEARANCE_BOOB:int = 1;
      
      public static var APPEARANCE_DICK:int = 2;
      
      public static var APPEARANCE_CHEST:int = 3;
      
      public var mimicAppearance:int;
      
      public function MimicScene()
      {
         if(Boot.skip_constructor)
         {
            return;
         }
         mimicAppearance = 0;
         super();
      }
      
      public function mimicTentacleStart() : void
      {
         clearOutput();
         var _loc1_:Array = [0,1,2,3,3,3];
         var _loc2_:Array = _loc1_;
         mimicAppearance = int(_loc2_[Utils.rand(int(_loc2_.length))]);
         if(get_player().isInDesert())
         {
            outputText("狂风在两侧从沙地中突出的高耸石柱间呼啸穿过");
         }
         else if(get_player().isInMountains())
         {
            outputText("雷声在头顶轰鸣");
         }
         else
         {
            outputText("大自然宁静的声音无处不在");
         }
         outputText("随着你深入探索这片奇异的土地。当你看到");
         if(mimicAppearance == 0)
         {
            outputText("一块巨大的灰色石头，上面布满了奇异的符文和符号");
         }
         else if(mimicAppearance == 1)
         {
            outputText("只能被描述为一个巨大的、脱离躯体的……乳房");
         }
         else if(mimicAppearance == 2)
         {
            outputText("毫无疑问是一根巨大的、疲软的阴茎，还带着巨大的睾丸，");
         }
         else
         {
            outputText("一个带铰链盖和失去光泽的黄铜配件的大木箱");
         }
         outputText("依偎在一个阴凉的壁龛里。[pg]");
         if(Utils.rand(18) + get_player().get_inte() / 2 < 15)
         {
            outputText("你被眼前的景象迷住了");
            if(mimicAppearance == 0)
            {
               outputText("一块魔法石头");
            }
            else if(mimicAppearance == 1)
            {
               outputText("一个巨大的乳房");
            }
            else if(mimicAppearance == 2)
            {
               outputText("一根巨大的阴茎");
            }
            else
            {
               outputText("显然是一个宝箱的东西");
            }
            outputText("。无视了你那残存的理智，你走了过去。");
            doNext(mimicTentacle1);
         }
         else
         {
            if(mimicAppearance == 0)
            {
               outputText("虽然一块魔法石头");
            }
            else if(mimicAppearance == 1)
            {
               outputText("虽然一个巨大的乳房");
            }
            else if(mimicAppearance == 2)
            {
               outputText("虽然一根巨大的阴茎");
            }
            else
            {
               outputText("虽然显然是一个宝箱的东西");
            }
            outputText("确实值得进一步调查，但你并不完全确定这是个好主意。你决定要调查吗？");
            doYesNo(mimicTentacle1,get_camp().returnToCampUseOneHour);
         }
      }
      
      public function mimicTentacleEnd() : void
      {
         clearOutput();
         outputText("令你惊讶的是，过了一段时间你醒了过来。你不确定自己在哪里，也不确定是怎么到那里的，但你肯定很高兴自己还活着。你身上覆盖着某种黏液，你的身体似乎异常敏感。");
         if(get_player().hasVagina())
         {
            if(isSexy())
            {
               if(Utils.rand(5) > get_player().vaginas[0].vaginalWetness)
               {
                  var _temp_1:* = get_player().vaginas[0];
                  _temp_1.vaginalWetness = _temp_1.vaginalWetness + 1;
                  outputText("<b>奇怪的是，即使经历了那场折磨，你的小穴似乎比平时更湿润了。</b>");
               }
            }
            else if(Utils.rand(5) > get_player().vaginas[0].vaginalLooseness)
            {
               var _temp_2:* = get_player().vaginas[0];
               _temp_2.vaginalLooseness = _temp_2.vaginalLooseness + 1;
               outputText("<b>你的小穴因为那场折磨被痛苦地撑开了，暂时变大了。</b>");
            }
         }
         dynStats(DynStat.Inte(-2),DynStat.Sens(5),DynStat.Cor(2));
         get_combat().cleanupAfterCombat();
      }
      
      public function mimicTentacle2() : void
      {
         var _loc1_:Number = Number(Math.NaN);
         clearOutput();
         if(get_player().hasCock())
         {
            _loc1_ = Math.round((get_player().nippleLength + get_player().cocks[0].cockLength / 2) * 100) / 100;
         }
         var _loc2_:String = get_player().nippleDescript(0);
         if(!isSexy())
         {
            outputText("[pg]随着你无力再战而倒下，你无法阻止自己被拖入这怪物的血盆大口中。你被越拉越深，进入了怪物那令人惊讶的宽广内脏中，透过它下颚照进来的光线变得越来越微弱，直到伴随着最后一声<i>*咔嚓*</i>，光线被彻底切断。被无尽的黑暗包围，被成百上千根触手紧紧抓住，当你意识到自己最终的命运时，不由自主地发出了一声恐惧的呻吟。");
         }
         outputText("你感觉到数百根细小的触须开始温柔地抚摸和挑逗你的全身。它们似乎以一种不寻常的精准度寻找着你身上的每一个敏感带。没过几分钟，你就因发情而颤抖起来，");
         if(get_player().get_gender() == 0)
         {
            outputText("但你的胯下依然平滑且毫无特征。你感觉到这只生物对你无性别的状态感到愤怒，");
            if(get_player().breastRows[0].nippleCocks)
            {
               outputText("但在它做出什么鲁莽举动之前，你那" + _loc1_ + "英寸长的" + _loc2_ + "肉棒乳头痛苦地勃起，随着你狂跳的心脏一起跳动。这只生物发出赞赏的咕噜声，显然很高兴你能提供些什么。");
               if(isSexy())
               {
                  outputText("触手将你的躯干移向这怪物长满牙齿的大嘴，伴随着不断加剧的恐惧，你意识到它打算把你所有跳动着的肉棒乳头都吸进它那噩梦般的嘴里！随着你尖叫的回音最终消散，你发现你的乳房依然完好无损，而且那些看起来很可怕的牙齿实际上相当柔软。然而，当你试图把它们拔出来时，牙齿痛苦地刺入你的乳房，让你立刻明白了它们的用途。");
               }
               else
               {
                  outputText("你感觉到某种触手收集了");
                  if(get_player().totalBreasts() * get_player().breastRows[0].nipplesPerBreast == 2)
                  {
                     outputText("你两只" + _loc2_ + "肉棒乳头，并将它们吞没在某种孔洞中。");
                  }
                  else
                  {
                     outputText("你所有的" + int(get_player().totalBreasts() * get_player().breastRows[0].nipplesPerBreast) + "只" + _loc2_ + "肉棒乳头，将它们聚成一大束，并一口气吞没在一个巨大的孔洞中。");
                  }
               }
               outputText("[pg]这");
               if(isSexy())
               {
                  outputText("怪物的嘴巴开始");
               }
               else
               {
                  outputText("口部触手开始");
               }
               outputText("以一种旋转的方式吸吮并按摩你的阴茎乳头。这种感觉与无数其他触手带来的刺激交织在一起，很快就让你达到了高潮，喷出了异常大量的");
               if(get_player().breastRows[0].lactationMultiplier > 0)
               {
                  outputText("乳白色的");
               }
               outputText("精液，深深地射入这只生物饥渴的口中。不幸的是，这只野兽似乎并不满足于仅仅一次的喷发，它的动作变得更加粗暴，迫使你一次又一次地高潮。远远超出了你的忍耐极限，你仍然勉强保持着最后一丝意识。即使几十根小触手强行插入你饱受折磨的乳头阴茎中寻找更多的精液，你唯一的反应也只是一声微弱的呻吟。当这东西继续在你的身体上搜寻最后一丝精液，并试图诱导你进一步高潮时，你最终陷入了昏迷。");
               if(isSexy())
               {
                  outputText("[pg]就在你失去意识之前，你抬头看到自己被举向野兽突然张开的血盆大口。");
               }
            }
            if(get_player().hasFuckableNipples())
            {
               outputText("但在它做出什么鲁莽的举动之前，");
               if(get_player().vaginas[0].vaginalLooseness < 2)
               {
                  outputText("小孔");
               }
               if(get_player().vaginas[0].vaginalLooseness >= 2 && get_player().vaginas[0].vaginalLooseness < 4)
               {
                  outputText("褶皱的开口");
               }
               if(get_player().vaginas[0].vaginalLooseness >= 4)
               {
                  outputText("充血的唇瓣");
               }
               outputText("在你的乳头上缓缓张开，开始");
               if(get_player().vaginas[0].vaginalWetness < 2)
               {
                  outputText("滴下");
               }
               if(get_player().vaginas[0].vaginalWetness >= 2 && get_player().vaginas[0].vaginalWetness < 4)
               {
                  outputText("流出");
               }
               if(get_player().vaginas[0].vaginalWetness >= 4)
               {
                  outputText("喷出");
               }
               if(get_player().breastRows[0].lactationMultiplier > 0)
               {
                  outputText("乳白色的");
               }
               outputText("液体。怪物发出一声惊讶但满意的咕噜声，开始用它的");
               if(isSexy())
               {
                  outputText("长长的、像鞭子一样的舌头");
               }
               else
               {
                  outputText("巨大的舌头");
               }
               outputText("来吸食这份新的恩赐。");
               outputText("[pg]你的大脑一阵眩晕，因为");
               if(isSexy())
               {
                  outputText("似乎数不清的舌头和触手在吸吮、抚摸和舔舐你的乳房。");
               }
               else
               {
                  outputText("怪物巨大的舌头覆盖了你整个身体的正面，将其凹凸不平、湿滑的表面在你的");
                  if(get_player().totalBreasts() > 2)
                  {
                     outputText(get_player().totalBreasts() + "");
                  }
                  outputText("个乳房，进行着长长的抚摸。");
               }
               outputText("你一次又一次地高潮，远远超出了你忍耐的极限。然而你仍然保留着最后一丝意识。怪物的动作变得更加粗暴，但你已经神志不清，无暇顾及了。甚至当怪物将");
               if(isSexy())
               {
                  outputText("足足有两打蠕动的舌头深深插入你每个饱受折磨的乳头，探索着每一个角落和缝隙时");
               }
               else
               {
                  outputText("它巨大的舌头挨个深深插入你饱受折磨的乳头时");
               }
               outputText("，你的反应只是一声微弱的呻吟。");
               outputText("随着那东西继续交替着在你身上搜刮最后的一丝花蜜，并试图诱导你进一步高潮，你最终失去了意识。");
               if(isSexy())
               {
                  outputText("[pg]就在你失去意识之前，你抬头看到自己被举向野兽突然张开的血盆大口。");
               }
            }
            if(!get_player().breastRows[0].nippleCocks && !get_player().hasFuckableNipples())
            {
               if(isSexy())
               {
                  outputText("它的眼睛眯了起来，露出一种异常愤怒的表情。");
               }
               else
               {
                  outputText("抓住你的触手似乎也因明显的愤怒而颤抖。");
               }
               outputText("[pg]毫无预兆地，数百根触手开始猛烈地抽打你。你试图尖叫，但你的喊叫声被腹部遭受的一连串惩罚性重击打断了。当你被揍得失去知觉时，你的耳朵里充满了怪物愤怒的咕噜咆哮声。");
               if(isSexy())
               {
                  outputText("[pg]就在你失去意识之前，你抬头看到自己被举向野兽突然张开的血盆大口。");
               }
            }
         }
         if(get_player().get_gender() == 1)
         {
            outputText("而且你的");
            if(get_player().cockTotal() == 1)
            {
               outputText(get_player().cockDescript() + "变得");
            }
            else
            {
               outputText(get_player().multiCockDescript() + "变得");
            }
            outputText("坚硬如石。");
            if(isSexy())
            {
               outputText("触手将你的胯部移向那东西长满牙齿的嘴，伴随着越来越强烈的恐惧，你意识到它打算吸吮你跳动的肉棒");
               if(get_player().cockTotal() > 1)
               {
                  outputText("");
               }
               outputText("，把它吸进那噩梦般的嘴里！当你尖叫的回声终于消失时，你意识到你的命根子完好无损，而且那些看起来很可怕的牙齿实际上相当柔软。然而，当它们痛苦地刺入你的肉棒时，你立刻明白了它们的用途");
               if(get_player().cockTotal() == 1)
               {
                  outputText("——就在你试图把它拔出来的时候。");
               }
               else
               {
                  outputText("当你试图把它们拔出来时。");
               }
            }
            else
            {
               outputText("你感觉到某种孔洞包裹住了");
               if(get_player().cockTotal() == 1)
               {
                  outputText("你的" + get_player().cockDescript() + "。");
               }
               else
               {
                  outputText("你所有的肉棒。");
               }
            }
            if(get_player().breastRows[0].nippleCocks)
            {
               outputText("[pg]与此同时，细小的触须继续刺激着你身体的其余部分，导致你" + _loc2_ + "" + _loc1_ + "英寸的肉棒乳头痛苦地勃起，随着你狂跳的心脏悸动。这生物发出一声烦躁的咕噜声");
               if(isSexy())
               {
                  outputText("，你看到它的眼睛因愤怒而眯起");
               }
               outputText("。它似乎对你竟敢在如此不方便的地方长出更多的肉棒感到恼火！你的冒犯很快得到了处理，你那不听话的肉棒乳头被匆忙长出的吸盘触手吞没了。");
            }
            outputText("[pg]这");
            if(isSexy())
            {
               if(get_player().breastRows[0].nippleCocks)
               {
                  outputText("怪物的嘴巴开始");
               }
               else
               {
                  outputText("怪物的嘴巴开始");
               }
            }
            else if(get_player().breastRows[0].nippleCocks)
            {
               outputText("口部触手开始");
            }
            else
            {
               outputText("口部触手开始");
            }
            outputText("吸吮并按摩你的肉棒");
            if(get_player().cockTotal() > 1 || get_player().breastRows[0].nippleCocks)
            {
               outputText("");
            }
            outputText("，带着一种旋转的动作。这和无数其他触须带来的混合快感很快让你达到了高潮，导致你喷出异常大量的精液，深深地射入这生物饥渴的嘴里");
            if(get_player().breastRows[0].nippleCocks)
            {
               outputText("");
            }
            outputText("。不幸的是，这野兽似乎对仅仅一次发射并不满足，它的动作变得更加粗暴，迫使你一次又一次地高潮。远远超出了你忍耐的极限，你仍然勉强保持着最后一丝意识。即使几十根小触须被强行塞进你的尿道");
            if(get_player().cockTotal() > 1 || get_player().breastRows[0].nippleCocks)
            {
               outputText("");
            }
            outputText("寻找更多的精液，你唯一的反应也只是一声微弱的呻吟。随着这东西继续交替着在你身上搜刮最后一点精液的痕迹，并试图诱导你进一步高潮，你最终陷入了昏迷。");
            if(isSexy())
            {
               outputText("[pg]就在你失去意识之前，你抬头看到自己被举向野兽突然张开的血盆大口。");
            }
         }
         if(get_player().get_gender() == 2)
         {
            outputText("和你的[vagina]");
            if(int(get_player().vaginas.length) > 1)
            {
               outputText("是");
            }
            else
            {
               outputText("是");
            }
            if(get_player().vaginas[0].vaginalWetness < 2)
            {
               outputText("滴下");
            }
            if(get_player().vaginas[0].vaginalWetness >= 2 && get_player().vaginas[0].vaginalWetness < 4)
            {
               outputText("流出");
            }
            if(get_player().vaginas[0].vaginalWetness >= 4)
            {
               outputText("喷出");
            }
            outputText("汁液，弄得到处都是。那东西的");
            if(isSexy())
            {
               outputText("细长如鞭的舌头舔过");
            }
            else
            {
               outputText("巨大的舌头舔过");
            }
            outputText("你的[vagina]");
            if(int(get_player().vaginas.length) > 1)
            {
               outputText("");
            }
            outputText("，你听到这生物发出满意的咕噜声。它显然很喜欢这个味道。");
            if(get_player().hasFuckableNipples())
            {
               outputText("[pg]与此同时，细小的触须继续刺激着你身体的其他部位，让你乳头上的");
               if(get_player().vaginas[0].vaginalLooseness < 2)
               {
                  outputText("小孔");
               }
               if(get_player().vaginas[0].vaginalLooseness >= 2 && get_player().vaginas[0].vaginalLooseness < 4)
               {
                  outputText("褶皱的开口");
               }
               if(get_player().vaginas[0].vaginalLooseness >= 4)
               {
                  outputText("充血的唇瓣");
               }
               outputText("在你的乳头上缓缓张开，开始");
               if(get_player().vaginas[0].vaginalWetness < 2)
               {
                  outputText("滴下");
               }
               if(get_player().vaginas[0].vaginalWetness >= 2 && get_player().vaginas[0].vaginalWetness < 4)
               {
                  outputText("流出");
               }
               if(get_player().vaginas[0].vaginalWetness >= 4)
               {
                  outputText("喷出");
               }
               if(get_player().averageLactation() > 0)
               {
                  outputText("乳白色的");
               }
               outputText("液体。怪物发出一声惊讶但满意的咕噜声，开始用它的");
               if(isSexy())
               {
                  outputText("新长出的一簇舌头");
               }
               else
               {
                  outputText("似乎<i>更大</i>的舌头");
               }
               outputText("来吸吮这份新的恩赐。");
            }
            outputText("[pg]你的大脑一阵眩晕，因为");
            if(isSexy())
            {
               outputText("似乎数不清的舌头和触须在吸吮、抚摸和舔舐你的[vagina]");
               if(int(get_player().vaginas.length) > 1)
               {
                  outputText("");
               }
               outputText("和");
               if(get_player().totalBreasts() > 2)
               {
                  outputText(get_player().totalBreasts() + "");
               }
               outputText("个乳房。");
            }
            else
            {
               outputText("怪物巨大的舌头覆盖了你的胯部和整个身体的正面，拖着它那凹凸不平、光滑的表面滑过");
               if(int(get_player().vaginas.length) == 1)
               {
                  outputText("你的[vagina]");
               }
               else
               {
                  outputText("你所有的[vagina]");
               }
               outputText("和");
               if(get_player().totalBreasts() > 2)
               {
                  outputText(get_player().totalBreasts() + "");
               }
               outputText("个乳房，进行着长长的抚摸。");
            }
            outputText("你一次又一次地高潮，远远超出了你忍耐的极限。然而你仍然保留着最后一丝意识。怪物的动作变得更加粗暴，但你已经神志不清，无暇顾及了。甚至当怪物将");
            if(isSexy())
            {
               outputText("足足两打蠕动的舌头深深插入");
               if(int(get_player().vaginas.length) == 1)
               {
                  outputText("你的[vagina]");
               }
               else
               {
                  outputText("你的每一个[vagina]");
               }
               outputText("，探索每一个角落和缝隙");
            }
            else
            {
               outputText("它巨大的舌头深深地探入");
               if(int(get_player().vaginas.length) == 1)
               {
                  outputText("你的[vagina]");
               }
               else
               {
                  outputText("你的每一个[vagina]，一个接一个地");
               }
            }
            outputText("，你的反应只是一声微弱的呻吟。");
            if(get_player().hasFuckableNipples())
            {
               outputText("当你的乳头受到同样的对待时，你的呻吟声稍微拉长了一些。");
            }
            outputText("随着那东西继续交替着在你身上搜刮最后的一丝花蜜，并试图诱导你进一步高潮，你最终失去了意识。");
            if(isSexy())
            {
               outputText("[pg]就在你失去意识之前，你抬头看到自己被举向野兽突然张开的血盆大口。");
            }
         }
         if(get_player().get_gender() == 3)
         {
            outputText("你的[vagina]");
            if(int(get_player().vaginas.length) > 1)
            {
               outputText("");
            }
            if(get_player().vaginas[0].vaginalWetness < 2)
            {
               outputText("滴着");
            }
            if(get_player().vaginas[0].vaginalWetness >= 2 && get_player().vaginas[0].vaginalWetness < 4)
            {
               outputText("流着");
            }
            if(get_player().vaginas[0].vaginalWetness >= 4)
            {
               outputText("喷着");
            }
            outputText("淫液，弄得四处都是，同时你的");
            if(get_player().cockTotal() == 1)
            {
               outputText(get_player().cockDescript() + "迅速变得");
            }
            else
            {
               outputText(get_player().multiCockDescript() + "迅速变得");
            }
            outputText("坚硬如石。你的双眼翻白，因为那东西的");
            if(isSexy())
            {
               outputText("细长如鞭的舌头舔过");
            }
            else
            {
               outputText("巨大的舌头舔过");
            }
            outputText("你的[vagina]");
            if(int(get_player().vaginas.length) > 1)
            {
               outputText("");
            }
            outputText("。");
            outputText("你感觉到某种孔洞包裹住了");
            if(get_player().cockTotal() == 1)
            {
               outputText("你的" + get_player().cockDescript() + "。");
            }
            else
            {
               outputText("你所有的肉棒。");
            }
            if(get_player().breastRows[0].nippleCocks || get_player().hasFuckableNipples())
            {
               outputText("[pg]与此同时，细小的触须继续刺激着你身体的其余部分，导致");
            }
            if(get_player().hasFuckableNipples())
            {
               if(get_player().vaginas[0].vaginalLooseness < 2)
               {
                  outputText("小小的开口");
               }
               if(get_player().vaginas[0].vaginalLooseness >= 2 && get_player().vaginas[0].vaginalLooseness < 4)
               {
                  outputText("起皱的开口");
               }
               if(get_player().vaginas[0].vaginalLooseness >= 4)
               {
                  outputText("充血的阴唇");
               }
               outputText("在你的乳头上缓缓张开，开始");
               if(get_player().vaginas[0].vaginalWetness < 2)
               {
                  outputText("滴下");
               }
               if(get_player().vaginas[0].vaginalWetness >= 2 && get_player().vaginas[0].vaginalWetness < 4)
               {
                  outputText("流出");
               }
               if(get_player().vaginas[0].vaginalWetness >= 4)
               {
                  outputText("喷出");
               }
               if(get_player().breastRows[0].lactationMultiplier > 0)
               {
                  outputText("乳白色的");
               }
               outputText("液体。怪物发出一声惊讶但满意的咕噜声，开始用它的");
               if(isSexy())
               {
                  outputText("新长出的一簇舌头");
               }
               else
               {
                  outputText("似乎<i>更大</i>的舌头");
               }
               outputText("来吸吮这份新的恩赐。");
            }
            if(get_player().breastRows[0].nippleCocks)
            {
               outputText("你的" + _loc2_ + "" + _loc1_ + "英寸的肉棒乳头痛苦地勃起，随着你狂跳的心脏悸动。怪物发出一声恼怒的咕噜声");
               if(isSexy())
               {
                  outputText("，你看到它的眼睛因愤怒而眯起");
               }
               outputText("。它似乎对你竟敢在如此不方便的地方长出更多的肉棒感到恼火！你的冒犯很快得到了处理，你那不听话的肉棒乳头被匆忙长出的吸盘触手吞没了。");
            }
            outputText("[pg]你的大脑一阵眩晕，因为");
            if(isSexy())
            {
               outputText("似乎数不清的舌头和触须在吸吮、抚摸和舔舐你的[vagina]");
               if(int(get_player().vaginas.length) > 1)
               {
                  outputText("");
               }
               outputText("和");
               if(get_player().totalBreasts() > 2)
               {
                  outputText(get_player().totalBreasts() + "");
               }
               outputText("乳房，而");
               if(get_player().breastRows[0].nippleCocks)
               {
                  outputText("怪物的嘴巴开始");
               }
               else
               {
                  outputText("怪物的嘴巴开始");
               }
            }
            else
            {
               outputText("怪物巨大的舌头滑过你的胯部，绕过你的");
               if(get_player().cockTotal() == 1 && !get_player().hasSheath())
               {
                  outputText("肉棒，");
               }
               else if(!get_player().hasSheath())
               {
                  outputText("那堆肉棒，");
               }
               else
               {
                  outputText("包皮，");
               }
               outputText("并顺着你身体的整个正面向上，将其布满凸起、湿滑的表面滑过");
               if(int(get_player().vaginas.length) == 1)
               {
                  outputText("你的[vagina]");
               }
               else
               {
                  outputText("你所有的[vagina]");
               }
               outputText("和");
               if(get_player().totalBreasts() > 2)
               {
                  outputText(get_player().totalBreasts() + "");
               }
               outputText("乳房，长长地抚摸着，而");
               if(get_player().breastRows[0].nippleCocks)
               {
                  outputText("口部触手开始");
               }
               else
               {
                  outputText("口部触手开始");
               }
            }
            outputText("吸吮并按摩你的肉棒");
            if(get_player().cockTotal() > 1 || get_player().breastRows[0].nippleCocks)
            {
               outputText("");
            }
            outputText("，并带有某种旋转的动作。");
            outputText("你一次又一次地高潮，远远超出了你忍耐的极限。然而你仍然保留着最后一丝意识。怪物的动作变得更加粗暴，但你已经神志不清，无暇顾及了。甚至当怪物将");
            if(isSexy())
            {
               outputText("足足两打蠕动的舌头深深插入");
               if(int(get_player().vaginas.length) == 1)
               {
                  outputText("你的[vagina]");
               }
               else
               {
                  outputText("你的每一个[vagina]");
               }
               outputText("，探索着每一个角落和缝隙，");
            }
            else
            {
               outputText("它巨大的舌头深深地探入");
               if(int(get_player().vaginas.length) == 1)
               {
                  outputText("你的[vagina]");
               }
               else
               {
                  outputText("你的每一个[vagina]，一个接一个地");
               }
            }
            outputText("同时，几十根细小的触手被强行塞进你的尿道");
            if(get_player().cockTotal() > 1 || get_player().breastRows[0].nippleCocks)
            {
               outputText("");
            }
            outputText("寻找更多的精液，你的反应只是一声微弱的呻吟。");
            if(get_player().hasVagina())
            {
               get_player().cuntChange(60,true);
            }
            if(get_player().hasFuckableNipples())
            {
               outputText("当你的乳头受到同样的对待时，你的呻吟声稍微拉长了一些。");
            }
            outputText("当这东西继续交替着搜刮你身上最后一点体液，并试图诱导你进一步高潮时，你最终陷入了昏迷。");
            if(isSexy())
            {
               outputText("[pg]就在你失去意识之前，你抬头看到自己被举向野兽突然张开的血盆大口。");
            }
         }
         get_player().orgasm("Generic");
         doNext(mimicTentacleEnd);
      }
      
      public function mimicTentacle1() : void
      {
         var _loc1_:int = 0;
         clearOutput();
         outputText("你靠近到距离");
         if(mimicAppearance == 0)
         {
            outputText("石头");
         }
         else if(mimicAppearance == 1)
         {
            outputText("巨大的乳房");
         }
         else if(mimicAppearance == 2)
         {
            outputText("巨大的阴茎");
         }
         else
         {
            outputText("箱子");
         }
         if(Utils.rand(100) + Math.floor(get_player().get_inte() / 1.5) >= 80)
         {
            if(Utils.rand(get_player().get_inte()) + Math.floor(get_player().get_inte() / 3) >= 50 + get_player().newGamePlusMod() * 10)
            {
               outputText("几英尺的地方，并开始向它伸出手。然而，就在你刚要动手时，这……东西奇怪地颤抖了一下，发出一种古怪的哼哧声。你立刻意识到，这不仅是某种生物，而且你不知怎么地在它睡觉时碰上了它！当你开始慢慢后退时，你注意到壁龛一侧的垃圾堆里有一个");
               _loc1_ = Utils.rand(4);
               if(_loc1_ == 0)
               {
                  outputText("闪闪发光的银色小瓶");
               }
               if(_loc1_ == 1)
               {
                  outputText("小袋子");
               }
               if(_loc1_ == 2)
               {
                  outputText("大玻璃瓶");
               }
               if(_loc1_ == 3)
               {
                  outputText("小陶罐");
               }
               outputText("。你小心翼翼地不去打扰这个……不管它是什么东西，抓起");
               if(_loc1_ == 0)
               {
                  outputText("小瓶");
               }
               if(_loc1_ == 1)
               {
                  outputText("袋子");
               }
               if(_loc1_ == 2)
               {
                  outputText("瓶子");
               }
               if(_loc1_ == 3)
               {
                  outputText("罐子");
               }
               outputText("然后离开，让怪物继续沉睡。");
               if(_loc1_ == 0)
               {
                  get_inventory().takeItem(get_consumables().PPHILTR,get_camp().returnToCampUseOneHour);
               }
               if(_loc1_ == 1)
               {
                  findSomeGems();
               }
               if(_loc1_ == 2)
               {
                  get_inventory().takeItem(get_consumables().NUMBOIL,get_camp().returnToCampUseOneHour);
               }
               if(_loc1_ == 3)
               {
                  get_inventory().takeItem(get_consumables().HUMMUS_,get_camp().returnToCampUseOneHour);
               }
               return;
            }
            outputText("并慢慢地伸出一只手向它探去。当你的手指悬停在离它几英寸远的地方时，你突然感到一种危险的预感，就在几十根触手从那东西表面长出来的时候，你向后跳开了。这个奇怪的生物再次向你扑来，但你已经逃出了它的攻击范围，让你松了一口气的是，它似乎无法移动。你想和这个生物战斗吗？你可以尝试在安全距离外攻击，但如果你试图靠近进行近战攻击，它将获得先手。");
            menu();
            addButton(0,"战斗",fight);
            setExitButton();
            return;
         }
         outputText("并慢慢伸出一只手去触摸它。当你意识到你的手被牢牢粘在");
         if(mimicAppearance == 0)
         {
            outputText("石头表面！");
         }
         else if(mimicAppearance == 1)
         {
            outputText("巨大的乳房皮肤上！");
         }
         else if(mimicAppearance == 2)
         {
            outputText("巨大的肉棒皮肤上！");
         }
         else
         {
            outputText("箱子表面！");
         }
         outputText("当你挣扎着想把手抽出来时，这个怪物——很明显它就是个怪物——睁开了它那双小眼睛，饥渴地盯着你。");
         outputText("[pg]");
         if(mimicAppearance == 0)
         {
            outputText("一张巨大的嘴在你面前张开，里面长满了巨大的岩石般的牙齿。几十根触手从它那张开的大嘴里射出，当你被拖进它那岩石般的食道时，你恐惧地尖叫起来。");
         }
         else if(mimicAppearance == 1)
         {
            outputText("巨大的乳头张开，露出一个像七鳃鳗一样的嘴，里面长满了数百颗尖锐的小牙齿，细长如鞭的舌头射出，在来回挥舞时将乳白色的唾液溅得到处都是。几十根触手从它颤抖的躯体上长出，缠绕在你的四肢和腰部，将你举到半空中。");
         }
         else if(mimicAppearance == 2)
         {
            outputText("那根巨大的肉棒像蛇一样立起，发出可怕的嘶嘶声，原本应该是尿道口的地方裂开，露出一排排尖锐的小牙齿。细长如鞭的舌头射出，在来回挥舞时将黏糊糊的精液唾沫溅得到处都是。几十根触手从它的柱体上长出，缠绕在你的四肢和腰部，将你举到半空中。");
         }
         else
         {
            outputText("箱子的盖子打开，露出了一张巨大的嘴，里面长满了数百颗尖锐的小牙齿，还有一条巨大的、流着口水的舌头在疯狂地甩动。几十根触手从它那张开的大嘴里射出，当你被拖进它的食道时，你恐惧地尖叫起来。");
         }
         outputText("[pg]你挣扎着摆脱了触手。战斗开始了！");
         startCombat(new Mimic(mimicAppearance));
      }
      
      public function killTheMimic() : void
      {
         clearOutput();
         outputText("怪物倒下了，被打得太惨，甚至无法伤害你。在离开之前，你搜查了怪物身上的东西。");
         get_combat().cleanupAfterCombat();
      }
      
      public function isSexy() : Boolean
      {
         switch(mimicAppearance)
         {
            case 0:
               return false;
            case 1:
               return true;
            case 2:
               return true;
            case 3:
               return false;
            default:
               return false;
         }
      }
      
      public function findSomeGems() : void
      {
         var _loc1_:int = int((Utils.rand(30) + 10 + get_player().level) * (1 + get_player().perkv1(PerkLib.AscensionFortune) * 0.1));
         var _loc2_:Player = get_player();
         _loc2_.set_gems(_loc2_.get_gems() + _loc1_);
         outputText("打开小袋子，你发现里面有 " + _loc1_ + " 颗宝石！");
         doNext(get_camp().returnToCampUseOneHour);
      }
      
      public function fight() : void
      {
         get_monster().distance = CombatDistance.Distant;
         startCombatImmediate(new Mimic(mimicAppearance));
      }
   }
}

