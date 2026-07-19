package classes.scenes.areas.glacialRift
{
   import classes.BaseContent;
   import classes.Cock;
   import classes.CockTypesEnum;
   import classes.ImageManager;
   import classes.Player;
   import classes.items.Armor;
   import classes.items.armors.NaughtyNunsHabit;
   import classes.scenes.combat.Combat;
   import coc.view.CoCButton;
   import flash.Boot;
   
   public class YetiScene extends BaseContent
   {
      
      public function YetiScene()
      {
         if(Boot.skip_constructor)
         {
            return;
         }
         super();
      }
      
      public function winAgainstYeti() : void
      {
         var _g1:Combat;
         var _g:NaughtyNunsHabit;
         clearOutput();
         outputText("野兽用饥渴的目光看着你，他那根滚烫粗壮的肉棒从双腿间的包皮中滑出。雪人再也无法忍受，用双手握住他那根又长又烫的肉棒，保护它免受寒冷，同时抚慰着那湿滑坚硬的肉体。你放下了戒备，因为你意识到这只怪物已经无心恋战，只满足于一边警惕地看着你一边自慰。那么，你现在该怎么做？");
         menu();
         addButtonDisabled(0,"操屁股","这个场景需要你拥有阴茎和足够的性奋度。");
         addButtonDisabled(1,"骑乘肉棒","这个场景需要你拥有阴道和足够的性奋度。");
         if(get_player().get_armor() is NaughtyNunsHabit)
         {
            _g = get_player().get_armor();
            addButton(2,"膜拜肉棒",function():void
            {
               _g.naughtyNunCockWorship();
            }).hint("通过对这只生物肉棒的奉献来赞美你的主。");
         }
         if(get_player().get_lust() >= 33)
         {
            if(get_player().hasCock())
            {
               addButton(0,"操屁股",fuckYetiInTheAss);
            }
            if(get_player().hasVagina())
            {
               addButton(1,"骑乘",rideYetisCock);
            }
         }
         _g1 = get_combat();
         setSexLeaveButton(function():void
         {
            _g1.cleanupAfterCombat();
         });
      }
      
      public function rideYetisCock() : void
      {
         clearOutput();
         get_images().showImage("yeti-vag-ride");
         outputText("你自己也湿透了，你决定给这只倒下的野兽一个温暖舒适的剑鞘，来安置他那脆弱的肉棒。你拉开[armor]，刚好露出[vagina]，然后跨坐在倒下的雪人身上。他用警惕却又充满希望的眼神看着你。你咧嘴一笑，握住他毛茸茸的大手，将它们从他坚硬的红色肉棒上推开。冷空气袭来，雪人发出一声短促的惊呼，但你迅速对准他，猛地坐下，一个有力的动作就将他的肉棒深深埋入你的体内。[pg]");
         if(get_player().looseness(true) <= 1)
         {
            outputText("当他粗大的肉棒痛苦地撑开你的肉壁时，你微微呜咽了一声。");
         }
         get_player().cuntChange(18,true);
         outputText("[pg]");
         outputText("你坐在强壮的雪人身上，顺着他的肉棒向下滑动，直到他那棒球大小的沉甸甸的睾丸压在你的[butt]上。你在雪人的肉棒上轻轻弹跳了几下，但很快就发现自己冷得发抖，一阵冷风穿过洞穴，让你冷到骨子里。看到你的不适，雪人伸出他粗壮有力的双臂环抱住你，然后将你拉倒在他身上。你的脸埋进");
         if(get_player().get_tallness() < 60)
         {
            outputText("他毛茸茸的肚子");
         }
         if(get_player().get_tallness() >= 60 && get_player().get_tallness() < 72)
         {
            outputText("他胸前厚实柔软的皮毛");
         }
         if(get_player().get_tallness() >= 72)
         {
            outputText("他的后颈");
         }
         outputText("，雪人浓烈的麝香包围着你。[pg]");
         outputText("现在被厚实温暖的皮毛包裹着，并受益于雪人舒适的体温，你的颤抖很快就平息了。雪人以令人惊讶的温柔移动身体，将背部贴在洞穴墙壁上，让你们俩处于坐姿，而你则依偎在他的腿上。你对这个大个子软汉眨了眨眼，把手埋进他的皮毛里，开始轻轻地摇晃你的臀部，小心翼翼地将他的一小部分阴茎在你的[vagina]里进进出出，注意保持其余部分锁在你们身体之间的温暖中。[pg]");
         outputText("你继续在雪人的阴茎上弹跳，用你的臀部摩擦他，并挤压你的阴道肌肉来榨取他。雪人紧紧地抱着你，将他的一只大手从你的背部移到你的[chest]，隔着你的[armor]轻轻地挤压和捏弄，让你忍不住喘息。雪人对你的反应发出一声低沉的喉音笑声，开始配合你的动作移动他自己的臀部，将比以前更多的阴茎塞进你体内。你咬紧牙关，呻吟着，他那狭窄的龟头滑过你的子宫颈，戳着你子宫的入口。[pg]");
         outputText("当你达到高潮时，你发出一声最后的呜咽呻吟，在他的手臂束缚下尽可能快地在雪人的阴茎上抽插。快感的冲击穿透你，让你整个身体在野兽的拥抱中痉挛。当你的[vagina]紧紧夹住他时，雪人向后仰起头，最后一次猛烈地刺入你的深处，也射精了，尽可能深地埋入你体内，将他浓稠滚烫的精液泵满你。雪人的精液倾泻进你体内，温暖了你的肠胃和下半身，让你舒服得呻吟喘息。他那棒球大小的睾丸将你填得远超极限，精液淹没了你最深处，溢出来浸湿了你的大腿和腹股沟，在你们交缠的身体之间发出湿润的吧唧声。[pg]");
         outputText("伴随着一声湿润的“啵”声，雪人的阴茎从你被过度填塞的洞里滑出，缩回它的包皮里，让更多的精液溢出，弄脏了他的皮毛。你还在为刚才的高潮喘息，接下来的几分钟里，你依偎在温暖潮湿的雪人身边，紧紧抓住他柔软的皮毛，直到你觉得是时候离开了。你抬头看着雪人想说再见，却发现他正在安静地打呼噜，他的胸膛随着每一次呼吸起伏，托起你的整个身体。你微微一笑，在他的脸颊上亲了一下，然后整理好你的装备，回到了营地。");
         get_player().orgasm("Vaginal");
         get_combat().cleanupAfterCombat();
      }
      
      public function loseToYeti() : void
      {
         clearOutput();
         if(get_player().get_HP() <= 0)
         {
            outputText("你感到体力不支，战斗姿态开始动摇；冰雪人察觉到了你的疲惫，将你扑倒在地。伴随着一声呻吟，你抬头看着将你压在身下的冰雪人。在这冰冷的洞穴中，被这样一个温暖、毛茸茸的生物压着，带来了一丝短暂的舒适感，尽管你能感觉到他那巨大的肉棒滑出包皮，带着热量和压力在你的身体上摩擦。他的意图很明显：他要强行享受你的温暖。");
         }
         else
         {
            outputText("你达到了极限；下半身的欲望让你分心太多，你完全放弃了抵抗。你的双手反而隔着护甲淫荡地抚摸着自己：唯一让你还穿着衣服的原因是周围冰穴的寒意，但当你看着冰雪人逼近并笼罩着你，他那巨大的红色肉棒完全露出，散发的热量在寒冷的空气中升腾，你怀疑自己很快就不会觉得冷了。");
         }
         getFuckedByYetiDoggyStyle();
      }
      
      public function getFuckedByYetiDoggyStyle() : void
      {
         outputText("你的身体被这只巨大的野兽完全压住，他的手粗暴地隔着护甲抚摸你，同时他那巨大的肉棒从毛茸茸的包皮中滑出，在你身上摩擦。所有这些强硬的触摸和揉捏让你的脊背发凉，但尽管如此，他压在你身上的体温却出奇地令人舒缓，你发现自己放松下来以躲避寒冷。伴随着一声咕哝，他宽大的双手罩住你的[ass]，隔着[armor]揉捏你的屁股。他强硬的触摸加上那根巨大光滑的肉棒在你身上摩擦的热度，让你的身体兴奋起来，而野兽发情时的麝香味更是让你欲火焚身，");
         if(!get_player().hasCock() && !get_player().hasVagina())
         {
            outputText("让你的身体因兴奋而阵阵发麻。");
         }
         if(get_player().hasCock())
         {
            outputText("让血液涌向你的[cocks]使其肿胀");
         }
         if(get_player().hasCock() && get_player().hasVagina())
         {
            outputText("，并且");
         }
         if(get_player().hasVagina())
         {
            outputText("让你" + get_player().vaginaDescript(0) + "的阴唇开始流出淫液并变得湿润");
         }
         outputText("。突然猛地一拽，你被转过身来，被迫四肢着地，他的四肢将你的四肢死死压在冰穴的地面上。伴随着一声喘息，你感觉到冰霜在你的四肢上凝结，冰层顺着四肢蔓延，将它们冻结在原地，把你困住，任由冰雪人对你为所欲为。冰雪人双手用力一扯，露出了你的[ass]，当它短暂地暴露在冷空气中时，你打了个寒颤。[pg]");
         outputText("一根火热、光滑、跳动着的长物迅速挤进了你的臀沟，在你紧实的臀瓣间抽插，你感受到了冰雪人肉棒那令人愉悦的温暖。你喘息着，那根天生光滑的怪物肉棒在你的[asshole]上流下淫液，将温暖的先列腺液涂满了你的会阴。冰雪人继续卖力地抽插着你，他那温暖毛茸茸的身体压在你的身上，尽管你的四肢被困在冰里，你还是忍不住觉得这种柔软的温暖出奇地令人愉悦。");
         if(get_player().hasCock())
         {
            outputText("尽管身处冷空气中，你的[cocks]现在已经完全勃起了。");
         }
         outputText("伴随着一声饥渴的咕哝，冰雪人停止了抽插，当你转过头时，你可以看到他正在对准，他的一只手握着那根巨大长物的根部。他将跳动的龟头压在你的后庭上，顶着你的阻力向里推，从你的唇间逼出一声低吟。伴随着持续的推挤，他滑过了你紧绷的菊穴边缘，埋入你的温暖之中。野兽的嘴里发出一声低沉的呻吟，挺动着臀部，将他那巨大的肉棒更多地塞进你的体内。当野兽占据你的穴时，你只能呜咽着，在冻住你四肢的冰层中挣扎。[pg]");
         get_images().showImage("yeti-loss");
         outputText("肉体拍打肉体的声音在洞穴的冰壁上回荡，雪人将你的屁股操得死去活来，他那巨大的肉棒一次又一次地将你完全贯穿，每一次野蛮的抽插都让你被束缚的四肢隐隐作痛。尽管身体不适，呻吟声还是从你的唇间溢出，毛茸茸的野兽像一件加热的毛衣一样包裹着你，对你屁股的粗暴抽插让它以一种恰到好处的方式燃烧起来。你能感觉到他的先列腺液从你的后穴滴落，在你的会阴和腿上留下温暖的痕迹。");
         if(get_player().hasCock())
         {
            outputText("一些液体沾到了你完全勃起的[cocks]上，让");
            if(get_player().totalCocks() == 1)
            {
               outputText("它");
            }
            else
            {
               outputText("它们");
            }
            outputText("更加酸痛。");
         }
         if(get_player().balls > 0)
         {
            outputText("你的阴囊被这东西弄得黏糊糊的。");
         }
         if(get_player().hasVagina())
         {
            outputText("你能感觉到它在你的阴阜边缘积聚。");
         }
         outputText("雪人毛茸茸的蛋蛋拍打着你，用它们巨大的尺寸重击着你，你的臀肉在它的蹂躏下变得通红。");
         if(get_player().mf("m","f") == "m")
         {
            outputText("野兽肉棒的顶端撞击着你的前列腺，让你舒服得叫出声来。");
         }
         outputText("你的呻吟声越来越大，随着那根巨大的肉棒在你的穴里不断捣弄，你很快就达到了极限。");
         if(get_player().hasCock())
         {
            outputText("一股股精液从你的[cocks]中射出，溅满了洞穴的地板，在寒冷的冰面上冒着热气。");
         }
         if(get_player().hasVagina())
         {
            outputText("你的" + get_player().vaginaDescript(0) + "被你的淫液浸透，让你的双腿在快感中变得湿滑，液体滴落到你身下冰冷的地板上冒着热气。");
         }
         get_player().buttChange(18,true);
         outputText("伴随着一声低吼，雪人猛地撞向你，力度大到让你身上的冰块束缚都裂开了：他尽可能深地没入你的体内，开始将他那抗寒的精液灌满你。它以一种让你呻吟的方式温暖了你的肠道和下半身，他那棒球大小的蛋蛋将你填得远超极限，精液淹没了你的内部，溢出来浸透了你的会阴和腹股沟。很快，你身下的地板上就形成了一大滩温热的液体。伴随着一声湿润的“啵”声，雪人将他射精后的肉棒从你被塞满的穴里拔了出来，更多的精液溢出来溅到地板上。没有多余的动作，野兽的肉棒缩回了包皮里，雪人原路返回，留下你作为一个被困住、无助的肉便器，留待以后使用。[pg]");
         outputText("你挣扎着对抗束缚你四肢的冰块，其中一块在之前的交媾中已经裂开，费了一番力气后，你终于挣脱了。");
         outputText("收拾好东西，你注意到在挣扎中丢失了一些宝石，但你没有理会，因为你急于离开洞穴。从雪人离开的出口走出去，回到裂谷中，你开始了漫长的回营地之旅……但当你在冰川裂谷的寒冷原野上跋涉时，你注意到尽管天气寒冷，你的屁股却依然火热。也许这是雪人精液的特殊性质？");
         get_player().orgasm("Anal");
         get_combat().cleanupAfterCombat();
      }
      
      public function fuckYetiInTheAss() : void
      {
         clearOutput();
         outputText("你走近那只毫无防备的雪人，他正仰面躺在你面前。你的目光顺着他强壮的身体向下移动，落在他微微分开的双腿和肌肉发达的臀部上，一股欲望在你的腹中涌起。你跪下来，将他粗壮的双腿推开，雪人没有反抗，任由你完全暴露他宽大的臀部。你的双手抚摸着他毛茸茸的臀瓣，那皮毛出乎意料地柔软温暖。你用手指揉捏着，诱哄着那紧实的肉丘分开，露出他紧闭的入口。[pg]");
         outputText("带着一丝好奇，你用手指滑过那柔软的肌肤：它紧绷绷的，抗拒着你的戳弄。你听到雪人嘴里发出一声压抑的咕噜声，但他依然一动不动地躺着，任由你慢慢放松他的后穴。当你把一根手指滑进去时，雪人似乎从嘴里喘出了热腾腾的白气。你的手指被雪人紧紧包裹着：与周围冰冷的环境相比，这里面感觉如此火热。你隔着盔甲的下体隐隐作痛，光是想想被这样美妙的温度包裹会有多舒服，就让你难以自持。你决定穿着盔甲，把你的[cocks]掏出来暴露在空气中，在雪人面前温暖的臀部上摩擦，而雪人也开始抚摸他那根巨大的肉棒。[pg]");
         outputText("当你完全勃起后，你开始顶弄雪人紧绷的后穴，将[onecock]挤了进去。[pg]");
         if(get_player().cocks[0].get_cockType() == CockTypesEnum.HORSE)
         {
            outputText("你膨大的龟头让进入变得困难，但你流出的前列腺液润滑了通道，让你得以将紧绷的入口撑开，足以让宽大的龟头冠状沟挤进去。雪人发出一声低沉的呻吟，一股前列腺液从他红色的肉棒中漏出。感觉到你膨大的龟头摩擦着他的肠壁，你开始向这火热的洞穴深处挺进。[pg]");
         }
         if(get_player().cocks[0].get_cockType() == CockTypesEnum.CAT)
         {
            outputText("伴随着一声闷哼，你成功挤过了紧绷的入口，你那猫科动物般的肉棒深深地插了进去。坚硬的倒刺摩擦着雪人的内壁，引得他嘴里发出愉悦的呻吟。你开始挺动腰身，拍打着他毛茸茸的臀部，你的倒刺在雪人那温暖得令人陶醉的洞穴中震颤着。[pg]");
         }
         if(get_player().hasKnot())
         {
            outputText("你的龟头轻松地滑了进去，伴随着几次缓慢的挺动，你将更多的[cock]送入了雪人美妙的温暖之中。你拍打他紧实臀部的声音在洞穴中回荡，你开始猛烈地操弄着雪人紧致的后穴，你的肉结慢慢肿胀，你舒服得呻吟出声。身下的雪人轻声呻吟着，抚摸着自己那根巨大的红色肉棒。最终，你的肉结肿胀得太大，无法穿过雪人的入口，只能拍打着那紧绷的血肉，你感觉到高潮即将来临。[pg]");
         }
         else
         {
            outputText("雪人温暖的肠壁紧紧包裹着你的肉棒，你大声呻吟着，拍打着他毛茸茸的臀部，开始向雪人的深处挺进。每一次都有更多的长度滑入，穿过紧紧包裹着你肉棒的紧致圆环，它拉扯着你坚硬的血肉，榨取着你的精液。[pg]");
         }
         outputText("当你操弄他时，雪人抚摸着他那根巨大的红色肉棒，喉咙里发出低沉的呻吟。他一动不动地躺着，任由你支配他的后穴。你的双手紧紧抓住他毛茸茸的臀部，随着你加快速度，你的手也越抓越紧。[pg]");
         if(get_player().biggestCockArea() >= 20)
         {
            outputText("你尽可能深地插入雪人体内，汲取着你能得到的温暖，并将一只手从雪人的臀部移开，抚摸着你那根本塞不进去的几英寸长的肉棒。[pg]");
         }
         if(get_player().biggestCockArea() <= 20 && get_player().cocks[get_player().biggestCockIndex()].hasKnot())
         {
            outputText("伴随着最后一次挺动，你的肉结挤过了雪人的入口，将你们俩紧紧连在一起。你是阿尔法，而他是你的母狗，你准备用你的精液让他受孕。你向前倾身，达到了极限，发出一声低沉的呻吟。[pg]");
         }
         if(get_player().balls > 0)
         {
            outputText("你的[balls]紧缩，身体准备发射。你将精液射满雪人的屁股，射出无数股精液，用你那麝香味的浓精涂满他的肠壁。[pg]");
         }
         if(int(get_player().cocks.length) > 1)
         {
            outputText("你其他的肉棒也卸下了负担，将精液涂满他毛茸茸的后穴，把他的臀部浸透在你的精液中，把你黏糊糊的白浊弄脏了他白色的皮毛。你满足地呼出一口气，拔出肉棒，精液顺着你的肉棒流下，从他被蹂躏过的后穴中漏出。雪人呻吟着，将精液射在自己的胸膛上，巨大的浓稠精液块黏住了他的皮毛。[pg]");
         }
         outputText("你毫不迟疑地将[cocks]塞回[armor]中，顺着雪人进来的通道离开了洞穴，留下那只可怕的雪人看起来就像一个被玩坏的婊子，并在路上收集了一些战利品。");
         get_player().orgasm("Dick");
         get_combat().cleanupAfterCombat();
      }
   }
}

