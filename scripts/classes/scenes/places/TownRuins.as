package classes.scenes.places
{
   import classes.BaseContent;
   import classes.CoC;
   import classes.ImageManager;
   import classes.Player;
   import classes._FlagDict.FlagDict_Impl_;
   import classes.globalFlags.KFLAGS;
   import classes.internals.Utils;
   import classes.internals._OneOf.OneOf_Impl_;
   import classes.scenes.Camp;
   import classes.scenes.api.Encounter;
   import classes.scenes.api.EncounterDef;
   import classes.scenes.api.Encounters;
   import classes.scenes.api._Encounters.EncounterChance_Impl_;
   import classes.scenes.api._Encounters.EncounterOrDef_Impl_;
   import flash.Boot;
   import haxe.IMap;
   import haxe.ds.Either;
   
   public class TownRuins extends BaseContent
   {
      
      public var furnitureFoundToday:String;
      
      public var _explorationEncounter:Encounter;
      
      public function TownRuins()
      {
         if(Boot.skip_constructor)
         {
            return;
         }
         _explorationEncounter = null;
         furnitureFoundToday = "";
         super();
      }
      
      public function totalDismantled() : int
      {
         var _loc1_:int = 0;
         _loc1_ += FlagDict_Impl_.arrayReadInt(KFLAGS.flags,2320);
         if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,2322) >= 4)
         {
            _loc1_++;
         }
         if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,2323) >= 4)
         {
            _loc1_++;
         }
         return _loc1_;
      }
      
      public function scavengeTownRuinsOption() : void
      {
         get_images().showImage("location-townruins");
         if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,2319) == 0)
         {
            outputText("尽管村庄已成废墟，但仍有大量资源可供回收；木材、石头和钉子都在那里等着你搬运。你思考着应该集中精力回收哪座建筑的资源带回营地。");
            FlagDict_Impl_.arrayWriteInt(KFLAGS.flags,2319,1);
         }
         else
         {
            outputText("你再次回到废墟村庄，思考着该回收哪座建筑。");
         }
         if(totalDismantled() < 12)
         {
            outputText("[pg]");
            if(totalDismantled() < 8)
            {
               outputText("这里有烧毁的房屋、砸碎的门道、掀翻的屋顶……到处都覆盖着灰尘和污垢。");
               if(totalDismantled() >= 1)
               {
                  outputText(Utils.Num2Text(totalDismantled()) + "座建筑" + (totalDismantled() == 1 ? "已被" : "已被") + "完全拆除，只剩下" + (totalDismantled() == 1 ? "地基" : "地基") + "。");
               }
            }
            else
            {
               outputText("大部分废墟房屋已经消失，只留下地基。");
               if(totalDismantled() >= 10)
               {
                  outputText("用不了多久，这座废墟村庄就会完全没有建筑了。");
               }
            }
            menu();
            if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,2320) < 10)
            {
               addButton(0,"房屋 #" + (FlagDict_Impl_.arrayReadInt(KFLAGS.flags,2320) + 1),dismantleHouse);
            }
            else
            {
               addButtonDisabled(0,"房屋","你已经拆除了所有的房屋。");
            }
            if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,2322) < 4)
            {
               addButton(1,"市政厅",dismantleTownHall);
            }
            else
            {
               addButtonDisabled(1,"市政厅","那座建筑已经不复存在了。它被拆得只剩下地基。");
            }
            if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,2323) < 4)
            {
               addButton(2,"商店",dismantleShop);
            }
            else
            {
               addButtonDisabled(2,"商店","那座建筑已经不复存在了。它被拆得只剩下地基。");
            }
            setExitButton();
         }
         else
         {
            doNext(get_camp().returnToCampUseOneHour);
         }
      }
      
      public function rackCount() : int
      {
         var _loc1_:int = 0;
         if(get_player().hasKeyItem("Equipment Rack - Armor"))
         {
            _loc1_++;
         }
         if(get_player().hasKeyItem("Equipment Rack - Weapons"))
         {
            _loc1_++;
         }
         if(get_player().hasKeyItem("Equipment Rack - Shields"))
         {
            _loc1_++;
         }
         return _loc1_;
      }
      
      public function isDiscovered() : Boolean
      {
         return FlagDict_Impl_.arrayReadInt(KFLAGS.flags,44) > 0;
      }
      
      public function get_explorationEncounter() : Encounter
      {
         var _gthis:TownRuins = this;
         if(_explorationEncounter != null)
         {
            return _explorationEncounter;
         }
         _explorationEncounter = Encounters.group("townruins",EncounterOrDef_Impl_.fromDef(new EncounterDef("shouldra",EncounterChance_Impl_.fromFloatConst(0.5),EncounterChance_Impl_.fromBoolFun(function():Boolean
         {
            if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,365) == 0 && _gthis.rackCount() >= 2 && !_gthis.get_game().shouldraFollower.followerShouldra())
            {
               return FlagDict_Impl_.arrayReadFloat(KFLAGS.flags,513) != 0.5;
            }
            return false;
         }),OneOf_Impl_.fromA(get_game().shouldraScene.shouldraGreeting),null)),EncounterOrDef_Impl_.fromDef(new EncounterDef("rack",EncounterChance_Impl_.fromFloatConst(0.2),EncounterChance_Impl_.fromBoolFun(function():Boolean
         {
            return _gthis.rackCount() < 3;
         }),OneOf_Impl_.fromA(findRack),null)),EncounterOrDef_Impl_.fromDef(new EncounterDef("amily",null,EncounterChance_Impl_.fromBoolFun(function():Boolean
         {
            return FlagDict_Impl_.arrayReadInt(KFLAGS.flags,36) != 1;
         }),OneOf_Impl_.fromA(get_game().amilyScene.encounterAmily),null)),EncounterOrDef_Impl_.fromDef(new EncounterDef("scavenge",null,EncounterChance_Impl_.fromBoolFun(function():Boolean
         {
            if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,36) == 1)
            {
               return _gthis.totalDismantled() < 12;
            }
            return false;
         }),OneOf_Impl_.fromA(scavengeTownRuinsOption),null)));
         return _explorationEncounter;
      }
      
      public function findRack() : void
      {
         var _loc1_:Array = [];
         if(!get_player().hasKeyItem("Equipment Rack - Armor"))
         {
            _loc1_[int(_loc1_.length)] = 0;
         }
         if(!get_player().hasKeyItem("Equipment Rack - Weapons"))
         {
            _loc1_[int(_loc1_.length)] = 1;
         }
         if(!get_player().hasKeyItem("Equipment Rack - Shields"))
         {
            _loc1_[int(_loc1_.length)] = 2;
         }
         var _loc2_:Number = int(_loc1_[Utils.rand(int(_loc1_.length))]);
         get_images().showImage("item-rack");
         outputText("在这个破旧村庄的废弃房屋和建筑中翻找时，你设法找到了一些有用的东西！这里有一个完好但空着的");
         var _loc3_:Number = _loc2_;
         if(_loc3_ == 0)
         {
            outputText("护甲");
         }
         else if(_loc3_ == 1)
         {
            outputText("武器");
         }
         else if(_loc3_ == 2)
         {
            outputText("盾牌");
         }
         else
         {
            outputText("未定义");
         }
         outputText("架。看起来它可以容纳九种不同的");
         _loc3_ = _loc2_;
         if(_loc3_ == 0)
         {
            outputText("护甲");
         }
         else if(_loc3_ == 1)
         {
            outputText("武器");
         }
         else if(_loc3_ == 2)
         {
            outputText("盾牌");
         }
         else
         {
            outputText("未定义");
         }
         outputText("。你仔细检查了一番，发现它可以轻松折叠起来方便携带。这玩意儿放在营地里倒是不错，于是你把它打包好搬了回去。");
         _loc3_ = _loc2_;
         if(_loc3_ == 0)
         {
            get_player().createKeyItem("Equipment Rack - Armor",0,0,0,0);
         }
         else if(_loc3_ == 1)
         {
            get_player().createKeyItem("Equipment Rack - Weapons",0,0,0,0);
         }
         else if(_loc3_ == 2)
         {
            get_player().createKeyItem("Equipment Rack - Shields",0,0,0,0);
         }
         else
         {
            outputText("<b>请将此bug告知Kitteh6660。</b>");
         }
         doNext(get_camp().returnToCampUseOneHour);
      }
      
      public function findFurniture(param1:String = undefined) : void
      {
         if(param1 == null)
         {
            param1 = "house";
         }
         if(furnitureFoundToday != "")
         {
            return;
         }
         var _loc2_:Array = [];
         if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,2006) == 0 && param1 == "house")
         {
            _loc2_[int(_loc2_.length)] = 0;
         }
         if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,2007) == 0 && param1 == "house")
         {
            _loc2_[int(_loc2_.length)] = 1;
         }
         if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,2008) == 0 && param1 == "house")
         {
            _loc2_[int(_loc2_.length)] = 2;
         }
         if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,2009) == 0)
         {
            _loc2_[int(_loc2_.length)] = 3;
         }
         if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,2010) == 0 || FlagDict_Impl_.arrayReadInt(KFLAGS.flags,2011) == 0 || FlagDict_Impl_.arrayReadInt(KFLAGS.flags,2013) != 0)
         {
            _loc2_[int(_loc2_.length)] = 4;
         }
         if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,2014) == 0)
         {
            _loc2_[int(_loc2_.length)] = 5;
         }
         if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,2012) == 0)
         {
            _loc2_[int(_loc2_.length)] = 6;
         }
         var _loc3_:int = int(_loc2_[Utils.rand(int(_loc2_.length))]);
         switch(_loc3_)
         {
            case 0:
               outputText("[pg]在房子里的瓦砾中穿梭，你发现了一张床！想到你终于有除了旧睡袋以外的东西可以躺了，你感到一丝希望，但当你找到真正的床垫时，这丝希望瞬间破灭了。上面覆盖着灰烬和一些白……哦，那是……好吧，你可不想睡在上面，但床架本身似乎还能用，而且没有被污染。");
               outputText("[pg]在小心翼翼地移走恶心的床垫后，床架似乎是由雕刻精美的木头制成的，但耐用性也是一个需要考虑的因素，所以你轻轻踢了它一脚。当床架证明了它的弹性和稳固时，你赞许地点了点头，开始琢磨怎么把这玩意儿拖回营地……");
               furnitureFoundToday = "床";
               FlagDict_Impl_.arrayWriteInt(KFLAGS.flags,2006,1);
               break;
            case 1:
               outputText("[pg]环顾四周，你移开一块碎木头，在下面发现了一个抽屉，这肯定属于某个床头柜；不过，如果没有真正的柜子，这抽屉毫无用处。你把它放在角落里，继续搜寻，直到你找到了另一个！一个柜子配两个抽屉。如果你能找到那个柜子，这东西可能真的能用……在更大的瓦砾堆中筛选，你发现了一个看起来像是一个周围有雕刻图案的空心盒子，也许就是这个？");
               outputText("[pg]你很容易就找到了抽屉并把它们滑了进去；它们完美契合，展示了这件家具精巧的设计，而且拉出来也很顺滑。总的来说，它似乎没有损坏，真是个幸运的发现！现在，怎么把这东西弄回营地呢……");
               furnitureFoundToday = "床头柜";
               FlagDict_Impl_.arrayWriteInt(KFLAGS.flags,2007,1);
               break;
            case 2:
               outputText("环顾四周，你移开一块碎木头，在下面发现了一个宽大的抽屉，这肯定属于某个梳妆台；不过，如果没有真正的梳妆台，这抽屉毫无用处。你把它放在角落里，继续搜寻，直到你找到了另一个！又一个。还有一个。一个梳妆台配四个抽屉。如果你能找到那个柜子，这东西可能真的能用……在更大的瓦砾堆中筛选，你发现了一个看起来像是一个周围有雕刻图案的宽大空心盒子，也许就是这个？");
               outputText("[pg]你很容易就找到了抽屉并把它们滑了进去；它们完美契合，展示了这件家具精巧的设计，而且拉出来也很顺滑。没有丢失任何抽屉。总的来说，它似乎没有损坏，真是个幸运的发现！现在，怎么把这东西弄回营地呢……");
               furnitureFoundToday = "梳妆台";
               FlagDict_Impl_.arrayWriteInt(KFLAGS.flags,2008,1);
               break;
            case 3:
               outputText("[pg]有一张桌子出奇地完好无损。它看起来足够大，可以配两把椅子，但附近并没有看到椅子。你试探性地摇了摇桌子，确认它很稳固，可以使用。");
               furnitureFoundToday = "桌子";
               FlagDict_Impl_.arrayWriteInt(KFLAGS.flags,2009,1);
               break;
            case 4:
               outputText("[pg]你在房屋的废墟中发现了一把倒在地上的椅子；它是用木头精雕细琢而成的，看起来并没有受到太大的损坏。你试探性地坐上去测试它的稳定性。椅子经受住了考验，似乎在岁月的磨损中保持了它的坚固。");
               furnitureFoundToday = "椅子";
               if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,2011) > 0)
               {
                  FlagDict_Impl_.arrayWriteInt(KFLAGS.flags,2013,1);
               }
               else if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,2010) > 0)
               {
                  FlagDict_Impl_.arrayWriteInt(KFLAGS.flags,2011,1);
               }
               else
               {
                  FlagDict_Impl_.arrayWriteInt(KFLAGS.flags,2010,1);
               }
               break;
            case 5:
               outputText("[pg]从墙上移开一些碎片时，有什么东西倒了下来，差点把你压在下面！你在它倒下之前设法后退了一步，看到那是一个书架。它似乎出奇地完好无损，尽管里面放着的几本书就没那么幸运了，除了其中一本，其余的都被火烧焦了。带着好奇心，你拿起并打开它，翻阅着那些……沾满恶魔精液的书页。难道就没有什么神圣的东西了吗？你把书架拉起来，粗暴地把里面的东西抖出来，让它们散落一地，与房间里已经堆满的碎片混在一起。你把书架搬到外面，仔细看了看。它是手工雕刻的，由耐用的木材制成，正如你刚才粗暴的动作所证明的那样。");
               outputText("[pg]现在你回想起来，你营地里总是需要一个书架的……");
               furnitureFoundToday = "书架";
               FlagDict_Impl_.arrayWriteInt(KFLAGS.flags,2014,1);
               break;
            case 6:
               outputText("[pg]当你在搬动一块特别大的碎片时，你注意到它实际上是一张桌子，而且是一张相当不错的桌子！快速检查了一下，它看起来雕刻精美，由坚固的木材制成，在某些地方敲了几下也证实了这一点。这张桌子状况仍然很好，可以在你的营地里使用，现在的问题是如何把它弄回去……");
               furnitureFoundToday = "办公桌";
               FlagDict_Impl_.arrayWriteInt(KFLAGS.flags,2012,1);
               break;
            default:
               outputText("[pg]你继续彻底搜查，但尽管如此，你还是没有找到任何有用的东西。");
               furnitureFoundToday = "null";
         }
         if(furnitureFoundToday != "null")
         {
            outputText("[pg]");
            if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,2004) >= 10)
            {
               outputText("这将是你小屋的一个很棒的补充。");
            }
            outputText("你把" + furnitureFoundToday + "拖到" + Utils.cnName(param1) + "外面，把它放在视线范围内，但远离" + Utils.cnName(param1) + "。你准备在完成这里的工作后，就把它拖回营地。");
         }
      }
      
      public function exploreVillageRuin() : void
      {
         var _loc1_:IMap = KFLAGS.flags;
         FlagDict_Impl_.arrayWriteInt(_loc1_,2076,FlagDict_Impl_.arrayReadInt(_loc1_,2076) + 1);
         clearOutput();
         get_explorationEncounter().execEncounter();
      }
      
      public function exploreAmilyVillage() : void
      {
         clearOutput();
         get_images().showImage("location-townruins");
         outputText("你顺着杂草丛生的小路向内陆走去，远离湖岸。你穿过茂密的树林，努力不迷失方向，最后终于到达了明显的尽头。在你面前是摇摇欲坠的墙壁，被风雨……以及其他力量完全破坏和吹散。在它们后面是被撕裂、烧毁或倒塌的房屋。这显然曾经是一个村庄，但在过去的某个时候被摧毁了。恶魔袭击是你脑海中闪过的第一个可能性。你检查了一会儿废墟，然后决定返回营地。你觉得在没有准备的情况下在这里调查是不明智的。[pg]");
         outputText("(<b>\"城镇废墟\"已添加到地点菜单。</b>)");
         FlagDict_Impl_.arrayWriteInt(KFLAGS.flags,44,1);
         doNext(get_camp().returnToCampUseOneHour);
      }
      
      public function dontExploreAmilyVillage() : void
      {
         clearOutput();
         get_images().showImage("location-townruins-path");
         outputText("站起身，你转身离开。从小路的状况来看，你推测另一端的村庄要么陷入了困境，要么被废弃了，要么被恶魔占领了。换句话说，对于像你这样的旅行者来说，那里不是什么安全的地方。[pg]");
         doNext(get_camp().returnToCampUseOneHour);
      }
      
      public function dismantleTownHall() : void
      {
         clearOutput();
         get_images().showImage("location-townruins-townhall");
         outputText("曾经可能是市政厅的遗迹吸引了你的目光。在所有被破坏的建筑中，这是最大的一座，也是最有可能产出有用东西的一座。你走进市政厅，检查是否有可以带走的可用家具。");
         if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,2325) == 0 && FlagDict_Impl_.arrayReadInt(KFLAGS.flags,2322) == 0)
         {
            findFurniture("town hall");
         }
         dismantleMainText(2322,"市政厅");
      }
      
      public function dismantleShop() : void
      {
         clearOutput();
         get_images().showImage("location-townruins-shop");
         outputText("你的目光被一家曾经是商店的建筑吸引，从它被破坏的招牌来看。谁知道里面会有什么？你走进去，检查是否有任何有用的东西可以带走。");
         if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,2325) == 0 && FlagDict_Impl_.arrayReadInt(KFLAGS.flags,2322) == 0)
         {
            findFurniture("shop");
         }
         dismantleMainText(2323,"商店");
      }
      
      public function dismantleMainText(param1:int, param2:String = undefined) : void
      {
         var _loc7_:* = null as IMap;
         if(param2 == null)
         {
            param2 = "";
         }
         var _loc3_:int = 0;
         var _loc4_:int = 0;
         var _loc5_:int = 0;
         var _loc6_:Array = [];
         outputText("[pg]");
         if(!get_player().hasKeyItem("Carpenter\'s Toolbox"))
         {
            outputText("你环顾四周，检查着空荡荡的房子。你也许可以通过拆除屋顶和墙壁来获得一些资源，但你要怎么拆除它们呢？用你的拳头吗？一个工具箱肯定会有帮助……");
            doNext(get_camp().returnToCampUseOneHour);
            return;
         }
         if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,param1) == 0)
         {
            outputText("在检查完家具后，你放下工具箱，打开它，拿出一个工具带系在腰上。然后你装上必要的工具。当然，安全第一！你戴上护目镜和安全帽。是时候开始搜刮一些有用的资源了。");
            outputText("[pg]你也许应该从屋顶开始，然后从那里往下拆。从外观上看，它是由钉在一起的木制框架组成的。屋顶可能曾经有一些茅草来挡雨。但无论是什么，肯定都已经烧毁了，只留下光秃秃的木制框架。你必须够到上面才能开始工作。");
            if(!(get_player().isTaur() || get_player().canFly()))
            {
               if(get_player().hasKeyItem("Ladder"))
               {
                  outputText("[pg]你把你之前建造的梯子搬过来，靠在墙上，试探性地摇晃了一下，确认梯子可以安全攀爬。");
               }
               else
               {
                  outputText("[pg]你收集了一些看起来足够长、足够厚的松散木块，并将其中一块长木块切成等份，用作梯级。接下来，你组装两块长木块，并排列较小的木块，使用卷尺确保梯级之间的间距均匀。");
                  if(get_player().keyItemv1("Carpenter\'s Toolbox") >= 24)
                  {
                     outputText("你从工具带里拿出一些钉子，把它们钉到位。");
                     get_player().addKeyValue("Carpenter\'s Toolbox",1,-24);
                  }
                  else
                  {
                     outputText("你意识到钉子不够了，但你凑合着捡起一些松散的钉子，这些钉子肯定是某个被毁坏的部分掉下来的。一旦你找到了足够数量的可用钉子，你就把它们钉到位。");
                  }
                  outputText("[pg]为了确保梯子稳固，你锯掉了长木条断裂的两端，使其平整，然后将一块平整的木板贴在两根长木条的末端。接着，你拿出一把金属L型直角尺，检查两边是否完全对齐，并做了必要的调整。梯子组装好后，你把它靠在墙上，试着摇晃了一下测试稳定性，并调整了角度。嗯，这梯子爬上去应该很安全。");
                  outputText("<b>获得关键物品：梯子！</b>");
                  get_player().changeFatigue(50);
                  get_player().createKeyItem("Ladder",0,0,0,0);
               }
               outputText("你爬上梯子，抓住了屋顶。");
            }
            else if(get_player().canFly())
            {
               outputText("[pg]当你拥有可以飞翔的翅膀时，没有什么遥不可及！你拍打翅膀飞离地面，降落在屋顶上。");
            }
            else if(get_player().isTaur() || get_player().isDrider())
            {
               outputText("[pg]拥有动物的下半身在这里给了你优势。你直起身子，增加了触及范围，并将前[feet]平贴在墙上以保持稳定。");
            }
            outputText("现在屋顶已经触手可及，你决定先从锯开木头开始。你从工具带里拿出一把锯子，开始锯掉木制屋顶框架，将断裂的和还能用的木块分门别类堆放。成功拆除并分解屋顶后，你将仍然钉在一起的木块分开，小心翼翼地拔出钉子。其中很大一部分状况良好，可以在你未来的建筑项目中重复使用，所以你把它们放进了工具箱的钉子格里。你把能用的木头捆成一堆，最后把它们");
            if(furnitureFoundToday != "")
            {
               outputText("，连同今天新发现的" + furnitureFoundToday + "");
            }
            outputText("拖回你的营地。");
            _loc3_ = int(10 + Utils.rand(20) + Math.floor(Utils.rand((get_player().get_str() + get_player().get_inte()) / 4)));
            _loc4_ = int(10 + Utils.rand(10) + Math.floor(Utils.rand((get_player().get_str() + get_player().get_inte()) / 8)));
         }
         else if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,param1) == 1)
         {
            outputText("既然屋顶已经被拆除，你就可以安全地拆卸内墙了。你从工具带里拿出一把锤子和凿子，将凿子抵在其中一面墙上，敲击手柄，使灰泥碎裂剥落。灰泥剥落后，你敲击暴露出来的部分，它便坍塌了，扬起一阵碎灰泥和灰尘。等灰尘散去，你凿掉墙壁剩余的部分并将其推倒。接下来，你把木龙骨从地板上拔起来，整齐地放在地上。你对剩余的内墙重复这个过程。内墙拆除后，你在成堆的瓦砾中仔细搜寻完好的石砖。这个过程花了你整整一个小时。[pg]");
            outputText("你捡起石砖，把它们整齐地堆放在托盘上，和木块绑在一起，最后把这些新搜集到的资源拖回家。");
            _loc4_ = int(10 + Utils.rand(10) + Math.floor(Utils.rand((get_player().get_str() + get_player().get_inte()) / 8)));
            _loc5_ = int(5 + Utils.rand(5) + Math.floor(Utils.rand((get_player().get_str() + get_player().get_inte()) / 20)));
         }
         else if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,param1) == 2)
         {
            outputText("随着建筑内部被掏空，屋顶被拆除，你可以开始拆卸框架了。拿出锤子和凿子，你开始凿掉将石墙粘合在一起的砂浆，每一次敲击都在慢慢削弱结构的强度。当你走到尽头时，你回头看了看自己的进度，墙边地板上堆满了碎裂的砂浆。最后看了一眼，你站进空心结构内部，向外推墙，让它轰然倒塌，撞击地面时碎裂成由石头和残留砂浆组成的瓦砾。对其他几面墙重复这个过程，你可以清楚地看到从周围石头中解放出来的木龙骨；这花了你" + (get_player().get_str() < 80 ? "很大的" : "一点") + "力气，但你还是设法把它们从地上拔了出来，整齐地堆放好，准备拖回营地。");
            get_player().changeFatigue(Math.max(10,40 - Math.floor(get_player().get_str() / 5)));
            _loc4_ = int(10 + Utils.rand(10) + Math.floor(Utils.rand((get_player().get_str() + get_player().get_inte()) / 8)));
            _loc5_ = int(5 + Utils.rand(5) + Math.floor(Utils.rand((get_player().get_str() + get_player().get_inte()) / 20)));
         }
         else if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,param1) == 3)
         {
            outputText("随着" + param2 + "现在变成了一堆瓦砾，你可以集中精力寻找任何有用的东西。石砖的状况还不错，即使经历了这么多破坏，它们仍然可以回收用于你的建筑项目。你拿出凿子，用锤子敲击它，凿掉剩余的砂浆。这不需要花很大力气，因为砖块很容易就散落成可用的碎块。你把石砖整齐地堆放在托盘上；这个过程花了你大半个小时。你把砖块绑在一起固定好，最后看了一眼曾经是" + param2 + "的地方，现在已经被完全拆除到只剩地基。你离开这块荒芜的土地，把那堆石砖拖回营地。");
            _loc5_ = int(5 + Utils.rand(5) + Math.floor(Utils.rand((get_player().get_str() + get_player().get_inte()) / 12)));
         }
         get_player().addKeyValue("Carpenter\'s Toolbox",1,_loc3_);
         _loc7_ = KFLAGS.flags;
         FlagDict_Impl_.arrayWriteInt(_loc7_,2005,FlagDict_Impl_.arrayReadInt(_loc7_,2005) + _loc4_);
         _loc7_ = KFLAGS.flags;
         FlagDict_Impl_.arrayWriteInt(_loc7_,2267,FlagDict_Impl_.arrayReadInt(_loc7_,2267) + _loc5_);
         if(_loc3_ > 0)
         {
            _loc6_.push("" + _loc3_ + (_loc3_ == 1 ? " 钉子" : " 钉子"));
         }
         if(_loc4_ > 0)
         {
            _loc6_.push(_loc4_ + " 木材");
         }
         if(_loc5_ > 0)
         {
            _loc6_.push("" + _loc5_ + (_loc5_ == 1 ? " 石头" : " 石头"));
         }
         if(_loc3_ + _loc4_ + _loc5_ > 0)
         {
            outputText("[pg]<b>你搜集到了" + Utils.formatStringArray(_loc6_) + "！</b>");
         }
         var _loc8_:int = param1;
         _loc7_ = KFLAGS.flags;
         FlagDict_Impl_.arrayWriteInt(_loc7_,_loc8_,FlagDict_Impl_.arrayReadInt(_loc7_,_loc8_) + 1);
         if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,param1) == 4)
         {
            outputText("[pg]<b>你专注于拆除" + param2 + "并收集材料，它已经被彻底拆除，只剩地基还在。</b>");
         }
         if(param1 == 2321 && FlagDict_Impl_.arrayReadInt(KFLAGS.flags,2320) < 10 && FlagDict_Impl_.arrayReadInt(KFLAGS.flags,param1) >= 4)
         {
            FlagDict_Impl_.arrayWriteInt(KFLAGS.flags,param1,0);
            _loc7_ = KFLAGS.flags;
            FlagDict_Impl_.arrayWriteInt(_loc7_,2320,FlagDict_Impl_.arrayReadInt(_loc7_,2320) + 1);
            FlagDict_Impl_.arrayWriteInt(KFLAGS.flags,2324,0);
         }
         furnitureFoundToday = "";
         doNext(get_camp().returnToCampUseOneHour);
      }
      
      public function dismantleHouse() : void
      {
         clearOutput();
         get_images().showImage("location-townruins-house");
         outputText("一栋房子似乎是个不错的开始。你走到其中一栋废墟房屋前，走进去检查是否有可以带走的可用家具。");
         if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,2324) == 0 && FlagDict_Impl_.arrayReadInt(KFLAGS.flags,2321) == 0 && Utils.rand(100) < 80)
         {
            findFurniture("house");
         }
         dismantleMainText(2321,"房子");
      }
      
      public function discoverAmilyVillage() : void
      {
         clearOutput();
         get_images().showImage("location-townruins-path");
         outputText("当你在湖岸边漫步时，你发现你的脚步声回荡着，就好像你踩在木头上，而不是踩在岸边泥泞的沙地里。出于好奇，你蹲下来拨开泥土，露出了一块腐烂的木板。仔细观察脚下的地面，你意识到这是一条小路的一部分——那种村庄为了方便进出泥泞的河流、湖泊和海滩而修建的小路。你相信你能清楚地辨认出小路的其余部分，并顺着它走到尽头。[pg]");
         outputText("你要顺着小路走吗？");
         doYesNo(exploreAmilyVillage,dontExploreAmilyVillage);
      }
   }
}

