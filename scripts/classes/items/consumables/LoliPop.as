package classes.items.consumables
{
   import classes.BreastRow;
   import classes.Cock;
   import classes.Player;
   import classes._FlagDict.FlagDict_Impl_;
   import classes.bodyParts.Butt;
   import classes.bodyParts.Hips;
   import classes.globalFlags.KFLAGS;
   import classes.internals.Utils;
   import classes.items.Consumable;
   import classes.items.Mutations;
   import flash.Boot;
   import haxe.IMap;
   
   public class LoliPop extends Consumable
   {
      
      public function LoliPop()
      {
         if(Boot.skip_constructor)
         {
            return;
         }
         super("Lolipop","Lolipop","a shiny red lolipop",100,"A sweet-smelling hard candy. The scent reminds you of the treats one coveted in childhood.");
      }
      
      override public function useItem() : Boolean
      {
         var _loc6_:int = 0;
         var _loc7_:int = 0;
         var _loc9_:* = null as String;
         var _loc10_:* = null as String;
         var _loc11_:int = 0;
         var _loc12_:int = 0;
         var _loc13_:int = 0;
         var _loc14_:int = 0;
         var _loc15_:int = 0;
         var _loc16_:* = null as Player;
         var _loc17_:* = null as BreastRow;
         var _loc18_:* = null as Butt;
         var _loc19_:int = 0;
         var _loc20_:* = null as Cock;
         var _loc21_:Number = NaN;
         var _loc22_:* = null as Hips;
         var _loc1_:String = "lolipop";
         get_mutations().initTransformation([2,2,3,3,3,4,4,4,4]);
         var _loc2_:int = 0;
         var _loc3_:Boolean = false;
         var _loc4_:int = int(Math.min(75,15 * (FlagDict_Impl_.arrayReadInt(KFLAGS.flags,2696) - 1)));
         var _loc5_:Array = [];
         if(get_player().get_tallness() > 55)
         {
            _loc5_.push("shorter");
         }
         if(get_player().biggestTitSize() > 1)
         {
            _loc5_.push("breasts");
         }
         if(get_player().nippleLength > 0.1)
         {
            _loc5_.push("nipples");
         }
         if(get_player().hips.rating > 0)
         {
            _loc5_.push("hips");
         }
         if(get_player().butt.rating > 1)
         {
            _loc5_.push("butt");
         }
         if(int(_loc5_.length) == 0)
         {
            _loc4_ += 10;
            if(get_player().get_femininity() < 45)
            {
               _loc5_.push("feminine");
            }
            if(get_player().get_femininity() > 55)
            {
               _loc5_.push("masculine");
            }
            if(get_player().hasCock())
            {
               _loc5_.push("cock");
            }
            if(get_player().balls > 0)
            {
               _loc5_.push("balls");
            }
            if(!get_player().hasVagina())
            {
               _loc5_.push("vagina");
            }
            else if(get_player().getClitLength() > 0.2)
            {
               _loc5_.push("clit");
            }
         }
         if(int(_loc5_.length) == 0)
         {
            _loc4_ += 15;
         }
         if(!get_player().isChild() && FlagDict_Impl_.arrayReadInt(KFLAGS.flags,2696) > 0 && Utils.rand(100) < _loc4_)
         {
            _loc3_ = true;
            set_changeLimit(get_changeLimit() * 2);
         }
         if(int(_loc5_.length) > 0)
         {
            _loc2_ = int(Math.max(_loc3_ ? 3 : 1,Math.round(get_changeLimit() / int(_loc5_.length))));
         }
         outputText("你开始舔舐这根闪亮的棒棒糖，回忆起在英格纳姆的生活。糖果很甜，带点水果味——甚至比你在家乡能吃到的零食还要好。当这种味道在你的嘴里蔓延开来时，你沉浸在了童年的回忆中。[pg]");
         var _loc8_:int = 0;
         while(_loc8_ < int(_loc5_.length))
         {
            _loc9_ = _loc5_[_loc8_];
            _loc8_++;
            _loc10_ = _loc9_;
            if(_loc10_ == "balls")
            {
               outputText("你的阴囊迅速缩小");
               _loc11_ = 1;
               _loc12_ = _loc2_ + 1;
               _loc13_ = _loc12_ - 1;
               _loc14_ = _loc11_;
               while(_loc13_ >= _loc14_)
               {
                  _loc15_ = _loc13_--;
                  _loc6_ = _loc15_;
                  if(get_player().ballSize > 2)
                  {
                     _loc16_ = get_player();
                     --_loc16_.ballSize;
                  }
                  if(get_player().ballSize > 0.5)
                  {
                     var _temp_1:* = get_player();
                     _temp_1.ballSize = _temp_1.ballSize - 0.2;
                  }
                  else
                  {
                     get_player().balls = 0;
                  }
               }
               if(get_player().balls == 0)
               {
                  outputText("，最终完全消失了！[pg]");
               }
               else
               {
                  outputText("![pg]");
               }
            }
            else if(_loc10_ == "breasts")
            {
               outputText("你的胸部迅速收紧，甚至开始有灼烧感！你的手猛地抓向乳房，发现它们变小了。[pg]");
               _loc7_ = 0;
               while(_loc7_ < int(get_player().breastRows.length))
               {
                  _loc6_ = _loc2_;
                  while(_loc6_ > 0)
                  {
                     if(get_player().breastRows[_loc7_].breastRating >= 1)
                     {
                        _loc17_ = get_player().breastRows[_loc7_];
                        --_loc17_.breastRating;
                     }
                     _loc6_ -= 2;
                  }
                  _loc7_++;
               }
            }
            else if(_loc10_ == "butt")
            {
               outputText("你感觉到你的屁股开始缩小，很快变得更小更紧实。[pg]");
               _loc6_ = _loc2_;
               while(_loc6_ > 0)
               {
                  if(get_player().butt.rating > 1)
                  {
                     _loc18_ = get_player().butt;
                     --_loc18_.rating;
                  }
                  _loc6_ -= 2;
               }
            }
            else if(_loc10_ == "clit")
            {
               _loc7_ = 0;
               while(_loc7_ < int(get_player().vaginas.length))
               {
                  _loc11_ = 1;
                  _loc12_ = _loc2_ + 1;
                  _loc13_ = _loc12_ - 1;
                  _loc14_ = _loc11_;
                  while(_loc13_ >= _loc14_)
                  {
                     _loc15_ = _loc13_--;
                     _loc6_ = _loc15_;
                     if(get_player().getClitLength(_loc7_) > 0.2)
                     {
                        get_player().setClitLength(get_player().getClitLength(_loc7_) - 0.1,_loc7_);
                     }
                  }
                  _loc7_++;
               }
            }
            else if(_loc10_ == "cock")
            {
               _loc11_ = int(get_player().cocks.length);
               outputText("你注意到你的[cockplural]在缩小，");
               _loc6_ = _loc2_;
               while(_loc6_ > 0)
               {
                  _loc12_ = 0;
                  _loc13_ = int(get_player().cocks.length);
                  _loc14_ = _loc13_ - 1;
                  _loc15_ = _loc12_;
                  while(_loc14_ >= _loc15_)
                  {
                     _loc19_ = _loc14_--;
                     _loc7_ = _loc19_;
                     if(get_player().cocks[_loc7_].cockThickness > 0.5)
                     {
                        var _temp_2:* = get_player().cocks[_loc7_];
                        _temp_2.cockThickness = _temp_2.cockThickness - 0.1;
                     }
                     _loc20_ = get_player().cocks[_loc7_];
                     if((_loc20_.cockLength = _loc20_.cockLength - 1) < 2)
                     {
                        get_player().removeCock(_loc7_,1);
                     }
                  }
                  _loc6_ -= 2;
               }
               if(int(get_player().cocks.length) < _loc11_)
               {
                  if(int(get_player().cocks.length) == 0)
                  {
                     outputText("最终完全消失了！[pg]");
                  }
                  else
                  {
                     outputText("其中一些完全消失了！[pg]");
                  }
               }
               else
               {
                  outputText("让" + (_loc11_ > 1 ? "它们" : "它") + "变得更小，更像个孩子。[pg]");
               }
            }
            else if(_loc10_ == "feminine")
            {
               outputText("一阵麻木感席卷了你的五官，提醒你正在发生变化。你伸手摸了摸自己的脸，发现它变得更加中性，而且……更年轻了？你现在可能相当可爱！[pg]");
               _loc11_ = 1;
               _loc12_ = _loc2_ + 1;
               _loc13_ = _loc12_ - 1;
               _loc14_ = _loc11_;
               while(_loc13_ >= _loc14_)
               {
                  _loc15_ = _loc13_--;
                  _loc6_ = _loc15_;
                  if(get_player().get_femininity() < 30)
                  {
                     _loc16_ = get_player();
                     _loc16_.set_femininity(_loc16_.get_femininity() + 1);
                  }
                  if(get_player().get_femininity() < 50)
                  {
                     _loc16_ = get_player();
                     _loc16_.set_femininity(_loc16_.get_femininity() + 1);
                  }
               }
            }
            else if(_loc10_ == "hips")
            {
               outputText("伴随着令人毛骨悚然的骨骼弯曲声，你的身体随之颤抖，你的臀部变窄了，躯干和腿部之间的过渡变得平滑。[pg]");
               _loc6_ = _loc2_;
               while(_loc6_ > 0)
               {
                  if(get_player().hips.rating > 0)
                  {
                     _loc22_ = get_player().hips;
                     --_loc22_.rating;
                  }
                  _loc6_ -= 2;
               }
            }
            else if(_loc10_ == "masculine")
            {
               outputText("一阵麻木感席卷了你的五官，提醒你正在发生变化。你伸手摸了摸自己的脸，发现它变得更加中性，而且……更年轻了？你现在可能相当可爱！[pg]");
               _loc11_ = 1;
               _loc12_ = _loc2_ + 1;
               _loc13_ = _loc12_ - 1;
               _loc14_ = _loc11_;
               while(_loc13_ >= _loc14_)
               {
                  _loc15_ = _loc13_--;
                  _loc6_ = _loc15_;
                  if(get_player().get_femininity() > 75)
                  {
                     _loc16_ = get_player();
                     _loc16_.set_femininity(_loc16_.get_femininity() - 1);
                  }
                  if(get_player().get_femininity() > 55)
                  {
                     _loc16_ = get_player();
                     _loc16_.set_femininity(_loc16_.get_femininity() - 1);
                  }
               }
            }
            else if(_loc10_ == "nipples")
            {
               outputText("你能感觉到你的乳头在缩小。[pg]");
               _loc11_ = 1;
               _loc12_ = _loc2_ + 1;
               _loc13_ = _loc12_ - 1;
               _loc14_ = _loc11_;
               while(_loc13_ >= _loc14_)
               {
                  _loc15_ = _loc13_--;
                  _loc6_ = _loc15_;
                  if(get_player().nippleLength > 0.1)
                  {
                     var _temp_4:* = get_player();
                     _temp_4.nippleLength = _temp_4.nippleLength - 0.1;
                  }
               }
            }
            else if(_loc10_ == "shorter")
            {
               outputText("一想到成年人比你大那么多，你就感到一阵眩晕。你痛苦地皱起眉头，意识到自己变小了！[pg]");
               _loc11_ = 1;
               _loc12_ = _loc2_ + 1;
               _loc13_ = _loc12_ - 1;
               _loc14_ = _loc11_;
               while(_loc13_ >= _loc14_)
               {
                  _loc15_ = _loc13_--;
                  _loc6_ = _loc15_;
                  if(get_player().get_tallness() > 65)
                  {
                     _loc16_ = get_player();
                     _loc16_.set_tallness(_loc16_.get_tallness() - 1);
                  }
                  if(get_player().get_tallness() > 55)
                  {
                     _loc16_ = get_player();
                     _loc16_.set_tallness(_loc16_.get_tallness() - 1);
                  }
               }
            }
            else if(_loc10_ == "vagina")
            {
               if(Utils.rand(2 + _loc2_) >= 2)
               {
                  get_player().createVagina();
                  outputText("你的胯下传来一阵令人愉悦的刺痛感，一条细长光滑的缝隙显现出来，丰满的阴唇在你崭新的处女小穴周围成型。[pg]");
               }
            }
         }
         var _loc23_:IMap = KFLAGS.flags;
         FlagDict_Impl_.arrayWriteInt(_loc23_,2696,FlagDict_Impl_.arrayReadInt(_loc23_,2696) + 1);
         if(_loc3_)
         {
            switch(get_player().age)
            {
               case 0:
                  outputText("你的面容恢复了青春的活力，直到你感觉自己又像个青少年了！[pg]");
                  outputText("<b>你的年龄退化到了青少年！</b>");
                  get_player().set_age(2);
                  break;
               case 2:
                  outputText("你的面容保持着令人难以置信的青春活力，就像在英格纳姆的旧时光一样！你甚至感觉自己和看起来一样年轻！事实上，你觉得你现在就是看起来那么年轻。[pg]");
                  outputText("<b>你的年龄退化到了儿童！</b>");
                  get_player().set_age(1);
                  break;
               case 3:
                  outputText("你那饱经风霜、苍老的面容突然变得更加年轻，你感觉自己仿佛回到了全盛时期！[pg]");
                  outputText("<b>你的年龄退化到了成年！</b>");
                  get_player().set_age(0);
            }
            FlagDict_Impl_.arrayWriteInt(KFLAGS.flags,2696,1);
         }
         else if(!get_player().isChild() && FlagDict_Impl_.arrayReadInt(KFLAGS.flags,2696) <= 1)
         {
            outputText("<b>糖果的效果似乎让你变得更像个孩子。如果你不想产生更持久的影响，以后最好避免食用这些东西。</b>[pg]");
         }
         else
         {
            outputText("不知不觉中，棒棒糖已经在你嘴里融化了。[pg]");
         }
         return false;
      }
   }
}

