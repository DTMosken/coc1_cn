package classes.items.consumables
{
   import classes.BreastRow;
   import classes.Cock;
   import classes.DynStat;
   import classes.PerkLib;
   import classes.Player;
   import classes.StatusEffects;
   import classes._FlagDict.FlagDict_Impl_;
   import classes.bodyParts.Hips;
   import classes.globalFlags.KFLAGS;
   import classes.internals.Utils;
   import classes.items.Consumable;
   import classes.items.Mutations;
   import flash.Boot;
   import haxe.IMap;
   
   public class TrapOil extends Consumable
   {
      
      public function TrapOil()
      {
         if(Boot.skip_constructor)
         {
            return;
         }
         super("TrapOil","Trap Oil","a vial of trap oil",6,"A round, opaque glass vial filled with a clear, viscous fluid. It has a symbol inscribed on it, a circle with a cross and arrow pointing out of it in opposite directions. It looks and smells entirely innocuous.");
      }
      
      override public function useItem() : Boolean
      {
         var _loc3_:* = null as Hips;
         var _loc4_:* = null as Player;
         var _loc5_:* = null as Player;
         var _loc1_:String = "trapOil";
         var _loc2_:int = 0;
         get_mutations().initTransformation([2,3,3]);
         outputText("你倒了一些油在手上，然后");
         if(get_player().cor < 30)
         {
            outputText("犹豫地");
         }
         else if(get_player().cor > 70)
         {
            outputText("急切地");
         }
         outputText("将它涂抹在你的手臂和胸膛上。这种物质很温暖，覆盖在皮肤上带来极其轻微的麻木感；它很快渗入你的皮肤，让你感觉光滑柔润。");
         if(get_player().get_spe100() < 100 && Utils.rand(3) == 0 && get_changes() < get_changeLimit())
         {
            outputText("[pg]你感觉脚步轻快，脚尖更轻盈了；你觉得自己可以躲闪、飞奔或跳开任何东西。");
            dynStats(DynStat.Spe(1));
         }
         else if(get_player().get_str100() > 40 && Utils.rand(3) == 0 && get_changes() < get_changeLimit())
         {
            outputText("[pg]随着你的四肢失去质量，一种无力感笼罩了你，让你感觉更加虚弱和渺小。");
            dynStats(DynStat.Str(-1));
         }
         if(get_player().get_sens100() < 70 && get_player().hasCock() && Utils.rand(3) == 0 && get_changes() < get_changeLimit())
         {
            outputText("[pg]一阵微风拂过，你的皮肤微微发麻。你对身体的触觉变得更加敏感了。");
            dynStats(DynStat.Sens(5));
         }
         if(get_player().get_lib100() < 70 && get_player().hasVagina() && Utils.rand(3) == 0 && get_changes() < get_changeLimit())
         {
            outputText("[pg]你感觉血液在加速流动并沸腾，一种想要……狩猎的欲望在你体内滋生。");
            dynStats(DynStat.Lib(2));
            if(get_player().get_lib100() < 30)
            {
               dynStats(DynStat.Lib(2));
            }
         }
         if(get_player().thickness > 40 && Utils.rand(3) == 0 && get_changes() < get_changeLimit())
         {
            outputText("[pg]你感觉腹部有一种奇怪的紧绷感，仿佛你变得更窄更苗条了。你皱着眉头往下看，然后转动手臂，仔细检查。是错觉还是你真的变瘦了？");
            get_player().modThickness(40,3);
            set_changes(get_changes() + 1);
         }
         if(get_player().hips.rating >= 10 && Utils.rand(4) == 0 && get_changes() < get_changeLimit())
         {
            outputText("[pg]你试探性地摸了摸大腿。这不仅仅是你的想象；你的腰部确实瘦了一点。");
            _loc3_ = get_player().hips;
            --_loc3_.rating;
            if(get_player().hips.rating > 15)
            {
               var _temp_1:* = get_player().hips;
               _temp_1.rating = _temp_1.rating - (2 + Utils.rand(3));
            }
            set_changes(get_changes() + 1);
         }
         if(get_player().hips.rating < 6 && Utils.rand(4) == 0 && get_changes() < get_changeLimit())
         {
            outputText("[pg]你试探性地摸了摸大腿。你觉得你的腰部可能长了一点肉。");
            var _temp_2:* = get_player().hips;
            _temp_2.rating = _temp_2.rating + 1;
            set_changes(get_changes() + 1);
         }
         if(get_player().biggestTitSize() > 1 && Utils.rand(4) == 0 && get_changes() < get_changeLimit())
         {
            outputText("[pg]你倒吸一口凉气，感觉胸部和[fullChest]周围有一种压迫感。然而，这种感觉很快就消退了，让你觉得上半身减轻了相当多的重量。");
            _loc2_ = 0;
            while(_loc2_ < get_player().bRows())
            {
               if(get_player().breastRows[_loc2_].breastRating > 70)
               {
                  var _temp_3:* = get_player().breastRows[_loc2_];
                  _temp_3.breastRating = _temp_3.breastRating - (Utils.rand(3) + 15);
               }
               else if(get_player().breastRows[_loc2_].breastRating > 50)
               {
                  var _temp_4:* = get_player().breastRows[_loc2_];
                  _temp_4.breastRating = _temp_4.breastRating - (Utils.rand(3) + 10);
               }
               else if(get_player().breastRows[_loc2_].breastRating > 30)
               {
                  var _temp_5:* = get_player().breastRows[_loc2_];
                  _temp_5.breastRating = _temp_5.breastRating - (Utils.rand(3) + 7);
               }
               else if(get_player().breastRows[_loc2_].breastRating > 15)
               {
                  var _temp_6:* = get_player().breastRows[_loc2_];
                  _temp_6.breastRating = _temp_6.breastRating - (Utils.rand(3) + 4);
               }
               else
               {
                  var _temp_7:* = get_player().breastRows[_loc2_];
                  _temp_7.breastRating = _temp_7.breastRating - (2 + Utils.rand(2));
               }
               if(get_player().breastRows[_loc2_].breastRating < 1)
               {
                  get_player().breastRows[_loc2_].breastRating = 1;
               }
               _loc2_++;
            }
            set_changes(get_changes() + 1);
         }
         if(get_player().biggestTitSize() < 1 || get_player().breastRows[0].breastRating < 1 && Utils.rand(4) == 0 && get_changes() < get_changeLimit())
         {
            outputText("[pg]你感觉[fullChest]有一种隐约的肿胀感，你皱着眉头往下看。你的胸部似乎长了一点肉。虽然不足以引人注目，但是——你小心翼翼地托住自己——确实给了你一丝乳房的雏形。");
            get_player().breastRows[0].breastRating = 1;
            if(get_player().bRows() > 1)
            {
               _loc2_ = 1;
               while(_loc2_ < get_player().bRows())
               {
                  if(get_player().breastRows[_loc2_].breastRating < 1)
                  {
                     get_player().breastRows[_loc2_].breastRating = 1;
                  }
                  _loc2_++;
               }
            }
            set_changes(get_changes() + 1);
         }
         if(get_player().longestCockLength() >= 3.5 && get_player().hasCock() && Utils.rand(2) == 0 && get_changes() < get_changeLimit())
         {
            outputText("[pg]你猛地一缩，倒吸一口凉气，因为你的[cocks]突然变得");
            if(get_player().cockTotal() == 1)
            {
               outputText("");
            }
            outputText("变得异常敏感，并缩回了你的体内。你焦急地拉下内衣，检查你的下半身。让你松了一口气的是");
            if(get_player().cockTotal() == 1)
            {
               outputText("它");
            }
            else
            {
               outputText("它们");
            }
            outputText("还在，当你触摸");
            if(get_player().cockTotal() == 1)
            {
               outputText("它");
            }
            else
            {
               outputText("它们");
            }
            outputText("，然而敏感度消退了——你的双颊泛起红晕——");
            if(get_player().cockTotal() == 1)
            {
               outputText("它似乎");
            }
            else
            {
               outputText("它们似乎");
            }
            outputText("变小了。");
            _loc2_ = 0;
            while(_loc2_ < get_player().cockTotal())
            {
               if(get_player().cocks[_loc2_].cockLength >= 3.5)
               {
                  if(get_player().cocks[_loc2_].cockLength < 6 && get_player().cocks[_loc2_].cockLength >= 2.9)
                  {
                     var _temp_8:* = get_player().cocks[_loc2_];
                     _temp_8.cockLength = _temp_8.cockLength - 0.5;
                     if(get_player().cocks[_loc2_].cockThickness * 6 > get_player().cocks[_loc2_].cockLength)
                     {
                        var _temp_9:* = get_player().cocks[_loc2_];
                        _temp_9.cockThickness = _temp_9.cockThickness - 0.2;
                     }
                     if(get_player().cocks[_loc2_].cockThickness * 8 > get_player().cocks[_loc2_].cockLength)
                     {
                        var _temp_10:* = get_player().cocks[_loc2_];
                        _temp_10.cockThickness = _temp_10.cockThickness - 0.2;
                     }
                     if(get_player().cocks[_loc2_].cockThickness < 0.5)
                     {
                        get_player().cocks[_loc2_].cockThickness = 0.5;
                     }
                  }
                  var _temp_11:* = get_player().cocks[_loc2_];
                  _temp_11.cockLength = _temp_11.cockLength - 0.5;
                  get_player().increaseCock(_loc2_,Math.round(get_player().cocks[_loc2_].cockLength * 0.33) * -1);
               }
               _loc2_++;
            }
            set_changes(get_changes() + 1);
         }
         if(get_player().balls > 0 && get_player().hasCock() && (get_player().ballSize > 1 || !get_player().hasStatusEffect(StatusEffects.Uniball)) && Utils.rand(4) == 0 && get_changes() < get_changeLimit())
         {
            outputText("[pg]你感觉到你的[balls]周围有一种微妙的紧绷感。这种在你身体最敏感部位的感觉并不痛苦，但你的蛋蛋变小的感觉非常强烈，以至于你很难抑制住自己，只能深吸一口气。");
            _loc4_ = get_player();
            --_loc4_.ballSize;
            if(get_player().ballSize > 8)
            {
               _loc5_ = get_player();
               --_loc5_.ballSize;
            }
            if(get_player().ballSize > 10)
            {
               _loc5_ = get_player();
               --_loc5_.ballSize;
            }
            if(get_player().ballSize > 12)
            {
               _loc5_ = get_player();
               --_loc5_.ballSize;
            }
            if(get_player().ballSize > 15)
            {
               _loc5_ = get_player();
               --_loc5_.ballSize;
            }
            if(get_player().ballSize > 20)
            {
               _loc5_ = get_player();
               --_loc5_.ballSize;
            }
            if(get_player().ballSize < 1 && !get_player().hasStatusEffect(StatusEffects.Uniball))
            {
               outputText("当你的蛋蛋再次收紧并缩小时，你发出了一声呜咽。当你感觉到睾丸轻轻地压在你的[hips]上方时，你睁大了眼睛，你犹豫地摆动了几下臀部，证实了你的感觉——你的蛋蛋收得太紧了，它们不再悬挂在你的[cocks]下面，而是俏皮地向上挤压。你耳朵发热，小心翼翼地用手探索你的新阴囊。你发现虽然你仍然有[ballcount]，但你的蛋蛋现在看起来和感觉起来就像一个：一个可爱、紧致的小伪娘包裹，它温暖、持续地向上压在你的大腿交接处，不断地提醒着你它的存在。");
               get_player().createStatusEffect(StatusEffects.Uniball,0,0,0,0);
            }
            if(get_player().ballSize < 0.5)
            {
               get_player().ballSize = 0.5;
            }
            set_changes(get_changes() + 1);
         }
         if(get_player().ass.analWetness < 5 && Utils.rand(4) == 0 && get_changes() < get_changeLimit())
         {
            if(get_player().ass.analWetness < 4)
            {
               outputText("[pg]当你感觉到油腻的水分从你的[asshole]渗出时，你震惊地睁大了眼睛。你的屁眼变得更湿润、更柔软了。");
            }
            else
            {
               outputText("[pg]当清澈无味的油从你的[asshole]滴落时，你呻吟起来，这次的量足以弄脏你的[armor]。你的后庭感觉异常敏感、湿润且包容。你的屁股已经准备好被任何东西开垦，并且永远如此。");
            }
            var _temp_12:* = get_player().ass;
            _temp_12.analWetness = _temp_12.analWetness + 1;
            if(get_player().ass.analLooseness < 3)
            {
               var _temp_13:* = get_player().ass;
               _temp_13.analLooseness = _temp_13.analLooseness + 1;
            }
            set_changes(get_changes() + 1);
            dynStats(DynStat.Sens(2));
         }
         if(get_player().hasVagina() && Utils.rand(4) == 0 && get_changes() < get_changeLimit())
         {
            outputText("[pg]你皮肤上那种模糊的麻木感慢慢向下沉，当这种感觉集中在你的下腹部时，你把手放在了那里。");
            dynStats(DynStat.Sens(-2));
            if(get_player().fertility >= 30)
            {
               outputText("感觉你过度充血的生殖器官已经平静了一些。");
            }
            else if(get_player().fertility >= 5)
            {
               outputText("你感觉你的体内似乎干涸了一些；你感到一种奇怪的平静。");
            }
            else
            {
               outputText("虽然这种麻木感让你感到宁静，但伪娘油对你");
               if(get_player().fertility > 0)
               {
                  outputText("几乎");
               }
               outputText("不育的系统没有影响。");
               if(get_player().isCorruptEnough(70))
               {
                  outputText("出于某种原因，你无法像自然界预期的那样发挥作用的事实让你感到无助和顺从。也许现在成为一个有用生物的唯一方法就是找到一个占主导地位、有生育能力的生物，愿意用卵子填满你？你摇了摇头，把这个奇怪但又莫名诱人的想法甩掉。");
               }
            }
            var _temp_14:* = get_player();
            _temp_14.fertility = _temp_14.fertility - (1 + Utils.rand(3));
            if(get_player().fertility < 4)
            {
               get_player().fertility = 4;
            }
            set_changes(get_changes() + 1);
         }
         if(get_player().get_gender() == 1)
         {
            if(Utils.rand(4) == 0 && get_changes() < get_changeLimit())
            {
               if(get_player().get_femininity() < 70 && get_player().get_femininity() >= 60)
               {
                  outputText("[pg]当你感觉到你的五官再次变得柔和时，你笑了起来，然后突然停了下来。你的笑声听起来更像是一个女孩的咯咯笑。你感觉稍微清醒了一些，试探性地触摸着你脸上柔软的肉。伪娘油深刻地改变了你，让你天生的男性特征……至少可以说，很难辨认。你怀疑如果你愿意的话，你现在可以让自己看起来更像个女孩。");
                  if(!get_player().hasPerk(PerkLib.Androgyny))
                  {
                     get_player().createPerk(PerkLib.Androgyny,0,0,0,0);
                     outputText("[pg](<b>获得特质：雌雄莫辨</b>)");
                  }
                  _loc4_ = get_player();
                  _loc4_.set_femininity(_loc4_.get_femininity() + 10);
                  if(get_player().get_femininity() > 70)
                  {
                     get_player().set_femininity(70);
                  }
                  set_changes(get_changes() + 1);
               }
               else
               {
                  outputText("[pg]随着你的五官变得更加女性化，你的脸也变得柔和了。");
                  _loc4_ = get_player();
                  _loc4_.set_femininity(_loc4_.get_femininity() + 10);
                  set_changes(get_changes() + 1);
               }
            }
            if(get_player().tone > 20 && Utils.rand(4) == 0 && get_changes() < get_changeLimit())
            {
               outputText("[pg]你试探性地把手指按进你的手臂。你似乎失去了一些肌肉线条，让你看起来更柔软。");
               var _temp_15:* = get_player();
               _temp_15.tone = _temp_15.tone - 10;
               set_changes(get_changes() + 1);
            }
         }
         else if(get_player().get_gender() == 2)
         {
            if(get_player().get_femininity() > 30 && Utils.rand(4) == 0 && get_changes() < get_changeLimit())
            {
               _loc4_ = get_player();
               _loc4_.set_femininity(_loc4_.get_femininity() - 10);
               if(get_player().get_femininity() < 30)
               {
                  get_player().set_femininity(30);
                  outputText("[pg]当你感觉到你的五官再次变得柔和时，你笑了起来，然后突然停了下来。你的笑声听起来更像是一个男孩的欢呼。你感觉稍微清醒了一些，试探性地触摸着你脸上分明的线条。伪娘油深刻地改变了你，让你天生的女性特征……至少可以说，很难辨认。你怀疑如果你愿意的话，你现在可以让自己看起来更像个男孩。");
                  if(!get_player().hasPerk(PerkLib.Androgyny))
                  {
                     get_player().createPerk(PerkLib.Androgyny,0,0,0,0);
                     outputText("[pg](<b>获得特质：雌雄莫辨</b>)");
                  }
               }
               else
               {
                  outputText("[pg]你的五官变得更加立体分明，面部特征变得更加男性化。");
               }
               set_changes(get_changes() + 1);
            }
            if(get_player().tone < 80 && Utils.rand(4) == 0 && get_changes() < get_changeLimit())
            {
               outputText("[pg]你饶有兴致地弯曲手臂。虽然你变瘦了，但你的肌肉似乎变得更加明显了。");
               var _temp_16:* = get_player();
               _temp_16.tone = _temp_16.tone + 10;
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
         if(!get_player().hasStatusEffect(StatusEffects.BlackNipples) && Utils.rand(6) == 0 && get_changes() < get_changeLimit())
         {
            outputText("[pg]你的乳头传来一阵瘙痒感，你瑟缩了一下，努力不让自己咯咯笑出声。你低头看去，正好看到[nipples]上最后一点肉色消失。它们变成了玛瑙般的黑色！");
            get_player().createStatusEffect(StatusEffects.BlackNipples,0,0,0,0);
            set_changes(get_changes() + 1);
         }
         if((get_player().eyes.type == 1 || get_player().eyes.type == 7) && Utils.rand(2) == 0 && get_changes() < get_changeLimit())
         {
            outputText("[pg]你眨了眨眼，踉跄了一下，一阵眩晕感差点让你站不稳[feet]。当你站稳并睁开眼睛时，你意识到有些不对劲。你的视力不知怎么改变了。<b>你的蛛形怪物眼睛不见了！你又有了正常的人类眼睛。</b>");
            get_player().eyes.type = 0;
            get_player().eyes.count = 2;
            set_changes(get_changes() + 1);
         }
         if(get_player().eyes.type != 2 && Utils.rand(4) == 0 && get_changes() < get_changeLimit())
         {
            get_player().eyes.type = 2;
            outputText("[pg]你眨了眨眼，又眨了眨眼。感觉有什么东西在刺激你的眼睛。当黑色突然在你的左眼角绽放，然后是右眼角，就像墨水滴入其中一样，恐慌开始蔓延。你安慰自己，揉眼睛肯定会让情况变得更糟；你凭着意志力把手背在身后，等待这种奇怪的折磨过去。奇怪的墨色物质覆盖了你的整个视野，然后慢慢褪去，谢天谢地，刺激感也随之消失。它一消失，你就快步走到小溪边，盯着自己的倒影。<b>你的瞳孔、虹膜，你的整个眼睛都变成了液态的黑色</b>，让你看起来有点像居住在这片土地上的许多半昆虫生物。你发现自己只是庆幸这种变化显然没有影响你的视力。");
            set_changes(get_changes() + 1);
         }
         if(get_player().hasVagina() && get_player().vaginaType() != 5 && Utils.rand(4) == 0 && get_changes() < get_changeLimit())
         {
            outputText("[pg]你的[vagina]感觉……怪怪的。你解开衣服，小心翼翼地检查你的下半身。你私处娇嫩的粉红色已经消失了，取而代之的是光滑的、大理石般的黑色，从你的阴唇开始向内蔓延。");
            if(get_player().wetness() >= 3)
            {
               outputText("你天然的爱液让它闪烁着诱人的光泽。");
            }
            if(get_player().cor < 50)
            {
               outputText("在小心翼翼地触摸了几次之后，你觉得感觉上并没有什么不同——不过看起来确实很奇怪。");
            }
            else
            {
               outputText("在小心翼翼地触摸了几次之后，你觉得感觉上并没有什么不同——不过这种纯粹的怪异感却让你非常兴奋，一想到要使用它，你就感觉到它开始因为期待而闪闪发光。");
            }
            outputText("<b>你的阴道现在变成了乌木色。</b>");
            dynStats(DynStat.Sens(2),DynStat.Lust(10));
            get_player().vaginaType(5);
            set_changes(get_changes() + 1);
         }
         if(get_player().wings.type != 12 && Utils.rand(4) == 0 && get_changes() < get_changeLimit())
         {
            outputText("[pg]你尖叫着跪倒在地，肩膀传来难以置信的疼痛，就像针一样的钩子刺入了你肩胛骨下方的肉里。在大约五秒钟白热化、尖锐的痛苦之后，伴随着几乎是性高潮般的解脱感，有什么东西从你的上背部裂开。你紧紧抓着泥土，感觉像是有巨大的纸叶滑入空气中。最终这种感觉过去了，你摇摇晃晃地站了起来。你几乎不敢相信你扭头看到的东西——<b>你长出了一对四片巨型蜻蜓的翅膀</b>，比你在森林蜂娘身上看到的更薄、更长、更尖，但同样透明美丽。你小心翼翼地活动着肩胛骨上新的肌肉群，当你新的翅膀嗡嗡作响并将你抬离地面几英寸时，你倒吸了一口凉气。这将会是多么有趣啊！");
            set_changes(get_changes() + 1);
            get_player().wings.type = 12;
         }
         if(get_changes() == 0)
         {
            outputText("[pg]好吧……这也没什么大不了的。");
         }
         var _loc6_:IMap = KFLAGS.flags;
         FlagDict_Impl_.arrayWriteInt(_loc6_,2077,FlagDict_Impl_.arrayReadInt(_loc6_,2077) + get_changes());
         return false;
      }
   }
}

