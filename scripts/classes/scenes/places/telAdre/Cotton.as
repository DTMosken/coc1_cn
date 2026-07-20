package classes.scenes.places.telAdre
{
   import classes.CoC;
   import classes.Cock;
   import classes.DynStat;
   import classes.ImageManager;
   import classes.PerkLib;
   import classes.Player;
   import classes.PregnancyStore;
   import classes.StatusEffects;
   import classes.TimeAwareInterface;
   import classes._FlagDict.FlagDict_Impl_;
   import classes.display.SpriteDb;
   import classes.globalFlags.KFLAGS;
   import classes.internals.Utils;
   import classes.scenes.Camp;
   import classes.scenes.PregnancyProgression;
   import classes.scenes.VaginalPregnancy;
   import classes.scenes.places.TelAdre;
   import flash.Boot;
   import haxe.IMap;
   
   public class Cotton extends TelAdreAbstractContent implements VaginalPregnancy, TimeAwareInterface
   {
      
      public var pregnancy:PregnancyStore;
      
      public function Cotton()
      {
         if(Boot.skip_constructor)
         {
            return;
         }
         super();
         pregnancy = new PregnancyStore(674,673);
         pregnancy.addPregnancyEventSet(25,[300,200,100,40]);
         CoC.timeAwareClassAdd(this);
         PregnancyProgression.registerVaginalPregnancyScene(25,20,this);
      }
      
      public function visitCottonKids() : void
      {
         clearOutput();
         outputText("你告诉科顿，如果她不介意的话，你今天想跳过锻炼；你想去看看你的");
         if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,675) == 1)
         {
            outputText("孩子");
         }
         else
         {
            outputText("孩子们");
         }
         outputText("，可以吗？科顿惊讶地睁大眼睛，随即脸上绽开开心的笑容。[saystart]当然，小宠物，你只要开口就行！给我一分钟拿东西，然后我们就去看看");
         if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,675) == 1)
         {
            if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,702) == 1)
            {
               outputText("他");
            }
            else
            {
               outputText("她的");
            }
         }
         else
         {
            outputText("他们");
         }
         outputText("，好吗？[sayend]你点点头，看着这位马族瑜伽教练忙着收拾她每天随身带的几件东西，然后跟着她回家，迫不及待想看看你的");
         if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,675) == 1)
         {
            outputText("孩子");
         }
         else
         {
            outputText("孩子们");
         }
         outputText("过得怎么样。");
         var _loc1_:int = Utils.rand(4);
         if(_loc1_ == 0)
         {
            outputText("[pg]你的");
            if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,702) >= 2)
            {
               outputText("女宝宝正");
            }
            else
            {
               outputText("男宝宝正");
            }
            outputText("坐在");
            if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,702) >= 2)
            {
               outputText("她的");
            }
            else
            {
               outputText("他的");
            }
            outputText("婴儿床上。你们俩进来时，宝宝正开心地咕咕叫，像婴儿那样咿咿呀呀地说着，显然正用");
            if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,702) >= 2)
            {
               outputText("她的");
            }
            else
            {
               outputText("他的");
            }
            outputText("自己的小小方式表达见到你的开心。科顿对你笑了笑，[saystart]看好了；");
            if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,702) >= 2)
            {
               outputText("她");
            }
            else
            {
               outputText("他");
            }
            outputText("很喜欢这个游戏，[sayend]她对你说，然后慢慢跪到婴儿床前。[say:你好呀，我的小宝贝，你好——]科顿咕咕地哄着，轻轻拍了拍");
            if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,675) == 1)
            {
               outputText("宝宝");
            }
            else
            {
               outputText("宝宝们");
            }
            outputText("的鼻子，对");
            if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,702) == 1)
            {
               outputText("他");
            }
            else
            {
               outputText("她的");
            }
            outputText("像小孩子的父母常做的那样，咿咿呀呀地逗着。当这匹");
            if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,702) == 1)
            {
               outputText("小公");
            }
            else
            {
               outputText("小母");
            }
            outputText("小马驹正开心地咯咯笑着，科顿慢慢用手捂住她的眼睛。[say: 宝宝在哪里？小宝宝在哪里？]她问道，然后迅速移开双手，装出夸张的惊讶表情。[saystart]哎呀，那里");
            if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,702) == 1)
            {
               outputText("他");
            }
            else
            {
               outputText("她");
            }
            outputText("在这儿呢！[sayend]她惊呼一声，逗得宝宝开心地笑了起来。她又重复了好几次，宝宝玩得十分尽兴。你问科顿能不能让你也试试，她同意了；");
            outputText("你的宝宝似乎");
            outputText("看到你时有点惊讶，但这并不妨碍");
            if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,702) >= 2)
            {
               outputText("她的");
            }
            else
            {
               outputText("他");
            }
            outputText("冲你笑得和");
            if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,702) == 1)
            {
               outputText("他");
            }
            else
            {
               outputText("她");
            }
            outputText("刚才冲科顿笑时一样开心。科顿觉得自己有点被冷落了，便重新凑到你身边，你们一起玩起躲猫猫，把宝宝逗得高兴极了。");
            if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,675) > 1)
            {
               outputText("[pg]你的另");
               if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,675) == 2)
               {
                  outputText("一个宝宝");
               }
               else
               {
                  outputText("外几个宝宝");
               }
               outputText("显然也和你的第一个宝宝一样乐在其中，对你和科顿的逗弄咯咯笑着、拍着手，甚至还笨拙地想要自己模仿这个游戏。");
            }
            outputText("[pg]不过，最后，");
            if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,675) == 1)
            {
               if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,702) >= 2)
               {
                  outputText("她累了");
               }
               else
               {
                  outputText("他累了");
               }
            }
            else
            {
               outputText("他们累了");
            }
            outputText("，一边还咯咯笑着，一边安静");
            if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,675) == 1)
            {
               outputText("");
            }
            outputText("下来睡着了。你和科顿忙着照看");
            if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,675) == 1)
            {
               if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,702) >= 2)
               {
                  outputText("她的");
               }
               else
               {
                  outputText("他");
               }
            }
            else
            {
               outputText("他们");
            }
            outputText("，你替");
            if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,675) == 1)
            {
               if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,702) >= 2)
               {
                  outputText("她的");
               }
               else
               {
                  outputText("他");
               }
            }
            else
            {
               outputText("他们");
            }
            outputText("盖好被子，轻轻揉乱");
            if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,675) == 1)
            {
               if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,702) >= 2)
               {
                  outputText("她的");
               }
               else
               {
                  outputText("他的");
               }
            }
            else
            {
               outputText("他们的");
            }
            outputText("头发，一直守到");
            if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,675) == 1)
            {
               if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,702) >= 2)
               {
                  outputText("她睡着");
               }
               else
               {
                  outputText("他睡着");
               }
            }
            else
            {
               outputText("他们睡着");
            }
            outputText("。你和你的马族爱人相视一笑，亲吻你的");
            if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,675) == 1)
            {
               outputText("孩子的脸颊");
            }
            else
            {
               outputText("孩子们的脸颊");
            }
            outputText("，又吻了吻她的嘴唇，随后悄悄离开科顿的家，返回营地。");
         }
         else if(_loc1_ == 1)
         {
            outputText("[pg]然而，事实证明");
            if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,675) == 1)
            {
               outputText("你的宝宝");
            }
            else
            {
               outputText("你的孩子们全都");
            }
            outputText("睡得正香。为了不打扰");
            if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,702) >= 2)
            {
               outputText("她的");
            }
            else
            {
               outputText("他");
            }
            outputText("，科顿只是俯身靠近摇篮，轻轻抚摸着孩子的脸颊，唇边带着温柔的笑意。[say:我都快忘了当父母是什么感觉了……确实很辛苦，但也真的很值得。]她斜眼看了看你。[say:我不能说这完全是我对我们这段小关系的预期……不过我可没什么好抱怨的。]");
            outputText("[pg]你忍不住露出一抹调皮的坏笑，对科顿说她可真会哄人，然后在她脸颊上轻轻一吻，便返回营地，留下科顿和");
            if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,675) == 1)
            {
               outputText("宝宝");
            }
            else
            {
               outputText("宝宝们");
            }
            outputText("一起好好休息。");
         }
         else
         {
            if(_loc1_ == 2)
            {
               outputText("[pg]一看到科顿，你的");
               if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,702) >= 2)
               {
                  outputText("女儿");
               }
               else
               {
                  outputText("儿子");
               }
               outputText("便开始嚎啕大哭，那位母马看起来很疲惫。[say:哦，你又饿了吗，我的小宝贝？好了，好了，妈妈这就给你喂奶，稍微等我一下……]");
               if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,675) > 1)
               {
                  outputText("好在你的其他孩子似乎并不饿，所以只有这一个需要喂。");
               }
               if(get_player().lactationQ() >= 50)
               {
                  outputText("你也许可以主动替这位可怜的母马变形者给你的");
                  if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,702) != 1)
                  {
                     outputText("女儿");
                  }
                  else
                  {
                     outputText("儿子");
                  }
                  outputText("喂奶，而不是让她用奶瓶，或者随便她打算怎么做。");
                  menu();
                  addButton(0,"喂奶",feedYourCottonKids);
                  addButton(1,"保持沉默",letCottonFeedKids);
               }
               else
               {
                  menu();
                  addButton(0,"下一步",letCottonFeedKids);
               }
               return;
            }
            outputText("[pg]你的");
            if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,702) >= 2)
            {
               outputText("女儿");
            }
            else
            {
               outputText("儿子");
            }
            outputText("睁着湿润的大眼睛抬头看着你，吸着鼻子，因为");
            if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,702) >= 2)
            {
               outputText("她");
            }
            else
            {
               outputText("他");
            }
            outputText("发出一声声细小的呜咽。[say:哎呀，看来有人觉得孤单了，]科顿柔声哄着，然后意味深长地轻轻推了你一下。你意识到她是想让你抱抱自己的孩子，便上前一步，轻轻把");
            if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,702) >= 2)
            {
               outputText("她的");
            }
            else
            {
               outputText("他");
            }
            outputText("抱进怀里，还说她真是长成了一个又大又沉的");
            if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,702) >= 2)
            {
               outputText("女孩");
            }
            else
            {
               outputText("他");
            }
            outputText("了。宝宝有些害怕，犹犹豫豫，一开始还哇地哭了出来，但你轻声哄着、嘘声安抚着");
            if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,702) >= 2)
            {
               outputText("她的");
            }
            else
            {
               outputText("他");
            }
            outputText("，动作很轻柔，把小马驹紧紧抱在你的");
            outputText("[chest]前，抱着");
            if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,702) >= 2)
            {
               outputText("她的");
            }
            else
            {
               outputText("他");
            }
            outputText("来回轻摇；没过多久，小马驹便咿呀作声，急切地往你怀里蹭，任由你抱着");
            if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,702) >= 2)
            {
               outputText("她的");
            }
            else
            {
               outputText("他");
            }
            outputText("。");
            outputText("[pg]你对孩子轻声呢喃，夸他们勇敢又健康，还安慰他们说，你知道他们将来一定会长得高大强壮。你轻轻揉了揉小马驹的头发，这个动作让");
            if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,702) >= 2)
            {
               outputText("她的");
            }
            else
            {
               outputText("他的");
            }
            outputText("小耳朵以最可爱的样子抖了抖。你太沉浸在拥抱孩子的亲昵之中，直到科顿伸手抱住你、把头靠在你身上，将你们俩一同拥入怀里，你才注意到她。");
            outputText("[pg]你将孩子紧紧抱在怀里，也任由自己被她拥抱，只是享受着这份亲近的时刻，哪怕你们的关系有些古怪。最终，小马驹在你的怀中沉沉睡去，你轻声告诉科顿，她该放手了。可她反而调皮地把你搂得更紧，在你耳边低语：[say:我的……]你转过头看向她的眼睛，她便冲你露出一个温柔又顽皮的笑容，然后松开手，让你把犯困的小马驹放回床上。她只是微笑着看着你，一言不发；你也点了点头，默默告辞离开。");
         }
         doNext(get_camp().returnToCampUseOneHour);
      }
      
      public function vaginalBirth() : void
      {
         outputText("[pg]你被腹中强烈的疼痛和压力猛然惊醒。你一下子睁大眼睛，低头看见自己的肚子胀得离谱，鼓得厉害。");
         if(int(get_player().vaginas.length) == 0)
         {
            outputText("你的胯间传来一股可怕的压力……紧接着，是血肉撕裂般的剧痛。你低头一看，发现那里出现了一个阴道。");
            get_player().createVagina();
         }
         outputText("你能感觉到皮肤下有什么在动，并看着它鼓起、移动，仿佛另一个生命正在你体内独自活动。");
         outputText("[pg]奇怪的是，当你坐起身，张开[legs]摆出分娩姿势时，并没有疼痛。一阵平和与宁静笼罩了你，让你想起和科顿一起做瑜伽的时光。你深吸一口气，用尽全力向下使劲，只在中途停下来小口喘气。随着你的孩子一点点往外挤，你感觉到宫颈处传来一股突如其来的压力。");
         outputText("[pg]你并没有等太久，就看见它的头从你体内探了出来。小小的马耳长在它头顶" + (get_noFur() ? "" : "，脸上只隐约带着一点吻部的轮廓") + "。接着出来的是躯干，比头出来时更难受些，但依然不疼。最后，随着你最后一次用力，孩子的下半身伴着一股胎衣从你体内滑了出来。");
         outputText("[pg]孩子在地上挣扎了一会儿，你把它抱起来送到自己的乳头边。它很快含住乳头，像饿坏了似的吮吸起来。你趁这个机会向后坐下，仔细端详自己的亲生骨肉。恭喜，是个");
         var _loc1_:int = Utils.rand(3) + 1;
         if(_loc1_ == 1)
         {
            outputText("男孩");
         }
         else if(_loc1_ == 2)
         {
            outputText("女孩");
         }
         else
         {
            outputText("双性人");
         }
         outputText("！和");
         if(_loc1_ == 1)
         {
            outputText("他的");
         }
         else
         {
            outputText("她的");
         }
         outputText("“父亲”，");
         if(_loc1_ == 1)
         {
            outputText("他");
         }
         else
         {
            outputText("她");
         }
         outputText("身上没有毛发，只有");
         if(_loc1_ == 1)
         {
            outputText("他的");
         }
         else
         {
            outputText("她的");
         }
         outputText("头上，那里稀稀疏疏地长着些深色头发。");
         if(_loc1_ == 1)
         {
            outputText("他的");
         }
         else
         {
            outputText("她的");
         }
         outputText("双脚末端是小巧干净的蹄子，一条小刷子似的尾巴从");
         if(_loc1_ == 1)
         {
            outputText("他的");
         }
         else
         {
            outputText("她的");
         }
         outputText("身后伸出来。");
         outputText("[pg]你轻轻抚摸着自己新生的孩子，令你惊讶的是，那细小的手指竟攥住了你的手指，相比之下显得你的手指格外巨大。它的力气当然不大，可你就是舍不得把手抽开。接下来大约一个小时里，你就这样坐着，看着孩子吮吸，直到它终于吃饱，慢慢睡了过去。");
         outputText("[pg]你环顾营地，心里明白自己没法在这里照顾这样的孩子。毕竟你常常外出，恶魔入侵的威胁也始终阴魂不散。想到这里，你站起身，小心不吵醒你新生的");
         if(_loc1_ == 1)
         {
            outputText("儿子");
         }
         else
         {
            outputText("女儿");
         }
         outputText("，把");
         if(_loc1_ == 1)
         {
            outputText("他");
         }
         else
         {
            outputText("她的");
         }
         outputText("仔仔细细地裹紧，穿好衣服，朝特尔阿德雷出发。");
         outputText("[pg]城门口的守卫起初有些古怪地看着你，但当你把怀里的小宝贝给他们看时，他们立刻[say: 哦——]、[say: 啊——]地围拢过来，想看得更清楚些。他们压低声音，用哄婴儿似的语气说着话，生怕吵醒");
         if(_loc1_ == 1)
         {
            outputText("他");
         }
         else
         {
            outputText("她的");
         }
         outputText("。最后，他们终于想起你还在这儿，便散开来，挥手示意你进去。你回头看去，见到一名守卫点起一支雪茄，又把其他的分给同伴。");
         outputText("你穿过镇子，最后找到了科顿的公寓；它夹在一家裁缝店和一家熟食店之间。你敲门后没等多久，便见到了那张熟悉的脸——你的瑜伽教练，也是你的爱人。起初她见到你时显得有些惊讶，随后目光落到你怀里那小小的喜悦包裹上。她的榛色眼睛睁得大大的，强忍住一声兴奋的尖叫。");
         if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,677) > 0)
         {
            outputText("[pg]她的兴奋在抬头看向你时淡了下去，转而瞪着你。[say:我猜你也照顾不了这个孩子了？]你点点头，解释身为勇者会有多危险。她点了点头，[saystart]我当然不会把我的");
            if(_loc1_ == 1)
            {
               outputText("儿子");
            }
            else
            {
               outputText("女儿");
            }
            outputText("拒之门外。她从你手中接过孩子，将");
            if(_loc1_ == 1)
            {
               outputText("他");
            }
            else
            {
               outputText("她的");
            }
            outputText("娴熟而从容地抱在怀里。");
            outputText("[pg][say:我想我不会再见到你了，[name]，]她说道。让你惊讶的是，她居然真的叫了你的名字。[say:我还是觉得你是个混蛋，不过……照顾好自己。]她没有看你的眼睛，目光始终落在怀里的孩子身上。科顿只是有些出神地点了点头，随后关上了门，把你留在门外。");
            outputText("[pg]你叹了口气，开始踏上返回营地的漫长路程。");
         }
         else if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,675) == 0)
         {
            FlagDict_Impl_.arrayWriteInt(KFLAGS.flags,702,_loc1_);
            outputText("[pg]她把你拉过去，匆匆而尴尬地抱了一下，随后请你进屋，带你来到一间宽敞的育儿室。房间里刷着柔和的粉色、蓝色和紫色。你解释说你不能把孩子带在身边，科顿理解地点点头。[saystart]");
            if(_loc1_ == 1)
            {
               outputText("他会");
            }
            else
            {
               outputText("她会");
            }
            outputText("在这里过得很幸福的，宝贝，我向你保证。我会是个很棒的妈妈，或者该说爸爸——视情况而定。我不知道以前有没有告诉过你，几年前我也有过几个孩子。是一对双胞胎。哎呀，他们可真是两个闹腾的小家伙，一刻都坐不住，[sayend]她带着怀念的神情笑了笑。");
            outputText("[pg]所以，科顿以前当过家长？你问她当时是母亲，还是父亲。");
            outputText("[pg][say:哦，我算是“爸爸”吧，]她说到这个词时轻轻笑了笑。[say:他们的母亲来自我的故乡村子。恶魔来了之后，我们一起搬进了特尔阿德雷。后来事情自然而然地发展下去，没过多久，我们就有了两个可爱的小宝贝。]");
            outputText("[pg]你问那位母亲是什么种族；是和科顿一样的马形兽人？也许是半人马？是女人，还是扶她？");
            outputText("[pg][saystart]哦，她和我一样是兽人，我村子里大多数人都是。当然，她是女性。像我这样的扶她在那时候并不算特别常见，不过我很骄傲地说，我可是天生的！");
            if(_loc1_ == 3)
            {
               outputText("我想这也算是家族遗传吧。");
            }
            outputText("[sayend]");
            outputText("[pg]你会意地点点头。随后，你委婉地提到，科顿似乎已经不再和她昔日的心上人在一起了。是这段关系单纯没能走下去，还是……？");
            outputText("[pg]科顿想了片刻，然后回答道：[say: 这么说吧，我们渐渐发现彼此越走越远，而她也去寻找更好的归宿了。她把孩子们留给了我，不过就算重来一次，我也不会希望变成别的样子。现在我偶尔还能在特尔阿德雷见到她。我们之间倒也没什么真正的怨恨，只是短时间内不会坐下来一起喝茶了。]");
            outputText("[pg]你感谢科顿愿意告诉你这些事。随后，为了换个话题，你问起她那对双胞胎后来怎么样了——还有，从性别上来说，他们分别是什么？");
            outputText("[pg]科顿回答道：[say: 哦，一个男孩，一个女孩。异卵双胞胎。他们现在也不知道在什么地方。去年离开了特尔阿德雷，去寻找其他聚落，也想试着对抗恶魔。我偶尔会收到他们的来信，都是由路过的商人带来的，可我已经太久没见过他们了。]你看到她眼中泛起了泪光。她显然很担心他们。");
            outputText("[pg]她擦去眼泪，摆了摆手，[saystart]不过话说回来，咱们先把这个小");
            if(_loc1_ == 1)
            {
               outputText("家伙");
            }
            else
            {
               outputText("女孩");
            }
            outputText("安顿好吧。[sayend]她从你手中接过襁褓，拿来一条崭新干净的毯子，转眼间就把");
            if(_loc1_ == 1)
            {
               outputText("他");
            }
            else
            {
               outputText("她的");
            }
            outputText("熟练地裹好了。科顿把孩子放进婴儿床，退后一步欣赏自己的手艺。你走到她身边，感激地搂住她的腰，告诉她她做得棒极了。");
            outputText("[pg][say: 哦不，宝贝，]她低声回应道，[say: 这个宝宝可全都是你的功劳。]你冲她一笑，说她真会哄人，然后吻了她。你问她还需不需要你帮忙布置什么。[say: 不用，什么都别担心，一切都已经安排好了。不过如果你愿意的话，我们可以在这里再坐一会儿。]");
            outputText("[pg]你告诉她你很乐意，于是和你孩子的“父亲”一起在旁边坐下，看着你的小马驹宝宝安稳熟睡。不过最终你还是得离开，便礼貌地告辞，返回营地。");
         }
         else
         {
            outputText("[pg]在给了你一个快速而尴尬的拥抱后，她把你领进屋，带到了育儿室，里面是熟悉的柔和的粉色、蓝色和紫色。[saystart]哦");
            if(_loc1_ == 1)
            {
               outputText("他");
            }
            else
            {
               outputText("她");
            }
            outputText("真可爱，宝贝。咱们生出来的孩子就是漂亮。");
            if(_loc1_ == 1)
            {
               outputText("他");
            }
            else
            {
               outputText("她");
            }
            outputText("一定会喜欢待在这里，和");
            if(_loc1_ == 1)
            {
               outputText("他的");
            }
            else
            {
               outputText("她的");
            }
            outputText("家人在一起的，[sayend] 科顿说道。你点点头，然后问科顿，再多照顾一个孩子会不会有问题？");
            outputText("[pg][say:开什么玩笑，宝贝？孩子当然是越多越热闹，] 她轻声笑道。[say: 你再给我多生几个，咱们都能凑出一支运动队了。]");
            outputText("[pg]你坏笑着，调皮地轻点了一下她的鼻子，提醒她说，要是她不稍微小心点，你说不定真会给她凑出那支运动队来。");
            outputText("[pg][say: 要我小心？一个巴掌拍不响，要不你先别这么诱人？] 她开着玩笑，调皮地抓了一把你的[butt]。");
            outputText("[pg]你也回以坏笑，抓住科顿胯间的隆起，轻轻捏了一下，说也许她该别再让这玩意儿替她思考了……不过话说回来，要是她真这么做，你自己也会少了不少乐子，不是吗？");
            outputText("[pg][say: 要我说，它替我想得可好了。它不是给咱们带来了这些可爱的孩子吗？] 她对你开玩笑道。");
            outputText("[pg]你承认，确实如此。你在科顿屁股上拍了一下，叮嘱她照顾好自己和你们的孩子们，又告诉她你得回营地去了。");
            outputText("[pg][say: 当然了，宝贝，] 她说着，从你手里接过那个小家伙。她很快把孩子包好，安置进婴儿床里，然后在你额头上吻了一下道别。你最后抱了抱你的马儿爱人，随后便动身返回营地。毕竟，你还有忙碌的一天在等着呢。");
         }
         outputText("[pg]");
         var _loc2_:IMap = KFLAGS.flags;
         FlagDict_Impl_.arrayWriteInt(_loc2_,675,FlagDict_Impl_.arrayReadInt(_loc2_,675) + 1);
         if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,675) == 1)
         {
            FlagDict_Impl_.arrayWriteInt(KFLAGS.flags,676,1);
         }
         get_player().knockUpForce();
      }
      
      public function updateVaginalPregnancy() : Boolean
      {
         var _loc1_:Boolean = false;
         if(get_player().get_pregnancyIncubation() == 320)
         {
            outputText("[pg]<b>你发现自己的肚子变大了。也许你该少吃点那些奇怪的食物。不过，你倒是莫名很想吃燕麦和谷物。</b>[pg]");
            _loc1_ = true;
         }
         else if(get_player().get_pregnancyIncubation() == 280)
         {
            outputText("[pg]<b>你的肚子隆起得越来越明显。你多半是怀孕了。你对燕麦和谷物的强烈渴望，已经很清楚地提示了那个“父亲”可能是谁。</b>[pg]");
            _loc1_ = true;
         }
         else if(get_player().get_pregnancyIncubation() == 225)
         {
            outputText("[pg]<b>你腹部已经能看出明显的孕肚隆起。你抚摸着那圆鼓鼓的肚子，半带笑意地想着，自己会不会生下一个像她“爸爸”一样的女儿。</b>[pg]");
            _loc1_ = true;
         }
         else if(get_player().get_pregnancyIncubation() == 165)
         {
            outputText("[pg]<b>子宫里突然传来一下小小的踢动，把你吓了一跳。片刻之后又来了一下，让你忍不住倒吸一口气。你体内的宝宝真的很像马类；她这会儿踢起人来就已经相当有劲了。</b>[pg]");
            _loc1_ = true;
         }
         else if(get_player().get_pregnancyIncubation() == 105)
         {
            outputText("[pg]<b>你现在的肚子已经和家乡任何孕妇差不多大了。考虑到你怀着的严格来说是一匹小马驹，你不禁怀疑自己还会再大到什么程度……</b>[pg]");
            _loc1_ = true;
         }
         else if(get_player().get_pregnancyIncubation() == 80)
         {
            outputText("[pg]<b>要是在英格纳姆，你这肿胀的肚子肯定会让人怀疑是不是怀了双胞胎。不过，你只能感觉到一个强而有力的心跳，在你被撑大的腹部里不断跳动。科顿的小马驹显然正健康地成长着……");
            outputText("[pg]你为此感到高兴，但也有点担心分娩的事。</b>[pg]");
            _loc1_ = true;
         }
         else if(get_player().get_pregnancyIncubation() == 50)
         {
            outputText("[pg]<b>你的肚子胀得又痛又肿；你觉得再大一点，自己就要被撑爆了。夜里，你发现自己像村里那些待产的母马一样，焦躁不安地来回踱步。你急切地盼着终于能生产，一方面是想把这个沉重的宝宝从体内生出来，另一方面也是终于能抱抱自己的孩子。</b>[pg]");
            _loc1_ = true;
         }
         if(get_player().get_pregnancyIncubation() == 32 || get_player().get_pregnancyIncubation() == 64 || get_player().get_pregnancyIncubation() == 85 || get_player().get_pregnancyIncubation() == 150)
         {
            _loc1_ = true;
            if(get_player().biggestTitSize() >= 3 && get_player().mostBreastsPerRow() > 1 && get_player().biggestLactation() >= 1 && get_player().biggestLactation() < 2)
            {
               outputText("[pg]你的乳房因为积蓄了额外的乳汁而胀得发紧。你不禁想着，它们究竟是在为哺育什么样的生物做准备。[pg]");
               get_player().boostLactation(0.5);
            }
            if(get_player().biggestTitSize() >= 3 && get_player().mostBreastsPerRow() > 1 && get_player().biggestLactation() > 0 && get_player().biggestLactation() < 1)
            {
               outputText("[pg]随着身体为即将到来的分娩做准备，几滴乳汁从你的乳头渗了出来。[pg]");
               get_player().boostLactation(0.5);
            }
            if(get_player().biggestTitSize() >= 3 && get_player().mostBreastsPerRow() > 1 && get_player().biggestLactation() == 0)
            {
               outputText("[pg]<b>你意识到自己的乳房胀得很满，还会偶尔泌乳</b>。这一定是怀孕造成的。[pg]");
               get_player().boostLactation(1);
            }
            if(get_player().biggestTitSize() == 2 && get_player().mostBreastsPerRow() > 1)
            {
               outputText("[pg]<b>由于即将临盆，你的乳房已经胀大到了 C 罩杯。</b>[pg]");
               get_player().growTits(1,1,false,3);
            }
            if(get_player().biggestTitSize() == 1 && get_player().mostBreastsPerRow() > 1)
            {
               outputText("[pg]<b>你的乳房已经长到了 B 罩杯，</b>很可能是怀孕带来的荷尔蒙变化所致。[pg]");
               get_player().growTits(1,1,false,3);
            }
         }
         return _loc1_;
      }
      
      public function turnDownYogaWifCottonFirstTime() : void
      {
         spriteSelect(SpriteDb.get_s_cotton());
         clearOutput();
         outputText("[say: 没关系，各有所好嘛。如果你哪天改变主意，我会在这里的。]说完，科顿回到她的垫子上，继续做着各种姿势的伸展。[pg]");
         doNext(get_camp().returnToCampUseOneHour);
      }
      
      public function timeChangeLarge() : Boolean
      {
         if(get_game().time.hours == 6 && FlagDict_Impl_.arrayReadInt(KFLAGS.flags,245) == 1 && get_player().biggestLactation() >= 2)
         {
            FlagDict_Impl_.arrayWriteInt(KFLAGS.flags,245,0);
            nomSomeTitMilkCereal();
            return true;
         }
         return false;
      }
      
      public function timeChange() : Boolean
      {
         var _loc1_:* = null as IMap;
         pregnancy.pregnancyAdvance();
         if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,675) > 0 && get_game().time.hours == 23)
         {
            _loc1_ = KFLAGS.flags;
            FlagDict_Impl_.arrayWriteInt(_loc1_,676,FlagDict_Impl_.arrayReadInt(_loc1_,676) + 1);
         }
         return false;
      }
      
      public function tellCottonToKeepFiringBlanksAsshole() : void
      {
         clearOutput();
         outputText("你告诉科顿，你并不想强迫她再生更多孩子，所以她应该继续服用那些草药；在你看来，不完美的保护也比完全没有保护强。");
         outputText("[pg]科顿点点头，[saystart]那好吧。就像他们说的，谨慎点总比");
         if(!get_silly())
         {
            outputText("事后后悔强");
         }
         else
         {
            outputText("被一群小马人淹没强");
         }
         outputText("，对吧？[sayend]");
         outputText("[pg]你感谢她理解你，然后换了个话题，准备聊聊别的事。");
         FlagDict_Impl_.arrayWriteInt(KFLAGS.flags,679,0);
         cottonMenu();
      }
      
      public function tellCottonStopEatingHorsePills() : void
      {
         clearOutput();
         outputText("你告诉科顿，既然那些草药对她这么没用，而她也不介意以后可能再要孩子，那你允许她停用。");
         outputText("[pg]她点点头说道，[say: 那我从明天开始就停掉吧。]");
         outputText("[pg]你感谢她理解你，然后换了个话题。");
         FlagDict_Impl_.arrayWriteInt(KFLAGS.flags,679,1);
         cottonMenu();
      }
      
      public function serviceFirstTimeCotton() : void
      {
         spriteSelect(SpriteDb.get_s_cotton());
         FlagDict_Impl_.arrayWriteInt(KFLAGS.flags,177,2);
         get_player().slimeFeed();
         clearOutput();
         get_images().showImage("cotton-first-time-give-her-blowjob");
         outputText("你温顺地点头表示同意，目光盯着她的肉棒。[say: 噢，对这个感兴趣，是吗？好吧，我可不想让我的小宠物失望。]她稍稍退后，让你站到她的淋浴水流下，然后把你推成跪姿。她用手沿着那根马一样的肉棒抚过，把它托起来，直到它与你的脸正面相对。[say: 不如你先把它好好准备一下？][pg]");
         outputText("你点点头，咽了咽口水，握住她的肉棒，摸索着那温热、半硬的长度。你把它伸到水流下，轻轻揉搓，让它逐渐硬起来。你偶尔抬头看向科顿，确认自己做得还行，而她只是对你微笑，无声地鼓励你继续。[pg]");
         outputText("你向前倾身，试探着沿侧面舔了一下，惊讶地发现味道相当甜美宜人。你又舔了一下，再舔一下，同时尽职地套弄着它。没过多久，它就完全勃起了，按你的估计至少有两英尺长。你并没有被吓住，反而更加来劲！毕竟，你要吸的肉棒可多着呢，而时间却没那么充裕。[pg]");
         outputText("你稍稍往后退，舔了舔科顿肉棒的头部；那扁平的龟头确实是个不小的挑战。你张大嘴含住顶端，用舌头沿着边缘打转，挑逗着情人的尿道，直到她微微喘息。然后你顺着她那惊人的肉棒缓缓吞下去，舌头在下侧起伏滑动，让它更深地进入你的口中，接着滑入喉咙。你上下套弄、吮吸、舔舐。[pg]");
         outputText("科顿向前一挺，双手撑在你身后的墙上，[say: 快了……快了……]她低声说道。要是可以的话，你一定会咧嘴笑出来，可嘴里塞满了肉棒，实在有些困难。于是你只是继续下去，含着面前的肉棒上下套弄。没过多久，你感觉这名马女身体绷紧，肉棒在你口中变得更加坚硬。你向后退开，刚松开嘴里的肉棒，它便爆发出一股精液，喷得你满脸满身都是。[pg]");
         outputText("你把它咽了下去，对那微甜的味道有些意外。你伸出两根手指，抹起一些落在脸上的精液舔掉，然后仔细舔着科顿迅速缩小的肉棒，直到上面一滴精液都不剩。[pg]");
         outputText("科顿扶你站起来，给了你一个温暖的吻，在你嘴里尝到她自己的精液味道。你们默默地洗完澡，重新穿好衣服，走出健身房。科顿挽住你的胳膊说：[say: 真棒，小宠物。随时来健身房找我吧，我会等你的。]说完，她便回家去了。你脸上带着一丝笑意，也照做了。");
         dynStats(DynStat.Sens(1),DynStat.Lust(10 + get_player().lib / 20 + get_player().sens / 20));
         doNext(get_camp().returnToCampUseOneHour);
      }
      
      public function repeatContraceptionToggleCotton() : void
      {
         clearOutput();
         if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,679) == 1)
         {
            outputText("你告诉科顿，虽然你知道这不是完美的解决办法，但你希望她重新开始服用那些草药。");
            FlagDict_Impl_.arrayWriteInt(KFLAGS.flags,679,0);
            outputText("[pg]科顿点点头，[saystart]那好吧。就像他们说的，谨慎点总比");
            if(!get_silly())
            {
               outputText("事后后悔强");
            }
            else
            {
               outputText("被一群小马人淹没强");
            }
            outputText("，对吧？[sayend]");
            outputText("[pg]你感谢她理解你，然后换了个话题，准备聊聊别的事。");
         }
         else
         {
            outputText("你告诉科顿，如果她愿意，你已经准备好让她再次停用那些草药了。");
            outputText("[pg]她点点头说道，[say: 那我从明天开始就停掉吧。]");
            outputText("[pg]你感谢她理解你，然后换了个话题。");
            FlagDict_Impl_.arrayWriteInt(KFLAGS.flags,679,1);
         }
         cottonMenu();
      }
      
      public function refuseFirstTimeCotton() : void
      {
         spriteSelect(SpriteDb.get_s_cotton());
         clearOutput();
         outputText("她看着你，神情有点失落，[say: 你确定吗，宠物？好吧。可你不知道自己错过了什么。]你们两人规规矩矩地洗完澡，没有做什么出格的事，然后重新穿好衣服，离开健身房。科顿在你走远前叫住你，说：[say: 嘿，如果你以后还想来健身房做点瑜伽，我很乐意帮忙。]接着她沿着街道离开，而你则回到了营地。");
         doNext(get_camp().returnToCampUseOneHour);
      }
      
      public function pregCottonChance() : void
      {
         if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,679) != 0)
         {
            if(pregnancy.knockUpChance(20,100))
            {
               pregnancy.knockUp(25,350);
            }
         }
         else if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,675) == 0)
         {
            if(pregnancy.knockUpChance(20,100))
            {
               pregnancy.knockUp(25,350);
            }
         }
         else if(pregnancy.knockUpChance(0,20))
         {
            pregnancy.knockUp(25,350);
         }
      }
      
      public function nomSomeTitMilkCereal() : void
      {
         spriteSelect(SpriteDb.get_s_cotton());
         get_images().showImage("cotton-visits-you-at-camp-drinks-all-your-milk-the-asshole");
         outputText("[pg]你醒来时，听见营地周围的灌木丛里传来沙沙声。[pg]");
         outputText("你迅速起身，握好武器，准备应对任何可能从灌木丛里冲出来的东西。片刻之后，一个高大的黑影猛地穿过灌木。你正要出手，却认出了那个身影！是特尔阿德雷健身房的科顿！她没有穿平时的瑜伽服，而是穿着一件紧身棕色上衣和宽松的棕色长裤，一只肩上还挎着背包。[pg]");
         outputText("马女孩以毫无敌意的姿态举起双手。[say: 哇哦，别紧张，宠物。我只是来陪你吃早饭的。]你叹了口气，把武器收了起来。[say: 这么容易受惊啊？]她一边说，一边打量着你的营地。[say: 你这里布置得挺不错嘛。我都不明白你为什么不干脆搬到特尔阿德雷去。我有个不错的小住处，我们可以一起住……不过无所谓。][pg]");
         outputText("你请她到你的铺盖边坐下。她也跟着坐下，卸下背包，在里面翻找了一会儿，取出一个陶碗和一个棕色的大袋子。她打开袋子，倒出满满一碗谷粒和燕麦。[say: 平常我都是直接生吃早饭的……不过今天我想试点不一样的。]");
         outputText("科顿把碗放到你腿上，拉下你[armor]的前襟，让你的[chest]暴露在清凉的晨风里。一阵战栗顺着你的脊背窜过，你的乳头立刻开始变硬，仿佛已经知道这个马女孩打算做什么。科顿俯下身，双唇含住一颗[nipple]，挑逗地吸吮着，还用舌尖拨弄着顶端。[pg]");
         outputText("你感到那种熟悉的感觉——液体正被从体内吸出来。很快，科顿便开始吮吸你溢乳的乳房。她松开乳头，咂了咂嘴，然后把碗举到你的乳房前。她用另一只手牢牢抓住你的[nipple]和乳房，又拉又挤。美味的白色乳汁开始从你的乳腺管里喷出，滴滴答答地洒进那碗谷物里。你的乳房被毫不留情地挤奶，你忍不住呻吟起来，在座位上扭动着身体。[pg]");
         outputText("科顿最后舔了那边乳房一下，然后转向另一边。没一会儿，那边也喷出大量乳汁，落进碗里。被手挤奶的感觉美妙极了，如此亲密，又如此私密。细小的震颤掠过你的乳房，一路传遍全身，让你的身体不停颤抖。你的嘴唇张成O形，随着乳房高潮在体内翻涌，你发出一声声愉悦的低吟。[pg]");
         outputText("就这样，科顿的手离开了你的乳房，但那股灼热而兴奋的感觉并没有随之消退。你睁开眼看向她。她对你笑了笑，吃了一口谷物。[pg]");
         outputText("[say: 嗯，你可真美味，宠物，]她轻快地说道，[say: 来，尝一口。]她舀起一勺谷粒、燕麦和奶，送到你嘴边。你犹豫着咬了一口，随即忍不住露出笑容。你的奶香甜顺滑，和谷物相得益彰。你嚼了嚼咽下去，又吃了一口。[pg]");
         outputText("你们一边从碗里吃着东西，一边聊些无关紧要的小事，主要是特尔阿德雷的各种传闻八卦。等碗里的东西全都吃完，科顿把碗舔干净，又把所有东西收拾好。[pg]");
         outputText("[say: 谢谢你，宠物，真好吃。我一定还会再来，到时候我们可以一起吃顿饭。你也随时可以来健身房找我。我们可以更……亲密一点。]她吻了吻你的脸颊，然后朝特尔阿德雷的方向离开了。");
         dynStats(DynStat.Lib(-0.5),DynStat.Sens(-0.5),DynStat.Lust(-5));
         get_player().boostLactation(0.05);
         if(get_player().hasStatusEffect(StatusEffects.Feeder))
         {
            get_player().addStatusValue(StatusEffects.Feeder,1,1);
            get_player().changeStatusValue(StatusEffects.Feeder,2,0);
         }
         doNext(playerMenu);
      }
      
      public function letCottonFeedKids() : void
      {
         clearOutput();
         outputText("你静静地看着科顿脱下上衣，露出深色肌肤的乳房，以及上面巧克力色的乳头。你的孩子咕咕地笑着，知道喂奶时间到了，那双尚未发育完全的小手饥切地伸向乳房。她微笑着把小驹抱到胸前，让它含住乳头，开始急切地吮吸。");
         outputText("[pg]你们俩坐在一起，看着孩子毫无顾忌地吃奶，静静享受着彼此的陪伴。[say: 这些小家伙能喝下这么多奶，真是让我惊讶，]科顿微笑着说道。");
         outputText("[pg]你说，嗯，它们需要喝奶，才能长得又高大、又强壮、又性感，就像科顿本人一样。说完这话时，你咧嘴一笑，捏了捏科顿紧实有力的屁股。");
         outputText("[pg]你注意到，孩子咕嘟咕嘟地吮吸时，科顿时不时忍不住发出一声轻轻的呻吟。她尽力想掩饰，却藏得不够好。不过很快，你就看到孩子变得越来越没精神。最后，它打了个大大的哈欠，随即[say: 嗝，]了一声，便在自己的毯子里安顿下来睡午觉了。");
         outputText("[pg]科顿又抱了它一会儿，然后把它交给你，好让自己穿上衣服。你把孩子抱在怀里，慢慢摇晃着，哼着安抚的曲调。你怀里的这个孩子，看起来和英格纳姆那边的婴儿差别真大……");
         outputText("[pg]科顿套上平时穿的背心，低头欣赏着你怀里的孩子。[saystart]把");
         if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,702) >= 2)
         {
            outputText("她放下去睡午觉吧，好吗，宠物？[sayend]");
         }
         else
         {
            outputText("他放下去睡午觉吧，好吗，宠物？[sayend]");
         }
         outputText("[pg]你向她点点头，轻轻把昏昏欲睡的宝宝放回");
         if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,702) >= 2)
         {
            outputText("她的");
         }
         else
         {
            outputText("他的");
         }
         outputText("小床。你揉了揉");
         if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,702) >= 2)
         {
            outputText("她的");
         }
         else
         {
            outputText("他的");
         }
         outputText("头发，并告诉科顿，她生的小马驹个个都漂亮极了。她只是点点头，轻轻捏了捏你的肩膀，心满意足地静静看了一会儿。");
         outputText("[pg]最后，你有些抱歉地告诉她你得走了；还有地方要去，还有怪物要打，她懂的。她理解地点点头，你给了她一个短吻，然后离开，回到了营地。");
         doNext(get_camp().returnToCampUseOneHour);
      }
      
      public function leaveCotton() : void
      {
         spriteSelect(SpriteDb.get_s_cotton());
         clearOutput();
         outputText("你感谢科顿抽出时间，冲了个澡，然后回到营地。");
         doNext(get_camp().returnToCampUseOneHour);
      }
      
      public function leaveAfterYoga() : void
      {
         spriteSelect(SpriteDb.get_s_cotton());
         clearOutput();
         outputText("[say:随你吧。你可以继续浑身臭烘烘地到处跑，反正我要去洗澡了。想的话，之后随时可以再来做瑜伽。]说完，科顿朝淋浴间走去，而你离开了健身房。[pg]");
         doNext(get_camp().returnToCampUseOneHour);
      }
      
      public function goTellCottonShesAMomDad() : void
      {
         clearOutput();
         outputText("确信科顿就是你腹中孩子的父亲后，天一亮，你便收拾好平时带的东西，动身前往特尔阿德雷。你先去了健身房，打听到科顿住处的方向，然后便赶了过去。");
         outputText("[pg]结果发现，科顿住在一间小公寓里，位置离城镇的主要街区有些远，夹在一家看起来有点破旧的裁缝店和一家小而整洁的熟食店之间。你鼓起勇气，接连敲响了门。[say: 来了，来了！——哈欠——这一大清早的，是谁啊？]科顿在屋里喊道，一边拉开门，睡眼惺忪的脸上带着几分不快。看见站在门口的是你，她惊讶地眨了眨眼；你则为这么早来打扰她道了歉。你解释说，自己有重要的事要和她谈，然后问她能不能进去。");
         outputText("[pg][say: 啊……当然可以，宠儿。我正好要吃早饭，一起吗？]她礼貌地问道，扶着门示意你进来。你向她道谢，跟着她来到厨房。在那里，穿着睡衣的马人往两个碗里倒满混合燕麦和谷物，又加了些牛奶，然后把其中一碗递给你。你谢过她，便狼吞虎咽地吃了起来，还提到自己最近一直很想吃这东西。科顿有些不安地看着你吃，但也安静地吃完了自己的那碗。等你们都吃完后，她轻轻清了清嗓子。[say: 那么，是什么风把你吹到这儿来的，我的小宠儿？总不可能只是来陪我吃早饭吧，]她说道。");
         outputText("[pg]你告诉她，没错。你把椅子往后挪了挪，轻轻把一只手放在自己日渐隆起的肚子上，告诉她你们俩显然没有做到足够小心。最近，科顿可是在你身上留下了相当明显的痕迹。");
         outputText("[pg]科顿一脸困惑，过了几秒才恍然大悟。[say: 天啊……你怀孕了？我要当爸爸了？]");
         outputText("[pg]你告诉她，你很确定就是这么回事。");
         outputText("[pg][say: 我……哦，天啊……我们该怎么办？]她瘫坐在椅子上问道。");
         outputText("[pg]你告诉她，这主要取决于她；她想要这个孩子吗？她还想要你吗？");
         outputText("[pg][say: 当然！]科顿激动地喊道。[say: 你把我当成什么样的女人了？你觉得我会抛弃自己的孩子，或者孩子的母亲吗？]她若有所思了一会儿，然后说道：[say: 我想……对，什么都不用担心。等你快生的时候，我会把一切都准备好的，我的小宠物。]她把一只手放在你的肚子上，轻声说道：[say: 还有我的小小宠物。]她把手移到下巴上，显然陷入了沉思，脑子里肯定已经开始盘算所有需要处理的准备工作了。");
         outputText("[pg]你感谢她准备的早餐，然后礼貌地告辞。很明显，她接下来有不少事要忙，而你也该回去了。你离开这间小公寓，轻轻带上身后的门，朝营地的方向走去。");
         FlagDict_Impl_.arrayWriteInt(KFLAGS.flags,681,1);
         doNext(get_camp().returnToCampUseOneHour);
      }
      
      public function fuckCottonInShowerRepeat() : void
      {
         FlagDict_Impl_.arrayWriteInt(KFLAGS.flags,177,2);
         spriteSelect(SpriteDb.get_s_cotton());
         clearOutput();
         get_images().showImage("cotton-shower-fuck-repeat");
         var _loc1_:int = get_player().cockThatFits(60);
         if(_loc1_ < 0)
         {
            _loc1_ = 0;
         }
         if(get_player().isTaur())
         {
            outputText("你决定接受她的提议，领着她进了淋浴间，迅速脱下衣服，打开一个空着的淋浴喷头。科顿也脱光了衣服，你把她拉到水流下，暂时让自己的马身留在水外。蒸汽开始在你们周围升腾，你们接吻缠绵。她用手穿过你的[hair]，按住你的后颈，");
            if(pregnancy.get_event() > 1)
            {
               outputText("轻轻把你拉向她隆起的肚子。你一边亲吻她，一边忍不住把手贴了上去。那鼓胀的腹部结实而坚硬，几乎像一面由实心肌肉绷成的鼓。你抚摸着它，和这位雌马兽化人热烈亲吻，引得她对你的动作发出轻柔而满足的低哼。[pg]");
            }
            else
            {
               outputText("把你拉得更近。[pg]");
            }
            if(get_player().cockArea(_loc1_) >= 100)
            {
               if(get_player().cockTotal() == 1)
               {
                  outputText("你感觉自己的" + get_player().cockDescript(_loc1_) + "在庞大的身躯下蠢蠢欲动，而科顿的却出奇地仍然软垂着。她的阴茎晃荡着，你的则迫切地渴求关注。");
               }
               else if(get_player().cockTotal() > 1)
               {
                  outputText("你感觉自己的[cocks]在庞大的身躯下蠢蠢欲动，而科顿的却出奇地仍然软垂着。她的阴茎晃荡着，你那一组阴茎则迫切地渴求关注。");
               }
            }
            else if(get_player().cockTotal() == 1)
            {
               outputText("你感觉自己的" + get_player().cockDescript(_loc1_) + "在庞大的身躯下蠢蠢欲动，同时你也看着科顿的同样硬了起来。她的阴茎蹭着你的肚子，而你的则迫切地渴求关注。");
            }
            else if(get_player().cockTotal() > 1)
            {
               outputText("你感觉自己的[cocks]在庞大的身躯下蠢蠢欲动，同时你也看着科顿的同样硬了起来。她的阴茎蹭着你的肚子，而你那一组阴茎则迫切地渴求关注。");
            }
            if(get_player().hasVagina())
            {
               outputText("与此同时，你身后的" + get_player().vaginaDescript(0) + "也因为蒸汽和情欲而变得湿润，你的[clit]隐隐发胀，渴望被爱抚。");
            }
            outputText("[pg]");
            if(get_player().biggestTitSize() >= 2)
            {
               outputText("科顿俯下身，揉捏着你的" + get_player().biggestBreastSizeDescript() + "，将一颗[nipple]含入口中，贪婪地吮吸起来。");
               if(get_player().biggestLactation() >= 1)
               {
                  outputText("她的努力很快得到了回报，乳汁开始从你的[nipple]渗出。科顿惊讶地抬眼看向你的脸，却没有松开嘴，反而趁机大口吞咽你美味的奶水。没过多久，她才退开，擦了擦嘴，几乎是扑向你的另一只乳房，急切地想把其中珍贵的奶水吸干。那种被抽空的感觉涌上来，让你忍不住呻吟出声。片刻后，科顿松开你，咂了咂嘴。[say: 那可真是美味极了的奶水，宠物，我以后可能得更常尝尝你的味道。]");
                  FlagDict_Impl_.arrayWriteInt(KFLAGS.flags,245,1);
               }
               else
               {
                  outputText("科顿很快换到另一边乳房，用她灵巧的舌头挑逗你的[nipple]。");
               }
               outputText("[pg]");
            }
            outputText("如今兴致已经被充分挑起，你环顾四周，从更衣室附近拖来一张长凳放进淋浴间，拉到水流下方。科顿咧嘴一笑，明白了你打算拿它做什么，于是趴到长凳上四肢着地。你跨到长凳上方，让身体处在淋浴水流下，并把阴茎摆好位置。你这位同为马属的爱人帮你做最后的细微调整，把你的阴茎抵在她的入口处，同时安抚似的拍了拍你的下腹。你慢慢向前顶入，科顿咬住嘴唇，又安抚地拍了拍你。");
            if(get_player().cockTotal() == 2)
            {
               outputText("你嘴角带着一丝笑意，开始用另一根多出来的阴茎去顶弄科顿的另一个洞口。你听见她不满地哼了一声，随后又化作一声叹息，接着便感觉到她的双手握住你的肉棒，引导它一路没入她的洞中。");
            }
            else if(get_player().cockTotal() > 2)
            {
               outputText("你其余的阴茎摇晃弹动着，胡乱蹭过她的大腿和臀部。");
            }
            if(get_player().cockArea(_loc1_) > 70)
            {
               outputText("虽然你对她来说实在太大了，但你还是尽量把她塞得满满的。她的小穴本就不小，却依然紧紧夹住你的" + get_player().cockDescript(_loc1_) + "。她浑身发颤，靠在长凳上，抓着你的前腿支撑身体。你用那根过大的家伙一次又一次在她体内抽送，把她原本就不算小的小穴撑得更开。她的舌头竟然从" + (get_noFur() ? "嘴" : "口鼻") + "里滑了出来，歪垂在一旁，双眼上翻，彻底沉溺在快感之中。她的身体在高潮中震颤，而你仍在水流下不断抽插。");
            }
            else if(get_player().cocks[_loc1_].cockLength < 4)
            {
               outputText("她的认可似乎动摇了，你听见身下传来一句，[say: 已经进来了吗？] 你的脸一下子涨红，尴尬地低头确认确实已经进去了。科顿安抚地揉了揉你的一条前腿，说道，");
               if(pregnancy.get_event() > 1)
               {
                  outputText("[say:别担心，宠物，对我来说已经足够了。而且你得承认，]她坏笑着，抚摸着自己圆滚滚的肚子，[say:它确实完成任务了，不是吗？]");
               }
               else
               {
                  outputText("[say:别担心，宠物，对我来说已经足够了。]");
               }
               outputText("你唇边浮起一丝淡淡的笑意，把自己的" + get_player().cockDescript(_loc1_) + "完全推进她体内。以你的尺寸来说，这算不上什么了不起的成就，但依然足以让你感到愉悦。");
            }
            else
            {
               outputText("你来回抽送着，尽管科顿的小穴相当宽裕，却仍能紧紧裹住你。你的马儿爱人呻吟着，双手抓住你的胸口，最后甚至抓住你的腿借力，身子却向后仰去。");
            }
            outputText("[pg]");
            outputText("你就这样持续了一阵子，以你这副体型和身躯，疲劳根本不成问题。另一边，科顿已经能听见地喘着气，前半身趴在长凳上，屁股高高翘在空中。她爱怜地抚摸着你的前腿，表示她还想要更多。");
            if(get_player().cockArea(_loc1_) >= 100)
            {
               outputText("你并未察觉，随着一次高潮震颤她的全身，她那根软垂的阴茎正把精液漏到长凳上。");
            }
            else if(pregnancy.get_event() > 1)
            {
               outputText("你并未察觉，随着一次高潮震颤她的全身，她自己的阴茎抽动痉挛着，将精液喷洒在她隆起的孕肚、乳房和长凳上。");
            }
            else
            {
               outputText("你并未察觉，随着一次高潮震颤她的全身，她自己的阴茎抽动痉挛着，将精液喷洒在她的肚子、乳房和长凳上。");
            }
            if(get_player().cockArea(_loc1_) > 70)
            {
               outputText("即便你已经这样不断撞击，也没法把自己的整根粗大家伙都塞进她体内，但她根本不在乎。她的眼睛似乎来回翻动，像是很难聚焦，舌尖把水珠、汗水和口水都滴落到自己身上。她喘息着，在哗哗水声中，你隐约能听见她低声喊着，[say:诸神啊，诸神啊]。要是能看见她结实的腹部，你确信一定能看到你的" + get_player().cockDescript(_loc1_) + "在里面顶出的轮廓。她在淋浴下弓起背，红发凌乱地披散在脸庞和长凳周围，咬住嘴唇，任由又一次高潮震颤全身。");
            }
            outputText("[pg]");
            outputText("最后你再也承受不住了。你最后一次顶进伴侣体内，高潮席卷全身，狂喜如闪电般击中每一根神经，你不由得发出一声如释重负的喘息。");
            if(get_player().hasVagina())
            {
               outputText("你的" + get_player().cockDescript(_loc1_) + "在科顿温暖的小穴里喷发，而她的小穴紧紧夹住你；与此同时，你自己的雌性器也一阵抽动，对着空气收缩，淫液顺着双腿淌下。");
            }
            else
            {
               outputText("你的" + get_player().cockDescript(_loc1_) + "在科顿温暖的小穴里喷发，而她的小穴紧紧夹住你。");
            }
            outputText("你又象征性地挺动了几下，然后拔了出来。就在这时，");
            if(get_player().cumQ() < 200)
            {
               outputText("精液开始从她的阴唇间渗出");
            }
            else if(get_player().cumQ() < 700)
            {
               outputText("一股精液从科顿的阴唇间涌了出来");
            }
            else if(get_player().cumQ() < 1200)
            {
               outputText("一小股精液从科顿的阴唇间奔涌而出");
            }
            else if(get_player().cumQ() < 2000)
            {
               outputText("精液从她被折腾过的穴口涌了出来");
            }
            else
            {
               outputText("大量精液从她的小穴里倾泻而出");
            }
            outputText("，立刻被水冲向排水口。[pg]");
            outputText("你们俩在余韵中沉浸了片刻，然后你站起身，把科顿也扶了起来。你们重新开始清洗身体，带着暧昧的意味为彼此洗净私处。瑜伽、做爱和清洗都结束后，你们穿好衣服离开健身房；临别前，你最后轻轻捏了捏科顿的手。");
         }
         else if(get_player().hasTailInsteadOfLegs())
         {
            outputText("你决定接受她的提议，带她走进淋浴间，迅速脱掉衣服，打开一个可用的花洒。科顿也脱下衣物，你把她拉到水流下，在蒸汽逐渐弥漫开来时与她接吻。她用一只手穿过你的[hair]，扣住你的后颈，");
            if(pregnancy.get_event() > 1)
            {
               outputText("轻轻把你拉向她隆起的肚子。你一边吻她，一边忍不住把手按在上面。那块隆起坚实而紧绷，几乎像一面由肌肉构成的鼓；你轻抚着它，和这位母马变形者热吻在一起，引得她为你的动作发出轻柔而满意的低哼。");
            }
            else
            {
               outputText("把你拉得更近。[pg]");
            }
            if(get_player().cockArea(_loc1_) >= 100)
            {
               if(get_player().cockTotal() == 1)
               {
                  outputText("你感觉自己的" + get_player().cockDescript(_loc1_) + "在身下渐渐苏醒，慢慢挺立起来，而科顿的那根却奇怪地依旧软着。你的" + get_player().cockHead(_loc1_) + "蹭过她的肚子，让一阵阵快感沿着脊背窜上来。");
               }
               else if(get_player().cockTotal() > 1)
               {
                  outputText("你感觉自己的[cocks]在身下渐渐苏醒，慢慢挺立起来，而科顿的那根却奇怪地依旧软着。你们接吻时，那一簇肉棒彼此摩擦着，让一阵阵快感沿着脊背窜上来。");
               }
            }
            else if(get_player().cockTotal() == 1)
            {
               outputText("你感觉身下的" + get_player().cockDescript(_loc1_) + "开始骚动，和科顿的马根一同慢慢挺立起来。两根阴茎在你们亲吻时相互摩擦，让一阵阵快感沿着脊背窜上来。");
            }
            else if(get_player().cockTotal() > 1)
            {
               outputText("你感觉身下的[cocks]开始骚动，和科顿的马根一同慢慢挺立起来。几根阴茎在你们亲吻时相互摩擦，让一阵阵快感沿着脊背窜上来。");
            }
            if(get_player().hasVagina())
            {
               outputText("与此同时，你的" + get_player().vaginaDescript(0) + "被水流和情欲一同濡湿，你的[clit]也隐隐发胀，渴求着抚弄。");
            }
            outputText("[pg]");
            if(get_player().biggestTitSize() >= 2)
            {
               outputText("科顿俯下身，揉捏着你的" + get_player().biggestBreastSizeDescript() + "，将一颗[nipple]含入口中，贪婪地吮吸起来。");
               if(get_player().biggestLactation() >= 1)
               {
                  outputText("她的努力很快得到了回报，乳汁开始从你的[nipple]渗出。科顿惊讶地抬眼看向你的脸，却没有松开嘴，反而趁机大口吞咽你美味的奶水。没过多久，她才退开，擦了擦嘴，几乎是扑向你的另一只乳房，急切地想把其中珍贵的奶水吸干。那种被抽空的感觉涌上来，让你忍不住呻吟出声。片刻后，科顿松开你，咂了咂嘴。[say: 那可真是美味极了的奶水，宠物，我以后可能得更常尝尝你的味道。]");
                  FlagDict_Impl_.arrayWriteInt(KFLAGS.flags,245,1);
               }
               else
               {
                  outputText("科顿很快换到另一边乳房，用她灵巧的舌头挑逗你的[nipple]。");
               }
               outputText("[pg]");
            }
            outputText("现在你已经充分动情，便将身体[if (isMer) {松松地}]缠绕在科顿的躯干上，用尾巴分开她的双腿，同时把你的" + get_player().cockDescript(_loc1_) + "抵在她的小穴口。你缓缓顶入，科顿咬住嘴唇，赞许地看着你。");
            if(get_player().cockTotal() == 2)
            {
               outputText("带着一丝坏笑，你把多出来的那根肉棒对准科顿的另一个洞。她挑起眉，脸上瞬间掠过一丝慌乱，但你还是向前顶了进去。科顿的眼睛短暂地上翻，嘴唇颤抖起来。");
            }
            else if(get_player().cockTotal() > 2)
            {
               outputText("你剩下的阴茎也绷得发紧，渴望能填进洞里。可眼下已经没有空位，它们只能抵着科顿光滑的肌肤摩擦，阵阵跳动。");
            }
            if(get_player().cockArea(_loc1_) > 70)
            {
               outputText("尽管你对她来说实在太大，你还是尽量把自己塞进她体内。她的小穴虽大，却仍紧紧裹住你的" + get_player().cockDescript(_loc1_) + "。她颤抖着，浑身发颤，靠在淋浴间的墙上，抓住莲蓬头支撑身体。你一次又一次把那根过大的家伙挺进她体内，将她本就不小的小穴撑得更开。她的舌头竟从她的" + (get_noFur() ? "嘴里" : "吻部") + "滑了出来，歪垂在一边，眼睛上翻，彻底沉溺在快感中。你在水流下不断抽插，她的身体也随高潮一阵阵震颤。");
            }
            else if(get_player().cocks[_loc1_].cockLength < 4)
            {
               outputText("她赞许的神色动摇了，问道，[say: 已经进来了吗？]你的脸一下涨红，尴尬地低头看去，确认确实进去了。科顿托起你的下巴，吻了你一下，");
               if(pregnancy.get_event() > 1)
               {
                  outputText("[say:别担心，宠物，对我来说已经足够了。而且你得承认，]她坏笑着，抚摸着自己圆滚滚的肚子，[say:它确实完成任务了，不是吗？]");
               }
               else
               {
                  outputText("[say:别担心，宠物，对我来说已经足够了。]");
               }
               outputText("你对她微微一笑，将你的 " + get_player().cockDescript(_loc1_) + " 完全顶进她体内。对你这种尺寸来说这算不上什么大成就，但仍足以让你露出一丝笑意。");
            }
            else
            {
               outputText("你来回抽插，尽管科顿的小穴很宽大，却仍能紧紧咬住你。你的马类情人呻吟着抓向你的胸膛，最后抓住你的肩膀借力，身子却向后仰去。");
            }
            outputText("[pg]");
            outputText("你就这样持续了一阵，直到疲惫袭来。你小心地把科顿放倒在水流下，把身体盘在她身下，让她的臀部翘在空中，蹄子抵着地面，然后毫无阻碍地继续动作。她亲吻你的嘴唇、脖颈，以及任何她够得着的地方。");
            if(get_player().cockArea(_loc1_) >= 100)
            {
               outputText("她自己的阴茎依旧软着，却明显抽动起来，开始把精液漏到她的肚子上；一阵高潮震颤着她的身体。");
            }
            else if(pregnancy.get_event() > 1)
            {
               outputText("她自己的阴茎抽动痉挛，随着高潮冲击她的身体，将一股精液喷洒在她肿胀的孕肚、乳房和脸上。");
            }
            else
            {
               outputText("她自己的阴茎抽搐痉挛，一股精液喷洒在她的肚子、乳房和脸上；一阵高潮震颤着她的身体。");
            }
            if(get_player().cockArea(_loc1_) > 70)
            {
               outputText("即使是在这种近似传教士的体位下，你也没法把自己那根粗大的整根都塞进她体内，但她并不在乎。她的眼睛似乎来回翻动，仿佛很难聚焦，舌头上的水、汗和唾液滴落到自己身上。她喘着气，在淋浴的水声中，你隐约听见她低声说着：[say:诸神啊，诸神啊]。你甚至能在科顿紧实的腹部上辨出你肉棒的轮廓，正来回抽送着，这让你不禁露出笑容。她的背在花洒下弓起，头发凌乱地铺散在身下；又一次高潮冲击她的身体时，她咬住了嘴唇。");
            }
            outputText("[pg]");
            outputText("最后你终于再也忍不住了。你向伴侣体内做出最后一次挺入，高潮随即席卷全身，快感像狂喜的闪电般击中你的每一根神经，让你不由得发出一声如释重负的喘息。");
            if(get_player().hasVagina())
            {
               outputText("你的" + get_player().cockDescript(_loc1_) + "在科顿温暖的小穴里喷发，她的穴肉紧紧夹住你；与此同时，你自己的女性器也一阵抽动，空荡荡地收缩着，淫液顺着双腿淌下。");
            }
            else
            {
               outputText("你的" + get_player().cockDescript(_loc1_) + "在科顿温暖的小穴里喷发，而她的内壁紧紧绞住你。");
            }
            outputText("你又象征性地挺动了几下，然后拔了出来。就在这时，");
            if(get_player().cumQ() < 200)
            {
               outputText("精液开始从她的阴唇间渗出");
            }
            else if(get_player().cumQ() < 700)
            {
               outputText("一股精液从科顿的阴唇间涌了出来");
            }
            else if(get_player().cumQ() < 1200)
            {
               outputText("一小股精液从科顿的阴唇间奔涌而出");
            }
            else if(get_player().cumQ() < 2000)
            {
               outputText("精液从她被折腾过的穴口涌了出来");
            }
            else
            {
               outputText("大量精液从她的小穴里倾泻而出");
            }
            outputText("，立刻被水冲向排水口。[pg]");
            outputText("你们在余韵中沉浸了片刻，随后你撑起身体直立起来，并扶科顿起身。你们重新开始清洗彼此，带着挑逗意味地替对方洗净私处。瑜伽、性爱和清理都结束后，你穿好衣服离开健身房，临走前又最后捏了捏科顿的手。");
         }
         else
         {
            outputText("你决定接受她的提议，带她走进淋浴间，迅速脱掉衣服，打开一个可用的花洒。科顿也脱下衣物，你把她拉到水流下，在蒸汽逐渐弥漫开来时与她接吻。她用一只手穿过你的[hair]，扣住你的后颈，");
            if(pregnancy.get_event() > 1)
            {
               outputText("轻轻把你拉向她隆起的肚子。你一边吻她，一边忍不住把手按在上面。那块隆起坚实而紧绷，几乎像一面由肌肉构成的鼓；你轻抚着它，和这位母马变形者热吻在一起，引得她为你的动作发出轻柔而满意的低哼。");
            }
            else
            {
               outputText("把你拉得更近。");
            }
            if(get_player().cockArea(_loc1_) >= 100)
            {
               if(get_player().cockTotal() == 1)
               {
                  outputText("你感觉自己的" + get_player().cockDescript(_loc1_) + "在身下渐渐苏醒，慢慢挺立起来，而科顿的那根却奇怪地依旧软着。你的" + get_player().cockHead(_loc1_) + "蹭过她的肚子，让一阵阵快感沿着脊背窜上来。");
               }
               else if(get_player().cockTotal() > 1)
               {
                  outputText("你感觉自己的[cocks]在身下渐渐苏醒，慢慢挺立起来，而科顿的那根却奇怪地依旧软着。你们接吻时，那一簇肉棒彼此摩擦着，让一阵阵快感沿着脊背窜上来。");
               }
            }
            else if(get_player().cockTotal() == 1)
            {
               outputText("你感觉自己的" + get_player().cockDescript(_loc1_) + "在身下渐渐苏醒，和科顿那根马一样的阳具一同慢慢挺立起来。你们接吻时，两根肉棒相互摩擦，让一阵阵快感沿着脊背窜上来。");
            }
            else if(get_player().cockTotal() > 1)
            {
               outputText("你感觉自己的[cocks]在身下渐渐苏醒，和科顿那根马一样的阳具一同慢慢挺立起来。你们接吻时，那一簇肉棒彼此摩擦着，让一阵阵快感沿着脊背窜上来。");
            }
            if(get_player().hasVagina())
            {
               outputText("你的 " + get_player().vaginaDescript(0) + " 被水和情欲一同浸湿，你的[clit]隐隐发胀，渴望着抚弄。");
            }
            outputText("[pg]");
            if(get_player().biggestTitSize() >= 2)
            {
               outputText("科顿俯下身，揉捏着你的" + get_player().biggestBreastSizeDescript() + "，将一颗[nipple]含入口中，贪婪地吮吸起来。");
               if(get_player().biggestLactation() >= 1)
               {
                  outputText("她的努力很快得到了回报，乳汁开始从你的[nipple]渗出。科顿惊讶地抬眼看向你的脸，却没有松开嘴，而是趁机咽下你美味的乳汁。没过多久，她便退开，擦了擦嘴，几乎是扑向你的另一只乳房，迫不及待地想吸干其中珍贵的存货。那种被榨干的感觉压倒了你，让你忍不住呻吟出声。片刻后，科顿松开你，咂了咂嘴。[say:这奶可真是美味极了，宠物，我也许得更常尝尝你的味道了。]");
                  FlagDict_Impl_.arrayWriteInt(KFLAGS.flags,245,1);
               }
               else
               {
                  outputText("科顿很快换到另一边乳房，用她灵巧的舌头挑逗你的[nipple]。");
               }
               outputText("[pg]");
            }
            outputText("这下你也被充分挑起了情欲，于是伸手勾住科顿的一条腿，将它抬起，同时把你的 " + get_player().cockDescript(_loc1_) + " 抵在她的小穴口。你缓缓顶入，科顿咬着嘴唇，赞许地看着你。");
            if(get_player().cockTotal() == 2)
            {
               outputText("你微微一笑，把另一根阴茎抵到科顿的另一个洞口。她挑了挑眉，脸上瞬间掠过一丝慌乱，但你还是向前顶了进去。科顿的眼睛短暂地翻了上去，嘴唇也颤抖起来。");
            }
            if(get_player().cockTotal() > 2)
            {
               outputText("你剩下的阴茎也绷得发紧，渴望能填进洞里。可眼下已经没有空位，它们只能抵着科顿光滑的肌肤摩擦，阵阵跳动。");
            }
            if(get_player().cockArea(_loc1_) > 70)
            {
               outputText("虽说你对她而言实在太大了，你还是尽量把她塞得满满的。她的小穴即便宽大，也紧紧地夹住你的 " + get_player().cockDescript(_loc1_) + "。她浑身颤抖，靠在淋浴间的墙上，抓着花洒支撑身体。你一次又一次将那过大的家伙顶进她体内，把她本就不算小的小穴撑得更开。她的舌头甚至从" + (get_noFur() ? "嘴" : "口鼻") + "里滑了出来，歪垂在一边，双眼翻起，彻底沉溺在快感之中。她的身体随着高潮剧烈颤动，而你则在水流下不停抽插。");
            }
            else if(get_player().cocks[_loc1_].cockLength < 4)
            {
               outputText("她的赞许有些动摇，问道，[say:进去了吗？]你的脸刷地红了，尴尬地低头确认已经进去了。科顿托起你的下巴，吻了你一下，");
               if(pregnancy.get_event() > 1)
               {
                  outputText("[say:别担心，宠物，对我来说已经足够了。而且你得承认，]她坏笑着，抚摸着自己圆滚滚的肚子，[say:它确实完成任务了，不是吗？]");
               }
               else
               {
                  outputText("[say:别担心，宠物，对我来说已经足够了。]");
               }
               outputText("你对她微微一笑，将你的 " + get_player().cockDescript(_loc1_) + " 完全顶进她体内。对你这种尺寸来说这算不上什么大成就，但仍足以让你露出一丝笑意。");
            }
            else
            {
               outputText("你来回抽插，科顿的小穴虽大，却依然能紧紧咬住你。你的马族爱人呻吟着，抓向你的胸膛，最后扶住你的肩膀支撑身体，尽管她整个人正向后仰去。");
            }
            outputText("[pg]");
            outputText("你就这样持续了一阵，直到疲惫感占了上风。你小心地把科顿放倒在淋浴的水流下，继续不受阻碍地动作。她亲吻你的嘴唇、脖颈，以及任何她够得着的地方。");
            if(get_player().cockArea(_loc1_) >= 100)
            {
               outputText("她自己的阴茎依旧软着，却明显抽动起来，开始把精液漏到她的肚子上；一阵高潮震颤着她的身体。");
            }
            else if(pregnancy.get_event() > 1)
            {
               outputText("她自己的阴茎抽搐痉挛，一股精液喷洒在她隆起的孕肚、乳房和脸上；一阵高潮震颤着她的身体。");
            }
            else
            {
               outputText("她自己的阴茎抽搐痉挛，一股精液喷洒在她的肚子、乳房和脸上；一阵高潮震颤着她的身体。");
            }
            if(get_player().cockArea(_loc1_) > 70)
            {
               outputText("即便是传教士体位，你也没法把自己那巨大粗壮的整根都塞进她身体，但她毫不在乎。她的眼睛像是难以聚焦般来回翻动，舌头上混着水、汗和唾液，一滴滴落在她身上。她喘着气，而你能在流水声中隐约听见她低声念着：[say:哦，诸神啊，哦，诸神啊]。你甚至能在科顿结实的小腹上看出你阴茎的形状，随着抽送前后起伏，这让你忍不住露出笑容。她的背在淋浴下弓起，头发凌乱地铺在身下，随着又一阵高潮席卷全身，她咬紧了嘴唇。");
            }
            outputText("[pg]");
            outputText("最后你再也承受不住了。你最后一次顶进伴侣体内，高潮席卷全身，狂喜如闪电般击中每一根神经，你不由得发出一声如释重负的喘息。");
            if(get_player().hasVagina())
            {
               outputText("你的 " + get_player().cockDescript(_loc1_) + " 在科顿温热的小穴里喷发，对方紧紧绞住你；与此同时，你自己的雌性性器也一阵抽搐，在空处收缩着，淫液顺着双腿淌下。");
            }
            else
            {
               outputText("你的" + get_player().cockDescript(_loc1_) + "在科顿温暖的小穴里喷发，而她的内壁紧紧绞住你。");
            }
            outputText("你又象征性地挺动了几下，然后拔了出来。就在这时，");
            if(get_player().cumQ() < 200)
            {
               outputText("精液开始从她的阴唇间渗出");
            }
            else if(get_player().cumQ() < 700)
            {
               outputText("一股精液从科顿的阴唇间涌了出来");
            }
            else if(get_player().cumQ() < 1200)
            {
               outputText("一小股精液从科顿的阴唇间奔涌而出");
            }
            else if(get_player().cumQ() < 2000)
            {
               outputText("精液从她被折腾过的穴口涌了出来");
            }
            else
            {
               outputText("大量精液从她的小穴里倾泻而出");
            }
            outputText("，立刻被水冲向排水口。[pg]");
            outputText("你们俩在余韵中沉浸了片刻，随后你站直身子，也把科顿扶了起来。你们重新开始清洗身体，彼此温柔地洗着私密部位。瑜伽、性爱和清理都结束后，你穿好衣服离开健身房，临走前最后捏了捏科顿的手。");
         }
         pregCottonChance();
         get_player().orgasm("Dick");
         dynStats(DynStat.Sens(-1));
         get_player().hasGottenWashed();
         doNext(get_camp().returnToCampUseOneHour);
      }
      
      public function feedYourCottonKids() : void
      {
         clearOutput();
         outputText("你打断科顿，指出自己的乳房里满是奶水；如果她愿意，你很乐意替她哺乳这个");
         if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,702) >= 2)
         {
            outputText("小母马驹");
         }
         else
         {
            outputText("小公马驹");
         }
         outputText("如果她愿意的话，可以为她做。");
         outputText("[pg]科顿惊讶地眨了眨眼，随后露出如释重负又带着赞赏的微笑。[say:谢谢你，宠物——再说，你们俩也该花点时间培养一下感情，]她说道。她轻轻抱起那个小马兽人，然后把");
         if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,702) >= 2)
         {
            outputText("她的");
         }
         else
         {
            outputText("他");
         }
         outputText("交到你怀里，这时你已经露出了自己的[chest]。");
         outputText("[pg]你小心地从科顿手中接过自己的孩子，感受着");
         if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,702) >= 2)
         {
            outputText("她的");
         }
         else
         {
            outputText("他的");
         }
         outputText("重量落在臂弯里，然后将");
         if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,702) >= 2)
         {
            outputText("她的");
         }
         else
         {
            outputText("他");
         }
         outputText("贴近怀里");
         outputText("。起初，婴儿有些困惑，害怕地小声呜咽着，但");
         if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,702) >= 2)
         {
            outputText("她的");
         }
         else
         {
            outputText("他的");
         }
         outputText("存在和重量让你的乳房开始流出甜美的乳汁。随着奶香在空气中弥漫，婴儿的本能接管了一切，小脸先凑过来蹭了蹭你的[nipple]，然后终于用");
         if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,702) >= 2)
         {
            outputText("她的");
         }
         else
         {
            outputText("他的");
         }
         outputText("嘴唇含住了它。");
         outputText("[pg]当孩子——<b>你的</b>孩子——开始吮吸时，你满足地发出一声轻轻的呻吟，并温柔地把" + (FlagDict_Impl_.arrayReadInt(KFLAGS.flags,702) >= 2 ? "她" : "他") + "尽可能抱近自己。你开始慢慢摇晃");
         if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,702) >= 2)
         {
            outputText("她的");
         }
         else
         {
            outputText("他");
         }
         outputText("前后轻轻摇晃，低声哼唱起你还能记得的那些零碎摇篮曲——那都是你在英格纳姆老家的村子里，从哺乳的母亲们那里偶然听来的。你能感觉到");
         if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,702) >= 2)
         {
            outputText("她的");
         }
         else
         {
            outputText("他的");
         }
         outputText("小小心脏正在");
         if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,702) >= 2)
         {
            outputText("她的");
         }
         else
         {
            outputText("他的");
         }
         outputText("胸膛里跳动，你不禁想，是否");
         if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,702) >= 2)
         {
            outputText("她");
         }
         else
         {
            outputText("他");
         }
         outputText("能听见你胸膛里的心跳。");
         outputText("[pg]科顿笑了笑，走到你身后，把双手搭在你的肩上，说道：[saystart]你还真是台正经的产奶机器，不是吗？这倒也好，我们的孩子");
         if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,675) == 1)
         {
            outputText("需要");
         }
         else
         {
            outputText("们需要");
         }
         outputText("他们能得到的所有能量。[sayend]她的双手开始按摩你的肩膀和后背，揉捏着你的肌肉，帮你放松下来。");
         outputText("[pg]最后，孩子松开了含着你乳头的嘴，明明那么小，却打了个大大的哈欠。它的眼皮慢慢合上，裹在毯子里，准备借着满肚子的奶好好睡上一大觉。你轻轻摇着孩子，仍然柔声哼唱着，然后悄悄告诉科顿，她的宝宝简直是个小天使。");
         outputText("[pg]她笑了笑，回答道：[say: 趁现在好好享受吧，宠儿。用不了多久，他们就会满屋子乱跑，比你见过的任何小家伙都要闹腾。]");
         outputText("[pg]你叹了口气，承认她说得没错。不过现在，");
         if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,702) >= 2)
         {
            outputText("她");
         }
         else
         {
            outputText("他");
         }
         outputText("只是个困得不行、该上床睡觉的小家伙，你告诉她，然后轻轻把宝宝放回");
         if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,702) >= 2)
         {
            outputText("她的");
         }
         else
         {
            outputText("他的");
         }
         outputText("婴儿床里睡觉。你把乳房重新遮好，问科顿现在自己照看他们有没有问题，还是说你该再留下来多帮一会儿？");
         outputText("[pg][say: 我没事，什么都不用担心。你回家去，好好休息，把那两只奶罐子保持得满满的，嗯？]她笑着说。");
         outputText("[pg]你亲吻了你的马族爱人，揉了揉熟睡孩子的头发，然后安静地回了营地，把事情留给科顿照看。");
         dynStats(DynStat.Lust(-10));
         if(get_player().hasStatusEffect(StatusEffects.Feeder))
         {
            get_player().addStatusValue(StatusEffects.Feeder,1,1);
            get_player().changeStatusValue(StatusEffects.Feeder,2,0);
         }
         get_player().boostLactation(0.5);
         doNext(get_camp().returnToCampUseOneHour);
      }
      
      public function cottonsIntro() : Boolean
      {
         if(get_game().time.hours >= 12 && get_game().time.hours <= 18)
         {
            if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,177) == 0)
            {
               outputText("[pg]你看到一个高挑、胸部丰满的马" + (get_noFur() ? "耳女孩" : "娘") + "正在附近的垫子上做伸展。即使隔着这么远，你也能从她裤子里的隆起看出，她可不是什么普通的“女孩”。");
            }
            else if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,177) == 1)
            {
               outputText("[pg]你看到科顿，那位胸部丰满的双性人马娘，正在附近的垫子上做瑜伽。");
            }
            else
            {
               outputText("[pg]你看到科顿，那位胸部丰满的双性人马娘，正在附近的垫子上做瑜伽。她冲你眨了眨眼，笑了笑，还轻轻挥了挥手。");
            }
            return true;
         }
         return false;
      }
      
      public function cottonTantricSex() : void
      {
         spriteSelect(SpriteDb.get_s_cotton());
         clearOutput();
         get_images().showImage("cotton-tantric-sex");
         get_player().slimeFeed();
         FlagDict_Impl_.arrayWriteInt(KFLAGS.flags,177,2);
         outputText("你很清楚她打算在淋浴间做什么，于是改口询问更[say: 高级]一点的瑜伽形式——在“高级”这个词上还特意带了几分暧昧的强调。她咧嘴一笑，[say: 我知道你是什么意思。那叫密宗性爱，我觉得你柔韧性够好、反应也够快，正适合试试。][pg]");
         outputText("她带你来到健身房里一处私人区域，那是个宽敞的房间，一面墙上覆满镜子，横着一根长杆。你猜这间房大概是用来上舞蹈课，或进行其他需要大空间的活动。她在地上铺开一张大垫子，足够你们两人坐在上面还绰绰有余，然后开始脱衣服。[say: 最好裸体来做这个……我们可不想让衣服阻碍我们的灵性能量。或者，你懂的，阻碍其他东西，]她轻笑着说道。你点点头，也脱光了衣服。[pg]");
         outputText("科顿坐在垫子一端，把带蹄的双脚交叠在身下，摆出传统冥想的姿势。你坐到另一边，也照着做。[say: 现在我们要让呼吸同步，小宠物。吸气，呼气。每一次呼吸，都会让我们的灵魂更接近彼此。]你深深吸气，她也一样。然后呼出。就这样持续了几分钟，只是呼吸，直到某次呼气时，你感到一阵战栗沿着脊背窜过。[pg]");
         outputText("[say: 于是我们的灵魂相连了……暂时如此，]她笑着用双手抚过自己的上半身，而你以一种奇怪又像是抽离自身的方式，感觉到了那触碰。你摸向自己的胸口，试探性地揉弄一颗[nipple]，便看见科顿明显一颤，并向你投来赞许的点头。不管她做了什么……你现在能感受到她的感觉，虽然很微弱；反过来也一样！[pg]");
         outputText("[say: 接下来就是这场小锻炼里的瑜伽部分了，]她一边说，一边松开盘着的双腿，在垫子上把它们又长又宽地分开。她屈起膝盖，向后仰去，用双臂撑住自己。她漆黑的马形肉棒完全挺立，稳稳地搏动着。[say: 过来坐到我的肉棒上吧，宠物，我们要好好把这场派对开起来。][pg]");
         outputText("你轻轻咽了口唾沫，站起身向她走去。科顿用一只手抚过自己的阳具，让你因那股");
         if(get_player().hasCock())
         {
            outputText("熟悉的");
         }
         else
         {
            outputText("陌生的");
         }
         outputText("感觉，来自你身体上某个陌生的部位……好吧，是她的身体。你站到她的臀前，慢慢压低身体，将你的[assholeorpussy]插坐到她粗壮的家伙上。除了被填满的美妙感觉之外，你还感到自己的幻感肉棒被温暖而紧致地包裹住了。");
         if(get_player().hasTailInsteadOfLegs())
         {
            outputText("你将自己完全插了进去，稳稳坐到她腿上，把你[if (isNaga) {蛇一般的|[if (isMer) {鱼一般的|修长的}]}]身体伸展到她身后并偏向一侧，双臂撑在身后，让身体向后仰去。");
         }
         else
         {
            outputText("你将自己完全插了进去，稳稳坐到她腿上，模仿着她的姿势，把双腿伸到她身后，双臂撑在身后，让身体向后仰去。");
         }
         outputText("[pg]");
         outputText("虽然没有真正的抽插，也没有任何粗俗的动作，但那感觉却强烈得惊人，或许是因为你们之间的坦陀罗联结让一切都被放大了。你既能感觉到科顿修长的马阴茎在你体内跳动，也能感觉到你自己的[assholeorpussy]正紧紧夹住一根并不属于你的肉棒。");
         if(get_player().hasVagina())
         {
            get_player().cuntChange(72,true,true,false);
         }
         else
         {
            get_player().buttChange(72,true,true,false);
         }
         if(get_player().hasCock())
         {
            outputText("与此同时，你自己的[cock]无力地垂在身前，因欲火而阵阵发麻，却无法硬起来。科顿拍了拍它，说道：[say: 别担心，宝贝，现在这里只容得下一根肉棒，不过改天我会想要它的。]");
         }
         outputText("[pg]");
         outputText("[say: 现在我们来做莲花式，]科顿说着，坐起身来。");
         if(get_player().hasTailInsteadOfLegs())
         {
            outputText("你也照做，双臂环住你的伴侣，下半身则盘绕在她的腰腹间。科顿也把腿收了回来，要不是你正坐在她腿上，体内还插着她的阴茎，看起来你们几乎就像是在正常地相拥而坐。");
         }
         else
         {
            outputText("你也照做，双臂和双腿都环住你的伴侣。科顿也把腿收了回来，要不是你正坐在她腿上，体内还插着她的阴茎，看起来你们几乎就像是在盘腿对坐。");
         }
         outputText("你趁机把脸埋进科顿丰硕的胸脯里，先将一颗挺翘的黑色乳头含入口中，接着又含住另一颗。你甚至能感觉到自己的舌头正舔弄着幻感乳头，无情地拨弄、挑逗着你。你松开乳头，稍稍退开，唾液在乳头与嘴唇之间拉出一道细细的丝线。[pg]");
         if(get_player().biggestTitSize() >= 2)
         {
            outputText("科顿也回敬了你，她那张" + (get_noFur() ? "" : "短吻的") + "嘴含住一颗[nipple]，不停地用力吮吸。由此带来的感觉甚至比平常更加强烈。你的乳头像是着了火，每一寸都渴望着被触碰、舔舐、吮吸和挑逗。");
            if(get_player().biggestLactation() >= 1)
            {
               outputText("你感觉到乳房里涌起一阵熟悉的感觉，乳汁开始流入科顿口中。她尽可能在不松开你乳房的情况下露出笑容，急切地吞咽着你的乳汁。又一阵不安涌上心头，你意识到自己竟能尝到自己的奶水正滑过科顿的舌头。你咂了咂嘴。味道香甜而柔滑，还暖得令人发颤。科顿转向你另一颗乳头，任由第一颗乳头的乳汁滴落在你们两人身上。她再次吮吸你的[nipple]片刻，随后它也开始将珍贵的乳汁送入她口中。你品尝着每一次吞咽，一口比一口更甜，直到科顿退开，满足地咂了咂嘴。[say: 你尝起来真甜，宝贝。我简直必须把你留在身边当早餐了……]");
               FlagDict_Impl_.arrayWriteInt(KFLAGS.flags,245,1);
            }
            else
            {
               outputText("她很快换到另一颗乳头，舌头熟练地挑弄、逗引着它，随后又再次离开。");
            }
            outputText("[pg]");
         }
         outputText("[say: 最后一个姿势，宝贝，倒头式。]她抓住你的[hips]，一个流畅的动作便站了起来。你立刻抱紧她，确保自己不会摔下去。科顿的肉棒随着动作在你体内挪动，插得更深了一点，你本能地收紧身体，而这感觉也传到了你的幻感肉棒上。[say: 现在我们只要让你躺下……]你咽了口唾沫，松开抱住科顿脖子的手，慢慢让自己向后仰去。肉棒在你体内移位，随着你往下倒去，那感觉陌生又古怪。最后，你的头碰到了地面，于是你稍稍弯起脖子，让肩膀和脑袋都靠在垫子上。[pg]");
         if(get_player().hasTailInsteadOfLegs())
         {
            outputText("科顿牢牢抓住你的臀部和屁股，确保你不会滑落，于是你小心地松开盘绕的身体，将它滑进科顿双腿之间，然后又缠上她的腰、胸口以及乳间。感觉相当强烈，不过从这个角度，科顿的肉棒并不能完全插入你体内。");
         }
         else
         {
            outputText("科顿牢牢抓住你的臀部和屁股，确保你不会滑落，于是你小心地伸出[legs]，再越过并绕住科顿的双臂，只在确认她能稳稳托住你这个新姿势后才停下，然后把双脚都搭在这位马族情人的肩上。感觉相当强烈而独特，不过从这个角度，科顿的肉棒并不能完全插入你体内。");
         }
         outputText("[pg]");
         outputText("接下来就是抽插了。或者更准确地说，是扭动。科顿开始用臀部做小幅度的圆周动作，让她的肉棒在你体内极轻微地进出。尽管动作细微，但再加上坦陀罗联结，你已经彻底沉浸在极乐之中。很快，你也尽力跟着扭动起臀部。[pg]");
         outputText("没过多久，那些感觉便彻底吞没了你，你同时感受着被操弄和操弄对方的快感。高潮开始席卷而来，闪电般的快感掠过你全身每一根神经。科顿看起来也差不多快到了。随着你的身体开始颤抖、弓起，她的身体也同样如此。");
         if(get_player().hasCock())
         {
            outputText("你的[cock]抽搐着发麻，将积攒已久的精液淅淅沥沥地倾泻出来，沿着你的腹部和胸口流下，正好落到你的脸上，并在你头边积成一滩。");
         }
         if(get_player().hasVagina())
         {
            outputText("你的" + get_player().vaginaDescript(0) + "一阵颤抖，紧紧夹住侵入而来的肉棒，一边抽动一边榨弄着它，任由它直接射进你的子宫。");
         }
         else
         {
            outputText("你的[asshole]一阵颤抖，紧紧夹住侵入而来的肉棒，一边抽动一边榨弄着它，任由它直接射进你的肠道里。");
         }
         outputText("闪电般的快感在你们两人的身体里，从一根神经窜向另一根神经。你能感受到科顿感受到的一切。在那一刻，你们仿佛完美地合为一体。你并不只是被科顿操着。你同时也是科顿，正在操着自己，而她也同样如此。");
         outputText("[pg]");
         outputText("随后一瞬间，一切都消失了。电流般的感觉退去，你们一起侧倒在地板上，喘息不止。坦陀罗联结显然已经消失，你忽然感到无比孤独。科顿似乎察觉到了这一点，抽出身子，蜷到你身旁，抱着你，直到那股突如其来的失落感渐渐消散。[pg]");
         outputText("几分钟后，你感觉力气逐渐回到身体里，于是站了起来。科顿也一样起身，你们花了些时间把垫子上欢爱后留下的痕迹清理干净，然后一起去淋浴间，替彼此冲洗身体。结束之后，你们手牵着手离开健身房；在你动身返回营地前，科顿最后轻轻握了握你的手。");
         if(get_player().hasCock())
         {
            get_player().orgasm("Dick");
         }
         get_player().orgasm("VaginalAnal");
         dynStats(DynStat.Tou(0.25),DynStat.Spe(0.25),DynStat.Lib(-0.25),DynStat.Sens(-0.25));
         if(get_player().hasVagina())
         {
            cottonPregPCChance();
         }
         doNext(get_camp().returnToCampUseOneHour);
      }
      
      public function cottonShowerFunTimes() : void
      {
         spriteSelect(SpriteDb.get_s_cotton());
         clearOutput();
         outputText("[say:太好了！走吧，]她挽住你的胳膊，把你带回更衣室，然后又带进附近的淋浴间——这里显然是男女共用的。你们俩都脱光衣服，打开一个淋浴喷头。洗了片刻后，你偷偷瞥了一眼这位一起洗澡的伙伴。[pg]");
         outputText("脱掉衣服后，你能看出她的身体相当结实匀称。她并不是肌肉过分发达的类型，但你很容易就能看清她腹部的肌肉线条。她戴着肚脐环，两个乳头上也各有一枚杠铃穿环。视线再往下，你终于看到了她那根马阳具。它相当巨大，即便像现在这样软着，也至少有一英尺长。你不禁好奇它硬起来会有多大……她发现你在看，露出一个恶作剧般的笑容。[pg]");
         outputText("[say:怎么样？想不想来点……锻炼后的拉伸？]");
         if(get_player().hasCock())
         {
            addButton(0,"干她",cottonFirstTimeFuckHer);
         }
         else
         {
            addButtonDisabled(0,"干她","此场景需要你拥有阴茎。");
         }
         if(!get_player().isGenderless())
         {
            addButton(1,"被她干",cottonFucksYou);
         }
         else
         {
            addButtonDisabled(1,"被她干","此场景需要你拥有生殖器。");
         }
         addButton(3,"服侍她",serviceFirstTimeCotton);
         addButton(14,"拒绝",refuseFirstTimeCotton);
      }
      
      public function cottonPregnantAlertII() : void
      {
         clearOutput();
         get_images().showImage("cotton-you-got-her-preggo");
         outputText("[say: 你好，宠物，]她说道，你注意到她的声音里带着担忧。她眼下有淡淡的眼袋，深红色的马尾辫也有些凌乱，发丝从奇怪的角度翘了出来。显然有什么事让她心烦意乱。");
         outputText("[pg][say: 我就直说了。我今天去了契约组织……我怀孕了，]她平静地说道，[say: 而且是你的孩子。]");
         outputText("[pg][saystart]我一直在服用一些防止怀孕的草药，但看来它们还是敌不过你。");
         if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,69) > 0 || get_telAdre().edryn.pregnancy.get_isPregnant() && FlagDict_Impl_.arrayReadInt(KFLAGS.flags,71) != 0)
         {
            outputText("你让埃德琳怀孕之后，我早该想到会这样的。");
         }
         outputText("[sayend]她紧张地绞着双手，直视着你的眼睛。那个冷静自信的瑜伽教练显然已经消失了，露出了真正的她。[saystart]我知道我们不算正式交往，但");
         if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,70) == 0)
         {
            outputText("你会陪我一起度过这件事的，对吧？");
         }
         else
         {
            outputText("你不会像抛下埃德琳那样抛下我，对吧？");
         }
         outputText("[sayend]");
         menu();
         addButton(0,"留下",beAGoodCottonDad);
         addButton(1,"离开她",beABadCottonDad);
      }
      
      public function cottonPregnantAlert() : void
      {
         clearOutput();
         outputText("你走进健身房，正想锻炼一下（不管是哪种意义上），便在她平常待的地方看见了科顿。她来回踱步，脸上写满了担忧。看到你时，她勉强笑了笑，然后朝你走来。不管出了什么事，显然都等不了了。");
         menu();
         addButton(0,"下一步",cottonPregnantAlertII);
      }
      
      public function cottonPregPCChance() : void
      {
         if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,675) == 0 && FlagDict_Impl_.arrayReadInt(KFLAGS.flags,679) == 0)
         {
            get_player().knockUp(20,350,600);
         }
         else if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,679) == 0)
         {
            get_player().knockUp(20,350,1000);
         }
         else
         {
            get_player().knockUp(20,350,100);
         }
      }
      
      public function cottonPopsOutAKid() : void
      {
         var _loc2_:* = null as IMap;
         var _loc1_:int = 0;
         clearOutput();
         get_images().showImage("cotton-giving-birth");
         if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,675) == 0)
         {
            outputText("科顿正待在她常待的位置，悠闲地喝着瓶装水。自从她的孕妇衫被撑得穿不下后，她那圆滚滚、棕色皮肤的大肚子就一直露在外面。你走近时，她皱着脸倒吸一口气，伸手揉了揉肚子。见状，你不禁问她感觉还好吗。");
            outputText("[pg][say: 只是有点肚子疼，]她随口说道，[say: 我大概又拉伤了什么地方吧。这小马驹可把我的肌肉折腾惨了。我没事的，咱们开始做热身拉伸，好吗？]你点点头，虽然并不完全放心，但还是在垫子上俯下身，开始拉伸。");
            outputText("[pg]你才拉伸了没几分钟，就听见这位马形双性人突然痛叫一声，一股水从科顿两腿之间涌了出来。她惊慌地低头看去，双臂抱着肚子，几乎要弯下腰去。[say: 天啊，孩子要出生了！]她喊道，声音里染上了慌乱。");
            outputText("[pg]你立刻上前扶住她，问她自己能做些什么来帮忙。");
            outputText("[pg][say: 本来我想在家生产的，]她的声音一时绷紧，[say: 但现在没戏了。我们得找个安静又私密的地方。已经没时间去医生那里了……]她现在呼吸很重，但仍在有节奏地喘着气。");
            outputText("[pg]你脑子飞快转动，问她能不能撑到泳池那边。你记得好像听说过，在水里生产会更容易之类的。");
            outputText("[pg][say: 可以，]她很快答道。[saystart]");
            if(get_silly())
            {
               outputText("只要那只方块鲨不在就行。");
            }
            outputText("走吧。[sayend]");
            if(get_player().get_tallness() < 60)
            {
               outputText("她用一只胳膊搂住你的脖子，借此");
            }
            else if(get_player().get_tallness() < 70)
            {
               outputText("她把一只手搭在你的肩上，借此");
            }
            else if(get_player().get_tallness() < 86)
            {
               outputText("她用一只胳膊环住你的腰腹，借此");
            }
            else
            {
               outputText("她用一只胳膊搂住你的腰，借此");
            }
            outputText("稳住身子，然后摇摇晃晃地朝泳池入口走去。你尽可能快地跟上，又不敢太急，努力支撑着正在分娩的恋人。泳池很快便出现在视野里，令人松了口气。你轻轻扶她下水，然后脱下她的裤子，湿漉漉地<i>啪嗒</i>一声扔到石地上。你站到她身后，以免她那巨大的男性器官挡住你的操作，然后告诉科顿准备好用力……");
            outputText("[pg]漫长的几分钟过去了；尽管科顿显然很痛苦，但你还是忍不住注意到，这次生产老实说比人类分娩要快得多，也顺利得多。你试着把这点告诉科顿，给她打气。");
            outputText("[pg][say: 哈，我的族人可结实着呢。这点，]她用力了一阵，[say: 不算什么。]");
            outputText("[pg]你安慰她说她做得很好，随后吸了口气，再次潜入水下仔细查看她的情况。你的眼睛和手指很快确认了进展有多快，于是你兴奋地浮出水面，告诉她你已经能看到头了；再好好用力一两次，宝宝就能出来。她似乎因此得到了力量，点点头，急促地喘了几口气，然后竭尽全力开始用力。紧绷的神情显现在她脸上，她平日里棕色的皮肤一瞬间都涨成了紫色。");
            outputText("[pg]科顿发出一声被扼住般的尖叫，你立刻把双手探进水中。随着她最后一次用力结束，肌肉也随之放松下来。就在这时，科顿的宝宝从这位双性人腹中原本的居所完全滑进了你的手里，你赶紧把它托出水面。伴随着巨大的水花，你将宝宝抱出水面，它也因此吸入了第一口空气，发出了第一声啼哭。你就那样站在水里，傻笑着看着你们刚出生的小马驹，把它紧紧抱在怀中。");
            outputText("[pg]科顿试着回头看。[say: 一切都好吗？它没事吧？]她问道，声音里满是担忧。");
            outputText("[pg]一切都很好，你告诉她，却怎么也抬不起头来。你们两个成了一个健康的新生");
            if(Utils.rand(3) == 0)
            {
               _loc1_ = 1;
            }
            else if(Utils.rand(2) == 0)
            {
               _loc1_ = 2;
            }
            else
            {
               _loc1_ = 3;
            }
            FlagDict_Impl_.arrayWriteInt(KFLAGS.flags,702,_loc1_);
            if(_loc1_ == 1)
            {
               outputText("雄性");
            }
            else if(_loc1_ == 2)
            {
               outputText("雌性");
            }
            else
            {
               outputText("双性儿");
            }
            outputText("小马驹的父母。");
            outputText("[pg]科顿转过身，看到她的");
            if(_loc1_ == 1)
            {
               outputText("儿子");
            }
            else
            {
               outputText("女儿");
            }
            outputText("，忍不住<i>哎呀呀</i>地叫了起来。虽然你舍不得放开");
            if(_loc1_ != 1)
            {
               outputText("她的");
            }
            else
            {
               outputText("他");
            }
            outputText("，但科顿伸出双臂把");
            if(_loc1_ != 1)
            {
               outputText("她的");
            }
            else
            {
               outputText("他");
            }
            outputText("抱了过去。她一只手撩起上衣，露出那对棕色的大乳头，把孩子拉到其中一边。小家伙立刻含住乳头，熟练地吮吸起来。你只是看着，心想要是科顿开口，你就会移开视线，但她似乎全神贯注地给新生儿喂奶，没怎么注意你。");
            outputText("[pg]你爬出水池，又帮你孩子的母亲也出来。科顿走进更衣室，很快找到自己的储物柜，取出一套干净衣服；而你拿来毛巾，帮她擦干身子——这比你想的要麻烦些，毕竟你们还得轮流抱着孩子。等这个饥饿的小家伙吃饱喝足，沉入奶意带来的昏睡后，她重新穿好衣服，说道：[say: 咱们去把这小家伙好好安顿下来吧。]");
            outputText("[pg]你点头表示同意，也好奇科顿住的地方是什么样子，便示意她带路。她照做了，把你带到一间朴素的公寓前，公寓夹在一家裁缝店和本地熟食店之间。进去之后，她领你来到一间一看就是婴儿房的屋子：房间色彩缤纷、明亮夺目，用淡粉、浅蓝和淡紫装饰着。");
            outputText("[pg]你看着这些装饰笑了笑，告诉科顿她一定忙坏了；不过这里看起来很漂亮。");
            outputText("[pg][say: 噢，谢谢你，宝贝，]她笑着说。[say: 不知道我有没有跟你提过，我几年前有过两个孩子。是双胞胎。哎呀，他们可真是两个精力旺盛的小魔头，一刻也坐不住，]她带着怀念的神情笑了笑。[say: 这里其实曾经就是他们的房间。当然，我后来又重新布置了一下。]");
            outputText("[pg]所以，科顿以前当过家长？你问她当时是母亲，还是父亲。");
            outputText("[pg][say:哦，我算是“爸爸”吧，]她说到这个词时轻轻笑了笑。[say:他们的母亲来自我的故乡村子。恶魔来了之后，我们一起搬进了特尔阿德雷。后来事情自然而然地发展下去，没过多久，我们就有了两个可爱的小宝贝。]");
            outputText("[pg]你问她们的母亲是什么；也是像科顿一样的马" + (get_noFur() ? "女孩" : "兽化人") + "？也许是半人马？还有，是女性，还是扶她？");
            outputText("[pg][saystart]哦，她和我一样" + (get_noFur() ? "" : "，也是兽化人") + "，我村里大多数人都是。她当然是女性。像我这样的扶她在当时可不算常见，不过我可以骄傲地说，我可是纯天然的！");
            if(_loc1_ == 3)
            {
               outputText("我想这也算是家族遗传吧。");
            }
            outputText("[sayend]");
            outputText("[pg]你会意地点点头。随后，你委婉地提到，科顿似乎已经不再和她昔日的心上人在一起了。是这段关系单纯没能走下去，还是……？");
            outputText("[pg]科顿想了片刻，然后回答道：[say: 这么说吧，我们渐渐发现彼此越走越远，而她也去寻找更好的归宿了。她把孩子们留给了我，不过就算重来一次，我也不会希望变成别的样子。现在我偶尔还能在特尔阿德雷见到她。我们之间倒也没什么真正的怨恨，只是短时间内不会坐下来一起喝茶了。]");
            outputText("[pg]你感谢科顿愿意告诉你这些事。随后，为了换个话题，你问起她那对双胞胎后来怎么样了——还有，从性别上来说，他们分别是什么？");
            outputText("[pg]科顿回答道：[say: 哦，一个男孩，一个女孩。异卵双胞胎。他们现在也不知道在什么地方。去年离开了特尔阿德雷，去寻找其他聚落，也想试着对抗恶魔。我偶尔会收到他们的来信，都是由路过的商人带来的，可我已经太久没见过他们了。]你看到她眼中泛起了泪光。她显然很担心他们。");
            outputText("[pg]她擦去眼泪，摆了摆手，[saystart]不过话说回来，咱们先把这个小");
            if(_loc1_ < 2)
            {
               outputText("家伙");
            }
            else
            {
               outputText("女孩");
            }
            outputText("安顿好吧。[sayend]她从你手中接过襁褓，拿来一条崭新干净的毯子，转眼间就把");
            if(_loc1_ != 1)
            {
               outputText("她的");
            }
            else
            {
               outputText("他");
            }
            outputText("熟练地裹好了。科顿把孩子放进婴儿床，退后一步欣赏自己的手艺。你走到她身边，感激地搂住她的腰，告诉她她做得棒极了。");
            outputText("[pg][say: 哦不，宝贝，]她低声回应道，[say: 这个宝宝可全都是你的功劳。]你冲她一笑，说她真会哄人，然后吻了她。你问她还需不需要你帮忙布置什么。[say: 不用，什么都别担心，一切都已经安排好了。不过如果你愿意的话，我们可以在这里再坐一会儿。]");
            outputText("[pg]你告诉她你很乐意，于是在附近坐下，陪着你孩子的“母亲”，看着你的小马驹宝宝安然入睡。不过最终你还是得离开，于是你礼貌地告辞，返回营地。");
            pregnancy.knockUpForce();
            _loc2_ = KFLAGS.flags;
            FlagDict_Impl_.arrayWriteInt(_loc2_,675,FlagDict_Impl_.arrayReadInt(_loc2_,675) + 1);
            if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,675) == 1)
            {
               FlagDict_Impl_.arrayWriteInt(KFLAGS.flags,676,1);
            }
            doNext(get_camp().returnToCampUseOneHour);
         }
         else
         {
            outputText("当你朝科顿走去时，你发现她有哪里不一样了；她孕晚期那隆起的肚子不见了！你问她一切是否还好。");
            outputText("[pg][saystart]哦，一切都好得很，亲爱的小宠物。你其实刚好错过了，我感觉到了一些熟悉的征兆，所以就回家了。结果我刚打开门，羊水就破了。我就在育儿室里把孩子生下来了。你现在可是个小");
            if(Utils.rand(3) == 0)
            {
               _loc1_ = 1;
            }
            else if(Utils.rand(2) == 0)
            {
               _loc1_ = 2;
            }
            else
            {
               _loc1_ = 3;
            }
            if(_loc1_ == 1)
            {
               outputText("男孩");
            }
            else if(_loc1_ == 2)
            {
               outputText("女孩");
            }
            else
            {
               outputText("双性儿");
            }
            outputText("！[sayend]她开心地说着，把你拉进怀里。[saystart]我们可以去看看");
            if(_loc1_ != 1)
            {
               outputText("她的");
            }
            else
            {
               outputText("他");
            }
            outputText("，如果你愿意的话，");
            if(_loc1_ != 1)
            {
               outputText("她");
            }
            else
            {
               outputText("他");
            }
            outputText("就在这里的托儿所里，我想今天就近照看着");
            if(_loc1_ != 1)
            {
               outputText("她的");
            }
            else
            {
               outputText("他");
            }
            outputText("。[sayend]");
            outputText("[pg]你告诉她，你想去看看");
            if(_loc1_ != 1)
            {
               outputText("她的");
            }
            else
            {
               outputText("他");
            }
            outputText("，只要科顿觉得不会让");
            if(_loc1_ != 1)
            {
               outputText("她的");
            }
            else
            {
               outputText("他");
            }
            outputText("。");
            outputText("[pg][saystart]哦，当然不会。这对");
            if(_loc1_ != 1)
            {
               outputText("她的");
            }
            else
            {
               outputText("他");
            }
            outputText("来说，见见");
            if(_loc1_ != 1)
            {
               outputText("她的");
            }
            else
            {
               outputText("他");
            }
            outputText("爸爸会有好处，[sayend]她说着，带你沿着走廊，进了一间标着“托儿所”的房间。门一打开，孩子们玩耍时的欢笑声就扑面而来。");
            outputText("[pg]一个年轻的兔女看见科顿，说道：[saystart]哦！没想到你这么快就回来了。");
            if(_loc1_ != 1)
            {
               outputText("她");
            }
            else
            {
               outputText("他");
            }
            outputText("现在刚睡下，在午睡。你们想看看");
            if(_loc1_ != 1)
            {
               outputText("她的");
            }
            else
            {
               outputText("他");
            }
            outputText("吗？[sayend]你们俩都点头表示同意，然后被带到旁边一间小房间。里面很暗，但门边有一张婴儿床，你能辨认出一个熟睡的婴儿，长着和母亲一样的马耳朵，正随着梦境轻轻抽动。");
            outputText("[pg]不想吵醒");
            if(_loc1_ != 1)
            {
               outputText("她的");
            }
            else
            {
               outputText("他");
            }
            outputText("，你看了看");
            if(_loc1_ != 1)
            {
               outputText("她的");
            }
            else
            {
               outputText("他");
            }
            outputText("带到一边，然后又带出房间，想到之后还能和");
            if(_loc1_ != 1)
            {
               outputText("她的");
            }
            else
            {
               outputText("他");
            }
            outputText("再多待些时候，你心里很满足。你们俩回到健身房的主区，科顿拍了拍你的背，[say:咱们造出来的可真不错，对吧？总之，你要是想锻炼，就先去换衣服，然后回来找我。]");
            pregnancy.knockUpForce();
            _loc2_ = KFLAGS.flags;
            FlagDict_Impl_.arrayWriteInt(_loc2_,675,FlagDict_Impl_.arrayReadInt(_loc2_,675) + 1);
            if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,675) == 1)
            {
               FlagDict_Impl_.arrayWriteInt(KFLAGS.flags,676,1);
            }
            cottonMenu();
         }
      }
      
      public function cottonMenu() : void
      {
         menu();
         addButton(0,"瑜伽",acceptYoga);
         if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,675) > 0)
         {
            addButton(1,"探望孩子们",visitCottonKids);
         }
         if(pregnancy.get_isPregnant() || FlagDict_Impl_.arrayReadInt(KFLAGS.flags,675) >= 1)
         {
            addButton(2,"草药",cottonContraceptionToggle);
         }
         addButton(14,"离开",turnDownYogaWifCottonFirstTime);
      }
      
      public function cottonGreetingCommonEnd() : void
      {
         if(get_player().get_pregnancyIncubation() <= 225 && get_player().get_pregnancyType() == 20)
         {
            outputText("你走近科顿时，她笑着看向你圆滚滚的肚子。[say: 嘿，我的小宠物，以你现在的状态，瑜伽肯定是不行了……不过我们可以做些特别的伸展和拉玛泽呼吸训练，像平时一样换好衣服就行。]");
            outputText("你想和她一起做瑜伽式拉玛泽训练吗？");
         }
         else
         {
            switch(pregnancy.get_event())
            {
               case 1:
                  outputText("你走近科顿，却惊讶地发现她刚刚吃完的，恐怕是你见过最大的糖霜点心。你还注意到她的健身垫旁边有松饼包装纸，以及其他烘焙食品的痕迹。你问科顿最近是不是有点嘴馋……你又改口，问她最近是不是快饿疯了。");
                  outputText("[pg]她轻轻“哼唔”了一声，舔干净手指。[say: 我只是突然很想吃点心……再说了，我每天都在健身房，这又不会毁了我的身材。]她不以为意地挥了挥手。[say: 总之，如果你想锻炼，就去换衣服然后回来吧。]");
                  break;
               case 2:
                  outputText("你走近时，科顿向你挥手，一如既往地很高兴见到你。等你靠得更近，你能看到她原本平坦得像搓衣板一样的肚子上，已经出现了一个相当明显的隆起；如果不是你很清楚她怀孕了，恐怕会以为她之前吃太多终于报应来了。这个隆起还不至于让她立刻换衣服，但她的服装肯定已经变紧了。你问她感觉怎么样，同时拍了拍自己的肚子，示意她你是在问这个。");
                  outputText("[pg][say: 又饿了。我想等会儿再去一趟烘焙店，]她眼中带着向往回答道。[say: 总之，如果你想锻炼，就去换衣服再回来吧。]");
                  break;
               case 3:
                  outputText("你走近科顿，她微笑着向你挥手。她的肚子如今向前隆起，怀孕的样子一眼就能看出来。她以前那件背心不见了，现在换成了某种孕妇上衣，反而更凸显出她的肚子。不过瑜伽裤还在，只是比平常穿得更低一些。奇怪的是，你注意到她正含着一根棒棒糖，便问她是怎么回事。");
                  outputText("[pg][say: 哦，这个能稍微缓解恶心。而且我觉得这个小淘气，]她轻轻揉了揉肚子，[say: 大概喜欢吃甜的。也可能只是我自己想吃。总之，想锻炼的话就去换衣服再回来吧，小宠物。]");
                  break;
               case 4:
                  outputText("你走近科顿，她微笑着向你打招呼。她平时穿的上衣不见了，取而代之的是一件短得离谱的白色背心，把她那巨大、浑圆的棕褐色肚子完全凸显出来；要是不知情，恐怕会把它当成胸罩。虽然你觉得她的行动应该会相当受限，但她实际上还是像平常一样优雅地移动着……直到她的肚子撞上附近桌上摆着的一排水瓶，把它们全都碰到了地上。");
                  outputText("[pg]你问她现在是不是该待在家里，把蹄子架起来好好休息。她摇摇头说：[say: 哦，不用，我没事。我还有学生要教，而且我自己也不用做什么太费劲的活动，所以别担心。总之，如果你想上课，就去换身衣服再回来吧。]");
                  break;
               default:
                  outputText("你走近科顿，她微笑着说：[say: 嘿，我的小乖乖，如果你想锻炼，就去换身衣服再回来吧。]");
                  outputText("[pg]你想和她一起做瑜伽吗？");
            }
         }
         cottonMenu();
      }
      
      public function cottonGreeting() : void
      {
         spriteSelect(SpriteDb.get_s_cotton());
         clearOutput();
         get_images().showImage("cotton-greeting");
         if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,167) == 0)
         {
            outputText("半人马娘看见你朝那位马娘走去，便说道：[say: 你可以过去聊聊，不过要是想跟她一起锻炼，我可得收费。][pg]");
         }
         if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,177) == 0)
         {
            FlagDict_Impl_.arrayWriteInt(KFLAGS.flags,177,1);
            outputText("你走向垫子上的那位马娘，好奇她在做什么。她在垫子上伸展开身体，脊背弯曲着。她把头向后仰，看到你走近。[say: 哦，你好呀！]她倒着朝你咧嘴一笑，然后完成这组伸展，站起身来。");
            if(get_player().get_tallness() > 78)
            {
               outputText("尽管她个子相当高，你仍然需要低头看她。");
            }
            else if(get_player().get_tallness() >= 76)
            {
               outputText("她和你差不多高，这本身就已经相当惊人了。");
            }
            else
            {
               outputText("她真的很高，你必须仰头看她。");
            }
            outputText("她穿着一件白粉相间的贴身背心，搭配一条黑色紧身裤，裤脚大约垂到小腿中段。那条裤子完全遮不住她胯间巨大的隆起，倒不如说还把它衬得更加明显。她深棕色的皮肤看起来光滑无毛，和你见过的大多数马系生物都不同；她那头红色鬃发垂到肩下，不过现在被利落地扎成了马尾。[pg]");
            if(get_player().isTaur() || get_player().hasTailInsteadOfLegs())
            {
               centaurNagaBodyBookStuff();
               return;
            }
            outputText("[say: 嘿，我是科顿，有什么需要我帮忙的吗？]她友好地说道。你也报上自己的名字，并解释说你只是好奇她在做什么。[say: 哦，这个？只是在做瑜伽。]看你一脸疑惑，她继续说道：[say: 瑜伽就像是给身体和灵魂做的一套锻炼。身体快乐又健康时，心灵和灵魂也会跟着好起来。这是一种非常放松，而且……很有感官享受的运动。你想试试看吗？]");
            doYesNo(acceptYoga,turnDownYogaWifCottonFirstTime);
         }
         else
         {
            if(pregnancy.get_event() == 5)
            {
               cottonPopsOutAKid();
               return;
            }
            if(get_player().isTaur() || get_player().hasTailInsteadOfLegs())
            {
               centaurNagaBodyBookStuff();
            }
            else
            {
               cottonGreetingCommonEnd();
            }
         }
      }
      
      public function cottonFucksYouInShowerRepeat() : void
      {
         spriteSelect(SpriteDb.get_s_cotton());
         get_player().slimeFeed();
         FlagDict_Impl_.arrayWriteInt(KFLAGS.flags,177,2);
         clearOutput();
         get_images().showImage("cotton-shower-fucks-you-repeat");
         if(get_player().isTaur())
         {
            outputText("你决定接受她的提议，她便把你拉向淋浴间，迅速而强硬地脱掉你的衣服，随后也脱掉自己的。她只打开一个喷头，把你拉进怀里，一同站在迅速升温的水流下。她一路亲吻你的脖颈，还咧嘴笑着俏皮地咬了你一口。");
            if(get_player().get_gender() == 1)
            {
               outputText("你的[cock]在两腿间微微发麻，但在科顿那根惊人的大家伙面前依旧软塌塌的。");
            }
            else if(get_player().get_gender() == 3)
            {
               outputText("你的[cock]在两腿间微微发麻，但在科顿那根惊人的大家伙面前依旧软塌塌的；与此同时，你的" + get_player().vaginaDescript(0) + "几乎立刻就在蒸汽与情欲中湿润起来。");
            }
            else if(get_player().get_gender() == 2)
            {
               outputText("当你们热吻时，你的" + get_player().vaginaDescript(0) + "几乎立刻湿润起来，既因为水汽，也因为你愈发高涨的情欲。");
            }
            else
            {
               outputText("一阵深沉的渴望在你体内灼烧，那是你的身体几乎无从处理的需求，可你的乳头仍然硬了起来，连[asshole]也在期待中微微收紧。");
            }
            outputText("[pg]");
            if(get_player().biggestTitSize() >= 2)
            {
               outputText("科顿的吻一路落到你的" + get_player().biggestBreastSizeDescript() + "上，她将一颗[nipple]含入口中，贪婪地吮吸着，并用娴熟的技巧挑逗它。");
               if(get_player().biggestLactation() >= 1)
               {
                  outputText("她的努力很快得到了回报，乳汁开始从你的[nipple]里渗出。科顿惊讶地抬眼看向你的脸，却没有松开嘴，反而趁机大口吞咽你美味的乳汁。没过多久，她才退开，擦了擦嘴，几乎是扑向你的另一只乳房，迫不及待地想榨干里面珍贵的乳汁。那种被吸干的感觉压倒了你，你忍不住呻吟起来。片刻后，科顿松开你，咂了咂嘴。[say:真是又香又甜的乳汁啊，小宠物。改天我一定要拿你当早餐好好享用一番。]");
                  FlagDict_Impl_.arrayWriteInt(KFLAGS.flags,245,1);
               }
               else
               {
                  outputText("科顿很快换到另一边乳房，用她灵巧的舌头挑逗你的[nipple]。");
               }
               outputText("[pg]");
            }
            outputText("她继续沿着你的腹部吻下去，来到你的半人马身体前。她让你转过身，好让你的后身和她一起处在水流之中。");
            if(get_player().hasCock())
            {
               if(get_player().cockArea(0) > 70)
               {
                  outputText("[say: 哎呀呀，这是什么？]她把一只手托到你那根巨大却令人尴尬地软着的阴茎下，稍稍抬起。[say: 我的小宠物有这么大的鸡巴……正合我意。也许下次我能试试它……但今天不行，嗯？现在一切都是为了你。]");
               }
               else if(get_player().longestCockLength() < 4)
               {
                  outputText("[say: 哎呀，这是什么？]她把一只手托到你那根小得令人尴尬、还软塌塌的阴茎下，稍稍抬起。[say: 真可爱，又小又嫩。而且它很清楚自己的位置。现在这里只容得下一根鸡巴，虽然这根也算不上什么鸡巴。]她咯咯一笑，在顶端落下一吻，[say: 不过它确实很可爱。我喜欢。]");
               }
               else
               {
                  outputText("科顿把一只手伸到你那根尴尬地软着的肉棒下面，微笑着说：[say:你还真懂怎么向一个女孩表示喜欢她……现在这里只容得下一根鸡巴。]");
               }
            }
            if(get_player().hasVagina())
            {
               outputText("瞥见你的" + get_player().vaginaDescript(0) + "，科顿笑了笑，挑逗般拨弄你的[clit]，随后将两根手指探入你的褶皱间，再送到自己嘴边舔干净。[say: 嗯……我喜欢你淫液的味道，宠物……]");
            }
            if(get_player().get_gender() == 0)
            {
               outputText("她把一只手放在你光裸的胯间，挑了挑眉。[say: 嗯，这倒是新鲜……不过也绝对不坏。]她的手沿着你光裸的丘丘抚过，不知怎的，竟让一阵阵快感顺着你的脊背荡开。");
            }
            outputText("[pg]");
            outputText("科顿继续亲吻到你的[legs]，随后站起身，从更衣室拖来一条长凳。她站到凳子上，狠狠拍了一下你的[ass]。你回头向她投去一个含蓄挑逗的眼神，她也以同样的眼神回应你，又在你的侧臀上拍了一下。");
            outputText("她先让淋浴的水流冲湿你的后身，随后将自己的肉棒抵上你的[assholeorpussy]，小心地慢慢滑入，避免太过急躁。你轻轻呻吟着红了脸，低声对她说话，催促她继续。");
            if(get_player().hasVagina())
            {
               get_player().cuntChange(72,true,true,false);
            }
            else
            {
               get_player().buttChange(72,true,true,false);
            }
            outputText("[pg]");
            outputText("在这个角度下，她很轻易就将自己的长度与粗度全都送入你体内，让她的睾丸啪地拍在你的胯间。她一边挺动，一边一次又一次拍打你的臀部，而你发现自己正仰靠在半人马身体上，陷入一阵幸福的恍惚之中。");
            if(pregnancy.get_event() > 1)
            {
               outputText("科顿把沉甸甸的孕肚压在你的背上，尽力俯下身，在你耳边低语。[say:嗯……你喜欢这样吗？知道自己正被一个女人像女人一样操着？更别说这个女人还怀着你的孩子？因为我可太喜欢了——对我来说，这实在太变态、太刺激了……哦，我要把你狠狠操个够，就像你当初把这个孩子操进我肚子里一样。]她柔声低吟着，同时继续挺动。");
            }
            outputText("你的身体颤抖不止，一阵小小的高潮在体内炸开，不知怎的让你的全身都变得更加敏感。你强壮的伴侣紧紧搂住你，她那漆黑的肉棒在你的穴里来回抽插。你欢欣地挑弄并把玩着自己的乳头，渴望以某种方式获得甜美的释放。[pg]");
            outputText("再也忍耐不住的科顿做出最后一次挺刺。她把你的身体更深地拉回自己的肉棒上时，唇间逸出一声介于马嘶与呻吟之间的声音。一阵完整的高潮震撼了你的身体，仿佛闪电击中了每一根神经。你的背弓了起来，双腿几乎支撑不住，就连咬住嘴唇也无法压下那声漫长而低沉的呻吟。你的马儿情人的肉棒在你体内爆发，用她滚烫黏稠的精液涂满你的内壁；即便此刻，那些精液也已经开始沿着入侵的肉棒周围，从你的穴里渗漏出来。[pg]");
            outputText("精疲力尽的科顿从长凳上下来，回到水流下。她的精液从你被折腾得不堪的穴里流出，你的双腿抖得厉害，几乎要瘫倒。不过你的伴侣扶稳了你，你很快重新站稳。你们继续清洗彼此，感官挑逗般洗净对方最私密的部位，而科顿也把你的半人马形态身体好好清理了一番。瑜伽、性爱和清洗都结束后，你穿好衣服离开健身房，临走前最后捏了捏科顿的手。");
         }
         else
         {
            outputText("你决定接受她的提议，而她拉着你走向淋浴间，迅速强行脱掉你的衣服，接着也脱掉自己的。她只打开了一个淋浴喷头，把你拉进怀里，站在迅速升温的水流下。她一路吻上你的脖颈，咧嘴笑着，玩闹般轻咬你。");
            if(get_player().get_gender() == 1)
            {
               outputText("你的[cock]在身下微微发麻，但在科顿那根惊人的家伙面前依旧软塌塌的。");
            }
            else if(get_player().get_gender() == 3)
            {
               outputText("你的[cock]在身下微微发麻，但在科顿那根惊人的家伙面前依旧软塌塌的，而你的" + get_player().vaginaDescript(0) + "几乎立刻就在水汽和情欲中湿润起来。");
            }
            else if(get_player().get_gender() == 2)
            {
               outputText("当你们热吻时，你的" + get_player().vaginaDescript(0) + "几乎立刻湿润起来，既因为水汽，也因为你愈发高涨的情欲。");
            }
            else
            {
               outputText("一阵深沉的渴望在你体内灼烧，那是你的身体几乎无从处理的需求，可你的乳头仍然硬了起来，连[asshole]也在期待中微微收紧。");
            }
            outputText("[pg]");
            if(get_player().biggestTitSize() >= 2)
            {
               outputText("科顿的吻一路落到你的" + get_player().biggestBreastSizeDescript() + "上，她将一颗[nipple]含入口中，贪婪地吮吸着，并用娴熟的技巧挑逗它。");
               if(get_player().biggestLactation() >= 1)
               {
                  outputText("她的努力很快得到了回报，乳汁开始从你的[nipple]渗出。科顿惊讶地抬眼看向你的脸，却没有松开嘴，反而趁机大口咽下你美味的乳汁。没过多久，她退开身子，擦了擦嘴，几乎是扑向你的另一边乳房，急切地想把里面珍贵的乳汁吸个干净。那种被榨干般的感觉席卷全身，让你忍不住呻吟起来。片刻后，科顿抽身离开，咂了咂嘴。[say: 这奶可真是太、太美味了，小宠物。我简直必须拿你当早餐了……]");
                  FlagDict_Impl_.arrayWriteInt(KFLAGS.flags,245,1);
               }
               else
               {
                  outputText("科顿很快换到另一边乳房，用她灵巧的舌头挑逗你的[nipple]。");
               }
               outputText("[pg]");
            }
            outputText("她继续一路亲吻下去，吻过你的腹部，来到你的胯间。");
            if(get_player().hasCock())
            {
               if(get_player().biggestCockArea() > 70)
               {
                  outputText("[say: 哎呀呀，这是什么？]她把一只手托到你那根巨大却令人尴尬地软着的阴茎下，稍稍抬起。[say: 我的小宠物有这么大的鸡巴……正合我意。也许下次我能试试它……但今天不行，嗯？现在一切都是为了你。]");
               }
               if(get_player().longestCockLength() < 4)
               {
                  outputText("[say: 哎呀，这是什么？]她把一只手托到你那根小得令人尴尬、还软塌塌的阴茎下，稍稍抬起。[say: 真可爱，又小又嫩。而且它很清楚自己的位置。现在这里只容得下一根鸡巴，虽然这根也算不上什么鸡巴。]她咯咯一笑，在顶端落下一吻，[say: 不过它确实很可爱。我喜欢。]");
               }
               else
               {
                  outputText("科顿把一只手托到你那根令人尴尬地软着的阴茎下，笑着说：[say: 你还真会让女孩子知道你喜欢她……现在这里只容得下一根鸡巴。]");
               }
            }
            if(get_player().hasVagina())
            {
               outputText("瞥见你的" + get_player().vaginaDescript(0) + "，科顿笑了笑，挑逗般拨弄你的[clit]，随后将两根手指探入你的褶皱间，再送到自己嘴边舔干净。[say: 嗯……我喜欢你淫液的味道，宠物……]");
            }
            if(get_player().get_gender() == 0)
            {
               outputText("她把一只手放在你光裸的胯间，挑了挑眉。[say: 嗯，这倒是新鲜……不过也绝对不坏。]她的手沿着你光裸的丘丘抚过，不知怎的，竟让一阵阵快感顺着你的脊背荡开。");
            }
            outputText("[pg]");
            if(get_player().hasTailInsteadOfLegs())
            {
               outputText("科顿继续一路亲吻到你的[legs]，然后站起身，抓住你的腰，把你从地上抱了起来。");
               if(pregnancy.get_event() > 1)
               {
                  outputText("你反应很快，立刻用双臂环住科顿的脖子，身体缠上她的腰，位置就在她圆滚滚的孕肚下方，并顺着一条腿缠下去。你每动一下，都能感觉到她隆起的腹部蹭过你[if (isNaga) {蛇形|海生}]下半身的鳞片。");
               }
               else
               {
                  outputText("你反应很快，立刻用双臂环住科顿的脖子，身体缠上她的腰，并顺着一条腿缠下去。");
               }
            }
            else
            {
               outputText("科顿继续一路亲吻到你的[legs]，然后站起身，一只手臂分别勾住你的两条腿下方，把你从地上抱了起来。");
               if(pregnancy.get_event() > 1)
               {
                  outputText("你反应很快，立刻用双臂和双腿环住科顿，免得自己摔下去，同时小心避开她的孕肚——这可绝非易事。她的肚子贴在你身上，让你感受到那份结实的重量，还有你们未出生的孩子在里面轻轻踢动。");
               }
               else
               {
                  outputText("你动作很快，立刻用双臂和双腿缠住科顿，以免自己摔下去。");
               }
            }
            outputText("她飞快地吻了你一下，然后将肉棒对准你的[assholeorpussy]，温柔地滑了进去，小心着不让动作太快。你顺从却又带着鼓励地吻回去，并在她耳边低声催促她继续。");
            if(get_player().hasVagina())
            {
               get_player().cuntChange(72,true,true,false);
            }
            else
            {
               get_player().buttChange(72,true,true,false);
            }
            outputText("[pg]");
            outputText("以这个角度，她没法把自己全部粗度都塞进你体内，但这并不重要，因为那感觉简直美妙到了极点。她不断抽插着，你们则轮流亲吻彼此的脖颈，轻咬彼此的耳朵。");
            if(pregnancy.get_event() > 1)
            {
               outputText("科顿把她沉甸甸的孕肚压在你的腹部，尽可能俯下身，在你耳边低语。[say: 嗯……你喜欢这样吗？知道自己正像个女人一样被女人操？而且这个女人还怀着你的孩子？反正我可太喜欢了——对我来说，这真的太淫荡了……哦，我要把你狠狠操翻，就像你当初把这个孩子操进我肚子里一样。]她轻声呢喃着，同时仍在不断挺动。");
            }
            outputText("一阵小小的高潮猛然贯穿你的身体，让你浑身发颤、震动，不知为何还让全身都变得更加敏感。");
            outputText("你强壮的伴侣将你紧紧抱住，她漆黑的肉棒在你的穴中来回抽插。你在她怀里感到安全，那种安稳感是你在别处很少体会到的。你更用力地环住她，把科顿抱紧，咬住嘴唇，压抑着激情中的呻吟与低喘。[pg]");
            outputText("再也忍耐不住的科顿最后猛地一挺，把你的身体往她的肉棒上压下去，发出一声像马鸣般的呻吟。完整的高潮震撼了你的全身，仿佛闪电击中了每一根神经。你的背弓了起来，胸口压进科顿丰硕的胸脯里，就连咬住嘴唇也挡不住那声悠长而低沉的呻吟从你唇间溢出。你这位马儿恋人的肉棒在你体内喷发，将滚烫黏腻的精液涂满你的内里；即便此刻，它也已经开始从那根侵入的肉棒周围，自你的穴中漏了出来。[pg]");
            outputText("精疲力尽的科顿把你放到淋浴间的地面上，任由水流洒下；尽管精液仍从你被折腾过的穴里漏出，你的[legs]也颤得几乎让你瘫倒。好在你的伴侣扶稳了你，你很快重新站住。你们又回到清洗彼此的正事上，充满情欲地替对方洗净最私密的部位。瑜伽、性爱和清理都结束后，你们穿好衣服离开健身房，临别前你最后捏了捏科顿的手。");
         }
         if(get_player().hasVagina())
         {
            cottonPregPCChance();
         }
         get_player().orgasm("Generic");
         dynStats(DynStat.Sens(-1));
         get_player().hasGottenWashed();
         doNext(get_camp().returnToCampUseOneHour);
      }
      
      public function cottonFucksYou() : void
      {
         spriteSelect(SpriteDb.get_s_cotton());
         FlagDict_Impl_.arrayWriteInt(KFLAGS.flags,177,2);
         clearOutput();
         get_images().showImage("cotton-fucks-you");
         get_player().slimeFeed();
         if(get_player().get_gender() == 1)
         {
            outputText("你点头表示同意。见你没有主动，科顿笑了笑，走到你身后，把你推到你自己的淋浴水流下。[say: 别担心，我的小宠物，让科顿来照顾好一切……]她抓了一把肥皂，轻柔地搓揉你的后背，一边把肥皂抹开，一边放松你的肌肉。你向前倾身，把双臂和上半身靠在面前的墙上。[pg]");
            outputText("科顿微笑着，继续把肥皂揉开，直到摸到你的臀部。到了那里，她又抓起一把肥皂，按进你的股缝里，从会阴到尾骨温柔地替你打上泡沫。接着，她小心翼翼地将一根手指插入你的[asshole]，然后是两根、三根，没过多久，她整只手都在探索你的深处。她咯咯一笑，抽出手来，[say: 哎呀呀，你的小屁股可真是迫不及待呢，我的宠物。][pg]");
            outputText("她伸手到两腿之间托起自己的肉棒，让它搭在你的后腰上，同时用淋浴的水把它打湿，并撸动到完全挺起。你感觉它在你的背上寸寸挪动，变得越来越热、越来越硬。你回头瞥了一眼，估计它至少有两英尺长！你咽了咽口水，低下头，为那无可避免的一刻咬紧牙关。[pg]");
            outputText("[say: 好啦，宠物，别这么害怕，]科顿在你耳边低语，随后把她的阴茎从你背上抬起，抵在你的" + get_player().assholeDescript() + "上。她向前伸手，你听见温度旋钮被拧动时发出的吱呀声。几秒后，淋在你身上的水变得更热，让你整个身体都随之升温。趁着这个时候，科顿向前压来，她的马根像冲锋的军队一般侵入你的[asshole]。她缓慢地进出抽动，小心着不伤到你。");
            get_player().buttChange(72,true,true,false);
            outputText("[pg]");
            outputText("没过多久，你发现自己已经在她身下呻吟起来，你的[asshole]不受控制地收紧又放松。[say: 哦，我的小宠物现在喜欢上了，嗯？]她在你耳边低语，又极轻地咬了咬你的耳朵。你忍不住气息不稳地回应了一声[say: 是的]。科顿咯咯一笑，加快了抽插的速度。你发现自己也开始向后迎合她，催促她插得更深、更深。在这根神一般的巨物面前，你自己的肉棒已经完全软了下来，却仍因快感与期待而阵阵发麻。[pg]");
            outputText("这样过了几分钟后，你们谁也快撑不住了。随着你的[asshole]紧紧夹住，你们两人都发出一声因高潮而起的低沉呻吟；你感觉你的马儿情人的阴茎在你体内抽搐痉挛，将炽热的精液灌满你的洞。你自己软下来的分身也随着高潮颤抖，却没有喷射，而是泄出一小股精液，直接淌到地板上。");
            if(get_player().cumQ() >= 1000)
            {
               outputText("从你软塌塌的肉棒里漏出的精液多得几乎要把排水口堵住。");
            }
            outputText("[pg]");
            outputText("你们两人滑坐到地板上，正好落进你的精液水洼里，暂时任由水流冲洗身体。一分钟后，科顿把她如今已经软下去——但依旧惊人——的阴茎从你后面抽出；那里随后还张开了好几分钟。接着，她开始替你们两人清理身体。[pg]");
            outputText("你们的“锻炼后拉伸”和淋浴都结束后，两人擦干身体，重新穿好衣服，离开了健身房。科顿挽住你的胳膊说：[say: 真棒，小宠物。随时来健身房找我吧，我会等你的。]说完，她便回家去了。你脸上带着一丝笑意，也照做了。[pg]");
            get_player().orgasm("Anal");
            dynStats(DynStat.Sens(2));
         }
         else if(get_player().get_gender() == 2)
         {
            outputText("你点头表示同意。见你没有主动，科顿笑了笑，走到你身后，把你推到你自己的淋浴水流下。[say: 别担心，我的小宠物，让科顿来照顾好一切……]她抓了一把肥皂，轻柔地搓揉你的后背，一边把肥皂抹开，一边放松你的肌肉。你向前倾身，把双臂和上半身靠在面前的墙上。[pg]");
            outputText("科顿微笑着，继续把肥皂揉开，直到按到你的臀后。到了那里，她又抓了一把肥皂，按进你的股沟里，从[clit]到尾骨都轻轻替你抹上肥皂。接着，她小心地把一根手指插进你的小穴，然后是两根、三根，没过多久，她整只手都在探索你最私密的深处。她咯咯一笑，抽出手来，[say: 哎呀呀，你的小穴可真急切呢，我的宠物。][pg]");
            outputText("她伸手到两腿之间托起自己的肉棒，让它搭在你的后腰上，同时用淋浴的水把它打湿，并撸动到完全挺起。你感觉它在你的背上寸寸挪动，变得越来越热、越来越硬。你回头瞥了一眼，估计它至少有两英尺长！你咽了咽口水，低下头，为那无可避免的一刻咬紧牙关。[pg]");
            outputText("[say: 好啦，宠物，别这么害怕，]科顿在你耳边低语，随后把她的阴茎从你背上抬起，抵在你的" + get_player().vaginaDescript(0) + "上。她向前伸手，你听见温度旋钮被拧动时发出的吱呀声。几秒后，淋在你身上的水变得更热，让你整个身体都随之升温。趁着这个时候，科顿向前压来，她的马根像冲锋的军队一般侵入你的" + get_player().vaginaDescript(0) + "。她缓慢地进出抽动，小心着不伤到你。");
            get_player().cuntChange(72,true,true,false);
            outputText("[pg]");
            outputText("没过多久，你发现自己在她身下呻吟，你的小穴不受控制地收缩和放松。[say: 哦，我的小宠物现在喜欢这样了，嗯？]她在你耳边低语，并轻轻地咬了咬你的耳朵。你忍不住气喘吁吁地回答[say: 是的]。科顿咯咯地笑着，加快了抽插的速度。你发现自己向后迎合她，催促她进得更深。每次抽插后，你的阴蒂都会因快感而抽搐。[pg]");
            outputText("这样过了几分钟后，你们谁也快撑不住了。随着你的小穴紧紧夹住，你们两人都发出一声因高潮而起的低沉呻吟；你感觉你的马儿情人的阴茎在你体内抽搐痉挛，将炽热的精液灌满你的洞。你倒吸一口气，本能地弓起背，对着淋浴间的墙壁呻吟出声。[pg]");
            outputText("你们两人滑坐到地上，暂时任由水流把身体冲洗干净。过了一分钟，科顿把她如今已经软下去（但依旧很可观）的肉棒从你的褶皱间抽出；你的那里随后还张开了好几分钟。接着，她开始把你们两人清洗干净。[pg]");
            outputText("你们的“锻炼后拉伸”和淋浴都结束后，两人擦干身体，重新穿好衣服，离开了健身房。科顿挽住你的胳膊说：[say: 真棒，小宠物。随时来健身房找我吧，我会等你的。]说完，她便回家去了。你脸上带着一丝笑意，也照做了。");
            get_player().orgasm("Vaginal");
            dynStats(DynStat.Sens(-1));
            cottonPregPCChance();
         }
         else
         {
            outputText("你点头表示同意。见你没有主动，科顿笑了笑，走到你身后，把你推到你自己的淋浴水流下。[say: 别担心，我的小宠物，让科顿来照顾好一切……]她抓了一把肥皂，轻柔地搓揉你的后背，一边把肥皂抹开，一边放松你的肌肉。你向前倾身，把双臂和上半身靠在面前的墙上。[pg]");
            outputText("科顿微笑着，继续把肥皂揉开，直到按到你的臀后。到了那里，她又抓了一把肥皂，按进你的股沟里，从[clit]到尾骨都轻轻替你抹上肥皂。接着，她小心地把一根手指插进你的小穴，然后是两根、三根，没过多久，她整只手都在探索你最私密的深处。她咯咯一笑，抽出手来，[say: 哎呀呀，你的小穴可真急切呢，我的宠物。][pg]");
            outputText("她伸手到两腿之间托起自己的肉棒，让它搭在你的后腰上，同时用淋浴的水把它打湿，并撸动到完全挺起。你感觉它在你的背上寸寸挪动，变得越来越热、越来越硬。你回头瞥了一眼，估计它至少有两英尺长！你咽了咽口水，低下头，为那无可避免的一刻咬紧牙关。[pg]");
            outputText("[say: 哦，小宠物，别这么害怕，]科顿在你耳边低语，然后把她的肉棒从你背上抬起，抵在你的" + get_player().vaginaDescript() + "上。她向前伸手，你听见温控旋钮被拧动时发出的吱呀声。几秒后，浇在你身上的水变得更热，让你全身也随之发烫。趁着这时，科顿向前压来，她那马一样的肉棒像冲锋的军队般侵入你的[vagina]。她缓慢地抽插着，小心不让你受伤。");
            get_player().cuntChange(72,true,true,false);
            outputText("[pg]");
            outputText("没过多久，你发现自己已经在她身下呻吟起来，小穴不受控制地一紧一松。[say: 噢，我的小宠物现在喜欢上了，对吧，嗯？]她在你耳边低语，并极轻地咬了咬你的耳朵。你忍不住气息不稳地回了一声[say: 是]。科顿咯咯一笑，加快了抽插的速度。你发现自己也在向后迎合她，催促她插得更深、更深。每一次挺入后，你的[clit]都会因快感而抽动；在这根神一般的肉棒面前，你自己的[cock]完全软了下去，却依然因快感与期待而微微发麻。[pg]");
            outputText("这样过了几分钟后，你们谁都快撑不住了。你的小穴猛地收紧，你们同时发出一声沉沉的高潮呻吟；你感觉这位马儿情人的肉棒在你体内抽动、痉挛，把滚烫的精液灌满你的洞口。你倒吸一口气，本能地弓起背，对着淋浴间的墙壁呻吟；与此同时，你自己软下去的肉棒也随着高潮颤抖起来，但它没有喷射，只是漏出一小股精液，直接流到地板上。[pg]");
            outputText("你们两人滑坐到地上，暂时任由水流把身体冲洗干净。过了一分钟，科顿把她如今已经软下去（但依旧很可观）的肉棒从你的褶皱间抽出；你的那里随后还张开了好几分钟。接着，她开始把你们两人清洗干净。[pg]");
            outputText("你们的“锻炼后拉伸”和淋浴都结束后，两人擦干身体，重新穿好衣服，离开了健身房。科顿挽住你的胳膊说：[say: 真棒，小宠物。随时来健身房找我吧，我会等你的。]说完，她便回家去了。你脸上带着一丝笑意，也照做了。[pg]");
            get_player().orgasm("Vaginal");
            dynStats(DynStat.Sens(-1));
            cottonPregPCChance();
         }
         doNext(get_camp().returnToCampUseOneHour);
      }
      
      public function cottonFirstTimeFuckHer() : void
      {
         spriteSelect(SpriteDb.get_s_cotton());
         FlagDict_Impl_.arrayWriteInt(KFLAGS.flags,177,2);
         clearOutput();
         get_images().showImage("cotton-first-fuck");
         var _loc1_:int = get_player().cockThatFits(100);
         if(_loc1_ < 0)
         {
            _loc1_ = 0;
         }
         outputText("无需任何鼓励，你走到高大的马人双性身后，把她推到水流下。[say:哦，想要掌握主动吗？]她笑着说，[say:请便吧，我的小宠物。][pg]");
         outputText("你按下她的肩膀，让她弯下腰，水流顺着她的背脊冲下，绕过尾巴，沿着臀缝流淌。你跪下来，把脸埋进那道缝隙里，先深深吸入她带着麝香味的马类气息，随后第一次尝到她小穴的味道。那味道略带汗意，却有种咸甜的滋味，显然很合你的口味。你又尝了一口，然后又一口，没过多久，你的舌头已经在她的小穴上肆意舔弄，探入并绕过每一道褶皱，像寻找黄金的冒险者一样探索着。科顿随着你的动作喘息低吟，双臂撑在墙上支住身体。[pg]");
         outputText("她的小穴在你的舌头周围轻轻颤动。你能感觉到她已经离高潮很近了……但现在这并不是你想要的。带着些许遗憾，你离开了她那美味的阴户，擦掉脸上的水和淫液，站起身来，将你的" + get_player().cockDescript(_loc1_) + "抚弄到完全勃起，再抵上她已经准备好的入口。你牢牢抓住她的臀部，在你的马人情人耳边低声说着下流话，然后缓缓挺入。科顿发出一声极轻的嘶鸣和喘息，身体也向后迎向你。[pg]");
         outputText("淋在你身上的水变得更热了，你看见科顿的手正搭在温度控制器上。蒸汽在你们两人周围翻涌，你们本就滚烫的身体变得更加炽热。你向前挺进，她也迎着你回顶。你俯下身，一边抽插一边揉捏她丰满的胸部。她的双腿颤抖不止，仿佛随时都会支撑不住。[pg]");
         outputText("这样持续了好几分钟后，你终于再也忍不住，你的" + get_player().cockDescript(_loc1_) + "在她体内爆发，把精液涂满她的内壁；与此同时，你感觉科顿的小穴紧紧夹住你，把你最后一滴都榨了出来。她自己的阴茎也喷发出来，将你们下方的墙壁和地板都染上了她的麝香气味。几乎精疲力尽的你暂时瘫倒在科顿身上，努力喘息。你们两人一同滑坐到淋浴间的地板上，任由热水冲刷掉这场做爱的痕迹。[pg]");
         outputText("又过了一分钟，你把已经软下来的阴茎从你的马儿情人的洞里抽出，趁机仔细地为你们两人清洗身体。[pg]");
         outputText("你们的“锻炼后拉伸”和淋浴都结束了，两人擦干身体，重新穿好衣服，离开了健身房。科顿挽住你的手臂说：[say: 真棒，宠物。随时来健身房找我，我会等你的。]随后，她便回家去了。你脸上带着一丝笑意，也照做了。[pg]");
         pregCottonChance();
         get_player().orgasm("Dick");
         dynStats(DynStat.Sens(-1));
         doNext(get_camp().returnToCampUseOneHour);
      }
      
      public function cottonContraceptionToggle() : void
      {
         clearOutput();
         if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,680) > 0)
         {
            repeatContraceptionToggleCotton();
            return;
         }
         outputText("你问这位");
         if(pregnancy.get_isPregnant())
         {
            outputText("怀孕的");
         }
         outputText("母种马是否还在服用避孕草药。");
         outputText("[pg]科顿点点头，不过随即又明显思索了片刻。[saystart]我有在吃，不过我看它们根本挡不住你，对吧？你太");
         if(get_player().get_gender() != 3 || pregnancy.get_isPregnant())
         {
            outputText("有生育力了");
         }
         else
         {
            outputText("能生了");
         }
         outputText("；你居然硬是突破了它们本该给我的保护，让我还是可能当上妈妈或者爸爸。和你在一起的时候，我吃不吃它们好像根本没区别，你不觉得吗？[sayend]她总结道。");
         outputText("[pg]你承认这听起来确实有道理，但也不是说你一定能突破它们的保护，对吧？[pg]");
         if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,675) < 3)
         {
            outputText("[say:嗯，这倒是，]她承认道。[say:不过决定权交给你，宝贝。]");
         }
         else
         {
            outputText("[say:嗯，考虑到我们都有这么一窝孩子了，那些草药已经证明自己挺没用了，不是吗？所以，要是你想让我继续吃，我会吃，但我觉得没什么意义。]");
         }
         FlagDict_Impl_.arrayWriteInt(KFLAGS.flags,680,1);
         menu();
         addButton(0,"停止服用",tellCottonStopEatingHorsePills);
         addButton(1,"继续服用",tellCottonToKeepFiringBlanksAsshole);
      }
      
      public function cottonChat() : void
      {
         spriteSelect(SpriteDb.get_s_cotton());
         var _loc1_:Array = [];
         if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,11) > 0)
         {
            _loc1_[int(_loc1_.length)] = 1;
         }
         if(get_player().hasStatusEffect(StatusEffects.Edryn))
         {
            _loc1_[int(_loc1_.length)] = 2;
         }
         if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,54) > 0)
         {
            _loc1_[int(_loc1_.length)] = 2;
         }
         if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,119) != 0)
         {
            _loc1_[int(_loc1_.length)] = 3;
         }
         if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,2311) > 0)
         {
            _loc1_[int(_loc1_.length)] = 4;
         }
         var _loc2_:Number = int(_loc1_[Utils.rand(int(_loc1_.length))]);
         if(_loc2_ == 1)
         {
            if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,12) < 0 || FlagDict_Impl_.arrayReadInt(KFLAGS.flags,30) < 0)
            {
               outputText("做拉伸的时候，你不知不觉聊起了特尔阿德雷的人们。[say: 乌尔塔？]科顿说道，[say: 她是个好女人，但最近一直挺消沉的。]你的瑜伽搭档皱着眉瞪了你一眼，把你压进一个让人难受的姿势里，[say: 我听说你惹她伤心了。那可怜姑娘这辈子已经够苦了。我希望你没有让她的日子更难过。][pg]");
            }
            else if(get_game().urta.urtaLove())
            {
               outputText("做拉伸的时候，你不知不觉聊起了特尔阿德雷的人们。[say: 乌尔塔？]科顿说道，[say: 她是个好女人。我听说你们俩最近处得很像一对呢。]你脸红了。[say: 没什么好害羞的，照我听来的说法，你对她影响挺好的。她现在没以前那么紧绷、压力那么大了。不管你在对她做什么，都继续保持吧，小家伙。][pg]");
            }
            else
            {
               outputText("做拉伸的时候，你不知不觉聊起了特尔阿德雷的人们。[say: 乌尔塔？]科顿说道，[say: 她是个好女人。有时候有点神经紧绷，不过她肩上的担子很重，得保护我们大家在这里的安全。我倒是想邀请她过来做做瑜伽，也许能帮她放松一下，但我觉得这大概不是她喜欢的事。][pg]");
            }
         }
         else if(_loc2_ == 2)
         {
            if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,70) > 0)
            {
               outputText("做拉伸的时候，你不知不觉聊起了特尔阿德雷的人们。[say: 埃德琳？]科顿说道，[say: 我听说你搞大了她的肚子，然后把孩子丢给她一个人带。嗯，我觉得她自己也会成为一个很棒的母亲，可说真的，小家伙，你当时到底在想什么？你那样做也太残忍了。]接下来的训练里充满了更多疼痛的拉伸，科顿帮你调整动作时也比平时粗暴得多。[pg]");
            }
            else if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,69) > 0)
            {
               outputText("一边做着拉伸，你一边不知不觉和科顿聊起了特尔阿德雷的人们。[say:埃德琳？]科顿咯咯笑着说，[say:我听说你让她怀孕了，干得不错。我觉得她会成为一位很棒的妈妈，而你" + get_player().mf("也会成为一位很棒的爸爸","也一样") + "。]她在你脸颊上亲了一下，然后继续带你拉伸。[pg]");
            }
            else
            {
               outputText("一边做着拉伸，你一边不知不觉和科顿聊起了特尔阿德雷的人们。[say:埃德琳？]科顿说，[say:我深夜时在湿身婊酒馆附近见过她。我听说她会卖身赚钱，虽然我从没买过她的服务。不过她确实是个好女卫兵，救过很多人的命。][pg]");
            }
         }
         else if(_loc2_ == 3)
         {
            if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,54) < 5 && FlagDict_Impl_.arrayReadInt(KFLAGS.flags,54) > 0)
            {
               outputText("一边做着拉伸，你一边不知不觉和科顿聊起了特尔阿德雷的人们。[say:斯库拉？]科顿说，[say:就是湿身婊酒馆里那个穿得很奇怪的女人，对吧？我也说不上多了解她。她太神秘了。][pg]");
            }
            else if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,54) >= 5)
            {
               outputText("一边做着拉伸，你一边不知不觉和科顿聊起了特尔阿德雷的人们。[say:斯库拉？]科顿说，[say:我听说她组建了一个戒瘾互助小组。她做得好，镇里镇外都有很多人需要帮助。我很高兴她愿意站出来。][pg]");
            }
         }
         else if(_loc2_ == 4)
         {
            if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,119) != 0)
            {
               outputText("一边做着拉伸，你一边不知不觉和科顿聊起了特尔阿德雷的人们。[say:瓦拉？]科顿说，[say:就是湿身婊酒馆新来的那个女招待，对吧？她挺可爱的。她经历的那些事真让人难过。有时候我真希望能把每一只小恶魔都消灭干净。][pg]");
            }
         }
         else if(_loc2_ == 5)
         {
            if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,2311) == 1)
            {
               outputText("一边做着拉伸，你一边不知不觉和科顿聊起了特尔阿德雷以及更远地方的人们。[say:乔乔？]科顿说，[say:你也认识乔乔？我前阵子见过他。他教了我一些冥想的精妙之处，我把它们融进了我的瑜伽里。来，我们试试看。]接下来的锻炼时间里，你都在做冥想姿势。等结束时，你觉得自己……不知为何轻松了些。[pg]");
               dynStats(DynStat.Cor(-1));
            }
            else if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,2311) > 1)
            {
               outputText("一边做着拉伸，你一边不知不觉和科顿聊起了特尔阿德雷的人们。[say:乔乔？]科顿说，[say:你也认识乔乔？我前阵子见过他。他教了我一些冥想的精妙之处。不过最近我很少见到他了。不知道他去了哪里。]你在心里微微一笑，因为你很清楚他去了哪里。[pg]");
            }
         }
      }
      
      public function centaurNagaBodyBookStuff() : void
      {
         var _loc1_:* = null as IMap;
         spriteSelect(SpriteDb.get_s_cotton());
         if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,244) == 0)
         {
            outputText("[say: 我很乐意教你，但恐怕我不知道有什么适合你这种……体型的训练流程。抱歉，小乖乖……]她的声音渐渐低下去，像是在思考什么，随后又转向你说：[say: 其实，我想我可能知道你可以在哪里找到一本适合你的练习书。以前有个流动商人来过，我在他的货物里见过一本高级瑜伽技巧书，是给玛瑞斯那些体型比较奇特的居民准备的。当然，我没买，因为我用不上。但如果你能找到那个商人，把那本书带回来给我，我绝对就能指导你了。]");
            _loc1_ = KFLAGS.flags;
            FlagDict_Impl_.arrayWriteInt(_loc1_,244,FlagDict_Impl_.arrayReadInt(_loc1_,244) + 1);
            doNext(get_camp().returnToCampUseOneHour);
         }
         else if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,244) == 1 && get_player().hasKeyItem("Yoga Guide"))
         {
            outputText("[say: 你找到我提过的那本书了吗？]你点点头，把那本皮革封面的书递给她。她咧嘴一笑，翻起书页。[say: 哦哦，没错，我就觉得是这样……嗯哼……天啊，娜迦能那样伸展身体？]她突然想起你还在这里，于是说道：[say: 我会很快研究一下。晚点再来，我就能带你好好锻炼一场了。]");
            _loc1_ = KFLAGS.flags;
            FlagDict_Impl_.arrayWriteInt(_loc1_,244,FlagDict_Impl_.arrayReadInt(_loc1_,244) + 1);
            doNext(get_camp().returnToCampUseOneHour);
         }
         else if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,244) == 1)
         {
            outputText("[say: 你找到我提过的那本书了吗？]你难过地摇了摇头，她叹了口气。[say: 唉，在你找到之前，我也帮不上你什么忙。]");
            doNext(get_camp().returnToCampUseOneHour);
         }
         else if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,244) == 2)
         {
            outputText("你走近科顿，她朝你露出灿烂的笑容。[say: 我已经把那本书读完了，现在很有信心能指导你。怎么样，要不要试试看？我给你准备了合适的瑜伽服。嗯，其实主要就是上衣，不过对你来说，重要的就是这个，对吧？][pg]");
            outputText("你想和她一起做瑜伽吗？");
            _loc1_ = KFLAGS.flags;
            FlagDict_Impl_.arrayWriteInt(_loc1_,244,FlagDict_Impl_.arrayReadInt(_loc1_,244) + 1);
            cottonMenu();
         }
         else
         {
            cottonGreetingCommonEnd();
         }
      }
      
      public function beAGoodCottonDad() : void
      {
         clearOutput();
         outputText("你扶住她的肩膀，点了点头。你向她确认，不管她需要什么，你当然都会陪在她身边。");
         outputText("[pg]她脸上绽开笑容，紧紧地抱住了你，[say: 噢，感谢玛莱。我不是指望你立刻收拾东西搬过来一起住，我对我们现在这样完全没意见；只是如果你能在我身边，给我一些情感上的支持，那就太好了。]");
         outputText("[pg]她在你唇上亲了一下，然后回到健身房的瑜伽区。");
         FlagDict_Impl_.arrayWriteInt(KFLAGS.flags,678,1);
         doNext(get_camp().returnToCampUseOneHour);
      }
      
      public function beABadCottonDad() : void
      {
         clearOutput();
         outputText("你摇了摇头。你当然应付不了一个孩子。你直截了当地告诉她，你不想和这个孩子有任何牵扯。泪水在她眼眶里打转，她的嘴张开又合上好几次，却一个字也说不出来。");
         outputText("[pg]片刻之后，她绷紧下巴，脸上浮现出坚定的神情。你最初认识的那个自信女人似乎又回来了。她擦去双眼的泪水，说道：[say: 那好吧。我自己也能做到。]");
         outputText("[pg]她转身要走，却又停下，转回你面前");
         if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,70) == 0)
         {
            outputText("，用尽全力扇了你一耳光");
         }
         else
         {
            outputText("，用尽全力打了你一拳");
         }
         outputText("。[saystart]去你的“宠物”。");
         if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,70) > 0)
         {
            outputText("这一下也是替埃德琳给你的。");
         }
         outputText("[sayend]说完，她转过蹄子离开了。");
         outputText("<b>（科顿不会再和你说话了。）</b>");
         FlagDict_Impl_.arrayWriteInt(KFLAGS.flags,677,1);
         doNext(get_camp().returnToCampUseOneHour);
      }
      
      public function acceptYoga() : void
      {
         var _loc1_:* = null as Player;
         spriteSelect(SpriteDb.get_s_cotton());
         clearOutput();
         get_images().showImage("cotton-yoga");
         if(get_player().fatigueLeft() < 20)
         {
            outputText("你现在太累了，根本没法做瑜伽。");
            doNext(get_telAdre().telAdreMenu);
            return;
         }
         if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,167) == 0 && get_player().get_gems() < 10)
         {
            outputText("在你开始做瑜伽之前，那位半人马娘走上前来说：[say: 健身房费用，十颗宝石。]");
            outputText("[pg]你在小袋里翻找了一阵，但钱实在不够。也许下次吧！");
            doNext(get_camp().returnToCampUseOneHour);
            return;
         }
         if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,167) == 0)
         {
            _loc1_ = get_player();
            _loc1_.set_gems(_loc1_.get_gems() - 10);
            statScreenRefresh();
            outputText("在你们开始之前，半人马娘先收取了十颗宝石作为健身房费用。[pg]");
         }
         if(get_player().get_pregnancyIncubation() <= 225 && get_player().get_pregnancyType() == 20)
         {
            outputText("你换上瑜伽服，走近科顿，说你想上一堂拉玛泽呼吸法课程。科顿微笑着替你铺好垫子，然后坐下，示意你坐到她面前。你照做了，感觉到她裤子里的隆起顶着你的臀部，胸部也贴在你的背上。接下来的十五分钟里，你们就这样做着呼吸练习，又花了十五分钟在健身球上做伸展。锻炼时，科顿把身体贴在你身上，一有机会就用双手抚过你鼓胀的肚子。[pg]");
            cottonChat();
            outputText("等你结束训练，正准备去冲澡时，科顿把你拉到一旁，咧嘴笑着说：[say: 要不要来点训练后的加练？]");
            menu();
            if(get_player().hasCock())
            {
               addButton(0,"干她",fuckCottonInShowerRepeat);
            }
            else
            {
               addButtonDisabled(0,"干她","此场景需要你拥有阴茎。");
            }
            if(!get_player().isGenderless())
            {
               addButton(1,"被她干",cottonFucksYouInShowerRepeat);
            }
            else
            {
               addButtonDisabled(1,"被她干","此场景需要你拥有生殖器。");
            }
            if((get_player().get_spe() >= 50 || get_player().hasPerk(PerkLib.Flexibility)) && !get_player().isTaur())
            {
               addButton(2,"密宗性爱",cottonTantricSex);
            }
            else
            {
               addButtonDisabled(2,"密宗性爱","此场景需要你有足够的柔韧性。此场景不适用于半人马形态。");
            }
            addButton(14,"离开",leaveCotton);
         }
         else if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,176) == 0)
         {
            outputText("[say: 好，好，你不会后悔的。首先呢，宠物，我们得先把你从那身糟糕的衣服里解放出来。]她领你来到储物柜前，帮你脱下你的[armor]。");
            if(get_player().get_gender() == 3)
            {
               outputText("她瞥见你的胯间，笑着说：[say: 哦，男女两边的好东西都有，是吗？那你可算来对地方了。]");
            }
            else if(get_player().hasCock())
            {
               outputText("她托起你的[cock]，对你笑道：[say: 嗯，也许待会儿我们能派上它的用场。]");
            }
            else if(get_player().hasVagina())
            {
               outputText("她拍了拍你的胯间，说道：[say: 你知道吗，我知道一些很适合锻炼阴道肌肉的好动作……也许我们之后可以聊聊这个。]");
            }
            outputText("[pg]");
            outputText("然后她帮你换上一套和她身上完全相同的服装，接着你们一起回到健身房里。[pg]");
            outputText("她让你躺到垫子上，你照做了。随后她开始指导你完成几个姿势，并俯在你身旁，不时用轻柔的触碰纠正你这里或那里的姿势。她好几次弯身凑到你上方，那对巨大的胸部几乎贴到你脸上。有一次她站在你头顶上方，你不小心被她带着麝香味的胯间糊了满脸。这样过了大约半个小时，欲望和疲惫终于让你有些吃不消，你解释说自己现在必须先停下了。[pg]");
            dynStats(DynStat.Lust(10 + get_player().lib / 10 + get_player().sens / 20));
            outputText("[say: 哦，那可真可惜。不过作为初学者，你已经做得很不错了。]她扶你从垫子上站起来，轻轻拍了拍你的背。[say: 那要去冲个澡吗？]尽管你做的基本只是拉伸，你却发现自己已经出了不少汗……但不知为何，你开始怀疑她所谓的“冲澡”和你想的是不是同一回事。");
            menu();
            addButton(0,"冲澡",cottonShowerFunTimes);
            addButton(14,"离开",leaveAfterYoga);
         }
         else if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,177) == 1 && FlagDict_Impl_.arrayReadInt(KFLAGS.flags,176) > 0)
         {
            outputText("你换上瑜伽服，走向科顿，说你很想再来一次瑜伽锻炼。科顿微笑着为你铺好垫子。接下来的半个小时里，你尝试了不同的姿势和拉伸动作，而她则在一旁纠正你，有时还会把身体贴上来，亲自示范该怎么做。[pg]");
            outputText("练习结束、你正准备去冲澡时，科顿把你拉到一边，说道：[say: 我知道之前一起冲澡让你不太自在，所以这次我就不跟你一起了。不过如果你哪天改变主意，只要开口就行。]");
            menu();
            if(get_player().hasCock())
            {
               addButton(0,"干她",fuckCottonInShowerRepeat);
            }
            else
            {
               addButtonDisabled(0,"干她","此场景需要你拥有阴茎。");
            }
            if(!get_player().isGenderless())
            {
               addButton(1,"被她干",cottonFucksYouInShowerRepeat);
            }
            else
            {
               addButtonDisabled(1,"被她干","此场景需要你拥有生殖器。");
            }
            if((get_player().get_spe() >= 50 || get_player().hasPerk(PerkLib.Flexibility)) && !get_player().isTaur())
            {
               addButton(2,"密宗性爱",cottonTantricSex);
            }
            else
            {
               addButtonDisabled(2,"密宗性爱","此场景需要你有足够的柔韧性。此场景不适用于半人马形态。");
            }
            addButton(14,"离开",leaveCotton);
         }
         else
         {
            if(get_player().isTaur())
            {
               outputText("你换上瑜伽服——其实也就是那件背心——然后走向科顿，说你很想做一套瑜伽训练。科顿微笑着为你铺好一张大垫子。接下来的半小时里，你尝试了各种姿势和拉伸动作，大多是在活动上半身，但偶尔也需要伸展双腿或躺下来。训练时，科顿假装是在示范动作，把身体贴到你身上，实际上只是想让她的胸部和胯部贴着你蹭。[pg]");
            }
            else if(get_player().hasTailInsteadOfLegs())
            {
               outputText("你换上瑜伽服——其实也就是那件背心——然后走向科顿，说你很想做一套瑜伽训练。科顿微笑着为你铺好一张大垫子。接下来的半小时里，你尝试了各种姿势和拉伸动作，其中很多都需要以特定方式盘绕身体，或是用你[if (isNaga) {蛇一般的|[if (isMer) {鱼一般的|修长的}]}]身体摆出各种形状。科顿似乎真心对你的柔韧性范围印象深刻。训练时，她假装是在示范动作，把身体贴到你身上，实际上只是想让她的胸部和胯部贴着你蹭。[pg]");
            }
            else
            {
               outputText("你换上瑜伽服，然后走向科顿，说你很想做一套瑜伽训练。科顿微笑着为你铺好一张垫子。接下来的半小时里，你尝试了各种姿势，从简单的拉伸到别扭的扭身动作都有。训练时，科顿假装是在示范动作，把身体贴到你身上，实际上只是想让她的胸部和胯部贴着你蹭。[pg]");
            }
            cottonChat();
            outputText("等你结束训练，正准备去冲澡时，科顿把你拉到一旁，咧嘴笑着说：[say: 要不要来点训练后的加练？]");
            if(get_player().hasCock())
            {
               addButton(0,"干她",fuckCottonInShowerRepeat);
            }
            else
            {
               addButtonDisabled(0,"干她","此场景需要你拥有阴茎。");
            }
            if(!get_player().isGenderless())
            {
               addButton(1,"被她干",cottonFucksYouInShowerRepeat);
            }
            else
            {
               addButtonDisabled(1,"被她干","此场景需要你拥有生殖器。");
            }
            if((get_player().get_spe() >= 50 || get_player().hasPerk(PerkLib.Flexibility)) && !get_player().isTaur())
            {
               addButton(2,"密宗性爱",cottonTantricSex);
            }
            else
            {
               addButtonDisabled(2,"密宗性爱","此场景需要你有足够的柔韧性。此场景不适用于半人马形态。");
            }
            addButton(14,"离开",leaveCotton);
         }
         get_player().modTone(52,1);
         var _loc2_:IMap = KFLAGS.flags;
         FlagDict_Impl_.arrayWriteInt(_loc2_,176,FlagDict_Impl_.arrayReadInt(_loc2_,176) + 1);
         get_player().changeFatigue(20);
         dynStats(DynStat.Spe(1),DynStat.Lust(5 + get_player().lib / 20 + get_player().sens / 20));
      }
   }
}

