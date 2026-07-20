package classes.scenes.dungeons
{
   import classes.CoC;
   import classes.DynStat;
   import classes.DynStatOp;
   import classes.ImageManager;
   import classes.ItemType;
   import classes.Monster;
   import classes.Output;
   import classes.PerkLib;
   import classes.Player;
   import classes.StatusEffects;
   import classes.Vagina;
   import classes._FlagDict.FlagDict_Impl_;
   import classes.display.SpriteDb;
   import classes.globalFlags.KFLAGS;
   import classes.internals.Utils;
   import classes.items.ArmorLib;
   import classes.items.ConsumableLib;
   import classes.items.Weapon;
   import classes.items.WeaponLib;
   import classes.scenes.Camp;
   import classes.scenes.Inventory;
   import classes.scenes.combat.Combat;
   import classes.scenes.dungeons._DungeonRoomConst.DungeonRoomConst_Impl_;
   import classes.scenes.dungeons.deepCave.EncapsulationPod;
   import classes.scenes.dungeons.deepCave.ImpHorde;
   import classes.scenes.dungeons.deepCave.ValaScene;
   import classes.scenes.dungeons.deepCave.Zetaz;
   import classes.statusEffects.combat.Immobilized;
   import coc.view.CoCButton;
   import flash.Boot;
   import haxe.IMap;
   import haxe.ds.IntMap;
   
   public class DeepCave extends DungeonAbstractContent
   {
      
      public var valaScene:ValaScene;
      
      public function DeepCave()
      {
         if(Boot.skip_constructor)
         {
            return;
         }
         valaScene = new ValaScene();
         super();
      }
      
      public function zetazBadEndEpilogue() : void
      {
         clearOutput();
         if(get_player().get_gender() == 2)
         {
            get_images().showImage("badend-impbirth");
            outputText("曾经的勇者[name]，被所有从她最初攻势中活下来的小恶魔轮番强奸。她的心智再也没能从那场最初的乱交中恢复过来，甚至发现自己很乐意被称作“肉母牛”。她很快成了泽塔兹不断壮大的子嗣中最受宠的存在；而她的生育能力，以及迅速缩短的孕育时间，更是让它们全都大吃一惊。短短几个月内，她产下一窝窝小主人的速度甚至超过了瓦拉。不到一年，她的身体已被调教得无比适应，子宫也被撑得足够宽大，可以随时让好几窝胎儿同时在体内成长。[pg]");
            outputText("肉母牛的小穴或嘴巴很少有空闲的时候，她乐于服侍任何送到她面前的雄性。她的主人甚至抓来了蜂娘，这样肉母牛的屁股就能像她的肚子一样一直怀孕。肉母牛开始深爱着她的主人，随着她不断增长的生育小恶魔的能力，她能够孵化出足够的军队，让泽塔兹挑战莉希丝的军队。小恶魔们从未成功推翻老恶魔领主，但土地最终被一分为二，由两个不断壮大的恶魔帝国瓜分。");
         }
         else if(get_player().get_gender() == 3)
         {
            get_images().showImage("badend-lethice");
            outputText("勇者在接下来的几天里被反复操弄和洗脑，直到泽塔兹确信她明白了自己在这个世界上的地位。一旦她变得完全服从，他们就解开了她的束缚。是时候把她交给莉希丝了。");
            if(get_player().wings.type != 6 || get_player().wings.type != 7)
            {
               outputText("泽塔兹给了她一只较弱的小恶魔让她插入，并教她如何用她那崭新的恶魔双翼飞行。");
            }
            else
            {
               outputText("泽塔兹给了她一只较弱的小恶魔，让她在旅途中插入。");
            }
            outputText("准备就绪后，泽塔兹、勇者和几十只小恶魔飞向了山顶。[pg]");
            outputText("勇者被献给了莉希丝，这位恶魔女主人对泽塔兹的礼物非常满意，赏赐给他一对妙龄女奴，并提拔他统领一支由同类组成的小型军队。小恶魔们离开后，莉希丝开始调教勇者，只要她有兴致，就把她当成性玩具。其余时间里，勇者都被绑着，无法高潮，被非人的性欲折磨着，但她并不介意。当莉希丝允许她释放时，勇者的高潮是如此漫长而强烈，以至于尽管她不得不忍受如此压抑的欲望，她还是深深爱上了她的女主人。");
         }
         else
         {
            get_images().showImage("badend-impbirth");
            outputText("从那以后，小恶魔们再也没有把勇者从那个房间里放出来过。几周后，“他”生下了一窝健康的小恶魔，而怀孕产生的荷尔蒙");
            if(get_player().biggestTitSize() < 1)
            {
               outputText("让“他”长出了一对还算丰满的乳房。");
            }
            else
            {
               outputText("让她原本就傲人的双峰胀满了乳汁。");
            }
            outputText("在那之后，小恶魔们真的喜欢上了她，并解开了她的束缚。不过她也没什么机会站起来；只要一有机会，她就会被狠狠地操弄。她已经上瘾了。凭借她惊人的性欲和不断的交配，留下来成了一个轻松的选择。[pg]");
            outputText("几个月后，勇者开始适应她的新生活，并开始以更短的孕期生下更大窝的小恶魔。她已经成为了理想的育母，她的世界观缩小到了两个强烈的首要任务：获取精液，以及生育。");
         }
         get_player().orgasm("Generic");
         var _loc1_:Player = get_player();
         _loc1_.set_HP(_loc1_.get_HP() + 150);
         get_game().gameOver();
      }
      
      public function unlockZetazDoor() : void
      {
         get_connectivity()[12] = DungeonRoomConst_Impl_.fromStr("NSEW");
         get_connectivity()[7] = DungeonRoomConst_Impl_.fromStr("ES");
         get_dungeons().remakeMaps();
      }
      
      public function takeBondageStraps() : void
      {
         clearOutput();
         var _loc1_:IMap = KFLAGS.flags;
         FlagDict_Impl_.arrayWriteInt(_loc1_,129,FlagDict_Impl_.arrayReadInt(_loc1_,129) + 1);
         get_inventory().takeItem(get_armors().BONSTRP,runFunc);
      }
      
      public function sexualTortureTightenZetaz() : void
      {
         var _g:Combat;
         clearOutput();
         outputText("[say:蠢货，]你一边嘲弄着，一边把带子勒得更紧。又一波足以射出来的精液堵在体内，让泽塔兹竟痛苦地嚎哭起来。你可不想在搜找他的地图时让他挣脱束缚，于是你把绳子从他腿下绕过去，用空出来的一端把他的双腕反绑在背后。最后又摸了摸他胀硬的肉棒，算是讨个好运，随后便任由他在欲火中挣扎，自己去寻找那张地图。要无视那些哀鸣和哭叫并不容易，但你还是做到了。[pg]");
         outputText("泽塔兹的书桌靠墙摆着，和其他家具隔着一段距离，看起来有些孤零零的。你起身走近，途中顺脚踢了小恶魔的肚子一脚，好让周围稍微清静点。书桌明面上有两个抽屉，中间隔着一条分隔板，但乍一看，这件家具里似乎没有足够的空间藏下暗抽屉或夹层。想要找出这张“地图”，还得更仔细地检查一番。[pg]");
         get_images().showImage("item-zMap");
         outputText("你在书桌周围戳戳点点，检查木制结构内部是否有暗格、薄弱点或隐藏的门闩。它似乎不愿交出自己的秘密，你甚至有一瞬间怀疑它是否具有某种欺骗能力，但随后你便觉得这个想法太疯狂了。尽管这个地方很疯狂，但你怀疑泽塔兹的卧室里是否会有一件被附身的家具。你烦躁地拉开每一个抽屉，但似乎没有什么异常。你嘟囔着，猛地把它们关上，愤怒地扭动着把手。你听到一声几乎听不见的“咔哒”声，抽屉之间的隔板现在微微向前突出，刚好可以让你紧紧抓住。[pg]");
         outputText("当你轻轻拉动隔板时，隔板表面后未完工的木头摩擦着你的指尖，露出一个狭窄的隐藏隔间。里面唯一的物品是一张详细的地图，描绘了这座山及其上部区域。虽然这张秘密图表相当粗糙，但它描绘了一条蜿蜒的小径，绕过了许多鹰身女妖的巢穴、牛头人的洞穴以及各种无法辨认的陷阱，最终到达云雾缭绕的山峰。一旦到达顶部的恶魔防御工事，这幅画就失去了很多细节，但一旦你进入了莉希丝的权力中心，追踪她应该不会太难，对吧？[pg]");
         outputText("你听到石头上微弱的爪子抓挠声，惊恐地转过身，但那里什么也没有。甚至连泽塔兹也不在。你想象着那个被部分五花大绑的小恶魔从他自己的洞穴里冲出来，跑进茂密的树林，他那肿胀的阴茎随着每一步危险地上下摆动，这个荒谬的画面让你脸上露出了笑容。[pg]");
         outputText("<b>(获得关键物品：泽塔兹的地图！)</b>");
         get_player().createKeyItem("Zetaz\'s Map",0,0,0,0);
         _g = get_combat();
         doNext(function():void
         {
            _g.cleanupAfterCombatNewPage();
         });
      }
      
      public function sexualTortureReleaseZetaz() : void
      {
         var _g:Combat;
         clearOutput();
         outputText("出于一时的仁慈");
         if(get_player().get_lust() > 60 || get_player().lib > 60 || get_player().cor > 60)
         {
            outputText("，又或许是出于某种变态的念头，");
         }
         outputText("你松开绷紧的细绳，任它散开。它立刻从泽塔兹的肉棒上弹开，被小恶魔颤抖的胯间喷涌而出的压力甩过房间。一颗颗凸起从他肉棒根部一路涌向顶端，像波浪般起伏；等这道“浪”抵达龟头冠状沟时，几乎已经胀大了一倍。与此同时，他的尿道口张开，以炮击般的力道倾泻出小恶魔积攒已久的存货。黏稠的精液向上激射，啪地溅在天花板上，第一道“水柱”给屋顶抹上一层白浊后，还在上面停留了片刻。这场喷发慢慢平息，最后一股精液落回泽塔兹身上。[pg]");
         outputText("你感受着下一团隆起沿着那根恶魔肉棒向上涌来，从你轻柔抚弄的指尖下挤过，不由得惊叹于那股力道。下一波喷发没有前一次那样爆裂的冲击力，但速度上的不足，全由惊人的量弥补了回来。泽塔兹的身体弓起又抽搐，拼命想把积压了足足三次高潮份量的恶魔精液挤出来，轻而易举地将一团飞弹般的浓稠精块射到床上，炸开一大片显眼的白浊。第三股白液无论冲力还是份量都不及前两次，却仍轻松超过大多数人整次高潮的射精量。你脸上带着心领神会的笑意，继续撸出他残余的精液，一边数着每一股射出的白绳——四、五、六、七、八、九、十……十一。[pg]");
         outputText("小恶魔把自己的身体、床头柜、床、一面墙，甚至天花板都弄得湿漉漉的，但这份快感也不是没有代价。泽塔兹闭上了眼睛——这个小家伙昏过去了。你得意地笑了笑，在他的头发上把手擦干净，然后走向书桌。不知怎的，它竟然躲过了那场精液洪流，看起来几乎像是冷眼旁观着这间屋子里其他地方都被堕落景象吞没。它正面有两个可见的抽屉，中间隔着一道分隔板，但乍一看，这件家具里似乎并没有足够的空间藏下暗屉或暗格。[pg]");
         get_images().showImage("item-zMap");
         outputText("你在书桌周围戳戳点点，检查木制结构内部是否有暗格、薄弱点或隐藏的门闩。它似乎不愿交出自己的秘密，你甚至有一瞬间怀疑它是否具有某种欺骗能力，但随后你便觉得这个想法太疯狂了。尽管这个地方很疯狂，但你怀疑泽塔兹的卧室里是否会有一件被附身的家具。你烦躁地拉开每一个抽屉，但似乎没有什么异常。你嘟囔着，猛地把它们关上，愤怒地扭动着把手。你听到一声几乎听不见的“咔哒”声，抽屉之间的隔板现在微微向前突出，刚好可以让你紧紧抓住。[pg]");
         outputText("你轻轻一拉，隔板表面后方未经打磨的木料擦得指尖发疼，露出一个狭窄的暗格。里面唯一的东西是一张详尽标注了这座山及其上部区域的地图。尽管这张秘密图纸相当粗糙，却画出了一条蜿蜒的小径，能绕开众多鹰身女妖的巢穴、牛头人的洞窟，以及各种看不出名堂的陷阱，最终抵达云雾笼罩的山巅。图画到了山顶的恶魔工事处便丢失了大半细节，不过只要你踏入莉希丝权力的核心，要找到她应该也没那么难吧？[pg]");
         outputText("你听见爪子在石头上轻轻刮擦的声音，警觉地转过身去，却什么也没看到。连泽塔兹也不见了。你想象着那只浑身沾满精液的小恶魔从自己的洞穴里一路狂奔，钻进幽深的树林，那荒唐的画面让你不由得露出笑容。[pg]");
         outputText("<b>(获得关键物品：泽塔兹的地图！)</b>");
         get_player().createKeyItem("Zetaz\'s Map",0,0,0,0);
         _g = get_combat();
         doNext(function():void
         {
            _g.cleanupAfterCombatNewPage();
         });
      }
      
      public function sexualInterrogation() : void
      {
         clearOutput();
         outputText("你俯下身，脸凑到泽塔兹上方，直视着他的眼睛，解释道，[say: 我可不能让一个知道怎么去恶魔总部的人，在告诉我怎么去之前就死掉，对吧？][pg]");
         outputText("[say: 滚开！你休想从我这里得到任何东西，]战败的恶魔反驳道，[say: 你还不如直接杀了我——我绝对不会帮像你这样的" + get_player().mf("混蛋","婊子") + "！][pg]");
         outputText("你坏笑着，从泽塔兹的梳妆台上抓起一根皮条，在他鼻子上方晃来晃去。[pg]");
         get_images().showImage("monster-zetaz");
         outputText("你低语道，[say: 我只需要这个。][pg]");
         outputText("小恶魔抬起头，脸上满是困惑，问道，[say: 我不觉得一根绳子能帮你什么忙，" + get_player().mf("白痴","荡妇") + "。][pg]");
         outputText("[say: 等一下，我愚蠢的小告密者，]你嘲讽着，掀起他的遮阴布，露出里面隐藏的坚硬。它脉动着，仅仅因为你短暂的触摸和暴露在空气中，就变得更硬，长了一英寸。也许小恶魔并不像他想让你认为的那样能控制自己的性欲？你把皮条绕在他的根部，迅速打了个结，绑得足够紧，让泽塔兹不舒服地闷哼了一声。[say: 呃！搞什么鬼！？嗷，该死！][pg]");
         outputText("尽管他抗议和哭喊，你还是看着他的肉棒进一步膨胀，直到看起来远远超出了他正常的容量。当你用手指滑过他的尿道时，它抽搐着，流出堕落的先列腺液，看着那根肉棒因为轻柔的触摸而上下跳动和抽搐。那感觉一定很好。泽塔兹证实了你的直觉，他把臀部抬离地面，淫荡地摇晃着，试图在你的手上摩擦。你没有拒绝他渴望的摩擦，用手尽可能多地包裹住他的肉棒，直到稳定的液体从他的尿道中流出。他恶魔般阴茎上被污染的结节开始膨胀和脉动，预示着他的高潮即将到来。[pg]");
         outputText("他绝对不能射精——直到你得到你需要的信息！你流畅地将手指滑到他的根部，当他的高潮开始涌动时，你的手猛地拍在他的胯部。在你的对手能够释放之前，你一只手用力挤压，另一只手拉紧皮绳，夹住根部，直到小恶魔的精液被憋在他的腹部。泽塔兹哭喊着，[say: 不-不-不，让我射，求求你让我射，现在-就-要-射。][pg]");
         outputText("没那么好运。你等他的身体停止抽搐，然后回到你的任务上，一只手紧紧抓住他的根部，另一只手开始用坚定、稳定的动作抚摸他，滑过他肉棒上布满颗粒的表面。你的受害者继续乞求和哭泣，但你没有停下来，你停下来收集他漏出的先列腺液，涂抹在他的龟头上。泽塔兹喘息着，呻吟着，在你高效的手淫下，在你的手中颤抖和肿胀。你在手心吐了口唾沫，加快了节奏，开始快速有力地抚摸他，用熟练、从容的动作滑过他被屌环勒得肿胀的肉棒。[pg]");
         outputText("[say: 告诉我怎么找到恶魔首领，我就让你射。别让这事变得比必要的更“硬”，]你低语道。[pg]");
         outputText("恶魔的声音开始发颤，尽管他仍竭力摆出反抗的样子。[say: 不！我、呃、不会让你——噢噢噢——控制我——！][pg]");
         outputText("他的抗议声逐渐变成语无伦次的尖叫和含混呓语，而你用那条紧紧系住的束带，把他的第二次高潮硬生生憋了回去。他的身体再一次在你手中扭动挣扎，被不断攀升的性欲压力折磨着。泽塔兹抬头看向你，眼神哀求，甚至有些斗鸡眼，努力想让自己恢复清醒，可你只是继续套弄个不停。他的睾丸肉眼可见地跳动、颤抖，迫切地想要释放那越积越高的压力。你平静地迎上他的目光，双手继续在那根肿胀的小恶魔阴茎上动作；当他第三次在你掌中变得粗胀时，你露出了心照不宣的笑容。[pg]");
         outputText("[say: 那么，泽塔兹？三次就是你的幸运数字了，还是说我得换只手，继续把你憋回去，直到你发疯为止？]你问道。[pg]");
         outputText("他的双手抓挠着身下的地毯，喘息着喊道：[say: 你赢了，你赢了！书桌里有个暗——啊、啊啊——暗格，里面有张通往莉希丝藏身处的地图。求你了让我射让我射让我射求你啦啊啊啊！][pg]");
         outputText("你要怎么做？");
         menu();
         addButton(0,"\'释放\'",sexualTortureReleaseZetaz).hint("让小恶魔射出来，并把他从束缚中放开。");
         addButton(1,"收紧",sexualTortureTightenZetaz).hint("收紧束带。");
         addButton(2,"了结他",endZetaz).hint("杀了这个小恶魔。毕竟，他罪有应得。");
      }
      
      public function seanNotNow() : void
      {
         spriteSelect(SpriteDb.get_s_sean());
         clearOutput();
         outputText("[say:好吧。等你改变主意了再来找我，]肖恩叹了口气。");
         doNext(runFunc);
      }
      
      public function seanNoDeal() : void
      {
         spriteSelect(SpriteDb.get_s_sean());
         clearOutput();
         FlagDict_Impl_.arrayWriteInt(KFLAGS.flags,130,-1);
         outputText("肖恩点点头，抓起一个包，趁你还没杀他之前拔腿就跑。");
         doNext(runFunc);
      }
      
      public function seanDeal() : void
      {
         spriteSelect(SpriteDb.get_s_sean());
         clearOutput();
         outputText("[say:太棒了！给我点时间收拾一下东西，我就能开门营业了！]这个奇怪的恶魔惊呼道。如果他的故事是真的，那他和其他同类合不来也就不足为奇了。");
         FlagDict_Impl_.arrayWriteInt(KFLAGS.flags,130,1);
         doNext(runFunc);
      }
      
      public function roomZetazChamber() : void
      {
         clearOutput();
         get_images().showImage("deepCave-zChambers");
         outputText("<b><u>泽塔兹的房间</u></b>\n");
         outputText("你踏入了整个洞穴系统中最奢华的房间，惊叹于这座宏伟的住所与你自己粗制滥造的营地之间的天壤之别。石墙上挂满了偷来的挂毯，每一幅看起来都像是从不同的地方搜刮来的。单从这个房间里各种各样的描绘和艺术风格来看，你所见过的曾经居住在玛瑞斯大陆上的种族，恐怕还不到其中的一小部分。每面墙上都挂着一对明亮、无烟的灯笼，里面显然是由魔法发光球体点亮的。房间里摆放着各种偷来的家具，围绕着一张四柱床，床上装饰着精雕细琢的各种肉欲行为的图案。");
         if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,115) == 0)
         {
            outputText("<b>南边有一扇门被门栓锁着，但你轻轻一拉，它就开了。</b>");
            FlagDict_Impl_.arrayWriteInt(KFLAGS.flags,115,1);
            unlockZetazDoor();
         }
         outputText("[pg]");
         if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,114) == 0)
         {
            spriteSelect(SpriteDb.get_s_zetaz());
            outputText("一个熟悉的小恶魔正用困惑的表情看着你。你立刻认出了他的脸——这是泽塔兹！奇怪的是，自从你们上次见面以来，他似乎长大了许多。他现在身高超过四英尺，而且体格也强壮得多！[pg]");
            outputText("泽塔兹抱怨道，[say:不是吧？你居然跑到这里来了！？先是让我丢了工作，现在又打伤我的朋友，还在我的卧室里踩了一地泥！？我受够了！]");
            startCombat(new Zetaz(),true);
         }
      }
      
      public function roomTunnel() : void
      {
         clearOutput();
         get_images().showImage("deepCave-cTunnel");
         outputText("<b><u>洞穴隧道</u></b>\n");
         outputText("这条洞穴隧道向北倾斜向下，向南倾斜向上。你能从南边看到[sun]光，感受到清新的微风，尽管你周围的墙壁和空气都因为湿气而显得潮湿。你发现这个洞穴的地面相当平滑均匀，似乎有人试图将其弄平。你能看到隧道北端有一堵用砖砌成的墙。墙的中央有一扇粗制滥造的木门。");
      }
      
      public function roomTortureRoom() : void
      {
         clearOutput();
         get_images().showImage("deepCave-tRoom");
         outputText("<b><u>肮脏的刑讯室</u></b>\n");
         outputText("你走进一个阴暗潮湿的房间，这里的布置介于牢房和刑讯室之间。这个充满硫磺味的房间天花板上悬挂着各种各样新奇的镣铐、锁链和用途不明的装置。在北墙边，似乎有一个炼金实验室，上面摆满了令人眼花缭乱的各种小瓶、烧瓶和烧杯。在南边，有一个长长的、看起来很邪恶的木架，上面放着一系列越来越大、越来越粗的装置，雕刻成怪异的肉棒形状。");
         if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,119) == 0)
         {
            if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,114) == 0)
            {
               outputText("在远处的角落里，有一个娇小的女人背对着你，被手铐软绵绵地吊着，保持着半跪的姿势。浓密的紫色头发一缕缕地纠结在一起垂落下来，偶尔闪烁着粉红色的光芒。在她的上方，有一块失去光泽的青铜铭牌，你觉得上面写着“瓦拉”，但在小恶魔的涂鸦下，你无法确定。她似乎没有意识。[pg]");
               outputText("直到你走近，你才注意到她背上长着巨大的蜻蜓翅膀，苍白的皮肤上隐隐散发着阳光般微弱的光芒。如果这个女孩不是将近4英尺高，你肯定会发誓她是个妖精，就像你在森林里遇到的那些一样。如果房间中央被精液堵塞的排水沟能说明什么的话，小恶魔们肯定是在利用她来满足他们变态的欲望。当你走得足够近，看到玷污她光芒的黑色小印记时，你开始体会到她所忍受的一切。在她的右肩胛骨上，小恶魔们纹上了“小穴”，在左边纹上了“屁股”。沿着她的背部，小恶魔们纹了两列计数记号，从她的肩膀一直往下到肋骨，越过她的屁股，顺着她的腿，甚至到了她的脚底。[pg]");
               outputText("你绕到她身前，惊讶地发现虽然这个妖精女孩瘦得皮包骨头，但她的乳房却大得不成比例。在正常人类身上，它们至少是DD罩杯，但对于她的身高和体型来说，它们简直和她的头一样大。它们随着她缓慢、不均匀的呼吸而晃动，每一次心跳都有微小的乳汁在她的乳头上冒出。如果她没有被拴在天花板上，你怀疑她甚至无法靠自己的力量站立。她的眼睛睁着，但她茫然地盯着前方，对周围的世界毫无察觉，瞳孔在她暗淡的粉红色虹膜中缩小成针尖大小。像这样，她对任何人都没有威胁。你觉得你可以放她走，虽然不清楚她是否有足够的自我意识来移动。或者，你也可以趁机发泄一下欲望。");
               addButton(0,"释放",valaScene.freeValazLooseCoochie);
               if(get_player().get_lust() >= 33 && get_game().shouldraFollower.followerShouldra())
               {
                  addButton(1,"舒尔德拉与瓦拉",get_game().shouldraFollower.shouldraMeetsCorruptVala);
               }
            }
            else
            {
               outputText("[pg]在远处的角落里，有一个娇小的女人背对着你，被手铐软绵绵地吊着，保持着半跪的姿势。浓密的紫色长发结成一缕缕垂下，偶尔闪烁着粉色的光芒。在她上方，有一块失去光泽的青铜铭牌，你觉得上面写着“瓦拉”，但在小恶魔的涂鸦下无法完全确定。她似乎没有意识。[pg]");
               addButton(0,"妖精",valaScene.leftValaAlone);
            }
         }
         else
         {
            outputText("[pg]在远处的角落里，有一副空荡荡的手铐，原本是用来关押瓦拉的，但你早就把她救出来了。");
            get_output().flush();
         }
      }
      
      public function roomSecretPassage() : void
      {
         clearOutput();
         get_images().showImage("deepCave-sPassage");
         outputText("<b><u>密道</u></b>\n");
         outputText("这条通道是你见过的整个洞穴中最不适合居住的地方。墙壁和地板几乎只有泥土和岩石，你每一次试探性的动作都会让天花板上爆发出阵阵灰尘。有一瞬间，一阵幽闭恐惧症差点让你失去勇气，但你眨了眨眼，把无孔不入的微粒从眼睛里挤出去，集中精力思考你为什么会在这里。");
         if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,114) == 0)
         {
            outputText("你要找到泽塔兹，为他第一天给你下药的事报仇。");
         }
         outputText("通道南边的一扇简陋的门通向小恶魔的卧室，但通道继续向前延伸，向西急转弯，那里有一扇豪华得多的门，标志着地下通道的另一端。");
         if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,129) == 0)
         {
            outputText("[pg]地板上扔着一对充满恋物癖风格的废弃皮带，半掩在灰尘中。看起来像是地精会穿的东西。真性感！");
            addButton(0,"B.Straps",takeBondageStraps);
         }
      }
      
      public function roomGatheringHall() : void
      {
         clearOutput();
         get_images().showImage("deepCave-gHall");
         outputText("<b><u>聚会大厅</u></b>\n");
         outputText("这个房间显然是某种餐厅或聚会大厅。房间的形状是从周围的石头中开凿出来的，从可见的工具痕迹来看，开凿过程并不怎么精细。两张长木桌占据了房间的大部分空间。它们的做工出奇地好，不过看起来桌腿的一部分被斧头砍掉了，以降低整体高度。你忍不住想知道它们是从哪里偷来的。这些桌子已经很久没清理过了，表面上布满了污渍，还有一些半腐烂的骨头留在破损的桌面上。两排粗制滥造的椅子排列在这些做工精良的桌子两旁，显然是为了适应非常矮小的生物而制作的。");
         if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,116) == 0)
         {
            spriteSelect(SpriteDb.get_s_impMob());
            outputText("[pg]这个地方挤满了二十几只小恶魔，而且它们看起来都不怎么欢迎你。其中一些飞到了空中，剩下的则把你围在中间，将你困住了！看来你只能杀出一条血路了！");
            menu();
            addButton(0,"战斗！",fightImpHorde);
         }
      }
      
      public function roomFungusCavern() : void
      {
         clearOutput();
         get_images().showImage("deepCave-fCavern");
         outputText("<b><u>真菌洞穴</u></b>\n");
         outputText("这个洞穴太大了！虽然你能看到西边有一块巨大的钟乳石边缘，但洞穴的其余部分在二三十英尺外就消失在黑暗中了。地面上覆盖着海绵状的叶形真菌。它们巨大、闪亮、呈紫色，覆盖了光线所能及的整个洞穴地面。");
         if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,117) == 0)
         {
            outputText("洞穴潮湿的空气中弥漫着一种奇怪的甜味，可能来自那些丰富的真菌植物。在视野的边缘，你可以看到一具人形骷髅靠在一根石笋上。在它前面几英尺的地方放着一把细剑，看起来还像新的一样。你要怎么做？");
         }
         else
         {
            outputText("洞穴潮湿的空气中弥漫着它们熟悉的甜味，但你相当确定它们不会再来找你麻烦了。");
         }
         if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,117) == 0)
         {
            addButton(0,"拿剑",getSwordAndGetTrapped);
            if(get_player().canFly())
            {
               addButton(1,"飞向剑",flyToSwordAndGetTrapped);
            }
         }
      }
      
      public function roomEntrance() : void
      {
         clearOutput();
         get_images().showImage("dungeon-entrance-deepcave");
         outputText("<b><u>洞穴入口</u></b>\n");
         outputText("这个洞穴的入口比洞穴本身还要大得多。它看起来完全是自然形成的。在外面，往南看，是一片名副其实的植物丛林。到处都是巨大的树木、藤蔓和蕨类植物。越往北走，洞穴就变得越窄，直到变成一条深埋地下的令人幽闭恐惧的隧道。");
         addButton(11,"离开",exitDungeon);
         if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,114) > 0)
         {
            if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,130) == 0)
            {
               outputText("[pg]洞穴入口外有一个恶魔正无所事事地待着。从他的体型和明显的性别来看，他肯定是个男魅魔。你暂时试着隐藏起来，但他只是在朝对面自己立起来的飞镖盘扔飞镖。什么恶魔会闲坐着玩飞镖啊？");
               addButton(0,"调查",investigate);
            }
            else if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,130) > 0)
            {
               outputText("[pg]那个名叫肖恩的男魅魔在洞穴入口处摆了一个小摊，正忙着整理他的货架和商品。他穿着一套极其端庄的三件套西装，在你靠近时向你点头致意，[say:如果你想买什么就告诉我。我没怎么动过这个洞穴，所以如果你第一次来的时候错过了什么，可以随便逛逛。我几乎不用第一个房间。]");
               addButton(0,"商店",incubusShop);
            }
         }
      }
      
      public function releaseZForInfo() : void
      {
         var _g:Combat;
         clearOutput();
         outputText("你上下打量着这个可怜的小恶魔，冷笑了一声。他闭上眼睛，以为会被就地正法，但你却向他提出了一个条件。如果他能提供更多关于莉希丝以及在哪里能找到她的信息，你就会让他安然无恙地离开，只要他不惹麻烦，你也会避开他。[pg]");
         outputText("[say: 真的吗？]泽塔兹用充满怀疑的语气问道。[say: 妈的，反正我已经是个叛徒了。我接受你的交易。反正这也不费我什么事，就算白给我也愿意。][pg]");
         outputText("安全和自由的承诺让他精神振奋，泽塔兹站了起来，然后");
         if(get_monster().get_HP() < 1)
         {
            outputText("步履蹒跚地");
         }
         else
         {
            outputText("差点被他那充满欲望的肉棒绊倒");
         }
         outputText("走向一张书桌。他灵巧的手指熟练地扭动着最上面抽屉的旋钮，直到家具发出一声轻微的“咔哒”声。他伸手摸向抽屉之间的隔板，拉了一下，露出了一个隐藏的小隔间。隔间的中央是一张详细的山脉及其上游地区的地图。虽然这张秘密图纸相当粗糙，但它描绘了一条蜿蜒的小路，绕过了无数的鹰身女妖巢穴、牛头人洞穴和各种无法辨认的陷阱，直达云雾缭绕的山顶。这幅画一旦到了山顶的恶魔防御工事，就失去了很多细节，但一旦你进入了她的权力中心，追踪莉希丝应该不会那么难吧？[pg]");
         get_images().showImage("item-zMap");
         outputText("一块遮阴布飞过房间，落在你的肩膀上，把你从计划中惊醒。你回头一看，只见泽塔兹正在翻箱倒柜，不顾一切地把他最珍贵的物品扔进一个粗麻布袋里。他全身都在发抖，把袋子绑在一根木棍上，一次也没抬头看你。也许他怕你改变主意？");
         if(get_player().cor > 66)
         {
            outputText("你低头对他坏笑，双臂交叉抱在你的");
            if(get_player().biggestTitSize() < 1)
            {
               outputText("胸前");
            }
            else
            {
               outputText(get_player().breastDescript(0));
            }
            outputText("上，一边享受着他的恐惧，一边考虑着各种可能性");
         }
         else if(get_player().cor > 33)
         {
            outputText("你被逗乐了，轻笑出声，看着这个小混蛋手忙脚乱地收拾家当，享受着报复他之前的机会");
         }
         else
         {
            outputText("你叹了口气，揉了揉太阳穴，看着这个小混蛋手忙脚乱地收拾家当。尽管如此，你实际上对这种情况感到有点内疚");
         }
         outputText("。泽塔兹从南门逃窜而出，一次也没有回头看他旧居的残垣断壁。");
         outputText("[pg]<b>(获得关键物品：泽塔兹的地图！)</b>");
         get_player().createKeyItem("Zetaz\'s Map",0,0,0,0);
         _g = get_combat();
         doNext(function():void
         {
            _g.cleanupAfterCombatNewPage();
         });
      }
      
      public function malesZetazOverPtII() : void
      {
         clearOutput();
         get_images().showImage("zetaz-loss-male");
         outputText("当你醒来时，喉咙深处有一种像沙漠一样干燥、像砂纸一样的感觉，又一声呻吟从你嘴里逸出。口塞还在那里，轻易地阻止了你试图舔舐干裂嘴唇的舌头，但脊椎上爆发出的快感让你很难为此感到不安。臀部摇晃着，你不断地从高潮中喷射，感受着每一次滚烫的爆发从你的男子气概中喷涌而出，直到欲望的浪潮退去，你睁开眼睛。你在一个昏暗的洞穴里，就是他们曾经用来关押瓦拉的那个，并且以类似的方式被锁在墙上。[pg]");
         outputText("当你观察房间时，你意识到顺着脊髓滑上的快感并没有停止，你的整个身体都在有节奏地颤抖。你带着一种难以置信的、仍然处于药物作用下的困惑表情往下看，看到了你最意想不到的东西。不知何故，[eachcock]已经缩小到不到原来的一半大小");
         if(get_player().balls > 0)
         {
            outputText("，而且你的蛋蛋完全消失了");
         }
         outputText("！就在你那小巧的肉棒下方，一根巨大的小恶魔肉棒正在你那崭新、湿润的阴道里进进出出，发出多汁的拍打声。你——你是个双性人！？你的老二怎么了？[pg]");
         outputText("在你高潮后，附近一个阴茎疲软、脸上带着无聊但疲惫表情的小恶魔走上前来，在你的阴茎上涂抹了一些奇怪的、刺鼻的药膏，一边涂一边对着你轻笑，[saystart]嘿嘿，你的");
         if(get_player().cockTotal() == 1)
         {
            outputText("肉棒");
         }
         else
         {
            outputText("鸡巴");
         }
         outputText("会变得特别小");
         if(get_player().cockTotal() == 1)
         {
            outputText("它");
         }
         else
         {
            outputText("它们");
         }
         outputText("会让婴儿的看起来都显得巨大。老板说我们必须在你每次高潮后给你涂抹缩形膏，所以当我们轮奸你时，尽量不要射太多，好吗？哦对了，我差点忘了，我还要注射点东西……[sayend][pg]");
         outputText("小恶魔拿起一个印有黑色“Gro+”字样的小玻璃注射器。看到上面的字，你的眼睛睁得大大的。随着你的男性特征缩小，小恶魔漫不经心地把它拨到一边，将针尖对准你那小小的肉芽——他们打算把你的鸡巴缩到没有，然后给你的阴蒂注射满生长化学物质！他猛地扎了进去，剧痛瞬间点燃了你的世界，但绑在你身上的束缚让你无法逃脱，也无法在挣扎中伤到自己。你的阴蒂内部爆发出一阵热流，它肉眼可见地肿胀起来，直到几乎达到了你那正在缩小的鸡巴的大小。你的强奸犯，或者说以你现在的发情程度来说是“性伴侣”，在你体内用力抽插并膨胀起来，用恶魔鸡巴上粗糙的突起摩擦着你的肉壁。感觉太爽了，以至于你当场又迎来了一次高潮。[pg]");
         outputText("随着滚烫、污浊的精液填满你的子宫，你的身体开始痉挛并喷水，射精的力量甚至让你那越来越小的鸡巴也跟着颤抖起来。精液溅到了小恶魔的角和额头上，但他似乎并不怎么在意，只是瘫倒下来，将他那依然坚挺的肉棒从你那渴望鸡巴的女性小穴中抽了出来。你放肆地呻吟着，依然在喷射，而那个“医生”小恶魔则在[eachcock]上又涂了一层缩形膏，迅速地缩短");
         if(get_player().cockTotal() == 1)
         {
            outputText("它，直到它");
         }
         else
         {
            outputText("它们，直到它们");
         }
         outputText("即使在勃起状态下也只有不到三英寸长。他又拔出另一个注射器，将针头猛地扎进你依然酸痛的阴蒂，让它肿胀到几乎五英寸长，并像你曾经的男根一样颤抖着。[pg]");
         outputText("[saystart]现在你开始看起来像个真正的婊子了。");
         if(get_player().biggestTitSize() < 2)
         {
            outputText("如果没有一对像样的奶子，看起来就不太对劲，但老板说新的生育母狗不需要奶子。不过这确实让人很难对操你那个新屄感到兴奋……");
         }
         else
         {
            outputText("有了那样的奶子和漂亮湿润的小穴，其他家伙很快就会排队等着轮到他们了……");
         }
         outputText("[sayend]一个小恶魔喋喋不休地说着。你呻吟着，淫荡地扭动着臀部，在经历了所有的操弄后依然欲火焚身，没有了小恶魔在你体内那邪恶的灼热感，你感到空虚。一种饥渴在你的子宫里嗡嗡作响，要求你怀孕，当你看到泽塔兹带着一根狂暴、完全勃起的硬挺肉棒大步走进来时，你兴奋极了。当他冲你微笑并爬上那个位置刚好的平台时，它饥渴地跳动着。[pg]");
         outputText("[say: 看来你现在准备好了，是吧？漂亮湿润的小穴，几乎看不出来的鸡巴，还有一个巨大淫荡的阴蒂。我考虑过除掉你的鸡巴，但我觉得留着它来提醒你堕落到了什么地步会更屈辱。而且你[legs]上方那个洞里滴着那么多精液，你可能会怀孕，但我应该确保一下，不是吗？]你昔日的敌人质问道。[pg]");
         outputText("在他开始之前，泽塔兹又拿起一针Gro+，猛地扎进你的阴蒂，让这颗爱之豆肿胀到一根粗大、青筋暴起的肉棒大小。他用力地抚摸着它，然后滑入你的体内，在你被那过大的阴蒂带来的快感分散注意力时刺穿了你。突如其来的插入让你斗鸡眼，舌头也从口塞的囚禁中伸了出来。你呻吟着，喘息着，在他身上颤抖，依然把你最后一次男性高潮的精液从你那微小、发育不良的鸡巴滴到你那又长又粗的阴蒂上。[pg]");
         outputText("泽塔兹大笑着，在那个巨大的阴蒂上抽插；尽管它非常缺乏女性气质，但依然让你像个小女孩一样尖叫。你的[legs]疯狂地颤抖着，靠在墙上发抖，而你多汁的小穴被狠狠地操着，混合的精液在恶魔领主巨大肿胀的肉棒周围沸腾溢出。操弄猛烈、快速，如此残暴，以至于你在几分钟内就高潮了多次，尽管小恶魔们甚至没有尝试为你每次高潮都注射药物。泽塔兹在你的" + get_player().assDescript() + "上拍了几下，然后将自己推到底，把你那被操透的小穴撑到了极限。他抽搐着，咕哝着，一股黏糊糊的热流带着堕落的快感弥漫了你的核心。不知怎么的，你就是知道，你一定会因此怀孕，但你很难去在乎。感觉太爽了……[pg]");
         dynStats(DynStat.Lib(100),DynStat.Sens(100),DynStat.Lust(1000,DynStatOp.Eq),DynStat.Cor(50));
         doNext(zetazBadEndEpilogue);
      }
      
      public function malesZetazOver() : void
      {
         if(get_player().hasStatusEffect(StatusEffects.ParasiteSlugReproduction))
         {
            get_player().changeStatusValue(StatusEffects.ParasiteSlugReproduction,1,1);
         }
         outputText("你已经被彻底地");
         if(get_player().get_HP() < 1)
         {
            outputText("击败");
         }
         else
         {
            outputText("挑逗");
         }
         outputText("以至于当泽塔兹叫来几个朋友时，你甚至没有反抗。你只是躺在那里，温顺而挫败，任由他们抬着你穿过隧道走向他们的餐厅，但从小恶魔们眼中的神情来看，他们并不打算喂你……至少不是用食物。你之前击败的那群暴徒似乎又回来了，欢快的起哄和吹口哨声");
         if(get_player().cor < 33)
         {
            outputText("羞辱");
         }
         else if(get_player().cor < 66)
         {
            outputText("困惑");
         }
         else
         {
            outputText("唤起");
         }
         outputText("你，你被扔到一张桌子上，翻滚到侧面。当他们拿出皮带绑住你的身体时，你发出一声闷哼。在不到一分钟的时间里，你脖子以下的部分完全无法动弹，你的[legs]被强行分开，以便他们能轻易接触到你的[eachcock]和[asshole]。[pg]");
         outputText("泽塔兹一跃跳上桌子，他那勉强遮掩的兜裆布下，鼓胀的下体自由地晃荡着。你开始挣扎，对这个残忍小恶魔的意图感到恐惧，并且");
         if(get_player().ass.analLooseness < 4)
         {
            outputText("担心他会试图把那根夹在腿间的庞然大物强行塞进你的后庭");
         }
         else
         {
            outputText("担心他会利用你那已经被撑开的后庭");
         }
         outputText("，但你狂热的努力都是徒劳的——束缚太紧了！小恶魔们开始嘲笑你的窘境，而泽塔兹则更进一步地羞辱你，他直接踩在你的腹股沟上，用脚跟痛苦地挤压着你的[cock]。他举起双臂，大喊道：[say: 我是你们的勇者！我让这个我们同类的祸害跪倒在地，并将他踩在脚下！][pg]");
         outputText("你在小恶魔的脚跟下哀怨地呜咽着，扭动着身体，感到无比的屈辱和无助。泽塔兹低头看着你，得意地嘲笑道：[say: 怎么了？有什么不舒服的吗？] 他抬起脚，让你喘了口气，[say: 谢谢，] 然后他一脚踢在你的肚子上，让你喘不过气来。尽管被束缚着，你的身体还是在皮带下抽搐着，试图蜷缩起来，而你的横膈膜则在不断地痉挛。一条带子绑在你的头上，一个口塞滑入你的嘴里，让它保持张开，准备迎接小恶魔们设计的任何变态计划。[pg]");
         outputText("当你还在喘息时，这位小恶魔领主烦躁地皱着眉头向他的手下打了个手势，这群怪物立刻争先恐后地去满足他，生怕惹怒了他。一个漏斗，底部连着一根透明管子，从人群中传递到泽塔兹手中，随之而来的还有几瓶装满翻滚着的粉红色和红色液体的瓶子。漏斗的出口管被穿过你的口塞，你只能在惊恐中睁大眼睛发出闷哼，眼睁睁地看着它被固定在原位。第一瓶你猜测是催情剂的液体被倒进漏斗里，你别无选择，只能喝下去，否则就会被淹死。[pg]");
         outputText("它有一种类似泡泡糖的味道，流进肚子时让你的舌头感到刺痛，但更强烈的" + get_player().sMultiCockDesc() + "变得坚硬如石的感觉让你清楚地知道你刚才喝了什么。尽管你刚刚才把那难喝的饮料灌下去，小恶魔们又拔开了两瓶药水的塞子，把它们倒进漏斗里。甜腻的液体涌入你的嘴里，你再次选择吞咽和灌下，而不是被淹死。当你咽下最后一口时，你气喘吁吁，完全喘不过气来，身体也越来越热。你的[skindesc]刺痛并出汗，随着时间的推移变得越来越敏感，而[eachcock]开始滴下淫液。[pg]");
         outputText("泽塔兹发出一声会意的笑声，将漏斗递给一个手下，然后重新调整自己在你[legs]上方的位置。一股温暖的压力推挤着你的[asshole]，迫使你紧绷的肌肉在入侵者面前屈服。通常情况下，这种瞬间的插入会让人感到刺激，或者可能是痛苦的，但前列腺上突然的压力只会让你喷出大量的先列腺液。一声不受欢迎的呻吟从你唇间滑落，引来人群中一阵窃笑。好像失败还不够糟糕似的——他们都知道你因为" + get_player().assDescript() + "被插入而高潮了。最糟糕的是，这种羞辱只会让情况变得更火热，让[eachcock]更硬。[pg]");
         outputText("当一波意想不到的药水通过漏斗涌入你的嘴里时，你差点被呛到，但你开始吞咽，在你能再次呼吸之前，你感觉自己灌下了半打催情药水。" + get_player().SMultiCockDesc() + "开始喷射，仅仅是药水的作用就让大量的精液倾泻在桌子和你的肚子上。泽塔兹在手里收集了一大团精液，涂抹在自己身上，把它当作润滑剂，用野蛮粗暴的抽插插入你那可怜的、饱受摧残的后庭，每一次抽插的顶点都狠狠地撞击着你的前列腺。你通过嘴里的管子大声而淫荡地呻吟着，在束缚中扭动着，在一次又一次被插入时无助地喷射着。[pg]");
         outputText("你的高潮刚一结束，又一波催情剂进入你的嘴里，你不得不再次喝下去。你的后庭闪过一丝温暖，让你感到充实和火热，但随后泽塔兹拔出了他的阴茎，另一根略有不同的肉棒埋入了你的后庭。小恶魔们轮流猛烈地攻击你的后门，强迫你喝下药水，有时甚至给你打飞机，看看你能喷出多少，直到你的大脑在药物、性爱和快感的不断冲击下停止运转。[pg]");
         dynStats(DynStat.Lib(100),DynStat.Sens(100),DynStat.Lust(1000,DynStatOp.Eq),DynStat.Cor(50));
         doNext(malesZetazOverPtII);
      }
      
      public function loseToZetaz() : void
      {
         clearOutput();
         outputText("[say: 哎呀，这不是很熟悉吗？] 泽塔兹看着你");
         if(get_player().get_lust() >= get_player().maxLust())
         {
            outputText("自慰");
         }
         else
         {
            outputText("俯卧");
         }
         outputText("的身影，带着愉悦的表情，[say: 多年来第一个能保持自由意志超过几分钟的勇者，竟然被[he]刚刚逃脱的小恶魔逼得跪地求饶！等你认清了自己的地位，你就能保证我安全回到我应有的位置。也许我还能升职呢？毕竟，你已经打败了那么多高阶恶魔。][pg]");
         if(get_player().get_gender() == 0)
         {
            outputText("他眯起眼睛，带着困惑的神情低头看着你，然后笑了起来，[say: 你到底是怎么失去性别的？算了，我们得想办法解决这个问题！][pg]");
            outputText("泽塔兹抓起一个瓶子，拔掉塞子，趁你还晕头转向无法反抗时，把它塞进你的嘴唇。他按摩你的喉咙，强迫你吞下那乳白色的液体。几秒钟内，你腹股沟的皮肤裂开，形成了一个崭新的、未经人事的阴道。[pg]");
            get_player().createVagina();
         }
         if(get_player().get_gender() == 1)
         {
            malesZetazOver();
         }
         if(get_player().get_gender() == 2)
         {
            femaleZetazOver();
         }
         if(get_player().get_gender() == 3)
         {
            hermZetazOver();
         }
      }
      
      public function loseToValueFemalePtII() : void
      {
         spriteSelect(SpriteDb.get_s_valaSlave());
         clearOutput();
         outputText("你不受控制地发抖，像受伤的动物一样抱紧自己。你的[nipple]和[clit]在苍白的黏液下灼烧，硬得像石头，不断跳动着索求刺激。那个妖精贱货高高兴兴地在你旁边放下一个新桶，这一桶比刚才还满。[say:它想吃饭了？]她半信半疑地问，或许是希望能留给自己。你不情愿地伸手去拿桶；当你看到妖精像是又要拉下拉杆时，几乎是扑了上去。你望进桶里，精液的恶臭扑鼻而来，让你浑身一颤；那味道甚至比正顺着你裸露肌肤、凝成乳白团块流下的精液浴还要浓烈。你勉强用手指和拇指捏起一团，怯生生地抬起满手那令人作呕的黏浆，像抹肥皂泡一样把它涂到嘴唇上。把这污秽的黏液擦得离鼻子这么近，刺鼻的恶臭几乎让你抽搐起来；你抱住自己被黏液浸透的身体，试图蜷缩起来，远离那只臭气熏天的桶。你的下腹变成一片湿滑狼藉，苍白而近乎透明的液体从你的曲线上滚落，结成一坨坨黏稠的团块。");
         outputText("你发现自己正把精液揉到你的" + get_player().skin.desc + "上，又揉进你的" + get_player().allBreastsDescript() + "里，于是你摇了摇头，试图让脑子清醒过来。你在心里一遍遍提醒自己：记住它闻起来有多恶心。这东西令人作呕，而你这么做只是为了取悦那个疯疯癫癫的妖精。可是，当你摸到自己的乳头，发现拇指正用力过度地按压着那片柔软，在你的[skindesc]上打着小圈抹开精液时，你还是浑身一颤。你下一把抓得更多，再下一把又更多，直到你把桶拖得更近，好让身体接住更多滴落下来的东西。你把温热的精液揉进肌肤里，沉溺于它渗入你湿漉漉身体的热意中，那股气味缠上你的鼻腔，钻进你的脑子。你把一团团油滑的精液糊到脸上和头上，还用小指把它揉进鼻孔里。[pg]");
         outputText("你提起木桶，正准备把整桶都吞下去，这时妖精随口说了一句。[say:主人们把他们的爱液和牛头人野兽的混在一起，好让它渗进你的脑子里，]她惆怅地叹道，看起来对你现在的位置羡慕得不得了。女孩似乎有些后悔把这会让人上瘾的精液交给你，但她的话语在你被精液灌醉的感官中显得模糊不清。恍惚间，你脑海中的某个角落在想，牛头人那像毒品一样的种子是不是已经开始起效了，可这已经不重要了。你现在已经陷得太深。你把木桶放在腿上，弯下身探了进去。你把鼻尖抵在那浑浊的表面上，深深吸气，像品味这一刻般贪婪地饮下它的气味。接着，你满怀享受地把你的[face]沉进这桶精液漆黑的深渊里，张开嘴吸入那甜蜜的蜜液，空气从你喉咙里逸出，冒成气泡，而你则一口接一口地吞咽着这顿浸没整张脸的大餐。小恶魔汁液的淋浴让你的皮肤像着了火，但喝下它们咸涩的排泄物，却让你的脏器里燃起狂暴的烈焰，将你的记忆一段段驱散。你大口大口吞下去，甚至连停下来呼吸都没有。每一次吞咽都会抹去你脑中的一部分，先是你讨伐洞穴中恶魔的使命，然后是你在这个世界遇到的朋友，最后甚至连你的故乡也一并消失。液态的欲望填满你的脑海，将其他一切尽数埋葬。你人格中的每一部分都被对精液的渴求取代，而你的视野也变成一片白茫茫——直到最后，你似乎连自己的名字都想不起来了。");
         doNext(badEndValaNumber2);
      }
      
      public function loseToValaMaleIIVeryLoose() : void
      {
         spriteSelect(SpriteDb.get_s_valaSlave());
         clearOutput();
         outputText("妖精把你悬在一根龟头膨大的肉棒上方，那东西至少有一英尺长、三英寸宽，被雕成小恶魔那带刺的恶魔肉茎模样。[say: 主人们非常仁慈，]女孩向你保证道，[say: 他们知道荡妇的极限在哪里，也乐于帮它超越极限。他们会把你改造成合他们心意的样子。]她自己受训的记忆冲淡了那副麻木的表情，她忍不住在半空中骑到你身上，双腿环住你的腰，引着自己湿漉漉的小穴凑向你的[cock]。然而，就在你的龟头滑入她小穴的瞬间，她手上一松，你从她怀里坠落，正砸在那根小恶魔肉棒上，发出痛苦的惨叫。十二英寸长、被磨得油亮的木头没入你的[asshole]，把你的肠道都撑得扭曲变形。你被填得满满当当，感觉就像被长矛贯穿了腹部，可你的前列腺根本不在乎你的痛苦。彻底贯入让你的肉棒发狂般兴奋起来，随着每一下心跳搏动着。你能感觉到高潮正在积聚，可你现在唯一在乎的，只有下体那股碾压般的压力。就在你即将射出来之前，妖精把你从那可怕的尖桩上提了起来；尽管被剥夺了释放，你还是忍不住松了口气。你的肉棒在半空中抽动，胸口仿佛卸下了一块重物。她咯咯笑着，带你一路飞向最后一根尖桩。[pg]");
         get_player().ass.analLooseness = 5;
         doNext(loseToValaMaleIIGape);
      }
      
      public function loseToValaMaleIILoose() : void
      {
         spriteSelect(SpriteDb.get_s_valaSlave());
         clearOutput();
         outputText("[say: 荡妇们被训练得很好，]她幸福地叹了口气。[say: 这个现在只知道主人们的快乐了。]你身下的木桩比普通人类的要大得多——足有7英寸长，两英寸宽。你的[asshole]紧缩着，你在妖精的怀里扭动着，但她让重力来做她的脏活，把你降到人类大小的木制肉棒上，光滑的表面撑开你的[ass]，滑入你的下体，带来一种不舒服的紧绷感。尽管遭受了强暴的屈辱，但前列腺上的压力开始让血液涌入你的[cock]，让你的身体变成了叛徒。你不敢试图拔出来，生怕会对你的肛门造成伤害，你被迫羞耻地坐在木制的勃起物上。女孩飞下来，舔舐着你僵硬的肉棒，尽可能地克制着不立刻骑上你。她饥渴的舌头带走了你身上不断累积的痛苦。最后，她觉得你已经受够了，把你举到半空中，但令你沮丧的是，她把你带到了队伍的更深处。");
         var _temp_1:* = get_player().ass;
         _temp_1.analLooseness = _temp_1.analLooseness + 1;
         doNext(loseToValaMaleIIVeryLoose);
      }
      
      public function loseToValaMaleIIGape() : void
      {
         spriteSelect(SpriteDb.get_s_valaSlave());
         clearOutput();
         outputText("妖精带着你来到栏杆边最后一根桩前。它是马、狗和牛头人阴茎混合而成的噩梦造物。它有着外扩的龟头，让最初的插入变得更加痛苦；末端还有鼓胀的肉结，足以彻底摧毁你的括约肌；整根东西高达一英尺半，顶端将近五英寸宽。你向妖精哀求。你苦苦恳求。你说，你绝不可能套到那东西上去，它会要了你的命。所有尊严都荡然无存，你可怜地仰头对她抽泣。你愿意做小恶魔想要的一切——不，是主人们想要的一切，你立刻改口。你会当他们的玩具和泄欲器，把主人们赐下的爱液一滴不剩地喝下去，直到再也尝不出别的味道。你会把自己的身心全都献给他们。无论要付出什么代价，你都哀求着，只要不是那根桩！妖精没有回应，她没有瞳孔的双眼毫无变化，也丝毫不为你的痛苦所动，只是翻涌着粉色的欲望和被调教出的顺从。她把你放低到刚好能让你感觉到那怪物般坚硬、外扩的顶端抵住你的[asshole]，你的意志瞬间崩溃。你向妖精许诺了一切。她把你从那可怕的最后一根桩上提起来，你如释重负地笑了出来。[pg]");
         outputText("妖精在怀里把你转过身来，让你看清她空洞目光中那毫无理智的堕落深渊。她抚弄着你的[cock]，把你挑逗到几乎要高潮，随后跨坐到你身上；她湿透的小穴比你记忆中的任何东西都更加柔软温暖。[say: 傻玩具，]她在你耳边低语。[say: 它没什么能给你的。主人们早就拥有了一切。]她在你脸颊上轻轻一吻，接着停止扇动蜻蜓般的翅膀，任由你们两人朝那畸形怪物坠去。你的世界在剧痛中炸裂，而你的鸡巴也在她体内喷发出一场足以摧毁心智的高潮；随后你的视野彻底暗下，仁慈的昏迷迅速将你吞没。");
         doNext(badEndValaNumber2);
      }
      
      public function loseToValaFemale() : void
      {
         spriteSelect(SpriteDb.get_s_valaSlave());
         clearOutput();
         get_images().showImage("vala-loss-female");
         outputText("你瘫倒在地，再也站不起来，只能虚弱地喘息。妖精在这场战斗中享受得过了头；她悬在你上方，满怀期待地摩擦着自己，湿漉漉的小穴几乎随着每一次心跳都在喷涌。[say:它会让你见识主人的欢愉。他们会用精液奖赏它。]她嘴里流的口水，不比那不停滴液的小穴少。[say:噢，好多好多精液，全都是给他们乖乖的小母狗的。][pg]");
         outputText("妖精绕着你踱步，脸上掠过一副面具般虚假的同情神色。[say:疼吗？来吧，母狗会让你好受些的。]她把你的一条胳膊绕到她纤细的肩上，轻而易举地将你扶起，那份轻松让你不禁发颤。她以出乎意料的力气带着你飞到房间一角，小心地把你放在一个肮脏、沾满精液的枕头上。尽管环境令人作呕，但这已经比你预想中会从这个疯丫头手里得到的待遇舒服多了。你叹了口气，试着整理思绪，想办法摆脱眼下的困境。忽然一声响亮的金属撞击打断了你的片刻喘息，你刚想起身，就被猛地拽回到自己的[ass]上。你伸手抓向脖子，发现妖精已经给你扣上了一只钢项圈，只有不到两英尺长的锁链将它拴在地面上。[pg]");
         outputText("[say: 它今天折腾了这么一大通，累坏了吧？]她甜甜地问道。[say: 骚货只需要洗个澡，再吃顿热乎饭。我们很快就都会开心多了。]女孩把手伸向一根巧妙嵌在墙里、几乎看不见的拉杆。想到这东西可能意味着什么，你浑身发抖；而当天花板上的喷嘴只是浇下一场冰冷刺骨的水时，你几乎松了口气。冰水冻得你倒抽一口气，你挣扎着想逃出这阵倾泻而下的水流，可脖子上的项圈把你牢牢拴在下面，任由水冲刷全身，带走你四肢里的温度。寒意让你的胸口沉得像被压住一般，把肺里的空气都挤了出去。水流终于停下时，你拼命喘着气，看着积水流进房间中央的排水口。你感觉自己浑身湿透，狼狈不堪，[hair]也湿冷如冰。[pg]");
         outputText("你差点被淹死，又几乎被冻僵，正努力恢复镇定，几乎没有注意到妖精在你面前放下了一个大桶。[say: 都洗干净了？这荡妇现在看起来真漂亮。不过它还得把自己收拾得体面些。主人们必须像享用你的肉体一样，喜欢你的模样和气味。给乖宠物的一顿热饭。]你咒骂这个奴隶，踢翻了桶，把里面恶心的东西泼了一地，翻腾的精液一路滑向排水口。女孩笑了起来，轻灵的嗓音像碎裂的水晶。[say: 母狗还记得自己也曾像你这样不听话。要是可爱的荡妇不想吃饭，也许再洗个澡？]她把手滑向另一个开关，舔着嘴唇压了下去。没有水流冲下，取而代之的是一道白色帘幕灌满你的眼睛、鼻子和嘴巴，一股翻腾的热流倾泻在你周围。你抓挠着自己的脸和项圈，这才意识到她从天花板某个内嵌的储槽里，朝你倒下了一场飞溅的精液雨。你尖叫着挣扎，但黏液还在不停落下，把你埋进一层滑腻的壳里；你的反抗只让它伴着呛咳的吞咽滚进喉咙。等你终于瘫软下来，任由它流遍全身，妖精才放过你。");
         doNext(loseToValueFemalePtII);
      }
      
      public function loseToValaAsMaleIITight() : void
      {
         spriteSelect(SpriteDb.get_s_valaSlave());
         clearOutput();
         outputText("[say: 这样永远取悦不了他们，]她斥责道。[say: 你必须被改造成更合他们的喜好，否则他们永远不会赐予你无尽的欢愉。]她一边把硬得像小纽扣的阴蒂在你腹部磨蹭，一边将你放向栏杆上最小的木桩——那是一个未经雕刻、上了漆的木质小突起，一英寸宽、三英寸长，只比手指大一点。你试图在妖精把你插上去之前攻击她，但她只是松手把你丢完剩下的距离；本该相对不痛的插入，变成了折磨般的剧痛，你撞上木桩，三英寸长的硬木塞满了你的[asshole]。你倒抽一口气，想从这装置上挣脱下来，但妖精已经再次抓住你，把你拉回空中。你绷紧肌肉，带着惊恐又无法移开视线的神情望向这架梯子的远端，那里有一根足以让牛头人都自惭形秽的木雕。妖精又往前挪了几格。");
         get_player().ass.analLooseness = 2;
         doNext(loseToValaMaleIILoose);
      }
      
      public function loseToValaAsMale() : void
      {
         spriteSelect(SpriteDb.get_s_valaSlave());
         clearOutput();
         get_images().showImage("vala-loss-male");
         outputText("你瘫倒在地，再也站不起来，只能虚弱地喘息。妖精在这场战斗中享受得过了头，她悬停在你上方，满怀期待地抚弄着自己，湿漉漉的小穴几乎随着每一次心跳都在喷出淫液。[say: 母狗会让你见识主人们的快乐。他们会用精液奖赏母狗。] 她嘴里流出的口水，和她那湿淋淋的小穴一样多。[say: 噢，好多好多精液，全都是给主人们的乖小婊子的。][pg]");
         outputText("你无力阻止妖精把你拖到南墙边，带到那条固定在离地几英尺高处的木轨前。[say: 母狗还在成长的时候，对主人们来说太小也太紧了，]你的俘虏对你说道。[say: 他们赐给她这架梯子，把我们撑到足够大。你也会感受到他们的慷慨。]妖精抓住你的腋下，在欲火驱使下爆发出的力量将你提离地面，直接带着你飞到那架布满木桩的梯子上方。[pg]");
         if(get_player().ass.analLooseness < 2)
         {
            doNext(loseToValaAsMaleIITight);
         }
         else if(get_player().ass.analLooseness < 3)
         {
            doNext(loseToValaMaleIILoose);
         }
         else if(get_player().ass.analLooseness < 5)
         {
            doNext(loseToValaMaleIIVeryLoose);
         }
         else
         {
            doNext(loseToValaMaleIIGape);
         }
      }
      
      public function loseToValaAsHermPartII() : void
      {
         spriteSelect(SpriteDb.get_s_valaSlave());
         clearOutput();
         outputText("事实证明，这比你想象的还要糟得多。尽管喷嘴已经调到最低档，你仍能感觉到滚烫的精液正流进你的小穴和结肠；软管一阵阵抽动，团团精液开始渗入你的深处。妖精发出笑声，那声音越是纯净、清澈如水晶，就越显得恶毒。[say: 主人们的爱在我们体内是如此甜美。会有更多未来的主人由我们诞下，还有那么多高潮。]她开始捻弄自己的阴蒂，又把摇柄调高了一档，黏滑液体的细流随之变成了稳定的泵送。若不是体内金属的冰冷，精液的热度简直会让你无法承受。你惊恐地意识到，那些小恶魔一定正在填充某个隐藏的储槽，而他们的妖精奴隶则把里面的东西引入你体内。你厌恶地尖叫着，扭动你的[ass]，试图把那该死的玩具从身体里弄出去。[pg]");
         outputText("你的束缚让妖精兴奋得难以自持，她忍不住也加入进来。她把精液泵从你湿透的穴里拔出，扑扇着翅膀贴到你胸前。她猛地坐上你的" + get_player().cockDescript(0) + "，扭动那些带钩的管子，让一根重新塞进你正滴着精液的" + get_player().vaginaDescript(0) + "，另一根则插进她的后穴。少女和你一起尖叫，她失神的欢愉盖过了你的惊恐，随着精液灌入你们两人体内的节奏，她对着你的[hips]不断起伏。[say:我们是听话的荡妇，]她含混地咕哝着。[say:也许——啊——母狗还能再把你藏一阵，不让主、主人们发现。把你准、准备好——哦哦——献给他们。你会变得那么服、服、服从。你会学会爱上瓦拉，]她低声说道，那崩坏的心智中有一瞬间闪过理智的光芒。她抓住那些铁杆，把它们更深地捅进你们的身体，肿胀的阴唇把你的[cock]夹得更紧。泵头顶端带钩的龟头让她彻底发狂，她开始用它猛烈地操弄你们两人，一边撑开你的子宫颈，一边让你狠狠撞进她的深处。[pg]");
         outputText("她吻上你的[nipple]，你听见她把底座上的旋塞拧开，放出了里面的流体，你的脊背随之发颤。你想尖叫，可一股新鲜的小恶魔精液如喷涌的瀑布般轰进你的子宫，力道大到将你整个人向前顶去，绷紧着撞向骑在你身上的妖精；若不是锁链吊着你，你早已被冲飞。你所有感官都被这亵渎的一幕冲击，乳白精液喷溅在子宫里的声音夹着泡沫般的涌流，盖过了那些尖细的嗓音。这条精液组成的高压水枪把发泡的精液灌满你的身体，同时也像填满一个被用烂的飞机杯般灌满那只妖精；她妖精般的腰腹抵着你的胯部鼓胀起来，而你的腹部也膨起与之相贴。两个被撑到极限的腔体相互挤压，把一部分精液又从你的" + get_player().vaginaDescript(0) + "里挤了出来；与此同时，你达到了高潮，把自己的精液喷进那只被塞得过满的妖精体内。那股几乎抹去思绪的精液洪流仍在泵入你的体内，感觉像是在你身体里点起了一团火，灼烧着你的子宫，又沿着腹中一路向上，朝你的头颅蔓延。[pg]");
         outputText("你绝望地哭喊起来，可听见你哀求的只有那只妖精，而她早已沉溺在自己那片毫无理智的高潮海洋里。你抵抗着汹涌袭来的快感，试图避免落得和妖精一样的下场，可她把你困在她抽搐的小穴和喷射精液的软管之间。你脑中只剩下妖精体液那熟透般的甜腻气息，溅在你大腿上；还有一股股像打桩机般轰入的精液，灌满你灼热的小穴。腹中的火焰一路攀上你的" + get_player().allBreastsDescript() + "，你的心脏猛烈跳动，力道几乎不输给那根被精液灌得涨硬、插在你满溢的" + get_player().vaginaDescript(0) + "里的一英尺铁器。你试着向自己保证绝不会屈服，可俘虏你的家伙在你正在射精的肉棒上扭动，而那根带刺假阳具还插在你被精液撑胀的子宫里，把这些念头全都从你脑海中挤了出去。胸中的热意猛地涌上头顶，你甚至觉得那股射进产道里的精液已经一路冲进了你的大脑。你想思考，可那太难了。思考只会带来可怕的痛楚，投降反而轻松得多。任由自己崩溃。你最后一次望进那只被奴役妖精空洞的粉色眼睛，低声向你的女主人献上感谢的祈祷。她似乎被这个称呼惊了一下，随后一抹缓慢的笑意在她心形的脸上绽开。接着，一切思绪都褪去了，你的世界化作一片粉红。[pg]");
         doNext(badEndValaNumber1);
      }
      
      public function loseToValaAsHerm() : void
      {
         spriteSelect(SpriteDb.get_s_valaSlave());
         clearOutput();
         get_images().showImage("vala-loss-herm");
         outputText("你瘫倒在地，再也站不起来，虚弱地喘息着。这个妖精在这场战斗中获得了太多的快感，当她在你上方盘旋，满怀期待地揉捏着自己时，她湿润的小穴几乎随着每一次心跳都在喷水。[say: 主人们会很高兴的。他们会用精液奖励他们的母狗。] 她的嘴里流出的口水和她泥泞的下体一样多。[say: 噢，那么多精液，全都是给他们乖巧的小宠物的。][pg]");
         outputText("她那细得像竹竿一样的胳膊，却使出一种不相称的力气，把你拖到房间中央，又将你的双臂举到空中。她沿着你的[skindesc]上下舔舐，随后抓住天花板上垂下的一副镣铐，咔嗒一声扣在你的手腕上，那金属声在你听来可怕得像是尘埃落定。镣铐所连接的装置感受到骤然增加的重量，开始向上拖拽，把锁链拉向空中，也将你整个人吊起；你的双臂被拽高，身体瘫软地垂成一团，无助地悬在那里。少女一路舔过你的肋骨、腹部，又用唾液涂满你的[hips]。更多铁器扣合的声响刺进你虚弱的意识，你猛地扭动身体，才发现她已经把你的[legs]牢牢固定在地面上。你在锈迹斑斑的镣铐中颤抖着吊在那里，恐惧着接下来必定会发生的事。[pg]");
         outputText("你以为她随时都会把小恶魔叫来，没想到妖精却飞上天花板，拉下一根长长的牛皮软管。那根皮管上满是污渍，缝线粗糙得很，还带着一个可以拧动的小阀门；但真正让你不安的是它的喷嘴。软管的前端由发黑的铁制成，分成两根叉状的突起，两根都做成了小恶魔那肮脏的带钩阴茎的形状。她虔诚地舔了舔那装置，将它探向自己湿淋淋的小穴，几乎就要把它塞进身体里，才想起主人们一定会赐给她奖赏——说不定还真会把奖赏淋到她身上。[pg]");
         outputText("至少妖精的欲液还润滑了那东西，你这么想着，勉强给自己一点安慰。随后妖精把那件邪恶的双叉器具送到你的" + get_player().vaginaDescript(0) + "和[asshole]前。那东西的冰冷让你浑身发颤，你试着躲开，可锁链和你自身的虚弱让你只能任那女孩摆布。她以折磨人般的缓慢，把假阳具滑进你的两个洞里，全程都在咯咯发笑，直到那两个金属龟头完全没入你体内。[say:当玩具是好事，]她轻声哄道。[say:好玩具每天都会被使用。]她嬉闹似的在你臀上亲了一口，然后极轻地拧动了阀门。你听见头顶某处传来一阵咕噜作响的涌动声。软管在她手中像活过来一样，开始在空中扭曲挣动，仿佛有什么可怕的液体正被泵送进来，流向那两根铁制肉棒，以及你毫无防备的下体。你拼命收紧身体，试图把侵入体内的棒身挤出去，可这场折磨拖得越久，妖精似乎就变得越强壮、越疯狂。你呻吟着，努力让自己准备迎接最糟的情况。[pg]");
         doNext(loseToValaAsHermPartII);
      }
      
      public function loseToVala() : void
      {
         spriteSelect(SpriteDb.get_s_valaSlave());
         if(get_player().get_gender() == 3)
         {
            loseToValaAsHerm();
         }
         if(get_player().get_gender() == 1)
         {
            loseToValaAsMale();
         }
         if(get_player().get_gender() == 2)
         {
            loseToValaFemale();
         }
         if(get_player().get_gender() == 0)
         {
            clearOutput();
            outputText("瓦拉趁你战败无力反抗，强行将一个瓶子塞进你的喉咙。当你的[legs]之间裂开一道新的缝隙时，你发出了愉悦的闷哼声！");
            get_player().createVagina();
            doNext(loseToValaFemale);
         }
      }
      
      public function loseToThisShitPartII() : void
      {
         var _loc1_:* = null as IMap;
         hideUpDown();
         clearOutput();
         outputText("发生在你身上的事情绝对不是强奸。不再是了。你太喜欢它了。你靠在豆荚的墙上，可怜地将你的[hips]推向一个幽灵般的情人，在你被强行取悦时淫荡地呻吟着。你用手抓住肉质的墙壁，试图支撑起自己，但你的[legs]像果冻一样软。当你滑入粘液并开始在里面漂浮时，它们整齐地折叠在你身下。这在某种奇怪的方面令人欣慰，当你在呻吟之间喘息时，你的平衡终于失去了。你沉入更深的液体中，失去了所有的方向感。上下变成了对你不再重要的无意义的概念。[pg]");
         outputText("当你沉入不断上涨的极乐浪潮中时，厚厚的粘液滑过你的嘴唇和鼻子，你发现自己在想你将如何呼吸。本能地，你屏住了呼吸。即使充满了性爱的极乐和消除思想的药物，你也不会让自己在“水下”张开嘴。缺氧让你的心脏在胸腔里狂跳");
         if(get_player().totalCocks() > 0)
         {
            outputText("，而且" + get_player().SMultiCockDesc() + "充血肿胀，变得比以往任何时候都大");
         }
         outputText("。在你昏过去之前，不断的抽插迫使你的嘴唇发出一声呻吟。[pg]");
         outputText("一根触手趁机伴随着一波粘液滑入你的嘴里。你试图咳出液体，但你的肺里已经没有空气把它推出来了。这个口交迷恋者的触须变宽了，开始把更多的液体倒进你体内，由于无处可去，它把你充满粘液的肺塞得满满的，然后你才开始吞咽。你放松下来，从鼻子里呼出最后一点空气，你的身体平静下来。不知何故，你可以呼吸真菌荚的液体！[pg]");
         outputText("你漂浮在纯粹的液体极乐中。思绪在形成之前就融化了，你身体的每一寸都在被温暖、布满粘液的触手抚摸、挤压或穿透。当你被极乐包裹时，你身体里几乎每一块肌肉都完全松弛下来。没有了思想或压力的困扰，快感迅速累积到了顶点。[pg]");
         outputText("需求的浪潮从你的胯下开始，乞求被释放出来，但你甚至懒得再移动你的[hips]了。没有你的帮助，释放总是遥不可及，但作用在你身上的触手似乎有意刺激它。你[asshole]里的那个开始抽插得更快，随着压力的增加，你很快就高潮了。");
         if(get_player().hasStatusEffect(StatusEffects.ParasiteSlugReproduction))
         {
            get_player().changeStatusValue(StatusEffects.ParasiteSlugReproduction,1,1);
         }
         if(!get_player().hasVagina())
         {
            outputText("你的身体虚弱地抽搐着，太放松了，以至于在从肛交中获得高潮时无法动弹。");
         }
         else
         {
            outputText("你的身体虚弱地抽搐着，太放松了，以至于在从双重插入中获得高潮时无法动弹。");
         }
         if(get_player().hasFuckableNipples())
         {
            outputText("你的[nipples]在它们阳具般的伴侣周围喷射，渗出性润滑液");
            if(get_player().biggestLactation() > 1)
            {
               outputText("和乳汁");
            }
            outputText("而抽插仍在继续。");
         }
         if(get_player().cockTotal() > 0)
         {
            outputText("缠在[eachcock]周围的触手不断挤压、旋转，在你高潮时把你操得神魂颠倒，而精液则从你的下体稳定地滴流出来。通常它会一股股浓稠地喷射而出，但你体内那些放松肌肉的药物让喷发变成了稳定而无力的细流。");
            if(get_player().cumQ() > 800)
            {
               outputText("当然，由于你射出了这么多精液，肉荚里的黏液很快就变得浑浊，紫白色的雾霭挡住了你的视线。");
            }
         }
         if(get_player().biggestLactation() > 1)
         {
            outputText("乳汁也渗了出来，");
            if(get_player().biggestLactation() < 2)
            {
               outputText("不过这点轻微的滴漏你几乎察觉不到。");
            }
            else if(get_player().biggestLactation() < 3)
            {
               outputText("让周围稍稍染上了一点更白的颜色。");
            }
            else
            {
               outputText("用养分让这座充满液体的牢笼变得更加浓稠。");
            }
         }
         outputText("[pg]");
         if(get_player().cumQ() > 3500)
         {
            outputText("你的高潮持续得太久，久到你开始感到周围的精液黏液传来压迫感。[eachcock]似乎对此毫不在意，它正忙着把极乐送进你的脑子，又不断喷出精液，根本无暇理会那些触手。这还真有点疼。周围起伏的紫色光晕像是在抗议似的猛然亮了一瞬，接着一切同时松开。压力消失了，你顺着一波真菌黏液般的精液滑落下去，突如其来的位置变化把触手从你体内扯离。潮湿的洞穴空气拂过你的[skindesc]，你落在另一片海绵般的花瓣上，开始咳出那些黏稠的污泥。[pg]");
            outputText("接下来的一分钟里，你的头脑逐渐清醒，力气也回到了身上。你撑着某个硬邦邦的东西坐起身来，低头一看，才发现自己竟被冲到了那具骷髅旁边！惨白的骨头仿佛心照不宣地冲你咧嘴笑着，而目之所及的一切都覆盖着一层厚厚的你的精液。" + get_player().SMultiCockDesc() + "还在滴落更多精液。显然，你那场被毁掉的高潮并没有把它们全都射光。你低头看向那把细剑，把它从你弄出的一片狼藉中捡起来，仔细端详。剑刃锋利地闪着寒光，整把剑的平衡也堪称完美。虽然你和它的主人一样屈服于相同的命运，但你扭曲的身体救了你，没有让你落得和他一样的下场。幸好，铺满地面的那些潜伏豆荚甚至都没有朝你抽动一下。也许你的高潮已经足够喂饱它们全部？又或者它们已经吸取了教训。");
            get_monster().set_lust(100);
            get_player().orgasm("Dick");
         }
         else if(get_player().lactationQ() > 3500 || get_player().lactationQ() + get_player().cumQ() > 4500)
         {
            outputText("你的[nipples]不断地将母乳喷洒在包围着你的浓稠液体中。一旦你开始分泌乳汁，就再也停不下来了。肉荚内部的压力不断增加，以近乎痛苦的强度压迫着你，但你的" + get_player().allBreastsDescript() + "却拒绝放弃或减缓速度。尽管每一次喷射都会增加你身体承受的压力，但你那邪恶的乳汁分泌却毫不退让。闪烁的紫色光芒明亮地闪烁着以示抗议，然后连同压力一起完全消失了。突然，你被一股混杂着乳汁的真菌粘液拉走，随着位置的改变，触手也从你的身体上被扯开。[pg]");
            outputText("在接下来的一分钟里，你的头脑变得清醒，力量也恢复了。你撑着什么坚硬的东西站了起来，然后低头一看，发现自己被冲到了那具骷髅旁边！那具漂白的骨架心照不宣地朝你冷笑，你所能看到的一切都覆盖着一层厚厚的粘液和乳汁。你的[breasts]仍在不断地流出乳汁。很明显，你那因快感而引发的泌乳还远未结束。你低头看着那把细剑，把它从你弄出的一团糟中捡起来，仔细端详。剑刃闪烁着锐利的光芒，剑身平衡得完美无缺。虽然你屈服于与它的主人相同的命运，但你扭曲的身体使你免于与他分享同样的下场。值得庆幸的是，铺满地板的潜在肉荚甚至没有对你抽搐一下。也许你的乳汁足以满足它们所有人？或者也许它们已经吸取了教训。");
            get_monster().set_lust(100);
            get_player().orgasm("Tits");
         }
         else if(get_player().get_gender() == 0)
         {
            outputText("你在[asshole]里的触手周围高潮了感觉像是几个小时，尽管你脑海中某个模糊的、几乎被遗忘的低语告诉你，这不可能持续那么长时间。感觉如此正确，如此完美，以至于抵抗在此时对你来说几乎是一个陌生的概念。你怎么会试图击退这个天堂呢？你完全瘫软，完全无助，比你记忆中的任何时候都要快乐。你那子宫般监狱的脉动光芒继续随着埋在你屁股里的触手有节奏地跳动，抚慰着你，而你的身体则像一把小提琴一样被演奏着，走向它最新的高潮。[pg]");
            outputText("尽管刺激不断，但它还是毫不客气地停止了。你[asshole]里的触手以近乎恶意的力量猛地拔出，你周围的液体开始排出。由于血液中泵送着如此多奇怪的化学物质，你很难站起来，所以当肉荚最后的软泥排空时，你躺在肉质的“地板”上。花瓣展开，将外部世界的景色还给你那充满药物和高潮的头脑。在接下来的一分钟里，你的头脑变得清醒，力量也慢慢恢复。[pg]");
            outputText("你走到骷髅前，仔细看了看它。那具漂白的骨架心照不宣地朝你冷笑，它的下巴锁定在一个僵硬的笑容中。低头看着那把细剑，你决定把它从你弄出的一团糟中捡起来仔细端详。剑刃闪烁着锐利的光芒，剑身平衡得完美无缺。虽然你屈服于与它的主人相同的命运，但你无性别的身体一定使你免于与他分享同样的下场。铺满地板的潜在肉荚甚至没有对你抽搐一下，你默默地祈祷感谢，而你内心黑暗的一部分却在咒骂。");
            get_monster().set_lust(100);
            get_monster().XP = 1;
            get_player().orgasm("Anal");
         }
         if(get_monster().get_lust() == 100)
         {
            _loc1_ = KFLAGS.flags;
            FlagDict_Impl_.arrayWriteInt(_loc1_,117,FlagDict_Impl_.arrayReadInt(_loc1_,117) + 1);
            get_combat().cleanupAfterCombat();
            return;
         }
         if(get_player().get_gender() == 1 || get_player().get_gender() == 3 && Utils.rand(2) == 0)
         {
            if(get_player().get_gender() == 1)
            {
               get_images().showImage("badend-pod-male");
            }
            else
            {
               get_images().showImage("badend-pod-herm");
            }
            outputText("高潮的精液从[eachcock]中喷射滴落，仿佛持续了几个世纪。这种感觉太美妙、太完美了，以至于当它最终结束时，你甚至失望地呜咽出声。你甚至懒得伸手下去抚摸自己。与你松弛无力的肌肉相比，下体的疲软根本算不了什么。即使你能鼓起干劲，你也无法让手臂伸下去触摸自己。谢天谢地，滑溜溜的触手又卷回了你的");
            if(!get_player().hasSheath())
            {
               outputText("根部");
            }
            else
            {
               outputText("肉鞘");
            }
            outputText("并用力挤压，迫使[eachcock]再次充血勃起。在你的[asshole]深处，触手开始摩擦你的前列腺。它抚摸着这个男性器官的两侧，并停下来挤压它的中心，从你颤抖的[cockshort]中挤出几滴粘稠的精液。[pg]");
            outputText("目前紧紧包裹着[eachcock]的藤蔓状茎秆收紧了根部，并开始绕着它做圆周运动。温暖的真菌肉体和粘稠的、带有催情成分的汁液共同作用，将一阵阵炽热的快感送上你的脊髓。尽管你刚刚才高潮过，但你没有得到任何恢复或重新填满你的");
            if(get_player().balls > 0)
            {
               outputText("蛋蛋");
            }
            else
            {
               outputText("前列腺");
            }
            outputText("。在这个温暖、粘稠的环境中，逻辑和休息之类的事情已经无关紧要了，至少对你那可怜的、无法思考的大脑和勃起、敏感的肉棒来说是这样");
            if(get_player().cockTotal() > 1)
            {
               outputText("");
            }
            outputText("。在上次高潮之后紧接着就迎来了如此强烈的刺激，[eachCock]正承受着近乎痛苦的快感。你的全身因感官超载而颤抖；不过由于你的肌肉已经完全罢工，这更像是一种哆嗦。[pg]");
            outputText("在真菌不断的性刺激下，又一波精液开始从你无助、被固定的身体中缓慢流出。随着液体的交换，你所在的荚囊内的液体发出嘈杂的咕噜声，但这些感官输入并没有被你那超载、被药物麻痹的空壳大脑所接收。你已经迷失在无脑的快感和一次又一次无休止的高潮中。你的余生都将在漂浮在这个人造子宫中度过，一次又一次地高潮以喂养你的真菌监狱，并享受着那早已侵蚀了你理智的快感。");
            get_game().gameOver();
         }
         else
         {
            get_images().showImage("badend-pod-female");
            outputText("你在触手缠绕着你的" + get_player().vaginaDescript(0) + "和[asshole]里高潮着，感觉仿佛持续了好几个小时，尽管你脑海深处某个昏沉、几乎被遗忘的声音告诉你，这不可能真的持续了那么久。到了这个地步，这一切感觉如此正确、如此完美，以至于反抗对你来说几乎成了陌生的概念。你怎么会曾经试图抗拒这片天堂呢？你浑身瘫软，彻底无助，却比记忆中的任何时候都更加幸福。你这座子宫般的牢笼中，脉动的光芒仍随着埋在你小穴里的触手保持着稳定的节拍，在安抚你的同时，将你的身体像小提琴般拨弄着，推向新一轮的高潮。[pg]");
            outputText("持续不断的抽插节奏，将由极乐驱动的快感如火箭般沿着你的脊髓送上去，直冲大脑，并在那里炸裂成高潮。你的身体几乎没有抽动，放松到连任何肌肉反应都做不出来，无论是自主的还是不自主的。片刻喘息的机会从未出现。那残酷的真菌从不松懈。它从不放慢，除非只是短暂停顿一下，好让下一次挺入变得更加强烈。若你是在露天之下，而不是在这古怪的液体中呼吸，你早已因快感而扭动尖叫。可现在，你只是静静地漂浮着，默默地高潮。[pg]");
            outputText("液体在舱内咕噜作响，随着更替而涌动。如果你还有能力注意到这些声音或变化，或许会怀疑它正在采集你的性液，但如今你连这样的念头都无法产生。你已经彻底迷失在失去理智的快感，以及一次又一次、永无止境的高潮之中。余生，你都将在这个人造子宫里漂浮，不断高潮，以此喂养囚禁你的真菌，并享受那早已侵蚀掉你理性能力的快感。");
            get_game().gameOver();
         }
      }
      
      public function loseToImpMobII() : void
      {
         clearOutput();
         spriteSelect(SpriteDb.get_s_zetaz());
         outputText("你醒了过来，因为之前的运动而感到酸痛，头脑也有些昏沉。你试图移动，却发现自己动弹不得。你徒劳地挣扎着，四处乱动，直到你意识到自己的四肢都被沉重的铁制拘束具绑住了。当你低头看到你");
         if(get_player().biggestTitSize() < 1)
         {
            outputText("新长出的");
         }
         else
         {
            outputText("变得更大的");
         }
         outputText("乳房时，你大声喘息起来，它们随着你的每一次扭动和动作而摇晃。你一丝不挂，只穿了一件透明且有些变态的护士服。你周围的房间看起来空无一人，不过你可以看到角落里堆着一些毯子，还有几个笼子里装满了沾满精液的妖精，都在满足地打着呼噜。[pg]");
         outputText("终于，一个小恶魔独自走进了房间。是泽塔兹！他上下打量着你，宣布道：[say:你准备好了。]你挣扎着想对他大喊大叫，但从你嘴里的口塞中漏出的只有无法理解的胡言乱语。他轻笑一声，按下墙上的开关，突然间，你湿透的小穴里开始传来宛如天堂般的震动。");
         if(!get_player().hasVagina())
         {
            outputText("……等等，你的什么？你现在有小穴了！？");
         }
         outputText("你的眼睛因为快感而变成了斗鸡眼，你的大脑努力想弄明白为什么感觉这么好。[pg]");
         outputText("泽塔兹将几个瓶子里的液体倒进一个大容器里，然后将一根管子连接到瓶底的开口处。你的目光顺着管子回到你嘴里的口塞上，用舌头摸索了一番后，你意识到它已经穿过口塞，伸进了你的喉咙。泽塔兹举起瓶子，把它挂在天花板的钩子上，你惊恐地看着液体流过管子，却无力阻止。你绝望地摇着头，对自己终于落入这个小混蛋的手中感到愤怒。[pg]");
         outputText("泽塔兹走上前来，用爪子抓着你");
         if(get_player().biggestTitSize() < 1)
         {
            outputText("新长出的");
         }
         else
         {
            outputText("变大的");
         }
         outputText("乳房，飞到半空中与你平视。他喋喋不休地说：[say: 很高兴再次见到你，[name]。因为你，我不得不逃离我在莉希丝身边尊贵的位置。我不得不躲在这个恶臭的森林里。我承认，这也不全是坏事。我们抓了几只妖精来玩，有你在这里，我和男孩们会有很多乐趣。我们只需要稍微重塑一下你那烦躁的心智。][pg]");
         get_images().showImage("badend-impbirth");
         outputText("你几乎没有听进去他的长篇大论。你正忙着在那个震动的入侵者上高潮，它目前正在给你那被塞满的小穴进行一生难忘的锻炼。泽塔兹看着你空洞的眼神轻笑，温柔地按摩着你的太阳穴，你感觉到他的黑魔法在你的**体内**游走。它感觉温暖而湿润，与你身体里另一个入侵者的感觉相匹配。你试图反抗，有一瞬间你觉得你可能会把这个恶魔赶出你的脑海。然后你的身体高潮了，你的抵抗也随之消散。你猛烈地挣扎着，在小恶魔同时强暴你的身体和心智时，屈服于快感。[pg]");
         outputText("保护村庄的渴望从你的双腿间滴落，独立的思想被操得一干二净。高潮的感觉真好，当你看到主人胯部的凸起时，你的双眼失焦了，这表明你让他多么满意。服从的感觉真好！泽塔兹突然吻了你，你在高潮之间热情地回应。[pg]");
         outputText("你心甘情愿地度过余生，作为他们住在家里的育母，一遍又一遍地被操，生下小恶魔。");
         get_player().orgasm("Vaginal");
         var _loc1_:Player = get_player();
         _loc1_.set_HP(_loc1_.get_HP() + 100);
         get_game().gameOver();
      }
      
      public function loseToImpMob() : void
      {
         clearOutput();
         if(get_player().get_HP() < 1)
         {
            outputText("由于无法承受你身上无数的伤口，你精疲力竭地倒下了。[pg]");
         }
         else
         {
            outputText("由于无法承受在体内流窜的欲望，你放弃了抵抗，瘫倒在地，希望这群暴徒能让你解脱。[pg]");
         }
         outputText("几秒钟内，蠕动的红色躯体蜂拥而上，遮蔽了你视线中房间的其余部分。你能感觉到他们乱抓的手指和手撕扯着你的[armor]，将你的身体暴露在他们永远饥渴的目光下。他们的缠腰布消失了，因为他们不断膨胀的恶魔性器显露出来，推开了那一点点布料，或者干脆直接撕裂了它们。你被到处乱摸、触碰和舔舐，淹没在长舌头和赤裸小身体的海洋中。[pg]");
         outputText("你的下巴被抓住，下颌被撬开，为一根肿胀的狗鸡巴腾出空间。它没有任何预热或前戏就被塞了进来，你被迫在喉咙深处品尝他的先列腺液。在如此妥协的姿势下，你不敢咬下去或反抗，当他继续往里推，将他的肉结埋在你的嘴唇后面时，你被迫努力抑制你的呕吐反射，并把牙齿收回去。[pg]");
         if(get_player().biggestTitSize() > 1)
         {
            outputText("突然，一个重物落在你的胸口，其中一个恶魔跨坐在你的肚子上，让他粗壮、被污染的肉棒扑通一声掉在你的" + get_player().allBreastsDescript() + "之间。从他长满结节的龟头漏出的滚烫液体迅速润滑了你的乳沟。几秒钟内，这个小恶魔就把你的[breasts]挤压在自己周围，开始把他的性器捣进你的乳房。紫色的尖端在你晃动的肉团之间探出头来，滴着被污染的汁液。");
            if(get_player().biggestLactation() > 1)
            {
               outputText("你的[breasts]受到挤压，开始喷出乳汁，这反而鼓励了小恶魔更加用力地挤压。");
            }
            outputText("[pg]");
         }
         if(get_player().hasFuckableNipples())
         {
            outputText("你的一个乳头被粗暴地捏了一下，吓了你一跳，但当你的一根小恶魔手指插入你的[nipple]时，你的抗议声变成了闷哼。他把手拔出来，惊叹于那黏糊糊的液体，然后毫不犹豫地用双手抓住你乳房的顶部，把自己插了进去。");
            if(get_player().biggestTitSize() < 7)
            {
               outputText("他只能进去一部分，但这似乎并没有阻止他。");
            }
            else
            {
               outputText("多亏了你巨大的胸部，他能够把他那根跳动的肉棒完全塞进你体内。");
            }
            outputText("恶魔开始以非人的活力猛烈地抽插你的乳房，让整个乳房诱人地晃动起来。其他人看到他们兄弟的快活，也扑向了");
            if(get_player().totalNipples() > 2)
            {
               outputText("每一个");
            }
            outputText("你其他的[nipple]");
            if(get_player().totalNipples() > 2)
            {
               outputText("");
            }
            outputText("，争夺着开口");
            if(get_player().totalNipples() > 2)
            {
               outputText("");
            }
            outputText("。一个胜利者很快就出现了，不一会儿");
            if(get_player().totalNipples() == 2)
            {
               outputText("这两个");
            }
            else
            {
               outputText("所有的");
            }
            outputText("你胸前的开口都被肿胀的恶魔肉棒堵住了。[pg]");
         }
         if(!get_player().hasVagina())
         {
            outputText("人群的大部分都集中在你的下半身，仔细端详着你的[asshole]。一个勇敢的小恶魔走上前，把他的性器推入未被填满的孔洞。你被这巨大且出乎意料的强力侵入撑得大开。微小且被污染的结节抚摸着你内部的每一寸，引起你内部肌肉无法控制的痉挛。无意的阴茎按摩让你的强暴者露出了灿烂的笑容，他在整个过程中伸手一次又一次地拍打你的屁股。");
            get_player().buttChange(12,true,true,false);
            outputText("[pg]");
         }
         else
         {
            outputText("人群的大部分都集中在你的下半身，仔细端详着你的小穴和屁股。两个勇敢的小恶魔走上前，把他们的性器推入未被堵住的孔洞。你被这巨大且出乎意料的强力侵入撑得大开。微小且被污染的结节抚摸着你内部的每一寸，引起你内壁无法控制的痉挛。无意的阴茎按摩让你的强暴者露出了会心的笑容，他们开始在你的屁股上大干特干，在双重插入你的同时不断拍打它。");
            get_player().buttChange(12,true,true,false);
            get_player().cuntChange(12,true,true,false);
            outputText("[pg]");
         }
         if(get_player().totalCocks() > 0)
         {
            outputText("其他一些小恶魔感到被冷落了，掏出了你的" + get_player().multiCockDescript() + "。他们把自己的性器拉到你的旁边，开始在你身上摩擦，当他们恶魔般的润滑液用滑溜溜的黏液覆盖这束鸡巴时，他们互相摩擦着。小手把鸡巴捆在一起，你发现尽管被迫承受着残酷的操弄，你还是享受着这种刺激。先列腺液冒出气泡，与从你俘虏的性器中漏出的恶魔精液混合在一起，直到你的胯部沾满了起泡的先列腺液。[pg]");
         }
         if(get_player().isTaur())
         {
            get_images().showImage("gangbang-loss-centaur");
         }
         else
         {
            get_images().showImage("gangbang-loss-human");
         }
         outputText("恶魔们齐声高潮。滚烫的精液涌入你的屁股，让你充满了不舒服的压力。");
         if(get_player().hasVagina())
         {
            outputText("浓稠的精液用白色涂满了你的小穴，你能感觉到它渗入你肥沃的子宫深处。");
         }
         outputText("你的嘴里充满了浓稠的白浊。被恶魔的肉结堵住嘴的你，被迫大口吞下这些东西，以免被他污浊的精液呛到。");
         if(get_player().biggestTitSize() > 1)
         {
            outputText("夹在你双乳之间的肉棒释放了，越来越多的精液打在你的下巴上，白色的汁液顺着你的脖子滴落下来。");
            if(get_player().hasFuckableNipples())
            {
               if(get_player().totalNipples() == 2)
               {
                  outputText("这对");
               }
               else
               {
                  outputText("这群");
               }
               outputText("埋在你[nipple]里的肉棒在射精前拔了出来，将精液倾倒在它们留下的巨大孔洞里。那里传来一阵滚烫的刺痛，让你舒服得浑身发抖。");
            }
         }
         outputText("终于，你自己的高潮到来了，");
         if(get_player().cockTotal() == 0)
         {
            outputText("你紧紧地夹住了那令人不适的入侵物。");
         }
         else
         {
            outputText("并且[eachcock]也释放了，将你自己的精液溅到了许多恶魔身上。如果你的嘴里没有塞满肉棒，你一定会笑出来的。至少你把他们弄得一团糟！");
         }
         if(get_player().hasVagina())
         {
            outputText("当高潮降临时，你的小穴紧紧夹住入侵的肉棒，用其本能的繁殖欲望按摩着恶魔的工具。不知怎么的，你又让他射了，并把另一股精液吸入你等待的小穴中。");
         }
         outputText("[pg]");
         outputText("浑身无力，沉浸在性交后的余韵中，当你被抬到桌子上时，你并没有反抗");
         if(!get_player().hasVagina())
         {
            outputText("，而是被迫开始一瓶接一瓶地喝下魅魔的乳汁");
         }
         outputText("。就在第二回合开始时你晕了过去，但恶魔们似乎并不介意……");
         doNext(loseToImpMobII);
      }
      
      public function investigate() : void
      {
         spriteSelect(SpriteDb.get_s_sean());
         clearOutput();
         get_images().showImage("deepCave-sean");
         outputText("你试图偷偷靠近以便看清他，但那个恶魔立刻停下了手中的动作，直勾勾地盯着你。他笑道，[say: 好吧，现在我知道里面的恶魔都怎么了。我原本以为像他们这样的一群叛徒能打得更好些。][pg]");
         outputText("被发现了，你站起身，准备好你的[weapon]，摆出防御姿态，准备迎接这个恶魔可能发动的任何新攻击。奇怪的是，他又开始大笑起来，甚至不得不停下来擦去眼角的泪水才开口说话，[say: 噢，太有意思了！我不是来和你打架的，勇者。我怀疑我根本没有胜算。我听说这附近有一些叛徒，所以我想我应该出现并提供我的服务。你看，我是一个专门收集奇怪和稀有炼金溶液的采购员。当然，在我到达这里之前，你已经把所有人都打倒了，但我想我还是留下来看看是否还有一些侦察兵在附近，然后再赶紧离开这里。][pg]");
         outputText("你盯着他，困惑地眨了眨眼睛。一个色欲恶魔，居然对和你战斗或者强暴你没兴趣？他看出了你的表情，再次笑了起来，平静地说道：[say: 不，我可不是一般的男魅魔。说实话，比起满足性欲，我更喜欢激烈的辩论或者探索的快感，当然，我偶尔也会放纵一下。][pg]");
         outputText("这个奇怪的男魅魔冲你笑了笑，让你觉得有点不舒服，然后他终于自我介绍了：[say: 我叫肖恩，既然你似乎把莉希丝的追随者和敌人都揍得屁滚尿流，我想站在你这边。所以我提议达成一个互惠互利的协议——我卖给你在其他地方买不到的物品，而你让我住在这个洞穴里。你觉得怎么样？][pg]");
         menu();
         addButton(0,"成交",seanDeal);
         addButton(1,"拒绝",seanNoDeal);
         addButton(2,"以后再说",seanNotNow);
      }
      
      override public function initRooms() : void
      {
         var _loc1_:IMap = new IntMap();
         _loc1_.h[22] = roomEntrance;
         _loc1_.h[17] = roomTunnel;
         _loc1_.h[12] = roomGatheringHall;
         _loc1_.h[11] = roomFungusCavern;
         _loc1_.h[13] = roomTortureRoom;
         _loc1_.h[8] = roomSecretPassage;
         _loc1_.h[7] = roomZetazChamber;
         dungeonRooms = _loc1_;
         connectivity = [1,1,1,1,1,1,1,DungeonRoomConst_Impl_.fromStr("ES"),DungeonRoomConst_Impl_.fromStr("WS"),1,1,DungeonRoomConst_Impl_.fromStr("E"),DungeonRoomConst_Impl_.fromStr("LNSEW"),DungeonRoomConst_Impl_.fromStr("NW"),1,1,1,DungeonRoomConst_Impl_.fromStr("NS"),1,1,1,1,DungeonRoomConst_Impl_.fromStr("N"),1,1];
         if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,115) > 0)
         {
            unlockZetazDoor();
         }
      }
      
      override public function initMap() : void
      {
         dungeonMap = [1,1,1,1,1,1,1,0,0,1,1,0,0,0,1,1,1,0,1,1,1,1,0,1,1];
      }
      
      public function incubusTransact(param1:ItemType) : void
      {
         var _loc2_:* = null as Player;
         spriteSelect(SpriteDb.get_s_sean());
         clearOutput();
         if(param1 == get_consumables().LIDDELL)
         {
            _loc2_ = get_player();
            _loc2_.set_gems(_loc2_.get_gems() - int(param1.get_value() * 2));
         }
         else
         {
            _loc2_ = get_player();
            _loc2_.set_gems(_loc2_.get_gems() - int(param1.get_value() * 3));
         }
         statScreenRefresh();
         get_inventory().takeItem(param1,incubusShop);
      }
      
      public function incubusShop() : void
      {
         var item3:Number;
         var _g3:DeepCave;
         var item2:Number;
         var _g2:DeepCave;
         var item1:Number;
         var _g1:DeepCave;
         var item:Number;
         var _g:DeepCave;
         spriteSelect(SpriteDb.get_s_sean());
         if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,451) == 1)
         {
            get_game().telAdre.niamh.getBimboozeFromSean();
            return;
         }
         clearOutput();
         outputText("肖恩向你点点头，把头发向后梳理整齐，小心翼翼地绕过他那小小的角，然后问道：[say:我能为你做点什么？]");
         menu();
         if(get_player().hasItem(get_consumables().BIMBOCH) && FlagDict_Impl_.arrayReadInt(KFLAGS.flags,451) == 0)
         {
            outputText("[pg]如果你有足够的荡妇香槟，肖恩也许能用它做点什么……");
            if(get_player().hasItem(get_consumables().BIMBOCH,5))
            {
               addButton(4,get_consumables().BIMBOLQ.get_shortName(),get_game().telAdre.niamh.yeahSeanLetsBimbooze);
               outputText("幸运的是，你觉得！");
            }
         }
         if(get_player().hasItem(get_consumables().LIDDELL))
         {
            if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,2727) < 0)
            {
               addButton(5,"利德尔药水",buyLiddellium);
            }
            else if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,2728) == 0)
            {
               addButton(5,"奇怪的药水",idLiddellium);
            }
            else if(get_player().get_gems() >= 100)
            {
               addButton(5,"鉴定",idLiddellium2).hint("支付100宝石");
            }
            else
            {
               addButtonDisabled(5,"鉴定","支付100宝石");
            }
         }
         _g = this;
         item = 0;
         var _loc1_:Function = function():void
         {
            _g.buyItem(item);
         };
         addButton(0,get_consumables().NUMBROX.get_shortName(),_loc1_).hint(get_consumables().NUMBROX.get_description());
         _g1 = this;
         item1 = 1;
         var _loc2_:Function = function():void
         {
            _g1.buyItem(item1);
         };
         addButton(1,get_consumables().SENSDRF.get_shortName(),_loc2_).hint(get_consumables().SENSDRF.get_description());
         _g2 = this;
         item2 = 2;
         var _loc3_:Function = function():void
         {
            _g2.buyItem(item2);
         };
         addButton(2,get_consumables().REDUCTO.get_shortName(),_loc3_).hint(get_consumables().REDUCTO.get_description());
         _g3 = this;
         item3 = 3;
         var _loc4_:Function = function():void
         {
            _g3.buyItem(item3);
         };
         addButton(3,get_weapons().SUCWHIP.get_shortName(),_loc4_).hint(get_weapons().SUCWHIP.get_description());
         addButton(14,"离开",runFunc);
      }
      
      public function incubusBuy(param1:ItemType) : void
      {
         var itype1:ItemType;
         var _g:DeepCave;
         spriteSelect(SpriteDb.get_s_sean());
         clearOutput();
         outputText("男魅魔从货架上拿下" + Utils.cnName(param1.get_longName()) + "，说道：[say: 承惠" + param1.get_value() * 3 + "宝石。你确定要买吗？]");
         if(get_player().get_gems() < param1.get_value() * 3)
         {
            outputText("[pg]<b>你的宝石不够……</b>");
            doNext(incubusShop);
            return;
         }
         _g = this;
         itype1 = param1;
         doYesNo(function():void
         {
            _g.incubusTransact(itype1);
         },incubusShop);
      }
      
      public function impGangVICTORY() : void
      {
         clearOutput();
         FlagDict_Impl_.arrayWriteInt(KFLAGS.flags,116,1);
         if(get_monster().get_HP() < 1)
         {
            outputText("最后一个小恶魔倒了下去，跌进那堆被你打败的同伴之中。你也说不清自己究竟是怎么赢下这场实力悬殊的战斗的，但能获胜本身，就足以证明你新近获得的实力了。");
         }
         else
         {
            outputText("最后一只小恶魔倒了下去，它那根恶魔鸡巴也从缠腰布的束缚中滑了出来。被一群正在手淫的小恶魔围着，你叹了口气，意识到这些肮脏生物早已彻底沦为性欲的奴隶。");
         }
         if(get_player().get_lust() >= 33 && !get_player().isGenderless())
         {
            outputText("[pg]你感到有些发情，不禁琢磨着，在继续前进之前，要不要拿它们来满足自己刚冒头的欲望。你要强奸它们吗？");
            if(get_player().hasCock())
            {
               addButton(0,"男体强奸",impGangGetsRapedByMale);
            }
            else
            {
               addButtonDisabled(0,"男性强奸","该场景需要你拥有阴茎。");
            }
            if(get_player().hasVagina())
            {
               addButton(1,"女性强奸",impGangGetsRapedByFemale);
            }
            else
            {
               addButtonDisabled(1,"女性强奸","该场景需要你拥有阴道。");
            }
            setSexLeaveButton();
         }
         else
         {
            get_combat().cleanupAfterCombat();
         }
      }
      
      public function impGangGetsRapedByMale() : void
      {
         var _g:Combat;
         clearOutput();
         get_images().showImage("imp-win-male-fuck");
         outputText("你四处走了走，挑出三个脸蛋最可爱、最有少女感的恶魔。你把他们放到一张桌子上，拨开你的[armor]，露出你的[cocks]。你用不容置疑的语气说道：[say:舔。]那些柔弱的小恶魔点点头，张大嘴巴，伸出他们长长的舌头。那几条湿滑的舌头又窄，舌尖还微微分叉，缠上你的[cock]，为了取悦你而彼此交叠舔弄，发出湿漉漉的吮吸声。[pg]");
         outputText("你抓住中间那只的角，把他往前拉，直到你的肉棒顶到他的喉咙深处。他明显地噎了一下，但你在他承受不住之前把他拉开，随后又一次狠狠顶了进去。");
         outputText("左边那个娘气的小恶魔见你的[cock]正忙得不可开交，便把注意力转向你的");
         if(get_player().balls > 0)
         {
            outputText(get_player().ballsDescriptLight());
         }
         else if(get_player().hasVagina())
         {
            outputText(get_player().vaginaDescript(0));
         }
         else
         {
            outputText("屁股");
         }
         outputText("，细心地舔舐着");
         if(get_player().balls == 0)
         {
            outputText("并深深探入其中");
         }
         outputText("。右边的小恶魔用舌头缠住根部");
         if(get_player().hasSheath())
         {
            outputText("就在你的包皮上方");
         }
         outputText("然后紧紧勒住，就像一个有机的阴茎环。[pg]");
         outputText("操这个小婊子恶魔实在是太爽了，你很快就达到了高潮。");
         if(get_player().balls > 0)
         {
            outputText("精液在你的睾丸里沸腾，准备把你的敌人染成白色。");
         }
         outputText("你猛地一拉，把小恶魔拽到身前，将你的肉棒深深地插入他的喉咙。当你直接把精液射进他的肚子里时，他发出了嘈杂的咕噜声。房间里回荡着湿漉漉的晃动声，他的肚子因为你的精液而微微凸起，鼻子里也滴下了精液。你把他拉开并推开。他咳嗽着，语无伦次，但立刻开始抚摸自己，兴奋得根本不在乎。");
         if(get_player().cumQ() > 1000)
         {
            outputText("你继续射精，而另外两只小恶魔则继续舔舐和服侍你。当你结束时，他们身上沾满了精液，也在自慰。");
         }
         outputText("[pg]");
         outputText("心满意足后，你重新穿好衣服，准备继续探索洞穴。");
         get_player().orgasm("Dick");
         _g = get_combat();
         doNext(function():void
         {
            _g.cleanupAfterCombatNewPage();
         });
      }
      
      public function impGangGetsRapedByFemale() : void
      {
         var _g:Combat;
         clearOutput();
         get_images().showImage("imp-win-female-fuck");
         outputText("你走到其中一只恶魔身边，把他推倒仰面躺下。当你脱下衣服时，你的[armor]掉落在你周围的地上，你俯视着你微小的战利品。一个快速的撕扯动作处理掉了他小小的缠腰布，让他粗壮的恶魔工具完全暴露在外。你抓住它并蹲下，在你的双腿之间摩擦着这个堕落的工具");
         if(get_player().vaginas[0].vaginalWetness >= 3)
         {
            outputText("并涂上女性的淫水");
         }
         outputText("随着你变得越来越兴奋。它分开了你的阴唇，慢慢地滑了进去。当你把这个质地奇特的阴茎越来越深地吞入你渴望的深处时，那一圈被污染的结节恰到好处地刺激着你。");
         get_player().cuntChange(15,true,true,false);
         outputText("[pg]");
         outputText("最后你感觉到它触底了，以极其微小的压力撞击着你的子宫颈。你像偷腥的猫一样咧嘴笑着，扭动着臀部，胜利地将你的[clit]在他身上摩擦。");
         if(get_player().getClitLength() > 3)
         {
            outputText("你抚摸着手里那根像阴茎一样的附肢，高兴得浑身发抖。");
         }
         outputText("你开始骑在这个小恶魔身上，抬起，然后落下，感受着每一个结节沿着你被淫液润滑的肉壁滑动。随着时间的推移，你的快感不断增加，你加快了速度，直到你在这个活生生的恶魔假阳具上快乐地弹跳。[pg]");
         outputText("你们俩一起高潮了，尽管恶魔的快感先开始。他那被污染的精液喷射而出，将你推向了顶峰。你完全沉了下去，感觉到他撞击着你的子宫颈并在你体内抽搐，他阴茎上的凸起随着每一次液体的爆发而有节奏地膨胀。");
         if(get_player().vaginas[0].vaginalWetness >= 5)
         {
            outputText("当你爆炸性地喷水时，阴道的汁液溅到了他身上，在他身下留下了一滩水。");
         }
         else
         {
            outputText("阴道的汁液顺着他的肉棒滴下，从他的睾丸上渗出，在他身下汇成一滩。");
         }
         outputText("你们俩躺在一起，快乐地颤抖着，因为你被污染的液体装得满满的。[pg]");
         outputText("现在满足了，你站起身来，你的身体滴落着黏糊糊的白色液体。虽然回想起来，这远不及泵入你子宫的量。");
         if(get_player().get_pregnancyIncubation() == 0)
         {
            outputText("你可能会怀孕。");
         }
         get_player().orgasm("Vaginal");
         get_player().knockUp(1,418,50);
         _g = get_combat();
         doNext(function():void
         {
            _g.cleanupAfterCombatNewPage();
         });
      }
      
      public function idLiddelliumNo() : void
      {
         clearOutput();
         outputText("虽然你理解他的理由，但你不想付钱。");
         outputText("[pg][say: 那就算了。对我的其他商品感兴趣吗？]");
         FlagDict_Impl_.arrayWriteInt(KFLAGS.flags,2728,1);
         doNext(incubusShop);
      }
      
      public function idLiddellium2() : void
      {
         clearOutput();
         outputText("很好，那就100宝石。");
         outputText("[pg]肖恩优雅地收下了钱。[say: 利德尔药水，]他说道。[say: 那种药水名叫利德尔药水，是一种极其强大且剧毒的变形剂。当监禁、放逐或折磨都不足以惩罚时，高阶恶魔就会用这种不稳定的混合物来惩罚极其恶劣的下属。它会剥夺所有的性征，使肌肉萎缩，身体缩小，让受害者变成一个可耻的、纯洁无瑕的孩童。][pg]" + (FlagDict_Impl_.arrayReadInt(KFLAGS.flags,2698) > 0 ? "看来这就是爱丽丝的由来了。真有趣。" : "") + "关于它，还有什么你需要知道的吗？[pg][say: 它的效果极难消除。恶魔相当擅长变形魔法，尤其是那些自认为比上级更优秀的家伙。因此，它的设计初衷就是让人极难恢复。喝下它的人在短时间内绝对无法恢复正常。甚至可能永远无法恢复。]");
         outputText("[pg]你将警告铭记在心，并感谢这个男魅魔的服务。");
         FlagDict_Impl_.arrayWriteInt(KFLAGS.flags,2727,-1);
         doNext(roomEntrance);
      }
      
      public function idLiddellium() : void
      {
         clearOutput();
         outputText("你从包里拿出那个奇怪的瓶子，问肖恩是否知道些什么；毕竟你是在恶魔营地里找到它的。肖恩好奇地打量着这种混合物，打开瓶子闻了闻。");
         outputText("[pg]突然，男魅魔浑身一颤，差点把杯子摔了。[say: 那——东西非常危险。呼。咳，抱歉失态了。][pg]你皱起眉头。所以，那到底是什么？[pg][say: 100颗宝石][pg]100颗宝石？[pg][say: 我是生意人，鉴定也是一项服务，]他直截了当地说道。这逻辑倒也没错……");
         menu();
         if(get_player().get_gems() >= 100)
         {
            addButton(0,"支付",idLiddellium2);
         }
         else
         {
            addButtonDisabled(0,"支付","你付不起");
         }
         addButton(1,"不用了，谢谢",idLiddelliumNo);
      }
      
      public function hermZetazOverPtII() : void
      {
         hideUpDown();
         clearOutput();
         outputText("你在半途的一声大声呻吟中醒来，差点被吓得跳出你的[skindesc]，但你那被不自然地激起的情欲之火立刻重新占据了主导。你扭动着臀部，向前挺动，顶向一个");
         if(get_player().cockTotal() > 1)
         {
            outputText("数量的");
         }
         outputText("机械榨乳装置");
         if(get_player().cockTotal() > 1)
         {
            outputText("");
         }
         outputText("。" + get_player().SMultiCockDesc() + "被有节奏地吸吮着，发出响亮、湿润的吧唧声，在小房间里回荡。你被挂在墙上的一副镣铐上，就在瓦拉旁边。这个性感的妖精也被以同样的方式锁着，但她正和一个天赋异禀的小恶魔交媾，毫不掩饰她的享受。这充满性暗示的景象刺激了你本就兴奋的下半身，你呻吟着，在接下来的一分半钟里，感觉像是把几加仑的男性精华灌满了榨乳机。[pg]");
         outputText("你无力地向前瘫倒，悬挂在那里，但你血液中的腐化和情欲却拒绝被满足。" + get_player().SMultiCockDesc() + "已经再次硬了起来，在通过一些管子吸走你的精液后，榨乳机又开始了它那令人愉悦的工作。不过，你估计还需要几分钟它才能让你再次高潮，所以你环顾了一下房间。你面前搭着一个平台，大约齐膝高，做工粗糙。从高度来看，这可能是为了让小恶魔们不用飞就能操你。你肩膀两侧的墙上也建有一对平台，不过它们的作用就不太清楚了。[pg]");
         outputText("房间的门砰的一声被推开，泽塔兹走了进来，身后跟着两个比平时更瘦弱的小恶魔。当他看到你醒来且满脸通红时，他笑了笑，走上平台，兴奋地搓着手。[pg]");
         outputText("[say:你对我们的小实验适应得很好，]他宣布道，[say:事实上，你的身体就是一台恶魔般的性交机器。不过我不会把你变成真正的恶魔。但我们得进行一点小训练，让你准备好去见莉希丝。在你给她惹了那么多麻烦之后，她可能会想亲自转化你，或者把你关在工厂里？我也说不准。][pg]");
         outputText("小恶魔领主夸张地解下他的缠腰布，把它扔过肩膀，露出他勃起的恶魔肉棒。他嘲弄道，[say:喜欢你看到的吗？]并命令他的手下，[say:去吧，你们知道该怎么做。]那两个瘦弱的小恶魔飞到他们的栖息处，而泽塔兹则走上前抚摸着自己，准备插入。几十个未解的问题在你的脑海中盘旋，竟然让你从即将到来的高潮中分心，足以让你问出：[say:你——你要对我做什么？][pg]");
         get_images().showImage("zetaz-loss-herm");
         outputText("[say:嘘，嘘，]泽塔兹回应道，[say:放松点，我的宠物。]他");
         if(get_player().balls > 0)
         {
            outputText("轻轻地把你的[ballsfull]拨到一边，然后");
         }
         outputText("对准你流着淫液的肉洞，伴随着一次长长而顺滑的挺进，他进入了你的体内。你立刻猛烈地高潮了，几乎没有注意到相邻平台上已经开始的吟唱。每一次精液的喷射都伴随着泽塔兹的挺进，轻松地滑过你渗出润滑液的肉壁。这次高潮持续的时间几乎是你上一次的两倍。它似乎永远不会结束，但当它慢慢平息时，你发现自己已经在想多久之后才能再次高潮了。[pg]");
         outputText("你想象着自己四肢着地，两个洞都被一对小恶魔占据，同时你还在为一个模糊的身影口交，你的大脑认出那是你的领主和主人。随着每一次插入，" + get_player().SMultiCockDesc() + "都会喷射出精液，而你的两个侵犯者也会高潮，用他们美味的小恶魔精液把你填满，用腐化的白色粘液涂满你的内壁。也许这次你会怀孕？距离你上一次产仔已经过去几个星期了。你更用力地吸吮主人的阴茎，抚摸他的睾丸，直到他通过给你一些咸咸的奖励来表达他的喜爱。他拔出来，在你的脸和头发上射了几股，所以你尽力让自己看起来像个荡妇来鼓励他。当他结束时，你舔了舔嘴唇，对着你的主人泽塔兹微笑。[pg]");
         outputText("等等——什么！？你摇了摇头，清除了这个幻想，尽管你的性器官不断传来的令人愉悦的悸动并没有起到什么帮助。泽塔兹还在操你的小穴，用长而缓慢的动作抽插着，如果不是你被挂在墙上，你那恶魔般的双腿早就支撑不住了。吟唱声是如此响亮，如此阴险。你能感觉到它在你的大脑中蜿蜒，扭曲你的思想和观念。你闭上眼睛，拼命想要抵抗，但这只会增强肉棒被榨取和被你的——不，被那个恶魔操的感觉！[pg]");
         outputText("低头看着他，你评论说这个小混蛋在小恶魔里算是相当英俊的。看着他完美的下颌线和奇妙的肉棒，你发现自己很难为很久以前抵抗他找到理由。你是怎么抵挡住他的魅力的？他的肉棒在你的体内感觉真是太他妈爽了。伴随着爆发性的喷射，[eachcock]再次爆发，将浓稠的欲望和屈服喷射进榨乳机，而你的" + get_player().vaginaDescript(0) + "则不断地绞紧泽塔兹那长满结节的肉棒。他肿胀的阴茎淫秽地凸起，他开始射在你的体内，将主人浓稠的种子喷射进你的繁殖洞里。繁殖洞？你为什么要把你那淫荡的肉洞叫做繁殖洞？最后一个想法似乎有些不对劲，但你又说不上来。[pg]");
         outputText("你的主人在你体内射完后拔了出来，摸了摸你漏奶的乳头，而你则像个好母狗一样继续颤抖和高潮。哇，你真的是个好母狗，不是吗？当小恶魔的吟唱达到高潮时，你的胸中涌起一股自豪感，你的[face]上露出了放松的微笑。是的，你是个优秀的、用来繁殖的母狗。主人正微笑着看着你，你知道你让他感到非常高兴。希望他能很快回来再操你几次。没有他，你的小穴感觉好空虚。");
         get_player().orgasm("Vaginal");
         dynStats(DynStat.Cor(50));
         doNext(zetazBadEndEpilogue);
      }
      
      public function hermZetazOver() : void
      {
         outputText("随着你的抵抗");
         if(get_player().get_HP() < 1)
         {
            outputText("被彻底击溃");
         }
         else
         {
            outputText("湿润了你双腿间的三角地带");
         }
         outputText("，当泽塔兹叫来几个朋友时，你甚至都没有挣扎。你只是躺在那里，温顺而绝望地任由他们抬着你穿过隧道走向他们的餐厅，但从小恶魔们眼中的神情来看，他们并不打算喂你，至少不是喂食物。你之前击败的那群暴徒似乎又回来了，幸灾乐祸的欢呼声和下流的口哨声");
         if(get_player().cor < 33)
         {
            outputText("羞辱");
         }
         else if(get_player().cor < 66)
         {
            outputText("困惑");
         }
         else
         {
            outputText("唤起");
         }
         outputText("，你被扔到了一张桌子上。当他们拿出皮带绑住你的身体时，你闷哼了一声。在一分钟内，你脖子以下完全无法动弹，你的[legs]被强行分开，以便他们能轻易地接触到你的" + get_player().vaginaDescript(0) + "。[pg]");
         outputText("你的意志力开始恢复，你徒劳地挣扎着，试图挣脱紧绷的皮带，但无济于事。泽塔兹色眯眯地低头看着你双性人的身体，粗暴地摆弄着你的男性和女性器官，嘲弄道：[saystart]我不记得");
         if(get_player().cockTotal() == 1)
         {
            outputText("这两个");
         }
         else
         {
            outputText("所有这些");
         }
         outputText("在我们见面时都在这里。你是不是尝过梦魔的药剂？还是你喝了魅魔的奶？也许两者都有？不管怎样，我想你每样都可以再来一点。[sayend][pg]");
         outputText("哦，不。你惊恐地睁大了眼睛，因为他大胆的宣言，但泽塔兹只是仰起头大笑，[say:哦，是的！]他转向暴徒，用一种你听不懂的语言命令了些什么，然后又回去抚摸你的[cock]。[say:真变态。既然你下面藏着这么漂亮的小穴，为什么还要长这种东西？]小恶魔领主问道。尽管他嘴上这么问，但他并没有停止抚摸你，直到你变得饱满、坚挺并抽动起来。你可怜的" + get_player().vaginaDescript(0) + "因为被忽视而随着不断累积的性紧张隐隐作痛。[pg]");
         outputText("杂乱的脚步声和玻璃碰撞声表明那群小恶魔回来了，听起来他们带来了几百瓶那种恶心的混合物。泽塔兹松开你肿胀的阴茎，伸手去拿什么东西，然后拿着一个环形口塞回到了你的视线中。即使你被激起了性欲、被打败并被固定在桌子上，你还是尽力反抗他，但换来的只是一巴掌。小恶魔的巴掌重重地打在你脸上，把你打得晕头转向，耳朵嗡嗡作响，当你眨去眼前的金星时，你的嘴被强行掰开，舌头淫荡地伸在外面。[pg]");
         outputText("泽塔兹的另一个兄弟——也可能是儿子——递给他一根带漏斗的管子，他轻而易举地把漏斗管穿过了环形口塞。上次不知用它灌过什么东西，留下的污秽残渣让你的舌头泛起一股酸味；但更糟的是，你清楚自己马上就要被强行灌下那些受污染、能改造身体、侵蚀心智的药物。一滴先列腺液落在你的肚子上，你的大腿也开始");
         if(get_player().vaginas[0].vaginalWetness < 4)
         {
            outputText("黏腻");
         }
         else
         {
            outputText("湿透的");
         }
         outputText("，全是因为这些念头。");
         if(get_player().cor < 33)
         {
            outputText("你真的会被这种下流、堕落的念头挑起欲望吗？");
         }
         else if(get_player().cor < 66)
         {
            outputText("你真有这么变态吗？没错，那会很舒服，但身体立刻做出这种下流反应，还是让你有点羞耻。");
         }
         else
         {
            outputText("你真的有这么喜欢臣服吗？是啊，像这样大口吞下饮品确实性感得要命，但你还是希望能按自己的意愿来。至少再灌下几瓶这玩意儿之后，你大概就会开始高潮了。");
         }
         outputText("[pg]");
         outputText("[say:嘿，老大！她已经开始滴水了！亏她刚才还想反抗我们。她这是露出本性了——就是个变态荡妇，]那群人中的一个亢奋地嚷道。你在人群中分辨不出他的声音来自哪里，但这些话已经刺得你全身都因");
         if(get_player().cor < 33)
         {
            outputText("羞辱");
         }
         else if(get_player().cor < 66)
         {
            outputText("困惑");
         }
         else
         {
            outputText("性兴奋");
         }
         outputText("。小恶魔领主赞同地点点头，将第一只瓶子倒扣在漏斗上，把芳香的白色液体灌进你的嘴里。味道好极了！你还没来得及有意识地做出决定，喉咙就本能地把这奶油般的美味吞咽下去。效果来得又快又猛。温热感在你的胸口蔓延，你的" + get_player().allBreastsDescript() + "也随之变得更加沉重，与此同时，一股液体从你的" + get_player().vaginaDescript(0) + "中喷涌而出。[pg]");
         outputText("泽塔兹才刚刚开始。你还没来得及对自己的困境作出反应，下一瓶就已经倒空，更加浓稠的乳液灌满了你的嘴。你有一瞬间没有吞咽，于是小恶魔又往里倒了一瓶，让更多液体堵在你口中。面对被堕化和被淹死之间的选择，你只好努力吞下足够多的液体，好让自己能喘口气。" + get_player().SMultiCockDesc() + "鼓胀起来，喷出一股股浓稠的精液，同时又增长了半打英寸。突如其来的变化让你双眼失焦，但你总算吸进了一口新鲜空气，随后小恶魔们便开始一次倒入好几瓶。[pg]");
         outputText("你发出响亮而贪婪的吞咽声，大口咽下那些液体，而你的身体也在被你喝下的东西缓缓扭曲改造。虽然你的" + get_player().allBreastsDescript() + "和[cocks]有时会缩小，但更多时候却是在增长；被强行灌食了几分钟后，每当他们停下来让你喘口气时，你都在恳求更多。你浑身沾满了各种性液，乳房喷着奶水，小穴一被碰到就会喷出淫液。恶魔角从你的额头上鼓胀出来，向后卷过你的耳朵");
         if(get_player().horns.value > 0)
         {
            outputText("，在你原有的一对角之外又添上一对");
         }
         else
         {
            outputText("并让你呈现出异域而污秽的外貌");
         }
         outputText("。");
         if(get_player().lowerBody.type != 5)
         {
            outputText("在这场折磨中，你的[feet]一直在发生变化，但你却没有注意到自己的[legs]已经变成了如此修长柔韧的双腿，脚跟也长出了像高跟鞋一样又长又尖的突刺。");
         }
         if(get_player().tail.type != 3)
         {
            outputText("一条尾巴缠上你的腿，开始爱抚你的" + get_player().vaginaDescript(0) + "，随后猛地插进去，在你喝东西时抽插着那处不断喷涌的穴口。");
         }
         else
         {
            outputText("你的尾巴像蛇一样缠绕在你的腿上，开始抚摸你的" + get_player().vaginaDescript(0) + "，然后当你喝水时，它猛地插进去，操弄着喷水的穴口。");
         }
         outputText("小恶魔们开始起哄、吹口哨，大笑着，用他们扭曲的恶魔肉棒戳弄你的身体，你的理智在不自然的情欲熔炉中开始瓦解。[pg]");
         dynStats(DynStat.Lib(100),DynStat.Sens(100),DynStat.Lust(1000,DynStatOp.Eq),DynStat.Cor(50));
         doNext(hermZetazOverPtII);
      }
      
      public function getTrappedContinuation() : void
      {
         outputText("[pg]一声响亮的“啪”声几乎震聋了你，可见光瞬间减弱成几乎看不见的紫色光芒。真菌“叶片”已经完全包裹了你，把你封在一个肉质的紫色荚囊里。没有光线能穿透包围你的厚厚外壳，但柔和的照明从你新监狱的弯曲墙壁上脉动，随着有机腔室的微妙变移而改变强度。[pg]");
         outputText("你之前闻到的甜美香气在这样封闭的环境中变得非常，非常浓烈。浓烈到让你感到有些头晕目眩。你决定最好以最快的速度逃离这个临时监狱，你试图找到一个接缝强行挤出去，但荚囊的墙壁似乎完全无缝。你敲打着柔软的表面，但你反复的击打收效甚微。每次撞击都会带来一阵紫色的光芒，但这种真菌似乎就是为了抵抗这种挣扎而生的。水分在胶囊壁上凝结成越来越大的水珠，滴落在你脚边形成一个水坑。[pg]");
         outputText("与此同时，许多触手从下方冒了出来，正顺着你的[legs]往上爬。那具骷髅是怎么死在这个洞穴里的，现在已经很清楚了……你必须逃跑！");
         get_player().addStatusEffect(new Immobilized());
         startCombat(new EncapsulationPod(),true);
      }
      
      public function getSwordAndGetTrapped() : void
      {
         clearOutput();
         outputText("你开始走向那具尸体和它掉落的武器，但走到一半时，意想不到的事情发生了。脚下那叶片般的花瓣突然移动，以闪电般的速度猛然弹起。你");
         if(get_player().get_spe() < 50)
         {
            outputText("重重地摔在你的" + get_player().assDescript() + "上，在光滑变移的表面上滑倒了。");
         }
         else
         {
            outputText("踉跄了一下，差点摔倒，在光滑变移的表面上滑了一下。");
         }
         getTrappedContinuation();
      }
      
      public function flyToSwordAndGetTrapped() : void
      {
         clearOutput();
         outputText("你开始飞向那具尸体和它丢弃的武器，但在飞行到一半时，意想不到的事情发生了。其中一片树叶状的花瓣弹了起来，以惊人的力量拍在你的脸上，把你打落在地。你试图爬起来，但在另一片垫子光滑变移的表面上滑倒了。");
         getTrappedContinuation();
      }
      
      public function fightValaVictory() : void
      {
         spriteSelect(SpriteDb.get_s_valaSlave());
         clearOutput();
         outputText("妖精女孩瘫倒在地，长久调教出的服从夺走了她四肢反抗的力气。她扭动着身体，蜷伏成跪拜的姿势，彻底接受你成为她新的" + get_player().mf("主人","女主人") + "。这个扭曲妖精空洞的眼睛仰望着你，脸上像戴着一张狂喜的面具，焦急地等待你的惩罚；她把屁股翘在空中摇晃，淫液顺着大腿汩汩流下。看来，败北已经让这个崩坏的生物兴奋到陷入繁殖狂热。经历了刚才那场战斗后还能这么亢奋，她的耐力一定惊人。");
         outputText("你要怎么做？");
         var _loc1_:IMap = KFLAGS.flags;
         FlagDict_Impl_.arrayWriteInt(_loc1_,126,FlagDict_Impl_.arrayReadInt(_loc1_,126) + 1);
         menu();
         if(!get_player().isGenderless())
         {
            addButton(0,"做爱",valaScene.valaFightVictoryFuck);
         }
         else
         {
            addButtonDisabled(0,"做爱","此场景需要你拥有生殖器。");
         }
         setSexLeaveButton();
      }
      
      public function fightImpHorde() : void
      {
         startCombatImmediate(new ImpHorde("DeepCave"),true);
      }
      
      public function femaleZetazOverPtII() : void
      {
         clearOutput();
         hideUpDown();
         get_images().showImage("zetaz-loss-female");
         outputText("当你正在整理思绪时，泽塔兹摇摇晃晃地走下桌子，从他的一个手下那里接过一个烧瓶。他在几秒钟内就灌下了冒着气泡的粉红色液体，效果立竿见影，而且非常符合你那渴望性爱的世界观。小恶魔那原本正在慢慢缩回的阴茎，根部变粗，并迅速充血，直到它变得坚硬，并因性需求而抽搐。他饥渴地看了一眼你暴露在外的" + get_player().vaginaDescript(0) + "，然后跪了下来，将他那奇妙阴茎上长满结节的冠部对准你那流满淫液的肉缝。[pg]");
         outputText("你低头看着这个雄性，呻吟道，[say: 求你了，快点……我需要你的精液……你的孩子。把你的肉棒插进我体内！][pg]");
         outputText("泽塔兹对你的话感到惊讶，你开始想知道为什么，但他那根又长又粗的肉棒刺穿你爱之通道的灼热和快感打断了你的思考。他伸出手，开始");
         if(get_player().biggestTitSize() < 1)
         {
            outputText("粗暴地捏弄你的[nipples]，拉扯着它们，同时");
         }
         else
         {
            outputText("粗暴地揉弄你的" + get_player().allBreastsDescript() + "，一边拍打，一边用力挤捏，同时");
         }
         outputText("他开始不断地抽插你的" + get_player().vaginaDescript(0) + "，卖力地操弄着你。他的阴囊拍打在你被淫液浸湿的身体上，发出湿润的啪啪声，回荡在房间里，让你的[legs]泛起阵阵快感的涟漪。你半闭着眼睛，舌头舔舐着嘴唇，小穴在每一次抽插的末尾几乎都要喷出润滑液，你现在的样子简直就是每个男人的春梦。[pg]");
         outputText("环顾四周，你看到一大群小恶魔正在自慰，其中一个体型较大的小恶魔竟然敢在他的老板用野蛮的抽插开垦你的小穴时开口说话。[say:既然你已经用了她的嘴，那我就把那个操人的洞也用上。][pg]");
         outputText("泽塔兹挥了挥手，虽然你不确定这算是打发还是允许。他正忙着抽插，将快感送上你的脊椎，让你咯咯地笑着，发出渴望的呻吟。你已经快要高潮了！还没等你喊出这感觉有多棒，那个说话的小恶魔就跨坐在你的脖子上，把他自己的老二悬在你那曾经是嘴巴，现在却像个无脑花瓶的精液容器上方。[pg]");
         outputText("新来的小恶魔的尖端轻松地滑入你敏感的孔洞，直到你感觉到他肉结的弧度撑开了你的下巴。被体型娇小却长着巨大鸡巴的恶魔双飞的彻底荒谬感涌上心头，你皱起眉头，试图弄明白这到底是怎么回事。能有什么问题呢？你的嘴唇感觉好极了，而且你马上就要怀孕了。不过，是不是有什么理由不该这么做？好像是为了拯救什么东西？当他的肉结终于穿过你的嘴唇时，你下意识地舔舐着这个新的入侵者，一边哼哼着一边吮吸，而你被药物麻痹的大脑则试图把注意力集中在除了怀孕以外的事情上。[pg]");
         outputText("泽塔兹咕哝了一声，一插到底，将他的龟头顶进你的子宫颈，把一股浓稠的精液射进你空虚、准备就绪的子宫里。你立刻因为这个动作达到了高潮，对着塞满你嘴巴的狗鸡巴呻吟，把它当成了口塞。没有任何自然的铺垫，只有精液击中你的子宫，然后是一阵强烈到让你眼前发白的高潮。你的" + get_player().vaginaDescript(0) + "紧紧地收缩，拥抱着、挤压着泽塔兹强有力的肉棒，因为它将越来越多腐败的恶魔精液倾倒进你肥沃的繁殖地。那浓稠的黏液让你感到一阵刺痛，让你确信不久之后你就会给他生下一窝好色的小儿子。也许他们会像操瓦拉一样操你？[pg]");
         outputText("你嘴里的肉结弹了出来，你的肚子咕噜咕噜地响，感觉非常饱满。第二个小恶魔一定是在他的主人给你的小穴受精时射了。当泽塔兹退开，队伍开始排起来时，你叹了口气，瘫软在束缚具上。几秒钟后，一根带刺的橡胶猫鸡巴在你的阴道里抽动，而你敏感的嘴唇则包裹着一根马鸡巴。这一定就是涅槃的感觉。");
         get_player().orgasm("Vaginal");
         dynStats(DynStat.Cor(50));
         doNext(zetazBadEndEpilogue);
      }
      
      public function femaleZetazOver() : void
      {
         outputText("随着你的抵抗");
         if(get_player().get_HP() < 1)
         {
            outputText("被彻底击溃");
         }
         else
         {
            outputText("湿润了你双腿间的三角地带");
         }
         outputText("，当泽塔兹叫来几个朋友时，你甚至没有挣扎。你只是温顺而挫败地躺在那里，任由他们抬着你穿过隧道，走向他们的餐厅。但从小恶魔们眼中的神情来看，他们并不打算喂你……至少不是用食物。你之前击败的那群暴徒似乎又回来了，幸灾乐祸的欢呼声和口哨声");
         if(get_player().cor < 33)
         {
            outputText("羞辱");
         }
         else if(get_player().cor < 66)
         {
            outputText("困惑");
         }
         else
         {
            outputText("唤起");
         }
         outputText("，你被扔到了一张桌子上。当他们拿出皮带绑住你的身体时，你闷哼了一声。在一分钟内，你脖子以下完全无法动弹，你的[legs]被强行分开，以便他们能轻易地接触到你的" + get_player().vaginaDescript(0) + "。[pg]");
         outputText("伴随着脱去衣物的悉索声，整群小恶魔，包括泽塔兹在内，全都一丝不挂。看到你那青春诱人、被束缚的身体，他们全都变得坚挺而饱满。尽管你不愿意，但你还是");
         if(get_player().vaginas[0].vaginalWetness >= 4)
         {
            outputText("变得更加湿润");
         }
         else
         {
            outputText("变得有些湿润");
         }
         outputText("，因为那些勃起的阴茎散发出了强烈的雄性气味。");
         if(get_player().cor < 33)
         {
            outputText("你怎么会对这种令人作呕的情况产生性趣？你会被强奸、洗脑，要么被当成宠物养着，要么被扔进挤奶管里度过余生，而你的身体却表现得像个发情的荡妇！");
         }
         else if(get_player().cor < 66)
         {
            outputText("你惊讶于自己竟然对这种奇怪的情况如此兴奋。你知道自己会被强奸、下药，被当成玩具或奶牛，但你的下体却因为温暖湿润的欲望而悸动着。");
         }
         else
         {
            outputText("你是怎么落到这种让人兴奋的地步的？你会被强奸、下药，而且很可能余生都要在工厂里被挤奶。你的身体他妈的太兴奋了，你知道自己会享受每一秒，但你渴望胜利和支配的欲望却在为你失去的自由而哀悼。");
         }
         outputText("人群靠拢过来，但泽塔兹的声音响起了，带着浓浓的命令口吻，[say: 还没到时候，我的兄弟们；这个将首先属于我。我会占有她的每一个洞，然后你们每个人都可以尽情享用她。][pg]");
         outputText("小恶魔们退后，为他们的首领让出一条路，而现在变得更加威严的泽塔兹爬上了桌子。他用一种心照不宣的眼神瞥了一眼你的" + get_player().vaginaDescript(0) + "，然后微笑着继续向前走，直到他站在你的脸旁，他那充满堕落和腐化的阴茎在你的头顶上晃荡。你完全被那根在你嘴唇上方晃荡的紫黑色恶魔阴茎分散了注意力，以至于突如其来的剧痛让你完全措手不及。不适感一过去，你就扭过头去，试图找到让你感到刺痛的源头。[pg]");
         outputText("泽塔兹转过身去，一只爪子里拿着一根用过的针管，他正和他的一个同类交换另一个注射器，只是这个注射器里装满了粘稠的白色液体。他低头看着你，专注地观察着你，希望能看到某种反应，但你绝不会让他如愿！即便如此，房间变得如此明亮，以至于你的眼睛开始流泪，你不停地眨眼试图把泪水挤掉，然后半闭着眼睑来保护你可怜的瞳孔。也许这就是他想看到的？房间在旋转，你发现自己很庆幸被绑住了；即使只是坐着，你可能也会从椅子上摔下来。[pg]");
         outputText("你的嘴唇开始发麻，你不由自主地用舌头舔了舔。一阵快感在你的体内蔓延，你本能地将[legs]抵在绑带上，试图张得更开。更糟的是，你的嘴唇感觉比刚才更加丰满厚实了。");
         if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,54) > 0)
         {
            outputText("斯库拉的脸庞不由自主地浮现在你的脑海中，你意识到血管中流淌的药物肯定对你产生了类似的作用！她的面容变成了你自己的，但那厚厚的、适合吸吮阴茎的嘴唇却留了下来，渴望被插入。");
         }
         else
         {
            outputText("你不由自主地想象自己长着厚厚的、适合吸吮阴茎的嘴唇，肿胀得微微撅起，随时准备被插入。");
         }
         outputText("温暖滑腻的感觉再次滑过你的嘴唇，感觉几乎和下唇一样美妙，你喘息着将不听话的舌头缩回嘴里。[pg]");
         outputText("这一定就是泽塔兹在等待的时机，当你正分心用嘴自慰时，小恶魔小心翼翼地将下一剂混合化学药剂注射到你脖子的另一侧。你的" + get_player().vaginaDescript(0) + "");
         if(get_player().vaginas[0].vaginalWetness >= 4)
         {
            outputText("喷涌出新鲜的体液，在桌子上汇成一滩");
         }
         else if(get_player().vaginas[0].vaginalWetness >= 2)
         {
            outputText("流出大量动情的液体，滴在硬木桌上");
         }
         else
         {
            outputText("开始源源不断地滴下液体，落在被女孩体液浸湿的木板上");
         }
         outputText("。");
         if(get_player().get_inHeat())
         {
            outputText("外");
         }
         else
         {
            outputText("外来的欲");
         }
         outputText("望冲刷着你被药物麻醉的身体，你饥渴的肉缝几乎在要求被阴茎填满，被注入精液。它想要被填满……被雄性填满，被他们滚烫粘稠的精液填满。不，不是你火热的小穴想要这样——是你想要。天哪，你想要感觉自己的肚子被小恶魔的精液灌满，直到他们的后代在你的子宫里蠕动。然后你还想让他们再射进来一些！[pg]");
         outputText("那个性感……不，那个混蛋的阴茎硬得发紫，既然你现在这么饥渴，他开始蹲下来了。体内涌动的人造需求让你难以抗拒，但你必须尝试！你不能张开嘴……嗯，当那些凸起碰到你肿胀的嘴唇时，感觉太棒了。屈服不是一个选项，即使你无法阻止他操你的嘴，你也不会用舌头卷住他的肉棒舔舐，就像那样，在它凹凸不平的表面上滑动，直到被腐化的先列腺液滴在你的舌头上。是的，在你能把他的种子弄进体内之前，你不会让他离开你的嘴，其他小恶魔还在等什么？你的另一个洞太饿了！[pg]");
         outputText("你思想中精神上的不协调被一阵滚烫、粘稠的性爱浪潮所淹没，随着你对泽塔兹粗大性感的阴茎的每一次舔舐和吸吮，这股浪潮慢慢淹没了你的思维过程。他猛地插下来，用他那大象般粗长的肉棒塞满你贪婪的喉咙，让你知道他有多享受你这个口交肉洞。你伸出舌头吸吮他充满欲望的睾丸，在感受到如此多的阴茎肉和滑溜溜的舌头在你敏感如小穴的嘴唇间滑动时，你感到一阵眩晕。当他抓住你的[hair]并把整根肉棒插到底时，你的嘴唇紧紧地贴着他的腹股沟抽搐着，让你的嘴唇封住他的根部，同时他的尿道随着高潮有节奏地膨胀。随着每一次精液的喷射，你的肠胃里都会产生一种温暖的饱胀感，你努力收缩喉咙肌肉，挤出他龟头上的最后一滴精液，同时试图从嘴里传来的感觉中获得高潮。[pg]");
         outputText("完事后，小恶魔猛地站起身，将他因高潮而肿胀的肉棒从你的嘴唇中拔出，力度之大，让你感觉他的每一个凸起都在弹击你的嘴唇。口交的狂欢在你的脑海中放起了烟花，强烈到让你斗鸡眼，并让你语无伦次地嘟囔着“谢谢”和呻吟。你快乐地喘息着，舔舐着嘴唇上泽塔兹爱液的残留物，因敏感而颤抖，试图弄清楚发生了什么。这没什么用——你已经又开始发情了，而且你还没有怀孕。即使你知道情况非常不对劲，你还是欲火焚身，极度渴望成为一个母亲。也许只是因为这里有这么多强壮英俊的雄性，但他们中没有一个在操你饥渴湿润的小穴。这太不对劲了！");
         dynStats(DynStat.Lib(100),DynStat.Sens(100),DynStat.Lust(1000,DynStatOp.Eq),DynStat.Cor(50));
         doNext(femaleZetazOverPtII);
      }
      
      public function exitDungeon() : void
      {
         get_game().inDungeon = false;
         get_game().dungeons.usingAlternative = false;
         clearOutput();
         outputText("你把洞穴抛在身后，穿过深林，向营地走去。");
         doNext(get_camp().returnToCampUseOneHour);
      }
      
      public function enterDungeon() : void
      {
         get_game().inDungeon = true;
         get_game().dungeons.startAlternative(this,22,"Deep Cave");
         get_game().dungeons.setDungeonButtons();
         get_game().dungeonLoc = 10;
         get_images().showImage("dungeon-entrance-deepcave");
         if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,113) < 1)
         {
            outputText("在探索深林时，你尽力向未知的区域进发。当你拨开植被、拍打植物时，你发现了一个半被杂草覆盖的洞口，隐藏在峡谷的一侧。洞穴昏暗的入口周围有大量小恶魔的足迹。也许这就是小恶魔泽塔兹的巢穴？无论如何，你早该回去看看传送门了。你在心里记下了这个洞穴的位置，以便准备好后随时返回。");
            outputText("[pg]<b>你发现了泽塔兹的巢穴！你可以随时从地点标签页的地下城菜单中前往。</b>");
            FlagDict_Impl_.arrayWriteInt(KFLAGS.flags,113,1);
            menu();
            addButton(0,"进入",runFunc);
            addButton(14,"离开",exitDungeon);
         }
         else
         {
            outputText("你原路返回到洞穴入口。");
            doNext(runFunc);
         }
      }
      
      public function endZetaz() : void
      {
         var _g:Combat;
         clearOutput();
         get_images().showImage("item-zMap");
         if(get_player().get_weapon().isHolySword())
         {
            outputText("你手中纯洁的剑刃在跳动，催促你完成对这个小恶魔的复仇。你动作流畅，一剑刺穿了他的胸膛。当闪烁的金属灼烧他腐败的心脏时，泽塔兹在无声的痛苦中退缩，结束了他的生命。[pg]");
         }
         else if(get_player().get_weapon() == get_weapons().JRAPIER)
         {
            outputText("看了一眼你在这里获得的华丽刀刃，你决定用它精准地刺穿泽塔兹腐败的心脏，以此来磨砺它的锋芒。[pg]");
         }
         else if(get_player().get_weapon().isRanged())
         {
            outputText("你将你的[weapon]抵住小恶魔的头，然后开火。[pg]");
         }
         else if(get_player().get_weapon().isBlunt())
         {
            outputText("你挥舞着你的[weapon]砸向他的头骨，碎片四溅。[pg]");
         }
         else if(get_player().get_weapon().isAxe())
         {
            outputText("你挥舞着你的[weapon]砸向他的头骨，将他变异的小恶魔脸劈成两半。当你拔出斧头时，他倒在了地上。[pg]");
         }
         else if(get_player().get_weapon().isSharp())
         {
            outputText("你用你的[weapon]迅速一挥，切断了他的脖子。泽塔兹惊恐地抓着他被割裂的喉咙，然后脸朝下倒在了迅速形成的血泊中。[pg]");
         }
         else
         {
            outputText("你双手抓住他的头，猛地一扭，瞬间扭断了他的脖子。你低头怒视着你第一个恶魔敌人的尸体，说道：[say: 如你所愿。][pg]");
         }
         outputText("既然他死了，你得看看这里是否有什么线索能带你找到这个“莉希丝”，这样你就能一劳永逸地结束这场影响玛瑞斯的荒谬瘟疫。也许你甚至能回家，见见你的家人，并与某些长老进行一次相当暴力的谈话？你翻遍了这里的每一个抽屉、包裹和箱子，但你找到的只有缠腰布、极其恋物癖的色情物品和垃圾。为了寻找任何线索，你甚至搜查了床底并移动了家具，但都无济于事。你把你的不满发泄在泽塔兹的家具上，用尽全力把它们撞在一起。[pg]");
         outputText("你手中的椅子碎裂了，被它撞击的书桌也裂开了，你感觉好了一点。一张羊皮纸在这一切的中间飘来飘去，它从某个隐藏的隔间里被释放出来，大部分完好无损。其中一个角被撕掉了，中间有一道裂缝，但仍然完全清晰可辨。这是一张地图！虽然这张秘密图表相当粗糙，但它描绘了一条蜿蜒的小径，绕过了许多鹰身女妖的巢穴、牛头人的洞穴以及各种无法辨认的陷阱，最终到达云雾缭绕的山峰。一旦到达顶部的恶魔防御工事，这幅画就失去了很多细节，但一旦你进入了莉希丝的权力中心，追踪她应该不会太难，对吧？[pg]");
         outputText("<b>(获得关键物品：泽塔兹的地图！)</b>");
         get_player().createKeyItem("Zetaz\'s Map",0,0,0,0);
         var _loc1_:IMap = KFLAGS.flags;
         FlagDict_Impl_.arrayWriteInt(_loc1_,128,FlagDict_Impl_.arrayReadInt(_loc1_,128) + 1);
         get_player().upgradeBeautifulSword();
         _g = get_combat();
         doNext(function():void
         {
            _g.cleanupAfterCombatNewPage();
         });
      }
      
      public function encapsulationVictory() : void
      {
         var _loc1_:* = null as IMap;
         if(get_monster().get_HP() <= 0)
         {
            _loc1_ = KFLAGS.flags;
            FlagDict_Impl_.arrayWriteInt(_loc1_,117,FlagDict_Impl_.arrayReadInt(_loc1_,117) + 1);
            clearOutput();
            outputText("在你的猛攻下，荚膜的壁破裂了。抓住你的触手瞬间失去了力量，变得像软面条一样无力。荚膜海绵状的表面塌陷了，“花瓣”裂开，伴随着沉闷的“啪嗒”声掉落在地上。你站在那里，为重获自由而欢欣鼓舞。你赢了！");
            outputText("[pg]你最初靠近的那把细剑仍然躺在那里，你拿走了你的战利品。");
         }
         get_combat().cleanupAfterCombat();
      }
      
      public function defeatZetaz() : void
      {
         var _loc1_:IMap = KFLAGS.flags;
         FlagDict_Impl_.arrayWriteInt(_loc1_,114,FlagDict_Impl_.arrayReadInt(_loc1_,114) + 1);
         clearOutput();
         if(get_monster().get_HP() < 1)
         {
            outputText("泽塔兹跪倒在地，伤得太重无法继续。他抬起头看着你，眼中充满无助的愤怒，问道：[say: 你现在满意了吗？那就动手吧，杀了我。反正自从遇到你，我的生活就不值得过了。][pg]");
         }
         else
         {
            outputText("泽塔兹跪倒在地，从缠腰布下掏出他那根巨大的、流着先列腺液的阴茎。他抬起头看着你，几乎要哭出来，呻吟道：[say: 为什么？毁了我的生活还不够吗？你还要让我在你脚下打飞机？杀了我吧，我不想活了。][pg]");
         }
         outputText("他还不能死。你需要知道他的主人，这个“莉希丝”在哪里。听起来她像是恶魔的婊子女王，如果你要打破这个恶性循环");
         if(get_player().cor > 66)
         {
            outputText("或者取代她的位置");
         }
         outputText("，你需要找到她并打倒她。你该怎么做？");
         outputText("[pg]性审问，杀了他，还是提供安全以换取信息？[pg]");
         menu();
         addButton(0,"性爱",sexualInterrogation).hint("用链条把小恶魔锁起来，对他进行性审问。");
         addButton(1,"了结他",endZetaz).hint("杀掉这只小恶魔。毕竟，他罪有应得。");
         addButton(2,"放生",releaseZForInfo).hint("在得到你需要的信息后放走小恶魔。");
         if(get_creepingTaint() && !get_player().hasPerk(PerkLib.PurityBlessing) && FlagDict_Impl_.arrayReadInt(KFLAGS.flags,2666) < 1)
         {
            addButton(3,"解药",askForCure).hint("要求他提供治疗你状况的解药。");
         }
      }
      
      public function checkExit() : void
      {
         clearOutput();
         if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,2979) >= 3 && FlagDict_Impl_.arrayReadInt(KFLAGS.flags,128) <= 0)
         {
            outputText("门似乎被魔法锁住了！你必须打败泽塔兹才能离开。");
            doNext(roomGatheringHall);
         }
         else
         {
            roomTunnel();
         }
      }
      
      public function checkDoor1() : void
      {
         clearOutput();
         if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,115) <= 0)
         {
            outputText("门纹丝不动。");
            doNext(roomGatheringHall);
         }
         else
         {
            roomZetazChamber();
         }
      }
      
      public function buyLiddellium() : void
      {
         var itype:ItemType;
         var _g:DeepCave;
         clearOutput();
         if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,2728) == 1)
         {
            outputText("碰巧问一下，有可能买到利德尔药水吗？它是由恶魔制造的，所以肖恩肯定知道某种获取途径。");
            outputText("[pg]肖恩不自在地动了动。[say: 我确实能弄到一些。但价格会非常昂贵。][pg]你打算等他报个价，再决定值不值得。[pg][say: 1000宝石。目前我手头确实有一些。][pg]与你能买到的其他任何东西相比，这价格都相当高昂。[pg][say: 稀有、库存极少的特别定制物品，价格高昂也是理所当然的。]");
            doNext(incubusShop);
            return;
         }
         outputText("你要求买一瓶利德尔药剂。肖恩忐忑不安地拿出一小瓶这种混合物，然后满怀期待地伸出手。");
         outputText("[pg][say: 1000宝石。]");
         if(get_player().get_gems() >= 1000)
         {
            _g = this;
            itype = get_consumables().LIDDELL;
            doYesNo(function():void
            {
               _g.incubusTransact(itype);
            },incubusShop);
         }
         else
         {
            outputText("[pg]你买不起");
            doNext(incubusShop);
         }
      }
      
      public function buyItem(param1:Number = 0) : void
      {
         spriteSelect(SpriteDb.get_s_sean());
         if(param1 == 0)
         {
            incubusBuy(get_consumables().NUMBROX);
         }
         if(param1 == 1)
         {
            incubusBuy(get_consumables().SENSDRF);
         }
         if(param1 == 2)
         {
            incubusBuy(get_consumables().REDUCTO);
         }
         if(param1 == 3)
         {
            incubusBuy(get_weapons().SUCWHIP);
         }
      }
      
      public function badEndValaNumber2Pt2() : void
      {
         spriteSelect(SpriteDb.get_s_valaSlave());
         clearOutput();
         outputText("[say:当我们抓住瓦拉时，我曾想过把她像水晶避孕套一样在我的鸡巴上弄碎，但我很高兴我选择把她培养成我的宠物。]小恶魔的声音很熟悉，你的脑海中突然浮现出你穿过传送门来到这个世界时遭受的第一次侵犯的记忆。泽塔兹。他说过永远不要忘记泽塔兹这个名字。你的眼睛惊恐地转动着，但他托着你的下巴，他那色眯眯的脸占据了你的视线。[say:作为对听话的小瓦拉的奖励，我决定把你改造成她的样子。我们会把你腰上所有肥胖的肉都挤碎，把你的躯干绑起来，直到你虚弱得走不动路，给你灌满药物和精液，甚至看到你的名字都会感到痛苦，]他敲了敲他为你准备的青铜牌，那是妖精的翻版。[say:为什么，几个月后，我们很难分辨出你们两个。]一股新的被妖精润滑过的小恶魔精液泵入你的腹部，橡胶束腰紧绷着，但还是撑住了，把精液冲回你的喉咙，直到你感觉自己可能会淹死在起泡的奶油中。[pg]");
         get_images().showImage("badend-vala");
         outputText("然而，没有时间去思考你的命运，因为小恶魔的黑色毒药似乎起作用了，你感觉到全身都在燃烧。");
         if(!get_player().hasVagina())
         {
            outputText("在你的大腿之间，一阵湿润的吧唧声撕裂了空气，一股突然沸腾的热量充满了你的腹股沟，一个新的小穴在你的鸡巴正下方打开了。");
            get_player().createVagina(true,1,0);
         }
         if(get_player().biggestTitSize() < 1)
         {
            outputText("你浑身发抖，感觉胸口被漂浮在扁桃体处的精液淹没了。在你的眼前，胸前的束腰被推下，一对肿胀的乳房占据了你的视线，里面充满了乳汁，渴望从你肿胀的乳头中被吸出。");
         }
         outputText("你肩胛骨之间的空间感觉像是被撕开了，你的肌肉重新编织，薄如蜻蜓翅膀的轻纱般的翅膀从你的皮肤中爆裂而出，几乎和你的身高一样长，紧贴着它们的橡胶对应物。你每一寸皮肤似乎都在起泡，一种熔化的玻璃浇在你身上的感觉让你痛苦地颤抖，你的毛孔封闭，皮肤呈现出光泽。[pg]");
         outputText("[say:你看起来越来越像她了，]泽塔兹称赞道，抚摸着你现在完美无瑕的脸庞。[say:别担心你那讨厌的脑子——我不喜欢像我的一些同类那样用药物抹去那种不完美。不，我们只会利用你，直到你崩溃。也许我也会让瓦拉时不时地拥有你。那不是很有趣吗？我相信你们两个会变得形影不离的。]泽塔兹后退一步，示意紧紧抓住妖精的小恶魔们下来。[say:我们为什么不开始呢？]");
         get_game().gameOver();
      }
      
      public function badEndValaNumber2() : void
      {
         spriteSelect(SpriteDb.get_s_valaSlave());
         clearOutput();
         outputText("你醒来时头痛欲裂，嘴里有一股难闻的味道。你挣扎着，却发现你的四肢被锁链锁住，你的[legs]被一层厚厚的橡胶涂层绑住，痛苦地挤压着你的下半身。事实上，你身上被装上了好几块同样材质的橡胶部件——最引人注目的是那件让你呼吸困难的黑色束腰，它将你的腰部束缚成一种极度女性化的幻想。你还被装上了一对巨大的橡胶妖精翅膀，通过肩带固定在肩膀上，痛苦地将你的胸部向前拉扯。一个O型口塞被扣在你的脸上，连接着一根长长的透明管子，管子被塞进了你喉咙里一两英尺深的地方。你试图把它摇松，但它太深了，如果没有帮助，你根本没有希望把它取下来。[pg]");
         outputText("你的挣扎让你的俘虏者们意识到你已经醒了。一个高大的小恶魔走到你的视线前方，他把手臂背在身后，若有所思地欣赏着你的困境。他没有说话，只是拿出一块刻有你名字的青铜牌，用长长的手指在金属板上敲了敲。然后，他指了指你被连接的那个装置。通向你嘴里的管子向上蜿蜒，连接到一个巨大的漏斗，漏斗上有一个可扭动的旋钮。在漏斗上方，那个四英尺高的妖精被新的锁链悬挂着，几乎被一群微小的小恶魔覆盖。这些恶魔只有一英尺高，也许是未成年的或者是混血儿，它们紧紧抓住她的皮肤，既渴望她的肉体，又害怕掉下去，利用任何方便的洞穴既用来操，又用来防止掉落。两个同时在用她的小穴，另一个在她的屁股上，第四个在她的脸上，一对在操她的双手，还有半打在她的腋窝、膝盖后面摩擦自己，甚至只是用她的紫发增加摩擦力来打飞机。它们疯狂发情射出的所有精液都溅入下方宽阔的盆中，流入连接着你管子的漏斗里。[pg]");
         outputText("你面前的高大小恶魔扭动了漏斗上的旋钮，令你恐惧的是，那汹涌的小恶魔精液和妖精淫液顺着蜿蜒的管道倾泻而下，滑过你毫无防备的嘴唇，顺着你被插入的食道流下。你的胃对这顿地狱般的饭菜感到反胃，但它还是不断地从那个被过度操弄的妖精女孩和她那些摇摇欲坠的后代那里倾倒出来。当精液顺着软管流下时，那个沉默的小恶魔拔开一个小黑瓶的塞子，把它倒进漏斗里，与流入你肚子里的沸腾河流混合在一起。你试图闭上喉咙，试图呕吐，试图咬穿口塞，做任何事情来阻止这种混合物到达你体内，但你的尝试都是徒劳的，黑色的液体流进了你的身体。你浑身发抖，脑子里飞速寻找逃跑的方法，但当那个显然是小恶魔首领的家伙弯下腰，用手托起你的下巴，露出参差不齐的牙齿，露出邪恶的笑容时，你的思绪被打断了。");
         doNext(badEndValaNumber2Pt2);
      }
      
      public function badEndValaNumber1() : void
      {
         spriteSelect(SpriteDb.get_s_valaSlave());
         clearOutput();
         outputText("当你恢复意识时，你已经不在你昏迷的那个洞穴般的地牢里了。你眨了眨眼，试图适应周围明亮的光线，但无济于事。每一种感官都在燃烧，你不可能在不刺激到某些神经末梢的情况下移动，一阵阵快感沿着你的敏感区域辐射开来。你试图思考，试图推断出你在哪里，但让一个想法在脑海中停留超过一分钟都极其困难，就好像你的大脑被厚厚的羊毛捂住了一样。你试图回忆发生了什么，但那也超出了你的能力范围。所有这些脑力活动都让你头疼，所以你放弃了，只是沉浸在身体周围的感觉中。一张闪烁着光芒的妖精面庞映入眼帘，一个想法在你昏沉的大脑中开辟出一条清晰、白热化的道路。认出她打消了你所有的疑虑和担忧。你的女主人。这是你的女主人。[pg]");
         outputText("妖精女孩灿烂地笑着，深情地抚摸着你的脸，她那杏仁状的粉色眼睛里充满了甜蜜的欲望。[say: 我的宠物今早怎么样？]她询问道，声音像银铃般在你脑海中回荡。[say: 噢，你醒来还是会头疼吗，宠物？哦，让你的女主人帮你清理一下你那可怜的脑袋吧。]她拔开一小瓶粉色液体的塞子，把它放在你的唇边，但你几乎不需要鼓励。你用嘴包住这瓶催情药剂，贪婪地喝了下去，吸吮着这如酒般甜美的药水，火热的激情瞬间驱散了你脑海中的痛苦，你伸出手去拥抱你亲爱的女主人。她咯咯地笑着，轻轻一碰就把你赶了回去。[say: 不，不，宠物。首先是进餐时间，记得吗？每天我都从那些讨厌的恶魔那里偷更多的药水，我们来看看它们有什么作用，你不记得了吗？][pg]");
         get_images().showImage("badend-vala");
         outputText("隐约地，在你脑海的某个角落，你似乎记得以前有过这样的对话，也许有好几次。而且你的女主人以前不是那个很难理清思绪的人吗？在你仅仅是宠物之前，人们不是叫你别的什么吗？一个名字在触手可及的地方飘荡，但当你的女主人拿出一系列令人眼花缭乱的瓶子时，你把它摇走了。她喂你喝下一种浓稠的绿色啤酒，让你的肚子充满了令人愉悦的温暖，让你的头脑发晕。你能感觉到你的身体在发生变化，随着你的" + get_player().vaginaDescript(0) + "变得更深更宽，你咯咯地笑着，手指在你的小穴里进进出出，玩弄着那条火热的通道。你的女主人自己也喝了一大口，当浓稠的白色液体滚下她的喉咙时，她发出了咕咕的声音。她发出一声充满活力的惊喜喘息，你可以看到她那微小的、像快乐蜂鸣器一样的阴蒂在你眼前变得更长更粗。它肿胀到六英寸，然后是八英寸，最后停在10英寸。渐渐地，它变得清晰起来，它的顶端变宽成一个龟头，顶部开了一条小缝，一滴珍珠般的精液滚落下来，顺着鲜艳的粉色肉棒流下。她用纤细的手指抚摸着新长出的鸡巴，兴奋地颤抖着，饥渴地打量着你的身体。");
         outputText("你毫无意识地咯咯笑着，任由你的女主人用你顺从的身体满足她那无法抑制的欲望，享受着这份屈服。她粗暴地骑着你，狠狠地操着你那被药物和性爱麻痹的身体，足以将你一天的记忆从脑海中抹去，就像她昨天和前天做的那样。随着时间的推移，你在女主人面前失去了越来越多的自我，最终，剩下的只有这个扭曲妖精的破碎宠物。");
         get_game().gameOver();
      }
      
      public function askForCure() : void
      {
         clearOutput();
         outputText("你要求他给你一种解药，以解除你刚到玛瑞斯时他给你喝的混合物。");
         outputText("[pg][say: 解药？！我干嘛要弄出解药？根本没这回——]");
         outputText("[pg]你一把掐住他的脖子，死死地瞪着他。[say: 如果你给我解药，你或许还能活。如果你不给，你绝对会死。好好想想你现在该怎么做。][pg]小恶魔咽了口唾沫。[say: 我——我准备了点东西，以防有叛徒试图诅咒我。不过那不是给非恶魔用的。效果可能会很强烈。]");
         if(get_player().demonScore() > 4)
         {
            outputText("[pg]好吧，这对你来说已经无关紧要了。");
         }
         else
         {
            outputText("[pg]你必须冒这个险。");
         }
         outputText("你要求泽塔兹把“解药”拿给你。他极不情愿地打开一个箱子，递给你一个装有粘稠紫色液体的注射器。");
         outputText("[pg]你深吸一口气，将它扎进体内。随着注射，你感到胸口的寒意消散了。然而，没过多久，你反而感到一阵燥热。");
         if(get_player().hasCock())
         {
            outputText("你的[cocks]淫秽地肿胀起来，每一次跳动都喷溅出先列腺液。你想要狠狠操点什么的欲望几乎夺走了你的理智。");
         }
         if(get_player().hasVagina())
         {
            outputText("你的[vagina]充血肿胀，渗出淫液。它不由自主地收缩着，渴望着一根肉棒来填满它。");
         }
         outputText("你跪倒在地，欲望膨胀到了难以置信的地步。现在做爱一定会<i>非常爽</i>！像泽塔兹这样的恶魔一直都是这种感觉吗？放弃的念头在你的脑海中闪过，你的脑海里充斥着自己在各种颓废的性爱场景中的画面。也许当个恶魔也没那么糟？");
         outputText("[pg]就在你差一点就要当场自慰的时候，你的头脑清醒了过来，燥热也减轻了。你对周围环境的感知恢复了，你注意到泽塔兹在你发呆的时候靠近了你。他手里拿着一个项圈。你用目光刺穿了他，他吓得退缩了。[say: 好吧，你没有因为我的“解药”发疯。这意味着我应该活下去，对吧？]虽然没有完全起效，但<b>泽塔兹的血清减轻了他那药剂的效果！</b>");
         dynStats(DynStat.Cor(15),DynStat.Lib(10),DynStat.Sens(10),DynStat.Lust(50));
         FlagDict_Impl_.arrayReadInt(KFLAGS.flags,2666);
         outputText("[pg]现在你可以决定怎么处置泽塔兹了。");
         menu();
         addButton(0,"性爱",sexualInterrogation).hint("用链条把小恶魔锁起来，对他进行性审问。");
         addButton(1,"了结他",endZetaz).hint("杀掉这只小恶魔。毕竟，他罪有应得。");
         addButton(2,"放生",releaseZForInfo).hint("在得到你需要的信息后放走小恶魔。");
      }
   }
}

