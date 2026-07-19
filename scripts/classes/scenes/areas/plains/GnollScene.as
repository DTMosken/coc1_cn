package classes.scenes.areas.plains
{
   import classes.Appearance;
   import classes.BaseContent;
   import classes.CoC;
   import classes.Cock;
   import classes.CockTypesEnum;
   import classes.DynStat;
   import classes.DynStatOp;
   import classes.ImageManager;
   import classes.Monster;
   import classes.Player;
   import classes.display.SpriteDb;
   import classes.internals.Utils;
   import classes.items.ConsumableLib;
   import classes.items.Weapon;
   import classes.scenes.combat.Combat;
   import coc.view.CoCButton;
   import flash.Boot;
   
   public class GnollScene extends BaseContent
   {
      
      public function GnollScene()
      {
         if(Boot.skip_constructor)
         {
            return;
         }
         super();
      }
      
      public function yoDawgIHeardULiekGNollBallzzzdahdakjldh() : void
      {
         clearOutput();
         get_player().consumeItem(get_consumables().S_DREAM);
         outputText("当你瘫倒在地，再也没有力气站立时，一阵阵刺耳的狂笑声包围了你。豺狼人充满嘲弄的吠笑声在空气中回荡，她开始处理你的[armor]");
         if(!get_player().get_weapon().isUnarmed())
         {
            outputText("和[weapon]");
         }
         outputText("，动作十分粗暴，她那如爪子般的手上柔软的肉垫粗鲁地抓着你的[hips]，与其说是在剥你的衣服，不如说是在乱摸。当她把你的物品踢到一边时，一个小巧的球状瓶子从你的小袋里滚了出来，里面晃动着刺眼的白色液体，在平原那暗淡的棕绿色背景下，就像一抹雪花石膏般的污迹。鬣狗女孩停下了急于品尝胜利果实的动作，满腹狐疑地打量着这个滚落的药瓶。她的嘴唇卷起一抹近乎微笑的冷笑，弯下腰捡起了那个装着乳白色液体的瓶子。透过模糊你视线的喘息迷雾，你能看清那精液颜色的药剂中浑浊而奇特的浓稠漩涡，你意识到这个女战士找到了你的魅魔之梦。[pg]");
         outputText("你试图抗议这种盗窃行为，但她随意地踢出一脚，猛地踢中你的下巴。地面向你的后脑勺砸来，白色的剧痛在眼前炸开。[say:你拥有的一切，以及你本身，都属于我，]鬣狗女咆哮道。[say:我会拿走我认为合适的贡品。]她再次大笑，弹开药剂的软木塞，饶有兴致地嗅了嗅里面的混合物。她的鼻孔因为气味而皱起，但她死死盯着你，以一种充满攻击性、目不转睛的姿态，仰起头将那奇怪的浓稠象牙色液体吞了下去。她丢掉空玻璃瓶，舔了舔嘴唇，仿佛这清凉的乳液只是点燃了另一种渴望。[pg]");
         outputText("这位女战士又向你迈出一步，随后猛地后退，发出一声窒息般的喘息。鬣狗女的姿势变得无力，双膝紧闭，双手捂在颤抖的大腿内侧。挂在她臀部的破烂缠腰布向外凸起，随着下面怪物的逐渐膨胀而被顶开。她用长着斑点的爪子拨开粗糙的皮革，露出双腿间那根充血跳动的缟玛瑙肉柱。从一层薄薄的包皮中升起，这根15英寸长的阴蒂像一根没有龟头的肉棒一样矗立在她斑驳的小穴上方，暴突的青脉破坏了它如黑曜石般光滑的表面，随着女孩加快的心跳而跳动。她摇晃着，似乎被体内沸腾的淫欲削弱了力气，脸颊泛起深紫色的红晕，一半是因为尴尬，一半是因为渴求。[pg]");
         outputText("[say:你……你给我下了什么毒？]她喘息着，踉跄着跪倒在地。豺狼人稳住身形，将双手从胯部移开，露出了魅魔之梦的效果。一对巨大的、苹果般大小的睾丸在她跳动的阴唇下摇晃，" + (get_noFur() ? "闪烁着光泽" : "覆盖着一层细密的巧克力色绒毛，闪烁着光泽") + "，那是从她过度刺激的小穴里漏出的淫液。鬣狗的蛋蛋沉甸甸地挂在腹股沟下，胀痛地充满了她无法排空的精液。[say:这是什么？]她质问道，声音中充满了沸腾的、陌生的冲动。[say:我不……我不能……]她跌跌撞撞地四肢着地，臀部无力地对着空气挺动，眼神变得浑浊，嘴巴大张着，陷入了交配的原始本能中。[pg]");
         doNext(yoDawgHyenaBallz2);
      }
      
      public function yoDawgHyenaBallz3() : void
      {
         clearOutput();
         outputText("终于，你感觉到豺狼人的阴蒂从你的肛门里滑了出来，这个天赋异禀的女孩瘫倒在你的身旁。她彻底崩溃了，带着堕落的疲惫喘息着，再也没有力气继续把你按在泥土里猛干。即使是现在，她依然用一只长满斑点的爪子抚摸着自己巨大的阴蒂，另一只爪子则无助地按摩着那篮球大小的睾丸，里面几加仑的精液还在发出搅动的声音。你不知从哪儿涌出一股力量，小心翼翼地站起来，收拾好你的东西，赶在鬣狗娘恢复体力之前悄悄溜走了。");
         get_player().orgasm("Anal");
         dynStats(DynStat.Lib(2),DynStat.Sens(-10));
         get_combat().cleanupAfterCombat();
      }
      
      public function yoDawgHyenaBallz2() : void
      {
         clearOutput();
         outputText("趁她分心，你翻身趴下，向你的[armor]爬去，希望能借机逃跑。然而，暴露你的[ass]被证明是个错误，因为豺狼人死死盯着那两团晃动的双股，拼命地扑了过来。她压在你身上，爪子将你的头和肩膀按在地上，她那急不可耐的肉棒带着温度滑入你的臀沟，她新长出的阴囊湿漉漉地拍打着");
         if(get_player().balls > 0)
         {
            outputText("你自己的[balls]");
         }
         else
         {
            outputText("你汗水湿透的大腿");
         }
         outputText("。这位亚马逊女战士毫不耽搁，喘息着享受着快感，将她那巨大的阴蒂对准你的[asshole]，把那根木桶般粗壮的伪根深深刺入你的下体，让你忍不住发出一声被贯穿的娇呼。你柔软的肠壁在她那充满活力的阴蒂前被撑开，她的小穴里涌出大量温暖的淫液，如洪水般淹没了你的肠道，就像泛滥的先列腺液一样。");
         get_player().buttChange(30,true,true,false);
         outputText("[pg]");
         get_images().showImage("gnoll-fuck-butt");
         outputText("她粗暴地撞击着你的臀部，把你的脸按在草地和泥土上，用她那健美身躯的每一分力量操着你，动作快得毫不留情。她咆哮着、大叫着，甚至带着疯狂的绝望大笑，将她那坚硬如石的肉棒插进你的下体，试图获得释放。面对这只发情鬣狗娘的狂热，你的挣扎毫无用处，她就像一头发情的野兽一样使用着你。仅仅几分钟后，她的身体猛地绷紧，肌肉因即将高潮的极乐而紧绷，你暗自祈祷她能快点结束。她咬紧牙关，用长满斑点的双爪勾住你的肩膀，将她那乌黑的肉棒深深挺进你紧缩后穴的柔软褶皱中，她那滚烫的小穴喷涌出大量的淫水。[pg]");
         outputText("她的撞击停顿了片刻，你能感觉到她" + (get_noFur() ? "" : "毛茸茸的") + "蛋蛋在你的[ass]上跳动，操弄的刺激让它们充满了新鲜的精液，渴望着倾泻进你被侵犯的穴里。但是，由于没有通道来释放她如洪流般的精液，这只豺狼人的蛋蛋只能因为未释放的激情而肿胀，淫荡地颤动着贴在");
         if(get_player().balls > 0)
         {
            outputText("你肿胀的阴囊上，它因为女孩对你前列腺的榨取而像气球一样鼓胀着，充满了疲惫的浊液");
         }
         else
         {
            outputText("你酸痛的下腹，被这女孩兴奋时流出的黏滑爱液浸透了");
         }
         outputText("。 [say:不——不！我没法……完全……啊！]她浑身颤抖，无法高潮，随后又失去理智般重新开始，带着新的活力在你的[asshole]里抽插。[say:我只是！必须！他妈的！射出来！]她咬紧牙关，一边猛烈地撞击你，一边发出闷哼。她小穴里如瀑布般涌出的淫液浸透了你的[skinfurscales]，在她越来越绝望的攻势中，她的胯部湿漉漉地拍打着你的胯部。[pg]");
         outputText("一次又一次，她冲向释放的边缘，每一次，她那充满溢出欲望的蛋蛋都在晃荡，无法高潮却驱使她走向更深的堕落，直到连说话都变得困难。你被蹂躏的身体在无休止的强暴下隐隐作痛。你唯一能做的，就是在豺狼人肌肉紧绷、濒临高潮的短暂幸福停顿中，把手伸到臀部下方自慰，随后她又会将你按回泥土中开始下一轮。你失去了时间概念，你的世界缩小到只剩下鬣狗娘那根不断抽插的巨大阴蒂，以及她那拍打着你、肿胀着精液的沉重阴囊。你每一次的高潮，都在助长她疯狂的暴行，直到你默默祈求自己的身体能屏蔽这压倒性的快感，却无济于事。日夜交替，这个女战士毫无理智、毫无怜悯、也毫无释放地操着你痉挛颤抖的后庭。[pg]");
         doNext(yoDawgHyenaBallz3);
         get_game().time.hours = 7;
         var _temp_1:* = get_game().time;
         _temp_1.days = _temp_1.days + 1;
         statScreenRefresh();
      }
      
      public function takeGnollClit() : void
      {
         clearOutput();
         outputText("你粗暴地把她翻过身平躺，将她长长的阴蒂拉直竖起。她发出一声轻柔的呻吟，随着她的情欲高涨，你手指下粗糙的皮肤跳动着，变得更加坚挺修长。顶端膨胀得更大、更饱满，甚至可能对你的尺寸来说有些太粗了。你对准你的" + get_player().vaginaDescript(0) + "，将自己沉下去，坐在这根细长的伪根上。");
         get_player().cuntChange(9,true,true,false);
         outputText("[pg]");
         get_images().showImage("gnoll-fuck-vag");
         outputText("它顺畅地滑入你的蜜穴，你很快发现自己坐在了豺狼人的胯部上。你上下挺动臀部，享受着这根细长的肉棒在你体内滑动的触感。然而，她的生理结构并不是为了这种事而设计的，你能感觉到她那巨大的阴蒂在你体内疲软下来，萎缩下去，拒绝给你应得的操弄。[pg]");
         outputText("[say: 喂！]你大喊一声，探身向前扇了豺狼人一记耳光。突然，阴蒂肉棒在你体内硬了起来，尽管这女孩的脸上几乎没有反应。你带着坏笑，又试了一次。第二记重重的耳光让这只鬣狗的伪根在你体内变得笔直坚挺，你满意地在她身上扭动起臀部。[pg]");
         outputText("每抽插几下，那根假阳具就开始变软，于是你便探出身子再次扇她耳光。抽插，抽插，扇耳光。挺进，挺进，打脸。闷哼，闷哼，扇耳光。当你的身体攀升至高潮那颤抖的顶峰时，豺狼人的脸已经被打得青紫。你对着天空尖叫着达到高潮，用力压在她那中空的阴蒂上，高潮的快感强烈到让你眼冒金星。[pg]");
         outputText("当你终于能重新站稳脚跟时，你站起身来，任由那根如今已经萎缩的阴蒂伴随着湿润的“吧唧”声从你的" + get_player().vaginaDescript(0) + "里滑落出来。你把她留在被太阳烤得干裂的地上，转身回营地去了。");
         get_player().orgasm("Vaginal");
         get_combat().cleanupAfterCombat();
      }
      
      public function suckGnollClit() : void
      {
         clearOutput();
         get_images().showImage("gnoll-win-suck-her-clit");
         outputText("自从你第一次看到这个奇怪的生理结构，你就知道它必须进入你的体内。你粗暴地把她翻过身让她平躺，然后把她长长的阴蒂拉直。她发出一声轻柔的呻吟，随着她的性奋让它变得更硬更长，你手指下粗糙的皮肤也随之跳动。顶端膨胀得越来越大，越来越饱满，直到它可能对你的目的来说太宽了。你没有再浪费时间，俯下身子，把阴蒂的顶端塞进了嘴里。[pg]");
         outputText("豺狼人惊讶地叫了一声，随着你的嘴唇和舌头在她敏感的皮肤上游走，她发出了享受的呻吟。她的臀部在干硬的泥土上扭动着，试探性地将她的阴蒂更深地推入你的嘴里。[pg]");
         outputText("你非常乐意满足她，缓慢而小心地将这个奇怪的器官吞下喉咙。你一寸一寸地将它吸入体内，引得鬣狗娘发出越来越大的呻吟。最后，你的鼻子埋进了她胯下粗糙卷曲的毛发中，下巴摩擦着由她扭曲的阴唇形成的假阴囊。[pg]");
         outputText("当你继续吞咽时，她的双腿在你的耳边抽搐着，尽管已经没有更多可以吞下的部分了。你喉咙的肌肉轻轻按摩着这根巨大的阴蒂，随着更多血液涌入，它变得更加饱满。你能感觉到它肿胀的体积顺着你的喉咙一直延伸到你胸腔的一半。[pg]");
         outputText("随着豺狼人开始高潮，那根巨大的阴蒂肉棒开始颤动抽搐。她的双脚在你身体两侧猛踩地面，突然仰天尖叫。她那颤抖的叫声随后渐渐微弱，整个身体瘫倒在地，失去了意识。[pg]");
         outputText("你把她留在烈日炙烤的地面上，转身返回营地。");
         get_player().orgasm("Lips",false);
         dynStats(DynStat.Lust(get_player().maxLust(),DynStatOp.Eq));
         get_combat().cleanupAfterCombat();
      }
      
      public function gnollEncounter() : void
      {
         spriteSelect(SpriteDb.get_s_club_gnoll());
         clearOutput();
         get_images().showImage("monster-gnoll");
         outputText("远处的平原上传来了阵阵笑声，但很快又戛然而止。片刻之后，一只豺狼人从最近的掩体后猛地窜出，径直朝你撞了过来。这个丑陋的怪物在你面前蹦来跳去，咯咯笑着，伺机寻找可乘之机。");
         startCombat(new Gnoll());
      }
      
      public function getRapedByGnoll() : void
      {
         if(get_player().hasItem(get_consumables().S_DREAM))
         {
            yoDawgIHeardULiekGNollBallzzzdahdakjldh();
            return;
         }
         clearOutput();
         outputText("当你跪倒在她面前时，豺狼人嘲弄的笑声刺痛了你的耳朵。她带着最后一丝警惕绕着你转，然后猛扑过来把你撞倒，暴露了你的");
         if(get_player().hasCock())
         {
            outputText(get_player().multiCockDescriptLight());
            if(get_player().hasVagina())
            {
               outputText("和");
            }
         }
         if(get_player().hasVagina())
         {
            outputText(get_player().vaginaDescript(0));
         }
         if(get_player().get_gender() > 0)
         {
            outputText("。");
         }
         else
         {
            outputText("平坦且毫无特征的胯部。");
         }
         if(!get_player().hasCock())
         {
            get_images().showImage("gnoll-fuck-vag");
            if(get_player().hasVagina())
            {
               outputText("豺狼人看着你双腿间的空白，显得有些失望。[say: 哎，我还希望能有点实在的东西呢，]她吃吃地笑着。但这并没有阻止她举起充血的阴蒂肉棒，将顶端拍打在你" + get_player().vaginaDescript(0) + "的入口处。伴随着一阵颤抖的猛冲，她将阴蒂塞进你的体内，她的耻骨丘紧紧压在你的[clit]上。");
               get_player().cuntChange(9,true,true,false);
               outputText("[pg]");
            }
            else
            {
               outputText("当豺狼人注意到你毫无特征的胯部时，她竟然停止了片刻的笑声。[say: 好吧。这倒是挺新鲜的，]她嘟囔着。然后她顺着你的身体向上走了两步，粗鲁地将拇指塞进你的嘴里。她的另一只手引导着她巨大的阴蒂紧随其后，而你根本无力阻止她。[pg]");
            }
         }
         if(get_player().cockTotal() > 0)
         {
            get_images().showImage("gnoll-fuck-with-her-clit");
            if(get_player().thickestCockThickness() > 2)
            {
               if(get_player().cockTotal() > 1)
               {
                  outputText("豺狼人在你的[cocks]里翻找，一把抓住了最粗的那根。");
               }
               else
               {
                  outputText("豺狼人的双手飞快地伸向你的胯部，一把抓住了[cock]。");
               }
               outputText("[say: 嗯，这个正合适，]她津津有味地说着，套弄着你的" + Appearance.cockNoun(get_player().cocks[get_player().thickestCock()].get_cockType()) + "，直到它充血膨胀起来。她悬跨在你身上，双膝微屈，将她那巨大的阴蒂尖端抵在你" + Appearance.cockNoun(get_player().cocks[get_player().thickestCock()].get_cockType()) + "的龟头上。当你的尿道口渗出一滴先列腺液的瞬间，她腰身猛然前挺，将巨大的阴蒂顺着你的" + Appearance.cockNoun(get_player().cocks[get_player().thickestCock()].get_cockType()) + "整根吞没。");
               outputText("她火热的皮肤在你的阴茎内部起伏蠕动，这感觉让你倒吸一口凉气，而她却只是大笑着，将那东西越插越深。[pg]");
            }
            else
            {
               if(get_player().cockTotal() > 1)
               {
                  outputText("[say: 也只能将就一下了，]她有些失望地说着，一把抓住了你最粗的那根肉棒。");
               }
               else
               {
                  outputText("[say: 只能将就一下了，]她一边说着，一边抓住了你的肉棒。");
               }
               outputText("她用粗糙的手在上面上下撸动，直到它开始胀大。她悬停在你的身体上方，膝盖大幅度弯曲，将她巨大的阴蒂尖端抵在你的龟头上。当一滴先列腺液在你的尿道口形成的那一刻，她的臀部猛地向前挺进，将她巨大的阴蒂顺着你的" + Appearance.cockNoun(get_player().cocks[get_player().thickestCock()].get_cockType()) + "插了下去。");
               outputText("当她强行将她那怪异的伪阴茎插进你的肉棒时，你痛得尖叫起来。你惊恐地看着她那侵入你体内的器官所形成的凸起，慢慢地向你的");
               if(get_player().balls > 0)
               {
                  outputText("蛋蛋");
               }
               else
               {
                  outputText("腹股沟");
               }
               outputText("移动。她一边大笑，一边将它越插越深。[pg]");
               get_player().cocks[get_player().thickestCock()].thickenCock(0.25);
            }
         }
         outputText("没过多久，她就找到了一个轻松的节奏，将她那淫猥的扶他肉棒在你体内抽插。起初，在这般攻势下，你除了咕噜咕噜地呻吟和扭动之外什么也做不了，但很快你就感觉到了自己情欲高涨的明显迹象。你发现自己开始迎合她的抽插而扭动，至少在当前的情况下尽你所能地配合着。");
         if(get_player().biggestTitSize() >= 3)
         {
            outputText("当豺狼人将她的肉体与你紧紧贴合摩擦时，你的" + get_player().allBreastsDescript() + "上下弹跳着，在烈日下被汗水打湿。你的[nipples]紧绷发红，你的整个身体都屈服于这鬣狗女孩粗暴的操弄。");
         }
         if(get_player().cockTotal() > 0)
         {
            outputText("随着高潮的临近，你的臀部开始向上挺动，但豺狼人猛地将双手按在你的身体两侧，将你死死地钉在坚硬的地面上。[say:你最好别乱动，亲爱的，]她大笑着，甚至加快了速度。紧接着，你的");
            if(get_player().balls > 0)
            {
               outputText(get_player().sackDescript());
            }
            else
            {
               outputText("身体");
            }
            outputText("收紧了，你能感觉到精液在体内翻腾。[pg]");
            outputText("当你终于爆发时，那种感觉很奇怪，但并不难受。你感觉到滚烫的种子从体内喷涌而出，但似乎在阴茎根部就消失了。你迷迷糊糊地低头看向胯部，发现你感觉消失的地方，正是她阴蒂尖端插入的位置。你正把精液直接射进她的伪阴茎里。");
            outputText("[pg][say:就是这样！]她咯咯笑着，在你身上上下弹跳。[say:都给妈妈！我会把你的精液吸干！]终于，就在你的高潮即将消退时，豺狼人对着空旷的天空尖叫起来，她巨大的阴蒂在你的阴茎里猛烈抽动。[pg]");
         }
         else
         {
            outputText("随着高潮的积聚，你在泥土中扭动，而豺狼人只是咯咯地笑。热流似乎闪过你的全身，然后每一块肌肉都同时痉挛抽搐起来。与此同时，豺狼人对着空旷的天空尖叫，她巨大的阴蒂在你体内猛烈抽动。[pg]");
         }
         outputText("鬣狗女孩瘫倒在你的身上，但只有一瞬间。然后她突然又站了起来，伴随着下流的吸溜声，将她那奇异的器官从你体内抽出。她俯下身拍了拍你的脸颊，咯咯笑着说，[say:谢谢你，亲爱的。]然后她向着地平线飞奔而去。");
         outputText("一声呜咽从你的喉咙里冒出来，化作半声痴笑，随后你瘫倒在地，失去了意识。");
         get_player().orgasm("Generic");
         get_combat().cleanupAfterCombat();
      }
      
      public function dickInGnollAss() : void
      {
         clearOutput();
         get_images().showImage("gnoll-win-fuck-her-butt");
         var _loc1_:int = get_player().cockThatFits(get_monster().analCapacity());
         if(_loc1_ < 0)
         {
            _loc1_ = 0;
         }
         var _loc2_:int = get_player().cockThatFits2(get_monster().analCapacity());
         if(Utils.rand(2) == 0)
         {
            outputText("必须给这个豺狼人一个教训，但你绝对要远离她那畸形的生理结构。你粗暴地把她翻过身趴下，抬起她瘦削的屁股。你对准你的" + get_player().cockDescript(_loc1_) + "，将它狠狠地捅进她那紧致的后穴，引得这个鬣狗娘发出一声半昏迷的喘息。[pg]");
            if(get_player().totalCocks() > 1 && get_player().cockArea(_loc1_) < get_monster().analCapacity() && _loc2_ != -1)
            {
               outputText("你得意地笑了笑，抽插了几分钟让她放松下来。然后你伸手将另一根" + Appearance.cockNoun(CockTypesEnum.HUMAN) + "贴在第一根旁边。伴随着一声闷哼和一次挺进，你把两根都塞了进去。");
               if(get_player().totalCocks() > 2 && get_player().cockArea(_loc1_) + get_player().cockArea(_loc2_) < get_monster().analCapacity())
               {
                  outputText("又抽插了几下，你再次放慢速度。当你拿起第三根肉棒时，豺狼人小声呜咽起来，害怕接下来会发生的事。你慢慢向前推，将坚硬的肉棒沉入她的屁股。当三根都进去时，进展非常缓慢，但你没有停下来。");
               }
               if(get_player().cockTotal() > 3 && get_player().cockArea(0) + get_player().cockArea(1) + get_player().cockArea(2) < get_monster().analCapacity())
               {
                  outputText("从那以后，过了一段时间，她的肛门才被撑得足够大，可以容纳更多。现在你能感觉到高潮即将来临，所以你对第四根" + get_player().cockDescript(_loc2_) + "不再那么小心了。你把它拍进肉棒堆里，然后猛地插进去。");
               }
               if(get_player().cockTotal() > 4 && get_player().cockArea(0) + get_player().cockArea(1) + get_player().cockArea(2) + get_player().cockArea(3) < get_monster().analCapacity())
               {
                  outputText("然后是下一根。");
               }
               if(get_player().cockTotal() > 5 && get_player().cockArea(0) + get_player().cockArea(1) + get_player().cockArea(2) + get_player().cockArea(4) + get_player().cockArea(5) < get_monster().analCapacity())
               {
                  outputText("再下一根。");
               }
               if(get_player().cockTotal() > 6 && get_player().cockArea(0) + get_player().cockArea(1) + get_player().cockArea(2) + get_player().cockArea(4) + get_player().cockArea(5) + get_player().cockArea(6) < get_monster().analCapacity())
               {
                  outputText("接着是下一根，直到你所有的[cocks]都插进了她大张着的屁股里。");
               }
               outputText("[pg]");
            }
            outputText("[say: 感觉怎么样？]你闷哼着，[say: 当太大的东西塞进太小的洞里时？]你用力而粗暴地抽插着，直到她的哭喊变成尖叫，然后又变成呻吟。最后，她直接晕了过去。你的胯部拍打着她骨瘦如柴的屁股，又猛抽了几下，然后长久而猛烈地射进了她的直肠里。[pg]");
            outputText("你任由她瘫倒在地，你的精液从她体内漏出，滴在被太阳晒得干裂的土地上，随后你便转身回家了。");
         }
         else
         {
            outputText("你下定决心；这只豺狼人需要认清自己的地位。你盯着她那怪异的假阳具看了一会儿，然后摇了摇头，粗暴地抓住她骨瘦如柴的臀部，把她翻过身趴在地上。当你用力拍打她瘦削的屁股时，她发出一声类似犬吠的哀鸣，将下巴贴在地上，顺从地撅起屁股，承认了你的统治地位。[pg]");
            outputText("你急切地抚摸着你的" + get_player().cockDescript(_loc1_) + "，让自己完全勃起，并挤出几滴先列腺液滴在她紧闭的肛门上，你还俯下身子加了一点唾液以确保润滑。将你的肉棒滑入她扁平的臀瓣之间，确保龟头得到了充分的润滑，然后你按住她的臀部，一口气将自己一插到底。[pg]");
            outputText("豺狼人发出一声尖叫，听起来有几分像疯狂的大笑，身体在泥土中向前滑行了些许。你的" + get_player().cockDescript(_loc1_) + "美妙地跳动着，完全被豺狼人紧致的肠道所吞没");
            if(get_player().cockTotal() > 1)
            {
               outputText("，而你剩余的雄风则在她光洁的臀部上摩擦");
            }
            outputText("。你开始前后抽插，手指紧紧扣住她的胯部。[pg]");
            outputText("随着战败的豺狼人彻底认命，心甘情愿地充当你的精液便器，你决定好好折腾她一番。你向后抽出，直到几乎完全脱离她直肠的紧致包裹，然后再次挺身向前，直到胯部重重撞上她的屁股。你一次又一次地抽出并狠狠捣入，感受着豺狼人紧致的后穴在每一次抽插中变得稍微松弛。你猛烈肏干这个可怜的草原女孩后庭的力道，让她那奇特的性征随着每一次撞击拍打在她的肚子上。听着她喉咙里发出的咯咯呻吟，你只能猜测她在某种程度上很享受被支配的感觉。[pg]");
            outputText("你的双手顺着她的腰侧继续向下滑动，随着高潮的临近，你用力压倒在她身上。你加快了速度，带着不顾一切的狂热在她的后穴里如活塞般抽插，在她耳畔发出野兽般欢愉的低吼");
            if(get_player().cumQ() >= 500)
            {
               outputText("，你大量的先列腺液将她的肠道变成了一个泥泞的肉洞");
            }
            outputText("。[pg]");
            if(get_player().cumQ() <= 250)
            {
               outputText("你的指尖用力按住她的腰侧，仰起头发出一声呻吟，将精液深深地、猛烈地射入她温暖的直肠中");
               if(get_player().cockTotal() > 1)
               {
                  outputText("，同时你的其余性器");
                  if(get_player().cockTotal() > 2)
                  {
                     outputText("也浸湿了");
                  }
                  else
                  {
                     outputText("浸透了");
                  }
                  outputText("她的背部和臀部，留下几股黏稠的浊液");
               }
               outputText("。你伴随着一声清晰的*噗嗤*声拔出肉棒，豺狼人向前瘫倒在地上，微微喘息着，开始不知羞耻地自慰起来。[pg]");
            }
            else if(get_player().cumQ() <= 500)
            {
               outputText("你紧紧抓住她的腰侧，发出一声回荡在草原上的低吼，[eachcock]明显地胀大，将浓稠的精液泵入豺狼人的体内");
               if(get_player().cockTotal() > 1)
               {
                  outputText("，释放出一股精液狂潮，" + (get_noFur() ? "涂满" : "黏结短毛于") + "她的背部和臀部");
               }
               outputText("。当你拔出时，她肛门肌肉紧紧夹住你的" + get_player().cockDescript(_loc1_) + "，发出一声清晰的*咕叽*声，随后这只豺狼人精疲力竭地瘫倒在地，为了让自己高潮而不知羞耻地自慰起来。[pg]");
            }
            else
            {
               outputText("你用尽全力压在这只柔软的鬣狗娘身上，咬紧牙关发出闷哼，[eachcock]因你那充满男子气概的浓精的压力而膨胀。她紧缩的肛门被你喷涌的精液撑开，随着她的肚子开始被你浓稠的精液撑大，她发出了一阵颤抖、带着笑意的呻吟。她直肠不自主的痉挛榨取着你" + get_player().cockDescript(_loc1_) + "的每一滴精液，紧紧地夹着你的肉棒");
               if(get_player().cockTotal() > 1)
               {
                  if(get_player().cockTotal() > 2)
                  {
                     outputText("，同时你剩下的肉棒将她的背部彻底浸湿，给她盖上了一层厚厚的精液毯子");
                  }
                  else
                  {
                     outputText("，同时你剩下那根肉棒将她的背部彻底浸湿，给她盖上了一层厚厚的精液毯子");
                  }
               }
               outputText("。当你拔出时，她的肛门发出一声清晰的*咕叽*声，这只豺狼人从你的肉棒上滚落下来，抱着她那沉甸甸、充满精液的肚子，开始不知羞耻地用手指抠弄自己。[pg]");
            }
            outputText("心满意足后，你留下豺狼人继续享受，收拾好你的[armor]，然后返回了营地。");
         }
         get_player().orgasm("Dick");
         get_combat().cleanupAfterCombat();
      }
      
      public function dickDownGnollClit() : void
      {
         clearOutput();
         get_images().showImage("gnoll-fuck-with-her-clit");
         outputText("你绝不能错过这个机会。你粗暴地把她翻过身让她平躺，然后把她长长的阴蒂拉直。她轻声呻吟着，你手指下粗糙的皮肤跳动着，她的兴奋让它变得更硬更长。顶端膨胀得更大、更饱满，直到最后看起来几乎足够宽了。你不再等待；你将你的龟头对准她阴蒂的顶端，然后用力插了进去。[pg]");
         outputText("一寸一寸地，你将肉棒沉入她那巨大阴蒂的温暖通道中。你很高兴地发现，里面并不像外面那么粗糙，事实上，里面足够湿滑，让你的侵入成为可能。抽插了几下后，你发现采用类似反向骑乘的姿势最省力，你面向她的脚，向前挺动臀部，将越来越多的肉棒塞进她体内。在你身下，豺狼人抓着地面，发出顺从的低声呜咽。[pg]");
         var _loc1_:int = get_player().longestCock();
         if(get_player().cocks[_loc1_].cockLength > 9)
         {
            outputText("终于，你感觉到你的龟头顶破了阻碍，进入了一个更深、更湿润的地方。你低头看着她奇怪的生理结构，她那整根肉管都因为容纳了你的" + get_player().cockDescript(_loc1_) + "而鼓胀起来。你已经一路插进了她的阴道里！[pg]");
         }
         else
         {
            outputText("很快，你感觉到她阴蒂通道的尽头顶住了你的胯部。你已经插到底了。你顺着她奇怪的生理结构往下看，那根肉管因为容纳了你的" + get_player().cockDescript(_loc1_) + "而鼓胀起来。你的龟头离她阴蒂肉棒的尽头还有几英寸的距离。[pg]");
         }
         outputText("现在你开始以稳定的节奏扭动臀部，让你的肉棒在她长长的阴蒂通道里进进出出。这就像是你操过的最深、最紧的阴户，紧紧地包裹着你的每一寸。");
         if(get_player().balls > 0)
         {
            outputText("没过多久，你的[balls]就开始抽搐，将精液顺着你被包裹着的肉棒射出。");
         }
         outputText("你的高潮来得又快又猛。在烈日下，你的整个身体似乎都在颤抖，你的抽插速度翻倍，再翻倍，像疯了一样把你的肉棒塞进她的肉棒里。[pg]");
         if(get_player().cumQ() < 25)
         {
            outputText("你的" + get_player().cockDescript(_loc1_) + "一阵抽搐，顺着她阴蒂的通道不断抽插。她在你身下扭动嚎叫，嘶哑地渴求着更多。");
         }
         else if(get_player().cumQ() < 500)
         {
            outputText("你的" + get_player().cockDescript(_loc1_) + "一阵抽搐，将精液泵入她体内。随着精液的积聚，她的阴蒂胀得更大了。温暖、湿润、黏糊糊的内壁紧紧包裹着你的肉棒。");
         }
         else
         {
            outputText("你的" + get_player().cockDescript(_loc1_) + "一阵抽搐，将精液倾注进她体内。随着精液积聚，她的阴蒂胀得更大了，皮肤因压力增加而绷紧发亮。最后，大股的精液开始从她阴蒂的顶端喷涌而出，溅在你的胯部。");
         }
         outputText("伴随着一声充满情欲的呻吟，你拔出了肉棒，发出一声长长的湿滑声，留下那个豺狼人在满是灰尘的地上喘息。");
         get_player().orgasm("Dick");
         get_combat().cleanupAfterCombat();
      }
      
      public function defeatHyena() : void
      {
         clearOutput();
         if(get_monster().get_HP() < 1)
         {
            outputText("鬣狗娘向后瘫倒在满是灰尘的地上，无力再战。");
         }
         else
         {
            outputText("鬣狗娘大口喘着粗气，向后退了一步。她的木棍砰的一声掉在地上，双手顺势落到她的肉棒上，沿着粗糙的柱身抚摸起来。");
         }
         outputText("这只豺狼人现在任你处置。你打算拿她怎么办？");
         menu();
         addButtonDisabled(0,"操干阴蒂","此场景需要你拥有阴茎且有足够的性致。","Dick Down Clit");
         addButtonDisabled(1,"干进屁股","这个场景需要你拥有阴茎并且有足够的性奋度。","Dick In Ass");
         addButtonDisabled(2,"骑乘阴蒂","这个场景需要你拥有阴道并且有足够的性奋度。","Take Her Clit");
         addButtonDisabled(3,"舔她阴蒂","这个场景需要你有足够的性奋度。","Suck Her Clit");
         if(get_player().get_lust() >= 33)
         {
            if(get_player().hasCock())
            {
               addButton(0,"操干阴蒂",dickDownGnollClit).hint("用你的阴茎操豺狼人的阴蒂。","操干阴蒂");
               addButton(1,"干进屁股",dickInGnollAss).hint("用你的阴茎操豺狼人的屁股。","干进屁股");
            }
            if(get_player().hasVagina())
            {
               addButton(2,"骑乘阴蒂",takeGnollClit).hint("用你的小穴骑乘豺狼人的阴蒂。","骑乘阴蒂");
            }
            addButton(3,"吸吮阴蒂",suckGnollClit).hint("吸吮豺狼人的阴蒂。","吸吮阴蒂");
         }
         if(get_player().hasMultiTails())
         {
            addNextButton("强迫梳毛",get_game().forest.kitsuneScene.kitsuneGenericFluff).hint("让[themonster]帮你撸蓬松你的尾巴。").sexButton(-1);
         }
         setSexLeaveButton();
      }
   }
}

