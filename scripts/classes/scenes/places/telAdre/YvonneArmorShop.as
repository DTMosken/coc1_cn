package classes.scenes.places.telAdre
{
   import classes.CoC;
   import classes.DynStat;
   import classes.ItemType;
   import classes.Player;
   import classes._FlagDict.FlagDict_Impl_;
   import classes.display.SpriteDb;
   import classes.globalFlags.KFLAGS;
   import classes.items.Armor;
   import classes.items.ArmorLib;
   import classes.items.ShieldLib;
   import classes.scenes.Camp;
   import classes.scenes.Inventory;
   import classes.scenes.places.TelAdre;
   import coc.view.CoCButton;
   import flash.Boot;
   import haxe.IMap;
   
   public class YvonneArmorShop extends Shop
   {
      
      public function YvonneArmorShop()
      {
         if(Boot.skip_constructor)
         {
            return;
         }
         super();
         sprite = SpriteDb.get_s_yvonne();
      }
      
      public function yvonneFlirt() : void
      {
         spriteSelect(null);
         clearOutput();
         outputText("你走近了一步，目光从她那呼之欲出、几乎包裹不住的双乳，移到她撅起的嘴唇和那双充满表现力的紫罗兰色眼睛。一缕被汗水浸湿的红褐色头发遮住了她部分脸庞，但这位高挑丰满的铁匠在你注视下，紧张地将它拨到一边。当你靠近到触手可及的距离时，你轻声而真诚地宣告，[say: 你是这家店里最美丽的杰作。]");
         outputText("[pg]伊冯后退了一步，你发誓你看到一抹红晕" + (get_noFur() ? "在她的脸颊上" : "透过她的皮毛") + "绽放，那是一种羞涩的火热光芒，蔓延到她那巨大双乳的上缘。她将双臂交叉在围裙上，无意中将那对巨大的乳房挤得更紧，使她的乳沟深得像峡谷一样。一声长长的叹息让那片柔软的高地像钟摆一样摇晃，伊冯回答道，[saystart]");
         dynStats(DynStat.Lust(10 + get_player().lib / 10));
         if(get_player().cockTotal() == 0)
         {
            outputText("抱歉，但你看起来不怎么有趣。[sayend]");
            doNext(inside);
            return;
         }
         if(get_player().get_tallness() > 65 && !get_lowStandards())
         {
            outputText("抱歉，但你看起来不怎么有趣。[sayend]");
            doNext(inside);
            return;
         }
         if(get_player().cockThatFits(75) == -1 && !get_lowStandards())
         {
            outputText("抱歉，但你看起来不怎么有趣。[sayend]");
            doNext(inside);
            return;
         }
         if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,437) == 0)
         {
            outputText("好吧，我确实想来一发速战速决的。如果你刚才说的是认真的，请去把牌子换成“外出”。");
         }
         else
         {
            outputText("你想再来一次，是吗？我确实喜欢出点汗……");
         }
         outputText("[sayend]");
         menu();
         addButton(0,"操她",fuckYvonneInZeBlacksmith);
         addButton(1,"算了",backOutOfYvonneFuck);
      }
      
      public function yvonneCombineNorm() : void
      {
         outputText("[pg]她了然地哼了一声，而且说到做到，甚至没花多长时间。");
         outputText("[pg][say:给你，按要求把锁子甲穿在束腰外衣里面。]你花了一点时间检查这件衣服，对结果很满意，把它放进了你的包里。");
         outputText("[pg]你获得了冒险者锁子甲束腰外衣！");
         get_player().destroyItems(get_armors().FULLCHN,1);
         get_player().destroyItems(get_armors().ADVCLTH,1);
         get_inventory().takeItem(get_armors().ADVNCHN,inside);
      }
      
      public function yvonneCombineLewd() : void
      {
         outputText("[pg]她了然地笑了笑，而且说到做到，甚至没花多长时间。");
         outputText("[pg][say:给你，按要求把没裤子的锁子甲穿在束腰外衣里面。]你花了一点时间检查这件衣服，对结果很满意，把它放进了你的包里。");
         outputText("[pg]你获得了淫荡冒险者锁子甲束腰外衣！");
         get_player().destroyItems(get_armors().FULLCHN,1);
         get_player().destroyItems(get_armors().ADVCLTH,1);
         get_inventory().takeItem(get_armors().ADVLCHN,inside);
      }
      
      public function yvonneCombine() : void
      {
         clearOutput();
         outputText("你问她能不能把你的绿色冒险者衣服和锁子甲合并成一件。她点点头，听了你的要求，看了看这两件装备，然后开口了。");
         outputText("[pg][say:没问题，我可以做，应该花不了多长时间。有什么具体要求吗？]");
         menu();
         addButton(0,"普通",yvonneCombineNorm).hint(get_armors().ADVNCHN.get_tooltipText(),get_armors().ADVNCHN.get_tooltipHeader());
         addButton(1,"淫荡",yvonneCombineLewd).hint(get_armors().ADVLCHN.get_tooltipText(),get_armors().ADVLCHN.get_tooltipHeader());
      }
      
      override public function inside() : void
      {
         spriteSelect(SpriteDb.get_s_yvonne());
         clearOutput();
         outputText("军械库内热浪滚滚，巨大的锻炉占据了店铺的另一侧，散发出惊人的高温。风箱呼呼作响，一个高大的" + (get_noFur() ? "长着狗耳的" : "德国牧羊犬") + "女人正在锻炉旁忙碌。令人难以置信的是，她除了穿了一件破旧的皮围裙外，什么也没穿。围裙在前面高高隆起，勉强包裹住她那夸张的曲线，同时保护它们免受锻炉高温的灼伤。她从锻炉中夹出一块金属，用一把比你头还大的锤子敲击了几下，然后把它扔进装满水的水桶里，滚烫的金属瞬间激起阵阵蒸汽。终于，汗流浃背的女铁匠注意到了你，转过身来，她的乳房随之剧烈地晃动着。[pg]");
         outputText("[say: 你想让我给你打点什么？板甲？还是更透气一点的装备？] 伊冯一边扇着风一边问道。");
         menu();
         addItemBuyButton(get_armors().CHBIKNI);
         addItemBuyButton(get_armors().FULLCHN);
         addItemBuyButton(get_armors().FULLPLT);
         addItemBuyButton(get_armors().INDECST);
         addItemBuyButton(get_armors().LTHRROB);
         addItemBuyButton(get_armors().SCALEML);
         addItemBuyButton(get_armors().SAMUARM);
         addItemBuyButton(get_shields().BUCKLER);
         addItemBuyButton(get_shields().KITE_SH);
         addItemBuyButton(get_shields().GREATSH);
         addItemBuyButton(get_shields().TOWERSH);
         if(get_player().hasKeyItem("Dragon Eggshell"))
         {
            outputText("[pg]虽然展示的装备各有千秋，但没有一件真正引起你的兴趣。伊冯不耐烦地用脚打着拍子。[say: 好吧，如果你有什么好材料的话，我可以为你量身定做……小可爱。200宝石。]");
            if(get_player().get_gems() < 200)
            {
               outputText("[pg]你买不起！");
            }
            else
            {
               addButton(12,"蛋壳",get_game().emberScene.getSomeStuff);
            }
         }
         else
         {
            addButton(12,"合成",yvonneCombine).hint("让伊冯将你的绿色冒险者衣服和锁子甲结合起来").disableIf(!(get_player().hasItem(get_armors().FULLCHN) && get_player().hasItem(get_armors().ADVCLTH)),"你需要一套锁子甲和绿色的冒险者衣服。");
         }
         addButton(13,"调情",yvonneFlirt);
         addButton(14,"离开",get_telAdre().armorShops);
      }
      
      public function fuckYvonneInZeBlacksmith() : void
      {
         spriteSelect(null);
         clearOutput();
         var _loc1_:int = get_player().cockThatFits(75);
         if(_loc1_ < 0)
         {
            _loc1_ = 0;
         }
         var _loc2_:int = _loc1_ + 1;
         outputText("你走到门前，发现窗户前挂着一块牌子。朝向室内的一面写着“外出”。门框旁边还挂着一块“打烊”的牌子。你拿起那块简单的木牌，把它翻了过来——你可不想在寻欢作乐的时候被人撞见，对吧？");
         outputText("[pg]一只" + (get_noFur() ? "" : "毛茸茸的、") + "长满老茧的手抓住你的后颈，把你提离地面，推到墙上，用力之大，连附近挂着的武器都危险地嘎嘎作响。一股热气喷在你的脸颊上" + (get_noFur() ? "" : "，伊冯湿润的犬鼻蹭着你的耳朵") + "，她在你脸上喘着粗气。她靠得很近，你感觉到她赤裸、被汗水浸透的乳房在你的背上滑上滑下，像她铁钳般的抓握一样牢牢地支撑着你。伊冯长而光滑的舌头从你的锁骨舔到下巴，舔舐着已经开始渗出的汗珠，锻造炉的余热和你同伴温暖、强壮的身体早已让你燥热难耐。");
         outputText("[pg]一股明显的女性气息飘入你的鼻腔，与铁匠自身刺鼻的体味混合在一起，浓烈得让你头晕目眩。伊冯空出的一只手开始脱下你的[armor]，铁匠自信的动作表明她在这方面经验丰富。这个超级丰满的母狗发情期的气味越来越浓，几乎盖过了她咸咸的汗味，她的乳头紧紧地压在你的背上。[EachCock]因为这强硬的关注而勃起，被夹在墙壁和你的肚子之间。脱完你的装备后，伊冯咬了咬你的脖子，说道：[saystart]好大一包，");
         if(get_player().cockArea(_loc1_) < 20)
         {
            outputText("小矮子");
         }
         else if(get_player().cockArea(_loc1_) < 40)
         {
            outputText(get_player().mf("男孩","女孩"));
         }
         else if(get_player().cockArea(_loc1_) < 60)
         {
            outputText("大[boy]");
         }
         else
         {
            outputText(get_player().mf("种马","种马"));
         }
         outputText("。[sayend]");
         outputText("[pg]铁匠铺女主人突然松开你，退后一步，支撑你的乳房肉垫不再帮你保持平衡。在短暂的慌乱踉跄之后，你稳住身形，转过身来，好奇这个丰满的母狗到底在干什么。");
         outputText("[pg]伊冯四肢着地趴在地上。她的尾巴几乎笔直地竖起，兴奋地来回摇摆，向你展示她曲线优美的臀部。令人惊讶的是，她的屁股比她的上半身肌肉少得多，一对柔软的臀瓣几乎遮住了她湿透的小穴。你不确定那是她发情分泌的润滑液，还是在锻造炉前工作了一整天流下的汗水，但伊冯的大腿绝对被湿气浸透了；那简直是一个湿润的滑水道，召唤着你将你的肉棒埋入这只犬娘的女性入口。她回头看了看，眼神中闪烁着顺从的光芒，乞求道：[say: 来吧，做我的阿尔法。这只母狗需要一场火热、湿润的性爱。快干我！] 多么奇怪的反差——前一刻她还把你扔来扔去，下一刻，就乞求被骑乘。尽管她力量强大，但看来伊冯仍然想被当作一只温顺的母狗来对待。");
         outputText("[pg]你悄悄走到这个高大的女人身边，开始将[oneCock]对准她巨大的臀部，她身上散发出的闷热、混合着信息素的臭味，让你很难不扑倒在她身上发情。她巨大的乳房被挤压在地板上，淫秽地挤向铁匠柔软、肌肉发达的躯干两侧。当你推入时，她湿滑的小穴有力而深情地挤压着你的[cock " + _loc2_ + "]。她强有力的阴道肌肉紧紧地包裹着你肿胀的肉棒，当你开始适当地操她时，你耕耘着她被汗水和爱液浸透的褶皱，同时你还努力伸手去够她那不可思议的乳房。");
         outputText("[pg]你抓住她柔软的胸肉，开始揉捏你能摸到的地方，引得你的伴侣发出满意的呻吟。不幸的是，她狂摇的尾巴一次又一次地打在你的鼻子上，你不得不腾出一只手来挡住它，这样你才能不受这女人犬科本能的干扰，畅通无阻地操弄她的小穴。她低吼了一声，但并没有阻止你。你可以看到她手臂上的肌肉在颤抖、摇晃，尽管你的[cock " + _loc2_ + "]给可怜的她带来了压倒性的快感，她仍在努力维持着姿势。");
         outputText("[pg]一阵颤栗传遍了这只犬" + (get_noFur() ? "娘" : "兽人") + "的全身，最终化作一阵紧缩，在她的阴道中荡漾开来，用她湿滑的小穴榨取着你。这招奏效了，当你深深地顶入她的体内时，你俯身压在她趴伏的身体上，她被汗水浸湿的" + (get_noFur() ? "头发" : "皮毛") + "在你高潮时将她的气味涂抹在你的脸上。");
         if(get_player().hasKnot(_loc1_))
         {
            outputText("你的肉结膨胀起来，将你锁在她的体内，牢牢地堵住了你现在灌满她深处的精液的任何逃生路线。伊冯梦幻般地叹息着，[say: 刚刚好……]与此同时，精液滑入她的产道，渗入她的子宫。[if (cumQuantity > 500) { 珍珠般的粘液以足以让卵子受精的力量溅入她的子宫，将她填满到了超出她最狂野期望的程度。}][if (cumQuantity > 1000) { 铁匠在痛苦和快乐中大叫，她的肚子被你的液体撑得圆滚滚的，看起来更像怀孕了，被塞得满满当当。}][if (cumQuantity > 2000) { 多亏了你的肉结，一滴也没有漏出来，很快伊冯的肚子就变得和她的乳房一样肥大，被精液胀到了极点，就像一个装满象牙色精子的晃荡的红褐色浴缸。}]");
         }
         else
         {
            outputText("你的精液冒着泡填满了她的深处，精液在向她的子宫移动时涌遍了她的全身。伊冯梦幻般地叹息着，[say: 啊……]与此同时，你将你的[balls]清空在她毫无防备的阴道里。[if (cumQuantity > 500) { 珍珠般的粘液以足以让卵子受精的力量溅入她的子宫，将这个母狗填满到了超出她最狂野期望的程度。}][if (cumQuantity > 1000) { 铁匠在痛苦和快乐中大叫，她的肚子被你的液体撑得圆滚滚的，看起来绝对是怀孕了。她的小穴开始滴下精子，被内射得难以置信。}][if (cumQuantity > 2000) { 不幸的是，随着你的男子气概显现出来，伊冯的身体达到了极限，象牙色的精液从她小穴的四面八方喷射而出，在地板上滴成一滩珍珠般的水洼。}]");
         }
         outputText("在你身下的小穴被精液彻底塞满后，你");
         if(get_player().hasKnot(_loc1_))
         {
            outputText("拔");
         }
         else
         {
            outputText("抽");
         }
         outputText("了出来，伴随着一声女性愉悦的呼气声。");
         outputText("[pg]伊冯摇摇晃晃地站起" + (get_noFur() ? "身" : "爪") + "，全程都在呻吟，身后在地板上留下了一道白色的痕迹。她的尾巴高兴地摇摆着，她抓住你，把你拉进她汗津津的怀里，深情地捏着你的[butt]。直到你感到头晕目眩，被她那硕大的乳房组织和强烈的费洛蒙憋得半死，她才放开你。");
         outputText("[pg]伊冯把你的装备扔给你，你迷迷糊糊地穿上衣服。还没等你完全穿好，她就把你推到了街上，你浑身散发着性爱的气味，跌跌撞撞地踩着自己的[feet]。她在你身后喊道，[say: 谢谢你，宝贝，我得把这烂摊子拖干净！]");
         get_player().orgasm("Dick");
         dynStats(DynStat.Sens(-1));
         var _loc3_:IMap = KFLAGS.flags;
         FlagDict_Impl_.arrayWriteInt(_loc3_,437,FlagDict_Impl_.arrayReadInt(_loc3_,437) + 1);
         doNext(get_camp().returnToCampUseOneHour);
      }
      
      override public function confirmBuy(param1:ItemType = undefined, param2:int = -1, param3:String = undefined) : void
      {
         if(param3 == null)
         {
            param3 = "";
         }
         spriteSelect(null);
         clearOutput();
         if(param1 is Armor)
         {
            outputText("伊冯认真地看了你一眼，然后点了点头。她从架子上取下盔甲，做了些调整，用她那把巨大的锤子敲打着，以确保完美贴合。整个过程中，她完全没有注意到自己那对巨大乳房的晃动，好几次都不小心露出了她那傲人的乳头。[pg]");
            outputText("她完成了工作，转过身来，笑容满面地对你说，[say: 好了，一共是 " + param1.get_value() + " 宝石，除非你改变主意了？]");
         }
         else
         {
            outputText("伊冯认真地看了你一眼，然后点了点头。她从架子上取下盾牌展示给你看。[pg]");
            outputText("她笑容满面地对你说，[say: 好了，一共是 " + param1.get_value() + " 宝石，除非你改变主意了？]");
         }
         super.confirmBuy(param1);
      }
      
      public function backOutOfYvonneFuck() : void
      {
         spriteSelect(null);
         clearOutput();
         outputText("你礼貌地拒绝了，不想打扰她的工作。伊冯叹了口气，开始拉风箱，嘴里嘟囔着：[say: 那你最好买点什么！]");
         doNext(inside);
      }
   }
}

