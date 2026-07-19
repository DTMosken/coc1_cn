package classes.items.consumables
{
   import classes.DynStat;
   import classes.Player;
   import classes.StatusEffects;
   import classes._FlagDict.FlagDict_Impl_;
   import classes.globalFlags.KFLAGS;
   import classes.internals.Utils;
   import classes.items.Consumable;
   import classes.items.ConsumableLib;
   import classes.items.Mutations;
   import flash.Boot;
   import haxe.IMap;
   
   public class MouseCocoa extends Consumable
   {
      
      public function MouseCocoa()
      {
         if(Boot.skip_constructor)
         {
            return;
         }
         super("MouseCo","Mouse Cocoa","a handful of mouse cocoa",6,"A handful of rare aromatic beans with sharp creases in the middle, making them look like small mouse ears. Allegedly very popular and plentiful before the mice-folk were wiped out.");
      }
      
      override public function useItem() : Boolean
      {
         var _loc3_:* = null as Player;
         var _loc4_:* = null as Player;
         var _loc5_:Boolean = false;
         var _loc6_:* = null as ConsumableLib;
         var _loc1_:String = "mouseCocoa";
         var _loc2_:int = 0;
         get_mutations().initTransformation([2,3,3]);
         outputText("你把几颗豆子塞进嘴里吸吮；它们立刻回报给你一种油润的巧克力味，还带着一丝苦涩。几分钟里，你");
         if(!get_player().isTaur())
         {
            outputText("坐着");
         }
         outputText("享受着这味道。");
         if(get_player().get_tallness() >= 45 && get_changes() < get_changeLimit() && Utils.rand(3) == 0)
         {
            if(!get_player().isTaur())
            {
               outputText("[pg]你坐在石头上享受着美味，[feet]无聊地敲打着石头；过了好几分钟你才意识到，你的脚够不到刚坐下时那么低的地方了！你震惊地猛然站起跳下石头，身体的反应比以前更灵敏，差点让你向前摔倒！你试探性地在原地活动了一下，低头看着现在离你更近的[feet]；那种更加紧凑敏捷的感觉依然存在。");
            }
            else
            {
               outputText("[pg]你一边吃一边在原地无聊地小跑，随着越来越觉得无聊，你的动作也越来越快；在某一步时，地面突然出现在你脚下，你重重地踩了上去，原本你以为还要再往下几英寸才会接触到地面！你低头看去，发现视线比以前更清晰了——你能更清楚地看清泥土。看起来你变矮了一些，但是……你现在感觉太兴奋了，根本不在乎这些。你只想四处奔跑。");
            }
            dynStats(DynStat.Spe(1));
            _loc3_ = get_player();
            _loc3_.set_tallness(_loc3_.get_tallness() - 1);
            if(get_player().get_tallness() > 60)
            {
               _loc4_ = get_player();
               _loc4_.set_tallness(_loc4_.get_tallness() - 1);
            }
            if(get_player().get_tallness() > 70)
            {
               _loc4_ = get_player();
               _loc4_.set_tallness(_loc4_.get_tallness() - 1);
            }
            if(get_player().get_tallness() > 80)
            {
               _loc4_ = get_player();
               _loc4_.set_tallness(_loc4_.get_tallness() - 1);
            }
            if(get_player().get_tallness() > 90)
            {
               _loc4_ = get_player();
               _loc4_.set_tallness(_loc4_.get_tallness() - 2);
            }
            if(get_player().get_tallness() > 100)
            {
               _loc4_ = get_player();
               _loc4_.set_tallness(_loc4_.get_tallness() - 2);
            }
            set_changes(get_changes() + 1);
         }
         if(get_player().get_tou100() > 50 && get_changes() < get_changeLimit() && Utils.rand(3) == 0)
         {
            outputText("[pg]你感觉自己变得没那么强壮了，无论是身体上还是精神上。事实上，你现在更希望能找个地方躲起来，直到恢复自信。接下来的几分钟里，你都处于一种像老鼠一样胆小的情绪中——即使在那之后，你也无法完全找回之前那种不可战胜的感觉。");
            dynStats(DynStat.Tou(-1));
            if(get_player().get_tou100() >= 75)
            {
               dynStats(DynStat.Tou(-1));
            }
            if(get_player().get_tou100() >= 90)
            {
               dynStats(DynStat.Tou(-1));
            }
         }
         if(get_player().get_tallness() < 60 && (get_player().analCapacity() < 100 || get_player().vaginalCapacity() < 100 && get_player().hasVagina()) && get_changes() < get_changeLimit() && Utils.rand(3) == 0)
         {
            outputText("[pg]你的");
            if(get_player().vaginalCapacity() < 100 && get_player().hasVagina())
            {
               outputText("[vagina]");
            }
            else
            {
               outputText("[asshole]");
            }
            outputText("有些发痒，你羞涩地试图去抓它，环顾四周看看是否有人在看你。");
            if(get_player().isTaur())
            {
               outputText("你退到一个看起来不错的石头旁，将你的后臀在上面摩擦，却惊讶地发现你的小穴在石头表面平滑地分开了，比你习惯的还要宽！");
            }
            else
            {
               outputText("你将一只手滑入你的[armor]中，用力地揉搓；你的小穴更容易张开，你的手指也比你习惯的插得更深！");
            }
            outputText("这种感觉很不寻常——说不上坏，但绝对很怪异。你现在比大多数潜在的伴侣都要娇小，所以你能看出这会有多方便，但是……你摇了摇头，");
            if(get_player().isTaur())
            {
               outputText("从你昔日的沉积岩情人身边退开");
            }
            else
            {
               outputText("把手抽出来");
            }
            outputText("。");
            dynStats(DynStat.Lust(10 + get_player().sens / 5));
            if(get_player().vaginalCapacity() < 100 && get_player().hasVagina())
            {
               if(!get_player().hasStatusEffect(StatusEffects.BonusVCapacity))
               {
                  get_player().createStatusEffect(StatusEffects.BonusVCapacity,0,0,0,0);
               }
               get_player().addStatusValue(StatusEffects.BonusVCapacity,1,5);
            }
            else
            {
               if(!get_player().hasStatusEffect(StatusEffects.BonusACapacity))
               {
                  get_player().createStatusEffect(StatusEffects.BonusACapacity,0,0,0,0);
               }
               get_player().addStatusValue(StatusEffects.BonusACapacity,1,5);
            }
            set_changes(get_changes() + 1);
         }
         if(get_player().statusEffectv2(StatusEffects.Heat) < 30 && Utils.rand(2) == 0 && get_changes() < get_changeLimit())
         {
            _loc5_ = get_player().get_inHeat();
            if(get_player().goIntoHeat(false))
            {
               if(_loc5_)
               {
                  outputText("[pg]你的子宫感到一阵空虚的疼痛，体温也随之飙升。尽管你努力克制，但还是忍不住幻想被精液填满，里里外外都被浸透，足以生下一打以上的后代。");
                  if(!get_player().hasItem(get_consumables().MINOCUM))
                  {
                     outputText("<b>你的发情期和你的生育能力一样增强了，而且增强的幅度相当大！</b>");
                  }
                  else if(get_player().get_lust() < get_player().maxLust() || get_player().isTaur())
                  {
                     outputText("你甚至拿出一瓶牛头人的精液，花了几分钟考虑直接倒进你的[vagina]里的可行性，但在你拧开瓶盖时恢复了理智，把它放在了一边。<b>尽管如此，你的发情期比以往任何时候都要强烈，你日益肥沃的身体几乎在乞求肉棒——你将很难抗拒任何靠近的肉棒！</b>");
                  }
                  else
                  {
                     outputText("极度饥渴的你拿出了你的牛头人精液瓶，两下就弄破了封口，然后躺下，抬高臀部，把它倒在你贪婪的小穴上。黏糊糊的种子倒进你的体内，你断断续续地高潮着，颤抖着，无法将瓶子固定在原位，精液涂满了你的阴唇。<b>当一种朦胧的睡意侵入你的大脑时，你祈祷着能怀孕，并梦想着你日益肥沃的身体将孕育出儿子……如果你体内没有怀上孩子，你会发疯的</b>。");
                     get_player().minoCumAddiction(5);
                     get_player().knockUp(2,432,175);
                     _loc6_ = get_consumables();
                     get_player().consumeItem(_loc6_.MINOCUM);
                  }
               }
               else
               {
                  outputText("[pg]你的体内感觉……很宽敞。甚至可以说是包容。你现在可能可以怀上一整窝小[name]。伴随着突然涌起的欲望，你偷偷地环顾四周，寻找任何有生育能力的雄性。你摇了摇头，试图理清思绪，但被精液填满的白日梦又悄悄地爬了回来——看来你的身体正打算探索你新生育能力的极限。<b>你发情了，而且在好几个意义上都可以怀孕！</b>");
                  var _temp_1:* = get_player();
                  _temp_1.fertility = _temp_1.fertility + 1;
               }
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
         if(get_player().ears.type != 12 && get_changes() < get_changeLimit() && Utils.rand(4) == 0)
         {
            outputText("[pg]你的耳朵");
            if(get_player().ears.type == 1 || get_player().ears.type == 3 || get_player().ears.type == 2 || get_player().ears.type == 7 || get_player().ears.type == 8)
            {
               outputText("突然缩小");
            }
            else
            {
               outputText("从头上拉开");
            }
            outputText("，就像被捏住了一样，你可以清楚地感觉到耳廓在疼痛中变成了圆形。你伸手去试图按摩掉它们的刺痛，<b>当你发现一对毛茸茸的老鼠耳朵从你的[hair]中探出来时，你并没有感到太惊讶。</b>");
            get_player().ears.type = 12;
            set_changes(get_changes() + 1);
         }
         if(get_player().ears.type == 12 && get_player().tail.type != 16 && get_changes() < get_changeLimit() && Utils.rand(4) == 0)
         {
            if(get_player().tail.type > 0)
            {
               outputText("[pg]你的尾巴同时紧绷发痒，让你不知道是该大叫还是该去抓它。随着疼痛占据主导地位，这个问题很快就有了答案；向后看是一件非常费力的事情，但当你勉强做到时，你可以看到你旧的附肢");
               if(get_player().tail.type == 1)
               {
                  outputText("正在伸长");
               }
               else
               {
                  outputText("正在压缩");
               }
               outputText("成一条又长又细的线。伴随着一阵颤抖，它开始脱落，直到完全、赤裸裸地光秃秃的。<b>你的新老鼠尾巴看起来有点憔悴。</b>");
            }
            else
            {
               outputText("[pg]你的背后冒出了一个小肉包，你转头看去。就在这时，你的脖子像被鞭打一样酸痛，你呻吟着，感觉脊椎像被拉扯的绳子一样平滑地向下移动，在后面长出新的椎骨，将那个肉包扩展成一条光秃秃的、细长的、锥形的尾巴。<b>你揉着酸痛的脖子，盯着你新长出的老鼠尾巴。</b>");
            }
            get_player().tail.type = 16;
            set_changes(get_changes() + 1);
         }
         if(get_mutations().tfNoFur() && get_player().ears.type == 12 && (get_player().face.type == 0 || get_player().face.type == 4 || get_player().face.type == 8 || get_player().face.type == 10 || get_player().face.type == 13) && Utils.rand(4) == 0 && get_changes() < get_changeLimit())
         {
            outputText("[pg]你的牙齿不由自主地摩擦着，你感到鼻子下方有一股奇怪而持续的压力。当你张开嘴，用舌头舔过它们时，你能感觉到");
            if(get_player().face.type != 0)
            {
               outputText("尖锐的牙齿在退化，而且");
            }
            outputText("你的门牙在变长。没过多久，它们就比旁边的牙齿长了一倍，明显的生长停止了，但那种压力并没有完全消失。<b>好吧，你现在有了老鼠的门牙，你的脸有点疼——不知道它们会不会继续长？</b>");
            get_player().face.type = 15;
            set_changes(get_changes() + 1);
         }
         if(get_mutations().tfNoFur() && get_player().hasFur() && get_player().face.type != 16 && (get_player().face.type != 0 || get_player().face.type != 4 || get_player().face.type != 8 || get_player().face.type != 10 || get_player().face.type != 13) && Utils.rand(4) == 0 && get_changes() < get_changeLimit())
         {
            outputText("[pg]一阵头晕目眩袭来，你晕了过去。在无意识中，你梦见自己在咀嚼——食物、木头、布料、纸张、皮革，甚至金属……任何你能塞进嘴里的东西，即使它们尝起来没什么味道。几分钟里，你只是不停地咀嚼着一堆普通的物品，品味着每一种物品在你牙齿上的质感，直到最后你醒来。你的牙齿在活动，感觉比以前更长、更突出了，你找了找自己的倒影。<b>你的脸变了，看起来像老鼠，甚至连胡须都有了！</b>");
            get_player().face.type = 16;
            set_changes(get_changes() + 1);
         }
         if(get_mutations().tfNoFur() && (!get_player().hasFur() || get_player().hasFur() && (get_player().skin.furColor != "brown" && get_player().skin.furColor != "white")) && get_changes() < get_changeLimit() && Utils.rand(4) == 0)
         {
            if(!get_player().hasFur())
            {
               outputText("[pg]你的[skinfurscales]发痒");
               if(!get_player().hasPlainSkin())
               {
                  outputText("");
               }
               outputText("遍布全身");
               if(get_player().tail.type > 0)
               {
                  outputText("，除了你的尾巴");
               }
               outputText("。你既惊恐又怀疑，把手缩了回来，试图强迫自己不去抓挠，但这并没有什么用。一簇簇");
               _loc2_ = Utils.rand(10);
               if(_loc2_ < 8)
               {
                  outputText("棕色的");
                  get_player().skin.furColor = "brown";
               }
               else
               {
                  outputText("白色的");
                  get_player().skin.furColor = "white";
               }
               outputText("毛发开始穿透你的皮肤");
               if(get_player().hasScales())
               {
                  outputText("，伴随着轻微的刺痛感把你的鳞片顶了出去");
               }
               outputText("，为你解决了这个问题。<b>你现在长出了毛发。</b>");
            }
            else
            {
               outputText("[pg]你的毛发竖了起来，仿佛要从你身上跳下来——接下来它确实这么做了。你惊愕地看着你的毛发离你而去，但很快又被另一层");
               _loc2_ = Utils.rand(10);
               if(_loc2_ < 8)
               {
                  outputText("棕色的");
                  get_player().skin.furColor = "brown";
               }
               else
               {
                  outputText("白色的");
                  get_player().skin.furColor = "white";
               }
               outputText("绒毛，很快就长成了丰满的皮毛。");
            }
            get_player().skin.adj = "";
            get_player().skin.desc = "fur";
            get_player().skin.type = 1;
            get_player().underBody.restore();
            set_changes(get_changes() + 1);
         }
         get_player().refillHunger(10);
         var _loc7_:IMap = KFLAGS.flags;
         FlagDict_Impl_.arrayWriteInt(_loc7_,2077,FlagDict_Impl_.arrayReadInt(_loc7_,2077) + get_changes());
         return false;
      }
   }
}

