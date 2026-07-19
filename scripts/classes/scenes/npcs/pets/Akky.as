package classes.scenes.npcs.pets
{
   import classes.CoC;
   import classes.DebugMenu;
   import classes.ItemType;
   import classes.Player;
   import classes.SelfDebug;
   import classes.Time;
   import classes.TimeAwareInterface;
   import classes._FlagDict.FlagDict_Impl_;
   import classes.display.SpriteDb;
   import classes.globalFlags.KFLAGS;
   import classes.internals.Utils;
   import classes.items.Consumable;
   import classes.items.ConsumableLib;
   import classes.items.UseableLib;
   import classes.saves.SelfSaver;
   import classes.saves.SelfSaving;
   import classes.scenes.Camp;
   import classes.scenes.npcs.AmilyScene;
   import classes.scenes.npcs.HolliScene;
   import classes.scenes.npcs.IzmaScene;
   import classes.scenes.npcs.MarbleScene;
   import classes.scenes.npcs.Rathazul;
   import classes.scenes.npcs.pets._Akky.SaveContent;
   import coc.view.CoCButton;
   import flash.Boot;
   import haxe.IMap;
   import haxe.ds.StringMap;
   
   public class Akky extends AbstractPet implements TimeAwareInterface, SelfDebug, SelfSaving
   {
      
      public var saveVersion:int;
      
      public var saveName:String;
      
      public var saveContent:SaveContent;
      
      public var globalSave:Boolean;
      
      public function Akky()
      {
         if(Boot.skip_constructor)
         {
            return;
         }
         globalSave = false;
         saveVersion = 1;
         saveName = "akky";
         saveContent = new SaveContent(null,null);
         super();
         CoC.timeAwareClassAdd(this);
         var _loc1_:IMap = new StringMap();
         var _loc2_:PetLocation = new PetLocation(["[akky]发出一声开心的喵叫来迎接你。或者也可能是饿了的喵叫，很难说。"],["营地"],"在营地");
         if("营地" in StringMap.reserved)
         {
            _loc1_.setReserved("营地",_loc2_);
         }
         else
         {
            _loc1_.h["营地"] = _loc2_;
         }
         statics = _loc1_;
         SelfSaver.register(this);
         DebugMenu.register(this);
      }
      
      public function timeChangeLarge() : Boolean
      {
         return false;
      }
      
      public function timeChange() : Boolean
      {
         var _loc1_:* = null as Array;
         var _loc2_:* = null as Array;
         var _loc3_:* = null as Array;
         actionSeen = -1;
         if(isOwned())
         {
            _loc1_ = ["营地","溪流"];
            if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,2003) >= 1)
            {
               _loc1_.push("小屋");
            }
            if(jojoFollower())
            {
               _loc1_.push("乔乔");
            }
            if(get_rathazul().followerRathazul())
            {
               _loc1_.push("拉萨祖尔");
            }
            if(get_marbleScene().marbleAtCamp())
            {
               _loc1_.push("玛布尔");
            }
            if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,8) >= 1)
            {
               _loc1_.push("玛布尔的孩子们");
            }
            if(get_izmaScene().totalIzmaChildren() >= 1)
            {
               _loc1_.push("鲨鱼之子");
            }
            if(get_amilyScene().amilyFollowerPure() && FlagDict_Impl_.arrayReadInt(KFLAGS.flags,78) == 0)
            {
               _loc1_.push("艾米莉");
            }
            if(get_holliScene().holliFollower())
            {
               _loc1_.push("霍莉");
            }
            _loc2_ = _loc1_;
            location = _loc2_[Utils.rand(int(_loc2_.length))];
            if((get_time().hours >= 20 || get_time().hours <= 8) && _loc1_.indexOf("小屋") >= 0)
            {
               if(Utils.rand(3) > 0)
               {
                  location = "小屋";
               }
            }
            else if(Utils.rand(2) > 0)
            {
               _loc3_ = ["营地","溪流"];
               location = _loc3_[Utils.rand(int(_loc3_.length))];
            }
            buildDescs();
         }
         else
         {
            location = "营地";
         }
         return false;
      }
      
      public function talkingToCats(param1:Function) : void
      {
         var returnFunc1:Function;
         var _g:Akky;
         clearOutput();
         spriteSelect(SpriteDb.get_s_akky());
         var _loc2_:Array = [0,1,2,3,4,5,6,7,8];
         if(followerShouldra() && Utils.randomChance(50))
         {
            _loc2_.push(9);
         }
         if(get_player().hair.length >= 16)
         {
            _loc2_.push(10);
         }
         if(get_player().get_race().indexOf("cat-") >= 0 || get_player().get_race().indexOf("kitten-") >= 0)
         {
            _loc2_.push(11);
         }
         if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,16) > 0)
         {
            _loc2_.push(12);
         }
         if(get_silly())
         {
            _loc2_.push(13);
         }
         var _loc3_:Array = _loc2_;
         switch(int(_loc3_[Utils.rand(int(_loc3_.length))]))
         {
            case 0:
               outputText("你花了几分钟讨论玛瑞斯的政治。[Akky]伸了个懒腰，躺了下来，静静地享受着你的关注。");
               break;
            case 1:
               outputText("你把[akky]叫到跟前；他坐下来对你喵喵叫。你也对他喵喵叫。");
               break;
            case 2:
               outputText("为了培养一只更有教养的宠物，你向[akky]解释基础算术。他津津有味地看着你用手指比划数字，很快就被好奇心驱使，试图抓住你的手。");
               outputText("[pg][Akky]舔了舔你的手指。");
               break;
            case 3:
               outputText("喵，你说。");
               outputText("[pg][say:喵，]他说道。");
               break;
            case 4:
               outputText("你主导了这次谈话，滔滔不绝地讲述着你对这个世界的渊博知识。很少有人经历过你那样规模的冒险，而你可以就那些发生已久的无数事件喋喋不休地说上很久。");
               outputText("[pg][Akky]开始清理自己来打发时间。现在没人懂得欣赏好故事了。");
               break;
            case 5:
               outputText("你告诉[akky]你一个小时前在做什么。");
               outputText("[pg]他看起来并不惊讶。");
               break;
            case 6:
               outputText("你问[akky]作为一只猫感觉如何，他伸了个懒腰，然后舔了舔自己。");
               outputText("[pg]他看起来很满足。");
               break;
            case 7:
               outputText("[Akky]似乎无话可说。");
               break;
            case 8:
               outputText("他可能太[i:pussy]了，自从你打败他之后就不敢跟你说话。");
               if(followerShouldra())
               {
                  outputText("[pg]一阵模糊的窃笑声在你脑海深处回荡。");
               }
               break;
            case 9:
               outputText("[akky]今天在想些什么呢？");
               outputText("[pg][say: 给我点鸡巴！]猫娘喊道，说话时眼睛闪烁着黄色的光芒。");
               outputText("[pg]该死的，舒尔德拉。");
               outputText("[pg]\'[akky]\'对你挑了挑眉。[say:嘿，你才是那个在和猫说话的人，勇者。]");
               break;
            case 10:
               outputText("你俯下身，问这只小猫娘在想什么。他的眼睛睁大，瞳孔扩张，然后紧张地盯着你。");
               outputText("[pg]他挥爪抓向你垂下来的[haircolor][hairshort]。");
               break;
            case 11:
               outputText("你对[akky]说，咱们这种人应该互相照应。他凝视着你，缓缓闭上眼睛，打了个哈欠。你发现自己也做了同样的举动。");
               break;
            case 12:
               outputText("现在他没法操你的屁股了，对吧？");
               outputText("[pg][Akky] 摆出一副扑击的姿态。你仍然不认为他能做到，但你的 [asshole] 还是不由自主地收缩了一下。");
               break;
            case 13:
               outputText("怎么了，小猫咪？");
               outputText("[pg][say: 呜哦哦哦哦——][akky]打了个哈欠。真是个新奇的哈欠。");
         }
         menu();
         _g = this;
         returnFunc1 = param1;
         addButton(0,"下一步",function():void
         {
            _g.petMenu(returnFunc1);
         });
      }
      
      override public function set_name(param1:String) : String
      {
         FlagDict_Impl_.arrayWriteString(KFLAGS.flags,2718,param1);
         return param1;
      }
      
      public function saveToObject() : Object
      {
         return saveContent;
      }
      
      public function reset() : void
      {
         saveContent.giftedBear = false;
         saveContent.harpiesHarassed = false;
      }
      
      override public function petMenu(param1:Function, param2:Boolean = false) : void
      {
         var returnFunc3:Function;
         var _g2:Akky;
         var returnFunc2:Function;
         var food:ItemType;
         var _g1:Akky;
         var returnFunc1:Function;
         var _g:Akky;
         var _loc6_:* = null as Consumable;
         if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,741) > 0 && !saveContent.harpiesHarassed && Utils.rand(10) == 0)
         {
            akkyPlaysWithBirds();
            return;
         }
         var _loc3_:Array = [get_consumables().FISHFIL];
         var _loc4_:ItemType = null;
         var _loc5_:int = 0;
         while(_loc5_ < int(_loc3_.length))
         {
            _loc6_ = _loc3_[_loc5_];
            _loc5_++;
            if(get_player().hasItem(_loc6_))
            {
               _loc4_ = _loc6_;
               break;
            }
         }
         clearOutput();
         spriteSelect(SpriteDb.get_s_akky());
         outputText("[akky]是一只中大型家猫，体型相对匀称。他的毛很短，呈黄褐色，上面布满了许多像美洲豹一样的黑斑。[akky]的眼睛是漂亮的绿色，你偶尔会想，在他扑击之前，你是否能看到它们在闪烁。");
         outputText("[pg]你想对[akky]做什么？");
         menu();
         _g = this;
         returnFunc1 = param1;
         addButton(0,"抚摸",function():void
         {
            _g.petAkky(returnFunc1);
         }).hint("抚摸他的毛发。");
         _g1 = this;
         food = _loc4_;
         returnFunc2 = param1;
         addButton(1,"喂养",function():void
         {
            _g1.feedAkky(food,returnFunc2);
         }).hint("他一定饿坏了。").disableIf(_loc4_ == null,"你没有任何食物可喂。或许他会喜欢吃鱼？");
         _g2 = this;
         returnFunc3 = param1;
         addButton(2,"交谈",function():void
         {
            _g2.talkingToCats(returnFunc3);
         }).hint("和他聊聊，看看他怎么样了。");
         if(get_silly() && !saveContent.giftedBear)
         {
            addNextButton("赠送泰迪熊",giftAkkyBear).hint("给他一份非常特别的礼物。").disableIf(!get_player().hasItem(get_useables().TELBEAR),"你没有泰迪熊。");
         }
         addButton(14,"返回",param1);
      }
      
      public function petAkky(param1:Function) : void
      {
         var returnFunc1:Function;
         var _g:Akky;
         clearOutput();
         spriteSelect(SpriteDb.get_s_akky());
         var _loc2_:Array = ["你抚摸着[akky]，享受着他发出的轻柔呼噜声。身边有这么可爱的一个小家伙真好。","你抚摸着[akky]细软的绒毛，小猫娘翻了个身，让你揉他的肚子。","当你向他伸出手时，[Akky] 主动把头凑到你手里，在你抓挠和抚摸他时发出响亮的呼噜声。","这只小猫娘一碰到你的手就立刻咬了一口！不过，随着你继续抚摸他，他很快又舔了你几下。","你轻轻拍了拍这只猫娘的头。[Akky] 用脸蹭着你的手掌，想要你多摸摸。","[Akky] 在你抚摸他时慢慢闭上了眼睛，大声打着呼噜来表达他的愉悦。"];
         outputText(_loc2_[Utils.rand(int(_loc2_.length))]);
         menu();
         _g = this;
         returnFunc1 = param1;
         addButton(0,"下一步",function():void
         {
            _g.petMenu(returnFunc1);
         });
      }
      
      public function onAscend(param1:Boolean) : void
      {
         reset();
      }
      
      public function load(param1:int, param2:*) : void
      {
         Utils.extend(saveContent,param2);
      }
      
      override public function isOwned() : Boolean
      {
         return FlagDict_Impl_.arrayReadString(KFLAGS.flags,2718) != "";
      }
      
      public function giftAkkyBear() : void
      {
         clearOutput();
         spriteSelect(SpriteDb.get_s_akky());
         outputText("你想对这个小家伙表达一点爱意，于是你送给[akky]一只毛绒玩具熊。虽然他过去可能给你惹了不少麻烦，但现在看着他可爱的样子，你对你的宠物只有满满的爱。你温柔地把玩具放在离[akky]几步远的地上，向它比划着，希望他能接受你的礼物。");
         outputText("[pg]这只猫娘盯着玩具熊看了好一会儿，眼睛眨都不眨。他明白你礼物的含义吗？你的心意真的传达给他了吗？空气中的紧张气氛让你屏住了呼吸，但你觉得你从他的眼神中看到了一丝微弱的理解，那是你们两人之间的某种联系。他真的能回应你的感情吗？是的，是的，你看到了，绝对有，他的眼睛闪烁着感激的光芒。");
         outputText("[pg]可怜的玩具熊只得到了一个轻微的摇晃屁股的预警，随后一只凶猛的掠食者就扑向了它，猫科动物优雅的身姿在空中划出一道弧线，直到它撞上无辜的目标。[Akky]撕咬着你饱含心意的礼物，他的牙齿深深地咬进它柔软的脖子，爪子挖出了一只眼睛。绒毛很快就铺满了周围，让这里看起来像是一场可怕的大屠杀现场。");
         outputText("[pg]你再也看不下去了。");
         saveContent.giftedBear = true;
         get_player().consumeItem(get_useables().TELBEAR);
         doNext(get_camp().returnToCampUseOneHour);
      }
      
      override public function get_name() : String
      {
         return FlagDict_Impl_.arrayReadString(KFLAGS.flags,2718);
      }
      
      public function get_debugName() : String
      {
         return "阿基";
      }
      
      public function get_debugHint() : String
      {
         return "";
      }
      
      public function feedAkky(param1:ItemType, param2:Function) : void
      {
         var returnFunc1:Function;
         var _g:Akky;
         clearOutput();
         spriteSelect(SpriteDb.get_s_akky());
         outputText("你从[inv]里拿出鱼，没过多久这只猫娘就注意到了。[akky] 精神一振，睁大眼睛，跑过来迎向你的手。他跳了起来，试图抓住你的手腕。");
         outputText("[pg]猫娘非常有兴趣地嗅了嗅鱼，立刻舔了上去，同时愉快地发出咕噜声。那温暖和振动让你放松下来。你松开手，[akky]随即将鱼按在地上，开始撕咬起来。在他斑驳的毛皮几番动作之后，你重新站起身。");
         get_player().consumeItem(param1);
         menu();
         _g = this;
         returnFunc1 = param2;
         addButton(0,"下一步",function():void
         {
            _g.petMenu(returnFunc1);
         });
      }
      
      public function debugMenu(param1:Boolean = true) : void
      {
         get_game().debugMenu.debugCompEdit(saveContent,new SaveContent(null,null));
      }
      
      public function buildDescs() : void
      {
         var _loc1_:IMap = new StringMap();
         var _loc2_:PetLocation = new PetLocation(["[akky]死死盯着拉萨祖尔，身体还在……发抖？突然，[akky]向炼金术士扑了过去，打断了他的实验。你猜，这大概是猫鼠天敌的本能吧。还好他现在已经不是美洲豹了。"],["拉萨祖尔"],"");
         if("拉萨祖尔" in StringMap.reserved)
         {
            _loc1_.setReserved("拉萨祖尔",_loc2_);
         }
         else
         {
            _loc1_.h["拉萨祖尔"] = _loc2_;
         }
         actions = _loc1_;
         var _loc3_:IMap = new StringMap();
         _loc2_ = new PetLocation(["你看到[akky]在溪流里开心地玩耍，炫耀着他高超的游泳技巧。对于一只家猫来说，这可不寻常，也许这是他作为美洲豹时留下的习惯？","[akky]蜷缩在溪流中间的一块大石头上睡觉。","你发现[akky]在溪流岸边伸展着身体，睡得很香。","[akky]坐在溪流旁，锐利的目光锁定在水边游动的一条鱼上。"],["溪流","营地"],"在溪流附近");
         if("溪流" in StringMap.reserved)
         {
            _loc3_.setReserved("溪流",_loc2_);
         }
         else
         {
            _loc3_.h["溪流"] = _loc2_;
         }
         _loc2_ = new PetLocation(["[akky]慵懒地在窗边伸展着身体。","[akky]好奇地在你的东西里翻找着。","[akky]在这里，死死盯着墙上一个不起眼的地方。无论你观察他多久，他都没有移开视线。"],["小屋"],"在小屋里");
         if("小屋" in StringMap.reserved)
         {
            _loc3_.setReserved("小屋",_loc2_);
         }
         else
         {
            _loc3_.h["小屋"] = _loc2_;
         }
         _loc2_ = new PetLocation([""],[""],"和乔乔一起");
         if("乔乔" in StringMap.reserved)
         {
            _loc3_.setReserved("乔乔",_loc2_);
         }
         else
         {
            _loc3_.h["乔乔"] = _loc2_;
         }
         _loc2_ = new PetLocation(["拉萨祖尔正警惕地注视着附近的[akky]。"],["拉萨祖尔"],"和拉萨祖尔在一起");
         if("拉萨祖尔" in StringMap.reserved)
         {
            _loc3_.setReserved("拉萨祖尔",_loc2_);
         }
         else
         {
            _loc3_.h["拉萨祖尔"] = _loc2_;
         }
         _loc2_ = new PetLocation(["[akky]在这里依偎着玛布尔。营地里能有这么一个无害又可爱的同伴，她似乎非常高兴。"],["玛布尔"],"和玛布尔一起");
         if("玛布尔" in StringMap.reserved)
         {
            _loc3_.setReserved("玛布尔",_loc2_);
         }
         else
         {
            _loc3_.h["玛布尔"] = _loc2_;
         }
         _loc2_ = new PetLocation(["[akky]正在和你的牛犊子们玩耍。"],["玛布尔"],"和玛布尔的孩子们一起");
         if("玛布尔的孩子们" in StringMap.reserved)
         {
            _loc3_.setReserved("玛布尔的孩子们",_loc2_);
         }
         else
         {
            _loc3_.h["玛布尔的孩子们"] = _loc2_;
         }
         _loc2_ = new PetLocation(["[akky]正在对着你的鲨鱼女儿摆出恐吓的姿势。她似乎玩得很开心，和[akky]一起做着抓挠的动作。"],["伊兹玛"],"和你的鲨鱼孩子们一起");
         if("鲨鱼之子" in StringMap.reserved)
         {
            _loc3_.setReserved("鲨鱼之子",_loc2_);
         }
         else
         {
            _loc3_.h["鲨鱼之子"] = _loc2_;
         }
         _loc2_ = new PetLocation(["[akky]正跟在艾米莉身后，跳起来用头去蹭她的手。看来他很喜欢她。"],["艾米莉"],"与艾米莉");
         if("艾米莉" in StringMap.reserved)
         {
            _loc3_.setReserved("艾米莉",_loc2_);
         }
         else
         {
            _loc3_.h["艾米莉"] = _loc2_;
         }
         _loc2_ = new PetLocation(["霍莉注视着[akky]抓挠她的树皮。她看起来有些不悦，但并没有阻止他。"],["霍莉"],"和霍莉在一起");
         if("霍莉" in StringMap.reserved)
         {
            _loc3_.setReserved("霍莉",_loc2_);
         }
         else
         {
            _loc3_.h["霍莉"] = _loc2_;
         }
         statics = _loc3_;
         _loc2_ = new PetLocation(["[akky]似乎正在传送门温暖的光芒前“日光浴”。","[akky]正莫名其妙地在岩石上跳来跳去，自娱自乐。","[akky]在地上翻来覆去。是在伸懒腰？还是在粗糙的地面上蹭背？你也不确定。"],["营地"],"在营地里");
         if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,2178) >= 20)
         {
            _loc2_.texts.push("[akky]正在墙上走来走去。");
         }
         if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,2008) > 0)
         {
            _loc2_.texts.push("[akky] 从梳妆台后面的藏身之处看着你。");
         }
         if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,2006) > 0)
         {
            _loc2_.texts.push("[akky]霸占了床，他的身体摊开，似乎打算占据尽可能多的空间。");
         }
         if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,2012) > 0)
         {
            _loc2_.texts.push("[akky]蜷缩在桌子上，无忧无虑地睡着。与此同时，桌子上原本的东西散落了一地。");
         }
         var _loc4_:StringMap = statics;
         if("营地" in StringMap.reserved)
         {
            _loc4_.setReserved("营地",_loc2_);
         }
         else
         {
            _loc4_.h["营地"] = _loc2_;
         }
      }
      
      public function akkyPlaysWithBirdsLeave() : void
      {
         clearOutput();
         outputText("你可不想打断这么温馨的童年游戏。你放松地待在原地，看着小鹰身女妖继续欢笑玩耍。[Akky]晚点肯定还在营地附近，所以你只能下次再来找他了。");
         doNext(playerMenu);
      }
      
      public function akkyPlaysWithBirdsJoin() : void
      {
         clearOutput();
         spriteSelect(SpriteDb.get_s_akky());
         outputText("不用说，这看起来是个打发时间的好方法。当你走近时，鹰身女妖大声叫道：[say: [Daddy]！] [Akky]被这突如其来的大喊吓了一跳，向后跳去，弓起了背。[say: 小猫咪喜欢妈妈的羽毛！] 她把“羽毛”的尾音拖得很长，让你忍不住想笑。你告诉女儿你也想和猫玩，她高兴地喊道：[say: 好呀！]");
         outputText("[pg][Akky]再次被噪音惊吓到，但当你坐在女孩旁边时，他开始显得放松了一些。他刚打了一个哈欠，挥舞的羽毛就让他立刻回到了攻击模式！你放松地待在原地，看着小鹰身女妖继续欢笑玩耍。看到你的孩子如此开心，你感到深深的满足。然而，女孩并不满足于你只在旁边看着。她向你伸出双手，递上了羽毛。");
         outputText("[pg][say: [Daddy]，轮到你了！]她宣布道。劝她不要分享是没有意义的，那可是糟糕的育儿方式！你接过羽毛并向孩子道谢。你把它伸出去，稳稳地停在[akky]上方，等他抓住机会站起来够它。就在他开始咬它的时候，你绕着他的脸转动羽毛，迫使这只猫娘在原地摇摆以跟上节奏。现在小心点，你把它移到他身后更远的地方，然后——他向后摔倒了！你的女儿歇斯底里地笑了起来。");
         outputText("[pg]终于受够了被戏弄，[akky]动身准备离开。你的小女儿就是不接受，她知道他想要这根羽毛，于是她迅速从你手中拿过羽毛，冲向那只猫娘。[say: 不，小猫，对不起！你现在可以拿走它了！]");
         outputText("[pg]你摸了摸女孩的头，揉乱了她羽毛般的头发。这种天生的善良令人感到温暖。看来[akky]现在已经玩够了，所以你也要继续你的一天了。你的女儿在你[walk]开之前拥抱了你。[say: 我爱你，[Daddy]！]");
         doNext(get_camp().returnToCampUseOneHour);
      }
      
      public function akkyPlaysWithBirds() : void
      {
         clearOutput();
         spriteSelect(SpriteDb.get_s_akky());
         outputText("等等，你发誓刚才还看到[akky]了，但现在你真要找他时，却找不到他的踪影了。你将感知能力发挥到极致，在营地里四处张望，寻找那个毛茸茸、黄褐色、带斑点的小家伙。");
         outputText("[pg]你发现他了！[Akky]似乎对索菲的巢穴产生了兴趣，正在玩弄一些散落的羽毛。他到处乱窜，这时你才发现，你的小鹰身女妖女儿正挥舞着其中一根羽毛。这完全吸引了那只猫的注意力，当她把羽毛举高时，他甚至用后腿站了起来。小鸟儿咯咯地笑着，笑容满面，觉得这个游戏太好玩了。");
         saveContent.harpiesHarassed = true;
         menu();
         addNextButton("别管他们",akkyPlaysWithBirdsLeave).hint("你可以暂时不用[akky]。");
         addNextButton("加入",akkyPlaysWithBirdsJoin).hint("和他们一起玩！");
      }
   }
}

