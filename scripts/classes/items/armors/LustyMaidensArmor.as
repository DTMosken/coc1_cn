package classes.items.armors
{
   import classes.CoC;
   import classes.DynStat;
   import classes.Monster;
   import classes.Player;
   import classes.Vagina;
   import classes._FlagDict.FlagDict_Impl_;
   import classes.globalFlags.KFLAGS;
   import classes.internals._ValueFunc.NumberFunc_Impl_;
   import classes.items.Armor;
   import classes.scenes.Camp;
   import classes.scenes.areas.highMountains.MinotaurMob;
   import classes.scenes.areas.mountain.Minotaur;
   import classes.scenes.combat.Combat;
   import flash.Boot;
   import haxe.IMap;
   
   public final class LustyMaidensArmor extends Armor
   {
      
      public function LustyMaidensArmor()
      {
         if(Boot.skip_constructor)
         {
            return;
         }
         super("LMArmor","L.MaidenArmor","lusty maiden\'s armor","a bikini-like set of armor that could only belong to a lusty maiden",6,400,"A skimpy chain bikini that barely qualifies as armor. The chain is made from links much finer and lighter than normal, and it feels almost like silk under your fingertips. A simple seal in the g-string-like undergarment states, \"Virgins only\". It looks like it wouldn\'t fit anyone with a cup size under DD or without a female frame.","Light",false,false);
         boost("挑逗几率",NumberFunc_Impl_.fromFloatFun(getSeductionLevel),false);
         boost("挑逗伤害",NumberFunc_Impl_.fromFloatFun(getSeductionLevel),false);
      }
      
      public function lustyMaidenPaizuri(param1:Player = undefined, param2:Monster = undefined) : void
      {
         var _loc3_:* = null as IMap;
         if(param1 == null)
         {
            param1 = get_game().player;
         }
         if(param2 == null)
         {
            param2 = get_game().monster;
         }
         clearOutput();
         outputText("你确保[themonster]舒服地躺下，[monster.his]" + param2.cockDescriptShort(0) + "暴露在空气中");
         if(param2.get_lust100() < 50)
         {
            outputText("，柔软且尚未准备好。当你触摸那逐渐勃起的肉棒时，你喉咙里发出呼噜声，用拇指划过敏感的尿道隆起。它在你的触摸下缓慢跳动，根部开始充血，在你的手掌中变粗。你张开剩下的手指，放在" + param2.cockHead() + "的正下方，在龟头周围挠痒痒，直到那里也充满血液，在你的爱抚下膨胀，直到它慢慢离开[monster.his]腹部。");
         }
         else if(param2.get_lust100() < 100)
         {
            outputText("，肿胀得恰到好处，但已经准备好感受你双乳紧紧夹住的感官愉悦。你俯身在被击败的敌人上方，亲吻" + param2.cockHead() + "正下方的肉棒，当它在你缓慢的亲吻下膨胀时，你微笑着。你的手指向上移动，把玩着沿着底部延伸的敏感尿道隆起，很快，[themonster]就硬得像石头一样，准备得如此充分，以至于[monster.his]阴茎自己翘了起来。");
         }
         else
         {
            outputText("，随着[monster.his]心跳的每一次跳动而弹跳，浓稠的预先液珠从[monster.his]顶端滴落，你拍开[monster.his]手，以免[monster.he]浪费[monster.he]为你攒下的精液。");
         }
         outputText("[pg]你自己的湿润度已经上升到了令人不适的程度，你的丁字裤弯曲的前面板的粘性密封带在你火热、坚硬的阴蒂上轻轻滑过，这让你的[legs]发软，手臂颤抖。你内衣前面的皮革褶皱非常滑，每一个动作都会让它在你的下体上移动和滑动，每次只有一点点。你已经把你的[butt]翘在空中，前后摇晃以获得更多美味的摩擦。这个动作只会加剧你的[chest]在紧身内衣里的晃动。[Themonster]抬起头观看，当[monster.he]享受你无意中给出的表演时，一种毫不掩饰的色欲表情占据了[monster.his]面容。");
         outputText("[pg][say: 如此淫荡的行为！我必须确保你被彻底净化，]你一本正经地说着，红透的[face]上装出严肃的表情。为了证明你的挑衅，你抓住那根跳动的肉棒根部，将其笔直朝上，然后将你的[chest]压在它的两侧。连接你性感锁子甲胸罩罩杯的滑溜溜、自带润滑的皮革环绕在 " + param2.cockDescriptShort(0) + " 的顶端，将其牢牢束缚，固定在你那被称为乳沟的湿滑、布满汗水的深谷中。当你挤压周围晃动的软肉，俯下身让它感受到不亚于任何小穴（无论多湿或多有技巧）的快感时，它在你的[skin]上欢快地跳动着。");
         outputText("[pg]你对着被击败的敌人微笑，开始在[monster.him]上方起伏，你发现自己不由自主地说出了更多的话。[saystart]这样才对。你真的不应该到处想操别人！小穴是");
         if(!param1.hasVirginVagina())
         {
            outputText("对你这种自私的野兽来说太好的礼物");
         }
         else
         {
            outputText("神圣的，只能与珍爱的人分享");
         }
         outputText("！现在，我要通过你的肉棒把你所有不纯洁的想法都挤出来，所以你只要躺在那里，专心把它们全射在我的乳房上。[sayend]");
         outputText("[pg][Themonster]庄重地点了点头，同时[monster.his]的眼睛因为快感而半眯着。你一撸到底，直到[monster.his]的根部");
         if(param2.balls > 0)
         {
            outputText("，并用一只手爱抚[monster.his]的蛋蛋，揉捏着那充满阳刚之气的球体，试图诱导出更多[monster.his]肮脏、变态的想法，将其蒸馏成咸咸的精液");
         }
         else if(param2.get_short() == "anemone")
         {
            outputText("，并抚摸[monster.his]的会阴，甚至拂过那个如果她有屁眼的话，本该是屁眼所在的光滑部位，试图诱导出更多[monster.his]肮脏、变态的想法，将其蒸馏成咸咸的精液");
         }
         else
         {
            outputText("，并抚摸[monster.his]的会阴，甚至拂过[monster.his]的屁眼附近，试图诱导出更多[monster.his]肮脏、变态的想法，将其蒸馏成咸咸的精液");
         }
         outputText("。一声受惊的呻吟从[monster.his]唇间溢出，但你才刚刚热身。你俯身扑向[monster.his]" + param2.cockDescriptShort(0) + "，顺滑地一口将" + param2.cockHead() + "直接吞入口中。");
         if(param2.cockArea(0) >= 80)
         {
            outputText("它是如此粗大强壮，直接顶进了你的喉咙，把你的脖子撑出了那根入侵肉棒的形状。");
         }
         outputText("这根强壮、跳动着的肉棒在你嘴里感觉太棒了，仿佛它天生就该待在那儿，你忍不住觉得自己在做一件善事，帮助[themonster]将最后一丝变态的欲望清空在你那净化的乳房上。");
         outputText("[pg]上上下下，上上下下，你不慌不忙地在那根粗大的肉棒上缓慢滑动，每一次动作都让你那[chest]优美地弹跳着。你的[nipples]是如此坚挺");
         if(param1.hasFuckableNipples() || param1.lactationQ() >= 100)
         {
            outputText("，滴着水，");
         }
         outputText("且敏感，在你比基尼那模糊不清的内衬周围摩擦，偶尔还会勾到比平时感觉更温暖的金属上。在你身后，你的[butt]正随着你那吞噬腐化的乳房所设定的节奏欢快地弹跳着，丁字裤以最精妙的方式紧紧勒进你的[vagina]里。你感觉自己如此火辣性感，但同时又很安心，因为你知道自己不必担心这种生物会蹂躏你的");
         if(param1.hasVirginVagina())
         {
            outputText("处女膜");
         }
         else
         {
            outputText("泥泞的裂口");
         }
         outputText("。尽管如此，你不确定在自己把精液射满G弦裤、让自己的黑暗思想渗入魔法内衣之前，你还能变得多火辣。");
         outputText("[pg]在你下方，[themonster]大声呻吟着，粗暴地挺动着[monster.his]臀部来迎合你的每一个动作，随着[monster.his]激情的攀升，他们的顶端在你的嘴里微微膨胀。你向后退去");
         if(param2.cockArea(0) >= 80)
         {
            outputText("伴随着一阵凌乱的咳嗽声清了清嗓子");
         }
         outputText("并挑逗道，[say: 噢，你已经要射了，是不是？那就来吧。]你加快了用[chest]夹弄那根抽搐肉棒的速度，当一滴浓稠的先头液滑落到你柔软的双乳上，并在你的[skin]上抹开时，你露出了微笑。你亲吻了它，舔去从扩张的马眼滑出的一滴液体，然后命令道，[say: 为我射出来吧，" + param2.mf("男孩","女孩") + "。全都射出来。]");
         outputText("[pg][Themonster]呻吟着颤抖起来");
         if(param2.balls > 0)
         {
            outputText("，[monster.his]蛋蛋在[monster.his]阴囊里抽动弹跳着");
         }
         outputText("，[monster.his]尿道因即将爆发的沉重负荷而肿胀。[say: 把那些下流的精液都排出来吧，]你打趣道，同时将双乳压在[monster.him]身上，用你渴望精液的双唇吸吮着那颤抖的龟头。咸涩的温热液体如长绳般射入你准备就绪的口中，漫过你的舌头。被俘虏的敌人脸上极乐的表情，加上感觉到[monster.him]因为你的乳沟而放弃了所有[monster.his]下流念头，让你欲火焚身，以至于你的[hips]开始痉挛般地颤抖起来。");
         outputText("[pg]你尽力含住那根抽插的肉棒，任由它痉挛般地将浓精射入你的嘴里。但你的内裤紧紧勒进你的[vagina]，摩擦着你的[clit]，让你根本无法控制自己。你仰起头，狂喜地叫出声来，接下来的精液在你的脸颊、鼻梁和额头上射出长长的一道。一次又一次，长长的污秽精液溅满你的脸庞，凌乱地滴落在你暴露的乳房上。你舔了舔嘴唇，少女的爱液在你的[armor]里泛滥，将自己不纯洁的欲望释放在盔甲里，让你感到无比的愉悦。更多的精液从跳动的龟头喷涌而出，虽然比之前的弱，但还是无力地落在了你湿润的乳房上。");
         outputText("[pg]你抓住[themonster]的根部，用快速、短促的动作给[monster.him]撸管，命令道：[say: 全都给我！把你所有的欲望和残忍都给我！] " + param2.mf("他","她") + "的背部弓起，[monster.his]高潮再次爆发，新鲜的精液再次喷涌而出，确保你的脸和乳房都被这黏糊糊的精液浸透。它化作湿润温暖的细流流进你遮蔽的上衣，没有滴落的，你强迫性地揉进皮肤里，从这种感觉中感受到一种绝对健康的光泽。直到每一滴精液都溅满你全身，你才将" + param2.cockDescriptShort(0) + "从你丰满的怀抱中释放出来，当你这样做时，你留下了一个被彻底榨干的[monster.short]。");
         outputText("[pg]精液的腥味随着你的移动慢慢消退，似乎被你的皮肤吸收了。它让你焕发出健康的光泽，让你的动作更加自信，确信你暴露的盔甲会保护你。");
         param1.slimeFeed();
         _loc3_ = KFLAGS.flags;
         FlagDict_Impl_.arrayWriteInt(_loc3_,769,FlagDict_Impl_.arrayReadInt(_loc3_,769) + 2);
         if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,769) > 8)
         {
            FlagDict_Impl_.arrayWriteInt(KFLAGS.flags,769,8);
         }
         param1.orgasm("Vaginal");
         dynStats(DynStat.Sens(2));
         if(param1.hasVirginVagina())
         {
            dynStats(DynStat.Cor(-1));
         }
         if(param2 is Minotaur || param2 is MinotaurMob)
         {
            param1.minoCumAddiction(3);
         }
         if(param2.get_short() == "Ceraph")
         {
            _loc3_ = KFLAGS.flags;
            FlagDict_Impl_.arrayWriteInt(_loc3_,291,FlagDict_Impl_.arrayReadInt(_loc3_,291) + 1);
         }
         if(get_game().get_inCombat())
         {
            get_combat().cleanupAfterCombat();
         }
         else
         {
            doNext(get_camp().returnToCampUseOneHour);
         }
      }
      
      override public function get_def() : Number
      {
         if(get_player().hasVirginVagina())
         {
            return 9 + FlagDict_Impl_.arrayReadInt(KFLAGS.flags,769);
         }
         return 6 + FlagDict_Impl_.arrayReadInt(KFLAGS.flags,769);
      }
      
      public function getSeductionLevel() : Number
      {
         return (get_player().hasVirginVagina() ? 10 : 6) + FlagDict_Impl_.arrayReadInt(KFLAGS.flags,769);
      }
      
      override public function canUse() : Boolean
      {
         if(!Boolean(super.canUse()))
         {
            return false;
         }
         if(get_player().biggestTitSize() < 1)
         {
            outputText("你把比基尼上衣套在胸前并扣好，但这块布料在你平坦的胸前挂着，显得有些滑稽。冰冷的锁链从你身上垂下来，可笑地摇晃着，然后又冷又硬地拍打在你的[nipples]上。这根本不行——它不适合你，你换回了旧盔甲。[pg]");
            return false;
         }
         if(get_player().biggestTitSize() < 4)
         {
            outputText("你把比基尼上衣套在胸前，当冰冷的锁链勾住你的乳头时，你打了个寒颤，让它们舒服地挺立起来。这块布料很好地突出了你的胸部，但有一个明显的问题。你的[chest]不够大！当然，它们在闪闪发光的银色和金色镶边下看起来很不错。要是金属没有松松垮垮地挂在你的下胸围，一动就晃来晃去就好了。穿在你身上甚至看起来都不那么性感！你需要一个更大的胸部才能真正利用这套盔甲。现在，你换回了旧装备。[pg]");
            return false;
         }
         outputText("你把比基尼上衣套在你那丰满的胸部上，冰冷的金属触碰到你敏感的乳头时，你打了个寒颤。它紧紧地绷在你的每一个肉球上，当你扣上背后的窄皮带时，这件充满异国情调的金属胸罩已经变得足够温暖，让你的胸部产生令人愉悦的刺痛感。你的双手不由自主地摸向你那摇晃的、镀金的肉团，手指陷入闪闪发光的肉体中。你的乳头在半透明的内衬上摩擦，舒服得让你忍不住呻吟出声，你欣赏着你的乳沟如何在闪闪发光的罩杯上方凸显出来。一条窄窄的钢带，下面垫着闪亮的黑色皮带，连接着上衣的两半，虽然垫了衬垫以增加舒适度，但却被你那硕大无比的乳房撑得远离了你的身体。");
         outputText("[pg]当你检查这件材质时，你意识到那条皮带不仅仅是垫子。它像油脂上的黄油一样滑溜，并且有一个微妙的凹陷，这个凹陷可以完美地缓冲某种圆润、粗壮……而且跳动着的东西。当你发现自己幻想着穿着这身衣服和某只野兽乳交，在你的乳沟、脸庞和头发上接下怪物或扶他射出的浓稠精液时，你的脸颊泛起了红晕。如果你愿意的话，你甚至可以把它对准你的嘴，吞下几口。");
         outputText("[pg]你摇了摇头，苦笑着——也许等你穿好衣服再说吧！毕竟还有下装要穿。尽管如此，只要一有空闲，你的一只手就会不由自主地放在乳房上，漫不经心地摸索和抚弄着你沉甸甸的奶子。这真是一套有趣的盔甲！");
         dynStats(DynStat.Lust(25),DynStat.NoScale);
         outputText("[pg]现在，下装是一条皮质丁字裤和裙子的组合。丁字裤本身是染成亮白色的皮革，前面的三角区覆盖着错综复杂的金色金银丝图案。在后面的三角区也有类似的图案，不过你敢发誓，从远处看，这个图案有点像指向你[asshole]所在位置的箭头，周围还环绕着金色的精子。不，那一定是你的错觉。在这个陌生的地方待了这么久，你一定是受影响了！这两件衣服的剪裁都突出了女性的曲线，裆部有一道折痕，刚好贴在你的阴道上，确保");
         if(get_player().hasCock() && !get_player().hasSheath() || get_player().balls > 0)
         {
            outputText("它不适合你");
            if(get_player().hasCock())
            {
               outputText("或者你的[cocks]");
            }
            else
            {
               outputText("或者你的[balls]");
            }
            outputText("！<b>你叹了口气，重新穿上了旧装备</b>。");
            return false;
         }
         if(!get_player().hasVagina())
         {
            outputText("它会不舒服地勒进你平坦的腹股沟。<b>你叹了口气，重新穿上了旧装备</b>。");
            return false;
         }
         outputText("你的[vagina]显眼地展示着你的骆驼趾，让所有人都能看到。");
         outputText("[pg]你毫不犹豫地将白色丁字裤紧紧地穿上。舒适的温暖紧贴着你的阴阜，完美成型的折痕正好滑入你的阴唇，待在它该待的地方，");
         if(get_player().vaginas[0].virgin)
         {
            outputText("紧紧封住你的贞洁，在展示你女性魅力的同时守护着你的处女之身。一抹得意的微笑爬上你的嘴角——当他们可以乳交或操你的屁股时，谁还会夺走你的初夜呢？");
            if(get_player().cor < 33)
            {
               outputText("等等，这不太对劲……");
            }
         }
         else
         {
            outputText("紧紧封住你那已被夺走贞操的小穴。当你意识到只要用屁股和奶子来服侍那些好色的猛男和怪物，就能保持贞洁完好无损时，悔恨涌上了心头。");
         }
         if(get_player().wetness() >= 3)
         {
            outputText("你平时滴落的爱液似乎直接浸入了内裤底裆，而不是像往常一样顺着你的[legs]流下，这让你看起来更加贞洁，尽管这件淫荡的衣物此刻似乎正将你的女性特征和[butt]勾勒出完美诱人的形状。");
         }
         outputText("[pg]最后是锁子甲裙——也许是最容易穿上的部分。它只有不到三英寸长，几乎完全暴露了你的[butt]，当你弯腰时，更是春光乍泄。你阴户下方的折痕也隐约可见，如果你想炫耀自己，只需简单地伸展或拉扯一下，就能将自己完全展露无遗。你扭动着身体，看着反光材质泛起近乎催眠般的涟漪，一只手仍放在胸前，充满激情地揉捏着自己的奶子。这才是贞洁勇士该有的打扮——完美端庄，却又充满情色能量，足以压倒她的敌人！[pg]");
         return true;
      }
   }
}

