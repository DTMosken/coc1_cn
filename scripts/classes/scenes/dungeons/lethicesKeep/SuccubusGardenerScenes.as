package classes.scenes.dungeons.lethicesKeep
{
   import classes.BaseContent;
   import classes.CoC;
   import classes.Cock;
   import classes.CockTypesEnum;
   import classes.Player;
   import classes._FlagDict.FlagDict_Impl_;
   import classes.globalFlags.KFLAGS;
   import classes.internals.Utils;
   import classes.scenes.combat.Combat;
   import flash.Boot;
   
   public class SuccubusGardenerScenes extends BaseContent
   {
      
      public static var GARDENER_LEFT:int = 1;
      
      public static var GARDENER_FUCKED:int = 2;
      
      public static var GARDENER_KILLED:int = 3;
      
      public function SuccubusGardenerScenes()
      {
         if(Boot.skip_constructor)
         {
            return;
         }
         super();
      }
      
      public function tentaFailII() : void
      {
         clearOutput();
         outputText("[pg]你被囚禁了，被自己的感官所淹没，不断地被带入极乐世界。恶魔们甚至从未试图解救你的命运，你被一只最古老的触手怪囚禁着。你的余生都在喂养它，除了你自己的狂喜感之外，无法专注于任何事情。");
         awardAchievement("孔明的陷阱",174,true,true,false);
         get_game().gameOver();
      }
      
      public function tentaFail() : void
      {
         clearOutput();
         outputText("你绝不可能放过这个利用魅魔嘴唇的好机会。像这样柔软的");
         if(get_player().hasVagina())
         {
            outputText("舔穴小嘴");
         }
         else
         {
            outputText("吸精小嘴");
         }
         outputText("可是万里挑一的。");
         if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,54) > 0)
         {
            outputText("也许斯库拉那红宝石般的小嘴能和她一较高下，但只有试过才知道。");
         }
         else if(get_game().telAdre.dominika.fellatrixSucked())
         {
            outputText("也许多米妮卡那吞噬一切的小嘴能和她一较高下，但只有试过才知道。");
         }
         outputText("你抓住这个哭喊着的荡妇卷曲的角，欣赏着她嘴唇上的触手汁液在光线下的反光，然后把她拉向你的胯部，将她压在");
         if(get_player().hasCock())
         {
            outputText("[oneCock]");
         }
         else if(get_player().hasVagina())
         {
            outputText("你的[vagina]");
         }
         else
         {
            outputText("你腹股沟敏感的皮肤上");
         }
         outputText("。她急切地开始工作，因为下面触手的关照而呻吟着，舔舐的热情让你觉得这才是她一直想要的。");
         outputText("[pg]随着她短促而狂热的嘴唇节奏摇晃着你的[hips]，你完全沉浸在这一刻。在这个花园里，有一个魅魔满足你的每一个突发奇想，很容易让人停下来享受生活中的小确幸。莉希丝可以在她的王座上多坐几分钟，这点时间足够你");
         if(get_player().hasCock())
         {
            outputText("把一团浓精射进这个荡妇的喉咙里");
         }
         else if(get_player().hasVagina())
         {
            outputText("在这个荡妇的脸上喷射爱液");
         }
         else
         {
            outputText("教教这个婊子怎么伺候屁眼");
         }
         outputText("。毫不掩饰的吸吮声在热气腾腾的空气中回荡，伴随着你享受的" + get_player().mf("低吼","娇喘") + "。你伸手去揉捏她的一只乳房，完全没有察觉到阴影正在逼近。");
         outputText("[pg]一道绿光瞬间遮蔽了你的视线。还没等你反应过来，它就像铁棍一样死死勒住了你的脖子，将你往后拽。你的肌肉还沉浸在无力的前冲中，就被它拖倒在地。它将你死死压平，任凭你如何挣扎，十几根同样强壮的触手破土而出。它们将你的四肢包裹在蠕动的淡绿色植物茧中。你全身上下只有胯部和脸露在外面，但即便是脸，也被细窄的藤蔓缠绕着，动弹不得。");
         outputText("[pg]那个淫荡的女恶魔还在和她的宠物交配，她呆呆地看着你，眼神有些空洞，下巴松弛。你可以看到她湿透的小穴里那根触手在跳动，汁液从她过度肿胀的阴唇上流下。她看起来没有任何状态来占你的便宜，不过话又说回来，她也不需要。一根巨大的橙色触手正悬停在你的上方。");
         if(!get_player().hasCock())
         {
            outputText("它的轮廓明显是阴茎的形状，但这么巨大的东西怎么可能塞进你的身体里，更别说是任何人了？");
         }
         else
         {
            outputText("它的顶端渗出润滑液，但顶端那张开的小穴大得足以容纳六个牛头人的怪物肉棒。");
            if(get_player().biggestCockLength() < 36)
            {
               outputText("你怎么可能填满它？");
            }
            else
            {
               outputText("他们为你准备这个多久了？");
            }
         }
         var _loc1_:Boolean = false;
         if(!get_player().hasCock() && !get_player().hasVagina())
         {
            outputText("[pg]有趣的是，新来的触手向你平坦的胯部降下，一边滴落着霓虹橙色的粘液。当那东西落在你身上时，你的肉体燃起了一阵原始、纯粹的刺痛感，介于痛苦和快感之间，却又两者皆非。然后，那根跳动的、阴茎状的肉柱压在你身上，猛烈地撞击着你，你和你的肉体除了屈服于它的触摸之外，什么也做不了。你喘息着，张开……不，是<i>绽放</i>，露出了敏感的阴唇和褶皱。");
            outputText("[pg]<b>这东西正在把你变成女人！</b>");
            get_player().createVagina();
            _loc1_ = true;
         }
         else if(get_player().hasVagina() && !get_player().hasCock())
         {
            outputText("[pg]新来的触手向你已经充分润滑的小穴降下，一边滴落着霓虹橙色的粘液。当那东西落在你身上时，你燃起了一阵原始、极其愉悦的感觉，尤其是你的阴唇。它们燃烧着原始、未经过滤的感觉，快感和痛苦融为一体。然后，那根跳动的、阴茎状的肉柱压在你身上，它太粗了，任何正常的小穴都无法承受，但不知怎么的，它正在猛烈地撞击着你。你张开双腿接受它……然后张得更开，绽放开来。");
            get_player().cuntChange(get_player().vaginalCapacity() * 1.25,true,true,false);
         }
         if(!get_player().hasCock())
         {
            outputText("[pg]你能感觉到你的");
            if(_loc1_)
            {
               outputText("新");
            }
            outputText("入口随着时间的推移，在粗壮的怪物周围让步。越来越宽，你的肉体张开了。它感觉太大了，你怀疑自己会不会被撕成两半，但没有不适，只有接受它肿胀、非人长度的快感。当你的体液涌出，将你张开的阴唇浸泡在少女的淫液中时，你呻吟起来。你不可能承受得了这个，更别说享受它了，但你确实在享受。哦，天哪，你有多享受啊！");
            get_player().cuntChange(get_player().vaginalCapacity() * 1.25,true,true,false);
            outputText("[pg]你能感觉到你的肚子在移动，在粗壮的入侵者周围伸展。你希望你能低下头，看到它在你体内的轮廓，但你的头被死死固定住了。它推得更深，最后，你感觉自己好像达到了极限。不知怎么的，那根巨大的触手一定知道，因为它就在那里停了下来，然后反转方向。它拔出的速度比插进去的速度快得多，你最终完全空虚了。体内冷空气的感觉很陌生……甚至很不舒服。你不喜欢它。在逐渐显露的恐惧中，你意识到自己感觉有多空虚，你有多需要那根触手在你的体内。");
            outputText("[pg]当它再次插进来时，你高潮了，它进一步松开了你，将你的小穴塑造成完美形状的容器，以满足它无尽的、怪异的需求。你的小穴喷涌着，感激地紧紧抓住它巨大的、橙色的主人，每一秒都变得越来越有弹性。在你的第三次紧缩阴道的高潮中，你的眼睛翻白了。你错过了天空消失在绿色、扭动的茎秆云层后面的景象，但至少你再也不会错过那种<i>充实</i>的感觉了。");
            menu();
            addButton(0,"继续",tentaFailII);
         }
         else
         {
            outputText("[pg]那个看起来饥渴的怪物小穴毫不犹豫地向你的[cocks]降下。");
            if(get_player().biggestCockLength() <= 12)
            {
               outputText("考虑到尺寸上的差异，你滑进去的轻松程度并不令人惊讶。");
            }
            else if(get_player().biggestCockLength() <= 30)
            {
               outputText("考虑到即使你肿胀的长度" + (int(get_player().cocks.length) > 1 ? "们" : "") + "相比之下也很小，你滑进去的轻松程度并不令人惊讶。");
            }
            else if(get_player().biggestCockLength() <= 48)
            {
               outputText("你轻松地滑了进去，尺寸与那个饥渴的肉洞完美匹配。");
            }
            else
            {
               outputText("滑进去一定费了很大的劲。橙色的小穴在你周围流着口水，一次一英寸地慢慢往下吞。它吞下了你的全部，即使它必须超越所有理智地伸展才能做到。");
            }
            outputText("感觉真好，比");
            if(get_player().biggestCockLength() <= 12)
            {
               outputText("看起来那么松垮的巨物应该有的感觉还要好。从它紧紧挤压你的感觉来看，你发誓这简直就像个紧致的小穴！");
            }
            else if(get_player().biggestCockLength() <= 30)
            {
               outputText("你乍看之下以为的还要好。不仅尺寸完美，而且它似乎恰到好处地拥抱并触碰着你男性特征" + (int(get_player().cocks.length) > 1 ? "es" : "") + "的每一部分。");
            }
            else if(get_player().biggestCockLength() > 48)
            {
               outputText("你预想的还要好，毕竟它看起来被撑得那么紧。你原以为它会痛苦地压迫你，但感觉它反而像是为你量身定做的。");
            }
            if(get_player().biggestCockLength() <= 30)
            {
               outputText("[pg]发光的橙色粘液从巨大的裂口中以浓稠的珠状渗出。你短暂地思考这种奇怪的颜色有什么作用，而你的肉棒" + (int(get_player().cocks.length) > 1 ? "s" : "") + "被拉伸的感觉给出了答案。不知怎么的，它让你变得更大了！这种感觉类似于拉伸长期休眠的肌肉……一种未被发觉的潜力的微妙屈伸，让你意识到自己能做多少，或者在这种情况下，你能变得多大。随着你的身体努力跟上这突如其来的变化，你的视线开始模糊，你闭上眼睛以防自己吐出来。");
               outputText("[pg]触手开始上下滑动。起初，它的动作缓慢而慵懒，让你有充足的时间感受它内部柔软光滑的质感贴着你，但随着你体积的增加，它上下抽插的速度也随之加快。即使在向下压的时候，它不知何故也能保持一种温和的吸力，让天鹅绒般的内壁紧紧贴着你，让你沉浸在滑溜溜的肉穴中。你变得越大，感觉就越好。你不确定自己是单纯地同时感觉到了越来越多的阴道，还是不知怎么地变得更加敏感了，但这足以让你翻白眼，你的[cocks]几乎要喷出先列腺液了。");
               outputText("[pg]你因为不知所措的狂喜而呜咽着，你感觉到自己的尺寸再次激增。由于你的视线被迫直视前方，根本无法判断你到底变得有多大。你唯一能确定的是，它正在变大，而且你感觉到了大量的阴道。相比之下，包围着你的其他几十根触手几乎不存在。就像你的肉棒" + (int(get_player().cocks.length) > 1 ? "s are" : " is") + "是你身上唯一值得感受的部分，而你的其余部分只是漂浮在虚空中——这种感觉随着你增加的每一寸长度和粗度而增强。");
               outputText("[pg]高潮几乎让你感到惊讶，但身体能承受的快感是有限的，在无力抵抗之前，你本能地抽搐着，将浓稠的精液喷射到触手饥渴的褶皱中。每一次喷射都让你变长几英寸，也变粗很多。只有在将[balls]里的每一滴精液都排空后，这种狂热的膨胀才最终停止。");
               outputText("[pg]不幸的是，感觉并没有停止。即使触手已经停止移动以消化它的美餐，你仍然对它光滑的褶皱贴着你的感觉超级敏感。你增强后的包裹里有足够的敏感度，即使是不动的压力给你的神经系统带来的反馈，也比你以前的鸡巴最猛烈的操弄还要多。发光的橙色粘液不仅仅是让你变大！它刺激了你[cocks]里的神经生长，让你变得如此敏感，以至于即使在高潮之后，你也忍不住保持坚挺。");
               outputText("[pg]几秒钟后，触手开始了缓慢的上下套弄。你呻吟着，给了附近一根藤蔓强行塞进你嘴里的机会。与你胯下传来的嘈杂信号相比，这很难引起注意或关心。甚至你的视觉似乎也变得多余和无用，你鸡巴皮肤的触觉分辨率比你眼睛微薄的输出要高出许多倍。");
               menu();
               addButton(0,"继续",tentaFailII);
               return;
            }
            outputText("[pg]发光的橙色粘液从你的根部" + (int(get_player().cocks.length) > 1 ? "s" : "") + "周围漏出。那一定就是触手的淫液了。至少感觉像普通的润滑剂。它不会让你感到灼热或麻木，而且它似乎也没有让你变得更大。等等……你闭上眼睛，专注于它的感觉。它……它比普通的润滑剂更好！你不确定为什么或怎么做到的，但它感觉比普通的阴道稍微滑一点，而且不是那种糟糕的“没有摩擦力”的感觉。每一个褶皱和丝滑的爱抚仍然恰到好处地摩擦着你的神经。它怎么能如此光滑，却又如此有力地柔软和紧握？");
            outputText("[pg]触手内部微微收缩，但伴随而来的快感却绝非微不足道。感觉就像整个世界都紧紧贴着你的[cocks]，将它们包裹在天鹅绒丝绸般的棉花般柔软中。你呻吟着高潮了，用你释放的奶油状粘液淹没了管道。你的身体试图挺动，但你被完全固定住了，被迫随着触手的节奏达到高潮。纯粹快感的绳索很快就随着这质感极佳的操弄隧道的节奏喷射而出，直到你的高潮结束，你才意识到橙色粘液对你做了什么；它让你变得更加敏感。");
            outputText("[pg]你喷射完后并没有软下来。你甚至没有喘息的机会。橙色的通道在消化你的精液时可能会保持静止，但你的鸡巴" + (int(get_player().cocks.length) > 1 ? "s are" : " is") + "仍然变得越来越敏感。你甚至不再需要运动就能让紧握的内壁唤起你的性欲，一旦它开始移动……你不确定自己是否还能承受得住。");
            outputText("[pg]几秒钟后，当触手抚摸你时，你发现自己无法承受。那股如电流般乱窜的快感浪潮让你的大脑超载，意识的断路器将其关闭，而你的鸡巴" + (int(get_player().cocks.length) > 1 ? "s throb" : "throbs") + "，享受着其中的每一刻。");
            outputText("[pg]不知过了多久，你在高潮之间醒来，周围一片绿色，但从你胯下传来的感觉数据太多了，相比之下，你的眼睛简直就像瞎了一样。你惊叹于这种新的生活，并想知道自己是否会厌倦欣赏这些墙壁的质感。下一次高潮将这些想法抛到九霄云外，为你回答了这个问题。原始的、未经过滤的快感。这才是你现在在乎的。");
            awardAchievement("孔明的陷阱",174,true,true,false);
            get_game().gameOver();
         }
      }
      
      public function surrenderToTheGardener(param1:Boolean = false) : void
      {
         if(get_player().hasCock() && !get_player().hasVagina())
         {
            maleLoss(param1);
         }
         if(!get_player().hasCock() && !get_player().hasVagina())
         {
            femGenderlessLoss(param1);
         }
         if(get_player().hasVagina() && !get_player().hasCock())
         {
            femGenderlessLoss(param1);
         }
         if(get_player().hasVagina() && get_player().hasCock())
         {
            if(Utils.rand(2) == 0)
            {
               femGenderlessLoss(param1);
            }
            else
            {
               maleLoss(param1);
            }
         }
      }
      
      public function maleLossPetIII() : void
      {
         clearOutput();
         outputText("这位勇者，与其说是[manboy]，不如说更像犬类，成了恶魔驯服的众多杂种狗中的一员，被用于从繁殖到追捕逃跑奴隶的各种事情，而[he]却很喜欢，甚至乐在其中。最终，[his]主人让她繁殖了无数次，创造了一个强壮、忠诚的仆人血统，最终帮助将整个玛瑞斯都踩在恶魔的脚下。");
         get_game().gameOver();
      }
      
      public function maleLossPetII() : void
      {
         clearOutput();
         outputText("你的狗窝太棒了！大小刚好够你爬进去，上面有洞，这样你在等被放出来的时候就不会太热。甚至还有一个洞大到足以让你把");
         if(int(get_player().cocks.length) > 1)
         {
            outputText("一根");
         }
         else
         {
            outputText("你的");
         }
         outputText("鸡巴伸过去。那个洞在后墙上。你看不到那边有什么，但你的鼻子能闻到小穴的味道——有些是母狗的小穴，还有很多溢出的精液。你以前的头脑会把它认作一个寻欢洞，但现在很难集中精力去想这种概念了。");
         outputText("[pg]太多的感官刺激让你无法集中精力进行连贯的思考。你身体的每一个部位都像是在向你尖叫着它的存在。比如，你的尾巴有点痒。你的腿有点累，但那是那种“刚散完步”的舒服的累。你的鼻子能闻到好多好多味道。最棒的是，你的阴茎感觉像是敏感了三倍。用情感和图像来思考，而不是用语言这样抽象的概念，要容易得多。");
         outputText("[pg]女主人在毛茸茸的脖子上扣上了一个项圈。");
         if(!get_player().hasFur())
         {
            outputText("以前有这个吗？");
         }
         outputText("感觉非常合适，在你的兴奋中，很难不去蹭她的腿。这对她来说一定很明显，因为你的阴茎");
         if(int(get_player().cocks.length) > 1)
         {
            outputText("都在");
         }
         else
         {
            outputText("是");
         }
         outputText("你身下晃动，她示意你翻身躺下。");
         outputText("[pg][say: 你今天听话极了，小狗。该给你奖励了。]");
         outputText("[pg]哦，她听起来好开心！你翻过身，兴奋地喘着粗气，先列腺液肆无忌惮地滴在你的皮毛上，你抬头看着她。她揉了揉你的肚子，让你开心地扭动起来，然后伸手摸向[oneCock]并用手包住它。哦，好光滑好柔软。当她的手在你周围滑动时，你能感觉到她手上的每一道纹理，你渴望的湿润让你不可挽回地润滑了。她还没有开始抚摸，而是用拇指在你的[cockhead biggest]下方来回摩擦，同时托着你的工具。");
         outputText("[pg]女主人问道，[say: 谁是好小狗？]");
         outputText("[pg]你叫了一声，她的另一只手揉了揉你的[hair]，顽皮地挠着你的耳后。她一边慢慢抚摸一边挤压，并重复了这个问题。");
         outputText("[pg][say: 谁是好小狗？]");
         outputText("[pg]这次你的叫声来得更快更容易。与此同时，女主人的手也动得快了一点。这种快感是压倒性的，就像你所有的意识都集中在后腿之间，被她美丽、匀称的手指顽皮地抚摸着，被施了魔法般夹在它们之间，这样它们就能从你柔软的神经中榨取越来越大的快感。在这一刻，你比记忆中的任何时候都要快乐，甚至欣喜若狂。这一定就是真爱的感觉。你惊叹于爱竟然感觉像是被拥有，你的阴茎");
         if(int(get_player().cocks.length) > 1)
         {
            outputText("");
         }
         outputText("颤抖着，喷射出丝带般的先列腺液。你在喉咙深处呜咽着，看着她，希望她能读懂你眼中的爱意，想让她看到你对这种状态有多么完全的满足。");
         outputText("[pg][say: 谁是好狗狗？]");
         outputText("[pg]你一边叫一边高潮，在肚子上射出了一道道精液。女主人真好；她一边抚摸一边让你射精，鼓励她的宠物把[his]精子一滴不剩地射出来。你一定表现得很好！白色的粘液飞溅到你仍然有些人类形状的胸膛上，并沾到了你的下巴上。");
         if(get_player().cumQ() >= 2500)
         {
            outputText("几股浓稠的精液射过你的头顶，涂满了墙壁，当你的主人从你的长度中挤出更多精液时，她发出了满意的咯咯笑声。");
         }
         outputText("当你为女主人的手指射精时，你高兴地叫着，但最终，你的高潮变成了一团滴滴答答的白色粘液，其中一些像象牙色的露珠一样粘在恶魔的指甲上。");
         outputText("[pg]触手园丁把手伸到你嘴边让你清理。你毫不犹豫，津津有味地舔掉她身上咸咸的奖励，然后被带进狗窝睡午觉。");
         menu();
         addButton(0,"继续",maleLossPetIII);
      }
      
      public function maleLossPet() : void
      {
         clearOutput();
         outputText("[say: 我会做你的小狗，] 你喘息着，伴随着渴望地弓起背。");
         outputText("[pg]魅魔再次踩在你的[cock]上，咯咯地笑着，[say: 噢，你做出了明智的选择，我的小宠物。噢……天哪，宠物有骨头了吗？] 她弯下腰，毫不费力地脱下你的[armor]，露出那根渴望跳动的肉棒。");
         if(get_player().biggestCockLength() >= 18)
         {
            outputText("[saystart]噢，这骨头可真大，不是吗？你要是四肢着地拖着它走，肯定会很费劲的，[puppy]。我敢打赌，你一看到母狗，就会在地上乱蹭，简直要被它定住了。");
         }
         else if(get_player().biggestCockLength() >= 8)
         {
            outputText("[saystart]噢，你这根骨头挺不错的，不是吗？每个人都会看到你下面有多大，即使你四肢着地走路。我想你会很适合给母狗配种的");
            if(Boolean([CockTypesEnum.DOG,CockTypesEnum.WOLF].contains(get_player().cocks[get_player().biggestCockIndex()].get_cockType())))
            {
               outputText("，一旦你有了形状合适的肉棒");
            }
            outputText("。");
         }
         else
         {
            outputText("[saystart]噢，你这根骨头形状真好，不是吗？我大概可以带你去参加展览，评委们会评论它和你的体型有多般配。你会喜欢的，对吧？仰面躺着，让某个看起来很官方的恶魔测量你的肉棒。");
         }
         outputText("[sayend]");
         outputText("[pg]一声尖锐的赞同呜咽自动从你舌尖滑落——只要能让她继续侍弄你的胯部，你什么都愿意做。你像爪子一样举起双手，张开[legs]方便她动作，在她的拇趾和食趾之间的“V”形缝隙里挺动，在她的脚底摩擦着自己，你心里很清楚，这大概是这恶魔能给你的最好待遇了。");
         outputText("[pg][say: 好[boy]，]她柔声哄着，扭动脚踝，用脚跟摩擦你的[sheath]。[say: 你就这么急着想射，什么都愿意做，对吧？]");
         outputText("[pg][say: 是的，]你嘶声回答，在情欲的驱使下忘记了自己的角色。");
         outputText("[pg]你的头挨了一脚，眼前顿时金星四溅，你不知道哪个更糟——是她毫不留情的惩罚带来的疼痛，还是你那根跳动的肉棒上突然消失的触感。她那温暖柔软的脚趾包裹着你青筋暴起的肉棒的幻觉，比她能说的任何话都更让你难受，你抬头看着她，脸上写满了受伤的表情。");
         outputText("[pg]她的脸上写满了不悦，但也夹杂着一丝占有欲的喜爱。如果不是她眼中闪烁着骄傲的占有欲，很容易让人以为这是一种母亲般的不满。[say: 宠物是不会说话的，]她解释道。[say: 我以后会纠正这个，但现在，你可以做我的乖小狗，对吧？]");
         outputText("[pg]你张开嘴，正要回答，却想起了上次发生的事。你慢慢地调整嘴型，发出一个新的声音。[say: ……汪？]");
         outputText("[pg]魅魔的脚跟摩擦着你的[sheath]");
         if(get_player().balls > 0)
         {
            outputText("，就在你的[balls]上方，");
         }
         outputText("再次柔声哄道：[say: 我就知道你会很好训练的。现在，我要带你去你的新家，然后你就可以把那些讨厌的、憋坏了的精液全都射在我的手上了。但在那之前你必须乖乖的，好吗？]");
         outputText("[pg]你……你不确定你能不能做到！你太热了，而且离高潮太近了！清澈的先列腺液像漏水的水龙头一样从你的[cocks]里渗出，你现在只需要抓住她的腿，然后尽情地挺动就行了。");
         outputText("[pg]也许是感觉到了这一点，或者仅仅是因为她打算带你走，她抽身退开。[say: 我想你走之前可以吃点零食。]蓝色的恶魔转向地上的一处凹陷，弯下腰，用脚踩住你，防止你捣乱。毕竟，你还没有受过适当的训练。她那对巨大的乳房像拉长的水滴一样垂下来，尽管尺寸惊人，却只微微下垂。当她的手指抓住她那像鹅卵石一样坚硬的乳头开始拉扯时，一阵涟漪掠过她乳房上乳白色的皮肤，一股琥珀白色的汁液喷涌而出。");
         outputText("[pg]第一股汁液在撞击时溅开。你很幸运，有几滴溅到了你的嘴唇上，你试探性地用舌头舔了舔。太美味了！你舔舐着每一滴飞溅的汁液");
         if(!get_player().hasMuzzle())
         {
            outputText("，完全没有注意到你每吃一滴，似乎就能伸得更远一点");
         }
         outputText("，为了吃到更多，你甚至流下了口水。与此同时，凹陷处被填得越来越满。液体喷涌的声音逐渐减弱，变成最后几滴落在临时碗里的滴答声，伴随着恶魔的一声呻吟。她显然很享受为你准备这顿小点心。");
         outputText("[pg][say: 吃吧，小狗。]她的脚移开了。");
         outputText("[pg]你低头看了看你那根流着口水的肉棒");
         if(int(get_player().cocks.length) > 1)
         {
            outputText("");
         }
         outputText("，然后看了看那滩混着汁液的奶水，接着又看了看你的肉棒，最后再次看向那滩奶水，然后四肢着地");
         if(get_player().hasTailInsteadOfLegs())
         {
            outputText("三肢");
         }
         else if(get_player().isTaur())
         {
            outputText("你的蹄子");
         }
         else
         {
            outputText("四肢");
         }
         outputText("。");
         if(!get_player().isTaur())
         {
            outputText("你手脚并用地爬过去，还不习惯这种移动方式，");
         }
         else
         {
            outputText("你跑过去，前腿跪下");
         }
         outputText("把你的[face]直接埋进魅魔的奶水里。它比普通的奶水更浓稠，也更粘，像蜂蜜一样，但也更甜。这种神仙般的液体充满了你的口腔，带着闪烁的、难以形容的味道，让");
         if(get_player().tail.type != 0)
         {
            outputText("你的尾巴");
            if(get_player().tail.type == 13 && get_player().tail.venom > 1)
            {
               outputText("");
            }
         }
         else
         {
            outputText("你短小的新尾巴");
         }
         outputText("摇晃起来。");
         if(get_player().tail.type != 2)
         {
            outputText("别管它随着你每喝一口变得更长更毛茸茸，或者你的");
         }
         else
         {
            outputText("别管你的");
         }
         outputText("舌头肿胀起来，变得宽大扁平，非常适合喘气、舔舐和喝水。");
         get_player().tail.type = 2;
         outputText("[pg]也许最好，也是最坏的是，尽管你的骨头没有受到关注，你并没有变软。它只是悬挂在你的");
         if(get_player().isPregnant())
         {
            outputText("怀孕的");
         }
         outputText("肚子下，滴着口水");
         if(get_player().hasVagina())
         {
            outputText("，被你被遗忘的性器官分泌的阴道液润滑着");
         }
         outputText("，比以往任何时候都准备好使用，但很顺从……等待着某人，也许是女主人，允许你使用它。现在大部分的奶水都没了，但你的舌头非常适合从泥泞的碗里撬出最后一点蜂蜜色的琥珀。拥有如此有用的肌肉让你有绝佳的机会在喝水时抬头看她。");
         outputText("[pg]为什么她的手在发光？琥珀色能量的光环在她的手周围闪烁。甚至在你的眼角也有这种东西的闪光。也许只是太亮了。无论如何，她在微笑，所以你一定做得很好。你从没想过魅魔会这么好！被踢的疼痛已经消退，你感觉非常“活在当下”。她绝对处于对你的权力地位。也许主人是正确的词。你的嘴角因为这听起来多么正确而翘起。是的，她绝对是你的主人……你的女主人。");
         outputText("[pg]当你在泥土中舔舐女主人粘稠美味的最后一点时，她指尖散发出的光芒闪烁并消退。你舔了舔下巴，品尝着每一滴散落的液体，然后站起来喘气。你把自己交给她真是太幸运了！你发出一声快乐的吠叫告诉她。如果你有办法让她理解你就好了。");
         outputText("[pg][say:好[boy]，]她再次柔声说道，你听到的语气多于语言，听到其中层层叠叠的赞美，明白你让她开心了。你的尾巴兴奋地来回甩动，你顺从的鸡巴");
         if(int(get_player().cocks.length) > 1)
         {
            outputText("跳动着");
         }
         else
         {
            outputText("跳动着");
         }
         outputText("带着准备好的兴奋。一条细细的先列腺液从你体内流出，随着你母狗般的每一次快乐抽动，在你的身后拖在地上-");
         if(get_player().biggestCockLength() >= 12)
         {
            outputText("破坏者");
         }
         else
         {
            outputText("勃起");
         }
         outputText("。你希望她不会介意，但你有预感，她不会介意你变成那种脏兮兮的小狗的。");
         outputText("[pg]魅魔转过身吹了声口哨，拍了拍自己的臀部。[say: 过来吧，我带你去看看你的新家。]");
         outputText("[pg]好耶！你跟在她身后慢吞吞地走着，身子压得很低，在空气中嗅来嗅去。女主人身上有一种非常独特的气味，现在你终于有机会好好品味一下了，那是一种混合了泥土、浆果和性爱的气味。你以前从未闻过类似的味道。其他的气味也引起了你的注意，有些是从侧面的通道飘来的，有些只是地上的痕迹，但你都能察觉到，对它们都很好奇，恨不得跑去看看每一个气味到底是什么。也许在你发现你的新家之后，她会让你去跑一跑。");
         if(get_player().isTaur() || get_player().isDrider())
         {
            outputText("[pg]你跟随的时间越长，你的身体就越是顺从地弯下腰去，到了某个时刻，你甚至开始把手放在路上，将体重转移到手上。同时，你的腰部正在隆起，你的身体正在发生变化，你确信这一点。这种变化起初让你慢了下来，但很快你就能顺利地跋涉前行，");
            if(get_player().isDrider())
            {
               outputText("蹄子发出清脆的哒哒声");
            }
            else
            {
               outputText("蜘蛛爪子发出尖锐的咔哒声");
            }
            outputText("渐渐变成了肉垫爪子几乎无声的拍打。你的手也在发生变化：手指变短，但指甲在变长。皮毛覆盖了它们，你的脊椎也发生了变化，这一切都是为了让你能更轻松地四肢着地跟随。");
         }
         else
         {
            outputText("[pg]你跟得越久，就越容易紧跟在她的脚后跟。");
            if(get_player().isGoo())
            {
               outputText("你黏糊糊的下盘很容易就分成了两条后腿，在你慢吞吞地走着时，有规律地发出湿漉漉的拍打声。");
            }
            else if(get_player().hasTailInsteadOfLegs())
            {
               outputText("你滑行的尾巴抽搐了一下，让你停顿了一秒，但随后它就分成了两条肢体，每一条都比你曾经拥有的[if (isNaga) {蛇|鱼}]形附肢更结实，更像犬类。它们摇摇晃晃了一秒钟，然后就投入了行动。");
            }
            else
            {
               outputText("你的[legs]在你慢吞吞地走着时变短了，在它们变化时让你暂时放慢了速度。你抬起膝盖，这样你就可以再次站在你的[feet]上，只是它们现在变成了柔软的肉垫爪子，尖端长着短指甲。");
            }
            outputText("你的手也紧随其后。首先，手掌上长出了肉垫，让你更容易支撑体重。然后，你的手指变短了。这并不完全是一种令人不快的感觉，因为它让你更容易走向你的家。");
            outputText("[pg]当你走进一座建筑物时，你已经用四条腿轻快地跳跃着了。现在周围有其他几个恶魔和生物。许多人指着你说话，但你听不懂他们在说什么。他们声音中的语气暗示着对女主人的嘲笑或嫉妒，但她的一丝微笑平息了你的担忧。她很高兴！你的尾巴刚才还平放着，现在又开始来回拍打，在你跟随的时候，傻乎乎地拍打在墙上。");
         }
         menu();
         addButton(0,"继续",maleLossPetII);
      }
      
      public function maleLossFeederII() : void
      {
         clearOutput();
         outputText("被困在持续不断却又无法满足的高潮的炼狱循环中，你被拉进了触手的海洋。你的眼睛已经翻白，看不见那个咧嘴笑的女恶魔，也看不见她自信地摇曳的臀部，但如果它们能看见，当扭曲、滴水的藤蔓挡住她时，它们会因为担忧而睁大。饥饿和口渴很快就与快感争夺你的注意力。你肚子的肿胀已经消退，里面的液体早就变成了象牙色的释放喷流。");
         outputText("[pg]一根像你腿一样粗的茎干升起，它的顶端几乎被一个足以吞下整个人的裂口分开，并且");
         if(get_player().biggestCockLength() < 6)
         {
            outputText("迅速吞噬了你微薄的奉献");
            if(int(get_player().cocks.length) > 1)
            {
               outputText("");
            }
         }
         else if(get_player().biggestCockLength() < 12)
         {
            outputText("迅速吞噬了你超大尺寸的肉棒");
            if(int(get_player().cocks.length) > 1)
            {
               outputText("");
            }
         }
         else if(get_player().biggestCockLength() < 24)
         {
            outputText("吞噬了你巨大的奉献");
            if(int(get_player().cocks.length) > 1)
            {
               outputText("");
            }
            outputText("带着坚定的决心");
         }
         else
         {
            outputText("慢慢地包裹住你不断喷射精液的阴茎");
            if(int(get_player().cocks.length) > 1)
            {
               outputText("");
            }
            outputText("展现出非人的弹性");
         }
         outputText("。内部布满了微小蠕动的凸起，一接触到你颤抖的肉棒就开始蠕动起来");
         if(int(get_player().cocks.length) > 1)
         {
            outputText("");
         }
         outputText("。感觉就像每一根神经都有一个熟练的按摩师在给它按摩，从每一寸皮肤中诱导出比你想象中更多的快感。你大叫出声，完全被这感觉淹没，但随即被嘴里熟悉的触感所堵住。");
         outputText("[pg]然而，这根新的触手已经开始高潮了。它用自己黏糊糊的精液作为润滑剂，滑过你毫无抵抗的扁桃体，直接提供赋予生命的汁液。它无法完全与你喷涌而出的巨大、撑满茎干的精液团相抗衡，至少单靠它自己不行。第二根触手蜿蜒而行");
         if(get_player().tail.type != 0)
         {
            outputText("绕过你的尾巴滑行");
         }
         outputText("在你的臀瓣之间。");
         if(get_player().ass.analLooseness == 0)
         {
            outputText("你后庭处女般的紧致起初将触手挡在外面。然而，在滑腻的植物汁液和不断的压力面前，它还是败下阵来。");
         }
         else if(get_player().ass.analLooseness <= 3)
         {
            outputText("触手几乎毫不费力地滑入你紧致的后庭，因为它被汁液润滑，并且有着持续的压力。");
         }
         else
         {
            outputText("触手几乎毫不费力地挤进你已经很松弛的屁股。即使没有持续、坚定的压力和滑腻的汁液，它也能轻松进入。");
         }
         outputText("你喘息着，感受着一个入侵者在你最深处的通道中蠕动时那种奇怪的室温感。这完全出乎意料，但一旦它的体积滑过你的前列腺，从你全神贯注的身体中挤出更大的精液团，你就会原谅它的入侵。");
         outputText("[pg]与你嘴里的触手完美同步，插在你屁股里的那根也释放了它那浓稠的汁液。当然，这只会将你的快感推向新的高度，同时为你提供不断产出新鲜的");
         if(get_player().balls == 0)
         {
            outputText("前列腺");
         }
         else
         {
            outputText("睾丸");
         }
         outputText("排空植物养料的喷射物所需的一切。摇篮般的藤蔓在你因触摸而敏感的皮肤上蠕动，摩擦着你的全身。感觉就像你的整个存在都在被操");
         if(get_player().hasVagina())
         {
            outputText("，一旦一根粗大的、阴茎状的植物滑入你的[vagina]，你就真的被操了");
         }
         outputText("。");
         if(get_player().hasFuckableNipples())
         {
            outputText("[pg]摩擦你[nipples]的藤蔓很快就发现了它们漏水的、具有容纳能力的秘密，并钻了进去。如果你的嘴没有被完全塞满，你一定会向天空尖叫你对这个奇妙生物的爱。相反，你只是呜咽着，迎合着高潮，在喷涌的欲望海洋上体验着微小的乳头高潮。你的胸部被一根接一根的触手玩弄着。有时一根会退出，让另一根进入。有时两根会同时操你的奶子，在你体内互相摩擦。但你从未空虚超过一秒钟，你的乳头就像这些贪得无厌的怪物的玩具。");
         }
         else if(get_player().isLactating())
         {
            outputText("[pg]一旦你的乳汁流出，一对吸盘就会降落在你的[nipples]上，开始拉扯。它们的内部柔软而黏糊糊的，有点像小嘴巴，这让你喷射得更厉害，为它们提供大量乳酸兴奋的汁液。不幸的是，你的乳头不受触手汁液的影响，最终会干涸。但这并不能阻止它们尝试吸吮，随着时间的推移，你的奶子会适当地习惯它们的新职责。");
         }
         outputText("[pg]逃跑的念头在冲刷着你的快感浪潮中飘散。你的其他想法和担忧也紧随其后。腐化的元素和无休止的高潮确保你再也不会费心去思考或担忧。幸运的是，人类的大脑具有适应性，曾经处理数学或阅读等事情的部分会重组，以处理来自神经系统的额外输入。你在那里待得越久，感觉就越好。");
         outputText("[pg]你永远不想离开。事实上，你再也不想了。");
         get_game().gameOver();
      }
      
      public function maleLossFeeder() : void
      {
         clearOutput();
         outputText("[say: 我……我会和触手玩的，]你喘息着说，既是对魅魔说，也是对自己说，终于接受了你这可耻的处境。不知为何，被迫无休止地高潮似乎比像狗一样被拴着爬行要稍微体面一些。你告诉自己，你只需等待时机——等待一个机会，从藤蔓无休止的蠕动中挣脱出来。你下定决心，即使输掉了这场战斗，也绝不放弃。");
         outputText("[pg]魅魔的嘴唇残忍地卷起。[say: 哦。你还以为你有机会逃跑，是吗？]她仰起头大笑起来。[say: 你大错特错了，勇者。你大错特错了……]迷人的园丁转向植物墙，背对着你，让你一览无遗地欣赏她那曲线优美的臀部。");
         outputText("[pg]有什么光滑的东西缠住了你的[leg]，动作缓慢而耐心，却蕴含着巨大的力量。你能感觉到它的抓握越来越紧，同时第二根也缠了上来。这两根触手以交替的螺旋状缠绕着你的身体，在自带润滑液的帮助下，在你的[skinFurScales]上滑动。你试图挣扎着逃开，但这些触须只是像孩子举起玩具一样把你举到了半空中。与此同时，魅魔只是轻轻弹了一下");
         if(int(get_player().cocks.length) > 1)
         {
            outputText("[oneCock]。");
         }
         else
         {
            outputText("你的鸡巴。");
         }
         outputText("[pg][say: 真好笑，你似乎认为在这个时候你还能对自己的生活有任何掌控权。]她笑着说。[say: 如果你放松点，接下来的事情会容易得多。]");
         outputText("[pg]一根绿色的藤蔓出现在你面前，在你开口询问之前就回答了你的问题。它离你太近了，你不得不斗鸡眼才能看清它，那略微膨胀的圆形尖端正朝着你的嘴唇卷曲。糖浆般的湿润液体覆盖了它的整个尖端，顺着它的长度滴落下来。你看不见任何明显的开口；也许它分泌出了这种散发着甜味的汁液？还没等你细想这意味着什么，它就以足以强行撬开你下巴的力量压进了你的嘴里。你对它的突然插入毫无防备，这显然让情况变得更糟。");
         outputText("[pg]这味道……哦，天哪，这味道！完全出乎意料！这味道比情人的吻还要甜美，比最顶级的巧克力还要美味。你的嘴里充满了神仙般的幸福感，你立刻吸吮起这个球状的入侵者，尽可能多地吸下那蜂蜜般的粘液。你的舌头深情地舔舐着触须的下侧，就在这时，它分泌出了更多的粘液。感觉就像是有一个地方打开了，释放出更多美味的粘液。随着每一次吸吮，更多的粘液喷射到你的上颚。");
         outputText("[pg]魅魔用指尖抚摸着你的脖子和下颌线，轻柔地解释道：[say: 你这么享受的这些液体？不言而喻，它们是腐化的……但在尝过之后，你现在真的想离开它们吗？]她调皮地抚摸着触手，让你得到了一股浓稠的粘液喷射。[say: 你真的能停止吸吮这个吗？]");
         outputText("[pg]你……你不确定。你大口大口地吞咽着那美味的粘液，以争取时间思考。它不仅尝起来很美味；在你的肚子里也感觉很好。它以食物永远无法做到的方式填满了你。那种愉悦感从你慢慢被填满的肠胃中辐射开来。它们让你的[skin]似乎充满了原始的能量，尤其是在你的胯部。你无法忽视[eachCock]肿胀的方式，也无法忽视潮湿的空气吹过它时那种美妙的感觉。");
         outputText("[pg]她的手指顺着");
         if(int(get_player().cocks.length) == 1)
         {
            outputText("它");
         }
         else
         {
            outputText("其中一根");
         }
         outputText("抽动的长度滑下，魅魔咯咯地笑了起来。[say: 你感觉到了吗？你能感觉到你的身体里充满了精液吗？我想我应该提一下的，对吧？]她的手指又顺着另一个方向滑了回去，你的肌肉收缩，从你的鸡巴里挤出一大滴先列腺液，滴落下来打在");
         if(get_player().biggestTitSize() >= 3)
         {
            outputText("你的乳房下侧");
         }
         else
         {
            outputText("你的下巴上");
         }
         outputText("。你因渴望而呜咽。这是不可能不这样的。见鬼，你的[cocks]");
         if(int(get_player().cocks.length) == 1)
         {
            outputText("是");
         }
         else
         {
            outputText("是");
         }
         outputText("紧绷着，如果你有任何可以支撑的东西，你一定会立刻挺腰插进你能找到的第一个洞里。");
         outputText("[pg]你用恳求的目光抬头看着这位美丽的女人，你被捆绑着，浑身湿透，无助且极度兴奋。更多的触手将你的手臂紧紧缠在身体两侧，而她则在打量你的处境。她的手从你的肉棒上移开，但你嘴里的触手开始抽插，将一股股天堂般的汁液射进你的喉咙。这种处境有一种难以言喻的情色感——你被悬挂在那里，无助地被灌满了堕落的、让阴茎充血的化学物质，让你身体的每一个部位都变得奇妙地敏感。");
         outputText("[pg]一阵微风拂过你的[leg]，魅魔随手脱下了你的[armor]。感觉就像涂了油的指尖滑过你的肌肤。你的[nipples]就像通电的电线，而你的[cocks]……好吧，你现在正流出浓稠的、拉丝的先列腺液，这种感觉介于被好好舔弄和高潮本身之间。你的嘴唇被触手的体液弄得湿滑，并且像性器官一样刺痛。你紧紧闭上嘴唇，呻吟着，咕噜着，吞咽着。乞求更多的尝试已经消失了。这已经足够了，如果继续下去，不管有没有抚摸，你都会高潮的。");
         if(get_player().balls == 0)
         {
            outputText("[pg]你核心深处那种熟悉的紧绷感依然存在，但并没有立刻达到高潮，感觉反而更加强烈了。它就像一种你无法抓挠的痒，让你心烦意乱。你的身体紧绷得像一根被拧紧的发条，最终突然断裂，让你的肌肉陷入无法控制的痉挛，挤压并摩擦着你体内肿胀的东西。紧紧夹住它的感觉好得令人发指，让你流出更浓稠的先列腺液。你在束缚中扭动，而水流变得更粗，你的痉挛变成了一种稳定的颤动。很明显，你的前列腺正在变大，但这感觉太好了，你根本无暇顾及。");
         }
         else
         {
            outputText("[pg]你的[balls]依然紧绷，你的[sack]紧贴着你的胯部，但并没有立刻达到高潮，感觉反而更加强烈了。紧绷感过了一会儿就放松了，取而代之的是一种不熟悉的沉重感，这只会提醒你里面正在积聚的负荷。事实上，你发誓你能感觉到某种液体在那里翻滚，就像你的每一次心跳都在不知不觉中将越来越多的精液泵入你的[balls]。你的理智告诉你这是不可能的，但你肿胀的阴囊那令人难以置信的饱满感却证明了相反的情况。");
            if(get_player().ballSize > 15)
            {
               outputText("值得庆幸的是，几根触手缠绕在巨大的球体下方，帮助支撑它们。");
            }
         }
         outputText("[pg]你快乐地对着嘴里的触手咕噜咕噜地叫着，弓起背，射出了你强化后的第一股巨大的精液");
         if(get_player().biggestTitSize() >= 3)
         {
            outputText("喷得你满身都是");
         }
         else
         {
            outputText("直接喷到了下面的泥土上");
         }
         outputText("。这还不够！你太满了，你太需要高潮了。下一次喷射更像是精液的消防水龙带，但这也不够。是的，你正在高潮，但这并不能满足你。你需要射更多！更猛烈！每一次连续喷射的浓稠精液都会造成更大的混乱，但你体内似乎总有更多的精液等着出来。你看起来更像是一个精液瀑布而不是一个英雄，你再次咕噜咕噜地乞求更多。");
         outputText("[pg]你嘴里的触手拔了出来，不过在此之前你还是设法最后吸了一口。你甚至没有意识到汁液把你的肚子撑得有多么淫秽——你的注意力太集中在其他地方了。你唯一意识到的是你自己声音中那喘息的、哀怨的声音，你开始利用它，语无伦次地乞求更多。");
         outputText("[pg]魅魔大笑着，用一只手托住你喷泉般的肉棒");
         if(int(get_player().cocks.length) > 1)
         {
            outputText("");
         }
         outputText("。 [say: 哦，你很快就会有更多的：更多的快感……更多的汁液……以及多到你不知道该怎么办的高潮。你会成为我宠物的优质肥料。莉希丝会很高兴的。] 她舔了舔那雪白的美味，叹了口气。 [say: 确实很高兴。它比我想象的还要浓郁。] 她停顿了一下，似乎在考虑什么，然后摇了摇头。 [say: 也许我以后会用到你。现在，我想你很渴望我宠物的关注。你们为什么不认识一下呢？]");
         menu();
         addButton(0,"继续",maleLossFeederII);
      }
      
      public function maleLoss(param1:Boolean) : void
      {
         clearOutput();
         outputText("你倒在地上，感到挫败和屈辱");
         if(param1)
         {
            outputText("，甚至无法用[feet]撑起你伤痕累累的身体。");
         }
         else
         {
            outputText("，你太兴奋了，根本无法阻止自己的双手冲向胯部。何必呢？");
         }
         outputText("[pg][say: 噢，强大的勇者终于倒下了吗？想想看，那个摧毁了我们工厂设施的人，竟然会败给简单的触手灌木和一个低贱的魅魔。] 她走到你面前，臀部愉悦地扭动着。她的脚踩在你的胯部，隔着你的[armor]摩擦你的[cock]，看着你在她的抚摸下扭动，她的眼睛闪烁着光芒。[say: 嗯……你是想做我的小宠物狗呢？还是想被我用皮带牵着在花园里散步？或者你觉得这个]——她更用力地踩在你的胯部——[say: 会是我其他宠物的好蛋白质来源？] 她指着附近一根触手流着口水的裂口，微笑着说。[say: 哪个对我来说都挺好。]");
         outputText("[pg]你呜咽着，不受欢迎的欲望抹杀了一切其他想法，她甚至懒得用手或嘴，只是这样玩弄你。这两个主意都有各自的吸引力。你很确定她的任何宠物都能经常得到交配的机会，但话又说回来，被交给触手束缚并被榨取一辈子，会让你忘记在这里的失败。老实说，在她的脚跟下，你甚至很难想起你一开始为什么要来这里。你只是很高兴能感受到她完美无瑕的肌肤在摩擦你，不管她是不是漫不经心。");
         outputText("[pg]魅魔停了下来，疑惑地看着你。很明显，她在等你的回答。你选择什么？");
         menu();
         addButton(0,"宠物",maleLossPet);
         addButton(1,"喂食者",maleLossFeeder);
      }
      
      public function leaveHer() : void
      {
         clearOutput();
         outputText("你觉得魅魔的宠物能让她一直忙下去，于是你转身离开。一声愉悦的尖叫吸引了你的注意，你转过身，正好看到几十个盘绕的、长满叶子的团块缠绕着她的四肢，把她整个人带进了一堵由扭曲的、流着液体的肉棒和小穴组成的墙里。她的每一个孔洞都被抽插的肉棒塞满，上面沾满了唾液和淫液，她的眼睛里充满了惊恐和兴奋，在消失在绿色的森林中之前，她的眼睛睁得大大的。");
         FlagDict_Impl_.arrayWriteInt(KFLAGS.flags,1249,1);
         menu();
         get_combat().cleanupAfterCombat(get_game().dungeons.resumeFromFight);
      }
      
      public function gardenerLeft() : Boolean
      {
         if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,1249) == 1)
         {
            return true;
         }
         return false;
      }
      
      public function gardenerKilled() : Boolean
      {
         if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,1249) == 3)
         {
            return true;
         }
         return false;
      }
      
      public function gardenerFucked() : Boolean
      {
         if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,1249) == 2)
         {
            return true;
         }
         return false;
      }
      
      public function gardenerDefeated() : Boolean
      {
         if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,1249) > 0)
         {
            return true;
         }
         return false;
      }
      
      public function fuckUpTheGardener(param1:Boolean) : void
      {
         clearOutput();
         outputText("魅魔跪倒在地，抓起一根触手，用力地将其塞进自己淫荡的小穴里，那力道大得让你都忍不住皱眉。但她似乎并不在意，事实上，她的嘴唇张成了一个无声的“o”形，满脸愉悦，开始在上面前后摇晃，完全沉浸在自己的欲望中。她现在根本无暇顾及你，更别提阻止你前进了。见鬼，她大概要和这些触手忙活很久很久了。你觉得你或许可以试着利用一下她的小嘴，但周围有太多触手靠得太近了。最好还是继续前进，或者干脆利落地解决她。");
         menu();
         addButton(0,"解决她",endHer);
         addButton(1,"离开",leaveHer);
         addButton(2,"操她",tentaFail);
      }
      
      public function femGenderlessLossII() : void
      {
         clearOutput();
         outputText("你并没有跌落很远。一层交织的植物垫在你受到任何伤害之前就接住了你，将你几乎水平地托在肥沃的壤土上方。空气中弥漫着一丝咸咸的汗味。你无法完全辨认出那是什么味道，不过话又说回来，你也没有时间去辨认。花肉般的带子正环绕着你的手臂和[legs]。它们并不紧绷。事实上，它们甚至有些让人感到舒适——就像被爱人的双臂环抱一样。当然，这些手臂完美地贴合着你的肉体，从四面八方压迫着你。");
         outputText("[pg]随着触手适应了你在它们中间的存在，周围变得暗了下来。那些没有积极在你[skinFurScales]上滑动的触手再次伸直，挡住了阳光和温暖，这也许是你最后一次感受到阳光了。光滑湿润的植物带滚过你的肩膀和[chest]，就像刚才包裹你的四肢一样将它们包裹起来。一条细带滑过你的锁骨，像一条临时的项圈一样缠绕在你的脖子上，紧得让人无法忽视，但又松得足以让你呼吸。");
         outputText("[pg]液体滴落在你的[vagina]上");
         if(get_player().hasCock())
         {
            outputText("和[cocks]上");
         }
         outputText("，带来一种异样的湿润感。藤蔓的润滑液在你的皮肤上出奇地温暖，那种液体顺着你的[butt]缝流下，滑过你[asshole]的感觉出奇地令人愉悦。");
         if(get_player().isBiped())
         {
            outputText("你的[legs]被缓缓分开，但你又有什么理由阻止它们呢？你已经湿透了，如果张开双腿是缓解你渴望的下一步，那就随它去吧。");
         }
         outputText("你的[clit]现在看起来一定像一根");
         if(get_player().getClitLength() > 6)
         {
            outputText("闪闪发光、浸满精液的肉棒");
         }
         else if(get_player().getClitLength() > 3)
         {
            outputText("小巧的、沾满精液的阴茎");
         }
         else if(get_player().getClitLength() > 1)
         {
            outputText("肿胀的、涂满润滑液的肉球");
         }
         else
         {
            outputText("闪闪发光的粉色靶心");
         }
         outputText("了。你尽可能地扭动着[hips]。你那欲火焚身的小穴至今还没有得到触手的爱抚，尽管它是最渴望得到爱抚的部位。");
         outputText("[pg]翠绿色的铁环勾住你扭动的臀部，将其固定。这些铁环不像绑在其他地方的柔软缓冲带。那些只是适度坚固，而这些则是毫不留情的束缚。它们是固定而不是引导。你胯部的扭动停止了，但你的需求却没有得到满足。你发出一声不满的叫喊，但也被一条粗大的、撑开嘴唇的触须堵住了，它把你的下巴撑开。你无法说话。你甚至无法挺动。你所能做的就是挂在那里，任由汁液滴落，而你的嘴慢慢被填满。");
         outputText("[pg]你舌头上的味道，既有堵住你的茎秆的味道，也有它分泌的液体的味道，就像从地下散发出来的气味一样，又咸又甜。如果你不是用你那空虚得发疼的小穴在思考，你可能会意识到这里的土壤被精液浸透得有多厉害，但相反，你正在吞咽着满嘴被污染的触手汁液，并不断滴落。你吞咽得越多，你的[vagina]滴落得就越多，你进行理性思考的能力就越弱。你就像一个喷涌着淫液的泉眼，一个滴着水、湿漉漉的海绵女孩，她将不断溢出汁液，直到她芬芳的私处引诱某人给她显然需要的填充物。");
         outputText("[pg]你的[vagina]爆发出一阵久违的快感，将汁液喷射到空中，因为有什么粗大温暖的东西猛地冲过它欢迎的大门，深深地插入它渴望精液的通道。");
         get_player().cuntChange(get_player().vaginalCapacity() * 1.25,true,true,false);
         outputText("从完全空虚到完全充实的转变震撼了你世界的根基。被阴茎塞满，被肉棒填满，这种感觉是如此的正确，以至于你无法想象以任何其他方式存在。你吞咽时喉结上下滚动，你高兴地发出咕噜声并放松下来。原本比钢丝弹簧还要紧绷的肌肉松弛下来。不需要采取任何行动；你喷涌的洞穴终于被填满了，你的整个身体都被你非人类情人看似无限的手臂所拥抱。");
         outputText("[pg]你的[vagina]紧紧地贴着粗壮的入侵者。那根闪闪发光、沾满淫液的茎秆的大小似乎非常适合让你的阴唇保持舒适的伸展。也许是因为你正在大口吞咽着掺有催情剂的精液，但你感觉不到一丝疼痛。你的小穴因狂喜而发热。你闭上眼睛，自愿放弃其他感官，以便专注于阴道神经有节奏的拨动。这种快感是如此正确……如此完美，以至于你忍不住用舌头舔舐嘴里的触手，并运用被遗忘的阴道肌肉，试图用你唯一能做到的方式说声谢谢。");
         if(get_player().hasCock())
         {
            outputText("[pg][EachCock]，长期被忽视，跳动着灰白色的欲望之带，被感觉像是定制的套筒猛地套住。你能听到它吸吮你长度时发出的嘈杂的吸溜声");
            if(int(get_player().cocks.length) > 1)
            {
               outputText("");
            }
            outputText("盖过了你小穴里发出的刺耳的挤压声，这两种感觉结合成了一场压倒性的感官数据暴乱。你正在以两种不同的、不一致的节奏操和被操，完全无法理解。");
         }
         outputText("[pg]更多的精液溅在你女性私处的外部，片刻之后，一个外壳包裹住了你的[clit]。");
         if(get_player().getClitLength() > 6)
         {
            outputText("它在阴茎大小的阴蒂周围伸展了一些");
         }
         else if(get_player().getClitLength() > 3)
         {
            outputText("它毫不费力地处理你超大号的阴蒂");
         }
         else
         {
            outputText("你小巧的阴蒂似乎被包裹它的管子显得相形见绌");
         }
         outputText("，但这并没有让它感觉不那么美妙。它在你的阴蒂周围轻轻地跳动，起伏和挤压，有节奏地将电击般的快感一波又一波地抽打进你疯狂的身体。");
         outputText("[pg]蹂躏你蜜壶的肉矛颤抖着慢了下来，然后猛地一挺，足以震撼你的身体");
         if(get_player().biggestTitSize() > 2)
         {
            outputText("并让你的乳房晃动");
         }
         outputText("，紧紧地压在你的子宫颈上，最后爆发，用一层厚厚的滚烫的种子涂满你的内壁。如果你的喉咙没有被植物阴茎塞得那么满，你可能会呻吟或呜咽。相反，你的眼睛在颤动的眼睑下翻白，露出一条狭窄的眼白，因为你失去了所有的控制。你的身体像癫痫发作一样颤抖，除了下半身的肌肉。它们正忙着收缩和挤压长长的入侵者，榨取每一滴充满欲望的精液");
         if(get_player().isPregnant())
         {
            outputText("溅在你被占据的子宫上。");
         }
         else
         {
            outputText("填满你的子宫，让它孕育生命，这样其他人就能感受到你现在的感觉了。");
         }
         outputText("[pg]你的淫液喷涌而出，溅落在地上。");
         if(get_player().wetness() < 4)
         {
            outputText("你平时可能无法体验到如此湿润的高潮，但这似乎对你来说无关紧要。");
         }
         outputText("你现在就像一个喷泉，只适合高潮和接受精液。这个想法在第一波高潮的余韵中引发了第二次高潮，而那根已经射完的触手也退了出去。");
         outputText("[pg]另一根更大的触手取而代之，将第一根触手的大部分精液封在里面。没有等待，只有不断的抽插和一次接一次的高潮。高潮之间的间隔越来越短，直到你的世界变成了一片持续不断、无法抗拒的极乐狂潮。");
         get_game().gameOver();
      }
      
      public function femGenderlessLoss(param1:Boolean) : void
      {
         clearOutput();
         outputText("你倒在地上，感到挫败和屈辱");
         if(param1)
         {
            outputText("，甚至无法用[feet]撑起你伤痕累累的身体。");
         }
         else
         {
            outputText("，你太兴奋了，根本无法阻止自己的双手伸向你那饥渴的胯部。");
         }
         outputText("[pg][saystart]这么快就倒下了？曾经不可一世的勇者终于迷失在这片土地的腐化之中了吗？谁能想到那个");
         if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,2024) == 2)
         {
            outputText("摧毁了");
         }
         else
         {
            outputText("关闭了");
         }
         outputText("我们工厂的人，竟然会倒在一个简单的魅魔和她低贱的花园面前？[sayend] 她大步走到你面前，臀部愉悦地扭动着，跪在你身边，手抚摸着你的腹部，就像一个女孩第一次抚摸她的新宠物一样。[say:你在我的花园里会很有用的！]");
         outputText("[pg]她的花园？");
         if(!param1)
         {
            outputText("你偷偷瞥了一眼那些扭动的藤蔓。");
            if(get_player().hasVagina())
            {
               outputText("你的内衣已经被渴望浸透了，但看着那些急切的藤蔓扭动，还是让你流出了新的淫液，顺着你的[legs]流下。");
            }
            else
            {
               outputText("你已经很饥渴了，但你发现自己希望自己有个小穴，这样你就能让更多的藤蔓进入你的身体。");
            }
         }
         else
         {
            outputText("你担忧地看了一眼那些扭动的藤蔓。它们看起来很急切，但现在却按兵不动，也许是在等它们的女主人完事。不……你不能就这样倒下！");
         }
         outputText("[pg]魅魔一件一件地轻轻脱下你的[armor]，娇嗔道：[say:你现在期待了吗，[name]？被完完全全地拥抱，每一个洞都被跳动、急切的肉棒填满？] 她抚摸着你的脸颊，如果不是恶魔，你可能会把这个动作误认为是爱意。");
         if(get_player().hasVagina())
         {
            outputText("违背了你更好的判断力，你开始因为她的话语而湿润。你知道你将被送入一个永无止境的性刺激地狱，但你无法阻止你身体的性欲对这个想法产生反应。");
         }
         outputText("[say:是啊，你想要的，对吧？] 纤细的手指灵巧地按压着你的");
         if(!get_player().hasVagina())
         {
            outputText("裸露的胯部，陷入了一道刚才还不存在的缝隙中。她熟练的触摸和黑暗的力量像雕塑家的黏土一样塑造着你的身体，在你的胯部雕刻出一个华丽的小穴，同时让它变得湿漉漉的。");
            get_player().createVagina();
         }
         else
         {
            if(get_player().wetness() <= 2)
            {
               outputText("湿润的");
            }
            else
            {
               outputText("浸透的");
            }
            outputText("缝隙，你只能强忍着不叫出声来，也不去迎合她的动作。");
         }
         outputText("[pg]魅魔漫不经心地把玩着你的[vagina]，时不时用拇指摩擦");
         if(get_player().balls > 0)
         {
            outputText("你的[sack]，");
         }
         else if(get_player().hasCock())
         {
            outputText("你的[cock]底部，");
         }
         else
         {
            outputText("你的[clit]，");
         }
         outputText("大声吐露道：[say: 说实话，我有点嫉妒你。]");
         outputText("[pg]她的手指深深探入你的湿润之中，你呻吟着作为回应。");
         outputText("[pg][say: 你将去往一个没有烦恼……没有焦虑……只有……快感的地方。] 最后一部分从她唇间溢出，化作一声轻喘的低语。[say: 也没有担忧或恐惧。我看着它们带走其他奴隶。就像看着一位大师级吟游诗人拨弄他最爱的鲁特琴。只不过，那不是灵巧的手指拂过紧绷的琴弦，而是滑腻的触手从你青春的身体里诱出每一丝极乐。] 她叹了口气。[say: 噢，要是我能摆脱我的职责就好了。我会毫不犹豫地加入你。]");
         outputText("[pg]你向后弓起身体迎合她的手掌，一声呜咽的[say: 是的，]从你唇间挤出。");
         outputText("[pg]魅魔悲伤地笑了笑，把手指抽了出来。你自己的透明润滑液在她的手指和你湿润的小穴之间拉出了一张网，悬停了片刻，然后断裂了。[say: 你会成为我宠物们的好母亲的，我就是知道。]她用一只手臂搂住你的肩膀，把你拉到你的[feet]上。[say: 现在，让我们给你想要的，亲爱的。]");
         outputText("[pg]你被带到了藤蔓墙的边缘。它们互相缠绕扭动，处于持续不断的、渴望的运动中，表明它们对你狂热的渴求，但它们依然克制着。它们的主人显然训练过它们要表现得像绅士一样……至少目前是这样。");
         outputText("[pg]突然，支撑你的手臂消失了，你被向前推去，直直地跌入藤蔓网中……");
         menu();
         addButton(0,"继续",femGenderlessLossII);
      }
      
      public function endHer() : void
      {
         clearOutput();
         outputText("你绕到她身后，趁她忙着对付她的宠物时结束了她的邪恶，然后转身离开。当你回头看时，她的身体已经不见了。除了空荡荡的小路，什么也没留下。");
         FlagDict_Impl_.arrayWriteInt(KFLAGS.flags,1249,3);
         menu();
         get_combat().cleanupAfterCombat(get_game().dungeons.resumeFromFight);
      }
   }
}

