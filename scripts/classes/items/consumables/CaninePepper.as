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
   import classes.globalFlags.KFLAGS;
   import classes.internals.Utils;
   import classes.internals._OneOf.OneOf_Impl_;
   import classes.items.Consumable;
   import classes.items.Mutations;
   import classes.lists.ColorLists;
   import flash.Boot;
   import haxe.IMap;
   import haxe.ds.Either;
   
   public class CaninePepper extends Consumable
   {
      
      public static var STANDARD:int = 0;
      
      public static var LARGE:int = 1;
      
      public static var DOUBLE:int = 2;
      
      public static var BLACK:int = 3;
      
      public static var KNOTTY:int = 4;
      
      public static var BULBY:int = 5;
      
      public var snm:Array;
      
      public var lnm:Array;
      
      public var ids:Array;
      
      public var dsc:Array;
      
      public function CaninePepper(param1:int = 0)
      {
         if(Boot.skip_constructor)
         {
            return;
         }
         dsc = ["这根辣椒红润光泽，底部呈球状，尖端细长。闻起来很辣。","这根超大犬椒比你见过的任何普通辣椒都要大得多。","这根犬椒实际上是两根辣椒因为某种奇特的巧合长在了一起。","这根纯黑犬椒光滑闪亮，但似乎有些不对劲……","这根结节犬椒非常肿胀，底部附近有一个巨大、膨胀的肉结。","这根球根犬椒的形状与其他犬椒略有不同，底部有两个巨大的球状突起。"];
         lnm = ["a canine pepper","an overly large canine pepper","a double canine pepper","a solid black canine pepper","a knotty canine pepper","a bulbous canine pepper"];
         snm = ["CaninePepper","LargePepper","DoublePepper","BlackPepper","KnotPepper","Bulb.Pepper"];
         ids = ["CanineP","LargePp","DblPepp","BlackPp","KnottyP","BulbyPp"];
         super(ids[param1],snm[param1],lnm[param1],10,dsc[param1]);
      }
      
      override public function useItem() : Boolean
      {
         var _loc1_:String = get_id();
         if(_loc1_ == "BlackPp")
         {
            caninePepper(3);
         }
         else if(_loc1_ == "BulbyPp")
         {
            caninePepper(5);
         }
         else if(_loc1_ == "DblPepp")
         {
            caninePepper(2);
         }
         else if(_loc1_ == "KnottyP")
         {
            caninePepper(4);
         }
         else if(_loc1_ == "LargePp")
         {
            caninePepper(1);
         }
         else
         {
            caninePepper(0);
         }
         return false;
      }
      
      public function caninePepper(param1:Number) : void
      {
         var _loc7_:Number = NaN;
         var _loc8_:* = null as Array;
         var _loc9_:int = 0;
         var _loc10_:int = 0;
         var _loc11_:int = 0;
         var _loc12_:Boolean = false;
         var _loc13_:* = null as String;
         var _loc2_:String = "caninePepper";
         if(get_player().hasPerk(PerkLib.Hellfire))
         {
            _loc2_ += "-hellfire";
         }
         var _loc3_:Number = param1;
         if(_loc3_ == 1)
         {
            _loc2_ += "-oversized";
         }
         else if(_loc3_ == 2)
         {
            _loc2_ += "-double";
         }
         else if(_loc3_ == 3)
         {
            _loc2_ += "-black";
         }
         else if(_loc3_ == 4)
         {
            _loc2_ += "-knotty";
         }
         else if(_loc3_ == 5)
         {
            _loc2_ += "-bulbous";
         }
         var _loc4_:int = 0;
         var _loc5_:int = 0;
         _loc3_ = 0;
         var _loc6_:Number = 1;
         get_mutations().initTransformation([2,2]);
         _loc7_ = param1;
         if(_loc7_ == 0)
         {
            if(Utils.randomChance(15))
            {
               _loc6_ = int(Math.random() * 20) / 10 + 2;
               outputText("这辣椒尝起来特别带劲，辣得像火烧一样。");
            }
            else
            {
               outputText("这辣椒辣得有些奇怪，但非常美味。");
            }
         }
         else if(_loc7_ == 1)
         {
            _loc6_ = int(Math.random() * 20) / 10 + 2;
            outputText("这根辣椒又大又粗，你不得不分好几大口才能吃完。它不像普通的辣椒那么辣，但味道鲜美，香气扑鼻。");
         }
         else if(_loc7_ == 2)
         {
            _loc6_ = int(Math.random() * 20) / 10 + 2;
            outputText("这根双生辣椒很奇怪，看起来像是两根辣椒在根部连在一起长成的。");
         }
         else if(_loc7_ == 3)
         {
            _loc6_ = int(Math.random() * 20) / 10 + 2;
            outputText("这根黑辣椒尝起来很甜，但回味有点酸涩。");
         }
         else if(_loc7_ == 4)
         {
            _loc6_ = int(Math.random() * 20) / 10 + 2;
            outputText("这根辣椒根部有个肿胀的凸起，吃起来有点费劲，但你还是硬塞进嘴里大嚼起来。它特别辣！");
         }
         else if(_loc7_ == 5)
         {
            _loc6_ = int(Math.random() * 20) / 10 + 2;
            outputText("你吃掉了辣椒，连同根部长出的两个球状凸起也一起吃掉了。真美味！");
         }
         else
         {
            _loc6_ = int(Math.random() * 20) / 10 + 2;
         }
         if(param1 == 0 && _loc6_ > 1 && get_player().hasFur() && get_player().face.type == 2 && get_player().ears.type == 2 && get_player().lowerBody.type == 2 && get_player().tail.type == 2 && Utils.trueOnceInN(2) && get_player().hasStatusEffect(StatusEffects.DogWarning) && !get_player().isTFResistant())
         {
            if(Utils.trueOnceInN(2))
            {
               outputText("[pg]当你吞下辣椒时，你注意到舌头上的辛辣感似乎在蔓延。你的整个身体似乎都在刺痛和燃烧，让你感觉比平时热得多，甚至像发烧一样。你再也无法忍受，撕掉衣服，希望能凉快一点。可悲的是，这并不能解决你的问题。往好处想，你突然产生的眩晕感足以让你忘记体温问题。你向前扑倒，双手和双膝着地，老实说，不完全是手和膝盖。更像是爪子和膝盖。这可不太妙，你心想，但随后骨骼转变为四足形态的感觉剥夺了你的注意力。在那之后，没过多久，你的形态就完全重塑成了一只大狗，或者可能是一只狼。这种区别对现在的你来说已经毫无意义，即使你还能理解它。");
               if(get_player().hasPerk(PerkLib.MarblesMilk))
               {
                  outputText("你只知道风中传来了一阵气味，是时候狩猎了，而且在一天结束时，你需要回家喝奶。");
               }
               else
               {
                  outputText("你只知道风中传来了一阵气味，是时候狩猎了。");
               }
            }
            else
            {
               outputText("[pg]你狼吞虎咽地吃下甜椒，仔细舔去手指上甘甜多汁的果液，正准备继续上路时，突然你的胸口和胃部开始感到一阵紧绷，可怕的痉挛首先穿过你的胸膛，然后慢慢蔓延到你的四肢，这种感觉很快伴随着可怕的、令人毛骨悚然的骨骼断裂声，你的骨骼开始重组、扭曲和移位，你的大脑因疼痛而炸裂。你倒在地上，向前伸出一只手。不……是一只爪子，当你试图重新站起来时，你惊恐地意识到。你惊恐地看着自己的前腿，浓密的皮毛从皮肤中钻出，一层[haircolor]的毛发慢慢从你裸露的肉体上蔓延开来，覆盖了你的全身。突然，你感觉自己的意识正在流逝，仿佛坠入梦境，你的思想扭曲变形，你的身体终于定型为新的形态。伴随着最后一声骨骼断裂的脆响，你发出一声犬吠，踢开束缚你的衣物，挣脱出来，逃向夕阳，渴望找到今晚的猎物大快朵颐。");
            }
            get_game().gameOver();
            return;
         }
         if(param1 == 0 && get_player().hasFur() && get_player().face.type == 2 && get_player().tail.type == 2 && get_player().ears.type == 2 && get_player().lowerBody.type == 2 && get_player().hasStatusEffect(StatusEffects.DogWarning) && Utils.rand(3) == 0)
         {
            outputText("<b>");
            outputText("[pg]吃下辣椒后，你意识到自己变得多么像狗，并想知道这些辣椒还能改变什么……</b>");
         }
         if(param1 == 0 && get_player().hasFur() && get_player().face.type == 2 && get_player().tail.type == 2 && get_player().ears.type == 2 && get_player().lowerBody.type == 2 && !get_player().hasStatusEffect(StatusEffects.DogWarning))
         {
            get_player().createStatusEffect(StatusEffects.DogWarning,0,0,0,0);
            outputText("<b>");
            outputText("[pg]吃下辣椒后，你意识到自己变得多么像狗，并想知道这些辣椒还能改变什么……</b>");
         }
         if(param1 == 3)
         {
            dynStats(DynStat.Lib(2 + Utils.rand(4)),DynStat.Lust(5 + Utils.rand(5)),DynStat.Cor(2 + Utils.rand(4)));
            outputText("[pg]随着温柔的暖意传遍全身，你感到自己放松下来。说实话，你觉得现在就算撞见恶魔或怪物也无所谓，它们会是不错的消遣。");
            if(get_player().cor < 50)
            {
               outputText("你摇了摇头，脸涨得通红。怎么会有这种想法？");
            }
         }
         if(get_player().get_str100() < 50 && Utils.trueOnceInN(3))
         {
            dynStats(DynStat.Str(_loc6_));
            if(_loc6_ > 1)
            {
               outputText("[pg]你的肌肉起伏生长，向外膨胀。");
            }
            else
            {
               outputText("[pg]你感觉肌肉变得更加紧实了。");
            }
         }
         if(get_player().get_spe100() < 30 && Utils.trueOnceInN(3) && get_changes() < get_changeLimit())
         {
            dynStats(DynStat.Spe(_loc6_));
            if(_loc6_ > 1)
            {
               outputText("[pg]你发现你的肌肉反应更快、更迅速，并且你感到一种想要去散步的奇怪冲动。");
            }
            else
            {
               outputText("[pg]你感觉自己变快了。");
            }
         }
         if(get_player().get_inte100() > 30 && Utils.trueOnceInN(3) && get_changes() < get_changeLimit() && param1 != 3)
         {
            dynStats(DynStat.Inte(-1 * _loc6_));
            outputText("[pg]你感觉");
            if(_loc6_ > 1)
            {
               outputText("更");
            }
            outputText("蠢了。");
         }
         if(get_player().neck.type != 0 && get_changes() < get_changeLimit() && Utils.trueOnceInN(4))
         {
            get_mutations().restoreNeck(_loc2_);
         }
         if(get_player().hasNonSharkRearBody() && get_changes() < get_changeLimit() && Utils.trueOnceInN(5))
         {
            get_mutations().restoreRearBody(_loc2_);
         }
         if(Utils.trueOnceInN(5))
         {
            get_mutations().updateOvipositionPerk(_loc2_);
         }
         get_mutations().removeFeatheryHair();
         if(param1 == 2)
         {
            if(get_player().dogCocks() >= 2)
            {
               param1 = 1;
            }
            else if(get_player().dogCocks() == 0)
            {
               if(get_player().cockTotal() == 0)
               {
                  get_player().createCock(7 + Utils.rand(7),1.5 + Utils.rand(10) / 10);
                  get_player().createCock(7 + Utils.rand(7),1.5 + Utils.rand(10) / 10);
                  outputText("[pg]你的腹股沟处鼓起了一个痛苦的肿块，当它压在你的[armor]上时，你几乎痛得弯下腰来。你撕开你的装备，惊恐地看着变色的皮肤裂开，露出了一对红色的尖端。当它们向前推进，闪烁着红光并变粗时，一种如释重负的感觉和令人惊讶的欲望增长了。皮肤聚拢成一个动物般的包皮，同时一对肥大的凸起弹了出来。你现在有两根又粗又好的狗鸡巴，还有着相当大的结。两者都在跳动并滴下动物的预精液，尽管你试图自我控制，但还是被唤起了。");
                  get_player().cocks[0].knotMultiplier = 1.7;
                  get_player().cocks[0].set_cockType(CockTypesEnum.DOG);
                  get_player().cocks[1].knotMultiplier = 1.7;
                  get_player().cocks[1].set_cockType(CockTypesEnum.DOG);
                  dynStats(DynStat.Lust(50));
               }
               else if(get_player().cockTotal() == 1)
               {
                  outputText("[pg]你的[cock]震动着，当它变红并扭曲时，静脉清晰可见。头部变窄成一个尖端，而底部周围形成了一个逐渐变宽的凸起。在它与你的胯部相遇的地方，皮肤在它周围聚拢，形成了一个犬类的包皮。");
                  get_player().cocks[0].set_cockType(CockTypesEnum.DOG);
                  get_player().cocks[0].knotMultiplier = 1.5;
                  outputText("你感觉到有什么滑溜溜的东西在新的包皮里蠕动，另一个红色的尖端露了出来。尽管你不愿意，你还是开始被这种变化所激起性欲，新的鸡巴慢慢滑出，最终在粗大的结弹出来后停了下来。这对狗鸡巴挂在那里，漏出预精液，让你异常兴奋。");
                  get_player().createCock(7 + Utils.rand(7),1.5 + Utils.rand(10) / 10);
                  get_player().cocks[1].knotMultiplier = 1.7;
                  get_player().cocks[1].set_cockType(CockTypesEnum.DOG);
                  dynStats(DynStat.Lib(2),DynStat.Lust(50));
               }
               else
               {
                  outputText("[pg]你的胯部抽搐着，你拉开你的[armor]想看个究竟。你在恐惧与兴奋中看着你的[cock]和" + get_player().cockDescript(1) + "同时扭曲变形，变得通红且尖锐，并在根部附近长出粗大的肉结。当变化停止时，你拥有了两根狗鸡巴和一个动物般的包皮鞘。整个过程让你异常兴奋，滴落着动物般的预精，准备好去配种了。");
                  get_player().cocks[0].set_cockType(CockTypesEnum.DOG);
                  get_player().cocks[1].set_cockType(CockTypesEnum.DOG);
                  get_player().cocks[0].knotMultiplier = 1.4;
                  get_player().cocks[1].knotMultiplier = 1.4;
                  dynStats(DynStat.Lib(2),DynStat.Lust(50));
               }
            }
            else
            {
               if(get_player().cockTotal() == 1)
               {
                  outputText("[pg]你感觉到有什么滑溜溜的东西在你的包皮鞘里蠕动，接着另一个红色的尖端探了出来。不由自主地，你开始因为这种变化而发情，新的肉棒慢慢滑出，直到粗大的肉结也弹出来才最终停止。这对狗鸡巴悬挂在那里，漏出些许预精，让你兴奋得远超寻常。");
                  get_player().createCock(7 + Utils.rand(7),1.5 + Utils.rand(10) / 10);
                  get_player().cocks[1].set_cockType(CockTypesEnum.DOG);
                  get_player().cocks[1].knotMultiplier = 1.4;
                  dynStats(DynStat.Lib(2),DynStat.Lust(50));
               }
               if(get_player().cockTotal() >= 1)
               {
                  if(get_player().cocks[0].get_cockType() == CockTypesEnum.DOG)
                  {
                     outputText("[pg]你的胯部抽搐着，你拉开你的[armor]想看个究竟。你在恐惧与兴奋中看着你的" + get_player().cockDescript(1) + "扭曲变形，变得通红且尖锐，就像另一根狗鸡巴一样，在根部附近长出粗大的肉结。当变化停止时，你拥有了两根狗鸡巴和一个动物般的包皮鞘。整个过程让你异常兴奋，滴落着动物般的预精，准备好去配种了。");
                     get_player().cocks[1].set_cockType(CockTypesEnum.DOG);
                     get_player().cocks[1].knotMultiplier = 1.4;
                  }
                  else
                  {
                     outputText("[pg]你的胯部抽搐着，你拉开你的[armor]想看个究竟。你在恐惧与兴奋中看着你的[cock]扭曲变形，变得通红且尖锐，就像另一根狗鸡巴一样，在根部附近长出粗大的肉结。当变化停止时，你拥有了两根狗鸡巴和一个动物般的包皮鞘。整个过程让你异常兴奋，滴落着动物般的预精，准备好去配种了。");
                     get_player().cocks[0].set_cockType(CockTypesEnum.DOG);
                     get_player().cocks[0].knotMultiplier = 1.4;
                  }
                  dynStats(DynStat.Lib(2),DynStat.Lust(50));
               }
            }
         }
         if(param1 == 4)
         {
            if(get_player().cockTotal() > 0)
            {
               if(get_player().countKnottedCocks() > 0 && get_changes() < get_changeLimit() && Utils.trueOnceInN(3))
               {
                  while(_loc4_ < int(get_player().cocks.length))
                  {
                     if(get_player().cocks[_loc4_].hasKnot())
                     {
                        _loc5_ = _loc4_;
                        break;
                     }
                     _loc4_++;
                  }
                  _loc4_ = int(get_player().cocks.length);
                  while(_loc4_ > 0)
                  {
                     _loc4_--;
                     if(get_player().cocks[_loc4_].hasKnot() && get_player().cocks[_loc4_].knotMultiplier < get_player().cocks[_loc5_].knotMultiplier)
                     {
                        _loc5_ = _loc4_;
                     }
                  }
                  _loc3_ = (Utils.rand(2) + 5) / 20 * _loc6_;
                  if(get_player().cocks[_loc5_].knotMultiplier >= 1.5)
                  {
                     _loc3_ /= 2;
                  }
                  if(get_player().cocks[_loc5_].knotMultiplier >= 1.75)
                  {
                     _loc3_ /= 2;
                  }
                  if(get_player().cocks[_loc5_].knotMultiplier >= 2)
                  {
                     _loc3_ /= 5;
                  }
                  var _temp_1:* = get_player().cocks[_loc5_];
                  _temp_1.knotMultiplier = _temp_1.knotMultiplier + _loc3_;
                  outputText("[pg]");
                  if(_loc3_ < 0.06)
                  {
                     outputText("随着你的肉结变大，你的" + get_player().cockDescript(_loc5_) + "在你的" + get_player().sheathDescript() + "里感觉异常紧绷。");
                  }
                  if(_loc3_ >= 0.06 && _loc3_ <= 0.12)
                  {
                     outputText("你的" + get_player().cockDescript(_loc5_) + "从你的" + get_player().sheathDescript() + "中紧绷着探出，漂亮地增粗成了一个更大的肉结。");
                  }
                  if(_loc3_ > 0.12)
                  {
                     outputText("你的" + get_player().cockDescript(_loc5_) + "从你的" + get_player().sheathDescript() + "中挺立而出，每一秒都在肿胀变粗。你的肉结在根部鼓起，长得远远超过了正常大小。");
                  }
                  dynStats(DynStat.Sens(0.5),DynStat.Lust(5 * _loc6_));
               }
               else if(get_player().countKnottedCocks() <= 0 || get_player().countNotKnottedCocks() > 0 && get_changes() < get_changeLimit() && Utils.trueOnceInN(2))
               {
                  _loc8_ = [];
                  _loc9_ = 0;
                  _loc10_ = int(get_player().cocks.length);
                  while(_loc9_ < _loc10_)
                  {
                     _loc11_ = _loc9_++;
                     if(!get_player().cocks[_loc11_].hasKnot())
                     {
                        _loc8_.push(_loc11_);
                     }
                  }
                  _loc5_ = int(_loc8_[Utils.rand(int(_loc8_.length))]);
                  outputText("[pg]你的[cock " + (_loc5_ + 1) + "]抽动着，同时[sheath]开始肿胀。这丝毫不觉得痛，实际上还有点舒服。你的肉结像气球一样慢慢充血，最终在几乎是其他部分两倍粗的时候停了下来。你摸了摸它，舒服得打了个寒颤，渗出了些许前列腺液。[b:你现在有了一个肉结。]");
                  get_player().cocks[_loc5_].knotMultiplier = 1.7;
                  set_changes(get_changes() + 1);
               }
            }
            else
            {
               outputText("[pg]一阵轻微的恶心感传遍全身。看来这种辣椒不太适合你的身体。");
            }
         }
         if(param1 == 5)
         {
            if(get_player().balls <= 1)
            {
               outputText("[pg]一阵剧痛让你弯下腰，几乎要吐出来。你保持着那个姿势，差点哭出来，直到一种明显的轻松感突然席卷全身。你低下头，发现自己现在有了一个小阴囊，里面还有两颗相对较小的睾丸。");
               get_player().balls = 2;
               get_player().ballSize = 1;
               dynStats(DynStat.Lib(2),DynStat.Lust(-10));
            }
            else
            {
               var _temp_2:* = get_player();
               _temp_2.ballSize = _temp_2.ballSize + 1;
               if(get_player().ballSize > 10)
               {
                  var _temp_3:* = get_player();
                  _temp_3.ballSize = _temp_3.ballSize - 0.5;
               }
               if(get_player().ballSize <= 2)
               {
                  outputText("[pg]一阵暖流穿过你的身体，腹股沟突然产生了一种沉重感。你停下来检查这些变化，游移的手指发现你的" + get_player().simpleBallsDescript() + "已经长得比人类的还要大了。");
               }
               if(get_player().ballSize > 2)
               {
                  outputText("[pg]一股突如其来的热量包围了你的腹股沟，集中在你的[sack]上。你发现你的" + get_player().simpleBallsDescript() + "又变大了，走路都变得困难起来。");
               }
               dynStats(DynStat.Lib(1),DynStat.Lust(3));
            }
         }
         if(int(get_player().cocks.length) > 0)
         {
            if(param1 != 4 && get_player().dogCocks() > 0 && (get_changes() < get_changeLimit() && Utils.rand(1.4) == 0 || param1 == 1))
            {
               _loc4_ = 0;
               while(_loc4_ < int(get_player().cocks.length))
               {
                  if(get_player().cocks[_loc4_].get_cockType() == CockTypesEnum.DOG)
                  {
                     _loc5_ = _loc4_;
                     break;
                  }
                  _loc4_++;
               }
               _loc4_ = int(get_player().cocks.length);
               while(_loc4_ > 0)
               {
                  _loc4_--;
                  if(get_player().cocks[_loc4_].get_cockType() == CockTypesEnum.DOG && get_player().cocks[_loc4_].knotMultiplier < get_player().cocks[_loc5_].knotMultiplier)
                  {
                     _loc5_ = _loc4_;
                  }
               }
               _loc3_ = (Utils.rand(2) + 1) / 20 * _loc6_;
               if(get_player().cocks[_loc5_].knotMultiplier >= 1.5)
               {
                  _loc3_ /= 2;
               }
               if(get_player().cocks[_loc5_].knotMultiplier >= 1.75)
               {
                  _loc3_ /= 2;
               }
               if(get_player().cocks[_loc5_].knotMultiplier >= 2)
               {
                  _loc3_ /= 5;
               }
               var _temp_4:* = get_player().cocks[_loc5_];
               _temp_4.knotMultiplier = _temp_4.knotMultiplier + _loc3_;
               if(_loc3_ < 0.06)
               {
                  outputText("[pg]随着你的阴茎结变大，你的" + get_player().cockDescript(_loc5_) + "在阴茎鞘里感觉异常紧绷。");
               }
               if(_loc3_ >= 0.06 && _loc3_ <= 0.12)
               {
                  outputText("[pg]你的" + get_player().cockDescript(_loc5_) + "从阴茎鞘中弹了出来，完美地膨胀成了一个更大的阴茎结。");
               }
               if(_loc3_ > 0.12)
               {
                  outputText("[pg]你的" + get_player().cockDescript(_loc5_) + "从阴茎鞘中猛地弹出，随着时间的推移变得越来越粗。你的阴茎结在根部鼓起，变得比平时大得多。");
               }
               dynStats(DynStat.Sens(0.5),DynStat.Lust(5 * _loc6_));
               set_changes(get_changes() + 1);
            }
            if(param1 != 4 && get_player().dogCocks() < int(get_player().cocks.length) && (get_changes() < get_changeLimit() && Utils.trueOnceInN(3) || param1 == 1))
            {
               _loc4_ = int(get_player().cocks.length);
               _loc5_ = 0;
               while(_loc4_ > 0)
               {
                  _loc4_--;
                  if(get_player().cocks[_loc4_].get_cockType() != CockTypesEnum.DOG)
                  {
                     _loc5_ = _loc4_;
                     break;
                  }
               }
               if(get_player().cocks[_loc5_].get_cockType() == CockTypesEnum.HUMAN)
               {
                  outputText("[pg]你的" + get_player().cockDescript(_loc5_) + "痛苦地收紧，变得酸痛、悸动地勃起。一种紧绷感似乎挤压着根部，当你看到你的皮肤和血肉向前移动，变成一个看起来像犬类的阴茎鞘时，你退缩了。当你" + get_player().cockDescript(_loc5_) + "的冠部重塑成一个尖端时，你颤抖着，这种感觉几乎让你无法承受。当变形完成时，你仰起头，你的" + Appearance.cockNoun(CockTypesEnum.DOG) + "比以前粗得多。<b>你现在有了一根狗鸡巴。</b>");
                  dynStats(DynStat.Sens(10),DynStat.Lust(5 * _loc6_));
               }
               if(get_player().cocks[_loc5_].get_cockType() == CockTypesEnum.HORSE)
               {
                  outputText("[pg]你的" + Appearance.cockNoun(CockTypesEnum.HORSE) + "缩小了，马族多余的长度似乎变成了粗度。喇叭状的尖端消失了，变成了更尖的形状，在你的阴茎鞘上方形成了一个粗大的阴茎结。<b>你现在有了一根狗鸡巴。</b>");
                  if(get_player().cocks[_loc5_].cockLength > 6)
                  {
                     var _temp_5:* = get_player().cocks[_loc5_];
                     _temp_5.cockLength = _temp_5.cockLength - 2;
                  }
                  else
                  {
                     var _temp_6:* = get_player().cocks[_loc5_];
                     _temp_6.cockLength = _temp_6.cockLength - 0.5;
                  }
                  get_player().cocks[_loc5_].thickenCock(0.5);
                  dynStats(DynStat.Sens(4),DynStat.Lust(5 * _loc6_));
               }
               if(get_player().cocks[_loc5_].get_cockType() == CockTypesEnum.TENTACLE)
               {
                  outputText("[pg]你的" + get_player().cockDescript(_loc5_) + "向内卷曲，重塑并失去了植物般的颜色，因为它在根部变粗，鼓起一个看起来非常像犬类的阴茎结。你的皮肤在根部痛苦地聚拢，形成一个阴茎鞘。<b>你现在有了一根狗鸡巴。</b>");
                  dynStats(DynStat.Sens(4),DynStat.Lust(5 * _loc6_));
               }
               if(get_player().cocks[_loc5_].get_cockType().get_Index() > 4)
               {
                  outputText("[pg]你的" + get_player().cockDescript(_loc5_) + "颤抖着，重塑成一根闪亮的红色狗鸡巴，根部有一个肥大的阴茎结。<b>你现在有了一根狗鸡巴。</b>");
                  dynStats(DynStat.Sens(4),DynStat.Lust(5 * _loc6_));
               }
               _loc4_ = 0;
               if(get_player().cocks[_loc5_].get_cockType() == CockTypesEnum.DEMON)
               {
                  outputText("[pg]你的" + get_player().cockDescript(_loc5_) + "颜色瞬间变红，根部开始肿胀，但很快又恢复了平滑，保留了其独特的恶魔形状，只是可能变得更粗了一点。");
                  dynStats(DynStat.Sens(1),DynStat.Lust(2 * _loc6_));
                  _loc4_ = 1;
               }
               get_player().cocks[_loc5_].set_cockType(CockTypesEnum.DOG);
               get_player().cocks[_loc5_].knotMultiplier = 1.1;
               get_player().cocks[_loc5_].thickenCock(2);
               if(_loc4_ == 1)
               {
                  get_player().cocks[_loc5_].set_cockType(CockTypesEnum.DEMON);
               }
               set_changes(get_changes() + 1);
            }
            if(get_player().cumMultiplier < 2 && Utils.trueOnceInN(2) && get_changes() < get_changeLimit())
            {
               _loc7_ = 1.5;
               if(get_player().hasPerk(PerkLib.MessyOrgasms))
               {
                  _loc7_ = 2;
               }
               if(_loc7_ < get_player().cumMultiplier + 0.05 * _loc6_)
               {
                  set_changes(get_changes() - 1);
               }
               else
               {
                  var _temp_7:* = get_player();
                  _temp_7.cumMultiplier = _temp_7.cumMultiplier + 0.05 * _loc6_;
                  if(get_player().balls == 0)
                  {
                     outputText("[pg]你感觉到肠胃里一阵翻江倒海，你体内的某些东西发生了改变。");
                  }
                  if(get_player().balls > 0)
                  {
                     outputText("[pg]你感觉到你的[balls]里一阵翻腾。这种感觉很快就平息了，让它们感觉变得更加紧实了。");
                  }
                  if(_loc6_ > 1)
                  {
                     outputText("一点乳白色的预精从你的[cocks]中滴落，被这种变化挤了出来。");
                  }
               }
               set_changes(get_changes() + 1);
            }
            if(param1 == 1)
            {
               _loc7_ = 0;
               if(int(get_player().cocks.length) == 1)
               {
                  _loc7_ = get_player().increaseCock(0,Utils.rand(4) + 3);
                  _loc4_ = 0;
                  dynStats(DynStat.Sens(1),DynStat.Lust(10));
               }
               else
               {
                  _loc4_ = get_player().smallestCockIndex();
                  _loc7_ = get_player().increaseCock(_loc4_,Utils.rand(4) + 3);
                  dynStats(DynStat.Sens(1),DynStat.Lust(10));
                  if(get_player().cocks[_loc4_].cockThickness <= 2)
                  {
                     get_player().cocks[_loc4_].thickenCock(1);
                  }
               }
               if(_loc7_ > 2)
               {
                  outputText("[pg]你的" + get_player().cockDescript(_loc4_) + "痛苦地紧绷着，随着它变得更长，几英寸肿胀的肉棒从你的胯下挤出。浓稠的预精在尖端形成，被变化的快感引诱出来。");
               }
               if(_loc7_ > 1 && _loc7_ <= 2)
               {
                  outputText("[pg]你的胯部积聚起一阵胀痛的压力，随后突然释放，一英寸甚至更多的额外肉棒挤了出来。由于生长的快感，你变大的" + get_player().cockDescript(_loc4_) + "的龟头上渗出了一滴预精。");
               }
               if(_loc7_ <= 1)
               {
                  outputText("[pg]随着你的" + get_player().cockDescript(_loc4_) + "从胯部进一步向外推出，一阵轻微的压力积聚又释放了。");
               }
            }
         }
         if(int(get_player().breastRows.length) > 0)
         {
            if(get_player().breastRows[0].breastRating >= 1 && int(get_player().vaginas.length) > 0)
            {
               if(int(get_player().breastRows.length) < 3 && Utils.trueOnceInN(2) && get_changes() < get_changeLimit())
               {
                  get_player().createBreastRow();
                  _loc9_ = int(get_player().breastRows.length) - 1;
                  if(int(get_player().vaginas.length) > 0 && get_player().breastRows[0].breastRating <= int(get_player().breastRows.length))
                  {
                     outputText("[pg]你的[breasts]在衣服的挤压下感到紧绷和疼痛，它们每时每刻都在变大，直到达到");
                     var _temp_8:* = get_player().breastRows[0];
                     _temp_8.breastRating = _temp_8.breastRating + 2;
                     outputText("[breastcup]罩杯才停下来。但这还没完，你感觉到躯干下方开始发紧……");
                     set_changes(get_changes() + 1);
                  }
                  if(int(get_player().breastRows.length) == 2)
                  {
                     get_player().breastRows[_loc9_].breastRating = get_player().breastRows[0].breastRating - 1;
                     if(get_player().breastRows[0].breastRating - 1 == 0)
                     {
                        outputText("[pg]在现有的乳房下方，第二对乳房开始成形，在它们还相当平坦且看起来偏男性化时停止了生长。");
                     }
                     else
                     {
                        outputText("[pg]在现在的乳房下方，第二对乳房隆起，直到长成" + get_player().breastCup(_loc9_) + "大小才停止生长。");
                     }
                     outputText("每个新乳房的顶端都长出了一个敏感的凸起，变成了一个新的乳头。");
                     dynStats(DynStat.Sens(6),DynStat.Lust(5));
                     set_changes(get_changes() + 1);
                  }
                  if(int(get_player().breastRows.length) > 2 && get_player().breastRows[0].breastRating > int(get_player().breastRows.length))
                  {
                     dynStats(DynStat.Sens(6),DynStat.Lust(5));
                     _loc8_ = get_player().breastRows;
                     get_player().breastRows[_loc9_].breastRating = _loc8_[_loc9_ - 1].breastRating - 1;
                     if(get_player().breastRows[_loc9_].breastRating < 0)
                     {
                        get_player().breastRows[_loc9_].breastRating = 0;
                     }
                     if(get_player().breastRows[_loc9_ - 1].breastRating < 0)
                     {
                        get_player().breastRows[_loc9_ - 1].breastRating = 0;
                     }
                     if(get_player().breastRows[_loc9_].breastRating == 0)
                     {
                        outputText("[pg]你的腹部一阵刺痛和抽搐，在其他乳房下方又长出了一排新的乳房。你的新乳房保持着平坦和男性化的外观，没有长得更大。");
                     }
                     else
                     {
                        outputText("[pg]你的腹部一阵刺痛和抽搐，在其他乳房下方又长出了一排" + get_player().breastCup(_loc9_) + "大小的" + get_player().breastDescript(_loc9_) + "。");
                     }
                     outputText("每个新乳房的顶端都长出了一个敏感的凸起，变成了一个新的乳头。");
                     set_changes(get_changes() + 1);
                  }
                  if(_loc6_ > 1)
                  {
                     if(_loc6_ > 2)
                     {
                        outputText("你试探性地托起你新的胸部，用温柔的触摸探索着这新的血肉。强烈的快感让你几乎翻起了白眼。");
                        dynStats(DynStat.Sens(6),DynStat.Lust(15),DynStat.Cor(0));
                     }
                     else
                     {
                        outputText("你带着敬畏和渴望交织的心情触摸着你新的乳头，这种体验令人无比兴奋。你高兴地尖叫起来，几乎要高潮了，但最终还是找到了阻止自己的意志力。");
                        dynStats(DynStat.Sens(3),DynStat.Lust(10));
                     }
                  }
               }
               else if(Utils.trueOnceInN(2))
               {
                  _loc9_ = int(get_player().breastRows.length);
                  _loc7_ = 0;
                  _loc12_ = false;
                  while(_loc9_ > 1 && _loc7_ == 0)
                  {
                     _loc9_--;
                     if(get_player().breastRows[_loc9_].breastRating + 1 < get_player().breastRows[_loc9_ - 1].breastRating)
                     {
                        if(!_loc12_)
                        {
                           _loc12_ = true;
                           outputText("\n");
                        }
                        outputText("\n你的");
                        if(_loc9_ == 0)
                        {
                           outputText("第一");
                        }
                        if(_loc9_ == 1)
                        {
                           outputText("第二");
                        }
                        if(_loc9_ == 2)
                        {
                           outputText("第三");
                        }
                        if(_loc9_ == 3)
                        {
                           outputText("第四");
                        }
                        if(_loc9_ == 4)
                        {
                           outputText("第五");
                        }
                        if(_loc9_ > 4)
                        {
                           outputText("");
                        }
                        outputText("排" + get_player().breastDescript(_loc9_) + "变大了，仿佛在嫉妒上方晃动的肉团。");
                        _loc7_ = get_player().breastRows[_loc9_ - 1].breastRating - get_player().breastRows[_loc9_].breastRating - 1;
                        if(_loc7_ > 5)
                        {
                           _loc7_ = 5;
                        }
                        if(_loc7_ < 1)
                        {
                           _loc7_ = 1;
                        }
                        var _temp_9:* = get_player().breastRows[_loc9_];
                        _temp_9.breastRating = _temp_9.breastRating + _loc7_;
                     }
                  }
               }
            }
         }
         else if(Utils.trueOnceInN(2) && get_changes() < get_changeLimit())
         {
            outputText("[pg]随着重心的转移，你的胸部感到一阵不舒服的刺痛。<b>你现在有了一对B罩杯的乳房。</b>");
            outputText("每个乳房的顶端都长出了一个敏感的肉突，变成了新的乳头。");
            get_player().createBreastRow();
            get_player().breastRows[0].breastRating = 2;
            get_player().breastRows[0].breasts = 2;
            dynStats(DynStat.Sens(4),DynStat.Lust(6));
            set_changes(get_changes() + 1);
         }
         if(Utils.trueOnceInN(2) && get_changes() < get_changeLimit())
         {
            if(get_player().goIntoHeat(true))
            {
               set_changes(get_changes() + 1);
            }
         }
         if(get_changes() < get_changeLimit() && get_player().dogScore() + get_player().wolfScore() >= 3 && Utils.trueOnceInN(4))
         {
            set_changes(get_changes() + 1);
            outputText("[pg]");
            outputText("各种画面和想法不由自主地涌入你的脑海，压倒了你的理智，你很快就迷失在其中，幻想着……");
            if(get_player().get_gender() <= 1 || get_player().get_gender() == 3 && Utils.trueOnceInN(2))
            {
               outputText("在树林中跳跃穿梭，与你的" + (get_player().wolfScore() > get_player().dogScore() ? "狼群" : "主人") + "一起狩猎。感受着风拂过皮毛，狩猎的快感在你的血管中流淌，让你陶醉。你把鼻子贴在地上，一边奔跑一边追踪猎物，直到一股天堂般的气味让你停下了脚步。");
               dynStats(DynStat.Lust(5 + get_player().lib / 20));
               if(get_player().cor < 33 || !get_player().hasCock())
               {
                  outputText("\n你摇了摇头，把这不受欢迎的幻想从脑海中清除，对此感到厌恶。");
               }
               else
               {
                  outputText("心砰砰直跳，你的肉棒本能地从阴茎鞘中弹出，你开始追逐这新的气味。被雌性发情期的气味牢牢抓住，你无视了你的" + (get_player().wolfScore() > get_player().dogScore() ? "其他感官" : "主人的呼喊") + "，消失在荒野中，随着你靠近猎物，你的" + Appearance.cockNoun(CockTypesEnum.DOG) + "变得越来越硬。你冲破灌木丛，发现了一只白毛雌性。她趴了下来，向你露出她滴着水的小穴，她性器官散发出的麝香味直接穿过你的鼻子，滑入你的" + Appearance.cockNoun(CockTypesEnum.DOG) + "。");
                  dynStats(DynStat.Lust(5 + get_player().lib / 20));
                  if(get_player().cor < 66)
                  {
                     outputText("\n你眨了眨眼，随着你控制住自己，幻想逐渐消退。那个白日梦太奇怪了，但也太火辣了。");
                  }
                  else
                  {
                     outputText("再也等不下去了，你骑上她，将你肿胀的阴茎结压在她的外阴上，她舒服得" + (get_noFur() ? "尖叫" : "轻吠") + "起来。她小穴的温度高得不真实，紧致的通道像老虎钳一样夹住你，你像打桩机一样猛烈地抽插着她，尽管动作粗暴，却温柔地咬着她的脖子。");
                     dynStats(DynStat.Lust(5 + get_player().lib / 20));
                     if(get_player().cor < 80)
                     {
                        if(int(get_player().vaginas.length) > 0)
                        {
                           outputText("\n你将自己从幻想中拉回现实，恋恋不舍地把手从酸痛的" + get_player().vaginaDescript(0) + "上移开。");
                        }
                        else
                        {
                           outputText("\n你恋恋不舍地将手从酸痛的[cock]上移开，将自己从幻想中拉回现实。");
                        }
                     }
                     else
                     {
                        outputText("终于，你的阴茎结挤进了她多汁的小穴，将她的爱液溅得满裆都是。交配的气味达到了顶峰，紧紧包裹着你" + Appearance.cockNoun(CockTypesEnum.DOG) + "的柔软肉壁以一种难以言喻的愉悦方式颤抖着。你紧紧咬住她的皮毛，全身紧绷，将一股精液倾泻进她的下体。每一次喷射都伴随着她火热通道的挤压，榨干你最后的精液。你的[legs]发软，幻想几乎让你达到高潮，突然摔在地上的冲击力将你从白日梦中惊醒。");
                        dynStats(DynStat.Lust(5 + get_player().lib / 20));
                     }
                  }
               }
            }
            else if(get_player().hasVagina())
            {
               outputText("在一群饥渴的狼面前摇晃着你滴水的" + get_player().vaginaDescript(0) + "，看着它们闪亮的红色狗屌在闻到你发情的气味时几乎要从阴茎鞘里跳出来。");
               dynStats(DynStat.Lust(5 + get_player().lib / 20));
               if(get_player().cor < 33)
               {
                  outputText("\n你摇了摇头，把这不受欢迎的幻想从脑海中清除，对此感到厌恶。");
               }
               else
               {
                  outputText("没过多久，它们便开始行动，将它们尖锐的兽根一个接一个地插入你的体内。你" + (get_noFur() ? "娇喘" : "尖叫") + "着，在它们轮流用阴茎结锁住你时，发出愉悦的嚎叫。");
                  dynStats(DynStat.Lust(5 + get_player().lib / 20));
                  if(get_player().cor <= 66)
                  {
                     outputText("\n你眨了眨眼，随着你控制住自己，幻想逐渐消退。那个白日梦太奇怪了，但也太火辣了。");
                  }
                  else
                  {
                     outputText("滚烫的狼精从你被填满的小穴中溢出，顺着大腿流下的感觉简直如登仙境，几乎让你当场高潮。你看到狼群的头狼又硬了，他那傲人的性器正因想要让你受孕的渴望而跳动着。");
                     dynStats(DynStat.Lust(5 + get_player().lib / 20));
                     if(get_player().cor < 80)
                     {
                        outputText("\n你将自己从幻想中拉回现实，恋恋不舍地把手从酸痛的" + get_player().vaginaDescript(0) + "上移开。");
                     }
                     else
                     {
                        outputText("当他挺进你那被蹂躏得湿漉漉的穴内时，你因不适而低吼，他将你撑得紧紧的，他心脏的每一次跳动都震颤着你的下体。伴随着绝妙的力道，他将阴茎结埋入你的体内，开始用他强效的精液填满你，这绝对会让你怀孕。你的双膝一软，因为你的幻想几乎让你高潮，突然撞击地面的冲击力将你从白日梦中惊醒。");
                        dynStats(DynStat.Lust(5 + get_player().lib / 20));
                     }
                  }
               }
            }
            else
            {
               outputText("在一群发情的狼面前摇晃着你的[asshole]，看着它们那闪亮的红色狗屌，在狼群里这么久没有雌性之后，简直要从阴茎鞘里跳出来扑向你。");
               dynStats(DynStat.Lust(5 + get_player().lib / 20));
               if(get_player().cor < 33)
               {
                  outputText("\n你摇了摇头，把这不受欢迎的幻想从脑海中清除，对此感到厌恶。");
               }
               else
               {
                  outputText("没过多久，它们就开始了进攻，把它们那尖尖的野兽阴茎一个接一个地插入你体内。当它们轮流用阴茎结锁住你时，你舒服得又叫又嚎。");
                  dynStats(DynStat.Lust(5 + get_player().lib / 20));
                  if(get_player().cor <= 66)
                  {
                     outputText("\n你眨了眨眼，随着你控制住自己，幻想逐渐消退。那个白日梦太奇怪了，但也太火辣了。");
                  }
                  else
                  {
                     outputText("那些滚烫的狼精从你被填满的屁股里溢出，顺着大腿流下的感觉简直像在天堂，几乎让你当场高潮。你看到狼群的首领又硬了，他那令人印象深刻的性器官正因为需要把欲望发泄在你身上而跳动着。");
                     dynStats(DynStat.Lust(5 + get_player().lib / 20));
                     if(get_player().cor < 80)
                     {
                        outputText("\n你恋恋不舍地将手从酸痛的屁眼上移开，把自己从幻想中拉回现实。");
                     }
                     else
                     {
                        outputText("当他挺进你那被蹂躏过的湿润小穴时，你因不适而低吼，他将你撑得紧紧的，他心脏的每一次跳动都震颤着你的后臀。伴随着绝妙的力道，他将阴茎结埋入你的体内，开始用他强效的精液填满你，这肯定会让你怀孕。你的幻想几乎让你高潮，你的双膝一软，突然撞击地面的冲击力将你从白日梦中惊醒。");
                        dynStats(DynStat.Lust(5 + get_player().lib / 20));
                     }
                  }
               }
            }
         }
         if(get_changes() < get_changeLimit() && Utils.trueOnceInN(5) && get_player().eyes.type > 0)
         {
            if(get_player().eyes.type == 2)
            {
               outputText("[pg]你感到眼睛一阵刺痛，眨了眨眼。感觉就像黑色的障翳刚刚从你眼睛上脱落，你甚至不需要照镜子就知道你的眼睛已经恢复了人类的模样。");
            }
            else
            {
               outputText("[pg]你眨了眨眼，踉跄了一下，一阵眩晕感几乎让你[feet]站立不稳。当你站稳并睁开眼睛时，你意识到似乎有些不同。你的视觉不知怎么改变了。");
               if(get_player().eyes.type == 1 || get_player().eyes.type == 7)
               {
                  outputText("你的蜘蛛眼消失了！</b>");
               }
               outputText("<b>你又拥有了正常的人类眼睛。</b>");
            }
            get_player().eyes.type = 0;
            get_player().eyes.count = 2;
            set_changes(get_changes() + 1);
         }
         if(get_mutations().tfNoFur() && Utils.trueOnceInN(5) && get_changes() < get_changeLimit() && get_player().face.type != 2 && get_player().hasFur() && get_player().lowerBody.type == 2)
         {
            if(get_player().face.type == 1)
            {
               outputText("[pg]你的脸被痛苦折磨着。你仰起头，在极度的痛苦中尖叫，你感觉到你的颧骨在断裂、移动，重塑成别的东西。<b>你那马一样的面部特征重新排列，呈现出许多犬科动物的特征。</b>");
            }
            else
            {
               outputText("[pg]你的脸被痛苦折磨着。你仰起头，在极度的痛苦中尖叫，你感觉到你的颧骨在断裂、移动，重塑成……别的东西。你找了个水坑照了照……<b>你的脸现在是人类和犬科动物特征的混合体。</b>");
            }
            get_player().face.type = 2;
            set_changes(get_changes() + 1);
         }
         if(get_mutations().tfNoFur() || get_player().hasFur())
         {
            if(param1 == 3 && !get_player().hasFur() && get_player().skin.furColor == "midnight black")
            {
               get_player().skin.furColor = "no";
            }
            if(param1 == 3 && (get_player().hair.color != "midnight black" || get_player().skin.furColor != "midnight black"))
            {
               if(!get_player().hasFur())
               {
                  outputText("[pg]<b>你的[skindesc]疯狂地发痒，长出皮毛覆盖了你的全身。它极其浓密，如同无月之夜般漆黑。</b>");
               }
               else
               {
                  if(get_player().hair.color != "midnight black" && get_player().skin.furColor != "midnight black")
                  {
                     _loc13_ = "皮毛和头发";
                  }
                  else
                  {
                     _loc13_ = get_player().skin.furColor != "midnight black" ? "皮毛" : "头发";
                  }
                  outputText("[pg]<b>你的" + _loc13_ + "感到一阵刺痛，变得比以往任何时候都要浓密，黑暗从根部开始蔓延，将其变成了午夜般的漆黑。</b>");
               }
               get_player().skin.type = 1;
               get_player().skin.adj = "thick";
               get_player().skin.desc = "fur";
               get_player().hair.color = "midnight black";
               get_player().skin.furColor = get_player().hair.color;
               get_player().underBody.restore();
            }
         }
         if(get_mutations().tfNoFur() && Utils.trueOnceInN(4) && get_changes() < get_changeLimit() && get_player().lowerBody.type == 2 && get_player().tail.type == 2 && !get_player().hasFur())
         {
            get_player().setFurColor(OneOf_Impl_.fromA(ColorLists.DOG_FUR));
            if(get_player().hasPlainSkin())
            {
               outputText("[pg]你的皮肤奇痒无比。你低头看着越来越多的毛发从皮肤中钻出，很快就变成了一层柔软的皮毛。<b>你现在从头到脚都覆盖着[furcolor]的毛发。</b>");
            }
            if(get_player().hasScales())
            {
               outputText("[pg]你的鳞片痒个不停。你抓了抓，感觉它们剥落下来，露出了下面长出的一层" + get_player().skin.furColor + "毛发！<b>你现在从头到脚都覆盖着[furcolor]的毛发。</b>");
            }
            get_player().skin.type = 1;
            get_player().skin.desc = "fur";
            get_player().underBody.restore();
            set_changes(get_changes() + 1);
         }
         if(Utils.trueOnceInN(3) && get_player().lowerBody.type != 2 && get_player().tail.type == 2 && get_player().ears.type == 2 && get_changes() < get_changeLimit())
         {
            if(get_player().lowerBody.type == 0)
            {
               outputText("[pg]你痛苦地尖叫起来，感觉脚上的骨头断裂并开始重新排列。<b>你现在长出了兽爪</b>。");
            }
            else if(get_player().lowerBody.type == 1)
            {
               outputText("[pg]你感觉你的蹄子突然裂开，长成了五根独立的脚趾。当你的蹄子重塑成毛茸茸的兽爪时，它们的血肉也变得柔软起来。");
            }
            else
            {
               outputText("[pg]你的下半身剧痛无比！当疼痛过去后，你发现自己正站在长满毛发的兽爪上！<b>你现在长出了兽爪</b>。");
            }
            get_player().lowerBody.type = 2;
            get_player().lowerBody.legCount = 2;
            set_changes(get_changes() + 1);
         }
         if(Utils.trueOnceInN(2) && get_player().ears.type != 2 && get_player().tail.type == 2 && get_changes() < get_changeLimit())
         {
            if(get_player().ears.type == -1)
            {
               outputText("[pg]你头上长出两个疼痛的肉包，它们不断生长并张开，变成了犬耳。");
            }
            if(get_player().ears.type == 0)
            {
               outputText("[pg]你脸颊两侧的皮肤被痛苦地拉扯着，你的耳朵向上移动，移到了头顶。它们变形并拉长，变成了犬类的耳朵。");
            }
            if(get_player().ears.type == 1)
            {
               outputText("[pg]你的马耳扭曲着，变成了犬耳。");
            }
            if(get_player().ears.type > 2)
            {
               outputText("[pg]你的耳朵变形了，变得更像犬类。");
            }
            get_player().ears.type = 2;
            outputText("<b>你现在有了狗耳朵。</b>");
            set_changes(get_changes() + 1);
         }
         if(Utils.trueOnceInN(3) && get_changes() < get_changeLimit() && get_player().tail.type != 2)
         {
            if(get_player().tail.type == 0)
            {
               outputText("[pg]你的臀部感到一阵压力。你摸了摸衣服下面，发现一个奇怪的凸起，似乎正在不断变大。几秒钟内，它从你的指间穿过，撑破了你的衣服后摆，一直长到快要触及地面的长度。一层厚厚的毛发迅速长出，覆盖了你的新尾巴。");
            }
            if(get_player().tail.type == 1)
            {
               outputText("[pg]你感到臀部一阵紧绷，与此同时，你的几条尾巴也紧紧地聚拢在一起。几秒钟内，它们融合成了单根尾巴，并迅速长出厚厚的毛发。");
            }
            if(get_player().tail.type == 3)
            {
               outputText("[pg]你尾巴的尖端感觉怪怪的。当你把它拉过来检查时，那铲状的尖端消失了，很快被覆盖在整个尾巴表面的一层厚厚毛发所取代。");
            }
            if(get_player().tail.type >= 4)
            {
               outputText("[pg]你感觉到你的臀部在移动和变化，血肉重塑并变成了一条长长、蓬松的尾巴！");
            }
            set_changes(get_changes() + 1);
            get_player().tail.type = 2;
            outputText("<b>你现在有了一条狗尾巴。</b>");
         }
         if(get_player().arms.type != 11 && get_player().isFurry() && get_player().tail.type == 2 && get_player().lowerBody.type == 2 && Utils.trueOnceInN(4) && get_changes() < get_changeLimit())
         {
            outputText("[pg]你的双臂感到一阵无力，无论你怎么做，都无法鼓起力气抬起或移动它们。难道这辣椒有什么类似药物的作用？你坐在地上，等待着这种无力感消退。就在这时，你意识到手部的骨骼和手臂上的肌肉正在发生变化。很快，从肩膀到指尖，它们就被一层柔软蓬松的[if (hasFurryUnderBody) {[underBody.furColor]|[furColor]}]毛发覆盖了。你的手掌变成了粉红色的肉垫，指甲变成了短爪，虽然不够锋利，不能撕裂血肉，但足够灵活，让攀爬和探索变得更容易。<b>你的手臂变得像狗一样了！</b>");
            get_player().arms.setType(11,5);
            set_changes(get_changes() + 1);
         }
         if(Utils.trueOnceInN(4) && get_player().hasGills() && get_changes() < get_changeLimit())
         {
            get_mutations().updateGills();
         }
         if(get_player().hasFur() && get_changes() < get_changeLimit() && Utils.trueOnceInN(3))
         {
            outputText("[pg]你变得更加……结实了。肌肉虬结。一段记忆不请自来，那是你年轻时在打猎时遇到的一只灰白老狼，它身上布满伤疤，但动作依然从容优雅。你想象着那一定就是这种感觉。");
            dynStats(DynStat.Tou(4),DynStat.Sens(-3));
            set_changes(get_changes() + 1);
         }
         if(get_changes() == 0)
         {
            outputText("[pg]非人的活力传遍你的全身，让你精神焕发！\n");
            get_player().HPChange(20,true);
            dynStats(DynStat.Lust(3));
         }
         get_player().refillHunger(15);
         var _loc14_:IMap = KFLAGS.flags;
         FlagDict_Impl_.arrayWriteInt(_loc14_,2077,FlagDict_Impl_.arrayReadInt(_loc14_,2077) + get_changes());
      }
   }
}

