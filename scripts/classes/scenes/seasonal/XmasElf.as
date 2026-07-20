package classes.scenes.seasonal
{
   import classes.BaseContent;
   import classes.CoC;
   import classes.DynStat;
   import classes.PerkLib;
   import classes.Player;
   import classes.StatusEffects;
   import classes.Time;
   import classes.Vagina;
   import classes._FlagDict.FlagDict_Impl_;
   import classes.display.SpriteDb;
   import classes.globalFlags.KFLAGS;
   import classes.internals.Utils;
   import classes.items.ArmorLib;
   import classes.items.ConsumableLib;
   import classes.scenes.Inventory;
   import flash.Boot;
   
   public class XmasElf extends BaseContent
   {
      
      public function XmasElf()
      {
         if(Boot.skip_constructor)
         {
            return;
         }
         super();
      }
      
      public function xmasSmart() : void
      {
         hideUpDown();
         outputText("你对自己点了点头，对自己的决定感到相当聪明。");
         get_game().timeQ = 0;
         doNext(playerMenu);
         dynStats(DynStat.Inte(15));
      }
      
      public function xmasPerkM(param1:Boolean) : void
      {
         if(!get_player().hasPerk(PerkLib.ElvenBounty))
         {
            if(param1)
            {
               get_player().createPerk(PerkLib.ElvenBounty,250,0,0,0);
            }
            else
            {
               get_player().createPerk(PerkLib.ElvenBounty,0,15,0,0);
            }
            outputText("<b>获得新专长 - 精灵的恩赐！</b>");
         }
         else
         {
            clearOutput();
            outputText("<b>专长强化 - 精灵的恩赐！</b>");
            if(param1)
            {
               get_player().addPerkValue(PerkLib.ElvenBounty,1,250);
               outputText("<b> - 精液产量增加250毫升！</b>");
            }
            else
            {
               get_player().addPerkValue(PerkLib.ElvenBounty,2,15);
               outputText("<b> - 额外增加15点生育能力！</b>");
            }
         }
         get_game().timeQ = 0;
         doNext(playerMenu);
      }
      
      public function xmasFuckFollowupFems() : void
      {
         var dicked:Boolean;
         var _g:XmasElf;
         hideUpDown();
         clearOutput();
         cheatTime(6 - get_time().hours);
         outputText("你在清晨醒来，浑身酸痛疲惫，但却感到前所未有的满足。你的身体从头到脚都感觉极其敏感，尤其是你那被过度使用的" + get_player().vaginaDescript(0) + "。尽管经历了如此激烈的性爱，你的头脑却异常清醒。那根假阳具似乎已经在你体内完全溶解了，只留下从你阴唇滴落的粉红色液体。[pg]");
         outputText("你觉得它可能对你做了什么吗");
         if(get_player().hasPerk(PerkLib.ElvenBounty))
         {
            outputText("<b>再一次</b>");
         }
         outputText("？[pg]");
         _g = this;
         dicked = false;
         doYesNo(function():void
         {
            _g.xmasPerkM(dicked);
         },xmasSmart);
         dynStats(DynStat.Cor(-5));
         if(get_player().sens + 20 > 80)
         {
            dynStats(DynStat.Sens(5));
         }
         else
         {
            dynStats(DynStat.Sens(15));
         }
         FlagDict_Impl_.arrayWriteInt(KFLAGS.flags,34,int(get_date().getFullYear()));
      }
      
      public function xmasFuckFollowup() : void
      {
         var dicked:Boolean;
         var _g:XmasElf;
         hideUpDown();
         clearOutput();
         outputText("你在早晨醒来，浑身酸痛且疲惫不堪，但却感到前所未有的满足。你的身体从头到脚都感觉异常敏感，尤其是你那被过度使用的[cock]。尽管经历了如此剧烈的欢爱，你的头脑却出奇地清醒。[pg]");
         outputText("你喜欢射这么多精的感觉吗");
         if(get_player().hasPerk(PerkLib.ElvenBounty))
         {
            outputText("<b>再一次</b>");
         }
         outputText("？[pg]");
         awardAchievement("淘气还是乖巧",96);
         _g = this;
         dicked = true;
         doYesNo(function():void
         {
            _g.xmasPerkM(dicked);
         },xmasSmart);
         dynStats(DynStat.Cor(-5));
         if(get_player().sens + 20 > 80)
         {
            dynStats(DynStat.Sens(5));
         }
         else
         {
            dynStats(DynStat.Sens(15));
         }
         FlagDict_Impl_.arrayWriteInt(KFLAGS.flags,34,int(get_date().getFullYear()));
      }
      
      public function xmasBitchEncounter() : void
      {
         clearOutput();
         cheatTime(Utils.rand(3));
         spriteSelect(SpriteDb.get_s_christmas_elf());
         var _loc1_:Boolean = FlagDict_Impl_.arrayReadInt(KFLAGS.flags,34) == 0;
         outputText("你的睡眠被某种不断拍打你侧腰的东西打断了。起初你还迷迷糊糊的，嘟囔着掀开毯子。然后你记起自己身在何处，猛地完全清醒过来。你一跃而起，举起双拳，茫然地盯着眼前的景象。[pg]");
         outputText("站在那里，看起来天真无邪的，");
         if(_loc1_)
         {
            outputText("是一个精灵。她身高不超过四英尺半，虽然有着相当女性化的臀部，但胸部却平平无奇。她的穿着很奇怪——一套红色的两件套，内衬着某种白色的毛皮。她有着典型的尖耳朵、金发，头上戴着一顶红色的毛皮边帽子，顶端还有一个白色的毛球。她双手捧着一个大盒子，满怀期待地看着你，而你则目瞪口呆地盯着她。[pg]");
         }
         else
         {
            outputText("是你去年见过的那个精灵。她身高不超过四英尺半，虽然有着相当女性化的臀部，但胸部却平平无奇。她的穿着很奇怪——一套红色的两件套，内衬着某种白色的毛皮。她有着典型的尖耳朵、金发，头上戴着一顶红色的毛皮边帽子，顶端还有一个白色的毛球。她双手捧着一个大盒子，满怀期待地看着你，而你则目瞪口呆地盯着她。[pg]");
         }
         outputText("精灵说道：[say: 嗨，[name]！我给你带了" + (_loc1_ ? "" : "又") + "一份礼物，直接来自那位大人物！][pg]");
         if(!_loc1_)
         {
            outputText("对她的突然再次出现感到困惑，你傻乎乎地问你是不是会得到和去年一样的东西。[pg]");
            outputText("她咯咯地笑了起来，[say: 哦，小傻瓜，那样不就破坏了惊喜吗？我们的名单上有所有人，甚至包括" + (FlagDict_Impl_.arrayReadInt(KFLAGS.flags,725) < 4 ? "凯尔特，尽管他又要收到煤炭了" : "凯莉，不过我觉得她会再得到一根又大又粗的假阳具") + "。你会得到你该得到的东西！][pg]");
         }
         else
         {
            outputText("对她的出现以及她已经知道你的名字感到困惑，你傻乎乎地问她怎么可能知道你是谁。[pg]");
            outputText("她咯咯地笑了起来，[say: 哦，小傻瓜，你不知道现在是一年中的什么时候吗？我们的名单上有所有人，甚至包括" + (FlagDict_Impl_.arrayReadInt(KFLAGS.flags,725) < 4 ? "凯尔特，尽管他今年要收到煤炭了" : "凯莉，不过我觉得她今年会得到一根又大又粗的假阳具") + "。][pg]");
         }
         outputText("所以这……礼物是你的？[pg]");
         menu();
         addButton(0,"打开礼物",openXmasPresent);
         addButtonDisabled(1,"选择精灵");
         addButton(4,"拒绝",declineXmasPresent);
         if(!get_player().isPureEnough(90) || get_game().jojoScene.isJojoCorrupted() || get_player().hasStatusEffect(StatusEffects.Exgartuan) || get_game().amilyScene.amilyCorrupt() || FlagDict_Impl_.arrayReadInt(KFLAGS.flags,283) > 0 || FlagDict_Impl_.arrayReadInt(KFLAGS.flags,282) > 0 || FlagDict_Impl_.arrayReadInt(KFLAGS.flags,450) > 0)
         {
            outputText("她点点头，兴奋地上下蹦跳着，脸颊微红，[say: 是的，只要撕开盖子，拿走你的礼物就行了！][pg]");
            if(!_loc1_)
            {
               outputText("又来了……[pg]");
            }
            addButtonDisabled(1,"选择精灵","这个场景不适用于淘气的孩子。");
            return;
         }
         if(get_player().isGenderless())
         {
            outputText("她点点头，兴奋地上下蹦跳着，[say: 是的！打开它吧！你准备好了吗？][pg]");
            addButtonDisabled(1,"选择精灵","这个场景需要你有生殖器。");
            return;
         }
         outputText("她点点头，兴奋地上下蹦跳着，[say: 是的！你可以拆开它，或者选择我。你选哪个？][pg]");
         addButton(1,"选择精灵",unwrapElfyPresent);
      }
      
      public function vagFuckXmasElf() : void
      {
         clearOutput();
         outputText("她把你推倒在铺盖卷上，低语道：[say:是时候享受你的礼物了。][pg]");
         outputText("精灵眨了眨眼，张开双腿，向你展示她明显已经勃起的性器官。她眨了眨眼，你看到她的肌肉紧绷。她阴道湿润的嘴唇慢慢张开，一个钝的白色物体开始挤出来。她是在下蛋吗？等等——不，更多的物体滑了出来，你现在可以看到它是管状的，就像某种性玩具，上面覆盖着螺旋状的红色图案。这个物体继续缓慢地向下移动，大约有六英寸悬空，精灵喘息着呻吟，脸涨得通红。她双手握住它，慢慢地拉。这让你想起了家乡训练中的士兵第一次尝试拔剑的情景——混合着尴尬和兴奋。[pg]");
         outputText("几秒钟内，精灵的双手就握住了一根带有红色条纹的双头假阳具。它淫秽地来回摆动，现在你仔细看，你意识到红色的部分微微凸起，以便更好地刺激使用者。她喘着粗气，手抚摸着它沾满淫液的表面，在回忆的快感中颤抖，直到她的注意力回到你身上。她的嘴唇卷起一个会意的微笑，她跪在你的[legs]之间，把它们分开，以便更好地接触你的" + get_player().vaginaDescript(0) + "。[pg]");
         outputText("娇小的精灵用顶端在你的下唇和[clit]上摩擦了几次，让你变得又热又兴奋，然后她把它滑进你的" + get_player().vaginaDescript(0) + "。假阳具在里面感觉棒极了，当它进入你时，每一个弯曲的脊背都会让你的脊椎发抖，然后当你把它带得越来越深时，它会沿着你的内壁抚摸。一旦你的“礼物”决定她已经把她那像拐杖糖一样的玩具深深地塞进你体内，这个动作就会中断。她向后躺下，向前滑动，把条纹假阳具的其余部分放进她无毛的阴户里，直到你们的阴阜锁在一起，女性的体液在人造阴茎上混合。");
         get_player().cuntChange(15,true,true,false);
         outputText("[pg]");
         outputText("精灵咯咯地笑着，[say:圣诞快乐，]她开始在你身上摇晃。假阳具滑过你的通道，按摩你的内壁，每次抽插都撞击着你的[clit]的下侧。她的肌肉控制力太强了，她夹紧了双头假阳具，开始把它当成阴茎来操你！她得意地笑着，猛击你脆弱的" + get_player().vaginaDescript(0) + "，用越来越有力的抽插强奸它。当每一次抽插大声地拍打在你的臀部时，你都会发出咕哝和呻吟。你感觉到自己快要高潮了，但精灵女孩放松了她的抓握，只是在你身上摩擦，把刺激降低了一个档次。[pg]");
         outputText("为了达到高潮，你在她身上扭动，把你的[clit]压在她的上面。她扭动着大叫，居然比你先高潮了！你暗想精灵的阴蒂一定异常敏感，但在你采取行动之前，你感觉到下体一阵突然的骚动。假阳具开始旋转了！你撑起身体看着，难以置信地看着精灵高潮的收缩明显地扭曲了她的肚子，随着旋转速度的加快，移动得越来越快。几秒钟内，旋转的攻击让你回到了高潮的边缘，你呻吟着，在失去知觉的爱人身上摩擦，想要更多。[pg]");
         outputText("你高潮了，");
         if(get_player().vaginas[0].vaginalWetness == 5)
         {
            outputText("喷涌出体液");
         }
         else if(get_player().vaginas[0].vaginalWetness >= 3)
         {
            outputText("滴落着体液");
         }
         else
         {
            outputText("湿漉漉地挤压着");
         }
         outputText("当你的" + get_player().vaginaDescript(0) + "被精灵的双头假阳具钻孔时。这感觉好极了，就像有一根阴茎在你体内，一遍又一遍地摩擦你小穴的每一个部分，没有丝毫怜悯的暗示。你喘息着，回头看着精灵。她已经从高潮中恢复过来，尽管她脸上带着强烈的专注神情，因为她专注于扭动你体内的假阳具。[pg]");
         outputText("[say:你不会以为我会让你只高潮一次吧？我要把你这个荡妇洞里所有调皮、罪恶的小心思都钻出来！][pg]");
         outputText("你向后仰起头，发出一声低沉的颤抖的呻吟，因为她旋转假阳具的速度更快了，迫使你痉挛的阴户保持在一种令人心碎的高潮中。你斗鸡眼，瘫倒在背上，抽搐着，身体无力地扭动和翻滚，因为它屈服于它从未打算承受的快感。[pg]");
         outputText("你在以下的话语中失去了知觉：[say:好女孩。继续高潮，释放出所有那些坏心思。我等不及明年再见到你了！]");
         doNext(xmasFuckFollowupFems);
         get_player().orgasm("Vaginal",true,10);
      }
      
      public function unwrapElfyPresent() : void
      {
         spriteSelect(SpriteDb.get_s_christmas_elf());
         clearOutput();
         outputText("精灵把礼物扔到一边，扭动着臀部，风情万种地向你走来。她");
         if(get_player().get_tallness() > 60)
         {
            outputText("伸出手，充满诱惑地贴在你身上，抚摸着你的身体。");
         }
         else
         {
            outputText("依偎在你身边，很高兴能勾引到一个和她身材相仿的人。");
         }
         outputText("随着她的挑逗，你发现自己越来越兴奋。她在你身上游走，感受着你身体的每一个角落。她挑逗着说：[say: 听说如果不快点拆开礼物，它就会被收走，我们可不想那样。][pg]");
         outputText("你");
         if(get_player().get_spe() < 25)
         {
            outputText("笨拙地");
         }
         else
         {
            outputText("轻松地");
         }
         outputText("伸手抓住她那镶着毛边的抹胸，动作流畅地把它从她头上扯了下来。她现在暴露在外的乳房虽然小巧，但形状优美。她的皮肤非常苍白，几乎是白色的，这与她坚硬的樱桃红乳头形成了鲜明的对比。当你抓住她红色的短裙并解开搭扣，一把扯下让她完全暴露时，她开心地扭动着。精灵的私处呈玫瑰粉色，外阴唇因兴奋而肿胀。她的阴缝完全没有毛发，上面还有一个精致的雪花纹身。你抬头看了看她的帽子，又低头看了看她穿着长袜的腿，心想：“这些可以留着。”[pg]");
         menu();
         if(get_player().isHerm())
         {
            addButton(0,"操精灵",dickXmasElfGo);
            addButton(1,"假阳具之乐",vagFuckXmasElf);
         }
         else if(get_player().hasCock())
         {
            doNext(dickXmasElfGo);
         }
         else
         {
            doNext(vagFuckXmasElf);
         }
      }
      
      public function openXmasPresent() : void
      {
         spriteSelect(SpriteDb.get_s_christmas_elf());
         clearOutput();
         outputText("你轻松地撕开绑着盒子的丝带，掀开盖子。你倒吸了一口凉气，");
         if(!get_player().isPureEnough(90) || get_game().jojoScene.isJojoCorrupted() || get_player().hasStatusEffect(StatusEffects.Exgartuan) || get_game().amilyScene.amilyCorrupt() || FlagDict_Impl_.arrayReadInt(KFLAGS.flags,283) > 0 || FlagDict_Impl_.arrayReadInt(KFLAGS.flags,282) > 0 || FlagDict_Impl_.arrayReadInt(KFLAGS.flags,450) > 0)
         {
            outputText("对盒子里的东西感到震惊——一根九英寸长的肉棒，上面绑着将近一打嗡嗡作响的椭圆形装置。一对煤块在它下面嘎啦作响，摆放的位置就像是这根阴茎的睾丸。[pg]");
            outputText("还没等你吐出一个困惑或抗议的字眼，精灵就呻吟起来，那根肉棒爆发了，喷出一股精液落在你的头发上。下一股喷在了你的鼻子上，然后是嘴唇，下巴，最后落在了你的" + get_player().allBreastsDescript() + "上。震惊且滴着精液的你目瞪口呆地站着，精灵在你的嘴唇上印下一吻，扯下盒子，跑开了，她的肉棒随着每一步的节奏晃动并嗡嗡作响。在这片黑暗中根本不可能抓住她。[pg]");
            outputText("空空的“礼物”掉在地上，里面还有煤炭。你想知道这煤炭是否有什么特殊效果。毕竟这个地方的每样东西都有。在远处你能听到雪橇铃声，你知道在更多入侵者的威胁之上，伴随着这些喧闹声，今晚很难入睡了……[pg]");
            get_inventory().takeItem(get_consumables().COAL___,playerMenu);
            FlagDict_Impl_.arrayWriteInt(KFLAGS.flags,34,int(get_date().getFullYear()));
         }
         else if(get_player().cor <= 33)
         {
            outputText("惊讶地发现盒子里装的是一套用蜘蛛丝编织而成的精美装备！看来有人觉得你很不错嘛。[pg]");
            if(get_player().get_inte() > get_player().get_str())
            {
               get_inventory().takeItem(get_armors().SS_ROBE,playerMenu);
            }
            else
            {
               get_inventory().takeItem(get_armors().SSARMOR,playerMenu);
            }
            FlagDict_Impl_.arrayWriteInt(KFLAGS.flags,34,int(get_date().getFullYear()));
         }
         else if(get_player().cor < 60)
         {
            outputText("惊讶地发现盒子里装的是一瓶标有“gro+”的药水。看来今年的圣诞节会很“盛大”……[pg]");
            get_inventory().takeItem(get_consumables().GROPLUS,playerMenu);
            FlagDict_Impl_.arrayWriteInt(KFLAGS.flags,34,int(get_date().getFullYear()));
         }
         else
         {
            outputText("惊讶地发现盒子里装的是一瓶纯净的魅魔之悦。看来这终究会是一个白色的圣诞节……[pg]");
            get_inventory().takeItem(get_consumables().PSDELIT,playerMenu);
            FlagDict_Impl_.arrayWriteInt(KFLAGS.flags,34,int(get_date().getFullYear()));
         }
         awardAchievement("淘气还是乖巧",96);
      }
      
      public function dickXmasElfGo() : void
      {
         clearOutput();
         if(get_player().cockArea(0) < 80)
         {
            outputText("她把你推倒在铺盖卷上，低语道：[say:是时候享受你的礼物了。][pg]");
            outputText("她毫不掩饰地骑在你身上，跨坐着，动作流畅地将你的[cock]插入。从凉爽的夜风到火热紧致的小穴，这种突如其来的变化让快感的冲击波直冲你的大脑。你努力控制住自己，才没让眼睛翻白，并闭上嘴巴以免流口水。她那如老虎钳般的紧致感简直非人类，但不知为何又不会紧得让人不舒服。她内部的肌肉以非同寻常的控制力紧紧地包裹着你，挤压着你。她是如此火热、湿润、紧致，让你忍不住颤抖。你开始在她身下摇晃，完全屈服于她小穴带来的快感。[pg]");
            outputText("你闷哼着，一次又一次地在她体内抽插。她在你身上弹跳时清了清嗓子，你抬起头，突然想起这个世界上除了榨取你[cock]的小穴之外，还有其他东西。精灵解释道：[say: 别害羞。我们精灵有神奇的小穴。一旦有东西进去，就会感觉太舒服了，再也不想出来。从你脸上的表情来看，我觉得你永远都不想离开，对吧？我是你收到过的最好的礼物，不是吗？来吧，为我射精，让我看看我是一份多么棒的礼物。][pg]");
            outputText("她完全正确——辐射到你阴茎上的热量带来了一种难以言喻的快感，让它感觉快要融化并升入天堂。精灵咯咯地笑着，她笑声的震动不知怎么地传到了你身上，这实在是太刺激了。你为你的礼物射精了，屈服于她的快感，精液沸腾着喷入她体内。当精液泵入她体内时，发出湿润的吧唧声，听起来绝对下流。");
            if(get_player().cumQ() >= 250)
            {
               outputText("精液很快填满了她的子宫，并从她的入口倒流出来，起泡并冒着泡滴落在你的[hips]上。");
            }
            if(get_player().cumQ() >= 1000)
            {
               outputText("随着你喷出越来越多的精液，它开始四处飞溅，精灵饶有兴致地看着她的小穴变成了一个喷精的喷泉。");
            }
            outputText("[pg]");
            outputText("一旦你的高潮结束，精灵又开始扭动她的臀部，她的小穴起着泡沫，滴落着混合了奶油般精液的液体。你并没有软下来。如果说有什么变化的话，那就是你变得更硬、更敏感了。当精灵开始再次弹跳，认真地操你时，一股直冲大脑的压力从她的小穴挤压着你的肉棒，[say: 我告诉过你我的小穴是神奇的。你在我里面永远不会软下来——你的精液为我的魔法提供燃料，让你感觉更好。][pg]");
            outputText("除了你的[cock]，你腰部以下的身体已经完全麻木了。你低头一看，发现你的[legs]在精灵的攻势下抽搐和痉挛。她里面太热了，就像她的小穴被液体快感包裹着一样。你越来越用力地操她，紧紧地抓住她的臀部，粗暴地操着她神奇的小穴。不知怎么的，你又到了边缘，准备卸货了。你开始在脑海中数数，试图抵抗另一次高潮。你知道如果你这样做了，你就永远无法停止。你怀疑你甚至无法思考。[pg]");
            outputText("你坚持的努力完全失败了——你开始随着每一次抽插的节奏数数，将数字与天鹅绒般的肉棒套按摩你[cock]的感觉联系起来。精灵居高临下地笑着嘲讽道：[say: 我看你已经失去了抵抗快感的能力。屈服吧，享受这个夜晚。我会一直骑着你直到早晨。][pg]");
            outputText("太热了，天哪，太热了。你又高潮了，更多的精液喷洒在她的子宫里。随着你不断地注入，精灵的皮肤泛起红晕，越来越多的精液喷射到她那已经满溢的入口。奇迹般的是，你射出的量和之前一样多，");
            if(get_player().cumQ() >= 250)
            {
               outputText("一波又一波的精液倾泻而出，直到你躺在一大滩精液中，");
            }
            outputText("而且不知为何，即使你已经被榨干，高潮的感觉依然持续着。你的眼睛翻白了片刻，几乎要失去意识。[pg]");
            outputText("你回过神来，精灵正低头看着你，嘴角挂着得意的笑容，一动不动。你感到完全麻木——你的" + get_player().cockDescript(0) + "集中了你所有的感觉，所有的触觉。你的[hips]不受控制地不断起伏，伴随着嘈杂的快感爆发在她体内抽插，让你喘息着扭动。每当你想思考些什么，那如老虎钳般的通道就会向下滑动并挤压你的[cock]，打断你任何思考的尝试。你放弃了思考，开始流口水，你的世界渐渐融入了一个充满持续快感和反复高潮的天堂。[pg]");
            outputText("精灵无情地操了你几个小时，强迫你一次又一次地高潮。不知为何，你从未干涸，而且每一次感觉都比上一次更好。你的铺盖卷被精液浸透，你的身体疲惫不堪，精灵终于伴随着一声高亢的快感尖叫达到了高潮。她的身体颤抖着，你再次高潮，又一次在她体内一塌糊涂地喷射。你身上的快感之钳颤抖着、挤压着，随着精灵的高潮不断拖延，温度每秒都在升高，榨干你的每一滴精液，让你陷入无限快感的反馈循环中。你失去了知觉。");
         }
         else
         {
            outputText("她把你推倒在铺盖卷上，低语道：[say:是时候享受你的礼物了。][pg]");
            outputText("精灵用双手抓住你的[cock]，像抱人一样依偎着它，在它的" + get_player().cockHead() + "边缘印下亲吻。她笑着说：[say:天哪，你真大！我简直希望自己能大到足以容纳这个坏男孩。相信我，如果你没有被精灵的小穴榨干过，你就不算真正活过。][pg]");
            outputText("她用双臂环抱住它，开始舔舐，蹲下又站起，用整个身体为你手淫。每次她可爱的屁股撞到你的" + get_player().allBreastsDescript() + "");
            if(get_player().biggestTitSize() >= 2)
            {
               outputText("让它们晃动");
            }
            else
            {
               outputText("让她紧致的屁股微微晃动");
            }
            outputText("。她一边工作一边开心地哼着歌，用唾液涂满它，将她湿润的小穴紧贴着你。她温暖的身体在你身上滑动，感觉棒极了，你感到有些大胆，在她的屁股上轻轻拍了一下。[pg]");
            outputText("精灵回过头来笑着说：[say:有人觉得有点调皮了。好吧，我想我得帮你把那些调皮的能量都排出来。][pg]");
            outputText("还没等你弄明白她的意思，她深吸了一大口气，用双手抓住你的" + get_player().cockHead() + "，将嘴唇贴在你的尿道上。她带着极其专注的神情向里面吹气。你能感觉到你的尿道正在被填满，被某种东西撑开，但感觉更像是液体而不是空气，当它滑入你的肉棒深处，向着你的");
            if(get_player().balls > 0)
            {
               outputText("睾丸");
            }
            else if(get_player().hasSheath())
            {
               outputText("包皮");
            }
            else
            {
               outputText("身体");
            }
            outputText("滑去时，带来一阵刺痛。她吹啊吹，似乎用她强行注入你体内的某种神奇物质为你提供了取之不尽的补给。刺痛感越来越强，然后转变为温暖，一种令人愉悦的热量集中在你的腹部。[pg]");
            outputText("使用魔法的精灵带着会心的微笑退后，继续抚摸你，无视从你顶端喷出的一滴粉红色液体。体内的温暖不断积聚，即使在凉爽的夜风中，你也开始出汗。令人不适的热量在你体内翻腾");
            if(get_player().balls > 0)
            {
               outputText("的[balls]");
            }
            outputText("，一种温和的压力不断积聚，直到你感觉快要爆炸。你需要高潮，你在精灵的掌控中扭动，当她的一只手滑过一个特别敏感的部位时，你颤抖着、战栗着。一滴先列腺液从你的" + get_player().cockHead() + "滚落，开始顺着肉棒滑下，接着是另一滴，又一滴，再一滴。[pg]");
            outputText("你的“礼物”用逐渐升高的威严语气问道：[say:你感觉到那些坏心思正在流出来吗？感觉很棒，不是吗？是的，但这只是个开始。你积压了太多需要释放的坏心思，这样你才能变乖，明年再来见我。所以，做个乖[boy]，把那些坏心思都射出来给我吧。][pg]");
            outputText("她翻身来到你阴茎的另一侧，紧紧抱住它，从根部到龟头流畅地挤压，这让你腹部肌肉紧绷，迎来了意想不到的高潮。第一股射出的精液简直像喷泉一样爆发出来。");
            if(get_player().cumQ() < 500)
            {
               outputText("你因为射出这么多而向后退缩——这远远超出了你平时的能力。");
            }
            outputText("精灵抱住它，紧紧挤压，同时低语道：[say:坏孩子，坏孩子。][pg]");
            outputText("浓稠的高潮黏液溅在她的头发上，随后每一次喷射的力度都越来越小，直到你流出稳定的精液流，顺着你的[cock]滚落，将这个尖耳朵女人完全浸透。当你释放出惊人的精液时，空气中弥漫着肉桂的香味，你傻傻地想，这是否是她对你使用的魔法的某种副作用。不管怎样，精液不断地流到精灵和你身上，你最终因为持续的高潮而失去了意识。");
         }
         doNext(xmasFuckFollowup);
         get_player().orgasm("Dick",true,20);
      }
      
      public function declineXmasPresent() : void
      {
         spriteSelect(SpriteDb.get_s_christmas_elf());
         clearOutput();
         outputText("你摇了摇头表示“不”，并告诉精灵你不会和她的“礼物”或“惊喜”有任何关系。她看起来快要哭了，她呜咽着，[say: 我会因为这个被骂的！][pg]");
         outputText("还没等你反应过来，她就冲进了黑暗中。");
         FlagDict_Impl_.arrayWriteInt(KFLAGS.flags,34,int(get_date().getFullYear()));
         awardAchievement("淘气还是乖巧",96);
         doNext(playerMenu);
      }
   }
}

