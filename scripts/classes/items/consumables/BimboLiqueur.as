package classes.items.consumables
{
   import classes.BreastRow;
   import classes.DynStat;
   import classes.PerkLib;
   import classes.Player;
   import classes.Vagina;
   import classes.internals.Utils;
   import classes.items.Consumable;
   import flash.Boot;
   
   public class BimboLiqueur extends Consumable
   {
      
      public function BimboLiqueur()
      {
         if(Boot.skip_constructor)
         {
            return;
         }
         super("BimboLq","Bimbo Liq.","a potent bottle of \'Bimbo Liqueur\'",1000,"This small bottle of liqueur is labeled \'Bimbo Liqueur\'. There\'s a [b: huge] warning label about the effects being strong and usually permanent, so you should probably handle this with care.");
      }
      
      override public function useItem() : Boolean
      {
         var _loc1_:Number = NaN;
         if(get_player().hasPerk(PerkLib.BroBody))
         {
            outputText("当这东西进入你的胃时，你皱了皱眉，已经感觉到那潜移默化的效果开始发作了。随着胃部咕噜作响，你打了个长长的嗝，然后有些不好意思地咯咯笑了起来。");
            if(get_player().get_tallness() < 77)
            {
               outputText("……地面是不是离你更远了？你低头一看，发现自己正在长高！就像一株加速生长的花苗，你不断长高，直到最后停在……你估计大概有六英尺半左右。哈。你可没想到会发生这种事！");
               get_player().set_tallness(77);
            }
            if(get_player().biggestTitSize() < 7)
            {
               if(get_player().biggestTitSize() < 1)
               {
                  outputText("你的胸部开始发痒，刺痛，然后膨胀成一对圆润的球体。");
               }
               else
               {
                  outputText("你感到乳房里一阵酥麻。");
               }
               outputText("它们不祥地颤动着，当又一阵震颤穿过它们时，你忍不住将双乳挤在一起，以进一步感受这场“乳震”。出乎意料的是，随着你的双乳相互挤压膨胀，震动将你的双手推得更开，在陷入其中的手指间迅速变大。震颤一直持续，直到长到大约E罩杯才平静下来。");
               get_player().breastRows[0].breastRating = 7;
            }
            if(!get_player().hasVagina())
            {
               outputText("你还没来得及喘口气，胯部就传来一种极其奇特的感觉。你无法看穿你的[armor]，但你绝对能感觉到阴道正在" + (get_player().balls > 0 ? "你的睾丸后面" : "你的腹股沟处") + "裂开。幸运的是，小穴的形成并没有带来任何不适——相反，你感觉自己进一步陷入了被化学物质麻痹、由性欲驱动的发情状态中。");
               if(get_player().hips.rating < 12 || get_player().butt.rating < 12)
               {
                  outputText("仿佛意识到需要女性化的比例来吸引你身体现在渴望的坚硬肉棒，你的腰部微微向内收缩，臀部和屁股也膨胀起来。你忍不住用手抚摸着你新近女性化的骨盆，欣赏着它。");
               }
               get_player().createVagina();
               get_player().setClitLength(0.25);
               if(get_player().hips.rating < 12)
               {
                  get_player().hips.rating = 12;
               }
               if(get_player().butt.rating < 12)
               {
                  get_player().butt.rating = 12;
               }
            }
            outputText("[pg]");
            outputText("一阵麻木感席卷了你的五官，提醒你又发生了一些变化。你伸手摸了摸自己变窄的下巴，变得更……女性化了？当你那张脸变得非常女性化时，你失望地撅起了沉重丰满的嘴唇。你现在大概非常性感吧！[pg]");
            if(get_player().get_femininity() < 80)
            {
               get_player().set_femininity(80);
            }
            outputText("你那汹涌澎湃、荒谬而强烈的性欲在体内翻腾，提醒你需要做爱。不仅是女人，男人也行。坚挺的肉棒、湿润的小穴，管他呢，你根本不在乎。他们可以两者兼有，或者有十几个也行。你只想上床，狠狠地操点什么，最好能同时进行！");
            outputText("[pg]<b>(失去特质：兄弟体格");
            if(get_player().hasPerk(PerkLib.BroBrains))
            {
               outputText("，兄弟大脑");
            }
            outputText(")\n");
            outputText("(获得特质：扶她形态，扶她思维)</b>\n");
            get_player().removePerk(PerkLib.BroBody);
            get_player().removePerk(PerkLib.BroBrains);
            get_player().createPerk(PerkLib.FutaFaculties,0,0,0,0);
            get_player().createPerk(PerkLib.FutaForm,0,0,0,0);
            if(get_player().get_inte() > 35)
            {
               get_player().set_inte(35);
               dynStats(DynStat.Inte(-0.1));
            }
            if(get_player().lib < 50)
            {
               get_player().lib = 50;
               dynStats(DynStat.Lib(0.1));
            }
         }
         else
         {
            outputText("你拔下烧瓶的软木塞，立刻被一股甜腻的香料气味扑面而来，这气味让你脑海中浮现出一个淫荡女奴微微张开的肉褶的画面。哇，这玩意儿真够劲！好吧，当你找到这个瓶子的时候，你就知道自己要面对什么了！你张大嘴巴一饮而尽，感觉酒精的火焰一路烧到了你的肚子里。灼热感很快褪去，变成一种令人愉悦的温暖，让你感到头晕目眩，忍不住咯咯傻笑。[pg]");
            if(get_player().hair.color != "platinum blonde")
            {
               outputText("你注意到的第一个变化是你的[hair]。一开始是头皮发麻，随后这种感觉越来越强烈，");
               if(get_player().hair.length < 36)
               {
                  outputText("同时你感觉到头发变得越来越重，越来越长。");
                  get_player().hair.length = 36;
               }
               else
               {
                  outputText("随着你的头发变得越来越浓密、越来越重。");
               }
               outputText("你抓起一缕丝滑的头发，张大嘴巴看着几乎白得发亮的金发条纹顺着你[haircolor]的头发流淌而下。变化越来越快，直到你的头发变成了完美的无脑金发，飘逸的长发。[pg]");
               get_player().hair.color = "platinum blonde";
            }
            outputText("你淫荡地呻吟着，开始左右摇摆臀部，向任何可能看到你的人展示自己。你只是觉得……太性感了。性感得无法隐藏。你的身体渴望展示自己，渴望感受到某人，任何人的目光。嗯，这让你好湿！");
            if(!get_player().hasVagina())
            {
               get_player().createVagina();
               get_player().setClitLength(0.25);
               get_player().vaginas[0].vaginalWetness = 3;
               if(get_player().isTaur())
               {
                  outputText("等等！？湿了？你真希望能摸摸自己[legs]之间，但从顺着你后腿流下的液体就能看出，你新长出的阴道有多湿润。");
               }
               else
               {
                  outputText("等等！？湿了？你摸了摸[legs]之间，当手指陷入湿滑泥泞的小穴时，你忍不住呻吟出声。");
               }
            }
            else if(get_player().isTaur())
            {
               outputText("你真希望能把手指插进自己湿滑泥泞的小穴里，但作为半人马，你实在够不到。");
               if(get_player().vaginas[0].vaginalWetness < 3)
               {
                  get_player().vaginas[0].vaginalWetness = 3;
               }
            }
            else
            {
               outputText("你把手指插进你");
               if(get_player().vaginas[0].vaginalWetness < 3)
               {
                  outputText("现在");
                  get_player().vaginas[0].vaginalWetness = 3;
               }
               outputText("湿滑泥泞的小穴中，发出一声满足的呻吟。");
            }
            if(get_player().balls > 0)
            {
               outputText("[pg]你的[sack]感到一阵轻微的刺痛，让你惊讶地喘息起来，紧接着是一阵美妙的紧致感，让你的[vagina]流出淫水。低头看去，<b>你看到你的蛋蛋慢慢缩回体内，只留下肿胀的阴阜。</b>");
               get_player().balls = 0;
               get_player().ballSize = 3;
               get_player().cumMultiplier = 2;
            }
            if(get_player().hasCock())
            {
               outputText("[pg][EachCock]似乎都在以自己的方式回应着这种利口酒。你的生殖器淫荡地收缩和放松，开始将精液滴落在你面前的地上，让你陷入极乐的阵发中。精液的流动稳定但微弱，每一滴离开你的精液都让[eachCock]变得更加疲软。即使你变得柔软而小巧，它也没有停止。你一路射精直到什么都不剩，一小滴精液预示着你新的、少女般的腹股沟。<b>你不再有");
               if(get_player().cockTotal() == 1)
               {
                  outputText("阴茎");
               }
               else
               {
                  outputText("阴茎");
               }
               outputText("！</b>");
               while(get_player().hasCock())
               {
                  get_player().removeCock(0,1);
               }
            }
            outputText("不知怎么的，你觉得自己现在能诱惑任何人！[pg]");
            outputText("又一阵欢快的咯咯笑声从你唇间溢出，随后你饥渴地舔了舔嘴唇。你，就是，超级想找根鸡巴吸！哇，这想法真是太突然了。你摇摇头，试图把这些意想不到的，呃，词汇从脑海中清除，但这变得有点困难。我的天呐，喝了那奇怪的酒之后，你感觉自己就像个，呃，无脑的荡妇。哎，好吧，反正这也不重要——你，呃，还是能阻止恶魔什么的。你只需要展示你性感的身体，直到他们主动提出服侍你。[pg]");
            outputText("你叹了口气，用一只手抚摸你的[nipples]");
            if(get_player().breastRows[0].breastRating < 10)
            {
               var _temp_1:* = get_player().breastRows[0];
               _temp_1.breastRating = _temp_1.breastRating + (5 + Utils.rand(5));
               outputText("，惊讶于你不断膨胀的乳房变得如此巨大圆润，新的乳肉继续从你饥渴的指缝间溢出。它们摸起来如此柔软顺滑，但当你松开手时，它们依然高耸挺拔地立在你的胸前。那崭新、更加丰满的[breastcup]乳沟敏感得让你呻吟出声，你用一只手捏住乳头");
            }
            else
            {
               var _temp_2:* = get_player().breastRows[0];
               _temp_2.breastRating = _temp_2.breastRating + (5 + Utils.rand(5));
               outputText("，欣赏着它们变得多么敏感。大乳房开始变得越来越大，柔软的胸肉几乎从你的指缝间溢出，软乎乎的乳房像野草一样疯长，膨胀到任何手都无法握住的程度。那柔软的[breastcup]双乳依然高耸在你的胸前，几乎无视重力般挤出深深的乳沟。你用一只手捏住乳头");
            }
            dynStats(DynStat.Sens(20));
            outputText("另一只手则把玩着你多汁的阴唇入口。嗯……感觉太棒了，不摸摸自己都说不过去。之前还担心自己会变笨什么的，现在你需要放松一下。思考太难了，但做爱是如此简单，而且，就像，很自然！你向后靠去，开始发出咕哝声，将四根手指插入体内，像没有明天一样在你的" + get_player().vaginaDescript(0) + "里耕耘。现在，你的[clit]正在悸动，你试探性地给它一个");
            if(get_player().getClitLength() >= 3)
            {
               outputText("抽插");
            }
            else
            {
               outputText("爱抚");
            }
            outputText("这让你的[legs]在高潮时发软，当你瘫软在地上抽搐时，女性的体液四处飞溅。[pg]");
            outputText("虽然高潮很强烈，但几分钟后你就恢复了，感觉神清气爽，但依然燥热难耐。也许你可以找个伴侣操一顿？毕竟，做爱嘛，有一个或两个伴侣会更好。或者两个以上的伴侣。你把一缕长长的白金金色头发从眼前拨开，舔了舔嘴唇——你准备好找点乐子了！[pg]");
            if(get_player().hips.rating < 12 || get_player().butt.rating < 12)
            {
               outputText("当你迈开步子去寻找性伴侣时，你感觉到自己的重心正在发生偏移。");
               if(get_player().hips.rating < 12 && get_player().butt.rating < 12)
               {
                  outputText("你的屁股和胯部突然膨胀起来，迫使你采取一种缓慢、摇曳的步态。你发现前后扭动胯部对你来说变得很自然。你刻意在走动时夹紧臀部肌肉，让你那曲线优美的屁股随之晃动。");
                  get_player().butt.rating = 12;
                  get_player().hips.rating = 12;
               }
               else if(get_player().hips.rating < 12)
               {
                  outputText("你的胯部突然变宽，迫使你采取一种缓慢、摇曳的步态。你发现前后扭动胯部对你来说变得很自然，而且你那淫荡的大屁股似乎在你迈出的每一步中都会自行晃动。");
                  get_player().hips.rating = 12;
               }
               else
               {
                  outputText("你的[butt]急剧膨胀，丰满的臀瓣随着新增加的重量在每一步中晃动。短短几秒钟内，夹紧臀肌让你那丰满的臀瓣晃动得更加诱人，就已经成为了你的本能。");
                  get_player().butt.rating = 12;
               }
               outputText("[pg]");
            }
            if(get_player().tone > 0)
            {
               outputText("最奇怪的是，你的肌肉好像消失了！就在你眼前，所有的肌肉线条都消失了，让你的身体变得柔软而曲线优美。你戳了戳自己，咯咯地笑了起来！每个人肯定都会想，嗯，一有机会就往你身上蹭。你的大腿太软了，你敢打赌，你甚至不用碰你湿润的小穴，就能夹着两根鸡巴让他们高潮。");
               get_player().tone = 0;
               if(get_player().get_str100() >= 30)
               {
                  if(get_player().get_str100() >= 90)
                  {
                     dynStats(DynStat.Str(-10));
                  }
                  if(get_player().get_str100() >= 70)
                  {
                     dynStats(DynStat.Str(-10));
                  }
                  if(get_player().get_str100() >= 50)
                  {
                     dynStats(DynStat.Str(-10));
                  }
                  dynStats(DynStat.Str(-5));
                  outputText("力量减弱后，你确实觉得行动起来有点吃力，但那些强壮的大块头不就是干这个的嘛！你只要调调情，直到他们中有人自愿帮忙或者什么的就行了！再说，你也不需要多大的力气去给鸡巴打飞机，或者用手指去抠那些荡妇的小穴！");
               }
               outputText("[pg]");
            }
            if(!get_player().hasPerk(PerkLib.BimboBody))
            {
               outputText("<b>(获得特质：荡妇体质！)</b>\n");
               get_player().createPerk(PerkLib.BimboBody,0,0,0,0);
            }
            if(!get_player().hasPerk(PerkLib.BimboBrains))
            {
               outputText("<b>(获得特质：无脑荡妇！)</b>\n");
               get_player().createPerk(PerkLib.BimboBrains,0,0,0,0);
               if(get_player().get_inte() > 21)
               {
                  _loc1_ = get_player().get_inte() / 5;
                  get_player().set_inte(21 + _loc1_);
               }
            }
            get_player().orgasm("Vaginal");
            dynStats(DynStat.Inte(-1),DynStat.Lib(4),DynStat.Sens(25));
            get_player().modFem(100,100);
         }
         return false;
      }
      
      override public function canUse() : Boolean
      {
         if(!get_player().hasPerk(PerkLib.FutaForm))
         {
            return true;
         }
         outputText("呃。这东西简直，就像……去年的老古董。也许你可以找别人喂给他们喝？[pg]");
         return false;
      }
   }
}

