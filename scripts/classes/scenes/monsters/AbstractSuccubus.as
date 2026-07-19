package classes.scenes.monsters
{
   import classes.Appearance;
   import classes.BreastRow;
   import classes.Monster;
   import classes.PerkLib;
   import classes.Player;
   import classes.StatusEffects;
   import classes.internals.Utils;
   import classes.items.Armor;
   import classes.items.ArmorLib;
   import classes.items.Undergarment;
   import classes.items.UndergarmentLib;
   import flash.Boot;
   
   public class AbstractSuccubus extends Monster
   {
      
      public var whipReady:Boolean;
      
      public function AbstractSuccubus()
      {
         if(Boot.skip_constructor)
         {
            return;
         }
         whipReady = false;
         super();
      }
      
      public function whipAttack() : void
      {
         var _loc4_:int = 0;
         if(!whipReady)
         {
            outputText("魅魔手腕一抖，一条鞭子般的绳索从她长着利爪的手掌中滑出。她试探性地甩了甩鞭子，发出得意的笑声。");
            whipReady = true;
            set_str(get_str() + 20);
            set_weaponName("whip");
            set_weaponVerb("brutal whip-crack");
            return;
         }
         if(hasStatusEffect(StatusEffects.Blind))
         {
            outputText(get_capitalA() + Utils.cnName(get_short()) + "疯狂地向你挥舞着鞭子，但因为她瞎了，完全没有打中！！");
            return;
         }
         outputText("魅魔狡黠地咧嘴一笑，熟练地甩动鞭子，狠狠地抽在了你的");
         var _loc1_:int = Utils.rand(6);
         var _loc2_:int = 0;
         var _loc3_:int = 0;
         if(_loc1_ == 0)
         {
            outputText("屁股上");
            _loc2_ = 4;
            _loc3_ = 6 + int(get_player().sens / 20);
         }
         if(_loc1_ == 1)
         {
            if(int(get_player().breastRows.length) > 0 && get_player().biggestTitSize() >= 1)
            {
               outputText(get_player().allBreastsDescript());
            }
            else
            {
               outputText("胸膛上");
            }
            _loc2_ = int(9 - get_player().get_armor().get_def());
            if(_loc2_ <= 0)
            {
               outputText("，但多亏了你的护甲，你并没有感到疼痛");
               _loc2_ = 0;
            }
            _loc3_ = 4 + int(get_player().sens / 15);
         }
         if(_loc1_ == 2)
         {
            _loc4_ = 0;
            if(get_player().get_armor() != ArmorLib.NOTHING)
            {
               if(get_player().get_armor().get_perk() == "Light")
               {
                  _loc4_ = 1;
               }
               else if(get_player().get_armor().get_perk() == "Medium")
               {
                  _loc4_ = 2;
               }
               else
               {
                  _loc4_ = 3;
               }
               if(get_player().get_armor() == get_armors().BEEARMR || get_player().get_armor() == get_armors().SSARMOR || get_player().get_armor() == get_armors().DBARMOR || get_player().get_armor() == get_armors().TBARMOR)
               {
                  _loc4_ = 2;
               }
               if(get_player().get_armor() == get_armors().GOOARMR)
               {
                  _loc4_ = 2;
               }
            }
            if(get_player().get_lowerGarment() != UndergarmentLib.NOTHING)
            {
               if(get_player().get_lowerGarment() == get_undergarments().SS_LOIN || get_player().get_lowerGarment() == get_undergarments().SSPANTY)
               {
                  _loc4_++;
               }
               else if(get_player().get_lowerGarment() == get_undergarments().DS_LOIN || get_player().get_lowerGarment() == get_undergarments().DSTHONG)
               {
                  _loc4_ += 2;
               }
            }
            if(_loc4_ >= 3)
            {
               outputText("腹股沟上，但幸运的是你穿了护裆");
               _loc2_ = 0;
            }
            else
            {
               if(get_player().get_gender() == 0)
               {
                  outputText("腹股沟上");
                  _loc2_ = 5;
                  _loc2_ /= _loc4_ + 1;
               }
               if(get_player().get_gender() == 1)
               {
                  outputText("腹股沟上，对你的[cocks]造成了痛苦的伤害，疼得你弯下了腰");
                  _loc2_ = int(get_player().maxHP() / 4);
                  if(_loc4_ > 0)
                  {
                     outputText("！当然，如果你没有穿戴护裆的话，情况会更糟");
                     _loc2_ /= _loc4_ + 1;
                  }
                  _loc2_ = get_player().reduceDamage(_loc2_,this);
                  if(_loc2_ < 20)
                  {
                     _loc2_ = 10;
                  }
                  _loc3_ = -15;
               }
               if(get_player().get_gender() == 2)
               {
                  outputText("腹股沟上，让你的" + get_player().vaginaDescript(0) + "感到一阵刺痛");
                  _loc2_ = 10;
                  _loc3_ = -8;
               }
               if(get_player().get_gender() == 3)
               {
                  outputText("腹股沟，对你的[cocks]和" + get_player().vaginaDescript(0) + "造成了痛苦的伤害，让你痛得弯下了腰");
                  _loc2_ = int(get_player().maxHP() / 3);
                  if(_loc4_ > 0)
                  {
                     outputText("！当然，如果你没有穿戴护裆的话，情况会更糟");
                     _loc2_ /= _loc4_ + 1;
                  }
                  _loc2_ = get_player().reduceDamage(_loc2_,this);
                  if(_loc2_ < 30)
                  {
                     _loc2_ = 30;
                  }
                  _loc3_ = -20;
               }
            }
         }
         if(_loc1_ == 3)
         {
            outputText("腿");
            _loc2_ = 7;
         }
         if(_loc1_ == 4)
         {
            outputText("手臂");
            _loc2_ = 8;
         }
         if(_loc1_ == 5)
         {
            outputText("脖子");
            _loc2_ = 24;
         }
         outputText("！");
         get_player().takeDamage(_loc2_,true);
         get_player().takeLustDamage(_loc3_,true);
      }
      
      public function seduceAttack() : void
      {
         var _loc1_:int = 0;
         var _loc2_:int = Utils.rand(3);
         if(_loc2_ == 0)
         {
            outputText(get_capitalA() + Utils.cnName(get_short()) + "拍了拍她的" + Appearance.buttDescriptionShort(this));
            if(butt.rating >= 10)
            {
               outputText("，让它愉快地抖动起来。");
               if(Utils.rand(100) <= 95)
               {
                  _loc1_ = Utils.rand(butt.rating) + 10;
                  outputText("\n这番景象相当诱人。");
               }
               else
               {
                  outputText("\n你无动于衷。");
               }
            }
            else
            {
               outputText("。");
               if(Utils.rand(100) <= 70 + butt.rating * 2)
               {
                  _loc1_ = Utils.rand(butt.rating) + 9;
                  outputText("\n这番景象相当诱人。");
               }
               else
               {
                  outputText("\n你无动于衷。");
               }
            }
            get_player().takeLustDamage(_loc1_,true);
         }
         if(_loc2_ == 1 && breastRows[0].breastRating >= 2)
         {
            if(int(breastRows.length) == 1)
            {
               outputText(get_capitalA() + Utils.cnName(get_short()) + "抚摸着她丰满的胸部，然后诱人地左右摇晃。");
               if(get_lust100() >= 50)
               {
                  outputText("" + pronoun2 + "坚挺的乳头似乎在要求你的注意。");
               }
               if(Utils.rand(100) <= 65 + biggestTitSize())
               {
                  outputText("\n这番景象相当诱人。");
                  _loc1_ = Utils.rand(breastRows[0].breastRating) + int(breastRows.length) + 10;
               }
               else
               {
                  outputText("\n你无动于衷。[pg]");
               }
            }
            if(int(breastRows.length) > 1)
            {
               outputText(get_capitalA() + Utils.cnName(get_short()) + "抚摸着" + pronoun2 + "几排丰满的胸肉，然后诱人地左右摇晃着。");
               if(get_lust100() >= 50)
               {
                  outputText("，你的[nipples]异常显眼。");
               }
               else
               {
                  outputText("。");
               }
               if(Utils.rand(100) <= 54 + (int(breastRows.length) - 1) * 15 + breastRows[0].breastRating)
               {
                  outputText("\n这番景象相当诱人。");
                  _loc1_ = int(Utils.rand(breastRows[0].breastRating) + int(breastRows.length) * breastRows[0].breasts + 5);
               }
               else
               {
                  outputText("\n你无动于衷。");
               }
            }
            get_player().takeLustDamage(_loc1_,true);
         }
         if(_loc2_ == 2)
         {
            outputText(get_capitalA() + Utils.cnName(get_short()) + "伸手抚摸着她湿润的阴唇。她叹了口气，把手指舔干净，向你投来炽热的目光。");
            if(Utils.rand(101) <= 65 + int(vaginas.length) * 10 + int(cocks.length) * 10)
            {
               outputText("\n这番景象相当诱人。");
               _loc1_ = Utils.rand(int(vaginas.length) * 2 + int(cocks.length) * 2) + 13;
            }
            else
            {
               outputText("\n你无动于衷。");
            }
            get_player().takeLustDamage(_loc1_,true);
         }
      }
      
      public function kissAttack() : void
      {
         outputText("魅魔向前跳着舞，手肘向后弯曲，准备进行恶毒的攻击。");
         if(get_player().get_spe() > get_spe() && Utils.rand(4) == 0 || get_player().hasPerk(PerkLib.Evade) && Utils.rand(4) == 0 || get_player().hasPerk(PerkLib.Misdirection) && Utils.rand(4) == 0 && get_player().get_armorName() == "red, high-society bodysuit")
         {
            outputText("你刚开始侧步躲闪，就意识到这是个假动作。你压低身子，从她真正的攻击下躲过……一个吻？！");
            if(get_player().get_lust100() >= 70)
            {
               outputText("也许你不该费力去躲的，那可能会很有趣。");
            }
         }
         else
         {
            outputText("你刚开始向侧面躲闪，但她熟练地改变了方向，在你的嘴唇上印下了一个湿润的吻。她像芭蕾舞演员一样优雅地旋转着躲开，留下你还在想刚才发生了什么。");
            if(!get_player().hasStatusEffect(StatusEffects.KissOfDeath))
            {
               get_player().createStatusEffect(StatusEffects.KissOfDeath,0,0,0,0);
            }
         }
      }
   }
}

