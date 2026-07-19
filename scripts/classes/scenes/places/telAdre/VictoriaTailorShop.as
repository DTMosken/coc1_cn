package classes.scenes.places.telAdre
{
   import classes.Cock;
   import classes.DynStat;
   import classes.ItemType;
   import classes.Player;
   import classes.StatusEffects;
   import classes.display.SpriteDb;
   import classes.internals.Utils;
   import classes.items.ArmorLib;
   import classes.items.UndergarmentLib;
   import classes.scenes.Camp;
   import classes.scenes.places.TelAdre;
   import flash.Boot;
   
   public class VictoriaTailorShop extends Shop
   {
      
      public var backOption:Function;
      
      public function VictoriaTailorShop()
      {
         if(Boot.skip_constructor)
         {
            return;
         }
         super();
         backOption = clothesSection;
         sprite = SpriteDb.get_s_victoria();
      }
      
      public function undergarmentSection() : void
      {
         clearOutput();
         outputText("(你想买什么？)");
         backOption = undergarmentSection;
         menu();
         addItemBuyButton(get_undergarments().C_BRA);
         addItemBuyButton(get_undergarments().C_PANTY);
         addItemBuyButton(get_undergarments().C_LOIN);
         addItemBuyButton(get_undergarments().LOLIPAN);
         addItemBuyButton(get_undergarments().LOLIBRA);
         addItemBuyButton(get_undergarments().FUNDOSH);
         addItemBuyButton(get_undergarments().FURLOIN);
         addItemBuyButton(get_undergarments().GARTERS);
         addItemBuyButton(get_undergarments().LTX_BRA);
         addItemBuyButton(get_undergarments().LTXSHRT);
         addItemBuyButton(get_undergarments().LTXTHNG);
         addButton(14,"返回",inside);
      }
      
      override public function noBuyOption(param1:ItemType = undefined, param2:String = undefined) : void
      {
         if(param2 == null)
         {
            param2 = "";
         }
         backOption();
      }
      
      override public function inside() : void
      {
         clearOutput();
         outputText("裁缝店内部比你在城里见过的任何地方都要干净得多。墙壁被漆成柔和的灰色，地板上铺着一张宽大的宝蓝色地毯。环顾四周后，你明白了为什么墙壁和地板的颜色如此柔和——安静的背景让商品看起来更加惊艳。这里有一排又一排的衣服，但大部分都是普通的舒适衣物，不值得花太多时间去研究。一个尖锐的声音响起，[say:需要帮忙吗？][pg]");
         if(!get_player().hasStatusEffect(StatusEffects.Victoria))
         {
            outputText("你转过身，");
            if(get_player().get_tallness() > 60)
            {
               outputText("寻找声音的来源，最终低头看到一个矮小但胸部丰满的柯基犬娘。");
            }
            else
            {
               outputText("与一个胸部丰满的柯基犬娘面对面。");
            }
            outputText("从她时髦的低胸装和蓬松的帽子来看，她显然就是裁缝。她的鼻梁上架着单片眼镜，让她看起来相当高贵。这位时髦的姑娘弓起背，展示着她的身材，同时自我介绍道：[say:你好啊，亲爱的，欢迎来到我的店。我叫维多利亚，如果你愿意的话，也可以叫我维琪。你会发现我的衣服比其他地方卖的那些垃圾要好得多。]");
            get_player().createStatusEffect(StatusEffects.Victoria,0,0,0,0);
         }
         else
         {
            outputText("你转过身去，看向");
            if(get_player().get_tallness() > 60)
            {
               outputText("下方");
            }
            outputText("的柯基裁缝维多利亚。像往常一样，她穿着时髦的低胸连衣裙，戴着羽毛帽。");
         }
         menu();
         addButton(0,"全身服饰",clothesSection);
         addButton(1,"内衣",undergarmentSection);
         addButton(14,"离开",get_telAdre().armorShops);
      }
      
      public function flirtWithVictoria(param1:ItemType) : void
      {
         var itype1:ItemType;
         var _g:VictoriaTailorShop;
         clearOutput();
         var _loc2_:int = get_player().cockThatFits(70);
         if(_loc2_ < 0)
         {
            _loc2_ = get_player().smallestCockIndex();
         }
         outputText("你从她手里接过衣服看了看。把它们放在柜台上，你告诉她这些衣服很不错，但如果她感兴趣的话，你后面可能也有一些非常适合她的东西。");
         if(_loc2_ < 0)
         {
            outputText("[pg]维多利亚坏笑了一下，回答道：[say: 我量过你的内缝了，你那玩意儿塞不进我这种女孩的任何地方。也许下次吧，" + get_player().mf("帅哥","甜心") + "。你到底想不想买点什么？]");
            outputText("[pg]你还想买点什么吗？");
            _g = this;
            itype1 = param1;
            doYesNo(function():void
            {
               _g.debit(itype1);
            },inside);
            return;
         }
         outputText("[pg]她花了一会儿才明白你的暗示，随后脸上绽放出一个大大的笑容。[say: 是吗？那你可不能光说不练，对吧？] 她低声轻笑着，将她曲线玲珑的身体贴向你。[say: 不如我先把店关了，你来给我展示一下你到底有多“合适”，嗯？]");
         outputText("[pg]她捏了一把你的[butt]，跳开去把店门上的营业牌翻转过来，锁上门，拉上所有的窗帘。转过身来，她将丰满的乳沟挤向");
         if(get_player().get_tallness() >= 65)
         {
            outputText("你的肚子。");
         }
         else if(get_player().get_tallness() >= 55)
         {
            outputText("你的胸口。");
         }
         else
         {
            outputText("你的脸。");
         }
         outputText("[say: 那么，让我看看你的本事！] 她熟练地脱下你的[armor]下半部分，露出了[eachCock]。[say: 哎呀呀。看来我一开始对你的判断没错，] 她说着，再次舔了舔嘴唇。[say: 我想，先尝尝味道就好……] 她再次伸出舌头，从根部到顶端，缓慢而悠长地舔舐着你迅速变硬的肉棒。她用嘴唇包住你的" + get_player().cockDescript(_loc2_) + "，快速舔了几下，然后“啵”的一声拔了出来。");
         outputText("[pg][say: 哦，是的，我想你会做得很好的。事实上，我打算给你一点特别的奖励。] 这位胸部丰满的犬娘对你坏笑着，解开了她丰满胸部下方上衣的扣子。还没等你弄明白她要做什么，她就抓起你的[cock]，塞进那个洞里，向上穿过她的乳沟");
         if(get_player().cocks[_loc2_].cockLength >= 5)
         {
            outputText("直到龟头从上面探出来");
         }
         outputText("。");
         if(get_player().cocks[_loc2_].cockThickness > 3)
         {
            outputText("她的脸不舒服地皱了一下，你的粗壮撑紧了她衬衫的接缝。伴随着一连串响亮的“啪”声，她的扣子全飞向了四面八方，让她丰满白皙的乳房弹了出来，剧烈地晃动着。[say: 见鬼，那可是我最喜欢的上衣……] 她抱怨了一会儿，然后用双手把胸部重新挤在一起。");
         }
         else
         {
            outputText("她向内用力压迫双臂，进一步增加对你肉棒的压力，并再次对你露出灿烂的笑容。[say: 准备好了吗，亲爱的？]");
         }
         outputText("[pg]她开始用她那不成比例的巨大胸部在你的肉棒上缓慢地上下套弄，");
         if(get_player().cocks[_loc2_].cockLength > 5)
         {
            outputText("确保每次" + get_player().cockHead(_loc2_) + "突破她的双峰时，都会快速吸吮一下。");
         }
         else
         {
            outputText("把嘴压进她丰满的乳沟里，以便每次你隐藏的龟头靠近时，都能快速舔一下。");
         }
         outputText("[pg][say: 爽吗？] 她问道，暂停了她那柔软的攻势，再次舔过你肉棒的顶端。你只能呻吟着回应，因为那美妙的湿润、柔软的感觉正冲刷着你敏感的器官。[say: 我就猜到，] 她说着，伴随着一声湿润的“啵”声松开了你。");
         outputText("[pg]维琪继续着她那棉花糖般的攻势，感觉像过了好几个小时，每次你稍微表现出要射精的迹象，她就会慢下来。[say: 你现在可能会恨我，亲爱的，但相信我。等你终于射出来的时候，感觉会好得多。] 她也许是对的，但这种接近高潮又退缩，然后再靠近的折磨简直令人痛苦。她那诱人而缓慢的乳交简直要把你逼疯了。当你感觉到你的精液在你的[balls]里几乎要沸腾，却又被她再次退缩时，你内心的某种东西断裂了。");
         outputText("[pg]你把肉棒从她柔软双峰的束缚中猛地抽出来，一把抓住她柔软的腰部。当你几乎把她扔在柜台上，把她的屁股抬到半空中时，她发出了一声惊讶的尖叫。[say: 噢噢，有人兴奋了！] 她几乎是在欢呼，回头看着你，向你摇晃着她柔软的屁股，尾巴来回摆动，表明她几乎和你一样被欲望吞噬了。你把她的长裙掀到背上，粗暴地把她的内裤拉到一边，然后把你的" + get_player().cockDescript(_loc2_) + "深深地插进她湿润的穴肉中。");
         outputText("[pg]被插入时，她发出惊讶和愉悦的尖叫，随着你开始猛烈地抽插，她丰满的臀部向后迎合着你。她的屁股随着每一次抽插剧烈地晃动，在她白皙的肌肤上荡起层层肉波。你紧紧抓住她柔软的腰部，猛烈地撞击她的臀部，几乎没有注意到她粗壮的大腿撞击柜台边缘时发出的每一声尖叫。[say: 啊！哦，玛莱啊，感觉太棒了！] 她几乎是在尖叫，她的单片眼镜终于从脸上滑落，飞了出去，幸好安全地落在了一堆碎布上。如果你理智尚存，你可能会为修理这副破损眼镜的费用而感到肉痛。");
         outputText("[pg]不知怎的，奇迹般地，你竟然能忍住足够长的时间，让你的手在她柔软的身体上游走，抓住她巨大的乳房，在手中揉捏，直到找到她坚硬如石的乳头。她似乎很享受这种粗暴的对待——事实上是非常享受——因为就在你快速捏了一下她坚硬的乳头时，你感觉到她原本就相当紧致的小穴死死地夹住了你的肉棒。当她爆发性地高潮时，你几乎无法移动，她语无伦次地尖叫着，将她欢愉的淫液喷洒在你的下半身。");
         outputText("[pg]这突如其来的阻力终于让你达到了顶峰，伴随着你的一声大吼，你将自己深深埋入她仍在紧紧夹缩的小穴中，释放了出来。[if (cumNormal) {看来她之前说得没错。你压抑已久的欲望涌过你的肉棒，将你肥沃的种子直接射入她毫无防备的子宫。当你的肉棒喷射出的精液在她疲惫的身体里引发余震时，她发出了一声顺从的呜咽。最后，她的身体放松下来，释放了你逐渐疲软的肉棒。}][if (cumMedium) { 浓稠粘腻的精液如绳索般射入她紧握的小穴深处，试图扑灭你疯狂抽插在她体内点燃的欲火。当你的射精让她的身体再次感受到一阵快感时，她在你身下呜咽着，比之前更紧地夹住了你。谢天谢地，没过多久她就再次松开了你，瘫软在柜台上，呼吸急促。}][if (cumHigh) { 你的尿道扩张，将你浓稠强劲的种子注入维多利亚小穴紧握的肉壁中。当白色的洪流让她再次陷入高潮时，她紧紧地夹住你，在你身下颤抖着，她原本就丰满的腹部开始因为装满了精液而膨胀。即使她正处于上一次高潮的余韵中，她的小穴仍在继续榨取你肉棒中的精液，她的身体渴望吸出更多你浓稠的精液。最后她松开了你，你疲软的肉棒被一股浓稠的精液挤了出来，精液开始在地上汇聚成一滩。}][if (cumVeryHigh) { 你感觉到你的肉棒肿胀起来，几乎要在她体内爆炸，将浓稠的精液源源不断地注入她肥沃的子宫。当她的身体紧缩进入又一次高潮时，她发出了另一声响亮的尖叫，以你从未想过的力度紧紧握住你的肉棒，试图榨干你所有的精液。当你将精液倾泻在她体内时，她柔软的腹部明显地膨胀起来，甚至将她娇小的身体从柜台表面微微托起。谢天谢地，她的身体很快放松下来，释放了你疲软的肉棒，紧接着一股浓稠的白色精液喷泉般涌出，浸湿了你的双腿，并在地上汇聚成一滩。}]");
         if(get_silly())
         {
            outputText("[if (cumExtreme) { 当你的肉棒将一加仑又一加仑的精液倾泻入她痉挛的小穴时，你大声呻吟着。当又一次强烈的高潮席卷她的身体时，她尖叫起来，这是由你射入她体内的大量精液引发的。随着你注入的大量液体不断使她的腹部膨胀，她每次移动时，肚子都会发出清晰的晃荡声。她试图尽可能紧地夹住你，想要留住你巨大的精液量；但就在她稍微松开一点的那一刻，她体内巨大的精液压力将她向前推去，脸朝下扑倒在柜台另一边的一堆衣服上。你浓稠的精液继续从她瘫软的双腿间喷射而出，简直像个喷泉，然后重力将其拉回，溅得店里到处都是。}]");
         }
         else
         {
            outputText("[if (cumExtreme) { 当你的肉棒将一加仑又一加仑的精液倾泻入她痉挛的小穴时，你大声呻吟着。当又一次强烈的高潮席卷她的身体时，她尖叫起来，这是由你射入她体内的大量精液引发的。随着你注入的大量液体不断使她的腹部膨胀，她每次移动时，肚子都会发出清晰的晃荡声。当她继续紧紧挤压你时，浓稠的精液从你肉棒周围喷射而出，她试图在最终释放之前，尽可能多地将精液留在她那看起来像怀孕一样巨大的肚子里，伴随着“啵”的一声，她将你的肉棒挤了出来，紧接着是真正的白色间歇泉。当精液喷涌而出时，你的整个下半身都被染成了白色，浸透了你的衣服，覆盖了地板，而她的肚子则明显地瘪了下去。}]");
         }
         outputText("[pg]最后，你体力不支，向后倒在地板上，筋疲力尽。几秒钟后，维琪从柜台上向后滑落，倒在了你身上。和你一样，她完全无法动弹，但与你不同的是，这更多是因为她完全失去了知觉。她翻着白眼，舌头伸在外面，偶尔还会含糊不清地嘟囔些什么。");
         outputText("[pg]几秒钟后，你的身体终于完全支撑不住，你晕了过去。大约一个小时后你醒来，仍然躺在地板上，维琪就在你附近的地上，靠在柜台上，双腿张开，精液仍然从她被使用过的小穴中滴落。[say: 我呃……想你现在要走了吧？]她问道，听起来还有点迷糊。她摇摇晃晃地站起来，有点罗圈腿地走到门前，打开门锁，然后又顺着墙滑坐下来。[say: 亲爱的，记得再来玩啊！]你提上裤子，爬回街上。站起身来，你注意到几个路人在你关门前对你轻笑。在你离开之前，你觉得你好像听到维多利亚在嘟囔，[say: 得把这地方打扫一下了……]");
         get_player().orgasm("Dick");
         dynStats(DynStat.Sens(-1));
         doNext(get_camp().returnToCampUseOneHour);
      }
      
      override public function confirmBuy(param1:ItemType = undefined, param2:int = -1, param3:String = undefined) : void
      {
         var itype1:ItemType;
         var _g:VictoriaTailorShop;
         if(param3 == null)
         {
            param3 = "";
         }
         clearOutput();
         spriteSelect(null);
         outputText("维多利亚点点头，从肩膀上扯下一根卷尺。她熟练地围着你转，从各个可能的角度为你量尺寸。多亏了她娇小的身材，她很容易就能量出你的内缝尺寸，尽管维琪设法");
         if(get_player().biggestCockArea() > 30 || get_player().totalCocks() > 1)
         {
            outputText("抚摸你鼓胀的裤裆");
         }
         else if(get_player().hasVagina())
         {
            outputText("摩擦你的外阴唇");
         }
         else
         {
            outputText("在你的胯部滑过一根手指");
         }
         outputText("了好几次。你发誓在她站起来的时候看到她舔了舔嘴唇，但她很快转过身去，说道：[say:我在后面有一件应该非常合身！马上就来！][pg]");
         outputText("她在后面消失了一会儿，然后拿着" + Utils.cnName(param1.get_longName()) + "回来了，看起来就像是为你量身定做的一样。[pg]");
         outputText("[say:只要" + param1.get_value() + "颗宝石，它就是你的了，]她说道。");
         super.confirmBuy(param1);
         if(get_player().hasCock() && get_player().get_lust() >= 33)
         {
            _g = this;
            itype1 = param1;
            addButton(4,"调情",function():void
            {
               _g.flirtWithVictoria(itype1);
            });
         }
      }
      
      public function clothesSection() : void
      {
         clearOutput();
         outputText("(你想买什么？)");
         backOption = clothesSection;
         menu();
         addItemBuyButton(get_armors().CLSSYCL);
         addItemBuyButton(get_armors().RBBRCLT);
         addItemBuyButton(get_armors().ADVCLTH);
         addItemBuyButton(get_armors().TUBETOP);
         addItemBuyButton(get_armors().OVERALL);
         addItemBuyButton(get_armors().B_DRESS);
         addItemBuyButton(get_armors().T_BSUIT);
         addItemBuyButton(get_armors().M_ROBES);
         addItemBuyButton(get_armors().LTHRPNT);
         addItemBuyButton(get_armors().BIMBOSK);
         addItemBuyButton(get_armors().KIMONO);
         addButton(14,"返回",inside);
      }
   }
}

