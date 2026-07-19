package classes
{
   import classes.internals.Utils;
   import classes.lists.BodyPartLists;
   import flash.Boot;
   
   public class Character extends Creature
   {
      
      public var tone:Number;
      
      public var thickness:Number;
      
      public var pregnancyAllowHerm:Boolean;
      
      public var keyItems:Array;
      
      public var _pregnancyType:int;
      
      public var _pregnancyIncubation:int;
      
      public var _buttPregnancyType:int;
      
      public var _buttPregnancyIncubation:int;
      
      public function Character()
      {
         if(Boot.skip_constructor)
         {
            return;
         }
         pregnancyAllowHerm = false;
         _buttPregnancyIncubation = 0;
         _buttPregnancyType = 0;
         _pregnancyIncubation = 0;
         _pregnancyType = 0;
         tone = 0;
         thickness = 0;
         super();
         keyItems = [];
      }
      
      public function wingsDescript() : String
      {
         return Appearance.wingsDescript(this);
      }
      
      public function viridianChange() : Boolean
      {
         var _loc1_:int = cockTotal();
         if(_loc1_ == 0)
         {
            return false;
         }
         while(_loc1_ > 0)
         {
            _loc1_--;
            if(cocks[_loc1_].sock == "amaranthine" && cocks[_loc1_].get_cockType() != CockTypesEnum.DISPLACER)
            {
               return true;
            }
         }
         return false;
      }
      
      public function tongueDescript() : String
      {
         return Appearance.tongueDescription(this);
      }
      
      public function tailDescript() : String
      {
         return Appearance.tailDescript(this);
      }
      
      public function removeKeyItems() : void
      {
         var _loc1_:int = int(keyItems.length);
         while(_loc1_ > 0)
         {
            _loc1_--;
            keyItems.splice(_loc1_,1);
         }
      }
      
      public function removeKeyItem(param1:String) : void
      {
         var _loc2_:int = int(keyItems.length);
         if(int(keyItems.length) <= 0)
         {
            return;
         }
         while(_loc2_ > 0)
         {
            _loc2_--;
            if(keyItems[_loc2_].keyName == param1)
            {
               keyItems.splice(_loc2_,1);
               _loc2_ = 0;
            }
         }
      }
      
      public function redPandaTailColor2() : String
      {
         return Appearance.redPandaTailColor2(this);
      }
      
      public function rearBodyDescript() : String
      {
         return Appearance.rearBodyDescript(this);
      }
      
      public function pregnancyUpdate() : Boolean
      {
         return false;
      }
      
      public function pregnancyAdvance() : Boolean
      {
         if(_pregnancyIncubation > 0)
         {
            --_pregnancyIncubation;
         }
         if(_pregnancyIncubation < 0)
         {
            _pregnancyIncubation = 0;
         }
         if(_buttPregnancyIncubation > 0)
         {
            --_buttPregnancyIncubation;
         }
         if(_buttPregnancyIncubation < 0)
         {
            _buttPregnancyIncubation = 0;
         }
         return pregnancyUpdate();
      }
      
      public function oneTailDescript() : String
      {
         return Appearance.oneTailDescript(this);
      }
      
      public function neckDescript() : String
      {
         return Appearance.neckDescript(this);
      }
      
      public function nagaLowerBodyColor2() : String
      {
         return Appearance.nagaLowerBodyColor2(this);
      }
      
      public function modTone(param1:Number, param2:Number = 1) : String
      {
         if(param1 == tone)
         {
            return "";
         }
         param2 = Math.min(param2,Math.abs(tone - param1));
         if(param1 >= 50 && tone < param1)
         {
            tone += param2;
            if(param1 == tone)
            {
               return "[pg]你获得了一些肌肉张力，但无法通过这种方式获得更多了。(+" + param2 + " 肌肉张力)";
            }
            return "[pg]当你移动时，你的身体感觉更加结实了，你的肌肉看起来也稍微明显了一些。(+" + param2 + " 肌肉张力)";
         }
         if(param1 <= 50 && tone > param1)
         {
            tone -= param2;
            if(param1 == tone)
            {
               return "[pg]你失去了一些肌肉线条，但无法通过这种方式失去更多了。(-" + param2 + " 肌肉线条)";
            }
            return "[pg]活动时，你感到身体比平时多了一丝晃动。你似乎并没有变胖，但肌肉看起来没那么明显了。(-" + param2 + " 肌肉线条)";
         }
         return "";
      }
      
      public function modThickness(param1:Number, param2:Number = 1) : String
      {
         if(param1 == thickness)
         {
            return "";
         }
         param2 = Math.min(param2,Math.abs(thickness - param1));
         if(param1 >= 50 && thickness < param1)
         {
            thickness += param2;
            return "[pg]随着你的身体明显丰满，你的重心发生了一点变化。(+" + param2 + " 身体丰满度)";
         }
         if(param1 <= 50 && thickness > param1)
         {
            thickness -= param2;
            return "[pg]每一个动作都感觉比上一个稍微轻松了一点。难道说你刚刚减轻了一点体重！？(+" + param2 + " 身体纤细度)";
         }
         return "";
      }
      
      public function modFem(param1:Number, param2:Number = 1) : String
      {
         var _loc3_:String = "";
         var _loc4_:String = faceDesc();
         var _loc5_:Number = get_femininity();
         var _loc6_:Boolean = false;
         if(param1 == get_femininity())
         {
            return "";
         }
         if(param1 < get_femininity() && param1 <= 50)
         {
            set_femininity(get_femininity() - param2);
            if(get_femininity() < param1)
            {
               set_femininity(param1);
            }
            _loc6_ = true;
         }
         if(param1 > get_femininity() && param1 >= 50)
         {
            set_femininity(get_femininity() + param2);
            if(get_femininity() > param1)
            {
               set_femininity(param1);
            }
            _loc6_ = true;
         }
         if(!hasPerk(PerkLib.Androgyny))
         {
            fixFemininity();
         }
         if(!_loc6_)
         {
            return "";
         }
         if(_loc4_ != faceDesc())
         {
            if(param1 > _loc5_)
            {
               _loc3_ = "[pg]<b>随着你的身体变得更加女性化，你的面部特征也变得柔和了。(+" + param2 + ")</b>";
            }
            if(param1 < _loc5_)
            {
               _loc3_ = "[pg]<b>随着你的身体变得更加男性化，你的面部特征也变得硬朗了。(+" + param2 + ")</b>";
            }
         }
         else if(param1 > _loc5_)
         {
            _loc3_ = "[pg]你的" + faceDescript() + "传来一阵酥麻感，它正潜移默化地变得更加女性化。(+" + param2 + ")";
         }
         else if(param1 < _loc5_)
         {
            _loc3_ = "[pg]你的" + faceDescript() + "感到一阵刺痛，它正悄然变得更加男性化。(+" + param2 + ")";
         }
         return _loc3_;
      }
      
      public function maxHunger() : Number
      {
         return 100;
      }
      
      public function knockUpForce(param1:int = 0, param2:int = 0, param3:Boolean = false) : void
      {
         _pregnancyType = param1;
         _pregnancyIncubation = param1 == 0 ? 0 : param2;
         pregnancyAllowHerm = isHerm() || param3;
      }
      
      public function knockUp(param1:int = 0, param2:int = 0, param3:int = 100, param4:int = 0, param5:Boolean = false) : void
      {
         if(hasStatusEffect(StatusEffects.Contraceptives) && param4 < 1)
         {
            return;
         }
         var _loc6_:int = 0;
         if(param4 >= 1)
         {
            _loc6_ = 9000;
         }
         if(param4 <= -1)
         {
            _loc6_ = -9000;
         }
         if(get_pregnancyIncubation() == 0 && totalFertility() + _loc6_ > Math.floor(Math.random() * param3) && hasVagina())
         {
            knockUpForce(param1,param2,param5);
         }
         if(param1 != 1 && param1 != 5 && param1 != 10)
         {
            if(hasPerk(PerkLib.SpiderOvipositor) || hasPerk(PerkLib.BeeOvipositor))
            {
               if(totalFertility() + _loc6_ > Math.floor(Math.random() * param3))
               {
                  fertilizeEggs();
               }
            }
         }
      }
      
      public function keyItemv4(param1:String) : Number
      {
         var _loc2_:int = int(keyItems.length);
         if(int(keyItems.length) <= 0)
         {
            return 0;
         }
         while(_loc2_ > 0)
         {
            _loc2_--;
            if(keyItems[_loc2_].keyName == param1)
            {
               return keyItems[_loc2_].value4;
            }
         }
         return 0;
      }
      
      public function keyItemv3(param1:String) : Number
      {
         var _loc2_:int = int(keyItems.length);
         if(int(keyItems.length) <= 0)
         {
            return 0;
         }
         while(_loc2_ > 0)
         {
            _loc2_--;
            if(keyItems[_loc2_].keyName == param1)
            {
               return keyItems[_loc2_].value3;
            }
         }
         return 0;
      }
      
      public function keyItemv2(param1:String) : Number
      {
         var _loc2_:int = int(keyItems.length);
         if(int(keyItems.length) <= 0)
         {
            return 0;
         }
         while(_loc2_ > 0)
         {
            _loc2_--;
            if(keyItems[_loc2_].keyName == param1)
            {
               return keyItems[_loc2_].value2;
            }
         }
         return 0;
      }
      
      public function keyItemv1(param1:String) : Number
      {
         var _loc2_:int = int(keyItems.length);
         if(int(keyItems.length) <= 0)
         {
            return 0;
         }
         while(_loc2_ > 0)
         {
            _loc2_--;
            if(keyItems[_loc2_].keyName == param1)
            {
               return keyItems[_loc2_].value1;
            }
         }
         return 0;
      }
      
      public function isPregnant() : Boolean
      {
         return _pregnancyType != 0;
      }
      
      public function isButtPregnant() : Boolean
      {
         return _buttPregnancyType != 0;
      }
      
      public function hornDescript() : String
      {
         if(horns.type == 12 && horns.value == 1)
         {
            return "木质鹿角";
         }
         return Appearance.DEFAULT_HORN_NAMES.h[horns.type] + "角";
      }
      
      public function hipDescript() : String
      {
         return Appearance.hipDescription(this);
      }
      
      public function hasMuzzle() : Boolean
      {
         return BodyPartLists.MUZZLES.indexOf(face.type) != -1;
      }
      
      public function hasLongTail() : Boolean
      {
         if(isNaga())
         {
            return true;
         }
         return BodyPartLists.LONG_TAILS.indexOf(tail.type) != -1;
      }
      
      public function hasKnot(param1:int = 0) : Boolean
      {
         if(param1 > cockTotal() - 1 || param1 < 0)
         {
            return false;
         }
         return cocks[param1].hasKnot();
      }
      
      public function hasKeyItem(param1:String) : Boolean
      {
         var _loc4_:* = null as KeyItem;
         var _loc2_:int = 0;
         var _loc3_:Array = keyItems;
         while(_loc2_ < int(_loc3_.length))
         {
            _loc4_ = _loc3_[_loc2_];
            _loc2_++;
            if(_loc4_.keyName == param1)
            {
               return true;
            }
         }
         return false;
      }
      
      public function hasBeard() : Boolean
      {
         return beard.length > 0;
      }
      
      public function hairShort() : String
      {
         return Appearance.hairShort(this);
      }
      
      public function hairOrFurColor() : String
      {
         if(isFluffy())
         {
            return skin.furColor;
         }
         return hair.color;
      }
      
      public function hairOrFur() : String
      {
         if(hasFur())
         {
            return "皮毛";
         }
         return "头发";
      }
      
      public function hairDescript() : String
      {
         return Appearance.hairDescription(this);
      }
      
      public function growHair(param1:Number = 0.1) : Boolean
      {
         var _loc2_:Number = hair.length;
         if(hair.type == 6)
         {
            return false;
         }
         _temp_1.length += param1;
         if(hair.type == 7 && hair.length > 8)
         {
            hair.length = 8;
         }
         if(hair.length > 0 && _loc2_ == 0)
         {
            get_game().outputText("[pg][b:你不再是秃头了。现在你的头上长出了" + hairDescript() + "。][pg]");
            return true;
         }
         if(hair.length >= 1 && _loc2_ < 1 || hair.length >= 3 && _loc2_ < 3 || hair.length >= 6 && _loc2_ < 6 || hair.length >= 10 && _loc2_ < 10 || hair.length >= 16 && _loc2_ < 16 || hair.length >= 26 && _loc2_ < 26 || hair.length >= 40 && _loc2_ < 40 || hair.length >= 40 && hair.length >= get_tallness() && _loc2_ < get_tallness())
         {
            get_game().outputText("[pg][b:你的头发生长达到了一个新的阶段，让你拥有了" + hairDescript() + "。][pg]");
            return true;
         }
         return false;
      }
      
      public function growBeard(param1:Number = 0.1) : Boolean
      {
         var _loc2_:Number = beard.length;
         _temp_1.length += param1;
         if(beard.length > 0 && _loc2_ == 0)
         {
            get_game().outputText("[pg][b:你感到脸颊和下巴一阵酥麻。现在你的脸颊和下巴上长出了" + beardDescript() + "。][pg]");
            return true;
         }
         if(beard.length >= 0.2 && _loc2_ < 0.2)
         {
            get_game().outputText("[pg][b:你的胡须生长达到了一个新的阶段，让你拥有了" + beardDescript() + "。][pg]");
            return true;
         }
         if(beard.length >= 0.5 && _loc2_ < 0.5)
         {
            get_game().outputText("[pg][b:你的胡须生长达到了一个新的阶段，让你拥有了" + beardDescript() + "。][pg]");
            return true;
         }
         if(beard.length >= 1.5 && _loc2_ < 1.5)
         {
            get_game().outputText("[pg][b:你的胡须生长达到了一个新的阶段，让你拥有了" + beardDescript() + "。][pg]");
            return true;
         }
         if(beard.length >= 3 && _loc2_ < 3)
         {
            get_game().outputText("[pg][b:你的胡须生长达到了一个新的阶段，让你拥有了" + beardDescript() + "。][pg]");
            return true;
         }
         if(beard.length >= 6 && _loc2_ < 6)
         {
            get_game().outputText("[pg][b:你的胡须生长达到了一个新的阶段，让你拥有了" + beardDescript() + "。][pg]");
            return true;
         }
         return false;
      }
      
      public function get_pregnancyType() : int
      {
         return _pregnancyType;
      }
      
      public function get_pregnancyIncubation() : int
      {
         return _pregnancyIncubation;
      }
      
      public function get_buttPregnancyType() : int
      {
         return _buttPregnancyType;
      }
      
      public function get_buttPregnancyIncubation() : int
      {
         return _buttPregnancyIncubation;
      }
      
      public function fixFemininity() : String
      {
         if(get_femininity() > femininityHigh())
         {
            set_femininity(femininityHigh());
            return "[b:你发现由于体内荷尔蒙的变化，你那过于女性化的脸庞失去了一点往日的女性美。][pg]";
         }
         if(get_femininity() < femininityLow())
         {
            set_femininity(femininityLow());
            return "[b:由于体内荷尔蒙的变化，你那极具男子气概、轮廓分明的面部特征变得柔和了一些。][pg]";
         }
         return "";
      }
      
      public function findKeyItem(param1:String) : Number
      {
         var _loc2_:int = int(keyItems.length);
         if(int(keyItems.length) <= 0)
         {
            return -2;
         }
         while(_loc2_ > 0)
         {
            _loc2_--;
            if(keyItems[_loc2_].keyName == param1)
            {
               return _loc2_;
            }
         }
         return -1;
      }
      
      public function femininityLow() : int
      {
         switch(get_gender())
         {
            case 0:
               return 20;
            case 1:
               return 0;
            case 2:
               return 30;
            case 3:
               return 20;
            default:
               return 0;
         }
      }
      
      public function femininityHigh() : int
      {
         switch(get_gender())
         {
            case 0:
               return 85;
            case 1:
               return 71;
            case 2:
               return 100;
            case 3:
               return 85;
            default:
               return 100;
         }
      }
      
      public function faceDescript() : String
      {
         var _loc1_:String = "";
         if(face.type == 0)
         {
            return "脸";
         }
         if(!hasMuzzle())
         {
            if(face.type == 3)
            {
               if(Math.floor(Math.random() * 4) == 0)
               {
                  _loc1_ = "牛的";
               }
               if(int(Math.random() * 2) == 0)
               {
                  return "口鼻";
               }
               return _loc1_ + "脸";
            }
            if(face.type == 4)
            {
               if(Math.floor(Math.random() * 4) == 0)
               {
                  _loc1_ = "棱角分明的";
               }
               return _loc1_ + "脸";
            }
            if(face.type == 19 || face.type == 20)
            {
               if(Math.floor(Math.random() * 4) == 0)
               {
                  _loc1_ = (face.type == 19 ? "猪" : "野猪") + "般的";
               }
               if(Math.floor(Math.random() * 4) == 0)
               {
                  return _loc1_ + "口鼻";
               }
               return _loc1_ + "脸";
            }
            return "脸";
         }
         if(int(Math.random() * 3) == 0 && face.type == 1)
         {
            _loc1_ = "长";
         }
         if(int(Math.random() * 3) == 0 && face.type == 28)
         {
            _loc1_ = "猫科";
         }
         if(int(Math.random() * 3) == 0 && face.type == 21)
         {
            _loc1_ = "犀牛";
         }
         if(int(Math.random() * 3) == 0 && (face.type == 7 || face.type == 12))
         {
            _loc1_ = "爬行类";
         }
         if(int(Math.random() * 3) == 0 && face.type == 24)
         {
            _loc1_ = "犬类";
         }
         switch(Utils.rand(3))
         {
            case 0:
               return _loc1_ + "吻部";
            case 1:
               return _loc1_ + "口鼻";
            case 2:
               return _loc1_ + "脸";
            default:
               return _loc1_ + "脸";
         }
      }
      
      public function faceDesc() : String
      {
         var _loc1_:String = "";
         if(get_femininity() < 10)
         {
            _loc1_ = "方正的下巴";
            if(!hasBeard())
            {
               _loc1_ += "和轮廓分明的下颌线";
            }
            else
            {
               _loc1_ += "、轮廓分明的下颌线，以及" + beardDesc();
            }
         }
         else if(get_femininity() < 20)
         {
            _loc1_ = "一张粗犷的" + faceDescript() + "";
            if(hasBeard())
            {
               _loc1_ += "以及" + beardDesc();
            }
            _loc1_ += "，绝对称得上英俊";
         }
         else if(get_femininity() < 28)
         {
            _loc1_ = "轮廓分明的下颌线和相当男性化的侧脸";
         }
         else if(get_femininity() < 35)
         {
            _loc1_ = "略显男性化、棱角分明的下颌线";
         }
         else if(get_femininity() < 45)
         {
            _loc1_ = "极其微弱的男性气质";
         }
         else if(get_femininity() <= 55)
         {
            _loc1_ = "中性的五官，对男女来说都很自然的面孔";
         }
         else if(get_femininity() <= 65)
         {
            _loc1_ = "柔和的线条，透着一丝女性的柔美";
         }
         else if(get_femininity() <= 72)
         {
            _loc1_ = "优美的脸庞轮廓，嘴唇微微嘟起";
         }
         else if(get_femininity() <= 80)
         {
            _loc1_ = "美丽且充满女人味的轮廓，绝对能吸引男性的目光";
         }
         else if(get_femininity() <= 90)
         {
            _loc1_ = "丰满的嘴唇、小巧的鼻子和引人注目的睫毛的华丽面容";
         }
         else
         {
            _loc1_ = "令人惊艳的女性化面容，有着丰满微翘的嘴唇、可爱的鼻子和长长美丽的睫毛";
         }
         return _loc1_;
      }
      
      public function eyesDescript() : String
      {
         return Appearance.eyesDescript(this);
      }
      
      public function extraEyesDescriptShort() : String
      {
         return Appearance.extraEyesDescriptShort(this);
      }
      
      public function extraEyesDescript() : String
      {
         return Appearance.extraEyesDescript(this);
      }
      
      public function createKeyItem(param1:String, param2:Number = 0, param3:Number = 0, param4:Number = 0, param5:Number = 0) : void
      {
         var _loc6_:KeyItem = new KeyItem();
         _loc6_.keyName = param1;
         _loc6_.value1 = param2;
         _loc6_.value2 = param3;
         _loc6_.value3 = param4;
         _loc6_.value4 = param5;
         keyItems.push(_loc6_);
         keyItems.sort(function(param1:KeyItem, param2:KeyItem):int
         {
            if(param1.keyName > param2.keyName)
            {
               return 1;
            }
            if(param1.keyName < param2.keyName)
            {
               return -1;
            }
            return 0;
         });
      }
      
      public function buttKnockUpForce(param1:int = 0, param2:int = 0) : void
      {
         _buttPregnancyType = param1;
         _buttPregnancyIncubation = param1 == 0 ? 0 : param2;
      }
      
      public function buttKnockUp(param1:int = 0, param2:int = 0, param3:int = 100, param4:int = 0) : void
      {
         if(hasStatusEffect(StatusEffects.Contraceptives) && param4 < 1)
         {
            return;
         }
         var _loc5_:int = 0;
         if(param4 >= 1)
         {
            _loc5_ = 9000;
         }
         if(param4 <= -1)
         {
            _loc5_ = -9000;
         }
         if(get_buttPregnancyIncubation() == 0 && totalFertility() + _loc5_ > Math.floor(Math.random() * param3))
         {
            buttKnockUpForce(param1,param2);
         }
      }
      
      public function buttDescript() : String
      {
         return Appearance.buttDescription(this);
      }
      
      public function beardDescript() : String
      {
         return Appearance.beardDescription(this);
      }
      
      public function beardDesc() : String
      {
         if(hasBeard())
         {
            return "胡须";
         }
         return "错误：没有胡子！<b>你不是维京人，应该立刻告诉KITTEH。</b>";
      }
      
      public function assDescript() : String
      {
         return buttDescript();
      }
      
      public function addKeyValue(param1:String, param2:Number = 1, param3:Number = 0) : void
      {
         var _loc4_:int = int(keyItems.length);
         if(int(keyItems.length) <= 0)
         {
            return;
         }
         while(_loc4_ > 0)
         {
            _loc4_--;
            if(keyItems[_loc4_].keyName == param1)
            {
               if(param2 < 1 || param2 > 4)
               {
                  return;
               }
               if(param2 == 1)
               {
                  _temp_1.value1 += param3;
               }
               if(param2 == 2)
               {
                  _temp_2.value2 += param3;
               }
               if(param2 == 3)
               {
                  _temp_3.value3 += param3;
               }
               if(param2 == 4)
               {
                  _temp_4.value4 += param3;
               }
               return;
            }
         }
      }
   }
}

