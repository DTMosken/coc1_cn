package classes.items.consumables
{
   import classes.Cock;
   import classes.CockTypesEnum;
   import classes.DynStat;
   import classes.Player;
   import classes.StatusEffects;
   import classes._FlagDict.FlagDict_Impl_;
   import classes.globalFlags.KFLAGS;
   import classes.internals.Utils;
   import classes.items.Consumable;
   import classes.items.Mutations;
   import flash.Boot;
   import haxe.IMap;
   
   public class RhinoSteak extends Consumable
   {
      
      public function RhinoSteak()
      {
         if(Boot.skip_constructor)
         {
            return;
         }
         super("RhinoSt","Rhino Steak","a rhino steak",6,"Despite the name, it doesn\'t come from any rhinoceros or a rhino-morph. We can guarantee you that no rhinoceros were harmed in the production of this food.\n\nDISCLAIMER: We are not responsible if you find yourself altered.");
      }
      
      override public function useItem() : Boolean
      {
         var _loc1_:int = 0;
         var _loc5_:* = null as Player;
         var _loc2_:String = "rhinoTFs";
         var _loc3_:int = 0;
         get_mutations().initTransformation(null,3);
         get_player().refillHunger(40);
         if(Utils.rand(3) == 0 && get_player().get_str100() < 100)
         {
            if(get_player().get_str100() < 50)
            {
               outputText("[pg]你打了个寒颤，感觉到一种发热的感觉，这让你想起了上次生病的时候。谢天谢地，这种感觉很快就过去了，随之而来的是力量的轻微增强。");
               dynStats(DynStat.Str(0.5));
            }
            else
            {
               outputText("[pg]热量在你的肌肉中聚集，它们原本就强健的肌肉块微微变移，获得了更强的力量。");
            }
            dynStats(DynStat.Str(0.5));
         }
         if(Utils.rand(3) == 0 && get_player().get_tou100() < 100)
         {
            outputText("[pg]你捶了捶胸膛，咧嘴一笑——当你被液体勇气强化时，你的敌人将更难击倒你。");
            dynStats(DynStat.Tou(1));
         }
         if(Utils.rand(2) == 0 && get_player().get_spe100() > 80 && get_player().get_str100() >= 50)
         {
            outputText("[pg]你开始感觉到你肌肉的尺寸开始让你变得迟缓。");
            dynStats(DynStat.Spe(-1));
         }
         if(Utils.rand(3) == 0 && get_player().get_tou100() < 50 && get_changes() < get_changeLimit())
         {
            outputText("[pg]你的皮肤感觉湿冷，有点像橡胶。你试探性地摸了摸自己，发现几乎感觉不到指尖的压力。在好奇心的驱使下，你轻轻地在手臂上打了一拳；你最多只感觉到一阵隐隐的悸动！");
            dynStats(DynStat.Sens(-1));
         }
         if(Utils.rand(3) == 0 && get_player().get_inte() > 15 && get_player().face.type == 21 && get_player().horns.value == 2)
         {
            outputText("[pg]你摇了摇头，努力集中思绪，感觉有点迟钝。");
            dynStats(DynStat.Inte(-1));
         }
         if(Utils.rand(3) == 0 && get_player().rhinoScore() >= 2 && (Utils.rand(2) == 0 || !get_player().get_inRut()) && get_player().hasCock())
         {
            get_player().goIntoRut(true);
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
         if(Utils.rand(4) == 0 && get_changes() < get_changeLimit() && get_player().horns.type != 7 && get_player().ears.type == 1 && (get_player().lowerBody.type == 1 || get_player().lowerBody.type == 21 || get_player().horseScore() >= 3))
         {
            outputText("[pg]你开始感觉到头顶有一阵恼人的刺痛感。你伸手去摸，发现<b>一个尖锐的角突从你额头中央凸起</b>并不断生长。等它长成后，你估计它大约有六英寸长。");
            get_player().horns.type = 7;
            get_player().horns.value = 6;
            set_changes(get_changes() + 1);
         }
         if(Utils.rand(4) == 0 && get_changes() < get_changeLimit() && get_player().horns.type == 7 && get_player().horns.value > 0 && get_player().horns.value < 12)
         {
            outputText("[pg]你开始感觉到中央的角传来一阵强烈的刺痛感，它正在向外推出，变得更长更大。你伸手去摸，发现<b>它长出了自己可爱的小螺旋，</b>你估计它大约有一英尺长，两英寸粗，非常坚固，是一种非常有用的天然武器。");
            get_player().horns.value = 12;
            set_changes(get_changes() + 1);
         }
         if(Utils.rand(4) == 0 && get_changes() < get_changeLimit() && (get_player().wings.type != 0 || get_player().rearBody.type == 3))
         {
            if(get_player().rearBody.type == 3)
            {
               outputText("[pg]一阵紧绷感蔓延过你的背部，感觉就像有人把匕首刺进了你的脊椎。片刻之后，疼痛感消失了，不过你的鳍也不见了！");
               get_player().rearBody.restore();
            }
            else
            {
               outputText("[pg]一阵紧绷感蔓延过你的背部，感觉就像有人把匕首刺进了你的两块肩胛骨。片刻之后，疼痛感消失了，不过你的翅膀也不见了！");
            }
            get_player().wings.restore();
            set_changes(get_changes() + 1);
         }
         if(Utils.rand(4) == 0 && get_changes() < get_changeLimit() && (!get_player().hasPlainSkin() || get_player().skin.tone != "gray" || get_player().skin.adj != "tough"))
         {
            outputText("[pg]");
            switch(get_player().skin.type)
            {
               case 0:
                  outputText("你感到一阵瘙痒，你的皮肤变厚，<b>变成了坚韧的灰色皮肤</b>。");
                  break;
               case 1:
                  outputText("你感觉到一阵瘙痒，你的毛发开始成块地脱落，<b>露出了下面坚韧的灰色皮肤</b>。");
                  break;
               case 2:
               case 5:
               case 6:
                  outputText("你感到一阵奇怪的翻滚感，你的鳞片开始移动，在生长和消失的过程中扩散和重组，<b>变成了坚韧的灰色皮肤</b>。");
                  break;
               case 3:
                  outputText("你感到一阵瘙痒，你那黏糊糊的皮肤凝固变厚，<b>变成了坚韧的灰色皮肤</b>。");
                  break;
               default:
                  outputText("你感到一阵瘙痒，你的皮肤变厚，<b>变成了坚韧的灰色皮肤</b>。");
            }
            get_player().skin.tone = "gray";
            get_player().skin.adj = "tough";
            get_player().skin.type = 0;
            get_player().skin.desc = "skin";
            get_player().underBody.restore();
            get_player().arms.updateClaws(get_player().arms.claws.type);
            set_changes(get_changes() + 1);
         }
         if(Utils.rand(3) == 0 && get_changes() < get_changeLimit() && get_player().arms.type != 0)
         {
            switch(get_player().arms.type)
            {
               case 1:
                  outputText("[pg]你心不在焉地抓着二头肌，但无论你怎么抓，都无法消除那种瘙痒感。你烦躁地低头看去，发现你长满羽毛的手臂正在脱落羽毛。你手臂曾经的翅膀形状在片刻之间就消失了，只留下了[skindesc]。");
                  break;
               case 2:
                  outputText("[pg]你心不在焉地抓着二头肌，但无论你怎么抓，都无法消除那种瘙痒感。你烦躁地低头看去，发现你手臂上的几丁质覆盖物正在剥落。那层光滑的黑色外壳很快就消失了，只留下了[skindesc]。");
            }
            get_player().arms.restore();
            set_changes(get_changes() + 1);
         }
         if(Utils.rand(4) == 0 && get_changes() < get_changeLimit() && get_player().lowerBody.type != 0)
         {
            if(get_player().isBiped())
            {
               outputText("你的[feet]感到一阵奇怪的感觉。你的[feet]发生变移，你听到骨头断裂的声音，它们重组成了正常的人类双脚。");
            }
            get_player().lowerBody.type = 0;
            get_player().lowerBody.legCount = 2;
            set_changes(get_changes() + 1);
         }
         if(Utils.rand(3) == 0 && get_changes() < get_changeLimit() && get_player().antennae.type > 0)
         {
            get_mutations().removeAntennae();
         }
         if(Utils.rand(4) == 0 && get_changes() < get_changeLimit() && get_player().hair.type != 0)
         {
            switch(get_player().hair.type)
            {
               case 1:
                  if(get_player().hair.length >= 6)
                  {
                     outputText("[pg]一缕柔软的羽毛头发垂在你的眼前。还没等你把这根讨厌的绒毛吹走，你就意识到这根羽毛正在向内塌陷。它继续向内卷曲，直到剩下的只是一根普通的头发。<b>你的头发不再是羽毛了！</b>");
                  }
                  else
                  {
                     outputText("[pg]你在等待刚刚吃下的物品生效时，用手指梳理着你那柔软的羽毛头发。当你的手放在上面时，它察觉到你的羽毛质地发生了变化。它们完全消失了，融合成了普通的头发。<b>你的头发不再是羽毛了！</b>");
                  }
                  break;
               case 2:
                  break;
               case 3:
                  outputText("[pg]你那黏糊糊的头发开始成块地脱落，最终让你变成了一个光头。不过，你的头并没有光秃太久。片刻之后，你的头皮上就长出了一头浓密的头发。<b>你的头发又恢复正常了！</b>");
                  break;
               case 4:
                  outputText("[pg]你感觉头上发生了一些奇怪的事情。你伸出手去摸你的触手头发，却发现触手已经消失，取而代之的是正常的头发。<b>你的头发又恢复正常了！</b>");
            }
            set_changes(get_changes() + 1);
            get_player().hair.type = 0;
            FlagDict_Impl_.arrayWriteInt(KFLAGS.flags,66,0);
         }
         if(Utils.rand(3) == 0 && get_changes() < get_changeLimit() && FlagDict_Impl_.arrayReadInt(KFLAGS.flags,66) > 0)
         {
            outputText("[pg]当你意识到这种变化时，你感到头皮一阵发痒。<b>你的头发又恢复正常生长了！</b>");
            FlagDict_Impl_.arrayWriteInt(KFLAGS.flags,66,0);
            set_changes(get_changes() + 1);
         }
         if(Utils.rand(4) == 0 && get_changes() < get_changeLimit() && get_player().hasGills())
         {
            get_mutations().updateGills();
         }
         if(Utils.rand(4) == 0 && get_changes() < get_changeLimit() && get_player().hasCock() && get_player().countCocksOfType(CockTypesEnum.RHINO) < get_player().cockTotal())
         {
            if(get_player().cockTotal() == 1)
            {
               outputText("[pg]你感到下体一阵骚动，你的阴茎变得坚硬如石。");
            }
            else
            {
               outputText("[pg]你的其中一根阴茎开始感觉有些奇怪。");
            }
            outputText("你" + get_player().clothedOrNakedLower("把它从你的[armor]里掏出来","弯下腰") + "，就在黑鸡酒馆的中央，仔细查看。你看着你的阴茎皮肤变成了一个光滑、坚韧的粉红色肉棒。它呈现出细长的形状，中间有一个椭圆形的凸起。你感觉到根部附近有一种紧绷感，你的皮肤似乎在那里聚集起来。一个包皮开始在你的犀牛阴茎根部形成，随着你僵硬的犀牛阴茎伸长并固定下来，它变得越来越紧，粗大的龟头不断流出难闻的动物精液。<b>你现在有了一根犀牛阴茎。</b>");
            _loc1_ = 0;
            while(_loc1_ < int(get_player().cocks.length))
            {
               if(get_player().cocks[_loc1_].get_cockType() != CockTypesEnum.RHINO)
               {
                  get_player().cocks[_loc1_].set_cockType(CockTypesEnum.RHINO);
                  break;
               }
               _loc1_++;
            }
            dynStats(DynStat.Lust(20));
            set_changes(get_changes() + 1);
         }
         if(Utils.rand(3) == 0 && get_changes() < get_changeLimit() && get_player().ears.type != 15)
         {
            outputText("[pg]你的耳朵感到一阵奇怪的不适。你伸手摸去，发现你的耳朵变成了一个开放的管状，当它们变化完成后，你弹了弹它们，享受着你的新耳朵在空气中挥舞的感觉。<b>你现在有了犀牛耳朵。</b>");
            get_player().ears.type = 15;
            set_changes(get_changes() + 1);
         }
         if(get_mutations().tfNoFur() && Utils.rand(4) == 0 && get_changes() < get_changeLimit() && get_player().ears.type == 15 && get_player().skin.tone == "gray" && get_player().face.type != 21)
         {
            outputText("[pg]你的脸突然麻木了。你开始听到骨头断裂的声音，你的视线突然发生变移，因为你的脸伸长并变厚了。当你的脸停止生长时，你可以在视野中心看到你拉长的嘴巴和鼻子的边缘。不过它们几乎不影响你的视线。<b>你现在有了一张犀牛脸。</b>");
            get_player().face.type = 21;
            set_changes(get_changes() + 1);
         }
         if(Utils.rand(3) == 0 && get_changes() < get_changeLimit() && get_player().isBiped() && get_player().tail.type != 22)
         {
            if(get_player().tail.type > 0)
            {
               outputText("[pg]你的[tail]突然变得麻木。回头一看，你发现它正在改变、扭曲，并重新塑造成一条长长的绳状尾巴，末端有一小撮[furcolor]的毛。<b>你现在有了一条犀牛尾巴。</b>");
            }
            else
            {
               outputText("[pg]你感到[ass]上方有一种奇怪的瘙痒感。扭头检查时，你发现了一条长长的绳状尾巴，末端有一小撮[furcolor]的毛。<b>你现在有了一条犀牛尾巴。</b>");
            }
            get_player().tail.type = 22;
            set_changes(get_changes() + 1);
         }
         if(Utils.rand(4) == 0 && get_changes() < get_changeLimit() && get_player().face.type == 21 && get_player().horns.type != 8)
         {
            outputText("[pg]你开始感到头顶有一种恼人的刺痛感。伸手检查时，你发现额头中央突出了一个尖锐的角，并且还在生长。等它长成后，你估计它大约有六英寸长。如果它更尖、更长一点，就会成为一件有用的天然武器。");
            get_player().horns.value = 1;
            get_player().horns.type = 8;
            set_changes(get_changes() + 1);
         }
         if(Utils.rand(4) == 0 && get_changes() < get_changeLimit() && get_player().face.type == 21 && get_player().horns.type == 8 && get_player().horns.value == 1)
         {
            outputText("[pg]你开始感到鼻子边缘、视线正上方有一种恼人的刺痛感。伸手一摸，你感觉到脸部边缘长出了一个弯曲的尖角。随着你感觉到两只角都变得又尖又高，那种发痒的刺痛感还在继续。你估计你原来的角只有七英寸，而新长出的角大约有一英尺长。它们将成为有用的天然武器。");
            outputText("\n<b>（获得物理特技：巨角挑击！一旦你失去犀牛脸或犀牛角，你将失去此能力。）</b>");
            get_player().horns.value = 2;
            get_player().horns.type = 8;
            set_changes(get_changes() + 1);
         }
         var _loc4_:int = 0;
         if(Utils.rand(3) == 0 && get_changes() < get_changeLimit() && get_player().hasCock() && get_player().smallestCockLength() < 10 && get_player().cockTotal() - get_player().countCocksOfType(CockTypesEnum.RHINO) > 0)
         {
            _loc4_ = 0;
            _loc1_ = 0;
            while(_loc1_ < get_player().cockTotal())
            {
               if(get_player().cocks[_loc1_].get_cockType() == CockTypesEnum.RHINO && get_player().cocks[_loc1_].cockLength >= 10)
               {
                  _loc1_++;
               }
               else
               {
                  _loc3_ = int(get_player().increaseCock(get_player().smallestCockIndex(),Utils.rand(2) + 1));
                  dynStats(DynStat.Lib(0.5),DynStat.Lust(3));
                  _loc4_++;
                  _loc1_++;
               }
            }
            outputText("[pg]");
            get_player().lengthChange(_loc3_,_loc4_);
            set_changes(get_changes() + 1);
         }
         if(Utils.rand(3) == 0 && get_changes() < get_changeLimit() && get_player().hasCock() && get_player().countCocksOfType(CockTypesEnum.RHINO) > 0)
         {
            _loc4_ = 0;
            _loc1_ = 0;
            while(_loc1_ < get_player().cockTotal())
            {
               if(get_player().cocks[_loc1_].get_cockType() == CockTypesEnum.RHINO && get_player().cocks[_loc1_].cockThickness < 3)
               {
                  get_player().cocks[_loc1_].thickenCock(0.5);
                  dynStats(DynStat.Lib(0.5),DynStat.Lust(3));
                  break;
               }
               _loc1_++;
            }
            set_changes(get_changes() + 1);
         }
         if(Utils.rand(3) == 0 && get_changes() < get_changeLimit() && get_player().hasCock() && get_player().countCocksOfType(CockTypesEnum.RHINO) > 0)
         {
            _loc4_ = 0;
            _loc1_ = 0;
            while(_loc1_ < get_player().cockTotal())
            {
               if(get_player().cocks[_loc1_].get_cockType() == CockTypesEnum.RHINO && get_player().cocks[_loc1_].cockLength < 18)
               {
                  _loc3_ = int(get_player().increaseCock(_loc1_,1 + Utils.rand(2)));
                  outputText("[pg]");
                  get_player().lengthChange(_loc3_,1);
                  dynStats(DynStat.Lib(0.5),DynStat.Lust(3));
                  break;
               }
               _loc1_++;
            }
            set_changes(get_changes() + 1);
         }
         if(Utils.rand(3) == 0 && get_changes() < get_changeLimit() && get_player().balls > 0 && get_player().ballSize < 4)
         {
            if(get_player().ballSize <= 2)
            {
               outputText("[pg]一阵暖流穿过你的身体，腹股沟突然产生了一种沉重感。你停下来检查这些变化，你游移的手指发现你的" + get_player().simpleBallsDescript() + "已经长得比人类的还要大了。");
            }
            if(get_player().ballSize > 2)
            {
               outputText("[pg]腹股沟突然传来一阵热意，集中在你的[sack]上。你发现你的" + get_player().simpleBallsDescript() + "又变大了，连走路都变得困难起来。");
            }
            dynStats(DynStat.Lib(1),DynStat.Lust(3));
            var _temp_1:* = get_player();
            _temp_1.ballSize = _temp_1.ballSize + 1;
            set_changes(get_changes() + 1);
         }
         if(Utils.rand(3) == 0 && get_changes() < get_changeLimit() && get_player().hasVagina() && get_player().statusEffectv1(StatusEffects.BonusVCapacity) < 40)
         {
            if(!get_player().hasStatusEffect(StatusEffects.BonusVCapacity))
            {
               get_player().createStatusEffect(StatusEffects.BonusVCapacity,0,0,0,0);
            }
            get_player().addStatusValue(StatusEffects.BonusVCapacity,1,5);
            outputText("[pg]你的" + get_player().vaginaDescript(0) + "里突然有一种……空虚感。不知为何，你知道自己可以容纳更大……的插入了。");
            set_changes(get_changes() + 1);
         }
         if(Utils.rand(3) == 0 && get_changes() < get_changeLimit() && get_player().hasVagina() && get_player().statusEffectv1(StatusEffects.BonusVCapacity) < 60)
         {
            if(get_player().statusEffectv1(StatusEffects.BonusACapacity) < 60)
            {
               if(!get_player().hasStatusEffect(StatusEffects.BonusACapacity))
               {
                  get_player().createStatusEffect(StatusEffects.BonusACapacity,0,0,0,0);
               }
               get_player().addStatusValue(StatusEffects.BonusACapacity,1,5);
               outputText("[pg]你感觉……不知怎么的，变得更能包容了。你的[asshole]有点刺痛，虽然它似乎没有变松，但变得更有弹性了。");
               set_changes(get_changes() + 1);
            }
         }
         if(Utils.rand(2) == 0 && get_changes() < get_changeLimit() && get_player().get_tallness() < 102)
         {
            _loc3_ = Utils.rand(5) + 3;
            if(get_player().get_tallness() > 90)
            {
               _loc3_ = int(Math.floor(_loc3_ / 2));
            }
            if(_loc3_ == 0)
            {
               _loc3_ = 1;
            }
            if(_loc3_ > 6)
            {
               _loc3_ = 6;
            }
            if(_loc3_ < 3)
            {
               outputText("[pg]你不安地挪动着身体，因为你意识到自己失去了平衡。低头一看，你发现自己长高了[i:一点点]。");
            }
            if(_loc3_ >= 3 && _loc3_ < 6)
            {
               outputText("[pg]你感到头晕，有点不对劲，但很快意识到这是因为身高突然增加。");
            }
            if(_loc3_ == 6)
            {
               outputText("[pg]你踉跄着向前走，头晕目眩地抓着自己的头。你花了一会儿时间恢复平衡，站起身来，感觉明显长高了。");
            }
            _loc5_ = get_player();
            _loc5_.set_tallness(_loc5_.get_tallness() + _loc3_);
            set_changes(get_changes() + 1);
         }
         if(Utils.rand(2) == 0 && get_player().tone < 80)
         {
            if(get_player().tone < 50)
            {
               get_player().modTone(80,2 + Utils.rand(2));
            }
            else
            {
               get_player().modTone(80,1 + Utils.rand(2));
            }
         }
         if(Utils.rand(2) == 0 && get_player().thickness < 80)
         {
            if(get_player().thickness < 50)
            {
               get_player().modThickness(80,2 + Utils.rand(2));
            }
            else
            {
               get_player().modThickness(80,1 + Utils.rand(2));
            }
         }
         if(Utils.rand(3) == 0 && get_changes() < get_changeLimit() && FlagDict_Impl_.arrayReadInt(KFLAGS.flags,26) > 0)
         {
            outputText("[pg]你感到头皮一阵刺痛。几秒钟后它停止了……真奇怪。");
            FlagDict_Impl_.arrayWriteInt(KFLAGS.flags,26,0);
            set_changes(get_changes() + 1);
         }
         var _loc6_:IMap = KFLAGS.flags;
         FlagDict_Impl_.arrayWriteInt(_loc6_,2077,FlagDict_Impl_.arrayReadInt(_loc6_,2077) + get_changes());
         return false;
      }
   }
}

