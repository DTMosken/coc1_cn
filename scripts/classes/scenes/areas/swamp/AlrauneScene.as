package classes.scenes.areas.swamp
{
   import classes.BaseContent;
   import classes.CoC;
   import classes.Cock;
   import classes.CockTypesEnum;
   import classes.DebugMenu;
   import classes.DynStat;
   import classes.DynStatOp;
   import classes.ItemType;
   import classes.Output;
   import classes.Player;
   import classes.SelfDebug;
   import classes.Time;
   import classes.TimeAwareInterface;
   import classes.Vagina;
   import classes._FlagDict.FlagDict_Impl_;
   import classes.display.SpriteDb;
   import classes.globalFlags.KFLAGS;
   import classes.internals.Utils;
   import classes.items.Armor;
   import classes.items.ArmorLib;
   import classes.items.ConsumableLib;
   import classes.items.Undergarment;
   import classes.items.UndergarmentLib;
   import classes.items.Weapon;
   import classes.items.WeaponLib;
   import classes.parser._Parser.TagFun_Impl_;
   import classes.saves.SelfSaver;
   import classes.saves.SelfSaving;
   import classes.scenes.Camp;
   import classes.scenes.Inventory;
   import classes.scenes.areas.forest.KitsuneScene;
   import classes.scenes.areas.swamp._AlrauneScene.SaveContent;
   import classes.scenes.combat.Combat;
   import coc.view.CoCButton;
   import flash.Boot;
   
   public class AlrauneScene extends BaseContent implements TimeAwareInterface, SelfDebug, SelfSaving
   {
      
      public var saveVersion:int;
      
      public var saveName:String;
      
      public var saveContent:SaveContent;
      
      public var globalSave:Boolean;
      
      public var RATCLUE:int;
      
      public var ASKEDSH:int;
      
      public var ASKEDRA:int;
      
      public var ASKEDKT:int;
      
      public var ASKEDKH:int;
      
      public var ASKEDJO:int;
      
      public var ASKEDHO:int;
      
      public var ASKEDAR:int;
      
      public var ASKEDAM:int;
      
      public var ASKEDAL:int;
      
      public function AlrauneScene()
      {
         if(Boot.skip_constructor)
         {
            return;
         }
         RATCLUE = 512;
         ASKEDHO = 256;
         ASKEDSH = 128;
         ASKEDRA = 64;
         ASKEDKT = 32;
         ASKEDKH = 16;
         ASKEDJO = 8;
         ASKEDAR = 4;
         ASKEDAM = 2;
         ASKEDAL = 1;
         globalSave = false;
         saveVersion = 1;
         saveName = "alraune";
         saveContent = new SaveContent(null,null,null,null,null,null);
         super();
         SelfSaver.register(this);
         DebugMenu.register(this);
         CoC.timeAwareClassAdd(this);
      }
      
      public function timeChangeLarge() : Boolean
      {
         return false;
      }
      
      public function timeChange() : Boolean
      {
         if(get_player().get_armor().get_id() == get_armors().VINARMR.get_id() && (saveContent.questAsked & ASKEDRA) != 0 && get_time().hours == 6)
         {
            _temp_1.vineTimer += 1;
         }
         return false;
      }
      
      public function saveToObject() : Object
      {
         return saveContent;
      }
      
      public function reset() : void
      {
         saveContent.metAlraune = false;
         saveContent.eatenAss = false;
         saveContent.questAsked = 0;
         saveContent.vineTimer = 0;
         saveContent.alrauneKilled = 0;
         saveContent.vinesTaken = false;
      }
      
      public function ratClue() : void
      {
         clearOutput();
         outputText("当你在营地里漫步时，老炼金术士把你叫了过去。");
         outputText("[pg][say: 我想我找到了你正在寻找的疗法，[name]，]他解释道，把你领到他的住处。[say: 为了生存，这些藤蔓必须有它们能够附着的东西。]");
         outputText("[pg]听起来很有逻辑。显然你的[skinshort][skinis]在它可以附着的东西的清单上，所以你希望他能切入正题。");
         outputText("[pg][say: 史莱姆，]拉萨祖尔说道，[say: 如果你有办法将你身体的稠度降低到史莱姆的程度，你也许能够安全地移除藤蔓。]他翻阅了一些他最近整理的关于这个问题的著作。[say: 它可能不是完全的转变，只要达到你出汗分泌这种粘液的程度就足够了，但是我还没有做过任何试验来确定。]");
         outputText("[pg]最坏的情况是，你的新问题将是把你的粘液身体变回肉体，在这个世界里，这并不是一项太艰巨的任务。剩下的就是找到一种让自己变成粘液的方法；你可能已经有了一个主意。");
         _temp_1.questAsked |= RATCLUE;
         doNext(playerMenu);
      }
      
      public function onAscend(param1:Boolean) : void
      {
         reset();
      }
      
      public function load(param1:int, param2:*) : void
      {
         Utils.extend(saveContent,param2);
      }
      
      public function holliSolutionRub() : void
      {
         clearOutput();
         outputText("你费尽心思才弄到它，她也该费尽心思给你涂上。");
         outputText("[pg]霍莉微笑着。[say: 乐意效劳。]");
         outputText("[pg]她向你招手，你走近时把布递给了她。树妖立刻开始用它在你的[skin]上性感地摩擦，在每一寸肌肤上都留下了光滑的光泽。她特别用心地按摩你的[chest]，甚至她没拿布的那只手也开始在你的下半身摸索和抚摸。你叹了口气，享受着这项服务，直到一个念头闪过。");
         outputText("[pg]这到底有什么用？");
         outputText("[pg]你试图说出这个问题，但就在你开口时，藤蔓颤抖着摇晃起来。曾经折磨你的紧绷触须现在轻松地从你闪闪发光的身体上滑落。这件有机的衣服现在失去了宿主，在你的[feet]枯萎死亡。");
         outputText("[pg]你检查了一下自己，确认已经痊愈后，回头看了看霍莉。");
         outputText("[pg]树妖耸耸肩，微笑着。[say: 你痊愈了！]");
         outputText("[pg]出乎意料的简单解决方案。");
         doNext(get_camp().returnToCampUseOneHour);
      }
      
      public function holliSolutionDo() : void
      {
         clearOutput();
         outputText("不需要什么大张旗鼓，你把那块黏糊糊的破布涂满全身，覆盖了你大部分的[skin]。在你几乎全裸的身体上推拉滑动这块黏滑的布，让你非常清楚地意识到那棵树正在偷窥你。");
         outputText("[pg]霍莉一边咬着嘴唇一边揉捏着自己的乳房，发出呻吟，显然很享受眼前的这一幕。正当你怀疑这是否只是为了让她爽而做的无意义举动时，藤蔓颤抖了起来。你好奇地僵在原地，盯着那些一直折磨你的黑曜石束缚，很快它们就轻松地从你身上滑落。这套有机外衣现在失去了宿主，在你的[feet]边萎缩枯死。");
         outputText("[pg]你检查了一下自己，确认已经痊愈后，回头看了看霍莉。");
         outputText("[pg]树妖耸耸肩，微笑着。[say: 你痊愈了！]");
         outputText("[pg]出乎意料的简单解决方案。");
         doNext(get_camp().returnToCampUseOneHour);
      }
      
      public function holliSolution() : void
      {
         var _loc1_:int = 0;
         clearOutput();
         get_player().setArmor(ArmorLib.NOTHING);
         get_armors().VINARMR.reset();
         if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,682) == 1)
         {
            outputText("你拿到了她说的布，现在是时候解决这个问题了。");
            outputText("[pg][say: 哦，]霍莉说道，看到你有些惊讶。[say: 当然！如果你愿意的话，请……把它涂抹在你的身上。]");
            get_player().consumeItem(get_consumables().SLIMYCL,1);
            menu();
            addNextButton("照做",holliSolutionDo).hint("好吧，是时候涂抹了。");
            addNextButton("帮我涂",holliSolutionRub).hint("让霍莉帮你涂抹。");
         }
         else
         {
            outputText("你把那堆杂七杂八的物品带到树前，整齐地摆放在她面前。");
            outputText("[pg][say: 真是个乖[boy]，]她俯视着你说道。[say: 现在，拿起其中一块布，慢慢地在你裸露的[skinshort]上摩擦。]");
            outputText("[pg]你犹豫了一下，怀疑这是否真的有必要，但还是照做了。你拿起一块黏糊糊的布，把它按在你的[chest]上，布料带来的一丝凉意让你打了个寒颤。");
            outputText("[pg]霍莉咬着嘴唇，坏笑起来。[say: <b>全身</b>都要涂抹。]");
            outputText("[pg]你推着那块黏糊糊的破布，在更多的[skinfurscales]上滑动，以这种淫荡的方式展示身体让你感到有些羞耻。霍莉也跟着揉捏起自己的乳房，显然很享受眼前的这一幕。正当你怀疑这是否只是为了让她爽而做的无意义举动时，藤蔓颤抖了起来。你好奇地僵在原地，盯着那些一直折磨你的黑曜石束缚，很快它们就轻松地从你身上滑落。这套有机外衣现在失去了宿主，在你的[feet]边萎缩枯死。");
            outputText("[pg]你现在已经一丝不挂了。");
            outputText("[pg]树妖大笑着，把你带来的所有物品都扔掉了，根本不需要它们。你怒视着她，她回应道，[say: 哎呀，别用那种眼神看我，你这么蠢又不是我的错。]");
            get_player().consumeItem(get_consumables().SLIMYCL,5);
            get_player().consumeItem(get_consumables().SNAKOIL,5);
            get_player().consumeItem(get_consumables().PURHONY,3);
            _loc1_ = 3;
            while(_loc1_ > 0)
            {
               if(get_player().hasItem(get_consumables().M__MILK))
               {
                  get_player().consumeItem(get_consumables().M__MILK);
               }
               else if(get_player().hasItem(get_consumables().IZYMILK))
               {
                  get_player().consumeItem(get_consumables().IZYMILK);
               }
               else if(get_player().hasItem(get_consumables().SUCMILK))
               {
                  get_player().consumeItem(get_consumables().SUCMILK);
               }
               else
               {
                  get_player().consumeItem(get_consumables().P_S_MLK);
               }
               _loc1_--;
            }
            doNext(get_camp().returnToCampUseOneHour);
         }
      }
      
      public function hasEarfuckingTail() : Boolean
      {
         if(get_player().hasPrehensileTail() && !get_player().hasFurryTail())
         {
            return [16,28].indexOf(get_player().tail.type) == -1;
         }
         return false;
      }
      
      public function get_debugName() : String
      {
         return "Alraune";
      }
      
      public function get_debugHint() : String
      {
         return "";
      }
      
      public function getVines(param1:Object = undefined) : void
      {
         var _loc6_:* = null as ItemType;
         if(param1 == null)
         {
            param1 = get_camp().returnToCampUseOneHour;
         }
         saveContent.vinesTaken = true;
         if(get_player().get_upperGarment() == get_undergarments().SEA_SHIRT)
         {
            get_player().setUndergarment(UndergarmentLib.NOTHING,0);
         }
         var _loc2_:Array = [get_player().setArmor(get_armors().VINARMR),get_player().setUndergarment(UndergarmentLib.NOTHING,1),get_player().setUndergarment(UndergarmentLib.NOTHING,0)];
         var _loc3_:Array = [];
         var _loc4_:int = 0;
         var _loc5_:Array = _loc2_;
         while(_loc4_ < int(_loc5_.length))
         {
            _loc6_ = _loc5_[_loc4_];
            _loc4_++;
            if(_loc6_ != null)
            {
               _loc3_.push(_loc6_);
            }
         }
         _loc2_ = _loc3_;
         if(int(_loc2_.length) > 0)
         {
            get_inventory().takeItems(_loc2_,param1);
         }
         else
         {
            doNext(param1);
         }
      }
      
      public function debugMenu(param1:Boolean = true) : void
      {
         get_game().debugMenu.debugCompEdit(saveContent,new SaveContent(null,null,null,null,null,null));
      }
      
      public function askedTotal() : int
      {
         var _loc1_:int = Utils.countSetBits(saveContent.questAsked);
         if((saveContent.questAsked & RATCLUE) != 0)
         {
            _loc1_--;
         }
         return _loc1_;
      }
      
      public function askShouldra() : void
      {
         clearOutput();
         outputText("幽灵毫不犹豫地在你面前显形。[say: 我完全知道你在想什么，勇者！]");
         outputText("[pg]这倒省了解释的功夫，但她知道怎么帮忙吗？");
         outputText("[pg][say: 噢对，我知道该怎么做，]她说道，眼中闪烁着金光。你的身体颤抖着，很快体型就开始变大。令你沮丧的是，舒尔德拉似乎想到了别的事情。然而，与你的猜测相反，她摇了摇头，解释道：[say: 如果你变大得太快，那些藤蔓肯定会崩断的！]");
         outputText("[pg]这逻辑其实挺合理的。要不是你身上传来一阵阵剧烈的可怕疼痛，你真想夸赞她的策略。随着你的体型变得特别巨大，藤蔓紧紧勒住你的身体，拼命吸取一切能吸取的养分来跟上你的生长。");
         outputText("[pg][say: 等等，等等，交给我！]幽灵大喊道，但这并没有打消你的疑虑。随着她的眼睛发出更亮的光芒，你突然迅速缩小。眨眼间，你就缩小到了婴儿般大小。");
         outputText("[pg]藤蔓也跟着缩小了。你的困境并没有解除，现在你反而更疼了。舒尔德拉尴尬地笑了笑，她的计划落空了。[say: 往好处想，至少这身衣服很酷。]");
         outputText("[pg]还没等你对她做出反应，她就冲回了你的体内，在连续使用了如此高速的生长和缩小后，她需要休息。");
         _temp_1.questAsked |= ASKEDSH;
         if(askedTotal() > 2)
         {
            outputText("[pg]要是能有什么东西让这些藤蔓直接滑落就好了……");
         }
         doNext(get_camp().returnToCampUseOneHour);
      }
      
      public function askRathazul() : void
      {
         clearOutput();
         outputText("你向这只老鼠伸出被藤蔓缠绕的手臂，直截了当地请求他施展魔法。");
         outputText("[pg]拉萨祖尔盯着看了一会儿，然后直视你的眼睛。[say: 你知道这是科学，不是魔法对吧？] [if (silly) {他似乎不太乐意充当机械降神|他似乎明白你的意思，但更希望你能放尊重点}]。");
         outputText("[pg]你向拉萨祖尔解释了情况，告诉他关于黑天鹅绒爱娜温的事情，以及附着在你身上的根须内部。除了偶尔的疼痛之外，它还迫使你在他和其他所有人面前裸奔。" + (get_player().cor >= 66 || get_game().ceraphScene.hasExhibition() ? " 你更希望裸奔是你自愿的。" : ""));
         outputText("[pg]老鼠哼了一声，琢磨着解决这个难题的正确方法，很快决定翻阅他的一本笔记本。你从他肩后看去，看到了许多植物的草图和密密麻麻的文字。炼金术士注意到了你的好奇，边看边说。[say: 任何执业的炼金术士都会记录他们能收集到的关于当地植被的所有信息。碰巧，我也有关于爱娜温的笔记，但大多是二手资料。]");
         outputText("[pg]在默默地阅读和翻页之后，拉萨祖尔叹了口气。[say: 我不知道该怎么处理这个，]他坦白道。看到你脸上的反应，他继续说道。[say: 据我所知，它可能不会要了你的命。它就像寄生虫一样，而寄生虫是不希望宿主死亡的。] 仅仅是不死还不够，你仍然需要一个解决办法。[say:我会继续尽我所能去研究。也许随着时间的推移，我能找到解决办法。如果你还需要的话，我会尽快把我的发现告诉你。]");
         _temp_1.questAsked |= ASKEDRA;
         if(askedTotal() > 2)
         {
            outputText("[pg]要是能有什么东西让这些藤蔓直接滑落就好了……");
         }
         doNext(get_camp().returnToCampUseOneHour);
      }
      
      public function askKitsuneYes() : void
      {
         var _g1:Combat;
         var willing:Boolean;
         var _g:KitsuneScene;
         clearOutput();
         outputText("要么管用，你的问题解决了；要么不管用，你也不必跟着这只淫荡的狐狸。这是一个非常合理的协议。");
         outputText("[pg]狐妖走到你跟前，双手紧紧抓住她能找到的最光滑的一段藤蔓。她闭上眼睛，深吸了一口气。[say: 上次我遇到类似的情况时，我和我的姐妹们想出了一个非常快速的解决办法。可能会有点刺痛。]");
         outputText("[pg]没有多余的废话，狐妖用尽全力猛拽藤蔓。你尽可能稳住身体，但藤蔓纹丝不动。她又拽了一下。");
         outputText("[pg]她又拽了一下。");
         outputText("[pg]她再一次猛拽。");
         outputText("[pg][say: 我的办法都用光了，]她擦了擦额头说道。[say: 想不想和我还有我的姐妹们一起放松一下，缓解缓解压力？]");
         if(askedTotal() > 2)
         {
            outputText("[pg]要是能有什么东西让这些藤蔓直接滑落就好了……");
         }
         menu();
         _g = get_game().forest.kitsuneScene;
         willing = true;
         addNextButton("好吧",function():void
         {
            _g.mansion(willing);
         }).hint("随便吧，好吧。");
         _g1 = get_combat();
         addNextButton("否",function():void
         {
            _g1.cleanupAfterCombat();
         }).hint("不。");
      }
      
      public function askKitsuneNo() : void
      {
         clearOutput();
         outputText("听起来她根本不知道自己在说什么！也许向森林深处的幻术师求助并不是个好主意。");
         outputText("[pg]狐妖叹了口气，伸手扶额。[say: 估计没什么大不了的，你太杞人忧天了。]");
         outputText("[pg]这得由你自己去弄清楚了，你打定主意，转身走进了森林。");
         if(askedTotal() > 2)
         {
            outputText("[pg]要是能有什么东西让这些藤蔓直接滑落就好了……");
         }
         get_combat().cleanupAfterCombat();
      }
      
      public function askKitsune() : void
      {
         clearOutput();
         outputText("尽管跟着她去看看她准备了什么可能很诱人，但你其实更希望这只居住在魔法森林里的狐妖能对附着在你身上的不祥藤蔓有所了解。");
         outputText("[pg][say: 你在向我寻求医疗建议？]她困惑地问道。");
         outputText("[pg]“医疗”往往会让人联想到疾病和感染。你该不会要死了吧？");
         outputText("[pg]她举起一只手示意你保持冷静。[say: 不，不，不是那样的！我想你会没事的。]");
         outputText("[pg]想什么呢？这可是关乎你健康的大事！" + (FlagDict_Impl_.arrayReadInt(KFLAGS.flags,626) > 0 ? "她可就再也没法带你去豪宅，让你被猛操和榨精好几个小时了" : "她就没法带你过去跟她和她的姐妹们一起玩了") + "你要是死了的话！");
         outputText("[pg][say: 听着，那我就把它们弄下来！如果我这么做，你会跟我回家吗？]");
         _temp_1.questAsked |= ASKEDKT;
         menu();
         addNextButton("是的",askKitsuneYes).hint("如果管用，那太好了，她赢得了你的信任。");
         addNextButton("否",askKitsuneNo).hint("也许还是别这么做。");
      }
      
      public function askKihaAnswer(param1:Boolean) : void
      {
         clearOutput();
         if(param1)
         {
            outputText("你防御性地举起双臂，恳求这头伪龙不要把你的脸给烤熟了。[pg]");
         }
         outputText("奇哈深吸一口气，紧接着直接向你的身体喷出一股强烈的火焰。这导致你全身烧伤和疼痛，而藤蔓似乎为了抵抗高温而收缩并榨取你的体力。片刻之后，你便筋疲力尽地倒在了地上。");
         outputText("[pg][say: 对、对不起，我以为那会管用的！]她惊呼道，真心害怕伤到了你。不过你向她保证你没事。不知为何，你只是觉得有些喘不过气来。她只是在做她认为有帮助的事，你感谢她的关心。");
         outputText("[pg]奇哈脸红了，尴尬地移开视线，意识到自己根本没帮上忙。[say: 笨、笨蛋。]");
         outputText("[pg]撇开阻燃藤蔓不谈，你本以为她会对爱娜温很熟悉。不知为何，她对它们的存在完全一无所知。");
         outputText("[pg][say: 这就是为什么你需要我多陪在你身边保护你！那些爱娜温可能一直太害怕我了，所以才不敢露出她们那没安好心的脸！]");
         outputText("[pg]这确实是个很可能的解释。爱娜温大多是静止的植物，而奇哈是一个凶猛的会喷火的龙女，除了你之外，几乎任何人都能轻易惹怒她。再仔细想想，如果一个爱娜温<i>真的</i>在奇哈面前现身，你反而会更惊讶。");
         get_player().changeFatigue(20);
         if(askedTotal() > 2)
         {
            outputText("[pg]要是能有什么东西让这些藤蔓直接滑落就好了……");
         }
         doNext(get_camp().returnToCampUseOneHour);
      }
      
      public function askKiha() : void
      {
         var noplease1:Boolean;
         var _g1:AlrauneScene;
         var noplease:Boolean;
         var _g:AlrauneScene;
         clearOutput();
         outputText("在沼泽里生活了这么长时间，也许奇哈知道一些关于黑天鹅绒爱娜温的事情。你向她讲述了事情的经过，以及你的新衣服是如何与你的肉体融合的。");
         outputText("[pg][say:烧了它们，]她坚定地说。");
         _temp_1.questAsked |= ASKEDKH;
         menu();
         _g = this;
         noplease = false;
         addNextButton("好的",function():void
         {
            _g.askKihaAnswer(noplease);
         }).hint("用火对付植物，这很合理。");
         _g1 = this;
         noplease1 = true;
         addNextButton("否",function():void
         {
            _g1.askKihaAnswer(noplease1);
         }).hint("那绝对没有好下场。");
      }
      
      public function askJojo() : void
      {
         clearOutput();
         outputText("一位虔诚纯洁的武僧会不会碰巧知道什么治疗这种折磨你肉体的腐化的方法？它开始擦伤皮肤了。");
         outputText("[pg]乔乔上下打量着你，看到你暴露在外的[skinfurscales]，紧张地挪了挪身子。[say:我想我可以看看，但我对植物学真的不太了解，]他说道。[say:请伸出你的手臂，我来检查一下这些藤蔓。]");
         outputText("[pg]你照做了，伸出你的手臂。当这些藤蔓没有框住你的[genitals]时，他似乎更自在地仔细研究它们。");
         outputText("[pg][say:我真的不知道这是怎么回事，[name]，]他承认道，为自己帮不上忙而感到难过。[say:我建议我们对此进行冥想，祈祷解决办法能自己找上门来。]");
         _temp_1.questAsked |= ASKEDJO;
         if(askedTotal() > 2)
         {
            outputText("[pg]要是能有什么东西让这些藤蔓直接滑落就好了……");
         }
         menu();
         addNextButton("冥想",get_game().jojoScene.jojoFollowerMeditate);
         addNextButton("算了",get_camp().returnToCampUseOneHour).hint("这对你来说太不积极主动了。");
      }
      
      public function askHolliRemove() : void
      {
         clearOutput();
         outputText("你不会被劝阻的，这东西现在必须弄掉。");
         if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,682) == 1)
         {
            outputText("[pg][say: 哎，我还期待着能多看看你这个样子呢，]她闷闷不乐地说。[say: 我会帮忙的，但我希望你能为了这个多来找我做爱！]");
            outputText("[pg]她只能等着瞧了，你的时间由你自己支配。现在，她需要解决你的藤蔓问题，否则……");
            outputText("[pg][say: 对、对，]她羞怯地说。[say: 你只需要一块黏液布。]");
            outputText("[pg]很好，你知道该怎么做了，你准备出发去办。");
         }
         else
         {
            outputText("[pg][say: 哼！一点都不好玩。" + (FlagDict_Impl_.arrayReadInt(KFLAGS.flags,1108) == 1 ? "至少你今天尽职尽责地取悦了我，所以我现在心情不错，愿意施舍你。" : "你甚至都没有尽职尽责地给我施肥。我希望你能更好地照顾女神的女儿。确保你更频繁地取悦我，而且") + "我需要你给我带些东西来。]");
            outputText("[pg]比如？");
            outputText("[pg]树妖咧嘴一笑，开始列清单：[say: 三瓶纯蜂蜜，三瓶奶——我不挑剔是什么奶——五瓶蛇油，还有五块黏液布。]");
            outputText("[pg]这可真是五花八门，而且相当古怪。");
            outputText("[pg]霍莉双臂交叉，用一种防御性的语气说道，[say: 在帮你弄掉那些藤蔓之前，我需要这些东西。]");
         }
         _temp_1.questAsked |= ASKEDHO;
         doNext(get_camp().returnToCampUseOneHour);
      }
      
      public function askHolliEh() : void
      {
         clearOutput();
         outputText("霍莉对你咧嘴一笑，微微摇晃着她的树，赞许你的选择。[say: 明智的决定，]她说道，[say: 现在来点园艺活动庆祝一下怎么样？]");
         outputText("[pg]说完后半句话，她对你眨了眨眼。");
         get_game().holliScene.treeMenu(false);
      }
      
      public function askHolli() : void
      {
         clearOutput();
         outputText("作为自然女神玛莱的子嗣，你期望霍莉能知道<i>一些</i>与你当前困境相关的解决办法。也许，她甚至能把它移除？");
         outputText("[pg]树妖用手捋了捋头发，思考着你的问题。[say: 我们为什么要这么做？我觉得这让你看起来很" + get_player().mf("英俊","美丽") + "，]她对你灿烂地笑着说。[say: 事实上，我相信你穿上它，每一天都会让你看起来更加" + get_player().mf("英俊","美丽") + "。]");
         outputText("[pg]很讨人喜欢，也许如果这种风格符合你的喜好，在知道如何移除它之后，你会考虑保留它。");
         outputText("[pg]霍莉呻吟着抱怨起来。[say: 你真的非要毁掉一件好东西吗？你们这些凡人，总是对低等的身体充满执念，]她嘟囔着。");
         doNext(get_camp().returnToCampUseOneHour);
         menu();
         addNextButton("移除",askHolliRemove).hint("你在这个问题上态度坚决。");
         addNextButton("算了",askHolliEh).hint("你暂时保留它。");
      }
      
      public function askArian() : void
      {
         clearOutput();
         outputText(get_silly() ? "你在蜥蜴人身边转来转去，直接告诉[arian em]，你屁股上缠着一些紧得要命的藤蔓，如果不解决这个问题，你简直想杀人。" : "你尽可能简明扼要地向阿瑞安解释，你从一只爱娜温身上扯下了一块根须，现在她的藤蔓就像你身体的一部分一样，紧紧贴在你的[skinshort]上。");
         outputText("[pg]阿瑞安紧张地摆弄着[arian eir]的拇指。[say:我不太熟悉那种问题。]");
         outputText("[pg]这位才华横溢、尽职尽责的神秘学者竟然不知道，你感到非常失望。肯定有什么[arian ey]能做的！");
         outputText("[pg][say:嗯，我可以给你的护身符附魔，让它使用那个自焚法术。也许那会有帮助。]");
         outputText("[pg]自焚？");
         outputText("[pg]阿瑞安结结巴巴地改变了[arian eir]的主意。[say:啊——好吧，你这么直白地说出来，也许这是个坏主意。]");
         outputText("[pg]不管有没有效，这份心意你领了。");
         _temp_1.questAsked |= ASKEDAR;
         if(askedTotal() > 2)
         {
            outputText("[pg]要是能有什么东西让这些藤蔓直接滑落就好了……");
         }
         doNext(get_camp().returnToCampUseOneHour);
      }
      
      public function askAmily() : void
      {
         clearOutput();
         outputText("在远离文明社会的这段时间里，艾米莉可能收集了许多关于植物的有用信息。考虑到这一点，你向她说明了你的情况。");
         outputText("[pg][say:这完全是一种外来的病症，]她好奇地摩擦着藤蔓，尖声说道。[say:也许如果你能找到什么非常滑的东西，它们就会……滑落下来？]");
         outputText("[pg]艾米莉听起来对此毫无自信。你叹了口气，感谢她的建议。");
         _temp_1.questAsked |= ASKEDAM;
         if(askedTotal() > 2)
         {
            outputText("[pg]要是能有什么东西让这些藤蔓直接滑落就好了……");
         }
         doNext(get_camp().returnToCampUseOneHour);
      }
      
      public function askAlrauneAnswer(param1:Boolean) : void
      {
         clearOutput();
         if(param1)
         {
            outputText("必须驱除这些藤蔓。植物女笑了起来。[say: 它们是你的一部分！我无法移除这些藤蔓，就像我无法移除你的四肢一样。根须已经在你的血肉中扎根，而血肉可没那么容易随随便便就能分开。]");
            outputText("[pg]她叹了口气，向前倾身靠在她的花丘上。[say: 现在不管你喜不喜欢，我都想好好享受一下。躺下，乖乖接受吧。]");
         }
         else
         {
            outputText("[pg]这就是你目前需要的所有信息，暂时没有其他想调查的了。然而，当你转身离开时，爱娜温的一根藤蔓在你[feet]附近的草地和树叶间沙沙作响。[say: 消息可不是免费的，你知道的，]她威胁地说道。");
         }
         doNext(alrauneFight);
      }
      
      public function askAlraune() : void
      {
         var remove1:Boolean;
         var _g1:AlrauneScene;
         var remove:Boolean;
         var _g:AlrauneScene;
         clearOutput();
         outputText("没必要逃跑——你有理由直面这个生物。你举起双臂，向她展示你那被藤蔓缠绕" + (get_player().dryadScore() > 2 ? "且发生花卉突变" : "") + "的身体。正是[i:她]的同类给你施加了这种诅咒，你需要一个答案。对此，爱娜温咯咯地笑了起来。[say: 很漂亮，不是吗？]她满足地叹了口气，然后向你保证这不是诅咒。[say: 那些藤蔓不会伤害你的。它们现在是你身体的一部分，只有当你活着的时候，它们才会茁壮成长。]");
         outputText("[pg]被迫喂养这种寄生虫，不管它会不会要了你的命，都让人难以接受。不过，至少你的生命安全得到了保证，这也算是一点安慰吧。你向这个植物女打探更多信息。");
         outputText("[pg][say: 你会尽可能地成为我的同类。接受你作为自然界一部分的身份吧。这样你的身体会更强壮。]");
         _temp_1.questAsked |= ASKEDAL;
         menu();
         _g = this;
         remove = true;
         addNextButton("移除藤蔓",function():void
         {
            _g.askAlrauneAnswer(remove);
         }).hint("你拒绝接受。");
         _g1 = this;
         remove1 = false;
         addNextButton("继续前进",function():void
         {
            _g1.askAlrauneAnswer(remove1);
         }).hint("你听够了。");
      }
      
      public function alrauneWonWake() : void
      {
         clearOutput();
         outputText("你醒了过来，神志不清地环顾四周，直到你的感官恢复正常。从天空来看，应该已经过了将近8个小时。你没有看到爱娜温，所以你小心翼翼地收拾好你的东西，以免情况发生变化。");
         doNext(get_camp().returnToCampUseEightHours);
      }
      
      public function alrauneWonTalking() : void
      {
         clearOutput();
         outputText("如果有人知道什么是真正的敏锐，那一定是她，看看她是如何生活和呼吸在边缘的——黑发、黑唇，甚至黑色的藤蔓——这是天性，还是青春期的焦虑？");
         outputText("[pg]这位皮肤苍白的植物女发出了一声轻松的轻笑。她叹了口气，带着困惑的神情低头看着你。[say: 你的言辞比你的[weapon]更有杀伤力。如果你不是软绵绵地躺在我面前，而我的藤蔓随时准备刺穿你的屁股，我几乎都要尊重你了。]");
         outputText("[pg]她还真是个青春期少女，总是喜欢找人麻烦。");
         outputText("[pg][say: 我收回我刚才的话，我<b>确实</b>尊重你。在你这种处境下还敢油腔滑调，需要相当大的愚蠢勇气。]");
         outputText("[pg]直觉告诉你，这件事不以你被强奸收场是完不了的。");
         doNext(alrauneWonSex);
      }
      
      public function alrauneWonSex() : void
      {
         clearOutput();
         outputText("爱娜温抓住你的肩膀，把你拉近，直到你的头滑下花朵的中心。[say: 嗯，是的，废话时间结束了。让你那张嘴派上更好的用场吧。]");
         outputText("[pg]由于你现在是倒立的视角，你需要花点时间在脑海中调整方向。你又向下滑了一点，看到她的小穴就在[if (metric) {几厘米|几英寸}]外盘旋。光线虽然不如你希望的那么好，但你还是能轻易地看清她的阴唇是多么苍白、光滑和纯洁。");
         outputText("[pg]爱娜温俯身在你的躯干上，顺势将你的脸推过她的大腿。缠绕着你[legs]的带刺藤蔓清楚地表明，她没有耐心让你躺在那里傻看。你开始工作，伸出你的[tongue]，开始品尝她的“花蜜”。当你接触到她时，她的身体微微颤抖了一下，表明她可能很满意。她的外阴柔软、蓬松，而且很明显带着浓郁的花香。恰如其分地，她尝起来很甜，就像花蜜一样。你心想，所有的爱娜温都这么美味吗？");
         outputText("[pg][if (hasarmor) {你感觉到你的[armor]被拉扯和推搡，紧接着你的[genitals]暴露在了空气中。}]体贴的植物娘开始回报你的努力。她的嘴唇接触到了你的[if (hascock) {肉棒|[if (hasvagina) {[clit]|光溜溜的胯部，在向你的[asshole]移动时，诱人地啄吻着}]}]。你本能地僵硬了一下，因为你忽略了自己的职责而惹恼了她。当她的舌头在你的大腿内侧挑逗地滑动时，你把注意力集中在用你的口交技巧让她神魂颠倒上。你可能对此有点过于热情了；下面这股甜美的气味有什么特别之处吗？也许，你只是一个非常充满激情的爱人。你再次舔舐她蓬松的阴阜，享受着那美味的味道。你轻轻地用牙齿咬住她那颗小小的樱桃核，听到她愉悦的呻吟声，你得意地笑了。她的舌头滑过[if (hascock) {你的[cock]|[if (hasvagina) { 你的阴唇上方和之间|你的屁股边缘}]}]，在你刺激她的时候，给你更好的回报。在给了她的阴蒂一个皱巴巴的吻之后，你把你的[tongue]拖进她的阴道深谷中。");
         outputText("[pg]长时间保持半倒立状态一定对你的健康有害，因为你似乎变得相当头晕。你吸了吸鼻子，集中注意力恢复方向感。你的舌头戳着她小穴的入口，感觉到了里面黏糊糊的质地。你伸长脖子，把脸紧紧贴在她的胯部，把舌头伸进她体内。凭借你口交触手的技巧，你推挤并吸吮着你能触及的她体内的每一个角落。爱娜温高兴地发出呼噜声，作为回报，她也加强了自己的技巧。[if (hascock) {她的嘴沉在你的肉棒上，" + (get_player().longestCockLength() < 7 ? "完全" : "尽可能多地") + "吞没了它。她" + (get_player().longestCockLength() > 5 ? "喉咙和舌头的感觉太棒了，都在" : "舌头的感觉太棒了，包裹着") + "你的肉棒上蠕动。|她的舌头滑进你的[if (hasvagina) {[pussy]|屁股}]，在入口处旋转。起初，你收紧了身体，但那个柔软、火热、光滑的器官对你的身体来说太棒了，让你无法不邀请它进入。}]过度兴奋，你的腹部肌肉收缩，你的[legs]颤抖，高潮比你预期的要早得多。现在一切都感觉更加敏感，而她并没有放松。你笨拙地把脸在她的阴道上摩擦，几乎是在用脸埋胸的方式来试图淹没你所受到的过度刺激。花香和果味的花蜜吞噬了你的感官，而你的感官也吞噬了它们，你迷失在一个奇怪的地方。真是太令人头晕目眩了。她的一些淫液滴进了你的鼻子里。你抽搐着，迎来了第二次高潮。" + (FlagDict_Impl_.arrayReadInt(KFLAGS.flags,522) > 1 ? " 这会让菲拉嫉妒吗？" : ""));
         get_player().orgasm(get_player().hasCock() ? "Dick" : (get_player().hasVagina() ? "Vaginal" : "Anal"));
         dynStats(DynStat.Cor(0.5));
         get_combat().cleanupAfterCombat(alrauneWonWake);
      }
      
      public function alrauneWon() : void
      {
         var _gthis:AlrauneScene = this;
         clearOutput();
         outputText("[say: 哎呀呀，这么强烈的抵抗，可你还是躺在这里，]她看着挣扎着想要站起来的你说道。" + (get_silly() && get_player().get_lust() >= get_player().maxLust() ? " [say: 多么讽刺啊，你输了是因为你“身经百战”。][pg]伴随着这句话，你甚至有点欢迎死亡了。 " : "[pg]"));
         outputText("爱娜温用藤蔓将你缠绕，把你的身体拖近她的花丘。她将你抬到花瓣上，为你提供了一张相当舒适的床。[say: 原谅我这么粗鲁地拖拽你，]她解释道，[say: 但我觉得把你移到这里会舒服得多。]");
         outputText("[pg]虽然可以理解，但她这么做总不可能是为了让你睡个午觉恢复体力吧？");
         if(Utils.rand(100) == 0)
         {
            outputText("[pg][say: 嗯。其实，是的。就这一次，你可以睡一觉缓解压力。]她闭上那双幽暗的眼睛，微微一笑。当你还在琢磨眼前的状况时，你们之间陷入了沉默。你现在的处境也容不得你争辩，所以你接受了这个奇怪的转折。你放松了紧绷的神经，平静地躺在紫红色的花瓣上，沐浴在令人惊讶的仁慈的黑天鹅绒爱娜温的甜美香气中。");
            get_combat().cleanupAfterCombat(function():void
            {
               _gthis.clearOutput();
               _gthis.outputText("8小时后你醒了过来，休息的时间比预期的要长得多。爱娜温就在你身边，半个身子沉在她的花朵里。虽然她现在很脆弱，但你回报了她的仁慈，选择跌跌撞撞地回家，没有再挑起冲突。");
               _gthis.doNext(_gthis.get_camp().returnToCampUseEightHours);
            });
            return;
         }
         outputText("[pg][say: 我最好小心点；这么敏锐的头脑，我可能会被修剪掉，]她带着明显的讽刺意味说道。");
         menu();
         addNextButton("继续交谈",alrauneWonTalking).hint("她真的会把你当成那种能靠嘴皮子脱身的油滑流氓吗？");
         addNextButton("性爱",alrauneWonSex).hint("那就直接开始吧。");
      }
      
      public function alrauneVinesGrind() : void
      {
         var _g:Combat;
         clearOutput();
         outputText("由于她极轻的体重，你轻松地将她压在地上。你抓住她一根收起尖刺的藤蔓，将其滑到你身下，稍微挺起臀部，让你的外阴在上面摩擦。你将藤蔓前后滑动了几下，然后告诉她接下来的事由她来做。她不情愿地开始非常缓慢、轻微地让藤蔓滑过你湿润的阴户，抵着你坚挺的[clit]。她显然是故意不想让你觉得太爽。");
         outputText("[pg]你告诉这个叛逆的婊子她做得不够好，你打算向她展示如何真正使用这些藤蔓。你抓住她的一根长长的附肢，掰开她柔软苍白的臀瓣，毫无预兆地干涩地插入了她。当你强行将她干涩的藤蔓深深插入她体内，深度远超任何正常身体部位所能及的范围时，她发出了痛苦而愉悦的嚎叫，你开始感觉到你身下的藤蔓移动得稍微急切了一些。你问她是不是只要这样就能让她爽起来，接着你又抓起她的一根藤蔓塞了进去，听着她随着你深深的推入发出愉悦的叫声。她的藤蔓在你身下更加兴奋地来回舞动，你也不禁发出一声呻吟，然后又抓起一根藤蔓强行塞进她体内。即使你注意到一些“血液”开始从她被过度撑开的洞口渗出，她依然灵巧地扭动着藤蔓，抵着你湿滑的外阴顶弄。");
         outputText("[pg][say: 啊啊啊，来吧！还要！] 她现在听起来简直兴奋极了。这在此时还能算是强奸吗？");
         outputText("[pg]双腿间热量聚集，你俯下身，将你跳动、勃起的[clit]抵向她的藤蔓，而她也急切地抽插着。在你急切的附肢上摩擦的同时，你用一只手抓住目前正插在她体内的三根藤蔓，迅速拉出一大截，同时注意到有相当数量的黑色汁液滴落下来。她在你身下扭动着，开始喘息，身体颤抖，而她的藤蔓在你私处剧烈地扭动着。你嘲笑她这么快就高潮了，然后尽可能用力地将藤蔓重新插回她体内，接着又猛地拔出来。当你开始稳定而痛苦地操弄她被撑开的后庭时，这位哥特美人发出了尖叫和喘息，而她藤蔓抽插的速度也随之改变，与你侵犯她的速度相匹配。现在能够间接控制她的节奏，没过多久你就感觉自己被推到了边缘。当高潮席卷而来时，你的肌肉痉挛，体液喷涌在你这位花朵“受害者”的背上。享受着这股快感，你越来越快地将她的藤蔓插进她体内，而她也在你身下做着同样的事，这让你弓起背，发出一声满足而释然的长叹。");
         outputText("[pg]你从她身上站起来，然后一次性将三根附肢从她体内猛地拔出。藤蔓上沾满了大量黑色的“血液”，甚至还有更多从她依然大张的洞口滴落。尽管她显然受伤了，但她立刻翻身仰卧，开始疯狂地揉搓自己的阴蒂，同时一个洞流出花蜜般的润滑液，另一个洞流出血液般的汁液。你收拾好自己的物品并穿上衣服，听着她发出第二次高潮的叫喊声。平静片刻后，她有些匆忙地开始爬回她的花朵。你只是对她摇了摇头，然后返回营地。你不确定自己是否真的给了她一个教训，即使给了，可能也不是正确的那个。");
         get_player().orgasm("Vaginal");
         _g = get_combat();
         doNext(function():void
         {
            _g.cleanupAfterCombatNewPage();
         });
      }
      
      public function alrauneVinesDildo() : void
      {
         var _g:Combat;
         clearOutput();
         outputText("由于她极轻的体重，你轻松地将她压在地上。你抓住她一根收起尖刺的藤蔓，用尖端在你[vagina]湿润的入口处轻轻挑逗了片刻，然后将其滑入。你在体内给了这根黑色藤蔓几次小幅度的抽插，然后告诉她接下来的事由她来做。她不情愿地开始非常缓慢、轻微地在你体内前后移动藤蔓。她显然是故意不想让你觉得太爽。");
         outputText("[pg]你告诉这个叛逆的婊子她做得不够好，你打算向她展示如何真正用这些藤蔓来操。你抓住她的一根长长的附肢，掰开她柔软苍白的臀瓣，毫无预兆地干涩地插入了她。当你强行将她干涩的藤蔓深深插入她体内，深度远超任何正常身体部位所能及的范围时，她发出了痛苦而愉悦的嚎叫，你开始感觉到你体内的藤蔓移动得稍微急切了一些。你问她是不是只要这样就能让她爽起来，接着你又抓起她的一根藤蔓塞了进去，听着她随着你深深的推入发出愉悦的叫声。她的藤蔓在你阴道里更加兴奋地舞动着，你也不禁发出一声呻吟，然后又抓起一根藤蔓强行塞进她体内。即使你注意到一些“血液”开始从她被过度撑开的洞口渗出，她依然灵巧而充满活力地按摩着你的阴道壁。");
         outputText("[pg][say: 啊啊啊，来吧！还要！] 她现在听起来简直兴奋极了。这在此时还能算是强奸吗？");
         outputText("[pg]当她急切地摩擦并抽插你的[vagina]时，热量[if (singleleg) {在你的胯下|在你的双腿间}]聚集。你用一只手抓住目前正插在她体内的三根藤蔓，迅速拉出一大截，同时注意到有相当数量的黑色汁液滴落下来。她在你身下扭动着，开始喘息，身体颤抖，而她的藤蔓在你体内剧烈地扭动着。你嘲笑她这么快就高潮了，然后尽可能用力地将藤蔓重新插回她体内，接着又猛地拔出来。当你开始稳定而痛苦地操弄她被撑开的后庭时，这位哥特美人发出了尖叫和喘息，而她藤蔓抽插的速度也随之改变，与你侵犯她的速度相匹配。现在能够间接控制她的节奏，没过多久你就感觉自己被推到了边缘。当高潮席卷而来时，你的肌肉痉挛，体液喷涌在你这位花朵“受害者”的背上。享受着这股快感，你越来越快地将她的藤蔓插进她体内，而她也对你做着同样的事，这让你弓起背，发出一声满足而释然的长叹。");
         outputText("[pg]你从她身上站起来，将藤蔓从自己体内拔出，然后一次性将三根附肢从她体内猛地拔出。藤蔓上沾满了大量黑色的“血液”，甚至还有更多从她依然大张的洞口滴落。尽管她显然受伤了，但她立刻翻身仰卧，开始疯狂地揉搓自己的阴蒂，同时一个洞流出花蜜般的润滑液，另一个洞流出血液般的汁液。你收拾好自己的物品并穿上衣服，听着她发出第二次高潮的叫喊声。平静片刻后，她有些匆忙地开始爬回她的花朵。你只是对她摇了摇头，然后返回营地。你不确定自己是否真的给了她一个教训，即使给了，可能也不是正确的那个。");
         get_player().orgasm("Vaginal");
         _g = get_combat();
         doNext(function():void
         {
            _g.cleanupAfterCombatNewPage();
         });
      }
      
      public function alrauneVines(param1:Boolean) : void
      {
         clearOutput();
         outputText("在战斗中占据上风后，你觉得教训她一下才公平。你抓住被击败的爱娜温深紫色和靛蓝色的头发，[if(rooted){强行将她从她那巨大的花卉住所中拉出来，然后}]将她拖离她家花瓣几英尺远。由于她很轻，你用力过猛地将她脸朝下扔在地上，把她的脸砸进了泥土里。她因为疼痛发出了一声短促、无意的喘息，听起来几乎有点色情。她头晕目眩地躺在地上，你站在她上方，思考着如何随心所欲地对待她，同时心不在焉地盯着她背上那个黑色的、空洞的开口。有点令人不安，但不知何故，考虑到她外观的其他部分，这似乎又出奇地合适。不过，现在肯定不是管这个的时候。");
         outputText("[pg]你没有被她非人的背部问题吓倒，伸手狠狠地拽住她的头发，把她从地上拉起来。当你这样做时，她发出了另一声听起来像是痛苦和快乐混合的呻吟。把她的脸举到你旁边，你轻轻地咬了一下她的耳朵，然后低声对她说，她将在短时间内成为你的玩具。带着得意的笑容，你收回空闲的手[if (str >= 80) {尽可能用力地在她的屁股上打了一记强烈而痛苦的耳光，导致她不由自主地发出一声响亮且非常色情的呻吟。看来她可能真的是个十足的受虐狂。|尽可能用力地在她的屁股上打了一巴掌，导致她发出了最轻微的色情呻吟。结合她早些时候发出的声音，证据似乎表明她有点受虐倾向。}]当你用力将手从她的屁股滑到她的下体，摸索她湿润的小穴时，这一点得到了证实。舔掉手指上甜美的花蜜，你告诉她，如果她喜欢痛苦，那她就会得到痛苦。");
         outputText("[pg]你再次用力将她的脸按在地上，并开始在手中收集她的一些藤蔓。[say: 喂-喂！你拿那些做什么？]她用命令的语气问你。告诉她保持安静，你抓住她的一根带刺的藤蔓，用它在她的背上抽了一鞭，导致她对这种感觉发出轻柔的咕咕声。她自己的刺在她的背上几处划破了“皮肤”，一种黑色的、像树液一样的物质像血一样从那些小刺孔中流出。然而，流血并没有持续多久。出于好奇，你擦去了树液状的物质，却看到刺孔比应有的要小得多，而且还在继续缩小。这真是一个迷人的小能力。");
         outputText("[pg]你将她的一根藤蔓与其他藤蔓分开，并紧紧抓住末端。沿着她的大腿滑动尖端，你问她对它去哪里有什么偏好。[say: 操你！]这是她唯一懒得回答的话。好吧，你当然不怎么反对这个想法。你用力[if (tailLeg) {尾巴抽打|踢}]在正常生物肋骨所在的位置，以确保她在你[if (hasarmor) {完全脱掉衣服并}]把东西放在一边之前不会站起来。现在你可以随心所欲了，你降低身体，栖息在她的背上，就在她背上那个大洞结束的地方。");
         menu();
         addNextButton("藤蔓假阳具",alrauneVinesDildo).hint("把那根藤蔓直接滑进你体内。");
         addNextButton("藤蔓摩擦",alrauneVinesGrind).hint("在藤蔓上摩擦并骑乘它。");
      }
      
      public function alrauneTalk() : void
      {
         var _g:AlrauneScene;
         clearOutput();
         outputText("这已经不是你第一次遇到爱娜温了。你很清楚她能做什么，也知道她想要什么。");
         outputText("[pg][say: 是吗？很好，那我想要什么？]");
         menu();
         if(!saveContent.vinesTaken && get_player().get_armor().get_id() != get_armors().VINARMR.get_id())
         {
            addNextButton("背部按摩",alrauneBackrub).hint("这就够了，不是吗？");
         }
         addNextButton("战斗",alrauneFight);
         _g = this;
         addNextButton("调情",function():void
         {
            _g.alrauneFlirt();
         }).disableIf(get_player().isGenderless(),"没有合适的装备，你可没法靠花言巧语蒙混过关。");
      }
      
      public function alrauneRimmingLeave() : void
      {
         clearOutput();
         outputText("你不知道她到底打算用那些藤蔓做什么，但你知道她说过会很痛。也许她没有恶意，但她确实让你产生了动摇。足以让你认为你应该在还有可能的时候尝试逃跑。开始感觉到更多的藤蔓摩擦你，你迅速做出了你能想到的第一个动作。你把嘴移到[if (silly) {她的会阴处，把牙齿深深地咬进她敏感的区域，深深地挖进去，撕下足够的“肉”，打开一个充满黑色血液般树液的洞，连接她的阴道和肛门。|她的阴户，用牙齿咬住她的阴唇。在她反应过来之前，你用力咬下去并向后拉，撕下她很大一部分阴唇，导致黑色的血液喷到你的嘴上。}] 她的藤蔓猛烈地从你身边缩回，她痛苦地大声尖叫……虽然你忍不住觉得这其中有一丝满足感。");
         outputText("[pg]你的嘴里沾满了她浓稠的黑色血液，你迅速站起来。你匆忙抓起你的东西，以你身体所能达到的最快速度逃跑，怀疑在那之后她是否还愿意尝试外交手段。回头看去，你看到她已经退回到了她的花朵里，用一种可怕的愤怒表情看着你逃跑。一旦那个花朵恶魔从视线中消失，你停下来喘口气[if (hasarmor) {并穿好衣服|休息一会儿}]。那绝对是一次难忘的经历。在离开沼泽时保持警惕，你回到了你的营地。");
         doNext(get_camp().returnToCampUseOneHour);
      }
      
      public function alrauneRimming3() : void
      {
         clearOutput();
         outputText("她的藤蔓逐渐加快速度，[if (hasvagina) {[if (hascock) {在你的小穴上抽插，而缠绕在你肉棒上的藤蔓则像活的性玩具一样前后移动|在你的性器官上抽插}]|像活的性玩具一样来回移动}]，你开始感觉到更多的鞭打落在你的背上和[ass]上。这位哥特式的施虐狂很好地扮演了她的角色，你" + (get_player().hasLongTongue() ? "把舌头尽可能深地插入她体内，最终碰到了死胡同，这让她发出了一声惊讶而幸福的喘息。[say: 哎呀呀，我没想到你能伸得那么深。你嘴里装的器官真有趣，玩物。现在继续。] 服从她的命令，你以更快的速度在她明显紧致的屁股里来回抽插，专注于用力地触底。每次你达到她的极限，她都会高兴地扭动身体，并在你的后庭上留下刺痛的鞭打。在尽可能深地抽插了一会儿后，她的整个后庭都涂满了你的唾液，让你能越来越快地用舌头操她。" : "用手挤压她的屁股，把舌头伸进她体内，向各个方向弹动，旋转和转动它，按摩她味道好闻的洞穴内部。听到她偶尔发出呻吟，你决定改变一下方式。虽然你可能够不到很深的地方，但你灵巧而熟练地取悦她，尽可能深地来回抽插，你的唾液让你越来越容易加快速度。") + " 随着你速度的增加，她的速度也增加了，[if (hasvagina) {[if (hascock) { 你的小穴里积聚了热量，而你勃起的阴蒂和极其坚硬的[cocktype]因性唤起而跳动|你的小穴里积聚了热量，而你的阴蒂因强烈的性唤起而跳动}]|你极其坚硬的[cocktype]因性唤起而跳动}]，她熟练地向你展示了她的藤蔓能带来多大的快感。");
         outputText("[pg]在比你预想的更短的时间内，你听到她在极度的幸福中大叫，她的身体扭动着，任何可以算作她肌肉的东西都在轻微地痉挛，挤压着" + (get_player().hasLongTongue() ? "你整个长度的" : "") + "舌头。她的鞭打变得更加用力，在她高潮期间，你生殖器处的藤蔓速度急剧增加，很快就让你发出了痛苦而愉悦的呻吟，因为你的高潮很快就到来了。[if (hasvagina) {[if (hascock) {当你[vagina]周围的肌肉痉挛时，她无情地在你小穴的外部抽插和摩擦，而你的肉棒则在包裹物中抽搐。两性的高潮快感充满了你的身体，你用女性的淫液涂满了她的藤蔓，而你的肉棒则把精液射到了地上，并稍微涂在了继续取悦你的附肢上。|当你[vagina]周围的肌肉痉挛时，她无情地在你性器官的外部抽插和摩擦，女性的淫液涂满了她的藤蔓，高潮的快感如波浪般让你全身充满刺痛的愉悦感。}]|你的肉棒在藤蔓的包裹中剧烈抽搐和痉挛了一会儿，然后把精液主要射到了地上，虽然稍微涂在了继续取悦你的附肢上。}] 尽管你们俩都已经结束了，但她没有表现出停止操弄或鞭打的迹象，所以你也继续。");
         outputText("[pg][say: 顺便说一句，别做个坏[boy]，指望我只做一次就完事。你要一直待在这里，直到你完全满足我。]");
         outputText("[pg]你们俩继续，不断地继续。当你被绑着并不断被鞭打时，你们俩精力充沛地继续着，你们俩发出的声音在沼泽中响亮地回荡。一株植物到底有多少耐力？她当然没有表现出放慢速度的迹象，没过多久就再次高潮了。在她的第二次高潮之后，她用另一根藤蔓插入了她自己的花朵小穴，猛烈地插入自己。为了尽可能多地提供帮助，你伸手去揉搓她那惊人坚硬的阴蒂，尽你所能地揉弄那个樱桃色的凸起。");
         outputText("[pg][say: 好玩物。现在你掌握窍门了。] 她轻笑了一声，你们俩继续。在你们俩都高潮了无数次之后，最终缠绕在你身体周围的藤蔓放松了，你生殖器处的藤蔓停止了，它们都退开了。意识到她终于结束了，你把舌头从她的洞里移开，听到她最后一声短暂的喘息。完全筋疲力尽的你躺在她的花瓣上，她也在你旁边放松下来。");
         outputText("[pg][say: 看？你为我做了一个非常好的玩具。而且你自己也玩得很开心，不是吗？] 同意这位苍白美人的话，你告诉她你当然不能否认她让你高潮了。她对你的话轻笑了一声，并快速地拍了拍你的头。[say: 我当然做到了。而且你自己也不错，你应该找个时间再来。] 你告诉她你会考虑的，并在她的花朵上休息了几分钟，然后站起来[if (hasarmor) {并穿好衣服}]。你向你的阿劳妮“女主人”告别，然后离开继续你的[day]。");
         get_player().orgasm("All");
         dynStats(DynStat.Cor(1));
         doNext(get_camp().returnToCampUseOneHour);
      }
      
      public function alrauneRimming2() : void
      {
         clearOutput();
         outputText("在她开始说话的片刻后，你感觉到她长长的黑色藤蔓开始缠绕你的身体，缠绕在你的肚子、[chest]、[legs]，甚至你的脖子上。除了脖子上的藤蔓外，所有的藤蔓都紧紧地收缩着，虽然没有紧到会伤害你的程度。看来她知道怎么用这些东西。");
         outputText("[pg][say: 好了，玩物。你可以停止前戏，开始办正事了。你的女主人要求你这么做。] 就在她说完之前，你感觉到一根藤蔓抽打在你的背上，火辣辣的疼。很痛，但绝不是难以忍受的。如果她想这样，你会很乐意配合。你把舌头" + (get_player().hasLongTongue() ? "深深地" : "") + "插入你花朵女主人极其紧致的屁眼。这位占主导地位的哥特植物发出了一声满意的声音，又抽了你一下。把你的肌肉" + (get_player().hasLongTongue() ? "更深地" : "") + "塞进去，你开始" + (get_player().hasLongTongue() ? "在她的体内轻柔地来回抽插，同时" : "") + "舔舐她的内壁。她的味道" + (!saveContent.eatenAss ? "……出人意料地好闻，以一种奇怪的方式。" : "就像你对她这种生物所期望的那样，出奇地好闻。") + " 非常泥土和植物的味道，虽然隐约有些甜味，但[if (silly) {就像刚榨出的甜菜汁。|就像人们想象的把玫瑰花剪下来，吸吮开放的茎干一样。}] [say: 好玩具。我想终于轮到你进入高潮了。]");
         outputText("[pg]随着热情的增加，摩擦你生殖器的藤蔓移动得更快了，而缠绕在你[chest]周围的藤蔓开始用它们的尖端粗暴地挑逗你的[nipples]。[if (hasvagina) {[if (hascock) { 在你[pussy]上摩擦的触手开始用力压向你，开始在你湿润的阴唇之间和肿胀的[clit]上抽插，而抚摸你[cock]的触手则缠绕在上面，然后开始来回移动。|在你[pussy]上摩擦的触手开始用力压向你，开始在你湿润的阴唇之间和肿胀的[clit]上抽插。}]|抚摸你[cock]的触手开始缠绕在上面，然后来回移动。}] 当她开始回报你的快感时，你发出了一声幸福的喘息，结果她又给了你一鞭，这次是打在你的[ass]上。刺痛感只会增强气氛，因为你更加用力地舔舐、按摩和" + (get_player().hasLongTongue() ? "用舌头操" : "亲吻") + "她植物般的屁眼。");
         doNext(alrauneRimming3);
      }
      
      public function alrauneRimming() : void
      {
         clearOutput();
         outputText("想了一会儿，你告诉她你想尝尝她的味道。但不是尝她小穴的味道。");
         outputText("[pg][say: 真的吗？这可不是大多数人的首选，但我当然不会抱怨。我允许你这么做，但在此期间我要把你当成我的玩物。成交？] 你点头同意，并[if (hasarmor) {告诉她你脱掉[armor]后就准备好了|告诉她你准备好了}]。这位花朵美人背对着你，在她的花朵中心上方用手和“膝盖”支撑着身体，向你展示她苍白的臀部。你放低身体，欣赏着她紧致的屁股和闪闪发光的小穴，后者的甜美香气非常明显。被这种气味进一步唤起性欲，你走上前去开始工作。");
         outputText("[pg]你把[hands]牢牢地放在她丝滑柔软的脸颊上，在分开它们时稍微捏了一下。把脸凑近后，你向她苍白的身体伸出[tongue]，但你并没有一开始就直奔目标。你挑逗地舔着她的会阴，然后从那里向上，绕着她紧致小穴周围柔软的皮肤转了一会儿。不打算让她久等，你很快就把舌头直接移到了主要景点，在她入口处缓慢而轻柔地来回舔舐。当你按摩她后庭的开口时，你的花朵伴侣发出了一声愉悦的咕咕声，考虑到她植物般的本性，你必须想象这只是为了获得快感。当你继续舔舐时，你注意到她阴道“花蜜”的香气越来越浓，这无言地告诉你，你做对了。");
         outputText("[pg]你稍微加大了力度，舔舐着她，舌尖刚好探入里面。她微微咯咯地笑了起来，你感觉到她的一根藤蔓在你的背上摩擦。[say: 你真是个好[boy]。我想我现在要开始了，所以做个听话的玩物，为我放松一下。] [if (hascock) {[if (hasvagina) { 当你继续用舌头按摩她的肛门时，你感觉到她的几根藤蔓开始摩擦和戳刺你越来越湿润的阴户，而你痛苦地变硬的[cocktype]则从四面八方被抚摸。|当你继续用舌头按摩她的肛门时，你感觉到她的几根藤蔓从四面八方抚摸你的[cocktype]。}]|当你继续用舌头按摩她的肛门时，你感觉到她的几根藤蔓开始摩擦和戳刺你越来越湿润的阴户。}] 看来事情要变得更加互动了。不过仔细想想，你不确定她打算对你做什么。[say: 现在准备好，小[boy]。别担心，这些藤蔓会让你爽翻天的。]");
         outputText("[pg]这大概就是她说的要准备好的事情。");
         menu();
         addNextButton("继续",alrauneRimming2);
         addNextButton("没准备好",alrauneRimmingLeave);
      }
      
      public function alrauneOral() : void
      {
         var _g:Combat;
         clearOutput();
         outputText("虚弱的女孩看着你，显得疲惫不堪且" + (get_combat().lustVictory() ? "充满渴望" : "疲倦") + "，你[if (!isnakedlower or isnaked) {展示出你的腹股沟|露出你的骨盆}][if (isgenderless) {，尽管那里什么都没有，她很好奇你打算让她做什么}]。她动作迟缓，正当她张开嘴想说话时，你把她的脸按了上去，感觉到她柔软的嘴唇紧紧贴在[if (hasCock) {[if (multicock) {一根|你的}]肉棒上|[if (hasVagina) {你的“嘴唇”上|它上面}]}]。她立刻缩了回去。[say: 真没礼貌，[sir]，我正要说话呢。] 在袭击你失败后，[i:取悦]你是她的任务，而你非常简单地传达了这一点。");
         outputText("[pg][if (!isgenderless) {她气呼呼地喘着气，但当你再次把她的脸按过去时，她还是顺从了，舔着紧贴着她的[if (hasCock) {[cock]|阴唇}]。|[say: [if (silly) {我会给你写张欠条，等|下次我会记住的，如果}]你带着能让我取悦的东西回来。]你可能没有生殖器，但你确实兴奋起来了。[say: 那你想让我怎么做？]她问道。这应该很明显，但对于一个体重和空心老木头差不多重的女孩来说，她出奇地迟钝。她会舔你的，即使这个提议看起来明显让她不悦。不管怎样，你[if (singleleg) {转过身，让你的[butt]靠着她，|跨坐在她头上，你的[butt]}]把她压进她花朵住所的花瓣里。}]尽管有抗议，这个皮肤苍白的女孩还是在你身下放松下来，用一种平静、半闭着眼睛的表情，用她的舌头在你[if (hasCock) {周围|里面}]工作。当她调整角度并探索你的[if (hasCock) {长度|裂缝}]时，她头发上芬芳的玫瑰摇晃着。很难忍住呻吟，你也没有努力去忍。然而，曼德拉草突然选择停止服务。");
         outputText("[pg][say: 够了吗？]她问道，仿佛她还有更多事情要做不是显而易见的一样。她这是在故作姿态，而你现在只想发泄出来。你再次强迫她，她却反抗起来。盯着那些紫色和靛蓝色的发丝，你决定把它们抓成一把用力拉扯。阿娜温痛苦地呜咽了一声，重新开始她的工作[if (silly and isgenderless) {，为了取悦你的屁股}]。如果不给她[i:一点]严厉的对待，她就不会好好干活。你不耐烦地猛拽她的头发，示意光舔是不够的。[if (hasCock) {你后退一步，将你的[cock]顶端抵在她的嘴唇上，不管她是准备接受插入还是只是想先说话，你都在看到她张开下巴的那一刻猛地挺进。植物娘震惊地干呕起来，眼睛睁得大大的，但她的舌头很快就开始动了起来。随着你的[hips]前后摆动，女孩呻吟起来。你的[if (cockLength<2) {微小尺寸可能让她吃了一惊，但她没花多少时间就适应并开始吸吮|[if (cockLength<6) {尺寸可能让她吃了一惊，但一旦你填满了她的整个口腔，她就很快开始吸吮|粗大尺寸超出了她的预期，但她柔软火热的喉咙回报了你的深入}]}].|你把她的脸埋进你的[if (isgenderless) {臀部|发情的阴部}]的沟壑中，施加压力让她更深入。光在你的[if (isgenderless) {[asshole]|阴道}]边缘打转是不行的。植物娘明白了你的意思，将她的触手牢牢地探入洞中，轻轻地撑开[if (isgenderless) {[if (anallooseness == 0) {紧绷而有弹性的|[if (anallooseness >= 2) {经验丰富且热情的}]}]|[if (vaginallooseness == 0) {紧绷而有弹性的|[if (vaginallooseness >= 2) {经验丰富且热情的}]}]}]入口。}]一阵令人眼花缭乱的兴奋感涌上心头，你沉浸在口交带来的满足节奏中。淫荡湿润的声音填满了沼泽原本寂静的空气，这片树林成为了你在这段充满敌意的徒步旅行中，一个充满快感和甜美香气的避风港。叹息声从女孩的鼻孔中逸出，她的服侍在你的体内激起阵阵酥麻的火花，尽管你的一部分怀疑她的花朵产生的某种令人陶醉的效果也是原因之一。撇开这点不谈，她那发出吸溜声、不断蠕动的器官确实有些技巧。你体内的又一阵悸动让你倒吸一口凉气。你呻吟着靠上前，想要更多，而她也回以呻吟，尽管声音有些沉闷，因为她还在继续服侍着你。");
         outputText("[pg]藤蔓爬上你的[legs]，让你不禁一缩，但它们只是在轻柔地抚摸和按摩你。那感觉酥麻又舒服，而当它们一路向上，缠紧你的[if (hasBalls) {[balls]|大腿}]时，那种拉扯与爱抚又激起了另一阵巨大的冲动。你再也绷不住了——你浑身颤抖，喘息不止，任由高潮猛烈地震撼着你。[if (isgenderless) {她的舌头被你高潮时阵阵痉挛狠狠绞住，而那条挣扎的触须趁着你感官极度敏感之际，仿佛施展出了更加要命的魔力。|[if (hasCock) {[if (cummediumleast) {大量的|一股股}]精液喷涌而出，全都灌进了这朵植物婊子的喉咙里|汁水从你的[pussy]里一股股地淌了出来}]，她饥渴地全部吞了下去。}] 想要不摇晃、不瘫倒实在太难了，但你硬是全程站住了，最后才踉跄着退后，瘫靠在巨大的花瓣上。那只阿爱娜温也喘着粗气，很快就沉入自己的巢穴深处继续休息了。看来是时候回家去了。");
         _g = get_combat();
         doNext(function():void
         {
            _g.cleanupAfterCombatNewPage();
         });
      }
      
      public function alrauneMeetTalk() : void
      {
         var first:Boolean;
         var _g:AlrauneScene;
         clearOutput();
         outputText("如果她不想让你害怕，那她想要什么？");
         outputText("[pg]会说话的植物拨开脸上的头发，把脸颊靠在手上。[say:哦，只是找点乐子。]她真是太透明了。[if (silly) {你敢打赌她所谓的乐子绝对不是一场激动人心的足球比赛，尽管这么说可能有些冒犯，因为没有证据表明她有脚|这个世界上有足够多疯狂的怪物，足以证明“乐子”通常是单方面的}]。");
         outputText("[pg]她叹了口气，放下了伪装。[say:如果你一定要这么不信任我，那好吧。我们直接进入正题。]她用一根藤蔓抽打你，以此来强调这一点。藤蔓没有打中，她那心照不宣的眼神说明那是故意的。");
         menu();
         addNextButton("战斗",alrauneFight);
         _g = this;
         first = true;
         addNextButton("调情",function():void
         {
            _g.alrauneFlirt(first);
         }).disableIf(get_player().isGenderless(),"没有合适的装备，你休想靠花言巧语蒙混过关。");
      }
      
      public function alrauneMeetLeave() : void
      {
         clearOutput();
         outputText("说这是第六感也好，直觉也罢，但这种情况似乎相当危险。你向她道别，转过身去，却发现身后的路被无数黑色的藤蔓挡住了。看到这一幕，你忍不住怀疑自己是不是至少有一点通灵能力。");
         outputText("[pg]植物女双臂交叉，将它们压在柔软而适中的胸部上。[say:我那么可怕吗？]");
         menu();
         addNextButton("交谈",alrauneMeetTalk).hint("也许你能靠嘴遁脱身？");
         addNextButton("战斗",alrauneFight).hint("去他妈的，暴力是人们唯一能听懂的语言。");
         addButtonDisabled(14,"离开");
      }
      
      public function alrauneMeet() : void
      {
         spriteSelect(SpriteDb.get_s_alraune());
         outputText("一股异常好闻的气味引起了你的注意。" + (FlagDict_Impl_.arrayReadInt(KFLAGS.flags,522) > 1 ? "你对诱人的植物，或者它们带来的危险，肯定不陌生。" : "") + "虽然保持警惕，但你无法否认这比通常的沼泽气味要清新得多。出于好奇，或者也许是愚蠢，你开始寻找气味的来源。");
         outputText("[pg]穿过一些灌木丛，你开始注意到不祥的黑色藤蔓正攀爬在树干上。当你经过时，其中一根藤蔓抽动了一下，这进一步加深了你不安的感觉。在前方，藤蔓的源头，很可能也是气味的源头，出现在你面前：一朵巨大的花，装饰着迷人的黑、紫、红三色图案。");
         outputText("[pg]花瓣颤动着，从花的中心爆发出了一个人形。她缓慢地直起身子，伴随着紧绷的植物纤维被拉伸的声音。她的皮肤苍白如死，与她深紫色和靛蓝色的头发形成鲜明对比。许多黑色的藤蔓缠绕着她，其中有不少似乎是从她的背部延伸出来的。");
         outputText("[pg][say:你好啊，[sir]。不要害怕，]花女说道，她深紫色的嘴唇卷起一抹微笑。");
         saveContent.metAlraune = true;
         unlockCodexEntry(2737);
         menu();
         addNextButton("交谈",askAlraune).hint("如果她说你不应该害怕，也许她很友好。");
         addNextButton("战斗",alrauneFight).hint("你不害怕，但她应该害怕。");
         setExitButton("离开",alrauneMeetLeave).hint("你很害怕。");
      }
      
      public function alrauneKill() : void
      {
         clearOutput();
         if(get_player().get_weapon().get_id() == get_weapons().DULLSC.get_id())
         {
            outputText("爱丽丝是自然的产物，但死亡本身也是一种自然力量。你高举你的[weapon]，植物女孩抬起目光与你对视。你镰刀的尖端向下划出弧线，干净利落地切开她的血肉，在下巴处切断了她的头。");
         }
         else if(get_player().get_weapon().isStaff())
         {
            outputText("你短暂地引导你的奥术能力，将[weapon]的末端猛击在爱丽丝的身体上。撞击点闪耀着光芒，她木质的内部在能量的作用下噼啪作响并燃烧起来。你收回法杖，挥舞着它击打她，释放出另一股力量，将她的身体撕裂。剩下的破碎树皮和黑色汁液一动不动，只有几声残留能量的噼啪声。");
         }
         else if(get_player().get_weapon().isBlunt())
         {
            outputText("你将[weapon]径直挥向她的头骨，轻松地击穿了它。黑色的汁液、木头碎片和几颗牙齿以壮观的方式四处飞溅。");
         }
         else if(get_player().get_weapon().isAxe())
         {
            outputText("你举起[weapon]并调整姿势，直接向下挥向她的头部。爱丽丝的头骨被劈成两半，力量之大，两边都向侧面飞去。劈柴也许能让你找到一点自豪感，也许你会带一点爱丽丝的树皮回家。");
            get_camp().cabinProgress.incrementWoodSupply(1);
         }
         else if(get_silly() && get_player().get_weapon().isKatana())
         {
            outputText("在制服了这个威胁后，你收起刀刃，在她的尸体周围漫步。这个爱丽丝战斗得很勇敢，她应该得到一个光荣的死亡。你命令她站起来，但得到的只有安静的呼吸声。你再次要求她站起来。她妥协了，在花朵里依偎着又呼吸了几次，然后才找到意志让自己站直。");
            outputText("[pg]以你作为剑之传奇的荣誉，你将带着敬意处决她。你的[hand]放在[weapon]的刀柄上，很快就听到了它开始从刀鞘中拔出的轻微咔哒声。");
            outputText("[pg]电光火石之间，你瞬间闪到了她的另一侧。爱娜温瞪大了眼睛。[say: 啊……？]");
            outputText("[pg]尘归尘，土归土。");
            outputText("[pg]你收剑入鞘，爱娜温随之化作一地碎屑。");
         }
         else if(get_player().get_weapon().isBladed())
         {
            outputText("你将武器尖端抵住她的头部，随后用[weapon]迅速刺入，利落地终结了这只爱娜温。");
         }
         else if(get_player().get_weapon().isFirearm())
         {
            outputText("你将[weapon]的枪管抵在爱娜温的头上。一枪下去，她的头骨炸裂开来，露出了你猜测是她大脑残骸的纤维状植物组织。" + (saveContent.alrauneKilled > 0 ? " 为了以防万一，你又开了一枪，将她那已经残缺不全的头部内容物彻底搅碎。" : ""));
         }
         else if(get_player().get_weapon().isWhip())
         {
            outputText("是时候结束这一切了。你充满威胁地挥动着[weapon]，以绝对的暴力重击了爱娜温。");
            outputText("[pg][say: 啊！]她发出色情的呻吟。虽然这一击重得足以让她流出少量的黑色汁液，但她似乎莫名其妙地很享受。");
            outputText("[pg]你再次发动攻击，引来她更多的呻吟。这招似乎不太管用。既然第一个想法没能杀死她，你决定掐死她。你用[hands]环住她柔软苍白的脖颈，死死掐住。");
            outputText("[pg][say: 再、再用力点，求你了，]她乞求道。妈的。也许爱娜温根本不需要呼吸，至少她们人类的那部分不需要。你脑筋一转，扭住她的头并使其倾斜，在这个别扭的角度用力拉扯，希望能把她的脖子折断。");
            outputText("[pg]令你惊讶的是，你听到了植物纤维被撕裂的吧唧声。没过多久，你就把她的头扯了下来。为了以防万一，你又抽打了尸体几下。没有呻吟声。这下应该死透了。");
         }
         else
         {
            outputText("你稍微拉伸了一下关节，准备给予致命一击。你用[weapon]迅猛而沉重地刺入爱娜温的脖颈。你腾出一只手抓住她的头，将其从身体上扯了下来。虽然她下半身的形态是空洞的，但失去头部应该足以终结她的生命。");
         }
         _temp_1.alrauneKilled += 1;
         get_combat().cleanupAfterCombat();
      }
      
      public function alrauneInsides() : void
      {
         var _g1:Combat;
         var _g:Combat;
         clearOutput();
         outputText("注意到她脊椎本该在的地方有一个洞，你仔细思考里面可能有什么潜在的价值。当她躺在那里，无法反击时，似乎没有什么能阻止你。你把[hand]伸进去，四处摸索，直到你抓住了臀部里的什么东西。与她身体的其他部分相比，这东西有些不同，所以你一拉，它就很容易地被撕了下来。");
         outputText("[pg]你检查了你拿到的东西；它看起来像是一块根，上面长着几根黑色的藤蔓。这一定就是连接她手臂上藤蔓的东西。你试图把它翻过来，但它似乎卡住了。");
         outputText("[pg]恐慌开始蔓延。你疯狂而徒劳地挥舞着[hand]，拼命希望那块根能滑落。拉扯它毫无结果。在你还没来得及想出任何复杂的计划来摆脱它之前，藤蔓就向你扑来，拍打着你的身体。阴影般的触手蜿蜒[if (isnaked) {爬过你的[skin]|钻进你的[armor]}]，在你还处于晕眩状态时，缠绕在你的四肢和躯干上。");
         if(get_player().skin.type == 3)
         {
            outputText("当它们固定下来时，收缩力越来越紧地拉扯着你无定形的身体，很快就压倒了你的表面张力，并刺入你的体内。");
            outputText("[pg]起初你惊呆了，但很快就意识到这些充满敌意的藤蔓无法附着在你这样的身体上。你擦去额头上的汗水，松了一口气。还是回营地吧，吸取教训了。");
            _g = get_combat();
            doNext(function():void
            {
               _g.cleanupAfterCombatNewPage();
            });
         }
         else
         {
            outputText("当它们固定在原位时，一种可怕的灼烧感让你陷入了疯狂[if (hasarmor) { ，你试图脱掉衣服[if(" + (get_player().get_upperGarment() == get_undergarments().SEA_SHIRT ? "true" : "false") + ") {，却发现它撕裂了你的内衣}]}]。");
            outputText("[pg]终于[if (hasarmor) {赤裸了，}]灼烧感结束了。你现在被黑曜石藤蔓覆盖，它们紧紧地拥抱着你的资产，紧紧地摩擦着你的大腿。现在没有办法把它弄下来，但也许你会找到办法的。");
            outputText("[pg]<b>获得了黑曜石藤蔓。</b>");
            _g1 = get_combat();
            getVines(function():void
            {
               _g1.cleanupAfterCombatNewPage();
            });
         }
      }
      
      public function alrauneFuckLeave2() : void
      {
         outputText("[pg]你嘲笑她并向这个哥特女孩告别，因为你宁愿去处理其他事情[if (hour > 21) {，比如睡觉}]。");
         get_combat().cleanupAfterCombat();
      }
      
      public function alrauneFuckLeave() : void
      {
         outputText("考虑了一下这个可能性，你决定就这么干。你轻轻一撑站起身来，检查了一下自己的东西是否带齐。");
         outputText("[pg][say: 等、等等！你要去哪？]爱娜温哭喊道。回家，你心想，前提是回去的路上没出什么岔子。一想到你靠得这么近却又要离开，植物女孩的根须就焦急地颤抖起来。[say: 我会做个好女孩的！我会好好求你的，所以请操我吧！]她乞求着。看着她绝望的样子，你很难不露出得意的笑容。");
         menu();
         addNextButton("好的",alrauneFuck2).hint("很好，她成功说服了你。");
         addNextButton("离开",alrauneFuckLeave2).hint("不，你要走了。");
      }
      
      public function alrauneFuck3() : void
      {
         clearOutput();
         outputText("你需要花相当大的努力才能再次平静下来，但你做到了。起身站起来后，你做了一轮伸展运动，以放松运动后的身体，并开始收拾你的东西。");
         get_combat().cleanupAfterCombat();
         if(get_player().get_armor() == get_armors().GOOARMR)
         {
            outputText("[pg]你的盔甲向前膨胀，瓦莱丽娅的脸在暴露的胸甲内部形成。[say: 你介意我……]她开始说，眼睛漫不经心地转动着。[say: 把你吸干净吗？]");
            outputText("[pg]好吧，另一种选择是让粘稠的花蜜" + (get_player().thickestCockThickness() > 3 ? "和树液" : "") + "压在你的身体上，无论回家需要多长时间。你不反对她的提议。");
            outputText("[pg]蓝宝石史莱姆迅速吞没了你的[cock]，在她粘稠的拥抱中对它进行了广泛的按摩。瓦莱丽娅颤抖着。[say: 哦，真是好东西。我不太喜欢甜食，但我偶尔喜欢这样的“款待”。]");
            get_game().valeria.feedValeria(Math.sqrt(get_player().cumQ()) + 5);
            get_output().flush();
         }
      }
      
      public function alrauneFuck2() : void
      {
         clearOutput();
         outputText("你打消了离开的念头；这里有一朵极度饥渴的花，你不能就这样白白浪费。为了缓解她急需的渴望，你俯下身子，开始揉搓她苍白的小穴。[if (silly) {你意识到，幸好她是人形的，因为天杀的，如果你最后操了一个木头植物女孩，你的老二就会被木刺扎满。打消这个念头吧。}]一根手指很容易就滑了进去，伴随着她淫荡的呜咽声。她被丰富的花蜜润滑着，但肉体本身感觉非常紧致。要么是她很久没做过了，要么就是沼泽里的居民没有世界上其他地方的人那样的装备。你抽出手指，注意到上面覆盖着她花汁的甜美香气。你不想抵挡诱惑，舔了一口，发现她的味道和闻起来一样。令人愉悦。");
         outputText("[pg]继续，你握住你的[cock]根部，开始将它与她的小穴对齐。当龟头压在她的阴唇上时，她整个身体都在颤抖。你的工具在那些嘴唇之间上下滑动，把重要的时刻再推迟一点。");
         outputText("[pg][say: 只要你想，就狠狠地操我，即使我坏掉，即使我哭泣，直到你完全满足！]她大喊着，完全被期待击溃了。甚至不需要告诉她，她就像天生一样自然地进入了顺从的角色。为了你自己，你也不再保留。");
         outputText("[pg]在一次沉重的猛插中，你将你的[hips]猛烈地撞击她的骨盆，听到她" + (get_player().thickestCockThickness() > 3 ? "咬紧牙关呻吟" : "呻吟") + "在期待已久的插入快感中。她紧致、天鹅绒般的内壁在你的肉棒上蠕动，就像" + (FlagDict_Impl_.arrayReadInt(KFLAGS.flags,2015) > 0 ? "玛莱" : "众神") + "私人林地中最柔软的花瓣。" + (get_player().thickestCockThickness() > 3 ? "撕裂植物纤维的吧唧声引起了短暂的担忧，但她翻白眼表明她正处于某种天堂中。" : "") + "发出一声幸福的叹息，你让自己习惯了这种感觉，然后开始认真地抽插。");
         outputText("[pg]你向后拉并挺起臀部，迫使爱娜温喘息。感觉棒极了，你立刻找到了自己的节奏，进入了稳定的韵律。女孩将指甲深深地掐进你的手臂，要求道，[say: <b>再用力点。</b>]");
         outputText("[pg]真没礼貌，这是你为了自己的快乐而选择的节奏。你不想迎合她的欲望，从地上抓起她的一根藤蔓，迅速绑在她的脖子上。用力一拉，你把她的要求掐断了。现在她的手只能无力地抓住你的手腕，而你则平衡着勒紧的程度。当你这样做时，她的阴道疯狂地痉挛，用更多的“花蜜”沐浴你的[cock]。难道每一个黑天鹅绒爱娜温都这么受虐狂吗？");
         outputText("[pg]你更加用力地挺动臀部，滑过她高潮内脏的混乱快感景观。这个哥特植物在窒息和作呕中尖叫着，[say: 哦，菲拉的愤怒，你没有停下来！]眼泪从她充血的[if (silly) {——充满树液的？——| }]眼睛里流出来。你自己也远远超过了边缘，当种子深深地洒在她体内时，你发出了沉重的呻吟。你的臀部不由自主地保持了一段时间的势头，帮助你的肉棒进一步喷涌。");
         outputText("[pg]松开藤蔓，你向后靠，将抽插放慢到只比轻微的摇晃多一点。爱娜温喘着粗气，向你保证这次你没有不小心把人操死。");
         get_player().orgasm("Dick");
         doNext(alrauneFuck3);
      }
      
      public function alrauneFuck(param1:Boolean) : void
      {
         clearOutput();
         outputText("你紧紧抓住爱娜温的脖子，把她[if(rooted){从花里拉出来|拉起来}]，让她仰面躺在花房上。她发出一声有些色情的呻吟。你严厉地命令她张开双腿。她犹豫了一下，转过头去，直到深色的卷发垂在脸上，部分遮住了视线。你才不信她一开始不想这样，于是再次重申了你的要求。");
         outputText("[pg][say: 是的，[sir]，]她嘟囔着，终于服从了。她那深色、盘绕的根须移开，露出了她光滑而丰满的阴户。接着，你[if (isnaked) {开始抚摸自己，直到完全勃起|露出你的阴茎，它已经因为期待而跳动着}]。鉴于她到目前为止还不太诚实，你没有立刻开始办事，而是让她好好地求你。");
         outputText("[pg]植物娘的脸上泛起一丝红晕。[say: 请操我……]她小声说道。但这还是不够坦诚，你继续等待着。爱娜温咬着嘴唇，鼓起勇气。[say: 操我，求你了！]她大声喊道。");
         outputText("[pg]这样就行了。");
         outputText("[pg]你俯下身子，爬到她的“双腿”之间。她的目光完全聚焦在你的[cock]上，这几乎诱惑着你现在就退缩，好让她更加痛苦。");
         menu();
         addNextButton("继续",alrauneFuck2);
         addNextButton("离开",alrauneFuckLeave).hint("事实上，你正该这么做。");
      }
      
      public function alrauneFlirtSex3() : void
      {
         clearOutput();
         outputText("你眨了眨眼，尽可能从高潮的强度中恢复过来，看着你深情拥抱在怀里的女主人的脸。");
         outputText("[pg][say: 干得好，我很享受，]她微笑着对你说。她看起来容光焕发，或者你还是有点头晕。[say: 现在，赶紧回家吧。]");
         outputText("[pg]你昏昏沉沉地服从了。把自己从她的花里拔出来相当尴尬，但你还是做到了。你从地上捡起你的东西，动身返回营地。");
         dynStats(DynStat.Cor(1));
         doNext(get_camp().returnToCampUseOneHour);
      }
      
      public function alrauneFlirtSex2() : void
      {
         clearOutput();
         outputText("尽管尖锐的指甲敲击你的阴茎让你产生了一丝轻微的战斗或逃跑的冲动，但你依然硬得像石头一样。在她的甜美香气和亲密的身体接触下，这并不让你感到意外。爱娜温将你的[cocks]引导到她的大腿之间，用双腿夹住[cockem]。她的臀部旋转着，同时移动着双腿，展示出似乎是训练有素的技巧。藤蔓收紧，将你更紧地拉向她，同时她捏住你的下巴，引导你的嘴唇贴上她的嘴唇。在她吻你的那一刻，一种奇怪的虚弱感蔓延了你的全身。");
         outputText("[pg]植物女孩结束了亲吻，让你在凝视她闪闪发光的紫色眼睛时感到一阵晕眩。" + (get_player().cockThatFits(3,"thickness") < 0 ? "她大腿在你巨大的肉棒" + (int(get_player().cocks.length) > 1 ? "们" : "") + "周围蠕动，突然感觉刺激多了。温暖的花蜜从她的深处流出，当她的骨盆在你的肉棒上前后移动时，留下了一条光滑的痕迹。你开始抽搐和颤抖，现在对这种感觉太敏感了。你怀疑，是因为那个吻吗？你咒骂自己没有一个足够紧凑的工具来插入她。" : "她向后翘起臀部，将你" + get_player().cockDescript(get_player().cockThatFits(3,"thickness")) + "的尖端对准她的小穴，让你脊背发凉。当她沉下去吞没你的肉棒时，她发出一声满足的叹息。在刺激下，你强迫性地颤抖，感到一种射精的欲望，抽搐着。你怀疑，是因为那个吻吗？撇开沾有药物的嘴唇不谈，她天鹅绒般的肉壁能把任何男人逼到边缘。"));
         outputText("[pg]爱娜温低语道，[say: 现在，求你的女主人榨干你。]");
         outputText("[pg]你无法拒绝她，顺从地乞求你的女主人把你榨干。");
         outputText("[pg]她咯咯地笑着叹了口气，对你的顺从感到满意。[say: 你真是个好[boy]。" + (get_player().ass.analLooseness > 0 ? "] 一根黑色的触手戳着你的后背，吓得你跳了起来。藤蔓在你微弱的抵抗下扭动，然后猛地插了进去。[say:" : "") + " 我会把你每一滴精液都榨干。]");
         outputText("[pg]当她骑着你时，花蜜顺着你的肉棒滴下。显然，她非常享受这一切。她丝滑的头发[if (tallness < 72) {随着她的动作不断扫过你的脸|在你的注视下摇晃和碰撞}]，让那美丽的花朵阵列来回摆动。专注于她头上那片草地上色彩斑斓的花瓣，是你现在能做的最好抵抗高潮的方法。然而，分心被证明是徒劳的，因为你的肌肉因快感而收缩和颤抖。" + (get_player().ass.analLooseness > 0 ? "在你的[asshole]里进进出出的粗大黑色触手故意压迫着你的前列腺，催促你爆发。" : "") + "出于本能，你挣脱了缠绕在你们俩身上的束缚，设法将手臂向上滑，环绕在她的躯干上。你紧紧拥抱着苍白的爱娜温，呻吟着直到你感到头晕目眩，同时无法控制地将你的[hips]向前猛撞。那一刻终于到来了，你射精了，" + (get_player().cockThatFits(3,"thickness") < 0 ? "把你身体里所有的东西都喷洒在她的花壁上" : "一滴接一滴地填满她的体内") + "，为你的女主人提供她华丽身姿所需的所有营养。她一边轻笑一边收紧身体。[say: 是的，真是个好[boy]。我要把你每一盎司的种子都榨干，]她保证道。");
         outputText("[pg]植物女孩更多地移动她的臀部，在你的高潮中不给你任何休息。" + (get_player().cockThatFits(3,"thickness") < 0 ? "她大腿施加的压力" : "她火热深处那黏滑、浸满精液的通道") + "让你颤抖，你的[cock]对于持续的猛攻来说太敏感、太娇嫩了。你的骨盆肌肉紧绷，你不由自主地射得比以前更猛烈。你的女主人托起你的下巴，把她的嘴唇压在你的嘴唇上。这个高潮中的吻让你平静下来。你的肌肉不再紧张，让你在拥抱她时静静地渗出剩余的精液。");
         get_player().orgasm("Dick");
         doNext(alrauneFlirtSex3);
      }
      
      public function alrauneFlirtSex() : void
      {
         clearOutput();
         outputText("顺其自然是显而易见的选择。你会和她做爱，她可以享受吸取你体液的过程。");
         outputText("[pg][say: 那就做爱吧，]她耸耸肩，似乎觉得你的选择太过平淡。这位皮肤苍白的爱娜温退回到她的花朵里，在中心腾出了一块空间。[say: 来吧，加入我。]");
         outputText("[pg]你忐忑不安地照做了，将你的[legs]滑入花朵的中心。里面相当温暖舒适，你把[feet]踩在一个坚硬的表面上，你猜测那是爱娜温地下根系的一部分。你很快就适应了这种紧凑的贴合感，将注意力转移到紧贴着你的赤裸、苍白的女人身上。");
         outputText("[pg][say: 看，没那么糟，不是吗？]她问道，抬起一只手抚摸你的[face]。近距离闻起来，她好甜，甚至连她说话时从那深紫色嘴唇间呼出的气息也是如此。你惊恐地发现，爱娜温的藤蔓已经收拢，将你们俩围在中间。[say: 嘘，现在没什么好怕的。我只是想让我们保持……亲密。]");
         outputText("[pg]她的手滑过你的[skin]，[if (hasarmor) {滑进你的[armor]，试图帮你脱掉这些遮蔽物|抚摸着她如此感兴趣的身体}]。很快，你感觉到她在揉搓你的[genitals]。她用长长的黑色指甲在[genitalem]周围轻轻敲击，露出狡黠的笑容，因为这种感觉自然而然地让你紧张起来。");
         doNext(alrauneFlirtSex2);
      }
      
      public function alrauneFlirt(param1:Boolean = false) : void
      {
         clearOutput();
         outputText((param1 ? "别着急，你又没打算跑。也许，你甚至想靠得更近些" : "对她来说，放松一下似乎很理想，而你也不排斥这个想法") + "。一个由血肉和花朵组成的哥特美人，有什么理由不喜欢呢？当你滔滔不绝地赞美她那耀眼的美貌时，她对你露出了得意的笑容，并举起一根藤蔓，在你的[face]上轻轻而性感地抚摸着你的脸颊。");
         outputText("[pg][say: 这么主动，这么情愿。希望你已经准备好了，]她若有所思地说着，她那黑曜石般的附肢蜿蜒着[if (hairlength > 0) {穿过你的[hair]，}]滑过你的肩膀。藤蔓突然缠住你的脖子，紧接着她猛地将你向前拉去。");
         outputText("[pg]你踉跄了一下，跌倒在她的花朵旁。[say: 乖，好[boy]。]");
         outputText("[pg]现在你对刚才答应的事情更加警惕了，你问她你应该准备些什么。");
         outputText("[pg]爱娜温暗自轻笑，仔细琢磨了一下。[say: 噢，看在你这么配合的份上，我让你来建议怎么取悦我。也许那样我们都能乐在其中，如果你表现好的话。]");
         if(get_player().get_lust() < 33)
         {
            get_player().dynStats(DynStat.Lust(33,DynStatOp.Eq),DynStat.NoScale);
         }
         menu();
         addNextButton("性爱",alrauneFlirtSex).hint("你会把你的体液喂给她。").disableIf(get_player().isTaur(),"这个场景需要" + (get_silly() ? "有任何品味。" : "不是半人马形态。")).sexButton(1);
         addNextButton("舔阴",alrauneCunnilingus).sexButton(2);
         addNextButton("舔肛",alrauneRimming).sexButton(-1);
      }
      
      public function alrauneFight() : void
      {
         var _loc1_:Alraune = new Alraune();
         startCombatImmediate(_loc1_);
      }
      
      public function alrauneEncounter() : void
      {
         clearOutput();
         spriteSelect(SpriteDb.get_s_alraune());
         if(!saveContent.metAlraune)
         {
            alrauneMeet();
            return;
         }
         outputText("一股甜美熟悉的气味飘散开来，你本能地开始寻找方法，以避开预料中的爱娜温的抓捕。然而不幸的是，你注意到周围的树叶中蜿蜒着无数的藤蔓。你已经走进了她的陷阱。");
         outputText("[pg]黑天鹅绒爱娜温从她的住所升起，在不远处吸引了你的目光。[say:天哪，你可真活泼！]苍白的女人喊道，她栖息在雄伟的花朵上。[say:请原谅我的用词，但我相信逃跑这件事已经被我扼杀在摇篮里了。]");
         menu();
         addNextButton("交谈",alrauneTalk);
         addNextButton("战斗",alrauneFight);
         if(get_player().get_armor().get_id() == get_armors().VINARMR.get_id() && (saveContent.questAsked & ASKEDAL) == 0)
         {
            addNextButton("藤蔓",askAlraune).hint("知道怎么解决这个问题吗？");
         }
      }
      
      public function alrauneDefeated(param1:Boolean) : void
      {
         var _g3:Combat;
         var rooted3:Boolean;
         var _g2:AlrauneScene;
         var rooted2:Boolean;
         var _g1:AlrauneScene;
         var rooted1:Boolean;
         var _g:AlrauneScene;
         var _loc3_:* = null as CoCButton;
         var _loc4_:Boolean = false;
         var _loc5_:* = null as Cock;
         var _loc6_:* = null as Object;
         clearOutput();
         if(param1)
         {
            if(get_combat().lustVictory())
            {
               outputText("无法承受你那令人畏惧的性魅力，爱娜温焦急地沉入她的花朵中，红着脸拼命地抓住自己的胯部。");
            }
            else
            {
               outputText("在你压迫性的力量下枯萎，这位花之女防御性地沉入她的住所。她看起来似乎很难坚持下去了。");
            }
         }
         else
         {
            outputText("被充分逼至极限后，花妖瘫软地跪倒，试图将她那不堪重负的躯壳拖回她的花丛居所。看着她蠕动时背部裂口露出的漆黑空洞内部，让人感到一阵不安。");
         }
         menu();
         registerTag("rooted",TagFun_Impl_.fromBool(param1));
         _g = this;
         rooted1 = param1;
         addButton(0,"操",function():void
         {
            _g.alrauneFuck(rooted1);
         }).hint("播点种。").sexButton(1);
         _g1 = this;
         rooted2 = param1;
         addButton(1,"藤蔓运动",function():void
         {
            _g1.alrauneVines(rooted2);
         }).hint("属于你们俩的藤蔓时间。可能会让她的后庭有点酸痛。").sexButton(2);
         _g2 = this;
         rooted3 = param1;
         addButton(2,"深喉藤蔓",function():void
         {
            _g2.alrauneCervicalPenetration(rooted3);
         }).hint("让她的藤蔓精准地进入子宫颈。").sexButton(2);
         addButton(3,"口交",alrauneOral).hint("你把她打倒了，现在她会继续为你服务——用嘴。").sexButton(0);
         var _loc2_:Boolean = get_silly() && get_player().tail.type == 13;
         if(_loc2_ || get_goreEnabled())
         {
            _loc3_ = addButton(4,"耳交",alrauneAural).hint("为了那场战斗，给她点颜色看看。");
            if(!_loc2_ && !hasEarfuckingTail())
            {
               if(get_player().hasCock())
               {
                  _loc5_ = get_player().cocks[get_player().thinnestCockIndex()];
                  _loc6_ = _loc5_ != null ? _loc5_.cockThickness : null;
                  _loc4_ = (_loc6_ != null ? Number(_loc6_) : 0) > 2;
               }
               else
               {
                  _loc4_ = false;
               }
               _loc3_.sexButton(1).disableIf(_loc4_,"你需要一根更细的阴茎才能操她的耳朵。");
            }
         }
         if(get_player().hasMultiTails())
         {
            addButton(5,"强行梳毛",get_game().forest.kitsuneScene.kitsuneGenericFluff).hint("让[themonster]梳理你的尾巴。").sexButton(-1);
         }
         addButton(10,"杀",alrauneKill).hint("消灭这个邪恶的生物。");
         if(get_player().get_armor().get_id() != get_armors().VINARMR.get_id())
         {
            addButton(11,"内部",alrauneInsides).hint("在她的体内寻找什么。看起来很不祥。");
         }
         _g3 = get_combat();
         setSexLeaveButton(function():void
         {
            _g3.cleanupAfterCombat();
         },"离开",14,2);
      }
      
      public function alrauneCunnilingusLeave() : void
      {
         clearOutput();
         outputText("藤蔓……你不确定她打算用它们做什么，或者她打算在哪里使用它们，但你开始犹豫了。想了一秒钟，你决定最好在为时已晚之前逃跑。当你感觉到藤蔓开始缠绕你的身体时，你绝望地做出了你能想到的唯一动作。你把头贴在她身上，尽可能用力地咬她勃起的阴蒂。一点黑色的、像树液一样的“血液”喷到了你的嘴唇和脸上，导致她极度痛苦地大叫，并放松了缠绕在你周围的藤蔓。为了逃跑，你迅速站起来收拾东西，然后逃跑，在逃跑时感觉到一根带刺的藤蔓狠狠地抽打在你的[skinfurscales]上。一旦那个花朵恶魔从视线中消失，你赶紧把所有的装备穿上，然后回家回营地。");
         doNext(get_camp().returnToCampUseOneHour);
      }
      
      public function alrauneCunnilingus3() : void
      {
         clearOutput();
         outputText("你把嘴唇从她的阴蒂上移开，开始用手指摩擦它。低下头，你在她火热、湿透的阴部入口处印下一个坚定的吻。当你分开她的阴唇并" + (get_player().hasLongTongue() ? "用你过长的舌头深深地插入她，当你故意用舌头轻轻刷过她的子宫颈时，她发出一声惊讶的愉悦喘息。" : "尽可能深地把你的[tongue]压入她体内。") + "发出一声长长而故意的呻吟。你陶醉于她女性体液的独特味道，并急切地按摩她的内壁。很快让她在愉悦中呻吟，你感觉到背部一阵刺痛。她在呻吟中嘲弄地轻笑，当你的舌头在她的体内前后滑动时，她更快地插入你。");
         outputText("[pg]出乎意料的是，没过多久你就听到她在高潮的快感中诱惑地喘息，她美味的体液涌入你的嘴和下巴，她的身体微微颤抖。然而，这似乎只鼓励了她。她把藤蔓更深、更用力地抽插进你体内，很快也给你的背部带来了一鞭。[if (hascock) { 尽管她用藤蔓猛烈地操你，你极度勃起的[cocktype]却完全被忽视了，只是无用地悬挂着，在你从其他地方获得的快感中抽搐。}]你的背部刺痛，她很快跟进了第二次打击，然后是第三次。虽然她任何一根藤蔓鞭打本身都不是特别痛苦，但刺痛感现在正在增加，因为她没有停止。随着她鞭打的增加，她的臀部开始热情地顶撞你。看来她是个十足的性虐待狂。当她的高潮消退时，她没有放慢速度的迹象。[say: 顺便说一句，别以为我是那种一次就完事的女孩。只有我说你不再是我的玩物时，你才算完。]");
         outputText("[pg]看来你要在这里待上一段时间了。被绑着和鞭打着，她用力地操你，没过多久你就感觉到自己的高潮热度在积聚，你的[if (hascock) {女性}]体液涌到她的藤蔓和你的大腿上，当[if (hascock) {你无用且被忽视的[cock]同时把你的种子射到地上，导致你|你}]大声呻吟进她的小穴。你的爱娜温女主人注意到了，但只是抽插得更快，并命令你不要停止。当你们俩以这种方式继续下去，时间长得你无法估计时，她的耐力似乎令人难以置信，你完全屈服于以这种令人愉快的方式被使用。在你们俩经历了数不清的高潮之后，爱娜温最终确实放慢了速度。不久之后，鞭打停止了，她的藤蔓也从你的身体上松开了。最后，她慢慢地一次性从你被粗暴使用的小穴中拔出。意识到她已经玩够了，你把沾满女孩精液的脸从她的胯部移开，抬头看着她。");
         outputText("[pg][say: 刚才不是很棒吗？你应该找个时间再来，我可能会习惯使用你的。] 在她旁边的花瓣上躺了一会儿，你告诉她你也许愿意找个时间再来第二回合。她对你的同意轻笑了一声，然后用比之前更活泼的语气说道。[say: 很高兴看到有人知道[his]的位置。] 在她的花瓣上安静地休息了一会儿后，你站起来[if (hasarmor) {重新穿好衣服|收拾好你的东西}]，向你的花朵“女主人”告别，然后返回营地。");
         get_player().orgasm("Vaginal");
         dynStats(DynStat.Cor(1));
         doNext(get_camp().returnToCampUseOneHour);
      }
      
      public function alrauneCunnilingus2() : void
      {
         clearOutput();
         outputText("在她停止说话后没多久，你感觉到她长长的黑色附肢开始沿着你的身体滑动。在你完全弄清楚发生了什么之前，藤蔓" + (get_player().biggestTitSize() == 0 ? "缠绕在你如果有乳房的话乳房所在的地方，挤压着你的身体" : "缠绕在你的[breasts]上，紧紧地挤压它们") + "，而尖端在你的[nipples]周围戳刺和滚动。[say: 现在更努力地工作，玩物。]当她说完这句话时，你感觉到一根藤蔓鞭打了你的背部。不足以伤害你，但足以[if (tou > 20) {刺痛|让你喘不过气来}]。而且足以让你更加兴奋。");
         outputText("[pg]既然她已经升级了她的行动，你决定也这样做。把你的嘴唇紧紧地贴在她肿胀的阴蒂上，你开始吸吮她火热的小快感结节，同时用力地用你的[tongue]在它周围滚动。你的植物女主人对这种感觉发出愉悦的咕哝声，并派出更多的藤蔓沿着你的身体滑动，这次缠绕在你的大腿和屁股上。紧紧地把你固定在原地，她轻笑着，用她的附肢尖端挠你的[ass]，同时让它们越来越靠近你的[pussy]。当你吸吮和舔舐她时，她在说话间发出轻微的呻吟，用嘲弄的声音说，[say: 现在，我的小玩物，事情对你来说要变得有点粗暴了。]");
         outputText("[pg]她的藤蔓很快到达你的阴户，起初是挠痒痒和戏弄，但很快分开你的阴唇并滑入你体内。你的舌头用力地压着她，你感觉到第一根藤蔓深深地插入你体内，只有当第二根藤蔓进入你时，你才重复你的动作，然后一次又一次，直到有足够的藤蔓把你的" + (get_player().vaginas[0].vaginalWetness > 0 ? "彻底润滑的" : "干燥且痛苦敏感的") + "[vagina]完全填满，紧紧地挤压着它们。当她开始把她的藤蔓在你的体内进进出出时，是你回报的时候了。并且在你这样做的时候，适当地沉迷于她美味甜美的花蜜。");
         get_player().cuntChange(5,true,true);
         doNext(alrauneCunnilingus3);
      }
      
      public function alrauneCunnilingus() : void
      {
         clearOutput();
         outputText("[if (singleleg) { 降低你的身体|跪下}]，你告诉她，你忍不住好奇像她这样的植物美人尝起来是什么味道。[say: 哦，是吗？那我们做个交易怎么样？我让你尽情品尝我，但在那段时间里，我可以随心所欲地把你当成我的玩物。]你急切地向她点头，植物女人拉起身体坐在她的花朵边缘。她张开双腿，向你展示她肿胀、湿润的阴户，邀请你尽情享用爱娜温的“花蜜”。准备好分享，[if (isnaked) {你|你脱下你的[armor]，}]向前爬行[if (hasarmor) {，}]并一头扎进去。");
         outputText("[pg]当你靠近她湿滑的部位时，你开始注意到一种花香。就像你闻过的最美味的花，或者像一种极其昂贵的高品质香水。尽管这种气味让你想起各种各样的事情，但常识告诉你，这显然来自她发情的植物小穴的体液。好奇味道是否和香气一样好，你把一只[hand]放在她极其苍白的大腿上部，同时在她的内侧大腿上印下一连串精致的吻，你的头正朝着目的地前进。");
         outputText("[pg]一旦你的脸离她的阴部只有几英寸，你伸出你的[tongue]，从下到上对她的阴户进行一次长长、缓慢的舔舐，当你刷过她勃起的阴蒂时，她的身体发出最轻微的颤抖。令人兴奋但并不令人惊讶的是，她的味道确实和气味一样美妙，正如你对这种生物所期望的那样，完美地甜美和充满花香。不想浪费她任何珍贵的花蜜，你一次又一次地重复着你的舌头对她的长长抚摸，品尝着她的甜美，用你自己的唾液替换所有从她身上流出的女性体液。你很快感觉到许多藤蔓沿着你的身体滑动，她用诱惑的语气说话。[say: 哦，多好的玩物。现在轮到我开始了，但一定要做一个好[boy]，继续保持。]");
         outputText("[pg]开始？用她的藤蔓？也许这就是她说的准备。");
         menu();
         addNextButton("继续",alrauneCunnilingus2);
         addNextButton("没准备好",alrauneCunnilingusLeave);
      }
      
      public function alrauneCervicalPenetration(param1:Boolean) : void
      {
         var _g:Combat;
         clearOutput();
         outputText("[pg]");
         if(param1)
         {
            outputText("你走向正在下沉的女人，猛扑过去抓住她的头发，把她从避风港里拉了出来。在你的需求得到满足之前，她得不到休息，你渴望感觉到那些藤蔓探索你最深处的地方。" + (get_combat().lustVictory() ? "在她性欲泛滥的" : "尽管她疲惫不堪、伤痕累累") + "状态下，粗暴的对待引出了一声呻吟和性感的凝视；要让她配合应该不会有什么困难。你[if (istaur) {把前腿搭在巨大的花瓣上，让下半身的胸部舒服地趴下。你增加的高度让[if (height > 72) {你高高在上地俯视着被击败的植物女孩|被击败的植物女孩看起来[if (height > 60) {[if (cor > 33) {更加可怜|毫无威胁}]，因为她半陷在她的住所里|[if (height > 52) {[if (height > 57) {甚至比你还矮|和你差不多小}]，部分原因是她半陷在她的住所里|几乎不比你自己大}]}]}]|[if (isdrider) {把最前面的腿搭在巨大的花瓣上，增加了展示你[if (!isnakedlower) {腹股沟|[genitalsdetail]}]的威胁感|[if (singleleg) {[if (isgoo) {把你粘稠的、无定形的身体洒在你们之间的巨大花瓣周围，抬起|抬起你蛇形的身体，展示}]你的[if (!isnakedlower) {腹股沟|[genitalsdetail]}]让她服务|身体前倾，跪在植物女孩住所的巨大花瓣上}]}]}]。她会把那些触手探得尽可能深，你已经决定了[if (!isnakedlower) {，并且你已经开始从你的[armor]中露出你的[genitals]，然后等待任何确认|已经}]。" + (get_combat().lustVictory() ? "由于性唤起而脸红" : "被打得屈服") + "，曼德拉草没有反抗。[say: 是的，[sir]...]");
            outputText("[pg]片刻之后，树枝和树叶沙沙作响，藤蔓[if (istaur) {沿着你的身体向你的侧腹|向你等待的洞口}]移动。[if (isvirgin) {她的那些肢体可能比阴茎还细，但你[if (haslostvirginity) {最近的}]处女膜仍然缺乏经验，你提醒女孩在表演时要小心。}]当她上下打量你[if (thickness < 50 or tone < 50) {[if (tone < 50) {柔软的|[if (thickness < 50) {轮廓分明的|宽阔的}]}]|[if (thickness < 10) {[if (tone > 20) {轻盈的|[if (thickness < 2) {死气沉沉的|纤细的}]-瘦弱的}]}]}]身体时，她充满欲望的表情让你更加渴望。[if (istaur) {你焦急地用一只[feet]敲打着，催促女孩进入|你尽可能地准备好，把[hands]放在外阴上，张开它邀请女孩}]，最后，一根光滑的、刺退去的藤蔓开始在里面蠕动。接触一开始让你吃了一惊，[if (vaginallooseness == 0) {它纤细的轮廓刚好足以轻松进入|这种入侵让你本能地收紧肌肉，尽管它纤细的轮廓太细而无法被阻挡}]，当它出乎意料地推挤你的内部时，你几乎要崩溃了。");
            outputText("[pg][say: 啊，我们到了，]黑天鹅绒说。[say:这符合你的喜好吗，[sir]？]她的语气很古怪，好像她已经把你逼到了边缘，但你向她澄清，你想要比这更深更硬的。她冷笑着，似乎接受了你的命令，她迅速地将藤蔓刺向你的子宫颈，在撞击时卷曲起来；你再次感到自己崩溃了，但在某种程度上是因为不适甚至疼痛。这种压力感觉就像你体内的某种东西开始膨胀。[say: 够深了吗，[sir]？]");
            outputText("[pg]你需要的不止这些。你感到一阵需要抓挠的瘙痒，你想要更多她的东西。");
            outputText("[pg]另一根藤蔓盘旋在第一根藤蔓上，当它凹凸不平、长满刺的长度滑入时，你吓得在你的[skinfurscales]里跳了起来。[if (isvirgin) {里面又滑又热并不能让你免于发出一声呻吟，因为你张开到了一个[if (haslostvirginity) {这个小穴没有|你没有}]经历过的程度。}]");
            get_player().cuntChange(2.5,false,true);
            outputText("随着增加的周长感觉到你柔软的肉体，一声愉悦的叹息从你的嘴唇中逃出——在那声叹息变成尖叫之前。这对触手以至少两倍于第一次推力的力量刺入，[if (isgoo) {刺穿了保护你子宫的果冻膜|克服了曾经紧紧封闭的子宫之门}]，你瞬间挺直了脊柱。[if (ispregnant) {如果神明愿意，你怀的卵会感激这种陪伴而不是抗议。}]现在越过了障碍，茎干分开并在你子宫的整个壁上延伸，它需要的每一个额外的[if (metric) {厘米|英寸}]都在你蠕动的管道中向上移动。尖刺让你痛苦地容易注意到到底有多快、有多少被喂进了你体内，一个接一个地刺向柔软的子宫颈环，然后在里面的胎儿车厢上刮擦。最后，它停了下来，但只是短暂的。藤蔓以让你喘不过气来的速度拔出，就好像你的内脏飞了出来，然后又停下来，比以前更用力地射入你神圣的房间。子宫颈反复拉伸的疼痛让你头晕目眩，导致你把[face]耷拉在[if (height>65) {曼德拉草散发着甜味的黑发上|曼德拉草[if (height<60) {娇小的胸部上|，她在一个吻中拥抱了你}]}]。沉浸在这一刻，你用手臂[if (isdrider) {和前肢}]环绕着她，释放了你对喘息和呻吟的任何克制。随后速度加快，摩擦感在反转之前移动得比它应该的远得多，这种感觉有些超现实。[if (isgoo and hasslimecore) {每一次推力都会把更多的东西推入内部，[if (ispregnant) {绕过你未出生的孩子，}]直到可怕地敲打你闪闪发光的心脏；刺激立刻震惊了你整个系统，几乎让你黏糊糊的身体变成一滩水，部分汇聚到她巨大花朵的角落和缝隙中，然后才恢复。}]");
            outputText("[pg]植物少女继续她的攻势，满怀欲望与决心地抓住你，用尽全力粗暴地抽送着你。无论你曾有的任何抵抗插入的能力都已离你而去；你那被蹂躏到青紫、被操透了的子宫颈如今完全柔软而迎合，而那前后的所有血肉[if (isgoo) {y membrane}]都仿佛在灿烂地闪烁。蔓妖看着你颤抖失控的身体咯咯地笑。[say: 愿这能满足你，]她说道。片刻之后，藤蔓比以往任何时候都更深地猛冲，[if (isgoo and hasslimecore) {一把抓住了你的核心！你的[eyes]一片空白，整个世界仿佛都在闪烁！但这惊天动地的攻击伴随着同样巨大的高潮，你完全瘫软在她身上，用[skintone]色的黏液浇了她一身|然后藤蔓在抽出时互相缠绕，每抽出一寸都变得更艰难、更缓慢。痛楚难当，突如其来的空虚令人几欲作呕，但很快运动停止了，因为藤蔓的末端已经自己打了个大结。这团带刺的植物肉块平时就大得难以通过你最深处的开口，而锋利的尖刺咬进你体内，让你更是痉挛得厉害。尽管如此，蔓妖还是用力一拉。你腹中拳头大小的凸起来回挪动，尖刺折磨着你。就在肠翻胃搅的一瞬间，那块东西猛地挣脱出来，而你的肌肉紧紧攥住新留出的空腔，感觉仿佛整个人都被翻了个底朝天}]。[if (herm) {你的[cocks]在这片混乱中猛然喷射，[if (cumhighleast) {在你甚至来不及反应之前就喷出一股股精液|溅射出精液}]。}]神志昏迷、精疲力尽，你瘫软在哥特少女的怀抱中，任由她温柔地亲吻了你，然后放开你，让你跌落在地。随后她舒适地沉入自己的居所，舔舐着藤蔓上过多的淫液[if (gore) {和血液}]。");
            outputText("[pg]好几分钟过去了，周围一片寂静，你的体力并没有完全恢复，但你还是尽力站了起来，整理好你的[armor]。你的腿感觉像果冻一样[if (isgoo) {——比平时更软——|, }]但你还得回营地，希望回去的路上不要遇到什么难缠的敌人。");
         }
         else
         {
            outputText("你大步走向正在爬行的植物女孩，[if (tailLeg) {用你的蛇尾缠住她的腰|[if (istaur) {坐在|跨坐}]在她的背上}]。你猜测是她肋骨的东西在原本应该是脊柱的黑色虚空周围凸出，使它们看起来像是一张巨口的牙齿，而从虚空中伸出了许多缠绕在她身上的藤蔓。如果她想回到她的花朵避风港，她就需要把那些触手尽可能深地刺入你的体内[if (!isnakedlower) {，你开始露出你的[vag]，然后等待她的确认}]。" + (get_combat().lustVictory() ? " 尽管她因情欲而满脸通红" : " 尽管她被打得屈服了") + "，这只爱娜温并没有反抗。[say: 是的，[sir]...]");
            outputText("[pg]片刻之后，树枝和树叶沙沙作响，藤蔓[if (istaur) {沿着你的身体向你的侧腹|向你等待的洞口}]移动。[if (isvirgin) {她的那些肢体可能比阴茎还要细，但你[if (haslostvirginity) {最新的}]处女膜仍然没有经验，你提醒女孩在表演时要小心。}]看到她脊柱裂缝中摇晃的黑色植物血肉让你感到一阵寒意，但那些黑色的茎干慢慢滑过你的[if (singleleg || isdrider) {下体|大腿}]的感觉大大缓解了你的紧张。[if (istaur) {你焦急地敲打着你的一只[feet]，催促女孩进入|你已经做好了准备，你把你的[hands]放在你的外阴上，把它张开来邀请女孩}]，最后，一根光滑的、刺已经退去的藤蔓开始在里面蠕动。接触一开始让你吃了一惊，[if (vaginallooseness == 0) {它纤细的轮廓刚好足以轻松进入|这种入侵让你冲动地收紧肌肉，尽管它纤细的轮廓太细而无法被阻挡}]，当它出乎意料地推挤你的内脏时，你几乎要瘫倒了。");
            outputText("[pg][say: 啊，我们到了，] 黑天鹅绒说道。[say:我会马上让你高潮，然后回到我的家迎接下一轮] 她的语气很古怪，好像她已经让你处于边缘了，但你向她澄清，你想要比这更深、更猛烈的。懒洋洋地躺在草地和泥土里的腿根蠕动着，女孩深吸了几口气，然后将藤蔓迅速刺向你的子宫颈，在撞击时卷曲起来；你再次感到自己要瘫倒了，但在某种程度上是因为不适甚至疼痛。这种压力感觉就像你体内的某种东西开始肿胀。[say: 这样够深了吗，[sir]？]");
            outputText("[pg]你需要的不止这些。你感到一阵需要抓挠的瘙痒，你想要更多她的东西。");
            outputText("[pg]另一根藤蔓盘旋在第一根藤蔓上，当它凹凸不平、长满刺的长度滑入时，你吓得在你的[skinfurscales]里跳了起来。[if (isvirgin) {里面又滑又热并不能让你免于发出一声呻吟，因为你张开到了一个[if (haslostvirginity) {这个小穴没有|你没有}]经历过的程度。}]");
            get_player().cuntChange(2.5,false,true);
            outputText("随着增加的粗度填满你柔软的肉体，一声愉悦的叹息从你唇间溢出——随后这声叹息变成了一声惊叫。这对触须以至少两倍于第一次抽插的力量猛刺，[if (isgoo) {刺穿了保护你子宫的果冻状薄膜|突破了曾经紧闭的子宫大门}]，你瞬间挺直了脊背。[if (ispregnant) {但愿你怀着的子嗣会喜欢这个伴儿，而不是抗议。}]现在越过了屏障，茎秆分开，沿着你子宫的整个内壁延伸，它需要的每一[if (metric) {厘米|英寸}]都在你扭动的产道中向上游走。尖刺让你痛苦地轻易察觉到到底有多快、有多少东西被送入你体内，它们一个接一个地刺痛娇嫩的子宫颈环，然后在里面的胎盘上刮擦。终于，它停了下来，但只是短暂的。藤蔓以让你喘不过气来的速度拔出，仿佛你的肠子都飞了出来，然后再次停下，比之前更用力地射入你神圣的腔室。子宫颈反复拉伸的疼痛让你头晕目眩，几乎要摔倒。然而，在身下的爱尔劳妮真正蹂躏你之前，你不会放开她。随后的节奏加快了，摩擦的感觉在反转之前移动得比它应该的要远得多，这有点超现实。[if (isgoo and hasslimecore) {每一次抽插都会把更多的东西推入体内，[if (ispregnant) {绕过你未出生的孩子，}]直到可怕地敲击你闪闪发光的心脏；这种刺激立刻震惊了你整个系统，几乎让你黏滑的身体变成一滩水，部分汇聚到她黑暗的深渊中，然后才恢复过来。}]");
            outputText("[pg]植物娘继续着她的攻势，双手深深插入泥土中，拼尽全力粗暴地抽插着你。你已经完全失去了抵抗这般穿透的能力；你那被操得红肿、熟透的子宫颈变得完全柔软顺从，而那之前和之后的所有血肉[if (isgoo) {膜}]似乎都在闪烁着耀眼的火花。爱娜温看着你颤抖失控的身体，咯咯地笑了起来。[say:希望这能让你满足，]她说道。一秒钟后，藤蔓猛地向前推进，比以往任何时候都要深，[if (isgoo and hasslimecore) {紧紧地抓住了你的核心！你的[eyes]变得空洞，整个世界似乎都在闪烁！但这惊天动地的攻击伴随着同样强烈的性高潮，你完全瘫软在她身上，用[skintone]的粘液浸透了她|然后它们在拔出时互相缠绕，变得越来越硬，越来越难拔出。这很痛，突然的空虚感几乎令人作呕，但这种运动很快就停止了，因为藤蔓的末端已经缠绕成一个巨大的肉结。在最好的情况下，这团长满荆棘的植物血肉也大得难以穿过你最深处的开口，但刺入你体内的尖刺让你更加猛烈地痉挛。尽管如此，爱娜温还是用力拉扯。你腹部拳头大小的凸起四处移动，尖刺让你痛苦不堪。在一个令人肠胃翻腾的瞬间，那团东西猛地挣脱出来，当你的肌肉紧紧收缩以填补新的空虚时，感觉就像被翻转过来一样}]。[if (herm) {在所有的混乱中，你的[cocks]爆发了，[if (cumhighleast) {在你甚至还没反应过来之前就喷出了洪流般的精液|喷出了精液}]。}]你精疲力竭，神志不清，[if (isgoo) {像一片明胶一样滑落|瘫倒在你旁边的地上}]，任由那个哥特女孩拼命地把自己拖到花朵的中心，在那里，她也屈服于疲劳。");
            outputText("[pg]好几分钟过去了，周围一片寂静，你的体力并没有完全恢复，但你还是尽力站了起来，整理好你的[armor]。你的腿感觉像果冻一样[if (isgoo) {——比平时更软——|, }]但你还得回营地，希望回去的路上不要遇到什么难缠的敌人。");
         }
         get_player().changeFatigue(20);
         _g = get_combat();
         doNext(function():void
         {
            _g.cleanupAfterCombatNewPage();
         });
      }
      
      public function alrauneBackrubTake() : void
      {
         clearOutput();
         outputText("你把[hand]伸进阴影中，探入爱娜温空洞的木质躯体。底部躺着一个肉质的<i>东西</i>。你抓住它，抽出手，轻松地将它从固定它的细小纤维上撕扯下来。");
         outputText("[pg]作为回应，爱娜温颤抖着呻吟起来，显得异常愉悦。你检查了你拿到的东西；它看起来像是一块长着几根黑色藤蔓的根。这一定就是连接她手臂上藤蔓的东西。你试图把它翻过来，但它似乎卡住了。");
         outputText("[pg]恐慌袭来。你疯狂而徒劳地挥舞着[hand]，绝望地希望这块根能滑落。拉扯它毫无作用。");
         outputText("[pg][say: 谢谢你的背部按摩，亲爱的，]哥特女人说道，一边对你冷笑，一边缩回她的花朵住所。");
         outputText("[pg]还没等你考虑是否要因为这个把戏愤怒地踩碎她的头，藤蔓就向你甩来，抽打在你的身上。暗影般的触须蜿蜒着[if (isnaked) {爬过你的[skin]|钻进你的[armor]}]，在你还晕头转向的时候，缠绕住你的四肢和躯干。");
         if(get_player().skin.type == 3)
         {
            outputText("当它们固定下来时，收缩力越来越紧地拉扯着你无定形的身体，很快就压倒了你的表面张力，并刺入你的体内。");
            outputText("[pg]起初你惊呆了，但很快就意识到这些充满敌意的藤蔓无法附着在你这样的身体上。你擦去额头上的汗水，松了一口气。还是回营地吧，吸取教训了。");
            doNext(get_camp().returnToCampUseOneHour);
         }
         else
         {
            outputText("当它们固定在原位时，一种可怕的灼烧感让你陷入疯狂[if (hasarmor) {，你拼命想要脱掉衣服" + (get_player().get_upperGarment() == get_undergarments().SEA_SHIRT ? "，却发现它撕裂了你的内衣" : "") + "}]。");
            outputText("[pg]终于[if (hasarmor) {赤裸了，}]灼烧感结束了。你现在被黑曜石藤蔓覆盖，它们紧紧地拥抱着你的资产，紧紧地摩擦着你的大腿。现在没有办法把它弄下来，但也许你会找到办法的。");
            outputText("[pg]<b>获得了黑曜石藤蔓。</b>");
            getVines();
         }
      }
      
      public function alrauneBackrubRun() : void
      {
         outputText("[pg]你被吸引的这种不祥的黑暗通常是一个非常糟糕的兆头。你转身逃跑，跌跌撞撞地迈着[feet]，滑倒在泥里。你迅速调整好姿势，但几根藤蔓猛地砸在周围的地面上。不打一架是走不掉的。");
         doNext(alrauneFight);
      }
      
      public function alrauneBackrub() : void
      {
         clearOutput();
         outputText("当然是背部按摩！她可能是一株植物，但谁不喜欢好的按摩呢？");
         outputText("[pg]爱娜温用古怪的眼神看着你，显然不知道该如何看待这个提议。考虑了片刻后，她接受了。[say: 你赢了，这正是我想要的，]她说着，举起双手，假装出一副被看穿的样子。藤蔓从她背后滑开，作为一种善意的姿态，尽管这毫无意义，因为她能以极快的速度移动它们。");
         outputText("[pg]你[walk]到她身边，尽可能让自己看起来充满魅力。你漫步到她背后，掰了掰指关节，凝视着那无尽的诅咒深渊。");
         outputText("[pg]那东西不该在那儿。");
         outputText("[pg]女人转过头，对你的迟疑感到担忧。[say: 怎么了？我确实有点空洞，但那只是空隙而已。]");
         outputText("[pg]你眨了眨眼，试图摆脱那种怪异的感觉，专注于揉捏她的肩膀。她肩膀上的肉苍白、柔软，触感极佳。她的头发也如丝般顺滑，散发着令人愉悦的香气，给整个体验营造了良好的氛围。如果不是她身体上的裂缝，这对你来说会很放松。没有脊椎，只有一个巨大的裂口，边缘排列着你猜测是木制肋骨——或者牙齿的东西。希望那些不是牙齿。她的体内是一片黑暗。");
         outputText("[pg]你看到里面有什么东西。");
         menu();
         addNextButton("拿走它",alrauneBackrubTake).hint("它可能很有价值，或者可能让她感到不适。");
         addNextButton("逃跑",alrauneBackrubRun).hint("为什么坏兆头总是这么明显？");
      }
      
      public function alrauneAural() : void
      {
         var _g:Combat;
         var _loc4_:int = 0;
         var _loc5_:* = null as Cock;
         var _loc6_:* = null as Cock;
         var _loc7_:* = null as Object;
         var _loc8_:* = null as Object;
         clearOutput();
         registerTag("tailbrain",TagFun_Impl_.fromBool(hasEarfuckingTail() || get_player().tail.type == 13 && get_silly()));
         registerTag("kitsunebrain",TagFun_Impl_.fromBool(get_player().tail.type == 13 && get_silly()));
         var _loc1_:Boolean = false;
         var _loc2_:Boolean = false;
         var _loc3_:Boolean = false;
         if(get_player().hasCock())
         {
            _loc4_ = get_player().thinnestCockIndex();
            registerTag("auralcock",TagFun_Impl_.fromString(get_player().cockDescript(_loc4_)));
            registerTag("auralcocktype",TagFun_Impl_.fromString(get_player().cockMultiNoun(_loc4_)));
            _loc5_ = get_player().cocks[_loc4_];
            _loc6_ = _loc5_ != null ? _loc5_ : null;
            _loc1_ = (_loc6_ != null ? _loc6_.get_cockType() : null) == CockTypesEnum.HUMAN;
            _loc7_ = _loc6_ != null ? _loc6_.hasKnot() : null;
            _loc2_ = _loc7_ != null && Boolean(_loc7_);
            _loc8_ = _loc6_ != null ? _loc6_.cockLength : null;
            _loc3_ = 7 <= (_loc8_ != null ? Number(_loc8_) : 0);
         }
         outputText("你抓住柔软苍白的爱娜温，[if (rooted) {将她举起并压在|将她推到}]她的住所[if (rooted) {旁边|上}]。女孩挣扎着转头看着你，嘴角露出一丝冷笑。[say: 打算因为我反抗你而给我点颜色看看吗？] 那[if (tailbrain) {充满期待地摇摆着的[tail]|[auralcock] [if (!exposedcrotch) {在你的[armor]里鼓胀着|在你的手中}]}]就是她需要的所有确认，尽管如果她认为自己会享受这一切，那她就大错特错了。你[if (!tailbrain && !exposedcrotch) {将你的肉棒从束缚中释放出来，并}]决定用你的工具迅速地[if (tailbrain) {[if (kitsunebrain) {蹭|扫}]|拍打}]一下，抹去她的冷笑。");
         outputText("[pg]爱娜温气呼呼地回应，你开始用你的[claw]沿着她的耳轮滑动，然后戳了戳耳道。她皱起眉头，似乎有些困惑，但当你将你的[if (tailbrain) {[tail]|dick}]插入，拉扯着维持这一切的纤维时，她恍然大悟。植物女孩痛苦地呻吟着，而你则继续向里按压，直到最后无论她是由什么材料制成的，都屈服了。突然间，你深入了她的头骨几[if (metric) {厘米|英寸}]；里面温暖而海绵状，粘稠的汁液在入侵物周围渗出。女孩的呼吸变得不规律，眼睛开始变得呆滞，随着你越插越深，她的脸也因痛苦而抽搐。");
         outputText("[pg][say: 啊-啊……] 她努力拼凑着词句。你的[if (tailbrain) {[if (hasstinger) {针状突起|[if (kitsunebrain) {狐妖器具|坚固的工具}]}]|" + (_loc1_ ? "[auralcock]" : "[auralcocktype]") + "}]抽动了一下，爱娜温突然尖叫起来。[say: 你-你好[if (kitsunebrain) {毛茸茸的|[sir]}]，对园艺感兴趣吗？] 令人惊讶的是，随后传来了一声充满情欲的喘息。你慢慢地抽出，直到只剩下尖端留在里面，她的反应似乎是松了一口气。当然，这只是短暂的，因为片刻之后，你以比第一次更猛烈的力度将其重新强行插入。");
         outputText("[pg][say: 啊——亲爱的[if (kitsunebrain) {狐妖|[sir]}]，我的矮牵牛花！] 她惊呼道。[if (tailbrain && hasstinger) {你的毒素从耳朵注入似乎有奇怪的效果。}]你花时间思考着这种感觉。感觉就像你把自己埋在了浸满糖浆的糊状面包里。你猛地一推，把她的头拉向你，[if (tailbrain) {用你的[tail]刺入里面|" + (_loc3_ ? "撞击里面" : "完全没入") + "你的[auralcock]}]。这一次，她没有说话，只有语无伦次的嘟囔和随机的面部抽动，黑色的汁液从她的鼻子里流出来。[if (kitsunebrain) {最后，你开始扭动你毛茸茸的附肢，在她的脑子里到处摩擦！|你继续操着这个可怜女孩的大脑，无意义的动作持续着，[if (silly) {把糊状物变成了……更糊的糊状物|把脆弱的纤维切碎}]。}]");
         if(get_silly() && get_player().tail.type == 13)
         {
            outputText("[pg]你[furcolor]的毛发触及她脑海的每一个角落，上演着最伟大的狐妖恶作剧。经过几分钟充满活力的耳交后，你拔了出来，问这只植物狐狸有什么话要说。爱娜温起初茫然地盯着，然后摇晃着从她背上长出的藤蔓。[say: 我——哦不，我的尾巴太不蓬松了！狐妖长老们会非常不满的！] 她哭喊道。[say: 狐妖[Sir]，我求求你，在村里人发现我之前，把我的尾巴弄蓬松吧。] 竟然傲慢地向你提出这种要求！她必须承受尾巴不够蓬松的耻辱，因为这是她自己的缺点，而不是你的责任。眼泪从她的眼眶里流下。[say: 狐妖不是这样的！给狐妖弄蓬松尾巴就是我全部的蓬松尾巴。]");
            outputText("[pg]她崩溃地哭泣着。然而，事情还没有结束，因为她可以通过梳理[i:你的]尾巴来取悦你。这让她的脸亮了起来。[say: 哦，狐妖的尾巴，[sir]，我真是太感激了！]爱丽丝温柔地抚摸着你毛茸茸的尾巴，以极大的热情拥抱并嗅着它们。你花时间纠正了她的技巧，不久之后，她就成了一个合格的梳毛工。[say: 我真是太感谢狐妖了，]她一边擦去眼泪一边说。[say: 请收下这个！]她手里拿着她所有显而易见的贵重物品——这是对你为她所做的一切的唯一公正回报。你接受了，然后踏上了你的旅程。");
         }
         else if(hasEarfuckingTail())
         {
            outputText("[pg]尽管她看起来已经麻木了，但你依然被你探索的成果所吸引。她的花朵闻起来依然像以前一样甜美，她的藤蔓也不可预测地扭动着，但这一切背后的心智似乎已经没有反应了。你改变了角度，戳了戳其他地方。有时，你会听到一声尖叫或打嗝，但除此之外就没什么了。也许你已经享受了所有能享受的乐趣。你的[tail]滑了出来，上面粘着黏稠的汁液，你好奇地舔了舔。它真的像糖浆一样，不过有一种独特的味道在你的喉咙里挥之不去。");
            outputText("[pg]你耸了耸肩，觉得这里没什么可做的了，于是丢下了这株软绵绵的植物。你简单地扫视了一下，发现没什么有价值的东西可以带走，于是你出发继续你的[day]。");
         }
         else
         {
            outputText("[pg]你享受着强奸她头骨的自由，加快了[hips]的抽插速度。当你撕碎那海绵状的黏液时，黏稠的汁液在你的肉棒上拖拽，她耳朵处的皮肤和内皮的压力就像一个真正的肉洞一样试图留住你。她花朵的甜美香气和你精力充沛的抽插发出的淫荡声音充满了空气。你调整了姿势，进一步加快了速度，即使你让她失去了知觉，也能听到爱丽丝的作呕声和呻吟声。最后，一声沉重、狂喜的叹息从你的肺里飞出，高潮燃烧着你的身体[if (cumQuantityHighLeast) { 并从她的另一只耳朵里喷涌而出}]。");
            outputText("[pg]这个软绵绵的植物婊子茫然地盯着你旁边的空地，[if (silly) {精液脑|装满精液的大脑}]无法处理任何想法。你心满意足地拔了出来" + (_loc2_ && _loc3_ ? "，你的[knot]因此撑开了一个更大的洞，" : "") + "然后丢下了她，现在你释放了压力，准备继续你的[day]。");
            get_player().orgasm("Dick");
         }
         _g = get_combat();
         doNext(function():void
         {
            _g.cleanupAfterCombatNewPage();
         });
      }
   }
}

