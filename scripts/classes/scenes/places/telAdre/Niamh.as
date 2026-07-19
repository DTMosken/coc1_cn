package classes.scenes.places.telAdre
{
   import classes.CoC;
   import classes.DynStat;
   import classes.ImageManager;
   import classes.PerkLib;
   import classes.Player;
   import classes.StatusEffects;
   import classes.Time;
   import classes.TimeAwareInterface;
   import classes._FlagDict.FlagDict_Impl_;
   import classes.display.SpriteDb;
   import classes.globalFlags.KFLAGS;
   import classes.internals.Utils;
   import classes.items.ConsumableLib;
   import classes.scenes.Camp;
   import classes.scenes.Inventory;
   import classes.scenes.places.TelAdre;
   import flash.Boot;
   import haxe.IMap;
   
   public class Niamh extends TelAdreAbstractContent implements TimeAwareInterface
   {
      
      public function Niamh()
      {
         if(Boot.skip_constructor)
         {
            return;
         }
         super();
         CoC.timeAwareClassAdd(this);
      }
      
      public function yeahSeanLetsBimbooze() : void
      {
         clearOutput();
         outputText("[say:完美！]他说着，走上前去收集烧瓶。[say:你现在可以走了。这是一个精细的过程，任何错误都可能导致大胸无脑的动物泛滥。]他停顿了一下，打量着你的表情。[say:……这<b>可不是</b>什么好事，]他补充道。几乎像是事后才想起来似的，他向桌子伸出手，说道：[say:如果你愿意的话，我现在就想要报酬。]你为这个恶魔分出适当数量的宝石。他一把抓起宝石，漫不经心地扔到身后，你听到“当啷”一声脆响，宝石撞到了什么东西，滚了一会儿。");
         outputText("[pg][say:现在走吧，我必须工作了！]他责骂道，把你赶出洞穴。[say:明天再来！]你心满意足地离开了他的商店。");
         doNext(playerMenu);
         var _loc1_:Player = get_player();
         _loc1_.set_gems(_loc1_.get_gems() - 500);
         get_player().consumeItem(get_consumables().BIMBOCH);
         get_player().consumeItem(get_consumables().BIMBOCH);
         get_player().consumeItem(get_consumables().BIMBOCH);
         get_player().consumeItem(get_consumables().BIMBOCH);
         get_player().consumeItem(get_consumables().BIMBOCH);
         statScreenRefresh();
         FlagDict_Impl_.arrayWriteInt(KFLAGS.flags,451,25);
      }
      
      public function timeChangeLarge() : Boolean
      {
         return false;
      }
      
      public function timeChange() : Boolean
      {
         var _loc2_:int = 0;
         var _loc1_:Boolean = false;
         if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,451) > 1)
         {
            _loc2_ = 451;
            FlagDict_Impl_.arrayWriteInt(KFLAGS.flags,_loc2_,FlagDict_Impl_.arrayReadInt(KFLAGS.flags,_loc2_) - 1);
         }
         if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,449) > 1)
         {
            _loc2_ = 449;
            FlagDict_Impl_.arrayWriteInt(KFLAGS.flags,_loc2_,FlagDict_Impl_.arrayReadInt(KFLAGS.flags,_loc2_) - 1);
         }
         if(get_player().hasStatusEffect(StatusEffects.BimboChampagne))
         {
            get_player().addStatusValue(StatusEffects.BimboChampagne,1,-1);
            if(get_player().statusEffectv1(StatusEffects.BimboChampagne) <= 0)
            {
               get_consumables().BIMBOCH.removeBimboChampagne();
               _loc1_ = true;
            }
         }
         if(get_player().statusEffectv1(StatusEffects.BlackCatBeer) > 0)
         {
            get_player().addStatusValue(StatusEffects.BlackCatBeer,1,-1);
            if(get_player().statusEffectv1(StatusEffects.BlackCatBeer) <= 0)
            {
               get_consumables().BC_BEER.blackCatBeerExpires();
               _loc1_ = true;
            }
         }
         return _loc1_;
      }
      
      public function telAdreNiamh() : void
      {
         if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,446) == 0)
         {
            outputText("[pg]在酒吧后面的一张桌子旁，坐着特尔阿德雷众多奇特景象之一：一个白发黑肤的女人，长着抽动的猫耳和尾巴。这个长相奇特、大部分是人类的女孩穿着一条紧身的白色紧身裤和一顶相配的大礼帽。一件未扣扣子的叶绿色马甲松松垮垮地挂在她纤细的臀部，你很快就看出了没有扣上的原因：她的");
            if(get_game().time.hours <= 8)
            {
               outputText("巨大的N罩杯乳房，溢出了桌子");
            }
            else if(get_game().time.hours <= 9)
            {
               outputText("巨大的M罩杯乳房，占据了桌子的大部分");
            }
            else if(get_game().time.hours <= 10)
            {
               outputText("巨大的L罩杯乳房，向前延伸到桌子上");
            }
            else if(get_game().time.hours <= 11)
            {
               outputText("沉重的K罩杯乳房，放在桌子上支撑着");
            }
            else if(get_game().time.hours <= 12)
            {
               outputText("沉甸甸的J罩杯乳房，舒适地放在桌子上");
            }
            else if(get_game().time.hours <= 13)
            {
               outputText("沉重的I罩杯乳房，垂下来放在桌子上");
            }
            else if(get_game().time.hours <= 14)
            {
               outputText("柔软的H罩杯乳房，沉重地压在她的胸前");
            }
            else
            {
               outputText("勉强能掌控的G罩杯，随着她的每一次呼吸而颤抖");
            }
            outputText("。光滑、触感极佳的肌肤覆盖着她的胸部、脸庞、双手，想必她身体的其他部位也是如此；看来她身上的动物特征仅仅止步于猫耳和尾巴。她深吸了一口饮料，随后打了一个可爱的小嗝。");
         }
         else
         {
            outputText("[pg]妮芙坐在酒吧后面她常坐的位置上，");
            if(get_game().time.hours <= 8)
            {
               outputText("她那巨大的N罩杯“酒桶”靠在面前那张谢天谢地还算结实的桌子上。她的乳头因为被诅咒而装满了啤酒，只要她一动，啤酒就会滴落下来。");
            }
            else if(get_game().time.hours <= 14)
            {
               outputText("她的");
               if(get_game().time.hours <= 9)
               {
                  outputText("M罩杯");
               }
               else if(get_game().time.hours <= 10)
               {
                  outputText("L罩杯");
               }
               else if(get_game().time.hours <= 11)
               {
                  outputText("K罩杯");
               }
               else if(get_game().time.hours <= 12)
               {
                  outputText("J罩杯");
               }
               else if(get_game().time.hours <= 13)
               {
                  outputText("I罩杯");
               }
               else
               {
                  outputText("H罩杯");
               }
               outputText("装满啤酒的乳房显然随着时间的推移变小了，尽管它们仍然大得令人不适，而且肿胀不堪。");
            }
            else
            {
               outputText("她那装满啤酒的G罩杯乳房比早上的体积小得多，尽管仍然令人印象深刻。你可以通过沿着木制表面流淌的啤酒污渍，从桌子边缘一直延伸到她乳房现在所在的位置，来追踪她一整天的进度。");
            }
         }
      }
      
      public function talkToNiamh() : void
      {
         var _loc1_:* = null as IMap;
         clearOutput();
         if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,448) == 0)
         {
            outputText("你让猫娘告诉你她的过去。");
            outputText("[pg][say: 我叫妮芙——就像猫叫声一样，对吧？喵-姆？——那就是我。我以前是个普通的姑娘……然后我跌跌撞撞地穿过传送门来到了这个该死的世界。犯了个错误，捡了些长胡须的水果尝了尝……结果长出了这些该死的猫零件！所以我像躲避瘟疫一样避开了那个湖一段时间……最后来到了沙漠。不知道那是怎么发生的。现在，我完全迷路了，口渴得要命——但就在这时，我听到了歌声。我拼命地冲过一个沙丘，结果发现了什么？一个女人坐在沙滩上，四个大奶子露在外面，正在大口喝着一杯啤酒——每当她喝空了，她就会从乳头里再挤出一些来。]");
            outputText("[pg]她耸了耸肩，这让她的乳沟产生了令人印象深刻的波动，然后她注意到了你向下的目光，用笑声嘲弄你，这只会让她的巨乳晃动得更厉害。[say: 是的，就像我现在这样。所以，不管怎样，我求她和我分享一杯酒，她好心地同意了。我太渴了，而且那啤酒太好喝了，以至于，嗯，我在那里喝了很长一段时间……]");
            outputText("[pg]她声音渐渐变小，然后悲伤地摇了摇头，[saystart]我真的不知道接下来发生了什么；我想我们一定是喝得太醉了，以至于我求她对我施同样的法术。我只知道，我醒来时头痛欲裂，怪物般的奶子胀满了啤酒——而那个沙漠女巫不见了。我不知怎么地设法拖着自己走了足够长的时间，找到了……这座城市。那只友善的狐狸");
            if(get_game().time.hours < 15)
            {
               outputText("通常坐在那边");
            }
            outputText("帮我进来，然后让我在这里安顿下来，这样我就可以……减轻我的负担。那重量基本上全是酒；我一直都在挤，但我就是会不断产出这玩意儿……我不知道有什么办法能停下来。[sayend]她摇摇头，叹了口气。[say:讽刺的是，自从我来到这里，它就一直让我有瓦遮头。大家都很乐意花钱买妮芙的黑猫啤酒。那么，你想要来点吗，还是你已经完事了？]她问道。");
            _loc1_ = KFLAGS.flags;
            FlagDict_Impl_.arrayWriteInt(_loc1_,446,FlagDict_Impl_.arrayReadInt(_loc1_,446) + 1);
            _loc1_ = KFLAGS.flags;
            FlagDict_Impl_.arrayWriteInt(_loc1_,448,FlagDict_Impl_.arrayReadInt(_loc1_,448) + 1);
         }
         else
         {
            if(get_player().isTaur())
            {
               outputText("你哒哒地走上前，尴尬地站着");
            }
            else
            {
               outputText("你拉过一把椅子，坐");
            }
            if(Utils.rand(2) == 0)
            {
               outputText("在妮芙旁边，她疲惫地笑了笑作为回应。你们开始交谈——起初是毫无意义的闲聊，但渐渐地转向了……更私密的话题。最后，你忍不住问她被“挤奶”时是什么感觉。她的脸颊变暗，把目光从你身上移开，尴尬地摇了摇头。[say:这……这没什么，]她苦笑着，然后无奈地叹了口气。[say:好吧，你可能一眼就能看穿……感觉棒极了，]她承认道。[say:比它应该有的感觉好得多，不管发生多少次。那该死的女巫的咒语很可能跟这种敏感度有关。有些顾客点尽可能多的酒，只是为了看我扭动。有几个甚至让我……嗯，你懂的，]她无力地总结道，羞愧地移开视线。过了好一会儿，她才再次开口。[say:……感觉确实很好，]她又说了一遍，转过身来，眼中闪烁着调皮的光芒。[say:我打赌现在来点黑猫啤酒对你来说听起来很不错吧？]");
            }
            else
            {
               outputText("在妮芙旁边，她疲惫地笑了笑作为回应。你们开始交谈——起初是毫无意义的闲聊，但渐渐地转向了……更私密的话题。你忍不住问她那沉甸甸的胸部有多重。令你惊讶的是，她竟然轻笑起来。[say:当然，这取决于销售情况，但通常情况下，早上它们可是相当有分量的，]她回答道，用手抚过一只晃荡的乳房，似乎是为了强调她的观点。[say:到了快结束营业的时候，它们还不算太糟，但在夜里……这么说吧，我已经习惯侧着睡了，]她承认道，你脑海中浮现出画面。一想到妮芙慢慢被她不断变大的啤酒奶子闷死的画面，你几乎要流口水了。女孩注意到了你的分心，狡黠地说：[say:说到这个，你想尝尝黑猫啤酒吗？]");
            }
         }
         menu();
         if(get_player().get_gems() >= 2)
         {
            addButton(0,"啤酒",getANiamhBeer);
         }
         else
         {
            addButtonDisabled(0,"啤酒","你买不起这个！");
         }
         addButton(14,"离开",get_telAdre().barTelAdre);
      }
      
      public function taintNiamh(param1:Boolean = false) : void
      {
         clearOutput();
         outputText("你抓起妮芙的杯子，又拿了一个，然后转身离开，在霸占一张空桌子之前，确保转过了一个拐角。你把杯子重重地放在面前，看着她走远，嘴里嘟囔着。");
         if(!param1)
         {
            get_player().consumeItem(get_consumables().SUCMILK);
            outputText("[pg]你拔开魅魔乳液的瓶塞，往每个杯子里倒了一半，你很喜欢这种浓稠乳液流动的样子。你端起装满乳液的杯子，朝妮芙走去。当她注意到你走近时，她的表情亮了起来，当她看到你手中的两杯牛奶时，她咯咯地笑了起来。[say:你是在取笑我吗？]她娇羞地说，轻轻拍了拍她那装满啤酒的乳房之一。[say:啊，好吧，我已经很久没喝过一杯好牛奶了……这是牛奶，对吧？]");
            outputText("[pg]妮芙伸手去拿杯子，但你把杯子从她探寻的手中抽走，转而将其塞进她那深邃的乳沟里。当她随后因为充满液体的胸部之间冰冷的玻璃杯而颤抖时，你的脸上掠过一丝狡黠的笑容。[say:为——为什么你……]她喘息着，迅速抓起饮料，摩擦着起鸡皮疙瘩的肌肤，试图恢复温暖。[say:你这个无赖……]");
            outputText("[pg]你举起杯子敬酒作为回应，她勉强答应了。你们的杯子碰在一起，她毫不犹豫地喝下了浓稠的牛奶。你把自己的饮料举到唇边，假装抿了一口，不想和即将发生的事情有任何牵连。[say:喝下去很顺滑，]她舔了舔嘴唇评论道。[say:说起来……介意我也喝一口你的吗？]你爽快地把酒壶递给她，惊叹于她喝得有多快。妮芙打了个快乐的小嗝，你期待地往后退了一点。");
         }
         else
         {
            get_player().consumeItem(get_consumables().BIMBOLQ);
            outputText("[pg]你打开傻妞液的瓶盖，那股甜腻的香料味让你退缩，这味道让你脑海中浮现出一个淫荡的女奴微微张开的阴唇。你皱着眉头，将这强效的液体均匀地倒入杯中。你端起杯子，站起身朝妮芙走去。");
            outputText("[pg]当她注意到你走近时，她的表情亮了起来，当她看到那四分之一满的酒杯时，她咯咯地笑了起来。[say:什么，就这？]她好奇地打趣道。[say:这东西最好有点劲儿，" + get_player().mf("小伙子","小姑娘") + "。]你向她保证，这绝对会让她大吃一惊。");
            outputText("[pg]妮芙伸手去拿杯子，但你把杯子从她探寻的手中抽走，转而将其塞进她那深邃的乳沟里。当她随后因为充满液体的胸部之间冰冷的玻璃杯而颤抖时，你的脸上掠过一丝狡黠的笑容。[say:为——为什么你……]她喘息着，迅速抓起饮料，摩擦着起鸡皮疙瘩的肌肤，试图恢复温暖。[say:你这个无赖……]");
            outputText("[pg]你举起杯子敬酒作为回应，她勉强答应了。你们的杯子碰在一起，她毫不犹豫地喝下了浑浊的酒。你把自己的饮料举到唇边，假装抿了一口，不想和即将发生的事情有任何牵连。[say:烧得挺爽，]她舔了舔嘴唇评论道。[say:说起来……介意我也喝一口你的吗？]你爽快地把酒壶递给她，惊叹于她喝得有多快。妮芙打了个快乐的小嗝，你期待地往后退了一点。");
         }
         if(!param1)
         {
            outputText("[pg]过了一会儿，她嘴里发出一声小小的呻吟，她纤细的手飞快地伸到桌子底下，按住她突然咕噜作响的肚子。她惊恐地抬头看着你，而你只是耸了耸肩作为回应。越来越惊慌的猫娘试图站起来，却撞翻了桌子，扫开了空酒壶。伴随着一声惊呼，她失去了平衡，跌坐在她那柔软的屁股上，她那巨大的酒桶般的乳房无力地垂在腿上。她试图说话，但随着一阵颤栗传遍全身，她只能发出呻吟。她的手是第一个受到影响的。她乌黑的皮肤慢慢变成了蓝色，当两个小肉包从她白色的波波头中探出时，她发出了咕哝声；她尾巴上的毛发褪去，取而代之的是闪闪发光的蓝色皮肤。尾巴的尖端也颤抖着发生了变化，从圆形变成了黑桃形。");
            outputText("[pg]妮芙的性欲飙升，她突然在狂喜中大叫起来，开始狂热地揉捏自己的乳房。你可以看出，她正从这种近乎触电般的敏感刺激中获得快感。你既感到兴奋又觉得好笑，在想要观看的欲望和在守卫队发现你出现在“恶魔化”现场之前赶紧溜走的需要之间挣扎。当这个新变成蓝色的女孩把一个乳头送到嘴边吸吮，另一只手伸向她那湿透了的、饥渴的下体时，你决定谨慎行事，从这场奇观中抽身，并确保在后退时装出惊恐的样子。奇怪的是，当妮芙喝下她自己的“乳汁”时，从她唇边滴落的金色液体的颜色变深了。从啤酒变成了麦芽酒，你暗想。当你走出酒馆的门时，四名城镇守卫溜进了你的位置；你确保让他们看到你那困惑、恐惧的表演。");
            outputText("[pg]当他们把她推出去时，一群旁观者跟在后面，让你得以混入人群中观看整个过程。可怜的妮芙被毫不客气地扔出了城市，她那被腐化的胸部将麦芽酒喷洒在炎热的沙漠上。这个新诞生的恶魔眷属在愤怒和欲望的交织中扭动着，在呻吟声中夹杂着脏话和威胁，甚至懒得从她脸朝下的姿势中挪动一下。在城门关闭之前，你最后看了她一眼，她被完全关在了这座沙漠城市之外。你在城市周围逗留，直到你觉得她已经离开了城门，然后才自己离开。");
            FlagDict_Impl_.arrayWriteInt(KFLAGS.flags,450,1);
            dynStats(DynStat.Cor(5));
         }
         else
         {
            outputText("[pg]片刻之后，你开始怀疑瓶子上的标签是不是太夸张了……直到她又打了个嗝，紧接着发出一阵令人惊讶的欢快笑声。妮芙停了下来，用力摇了摇头，似乎想清除脑子里的蜘蛛网。[say:我刚才为什么要那么做？]她嘟囔着。[say:你在里面放了什——哦哦哦……]她举起双臂，把乳房挤在一起，随着突如其来的性欲席卷全身，她痛苦地皱起眉头，然后再次呻吟，手指深深地陷入她那充满液体的乳沟中。妮芙的眼睛睁得大大的，因为里面的啤酒在翻滚，然后她高兴地叫了起来，因为她的肉体在颤抖，就好像里面的东西开始……冒泡了？确实，她那丰满的胸部欢快地跳动着，因为里面的东西在与皮肤抗争。困惑的猫娘随着这阴险的酒液发挥作用，又开始咯咯地笑了起来，用越来越充满激情的动作抚摸着她那被诅咒的胸部。当她的头发开始变长，她的波波头长成齐腰长的象牙色乱发时，她确实暂时停了下来。");
            outputText("[pg]还没等她从惊讶中恢复过来，她那粉白色的发型就变暗了，从头皮开始出现了白金色的条纹。她那肿胀的嘴唇发出一声轻喘，眼睑微微下垂，仿佛被她崩溃的心智压得喘不过气来。没过多久，座位下传来的隆隆声吸引了她越来越短暂的注意力，她推开头发和乳房，想看个清楚。在你们两人的注视下，她臀部的肉颤抖着，然后膨胀起来，吞没了狭窄的扶手。伴随着一声惊呼，她踉跄着站了起来，然后被她那仍在翻滚的乳房绊倒了。她沉重的胸部与桌子摩擦，连同她一起把桌子撞翻了。妮芙迅速增加的体重——加上紧紧粘在她屁股上的椅子——压在咕噜作响的球体上，释放出一股震动地面的——在猫娘的情况下，也是湿润胯部的——起泡酒……香槟，你意识到。看起来很美味的香槟。");
            outputText("[pg]只有看到她那仍在膨胀的屁股、撕裂的裤子和完全无视粘在身上的椅子而摇摆的臀部，才阻止了你去品尝那东西。你觉得，还是让变成无脑花瓶的狗躺着吧。紧绷的扶手终于在压力下断裂，几块木头碎片嵌入了她部分裸露的屁股里。[say:天哪！]她惊呼道，试图转过身去够那些刺痛的碎片，[say:我……又大……又晃的……屁股……怎么会这样……]她的声音越来越小，当她注视着自己全新升级的臀部时，一阵情欲的红晕飞过她的脸颊。她无视自己仍在“泌乳”的乳头，将一只手深深地按进她那超宽的屁股里，当手陷入那肥美的蜜桃臀时，她发出了咕咕的叫声。她仍然施加着相当大的快感，将手滑向她变粗的大腿——导致臀瓣向上翻转并四处抖动。");
            outputText("[pg]迷恋的猫娘的注意力不可避免地转移到了她无人看管的私处，她立刻开始摩擦她那仍然穿着衣服的腹股沟。[say:菲……菲……天哪，这感觉太好了！]越来越傻的妮芙呻吟着。猫娘的叫声加快了，你可以很容易地猜到这意味着什么。你强忍着给她一些“帮助”的冲动，决定还是溜走，不愿意在守卫队不可避免地做出反应时留在附近。当你溜出门时，四名守卫溜了进来；你确保让他们看到你那困惑、震惊的表情。酒吧里传出骚动和家具翻倒的声音，几分钟后，挣扎着的妮芙被四个人中的三个抬了出来。");
            outputText("[pg]一群旁观者跟在后面，让你得以混入人群中观看整个过程。一个非常困惑的妮芙被坚定但出人意料地温柔地安置在城市边界之外。一名守卫向她解释说，在那种表现以及强加给那个成为她……母爱……对象的可怜守卫的变形效果之后……她和她的胸部酿造物不能被允许进入特尔阿德雷。她点了点头，脸上奇怪地没有任何表情……除了可能是性欲。当城门关闭时，你听到她喊道，[say:嘿，我现在可以自慰了吗，求求你了？]然后，伴随着砰的一声，她消失了。你在城市周围逗留，直到你觉得她已经离开了城门，然后才自己离开。");
            FlagDict_Impl_.arrayWriteInt(KFLAGS.flags,450,2);
         }
         FlagDict_Impl_.arrayWriteInt(KFLAGS.flags,449,25);
         dynStats(DynStat.Cor(10));
         doNext(get_camp().returnToCampUseOneHour);
      }
      
      public function sellYourBooze() : void
      {
         clearOutput();
         var _loc1_:Player = get_player();
         _loc1_.set_gems(_loc1_.get_gems() + 2);
         var _loc2_:int = int(Math.round(get_player().lactationQ() / 100));
         if(_loc2_ > 40)
         {
            _loc2_ = 40 + Utils.rand(3);
         }
         var _loc3_:Player = get_player();
         _loc3_.set_gems(_loc3_.get_gems() + _loc2_);
         get_player().set_gems(int(Math.round(get_player().get_gems())));
         statScreenRefresh();
         if(get_player().bRows() == 1)
         {
            outputText("妮芙发出一声清脆的咯咯笑，把你拉近吧台。她用双手帮你把乳房托起来，放在吧台上。");
         }
         else
         {
            outputText("当你试图把乳房移近吧台让顾客挤奶时，妮芙咯咯地笑了起来，但很明显，只有你最上面的一对乳房能轻松地放在吧台上。[say:小姑娘，这可能有点不合常规，但在这种情况下，你最好还是躺在吧台上。]");
         }
         outputText("[pg]没过多久，顾客们就开始排队购买你这种特殊品牌的酒了。他们拉扯着你的乳头，从你的乳头上挤出饮料。然而，每一次醉醺醺的拉扯都会刺激你的性欲，让你更加兴奋。");
         if(get_player().hasVagina())
         {
            outputText("随着你的小穴变得湿润，你感觉到你的兴奋顺着大腿内侧滴落。");
         }
         dynStats(DynStat.Lust(10 + get_player().sens / 5),DynStat.NoScale);
         if(get_player().hasCock())
         {
            outputText("当酒吧顾客的手" + (get_noFur() ? "" : "和爪子") + "挤压你的乳头时，你开始在[eachCock]中感受到共鸣。随着他们的手指滑过你敏感的乳头，你很容易就能想象到他们在你的肉棒上滑上滑下");
         }
         if(get_player().cockTotal() > 1)
         {
            outputText("");
         }
         outputText("。");
         if(get_player().get_lust100() < 50 || get_player().get_gender() == 0)
         {
            get_player().growTits(2,get_player().bRows(),false,2);
            outputText("[pg]你因为这种感觉而面红耳赤，但最终你还是被榨干了。你的乳房已经缩小了，但感觉还是比之前大了一点。当你的乳头不再滴酒，而是滴下小奶滴时，妮芙把你在销售中赚到的宝石分给了你。");
            doNext(get_camp().returnToCampUseOneHour);
         }
         else
         {
            outputText("[pg]你不确定在无法忽视你狂暴的荷尔蒙之前，你还能坚持多久。");
            outputText("[pg]妮芙注意到了你的状况，酒吧里的其他几个顾客也注意到了。");
            if(get_player().hasVagina())
            {
               outputText("你能感觉到你的阴唇因为渴望而滴水。");
            }
            if(get_player().hasCock())
            {
               outputText("先列腺液顺着你的[cocks]滴落，想要操小穴的渴望越来越强烈。几只游荡的手表明，酒吧里的人似乎对看到你的生殖器像你的乳头一样活跃很感兴趣。");
            }
            menu();
            addButton(0,"酒吧群交",barBeerOrgyTits);
            addButton(14,"离开",leaveWithBeerTits);
         }
      }
      
      public function seanBimboBrewing() : void
      {
         clearOutput();
         outputText("当你拿出一大堆装满的烧瓶，把它们扔到他那几乎空无一物的桌子上时，这位一反常态、举止绅士的男魅魔挑了挑眉毛。[say:我猜你想让我用这些做点特别的东西，]他有些干巴巴地打趣道。");
         outputText("[pg]你得意地笑了笑，向他解释了容器里装的东西的性质，以及你来访的目的。");
         outputText("[pg]他拿起其中一个烧瓶，拧开盖子，身子前倾，把饮料飘向他的鼻孔。[say:没有真品那么烈，]他确认道，重新盖上盖子，把它放在其他烧瓶旁边。[say:我能做，]他决定道，[say:但这需要花费大量的时间和精力。五百颗宝石，我明天就能做好。]");
         menu();
         if(get_player().get_gems() < 500)
         {
            outputText("[pg][b:你太穷了，没法让肖恩给你做傻妞利口酒。]");
            addButtonDisabled(0,"好的","你买不起这个！");
         }
         else
         {
            addButton(0,"好的",yeahSeanLetsBimbooze);
         }
         addButton(14,"返回",get_game().dungeons.deepcave.incubusShop);
      }
      
      public function niamhSprite() : void
      {
         spriteSelect(get_time().hours > 14 ? SpriteDb.get_s_niamh() : SpriteDb.get_s_niamhFull());
      }
      
      public function niamhPostTelAdreMoveOut() : void
      {
         FlagDict_Impl_.arrayWriteInt(KFLAGS.flags,449,-1);
         clearOutput();
         outputText("在一次例行搜索中，你停下了脚步，因为一阵半连贯的混乱歌声从草地上滚滚而来。你朝着那嘈杂的声音走去，相当确信你会发现什么。确实，跌跌撞撞向你走来的是一个");
         if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,450) == 1)
         {
            outputText("看起来像恶魔的");
         }
         else
         {
            outputText("沙漏形的");
         }
         outputText("妮芙，很明显她已经完全喝醉了。");
         if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,450) == 1)
         {
            outputText("[say: 嘿，" + get_player().mf("小伙子","大姑娘") + "，想不想……来点……好时光？]");
         }
         else
         {
            outputText("[say: 嘿——，亲爱的！我没想到还能再见到你！]");
         }
         outputText("她含糊不清地说着，在受损的运动神经和绝对过载的胸部之间挣扎着保持直立。[say: 我一直在喝我的“存货”，]她注意到你的目光，解释道。[say: 不能浪费了！]你点头同意，偷偷瞥了一眼她身后，观察她留下的两道");
         if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,450) == 1)
         {
            outputText("深色");
         }
         else
         {
            outputText("浅色");
         }
         outputText("液体的痕迹。");
         outputText("[pg][say: 顺便问一下，你叫什么名字？]她突然问道，稍微清醒了一点。你觉得正式介绍一下自己也没什么坏处。[say: [name]，嗯？好奇怪的名字，]她评论道。");
         outputText("[pg][say: 不管怎样，想来一口吗？]她问道，你的干预和她的醉意显然让她卸下了防备。这是一个合理的问题，但也让你有些犹豫——你想喝这只堕落猫娘的新酿造吗？");
         menu();
         addButton(0,"是的",niamhCorruptedMobileSnackDrinkTime);
         addButton(14,"离开",niamhCorruptMobileSnackTurnDown);
      }
      
      public function niamhCorruptedMobileSnackDrinkTime() : void
      {
         clearOutput();
         outputText("当然要喝！你费了那么大劲才让她的胸部变成现在的样子；直接从源头畅饮正是你想要的。妮芙的脸上绽放出笑容，她重重地一屁股坐在地上，挥手示意你坐在她旁边。");
         if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,450) == 2)
         {
            outputText("她尽力晃动着她那装满香槟的巨大乳房。[say: 来吧，来喝吧！]她招呼道。[say: 全是泡泡，痒痒的，很好喝哦。]她咯咯地笑着，打了个大大的嗝，然后端庄地用手指捂住嘴。[say: 抱歉，我的肚子里也全是泡泡。]她又咯咯地笑了起来；看来那傻妞利口酒真的让她的智商降档了。不过，管他呢，这没关系；她唯一重要的就是她那对漂亮的大胸部里装的东西，而不是她的大脑。你自信地大步走到她身边坐下，调整好姿势，以便最容易地接触到她的乳房。");
            outputText("[pg]她给了你一个空洞的微笑，开始发出呼噜声，尾巴在期待中慵懒地来回摆动。你伸出手，抓住一只沉甸甸的乳房，让她发出喉音般的呻吟；苍白起泡的酒液立刻开始从中渗出，你毫不犹豫地将乳头含入唇间。嗯……这味道就像你以前从未尝过的一样；甜美、浓郁……实际上有点黏糊糊的。它在你的嘴里疯狂地起泡嘶嘶作响，吞咽时痒痒的，让你忍不住发出愉悦的轻笑。");
            outputText("[pg][say: 很好喝，对吧？]妮芙发出呼噜声。[say: 喝吧，我这里还有很多呢！]她咯咯地笑着，试图把乳房向前推；因为太大了，她没法像她希望的那样环抱住你，强迫你喝。");
            outputText("[pg]尽管如此，拒绝如此美味的饮料可不是一个真正的鉴赏家会做的事；你急切地用鼻子蹭着她肿胀的乳房。事后看来，有点太用力了；压力让里面大量的香槟喷涌进你的嘴里，让你充满了甜美的浓郁，迫使你大口吞咽以避免窒息。不过，一旦你掌握了节奏，就容易多了；你几乎不需要吸吮，只需不断挤压，让一股又一股美妙的液体顺着你干渴的喉咙流下。");
            outputText("[pg]……这东西，简直，太好喝了！呃？你刚才真的这么想了吗？仔细想想，现在越来越难思考了，比如，关于任何事情……但这真的很糟糕吗？除了这甜美、甜美的酒，你还需要想什么呢？");
            get_consumables().BIMBOCH.applyEffect(get_player(),false,false);
            outputText("[pg]你开心地咯咯笑着，围着你充满爱意的醉人乳房，开始用胯部摩擦地面，用你那弹力十足的大胸部摩擦妮芙的；感觉真是太好了！妮芙喵喵叫着，发出呼噜声，偶尔还打个嗝；她，好像，真的很喜欢你吸吮她……这很好，因为你也喜欢吸吮她。你把一只手伸到她的双腿之间……哦，她，好像，没穿内裤……真是个调皮、调皮的猫娘！你对着她的乳房咧嘴一笑，一边继续吸吮，一边开始玩弄她的小豆豆和她湿润、黏糊糊的私处。");
            outputText("[pg]妮芙嚎叫着颤抖起来，她的小穴紧紧夹住你的手指，然后，突然之间，她收紧了身体，释放了。淫液滴落在你的手上，弄得你黏糊糊的，她的大乳房突然开始喷射……呃，那叫什么来着，香槟？从她那巨大的乳头里喷出来。另一只乳房开始喷洒在草地上，这真是浪费了上好的起泡酒，但你得到了比你应得的更多，因为她的另一只乳房正涌入你的嘴里，你尽可能快地吞咽、大口喝、发出啧啧声。但是，最后，你实在跟不上了，你，好像，不得不松开。不得不。");
            outputText("[pg]终于，妮芙的乳头高潮结束了，她向后倒在她那摇晃的大屁股上。[say: 感觉比我自己把大奶子塞进嘴里爽多了……嘿，[name]……你，还好吗？]她问道。她半爬着来到你身边，然后咯咯地笑了起来。[say: 你现在，好像长了个大肚子，[name]！你挺着这个大肚子看起来太好笑了。]");
            outputText("[pg]你也咯咯地笑了起来，被你那鼓胀的肚子的重量压在下面，你可以看到它在你上方摇晃。你轻轻推了它一下，看着它像个大果冻一样晃动，这让你笑了起来，然后打了一个大大的嗝，把你肚子里所有让你发痒的泡泡都排了出来。妮芙见状大笑，然后打了个比你还响的嗝。");
            outputText("[pg]伴随着一阵咯咯的笑声、一些用力挣扎和几句咒骂，你们俩终于互相搀扶着摇摇晃晃地站了起来。你的脑子里充满了粉红色柔软蓬松的云彩，但你还是想起来问这个猫娘为什么会在这里，以及她打算去哪里。");
            outputText("[pg][say: 我好像记得沙漠里那些刻薄的守卫说过，平原上有一个营地什么的，里面全是把享乐放在第一位的人。我打算，去找到它，然后在那儿安顿下来，]妮芙告诉你。她抱住你，把你挤进她的双乳之间，让香槟喷洒在满是灰尘的草地上。[say: 如果你以后去了那里，记得来找我，好吗？]她对你说，然后开始愉快地迈着懒散的步伐上路了，一边走一边唱着欢快的歌。");
            outputText("[pg]你轻轻地打着嗝，向她挥手告别，然后回到了营地。你漫不经心地想，要花多长时间才能减掉这个啤酒肚。");
         }
         else
         {
            outputText("[pg]在她的召唤下，你拉近了自己和她那漏奶的巨乳之间的距离，跪在她面前，温柔地、近乎虔诚地握住其中一个长长的乳头。你慢慢地把它举到唇边，用舌头长长地、挑逗地舔舐着滴落的麦酒。从她满足的呻吟和周期性的颤抖中，你可以看出妮芙很享受这种待遇。又舔了几下后，你张大嘴巴，开始吸吮那个超大的乳头。");
            outputText("[pg]还没等你反应过来，这个蔚蓝色的猫娘就发出狂野而愉悦的尖叫，向前扑去，把你撞倒在地，胸部先着地压在你身上。她那巨大的胸部的重量压迫着你，迫使一大股黑啤酒灌进你的喉咙。你短暂地挣扎了一下，试图把妮芙推到一边，逃离这个湿透的棉花糖地狱。奇怪的是，你的身体几乎对你的精神呼唤没有反应，四肢无力地抽搐着。不知不觉中，你发现你的思维过程开始关闭。即使是最基本的计算和思考，对你来说也像第三孕期的地精在齐胸深的沼泽泥潭中跋涉一样缓慢。你眨了眨眼。又眨了眨眼。第三次，你的眼睛拒绝睁开；在你目前的状态下，你无法对抗这种嗜睡感，你昏睡了过去。");
            outputText("[pg]一阵冷风轻轻吹过，抚摸着你的脸颊。你刻意地醒来并坐起身，伸展着仍然沉重的四肢，驱散睡意。有那么一瞬间，你几乎要惊慌失措，但你很快就恢复了理智。你当然知道自己在哪里；你多年来一直以此为目标，现在你终于快要实现你的目标了。");
            outputText("[pg]你花了一点时间来确定自己的方位。你现在离得很近了，实际上——只需爬一小段路就能到达山顶。几天来，你一直在为此辛勤劳作，攀登玛瑞斯最宏伟、最壮观的山峰。当你完全清醒过来时，你深吸了一口气，沐浴在山腰清脆寒冷的空气中。在悬垂处已经磨蹭得够久了；夜晚已经结束，是时候攀登了。");
            outputText("[pg]收拾好装备，你出发了，沿着狭窄蜿蜒的小路小心翼翼地前行。在冒险精神的鼓舞下，你一边走一边唱着旅行小曲，以非常可观的速度向山顶进发。然而，最终，仿佛上天察觉到了你的抱负，风变大了。尽管阵风越来越猛烈，你除了继续艰难前行之外别无他法。不止一次，你被迫完全停下来，被大自然的狂怒逼得寸步难行。");
            outputText("[pg]尽管如此，你还是坚持不懈，决心今天一定要到达山顶，管它什么鬼天气！你现在几乎能看到了——覆盖在山顶的雄伟乳头的乳晕已经进入视线。可悲的是，你的决心只维持了和你立足点一样长的时间。一个放错位置的脚步让你失去了平衡，足以让你从陡峭的悬崖小路上摔下去。你在坠落……坠落……");
            outputText("[pg]坠落？");
            outputText("[pg]你猛地惊醒，迅速翻身站起，试图甩掉脑海中挥之不去的迷糊。你很快发现了妮芙，她仍然跪着，带着一丝苦笑看着你。[say: 我想，我喂奶有点太热情了，]她嘟囔着，这大概是你能从她那里得到的最接近道歉的话了。[say: 你昏过去之后，还一直抓着我的奶子不放，所以我只好跳下来了。至少在你睡觉的时候，我给自己找了点事做。]");
            outputText("[pg]环顾四周，看着包围着你们俩的麦酒湖，你不得不表示同意。幸运的是，她的自我娱乐似乎把她通常巨大的乳房缩小到了更容易控制的大小，在你的帮助下，她很快又站了起来。[say: 我听说有一个避难所……嗯，是为像我这样天赋异禀的姑娘们准备的，]她有些干巴巴地说，拍了拍她巨大的蔚蓝色胸部以示强调。[say: 我正要去那里。也许我最终会在那里找到你，对吧？]");
            outputText("[pg]她在你肩膀上轻轻打了一拳，向你抛了个媚眼，然后转身离开。[say: 别以为我忘了我是怎么变成这样的，" + get_player().mf("男孩","女孩") + "，]她转过头大喊，让你在转身离开时停下了脚步。过了好一会儿，她才终于转过身，继续她的旅程。");
            outputText("[pg]就在你走出听力范围之前，妮芙的最后一句话飘进了你的耳朵。你不能确定，但是……她是不是说了……[say: 谢谢？]");
            get_consumables().BC_BEER.applyEffect(get_player(),false,true);
         }
         doNext(get_camp().returnToCampUseOneHour);
      }
      
      public function niamhCorruptMobileSnackTurnDown() : void
      {
         clearOutput();
         outputText("你拒绝了她，编造了一个小故事，说你刚刚喝完一种美味的饮料，实在喝不下任何东西了。她若有所思地点点头，停顿了一下，然后大声打了个嗝。即使在醉酒状态下，她也保留了一些礼貌，所以她一边把手移到嘴边，一边紧张地轻笑。[say: 抱歉……]她嘟囔着，溜走了。你有一种感觉，你会再次见到她。");
         doNext(get_camp().returnToCampUseOneHour);
      }
      
      public function maybeLaterNiamh() : void
      {
         clearOutput();
         outputText("你紧张地轻笑了一声，摇了摇头，说自己对酒精一窍不通。妮芙无奈地叹了口气，向前伸出手，抓住她那长长的乳头之一。她熟练地把酒杯倒满，然后深深地喝了一大口。[say:不能怪我想换换口味，]她嘟囔道。[say:现在，你是想自己来一杯黑猫啤酒，还是打算继续盯着我的奶子看？]");
         menu();
         addButton(0,"交谈",talkToNiamh);
         if(get_player().get_gems() >= 2)
         {
            addButton(1,"买啤酒",getANiamhBeer);
         }
         else
         {
            addButtonDisabled(1,"买啤酒","你太穷了，买不起啤酒。");
         }
         addButton(14,"离开",leaveNiamh);
      }
      
      public function leaveWithBeerTits() : void
      {
         clearOutput();
         outputText("这个提议很诱人，但现在你更想私下处理你那充满酒味的乳房。你试图用你的[armor]遮住你的乳房，但这很困难。你的乳头不断地渗出酒液，一路滴回营地。谢天谢地，当你到达时，效果似乎已经基本消退了。你的乳头又开始滴奶了，虽然它们缩小了一点，但并没有完全缩小，让你拥有了比以前更大的资本。");
         get_player().growTits(2,get_player().bRows(),false,2);
         doNext(get_camp().returnToCampUseOneHour);
      }
      
      public function leaveNiamh() : void
      {
         clearOutput();
         outputText("你决定你其实并不想和这个奇怪的猫娘说话，于是尽可能礼貌地找借口离开了。");
         doNext(get_telAdre().barTelAdre);
      }
      
      public function giveNiamphSuccubiMilk() : void
      {
         taintNiamh(false);
      }
      
      public function giveNiamphBimboLiquer() : void
      {
         taintNiamh(true);
      }
      
      public function getBimboozeFromSean() : void
      {
         clearOutput();
         outputText("你一进来，肖恩就转过身来，看着你时勉强挤出一丝微笑。[say:时间刚刚好，我刚完成这个！]");
         outputText("他从桌面上拿起一个看起来很眼熟的瓶子，递给你。[say:用这个的时候要小心点，]你接过瓶子时他警告道。[say:我向你保证，原版对心智的有害影响已经被复制了。][pg]");
         outputText("你把小瓶放进你的[inv]里。[pg]");
         FlagDict_Impl_.arrayWriteInt(KFLAGS.flags,451,0);
         get_inventory().takeItem(get_consumables().BIMBOLQ,get_game().dungeons.deepcave.incubusShop);
      }
      
      public function getBimboChampFromNiamh() : void
      {
         clearOutput();
         outputText("你解释说你需要一瓶她的香槟；这只傻乎乎的小猫花了几秒钟才反应过来你的话，然后漫不经心地地点了点头。[say: 没问题！]她回答道，伸手到身后，在一个大粗麻布袋里翻找。她从袋子深处拿出一个烧瓶，拧开盖子，试图把它对准一个乳头。尽管她努力尝试，但她就是够不到，伴随着一声轻快的咯咯笑，她把它递给了你。");
         outputText("[pg]你无奈地叹了口气，接过烧瓶，跪了下来，试探性地弹了弹两个乳头。妮芙把手肘压在乳房上，呻吟着，你的刺激和她的按压结合在一起，开始稳定地流出看起来很美味的香槟。仅仅是闻到这东西的味道就让你觉得有点变笨了！");
         outputText("[pg]你把那个有点可怕的想法抛到一边，俯下身，紧紧抓住一个坚挺的乳头，把它塞进容器的口里。无视她越来越大声、越来越频繁的呻吟，你尽职尽责地把起泡酒挤进烧瓶里，塞上塞子，站起身来。妮芙试图跟着你，她被挤奶弄得太兴奋了，无法抗拒她的肉欲，但你轻松地把她推到一边，她那沉甸甸的瓜让她失去了平衡。");
         outputText("[pg]她摔进了一大堆同样是金发、咯咯笑着的女孩中间，她们毫不犹豫地蜂拥而上。你轻笑着摇了摇头。也许你以后还会再来。[pg]");
         get_inventory().takeItem(get_consumables().BIMBOCH,get_camp().returnToCampUseOneHour);
      }
      
      public function getANiamhBeer() : void
      {
         clearOutput();
         get_images().showImage("niamh-get-beer");
         outputText("[say: 两颗宝石，]她回答道。你递上钱，她举起钱对着光仔细检查。满意后，她把东西扔进腰间的一个袋子里。[say: 抱歉，]她嘟囔道。[say: 我确实想把这该死的啤酒从我身体里弄出来，但这仍然是我的主要生计；我可不能被骗。不管怎样，这是你的杯子——你可以再花两颗宝石留着它；我买得很便宜。去吧，把它装满，但记住你在捏什么，好吗？]");
         if(get_player().hasPerk(PerkLib.Feeder))
         {
            outputText("你完全理解她正在经历什么；一对巨大乳房的重量，当它们充满液体时的敏感度，以及里面的东西在你紧绷的皮肤下晃动时那种近乎令人发狂的感觉……");
         }
         else if(get_player().biggestTitSize() >= 15)
         {
            if(get_player().lactationQ() == 0)
            {
               outputText("并不太令人惊讶；你知道你的乳房很敏感，而且你甚至不在里面产奶。");
            }
            else
            {
               outputText("你很容易想象她一定有多麻烦，特别是考虑到她乳房的大部分都是液体。");
            }
         }
         else if(get_player().lactationQ() > 0)
         {
            outputText("你知道你的乳房里充满液体等着流出来是多么令人分心。");
         }
         if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,447) == 0)
         {
            outputText("[pg]你简短地考虑了一下你应该如何进行“挤奶”过程。你应该专注于一个乳头，还是两个……？决定两个都弄——这样对女孩来说可能更容易——你接过递来的杯子，准备打开……酒桶。");
         }
         else
         {
            outputText("[pg]你回想起上次你处理两个乳头时她有多高兴，所以你决定坚持这样做。从她那里接过杯子，你准备开始提取。");
         }
         outputText("小心翼翼地，就像你在处理精美的瓷器一样，你举起她那巨大的乳房之一，并将一个乳头放在你的酒壶上方。通过从根部到尖端轻柔地挤压乳头，你很快就得到了一股稳定的酒流。她用喉咙里的呻吟来回报你熟练的操作，当她开始在几乎无法抑制的性奋中颤抖时，小小的涟漪开始在她的乳肉上掠过。");
         outputText("[pg]女孩的双手紧紧抓住座位，极力掩饰自己的快感……但显然失败了。杯子装满一半后，你把乳头推到一边，换到另一边。随着挑逗的继续，猫娘的表情逐渐从兴奋变成了近乎高潮的模样。啤酒再次顺畅地流出，你的杯子出乎意料地快就装满了。你松开她的乳房，盖上杯盖以防洒出。你现在有了一杯黑猫啤酒。");
         if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,446) > 0)
         {
            outputText("妮芙");
         }
         else
         {
            outputText("猫娘");
         }
         outputText("如释重负地叹了口气，轻轻咬着下唇。");
         outputText("[pg]你觉得她的乳房可能稍微变小了一点，但因为它们实在太大了，很难看出来。她红着脸，极力掩饰自己在椅子上摩擦的动作。[say: 天哪，你的手艺真不错，]她简直像猫一样发出呼噜声。[say: 你是在这儿喝，还是打包带走？]");
         var _loc1_:Player = get_player();
         _loc1_.set_gems(_loc1_.get_gems() - 2);
         statScreenRefresh();
         var _loc2_:IMap = KFLAGS.flags;
         FlagDict_Impl_.arrayWriteInt(_loc2_,447,FlagDict_Impl_.arrayReadInt(_loc2_,447) + 1);
         menu();
         addButton(0,"在这喝",drinkNiamhsBeerInTelAdre);
         if(get_player().get_gems() >= 2)
         {
            addButton(1,"打包带走",blackCatBeerToGo);
         }
         else
         {
            addButtonDisabled(1,"打包带走","你太穷了，买不起杯子。");
         }
      }
      
      public function drinkNiamhsBeerInTelAdre() : void
      {
         clearOutput();
         if(get_player().lactationQ() >= 300 && get_player().biggestTitSize() >= 5 && Utils.rand(2) == 0 && FlagDict_Impl_.arrayReadInt(KFLAGS.flags,446) > 0)
         {
            outputText("[say: 干杯！]你欢呼着，将这杯美味的酒一饮而尽。这杯烈酒让你的胸口乃至全身都暖和了起来。酒精的热量像火一样顺着你的肠胃流下，温暖了你的下体，让你感到更加兴奋。酒劲让你头晕目眩，仿佛思考都变得有些困难。");
            outputText("[pg]随着平衡感的改变，你开始踉跄，你意识到体内的热量正在向外膨胀。低头一看，你发现膨胀的不是热量，而是你那丰满的双乳。你的每个[fullChest]都增大了两个罩杯，而且在几秒钟内还在继续变大。在衣服下，你的乳晕颜色变深，你能感觉到每个乳头都在跳动，迫不及待地想要排出里面的乳汁。");
            outputText("[pg][say: 哎呀，亲爱的。]妮芙评论道，[say: 你那对宝贝看起来都要撑破了……]你的[armor]被撑开，因为你不断变大的乳房已经大到无法被包裹。你的每个乳头都变得丰满，开始喷射出一种看起来很不寻常的液体。");
            outputText("[pg]你向后靠在吧台上，胸前的重量越来越沉。你大口喘气，因为这种生长让你更加兴奋。你感觉到一只手抓住了你的手腕，妮芙把你拉到了吧台后面。她拿了一个小酒杯，举到你敏感的乳头前，收集了一些液体，然后闻了闻。");
            if(isSaturnalia() && int(get_date().getDate()) >= 31)
            {
               outputText("[pg][say: 哇，天哪。亲爱的，你流出来的是香槟。]她捏了捏你的另一个乳头，装满了第二个小酒杯。同样的透明液体流了出来，小小的香槟气泡让你的乳头敏感度达到了新的高度，导致你的");
               if(get_player().hasVagina())
               {
                  outputText("小穴湿润了");
               }
               if(get_player().get_gender() == 3)
               {
                  outputText("并且");
               }
               if(get_player().hasCock())
               {
                  outputText("[eachCock]变硬了");
               }
               outputText("。[say: 你知道吗，我有个主意。接下来的一个小时你待在我身边怎么样？我敢肯定你一定很想把你那对大宝贝排空。我们不妨把你的香槟卖给顾客。你觉得呢，小姑娘？]");
            }
            else if(int(get_date().getDate()) == 17 && int(get_date().getMonth()) == 2)
            {
               outputText("[pg]妮芙笑了。小酒杯里的液体浓郁而深邃，你忍不住注意到覆盖在酒面和你乳头上的泡沫。[say: 姑娘，这可是我所谓的上等拉格啤酒。]妮芙迅速将酒一饮而尽。[say: 啊，真是太棒了。真希望我也能时不时地挤出这么一杯好酒。]她带着猫一样的笑容看着你，然后建议道，[say: 这样吧，亲爱的。我们把你和你那对大奶子放在吧台上，在接下来的一个小时里，把你那美味浓郁的拉格啤酒挤出来。能让你赚不少宝石，还能缓解那可怕的肿胀。你觉得呢，亲爱的？]");
            }
            else if(isSaturnalia())
            {
               outputText("[pg]这奇怪的颜色表明装满小酒杯的不是牛奶，但你也不确定那是什么。妮芙伸出舌头舔了舔，咧嘴笑了。[say: 哦哦。嗯嗯。蛋酒。太美味了。]她把整杯酒都喝了下去，然后眨了眨眼。[say: 哇。而且酒劲还挺大！]她用一只手臂搂住你的肩膀。[say: 姑娘，我敢打赌你那对宝贝还会喷射这种节日欢乐好一阵子。不如你让我把你放在吧台上，卖掉你这充满欢乐的液体怎么样？考虑到你有多美味，我敢打赌用不了多久就能把它们排空。还能让你赚不少宝石呢！]");
            }
            else if(isValentine())
            {
               outputText("[pg]这香气很独特，妮芙评论道，[say: 哎呀，你流出来的白葡萄酒可真美味，姑娘。]她拉了拉另一个乳头，又从你身上挤出了一点。[say: 嗯嗯，另一个是上好的红酒。]她咧嘴笑了。[say: 我敢打赌镇上有很多情侣愿意花大价钱买你那对宝贝里晃荡的东西。]她依偎在你身边。[say: 你觉得呢，亲爱的？给我一个小时的时间？看看酒吧里的客人能不能把你榨干？我会让你觉得物有所值的。]她眨了眨眼。");
            }
            else
            {
               outputText("[pg][say: 好吧，姑娘，看来你那对大奶子是受了我的影响。抱歉啦，肯定是那啤酒搞的鬼。]她捏了捏你的另一个乳头，倒满了第二杯酒。[say: 没错，绝对是啤酒。你现在也能分泌出美味的酒了，就跟我一样。别担心，我以前见过这种情况。通常不会持续太久。不过既然你现在能流出这么好的啤酒，不如卖点怎么样？毕竟，我可不能让你免费送人，而我却在收钱，对吧？]");
            }
            menu();
            addButton(0,"卖你的酒",sellYourBooze);
            addButton(14,"离开",leaveWithBeerTits);
            return;
         }
         outputText("你大喊一声[say: 干杯！]然后把杯子倒进嘴里，贪婪地喝了起来。酒精的温暖紧随液体本身而来——这酒劲真大。");
         get_consumables().BC_BEER.applyEffect(get_player(),false,true);
         if(get_game().time.hours <= 15)
         {
            outputText("[pg][say: 谢谢惠顾，" + get_player().mfn("小伙子","小姑娘","客人") + "！记住，妮芙每天8点到4点都会卖她的黑猫啤酒。]你点头致谢，然后离开了桌子。");
         }
         else
         {
            outputText("[pg]多亏了你的努力，");
            if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,446) == 0)
            {
               outputText("猫娘的");
            }
            else
            {
               outputText("妮芙的");
            }
            outputText("乳房里最后一滴啤酒也被挤干了。她松了口气，抚摸着缩小的乳房；虽然还是G罩杯左右的大小，但比她一天开始时要小得多。[say: 谢谢你的生意；你喝了今天的最后一杯。不过，我明天还会在这里，和以前一样满，]她轻声叹息。[say: 我很遗憾地说，妮芙的黑猫啤酒似乎不会很快停业。]她站起身，拿起外套，将手臂伸进袖子里。这个敏捷的女孩将衣服拉过她丰满的胸部，轻松地扣上略显紧绷的扣子。穿戴整齐后，她转身离开，装满宝石的袋子在她摇曳的臀部上弹跳。你看着她离去，盯着她的背影，直到她走出大门。");
         }
         var _loc1_:IMap = KFLAGS.flags;
         FlagDict_Impl_.arrayWriteInt(_loc1_,446,FlagDict_Impl_.arrayReadInt(_loc1_,446) + 1);
         doNext(get_camp().returnToCampUseOneHour);
      }
      
      public function drinkFromZeTap() : void
      {
         clearOutput();
         outputText("你的目光锁定在她那巨大、不断滴水的乳头上，溢出的香槟泡沫结在支撑她那巨大乳房的桌子上，你知道你必须直接从源头品尝。你向前挤去，坐到一个毛绒垫子上，从它那许多破洞和散发着可疑气味的污渍来看，它已经饱经风霜了，然后你抓住面前那巨大的乳房，让这个傻乎乎的猫娘发出期待快感的叫声。");
         outputText("[pg]当她那训练有素的乳头喷涌出珍贵的灵药时，美妙的味道在你的嘴里炸开。令人愉悦的起泡，这泡沫丰富的液体是一种浓郁、甜美的美味，带有一种奇怪的粘稠质地，让人吞咽起来更加美味。你大口吞咽、吸吮，隐约意识到还有人占了妮芙另一个乳头的便宜。一种奇怪的刺痛感席卷你的全身；就像针扎一样，只是奇妙地令人愉悦，以至于你能感觉到你的大脑开始变得迟钝。渴望获得更大的快感，你吸得越来越用力，尽可能多、尽可能快地把液体灌进嘴里——一切似乎都消失了，只剩下这起泡酒的美妙味道和你对它永不满足的渴望。你只是不停地喝啊喝，而且，感觉越来越好——你发现你的大脑完全停止了思考……");
         outputText("[pg]你猛地回过神来，发现自己平躺在地上，仰望着天空。[say: 那个，你没事吧，[name]？]妮芙觉得好笑地问道。[say: 我的起泡奶子，有时候，真的会让人受不了，你知道的。你还好吗？]");
         outputText("[pg]你撑起身子，向这位漂亮的猫娘保证你感觉，超级无敌好！你打了个嗝来强调这个声明，因为突然的动作让你肚子里所有美味的泡泡都跳起舞来，然后你咯咯地笑了起来，觉得这太调皮了。");
         get_consumables().BIMBOCH.applyEffect(get_player(),false,false);
         doNext(get_camp().returnToCampUseOneHour);
      }
      
      public function corruptOrBimboNiamhIntro() : void
      {
         clearOutput();
         outputText("[say:嘿，贵客，]你走近时，这位胸部丰满的小猫娘打招呼道。[say:我想请你帮个忙！我的酒杯空了，而且我已经厌倦了我自己酿的酒，]妮芙解释道。[say:你介意去帮我拿点什么吗，还是你要逼我再尝一次我自己的货？]");
         outputText("[pg]你停顿了一下，思考着你的选择。虽然你知道湿身婊酒馆卖很多种酒，但在你看来，其中大部分……并不完全适合人类——或者猫科动物——饮用。你脑海中闪过一个特别调皮的念头。也许你可以给她拿点……");
         if(get_player().hasItem(get_consumables().BIMBOLQ))
         {
            outputText("“起泡”的，比如你从小恶魔领主那里得到的傻妞液，或者");
         }
         outputText("甚至是一瓶魅魔乳液？你得考虑一下你的选择。另一方面，当然，这么有腐化性的东西可能会让她那装满酒的胸部发生变异，很可能会迫使她完全离开特尔阿德雷……而且可能还会反噬到你自己头上。你该怎么做？");
         outputText("[pg]（编者注：魅魔乳液选项尚未完成）[pg]");
         menu();
         if(get_player().hasItem(get_consumables().BIMBOLQ))
         {
            addButton(0,"傻妞液",giveNiamphBimboLiquer);
         }
         else
         {
            addButtonDisabled(0,"傻妞液");
         }
         if(get_player().hasItem(get_consumables().SUCMILK))
         {
            addButton(1,"S.Milk",giveNiamphSuccubiMilk);
         }
         else
         {
            addButtonDisabled(1,"S.Milk");
         }
         addButton(14,"返回",maybeLaterNiamh);
      }
      
      public function boozeBoobsType() : String
      {
         if(isSaturnalia() && int(get_date().getDate()) >= 31)
         {
            return "香槟";
         }
         if(int(get_date().getDate()) == 17 && int(get_date().getMonth()) == 2)
         {
            return "圣帕特里克节拉格啤酒";
         }
         if(isSaturnalia())
         {
            return "蛋酒";
         }
         if(isValentine())
         {
            return "葡萄酒";
         }
         return "啤酒";
      }
      
      public function blackCatBeerToGo() : void
      {
         clearOutput();
         outputText("[say: 那就再收两颗宝石吧，]女孩说。[say: 不过，如果你的手再灵巧一点，我可能得付钱让你喝了，]她调情道。你又递过去两颗宝石，她感激地把它们装进袋子里，对你露出灿烂的笑容。");
         var _loc1_:Player = get_player();
         _loc1_.set_gems(_loc1_.get_gems() - 2);
         statScreenRefresh();
         if(get_game().time.hours <= 15)
         {
            outputText("[pg][say: 谢谢惠顾，" + get_player().mfn("小伙子","小姑娘","客人") + "！记住，妮芙每天8点到4点都会卖她的黑猫啤酒。]你点头致谢，然后离开了桌子。");
         }
         else
         {
            outputText("[pg]多亏了你的努力，");
            if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,446) == 0)
            {
               outputText("猫娘的");
            }
            else
            {
               outputText("妮芙的");
            }
            outputText("乳房里最后一滴啤酒也被挤干了。她松了口气，抚摸着缩小的乳房；虽然还是G罩杯左右的大小，但比她一天开始时要小得多。[say: 谢谢你的生意；你喝了今天的最后一杯。不过，我明天还会在这里，和以前一样满，]她轻声叹息。[say: 我很遗憾地说，妮芙的黑猫啤酒似乎不会很快停业。]她站起身，拿起外套，将手臂伸进袖子里。这个敏捷的女孩将衣服拉过她丰满的胸部，轻松地扣上略显紧绷的扣子。穿戴整齐后，她转身离开，装满宝石的袋子在她摇曳的臀部上弹跳。你看着她离去，盯着她的背影，直到她走出大门。");
         }
         outputText("[pg]");
         var _loc2_:IMap = KFLAGS.flags;
         FlagDict_Impl_.arrayWriteInt(_loc2_,446,FlagDict_Impl_.arrayReadInt(_loc2_,446) + 1);
         get_inventory().takeItem(get_consumables().BC_BEER,get_telAdre().barTelAdre);
      }
      
      public function bazaardNiamhDrink() : void
      {
         clearOutput();
         var _loc1_:Player = get_player();
         _loc1_.set_gems(_loc1_.get_gems() - 2);
         outputText("你走向这位堕落（却完全满足）的猫娘，扔给她几颗宝石，要了一杯招牌酒。");
         if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,450) == 2)
         {
            outputText("[pg]这位深色皮肤的金发女郎咯咯笑着，抓起宝石在手心里叮当作响。[say: 这样的话，我完全没问题，但你得自己动手，你知道吗？]她晃动着她那如山般的乳房，里面的酒精饮料发出轻柔却清晰的晃动声。[say: 我有点太大了，没法，你知道的，为你服务。]果然，当她伸出手臂示范时，她的手甚至够不到自己的乳头了。她嗤嗤地笑了起来，这让周围那些醉汉也跟着咯咯笑了起来。");
            outputText("[pg]你走近她那漏水的乳头，随手拨开一个咯咯笑着、完全喝醉的小恶魔，他（她？）长着一头淑女般的草莓金发，卷发环绕着他（她？）的脸庞。你考虑是把奶挤到瓶子里留着以后喝，还是现在就喝。");
            menu();
            addButton(0,"喝",drinkFromZeTap);
            addButton(1,"装瓶",getBimboChampFromNiamh);
         }
         else
         {
            outputText("魅魔奶 妮芙 尚未实装");
            doNext(get_camp().returnToCampUseOneHour);
         }
      }
      
      public function bazaarSex() : void
      {
         var _loc1_:int = get_player().biggestCockIndex();
         var _loc2_:int = _loc1_ + 1;
         clearOutput();
         if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,450) == 2)
         {
            outputText("当你走近这个已经变成无脑花瓶的猫娘时，你的目光色眯眯地游移向她那对正往外溢出啤酒的巨大乳房。看到你盯着她看，她咯咯地笑着，诱人地晃动着胸部，让那对充满液体的巨大肉团随之摇晃。[say:喜欢，喜欢你看到的吗，[name]？]她发出满足的呼噜声，身后那条长长的黑尾巴兴奋地摇摆着。");
            outputText("[pg]你抓住这个发情的傻妞的手臂，把她带到一个空帐篷里，她认出这是她自己的帐篷。刚一关上帐篷门，猫娘就解开了她的缠腰布，任由布料飘落在地，将她那光芒四射的裸体展露无遗。她那巨大的乳房沉甸甸地摇晃着，当她托起那对巨大的肉团时，一丝啤酒从她的乳头漏了出来。你轻轻一推，把妮芙推倒在床上，分开她的双腿，好仔细看看她那在昏暗光线下闪闪发光、渴望而放荡的嘴唇。");
            outputText("[pg]你把双手牢牢地按在她的双腿上，俯身在她的阴户上试探性地舔了一下。她又咯咯地笑了起来，伸手去揉弄你那侵入的舌头上方突出的阴蒂。[say:那感觉太棒了，宝贝。你能再来一次吗？求求你了？]好吧，你很难拒绝这么礼貌的请求，于是迅速把脸埋在她的双腿之间，沿着她那条缝隙吸吮起来。[say:啊——啊！]妮芙呻吟着。[say:感觉真好，[name]！]");
            outputText("[pg]你告诉她马上就会感觉更好，然后把舌头从她身上移开，抓住你那半勃起的[cock " + _loc2_ + "]。稍微调整了一下姿势，你把它插进了她那对充满酒气的乳房之间。当你抓住她的乳房，把它们挤在一起包住你的肉棒，形成一个巨大的、全方位包裹的护套供你抽插时，她惊讶地叫了一声。妮芙无助地喵喵叫着，你以她为代价给自己来了一次乳交，你的臀部猛烈地撞击着她那对肉团的底部，让那过度充满液体、冒着气泡的肉体震颤不已。");
            outputText("[pg]你把这个猫娘荡妇的大乳头捏在一起，看着漏出的一丝酒液咧嘴笑了。你粗暴地拍打着她那颤抖的乳房，把两个乳头都塞进猫娘的嘴里，让她喝了满满一口酒，脸颊都鼓了起来。她在你的攻势下扭动着，但你把她的乳头牢牢地按在她的嘴里，给妮芙灌下越来越多的酒，直到你看到她的眼睛开始迷离，身体开始变得慵懒，在你用酒精淹没她那本就混乱的头脑时，她放松地瘫软在你坚定的掌控中。");
            outputText("[pg]在对你这个无脑啤酒妹进行了几分钟的乳交后，你感觉到一股高潮在你的[balls]里涌动。你加快了速度，尽可能用力地用臀部撞击她的乳房，直到她大叫起来，气泡顺着她的下巴流下，很快就和你射出的第一股浓稠精液混合在一起。你咆哮着射精，给这个傻妞戴上了一条乳白色的珍珠项链，精液从她那厚实的乳房之间喷射而出。");
            outputText("[pg]女孩醉醺醺地咯咯笑着，吸吮着沾在下巴和脸颊上的那点多余液体，她那长长的猫舌头漫不经心地舔舐着周围的精液，而你则慢慢平静下来，现在只是在她的乳房之间滴下了一小滩液体。");
            outputText("[pg][say:那真是——嗝——太性感了，[name]，]醉醺醺的酒桶女孩咯咯地笑着，摇摇晃晃地站起来，跌跌撞撞地走向集市。[say:我们，我们应该很快再来一次！]她补充道，昂首阔步地走出去，把她那条新的珍珠项链完全展示出来。");
            get_player().orgasm("Dick");
            dynStats(DynStat.Inte(-0.5),DynStat.Sens(-2));
         }
         else if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,450) == 1)
         {
            outputText("[pg]魅魔乳液妮芙尚未实装。");
         }
         doNext(get_camp().returnToCampUseOneHour);
      }
      
      public function bazaarNiamh() : void
      {
         clearOutput();
         if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,450) == 2)
         {
            if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,452) == 0)
            {
               outputText("当你进入集市时，你听到一个熟悉的声音在呼唤你。[say: 嘿！[name]！这边！是我！]");
               outputText("你顺着声音找去，发现妮芙坐在集市的一个角落里。除了腰间的一小块布条外，她一丝不挂；她巨大的乳房暴露在外，供全世界欣赏。她被一小群形形色色的人包围着；有些人希望能讨杯酒喝，或者只是来这里色眯眯地盯着这个胸部巨大的猫娘，另一些人显然已经喝饱了，因为他们肚子鼓鼓的，有着女性的体态和白金色的头发。当你走近时，她咧嘴笑了。");
               outputText("[say: 我刚才在平原上闲逛，想弄清楚我要去哪里，然后我发现了这个地方。这里是不是很棒？]她显然已经忘记了这里一直都是她的目的地！[say: 这里有这么多酷炫的人，他们知道怎么玩得开心！不像沙漠里那个垃圾场，全是扫兴的家伙。是的，我要在这里日夜狂欢，[name]。]她又咯咯地笑了起来。[say: 但你仍然是我的头号顾客。所以……你想做点什么吗？]她问道。");
            }
            else
            {
               outputText("被金发、饥渴的女人、扶他和伪娘包围着，其中许多人的肚子因为喝了妮芙大量分泌的香槟而鼓胀起来，这个无脑花瓶猫娘热情地向你挥手。[say: [name]！我能为你做点什么？]她咯咯地笑着。");
            }
         }
         else
         {
            outputText("看到那堆呼呼大睡的身体，你大概能猜到妮芙决定在哪里摆摊了。");
            outputText("你推开那些被迷晕、摇摇晃晃、睡不安稳的人，走向被包围的猫娘。你和她对上了眼，她向你招手。[say: 欢迎来到我的地盘，]她窃笑着，环顾四周的受害者们。[say: 我猜你不想来杯酿酒？]说着，她把手放在她那沉甸甸的胸部上，向前倾身，露出邪恶的微笑。");
         }
         var _loc1_:IMap = KFLAGS.flags;
         FlagDict_Impl_.arrayWriteInt(_loc1_,452,FlagDict_Impl_.arrayReadInt(_loc1_,452) + 1);
         menu();
         if(get_player().get_gems() >= 2)
         {
            addButton(0,"喝一杯",bazaardNiamhDrink);
         }
         else
         {
            addButtonDisabled(0,"喝一杯","你太穷了，买不起酒。");
         }
         if(get_player().hasCock())
         {
            addButton(1,"乳交",bazaarSex);
         }
         else
         {
            addButtonDisabled(1,"乳交");
         }
         addButton(14,"返回",get_game().bazaar.enterTheBazaar);
      }
      
      public function barBeerOrgyTits() : void
      {
         var _loc1_:int = 0;
         clearOutput();
         if(get_player().hasVagina())
         {
            outputText("随着不断地\"敲击你的酒桶\"将你的自制力逼到了极限，你[vagina]流口水的情况变得更糟了。各种醉汉的手开始更具侵略性地在你的乳房上移动，最终蜿蜒向下进入你的大腿之间。");
         }
         if(get_player().hasCock())
         {
            outputText("[EachCock]长到了它的全长。你试图保持");
            if(get_player().cockTotal() == 1)
            {
               outputText("它");
            }
            else
            {
               outputText("它们");
            }
            outputText("谨慎，但这不可能。你试图推开");
            if(get_player().cockTotal() == 1)
            {
               outputText("它");
            }
            else
            {
               outputText("它们");
            }
            outputText("推开，但其他的手开始抚摸你。");
         }
         outputText("[pg]妮芙发出呼噜声，[say: 哎呀，亲爱的，你看起来快要炸了。]她戳了戳你胀鼓鼓的乳房，[say: 我说的可不是你这些酒气球。]她俯下身，把她肥大的乳房压在你的乳房上，给了你一个湿漉漉的深吻。当她把舌头伸进你嘴里时，酒吧里响起了一阵欢呼声。她微笑着退后，调皮地宣布，[say: 来吧，伙计们！我们怎么才能正确地打开这个酒桶呢？]");
         if(get_player().butt.rating >= 20)
         {
            outputText("她拍了拍你的屁股以强调她的意思，这个动作让你巨大的臀瓣泛起阵阵肉波。");
         }
         outputText("[pg]喝你奶子里的酒喝得烂醉的人群中又爆发出几声欢呼。一双双的手" + (get_noFur() ? "" : "和爪子") + "开始抓住你的四肢和乳房，把你举到半空中。");
         if(get_player().biggestTitSize() >= 20)
         {
            outputText("你巨大的乳房大到在你被抬起时，会暂时垂在身体两侧。");
         }
         outputText("当人群把你放下时，你的[butt]先碰到了桌子。一些顾客开始直接吸吮你的乳头。");
         if((get_player().get_pregnancyIncubation() == 0 || get_player().get_pregnancyIncubation() > 100) && get_player().bRows() > 1)
         {
            outputText("你基本上就是一堆装满" + boozeBoobsType() + "的奶子。");
         }
         else if(get_player().bRows() > 1)
         {
            outputText("你基本上就是一个巨大的孕肚，周围被你的[chest]包围着，躺在桌子上，对酒吧顾客的性骚扰无能为力，但你却乐在其中。");
         }
         if(get_game().time.hours < 15 && FlagDict_Impl_.arrayReadInt(KFLAGS.flags,12) > 0 && get_player().hasVagina())
         {
            outputText("[pg]一双熟悉的" + (get_noFur() ? "手" : "爪子") + "抓住你的脚踝，把你的双腿大大地分开。你的阴唇几乎喷出了淫液，期待着即将发生的事情。[say: 噢，看来有人急不可耐了。]你努力越过自己高耸的乳房，想看看是谁站在你的双腿之间。一根巨大的马鸡巴在空中挥舞的熟悉景象吸引了你的注意力，随后乌尔塔那咧嘴笑的脸庞映入眼帘。[say: 哎呀，你不是要被干翻了吗，亲爱的。]她话音刚落，她那膨大的龟头就伴随着湿润的挤压声，插进了你的下体。当她巨大的马肉钻进你的身体时，你感觉到她撑开了你的入口。极乐的尖叫声响起，直到乌尔塔的龟头突破你的子宫，你才意识到那是在狂喜中尖叫的你自己。");
            if(get_player().get_pregnancyIncubation() == 0)
            {
               outputText("当人们看到乌尔塔每次插进你体内时，你腹部反复隆起的凸起，一些人发出了欢呼和尖叫。");
            }
            get_player().cuntChange(60,true,true,false);
         }
         else if(get_player().hasVagina())
         {
            outputText("[pg]一双双手抓住你的腿，将你分开，同时用你自己的淫水涂抹你的大腿，直到你下半身的每一寸肌肤都变得湿滑。两个狗" + (get_noFur() ? "人" : "兽人") + "在你的大腿之间争夺位置。");
            if(get_player().vaginalCapacity() < 60)
            {
               outputText("其中一个的鸡巴显然对你的小穴来说太大了，最终退缩了，这样另一个虽然尺寸仍然很大，但可以获得把你干翻的荣誉。");
            }
            else
            {
               outputText("他们都长着巨大的犬科鸡巴，但其中一个特别巨大，而另一个对于像你这样自然扩张的小穴来说可能会有点松。最大的那个赢了，并摆好姿势，准备给你那过于宽大的肉洞进行一次急需的扩张。");
            }
            outputText("[pg]球状的鸡巴挤进你湿透的阴唇，强行撑开你的入口，并插入你，直到它在里面触底。你临时情人的大腿紧贴着你的大腿，只有他那象征男子气概的肉结留在你的小穴外面。当他抽插时，你大声尖叫，每次都把自己埋到肥大的肉结处。你的子宫颈感觉随时都会断裂。");
         }
         outputText("[pg]妮芙爬上桌子，移动着把她的臀部放在你的头顶上，同时俯身压在你身体的其余部分上。很明显，她要么脱了内衣，要么一开始就没穿。她光溜溜的小穴现在就在离你脸几英寸的地方徘徊。");
         if(get_player().get_pregnancyIncubation() > 0 && get_player().get_pregnancyIncubation() < 100)
         {
            outputText("[say: 喂！小心点伙计们，这宝贝随时可能爆炸！]妮芙带着责备的爱意拍了拍你的肚子。");
         }
         if(get_player().cockTotal() == 1)
         {
            outputText("[pg][say: 嗯嗯，这正是我想要的。]妮芙坐下来，把她的女性私处压在你的嘴上。出于某种色情的本能，你的舌头开始舔舐她的褶皱，寻找进入这个丰满猫娘深处的入口。她自己粗糙的舌头开始吸吮你勃起肉棒的侧面。");
         }
         else if(get_player().cockTotal() > 1)
         {
            outputText("[pg][say: 噢，太棒了。你装备得太齐全了，不是吗？]妮芙抓起你的一把鸡巴肉，同时坐下臀部，用她的阴道褶皱闷住你的脸。她的阴唇滑入你的双唇之间，你发现自己正在用舌头舔她的阴户，寻找她的入口。她手里拿着你的鸡巴，开始用自己的嘴吞下你的一根肉棒，急切地吸吮你，同时给你打飞机。你大量分泌的先列腺液成为她双手抚摸你时的完美润滑剂。[say: 嗯嗯，]妮芙发出呼噜声，[say: 我希望你的精液和你的" + boozeBoobsType() + "一样好。]");
         }
         if(get_player().getClitLength() >= 2)
         {
            outputText("[pg]当你感觉到有什么湿润紧致的东西滑过你的阴蒂时，你腹股沟的感觉变得更加令人愉悦，无法抗拒。在酒吧里喧闹的声音中，你能分辨出妖精独特的尖叫声，这声音与在你的阴蒂上滑上滑下的感觉同步。");
         }
         outputText("[pg]随着人群在你周围聚集，你的乳头不停地喷射着。每个顾客都试图大口吸吮你美味的" + boozeBoobsType() + "。妮芙让自己的乳房靠在你身上，向两侧挤压，以便其他人也能吸吮她娇嫩乳头漏出的啤酒。你们俩变成了一团喷射着酒精的肉块，将酒液送入顾客们等待的口中。");
         if(get_player().hasFuckableNipples())
         {
            outputText("最终，一些更饥渴的醉汉开始掏出他们的阴茎，并将龟头压在你的乳头开口处。没过多久，你就感觉到你那因酒精而肿胀的乳房被" + Utils.num2Text(get_player().totalNipples()) + "根坚硬的阴茎疯狂地操着。每一次抽插都会导致" + boozeBoobsType() + "在他们的阴茎周围溢出。");
         }
         else
         {
            outputText("一些更饥渴的顾客开始将各种形状和大小的阴茎塞进你和妮芙的乳房形成的湿润乳沟中。");
         }
         outputText("[pg]整个酒吧的人都在疯狂地操你。你那充满" + boozeBoobsType() + "的乳房在无情的性爱中摇晃。高潮顺着你的脊椎流下；当你高潮时，你的肉体在快感中颤抖。妮芙甜美的阴部用她自己的高潮浸湿了你的脸，而酒吧里的其他人则用精液填满了你的乳沟。");
         if(get_player().hasFuckableNipples())
         {
            outputText("塞满你乳头的阴茎开始将滚烫的精子泵入你的乳房，与你的" + boozeBoobsType() + "混合，导致你乳头里的每一根神经末梢都感到刺痛。他们中的一些人射精太多，以至于感觉你的乳房肿胀得更大了，几乎到了在精液溢出之前就要爆裂的地步。");
         }
         if(get_player().cockTotal() > 0)
         {
            outputText("你感觉你的身体到处都在爆炸。当妮芙的嘴里充满你的精液时，她暂时作呕，你意识到你的阴茎");
            if(get_player().cockTotal() > 1)
            {
               outputText("们已经");
            }
            else
            {
               outputText("已经");
            }
            outputText("开始喷射");
            if(get_player().cockTotal() == 1)
            {
               outputText("它的");
            }
            else
            {
               outputText("它们的");
            }
            outputText("精液。妮芙把它吞进了喉咙，但还是有一些精液溅到了她的脸上。");
            if(get_player().get_pregnancyIncubation() > 0 && get_player().get_pregnancyIncubation() < 200)
            {
               outputText("一团团精液溅落在你怀孕的肚子上。");
            }
         }
         if(get_player().statusEffectv1(StatusEffects.Edryn) >= 5 && get_player().get_gender() == 3 && get_game().time.hours == 14 && FlagDict_Impl_.arrayReadInt(KFLAGS.flags,12) > 0)
         {
            outputText("[pg]你被快感弄得头晕目眩，以至于当你被从桌子上抬起并再次穿过酒吧时，你几乎没有注意到。当人群让你站起来时，你几乎感觉不到你的脚和腿，你虚弱地抬起头，看到了突然改变姿势的原因。就在你面前的是埃德琳充满女人味的后臀，她黑色的阴唇来回摇晃，从它们湿透的褶皱中滴下她那充满少女气息的母马淫液。你甚至不需要做任何事情，几只手就调整了[eachCock]的角度并引导你向前。");
            if(get_player().cockTotal() == 1)
            {
               outputText("当你的[cock]填满她时，埃德琳在狂喜中大声呻吟。");
            }
            else if(get_player().cockTotal() > 1)
            {
               outputText("你的龟头压在埃德琳的阴唇之间，导致她大喊，[say: 哦，天哪！你、你、你用多少根鸡巴操我——]埃德琳的高潮打断了她的声音，她阴部里的每一块肌肉都收缩着包裹住你的[cocks]。");
            }
            outputText("[pg]当埃德琳的阴部真的把你吸得更深时，你感觉到乌尔塔移动到了你的身后。当她的马鸡巴戳在你的阴唇上时，你在第一次抽插之前就意识到了即将发生的事情。特尔阿德雷最优秀的守卫将她巨大的阴茎猛地插入你的体内，让你成为了一个性爱三明治的中心。");
            if(get_player().get_pregnancyIncubation() > 0 && get_player().get_pregnancyIncubation() < 200)
            {
               outputText("你怀孕的肚子紧紧贴在埃德琳的屁股上，乌尔塔的阴茎和埃德琳的阴部将你固定在她们之间。");
            }
            else
            {
               outputText("乌尔塔的阴茎和埃德琳的阴部将你固定在她们之间，当乌尔塔把你操得更深时，她的龟头迫使你的肚子向外凸出，直到它压在埃德琳的屁股上。");
            }
            outputText("[pg]在埃德琳的马阴部和乌尔塔的马鸡巴之间，你实际上成为了她们活生生的性玩具。当她们俩用她们的性器官摩擦你时，你的身体来回摇晃和颤抖。你的乳房到处喷射着" + boozeBoobsType() + "，在这个过程中拍打着埃德琳的屁股。");
            if(get_player().bRows() == 2)
            {
               outputText("每次乌尔塔的躯干将你压向埃德琳时，你的第二排乳房都会被挤向两侧。");
            }
            else if(get_player().bRows() == 3)
            {
               outputText("随着做爱变得越来越粗暴，你最下面的一排乳房拍打着你的三条大腿。");
            }
            if(get_player().balls > 0 && get_player().ballSize > 14)
            {
               outputText("你悬垂的睾丸在每个人的双腿间跳动。");
            }
            if(get_player().butt.rating >= 22)
            {
               outputText("即使乌尔塔几乎把她的臀部塞进你的股沟，你屁股上的肥肉也在颤动。 [say:该死，你的屁股比埃德琳的还大，] 她一边打你的屁股一边责备道。 [say:嘿！] 埃德琳用一种假装自尊心受伤的语气喊道。");
            }
            outputText("[pg]她们俩把你操得神魂颠倒，而酒吧里的其他人则在旁观和欢呼。你开始不受控制地高潮，这只会刺激她们俩进行更粗暴的抽插和研磨。在 " + boozeBoobsType() + " 停止从你的乳头渗出并被你正常的乳汁流取代很久之后，她们俩继续用力操你，让你沉重的乳房摇晃弹跳，供人群欣赏。");
            outputText("[pg]最后，埃德琳在快感中大叫，大概是因为一次特别强烈的高潮，并尽可能高地抬起她的后半身。当乌尔塔终于达到她自己的高潮并向上抽插时，你的身体完全被性器官高高举起，你的双腿悬空在酒吧的地板上方。");
            outputText("[pg]乌尔塔的阴茎感觉就像要撕裂你的躯干一样，精液在其中汹涌澎湃，最后在你的子宫内喷发成一团混乱的洪流。当一股精液喷射在你的横膈膜下方时，你几乎无法呼吸。你的肚子越来越大，直到压在埃德琳的屁股上。你感觉它随时都会爆炸，人群中爆发出欢呼声。几个特别激动的酒吧顾客实际上在怂恿乌尔塔，叫她把你撑爆。当你和乌尔塔都疯狂高潮时，大量的精液从你和埃德琳的小穴中溢出。妊娠纹出现在你肚子的两侧，但被填满超出容量的快感，同时将你自己的精液喷射到埃德琳小穴热气腾腾的裂口中，使你的高级大脑功能瘫痪，无法做任何事情来阻止这场狂欢。一点点疼痛在你的两侧荡漾，就在你以为你会在精液爆炸的肚子里迎来终结之前，你翻了个白眼，一切都变黑了。");
            outputText("[pg]你接下来意识到的是肠胃里感到一阵强烈的压力。当你的视力恢复时，你隐约看到特尔阿德雷外面的沙漠从你身边经过。当你的感官恢复时，你意识到你正骑在埃德琳的背上，而乌尔塔坐在你身后。 [say:哈喽……] 一个喝得烂醉的乌尔塔在你耳边低语。 [say:看来你醒了。] 她伸手拍了拍你胀鼓鼓的肚子。 [say:你真的吃了很多。我们觉得我们做得有点过火了，所以我们决定送你回营地。] 乌尔塔的精液仍然从你的胯部溢出，浸湿了埃德琳的两侧。埃德琳自己的后半身也因为你给她的许多发精液而漏水。");
            outputText("[pg]她们俩把你连同你的衣服和装备一起放回营地。她们每个人都眨了眨眼，并在返回特尔阿德雷时给了你一个飞吻。你的乳房又在漏奶了，而且它们似乎永久性地变大了。");
            get_player().growTits(2,get_player().bRows(),false,2);
         }
         else if(get_player().hasVagina() && get_game().time.hours < 15 && FlagDict_Impl_.arrayReadInt(KFLAGS.flags,12) > 0)
         {
            outputText("[pg]你听到乌尔塔发出充满激情的欲望呼喊，她的马屌以更大的凶猛程度刺穿你。她的高潮几乎把她击倒，因为她的肉棒肿胀得更宽，当精液通过它涌出时将你撑开。");
            if(get_player().get_pregnancyIncubation() == 0)
            {
               outputText("从她马屌中喷发出的精液超过了房间里所有其他射精的阴茎。当你的胃因为直接泵入子宫的汹涌精子洪流而肿胀时，你的肚脐向外凸出。陌生人的手抓住你的腿，把你按在原地，而乌尔塔则努力将她喷涌的阴茎留在你的小穴里，尽管压力越来越大。几个声音喊道， [say:她要爆了！她要爆了吗？我觉得她要爆了！] 妮芙被迫坐得更高，因为你充满精液的肚子向上推着她。乌尔塔看起来好像因为把自己卸载到你体内的纯粹努力而癫痫发作。你因为肿胀的狂喜而大声尖叫，但你快乐的呼喊消失在妮芙的小穴褶皱中，敦促她再次高潮。她的淫水喷到你的喉咙里，让你的肚子感觉更加紧绷，快要爆炸了。");
            }
            else
            {
               outputText("乌尔塔感觉她要把你撕碎了，因为她马精的汹涌洪流射穿了她的阴茎。她及时把它拔出来，用她的精液涂满你受虐的小穴和你怀孕肚子的下面。一串串精液喷洒在你的大腿、肚子、乳房下面，以及妮芙的胸部和脸上。 [say:哦！哦，是的！] 当乌尔塔用精子淹没你们俩时，妮芙高兴地喊道。小穴的汁液顺着你的喉咙倒下，妮芙仅仅因为被涂满乌尔塔滚烫精液的感觉就达到了高潮。");
            }
            outputText("[pg]一次又一次的高潮让你头晕目眩、醉生梦死，同时你喷涌着 " + boozeBoobsType() + " 并吸收着精液。酒吧的顾客们终于在操你性欲过剩的身体时筋疲力尽了。妮芙从你的脸上爬下来，回到地板上。她停下来喘口气，恢复平衡感，靠在桌子上，把乳房搁在你的脸上。当乌尔塔试图扶你起来时，你才勉强恢复了自己的感官。");
            if(get_player().bRows() > 1)
            {
               outputText("你的几排乳房随着你姿势的改变而移动，在它们滑动时发出吧唧吧唧的声音。");
            }
            if(get_player().get_pregnancyIncubation() == 0)
            {
               outputText("当你试图站起来时，乌尔塔那小小的精子海洋像河流一样从你的小穴里流出，顺着你的腿流下。");
            }
            outputText("[pg]当你终于站起来时，覆盖你身体并填满你乳沟的所有精液开始滴落并在你脚边汇聚。乳汁从你的乳头滴落，表明妮芙啤酒的影响终于消失了。 [say:喂，姑娘，我想你需要去河里泡一泡。可惜你在沙漠里，是吧？] 她咧嘴一笑。仍然半醉于酒精和性爱，你随意地收拾你的东西。乌尔塔优雅地帮你走出酒吧，穿过特尔阿德雷的街道，直到你收集了足够的感官找到回营地的路。你的乳房因为这愉快的折磨而隐隐作痛，每一个都感觉比这一切开始之前更饱满、更大。");
            get_player().growTits(2,get_player().bRows(),false,2);
         }
         else
         {
            outputText("[pg]在似乎永远的时间里，你的身体被用作精液垃圾桶和性玩具。");
            if(get_player().hasVagina())
            {
               outputText("狗 " + (get_noFur() ? "人" : "兽人") + " 的巨大肉结终于突破进入，导致你的小穴被过度拉伸。当他开始在你体内卸下一条精液河时，这种令人愉悦的折磨只会变得更糟。它开始在他的阴茎周围喷射出来，并在这个过程中浸湿了你的两条大腿。");
            }
            get_player().cuntChange(60,true,true,false);
            outputText("妮芙终于吃饱了并从你身上下来，但她的小穴刚离开你的脸，一根属于某种猫 " + (get_noFur() ? "人" : "兽人") + " 的坚定的阴茎就填满了你的嘴。当它刺入你的喉咙时，你的眼睛凸了出来。");
            if(get_player().hasVagina())
            {
               outputText("你被口塞堵住嘴的同时，一根新的肉棒填满了你的小穴，准备重新开始抽插，这让你的乳房四处乱晃。");
            }
            if(get_player().cockTotal() == 1 && get_player().cockArea(0) < 75)
            {
               outputText("[pg]一个有着" + (get_noFur() ? "" : "六个") + "C罩杯乳房的猫娘跳上桌子，骑在你身上。她抓住你的肉棒，把它塞进她紧致小穴的褶皱之间。");
            }
            else if(get_player().cockTotal() == 1)
            {
               outputText("[pg]一个有着" + (get_noFur() ? "" : "六个") + "巨大乳房和" + (get_noFur() ? "" : "四个") + "乳头的牛娘艰难地爬上桌子，小心翼翼地将她赤裸的母牛小穴对准你巨大的阴茎，然后将她宽得离谱的臀部压在上面。");
            }
            if(get_player().cockTotal() == 1)
            {
               outputText("你的肉棒紧紧地嵌在女孩体内。她上下颠簸，让她的" + (get_noFur() ? "" : "六个") + "乳房晃动着，供人群欣赏。你硬得发疼，即使她想下来，你肉棒的龟头也已经肿胀得无法从她小穴的入口滑出。你无法克制，一股汹涌的感觉传遍全身，将你滚烫的精液射进这个巨乳女孩的体内。你听到人群中传来呼喊声：[say: 搞大她的肚子！搞大她的肚子！搞大她的肚子！] 当他们看到你的精液从她体内流出时，你听到了欢呼声。");
            }
            else if(get_player().cockTotal() > 1)
            {
               outputText("[pg]没过多久，酒吧里倾向于女性的顾客们轮流骑上你的肉棒，用嘴和小穴伺候你，渴望得到你大量的男人精液在她们体内爆发。各种体型和种族的女孩和扶他轮流吸出你的精液。你无法克制，几分钟内你就同时将精子射进了各种小穴里。一个小穴刚离开，另一个就取而代之。你开始听到人群中传来有节奏的呼喊声：[say: 搞大她们的肚子！搞大她们的肚子！搞大她们的肚子！] 每当人群看到你的精液突然从你肉棒塞进的各种小穴中喷发出来时，他们就会爆发出各种欢呼声。");
            }
            outputText("[pg]性爱的气味充斥着你的鼻腔。人群滚烫的精液填满了你的喉咙，覆盖了你的身体。即使在你的乳房开始分泌普通的乳汁之后，操弄仍在继续。直到酒吧里的每一位顾客都用你的肉体发泄完他们的欲望，事情才平息下来。你上气不接下气，筋疲力尽，也没有酒或奶可以给了。");
            outputText("[pg]妮芙帮你挣扎着站起来，在覆盖着桌子的各种体液中留下了你身体的轮廓。她给了你一个长长的吻，然后帮你清理干净。你的乳房虽然现在正常分泌乳汁，但似乎增加了一些体积。妮芙发出呼噜声，[say: 也许你最好暂时别喝我的啤酒了。你也不希望这成为家常便饭，对吧？] 她对你眨了眨眼。");
            outputText("[pg]当你离开酒吧时，你环顾四周。每根肉棒都低垂着，看起来很满足。");
            if(get_player().cockTotal() == 1)
            {
               outputText("那个有着" + (get_noFur() ? "大" : "六个") + "乳房的女孩对你微笑，拍着她的肚子，而你的精液顺着她大腿内侧流下。你现在才开始想她有多容易受孕。");
            }
            else if(get_player().cockTotal() > 1)
            {
               outputText("房间里各种各样的女孩都在拍着她们的肚子，用性感的眼神看着你，而你的精液继续从她们的小穴里滴落。你漫不经心地想，几天后她们中是否真的有人会挺着大肚子，但你试图把这些想法从脑海中赶走。此刻她们看起来很开心。");
            }
            if(get_player().hasVagina())
            {
               outputText("你有点罗圈腿地走出酒吧。精液仍在从你的小穴里滴落，而且可能会持续一段时间。");
               if(get_player().get_pregnancyType() == 0)
               {
                  outputText("你不禁想知道那些狗" + (get_noFur() ? "人" : "娘") + "有多强壮，因为他们的精液和其他顾客的精液在你的子宫里晃荡。");
               }
               _loc1_ = Utils.rand(6);
               switch(_loc1_)
               {
                  case 0:
                     get_player().knockUp(2,432);
                     break;
                  case 1:
                     get_player().knockUp(4,350);
                     break;
                  case 2:
                     get_player().knockUp(4,350);
                     break;
                  default:
                     get_player().knockUp(7,420);
               }
            }
            get_player().growTits(2,get_player().bRows(),false,2);
         }
         get_player().orgasm("Tits");
         doNext(get_camp().returnToCampUseOneHour);
      }
      
      public function approachNiamh() : void
      {
         clearOutput();
         niamhSprite();
         get_images().showImage("niamh-approach-in-bar");
         if(Utils.rand(5) == 0 && FlagDict_Impl_.arrayReadInt(KFLAGS.flags,446) > 0 && (get_player().hasItem(get_consumables().BIMBOLQ) || get_player().hasItem(get_consumables().SUCMILK)))
         {
            corruptOrBimboNiamhIntro();
            return;
         }
         if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,446) > 0)
         {
            outputText("当你靠近时，妮芙给了你一个友好但专业的微笑。当你的目光不可避免地落在她那显然和往常一样装满酒的胸部时，她微笑着，心领神会地摇了摇头。从她肿胀的乳头不断滴下的酒精液体慢慢积聚成小水坑。[say: 哟，你好啊，顾客——对，看上面——你好，顾客。你想再尝尝我的黑猫啤酒吗？只要记住规矩；两块钱一杯，对我温柔点，还有不准从“水龙头”偷喝。]");
         }
         else
         {
            outputText("你走近这位负重前行的女人，礼貌地向她打招呼。听到声音，她的耳朵抽动了一下，并向你露出了一个歪斜的微笑。[say: 我能为你做点什么？]她有些疲惫地问道，她的话语中带着口音。[say: 也许想来点啤酒？]你关于她为什么卖酒的问题卡在喉咙里，因为你的目光不可避免地落在了她那暗色调的胸部上。就在你看着的时候，一小滴浑浊的金色液体在她肿胀的乳头上形成，并溅入乳头下方不断扩大的水坑中。从地上触手可及的那些装满啤酒的杯子中，你开始把这些线索拼凑起来。她真的在……分泌啤酒吗？你抬头看了看她；她心领神会地笑了笑，随意地将前臂靠在她那宽阔的乳肉上，并用它们将本已惊人的乳沟挤得更深。她深吸了一口气，然后用一种唱歌般的语调吟唱道，[say: 黑猫啤酒，两块钱一杯。快点买，因为卖得很快。只要对我温柔点，否则你会挨一巴掌，还有不行，你不能“直接从水龙头”喝。]过了一会儿，你耸了耸肩，心想在玛瑞斯发生过更奇怪的事情。");
         }
         menu();
         addButton(0,"交谈",talkToNiamh);
         if(get_player().get_gems() >= 2)
         {
            addButton(1,"买啤酒",getANiamhBeer);
         }
         else
         {
            addButtonDisabled(1,"买啤酒","你太穷了，买不起啤酒。");
         }
         addButton(14,"离开",leaveNiamh);
      }
   }
}

