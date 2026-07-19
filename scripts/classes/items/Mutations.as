package classes.items
{
   import classes.BaseContent;
   import classes.CoC;
   import classes.Cock;
   import classes.DynStat;
   import classes.KeyItem;
   import classes.PerkLib;
   import classes.Player;
   import classes.StatusEffects;
   import classes._FlagDict.FlagDict_Impl_;
   import classes.globalFlags.KFLAGS;
   import classes.internals.Utils;
   import classes.internals.WeightedChoice;
   import classes.lists.ColorLists;
   import flash.Boot;
   
   public final class Mutations extends BaseContent
   {
      
      public static var init__:Boolean;
      
      public static var _instance:Mutations;
      
      public var lizardSkinToneChoices:WeightedChoice;
      
      public var changes:int;
      
      public var changeLimit:int;
      
      public function Mutations()
      {
         if(Boot.skip_constructor)
         {
            return;
         }
         lizardSkinToneChoices = new WeightedChoice().add(["紫色","深粉色"],5).add(["银色","浅灰色"],5).add(["红色","橙色"],18).add(["绿叶子","黄绿色"],18).add(["白色","浅灰色"],18).add(["蓝色","海蓝色"],18).add(["黑色","深灰色"],18);
         changeLimit = 1;
         changes = 0;
         super();
         if(Mutations._instance != null)
         {
            throw new Error("只能通过 Mutations.init() 访问突变");
         }
      }
      
      public static function init() : Mutations
      {
         return Mutations._instance;
      }
      
      public function updateOvipositionPerk(param1:String) : int
      {
         var _loc2_:Array = param1.split("-");
         if(int(_loc2_.length) > 1 && ["goldenSeed","catTransformation"].indexOf(_loc2_[0]) == -1)
         {
            param1 = _loc2_[0];
         }
         if(get_player().hasPerk(PerkLib.BasiliskWomb))
         {
            if(get_player().hasPerk(PerkLib.Oviposition))
            {
               return 0;
            }
            outputText("[pg]你的内心深处发生了一些变化。这让你感到有些头晕，但很快就过去了。除此之外，你不太确定刚才到底发生了什么，但你确信它源于你的蛇怪子宫。\n");
            outputText("(<b>获得特质：产卵</b>)");
            get_player().createPerk(PerkLib.Oviposition,0,0,0,0);
            return 1;
         }
         if(changes >= changeLimit)
         {
            return 0;
         }
         var _loc3_:String = param1;
         if(_loc3_ != "TonOTrice")
         {
            if(_loc3_ != "echidnaTFs")
            {
               if(_loc3_ != "reptilum")
               {
                  if(_loc3_ != "EmberTFs")
                  {
                     if(_loc3_ != "goldenSeed-HarpyWomb")
                     {
                        if(_loc3_ != "rizzaRootEffect")
                        {
                           if(_loc3_ != "snakeOil")
                           {
                              if(_loc3_ != "winterPudding")
                              {
                                 if(!get_player().hasPerk(PerkLib.Oviposition))
                                 {
                                    return 0;
                                 }
                                 if(get_player().lizardScore() >= 8)
                                 {
                                    return 0;
                                 }
                                 if(param1 != "superHummus")
                                 {
                                    outputText("[pg]子宫里的又一次变化波及了你的生殖系统。不知为何，你知道自己失去了一点爬行动物的生殖能力。\n");
                                    outputText("(<b>失去特质：产卵</b>)\n");
                                 }
                                 get_player().removePerk(PerkLib.Oviposition);
                                 return -1;
                              }
                           }
                        }
                     }
                  }
                  return 0;
               }
            }
         }
         if(get_player().hasPerk(PerkLib.Oviposition))
         {
            return 0;
         }
         outputText("[pg]你的身体深处发生了一些变化。这让你感到有些头晕，但很快就过去了。除此之外，你不太确定刚才到底发生了什么，但你确信它源自你的子宫。\n");
         outputText("(<b>获得特质：产卵</b>)");
         get_player().createPerk(PerkLib.Oviposition,0,0,0,0);
         changes += 1;
         return 1;
      }
      
      public function updateGills(param1:int = 0) : int
      {
         var _loc2_:int = int(get_player().gills.type);
         if(get_player().gills.type == param1)
         {
            return 0;
         }
         if(param1 != 3 && get_undergarments().SEA_SHIRT.wearingEnchanted())
         {
            return 0;
         }
         get_player().gills.type = param1;
         changes += 1;
         switch(param1)
         {
            case 0:
               if(_loc2_ == 1)
               {
                  outputText("[pg]你的胸口发痒，当你伸手去抓时，你发现你的鳃已经缩回了皮肤里。");
               }
               else
               {
                  outputText("[pg]你感到你的鳃收紧了，裂缝似乎一下子闭合了。当你发出一声窒息的喘息时，你的鳃缩小到虚无，只留下光滑的皮肤。看来你不能在水里待那么久了。");
               }
               outputText("<b>你不再有鳃了！</b>");
               return -1;
            case 1:
               if(_loc2_ == 2 || _loc2_ == 3)
               {
                  outputText("[pg]你感觉到你的鳃收紧了，鳃裂似乎一下子全闭合了。你发出一声窒息般的喘息，鳃萎缩消失，只留下光滑的皮肤。当你以为一切都结束时，你感觉到有什么东西从你的脖子下面冒出来，顺着你的胸膛垂下，拂过你的乳头。你惊讶地看着你新长出的羽状鳃，不久之后上面形成了一层粘液膜。");
               }
               else
               {
                  outputText("[pg]你感觉到食道下部有压迫感，于是拉下衣服检查那个区域。在你的眼前，一对羽状鳃开始从你胸部中央、领口正下方长出，向两侧分开，垂在你的" + get_player().nippleDescript(0) + "上。起初它们暴露在空气中感觉有些不舒服，但很快一层薄薄的粘液膜覆盖了它们，你几乎感觉不到任何异样。你小心翼翼地重新穿好衣服。");
               }
               outputText("[pg]<b>你现在有了羽状鳃！</b>");
               return 1;
            case 2:
               if(_loc2_ == 1)
               {
                  outputText("[pg]你感觉到你的鳃在刺痛，羽状的外表传来一阵模糊的麻木感。你惊奇地看着你鳃上的羽状褶皱干枯，像干脆的秋叶一样脱落。然后，你的鳃裂重新排列，变得更细更短，并转移到你脖子的两侧。它们现在的闭合方式使其几乎隐形。当你用手指划过脖子时，除了几条与皮肤交界处微凸的细线外，你几乎感觉不到什么。");
               }
               else
               {
                  outputText("[pg]你的脖子突然感到一阵刺痛。你伸手去摸，想找到感觉的来源。当你触摸脖子时，你感觉到它开始长出几道狭窄的裂缝，并慢慢变长。变化停止后，你迅速走到附近的水坑，仔细观察你的脖子。你意识到，你的脖子长出了鳃，让你能在水下呼吸，就像站在陆地上一样。");
               }
               outputText("[pg]<b>你现在有了鱼一样的鳃！</b>");
               return 1;
            case 3:
               return 1;
            default:
               get_player().gills.type = _loc2_;
               --changes;
               return 0;
         }
      }
      
      public function tfNoFur(param1:int = 10) : Boolean
      {
         if(get_noFur() && Utils.rand(param1) > 0)
         {
            return false;
         }
         return true;
      }
      
      public function tfChance(param1:int, param2:int) : Boolean
      {
         return Utils.rand(Math.min(param1 + changes,param2)) == 0;
      }
      
      public function restoreRearBody(param1:String) : Boolean
      {
         var _loc2_:Array = param1.split("-");
         param1 = _loc2_[0];
         var _loc3_:Boolean = _loc2_.indexOf("forceRestoreRearBody") != -1;
         switch(get_player().rearBody.type)
         {
            case 1:
            case 2:
               if(param1 == "EmberTFs" || !_loc3_ && get_player().dragonScore() >= 11)
               {
                  return false;
               }
               if(get_player().rearBody.type == 1)
               {
                  outputText("[pg]你感到脊椎上方一阵酥麻。你瞥了一眼背部，看到毛发正从上面掉落。起初是一缕一缕的，然后是一大块一大块的，直到<b>你那多毛的龙族鬃毛完全消失了。</b>");
               }
               else
               {
                  outputText("[pg]你的脊椎开始发出痛苦的咔嚓声，你感觉到有什么东西缩回了你的后背。疼痛停止后不久，你脊椎上方的皮肤愈合了，封闭了曾经长着尖刺的孔洞。<b>你背上的尖刺消失了。</b>");
               }
               break;
            case 3:
               if(param1 == "sharkTooth" || !_loc3_ && get_player().sharkScore() >= 3)
               {
                  return false;
               }
               outputText("一阵紧绷感蔓延过你的背部，感觉就像有人把匕首刺进了你的脊椎。过了一会儿，疼痛消失了，但你的鳍也不见了！");
               break;
            case 4:
               if(param1 == "alraune" || !_loc3_ && get_player().dryadScore() >= 8)
               {
                  return false;
               }
               outputText("[pg]覆盖着你的树皮开始裂开，一阵气流触碰到了下方新露出的[skindesc]。裂缝继续向下延伸，很快树皮就剥落掉下，在你的[feet]周围形成了一堆木屑。");
               break;
            default:
               get_player().rearBody.restore();
               return false;
         }
         if(!_loc3_)
         {
            changes += 1;
         }
         get_player().rearBody.restore();
         return true;
      }
      
      public function restoreNeck(param1:String) : Boolean
      {
         var _loc2_:Array = param1.split("-");
         if(int(_loc2_.length) > 1 && _loc2_[0] != "reptilum")
         {
            param1 = _loc2_[0];
         }
         var _loc3_:Boolean = _loc2_.indexOf("forceRestoreNeck") != -1;
         switch(get_player().neck.type)
         {
            case 1:
               if(param1 == "EmberTFs" || !_loc3_ && get_player().dragonScore() >= 11)
               {
                  return false;
               }
               outputText("[pg]<b>你的龙颈[if (neckPos) {以及它在你头上的位置恢复|恢复}]到了正常的[if (neckPos) {位置和}]长度。</b>");
               break;
            case 2:
               if(param1 == "TonOTrice" || !_loc3_ && get_player().cockatriceScore() >= 7)
               {
                  return false;
               }
               outputText("[pg]你的脖子开始发麻，装饰着你脖子的羽毛开始脱落，直到<b>你只剩下一个正常的脖子！</b>");
               break;
            default:
               get_player().neck.restore();
               return false;
         }
         if(!_loc3_)
         {
            changes += 1;
         }
         get_player().neck.restore();
         return true;
      }
      
      public function restoreLegs(param1:String) : Boolean
      {
         var _loc2_:Boolean = false;
         var _loc3_:Array = param1.split("-");
         param1 = _loc3_[0];
         if(get_player().isTaur())
         {
            outputText("[pg]你的四足后半身突然抽搐，让你惊讶的前半身失去平衡，导致你踉跄着摔倒在地。剧痛传遍全身，将你的身体扭曲成一个紧绷的痛苦之球，肌腱融化，骨骼断裂、融化并重新生长。当这一切终于停止时，<b>你低头看到了你全新的一双人类双腿</b>！");
            _loc2_ = true;
         }
         if(get_player().isGoo())
         {
            outputText("[pg]你的下半身向内收缩，塑造成两条腿的形状，并逐渐变硬。片刻之后，它们凝固成看起来很正常的腿，还长着普通的人类脚丫。<b>你现在拥有了正常的双脚！</b>");
            _loc2_ = true;
         }
         if(get_player().isNaga())
         {
            outputText("[pg]你瘫倒在地，你那蜿蜒的蛇尾撕裂成两半，变成了双腿。剧痛无比，尤其是你新长出的双脚正在成型的地方。<b>你又拥有了人类的双腿。</b>");
            _loc2_ = true;
         }
         if(get_player().isMermaid())
         {
            outputText("[pg]你瘫倒在地，你那美人鱼的尾巴撕裂成两半，变成了双腿。剧痛无比，尤其是你新长出的双脚正在成型的地方。<b>你又拥有了人类的双腿。</b>");
            _loc2_ = true;
         }
         if(param1 != "sweetGossamer" && get_player().isDrider())
         {
            outputText("[pg]你的双腿一软，摔倒在地，腹部重重地砸在地上。虽然你失去了身体的控制，也无法看到身后，但你依然能感觉到甲壳松动并从身体上脱落的恶心感，以及干燥的微风吹过你暴露的神经。出于本能，你的腿紧紧贴在一起，尽可能保护它们现在变得敏感的表面。当你试图分开它们时，你发现你做不到。几分钟难熬的时间过去了，直到你再次能够弯曲双腿，当你这么做时，你发现身体一侧的腿全都连在一起弯曲了。");
            outputText("<b>你又拥有了人类的双腿。</b>");
            _loc2_ = true;
         }
         if(param1 == "regularHummus" && get_player().isBiped() && get_player().lowerBody.type != 0)
         {
            outputText("[pg]随着你的双腿扭曲变形，你瘫倒在地。当疼痛消退时，你注意到你拥有了正常的双腿和正常的双脚。<b>你现在拥有了正常的双脚！</b>");
            _loc2_ = true;
         }
         if(_loc2_)
         {
            get_player().lowerBody.type = 0;
            get_player().lowerBody.legCount = 2;
            changes += 1;
            return true;
         }
         return false;
      }
      
      public function restoreArms(param1:String) : int
      {
         var _loc3_:Boolean = false;
         var _loc2_:String = "";
         if(param1 == "gooGasmic")
         {
            _loc3_ = get_player().arms.claws.type != 0;
            _loc2_ = "\n\n";
            if(get_player().arms.type == 1)
            {
               _loc2_ += "你手臂上的羽毛融化回你现在史莱姆般的皮肤中。";
               if(_loc3_)
               {
                  _loc2_ += " 此外，你现在史莱姆般的爪子也融化回了你的手指中。";
               }
            }
            else if(_loc3_)
            {
               _loc2_ += "你那史莱姆般的爪子现在融化回了手指。";
            }
            if(_loc3_)
            {
               _loc2_ += " 算了，谁在乎呢，史莱姆爪子在战斗中本来就没什么用。";
            }
            if(_loc3_ || get_player().arms.type == 1)
            {
               outputText(_loc2_ + " <b>你又拥有了正常的人类手臂。</b>");
            }
            get_player().arms.restore();
            return 1;
         }
         if(changes < changeLimit && get_player().arms.type != 0)
         {
            if([1,2,5,13,14].indexOf(get_player().arms.type) >= 0)
            {
               _loc2_ += "\n\n你心不在焉地抓着二头肌，但无论你怎么抓，都无法消除那种瘙痒感。";
            }
            switch(get_player().arms.type)
            {
               case 1:
                  _loc2_ += " 你烦躁地低头看去，发现你长满羽毛的手臂正在脱落羽毛。你手臂曾经那翅膀般的形状眨眼间就消失了，只剩下[skinfurscales]。";
                  break;
               case 2:
                  _loc2_ += " 你烦躁地低头看去，发现手臂上的甲壳正在剥落。那层亮黑色的外壳很快就消失了，露出了底下的[skinfurscales]。";
                  break;
               case 4:
                  switch(get_player().skin.type)
                  {
                     case 0:
                     case 1:
                     case 2:
                        _loc2_ += "\n\n你感到[claws]突然一阵酥麻，然后你意识到，它们又变回了正常的人类指甲。";
                        break;
                     case 3:
                        if(get_player().arms.claws.type != 0)
                        {
                           _loc2_ += "\n\n你那黏糊糊的爪子融化成了手指。管他呢，反正史莱姆爪子在战斗中本来就没什么用。";
                        }
                  }
                  break;
               case 5:
               case 13:
               case 14:
                  _loc2_ += " 你烦躁地低头看去，发现曾经长满鳞片的手臂正在蜕鳞，你的爪子也变回了正常的人类指甲。";
                  break;
               default:
                  _loc2_ += "\n\n你那异于常人的手臂不断变化，直到变成正常的人类手臂，只留下[skinfurscales]。";
            }
            outputText(_loc2_ + " <b>你又拥有了正常的人类手臂。</b>");
            get_player().arms.restore();
            changes += 1;
            return 1;
         }
         return 0;
      }
      
      public function removeWings(param1:String, param2:Boolean = true) : Boolean
      {
         var _loc3_:Boolean = false;
         if(param2 && get_player().rearBody.type == 3)
         {
            outputText("[pg]一阵紧绷感蔓延过你的背部，感觉就像有人把匕首刺进了你的脊椎。<b>片刻之后疼痛消退了，但你的背鳍不见了！</b>");
            get_player().rearBody.restore();
            _loc3_ = true;
         }
         if(get_player().wings.type != 0)
         {
            outputText("[pg]一阵紧绷感蔓延过你的背部，感觉就像有人把匕首刺进了你的两块肩胛骨。<b>片刻之后疼痛消退了，但你的翅膀不见了！</b>");
            get_player().wings.restore();
            _loc3_ = true;
         }
         if(_loc3_)
         {
            changes += 1;
         }
         return _loc3_;
      }
      
      public function removeScales() : void
      {
         outputText("[pg]你的鳞片开始发痒，成片地脱落，[b:露出了下面光滑的[skintone]肌肤]。");
         get_player().skin.setType(0);
         get_player().underBody.restore();
         ++changes;
      }
      
      public function removeFur() : void
      {
         outputText("[pg]你的皮肤突然感到发痒，你的毛发开始成块地脱落，[b:露出了下面光滑的皮肤]。");
         get_player().skin.setType(0);
         get_player().underBody.restore();
         ++changes;
      }
      
      public function removeFeatheryHair() : Boolean
      {
         if(changes < changeLimit && get_player().hair.type == 1 && Utils.rand(4) == 0)
         {
            if(get_player().hair.length >= 6)
            {
               outputText("[pg]你的一缕柔软的羽发垂在眼睛上。还没等你把这碍事的绒毛吹走，你就发现羽毛正在向内萎缩。它继续向内卷曲，直到只剩下一根普通的头发。<b>你的头发不再是羽毛状的了！</b>");
            }
            else
            {
               outputText("[pg]你一边等待着刚刚吃下的物品生效，一边用手指梳理着柔软的羽发。当你的手放在上面时，你察觉到羽毛的质感发生了变化。它们正在完全消失，融合成了普通的头发。<b>你的头发不再是羽毛状了！</b>");
            }
            get_player().hair.type = 0;
            changes += 1;
            return true;
         }
         return false;
      }
      
      public function removeExtraBreastRow(param1:String) : void
      {
         if(int(get_player().breastRows.length) <= 1)
         {
            return;
         }
         outputText("[pg]当你的重心发生偏移时，你向后踉跄了一下，虽然你在摔倒之前调整了过来，但你只能敬畏地看着你最下面的[lastbreasts]缩小，完全消失在你的[if (breastrows >= 3) {腹部|胸部}]。甚至[lastnipples]也消退了，直到只剩下[if (isFluffy) {[furColor][skinDesc]|[skinTone][skinDesc]}]。<b>你失去了一排乳房！</b>");
         if(param1 != "regularHummus")
         {
            dynStats(DynStat.Sens(-5));
         }
         get_player().removeBreastRow(int(get_player().breastRows.length) - 1,1);
         changes += 1;
      }
      
      public function removeBlackNipples(param1:String) : Boolean
      {
         if(!get_player().hasStatusEffect(StatusEffects.BlackNipples))
         {
            return false;
         }
         outputText("[pg]有什么看不见的东西拂过你的[nipple]，让你抽搐了一下。解开衣服，你看了看你的胸部，发现你的乳头已经变回了自然的肉色。");
         get_player().removeStatusEffect(StatusEffects.BlackNipples);
         changes += 1;
         return true;
      }
      
      public function removeBassyHair() : Boolean
      {
         if([7,6].indexOf(get_player().hair.type) == -1)
         {
            return false;
         }
         if(get_player().hair.type == 7)
         {
            if(get_player().hair.length >= 5)
            {
               outputText("[pg]你的一缕羽毛状冠毛垂在眼睛上。还没等你把这碍事的绒毛吹走，你就发现羽毛正在向内萎缩。它不断向内卷曲，直到最后只剩下一根普通的头发。");
            }
            else
            {
               outputText("[pg]你一边等待着刚刚吃下的物品生效，一边用手指梳理着你那羽毛般的冠羽。当你的手放在那里时，你察觉到羽毛的质感发生了变化。它们正在完全消失，融合成了普通的头发。");
            }
            outputText("[pg]<b>你的头发不再是羽毛状的了！</b>");
         }
         else
         {
            outputText("[pg]你感到头皮一阵刺痛。你伸手去摸你的蛇怪棘刺，想弄清楚发生了什么。当你的手碰到一根棘刺时，它松动并掉落在你面前。一根接一根，其他的棘刺也掉了下来，直到曾经装饰你头部的所有棘刺现在都散落在你周围，让你变成了一个光头。");
            outputText("[pg]<b>你意识到，你将再次长出正常的人类头发！</b>");
            FlagDict_Impl_.arrayWriteInt(KFLAGS.flags,66,0);
            get_player().hair.length = 0;
         }
         get_player().hair.type = 0;
         changes += 1;
         return true;
      }
      
      public function removeAntennae(param1:Boolean = false) : Boolean
      {
         var _loc2_:int = 0;
         if(get_player().antennae.type == 0)
         {
            return false;
         }
         if(param1)
         {
            _loc2_ = get_player().antennae.type;
            outputText("触角脱落，轻飘飘地落向地面。");
         }
         else
         {
            switch(get_player().antennae.type)
            {
               case 2:
                  outputText("[pg]你的[hair]很痒，所以你抓了抓，结果你的触角掉到了地上。真是松了一口气。");
                  outputText("\n<b>你失去了触角！</b>");
                  break;
               case 3:
                  outputText("[pg]你感觉到你那像羽毛一样的触角从根部干瘪，随着毛孔闭合，这对柔软的羽毛轻轻地落到了地上。");
                  outputText("\n<b>你失去了像羽毛一样的触角！</b>");
                  break;
               default:
                  outputText("[pg]你眉头的肌肉紧紧绷起，感觉额头上半部承受着巨大的压力。当压力消退后，你摸了摸自己，发现<b>你的触角消失了</b>！");
            }
         }
         get_player().antennae.type = 0;
         changes += 1;
         return true;
      }
      
      public function newLizardSkinTone() : Array
      {
         return lizardSkinToneChoices.choose();
      }
      
      public function newCockatriceColors() : Array
      {
         var _loc1_:Array = ColorLists.COCKATRICE;
         return _loc1_[Utils.rand(int(_loc1_.length))];
      }
      
      public function lizardHairChange(param1:String) : int
      {
         var _loc4_:* = null as String;
         var _loc2_:int = int(get_player().findKeyItem("Feathery hair-pin"));
         var _loc3_:String = param1;
         if(_loc3_ != "PlayerEvents-benoitHairPin")
         {
            if(_loc3_ != "reptilum-basilisk")
            {
               if(_loc3_ != "reptilum-dracolisk")
               {
                  if(_loc3_ != "reptilum-dragonewt")
                  {
                     if(_loc3_ != "reptilum-lizan")
                     {
                        return 0;
                     }
                  }
                  if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,66) == 0)
                  {
                     outputText("[pg]你的头皮感到一阵奇怪的刺痛。你惊慌失措地摸向你的[hair]，但谢天谢地，它似乎没有什么变化。");
                     outputText("[pg](<b>你的头发停止了生长。</b>)");
                     changes += 1;
                     FlagDict_Impl_.arrayWriteInt(KFLAGS.flags,66,1);
                     return -1;
                  }
                  return 0;
               }
            }
         }
         if(get_player().hair.type == 7 && get_player().cor < 65)
         {
            return 0;
         }
         if(get_player().isFemaleOrHerm() && get_player().cor < 15 && get_player().featheryHairPinEquipped() && get_player().isBasilisk())
         {
            _loc4_ = get_game().bazaar.benoit.benoitMF(" 你的头发变成了一簇羽毛，就像传说中雌性蛇怪那样！"," 你长出了一簇羽毛，就像雌性蛇怪一样！");
            if(get_player().hair.type == 3)
            {
               outputText("[pg]你那粘稠的头发开始一团团地掉落，最终让你变成了一个光头。");
            }
            outputText("[pg]你的头开始发痒，你伸手去抓，却被那种柔软的触感惊到了。这让你想起了小鸡的绒毛，天鹅绒般柔软，还有点毛茸茸的。你在附近的水坑里看了看自己，倒吸了一口凉气，[if (hairlength <= 0) {在你曾经长头发的地方}]现在长出了红色的羽毛，有些更长更大。这簇松软的羽毛娇俏地立在你的头上，让你想起了女士的羽毛头饰。你很快意识到" + _loc4_);
            if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,66) != 0)
            {
               outputText("[pg]<b>你的头发又长出来了，现在变成了一簇红色的短羽毛。</b>");
            }
            else
            {
               outputText("[pg]<b>你的头发现在变成了一簇红色的短羽毛。</b>");
            }
            FlagDict_Impl_.arrayWriteInt(KFLAGS.flags,66,0);
            get_player().hair.length = 2;
            get_player().hair.color = "red";
            get_player().hair.type = 7;
            get_player().keyItems[_loc2_].value2 = 0;
            changes += 1;
            return 1;
         }
         if(get_player().cor >= 65 && get_player().hair.type != 6 && get_player().hasLizardScales() && get_player().hasReptileFace())
         {
            if(get_player().hair.length > 0 && [3,7].indexOf(get_player().hair.type) == -1)
            {
               outputText("[pg]你的头皮感到紧绷发热，让你忍不住用手穿过你的[hair]，小心翼翼地揉搓着。");
               if(get_player().featheryHairPinEquipped())
               {
                  outputText("[pg]你头发上的发簪变得滚烫，以至于你不得不把它拔下来扔到地上，它在接触地面时发出了嘶嘶声。");
               }
               outputText("[pg]令你震惊的是，你的一把[hair]松脱了，露出了下面的[skinFurScales]。你想知道为什么会发生这种事，但意识到这肯定是药水的作用，毕竟蜥蜴通常没有头发。你继续揉搓着头皮，凉爽的空气吹在慢慢露出的皮肤上，让你感到一阵舒适的解脱。这样过了几分钟后，你确信你已经掉光了所有的头发。当你以为一切都结束时，你感到一种不舒服的压力在积聚，你的头皮在变形和改变，你痛苦地做着鬼脸。当这种感觉终于消退时，你冲过去在水坑里照了照自己。在你曾经长头发的地方，现在长着一圈暗淡的爬行动物棘刺！");
            }
            if(get_player().hair.length > 0 && get_player().hair.type == 7)
            {
               outputText("[pg]一阵突如其来的剧痛钻透了你的头骨，你的头皮上形成了一股压力。如果你不知道怎么回事，你还以为自己正在被拔毛呢！");
               if(get_player().featheryHairPinEquipped())
               {
                  outputText("[pg]你头发上的发簪变得滚烫，以至于你不得不把它拔下来扔到地上，它在接触地面时发出了嘶嘶声。");
               }
               outputText("[pg]你捂着头，感觉头上的羽毛进一步向外推，同时变厚。柔软的羽片似乎从羽毛的羽轴上脱落，将它们剥光，红色的绒毛掉落在地板上。很快，羽毛的尖端也跟着脱落，留下了一些看起来相当怪异的棘刺。随着变形似乎结束，你的头隐隐作痛，你走到附近的水坑里看自己的倒影。你曾经华丽的羽冠已经变成了一圈暗淡的棘刺，就像山里那些腐化蛇怪的一样。当你哀悼你失去的羽毛头发时，你注意到你的棘刺随着你的情绪而移动，它们敏感的尖端捕捉着微风，同时降低到更靠近你头骨的位置。");
            }
            if(get_player().hair.type == 3 || get_player().hair.length <= 0)
            {
               if(get_player().hair.type == 3)
               {
                  outputText("[pg]你那粘稠的头发开始一团团地掉落，最终让你变成了一个光头。");
               }
               if(get_player().featheryHairPinEquipped())
               {
                  outputText("[pg]你头发上的发簪变得滚烫，以至于你不得不把它拔下来扔到地上，它在接触地面时发出了嘶嘶声。");
               }
               outputText("[pg]你的头皮感到一阵紧绷，仿佛皮肤在移动和变形。你抱住头，发出一声呻吟，祈祷疼痛能快点消退。压力不断积聚，你的头感觉都要裂开了。当这种感觉渐渐消退时，你还在纳闷刚才到底发生了什么，于是你跑到附近的一个水坑旁照了照自己。");
            }
            get_player().hair.color = get_player().skin.tone;
            get_player().hair.type = 6;
            get_player().hair.length = 2;
            FlagDict_Impl_.arrayWriteInt(KFLAGS.flags,66,1);
            changes += 1;
            outputText("[pg]<b>在你原本长头发的地方，现在长出了一圈暗淡的爬行动物棘刺！</b>");
            if(get_player().featheryHairPinEquipped())
            {
               outputText("[pg]你把发簪放进了物品栏，因为你再也戴不了它了。");
            }
            else if(_loc2_ >= 0)
            {
               outputText("[pg]当你适应新的[hair]时，你的思绪飘到了发簪上。在你如此堕落的时候，你可能无法戴上它了。");
            }
            if(_loc2_ >= 0)
            {
               get_player().keyItems[_loc2_].value1 = 0;
               get_player().keyItems[_loc2_].value2 = 0;
            }
            if(param1 == "PlayerEvents-benoitHairPin")
            {
               outputText("\n");
            }
            return 1;
         }
         return 0;
      }
      
      public function initTransformation(param1:Array = undefined, param2:int = 1, param3:int = 1) : void
      {
         var _loc4_:int = 0;
         var _loc5_:int = 0;
         var _loc6_:int = 0;
         changes = 0;
         changeLimit = param2;
         if(get_player().hasPerk(PerkLib.HistoryAlchemist))
         {
            changeLimit += 1;
         }
         if(get_player().isTFResistant())
         {
            --changeLimit;
         }
         if(get_player().hasPerk(PerkLib.LoliliciousBody))
         {
            --changeLimit;
         }
         if(param1 is Array && int(param1.length) > 0 && !get_player().hasPerk(PerkLib.LoliliciousBody))
         {
            _loc4_ = 0;
            while(_loc4_ < int(param1.length))
            {
               _loc5_ = int(param1[_loc4_]);
               _loc4_++;
               _loc6_ = _loc5_;
               if(Utils.rand(_loc6_) == 0)
               {
                  changeLimit += 1;
               }
            }
         }
         if(changeLimit < param3)
         {
            changeLimit = param3;
         }
         if(get_player().hasPerk(PerkLib.LoliliciousBody) && Utils.rand(4) > 0)
         {
            changeLimit = 0;
         }
      }
      
      public function growDemonCock(param1:Number) : void
      {
         var _loc3_:* = null as Array;
         var _loc4_:int = 0;
         var _loc5_:int = 0;
         var _loc2_:int = 0;
         while(param1 > 0)
         {
            get_player().createCock();
            _loc3_ = get_player().cocks;
            _loc4_ = int(get_player().cocks.length) - 1;
            _loc5_ = Utils.rand(3);
            _loc3_[_loc4_].cockLength = _loc5_ + 4;
            get_player().cocks[int(get_player().cocks.length) - 1].cockThickness = 0.75;
            param1--;
            _loc2_++;
         }
         outputText("[pg]你浑身发抖，胯部的压力不断积聚，当一个巨大的凸起开始从你的身体里挤出来时，这种压力达到了痛苦的顶峰。");
         if(_loc2_ == 1)
         {
            outputText("皮肤似乎向后翻折，一根完全成型的恶魔肉棒从你的下体破茧而出，在高潮时将滚烫的精液喷洒得到处都是。过了一会儿，它褪成了更正常的颜色和类似人类的质感。");
         }
         else
         {
            outputText("皮肤淫秽地隆起，变暗并在你" + Utils.num2Text(_loc2_) + "根新肉棒周围裂开。有一瞬间，它们变成了恶魔般的紫色，并在剧烈的痉挛中滴下滚烫的恶魔精液。之后，它们恢复了更接近人类的颜色。");
         }
         if(_loc2_ > 4)
         {
            outputText("你那娇嫩的一簇新肉棒感觉异常敏感，你忍不住用双手握住那光滑的恶魔肉棒群并抚慰它们。[pg]将近一个小时后，你终于将沾满体液的身体从你留在地上的水坑中抽离。当你回头看时，你注意到它已经被饥渴的大地吞噬了。");
         }
         get_player().orgasm("Dick");
      }
      
      public function gainSnakeTongue() : Boolean
      {
         if(get_player().tongue.type != 1 && changes < changeLimit)
         {
            if(get_player().tongue.type == 0)
            {
               outputText("[pg]你的味蕾开始疼痛，肿胀到令人不适的大小。你试图弄明白到底是什么引起了这种反应，你把手举到嘴边，感觉舌头似乎想从嘴唇里挤出来。");
               outputText("疼痛停止了，你伸出舌头，想看看是什么让它有这种感觉。你一伸出舌头就意识到它比以前伸得更长了，而且现在末端似乎分叉了，形成了一个叉状的尖端。");
               outputText("<b>有了蛇一样的舌头，空气中的气味对你来说更加明显了。</b>");
            }
            else
            {
               outputText("[pg]你那非人的舌头变短了，在喉咙最深处紧绷起来。");
               outputText("过了一会儿，缩成一团的舌肉开始变平，然后向前延伸。");
               outputText("当变化结束时，<b>你的舌头变成了一条长长的分叉蛇信。</b>");
            }
            get_player().tongue.type = 1;
            dynStats(DynStat.Sens(5));
            changes += 1;
            return true;
         }
         return false;
      }
      
      public function gainLizardTongue() : Boolean
      {
         if(get_player().tongue.type != 5)
         {
            outputText("[pg]你的舌头变得麻木，随着舌头滑稽地耷拉下来，你惊讶的叫声变成了一阵咕噜声。");
            switch(get_player().tongue.type)
            {
               case 1:
                  outputText("\n慢慢地，你的舌头肿胀起来，变得和你的拇指一样粗，同时保持着相当的柔韧性。你流着口水，舌头从嘴里耷拉出来，慢慢开始重新控制这个分叉的器官。然而，当你把舌头缩回时，你震惊地发现它比以前长得多，现在足足有一英尺长。");
                  break;
               case 2:
                  outputText("\n你的舌头慢慢缩小，这根粗壮的器官虽然变小了许多，但依然保持着灵活性。你只能忍受着那种奇怪的刺痛感，直到你的舌头最终定型在一英尺长。刺痛感还在继续，你的舌尖开始变形，变成了明显的分叉状。当你检查你的舌头时，你慢慢恢复了控制，把它缩回嘴里，分叉的舌尖能尝到你以前尝不到的味道。");
                  break;
               case 3:
                  outputText("\n你的舌头迅速缩小，这根粗壮的器官虽然变小了许多，但依然保持着灵活性。你只能忍受着那种奇怪的刺痛感，直到你的舌头最终定型在一英尺长。刺痛感还在继续，你的舌尖开始变形，变成了明显的分叉状。当你检查你的舌头时，你慢慢恢复了控制，把它缩回嘴里，分叉的舌尖能尝到你以前尝不到的味道。");
                  break;
               case 4:
                  outputText("\n你的舌头慢慢肿胀，变粗到大约有你拇指那么粗，同时保持着长度。舌尖的刺痛让你皱起眉头，它变形变成了明显的分叉状。当你检查你的舌头时，你慢慢恢复了控制，把它缩回嘴里，分叉的舌尖能尝到你以前尝不到的味道。");
                  break;
               default:
                  outputText("\n你的舌头慢慢肿胀，变粗到大约有你拇指那么粗，填满了你的嘴，让你语无伦次。随后它开始变长，一直长到垂出你的嘴外，定型在1英尺长。舌尖的刺痛让你皱起眉头，它变形变成了明显的分叉状。当你检查你的舌头时，你慢慢恢复了控制，把它缩回嘴里，分叉的舌尖能尝到你以前尝不到的味道。");
            }
            outputText("[pg]<b>你现在有了一条蜥蜴舌头！</b>");
            get_player().tongue.type = 5;
            dynStats(DynStat.Sens(5));
            changes += 1;
         }
         return false;
      }
      
      public function gainDraconicHorns(param1:String) : void
      {
         var _loc3_:* = null as String;
         var _loc2_:Array = param1.split("-");
         if(_loc2_[0] == "EmberTFs")
         {
            _loc3_ = "dragon";
         }
         else
         {
            if(!(_loc2_[0] == "reptilum" && int(_loc2_.length) > 1))
            {
               throw new Error("未实现的 tfSource：\'" + param1 + "\' 用于 gainDraconicHorns！");
            }
            _loc3_ = _loc2_[1];
         }
         if(get_player().horns.type != 3 && get_player().horns.type != 4)
         {
            if(get_player().horns.value > 0)
            {
               if(get_player().horns.type == 1 && get_player().horns.value > 4)
               {
                  outputText("[pg]你的角凝结在一起，相互缠绕并融合成更大、更尖锐的突起。当它们停止变化时，你长出了四根看起来像龙的角，每根大约有十二英寸长。");
                  get_player().horns.value = 12;
                  get_player().horns.type = 4;
               }
               else
               {
                  outputText("[pg]你感觉到你的角在变化和扭曲，你向后伸手去摸它们。它们有轻微的弧度，并逐渐变细。它们看起来一定很像你们村庄传说中龙的角。");
                  get_player().horns.type = 3;
                  if(get_player().horns.value > 13)
                  {
                     outputText("这种变化似乎使角缩小了，它们现在大约有一英尺长。");
                     get_player().horns.value = 12;
                  }
               }
               changes += 1;
            }
            else
            {
               outputText("[pg]伴随着痛苦的压力，你额头两侧的皮肤裂开，长出两个小小的结节状的角。它们向后倾斜，看起来就像你在村庄传说中看到的龙的角。几英寸长的角从你的头上长出来，然后停止生长。<b>你现在有大约四英寸长的龙角。</b>");
               get_player().horns.value = 4;
               get_player().horns.type = 3;
               changes += 1;
            }
         }
         else if(get_player().horns.type == 3)
         {
            if(get_player().horns.value < 12)
            {
               if(Utils.rand(3) == 0)
               {
                  outputText("[pg]当一英寸长的新角从你剧痛的头骨中钻出时，你感到一阵头痛。");
                  var _temp_1:* = get_player().horns;
                  _temp_1.value = _temp_1.value + 1;
               }
               else
               {
                  outputText("[pg]当你的角长长了几英寸时，你的头很痛。它们的根部变得更粗了，让你看起来很吓人。");
                  var _temp_2:* = get_player().horns;
                  _temp_2.value = _temp_2.value + (3 + Utils.rand(3));
               }
               if(get_player().horns.value >= 12)
               {
                  outputText("<b>你的角很快就稳定下来了，似乎已经长到了最大尺寸。</b>");
               }
               changes += 1;
            }
            else
            {
               outputText("[pg]在第一排角的下方，第二排角破皮而出。虽然它们更窄，但在停止生长前，它们长得几乎和第一排一样长。一种最终定型的感觉笼罩着你。<b>你的角数量已经达到了一个" + _loc3_ + "所能长出的极限。</b>");
               get_player().horns.type = 4;
               changes += 1;
            }
         }
      }
      
      public function demonChanges(param1:String) : void
      {
         if(get_player().tail.type != 3 && get_player().horns.value > 0)
         {
            if(get_player().tail.type != 0)
            {
               outputText("[pg]");
               if(get_player().tail.type == 5 || get_player().tail.type == 6)
               {
                  outputText("你感到昆虫般的腹部一阵刺痛，它开始拉伸、变窄，外骨骼剥落，变成了一条灵活的恶魔尾巴，末端还带着一个圆形的铲状尖端。");
               }
               else
               {
                  outputText("你感到尾巴一阵刺痛。你惊讶地发现它变成了一条灵活的恶魔尾巴，末端还带着一个圆形的铲状尖端。");
               }
               outputText("<b>你的尾巴现在看起来像恶魔的尾巴了。</b>");
            }
            else
            {
               outputText("[pg]你的臀部传来一阵剧痛……越来越明显。伴随着一声巨大的撕裂声，压力突然消失了。<b>你意识到你现在长出了一条恶魔尾巴</b>……末端还带着一个可爱的小铲子形状。");
            }
            dynStats(DynStat.Cor(4));
            get_player().tail.type = 3;
            changes += 1;
         }
         if(get_player().horns.value == 0 || Utils.rand(get_player().horns.value + 3) == 0)
         {
            if(get_player().horns.value < 12 && (get_player().horns.type == 0 || get_player().horns.type == 1))
            {
               outputText("[pg]");
               if(get_player().horns.value == 0)
               {
                  outputText("一对小巧的恶魔角从你的额头上长了出来。它们看起来其实还挺可爱的。<b>你长角了！</b>");
               }
               else
               {
                  outputText("另一对恶魔角在第一排后面长了出来，比上一对更大。");
               }
               if(get_player().horns.type == 0)
               {
                  get_player().horns.type = 1;
               }
               var _temp_1:* = get_player().horns;
               _temp_1.value = _temp_1.value + 1;
               var _temp_2:* = get_player().horns;
               _temp_2.value = _temp_2.value + 1;
               dynStats(DynStat.Cor(3));
            }
            else if(get_player().horns.type > 1)
            {
               outputText("[pg]");
               outputText("你的角发生变化，缩小成了两根恶魔般的小角。");
               get_player().horns.value = 2;
               get_player().horns.type = 1;
               dynStats(DynStat.Cor(3));
            }
            changes += 1;
         }
         if(get_player().hasStatusEffect(StatusEffects.BlackNipples) && Utils.rand(3) == 0)
         {
            removeBlackNipples(param1);
         }
         if((get_player().face.type != 0 || !get_player().hasPlainSkin()) && Utils.rand(3) == 0)
         {
            if(get_player().face.type != 0)
            {
               outputText("[pg]");
               outputText("你的脸庞痛苦地扭曲着，恢复成了更接近正常人类的形状，尽管皮肤变得完美无瑕。<b>你的脸又变回人类了！</b>");
               get_player().face.type = 0;
            }
            else if(!get_player().hasPlainSkin())
            {
               if(get_player().hasFur())
               {
                  removeFur();
               }
               if(get_player().hasScales())
               {
                  removeScales();
               }
            }
            changes += 1;
         }
         if(get_player().tongue.type == 1 && Utils.rand(3) == 0)
         {
            outputText("[pg]你蛇一般的舌头感到一阵刺痛，在嘴里不断变厚，直到感觉更像你以前的人类舌头，至少前几英寸是这样。它在你嘴里卷成一团，当你张开嘴释放它时，大约两英尺长的舌头垂了下来。你发现它很容易移动和控制，就像走路一样自然。<b>你现在有了一条长长的恶魔之舌。</b>");
            get_player().tongue.type = 2;
            changes += 1;
         }
         if(get_player().hasPlainSkin() && Utils.rand(4) == 0)
         {
            if(get_player().get_gender() <= 1 || get_player().get_gender() == 3 && get_player().mf("m","f") == "m")
            {
               if(get_player().lowerBody.type != 6)
               {
                  outputText("[pg]");
                  outputText("你臀部以下的每一块肌肉和肌腱都感到刺痛，你开始踉跄。坐下几秒钟后，你的[feet]爆发出剧痛。有什么坚硬的东西从里面刺穿了你的脚底，你的脚趾裂开并残忍地弯曲。疼痛慢慢减轻，你的目光顺着人类的腿看去，发现脚部已经裂变成带有锋利黑色指甲的爪子。当你放松时，你的脚能轻松地抓住地面。<b>你的脚现在变成了恶魔的爪子。</b>");
                  get_player().lowerBody.type = 6;
                  get_player().lowerBody.legCount = 2;
               }
            }
            else if(get_player().lowerBody.type != 5)
            {
               outputText("[pg]");
               outputText("你臀部以下的每一块肌肉和肌腱都感到刺痛，你开始踉跄。坐下几秒钟后，你的[feet]爆发出剧痛。有什么坚硬的东西从里面刺穿了你的脚底。疼痛慢慢减轻，你的目光顺着人类的腿看去，发现脚跟处突出了一根细长锋利的角。当你放松时，你的脚尖朝下，想要恢复以前的姿势需要付出巨大的努力。<b>你的脚现在变成了恶魔的高跟鞋。</b>你试探性地站起来，试着走几步。令你惊讶的是，你感觉自己仿佛生来如此，迈着有力的步伐向前走去，臀部摇曳生姿。");
               get_player().lowerBody.type = 5;
               get_player().lowerBody.legCount = 2;
            }
            changes += 1;
         }
         if((get_player().wings.type != 7 || get_player().rearBody.type == 3) && Utils.rand(8) == 0 && get_player().isCorruptEnough(50))
         {
            if(get_player().wings.type == 6 && get_player().cor >= 75 - get_player().corruptionTolerance())
            {
               outputText("[pg]");
               outputText("你那小巧的恶魔双翼伸展生长着，因附着在如此堕落的身体上而感到一阵愉悦的酥麻。当它们展开时，你越过肩膀去抚摸它们，发现它们变成了完全长成的恶魔双翼。<b>你的恶魔双翼长大了！</b>");
               get_player().wings.type = 7;
            }
            else if(get_player().rearBody.type == 3)
            {
               outputText("[pg]你肩膀周围的肌肉不舒服地紧绷起来，为了支撑从你背上长出的新蝙蝠状翅膀而发生改变。你尽可能地扭过头去查看，发现你的鳍已经变成了小巧的蝙蝠状恶魔双翼！");
               get_player().rearBody.restore();
               get_player().wings.type = 6;
            }
            else if(get_player().wings.type == 0)
            {
               outputText("[pg]");
               outputText("当你的肩膀紧绷时，一阵绞痛在你的肩膀上聚集。伴随着惊人的力量，一对小巧的恶魔双翼从你的背上长出，在你的[armor]背面撕开了两个洞。<b>你现在拥有了微小的恶魔双翼</b>。");
               get_player().wings.type = 6;
            }
            else
            {
               outputText("[pg]");
               outputText("你肩膀周围的肌肉不舒服地隆起，随着你感觉到翅膀重量的增加，肌肉也发生改变以支撑它们。你尽可能地扭过头去查看，发现它们已经变成了");
               if([1,4,5,10,16].indexOf(get_player().wings.type) != -1)
               {
                  outputText("小巧的");
                  get_player().wings.type = 6;
               }
               else
               {
                  outputText("巨大的");
                  get_player().wings.type = 7;
               }
               outputText("<b>蝙蝠般的恶魔之翼！</b>");
            }
            changes += 1;
         }
      }
   }
}

