package classes.scenes.areas.highMountains
{
   import classes.BaseContent;
   import classes.CoC;
   import classes.DebugMenu;
   import classes.Player;
   import classes.SelfDebug;
   import classes._FlagDict.FlagDict_Impl_;
   import classes.globalFlags.KFLAGS;
   import classes.internals.Utils;
   import classes.items.WeaponLib;
   import classes.parser._Parser.TagFun_Impl_;
   import classes.saves.SelfSaver;
   import classes.saves.SelfSaving;
   import classes.scenes.Camp;
   import classes.scenes.Inventory;
   import classes.scenes.api.Encounter;
   import classes.scenes.areas.highMountains._WingedSpearScene.SaveContent;
   import coc.view.CoCButton;
   import flash.Boot;
   
   public class WingedSpearScene extends BaseContent implements SelfDebug, SelfSaving, Encounter
   {
      
      public var saveVersion:int;
      
      public var saveName:String;
      
      public var saveContent:SaveContent;
      
      public var globalSave:Boolean;
      
      public function WingedSpearScene()
      {
         if(Boot.skip_constructor)
         {
            return;
         }
         globalSave = false;
         saveVersion = 1;
         saveName = "wingedspear";
         saveContent = new SaveContent(null,null,null);
         super();
         SelfSaver.register(this);
         DebugMenu.register(this);
      }
      
      public function saveToObject() : Object
      {
         return saveContent;
      }
      
      public function reset() : void
      {
         saveContent.encountered = false;
         saveContent.examined = false;
         saveContent.takenSpear = false;
      }
      
      public function onAscend(param1:Boolean) : void
      {
         reset();
      }
      
      public function load(param1:int, param2:*) : void
      {
         Utils.extend(saveContent,param2);
      }
      
      public function get_debugName() : String
      {
         return "飞翼矛";
      }
      
      public function get_debugHint() : String
      {
         return "";
      }
      
      public function fallenKnightYes() : void
      {
         clearOutput();
         saveContent.encountered = true;
         outputText("决定冒险后，你准备好迎接这注定是一场体力活的挑战。");
         if(get_player().get_inte() + get_player().get_spe() < 50)
         {
            outputText("[pg]但你大大高估了自己的能力。当你偏离常走的小路，靠近边缘的那一刻，风以它最猛烈的一阵狂风抓住了你。来不及稳住自己，你绊了一下，失去了平衡，发现[if (singleleg) {你重心所在的地方|你的脚下}]除了空气什么都没有，随着天空翻转，岩石和泥土松动的可怕声音伴随着你纯粹的恐慌。[if (canfly) {飞行的本能立刻发挥作用，但时间太短，你无法转身拍打翅膀|你试图挥舞手臂寻找抓手，任何抓手，}]然后你的视线就被冰冷、坚硬的石头占据了。");
            if(!(get_silly() && get_player().get_tou() > 100))
            {
               if(get_player().isGoo())
               {
                  outputText("[pg]即使你没有骨头可以折断，撞击也会从你身上撕下黏液块，下一次撞击会压扁你的头，让你在峡谷中翻滚，几乎失去知觉，当你最终在潮湿阴冷的底部停下来时，你已经失去了所有的控制和凝聚力。");
                  outputText("[pg]透过麻木的疼痛，你能感觉到你的身体正在融化，你落入的小溪正在一点一点地将你活活消化，而你甚至无法阻止它。你已经没有力量了，你周围的世界是如此昏暗，你产生的任何想法或命令都不比蜡烛微弱的闪烁更有用。在这里，在你旅程愚蠢的终点，你缓慢而坚定地滑入深深的遗忘之中。");
               }
               else
               {
                  outputText("[pg]痛苦穿透了你，撞击让你对下一次撞击无能为力：头部受到重击，夺走了你剩余的感官，只留下血腥味和令人痛苦的眩晕，追逐着你，向下，向下，向下，进入峡谷的深渊。");
                  outputText("[pg]你甚至不知道自己是否还在下落，或者翻滚，或者已经在底部的某个地方停了下来。一切都变得如此黑暗和安静，连空气都拒绝像以前那样充满你的肺部，现在只给你微弱的意识闪烁，直到它们也消失在深深的遗忘中。");
               }
               get_game().gameOver();
               return;
            }
            outputText("[pg]当第一块岩石在撞击下碎裂时，碎屑和灰尘刺痛了你的眼睛，第二块岩石让你从它倾斜的表面弹开，自由落体般地坠入峡谷深处，咆哮的黑暗像一条巨大的蛇一样升起，露出毒牙，要将你整个吞噬……");
            outputText("[pg]……泥巴。砾石、污泥和泥巴。当你醒来时，你吐着口水，有什么东西在地上叮当作响。那是你的牙齿吗？不，只是一块鹅卵石。你把自己从现在标志着这座山是你合法财产的勇者形状的印记中拔出来，轻轻一推重新对齐你的下巴，拍拍自己，最后扫视了一下这个区域。没有饥饿的蛇。只有一条");
         }
         else
         {
            outputText("[pg]就在你靠近边缘的时候，风释放了它最猛烈的一阵狂风，迫使你转向后退，等待一个更平静的时刻，直到你能更安全地降落。寻找第一个落脚点，你开始下降。");
            outputText("[pg]尽管狂风依旧喧嚣，但向下的路途却安然无恙。最终，你带着完好无损的装备和自己，踏上了布满鹅卵石的底部，并在那里环顾四周。一");
            get_player().changeFatigue(15);
         }
         registerTag("exhausted",TagFun_Impl_.fromBool(get_player().get_inte() + get_player().get_spe() >= 50));
         outputText("一条蜿蜒缓慢的小溪在孤独中潺潺流淌，尽管周围大多数岩石的光滑程度表明它并不总是这么小。溪流两旁零星点缀着斑驳的植被——海绵状的苔藓、刷子般的花朵、结满浆果和长满荆棘的灌木——在其中一丛灌木下，你发现了你来这里的目的：原来是一套盔甲。");
         outputText("[pg]甚至是一套完整的骑士礼服，在它完好的时候可能价值不菲，当你[if (singleleg) {滑行|走}]近它时，你这样猜测。它也不仅仅是被丢弃在这里。它死去的主人仍然躺在里面，钢铁上无数的凹痕和裂口暗示着[if (exhausted) {他一定是如何遭遇这种命运的。如果摔落还不够，那么直接刺穿他脖子的长矛肯定足够了。|他一定是个没洗过澡的业余爱好者，才会死于区区坠落伤害。不过，直接刺穿他脖子的长矛可能也在他的死亡中起到了一点小作用。}]");
         outputText("[pg]盔甲本身已经无法修复，但那把武器可能还能派上用场。");
         fallenKnightMenu();
      }
      
      public function fallenKnightTake() : void
      {
         clearOutput();
         outputText("[if (!examined) {这是一件相当沉重、修长的武器，直立着，矛头深深地扎在地下。}]你握住木制矛柄，用力拉了几下，[if (strength < 45) {慢慢地}]将它从泥土、骨头和钢铁中拔出来，然后拿在手里掂量检查。它和看起来一样重。");
         outputText("[pg]矛刃可能需要打磨一下，但看起来仍然很锋利，并且木头几乎没有像你预期的那样，在风吹日晒中暴露了[if (examined) {这么|天知道多}]久而产生的风化痕迹。当你用附近的小溪洗去泥土时，你发现矛头底部有一对较短的垂直突出物，就像横杆一样[if (intelligence < 20) {。你绞尽脑汁回想这种长矛的名字，因为你确信以前听说过，但什么也没想起来。无论如何，|，表明这把长矛是带翼长矛的一种。不过}]在准备将其带走的过程中，你没有发现其他奇特之处。");
         saveContent.takenSpear = true;
         fallenKnightMenu();
         get_inventory().takeItemMenuless(get_weapons().WINGSPR,fallenKnightMenu);
      }
      
      public function fallenKnightNo() : void
      {
         clearOutput();
         outputText("看起来不值得冒险。你再次顶着风，继续沿着小径向山里走去，但在你决定返回营地之前，没有再发现任何特别值得注意的东西。");
         doNext(get_camp().returnToCampUseOneHour);
      }
      
      public function fallenKnightMenu() : void
      {
         registerTag("takenspear",TagFun_Impl_.fromBool(saveContent.takenSpear));
         registerTag("examined",TagFun_Impl_.fromBool(saveContent.examined));
         menu();
         addNextButton("检查",fallenKnightExamine).disableIf(saveContent.examined,"你已经做过了。");
         addNextButton("拿走长矛",fallenKnightTake).disableIf(saveContent.takenSpear,"你已经做过了。");
         addNextButton("离开",fallenKnightLeave);
      }
      
      public function fallenKnightLeave() : void
      {
         clearOutput();
         outputText("你[if (exhausted) {在从他身上收集了你能收集的东西后，让这位倒下的骑士安息|[if (examined) {就此打住，决定不再打扰这位倒下的骑士|[if (takenspear) {除了刚刚拿走的武器外，对这位倒下的骑士不再有任何兴趣|决定让这位倒下的骑士完全安息}]}]}]。");
         outputText("[pg]在前方不远处，峡谷向上延伸，化作错落有致的瀑布水雾，而周围的斜坡看起来都不太适合攀爬回去。你选择了阻力最小的路线，[if (exhausted) {顺着水流向下走|躺在水里，双臂交叉，任由自己被岩石间的水流冲走}]，离开这些山脉，踏上返回营地的路。");
         get_camp().returnToCampUseOneHour();
      }
      
      public function fallenKnightExamine() : void
      {
         clearOutput();
         outputText("他是个高个子，但相当瘦削，身上没剩多少肉了，白色的骨头和斑驳的棕褐色毛皮一样随处可见。从[if (nofur) {他锋利牙齿的样子来看，它可能|他头骨的形状来看，它一定}]是某种啮齿类兽人。盔甲上也有一个供尾巴穿过的洞，周围还有一些额外的保护，但尾巴本身什么也没留下，无法让你进一步了解这个人曾经是谁或什么。");
         outputText("[pg]盔甲也帮不上忙。这是一套全身甲，一整套抛光的板甲，现在已经开始生锈，没有任何纹章或装饰。实用、严肃、沉重。不过，仍然没能保住穿戴者的命。上面布满了令人印象深刻的宽大变形凹痕，大概是坠落造成的，但除此之外，在金属上留下印记和撕裂的深深伤口看起来并不像是岩石造成的。图案太统一，太相似，而且太准确地瞄准了薄弱环节。肯定是爪痕" + (FlagDict_Impl_.arrayReadInt(KFLAGS.flags,2042) > 0 ? "。哈比似乎是一个合理的罪魁祸首，" + (Boolean([13,28].contains(get_player().lowerBody.type)) ? "通过小心地将你自己的脚上凶猛的爪子与其中一组刺穿痕迹对齐，你几乎可以证实这一点" : "它们凶猛的爪子很符合你在这里看到的情况") + "。支持这一结论的是" : "，尽管你不确定是什么样的生物造成的，因为你注意到") + " 胸甲上还有一些又长又细的划痕，一直延伸到他的头部。");
         outputText("[pg]头盔已经松动，面罩也不见了，而且[if (takenspear) {你拔出长矛的地方现在在他的脖子上留下了一个大缺口；甚至连骨头都被切断了|脖子上的缺口被一根沉重、修长的长矛彻底贯穿，长矛现在像一根病态的旗杆一样直立着。在扎入地面之前，它甚至切断了一点骨头}]。");
         outputText("[pg]他身上没有[if (takenspear) {剩下什么有价值的东西|其他什么有价值的东西}]了。");
         saveContent.examined = true;
         fallenKnightMenu();
      }
      
      public function fallenKnight() : void
      {
         clearOutput();
         outputText("又一阵风吹过你的脸颊，让你正在行走的峡谷边缘小径变得相当难走。你等狂风过去，让视线游离了片刻，这时下方有什么东西闪闪发光，吸引了你的注意。你小心翼翼地避免从陡峭的边缘掉下去，伸长脖子，刚好能看到那闪光的光源部分埋在谷底一片坚硬、多结的灌木丛中。那是金属，经过抛光，而且是一大块。但距离太远，看不清更多细节。");
         outputText("[pg]你瞥了一眼天空——你" + (FlagDict_Impl_.arrayReadInt(KFLAGS.flags,2042) > 0 ? "知道你靠近鹰身女妖的领地，虽然你觉得能看到一只在远处头顶飞过，但她似乎对你还不感兴趣" : "看到过比普通鸟类更大的阴影在远处头顶飞过，虽然现在你找不到它们的踪迹，不管它们是什么") + "。如果不被打扰，你应该能爬下去。[if (canfly) {而且必须是爬下去——风这么变幻莫测，如果你尝试飞行，你更有可能在下一座山面上[if (silly) {摔成肉饼|撞得粉碎}]，而不是完好无损地降落。不过，那里|那里}]有一组不错的岩石突出物和石窝，应该能提供相当舒适的落脚点和抓手。");
         outputText("[pg]你要尝试去调查吗？");
         doYesNo(fallenKnightYes,fallenKnightNo);
      }
      
      public function execEncounter() : void
      {
         fallenKnight();
      }
      
      public function encounterName() : String
      {
         return "wingedspear";
      }
      
      public function encounterChance() : Number
      {
         if(saveContent.encountered)
         {
            return 0;
         }
         return 0.3;
      }
      
      public function debugMenu(param1:Boolean = true) : void
      {
         get_game().debugMenu.debugCompEdit(saveContent,new SaveContent(null,null,null));
      }
   }
}

