package classes
{
   import classes._FlagDict.FlagDict_Impl_;
   import classes.globalFlags.KFLAGS;
   import classes.internals.GuiOutput;
   import classes.internals.Utils;
   import classes.items.Armor;
   import classes.items.ArmorLib;
   import classes.items.Jewelry;
   import classes.lists.Age;
   import coc.view.CoCButton;
   import flash.Boot;
   
   public class PlayerAppearance extends BaseContent
   {
      
      public function PlayerAppearance()
      {
         if(Boot.skip_constructor)
         {
            return;
         }
         super();
      }
      
      public function sockDescript(param1:int) : void
      {
      }
      
      public function shortSuffix(param1:Number) : String
      {
         return Measurements.shortSuffix(param1);
      }
      
      public function numInchesOrCentimetres(param1:Number) : String
      {
         return Measurements.numInchesOrCentimetres(param1);
      }
      
      public function inchesOrCentimetres(param1:Number) : String
      {
         return Measurements.inchesOrCentimetres(param1);
      }
      
      public function inchOrCentimetre(param1:Number) : String
      {
         return Measurements.inchOrCentimetre(param1);
      }
      
      public function genderMenu() : void
      {
         var choice2:int;
         var _g2:PlayerAppearance;
         var choice1:int;
         var _g1:PlayerAppearance;
         var choice:int;
         var _g:PlayerAppearance;
         clearOutput();
         outputText("选择性别的决定方式。这只会改变代词和其他与性别相关的词语，不会改变你的身体。");
         outputText("[pg]当前性别：" + get_player().mfn("男性","女性",get_player().mf("男性","女性") + "/中性") + " ([malefemaleherm])");
         menu();
         _g = this;
         choice = 0;
         addButton(0,"自动",function():void
         {
            _g.genderChange(choice);
         }).hint("这是默认设置，游戏将根据你的女性化程度、乳房大小和生殖器来决定你的性别。").disableIf(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,2723) == 0,"这是当前设置。游戏将根据你的女性化程度、乳房大小和生殖器来决定你的性别。");
         _g1 = this;
         choice1 = 1;
         addButton(1,"男性",function():void
         {
            _g1.genderChange(choice1);
         }).hint("你的性别将始终为男性。").disableIf(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,2723) == 1,"这是当前设置。");
         _g2 = this;
         choice2 = 2;
         addButton(2,"女性",function():void
         {
            _g2.genderChange(choice2);
         }).hint("你的性别将始终为女性。").disableIf(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,2723) == 2,"这是当前的设置。");
         addButton(14,"返回",appearance);
      }
      
      public function genderChange(param1:int) : void
      {
         FlagDict_Impl_.arrayWriteInt(KFLAGS.flags,2723,param1);
         genderMenu();
      }
      
      public function appearance() : void
      {
         var _loc4_:* = null as String;
         var _loc5_:* = null as String;
         var _loc6_:* = null as Array;
         var _loc7_:int = 0;
         var _loc8_:* = null as String;
         var _loc9_:int = 0;
         var _loc10_:int = 0;
         var _loc11_:* = null as BreastRow;
         var _loc12_:* = null as CockTypesEnum;
         var _loc1_:Number = 0;
         var _loc2_:Number = 0;
         var _loc3_:String = "human";
         _loc3_ = get_player().get_race();
         get_output().clear().header("外貌");
         if(_loc3_ != get_player().startingRace || get_player().age != get_player().startingAge)
         {
            _loc4_ = "";
            if(_loc3_ != get_player().startingRace)
            {
               _loc4_ += get_player().startingRace;
            }
            if(get_player().age != get_player().startingAge)
            {
               _loc4_ += " " + Age.strings[get_player().startingAge];
            }
            _loc4_ = StringTools.trim(_loc4_);
            _loc5_ = "a";
            _loc6_ = ["天角兽","马族","鸟人","针鼹","小恶魔","成年","长者"];
            _loc7_ = 0;
            while(_loc7_ < int(_loc6_.length))
            {
               _loc8_ = _loc6_[_loc7_];
               _loc7_++;
               if(_loc4_.indexOf(_loc8_) == 0)
               {
                  _loc5_ = "an";
               }
            }
            get_output().text("你作为" + Utils.cnName(_loc4_) + "开始了你的旅程，但在探索这个领域的危险时放弃了这一身份。");
         }
         get_output().text("你是一个身高[tallness]的" + (get_player().redundantRaceGender() ? "" : "[malefemaleherm]") + "[race]" + (get_player().redundantRaceAge() ? "" : "[age]") + "，[bodytype]。");
         outputText("<b>你目前正" + (get_player().armorDescript() != "gear" ? "穿着" + get_player().armorDescript() : (get_player().get_armor().get_id() == get_armors().VINARMR.get_id() ? "被藤蔓缠绕" : "赤身裸体")) + "，使用[weapon]作为武器。</b>");
         if(get_player().featheryHairPinEquipped())
         {
            _loc4_ = "";
            _loc4_ += " <b>你有一根带着单片红色羽毛的发簪";
            if(get_player().hair.length > 0)
            {
               _loc4_ += "插在你的[hair]里。</b>";
            }
            else
            {
               _loc4_ += " 戴在你的头上。</b>";
            }
            outputText(_loc4_);
         }
         if(get_player().get_jewelryName() != "nothing")
         {
            outputText("<b>你的一根手指上戴着" + Utils.cnName(get_player().get_jewelry().get_longName()) + "。</b>");
         }
         if(get_player().face.type == 0 || get_player().face.type == 4 || get_player().face.type == 8 || get_player().face.type == 10 || get_player().face.type == 17 || get_player().face.type == 6)
         {
            if(get_player().hasPlainSkin() || get_player().hasGooSkin() || get_player().hasBarkSkin())
            {
               outputText("你的脸在形状和结构上都是人类的模样，有着[skin]。");
            }
            if(get_player().hasFur())
            {
               outputText("在你的[skinfurscales]之下，你有一个人类形状的头颅，上面有着[skin]。");
            }
            if(get_player().hasScales())
            {
               outputText("你的脸在形状上相当接近人类，但覆盖着[skin]。");
            }
            if(get_player().face.type == 4)
            {
               outputText("你的嘴里长满了一排锋利且可伸缩的鲨鱼牙齿，这让你的面容看起来有些棱角分明。");
            }
            else if(get_player().face.type == 8)
            {
               outputText("你鼻子不断的抽动和门牙的长度，让你的面容带有一丝兔子般的可爱。");
            }
            else if(get_player().face.type == 10)
            {
               outputText("一对可伸缩的针状毒牙取代了你的犬齿，随时准备注射毒液。");
            }
            else if(get_player().face.type == 17)
            {
               outputText("你眼睛周围的[skinfurscales]比脸部其他地方的颜色要深得多，让你看起来像是戴着一个可爱的雪貂面具。");
            }
            else if(get_player().face.type == 6)
            {
               outputText("你的嘴里长着一副像猫一样锋利的牙齿。");
            }
         }
         else if(get_player().face.type == 18)
         {
            if(!get_player().hasFur())
            {
               outputText("你的脸是人类和雪貂特征的可爱结合体，还长着湿润的鼻子和胡须。唯一奇怪的是你没有毛发，让你那张像雪貂一样的脸上只露出[skin]。");
            }
            else
            {
               outputText("你的脸有着鼬科动物的口鼻，看起来像雪貂，还有一个可爱的粉色鼻子。脸上覆盖着一层柔软的[furcolor]色的毛发，口鼻和脸颊上还有白色的斑块。眼睛周围有一圈明显的[furcolor]毛发，形成了一个面具的形状。");
            }
         }
         else if(get_player().face.type == 13)
         {
            if(!get_player().isFurryOrScaley())
            {
               outputText("你的脸在形状和结构上都是人类的模样，有着[skin]");
               if((get_player().skin.tone == "ebony" || get_player().skin.tone == "black") && (get_player().hasPlainSkin() || get_player().hasGooSkin()))
               {
                  outputText("，不过由于你肤色暗沉，你戴着的黑色浣熊面具并不怎么显眼。");
               }
               else
               {
                  outputText("，不过你的眼睛上装饰着一个看起来很狡猾的浣熊面具。");
               }
            }
            else
            {
               if((get_player().skin.furColor == "black" || get_player().skin.furColor == "midnight") && get_player().isFurryOrScaley())
               {
                  outputText("在你的[skinfurscales]下隐藏着一个黑色的浣熊面具，由于你墨黑的肤色而几乎看不见，并且");
               }
               else
               {
                  outputText("你的[skinfurscales]上点缀着一个看起来很狡猾的浣熊面具，在它们下面");
               }
               outputText("你长着一颗人类形状的头颅，上面覆盖着[skin]。");
            }
         }
         else if(get_player().face.type == 14)
         {
            outputText("你长着一张三角形的浣熊脸，长满了敏感的胡须和一个黑色的小鼻子；一个面具遮住了你眼睛周围的区域，通过一条白色的带子与你的[skinfurscales]隔开。");
            if(get_player().hasPlainSkin())
            {
               outputText("只有皮肤而没有毛发，看起来有点奇怪。");
            }
            else if(get_player().hasReptileScales())
            {
               outputText("这些鳞片的存在让你的面容看起来有些诡异，与其说是哺乳动物，不如说更像爬行动物。");
            }
         }
         else if(get_player().face.type == 11)
         {
            outputText("你有一张尖尖的、看起来很精明的狐狸脸，鼻子后面还点缀着向下弯曲的胡须。");
            if(get_player().hasPlainSkin() || get_player().hasBarkSkin())
            {
               outputText("奇怪的是，你那兽性的口鼻上没有毛，只有[skinfurscales]。");
            }
            else if(get_player().hasFur())
            {
               if(get_player().hasDifferentUnderBody())
               {
                  outputText("你的口鼻上装饰着[skinfurscales]，上颚和头部是[skinfurscales]，下颚是[underbody.skinfurscales]。");
               }
               else
               {
                  outputText("你的口鼻上覆盖着一层[skinfurscales]。");
               }
            }
            else if(get_player().hasScales())
            {
               outputText("奇怪的是，你那兽性面容的每一[if (metric) {bit|inch}]都装饰着[skinfurscales]。");
            }
         }
         else if(get_player().face.type == 15)
         {
            outputText("你的脸在形状和结构上大体保持人类的特征，有着[skin]" + (get_player().hasFur() ? "，上面覆盖着[skinfurscales]" : "") + "，以及老鼠般的龅牙。");
         }
         else if(get_player().face.type == 16)
         {
            outputText("你有一张短而尖的老鼠脸，长着胡须、粉色的小鼻子，还有[skin]" + (get_player().hasFur() ? "，上面覆盖着[skinfurscales]" : "") + "。两颗巨大的门牙让它看起来更加完整。");
         }
         if(get_player().face.type == 5)
         {
            if(get_player().hasPlainSkin() || get_player().hasGooSkin() || get_player().hasBarkSkin())
            {
               outputText("你的脸看起来相当正常，有着[skin]。唯一的怪异之处是那对经常挂在下唇上、滴着毒液的毒牙。");
            }
            if(get_player().hasFur())
            {
               outputText("在你的[skinfurscales]之下，你有一个人类形状的头，有着[skin]。此外，一对毒牙挂在你的下唇上，滴着毒液。");
            }
            if(get_player().hasScales())
            {
               outputText("你的脸形状相当像人类，但被[skinfurscales]覆盖。此外，一对毒牙挂在你的下唇上，滴着毒液。");
            }
         }
         if(get_player().face.type == 1)
         {
            if(get_player().hasPlainSkin() || get_player().hasGooSkin() || get_player().hasBarkSkin())
            {
               outputText("你的脸在形状和结构上都像马族。这张奇怪的脸没有毛发，被[skinfurscales]覆盖着。");
            }
            if(get_player().hasFur())
            {
               outputText("你的脸看起来几乎完全是马的样子，甚至长着[skinfurscales]。在毛发之下，你相信自己有[skin]。");
            }
            if(get_player().hasScales())
            {
               outputText("你有着马的脸庞和头部结构，上面覆盖着闪闪发光的[skinfurscales]。");
            }
         }
         if(get_player().face.type == 24)
         {
            outputText("你有一张棱角分明的狼脸，有着突出的口鼻和黑色的鼻子");
            if(!get_player().hasFur())
            {
               outputText("，尽管没有任何毛发。");
            }
            else
            {
               outputText("。");
            }
         }
         if(get_player().face.type == 2)
         {
            if(get_player().hasPlainSkin() || get_player().hasGooSkin() || get_player().hasBarkSkin())
            {
               outputText("你长着一张像狗一样的脸，还有一个湿漉漉的鼻子。这张古怪的脸上没有毛发，覆盖着[skinfurscales]。");
            }
            if(get_player().hasFur())
            {
               outputText("你长着一张狗脸，有一个湿漉漉的鼻子和一条喘着粗气的舌头。你长着[skinfurscales]，在你毛茸茸的脸庞下隐藏着你的[skin]。");
            }
            if(get_player().hasScales())
            {
               outputText("你的面部结构像狗一样，有湿漉漉的鼻子等等，但上面覆盖着闪闪发光的[skinfurscales]。");
            }
         }
         if(get_player().face.type == 28)
         {
            if(get_player().hasPlainSkin() || get_player().hasGooSkin() || get_player().hasBarkSkin())
            {
               outputText("你长着一张像猫一样的脸，还有一个可爱、湿润的鼻子和胡须。由于没有毛发而露出的[skin]在这样一张猫脸上看起来很不寻常。");
            }
            else if(get_player().hasFur())
            {
               if(get_player().hasDifferentUnderBody())
               {
                  outputText("你长着一张像猫一样的脸，有湿润的鼻子和胡须。你的上颚和头部有[skinfurscales]，而你的下颚则装饰着[underbody.skinfurscales]，在下面隐藏着你的[skin.noadj]。");
               }
               else
               {
                  outputText("你长着一张猫一样的脸，湿润的鼻子和胡须一应俱全。你的[skinDesc]是[furcolor]的，隐藏了下面的[skin.noadj]。");
               }
            }
            else if(get_player().hasScales())
            {
               outputText("你的面部结构融合了人类和猫的特征。湿润的鼻子和胡须一应俱全，但上面覆盖着闪闪发光的[skinfurscales]。");
            }
         }
         if(get_player().face.type == 3)
         {
            if(get_player().hasPlainSkin() || get_player().hasGooSkin() || get_player().hasBarkSkin())
            {
               outputText("你的脸看起来像牛头人，有着牛一样的特征，特别是一个方方正正的湿润鼻子。尽管你身体其他地方没有毛发，但你的脸上确实有一层短短的棕色绒毛。");
            }
            if(get_player().hasFur())
            {
               outputText("你的脸看起来像牛头人，有着牛一样的特征，特别是一个方方正正的湿润鼻子。你的[skinfurscales]在头上明显变厚，覆盖在你的脸上，看起来毛茸茸的，显得相当骇人。");
            }
            if(get_player().hasScales())
            {
               outputText("你的脸看起来像牛头人，但奇怪的是，它被闪闪发光的鳞片覆盖，一直延伸到你脸上突出的扁平牛鼻。");
            }
         }
         if(get_player().face.type == 7)
         {
            if(get_player().hasPlainSkin() || get_player().hasGooSkin() || get_player().hasBarkSkin())
            {
               outputText("你的脸看起来像蜥蜴，长满利齿的大嘴让你看起来相当可怕。这张爬行动物的脸只有[skin]，看起来有点奇怪。");
            }
            if(get_player().hasFur())
            {
               outputText("你的脸看起来像蜥蜴。长满利齿的大嘴、尖尖的吻部，再加上覆盖在脸上的[skinfurscales]，让你看起来相当可怕。");
            }
            if(get_player().hasScales())
            {
               outputText("你的脸是蜥蜴的脸，长着长满利齿的大嘴和尖尖的吻部。");
               if(!get_player().hasReptileUnderBody())
               {
                  outputText("反光的[skinfurscales]让你的外表更加完美，让你看起来相当可怕。");
               }
               else
               {
                  outputText("你上颚和头部的反光[skinfurscales]以及下颚的[underbody.skinfurscales]让你的外表更加完美，让你看起来相当可怕。");
               }
            }
         }
         if(get_player().face.type == 12)
         {
            outputText("你的脸是一个狭长的爬行动物口鼻。乍一看，它像掠食性蜥蜴的脸，但下颌长着一排不寻常的尖刺。这让你看起来既威严又凶猛。张开嘴会露出几排匕首般锋利的牙齿。这可怕的面容上点缀着[skinfurscales]");
            outputText(get_player().hasReptileUnderBody() ? "，它们覆盖了你的上颌和头部，而下颌则是[underbody.skinfurscales]。" : "。");
         }
         if(get_player().face.type == 9)
         {
            outputText("你的脸");
            if(get_player().hasPlainSkin())
            {
               outputText("光秃秃的");
            }
            else
            {
               outputText("被[skinfurscales]覆盖着");
            }
            outputText("形状像袋鼠，除了你那奇特面容的极端长度外，有点像兔子。");
         }
         if(get_player().face.type == 19)
         {
            outputText("你的脸像猪一样，有着[skintone]的皮肤，还有一个总是扭动的鼻子。");
         }
         if(get_player().face.type == 20)
         {
            outputText("你的脸像野猪一样，");
            if(get_player().hasFur())
            {
               outputText("在你的[furcolor]毛发下有着[skintone]的皮肤");
            }
            outputText("，长着獠牙和一个总是扭动的鼻子。");
         }
         if(get_player().face.type == 21)
         {
            outputText("你的脸像犀牛一样");
            if(get_player().hasPlainSkin())
            {
               outputText("，长着[skin]，配有长长的吻部和鼻子上的角。");
            }
            else
            {
               outputText("长着长长的吻部，鼻子上还有一只角。奇怪的是，你的脸上也覆盖着[skinfurscales]。");
            }
         }
         if(get_player().face.type == 22)
         {
            outputText("你古怪的面容长着一个细长的针鼹吻部。");
            if(get_player().hasPlainSkin() || get_player().hasGooSkin() || get_player().hasBarkSkin())
            {
               outputText("你那没有毛发遮挡的[skin]看起来很不寻常。");
            }
            else if(get_player().hasFur())
            {
               outputText("它被[skinfurscales]覆盖着。");
            }
            else if(get_player().hasScales())
            {
               outputText("它被[skinfurscales]覆盖着，让你的脸看起来更加不寻常。");
            }
         }
         if(get_player().face.type == 23)
         {
            outputText("你的脸像鹿一样，口鼻部的末端长着一个鼻子。");
            if(get_player().hasPlainSkin() || get_player().hasGooSkin() || get_player().hasBarkSkin())
            {
               outputText("你那没有毛发遮挡的[skin]看起来很不寻常。");
            }
            else if(get_player().hasFur())
            {
               if(get_player().hasDifferentUnderBody())
               {
                  outputText("你的上颚和头部覆盖着[skinfurscales]，下颚覆盖着[underbody.skinfurscales]，遮住了下面的[skin.noadj]。");
               }
               else
               {
                  outputText("它被[skinfurscales]覆盖，遮住了下面[skin.noadj]的皮肤。");
               }
            }
            else if(get_player().hasScales())
            {
               outputText("它被[skinfurscales]覆盖，让你的脸看起来更加与众不同。");
            }
         }
         if(get_player().face.type == 25)
         {
            if(get_player().underBody.skin.type == 8)
            {
               outputText("你长着一张鸡蛇的脸，上面覆盖着[furcolor]的羽毛皮肤，还有一个像喙一样的口鼻。");
            }
            else
            {
               outputText("你长着一张鸡蛇的脸，上面覆盖着[skinfurscales]，还有一个像喙一样的口鼻。");
            }
         }
         if(get_player().face.type == 27)
         {
            outputText("你的脸有着独特的动物口鼻，就像小熊猫一样，配上一个可爱的粉色鼻子。一层柔软的[if (hasFur) {[furcolor]|赤红}]色毛发覆盖着你的头部，口鼻、脸颊和眉毛上还有白色的斑块。");
         }
         if(get_player().face.type == 29)
         {
            outputText("你长着一张豺狼人的脸，深色的鬣狗般口鼻总是挂着一抹冷笑。虽然你湿润的鼻子和喘着气的舌头看起来像只顽皮的小狗，但你明亮的橙色眼睛和野蛮的獠牙却表明你是一头野兽。");
         }
         if(get_player().face.type == 30)
         {
            outputText("你的脸长着蝙蝠般的口鼻，有上翘的叶状鼻子，犬齿比人类更长。");
         }
         outputText("有着[facelong]。");
         if(get_player().eyes.type == 7)
         {
            outputText("你的眼睛很正常，除了黑色的虹膜，这让它们显得不祥且具有催眠作用。");
         }
         else if(get_player().eyes.type == 2)
         {
            outputText("你的眼睛是漆黑的、异形的黑暗实心球体。");
         }
         else if(get_player().eyes.type == 6)
         {
            outputText("你的琥珀色眼睛周围有一圈黑色的斑纹，可以防止阳光遮挡视线，并且有第二层眼睑来保持眼球湿润。你相当近视，但你的周边视觉非常棒！");
         }
         else if(get_player().eyes.type == 8)
         {
            outputText("你有着电蓝色的眼睛，里面布满了闪电般的网状条纹，彰显着它们的力量，瞳孔则是爬行动物般的竖瞳。当你兴奋时，你的瞳孔会放大成宽阔的圆孔。");
         }
         else if(get_player().eyes.type == 9)
         {
            outputText("你的眼睛和猫很像，有着细长的竖瞳。");
         }
         else if(get_player().hasReptileEyes())
         {
            outputText("你的眼睛是");
            switch(get_player().eyes.type)
            {
               case 3:
                  outputText("蜥蜴般的眼睛，有着垂直的瞳孔和黄绿色的虹膜。它们");
                  break;
               case 4:
                  outputText("骄傲而凶猛的龙眼，有着垂直的竖瞳和燃烧般的橙色虹膜。它们即使在黑暗中也闪闪发光，并且");
                  break;
               case 5:
                  outputText("蛇怪的眼睛，灰色的爬行动物眼眸，有着垂直的瞳孔。它们");
            }
            outputText("带有典型的第二层眼睑，让你眨眼的次数是其他人的两倍。");
            if(get_player().eyes.type == 5)
            {
               outputText("其他人似乎被迫注视着它们。");
            }
         }
         if(get_player().eyes.count > 2)
         {
            outputText("除了你的两只主眼外，你的额头上还有[extraEyesShort]。");
         }
         if(get_player().hair.length == 0)
         {
            if(get_player().hasFur())
            {
               outputText("你没有头发，头顶只有一层薄薄的兽毛。");
            }
            else if(get_player().hasWool())
            {
               outputText("你没有头发，头顶只有一层薄薄的羊毛。");
            }
            else
            {
               outputText("你完全是个秃头，原本该长头发的地方只露出闪亮的[skinTone][skinDesc]。");
            }
            switch(get_player().ears.type)
            {
               case 1:
                  outputText("一对马一样的耳朵从你的头顶竖起。");
                  break;
               case 2:
                  outputText("一对狗耳朵从你的头骨上突出来，可爱地耷拉着。");
                  break;
               case 3:
                  outputText("一对圆圆的、耷拉着的牛耳朵从你的头骨两侧突出来。");
                  break;
               case 4:
               case 20:
                  outputText("一对尖尖的大耳朵从你的头骨上伸出来。");
                  break;
               case 5:
                  outputText("一对毛茸茸的可爱猫耳从你的头顶长了出来。");
                  break;
               case 6:
                  outputText("你头部两侧有一对带小孔的圆形突起，这就是你的耳朵。");
                  break;
               case 7:
                  outputText("你头顶竖着一对软趴趴的兔耳，走起路来一晃一晃的。");
                  break;
               case 9:
                  outputText("你头顶高高竖起一对又大又灵敏的狐狸耳朵，时刻倾听着周围的动静。");
                  break;
               case 10:
                  outputText("你头部两侧有一对带小孔的圆形突起，这就是你的耳朵。在它们后面长出了骨质的鳍。");
                  break;
               case 11:
                  outputText("你头上长着一对毛茸茸的、略呈卵形的浣熊耳朵。");
                  break;
               case 12:
                  outputText("一对大大的、碟状的老鼠耳朵长在你的头顶。");
                  break;
               case 13:
                  outputText("一对长满[if (hasFur) {[furcolor]|白色}]毛发的大雪貂耳朵长在你的头顶，能很好地察觉附近的声响。");
                  break;
               case 14:
                  outputText("一对尖尖的、下垂的猪耳朵从你的头顶长了出来。");
                  break;
               case 15:
                  outputText("一对张开的管状犀牛耳朵从你的头上突出来。");
                  break;
               case 16:
                  outputText("你的头上出现了一对小小的圆形开口，那就是你的耳朵。");
                  break;
               case 17:
                  outputText("一对像鹿一样的耳朵从你的头顶竖起。");
                  break;
               case 18:
                  outputText("一对狼耳从你的头上竖起，敏锐地捕捉着周围的每一个声音。");
                  break;
               case 19:
                  outputText("两只水滴状的耳朵从你头部两侧探出，毛茸茸的质感和慵懒的姿态让你显得既可爱又困倦。");
                  break;
               case 22:
                  outputText("巨大、长满白毛的小熊猫耳朵趴在你的头顶，让你对周围的环境保持高度警觉。");
                  break;
               case 23:
                  outputText("一对宽大圆润的鬣狗耳朵立在你的头顶，深棕色的皮毛出奇地柔软。耳尖呈现出可爱的圆弧状，略呈圆锥和碟状的形状让你的耳朵更加敏感，善于捕捉声音。");
                  break;
               case 24:
                  outputText("两只硕大尖锐的蝙蝠耳朵从你的头上长出，比起声音，它们更能捕捉到微风。");
            }
            if(get_player().antennae.type == 2)
            {
               outputText("柔软下垂的触角也出现在你的头骨上，在微风中摇曳弹跳。");
            }
            else if(get_player().antennae.type == 3)
            {
               outputText("两根羽毛般的长触角长在你的发际线上，顺着你头部的轮廓弯曲。");
            }
         }
         else
         {
            switch(get_player().ears.type)
            {
               case 0:
                  outputText("[hair]正适合你，把你的脸型衬托得很好看。");
                  break;
               case 1:
                  outputText("你头上的[hair]在两只非常像马的耳朵周围分开，这两只耳朵从你的头上长出来。");
                  break;
               case 2:
                  outputText("你头上的[hair]被一对尖尖的狗耳朵覆盖着。");
                  break;
               case 3:
                  outputText("你头上的[hair]被一对向两侧伸出的圆润牛耳分开。");
                  break;
               case 4:
                  outputText("你头上的[hair]被一对可爱的尖耳朵分开，它们比你以前的人类耳朵还要大。");
                  break;
               case 5:
                  outputText("你头上的[hair]被一对可爱、毛茸茸的猫耳分开，它们从你头顶长出，并会机警地转向任何突发的声响。");
                  break;
               case 6:
                  outputText("你头顶的[hair]让人几乎无法注意到那两个作为你耳朵的小圆孔。");
                  break;
               case 7:
                  outputText("一对软趴趴的兔子耳朵从你的[hair]中竖起，随着你走路一蹦一跳的。");
                  break;
               case 8:
                  outputText("你头顶的[hair]被一对长满绒毛的袋鼠长耳朵分开，它们以一定的角度向外伸出。");
                  break;
               case 9:
                  outputText("你头顶的[hair]被一对大而灵敏的狐狸耳朵分开，它们似乎总是在倾听。");
                  break;
               case 10:
                  outputText("你头顶的[hair]被一对圆形的突起分开，你头部两侧的小孔充当着你的耳朵。骨质的鳍从它们后面长出来。");
                  break;
               case 11:
                  outputText("你头上的[hair]在一对毛茸茸的卵形浣熊耳朵周围分开。");
                  break;
               case 12:
                  outputText("你头顶的[hair]从一对高高竖起的碟状大老鼠耳朵之间和周围穿过。");
                  break;
               case 13:
                  outputText("大大的、长着[if (hasFur) {[furcolor]|白色}]毛发的雪貂耳朵从你的[hair]中探出，能很好地察觉到附近的声音。");
                  break;
               case 14:
                  outputText("你头上的[hair]被一对尖尖的、软趴趴的猪耳朵分开。当你不注意时，它们经常会自己抖动。");
                  break;
               case 15:
                  outputText("你头上的[hair]被一对管状的犀牛耳朵分开。");
                  break;
               case 16:
                  outputText("你的[hair]遮挡住了你那小小的圆形耳孔，让人几乎看不见。");
                  break;
               case 17:
                  outputText("你头上的[hair]在一对从你头上长出的鹿耳周围分开。");
                  break;
               case 18:
                  outputText("一对狼耳从你的头上伸出，分开了你的[hair]，并对周围的环境保持警惕。");
                  break;
               case 19:
                  outputText("两只水滴状的耳朵分开你的[hair]，从你头部两侧探出，它们毛茸茸的质感和慵懒的姿态让你看起来既可爱又困倦。");
                  break;
               case 22:
                  outputText("你的头顶上长着一对长满白色绒毛的巨大红熊猫耳朵，分开了你的[hair]，让你对周围的环境保持警惕。");
                  break;
               case 23:
                  outputText("一对巨大而圆润的鬣狗耳朵立在你的头顶，分开了你的[hair]，深棕色的皮毛出奇地柔软。它们的末端是可爱的圆点，略呈圆锥形和碟形的形状使你的耳朵更加敏感，更善于捕捉声音。");
                  break;
               case 24:
                  outputText("你的[hair]被一对超大的尖蝙蝠耳朵分开了，这对耳朵捕捉到的微风比声音还多。");
            }
            if(get_player().gills.type == 2 || get_player().gills.type == 3)
            {
               get_output().text(" 你的脖子上长着一组鱼鳃，几条小缝隙可以平贴在你的皮肤上。它们能让你在水里待很长时间。");
            }
            if(get_player().antennae.type == 2)
            {
               if(get_player().ears.type == 7)
               {
                  outputText("软绵绵的触角也从你的发际线后方长出，和你的耳朵一起在微风中摇曳。");
               }
               else
               {
                  outputText("软趴趴的触角也从你的发际线后方长出，在微风中上下晃动、随风摇曳。");
               }
            }
            else if(get_player().antennae.type == 3)
            {
               outputText("两根羽毛般的长触角长在你的发际线上，顺着你头部的轮廓弯曲。");
            }
         }
         if(get_player().ears.type == 21)
         {
            outputText("你的头部两侧伸出了四根羽毛，最长的一根垂直向上，而另外三根较短的则分别呈1点钟、2点钟和3点钟方向伸出。在它们后面隐藏着充当耳朵的鸟人孔洞。");
         }
         if(get_player().beard.length > 0)
         {
            outputText("你留着" + get_player().beardDescript() + "");
            if(get_player().beard.style != 1)
            {
               outputText("覆盖着你的");
               if(Utils.rand(2) == 0)
               {
                  outputText("下巴");
               }
               else
               {
                  outputText("下巴和脸颊");
               }
            }
            else
            {
               outputText("从你的下巴突出");
            }
            outputText("。");
         }
         switch(get_player().tongue.type)
         {
            case 1:
               outputText("蛇一般的舌头偶尔会在你的唇间吞吐，品尝着空气的味道。");
               break;
            case 2:
               outputText("一条缓慢蠕动的舌头偶尔会从你的唇间滑出。当你让它完全伸出时，它能垂下[if (metric) {半米|将近两英尺}]长，不过你可以把它缩回去，看起来和常人无异。");
               break;
            case 3:
               outputText("你的嘴里有一条厚实多肉的舌头，只要你愿意，它可以伸长到大约[if (metric) {一米|四英尺}]的距离。它非常灵活，你几乎可以把它当成第三只手臂来用。");
               break;
            case 4:
               outputText("一条细长的针鼹舌头偶尔会从你的唇间探出，至少有[if (metric) {三十厘米|一英尺}]长。");
               break;
            case 5:
               outputText("你的嘴里有一条厚实多肉的蜥蜴舌头，让人联想到大型食肉爬行动物的舌头。它可以伸长到[if (metric) {三十厘米|一英尺}]，分叉的舌尖在每次动作结束时都会弹动，品尝着空气的味道。");
               break;
            case 6:
               outputText("你的舌头就像猫一样粗糙，上面布满了微小而坚硬的倒刺。");
         }
         if(get_player().horns.type == 11)
         {
            outputText("你的头顶长着一对尖锐的小恶魔角。");
         }
         if(get_player().horns.type == 1)
         {
            if(get_player().horns.value == 2)
            {
               outputText("你的额头[skinDesc]上长出了一对尖锐的小角，向所有看到它们的人宣告着你身上的恶魔血统。");
            }
            if(get_player().horns.value == 4)
            {
               outputText("你的[skinDesc]上长出了四根显眼的角。后面的一对更长，沿着你的头部向后弯曲。前面的一对则像恶魔一样向前突出。");
            }
            if(get_player().horns.value == 6)
            {
               outputText("你的[skinDesc]上长出了六根角，后面两对向后弯曲，越过你的头顶，一直延伸到你的脖子，而前面两根角几乎直立着" + Measurements.numInchesOrCentimetres(8) + "长，笔直向上并略微向前倾斜。");
            }
            if(get_player().horns.value >= 8)
            {
               outputText("大量粗壮的恶魔之角穿透你的[skinDesc]长了出来，每一对都长在前一对的后面。最前面的角向前突出将近" + Measurements.numInchesOrCentimetres(10) + "，而其余的角则向后弯曲越过你的头顶，有些角尖一直延伸到耳朵下方。你估计你总共有" + Utils.num2Text(get_player().horns.value) + "根角。");
            }
         }
         if(get_player().horns.type == 2)
         {
            if(get_player().horns.value >= 20)
            {
               outputText("两根巨大的角从你的额头突出来，先向外弯曲，然后再向前弯。它们分量很重，末端看起来非常危险。");
            }
            else if(get_player().horns.value >= 12)
            {
               outputText("你的头上长出了两根非常巨大且危险的角，向前弯曲，长度超过[if (metric) {三分之一米|一英尺}]。它们的尖端看起来十分危险。");
            }
            else if(get_player().horns.value >= 6)
            {
               outputText("你的额头上长出了两根大角，像公牛的角一样向前弯曲。");
            }
            else if(get_player().horns.value >= 3)
            {
               outputText("你的额头上长出了两根中等大小的角，大小与小牛的角相似。");
            }
            else
            {
               outputText("你的额头上突出了两个微小的角状凸起，类似于你们村里饲养的幼畜的角。");
            }
         }
         if(get_player().horns.value > 0 && get_player().horns.type == 3)
         {
            outputText("一对" + Measurements.inchOrCentimetre(get_player().horns.value) + "只角从你的头部两侧长出，向后弯曲，让你看起来更加威严。");
         }
         if(get_player().horns.type == 4)
         {
            outputText("两对大约[if (metric) {三十厘米|一英尺}]长的角从你的头部两侧长出。它们向后弯曲，让你看起来十分可怕，简直就像你村庄传说中的巨龙一样。");
         }
         if(get_player().horns.type == 5)
         {
            if(get_player().horns.value > 0)
            {
               outputText("两只鹿角，分叉成" + Utils.num2Text(get_player().horns.value) + "个叉，从你的头顶长出，形成了一顶尖锐而威严的白骨王冠。");
            }
         }
         if(get_player().horns.type == 9)
         {
            if(get_player().horns.value == 1)
            {
               outputText("一对小巧的绵羊角长在你的头顶。它们向外并向上卷曲，呈现出微微的新月形。");
            }
            else
            {
               outputText("一对大绵羊角长在你的头顶。它们向外向上卷曲，呈新月形。");
            }
         }
         if(get_player().horns.type == 10)
         {
            if(get_player().horns.value == 1)
            {
               outputText("一对" + get_player().horns.value + " 英寸长的公羊角长在你的头顶，在你的头部两侧紧紧地盘旋，然后在你的耳朵周围向上弯曲。");
            }
            else
            {
               outputText("一对巨大的" + get_player().horns.value + " 英寸长的公羊角长在你的头顶，在你的头部两侧紧紧地盘旋，然后在你的耳朵周围向上弯曲。");
            }
         }
         if(get_player().horns.type == 6)
         {
            if(get_player().horns.value == 1)
            {
               outputText("一对短粗的山羊角从你头部两侧长出。");
            }
            else
            {
               outputText("一对高耸的山羊角从你头部两侧长出。它们呈弧形，表面布满隆起的纹理。");
            }
         }
         if(get_player().horns.type == 8)
         {
            if(get_player().horns.value >= 2)
            {
               if(get_player().face.type == 21)
               {
                  outputText("第二根角从你额头上长出，就在你鼻子上的角正上方。");
               }
               else
               {
                  outputText("一根独角从你额头上长出。它是圆锥形的，看起来像犀牛角。");
               }
               outputText("你估计它大约有 " + Measurements.numInchesOrCentimetres(7) + " 长。");
            }
            else
            {
               outputText("你的额头上长出了一根独角。它是圆锥形的，看起来像犀牛的角。你估计它大约有" + Measurements.numInchesOrCentimetres(6) + "长。");
            }
         }
         if(get_player().horns.type == 7)
         {
            outputText("你的额头正中央长出了一根尖锐的角突。");
            if(get_player().horns.value < 12)
            {
               outputText("你估计它大约有 " + Measurements.numInchesOrCentimetres(6) + " 长。");
            }
            else
            {
               outputText("它长出了自己可爱的小螺旋。你估计它大约有" + Measurements.numInchesOrCentimetres(12) + "长，" + Measurements.numInchesOrCentimetres(2) + "粗，非常坚固。一件非常有用的天然武器。");
            }
         }
         if(get_player().horns.type == 12)
         {
            outputText("" + (get_player().horns.value == 0 ? "你曾经拥有的角仍然从你的头骨中伸出，但现在有了木头的质感。" : "你头上长出的树枝类似于林地动物的鹿角。"));
         }
         if(get_player().horns.type == 13)
         {
            outputText("两根粗壮的羚羊角从你的头上长出，呈轻微的弧形，尖端向内。");
         }
         if(get_player().neck.type == 1)
         {
            if(get_player().hasDragonNeck())
            {
               outputText("你的脖子从后脑勺开始，大约有两英尺半长，比你的手臂还要长大约六英寸。");
            }
            else
            {
               _loc4_ = "";
               if(get_player().neck.len < 8)
               {
                  _loc4_ = "长了几英寸";
               }
               else if(get_player().neck.len < 13)
               {
                  _loc4_ = "稍微长一点";
               }
               else if(get_player().neck.len < 18)
               {
                  _loc4_ = "非常长";
               }
               else
               {
                  _loc4_ = "极长";
               }
               outputText("普通人类的脖子都很短，而你的脖子却" + _loc4_ + "，足有" + get_player().neck.len + "英寸长。");
            }
            if(get_player().hasDragonNeck())
            {
               outputText("你可以随心所欲地向各个方向弯曲它，甚至能轻松地看到自己的后背。");
            }
            else if(get_player().neck.len < 10)
            {
               outputText("稍微用点力，你就能比常人弯曲得更多一点。");
            }
            else if(get_player().neck.len < 16)
            {
               outputText("你毫不费力就能比常人弯曲得更多。");
            }
            else
            {
               outputText("你几乎可以向任何方向弯曲它，稍微用点力甚至能瞥见自己的后背。");
            }
         }
         else if(get_player().neck.type == 2)
         {
            outputText("你的脖子上有一圈[neckColor]的羽毛，它们会随着你的情绪而膨胀。");
         }
         if(get_player().hasStatusEffect(StatusEffects.TellyVised))
         {
            _loc4_ = get_game().bazaar.telly.TELLYPHOTOS[int(get_player().statusEffectv1(StatusEffects.TellyVised))];
            outputText("[pg]你的脸上画着一个可爱的" + _loc4_ + "。");
         }
         outputText("[pg]你拥有人形的躯干，以及正常的身体、手臂、手和手指。");
         switch(get_player().wings.type)
         {
            case 1:
               outputText("一对小巧却美丽的蜜蜂翅膀从你的背上长出，但太小了，无法让你飞行。");
               break;
            case 2:
               outputText("一对巨大的蜜蜂翅膀从你的背上长出，透明的薄膜美丽地反射着光线。它们快速地拍打着，让你能轻松地在原地悬停或飞行。");
               break;
            case 5:
               outputText("一对小恶魔翅膀从你的背上长出，可爱地扑腾着，但除此之外没什么用。");
               break;
            case 6:
               outputText("一对微小的蝙蝠状恶魔翅膀从你的背上长出，可爱地扑腾着，但除此之外没什么用。");
               break;
            case 7:
               outputText("一对巨大的蝙蝠状恶魔翅膀折叠在你的肩膀后面。只要肌肉一抽动，你就能展开它们，用它们在空中优雅地翱翔。");
               break;
            case 9:
               outputText("一对巨大的羽翼从你的背上长出。虽然你通常将这对[wingcolor]色的翅膀紧紧折叠起来，但它们可以展开，让你像哈比一样优雅地翱翔。");
               break;
            case 10:
               outputText("小巧的退化翅膀从你的肩膀上长出。它们看起来可能像蝙蝠的翅膀，但翼膜上覆盖着细致、娇嫩的[wingcolor]鳞片，由[wingcolor2]的骨骼支撑着。");
               break;
            case 11:
               outputText("宏伟的翅膀从你的肩膀上长出。当它们展开时，比你的臂展还要宽，只需拍打一次，你就能飞向天空。它们看起来有点像蝙蝠的翅膀，但翼膜上覆盖着细致、娇嫩的[wingcolor]鳞片，由[wingcolor2]的骨骼支撑着。每根骨头的末端都突出着邪恶的利爪。");
               break;
            case 12:
               outputText("巨大的蜻蜓翅膀挂在你的肩膀上。只要你愿意，你就可以将它们扭动成呼呼作响的节奏，快到足以让你离开地面并让你飞翔。");
               break;
            case 13:
               outputText("一对巨大的小恶魔翅膀折叠在你的肩膀后面。只要肌肉一抽动，你就能展开它们，用它们在空中优雅地翱翔。");
               break;
            case 16:
               outputText("从你的背上，木头树枝伸展成一个类似于你曾经拥有的翅膀的框架。虽然你能够弯曲和移动它们，但这种骨架般的结构无法飞行。");
               break;
            case 17:
               outputText("从你的背上，两根带有螺旋状叶子的下垂树枝像翅膀一样伸展出来。虽然你能够弯曲和移动它们，但它们无法飞行。");
               break;
            case 18:
               outputText("你的背上长出了两根下垂的骨质肢体，上面挂着扭曲的肉丝，像翅膀一样伸展着。虽然你可以弯曲和移动它们，但这种骨架般的结构并不能用来飞行。");
         }
         switch(get_player().rearBody.type)
         {
            case 1:
               outputText("沿着你的脊椎，长出了一排[rearbodycolor]的鬃毛；从你的脖子根部开始，一直延伸到你的尾巴，在尾巴尖端形成一小撮毛。它长成一条厚厚的垂直条带，大约有[if (metric) {5厘米|2英寸}]宽。这让你隐约想起了马的鬃毛。");
               break;
            case 2:
               outputText("沿着你的脊椎，突出了一排短小、铁灰色且向后弯曲的尖刺；从你的脖子根部开始，一直延伸到你的尾巴，在尾巴尖端结束。它们长成一条厚厚的垂直条带，大约有[if (metric) {2到3厘米宽，5厘米|1英寸宽，2英寸}]高。这让你隐隐约约想起了马的鬃毛。");
               break;
            case 3:
               outputText("你的肩胛骨之间长出了一个巨大的鲨鱼状鳍。有了它，你在水下游泳时能更好地控制方向。");
               break;
            case 4:
               outputText("粗糙的树皮覆盖着你的臀部和背部，提供了一层额外的坚韧防护。");
         }
         switch(get_player().arms.type)
         {
            case 1:
               outputText("羽毛从你的肩膀一直垂到手腕，让你的手臂看起来有点像翅膀。");
               break;
            case 2:
               outputText("闪亮的黑色外骨骼从你的二头肌向下覆盖了你的手臂，从远处看就像戴着一双长长的黑色手套。");
               break;
            case 3:
               outputText("闪亮的黑色外骨骼从你的二头肌向下覆盖了你的手臂，从远处看就像戴着一双末端带有黄色绒毛的长长的黑色手套。");
               break;
            case 4:
               outputText("你的手臂上覆盖着[skinfurscales]，你的指甲现在变成了[claws]。");
               break;
            case 5:
               outputText("厚实坚韧的红色鳞片从你的二头肌向下覆盖了你的手臂，虽然你的手从远处看像人类，但你的指甲实际上是短而火红的爪子。");
               break;
            case 6:
               outputText("你的手臂形状像狼一样，肩膀和二头肌处肌肉过于发达，然后迅速变细。它们被[hairorfurcolor]的毛发覆盖，末端是爪子，有足够的灵活性可以当作手来使用。除了前后移动外，它们很难向其他方向移动。");
               break;
            case 7:
               outputText("你的手臂上覆盖着" + (get_player().hasCockatriceSkin() ? "[furcolor]" : "[haircolor]") + "羽毛从肩膀一直延伸到手肘，在那里形成一个毛茸茸的袖口。几根长长的羽毛从你的手肘处长出，形成退化的翅膀，虽然它们不能让你飞翔，但肯定能帮助你跳跃。你的下臂覆盖着坚韧的[skinTone]鳞片，指尖则是致命的鸟人利爪。");
               break;
            case 8:
               outputText("柔软的黑棕色绒毛覆盖着你的双臂。你的爪子有可爱的粉色肉垫和短小的爪甲。");
               break;
            case 9:
               outputText("柔软的[hairorfurcolor]绒毛覆盖着你的双臂，从手肘到爪子变成了[if (hasfurryunderbody) {[underbody.furcolor]|黑棕色}]的毛发。后者有可爱的粉色肉垫和短小的爪甲。");
               break;
            case 10:
            case 12:
               outputText("柔软的[hairorfurcolor]绒毛覆盖着你的双臂。你那像爪子一样的手有可爱的粉色肉垫和[claws]。");
               break;
            case 11:
               outputText("柔软的[hairorfurcolor]绒毛覆盖着你的双臂。你那像爪子一样的手有可爱的粉色肉垫和短小的爪甲。");
               break;
            case 13:
               outputText("你的手臂上覆盖着[skinfurscales]，你的指甲现在变成了[claws]。");
               break;
            case 14:
               outputText("你的手臂上覆盖着[skinfurscales]，你的指甲现在变成了[claws]。");
               break;
            case 15:
               outputText("你的双臂覆盖着一层类似豺狼人的粗糙斑点毛发，而你的双手则是爪子和手的混合体，长着柔软的黑色肉垫。你锋利的爪子肯定能造成一些伤害。");
         }
         if(get_player().hasCockatriceSkin())
         {
            outputText("你的身体覆盖着一层厚厚的[furcolor]羽毛，而从胸部到腹股沟则覆盖着[skinfurscales]。");
         }
         else if(get_player().hasGnollFur())
         {
            outputText("你长满了一身粗糙蓬松的毛发，遮住了你[skintone]的皮肤。[furcolor]的毛发和[skintone]的斑点肯定能帮你悄悄接近别人，无论他们是你的情人还是猎物。");
         }
         else if(get_player().hasDifferentUnderBody())
         {
            outputText("虽然你身体的大部分都被[skinfurscales]覆盖，但你的腹部却覆盖着[underbody.skinfurscales]。");
         }
         if(get_player().isTaur())
         {
            if(get_player().lowerBody.type == 1)
            {
               outputText("从腰部往下，你有着马的身体，全部[legcounttext]条腿的末端都长着蹄子。");
            }
            else if(get_player().lowerBody.type == 11)
            {
               outputText("腰部以下，你有着一具极其可爱且卡通化的马身，[legcounttext]条腿的末端都是扁平圆润的脚。");
            }
            else
            {
               outputText("在你原本应该长腿的地方，长出了一具野兽的身体，共有[legcounttext]条腿。");
            }
         }
         if(get_player().isDrider())
         {
            outputText("在你原本应该长腿的地方，长出了一具蜘蛛的身体，两侧伸出[legcounttext]条细长的腿。");
         }
         if(!get_player().isTaur())
         {
            if(get_player().thickness > 70)
            {
               outputText("你有[hips]");
               if(get_player().hips.rating < 6)
               {
                  if(get_player().tone < 65)
                  {
                     outputText("埋在明显的腰间赘肉下，并且");
                  }
                  else
                  {
                     outputText("融入你那水桶般的腰身，并且");
                  }
               }
               if(get_player().hips.rating >= 6 && get_player().hips.rating < 10)
               {
                  outputText("融入你那粗壮的身躯，并且");
               }
               if(get_player().hips.rating >= 10 && get_player().hips.rating < 15)
               {
                  outputText("如果不是因为你体型宽大，它们会更加显眼，并且");
               }
               if(get_player().hips.rating >= 15 && get_player().hips.rating < 20)
               {
                  outputText("摇曳生姿，凸显出你丰满迷人的曲线，并且");
               }
               if(get_player().hips.rating >= 20)
               {
                  outputText("在你那曲线极其夸张的身躯上迷人地摇曳着，并且");
               }
            }
            else if(get_player().thickness < 30)
            {
               outputText("你有[hips]");
               if(get_player().hips.rating < 6)
               {
                  outputText("与你修长轻盈的身体相得益彰，并且");
               }
               else if(get_player().hips.rating < 10)
               {
                  outputText("随着你的步伐摇曳生姿，在你修长身段的衬托下更显迷人，并且");
               }
               else if(get_player().hips.rating < 15)
               {
                  outputText("在你纤细的腰身下丰满地隆起，并且");
               }
               else if(get_player().hips.rating < 20)
               {
                  outputText("，在你纤细腰肢的衬托下更显突出，并且");
               }
               else
               {
                  outputText("，在你轻盈的身躯上显得不成比例地宽大，并且");
               }
            }
            else
            {
               outputText("你有[hips]");
               if(get_player().hips.rating < 6)
               {
                  outputText("，");
               }
               if(get_player().get_femininity() > 50)
               {
                  if(get_player().hips.rating >= 6 && get_player().hips.rating < 10)
                  {
                     outputText("，吸引着周围人的目光，并且");
                  }
                  if(get_player().hips.rating >= 10 && get_player().hips.rating < 15)
                  {
                     outputText("，让你走起路来摇曳生姿，性感迷人，并且");
                  }
                  if(get_player().hips.rating >= 15 && get_player().hips.rating < 20)
                  {
                     outputText("让你看起来像是生过很多孩子，并且");
                  }
                  if(get_player().hips.rating >= 20)
                  {
                     outputText("让你看起来更像是一只等待配种的野兽，而不是人类，并且");
                  }
               }
               else
               {
                  if(get_player().hips.rating >= 6 && get_player().hips.rating < 10)
                  {
                     outputText("赋予你优雅的步伐，并且");
                  }
                  if(get_player().hips.rating >= 10 && get_player().hips.rating < 15)
                  {
                     outputText("为你的步态增添了一丝女性的摇曳，并且");
                  }
                  if(get_player().hips.rating >= 15 && get_player().hips.rating < 20)
                  {
                     outputText("迫使你在移动时摇摆扭动，并且");
                  }
                  if(get_player().hips.rating >= 20)
                  {
                     outputText("让你的");
                     if(get_player().balls > 0)
                     {
                        outputText("蛋蛋有充足的呼吸空间");
                     }
                     else if(get_player().hasCock())
                     {
                        outputText(get_player().multiCockDescript() + "有充足的摆动空间");
                     }
                     else if(get_player().hasVagina())
                     {
                        outputText("[vagina]有舒适宽敞的空间");
                     }
                     else
                     {
                        outputText("空荡荡的下体有充足的空间");
                     }
                     outputText("，");
                  }
               }
            }
         }
         if(get_player().isTaur())
         {
            if(get_player().tone < 65)
            {
               outputText("[butt]");
               if(get_player().butt.rating < 4)
               {
                  outputText("瘦削得显而易见。");
               }
               if(get_player().butt.rating >= 4 && get_player().butt.rating < 6)
               {
                  outputText("看起来相当普通。");
               }
               if(get_player().butt.rating >= 6 && get_player().butt.rating < 10)
               {
                  outputText("相当丰满健康。");
               }
               if(get_player().butt.rating >= 10 && get_player().butt.rating < 15)
               {
                  outputText("在你小跑时会微微晃动。");
               }
               if(get_player().butt.rating >= 15 && get_player().butt.rating < 20)
               {
                  outputText("在你小跑时会剧烈地摇晃抖动。");
               }
               if(get_player().butt.rating >= 20)
               {
                  outputText("大得有些下流，即使对一匹马来说也近乎畸形。");
               }
            }
            else
            {
               outputText("[butt]");
               if(get_player().butt.rating < 4)
               {
                  outputText("几乎不怎么显眼，凸显出了你后腿的肌肉。");
               }
               if(get_player().butt.rating >= 4 && get_player().butt.rating < 6)
               {
                  outputText("与你健美的马族身躯十分相称。");
               }
               if(get_player().butt.rating >= 6 && get_player().butt.rating < 10)
               {
                  outputText("暗示着你一脚能踢出多大的力量。");
               }
               if(get_player().butt.rating >= 10 && get_player().butt.rating < 15)
               {
                  outputText("在你小跑时肌肉隆起。");
               }
               if(get_player().butt.rating >= 15 && get_player().butt.rating < 20)
               {
                  outputText("随着你的动作，展现出其惊人的肌肉量。");
               }
               if(get_player().butt.rating >= 20)
               {
                  outputText("堆叠着层层肌肉，即使对马来说也大得惊人。");
               }
            }
         }
         else if(get_player().tone < 60)
         {
            outputText("[butt]");
            if(get_player().butt.rating < 4)
            {
               outputText("在你的装束下看起来很棒。");
            }
            if(get_player().butt.rating >= 4 && get_player().butt.rating < 6)
            {
               outputText("有着极其轻微的性感晃动。");
            }
            if(get_player().butt.rating >= 6 && get_player().butt.rating < 10)
            {
               outputText("将你的衣服撑得恰到好处。");
            }
            if(get_player().butt.rating >= 10 && get_player().butt.rating < 15)
            {
               outputText("随着你的每一步诱人地晃动着。");
            }
            if(get_player().butt.rating >= 15 && get_player().butt.rating < 20)
            {
               outputText("走起路来就像一碗满满的果冻一样晃动着。");
            }
            if(get_player().butt.rating >= 20)
            {
               outputText("大得离谱，简直像个怪物，让你跑起步来都很困难。");
            }
         }
         else
         {
            outputText("[butt]");
            if(get_player().butt.rating < 4)
            {
               outputText("紧紧贴合着你的身形。");
            }
            if(get_player().butt.rating >= 4 && get_player().butt.rating < 6)
            {
               outputText("随着每一个动作收缩，展现出精瘦肌肉的细致曲线。");
            }
            if(get_player().butt.rating >= 6 && get_player().butt.rating < 10)
            {
               outputText("将你的衣服撑得恰到好处。");
            }
            if(get_player().butt.rating >= 10 && get_player().butt.rating < 15)
            {
               outputText("撑紧了你的装备，随着你的每一步而收缩。");
            }
            if(get_player().butt.rating >= 15 && get_player().butt.rating < 20)
            {
               outputText("每次你夹紧它时，都仿佛要从你的装备下撑爆出来。");
            }
            if(get_player().butt.rating >= 20)
            {
               outputText("大得惊人，但完全是由肌肉堆砌而成的。");
            }
         }
         switch(get_player().tail.type)
         {
            case 1:
               outputText("一条长长的[hairColor]马尾从你的[butt]垂下，光滑且闪亮。");
               break;
            case 2:
               outputText("一条毛茸茸的[hairorfurcolor]狗尾巴从你的[butt]上方长出来，每当你高兴时就会来回摇摆。");
               break;
            case 3:
               outputText("一条细长的尾巴从你的[butt]卷曲而下，末端呈铲状，一有机会就会性感地缠绕在你的[leg]上。");
               break;
            case 4:
               outputText("一条长长的牛尾巴，末端蓬松，来回甩动着，仿佛在拍打苍蝇。");
               break;
            case 5:
               outputText("一个巨大的球形蜘蛛腹部从你的背后长出，表面覆盖着闪亮的黑色甲壳。虽然它很重，并且随着你的每一个动作上下摆动，但似乎并没有减慢你的速度。");
               if(get_player().tail.venom > 50 && get_player().tail.venom < 80)
               {
                  outputText("你鼓胀的蜘蛛后部感觉装满了蛛丝。");
               }
               if(get_player().tail.venom >= 80 && get_player().tail.venom < 100)
               {
                  outputText("你的蜘蛛后部高高鼓起，感觉装满了蛛丝。");
               }
               if(get_player().tail.venom == 100)
               {
                  outputText("你肿胀的蜘蛛屁股因为容纳了海量的蛛丝而撑得鼓鼓囊囊的。");
               }
               break;
            case 6:
               outputText("一个巨大的昆虫般的蜜蜂腹部悬挂在你的背后上方，随着你的移动因自身的重量而上下摆动。它覆盖着带有黑黄条纹的坚硬甲壳，末端长着一根匕首般的毒刺。");
               if(get_player().tail.venom > 50 && get_player().tail.venom < 80)
               {
                  outputText("一滴毒液挂在你裸露的毒刺上。");
               }
               if(get_player().tail.venom >= 80 && get_player().tail.venom < 100)
               {
                  outputText("剧毒的蜜蜂毒液完全覆盖了你的毒刺。");
               }
               if(get_player().tail.venom == 100)
               {
                  outputText("毒液不断从你带毒的刺上滴落。");
               }
               break;
            case 7:
               outputText("一条长长的鲨鱼尾巴从你的背后拖曳而下，来回摆动，给你增添了一丝危险的气息。");
               break;
            case 8:
               outputText("一条柔软的[hairorfurcolor]猫尾从你的[butt]上方长出，随着你的每一步卷曲扭动，以保持完美的平衡。");
               break;
            case 9:
               if(get_player().hasDifferentUnderBody())
               {
                  outputText("一条锥形的尾巴从你的[ass]上方垂下，上面覆盖着[skinfurscales]，底部则是[underbody.skinfurscales]。它来回摆动，帮助你保持平衡。");
               }
               else
               {
                  outputText("一条锥形的尾巴从你的[ass]上方垂下。它来回摆动，帮助你保持平衡。");
               }
               break;
            case 10:
               outputText("一条短小柔软的兔子尾巴从你的[ass]上方长出，每当你不去想它时，它就会不停地抽动。");
               break;
            case 11:
               outputText("一条由羽毛组成的尾巴从你的[ass]上方呈扇形展开，本能地抽动着，以便在你起飞时帮助引导方向。");
               break;
            case 12:
               outputText("一条圆锥形的、");
               if(get_player().hasGooSkin())
               {
                  outputText("黏糊糊的、[skinTone]的");
               }
               else
               {
                  outputText("毛茸茸的、[if (hasFur) {[furcolor]|沙褐色的}]");
               }
               outputText("尾巴从你的[ass]处伸出，随着你的移动上下跳动，帮助你保持平衡。");
               break;
            case 13:
               if(get_player().tail.venom <= 1)
               {
                  outputText("一条毛茸茸的[hairorfurcolors]狐狸尾巴从你的[ass]处伸出，卷曲在你的身体周围——柔软的皮毛感觉很可爱。");
               }
               else
               {
                  outputText("" + Utils.Num2Text(get_player().tail.venom) + "条摇摆的[hairorfurcolors]狐狸尾巴从你的[ass]伸出，盘绕在你的身体上——柔软的皮毛摸起来很舒服。");
               }
               break;
            case 14:
               if(get_player().hasDifferentUnderBody())
               {
                  outputText("一条粗壮、肌肉发达的爬行动物尾巴在你身后缓慢地左右摇摆，它几乎和你的身高一样长，表面覆盖着[skinfurscales]，底面则是[underbody.skinfurscales]。它的末端长着锋利的骨刺，极具威胁，只需用力一扫就能轻易造成严重的伤害。");
               }
               else
               {
                  outputText("一条粗壮、肌肉发达的爬行动物尾巴在你身后下意识地缓慢左右摇摆，它几乎和你的身高一样长。它的末端长着锋利的骨刺，极具威胁，只需强有力地一扫就能轻易造成极其严重的伤害。");
               }
               break;
            case 15:
               outputText("一条黑色与[if (hasFur) {[furcolor]|灰色}]相间的环纹浣熊尾巴在你身后摇摆。");
               break;
            case 16:
               outputText("一条光秃秃的[skinTone]老鼠尾巴从你的屁股上伸出来，拖在地上，偶尔抽动一下。");
               break;
            case 17:
               outputText("一条长长的毛茸茸的尾巴从你的背后长出来。它覆盖着一层蓬松的[hairorfurcolor]毛发。当你兴奋时，它会随着你的身体快乐地抽动和摇摆。");
               break;
            case 19:
               outputText("一条短而卷曲的猪尾巴从你的屁股上方长了出来。");
               break;
            case 20:
               outputText("一条甲壳质的蝎子尾巴从你的屁股上方长了出来，随时准备注射毒液。");
               break;
            case 21:
               outputText("一条非常短粗的山羊尾巴从你的屁股上方长了出来。");
               break;
            case 22:
               outputText("一条粗壮的犀牛尾巴从你的屁股上方长了出来，不时地甩动着。");
               break;
            case 23:
               outputText("一条粗短的针鼹尾巴在你的[ass]上方长了出来。");
               break;
            case 24:
               outputText("一条非常短粗的鹿尾巴从你的屁股上方长了出来。");
               break;
            case 25:
               outputText("一条长满红色鳞片的锥形尾巴从你的[ass]上方垂下。它来回摆动，帮助你保持平衡。只需集中片刻注意力，你就能让整条尾巴燃起赤红的烈焰。");
               break;
            case 26:
               outputText("一条毛茸茸的狼尾巴垂在你的[ass]上方。");
               break;
            case 27:
               outputText("一条毛茸茸的绵羊尾巴从你的[butt]垂下。它偶尔会抽动和摇晃，那蓬松的绒毛让人忍不住想要触摸。");
               break;
            case 28:
               outputText("一条几乎和你身高一样长的细长小恶魔尾巴从你的[butt]上方垂下，尾端点缀着一小撮毛。");
               break;
            case 29:
               outputText("一条粗壮、长满鳞片且灵活的爬行动物尾巴从你的[butt]垂下，大约有你身高的一半长。根部大约[if (metric) {couple centimeters or so are|inch or so is}]长着羽毛，呈“V”字形，随后过渡为你[skinTone]的鳞片。");
               break;
            case 30:
               _loc4_ = get_player().hasFur() ? get_player().skin.furColor + " and " + get_player().redPandaTailColor2() : "赤褐色和橙色";
               outputText("你的臀部长出了一条毛茸茸的长尾巴。它有着美丽的环状图案，颜色是" + _loc4_ + "蓬松的毛发。当你走路时，它会调皮地摆动，给你的步伐增添一种迷人的感觉。");
               break;
            case 31:
               outputText("一条[if (metric) {三分之一米|一英尺}]长、毛发粗糙的[hairorfurcolors]豺狼人尾巴从你的[butt]上方长出，来回摇摆，似乎在传达你的心情。");
         }
         switch(get_player().lowerBody.type)
         {
            case 0:
               outputText("你的腰部向下是[Legcounttext]条正常的人类腿，末端是正常的人类脚。");
               break;
            case 1:
               outputText("你的[legcounttext]条腿肌肉发达，关节奇特，上面覆盖着毛发，末端是野兽般的蹄子。");
               break;
            case 2:
               outputText("你的腰部向下是[Legcounttext]条趾行腿，末端是类似狗的后爪。");
               break;
            case 3:
               if(!get_player().hasReptileUnderBody(true))
               {
                  outputText("在你的腰部以下，你的血肉融合在一起，变成了一条非常长的蛇形尾巴。");
               }
               else
               {
                  _loc6_ = ["",""];
                  if(get_player().underBody.type == 4)
                  {
                     _loc6_ = [get_player().underBody.skin.tone,get_player().nagaLowerBodyColor2()];
                  }
                  else
                  {
                     _loc6_ = [get_player().skin.tone,get_player().underBody.skin.tone];
                  }
                  outputText("在你的腰部以下，原本应该是双腿的地方，你的身体变成了一条长长的蛇形尾巴。你蛇形的下半身覆盖着" + _loc6_[0] + "色的鳞片，并带有" + _loc6_[1] + "色的腹鳞。");
               }
               break;
            case 5:
               outputText("你那[legcounttext]条完美修长的腿末端长着几乎和人类一样的脚，除了脚后跟笔直向下突出的角，这迫使你走起路来带着一种性感摇曳的步态。");
               break;
            case 6:
               outputText("你那[legcounttext]条轻盈的腿末端长着灵活的爪脚。原本长着脚趾甲的地方现在长出了锋利的黑色指甲，为你提供了极佳的抓地力。");
               break;
            case 7:
               outputText("你那[legcounttext]条腿到大腿中部都覆盖着闪闪发光的昆虫甲壳，看起来更像是一双“诱惑长靴”而不是外骨骼。大腿上部覆盖着一点柔软的黄黑相间的绒毛，就像蜜蜂一样。");
               break;
            case 8:
               outputText("你的双腿变成了一团不断蠕动的无定形粘液。幸运的是，用它来移动还挺容易的。你[armor]的下半部分在你的体内漂浮着，并没有给你带来任何不适。");
               break;
            case 9:
               outputText("你的腰部向下是[Legcounttext]条趾行腿，末端是柔软的、带有肉垫的猫爪。");
               break;
            case 10:
               outputText("[Legcounttext]条趾行腿从你的[hips]向下生长，末端是长有爪子的脚。前面有三根长长的脚趾，后面有一根小小的后爪。");
               break;
            case 12:
               outputText("你的[legcounttext]条腿在腰部以下变粗，变成了长着柔软皮毛的兔子腿。你甚至有一双大大的兔子脚，这让你蹦蹦跳跳地移动比走路还要轻松一点。");
               break;
            case 13:
               outputText("你的[legcounttext]条腿上覆盖着[hairorfurcolor]的羽毛。值得庆幸的是，粗壮有力的双腿非常适合让你腾空而起，而且你的脚大部分还是人类的模样，即使它们只有两个脚趾，并且末端长着利爪。");
               break;
            case 14:
               outputText("你的[legcounttext]条毛茸茸的腿有着较短的大腿和较长的小腿，脚甚至更长，末端的脚趾上长着突出的指甲。");
               break;
            case 15:
               outputText("你的[legcounttext]条腿一直到大腿中部都覆盖着一层反光的黑色昆虫甲壳，看起来更像是一双\'性感长靴\'而不是外骨骼。");
               break;
            case 17:
               outputText("你的[legcounttext]条腿弯曲着，有着高高的膝盖、飞节和长长的脚，就像狐狸的腿一样；末端点缀着可爱的球状脚趾。");
               break;
            case 18:
               outputText("[Legcounttext]条类似人类的腿从你的[hips]向下生长，上面覆盖着鳞片，末端是长着爪子的脚。前面有三个长长的脚趾，后面有一个小小的后爪。");
               break;
            case 19:
               outputText("你的[legcounttext]腿虽然长满了毛，但看起来很像人类。脚底长着同样长的脚趾，脚底的肉垫对触觉非常敏感。");
               break;
            case 20:
               outputText("你的[legcounttext]条腿上同样覆盖着[hairorfurcolor]的毛发，下半部分的颜色更深。腿的末端是长着短爪的趾行雪貂爪。");
               break;
            case 21:
               outputText("[Legcounttext]趾行腿从你的[hips]下方长出，末端是分叉的蹄子。");
               break;
            case 25:
               outputText("[Legcounttext]条趾行腿从你的[hips]向下生长，大腿中部以下覆盖着厚厚的、坚韧的红色鳞片，末端是长有爪子的脚。前面有三根长长的脚趾，后面有一根小小的后爪。");
               break;
            case 26:
               outputText("你有[legcounttext]条趾行腿，末端是狼爪。");
               break;
            case 27:
               outputText("[Legcounttext]趾行腿从你的[hips]下方长出，末端是长着爪子的脚。前面伸出三个，后面有一个较小的用来保持平衡。");
               break;
            case 28:
               outputText("[Legcounttext]趾行腿从你的[hips]向下生长，末端是长着爪子的脚。前面有三个长脚趾，后面有一个小后爪。一层" + (get_player().hasCockatriceSkin() ? get_player().skin.furColor : get_player().hair.color) + "羽毛覆盖了你从臀部到膝盖的腿，末端是一个蓬松的袖口。");
               break;
            case 29:
               outputText("你的[legcounttext]条腿上同样覆盖着[if (hasfurryunderbody) {[underbody.furcolor]|黑褐色}]的毛发，末端是长着短爪的小熊猫爪子。它们结构灵活而强壮，以防你需要逃避什么危险。");
               break;
            case 30:
               outputText("你有两组盘绕的根须，向下蜿蜒形成[if (silly) {恰如其分的}]跖行腿。");
               break;
            case 31:
               outputText("你的腰部向下是两条趾行腿，从大腿往下覆盖着[furcolor]的斑点毛发。它们的末端是长着小爪子的肉垫爪脚。");
               break;
            case 32:
               if(!get_player().hasReptileUnderBody(true))
               {
                  outputText("在你的腰部以下，你的血肉融合在一起，变成了一条非常长的鱼形尾巴。");
               }
               else
               {
                  _loc4_ = get_player().skin.tone;
                  _loc5_ = get_player().underBody.skin.tone;
                  if(get_player().underBody.type == 7)
                  {
                     _loc4_ = get_player().underBody.skin.tone;
                     _loc5_ = get_player().nagaLowerBodyColor2();
                  }
                  outputText("在你的腰部以下，原本应该是双腿的地方，你的身体变成了一条长长的人鱼尾巴。你鱼形的下半身覆盖着" + _loc4_ + "色的鳞片，并带有" + _loc5_ + "色的腹鳞。");
               }
               break;
            case 33:
               outputText("你的[legcounttext]条腿从腰部向下生长，末端的脚上长着长长的、能够抓握的带爪脚趾。");
         }
         if(get_player().lowerBody.incorporeal)
         {
            outputText("由于其幽灵般的本质，你的[legs]是半透明的。");
         }
         outputText("[pg]");
         if(get_player().hasStatusEffect(StatusEffects.GooStuffed))
         {
            outputText("<b>你那看起来像怀孕一样的肚子绝对塞满了史莱姆液。你不可能以这种状态怀孕，但同时，你看起来就像个大肚子的生育机器。</b>");
         }
         if(get_player().get_buttPregnancyType() == 23 || get_player().get_buttPregnancyType() == 19 || get_player().isPregnant())
         {
            if(get_player().get_pregnancyType() == 5)
            {
               outputText("<b>");
               _loc1_ = get_player().statusEffectv3(StatusEffects.Eggs) + get_player().statusEffectv2(StatusEffects.Eggs) * 10;
               if(get_player().get_pregnancyIncubation() <= 50 && get_player().get_pregnancyIncubation() > 20)
               {
                  outputText("你高高隆起的孕肚就像一个");
                  if(_loc1_ < 10)
                  {
                     outputText("篮球。");
                  }
                  if(_loc1_ >= 10 && _loc1_ < 20)
                  {
                     outputText("西瓜。");
                  }
                  if(_loc1_ >= 20)
                  {
                     outputText("沙滩排球。");
                  }
               }
               if(get_player().get_pregnancyIncubation() <= 20)
               {
                  outputText("你高高隆起的孕肚就像一个");
                  if(_loc1_ < 10)
                  {
                     outputText("西瓜。");
                  }
                  if(_loc1_ >= 10 && _loc1_ < 20)
                  {
                     outputText("沙滩排球。");
                  }
                  if(_loc1_ >= 20)
                  {
                     outputText("大号实心球。");
                  }
               }
               outputText("</b>");
               _loc1_ = 0;
            }
            else if(get_player().get_buttPregnancyType() == 19 && get_player().get_buttPregnancyIncubation() > get_player().get_pregnancyIncubation())
            {
               if(get_player().get_buttPregnancyIncubation() < 125 && get_player().get_buttPregnancyIncubation() >= 75)
               {
                  outputText("<b>你开始长出一点小肚子了。</b>");
               }
               else if(get_player().get_buttPregnancyIncubation() >= 50)
               {
                  outputText("<b>你的肚子明显隆起，显出怀孕的迹象，但你感觉里面怪怪的——似乎哪里不对劲。</b>");
               }
               else if(get_player().get_buttPregnancyIncubation() >= 30)
               {
                  outputText("<b>你的肚子因为怀孕而痛苦地膨胀着，让你很难正常行走。</b>");
               }
               else
               {
                  switch(get_player().get_pregnancyType())
                  {
                     case 4:
                     case 11:
                     case 12:
                     case 17:
                     case 18:
                     case 20:
                     case 21:
                        _loc4_ = "<b>你的肚子极不自然地向前凸起，里面孕育着这片土地上某个原住民的子嗣。</b>";
                        break;
                     case 8:
                        _loc4_ = "<b>你的肚子极不自然地向前凸起，里面孕育着玛布尔珍贵的孩子。</b>";
                        break;
                     case 29:
                        _loc4_ = FlagDict_Impl_.arrayReadInt(KFLAGS.flags,2311) <= 0 ? "<b>你的肚子极不自然地向前凸起，里面孕育着这片土地上某个原住民的子嗣。</b>" : "<b>你的肚子极不自然地向前凸起，里面孕育着某种怪物或野兽不洁的子嗣。</b>";
                        break;
                     default:
                        _loc4_ = "<b>你的肚子极不自然地向前凸起，里面孕育着某种怪物或野兽不洁的子嗣。</b>";
                  }
                  outputText(_loc4_);
               }
            }
            else if(get_player().get_pregnancyType() == 21)
            {
               if(get_player().get_pregnancyIncubation() <= 432 && get_player().get_pregnancyIncubation() > 360)
               {
                  outputText("<b>你的肚子比以前大了。</b>");
               }
               if(get_player().get_pregnancyIncubation() <= 360 && get_player().get_pregnancyIncubation() > 288)
               {
                  outputText("<b>你的肚子明显隆起了。你很确定这是乌尔塔的孩子。</b>");
               }
               if(get_player().get_pregnancyIncubation() <= 288 && get_player().get_pregnancyIncubation() > 216)
               {
                  outputText("<b>你肚子上怀孕的隆起已经清晰可见，里面的宝宝现在开始踢肚子了。</b>");
               }
               if(get_player().get_pregnancyIncubation() <= 216 && get_player().get_pregnancyIncubation() > 144)
               {
                  outputText("<b>你的肚子很大，任何人看你一眼都能明显看出你怀孕了。它已经变得很重，一直挺着它到处走成了一种折磨。</b>");
               }
               if(get_player().get_pregnancyIncubation() <= 144 && get_player().get_pregnancyIncubation() > 72)
               {
                  outputText("<b>任何人只要瞥你一眼，你都不可能向他们隐瞒你日益明显的孕相。它又大又圆，还经常动来动去。</b>");
               }
               if(get_player().get_pregnancyIncubation() <= 72 && get_player().get_pregnancyIncubation() > 48)
               {
                  outputText("<b>你的肚子因为怀孕而痛苦地膨胀着，让你很难正常行走。</b>");
               }
               if(get_player().get_pregnancyIncubation() <= 48)
               {
                  outputText("<b>你的肚子不自然地向前突出，里面怀着这片土地上某个原住民的子嗣。</b>");
               }
            }
            else if(get_player().get_buttPregnancyType() == 23)
            {
               if(get_player().get_buttPregnancyIncubation() >= 8)
               {
                  outputText("<b>你的肚子里装满了青蛙卵，看起来随时都会生产，你每走一步肚子都会摇晃颤动，里面塞满了青蛙卵。</b>");
               }
               else
               {
                  outputText("<b>你肚子里塞满了蛋，看起来膨胀得有些下流，巨大的蛋挤在你的肠道里，显得又大又重。它们让你走起路来像鸭子一样摇摇晃晃，沉甸甸的肚子也跟着下流地晃动。</b>");
               }
            }
            else if(get_player().get_pregnancyType() == 24)
            {
               outputText("<b>你的肚子依然像西瓜一样肿胀。");
               if(get_player().get_pregnancyIncubation() <= 100)
               {
                  outputText("里面充满了液体，不过与正常的怀孕不同，你怀着的小家伙非常微小。</b>");
               }
               else if(get_player().get_pregnancyIncubation() <= 140)
               {
                  outputText("感觉里面装满了浓稠的糖浆或果冻。</b>");
               }
               else
               {
                  outputText("感觉你的子宫里仍然有一个坚硬的球体。</b>");
               }
            }
            else
            {
               _loc7_ = get_player().get_pregnancyIncubation();
               if(_loc7_ <= 48)
               {
                  switch(get_player().get_pregnancyType())
                  {
                     case 4:
                     case 11:
                     case 12:
                     case 17:
                     case 18:
                     case 20:
                     case 21:
                     case 34:
                        _loc4_ = "<b>你的肚子极不自然地向前凸起，里面孕育着这片土地上某个原住民的子嗣。</b>";
                        break;
                     case 8:
                        _loc4_ = "<b>你的肚子极不自然地向前凸起，里面孕育着玛布尔珍贵的孩子。</b>";
                        break;
                     case 29:
                        _loc4_ = FlagDict_Impl_.arrayReadInt(KFLAGS.flags,2311) <= 0 ? "<b>你的肚子极不自然地向前凸起，里面孕育着这片土地上某个原住民的子嗣。</b>" : "<b>你的肚子极不自然地向前凸起，里面孕育着某种怪物或野兽不洁的子嗣。</b>";
                        break;
                     default:
                        _loc4_ = "<b>你的肚子极不自然地向前凸起，里面孕育着某种怪物或野兽不洁的子嗣。</b>";
                  }
                  outputText(_loc4_);
               }
               else if(_loc7_ <= 72)
               {
                  outputText("<b>你的肚子因为怀孕而痛苦地膨胀着，让你很难正常行走。</b>");
               }
               else if(_loc7_ <= 120)
               {
                  outputText("<b>任何瞥见你的人都能一眼看出你日益明显的孕肚，根本无法隐藏。</b>");
               }
               else if(_loc7_ <= 180)
               {
                  outputText("<b>你的肚子非常明显，任何人看一眼就知道你怀孕了。</b>");
               }
               else if(_loc7_ <= 216)
               {
                  outputText("<b>你的肚子上可以看到明显的怀孕隆起。</b>");
               }
               else if(_loc7_ <= 280)
               {
                  outputText("<b>你的肚子明显胀大了。你可能怀孕了。</b>");
               }
               else if(_loc7_ <= 336)
               {
                  outputText("<b>你的肚子比以前大了。</b>");
               }
            }
            outputText("[pg]");
         }
         if(get_player().hasStatusEffect(StatusEffects.ParasiteEel))
         {
            if(get_player().statusEffectv1(StatusEffects.ParasiteEel) == 1)
            {
               outputText("你的肚子上有时会出现一个小凸起，这表明有鳗鱼寄生虫的存在。");
            }
            if(get_player().statusEffectv1(StatusEffects.ParasiteEel) == 2)
            {
               outputText("你的肚子上有时会出现一些凸起，这表明有鳗鱼寄生虫的存在。");
            }
            if(get_player().statusEffectv1(StatusEffects.ParasiteEel) > 2)
            {
               outputText("你的肚子上出现了几个凸起，在你的腹部滑动，这表明你感染了鳗鱼寄生虫。");
            }
            outputText("每隔一会儿，就会有一只生物从你的[vagina]里滑出来，漫无目的地扭动着，然后又藏了起来。[pg]");
         }
         if(get_player().hasStatusEffect(StatusEffects.ParasiteNephila))
         {
            if(get_player().statusEffectv1(StatusEffects.ParasiteNephila) == 1)
            {
               outputText("你的肚子看起来像是足月怀孕了，并且经常蠕动，这表明那个奇怪的史莱姆女孩的触手在你的体内。");
            }
            else if(get_player().statusEffectv1(StatusEffects.ParasiteNephila) == 2)
            {
               outputText("你的肚子看起来像是怀了双胞胎的足月孕妇，并且频繁地蠕动着，这表明那个奇怪的史莱姆女孩的触手正存在于你的体内。");
            }
            else if(get_player().statusEffectv1(StatusEffects.ParasiteNephila) <= 3)
            {
               outputText("你的肚子看起来像是怀了三胞胎的足月孕妇，并且频繁地蠕动着，这表明那个奇怪的史莱姆女孩的触手正存在于你的体内。");
            }
            else if(get_player().statusEffectv1(StatusEffects.ParasiteNephila) <= 5)
            {
               outputText("你的肚子被子宫里的涅菲拉触手撑得痛苦地膨胀起来，让你看起来像是怀了不可思议的巨胎。你的肚皮表面频繁地出现凸起，在你的腹部滑动，表明你被寄生得有多严重。");
            }
            else if(get_player().statusEffectv1(StatusEffects.ParasiteNephila) <= 9)
            {
               outputText("你的肚子极不自然地向前突出，因为试图容纳里面的触手群而被撑得发亮。你发现站立时靠在肚子上比挺着它要容易得多，当你这样做时，它会摊在地上。随着体内触手的运动，它不断地发出晃动的声音。");
            }
            else if(get_player().statusEffectv1(StatusEffects.ParasiteNephila) <= 14)
            {
               outputText("你塞满涅菲拉的肚子让你的身体其他部分相形见绌，使你成为了子宫的退化附属品。你之所以还能移动，完全是因为一大群史莱姆孩子们在你的小穴里进进出出，支撑着你和你心爱的肚子。它们形成了一个蠕动着、喷射着粘液的轿子。</b>");
            }
            else if(get_player().statusEffectv1(StatusEffects.ParasiteNephila) <= 19)
            {
               outputText("你现在看起来就像是一个被绑在塞满房间的、装满史莱姆的气球上的女孩。你肚皮上的皮肤被撑得极薄，呈现半透明状，可以透过它看到你无数史莱姆般孩子的颜色。当你思考自己时，你会将自己投射到那不断蠕动的肚子里，只对身体的其他部分作为你存在的一部分一闪而过。你能穿过门并正常地与周围的世界互动，这简直是你孩子们设计的奇迹，但即使是络新妇的魔法也有极限。强烈的筑巢本能已经占据了你，定居下来并将余生奉献给暴饮暴食、膨胀和孕育更多寄生虫的画面不断在你的脑海中闪过。<b>你长得越大，你就越确信很快就该放弃这个愚蠢的任务，找个家，拥抱你<i>真正</i>的命运了。</b>");
            }
            else if(get_player().statusEffectv1(StatusEffects.ParasiteNephila) >= 20 || FlagDict_Impl_.arrayReadInt(KFLAGS.flags,2921) == 0)
            {
               outputText("你肚皮上薄如蝉翼的血肉现在几乎完全透明了，它紧紧包裹着一个子宫，相比之下，惠特尼农场的谷仓都显得有些拥挤。你无数史莱姆般的孩子在你体内蠕动的样子清晰可见，粘液从你的血肉中渗出，让你的身体永远覆盖着一层薄薄的彩色史莱姆。你不再有能力正常进入大多数地方，发现自己只能依靠你的络新妇孩子们制作的魔法幻象来“四处走动”。它是你身体的完美复制品，但缩小到了更易于管理的尺寸。通过将你的思想投射到它上面，你能够继续冒险。然而，这些幻象会反馈到你真实、超载的身体上，如果你继续以这种体型冒险，破裂的风险是非常真实的。<b>你现在确信了：是时候拥抱命运了。</b>");
            }
            outputText("<b>每隔一会儿，就会有一只史莱姆从你的[vagina]里冒出来，漫无目的地扭动着，然后又钻回你的子宫。</b>[pg]");
         }
         if(get_player().gills.type == 1)
         {
            outputText("一对羽毛状的鳃正从你脖子下方长出来，水平展开并垂在你的胸前。它们能让你在水中待很长时间。");
         }
         if(int(get_player().breastRows.length) == 1)
         {
            outputText("你有" + Utils.num2Text(get_player().breastRows[0].breasts) + "" + get_player().breastDescript(0) + "，每个上面都长着");
            outputText(get_player().breastRows[0].nipplesPerBreast == 1 ? "一个" : Utils.num2Text(get_player().breastRows[int(_loc1_)].nipplesPerBreast));
            outputText("" + Measurements.shortSuffix(get_player().nippleLength) + "");
            outputText(get_player().nippleDescript(0) + (get_player().breastRows[0].nipplesPerBreast == 1 ? "。" : "。"));
            if(get_player().breastRows[0].milkFullness > 75)
            {
               outputText("你的" + get_player().breastDescript(0) + "因为充满了乳汁而感到胀痛和敏感。你应该尽快释放压力。");
            }
            if(get_player().breastRows[0].breastRating >= 1)
            {
               outputText("你可以轻松填满一件 " + get_player().breastCup(0) + " 的胸罩。");
            }
            outputText("\n");
         }
         else
         {
            outputText("你有" + Utils.num2Text(int(get_player().breastRows.length)) + "排乳房，最上面的一对从你的胸部开始。\n");
            _loc6_ = ["--你最上面那排乳房容纳了 ","\n--第二排容纳了 ","\n--你的第三排乳房包含 ","\n--你的第四排奶子托着 ","\n--你第五排也是最后一排乳房胀满着 "];
            _loc7_ = 0;
            _loc9_ = int(get_player().breastRows.length);
            while(_loc7_ < _loc9_)
            {
               _loc10_ = _loc7_++;
               _loc4_ = _loc6_[_loc10_];
               outputText(_loc4_ != null ? _loc4_ : "");
               _loc11_ = get_player().breastRows[_loc10_];
               outputText(Utils.num2Text(_loc11_.breasts) + "个" + get_player().breastDescript(_loc10_) + "，长着");
               outputText(Utils.num2Text(_loc11_.nipplesPerBreast));
               outputText("" + Measurements.shortSuffix(get_player().nippleLength) + "");
               outputText(get_player().nippleDescript(_loc10_) + (_loc11_.nipplesPerBreast == 1 ? "。" : "。"));
               if(_loc11_.breastRating >= 1)
               {
                  outputText("它们可以轻松填满" + get_player().breastCup(_loc10_) + "的胸罩。");
               }
               if(_loc11_.milkFullness > 75)
               {
                  outputText("你的" + get_player().breastDescript(_loc10_) + "因为胀满了奶水而感到疼痛和敏感。你应该尽快释放压力。");
               }
            }
            outputText("\n");
         }
         if(get_player().hasTailInsteadOfLegs() && get_player().get_gender() > 0)
         {
            outputText("\n你的性器官");
            if(get_player().get_gender() == 3 || int(get_player().cocks.length) > 1)
            {
               outputText("是");
            }
            else
            {
               outputText("是");
            }
            outputText("在不使用时隐藏在你尾巴的空腔内，不过当需要时，你可以分开隐藏的缝隙，露出你的真面目。\n");
         }
         if(get_player().hasCock())
         {
            _loc2_ = Utils.rand(100);
            if(get_player().isTaur() && int(get_player().cocks.length) == 1)
            {
               outputText("\n你的装备已经转移到了你的后腿之间，就像一只野兽。\n");
            }
            else if(get_player().isTaur())
            {
               outputText("\n在你的后腿之间，你长出了" + get_player().multiCockDescript() + "！\n");
            }
            else if(int(get_player().cocks.length) == 1)
            {
               outputText("\n");
            }
            else
            {
               outputText("\n在你原本应该长着阴茎的地方，你反而长出了" + get_player().multiCockDescript() + "！\n");
            }
            _loc7_ = 0;
            while(_loc7_ < int(get_player().cocks.length))
            {
               _loc2_++;
               if(int(get_player().cocks.length) == 1)
               {
                  outputText("你的");
               }
               else if(_loc7_ == 0)
               {
                  outputText("--你的第一根");
               }
               else if(_loc2_ % 5 == 0)
               {
                  outputText("--下一根");
               }
               else if(_loc2_ % 5 == 1)
               {
                  outputText("--你的第" + (_loc7_ + 1) + "根");
               }
               else if(_loc2_ % 5 == 2)
               {
                  outputText("--你的其中一根");
               }
               else if(_loc2_ % 5 == 3)
               {
                  outputText("--第" + (_loc7_ + 1) + "根");
               }
               else if(_loc2_ % 5 == 4)
               {
                  outputText("--你的另一根");
               }
               outputText(get_player().cockDescript(_loc7_) + (_loc2_ % 5 % 3 == 0 || _loc7_ == 0 ? "" : "") + "尺寸是" + Measurements.inchesOrCentimetres(get_player().cocks[_loc7_].cockLength) + "长，");
               outputText(Measurements.inchesOrCentimetres(get_player().cocks[_loc7_].cockThickness));
               if(_loc2_ % 3 == 0)
               {
                  outputText("宽。");
               }
               else if(_loc2_ % 3 == 1)
               {
                  outputText("粗。");
               }
               else if(_loc2_ % 3 == 2)
               {
                  outputText("直径。");
               }
               _loc12_ = get_player().cocks[_loc7_].get_cockType();
               if(_loc12_ == CockTypesEnum.ANEMONE)
               {
                  outputText("龟头周围环绕着微小的触手，里面含有催情效果的毒液。在它的根部也长出了许多类似但更长的触手，确保能将快感强加给你的伴侣。");
               }
               else if(_loc12_ == CockTypesEnum.AVIAN)
               {
                  outputText("这是一根红色的锥形肉棒，末端尖锐。它很好地收拢在包皮里。");
               }
               else if(_loc12_ == CockTypesEnum.BEE)
               {
                  outputText("这是一根又长又光滑的黑色肉棒，摸起来很坚硬。它的根部环绕着一层" + Measurements.shortSuffix(4) + " 长而柔软的蜜蜂绒毛。顶端有一层更细的黄色短毛。顶端非常敏感，如果不涂抹蜂蜜，就会一直疼痛。");
               }
               else if(_loc12_ == CockTypesEnum.CAT)
               {
                  outputText("它的末端汇聚成一个点，就像一根尖刺，表面布满了肉质的小倒刺。这些倒刺在根部较大，越靠近尖端越小。每一根刺都柔软且富有弹性，不会让你的任何伴侣感到疼痛。");
               }
               else if(_loc12_ == CockTypesEnum.DEMON)
               {
                  outputText("冠状沟环绕着一圈橡胶般的突起，当你变得更加兴奋时，它们会变大。整个阴茎闪闪发光，布满了微小而敏感的结节，毫无疑问地彰显着它的恶魔血统。");
               }
               else if(_loc12_ == CockTypesEnum.DOG)
               {
                  outputText("它闪闪发光，前端尖锐，布满青筋，就像一只大狗的阴茎。");
               }
               else if(_loc12_ == CockTypesEnum.DRAGON)
               {
                  outputText("凭借其锥形的尖端，几乎没有你进不去的洞。");
               }
               else if(_loc12_ == CockTypesEnum.ECHIDNA)
               {
                  outputText("它看起来相当壮观，竟然长着四个龟头。");
               }
               else if(_loc12_ == CockTypesEnum.FOX)
               {
                  outputText("它闪闪发光，前端尖锐，布满青筋，就像一只大狐狸的阴茎。");
               }
               else if(_loc12_ == CockTypesEnum.GNOLL)
               {
                  outputText("它闪亮的缟玛瑙色柱身上布满粗壮的青筋，末端呈尖锐状，就像鬣狗的一样。");
               }
               else if(_loc12_ == CockTypesEnum.HORSE)
               {
                  outputText("它呈现出斑驳的黑褐色，带有非常野性的花纹。阴茎的“头部”骄傲地膨胀着，就像马的一样。");
               }
               else if(_loc12_ == CockTypesEnum.KANGAROO)
               {
                  outputText("它通常盘绕在包皮内，但在勃起时会轻轻蠕动并逐渐变细成一个尖端，有点像一根主根。");
               }
               else if(_loc12_ == CockTypesEnum.LIZARD)
               {
                  outputText("它呈现出深邃的虹彩紫色。与人类的阴茎不同，它的肉棒并不光滑，而是布满了多个球状的凸起。");
               }
               else if(_loc12_ == CockTypesEnum.PIG)
               {
                  outputText("它是鲜艳的粉红色，顶端呈明显的螺旋状。");
               }
               else if(_loc12_ == CockTypesEnum.RED_PANDA)
               {
                  outputText("它被保护在一个柔软、长满绒毛的包皮鞘中。");
               }
               else if(_loc12_ == CockTypesEnum.RHINO)
               {
                  outputText("它呈现出光滑、坚韧的粉红色，形状细长，中心有一个椭圆形的凸起。");
               }
               else if(_loc12_ == CockTypesEnum.TENTACLE)
               {
                  outputText("它那绿色的表面完全被渗出的湿滑水珠所覆盖。它经常会自行蠕动，每当你发情时，那略显硕大的蘑菇状龟头就会变成紫红色。");
               }
               else if(_loc12_ == CockTypesEnum.WOLF)
               {
                  outputText("它呈现出闪亮的红色，前端尖锐，布满青筋，就像一只大狼的阴茎。");
               }
               if(get_player().cocks[_loc7_].hasKnot())
               {
                  if(get_player().cocks[_loc7_].get_cockType() == CockTypesEnum.DRAGON)
                  {
                     outputText("它的根部有一个奇怪的、类似肉结的球状物，但在勃起时通常不会像狗的肉结那样膨胀。");
                  }
                  else if(get_player().cocks[_loc7_].knotMultiplier >= 1.8)
                  {
                     outputText("在你的" + get_player().cockDescript(_loc7_) + "根部附近，那块肿胀得令人作呕的肉块，看起来和你的肉棒完全不搭，甚至有些滑稽。");
                  }
                  else if(get_player().cocks[_loc7_].knotMultiplier >= 1.4)
                  {
                     outputText("在你的" + get_player().cockDescript(_loc7_) + "底部上方，有一大块隆起的肉，以确保在交配时它能待在原位。");
                  }
                  else
                  {
                     outputText("在你的" + get_player().cockDescript(_loc7_) + "，随时准备膨胀，帮你把它卡在雌性的体内。");
                  }
                  outputText("这个肉结有" + Measurements.inchesOrCentimetres(get_player().cocks[_loc7_].cockThickness * get_player().cocks[_loc7_].knotMultiplier) + "粗" + (get_player().cocks[_loc7_].get_cockType() == CockTypesEnum.DRAGON ? "。" : "（在达到最大尺寸时）。"));
               }
               if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,2640) > 0)
               {
                  outputText("它被紧紧包裹在一个金色的金属套中，无论你怎么努力，如果没有别人的帮助，你似乎都无法把它取下来。");
               }
               if(get_player().cocks[_loc7_].sock != "" && get_player().cocks[_loc7_].sock != null)
               {
                  _loc5_ = get_player().cocks[_loc7_].sock;
                  if(_loc5_ == "alabaster")
                  {
                     _loc4_ = " 它被一个白色的蕾丝阴茎套包裹着，紧紧地贴合着它，就像新娘的婚纱一样。";
                  }
                  else if(_loc5_ == "amaranthine")
                  {
                     _loc4_ = " 它被一个紫色的蕾丝阴茎套包裹着" + (get_player().cocks[_loc7_].get_cockType() != CockTypesEnum.DISPLACER ? "，戴在你的阴茎上显得有些别扭" : "，完美地贴合了你的移位兽肉棒") + "。仅仅是戴着它就让你感觉更强壮、更有力量。";
                  }
                  else if(_loc5_ == "blue")
                  {
                     _loc4_ = " 它被一个似乎在发光的蓝色阴茎套包裹着。仅仅是戴着它就让你感觉施法更有效率了。";
                  }
                  else if(_loc5_ == "cobalt")
                  {
                     _loc4_ = " 它被一个蓝色的蕾丝阴茎套包裹着，紧紧地贴着你的阴茎……非常紧。它紧得几乎让人不舒服，你甚至怀疑它是否会抑制任何生长。";
                  }
                  else if(_loc5_ == "cockring")
                  {
                     _loc4_ = " 它被一个黑色的乳胶阴茎套包裹着，上面附有两个金属环，让你的阴茎稍微硬一点，[balls]渴望着释放。";
                  }
                  else if(_loc5_ == "gilded")
                  {
                     _loc4_ = " 它被一个金属金色的阴茎套包裹着，紧紧地贴着你，表面覆盖着闪闪发光的宝石。尽管你的身体很温暖，但这个阴茎套却保持着凉爽。";
                  }
                  else if(_loc5_ == "green")
                  {
                     _loc4_ = " 它被一个似乎在发光的绿色阴茎套包裹着。仅仅是戴着它就让你感觉更健康了。";
                  }
                  else if(_loc5_ == "red")
                  {
                     _loc4_ = " 它被一个似乎在发光的红色阴茎套包裹着。仅仅是戴着它就让你感觉充满了一点力量。";
                  }
                  else if(_loc5_ == "scarlet")
                  {
                     _loc4_ = " 它被一个红色的蕾丝阴茎套包裹着，紧紧地贴着你的阴茎。仅仅是戴着它就让你的肉棒跳动，仿佛渴望变得更大……";
                  }
                  else if(_loc5_ == "viridian")
                  {
                     _loc4_ = " 它被一个深绿色的蕾丝阴茎套包裹着，上面点缀着红色的玫瑰图案。仅仅是戴着它就让你的身体，尤其是你的阴茎，感到刺痛。";
                  }
                  else if(_loc5_ == "wool")
                  {
                     _loc4_ = " 它被一个羊毛白色的阴茎套包裹着，无论天气多冷都能保持舒适温暖。";
                  }
                  else
                  {
                     _loc4_ = " [b:哟，这是一个错误。]";
                  }
                  outputText(_loc4_);
               }
               outputText("\n");
               _loc7_++;
            }
            if(get_player().hasStatusEffect(StatusEffects.Infested))
            {
               outputText("时不时地，沾满精液的黏滑虫子会从你的[cocks]里滑出一部分，像蛇吐信子一样品尝着空气。\n");
            }
            if(get_player().hasStatusEffect(StatusEffects.ParasiteSlug) || get_player().hasPerk(PerkLib.ParasiteMusk))
            {
               outputText("你的[cocks]不断渗出前列腺液。偶尔，你的身体会抽搐紧绷，将浓稠的液体喷得到处都是。\n");
            }
         }
         if(get_player().balls > 0)
         {
            if(get_player().hasStatusEffect(StatusEffects.Uniball))
            {
               if(get_player().hasGooSkin())
               {
                  outputText("你的[sack]紧紧贴着腹股沟，滴着液体，将[aballsfull]紧紧包裹在你的身上。");
               }
               else
               {
                  outputText("你的[sack]紧紧贴着腹股沟，将[aballsfull]紧紧包裹在你的身上。");
               }
            }
            else if(int(get_player().cocks.length) == 0)
            {
               if(get_player().hasPlainSkin() || get_player().hasFeathers() || get_player().hasBarkSkin())
               {
                  outputText("在通常长着阴茎的地方，下面[if (ballsize > 1) {沉甸甸地摇晃着|悬挂着}]一个装满[aballsfull]的[sack]。");
               }
               if(get_player().isFurry())
               {
                  outputText("在通常长着阴茎的地方，下面[if (ballsize > 1) {低低地摇晃着|悬挂着}]一个装满[aballsfull]的毛茸茸的[sack]。");
               }
               if(get_player().hasScales())
               {
                  outputText("一个长满鳞片的[sack]紧紧地贴着你的身体，包裹着你的[ballsfull]。");
               }
               if(get_player().hasGooSkin())
               {
                  outputText("一个渗出液体的半固体囊袋，里面装着[aballsfull]，在通常长着阴茎的地方[if (ballsize > 1) {沉重地摇晃着|悬挂着}]。");
               }
            }
            else
            {
               if(get_player().hasPlainSkin() || get_player().hasFeathers() || get_player().hasBarkSkin())
               {
                  outputText("一个装着[aballsfull]的[sack]在你的[cocks]下方[if (ballsize > 1) {沉重地摇晃着|悬挂着}]。");
               }
               if(get_player().isFurry())
               {
                  outputText("一个毛茸茸的[sack]，里面装着[aballsfull]，在你的[cocks]下方[if (ballsize > 1) {低低地摇晃着|悬挂着}]。");
               }
               if(get_player().hasScales())
               {
                  outputText("一个长满鳞片的[sack]紧紧地贴着你的身体，包裹着你的[ballsfull]。");
               }
               if(get_player().hasGooSkin())
               {
                  outputText("一个渗着粘液的半固体阴囊装着[aballsfull]，在你的[cocks]下方[if (ballsize > 1) {沉甸甸地摇晃着|悬挂着}]。");
               }
            }
            outputText("你估计它们每一个的直径大约有 " + Measurements.numInchesOrCentimetres(get_player().ballSize) + "。\n");
         }
         if(int(get_player().vaginas.length) > 0)
         {
            if(get_player().hasPerk(PerkLib.NephilaArchQueen))
            {
               outputText("\n你的小穴像一个张开的血盆大口，长着柔软如枕的阴唇，顶端是一个凝胶状的肉质阴蒂，大小和宽度与你的头差不多。这个可怜的、饱受折磨的爱之蕾在一个环绕其中心的白金圆环边缘隆起。这个圆环烧得通红，让你对这个布满神经的肉豆豆的每一丝动作都极度敏感。可以看到你的一些触手宝宝部分地从子宫里蜿蜒而出，环抱着这个肥大的突起，涂抹着它们舒缓的粘液，徒劳地试图缓解你因圆环燃烧而无时无刻不在承受的强烈性快感。");
               outputText("\n");
            }
            if(get_player().get_gender() == 2 && get_player().isTaur())
            {
               outputText("\n你的女性部位已经转移到了你的后腿之间，看起来相当具有野性。");
            }
            outputText("\n");
            if(int(get_player().vaginas.length) == 1)
            {
               outputText("你有一个" + get_player().vaginaDescript(0) + "，以及一个" + Measurements.inchOrCentimetre(get_player().getClitLength()) + "长的阴蒂");
            }
            if(get_player().vaginas[0].virgin)
            {
               outputText("和一层完好的处女膜");
            }
            outputText("。");
            if(int(get_player().vaginas.length) > 1)
            {
               outputText("你有" + int(get_player().vaginas.length) + "个" + get_player().vaginaDescript(0) + "，每个都有" + Measurements.inchOrCentimetre(get_player().getClitLength()) + "厘米长的阴蒂。");
            }
            if(get_player().hasStatusEffect(StatusEffects.ParasiteEel) || get_player().hasStatusEffect(StatusEffects.ParasiteNephila))
            {
               if(get_player().hasStatusEffect(StatusEffects.ParasiteEel))
               {
                  if(get_player().statusEffectv1(StatusEffects.ParasiteEel) == 1)
                  {
                     outputText("流出的不是寻常的女性淫液，而是几缕浓稠、粘滑、微浊的液体，从");
                  }
                  if(get_player().statusEffectv1(StatusEffects.ParasiteEel) == 2)
                  {
                     outputText("流出的不是寻常的女性淫液，而是好几缕浓稠、粘滑、微浊的液体，从");
                  }
                  if(get_player().statusEffectv1(StatusEffects.ParasiteEel) > 2)
                  {
                     outputText("流出的不是寻常的女性淫液，而是多得惊人的浓稠、粘滑的粘液，从");
                  }
               }
               else if(get_player().hasStatusEffect(StatusEffects.ParasiteNephila))
               {
                  if(get_player().statusEffectv1(StatusEffects.ParasiteNephila) <= 3)
                  {
                     outputText("流出的不是寻常的女性淫液，而是几缕浓稠、粘滑的紫罗兰色粘液，从");
                  }
                  else if(get_player().statusEffectv1(StatusEffects.ParasiteNephila) <= 5)
                  {
                     outputText("流出的不是通常的爱液，而是几缕浓稠、粘滑的紫罗兰色史莱姆粘液，从");
                  }
                  else if(get_player().statusEffectv1(StatusEffects.ParasiteNephila) > 5)
                  {
                     outputText("流出的不是通常的爱液，而是大量浓稠、粘滑的紫罗兰色史莱姆粘液，从");
                  }
               }
               if(get_player().vaginas[0].vaginalLooseness < 2)
               {
                  outputText("你的" + get_player().vaginaDescript(0) + "中渗出，");
               }
               else if(get_player().vaginas[0].vaginalLooseness >= 2 && get_player().vaginas[0].vaginalLooseness < 4)
               {
                  outputText("你的" + get_player().vaginaDescript(0) + "中渗出，阴唇微微分开，");
               }
               else if(get_player().vaginas[0].vaginalLooseness >= 4)
               {
                  outputText("你那巨大的" + get_player().vaginaDescript(0) + "中渗出，");
               }
               outputText(get_player().clothedOrNakedLower("立刻覆盖并浸透你穿上的任何内衣。","无论你走到哪里，都会留下连绵不断的粘液痕迹。"));
            }
            else if(get_player().get_lib100() < 50 && get_player().get_lust100() < 50)
            {
               if(get_player().vaginas[0].vaginalWetness >= 2 && get_player().vaginas[0].vaginalWetness < 4)
               {
                  outputText("水光闪烁在");
               }
               if(get_player().vaginas[0].vaginalWetness >= 4)
               {
                  outputText("偶尔有几滴");
                  outputText("润滑液滴落自");
               }
               if(get_player().vaginas[0].vaginalWetness >= 2)
               {
                  if(get_player().vaginas[0].vaginalLooseness < 2)
                  {
                     outputText("你的" + get_player().vaginaDescript(0) + "滴落。");
                  }
                  if(get_player().vaginas[0].vaginalLooseness >= 2 && get_player().vaginas[0].vaginalLooseness < 4)
                  {
                     outputText("你的" + get_player().vaginaDescript(0) + "滴落，阴唇微微张开。");
                  }
                  if(get_player().vaginas[0].vaginalLooseness >= 4)
                  {
                     outputText("你那巨大的" + get_player().vaginaDescript(0) + "。");
                  }
               }
            }
            if((get_player().get_lib100() >= 50 || get_player().get_lust100() >= 50) && (get_player().get_lib100() < 80 && get_player().get_lust100() < 80))
            {
               if(get_player().vaginas[0].vaginalWetness < 2)
               {
                  outputText("水光闪烁在");
               }
               if(get_player().vaginas[0].vaginalWetness >= 2 && get_player().vaginas[0].vaginalWetness < 4)
               {
                  outputText("偶尔有几滴");
                  outputText("润滑液滴落自");
               }
               if(get_player().vaginas[0].vaginalWetness >= 4)
               {
                  outputText("细细的");
                  outputText("润滑液偶尔滴落自");
               }
               if(get_player().vaginas[0].vaginalLooseness < 2)
               {
                  outputText("你的" + get_player().vaginaDescript(0) + "滴落。");
               }
               if(get_player().vaginas[0].vaginalLooseness >= 2 && get_player().vaginas[0].vaginalLooseness < 4)
               {
                  outputText("你的" + get_player().vaginaDescript(0) + "滴落，阴唇微微张开。");
               }
               if(get_player().vaginas[0].vaginalLooseness >= 4)
               {
                  outputText("你那巨大的" + get_player().vaginaDescript(0) + "。");
               }
            }
            if(get_player().get_lib100() > 80 || get_player().get_lust100() > 80)
            {
               if(get_player().vaginas[0].vaginalWetness < 2)
               {
                  outputText("偶尔有几滴");
                  outputText("润滑液滴落自");
               }
               if(get_player().vaginas[0].vaginalWetness >= 2 && get_player().vaginas[0].vaginalWetness < 4)
               {
                  outputText("细细的");
                  outputText("润滑液偶尔滴落自");
               }
               if(get_player().vaginas[0].vaginalWetness >= 4)
               {
                  outputText("浓稠的");
                  outputText("润滑液不断地从");
               }
               if(get_player().vaginas[0].vaginalLooseness < 2)
               {
                  outputText("你的" + get_player().vaginaDescript(0) + "滴落。");
               }
               if(get_player().vaginas[0].vaginalLooseness >= 2 && get_player().vaginas[0].vaginalLooseness < 4)
               {
                  outputText("你的" + get_player().vaginaDescript(0) + "滴落，阴唇微微张开。");
               }
               if(get_player().vaginas[0].vaginalLooseness >= 4)
               {
                  outputText("你那巨大的肉洞中滴落。");
               }
            }
            if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,2640) > 0)
            {
               outputText("被一块金属板覆盖，只留出足够液体通过的空间。");
            }
            outputText("\n");
         }
         if(int(get_player().cocks.length) == 0 && int(get_player().vaginas.length) == 0)
         {
            outputText("\n很奇怪，你没有任何性器官。\n");
         }
         if(get_player().ass != null)
         {
            outputText("\n");
            outputText("在你的两瓣屁股之间，有一个[asshole]。\n");
         }
         if(get_player().eyebrowPierced > 0)
         {
            outputText("\n一个孤零零的" + get_player().eyebrowPShort + "装饰着你的眉毛，看起来非常时尚。");
         }
         if(get_player().earsPierced > 0)
         {
            outputText("\n你的耳朵上戴着" + get_player().earsPShort + "。");
         }
         if(get_player().nosePierced > 0)
         {
            outputText("\n一个" + get_player().nosePShort + "悬挂在你的鼻子上。");
         }
         if(get_player().lipPierced > 0)
         {
            outputText("\n在你的嘴唇上，一个闪闪发光的" + get_player().lipPShort + "清晰可见。");
         }
         if(get_player().tonguePierced > 0)
         {
            outputText("\n虽然看不见，但你能清楚地感觉到你的" + get_player().tonguePShort + "固定在你的舌头上。");
         }
         if(get_player().nipplesPierced == 3)
         {
            outputText("\n随着你沉重的" + get_player().nipplesPShort + "来回晃动，你每走一步，你的[nipples]都会感到一阵刺痛和酥麻。");
         }
         else if(get_player().nipplesPierced > 0)
         {
            outputText("\n你的[nipples]上穿戴着" + get_player().nipplesPShort + "。");
         }
         if(int(get_player().cocks.length) > 0)
         {
            if(get_player().cocks[0].get_isPierced())
            {
               outputText("\n一个" + get_player().cocks[0].pShortDesc + "装饰着你的[cock]，看起来十分变态。");
            }
         }
         if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,286) == 1)
         {
            outputText("\n一个镶嵌着红宝石的魔法脐环穿过你的肚脐，让你能随心所欲地召唤塞拉芙。");
         }
         if(get_player().hasVagina())
         {
            if(get_player().vaginas[0].labiaPierced > 0)
            {
               outputText("\n你的" + get_player().vaginaDescript(0) + "因" + get_player().vaginas[0].labiaPShort + " 挂在你的唇边而闪闪发光。");
            }
            if(get_player().vaginas[0].clitPierced > 0)
            {
               outputText("\n你的[clit]因其 " + get_player().vaginas[0].clitPShort + " 而闪闪发光，让人无法忽视。");
            }
         }
         if(get_player().udder.hasUdder && get_player().udder.fullness != 0)
         {
            outputText("[pg]你有一个乳房，里面装有 " + get_player().udder.fullness + " 盎司的奶水");
         }
         menu();
         addButton(0,"设置性别",genderMenu).hint("你可以在这里覆盖游戏的自动性别判定。");
         addButton(14,"返回",playerMenu);
      }
   }
}

