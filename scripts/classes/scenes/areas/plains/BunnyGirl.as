package classes.scenes.areas.plains
{
   import classes.BaseContent;
   import classes.Cock;
   import classes.DynStat;
   import classes.Player;
   import classes.Vagina;
   import classes._FlagDict.FlagDict_Impl_;
   import classes.display.SpriteDb;
   import classes.globalFlags.KFLAGS;
   import classes.internals.Utils;
   import classes.items.ConsumableLib;
   import classes.items.Weapon;
   import classes.scenes.Camp;
   import classes.scenes.Inventory;
   import coc.view.CoCButton;
   import flash.Boot;
   import haxe.IMap;
   
   public class BunnyGirl extends BaseContent
   {
      
      public function BunnyGirl()
      {
         if(Boot.skip_constructor)
         {
            return;
         }
         super();
      }
      
      public function talkToBunnyBunBun() : void
      {
         spriteSelect(SpriteDb.get_s_easter_bunneh());
         var _loc1_:IMap = KFLAGS.flags;
         FlagDict_Impl_.arrayWriteInt(_loc1_,132,FlagDict_Impl_.arrayReadInt(_loc1_,132) + 1);
         clearOutput();
         outputText("你慢慢地做了自我介绍，让兔女郎知道你对她没有恶意。她一动不动，直到你讲完。但当你结束时，她明显放松下来并点了点头。这并没有让她的尾巴停止抽动，甚至她的鼻子也跟着抽动起来，但她还是问道：[say: 你怎么能看到我？我有很多彩蛋要藏，通常没人能看到我。][pg]");
         outputText("你耸了耸肩，这是你唯一的回答。她以为自己是某种隐形兔子吗？这太疯狂了！[pg]");
         if(isEaster())
         {
            outputText("她叹了口气，用手腕上像手镯一样的毛球擦了擦额头上的汗，试图解释道：[say: 我得把这些彩蛋都放出去！这是我的职责！每年我都会隐身一次，到处藏彩蛋让孩子们找。这是世代相传的家族责任。但我好像迷路了。我从来没去过这种地方，这里的食物让我热得要命。我简直想整天做爱和下蛋！][pg]");
         }
         else
         {
            outputText("她叹了口气，用手腕上像手镯一样的毛球擦了擦额头上的汗，试图解释道：[say: 我得把这些彩蛋都处理掉。我本来不该下这么多的，但我一次又一次地发情，结果下了这么多。最糟糕的是，每次我排出几个卵，下次我就更想做了。我简直想整天做爱和下蛋！][pg]");
         }
         outputText("她丢下篮子，捂住嘴，脸上泛起红晕：[say: 我刚才说做爱了吗！？咿！] 篮子不在手里，她的下体暴露无遗！一根巨大的14英寸肉棒在她的双腿间骄傲地弹跳着。它青筋暴起，顶端是一个狭窄的龟头，而下面的一对蛋形睾丸在阴囊里弹跳着。她跳了起来，试图再次掩盖它，但她唯一成功做到的就是不小心撸了它一下。一滴先列腺液喷到了她的手上，她不假思索地呻吟道：[say: 噢，该死，我需要交配。][pg]");
         outputText("转眼间，她就仰面躺下，开始自慰，并抬起睾丸，露出一条泡泡糖粉色的裂缝。你可以“帮”她解决这个问题，也可以离开。也许好好干一炮能让她清醒足够长的时间，让她想出如何离开这片土地，回到她来的地方？");
         dynStats(DynStat.Lust(5 + get_player().lib / 20));
         menu();
         addButtonDisabled(0,"Your Vagina","这个场景需要你拥有阴道。");
         addButtonDisabled(1,"她的小穴","这个场景需要你拥有尺寸合适的阴茎。");
         addButtonDisabled(2,"69","这个场景需要你有生殖器。");
         if(get_player().hasVagina())
         {
            addButton(0,"你的小穴",bunbunFucksYourVag).hint("让她的阴茎插进你的小穴？");
         }
         if(get_player().hasCockThatFits(40))
         {
            addButton(1,"她的小穴",bunbunGetsFucked).hint("操她的小穴？");
         }
         if(!get_player().isGenderless())
         {
            addButton(2,"69",bunbun69).hint("和她69？");
         }
         addButton(3,"你的屁股",bunbunFucksPCInAss).hint("让她的阴茎插进你的屁股？");
         setExitButton();
      }
      
      public function rapeBunBun() : void
      {
         var _loc1_:* = null as IMap;
         spriteSelect(SpriteDb.get_s_easter_bunneh());
         clearOutput();
         if(get_player().get_spe() < 60)
         {
            outputText("你猛地从[feet]上扑上前去，试图扑倒并压住这个可怜的女孩，但你刚一有动作，她就朝另一个方向跳开了！她跳得太快了，你根本不可能抓住她，几秒钟后，你就被彻底孤立了。好吧，也许不是彻底孤立——草丛里还躺着一个小彩蛋。那是兔子在匆忙逃跑时从篮子里掉出来的！");
            get_inventory().takeItem(get_consumables().NPNKEGG,get_camp().returnToCampUseOneHour);
         }
         else
         {
            _loc1_ = KFLAGS.flags;
            FlagDict_Impl_.arrayWriteInt(_loc1_,132,FlagDict_Impl_.arrayReadInt(_loc1_,132) + 1);
            outputText("你猛地从[feet]上扑上前去，试图扑倒并压住这个可怜的女孩，但你刚一有动作，她就用力向后跳起。她没料到你的速度，你在半空中把她扑倒了。你们俩重重地摔在地上，兔子被你紧紧地压在身下。你撞到她时，她的篮子和彩蛋飞了出去，现在高高的草丛里散落着几十个彩蛋。女孩扭动着身体，试图从你的抓握中挣脱出来，但你紧紧地抓住她，她哭喊道：[say: 你这个坏蛋！][pg]");
            outputText("你的肚子感觉又暖又湿，当你退后检查兔子时，水分的来源暴露了。这个女孩根本不是女孩！她有一根坚硬的14英寸肉棒，还有一对弹跳着、鸡蛋大小的睾丸，它们正非常努力地把兔子精液漏到你身上。你伸手到睾丸下面，谢天谢地，你发现了另一个湿润的来源。至少你没有完全弄错！你面对的是一个双性人，而且还是个发情的双性人。既然她的身体这么渴望靠近你，她为什么还要费心抵抗呢？[pg]");
            outputText("发情的双性兔子顺着你的目光看去，慢慢地咧开嘴笑了，露出一对可爱的龅牙，她问道：[say: 哦，你只是想做爱？你为什么不直接问呢？我还以为你要吃掉我！] 她自信的宣言丝毫掩饰不住她脸颊上鲜红的红晕，很明显，这种情况对她来说有点奇怪。");
            dynStats(DynStat.Lust(10),DynStat.Cor(3));
            menu();
            addButtonDisabled(0,"Your Vagina","这个场景需要你拥有阴道。");
            addButtonDisabled(1,"她的小穴","这个场景需要你拥有尺寸合适的阴茎。");
            addButtonDisabled(2,"69","这个场景需要你有生殖器。");
            if(get_player().hasVagina())
            {
               addButton(0,"你的小穴",bunbunFucksYourVag).hint("让她的阴茎插进你的小穴？");
            }
            if(get_player().hasCockThatFits(40))
            {
               addButton(1,"她的小穴",bunbunGetsFucked).hint("操她的小穴？");
            }
            if(!get_player().isGenderless())
            {
               addButton(2,"69",bunbun69).hint("和她69？");
            }
            addButton(3,"你的屁股",bunbunFucksPCInAss).hint("让她的阴茎插进你的屁股？");
            setExitButton();
         }
      }
      
      public function ovipositBunnyEaster() : void
      {
         clearOutput();
         outputText("你笑得有点过于热切，提议道：[say: 你知道吗，如果你真的很喜欢蛋，我知道有个地方能弄到一些……]");
         outputText("[pg][say: 哦？在哪儿？]她回应道，两只耷拉的耳朵一下子竖得笔直，兴奋得微微颤动。她蹦跳着来到你面前，没注意到自己湿漉漉的阴茎随着每一次跳跃沉沉晃动，在惯性的作用下，变成了一根荒唐夸张的十四英寸性爱钟摆。[say: 它们在你身后吗？]");
         outputText("[pg][say:这是个惊喜，]你保证道，[say:四肢着地趴好，我就把你想要的蛋全都给你。]");
         outputText("[pg]她眼中那困惑、近乎茫然的神情暴露了她的迟疑，但她还是照做了，被某种连她自己似乎都还没真正理解的需求驱使着。她蓬松的小尾巴尽力向上翘起，让你得以看见她那又大又出乎意料结实的臀部。平日里到处蹦跳显然把她的屁股锻炼得相当诱人，而这位兔女郎的大腿也同样紧实，只被一层淡淡的脂肪" + (get_noFur() ? "" : "和她那柔软如绒的毛发") + "稍稍遮掩。你能看见水液正从肿胀的粉色肉丘间不断淌出，其中不少沾在她光滑囊袋那柔和的椭圆曲线上。当她终于意识到自己摆出的这个姿势意味着什么时，她微微颤抖起来。");
         outputText("[pg]你没有给她机会后悔摆出这副撩人的姿势。相反，你抓住两大把" + (get_noFur() ? "兔女郎" : "毛茸茸的") + "屁股，一边揉捏一边爬到她身上；这并不是以雄性占有雌性的方式，而是以一只");
         if(get_player().canOvipositBee())
         {
            outputText("昆虫");
         }
         else
         {
            outputText("蜘蛛");
         }
         outputText("在占领一个孵化器。当她感觉到你的腹股沟压在她的后腰上时，这只毛茸茸的兔子变得有些担忧，她转过头看着你，大声说道，[say:你……你不能那样把卵产在我里面！]");
         outputText("[pg]你窃笑着拍了拍她两耳之间的位置，甚至俯下身去舔舐她肩膀上那完美无瑕的暗色肌肤，品尝着她刚渗出的汗珠那咸咸的味道。你充满暗示地低语道，[say:哦，我可是给你带了好多好多的卵呢……]");
         outputText("[pg]出于本能，你的产卵管瞬间从腹部的隐藏裂缝中滑出，在兔女郎紧致的屁股上喷洒出一片扇形的湿滑润滑液。这个奇异的器官直接挤过她柔软的臀沟，随着圆润的顶端滑过她小穴的褶皱，它愉悦地抽动着，将新鲜的润滑液涂抹在自身和她那准备就绪的火热阴唇上。它继续向前，顶在了兔女郎刚刚暴露出来的阴蒂上，这为你的产卵攻势形成了完美的支撑点。她在你身下喘息着，下意识地对这种感觉做出反应，扭动着她" + (get_noFur() ? "" : "毛茸茸的") + "臀部迎合你。她湿润的下体变得更加滚烫，你能感觉到一股湿润的液体从她的小穴中滴落，顺着你那异形的肉棒流下。");
         outputText("[pg]一想到有这么一个心甘情愿的伴侣，你兴奋地叽叽喳喳叫了起来，你稍微挪动了一下身体，调整着装满卵的腹部，试图对准这个大腿粗壮的女人的入口。她的扭动和挣扎让这变得不那么容易。你一次又一次地将粗大的工具拍在她的屁股上、阴囊上，或者她那" + (get_noFur() ? "" : "毛茸茸的") + "脸颊上。这些尝试让她更加兴奋，以至于她开始公开地呻吟和哭泣，[say: 哦哦哦，你要给我产卵对吧？嗯，对，给我产卵！求你了，给我产卵！我……我需要它们！]");
         outputText("[pg]要是她能安分下来，你早就把她填满了！这个麻烦的荡妇一只手撑着身体，另一只手正狂热又胡乱地撸动她那根比例夸张的肉棒；每撸一下，她的先列腺液就在整根肉棒上啧啧作响地抹开。她大得让你立刻想到一个让她闭嘴的简单办法……你按住她的后脑，把她不断涌出液体的龟头径直塞进她那张吵闹的小嘴里。她起初还挣扎了几下，但随着先列腺液在她唇间积聚，她的反抗也渐渐消散了。她流着口水，含混不清地呻吟着，臀部开始轻轻摇动，肩膀也放松下来。唾液拉成长长的丝线垂下，又在嘴角泛起泡沫；她开始给自己口交，双眼微微失焦，身体也松弛下来，仿佛中了某种药似的。");
         outputText("[pg]幸运的是，她一次向后挺动，正好把湿漉漉的丘壑压在你的肉茎上。你倒抽一口气，感觉它又从你的缝隙里顶出来一截。新伸出的这几英寸让你立刻与她那适于受孕的内里对接在一起，厚实的突起将你们相连；你的卵也滚入位置，有些已经开始沿着中空的管道往下移动，令你既松了口气又兴奋不已。你抓住她失去力气、放松下来的肩膀，转动身体逼迫自己插得更深，滑腻的润液已经从你体内流出，与兔女自己的湿润混在一起。她的兔躯仿佛天生就在等待受种；你能从她甬道的热度，以及它紧紧挤压你产卵管的方式中感受到这一点。你也纵情地叹息一声，放松了那些你甚至不知道存在的肌肉，将你的货物释放出来，流入这个呻吟着的伴侣体内。");
         outputText("[pg]你的产卵管起伏膨胀，为即将通过的东西腾出空间，尽管顶端仍然足够狭窄，让你能够轻松地将其刺入兔娘正在扩张的子宫颈。在你将其插入她的子宫之前，你实际上已经感觉到它开始张开，甚至现在还在继续扩张，让你每一次推进都能刺得更深。");
         outputText("[pg]兔女郎突然变换姿势，双臂一软，身体随之倾斜，两只手无力地摊在身侧。她的肉棒还勉强含在嘴里，但先列腺液涌出的速度似乎比刚才更快了。每当新一波液体灌进她嘴里，她的脸颊都会鼓起来；尽管她的喉咙不停吞咽，松开的唇舌封口也让失控的液流顺着她的肉棒漏出来，你还是能看出她这才刚刚开始。当然，她就这么彻底放松下来承受你的抽插，却依旧没停下用嘴套弄自己，也没停下用小穴摩挲你的肉棒。无论她的先列腺液对她造成了什么影响，性本能似乎基本没受影响……");
         outputText("[pg]你让思绪消散在占据你脑海的温柔而有节奏的繁殖快感中。伴随着肉管中迅速的收缩，你的许多卵子已经将你和兔女郎撑开。它们一同滑过你和她的身体，在你们两人的体内引发了一连串令人愉悦的神经冲动。当第一颗卵子穿过她张开的子宫颈时，你被带入了一种狂喜的极乐境界。每当你的肉棒释放出一颗圆球时，都能听到轻柔、沉闷的“啵”声。");
         if(get_player().eggs() < 20)
         {
            outputText("[pg]你的卵子一颗接一颗地完美排入这只兔女郎如今已被征服的子宫中。这并没有花太长时间，因为你并没有积攒那么多卵子，但你器官传来的快感太强烈了，让你无法就此抽出。你继续埋在她的体内，用你那昆虫般的性器缓慢地抽插着那湿滑的小穴，释放出大量的润滑液让你的卵子在其中游动。你发情的[hips]保持着缓慢的节奏，直到你耗尽了可以注入的液体。高潮一个接一个地模糊在一起，以至于你真正能记住的只有一片朦胧的快感和相互摩擦的身体。");
         }
         else if(get_player().eggs() < 40)
         {
            outputText("[pg]你的卵子一颗接一颗地涌入那被征服的子宫中，形成稳定的产卵流，每一颗都紧跟在上一颗之后。你和你的孵化器同时发出一声幸福的呜咽，她紧致的小穴实际上正试图榨取你的精液。当然，这只会让你的卵子更快地流入她的体内。她的子宫很快就被你的");
            if(!get_player().canOvipositBee())
            {
               outputText("蜘蛛");
            }
            else
            {
               outputText("昆虫");
            }
            outputText("的存货，但你还没有排空，所以你强行将越来越多的卵塞进她体内。她非常有弹性，所以这很容易做到，没过多久她就有了一个圆润的、像怀孕一样的肚子（即使它有点凹凸不平）。你颤抖着，在你的留存物上喷出几股长长浓稠的润滑液，然后瘫软下来，精疲力尽。");
         }
         else
         {
            outputText("[pg]一个接一个，你的卵被强行塞进这只兔女被征服的子宫里。你的卵太多了，这些圆球就像无尽的潮水，感觉就像同样无尽的高潮，一股持续不断的性释放直接涌入你那瘫软伴侣的孵化器最深处。她几乎立刻就被填满了，但你只是继续把一个又一个的卵强塞进她体内。起初，这只是让她的肚子微微变圆。你只是继续不停地塞着");
            if(get_silly())
            {
               outputText("就像不知疲倦的劲量兔一样");
            }
            else
            {
               outputText("就像某种无休止的、致人怀孕的淫兽一样");
            }
            outputText("，迫使你那顺从猎物的子宫扩张到新的极限，如此巨大饱满，以至于都压在了地上。在那个怀孕般的圆顶上，可以看到圆润的、像鹅卵石一样的凸起，每一个都是你的存货。当你把最后一颗卵推入她体内，并开始将最后的润滑液排入她体内时，你呻吟着，从巨大的快感中平息下来，回味着最后的愉悦。");
         }
         outputText("[pg]你爬了下来，产卵管缩回了槽中。这种空虚感对于一直承受着未产卵的沉重负担的你来说，是一种幸福的改变。当你回过神来时，你意识到兔女郎还在高潮。她的阴茎终于从嘴里弹了出来，你看到她用浓稠透明的淫液颜射自己。一个巨大的凸起撑开了她的尿道，被迫穿过她的肉棒，喷射出一颗亮粉色的蛋。蛋弹在她那被药物麻醉、呆滞的脸颊上，她那失去知觉的嘴唇试图呻吟，紧接着第二颗蛋也喷了出来。在这两个惊喜之后，一股精液溅在她的头上，把她的耳朵贴在了头发上。");
         outputText("[pg]之后，这只野兔瘫软下来，眼睛闭上，舌头无意识地舔着脸上喷射出的精液。看来她得到的蛋比她想象的要多。");
         get_player().dumpEggs();
         get_player().orgasm("Ovi");
         dynStats(DynStat.Sens(-2));
         doNext(get_camp().returnToCampUseOneHour);
      }
      
      public function layEggsInBunbuns() : void
      {
         clearOutput();
         outputText("面前这只展露身姿的兔子让你兴奋不已，但你想要的不仅仅是在草地上寻欢作乐。你的");
         if(get_player().eggs() < 20)
         {
            outputText("急不可耐的产卵管滑了出来，准备向这只兔子展示你也能玩产卵游戏。");
         }
         else if(get_player().eggs() < 40)
         {
            outputText("肿胀的虫子部位因期待而颤抖，产卵管推挤着进入视线，顶端还挂着一滴蜜色的先列腺液。");
         }
         else
         {
            outputText("低垂的蜜蜂腹部从隆起处沿着甲壳滴下蜂蜜般的汁液，那里粗壮的黑色器官正彰显着它想要为你释放重负的渴望。");
         }
         outputText("兔子注意到它时喘息了一声，这个双性人的臀部不安分地扭动着。[say:天哪，能……你能用那个上我吗？我太需要被注卵了。]不需要她再多催促，你将身下的蜜蜂下半身向上拱起，同时将发情的兔子抱起紧贴着你。");
         outputText("[pg]你将她拉向自己，让她把乳房贴在你的[chest]上，跳动的产卵管在她的双腿间摩擦。伴随着一声尖叫，她更加用力地向前推，那根长长的兔巴随着她的心跳抽动着");
         if(get_player().get_gender() == 0)
         {
            outputText("抵着你胯间空荡荡的位置。");
         }
         else
         {
            if(get_player().hasCock())
            {
               outputText("贴在[eachCock]旁边");
            }
            if(get_player().hasVagina())
            {
               outputText("，她那对沉甸甸的椭圆形睾丸也摩擦着夹在你大腿间的[vagina]");
            }
            outputText("。");
         }
         outputText("她双臂环抱住你的肩膀支撑着自己，当你将肿胀的产卵管猛插进她紧致的屁股时，她几乎要跳到你身上。");
         outputText("[pg]你浑身一颤，适应着她的姿势，开始向上挺动，把那根肉质长物更深地塞进兔尾下温暖的通道里。她扭动着臀部，任由产卵管又往里推进半截；产卵管一阵脉动，随后将一些蜂类分泌液注入这个愉悦的伴侣体内。她的体内准备妥当后，你的器官和腹部一同绷紧，将产卵管一路顶到根部。");
         outputText("[pg]沿着敏感肉茎推进的力道让你产生了假性高潮般的感觉，愉悦而缓慢地将一枚卵推下那条肉管。她放松了一会儿，舌头可爱地垂在外面；就在第一枚卵状物抵上她紧缩的入口时，她的大阴茎也把先列腺液喷到了你的腹部和[chest]上。第一枚卵刚穿过入口、开始在她体内植入，另一枚卵便从你的储囊中滑出，追随着它一同进入她的身体。");
         outputText("[pg]她继续在你身上扭动，顺着蜜蜂腹部上下起伏，让那些卵更快地进入体内。当你感觉第一颗卵抵达通道尽头时，你发现自己正体验到一股狂喜的能量");
         if(get_player().get_gender() > 0)
         {
            outputText("，");
            if(get_player().hasCock())
            {
               outputText("[eachCock]");
            }
            if(get_player().get_gender() == 3)
            {
               outputText("，并");
            }
            if(get_player().hasVagina())
            {
               outputText("你的[vagina]");
            }
            outputText("让兔女郎浑身沾满");
            if(get_player().hasCock())
            {
               outputText("精液");
            }
            if(get_player().get_gender() == 3)
            {
               outputText("，并");
            }
            if(get_player().hasVagina())
            {
               outputText("潮吹");
            }
         }
         outputText("。把一颗又一颗卵塞进温暖的穴里，不仅让人满足（对参与其中的<i>双方</i>都是），而且还该死地有趣，这点兔女也很赞同！");
         outputText("[pg]又一枚卵，接着又是一枚、再一枚，顺着你的产卵肉棒泵入她体内，其间夹杂着大量蜜状黏液，把她的肚子越撑越大。你已经数不清有多少枚滑进了她身体，整个人完全沉浸在高潮般的快感之中。过程中你的双腿不知何时早已发软，时间也过去了一个小时，但只要还能再产下一枚卵，这些对你来说都无所谓。");
         outputText("[pg]你的身前沾满了兔娘的精液，顺着你的双腿滴落到你蜂娘腹部黄黑相间的几丁质上。");
         if(get_player().get_gender() > 0)
         {
            outputText("你又给这片狼藉添了一笔，");
            if(get_player().hasCock())
            {
               outputText("从[eachCock]喷出又长又浓的一股，射在兔女郎柔软的奶子上");
            }
            if(get_player().get_gender() == 3)
            {
               outputText("，并");
            }
            if(get_player().hasVagina())
            {
               outputText("把你的淫液溅到她的睾丸上");
            }
            outputText("。");
         }
         outputText("[pg]最后，你发现自己再也没有什么能给这个迷恋蛋的兔女了，产卵管也缩回了裂缝里。她疲惫却又幸福地蜷起身子睡去，而你留下她独自应付那塞满蛋和蜂蜜的肚子，返回营地，直到你再次需要一个温暖的身体来当宿主。");
         get_player().dumpEggs();
         get_player().orgasm("Ovi");
         doNext(get_camp().returnToCampUseOneHour);
      }
      
      public function getEggflated() : void
      {
         clearOutput();
         outputText("觉得把她这样丢下太残忍了，你决定让这个兔女郎放松一下。然而，你还没傻到直接给她松绑——如果她眼中那饥渴的眼神算是一种警告的话。你走到扭动着的兔女郎面前，仔细地打量着她。女孩的身体上覆盖着一层");
         if(!isEaster())
         {
            outputText("闪亮的汗水");
         }
         else
         {
            outputText("闪烁的微光");
         }
         outputText("，她急切的欲望在她每一寸");
         if(!isEaster())
         {
            outputText("布满雀斑的棕色");
         }
         else
         {
            outputText("布丁般丰润的");
         }
         outputText("肌肤上跳动。她的腹部微微隆起，像个小圆肚子，你猜测这肯定是之前那些好心人留下的精种。由于她无法高潮，她的小穴一定夹得太紧了，以至于只有一细流精液能够流出。她的");
         if(isEaster())
         {
            outputText("兔子的");
         }
         outputText("肉棒随着每一次急促的呼吸在空中抽动，");
         if(!isEaster())
         {
            outputText("冒泡的珍珠般");
         }
         else
         {
            outputText("黏稠的棉花糖般");
         }
         outputText("的先列腺液从狭窄的、长矛般的龟头滴落。凑近看，这个淫荡女孩的蛋蛋更加淫靡，巨大的球体里淫猥地塞满了");
         if(!isEaster())
         {
            outputText("她那不受欢迎的、畸形的交配所结出的肉欲之果");
         }
         else
         {
            outputText("丰富的糖果，她那甜腻的零食在温暖的蜜汁精海中游荡");
         }
         outputText("。她用突出的两颗门牙咬住下唇，眼睛紧紧地盯着你的动作，抱着最好的希望，却也做好了最坏的打算。");
         outputText("[pg]你在她面前站定，将注意力转向那");
         if(!isEaster())
         {
            outputText("抽搐的长度");
         }
         else
         {
            outputText("多汁的美味");
         }
         outputText("。让她的卵排入你体内的想法在你的脑海中闪过。你必须承认，这是一种疯狂的冲动，但你有点想看看她能做到什么地步。脱下你的[armor]并把它放在足够远的地方以避免潜在的飞溅，你小心翼翼地把手指放在那青铜");
         if(!isEaster())
         {
            outputText("环");
         }
         else
         {
            outputText("环");
         }
         outputText("上，它套在她那圆锥形的肉棒上。充血的肉棒因压抑的需求而肿胀，你几乎可以发誓，当你的指尖按在她的束缚上时，它变得更大了。缓慢、小心地，你开始取下阴茎环。幸运的是，她那源源不断的");
         if(!isEaster())
         {
            outputText("先列腺液");
         }
         else
         {
            outputText("乳白色的浊液");
         }
         outputText("已经充分润滑了她的肉棒，让这个环的移除变得相对简单。向上，向上，再向上滑动，越过暴突的青筋，越过她龟头膨大的冠状沟，直到最后，你将这个束缚环从她饱受折磨的肉棒上剥离下来。她条件反射般地对着空气挺动腰肢，伴随着微弱的呜咽声，试图寻找任何摩擦。你深吸一口气，平复自己加速的心跳，并做好准备。");
         outputText("[pg]你走上前，紧紧贴住这个女孩，她挺拔的B罩杯乳房挤压着你的[chest]，直到你能感觉到她胸膛里剧烈跳动的脉搏。当你用[hips]在她身上摩擦，引导她跳动的肉棒靠近你的[pussy]时，她张开嘴发出放荡的呻吟。在她自己分泌的");
         if(!isEaster())
         {
            outputText("泡沫般的汁液");
         }
         else
         {
            outputText("滑腻的蜂蜜");
         }
         outputText("，她那长矛般的头部轻易地滑过你的阴唇，狂热的肉体填满了你颤抖的腔道。女孩的");
         if(!isEaster())
         {
            outputText("粗壮肉棒");
         }
         else
         {
            outputText("甜美肉棒");
         }
         outputText("在你的肠道里激起一阵阵冷热交替的涟漪，她那奇特、几乎令人麻木的精液在你体内翻腾。下一刻，尽管她的");
         if(!isEaster())
         {
            outputText("肿胀的肉棒");
         }
         else
         {
            outputText("鼓胀的肉棒");
         }
         outputText("。你将她向后推，你们俩靠在她");
         if(!isEaster())
         {
            outputText("柔软的");
         }
         else
         {
            outputText("棉花糖般的");
         }
         outputText("睾丸，当你跨坐在无助的兔娘身上时，它们柔软、顺从的表面包裹着她。测试了一下她阴囊的张力，你发现装满卵的囊袋足够坚固，可以支撑你们两人的重量，而不会给女孩带来任何痛苦。你兴高采烈地用双臂环住她的腰，向前推，向上翻滚，直到你们俩像球形一样停在巨大的睾丸上，");
         if(!isEaster())
         {
            outputText("垫得很好的床上用品");
         }
         else
         {
            outputText("为巨人烤制的海绵蛋糕");
         }
         outputText("。");
         get_player().cuntChange(28,true,true,false);
         outputText("[pg]在你的栖息处，被十四英寸长的焦糖色肉体绑在兔女郎身上，你花了一点时间在女孩身上前后摇晃。仅仅是被骑上去就已经耗尽了她所有的克制力，但你可以看出，她的决心崩溃只是几秒钟的事。你的位置非常完美，可以承受她全部的喷泉");
         if(!isEaster())
         {
            outputText("汩汩涌出的精液");
         }
         else
         {
            outputText("甜腻的精液");
         }
         outputText("，你意识到现在只剩下一件事可做了。你将一只手滑入她的腰部和你们两人平衡其上的柔软肉体之间，手指摸索着她那");
         if(!isEaster())
         {
            outputText("颤动的毛丛");
         }
         else
         {
            outputText("棉花糖般的绒球");
         }
         outputText("毛茸茸的尾巴。你找到了尾巴与脊椎底部的交界处，用指关节用力按压这个敏感点，让这只不堪重负的兔女郎发出一声极乐的尖叫。当她的");
         if(!isEaster())
         {
            outputText("肿胀的肉棒");
         }
         else
         {
            outputText("糖果肉棒");
         }
         outputText("在即将排出的卵的重量下变形时，一股强烈的压力涌入你的小穴。当第一个椭圆形的凸起顺着她的肉棒向上移动时，你更深地研磨和撞击她，直到她那");
         if(!isEaster())
         {
            outputText("冒着精液泡泡的");
         }
         else
         {
            outputText("如果冻般冒泡的");
         }
         outputText("肉冠火热地抵住你的子宫颈。她那如鸦片般令人沉醉的精液喷涌而出，浸透了你的内壁，赋予它们一种柔软的弹性。随着卵子接近她的顶端，你用力向下坐在这个高潮女孩的凸起上，感觉她膨胀的顶端穿透了你的子宫。伴随着一声如痴如醉的绝妙呻吟，你看着自己的腹部隆起，卵子滑落而出，紧接着喷射出");
         if(!isEaster())
         {
            outputText("令人酥麻的激情液体");
         }
         else
         {
            outputText("令人发胖的奶油馅料");
         }
         outputText("。又一颗卵子涌了上来，紧接着又是一颗，随着你在活泼的兔女身上快速而短促地起伏，速度越来越快，你的[clit]摩擦着她那因精液而胀大的肚子。");
         outputText("[pg]一颗接一颗的卵填满了你的子宫，让你的小腹因这沉重的");
         if(!isEaster())
         {
            outputText("负担");
         }
         else
         {
            outputText("款待");
         }
         outputText("而高高隆起。你喘着粗气，随着体内的重物不断积聚，你发现自己越来越难以呼吸，舌头无力地耷拉着，口水顺着嘴角流下。");
         if(get_player().hasCock())
         {
            outputText("几乎是在不知不觉中，[eachCock]在混乱的高潮中痉挛，将一串串精液喷洒在兔娘黄褐色的皮肤上，就像一层粘稠的釉料。");
         }
         outputText("你的视线开始模糊，当你眨眼试图驱散眩晕感时，你发现你的肚子已经膨胀到了");
         if(!isEaster())
         {
            outputText("快要临盆一样");
         }
         else
         {
            outputText("暴饮暴食过度一样");
         }
         outputText("。虽然她那充当缓冲的肉球已经将一部分存货射进了你的体内，但它们依然大到足以支撑你们俩。于是你带着些许遗憾，开始从兔女郎的肉棒上滑落，卵子填补了她那膨胀的肉棒留下的空隙。你停顿了一下，让龟头停留在你泛红的下唇边缘，然后在神志不清的兔女郎身上转过身，将她的龟头拔出，一股");
         if(!isEaster())
         {
            outputText("精液");
         }
         else
         {
            outputText("白浊");
         }
         outputText("从你刚被填满的小穴中漏出。在手的引导下，你将她那汹涌喷发的肉棒对准你的[ass]，然后将你那整个");
         if(!isEaster())
         {
            outputText("装满卵的");
         }
         else
         {
            outputText("被糖果喂胖的");
         }
         outputText("沉重身躯压在那根圆锥形的肉棒上。有了新的空间可以填满，卵再次流入你的体内，一颗推着一颗，排着队挤进你的大肠。");
         if(get_player().hasCock())
         {
            outputText("圆球挤过前列腺的稳定动作，让你的[cocks]再次爆发出一阵更加泥泞的高潮，精液在空中划出弧线，如珍珠般洒落到你们两人身上。");
         }
         outputText("[pg]时间仿佛在指缝间流逝，你的意识开始变得模糊不清，因为一股如小洪水般的");
         if(!isEaster())
         {
            outputText("兔精");
         }
         else
         {
            outputText("棉花糖与巧克力");
         }
         outputText("填满了你的肚子，就像你那抽搐、紧缩的子宫一样充实。当兔女郎的高潮结束时，你几乎能尝到喉咙深处泛起的甜味。你的身体膨胀得远超想象，卵和精液从你那沉甸甸的腹部溢出。兔女郎已经忘乎所以，沉浸在私人的极乐中神志不清，她那篮球大小的睾丸慢慢地将最后几颗卵从暗色的肉茎中挤出，伴随着啪嗒啪嗒的溅射声。你就算想动也动弹不得，只能瘫在地上，享受着这种彻底的、无法动弹的丰饶感。渐渐地，你肚子和子宫里的卵开始融化，失去了原本的硬度，化作一股新鲜而原始的暖流，从你过度劳累的身体中榨出了最后一次高潮。");
         outputText("[pg]");
         if(get_player().hasCock())
         {
            outputText("你筋疲力尽的[cocks]不知怎么地又找回了力量，喷涌出属于" + (int(get_player().cocks.length) > 1 ? "它们" : "它") + "自己的高潮，一缕缕精液洒满你的全身，白热的精液为你汗水浸透的[chest]带来了一层新的光泽。");
         }
         outputText("最终，足够多的卵融化了，让你能够靠自己的力量站起来。你抓起你的[armor]，但在你有机会缩小到更正常的体型之前，先不穿上它。在你离开之前，你确保解开了她手腕上的绳子，以便她从高潮的冲击中恢复理智时能自由活动。");
         if(get_player().bunnyScore() < 4)
         {
            get_player().knockUp(9,808);
         }
         else
         {
            get_player().knockUp(9,200,60);
            var _temp_1:* = get_player();
            _temp_1.fertility = _temp_1.fertility + 1;
         }
         outputText(get_player().modThickness(100,3));
         outputText(get_player().modTone(0,3));
         get_player().orgasm("Vaginal");
         dynStats(DynStat.Lib(1),DynStat.Sens(-3));
         doNext(get_camp().returnToCampUseEightHours);
      }
      
      public function fuckTheEggBoundBun() : void
      {
         clearOutput();
         outputText("你很少能遇到包装得如此精美的礼物；如果你就这样拒绝了，那你该是个多么忘恩负义的人啊？你走到扭动的兔子面前，仔细打量着她。女孩的身体上覆盖着一层");
         if(!isEaster())
         {
            outputText("闪亮的汗水");
         }
         else
         {
            outputText("闪烁的微光");
         }
         outputText("，她急切的欲望在她每一寸");
         if(!isEaster())
         {
            outputText("布满雀斑的棕色");
         }
         else
         {
            outputText("布丁般丰润的");
         }
         outputText("肌肤上跳动。她的小腹微微隆起，你猜测那一定是之前的好心人留下的种子。由于她无法达到高潮，她的小穴一定夹得紧紧的，只有一丝精液能流出来。她那兔形的阴茎随着她每一次急促的呼吸在空中抽动，");
         if(!isEaster())
         {
            outputText("冒泡的珍珠般");
         }
         else
         {
            outputText("黏稠的棉花糖般");
         }
         outputText("的先列腺液从狭窄的、长矛般的龟头滴落。凑近看，这个淫荡女孩的蛋蛋更加淫靡，巨大的球体里淫猥地塞满了");
         if(!isEaster())
         {
            outputText("她那不受欢迎的、畸形的交配所结出的肉欲之果");
         }
         else
         {
            outputText("丰富的糖果，她那甜腻的零食在温暖的蜜汁精海中游荡");
         }
         outputText("。她用突出的两颗门牙咬住下唇，眼睛紧紧地盯着你的动作，抱着最好的希望，却也做好了最坏的打算。");
         outputText("[pg]你稳稳地站在这位");
         if(!isEaster())
         {
            outputText("暗色皮肤的");
         }
         else
         {
            outputText("焦糖色皮肤的");
         }
         outputText("兔女郎面前，脸上带着轻松的微笑。你稍微松开你的[armor]，刚好让挺立的阴茎");
         if(get_player().cockTotal() > 1)
         {
            outputText("");
         }
         outputText("释放出来，你将双手轻轻放在她丰满的臀部上，指尖顺着她纤细的腰肢向上滑动，抚摸着她紧绷双臂上光滑的肌肤。她因你的触碰而颤抖，但她体内沸腾的欲望在下一秒就将这恐惧的战栗化作了高潮的颤抖。在这种状态下，仅仅是你手指的触碰就足以让她兴奋不已，被束缚的兔女郎的肉棒徒劳地抽搐着，粗大的青铜屌环挡住了她那无力高潮的汹涌洪流。你将双手环绕在她的背上，引导它们向下，抚摸着那");
         if(!isEaster())
         {
            outputText("柔软的臀瓣");
         }
         else
         {
            outputText("紧绷的面团");
         }
         outputText("上，然后滑过这名焦躁不安的女孩健壮的双腿。你一只手勾住她的膝盖，抬起她的一条腿，将她原地旋转，把她的脸按进她自己那巨大的、胀满卵的阴囊里。她发出一声微弱的[say: 咿！]，她那无穷的精力又引发了一阵徒劳的挣扎，试图摆脱束缚。");
         outputText("[pg][say: 求求你，]她哀求道，[say: 别再下蛋了！]尽管她尖叫着抗议，但女孩那泛滥的欲望让她的声音变得沙哑而放荡。她双腿交替着摇晃，扭动着毛茸茸的尾巴，突出的臀部在你的胯部上下摩擦，繁殖的肉欲让她只剩下一丝理智，淫荡堕落的狂热刺激着她的每一根神经。她紧绷着身体，甚至没有注意到你抓住了她的臀瓣，将手指深深陷入那");
         if(!isEaster())
         {
            outputText("柔软的血肉中");
         }
         else
         {
            outputText("半海绵状的肉饼");
         }
         outputText("。轻轻的试探告诉你，她体内肿胀器官的张力让她的屁股夹得死死的，根本没有任何插入的希望。她的小穴也同样紧致，但之前那些追求者留下的滴落精液，加上她自己闪闪发光的蜜汁，应该能提供你所需的所有润滑。无数追求者留下的黏滑精液温暖着你那跳动的[cock]，而你");
         if(get_player().cor < 33)
         {
            outputText("对包裹着你肉体的下流黏液感到厌恶而皱起眉头");
         }
         else if(get_player().cor < 66)
         {
            outputText("当淫荡的精液在你的肉棒周围发出黏糊糊的吧唧声时，咽了一口唾沫");
         }
         else
         {
            outputText("沉浸在野兽般的浓浆涂抹你肉棒的亵渎刺激中，享受着那不洁的液体雄风");
         }
         outputText("。");
         outputText("[pg]伴随着一声闷哼，你强行挺进她的体内，跳动的肉棒如长矛般刺开她饱受蹂躏的阴唇。兔女郎喘息着，她的理智在深不可测的强烈欲望汪洋中窒息。她疯狂地迎合着你，拼命想尽可能快、尽可能深地没根吞下你的[cock]。她的肚子鼓了起来，被你的粗壮挤压，一股股精液从她被塞满的小穴里飞溅出来。在被操了这么多次之后，她竟然还这么精力充沛，真是令人惊讶，你一边愉快地想着，一边抓住她纤细的腰肢，让她配合你的节奏。没过多久，你就让她在狂喜中剧烈挣扎，一连串令人扭动却未完全释放的高潮让她的身体如火烧般滚烫，她的内壁几乎在你周围震颤，而精液如河流般顺着她的腿流下，将她");
         if(!isEaster())
         {
            outputText("布满深色雀斑的大腿染成象牙白");
         }
         else
         {
            outputText("诱人的巧克力色大腿涂满苍白的奶油");
         }
         outputText("。到达你自己的临界点时，你向前倾身，将脸颊贴在她的脸颊上，吸气声在你的齿间嘶嘶作响。她本能地明白了，用尽她能使出的所有力气，将她的屁股狠狠地撞向你的[hips]。");
         outputText("[pg]你高潮了，[oneCock]在这个狂热女人的子宫内爆发，喷出大股浓稠的精液");
         if(!isEaster())
         {
            outputText("，新鲜的精液淹没了她那已经灌满精液的小穴");
         }
         else
         {
            outputText("，用你丝滑的精液给她那充满白浊的中心又镀上了一层");
         }
         outputText("。随着她的肚子在你的灌注下膨胀，她无助地挺动着身体，");
         if(get_player().cumQ() < 250)
         {
            outputText("连绵不断的精液从她的小穴中渗出");
         }
         else if(get_player().cumQ() < 1000)
         {
            outputText("鼓胀得连肚脐都凸了出来，从她小穴里渗出的精液在你们俩之间喷涌而出");
         }
         else
         {
            outputText("变得越来越大，浓稠的精液从她饱和的小穴中飞溅而出。你那似乎无穷无尽、如洪水般的精液冲刷掉了她前任伴侣们留下的痕迹，将这个焦糖色肌肤的女人浸泡在你那液体所有权的丰富汁液中。");
         }
         outputText("你的精液刚在她体内扎根，兔娘那本就巨大的睾丸就再次颤抖起来。在你的注视下，它们像气球一样膨胀得更大，因你的占有而变得更加肥大。你在她体内多停留了片刻，惊叹于她那塞满卵的身体不可思议的体积，然后才拔出并后退清理自己。当她无力地将肉棒在被堵住的巨大睾丸上摩擦时，球状的精液水滴从她的阴户中冒出。你心满意足地回到营地，将兔娘留给下一个救援者发落。");
         get_player().orgasm("Generic");
         dynStats(DynStat.Cor(2));
         doNext(get_camp().returnToCampUseOneHour);
      }
      
      public function freeHerOhGodWhyDidYouDoThis() : void
      {
         clearOutput();
         outputText("你决定碰碰运气，走到扭动着的兔女郎面前，检查她的束缚。女孩的身体上覆盖着一层");
         if(!isEaster())
         {
            outputText("闪亮的汗水");
         }
         else
         {
            outputText("闪烁的微光");
         }
         outputText("，她急切的欲望在她每一寸");
         if(!isEaster())
         {
            outputText("布满雀斑的棕色");
         }
         else
         {
            outputText("布丁般丰润的");
         }
         outputText("皮肤。她的腹部微微隆起，挺着个小肚子，你猜那一定是之前那些好心人留下的种子。由于她无法达到高潮，她的小穴一定夹得紧紧的，只有一丝精液能流出来。她的");
         if(isEaster())
         {
            outputText("兔子的");
         }
         outputText("肉棒随着每一次急促的呼吸在空中抽动，");
         if(!isEaster())
         {
            outputText("冒泡的珍珠般");
         }
         else
         {
            outputText("黏稠的棉花糖般");
         }
         outputText("的先列腺液从狭窄的、长矛般的龟头滴落。凑近看，这个淫荡女孩的蛋蛋更加淫靡，巨大的球体里淫猥地塞满了");
         if(!isEaster())
         {
            outputText("她那不受欢迎的、畸形的交配所结出的肉欲之果");
         }
         else
         {
            outputText("丰富的糖果，她那甜腻的零食在温暖的蜜汁精海中游荡");
         }
         outputText("。她用突出的两颗门牙咬住下唇，眼睛紧紧地盯着你的动作，抱着最好的希望，却也做好了最坏的打算。");
         outputText("[pg]你轻轻地让她弯下腰，检查她手腕上的绳子。它们似乎是用一个简单的活结绑着的，她越是挣扎，绳子就会勒得越紧。女孩毛茸茸的尾巴在她柔软的臀部上方急切地抽动着，她用大大的兔子脚趾上下蹦跳。你用力拉了几下，成功解开了绳索，松开了她的双臂。你几乎以为这个兔女郎会扑向你，但她已经被释放的渴望所淹没，几乎忘记了她的救星。这只精力充沛的兔子气喘吁吁地抓住那圈束缚她的金属环，伴随着愉悦的呻吟将它从肉棒上滚落下来，然后得意洋洋地把它扔进了高高的草丛中。");
         outputText("[pg]甚至在屌环落地之前，她就已经跪倒在地，双手狂热地套弄着她的肉棒，诱导她那压抑已久的精囊得到甜蜜的释放。你旁边那巨大的睾丸在共鸣的狂热中翻滚和咕噜作响，因她激情的强度而颤抖。她的肉棒根部形成了一个厚厚的肉球，柔软的肉体膨胀到正常周长的两倍。缓慢而痛苦地，这个突起被挤压上她十四英寸长的肉棒，她的龟头顶端像张开的嘴巴一样扩张。然后，伴随着一声响亮的、喷涌而出的“啵”声，第一枚卵从她的繁殖柱中喷射而出，在巨大的喷泉顶端射向空中，喷涌出");
         if(!isEaster())
         {
            outputText("飞溅的精液");
         }
         else
         {
            outputText("高潮的白浊");
         }
         outputText("。喷洒的液体持续不断地涌出，形成一道白色的河流，在跳动的浪潮中划出弧线并喷涌而出，将她前方十英尺内的所有东西都染成了白色。无数的");
         if(!isEaster())
         {
            outputText("亮粉色的卵");
         }
         else
         {
            outputText("糖衣甜点");
         }
         outputText("在");
         if(!isEaster())
         {
            outputText("精液");
         }
         else
         {
            outputText("喷射而出");
         }
         outputText("像间歇泉一样喷涌而出，湿漉漉地散落各处。有些停留在显眼的地方，有些则滚入隐蔽的凹陷处，留给某个好奇的寻宝者。");
         outputText("[pg]兔女郎在无拘无束的释放中喘息尖叫着，一只手继续抽插着她那如泉涌般的肉棒，另一只手抚摸着她起伏、闪闪发光的乳房，捏着她");
         if(!isEaster())
         {
            outputText("坚挺的");
         }
         else
         {
            outputText("橡皮糖般的");
         }
         outputText("乳头，她那巨大柔软的脚趾在身下的泥土中刨出深深的沟壑。高潮的阵痛让极乐的痉挛传遍全身，紧绷的内部肌肉终于放松下来，将子宫内的精液释放出来，浑浊的液滴顺着她颤抖的大腿内侧流下。");
         outputText("[pg]随着她那巨大的睾丸肉眼可见地缩小，最初疯狂的射精节奏也逐渐平息。她靠在摇晃的“工厂”上，趴在上面，就像它们是沉重的水枕一样。她还需要一段时间才能完全排空自己，但就目前而言，她似乎很满足。你调皮地揉了揉她毛茸茸的尾巴，然后转身返回营地，顺便弯腰从地上捡起这女孩的一枚蛋。[pg]");
         dynStats(DynStat.Lust(25));
         get_inventory().takeItem(get_consumables().NPNKEGG,get_camp().returnToCampUseOneHour);
      }
      
      public function bunnbunbunMeet() : void
      {
         clearOutput();
         spriteSelect(SpriteDb.get_s_easter_bunneh());
         if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,132) == 0)
         {
            outputText("一个");
            if(get_player().get_tallness() > 64)
            {
               outputText("矮小的");
            }
            outputText("兔女郎从灌木丛后出现，蹦蹦跳跳的，在" + (get_noFur() ? "光滑、肌肉发达的" : "肌肉发达、长满毛的") + "大腿前紧紧抓着一个装满五颜六色蛋的篮子。她跳了几下，仔细地盯着地面，好像在寻找什么。她缓慢而从容的跳跃停了下来，因为她抬起头发现了你。兔女郎的眼睛睁得像餐盘一样大，似乎对有人看到她感到无比惊讶。她完全僵住了，一动不动地看着你，这让你有机会好好打量她一番。[pg]");
            outputText("从兔女郎的" + (get_noFur() ? "膝盖" : "臀部") + "上方开始，她的毛发消失在暗淡的橄榄色皮肤中，除了两团像手镯一样环绕在她手腕上的毛发，以及她屁股上方一条大而蓬松的白色尾巴。它几乎不停地抽动着，是这个女孩身上唯一在动的部分。她的乳房很小——大概是B罩杯——呈梨形。紧致、鲜艳的粉红色乳头栖息在每个小乳房肉质的隆起上，因为兴奋或寒冷而变硬。除了一个亮粉色的鼻子和从脸颊雀斑上长出的几根胡须外，她的脸和人类一样。这个奇怪女人的腹股沟隐藏在篮子后面，");
            if(get_player().lib > 50)
            {
               outputText("你发现自己想知道她在后面藏了什么宝贝。");
            }
            else if(get_player().cor < 40)
            {
               outputText("你发现自己很庆幸她的端庄。");
            }
            else
            {
               outputText("你发现自己考虑撕开篮子，看看她在下面藏了什么。");
            }
            outputText("[pg]");
            outputText("尽管将近一分钟过去了，兔女郎[i:仍然]僵在那里盯着看。自从意识到你在看她后，她什么也没做。好吧，看来现在轮到你行动了。你打算怎么做？");
            menu();
            addButton(0,"交谈",talkToBunnyBunBun);
            addButton(1,"强暴她",rapeBunBun);
            setExitButton();
         }
         else
         {
            if(Utils.rand(6) == 0 || isEaster() && Utils.rand(3) == 0)
            {
               adjathaEggsplosions();
               return;
            }
            outputText("在平原上探索时，你发现一丛特别高的草丛后面，有一双熟悉的兔女郎耳朵在上下晃动。你从草丛上方看过去，发现那个皮肤黝黑的兔女郎正在自慰。她那双娇小灵巧的手紧紧地握住她那根湿漉漉、滴着水的14英寸长的肉棒，双脚敲打着地面，对着紧握的双拳抽插着。[pg]");
            outputText("你向前倾身想看个清楚，在改变姿势时，你的[foot]踢落了一块小石头。兔女郎惊慌失措地跳了起来，直到她惊恐的虹膜锁定在你的[face]上。她的惊慌变成了尴尬，一瞬间，她晒黑的皮肤每一寸都变红了。她问道：[say: 嗯，既然我还在发情期，我们能不能交配或者做点什么？也许只是稍微做一下？][pg]");
            outputText("她双手捂住嘴，任由肿胀的肉棒摇摇欲坠地弹跳着，等待着你的回答。[pg]");
            outputText("如果你要和她做爱，你会使用她的哪个身体部位？");
            dynStats(DynStat.Lust(5 + get_player().lib / 20));
            menu();
            addButtonDisabled(0,"Your Vagina","这个场景需要你拥有阴道。");
            addButtonDisabled(1,"她的小穴","这个场景需要你拥有尺寸合适的阴茎。");
            addButtonDisabled(2,"69","这个场景需要你有生殖器。");
            addButtonDisabled(3,"产卵","这个场景需要你有一个产卵管和足够的卵。","产卵");
            if(get_player().hasVagina())
            {
               addButton(0,"你的小穴",bunbunFucksYourVag).hint("让她的阴茎插进你的小穴？");
            }
            if(get_player().hasCockThatFits(40))
            {
               addButton(1,"她的小穴",bunbunGetsFucked).hint("操她的小穴？");
            }
            if(!get_player().isGenderless())
            {
               addButton(2,"69",bunbun69).hint("和她69？");
            }
            if(get_player().canOviposit())
            {
               if(!get_player().canOvipositBee() || Utils.rand(2) == 0)
               {
                  addButton(3,"用她产卵",ovipositBunnyEaster).hint("用你自己的卵填满她？");
               }
               else
               {
                  addButton(3,"用她产卵",layEggsInBunbuns).hint("用你自己的卵填满她？");
               }
            }
            addButton(4,"你的屁股",bunbunFucksPCInAss).hint("让她的肉棒插进你的屁股？");
            setExitButton();
         }
      }
      
      public function bunbunGetsFucked() : void
      {
         spriteSelect(SpriteDb.get_s_easter_bunneh());
         clearOutput();
         var _loc1_:int = get_player().cockThatFits(40);
         var _loc2_:int = get_player().cockThatFits2(40);
         outputText("你脱下衣服，把你的[armor]扔到一边，立刻把它抛在脑后，因为兔女郎掀起她的裙子，露出了她女性特征的鲜艳粉红色果肉。它闪闪发光，她丰富的润滑液几乎让空气都蒸腾起来。她用一根纤细的手指在湿润的洞口周围滑动，示意你插入，用你的" + get_player().cockDescript(_loc1_) + "填满她饥渴的肉体。当你跪下，将你的" + get_player().cockDescript(_loc1_) + "对准那个准备好的开口时，欲望在你体内燃烧");
         if(_loc2_ != -1)
         {
            outputText("，注意将你的" + get_player().cockDescript(_loc2_) + "也对准她紧紧皱起的后门。");
         }
         else
         {
            outputText("，随着插入时间的临近，你几乎无法克制自己。");
         }
         outputText("[pg]");
         outputText("当你向前推时，性感的兔女郎变成了斗鸡眼，将你的" + get_player().cockHead(_loc1_) + "滑过她被爱液浸湿的嘴唇，直到它涂上厚厚的一层，然后用力按压。");
         if(_loc2_ != -1)
         {
            outputText("她因为娇嫩的菊花受到压力而发出吱吱声，但当你的先列腺液涂抹在上面时，她并没有反对。");
         }
         outputText("立刻，她贪婪的繁殖洞放松了");
         if(_loc2_ != -1)
         {
            outputText("连同她的肛门");
         }
         outputText("和你的" + get_player().cockDescript(_loc1_));
         if(_loc2_ != -1)
         {
            outputText("和" + get_player().cockDescript(_loc2_) + "沉入");
         }
         else
         {
            outputText("沉入");
         }
         outputText("她湿滑温暖的深处。她幸福地喘息呻吟，甚至大声叫床，[say: 噢，是的，我不知道为什么，但这感觉就像繁殖期一样爽！如果你继续这样，" + get_player().mf("种马","性感宝贝") + "，你可能会……啊……让我下蛋！][pg]");
         outputText("你没有去想这到底是怎么回事，而是继续向前挺进，高兴地看着你越来越多的长度被这只发情兔子的身体吞没。");
         if(get_player().cockArea(_loc1_) >= 25)
         {
            outputText("她的肚子令人愉悦地鼓了起来，透过皮肤隐约显现出圆柱形的肉棒轮廓，这让你对这个“雌性”感到完全的支配。");
         }
         outputText("一旦你插到底，这个双性人竟然开始往自己身上喷射先列腺液。虽然没有你想象中真正高潮时那么多，但也足以把她的乳房和肚子弄得湿滑一片。她把液体聚拢起来，开始用它自慰，你看着这只热情的兔子兴奋地手淫。[pg]");
         outputText("[say: 不——]她叫喊着，以为你要停下来，但你野蛮地再次猛插进去，摇晃着她的身体，让她娇小、涂满先列腺液的乳房愉快地抖动起来。在那一瞬间，她的“不”变成了“噢”，在她还没来得及阻止或喘口气之前，你开始用力操干，看着她那闪烁着精液光泽的乳房在你身下晃动。");
         if(_loc2_ != -1)
         {
            outputText("她紧致的屁眼在你的" + get_player().cockDescript(_loc2_) + "周围慢慢松弛，每次抽插都有大量的润滑液从她的小穴里飞溅出来，以至于你两根肉棒的感觉变得几乎一模一样，除了紧紧夹住下面那根的紧致圆环。");
         }
         else
         {
            outputText("大量的润滑液从她的小穴里飞溅出来，以至于你的大腿");
            if(get_player().balls > 0)
            {
               outputText("、肚子和蛋蛋");
            }
            else
            {
               outputText("和肚子");
            }
            outputText("很快就沾满了这种黏糊糊的东西，但这只会刺激你更用力地操她。");
         }
         outputText("[pg]");
         outputText("兔女郎从未放过她双腿间那个十四英寸的怪物，在所有的关注下，它似乎变得更粗更硬了。在这段时间里，她的肉棒从未停止滴落和喷射先列腺液，在你们俩高潮之前，她就已经变成了一个黏糊糊、沾满精液的烂摊子。她下体散发出的呻吟和热量清楚地表明，这种情况很快就会改变，所以你伸出手，在她紧绷的屁股上狠狠地拍了一巴掌。这引发了一场与你想象中截然不同的高潮。[pg]");
         outputText("在你的眼前，兔女郎的蛋蛋消失了，她阴囊的肉紧紧贴着她。看起来她好像从来没有过蛋蛋一样。你看着她寻求答案，但她翻着白眼，身体在你周围颤抖，嘴里不停地嘟囔着，[say: 操蛋……繁殖蛋……蛋……蛋，]一遍又一遍。她的小穴像老虎钳一样紧紧夹住你，让你眼花缭乱，你的胯下也因为即将到来的高潮而沸腾起来。");
         if(_loc2_ != -1)
         {
            outputText("令人惊讶的是，她的屁眼保持得差不多，但它已经有点紧了，你知道你马上就会把它灌满浓浆。");
         }
         outputText("[pg]");
         outputText("兔子的抽搐呈现出一种疯狂、狂躁的节奏，在你的眼前，她肿胀的肉棒根部开始膨胀，因为内部的某个物体，宽度几乎翻了一倍。你想知道她怎么会喜欢这种东西，但也许她的身体就是为此而生的？它慢慢地沿着肉棒向上移动，而你长耳的情人则沉浸在高潮中，喘息着，倒抽着气，漏出更白的先列腺液，这些液体一碰到哪里，哪里的抽搐就会停止。里面一定有什么东西能强行放松肌肉，但在你进一步思考之前，你自己的高潮已经到来了。[pg]");
         outputText("你以野蛮的力量插到底");
         if(get_player().balls > 0)
         {
            outputText("，让你的蛋蛋拍打在她的屁股上");
         }
         outputText("，当你的");
         if(get_player().hasSheath())
         {
            outputText("包皮");
         }
         else
         {
            outputText("根部");
         }
         outputText("摩擦着她那因情欲而红肿的阴唇。" + get_player().SMultiCockDesc() + "释放了，将一波波精液喷射进");
         if(get_player().cockTotal() == 2 && _loc2_ == -1 || get_player().cockTotal() > 2)
         {
            outputText("和喷在");
         }
         outputText("这只失去理智的兔女郎身上。当你高潮时，她那如丝般顺滑的阴道不断挤压、榨取着，仿佛要把你的精液从阴茎里直接抽出来，吸入更深处，一滴也不浪费。");
         if(_loc2_ != -1)
         {
            outputText("她的屁股因为你的注入而发出咕噜声");
            if(get_player().cumQ() > 500)
            {
               outputText("，而她的肚子也因为你泵入的大量精液而微微隆起");
            }
            outputText("。");
         }
         if(get_player().cumQ() > 500)
         {
            outputText("你继续射精，将一发又一发的精液猛烈地射入她那欢迎你的下体，很高兴似乎没有一滴漏出来。");
         }
         if(get_player().cumQ() >= 1500)
         {
            outputText("不知为何，她的子宫似乎永远也填不满，也不会鼓起来，尽管你肯定已经把几加仑的受孕精液泵进了她的阴道。当你的高潮平息时，你对这一切感到有些困惑，但也得到了满足。");
         }
         outputText("[pg]");
         outputText("兔女郎肿胀的阴茎已经把那个鼓包一直推到了顶端，尽管你看到根部又形成了一个。她似乎并不介意，事实上，她甚至停止了胡言乱语和呻吟，足以让她在把一颗蛋发射到乳房上时发出愉悦的尖叫。它停留在她小巧的乳房之间，滚动着，将白色的粘液滴在她的乳头上。她的阴茎又喷出了几发不管是什么的“精液”，然后才慢慢停下来。另一个鼓包距离她仍然有些被撑开的顶端不远了，你知道她很快就会“下”另一颗蛋了。[pg]");
         outputText("伴随着一声女性的咕哝、一声呻吟和一股液体的喷发，第二颗蛋落在了她的肚子上。兔女郎终于停止了抽搐，因为她用更多的白色粘液浸透了自己，尽管她的眼睛试图聚焦在你身上，但它们似乎比应该的要放大得多。她唯一费心去做的动作就是呼吸，并虚弱地把一团白色的东西从眼睛上推开。当你拔出时，兔女郎梦幻般地叹了口气，在她从那漫长得荒谬且不寻常的高潮中恢复过来时，抚摸着她的蛋。[pg]");
         outputText("你问她这是否正常，她虚弱地点了点头。一秒钟后，从她的腹股沟区域可以听到明显的隆隆声。你看着她，她的脸颊变红，开始慢慢喘气。片刻之后，她的“阴囊”重新出现，里面只有一个“睾丸”，尽管此时你知道那是什么——一颗蛋。兔女郎再次开始抚摸她的阴茎，尽管这次没有了之前的狂热，另一颗蛋掉了下来，恢复了她的“一对”。");
         if(get_player().cumQ() > 100)
         {
            outputText("几秒钟后，又有一颗滚了进去，把三颗蛋塞进了她那看起来越来越淫秽的“囊袋”里。");
         }
         if(get_player().cumQ() > 250)
         {
            outputText("又跟着来了一颗，给了她四个");
         }
         var _loc3_:Number = 8 + Utils.rand(get_player().cumQ() / 100);
         if(_loc3_ > 50)
         {
            _loc3_ = 50;
         }
         if(get_player().cumQ() > 700)
         {
            outputText("，但她还没完。她的肚子大声咕噜着，然后一颗接一颗的蛋倒进阴囊里，把它撑大，直到你确定她里面至少有" + _loc3_ + "颗，而且走路都会有困难。");
         }
         else
         {
            outputText("。");
         }
         outputText("她满足地呻吟着，闭上眼睛，幸福地叹了口气。[pg]");
         outputText("你耸耸肩，捡起她的一颗蛋，注意到它变成了霓虹粉色。兔女郎咕哝着，[say:吃吧，对你有好处……]然后她开始打呼噜，并在春梦中喃喃自语。[pg]");
         get_player().orgasm("Dick");
         dynStats(DynStat.Lib(1),DynStat.Sens(1));
         get_inventory().takeItem(get_consumables().NPNKEGG,get_camp().returnToCampUseOneHour);
      }
      
      public function bunbunFucksYourVag() : void
      {
         spriteSelect(SpriteDb.get_s_easter_bunneh());
         clearOutput();
         outputText("你飞快地脱下衣服，丢掉[armor]，[face]上绽放出期待的笑容");
         if(!get_player().get_weapon().isUnarmed())
         {
            outputText("和[weapon]");
         }
         outputText("，脸上露出期待的笑容。与此同时，兔女郎在半发情的恍惚中看着你，一手抚摸着自己的肉棒，另一只手挑逗着自己坚硬的乳头。你兴奋地叹了口气，在她的上方摆好姿势，将她那略显棱角的龟头对准你的" + get_player().vaginaDescript(0) + "的入口，然后开始下沉。");
         if(get_player().vaginas[0].vaginalWetness >= 4)
         {
            outputText("淫液不断渗出，与兔女郎的先列腺液混合，将即将入侵的肉棒完全润滑。");
         }
         outputText("[pg]");
         outputText("你火热地喘息着，将她尖尖的龟头吞入深处，感觉到这个兔女郎的龟头肿胀起来，又泵出几滴润滑液");
         if(get_player().vaginas[0].vaginalWetness >= 3)
         {
            outputText("，虽然你并不需要");
         }
         outputText("。你不需要任何更多的鼓励。顺着她粗壮的兔娘肉棒缓慢滑下的感觉简直是天堂，它表面的青筋恰到好处地搔到了你的“痒处”。");
         if(get_player().vaginalCapacity() < 20)
         {
            outputText("当你快要到底部时，你不得不努力将她的长度和粗细包容在你天鹅绒般的褶皱中，每一寸新插入的跳动肉棒都让你不适地咕哝，但你还是全部吞下了。");
         }
         else if(get_player().vaginalCapacity() < 50)
         {
            outputText("当你到底部时，你喘息着，呻吟着，享受着被一根坚硬的肉棒完美刺穿的感觉。随着她完全进入你的体内，你准备好认真地操她了。");
         }
         else
         {
            outputText("没花多长时间就滑下了这根一尺多长的肉棒，说实话你希望她能再大一点。你的" + get_player().vaginaDescript(0) + "已经准备好迎接大阴茎了，这根不成比例的肉棒充其量只能算是一般。尽管如此，你还是收紧了大腿肌肉，把它夹得更紧了一点，并从温暖的雄性气息填满你下半身的感觉中晕眩。");
         }
         get_player().cuntChange(35,true);
         outputText("[pg]");
         outputText("虽然兔女郎直到此时都满足于保持被动，但现在她尝到了小穴的滋味，眼中燃起了火焰。她娇小的双手抓住你的" + get_player().assDescript() + "，同时将她强壮、关节奇特的双腿拉到身下。一瞬间后，她用力向上推，将你弹起几英寸高，然后你又落回她身上。");
         if(get_player().get_tallness() >= 72)
         {
            outputText("当你落回她身上时，你纯粹的重量让她不适地咕哝了一声，但大量性液的挤压声几乎淹没了它。她甚至又在你体内喷出了一大股浓稠的先列腺液。");
            if(get_player().cor < 33)
            {
               outputText("下次你得试着减缓下降的速度！");
            }
            else
            {
               outputText("如果她要这样操你，她就能承受你的重量！");
            }
         }
         else
         {
            outputText("你们的身体拍打在一起，发出大量性液的响亮挤压声，又一股浓稠的先列腺液温暖了你的小穴。");
         }
         outputText("她到底能喷出多少先列腺液啊？！[pg]");
         outputText("你伸手抓住兔女郎的臀部作为支撑，她再次把你顶起，这次更高了。她那根肉棒足足有五六英寸长，在你的" + get_player().vaginaDescript(0) + "里进进出出，然后你重重地砸在她身上，一瞬间后，你又腾空而起。她越顶越用力，直到她肌肉发达的大腿每一次抽插都把你抛离她的下体近一英尺高，然后让重力引导你顺着她的肉棒滑下。");
         if(get_player().getClitLength() >= 4)
         {
            outputText("你的[clit]在她的肚子上弹跳，每次拍打在她晒成棕褐色、汗水滑腻的皮肤上时，都会疯狂地发麻。");
         }
         if(get_player().biggestLactation() >= 1)
         {
            outputText("兔娘粗暴、近乎机械的抽插带来的快感，让你的" + get_player().allBreastsDescript() + "开始渗出乳汁。");
         }
         outputText("急不可耐的女孩呻吟着，[say: 哦哦哦操操操好爽……要操……要配种……呃……卵卵卵！][pg]");
         outputText("卵？她要用卵让你怀孕吗？她造成的困惑实际上分散了你对性爱的注意力，足以推迟你的高潮，但多情的兔女郎用最后一次抽插把自己推向了边缘，力度之大几乎要把你从她肿胀的鸡巴上发射出去。你顺着精疲力竭的兔女郎滑下，但并没有感觉到你预期的那种在你的" + get_player().vaginaDescript(0) + "里爆发的喷涌和温暖。当然，有一丝温暖，但你那痉挛的爱人的肉棒并没有像男性的器官那样喷射。你转过身想仔细看看她，发现她似乎仍然沉浸在高潮中，而且她的蛋蛋不见了！[pg]");
         outputText("情人肉棒的粗细突然发生巨大变化，让你两眼发直。它从你的下唇开始，把它们撑得大大的。兔娘肉棒肌肉的收缩让她的鸡巴在你体内跳动，慢慢地把凸起向上推，在向你的子宫移动时撑开你的" + get_player().vaginaDescript(0) + "的肉壁。越来越多的液体漏进你的通道，直到你的[legs]放松并变得软弱无力。这已经不仅仅是先列腺液了——它正在减轻疼痛并放松你的身体！当凸起经过一半时，你甚至能感觉到你的子宫颈开始不由自主地张开。从膨胀的地方往下，你的小穴松松垮垮地挂在肿胀的鸡巴周围，但另一个肉结在根部出现，并开始顺着你被蹂躏的通道向上滑动。");
         get_player().cuntChange(70,true);
         outputText("[pg]");
         outputText("你身下的女孩正在挣扎和呻吟，嘴里念叨着，[say: 是的……卵卵卵！是的！]而她那像产卵管一样的鸡巴夺走了你的力量，并在你体内滑入蛋形的凸起。令人惊讶的是，你的" + get_player().vaginaDescript(0) + "充满了快感，你伸手去");
         if(get_player().getClitLength() >= 4)
         {
            outputText("抚摸你的[clit]片刻，然后用手包住它，兴奋地抚弄着女孩鸡巴。");
         }
         else
         {
            outputText("爱抚你的[clit]片刻，然后开始用手指在它周围画圈，熟练地挑逗它。");
         }
         if(get_player().cockTotal() > 0)
         {
            outputText("" + get_player().SMultiCockDesc() + "抽搐着流下口水");
            if(get_player().cocks[0].cockLength < 10)
            {
               outputText("在兔女郎的肚子上");
            }
            else if(get_player().cocks[0].cockLength < 18)
            {
               outputText("在兔女郎小巧的乳房之间");
            }
            else if(get_player().cocks[0].cockLength < 28)
            {
               outputText("在兔女郎的脸上");
            }
            else
            {
               outputText("越过兔女郎的头");
            }
            outputText("，你空出的手毫不迟疑地照顾你的男性");
            if(get_player().cockTotal() == 1)
            {
               outputText("一半的需求，在上面涂满先列腺液，又硬又快地抚弄着。");
            }
            else
            {
               outputText("一半的需求，在它们上面涂满先列腺液，又硬又快地抚弄着。");
            }
         }
         outputText("当卵到达顶端时，扶她兔娘的龟头肿胀起来，完全撑开了你的子宫，然后伴随着最后一次爆发性的推挤，将它发射到你的深处。[pg]");
         outputText("你高潮得很厉害。尽管药物引起的放松已经压倒了你腰部以下的感觉，但你的" + get_player().vaginaDescript(0) + "上下爆发出一阵阵痉挛，紧紧地挤压着喷射卵的鸡巴。这只会加速兔女郎第二个凸起的通过，几秒钟内，她膨胀的龟头被撑得比以前更宽，把她锁在你体内片刻。你们俩徒劳地摇晃和摩擦着臀部，直到最后一个卵在你体内爆发，伴随着一股巨大的、让你下半身失去知觉的液体。");
         if(get_player().cockTotal() > 0)
         {
            outputText("最后，[eachcock]到处喷射出黏稠的精液，和你一起高潮，你的身体从精疲力竭的兔娘身上滑落到泥土里。几根粗壮的精丝打在她的乳房和脸上，但从她半闭的眼睑和探索的舌头来看，她并不介意。");
            if(get_player().cumQ() > 500)
            {
               outputText("不仅如此，[eachcock]继续抽动，直到兔娘被涂上一层厚厚的精液");
            }
            if(get_player().cumQ() > 2000)
            {
               outputText("多余的精液像小河一样流下山坡");
            }
            if(get_player().cumQ() > 500)
            {
               outputText("。");
            }
         }
         outputText("[pg]");
         outputText("你瘫倒在地，下体流出淫液，你的子宫在异物周围闭合，宫颈紧闭以留住两枚卵子。不知过了多久，但新孕带来的强制快感让你难以立刻起身。你看到兔子站了起来，她的肉棒终于软了下来，而且根本没有睾丸。她俯下身，在你的嘴唇上亲吻了一下，然后低声说道，[saystart]");
         if(get_player().bunnyScore() < 4)
         {
            outputText("终于能清醒思考了，感觉真好！我不知道为什么我现在会发情，但现在我排出了那些卵子，思考起来容易多了。别担心，你不会生出兔子的，因为你不是复活节兔子。你的身体大概几天内就会吸收它们。如果之后你觉得有点胀或者有点奇怪，别惊讶。[sayend][pg]");
         }
         else if(get_player().get_pregnancyIncubation() > 0)
         {
            outputText("终于能清醒思考了，感觉真好！我不知道为什么我现在会发情，但你怀孕了真是太可惜了。你的身体会在这些小卵子起作用之前就把它们破坏掉！好吧，至少我现在感觉好多了……[sayend][pg]");
         }
         else
         {
            outputText("终于能清醒思考了，感觉真好！我不知道为什么我现在会发情，但把我的宝宝注入像你这样漂亮、准备就绪的母体里感觉真好。我敢打赌孩子们生出来一定会很可爱！哦，我感觉好多了。[sayend][pg]");
         }
         outputText("她走开了，毛茸茸的尾巴在微风中抽动，而你的眼睛则慢慢闭上。");
         if(get_player().bunnyScore() < 4)
         {
            get_player().knockUp(9,808);
         }
         else
         {
            get_player().knockUp(9,200,60);
         }
         get_player().orgasm("Vaginal");
         dynStats(DynStat.Lib(1),DynStat.Sens(-3));
         get_player().sleeping = true;
         doNext(get_camp().returnToCampUseEightHours);
      }
      
      public function bunbunFucksPCInAss() : void
      {
         spriteSelect(SpriteDb.get_s_easter_bunneh());
         clearOutput();
         outputText("你产生了一个非常下流的想法，默默地脱下你的[armor]扔到一边，然后转过身，向兔女郎展示你的" + get_player().assDescript() + "。你淫荡地扭动着，挑逗着她，让她清楚地看到你的[asshole]，同时它越来越靠近那根肿胀的兔子肉棒，只有几英寸的距离。当肉棒急切地抽动时，几滴清澈的先列腺液顺着肉棒流下，女孩眼中闪烁着性奋的光芒看着你，而她的肉棒离你的后门越来越近。你让你的[legs]稍微放松一点，直到它紧紧地压在你的括约肌上，感觉它涂抹着先列腺液，为即将到来的插入做准备。[pg]");
         outputText("你越过肩膀看着兔子涨得通红的脸，放低了一点重心，开始在双性兔子的肉棒周围扩张。在大量先列腺液的帮助下，它很容易地滑入你的体内，但是");
         if(get_player().analCapacity() < 20)
         {
            outputText("当你顺着粗壮的肉棒滑下时，它把你撑得危险地宽。它越往下，你就越需要努力放松肌肉并推动自己。有了足够的时间、耐心和大量的兔子先列腺液，你终于把它完全吞入了体内。当你适应这种侵入时，它在里面快乐地抽动着，但你知道你才刚刚开始。");
         }
         else if(get_player().analCapacity() < 40)
         {
            outputText("当你滑下时，你不得不不断停下来，让更多她的先列腺液冒出来，润滑这根十四英寸长的肉棒。它很好地填满了你，以各种恰到好处的方式压迫着你的内脏，你用你的[asshole]慢慢吞噬了兔子的肉棒。触底后，你紧张的爱人的肉棒在你体内快乐地跳动着，但你知道你才刚刚开始。");
         }
         else
         {
            outputText("你希望它能更大一点。只用了几秒钟，她粗壮的肉棒就完全进入了你的[asshole]。当你坐在兔娘的");
            if(get_player().cor < 50)
            {
               outputText("女郎");
            }
            else
            {
               outputText("婊子");
            }
            outputText("的大腿上时，你收紧肌肉挤压着它，感觉它在你体内快乐地抽动，你咯咯地笑着，但你知道你才刚刚开始。");
         }
         get_player().buttChange(35,true);
         outputText("[pg]");
         outputText("当你拉起自己，将她的肉棒慢慢地穿过你紧致的后庭环，直到她快要滑出时，你的伴侣惊讶地喘着粗气，然后你再次落下将她包裹。她不由自主地发出无言的愉悦咕哝声，为你温暖的身体提供的感觉而兴奋。当你重复你的动作时，她的手抓住了她的乳头，以缓慢、平滑的节奏抽插着她，这应该会让她达到高潮……最终。");
         if(get_player().totalCocks() > 0)
         {
            outputText("每次她撞击并滑过你的前列腺时，一团你的先列腺液就会从[eachcock]喷射到地上，你很难不把你的新爱人当成肛门玩具来手淫自己。");
         }
         outputText("这个长耳荡妇在你越过肩膀看着她时，故意抚摸着自己的乳头，拉扯并扭动着它们。[pg]");
         outputText("你无意中开始加快了上下套弄的速度。你的身体因为做爱而感到饥渴和温暖，而有一个如此奇怪、迷人的情人在你的后庭交配，更是火上浇油。");
         if(get_player().hasVagina())
         {
            if(get_player().vaginas[0].vaginalWetness >= 3)
            {
               outputText("汁液开始从你的" + get_player().vaginaDescript(0) + "流出，但你忽略了那种空虚感，专注于后庭里跳动的肉棒。");
            }
         }
         outputText("手指下意识地摸索到了你的乳头，开始");
         if(!get_player().hasFuckableNipples())
         {
            outputText("拉扯和拽动它们");
            if(get_player().biggestLactation() >= 1)
            {
               outputText("，喷射出");
               if(get_player().biggestLactation() >= 4)
               {
                  outputText("喷雾");
               }
               else
               {
                  outputText("滴");
               }
               outputText("乳汁");
            }
            outputText("。");
         }
         else
         {
            outputText("滑入其中，操弄着它们像阴户一样的内部，你开始沉迷于这种快感。");
         }
         outputText("兔娘伸手摸向你的" + get_player().assDescript() + "，轻轻抚摸并捏了捏。片刻之后，她的双手都握住了你的臀瓣，引导你上下起伏，你在她身上弹跳得越来越快。[pg]");
         outputText("你的手指抚摸着她大腿上" + (get_noFur() ? "光滑的皮肤" : "柔软的绒毛") + "，惊叹于她的柔软，你让兔女郎开始设定一个极快的节奏，以至于她每次湿润、多汁的抽插都会喷出先列腺液。她偶尔会轻轻拍打你的屁股，并在每次火热的插入时大声呻吟和喘息，[say:操……繁殖……嗯……是的……卵，卵，求求你让我产卵！]随着快感在你的身体里汹涌澎湃，你很难集中注意力");
         if(get_player().cockTotal() > 0)
         {
            outputText("，每次她挤压你的前列腺时，[eachcock]都会流出极其粘稠的先列腺液");
         }
         else if(get_player().hasVagina())
         {
            outputText("，你的" + get_player().vaginaDescript(0) + "紧缩并滴落着汁液，处于高潮的边缘");
         }
         outputText("。");
         if(get_player().biggestLactation() >= 1)
         {
            outputText("乳汁");
            if(get_player().biggestLactation() < 2)
            {
               outputText("渗漏");
            }
            else if(get_player().biggestLactation() < 4)
            {
               outputText("滴落");
            }
            else
            {
               outputText("倾泻");
            }
            outputText("从你的[nipples]流出，当你游走在快感的边缘时，你的胸前变成了一片泥泞。");
         }
         outputText("[pg]");
         outputText("等一下，刚才说的蛋是怎么回事？这个念头带来的困惑让你分心，没能射出来，但兔女郎却在你重新考虑骑乘姿势之前高潮了。她抽搐着，肉棒微微抽动并变粗，但你并没有感觉到预想中喷涌而出的精液的温暖。你低头看着她，但兔女郎已经失去了知觉，无法回答你的问题，直到你注意到她的蛋蛋不见了，你才意识到她的高潮方式有些截然不同。[pg]");
         outputText("当你爱人的肉棒根部变粗一倍时，你痛得喘不过气来。它把你的[asshole]撑得很大，大得几乎让人感到痛苦，因为有什么东西开始从里面把她的肉棒往上推。还没等你从她身上拔出来，一大股液体就喷洒在你的体内，迅速麻痹了所有的疼痛，并抽走了你[legs]和肌肉的力量。你来回扭动着，但当那个凸起滑过你的括约肌时，快感加剧了，在它的尾迹中，你的身体微微张开。你发现它接下来的通过要舒服得多");
         if(get_player().cockTotal() > 0)
         {
            outputText("当它挤过你的前列腺时，[eachcock]将浓稠的精液喷射在地上，尽管你并没有完全高潮。");
         }
         else
         {
            outputText("你的性欲又强烈地恢复了。");
         }
         get_player().buttChange(70,true);
         outputText("[pg]");
         outputText("就在那个凸起到达兔肉棒顶端的前一刻，你感觉到另一个凸起滑过你的[asshole]。兔肉棒的头部变粗了一会儿，然后又缩小到正常的形状。你感觉到体内有一个温暖的球状物——那是一个蛋！这种奇怪的授精方式无法抑制你身体积聚的兴奋，也无法抑制第二个蛋通过时留下的感觉，你猛烈地高潮了。不知怎么的，你的身体获得了足够的控制力，紧紧地挤压着女孩的阴茎，但这只加速了蛋的通过，因为它伴随着另一大股令人愉悦、放松的液体喷射到你的直肠里。");
         if(get_player().cockTotal() > 0)
         {
            outputText("你的" + get_player().SMultiCockDesc() + "猛烈地爆发了，白色的浓浆喷洒在草地和泥土上。");
            if(get_player().cumQ() > 500)
            {
               outputText("你的精液飞溅的音量只会随着它形成一个相当大的水坑而增加");
            }
            if(get_player().cumQ() > 2000)
            {
               outputText("，但你只是继续射精，直到你创造出一条蜿蜒的精液河，流过草地");
            }
            if(get_player().cumQ() > 500)
            {
               outputText("。");
            }
         }
         if(get_player().hasVagina())
         {
            outputText("你的" + get_player().vaginaDescript(0) + "空虚地收缩着，流着淫水，被冷落的它渴望着有什么东西能填满它。");
         }
         outputText("[pg]");
         outputText("你从还在滴水的兔肉棒上滑下来，翻身仰面躺着，因为高潮的冲击而喘息着，感到非常满足。你体内的蛋一点也不觉得不舒服，事实上，你几乎注意不到它们。转过头，你看到兔女郎终于高潮完毕，尽管她的眼睛还没有完全翻回来。精疲力竭，充满了让人难以思考的愉悦荷尔蒙，你们俩只是躺着休息了一会儿。[pg]");
         outputText("不知过了多久，可爱的兔女郎给了你一个长长而湿润的吻。她停下来低语道，[say: 终于能清醒地思考真是太好了！我不知道为什么我现在会发情，但现在我摆脱了那些蛋，思考起来容易多了。别担心，我相信你几天后就会吸收它们，没事的。只是如果你觉得有点胀和奇怪，不要惊讶。][pg]");
         outputText("她走开了，毛茸茸的尾巴在微风中抽动，而你的眼睛则慢慢闭上。");
         get_player().buttKnockUp(9,808,1,1);
         get_player().orgasm("Anal");
         dynStats(DynStat.Lib(1),DynStat.Sens(1));
         get_player().sleeping = true;
         doNext(get_camp().returnToCampUseEightHours);
      }
      
      public function bunbun69() : void
      {
         spriteSelect(SpriteDb.get_s_easter_bunneh());
         clearOutput();
         if(get_player().isTaur())
         {
            if(Utils.rand(2) == 0)
            {
               outputText("除了“听起来很性感”之外，你没有多想，就宣布了你要和兔女郎69的意图。她站在那里，张着嘴，短暂地忘记了发情。[pg]");
               outputText("[say: 什么？][pg]");
               outputText("现在你已经意识到了自己刚才的话有多荒谬，但你太骄傲了，不愿承认，只是重申了你的目标。你双臂交叉，试图让自己看起来尽可能严肃。她低头看着你的马下半身，同时漫不经心地抚摸着她的肉棒，确认你的“装备”确实在她以为的位置。[pg]");
               outputText("[say: 你真奇怪，] 兔子说道。[pg]");
               outputText("还没等你回敬一句俏皮话，兔子就已经跳走了，把你一个人留在田野里，捂着脸。[pg]");
               get_player().orgasm("Generic");
               dynStats(DynStat.Inte(-2));
               doNext(get_camp().returnToCampUseOneHour);
            }
            else
            {
               outputText("除了“听起来很性感”之外，你没有多想，就宣布了你想和兔女郎69的意图。她大笑起来。你对此感到有些不安，并重申了你的目标，表明你是认真的。[pg]");
               outputText("[say: 不，不，停下——啊哈哈——你要笑死我了——哈哈！] 她语无伦次地说。[say: 哈哈哈——哦，天哪——我要笑出蛋来了——哈哈哈！][pg]");
               outputText("就在她向后倒去，一手捂着肚子，一手捂着肉棒时，你意识到了自己提议的荒谬。你试图想象出某种方法让你的提议奏效并挽回面子，但说出如此荒谬和轻率的话所带来的羞辱感让你再也提不出任何建议了。[pg]");
               outputText("她笑得太厉害了，整个身体都开始剧烈颤抖。你觉得这并没<i>那么</i>好笑，正准备转身离开时，她的一个睾丸消失了。你带着好奇和困惑交织的心情，看着那个肿块顺着这只歇斯底里的兔子的肉棒向上移动，然后发射到空中，露出了一个柔和的粉白相间的蛋。你弯下腰去捡它，就在这时，另一个“睾丸”啪的一声砸在了你的脸上。[pg]");
               outputText("[say: 哈哈！蛋砸你脸上了！啊哈哈！][pg]");
               outputText("你尽可能地擦掉脸上黏糊糊的黏液，皱着眉头小跑着离开了，留下那只歇斯底里的兔子自己冷静下来。[pg]");
               get_player().orgasm("Generic");
               dynStats(DynStat.Inte(-2));
               get_inventory().takeItem(get_consumables().NPNKEGG,get_camp().returnToCampUseOneHour);
            }
            return;
         }
         if(get_player().cockTotal() > 0)
         {
            if(isEaster())
            {
               outputText("如果你们俩都没有机会找点乐子，那岂不是很可惜？你抓住这个皮肤黝黑的女孩，轻轻地把她推倒，在她的脸上方盘旋了一会儿，把玩着她长满雀斑的脸颊上的胡须。你的挠痒痒似乎让女孩兴奋起来，没过多久，她就透过龅牙喘着粗气，她的坚挺僵硬着，随着她急促的心跳而跳动。你翻过她的身体，把你的[legs]停在她的耳朵两侧，俯身靠近她的胯部，品味着从她汗津津的身体上飘来的淡淡的巧克力甜香。她的肉棒几乎令人望而生畏，在你面前淫秽地隆起，一小滴一小滴的先列腺液渗到尖端，形成丰富的气泡，顺着她焦糖色的皮肤流下。你小心翼翼地把鼻子凑到她的肉棒上闻了闻，惊喜地发现那些黏糊糊的精液闻起来更像新鲜的棉花糖，而不是你习惯的咸味分泌物。事实上，它闻起来真的，真的很好。你把脸颊贴在兔女郎的根部，试探性地舔着她的肉棒，收集着那些让她黝黑的肉棒布满雪白条纹的零星精液。她喘息着，肉棒在你的脸上抽动，随着她双腿的快速震动而前后摆动。当你尝到她的精液时，它的味道甚至比闻起来更好——就像棉花糖、软糖和甜果汁在你的嘴里狂欢，就像第一勺冰淇淋一样诱人。不管有没有隐形的兔子，你都必须得到更多她的精液！[pg]");
               outputText("在你身下，兔子似乎正带着几乎无法抑制的欲望欣赏着你的长度。你之前看到的沸腾的欲火压倒了她的克制，她只能在完全吞下你的肉棒之前尽量润滑你。一条又长又宽的舌头在你的男子气概上上下舔舐，又热又湿，她可爱的小鼻子在你的青筋上摩擦，带来令人发狂的瘙痒。当她用长长的龅牙摩擦你柔软的肌肤时，一阵不安的颤栗爬上你的心头，但令人惊讶的是，你发现它们非常钝，摸起来几乎感觉很柔软。当你把嘴凑到她尖尖的龟头时，她决定把你的老二当冰棍吃还不够，于是带着饥渴的享受，引导你的龟头贴近她渴望的嘴唇。她满意地咽了一口，将你的肉棒滑入嘴里，并用舌头边缘按摩你的龟头下方，压入肿胀的肉中，同时用上颚的隆起挑逗你的尿道，随着每一次头部的摆动，打开和闭合那个娇嫩的洞。[pg]");
               outputText("作为回报，你更加用力地吸吮兔女郎的肉棒，每次吞下几英寸，直到你的嘴里感觉充满了这个巧克力女孩的勃起。在你的头部周围，她屈起膝盖，用脚掌支撑着双腿。她的下半身随着小腿抽动的兴奋而震动，这让你嘴里的肉棒像热果冻一样颤抖。她的阴囊在你面前滚来滚去，椭圆形的蛋蛋在热切的感激中跳动，你忍不住用手包裹住它们，感受着手掌中阴囊散发出的热量。轻轻地在手中滚动它们，你能感觉到手掌中迅速充满的袋子的重量。你用拇指抚摸着她古铜色的蛋蛋，直到她阴道的顶端。兔子的阴蒂像软糖一样又硬又大，你用指尖在它周围画圈，几乎就像试图把它从深巧克力色的肉质兜帽里挑逗出来一样。[pg]");
               outputText("你意识到，你的挑逗和刺激可能是不明智的，因为兔女郎的克制像热天里的雾一样蒸发了。她的动物本能开始发作，女孩摆动的双腿变成了全尺寸的推力。凭借惊人的腿部力量，她以越来越长的幅度挺动臀部，直到她的整个屁股像" + (get_noFur() ? "" : " 模糊的") + "橡胶一样在地上弹跳。你试图补偿，但女孩的疯狂是无情的。几秒钟内，她就从你的舌头到了你的扁桃体，再到了你的喉咙，她圆锥形的肉棒形状完美，可以直接滑入深喉。面对突如其来的入侵，你开始窒息，但兔子和你一样渴望得到奶油夹心，也渴望给你一个丰富的巧克力夹心。伴随着一声欢快的“吱吱”声，她张开食道，将头更深地埋在你的肉棒上，她宽大温和的兔牙压迫着你不堪重负的静脉，刚好足以让你的身体一阵颤栗。");
               if(get_player().cocks[0].cockLength >= 8)
               {
                  outputText("当她吞下六英寸深时，她的吮吸变得更加急切，双臂环抱住你的臀部，手指抠进你的屁股，将你的胯部拉得更低。");
               }
               if(get_player().cocks[0].cockLength >= 12)
               {
                  outputText("一根一英尺长的兔娘肉棒在你的肺里翻江倒海，你根本无法集中注意力，所以当女孩的绝望爆发时，你完全没有防备。她通过小巧的鼻孔深吸了一口气，然后用尽全力将头撞向你的胯部，用脸操着你的肉棒，直到她喉咙柔软的褶皱被撑开，将长满雀斑的脸颊埋进你的大腿里。");
               }
               outputText("[pg]");
               outputText("兔女郎的胸膛快速起伏，简直就像在过度换气。你意识到她进入了繁殖狂热状态！她用双腿夹住你的头，紧紧地抱住你，然后伴随着一声沉闷的撞击声，将你们俩翻转过来，把她那14英寸长的肉棒深深地捅进了你的喉咙。你瞪大了眼睛，被这根从嘴唇一直延伸到胃部的焦糖色肉柱惊呆了，以至于根本无暇顾及身体突然缺氧的问题。随着她产卵的冲动将这只兔子变成了一头野兽，她的蛋蛋猛烈地撞击着你的鼻子。她那苗条的橄榄色身体的每一寸都在快速、细小的跳跃中与你的身体摩擦，让你们的身体不断地碰撞。她过度活跃的状态为她的抽插和吸吮注入了欢快的活力。这只兔子肌肉发达的身体跳得越来越高，直到她将近一英尺长的巧克力色肉棒在你的嘴里进进出出，谢天谢地，这让你在抽插的间隙有足够的喘息时间通过鼻子呼吸。[pg]");
               outputText("这只活泼的兔子开始让你感到头晕目眩，她适中的B罩杯拍打在你的[chest]上，已经开始在你敏感的肌肤上留下刺痛的红色红肿。你用一只手臂搂住她的腰，把她的胯部紧紧地拉向你的脸，另一只手埋进她滴水的阴户，兔子的嘴唇像太妃糖一样在你的强力抓握下分开。你尽可能多地塞进去，弯曲手指把它们拉出来，直到你找到这个扭动女孩的G点。她疯狂的跳跃立刻停止了，整个身体在你的怀抱中颤抖。你为自己的快速反应感到庆幸，因为她的肉棒在你的嘴里跳动，女孩的高潮即将来临。然而，令你大吃一惊的是，她的蛋蛋并没有仅仅是跳动，而是开始肿胀，其中一个弹进了她的身体！你可以看到一个蛋形的隆起顺着她的腹部向她的肉棒移动，你赶紧试图把头缩回来。兔子的手臂伸到你的脑后，手指抠进你的头发里，试图把你按下去，同时她对着你紧绷的尺寸呻吟。你挣脱她的抓握，她睾丸的蛋形隆起顺着她的肉棒向上移动的速度比你把它从肠道里拉出来的速度快一点。当突起滑过你的嘴唇时，沾满口水的肉膨胀了，就在她的龟头滑过你的舌头时，她狭窄的冠状沟肿胀起来，淫秽地扩张。一股热腾腾的棉花糖精液在你的嘴里喷发，黏糊糊的液体填满了你的脸颊，滑回你的喉咙，甚至当你试图吞下她的负荷而关闭食道时，从你的鼻孔里喷出浓汤般的糖衣精液。片刻之后，女孩的睾丸扑通一声掉进你的嘴里，你松了一口气，发现那似乎是一个在你的舌头上滚来滚去的蛋。[pg]");
               outputText("仍然被狂乱的繁殖歇斯底里所控制，兔子咕哝着，把她的肉棒塞回你的喉咙，把蛋也一起推了进去。当兔子的蛋球滑下你被精液润滑的脖子，伴随着一声清晰、粗俗的扑通声掉进你的肚子里时，你的皮肤像蘑菇一样隆起。一种难以置信的饱腹感充满了你，就好像你刚刚吃完了一座糖果小山。一股热浪像糖果烤箱一样填满了你的肚子，兔子在中间的蛋膨胀起来，吸收了她的精液和你的体温，像一个烤蛋糕一样在你体内生长。你被兔子的填塞弄得头晕目眩，当第二个蛋滑入她的老二时，她的阴囊瘪了下去，你虚弱地摇了摇头，似乎在说你不想要第二个了。然而，这个女孩在她的放荡热情中走得太远了，把你的动作当成了鼓励，她把鼻子蹭进你的");
               if(get_player().balls > 0)
               {
                  outputText("蛋蛋");
               }
               else
               {
                  outputText("阴蒂");
               }
               outputText("，胡须随着快乐的轻哼声震动着，她的门牙热情地按摩着你的根部，迫不及待地想要得到勇者的奶油夹心。她的手从你的后脑勺滑下，沿着你的脖子、后背，一直滑到你的屁股，手指环绕着找到了你的[assholeorpussy]。她将两根中指滑入，抚摸着你的");
               if(!get_player().hasVagina())
               {
                  outputText("前列腺");
               }
               else
               {
                  outputText("内壁");
               }
               outputText("直到你的高潮压倒了你那因糖精脂肪而产生的眩晕感，你达到了顶点，因卵而肿胀的身体喷射出乳白色的精液，将棕色兔女郎的体内染成白色。[pg]");
               outputText("她的第二颗卵伴随着喷涌的颤抖强行滑入你的喉咙，你能感觉到你的臀部在不堪重负的胃的重量下紧绷着。当第二颗卵从兔女郎十四英寸长的肉棒那膨大的龟头滑出时，你有点害怕它会对你造成什么影响。也许是因为兔女郎的头在你的肉棒上快乐地上下跳动而产生的挤奶动作，又或者是第二颗卵的膨胀，你的身体开始发热，头皮和屁股的肉感到刺痛。你闭上眼睛，强迫自己消化兔女郎的糖果卵，令你惊讶的是，你的肚子减缓了膨胀，随着卵在你的胃里爆裂，卸下它们粘稠的糖果馅料，肚子逐渐缩小。");
               get_player().refillHunger(60);
               if(get_player().tail.type != 10)
               {
                  if(get_player().tail.type == 0)
                  {
                     outputText("你下背部周围的热量抓住了你的尾骨，你感觉到屁股周围有一阵毛茸茸的爆炸感，<b>一条毛茸茸的兔子尾巴从你的背上弹了出来</b>，兴奋地抽动着！");
                  }
                  else
                  {
                     outputText("你的尾巴抖动着缩小，慢慢地缩回你的身体，直到只剩下一个小小的肉突，它很快就爆发出绒毛，变成了<b>你那毛茸茸、抽动着的新兔子尾巴！</b>");
                  }
               }
               if(get_player().ears.type != 7)
               {
                  outputText("看来接下来轮到你的头顶了。");
                  outputText("你的眉毛感觉像是被向上拉扯，眼睛越睁越大，直到你对周围的每一种颜色和声音都敏感到几乎痛苦的地步。你摇了摇头，<b>一对毛茸茸的巨大兔耳在你眼前晃动</b>。你拍了拍头的两侧，果然，你原来的耳朵不见了。");
               }
               outputText("[pg]");
               outputText("伴随着一声满足的轻叹，女孩从你的肉棒上滑落，任由它软趴趴地贴在你的腿上，没有浪费哪怕一滴精液。她的肚子已经");
               if(get_player().cumQ() < 250)
               {
                  outputText("微微隆起");
               }
               else if(get_player().cumQ() < 1000)
               {
                  outputText("明显的粗度");
               }
               else
               {
                  outputText("异常肿胀");
               }
               outputText("，你的精液平息了她产卵的激情，让她像被打发的焦糖一样弹跳。她伴随着湿润的吸溜声，将她缩小的阴茎从你嘴里拔出，她浓郁精液的甜味还留在你的唇上。她蹲起身，用拇指和食指调皮地捏了捏你的新耳朵。[say: 抱歉，我不知道我怎么了！不过我确实没想到会这样！这让我有点想留下来，看看我们能不能生出更多的兔子，]她眨了眨眼。[say: 但不幸的是，我得走了！希望你度过了快乐、美味的一天！也许以后我还会再来找你。]她给了你一个湿润的小吻，然后跳开了，在经历了这一切之后，她依然精力充沛。你呻吟着，仍然觉得因为这顿“大餐”而感到肥胖和肿胀。[pg]");
               get_player().tail.type = 10;
               get_player().ears.type = 7;
               doNext(get_camp().returnToCampUseOneHour);
               get_player().orgasm("Dick");
               get_player().orgasm("Lips",false);
               dynStats(DynStat.Lib(1),DynStat.Sens(1));
            }
            else
            {
               outputText("如果你们俩都没机会找点乐子，那岂不是很可惜？你抓住这个黑皮肤的女孩，轻轻地把她推倒，在她的脸庞上方悬停了一会儿，把玩着她长满雀斑的脸颊上的胡须。你的逗弄似乎让女孩很兴奋，没过多久，她就透过龅牙喘着粗气，她的硬物僵硬着，随着她急促的心跳而跳动。你翻过身，把你的[legs]放在她耳朵两侧，俯下身，靠近她的胯部，品味着从她汗津津的身体散发出的淡淡甜味。她的阴茎几乎令人生畏，在你面前淫秽地鼓起，一小滴一小滴的先列腺液渗到尖端，形成浓郁的气泡，顺着她焦糖色的皮肤流下。你把脸颊贴在兔女郎的根部，试探性地舔舐她的肉棒，收集那些将她黑色的阴茎染成雪白的精液。她喘着粗气，阴茎在你的脸上抽动，随着她双腿的快速震动而前后摆动。当你尝到她的精液时，你的嘴里会有一种奇怪的麻木感，冷热交替，但让你脸颊内侧的肉有点肿胀，嘴巴发紧。[pg]");
               outputText("在你身下，这只兔子似乎正带着几乎无法抑制的欲望欣赏着你的长度。你之前看到的沸腾的欲火压倒了她的克制，她只能在将你的肉棒整个吞下之前，尽力润滑你。一条又长又宽的舌头在你的男子气概上上下舔舐，又热又湿，她可爱的小鼻子在你凸起的静脉上摩擦，带来令人发狂的瘙痒。当她用她长长的龅牙摩擦你柔软的肉体时，一阵不安的颤抖爬上你的心头，但令人惊讶的是，你发现它们非常钝，摸起来几乎很柔软。当你把嘴凑到她尖尖的龟头时，她嘟囔着关于“卵”的事情，并带着饥渴的享受将你的顶端引导到她渴望的嘴唇上。她伴随着满足的吞咽声将你的肉棒滑入她的嘴里，并用舌头的边缘按摩你的龟头下方，压入肿胀的肉体，同时她用上颚的隆起挑逗你的尿道，随着每一次头部摆动，打开和闭合那个娇嫩的洞口。[pg]");
               outputText("作为回应，你更加用力地吮吸着兔女郎的肉棒，一次吞下几英寸，直到你的嘴里塞满了这个巧克力色女孩的勃起。在你的头部周围，她屈起膝盖，用脚掌支撑着双腿。她抽搐的小腿带来的跳跃般的兴奋感让她的下半身随之震颤，这也让你嘴里的肉棒带着繁殖者的期待而颤抖。她的阴囊在你面前滚来滚去，椭圆形的睾丸带着急切的感激跳动着，你忍不住用手包裹住它们，感受着从阴囊散发出的热量倾泻在你的手掌中。轻轻地在手中揉捏它们，你能感觉到手掌中迅速充盈的囊袋的重量。你用拇指抚摸着她古铜色的睾丸，一直摸到她阴道的顶端。兔女郎的阴蒂像你小指的指尖一样又硬又大，你用手指在它周围打圈，试图把它从粉红色肉质的包皮里挑逗出来。[pg]");
               outputText("你意识到，你的挑逗和刺激可能是不明智的，因为兔女郎的克制像炎热天气里的雾气一样蒸发了。她的动物本能开始发挥作用，女孩摆动的双腿变成了全尺寸的抽插。凭借惊人的腿部力量，她以越来越长的幅度挺动臀部，直到她的整个屁股像" + (get_noFur() ? "" : " 毛茸茸的") + "橡胶一样在地上弹跳。你试图补偿，但女孩深喉的狂欢是无情的。几秒钟内，她就从你的舌头到了你的扁桃体，再到你的喉咙，她圆锥形的阴茎形状完美，可以直接滑入你的脖子。面对突然的入侵，你开始窒息，但兔子滴落的先列腺液提供了一种令人头晕目眩的麻木感，放松了你的呕吐反射，使你的喉咙肿胀成一个柔软、黏糊糊的隧道，随着小穴般的紧致感而跳动。她随着臀部的节奏摇晃着头，似乎和你渴望得到她的精液一样，渴望得到你的精液。伴随着一声欢快的“吱吱”声，她打开了食道，让嘴在你的肉棒上更深地运作，她宽大、温和的兔子牙齿恰到好处地压迫着你负担过重的静脉，让你的身体一阵阵颤抖。");
               if(get_player().cocks[0].cockLength >= 8)
               {
                  outputText("当她吞下六英寸深时，她的吮吸变得更加急切，双臂环抱住你的臀部，手指抠进你的屁股，将你的胯部拉得更低。");
               }
               if(get_player().cocks[0].cockLength >= 12)
               {
                  outputText("一根一英尺长的兔娘肉棒在你的肺里翻江倒海，你根本无法集中注意力，所以当女孩的绝望爆发时，你完全没有防备。她通过小巧的鼻孔深吸了一口气，然后用尽全力将头撞向你的胯部，用脸操着你的肉棒，直到她喉咙柔软的褶皱被撑开，将长满雀斑的脸颊埋进你的大腿里。");
               }
               outputText("[pg]");
               outputText("兔女郎的胸膛快速起伏，简直就像在过度换气。你意识到她进入了繁殖狂热状态！她用双腿夹住你的头，紧紧地抱住你，然后伴随着一声沉闷的撞击声，将你们俩翻转过来，把她那14英寸长的肉棒深深地捅进了你的喉咙。你瞪大了眼睛，被这根从嘴唇一直延伸到胃部的焦糖色肉柱惊呆了，以至于根本无暇顾及身体突然缺氧的问题。随着她产卵的冲动将这只兔子变成了一头野兽，她的蛋蛋猛烈地撞击着你的鼻子。她那苗条的橄榄色身体的每一寸都在快速、细小的跳跃中与你的身体摩擦，让你们的身体不断地碰撞。她过度活跃的状态为她的抽插和吸吮注入了欢快的活力。这只兔子肌肉发达的身体跳得越来越高，直到她将近一英尺长的巧克力色肉棒在你的嘴里进进出出，谢天谢地，这让你在抽插的间隙有足够的喘息时间通过鼻子呼吸。[pg]");
               outputText("这只矫健的兔女郎把你弄得一阵阵发晕，她那对不算大的B罩杯不断拍打在你的[chest]上，已经在你敏感的皮肤上留下了一道道发麻的红痕。你一只手环住她的腰，把她的胯部紧紧按到自己脸上，另一只手则埋进她湿淋淋的小穴里；兔女郎的阴唇像天鹅绒一样，在你强硬的握弄下分开。你把三根手指探进去，弯起指尖，在女孩颤抖的内壁上一路刮弄，直到她哽咽般的尖叫告诉你，你已经找到了她最敏感的地方。她欢快的蹦跳立刻停了下来，整具身体都在你的怀里发颤。你正为自己的机智反应暗自庆幸，感觉到她的肉棒在你嘴里一阵阵脉动，女孩的高潮显然已经近在眼前。然而，令你大为意外的是，她的睾丸并不只是抽动，而是开始膨胀，其中一颗还猛地缩进了她的体内！你能看到一个蛋形的鼓包沿着她的腹部一路向上，朝她的肉棒移动，于是你赶紧想把头往后撤。兔女郎的双臂猛地伸到你脑后，手指深深抓进你的头发里，试图把你重新按下去，同时对着你的下体发出呻吟。你用力挣开她的钳制，可那枚蛋形鼓包沿着她的肉茎上顶的速度，还是比你把它从自己体内退出去的速度快上一点。被口水润滑的肉茎鼓胀起来，凸起滑过你的嘴唇；就在她的龟头擦过你舌头的瞬间，她狭窄的龟冠猛然膨胀，淫猥地撑开。滚烫而带着刺麻感的精液猛地喷进你嘴里，黏稠的丝缕灌满你的口腔，顺着喉咙往下滑；当你试图吞下她的精液却让食道闭合时，甚至有一股股稀糊状的黏精从你的鼻孔里喷了出来。女孩的精液在你嘴里翻滚了片刻，你发现这团满是精液的黏糊东西，似乎在你的舌头上产下了一枚蛋！[pg]");
               outputText("仍然被狂乱的产卵歇斯底里所控制，兔子咕哝着，把她的肉棒重新塞回你的喉咙，把卵也一起推了进去。当兔子的精液滑下你被精液润滑的脖子，伴随着一声清晰、粗俗的扑通声掉进你的肚子里时，你的皮肤像蘑菇一样膨胀起来。一种难以置信的饱腹感充满了你，就好像你已经吞咽了几个小时的精液和卵。你因为兔子令人麻木的精液而变得头晕目眩，当第二颗卵滑入她的阴茎，她的阴囊瘪下去时，你虚弱地摇了摇头，似乎在说“不要了”。然而，女孩在放荡的热情中走得太远，无法将你的动作视为除了鼓励之外的任何东西，她把鼻子蹭进你的");
               if(get_player().balls > 0)
               {
                  outputText("蛋蛋");
               }
               else if(get_player().hasVagina())
               {
                  outputText("阴蒂");
               }
               else
               {
                  outputText("腹股沟");
               }
               outputText("，胡须伴随着快乐的嗡嗡声振动，她的龅牙热情地按摩着你的根部，迫不及待地想要享用她自己的奶油大餐。她的手从你的后脑勺滑下，沿着你的脖子，顺着你的背部，来到你的屁股，手指环绕着寻找你的[assholeorpussy]。她滑入两根中指，抚摸着你的");
               if(!get_player().hasVagina())
               {
                  outputText("前列腺");
               }
               else
               {
                  outputText("内壁");
               }
               outputText("直到你的高潮压倒了被兔娘操得晕头转向的眩晕感，你达到了顶峰，你那因塞满卵而肿胀的身体喷射出股股苍白的精液，将这个橄榄色皮肤女孩的体内染成了一片雪白。[pg]");
               outputText("她的第二枚卵伴随着脉动的颤抖强行滑下你的喉咙，你能感觉到你的臀部在不堪重负的胃部重量下紧绷着。当第二枚卵从兔女郎十四英寸长阴茎的龟头冠状沟滑出时，你有点害怕它会对你造成什么影响。也许是因为兔女郎的头在你的鸡巴上快乐地跳跃着，做着挤奶般的动作，又或者是因为卵带来的肿胀麻木感，你的身体开始发热，头皮和臀部的肌肉也开始刺痛。你紧闭双眼，在兔女郎卵带来的热量中发出闷哼，令你惊讶的是，你的肚子开始感觉像是被清空了。");
               get_player().refillHunger(60);
               if(get_player().tail.type != 10)
               {
                  if(get_player().tail.type == 0)
                  {
                     outputText("下背部的热量紧紧攥住你的尾骨，你感觉到臀部周围猛地膨胀起一团毛茸茸的触感，紧接着，一条毛茸茸的兔尾巴从你的背部弹了出来，兴奋地抽动着！");
                  }
                  else
                  {
                     outputText("你的尾巴抖动着缩小，慢慢缩回体内，直到只剩下一个小肉突，接着它迅速爆开一团绒毛，变成了一条惹人怜爱的、抽动着的兔子尾巴！");
                  }
               }
               if(get_player().ears.type != 7)
               {
                  outputText("看来接下来轮到你的头顶了。");
                  outputText("你感觉眉毛像是被往上拉扯，眼睛变得越来越大，直到你对周围的每一种颜色和声音都敏锐得近乎痛苦。你摇了摇头，一对又大又软的兔耳在你眼前晃动。");
               }
               outputText("[pg]");
               outputText("伴随着一声满足的轻叹，女孩从你的肉棒上滑落，任由它软趴趴地贴在你的腿上，没有浪费哪怕一滴精液。她的肚子已经");
               if(get_player().cumQ() < 250)
               {
                  outputText("微微隆起");
               }
               else if(get_player().cumQ() < 1000)
               {
                  outputText("明显的粗度");
               }
               else
               {
                  outputText("异常肿胀");
               }
               outputText("，你的精液平息了她产卵的激情。伴随着湿润的吸溜声，她将正在缩小的肉棒从你嘴里拔出，她那奇特精液的甜味还残留在你的唇间。她起身蹲下，给了你的");
               if(get_player().ears.type != 7)
               {
                  outputText("新长出的");
               }
               outputText("耳朵，用拇指和食指调皮地捏了捏。[say:抱歉啦，我也不知道自己怎么了！不过我确实没料到会这样！这倒让我有点想留下来，看看我们能不能生出更多小兔子，]她眨了眨眼。[say:但很遗憾，我得走了！也许以后有时间我会再来找你的。]她给了你一个湿润的轻吻，然后蹦蹦跳跳地离开了，经历了这一切后依然精力充沛。你呻吟了一声，还在从产卵的余韵中恢复。");
               get_player().tail.type = 10;
               get_player().ears.type = 7;
               doNext(get_camp().returnToCampUseOneHour);
               get_player().orgasm("Lips",false);
               get_player().orgasm("Dick");
               dynStats(DynStat.Lib(1),DynStat.Sens(1));
            }
         }
         else
         {
            outputText("如果你们俩都没机会找点乐子，那岂不是很可惜？你抓住这个黑皮肤的女孩，轻轻地把她推倒，在她的脸庞上方悬停了一会儿，把玩着她长满雀斑的脸颊上的胡须。你的逗弄似乎让女孩很兴奋，没过多久，她就透过龅牙喘着粗气，她的硬物僵硬着，随着她急促的心跳而跳动。你翻过身，把你的[legs]放在她耳朵两侧，俯下身，靠近她的胯部，品味着从她汗津津的身体散发出的淡淡甜味。她的阴茎几乎令人生畏，在你面前淫秽地鼓起，一小滴一小滴的先列腺液渗到尖端，形成浓郁的气泡，顺着她焦糖色的皮肤流下。你把脸颊贴在兔女郎的根部，试探性地舔舐她的肉棒，收集那些将她黑色的阴茎染成雪白的精液。她喘着粗气，阴茎在你的脸上抽动，随着她双腿的快速震动而前后摆动。当你尝到她的精液时，你的嘴里会有一种奇怪的麻木感，冷热交替，但让你脸颊内侧的肉有点肿胀，嘴巴发紧。[pg]");
            outputText("在你身下，兔女郎似乎正以难以抑制的欲望欣赏着你的小穴。你之前看到的沸腾的欲火已经压倒了她的理智，她只能勉强克制住自己不把鼻子塞进你火热的裂缝里。她又长又宽的舌头在你的女性部位上下舔舐，又热又湿，她可爱的小胡须摩擦着你的阴唇，带来令人发狂的瘙痒。当她用长长的门牙摩擦你柔软的肉体时，你感到一阵不安，但令人惊讶的是，你发现它们非常钝，摸起来几乎很柔软。当你把嘴凑近她尖尖的龟头时，她嘟囔着什么“卵”，然后饥渴地将牙齿引向你的阴蒂。她用牙齿和舌头抚摸着你敏感的豆豆，就像在弄湿胡萝卜的尖端一样。她带着气喘吁吁的喜悦将舌头滑入你的褶皱中。[say:求求你，求求你，求求你，求求你，]她吟唱着，嘴唇随着每一次呼吸吸吮着你的汁液。[say:必须产卵，必须繁~殖，]她呜咽着，然后将舌头弹入你内部的迷宫，快速地弹动着，同时她的门牙按摩着你发炎的阴蒂，她每一次点头都让你从那令人愉悦的冰冷门牙中感到一阵颤抖的虚弱。[pg]");
            outputText("作为回应，你更加用力地吮吸着兔女郎的肉棒，一次吞下几英寸，直到你的嘴里塞满了这个巧克力色女孩的勃起。在你的头部周围，她屈起膝盖，用脚掌支撑着双腿。她抽搐的小腿带来的跳跃般的兴奋感让她的下半身随之震颤，这也让你嘴里的肉棒带着繁殖者的期待而颤抖。她的阴囊在你面前滚来滚去，椭圆形的睾丸带着急切的感激跳动着，你忍不住用手包裹住它们，感受着从阴囊散发出的热量倾泻在你的手掌中。轻轻地在手中揉捏它们，你能感觉到手掌中迅速充盈的囊袋的重量。你用拇指抚摸着她古铜色的睾丸，一直摸到她阴道的顶端。兔女郎的阴蒂像你小指的指尖一样又硬又大，你用手指在它周围打圈，试图把它从粉红色肉质的包皮里挑逗出来。[pg]");
            outputText("你意识到，自己刚才那番挑逗和撩拨或许并不明智——兔女郎的克制就像热天里的雾气一样瞬间蒸发。她的兽性本能被激发出来，原本上下晃动的双腿变成了实打实的挺送。凭着惊人的腿力，她一次比一次更深地顶起臀部，直到整个屁股都像" + (get_noFur() ? "" : "毛茸茸的") + "橡胶一样从地上弹起。你试图配合她的节奏，可这女孩兴高采烈地操弄你脸的劲头根本停不下来。短短几秒内，她就从你的舌头一路顶到扁桃体，再深入喉咙；那根圆锥状的肉棒仿佛天生就是为了滑进你的咽喉而生。突如其来的侵入让你开始呛咳，但兔女郎不断渗出的先列腺液带来一阵令人发软的麻木感，放松了你的呕吐反射，也让你的喉咙肿胀成一条柔软黏弹的通道，像小穴般紧紧搏动。她的脑袋配合着腰胯的节奏来回摇动，看起来既急着让你高潮，也急着把自己的高潮送给你。伴着一声欢快的“吱”声，她把嘴张大到你难以置信的程度，将宽厚的舌头探进你的下体，用如肉棒般粗实的肌肉填满你；她轻轻刮动的兔牙恰到好处地压在你被过度刺激的阴蒂上，激得你全身都因高潮的战栗而发抖。[pg]");
            outputText("兔女郎的胸膛快速起伏，简直就像在过度换气。你意识到她进入了繁殖狂热状态！她用双腿夹住你的头，紧紧地抱住你，然后伴随着一声沉闷的撞击声，将你们俩翻转过来，把她那14英寸长的肉棒深深地捅进了你的喉咙。你瞪大了眼睛，被这根从嘴唇一直延伸到胃部的焦糖色肉柱惊呆了，以至于根本无暇顾及身体突然缺氧的问题。随着她产卵的冲动将这只兔子变成了一头野兽，她的蛋蛋猛烈地撞击着你的鼻子。她那苗条的橄榄色身体的每一寸都在快速、细小的跳跃中与你的身体摩擦，让你们的身体不断地碰撞。她过度活跃的状态为她的抽插和吸吮注入了欢快的活力。这只兔子肌肉发达的身体跳得越来越高，直到她将近一英尺长的巧克力色肉棒在你的嘴里进进出出，谢天谢地，这让你在抽插的间隙有足够的喘息时间通过鼻子呼吸。[pg]");
            outputText("这只矫健的兔女郎把你弄得一阵阵发晕，她那对不算大的B罩杯不断拍打在你的[chest]上，已经在你敏感的皮肤上留下了一道道发麻的红痕。你一只手环住她的腰，把她的胯部紧紧按到自己脸上，另一只手则埋进她湿淋淋的小穴里；兔女郎的阴唇像天鹅绒一样，在你强硬的握弄下分开。你把三根手指探进去，弯起指尖，在女孩颤抖的内壁上一路刮弄，直到她哽咽般的尖叫告诉你，你已经找到了她最敏感的地方。她欢快的蹦跳立刻停了下来，整具身体都在你的怀里发颤。你正为自己的机智反应暗自庆幸，感觉到她的肉棒在你嘴里一阵阵脉动，女孩的高潮显然已经近在眼前。然而，令你大为意外的是，她的睾丸并不只是抽动，而是开始膨胀，其中一颗还猛地缩进了她的体内！你能看到一个蛋形的鼓包沿着她的腹部一路向上，朝她的肉棒移动，于是你赶紧想把头往后撤。兔女郎的双臂猛地伸到你脑后，手指深深抓进你的头发里，试图把你重新按下去，同时对着你的下体发出呻吟。你用力挣开她的钳制，可那枚蛋形鼓包沿着她的肉茎上顶的速度，还是比你把它从自己体内退出去的速度快上一点。被口水润滑的肉茎鼓胀起来，凸起滑过你的嘴唇；就在她的龟头擦过你舌头的瞬间，她狭窄的龟冠猛然膨胀，淫猥地撑开。滚烫而带着刺麻感的精液猛地喷进你嘴里，黏稠的丝缕灌满你的口腔，顺着喉咙往下滑；当你试图吞下她的精液却让食道闭合时，甚至有一股股稀糊状的黏精从你的鼻孔里喷了出来。女孩的精液在你嘴里翻滚了片刻，你发现这团满是精液的黏糊东西，似乎在你的舌头上产下了一枚蛋！[pg]");
            outputText("仍被那阵疯狂产卵的亢奋支配着，兔女闷哼一声，又把她的阴茎狠狠顶回你的喉咙，把那枚卵也一并往里推去。随着兔女的精液顺着你被精液润滑过的喉颈滑下，咕咚一声粗俗而清晰地坠进你的肚子里，你的皮肤都被撑得鼓胀起来。一种难以置信的饱胀感充满了你，仿佛你已经吞了好几个小时的精液和卵。兔女那带着麻意的精液让你头晕目眩；当第二枚卵滑进她的肉棒、她的囊袋瘪下去时，你虚弱地摇了摇头，仿佛在说“不要了”。然而，这女孩早已沉溺在放荡的情欲中，完全把你的动作当成了鼓励。她把鼻尖埋进你的外阴，胡须随着愉快的轻哼微微颤动，两颗兔牙热切地摩挲着你，迫不及待地想享用属于她的奶油大餐。她的双手从你的后脑滑下，沿着脖颈一路抚过背脊，来到你的臀部，手指绕过去寻找你的括约肌。她把两根中指一起探入，用手指和舌头抚弄你的内壁，直到高潮冲散了你被兔女折腾得昏沉的意识。你再次攀上顶点，被卵撑胀的身体向那橄榄肤色女孩抽动的鼻尖喷出一股股汹涌的爱液。[pg]");
            outputText("她的第二枚卵伴随着阵阵颤动强行挤入你的喉咙，你能感觉到你的臀部在不堪重负的胃部重量下紧绷着。当第二枚卵从兔女郎十四英寸长肉棒那膨大的龟头冠状沟滑出时，你有些害怕它会对你造成什么影响。也许是因为兔女郎的头在你阴蒂上欢快地起伏着进行榨乳般的动作，又或者是卵带来的肿胀麻木感，你的身体开始发热，头皮和臀部传来阵阵酥麻。你紧闭双眼，在兔卵带来的热量中闷哼着，令你惊讶的是，你的肚子开始感觉像被排空了一样。");
            if(get_player().tail.type != 10)
            {
               if(get_player().tail.type == 0)
               {
                  outputText("下背部的热量紧紧攥住你的尾骨，你感觉到臀部周围猛地膨胀起一团毛茸茸的触感，紧接着，一条毛茸茸的兔尾巴从你的背部弹了出来，兴奋地抽动着！");
               }
               else
               {
                  outputText("你的尾巴抖动着缩小，慢慢缩回体内，直到只剩下一个小肉突，接着它迅速爆开一团绒毛，变成了一条惹人怜爱的、抽动着的兔子尾巴！");
               }
            }
            if(get_player().ears.type != 7)
            {
               outputText("看来接下来轮到你的头顶了。");
               outputText("你感觉眉毛像是被往上拉扯，眼睛变得越来越大，直到你对周围的每一种颜色和声音都敏锐得近乎痛苦。你摇了摇头，一对又大又软的兔耳在你眼前晃动。");
            }
            outputText("[pg]");
            outputText("伴随着一声满足的叹息，女孩抹去脸上你那滑腻的蜜液，并在你的阴蒂上满意地舔了最后一下。伴随着湿润的吸溜声，她将正在缩小的肉棒从你嘴里拔出，她精液那甜美冰凉的味道还残留在你的唇上。她蹲起身，给了你的");
            if(get_player().ears.type != 7)
            {
               outputText("新长出的");
            }
            outputText("耳朵，用拇指和食指调皮地捏了捏。[say:抱歉啦，我也不知道自己怎么了！不过我确实没料到会这样！这倒让我有点想留下来，看看我们能不能生出更多小兔子，]她眨了眨眼。[say:但很遗憾，我得走了！也许以后有时间我会再来找你的。]她给了你一个湿润的轻吻，然后蹦蹦跳跳地离开了，经历了这一切后依然精力充沛。你呻吟了一声，还在从产卵的余韵中恢复。");
            get_player().tail.type = 10;
            get_player().ears.type = 7;
            doNext(get_camp().returnToCampUseOneHour);
            get_player().orgasm("Vaginal");
            dynStats(DynStat.Lib(1),DynStat.Sens(1));
         }
      }
      
      public function adjathaEggsplosions() : void
      {
         clearOutput();
         outputText("你在平原上的跋涉被一声尖锐刺耳的哭喊声打断，把你从脑海中飘荡的白日梦中惊醒。一个处于困境中的女人的尖锐哀号吸引了你的注意力，你急忙越过起伏的山丘，寻找这嚎叫声的来源。你不太确定会遇到什么，但当骚动的源头进入视线时，你不得不承认这并不完全是你想象中的景象。");
         outputText("[pg]躺在一个浅谷里的是一个");
         if(!isEaster())
         {
            outputText("暗色皮肤的");
         }
         else
         {
            outputText("巧克力");
         }
         outputText("肤色的女人。在她的");
         if(!isEaster())
         {
            outputText("晒黑的");
         }
         else
         {
            outputText("焦糖");
         }
         outputText("头上，两对巨大的兔耳无助地前后晃动着，她正沮丧而紧张地摇着头。她修长而肌肉发达的双腿在徒劳的痛苦中踢打着地面，不过你注意到她的脚很长且毛茸茸的，末端是厚厚的爪子，底部有小小的粉色肉垫。她的双臂似乎被一根绳索绑在背后，将她固定在一对黄褐色的巨石上。在她的双腿之间，一根十四英寸长的肉棒正跳动着，完全挺立，并渗出");
         if(!isEaster())
         {
            outputText("稀薄的、喷涌而出的先列腺液");
         }
         else
         {
            outputText("浓稠的、糖浆般的白浊");
         }
         outputText("。这无疑是个兔女郎，但谁会费这么大劲把她绑起来，然后就这么一走了之呢？");
         outputText("[pg]当你靠近时，她注意到了你，将全部注意力转向你，她那长满雀斑的脸庞上，每一个毛孔都滴落着绝望，");
         if(!isEaster())
         {
            outputText("橄榄色");
         }
         else
         {
            outputText("肉桂色");
         }
         outputText("的皮肤。[say: 哦，谢天谢地，]她喘着粗气，舌头从小巧的龅牙下伸了出来。[say: 你必须帮帮我，]这位");
         if(!isEaster())
         {
            outputText("咖啡色");
         }
         else
         {
            outputText("太妃糖色");
         }
         outputText("皮肤的女人恳求道。[say: 我本来在做我自己的事，突然一个豺狼人女士冲过来把我打晕了！等我醒来时，她已经把我绑了起来，说要把我留在这里，作为入侵她领地的惩罚。我已经无助地待了好几个小时了，怪物们不断地发现我！]你注意到一股苍白的精液不断从她双腿间流出——这是那些在你之前发现她的人留下的黏糊糊的痕迹。看了一眼地面，肥沃的土壤上有几十个脚印，大多数凹陷处都积聚着精液。考虑到她刚才发出的嘈杂声，难怪这片区域的所有东西似乎都发现了她，并在她身上发泄了欲望。");
         outputText("[pg][say: 这还不是最糟糕的部部部部分！]她呻吟着，双膝紧紧夹在一起，试图摩擦她那无人安抚、正突突跳动的勃起肉棒的根部。你注意到她肉棒根部闪烁着微弱的金属光泽，意识到那个豺狼人给她留下了一个青铜屌环。由于双手被绑在身后，这个兔女郎在被任何有性欲的生物操了一整天后，一直无法发泄出来。你突然想到什么，凑近看了看她被绑在上面的巨石。果不其然，你误以为是深色、形状奇特的球形石头的，其实是兔女郎的蛋蛋。黝黑的表面因胀满的需求而紧绷，沉重的负担让她紧绷的睾丸像气球一样膨胀，里面装满了跳动着的卵。[say: 求求求求你了！你得放我走！这压力太难受了！]她说话时，你注意到她眼中闪过一丝危险的光芒，正带着疯狂的眼神盯着你的[ass]。如果你愿意，你可以放她走，或者像之前来过的所有人一样使用她。或者，你可以让她继续被绑着，按照你自己的方式把她的卵弄出来。");
         outputText("[pg]你要怎么做？");
         menu();
         addButton(0,"放了她",freeHerOhGodWhyDidYouDoThis);
         if(get_player().hasVagina())
         {
            addButton(1,"被注卵",getEggflated);
         }
         if(get_player().hasCock())
         {
            if(get_player().hasCockThatFits(40))
            {
               addButton(2,"操她",fuckTheEggBoundBun);
            }
            else
            {
               outputText("<b>你太大了，操不了她！</b>");
            }
         }
         setExitButton();
      }
   }
}

