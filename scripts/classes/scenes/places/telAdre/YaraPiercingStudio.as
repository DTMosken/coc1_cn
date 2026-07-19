package classes.scenes.places.telAdre
{
   import classes.CoC;
   import classes.Cock;
   import classes.DynStat;
   import classes.PerkLib;
   import classes.Player;
   import classes.StatusEffects;
   import classes.Vagina;
   import classes.display.SpriteDb;
   import classes.scenes.places.TelAdre;
   import flash.Boot;
   
   public class YaraPiercingStudio extends TelAdreAbstractContent
   {
      
      public static var LOC_CLIT:int = 0;
      
      public static var LOC_DICK:int = 1;
      
      public static var LOC_EARS:int = 2;
      
      public static var LOC_EYEBROW:int = 3;
      
      public static var LOC_LIP:int = 4;
      
      public static var LOC_NIPPLES:int = 5;
      
      public static var LOC_NOSE:int = 6;
      
      public static var LOC_TONGUE:int = 7;
      
      public static var LOC_VULVA:int = 8;
      
      public static var MAT_AMETHYST:int = 1;
      
      public static var MAT_DIAMOND:int = 2;
      
      public static var MAT_GOLD:int = 3;
      
      public static var MAT_EMERALD:int = 4;
      
      public static var MAT_JADE:int = 5;
      
      public static var MAT_ONYX:int = 6;
      
      public static var MAT_RUBY:int = 7;
      
      public static var MAT_STEEL:int = 8;
      
      public static var MAT_LETHITE:int = 9;
      
      public static var MAT_FERRITE:int = 10;
      
      public static var MAT_FURRITE:int = 11;
      
      public static var MAT_CRIMSTONE:int = 12;
      
      public static var MAT_ICESTONE:int = 13;
      
      public static var TYPE_NONE:int = 0;
      
      public static var TYPE_STUD:int = 1;
      
      public static var TYPE_RING:int = 2;
      
      public static var TYPE_LADDER:int = 3;
      
      public static var TYPE_HOOP:int = 4;
      
      public static var TYPE_CHAIN:int = 5;
      
      public var inverse:Boolean;
      
      public function YaraPiercingStudio()
      {
         if(Boot.skip_constructor)
         {
            return;
         }
         inverse = false;
         super();
      }
      
      public function yaraSex(param1:Boolean) : void
      {
         var girl1:Boolean;
         var _g:YaraPiercingStudio;
         spriteSelect(null);
         clearOutput();
         outputText("雅拉让你舒服地坐好，并在她使用穿孔工具时让你把脸转过去。很痛，但她技术很好。不知不觉中，你的穿孔就完成了！你起身，保留了一点矜持");
         if(get_game().ceraphScene.hasExhibition())
         {
            outputText("尽管有种负罪的快感");
         }
         outputText("。[say: 等等，]雅拉轻柔地命令道，把手按在你的[chest]上，把你推回椅子上。[say: 你以为我会让你在没有进行一些……实地测试的情况下就离开吗？][pg]");
         outputText("她似乎一心想要得到一些爱抚——你想拒绝她，还是顺其自然？");
         menu();
         addButton(0,"拒绝",piercingStudio);
         _g = this;
         girl1 = param1;
         addButton(1,"哦耶！",function():void
         {
            _g.letsDoYaraSex(girl1);
         });
      }
      
      public function piercingStudio() : void
      {
         spriteSelect(SpriteDb.get_s_yara());
         clearOutput();
         menu();
         outputText("穿孔工作室的内部充满了泥土气息，石制的地板和墙壁裸露在外，不过窗户上挂着由五颜六色的线缝制而成的编织毯。这里有几把舒适的椅子，面向一面镜墙，还有一个架子，上面摆满了针头、穿孔饰品和烈酒。一个黑发女人在店里走来走去，趁着生意清淡的时候打扫卫生。" + (get_noFur() ? "" : " 你迟钝地注意到，与镇上的其他人不同，她大部分特征还是人类。也许她也是通过传送门来到这里的？") + " 她向你走来，你看到她身后摇晃着一条猫尾巴，头顶上竖着一对毛茸茸的猫耳，上面都戴满了穿孔饰品。很明显，她在这里待的时间够长了，已经沾染了一些当地的风味。[pg]");
         outputText("她自我介绍道：[say: 你好，" + get_player().mf("先生","小可爱") + "，我叫雅拉。你想打个穿孔吗？]");
         menu();
         addButton(0,"打孔",pierceMenu);
         addButton(1,"移除",piercingRemove);
         if(!get_player().hasStatusEffect(StatusEffects.Yara))
         {
            addButton(2,"关于她",aboutYara);
         }
         addButton(14,"离开",get_telAdre().armorShops);
      }
      
      public function piercingRemove() : void
      {
         spriteSelect(null);
         hideUpDown();
         if(!buildLocChoices(doRemove,true))
         {
            clearOutput();
            outputText("雅拉咯咯笑着，[say: 你身上没有任何穿孔，傻瓜！]");
            doNext(piercingStudio);
            return;
         }
         clearOutput();
         outputText("[say: 真的吗？]雅拉问道，[say: 我告诉过你那些穿孔是永久的！好吧，我想它们是可以移除的，但之后你会痛得要死。如果你真的想让我移除，我可以移除一些，但你需要支付100宝石作为止痛药和人工费。]");
         if(get_player().get_gems() < 100)
         {
            outputText("[pg]<b>你没有足够的宝石。</b>");
            doNext(piercingStudio);
            return;
         }
         if(get_player().get_tou() <= 5.5)
         {
            clearOutput();
            outputText("雅拉上下打量了你一番，然后直截了当地拒绝了你，[say: 你看起来不太好，[name]。我不认为你的身体现在能承受得住。]");
            doNext(piercingStudio);
         }
      }
      
      public function pierceMenu() : void
      {
         menu();
         spriteSelect(null);
         hideUpDown();
         clearOutput();
         outputText("雅拉问道，[say: 那么，你想在哪里打孔呢，" + get_player().mf("先生","小可爱") + "？不过要记住，我的穿孔很特别——它们是永久性的，无法取下。]");
         if(!buildLocChoices(chooseLoc))
         {
            outputText("[pg]你快速打量了一下自己，发现已经没有地方可以让她打孔了。好吧。");
            doNext(piercingStudio);
         }
      }
      
      public function normalPierceAssemble(param1:int, param2:int, param3:int) : void
      {
         var _loc7_:* = null as Player;
         spriteSelect(null);
         clearOutput();
         outputText("雅拉让你放松下来，并在她使用穿孔工具时让你把头转过去。虽然有点疼，但她的技术很熟练，不知不觉中，你的穿孔就完成了！");
         var _loc4_:String = "";
         var _loc5_:String = "";
         var _loc6_:Player = get_player();
         _loc6_.set_gems(_loc6_.get_gems() - 100);
         if(param3 > 8)
         {
            _loc7_ = get_player();
            _loc7_.set_gems(_loc7_.get_gems() - 900);
         }
         if(param3 == 13)
         {
            _loc7_ = get_player();
            _loc7_.set_gems(_loc7_.get_gems() - 1000);
         }
         statScreenRefresh();
         switch(param3)
         {
            case 1:
               _loc4_ += "紫水晶 ";
               dynStats(DynStat.Inte(1),DynStat.Lib(1));
               _loc5_ += "紫水晶 ";
               break;
            case 2:
               _loc4_ += "钻石 ";
               dynStats(DynStat.Inte(2),DynStat.Cor(-1));
               _loc5_ += "钻石 ";
               break;
            case 3:
               _loc4_ += "黄金 ";
               dynStats(DynStat.Inte(1),DynStat.Sens(1));
               _loc5_ += "黄金 ";
               break;
            case 4:
               _loc4_ += "绿宝石 ";
               dynStats(DynStat.Spe(1));
               _loc5_ += "绿宝石 ";
               break;
            case 5:
               _loc4_ += "翡翠 ";
               dynStats(DynStat.Tou(-0.5),DynStat.Inte(1),DynStat.Cor(-1));
               _loc5_ += "翡翠 ";
               break;
            case 6:
               _loc4_ += "缟玛瑙";
               dynStats(DynStat.Tou(1),DynStat.Spe(-1));
               _loc5_ += "缟玛瑙";
               break;
            case 7:
               _loc4_ += "红宝石";
               dynStats(DynStat.Lib(1),DynStat.Sens(1));
               _loc5_ += "红宝石";
               break;
            case 8:
               _loc4_ += "钢铁";
               dynStats(DynStat.Str(2),DynStat.Inte(-2));
               _loc5_ += "钢铁";
               break;
            case 9:
               _loc4_ += "莱希石";
               if(!get_player().hasPerk(PerkLib.PiercedLethite))
               {
                  get_player().createPerk(PerkLib.PiercedLethite,0,0,0,0);
               }
               _loc5_ += "莱希石";
               break;
            case 10:
               _loc4_ += "丰饶石";
               if(!get_player().hasPerk(PerkLib.PiercedFertite))
               {
                  get_player().createPerk(PerkLib.PiercedFertite,5,0,0,0);
               }
               else
               {
                  get_player().addPerkValue(PerkLib.PiercedFertite,1,5);
               }
               _loc5_ += "丰饶石";
               break;
            case 11:
               _loc4_ += "兽诱石";
               if(!get_player().hasPerk(PerkLib.PiercedFurrite))
               {
                  get_player().createPerk(PerkLib.PiercedFurrite,0,0,0,0);
               }
               _loc5_ += "兽诱石";
               break;
            case 12:
               _loc4_ += "绯红石";
               if(get_player().hasPerk(PerkLib.PiercedIcestone))
               {
                  get_player().addPerkValue(PerkLib.PiercedIcestone,1,-5);
                  if(get_player().perkv1(PerkLib.PiercedIcestone) <= 0)
                  {
                     get_player().removePerk(PerkLib.PiercedIcestone);
                  }
               }
               else if(get_player().findPerk(PerkLib.PiercedCrimstone) <= 0)
               {
                  get_player().createPerk(PerkLib.PiercedCrimstone,5,0,0,0);
               }
               else
               {
                  get_player().addPerkValue(PerkLib.PiercedCrimstone,1,5);
               }
               _loc5_ += "绯红石";
               break;
            case 13:
               _loc4_ += "冰晶石";
               if(get_player().hasPerk(PerkLib.PiercedCrimstone))
               {
                  get_player().addPerkValue(PerkLib.PiercedCrimstone,1,-5);
                  if(get_player().perkv1(PerkLib.PiercedCrimstone) <= 0)
                  {
                     get_player().removePerk(PerkLib.PiercedCrimstone);
                  }
               }
               else if(get_player().findPerk(PerkLib.PiercedIcestone) <= 0)
               {
                  get_player().createPerk(PerkLib.PiercedIcestone,5,0,0,0);
               }
               else
               {
                  get_player().addPerkValue(PerkLib.PiercedIcestone,1,5);
               }
               _loc5_ += "冰晶石";
         }
         switch(param1)
         {
            case 0:
               _loc4_ += "阴蒂-";
               _loc5_ += "阴蒂-";
               dynStats(DynStat.Sens(2));
               break;
            case 1:
               if(param2 != 3)
               {
                  _loc4_ += "肉棒-";
                  _loc5_ += "肉棒-";
                  dynStats(DynStat.Lib(2));
               }
               break;
            case 2:
               _loc4_ += "耳朵";
               _loc5_ += "耳朵";
               break;
            case 3:
               dynStats(DynStat.Tou(-0.5));
               _loc4_ += "眉毛-";
               _loc5_ += "眉毛-";
               break;
            case 4:
               dynStats(DynStat.Tou(-0.5));
               _loc4_ += "嘴唇-";
               _loc5_ += "嘴唇-";
               break;
            case 5:
               dynStats(DynStat.Lib(1),DynStat.Sens(1));
               _loc4_ += "乳头-";
               _loc5_ += "乳头-";
               break;
            case 6:
               dynStats(DynStat.Str(0.5));
               _loc4_ += "鼻子-";
               _loc5_ += "鼻子-";
               break;
            case 7:
               dynStats(DynStat.Sens(1));
               _loc4_ += "舌头-";
               _loc5_ += "舌头-";
               break;
            case 8:
               dynStats(DynStat.Sens(1));
               _loc4_ += "阴唇-";
               _loc5_ += "阴唇-";
         }
         switch(param2)
         {
            case 1:
               if(param1 == 2 || param1 == 5 || param1 == 8)
               {
                  _loc4_ += "钉";
                  _loc5_ += "钉";
               }
               else
               {
                  _loc4_ += "钉";
                  _loc5_ += "钉";
               }
               break;
            case 2:
               if(param1 == 2 || param1 == 5 || param1 == 8)
               {
                  _loc4_ += "环";
                  _loc5_ += "环";
               }
               else
               {
                  _loc4_ += "环";
                  _loc5_ += "环";
               }
               break;
            case 3:
               _loc4_ += "雅各布天梯";
               _loc5_ += "雅各布天梯";
               break;
            case 4:
               if(param1 == 2 || param1 == 5 || param1 == 8)
               {
                  _loc4_ += "圈";
                  _loc5_ += "圈";
               }
               else
               {
                  _loc4_ += "圈";
                  _loc5_ += "圈";
               }
               break;
            case 5:
               _loc4_ += "链";
               _loc5_ += "链";
         }
         applyPiercing(param1,param2,_loc4_,_loc5_);
         if(param1 == 8 || param1 == 0)
         {
            yaraSex(true);
            return;
         }
         if(param1 == 1 && (get_player().hasCockThatFits(36) || get_hyper()))
         {
            yaraSex(false);
            return;
         }
         doNext(piercingStudio);
      }
      
      public function letsDoYaraSex(param1:Boolean = true) : void
      {
         spriteSelect(null);
         clearOutput();
         var _loc2_:int = get_player().cockThatFits(36);
         if(get_hyper())
         {
            _loc2_ = get_player().cockThatFits(50000);
         }
         else if(_loc2_ == -1 && !param1)
         {
            if(!get_player().hasVagina())
            {
               outputText("[say: 抱歉，小可爱。我可吃不下你那根巨大的肉棒！]她看着你那硕大的阳具，显得有些垂头丧气。也许等你把它缩小到合适的尺寸再来？");
               return;
            }
            outputText("[say: 哦亲爱的，小可爱。我可吃不下你那根巨大的肉棒！]她看着你那硕大的阳具，显得有些垂头丧气。[say: 哎，]她叹了口气。[say: 看来我只能去探索你女性化的一面了。][pg]");
            param1 = true;
         }
         outputText("当你开始");
         if(get_player().get_lust() < 50)
         {
            outputText("抗议");
         }
         else
         {
            outputText("说话");
         }
         outputText("时，她瞪大了眼睛，用眼中燃烧的欲火利落地让你安静下来。[say: 就当是质量测试吧，]她发出呼噜声。她空闲的手在你大腿内侧上下游走，那令人发痒的挑逗几乎让你头晕目眩。雅拉期待地舔了舔嘴唇，扭动着脱下衣服，爬上椅子，跪在扶手上。由于她姿势尴尬，你发现自己的目光不由自主地飘向了她大张的双腿。在那里，一枚金色的圆环穿过她已经跳动不已的阴蒂，闪烁着耀眼的光泽。当她注意到你的注视时，脸颊泛起红晕，但她似乎反而因此更加兴奋。[pg]");
         outputText("雅拉空闲的手顺着平坦的小腹滑下——越过肚脐上的脐钉——一直滑到她的私处。她用两根手指拨开阴唇，让你清楚地看到她闪闪发光的阴蒂环和深处的肉穴。她轻轻咬着下唇");
         if(!param1 && get_player().hasCock())
         {
            outputText("看着你的" + get_player().cockDescript(_loc2_) + "挺立起来，她的目光紧紧盯着那根坚硬的肉棒。你强忍住抓住她纤细却充满少女感的臀部，当场狠狠操进去的冲动，好奇地任由她挑逗。");
         }
         else
         {
            outputText("一滩越来越大的爱液弄脏了带软垫的椅子。你几乎用尽了全力才克制住把她拉下来，把她的脸按进你私处的冲动。");
         }
         outputText("[pg]");
         outputText("她倾身向前，给了你一个湿润而缠绵的吻。她向下移动，亲吻着");
         if(get_player().biggestTitSize() < 1)
         {
            outputText("你的胸膛");
         }
         else
         {
            outputText("你的乳头，一次一个");
         }
         outputText("并亲吻你的肚子。然而，即使她拥有种族特有的柔韧性，从那个角度她也无法再往下够了。[say: 拿着这个，亲爱的，]她有些俏皮地说着，转过身，把屁股靠在你的[chest]上。在这个新姿势下，雅拉可以轻松地摆弄你的下体，从她摇摆的尾巴不断扫过你脸庞的样子，你可以看出她很兴奋。[pg]");
         outputText("看来这只猫娘并不满足于简单的插入，她开始行动了。");
         if(get_player().balls > 0)
         {
            outputText("她灵巧的指尖拂过你的[balls]，轻柔飘忽的抚摸让你浑身战栗。这种若有若无的接触，至少和你遇到过的那些不那么含蓄的玛瑞斯人一样令人兴奋。");
         }
         outputText("她稍微向前挪了挪，将湿透的阴部顺着你的胸膛往下蹭，试图够到你的胯部。[pg]");
         if(!param1 && get_player().hasCock())
         {
            outputText("雅拉撅起嘴唇贴上你的龟头，她的头左右倾斜，恼人地反复亲吻着你的" + get_player().cockDescript(_loc2_) + "。然而，她突然停了下来，充满期待地斜睨着你。当你没有立刻回应时，她叹了口气——呼在你的肉棒上——并把臀部抬高到与你鼻子平齐的位置。在短暂地迷失在她紧致又富有弹性的臀瓣的弹跳中后，你明白了她的意思，倾身向前，对她肿胀的私处进行了漫长而缠绵的舔舐。作为回报，你听到了一声低沉而非常满足的呻吟。当你准备再尝一口时，穿过她敏感点的闪亮圆环像磁铁一样吸引了你的注意力。你像刚出生的小猫一样轻柔地用牙齿咬住那个嵌在阴蒂上的小玩意。当你开始轻轻拉扯那个穿孔时，雅拉整个人都僵住了，完全被那种敏感所麻痹。当她试图适应你拉扯的动作时，嘴里发出了含糊不清的喵喵声。她柔软的身躯在狂喜中痉挛，迫使你松开她，以免她的下盘发生什么不幸的事。[pg]");
            outputText("你一松开那令人头皮发麻的抓握，她就猛地把臀部向前一挺——在这个过程中，她倾泻而出的淫液溅到了你的[armor]上——然后向后仰，急忙将自己对准你的" + get_player().cockDescript(_loc2_) + "。她只犹豫了一秒钟，在急不可耐的肉棒上滴了一点润滑液，然后就猛地坐了下去，直到她的屁股撞上你的骨盆才停下来。[pg]");
            outputText("雅拉完全掌控了局面，她死死抓住扶手，获得了充分的交合机动性。尽管很容易就进去了，但你还是不敢相信她湿透的肉褶把你夹得有多紧。很长一段时间里，唯一能听到的声音就是她臀瓣拍打的声音，以及这只戴着穿孔的猫娘断断续续的欢愉喘息。[say: 我想说……你的新穿孔……效果真不错，]她在低沉的呻吟中喃喃自语。[pg]");
            outputText("还没等你回应，雅拉就加快了速度，她已经看到了终点。你迫不及待地想帮她一把，双手环住了她纤细的腰肢。她发出满足的呼噜声，感谢你的帮助。没过多久，伴随着一声充满野性与胜利的尖叫，她将全身的重量都压了下来，先列腺液和淫液的混合物四处飞溅，她下落的力度甚至让你感到一丝刺痛。[pg]");
            outputText("这强有力的动作正是你身体所需的全部动力。在你们任何一方考虑到内射的后果之前，你们的身体就僵住了，陷入了熟悉的高潮极乐之中。");
            if(get_player().cumQ() < 500)
            {
               outputText("当你的浓精将她的私密通道涂满雪白的种子时，雅拉的整个身体都在痉挛。猫娘快乐地扭动着，脊背向后弓起，你们的目光几乎要交汇在一起。");
               outputText("[pg]雅拉从你的肉棒上下来，动作流畅地跳到地上。");
            }
            else if(get_player().cumQ() <= 1500)
            {
               outputText("随着你灌入的精液，雅拉的肚子肉眼可见地鼓了起来，额外的重量压得她弯下腰，沉重地靠在你的[leg]上。她高兴地发出呼噜声，即使高潮的余韵还在她体内震颤，她也忍不住拍了拍自己胀大的肚子。");
               outputText("[pg]雅拉从你身上起来，一只手按着肚子，有些笨拙地从椅子上走下来。");
            }
            else
            {
               outputText("她低沉而狂喜的呻吟迅速升级为刺耳的尖叫，紧绷的肚子在片刻间迅速膨胀到沙滩排球大小。她费了九牛二虎之力，才勉强把自己从你那根还在喷射精液的肉棒上拔出来，向后倒在你身上。雅拉心满意足地叹了口气，依偎在你的[chest]里，尽管精液还在从她被填满的下体中滴落，她还是找了个舒服的姿势。你就在那里坐了几分钟，耐心地等待着你狂暴的射精结束。");
               outputText("[pg]雅拉努力想要站起来，但最终还是被她那装满液体的巨大肚子给阻碍了。她斜眼看着你，露出羞涩的笑容，紧张地咯咯笑了起来。[say: 朋友，介意帮我一把吗？]她犹豫了片刻后说道。在你的帮助下，她站了起来，双腿还在打颤。她尽力让自己平静下来，而你的精液还在顺着她的大腿流下，当她不耐烦地按压着肿胀的肚子时，水流变得更加湍急。");
            }
            outputText("[pg][say: 效果好极了，]你们俩重新穿好衣服时，她总结道");
            if(get_player().cumQ() > 1500)
            {
               outputText("，雅拉尽力将衣服套在她隆起的腹部上");
            }
            outputText("。[say: 随时欢迎再来，好吗？我相信我们可以再安排一次……预约！]");
         }
         else
         {
            outputText("两根调皮的食指沿着你女性堡垒的边缘游走，这是准备迎接围攻的信号。雅拉伸手到你座位旁边，推了一下控制杆，椅背降到了大约30度的角度。接着她抓住椅子的扶手，迅速撑起身体，做了一个类似前滚翻的动作。还没等你夸奖她的身手，她的双腿就飞到了你头部的两侧。唯一接触到你的是她灵活的双脚，从你的肚子轻轻向上抚摸，经过你的胸部，离开你的肩膀，然后飞过椅背。这位猫科杂技演员让你把手张开放在椅子两侧，你立刻照办了。她毫不迟疑地抓住你的上臂，让她的身体从你身上向前滑落。你也以同样的方式抱住她，阻止了她的下落。[pg]");
            outputText("试图理清眼前的场景是徒劳的。雅拉以前肯定做过这种事，因为你们俩摊开的身体停在了一个恰到好处的位置，让你们俩的肉体孔洞都清楚地暴露在对方的脸前。当你的[vagina]开始接受[say: 质量测试]时，空气从你紧闭的双唇间溜走，你的猫咪同志率先用舌头探向你丝滑的边缘。");
            if(get_player().wetness() >= 3)
            {
               outputText("你的小穴湿得一塌糊涂，她简直就像在舔一根融化的冰棍。");
            }
            else
            {
               outputText("你相对干燥的边缘地带成了容易下口的目标。");
            }
            outputText("不甘示弱的你，舌头也充满野心地探了进去，仿佛要证明什么似的，与你伴侣的动作如出一辙。你们互相舔舐的动作不时被呻吟或轻喘打断，彼此抓着对方的手也越来越紧。[pg]");
            outputText("雅拉抬起头——对她来说是低下头——看着你的[clit]，你散发的女性芳香像猫薄荷一样让她兴奋不已。你对她小穴的攻势被打断了，因为你的快乐按钮正享受着前所未有的口舌伺候，这引得你的队友喉咙深处发出一阵会心的笑声。雅拉很幸运，你只是加倍用力地夹紧了她的手臂，而不是在身体因满足而扭动时让这个可怜的女人滑落到地上。但这可是一场战争，如果你像她一样软弱到直接去攻击那颗“皇冠上的宝石”，那你可就太丢人了。不，你开始大干一场，重新定义了什么叫舔穴。你的辛勤耕耘得到了回报，这只小猫娘对你豆豆的攻势开始减弱。然而，她的抓握开始动摇，迫使你将你的猎物猛拉向自己。这个动作打破了她的满足感，她锁住你手臂的力道随之加强，空气中弥漫着两人交织的闷哼声。[pg]");
            outputText("从这位“柔术演员”摇摇欲坠的拥抱来看，你觉得这是给予致命一击的绝佳时机。当你扑向她那穿孔的阴蒂时，雅拉毫无招架之力，你的舌头卡在了阴蒂环和她的爱之豆之间。她用尽了所有的意志力，才在紧紧抓住你手臂的同时，继续对你的阴蒂枢纽保持攻势。然而，你口中的拉扯与挑逗最终成为了赢家，标志便是那直接喷洒在你脸上的淫液。这股混合着雅拉在高潮加持下对你下体做出的最后拼死一搏，也引发了你自身令人满足的爆发。连锁反应的结局是你们两人的连接都松开了，导致这只猫娘头朝下向地板滑去。[pg]");
            outputText("不过，她的头并没有撞到地上。在你喘着粗气放松下来时，你设法抓住了她的腿。[say:抓得……抓得好，]雅拉倒挂着，软绵绵的手臂摊在地板上，一边心满意足地打着呼噜，一边勉强挤出这句话。大约一分钟后，你们俩都恢复了一些镇定，但刚才那位出色的体操运动员现在只能在地上爬行，试图重新找回平衡。你最多只需要把椅背调好，抬到一个更舒服的高度。[say:朋友，能再帮我一把吗？]雅拉请求道，她现在至少已经能坐直了。当你把这位金属工匠拉起来时，你们俩交换了一个心照不宣的眼神。");
         }
         get_player().orgasm(param1 ? "Vaginal" : "Dick");
         doNext(piercingStudio);
      }
      
      public function doRemove(param1:int) : void
      {
         clearOutput();
         outputText("雅拉给了你一些喝的，你很快就晕了过去。大约一个小时后你醒来，感到酸痛和虚弱，不过谢天谢地没有流血。");
         applyPiercing(param1);
         dynStats(DynStat.Tou(-5));
         var _loc2_:Player = get_player();
         _loc2_.set_gems(_loc2_.get_gems() - 100);
         statScreenRefresh();
         doNext(piercingStudio);
      }
      
      public function chooseMaterials(param1:int, param2:int) : void
      {
         var type9:int;
         var loc9:int;
         var _g8:YaraPiercingStudio;
         var mat7:int;
         var type8:int;
         var loc8:int;
         var _g7:YaraPiercingStudio;
         var mat6:int;
         var type7:int;
         var loc7:int;
         var _g6:YaraPiercingStudio;
         var mat5:int;
         var type6:int;
         var loc6:int;
         var _g5:YaraPiercingStudio;
         var mat4:int;
         var type5:int;
         var loc5:int;
         var _g4:YaraPiercingStudio;
         var mat3:int;
         var type4:int;
         var loc4:int;
         var _g3:YaraPiercingStudio;
         var mat2:int;
         var type3:int;
         var loc3:int;
         var _g2:YaraPiercingStudio;
         var mat1:int;
         var type2:int;
         var loc2:int;
         var _g1:YaraPiercingStudio;
         var mat:int;
         var type1:int;
         var loc1:int;
         var _g:YaraPiercingStudio;
         menu();
         spriteSelect(null);
         clearOutput();
         outputText("雅拉收拾好材料，说道：[say: 好了，现在你想要什么材质的？别担心价格，这些都不算稀有，所以穿环只要100宝石。不过我确实有一些更稀有的材料；如果你想看看，需要准备1000宝石。]");
         if(get_player().get_gems() < 100)
         {
            outputText("[pg]你意识到自己没有足够的宝石来穿环。");
            doNext(piercingStudio);
            return;
         }
         menu();
         _g = this;
         loc1 = param1;
         type1 = param2;
         mat = 1;
         addButton(0,"紫水晶",function():void
         {
            _g.areYouSure(loc1,type1,mat);
         });
         _g1 = this;
         loc2 = param1;
         type2 = param2;
         mat1 = 2;
         addButton(1,"钻石",function():void
         {
            _g1.areYouSure(loc2,type2,mat1);
         });
         _g2 = this;
         loc3 = param1;
         type3 = param2;
         mat2 = 3;
         addButton(2,"黄金",function():void
         {
            _g2.areYouSure(loc3,type3,mat2);
         });
         _g3 = this;
         loc4 = param1;
         type4 = param2;
         mat3 = 4;
         addButton(3,"绿宝石",function():void
         {
            _g3.areYouSure(loc4,type4,mat3);
         });
         _g4 = this;
         loc5 = param1;
         type5 = param2;
         mat4 = 5;
         addButton(4,"翡翠",function():void
         {
            _g4.areYouSure(loc5,type5,mat4);
         });
         _g5 = this;
         loc6 = param1;
         type6 = param2;
         mat5 = 6;
         addButton(5,"缟玛瑙",function():void
         {
            _g5.areYouSure(loc6,type6,mat5);
         });
         _g6 = this;
         loc7 = param1;
         type7 = param2;
         mat6 = 7;
         addButton(6,"红宝石",function():void
         {
            _g6.areYouSure(loc7,type7,mat6);
         });
         _g7 = this;
         loc8 = param1;
         type8 = param2;
         mat7 = 8;
         addButton(7,"钢铁",function():void
         {
            _g7.areYouSure(loc8,type8,mat7);
         });
         if(get_player().get_gems() >= 1000)
         {
            _g8 = this;
            loc9 = param1;
            type9 = param2;
            addButton(8,"稀有菜单",function():void
            {
               _g8.chooseAdvancedMaterials(loc9,type9);
            });
         }
         else
         {
            addButtonDisabled(8,"稀有菜单","你买不起这个！");
         }
         addButton(14,"返回",piercingStudio);
      }
      
      public function chooseLoc(param1:int) : void
      {
         var type4:int;
         var loc5:int;
         var _g4:YaraPiercingStudio;
         var type3:int;
         var loc4:int;
         var _g3:YaraPiercingStudio;
         var type2:int;
         var loc3:int;
         var _g2:YaraPiercingStudio;
         var type1:int;
         var loc2:int;
         var _g1:YaraPiercingStudio;
         var type:int;
         var loc1:int;
         var _g:YaraPiercingStudio;
         doNext(pierceMenu);
         if(param1 == 1 && !get_player().hasCock())
         {
            outputText("[pg]你意识到自己没有阴茎可以打孔。哎呀！最好选点别的……");
            return;
         }
         if((param1 == 0 || param1 == 8) && !get_player().hasVagina())
         {
            outputText((param1 == 0 ? "[pg]你意识到自己没有阴蒂可以打孔。" : "[pg]你意识到自己没有小穴可以打孔。") + " 哎呀！最好选点别的……");
            return;
         }
         switch(param1)
         {
            case 0:
               outputText("[pg][say: 哦哦，那一定会可爱到让人想吸的！] 雅拉惊呼道，脸红得厉害。[say: 你想要什么样的穿孔？]");
               break;
            case 1:
               outputText("[pg][say: 好的，这会非常痛，但我听说效果很好。你想要什么样的穿孔？] 雅拉问道。");
               break;
            case 2:
               outputText("[pg][say: 好的，让我拿一下工具，我们就可以开始了。你想要什么样的首饰？] 雅拉问道。");
               break;
            case 3:
               outputText("[pg][say: 啊，那看起来不错！你想要什么样的？] 雅拉问道。");
               break;
            case 4:
               outputText("[pg][say: 哦天哪，那一定会很火辣！你想要什么样的首饰？] 雅拉问道。");
               break;
            case 5:
               outputText("[pg][say: 是的，当然可以！你想要什么样的首饰？我自己比较偏爱乳头链，] 雅拉承认道，脸涨得通红。");
               break;
            case 6:
               outputText("[pg]雅拉厌恶地皱了皱鼻子，[say: 真的吗？好吧，你想要什么样的？]");
               break;
            case 7:
               outputText("[pg]雅拉高兴地发出呼噜声，[say: 哦天哪，我敢打赌那一定会很有趣！不过恐怕我只能在那里打个钉，好吗？]");
               break;
            case 8:
               outputText("[pg]雅拉解释道，[say: 这会非常痛，但我认为你会喜欢之后的感受。我就很喜欢！现在你想要在下面戴什么样的首饰？]");
         }
         menu();
         _g = this;
         loc1 = param1;
         type = 1;
         addButton(0,"耳钉",function():void
         {
            _g.chooseMaterials(loc1,type);
         });
         if(param1 != 7)
         {
            _g1 = this;
            loc2 = param1;
            type1 = 2;
            addButton(1,"圆环",function():void
            {
               _g1.chooseMaterials(loc2,type1);
            });
         }
         if(param1 == 1)
         {
            _g2 = this;
            loc3 = param1;
            type2 = 3;
            addButton(2,"阶梯环",function():void
            {
               _g2.chooseMaterials(loc3,type2);
            });
         }
         if(param1 == 2)
         {
            _g3 = this;
            loc4 = param1;
            type3 = 4;
            addButton(3,"圆环",function():void
            {
               _g3.chooseMaterials(loc4,type3);
            });
         }
         if(param1 == 5)
         {
            _g4 = this;
            loc5 = param1;
            type4 = 5;
            addButton(4,"链条",function():void
            {
               _g4.chooseMaterials(loc5,type4);
            });
         }
      }
      
      public function chooseAdvancedMaterials(param1:int, param2:int) : void
      {
         var mat4:int;
         var type5:int;
         var loc5:int;
         var _g4:YaraPiercingStudio;
         var mat3:int;
         var type4:int;
         var loc4:int;
         var _g3:YaraPiercingStudio;
         var mat2:int;
         var type3:int;
         var loc3:int;
         var _g2:YaraPiercingStudio;
         var mat1:int;
         var type2:int;
         var loc2:int;
         var _g1:YaraPiercingStudio;
         var mat:int;
         var type1:int;
         var loc1:int;
         var _g:YaraPiercingStudio;
         menu();
         spriteSelect(null);
         clearOutput();
         outputText("雅拉回到后面，端出一个装满奇异材料的镀金托盘。她递给你一本小册子，问道：[say: 好了，现在我要用什么材料来做呢？]");
         outputText("[pg]这里列出了许多材料：");
         outputText("\n1. 莱希石 - 伪造的莱希石。虽然美丽，但众所周知它会吸引恶魔。");
         outputText("\n2. 丰饶石 - 一种有时从玛瑞斯大湖湖底打捞上来的绿色宝石，据说能增强两性的生育能力。");
         outputText("\n3. 兽诱石 - 这种美丽的紫色宝石实际上是由狩猎诱饵中使用的材料结晶而成的。据说它能增强佩戴者对兽人的吸引力。");
         outputText("\n4. 绯红石 - 据说绯红石是由火山之火形成的，能让人的欲望之火燃烧得更加旺盛。");
         outputText("\n5. 冰晶石 - 这种罕见的宝石发现于冰川裂谷，据说能抵消绯红石的效果，平息永不熄灭的欲望。它会消除部分绯红石的魔力。由于其稀有性，它的价格为 2000 宝石。");
         outputText("[pg]<b>免责声明</b>：如果被穿孔者的身体吸收了这些宝石的任何残留魔力，雅拉的穿孔工作室概不负责，并且如果取下后效果仍然存在，工作室也没有义务解决任何问题。</b>");
         _g = this;
         loc1 = param1;
         type1 = param2;
         mat = 9;
         addButton(0,"莱希石",function():void
         {
            _g.areYouSure(loc1,type1,mat);
         });
         _g1 = this;
         loc2 = param1;
         type2 = param2;
         mat1 = 10;
         addButton(1,"丰饶石",function():void
         {
            _g1.areYouSure(loc2,type2,mat1);
         });
         _g2 = this;
         loc3 = param1;
         type3 = param2;
         mat2 = 11;
         addButton(2,"兽诱石",function():void
         {
            _g2.areYouSure(loc3,type3,mat2);
         });
         _g3 = this;
         loc4 = param1;
         type4 = param2;
         mat3 = 12;
         addButton(3,"绯红石",function():void
         {
            _g3.areYouSure(loc4,type4,mat3);
         });
         if(get_player().get_gems() >= 2000)
         {
            _g4 = this;
            loc5 = param1;
            type5 = param2;
            mat4 = 13;
            addButton(4,"冰晶石",function():void
            {
               _g4.areYouSure(loc5,type5,mat4);
            });
         }
         addButton(14,"返回",piercingStudio);
      }
      
      public function check(param1:int) : Boolean
      {
         if(inverse)
         {
            return param1 != 0;
         }
         return param1 == 0;
      }
      
      public function buildLocChoices(param1:Function, param2:Boolean = false) : Boolean
      {
         var a18:int;
         var _g8:Function;
         var a17:int;
         var _g7:Function;
         var a16:int;
         var _g6:Function;
         var a15:int;
         var _g5:Function;
         var a14:int;
         var _g4:Function;
         var a13:int;
         var _g3:Function;
         var a12:int;
         var _g2:Function;
         var a11:int;
         var _g1:Function;
         var a1:int;
         var _g:Function;
         var _loc3_:Boolean = false;
         inverse = param2;
         if(get_player().hasVagina())
         {
            if(check(int(get_player().vaginas[0].clitPierced)))
            {
               _g = param1;
               a1 = 0;
               addButton(0,"阴蒂",function():void
               {
                  _g(a1);
               });
               _loc3_ = true;
            }
         }
         if(get_player().totalCocks() > 0)
         {
            if(check(int(get_player().cocks[0].pierced)))
            {
               _g1 = param1;
               a11 = 1;
               addButton(1,"阴茎",function():void
               {
                  _g1(a11);
               });
               _loc3_ = true;
            }
         }
         if(check(int(get_player().earsPierced)))
         {
            _g2 = param1;
            a12 = 2;
            addButton(2,"耳朵",function():void
            {
               _g2(a12);
            });
            _loc3_ = true;
         }
         if(check(int(get_player().eyebrowPierced)))
         {
            _g3 = param1;
            a13 = 3;
            addButton(3,"眉毛",function():void
            {
               _g3(a13);
            });
            _loc3_ = true;
         }
         if(check(int(get_player().lipPierced)))
         {
            _g4 = param1;
            a14 = 4;
            addButton(4,"嘴唇",function():void
            {
               _g4(a14);
            });
            _loc3_ = true;
         }
         if(check(int(get_player().nipplesPierced)))
         {
            _g5 = param1;
            a15 = 5;
            addButton(5,"乳头",function():void
            {
               _g5(a15);
            });
            _loc3_ = true;
         }
         if(check(int(get_player().nosePierced)))
         {
            _g6 = param1;
            a16 = 6;
            addButton(6,"鼻子",function():void
            {
               _g6(a16);
            });
            _loc3_ = true;
         }
         if(check(int(get_player().tonguePierced)))
         {
            _g7 = param1;
            a17 = 7;
            addButton(7,"舌头",function():void
            {
               _g7(a17);
            });
            _loc3_ = true;
         }
         if(get_player().hasVagina())
         {
            if(check(int(get_player().vaginas[0].labiaPierced)))
            {
               _g8 = param1;
               a18 = 8;
               addButton(8,"阴唇",function():void
               {
                  _g8(a18);
               });
               _loc3_ = true;
            }
         }
         addButton(14,"返回",piercingStudio);
         return _loc3_;
      }
      
      public function areYouSure(param1:int, param2:int, param3:int) : void
      {
         var mat1:int;
         var type1:int;
         var loc1:int;
         var _g:YaraPiercingStudio;
         spriteSelect(null);
         clearOutput();
         outputText("雅拉说：[say: 好了，这是最后退出的机会，你确定要继续吗？记住，一旦我穿上去，就是永久的了。]");
         _g = this;
         loc1 = param1;
         type1 = param2;
         mat1 = param3;
         doYesNo(function():void
         {
            _g.normalPierceAssemble(loc1,type1,mat1);
         },piercingStudio);
      }
      
      public function applyPiercing(param1:int, param2:int = 0, param3:String = undefined, param4:String = undefined) : void
      {
         if(param3 == null)
         {
            param3 = "";
         }
         if(param4 == null)
         {
            param4 = "";
         }
         switch(param1)
         {
            case 0:
               get_player().vaginas[0].clitPierced = param2;
               get_player().vaginas[0].clitPShort = param3;
               get_player().vaginas[0].clitPLong = param4;
               break;
            case 1:
               get_player().cocks[0].pierced = param2;
               get_player().cocks[0].pShortDesc = param3;
               get_player().cocks[0].pLongDesc = param4;
               break;
            case 2:
               get_player().earsPierced = param2;
               get_player().earsPShort = param3;
               break;
            case 3:
               get_player().eyebrowPierced = param2;
               get_player().eyebrowPShort = param3;
               get_player().eyebrowPLong = param4;
               break;
            case 4:
               get_player().lipPierced = param2;
               get_player().lipPShort = param3;
               get_player().lipPLong = param4;
               break;
            case 5:
               get_player().nipplesPierced = param2;
               get_player().nipplesPShort = param3;
               get_player().nipplesPLong = param4;
               break;
            case 6:
               get_player().nosePierced = param2;
               get_player().nosePShort = param3;
               get_player().nosePLong = param4;
               break;
            case 7:
               get_player().tonguePierced = param2;
               get_player().tonguePShort = param3;
               get_player().tonguePLong = param4;
               break;
            case 8:
               get_player().vaginas[0].labiaPierced = param2;
               get_player().vaginas[0].labiaPShort = param3;
               get_player().vaginas[0].labiaPLong = param4;
         }
      }
      
      public function aboutYara() : void
      {
         spriteSelect(null);
         get_player().createStatusEffect(StatusEffects.Yara,0,0,0,0);
         clearOutput();
         outputText("你做了自我介绍，并向雅拉询问她的过去，提到");
         if(get_player().humanScore() <= 2)
         {
            outputText("你曾经也是个人类。");
         }
         else
         {
            outputText("你没见过多少其他人类。");
         }
         outputText("[pg]她回答时微微脸红，尾巴保护性地卷在身旁，[say: 我的家乡是围绕一个传送门建立的，统治那里的男爵坚持我们每年都要送一个祭品过去。我们从小就被灌输这样的观念：如果不献祭某人，神明就会发怒，让我们的城市毁灭。当然，这整个事情都是个骗局，但被献祭者的家人会得到补偿。我父亲一开始想把我卖去当妓女，但没成功，那个混蛋就把我迷晕献祭了。我在一个湖边醒来，饿了就吃了一些奇怪的水果，然后我……嗯，我变异了。谢天谢地，在遇到任何恶魔之前，我找到了来这里的路，否则谁知道我会遭遇什么！特尔阿德雷对我很好，我相信它对你也会很好的。现在，要不要打个穿孔？]");
         dynStats(DynStat.Inte(2),DynStat.Lust(-5),DynStat.Cor(-1));
         doNext(piercingStudio);
      }
   }
}

