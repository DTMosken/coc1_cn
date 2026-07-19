package classes.items.consumables
{
   import classes.BreastRow;
   import classes.Cock;
   import classes.DynStat;
   import classes.PerkLib;
   import classes.Player;
   import classes.StatusEffects;
   import classes.items.Consumable;
   import flash.Boot;
   
   public class BroBrew extends Consumable
   {
      
      public static var ITEM_VALUE:int = 1000;
      
      public function BroBrew()
      {
         if(Boot.skip_constructor)
         {
            return;
         }
         super("BroBrew","Bro Brew","a can of Bro Brew",1000,"This aluminum can is labeled as \'Bro Brew\'. It even has a picture of a muscly, bare-chested man flexing on it. A small label in the corner displays: \"Demon General\'s Warning: Bro Brew\'s effects are as potent (and irreversible) as they are refreshing.");
      }
      
      override public function useItem() : Boolean
      {
         var _loc1_:Number = NaN;
         get_player().slimeFeed();
         if(get_player().hasPerk(PerkLib.BimboBody))
         {
            outputText("这东西就像一个巨大的方块一样砸中你，在它开始生效时，你几乎要站立不稳。");
            if(get_player().get_tallness() < 77)
            {
               get_player().set_tallness(77);
               outputText("……地面是不是变远了？你低头一看，意识到自己正在长高！就像一株加速生长的花苗，你不断变高，直到最后停在……你估计大概有六英尺半左右。哈。你可没料到会发生这种事！");
            }
            if(get_player().tone < 100)
            {
               outputText("你的手臂传来一阵刺痛，吸引了你的注意力，你正好看到你的二头肌和三头肌在新生能量的作用下膨胀起来，皮肤紧绷，直到粗壮的肌肉线条贯穿整个手臂。你的另一只手臂也涌动着同样的变化。为了适应这种变化，你的肩膀和脖子变宽，达到了健美运动员的比例，而你的胸部和腹肌则紧绷成坚实、雕塑般的体格。你的[legs]和臀部最后发生变化，膨胀到足以让任何女性武术家感到自豪的比例。你觉得拥有如此强壮的双腿，你可以永远踢下去。");
               get_player().tone = 100;
            }
            outputText("[pg]");
            if(!get_player().hasCock())
            {
               outputText("然而，饮料的作用还没有结束，它在你的腹股沟处积聚的快感清楚地表明了这一点。你只能在狂喜中叫喊，并及时松开[armor]的下摆，让一根小阴茎弹出来。你着迷地看着血液迅速使肉棒勃起至全长——然后继续变长！没过多久，你就拥有了一根颤抖的10英寸长的男根，随时准备塞进一个欢迎它的洞里。");
               get_player().createCock();
               get_player().cocks[0].cockLength = 10;
               get_player().cocks[0].cockThickness = 2;
               if(get_player().balls == 0)
               {
                  outputText("紧接着，两颗充满精液的睾丸在它后面垂下，里面的液体在翻滚搅动。");
                  get_player().balls = 2;
                  get_player().ballSize = 3;
               }
               outputText("[pg]");
            }
            else if(get_player().balls == 0)
            {
               outputText("你的肉棒后面开始肿胀，当两颗充满精液的蛋蛋落入新形成的阴囊时，一种极其奇特的感觉袭来。真他妈爽！[pg]");
               get_player().balls = 2;
               get_player().ballSize = 3;
            }
            outputText("最后，你感觉到变形逐渐停止，让你能自由地探索你那轮廓分明、随时准备做爱的新身体。就算你现在连一句连贯的话都说不出来又怎样？你觉得，有这样一具身体，根本不需要语言！");
            if(get_player().get_inte() > 35)
            {
               _loc1_ = (get_player().get_inte() - 35) / 5;
               get_player().set_inte(35 + _loc1_);
               dynStats(DynStat.Inte(-0.1));
            }
            if(get_player().lib < 50)
            {
               get_player().lib = 50;
               dynStats(DynStat.Lib(0.1));
            }
            outputText("[pg]");
            if(get_player().hasPerk(PerkLib.BimboBrains))
            {
               outputText("<b>(失去特质：无脑荡妇，荡妇体质)\n");
            }
            else
            {
               outputText("<b>(失去特质：荡妇体质)\n");
            }
            get_player().removePerk(PerkLib.BimboBrains);
            get_player().removePerk(PerkLib.BimboBody);
            get_player().createPerk(PerkLib.FutaForm,0,0,0,0);
            get_player().createPerk(PerkLib.FutaFaculties,0,0,0,0);
            outputText("(获得特质：扶她形态，扶她思维)</b>");
            return false;
         }
         if(get_player().hasPerk(PerkLib.BroBody) || get_player().hasPerk(PerkLib.FutaForm))
         {
            outputText("你打开易拉罐，匆忙地大口灌下。妈的，这玩意儿简直太棒了。当你把易拉罐在额头上捏扁时，你寻思着能不能在哪里找到六连包的？[pg]");
            get_player().changeFatigue(-33);
            get_player().HPChange(100,true);
            get_player().refillHunger(30);
            return false;
         }
         outputText("好吧，也许这能给你实现目标所需的肌肉。你拉开顶部的拉环，听到独特的嘶嘶声，那是碳酸压力释放的声音。一股烟雾般的薄雾从打开的罐子里飘出，闻起来有啤酒花和酒精的味道。你把它举到唇边，冰冷、金属质感的罐子触碰到你的舌头，随后第一滴琥珀色的啤酒滚入你等待的口中。它让人感到刺痛，但非常非常美味。你感到一种必须尽快喝完它的冲动，于是你开始大口猛灌。几秒钟内你就把整罐喝光了。[pg]");
         outputText("你的肠胃里涌起一阵翻江倒海的饱腹感，你不假思索地张大嘴巴，释放出一个巨大的饱嗝。它在你的胸腔里轰隆作响，惊飞了远处的鸟儿。太棒了！你把易拉罐狠狠地砸在额头上，力度大到把脆弱的铝罐砸成了一个扁平的圆盘。妈的，你感觉自己已经变强了");
         if(get_player().get_inte() > 50)
         {
            outputText("，尽管你对自己如此享受这种简单粗暴的行为感到有些担忧");
         }
         outputText("。[pg]");
         if(get_player().biggestTitSize() >= 1)
         {
            outputText("你的[nipples]开始感到一阵酥麻，随后紧致的乳蕾变得温暖，甚至有些发烫。");
            if(get_player().biggestLactation() >= 1)
            {
               outputText("不知为何，你知道你之前分泌的乳汁已经消失了，被你的身体重新吸收了。");
            }
            outputText("它们向你的身体中心收缩，随着你逐渐平坦的[fullchest]一起缩小。你颤抖着，肌肉紧绷作为回应。你的胸部不仅仅是在缩小，它在重塑，雕刻成一对巨大而轮廓分明的胸肌。");
            if(int(get_player().breastRows.length) > 1)
            {
               outputText("下方的乳房完全消失了。");
               while(int(get_player().breastRows.length) > 1)
               {
                  get_player().removeBreastRow(int(get_player().breastRows.length) - 1,1);
               }
            }
            get_player().breastRows[0].breastRating = 0;
            get_player().breastRows[0].nipplesPerBreast = 1;
            get_player().breastRows[0].fuckable = false;
            if(get_player().nippleLength > 0.5)
            {
               get_player().nippleLength = 0.25;
            }
            get_player().breastRows[0].lactationMultiplier = 0;
            get_player().removeStatusEffect(StatusEffects.Feeder);
            get_player().removePerk(PerkLib.Feeder);
            outputText("很快，你的胸部就消失了。哇哦！[pg]");
         }
         outputText("从你的手开始，你的肌肉开始收缩和放松，每一次都变得更紧、更强壮，更重要的是——更大。这种奇怪的感觉顺着你的手臂向上蔓延，使你的二头肌变厚，肩膀变宽。很快，你的脖子和胸部变得和你的手臂一样强壮。你试探性地弯曲了几下，因为你的腹肌");
         if(get_player().tone >= 70)
         {
            outputText("进一步显现出来");
         }
         else
         {
            outputText("变得异常明显");
         }
         outputText("。这种奇怪的、增强肌肉的变化顺着你的[legs]向下流淌，使它们和你身体的其他部分一样健壮有力。你弯起手臂，亲吻着你那巨大、紧绷的二头肌。你太棒了！[pg]");
         outputText("哇哦，你现在真他妈的肌肉发达、强壮无比，完全不像以前那个弱不禁风的胆小鬼。然而，你感到脑子有些迟钝。你的思维似乎变得越来越慢，就像在沼泽中艰难跋涉一样。意识到这一点后，你沮丧地咕哝了一声。当然，你现在是个肌肉猛男了，但如果你蠢得像块石头，那又有什么用呢？你的肌肉以最美丽的姿态收缩着，于是你停下来摆了个姿势，被自己的外表迷住了。去他妈的思考，那是失败者才干的事！[pg]");
         if(get_player().hasCock())
         {
            if(get_player().cocks[0].cockLength < 10)
            {
               outputText("仿佛是约定好的一样，熟悉的刺痛感聚集在你的腹股沟，你隐约记得你还有一块肌肉需要变大。要是你还有足够的智商意识到你的阴茎并不是肌肉就好了。不管怎样，你的[cock]膨胀变大，");
               if(get_player().cocks[0].cockThickness < 2.75)
               {
                  outputText("变粗并且");
                  get_player().cocks[0].cockThickness = 2.75;
               }
               outputText("变长，直到它有十英寸长，将近三英寸宽。操，你这活儿真大！");
               get_player().cocks[0].cockLength = 10;
            }
            if(get_player().balls > 0)
            {
               outputText("你的[sack]发出清晰的翻腾声并摇晃着，但没有显示出任何外在的变化迹象。好吧，可能只是，获得了更多的耐力之类的。");
            }
            else
            {
               outputText("两颗圆润的球体垂落下来，在你[legs]上方填满了一个新的肉囊。太棒了！有了这样的蛋蛋，你大概能射出成桶的精液。");
               get_player().balls = 2;
               get_player().ballSize = 3;
            }
            outputText("[pg]");
         }
         else
         {
            outputText("你听到一阵紧绷、撕裂的声音，随后才意识到这声音来自你的内衣。拉开你的[armor]，你惊讶地倒吸一口凉气，只见一根巨大、跳动的阴茎现在正躺在你的[hips]之间。它迅速勃起，足足有十英寸长，而且该死的，感觉真他妈爽。你绝对应该找个温暖的洞穴好好操一顿！");
            if(get_player().balls == 0)
            {
               outputText("两颗圆润的球体垂落下来，在你[legs]上方填满了一个新的肉囊。太棒了！有了这样的蛋蛋，你大概能射出成桶的精液。");
            }
            outputText("[pg]");
            get_player().createCock();
            get_player().cocks[0].cockLength = 12;
            get_player().cocks[0].cockThickness = 2.75;
            if(get_player().balls == 0)
            {
               get_player().balls = 2;
               get_player().ballSize = 3;
            }
         }
         if(get_player().hasVagina())
         {
            outputText("同时，你的" + get_player().vaginaDescript(0) + "变得滚烫，几乎像着火了一样。你用极其男人的方式咒骂了一会儿，随后疼痛消退成一阵隐隐的瘙痒。你抓了抓那里，发现你的女性部位不见了。只留下一块敏感的皮肤。[pg]");
            get_player().removeVagina(0,1);
         }
         if(get_player().get_femininity() > 0)
         {
            outputText("最后，变化蔓延到了你的脸上。你能感觉到下颌骨在移动和滑动，皮肤也在改变以适应脸部的新形状。变化结束后，你摸了摸自己无可挑剔的方形下巴，露出一个灿烂、随和的笑容。你看起来太帅了！[pg]");
            get_player().modFem(0,100);
         }
         outputText("你欣赏完自己，调整了一下你的[armor]，让它更贴合你的新体格。也许附近有些婊子能让你操。见鬼，就凭你这帅气的模样，说不定连其他男人都想让你操他们呢，当然，不是搞基。[pg]");
         get_player().modTone(100,100);
         get_player().modThickness(100,50);
         get_player().createPerk(PerkLib.BroBrains,0,0,0,0);
         get_player().createPerk(PerkLib.BroBody,0,0,0,0);
         outputText("<b>(获得特质：兄弟体格！)\n");
         outputText("(获得特质：兄弟大脑！)</b>\n");
         if(get_player().hasPerk(PerkLib.Feeder))
         {
            outputText("<b>(失去特质：喂养者！)</b>\n");
            get_player().removePerk(PerkLib.Feeder);
         }
         if(get_player().get_inte() > 21)
         {
            _loc1_ = (get_player().get_inte() - 20) / 4;
            get_player().set_inte(21 + _loc1_);
         }
         dynStats(DynStat.Str(33),DynStat.Tou(33),DynStat.Inte(-1),DynStat.Lib(4),DynStat.Lust(40));
         get_player().refillHunger(30);
         return false;
      }
   }
}

