package classes.scenes.areas.forest
{
   import classes.Appearance;
   import classes.BaseContent;
   import classes.CoC;
   import classes.Cock;
   import classes.CockTypesEnum;
   import classes.DynStat;
   import classes.ImageManager;
   import classes.Monster;
   import classes.PerkLib;
   import classes.Player;
   import classes.StatusEffects;
   import classes.TimeAwareInterface;
   import classes.Vagina;
   import classes._FlagDict.FlagDict_Impl_;
   import classes.display.SpriteDb;
   import classes.globalFlags.KFLAGS;
   import classes.internals.Utils;
   import classes.items.ConsumableLib;
   import classes.items.Weapon;
   import classes.items.WeaponLib;
   import classes.scenes.Camp;
   import classes.scenes.Inventory;
   import classes.scenes.api.Encounter;
   import coc.view.CoCButton;
   import flash.Boot;
   import haxe.IMap;
   
   public class CorruptedGlade extends BaseContent implements Encounter, TimeAwareInterface
   {
      
      public function CorruptedGlade()
      {
         if(Boot.skip_constructor)
         {
            return;
         }
         super();
         CoC.timeAwareClassAdd(this);
      }
      
      public function treeBoobFun() : void
      {
         clearOutput();
         get_images().showImage("cGlade-trees");
         spriteSelect(SpriteDb.get_s_corruptedGlade());
         outputText("你小心翼翼地避开林地里的其他危险，带着好奇和渴望靠近那些奇怪的树木。走近一看，很容易就能看到树皮上长出的奇怪东西——几十个看起来很饱满的乳房，每个乳房顶端都有一个肿胀且渗出液体的乳头。你摸了摸其中一个，惊叹于它巧克力色皮肤的光滑质感。作为回应，一股树液从乳头渗出，顺着弯曲的表面滑落。[pg]");
         outputText("你向前倾身，舔舐着乳头的表面，品尝着滴落的树液的甜味。随着更多树液从完全勃起的树乳头上滴落，这东西的味道几乎让你无法抗拒，就像糖浆奶油一样。你无法抗拒测试这个荒谬的怪东西，你用嘴唇包裹住整个乳头，用力吮吸。这棵树似乎在用新鲜的粘稠树液来回应你的努力。你的舌头因为嘴里罪恶的甜味而刺痛和振动，在乳头周围打圈，从肿胀的植物水壶中哄出更多的花蜜。你很容易迷失在那味道中，陷入交替吮吸、吞咽和舔舐的节奏中。[pg]");
         outputText("过了一会儿，你意识到乳房早就被你饥饿的嘴巴吸干了，你“啵”的一声拔了出来，让你的舌头滑过你现在过度敏感的嘴唇。似乎你的整个嘴巴都受到了树液的影响，现在就像少女的私处一样敏感和容易接受。你觉得自己已经饱了，喝不下更多的树液了，你准备离开这个变态的地方。");
         dynStats(DynStat.Sens(1),DynStat.Lust(15),DynStat.Cor(0.5));
         get_player().slimeFeed();
         if(!get_player().hasStatusEffect(StatusEffects.LustyTongue))
         {
            if(Utils.rand(4) == 0)
            {
               outputText("这种感觉似乎并没有消退，反而在接下来的一小时里变得越来越强烈。只要你舔嘴唇或吃东西，就很难不被激起性欲。");
               get_player().createStatusEffect(StatusEffects.LustyTongue,24,0,0,0);
            }
            else
            {
               outputText("值得庆幸的是，这种感觉在几分钟后就消失了，让你感觉稍微敏感了一点。");
            }
         }
         if(Utils.rand(2) == 0)
         {
            if(get_player().biggestTitSize() > 5)
            {
               outputText("当你重新穿好衣服时，你感觉到胸部增加了重量。过了一会儿，你意识到你原本就很大的胸部变得更大了。");
               get_player().growTits(1,1 + Utils.rand(3),false,1);
            }
            else if(get_player().biggestTitSize() == 0)
            {
               outputText("当你重新穿好衣服时，[b:你意识到你长出了一对丰满的乳房！]也许这终究是个好主意……");
               get_player().growTits(1,2 + Utils.rand(3),false,1);
            }
            else
            {
               outputText("当你重新穿好衣服时，你意识到你的乳房变大了很多！也许你可以等你不那么饱的时候再来，让它们变得更丰满一点。");
               get_player().growTits(1,1 + Utils.rand(3),false,1);
            }
         }
         doNext(get_camp().returnToCampUseOneHour);
      }
      
      public function trappedSatyr() : void
      {
         clearOutput();
         get_images().showImage("cGlade-satyr");
         spriteSelect(SpriteDb.get_s_stuckSatyr());
         outputText("当你在树林中漫步时，你发现自己又误入了一片腐化林地。然而，这次这片变态的树林并非空无一人；响亮的欢愉咩咩声和嘶鸣声划破了空气，当你拨开一丛长满滴着汁液的龟头状浆果的灌木时，你发现了声音的来源。[pg]");
         outputText("一个人形身影，长着一对山羊犄角和两条山羊腿——是个萨提尔——此刻正把整根肉棒连根带蛋地埋在林间一朵阴道花里，一边爽得嗷嗷直叫，一边饥渴地猛干那贪婪吸吮的花穴深处。偶尔他也会停下来，扭头从旁边一团乳房似的肉瘤上吧唧吧唧地嘬上几口；显然，他才不在乎自己给困在这儿，即便那朵花会把他彻底榨干。[pg]");
         unlockCodexEntry(2053,false,true);
         if(!get_player().hasCock())
         {
            outputText("你实在看不出有什么办法能利用这个局面，所以你干脆转身原路返回。");
            doNext(get_camp().returnToCampUseOneHour);
         }
         else
         {
            outputText("你可以看到他的山羊尾巴在他紧致、有弹性的屁股瓣上方快乐地甩动着，被丢在一旁的缠腰布根本遮不住他那成熟待摘的黑樱桃。你要趁他分心、毫无防备的时候，狠狠地蹂躏他的屁股吗？[pg]");
            menu();
            addButton(0,"蹂躏",rapeSatyr);
            addButton(14,"离开",ignoreSatyr);
         }
      }
      
      public function timeChangeLarge() : Boolean
      {
         return false;
      }
      
      public function timeChange() : Boolean
      {
         var _loc1_:* = null as IMap;
         var _loc2_:int = 0;
         if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,2078) > 1 && FlagDict_Impl_.arrayReadInt(KFLAGS.flags,2078) < 100)
         {
            if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,2226) > 0 && Utils.rand(6) == 0)
            {
               _loc1_ = KFLAGS.flags;
               FlagDict_Impl_.arrayWriteInt(_loc1_,2078,FlagDict_Impl_.arrayReadInt(_loc1_,2078) + 1);
            }
            if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,2225) > 0 && Utils.rand(4) == 0)
            {
               _loc1_ = KFLAGS.flags;
               FlagDict_Impl_.arrayWriteInt(_loc1_,2078,FlagDict_Impl_.arrayReadInt(_loc1_,2078) + 1);
            }
            if(get_game().time.days % (3 + Math.floor(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,2078) / 15)) == 0 && get_game().time.hours > 23)
            {
               _loc2_ = 2078;
               FlagDict_Impl_.arrayWriteInt(KFLAGS.flags,_loc2_,FlagDict_Impl_.arrayReadInt(KFLAGS.flags,_loc2_) - 1);
               if(get_game().holliScene.saveContent.growingGlades && FlagDict_Impl_.arrayReadInt(KFLAGS.flags,2078) > 1)
               {
                  _loc2_ = 2078;
                  FlagDict_Impl_.arrayWriteInt(KFLAGS.flags,_loc2_,FlagDict_Impl_.arrayReadInt(KFLAGS.flags,_loc2_) - 1);
               }
            }
         }
         if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,2078) >= 100)
         {
            if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,2226) > 0)
            {
               FlagDict_Impl_.arrayWriteInt(KFLAGS.flags,2226,0);
            }
            if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,2225) > 0)
            {
               FlagDict_Impl_.arrayWriteInt(KFLAGS.flags,2225,0);
            }
         }
         return false;
      }
      
      public function tentacleFun() : void
      {
         var _loc1_:int = 0;
         var _loc2_:int = 0;
         clearOutput();
         get_images().showImage("cGlade-vines");
         spriteSelect(SpriteDb.get_s_corruptedGlade());
         if(int(get_player().vaginas.length) > 0 && Utils.rand(2) == 0)
         {
            outputText("你漫步走到一丛垂下的、看起来很淫荡的藤蔓前，沿途脱下了你的[armor]。你的指尖划过那些顶端呈球状、像触手一样的藤蔓，你找到了一根看起来");
            _loc1_ = Utils.rand(3);
            _loc2_ = 0;
            if(_loc1_ == 0)
            {
               outputText("对你的");
               switch(get_player().vaginas[0].vaginalLooseness)
               {
                  case 0:
                     _loc2_ = 0;
                     break;
                  case 1:
                     _loc2_ = 4;
                     break;
                  case 2:
                     _loc2_ = 16;
                     break;
                  case 3:
                     _loc2_ = 40;
                     break;
                  case 4:
                     _loc2_ = 65;
                     break;
                  default:
                     _loc2_ = 100;
               }
            }
            if(_loc1_ == 1)
            {
               outputText("非常适合你的");
               switch(get_player().vaginas[0].vaginalLooseness)
               {
                  case 0:
                     _loc2_ = 3;
                     break;
                  case 1:
                     _loc2_ = 7;
                     break;
                  case 2:
                     _loc2_ = 26;
                     break;
                  case 3:
                     _loc2_ = 60;
                     break;
                  case 4:
                     _loc2_ = 115;
                     break;
                  default:
                     _loc2_ = 175;
               }
            }
            if(_loc1_ == 2)
            {
               outputText("几乎大得塞不进你的");
               switch(get_player().vaginas[0].vaginalLooseness)
               {
                  case 0:
                     _loc2_ = 6;
                     break;
                  case 1:
                     _loc2_ = 9;
                     break;
                  case 2:
                     _loc2_ = 34;
                     break;
                  case 3:
                     _loc2_ = 78;
                     break;
                  case 4:
                     _loc2_ = 135;
                     break;
                  default:
                     _loc2_ = 210;
               }
            }
            outputText(get_player().vaginaDescript(0) + "来说有点小的藤蔓。你轻轻一拉，成功地扯下了一段藤蔓，让它垂在潮湿的森林土壤上。当你躺下并张开双腿时，那柔软的泥土成了你完美的垫子。你用双手握住藤蔓，引导它靠近你的" + get_player().vaginaDescript(0) + "的入口。覆盖在藤蔓上的水珠在第一次接触到你的阴唇时，就带来了诱人的刺痛感。[pg]");
            if(_loc1_ == 0)
            {
               outputText("伴随着一声性感的轻叹，你将蘑菇状的顶端滑入你的阴唇之间，感觉它在插入你时微微鼓起。藤蔓的润滑液与你自己的体液混合，把你发情的小穴变成了一个湿滑的通道。你把它一直插到子宫颈，轻松地适应了它较小的尺寸，开始把它当作你最喜欢的假阳具来使用。在你的" + get_player().vaginaDescript(0) + "深处，藤蔓的润滑液开始让你的通道感到刺痛，这种感觉不断增强，直到你整个通道都充满了像阴蒂一样敏感的快感。[pg]");
            }
            if(_loc1_ == 1)
            {
               outputText("伴随着一声轻哼，你勉强将藤蔓粗大的顶端塞进你的阴唇之间，感受着那肿胀的凸起在你体内跳动，你用它插入了自己。藤蔓的润滑液与你自己的体液混合，把你发情的小穴变成了一个湿滑的通道。你强行塞入藤蔓的剩余部分，把它一直插到子宫颈，享受着它带给你的充实感，你开始像使用一个淫秽的绿色假阳具一样，把它抽插进出。在你的" + get_player().vaginaDescript(0) + "深处，藤蔓的润滑液开始让你的通道感到刺痛，这种感觉不断增强，直到你整个通道都充满了像阴蒂一样敏感的快感。[pg]");
            }
            if(_loc1_ == 2)
            {
               outputText("伴随着一声绝望的闷哼，你勉强将藤蔓那淫秽的龟头塞进你的阴唇之间。肿胀的凸起在你体内跳动，当它感受到你" + get_player().vaginaDescript(0) + "的温暖和紧致时，把你撑得有些难受。藤蔓的润滑液开始与你自己的体液混合，迅速把你发情的小穴变成了一个湿滑的通道。你设法把藤蔓剩下的部分全部塞进去，直到抵住你的子宫颈，陶醉在被撑得如此宽大的感觉中，你开始像使用一个超大号的性玩具一样，在你的" + get_player().vaginaDescript(0) + "里抽插它。在你的" + get_player().vaginaDescript(0) + "深处，藤蔓的润滑液开始让你的通道感到刺痛，这种感觉不断增强，直到你整个通道都充满了像阴蒂一样敏感的快感。[pg]");
            }
            if(get_player().cuntChange(_loc2_,true))
            {
               outputText("[pg]");
            }
            outputText("当你的大脑试图应对从腹股沟传来的感官超载时，世界上的其他东西都消失了。你隐约意识到自己的双手正抽插着那根滑溜溜的藤蔓，进进出出，进进出出，一遍又一遍。臀部挺动，" + get_player().vaginaDescript(0) + "紧缩，大腿颤抖，你迎来了众多高潮中的第一次。令人难以置信的是，你腹股沟的敏感度倍增，几乎让你在快感中晕厥。你一次又一次地高潮，在泥土中扭动，将那根腐化的阴茎藤蔓在你痉挛的小穴里抽插。当藤蔓开始向你体内注入它那奇怪的液体时，你翻起了白眼，最终在保持清醒的挣扎中败下阵来。[pg]");
            outputText("一两个小时后，你醒了过来，感觉非常酸痛，但很满足。藤蔓肯定在某个时候弹了出来，那个球茎现在正靠在你的阴唇上。你伸手去把它拂开，在触碰到你下体嘴唇的那一刻，你几乎又要高潮了，它们仍然很敏感，并且因为刚刚容纳了那根过大的触手而微微张开。当你站起来时，一股白色的粘液从你的大腿间流出，立刻渗回了土壤中。稍微伸展了一下身体后，你穿上装备，带着微笑回到了营地。[pg]");
            get_player().orgasm("Vaginal");
            dynStats(DynStat.Sens(5),DynStat.Cor(2));
            if(Utils.rand(3) == 0 && get_player().hair.color != "green")
            {
               outputText("没走多远，你就意识到你身上所有的毛发都变成了翠绿色。<b>你现在有一头绿发了。</b>");
               get_player().hair.color = "green";
            }
            if(Utils.rand(4) == 0 && get_player().hips.rating <= 10)
            {
               outputText("你的腰部以下发生了一阵奇怪的变化，让你的[armor]感觉变紧了。<b>你的臀部变大了</b>，变成了[hips]。");
               var _temp_1:* = get_player().hips;
               _temp_1.rating = _temp_1.rating + (Utils.rand(3) + 1);
               var _temp_2:* = get_player();
               _temp_2.fertility = _temp_2.fertility + 1;
            }
            get_player().knockUp(39,120);
         }
         else
         {
            outputText("你走近那些肿胀的藤蔓，注意到其中一个蘑菇状的球茎尖端正滴落着液体。你一边靠近一边舔着嘴唇，期待着品尝这片林地里被污染的植物，心跳也随之加快。你轻轻地抓住一根，把它举起来，注意到它头部弯曲处的卵石状纹理，以及它与茎干重新连接处的柔软凸起。整个东西摸起来湿漉漉的，上面仅仅覆盖着一层植物似乎分泌出的液体作为润滑。[pg]");
            outputText("把它拉近，你张大嘴巴，足以将植物含进去，让它滑入你的双唇之间。这种植物尝起来有淀粉味，余味有些刺鼻。你淫荡地用舌头绕着它舔舐，你的努力很快就得到了回报，一股咸咸的乳液喷涌而出。这根阴茎藤蔓似乎比真家伙对你的动作更敏感，颜色迅速变成了深粉色。你开始用手套弄藤蔓，用指尖摩擦“球茎”与茎干连接的地方。没过多久，它就开始向你的喉咙里喷射种子，随着粘稠的粘液被泵下藤蔓，鲜红的颜色沿着藤蔓向后蔓延。你嘴里的球茎像气球一样膨胀起来，撑开了你的下巴，把自己卡在了你的牙齿后面。当它迅速堵住你的口腔时，你被迫用鼻子呼吸，大口吞咽着每一口填满喉咙的种子，努力不让自己窒息。[pg]");
            outputText("随着时间的推移，你的胃里充满了奇怪的外星液体，你怀疑自己的努力是否白费了。由于缺氧而感到头晕，你跪倒在地，喉咙超负荷地工作以吞咽和呼吸，结果却立刻又吞下了一大口。你的全身都因为用力而燃烧。你的肺部疼痛，心脏痉挛，肠胃在吸收这种奇怪的液体时发出咕噜咕噜的声音。你几乎失去了知觉，身体摇晃着，嘴里紧紧咬着藤蔓，支撑着你身体的重量。[pg]");
            outputText("伴随着“啪”的一声，你感觉意识恢复了；那无尽的液体洪流已经停止，尽管你的嘴巴仍然被肿胀的球茎撑得大大的。在恐慌中，你向后挣扎，痛苦地拉扯着现在绷紧的藤蔓。你徒劳地挣扎了一会儿，藤蔓寸步不让，直到最后你感觉到球茎开始变软。你来回地拉扯它，最终伴随着令人满意的“啵”的一声，你成功地把它拔了出来。你揉着酸痛的下巴，离开了林地，每走一步都会吐出一些麝香味的粘液。[pg]");
            outputText("当你把腐化的植物抛在脑后时，一种令人舒适的温暖似乎从你的肠胃中辐射出来，柔和的热量充满了你的全身，让你的");
            if(int(get_player().cocks.length) > 0)
            {
               outputText(int(get_player().cocks.length) == 1 ? get_player().cockDescript(0) : get_player().multiCockDescriptLight());
               if(int(get_player().vaginas.length) > 0)
               {
                  outputText("和" + get_player().vaginaDescript(0));
               }
            }
            else if(int(get_player().vaginas.length) > 0)
            {
               outputText(get_player().vaginaDescript(0));
            }
            else
            {
               outputText("乳头");
            }
            outputText("感到刺痛。");
            dynStats(DynStat.Lust(25 + get_player().lib / 10),DynStat.Cor(2));
            if(Utils.rand(3) == 0 && get_player().hair.color != "green")
            {
               outputText("没走多远，你就意识到你身上所有的毛发都变成了翠绿色。<b>你现在有一头绿发了。</b>");
               get_player().hair.color = "green";
            }
            if(Utils.rand(4) == 0 && get_player().butt.rating <= 10)
            {
               outputText("你的臀部发生了一阵奇怪的变化，让你的[armor]感觉变紧了。<b>你的屁股变大了</b>，变成了一个[ass]。");
               var _temp_3:* = get_player().butt;
               _temp_3.rating = _temp_3.rating + (Utils.rand(3) + 1);
            }
            if(Utils.rand(3) == 0 && int(get_player().cocks.length) > 0 && get_player().hair.color == "green")
            {
               if(get_player().countCocksOfType(CockTypesEnum.TENTACLE) < get_player().cockTotal())
               {
                  if(int(get_player().cocks.length) == 1)
                  {
                     outputText("你感觉到你的[cock]在不受控制地弯曲和伸展……低头一看，你看到它变成了一个绿色的藤蔓状。<b>你现在有了一根触手肉棒！</b>");
                     get_player().cocks[0].set_cockType(CockTypesEnum.TENTACLE);
                  }
                  if(get_player().cockTotal() > 1)
                  {
                     outputText("你感觉到你的[cocks]在不受控制地弯曲和伸展……低头一看，你看到它们变成了灵活的藤蔓状。<b>你现在有了绿色的触手肉棒！</b>");
                     _loc1_ = 0;
                     while(_loc1_ < int(get_player().cocks.length))
                     {
                        get_player().cocks[_loc1_].set_cockType(CockTypesEnum.TENTACLE);
                        _loc1_++;
                     }
                  }
               }
            }
         }
         get_player().slimeFeed();
         doNext(get_camp().returnToCampUseOneHour);
      }
      
      public function secondSatyrFuck() : void
      {
         var _loc1_:int = get_player().cockThatFits(get_monster().analCapacity());
         if(_loc1_ < 0)
         {
            _loc1_ = get_player().smallestCockIndex();
         }
         clearOutput();
         outputText("再利用一下这只无助的羊也没什么坏处……不过这次，你决定用他的嘴。你猛拉他的角，强行把他从植物乳房上拽下来，按着他跪下，把他的头转向你；他没有怎么反抗，当你把勃起的肉棒递给他时，他兴奋地舔了舔嘴唇，一口含住了你的" + get_player().cockDescript(_loc1_) + "。[pg]");
         outputText("他的嘴太棒了；感觉滑溜溜、暖烘烘的，他的嘴唇很柔软，舌头在你的肉棒上蠕动，试图包裹和按摩它。他带着饥渴的渴望吞咽着你的男子气概，迫不及待地想用他的嘴蹂躏你。当他流着口水吞咽时，快感的颤栗传遍了他的全身——这也难怪！从他嘴里残留的汁液中，你能感觉到阵阵快感顺着你的肉棒流淌；如果他一直在直接喝这东西，在药效的作用下，他的嘴肯定和小穴一样敏感。[pg]");
         outputText("几分钟前你才刚经历过第一次高潮，所以你没坚持多久。他刚开始没一会儿，你就用第二股精液灌满了他的嘴，然后拔出来，把最后几股射在他的脸上。[pg]");
         outputText("伴随着一声含糊不清的大叫，萨堤尔自己高潮了。他嘴里流着沾染了汁液的精液，咕噜咕噜地喷射进他那贪婪的植物情人张开的口中。植物在吞噬他浓稠发臭的精液时膨胀起来，茎干被拉伸得几乎成球形，最后终于放开了他，让他瘫倒在地上，终于摆脱了植物的控制。他轻声呻吟着，下巴上沾满精液的汁液滴落在他毛茸茸的胸膛上，被你和花朵的双重操弄弄得不知所措，也被他吸食的催情剂毒害得动弹不得。[pg]");
         outputText("你给你那敏感的阴茎撸动了几下，动作颤抖，甚至有些痛苦……也许你做得有点过火了。你耸了耸肩，收起你的[armor]，把昏迷的萨堤尔留在原地，回到了你的营地。");
         get_player().orgasm("Dick");
         dynStats(DynStat.Lib(1),DynStat.Sens(-5));
         doNext(get_camp().returnToCampUseOneHour);
      }
      
      public function rapeSatyr() : void
      {
         clearOutput();
         spriteSelect(SpriteDb.get_s_stuckSatyr());
         var _loc1_:int = get_player().biggestCockIndex();
         if(get_player().cor < 33)
         {
            outputText("你犹豫了片刻……在未经同意的情况下从背后上别人似乎是不对的……但话又说回来，如果你处于他的位置，你怀疑萨堤尔会不会放过这个机会。");
         }
         else if(get_player().cor < 66)
         {
            outputText("你得意地笑了；通常你会考虑一下，但免费送上门的屁股足以让你做出决定。");
         }
         else
         {
            outputText("你咧嘴一笑；这根本不是个选择！放过免费的肛交根本不是一个正经人会做的事，不是吗？");
         }
         get_images().showImage("satyr-sex-anally");
         outputText("你默默地脱下你的[armor]，然后");
         if(get_player().hasTailInsteadOfLegs())
         {
            outputText("滑行");
         }
         else
         {
            outputText("潜行");
         }
         outputText("走向那个分心的萨堤尔；在几英尺外停下，你抚摸着你的" + get_player().cockDescript(_loc1_) + "，催促它完全勃起，并挤出几滴先列腺液，涂抹在你的" + get_player().cockHead(_loc1_) + "上。毫无预兆地，你向前猛扑，抓住他的臀部拉向你的" + get_player().cockDescript(_loc1_) + "，并尽可能地将自己塞进他紧致的屁股里。[pg]");
         outputText("萨堤尔发出一声惊恐的尖叫，拼命挣扎，但在他尴尬的姿势和那朵贪婪地吸吮着他那巨大肉棒的变异花之间，他无能为力。[pg]");
         outputText("你张开手掌拍打他的屁股，在他紧绷的臀部上留下一个清晰的印记。他咩咩叫着，疯狂地挣扎，但这只会让他的屁股撞击你的胯部，直到那朵花饥渴地将他吸回去，让他从你的肉棒上滑落。你笑了，一个邪恶的想法击中了你；你一次又一次地拍打他的屁股，让他撞向你跳动的" + Appearance.cockNoun(get_player().cocks[_loc1_].get_cockType()) + "，而那朵花则不断地将他拉回里面；实际上是让萨堤尔自己操自己。[pg]");
         outputText("最终，他的咩咩声和尖叫声开始让你感到烦躁，所以你抓住他的角，把他的头推向一边，塞进附近一个类似乳房的生长物中，让他安静下来。萨堤尔不假思索地咬住花朵的乳头开始吸吮，如你所愿地安静了下来。你不确定为什么，但他开始自愿地在你和花朵之间来回撞击；也许他开始进入状态了，或者也许他吸吮的植物乳头在多次试图从同类花朵中拔出后，引入了一种催情化学物质。[pg]");
         outputText("你决定现在不去想它，只享受操萨堤尔屁股的乐趣。随着他的撞击，你能够更深地插入他紧致的樱桃，");
         if(get_player().cockArea(_loc1_) >= 100)
         {
            outputText("把它撑得完全不成比例，让下一个可能使用它的人无法享受。");
         }
         else
         {
            outputText("把它撑开，好套在你的" + get_player().cockDescript(_loc1_) + "上，就像避孕套一样。");
         }
         outputText("你的腹股沟一阵悸动，");
         if(get_player().balls > 0)
         {
            outputText("你的蛋蛋翻滚着，");
         }
         outputText("你闷哼一声，感觉到第一股精液顺着[eachcock]流出，倾泻进");
         if(get_player().cockTotal() > 1)
         {
            outputText("和");
         }
         outputText("萨堤尔那饱受蹂躏的屁股上；即使在高潮时，你依然继续抽插着他，让精液顺着他的脸颊和双腿流下。[pg]");
         outputText("萨堤尔依然在淫荡地吸吮着那假乳房，他呻吟着、低语着；你不确定他吞下的汁液，或是他阴茎上的花穴起了多大作用，但看起来他现在确实很享受。");
         if(get_player().cumQ() < 250)
         {
            outputText("尽管你很想把他的肚子灌满精液，让他看起来像怀孕了一样，但你实在挤不出更多了，只能叹了口气拔出来。[pg]");
         }
         else if(get_player().cumQ() < 1000)
         {
            outputText("你射了又射，用温暖的精液填满了他的肠道，这个淫荡的羊人似乎一点也不介意。当你终于筋疲力尽时，你叹了口气拔出来，看着你的精液从他的屁股里倒流出来，滴落在草地上。[pg]");
         }
         else
         {
            outputText("你射了又射，用温暖的精液填满了他的肠道，这个淫荡的羊人似乎一点也不介意——至少现在是这样。你把他逼到了极限；精液从他的屁股里倒流出来，漫过你喷射的肉棒，但你依然把更多沉重的负荷倾泻进你现在这个心甘情愿的肉便器里，把他的肚子像气球一样撑大。当你终于筋疲力尽时，你叹了口气拔出来，看着你的杰作；精液像打开的水龙头一样从他的屁股里涌出，他的肚子鼓鼓的，看起来就像怀孕了一样。[pg]");
         }
         outputText("萨堤尔太沉迷于操那植物小穴，以及吸吮那树乳房了，根本没空为你离开而哀嚎");
         if(get_player().cumQ() >= 1000)
         {
            outputText("，尽管他的眼睛随着肚子的撑大而明显睁大了");
         }
         outputText("。[pg]");
         outputText("看着这个无助羊人急不可耐的样子，你忍不住在心里暗笑，决定留下来再看他一会儿。毕竟不是每天都能看到像他这样的生物任你摆布。你时不时地在他屁股上狠狠拍一巴掌，刺激他一下。萨堤尔嘟囔着、喘息着，但依然毫无理智地在吸食他肉棒的植物小穴里抽插着。你觉得他很快就会射了……[pg]");
         outputText("看着这淫荡的表演，你感觉到你的欲望在积聚，你的" + get_player().cockDescript(_loc1_) + "又完全勃起了。既然现成就有个心甘情愿的荡妇，你考虑再用他发泄一次……你打算怎么做？");
         get_player().orgasm("Dick");
         menu();
         addButton(0,"再来一次",secondSatyrFuck).hint("再操一次萨堤尔！");
         addButton(1,"离开",dontRepeatFuckSatyr).hint("别管萨堤尔了。");
      }
      
      public function intro() : void
      {
         clearOutput();
         get_images().showImage("cGlade-encounter");
         spriteSelect(SpriteDb.get_s_corruptedGlade());
         var _loc1_:Number = get_player().cor + get_player().corruptionTolerance();
         outputText("穿过这片林地，你发现了一片潮湿的污秽之地，腐败的植物在此蔓生。每一朵花都扭曲成女性私处的艳丽仿品，每一条藤蔓都鼓胀着青筋、诡异地脉动着；而近旁每一棵树的树瘤上，都顶着一颗似乳头般的突起，正渗着漆黑的汁液。");
         if(_loc1_ <= 33)
         {
            if(get_player().get_spe() < 60 && Utils.rand(get_player().get_spe() + 50) < 50)
            {
               outputText("你对这种对自然的亵渎感到厌恶，转身准备离开，却被从上方藤蔓喷射下来的白色粘液糊了一脸！它黏糊糊的，很恶心，很难从你的眼睛、鼻子和嘴巴里清理干净。那麝香般的气味和美味的咸味无疑是植物腐化的结果。你逃离了这片被污染的林地，但随着时间的推移，你感觉越来越热……");
               dynStats(DynStat.Lust(20 + get_player().lib / 5));
            }
            else
            {
               outputText("你对这种对自然的亵渎感到厌恶，转身准备离开，险险避开了从头顶藤蔓上突然滴落的浓稠白色液体。");
               dynStats(DynStat.Lust(2));
            }
            outputText("[pg]当然，如果你愿意，你可以决定摧毁这片腐化的林地。");
            doNext(get_camp().returnToCampUseOneHour);
            addButton(1,"摧毁它们",destroyTheCorruptedGladesChoice).hint("尝试摧毁这片变态的林地。");
         }
         else if(_loc1_ <= 66)
         {
            outputText("你带着一半谨慎一半好奇的心情探索着这片林地。");
            switch(Utils.rand(3))
            {
               case 0:
                  outputText("一群看起来很变态的花吸引了你的注意，你弯下腰仔细观察它们那错综复杂的花瓣，注意到植物内部似乎渗出了滑腻的水珠。你对这朵堕落却美丽的花感到敬畏，深吸了一口气，吸入了一大口它那刺鼻却又甜美的气味。这气味不知怎么的与花很相配，即使你退开后，它依然萦绕在你的鼻尖。这气味让你不禁想知道这些小穴花到底有多大能耐，毕竟它们有着相当粗大的茎秆。");
                  outputText("[pg]你叹了口气，最后闻了一下花朵的蜜壶，然后继续前进。你的身体因欲望而愉悦地泛红，血液汇聚在你的腹股沟。你咯咯地笑着，希望自己能更经常地有这种感觉。");
                  break;
               case 1:
                  outputText("几根从树上垂下来的藤蔓吸引了你的注意，因为它们的尖端相当“独特”。每一根藤蔓的末端都有一个膨大的蘑菇状头部，每一个都比已经很粗的藤蔓还要宽两倍。你轻轻地触摸着一根藤蔓，想着它那滑溜溜的质感，如果“头部”再小一点，它会有多像一根阴茎。你用手环住藤蔓，抚摸着它，为这个地方的荒谬而咯咯发笑。藤蔓突然在你的抓握中弯曲，随着它的头部变得更大、更亮、更红，它开始脉动和收缩。你震惊地退开，倒吸了一口凉气，因为藤蔓开始喷出大量浓稠的粘液，溅得到处都是。植物的高潮就像它开始时一样突然结束了，“头部”保持着它增加的尺寸，滴下最后一点奇怪的液体。在好奇心的驱使下，你闻了闻滴落的精液，被那强烈的麝香味熏得晕了过去。回过神来，你决定在其中一根藤蔓钻进你体内之前离开。你逃离了这片腐化的林地，但依然保持着兴奋的红晕。");
                  break;
               default:
                  outputText("附近一棵树上一簇巨大的乳房状树结吸引了你的注意。你忍不住戳了其中一个，然后咯咯地笑了起来，因为它像真正的乳房一样晃动！你小心翼翼地开始抚摸这个树乳，当它开始漏出散发着甜味的树液时，你笑了。这气味让你想起了在家乡帮忙制作枫糖浆的记忆，在你意识到之前，你已经在手指上收集了一滴树液并尝了尝。它非常甜，让你的舌头刺痛，心跳加速。不知不觉中，把乳头里的甜食吸干的念头浮现在你的脑海中，但你设法拒绝了它，跌跌撞撞地离开了这片腐化的林地。在接下来的一个小时里，你的舌头出了点问题：它就是不肯待在你的嘴里，不停地舔着你的嘴唇，寻找任何残留的甜味。这几乎让你分心，无法注意到大腿间聚集的明显热量。");
            }
            dynStats(DynStat.Lust(20 + get_player().lib / 5),DynStat.Cor(0.5));
            doNext(get_camp().returnToCampUseOneHour);
            addButton(1,"摧毁它们",destroyTheCorruptedGladesChoice).hint("尝试摧毁这片变态的林地。");
         }
         else
         {
            outputText("你微笑着走进林地，想知道你应该尝试哪种禁果……[pg]这里有看起来非常像小穴的花朵，有尖端像阴茎一样大得离谱的藤蔓，还有长满乳房状树结、漏出树液的树木。");
            menu();
            addButton(0,"花朵",flowerFun).hint("这些花看起来像小穴。和花玩耍。");
            addButton(1,"藤蔓",tentacleFun).hint("这些藤蔓的尖端看起来像阴茎。和藤蔓玩耍。");
            addButton(2,"树木",treeBoobFun).hint("树上的树结看起来很像乳房。和树玩耍，舔一些树液。");
            addButton(3,"摧毁它们",destroyTheCorruptedGladesChoice).hint("尝试摧毁这片变态的林地。");
            setExitButton();
         }
      }
      
      public function ignoreSatyr() : void
      {
         clearOutput();
         spriteSelect(SpriteDb.get_s_stuckSatyr());
         outputText("你摇了摇头，");
         if(get_player().cor < 50)
         {
            outputText("对这个地方似乎灌输到你脑海中的奇怪想法感到厌恶");
         }
         else
         {
            outputText("现在不想去强暴某个萨堤尔的屁股");
         }
         outputText("，然后默默地离开，让他继续享受。");
         dynStats(DynStat.Lust(5 + get_player().lib / 20));
         doNext(get_camp().returnToCampUseOneHour);
      }
      
      public function flowerFun() : void
      {
         var _loc1_:int = 0;
         clearOutput();
         get_images().showImage("cGlade-flowers");
         spriteSelect(SpriteDb.get_s_corruptedGlade());
         if(get_player().hasCock())
         {
            if(int(get_player().cocks.length) == 1)
            {
               outputText("你暗自咧嘴一笑，决定看看这些变态的小花到底有多像小穴。当你抓住粗壮的茎秆并将其弯向你的腹股沟时，它很容易就弯曲了，你的另一只手摸索着解开你的[armor]。几秒钟后，你释放了自己，小心翼翼地将花瓣凑近，空气中弥漫的麝香味迅速让你完全、悸动地勃起。花瓣第一次接触到你的皮肤，就用花朵丝滑的分泌物润滑了你，让你轻松地滑入花瓣之间。虽然这朵花看起来相当深，但你很快就感觉到自己在花瓣滑溜的抓握中触底了。你耸耸肩，决定充分利用它，开始在植物中抽插，享受着沿着你[cock]最前端的不寻常感觉。当你猛烈抽插时，你开始注意到花朵后部的变化。[pg]");
               outputText("感觉好像有什么东西正在打开，你阴茎的尖端开始滑过一个紧绷的环，使植物的茎秆明显鼓起。突如其来的变化让你担心得退缩了片刻，你的" + get_player().cockDescript(0) + "几乎要离开开口，这时几十根细小的鞭状触手从花朵中爆发出来，痛苦地紧紧缠绕着你的男性象征。它们进一步收缩，伴随着一阵爆发性的动作，将花朵猛地砸在你的[cock]上，用痛苦的力量将你拉得越来越深。你短暂地挣扎了一下，但这给你过度刺激的阴茎带来的痛苦太大了，所以你干脆放弃了，任由这株像小穴一样的植物将你最后一点拉进它的茎秆中，丝滑的花朵包裹着你的");
               if(get_player().balls > 0)
               {
                  outputText("蛋蛋并轻轻地挤压它们。[pg]");
               }
               else
               {
                  outputText("腹股沟并轻轻地挤压你的会阴。[pg]");
               }
               outputText("你感觉到一股湿润从植物深处涌出，随着茎秆开始收缩和挤压，更多的液体包围了你的阴茎。起初很轻柔，然后越来越坚持，茎秆内部产生了一种吸力，将越来越多的血液吸入你的[cock]。茎秆现在被你巨大的阴茎严重撑大，继续起伏、挤压和吸吮你过度充血的肉棒，用远超正常的感官淹没了你的大脑。如果不是你已经被紧紧的小触手锁在里面，盲目地对着这株被污染的植物抽插，你一定会想知道这株植物分泌的是什么增强触觉的液体。[pg]");
            }
            else
            {
               outputText("你暗自咧嘴一笑，决定看看这些变态的小花到底有多像小穴。当你用手抓住几根粗壮的茎秆并将其拉向你的腹股沟时，它们很容易就弯曲了，你的另一只手摸索着解开你的[armor]。几秒钟后，你释放了自己，小心翼翼地将花瓣凑近。空气中弥漫的麝香味迅速让你" + get_player().multiCockDescriptLight() + "完全、悸动地勃起。花瓣第一次接触到你的皮肤，就用花朵丝滑的分泌物润滑了你，让你轻松地滑入花瓣之间。虽然这些花看起来相当深，但你很快就感觉到自己在花瓣滑溜的抓握中触底了。你耸耸肩，决定充分利用它，开始在植物中抽插，享受着沿着你[cocks]最前端的不寻常感觉。当你猛烈抽插时，你开始注意到花朵后部的变化。[pg]");
               outputText("它们似乎正在逐渐打开，让你最小的阴茎尖端开始滑过花朵背面的开口进入茎秆。对这意想不到的发展感到震惊，你把这束花从你的" + get_player().multiCockDescriptLight() + "上拉开，但鞭状的触手从花朵深处射出，紧紧地缠绕着你的男性象征，痛苦地挤压着，将你的" + get_player().multiCockDescriptLight() + "拖回紧致的阴道开口。它们越拉越紧，迫使你深入植物内部，将你每根阴茎的整个长度拉进收缩的茎秆中。触手紧紧地缠绕在你的根部，形成了有效的阴茎环，使你的每一根[cocks]都充满了血液。[pg]");
               outputText("你短暂地试图挣脱，但腹股沟传来的疼痛淹没了你。听天由命，你任由植物将它们的花瓣完全包裹在你的腹股沟周围，包裹住你所有的男性象征。带着令人惊讶的轻柔，你感觉到一种吸力和挤压在你每一根阴茎周围建立。你感觉到每根过度充血的阴茎周围都涌出了液体，让它们因不自然的敏感而刺痛。植物茎秆的挤压和吸吮，加上突然出现的奇怪感觉，让人难以忍受。你感觉到腹股沟底部有一种翻腾的压力，液体的热量充满了每一根阴茎，因为你的身体准备好给这些植物它们想要的东西。[pg]");
            }
            outputText("你射了，射了，又射了，你快乐的证据被植物吸吮、挤压的食道吞噬了。高潮似乎持续了永远，你的[legs]最终失去了力量，你的臀部似乎是唯一还能工作的肌肉，它们在空中抽搐，仿佛在乞求更多。你被榨出了最后几大股精液，终于瘫倒在地。[pg]");
            outputText("缠绕在你下体的藤蔓并没有松开；相反，它们收得更紧了，" + (int(get_player().cocks.length) > 1 ? "每株植物的细小" : "这株植物的细小") + "附肢钻进了你的尿道" + (int(get_player().cocks.length) > 1 ? "" : "") + "，以令人不适的缓慢速度，在你那沾满精液的通道" + (int(get_player().cocks.length) > 1 ? "" : "") + "里蠕动。你躺在那里，虚弱得无法抵抗或挣扎，只希望这些植物无论在做什么，都不会太疼。你感觉到它在你体内扭动、盘旋……直到它停下来。你感到一阵尖锐的刺痛，然后它退了出来，似乎很满足。藤蔓松开了，植物弹回原位，露出你那仍然过度充血和敏感的肉棒" + (int(get_player().cocks.length) > 1 ? "" : "") + "。[pg]");
            outputText("你躺了一会儿，直到肌肉控制力恢复，你的肉棒" + (int(get_player().cocks.length) > 1 ? "" : "") + "仍然有些肿胀，" + (get_player().balls >= 2 ? "而且你的" + get_player().ballsDescriptLight() : "而且") + "因为刚才的消耗感到酸痛。至少你希望这只是因为消耗，而不是因为植物做了什么。[pg]");
            if(get_player().cumQ() < 25)
            {
               outputText("当你离开时，你注意到这些植物看起来异常鲜艳和健康……");
            }
            else if(get_player().cumQ() < 250)
            {
               outputText("当你离开时，你注意到植物的茎干因为你的灌注而微微鼓起，它们的花朵湿润，呈现出鲜艳的红色。");
            }
            else if(get_player().cumQ() < 500)
            {
               outputText("当你离开时，你注意到植物的茎干淫靡地鼓起，你的精液从花朵的开口处滴落。");
            }
            else
            {
               outputText("当你离开时，你注意到植物的茎干淫靡地向外鼓起，看起来像装得过满的气球。它们被撑得薄如蝉翼，几乎透明，你的精液在它们试图消化这顿大餐时在里面晃荡。你的精液不断从花瓣的唇边漏出，根本无法全部装下。");
            }
            get_player().orgasm("Dick");
            dynStats(DynStat.Sens(2));
            _loc1_ = 1;
            if(get_player().balls == 0)
            {
               _loc1_ += 3;
            }
            else if(get_player().ballSize < 6)
            {
               _loc1_ += 2;
            }
            if(get_player().hasPerk(PerkLib.MessyOrgasms) && get_player().cumMultiplier < 3)
            {
               _loc1_++;
            }
            var _temp_1:* = get_player();
            _temp_1.cumMultiplier = _temp_1.cumMultiplier + _loc1_;
            if(Utils.rand(get_player().cumQ() * 0.5) >= 100)
            {
               outputText("[pg]<b>你发现另一朵花开始移动并扭曲。</b>你看着茎干底部形成一个巨大的凸起，慢慢向那像小穴一样的花瓣移动，将花唇撑得紧绷。伴随着一阵粘液的喷发，花朵吐出了一个奇怪的物体；一颗巨大的南瓜籽！");
               outputText("[pg]你不确定吃从花穴里出来的东西是否安全，但你可能别无选择，而且食物就是食物。");
               get_inventory().takeItem(get_consumables().P_SEED,get_camp().returnToCampUseOneHour,get_camp().returnToCampUseOneHour);
               return;
            }
         }
         else
         {
            outputText("你暗自窃笑，决定品尝一下花朵散发着迷人香气的花蜜。你弯下腰，握住异常粗壮的茎干，欣赏着花穴那鲜红和闪烁着紫光的娇艳花瓣。你试探性地舔了一下，感受着花蜜的味道。它很美味，但让你的舌头感到刺痛和敏感。一个小小的芽状突起从花瓣间冒了出来，上面沾满了植物的汁液，呈现出樱桃般的红色，看起来非常像一颗充血的阴蒂。[pg]");
            outputText("不知是因为新奇的体验还是花汁中的化学物质，你感到一阵眩晕。你舔舐着植物那像阴蒂一样的花蕾，立刻得到了一阵果味植物花蜜的奖励。随着你的舌头变得更加敏感，每一次触碰和品尝都迅速变得极度色情，味道成了你脑海中最后考虑的事情。你深入它的褶皱，寻找更多的花蜜，你的舌头吸吮和舔舐着，发出响亮的声音，用舌头操弄着这株小植物。味道变得更加浓郁，失去了一些甜味，因为那颗小阴蒂肿得更大了，渗出几滴酸甜的汁液。[pg]");
            outputText("闭上眼睛，你很容易就沉浸在舌头在花瓣间进进出出的感觉中，你的舌头就像一根小肉棒。你陶醉在这一切的堕落中，你的嘴唇变得同样敏感和充血，你肆无忌惮地与花穴法式热吻，用你肿胀的嘴唇摩擦它的阴蒂，肆无忌惮地用舌头操弄着花朵。花瓣卷住你的脸，一股汁液突然从花朵深处涌出，让你的嘴里充满了酸甜的味道。你的舌头在快感中颤抖，你感觉到你过度敏感的嘴巴高潮了，这种快感是你从未体验过的。你本能地吞咽着，瘫坐在脚后跟上，舔着嘴唇，满足地扭动着身体。");
            outputText("你走开了，你的嘴唇和舌头感觉有些肿胀和敏感，但并没有什么大碍。");
            get_player().slimeFeed();
            get_player().orgasm("Lips");
            dynStats(DynStat.Sens(4),DynStat.Cor(1));
         }
         doNext(get_camp().returnToCampUseOneHour);
      }
      
      public function execEncounter() : void
      {
         if(Utils.rand(4) == 0)
         {
            trappedSatyr();
         }
         else
         {
            intro();
         }
      }
      
      public function encounterName() : String
      {
         return "corrGlade";
      }
      
      public function encounterChance() : Number
      {
         if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,2078) >= 100)
         {
            return 0;
         }
         return (100 - FlagDict_Impl_.arrayReadInt(KFLAGS.flags,2078) * 0.9) / 100;
      }
      
      public function dontRepeatFuckSatyr() : void
      {
         clearOutput();
         spriteSelect(SpriteDb.get_s_stuckSatyr());
         outputText("你已经玩够了，不想一整天都在森林里鬼混，所以你抓起你的[armor]，把发情的萨堤尔抛在脑后。[pg]");
         doNext(get_camp().returnToCampUseOneHour);
      }
      
      public function destroyTheCorruptedGladesChoice() : void
      {
         var choice5:int;
         var _g5:CorruptedGlade;
         var choice4:int;
         var _g4:CorruptedGlade;
         var choice3:int;
         var _g3:CorruptedGlade;
         var choice2:int;
         var _g2:CorruptedGlade;
         var choice1:int;
         var _g1:CorruptedGlade;
         var choice:int;
         var _g:CorruptedGlade;
         clearOutput();
         outputText("你思考着如何摧毁这片污秽的林地。");
         menu();
         if(get_player().hasPerk(PerkLib.Dragonfire) || get_player().hasPerk(PerkLib.FireLord) || get_player().hasPerk(PerkLib.Hellfire))
         {
            _g = this;
            choice = 0;
            addNextButton("火焰吐息",function():void
            {
               _g.destroyTheCorruptedGlades(choice);
            });
         }
         if(get_player().hasPerk(PerkLib.EnlightenedNinetails) || get_player().hasPerk(PerkLib.CorruptedNinetails))
         {
            _g1 = this;
            choice1 = 1;
            addNextButton("狐火",function():void
            {
               _g1.destroyTheCorruptedGlades(choice1);
            });
         }
         if(get_player().hasStatusEffect(StatusEffects.KnowsWhitefire))
         {
            _g2 = this;
            choice2 = 2;
            addNextButton("火焰",function():void
            {
               _g2.destroyTheCorruptedGlades(choice2);
            });
         }
         if(get_player().hasKeyItem("Carpenter\'s Toolbox") || get_player().get_weapon() == get_weapons().L__AXE)
         {
            _g3 = this;
            choice3 = 3;
            addNextButton("斧头",function():void
            {
               _g3.destroyTheCorruptedGlades(choice3);
            });
         }
         if(get_player().get_weaponVerb() == "stab" || get_player().get_weaponVerb() == "slash" || get_player().get_weaponVerb() == "cleave" || get_player().get_weaponVerb() == "keen cut")
         {
            _g4 = this;
            choice4 = 4;
            addNextButton("武器",function():void
            {
               _g4.destroyTheCorruptedGlades(choice4);
            });
         }
         _g5 = this;
         choice5 = 5;
         addNextButton("你的双手",function():void
         {
            _g5.destroyTheCorruptedGlades(choice5);
         });
         addButton(14,"算了",get_camp().returnToCampUseOneHour);
      }
      
      public function destroyTheCorruptedGlades(param1:int) : void
      {
         var _loc2_:int = 0;
         clearOutput();
         get_images().showImage("cGlade-destroyed");
         outputText("受够了。这些该死的林地必须被毁灭！[pg]");
         switch(param1)
         {
            case 0:
               outputText("你凝聚体内的火焰，当力量积蓄到足够时，你将其释放到林地中，点燃了它们。当火焰熄灭时，林地里只剩下烧焦的植物。[pg]");
               _loc2_++;
               get_player().changeFatigue(20,1);
               break;
            case 1:
               outputText("你伸出手掌，召唤出一团在指尖跳跃的火焰。你猛地将其掷向林地，火焰在撞击时爆发，将林地化为火海。当火焰熄灭时，林地里只剩下烧焦的植物。[pg]");
               _loc2_++;
               get_player().changeFatigue(20,1);
               break;
            case 2:
               outputText("你眯起眼睛，集中精神，带着致命的杀意。你打了个响指，林地瞬间被火光吞没！当火焰熄灭时，林地里只剩下烧焦的植物。[pg]");
               _loc2_++;
               get_player().changeFatigue(25,1);
               break;
            case 3:
               outputText("你从工具箱里拿出一把斧头，毫不留情地砍向那些植物。最终，你成功砍倒了林地里除了几棵树之外的所有变态植物。它们逐渐枯萎了。");
               outputText("最后，你用尽全力砍倒了那些树，砍出了楔形的切口。伴随着最后一次全力挥击，树木倒下，重重地砸在地上，发出一声巨响。看起来它们能成为上好的木材。你把树砍成几段，把木材拖回了营地。");
               get_camp().cabinProgress.incrementWoodSupply(10);
               get_player().changeFatigue(30 - get_player().get_str() / 10);
               outputText("[pg]");
               break;
            case 4:
               outputText("你准备好你的[weapon]，毫不留情地砍向那些植物。最终，你成功砍倒了林地里除了树之外的所有变态植物。它们逐渐枯萎了。你在离开前对那些长着乳房肉结的树进行了一番破坏。[pg]");
               get_player().changeFatigue(40 - get_player().get_str() / 5);
               break;
            case 5:
               if(get_player().get_str() < 30)
               {
                  outputText("你抓住其中一株植物，轻松地扯断了花茎。接着，你抓住一根藤蔓，试图将其扯断，但尽管你用尽全力，还是无法扯断它。你沮丧地叹了口气，丢下了藤蔓。你只能以后再来了。[pg]");
                  get_player().changeFatigue(50);
                  doNext(get_camp().returnToCampUseOneHour);
                  return;
               }
               if(get_player().get_str() >= 30 && get_player().get_str() < 70)
               {
                  outputText("你抓住其中一株植物，轻松地扯断了花茎。接着，你抓住一根藤蔓，试图将其扯断，用尽全力后，你终于成功了。最后，你抬头看着那棵树，但你显然无法轻易地将它放倒。[pg]");
                  get_player().changeFatigue(40);
                  break;
               }
               outputText("你抓住那些小穴花和肉棒藤蔓，毫不费力地将它们扯断。接着，你抬头看着那棵长着乳房肉结的树，抓住了那些肉结。费了一番力气后，你猛地将肉结扯了下来。最后，你扭断了树干，结束了它的生命。[pg]");
               get_player().changeFatigue(30);
               break;
            default:
               outputText("<b>请将此错误报告给Kitteh6660。</b>[pg]");
         }
         if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,2078) == 0)
         {
            outputText("又消灭了一片林地！只要努力和坚持，你就能净化森林中这些污秽的林地。");
         }
         else
         {
            outputText("森林再次被净化，一片被污染的林地消失了。");
         }
         dynStats(DynStat.Cor(-1));
         _loc2_++;
         var _loc3_:IMap = KFLAGS.flags;
         FlagDict_Impl_.arrayWriteInt(_loc3_,2078,FlagDict_Impl_.arrayReadInt(_loc3_,2078) + _loc2_);
         if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,2078) == 25)
         {
            outputText("[pg]你感觉遇到这些林地的频率会稍微降低一些。");
         }
         if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,2078) == 50)
         {
            outputText("[pg]你感觉遇到这些林地的频率会降低一些。");
         }
         if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,2078) == 75)
         {
            outputText("[pg]你感觉遇到这些林地的频率会大幅降低。");
         }
         if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,2078) == 100)
         {
            outputText("[pg]这应该是最后一片林地了！<b>腐化林地现已绝迹。</b>");
         }
         doNext(get_camp().returnToCampUseOneHour);
      }
   }
}

