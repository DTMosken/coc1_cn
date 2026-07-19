package classes.items.consumables
{
   import classes.BreastRow;
   import classes.Cock;
   import classes.CockTypesEnum;
   import classes.PerkLib;
   import classes.Player;
   import classes.StatusEffects;
   import classes._FlagDict.FlagDict_Impl_;
   import classes.globalFlags.KFLAGS;
   import classes.internals.Utils;
   import classes.items.Consumable;
   import classes.items.Mutations;
   import flash.Boot;
   import haxe.IMap;
   
   public class EchidnaCake extends Consumable
   {
      
      public function EchidnaCake()
      {
         if(Boot.skip_constructor)
         {
            return;
         }
         super("EchidCk","Echidna Cake","an echidna cake",6,"Try our special cake, a favorite among the echidna-morphs!\n\nDISCLAIMER: We are not responsible if you find yourself altered.");
      }
      
      override public function useItem() : Boolean
      {
         var _loc3_:int = 0;
         var _loc4_:* = null as IMap;
         var _loc1_:String = "echidnaTFs";
         var _loc2_:int = 0;
         get_mutations().initTransformation(null,3);
         get_player().refillHunger(40);
         if(Utils.rand(4) == 0 && get_changes() < get_changeLimit() && get_player().hair.type != 0 && get_player().hair.type != 5)
         {
            outputText("[pg]你的头皮感觉非常奇怪，但这种感觉很短暂。你摸了摸头发，立刻注意到了变化。<b>看起来你的头发又恢复正常了！</b>");
            get_player().hair.type = 0;
            set_changes(get_changes() + 1);
         }
         if(Utils.rand(4) == 0 && get_changes() < get_changeLimit() && get_player().arms.type == 1)
         {
            outputText("[pg]你手臂上的羽毛完全脱落了，<b>只留下下面的[skinfurscales]。</b>");
            get_player().arms.set_type(0);
            set_changes(get_changes() + 1);
         }
         if(Utils.rand(3) == 0 && get_changes() < get_changeLimit() && get_player().hasGills())
         {
            get_mutations().updateGills();
         }
         if(Utils.rand(3) == 0 && get_changes() < get_changeLimit() && get_player().eyes.type == 1 || get_player().eyes.type == 7)
         {
            outputText("[pg]你的眼睛开始痛苦地跳动，视线最终变暗。你摸了摸头检查眼睛，却发现它们已经改变了。<b>你现在拥有人类的眼睛了！</b>");
            get_player();
            get_player().eyes.count = 2;
            set_changes(get_changes() + 1);
         }
         if(Utils.rand(3) == 0 && get_changes() < get_changeLimit() && get_player().averageNipplesPerBreast() > 4)
         {
            outputText("[pg]你的乳头感到一阵紧绷，每个乳房上的四个乳头中有三个完全消退，剩下的乳头移到了乳房正中。<b>你现在每个乳房上只剩下一个乳头了。</b>");
            _loc2_ = 0;
            while(_loc2_ < int(get_player().breastRows.length))
            {
               get_player().breastRows[_loc2_].nipplesPerBreast = 1;
               _loc2_++;
            }
            set_changes(get_changes() + 1);
         }
         if(get_mutations().tfNoFur() && Utils.rand(3) == 0 && get_changes() < get_changeLimit() && !get_player().hasFur())
         {
            outputText("[pg]你打了个寒颤，觉得有点冷。就在你希望有什么东西能保暖的时候，你的愿望似乎被满足了；<b>你的全身开始长出皮毛！</b>你惊慌地扯了扯那些毛丛，但它们扎根得很牢，而且……其实还挺柔软的。哈。");
            get_player().skin.adj = "";
            get_player().skin.desc = "fur";
            get_player().skin.type = 1;
            get_player().skin.furColor = "棕色";
            get_player().underBody.restore();
            set_changes(get_changes() + 1);
         }
         if(Utils.rand(3) == 0 && get_changes() < get_changeLimit() && get_player().ears.type != 16)
         {
            outputText("[pg]");
            if(get_player().ears.type == 6)
            {
               outputText("你感到爬行类耳朵里传来一阵奇怪的瘙痒。当你抓挠它们时，你能感觉到鳞片剥落，只留下光滑圆润的耳洞。");
            }
            else
            {
               outputText("头皮感到一阵紧绷，将你的耳朵从原本的形状拉扯成中间带孔的小凸起。");
            }
            outputText("<b>你现在有了针鼹的耳朵！</b>");
            get_player().ears.type = 16;
            set_changes(get_changes() + 1);
         }
         if(Utils.rand(3) == 0 && get_changes() < get_changeLimit() && get_player().ears.type == 16 && get_player().tail.type != 23)
         {
            outputText("[pg]");
            switch(get_player().tail.type)
            {
               case 0:
                  outputText("你感到脊椎底部传来一阵短暂的刺痛。伸手摸向身后，你发现[ass]上方长出了一个小小的肉桩，勉强算得上一条尾巴。");
                  break;
               case 1:
                  if(get_player().isTaur())
                  {
                     outputText("你那闪亮的马尾巴上的毛发全部脱落，开始感到一阵寒意。它变得紧绷起来，大部分长度缩回了你的体内，只留下一个小小的肉桩作为尾巴。这条新的、不协调的尾巴长在你的马下半身上看起来有点奇怪。");
                  }
                  else
                  {
                     outputText("你闪亮的马尾巴开始感到一阵寒意，所有的毛发都脱落了。随着大部分尾巴缩回体内，它变得紧绷起来，只留下一个小小的肉桩作为尾巴。");
                  }
                  break;
               case 2:
                  outputText("你那摇摆的狗尾巴开始感到发凉，上面的毛发全部脱落。它变得紧绷起来，大部分尾巴缩回了你的体内，只留下一个小肉桩作为尾巴。");
                  break;
               case 4:
                  outputText("你那绳索般的牛尾巴开始感到发凉，上面的毛发全部脱落。它变得紧绷起来，大部分尾巴缩回了你的体内，只留下一个小肉桩作为尾巴。");
                  break;
               case 8:
                  outputText("你那长长的猫尾巴开始感到发凉，上面的毛发全部脱落。它变得紧绷起来，大部分尾巴缩回了你的体内，只留下一个小肉桩作为尾巴。");
                  break;
               case 9:
               case 14:
                  outputText("你那长长的锥形尾巴变得紧绷起来，大部分长度缩回了你的体内，只留下一个小小的肉桩作为尾巴。你现在有了一条针鼹尾巴！");
                  break;
               case 10:
                  outputText("你那毛茸茸的小兔尾巴开始感到发凉，上面的毛发一团团地脱落，只留下一个小肉桩作为尾巴。");
                  break;
               case 11:
                  outputText("你感到一阵轻微的酥麻，你的尾羽一根接一根地脱落，只留下一个小肉桩作为尾巴。");
                  break;
               case 12:
                  outputText("你那锥形的袋鼠尾巴上的毛发全部脱落，开始感到一阵寒意。它变得紧绷起来，大部分长度缩回了你的体内，只留下一个小小的肉桩作为尾巴。");
                  break;
               case 13:
                  outputText("你那摇摆的狐狸尾巴上的毛发全部脱落，开始感到一阵寒意。它变得紧绷起来，大部分长度缩回了你的体内，只留下一个小小的肉桩作为尾巴。");
                  break;
               case 15:
                  outputText("你那带有环纹的浣熊尾巴上的毛发全部脱落，开始感到一阵寒意。它变得紧绷起来，大部分长度缩回了你的体内，只留下一个小小的肉桩作为尾巴。");
                  break;
               case 16:
                  outputText("你光秃秃的老鼠尾巴变得紧绷起来，大部分尾巴缩回体内，只留下一个小小的肉桩作为尾巴。");
                  break;
               case 17:
                  outputText("你锥形的雪貂尾巴开始感到一阵寒意，所有的毛发都脱落了。随着大部分尾巴缩回体内，它变得紧绷起来，只留下一个小小的肉桩作为尾巴。");
                  break;
               case 22:
                  outputText("你长长的犀牛尾巴尖开始发痒，毛发开始脱落。随着大部分尾巴缩回体内，整条尾巴变得紧绷起来，只留下一个小小的肉桩作为尾巴。");
                  break;
               default:
                  outputText("你呻吟着，感觉到你的尾巴在移动和重塑。当这种感觉结束时，你发现你只剩下一个小小的肉桩作为尾巴。");
            }
            outputText("<b>你现在长出了一条针鼹尾巴！</b>");
            get_player().tail.type = 23;
            set_changes(get_changes() + 1);
         }
         if(Utils.rand(3) == 0 && get_changes() < get_changeLimit() && get_player().ears.type == 16 && get_player().tail.type == 23 && get_player().lowerBody.type != 23)
         {
            outputText("[pg]");
            switch(get_player().lowerBody.type)
            {
               case 0:
                  outputText("你感到脚趾甲处传来一阵剧烈的刺痛，而且每秒钟都在加剧。当你检查疼痛的脚趾时，你震惊地看到你的脚趾甲正在变长，最终变成了锋利的爪子。看来你的脚底也发生了变化。它们长出了肉垫！");
                  break;
               case 1:
               case 21:
                  outputText("你的蹄子突然传来一阵酥麻感，让你几乎跌倒在地。它们麻木了吗？当你检查你的脚时，你发现它们不再是蹄子了！事实上，它们看起来很像你以前的人类双脚。唯一的区别是你的脚趾长出了爪子，而且脚底长出了肉垫。");
                  break;
               case 2:
               case 9:
               case 12:
               case 14:
               case 17:
               case 19:
               case 20:
                  outputText("哎哟！你的爪子怎么了？好痛！你坐下来，花了一点时间检查你疼痛的爪子。这是什么？看来它们变了！事实上，它们看起来很像你以前的人类双脚。唯一的区别是你的脚趾长出了爪子，而且脚底长出了肉垫。");
                  break;
               case 3:
               case 32:
                  outputText("你瘫倒在地，一阵剧痛席卷了你的[if (isNaga) {蛇形}]尾巴。疼痛很快变得如此剧烈，以至于你当场昏了过去。最终你醒来，发现你不再拥有[if (isNaga) {蛇的下半身|[if (isMer) {鱼的下半身|作为下半身的尾巴}]}]。你又有了两条腿，你的脚看起来很像你以前的人类脚。唯一的区别是你的脚趾有爪子，脚底有肉垫。");
                  break;
               case 5:
               case 6:
               case 10:
               case 13:
               case 18:
                  outputText("你的脚感觉很奇怪，几乎就像是麻木了一样。它们怎么了？你低头一看，震惊地发现你的脚变了。事实上，它们看起来很像你以前的人类双脚。唯一的区别是你的脚趾长出了爪子，而且脚底长出了肉垫。");
                  break;
               case 8:
                  outputText("你瘫倒在地，一阵剧痛包围了你无定形的下半身。疼痛很快变得如此剧烈，以至于你当场昏了过去。最终你醒来，发现你不再拥有史莱姆般的下半身。你又有了两条腿，而且你的脚看起来很像你以前的人类脚。唯一的区别是你的脚趾长有爪子，而且脚底有肉垫。");
                  break;
               default:
                  outputText("你的脚感觉很奇怪，几乎就像是麻木了一样。它们怎么了？你低头一看，震惊地发现你的脚变了。事实上，它们看起来很像你以前的人类双脚。唯一的区别是你的脚趾长出了爪子，而且脚底长出了肉垫。");
            }
            outputText("<b>它们实际上看起来就像针鼹的脚！</b>");
            get_player().lowerBody.type = 23;
            get_player().lowerBody.legCount = 2;
            set_changes(get_changes() + 1);
         }
         if(Utils.rand(3) == 0 && get_changes() < get_changeLimit() && get_player().hasCock() && get_player().countCocksOfType(CockTypesEnum.ECHIDNA) < get_player().cockTotal())
         {
            outputText("[pg]");
            if(get_player().cockTotal() == 1)
            {
               outputText("你的[cock]突然莫名其妙地变得坚硬如石。你" + get_player().clothedOrNakedLower("把它从你的[armor]里掏出来，就在食物帐篷的正中央，看着","看着") + "它开始发生变化。它的颜色变成了粉红色，你感觉到龟头处传来一阵刺痛，随后它分裂成了四个头。" + (get_player().hasSheath() ? "" : "最后，在根部形成了一个肉质的阴茎鞘，完成了变形。") + "它射精后便软了下来，缩回了你的阴茎鞘中。");
            }
            else
            {
               outputText("你的其中一根阴茎开始感觉有些奇怪。你" + get_player().clothedOrNakedLower("把那根作怪的肉棒从你的[armor]里掏出来，就在食物帐篷的正中央，看着","看着") + "它开始发生变化。它的颜色变成了粉红色，你感觉到龟头处传来一阵刺痛，随后它分裂成了四个头。" + (get_player().hasSheath() ? "" : "最后，在根部形成了一个肉质的阴茎鞘，完成了变形。") + "它射精后便软了下来，缩回了你的阴茎鞘中。");
            }
            outputText("<b>你现在拥有了一根针鼹的阴茎！</b>");
            _loc2_ = 0;
            while(_loc2_ < int(get_player().cocks.length))
            {
               if(get_player().cocks[_loc2_].get_cockType() != CockTypesEnum.ECHIDNA)
               {
                  get_player().cocks[_loc2_].set_cockType(CockTypesEnum.ECHIDNA);
                  break;
               }
               _loc2_++;
            }
            set_changes(get_changes() + 1);
         }
         if(Utils.rand(3) == 0 && get_changes() < get_changeLimit() && get_player().echidnaScore() >= 2 && get_player().tongue.type != 4)
         {
            outputText("[pg]你感觉到舌头传来一阵不舒服的压迫感，它开始发生变化。片刻之后，你就能看到自己那又长又细的舌头了。它至少有一英尺长。<b>你现在拥有了一条针鼹的舌头！</b>");
            get_player().tongue.type = 4;
            set_changes(get_changes() + 1);
         }
         if(Utils.rand(4) == 0 && get_changes() < get_changeLimit() && FlagDict_Impl_.arrayReadInt(KFLAGS.flags,66) == 1 && get_player().hair.type == 0)
         {
            outputText("[pg]你的头皮开始发麻，头发成把成把地掉落，让你变成了一个光头。不过你并没有秃太久。一阵令人不适的压力席卷了你的整个头皮，坚硬的棘刺开始从你的毛孔中长出。当它们长到齐肩长时，生长停止了。<b>你现在的头发变成了棘刺！</b>");
            get_player().hair.type = 5;
            set_changes(get_changes() + 1);
         }
         if(get_mutations().tfNoFur() && Utils.rand(4) == 0 && get_changes() < get_changeLimit() && get_player().hasFur() && get_player().ears.type == 16 && get_player().tail.type == 23 && get_player().tongue.type == 4)
         {
            outputText("你大声呻吟着，你脸上的骨骼开始重塑和重新排列。最明显的是，你感觉到你的嘴巴拉长成了一个又长又细的吻部。<b>你现在有了一张针鼹脸！</b>");
            get_player().face.type = 22;
            set_changes(get_changes() + 1);
         }
         if(Utils.rand(4) == 0 && get_changes() < get_changeLimit() && get_player().echidnaScore() >= 2 && FlagDict_Impl_.arrayReadInt(KFLAGS.flags,66) == 0)
         {
            outputText("[pg]你的头皮一阵奇怪的发麻。你惊慌失措地摸向你的[hair]，但谢天谢地，它似乎没有变化。\n");
            outputText("(<b>你的头发停止了生长。</b>)");
            set_changes(get_changes() + 1);
            _loc4_ = KFLAGS.flags;
            FlagDict_Impl_.arrayWriteInt(_loc4_,66,FlagDict_Impl_.arrayReadInt(_loc4_,66) + 1);
         }
         if(Utils.rand(3) == 0 && get_changes() < get_changeLimit() && get_player().hasCock() && get_player().cumMultiplier < 25)
         {
            _loc3_ = 1 + Utils.rand(4);
            if(get_player().hasPerk(PerkLib.MessyOrgasms))
            {
               _loc3_ += Utils.rand(10);
            }
            _loc3_ *= 0.1;
            var _temp_1:* = get_player();
            _temp_1.cumMultiplier = _temp_1.cumMultiplier + _loc3_;
            if(get_player().balls == 0)
            {
               outputText("[pg]你感到肠胃里一阵翻江倒海，你体内的某些东西发生了变化。");
            }
            if(get_player().balls > 0)
            {
               outputText("[pg]你感觉到你的[balls]里一阵翻腾。它很快就平息了，让它们感觉变得更紧实了一些。");
            }
            outputText("随着这种变化，一点乳白色的预精从你的[cocks]里滴落下来。");
            set_changes(get_changes() + 1);
         }
         if(Utils.rand(3) == 0 && get_changes() < get_changeLimit() && get_player().get_gender() == 1 && get_player().averageBreastSize() > 2 && !get_hyper())
         {
            outputText("[pg]你托住你的乳房，它们开始奇怪地刺痛起来。你甚至能感觉到它们在你的手中变小了！");
            get_player().shrinkTits();
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
         if(Utils.rand(4) == 0 && get_changes() < get_changeLimit() && get_player().echidnaScore() >= 3 && get_player().hasVagina() && !get_player().hasPerk(PerkLib.Oviposition))
         {
            get_mutations().updateOvipositionPerk(_loc1_);
         }
         if(Utils.rand(3) == 0 && (Utils.rand(2) == 0 || !get_player().get_inHeat()) && get_player().hasVagina() && get_player().statusEffectv2(StatusEffects.Heat) < 30)
         {
            get_player().goIntoHeat(true);
         }
         if(Utils.rand(2) == 0 && get_player().thickness < 90)
         {
            get_player().modThickness(90,2);
         }
         if(Utils.rand(2.4) == 0 && get_changes() < get_changeLimit() && get_player().hasVagina() && get_player().mf("m","f") == "f" && get_player().hips.rating < 14)
         {
            outputText("[pg]结束后，你发现你的步态改变了。你的[hips]变宽了吗？");
            var _temp_2:* = get_player().hips;
            _temp_2.rating = _temp_2.rating + 1;
            set_changes(get_changes() + 1);
         }
         _loc4_ = KFLAGS.flags;
         FlagDict_Impl_.arrayWriteInt(_loc4_,2077,FlagDict_Impl_.arrayReadInt(_loc4_,2077) + get_changes());
         return false;
      }
   }
}

