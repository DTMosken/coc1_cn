package classes.items.consumables
{
   import classes.Appearance;
   import classes.BreastRow;
   import classes.CoC;
   import classes.Cock;
   import classes.CockTypesEnum;
   import classes.DynStat;
   import classes.PerkLib;
   import classes.Player;
   import classes.StatusEffects;
   import classes._FlagDict.FlagDict_Impl_;
   import classes.bodyParts.Hips;
   import classes.globalFlags.KFLAGS;
   import classes.internals.Utils;
   import classes.internals._OneOf.OneOf_Impl_;
   import classes.items.Consumable;
   import classes.items.Mutations;
   import classes.lists.ColorLists;
   import flash.Boot;
   import haxe.IMap;
   import haxe.ds.Either;
   
   public class FoxBerry extends Consumable
   {
      
      public static var STANDARD:int = 0;
      
      public static var ENHANCED:int = 1;
      
      public var enhanced:Boolean;
      
      public function FoxBerry(param1:int = 0)
      {
         if(Boot.skip_constructor)
         {
            return;
         }
         enhanced = false;
         var _loc2_:String = null;
         var _loc3_:String = null;
         var _loc4_:String = null;
         var _loc5_:String = null;
         var _loc6_:int = 0;
         enhanced = param1 == 1;
         switch(param1)
         {
            case 0:
               _loc2_ = "FoxBery";
               _loc3_ = "Fox Berry";
               _loc4_ = "a fox berry";
               _loc5_ = "这颗巨大的橙色浆果拿在手里沉甸甸的。它可能因为鲜艳的橙色而得名。你确信它绝非普通的水果。";
               _loc6_ = 6;
               break;
            case 1:
               _loc2_ = "VixVigr";
               _loc3_ = "Vixen\'s Vigor";
               _loc4_ = "a bottle labeled \"Vixen\'s Vigor\"";
               _loc5_ = "一个小药瓶，里面装着雌狐活力药水，据说是由普通的狐狸浆果蒸馏而成的。它的药效似乎要强得多，因为一个小标签警告说，潜在的副作用是长出额外的乳房。";
               _loc6_ = 30;
         }
         super(_loc2_,_loc3_,_loc4_,_loc6_,_loc5_);
      }
      
      override public function useItem() : Boolean
      {
         var _loc2_:int = 0;
         var _loc6_:* = null as Array;
         var _loc7_:* = null as String;
         var _loc8_:* = null as Hips;
         var _loc9_:* = null as Hips;
         var _loc10_:int = 0;
         var _loc11_:* = null as Player;
         var _loc12_:* = null as Array;
         var _loc13_:int = 0;
         var _loc14_:* = null as Array;
         var _loc15_:int = 0;
         var _loc16_:* = null as Array;
         var _loc17_:int = 0;
         var _loc18_:* = null as Array;
         var _loc19_:int = 0;
         var _loc20_:* = null as Array;
         var _loc21_:int = 0;
         var _loc23_:Number = NaN;
         var _loc1_:String = "foxTF";
         var _loc3_:int = enhanced ? 3 : 1;
         get_mutations().initTransformation([2,2],_loc3_);
         if(!enhanced)
         {
            outputText("你稍微检查了一下这颗浆果，在手里把玩了一会儿这个橙红色的果实，然后决定大快朵颐。它酸甜可口，味道似乎在你的舌尖上迸发出来，非常浓郁。当你吃完这顿美味的零食时，汁水从你的嘴角流了下来。");
         }
         else
         {
            outputText("你拔下强化版\"雌狐活力药水\"的瓶盖，决定喝上一大口。也许它会让你变得像露米在正面画的那只简笔画狐狸一样狡猾？");
         }
         var _loc4_:int = 0;
         if(get_player().face.type == 11 && get_player().tail.type == 13 && get_player().ears.type == 9 && get_player().lowerBody.type == 17 && get_player().hasFur() && Utils.rand(3) == 0 && !get_player().isTFResistant())
         {
            if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,477) != 0)
            {
               outputText("[pg]你狼吞虎咽地吃下了");
               if(enhanced)
               {
                  outputText("液体");
               }
               else
               {
                  outputText("浆果");
               }
               outputText("，食欲异常旺盛，特别享受那多汁、酸涩的味道。当你小心翼翼地吸吮手指上最后一滴赭色汁液时，你注意到它的味道比你记忆中的要鲜美得多。你的思绪被骨头断裂的声音猛烈地打断，你痛苦地大叫，弯下腰，肋骨间仿佛有火焰在沸腾。");
               outputText("[pg]你在地上痛苦地扭动，手紧紧捂住胸口，透过满是泪水的眼睛惊恐地看着手指的骨头发出爆裂声并融合在一起，重新排列成一只覆盖着粗糙黑色皮毛的娇小爪子，向上逐渐变成红橙色。你拼命地想向某人——任何人——呼救，但发出的却只是一声尖锐刺耳的吠叫。");
               if(get_player().tail.venom > 1)
               {
                  outputText("你的尾巴剧烈地甩动着，开始痛苦地融合回一条，皮毛也随之蓬松地竖起。");
               }
               outputText("[pg]一阵剧痛闪过你的脊柱，骨骼开始移位，臀部的关节向前移动。你继续痛苦地嚎叫，甚至感觉到你的智力正在流失。在某种程度上，这是一种解脱——随着你的思绪变得浑浊，痛苦也随之减轻，直到你最终茫然地盯着天空，好奇地歪着头。");
               outputText("[pg]你翻了个身，从覆盖着你的[armor]中爬了出来，用爪子刨了一会儿地，随后一阵饥饿感在你的胃里翻腾。你嗅了嗅风中的气味，向荒野中跃去，顺着农场特有的气味，奔向那必定满载而归的鸡舍。");
               get_game().gameOver();
               return false;
            }
            outputText("[pg]你感到一阵剧烈的头痛，并产生了一种想要洗劫鸡舍的冲动。谢天谢地，这两种感觉几秒钟后就消失了，但<b>也许你应该少用点狐狸相关的物品了……</b>");
            FlagDict_Impl_.arrayWriteInt(KFLAGS.flags,477,1);
         }
         if(get_changes() < get_changeLimit() && Utils.rand(3) == 0 && (get_player().get_lib100() < 80 || get_player().get_inte100() < 80 || get_player().get_sens100() < 80))
         {
            outputText("[pg]你闭上眼睛，恶作剧般地暗自窃笑，因为你突然想到了几个可以在对手身上尝试的新把戏；你觉得自己变得更加狡猾了。脑海中浮现出他们在你的聪明才智面前无助的画面，让你不禁微微颤抖，你不由自主地感到一阵兴奋，皮肤微微发麻，舔了舔嘴唇，抚摸着自己。");
            if(get_player().get_inte100() < 80)
            {
               dynStats(DynStat.Inte(4));
            }
            if(get_player().get_lib100() < 80)
            {
               dynStats(DynStat.Lib(1));
            }
            if(get_player().get_sens100() < 80)
            {
               dynStats(DynStat.Sens(1));
            }
            dynStats(DynStat.Lust(10));
         }
         if(get_changes() < get_changeLimit() && Utils.rand(3) == 0 && get_player().get_str100() > 40)
         {
            outputText("[pg]你能感觉到你的肌肉在慢慢放松时变得柔软，比以前稍微虚弱了一些。当你能用诡计和恶作剧智取敌人时，谁还需要体力呢？你微微歪着头，纳闷这个想法是从哪里来的。");
            dynStats(DynStat.Str(-1));
            if(get_player().get_str100() > 60)
            {
               dynStats(DynStat.Str(-1));
            }
            if(get_player().get_str100() > 80)
            {
               dynStats(DynStat.Str(-1));
            }
            if(get_player().get_str100() > 90)
            {
               dynStats(DynStat.Str(-1));
            }
         }
         if(get_changes() < get_changeLimit() && Utils.rand(3) == 0 && get_player().get_tou100() > 30)
         {
            if(get_player().get_tou100() < 60)
            {
               outputText("[pg]你感觉你的皮肤变得明显更柔软了。在手臂上轻轻捏了一下证实了这一点——你柔软的皮肤无法为你提供太多保护。");
            }
            else
            {
               outputText("[pg]你感觉你的皮肤明显变软了。你在手臂上轻轻捏了一下，证实了这一点——你的皮肤不再像以前那么坚韧了。");
            }
            dynStats(DynStat.Tou(-1));
            if(get_player().get_tou100() > 60)
            {
               dynStats(DynStat.Tou(-1));
            }
            if(get_player().get_tou100() > 80)
            {
               dynStats(DynStat.Tou(-1));
            }
            if(get_player().get_tou100() > 90)
            {
               dynStats(DynStat.Tou(-1));
            }
         }
         var _loc5_:Array = ["金发","红橙色","银色","白色","红色","黑色"];
         if(!_loc5_.contains(get_player().hair.color) && !Boolean(ColorLists.BASIC_KITSUNE_HAIR.contains(get_player().hair.color)) && !Boolean(ColorLists.ELDER_KITSUNE.contains(get_player().hair.color)) && get_changes() < get_changeLimit() && Utils.rand(4) == 0)
         {
            if(get_player().tail.type == 13 && get_player().tail.venom > 1)
            {
               if(get_player().tail.venom < 9)
               {
                  _loc6_ = ColorLists.BASIC_KITSUNE_HAIR;
                  _loc7_ = _loc6_[Utils.rand(int(_loc6_.length))];
                  get_player().hair.color = _loc7_;
               }
               else
               {
                  _loc6_ = ColorLists.ELDER_KITSUNE;
                  _loc7_ = _loc6_[Utils.rand(int(_loc6_.length))];
                  get_player().hair.color = _loc7_;
               }
            }
            else
            {
               _loc6_ = _loc5_;
               _loc7_ = _loc6_[Utils.rand(int(_loc6_.length))];
               get_player().hair.color = _loc7_;
            }
            outputText("[pg]你的头皮开始发麻，你轻轻抓起一缕头发，拔出来查看。你的头发变成了[haircolor]！");
         }
         if(get_changes() < get_changeLimit() && Utils.rand(3) == 0 && get_player().hips.rating != 10)
         {
            if(get_player().hips.rating < 10)
            {
               outputText("[pg]你踉跄了一下，骨盆里的骨头痛苦地重新排列。你的腰围变宽了，变成了[hips]！");
               var _temp_1:* = get_player().hips;
               _temp_1.rating = _temp_1.rating + 1;
               if(get_player().hips.rating < 7)
               {
                  var _temp_2:* = get_player().hips;
                  _temp_2.rating = _temp_2.rating + 1;
               }
            }
            else
            {
               outputText("[pg]你踉跄了一下，骨盆里的骨头痛苦地重新排列。你的腰围变窄了，变成了[hips]。");
               _loc8_ = get_player().hips;
               --_loc8_.rating;
               if(get_player().hips.rating > 15)
               {
                  _loc9_ = get_player().hips;
                  --_loc9_.rating;
               }
            }
            set_changes(get_changes() + 1);
         }
         if(get_changes() < get_changeLimit() && get_player().hair.type == 4 && Utils.rand(3) == 0)
         {
            outputText("[pg]宝石那诡异的火焰顺着你的身体向上蔓延到你的头部，覆盖了你的[hair]。虽然它们在慵懒的盘旋中并没有烧到其他地方，但随着它们的聚集，你的头部开始发热。你害怕地在温度达到顶峰时举起双手，但当你触摸到你的头发时，灼热感突然消失了——连同你的触手一起！<b>你的头发恢复正常了！</b>");
            get_player().hair.type = 0;
            set_changes(get_changes() + 1);
         }
         if(get_player().hair.type != 4 && (get_player().hair.length > 26 || get_player().hair.length < 16) && get_changes() < get_changeLimit() && Utils.rand(4) == 0)
         {
            if(get_player().hair.length < 16)
            {
               var _temp_3:* = get_player().hair;
               _temp_3.length = _temp_3.length + (1 + Utils.rand(4));
               outputText("[pg]你的头皮感到一阵刺痛。你觉得有点失去平衡，随后发现你的头发变长了，变成了 " + Math.round(get_player().hair.length) + " 英寸长。");
            }
            else
            {
               var _temp_4:* = get_player().hair;
               _temp_4.length = _temp_4.length - (1 + Utils.rand(4));
               outputText("[pg]你的头皮感到一阵刺痛。你觉得有点失去平衡，随后发现你的头发变短了一些，变成了 " + Math.round(get_player().hair.length) + " 英寸长。");
            }
            set_changes(get_changes() + 1);
         }
         if(get_changes() < get_changeLimit() && Utils.rand(10) == 0)
         {
            outputText("[pg]当异国情调的味道席卷全身时，你叹了口气，不由自主地开始做起白日梦。在灌木丛中冲刺时，你能感觉到你的口鼻微微翘起，露出了一个恶作剧般的笑容。你闻到了恶魔的气味，而且就在不远处。现在你吃饱喝足，正是搞点小恶作剧的绝佳时机。随着气味变浓，你放慢了嬉戏的步伐，开始更加小心地潜行。");
            outputText("[pg]突然，你来到了一个恶魔营地，你看到了一个男魅魔和一个女魅魔的身影，他们的身体在臀部紧紧相连，即使在睡梦中也在缓慢地起伏。你小心翼翼地在他们沉睡的身体周围跳跃，找到了他们的补给品。你极其小心地用你剃刀般锋利的牙齿，缓慢而细致地撕开他们的背包——不是为了偷窃，而是为了恶作剧。你确保在每个背包的底部留下小洞，在确认你的潜行没有被打破后，你在他们的蹄子上撒了尿。");
            outputText("[pg]他们甚至都没有注意到，完全沉浸在潜意识的交媾中。对自己的小把戏感到满意，你窜入夜色中，化作树叶间的一抹红色残影。");
            set_changes(get_changes() + 1);
            get_player().changeFatigue(-10);
         }
         if(get_changes() < get_changeLimit() && Utils.rand(3) == 0 && get_player().dogCocks() < int(get_player().cocks.length))
         {
            _loc6_ = [];
            _loc4_ = get_player().cockTotal();
            while(_loc4_ > 0)
            {
               _loc4_--;
               if(get_player().cocks[_loc4_].get_cockType() != CockTypesEnum.DOG)
               {
                  _loc6_[int(_loc6_.length)] = _loc4_;
               }
            }
            if(int(_loc6_.length) != 0)
            {
               _loc10_ = int(_loc6_[Utils.rand(int(_loc6_.length))]);
               if(get_player().cocks[_loc10_].get_cockType() == CockTypesEnum.HUMAN)
               {
                  outputText("[pg]你的" + get_player().cockDescript(_loc10_) + "痛苦地紧缩，变得酸痛、胀痛地勃起。根部似乎有一种紧绷感，当你看到你的皮肤和血肉向前移动，变成一个看起来像犬类的阴茎鞘时，你退缩了。当你的" + get_player().cockDescript(_loc10_) + "的冠部重塑成一个尖端时，你颤抖着，这种感觉几乎让你无法承受。当变形完成时，你仰起头，你的" + Appearance.cockNoun(CockTypesEnum.DOG) + "比以前粗得多。<b>你现在有了一根狗鸡巴。</b>");
                  get_player().cocks[_loc10_].thickenCock(0.3);
                  dynStats(DynStat.Sens(10),DynStat.Lust(5));
               }
               else if(get_player().cocks[_loc10_].get_cockType() == CockTypesEnum.HORSE)
               {
                  outputText("[pg]你的" + Appearance.cockNoun(CockTypesEnum.HORSE) + "缩小了，马族多余的长度似乎变成了粗度。喇叭状的尖端消失了，变成了更尖的形状，在你的阴茎鞘上方形成了一个粗大的阴茎结凸起。<b>你现在有了一根狗鸡巴。</b>");
                  if(get_player().cocks[_loc10_].cockLength > 6)
                  {
                     var _temp_5:* = get_player().cocks[_loc10_];
                     _temp_5.cockLength = _temp_5.cockLength - 2;
                  }
                  else
                  {
                     var _temp_6:* = get_player().cocks[_loc10_];
                     _temp_6.cockLength = _temp_6.cockLength - 0.5;
                  }
                  var _temp_7:* = get_player().cocks[_loc10_];
                  _temp_7.cockThickness = _temp_7.cockThickness + 0.5;
                  dynStats(DynStat.Sens(4),DynStat.Lust(5));
               }
               else if(get_player().cocks[_loc10_].get_cockType() == CockTypesEnum.TENTACLE)
               {
                  outputText("[pg]你的" + get_player().cockDescript(_loc10_) + "向内卷曲，重塑并失去了植物般的颜色，因为它在根部附近变粗，凸起成一个看起来非常像犬类的阴茎结。你的皮肤在根部痛苦地聚拢，形成一个阴茎鞘。<b>你现在有了一根狗鸡巴。</b>");
                  dynStats(DynStat.Sens(4),DynStat.Lust(10));
               }
               else
               {
                  outputText("[pg]你的" + get_player().cockDescript(_loc10_) + "颤抖着，重塑成一根闪亮的红色狗鸡巴，根部有一个肥大的阴茎结。<b>你现在有了一根狗鸡巴。</b>");
                  dynStats(DynStat.Sens(4),DynStat.Lust(10));
               }
               get_player().cocks[_loc10_].set_cockType(CockTypesEnum.DOG);
               get_player().cocks[_loc10_].knotMultiplier = 1.25;
               set_changes(get_changes() + 1);
            }
         }
         if(get_player().cumQ() < 5000 && Utils.rand(3) == 0 && get_changes() < get_changeLimit() && get_player().hasCock())
         {
            _loc2_ = 2 + Utils.rand(4);
            if(get_player().hasPerk(PerkLib.MessyOrgasms))
            {
               _loc2_ += Utils.rand(10);
            }
            var _temp_8:* = get_player();
            _temp_8.cumMultiplier = _temp_8.cumMultiplier + _loc2_;
            if(get_player().balls == 0)
            {
               outputText("[pg]你感到肠胃里一阵翻腾，你体内的某些东西发生了改变。");
            }
            if(get_player().balls > 0)
            {
               outputText("[pg]你感到你的[balls]里一阵翻腾。这种感觉很快就平息了，让它们感觉变得更加紧实了。");
            }
            outputText("一点乳白色的预精从你的[cocks]中滴落，是被这种变化给挤出来的。");
            set_changes(get_changes() + 1);
         }
         if(get_changes() < get_changeLimit() && get_player().balls > 0 && get_player().ballSize > 4 && Utils.rand(3) == 0)
         {
            outputText("[pg]你的[sack]变得越来越轻，皮肤紧紧地包裹着你不断缩小的蛋蛋，直到你忍不住低头检查起来。");
            if(get_player().ballSize > 10)
            {
               var _temp_9:* = get_player();
               _temp_9.ballSize = _temp_9.ballSize - 5;
            }
            if(get_player().ballSize > 20)
            {
               var _temp_10:* = get_player();
               _temp_10.ballSize = _temp_10.ballSize - 4;
            }
            if(get_player().ballSize > 30)
            {
               var _temp_11:* = get_player();
               _temp_11.ballSize = _temp_11.ballSize - 4;
            }
            if(get_player().ballSize > 40)
            {
               var _temp_12:* = get_player();
               _temp_12.ballSize = _temp_12.ballSize - 4;
            }
            if(get_player().ballSize > 50)
            {
               var _temp_13:* = get_player();
               _temp_13.ballSize = _temp_13.ballSize - 8;
            }
            if(get_player().ballSize > 60)
            {
               var _temp_14:* = get_player();
               _temp_14.ballSize = _temp_14.ballSize - 8;
            }
            if(get_player().ballSize <= 10)
            {
               _loc11_ = get_player();
               --_loc11_.ballSize;
            }
            set_changes(get_changes() + 1);
            outputText("你现在拥有了[aballs]。");
         }
         if(get_changes() < get_changeLimit() && enhanced && get_player().bRows() < 4 && get_player().breastRows[get_player().bRows() - 1].breastRating > 1)
         {
            outputText("[pg]你的肚子不舒服地咕噜咕噜叫了一秒钟，因为");
            if(!enhanced)
            {
               outputText("浆果");
            }
            else
            {
               outputText("饮料");
            }
            outputText("在你体内沉淀得更深了。一秒钟后，这种不舒服的肠胃咕噜声就消失了。在你深呼吸几口之前，你的[fullchest]下方感到一阵瘙痒。你漫不经心地抓了抓，但该死的，好痛！你脱下部分[armor]来检查这不健康的瘙痒，");
            if(get_player().biggestTitSize() >= 8)
            {
               outputText("很难看清，因为一堵肉墙挡住了你的视线。");
            }
            else
            {
               outputText("很难看清楚。");
            }
            outputText("轻轻戳了几下，你的嘴里发出一声愉悦的喘息，你意识到那不是发痒——你长出了新的乳头！");
            outputText("[pg]仔细检查后发现，你新长出的乳头在大小和形状上和上面的完全一样");
            if(get_player().breastRows[get_player().bRows() - 1].nipplesPerBreast > 1)
            {
               outputText("，更不用说数量了");
            }
            else if(get_player().hasFuckableNipples())
            {
               outputText("，更不用说可插入性了");
            }
            outputText("。当你继续探索身体的新增部分时，新乳头后面升起了一股奇怪的热量。柔软、摇晃的乳肉开始填满你捧起的手。辐射般的温暖传遍全身，随着你的新乳房追赶上方的乳房，你的嘴唇发出了愉悦的呻吟。它们停在 " + get_player().breastCup(get_player().bRows() - 1) + " 罩杯。<b>你有 " + Utils.num2Text(get_player().bRows() + 1) + " 排乳房！</b>");
            get_player().createBreastRow();
            _loc6_ = get_player().breastRows;
            _loc10_ = get_player().bRows() - 1;
            _loc12_ = get_player().breastRows;
            _loc13_ = get_player().bRows() - 2;
            _loc6_[_loc10_].breastRating = _loc12_[_loc13_].breastRating;
            _loc14_ = get_player().breastRows;
            _loc15_ = get_player().bRows() - 1;
            _loc16_ = get_player().breastRows;
            _loc17_ = get_player().bRows() - 2;
            _loc14_[_loc15_].nipplesPerBreast = _loc16_[_loc17_].nipplesPerBreast;
            if(get_player().hasFuckableNipples())
            {
               get_player().breastRows[get_player().bRows() - 1].fuckable = true;
            }
            _loc18_ = get_player().breastRows;
            _loc19_ = get_player().bRows() - 1;
            _loc20_ = get_player().breastRows;
            _loc21_ = get_player().bRows() - 2;
            _loc18_[_loc19_].lactationMultiplier = _loc20_[_loc21_].lactationMultiplier;
            dynStats(DynStat.Sens(2),DynStat.Lust(30));
            set_changes(get_changes() + 1);
         }
         var _loc22_:Boolean = false;
         _loc4_ = get_player().bRows();
         while(_loc4_ > 1)
         {
            _loc4_--;
            if(get_player().breastRows[_loc4_].breastRating <= get_player().breastRows[_loc4_ - 1].breastRating - 1 && get_changes() < get_changeLimit() && Utils.rand(2) == 0)
            {
               if(_loc22_)
               {
                  outputText("[pg]它们不是唯一发生变化的一对！另一排正在生长的乳房也和它的姐妹们一起经历了同样的过程，变得更大了。");
               }
               else
               {
                  _loc23_ = Utils.rand(3);
                  if(_loc23_ == 1)
                  {
                     outputText("[pg]一丝微弱的温暖在你的 " + get_player().breastDescript(_loc4_) + " 表面嗡嗡作响，那种轻微的刺痛感似乎在你的[skin]下振动得越来越快。很快，这种热量变得令人不适，那排胸肉开始感到紧绷，几乎像一面新拉紧的鼓一样嗡嗡作响。你的 " + get_player().nippleDescript(_loc4_) + " 变得坚硬如石，虽然被拉伸的不适感消退了，但那种令人愉悦的、温暖的嗡嗡声依然存在。直到你捧起你那刺痛的乳房，你才意识到它们变大了，几乎是在嫉妒上方的那对。");
                  }
                  else if(_loc23_ == 2)
                  {
                     outputText("[pg]一瞬间，你的 " + get_player().breastDescript(_loc4_) + " 发出微弱沉闷的咕噜声，紧接着你的肉体颤抖摇晃，新长出的乳房向外撑开了你的[skinfurscales]。你漫不经心地用手捧住肿胀的胸部，虽然它很快就停止了生长，但你意识到你的乳房大小已经更接近上方的那对了。");
                  }
                  else
                  {
                     outputText("[pg]一种令人不适的拉伸感在你的 " + get_player().breastDescript(_loc4_) + " 的曲线上蔓延，一丝丝热量在你的肉体中刺痛。感觉就像你的心跳在膨胀的肉丘中被放大了十倍，你的[skin]因性唤起而泛红，你的 " + get_player().nippleDescript(_loc4_) + " 充满了温暖。随着刺痛的热量逐渐消退，又多出了几英寸摇晃的乳房。你试探性地捧起它们，确认它们确实长得更接近上方那对的大小了。");
                  }
               }
               if(get_player().breastRows[_loc4_].breastRating <= get_player().breastRows[_loc4_ - 1].breastRating - 3)
               {
                  var _temp_15:* = get_player().breastRows[_loc4_];
                  _temp_15.breastRating = _temp_15.breastRating + (2 + Utils.rand(2));
               }
               else
               {
                  var _temp_16:* = get_player().breastRows[_loc4_];
                  _temp_16.breastRating = _temp_16.breastRating + 1;
               }
               outputText("你快速测量了一下，确定你的第" + Utils.num2TextOrdinal(_loc4_ + 1) + "排乳房现在是" + get_player().breastCup(_loc4_) + "罩杯。");
               if(!_loc22_)
               {
                  _loc22_ = true;
                  set_changes(get_changes() + 1);
               }
               dynStats(DynStat.Sens(2),DynStat.Lust(10));
            }
         }
         if(get_player().statusEffectv2(StatusEffects.Heat) < 30 && Utils.rand(6) == 0 && get_changes() < get_changeLimit())
         {
            if(get_player().goIntoHeat(true))
            {
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
         if(get_mutations().tfNoFur() && (enhanced || get_player().lowerBody.type == 17) && !get_player().hasFur() && get_changes() < get_changeLimit() && Utils.rand(4) == 0)
         {
            if(get_player().hasScales())
            {
               outputText("[pg]你的皮肤发生变化，每一片鳞片都竖了起来，让你陷入了轻微的恐慌。无论你如何紧绷身体，似乎都无法让它们重新平复。这种不舒服的感觉持续了几分钟，直到所有的鳞片同时从你身上脱落，长出了一层细密的绒毛。你短暂地考虑过把它们收集起来，但当你捡起一片时，它已经像几百年前的东西一样干瘪易碎了。<b>好吧；至少有了新皮毛，你就不需要经常晒太阳了。</b>");
            }
            else
            {
               outputText("[pg]你全身的皮肤都在发痒，这种突然而均匀的强烈痒感让你不敢去抓。当你强忍着这种如同针扎般的刺痛感时，细密而奢华的皮毛从你每一寸裸露的皮肤上长了出来！<b>你得习惯变得毛茸茸的了……</b>");
            }
            get_player().skin.type = 1;
            get_player().skin.adj = "";
            get_player().skin.desc = "fur";
            if(get_player().kitsuneScore() < 4)
            {
               get_player().setFurColor(OneOf_Impl_.fromB(ColorLists.FOX_FUR),3);
            }
            else if(ColorLists.BASIC_KITSUNE_OUTER_FUR.contains(get_player().hair.color) || Boolean(ColorLists.ELDER_KITSUNE.contains(get_player().hair.color)))
            {
               get_player().setFurColor(OneOf_Impl_.fromA([get_player().hair.color]),3);
            }
            else if(get_player().isNineTails())
            {
               get_player().setFurColor(OneOf_Impl_.fromA(ColorLists.ELDER_KITSUNE),3);
            }
            else
            {
               get_player().setFurColor(OneOf_Impl_.fromB(ColorLists.BASIC_KITSUNE_FUR),3);
            }
            set_changes(get_changes() + 1);
         }
         if((enhanced || get_player().ears.type == 9) && get_player().lowerBody.type != 17 && get_changes() < get_changeLimit() && Utils.rand(5) == 0)
         {
            if(get_player().isTaur())
            {
               outputText("[pg]随着后腿的力量流失，你浑身发抖。你颤抖着坐在后腿上，前腿张开以防止自己摔倒；当你的下半身缩小，将它们向后拖拽，直到你能用前腿的底面感觉到后腿的上面时，蹄子在泥土上刮擦着。一阵恶心和眩晕感袭来，你闭上眼睛以隔绝这些感觉。当你重新睁开眼睛时，映入眼帘的不再是四条腿，而只有两条……形状大致和你以前的后腿一样，只是原本长着蹄子的地方变成了毛茸茸的脚趾。<b>你现在有了狐狸腿！</b>");
            }
            else if(get_player().hasTailInsteadOfLegs())
            {
               outputText("[pg]你的鳞片在腰部裂开并开始剥落，[if (isNaga) {像旧蛇皮一样|脱落}]。如果这还不够奇怪的话，下面露出的不是鳞片，而是粉嫩的新肉，覆盖的腿在飞节处弯曲，脚部拉长，就像野兽一样。当鳞片状的外壳脱落，你从中走出来，不得不踮着脚尖走路时，干燥的皮肤上吹起了一阵细粉。几分钟内，它完全碎裂，被不断吹拂的风带走。<b>你的腿现在变成了狐狸的腿！</b>");
            }
            else if(get_player().lowerBody.type == 1 || get_player().lowerBody.type == 2 || get_player().lowerBody.type == 9 || get_player().lowerBody.type == 12 || get_player().lowerBody.type == 14)
            {
               outputText("[pg]你的双腿抽搐颤抖，迫使你坐下。在你的注视下，脚趾的末端变成了毛茸茸的、有肉垫的脚趾。<b>你现在有了狐狸的脚！</b>说实话，还挺可爱的。");
            }
            else if(get_player().lowerBody.type == 16)
            {
               outputText("[pg]你的双腿发软，摔倒在地，腹部重重地砸在地上。虽然你失去了控制，也看不到身后，但你仍然能感觉到甲壳松动并从身体上脱落的恶心感觉，以及干燥的微风吹过你暴露的神经。出于本能，你的双腿紧紧抱在一起，尽可能地保护它们现在敏感的表面。当你试图分开它们时，你发现你做不到。几分钟不舒服地过去了，直到你再次弯曲双腿，当你这样做时，你发现一侧的所有腿都弯曲在一起——<b>变成了狐狸腿的形状！</b>");
            }
            else if(get_player().isGoo())
            {
               outputText("[pg]过了一会儿，你才注意到你那史莱姆状的下半身里有一些更清晰的东西。当你伸长身体并移动它们去查看时，你刚好能辨认出一个半固体的团块，形状像一条弯曲的野兽腿。你没怎么在意，直到几分钟后，你直接从你那摇晃的史莱姆下盘中走出来，踩在新脚上。覆盖在上面的史莱姆很快就干了，你留下的那部分也一样，<b>露出了一双像狗一样的狐狸腿！</b>");
            }
            else
            {
               outputText("[pg]你的腿筋痛苦地紧绷并开始拉扯，让你脸朝下摔倒。当你在地上痛苦地扭动时，你能感觉到你的大腿在缩短，你的脚在伸长");
               if(get_player().lowerBody.type == 7)
               {
                  outputText("，同时空气中充满了可怕的骨裂声");
               }
               outputText("。当痉挛平息，你再次站起来时，<b>你发现你的双腿变成了狐狸的腿！</b>");
            }
            get_player().lowerBody.type = 17;
            get_player().lowerBody.legCount = 2;
            set_changes(get_changes() + 1);
         }
         if((enhanced || get_player().tail.type == 13) && get_player().ears.type != 9 && get_changes() < get_changeLimit() && Utils.rand(4) == 0)
         {
            if(get_player().ears.type == 0 || get_player().ears.type == 4 || get_player().ears.type == 6)
            {
               outputText("[pg]你脸颊两侧痛苦地拉伸着，你的耳朵变长并开始越过发际线，向头顶移动。它们不断伸长，变成了覆盖着浓密毛发的大型狐狸状三角形。<b>你现在有了狐狸耳朵。</b>");
            }
            else
            {
               outputText("[pg]你的耳朵发生了变化，从现在的形状变成了狐狸的特征。<b>你现在有了狐狸耳朵。</b>");
            }
            get_player().ears.type = 9;
            set_changes(get_changes() + 1);
         }
         if(get_player().tail.type != 13 && get_changes() < get_changeLimit() && Utils.rand(4) == 0)
         {
            if(get_player().tail.type == 0)
            {
               outputText("[pg]你的后背下方积聚起一股压力。你在[armor]下摸索，发现那里长出了一个奇怪的结节，而且似乎每秒都在变大。伴随着一阵突然的剧烈蠕动，它猛地长成了一条毛茸茸的长尾巴，像是有自己的意识一样，带着催眠般的节奏摇摆着。<b>你现在有了一条狐狸尾巴！</b>");
            }
            else
            {
               outputText("[pg]一阵剧痛刺穿了你的下背部，你的尾巴剧烈地扭动着。伴随着最后一次异常的抽搐，它蓬松成了一条长长的、毛茸茸的狐狸尾巴，以一种几乎催眠的方式甩动着。<b>你现在有了一条狐狸尾巴！</b>");
            }
            get_player().tail.type = 13;
            get_player().tail.venom = 1;
            set_changes(get_changes() + 1);
         }
         if(get_mutations().tfNoFur() && get_player().hasFur() && get_player().face.type != 11 && get_changes() < get_changeLimit() && Utils.rand(5) == 0)
         {
            outputText("[pg]你的脸一阵紧缩，你用手捂住了它。几秒钟内，你的鼻子就从指缝间探了出来，将手微微推向两边，新的血肉和骨骼在后面生长和移动，直到它停在一个轮廓分明、逐渐变细的熟悉尖端上，即使不用镜子你也能看到。<b>看来你现在有一张狐狸的脸了。</b>");
            if(get_silly())
            {
               outputText("他们还说你疯了……");
            }
            set_changes(get_changes() + 1);
            get_player().face.type = 11;
         }
         if(get_player().arms.type != 12 && get_player().isFurry() && get_player().tail.type == 13 && get_player().lowerBody.type == 17 && Utils.rand(4) == 0 && get_changes() < get_changeLimit())
         {
            outputText("[pg]你的手臂感到一阵无力，无论你怎么做，都无法鼓起力气抬起或移动它们。这浆果难道有什么类似药物的效果吗？你坐在地上，等待着这种无力感消退。就在这时，你意识到你手部的骨骼以及手臂上的肌肉正在发生变化。很快，从肩膀到指尖，它们都被一层柔软、蓬松的[if (hasFurryUnderBody) {[underBody.furColor]|[furColor]}]毛发覆盖。你的手掌原本所在的位置长出了粉红色的肉垫，指甲变成了短爪，虽然不够锋利撕裂血肉，但足够灵活，让攀爬和探索变得更容易。<b>你的手臂变得像狐狸一样了！</b>");
            get_player().arms.setType(12);
            set_changes(get_changes() + 1);
         }
         if(get_player().tone > 40 && get_changes() < get_changeLimit() && Utils.rand(2) == 0)
         {
            outputText("[pg]活动身体时，你感觉比平时多了些晃动。你似乎并没有变胖，但肌肉看起来不那么明显了，身体的各个部位也变得令人愉悦地柔软起来。");
            var _temp_17:* = get_player();
            _temp_17.tone = _temp_17.tone - 4;
         }
         if(get_changes() == 0)
         {
            outputText("[pg]这似乎没起多大作用，但你确实感到精神焕发了一点！");
            get_player().changeFatigue(-5);
         }
         get_player().refillHunger(15);
         var _loc24_:IMap = KFLAGS.flags;
         FlagDict_Impl_.arrayWriteInt(_loc24_,2077,FlagDict_Impl_.arrayReadInt(_loc24_,2077) + get_changes());
         return false;
      }
   }
}

