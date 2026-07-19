package classes.scenes.places.telAdre
{
   import classes.CoC;
   import classes.DynStat;
   import classes.Output;
   import classes.PerkLib;
   import classes.Player;
   import classes.StatusEffects;
   import classes._FlagDict.FlagDict_Impl_;
   import classes.globalFlags.KFLAGS;
   import classes.internals.Utils;
   import classes.items.ConsumableLib;
   import classes.scenes.Camp;
   import classes.scenes.Inventory;
   import classes.scenes.places.TelAdre;
   import coc.view.CoCButton;
   import flash.Boot;
   import haxe.IMap;
   
   public class BakeryScene extends TelAdreAbstractContent
   {
      
      public function BakeryScene()
      {
         if(Boot.skip_constructor)
         {
            return;
         }
         super();
      }
      
      public function talkToBakerAboutPoundCake() : void
      {
         var price:Number;
         var name:String;
         var _g:BakeryScene;
         clearOutput();
         outputText("牛头人又哼了一声，[say: “烘焙师特制”磅蛋糕很简单……把黄油和起酥油混合，然后加糖和鸡蛋。放一点盐和需要的干料，比如水果或巧克力。再加点牛奶。放进窄烤盘里，烤很长时间。不过没法大批量做面糊，因为没有哪种口味特别受欢迎，所以得做很多种类。因此要四颗宝石；不像批量做的东西那么便宜。想来一块吗？]");
         menu();
         _g = this;
         name = "pound cake";
         price = 4;
         addButton(0,"是的",function():void
         {
            _g.nomnomnom(name,price);
         });
         addButton(1,"否",talkToBaker);
      }
      
      public function talkToBaker() : void
      {
         clearOutput();
         outputText("当你靠近时，牛头人哼了一声，但还是挥手示意你进厨房。[say:干啥？]他问道，耐心地看着你。[saystart]想听听烘焙的事？");
         if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,242) >= 4)
         {
            outputText("还是你想下特别订单？");
         }
         outputText("[sayend]");
         outputText("[pg]尽管他外表粗犷，语言能力也不佳，但他似乎很乐意谈论他的工作。");
         menu();
         addButton(0,"布朗尼",talkAboutBrownies);
         addButton(1,"饼干",talkAboutCookies);
         addButton(2,"纸杯蛋糕",talkAboutCupcakes);
         addButton(3,"甜甜圈",talkAboutDoughnuts);
         addButton(4,"磅蛋糕",talkToBakerAboutPoundCake);
         addButton(5,"狐狸浆果",talkAboutFoxBerry);
         addButton(6,"环尾无花果",talkAFig);
         addButton(7,"老鼠可可",talkAboutMouseCocoa);
         addButton(8,"红河根",talkAboutRoot);
         addButton(14,"算了",talkBakeryMenu);
      }
      
      public function talkBakeryMenu() : void
      {
         clearOutput();
         outputText("你要和谁说话？[pg]");
         var _loc1_:String = "女服务员";
         if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,607) > 0)
         {
            _loc1_ = "鲁比";
         }
         menu();
         addButton(0,"面包师",talkToBaker);
         var _loc2_:Function = get_telAdre().rubi.rubiIntros();
         if(_loc2_ != null)
         {
            addButton(1,_loc1_,_loc2_);
         }
         if(isWinter())
         {
            if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,643) > 0)
            {
               outputText("[pg]你可以趁卡米午休的时候和她“发泄一下”，反正你已经知道结果会怎样了！[pg]");
               addButton(2,"卡米",get_game().xmas.xmasMisc.approachKamiTheChristmasRoo);
            }
            else
            {
               outputText("[pg]你可以把之前遇到的那个身材火辣的袋鼠人女服务员叫过来——也许你能赢得她的芳心。[pg]");
               addButton(2,"袋鼠人",get_game().xmas.xmasMisc.approachKamiTheChristmasRoo);
            }
         }
         outputText("[pg]你在面包店看到一个泡泡糖粉色皮肤的女孩，她正走来走去，热切地试图向人们分发传单。她的\"制服\"更像是一件黄色的比基尼，下半身的腰部有一圈褶边。如果这还不足以让她在人群中脱颖而出，那她的头发绝对可以；那是一头蓬松卷曲的深粉色乱发，一直垂到屁股，头顶上还戴着一顶巨大的纸杯蛋糕帽子。[pg]");
         if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,1047) != 0)
         {
            addButton(3,"弗罗斯蒂",get_game().telAdre.frosty.approachFrosty);
         }
         else
         {
            addButton(3,"粉发女孩",get_game().telAdre.frosty.approachFrosty);
         }
         addButton(14,"离开",bakeryuuuuuu);
      }
      
      public function talkAboutRoot() : void
      {
         clearOutput();
         outputText("[say: 红河根是一种根，但不是红色的。小商贩们从很远的一条河边把它们带过来，他们管那条河叫“Civappu”。用来酿啤酒很好，但如果陈酿太久就会太辣。所以就用来做食物了。如果生吃会让你头晕，还会让你变得又红又毛茸茸的。因为来自远方，所以稍微贵一点。]");
         menu();
         addButton(0,"是的",buyRoot);
         addButton(1,"否",talkToBaker);
         if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,1296) < 0)
         {
            FlagDict_Impl_.arrayWriteInt(KFLAGS.flags,1296,0);
         }
         var _loc1_:IMap = KFLAGS.flags;
         FlagDict_Impl_.arrayWriteInt(_loc1_,1296,FlagDict_Impl_.arrayReadInt(_loc1_,1296) + 1);
      }
      
      public function talkAboutMouseCocoa() : void
      {
         clearOutput();
         outputText("[say: 老鼠可可来自湖的温暖一侧，靠近森林边缘。就像名字说的那样，老鼠们以前种了很多，也吃了很多。不过现在没有老鼠了……现在很难弄到，而且很贵。得从湖边的农夫那里买；她会派人去采集。我们也是从她那里买牛奶的。每年都越来越少……很快就得涨价了。现在一把要十颗宝石。]");
         menu();
         addButton(0,"是的",buyCocoa);
         addButton(1,"否",talkToBaker);
      }
      
      public function talkAboutFoxBerry() : void
      {
         clearOutput();
         outputText("[say: 我甚至都不知道这些是从哪来的，]烘焙师承认道。[say: 有一天送货的突然出现，教我怎么准备和售卖它们。果味很重，但很受欢迎。做成糖果或者好好煮熟的话，吃一整天也不会长出什么奇怪的东西。但要是生吃，就会长出狐狸的部位，看起来就像[if (urtaexists) {那位守卫队长女士和}]妓院里的那个家伙一样。还要花五颗宝石买一个吗？]");
         menu();
         addButton(0,"是的",buyFoxBerry);
         addButton(1,"否",talkToBaker);
      }
      
      public function talkAboutDoughnuts() : void
      {
         var price:Number;
         var name:String;
         var _g:BakeryScene;
         clearOutput();
         outputText("[say: 甜甜圈很有趣，] 粗犷的面包师笑着说。[say: 把湿酵母、牛奶、糖、鸡蛋、少许盐和起酥油混合在一起。有时也加可可。把面团捣碎直到光滑，发泄一整天做纸杯蛋糕的挫败感。然后放在有盖的碗里发酵。如果是原味的，就把它卷小切开，如果是果酱甜甜圈，就做成圆圈；盖上盖子再次发酵。] 他分别模仿了把绳子的两端连在一起和画一个圆圈的动作。");
         outputText("[pg][say: 放在热油里炸到金黄酥脆，然后用锅铲捞出来。用裱花袋插进果酱甜甜圈里，像给母牛配种一样把果酱射进去……抱歉。]他皱了皱眉。[say: 做这个比做其他东西花的时间长，甚至比纸杯蛋糕还长。因为种类太多，没法大批量做。所以甜甜圈卖得贵一点——要五颗宝石。不过，揉面、油炸、塞馅料还是挺好玩的。守卫换班的时候卖得特别好；他们一来就会把甜甜圈托盘扫荡一空。想在下一波高峰期开始前买一个吗？]");
         menu();
         _g = this;
         name = "doughnuts";
         price = 5;
         addButton(0,"是的",function():void
         {
            _g.nomnomnom(name,price);
         });
         addButton(1,"否",talkToBaker);
      }
      
      public function talkAboutCupcakes() : void
      {
         var price:Number;
         var name:String;
         var _g:BakeryScene;
         clearOutput();
         outputText("[say: 纸杯蛋糕很费功夫，] 面包师低着长长的脸，用低沉的声音说道。[say: 面糊需要黄油、糖、面粉和鸡蛋；得搅拌很长时间，慢慢加东西。把糖渍浆果切碎，切成小块放进面糊里。在一个特殊的平底锅里烤面糊。]");
         outputText("[pg][say: 然后，] 他叹了口气，[say: 做糖霜。软化黄油，加入牛奶、糖和浆果汁，搅拌混合物。搅拌很长时间。搅拌到手臂酸痛。等纸杯蛋糕出炉后涂在上面。]");
         outputText("[pg][say: 太受欢迎了，太便宜了。总是在做纸杯蛋糕，没有时间试验新配方。想涨价，但纸杯蛋糕是最畅销的，顾客会生气的。] 一声铃响。他又叹了口气，走到烤箱前打开它，然后拿出一盘没有涂糖霜的纸杯蛋糕。[say: 看到了吗？现在正在做。你要买一个吗？四……不，我想还是三颗宝石。]");
         menu();
         _g = this;
         name = "cupcakes";
         price = 3;
         addButton(0,"是的",function():void
         {
            _g.nomnomnom(name,price);
         });
         addButton(1,"否",talkToBaker);
      }
      
      public function talkAboutCookies() : void
      {
         var price:Number;
         var name:String;
         var _g:BakeryScene;
         clearOutput();
         outputText("面包师向你点点头。[say: 饼干很好。饼干很容易做，只需要黄油、糖、面粉、鸡蛋和无花果。把面糊混合好，弄成小圆圈，把无花果捣碎，把无花果放在圆圈的中心，把另一个圆圈放在上面。烤饼干。也可以在面糊里放任何东西，做成巧克力饼干或其他任何东西，但无花果最受欢迎，也最便宜。] 他自豪地笑着，指着四颗宝石的饼干展示区。你要买一个吗？");
         menu();
         _g = this;
         name = "cookies";
         price = 4;
         addButton(0,"是的",function():void
         {
            _g.nomnomnom(name,price);
         });
         addButton(1,"否",talkToBaker);
      }
      
      public function talkAboutBrownies() : void
      {
         var price:Number;
         var name:String;
         var _g:BakeryScene;
         clearOutput();
         outputText("[say: 喜欢我们的布朗尼吗？] 面包师问道。[say: 配方可是历代大厨代代相传的。最初的制作者是在一家客栈发明的，为了让客人们能装在午餐盒里带走。]");
         outputText("[pg]他继续说道。[say: 我不会告诉你完整的配方。用老鼠可可、新鲜鸡蛋和蜜蜂蜂蜜制成的糖——加热并过滤后制成。没有变形效果。加一撮盐，混合均匀，放入平底锅，烘烤。很容易大量制作；很受欢迎。想要一个吗？三颗宝石。]");
         menu();
         _g = this;
         name = "brownies";
         price = 3;
         addButton(0,"是的",function():void
         {
            _g.nomnomnom(name,price);
         });
         addButton(1,"否",talkToBaker);
      }
      
      public function talkAFig() : void
      {
         clearOutput();
         outputText("[say: 无花果树？来自沼泽边缘，]烘焙师解释道。[say: 长在其他垃圾树的缝隙里，慢慢把它覆盖，直到那棵树被封在里面死掉。丛林游侠以前会拿无花果干跟我们交易，后来恶魔袭击，他们不来了，我们就用种子自己种。一开始挺难的，但现在它们能适应沙漠了。很好吃。用营火做不好——得在烤箱里烤很长时间，不然你就会长出条纹尾巴和狡猾的面具，守卫们都会怀疑你，到处跟着你。我亲眼见过。买一个五颗宝石。]");
         menu();
         addButton(0,"是的",buyFig);
         addButton(1,"否",talkToBaker);
      }
      
      public function rubiTreat() : void
      {
         clearOutput();
         outputText("当你靠近柜台时，新鲜出炉的甜点散发出的浓郁香气萦绕在你的鼻尖。有太多选择了，你觉得你不可能只挑一个。你甚至想把它们全买下来，虽然你知道这不可能，但这并不能阻止你的目光在货架上游移，想象着这些甜点在你嘴里融化的感觉。当然有糖果，虽然你对糖果永远吃不够，但当你的目光落在那些布朗尼上时，你几乎能尝到舌尖上的巧克力味。那些饼干也吸引了你的注意力，再往后是甜甜圈和蛋糕——");
         var _loc1_:Array = ["沉重的脚步声","高跟鞋的咔哒声","蹄子的得得声"];
         outputText("[pg]衣物的摩擦声和背后传来的" + _loc1_[Utils.rand(int(_loc1_.length))] + "告诉你，你身后已经排起了长队。尽管[if (cor < 50) {这只会让你更加慌乱|你并不怎么在意}]，你还是决定不了要买哪种甜点。");
         outputText("[pg]就连面包师也慢吞吞地走到柜台前，[if (tallness > 72) {抬起头|[if (tallness < 60) {低下头|越过柜台}]}]看了你一眼。尽管他外表野兽般粗犷，但你还是拼命忍住才没对着他角间那顶毛茸茸的帽子笑出声来。[say: 想要点什么，[boy]？]");
         outputText("[pg]一根粗壮的手指指着饼干展示柜，虽然这并没有让你的决定变得更容易，但你知道你必须买点什么。你掏出你的[inv]，试图再拖延一会儿，但里面[if (gems < 1) {空空如也|[if (gems == 1) {只有一颗孤零零的宝石在滚动|传来稀疏、可怜的叮当声}]}]，让你的心沉得几乎和你的情绪一样快。");
         outputText("[pg]这阵骚动甚至把鲁比也吸引过来了，但当[rubi ey]意识到堵住队伍的人是你时，你捕捉到了[rubi eir]唇边转瞬即逝的微笑。");
         outputText("[pg][say: 怎么了？] [rubi ey]问道，然后对面包师点了点头。你尽力配合，羞涩地向[rubi em]展示你[inv]里的东西，并尽可能多地吸着鼻子解释你一定是在路上弄丢了宝石。");
         outputText("[pg][say: 那太糟糕了。] 鲁比的一只手[if (hashair) {揉了揉你的头发|拍了拍你的头}]，" + (get_game().telAdre.rubi.saveContent.hadSex ? "当你想到[rubi ey]以前也这么做过时，你努力不让自己[if (corruption < 33 && hasplainskin) {脸红|扭动}]。幸运的是，鲁比没有给你足够的时间[if (cor < 40) {让自己尴尬|让你的想象力失控}]，[rubi ey]就塞了" : "虽然有点尴尬，但你很快发现自己在[rubi eir]抚摸下放松了下来。这种感觉如此惬意，以至于当[rubi ey]终于停下来塞给你") + "一把宝石时，你甚至觉得有些遗憾。[say: 给自己买点好吃的，好吗？]");
         var _loc2_:Player = get_player();
         _loc2_.set_gems(_loc2_.get_gems() + 5);
         statScreenRefresh();
         get_output().flush();
      }
      
      public function nomnomnom(param1:String, param2:Number) : void
      {
         clearOutput();
         if(get_player().get_gems() < param2)
         {
            if(get_player().isChild() && get_game().telAdre.rubi.rubiAffection() >= 30)
            {
               rubiTreat();
            }
            else
            {
               outputText("你没有足够的宝石来点这个！");
               menu();
               addButton(0,"继续",checkBakeryMenu);
            }
            return;
         }
         var _loc3_:Player = get_player();
         _loc3_.set_gems(_loc3_.get_gems() - int(param2));
         statScreenRefresh();
         if(param1 == "eclair")
         {
            outputText("你递过去10颗宝石，要了一份“特制闪电泡芙”。在柜台工作的半人马得意地");
            if(get_player().get_tallness() <= 52)
            {
               outputText("低头");
            }
            else if(get_player().get_tallness() >= 84)
            {
               outputText("抬头");
            }
            outputText("看着你，从柜台后面藏着的一个盒子里拿出一个充满奶油的糕点。它是温热的……非常温热，当你走向桌子时，你努力稳住双手，深吸着它“特制”的香气。第一口简直是人间美味，满足了你甚至不知道自己有的渴望。当你吸干每一滴奶油并吃完甜甜的酥皮时，你忍不住发出愉悦的呻吟。牛头人的体液沾满了你的手指，但你并不介意把它们舔得干干净净。随着你现在体内燃烧的欲望，你甚至试图炫耀一番。虽然你让几个");
            if(get_player().get_femininity() >= 75)
            {
               outputText("男性裤裆鼓起");
            }
            else if(get_player().get_femininity() <= 25)
            {
               outputText("女性扭动身体");
            }
            else
            {
               outputText("其他顾客扭动身体，裤裆鼓起");
            }
            outputText("，但他们中没有一个人试图采取行动。真遗憾。");
            dynStats(DynStat.Lust(20 + get_player().lib / 10));
            get_player().minoCumAddiction(10);
            get_player().refillHunger(20);
         }
         else
         {
            outputText("你递过去" + Utils.num2Text(param2) + "颗宝石，拿到了你的" + Utils.cnName(param1) + "。片刻之后，你坐在桌旁，舔着指尖上的糖渣，想知道他们是怎么把食物做得这么好吃的。");
            if(param1 == "doughnuts")
            {
               outputText(get_player().modTone(0,2));
               outputText(get_player().modThickness(100,1));
               if(Utils.rand(3) == 0 && get_player().butt.rating < 15 && (get_player().hunger > 25 || !get_survival()))
               {
                  outputText("[pg]当你重新站起来时，你的[ass]晃动的幅度比你预想的要大一点。");
                  var _temp_1:* = get_player().butt;
                  _temp_1.rating = _temp_1.rating + 1;
               }
               if(Utils.rand(3) == 0 && get_player().hips.rating < 15 && (get_player().hunger > 25 || !get_survival()))
               {
                  outputText("[pg]吃完后，你发现你的步态改变了。你的臀部变宽了吗？");
                  var _temp_2:* = get_player().hips;
                  _temp_2.rating = _temp_2.rating + 1;
               }
               get_player().refillHunger(25);
            }
            else if(param1 == "cookies")
            {
               outputText(get_player().modTone(0,1));
               outputText(get_player().modThickness(100,2));
               if(Utils.rand(3) == 0 && get_player().hips.rating < 20 && (get_player().hunger > 25 || !get_survival()))
               {
                  outputText("[pg]吃完后，你发现你的步态改变了。你的臀部变宽了吗？");
                  var _temp_3:* = get_player().hips;
                  _temp_3.rating = _temp_3.rating + 1;
               }
               get_player().refillHunger(20);
            }
            else if(param1 == "brownies")
            {
               outputText(get_player().modThickness(100,4));
               if(Utils.rand(2) == 0 && get_player().hips.rating < 30 && (get_player().hunger > 25 || !get_survival()))
               {
                  outputText("[pg]吃完后，你发现你的步态改变了。你的[hips]绝对变宽了。");
                  var _temp_4:* = get_player().hips;
                  _temp_4.rating = _temp_4.rating + 2;
               }
               get_player().refillHunger(20);
            }
            else if(param1 == "cupcakes")
            {
               outputText(get_player().modTone(0,4));
               if(Utils.rand(2) == 0 && get_player().butt.rating < 30 && (get_player().hunger > 25 || !get_survival()))
               {
                  outputText("[pg]当你重新站起来时，你的[ass]因为增加了不少额外的重量而晃动着。");
                  var _temp_5:* = get_player().butt;
                  _temp_5.rating = _temp_5.rating + 2;
               }
               get_player().refillHunger(20);
            }
            else if(param1 == "pound cake")
            {
               outputText(get_player().modTone(0,2));
               outputText(get_player().modThickness(100,2));
               if(Utils.rand(3) == 0 && get_player().butt.rating < 25 && (get_player().hunger > 25 || !get_survival()))
               {
                  outputText("[pg]当你重新站起来时，你的[ass]晃动的幅度比你预想的要大一点。");
                  var _temp_6:* = get_player().butt;
                  _temp_6.rating = _temp_6.rating + 1;
               }
               if(Utils.rand(3) == 0 && get_player().hips.rating < 25 && (get_player().hunger > 25 || !get_survival()))
               {
                  outputText("[pg]吃完后，你发现你的步态改变了。你的[hips]变宽了吗？");
                  var _temp_7:* = get_player().hips;
                  _temp_7.rating = _temp_7.rating + 1;
               }
               get_player().refillHunger(50);
            }
         }
         menu();
         addButton(0,"继续",checkBakeryMenu);
      }
      
      public function nephilaMouseRepeatDecline() : void
      {
         clearOutput();
         get_player().slimeFeed();
         outputText("你向朱丽安解释说你现在很忙，只是想打个招呼。她露出了明显失望的表情，但还是接受了你的决定，最后拍了拍你的肚子，然后道别，退回面包店的角落去\'观察路人\'。");
         menu();
         addButton(0,"继续",checkBakeryMenu);
      }
      
      public function nephilaMouseRepeatAccept() : void
      {
         clearOutput();
         get_player().slimeFeed();
         outputText("你欣然接受了朱丽安的邀请。她开心地咯咯笑着，拍着手，然后把你安排在面包店的中央，周围摆满了桌子。食物被端了出来，很快，桌子就在大量糕点和其他各种烘焙食品的重压下发出吱呀声。[pg]");
         outputText("朱丽安安排了三名面包师助手来喂你，然后开始揉捏和抚摸你和你那奇妙的肚子。[pg]");
         outputText("[say: 我的天哪，[name]，是我的眼睛欺骗了我，还是你比我们上次见面时更大了？]她问道。你现在嘴里塞着三个独立的大号玛德琳蛋糕，所以你无法用言语回答她。相反，你呻吟着，热情地揉着肚子的两侧。[pg]");
         outputText("朱丽安似乎把这当作一个信号。她绕着你的肚子走，从你的视线中消失了，但当她开始啃咬你敏感的肚脐，并用她粉红色的鼻子蹭着肚脐的顶部边缘时，你清楚地意识到了她在哪里。[pg]");
         outputText("[say:好吧，看来有人很享受我们的小午餐约会，]朱丽安说道，声音因为兴奋而气喘吁吁，沙哑不堪。[say:如果我做了任何你不赞成的事情，请随时<b>说出来</b>。][pg]");
         outputText("话虽如此，鼠娘停止了折磨你的肚脐，转而爬上你");
         if(get_player().thickness <= 33)
         {
            outputText("被撑薄的肚子。[pg]");
         }
         else if(get_player().thickness <= 66)
         {
            outputText("塞满触手的肚子。[pg]");
         }
         else
         {
            outputText("柔软、塞满触手的肠胃。[pg]");
         }
         outputText("当她越过你肚子的顶端，完全进入视线时，[if (hasbreasts) {她趴在你身上，头枕在手臂上，淫荡地微笑着，欣赏着你的[allbreasts]，看着你吃得越来越多。|她趴在你身上，头枕在手臂上，淫荡地微笑着，看着你吃得越来越多。}][pg]");
         outputText("她看着你吃东西，一只手抚摸着你那不断膨胀的肾形隆起，你的胃漂浮在你那被史莱姆胀满的子宫边缘，慢慢地丰满起来，从你那已经大得惊人的肚子的整体轮廓中凸显出来。[pg]");
         outputText("[say: 哎呀，看看你多能吃，]朱丽安说道。她翻了个身仰面躺着，把她那挺翘的屁股贴向你并伸了个懒腰，给你表演了一番。[say: 我死在这里都愿意，[name]。你的肚子真的是最漂亮的。我只能想象充满生命力是什么感觉。][pg]");
         outputText("朱丽安的声音变得轻柔起来。你能看出她正在想自己无法生育的事情。面包师们终于完成了用食物把你塞到快要撑破的任务，随着你的一声精神指令，你让你的孩子们操纵面包店里的人，鼓励他们离开。店里几乎立刻就空了，作为对朱丽安善意的回报，你让你的孩子们去分散她的注意力。[pg]");
         outputText("[say: 哎呀！]朱丽安惊呼道，你的一根触手顺着你隆起的腹部滑了上去，缠住了她。她拿起触手亲了一口，同时转过头来看你，在这个过程中，那团蠕动的触手被挤压在她娇小的B罩杯乳房之间。[say: 看来我们午餐约会吃下的糖分把你的小家伙们都唤醒了。][pg]");
         outputText("她朝你眨了眨眼，你的触手爬到你身上，将她包围，并钻进她宽松的紫色衣服下面。[pg]");
         outputText("[say: 哦。哦，天哪——哦，<b>嗯！</b>]朱丽安在触手蜂拥而上时说道，起初只是挑逗她的各个孔洞，然后迅速转变为填满它们。第一根爬上你肚子的触手慢慢地推入她的喉咙，鼠娘抚摸着它粗壮、黏滑的躯体，感受着它在她脸上抽插时的脉动。当另外两只寄生虫插入她的小穴，探索她的子宫并使她的肚子鼓起时，她呻吟出声。你不满足于只看着你的朋友享受乐趣，你紧贴着肚子，抬起一条[leg]，然后伸出手，用伸直的手指平贴着你那脑袋大小的阴蒂打圈揉搓。当你刺激自己时，包裹着你极度肿胀的爱蕾的触手展开了，在你的手周围渗出黏液，引导你的动作以最大化你的快感。[pg]");
         outputText("几分钟后，你终于达到了高潮，并让你的触手加快了对你鼠娘朋友的侵犯速度。随着它们加快速度，她在持续的高潮中尖叫。当你觉得朱丽安已经受够了时，你让你的孩子们撤退。她在你身上呻吟和抽搐，沉浸在被彻底操到失去理智的余韵中。过了一会儿，她恢复了理智，翻过身来再次看着你，尾巴在她身后上方来回甩动。[pg]");
         outputText("[say: 你和你的孩子们真的很懂得怎么对待女孩子，]她说。她向前挪动，捧起你的脸，在你的嘴唇上亲吻，把她身上沾满的黏液涂在你的脸上。之后，她从你的肚子上跳下来，最后拍了拍你的屁股，准备回家去看看她的丈夫。在离开之前，她在面包店的门口停了下来。[pg]");
         outputText("[say: 谢谢你，[name]，]她说道。她的眼睛湿润而闪亮。[say: 我真的很需要这个。照顾好你那些可爱的宝宝们。看到你们都健康快乐，对我来说意义重大。][pg]");
         outputText("说完，朱丽安便消失了。随着面包店的员工和顾客开始陆续回到店里，他们对刚才发生的事情一无所知，而你也动身返回营地。[pg]");
         dynStats(DynStat.Lib(3),DynStat.Sens(3),DynStat.Cor(3));
         var _temp_1:* = get_player();
         _temp_1.thickness = _temp_1.thickness + (1 + Utils.rand(2));
         get_player().orgasm("Vaginal");
         doNext(get_camp().returnToCampUseOneHour);
      }
      
      public function nephilaMouseFirstDecline() : void
      {
         clearOutput();
         get_player().slimeFeed();
         outputText("你向鼠娘解释说你现在很忙，没时间陪她。她从你身边退开时，尾巴垂了下来，紧张地用手梳理着长发，扯了扯摇晃的银色耳环，羞怯地笑了笑。");
         outputText("[say:抱歉，]她说道。[say:只是，你怀孕的样子看起来太美了，而且，那个……也许下次吧？][pg]");
         outputText("你不置可否地点了点头，鼠娘退后一步，移开视线，显然很尴尬。解决了这件事，你回到了手头的任务上。[pg]");
         menu();
         addButton(0,"继续",checkBakeryMenu);
      }
      
      public function nephilaMouseFirstAccept() : void
      {
         clearOutput();
         get_player().slimeFeed();
         outputText("你欣然接受了鼠人的提议，她喜笑颜开，绕到你身侧拉住你的一只手，想把你拽向一张桌子。你有些好笑，向你的触手宝宝们发出心灵感应，让它们帮帮她。和玛莱的大多数智慧生物一样，这个鼠娘的心智极易受到络新妇魔法的暗示，因此，她完全没有意识到，一层厚厚的黏滑触手正缠绕在她的脚边，托着你的肚子，让你得以移动。对她来说，她只是在拉着一个大腹便便的孕妇，把她拖到桌边。她完全没有想过，移动那个女人是多么不可能的事，或者这种移动是怎么发生的。[pg]");
         outputText("当老鼠把你“安顿”好，让你侧坐在一个特别高的凳子上，肚子在你身前和上方高高隆起时，她问你想吃什么。还没等你回答，她就跑开了，脚跟不停地颠着，把菜单上的东西每样都点了一份。当她回来时，身后跟着三个面包师，端着一大堆美味的烘焙食品，她皱起了眉头。你的肚子太大了，即使你背对着面包店的桌子坐着，它也凸出到了最近的三张桌子上。[say:嗯，]她说。她转向被强征来的助手，让他们把面包店附近其他空闲的桌子安排好。他们毫无怨言地照做了，你很快就被一座名副其实的食物山包围了。[pg]");
         outputText("鼠娘切开一盘刚烤好的布朗尼，迅速递给你一块美味、冒着热气的点心。你张开嘴，她把它放在你的舌头上，就在你吞下第一块的时候，她又回去为你切另一块布朗尼。在她的悉心照料下，你很快就吃光了整盘布朗尼。然后她转向一盘羊角面包，在每个上面涂上一大块蜂蜜黄油，然后把它们送到你唇边。随着她喂给你越来越多的食物，她开始说话了。[pg]");
         outputText("[say:看你饿的！]她说，花点时间用欣赏的手抚摸你的肚子。[say:吃吧，亲爱的。毕竟，你要为你的宝宝们着想。你怀孕多久了？你期待有多少个小家伙？顺便说一下，我是朱丽安。很高兴认识你！][pg]");
         outputText("你作为回报介绍了自己，并含糊地谈论了你的“怀孕”，编造了一些关于玛瑞斯腐化的事情来解释你的体型。如果她对你关于后代数量和性质的问题的含糊回答感到困扰，朱丽安并没有表现出来。相反，她喋喋不休地继续说着，对你阿谀奉承，并给你塞满食物。当你吃完鼠娘点的所有东西时，尽管你的胃口通常很大，但你的胃开始感到紧绷，朱丽安啧啧称奇，跑去为你点面包店提供的所有东西的“第二份”。你呻吟着，双腿不停地交叉，你巨大的阴蒂因需要而跳动，而你的胃因容纳你的盛宴而疼痛。当朱丽安回来时，她要求面包师的一名助手代替她喂你，这是一种出于假定特权的轻率保证。和以前一样，特尔阿德雷面包店的员工非常乐意满足她的要求。[pg]");
         outputText("[say: 我希望你不要觉得我太冒昧，[name]，]朱丽安说，[say: 但是我能多花点时间陪陪你的小家伙们吗？我太喜欢孩子了！]你点点头，嘴里塞满了香草慕斯，要求她分享一点关于她自己的事情作为报酬。[pg]");
         outputText("[say: 我？]朱丽安问。[say: 嗯……我真的不是什么特别的人，但在恶魔来之前，我爸爸是一个相当重要的大地主。我丈夫罗曼尼和我带着爸爸的一些旧珠宝作为抵押搬到了特尔阿德雷，开始了新的生活。罗曼尼现在是一个相当重要的法师。他工作很努力，而且<b>非常</b>忠诚，尽管……尽管……你几乎可以说生活是完美的！][pg]");
         outputText("朱丽安不久前移到了你的肚子前面，因此，你看不见她。不过，当她开始抽泣时，你肯定能听到她的声音，当她用鼻子蹭你那葡萄柚大小的凸出肚脐时，你的大腿在巨大的肚子下面摩擦着。幸运的是，她似乎没有听到你透过嘴里塞满的厚厚一块芝士蛋糕发出的呻吟声，因为她温暖的眼泪的瘙痒折磨着你被拉伸的肚脐的敏感肌肤，让你濒临崩溃。[pg]");
         outputText("[say: 几乎……几乎完美！……我们真的太……太幸福了！而且，嗯……呃……哦，去莉希丝的吧！]朱丽安说。她扑向你的肚子，试图用双臂环抱你巨大的身躯，不停地揉捏着。[say: 这不公平，[name]！你那么，那么<b>大</b>，而我那么，那么<b>小小小小</b>。我想要它！这个肚子！为什么玛瑞斯的腐化给了你这么多，却从我这里夺走了这么多？][pg]");
         outputText("当她抱怨和哭泣时，小鼠娘把你的肚子越挤越紧，直到最后，你的孩子们做出了回应，从你的小穴里渗出来保护你。当它们成群结队地越过你，向那个不知情的女孩涌去，压在你的肚子上时，你的大脑因快感而变得一片空白。你的肚子在吃掉面包店一半的存货后塞得满满的，以至于你实际上可以在你隆起的孕肚上部轮廓上看出它的形状。你呻吟着试图控制它们，但太迟了。你肚子前面的压力消失了，你听到一声惊讶的吱吱声，接着是砰的一声，朱丽安被拖到了地上。不久之后，鼠娘开始呻吟，你很清楚你的孩子们在做什么来“保护”你。[pg]");
         outputText("听着这只过于热情的鼠娘被触手塞满每一个可用的孔洞，你听了几分钟，同时拼命地用意念命令你的孩子们停止攻击，并削弱特尔阿德雷面包房里其他有知觉生物的感知，以免他们对正在发生的事情感到震惊，你终于设法阻止了这场触手狂欢。当你的孩子们向你涌来，把一个滴着粘液、筋疲力尽的朱丽安扔到你阴道口触手可及的地方时，你做好了准备，去做需要做的事情。[pg]");
         outputText("[say: 哦！]朱丽安说道。她颤抖着膝盖站了起来，然后瘫倒在你的背上，双腿呈弓形，气喘吁吁。[pg]");
         outputText("[say: 那些是你的宝宝吗？]她问道。你准备好发动攻击，让她永远闭嘴，但她却出人意料地笑了起来，从背后虚弱地抱住你。[say: 真是不可思议，[name]，]她说道，[say: 多么调皮的小捣蛋鬼！你一定对它们感到很无奈吧！]她不停地笑着，擦去眼角的泪水，紧紧贴着你，把她身上沾满的黏液涂抹在你的身体上。[pg]");
         outputText("[say: [name]，]她说着，用她的口鼻蹭着你的后颈。[say: 如果我吓到你了，我很抱歉。只是，看到你充满生机的样子，让我感到很高兴。罗曼尼和我——我们不能有孩子。当恶魔袭击爸爸的农庄时，我正怀着我的第一胎，腐化渗透进了我的身体。那些小粉红，嗯……它们没能活下来。从那以后我就一直不孕了。][pg]");
         outputText("朱丽安从你身边退开，恢复了力气。[say: 很高兴认识你，]她说道。[say: 如果你碰巧在镇上看到我，请随时打招呼！]说完，鼠娘和当班的面包师结了账，然后离开了，最后向你挥了挥手。筋疲力尽又吃得饱饱的你，决定回到营地。也许你以后还会再在面包店见到朱丽安？[pg]");
         dynStats(DynStat.Lib(3),DynStat.Sens(3),DynStat.Cor(3));
         var _temp_1:* = get_player();
         _temp_1.thickness = _temp_1.thickness + (1 + Utils.rand(2));
         FlagDict_Impl_.arrayWriteInt(KFLAGS.flags,2925,1);
         get_player().orgasm("Vaginal");
         doNext(get_camp().returnToCampUseOneHour);
      }
      
      public function nephilaMouseAgain() : void
      {
         clearOutput();
         get_player().slimeFeed();
         outputText("你让你的宝宝们推着你");
         if(get_player().statusEffectv1(StatusEffects.ParasiteNephila) >= 20)
         {
            outputText("复制品那庞大、占据了整个房间的身躯穿过拥挤的面包店。微弱的魔法嗡嗡声掩盖了面包店地砖的隆隆声，维持你运作的结界“鼓励”周围的人让路，为你那塞满黏液的肚子腾出空间。[pg]");
         }
         else if(get_player().statusEffectv1(StatusEffects.ParasiteNephila) >= 15)
         {
            outputText("庞大、占据了整个房间的身躯穿过拥挤的面包店。微弱的魔法嗡嗡声掩盖了面包店地砖的隆隆声，维持你运作的结界“鼓励”周围的人让路，为你那塞满黏液的肚子腾出空间。[pg]");
         }
         else
         {
            outputText("像推车一样大的肚子穿过拥挤的面包店。微弱的魔法嗡嗡声掩盖了面包店地砖的隆隆声，维持你运作的结界“鼓励”周围的人让路，为你那塞满黏液的肚子腾出空间。[pg]");
         }
         outputText("当你靠近时，朱丽安微笑着。她挥了挥手，同时用空闲的手拉扯着银耳环。当你在她面前安顿好后，她冲上前去，隔着你的[armor]在你巨大肚子的侧面印下纯洁的一吻，然后揉了揉被亲吻的地方。[pg]");
         outputText("[say: 为了好运，]她说道。她移到你的躯干旁，靠在你的手臂侧面。[say: 很高兴见到你，[name]——你和你的小家伙们该不会有时间一边吃糕点喝茶一边聊天吧？]鼠娘满怀希望地看着你，尾巴来回摆动。[pg]");
         menu();
         addButton(1,"委婉拒绝",nephilaMouseRepeatDecline);
         addButton(2,"接受",nephilaMouseRepeatAccept);
         if(get_player().statusEffectv1(StatusEffects.ParasiteNephila) >= 15 && FlagDict_Impl_.arrayReadInt(KFLAGS.flags,2923) == 1)
         {
            addButton(3,"治愈不孕",get_game().nephilaCovenFollowerScene.nephilaMouseCureInfertility).hint("既然女巫团已经完全接受你作为她们的女王，你觉得你也许能说服她们帮助朱丽安解决不孕的问题。");
         }
         else
         {
            addButtonDisabled(3,"治愈不孕","如果你能说服女巫团中的女儿们完全接受你作为她们的女王，也许有一天你能说服她们帮助朱丽安解决不孕的问题。现在，你只能等待。");
         }
      }
      
      public function nephilaMouse() : void
      {
         clearOutput();
         get_player().slimeFeed();
         outputText("你让你的宝宝们推着你");
         if(get_player().statusEffectv1(StatusEffects.ParasiteNephila) >= 20)
         {
            outputText("复制品那庞大、占据了整个房间的身躯穿过拥挤的面包店。微弱的魔法嗡嗡声掩盖了面包店地砖的隆隆声，维持你运作的结界“鼓励”周围的人让路，为你那塞满黏液的肚子腾出空间。[pg]");
         }
         else if(get_player().statusEffectv1(StatusEffects.ParasiteNephila) >= 15)
         {
            outputText("庞大、占据整个房间的身躯穿过拥挤的面包房。微弱的魔法嗡嗡声掩盖了面包房地砖的隆隆声，维持你机能的魔法“鼓励”周围的人让路，为你那装满粘液的肚子腾出空间。[pg]");
         }
         else
         {
            outputText("像推车一样大的肚子穿过拥挤的面包店。微弱的魔法嗡嗡声掩盖了面包店地砖的隆隆声，维持你运作的结界“鼓励”周围的人让路，为你那塞满黏液的肚子腾出空间。[pg]");
         }
         outputText("那个鼠娘，在你刚注意到她时就已经脸红了，现在当你高耸在她面前时，她的脸变得通红，你那装满触手的肚子从你[armor]的每一个角落和缝隙里淫秽地凸出来。你向她打招呼，偷偷地挑逗着[nipple]，看着她扭捏作态，一时语塞。当你确信她真的无言以对时，你咳嗽了一声，给了她一个意味深长的眼神。[pg]");
         outputText("[say: 嗨——我是说，嗯，那个——嗨！]鼠娘结结巴巴地说。她伸出一只手想摸摸你的“孕肚”，然后停了下来。[say: 抱歉，]她说。[say: 我平时不是这样的。][pg]");
         outputText("你向她保证没关系，然后鼓励她摸摸你那");
         if(get_player().thickness <= 33)
         {
            outputText("紧绷的肚子");
         }
         else if(get_player().thickness <= 66)
         {
            outputText("被撑大的肚子");
         }
         else
         {
            outputText("柔软、充满母性的肚子");
         }
         outputText("。[pg]");
         outputText("[say:真的吗？]鼠娘问道。不等你回答，她就把身体贴在你肚子的侧面，把一只圆圆的老鼠耳朵贴在隆起的地方。当她蹭着你并发出咕咕声，追踪着你肉体下你那窝孩子的动静时，你花了一点时间欣赏她的身体。[pg]");
         outputText("当你打量她时，你忍不住注意到她真是个小巧玲珑的尤物。即使对一只老鼠来说，她也很瘦小——她身高绝对不超过四英尺——而她B罩杯的乳房是令人愉悦的、向上翘起的茶杯状肉团。当她把它们挤压在你那被史莱姆撑爆的肚子上时，感觉棒极了。她白色的皮毛带有淡淡的金黄色挑染，她那长长飘逸的头发是闪闪发光的铂金色。它以一种迷人的方式勾勒出她那惊艳美丽，虽然有些过于棱角分明的脸庞，将人们的注意力吸引到她那绒面革颜色的眼睛上。当女孩在你的肚子上蹭来蹭去时，她的尾巴兴奋地甩来甩去。[pg]");
         outputText("[say:你真漂亮，]她说。[say:你的肚子好<b>大！</b>……但、但是你一定饿了！我能给你买点什么吗？我真的很想更好地了解你。][pg]");
         menu();
         addButton(1,"礼貌拒绝",nephilaMouseFirstDecline);
         addButton(2,"接受",nephilaMouseFirstAccept);
      }
      
      public function malesHelpOutWithEaster() : void
      {
         clearOutput();
         outputText("一个念头闪过你的脑海；为什么不让这个融化的女孩帮你解决问题呢？仿佛看穿了你的心思，女孩继续向你走来，眼睛死死盯着你的[cock biggest]。她现在就在你面前，软绵绵的液体从她手上滴落，她伸手去抓你的肉棒。一股灼热的压力包裹住你的肉棒");
         if(get_player().balls > 0)
         {
            outputText("，黏糊糊的巧克力滴落在你的[balls]上");
         }
         outputText("，每一次动作都带来一种并不令人讨厌的感觉，温暖注入你的体内。压力的中心松开了，你的巧克力伴侣主动把你按在地板上，她的温暖包围着你。几乎立刻，你感觉到腹股沟处传来与之前相似的压力，现在正跳动着，仿佛在认真地抚弄你的肉棒。你意识到她用你认为是阴道的东西包裹住了你的肉棒。仿佛为了证实你的猜测，你的俘虏发出一声轻微的呻吟，更加狂热地套弄着你的肉棒。");
         outputText("[pg]现在你无法控制自己的欲望，开始漫不经心地在她天鹅绒般的深处抽插，那极度的温暖并没有让你退缩。骑在你身上的那团肉体对你新发现的活力感到高兴，发出一声介于尖叫和呻吟之间的声音，更加猛烈地迎合着你。你把手从束缚中抽出来，向上探去，抓住这个丰满女孩极具弹性的乳房。你加快了骨盆运动的强度，从这个性感尤物的嘴里引出了另一声呻吟，这只会给你的疯狂动作火上浇油。当你深深地插入她的体内时，强烈的热量冲击着你的身体。仿佛点燃了引火物，一股狂热的浪潮席卷了你，然后你意识到自己已经接近极限了。");
         outputText("[pg]决定让你的伴侣在你之前达到高潮，你的注意力转向通过笨拙的抽插给她带来快感。发现你现在的位置缺乏你所需要的支配力，你从这个火热的女人身下挣扎出来，留下她撅着屁股在空中，一脸困惑。对你的新安排感到满意，你走到她身后，把手伸进她的小穴，测试它的可塑性。不再浪费时间，你把你的[cock biggest]对准女人的开口，快速地将整根肉棒插了进去。女人因为你对她深处的对待而大声呻吟。仍然记得你的目标，你把手伸下去，找到了一个较硬的巧克力小球，那一定是她的阴蒂。在被动地向她的小穴里抽插的同时，你把手指集中在她的阴蒂上，既温柔又用力地揉捏着。女孩现在大声呻吟着，发出一声尖锐的哀号，让你自己也危险地接近了边缘。带着你不知道自己是否能承受的最后爆发力，你开始近乎绝望地插入她丝滑的裂口。");
         outputText("[pg]你的巧克力伴侣现在正以一种连你自己都无法匹敌的激情尖叫着，而你则以你的[legs]允许的最快速度冲刺。女孩的另一个器官也达到了极限，抽搐着仿佛要爆裂开来。女人高潮时发出的尖叫声简直震耳欲聋，巧克力像雨点一样落在你身上。");
         if(get_silly())
         {
            outputText("你后悔没有带伞来挡这场巧克力雨，这样你就可以像那些保持干燥的人一样，而不是像那些感到痛苦的人一样。");
         }
         outputText("她的肉棒只晚了几秒钟，喷射出一股看起来像白巧克力的液体，至少有三英尺高，喷溅了三四股后才平静下来。女孩瘫倒成一团，把你们连在一起的生殖器也带倒了。你还没有完全结束，你自己的肉棒深深地插在她的褶皱里，迅速地让自己达到了高潮。");
         if(get_player().cumQ() < 250)
         {
            outputText("[pg]你的肉棒在她的体内喷射出几股精液，即使你抽身离开，浓稠的精液丝线也将你和你的伴侣连接在一起。");
         }
         else if(get_player().cumQ() < 500)
         {
            outputText("[pg]你的肉棒射出几股大量的精液，填满了你伴侣的深处，同时有少量溢出。");
         }
         else if(get_player().cumQ() < 1000)
         {
            outputText("你的肉棒喷出大量的精液，迅速填满了你伴侣的深处，同时有少量精液有力地喷射出来。你很高兴地看到，她似乎因为你的精液而增加了一点体重。");
         }
         else if(get_player().cumQ() < 5000)
         {
            outputText("你的肉棒喷射进你伴侣的深处，几乎瞬间就填满了它，同时有大量精液飞溅出来。你很高兴地看到，她似乎因为你的精液而增加了一点体重。");
         }
         else
         {
            outputText("你的肉棒像河流一样敞开，以如此大的力量流入你的伴侣体内，以至于她的肚子都鼓了起来。一股精液开始从她的阴道喷涌而出，将她无法承受的大量精液排到地板上。你很高兴地看到，她因为你的精液而增加了一些体重。");
         }
         outputText("在失去意识之前，你所能做的就是尽量倒在地上。帮忙也就帮到这了。在意识消退之际，你脑海中浮现出那只牛头人得意的笑容。");
         outputText("[pg]<b>后来……</b>");
         outputText("[pg]你跌跌撞撞地回到营地，仍然有些神志不清。");
         get_player().orgasm("Dick");
         dynStats(DynStat.Lib(1));
         var _temp_1:* = get_player();
         _temp_1.cumMultiplier = _temp_1.cumMultiplier + 2;
         doNext(get_camp().returnToCampUseOneHour);
      }
      
      public function ingredientsMenu() : void
      {
         clearOutput();
         displayIngredients();
         menu();
         addButton(0,"狐狸浆果",buyFoxBerry);
         addButton(1,"环尾无花果",buyFig);
         addButton(2,"老鼠可可",buyCocoa);
         addButton(3,"红河根",buyRoot);
         addButton(4,"雪貂果",buyFerretFruit);
         addButton(14,"返回",checkBakeryMenu);
      }
      
      public function easterBakeSaleHelp() : void
      {
         clearOutput();
         outputText("你决定看看有什么能帮忙的，于是向厨师提供了帮助。他用一贯的轻快语气回答你，[say: 你帮忙。去后面。做糕点。] 你问他是否需要你帮忙做那些卖得飞快的巧克力蛋，但他拒绝了，甚至差点嘲笑你。[say: 不。我做蛋。别人不行。]");
         outputText("[pg]你走到后面坐下，等着厨师来给你指示。在烤箱散发出的闷热中，似乎过了一个世纪，厨师终于抽出时间来指导你。他指出了你需要用到的设备，并摆出了一些你认识的原料。然而，令你恐惧的是，他没有留下任何牛奶！当你质疑这一点时，他笑着指着你，[say: 你产奶。别的奶不好。]");
         outputText("[pg]你感到很恼火，但既然决定了要帮忙，脑海中就开始飞速运转，想着怎么才能弄到足够的牛奶来做糕点。看到你脸上的恐慌，牛头人再次笑了起来。在他为你准备的原料中，有一小罐蓝色的液体，似乎在不断沸腾。他拿起这个递给你，显然是期望你知道这是什么，因为之后他就转身回前面去了。");
         outputText("[pg]仍然不确定到底该怎么做，你坐在原地，对自己的处境感到难以置信，直到你的好奇心占了上风，决定你必须亲自检查这些蛋。走到后面仅剩的几个蛋前，你拿起一个，发现它天生就很温暖。你费尽了所有的镇定才没有把它掉在地上，但你继续前进。它不仅感觉温暖，似乎还在吸收你手上的热量。一个淫荡的念头在你的脑海中闪过，想象着一个巧克力人从蛋里出来，触手像性爱后粘稠的液体一样从他们身上滴下来。对自己的大胆感到惊讶，你再次放下蛋，想知道这个念头是从哪里来的。想起你为什么回到这里，你的困境带着迫切的紧迫感回到了你脑海的最前沿。你走过去拿起那罐蓝色液体；它比你想象的要粘稠得多。考虑到一切，你是在这里帮忙的。牛头人没有理由给你带有敌意的东西，所以你决定相信自己的直觉，喝下这种奇怪的药剂。不想把整个东西都喝下去，你很快找到一个量杯用来喝，给自己倒了一些。干杯……");
         outputText("[pg]一阵愉悦的浪潮穿过你的身体，从慢慢填满你胃部的饮料中散发出来。这饮料让你充满了解决问题的狂热，如果没别的的话。你向前倾斜，确信解决僵局的方法一定就在其中。");
         if(get_player().biggestTitSize() >= 1)
         {
            outputText("你的[fullChest]随着你动作的活力而弹跳。");
         }
         outputText("你像解开一个精巧的谜题一样仔细检查着这枚蛋，它的秘密只受限于你解开它的能力。你欣喜地感觉到里面传来一阵骚动。热量不仅从你的手上散去，现在整个房间的热量都在消退，原本令人烦躁的酷热降了下来，你确信现在这里比外面挤满顾客的地方还要凉爽。");
         outputText("[pg]你手里一直拿着的蛋开始剧烈摇晃；为了避免掉落，你把它放了下来。事实证明你放得正是时候，因为一股巧克力喷泉从蛋里喷涌而出，直冲天花板，力量比间歇泉还要大。从蛋的残骸中爬出来一个身材丰满的巧克力双性人，她的意图从她那已经勃起并流着口水的器官上显露无疑。你忍不住打量着她，注意到她那丰满的DD罩杯乳房和一根你估计大约有14英寸长的肉棒。她走向你时那性感的步态简直邪恶至极，让你的胯下燃起一团火，");
         if(get_player().get_gender() == 1)
         {
            outputText("[eachCock]瞬间硬得发疼。");
         }
         else if(get_player().hasVagina())
         {
            outputText("你的乳头明显变硬，而你的[vagina]也为即将到来的事情做好了准备。");
         }
         else
         {
            outputText("[eachCock 瞬间完全勃起，你的乳头和[vagina]也不甘落后，准备迎接你的遭遇。");
         }
         outputText("[pg]之前喝下饮料带来的快感消退了，取而代之的是一种更原始的兽性需求。");
         menu();
         addButton(0,"继续",malesHelpOutWithEaster);
      }
      
      public function easterBakeSale() : void
      {
         clearOutput();
         outputText("你来到面包店，却发现里面挤满了人，你几乎挤不进去。");
         if(get_telAdre().rubi.rubiAffection() >= 40)
         {
            outputText("忙得不可开交的鲁比只能朝你的方向挥挥手，然后又回去招呼客人了。");
         }
         outputText("看到这节日的喧嚣，你感到一阵思乡之痛，回想起了在英格纳姆的日子。你甩掉这些情绪，走到队伍的最前面，决心看看大家都在忙些什么。平时不在的牛头人厨师向你打招呼，这更让你觉得他们人手不足。");
         outputText("[pg][say: 你好。你常来吗？我们很忙。会尽量做好的。]");
         menu();
         addButton(0,"查看菜单",checkBakeryMenu);
         addButton(1,"提供帮助",easterBakeSaleHelp);
         addButton(14,"离开",get_telAdre().telAdreMenu);
      }
      
      public function displayIngredients() : void
      {
         outputText("也可以试试在我们这里买些特殊配料，自己烘焙哦！\n");
         outputText("狐狸浆果 - 5 宝石。\n");
         outputText("环尾无花果 - 5 宝石。\n");
         outputText("老鼠可可 - 10 宝石。\n");
         outputText("红河根 - 14 宝石。\n");
         outputText("雪貂果 - 20 宝石。\n");
      }
      
      public function checkBakeryMenu() : void
      {
         var price5:Number;
         var name5:String;
         var _g5:BakeryScene;
         var price4:Number;
         var name4:String;
         var _g4:BakeryScene;
         var price3:Number;
         var name3:String;
         var _g3:BakeryScene;
         var price2:Number;
         var name2:String;
         var _g2:BakeryScene;
         var price1:Number;
         var name1:String;
         var _g1:BakeryScene;
         var price:Number;
         var name:String;
         var _g:BakeryScene;
         var _loc1_:* = null as IMap;
         clearOutput();
         if(get_player().hasPerk(PerkLib.MinotaurCumAddict) && FlagDict_Impl_.arrayReadInt(KFLAGS.flags,200) == 0)
         {
            _loc1_ = KFLAGS.flags;
            FlagDict_Impl_.arrayWriteInt(_loc1_,200,FlagDict_Impl_.arrayReadInt(_loc1_,200) + 1);
            outputText("排队的时候，一个浑身发抖的半人马娘瞥了你一眼，低声说道：[say: 你也需要一些，对吧，亲爱的？]你一脸茫然地看着她，不太明白她在暗示什么。她睁大眼睛问道：[say: 你不是上瘾了吗？]你傻傻地点了点头，她会意地笑了。[say: 这里有个牛头人店员，有点特殊的癖好……只要点一份特制的闪电泡芙，他就会帮你搞定。不过要保密，希望我买完一打之后还能剩下一些。]半人马娘舔了舔嘴唇，不耐烦地来回踱步。[pg]");
         }
         outputText("浓郁巧克力布朗尼 - 3 宝石。\n");
         outputText("无花果饼干 - 4 宝石。\n");
         outputText("浆果纸杯蛋糕 - 3颗宝石。\n");
         outputText("甜甜圈 - 5颗宝石。\n");
         outputText("磅蛋糕 - 4颗宝石。\n");
         _g = this;
         name = "brownies";
         price = 3;
         addButton(0,"布朗尼",function():void
         {
            _g.nomnomnom(name,price);
         });
         _g1 = this;
         name1 = "cookies";
         price1 = 4;
         addButton(1,"饼干",function():void
         {
            _g1.nomnomnom(name1,price1);
         });
         _g2 = this;
         name2 = "cupcakes";
         price2 = 3;
         addButton(2,"纸杯蛋糕",function():void
         {
            _g2.nomnomnom(name2,price2);
         });
         _g3 = this;
         name3 = "doughnuts";
         price3 = 5;
         addButton(3,"甜甜圈",function():void
         {
            _g3.nomnomnom(name3,price3);
         });
         _g4 = this;
         name4 = "pound cake";
         price4 = 4;
         addButton(4,"磅蛋糕",function():void
         {
            _g4.nomnomnom(name4,price4);
         });
         if(get_survival())
         {
            outputText("硬饼干 - 5颗宝石（包装好）。\n");
            outputText("什锦干果 - 20颗宝石（包装好）。\n");
            addButton(5,"硬饼干",buyHardBiscuits).hint(get_consumables().H_BISCU.get_description());
            addButton(6,"什锦干果",buyTrailMix).hint(get_consumables().TRAILMX.get_description());
         }
         if(int(get_game().time.days % 7) == 0)
         {
            outputText("鹰嘴豆泥 - 100颗宝石（仅限每周特供！）。\n");
            addButton(7,"鹰嘴豆泥",buyHummus).hint(get_consumables().HUMMUS_.get_description());
         }
         if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,200) > 0)
         {
            outputText("“特制”闪电泡芙 - 10颗宝石。\n");
            _g5 = this;
            name5 = "eclair";
            price5 = 10;
            addButton(8,"特制泡芙",function():void
            {
               _g5.nomnomnom(name5,price5);
            });
         }
         if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,242) >= 4)
         {
            outputText("巨型巧克力纸杯蛋糕 - 500颗宝石。\n");
            addButton(9,"巨型蛋糕",buySlutCake);
         }
         outputText("\n");
         displayIngredients();
         outputText("\n你要点什么？");
         addButton(10,"配料",ingredientsMenu);
         addButton(14,"离开",bakeryuuuuuu);
      }
      
      public function buyTrailMix() : void
      {
         clearOutput();
         if(get_player().get_gems() < 20)
         {
            outputText("你买不起那个！");
            doNext(checkBakeryMenu);
            return;
         }
         outputText("你花了二十颗宝石买了一包什锦干果。");
         var _loc1_:Player = get_player();
         _loc1_.set_gems(_loc1_.get_gems() - 20);
         statScreenRefresh();
         if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,2140) == 1)
         {
            get_consumables().TRAILMX.useItem();
            doNext(checkBakeryMenu);
         }
         else
         {
            get_inventory().takeItem(get_consumables().TRAILMX,checkBakeryMenu);
         }
      }
      
      public function buySlutCake() : void
      {
         clearOutput();
         if(get_player().get_gems() < 500)
         {
            outputText("你没有足够的宝石来买那个！");
            menu();
            addButton(0,"继续",checkBakeryMenu);
            return;
         }
         outputText("牛头人厨师从后面的房间里出来，拿着一个装有你纸杯蛋糕的盒子。它太大了，没法立刻吃完。[pg]");
         var _loc1_:Player = get_player();
         _loc1_.set_gems(_loc1_.get_gems() - 500);
         statScreenRefresh();
         get_inventory().takeItem(get_consumables().CCUPCAK,bakeryuuuuuu);
      }
      
      public function buyRoot() : void
      {
         clearOutput();
         if(get_player().get_gems() < 14)
         {
            outputText("你买不起那个！");
            menu();
            addButton(0,"继续",ingredientsMenu);
            return;
         }
         outputText("你花了十四颗宝石买了这根树根。");
         var _loc1_:Player = get_player();
         _loc1_.set_gems(_loc1_.get_gems() - 14);
         statScreenRefresh();
         if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,2140) == 1)
         {
            get_consumables().RDRROOT.useItem();
            doNext(ingredientsMenu);
         }
         else
         {
            get_inventory().takeItem(get_consumables().RDRROOT,ingredientsMenu);
         }
      }
      
      public function buyHummus() : void
      {
         clearOutput();
         if(get_player().get_gems() < 100)
         {
            outputText("你买不起那个！");
            doNext(checkBakeryMenu);
            return;
         }
         outputText("你花了一百颗宝石买了一包鹰嘴豆泥。");
         var _loc1_:Player = get_player();
         _loc1_.set_gems(_loc1_.get_gems() - 100);
         statScreenRefresh();
         if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,2140) == 1)
         {
            get_consumables().HUMMUS_.useItem();
            doNext(checkBakeryMenu);
         }
         else
         {
            get_inventory().takeItem(get_consumables().HUMMUS_,checkBakeryMenu);
         }
      }
      
      public function buyHardBiscuits() : void
      {
         clearOutput();
         if(get_player().get_gems() < 5)
         {
            outputText("你买不起那个！");
            doNext(checkBakeryMenu);
            return;
         }
         outputText("你花了五颗宝石买了一包硬饼干。");
         var _loc1_:Player = get_player();
         _loc1_.set_gems(_loc1_.get_gems() - 5);
         statScreenRefresh();
         if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,2140) == 1)
         {
            get_consumables().H_BISCU.useItem();
            doNext(checkBakeryMenu);
         }
         else
         {
            get_inventory().takeItem(get_consumables().H_BISCU,checkBakeryMenu);
         }
      }
      
      public function buyFoxBerry() : void
      {
         clearOutput();
         if(get_player().get_gems() < 5)
         {
            outputText("你买不起那个！");
            menu();
            addButton(0,"继续",ingredientsMenu);
            return;
         }
         outputText("你花了五颗宝石买了一颗狐狸浆果。");
         var _loc1_:Player = get_player();
         _loc1_.set_gems(_loc1_.get_gems() - 5);
         statScreenRefresh();
         if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,2140) == 1)
         {
            get_consumables().FOXBERY.useItem();
            doNext(ingredientsMenu);
         }
         else
         {
            get_inventory().takeItem(get_consumables().FOXBERY,ingredientsMenu);
         }
      }
      
      public function buyFig() : void
      {
         clearOutput();
         if(get_player().get_gems() < 5)
         {
            outputText("你买不起那个！");
            menu();
            addButton(0,"继续",ingredientsMenu);
            return;
         }
         outputText("你花了五颗宝石买了一个无花果。");
         var _loc1_:Player = get_player();
         _loc1_.set_gems(_loc1_.get_gems() - 5);
         statScreenRefresh();
         if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,2140) == 1)
         {
            get_consumables().RINGFIG.useItem();
            doNext(ingredientsMenu);
         }
         else
         {
            get_inventory().takeItem(get_consumables().RINGFIG,ingredientsMenu);
         }
      }
      
      public function buyFerretFruit() : void
      {
         clearOutput();
         if(get_player().get_gems() < 20)
         {
            outputText("你买不起那个！");
            menu();
            addButton(0,"继续",ingredientsMenu);
            return;
         }
         outputText("你花了二十颗宝石买了一颗雪貂果。");
         var _loc1_:Player = get_player();
         _loc1_.set_gems(_loc1_.get_gems() - 20);
         statScreenRefresh();
         if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,2140) == 1)
         {
            get_consumables().FRRTFRT.useItem();
            doNext(ingredientsMenu);
         }
         else
         {
            get_inventory().takeItem(get_consumables().FRRTFRT,ingredientsMenu);
         }
      }
      
      public function buyCocoa() : void
      {
         clearOutput();
         if(get_player().get_gems() < 10)
         {
            outputText("你买不起那个！");
            menu();
            addButton(0,"继续",ingredientsMenu);
            return;
         }
         outputText("你花了十颗宝石买了一些可可。");
         var _loc1_:Player = get_player();
         _loc1_.set_gems(_loc1_.get_gems() - 10);
         statScreenRefresh();
         if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,2140) == 1)
         {
            get_consumables().MOUSECO.useItem();
            doNext(ingredientsMenu);
         }
         else
         {
            get_inventory().takeItem(get_consumables().MOUSECO,ingredientsMenu);
         }
      }
      
      public function bakeryuuuuuu() : void
      {
         if(isEaster() && get_player().hasCock() && (FlagDict_Impl_.arrayReadInt(KFLAGS.flags,823) < int(get_date().getFullYear()) || Utils.rand(20) == 0))
         {
            FlagDict_Impl_.arrayWriteInt(KFLAGS.flags,823,int(get_date().getFullYear()));
            easterBakeSale();
            return;
         }
         if(Utils.rand(10) <= 1 && get_game().shouldraFollower.followerShouldra() && get_player().get_gender() > 0 && FlagDict_Impl_.arrayReadInt(KFLAGS.flags,242) == 4)
         {
            get_game().shouldraFollower.shouldraBakeryIntro();
            return;
         }
         var _loc1_:IMap = KFLAGS.flags;
         FlagDict_Impl_.arrayWriteInt(_loc1_,243,FlagDict_Impl_.arrayReadInt(_loc1_,243) + 1);
         if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,242) == 0 && int(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,243) % 8) == 0)
         {
            get_telAdre().maddie.procMaddieOneIntro();
            return;
         }
         if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,242) == 3)
         {
            get_telAdre().maddie.bakeryEpilogue();
            return;
         }
         clearOutput();
         menu();
         if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,201) == 0)
         {
            outputText("你走近面包店，但它似乎建在街道水平面以下。入口甚至不是一扇门——而是一条双倍宽的坡道，将你带到地下。通道直接通向面包店的内部，让顾客可以畅通无阻地进出这座舒适的地下建筑。酵母面包、甜点和松软小吃的香味似乎渗透了这里的每一块砖。如果它关门了，你毫不怀疑它在几周甚至几个月内都会散发着美味的香气。你排进队伍，一边等待一边看着菜单。[pg]");
            if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,2921) == 1 && get_player().statusEffectv1(StatusEffects.ParasiteNephila) >= 10)
            {
               if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,2925) == 1)
               {
                  outputText("朱丽安又在面包店里了，她看着你和你那美丽的肚子。当她看到你朝她看去时，她挥了挥手。");
               }
               else
               {
                  outputText("你忍不住注意到一个苗条的年轻鼠娘正偷偷看你。你用手抚摸着自己巨大的肚子，微笑着看她脸红。");
               }
            }
         }
         else
         {
            if(isWinter())
            {
               get_game().xmas.xmasMisc.encounterKamiTheChristmasRoo();
               if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,643) == 1)
               {
                  addButton(3,"布丁",get_game().xmas.xmasMisc.getWinterPudding);
               }
            }
            else
            {
               outputText("你走进面包房圆顶的内部，深吸一口气，享受着各种宜人的香气和烤炉散发出的舒适温暖。周围有很多桌椅供人就餐，你一边排队，一边浏览着菜单。[pg]");
            }
            if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,2926) < 1 && FlagDict_Impl_.arrayReadInt(KFLAGS.flags,2921) == 1 && get_player().statusEffectv1(StatusEffects.ParasiteNephila) >= 10)
            {
               if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,2925) == 1)
               {
                  outputText("朱丽安又在面包房里了，她正渴望地注视着你和你那美丽的肚子。");
               }
               else
               {
                  outputText("你忍不住注意到一个苗条的年轻鼠娘正偷偷看你。你用手抚摸着自己巨大的肚子，微笑着看她脸红。");
               }
            }
         }
         _loc1_ = KFLAGS.flags;
         FlagDict_Impl_.arrayWriteInt(_loc1_,201,FlagDict_Impl_.arrayReadInt(_loc1_,201) + 1);
         outputText("你要做什么？");
         addButton(0,"查看菜单",checkBakeryMenu);
         addButton(1,"交谈",talkBakeryMenu);
         if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,2926) < 1 && FlagDict_Impl_.arrayReadInt(KFLAGS.flags,2921) == 1 && get_player().statusEffectv1(StatusEffects.ParasiteNephila) >= 10)
         {
            if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,2925) == 1)
            {
               addButton(2,"靠近朱丽安",nephilaMouseAgain);
            }
            else
            {
               addButton(2,"靠近鼠娘",nephilaMouse);
            }
         }
         addButton(14,"离开",get_telAdre().telAdreMenu);
      }
   }
}

