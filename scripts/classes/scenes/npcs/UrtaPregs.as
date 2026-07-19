package classes.scenes.npcs
{
   import classes.BreastRow;
   import classes.CoC;
   import classes.Cock;
   import classes.DynStat;
   import classes.Player;
   import classes.PregnancyStore;
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
   
   public class UrtaPregs extends NPCAwareContent implements VaginalPregnancy
   {
      
      public function UrtaPregs()
      {
         if(Boot.skip_constructor)
         {
            return;
         }
         super();
         PregnancyProgression.registerVaginalPregnancyScene(25,21,this);
      }
      
      public function yesUrtaHouseSex() : void
      {
         clearOutput();
         outputText("你向她抛了个媚眼，挑了挑眉。");
         outputText("[pg]乌尔塔回以一个微笑，那笑容仿佛在保证她会好好享受这一切。她掏出酒钱递给你，顺便偷了个香。然后她从座位上站起来；然而，与过去的她不同，她并没有急匆匆地冲向后门。相反，这位重拾自信的双性狐女大摇大摆地走了出去，任由裙下的帐篷高高隆起，走动时还带着几分女性的妩媚扭动着臀部，毫不掩饰她在等你的事实。");
         outputText("[pg]你赶紧结了账，从后门出去，四下张望寻找乌尔塔。乌尔塔正靠在墙上，调皮地冲你咧嘴笑——那正是你第一次发现她双性特征，也是你们成为恋人的起点。[say: 看来有人和我一样迫不及待呢，]她咯咯笑着，裙子上已经沾上了些许淫液。然后她像个文雅的骑士一样向你伸出手臂。[say: 我们走吧？]你挽住她的手臂，跟着她走向她的公寓。");
         outputText("[pg]这段路走得十分艰难；乌尔塔似乎想在每个拐角处都和你亲热一番。");
         if(get_player().get_lib100() > 50)
         {
            outputText("有时你几乎不想等回到公寓，只想当场脱光衣服把她办了……但如果守卫队队长因为在公共场合有伤风化而被罚款，那可不是什么好兆头。");
         }
         outputText("[pg]乌尔塔从钱包里掏出钥匙，松开你的手臂去开门，然后慢悠悠地走了进去，一边走一边还冲你调情地甩了甩尾巴。你迫不及待地跟了进去。");
         if(!urtaLove())
         {
            get_urta().goBackToUrtasForLuvinzII();
         }
         else
         {
            outputText("[pg]");
            get_urta().urtaHomeLuvLuvinsMenu();
         }
      }
      
      public function weirdUrtaCravingsConclusion() : void
      {
         clearOutput();
         outputText("你清楚地感觉到有人在摸你，有什么东西在你的嘴里蠕动……实际上，感觉就像有人在舔你的口腔内部。你睁开眼睛，凝视着乌尔塔绿色的眼眸，她还在继续吻你。她双手捧着你的[face]，闭上眼睛加深了这个吻，然后慢慢松开，睁开眼睛微笑着。[say:早上好，亲爱的；睡得好吗？]她笑道。");
         outputText("[pg]你点点头，然后注意到她");
         if(get_player().cumQ() < 1000)
         {
            outputText("完全干净了。");
         }
         else
         {
            outputText("少了你之前给她弄出的小肚子。");
         }
         outputText("你疑惑地看着她。[say: 我比你先醒，然后去……可以说稍微清理了一下自己，]她回答，耳朵朝着淋浴间的方向抖了抖。");
         outputText("[pg]你对她微笑，然后拉着她再次接吻，将嘴唇贴在她的唇上，用你的");
         if(get_player().tongue.type == 1)
         {
            outputText("分叉的");
         }
         else if(get_player().tongue.type == 2)
         {
            outputText("恶魔般的");
         }
         else if(get_player().tongue.type == 3)
         {
            outputText("龙的");
         }
         outputText("舌头侵入她的口腔。她惊讶地" + (get_noFur() ? "喘息" : "尖叫") + "了一声，然后呻吟着，急切地投入你的怀抱，以同样的热情回吻你。她突然停了下来，看起来很抱歉。[say: 抱歉，[name]，但如果我们继续这样下去，我会想要再来一回合的，而我还有事情要做。]她歉意地拍了拍你的脸，有些笨拙地挪下床，拿起衣服开始穿上。");
         outputText("[pg]你把这当作暗示，也跟着穿好衣服，锁上公寓门后，你们俩分道扬镳。");
         dynStats(DynStat.Lib(-0.5));
         doNext(get_camp().returnToCampUseTwoHours);
      }
      
      public function wakeUpWithUrtaAfterStaying() : void
      {
         clearOutput();
         var _temp_1:* = get_game().time;
         _temp_1.days = _temp_1.days + 1;
         get_game().time.hours = 6;
         statScreenRefresh();
         get_player().orgasm("Generic");
         get_camp().sleepRecovery(false);
         get_player().HPChange(get_player().maxHP(),true);
         awardAchievement("露宿野外",146);
         outputText("当清晨的阳光照在百叶窗上时，你睁开了眼睛。然后你想起了昨天发生的事情。你和乌尔塔度过了一整天，没有做爱，只是散步，给你们刚出生的");
         if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,792) == 1)
         {
            outputText("儿子");
         }
         else
         {
            outputText("女儿");
         }
         outputText("买东西，然后你们回家，花了晚上的大部分时间亲热，当然，这导致了在她的卧室里和这只火辣的狐狸做爱。在那之后……你可能在她的床上睡着了，考虑到目前的情况，她一点也不介意。");
         outputText("[pg]你听到旁边传来轻柔的鼾声，转过头看到乌尔塔像抱一个巨大的泰迪熊一样把你缠住了，急切地依偎在你的温暖中，用鼻子蹭着你的脖颈。然而，这并不完全是纯洁的；乌尔塔的双性特征出卖了她，因为你能感觉到她那根没有包皮、半硬的晨勃正搁在你的肚子上。");
         if(get_player().cor < 33)
         {
            outputText("[pg]你开始轻轻地掰开乌尔塔的手臂，但这毫无用处；这只双性狐狸兽人似乎铁了心要用她那不安分的手臂缠住你，把你抱得越来越紧。眼看没有其他办法，你决定伸手去抓她的肉棒……");
         }
         else if(get_player().cor < 66)
         {
            outputText("[pg]她紧紧地贴着你，你决定搞点恶作剧，伸手去抓她的肉棒……");
         }
         else
         {
            outputText("[pg]这只双性狐狸兽人粘着你有点烦人，所以你调皮地笑了笑，毫不羞耻地伸手去抓她半勃起的肉棒……");
         }
         outputText("[pg]你握住肉棒");
         if(get_player().cor < 50)
         {
            outputText("温柔地，");
         }
         else
         {
            outputText("紧紧地，");
         }
         outputText("惹得");
         if(get_player().cor < 50)
         {
            outputText("呜咽的呻吟");
         }
         else
         {
            outputText("喘息的颤抖");
         }
         outputText("狐狸发出一声，然后开始抚摸她，把她推到一边。狐狸嘟囔着，颤抖了一下，翻身到一边。[say: 嗯……[name]，虽然这感觉不错，但我真的不想刚起床就洗床单，]她用睡意朦胧的声音嘟囔着。");
         outputText("[pg]你向她道了早安，但继续抚摸着她。你的另一只手偷偷摸向她的大腿，抚摸着那" + (get_noFur() ? "光滑的皮肤" : "毛茸茸的肢体") + "。她咯咯地笑着，在床单下摇晃着尾巴，轻轻地蹭着你。[say: 好吧，[name]，既然我们都醒了，你能把旁边桌子上的那个瓶子递给我吗？]她问道。");
         if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,790) == 1)
         {
            outputText("你疑惑地看着她；她正在哺乳，所以不应该喝酒。[say: 哦，别担心；连我早上都不喝酒。这是我自己发明的一点提神饮料；完全不含酒精。主要是果汁，加了一些香料。]乌尔塔笑道。");
         }
         outputText("你唯一的回答就是把手伸到她的蛋蛋后面，轻轻地将一根游移的手指插入她的小穴。");
         outputText("[pg]狐狸轻柔地尖叫着扭动身体，她的阴唇紧紧夹住你入侵的手指。[say: 好了，好了，我起来了，我起来了！]她笑着说。[say: 如果你这么想玩；至少让我喝完早上的饮料，]她抗议道，拍开你游移的双手。");
         outputText("[pg]你对她欢快地笑了笑，最终决定照她说的做，拿来附近的瓶子（它不知怎么地在你们昨晚的翻云覆雨中幸存了下来）递给她。她微笑着从你手中接过，打开它，一口接一口地喝了下去，直到喝光。然后她盖上盖子，优雅地擦了擦嘴唇，轻轻地把它放在床边的地板上，然后给了你一个调皮的微笑。[saystart]怎么？你以为我会打个嗝，然后把它扔到墙上吗？我可是有");
         if(urtaKids() == 1)
         {
            outputText("有一个孩子");
         }
         else
         {
            outputText("孩子们");
         }
         outputText("现在得照顾孩子了；我可不能把碎玻璃留在那儿，对吧？[sayend]她把双手枕在脑后，伸了个懒腰，也许并非巧合地挺出了赤裸的乳房。[say:唔…现在感觉清醒多了。来吧，亲爱的；你明显有兴致，而且昨晚那么美妙……准备好第二轮了吗，嗯？]她低声哼着，扭动着身子坐到你身边，靠在你的肩上。");
         outputText("[pg]你伸了个懒腰，在她唇上轻吻一下，然后立刻下床去找你的[armor]。乌尔塔失望地看着你离开，[say:[name]，你真是个糟糕的挑逗者，]她责备道。然后她轻声笑了笑，[say:不过我想，正因为我这么好色，才让你这么容易得逞吧？]她暗示道，显然很享受在你找衣服时盯着你看的机会。");
         if(get_game().ceraphScene.hasExhibition())
         {
            outputText("[pg]你忍不住为乌尔塔表演一番，你一件件拿起你的[armor]，然后开始用反向脱衣的方式穿起来……挑逗地穿上衣服可比脱掉难得多，更别提还没那么愉快，但你不知怎么就做到了。");
         }
         else
         {
            outputText("[pg]你对乌尔塔笑了笑，开始穿上你的[armor]。你并没有刻意炫耀……但乌尔塔似乎并不介意。从她的反应来看，她似乎同样很享受。");
         }
         outputText("[pg]乌尔塔舔了舔嘴唇，用饥渴的眼神看着你，但还是漫不经心地从床上爬了起来，任由她勃起的肉棒在身前上下晃动。[say: 我真应该让你帮我解决这个……但我想我可以宽容一点；我们都有工作要做。]");
         outputText("[pg]一声尖锐的哭声突然响彻整栋房子，乌尔塔轻笑起来。[saystart]说到工作；是时候喂我们的");
         if(urtaKids() == 1)
         {
            outputText("新的");
         }
         else
         {
            outputText("最新的");
         }
         outputText("小怪物，[sayend]她说着，已经朝婴儿房走去，对穿衣服毫无兴趣。毕竟，宝宝才不会介意她喂奶时不穿裤子呢");
         if(urtaKids() == 1)
         {
            outputText("他");
         }
         else
         {
            outputText("她");
         }
         outputText("。");
         if(urtaKids() == 2)
         {
            outputText("另一个孩子待在埃德琳那里，所以你们俩不用担心要回答……那些复杂的问题。");
         }
         if(urtaKids() > 2)
         {
            outputText("其他孩子待在埃德琳那里，所以你们俩不用担心要回答……那些复杂的问题。");
         }
         outputText("[pg]你决定跟上去，亲自看看宝宝。你到的时候，乌尔塔正站在婴儿床边，哼着轻柔安抚的曲调，小狐狸崽正吮吸着她的一侧乳房，她一边喂奶，一边在怀里轻轻摇晃着她珍贵的婴儿。尽管她双腿间那根硕大的肉棒正在消退，但她看起来完全是一副溺爱孩子的母亲模样。听到你的声音，她抬起头，给了你一个幸福的微笑，然后又满眼欢喜地低头看着继续吃奶的孩子。");
         outputText("[pg]你走到乌尔塔身边，用一只手臂环住她，充满占有欲地将她拉向你，胸中因为在这个世界上建立的这个小家庭而充满自豪。乌尔塔发出一声满足的低吼，毫不掩饰地依偎在你身上，即使怀里抱着孩子，也很高兴能待在你的臂弯里。");
         outputText("[pg]乌尔塔的乳房看起来肿胀得厉害……你猜她的奶水比宝宝需要的要多得多。也许你可以自己尝尝？");
         menu();
         addButton(0,"喝奶",drinkSomeUrtaPostBirthTitMilk);
         addButton(14,"离开",noNeedForTitMilkTodayUrta);
      }
      
      public function visitTheHouse() : void
      {
         var _g:UrtaPregs;
         var _loc1_:* = null as IMap;
         clearOutput();
         outputText("你顺着街道轻松地找到了乌尔塔的新家，很快就站在了门前。你掏出钥匙，打开门，走了进去。乌尔塔的房子里面相当宽敞，虽然有点平淡；颜色朴素中性，家具也不多；你感觉乌尔塔只是买了房子需要的东西，把旧东西留在了公寓里。不过，周围还是有不少小摆设和生活气息，给人一种舒适、温馨的感觉。");
         outputText("[pg]环顾四周，你可以很容易地看到一个客厅、一个厨房和几个房间，你估计其中至少有一个是你孩子");
         if(urtaKids() > 1)
         {
            outputText("们");
         }
         outputText("的育儿室。一扇门通向后院，而另一扇门看起来像是通向地下室的楼梯。");
         outputText("[pg]你听到厨房里传来流水声，片刻之后声音停止了，莉安娜从厨房里走了出来。");
         if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,809) == 0)
         {
            _loc1_ = KFLAGS.flags;
            FlagDict_Impl_.arrayWriteInt(_loc1_,809,FlagDict_Impl_.arrayReadInt(_loc1_,809) + 1);
            outputText("[pg]现在你有了机会，你仔细打量着乌尔塔新雇的住家保姆。莉安娜是一个看起来很健康的年轻" + (get_noFur() ? "女人" : "兽人") + "，一个臭鼬" + (get_noFur() ? "女孩，有着一条毛茸茸的黑白相间的尾巴。" : "形态的兽人，全身覆盖着光滑闪亮的黑色皮毛，毛茸茸的尾巴上点缀着白色。") + " 她的头发是纯黑色的，夹杂着白色的条纹，扎成一个短马尾辫，绿色的眼睛在鼻梁上的银边圆眼镜后闪闪发光。她穿着一件保守的短袖衬衫，裤子虽然有点宽松，但仍然能展现出她漂亮的双腿。裤子很紧，你可以看出她是个十足的女孩；这里没有隐藏的惊喜。她没有穿鞋，露出了她" + (get_noFur() ? "" : "爪子一样的") + "脚。她有一个非常圆润、丰满的臀部，以及充满女人味的臀部；上半身也同样丰满，E罩杯的乳房让她比她的雇主还要丰满，尽管她试图用她的穿着风格来掩饰它们。");
            outputText("[pg][say: 嗨，是[name]吗？] 她用毛巾擦干手，然后把它扔在厨房柜台上，向你伸出一只纤细的手。你热情地和她握手，并确认她记住了你的名字。");
            outputText("[pg][say: 很高兴终于能好好认识你了。不过我想还是先做个更好的自我介绍吧……] 她扶了扶眼镜，清了清嗓子，整理了一下衬衫。[say: 我是莉安娜，乌尔塔的住家保姆。我也做饭和打扫卫生，因为她太忙了，而且我还在学习炼金术。我的目标是有一天开一家自己的店，并进一步开展我的研究。] 你注意到，这是一段相当令人印象深刻的演讲。");
            outputText("[pg][say: 现在关于我想和你谈谈的那件事，[name]……]");
            if(get_player().get_race() == "human")
            {
               outputText("[pg][say: 我注意到你是一个人类。] 你确实是——你生来如此，你注意到。");
            }
            else
            {
               outputText("[pg]她抽动了一下鼻子。[say: 你闻起来像个人类，但你不是人类……？] 你觉得解释一下也无妨，于是告诉她你来到玛瑞斯之前是人类，但因为这片土地上到处都是魔法物品而放弃了人类的身份。她恍然大悟地点了点头。");
            }
            outputText("[pg]你问她找你有什么事。");
            outputText("[pg][say: 我正在做一些关于人类的研究，你介意有空帮我一下吗？]她有什么打算？[say: 我希望你能给我提供一些样本，让我研究你的基因组成。]……那需要什么……？");
            outputText("[pg]她移开视线，摸着下巴思考了一会儿。最后，她耸了耸肩，直视着你的眼睛。[say: 我需要一些人类的精液和卵子样本，] 她直截了当地说。");
            outputText("[pg]……你发现，事情似乎总是会回到性上面。好吧，你没有给出明确的答复，但你告诉她，你会考虑这个提议的。");
            outputText("[pg][say: 谢谢你……我不会强迫你做任何事，也不想勉强你，但如果你能帮我进行研究，我将不胜感激。] 她微笑着说。");
            outputText("[pg]她再次推了推眼镜。[say: 那么……你找我有什么事？]");
         }
         else
         {
            outputText("[pg][say: 嘿，[name]。] 莉安娜从厨房出来，擦干手，把毛巾扔在厨房台面上，向你打招呼。你向这位性感的臭鼬娘问好。");
            outputText("[pg][say: 那么……你今天找我有什么事？]");
         }
         menu();
         addButton(0,"外貌",liannasAppearance);
         _g = this;
         addButton(1,"交谈",function():void
         {
            _g.talkToLiana();
         });
         addButton(2,"性爱",sexWithLianna);
         addButton(4,"孩子",pickKidSceneHere);
         addButton(14,"返回",get_telAdre().telAdreMenu);
      }
      
      public function visitKidsFirstTime() : void
      {
         clearOutput();
         outputText("你问乌尔塔是否能带你去看看你的孩子");
         if(urtaKids() > 1)
         {
            outputText("们");
         }
         outputText("。");
         outputText("[pg][saystart]你想看看");
         if(urtaKids() == 1)
         {
            outputText("我们的孩子");
         }
         else
         {
            outputText("我们的宝宝们");
         }
         outputText("？[sayend]乌尔塔问道，一想到这个，她的尾巴就兴奋地摇摆起来。[say: 哎呀，当然了，[name]——" + urtaKidsText("他","她","他们") + "看到" + urtaKidsText("他的","她的","他们的") + "" + get_player().mf("父亲","另一个母亲") + "会很高兴的！来吧，我们走！]她坚持道，立刻从座位上站了起来");
         if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,13) == 0)
         {
            outputText("，勃起的阴茎已经缩小了，因为她在为人父母的自豪感中忘记了发情");
         }
         outputText("。你毫不犹豫地跟上了她；事实上，她兴奋地想去看看她的后代，似乎很容易把你抛在脑后。");
         outputText("[pg]你注意到乌尔塔没有带你走平常的路线，于是问她为什么要改变路线。[say: 我没提过吗？]她反问道，然后露出歉意的表情。[say: 抱歉，我一定是忘了。我想既然我们要建立自己的家庭，我们就需要一个比我旧公寓更好的地方。我希望我们的孩子有足够的空间玩耍。]");
         outputText("[pg]又走了几步后，她觉得有必要插句话：[say: 但我仍然保留着我的旧公寓。以防我们需要一些隐私。总不能让孩子们打扰我们，对吧？]她问道，给了你一个调情的眨眼；母性似乎给这只双性狐狸带来了新的大胆！");
         outputText("[pg]乌尔塔的新家是一座大小适中、看起来很舒适的平房，位于特尔阿德雷一个较好的街区。这里没有空房子，所有的房子虽然明显受到了在干旱沙漠中建造的现实影响，但都维护得很好，干净整洁。当你走近时，你赞叹着乌尔塔那破旧的旧公寓的升级；它实际上相当大，特别是与她以前住的地方相比，你可以隐约看到后面有一个院子。");
         outputText("[pg][say: 莉安娜！我回来了！]当你们俩走近门口时，乌尔塔喊道。门开了，一个身材丰满但穿着保守的黑发女性臭鼬兽人出现在视线中。");
         outputText("[pg][say: 欢迎回家，女士，]她礼貌地说，然后转过头来打量你。[say: " + get_player().mf("先生","女士") + "？]你迅速报上自己的名字，伸出手准备握手。那个臭鼬女……莉安娜，抓住你的手，给了你一个有力的握手。[say: 久仰大名，[name]。很高兴终于见到你本人了。]她的眼睛一直在你的身体上游移。乌尔塔咳嗽了一声。意识到自己挡住了门口，莉安娜迅速让开，让你进去。[say: 抱歉……]");
         outputText("[pg][say: [name]，这位是莉安娜。]臭鼬女举起一只手。[say: 我雇她住在这里照看我们的孩子，因为我们俩都不能一直陪在他们身边。]乌尔塔解释道。");
         outputText("[pg][say: 我该走了，但在那之前，[name]？]你转头看着她，想知道她要干什么。[say: 如果你以后有时间来找我谈谈，我会很感激的，我有一些事情想和你讨论。]母臭鼬说完，便走进了一个房间（大概是她的房间）。");
         outputText("[pg]你走进去四处看了看，打量着乌尔塔新家的入口。从这里看，乌尔塔的房子相当宽敞，虽然有点平淡；墙壁和天花板的颜色朴素而中性，家具也不多；你感觉乌尔塔只买了房子需要的东西，把旧东西留在了公寓里。不过，周围还是有足够的小摆设和生活气息，给人一种舒适温馨的感觉。");
         outputText("[pg]环顾四周，你可以很容易地看到一个客厅、一个厨房和几个房间，你估计其中至少有一个是你");
         if(urtaKids() == 1)
         {
            outputText("孩子");
         }
         else
         {
            outputText("孩子们");
         }
         outputText("的育儿室。一扇门通向后院，而另一扇门看起来像是通向地下室的楼梯。");
         outputText("[pg][say: 那么，你觉得怎么样，[name]？我觉得挺划算的，特别是考虑到我付的价格……我很高兴议会给了我那笔奖金作为奖励，否则我不确定我能不能买得起。] 她说道，显然希望你能认可这个新家。");
         outputText("[pg]虽然装饰有点少，但除此之外，它非常令人印象深刻，而且绝对舒适。即使乌尔塔说她买得很划算，这也一定花了一大笔钱。你告诉她房子很好，你当然认可，但你必须问……这个地方到底花了多少钱？狐狸环顾四周，然后走到你身边，悄悄地在你耳边低语了那个数字。你差点从你的[armor]里跳出来。这就是划算的价格？");
         outputText("[pg][say: 是的。] 她漫不经心地回答。你想知道乌尔塔到底有多有钱…… [say: 现在，来吧，楼上还有更多可看的。] 她微笑着，坚持地拉着你的手臂，努力引导你上楼，最终让你跟着她。首先，她给你看了一个空房间，[say: 我还没决定我们用这个房间做什么；也许可以做书房？但是这个……啊，这里是我的房间，] 她自豪地打开了一扇门，房间里有一张舒适的大床——地板上还有多个排水管的微妙迹象。[say: 等你搬进来，这也是你的房间，] 她高兴地说道。");
         outputText("[pg]你有点想问排水管是干什么用的……但你感觉你已经知道了。不管怎样，你握住乌尔塔的手，告诉她你必须和她认真谈谈。[say: 我希望如此，] 她回答道，试图听起来轻松一点。你解释说你现在不能和她住在一起。乌尔塔看起来惊呆了，[say: 什么？为、为什么不？我们要组建一个家庭，你为什么不想和我们在一起？] 她困惑而沮丧地问道。你邀请她和你一起坐在床上。你详细解释了为什么你现在不能搬进来。听到这里，她叹了口气，点了点头。[say: 我能理解你的责任，我也尊重它，我只是个人觉得很困惑，为什么你必须住在荒郊野外来履行它。但我理解……不过，记住我的房子就是你的，只要你想，随时都可以，] 她告诉你，然后偷吻了你一下。");
         outputText("[pg]你回吻了她，很快让这个吻变得更加热烈。伴随着一声愉悦的呻吟，她用双臂环抱住你，将你拉近，饥渴地亲吻着你；你感觉无论你这样做多少次，她都不会减少惊讶——或者渴望沉浸其中。你结束了亲吻，气喘吁吁，而且有点兴奋，这并没有逃过狐狸的眼睛。[say: 你这个小妖精……看起来你想试试我的新床，不是吗？] 她咯咯地笑着，捏了捏你的脸颊。[say: 抱歉，我现在有事要做……给；确保你不要弄丢这个——这是你这栋房子门锁的备用钥匙，] 她说着，递给你一把小铁钥匙。");
         outputText("[pg]你把钥匙放进口袋，继续忙你的事。");
         outputText("[pg]<b>你获得了关键物品：乌尔塔家的备用钥匙（在特尔阿德雷的“家”菜单中使用。）</b>");
         get_player().createKeyItem("Spare Key to Urta\'s House",0,0,0,0);
         doNext(get_camp().returnToCampUseOneHour);
      }
      
      public function vaginalBirth() : void
      {
         var _loc2_:* = null as IMap;
         outputText("[pg]");
         FlagDict_Impl_.arrayWriteInt(KFLAGS.flags,802,0);
         FlagDict_Impl_.arrayWriteInt(KFLAGS.flags,810,0);
         if(int(get_player().vaginas.length) == 0)
         {
            outputText("你感觉到腹股沟有一股可怕的压力……接着是伴随着血肉撕裂的剧痛。你低头一看，发现了一个阴道。");
            get_player().createVagina();
         }
         outputText("你痛得弯下腰，感觉到一股液体从你的[pussy]里涌出。看来你的羊水破了。你回想起曾向乌尔塔保证过在真正分娩前会去医院，但现在你无能为力。太疼了，你知道你来不及赶到那里了，所以你冲向你的[cabin]，躺在你的[bed]上，默默祈祷乌尔塔会顺道过来帮你。");
         if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,791) == 0)
         {
            outputText("[pg][say: [name]？哦，我就知道会发生这种事！] 乌尔塔突然从灌木丛中钻出来，跑到你身边喊道。好吧，看来她那点跟踪的小习惯对你们俩来说要派上用场了……哦不，是对你们三个来说：你、她和宝宝。");
         }
         else
         {
            outputText("[pg][say: 你的时机把握得也太差了吧，不是吗，[name]？我发誓，你怎么老是认不出这些迹象，真是让我搞不懂……] 乌尔塔一边从灌木丛里跑出来一边说道，这让你非常感激。");
         }
         outputText("[pg]当她冲到你身边时，你对她笑了笑，一边呻吟着一边努力平复呼吸并脱下你的[armor]。[say: 别担心，[name]，我在这里陪着你们俩，] 这只心不在焉的狐狸告诉你，同时尽力帮你脱衣服。");
         outputText("[pg]感激她的帮助，你让自己躺在铺盖卷上，试图放松一下。一阵轻微的刺痛从你扩张的产道传来，乌尔塔注意到了这一点，迅速抓住了你的手。[say: 抓紧我；你很坚强，你会挺过去的，] 她向你保证。");
         outputText("[pg]你越来越用力，始终注意保持正确的呼吸节奏，直到伴随着最后一次用力与呻吟，乌尔塔惊呼道：[say: 看到头了，[name]！就是这样，继续用力——马上就出来了！]");
         outputText("[pg]伴随着最后几声呻吟和一声高亢的啼哭，一切都结束了；你生下来了。终于卸下了重担，你瘫倒在铺盖上，经历过这场磨难后大汗淋漓、气喘吁吁。[say: 你真坚强，[name]；你做得很好，做得太棒了……现在，让我们看看是个什么小家伙……？]");
         var _loc1_:int = Utils.rand(3) + 1;
         if(_loc1_ == 1)
         {
            outputText("[pg]乌尔塔开心地对你微笑着。[say: 猜猜看？是个完全正常、健康的小男孩，]她说着，骄傲地把啼哭的婴儿展示给你看。他长着一个小小的");
            if(Utils.rand(2) == 0)
            {
               outputText("狐狸");
               FlagDict_Impl_.arrayWriteInt(KFLAGS.flags,798,2);
            }
            else
            {
               outputText("马");
               FlagDict_Impl_.arrayWriteInt(KFLAGS.flags,798,1);
            }
            outputText("包皮，长在双腿之间，看起来等他长大后会比一般人的更大。");
            _loc2_ = KFLAGS.flags;
            FlagDict_Impl_.arrayWriteInt(_loc2_,792,FlagDict_Impl_.arrayReadInt(_loc2_,792) + 1);
            FlagDict_Impl_.arrayWriteInt(KFLAGS.flags,797,1);
         }
         else if(_loc1_ == 2)
         {
            outputText("[pg]乌尔塔高兴地叫出声来，骄傲地咧嘴笑着。[say: 噢，你真漂亮……[name]，是个女孩！一个完美、奇妙、正常的小女孩，]她说着，在你面前炫耀着这个新生儿。");
            _loc2_ = KFLAGS.flags;
            FlagDict_Impl_.arrayWriteInt(_loc2_,793,FlagDict_Impl_.arrayReadInt(_loc2_,793) + 1);
            FlagDict_Impl_.arrayWriteInt(KFLAGS.flags,797,2);
         }
         else
         {
            outputText("[pg]乌尔塔沉默了几个令人神经紧绷的瞬间，脸上露出悲伤的表情。她强忍住抽泣，将婴儿紧紧抱在胸前。[say: 噢，我的小天使……乌尔塔妈妈会永远爱你的。真的很抱歉……[name]？她长得像她爸爸（还有她的另一个妈妈）。]她羞涩地向你展示，你生下的婴儿是个双性人。她长着一个小小的");
            if(Utils.rand(2) == 0)
            {
               outputText("狐狸");
               FlagDict_Impl_.arrayWriteInt(KFLAGS.flags,798,2);
            }
            else
            {
               outputText("马");
               FlagDict_Impl_.arrayWriteInt(KFLAGS.flags,798,1);
            }
            outputText("包皮，长在双腿之间，看起来等她长大后会比一般人的更大。");
            _loc2_ = KFLAGS.flags;
            FlagDict_Impl_.arrayWriteInt(_loc2_,794,FlagDict_Impl_.arrayReadInt(_loc2_,794) + 1);
            FlagDict_Impl_.arrayWriteInt(KFLAGS.flags,797,3);
         }
         outputText("[pg]你疲惫地对着这对“父”子笑了笑，然后躺下恢复体力。乌尔塔一手握住你的手，紧紧抱着婴儿——事实上，她几乎不愿让你抱抱你亲生的骨肉，直到你提醒她你也想抱抱孩子。不过，婴儿最终还是睡着了，乌尔塔紧张地看了你一眼。[saystart]对不起，[name]，但我就是不能把");
         if(_loc1_ >= 2)
         {
            outputText("她");
         }
         else
         {
            outputText("他");
         }
         outputText("留在这里。我知道你不会让");
         if(_loc1_ >= 2)
         {
            outputText("她");
         }
         else
         {
            outputText("他");
         }
         outputText("遇到任何危险，但是，嗯，你真的没法好好照顾");
         if(_loc1_ >= 2)
         {
            outputText("她");
         }
         else
         {
            outputText("他");
         }
         outputText("毕竟在这荒郊野外，你也没法好好照顾孩子，对吧？[sayend]");
         outputText("[pg]你最终被迫承认，如果");
         if(_loc1_ >= 2)
         {
            outputText("她");
         }
         else
         {
            outputText("他");
         }
         outputText("在特尔阿德雷长大。乌尔塔感激地笑了笑，给了你们俩一个特别热切的拥抱。[saystart]谢谢你的理解，[name]。");
         if(_loc1_ >= 2)
         {
            outputText("她");
         }
         else
         {
            outputText("他");
         }
         outputText("我保证，孩子会安全长大的。[sayend]说完，她小心翼翼地把熟睡的孩子裹好，悄悄地消失在荒野中，留下你一个人去床上好好休息。[pg]");
         _loc2_ = KFLAGS.flags;
         FlagDict_Impl_.arrayWriteInt(_loc2_,791,FlagDict_Impl_.arrayReadInt(_loc2_,791) + 1);
         if(urtaKids() == 1)
         {
            FlagDict_Impl_.arrayWriteInt(KFLAGS.flags,795,FlagDict_Impl_.arrayReadInt(KFLAGS.flags,797));
            FlagDict_Impl_.arrayWriteInt(KFLAGS.flags,796,FlagDict_Impl_.arrayReadInt(KFLAGS.flags,798));
         }
      }
      
      public function urtaSpecialDeliveries() : void
      {
         clearOutput();
         spriteSelect(SpriteDb.get_s_urta());
         outputText("当你穿过大门时，埃德琳向你走来，她的臂弯里挂着一个小篮子");
         if(get_game().telAdre.edryn.pregnancy.get_isPregnant())
         {
            outputText("，她怀孕的肚子随着动作晃动着");
         }
         outputText("，脸上带着淡淡的微笑。[say: 嘿，[name]；你能帮我个忙吗？乌尔塔一直在收快递，但我接到了一个意外的电话，所以我今天太忙了，没法把她的杂货送给她——你是她的[boyfriend]；你能帮我把这个带给她吗？]半人马娘问道。");
         outputText("[pg]考虑到这应该不会花你太长时间，而且乌尔塔很可能会感激你的举动，你同意了，她带着相当会意的微笑把篮子递给了你。然后她飞奔而去，");
         if(get_game().telAdre.edryn.pregnancy.get_isPregnant())
         {
            outputText("至少是以一匹怀孕母马所能达到的最快速度，");
         }
         outputText("留下你独自前往乌尔塔的家。");
         outputText("[pg]你沿着熟悉的道路前往乌尔塔的新家。一路上你还在想她是否会在家；通常她都在外面，只有莉安娜和孩子们在。到达后，你敲了敲门并等待着。莉安娜打开了门。[say: 你好 [name]，进来吧。] 她让到一边让你进去。");
         outputText("[pg]进去后，你递上埃德琳给你的篮子。[say: 谢谢。乌尔塔正在她的房间里休息，如果你想去看看她的话。现在请原谅，我需要把这些东西收起来。] 她接过篮子，走向厨房。你决定去看看乌尔塔，看看她过得怎么样，这总没坏处。");
         outputText("[pg]你上了楼，轻轻转动她房间门的把手。这位");
         if(get_pregnancy().get_event() >= 7)
         {
            outputText("大腹便便的");
         }
         outputText("怀孕狐女正发出轻柔的鼾声，侧躺在被子下，在柔软蓬松的被子里隆起一个相当大的包，被子几乎把她整个人都包裹了起来，在那些为了让她睡得舒服而垫着的大而丰满的靠垫中，几乎看不见她的身影。");
         outputText("[pg]你悄悄地走进去，小心翼翼地不打扰熟睡的狐女，但你才走了几步。乌尔塔露在外面的耳朵突然快速地抖动了一下，她哼了一声，不情愿地从被窝里动了动，大声打着哈欠，挣扎着把她怀孕的身躯撑起来。[say: 试得不错，亲爱的，但你逃不过我的耳朵……也逃不过我的鼻子，] 她对你咧嘴一笑。[say: 那么，是什么风把你吹来了？]");
         outputText("[pg]你解释说你顺路来帮埃德琳送东西，决定顺便来看看她。");
         outputText("[pg][say: 是吗？哎呀，你真体贴；我们俩都很好，从我的体型你就能看出来，] 她咯咯笑着，拍了拍自己的肚子。[say: 我刚巡逻回来，你看；我只是觉得有点累，仅此而已。] 你走近她，坐在她身边，抚摸着她的肚子。她发出一声感激的轻哼，一只手轻轻地放在你的手上，享受着你的抚摸。[say: 嗯……我想我们俩都喜欢你这么做，] 她告诉你。你继续抚摸了一会儿，直到乌尔塔打了个哈欠。[say: 尽管我很高兴见到你，亲爱的，但我真的需要睡觉了，] 她歉意地说，然后把她肿胀的身躯重新依偎在床上，把床单拉到下巴处。");
         outputText("[pg]你抚摸着她的手臂，告诉她好好休息。你起身关上乌尔塔房间的门，回到特尔阿德雷的主街，一路上向莉安娜道别。");
         FlagDict_Impl_.arrayWriteInt(KFLAGS.flags,802,1);
         menu();
         addButton(0,"继续",get_telAdre().telAdreMenu);
      }
      
      public function urtaSexMenu() : void
      {
         var _loc1_:Function = null;
         if(get_player().hasCockThatFits(get_urta().urtaCapacity()) || get_player().hasKeyItem("Deluxe Dildo"))
         {
            _loc1_ = get_urta().spankTheShitOutOfUrtaAndMakeHerCreamHerselfFromProstateStimulationAloneLikeTheHornyDrunkenSlutSheReallyIs;
         }
         if(!get_urta().urtaDrunk())
         {
            if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,30) == 1)
            {
               menu();
               addButton(0,"去她家",get_urta().goBackToUrtasForLuvinz);
               if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,782) >= 5)
               {
                  addButton(1,"口交",get_urta().slurpFawkesCocksForFunAndInflation);
               }
               else
               {
                  addButton(1,"口交",get_urta().blowUrtaUnderTheTableLuv);
               }
               addButton(2,"舔阴",get_urta().eatUrtaOutNomNomPussy);
               addButton(14,"离开",get_telAdre().barTelAdre);
            }
            else
            {
               menu();
               if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,782) >= 5)
               {
                  addButton(0,"隐藏口交",get_urta().slurpFawkesCocksForFunAndInflation);
               }
               else
               {
                  addButton(0,"隐藏口交",get_urta().blowUrtaUnderTable);
               }
               addButton(1,"乌尔塔家",get_urta().goBackToUrtasForLuvinz);
               addButton(14,"离开",get_telAdre().barTelAdre);
            }
         }
         else
         {
            menu();
            addButton(0,"手淫",get_urta().getAPublicFacialFromUrta);
            addButton(1,"骑乘后庭",get_urta().takeUrtaInTheButtPublically);
            if(get_player().canOviposit())
            {
               addButton(2,"产卵",get_urta().giveTheFoxSomeEggs);
            }
            addButton(3,"打她屁股",_loc1_);
            if(get_raphael().finaleCovered() && raphaelLikes() && FlagDict_Impl_.arrayReadInt(KFLAGS.flags,783) == 0)
            {
               addButton(8,"惊喜三人行",get_urta().urtaAndRaphaelSurprise);
            }
            addButton(14,"离开",get_telAdre().barTelAdre);
         }
      }
      
      public function urtaRaepsJoo() : void
      {
         clearOutput();
         outputText("你看着乌尔塔，告诉她你只是去吧台拿点东西。她艰难地咽了口唾沫，点了点头，因为你没有明确拒绝，她满怀期待地舔了舔嘴唇。你站起身，尽力以最性感的方式扭动你的[butt]，回头看了乌尔塔一眼，嘴角挂着微笑。怀孕的双性兽人正带着赤裸裸的饥渴看着你离去，前列腺液从她肥大的马具上滴落，滴入下方已经晃荡作响的桶中，发出清晰可闻的声音。她紧张地抽搐着，似乎在认真考虑——并抗拒着——把你扑倒，就在此时此地占有你的想法。");
         outputText("[pg]一到酒吧，你就让酒保给你调点好东西来麻痹痛苦；如果事情真的如你所料，你会需要它的。酒保点点头，带着同情的目光，递给你一大杯淡蓝色的液体，散发着甜美的草药香味。你端起酒杯，和乌尔塔坐在一起，慢慢地抿着。[say: 那么……你打算帮我吗？]乌尔塔恳求道，她把眼睛睁得尽可能大，装出一副无辜的样子看着你，这与她那毫不掩饰的饥渴神态形成了强烈的对比。");
         outputText("[pg]你喝完酒，然后逗她说，她得先抓住你才行。说完，你立刻起身，冲向后面一个隐蔽的房间。[say: 什么？！为什么，你——你给我回来，你这个磨人的小妖精！哎哟！]乌尔塔在你身后大喊——听起来她可不觉得好笑。你身后回荡着几句非常大声的脏话，接着是踢翻半桶水的声音，这让她骂得更难听了。不过，她显然已经站稳了脚跟，越过了那滩滑溜溜的精液，现在正紧紧地追着你。");
         outputText("[pg]你找到一个空房间，猛地冲进去，锁上门栓，希望能借此拖延乌尔塔足够长的时间，至少让你能脱掉衣服。门上回荡着巨大的砰砰声，乌尔塔用双拳猛砸，门明显在颤抖。[say: 你这个磨人的小妖精！你别想溜走，别想在给了我虚假的希望之后就把我丢在这里！哦，等我抓住你……！]她停止了用手捶门，转而用肩膀撞门；显然，这只狐狸比她看起来要强壮得多，因为她直接把门从铰链上撞飞了！她堵在门口，低着头，张着嘴，因为欲火焚身而流着口水，让你不安地想起了一只疯狗，她的大腿上沾满了女性做爱前分泌的润滑液，肉棒像长矛一样挺立在她身前。");
         outputText("[pg]你咽了口唾沫，还在试图脱掉你的[armor]的上半部分。[say: 现在轮到我玩了，亲爱的……]乌尔塔责备道，然后自己也脱光了衣服——裙子毫不费力地脱了下来，因为它只是由一个松散的侧扣固定着，她轻松地把衬衫从头上脱下来，赤裸裸地站在你面前，展现出她那" + (get_noFur() ? "" : "毛茸茸的、") + "怀孕的、勃起的雄风。伴随着一声欢快的" + (get_noFur() ? "大叫" : "尖叫") + "，她突然向你冲来，将你牢牢地扑倒在地，并把你翻滚过来，让你基本上是趴着，屁股撅在半空中。当你感觉到她那粗大的肉棒在你的[butt]上摩擦，把湿润的淫液像黏液一样涂抹在你的下半身时，你开始怀疑这个怀孕的双性人到底在打什么主意。");
         outputText("[pg]你告诉她控制一下自己，她这样什么也做不成。如果她想做点什么，首先，她至少可以让你脱衣服。乌尔塔咆哮着，收紧了抓住你上臂的手，把她的乳房和鼓起的肚子压在你的背上。[say: 然后让你再有机会试着从我身边逃走？没门！]她突然咬了你的后颈一口，虽然不足以真正伤害你，但绝对足以让你意识到她刚才做了什么。" + get_player().clothedOrNakedLower("[say: 再说了，我只需要把你这些内衣脱掉就行了……]"));
         outputText("[pg]" + get_player().clothedOrNaked("还没等你抗议，她就袭击了你下半身的衣服，为了露出你的臀部，她简直是把衣服撕成了碎片。" + (get_player().get_lowerGarmentName() != "nothing" ? "你能感觉到她用牙齿撕扯你的内衣，还能清楚地听到她像狗咬老鼠一样在嘴里疯狂地咆哮和摇晃它，然后才不屑地把它吐掉。" : "")) + " [say: 哦……对。]她轻声哼唱着，用她那灵活柔软的手指抚摸着你[butt]的每一寸曲线。[say: 你的屁股真性感。]她告诉你，把她的肚子在你的屁股上摩擦，一直摩擦到你的后腰，这样她就可以把她那马一样粗大的肉棒抵在你的[asshole]上。她在你身上摩擦和抽插，粗鲁地用她那双性肉棒流出的大量淫液为你润滑。最后，她认为你已经足够湿润了，便调整了肉棒的位置，让它紧紧地压在你的后庭上……");
         outputText("[pg][say: 你准备好了吗，孩子他爸？]她在你耳边淫荡地呻吟着。然后，你确信她带着邪恶的笑容，自己回答了自己。[say: 没关系，因为我肯定准备好了！]说完，她立刻把肿胀的肉棒插了进去，一次猛烈的抽插就直接插到了底！");
         get_player().buttChange(60,true,true,false);
         outputText("[pg]当乌尔塔的肉棒深深地插入你的屁股时，你在快乐和痛苦中尖叫起来。幸好你之前喝了那杯酒。你被前后摇晃着，因为这个双性狐狸兽人甚至懒得等你准备好，就开始狠狠地操你。乌尔塔呻吟着，因为她那肿胀的腹部而显得有些笨拙，她在你体内抽插着，急切地干着你的屁股，仿佛想用她的肉棒把你埋进地板里。[say: 哦……太爽了，太热了！要……！]她高潮时大叫起来；如果她这么早就射精了，看来她<i>真的</i>很需要释放。当你感觉到一股液体涌入你的后庭时，你呻吟了一声，乌尔塔刚刚因为操你而达到了高潮。滚烫的液体在你的肠道里咕噜作响，把它们塞满了她现在充满活力的双性精液，当她终于伴随着狂喜的呻吟结束时，你的肚子变得有点鼓鼓的。");
         outputText("[pg]怀孕的母狐狸松了一口气，依偎在你身上。[say: 真是太爽了，亲爱的……但是，你知道吗？我觉得我还是超级饥渴……]她用一种唱歌般的语调告诉你。她不需要告诉你，因为她的肉棒仍然牢牢地插在你的屁股里，你能感觉到它坚硬而挺拔，因为渴望而跳动着。你试图向前移动，好让她从你体内拔出来，但乌尔塔的手迅速抓住了你的臀部，挡住了你的去路。[say: 呃-呃-呃，亲爱的。你至少要为此负部分责任，所以你要帮我……]她在你耳边挑逗地吹着气，然后又开始操你的屁股；不再像第一次那样被荷尔蒙吞噬，她现在的抽插缓慢而慵懒，每一次向后拉扯和向内推进都显得漫长而温柔，几乎带着挑逗的意味，她的手搭在你的脖子上，玩弄着你的[nipples]，她肿胀的肚子靠在你的背上作为支撑。");
         outputText("[pg]随着她的抽插，你能感觉到快感在你体内不断积聚。");
         if(get_player().hasCock())
         {
            outputText("每次她肿胀的龟头摩擦你的前列腺时，你都会感觉到有几滴前列腺液从你扩张的马眼里渗出。");
         }
         if(get_player().hasVagina())
         {
            outputText("她的蛋蛋每次拍打在你的[vagina]上，都会带来一阵阵电流般的快感，传遍你的全身。");
         }
         outputText("你大声呻吟着，这清楚地表明你很享受这种待遇。[say: 看吧？我就知道你也会喜欢的，现在我没那么紧张了……] 她拉长了最后一个字的尾音，同时在你体内进行了一次特别深的抽插。[say: 嗯……我能感觉到你性感的屁股在挤压我的肉棒；你很享受，对吧？]");
         outputText("[pg]她突然咯咯地笑了起来，你意识到你能感觉到一种奇怪的感觉——一种轻微的、扑腾的感觉，从紧贴着你背部的隆起腹部传来。[say: 它在踢呢——不知道它能不能感觉到妈妈有多享受对爸爸做这种事？] 她笑着说。[say: 这难道不是一种奇怪又变态的情况吗？我，一个孕妇，正用我自己的大马屌操着我孩子的父亲！这让你兴奋吗，亲爱的？因为我不知道这到底是让我兴奋还是让我觉得奇怪，] 她坦白道。");
         outputText("[pg]你唯一的回答就是呻吟，并用你的屁股夹紧她的肉棒。");
         if(get_player().cockTotal() > 0)
         {
            if(get_player().cockTotal() > 1)
            {
               outputText("[EachCock]同时绷紧");
            }
            else
            {
               outputText("[EachCock]跳动着，绷紧准备着");
            }
            if(get_player().cumQ() < 250)
            {
               outputText("你射在了地板上，射出一股又一股的精液，在你站立的地方形成了一个小水坑。这无疑证明了你对这种变态行为的享受，无论多么微小。");
            }
            else if(get_player().cumQ() < 1000)
            {
               outputText("你直接把精液射在了地板上。一股又一股的精液飞溅在上面，你别无选择，只能继续呻吟着射精，因为乌尔塔仍然紧紧地插在你的深处，现在你把她的肉棒夹得这么紧，她已经无法动弹了。当你射完的时候，你形成的水坑已经大到你可以在倒影中看到自己的脸，沉醉在乌尔塔的马屌带来的快感和享受中。");
            }
            else
            {
               outputText("你让你那惊人的精液冲破了");
               if(get_player().balls > 0)
               {
                  outputText("翻滚的蛋蛋");
               }
               else
               {
                  outputText("身体");
               }
               outputText("的束缚，以极大的力量溅在地板上，在迅速扩大的淫乱之湖中形成了名副其实的欢乐之流。这种变态行为带来的快感，加上你之前喝的饮料，确保你在这短暂的时刻只感到终极的幸福。当你射出最后一滴时，湖水已经没过了乌尔塔的膝盖，你同情那个负责打扫后室的可怜人。");
            }
         }
         if(get_player().hasVagina())
         {
            outputText("[pg]你的小穴什么也没夹住，");
            if(get_player().wetness() >= 4)
            {
               outputText("喷出");
            }
            else
            {
               outputText("渗出");
            }
            outputText("的淫液涂满了乌尔塔的蛋蛋，它们正紧紧地贴在你的[vagina]上。溢出的淫液顺着乌尔塔的蛋蛋滑落");
            if(get_player().wetness() >= 4)
            {
               outputText("与你之前排出的液体汇合在");
            }
            else
            {
               outputText("然后向下走向");
            }
            outputText("地板上，在那里汇聚成");
            outputText("一滩水洼。");
         }
         if(get_player().get_gender() == 0)
         {
            outputText("[pg]你挤压、按摩并紧握着乌尔塔插入的肉棒。你发出一声只能称之为后庭高潮的呻吟，因为你");
            if(get_player().ass.analLooseness < 3)
            {
               outputText("紧致的");
            }
            else
            {
               outputText("松弛的");
            }
            outputText("肛门肌肉像小穴一样榨取着乌尔塔的肉棒。");
            if(get_player().ass.analWetness > 0)
            {
               outputText("它甚至分泌出自己的淫液，顺着双性狐狸兽人的蛋蛋滑下，滴落在地板上，这是你享受的不可否认的证明。");
            }
         }
         outputText("[pg]乌尔塔呻吟着、低吼着，继续在你的屁股里进进出出，尽可能紧紧地把你压向她。[say: 哦，你很喜欢这样，不是吗？好吧，让我们看看你能坚持多久！]她宣布道，并开始更用力、更快地操你，你高潮的气味刺激着她达到新的活力高度。");
         outputText("[pg]在你爆炸性的高潮之后，你无法保持清醒，躺在");
         var _loc1_:int = 0;
         if(get_player().hasVagina())
         {
            if(get_player().wetness() >= 4)
            {
               _loc1_ += 2;
            }
            else
            {
               _loc1_++;
            }
         }
         if(get_player().hasCock())
         {
            if(get_player().cumQ() < 250)
            {
               _loc1_++;
            }
            else if(get_player().cumQ() < 1000)
            {
               _loc1_ += 2;
            }
            else
            {
               _loc1_ += 3;
            }
         }
         if(_loc1_ > 0)
         {
            if(_loc1_ == 1)
            {
               outputText("小");
            }
            else if(_loc1_ == 2)
            {
               outputText("适中的");
            }
            else
            {
               outputText("巨大的");
            }
            outputText("你制造的精液水洼上");
         }
         else
         {
            outputText("地板上");
         }
         outputText("然后闭上眼睛，任由睡意袭来，即使你身后的狐狸在你的背上流口水，并继续把你的屁股操得通红。");
         outputText("[pg]你恢复了意识，注意到你躺着的枕头惊人的柔软。感觉太好了，你忍不住把头埋进去，用脸颊蹭它。[say: 你喜欢那样，是吗？]一个熟悉的声音说道，听起来相当有趣。");
         get_player().orgasm("Generic");
         dynStats(DynStat.Sens(3));
         menu();
         addButton(0,"继续",partTwoOfUrtaBoning);
      }
      
      public function urtaPreggoApproached() : void
      {
         clearOutput();
         menu();
         switch(get_pregnancy().get_event())
         {
            case 1:
               outputText("当你走近并在你常坐的位置坐下时，乌尔塔一口气喝下了一杯橙色起泡的饮料，那味道绝对不像她平时喜欢喝的。她看到你盯着那杯饮料，便笑了笑，随意地耸了耸肩。[say: 哎呀，怀孕的时候我总不能喝酒吧，对吧，[name]？] 然后她偷吻了你一下；她尝起来甜甜的，还有点酸——肯定是什么果汁……");
               if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,13) == 0)
               {
                  outputText("她的肉棒撞在桌子底下，发出了清晰的“咚”声，但她听到这声音只是咧嘴一笑，对现在的自己充满自信。[say: 想回我那里去吗，亲爱的" + get_player().mf("小帅哥","") + "？他们说做爱对宝宝有好处——对妈妈也很有好处……] 她轻声哼唱着，用脚挑逗地摩擦着你的[legs]。");
                  urtaSexMenu();
               }
               else
               {
                  outputText("乌尔塔那边没有传来肉棒撞击木头的声音，也没有什么动作，这清楚地表明她此刻并没有发情。结束了亲吻，她舔干净自己光泽的嘴唇，带着善意的坏笑看着你。[say: 想聊会儿天吗？]");
                  addButton(0,"交谈",get_urta().urtaDialogueMenu);
                  addButton(14,"离开",get_telAdre().barTelAdre);
               }
               break;
            case 2:
            case 3:
               if(Utils.rand(2) == 0)
               {
                  outputText("乌尔塔侧坐在她常坐的座位上，裙子鼓起的样子清楚地表明她至少已经半勃起了，微微隆起的小腹撑起了她的裙子。当她看到你盯着看时，给了你一个有些尴尬的微笑。");
                  outputText("[pg][say: 我现在就是觉得无时无刻不在发情，] 她坦白道。[say: 我想这可能和荷尔蒙有关，不过如果你更想聊天的话，我也很乐意。]");
               }
               else
               {
                  outputText("乌尔塔侧坐在她常坐的座位上，肚子微微隆起，裙子明显被顶起了一个帐篷，在她肉棒明显戳着的地方，顶端已经湿透了。当她看到你注意到这一点时，给了你一个灿烂而渴望的微笑。");
                  outputText("[pg][say: 嘿，亲爱的。你是来给这只大肚子又发情的狐狸精一点甜头的吗？] 她撅起嘴。[say: 还是只想聊天？我想你知道我更喜欢哪个……] 她的手指在帐篷周围画着小圈，随着她越来越兴奋，帐篷也变得更大了。");
               }
               addButton(0,"性爱",urtaSexMenu);
               addButton(1,"交谈",get_urta().urtaDialogueMenu);
               addButton(14,"离开",get_telAdre().barTelAdre);
               break;
            case 4:
               outputText("乌尔塔从她常坐的桌子搬到了一个私人包厢，正惬意地靠在有着柔软靠垫的高背椅上。原因显而易见；她现在明显怀孕了，肚子圆鼓鼓的，隆起在腿上，但还没大到影响她活动的程度。她抚摸着肚子，给了你一个自豪又满足的假笑。[say: 我们做到了，[name]；我们要有孩子了。这么多年了……这真是太棒了。] 她明显地拍了拍撑起裙子的隆起；她肚子很大，但还没大到需要换衣服的地步。");
               if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,13) == 0)
               {
                  outputText("[pg]随着她的肉棒从包皮中肿胀而出，她的裙子被撑得更紧了，淫液已经弄湿了布料。[say: 想做爱吗，亲爱的？我可是很想呢……] 想到这里，她舔了舔嘴唇。");
               }
               else
               {
                  outputText("[pg][say: 你运气不错；我现在没心情把你扔到桌子上操到你走不动路……但给我一分钟，我大概能改变主意。] 乌尔塔说道。她笑了笑，似乎想证明这只是个玩笑，但她眼中的光芒表明，如果你允许，她真的能做到……");
               }
               addButton(0,"性爱",preggoUrtaSmexOrSomething);
               addButton(1,"交谈",get_urta().urtaDialogueMenu);
               addButton(14,"离开",get_telAdre().barTelAdre);
               break;
            case 5:
               outputText("乌尔塔还在她搬去的那个私人包厢里，而且理由很充分——她的孕肚太明显了，除非你是瞎子才看不见，她的腰围至少增加了十英寸，而且是直挺挺地凸出来。她穿的黑色连衣裙在隆起的肚子周围被撑到了极限，紧紧地绷在球形的凸起上。她正津津有味地喝着一杯散发着甜味的起泡橙汁，面前放着一个吃得干干净净的盘子。她看到了你，一边继续喝着，一边向你点头。");
               if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,13) == 0)
               {
                  outputText("[pg]你的[foot]踩到了什么湿漉漉的东西，你意识到乌尔塔的肉棒正挂在桌子底下，淫液流了一地，她的乳头透过裙子明目张胆地显露出来——你甚至有点惊讶裙子还没被它们撑破。乌尔塔一言不发地放下杯子，用迷离的眼神看着你，眼中闪烁着情欲的光芒。[say: 嘿，性感宝贝……想和我一起从后门溜出去吗？] 她发出满足的呼噜声。");
               }
               else
               {
                  outputText("她放下杯子，舔了舔嘴唇。[say: 嗯……这东西比你想象的要好喝得多，尤其是怀孕的时候。那么，性感宝贝，什么风把你吹来了？想来看看我们吗？] 她微笑着拍了拍肚子。[say: 还是说你想聊聊天？……或者也许是<b>深入交流</b>一下？] 她邪恶地咧嘴笑了。");
               }
               addButton(0,"性爱",preggoUrtaSmexOrSomething);
               addButton(1,"交谈",get_urta().urtaDialogueMenu);
               addButton(14,"离开",get_telAdre().barTelAdre);
               break;
            case 6:
               outputText("这只怀孕狐狸平时穿的那件暴露的黑色连衣裙已经寿终正寝了；她的肚子太大了，硬塞进去只会把衣服撑破。取而代之的是，她换上了一身更休闲的打扮；一条及膝的百褶裙和一件露脐T恤，T恤下摆垂着几缕渔网状的细线，搭在" + (get_noFur() ? "" : " 长满灰色绒毛的") + "肚子上。T恤在乳头的位置看起来有点湿；肯定是开始分泌乳汁了。她抚摸着肚子，得意地对你微笑。[say: 看看我，亲爱的；我现在真的开始变大了。这种感觉真是太奇妙了；你不知道我梦想这一天发生在我身上有多久了。]");
               if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,13) == 0)
               {
                  outputText("[pg]你能听到淫液滴落在桌子底下慢慢变大的水洼里的声音，她给了你一个最邪恶的笑容。[say: 看来变大的不只是我的肚子……愿意帮帮你孩子的母亲解决一下需求吗，[name]？]");
               }
               else
               {
                  outputText("[pg]她旁边放着几杯牛奶，但当她看到你时，表情变得有些尴尬。[say: 嘿，[name]。你刚好错过我安抚荷尔蒙的时候，] 她承认道，指着那半打杯子，显得有些不好意思。当你意识到那“牛奶”到底是什么时，你睁大了眼睛。乌尔塔假笑了一下，带着点傲慢问道，[say: 那么你是想聊聊天，还是看看我们能不能再装满几杯？]");
               }
               addButton(0,"性爱",preggoUrtaSmexOrSomething);
               addButton(1,"交谈",get_urta().urtaDialogueMenu);
               addButton(14,"离开",get_telAdre().barTelAdre);
               break;
            case 7:
               outputText("乌尔塔的肚子越来越大，但她似乎并不在意。事实上，她还骄傲地炫耀着自己隆起的肚子，不停地抚摸着。你可以看到她子宫里的孩子偶尔踢腿时引起的凸起或涟漪，孩子长得很强壮、很健康。她的T恤上因为开始分泌乳汁而出现了湿斑，不过乌尔塔似乎还没有察觉到。她的百褶裙已经被撑得很高，甚至翻卷了上去，让她的下体完全暴露在外，毫无疑问，她现在非常兴奋。");
               outputText("[pg]更多的前列腺液从她的阴茎上滴落，她猛地注意到了你，[say:哦，[name]！我正想着你呢！我从来不知道怀孕会让我感觉如此……性感。充满生命力的感觉似乎让我的男性部分想要制造更多的生命，你明白我的意思吗。求你了，告诉我你是来打个快炮的？]她局促不安地动了动。[say:我想我们也可以聊聊天……如果你想的话。]");
               addButton(0,"性爱",preggoUrtaSmexOrSomething);
               addButton(1,"交谈",get_urta().urtaDialogueMenu);
               addButton(14,"离开",get_telAdre().barTelAdre);
               break;
            case 8:
               outputText("乌尔塔终于连她的卡座都坐不下了，她的肚子现在看起来就像是整个吞下了一个获奖的大西瓜。她开始坐在酒吧一个偏僻角落里一张没有形状、塞得满满的沙发上。她的双手几乎同时抚摸着她的肚子和勃起的阴茎，前列腺液滴滴答答地落入放在她勃起下方的桶里。她看到你走过来，她的阴茎急切地跳动着，因为兴奋的涌动，又一股前列腺液喷进了桶里。");
               outputText("[pg][say:哦，[name]；谢天谢地你来了，亲爱的。我——我<b>需要</b>做爱！孩子随时都可能出生，但我的荷尔蒙快把我逼疯了。求你了，告诉我你会帮我的，[name]？我……我一直试图尊重你和你的意愿，即使我喝得烂醉如泥的时候，但我发誓，在这种情况下，我真的很难控制自己不把你按在桌子上，用我的家伙撑开你迷人的[butt]。现在我只想操你，直到你被精液塞满，变得比我还圆。]乌尔塔绝望的表情和她阴茎上泛起的紧张颤抖表明她真的是认真的。");
               outputText("[pg]你可以带乌尔塔回她的公寓，给她极度渴望的释放，或者你可以利用她现在的状态，稍微挑逗她一下。当然，这会鼓励她像她说的那样用她的阴茎填满你。或者你也可以直接离开，让她自己冷静下来。");
               menu();
               addButton(0,"性爱",preggoUrtaSmexOrSomething);
               addButton(1,"挑逗",urtaRaepsJoo);
               addButton(14,"离开",leavePreggoUrta);
               break;
            case 9:
               goVisitUrtaBirfs(true);
         }
      }
      
      public function urtaPregCravings() : void
      {
         clearOutput();
         outputText("你决定问问乌尔塔现在有没有什么特别想吃的东西。这只怀孕的狐狸明显思考了一下，然后偷偷瞄向你的胯部。");
         if(!get_player().hasCock())
         {
            outputText("[pg][say: 不用了，我没事，真的，]她摇摇头回答道。");
            outputText("[pg]也许你应该考虑做点别的事？或者等你有什么别的东西可以给她时再问一次。她似乎因为你没有鸡巴而感到有些失落。");
            menu();
            addButton(0,"继续",preggoUrtaSmexOrSomething);
            return;
         }
         outputText("[pg][say: 嗯……好吧，我确实想吃点什么……但我也不确定是什么。我想，应该是咸咸的东西……]她说道。");
         outputText("[pg]咸的？你问是否可以帮她弄清楚她到底想要什么，并对她会心一笑。");
         outputText("[pg]怀孕的狐狸得意地笑了笑，说道：[say: 也许……如果你能躺在我的床上？]她说话时调皮地摇晃着尾巴。");
         outputText("[pg]你跳上她的床，按照她的要求躺下。");
         outputText("[pg]乌尔塔调皮地哼着歌，跨坐在你身上，用她肿胀的身体在你身上挑逗地摩擦，同时温柔地舔着你的脸颊。[say: 嗯……不，不是这个……]她慢慢地往下挪，然后开始舔舐你的乳头");
         if(get_player().lactationQ() >= 200)
         {
            outputText("，这让乳汁不由自主地流了出来");
         }
         outputText("。[saystart]不，也不是这个……");
         if(get_player().lactationQ() >= 200)
         {
            outputText("不过挺甜的。");
         }
         outputText("[sayend]她继续往下，慢慢地舔过你的肚子。[say: 越来越接近了……]终于，她来到了你的胯部……在那里，你的[cock]自然地勃起着。[say: 看看我们发现了什么……？]乌尔塔柔声说道，在肉棒上方徘徊，沉醉地嗅着那股气味。[say: 嗯……闻起来真不错……]她俯下身，给了你的肉棒一个长长、湿润又黏糊糊的舔舐，直接从你的");
         if(get_player().balls > 0)
         {
            outputText("[balls]");
         }
         else
         {
            outputText("根部");
         }
         outputText("一直舔到龟头。当她那狐狸的舌头舔舐着你敏感的[cock biggest]时，你忍不住呻吟出声。");
         outputText("[pg][say: 嗯……孩子[he]爹喜欢这样，对吧？]乌尔塔咯咯笑着，为了强调又给了你长长的一舔。你呻吟着，迎着她的舌头挺动，试图挤进那张狐狸小嘴里。她舔舐着，但一直调整着姿势，让你无论怎么努力都无法进入她的嘴里。她调皮地看着你，吸溜着从你[cockHead biggest]滴落的淫水，然后她向后仰起头，看着你的眼睛。[say: 你尝起来……真美味！]她咧嘴一笑，然后张开嘴，饥渴地吞没了你的肉棒，在她突然急于吞咽的渴望中，几乎是把它吸了进去，舌头急切地吸吮、涂抹着你的肉棒，将它吞了下去。");
         outputText("[pg]当你感觉到乌尔塔突然吞没你的[cock biggest]时，你抓紧了床单，在快感中不由自主地挺动，撞到了她的下巴");
         if(get_player().balls > 0)
         {
            outputText("和你的[balls]");
         }
         outputText("。你抱歉地对她笑了笑，问她是否已经找到了她一直渴望的东西。[say: 你觉得呢？]她带着戏谑的眼神，讽刺地嘟囔着，然后开始发出响亮的吸吮声，舌头疯狂地舔舐着你入侵的肉棒，眼睛在明显的享受中翻白，大口吞咽着她急切地从你那里哄骗出的淫水。");
         outputText("[pg]你呻吟着，尽力克制自己不去抓住她的头操她的嘴。");
         if(get_player().cockTotal() > 2)
         {
            outputText("你其余的[cocks]也和你的[cock biggest]一样勃起，在它们拍打乌尔塔疯狂起伏的头部时，顺着长度滴下淫水。");
         }
         outputText("你告诉乌尔塔你快到了；如果她继续这样，你坚持不了多久了。");
         outputText("[pg]如果她听到了你的话，乌尔塔并没有被吓退——相反，她加倍努力，发出咕噜声和呻吟声，尽她所能深喉你的肉棒");
         if(get_player().balls > 0 || get_player().hasVagina())
         {
            outputText("，一只手熟练地玩弄着");
            if(get_player().balls > 0)
            {
               outputText("你的蛋蛋");
               if(get_player().hasVagina())
               {
                  outputText("另一只手玩弄着");
               }
            }
            if(get_player().hasVagina())
            {
               outputText("你的小穴");
            }
         }
         outputText("。她突然松开嘴，舔了舔嘴唇。[say: 来吧，亲爱的。我以为你主动提出要帮我解决渴望呢？可你却不肯给我你那咸咸的精液？好饿……给我！]她恳求着，用充满希望的眼神看着你，同时继续抚摸着你的肉棒。");
         menu();
         addButton(0,"射精",getBlownByPregnantUrta);
         addButton(1,"忍住",holdOnYouAintGettingYerCumYetYouNaughtyFox);
      }
      
      public function urtaPregAppearance() : void
      {
         switch(get_pregnancy().get_event())
         {
            case 1:
            case 2:
               outputText("乌尔塔坐在她常坐的桌子旁，看起来比平时更清醒、更理智。她显得非常高兴，尾巴在身后轻轻摇摆着。看到你时，她给了你一个激动的眼神，幸福地微笑着，并意味深长地拍了拍自己的肚子。");
               break;
            case 3:
            case 4:
            case 5:
            case 6:
            case 7:
               outputText("乌尔塔已经从她常坐的桌子换到了一个更私密的隔间，显然是为了享受那里舒适的软座。她隆起的肚子让人一眼就能看出她怀孕了——而她脸上那似乎固定不变的灿烂笑容，也让人一眼就能看出她对此欣喜若狂。");
               break;
            case 8:
            case 9:
               outputText("乌尔塔的孕肚已经大到让她坐不下那个隔间了；她搬到了酒吧里一个安静、偏僻的全新位置。看着她那惊人的体型，毫无疑问她随时都有可能生。");
         }
      }
      
      public function urtaMassageClimax() : void
      {
         outputText("[pg]伴随着一声愉悦的嚎叫，乌尔塔挺起臀部，她的蛋蛋紧紧地贴着她突然湿透的小穴，里面的东西爆炸开来，她肉棒内部静脉状的结构明显鼓起，精液顺着她的长度向上喷射，在避孕套里爆炸。在射精的力量下，乳胶明显从她完全张开的冠状沟表面升起，一个微型的精液喷泉在撞击到不可渗透的屏障并被弹开时发出咕噜声并喷洒出来，很快就用不断增长的扶他精液淹没了视线。避孕套气泡状的顶端被拉得越来越大，变得越来越圆，越来越饱满，因为她把一发又一发的精液喷射进去。最后，它看起来就像一个灰白色的篮球在她的鸡巴顶端摇晃。乌尔塔的高潮终于平息了，这位扶他狐狸发出一声疲惫而幸福的呻吟。她的鸡巴软绵绵地落在床上，带着她的避孕套落在床单上，被她的女性体液浸透了。");
         outputText("[pg]你看着乌尔塔变成了一滩融化的、充满快感的狐狸，去拿那罐奶油想再往她身上喷点，却发现什么也喷不出来了。[say: 别、别担心……下次你来的时候我会把它换掉的。]她虚弱地拍了拍肚子，轻声笑了。[say: 我想这真的是一项非常值得的投资……不知道它能不能做很好的润滑剂……]");
         outputText("[pg]当你走到附近的垃圾桶去扔空罐子时，你问她是否在考虑换掉你找到的那个桶。");
         outputText("[pg][say: ……你为什么问这个？]乌尔塔问道，大声打了个哈欠。[say: 我的意思是……嗯，如果你一直在这里，我们可能需要把它加倍，因为我们俩都会一直用它……]她嘟囔着；显然，怀孕和做爱让她昏昏欲睡。[say: 我得找个时间试着像那样给你揉揉……出去的时候请把门关上……]她喃喃地说，翻了个身，让自己尽可能舒服地躺着。");
         outputText("[pg]你很想说点什么，比如她鸡巴上还挂着装满狐狸精液的避孕套，或者她肚子上还覆盖着一层薄薄的白浊，但乌尔塔现在似乎没有任何力气去做或说任何事情了。");
         if(get_player().cor < 33)
         {
            outputText("你走到她身边，小心翼翼地取下她的避孕套，打了个结以防止她的精液漏出，然后把它扔掉。");
         }
         else if(get_player().cor < 66)
         {
            outputText("算了，不管怎样，她现在可能困得没法反抗了。");
         }
         else
         {
            outputText("你带着坏笑走到她身边，取下她的避孕套，然后把里面的东西倒在她的肚子上，暗自发笑。这下你的可爱双性狐狸兽人身上就有了绝佳的奶油点缀了。");
         }
         outputText("你走出她的房子，离开时小心翼翼地锁上了门。");
         dynStats(DynStat.Lust(25));
         doNext(get_camp().returnToCampUseOneHour);
      }
      
      public function urtaKidsText(param1:String = undefined, param2:String = undefined, param3:String = undefined) : String
      {
         if(param1 == null)
         {
            param1 = "";
         }
         if(param2 == null)
         {
            param2 = "";
         }
         if(param3 == null)
         {
            param3 = "";
         }
         if(urtaKids() == 1)
         {
            if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,795) == 1)
            {
               return param1;
            }
            return param2;
         }
         return param3;
      }
      
      public function urtaKids() : int
      {
         return FlagDict_Impl_.arrayReadInt(KFLAGS.flags,792) + FlagDict_Impl_.arrayReadInt(KFLAGS.flags,793) + FlagDict_Impl_.arrayReadInt(KFLAGS.flags,794);
      }
      
      public function urtaIsHappyAboutPregnancyAtTheBar() : void
      {
         clearOutput();
         FlagDict_Impl_.arrayWriteInt(KFLAGS.flags,801,1);
         outputText("当你走进乌尔塔最喜欢的酒吧时，你立刻注意到气氛似乎更加喜庆了；一个害羞又幸福地尴尬着的乌尔塔坐在她的桌子旁，被一群祝福者包围着，他们手里都拿着马克杯。南希从吧台后面看到了你，她正忙着分发饮料，咧嘴大笑。[say: 嘿，大家！孩子的爸爸来了！]她喊道，你立刻被大笑、欢呼、戏弄的人群包围了，他们和你握手，称赞你的能力，拍打你的背或肩膀，并戏弄地邀请你在他们身上试试你的种马能力。不知怎么的，在混乱中，你发现自己坐在了乌尔塔旁边，她对你微笑并拍了拍你的手。");
         outputText("[pg][say: 他们一发现我怀孕了，南希就坚持要为我举办一个小小的庆祝活动。这真的有点让人受宠若惊……我只是希望我也能享受免费的饮料，]她叹了口气，舔了舔嘴唇，因为蛛化精灵开始向口渴的常客们分发更多的饮料。");
         outputText("[pg]你花了一点时间和你的狐狸恋人庆祝，然后礼貌地告辞离开。");
         doNext(get_camp().returnToCampUseOneHour);
      }
      
      public function urtaIsAPregnantCopScene() : void
      {
         clearOutput();
         spriteSelect(SpriteDb.get_s_urta());
         outputText("当你进入主广场并开始环顾四周决定下一步去哪里时，广场对面爆发了一阵骚动。[say: 以法律的名义站住！]埃德琳的声音响起，一个年轻、衣衫褴褛的狗兽人从人群中冲了出来，埃德琳紧追不舍。不幸的是，对于半人马娘来说，这个较小的两足动物更快、更敏捷，也更适合在人群中穿梭。");
         if(get_game().telAdre.edryn.pregnancy.get_isPregnant())
         {
            outputText("埃德琳怀孕的肚子也帮不上忙。");
         }
         outputText("[pg]当你考虑是否要介入时，你意识到小偷的路线正把他带向某个怀孕的狐狸兽人，她正冷冷地看着他靠近。就在他靠得足够近的那一刻，她猛扑过去——以令人吃惊的、骨头嘎吱作响的暴力速度，她把他脸朝下按在鹅卵石上，并压住了他的身体。当你漫步过去时，她开口了。");
         outputText("[pg][say: 仅仅因为我看起来像一个人吃了一整头银奖猪，并不意味着我好欺负。我虽然看不见自己的脚了，但我可没忘记我的身手。现在，为了我们双方好，我建议你还是放弃吧；你也不想作为一个被孕妇揍了的骗子而出名，对吧？]她漫不经心地宣布。");
         outputText("[pg]埃德琳迅速小跑过来，帮助乌尔塔重新站起来，然后迅速带着一个非常羞愧（且被压得有点扁）的囚犯小跑着离开了。乌尔塔调皮地对你眨了眨眼，然后走开了，把你留在了原地。");
         doNext(get_telAdre().telAdreMenu);
      }
      
      public function urtaBoobWorshipScene() : void
      {
         clearOutput();
         outputText("你注视着乌尔塔沉甸甸的乳房，里面装满了乳汁，几滴乳汁已经从她黑色的乳头上溢出。[say: 哦，你喜欢这些，是吗？你喜欢一对漂亮、丰满的狐狸奶子，对吧？]她开玩笑地说着，为了逗你开心还晃了晃它们，然后因为乳房过于敏感而皱了皱眉。");
         outputText("[pg]你忍不住注意到乌尔塔的乳房肿胀得很厉害。她最近有给自己挤奶吗？看起来不像。");
         if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,804) == 0)
         {
            outputText("[pg][say: 呃，这个嘛……]乌尔塔的声音渐渐小了下去，看起来有些尴尬。[say: 我试过了，但是，我……我想我不太擅长。它们只是因为充满乳汁而变得非常肿胀，变得非常敏感和酸痛。]");
            outputText("[pg]你建议也许你可以帮她。");
            outputText("[pg][say: 你确定你不是只想免费摸我的奶子吗？]乌尔塔说道，但她说话时却面带微笑。[say: 好吧，既然是你要求的……拜托，你能帮帮我吗？]她问道。你微笑着向她点点头。");
         }
         else
         {
            outputText("[pg][say: 是啊，我一直试图让自己更频繁地挤奶，但是……我想我就是没有你那神奇的手指。你能做个好心人帮帮我吗？]她问道，她那" + (get_noFur() ? "" : "黑色的") + "嘴唇上挂着一丝调皮的笑容。");
            outputText("[pg]你微笑着点点头。听起来是个好主意！");
         }
         var _loc1_:IMap = KFLAGS.flags;
         FlagDict_Impl_.arrayWriteInt(_loc1_,804,FlagDict_Impl_.arrayReadInt(_loc1_,804) + 1);
         outputText("[pg]你走近乌尔塔，然后用双手托起她的乳房。你转动着那" + (get_noFur() ? "" : "毛茸茸的") + "球体并掂量着它们……它们相当重，难怪她会觉得酸痛。她在痛苦和快乐中呻吟着，但除此之外保持沉默，信任着你。你对她的反应笑了笑，轻轻地抓住她的乳房，慢慢地按摩，直到她那挺立的黑色乳头。你捏住它们，轻轻拉扯，看着一小股乳汁从她敏感的乳头上喷射而出。");
         outputText("[pg][say: 哦！哦，嗯，感觉真好……拜托，继续；感觉真的很好，]乌尔塔闭着眼睛说道，为了完全集中注意力在你的手指以及它们对她那痛苦肿胀的乳头所做的事情上。她的肉棒勃起了，在与她肿胀的肚子齐平的位置坚持不懈地上下摆动，但你们俩现在都没有注意到这一点。");
         outputText("[pg]看到她的反应，你决定多玩弄一下她的乳头，扭动、捏住并拉扯它们。你对每一条成功从她沉重的乳房中挤出的乳汁感到高兴并微笑。她淫荡地呻吟着，伸出手接住一些你熟练提取的乳汁，将其涂抹在她急切摇摆的手指上。");
         outputText("[pg]游戏时间结束了，你心想。你抓住她的乳房，摸索并按摩着那对球体，将它们挤压在一起并在手掌中滚动。她的乳头被夹在你的手指之间，喷射并渗出乳汁，用它们的乳汁润滑了她的乳房和你的双手。[say: 嗯……太舒服了，但是，我现在可以躺下吗？]乌尔塔闭着眼睛问道。[say: 我想如果我躺下的话，我会更享受这个。]你点点头，注意到考虑到她肚子的重量，这对她来说一定很困难。赤裸的狐狸急切地在床上躺下，将自己安置在床头，这样床头就能支撑她仍然直立的躯干，并为你腾出充足的空间。");
         outputText("[pg]你跟着她，从未停止甚至放慢你的按摩。[say: 哦……亲爱的，你能做个好心人，从床头柜上拿一个我的避孕套吗？在这结束之前我肯定会射的，我只是知道，而且我真的更希望这个地方更容易清理。]怀孕的双性人闭着眼睛问道，一边享受着你的双手以及它们带来的性快感和身体酸痛缓解的双重感觉，一边轻声呻吟。");
         outputText("[pg]你按照她的要求，跳到她的床头柜前拿了一个避孕套。你把那个小包装扔给她。令人惊讶的是，她闭着眼睛接住了它，轻松地将它套在她斑驳的肉棒上，然后对你微笑。[say: 谢谢你，亲爱的；你真体贴……现在，如果你不介意的话？]她假笑着指了指她的乳房。");
         outputText("[pg]你跳回她身边，兴致勃勃地攻击她的乳房。她因为这突如其来的猛烈而发出惊讶的呻吟和尖叫，在习惯之前有一丝痛苦。你凑近并把她的一个乳头含在嘴里，轻轻地咬着");
         if(get_player().face.type == 4 || get_player().face.type == 5 || get_player().face.type == 10)
         {
            outputText("，始终注意你锋利的牙齿");
         }
         outputText("。她大声叫喊，但没有做出推开你的动作，所以她显然很享受。你交替着咬和拉扯，从不重复相同的动作两次。[say: 我——我要……！]她喘息着，在你身下扭动挣扎。你邪恶地笑了笑，最后一次咬住她的乳头，拉扯并吸吮着它。");
         outputText("[pg]乌尔塔发出一声夹杂着快乐和痛苦的尖叫，弓起背，她的肉棒突然爆发，将怀孕双性人的精液一股接一股地喷射进匆忙戴上的避孕套里，使其膨胀成一个篮球大小、充满液体的畸形乳胶气泡，直到她最终将自己最后一点精液排空。伴随着一声长长的叹息，她瘫倒下来，大口喘气。最后，她鼓起力气说道，[say: 按摩得不错，亲爱的，但那是为了谁的享受？我的还是你的？]她脸上高潮后的红晕表明她并不太在乎你的答案是什么。");
         if(get_player().hasCock())
         {
            outputText("[pg]你从她的乳房前退开，展示着你勃起的下体。她看着它，嘴角勾起一抹坏笑，若有所思地点了点嘴唇。[say: 好吧，既然你这么好心让我爽了……]她笑着，伸出一只手握住你[cock biggest]的肉棒。");
            outputText("[pg]你把手覆在她的手上，将其拉开，告诉她你另有打算。[say: 哦？比如什么？]她问道，听起来很感兴趣。你指了指她的大乳房。[say: 乳交？好吧，如果你想的话，]她回答道，似乎对这个主意一点也不反感。");
            outputText("[pg]你靠近她，手里握着跳动的肉棒。你急切地将你[cock biggest]的肉棒压在她的双乳之间。她对你笑了笑，然后温柔地用手拢住两边的乳房，将它们拉开，好让你的肉棒完全嵌入她乳沟的峡谷中，接着又将它们合拢，让你的肉棒被温暖、柔软、晃动" + (get_noFur() ? "" : "、毛茸茸") + "的乳肉四面包裹。[say: 喜欢这样吗，亲爱的？]");
            outputText("[pg]你满意地呻吟着，开始在她的乳房上抽插。那里柔软温暖，而且因为之前按摩时溢出的乳汁而变得湿润，感觉棒极了。你的狐狸情人咧嘴笑着，急切地用她充满乳汁的乳房迎合你的抽插；最后，她对仅用乳房的效果感到不满足，便探头向前，开始舔舐、吸吮并温柔地亲吻你肉棒的顶端。");
            outputText("[pg]如果她继续这样下去，你很快就会射出来。你警告了乌尔塔，但她只是加倍努力地舔吻你的[cockHead biggest]。[say: 我觉得，在我要求你给我口交了那么多次之后，这样才算公平，]乌尔塔说道，因为嘴里含着龟头，声音有些含糊不清。[say: 而且，我突然很想吃点又热又咸的东西……]她迅速将你的肉棒尽可能深地吞入她温暖湿润的口中，舌头以只有狐狸才有的技巧挑逗着你，引诱你走向不可避免的高潮。");
            outputText("[pg]你喘息着，舒服地呻吟出声，你体内的每一根神经都被点燃了，快感如潮水般将你淹没。");
            if(get_player().cumQ() < 250)
            {
               outputText("[pg]你将一股又一股的精液射进乌尔塔急切的嘴里。她非常乐意把你吸干，吧嗒着嘴唇，舔舐着你的[cock]。然而，你很快就完事了，你仰面瘫倒，彻底满足了。");
               outputText("[pg][say: 嗯，你尝起来真美味，]乌尔塔说着，舔了舔嘴唇，毫不掩饰她的喜悦。");
            }
            else if(get_player().cumQ() < 500)
            {
               outputText("[pg]你将一股名副其实的精液喷射到这只双性狐狸兽人的喉咙深处。令人惊讶的是，她既没有作呕也没有咳嗽，只是高兴地咽了下去。从你的角度，你可以看到她几乎和你一样享受这一切；她闭着眼睛，脸上带着幸福的表情，品尝着你的味道，直到最后一滴落在她的舌头上。");
               outputText("[pg]她舔了舔嘴唇，确保没有漏掉一滴，然后带着充满爱意的微笑直视你的眼睛。[say: 啊，你真的很懂得怎么满足女孩子——嗝！]她猛地捂住嘴，看起来很尴尬。[say: 抱歉，]她恳求道。");
            }
            else
            {
               outputText("[pg]一股又一股滚烫的精液射入乌尔塔的喉咙，沉甸甸地落入她的腹中。这只双性狐狸兽人似乎一点也不介意，甚至看起来很高兴你把所有腥臭的精液都射进她的喉咙里。她也从未停止过舔舐，爱抚并吸吮着你的顶端，想要榨干你的最后一滴，尽管她根本不需要这么努力。当你完事时，她的肚子看起来比之前更大了，你甚至担心乌尔塔是不是忘了呼吸；自从你开始那惊人的高潮以来，她就一直在勤奋地吸吮和舔舐你。");
               outputText("[pg]她大声喘息着，然后咳嗽了几声。[say: 好吧，这可能有点贪多嚼不烂了，]她咕哝着，每次呼吸肚子都在晃动。她打了个响亮的饱嗝。[say: 但我确实觉得好饱；你肯定有很多爱要分享，对吧？]她说道，试图开个玩笑，尽管这个玩笑很冷。");
            }
            outputText("[pg]你从她身边退开，站在床边，伸了个懒腰，在这场美妙的乳交之后感到完全满足。");
         }
         outputText("[pg]乌尔塔费了点力气，才把避孕套从她的肉棒上取下来，没有洒出里面的东西，她把它系成通常的气球形状，轻轻地放在床头柜上。[say: 我必须说，我现在感觉好多了……我绝对想再来一次——毕竟只要我怀孕了，我就会一直产奶。但是，现在……]她打了个哈欠，打断了自己的话，[say: ……现在，我想睡个午觉。]她总结道。");
         outputText("[pg]你吻别了她");
         if(get_player().hasCock())
         {
            outputText("，尝到了自己精液的味道，");
         }
         outputText("并告诉她你晚点会回来看她。她给了你一个困倦的微笑，心不在焉地点了点头，几乎已经睡着了。你迅速找到你的[armor]并穿上，留下乌尔塔在她的公寓里休息一会儿。");
         doNext(get_camp().returnToCampUseOneHour);
      }
      
      public function updateVaginalPregnancy() : Boolean
      {
         if(get_player().get_pregnancyIncubation() == 504)
         {
            outputText("[pg]<b>你感到有些恶心。你的思绪飘向了乌尔塔，你怀疑这是否意味着她的种子已经生根发芽了……</b>[pg]");
            return true;
         }
         if(get_player().get_pregnancyIncubation() == 432)
         {
            outputText("[pg]<b>你注意到你的肚子已经微微隆起。现在你毫不怀疑；你怀上了乌尔塔的孩子。你暗自微笑，决定去拜访一下这只狐女。</b>");
            outputText("[pg]一过特尔阿德雷的城门，你四处打听，终于看到乌尔塔走在街上。她看到你走近，微笑着向你友好地挥手。[say:[name]！什么风把你吹来了？]你用一个短暂的吻向她问好，无法掩饰你幸福的笑容。[say:你今天很热情啊；怎么了？有什么好事发生吗？]乌尔塔笑着说，很高兴看到有人这么开心地见到她。");
            outputText("[pg]你摆了个小姿势，挺起肚子，让她自己去联想。她咯咯地笑着，犹豫地指着你的肚子，当你确认是的，你怀孕了，而且她就是父亲时，她欢呼起来，紧紧地抱住了你。[say:哦，[name]，你让我太开心了……我到底做了什么才配在我的生命中拥有你？]你回抱她，深情地吻她，考虑到你们目前身处公共场所，这引起了相当不合适的反应。[say:呃-呵呵……也许我们应该换个更私密的地方？]乌尔塔不好意思地咧嘴笑了。[say:而且我得开始给自己安排更多的外部巡逻了；我总不能把我的孩子他妈一个人留在荒野里，对吧？]她说道。");
            outputText("[pg]你忍不住问这是否意味着你会更频繁地见到她？[say:是的，没错……现在，请原谅我……]狐女回答道，躲进附近的一条小巷，她的裙子被勃起的肉棒明显地顶起了一个帐篷。你让她去处理她的问题，然后去忙你自己的事。[pg]");
            return true;
         }
         if(get_player().get_pregnancyIncubation() == 360)
         {
            outputText("[pg][say:[name]？[name]，你在吗？哦，拜托告诉我我大老远跑来不是白跑一趟……]");
            outputText("[pg]你走到营地边缘去迎接乌尔塔。她看到你时笑了，自豪地看着你越来越大的肚子，然后举起一个编织的藤篮。[say:我想你可能会需要一些新鲜的补给——食物、饮料、药品之类的——所以我今天巡逻时带了一些过来。]她解释道。");
            outputText("[pg]你感谢她带来的补给，并告诉她这些能帮你解决最近的嘴馋。");
            return true;
         }
         if(get_player().get_pregnancyIncubation() == 288)
         {
            outputText("[pg]你在你的[cabin]附近坐下休息。你变得越来越重了……拖着这个小家伙到处跑开始影响你冒险时的表现了。你决定坐下来享受这个阳光明媚的日子的凉爽微风，这时你在远处看到了一个熟悉的狐女的面孔。");
            outputText("[pg]乌尔塔微笑着向你走来，友好地挥了挥手。[say:嗨，亲爱的；宝宝怎么样了？]她问道，眼睛已经盯着你肿胀的肚子。你深吸一口气，开始向乌尔塔讲述你面临的负担。狐女在你抱怨时露出同情的表情，随着你说话，她怯生生地靠近你，然后轻轻地伸出一只手，在完全触碰到你的肚子之前停了下来，用明显的非语言请求许可的眼神看着你。你只是微笑着点了点头。");
            outputText("[pg]乌尔塔微笑着，急切地开始拍打和抚摸你的肚子，高兴地用手指滑过紧绷的皮肤，感受着怀孕肿胀的每一寸。[say:你感觉到它踢你了吗？]她问道，");
            if(get_pregnancy().get_type() != 25)
            {
               outputText("听起来有些嫉妒怀孕的是你而不是她。");
            }
            else
            {
               outputText("一边抚摸着自己怀孕的肚子，一边听起来有些得意。");
            }
            outputText("你摇了摇头，但考虑到你怀孕的时间，应该不需要太久……如果乌尔塔继续来拜访，你很确定下次她来的时候它就会踢你了。");
            outputText("[pg][say:好吧，那我得继续来看你，]乌尔塔笑着，抚摸着你的肚子。[say:现在，挺着这个大肚子到处走肯定不容易，不如你躺下，我给你好好按摩一下背部，嗯？]");
            menu();
            addButton(0,"按摩",getAnUrtaMassageWhenPreggo);
            FlagDict_Impl_.arrayWriteInt(KFLAGS.flags,800,1);
            return true;
         }
         if(get_player().get_pregnancyIncubation() == 216)
         {
            outputText("[pg]你拿出一个水袋解渴，然后在营地边缘坐下休息。[say: 嘿，美人。]一个熟悉的声音从你身后传来，乌尔塔从荒野中出现。她径直走到你面前，伸手拍了拍你隆起的肚子。[say: 宝宝对你怎么样，性感宝贝？你带着这个肚子看起来很不错哦，你知道吗？]");
            outputText("[pg]你对她的赞美报以微笑，告诉她宝宝终于开始踢人了，问她想不想摸摸看……");
            outputText("[pg]乌尔塔高兴地尖叫起来，立刻扑到你肿胀的肚子上，兴奋地用手和脸颊在[skinfurscales]表面摩擦，希望能感觉到她的孩子在你体内活动。你因为乌尔塔紧紧的拥抱而呻吟，她让你稍微失去了平衡，但你还是稳住了身子。从你体内，你感觉到宝宝在你越来越紧的子宫里移动，乌尔塔震惊地抬头看着你，眼中闪烁着喜悦。[saystart]我感觉到了！它在里面动！");
            if(urtaKids() == 0)
            {
               outputText("哦，[name]，我们真的要当父母了……");
            }
            outputText("[sayend] 她开心地喋喋不休，尾巴摇得那么起劲，你都怀疑它会不会掉下来。");
            outputText("[pg]你摸了摸她的头，对她微笑。她兴奋起来的样子很可爱。乌尔塔把耳朵贴平，闭上眼睛，靠在你抚摸的手上，让你想起了村子里的狗。[say: 嗯……在这里感觉真好，就这样抱着你们俩……没有什么比这更让我开心的了……]她喃喃自语。");
            outputText("[pg]考虑到她越来越紧的拥抱，你开玩笑地告诉她，如果她继续这样爱你，以后她能爱你的地方就不多了。乌尔塔发出一声震惊的“咿！”，迅速松开手，动作太快，结果一屁股摔在地上。她揉了揉屁股，为自己的笨拙轻声笑了起来。[say: 抱歉，[name]；你现在的样子太让人想抱了，你知道吗？]");
            outputText("[pg]你轻轻抚摸着突出的肚子，然后向她伸出援助之手。她接受了，然后给了你最后一个温柔的拥抱。[say: 好了，我最好回去侦察了；别做我不会做的事，好吗，亲爱的？也别做我不会做的人。]她笑道。你给了她一个快速的告别吻，然后送这只快乐的狐狸上路。[pg]");
            return true;
         }
         if(get_player().get_pregnancyIncubation() == 144)
         {
            outputText("[pg]你叹了口气。你希望这个宝宝能快点出生，带着这个小家伙到处跑，你的背开始疼了。[say: 你好，亲爱的……哦，怎么拉长个脸？]乌尔塔问道。你现在对她出现在这里并不感到惊讶。你向她解释了自从肚子变大后，你最近感觉有多累。乌尔塔拍了拍你的肩膀，看起来很同情。[say: 真的，你应该休息一下，亲爱的。我现在正在进行长时间的巡逻，所以你和我可以待在这里一起休息一天——我会替你处理觅食和防御之类的事情。]她提议道。");
            menu();
            addButton(0,"接受",acceptUrtaLevelSixPreggoHelps);
            addButton(1,"拒绝",declineUrtaLevelSixPreggoHelps);
            FlagDict_Impl_.arrayWriteInt(KFLAGS.flags,800,1);
            return true;
         }
         if(get_player().get_pregnancyIncubation() == 72)
         {
            outputText("[pg]你躺在你的" + get_camp().homeDesc() + "上小睡一会儿，但当你快要睡着时，你发现你的[cabin]外面有一个影子。认出那是狐狸的身影，你在乌尔塔靠近时向她打招呼。");
            outputText("[pg][say: 你感觉还好吗，[name]？]乌尔塔突然脱口而出，没有任何开场白。你点点头，解释说你只是累了，你希望这个宝宝能快点从你身体里出来，你受不了再带着它到处跑了。[say: 嗯，我想你不用担心太久……我的意思是，你最近看过自己吗，亲爱的？我不是想冒犯你，但你太大了！你随时都会生出来的！]她回答道，焦急地盯着你的腹部。");
            outputText("[pg]是啊……你确实挺大的，你承认。[say: 你真的应该来特尔阿德雷，你知道的，[name]。我不知道有哪个医生会大老远跑到这里来出诊，尤其是在世界现在这种状态下。]乌尔塔对你说，眼中流露出明显的担忧。");
            outputText("[pg]你点点头，考虑着她的话。但最终你觉得你不需要马上过去。如果你开始感觉要分娩了，那你就会去特尔阿德雷。乌尔塔看起来并不相信，但还是叹了口气点点头。[say: 好吧，[name]，我知道我无法改变你的主意。只是……请尽量小心，好吗？你现在处于最脆弱的状态，你知道吗？]她没有给你回答的时间，而是用一个温柔而占有欲强的拥抱将你包裹起来。你回抱她，并承诺会小心。");
            outputText("[pg][say: 你一定要做到——我不能失去你们俩，现在不行！]乌尔塔说——她眼里那是泪水吗？她最后紧紧抱了你一下，然后松开手跑进荒野，可能更多是为了避免任何潜在的尴尬爆发，而不是别的什么。[pg]");
            return true;
         }
         return false;
      }
      
      public function titWorshipAndStroke() : void
      {
         clearOutput();
         outputText("你含着乌尔塔的乳房调皮地笑了笑，急切地用一只手抓住她的肉棒，小心翼翼地不弄疼她，但力度足以让她感觉到你刚才做了什么。乌尔塔发出一声惊讶的呻吟。[say: 亲爱的？你在……？] 当你的手指在她肿胀的阴茎上移动时，她再次呻吟。");
         outputText("[pg]你开始用尽全力抚慰她的肉棒，挑逗她的包皮，捏住她膨胀的龟头。她低吼着呻吟，本能地将臀部顶向你挑逗的双手。[say: 你-你会弄得很脏的，如果……啊！] 她在你最新的挑逗动作下呜咽并扭动着。还没等你考虑停下来，她发出一声狂喜的叫喊，她的肉棒抽动、颤抖，然后喷发，将狐狸精液喷满了你的[chest]。你暗自微笑，又给她的肉棒撸了几下，以确保她被榨干了。");
         outputText("[pg][say: 看看你现在的样子……不过刚才还挺好玩的。]乌尔塔说着，尾巴在床上轻轻扫过。[say: 当然，既然你不想喝精液鸡尾酒，也许你应该把你的奶喝完，嗯？]");
         outputText("[pg]你冲她眨了眨眼，然后回到手头的任务，加倍努力地吸干她的乳汁。");
         finishTitWorshipWivUrta();
      }
      
      public function talkToUrtaAboutHerHouse() : void
      {
         clearOutput();
         outputText("你一直想知道，既然乌尔塔现在有了一座更好更大的房子，为什么还要保留她原来的公寓。对她来说，把租金投入到比保留那间公寓更有成效的事情上会好得多……");
         if(get_player().cor < 50)
         {
            outputText("尽管它对你来说有一些情感价值。");
         }
         outputText("[pg][say: 你真的想在我们的小怪物到处乱跑的时候做爱吗？] 乌尔塔轻笑着。[saystart]我知道我们比人类长得快，尤其是在我的情况下，但我宁愿现在还不用解释鹰身女妖和蜜蜂女孩的事。此外，我想不出还有什么比在我们正做到一半时，一个小声音");
         if(urtaKids() > 1)
         {
            outputText("或者两个");
         }
         outputText("突然响起问我们在做什么更破坏气氛的了。[sayend] 她带着有趣的假笑摇了摇头。[say: 不，我宁愿把老地方留作我们的小爱巢；我们可以在那里尽情玩乐，然后回家在孩子们面前表现得体面些。]");
         outputText("[pg]不过，你还是问了她维护那个地方的费用。她不会有财务问题吗？");
         outputText("[pg]她轻笑着，[say: 不，不，别担心那个。我毕竟是守卫队的队长。我的薪水可不是闹着玩的。加上我的存款和最近的奖金，而且……嗯，这么说吧，钱不在我目前的担忧清单上。] 然后她给了你一个假装生气的眼神，[say: 怎么？你以为我在遇到你之前，是个靠薪水买醉的月光族吗？我以前的地方一团糟，坦白说，是因为我不在乎做更多的事——它给了我隐私和一个睡觉的地方，这就是我所需要的全部。那时我的生活中没有一个人能让我相信我的生活真的有意义……不像现在。] 她总结道，给了你一个温柔的微笑。[say: 那么，这回答了你的问题吗？]");
         outputText("[pg]你想了想，点了点头，对她微笑着，感谢她的解释。");
         outputText("[pg][say: 既然我们一直在谈论我的公寓……]乌尔塔开始说道，用一只脚蹭着你的脚，[say: 我们不如回去试试那张床？看在过去的份上？]她坏笑着，甚至当她的肉棒撞到桌子上发出清晰的*砰*声时也是如此。");
         menu();
         addButton(0,"好",yesUrtaHouseSex);
         addButton(1,"不好",noUrtaHouseSex);
      }
      
      public function talkToLianaAboutHerResearch() : void
      {
         clearOutput();
         outputText("你问她为什么这么渴望从你这个人类身上获取样本。她到底在做什么研究，居然需要人类的样本？");
         outputText("[pg]她的眼睛亮了起来；显然这是她感兴趣的话题。[say: 我想我进行这项研究的主要原因还是出于好奇。我想我是在看着你的孩子们时想到这个的。我的意思是……当我们与其他物种交配时，通常会生出混血儿，但与人类交配呢？结果总是孩子随父亲或母亲的物种。我想知道：为什么会这样？为什么我们没有人类和狐狸的混血儿？] 她推了推眼镜。");
         outputText("[pg][say: 而且这不仅仅是关于你的问题，每一个与我们玛瑞斯人交配的人类都是如此。通常人类父母只会遗传一些基因，比如头发颜色，或者眼睛颜色，但实际的物种呢？那将永远是玛瑞斯人父母的物种。]");
         outputText("[pg]她咯咯地笑了起来，[say: 我得告诉你，我的母亲也是人类。我父亲说多年前，在我们搬到特尔阿德雷之前，她偶然闯入了他的房子。他说我的眼睛和我母亲的一模一样。] 她悲伤地笑了笑。[say: 我想知道为什么我不是半个人类，而是一只百分之百的臭鼬；为此，我需要人类精液和卵子的样本。]");
         outputText("[pg]你问她是不是和她母亲很亲近，所以才会对自己的种族产生这么多疑问。");
         outputText("[pg]她摇了摇头。[say: 我母亲在我还是个小女孩的时候就去世了。显然她感染了一种外来的疾病，没能挺过来。] 你向她道歉，");
         if(get_player().cor >= 50)
         {
            outputText("尽管可能有些敷衍，");
         }
         outputText("并问她这是否就是促使她研究人类和玛瑞斯人的原因。");
         outputText("[pg]她耸了耸肩。[say: 我想是的，尽管我拥有的是真正的好奇心。也许有一天你的孩子会问为什么他们长得不像[daddy]。难道你不想对这个问题有个答案吗？] 她笑了。");
         outputText("[pg]你心不在焉地点了点头，问她的努力是否已经结出了果实。");
         if(get_player().get_gender() != 0)
         {
            outputText("[pg]她叹了口气。[say: 到目前为止，什么都没有。不过你的帮助确实让我离找出原因更近了一步。我希望我能指望你继续支持我？]");
            outputText("[pg]你告诉她你会尽力的。");
         }
         else
         {
            outputText("[pg]她耸了耸肩。[say: 遗憾的是，我没有任何样本可以用来研究，这就是为什么我请求你的帮助。所以如果你想帮我，就告诉我。别担心，我会帮你提取样本的。我想我在……提取……样本方面还是很有技巧的。] 她自信地笑了。");
            outputText("[pg]你告诉她，你还在考虑，但你一定会好好考虑的。");
         }
         outputText("[pg][say: 谢谢。现在，还有什么事吗？]");
         talkToLiana(false);
      }
      
      public function talkToLianaAboutHerJob() : void
      {
         clearOutput();
         outputText("你问了她的工作，包括为乌尔塔工作以及她以后打算做什么。");
         outputText("[pg]她深吸了一口气。[say: 嗯，为乌尔塔工作真的是天赐良机。我有住的地方，有吃的，工作相对轻松，而且我还能在房间里继续学习炼金术。另外，乌尔塔人很好，她对我很好。] 你注意到她似乎很真诚，并示意她继续说下去。");
         outputText("[pg][say: 至于未来……我一直对炼金术很着迷。我相信我有这方面的天赋，所以这就是我想做的事情。仅此而已。] 她耸了耸肩。你花了一点时间思考，为什么这个世界上的这么多人似乎都对魔法和化学的怪异现象着迷，即使恶魔们正在利用这些东西做坏事，但你觉得没必要再问下去了。");
         outputText("[pg][say: 还有别的事吗？]");
         talkToLiana(false);
      }
      
      public function talkToLiana(param1:Boolean = true) : void
      {
         if(param1)
         {
            clearOutput();
            outputText("你告诉她你想和她谈谈。她推了推眼镜。[say: 哦？谈什么？]");
         }
         menu();
         addButton(0,"她的工作",talkToLianaAboutHerJob);
         addButton(1,"她的研究",talkToLianaAboutHerResearch);
         if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,807) + FlagDict_Impl_.arrayReadInt(KFLAGS.flags,808) > 0)
         {
            addButton(2,"她的喷雾",talkAboutLiannasLubeSpray);
         }
         if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,811) > 0)
         {
            addButton(3,"副作用",lubeSpraySideEffects);
         }
         addButton(14,"返回",visitTheHouse);
      }
      
      public function talkAboutLiannasLubeSpray() : void
      {
         clearOutput();
         FlagDict_Impl_.arrayWriteInt(KFLAGS.flags,811,1);
         outputText("你问她为什么她分泌的是一种润滑液，而不是像你想象中臭鼬那样分泌有毒液体。");
         outputText("[pg]她尴尬地移开视线，脸颊上泛起红晕" + (get_noFur() ? "" : "，在白色的皮毛下若隐若现") + "。[say: 嗯，我的喷雾有点问题……] 她停止了说话。你口头鼓励她，让她继续讲下去。");
         outputText("[pg][say: 哦？抱歉。] 她清了清嗓子，调整了一下视线。[say: 我很难控制我的喷射反射，这让我陷入了非常尴尬的境地。所以我试图借助炼金术来控制我的反射，虽然大部分时间都有效，但结果却完全中和了我的气味诱导激素。所以我剩下的只有这种看起来很滑的液体。] 她把手伸进裤子里，在屁股后面摸索了一下，然后抽出两根沾满滑液的手指，向你展示那种粘稠的液体。[say: 它作为润滑剂效果很好，而且我也不太为失去难闻的喷雾而难过。反正我也用不上它。] 她耸了耸肩。[say: 我试着分析过我的喷雾，得出的结论是，如果经过蒸馏，它可能会有一些神奇的属性……可能是我乱搞自己身体的副作用，但只有在浓度非常高的情况下才有效。]");
         outputText("[pg]她一直在自己的身体上做实验？你问她，这难道不显得有些鲁莽吗。");
         outputText("[pg]她耸了耸肩。[say: 也许吧，但我也没别人可以用来测试我的实验了。我确实因为实验遭受了一些副作用，但一切都好……我想是的。]");
         outputText("[pg]这听起来还是有点傻，但你觉得轮不到你来说教。");
         outputText("[pg]解释完后，她推了推眼镜问道，[say: 还有别的事吗？]");
         talkToLiana(false);
      }
      
      public function talkAboutLiana() : void
      {
         clearOutput();
         outputText("你告诉乌尔塔，你需要和她谈点事情。");
         outputText("[pg][say: 怎么了，[name]？]这位长着肉棒的狐女礼貌而疑惑地回应道。");
         if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,808) > 0 || FlagDict_Impl_.arrayReadInt(KFLAGS.flags,807) > 0)
         {
            outputText("[pg]你向乌尔塔坦白，你没忍住诱惑，答应帮莉安娜做一些私人实验……那些实验需要她提取你的体液样本。");
            outputText("[pg]乌尔塔摆摆手，打消了你的顾虑。[say: 别担心那个，[name]。在你去之前，我和莉安娜聊过，她在找你帮忙做实验之前已经征求过我的同意了。]她狡黠地对你笑了笑。[say: 除非……你去找她不仅仅是为了帮她做实验，对吧？]你告诉她你没有。[say: 很好……因为如果你越界了，我可能就得惩罚你了。]她轻轻点了点你的鼻子。");
         }
         else
         {
            outputText("[pg]你向乌尔塔解释说，住在她屋檐下的那位准炼金术士告诉你，她想提取你的体液“样本”用于她的实验。");
            outputText("[pg]乌尔塔听到这话笑了。[say: 去吧，如果你帮她，我不会生气的。]你问她为什么会这样。[say: 在你们俩见面之前，我和她聊过，她对你挺感兴趣的，所以我说如果她找你帮忙也没关系。]你注意到，她对这个想法接受得相当好。[say: 只要记住你只是在<b>帮忙</b>做她的实验。所以除非你在这件事上越界，否则我是可以接受的。]她狐疑地打量着你。[say: 你没想过把这事发展得更进一步吧？]你决定除了“没有”之外，给出任何其他答案都不明智，于是你告诉她你没有。[say: 很好。]她坚定地点了点头。");
         }
         outputText("[pg]你问乌尔塔她到底是怎么找到莉安娜这个潜在的保姆的。仔细想想，她是在哪儿找到她的？");
         outputText("[pg][say: 我让几个手下发了广告，寻找任何感兴趣的人。因为你住在城外，而我又是守卫队队长，我真的很需要一个能住在家里的人。以防万一发生什么事。]她点点头，得意地笑了。[say: 我收到了一些感兴趣的人的联系方式，并安排了几次面试，莉安娜是其中最出色的。]然后她补充道。[say: 而且她也很可爱。]你忍不住指出，这显然在其中起了一定作用。");
         outputText("[pg]然后你问乌尔塔是否真的那么愿意把孩子们的安全托付给莉安娜。她身上有些地方感觉不太对劲——她想做的那些实验给你一种险恶的感觉……[saystart]老实说……有时候我也有同感，亲爱的。但相信我，我把她的背景查了两遍，除了几次小事故，她从来没有制造过任何会伤害别人的东西，而且她还曾受教于一位著名的炼金术士。虽然你可能很难注意到，但我很清楚，我们的孩");
         if(urtaKids() > 1)
         {
            outputText("子们在");
         }
         else
         {
            outputText("子在");
         }
         outputText("她心里有着特殊的地位。[sayend]");
         outputText("[pg]无论你还有什么疑虑，乌尔塔显然很信任她。你决定最好告诉她，你会尽量相信乌尔塔在这件事上的判断；毕竟，和莉安娜这样的人打交道，更是她的工作，而不是你的。");
         outputText("[pg][say: 谢谢你，亲爱的。我相信你会明白我选她是有充分理由的，而且我会密切关注她的。]她对你眨了眨眼。[say: 那么失陪了，我想我得去看看她，回头见？]乌尔塔吻别了你，离开了酒吧。你目送她离去，给自己点了一杯酒在路上喝，然后自己也出发了。");
         doNext(get_camp().returnToCampUseOneHour);
      }
      
      public function takeTheKidsForWalk() : void
      {
         clearOutput();
         outputText("[say:你想见见" + urtaKidsText("him","her","them") + "？当然可以，但我得先给" + urtaKidsText("him","her","them") + "准备一下。]你问她打算把" + urtaKidsText("him","her","them") + "带到哪里去。");
         outputText("[pg][say:我只是带" + urtaKidsText("他","她","他们") + "去散散步。孩子们有时候也需要呼吸新鲜空气，]莉安娜一本正经地说着，走出厨房，朝后院走去。");
         outputText("[pg]你建议不如由你带" + urtaKidsText("他","她","他们") + "去散步。[say:你确定吗？" + urtaKidsText("小孩子","小孩子","小孩子们") + "有时候挺难对付的……不过你的孩子通常都很乖。]你坚持说你想这么做；" + urtaKidsText("他","她","他们") + "可能也会喜欢有你陪着。[say:好吧，我去给" + urtaKidsText("他","她","他们") + "准备一下，你就可以带" + urtaKidsText("他","她","他们") + "走了。]");
         outputText("[pg]确保你的孩子");
         if(urtaKids() > 1)
         {
            outputText("们");
         }
         outputText("穿着适合在沙漠城市里闲逛的衣服后，你领着你的小家伙");
         if(urtaKids() > 1)
         {
            outputText("");
         }
         outputText("出门来到街上。[say:" + urtaKidsText("我","我","我们") + "能买点冰淇淋吗？！]");
         if(urtaKids() > 1)
         {
            outputText("[say:对啊，我们可以买吗，[daddy]？！]");
         }
         outputText("你的孩子");
         if(urtaKids() > 1)
         {
            outputText("们恳求道");
         }
         else
         {
            outputText("恳求道");
         }
         outputText("。好吧，集市上的摊贩那里应该是个足够远的目的地，这能给莉安娜留出充足的独处时间，而且你自己也不介意吃点冰淇淋，所以就这么定了。[say:好耶！你是世界上最好的[dad]！]");
         if(urtaKids() > 1)
         {
            outputText("一阵兴奋的欢呼声响起。");
         }
         else
         {
            outputText("一声兴奋的欢呼声响起。");
         }
         outputText("面对这样");
         if(urtaKids() == 1)
         {
            outputText("一张开心的脸庞");
         }
         else
         {
            outputText("几张开心的脸庞");
         }
         outputText("抬头看着你，很难不想去配得上这个称呼。");
         outputText("[pg]你沿着蜿蜒的小路前往集市，确保时刻警惕地盯着你好奇的孩子，以免" + urtaKidsText("他","她","他们") + "跑掉惹出太多麻烦。一些认出你的居民，哪怕只是认出你是乌尔塔的伴侣，也会向你致意。");
         outputText("[pg]最终你到了集市；这个时间点并不熙熙攘攘，这让你更容易照看你的孩子，因为");
         if(urtaKids() > 1)
         {
            outputText("他们散开并好奇地检查");
         }
         else
         {
            outputText(urtaKidsText("他","她","") + "跑开去好奇地检查");
         }
         outputText("各种农产品、服装和小饰品摊位。然而，" + urtaKidsText("他知道","她知道","他们知道") + "自己是来干什么的，并没有给你太多闲逛的机会，一只" + (get_noFur() ? "小手抓住了你的手" : "毛茸茸的爪子抓住了你的手") + "，把你拖向藏在集市一个阴凉避风处的冰淇淋店。一进去，你四下打量，而你的孩子");
         if(urtaKids() > 1)
         {
            outputText("们");
         }
         outputText("跑");
         if(urtaKids() == 1)
         {
            outputText("");
         }
         outputText("上前，把");
         if(urtaKids() == 1)
         {
            outputText("es");
         }
         outputText("" + urtaKidsText("他的脸","她的脸","他们的脸") + "贴在柜台结霜的玻璃上，期待得几乎要流口水了。这家店一定有什么魔法元素，才能在沙漠中央保持冷饮的低温。店主探身越过柜台向你打招呼，这似乎证实了你的猜测。");
         outputText("[pg]他是一个高大瘦长的狼人，" + (get_noFur() ? "毛茸茸的尾巴" : "皮毛") + "是灰白色的，眼睛是清澈的浅蓝色，穿着一件绣着各种雪花的袍子。[say:我一眼就能认出" + (get_noFur() ? "那些尾巴" : "那身皮毛") + "！这肯定是乌尔塔的孩子吧？]他问你，你给出了肯定的回答。[say:那这顿就算我请了，毕竟好心的队长为我们做了那么多，这是我最起码能做的！]运气真好！你和你的孩子");
         if(urtaKids() > 1)
         {
            outputText("们");
         }
         outputText("挑选口味，店主则把冰淇淋舀到威化蛋筒上。等他弄完，你向这只狼道谢，然后离开了商店，身后跟着你的");
         if(urtaKids() > 10)
         {
            outputText("大群");
         }
         outputText("孩子");
         if(urtaKids() > 1)
         {
            outputText("们");
         }
         outputText("。");
         outputText("[pg]你的孩子");
         if(urtaKids() > 1)
         {
            outputText("们");
         }
         outputText("没有费心去等待或细细品味他们的冰淇淋，你也没有，在这片沙漠里走来走去真是热得要命。惹麻烦的理由也少了，" + urtaKidsText("他","她","他们") + "的脸");
         if(urtaKids() == 1)
         {
            outputText("埋在蛋筒里");
         }
         else
         {
            outputText("们埋在他们的蛋筒里");
         }
         outputText("和你的脸一样，贪婪地舔着融化的水滴。");
         get_player().refillHunger(20,false);
         outputText("当你回到乌尔塔的家时，蛋筒只剩下一小块了，你一进门就迅速把它吃光了。[say:哦，嘿。你回来了。]莉安娜用她一贯面无表情的方式向你打招呼。");
         outputText("[pg][say:怎么样了？]");
         outputText("[pg]一切顺利，你回答道。你们" + Utils.num2Text(urtaKids() + 1) + "个人在路上停下来吃了一些冰淇淋。[say:很好，现在去吧。洗澡时间到了，]她说着，把你的小狐狸");
         if(urtaKids() > 1)
         {
            outputText("es");
         }
         outputText("赶向浴室。传来" + urtaKidsText("一声尖锐的抗议","一声尖锐的抗议","一阵尖锐的抗议声") + "，但" + urtaKidsText("他","她","他们") + "显然明白");
         if(urtaKids() == 1)
         {
            outputText("");
         }
         outputText("莉安娜不是好惹的，所以" + urtaKidsText("他","她","他们") + "乖乖走向");
         if(urtaKids() == 1)
         {
            outputText("");
         }
         outputText("浴室。你忍不住注意到莉安娜是多么擅长让孩子们听她的话。");
         outputText("[pg]既然臭鼬女自己去洗澡了，你决定悄悄离开。");
         get_player().changeFatigue(10);
         doNext(get_camp().returnToCampUseOneHour);
      }
      
      public function stayToPlay() : void
      {
         var _loc1_:* = null as IMap;
         clearOutput();
         outputText("你点头接受。乌尔塔高兴地笑了。[say: 请坐，请随便坐——我去拿，]她开心地说，摇着尾巴漫步走向厨房。");
         if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,806) == 0)
         {
            _loc1_ = KFLAGS.flags;
            FlagDict_Impl_.arrayWriteInt(_loc1_,806,FlagDict_Impl_.arrayReadInt(_loc1_,806) + 1);
            outputText("[pg]莉安娜走到你身边。[say: 我猜你从来没吃过乌尔塔做的饭？]她问。你一开始困惑地看着她，但摇了摇头，确认你真的没有吃过。");
            outputText("[pg]莉安娜点点头。[say: 拿去吧，这个你留着。]她递给你一个小药瓶。标签上写着：[say: 专治剧烈胃痛。]……乌尔塔的厨艺不可能这么糟吧？你问莉安娜她这是什么意思。");
            outputText("[pg][say: 我尽力了，[name]。但有些事情连玛莱也无能为力。]她随口答道，转身走进了厨房。");
            outputText("[pg]你坐了下来，对即将发生的事情感到恐惧。乌尔塔端着一个大盘子走了过来。[say: 来啦，]她说道，声音里带着一丝勉强的欢快。当她把盘子放在桌上时，你不得不承认它看起来……嗯，并没有莉安娜让你想象的那么糟。虽然有些地方烤焦了，但还不至于有毒。");
            outputText("[pg]你试探性地咬了一口，仔细咀嚼。嗯……没那么糟……这是你失去意识、眼前一黑前脑海中闪过的最后一个念头。你隐约能听到乌尔塔焦急的呼喊声，她和莉安娜正试图把你扶起来。片刻之后，你感觉到一种舒缓清凉的液体被按在你的嘴唇上，你顺势喝了下去。");
            outputText("[pg]力量回到了你的四肢，你发现自己又能站起来了。你环顾四周；莉安娜正拿着她之前递给你的药，而乌尔塔看起来快要哭了。[say: 对不起！]她哀嚎着，紧紧地把你抱在胸前。[say: 我——我只是想做点特别的，想给你留个好印象，我不知道我做错了什么，我平时做饭没问题的！]她说着，羞愧和悲伤的泪水夺眶而出。莉安娜只是心照不宣地盯着你们俩，仿佛在说[say: 早就告诉过你了。]");
            outputText("[pg]你回抱住她，坚持说你现在没事了……你觉得。然后你担忧地问她是不是一直给你的孩子喂这个");
            if(urtaKids() > 1)
            {
               outputText("们");
            }
            outputText("？[say: 不，当然不是！]她说道，语气中交织着心碎和愤怒。[say: 不过平时都是莉安娜做饭的……哦，[name]，真的很对不起！]她抽泣着。莉安娜咳嗽了一声，你和乌尔塔都看向她。[say: 抱歉打扰一下，但饭菜要凉了。]乌尔塔茫然地盯着她，然后点了点头。[say: 麻烦你去端过来吧，莉安娜，]她有些冷淡地说。");
            outputText("[pg]与乌尔塔的厨艺相比，莉安娜做的简直是人间美味。这完全出乎你对这位奇怪的臭鼬炼金术士的预料。看来，尽管她在炼金术方面有很多疯狂的想法，但至少在烹饪上还是遵循了良好的做法。你津津有味地吃着，脸上抑制不住地露出了笑容。");
            get_player().refillHunger(65);
            outputText("[pg]乌尔塔轻哼了一声，带着些许不屑；很明显，她嫉妒保姆的厨艺比她好那么多。");
            outputText("[pg]你吃完饭，起身准备把盘子拿到厨房，这时莉安娜拦住了你。[say: 我来吧，]她说着，从你手中接过盘子，然后继续去收其他人的。你感谢乌尔塔的邀请，吻了她一下，然后告诉她你该走了。[say: 谢谢你，亲爱的。]");
            get_player().changeFatigue(-10);
            get_player().takeDamage(10);
            doNext(get_camp().returnToCampUseOneHour);
         }
         else
         {
            outputText("[pg]你向莉安娜招手示意她过来。她走上前，还没等你开口，就又递给你一瓶药。你向她道谢。[say: 不客气，]她只是简单地说了一句，便消失在厨房里。");
            outputText("[pg]你坐下来，拔掉软木塞，一口气把药喝了下去。乌尔塔端着她的菜羞涩地走了过来，[say: 好了，我想我已经弄清楚上次哪里出错了；请尝一口这个，]她恳求道。尽管她这么说，但你注意到这次她只给了你一小盘食物。");
            outputText("[pg]你再次试探性地咬了一口，仔细咀嚼。味道没那么糟，但当它落入胃里的那一刻，你感到一阵灼烧感，就像一千个地狱的烈火在燃烧。你痛苦地做了个鬼脸，乌尔塔沮丧地叹了口气。[say: 又失败了……好吧，莉安娜，把真正的午餐端出来吧，]她闷闷不乐地吩咐道。你试图让乌尔塔振作起来，告诉她总有一天她会成功的……也许吧。[say: 你真的这么认为吗？]她犹豫地问，语气中带着一丝希望。你点点头……虽然你怀疑自己是否真的应该鼓励她……");
            outputText("[pg]莉安娜的厨艺再次让人觉得是人间美味。一个能想出那么多疯狂实验的人居然会做饭，而且还做得这么好吃，真是个奇迹。你发现自己边吃边笑。乌尔塔看着你吃下的每一口，显然很嫉妒，也对自己不能像雇来的帮手那样做饭感到生气。");
            outputText("[pg]你吃完后，莉安娜开始收拾碗碟。你对填饱的肚子感到满意，吻了乌尔塔，然后朝特尔阿德雷的街道走去。乌尔塔给了你一个尴尬的微笑，拍了拍你的背，然后让你离开了。");
            get_player().changeFatigue(-10);
            get_player().takeDamage(10);
            doNext(get_camp().returnToCampUseOneHour);
         }
      }
      
      public function stayForHorseDickings() : void
      {
         clearOutput();
         outputText("你也打了个哈欠，建议说也许乌尔塔需要人陪。你自己也有点困了。她坏笑着靠在床上，[say: 随便你，亲爱的——我这儿有的是地方给你抱，]她轻轻拍着肿胀的肚子，咯咯地笑着。");
         outputText("[pg]你和她一起跳上床，把装满她体液的瓶子收起来。[say: 我不知道我要拿那个怎么办，但我会想出办法的，]她说道。你抱住这只双性狐狸兽人，轻轻拍着她的肚子，然后找了个舒服的姿势躺下。她把你抱在怀里，一只手轻轻放在肚子上，让你的头靠在她的乳房上，然后叹了口气，闭上眼睛，让自己进入梦乡。");
         outputText("[pg]你让自己进入了安稳的睡眠，你的爱人和你未出生的孩子都让你感到温暖……");
         outputText("[pg]<b>一小时后……</b>");
         outputText("[pg]你打了个哈欠，伸了个懒腰，关节发出咔咔的响声。看来乌尔塔已经不在床上了，于是你决定叫她。");
         outputText("[pg]你等了一会儿，但没有得到回应。这时你注意到了她留给你的便条。");
         outputText("[pg]“抱歉你醒来时我没能陪在你身边——你睡着的样子真可爱，你知道吗？但我得去办点事，所以不得不先走了。下次你顺路过来时我们再见吧，不过走之前请把门锁好——离开前如果想吃点或喝点什么，请自便。”");
         outputText("[pg]你耸耸肩，找到衣服重新穿上。准备好后，你离开了公寓，并记得按照乌尔塔的要求锁上了门。");
         doNext(get_camp().returnToCampUseTwoHours);
         get_player().changeFatigue(-50);
      }
      
      public function stayAfterUrtaBirf() : void
      {
         clearOutput();
         outputText("当然，如果那是她想要的，你很乐意效劳。这只狐狸感激地对你笑了笑。[say: 你不会后悔的，[name]；我为我们计划了充实的一天，]她说完，调皮地咧嘴一笑，高兴地咯咯笑了起来。");
         outputText("[pg]你心领神会地看着她，想知道<i>充实的一天</i>到底意味着什么。");
         outputText("[pg]乌尔塔开心地笑了。[say: 哦，你知道的；一起吃顿美餐，去买些婴儿用品，也许再散个步，亲热一下……]她漫不经心地挥了挥手，声音渐渐小了下去。");
         outputText("[pg]你惊讶地眨了眨眼……你承认，她用那种充满暗示的语气说<i>充实</i>时，你其实想到了别的事情……");
         outputText("[pg]听到这话，这位新妈妈给了你一个邪恶的笑容。[say: 嘛，我可没说不能做爱……这让你改变主意了吗？]");
         outputText("[pg]当然没有！");
         menu();
         addButton(0,"继续",wakeUpWithUrtaAfterStaying);
      }
      
      public function sexWithLianna() : void
      {
         clearOutput();
         outputText("[say: 所以你想帮我做实验？太好了！]她拉起你的手，基本上是把你拽进了她的房间。你任由她牵着，心里琢磨着她到底在打什么算盘。");
         outputText("[pg]莉安娜毫不耽搁；她打开衣橱，差点把门从铰链上扯下来，然后跳了进去。过了一会儿，她披着一件白大褂出来了……而这也是她身上唯一的遮蔽物。你可以清楚地看到她的乳房，乳头在敞开的外套下若隐若现，她的下半身完全暴露在外，让你在看着她迈着充满性感的熟练步伐走动时，目光不由自主地落在她粉嫩紧致的小穴上。她的每一步都让丰满的臀部随之摇曳，而她身后同样摇摆的尾巴更是放大了这种摇曳感，那条尾巴上奢华的" + (get_noFur() ? "头发" : "皮毛") + "被梳理得完美无瑕。");
         if(get_player().cockTotal() > 1)
         {
            outputText("你的下半身突然感觉紧绷起来。");
         }
         outputText("[pg][say: 你怎么还穿着衣服？]她问道，似乎真的很好奇你为什么这么慢。你赶紧脱下你的[armor]，将赤裸的身体展现在这只急不可耐的臭鼬面前。");
         if(get_player().get_gender() == 0)
         {
            outputText("[pg]你低头看着地板，指出你现在缺乏能够为莉安娜提供任何“捐赠”的器官。");
            outputText("[pg][say: 没问题；我还有另一个实验能解决这个问题。]莉安娜轻快地回答道。[say: 我的这种混合药剂保证能让你从无性变成有性，而且不会产生腐化……唯一的问题是它有点不稳定。我的意思是，无法预测你会变成什么性别，]她急忙补充道。");
            menu();
            addButton(0,"接受",acceptARandomGenderFromASkunk);
            addButton(1,"拒绝",refuseGenderlessInjection);
            return;
         }
         if(get_player().get_gender() == 3)
         {
            outputText("[pg][say: 扶他，是吗？真有趣。我一定会把这记录在我的实验里。]她双臂交叉。[say: 那么你要用哪部分来帮我呢？]");
         }
         menu();
         addButtonDisabled(0,"采集女性","这个场景需要你拥有阴道。你不能怀孕。");
         addButtonDisabled(1,"采集男性","这个场景需要你拥有阴茎。");
         if(get_player().hasVagina())
         {
            if(get_player().get_pregnancyIncubation() == 0)
            {
               addButton(0,"采集女性",getEggsHarvested);
            }
            else
            {
               outputText("[pg]<b>在你的子宫清空之前，她不愿意和你做爱。</b>");
            }
         }
         if(get_player().hasCock())
         {
            addButton(1,"采集男性",liannaHandjobbies);
         }
         addButton(14,"返回",visitTheHouse);
      }
      
      public function rubUrtaPussy() : void
      {
         clearOutput();
         outputText("你决定，她说的“她”只能是指她的小穴。于是你伸出手臂，假装要去抓她的肉棒，然后摸索到她" + (get_noFur() ? "" : "毛茸茸的") + "蛋蛋下面，找到她那等待着的裂缝，轻轻触摸和按摩她的阴唇，用小小的捏掐挑逗她的阴蒂，把她的湿润从她那流着口水的蜜罐里逼出来。她发出一声惊讶的叫喊，然后笑了，[say: 这其实不是我想要的……哦！但我没有抱怨……]");
         outputText("[pg]你准备好两根手指，插入她的深处，在里面扭动，寻找她最敏感、最舒服的地方。她在座位上呻吟着，扭动着，尽管她的肚子像现在这样沉重，但她显然很享受你的服侍。她的马屌抽搐着，跳动着，尽管你没有注意到，但它跳动的方式表明，无论你要做什么，高潮都迫在眉睫……你又赞赏地捏了几下她的阴蒂，然后退后一步，看着这一幕的展开。");
         urtaMassageClimax();
      }
      
      public function rubUrtaDick() : void
      {
         clearOutput();
         outputText("你决定她可能指的是她的肉棒。她把自己的男性部分也称为“她”有点奇怪，但你耸耸肩，伸出手抓住她的肉棒，轻轻挑逗着她那张开的冠状沟顶端的精液泡。她发出一声淫荡的呻吟，将臀部向上挺起，渴望得到更多的刺激。[say: 哦，是的，爱人……你让那个地方感觉很好……]");
         outputText("[pg]你的手慢慢地沿着她海绵状的肉棒滑动，手指在每一根凸起的静脉上碰撞，直到到达她那聚拢的包皮才停下来，用羽毛般柔软的触摸挑逗着它。她喘息着，颤抖着，预精喷涌进膨胀的乳胶泡中，由于里面精液的重量，它已经开始溢出并从她的鸡巴顶端垂下来。");
         outputText("[pg][say: 爱人……我……]她喘息着，呜咽着，她的鸡巴明显地跳动着；当你把手指放在上面时，你能感觉到血液在里面奔流，看到它在期待射精时颤抖……你放开她的肉棒，退后一步，看着这一幕的展开。");
         urtaMassageClimax();
      }
      
      public function refuseGenderlessInjection() : void
      {
         clearOutput();
         outputText("听到你的拒绝，莉安娜的脸沉了下来，但她还是叹了口气。[say: 好吧，我能理解；我的意思是，你肯定有你的理由。不过，如果你以后有了性别，记住我很乐意用你的一些种子，拜托了。]");
         outputText("[pg]你答应会记住的，虽然并不一定是真心的，然后默默穿好衣服离开；你能看出来，你留在这里已经没有意义了。");
         doNext(get_camp().returnToCampUseOneHour);
      }
      
      public function preggoUrtaSmexOrSomething() : void
      {
         clearOutput();
         outputText("你告诉乌尔塔，如果她想的话，你很乐意帮她发泄一下。");
         outputText("[pg]乌尔塔淫荡地咧嘴笑了，先头汁");
         switch(get_pregnancy().get_event())
         {
            case 7:
               outputText("湿漉漉地滴在地板上");
               break;
            case 8:
            case 9:
               outputText("溅入快满的桶里");
               break;
            default:
               outputText("弄脏了她的裙子");
         }
         outputText("。[say: 真的吗？太好了，因为我确实需要释放一下……我们回我家去吧，好吗？]她开始直起身子，你见状赶紧上前搭把手。她微笑着感激地吻了你，让你感觉到她隆起的肚子和肉棒紧紧贴着你。[say: 那么……带路吧，亲爱的，]她柔声说道。");
         outputText("[pg]你带着她穿过熟悉的街道，走向她的公寓，急切地等着她开门进去。乌尔塔一边摸索钥匙一边咯咯地笑。[say: 我想我们俩都留下了一长串痕迹……]她说道，门也随之打开。然后她转向你，饥渴地吻着你，先头汁湿漉漉地抹在你的肚子上。她有些笨拙地松开你，眼中带着饥渴的神色，转身漫步走进门内，一边走一边已经开始脱衣服了。");
         outputText("[pg]你毫不耽搁，脱下衣服，把你的[armor]扔在沙发上，然后跟了进去。当你打开门时，映入眼帘的是乌尔塔慵懒地靠在枕头上，双腿张开，让你清楚地看到她跳动的肉棒、睾丸和滴着淫液的小穴。[say: 那么，性感宝贝，你想对你发情的怀孕狐狸做些什么呢，嗯？]她柔声说道。");
         menu();
         addButton(0,"按摩她",massagePregnantUrtasBelly);
         addButton(1,"乳房崇拜",urtaBoobWorshipScene);
         addButton(2,"吸奶",nurseFromMommaUrtasBooBees);
         addButton(3,"挤奶",milkPregnantUrta);
         if(get_player().hasCock())
         {
            addButton(4,"渴望",urtaPregCravings);
         }
         else
         {
            addButtonDisabled(4,"渴望","这个场景需要你有一根肉棒。");
         }
      }
      
      public function preggoUrtaGivingBirth() : void
      {
         var _g:UrtaPregs;
         clearOutput();
         get_pregnancy().knockUpForce();
         FlagDict_Impl_.arrayWriteInt(KFLAGS.flags,802,0);
         FlagDict_Impl_.arrayWriteInt(KFLAGS.flags,810,0);
         outputText("当你开始准备安顿下来过夜时，你察觉到一阵骚动正稳步向你靠近。你准备好战斗，走向营地的边界。在那里，一个穿着镶钉皮上衣的半人马正烦躁地跺着蹄子。[say:[name]！你是[name]吗？]他一看到你就大喊道。");
         outputText("[pg]你回答说是，并问他是谁，想要什么。[say:我是特尔阿德雷的信使！乌尔塔队长派我来找你——她在医院里。]他急切地回答。[say:求你了，你必须跟我走——她要生了；孩子要出生了！]");
         menu();
         _g = this;
         addButton(0,"去",function():void
         {
            _g.goVisitUrtaBirfs();
         });
         addButton(1,"拒绝",IAintGotTimeForUrtaBirfs);
      }
      
      public function pickKidSceneHere() : void
      {
         clearOutput();
         if((get_pregnancy().get_type() == 25 || get_player().get_pregnancyIncubation() < 300 && get_player().get_pregnancyType() == 21) && FlagDict_Impl_.arrayReadInt(KFLAGS.flags,810) == 0)
         {
            newBabyComing();
         }
         else if(get_game().time.hours >= 12 && get_game().time.hours <= 14)
         {
            hugAttackScene();
         }
         else if(Utils.rand(2) == 0)
         {
            takeTheKidsForWalk();
         }
         else
         {
            bathtime();
         }
      }
      
      public function partTwoOfUrtaBoning() : void
      {
         clearOutput();
         outputText("你睁开眼睛，凝视着乌尔塔微笑的脸庞。[say: 早上好，亲爱的。睡得好吗？]她调皮地逗你。你对她微笑，伸展身体，终于意识到了身体的其他部分。你痛苦地退缩了一下，因为你被虐待的屁股对你的动作发出了抗议，你的腹部散发出一种奇怪的重量。你的肚子明显圆鼓鼓的，里面装满了你想象中你的狐狸情人射入的许多精液。乌尔塔轻轻地揉了揉你的肚子，似乎在认真研究你和她鼓起的肚子。[say: 我觉得我的还是比较大，]她带着些许尴尬的咯咯笑声说道。");
         get_player().refillHunger(100);
         if(get_player().cockTotal() > 1)
         {
            outputText("[pg][EachCock]完全勃起，痛苦地指向乌尔塔的开口。");
            if(!get_player().isTaur())
            {
               outputText("如此之近，你几乎能感觉到它贴着你的[cockHead]的热度。");
            }
            outputText("[say: 哦，别觉得尴尬；我知道带着晨勃醒来是什么感觉，]她打趣道，显然对你勃起的状态毫不介意。");
         }
         if(get_player().hasVagina())
         {
            outputText("[pg]你的[vagina]在刚才的欢愉后依然湿润，嫉妒地颤抖着，因为你的[ass]在几分钟前刚刚享受了美味的抽插。考虑到她的肚子，乌尔塔有些笨拙地弯下腰，熟练地轻轻抚摸你的小穴，对你的反应自信地笑了笑。[say: 也许我很快就该操操这个洞了，嗯？]她开玩笑道。");
         }
         outputText("[pg]她看着你的眼睛，脸上带着关切。[say: [name]……我……我很抱歉对你做了那些事。我只是太压抑了，被荷尔蒙逼疯了；你真的帮了我大忙，而且真的、真的感觉很好，但我还是应该对你更温柔些。你感觉还好吗？]");
         if(get_player().analCapacity() < 40)
         {
            outputText("[pg]你抱怨说你的屁股很疼；你绝对承受不了她刚才给你的那种猛烈抽插，你毫不怀疑你至少会酸痛几天。");
         }
         else if(get_player().analCapacity() < 60)
         {
            outputText("[pg]你告诉她，虽然你对肛交并不陌生，但你还是会感受到你们这次小幽会带来的后果，至少会持续几天。她真的把你的屁股操得够呛。");
         }
         else
         {
            outputText("[pg]你相当松弛，但你的屁股还是很疼。你无法亲眼看到，但你毫不怀疑她是不是把你操破皮了，因为感觉确实如此。");
         }
         outputText("[pg][say: 哦，亲爱的……]她把你抱回她的胸前。[say: 我很抱歉，爱人……]她突然邪恶地对你笑了笑。[say: 要我亲亲它让它好点吗？]她用舞台上的耳语问道。你对这个提议好奇地挑了挑眉，想知道她到底打算怎么亲亲它让它好点。她没有回答——至少没有口头回答。相反，她撅起嘴唇，伸出舌头，发出淫荡、湿润、吧唧吧唧的声音，在空气中舔了舔，然后把它放回嘴里。你恍然大悟，明白了她到底打算怎么让你感觉好点。她是在向你提议毒龙钻。");
         menu();
         addButton(0,"接受",acceptUrtaRimJobbies);
         addButton(1,"拒绝",declineARimJob);
      }
      
      public function nurseFromMommaUrtasBooBees() : void
      {
         clearOutput();
         outputText("你看着乌尔塔那饱满滴奶的乳房，心不在焉地舔了舔嘴唇。乌尔塔顺着你的目光看去，给了你一个会意的微笑。[say: 你知道，不管我挤出多少奶，我似乎总是马上又会涨满……我想知道这是否是塔奥斯所谓的临别礼物的功劳，]她自言自语道。");
         if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,805) == 0)
         {
            outputText("[pg][say: 但是，不管怎样，你是不是有点太成熟了，不该对这个感兴趣，嗯？]她逗弄着你。");
            outputText("[pg]你只是用你最擅长的狗狗眼看着她。她坏笑了一下，然后夸张地叹了口气。[say: 哦，好吧；反正如果我自己挤出来也是浪费——如果你真的那么想尝尝狐狸奶，那又有什么坏处呢？]她摇晃的尾巴表明她其实也很感兴趣。");
            outputText("[pg]你冲她咧嘴一笑，示意她找个舒服的姿势。");
         }
         else
         {
            outputText("[pg][say: 又渴了吗，亲爱的？] 乌尔塔用调情的语气轻声说道。你用力地点点头，渴望再次品尝这只母狐狸的乳汁。");
            outputText("[pg][say: 那么，为什么不过来尝尝呢？] 她笑道。");
         }
         outputText("[pg]乌尔塔轻轻地躺在床上，挪动身子给你腾出足够的空间，然后微笑着，小心翼翼地托起她的乳房，向你发出明确的邀请。");
         outputText("[pg]你毫不迟疑，在她身边坐下，抓住她递过来的乳房。你注意到有几滴乳汁似乎漏了出来，形成了一道细细的白色水流，你立刻用你");
         if(get_player().tongue.type == 1)
         {
            outputText("分叉的");
         }
         else if(get_player().tongue.type == 2)
         {
            outputText("恶魔般的");
         }
         else if(get_player().tongue.type == 3)
         {
            outputText("龙的");
         }
         outputText("舌头舔掉。乌尔塔发出一声愉悦的叹息，当你的舌头挑逗她过度敏感的黑色乳头时，她发出了轻柔的" + (get_noFur() ? "喘息" : "呜咽") + "声。注意到她似乎很享受你的舔舐，你继续这样做，在柔软的乳房上涂抹上一层薄薄的唾液，在两个乳房之间交替。");
         if(get_player().tongue.type > 0)
         {
            outputText("每舔几下，你就会用舌头卷住她的一个乳头，轻轻地拉扯，将一丝白色的美味直接挤到你的舌头上，这让双性狐狸兽人非常高兴。");
         }
         outputText("[pg]乌尔塔颤抖着呻吟，然后看着你，[say: 虽然这感觉很好，但并没有真的把它们排空，你知道的，]她指出。");
         outputText("[pg]你心领神会，决定将她的一个乳头含入嘴中，轻轻吸吮那小块肉突，随着一股细小的乳汁开始流入你的嘴里，你发出了愉悦的叹息。");
         outputText("[pg]乌尔塔在狂喜中呻吟，然后抱住你的头，轻轻地将你拉近她的乳房。[say: 我的大宝贝，] 她开玩笑地叫你。");
         outputText("[pg]你没有理会她的调侃，而是专注于吸吮她的乳房，以便获得更大的流量。她的乳汁温暖而美味，非常浓郁，比你习惯的要粘稠，但这都增加了它异国情调的味道。每一口都让你充满熟悉的温暖，她将你的头紧紧抱在怀里的方式让你感到舒适和放松。你注意到，她的乳汁有一种不可否认的甜味；这与你预期的相去甚远，但也同样令人愉悦。你在心里暗自发笑，乌尔塔是个酒鬼，你还以为她的乳汁尝起来会像酒，但看起来她确实在努力远离酒精，毕竟她怀孕了……");
         outputText("[pg]乌尔塔突然推开你的头，问道：[say: 抱歉，亲爱的，但我有两个乳房；你能帮帮另一个吗？] 你点点头，开始吸吮她的另一个乳房，用舌头按摩乳头并在周围舔舐。");
         outputText("[pg]你让自己沉浸在这项任务中，不久之后你感觉到有什么东西在戳你。乌尔塔淫荡地呻吟着，但什么也没说，而是留给你自己去弄清楚，你正被她勃起且滴着液体的马鞭戳着。你心想，这提供了一个有趣的机会……你是应该给她的肉棒撸几下，还是干脆不理它？");
         var _loc1_:IMap = KFLAGS.flags;
         FlagDict_Impl_.arrayWriteInt(_loc1_,805,FlagDict_Impl_.arrayReadInt(_loc1_,805) + 1);
         menu();
         addButton(0,"抚慰",titWorshipAndStroke);
         addButton(1,"无视",ignoreUrtaBonerWhenWorship);
      }
      
      public function noUrtaHouseSex() : void
      {
         clearOutput();
         outputText("你对她笑了笑，道了歉，表示你现在实在没心情。");
         outputText("[pg]乌尔塔失望地撅起嘴。[say: 哎呀，]她闷闷不乐地说。[say: 我都这么兴奋了……你真是个磨人的小妖精。]她叹了口气。[say: 好吧，你去忙你的吧……我只能坐在这里等它消停了。]");
         outputText("[pg]你保证改天再帮她解决。[say: 好吧，我可记住了，亲爱的，]乌尔塔向你保证。你给了这只狐狸一个充满爱意的吻，然后走出了酒吧。");
         doNext(get_camp().returnToCampUseOneHour);
      }
      
      public function noPlayTimeForKids() : void
      {
         clearOutput();
         outputText("你摇了摇头，告诉你的家人你很抱歉，但你必须走了。[say: 真的吗？好吧……但是，你至少应该待得够久，带点在路上吃。]乌尔塔坚持道。你告诉她你会没事的，但你肯定会找时间顺道来和他们一起吃饭。乌尔塔戏剧性地叹了口气，翻了个白眼，然后点点头笑了。[say: 好吧……只要确保你真的会来。]她告诉你，然后给了你一个快速的拥抱和亲吻。[say: 我们在外面很担心你；安全回家，]她说，然后放你走。");
         outputText("[pg]你给了你的爱人一个吻，并在走出去时挥手告别。");
         doNext(get_camp().returnToCampUseOneHour);
      }
      
      public function noNeedForTitMilkTodayUrta() : void
      {
         clearOutput();
         outputText("最好还是不要了。你亲吻了乌尔塔的脸颊，告诉她你真的该走了。[say: 亲爱的，你确定不留下来吃早餐吗？在桌上多添个盘子不麻烦的，]乌尔塔一边问，一边继续摇晃着宝宝。这个提议很诱人，但是……你摇了摇头。[say: 好吧，亲爱的；在外面注意安全，有空就回来找我们。]乌尔塔说着，在你悄悄离开屋子时，更加热情地抱紧了她的孩子。");
         doNext(get_camp().returnToCampUseOneHour);
      }
      
      public function noHelpForUrtaPreggoPC() : void
      {
         clearOutput();
         outputText("你抚摸着她的脸颊，然后平淡地说，[say: 不。]乌尔塔听到这话，竟然向你投来小狗般可怜的眼神，然后发出一声受伤的叹息。[say: 好吧，[name]；我想我最好回去工作了。现在你要照顾好自己；你现在可是带着个小家伙呢。]她责备你。");
         doNext(get_camp().returnToCampUseOneHour);
      }
      
      public function noBathTiemPlease() : void
      {
         clearOutput();
         outputText("[say: 我明白了，既然如此，失陪了，]她面无表情地说。看来你现在在这里没什么事了，所以你决定离开。");
         menu();
         addButton(0,"继续",get_telAdre().telAdreMenu);
      }
      
      public function noBathPleaseUrtaLian() : void
      {
         clearOutput();
         outputText("你礼貌地拒绝了她的邀请。[say:好吧，那你能帮我洗吗？]她问道。你稍微想了想，然后同意了；这要求也没什么大不了的，对吧？[say:谢谢，]她回答道，从浴缸里出来，坐在附近的一张小木凳上。[say:请用花精洗发水。]你点点头表示明白，跟着她爬出浴缸，拿起她指定的洗发水，走到她面前，问她需要用多少。[say:多弄点，]她回答道。");
         outputText("[pg]你耸耸肩，迅速在她肩膀上挤了一大坨液体肥皂，放下瓶子，然后开始按摩她那柔软、浓密的黑白相间的" + (get_noFur() ? "头发" : "覆盖全身的皮毛") + "。你问她感觉如何。[say:挺好的，不过再多搓搓我的上半背。]你开始抚摸和揉捏她的肩膀，尽力揉开她能感觉到的任何结节或紧绷感，并让她随时告诉你想要怎么按。[say:把下半背按完就行了。]你确认明白后，将手滑到她的后腰，在她的屁股上方徘徊，但绝不越界，因为她没有表现出任何想让你按那么低的迹象。最后，你宣布大功告成。她站起身伸了个懒腰，尾巴慵懒地摇摆着，然后转头看向你。[say:你确定不想让我帮你搓背吗？]");
         outputText("[pg]你告诉她你很确定；而且，你大概也该走了。[say:那好吧。]她走到淋浴间去冲洗。既然刚刚都在一起洗了，你觉得也没必要等，便跟在她后面。冲洗完毕并穿好衣服后，你礼貌地向臭鼬娘道别，然后离开了。");
         get_player().changeFatigue(-25);
         doNext(get_camp().returnToCampUseTwoHours);
      }
      
      public function newBabyComing() : void
      {
         clearOutput();
         outputText("你向你的");
         if(urtaKids() == 1)
         {
            outputText("孩子");
         }
         else
         {
            outputText(Utils.num2Text(urtaKids()) + "个孩子");
         }
         outputText("宣布，你和乌尔塔有重要的事情要告诉他们。");
         if(urtaKids() < 8)
         {
            outputText("[pg]当");
            if(urtaKids() == 1)
            {
               if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,795) >= 2)
               {
                  outputText("她");
               }
               else
               {
                  outputText("他");
               }
               outputText("靠近");
            }
            else
            {
               outputText("他们聚集");
            }
            outputText("并且好奇地看着");
            if(urtaKids() == 1)
            {
               outputText("");
            }
            outputText("着你，乌尔塔给了");
            if(urtaKids() > 1)
            {
               outputText("他们");
            }
            else if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,795) >= 2)
            {
               outputText("她");
            }
            else
            {
               outputText("他");
            }
            outputText("一个充满爱意的微笑。");
            if(get_pregnancy().get_type() == 25 && get_player().get_pregnancyType() == 21)
            {
               outputText("[pg][say: 你们的妈妈很快就会给你们添一个小弟弟或小妹妹了，]乌尔塔说着，给了你一个安慰的拥抱，同时还不忘拍拍你的肚子，甚至还用手指轻轻敲打着她自己的肚子。");
            }
            else if(get_pregnancy().get_type() == 25 || get_player().get_pregnancyType() == 21)
            {
               outputText("[pg][say: 你们很快就会有一个小弟弟或小妹妹了！]她高兴地笑着，拍了拍");
               if(get_pregnancy().get_type() == 25)
               {
                  outputText("她");
               }
               else
               {
                  outputText("你的");
               }
               outputText("肚子。");
            }
            outputText("[pg]你的孩子");
            if(urtaKids() > 1)
            {
               outputText("们");
            }
            else
            {
               outputText("是");
            }
            outputText("沉默了一会儿，消化着这个信息。然后");
            if(urtaKids() == 1)
            {
               outputText("一个小小的" + (get_noFur() ? "，可爱的" : "毛茸茸的") + "小家伙");
            }
            else
            {
               outputText("几个小小的" + (get_noFur() ? "，可爱的" : "毛茸茸的") + "小家伙");
            }
            outputText("正在做");
            if(urtaKids() == 1)
            {
               outputText("它");
            }
            else
            {
               outputText("他们");
            }
            outputText("尽力拥抱你们俩；");
            if(urtaKids() > 1)
            {
               outputText("他们");
            }
            else if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,795) >= 2)
            {
               outputText("她");
            }
            else
            {
               outputText("他");
            }
            if(urtaKids() == 1)
            {
               outputText("是");
            }
            else
            {
               outputText("是");
            }
            outputText("显然对这个消息感到高兴。你和乌尔塔相视一笑，越过");
            if(urtaKids() > 1)
            {
               outputText("他们");
            }
            else if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,795) >= 2)
            {
               outputText("她");
            }
            else
            {
               outputText("他");
            }
            outputText("的头顶");
            if(urtaKids() > 1)
            {
               outputText("");
            }
            outputText("，然后回抱，很高兴");
            if(urtaKids() > 1)
            {
               outputText("他们");
            }
            else if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,795) >= 2)
            {
               outputText("她");
            }
            else
            {
               outputText("他");
            }
            if(urtaKids() == 1)
            {
               outputText("是");
            }
            else
            {
               outputText("是");
            }
            outputText("对这个消息感到兴奋。");
         }
         else
         {
            outputText("[pg]你的孩子们发出一阵被逗乐的咯咯笑声，而他们中最大的那个叹了口气，双臂交叉，对你摇了摇头。[say: 我们又要有一个弟弟或妹妹了，对吧？]他们问道。");
            outputText("[pg][say: 呃，是的，没错，]乌尔塔回答，看起来有些局促。你的孩子们笑得更欢了，尽管那个发言的狐狸又叹了口气。[say: 你们俩什么时候才能吸取教训？有个小东西叫避孕套——你们应该试着用用。毕竟，我们知道你们有，]他们宣布，展示出那无疑是乌尔塔个人品牌的避孕套。");
            outputText("[pg]乌尔塔尴尬得满脸通红。[say: 把它给我——你还太小，不能玩那个！]她命令道，扑向那只年轻的狐狸兽人……那孩子立刻笑着跳开，然后跑了，他们的兄弟姐妹们笑着，乌尔塔在后面紧追不舍，留下你对你拼凑起来的这个奇怪家庭摇头叹息。");
         }
         FlagDict_Impl_.arrayWriteInt(KFLAGS.flags,810,1);
         doNext(get_camp().returnToCampUseOneHour);
      }
      
      public function milkPregnantUrta() : void
      {
         clearOutput();
         outputText("你告诉她你想玩她的玩具。乌尔塔微笑着点点头。[say: 当然，虽然我更喜欢……更私人的接触……。它们在那个柜子里，]她说完，指了指那个柜子。");
         outputText("[pg]你走到她指的地方，在柜子里翻找，想找点好玩的东西。最后你找到了一对吸乳器和一根连在机器上的类似长管的东西……也许是吸精器？你对乌尔塔露出一个狡黠的坏笑，问她这些是干什么用的。");
         outputText("[pg][say: 那个吸精器……嗯，基本上是为了尝试体验一下经常操小穴的感觉，]乌尔塔带着羞涩的神情承认道。[say: 吸乳器是附赠的，而且……嗯，我发现它们在乳头上感觉其实挺不错的。]然后她看了看自己，抚摸着滴水的乳头和肉棒。[say: 我想我可能需要用这两个东西好好挤一挤……]");
         outputText("[pg]你微笑着把两个玩具从柜子里拿出来，带到乌尔塔身边。你在她旁边坐下，放下玩具，然后揉了揉她的肚子。她呻吟着，发出类似狐狸呼噜声的声音，并露出痴迷的微笑。[say: 感觉真好，[name]，]你把手移向她的肉棒，轻轻地抚摸着。它漏出几滴前列腺液。她咯咯地笑着，身体抽搐着，但除此之外什么也没说，看着你动作，表现出十分享受的样子。最后你松开她的肉棒，伸手去摸她的乳房，抚摸着它们，扭动着她的乳头，看着一小股乳汁喷射出来。她大声呻吟，然后看起来有些不好意思。");
         outputText("[pg]这给了你一个主意。你问乌尔塔想不想玩点角色扮演。[say: 角色扮演……？我可不是天生的演员，但也许会很有趣，]她回答道，尾巴慢慢地摇晃着。");
         outputText("[pg]太好了，既然这样，你来当农夫，她来当需要挤奶的性感母牛。她对此看起来有点不确定，然后漫不经心地耸了耸肩。[say: 好吧……我该怎么做？]你向她解释，她基本上只需要顺着你的话做……表现得像头母牛就行了。");
         outputText("[pg]这只狐狸给了你一个非常困惑的眼神，但还是摇了摇尾巴，大声叫道：[say: 哞！像这样吗？]她问。你点了点头。");
         outputText("[pg]你抚摸着她的乳房，慢慢地按摩着。她哞哞叫着，摇晃着尾巴，显然已经明白她不应该说话了。你俯身含住她的一颗黑色乳头，轻轻地吸吮。你喉咙里发出一声响亮的呻吟，她享受着你嘴唇的触感，弓起了背。尝了一点她的乳汁后，你对她笑了笑，擦了擦嘴，问她谁是乖母牛。她摇晃着尾巴，用一根手指指着自己，哞哞叫着，嘴角挂着一丝坏笑。");
         outputText("[pg]你这只狡猾的小母牛想被挤奶吗？她大声哞哞叫着，点了点头，调皮地用头蹭着你。你开始给她戴上吸乳器，按了几下泵把她的乳头吸进去，一小股乳汁溅入吸乳器的玻璃杯中。乌尔塔发出一声呻吟般的哞哞声，尾巴高兴地摇晃着，肉棒在刺激下顺着长长的阴茎滴下前列腺液。你为自己忘记了这么明显的一个细节而自责，问乌尔塔有没有你可以用的玻璃瓶。[say: 哞？]她问道，仍然在角色中，然后指了指一个柜子。");
         outputText("[pg]你拿来一个小瓶子，把它连接到吸乳器的出口上，然后拍了拍乌尔塔的头，告诉她现在她不用担心乳汁溢出来了。她抖了抖耳朵，哞哞叫着，迎合着你的抚摸。");
         outputText("[pg]然后你拿起吸精器，开始把它连接到她跳动的马屌上。这很紧……事实上，你觉得你可能塞不进去。乌尔塔哀怨地哞哞叫着，不过她脸上带着一种傻笑，表明她至少很享受这种吸力。你问她自从买了那个玩具后是不是变大了。回应你的是一声愤怒的哞哞叫和猛烈的摇头，这位扶他狐狸似乎对这个想法感到相当冒犯。");
         outputText("[pg]好吧，你只能将就一下了。你抚摸了她的肉棒几下，挤出更多的前列腺液，涂满她的肉棒……然后涂在玩具上。最后你拿起玩具，把它压在乌尔塔膨胀的龟头上，把它推入，直到它最终滑进去。当你这样做时，她哞哞叫着，呻吟着，疯狂地挺动着，最后当膨胀的龟头挤过玩具的嘴唇进入它吸吮的开口时，她发出一声明显的如释重负的叹息。");
         outputText("[pg]你开始按压泵，帮助你把她整个肉棒塞进去，把前列腺液从她体内吸出来，吸进管子里，然后吸进连接的小橡胶软管里。一个邪恶的念头闪过你的脑海，你拿起软管，把它塞进她的小穴里。[say: 哞！]乌尔塔吓了一跳，给了你一个震惊的眼神。然后她的眼神变成了一种轻浮的、心照不宣的炽热，她邪恶地咧嘴笑了。[say: 哞……]她用一种明显轻浮的语气说道，并在你身上蹭了蹭以示强调。");
         outputText("[pg]你开始抽动玩具，榨取她的乳房和肉棒里的存货。乌尔塔发出哞哞声和呻吟声，本能地挺动着臀部，仿佛她的吸精泵是一个试图榨干她超大肉棒的小穴，她明显在努力克制自己不去玩弄乳房，以保持“在角色中”。");
         if(get_player().hasCock())
         {
            outputText("[pg]你感到欲火焚身又有些被冷落，于是拉起乌尔塔的一只手放在你的[cock biggest]上，对她微笑着。几乎是本能地，她的手握住了你的肉棒开始上下套弄。这位经验丰富的双性人几乎毫不费力地就知道该用多大的压力和摩擦力，让你真正享受她的抚摸。");
         }
         outputText("[pg]你停下手中的动作，取下她吸乳器上那个几乎装满奶水的瓶子。");
         if(get_player().hasCock())
         {
            outputText("乌尔塔立刻停止了套弄你的肉棒，不过谁也猜不透她是因为想帮忙，还是因为你停下来而感到恼火。");
         }
         outputText("你拍了拍她的头，告诉她要做个乖女孩，你去拿另一个瓶子。你回来后，重新装上瓶子，把软管从她的小穴里拔出来，告诉她她的下唇已经喝够了奶……现在该轮到上唇了。她发出一声困惑的牛叫，但嘴角挂着的坏笑表明她知道你在说什么。你把软管塞进她嘴里，让她喝个精光！");
         outputText("[pg]她发出一声闷闷的牛叫，但还是开心地用嘴唇包住软管，已经开始期待着吸吮她那咸咸的液体大餐了。");
         outputText("[pg]你继续按压泵。她立刻发出了狂喜的牛叫和呻吟。[say: 哞！哦，[name]，我——我快到了！]她含着软管呜咽着，然后又叫了一声。");
         if(get_player().hasCock() && !get_player().isTaur() && get_player().cockThatFits(get_urta().urtaCapacity()) != 0)
         {
            outputText("[pg]你跳上床，分开她的双腿，将你的[cock biggest]对准她湿滑的阴唇。你问她知不知道接下来要做什么。[say: 哞哦哦！]她回答道，一边继续挺动，一边拼命点头。你把泵递给她，抓住她的臀部，然后猛地一下沉入她的花径中。[say: 哞！]她大叫一声，做最后一次挺动，然后爆发了高潮，精液从包裹着她肉棒的泵里喷涌而出。");
            outputText("[pg]她的阴道壁收缩着，紧紧夹住你的肉棒，将你也榨出了高潮。一股又一股的精液射入她的体内。她发出牛叫、呻吟和喘息，急切地接受着你射入她那鼓胀、被填满的子宫里的精液，尽管大部分都溢了出来。");
         }
         outputText("[pg]乌尔塔喝着自己的精液，发出咕噜咕噜的声音。随着乌尔塔发炎的乳头继续分泌乳汁，瓶子几乎被奶水装满了。[say: 哞……]乌尔塔呻吟着，做了最后几次无力的挺动，然后软绵绵地瘫倒在床上，她最后的精液也被吸进了泵里。");
         if(get_player().hasCock() && !get_player().isTaur() && get_player().cockThatFits(get_urta().urtaCapacity()) != 0)
         {
            outputText("[pg]你又在她体内抽送了几下，完成了射精；然后你从她体内拔出，把她的臀部放在床垫上，喘着粗气。[say: 你到底是农夫还是公牛？]乌尔塔轻声笑着，拍了拍她肿胀的肚子。");
            get_player().orgasm("Dick");
            dynStats(DynStat.Sens(-1));
         }
         outputText("[pg][say: 我可想不出这种点子……]乌尔塔说道。[say: 不过这其实挺好玩的。]你开心地对她笑了笑。也许下次你应该为你们的角色扮演想点更硬核的东西。");
         outputText("[pg]你这么说的时候，乌尔塔目不转睛地看着你。[say: 我知道那个眼神，那个眼神意味着你在打什么坏主意……对于你脑子里酝酿的任何东西，我是该兴奋、害怕，还是两者兼有？]她讽刺地问道，但她眼睛里闪烁的光芒表明她其实并不反感。然后她大声打了个哈欠。[say: 哇，我现在觉得好累……我想你最好还是走吧；我要在这里睡个午觉，]她喃喃地说。");
         dynStats(DynStat.Lust(20));
         menu();
         addButton(0,"离开",goHomeHorsecock);
         addButton(1,"留下",stayForHorseDickings);
      }
      
      public function massagePregnantUrtasBelly() : void
      {
         clearOutput();
         outputText("看着乌尔塔肿胀的身躯，你问她是否想让你给她揉揉肚子。狐狸眨了眨眼，然后对这个提议笑了笑，高兴地点了点头。你立刻问她有没有可以用的油" + (get_noFur() ? "。" : "；诚然，这在毛茸茸的肚子上可能效果不太好，但试试也无妨，对吧？") + "");
         if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,803) == 0)
         {
            outputText("[pg]乌尔塔摇了摇头，[say:没有，[name]，抱歉……我平时对这东西不太感兴趣，]她伤心地告诉你。你宣称一定有什么东西能达到你想要的目的，在乌尔塔的同意下，你开始在屋子里翻找。你找到了好几种不同的假阳具，甚至还有一些超大号的飞机杯，但就是没有油。然而，最终你在一个壁橱里找到了一加仑装的润滑剂，并立刻把它拿给了你怀孕的爱人。");
            outputText("[pg]然而，当她看到你拿的东西时，她尴尬地羞红了脸，一把从你手里抢了过去。[say:不行，绝对不行！我可能会把它用在我的鸡巴上，但我绝不会让你把它涂满我全身！]");
            outputText("[pg]你问她有什么问题。这只是润滑剂，它只会让她对你变得湿滑。[say:我不管，我不让你把那东西涂在我身上——太尴尬了！]她抱怨道。现在你仔细想想……你决定问问为什么乌尔塔家里有一加仑的润滑剂。这难道不有点过分了吗？而且你们在交往，她要那么多润滑剂干嘛？");
            outputText("[pg][say:嘿-嘿，我有很多鸡巴要涂，你知道的，]乌尔塔红着脸指出。[say:而且……它……啊……在你不在的时候也很好用。]你对乌尔塔的回答轻笑了一声，但同意去找点别的。[say:谢谢你，]她羞怯地回答。");
            outputText("[pg]你决定接下来在她的厨房里翻找；也许你能找到一些食用油。那很难说是一个合适的替代品，而且乌尔塔的" + (get_noFur() ? "皮肤" : "皮毛") + "可能会变得非常粘，但也许……等一下。你抓起附近的一个罐子，检查它的标签。上面写着<i>生奶油</i>。好奇心战胜了你，你决定问问乌尔塔这是什么。");
            outputText("[pg][say:这是一种含糖的半液体——我想是用牛奶做的——又滑又软。它非常甜，当你按压盖子时，那个罐子就会喷出它。尝尝看。]怀孕的狐狸向你解释道。");
            outputText("[pg]你把盖子转向你的手，轻轻按压。一缕蓬松的白色奶油从罐子里喷出，落入你的手中。你测试了它的质地……它又软又滑。你把手举到脸前，试探性地舔了一口。甜的。实际上味道相当不错。[say:是吧？我买了一些是因为我一直很喜欢这个味道，而且我最近一直很想吃甜食。]乌尔塔回答道。这给了你一个主意……你建议你可以用这罐生奶油代替油。");
            outputText("[pg][say:真-真的吗？]她回答道，想到这里脸红了。[say:嗯……我听说它在卧室里有一些用途……好-好吧，如果你想试试的话……]");
            outputText("[pg]你告诉她躺下，让自己舒服点。她点了点头，按照你的建议做了，在毯子中间扭动着，然后躺下，小心翼翼地托着她肿胀的肚子，勃起的肉棒在她面前摇晃。");
         }
         else
         {
            outputText("[pg][say:油……？嗯，也许吧……但我认为我有一些新鲜的生奶油……]母狐狸带着恶作剧的坏笑渐渐不说话了，她的意图显而易见。你立刻从乌尔塔的小厨房里拿来了这种令人惊讶的多用途甜食，回来时发现她正在等你开始。");
         }
         outputText("[pg][say:在你开始之前，亲爱的，也许你应该给我拿一个我的避孕套？否则，等这结束时，我就不是唯一一个被奶油覆盖的人了，]她试图开玩笑地说。她说得有道理。你跑到她的卧室去拿了一个没用过的避孕套递给她。乌尔塔接过它，用熟练的技巧慢慢地把它卷下她粗钝的鸡巴，直到前端被保护性的乳胶包裹。");
         outputText("[pg]既然这件事已经处理好了，你终于可以开始了。你把盖子对准乌尔塔的肚脐，在她身上喷了一大堆奶油。她轻柔地" + (get_noFur() ? "喘息" : "尖叫") + "了一声，[say:好冰！]然后咯咯地笑了起来，[say:而且好痒！]");
         if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,803) == 0)
         {
            outputText("她若有所思地看着你和她刚涂上奶油的肚子。[say:我从来不知道我爱吃甜食会让我变成这样……]");
         }
         outputText("[pg]你用手挤压那一大堆奶油，开始在她的肚子上摩擦，把它涂开，直到她的肚子被一层薄薄的、白色的、滑溜溜的奶油覆盖。乌尔塔轻声呻吟着，弓起肩膀，享受着你的手在敏感的皮肤上" + (get_noFur() ? "" : "，覆盖着她光滑的皮毛") + "。[say:你的手很巧，亲爱的，]她奉承你。");
         outputText("[pg]你恶作剧地笑着，伸手去拿罐子，在她敏感的黑色乳头上喷了一些奶油。母狐狸咯咯地笑着，在原地扭动着，[say:感觉就像云朵在我的乳头上挠痒痒，]她笑着说。显然，这在其他方面也令人愉悦；你可以从眼角余光看到，预先分泌的液体开始使她的避孕套头部膨胀。你开始把奶油涂在她的乳房上，就像她的肚子一样。[say:嘿，现在，你在干什么？这应该是一个<b>揉肚子</b>，亲爱的，]乌尔塔顽皮地责骂你，尾巴却一直在摇。");
         outputText("[pg]你向她假装道歉，并告诉她你会把它清理干净。然后，你继续让你的");
         if(get_player().tongue.type == 1)
         {
            outputText("分叉的");
         }
         else if(get_player().tongue.type == 2)
         {
            outputText("恶魔般的");
         }
         else if(get_player().tongue.type == 3)
         {
            outputText("龙的");
         }
         outputText("舌头伸出来，开始舔舐她乳房上的奶油");
         if(get_player().tongue.type > 0)
         {
            outputText("，由于你的舌头能伸长到惊人的长度，这项任务变得容易多了");
         }
         outputText("。你确保对她那沾满奶油的乳头给予了额外的关注。");
         outputText("[pg]乌尔塔在刺激下舒服地扭动着，预精慢慢冒泡流进她的避孕套里，[say: [name]，你应该给我按摩，而不是吃掉我！]她笑着说。你迅速抓起手中的瓶子，将盖子对准乌尔塔的嘴唇，用奶油覆盖住它们。乌尔塔几乎没有时间反应，等她从震惊中恢复过来时，你已经在嘲笑她了。她看起来像一只得了狂犬病的狐狸。");
         outputText("[pg]乌尔塔面无表情地盯着你，然后慢慢地宣布，[say: 如果你不回去给我揉肚子，你真的会看到一只得了狂犬病的狐狸。]然后她故意舔干净嘴唇；她吸溜着嘴唇上甜美的泡沫时明显的享受，以及她那钝头肉棒鼓胀的硬度，都清楚地表明她同样享受你顽皮的一面。");
         outputText("[pg]玩够了之后，你决定稍微工作一下。你开始轻轻揉捏乌尔塔的肚子，小心不要太粗暴，以免打扰到乌尔塔的“加一”。尽管这感觉像是对产品的滥用，但生奶油确实对你的任务有帮助。它比你希望的要粘一点，但很管用。她大声呻吟着，明显很感激，舌头伸了出来；无论如何她可能都很享受这种接触，但由于子宫膨胀造成的拉伸，她的敏感度增加了，从而提高了她的快感。[say: 嗯……感觉真好……]她尽力看向自己的胯部。[say: 呃……你也能给她按摩一下吗？]她问道，用眼睛指着她的马屌和明显拉伸其乳胶涂层的液体气泡。");
         outputText("[pg]你对乌尔塔的用词有点困惑，她是在要求你按摩她的小穴吗？但话又说回来，她看着她的肉棒……或者至少你认为是这样。你该怎么做？");
         var _loc1_:IMap = KFLAGS.flags;
         FlagDict_Impl_.arrayWriteInt(_loc1_,803,FlagDict_Impl_.arrayReadInt(_loc1_,803) + 1);
         menu();
         addButton(0,"揉肉棒",rubUrtaDick);
         addButton(1,"揉小穴",rubUrtaPussy);
      }
      
      public function lubeSpraySideEffects() : void
      {
         clearOutput();
         outputText("所以，如果她以前在自己身上做过实验，那至少也出过一两次岔子吧，你评论道。");
         outputText("[pg]她点点头。[say: 是的，确实出过。]她摸着下巴陷入了沉思。");
         outputText("[pg][say: 有一次我的尾巴变成了一个触手怪……根本控制不住，但感觉也没那么糟。]你闭口不言，脑海里已经浮现出她接下来要说的话。[say: 让我高潮了一两次……]果然不出所料，你暗自想道。");
         outputText("[pg][say: 还有一次，我的阴蒂变得特别大，甚至不用弯腰就能舔到自己……那段时间还挺享受的。]你很好奇她是怎么把它缩回去的。");
         outputText("[pg][say: 还有一次，我的胸部开始震动……以我的罩杯来说，这有点尴尬。]那画面一定很壮观，但你把这句话憋在了心里。");
         outputText("[pg][say: 有一次，我觉得我长出了蛋蛋；里面装满了精液，我特别想射……但我没长出鸡巴，所以根本没法释放压力，你懂吗？那天我晕过去了……等我醒来时，蛋蛋已经没了。]你注意到，她很幸运那个效果只是暂时的。");
         outputText("[pg][say: 还有一次，我长出了第二对胳膊。如果它们没有自己的意识……而且没有迷恋上我那震动的胸部的话，本来会很有用的。]你的脑海立刻陷入了对那个特定事件的想象中，然后你迅速将其压制下去，带着");
         if(get_player().cor < 33)
         {
            outputText("轻微的");
         }
         else if(get_player().cor < 66)
         {
            outputText("一些");
         }
         else
         {
            outputText("极大的");
         }
         outputText("不舍。");
         outputText("[pg]她又想了一会儿。[say: 我想这些就是最有趣的暂时性副作用了……不过我确实也留下了一些永久性的。]……好吧，你再也忍不住了；你问她那些是什么。");
         outputText("[pg][say: 嗯……有我的润滑液喷雾，不过这个你已经知道了。]你表示同意，并毫不掩饰地好奇她的其他变化是否也同样与性有关……不过话又说回来，在这个世界里？几乎可以肯定是这样。");
         outputText("[pg][say: 我的括约肌……我可以扩张我的括约肌，让任何东西都能塞进我的屁股里。不过我想这也没什么用。]嗯，如果她不喜欢被肛交的话确实没用，你心想。");
         outputText("[pg][say: 每隔15天我就会开始产奶。有点烦人，因为我得自己挤奶。]至少比每天都要挤奶好，你心想。");
         outputText("[pg][say: 如果我喝酒，我的舌头就会肿得很大，甚至不用动身子就能舔到自己的屁股。]……你不确定自己是希望她告诉过乌尔塔这件事，还是没告诉过——你不知道乌尔塔能不能抵挡住这种诱惑。");
         outputText("[pg][say: 如果我告诉你我以前只有A罩杯，而且屁股几乎是平的，你会信吗？这是比较烦人的副作用之一。我基本上得重新学习走路，而且这些东西一直压得我喘不过气来。]她用手托了托自己的胸部。[say: 我的衣柜也全报废了。]好吧，这变化确实很明显，你心想。");
         outputText("[pg][say: 还有一个是超敏感的鼻子。我的嗅觉甚至比犬类还要好……不过当我靠近发情的雄性时，这可能会是个麻烦。]她揉了揉鼻子。[say: 嗅觉更好也意味着我更容易吸入那些费洛蒙。]那绝对是个大麻烦；她很幸运自己是在城里，而不是在荒野中。");
         outputText("[pg][say: 最后，我可能还觉醒了心灵感应的能力……大概吧。]……好吧，她现在肯定是在寻你开心。[say: 你说什么？什么开心？]……你他妈在逗我吧。");
         outputText("[pg][say: 我想就是这些了……我还在尝试能不能开发出光合作用的能力。这样我就不用吃饭了，能省下不少钱……但结果只是让我的耳朵里长出了叶子。所以这还是个正在进行的项目。]");
         outputText("[pg]……你发现自己开始怀疑莉安娜的脑子是不是真的正常。");
         outputText("[pg][say: 对了。能请你帮个忙吗？]什么事，你回答道。[say: 如果你在城里看到一只会唱歌的蚱蜢，能帮我抓住它吗？我当时在测试一些混合药剂，结果让它跑了……]");
         outputText("[pg]你盯着她看了一会儿，然后慢慢地点了点头。");
         outputText("[pg][say: 谢谢。还有别的事吗？]");
         talkToLiana(false);
      }
      
      public function liannasAppearance() : void
      {
         clearOutput();
         outputText("莉安娜是一个看起来很健康的年轻" + (get_noFur() ? "女人" : "兽人") + "，一个臭鼬" + (get_noFur() ? "女孩，有着一条毛茸茸的黑白相间的尾巴，在身后摇摆着。" : "形态的兽人，全身覆盖着光滑闪亮的黑色皮毛，摇摆着的毛茸茸的尾巴上点缀着白色。") + " 她的头发是纯黑色的，夹杂着几缕白色，扎成一个短马尾，绿色的眼睛在架在鼻梁上的银边圆眼镜后闪闪发光。她穿着一件保守的短袖衬衫和一条虽然有点宽松，但仍然能展现出她修长双腿的裤子。裤子很紧身，你绝对能看出她是个纯粹的女孩；这里没有任何隐藏的“惊喜”。她没有穿鞋，露出了她" + (get_noFur() ? "" : " 爪子般的") + "脚。她的臀部非常圆润丰满，有着充满女人味的臀部曲线；上半身也同样丰满，目测至少有E罩杯，这让她比她的雇主还要丰满；尽管如此，她还是试图用她的穿着风格来掩饰它们。");
         menu();
         addButton(14,"返回",visitTheHouse);
      }
      
      public function liannaHandjobbies() : void
      {
         clearOutput();
         var _loc1_:IMap = KFLAGS.flags;
         FlagDict_Impl_.arrayWriteInt(_loc1_,807,FlagDict_Impl_.arrayReadInt(_loc1_,807) + 1);
         outputText("[say: 好了，我们开始吧。] 她再次钻进她的壁橱，出来时拿着看起来像避孕套和棒棒糖的东西。[say: 流程是这样的。你戴上这个避孕套，我把你的种子挤出来。很简单，对吧？]");
         outputText("[pg]你不得不承认，看起来确实如此。然后你问她打算怎么挤。她懒得回答你，而是剥开棒棒糖的包装纸，把它放进嘴里，一边吸吮一边茫然地盯着你。看着她吃棒棒糖，你脑子里充满了各种想法；主要是那些关于臭鼬娘的嘴唇包裹着[oneCock]的想法。你正想建议点什么，她突然打断了你。[say: 你知道吗？我还没仔细想过这个……我觉得用机器是最理想的，但我事先没有准备任何东西，所以我猜我只能自己动手了，用我自己的双手。] 她凝视着你的[cock biggest]。");
         if(get_player().cockTotal() > 1)
         {
            outputText("[say: 不过我觉得只挤一根就足够了。]");
         }
         outputText("她指了指床。");
         outputText("[pg]好吧，现在听起来确实很享受。你顺着她的指引，让自己舒服地躺下。");
         if(get_player().cockTotal() > 1)
         {
            outputText("[pg][say: 我得先拿点东西。] 她再次钻进她的壁橱，在里面翻找，直到她拿着一个装满阴茎环的盒子出来。好吧，这看起来不太妙……");
            outputText("[pg]她凑近你，分析你的[cocks]。[say: 我觉得这根应该可以，] 她说着，抚摸着你的[cock biggest]。你对这种刺激发出赞赏的低语，但即使你那背叛的肉体为她勃起，你也没有忘记接下来会发生什么。她摸出一个阴茎环，把它套在你的另一根阴茎上");
            if(get_player().cockTotal() > 2)
            {
               outputText("");
            }
            outputText("，有效地将它们在根部绑在一起。你对此发出空洞的呻吟；虽然这肯定意味着不会弄得一团糟，但你不确定你是否会喜欢试图通过被堵住的 " + Utils.num2Text(get_player().cockTotal() - 1) + " 根阴茎射精的感觉。对她的工作感到满意后，她看着你的[cock biggest]。");
         }
         outputText("[pg]首先，莉安娜把手伸到身后，你看到她眉头微皱。片刻之后，你听到一声湿润的溅水声，她把手移回身前，将滑腻的润滑液涂满双手。做完这些，她开始按摩你的阴茎，涂抹上大量的润滑液。你因她的动作而颤抖，阴茎在快感中跳动，她天然润滑液的凉意进一步刺激着你敏感的肌肤。她又向后伸手抓了一把润滑液涂在你的阴茎上，确保你足够湿滑。[say: 这样应该够了。]你点点头；如果这是前戏，那就让我们看看正戏是什么吧！");
         outputText("[pg]接着，她把避孕套拿在手里，撕开包装。你克制住自己不要抽搐得太厉害，等待她开始。然而，莉安娜只是看着避孕套，似乎在试图弄明白它。你正要说点什么，她却说：[say: 我想这确实是最好的方法。]臭鼬娘丢掉她的棒棒糖，把棒子扔进附近的垃圾桶，然后把避孕套放在唇间。你好奇地看着她，想知道她那奇怪的脑子里在想什么。");
         outputText("[pg]莉安娜双手握住你的[cock biggest]，然后把它含进嘴里，尽可能多地把你的肉棒塞进喉咙。当她吞下你时，你感激地呻吟着，感觉到她嘴里有什么柔软滑腻的东西熟练地在你的阴茎上伸展开来。她退开身子，露出那个滑腻的避孕套，完美地套在你的肉棒上。你不知道她是从哪里学来这种方法的，也不知道为什么，但你对结果没有异议。她又做了几次调整，以确保不会有任何泄漏。[say: 很好，现在我想你准备好了。]");
         outputText("[pg]她向后伸手去拿更多的润滑液，并把它涂抹在你的肉棒上，但这一次她更加努力地握住你，用她柔软的手指包裹着你的肉棒。你感激地低语，你的阴茎已经在她的刺激下开始因快感而跳动。她的一只手忙着以慵懒的节奏套弄你，");
         if(get_player().balls > 0)
         {
            outputText("偶尔停下来抚摸你的[balls]，");
         }
         outputText("而另一只手则按摩着你的[cockHead biggest]，在揉捏时滚动着不断变大的预精液泡。");
         outputText("[pg]你因她的动作而淫荡地呻吟；你想知道她到底有多少经验，如果她已经让你这么湿润并准备好了——你可以看到你阴茎最顶端被预精液撑起的乳胶泡正以肉眼可见的速度慢慢变大，当她的手继续在你发麻的皮肤上熟练地舞动时，快感流遍全身……");
         outputText("[pg]当她松开你时，你呻吟了一声，低头想知道发生了什么。莉安娜看着你戴着避孕套的[cock biggest]的[cockHead biggest]上形成的预精液泡。她向前倾身，试探性地舔了舔它，搅动着聚集在里面的预精液，并给你的[cockHead biggest]挠痒痒。你发出一声愉悦的喵叫，表达你对这一行为的感激。她舔了一次又一次，直到最后她把你的阴茎含进嘴里，向前推，直到你感觉自己进入了她的喉咙。一声喘息从你的喉咙里挤出来，你无法抗拒自己的本能；你开始挺动臀部，努力将自己更深地推入她渴望的嘴里。");
         outputText("[pg]她的双手抓住你的[hips]作为支撑，她在你的肉棒上起伏，深喉你。你颤抖着挺动，感觉到她的喉咙熟练地隔着乳胶涂层绞弄着你已经过度敏感的肉棒，温暖湿润的深处在你周围吸吮，将你推向极限。她扭过头，为了把你吞得更深，你感觉自己崩溃了。你大叫一声，在将自己排空到她体内时，向她的嘴里做了最后一次冲刺。");
         if(get_player().cumQ() < 1000)
         {
            outputText("[pg]你的阴茎将乳白色的精液喷射到她喉咙深处等待着的乳胶茧中，整齐地溅入其中，准备被取出。");
         }
         else if(get_player().cumQ() < 4000)
         {
            outputText("[pg]一股又一股的精液从你那异常多产的[balls]中涌出，像气球一样在莉安娜的嘴里撑起避孕套，随着你瀑布般的体液，她的肚子慢慢变圆，在她体内越胀越宽，将她的肉撑成一个明显的凸起，直到最后你喷出最后一次。");
         }
         else
         {
            outputText("[pg]莉安娜可能咬得太多嚼不烂了；然而她的表情并没有改变，即使你那非人般的精液瀑布像一股高度集中的精液海啸一样涌入她体内，随着液体的涌入，避孕套开始膨胀，她的肚子几乎立刻开始肿胀。你有一瞬间想知道避孕套是否会被从你的阴茎上推下来，最终卡在她的胃里，或者干脆在她体内破裂，但你无法停止，直到你倾注了你所能给予的一切……");
         }
         outputText("[pg]臭鼬娘面无表情地抬头看着你，然后开始将自己从你的阴茎上拔出。伴随着一阵吧唧声，一个");
         if(get_player().cumQ() >= 1000)
         {
            if(get_player().cumQ() < 2000)
            {
               outputText("大");
            }
            else if(get_player().cumQ() < 3000)
            {
               outputText("巨大");
            }
            else
            {
               outputText("超大");
            }
         }
         outputText("的精液泡开始从她的嘴唇中冒出来，上面沾满了口水。让你惊讶的是，她竟然连眼睛都不眨一下就能做到这一点，更不用说像这是世界上最平常的事情一样盯着你看了。一旦她最终把你的精液泡从喉咙里拔出来，她咳嗽了几声，整理了一下头发，开始重新抚摸你的阴茎，挤出你肉棒上最后几滴精液。你大口喘着气，然后惊讶地看着她；她确实有一些令人惊讶的技巧。");
         outputText("[pg]她用手擦了擦嘴，然后开始取下你的避孕套，小心翼翼地不损坏它，也不让哪怕一滴精液漏出来。她在避孕套的末端打了个结，并掂量了一下里面包含的精液。");
         if(get_player().cumQ() < 250)
         {
            outputText("[pg][say: 我想这暂时足够了，]她宣布道。");
         }
         else if(get_player().cumQ() < 1000)
         {
            outputText("[pg][say: 相当多，不错，]她说，赞许地点点头。");
         }
         else
         {
            outputText("[pg][say: 这些够我用一阵子了，]她微笑着点头赞许道。");
         }
         outputText("[pg]她稍微揉了揉喉咙，然后站起身看着你。[say: 给你。]她从白大褂的口袋里掏出一根棒棒糖递给你。你有些不情愿地接了过来，依然摸不透她在想什么。[say: 这是对你为我的研究所做贡献的奖励。现在你可以随意在我的床上休息，想躺多久都行，我得趁着这些精液还新鲜赶紧去处理一下。回见，谢谢你。]她转过身走向浴室，关上门并锁了起来。");
         outputText("[pg]你叹了口气，摇了摇头。当四肢恢复力气后，你重新穿好衣服离开；真是个奇怪的女人。不过，这根棒棒糖还挺好吃的——哦！还是你最喜欢的口味！");
         get_player().orgasm("Dick");
         doNext(get_camp().returnToCampUseOneHour);
      }
      
      public function leavePreggoUrta() : void
      {
         clearOutput();
         outputText("你向乌尔塔道歉，但你现在真的没有心情，于是你从她身边走开，尽可能礼貌地快步走向门口；如果她真的像她声称的那样饥渴，你可不想给她太多的诱惑。你在门口停下脚步，回头看了一眼；乌尔塔看起来有点受伤，但更多的是无奈，显然正试图通过呼吸练习让自己平静下来。考虑到一名员工正拿着一个新桶走过来接她阴茎滴下的液体，你觉得这方法不太管用。");
         doNext(get_camp().returnToCampUseOneHour);
      }
      
      public function ignoreUrtaBonerWhenWorship() : void
      {
         clearOutput();
         outputText("你现在还有其他事情要操心，但你很高兴她似乎很享受你的服侍。");
         finishTitWorshipWivUrta();
      }
      
      public function hugAttackScene() : void
      {
         clearOutput();
         outputText("在你们能进一步寒暄之前，一阵奔跑的脚步声充满了屋子。莉安娜只是从厨房的安全地带看着靠近的小狐狸");
         if(urtaKids() > 1)
         {
            outputText("");
         }
         outputText("，留下你来应对这突如其来的冲锋。当你的孩子们扑向你，充满爱意地拥抱你时，你需要费点力气才能保持平衡。[say: 好了，好了，放开你们的" + get_player().mf("爸爸","另一个妈妈") + "，还是说你们不想玩了？]乌尔塔说着，关上前门时带着被逗乐的坏笑。伴随着一声呻吟和一点拉扯，小狐狸");
         if(urtaKids() > 1)
         {
            outputText("们");
         }
         else
         {
            outputText("终于");
         }
         outputText("从你身上爬了下来，但在那之前，" + urtaKidsText("他","她","他们") + "抓住了你的手。");
         if(urtaKids() > 1)
         {
            outputText("他们");
         }
         else if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,795) >= 2)
         {
            outputText("她");
         }
         else
         {
            outputText("他");
         }
         outputText("坚持拉着");
         if(urtaKids() == 1)
         {
            outputText("");
         }
         outputText("你走向后院，而你的爱人则对你的窘境轻笑。");
         outputText("[pg]经过一番摔跤、一些游戏，以及一次擦伤膝盖的小意外后，大家都来到了家庭活动室，留下你被一张张笑脸包围。[say: 你喜欢你的游戏约会吗，[name]？]乌尔塔提示道，同时莉安娜正在给你孩子的膝盖包扎。你自己也有点累了，唯一的回答是微微点头。在这里待了大半个小时，是时候上路了。[say: 为什么不多待一会儿呢，亲爱的？我们正准备吃午饭，你为什么不加入我们呢？]乌尔塔问道，脸上带着邀请的微笑。");
         menu();
         addButton(0,"留下",stayToPlay);
         addButton(1,"离开",noPlayTimeForKids);
      }
      
      public function holdOnYouAintGettingYerCumYetYouNaughtyFox() : void
      {
         clearOutput();
         outputText("你不会这么轻易屈服的。如果她想要，她最好努力争取。你调皮地对她笑了笑，甚至在她紧握的手中挺动着。");
         outputText("[pg][say: 嗯……看来你需要一点鼓励……]乌尔塔说着，然后低下头，开始缓慢地、挑逗地吞咽你的肉棒，吵闹地吞咽和舔舐着它的每一寸，试图确保你把精液射进她的喉咙里。");
         outputText("[pg]这对你来说太过分了，伴随着一声沙哑的呻吟，你把精液深深地射进她的喉咙，直接射进她的胃里。");
         if(get_player().cockTotal() > 1)
         {
            outputText("你另一根阴茎");
            if(get_player().cockTotal() > 2)
            {
               outputText("不祥地鼓起，因为它们也准备把精液排在顺从的双性狐狸兽人身上。");
            }
            else
            {
               outputText("危险地鼓胀着，因为它也准备将它的存货注入这只顺从的双性狐狸兽人体内。");
            }
         }
         outputText("乌尔塔急切地大口吞咽着，尽力咽下每一滴精液。");
         if(get_player().cumQ() < 250)
         {
            outputText("[pg]你尽你所能地喂饱她，");
            if(get_player().cockTotal() > 1)
            {
               outputText("甚至把一些精液溅到了她的脸上，因为你的另一根肉棒");
               if(get_player().cockTotal() == 2)
               {
                  outputText("抽搐着");
               }
               else
               {
                  outputText("抽搐着");
               }
               outputText("达到了高潮，");
            }
            outputText("但最终你达到了极限，只能瘫倒在地，而她继续像吸管一样吸吮着你的[cock biggest]，渴望着你的公狗奶。");
            outputText("[pg]一旦确信你不会再给她更多了，她看起来有点难过，伴随着湿润的啵声松开了你的肉棒，吧唧着嘴。[say:真好吃，就像我想的那样；这真的很对胃口。]她对你说。");
         }
         else if(get_player().cumQ() < 1000)
         {
            outputText("[pg]你用你那液态的欢愉填满了她，用你的[cock biggest]撑开她的喉咙，你的精液顺着输精管流进她的胃里。");
            if(get_player().cockTotal() > 1)
            {
               outputText("你的另一根肉棒");
               if(get_player().cockTotal() == 2)
               {
                  outputText("也来凑热闹");
               }
               else
               {
                  outputText("也来凑热闹");
               }
               outputText("把她弄得一团糟，当");
               if(get_player().cockTotal() > 2)
               {
                  outputText("它们随意地喷洒");
               }
               else
               {
                  outputText("它随意地喷洒");
               }
               outputText("精液在她身上，不过她似乎并不介意。");
            }
            outputText("你躺下放松，让这只渴望肉棒的双性狐狸兽人把你吸干，同时你继续泵出你的公狗奶。当她完事时，她的肚子看起来大了一点，你知道这种胀大并不完全是因为宝宝。你开心地对着这只饥渴地吸吮着你[cock biggest]的母狐狸微笑，尽管已经没有更多东西给她喝了。");
            outputText("[pg]乌尔塔松开了你的肉棒，轻轻地打了个嗝，然后尴尬地咯咯笑了起来。[say:你真知道怎么满足我，亲爱的。]");
         }
         else
         {
            outputText("[pg]你的精液以如此大的力量喷射进她的胃里，你甚至感觉到乌尔塔因为你突然爆发的精液而后退。然而她勇敢地紧紧抓住你的肉棒，吸吮并吞咽下去。你惊人的射精量轻易地填满了她的嘴，速度远快于她能吞咽的速度，一些精液从她嘴边溢出，但她拒绝放弃，并采用了一种新技巧。她不再吸吮，而是保持喉咙张开，让你用滚烫的精液浇灌她的胃。");
            outputText("[pg]这可能是最有效的方法，因为你那无尽的液态欲望之海才刚刚流出一点点。你向后靠着放松，着迷地看着她的肚子随着你的精液明显地膨胀起来。");
            if(get_player().cockTotal() > 1)
            {
               outputText("你另一根阴茎");
               if(get_player().cockTotal() > 2)
               {
                  outputText("射出了精液");
               }
               else
               {
                  outputText("射出了精液");
               }
               outputText("，四处飞溅，有些溅到了乌尔塔的脸上，但大部分都把房间弄得一团糟。");
            }
            outputText("[pg]乌尔塔勇敢地挣扎着，试图用鼻子呼吸，但巨大的精液量显然让她难以招架。她抓住你阴茎的根部");
            if(get_player().hasKnot(get_player().biggestCockIndex()))
            {
               outputText("，就在你的肉结上方，");
            }
            outputText("双手用力，试图把它捏紧，好争取时间深吸几口气，然后又继续努力喝下每一滴精液；她一定非常渴望你那里的东西。");
            outputText("[pg]你很乐意把所有的精液都给她，继续将你的男根之乳泵入她饥渴的嘴里。");
            outputText("[pg]当你终于结束时，乌尔塔几乎连一滴都咽不下去了。当她终于从你的[cock biggest]上拔出时，你闷哼一声，勉强射出最后一股精液，打在了她的一只眼睛上。");
            outputText("[pg]她摇了摇头把精液甩掉，然后用手指敲了敲她鼓胀的肚子。[say:我想我今天不需要再吃任何东西了……]她喉咙里发出咕噜声，打了个嗝，然后又打了一个响雷般的饱嗝来强调，空气中顿时弥漫着精液的气味。");
         }
         outputText("[pg]你无辜地对她笑了笑，松了一口气，因为");
         if(get_player().balls > 0)
         {
            outputText("你的蛋蛋");
         }
         else
         {
            outputText("你自己");
         }
         outputText("被榨干了精液。");
         outputText("[pg][say:我听说过部队里一些女士有奇怪的嗜好，但这是比较古怪的一种。你的味道真的很不错，[name]。]乌尔塔说道，然后大声打了个哈欠，拍了拍她鼓胀的");
         if(get_player().cumQ() >= 500)
         {
            outputText("、发出咕噜声的");
         }
         outputText("肚子，显然感到很累，尽管这次被取悦的人不是她。");
         outputText("[pg]在刚才的高潮之后，你突然发现自己变得极其困倦，于是你翻了个身，给乌尔塔腾出足够的空间躺在你身边。你微笑着拍了拍身边的空位，希望乌尔塔能和你一起小睡一会儿。乌尔塔毫不犹豫地在你身边舒服地躺下，闭上眼睛，静静地进入了梦乡。");
         get_player().orgasm("Generic");
         dynStats(DynStat.Sens(-2));
         menu();
         addButton(0,"继续",weirdUrtaCravingsConclusion);
      }
      
      public function goVisitUrtaBirfs(param1:Boolean = false) : void
      {
         var _loc3_:* = null as IMap;
         clearOutput();
         get_pregnancy().knockUpForce();
         FlagDict_Impl_.arrayWriteInt(KFLAGS.flags,802,0);
         FlagDict_Impl_.arrayWriteInt(KFLAGS.flags,810,0);
         if(!param1)
         {
            outputText("去乌尔塔生孩子的诊所的旅程是一片模糊；唯一重要的是尽快赶到那里。半人马把你丢在医院门口，你自己走进去，走向里面的柜台。[pg]");
         }
         if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,790) == 0)
         {
            outputText("一个看起来很活泼的年轻女性鼠人，她的护士服在胸前绷得有点紧，超出了专业的范畴，一个写着“斯普林特”的小名牌夹在下摆上，她带着欢迎的笑容抬头看着你。[say: 你好，[mister]；请说明问题所在。]你解释了你的原因，她的眼睛因理解而睁大。[say: 啊，我明白了。请跟我来，[name]；我带你去乌尔塔的房间。]她迅速从座位上站起来——让你看到她胯部有一个相当不淑女的凸起，虽然你不知道她是个双性人还是仅仅是个女性化的男性——然后开始走，你紧紧跟在后面。");
         }
         else
         {
            outputText("斯普林特看到你时咧嘴笑了。[say: 又来了，是吗？来找乌尔塔的？哇，你们俩似乎真的很喜欢生孩子——谁能想到守卫队的队长想成为一个生育机器，嗯？嗯……你知道，我自己也觉得有点想孵蛋了……]她对你的回答大笑起来。[say: 开玩笑的；来吧，种马；乌尔塔在这边。]她踏上了现在已经熟悉的路线。");
         }
         outputText("[pg]你一进乌尔塔的房间，就看到这只狐狸精仰卧在床上，除了病号服外一丝不挂。你向她打招呼，色眯眯地盯着她鼓起的肚子。");
         outputText("[pg]她看到你在看哪里，勉强咯咯地笑了起来。[say: 是的，我们很快就能抱到我们的小家伙了。]她皱了皱眉，肚子明显在颤抖，因为她的肌肉在收缩中弯曲。[say: 我希望很快……不过，说实话，其实并没有那么痛。感觉还挺舒服的。]");
         outputText("[pg][say: 医生很快就来，]斯普林特鞠了一躬离开了，随手关上了门。你走向乌尔塔，轻轻拍了拍她的肚子，感觉到宝宝在里面踢腿，然后对她微笑。当你这样做时，你俯身吻她并握住她的手。");
         outputText("[pg]她回吻你时发出轻柔的呻吟，紧紧握住你的手，随着宫缩的折磨，她握得更紧了。当她说其实感觉挺舒服时，她显然不是在开玩笑；你可以从眼角余光看到她的病号服开始像帐篷一样撑起来。");
         outputText("[pg]门外传来轻柔的敲门声。乌尔塔带着略显尴尬的咯咯笑声打破了与你的唇枪舌战。[say: 请进。]她大声喊道。门开了，露出一个穿着白大褂的龟人。他整理了一下紫色的领带，然后说，[say: 晚上好。我叫多纳泰罗医生，今天将由我负责你的分娩。]他微笑着。");
         if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,790) == 0)
         {
            outputText("[pg]多纳泰罗？这名字真奇怪……注意到你若有所思的表情，医生很快就猜到了你的想法。[say: 名字很奇怪，对吧？如果你愿意，可以直接叫我唐医生。]他伸出一只手，你赶紧自我介绍，并握了握手。他退到一旁。");
            outputText("[pg][say: 他是个非常好的医生，[name]，]乌尔塔插话道，似乎想让你放心。[say: 他处理过很多守卫队相关的治疗……他，呃，算是专门处理这种特殊情况的，]她不好意思地咧嘴笑了笑，拍了拍自己的肚子。");
         }
         else
         {
            outputText("[pg][say: 又见面了，[name]。看来你们俩挺忙的。]他心领神会地看了看你和乌尔塔。你只能不好意思地笑了笑，抱住乌尔塔。这只狐狸显得有些尴尬，但并没有掩饰她的骄傲。");
         }
         outputText("[pg]唐医生拉过一把椅子，坐在床尾，戴上一副眼镜，用听诊器听了听乌尔塔的肚子。[say: 那么，你今天感觉怎么样，乌尔塔？感觉到宫缩了吗？]");
         outputText("[pg][say: 哦，是的。]乌尔塔赞同道。[say: 大概每五到十分钟就有一阵。]她解释道。");
         outputText("[pg][say: 是的，它们随时都会出来……]他收起听诊器，看着你们俩，然后笑了。[say: 别管我，尽情和你的妻子亲热吧，这实际上有助于分娩。而且，看到你们这样一对恩爱的夫妻期待着孩子的降生，总是一件令人高兴的事。]");
         outputText("[pg]乌尔塔羞涩地红了脸，然后迅速搂住你的脖子，拉着你吻了起来。她开心地和你亲热了一会儿，然后发出一声惊呼，因为一股明显不寻常的液体浸湿了她睡袍的胯部。[say: 哦……我想我的羊水破了。]她对你和医生说。");
         outputText("[pg]龟人医生迅速就位，帮助乌尔塔抬起双腿；他指导你们俩该怎么做，你尽全力在整个痛苦的过程中支持乌尔塔。");
         outputText("[pg]乌尔塔有节奏地吸气和呼气，在被告知用力时用力，然后停下来积蓄力量，随着她的孩子在体内快速滑动，不可阻挡地从她蛋蛋下方的裂口滑向自由，她喘息着、呻吟着。");
         outputText("[pg][say:看到头了！记住：用力，呼吸，用力，呼吸，保持节奏。]乌尔塔大声呻吟着，虽然听起来不完全是痛苦的，她抱住膝盖，明显在用力。她的肚子突然平复下来，一声婴儿的啼哭划破空气；分娩完成了。");
         var _loc2_:int = Utils.rand(3) + 1;
         outputText("[pg]唐医生迅速处理好脐带，用毛巾把婴儿裹了起来。[saystart]恭喜你们，[name]和乌尔塔！你们生下了一个健康的");
         if(_loc2_ == 2)
         {
            outputText("女孩！");
         }
         else if(_loc2_ == 1)
         {
            outputText("男孩！");
         }
         else
         {
            outputText("男孩……？嗯……这可真不寻常，看来你们其实生下了一个健康的双性人！");
         }
         outputText("[sayend]");
         if(_loc2_ == 1 || _loc2_ == 3)
         {
            if(Utils.rand(2) == 0)
            {
               outputText("[pg][saystart]那么，现在……");
               if(_loc2_ == 3)
               {
                  outputText("");
               }
               outputText("他是一只非常正常的小狐狸，[sayend]医生说道，你可以从你所在的位置瞥见你的");
               if(_loc2_ == 1)
               {
                  outputText("儿子");
               }
               else
               {
                  outputText("女儿");
               }
               outputText("胯下有着比一般狐狸稍大一些的包皮。");
               FlagDict_Impl_.arrayWriteInt(KFLAGS.flags,798,2);
            }
            else
            {
               outputText("[pg][saystart]……哎呀呀；看来");
               if(_loc2_ == 3)
               {
                  outputText("");
               }
               outputText("他随了");
               if(_loc2_ == 3)
               {
                  outputText("她");
               }
               else
               {
                  outputText("他");
               }
               outputText("的母亲，[sayend]医生评论道。你匆匆瞥了一眼，发现新生儿的双腿间摇晃着马阴茎的坚韧包皮。虽然还是婴儿，但这已经预示着");
               if(_loc2_ == 1)
               {
                  outputText("他");
               }
               else
               {
                  outputText("她");
               }
               outputText("长大后肯定是个大");
               if(_loc2_ == 1)
               {
                  outputText("男孩。");
               }
               else
               {
                  outputText("姑娘，等她长大的时候。");
               }
               FlagDict_Impl_.arrayWriteInt(KFLAGS.flags,798,1);
            }
         }
         outputText("[pg]他把婴儿递给你，你看着这只哭泣的小狐狸看了一会儿，然后把婴儿递给乌尔塔。她已经忙着脱下病号服，好让婴儿能碰到她的乳房。她急不可耐地几乎是从你手中抢过婴儿，然后把");
         if(_loc2_ >= 2)
         {
            outputText("她");
         }
         else
         {
            outputText("他");
         }
         outputText("抱到胸前，带着喜悦与敬畏看着这个小狐狸兽人寻找着她黑色的乳头并含住。看到这一幕，泪水开始从她的脸颊滑落。[saystart]我们的");
         if(_loc2_ >= 2)
         {
            outputText("女儿");
         }
         else
         {
            outputText("儿子");
         }
         outputText("……看，[name]，");
         if(_loc2_ >= 2)
         {
            outputText("她");
         }
         else
         {
            outputText("他");
         }
         outputText("真的在这里；我们美丽、美丽的小宝贝……[sayend]她抽泣着，");
         if(urtaKids() == 0)
         {
            outputText("终于成为母亲的事实让她百感交集");
         }
         else
         {
            outputText("依然像往常一样，为你们不断壮大的家族增添新成员而感到欣喜");
         }
         outputText("。");
         outputText("[pg]你拥抱并亲吻了乌尔塔，看着这个正在吸吮");
         if(_loc2_ >= 2)
         {
            outputText("她");
         }
         else
         {
            outputText("他");
         }
         outputText("母亲乳房的小狐狸天使，你的心中洋溢着幸福。[say:看来我在这里的工作暂时结束了……我晚点会回来给宝宝做个快速检查，但就目前来看，你们没什么好担心的。那么，失陪了。]医生站起身离开了房间，留给你和这只双性狐狸兽人一些独处的空间。");
         if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,790) == 0)
         {
            outputText("[pg]你带着疑问看向乌尔塔，不知道接下来该怎么办。乌尔塔抚摸着她的新生儿，然后羞涩地抬头看着你。[say:你介意留下来陪我们吗？就今晚，好吗？]");
         }
         else
         {
            outputText("[pg]你会意地看着乌尔塔，已经预料到接下来会发生什么。乌尔塔对你露出一个娇羞的笑容，半眯着眼睛抬头看着你。[say:好吧，我想我不需要告诉你我们一家三口接下来要去哪儿……如果你有时间的话？]");
         }
         _loc3_ = KFLAGS.flags;
         FlagDict_Impl_.arrayWriteInt(_loc3_,790,FlagDict_Impl_.arrayReadInt(_loc3_,790) + 1);
         FlagDict_Impl_.arrayWriteInt(KFLAGS.flags,797,_loc2_);
         if(_loc2_ == 1)
         {
            _loc3_ = KFLAGS.flags;
            FlagDict_Impl_.arrayWriteInt(_loc3_,792,FlagDict_Impl_.arrayReadInt(_loc3_,792) + 1);
         }
         else if(_loc2_ == 2)
         {
            _loc3_ = KFLAGS.flags;
            FlagDict_Impl_.arrayWriteInt(_loc3_,793,FlagDict_Impl_.arrayReadInt(_loc3_,793) + 1);
         }
         else
         {
            _loc3_ = KFLAGS.flags;
            FlagDict_Impl_.arrayWriteInt(_loc3_,794,FlagDict_Impl_.arrayReadInt(_loc3_,794) + 1);
         }
         if(urtaKids() == 1)
         {
            FlagDict_Impl_.arrayWriteInt(KFLAGS.flags,795,FlagDict_Impl_.arrayReadInt(KFLAGS.flags,797));
            FlagDict_Impl_.arrayWriteInt(KFLAGS.flags,796,FlagDict_Impl_.arrayReadInt(KFLAGS.flags,798));
         }
         menu();
         addButton(0,"留下",stayAfterUrtaBirf);
         addButton(1,"离开",goAfterUrtaBirf);
      }
      
      public function goHomeHorsecock() : void
      {
         clearOutput();
         outputText("你对乌尔塔点了点头，拿起衣服，瞬间穿戴整齐。临走前，你问乌尔塔是否需要什么。她微笑着摇了摇头，脸上带着温柔的笑容。你祝她好好休息，然后离开了她的公寓。");
         doNext(get_camp().returnToCampUseOneHour);
      }
      
      public function goAfterUrtaBirf() : void
      {
         clearOutput();
         outputText("你道了歉，说今天还有急事要处理……但你保证，一定会想办法补偿她的。乌尔塔看起来有些失望，但还是悲伤地叹了口气，点了点头。[say: 当然。你还是个大忙人冒险者嘛。好吧，别担心；我会确保这个小家伙安全到家并安顿好的。]");
         var _temp_1:* = get_game().time;
         _temp_1.hours = _temp_1.hours + 1;
         doNext(playerMenu);
      }
      
      public function giveTheKidsABath() : void
      {
         clearOutput();
         outputText("[say: 好的，跟我来。]她带你来到浴室。乌尔塔不惜重金把这里打造得尽可能奢华——你甚至能轻松把营地的核心区域塞进来。一个巨大的大理石浴缸嵌在地板里，占据了房间的大部分空间，大到足以轻松容纳两三个人马。闪亮的黄铜水龙头随时准备注满这个宽敞的浴缸，里面已经准备好了满满一池热水，正冒着热气。");
         outputText("[pg]莉安娜指着一堆瓶瓶罐罐。[say: 洗发水和肥皂在那边，我相信你知道怎么用吧？]你告诉这个臭鼬娘你知道。[saystart]很好，我去叫");
         if(urtaKids() == 1)
         {
            if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,795) == 1)
            {
               outputText("你儿子");
            }
            else
            {
               outputText("你女儿");
            }
         }
         else
         {
            outputText("孩子们");
         }
         outputText("。[sayend]你思考着该做什么，然后脱下外衣，小心翼翼地放在架子上，以免被水溅到。现在你只需要等莉安娜回来。");
         outputText("[pg]莉安娜走进浴室，身后跟着你的");
         if(urtaKids() == 1)
         {
            if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,795) == 1)
            {
               outputText("儿子");
            }
            else
            {
               outputText("女儿");
            }
         }
         else if(urtaKids() < 8)
         {
            outputText("孩子们");
         }
         else
         {
            outputText("孩子大军");
         }
         outputText("。[saystart]好了，");
         if(urtaKids() > 1)
         {
            outputText("大家");
         }
         outputText("脱掉衣服跳进去。[sayend]");
         if(urtaKids() == 1)
         {
            if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,795) == 1)
            {
               outputText("他");
            }
            else
            {
               outputText("她");
            }
         }
         else
         {
            outputText("他们");
         }
         outputText("叛逆地嘟囔" + urtaKidsText("着","着","着") + "，但在看到你时，" + urtaKidsText("他","她","他们") + "立刻精神了起来。" + urtaKidsText("他","她","他们") + "马上开始脱衣服，然后，赤身裸体地像刚出生时一样，蜂拥向你，紧紧地抱住你。你给予安慰的拍打和顽皮的抚摸，然后指示" + urtaKidsText("他","她","他们") + "进浴缸。哀伤的眼睛看着你，但是，看到你不会动摇，" + urtaKidsText("他扑通一声跳进","她扑通一声跳进","他们扑通一声跳进") + "浴缸。一进水，" + urtaKidsText("他","她","他们") + "就开始享受起来，在对" + urtaKidsText("他","她","他们") + "来说相当大的水池里欢快地踢水和泼水。这让你有机会注意到你的小捣蛋鬼" + urtaKidsText("的性别","的性别","们的性别") + "。");
         if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,792) > 0)
         {
            outputText("[pg]你有" + Utils.num2Text(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,792)) + "个狐狸儿子");
            if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,792) > 1)
            {
               outputText("");
            }
            outputText("。");
            if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,795) == 1)
            {
               outputText("你的长子是");
               if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,792) == 1)
               {
                  outputText("唯一的一个，");
               }
               else
               {
                  outputText("在他们之中，");
               }
               outputText("长着一根");
               if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,796) == 2)
               {
                  outputText("狐狸阴茎");
               }
               else
               {
                  outputText("马阴茎，和乌尔塔的相似");
               }
               outputText("。");
            }
            if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,797) == 1 && urtaKids() > 1)
            {
               outputText("你最小的孩子");
               if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,797) == 1)
               {
                  outputText("也是");
               }
               outputText("个男孩，长着一根");
               if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,798) == 2)
               {
                  outputText("狐狸阴茎");
               }
               else
               {
                  outputText("马阴茎，就像他妈妈的一样");
               }
               outputText("。");
            }
            outputText("你有一种感觉");
            if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,792) > 1)
            {
               outputText("他们");
            }
            else
            {
               outputText("他");
            }
            outputText("在");
            if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,792) > 1)
            {
               outputText("他们到了");
            }
            else
            {
               outputText("他");
            }
            outputText("进入青春期后会发育得相当不错，就算没有乌尔塔那么大。乌尔塔对");
            if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,792) > 1)
            {
               outputText("他们");
            }
            else
            {
               outputText("他");
            }
            outputText("感到非常自豪，并经常吹嘘");
            if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,792) > 1)
            {
               outputText("他们");
            }
            else
            {
               outputText("他");
            }
            outputText("长大后会成为");
            if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,792) > 1)
            {
               outputText("像她一样强壮的战士。");
            }
            else
            {
               outputText("像她一样强壮的战士。");
            }
         }
         if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,794) > 0)
         {
            outputText("[pg]你有" + Utils.num2Text(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,794)) + "个狐狸般的双性人女儿");
            if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,794) > 1)
            {
               outputText("");
            }
            outputText("。");
            if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,795) == 3)
            {
               outputText("你的长女是个双性人，长着一根");
               if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,796) == 2)
               {
                  outputText("狐狸阴茎");
               }
               else
               {
                  outputText("马阴茎，这是她从母亲那里遗传来的奇特特征");
               }
               outputText("。");
            }
            if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,797) == 3 && urtaKids() > 1)
            {
               outputText("你最新增加的孩子");
               if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,795) == 3)
               {
                  outputText("也是");
               }
               outputText("一个扶他，长着一根");
               if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,798) == 2)
               {
                  outputText("狐狸阴茎");
               }
               else
               {
                  outputText("马阴茎。毫无疑问，这种特征是从她母亲那里遗传来的");
               }
               outputText("。");
            }
            outputText("你有一种感觉");
            if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,794) > 1)
            {
               outputText("他们");
            }
            else
            {
               outputText("她");
            }
            outputText("在");
            if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,794) > 1)
            {
               outputText("他们到了");
            }
            else
            {
               outputText("她到了");
            }
            outputText("青春期时会发育得相当好，即使可能没有乌尔塔那么大。乌尔塔特别宠爱");
            if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,794) > 1)
            {
               outputText("他们");
            }
            else
            {
               outputText("她");
            }
            outputText("，也许是因为她还记得她的父母有多讨厌她是个扶他。");
         }
         if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,793) > 0)
         {
            outputText("[pg]你有 " + Utils.num2Text(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,793)) + " 个狐狸女儿");
            if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,793) > 1)
            {
               outputText("");
            }
            outputText("。");
            if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,795) == 2)
            {
               outputText("你的第一个孩子是个女孩。");
            }
            if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,797) == 2 && urtaKids() > 1)
            {
               outputText("你最新增加的孩子");
               if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,795) == 2)
               {
                  outputText("也是");
               }
               outputText("一个女孩。");
            }
            outputText("乌尔塔很喜欢和");
            if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,793) > 1)
            {
               outputText("他们");
            }
            else
            {
               outputText("她");
            }
            outputText("玩，并断言");
            if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,793) > 1)
            {
               outputText("他们");
            }
            else
            {
               outputText("她");
            }
            outputText("长大后一定会是个万人迷");
            if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,793) > 1)
            {
               outputText("");
            }
            outputText("当");
            if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,793) > 1)
            {
               outputText("他们长大");
            }
            else
            {
               outputText("她长大");
            }
            outputText("后。");
         }
         outputText("[pg]莉安娜正忙着收拾换下来的衣服。[say:我去拿干净衣服，你先开始吧，[name]。]你对她点点头，然后拿起最近的一瓶洗发水，走向浴缸。一捧水立刻湿漉漉地拍在你的脸上，你甩了甩头。你训斥了一句，制服了你那吵闹的孩子，直到你跪在浴缸旁，再也没有水花溅到你身上。你伸手去抓");
         if(urtaKids() > 1)
         {
            outputText("最近的");
         }
         outputText((get_noFur() ? "" : "毛茸茸的") + "你那小小的孩子，轻轻地把他们拉过来。");
         if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,797) >= 2)
         {
            outputText("她");
         }
         else
         {
            outputText("他");
         }
         outputText("踢着水，溅起水花，用");
         if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,797) >= 2)
         {
            outputText("她");
         }
         else
         {
            outputText("他");
         }
         outputText("的小腿，但还是对你微笑着，显然很愿意配合，当你把一大团肥皂液挤到");
         if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,797) >= 2)
         {
            outputText("她");
         }
         else
         {
            outputText("他");
         }
         outputText("的头发上并开始按摩时，没有给你添任何麻烦。" + (get_noFur() ? "" : ".. 那么，你到底要怎么给一个从头到脚都长满毛的人洗头呢...？") + "");
         outputText("[pg]" + (get_noFur() ? "很快" : "幸运的是") + "莉安娜到了，她拿着叠好的衣服，光着身子……一丝不挂。她坐在你旁边，温柔地问道：[say: 怎么样了？" + urtaKidsText("他","她","他们") + "没有向你泼水吧，对吧？] 就在她问完这个问题的时候，你的");
         if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,797) >= 2)
         {
            outputText("女儿");
         }
         else
         {
            outputText("儿子");
         }
         outputText("甩了甩");
         if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,797) >= 2)
         {
            outputText("她");
         }
         else
         {
            outputText("他");
         }
         outputText("的尾巴，把水溅到了莉安娜身上。然而，这位臭鼬娘对此没有任何反应。");
         outputText("[pg]你为此道歉，并指出" + urtaKidsText("他","她","他们") + "早些时候也用同样的方式弄湿了你。然后你弹了一下你");
         if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,797) >= 2)
         {
            outputText("女儿");
         }
         else
         {
            outputText("儿子");
         }
         outputText("的耳朵，告诉");
         if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,797) >= 2)
         {
            outputText("她");
         }
         else
         {
            outputText("他");
         }
         outputText("向莉安娜道歉。[say: 没关系，[name]。" + urtaKidsText("他只是个孩子","她只是个孩子","他们只是孩子") + "，你不能指望给孩子洗澡还不被弄湿。] 你想你很清楚为什么乌尔塔选择莉安娜来照顾孩子。你随口问莉安娜是否有弟弟妹妹；她看起来在这方面很有经验。她摇了摇头，[say: 这是我第一次做涉及孩子的工作。不管怎样，这比照顾牛头人容易多了。] 你不禁想知道她是否真的在某个时候照顾过牛头人，或者这只是一种俗语。");
         outputText("[pg][say: 来，让我帮你。] 她在手上挤了一把洗发水，开始擦洗你的");
         if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,797) >= 2)
         {
            outputText("女儿");
         }
         else
         {
            outputText("儿子");
         }
         outputText("的胸口，还挠了挠");
         if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,797) >= 2)
         {
            outputText("她");
         }
         else
         {
            outputText("他");
         }
         outputText("的咯吱窝。小狐狸咯咯笑着扭动身体，显然觉得很痒，你不得不稍微用力抱紧");
         if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,797) >= 2)
         {
            outputText("她");
         }
         else
         {
            outputText("他");
         }
         outputText("逃跑。[say: 现在你只需要冲洗一下。]她抓起附近的一个小桶，舀了一些水。[say: 闭上眼睛，亲爱的。]你的孩子按照莉安娜的指示做了；这显然是一个足够熟悉的日常，以至于");
         if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,797) >= 2)
         {
            outputText("她");
         }
         else
         {
            outputText("他");
         }
         outputText("可不想让肥皂水进到");
         if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,797) >= 2)
         {
            outputText("她");
         }
         else
         {
            outputText("他");
         }
         outputText("的眼睛里。莉安娜倾斜水桶，让水倾泻在");
         if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,797) >= 2)
         {
            outputText("她");
         }
         else
         {
            outputText("他");
         }
         outputText("的头上。你的小狐狸尖叫了一声，然后疯狂地甩着");
         if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,797) >= 2)
         {
            outputText("她");
         }
         else
         {
            outputText("他");
         }
         outputText("头，激起一阵水花，当");
         if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,797) >= 2)
         {
            outputText("她");
         }
         else
         {
            outputText("他");
         }
         outputText("这样做");
         if(urtaKids() > 2)
         {
            outputText("，这让");
            if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,797) >= 2)
            {
               outputText("她");
            }
            else
            {
               outputText("他");
            }
            outputText("兄弟姐妹们很高兴，他们正安全地在浴缸另一边看着");
         }
         outputText("。");
         outputText("[pg]你甩了甩脸上的水，忍不住评论说看起来");
         if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,797) >= 2)
         {
            outputText("她");
         }
         else
         {
            outputText("他");
         }
         outputText("头发已经洗好了。");
         if(urtaKids() == 1)
         {
            outputText("[pg][saystart]很好，现在该洗");
            if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,797) >= 2)
            {
               outputText("她");
            }
            else
            {
               outputText("他");
            }
            outputText("尾巴了。从浴缸里出来。[sayend]臭鼬娘指示道。小狐狸点点头，在浴缸边缘摸索着，把");
            if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,797) >= 2)
            {
               outputText("她");
            }
            else
            {
               outputText("他");
            }
            outputText("自己拉出来，这样莉安娜就可以开始照料");
            if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,797) >= 2)
            {
               outputText("她");
            }
            else
            {
               outputText("他");
            }
            outputText("尾巴。你立刻开始帮忙，也跟着搓洗起来……");
         }
         else
         {
            outputText("[pg][say: 好了，下一个是谁？] [say: 我！]");
            if(urtaKids() > 2)
            {
               outputText("你的另一个孩子");
            }
            else
            {
               outputText("你的另一个孩子");
            }
            outputText("大声说道。你松开目前抱着的");
            if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,797) >= 2)
            {
               outputText("女孩");
            }
            else
            {
               outputText("男孩");
            }
            outputText("，让");
            if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,797) >= 2)
            {
               outputText("她");
            }
            else
            {
               outputText("他");
            }
            outputText("游走，让新的志愿者接替");
            if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,797) >= 2)
            {
               outputText("她");
            }
            else
            {
               outputText("他");
            }
            outputText("的位置。你立刻开始帮忙，也跟着搓洗起来……");
         }
         outputText("[pg]你舒服地叹了口气，享受着周围的热水；你向你的伴侣承认，在营地里洗澡可没这么惬意。[say: 我猜你没有这么大、这么豪华的浴缸吧？]她问道。是的，你没有；你只有附近流淌的一条冷水溪，仅此而已。你补充说，你很庆幸那条溪流还算干净而且够深。[say: 要我帮你搓背吗？]她问道。");
         outputText("[pg]你问她是不是也会帮乌尔塔搓背。[say: 是的，当我们一起洗澡的时候。][pg]所以，莉安娜和乌尔塔也会这么做……这不仅仅是她为你做的事？[say: 不是。你为什么这么问？]她一边搓洗着尾巴，一边疑惑地看着你。");
         outputText("[pg]只是好奇，你回答道。你想知道是否应该接受她的提议……");
         get_player().hasGottenWashed();
         menu();
         addButton(1,"拒绝",noBathPleaseUrtaLian);
         addButton(0,"接受",getABackWashFromLianna);
      }
      
      public function get_pregnancy() : PregnancyStore
      {
         return get_game().urta.pregnancy;
      }
      
      public function getUrtaSexWhenPreggoz() : void
      {
         clearOutput();
         outputText("嗯……你可以暂时不用照顾你的乘客，那么她打算怎么帮你转移对当前困境的注意力呢？你带着会意的微笑问道。");
         outputText("[pg][say: 哦，我相信我们会想出办法的……]乌尔塔柔声说道，裙子已经撩起，她的肉棒勃起。[say: 现在，让我们找个舒适的地方，把你脱光……]她咧嘴一笑，已经开始带你去找个地方做爱。");
         outputText("[pg]你急切地跟上她，心里盘算着该让她做些什么……");
         urtaSexMenu();
      }
      
      public function getUrtaLetter() : void
      {
         outputText("[pg]你发现夜里收到了一封信。打开一看，确认是乌尔塔寄来的……在你没有出席分娩后，她对你非常不满意。你确实了解到你和她现在有了一个");
         if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,797) == 1)
         {
            outputText("儿子");
         }
         else if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,797) == 2)
         {
            outputText("女儿");
         }
         else
         {
            outputText("双性人女儿");
         }
         outputText("，不过。[pg]");
         FlagDict_Impl_.arrayWriteInt(KFLAGS.flags,799,0);
      }
      
      public function getUrtaHelpPreggoPC() : void
      {
         clearOutput();
         outputText("很好，你希望这意味着她会有很多时间，因为你现在确实需要一只狐狸好好陪陪你。[say: 只要你需要我，我就会在这里。]乌尔塔笑着，已经开始摆弄她盔甲的带子了。[say: 你对我们要做什么有什么偏好吗？]");
         urtaSexMenu();
      }
      
      public function getEggsHarvested() : void
      {
         var _loc1_:* = null as IMap;
         clearOutput();
         outputText("[say: 好了，我们开始吧。] 她再次钻进衣橱，出来时手里拿着一个看起来像假阳具的东西和一根棒棒糖。[say: 那么，让我解释一下。其实很简单。] 她拿起假阳具。[say: 这是我为这次实验专门定制的假阳具，它在让你爽的同时，还能让我收集你的淫水，希望能收集到你的卵子。你所要做的就是坐下来放松。有什么问题吗？]");
         outputText("[pg]好吧，你确实有一个问题忍不住要问；那根棒棒糖是怎么回事？[say: 那是给我的。它能帮我集中注意力。不过如果你是个乖女孩，我待会儿可能会给你一根。]");
         outputText("[pg]你把问题抛在脑后，告诉臭鼬娘你准备好开始了。");
         outputText("[pg][say: 好的，躺在床上放松。] 你点点头表示理解，按照简单的指示让自己舒服地躺下。");
         outputText("[pg]莉安娜接过棒棒糖，剥开糖纸，把糖塞进嘴里。她吮吸着糖果的甜味，双手拿起假阳具，对准了自己的屁股。你看着她");
         if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,808) == 0)
         {
            outputText("感到困惑，不知道她在玩什么把戏");
            _loc1_ = KFLAGS.flags;
            FlagDict_Impl_.arrayWriteInt(_loc1_,808,FlagDict_Impl_.arrayReadInt(_loc1_,808) + 1);
         }
         else
         {
            outputText("回想起来，知道接下来会发生什么");
         }
         outputText("。她毫不客气地开始把它塞进去，没有一丝愉悦或不适；假阳具毫无阻力地滑了进去，撑开她的臀瓣，伴随着湿润的吧唧声插了进去。你看着这一幕，不知道自己是否应该觉得这很变态。");
         outputText("[pg]臭鼬炼金术士抽插了几下玩具，然后把它拔出来仔细端详。你现在可以看到它上面涂满了一层润滑剂。好吧，这还不是你在这个世界上见过的最奇怪的事情。[say: 好了，准备好。现在轮到你了。] 你慢慢地点点头；现在就算想退出也太晚了……");
         outputText("[pg]她仔细检查你的[vagina]，触摸并按摩你的阴唇，测试着它。当感觉在你的神经上闪烁时，你不由自主地颤抖起来。");
         if(get_player().vaginalCapacity() >= 50)
         {
            outputText("[say: 嗯，我可能根本不需要润滑它……] 臭鼬娘评论道。");
         }
         outputText("她将假阳具的尖端对准你，一言不发地开始往里推。你本能地呻吟着，试图尽可能地张开双腿。");
         outputText("[pg]光滑湿润的假阳具轻松地滑入你的小穴，其柔软、有弹性的质地类似于果冻。由于莉安娜个人润滑剂的润滑，它毫不费力地滑得越来越深");
         if(get_player().looseness() >= 4)
         {
            outputText("；你松弛的小穴也不觉得痛");
         }
         outputText("。最后，你能感觉到它在你体内停了下来，尖端抵住了你的子宫颈，这就是它停下来的原因。");
         outputText("[pg]莉安娜不慌不忙地检查着你的阴道，每次只移动假阳具几英寸，似乎在调整它。你忍不住注意到这并不那么令人愉悦；它并不痛苦，只是……嗯，更多的是无聊。[say: 够好了，] 她宣布，然后按下了假阳具上的一个开关。当假阳具突然在你体内膨胀时，你呻吟起来，它不断肿胀和涌动，直到你能感觉到它坚持不懈地挤压着你体内的每一个小角落和缝隙，紧紧地封住你的蜜壶，像一块口渴的海绵一样吸吮着你的汁液。[say: 等一下。] 臭鼬娘说着，再次钻进她的衣橱。");
         outputText("[pg]她出来时拿着一根连接着泵的小软管和一个玻璃瓶；她把软管连接到你假阳具的底部；她小心地把瓶子放在够不着的地方，把软管的另一端插在打开的盖子上。[say: 都准备好了。] 她手里拿着一个小遥控器。[say: 开始提取，现在。] 当假阳具突然在你体内活过来时，你再次呻吟起来，快感开始流遍全身，它在你紧缩的肉壁内起伏和振动，跳动着，按摩着你被撑开的内部，让你每一寸肌肤都同时被它移动的表面所取悦。你嘶嘶作响，呻吟着，弓起背，沉浸在其中；现在事情终于变得令人愉快了。");
         outputText("[pg]莉安娜面无表情地看着你，嘴里含着棒棒糖，在笔记本上做着笔记。你下半身的快感继续增强，让你像个婊子一样呻吟；她的这个假阳具似乎确切地知道如何改变其振动频率，以给你带来最大的快感，尤其是当你体内的每一个表面都同时被触碰时。");
         outputText("[pg]你转过头想对莉安娜说点什么，但她似乎不见了。直到你感觉到你的[clit]上有一个小突起，你才低下头，发现她蹲在你的双腿之间，用她棒棒糖的塑料棒尖端轻轻戳着你的敏感点。你呻吟着，本能地向前挺动臀部，隐约注意到她停下来时，你向她投去困惑的目光。");
         outputText("[pg]她拿起那根已经吃完的棒棒糖，扔掉了被咬掉一半的塑料棒。然后她凑近开始舔你的[clit]，亲吻它，吸吮它，就像吸那根棒棒糖一样。这是你身体所能承受的极限了；熟悉的绝顶快感吞噬了你，你在高潮时大叫出声，女性的体液从你体内深处涌出，溅在莉安娜假阳具的塞子上。");
         outputText("[pg]然而，当你结束时，似乎到处都没有任何体液");
         if(get_player().hasCock())
         {
            outputText("除了");
            if(get_player().cumQ() < 50)
            {
               outputText("小");
            }
            else if(get_player().cumQ() < 250)
            {
               outputText("正常");
            }
            else if(get_player().cumQ() < 1000)
            {
               outputText("相当大");
            }
            else
            {
               outputText("巨大");
            }
            outputText("的精液飞溅，来自你被冷落的阴茎");
         }
         outputText("；假阳具已经把它全部吸收了。你能感觉到它收缩得更紧，缩小了，不再那么完美地填满你，当莉安娜轻轻地把它从你体内拔出时，你喘息着释放出来。");
         outputText("[pg]当你躺在那里回味余韵时，臭鼬娘突然把一个又硬又甜的东西塞进你嘴里——是一根棒棒糖，就像她刚才用的那根一样。[say: 你非常配合，帮了大忙，所以你应得一根棒棒糖。好好享受吧，随便用我的床。现在我得去储存并测试你的汁液了。] 她向你摇了摇现在装满你汁液的瓶子，然后走进了她的浴室；咔哒一声表明她把自己锁在里面了。");
         outputText("[pg]你叹了口气，摇了摇头。当四肢恢复力气后，你重新穿好衣服离开；真是个奇怪的女人。不过，这根棒棒糖还挺好吃的——哦！还是你最喜欢的口味！");
         get_player().orgasm("Vaginal");
         doNext(get_camp().returnToCampUseOneHour);
      }
      
      public function getBlownByPregnantUrta() : void
      {
         clearOutput();
         outputText("既然她这么想要，那她就如愿以偿吧，你心想，迎着她的手挺动，终于感觉到");
         if(get_player().balls > 0)
         {
            outputText("你的蛋蛋翻腾着，并且");
         }
         outputText("精液顺着你的尿道流下，随着它们通过的力量撑开你的肉棒，最后从你的[cockHead biggest]喷射而出，在空中划出一道优美的弧线，溅在乌尔塔的脸上。");
         outputText("[pg]乌尔塔震惊地眨了眨眼，但随后闭上眼睛，张开嘴，伸出舌头，高兴地让你喷洒她，只是希望你至少能试着瞄准她的嘴。就算你想瞄准也做不到，她紧握你[cock biggest]的手丝毫没有放松。");
         if(get_player().cockTotal() > 1)
         {
            outputText("即使放松了，你也无法控制你的另一根肉棒");
            if(get_player().cockTotal() > 2)
            {
               outputText("们，当它们加入");
            }
            else
            {
               outputText("，当它加入");
            }
            outputText("加入了这场猛攻。");
         }
         outputText("[pg]乌尔塔毫不退缩地任由你喷洒，偶尔盲目地扭动头部，试图接住一些喷射而出的精液。");
         if(get_player().cumQ() < 250)
         {
            outputText("很快，太快了，你就精疲力尽了。乌尔塔赤裸的身体上挂满了精丝，只有少数几滴落入了她张开的嘴里。你瘫倒在地，喘着粗气，对这个结果感到满意。");
            outputText("[pg]乌尔塔咂了咂嘴，娇媚地看着自己的身体，轻轻摇了摇头。[say: 我觉得你需要练练你的准头，亲爱的，]她调侃你。[say: 不过，我总是很乐意帮你练习。]");
         }
         else if(get_player().cumQ() < 1000)
         {
            outputText("你把精液喷射到半空中，就像一个变态的喷泉，用你白色的精液雨淋湿了这只灰色的狐狸。她欣然接受了这一切，没有退缩，看起来对结果非常满意，这只会驱使你在完成把她的上半身涂白的工作时，再多挤出几丝精液。终于结束了，你瘫倒在床上，享受着余韵，而你那狐狸般的情人则舔着嘴唇上你倾倒在她那顺从的身体上的零星精丝，考虑到精液的数量，这并没有什么用。");
            outputText("[pg][say: 真是费了不少力气，亲爱的。]她说道，娇媚地擦去眼睛上的精液，然后把黏糊糊的种子抹在肚子上，睁开眼睛看着你。[say: 不过，我本来希望能好好尝尝味道的。]她开玩笑地责备你。");
         }
         else
         {
            outputText("[pg]你的爆发就像精液的间歇泉，喷发并溅落在双性狐狸兽人的身体上，在空中划出一道弧线，就像一场变态的精液雨。乌尔塔似乎对她这场即兴的精液雨非常满意，而你也很乐意把这一切都给她。当她完全湿透，床单也完全被没射进她嘴里的精液弄得乱七八糟时，你才射了一半，你继续用精液轰炸她的身体。");
            outputText("[pg][say: 你到底能产多少精液？！]乌尔塔结结巴巴地说，尽管她继续闭着眼睛，耳朵紧贴着她越来越白的头骨，对着在空中飞舞的精液又咬又吞。你唯一的回答是呻吟着，继续射了她一身。");
            outputText("[pg]当你结束时，她看起来就像在精液池里潜过水一样。她的" + (get_noFur() ? "皮肤完全被涂满" : "皮毛完全被粘住") + "了你的精液，滴落在湿透的床单上，她的头发紧贴着眼睛，完全湿透了。如果你不是感觉这么好，你会为这烂摊子感到抱歉的，你忍不住对乌尔塔的窘境轻声笑了起来。");
            outputText("[pg]乌尔塔徒劳地试图擦干净眼睛，然后看着你，绿色的眼睛在你努力的灰白色广阔中闪闪发光。[say: 嗯……也许我没把那些都吞下去更好，]她承认道，然后咧嘴一笑，[say: 不过，我听说这对妊娠纹和" + (get_noFur() ? "皮肤" : "皮毛") + "保养有好处。]");
         }
         outputText("[pg]你太累了，什么也做不了，只能闭上眼睛，让余韵降临，慢慢带你进入梦乡。你最后感觉到的是一只黏糊糊的双性狐狸兽人依偎着你，小心翼翼地把她那塞得满满的肚子贴着你。");
         get_player().orgasm("Dick");
         dynStats(DynStat.Sens(2));
         menu();
         addButton(0,"继续",weirdUrtaCravingsConclusion);
      }
      
      public function getAnUrtaMassageWhenPreggo() : void
      {
         clearOutput();
         outputText("你告诉她按摩背部听起来不错，但你不想躺下。那可能会伤到宝宝。[say: 对哦，抱歉，我在想什么呢？嗯，我想我可以变通一下……] 乌尔塔咧嘴一笑，把手指掰得咔咔作响。[say: 现在，我们先找个舒服的地方把你安顿好……]");
         outputText("[pg]你建议也许你[cabin]里的铺盖卷就足够了……或者她可以趁你坐着的时候给你按摩背部。[say: 好吧，那我们就先给你按摩背部吧；不然我们可能会把按摩的事忘得一干二净，] 乌尔塔笑着，试图拿自己的性欲开玩笑。[say: 好了，现在，让我看看，这该怎么弄……] 她的声音渐渐变小。尽管她主动提出帮忙，但很明显她并不是什么专业的按摩师。有时她太粗鲁了，你不得不提醒她弄疼你的背了，而有时她又会挠你痒痒，弄得你哈哈大笑。最后，这并没有你希望的那么放松，不过她确实揉开了一些肌肉结节，你现在感觉至少稍微放松了一点。");
         outputText("[pg][say: 抱歉，[name]，我在这方面真的没什么经验，] 乌尔塔道着歉，看起来因为没能帮到你而感到沮丧。");
         if(get_player().cor > 50)
         {
            outputText("[pg]这次你就不计较了，但她真的应该在拿你做实验之前多练习一下。");
         }
         else
         {
            outputText("[pg]你告诉她别担心，有些地方按得确实挺舒服的……不过如果她下次再提议给你按摩时能多练习一下，你会很感激的。");
         }
         outputText("[pg][say: 好吧，如果你和我一起搬到文明社会，也许我可以在你身上练习，]双性狐娘抱怨道，但这显然只是半开玩笑。你开玩笑地告诉她，你还太年轻，不能因为被她那狐狸般的" + (get_noFur() ? "手" : "爪子") + "粗暴对待而开始出现背部问题。");
         outputText("[pg][say: 等你肿得像个西瓜，求我帮你缓解抽筋的时候，我会记住这句话的，] 乌尔塔反驳道，冲你吐了吐舌头，然后又为自己的傻气笑了起来。她抱住你，在你的脖子上蹭了蹭。[say: 保重，亲爱的；你们俩对我来说太重要了，不能消失在这片荒野里。] 她温柔地责备你。你向她挥手告别。");
         doNext(get_camp().returnToCampUseOneHour);
      }
      
      public function getABackWashFromLianna() : void
      {
         clearOutput();
         outputText("你告诉莉安娜，如果她愿意，你不介意她帮你搓背。");
         outputText("[pg]她从浴缸里拉出一张小木凳。[say:坐吧。]你爬出浴缸，按照指示坐下，准备让她开始。[say:有什么偏好吗？]你忍不住问她指的是肥皂还是性爱姿势，想看看你的调侃能不能让这只臭鼬娘炸毛。[say:肥皂。]她漫不经心地回答。");
         outputText("[pg]你告诉她你想要的，然后找了个舒服的姿势，示意她可以开始了。她开始用手在你的背上缓慢游走，涂上一层肥皂沫，然后开始按摩，按压并揉开你背上的肌肉结节。你对臭鼬娘细致的服侍发出赞赏的低语；她在这方面出奇地在行。她凑近揉捏你的肩膀，你感觉到有什么东西戳到了你的背。[say:抱歉，它们有时候挺碍事的，]莉安娜道着歉，往后退了退，这样她的乳头就不会再碰到你的背了。这感觉其实并不讨厌，但你决定保持礼貌，让她继续。");
         outputText("[pg]她继续搓背，但最终她的乳头又戳到了你的背。她叹了口气。[say:有时候我真讨厌这些……]她评论道。你问她为什么会有这种感觉。[say:在发生那次化学事故长出这些之前，我处理药水和材料都很轻松。但现在我发现自己总是撞到设备，导致更多的化学事故。它们非常麻烦且笨重，如果我能找出导致这种情况的配方，我一定会把它们缩小。当然，它们摸起来确实很舒服，但实在是太麻烦了。]她深吸了一口气。[say:抱歉发牢骚了，你介意我的胸部碰到你的背吗？不然我没法给你好好搓背。]你告诉她你不介意；她可以随意。");
         outputText("[pg]莉安娜回到她的搓洗和按摩中，不再因为让她的胸部摩擦你的背而感到不自在。你赞赏地呻吟着；莉安娜不仅非常擅长缓解你的紧张，而且你能感觉到她柔软、像枕头一样的胸部在你的[skinfurscales]上摩擦，挺拔的乳头在你下腹部激起了并非不受欢迎的感觉。[say:好了，这边搞定了。]她拍了拍你的背。你站起身伸了个懒腰，听着关节发出的咔咔声，并感谢她的努力。[say:不客气，现在轮到你了，]她宣布道，自己在长凳上坐下。[say:请用花香洗发水。]");
         outputText("[pg]你点点头表示明白，拿起指定的洗发水，然后问她需要用多少。[say:多弄点，]她回答道。");
         outputText("[pg]你耸耸肩，迅速在她肩膀上挤了一大坨液体肥皂，放下瓶子，然后开始按摩她那柔软、浓密的黑白相间的" + (get_noFur() ? "头发" : "覆盖全身的皮毛") + "。你问她感觉如何。[say:挺好的，不过再多搓搓我的上半背。]你开始抚摸和揉捏她的肩膀，尽力揉开她能感觉到的任何结节或紧绷感，并让她随时告诉你想要怎么按。[say:把下半背按完就行了。]你确认明白后，将手滑到她的后腰，在她的屁股上方徘徊，但绝不越界，因为她没有表现出任何想让你按那么低的迹象。最后，你宣布大功告成。她站起身伸了个懒腰，尾巴慵懒地摇摆着，然后转头看向你。[say:谢谢，太棒了。]");
         outputText("[pg]你告诉她，既然她这么尽心尽力地帮你搓背，这是你至少能做的。");
         outputText("[pg][say:失陪一下，我得去冲洗了，]她说着走向淋浴间。既然刚刚都在一起洗了，你觉得也没必要等，便跟在她后面。冲洗完毕并穿好衣服后，你礼貌地向臭鼬娘道别，然后离开了。");
         get_player().changeFatigue(-30);
         dynStats(DynStat.Lust(get_player().sens / 10));
         doNext(get_camp().returnToCampUseOneHour);
      }
      
      public function finishTitWorshipWivUrta() : void
      {
         outputText("[pg]最后吸了一口，你松开她的乳房，舔了舔嘴唇。乌尔塔在床上扭动了一下，然后伸出双臂，微笑着抬头看着你。[say: 嗯，是的，感觉好多了；谢谢你的帮忙，亲爱的。现在，我觉得有点饿了；想和我一起吃点点心吗？]");
         outputText("[pg]你摇了摇头，指出你刚刚已经吃过一顿了。你拍了拍自己的肚子以示强调。");
         outputText("[pg]乌尔塔笑了笑，立刻调皮地戳了戳你的肚子。[say: 看来你吃过了……好吧。不过，如果你想来我家吃点东西……或者喝点什么……请不要见外，]她笑道。[say: 不过如果是想喝奶的话，你可能得等宝宝喝完，]她半开玩笑地责备你。");
         outputText("[pg]你会记住的。说完，你吻了她一下作为道别，找到你的[armor]，然后告辞了。");
         dynStats(DynStat.Lust(20));
         get_player().changeFatigue(40);
         doNext(get_camp().returnToCampUseOneHour);
      }
      
      public function drinkSomeUrtaPostBirthTitMilk() : void
      {
         clearOutput();
         outputText("你决定问问乌尔塔介不介意你在走之前吃个早餐。你的手不自觉地抚摸着她空闲的那只乳房。她享受地呻吟了一声，然后咯咯笑了起来。[say: 调皮的[name]……不过，我不介意。等我先喂完这个小家伙；我可没法同时应付你们俩。]");
         outputText("[pg]几分钟后，小狐狸吃饱了，乌尔塔把它放在肩头轻轻拍出嗝，然后小心翼翼地把这个咿咿呀呀的婴儿放回了");
         if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,797) == 1)
         {
            outputText("他");
         }
         else
         {
            outputText("她");
         }
         outputText("婴儿床里。[say: 那么……我想还有人想尝尝……？]她一边柔声说着，一边扭动着身姿向你走来，肿胀的乳房挺立着，等待着你的抚摸。你托起乌尔塔的乳房，感受着它们的重量和柔软度，然后舔了舔嘴唇，开始舔舐她的乳晕，挑逗着那颗勃起的小乳头。[say: 哦，对，感觉真好……不过请轻一点，它们很敏感。]乌尔塔向你呻吟道。");
         outputText("[pg]你把乌尔塔的乳头含进嘴里，开始轻轻吮吸，小心不让牙齿刮到敏感的肌肤，没过多久，你就得到了缓慢但稳定的狐狸奶水的回报。她舒服地低吼着，伸手搂住你的脖子，把你抱得更紧。你闭上眼睛，只是享受着这份亲密，以及营养丰富的乳汁。很快，奶水开始变少，你知道乌尔塔应该没剩多少了……但你并没有停止吮吸……甚至在她真的没奶了之后也没有停下。[say: 嗯……感觉真好，[name]，但我们都知道你现在只是在逗我……这可能不是个好主意，除非你想尝尝我的另一种奶水……]");
         get_player().refillHunger(20);
         outputText("[pg]你感觉到乌尔塔的肉棒顶端戳着你，并注意到顶端似乎聚集了一些预精液。也许是时候停手了。你有些失望地松开乌尔塔的乳房，对她笑了笑。[say: 吃饱了吗，[name]？]她问你。当你回答吃饱了时，她咧嘴一笑，然后突然一把抱住你，把你的头放在她的肩膀上。[say: 该拍嗝了！]她咯咯笑着，一只手有节奏地拍打着你的后腰。你无法抗拒，最终打了个小嗝，然后退开，不好意思地笑了笑。");
         outputText("[pg]她笑着拍了拍你的脸颊。[saystart]在外面要小心，[name]；我们");
         if(urtaKids() == 1)
         {
            outputText("有一个孩子");
         }
         else
         {
            outputText("孩子们");
         }
         outputText("在一起……但如果你再也回不来了，那可就太糟糕了。拜托，一定要照顾好自己，[name]，[sayend]她郑重地对你说。你吻别了她，挑逗地摸了一把她的肉棒，然后走出了房间。");
         dynStats(DynStat.Lib(-1),DynStat.Lust(10));
         doNext(get_camp().returnToCampUseOneHour);
      }
      
      public function declineUrtaLevelSixPreggoHelps() : void
      {
         clearOutput();
         outputText("你感谢乌尔塔的好意，但你不得不拒绝。你还有事情要处理，所以你打算再休息一会儿就上路。此外，她离开太久也不好，她还有一座城市要管理。");
         outputText("[pg]乌尔塔叹了口气，点了点头。[say: 你说得对，[name]。可是……把你一个人留在这里，我真的不放心，尤其是在你这种状况下。] 你自信地告诉乌尔塔你能照顾好自己。[say: 可是……] 乌尔塔说道，不安得几乎要哭出来了。然后她摇了摇头。[say: 好吧，对不起，但是，说真的，你能怪我吗？]");
         outputText("[pg]你摇摇头，拍了拍她的背，再次向她保证你会安全的……宝宝也会安全的。乌尔塔看起来仍然心存疑虑，但保持沉默，在消失在荒野之前吻别了你。");
         doNext(get_camp().returnToCampUseOneHour);
      }
      
      public function declineARimJob() : void
      {
         clearOutput();
         outputText("你告诉她你很感激她的提议，但这次你打算算了。虽然她试图掩饰，但她对你的拒绝看起来松了一口气；她可能真的不太适应那种程度的变态。相反，她急切地用她的嘴唇捕捉你的嘴唇，在吞噬你的吻时在你的嘴里喃喃自语，舌头滑入你的嘴唇之间抚摸你的舌头。");
         outputText("[pg]虽然费了点功夫，但最终你们俩还是把自己收拾得像模像样了，尽管毫无疑问，你们身上仍然散发着强烈的性爱气味。乌尔塔微笑着，依偎着你，吻了你一下，然后打了个哈欠。[say: 好了，我不再欲求不满了，但现在我累了。这个孩子随时都可能出生，所以我需要睡觉——我要回家睡个午觉了，[name]。照顾好自己，好吗？]她对你说道。");
         outputText("[pg]你吻了她一下道别，然后走了出去。");
         doNext(get_camp().returnToCampUseOneHour);
      }
      
      public function bathtime() : void
      {
         clearOutput();
         outputText("你告诉莉安娜你只是想来看看你的");
         if(urtaKids() > 1)
         {
            outputText("孩子们");
         }
         else if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,795) >= 2)
         {
            outputText("女儿");
         }
         else
         {
            outputText("儿子");
         }
         outputText("。[say: 当然，不过他们需要洗个澡，也许你想帮我给他们洗澡？]");
         menu();
         addButton(0,"同意",giveTheKidsABath);
         addButton(1,"拒绝",noBathTiemPlease);
      }
      
      public function acceptUrtaRimJobbies() : void
      {
         clearOutput();
         outputText("嗯……她对你的状态负有责任，而且她宽阔的狐狸舌头在敏感的屁股上感觉一定很棒……所以你点头接受了她的提议。[say: 好吧……你知道你是我唯一愿意这么做的人，对吧？]乌尔塔评论道。[say: 现在，转过身来向我展示你自己；你不能指望一个孕妇弯腰弯得太厉害，对吧？]她笑了笑。");
         if(!get_player().isTaur())
         {
            outputText("[pg]你四肢着地，撅起你的[ass]。乌尔塔有些笨拙地跪在你身后，然后用手指紧紧抓住你的屁股。她深吸了一口气，似乎是为了让自己平静下来，然后轻轻地将一根手指滑入你依然松弛和被撑开的肛门肌肉环中。你因为突然的侵入而痛苦地皱了皱眉，微微颤抖。");
         }
         else
         {
            outputText("[pg]你站起来，背对着她，让她看着你的[ass]。乌尔塔咕哝了一声，费力地站直身子，然后站在你马一样的屁股后面，用她熟练的手指挤压和揉捏你侧腹的肌肉。她深吸了一口气，似乎是为了让自己平静下来，然后轻轻地将一根手指滑入你依然松弛和被撑开的肛门肌肉环中。你因为突然的侵入而痛苦地皱了皱眉，微微颤抖。");
         }
         outputText("[pg][say: 好了……]说完，她俯下身，开始用她温暖湿润的舌尖轻轻地在你的后庭周围游走，轻轻地将唾液涂抹在酸痛处。虽然还是有点疼，但乌尔塔湿润的舌头在你的屁股上的感觉确实帮助你克服了疼痛，尽管这种行为的变态程度并没有被忽视。");
         if(get_player().cockTotal() > 1)
         {
            outputText("尤其是如果你的[cocks]有任何发言权的话，仅仅是感觉到乌尔塔湿润的舌头，它们就在跳动。");
         }
         else if(get_player().cockTotal() == 1)
         {
            outputText("尤其是如果你的[cock]有任何发言权的话，仅仅是感觉到乌尔塔湿润的舌头，它就在跳动。");
         }
         else if(get_player().hasVagina())
         {
            outputText("尤其是如果你的[pussy]有任何发言权的话，它对着乌尔塔眨着眼睛，希望能得到自己的舔舐。");
         }
         outputText("她慢慢开始加深这个伪吻，将越来越多湿润的舌头压在你身上，直到她在裂谷的长度上进行缓慢、慵懒的舔舐，用她冰凉的粘液涂抹你燃烧的皮肤。");
         outputText("[pg]你把屁股对着乌尔塔的脸摇晃着，当她湿润的舌头舔去你屁股上所有的酸痛时，你舒服地呻吟着。但很快，她就停了下来。[say: 好了，有人可能太享受这个了……而且，你已经不滴水了。我想我只能亲到这个程度了。]乌尔塔宣布道。她一只手扶着你的屁股支撑着，呻吟着完全直起身子。[say: 我想我很幸运，你至少把自己那里弄得很干净……我甚至能在你身上尝到我自己的味道，]她用调情的语气在你的屁股上拍了一下，作为这句话的标点符号。[say: 那么，现在感觉好点了吗？]");
         outputText("[pg]你点点头，尽管你对乐趣被打断感到有点失望。[say: 那就好。好了，我想我们该穿衣服了，]她说道。");
         outputText("[pg]虽然费了点功夫，但最终你们俩还是把自己收拾得像模像样了，尽管毫无疑问，你们身上仍然散发着强烈的性爱气味。乌尔塔微笑着，依偎着你，吻了你一下，然后打了个哈欠。[say: 好了，我不再欲求不满了，但现在我累了。这个孩子随时都可能出生，所以我需要睡觉——我要回家睡个午觉了，[name]。照顾好自己，好吗？]她对你说道。");
         outputText("[pg]你吻了她一下道别，然后走了出去。");
         dynStats(DynStat.Lust(get_player().sens / 10),DynStat.NoScale);
         doNext(get_camp().returnToCampUseOneHour);
      }
      
      public function acceptUrtaLevelSixPreggoHelps() : void
      {
         clearOutput();
         outputText("你现在感觉真的很累，而且，和乌尔塔共度一整天会很不错，所以你很高兴地接受了她的提议。");
         outputText("[pg]乌尔塔微笑着，张开双臂给你一个充满爱意的拥抱。[say: 好了，[name]，现在我们带你回你的[cabin]躺下；你现在肚子太大了，不能整天到处乱跑了……]");
         outputText("[pg]她没必要这么担心，你感觉很好……但你还是顺从了她的安排。这一天对你来说非常幸福；你什么都不用做，只是闲逛和享受，而乌尔塔则对你无微不至地照顾，做饭、洗衣服，处理所有需要做的事情。夜幕降临，她坚持把她那" + (get_noFur() ? "" : "毛茸茸的") + "屁股停在你的[bed]上，就在你旁边，怎么也不肯挪动，所以你别无选择，只能和她依偎着过夜。第二天早上，你醒来时早餐已经做好了，乌尔塔亲手喂了你大半，然后吻了你，道别后再次出发。");
         get_camp().sleepRecovery(false);
         var _temp_1:* = get_game().time;
         _temp_1.days = _temp_1.days + 1;
         get_game().time.hours = 6;
         doNext(get_camp().returnToCampUseOneHour);
      }
      
      public function acceptARandomGenderFromASkunk() : void
      {
         clearOutput();
         outputText("你决定顺水推舟，表示愿意让莉安娜用她的“性别转换器”在你身上做实验。");
         outputText("[pg][say: 太棒了。]她钻进壁橱里翻找了一番，然后拿着一个奇怪的尖头小瓶和一本笔记本回来了。[saystart]好了，现在我需要你弯下腰。");
         if(get_player().isTaur())
         {
            outputText("或者至少抓紧点什么，这可能会有点刺痛，我可不想你把这里的东西踢坏。");
         }
         outputText("[sayend]");
         outputText("[pg]你小心翼翼地按照炼金术士说的做。她走到你身后，抓住你的[butt]。你本能地紧张起来。然后她的手指划过你的股沟，分析你[asshole]的承受力。她这样做时，你脊背发凉。");
         if(get_player().ass.analLooseness <= 2)
         {
            outputText("[pg][say: 这需要一些润滑剂……]她说道。");
         }
         else
         {
            outputText("[pg][say: 挺松的，我想我可以直接插进去，但我还是涂点润滑剂，让这过程尽可能舒服点。]");
         }
         outputText("你真的应该感到更惊讶，但遗憾的是，这有点在预料之中；你更希望这是一种口服药，或者至少是注射。");
         outputText("[pg]从你的位置看不太清楚，但你看到莉安娜弯腰趴在你身上，用你的屁股作为支撑，一只手伸到她身后。她的脸皱了一下，你听到有什么湿漉漉的东西被挤出来的声音。片刻之后，一只温暖湿润的手触碰到了你的股沟。你努力克制住紧张的冲动；最好快点结束这一切。");
         outputText("[pg]臭鼬炼金术士慢慢地用她滑溜溜的手指在你的小菊花上动作，撑开它并润滑它的内部。首先她插入一根手指，在里面扭动；然后是两根，慢慢地将你撑开；接着是三根，按摩着你的入口。一直持续到她能舒服地在你体内移动三根手指。尽管你努力克制，还是忍不住发出一声淫荡的呻吟。[say: 我想你准备好了。]");
         outputText("[pg]你点点头，准备好迎接她想出的任何变态的“药水”给药方式。[say: 放松，]她说着，将尖端压在你被撑开的屁眼上。你吸了一口气，期待着插入。[say: 差点忘了，我还需要润滑一下这个东西。]她再次弯下腰，向后伸手。传来一声急促的吸气声，你感觉到她抓着你屁股的手收紧了，哪怕只是一点点。你强迫自己放松下来，身体不由自主地微微颤抖。[say: 好了，都准备好了。]她将小瓶的尖端压在你的[asshole]上，没给你时间犹豫，直接推了进去。尽管你努力在心理上做好准备，但当它进入时，对你来说仍然是一种身体上的冲击。她确保将小瓶尽可能深地插入你的屁股，然后抽出手指，让你的自然反应来处理剩下的事情。");
         outputText("[pg]你的屁股在这个小巧、光滑、湿润的入侵者周围收缩蠕动，本能驱使你想要把它排出去。然而，它的设计加上表面的润滑，意味着尽管你努力抗拒，随着你内部肌肉的每一次收缩，它只会滑入你的[asshole]越来越深。最终，它滑入得如此之深，以至于你甚至都感觉不到它了。");
         outputText("[pg]莉安娜微笑着，赞许地点点头。[say: 现在就等药效发作吧。]你呻吟着——那不是什么瓶子，而是某种栓剂。");
         if(Utils.rand(10) <= 3)
         {
            outputText("[pg]一种挥之不去、灼热、令人不快的感觉开始在你那空白、毫无特征的胯部蔓延。你呜咽着呻吟，扭动着身体试图缓解疼痛——感觉就像有什么东西从里面戳着你的腹股沟。");
            outputText("[pg]你原本平坦的腹股沟上鼓起了一个包。慢慢地，它扩大成一个隆起，然后是一个突出物。你感觉到里面有一种紧绷感，忍不住呻吟起来。片刻之后，皮肤肉眼可见地撕裂，一根四英寸长的肉棒从你的腹股沟里爆出来，跳动着并渗出前列腺液。它看起来也相当像人类的。");
            if(get_player().balls == 0)
            {
               outputText("[pg]你感到很奇怪，因为在你新长出的阴茎根部形成了一对肿块；这些肿块迅速生长下垂，形成了多余的皮肤。片刻之后，你呻吟着，一对沉甸甸的睾丸填满了你新的阴囊，瞬间装满了一些精液。它看起来并不起眼，直径只有1英寸，但它似乎肯定很多产。小滴的前列腺液从你的新鸡巴里流出，似乎在表示赞同。");
               get_player().balls = 2;
               get_player().ballSize = 1;
            }
            get_player().createCock();
            get_player().cocks[0].cockLength = 4;
            get_player().cocks[0].cockThickness = 0.75;
            outputText("[pg]你松了一口气，检查着你的新器官；好吧，情况本来可能会更糟的。");
            outputText("[pg][say: 太棒了！反应完全如我所料。我本来想让你现在就帮我，但你最好先休息一下。所以，等你休息好了再回来，我会把你蛋蛋里的东西都榨出来。]");
            outputText("[pg]你点了点头，小心翼翼地穿好衣服，然后走了出去。");
         }
         else if(Utils.rand(10) <= 8)
         {
            outputText("[pg]一阵不难受但十分明显的瘙痒感从你本该是下体的地方传来。你本能地想要去抓挠。");
            outputText("[pg]无论你怎么抓，瘙痒感只会越来越强烈，你也因此加倍用力。这种情况持续了一会儿，直到你突然感觉到手指陷了进去，你舒服地打了个寒颤，喉咙里发出一声呻吟。你感觉到了湿润，起初你还担心是不是流血了，但看了一眼手指，你只看到透明的滑液；是阴道分泌物。随着你转变的最后阶段到来，你喘着粗气，在不适中呻吟着，你湿润的裂口开始肿胀成一个柔软的肉丘，一个小肉核——你的阴蒂长了出来，部分被阴蒂包皮覆盖。");
            if(get_player().biggestTitSize() < 1)
            {
               outputText("[pg]之前袭击你腹股沟的同样瘙痒感再次袭来，但这次是在你的胸部。这次感觉没那么不舒服，你平坦的胸部开始肿胀成坚挺的A罩杯。");
               if(get_player().nippleLength < 0.5)
               {
                  outputText("你的乳头勃起成半英寸长的小肉核，完成了转变。");
                  get_player().nippleLength = 0.5;
               }
               get_player().breastRows[0].breastRating = 1;
            }
            get_player().createVagina();
            get_player().setClitLength(0.25);
            outputText("[pg]你松了一口气，检查着你的新器官；好吧，情况本来可能会更糟的。");
            outputText("[pg][say: 太棒了！反应完全符合我的预期。我本来想让你现在就帮我，但你最好先休息一下。所以等你休息好了再回来，我会看看怎么开发你那可爱的小穴。]");
            outputText("[pg]你点了点头，小心翼翼地穿好衣服，然后走了出去。");
         }
         else
         {
            outputText("[pg]当一股暖流在你的双腿间蔓延时，你淫荡地呻吟着，快感中夹杂着痛苦，皮肤下的瘙痒让你扭动挣扎，试图找到某种释放。这种感觉不断累积，感觉快要把你逼疯了！");
            outputText("[pg]你感觉腹股沟像着了火一样，你急切地揉捏着那里的肉，试图扑灭火焰，但无济于事。你越是抚摸，它就烧得越旺。当一个肿块在你的手下形成，并爆发成一根滚烫的、四英寸长的勃起肉棒时，你忍不住发出了一声痛苦而愉悦的尖叫。你迅速地套弄着自己，试图扑灭折磨你敏感新器官的火焰，但你所能做的只是让它变得更硬……它越硬，就长得越大。直到你的肉棒又长了一英寸，你才终于射精，终于用浓稠的精液浇灭了火焰，也喷了莉安娜一身。");
            outputText("[pg]你松了一口气，很高兴折磨终于结束了。但在你还没来得及放松时，双腿间又传来一阵沸腾的感觉，你又开始抚摸那里的肉。有那么一瞬间，你担心自己可能真的要融化了；你越是揉捏抚摸，那里的肉就变得越柔软。突然，一阵湿润袭来，一股汁液从里面喷涌而出，弄湿了你的手和莉安娜的地毯，那里的肉变得丰满、湿润、光滑。热量集中在一个小点上，很快形成了一个小肉核；你的阴蒂。");
            outputText("[pg]在经历了这些剧烈的转变后，你虚弱得甚至没有意识到自己长出了两套生殖器官；相反，你走到莉安娜的床边，一屁股坐了下去。");
            get_player().createVagina();
            get_player().setClitLength(0.25);
            get_player().createCock();
            get_player().cocks[0].cockLength = 5;
            get_player().cocks[0].cockThickness = 1;
            if(get_player().biggestTitSize() < 3)
            {
               outputText("[pg]你的胸部发痒。这并不是很不舒服，即使不舒服，你也太累了，根本不想去抓或揉捏它。你的[chest]开始");
               if(get_player().biggestTitSize() < 1)
               {
                  outputText("");
               }
               outputText("肿胀成柔软的C罩杯。");
               if(get_player().nippleLength < 0.5)
               {
                  outputText("你的乳头勃起成半英寸长的小肉核，完成了转变。");
                  get_player().nippleLength = 0.5;
               }
               outputText("你看着胸前柔软的肉丘，除了喘气什么也做不了。");
               get_player().breastRows[0].breastRating = 3;
            }
            if(get_player().balls == 0)
            {
               outputText("[pg]当你新长出的肉棒根部形成一对肿块时，你感觉很奇怪。这些肿块迅速变大下垂，形成多余的皮肤。片刻之后，你呻吟了一声，因为一对沉甸甸的睾丸填满了你的新阴囊，瞬间装满了一些精液。它的直径只有2英寸。起初你没怎么在意，但随着你的睾丸变得越来越饱满，一种突然的不适感袭来。尽管你的睾丸不大，但似乎和牛头人一样多产。很快，你翻腾、饱满的阴囊就没有空间了，你开始自发地达到高潮，把莉安娜和她的地毯弄得更脏了。");
               get_player().balls = 2;
               get_player().ballSize = 2;
            }
            outputText("[pg]这位臭鼬炼金术士似乎一点也不在意这烂摊子，她只是继续做笔记，每次似乎有什么新情况出现时都会盯着你看。[say: 这确实出乎意料。这么强烈的反应不在我的计划之内，但不管怎样，似乎已经达到了目的。]她一边继续做笔记，一边饶有兴致地记录着。");
            outputText("[pg]所以，她从来没打算让她的实验产生双性人，你问道。她只是摇了摇头，甚至懒得口头回答你，也没有停止写字。你叹了口气；典型的疯狂科学家类型。");
            outputText("[pg]她终于收起笔记本，低头看着你俯卧的身体。[say: 你能走吗？]你回答说你不确定；你觉得有点虚弱。[say: 如果你虚弱得走不动，欢迎你用我的床；等你休息好了，我们可以再做几个关于你对我的药水反应的实验。]你坚决表示你没那么虚弱——而且，即使你很虚弱，你现在也没兴趣帮忙做任何实验了。");
            outputText("[pg][say: 好吧。别担心弄得一团糟，我会清理干净的。只是太可惜了，我没有东西来接住这些分泌物。那些样本现在都被污染了，所以我还需要你帮忙收集更多。] 你没有理会她，而是专注于从床上爬起来，穿好衣服准备出门。");
            outputText("[pg]她抹下身上的一条精液，塞进嘴里。[say: 味道不错。我想知道这是药水的作用，还是你天生就这么美味。以后得测试一下……] 这时你已经穿好衣服，并迅速离开。[say: 回见！] 当你匆忙走出去时，你听到她在你身后喊道。");
         }
         doNext(get_camp().returnToCampUseOneHour);
      }
      
      public function IAintGotTimeForUrtaBirfs() : void
      {
         var _loc1_:* = null as IMap;
         clearOutput();
         outputText("半人马对你的拒绝感到困惑。[say:我——什么？真的吗？]");
         outputText("[pg]你点点头，解释了你不能去的原因。半人马的下巴动了动，但他什么也没说，只是点点头，然后飞奔而去。你立刻回去睡觉了。");
         _loc1_ = KFLAGS.flags;
         FlagDict_Impl_.arrayWriteInt(_loc1_,790,FlagDict_Impl_.arrayReadInt(_loc1_,790) + 1);
         FlagDict_Impl_.arrayWriteInt(KFLAGS.flags,797,Utils.rand(3) + 1);
         if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,797) == 1)
         {
            _loc1_ = KFLAGS.flags;
            FlagDict_Impl_.arrayWriteInt(_loc1_,792,FlagDict_Impl_.arrayReadInt(_loc1_,792) + 1);
         }
         else if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,797) == 2)
         {
            _loc1_ = KFLAGS.flags;
            FlagDict_Impl_.arrayWriteInt(_loc1_,793,FlagDict_Impl_.arrayReadInt(_loc1_,793) + 1);
         }
         else
         {
            _loc1_ = KFLAGS.flags;
            FlagDict_Impl_.arrayWriteInt(_loc1_,794,FlagDict_Impl_.arrayReadInt(_loc1_,794) + 1);
         }
         if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,797) == 3 || FlagDict_Impl_.arrayReadInt(KFLAGS.flags,797) == 1)
         {
            if(Utils.rand(2) == 0)
            {
               FlagDict_Impl_.arrayWriteInt(KFLAGS.flags,798,2);
            }
            else
            {
               FlagDict_Impl_.arrayWriteInt(KFLAGS.flags,798,1);
            }
         }
         if(urtaKids() == 1)
         {
            FlagDict_Impl_.arrayWriteInt(KFLAGS.flags,795,FlagDict_Impl_.arrayReadInt(KFLAGS.flags,797));
            FlagDict_Impl_.arrayWriteInt(KFLAGS.flags,796,FlagDict_Impl_.arrayReadInt(KFLAGS.flags,798));
         }
         FlagDict_Impl_.arrayWriteInt(KFLAGS.flags,799,1);
         doNext(get_camp().returnToCampUseOneHour);
      }
   }
}

