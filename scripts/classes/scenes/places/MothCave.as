package classes.scenes.places
{
   import classes.BaseContent;
   import classes.CoC;
   import classes.DebugMenu;
   import classes.DynStat;
   import classes.Player;
   import classes.SelfDebug;
   import classes.Time;
   import classes.TimeAwareInterface;
   import classes.internals.Utils;
   import classes.saves.SelfSaver;
   import classes.saves.SelfSaving;
   import classes.scenes.Camp;
   import classes.scenes.npcs.SylviaScene;
   import classes.scenes.places._MothCave.SaveContent;
   import classes.scenes.places.mothCave.DoloresScene;
   import coc.view.CoCButton;
   import flash.Boot;
   
   public class MothCave extends BaseContent implements TimeAwareInterface, SelfDebug, SelfSaving
   {
      
      public var saveVersion:int;
      
      public var saveName:String;
      
      public var saveContent:SaveContent;
      
      public var globalSave:Boolean;
      
      public var doloresScene:DoloresScene;
      
      public function MothCave()
      {
         if(Boot.skip_constructor)
         {
            return;
         }
         globalSave = false;
         saveVersion = 1;
         saveName = "mothcave";
         saveContent = new SaveContent(null,null,null);
         doloresScene = new DoloresScene();
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
         if(saveContent.tapestryChange == 1)
         {
            _temp_1.tapestryTime += 1;
            if(saveContent.tapestryTime >= 168)
            {
               saveContent.tapestryChange = 2;
            }
         }
         return false;
      }
      
      public function tapestryMenu() : void
      {
         var _g:MothCave;
         clearOutput();
         outputText("洞穴的墙壁上挂着一系列丝绸挂毯。其中许多描绘了很久以前蛾女的生活，但有些则是更具艺术性的尝试，描绘了各种自然场景，偶尔还有更抽象的作品。你看到西尔维娅的挂毯在洞穴的后墙上");
         if(saveContent.tapestryChange == 2)
         {
            outputText("，但它似乎有些不同");
         }
         else if(doloresScene.get_doloresProg() > 14)
         {
            outputText("，多洛雷斯的挂毯就挂在它的旁边");
         }
         else if(doloresScene.get_doloresProg() > 0)
         {
            outputText("，旁边特意清理出了一块空地");
         }
         else if(saveContent.tapestryChange == 3)
         {
            outputText("，尽管它已经被破坏了");
         }
         outputText("。");
         menu();
         addNextButton("欣赏",admireTapestries);
         addNextButton("西尔维娅",sylviaTapestry);
         if(doloresScene.get_doloresProg() > 14)
         {
            addNextButton("多洛雷斯",doloresTapestry);
         }
         _g = this;
         addButton(14,"返回",function():void
         {
            _g.caveMenu();
         });
      }
      
      public function sylviaTapestry() : void
      {
         clearOutput();
         if(saveContent.tapestryChange > 1)
         {
            outputText("你之前查看过的那幅丝绸挂毯挂在洞穴最深处的墙上，你猜测上面描绘的是西尔维娅童年时的场景。凑近一看，你再次被它的质量所折服——手工精湛，材质考究，堪称真正的艺术品。在最左侧边缘，你看到一对幸福的夫妇抱着一只年幼的毛毛虫，一只手伸向天空。母亲和西尔维娅一样是蛾女，但父亲似乎是一个人类，就像你" + (get_player().startingRace != "human" ? " 曾经那样" : "") + "。再往前看，你看到一道紫白相间的模糊身影在树林间穿梭，而她的母亲在一旁注视着。看来西尔维娅小时候就很擅长飞行，但你忍不住注意到她父亲的缺席。");
            outputText("[pg]中心部分……不一样了。你上次看到的那些令人惊叹的翅膀不见了，取而代之的是一个由匆忙重新缝合的线组成的狂暴、混乱的漩涡。红色和紫色的锯齿状线条勾勒出一个粗糙的心形轮廓，中心是一个模糊的[race]形身影。当你意识到这一点时，一阵寒意顺着你的脊背爬了上来。看来西尔维娅破坏了最初的设计，把它换成了某种对你的献礼。这幅作品的狂乱和无序清楚地表明了创作者的狂热，你能感受到那种痴迷。虽然这证明了她对你的爱，但西尔维娅愿意撕毁一件珍贵的童年遗物，这事实多少有些令人担忧。");
            if(saveContent.tapestryChange == 2)
            {
               saveContent.tapestryChange = 3;
            }
         }
         else
         {
            outputText("一幅丝绸挂毯挂在洞穴最深处的墙上，你猜测上面描绘的是西尔维娅童年时的场景。凑近一看，你被它的质量所折服——手工精湛，材质考究，堪称真正的艺术品。在最左侧边缘，你看到一对幸福的夫妇抱着一只年幼的毛毛虫，一只手伸向天空。母亲和西尔维娅一样是蛾女，但父亲似乎是一个人类，就像你" + (get_player().startingRace != "human" ? " 曾经那样" : "") + "。再往前看，你看到一道紫白相间的模糊身影在树林间穿梭，而她的母亲在一旁注视着。看来西尔维娅小时候就很擅长飞行，但你忍不住注意到她父亲的缺席。");
            outputText("[pg]中心部分是西尔维娅翅膀的惊艳重现，所有复杂的图案都刻画得细致入微。制作这幅画时所倾注的极度用心，在它们精湛的美感中展现得淋漓尽致，你能感受到其中流露出的爱意。遗憾的是，挂毯的右侧仍未完成，磨损的边缘在半途戛然而止。一个意义不明的未完成场景被打断了，西尔维娅母亲的部分只完成了一小部分。这位年长蛾女半成品的面容隐约透着忧郁" + (get_player().cor < 30 ? "，让你的心头涌起一阵同情的酸楚" : "") + "。");
            if(saveContent.tapestryChange < 1)
            {
               saveContent.tapestryChange = 1;
            }
         }
         doNext(tapestryMenu);
      }
      
      public function sleepOver2() : void
      {
         var _g:SylviaScene;
         var _loc1_:* = null as Array;
         clearOutput();
         outputText("渐渐地，你开始醒来。你首先意识到的是温暖，然后是光滑的甲壳抚摸着你的[skindesc]。接着是丝滑的床单，最后是发光真菌微弱的光芒。");
         outputText("[pg]你睁开双眼，脑海中浮现出一种不知今夕何夕的错觉。没有太阳的指引，你甚至不知道现在是不是早晨。但这种想法并没有让你感到不适，反而出奇地令人安心。难得一次，你不用担心要赶往下一个地方，也不用操心哪里需要你。你只是睡够了自然醒来，这种简单的感觉真是太棒了。");
         if(doloresScene.saveContent.doloresProgress >= 9)
         {
            _loc1_ = ["然而，身后传来的一声呼唤将你从这沉思中惊醒。[say:母——亲，]那沙哑的声音响起，[say:你知道……在哪吗？]当她看到你时，两只紫色的眼睛猛地睁大，你的女儿站在你面前，身上只裹着一条毛巾。[say:哦，你在这里。我是说，很、很高兴见到你。或者，咳咳。早上好，[Father]，我——]当她抬起手臂打招呼时，毛巾危险地滑落，多洛雷斯尖叫着冲回了她的房间。","洞穴深处传来的一声巨响打破了这份宁静。你猛地转过头，尽力分辨声音的来源，似乎是从后走廊传来的，但现在那里只剩下一片死寂。你的心跳了几下，随后传来了后续的声音：[say:哦，该死的——混蛋——[b:见鬼！]]那是你女儿愤怒的声音。","你从沉思中抬起头，听到一阵轻柔的哼唱声，随着你的倾听，声音逐渐变大变清晰。终于，声音的主人转过拐角，原来是你的女儿。她的黑发乱得不可思议，毛躁得让你几乎看不清她深陷的眼窝。她似乎没有注意到你的存在，也没有对你的出现做出反应，只是从你身边溜过，从架子上拿了一本蓝色的小书，然后又回到了她来的地方。"];
            outputText("[pg]" + _loc1_[Utils.rand(int(_loc1_.length))]);
            outputText("[pg]你转头看向西尔维娅，但她依然呼吸平稳，显然是在这场小插曲中睡得很沉。");
         }
         else
         {
            outputText("[pg]你转头看向西尔维娅，她依然在轻柔地沉睡。她安睡时的脸庞看起来出奇地平静，你直到现在才意识到她平时有多么充满激情。不过，这种反差相当暖心，你发现自己沉浸在观察她的每一个小细节中。她眼睑偶尔颤动的方式。她触角在上方慵懒挥舞的方式。以及每当你开始移动时，她抱得更紧的方式。");
            outputText("[pg]尽管如此，她似乎没有很快醒来的迹象。");
         }
         outputText("[pg]一定是个睡得很沉的人。不幸的是，新的一天现在必须开始了，所以你轻轻摇晃她的肩膀，直到她开始动弹。");
         outputText("[pg][say:嗯，]她说道，眼睛依然没有睁开。[say:拜托，" + (doloresScene.saveContent.doloresProgress >= 5 ? "亲爱的，等你长大了我再告诉你" : "再睡几分钟，妈妈") + "。就让我……]这个想法没有说完，她的呼吸又回到了平稳的节奏，所以你又摇了她一次。[say:哦，[name]？啊，抱歉，我]——她端庄地打了个哈欠——[say:我起得比较慢。]");
         outputText("[pg]她揉了揉眼睛，当她的手移开时，那双深紫色的眼眸又恢复了全部的魔力。[say:我做了一个美梦。你在里面。]蛾女对你笑了笑，但没有再多说什么。当气氛开始变得有些尴尬时，你建议是时候起床了，她同意了。");
         outputText("[pg]你站起身，[if (isnaked) {伸了个懒腰|整理好衣服}]，然后转头看向蛾女，她现在正坐在床沿，双手放在腿上。");
         cheatTime(30 - get_time().hours);
         _g = get_game().sylviaScene;
         doNext(function():void
         {
            _g.sylviaMenu();
         });
      }
      
      public function sleepOver() : void
      {
         clearOutput();
         outputText("夜已经很深了，虽然你在这里看不到太阳，但你确信外面的沼泽现在非常黑暗且不宜人。现在，你只想找个地方休息，而西尔维娅的床看起来是世界上最诱人的地方。它宽敞而迷人，就像一小片天堂，最棒的是，你将有人与你共享它。");
         outputText("[pg]蛾女在你打哈欠打到一半时凑了过来，给了你一个心照不宣的眼神。[if (sylviadom < 50) {[say:你想上床睡觉吗，亲爱的？]她问道，双臂环抱住你的一只手臂。|[say:哼，你看起来累坏了。跟我来，]她说着，拉起你的一只手开始拉着你走。}]你当然没有任何异议，考虑到你的眼皮已经耷拉下来了，所以你[if (sylviadom < 50) {带领|跟随}]她走到床边坐下[if (sylviadom >= 50) {在她的提示下}]。\n");
         outputText("[pg]你立刻为自己选择留在这里感到高兴，当你头向后仰时，柔软的被褥垫着你的臀部。西尔维娅对这个方向咯咯地笑了，然后扑通一声坐在你旁边，她的到来让床架微微晃动。你们俩就这样待了一会儿，你真的开始感觉到你的四肢有多沉重。");
         if(get_player().isNaked())
         {
            outputText("[pg][say:嗯，看来你已经准备好了，]蛾女说着，一只手抚过你赤裸的大腿。你因为这接触而颤抖，但更多是因为这让你想起了洞穴里寒冷的空气，你现在极其需要从中得到喘息。");
         }
         else
         {
            outputText("[pg][say:看起来你还没完全准备好。来，让我帮你，]蛾女说着，打破了沉默。还没等你回应，她的手就开始以惊人的技巧脱下你的[armor]。她能比你自己快得多地让你完全赤裸，但你把这个事实抛到了脑后。有更紧迫的事情需要考虑，比如目前让你发抖的洞穴寒气。");
         }
         outputText("[pg][if (istaur) {把你安置在床上费了点劲，但你们俩一起努力，直到你们都感到舒适|[if (sylviadom < 50) {你主动出击，把西尔维娅拉起来压在你身上，带着你们俩翻滚成一个斜躺的姿势。|但你不需要担心太久，因为西尔维娅已经预料到了你的不适，她双臂环抱住你，把你拉过来让你平躺着。}]}]你很快就被美妙的床单和枕头安抚了，而蛾女似乎对这个安排非常满意。就这样，她冰凉的甲壳紧贴着你，让你和她都颤抖起来，尽管原因可能不同。蛾女的体温似乎比你低一点，但你确信这个问题会在接下来的休息中得到解决。");
         outputText("[pg]而且，你的眼睛已经很难睁开了。你想多享受一会儿这一刻，但当恋人那甜腻的气味飘入你的鼻子时，你意识到这都不重要了。唯一真正重要的是你在这里，在一个你可以忘记一切、只做你自己的地方。当你让自己慢慢地、轻轻地滑入梦乡，你的大脑变得一片空白时，没有任何烦恼或担忧打扰你。你听到的最后一件事是轻柔、均匀的呼吸声，听起来如此美妙，让你忍不住也加入了其中。");
         doNext(sleepOver2);
      }
      
      public function saveToObject() : Object
      {
         return saveContent;
      }
      
      public function reset() : void
      {
         saveContent.tapestryChange = 0;
         saveContent.tapestryTime = 0;
         saveContent.goneCamping = false;
      }
      
      public function onAscend(param1:Boolean) : void
      {
         reset();
      }
      
      public function mothFlight2() : void
      {
         clearOutput();
         outputText("你们三个一起走出洞穴，父母走在女儿的两侧。你已经在寻找一个好的起飞点了，但还没等你继续往前走，西尔维娅就拍了拍你的肩膀引起你的注意，对你点了点头，微微一笑。好吧，这里虽然还有一些森林覆盖，但你应该觉得足够开阔了。");
         outputText("[pg][say:我-我-我，嗯……我该怎么——]");
         outputText("[pg]还没等任何人回答她的问题，西尔维娅就猛地一振翅膀冲天而起，差点把多洛雷斯掀翻在地。不过，她并没有飞多远，而是选择在你们头顶上方的空中盘旋。");
         outputText("[pg][say:外面天气真好，]她向下喊道。[say:条件真是太棒了。]");
         outputText("[pg]你的女儿看起来还是有点不确定，所以你握住她的手，这让她微微一惊。你用平静的话语，慢慢地哄她开始和你一起拍打翅膀。没过多久，她就能跟上你的节奏了，你不给她退缩的机会，拉着她一起升到了空中。");
         outputText("[pg]一开始你们俩牵着手有点尴尬，但令人惊讶的是，你们很快就找到了平衡，让你们俩都处于稳定的状态。你能感觉到多洛雷斯的紧张和缺乏经验，但这只会让你想进一步安慰她，让她在空中感觉和你一样自在。于是，你轻轻拉了拉她的手，带领她向上飞向西尔维娅，这位年长的蛾女看到女儿升空，发出了愉快的咯咯笑声。");
         outputText("[pg][say:那么，啊，我们要做什么？]多洛雷斯问道。");
         outputText("[pg][say:当然是飞啦！]答案传来了。西尔维娅带头，缓慢而小心地向上划出一道慵懒的弧线，把你们带到了树冠上方。穿透了沼泽中通常茂密的植被后，你发现上面出奇地明亮，[sun]的光芒[if (hours < 21) {让气氛感觉非常欢快|以一种奇特而美丽的方式照亮了树枝}]。你从来没想过这个地方会看起来这么好，但在上面，和你的家人在一起，它确实做到了。");
         outputText("[pg]不过，现在可没时间坐着发呆——你们还得飞呢。你确保女儿感觉舒适后，松开了她的手，让她自己支撑。她一开始飞得有些摇晃，但她做到了，很快你们三个就在沼泽上空以不错的速度翱翔。多洛雷斯看起来有点不舒服，但你认识她一辈子了，所以你能看出她隐藏在底下的兴奋。");
         outputText("[pg]她母亲一定也有同感，因为她一声不吭地突然加速向前，把你们俩甩在后面。你正要对年轻的蛾女说些什么，她却出人意料地紧随其后，她的翅膀以不规则的节奏拍打着，努力跟上她母亲的速度。你对此有点不确定，但当你追上这对母女时，多洛雷斯脸上的表情打消了你所有的疑虑。那是一种你想永远留在脑海中的表情，在接下来的几分钟里，当你们都在天空中以一种兴高采烈的自由滑翔、喷射和疾风般飞行时，你尽力将它铭刻在记忆中。");
         outputText("[pg]然而，没过多久你就注意到她开始有点体力不支了。西尔维娅似乎比你更敏感，因为她已经在半空中停了下来，示意多洛雷斯过去。你们三个轻轻地降落到地面，但即使你着陆了，你还是觉得[feet]轻飘飘的，好像你并不完全属于这里。");
         outputText("[pg][say:你太棒了，]西尔维娅说着，一把将女儿拥入怀中。");
         outputText("[pg][say:啊-啊，是的，嗯……谢谢你，母亲大人，]她回答道，不出所料地红了脸。");
         outputText("[pg]你们的飞行实际上已经让你们走了一段回营地的路，而且你们出来的时间够长了，也许应该回去看看了，所以你把你的计划告诉了蛾女们，打破了这美好的氛围。西尔维娅点了点头，看起来可能有点沮丧，但你的女儿给了你一个灿烂的笑容。");
         outputText("[pg][say:谢谢你带我出来，[Father]。" + get_player().mf(""," 或者，啊……你。") + " 我，嗯，比我想象的要享受得多。]");
         outputText("[pg]你以同样的方式回应，然后出发了，胸中依然带着那种奇怪的感觉。");
         doNext(get_camp().returnToCampUseOneHour);
      }
      
      public function mothFlight() : void
      {
         clearOutput();
         outputText("你不太确定是什么原因，但当你看着你的蛾女情人时，一个想法跳进了你的脑海。然而，这不仅仅涉及你们两个，还涉及你们的女儿。你[walk]向西尔维娅，问她是否愿意进行一次家庭郊游。");
         outputText("[pg][say:当然，[name]，]她好奇地看着你说，[say:但你到底在想什么？]");
         outputText("[pg]你提到，既然你们三个都有翅膀，如果你们从未一起享受过飞行的乐趣，那将是一种遗憾。当你这么说时，蛾女的眼睛比你预想的还要亮，她用力地点了点头。");
         outputText("[pg][say:真是个好主意！]她回答道，声音比平时高了一些。[say:她一直有点不情愿，但我知道她会喜欢和她的" + get_player().mf("父亲","父母") + "一起飞行的。]她笑了笑。[say:不过，要让她承认这一点可能有点困难。]");
         outputText("[pg]好吧，你已经搞定了一只蛾女，所以你去接另一只。你们俩来到多洛雷斯的房间，小心翼翼地走进去。像往常一样，她正在看书，不过这次她似乎特别投入，鼻子都快贴到书上了，直到你拍了拍她的肩膀她才注意到你。");
         outputText("[pg][say:啊——你好，[Father]！]她说道，脸上交织着复杂的情绪。[say:什——什么风把你——哦，你们俩都来了。]她顿了顿。[say:是……嗯，出什么事了吗？]");
         outputText("[pg]你赶紧向她保证什么事都没有，相反，你有一个提议。你想让她和你以及她母亲一起去外面进行一项家庭活动。");
         outputText("[pg]她眯起眼睛。[say:" + (get_game().sylviaScene.saveContent.unlockedOyakodon ? "这不会是什么奇怪的事吧" : "真的就这些吗") + "？我刚才，嗯……正在……]她抬头看了看你的脸，突然显得更加不确定了。[say:哦，烦死了。好吧，行，我很乐意。只是别抱太大期望，]她红着脸补充道。");
         outputText("[pg]没关系，这本来就是为了让你们大家玩得开心的一次短途旅行。你告诉她，你确信她会玩得很开心的，尽管多洛雷斯似乎并不像你那么热情。");
         doNext(mothFlight2);
      }
      
      public function load(param1:int, param2:*) : void
      {
         Utils.extend(saveContent,param2);
      }
      
      public function get_debugName() : String
      {
         return "蛾女洞穴";
      }
      
      public function get_debugHint() : String
      {
         return "西尔维娅的家。";
      }
      
      public function encounterCave() : void
      {
         doloresScene.saveContent.doloresAngry = false;
         if(get_game().sylviaScene.pregnancy.get_incubation() == 0 && get_game().sylviaScene.pregnancy.get_event() > 0)
         {
            get_game().sylviaScene.doloresBirth();
         }
         else if(get_game().sylviaScene.get_sylviaProg() == 4 && get_game().sylviaScene.saveContent.sylviaFertile == 0)
         {
            get_game().sylviaScene.sylviaCaveFirst();
         }
         else if(doloresScene.get_doloresProg() == 1)
         {
            doloresScene.doloresPostBirth();
         }
         else if(doloresScene.get_doloresProg() == 2 && doloresScene.get_doloresTime() > 72)
         {
            doloresScene.doloresToys();
         }
         else if(doloresScene.get_doloresProg() == 3 && doloresScene.get_doloresTime() > 72)
         {
            doloresScene.doloresTalking();
         }
         else if(doloresScene.get_doloresProg() == 4 && doloresScene.get_doloresTime() > 72)
         {
            doloresScene.doloresMagic();
         }
         else if(doloresScene.get_doloresProg() == 6 && doloresScene.get_doloresTime() > 24)
         {
            doloresScene.doloresPreCocoon();
         }
         else if(doloresScene.get_doloresProg() == 7)
         {
            doloresScene.doloresCocoon();
         }
         else if(doloresScene.get_doloresProg() == 8 && doloresScene.get_doloresTime() > 144)
         {
            doloresScene.doloresHatches();
         }
         else if(doloresScene.get_doloresProg() == 12)
         {
            doloresScene.doloresTalkAfter();
         }
         else if(doloresScene.get_doloresProg() == 13 && doloresScene.get_doloresTime() > 48)
         {
            doloresScene.doloresTapestryMaking();
         }
         else if(doloresScene.get_doloresProg() >= 17 && doloresScene.get_doloresTime() > 72 && !saveContent.goneCamping && get_time().isTimeBetween(17,22))
         {
            campfire();
         }
         else
         {
            caveMenu(true);
         }
      }
      
      public function doloresTapestry() : void
      {
         clearOutput();
         outputText("你看了看多洛雷斯刚做好的挂毯，它就挂在她母亲挂毯的右边。工艺确实非常精湛，你" + (doloresScene.saveContent.doloresTimesLeft < 2 ? "脑海中充满了你和多洛雷斯共度的所有时光的回忆" : " 心中不由自主地涌起一丝遗憾，因为你错过了太多时刻") + "。");
         outputText("[pg]左侧描绘了她童年早期的几个场景。你看到年幼的多洛雷斯拿着书的一端，另一端由某个乐于助人的巨人的双手托着，她惊奇地盯着书，眼睛像星星一样闪烁着好奇的光芒。再往前看，你看到小蛾女在丝绸上漂浮，尽管描绘得很小，但她的表情却出人意料地生动。她闭着嘴，也闭着眼睛，" + (doloresScene.saveContent.doloresTimesLeft < 2 ? "但你认识她够久了，能看出她并没有不高兴" : "而你不太明白她此时的感受") + "。");
         outputText("[pg]在右侧，有几幅多洛雷斯练习魔法的画面。她动作的优雅与美丽透过丝线展现出来，你能感受到她在追求自己的热爱时所体会到的那种惊奇。" + (doloresScene.saveContent.doloresDecision == 1 ? "那本古书在这些场景中非常显眼，是她实验时的忠实伴侣" : "然而，她的脸上带着一丝淡淡的忧伤，你能从布料中感受到一种强烈的渴望") + "。");
         outputText("[pg]最中间的部分有些奇怪。你看到你的女儿站着，双眼紧闭，手掌向外。某种光环从她手中辐射出来，在她周围形成一圈日冕，让她看起来像个光芒四射的天使。在她身后，一个深不见底的深渊若隐若现，看着它，你不禁打了个寒颤。关于它的一些东西" + (int(doloresScene.saveContent.doloresFinal % 10) != 1 ? "强烈地让你想起了你在空地遇到的那个东西" : "让你脊背发凉，尽管你不知道为什么") + "。你很快将注意力转移到多洛雷斯的表情上，那表情不知为何显得" + (int(doloresScene.saveContent.doloresFinal % 10) == 2 ? "坚忍" : "忧郁") + "且深不可测，它的神秘感深深吸引着你。");
         outputText("[pg]纵观整幅挂毯，你对女儿的活力以及西尔维娅将其栩栩如生地展现出来的技巧印象深刻。");
         doNext(tapestryMenu);
      }
      
      public function debugMenu(param1:Boolean = true) : void
      {
         get_game().debugMenu.debugCompEdit(saveContent,new SaveContent(null,null,null));
      }
      
      public function caveRead() : void
      {
         clearOutput();
         outputText("你想找点事做，于是你看到了西尔维娅放在主房间后面的书架。" + (doloresScene.get_doloresProg() > 5 ? "嗯，你知道你女儿从中获得了多少乐趣" : "西尔维娅似乎收集了不少书") + "，所以你决定去看看她的藏书。当你向这位蛾女提起这件事时，她对你报以温柔的微笑。");
         outputText("[pg][say:当然，请便。如果你需要推荐，请告诉我，否则，就随便看吧。]");
         outputText("[pg]说完，西尔维娅指引你坐到书架旁的一把椅子上，然后消失了一会儿。这个距离很容易够到书，所以你坐下来开始浏览书脊。大约过了一分钟，蛾女手里拿着一根蜡烛回来了。它的照明似乎比洞穴里昏暗的光线更适合阅读，你[if (cor < 50){感谢西尔维娅的|欣然接受了}]帮助。");
         outputText("[pg]那里的书太多了，你几乎不知如何选择，所以你毫不犹豫地随机挑选了一本。");
         switch(Utils.rand(5))
         {
            case 0:
               outputText("[pg]你拿出一卷\"坦博。\"书的内容有些过时，有些用语你也觉得陌生，但读着读着，你倒也乐在其中。五分钟后，你总算啃完了第一句话。还不错，就是里面的地理隐喻未免太多了些。");
               break;
            case 1:
               outputText("[pg]你吹掉了一本名叫富利克雷的人写的书封面上的灰尘。封面相当不起眼，一开始一切似乎都很正常，但翻了几页后，你接触到了一些将在你睡梦中陪伴你很长一段时间的东西。");
               break;
            case 2:
               outputText("[pg]你发现了一系列由一个名叫希奇金的人写的短诗。它们的主题似乎相当多样——几乎是精神分裂的——而且语气极其尖酸刻薄，但那里有一种你无法否认的魅力。");
               break;
            case 3:
               outputText("[pg]你抽出了一本翻得很旧的大部头，封面上印着\"奥伦斯贝恩\"。这是一本温馨的，甚至可能有点矫情的言情小说。等等，你刚才是不是读过这句话？你往前翻了翻，果然一字不差地写在那里。真奇怪。");
               break;
            case 4:
               outputText("[pg]书架边缘有一本书，作者是O. C. 埃孔索恩，你顺手翻开来看。内容挺有趣的，但奇怪的是，里面每个单词似乎都是小写的，唯独一个词——\"腐化\"——是大写的。");
         }
         outputText("[pg]选好书后，你安顿下来开始阅读。接下来的时间里，你周围的洞穴逐渐隐入背景，一切都在完全的寂静中度过。当你抬起头时，你看到蜡烛燃烧的程度远远超出了你的预期。看来你只是特别投入，不过没关系，你度过了一段愉快的时光[if (inte < 50) {，你觉得自己甚至可能学到了一些东西}]。你把书放回书架上原来的位置，环顾四周。");
         outputText("[pg]西尔维娅仍然坐在桌旁，现在正漫不经心地凝视着远方。当她看到你在那里时，她立刻精神焕发，从椅子上飞扑过来，轻轻地吻了你一下。");
         outputText("[pg][say:那么，你发现什么有趣的东西了吗？]她问道。");
         outputText("[pg]你告诉了她你的印象，她专心地听了几分钟，但最终，是时候离开了。你[if (sylviadom < 50) {把她拉过来|被拉过去}]进行了一个短暂的吻，然后蛾女扶你起来，送你上路。");
         if(get_player().get_inte() < 50)
         {
            dynStats(DynStat.Inte(0.5));
         }
         doNext(get_camp().returnToCampUseOneHour);
      }
      
      public function caveMenu(param1:Boolean = false) : void
      {
         if(param1)
         {
            clearOutput();
            outputText("你轻车熟路地前往西尔维娅的家，这条路对你来说现在已经" + (get_game().sylviaScene.get_sylviaProg() > 4 || doloresScene.get_doloresProg() > 5 ? "相当" : "") + "熟悉了。在泥泞的沼泽水中跋涉了几分钟后，看到那诱人的洞穴入口让你感到高兴，你赶紧走了进去。");
            if(doloresScene.get_doloresProg() == 9)
            {
               outputText("[pg]你[walk]进洞穴的主室，但没有人来迎接你。真奇怪，不过你能听到后走廊传来的声音，所以很明显还有人在这里。");
            }
            else
            {
               outputText("[pg]你看到西尔维娅在房间的后面" + (doloresScene.get_doloresProg() > 1 ? "，多洛雷斯可能在自己的房间里，如果你想" + (doloresScene.get_doloresProg() > 3 && doloresScene.get_doloresProg() != 8 ? "和她谈谈" : "见见她") + "的话" : "") + "。");
            }
         }
         menu();
         addNextButton("西尔维娅",get_game().sylviaScene.execEncounter).hint("和你的蛾女情人谈谈。").disableIf(doloresScene.get_doloresProg() == 9 && doloresScene.get_doloresTime() > 36,"她现在不在这里。");
         if(doloresScene.get_doloresProg() > 1)
         {
            addNextButton("多洛雷斯",doloresScene.encounterDolores).hint("和你的女儿共度时光。").disableIf(doloresScene.saveContent.doloresAngry,"也许你应该给她点时间冷静一下。");
         }
         addNextButton("挂毯",tapestryMenu).hint("看看洞穴墙壁上的丝绸挂毯。");
         addNextButton("阅读",caveRead).hint("看看西尔维娅的一本书。");
         addNextButton("过夜",sleepOver).hint("和" + (doloresScene.saveContent.doloresProgress > 1 ? "年长的" : "") + "蛾女共度良宵。").disableIf(get_time().hours < 21,"现在还太早了。");
         if(get_player().canFly() && doloresScene.saveContent.doloresProgress > 9)
         {
            addNextButton("家庭飞行",mothFlight).hint("和你的蛾女家人一起在天空中翱翔。");
         }
         setExitButton();
      }
      
      public function campfireYes() : void
      {
         clearOutput();
         outputText("你告诉蛾女，你非常乐意加入她，这听起来是个相当温暖的场合。她以更灿烂的笑容回应，冲向你，将自己埋在你的怀里。她柔软的头发蹭着你的脖子，感觉非常舒服，[if (tallness < 54) {虽然她必须跪下来才能做到这一点有点尴尬|你几乎有一瞬间忘记了自己}]。");
         outputText("[pg]最后，她稍微退后了一点。[say:哦，我还有个主意。这需要一些准备……希望你不介意等待，] 她说着，凝视着远方片刻。[say:在此期间，你能去问问多洛雷斯吗？哦，如果你不介意的话，我们还需要一些木柴。]");
         outputText("[pg]你告诉她你很乐意处理这件事，但在你问她这个计划是什么之前，她已经飞走了，俯冲进沼泽，只留下她挥之不去的香气。好吧，除了前往后面的走廊，别无他法。");
         outputText("[pg]你不太确定这是否是多洛雷斯会感兴趣的事情，所以你带着一丝忐忑走向她的门并敲了敲。你听到椅子摩擦的声音，几声轻柔的脚步声走向门口，然后门吱呀一声开了。[say:怎么了？] 里面传来一个忧郁的声音。");
         outputText("[pg]这可能不太令人鼓舞，但你还是说出了你的想法，解释了你和她[if (isfeminine) {另一个}]母亲打算如何生个营火，以及你多么希望她能加入你们。当你提出邀请时，她沮丧的表情瞬间亮了起来。");
         outputText("[pg][say:哦，我很乐意，] 她以令人惊讶的真诚回应道。[say:在火光下阅读，天空中挂着月亮，这一切听起来都美妙浪漫！] 你不确定是否能透过厚厚的树冠看到夜空，但你不想扫她的兴，所以你只是告诉她你正在做准备，一切准备就绪后，你们将在洞口会合。");
         outputText("[pg][say:好的。我相信我可能帮得上忙。我会把一些东西收拾在一起，在那个地方等你。] 她一本正经地点了点头，然后停顿了一下。[say:" + (get_game().sylviaScene.saveContent.unlockedOyakodon ? "如果这是为了什么奇怪的事情而精心设计的，我会非常生气的。" : "我其实不知道你们做这些应该干什么……") + "]");
         outputText("[pg]你安慰她，直到她看起来又精神焕发，然后转身走向出口。是时候收集木柴和引火物了，虽然你不确定在这个地方能找到什么质量的木材。不过，除了去做别无他法，所以你[walk]进了越来越暗的沼泽。");
         doNext(campfire2);
      }
      
      public function campfireService() : void
      {
         clearOutput();
         outputText("由于你和蛾女靠得如此之近，你开始觉得有点热，而她不断向你投来的目光也无济于事。你能看出她和你一样渴望，但[if (cor < 30) {你的矜持让你暂时克制住了自己|你不确定这是最合适的时机}]。你的欲望几乎是显而易见的，但你的女儿就在你旁边，而这个夜晚并不完全是为了那个。");
         outputText("[pg]但似乎西尔维娅明白一切。她的笑容既温暖又调皮，你几乎[if (cor < 30) {因为她脸上的暗示而脸色发白|融化在她脸上的暗示中}]。很明显她想做什么，而在你现在的状态下，你也有同样的感觉，但你不太确定她的计划是什么。");
         outputText("[pg]对你不确定的回答是一只在被子下移动的试探的手。你女儿提供的厚毯子相当隐蔽，所以这个轻微的动作并没有让布料产生太明显的晃动，但当她的手指找到你的[skindesc]时，你还是不由自主地颤抖了一下。你看了看多洛雷斯，但她什么也没注意到，她的眼睛仍然埋在书里。她脸上平静的表情只会放大你在下面体验到的感觉，你几乎发出了一声会破坏整个夜晚的声音。");
         outputText("[pg]而西尔维娅似乎打算更进一步。她那狡猾的手指[if (isnaked) {向下|伸进你的[armor]}]并[if (tailLeg) {向你的下体|在你的大腿之间}]蠕动，让你因为渴望而扭动。她第一次刷过你的[cockorvag]时，简直是令人震惊的轻率，但这只持续了片刻，当她的触摸退去的那一刻，你脑子里想的都是你有多希望它回来。");
         outputText("[pg]然而，这位蛾女非常善解人意，她很乐意展示她现在对你的身体有多了解，她的触摸优雅地回来了。那凉爽的甲壳在你的[skin.noadj]上如此光滑，对你做着绝对奇妙的事情，而你尽最大努力不把臀部顶进她的手里。第二只手停留在你的肚子上，额外的接触同时让你平静和兴奋。");
         outputText("[pg]在如此多的刺激下，你的[if (hascock) {肉棒已经[if (cumhighleast) {流出|渗出}]先列腺液|阴唇已经[if (vaginalwetness > 2) {完全被水分浸透|变得湿润}]}]，蛾女迅速利用了这一点，抹起你的一些润滑液在她的手指间挤压。当它们最终重新回到你身上时，额外的湿润感是神圣的，当你[if (sylviadom < 50) {享受|屈服于}]她的服侍时，你感觉到紧张感离开了你的身体。");
         outputText("[pg]你女儿轻声的呢喃声把你从沉思中惊醒。完全不清楚多洛雷斯发现这场幽会会有什么反应，你正考虑如何继续时，一个轻柔、丝滑的声音让[if (cor < 50) {冰冷|火焰}]冲上了你的脸。");
         outputText("[pg][say:你冷吗，亲爱的？]你的爱人问道。");
         outputText("[pg]年轻的蛾女听到声音抬起头，但西尔维娅继续以致命的稳定性抚摸着你。[if (hascock) {你的[cock]完全被她柔软的手指环绕|她的手指温柔地在你的入口处玩耍}]，虽然她保持着轻柔的触摸，但那里有一种让你发狂的坚持。它是如此令人振奋，以至于你几乎能够暂时忘记你所处的境地。");
         outputText("[pg][say:不，母亲大人，但谢谢您。实际上，火堆甚至令人惊讶地令人愉快。事实上，是[him]]——她朝你的方向指了指——[say:似乎有点发抖。你还好吗？]你的女儿给了你一个略带关切的眼神，一阵情绪的漩涡击中了你。");
         outputText("[pg]就在那时，西尔维娅选择[if (sylviadom < 50) {温柔地|坚持地}]加快她的步伐，[if (sylviadom < 50) {尽她所能地服侍你|无情地戏弄你}]，显然现在试图直接让你高潮。意图的突然转变几乎让人难以承受，但你设法[if (sylviadom < 50) {给了她|嘟囔出}]一个充分的借口，昏暗的蛾女转回了她的书。你本想松一口气，但此刻仅仅是呼吸就已经是一项足够的运动了。");
         outputText("[pg]而蛾女仍然进一步压迫你。她的第一只手[if (hascock) {收紧了抓握|滑得更深}]，而第二只手加入了它，小心翼翼地停留在你的[if (hascock) {[cockhead]|[clit]}]上。你只有片刻时间来接受它，然后她就开始移动，缓慢但坚定地按摩你最敏感的地方。早些时候的水分让她能够以令人难以置信的速度进行，让你对她的双重攻击完全没有防御能力。一个声音死在你的喉咙深处，你几乎无法坚持下去。");
         outputText("[pg][say:我爱你，]西尔维娅在你身边发出满足的呼噜声，这就足够了。");
         outputText("[pg]当你释放时，你浑身颤抖，核心处涌起的压倒性快感驱散了任何关于矜持或克制的念头。你的[if (hascock) {精液[if (cumhighleast) {完全浸透了|溅射在}]|淫液[if (issquirter) {喷洒在|[if (vaginalwetness > 2) {溅射在|漏到了}]}]}]毯子上。你确信自己弄得一团糟，但你更确信，在度过高潮时你根本不在乎这些，当一切都在你体内脉动时，你的[if (hascock) {[if (hasballs) {蛋蛋|肉棒}]抽搐着|阴蒂跳动着}]。");
         outputText("[pg]整个过程中，西尔维娅都在你的[ear]边轻声低语着鼓励的话，她的嘴唇拂过你的[skinshort]，她的呼吸弄得你头皮发痒。她的体温与你的交融，你感觉自己仿佛融化在了毯子里，与你的蛾女恋人完全合为一体。除了她如云朵般柔软的抚摸，除了你鼻腔里那甜美的气味，再没有其他，而你也不需要更多了。");
         outputText("[pg]过了好一会儿，你再次意识到你可能很快就会面临的所有潜在问题，但仅仅考虑了片刻，你就把这些都抛到了脑后，转而依偎得离蛾女更近了。从她生动的眼神中你可以看出，这对她来说同样刺激，和她一起沐浴在余韵中感觉相当不错。至于多洛雷斯，她继续看书，仿佛什么都没发生过一样，而篝火在夜色中继续摇曳。");
         get_player().orgasm("DickVaginal");
         addButtonDisabled(3,"隐秘服务");
      }
      
      public function campfireReading() : void
      {
         clearOutput();
         outputText("多洛雷斯相当安静，但从她脸上的笑容可以看出，她至少很享受。不过，既然这是一次家庭出游，你还是想让她更多地参与进来，所以你引起了她的注意，问起了她的书。");
         outputText("[pg][say:啊，我的……？]她问道，似乎对你的关心感到惊讶。[say:哦，是的，嗯，对。嗯，这只是一些诗句。旧东西，你不会……]她的嘴唇继续动了一会儿，但没有发出声音，她的目光凝视着远方。[say:你、你想听听吗？]");
         outputText("[pg]你给出了肯定的回答，西尔维娅也温暖地点了点头。这似乎给了她足够的信心继续下去，她在开始前深吸了一口气。");
         outputText("[pg][saystart]微风拂过，树叶沙沙作响，");
         outputText("[pg-]整片森林却依然寂静无声。");
         outputText("[pg-]温暖而渐暗的光线缓解了");
         outputText("[pg-]抚慰着这个世界疲惫的喧嚣。");
         outputText("[pg]落日余晖终于散尽，");
         outputText("[pg-]天空也终于变得柔和。");
         outputText("[pg-]浩瀚的苍穹显现，");
         outputText("[pg-]赐予我时常寻觅的景象：");
         outputText("[pg]上方明亮而高远的群星，");
         outputText("[pg-]悬挂于彼，不可触及，永恒不朽，");
         outputText("[pg-]以及那赢得我无尽热爱的，");
         outputText("[pg-]那广阔无垠、漆黑如墨的夜空。[sayend]");
         outputText("[pg]当她念完时，一切都安静了片刻，仿佛整个世界也随着她的话语而静止。然而，这只持续了一秒钟，西尔维娅给了她一阵小小的掌声，打破了这魔咒。年轻的蛾女微笑着看向一旁，双手摆弄着裙摆，但她似乎不像以前那样僵硬了。");
         outputText("[pg][say:是的，谢谢你，真的。最近发生的事情让我意识到，我可能过于关注散文了。]她看向一旁，眉头皱了起来。[say:外面还有很多东西，而且……而且有些人遣词造句的方式真的很令人愉悦。]\n");
         outputText("[pg]你告诉了她你对这首诗的想法，你们俩聊了一会儿，直到谈话自然而舒适地结束。之后的一段时间里，你只是呆呆地望着寂静的沼泽，什么也不想。");
         addButtonDisabled(1,"阅读");
      }
      
      public function campfireNo() : void
      {
         clearOutput();
         outputText("你告诉她你没有心情做这种事，虽然你能看到她眼中的光芒黯淡了一些，但她的笑容并没有动摇。");
         outputText("[pg][say:哦，没关系，[name]。我只是觉得……没什么，别介意。请进。]");
         caveMenu();
      }
      
      public function campfireMarshmallows() : void
      {
         clearOutput();
         outputText("你对西尔维娅做出的那些黏糊糊的白色小块很感兴趣，所以你告诉她你想尝尝。这个请求得到了一个微笑作为回应，蛾女从你身上稍微剥离了一点，在身后摸索着，很快拿出了那个小篮子。");
         outputText("[pg][say:当然，想吃多少就吃多少。]然而，当你伸手去拿一个时，她突然把篮子猛地拉了回去。[say:哦，]她举起一只手说，[say:不过有个正确的吃法。首先，我们需要找一根棍子。确保它足够长，也足够细，握起来舒服。]");
         outputText("[pg]你刚才还在找木柴，你不确定自己是否想这么快就回去找，但蛾女只是咯咯地笑。");
         outputText("[pg][say:树林边缘那里就有一根树枝。稍等一下，亲爱的，]她说着，松开你站起身来。她双翅一振，还没等你感觉到冷，就已经飞了个来回，你忍不住对她手里的两根树枝感到好奇。你到底该做些什么呢？");
         outputText("[pg][say:你把一个串在末端，然后放在火上烤。来，我演示给你看。]她边说边做。[say:诀窍是均匀加热，而且不要靠得太近。哦，这真的让我想起了童年的回忆。如果你做得对，表面就会烤出一层漂亮、均匀的浅棕色……啊，就像这样。]她收回烤签，向你展示末端的战利品——它看起来绝对美味极了，你毫不犹豫地照着她的样子做。多洛雷斯短暂地瞥了一眼这边的动静，但随着你花时间认真烤制，她很快又把鼻子埋回了书里。");
         outputText("[pg]当你觉得烤得差不多了，你开始把点心拿过来尝尝。[say:小心，会很烫的！]西尔维娅警告说，她的眼睛里带着一种奇怪的真诚关切。你注意到了这一点，把那一团举到嘴边吹了吹，趁机闻了闻味道。不出所料，它很甜，虽然你绝对能感觉到它散发出的热量，所以你在把它送到唇边之前，快速地吹了几下。");
         outputText("[pg]最外层有点脆，但非常薄，当你真正咬下去时，黏糊糊的温暖流进了你的嘴里。它几乎烫伤了你，但味道太好了，你根本不在乎，短暂地被这种甜味惊呆了。这种点心同时兼具轻盈、蓬松和黏稠的特点，带来了一种与你以前吃过的任何东西都不太一样的食用体验。它绝对值得你花精力去做，你很感激这种东西在她的家族中流传下来。");
         outputText("[pg]你意识到自己刚才闭上了眼睛，再次回过神来时，你看到西尔维娅正把她自己烤好的棉花糖递给她的女儿。多洛雷斯看起来有些犹豫，但在催促下还是咬了一口，她的眼中短暂地闪烁着喜悦的光芒，然后说道，[say:我想它确实有它的优点，但说真的，那根树枝几乎肯定是脏的。]");
         outputText("[pg]年长的蛾女只是咯咯地笑着，自己吃完了剩下的部分，品尝着美味，发出轻柔的咕噜声。这景象简直比甜点本身还要甜美，但当她再次把篮子递给你时，你当然不会拒绝再来一个。你们俩继续烤着棉花糖，直到篮子空了，在劈啪作响的篝火旁分享着欢乐的时光。");
         get_player().refillHunger(20);
         addButtonDisabled(0,"棉花糖");
      }
      
      public function campfireDone() : void
      {
         clearOutput();
         outputText("篝火开始变暗，你已经能看到你亲爱的蛾女们脸上露出了困意，所以你觉得是时候结束了。不过，就这样结束这样一个夜晚似乎有些可惜，所以你让这氛围又多停留了一会儿。");
         outputText("[pg]最后，是西尔维娅采取了行动，她挪动身体坐得更直了些，说道：[say:哦，我]——她打了个哈欠——[say:嗯……看来差不多是时候了……多洛雷斯，亲爱的，该睡觉了。]");
         outputText("[pg]你转头看向你的女儿，但她似乎仍然全神贯注于她的书。事实上，她看起来如此投入，以至于根本没有理会她母亲的指示。这有点不寻常，即使对她来说也是如此。到底是什么这么有趣，让她完全把外面的世界隔绝了？");
         outputText("[pg]回答你的是突然传来的一声呼噜，小蛾女开始向一侧倾斜。这似乎让西尔维娅觉得特别有趣，过了一小会儿她才平静下来继续说话。");
         outputText("[pg][say:我带她去睡觉。我想今晚还是挺充实的，即使我们只是待在一个地方。但这真的是一个美好的夜晚，[name]。]蛾女轻轻地蹭了蹭你。[say:我想不出还有比这更好的了。]说完，她从你身边松开并站起身，轻轻地走到你熟睡的女儿身边。西尔维娅极其小心地抱起她，将她抱在怀里，完全是一副溺爱孩子的母亲的完美画面。");
         outputText("[pg][say:哦，你走之前介意把火灭了吗？]");
         outputText("[pg]你同意了，她在退回洞穴前给了你最后一个微笑。你熄灭了篝火然后出发，尽管一种独特的温暖感觉在你胸中萦绕的时间远比它应有的要长。");
         saveContent.goneCamping = true;
         doNext(get_camp().returnToCampUseTwoHours);
      }
      
      public function campfireCuddle() : void
      {
         clearOutput();
         outputText("晚上的外面真的很冷，但在火堆、毯子和蛾女之间，你却身处奢华之中。这是你真的应该好好品味的东西，一个你不能浪费的机会。你应该利用这段时间来感激你甚至有人可以分享你的夜晚。");
         outputText("[pg]西尔维娅和你心有灵犀，当你依偎得更近时，她温柔地咕哝着，并移动手臂来协助。她的甲壳总是有点凉，但她那奇妙舒适的绒毛足以弥补这一点，你忍不住叹了口气。感觉你可以把整个世界都关在门外，而不会失去任何东西。");
         outputText("[pg]事实上，这感觉太好了，你甚至没有注意到自己的眼睛闭上了。一种温暖、平静的气味笼罩着你，你顺从了它，别无所求，什么也不想。那双[if (sylviadom < 50) {温柔的|强壮的}]、令人舒缓的手臂抱得更紧了，给了你一种安全感，让你的肩膀放松下来。你也紧紧地回抱她。");
         outputText("[pg]一声轻柔的咕噜声在你耳边响起，那种痒痒的感觉让你猛地清醒过来。你再次意识到了一些事情——裹在你身上的毛绒毯子、火堆轻柔的噼啪声，最重要的是，你被包裹在天堂般的热量中。这是一个可爱的场景，但尽管它有很多优点，你还是更喜欢那种平静的遗忘，所以你紧紧抱住蛾女，回到了那种状态。");
         outputText("[pg]你之前所有的不适都被驱散了，你无法想象还有比这更令人舒缓的地方。你不知道自己这样待了多久；你只知道你希望这能成为永远。");
         get_player().changeFatigue(-20);
         addButtonDisabled(2,"拥抱");
      }
      
      public function campfire2() : void
      {
         clearOutput();
         outputText("你的四肢开始有点酸痛，你甚至比刚才更讨厌沼泽沉闷的气氛了，但你已经设法收集了足够的木柴，可以生一个相当大的篝火了。" + (get_player().get_str() > 70 || get_player().get_tallness() > 78 ? "你能够一次把它们都带回来，而且" : "你需要跑几趟才能把它们都带回来，但") + "一切完成后，你花了一点时间放松一下。");
         outputText("[pg][say:你好，[Father]。]");
         outputText("[pg]这个声音差点让你跳起来，但看到你女儿试探性的微笑很快让你平静下来。");
         outputText("[pg][say:我收集了一些东西……] 她的右手在身后模糊地比划着，你看到那里清理出了一小块大部分干燥的地面，在一个浅坑周围铺着几块地毯。周围散落着几条折叠好的毯子，你看到旁边似乎有一桶水。总而言之，计划得相当周密，正如你告诉她的那样。");
         outputText("[pg][say:是的，这种熏香" + (get_game().sylviaScene.saveContent.unlockedOyakodon ? "——不，没有“t”——" : "") + "应该能把虫子赶走，] 她说着，举起一根细细的、散发着香味的棍子。[say:或者，啊，你想赶走的那些。我敢肯定至少会有一只爬满你全身。]");
         outputText("[pg]仿佛被咒语召唤一般，西尔维娅几乎没有发出任何声音就飞了过来，看起来有点喘不过气来。你很快注意到她的两只手臂可疑地背在身后，但在你有机会问之前，她就开始说话了。");
         outputText("[pg][say:哎呀，花的时间比我预想的要长。抱歉把担子都丢给你了，但我[i:确实]找到了我需要的一切……]她[if (sylviadom < 50) {看起来有些不确定，所以你温柔地|给了你一个苦笑，而你则尽职尽责地}]问她准备了什么。这只蛾女随后骄傲地掏出一个盖着布的编织篮子举了起来；一股淡淡的甜香从里面飘出，勾起了你的好奇心。");
         outputText("[pg][say:我还是个小女孩的时候，我母亲带我去了沼泽，给我看了一种特别的开花植物。你可以把它的根磨碎，加上一些其他东西，就能做成]——她掀开盖子——[say:这些。]篮子里是一小堆形状不规则的椭圆形团块——你意识到，这是棉花糖。它们看起来像云朵一样洁白蓬松，你非常渴望尝尝。");
         outputText("[pg][say:哦，不过那些得等火生好了才能吃。我看到你带了木柴来……而且我看到[i:你]做得多棒，]她说着，捧起小蛾女的脸颊，让她红了脸。[say:现在我们只需要把火点着——]");
         outputText("[pg][say:哦，哦，让我来，母亲大人！]刚插完话，多洛雷斯似乎有点发白。[say:我是说，如果您不介意的话，我很乐意，啊，展示一下我学到的一些东西。拜托了。]");
         outputText("[pg]没有人有异议，所以你的女儿带着近乎眼花缭乱的兴奋，开始堆叠你收集的木柴，并在底部加了一点灌木丛。伴随着简短的咒语和挥手，火焰猛烈地窜起，达到了惊人的高度，然后又降到了一个更容易控制的水平。");
         outputText("[pg][say:这样应该就都搞定了，]昏暗的蛾女说道。[say:请吧，给自己拿条毯子。]");
         outputText("[pg]这是个好建议，你照做了，[if (singleleg) {放低身子|坐}]在西尔维娅旁边，盖着一条大得足以把你们俩裹在里面的被子。你做的第一件事就是在火边暖手，你的伴侣也一样，不过多洛雷斯选择拿起一本书，这并不让人意外。");
         outputText("[pg]你们三个很快在火坑周围安顿下来，气氛融洽。剩下的就是你们将如何与蛾女们度过这个夜晚。");
         menu();
         addNextButton("棉花糖",campfireMarshmallows).hint("品尝她做的那些点心。");
         addNextButton("阅读",campfireReading).hint("问问多洛雷斯她在读什么。");
         addNextButton("拥抱",campfireCuddle).hint("依偎在一起，享受蛾女的陪伴。");
         addNextButton("隐秘服务",campfireService).hint("接受西尔维娅的一些隐秘爱意。").sexButton(-1,false);
         addNextButton("完成",campfireDone).hint("天色已晚，该收拾东西了。");
      }
      
      public function campfire() : void
      {
         clearOutput();
         outputText("当你步入洞穴时，你不禁注意到这里是多么的阴冷和黑暗。这绝不是什么无法居住的地方，而且你以前也来过这里很多次，但这次却让你感到有些不舒服。");
         outputText("[pg]当你突然意识到有两团紫色的火焰在你脑袋侧面烧出一个洞时，你同样感到不安。你向西尔维娅打招呼。");
         outputText("[pg][say:你好，亲爱的。你冷吗？你看起来简直冻僵了……] 虽然确实有点冷，[if (isfluffy) {你的[skindesc]足以让你保持温暖[if (!hasfeathers) {}]|但这绝对是夸张了}]，但似乎不值得费心去纠正她。[say:我知道该怎么做。我们应该在洞穴前生个火。听起来不错吧？我们在黑暗中拥有自己的小火堆……]");
         outputText("[pg]她满怀期待地微笑着。你想生个营火吗？");
         doYesNo(campfireYes,campfireNo);
      }
      
      public function admireTapestries() : void
      {
         clearOutput();
         outputText("你决定花点时间好好欣赏这些挂毯的工艺。在洞穴里转悠时，你发现它们的风格出人意料地多样。虽然从远处看似乎风格相似，但凑近一看，你就能感受到每一幅挂毯都倾注了爱与激情。虽然你可能不认识画中的任何主角，但你却感到一种奇妙的共鸣。即使只是他们生命中短暂的片段，也足以让你感受到他们是谁，他们的本质是什么。");
         outputText("[pg]最后，你干脆在最大的一组挂毯前拉了把椅子坐下。它们散发出的气息有一种令人平静、甚至近乎迷醉的魔力，就像一阵甜美的夏日微风吹过，扫清了你所有的世俗烦恼。你特别挑出了一幅，它的中心画面是风和日丽下的美丽森林。斑驳的树叶、随风摇曳的青草，还有那清澈得不可思议的天空，都深深地吸引着你，让你全身心都放松下来。");
         outputText("[pg]过了一会儿，西尔维娅走到你身后，双臂环绕着你的肩膀。她的存在" + (get_game().sylviaScene.get_sylviaGetDom() < 50 ? "令人平静，充满支持，她的温暖提醒着你，她会永远陪伴着你" : "令人平静，让人安心，提醒着你，她的怀抱永远有你的一席之地") + "。你们俩在沉默中坐了很久，只是享受着这氛围，但最终，这位蛾女开口了。[say: 它们……很特别，不是吗？]");
         outputText("[pg]你表示同意。");
         outputText("[pg]几分钟后，你站起身伸展四肢，坐了这么久，感觉身体出奇地僵硬。西尔维娅飞了过来——她是什么时候离开你身边的？——在你准备离开时给了你一个吻。" + (doloresScene.get_doloresProg() > 3 && doloresScene.get_doloresProg() != 8 ? "在走出洞穴的路上，你看到你的女儿在书架旁看书，你向她挥手告别，然后走了出去" : "你向西尔维娅最后挥了挥手，然后走出了洞穴") + "。");
         outputText("[pg]当你再次感受到沼泽那恶臭的空气时，你突然感到一阵震惊。" + (get_time().hours < 19 ? "你在洞穴里的这段时间，夜幕已经降临在沼泽上，吞噬了透过树叶缝隙透进来的几缕光线" : "自从你进入洞穴以来，" + (get_time().hours > 18 ? "月亮" : "太阳") + "的位置已经发生了显著的变化") + "。你在那里坐的时间是不是比你想象的要长？");
         get_player().changeFatigue(-20);
         dynStats(DynStat.Lib(-1));
         doNext(get_camp().returnToCampUseFourHours);
      }
   }
}

