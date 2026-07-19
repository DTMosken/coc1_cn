package classes.scenes.places.telAdre
{
   import classes.CoC;
   import classes.Cock;
   import classes.DynStat;
   import classes.Player;
   import classes._FlagDict.FlagDict_Impl_;
   import classes.display.SpriteDb;
   import classes.globalFlags.KFLAGS;
   import classes.internals.Utils;
   import classes.scenes.Camp;
   import classes.scenes.places.TelAdre;
   import flash.Boot;
   import haxe.IMap;
   
   public class AuntNancy extends TelAdreAbstractContent
   {
      
      public function AuntNancy()
      {
         if(Boot.skip_constructor)
         {
            return;
         }
         super();
      }
      
      public function timeForAuntNancySpiderCooch() : void
      {
         clearOutput();
         outputText("你注视着这位依然美丽的蜘蛛娘的眼睛，半是着迷地点了点头表示同意。她灿烂地笑了（而且，你忍不住注意到，笑得相当淫荡），把她的一只下臂穿过你的一只手臂，同时把上臂搭在你的肩膀上。[say:那么，]南希阿姨说，[say:我想我们该走了。][pg]");
         outputText("她带领你穿过特尔阿德雷的街道，在人群和后巷中穿梭，最后你们停在一条小巷里一座不起眼的土坯房外。慢慢地，她用四只手臂环抱住你，给了你一个温柔的拥抱");
         if(get_player().biggestTitSize() >= 1)
         {
            outputText("并趁机隔着你的[armor]揉捏你的" + get_player().allBreastsDescript() + "");
         }
         outputText("。[pg]");
         outputText("[say:来我的客厅吧，]她在你耳边低语，轻轻舔舐着你的耳朵，然后将长舌尖探入耳洞，最后将柔软的双唇贴在你的耳垂上。[pg]");
         outputText("然后，她松开你，轻快地跑到门前，打开门溜了进去。");
         var _loc1_:Player = get_player();
         _loc1_.set_lust(_loc1_.get_lust() + 29);
         dynStats(DynStat.Lust(1));
         doNext(auntNancyPoonPartII);
      }
      
      public function strongStuff() : void
      {
         var _loc2_:* = null as IMap;
         clearOutput();
         if(get_player().get_gems() < 5)
         {
            outputText("你刚想点一杯烈酒，然后想起自己买不起。");
            doNext(interactWithAuntNancy);
            return;
         }
         dynStats(DynStat.Tou(1),DynStat.Inte(-1),DynStat.Lust(15));
         var _loc1_:Player = get_player();
         _loc1_.set_gems(_loc1_.get_gems() - 5);
         statScreenRefresh();
         outputText("你还是点了一杯烈酒，南希阿姨点了点头。她轻松地用一只手拿起一个玻璃杯，伸出另外两只手，在里面倒满了某种绿色的液体。[pg]");
         outputText("酒保注意到了你的目光，微笑着。[say: 浓蜂蜜酒，]她解释道，掂了掂杯子。[say: 我们用蜂娘的蜂蜜酿造的。尝尝吧，朋友。][pg]");
         outputText("你付了几颗宝石，抿了一口。酒精有点烧喉咙，但味道却甜得令人发指，不知不觉中，杯子就空了。[pg]");
         if(get_player().get_tou100() >= 30)
         {
            outputText("这酒味道不错，但似乎出奇地快就上了头，只喝了一杯就让你感到一阵愉悦的微醺。在喝下一杯之前，走动一下散散酒气也许是个明智的主意。你向南希阿姨道谢后，站起身来[feet]离开了。你走的时候，她用尊敬的目光注视着你。");
            _loc2_ = KFLAGS.flags;
            FlagDict_Impl_.arrayWriteInt(_loc2_,264,FlagDict_Impl_.arrayReadInt(_loc2_,264) + 10);
         }
         else
         {
            outputText("哇，这杯酒可真够劲儿的。你很确定自己不想再来一杯了。你感到有些头晕目眩，向酒保道谢后，摇摇晃晃地走出了酒馆。离开时，你听到南希阿姨在咯咯地笑，眼角余光瞥见她缩成一团，一手捂着嘴轻笑，似乎对你不胜酒力的样子感到好笑。");
            _loc2_ = KFLAGS.flags;
            FlagDict_Impl_.arrayWriteInt(_loc2_,264,FlagDict_Impl_.arrayReadInt(_loc2_,264) + 5);
         }
         doNext(get_camp().returnToCampUseOneHour);
      }
      
      public function lightStuff() : void
      {
         var _loc2_:* = null as IMap;
         clearOutput();
         if(get_player().get_gems() < 5)
         {
            outputText("你刚想点一杯淡酒，却突然想起自己根本买不起。");
            doNext(interactWithAuntNancy);
            return;
         }
         var _loc1_:Player = get_player();
         _loc1_.set_gems(_loc1_.get_gems() - 5);
         dynStats(DynStat.Tou(0.5),DynStat.Inte(-0.5),DynStat.Lust(7));
         outputText("你想了想，觉得这么早不适合喝烈酒，于是点了一杯淡酒。南希阿姨点点头，从她身后的木桶里倒出一种清澈明黄的液体，这也让你有机会好好打量一下她的背影。她的下半身似乎向后延伸出一长段黑色的甲壳，由几条粗壮的长腿支撑着。");
         if(get_player().get_inte() >= 20)
         {
            outputText("你意识到，她手上那看起来像及肩手套的东西，实际上应该是这外骨骼的甲壳部分。");
         }
         outputText("[pg]");
         outputText("她把酒递给你后，你试探性地抿了一口，发现它非常香甜清爽，似乎没什么酒精度，也不怎么烈。味道很好，你很快又喝了一杯。");
         if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,265) == 0)
         {
            _loc2_ = KFLAGS.flags;
            FlagDict_Impl_.arrayWriteInt(_loc2_,265,FlagDict_Impl_.arrayReadInt(_loc2_,265) + 1);
            outputText("[say: 那么，]她说着，将一双手臂搭在吧台上，另一双手托着下巴，[say: 你的故事是什么，朋友？你有一种特定的……]南希阿姨挥了挥手。[say: 气质。就像我已故的丈夫，愿玛莱保佑他。我猜，你是个……冒险者？你靠这片土地为生，为了宝石与怪物战斗，从你能找到或自己拼凑的东西里搜刮所有的装备？][pg]");
            outputText("你犹豫地点了点头，想起至少在这里，你不会受到恶魔的威胁。[pg]");
            outputText("[say: 太棒了！]她热情地说，张开了上面的一双手臂。[say: 我想这意味着你身上有不少故事，朋友。想分享一下吗？]尽管这酒度数不高，但还是让你有了些倾诉欲，你兴致勃勃地向她讲述了你的冒险经历。[pg]");
            outputText("你向她讲述了你最近在恶魔领域的一些事迹。就像这片奇异土地上的大多数故事一样，话题最终还是集中在了这里怪物们那奇怪而变态的性欲上，但她似乎并不介意。[pg]");
            outputText("酒保听得入了迷，在恰当的时候做出反应，听到特别令人震惊的情节时，她的胸部还会随之颤动。当你讲完后，她对你笑了笑，说道：[say: 哇，这故事真精彩。让我也给你讲一个……][pg]");
            outputText("南希阿姨给自己倒了一杯和你一样的酒，然后大口灌了下去。[pg]");
            outputText("[say: 嗯，]她开始说道，[say: 我并不总是当酒保。毕竟，我是在洞穴里长大的。我的族人过去常常让猎物走进我们的网里，这样我们就可以吃掉他们，或者你知道的，]酒保色眯眯地笑了笑，[saystart]如果他们长得可爱，我们就会放纵一下自己。我就是这样遇到他的。他是来自另一个世界的人，");
            if(get_player().humanScore() >= 4)
            {
               outputText("就像你一样，");
            }
            else
            {
               outputText("就像耳环店里可怜的小雅拉一样，");
            }
            outputText("然后，嗯，顺理成章地，我最终追着他来到了更广阔的世界。[sayend][pg]");
            outputText("南希阿姨如梦似幻地叹了口气。[say: 哦，我们一起经历的那些冒险，朋友！我们会在古代宝藏上摔跤，在古老废墟中战斗，争论到底是谁干掉了那个双性魅魔，像兔子一样疯狂做爱，然后坚持说是对方先高潮的。]她似乎在凝视着半空，脸上带着一丝惆怅的微笑。[say: 玛莱在上，我有多想他啊。距离我上次见到他，已经快十年了。有时候，我仍然觉得他会……走进这里，脸上带着那种自信的微笑，肩上扛着那把闪亮的旧魔法剑，然后开个玩笑。][pg]");
            outputText("她忧郁地又喝了一口酒，然后摇了摇头，让自己清醒过来。[say: 好了，谢谢你花时间陪我这个老寡妇。]她对着你眨了眨那依然美丽的睫毛，然后轻笑起来。[say: 有空再来。][pg]");
            if(Utils.rand(2) == 0)
            {
               dynStats(DynStat.Inte(1 + Utils.rand(2)));
            }
            _loc2_ = KFLAGS.flags;
            FlagDict_Impl_.arrayWriteInt(_loc2_,264,FlagDict_Impl_.arrayReadInt(_loc2_,264) + 20);
         }
         else
         {
            outputText("你一边品着酒，一边和南希交换了一会儿冒险故事，在这个相当安静的酒吧里享受着彼此的陪伴。这位年长的蜘蛛女士很健谈，和她共度了一段时光后，你觉得和她更亲近了。");
            if(Utils.rand(2) == 0)
            {
               dynStats(DynStat.Inte(1 + Utils.rand(2)));
            }
            _loc2_ = KFLAGS.flags;
            FlagDict_Impl_.arrayWriteInt(_loc2_,264,FlagDict_Impl_.arrayReadInt(_loc2_,264) + 20);
         }
         doNext(get_camp().returnToCampUseOneHour);
      }
      
      public function interactWithAuntNancy() : void
      {
         clearOutput();
         spriteSelect(SpriteDb.get_s_auntNancy());
         if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,264) >= 30 && get_game().time.hours == 14 && FlagDict_Impl_.arrayReadInt(KFLAGS.flags,266) == 0)
         {
            outputText("当你走进酒吧，期待着和南希阿姨共度时光时，你看到她正在打扫卫生，准备离开。她用一只眼睛发现了你，微笑着，用一只手向你挥手让你靠近，而另外三只手则把杯子放在吧台下。[pg]");
            outputText("[say: 下午好，朋友！] 她愉快地说道。 [say: 你最近确实经常来，我不能说我不感激你的陪伴。] 南希阿姨打量了你一下，现在的笑容多了一丝惆怅和忧郁。 [say: 你让我想起了我的丈夫，] 她承认道，完成手头的工作，用她那许多条腿从吧台后面溜了出来，下午班的酒保接替了她的位置。 [say: 这……我也说不上来。只是，你有一种特定的……<b>气质</b>。][pg]");
            outputText("南希阿姨叹了口气。 [say: 抱歉。我不想用一个老太婆的唠叨来烦你。我……我只是太想他了，有时候，我会觉得有点……孤独。] 她看着你，眼神中带着一种奇怪的、半饥渴、半绝望的神情。 [say: 你介意……跟我回家吗？你看起来有点紧张，我想给你做个按摩。][pg]");
            dynStats(DynStat.Lust(10));
            menu();
            addButton(0,"同意",timeForAuntNancySpiderCooch);
            addButton(1,"拒绝",declineAuntNancyMassage);
         }
         else if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,264) >= 30 && get_game().time.hours >= 14 - FlagDict_Impl_.arrayReadInt(KFLAGS.flags,264) / 30 && FlagDict_Impl_.arrayReadInt(KFLAGS.flags,266) > 0)
         {
            outputText("当你走向南希阿姨时，她抬起头，眼睛一亮。她高兴地用一只端庄的小手盖在你的手上向你打招呼，这是你们之间亲密关系的证明。[pg]");
            outputText("[say: 离不开我了，是吗，朋友？]她轻声问道，美丽的脸上挂着性感的微笑。[say: 想要点什么？你想喝一杯吗……]这位蜘蛛女士将她白发苍苍的头凑到你耳边，神秘地低语道，[say: 或者，你想让我早点下班，给你做个小小的……按摩？]听到她的话，你打了个寒颤。[pg]");
            menu();
            if(get_pc().get_gems() < 5)
            {
               addButtonDisabled(0,"烈酒","你买不起！");
               addButtonDisabled(1,"淡酒","你买不起！");
            }
            else
            {
               addButton(0,"烈酒",strongStuff);
               addButton(1,"淡酒",lightStuff);
            }
            addButton(5,"按摩",timeForAuntNancySpiderCooch);
            addButton(14,"返回",declineAuntNancyMassage);
         }
         else
         {
            outputText("你决定和酒保谈谈，于是径直走到吧台前。她看到你走过来，用第一双手把毛巾叠起来，同时用另一双手把正在擦拭的玻璃杯收起来。[pg]");
            outputText("[say: 欢迎来到湿身婊酒馆。我叫南希阿姨，今天早上由我为您服务。]她微笑着。[say: 那么，想要点什么，朋友？]酒保问道，她靠在吧台上，声音丰富而柔滑，而不是可爱，让你好好地看了一眼她的乳沟。[say: 我想，现在喝烈酒还早了点。][pg]");
            if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,263) < 1)
            {
               FlagDict_Impl_.arrayWriteInt(KFLAGS.flags,263,1);
            }
            menu();
            if(get_pc().get_gems() < 5)
            {
               addButtonDisabled(0,"烈酒","你买不起！");
               addButtonDisabled(1,"淡酒","你买不起！");
            }
            else
            {
               addButton(0,"烈酒",strongStuff);
               addButton(1,"淡酒",lightStuff);
            }
            addButton(14,"离开",get_telAdre().barTelAdre);
         }
      }
      
      public function declineAuntNancyMassage() : void
      {
         clearOutput();
         outputText("南希阿姨听着你礼貌地拒绝了她，点了点头，眼中的饥渴之色渐渐褪去。[say: 我完全理解。很抱歉打扰你了。]她开始往酒吧外走，停下脚步，转过身来再次打量你。[say: 当然，]她说，[say: 如果你改变主意了……只要我下班了，随时都可以来找我。][pg]");
         outputText("南希阿姨举起一只戴着黑手套的手放在嘴边，给你飞了个吻，然后匆匆离开了。");
         doNext(get_camp().returnToCampUseOneHour);
      }
      
      public function auntNancyPoonPartIV() : void
      {
         clearOutput();
         outputText("<b>两个充满激情、黏糊糊的小时过去了……</b>[pg]");
         get_player().orgasm("Generic");
         dynStats(DynStat.Str(0.3),DynStat.Tou(0.3));
         get_player().changeFatigue(35);
         var _loc1_:IMap = KFLAGS.flags;
         FlagDict_Impl_.arrayWriteInt(_loc1_,264,FlagDict_Impl_.arrayReadInt(_loc1_,264) + 20);
         if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,266) == 0)
         {
            outputText("你在南希阿姨的[say:床上]醒来，那是一堆不可思议地舒适的、不粘人的废弃蛛网，你的头仍然靠在她那舒适、柔软的胸膛上。你慢慢地坐了起来，温柔地按摩着酸痛的身体，尤其是你的");
            if(get_player().get_gender() > 0)
            {
               outputText("生殖器");
            }
            else
            {
               outputText("下巴");
            }
            outputText("。此刻，过去的一个小时左右对你来说只是一片模糊，那是性爱、激情和粘稠的迷雾。你仍然能尝到南希阿姨留在你嘴里的味道，也能闻到空气中她的气味。这个寡妇简直欲求不满，不管你让她高潮了多少次，她总是想要更多……而且她的技巧足以确保你也能高潮。私下里，你甚至开始怀疑到底是什么杀死了她的丈夫。[pg]");
            outputText("突然，你感觉到南希阿姨柔软的乳房挤压着你的后背，她的四只手臂睡眼惺忪地拥抱着你，环绕着你的胸前，你吓了一跳。你不确定是该期待地发抖还是害怕地颤抖，但你感觉到她的嘴唇轻轻地吻着你的耳朵，听到蜘蛛女那令人愉悦的沙哑、性感的嗓音低语着，[say:别担心，朋友。你已经满足我了……暂时。]你感觉到她的身体轻轻地摇晃着你的后背，开心地哼着歌。[pg]");
            outputText("[say:谢谢你，]她在你耳边喃喃自语。[say:我……我需要那个。我很感激你愿意满足这个肮脏的老寡妇的需求。这……很善良。]她停顿了一下，然后叹了口气。[say:我不会要求你再留下来了。你……前方有着伟大而可怕的命运。没必要试图隐藏它。老南希阿姨能看到这些。就像我丈夫一样……][pg]");
            outputText("你能感觉到南希阿姨滚烫的眼泪落在你的背上，你把一只安慰的手放在她的一只手上。你几乎能感觉到她透过眼泪的微笑，她又在你的耳朵上印下了一个吻。[say:我知道，我知道，]寡妇低语道。[say:我不会试图阻止你。只是……如果你愿意的话，有空回来看看好吗？时不时地？我……会很感激的。][pg]");
            outputText("蜘蛛女把头向后仰，用她的四只手臂松开了你的身体，然后相当大声地说：[say:现在，朋友，离开这里吧！去外面冒险，拯救世界吧！]突然，她调皮地在你的[ass]上狠狠地捏了一把。你跳了起来，痛得大叫，愤愤不平地转过身去面对她，只见她弯下腰，咯咯地笑着，眼泪还在脸上流淌。[say:让这些老旧的外骨骼甲壳休息一会儿吧，朋友，]南希阿姨笑着，躺回柔软的蛛网堆上。她慵懒地对你微笑着。[say:如果你想清洗一下，门厅旁边有水，你的[armor]在客厅里。还有……请务必保持联系。][pg]");
            outputText("你试探性地回以微笑，然后清理干净，穿好衣服，走进了特尔阿德雷突然刺眼的阳光中。[pg]");
         }
         else
         {
            outputText("你筋疲力尽，浑身黏糊糊的，在蜘蛛女床上的怀抱中醒来。你和寡妇分享了一个吻和温柔的时刻，然后让南希阿姨休息，你去清理干净并离开，虽然疲惫不堪，但也感觉从你的运动中变得更强壮了。当你离开时，她告诉你下次有空再来……");
         }
         _loc1_ = KFLAGS.flags;
         FlagDict_Impl_.arrayWriteInt(_loc1_,266,FlagDict_Impl_.arrayReadInt(_loc1_,266) + 1);
         doNext(get_camp().returnToCampUseTwoHours);
      }
      
      public function auntNancyPoonPartIII() : void
      {
         var _loc1_:int = 0;
         var _loc2_:int = 0;
         clearOutput();
         if(get_player().hasCock())
         {
            _loc1_ = get_player().shortestCockIndex();
            _loc2_ = get_player().longestCock();
            outputText("你能感觉到蜘蛛女的小穴开始愉悦地颤抖。南希阿姨很快呻吟起来，然后在难以置信的快感中大叫出声。她下半部分的眼睛全都闭上了，而其他的眼睛则在狂喜中翻白。[say:是的！是的！！]她用沙哑的、充满女性魅力的声音嘶嘶地说。她那原本如丝般光滑的阴道里，微小的触须突然开始挤压和拉扯你的" + get_player().cockDescript(_loc1_) + "，当你感觉到你的");
            if(get_player().balls > 0)
            {
               outputText("[balls]紧绷，翻腾并收紧时，你也发出了一声愉悦的吼叫。");
            }
            else
            {
               outputText("身体紧绷，准备释放你的种子。");
            }
            outputText("[pg]");
            outputText("你射了，射得很猛。浓稠湿润的粘稠精液喷涌进南希阿姨似乎深不见底的小穴里，即使它释放了你[balls]里巨大的压力，小穴里的触须和柔软光滑的内壁仍在继续摩擦和抚弄你的" + get_player().cockDescript(_loc1_) + "。如果说有什么不同的话，那就是持续不断的强大冲击似乎延长并加剧了蜘蛛女的高潮。");
            if(get_player().cumQ() >= 750)
            {
               outputText("不过，迟早她那奇妙的身体也无法再容纳更多的精液，她将肿胀的小穴从你的器官上滑下，让它在自由摆动时继续将浓稠丰富的精液喷洒在她身上。");
            }
            outputText("[pg]");
            if(get_player().cocks[_loc2_].cockLength >= 22 && get_player().cockTotal() > 1)
            {
               outputText("南希阿姨将舌头从你的" + get_player().cockDescript(_loc2_) + "上松开，发出愉悦的叫声，同时她的手也放开了她可爱的乳房，转而抓住你的躯干。尽管如此，她那大而柔软的乳房足够坚挺，当她在你身上挺动尖叫时，能将你" + get_player().cockDescript(_loc2_) + "的肉棒紧紧包裹在里面，它们更是为你自己的性快感做出了贡献。[pg]");
               outputText("它也痉挛起来，将粘稠的精液喷洒在你们俩身上");
               if(get_player().cumQ() >= 750)
               {
                  outputText("，有些甚至喷到了天花板上，落入她那短而漂亮的白发中，并溅落在她拖在后面的腹部上");
               }
               outputText("。[pg]");
            }
            if(get_player().cockTotal() > 2)
            {
               if(get_player().cockTotal() > 1)
               {
                  if(get_player().cocks[_loc2_].cockLength < 22 && get_player().cockTotal() == 2 || get_player().cocks[_loc2_].cockLength >= 22 && get_player().cockTotal() == 2)
                  {
                     outputText("你的另一根肉棒也射了，她那光滑、覆盖着甲壳的手依然紧紧握着它，这弄得更是一团糟，精液溅得你们俩满身都是。[pg]");
                  }
                  else if(get_player().cocks[_loc2_].cockLength < 22 && get_player().cockTotal() > 2 || get_player().cocks[_loc2_].cockLength >= 22 && get_player().cockTotal() > 2)
                  {
                     outputText("你剩下的[cocks]也射了，她那光滑、覆盖着甲壳的手依然紧紧握着它们，这弄得更是一团糟，精液溅得你们俩满身都是。[pg]");
                  }
               }
            }
            if(get_player().hasVagina())
            {
               outputText("你的" + get_player().vaginaDescript(0) + "紧紧地收缩着，");
               if(get_player().balls == 0 && (get_player().cocks[_loc2_].cockLength < 22 || get_player().cocks[_loc2_].cockLength >= 22 && get_player().cockTotal() <= 2))
               {
                  outputText("挤压着南希阿姨的手指，那手指仍在你的体内挠痒痒");
               }
               else
               {
                  outputText("让你渴望里面能有什么东西");
               }
               outputText("，随着[eachcock]在狂喜中痉挛。[pg]");
            }
            outputText("最终，你们的高潮都结束了。你感到筋疲力尽，就像刚跑完一英里长跑一样，尽管大部分工作都是南希阿姨在做。然而，她看起来很好，带着灿烂幸福的笑容低头看着你。");
            if(get_player().cockTotal() >= 2 && get_player().cumQ() >= 700)
            {
               outputText("她的下半身满是涂抹开的精液，一直延伸到她那傲人双乳的下半部，而她的脸和上半身也没好到哪里去。在她身后，你可以看到喷洒在她身上的流弹在她的腹部画出了一道道白色的条纹。");
            }
            outputText("[pg]");
            if(get_player().cockTotal() >= 2 && get_player().cumQ() >= 700)
            {
               outputText("南希阿姨一只手顺着她那乳白色的身体向上摸去，在厚厚的粘稠精液层中挖出一条宽宽的沟壑，随着手向上移动到她的肚子，再顺着乳房的曲线向上，然后她把手拿开，举到嘴边。");
            }
            else
            {
               outputText("南希阿姨把一只手放在她滴水的小穴下面，挤压着某块强有力的内部肌肉。一大团粘稠的精液从她体内掉落到手上，她把它举到嘴边。");
            }
            outputText("蜘蛛女将长长的舌头缠绕在沾满液体的手上，舔舐着你");
            if(get_player().balls > 0)
            {
               outputText(get_player().ballsDescriptLight());
            }
            else
            {
               outputText("身体");
            }
            outputText("里喷出的一大股浓稠液体，然后仰起头让它滑入嘴里。[pg]");
            outputText("[say: 嗯……]她发出满足的咕噜声。南希阿姨注意到了你的表情，性感地笑了笑。[say: 怎么了？女士也需要补充蛋白质啊，朋友。你以为我的网是凭空吐出来的吗？][pg]");
         }
         else
         {
            outputText("你能感觉到蜘蛛女的小穴开始愉悦地颤抖。南希阿姨很快呻吟起来，随后在极度的快感中大叫出声。她下半部分的眼睛全都闭上了，而其他的眼睛则在狂喜中向上翻白。[say: 对！就是这样！]她用沙哑而充满女性魅力的声音嘶嘶地说着。她原本丝滑的阴道里，那些微小的触须突然开始挤压和拉扯你的手指，而她自己的手指也很快触碰到了你");
            if(get_player().hasVagina())
            {
               outputText(get_player().vaginaDescript(0) + "和");
            }
            outputText("[asshole]里敏感的地方。[pg]");
            outputText("你舒服得大叫起来，感觉高潮像滚烫的金属一样在你的脊椎上下游走。你发出一声欢愉的惊呼，感觉到她的手在你的[chest]上收紧，很快你也沉浸在她的身体紧贴着你、深入你体内、按压着你所有最脆弱部位的感觉中。");
            if(get_player().wetness() >= 5 || get_player().biggestLactation() >= 1)
            {
               outputText("她的手很快就被你身体奇妙的分泌物浸透了，就像你的");
            }
            else
            {
               outputText("你的");
            }
            outputText("手指也很快被她小穴里香甜可口的汁液浸透了。[pg]");
            outputText("最终，这种感觉消退了，她轻轻地将手指从你的");
            if(get_player().hasVagina())
            {
               outputText(get_player().vaginaDescript(0) + "和");
            }
            outputText("[asshole]里抽出来。你感到筋疲力尽，就像刚跑完长跑一样，尽管大部分工作都是南希阿姨在做，你任由手臂落回她那黏糊糊的网上。然而，她看起来很好，带着灿烂幸福的笑容低头看着你。");
            if(get_player().hasVagina())
            {
               outputText("南希阿姨把那只刚刚浸透了你" + get_player().vaginaDescript(0) + "汁液的光滑湿润的手举到嘴边，对你笑了笑。蜘蛛女将长长的舌头缠绕在沾满液体的手上，满脸享受地舔舐着那些液体。[say: 嗯……]她发出满足的咕噜声。[say: 你的味道真不错。][pg]");
            }
         }
         outputText("南希阿姨俯下身，再次将柔软的嘴唇贴在你的嘴唇上，用她的四只手臂将你被网缚住的身体紧紧抱住，你再次感到比一分钟前放松得多，而且（现在回想起来）也更加兴奋了。然而，这场性爱消耗了你太多的精力，当亲吻结束时，你渴望地看着她肩膀后方的门。不幸的是，蜘蛛女看到了你的举动，邪恶地笑了笑。[pg]");
         outputText("[say: 在玛莱这片绿色的土地上，想都别想，朋友，]她发出咕噜声，声音像沙哑的天鹅绒，同时用她那仍然饥渴的小穴表面摩擦着你的肚子。[say: 我的床上已经有十多年没有过情人了，在我说你可以走之前，你哪儿也去不了。]最后那句话伴随着对你[ass]的邪恶挤压，南希阿姨再次将嘴唇贴在你的嘴唇上，这次不再那么温柔，而是更加充满激情。你在她嘴里呻吟着，感觉到她那催情的体液渗入你的口中，很快，当她松开你的上半身，把你的头按进她柔软丝滑的小穴时，你知道她是对的。[pg]");
         outputText("[say: 如果这次还是我一个人出力，那我可就太亏了，]南希阿姨补充道，然后在你的嘴唇触碰到她时发出一声满足的呻吟。");
         doNext(auntNancyPoonPartIV);
      }
      
      public function auntNancyPoonPartII() : void
      {
         var _loc2_:Boolean = false;
         var _loc3_:int = 0;
         clearOutput();
         outputText("你慢慢地跟着南希阿姨走进她的家。即使在白天，屋子里也相当昏暗阴沉，厚厚的、不知名白色物质做成的窗帘将大部分阳光挡在外面。你的眼睛还适应着外面明亮的沙漠，在突然失明的情况下，你几乎看不清屋内的陈设。这时，你听到身后传来一阵突然的沙沙声，当你转过身去面对时，你被推向了更深的黑暗中。你的脚跟被一根粗壮的、感觉像绳子一样的东西绊住，你仰面摔倒，四肢摊开，落在了一张紧绷的网上。[pg]");
         outputText("你试图爬起来，却发现你的肉体和[armor]都被网上的粘性物质牢牢粘住，你突然意识到，这其实是一张铺满整个地板的厚厚蛛网。你感到一阵恐慌，开始拉扯挣扎，突然你感觉到一只光滑冰凉的手抚上了你的脸。你的夜视能力开始恢复，你认出了南希阿姨的脸，她苍白的皮肤在黑暗中似乎闪闪发光。她俯身看着你，眼睛凝视着你的眼睛，一根手指划过你的脸颊，然后捂住你的嘴唇，示意你安静。[pg]");
         outputText("蜘蛛娘用另外三只手划了根火柴，点亮了一盏小灯笼，把它挂在墙上。在灯笼照亮的一小块区域里，你可以看到南希阿姨已经脱下了她那件没有领子的黑色连衣裙，在她工作时，她那傲人的双峰微微晃动着。在她再次转身面对你之前，你瞥见了她那不同寻常的生殖器。[pg]");
         if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,266) == 0)
         {
            outputText("[say:已经……很久很久了，]南希阿姨喃喃自语，她沙哑的嗓音拂过你的全身。她的两只手放在你的[chest]上，另外两只手小心翼翼地环绕着你的肩膀和脖子，温柔地给你做着承诺过的按摩。她在蛛网上爬行，许多只脚轻松地避开了粘稠的部分，她的脸离你只有几英寸远。当她的许多只眼睛低头看着你时，你能闻到她甜美、略带酒味的呼吸。[say:自从我失去丈夫后，我就……没有和任何人在一起过，而且……嗯……我……我需要这个。你能陪陪我吗，哪怕只是一小会儿？][pg]");
         }
         else
         {
            outputText("[say:你准备好迎接我了吗，朋友？]南希阿姨喃喃自语，她沙哑的嗓音拂过你的全身。她的两只手放在你的[chest]上，另外两只手小心翼翼地环绕着你的脖子和肩膀，温柔地给你做着承诺过的按摩。她在蛛网上爬行，许多只脚轻松地避开了粘稠的部分，她的脸离你只有几英寸远。当她的许多只眼睛低头看着你时，你能闻到她甜美、略带酒味的呼吸。[say:我可是准备好了，小苍蝇。][pg]");
         }
         outputText("你安静地，被她那充满渴求的红眼睛迷住了，点了点头。南希阿姨端庄地笑了。[say:很好，]她发出满足的呼噜声，将嘴唇凑向你的嘴唇。你不太确定会发生什么，但当她吻上你时，她的嘴唇柔软而温柔。她的舌头轻轻地滑入你的嘴里，轻松地缠绕着你的舌头，她那味道甜美的唾液很快就滑入你的喉咙。瞬间，你感觉到你的身体放松下来，并且");
         if(get_player().get_inte() > 40)
         {
            outputText("意识到这唾液中一定含有某种原本用来麻痹猎物的化学物质");
         }
         else
         {
            outputText("怀疑这是否是蜘蛛娘的吻造成的");
         }
         outputText("。[pg]");
         outputText("当你在她的抚摸下放松下来时，她的许多只手臂正在努力剥去你的[armor]，小心翼翼地将它们剥离，直到你赤身裸体、充满渴求地躺在蜘蛛娘的网上。[pg]");
         outputText("你很快就完全放松下来，漫不经心地想，到底是南希阿姨的许多只手在你的[chest]、[ass]、背部和脖子上持续进行的按摩，还是她那充满爱意、奇特的吻和长长卷曲的舌头，让你如此放松。然而，最终她将她那白发苍苍的头从你身边移开，并将她的许多只手从你的躯干上移开。看着你突然露出的不悦表情，南希阿姨笑了笑，开始顺着你的身体往下吻，首先沿着你脖子的曲线，将她长长湿润的舌头滑过你的胸膛，你因这种感觉而舒服得发抖。她将柔软的嘴唇贴在你的[nipples]上，轻轻地啃咬着，享受着你愉悦的呻吟声，然后将头移向你的腹部");
         if(get_player().tail.type > 0)
         {
            outputText("直到你的尾巴根部");
         }
         outputText("。[pg]");
         if(get_player().hasTailInsteadOfLegs())
         {
            outputText("她轻轻地剥开掩盖你生殖器的皮肤褶皱，现在那里已经因为期待而变得湿润滴水。");
         }
         outputText("南希阿姨舔了舔嘴唇，她那许多只眼睛里闪烁着饥渴的光芒，低头看着你，显然对她所看到的非常满意。[pg]");
         if(get_player().balls > 0)
         {
            outputText("看到你的[balls]，她笑了，轻轻地举起两只手抚摸和揉捏它们，柔软的嘴唇贴在上面，");
            if(get_player().ballSize < 15)
            {
               if(get_player().ballSize > 5 && get_player().ballSize < 15)
               {
                  outputText("含住其中一个");
               }
               else
               {
                  outputText("把它们都含进");
               }
               outputText("嘴里，让它浸泡在她的唾液中，同时用她那长而灵巧的舌头包裹和抚摸");
               if(get_player().ballSize <= 5)
               {
                  outputText("它们");
               }
               else
               {
                  outputText("它");
               }
               outputText("。[pg]");
            }
            else
            {
               outputText("用那湿润、令人放松的嘴唇亲吻和舔舐着它们。[pg]");
            }
         }
         if(get_player().hasVagina())
         {
            outputText("蜘蛛女");
            if(get_player().balls > 0 && get_player().hasCock())
            {
               outputText("移开你其他的[say: 装备]，然后");
            }
            outputText("检查你" + get_player().vaginaDescript(0) + "的褶皱。当她那光滑冰冷的手抚摸着你的褶皱，指尖滑入你的体内时，你因为这种感觉而颤抖。南希阿姨抬头对你微笑，很享受你的反应。[say: 你喜欢吗？]她用那迷人沙哑的声音问道，你热情地点了点头。[say: 很好……]她发出满足的呼噜声，然后将她那长而滑溜的舌头滑入你的体内。当感觉到它在你体内移动，探索你的形状时，你突然惊讶地叫出声来，然后她在你扭动时把它抽了出来。[say: 嗯嗯嗯……]南希阿姨喃喃自语。[say: 你的味道真好，朋友。][pg]");
         }
         if(get_player().hasCock())
         {
            outputText("南希阿姨用她光滑的黑手轻轻抚摸着你的" + get_player().multiCockDescriptLight() + "，享受着你愉悦的呻吟声，然后低下头亲吻你[cock]的头部。她的舌头缠绕着它，蜘蛛女吸吮了一下，喝掉了现在漏出的一小股先列腺液，然后抬起头看着你，脸上带着温柔的微笑，她那许多只手继续揉捏和探索你的[cocks]。[say: 虽然不如我丈夫的，]她低语道，[say: 但确实是个好东西。][pg]");
         }
         if(get_player().get_gender() == 0)
         {
            outputText("[say: 哎呀，哎呀，哎呀，]南希阿姨喃喃自语，对她所看到的感到好奇。[say: 非常不寻常，但我们会看看能做些什么。]她停下来舔了舔你生殖器曾经所在的肉质区域。[pg]");
         }
         outputText("她的两只手突然环绕住你" + get_player().buttDescript() + "的脸颊，轻轻地揉捏。[say: 非常好，]蜘蛛女低语道，然后她长长的舌头伸出来，滑过你[ass]的表面。舌尖甚至轻轻地滑了进去，你感觉到她的唾液涂满了你屁股的内侧。感觉很敏感，而且比一分钟前放松多了。[pg]");
         if(get_player().hasCock())
         {
            outputText("南希阿姨在你上方升起，依然带着温柔性感的微笑，伸出手。");
         }
         var _loc1_:int = get_player().shortestCockIndex();
         if(get_player().hasCock())
         {
            outputText("她轻轻地挑出[onecock]，把它举到她的阴部。你看到它的入口，两片分开的壳板滴着湿润的液体，如果你不是这么放松的话，几乎会因为这陌生的景象而恐慌。在充满爱意的引导下，南希阿姨将你的" + get_player().cockDescript(_loc1_) + "完全滑入她的深处。当你的阴茎摩擦并刺激她时，你们俩都发出了愉悦的呻吟，这显然是她很久很久没有体会过的感觉了；她那充满异国情调的内部，光滑、如丝般深邃，像天鹅绒手套一样挤压和抚摸着你的" + get_player().cockDescript(_loc1_) + "。她体内的小触须开始按摩你的阴茎，里面湿润滴水的液体和她的唾液一样令人放松。[pg]");
            outputText("[say: 哦哦哦，]她如梦似幻地叹息着，眼神暂时变得遥远而失焦。[say: 玛莱在上，这感觉太棒了。][pg]");
            _loc2_ = false;
            _loc3_ = get_player().longestCock();
            if(get_player().cockTotal() >= 2)
            {
               if(get_player().cocks[_loc3_].cockLength >= 22)
               {
                  _loc2_ = true;
                  outputText("当南希阿姨热情地骑着你时，蜘蛛女举起");
                  if(get_player().totalCocks() > 2)
                  {
                     outputText("你的另一根");
                  }
                  outputText("你的");
                  if(get_player().cockTotal() == 2)
                  {
                     outputText("另一根肉棒");
                  }
                  else
                  {
                     outputText("肉棒");
                  }
                  outputText("举到她起伏的胸前，然后把它滑进她柔软可爱的乳房之间。[say: 想来点别的舒服的吗？]蜘蛛女问道，眼睛闪烁着光芒。[pg]");
                  outputText("南希阿姨一边骑在你身上起起伏伏，一边用两只黑壳般的手抓住自己的双乳，开始在你那根高高挺立、淌着汁液的" + get_player().cockDescript(_loc3_) + "两侧上下滑动着，");
                  if(get_player().cocks[_loc3_].cockLength >= 30)
                  {
                     outputText("让它的头部滑进她的嘴里，她饥渴地吸吮和舔舐着，");
                  }
                  else
                  {
                     outputText("让她长而灵巧的舌头从嘴里垂下来，缠绕在肉棒的头部，偶尔也舔舐她自己傲人的胸部，");
                  }
                  outputText("同时一直低头凝视着你的眼睛。[pg]");
                  outputText("她那柔软如枕的胸部包裹着你的" + get_player().cockDescript(_loc3_) + "，以及她灵巧的舌头");
                  if(get_player().cocks[_loc3_].cockLength >= 30)
                  {
                     outputText("和嘴巴");
                  }
                  outputText("带来的感觉，简直不可思议。南希阿姨开心地咕哝着，显然很享受这个味道。[pg]");
               }
               if(get_player().cockTotal() > 2)
               {
                  if(get_player().cockTotal() == 3)
                  {
                     outputText("她的另一只手缠绕在你的另一根肉棒上");
                  }
                  else
                  {
                     outputText("她的其他手缠绕在你更多的肉棒上");
                  }
                  outputText("，榨取并抚摸着");
                  outputText("跳动的肉棒");
                  if(get_player().cockTotal() > 3)
                  {
                     outputText("");
                  }
                  outputText("，尽情地");
                  if(get_player().cockTotal() == 3)
                  {
                     outputText("享受着");
                  }
                  else
                  {
                     outputText("享受着");
                  }
                  outputText("。[pg]");
               }
            }
            if(!_loc2_ && get_player().biggestLactation() >= 1)
            {
               outputText("当乳汁慢慢从你的" + get_player().nippleDescript(0) + "中渗出时，蜘蛛女注意到了。她低下头，用柔软可爱的嘴唇含住你" + get_player().allBreastsDescript() + "的顶端，温柔地吮吸着，舌头疯狂地舔弄着你的[nipple]。你呻吟着躺回蛛网上，多种性快感冲击着你的感官，几乎让你无法承受，南希阿姨开始吞咽你的乳汁。[pg]");
            }
            if(!_loc2_ || _loc2_ && get_player().cockTotal() <= 2)
            {
               outputText("她剩下的手在你身上温柔地游走，交替着揉捏你的[ass]，甚至有时会将手指滑入其中探索，");
               if(get_player().balls > 0)
               {
                  outputText("温柔地揉捏抚摸着你的[balls]，里面的精液翻滚沸腾，并且");
               }
               else if(get_player().hasVagina())
               {
                  outputText("探索着你" + get_player().vaginaDescript(0) + "的褶皱，并且");
               }
               outputText("按摩着你的[chest]。偶尔，它们会抚过你的[hair]。[pg]");
            }
         }
         else if(get_player().hasVagina())
         {
            outputText("南希阿姨温柔地俯下身抚摸你的脸颊，她的另外两只手伸出来开始抚摸你的胸部，而第四只手则探索着你" + get_player().vaginaDescript(0) + "外侧的褶皱。[say:真是只漂亮的小苍蝇，]蜘蛛女盯着你的脸低语道，她鲜红的眼睛里充满了渴望。她把脸贴在你的头侧，你顺从地转过头，让她能接触到你的耳朵。她迅速将舌头再次滑入其中，享受着你在她身下颤抖和惊呼的感觉。[pg]");
            outputText("随着你转过头，你突然发现蛛网下方的地板上躺着一根曾经做工精良的假阳具。你看到它已经被磨得像苹果皮一样光滑，而且可能比以前细得多，你突然好奇这位寡妇的性欲到底有多么压抑。[pg]");
            outputText("当南希阿姨的手指再次触碰到你的下半身时，这些想法被打断了，她抚摸着你的");
            if(get_player().tail.type > 0)
            {
               outputText("尾巴，然后向上移动到你的");
            }
            outputText(get_player().vaginaDescript(0) + "和[ass]。南希阿姨把你的头转过来面对她，再次站起身来，她的手指开始深深地陷入你的" + get_player().vaginaDescript(0) + "和[asshole]中。你大声而持久地呻吟着，南希阿姨淫荡地笑着，她的其他手仍在探索和揉捏你的[chest]，温柔地揉搓着，偶尔捏住并拉扯你的[nipples]。[pg]");
            outputText("突然，你意识到你的左手现在自由了，这多亏了南希阿姨那光滑温柔的手臂。她轻声低语道：[say:也给我一点，求你了。]你完全明白她的意思，将你手上的[skinfurscales]压在她的阴部。它的入口是两片分开的甲壳，滴着湿润的液体，如果你不是这么放松的话，这几乎会让人感到害怕。你温柔地将手指按进她的身体，听到她大声呻吟，感觉到她的手在你" + get_player().vaginaDescript(0) + "和[asshole]里乱抓，抚摸着你的胸部和[ass]，穿过你的[hair]。[pg]");
            outputText("感觉太棒了。你躺下呻吟着，享受着她小穴里光滑如丝的内壁，感觉微小的触须偶尔抚摸并拉扯着你在她体内的手指。[pg]");
            if(get_player().biggestLactation() >= 1)
            {
               outputText("当乳汁慢慢从你的" + get_player().nippleDescript(0) + "中渗出时，蜘蛛女注意到了。她低下头，用柔软可爱的嘴唇含住你" + get_player().allBreastsDescript() + "的顶端，温柔地吮吸着，舌头疯狂地舔弄着你的[nipple]。你呻吟着躺回蛛网上，多种性快感冲击着你的感官，几乎让你无法承受，南希阿姨开始吞咽你的乳汁。[pg]");
            }
         }
         else
         {
            outputText("南希阿姨温柔地俯下身抚摸你的脸颊，她的另外两只手伸出来开始抚摸你的[chest]，而第四只手则探索着你曾经长着生殖器的光滑无肉的区域。[say:真是只漂亮的小苍蝇，]蜘蛛女盯着你的脸低语道，她鲜红的眼睛里充满了渴望。她把脸贴在你的头侧，你顺从地转过头，让她能接触到你的耳朵。她迅速将舌头再次滑入其中，享受着你在她身下颤抖和惊呼的感觉。[pg]");
            outputText("随着你转过头，你突然发现蛛网下方的地板上躺着一根曾经做工精良的假阳具。你看到它已经被磨得像苹果皮一样光滑，而且可能比以前细得多，你突然好奇这位寡妇的性欲到底有多么压抑。[pg]");
            outputText("当南希阿姨的手指触碰到你的下半身时，这些想法被打断了，她抚摸着你的[ass]，然后再次向上移动到你没有生殖器的地方。[pg]");
            outputText("南希阿姨对着眼前的难题微笑着，温柔地用手抚摸着你的[nipples]和[hair]，思考着如何最好地与你做爱。温柔地，她长着白发的头回到了你的[ass]，她长长的舌头再次像蛇一样伸出，在臀瓣之间滑动。当你放松时，它滑入你的体内，刚好让你因为完全放松而产生的近乎性高潮的快感而呻吟。蜘蛛女把舌头从你的肛门里抽出来，这让你很不满，她小心翼翼地在附近的一块布上擦干净，然后把它收回嘴里。接着，她对着你任性的表情笑了笑，把几根手指滑入你现在松弛敏感的[asshole]里。[pg]");
            outputText("南希阿姨爬回你身上，当你因为这受欢迎的新感觉而呻吟时，她舔舐着你的胸部。[say:我打赌你没想到我能做到，]她对你发出满足的呼噜声，而你则享受着作用在你身上的无数种感觉。[pg]");
            outputText("突然，你意识到你的左手现在自由了，这多亏了南希阿姨那光滑温柔的手臂。她轻声低语道：[say:也给我一点，求你了。]你完全明白她的意思，将你手上的[skinfurscales]压在她的阴部。它的入口是两片分开的甲壳，滴着湿润的液体，如果你不是这么放松的话，这几乎会让人感到害怕。你温柔地将手指按进她的身体，听到她大声呻吟，感觉到她的手在你的[asshole]里乱抓，抚摸着你的胸部和[ass]，穿过你的[hair]。[pg]");
            outputText("感觉太棒了。你躺下呻吟着，享受着她小穴里光滑如丝的内壁，感觉微小的触须偶尔抚摸并拉扯着你在她体内的手指。[pg]");
            if(get_player().biggestLactation() >= 1)
            {
               outputText("当乳汁慢慢从你的" + get_player().nippleDescript(0) + "中渗出时，蜘蛛女注意到了。她低下头，用柔软可爱的嘴唇含住你" + get_player().allBreastsDescript() + "的顶端，温柔地吮吸着，舌头疯狂地舔弄着你的[nipple]。你呻吟着躺回蛛网上，多种性快感冲击着你的感官，几乎让你无法承受，南希阿姨开始吞咽你的乳汁。[pg]");
            }
         }
         doNext(auntNancyPoonPartIII);
      }
      
      public function auntNancy(param1:Boolean = true) : Boolean
      {
         if(get_game().time.hours >= 6 && get_game().time.hours <= 14)
         {
            if(param1)
            {
               outputText("[pg]你看到一个相当丰满的女人，留着白色的短发，穿着无领无袖的黑色连衣裙，正用吧台毛巾擦拭着玻璃杯。她让这项工作看起来很简单，更何况她有两对胳膊，包裹在看起来像闪亮的黑色手套里。");
               if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,263) == 0)
               {
                  outputText("她");
               }
               else
               {
                  outputText("南希阿姨");
               }
               outputText("在你进来时抬头看了你一眼，微笑着");
               if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,263) == 0)
               {
                  outputText("，你看到她的额头上还分布着额外的红色眼睛");
               }
               outputText("。");
            }
            return true;
         }
         return false;
      }
   }
}

