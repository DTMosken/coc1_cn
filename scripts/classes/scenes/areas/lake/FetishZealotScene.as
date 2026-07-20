package classes.scenes.areas.lake
{
   import classes.CoC;
   import classes.DynStat;
   import classes.Monster;
   import classes.Player;
   import classes.StatusEffects;
   import classes.display.SpriteDb;
   import classes.internals.Utils;
   import classes.items.Armor;
   import classes.items.ArmorLib;
   import classes.items.armors.LustyMaidensArmor;
   import classes.parser._Parser.TagFun_Impl_;
   import classes.scenes.areas.Lake;
   import classes.scenes.combat.Combat;
   import coc.view.CoCButton;
   import flash.Boot;
   
   public class FetishZealotScene extends AbstractLakeContent
   {
      
      public var currentZealot:FetishZealot;
      
      public function FetishZealotScene()
      {
         if(Boot.skip_constructor)
         {
            return;
         }
         super();
      }
      
      public function zealotWinReligious() : void
      {
         clearOutput();
         outputText("他衣服上的闪光褪去，变回了他一开始穿的那件露裆蓝色长袍。当你靠近时，他跪下鞠躬。[say:原谅我，我的主，我失败了！]你停顿了一下，不确定他是否[if (cor > 60) {意识到你就是他本该崇拜的主|在称呼你为他的主}]，还是在大声祈祷。[say:我的身体，有幸成为您的器具，现在将被这个残酷的异教徒玷污！]");
         outputText("[pg]这份神秘感转瞬即逝。[if (cor > 60) {真遗憾，如果他能看到你的真面目，你可能会更享受这一切。}]注意到你的犹豫，这位虔诚的[if (shotaZealot) {小男孩|年轻人}]向前踉跄了一步，大喊道：[say:你必须侵犯我！]在你获胜之后，他居然向你提出要求？诚然，你本来就打算这么做，但这可不是为了他。");
         switch(get_player().get_gender())
         {
            case 1:
               dickZealotReligious();
               break;
            case 3:
               menu();
               addNextButton("操他",dickZealotReligious).hint("把你的肉棒塞进这个祭坛男孩的身体里。");
               addNextButton("骑他",rideZealotReligious).hint("好好享受他那根狂热的肉棒。");
               break;
            default:
               rideZealotReligious();
         }
      }
      
      public function zealotLossRape() : void
      {
         clearOutput();
         if(get_player().get_HP() < 1)
         {
            outputText("你因狂热者攻击的疼痛而倒下。你感到头晕目眩，催情剂似乎对你产生了越来越强的作用。很快，你的脑海中充满了各种恋物癖场景的画面。狂热者走到你面前，把手放在你的额头上。突然，所有的画面汇聚成了一个。");
         }
         else
         {
            outputText("不断涌现的恋物癖画面让你不堪重负，你跪倒在地，无法抵挡诱惑。狂热者走到你面前，把手放在你的额头上。突然，所有的画面汇聚成了一个。");
         }
         if(get_currentZealot().get_armorName() == "学生服")
         {
            studentRape();
         }
         else
         {
            religiousRape();
         }
         rapeDrain();
         var _loc1_:Boolean = badEndCheck();
         if(get_currentZealot().get_armorName() == "学生服")
         {
            if(_loc1_)
            {
               studentRapeFinishBad();
            }
            else
            {
               studentRapeFinishGood();
            }
         }
         else if(_loc1_)
         {
            religiousRapeFinishBad();
         }
         else
         {
            religiousRapeFinishGood();
         }
         if(_loc1_)
         {
            doNext(get_lake().fetishCultistScene.cultistBadEnd2);
         }
         else
         {
            dynStats(DynStat.Lust(get_player().cor / 20 + get_player().lib / 10));
            get_combat().cleanupAfterCombat();
         }
      }
      
      public function zealotDefeated() : void
      {
         var monster1:Monster;
         var player1:Player;
         var _g:LustyMaidensArmor;
         clearOutput();
         if(get_monster().get_HP() < 1)
         {
            outputText("狂热者因伤倒下，伤势过重，无法继续控制他的力量。");
         }
         else
         {
            outputText("狂热者颤抖了片刻，然后倒下，他的欲望变得连他自己都无法控制。");
         }
         if(get_player().get_lust() >= 33)
         {
            outputText("[pg]你想利用他脆弱的状态来满足你的欲望吗？");
         }
         menu();
         addButton(0,"忏悔",zealotWinReligious).hint("让他一边恳求宽恕，一边让你操他。").sexButton();
         if(get_player().hasVagina() && get_player().biggestTitSize() >= 4 && get_player().get_armorName() == "lusty maiden\'s armor")
         {
            _g = get_player().get_armor();
            player1 = get_player();
            monster1 = get_monster();
            addButton(1,"B.Titfuck",function():void
            {
               _g.lustyMaidenPaizuri(player1,monster1);
            }).sexButton(2);
         }
         if(get_player().hasMultiTails())
         {
            addNextButton("强撸尾巴",get_game().forest.kitsuneScene.kitsuneGenericFluff).hint("让[themonster]帮你撸蓬松你的尾巴。").sexButton(-1);
         }
         setSexLeaveButton();
      }
      
      public function zealotBoat() : void
      {
         generateZealot();
         registerTags();
         clearOutput();
         if(get_player().statusEffectv1(StatusEffects.FetishOn) == 1)
         {
            outputText("[say: 禁止擅闯我们的神圣船只！]当你靠近船只时，另一个宗教狂热者大声喊道。邪教并没有放弃这里，你很快就遭到了充满攻击意图的袭击。");
         }
         else
         {
            outputText("当你看到那艘船时，你惊讶地发现[if (shotaZealot) {[if (ischild) {另一个孩子|一个孩子}]|有人}]已经在那里了。从他深蓝色的长袍和暴露在外的[if (shotaZealot) {小小的}][zealotSkin]肉棒来看，他似乎与你之前看到的那个邪教有关。这个[if (shotaZealot) {男孩|男人}]短暂地回以同样审视的目光，然后开口说道。[say: 这里已经被恋物癖信徒占领了！立刻离开。]他没有等待你的回应，似乎仅仅把你的表情当成了攻击的挑衅！");
            get_player().changeStatusValue(StatusEffects.FetishOn,1,1);
         }
         startCombat(get_currentZealot());
         spriteSelect(SpriteDb.get_s_fetish_zealot());
      }
      
      public function studentRapeFinishGood() : void
      {
         outputText("[pg]几个小时后，你的心智终于回到了现实。你环顾四周，发现自己已经不在原来的地方了，那个狂热者也不见踪影。");
         if(get_player().get_armor() == get_armors().C_CLOTH)
         {
            outputText("[pg]你注意到你身上还穿着你被困在幻觉中时的[armor]，而你原来的衣服却不见了踪影。");
         }
         else
         {
            outputText("[pg]你发现你的[armor]又穿回了身上，而你之前穿着的奇怪衣服却不见了踪影。");
         }
         outputText("这场折磨也让你的头脑变得有些迟钝，你之前感受到的欲望仍有一些残留。");
      }
      
      public function studentRapeFinishBad() : void
      {
         outputText("[pg]你发现你的思绪无法回到现实，它飘向了另一个地方，然后又是一个。后来你感觉到一个女性的身体过来把你抱起，但你太混乱了，无法做出反应……");
      }
      
      public function studentRape() : void
      {
         if(get_player().get_armor() == get_armors().C_CLOTH)
         {
            get_player().set_modArmorName(get_player().mf("正式的背心、领带和开裆裤","露背女教师服"));
         }
         outputText("[pg]回过神来，你在黑板上写完了最后的例题。虽然那种令人分心的感觉依然萦绕不去，但你在教室里并没有发现任何异常——除了总督的儿子，其他人都已经回家了，而他正像往常一样全神贯注地听你辅导。也许你潜意识里在担心他的父母会因为你留他太晚而责备你。[if (isunderage) {一个和你同龄的[boy]竟然是他的老师，这本身就是对那个家族自尊心的打击|一个处于你这样地位的[man]可能会利用这个男孩的信任，这足以让那个家族对你紧追不舍}]；你不需要更多惹怒他们的理由了。");
         outputText("[pg]你抚平[if (isfeminine) {你的半身裙，试图让自己忙碌起来|你的裤子，看着你暴露的[if (hasCock) {肉棒|腹股沟}]}]，在心里提醒自己要保持专业和专注。学生呼唤你，[say: 教授？]你抬起头，看到他站得很近，显然是在你走神的时候走过来的。你自然地问他在想什么，他的回答是默默地摆弄着大拇指。他的目光游移到你的[if (isfeminine) {裙子|胯部}]，带着一种令人不安的浓厚兴趣。你默默地抱怨着着装规定的暴露，然后咳嗽了一声，示意他回答你的问题。");
         outputText("[pg][say: 教、教授，我……]他开口了，紧张的情绪显露无疑。[say: 我刚交了一个[boyfriend]，但我完全不知道该怎么做爱。您能教教我吗？]");
         outputText("[pg]你满脸难以置信。如果不是因为他父母听到这件事的后果会让你早早进坟墓，你肯定会笑出声来。考虑到根据你的处理方式可能会发生什么，你最终还是妥协了——你决定给他上一堂关于如何取悦[man]的课。学生兴奋地拉近了你们之间本就不远的距离。[say:好的，我该怎么做？]");
         if(get_player().isFeminine())
         {
            outputText("[pg]你深吸了一口气，开始解释如何取悦一个女人——最重要的是向她展示他渴望她的身体，并且想让她吸他的肉棒。男孩热情地点头，说道：[say: 我绝对想要她的身体，但我不知道她是否想要我的。]当然，你是来教他的，所以你高兴地打消了他的顾虑，继续解释这种直接而诚实的吸引力表达是如何真正吸引女人的。话虽如此，除了展示欲望之外，还有更多的事情要做；在口交之后，他还需要通过为她口交来感谢她。");
            outputText("[pg]你的学生在吸收这些信息时，脸红得厉害。[say: 我-我们现在可以做吗！？]他一边惊呼，一边紧紧抓住他[if (shotaZealot) {小小的}]肉棒。现在你，也因为兴奋而脸红了。[say: 我想要你！我[b:太]想让你吸我的肉棒了！]他的话对你来说太过火了，你发现这节课的重点已经被完美地吸收了。如果他学得这么快，他的[boyfriend]将会是一个非常幸运的女人。你不会浪费时间教他一切，而是把自己降到他的胯部。");
            outputText("[pg]当你捧起他的蛋蛋时，男孩瑟缩了一下，你强忍着笑意，听着他紧张的呜咽声。当你把[tongue]压在他的阴茎根部，并渴望地向上拖动，在包皮系带上挑逗地扭动你的舌尖时，他发出了更多的声音，你进一步沉醉于这些感觉引起的可爱扭动中。在舔舐龟头时，你自己的[if (isgenderless) {无性别的耻骨，无论是否缺乏性器官|[genitalsdetail]}]体验到了一种奇怪的镜像感觉，并[if (istaur) {徒劳地}]伸手去抚摸自己，而没有思考这个动作。一只手深情地[if (hairlength > 0) {穿过你的[hair]|按摩你的头}]，将你的目光吸引到你学生那充满渴望的眼睛上，他无声地乞求你给他更多。你把他的老二含在嘴里，温柔地吸吮着，同时通过跳动的肉体感受着他的心跳。现在，你的下体变得更加火热了。");
            outputText("[pg]你站起身来，被欲望冲昏了头脑，并以为了及时完成课程为借口，指示他回报你。他似乎对自己还没有射精感到失望，但看到你[if (istaur) {向后躺下并抬起一条后腿来展示自己|坐回办公桌后面的椅子上，[if (hasvagina) {张开你的[if (tailLeg) {[if (isNaga) {蛇-}]裂口|阴唇}][if (hascock) {，你的[cocks]在它上方跳动[if (!multicock) {着}]}]|[if (hascock) {你的[cocks]在露天跳动|背对着他，[if (isdrider || tailLeg) {身体大部分溢出座位，并用其[if (isdrider) {许多腿|线圈}]缠绕在椅子的四肢上|拱起，将你的[ass]推向他的方向}]}]}]，展示他的目标}]时，他精神振奋起来。[if (!hasvagina) {你意识到他的[boyfriend]下面可能没有和你一样的部位……但你认为他不需要知道这一点|机智和细微差别对你来说现在无关紧要}]，当你命令男孩开始时；你的需求取代了他的需求。他不需要被告知两次。");
            outputText("[pg]当你的学生湿漉漉地亲吻你的[if (hasballs) {[balls][if (hasvagina) {，然后把阴囊移开去舔你的[vagina]}]|[if (hascock) {[cock 1]|[vagorass]}]}]时，另一股热流冲刷着你。他的舌头动得很快，正如你对一个饥渴的处男所期望的那样过分热情。保持你作为他老师的角色，你解释了如何改进他的技巧，当他不断调整以适应你的欲望时，你颤抖着。呻吟和喘息打断了你的指导，这极大地增强了他的信心，当他[if (hascock) {[if (cocklength > 4) {吞下|吞没}]他所能吞下的一切|[if (hasvagina) {紧紧地撅起嘴唇吸吮你的[clit]|将他滑溜溜的小舌头塞进你的屁股}]}]时，一股冲遍你全身的快感让你惊呼出声。学生在口交的同时，不顾一切地疯狂撸动着他的老二。强度超出了你的预期——你觉得自己才是这里疯狂的变态，试图尽快达到高潮。男孩摸索着你的大腿和臀部，最后在射精时对着你呻吟。在感觉的统一中，你感觉到你的身体一次性释放了所有的性紧张，[if (hascock) {将精液卸入他的喉咙[if (cumhighleast) {，在几秒钟内压倒了他的吞咽能力}]。他向后退缩，喘着粗气，同时喷得你[legs]到处都是。|在他的舌头周围疯狂地颤抖着。}]");
         }
         else
         {
            outputText("[pg]你深吸一口气，开始解释如何取悦一个男人——男人之间进行友好的竞争有多么重要。特别值得注意的是谁能提供最好的口交，以及谁能最快地让自己射精。他全神贯注地听着，承认他只知道吸吮老二，而不知道任何细微差别。继续上课，你列出了比赛的方式，其中一个男人挑战另一个男人，因此首先给另一个男人口交，然后交换位置，最后以手淫到射精结束。");
            outputText("[pg]当你伸手穿过他裤子的缝隙捧起他的蛋蛋，慢慢地按摩它们时，男孩瑟缩了一下。[say:你-你是在挑战我吗？]他问。因为你不是他的[boyfriend]，你当然不是；这只是一个示范，当你进一步降低身体，将嘴唇压在他的肉棒上时，你解释了这一点。伴随着一个轻吻，他[if (shotaZealot) {小小的|肿胀的}][zealotSkin]阴茎急切地跳动着接受这一课，当你把他的阴茎完全含在嘴里时，可以感觉到他的脉搏。[if (hascock) {你自己的阴茎跳动并变得坚硬，感觉到一种温暖，几乎就像你被口交一样|你的[if (hasvagina) {小穴|腹股沟}]变得火热，好像被舔和吸吮过，但又有所不同}]。你呆在那里，静静地用技巧和探索的兴趣移动你的[tongue]，惊叹于这种感觉似乎在回应的方式，并在男孩呜咽和扭动时强忍着[if (ischild) {咯咯笑|笑}]。");
            outputText("[pg][say:我——我现在可以试试吗？] ");
            if(get_player().hasCock() || get_player().getClitLength() > 2.5)
            {
               outputText("通常情况下，男人会为对方服务更长时间，但为了不让他放学后留得太晚，你允许他通过实践来学习，随后[if (istaur) {迈着你野兽般的腿，示意他到你后肢之间的空间，|[if (isdrider) {调整你众多的腿，舒服地安顿下来|坐回你办公桌后面的椅子上}]}]并展示你的[cockclit]。这个过度热情的学生赶紧跪下，抚摸[if (multicock) {所有的|你的}]肉棒。他的触摸很基础，完全没有掌握好硬度，因此你履行了你的职责，详细说明了应该怎么做。男孩很快就适应了，并把你的建议铭记在心，这让你感到惊喜。发现他的[if (silly) {[i:hand]iwork|手工}]足够好后，你进入口交阶段，指导他戳[if (multicock) {你的[cock 1]的}]顶端，然后将舌头拖到[if (hascock) {你的系带，然后在龟头周围打转|阴蒂包皮，然后在根部周围打转}]——他照做了，就好像他天生就会一样！");
            }
            else
            {
               outputText("尽管你看起来可能如此，但你并没有男人传统的装备，所以他不可能从服务[i:你]中学到他需要的课程。然而，这个理由让他不知所措。[say:如——如——如果我的[boyfriend]也没有鸡巴怎么办？我应该学，对吧？]你对此挑了挑眉，但[if (istaur || isdrider) {[if (istaur) {躺下你野兽般的身体|调整你众多的腿，舒服地安顿下来}]并向他展示你的[vagorass]|站起来，坐回你办公桌后面的椅子上，张开你的[if (hasvagina) {[if (tailLeg) {[if (isNaga) {蛇的泄殖腔|生殖裂}]来展示你的}][vagina]|[ass]，同时[if (isgoo) {分开|抬起}]你的[legs]}]}。紧张布满了他的脸，但你催促学生潜入并接受你的指导，这立刻迫使他做出回应；他的嘴唇湿漉漉地触碰你的[if (hasvagina) {外阴|肛门}]，然后伸出舌头在周围舔舐。这种技巧显得相当笨拙，因此你作为他老师的角色必须立即发挥作用，他很快就转变为坚定的[if (hasvagina) {用他的口部触手在你的[clit]下方摩擦，然后在你的阴蒂包皮周围探测，接着在你的褶皱之间长长地拖动到入口。你深吸一口气|探测你紧绷的肛门，扭动着散布他的唾液，然后推入更多。你放松肌肉}]并允许男孩探索开口，他的天赋显而易见。当你解释他应该在进行时抚摸和按摩你的[if (hasvagina) {阴蒂|脸颊}]时，他的手完美地完成了任务，不需要进一步的解释。");
            }
            outputText("[pg]如果你说你对[if (cor > 33) {自己那极为有效的教导|他那迅速的学习能力和敏锐的天赋}]并不感到颇为自豪，那是在撒谎。然而最终的考验已经到来，后续课程只能改日再享了。那个[if (shotaZealot) {年幼的}]男孩抬起头，露出被叫停的失落神情，但当你解释你们两人都必须尽可能快地手淫至高潮——先射者胜——时，他坚定地点了点头。你的学生紧握着他那[if (shotaZealot) {跃跃欲试的小}]肉棒，却在看见你[if (istaur) {起身用后腿跨坐椅子，将[genitalsdetail]抵在椅面上时愣住了。以这样的身体处理自己在操作上颇有难度，他似乎对此看得津津有味。看着你研磨着座椅，实质上是[if (hascock) {在上面手淫|磨蹭胯部}]|[if (hascock) {握住[if (cocks>2) {其中两根}]你自己的|将[hand]滑向[if (tailLeg) {[if (hasvagina) {你的[if (isNaga) {蛇形}]裂缝|绕到[hips]后侧的[ass]，一边按摩一边将手指摸索到那被舔得湿透的洞口}]|两腿之间，摸向那被舔得湿透而火热的[vagorass]}]}]}]时，他的阴茎明显跳动了一下，却依然沉默地目不转睛。你继续自我取悦，不久后发出一声满足的叹息，这触动了男孩，他呻吟着终于开始与你一同手淫。他以一种令你担忧的狂热撸着自己的肉棒，喘息呻吟时的极乐程度不似自然，然而与此同时你感到与他之间有一种亲密的连接，你的身体随着他的动作产生同等的刺激。无论你愿不愿意，你都被驱动着与他同步，[if (sens > 66) {在心中因这股铺天盖地的感受而失声|[if (sens > 33) {尽管以这种节奏你会在片刻之间高潮|即便照这个速度你也只会[if (isgoo) {让你的凝胶液化|把你的[if (hasplantskin) {纤维|肉身}]磨烂}]而非高潮}]}]。你的迫切似乎令他愈发兴奋，他以惊人的速度迎来高潮——那份感觉如浪潮般涌来，当他[if (shotaZealot) {喷射|射出}]到你身上时，同样的极乐也在你体内绽放[if (hascock) {，将同样的快感反射回他身上[if (cummediumleast) {，量远比他自己所能涌出的更多}]}]。");
         }
         outputText("[pg]巨大的解脱让你有些恍惚，感觉周围的整个世界都模糊了，而男孩正在把衣服穿好。现在整理好了，他忧心忡忡地盯着地面。[say:教授？我有个告白，]他小声说。作为他的老师，你找回了一些镇定，问他是什么事。[say:我撒谎说要找个[boyfriend]，其实我只是想要你。]在你还没来得及回应之前，他迅速在你的嘴上亲了一下，然后冲出门外，脸红得厉害。");
         outputText("[pg]眩晕感加剧，你倒在地上，整个幻觉迅速消退。");
         get_player().orgasm(get_player().hasCock() ? "Dick" : "VaginalAnal");
      }
      
      public function rideZealotReligious() : void
      {
         outputText("[pg]那个[if (shotaZealot) {男孩|男人}]坐在屁股上，张开双腿，一边做一边颤抖着。[say:我的身体……被这次失败玷污了，]他说道，他那[if (shotaZealot) {小小的|相对适中的}][zealotSkin]阴茎紧张地抽动着。[say:只有屈服才能洗净我。]他的紧张显而易见，但他对你的渴望也同样明显，随着你拉近距离而倍增。[say:我接受我的惩罚，并将为您受苦！]他紧闭双眼大喊道。");
         outputText("[pg]你蹲下身子，抚摸着从他长袍开口处突出的性器。玛瑞斯在很多方面都不拘小节且过度，但这个宗教狂热者所拥有的性器，无论是在形状还是大小上，放在英格纳姆都完全不会显得突兀。[if (isVagOrAssVirgin) {如果有什么人是你应该献出童贞的，一个几乎正常的人类可能是你能要求的最好的了。}]呜咽声将你的视线拉回，看着他可怜的脸。[say:我是一个可悲的[if (shotaZealot) {男孩|男人}]，竟然输给了一个异教徒，但女祭司教导过我——]你把他推倒，太饥渴了，急需释放，没空等他长篇大论。");
         outputText("[pg][if (!isnakedlower) {当你脱下[armor]展现出你的身体时，狂热者敬畏地看着你。}]一个“异端”的[if (hasvagina) {[vagina]|下体}]现在因渴望而泛红，就在他面前，并越来越靠近他[if (shotaZealot) {小巧的}]肉棒。[say:原谅我，我的主，原谅我，]他嘟囔着。[if (istaur) {经过他头顶的野兽前腿让他发出了清晰的吞咽声，而你的后半身则蹲下凑向他的大腿|[if (tailLeg) {你下半身[if (isNaga) {蛇形的}]长度无疑吓到了他，你很快就将其[if (!hasvagina) {向后}]缠绕在他的腿上[if (isNaga) {——现在被你紧紧缠住，他的腿显得如此纤细脆弱}]|[if (isdrider) {你蜘蛛身体细长的腿让他发抖，因为[if (hasvagina) {它们擦过他的身体，轻轻地将你的骨盆靠向他|你四处爬行，小心翼翼地翻转到蛛形怪物半身的背上，让你的[butt]落在他的大腿上}]|[if (isgoo) {泛红的[skintone]史莱姆让他感到担忧，但你无定形身体的温柔开始缓解他的恐惧|跨在他臀部上[if (thickness > 50) {粗壮的|[if (tone > 40) {强壮的|[if (thickness < 20 && tone < 20) {纤细的|温暖的}]}]}]大腿确保他无法从这里挣脱}]}]}]}]。[say:[He]看到我已经准备好了，却故意拖延来强调我的失败！]至少对你来说，他似乎有些夸张了。为了真正强调他的失败，并且不让这个失败者逃避任何工作，你命令他将龟头抵在你的入口处，并请求他的惩罚。对此，考虑到他战斗时的方式，他红着脸表现出了极其反常的羞涩。");
         outputText("[pg]然而，他很顺从，他那火热的[if (shotaZealot) {小}]鸡巴很快就碰到了你的[if (hasvagina) {阴唇|洞口}]。[say:异教徒，我会让你心满意足，因为我不配做别的，只能做个玩具，]他说道，而你[if (tailLeg) { [if (isNaga) {缠绕住他的身体，将|将}]他压入你的[if (hasvagina) {[if (isNaga) {蛇形泄殖腔|生殖裂}]|屁股}]，直到你}]吞没了他的长度，[if (isVagOrAssVirgin) {第一次被插入的感觉让你倒吸一口凉气[if (haslostvirginity) {在这个洞里}]。那[if (shotaZealot) {年轻的}]鸡巴是|感受着他[if (shotaZealot) {年轻的}]鸡巴的感觉：}]柔软，却又坚挺，而且难以置信的火热。");
         if(get_player().hasVagina())
         {
            get_player().cuntChange(get_currentZealot().cockArea(0),true);
         }
         else
         {
            get_player().buttChange(get_currentZealot().cockArea(0),true);
         }
         outputText("在你的脑海深处，[if (isVagOrAssVirgin) {你有一丝犹豫，怀疑这是否真的是你献出“第一次”的方式，但}]一阵快感袭来，就像你自己被包裹在你的[vagorass]的拥抱中一样，尽管你的[if (hasCock) {[cocks]在露天中抽动|自己并没有任何鸡巴}]。你忍不住移动你的[hips]，在动作中颤抖着。[say:我——]他在呜咽的呻吟中挣扎着说，[say:我受不了了！]");
         outputText("[pg]一种眩晕感从你的腹股沟涌起，[if (hasballs) {你的[balls]紧绷着，仿佛要射精，}]但你知道这不可能是高潮，不可能这么快！你几乎没有时间去享受它，然而一声尖叫从你的喉咙里挤出来，你颤抖着，而你身下的[if (shotaZealot) {孩子|男人}]发出了一声气喘吁吁、强烈的呻吟！他用尽全力将自己顶向你，精液喷溅在你的肉壁上，你如此强烈地体验到了那种释放，以至于你几乎把它误认为是自己的，但你仍然骑着他，摩擦着迫使他的鸡巴尽可能深地插入。狂热者的呻吟变成了喘息，然后是绝望、粗重的呼吸。[say:原谅我！原谅我！我不能——我——主啊——]他胡言乱语着，再次高潮，你的肌肉在这个过程中放弃了抵抗，屈服于这镜像般的狂喜，迎来了你自己的高潮。你的下体燃烧着，但随着你伴侣的眼睛翻白，燃烧感消退了，你意识到这只是他过度敏感的肉棒被过度使用了。");
         outputText("[pg]你喘了口气[if (!isnakedlower) {并重新穿好衣服}]。那个[if (shotaZealot) {男孩|狂热者}]仍然完全沉浸在失败的痛苦中，你花时间抢走了他身上看起来有用的东西，然后继续上路。");
         get_player().slimeFeed();
         get_player().orgasm("VaginalAnal");
         get_combat().cleanupAfterCombat();
      }
      
      public function religiousRapeFinishGood() : void
      {
         outputText("闭上了一会儿，你[if (istaur) {将头靠在祭坛上|依偎在他柔软的长袍里}]，随着欲望的阴霾慢慢从你的脑海中散去，你的呼吸变得平稳。你[if (hascock) {半硬的肉棒|[if (hasvagina) {仍然肿胀的阴蒂|平坦的腹股沟}]}]中那未被满足的悸动最先消失，当欲望褪去，露出你原本的自我时，能够按照自己的意愿思考真是一个奇迹。然后是你[skinshort]上的红晕，你眼中的迷离，当你完全自由时，你可以毫不费力地让自己在天堂里飘荡一会儿。");
         outputText("[pg]不知过了多久，当你睁开眼睛时，大教堂已经不见了，你发现自己[if (istaur) {侧躺}]在湖边的沙滩上。你的救世主也消失了，当你对着[if (isday) {光明|黑暗}]眨眼时，所有那些记忆就像海滩上的波浪一样，拍打着你略显迟钝的大脑。这一切似乎如此真实，然而现在世界已经恢复原状，你曾经所在之处留下的，只有你[vagorass]里的酸痛，点缀在[if (istaur) {沙子上|你的[skindesc]上[if (hascock) {和沙子上}]}]的干涸精液，以及当你去[if (isnaked) {收拾东西|穿衣服}]准备回营地时，你的[inv]里那种可疑的轻盈感。");
      }
      
      public function religiousRapeFinishBad() : void
      {
         outputText("在这辉煌中颤动。引导的力量从内到外流淌，让你战栗着乞求与主合二为一。你灵魂中回荡的哭喊渴望着被从堕落的边缘拉回，最终体会到神圣与纯洁那令人安心的怀抱。狂热者筋疲力尽地从你体内滑出，将他那沾满精液、半软的肉棒在你的脸上擦拭。[say:安息你疲惫的灵魂，将自己奉献给主，你将重获新生！]");
         outputText("[pg]但你没有。你醒来时，发现自己陷入了另一个幻觉，接着又是一个，无穷无尽。当最后你从泥沙中被拉起时，你的大脑已经支离破碎，无法做出反应，只能任由他人摆布。");
      }
      
      public function religiousRape() : void
      {
         outputText("[pg]你带着[if (lust >= maxlust) {狂乱的渴望|疲惫}]跌跌撞撞地撞在教堂的大门上，倒在那个穿着长袍的[if (shotaZealot) {小男孩|年轻男人}]面前。");
         outputText("[pg][say: 今天有什么烦心事吗，[if (shotaZealot) {[mister]|我的孩子}]？]");
         outputText("[pg]你确信，这个问题更多是出于礼貌而非好奇。你的病态显而易见，[if (isdemonmorph) {你的身体已经扭曲得像你来这里要对抗的那些恶魔一样|[if (cor > 66) {你的灵魂已经因为这个世界的污秽而变得沉重|这个世界潜藏的邪恶已经[if (cor == 0) {试图|开始}]占据你的灵魂}]}]。");
         outputText("[pg][say: [if (isdemonmorph || cor > 66) {即使是你|你}]依然可以被净化，但时间紧迫。]他若有所思地敲了敲下巴，长袍随着他的动作翻飞，露出了下面半硬的肉棒。他的穿着与[if (isreligious) {你自己的教团|你见过的任何教团}]大不相同，但不知为何，似乎就该是这样。[say: 请跟我来。]");
         outputText("[pg]石头、大理石和黄金都在他引导你深入时从身旁掠过，直到你们来到一个由雪花石膏雕刻而成的巨大祭坛前才停下，它曾经乳白色的侧面现在被一些不那么纯洁的东西玷污了。");
         outputText("[pg][say:让神明[if (istaur) {牵起你的手|拥抱你的身体}]，]他说道，[if (istaur) {[if (shotaZealot) {踮起脚尖拍了拍|拍了拍}]表面，似乎在向你展示该怎么做|[if (shotaZealot) {尽力帮助|帮助}]你上去[if (shotaZealot) {，尽管他个子很小}]}]。");
         outputText("[pg]石头[if (istaur) {在你的手掌下凉爽了片刻|[if (isnaked) {在你的[skinfurscales]上凉爽了片刻|贴着你，尽管你穿着[armor]}]}]，但那最初的触感很快让你沐浴在他神明的温暖中。热量在你的[if (isgenderless) {下半身|[genitals]}]汇聚，欲望席卷而来，在你的嘴唇上变得火热而粘稠，体内的邪恶从沉睡中苏醒，直到你[if (hascock) {挺动|研磨}][if (istaur) {着空气，无法满足你不断增长的欲望|着你的手}]。");
         outputText("[pg]你身旁的牧师安慰地点了点头。[if (isnaked) {[say:你准备好了。]|[say:首先，我们必须把你从束缚中解脱出来。]}他[if (shotaZealot) {小小的}]手滑过你的[skindesc]，留下阵阵颤栗，一直追溯到你[armor]的底部。你几乎没有时间呼吸，它就向下滑落，你迎来了微风凉爽的亲吻，一切都被轻而易举地扫除，这可能是奇迹，也可能是技巧。[say:现在你准备好了。]}]");
         outputText("[pg][if (isnaked) {他的触碰随后找到了你|然而他的触碰依然萦绕}]，幽灵般地滑过你[chest]的轮廓，你的呼吸随着他的节奏加快，你们两人以一种超越这个凡人世界的方式联系在一起。每一次手指的闪烁都从你身上回响到他身上，他的脸变得通红，他[if (shotaZealot) {微小|适中}]的阴茎从长袍下探出头来。即使你回想起在英格纳姆的生活[if (days > 30) {，那已经是那么久以前的事了}]，也很难想象自己会在[if (shotaZealot) {一个[if (isunderage) {你刚认识的|比你年轻得多的}]男孩|一个[if (isunderage) {比你年长的|你刚认识的}]男人}]的怀抱中，但现在似乎没有其他人能赐予你所寻求的救赎。");
         outputText("[pg]当他的手第一次包裹住他的肉棒时，从你的嘴唇中拖出一声颤抖的喘息，你的[if (hascock) {自己的[cocks]也变硬了，仿佛你也在他的掌控之中|身体颤抖着，因为他的快感在你体内泵动，这种感觉既陌生又确凿}]。你的臀部甚至在抽动，尽管[if (hascock) {没有被触碰|你自己没有阴茎}]，渴望着能够触及他，即使他[if (istaur) {搬来一张凳子，坐在你的马半身后面|退后了一步}]。");
         outputText("[pg][if (istaur) {虽然很难看清他在做什么，但那微弱的[if (hasvagina && vaginalwetness > 0) {手指按压感[if (vaginalwetness < 3) {分开了你的外阴唇，寻找着你发情的痕迹|触碰着已经弄脏你[underbody.skinfurscales]的滑腻液体}]|[if (analwetness > 0) {手指按压感触碰着你[if (analwetness < 3) {已经润滑的|湿透的}][asshole]|倒出什么东西的声音}]}]是无法忽视的|但只有一瞬间，狂热者[if (shotaZealot) {男孩}]很快就靠了过来，[if (hasvagina && vaginalwetness > 0) {挑逗地分开你的外阴唇，[if (vaginalwetness < 3) {寻找里面不断增长的发情证据|收集一些已经弄脏你[skinfurscales]的丰富汁液}]|[if (analwetness > 0) {轻轻地将你抬起，用手指在你暴露的[asshole]周围画圈，收集一些[if (analwetness < 3) {珠状的|自由流动的}]天然润滑液|从祭坛上拿出一个雕刻的圣杯，将手指浸入里面散发着甜味的液体中}]}]}]。");
         outputText("[pg][say: 主啊，让这根圣杖被[if (vaginalwetness > 0 || analwetness > 0) {[his]祭品|你神圣的油脂}]涂抹吧，]他说道，祈祷的话语刚从他唇边升起，[if (!istaur) {他那滑腻的拇指就顺着他的肉棒滑下，留下一道闪闪发光的[if (vaginalwetness > 0 || analwetness > 0) {你的欲望|油脂}]痕迹|你手掌下的祭坛微微变暖，这既是不祥之兆，又令人感到安慰}]。");
         outputText("[pg][if (istaur) {当快感从你的脸庞席卷至侧腹时，你完全明白他在做什么，你呼吸沉重，双腿不稳，大脑一片空白，直到你的[vagorass][if (vaginalwetness > 0 || analwetness > 0) {变得[if (vaginalwetness < 3 && analwetness < 3) {湿润|湿透}]|松弛并放松}]|这种感觉从你的头部震颤到肠胃，随着他的抽插如波浪般回荡，让你的大脑一片空白，你的[vagorass][if (vaginalwetness > 0 || analwetness > 0) {[if (vaginalwetness < 3 && analwetness < 3) {变得湿润|湿透}]|松弛并放松}]}]，除了被填满之外别无他求。只有这个[if (shotaZealot) {男孩|年轻人}]受祝福的肉棒才能净化这些从体内污秽中冒出的邪恶欲望，即使现在你也发现自己成了它们的奴隶，不安地[if (istaur) {变移|扭动}]着，引诱他进来。");
         outputText("[pg][say: 坚强点，]狂热者低语道，他的声音颤抖得厉害，让人分不清这话是对你说的还是对他自己说的。然而，无论你多么努力，快感依然如潮水般将你淹没，用纯粹的欲望浸透你的灵魂，直到你[if (isdemonmorph) {感觉自己从内到外都像个真正的恶魔[if (isfeminine) {ess}]|确信自己和恶魔[if (isfeminine) {ess}]没什么两样}]，总是渴求着更多。");
         outputText("[pg]你没等多久，[if (istaur) {就感觉到}]他[if (shotaZealot) {小巧的}]阴茎[if (hascock) {擦过[if(!istaur) {了}]你自己的肉棒|滑过[if (!istaur) {了}][if (hasvagina) {你大腿间湿润的三角区|你[if (istaur) {下腹部|腹股沟}]光滑的表面}]}]，顺滑地溜过你的[if (istaur) {[underbody.skinfurscales]|[skinfurscales]}]。空气中[if (vaginalwetness > 0 || analwetness > 0) {你自己发情的气味|圣油的香气}]只会让你更加兴奋，你仿佛着了魔一般，发现自己正[if (istaur) {后退|伸手向下}]，引导他靠近你那饥渴的穴口。");
         outputText("[pg]他没有反抗，一边喃喃自语着祈祷，一边走上前来，将龟头抵在你那炽热的入口处。他[if (istaur) {呼吸变得沉重|咬紧牙关}]，缓慢地向前推进，用他[if (shotaZealot) {尚未发育完全的}]粗度撑开了你的[vagorass]。仅仅是这种感觉就夺走了你的声音，当他进入你时，任何声音都死在了你的喉咙里，[if (isVagOrAssVirgin) {你初次的圣洁早已迷失在欲望之中，尽管这一切对你来说都是第一次，|并且}]你用尽了全身的力气才克制住自己没有把他拉得更深。");
         if(get_player().hasVagina())
         {
            get_player().cuntChange(get_currentZealot().cockArea(0),true);
         }
         else
         {
            get_player().buttChange(get_currentZealot().cockArea(0),true);
         }
         outputText("不，你绝不能让那股邪恶获胜，你的[claws]深深陷入[if (istaur) {石头里|你的手掌中}]，被他神圣的温暖填满的感觉让你浑身战栗。");
         outputText("[pg]相反，你顺应着狂热者的节奏，这是一种既令人沮丧又安全的缓慢韵律。毕竟，这就是能治愈你的方法，即使你[if (istaur) {正饱受那无法触及的快感诅咒的折磨|屈服于快感的诅咒，开始[if (hascock) {抚弄你的[cock]|用手指揉捏你的[if (hasvagina) {[clit]|[nipple]}]}]}]，无论你多么努力都无法满足。你自己的每一个动作似乎都像传遍你全身一样，真切地涌入他的体内，他的抽插很快[if (istaur) {在你的侧腹荡漾开来，并}]在高耸的墙壁间回荡，直到整个大教堂都迷失在性爱那湿滑的声响中。");
         outputText("[pg][say: 哦，主啊——]他试图祈祷，但很快就被一声穿透你[vagorass]的呻吟吞没了。[say: 哦，主啊，请赐予[him]您的祝福，将[him]从这邪恶中解放出来吧！]");
         outputText("[pg]这句祈祷似乎给了他新的力量，他的臀部迎合着你的动作，用他[if (shotaZealot) {小小的}]全部长度填满了你。它的热度流遍你的全身，而你自己的情欲也[if (hascock) {从你的龟头溢出|[if (hasvagina) {[if (vaginalwetness) > 3) {汇聚|滴落}]在[if (istaur) {地板|祭坛}]上|[if (analwetness > 0) {[if (analwetness) > 3) {汇聚|滴落}]在[if (istaur) {地板|祭坛}]上|在你的[skindesc]下涌出}]}]}]，这[if (hascock || hasvagina || analwetness > 0) {对所有人|只有你自己}]来说都显而易见。他的情况也好不到哪里去，他气喘吁吁地用你从未见过的狂热抽插着你，每次他进入你时，你的身体都会不由自主地摇晃，就好像[if (hascock) {你正在操他|你才是那个主导者}]一样。");
         outputText("[pg][say: [if (hascock) {立刻驱逐这个恶魔|沐浴在神圣的光芒中}]！]狂热者[if (shotaZealot) {男孩}]大喊着，最后一次将自己深深埋入你体内。他受祝福的精液的第一股喷射让你同时崩溃，你的[if (hascock) {自己的[cock]将它被污染的液体喷射[if (istaur) {在祭坛上|到空中}]，而你的}][vagorass]紧紧夹住他的肉棒，拼命想把更多他神圣的礼物吸入你的[if (hasvagina) {内部圣所|最深处}]。他自己的快感从他传递给你，又从你传递给他，直到[if (!istaur) {你双腿发软|你的手指抠进祭坛的边缘}]，在连锁反应中流遍你的全身，夺走你肌肉的力量和你唇边的话语，[if (istaur) {狂热者终于瘫倒在你身上|你们俩终于瘫倒在彼此身上}]，即使你的[vagorass]继续哄骗出它能得到的一切。");
         outputText("[pg]但你仍然需要更多——你需要他能给出的一切，如果你想克服这个诅咒的话——随着从他肉棒上滴落的每一滴逐渐减少的精液，你感觉到神圣的痕迹在你的肠胃深处汇聚。你将注意力集中在它们身上，沐浴在它们的存在中，你的眼睛");
         get_player().orgasm("VaginalAnal");
         get_player().slimeFeed();
      }
      
      public function registerTags() : void
      {
         var _gthis:FetishZealotScene = this;
         registerTag("shotazealot",TagFun_Impl_.fromBoolFun(function():Boolean
         {
            return _gthis.get_currentZealot().shotaZealot;
         }));
         registerTag("zealotskin",TagFun_Impl_.fromStringFun(function():String
         {
            return _gthis.get_currentZealot().skin.tone;
         }));
         registerTag("zealothair",TagFun_Impl_.fromStringFun(function():String
         {
            return _gthis.get_currentZealot().hair.color;
         }));
      }
      
      public function rapeDrain() : void
      {
         dynStats(DynStat.Inte(-1),DynStat.Cor(2));
      }
      
      public function get_currentZealot() : FetishZealot
      {
         if(currentZealot == null)
         {
            generateZealot();
         }
         return currentZealot;
      }
      
      public function generateZealot() : void
      {
         currentZealot = new FetishZealot();
      }
      
      public function dickZealotReligious() : void
      {
         outputText("[pg]狂热者双手合十，似乎在集中精神，寻找他所需要的决心。他背对着你，手脚并用地趴在地上，将自己献上。[say:我的身体……被失败玷污了，只有屈服才能洗净……]之前改变服装的魔法开始缩短他长袍的裙摆，直到他的屁股暴露在你面前。[say:我们敬爱的主啊，我将为您受苦，]他说道，然后将目光转向你，眼中充满了焦虑。尽管他表面上很克制，但你能感觉到他身上散发出的兴奋，这让你的勃起更加坚挺。");
         outputText("[pg]你没有被劝退，你[if (isnakedlower) {抓住了你赤裸、暴露的|从[armor]的束缚中释放出来，露出了你的}][cocks]。你向这位狂热的[if (shotaZealot) {男孩|年轻人}]迈出的每一步都让他颤抖，直到最后，当你的[if (istaur || isdrider) {前腿落在他身边，用你的存在感包围他，同时你的坚硬|坚硬压在}]他柔软的[zealotSkin]屁股上时，他发出了一声释放紧张的喘息。那渴望的后穴颤抖着，他很可能已经被训练过在这里承受一个[man]了。");
         outputText("[pg][say:高高在上的神啊，很快一个[manboy]就会——]你把你的[cock]推进他的屁股，当柔软的肉体拥抱你时，引起了他痛苦和喜悦的叫喊。[say:我的耻辱给——]当你抽插时，他在试图说话的间隙呻吟着。[say:——给异教徒带来了快乐！]");
         outputText("[pg]你发现他的\"祈祷\"多少有些令人分心，然而那充满欲望的痛苦呜咽却让你沉浸其中，甚至在一定程度上入戏了。[say: 那——]当你再度猛地插入时他几乎出声。[say: 女祭司保证过我——啊！——我已经为此做好准备了，]他哭喊道，仰头望天。他那柔软炽热的内腔，仿佛专为你的[cock]量身训练而成[if (silly) {——女祭司是你阴茎的分身，或者肉棒克隆体，或者诸如此类的念头，令你心神不宁}]。那[if (shotaZealot) {辅祭男孩|狂热者}]腹部的肌肉绷紧，他的身体正在以全力夹紧你的肉棒。令人眩晕的感觉席卷而来，他的高潮仿佛就是你自己的！");
         outputText("[pg]你脸上带着呆滞的神情呻吟着，让你的重量落在他身上，[if (sens < 33) {几乎忘记了自己。你不可能射得这么快！然而这对你来说感觉如此真实，而那个气喘吁吁的[if (shotaZealot) {小男孩|狂热者}]向你保证，这对他来说非常真实！渴望感受到更多，你不断地抽插，渴望在他柔软深处的火热中获得更多的高潮。先列腺液在你的抽插中涂满了你的阴茎，自由地渗漏出来，}]在你的肠胃深处，有一种压力正在积聚，感觉就像[if (isanalvirgin) {一种奇怪的、不寻常的|一次肛门}]高潮！毫无克制地，你带着狂喜咆哮着，把你的精液涂满他的体内！精液从你体内喷涌而出，他在神圣的满足中尖叫着，把自己的精液也喷洒在地上。");
         outputText("[pg]如果他们教团的神职人员能和所有新兵都这样做，也许你应该考虑皈依。没有在这个想法上停留太久，你整理好自己，在离开他之前，在这个疯子的东西里翻找可能有用的东西。");
         get_player().orgasm("Dick");
         get_combat().cleanupAfterCombat();
      }
      
      public function badEndCheck() : Boolean
      {
         if(get_player().get_inte() < 10)
         {
            return Utils.randomChance(50);
         }
         return false;
      }
   }
}

