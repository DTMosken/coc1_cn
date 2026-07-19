package classes.scenes.places
{
   import classes.BaseContent;
   import classes.CoC;
   import classes.ImageManager;
   import classes.ItemSlot;
   import classes.ItemType;
   import classes.Player;
   import classes.SelfDebug;
   import classes.StatusEffects;
   import classes.Time;
   import classes._FlagDict.FlagDict_Impl_;
   import classes.display.SpriteDb;
   import classes.globalFlags.KFLAGS;
   import classes.internals.Utils;
   import classes.items.Consumable;
   import classes.saves.SelfSaving;
   import classes.scenes.Camp;
   import classes.scenes.Inventory;
   import classes.scenes.dungeons.deepCave.ValaScene;
   import classes.scenes.places._TelAdre.SaveContent;
   import classes.scenes.places.telAdre.AuntNancy;
   import classes.scenes.places.telAdre.BakeryScene;
   import classes.scenes.places.telAdre.Brooke;
   import classes.scenes.places.telAdre.CarpentryShop;
   import classes.scenes.places.telAdre.Cotton;
   import classes.scenes.places.telAdre.Dominika;
   import classes.scenes.places.telAdre.Edryn;
   import classes.scenes.places.telAdre.Frosty;
   import classes.scenes.places.telAdre.Gym;
   import classes.scenes.places.telAdre.Heckel;
   import classes.scenes.places.telAdre.Ifris;
   import classes.scenes.places.telAdre.Jasun;
   import classes.scenes.places.telAdre.JewelryShop;
   import classes.scenes.places.telAdre.Katherine;
   import classes.scenes.places.telAdre.KatherineEmployment;
   import classes.scenes.places.telAdre.KatherineThreesome;
   import classes.scenes.places.telAdre.Kittens;
   import classes.scenes.places.telAdre.Library;
   import classes.scenes.places.telAdre.Loppe;
   import classes.scenes.places.telAdre.Lottie;
   import classes.scenes.places.telAdre.Maddie;
   import classes.scenes.places.telAdre.Niamh;
   import classes.scenes.places.telAdre.PabloScene;
   import classes.scenes.places.telAdre.Rubi;
   import classes.scenes.places.telAdre.Scylla;
   import classes.scenes.places.telAdre.SexMachine;
   import classes.scenes.places.telAdre.UmasShop;
   import classes.scenes.places.telAdre.VictoriaTailorShop;
   import classes.scenes.places.telAdre.WeaponShop;
   import classes.scenes.places.telAdre.YaraPiercingStudio;
   import classes.scenes.places.telAdre.YvonneArmorShop;
   import coc.view.CoCButton;
   import flash.Boot;
   import haxe.ds.IntMap;
   
   public class TelAdre extends BaseContent implements SelfDebug, SelfSaving
   {
      
      public var yarasShop:YaraPiercingStudio;
      
      public var weaponShop:WeaponShop;
      
      public var vala:ValaScene;
      
      public var umasShop:UmasShop;
      
      public var tailorShop:VictoriaTailorShop;
      
      public var sexMachine:SexMachine;
      
      public var scylla:Scylla;
      
      public var saveVersion:int;
      
      public var saveName:String;
      
      public var saveContent:SaveContent;
      
      public var rubi:Rubi;
      
      public var pablo:PabloScene;
      
      public var niamh:Niamh;
      
      public var maddie:Maddie;
      
      public var lottie:Lottie;
      
      public var loppe:Loppe;
      
      public var library:Library;
      
      public var kittens:Kittens;
      
      public var katherineThreesome:KatherineThreesome;
      
      public var katherineEmployment:KatherineEmployment;
      
      public var katherine:Katherine;
      
      public var jewelryShop:JewelryShop;
      
      public var jasun:Jasun;
      
      public var ifris:Ifris;
      
      public var heckel:Heckel;
      
      public var gym:Gym;
      
      public var globalSave:Boolean;
      
      public var frosty:Frosty;
      
      public var edryn:Edryn;
      
      public var dominika:Dominika;
      
      public var cotton:Cotton;
      
      public var carpentryShop:CarpentryShop;
      
      public var brooke:Brooke;
      
      public var bakeryScene:BakeryScene;
      
      public var auntNancy:AuntNancy;
      
      public var armorShop:YvonneArmorShop;
      
      public function TelAdre()
      {
         if(Boot.skip_constructor)
         {
            return;
         }
         globalSave = false;
         saveVersion = 1;
         saveName = "Tel\'Adre";
         saveContent = new SaveContent(null);
         yarasShop = new YaraPiercingStudio();
         weaponShop = new WeaponShop();
         tailorShop = new VictoriaTailorShop();
         umasShop = new UmasShop();
         jewelryShop = new JewelryShop();
         carpentryShop = new CarpentryShop();
         armorShop = new YvonneArmorShop();
         kittens = new Kittens();
         vala = new ValaScene();
         sexMachine = new SexMachine();
         scylla = new Scylla();
         rubi = new Rubi();
         pablo = new PabloScene();
         niamh = new Niamh();
         maddie = new Maddie();
         lottie = new Lottie();
         loppe = new Loppe();
         library = new Library();
         katherineThreesome = new KatherineThreesome();
         katherineEmployment = new KatherineEmployment();
         katherine = new Katherine();
         jasun = new Jasun();
         ifris = new Ifris();
         heckel = new Heckel();
         gym = new Gym();
         frosty = new Frosty();
         edryn = new Edryn();
         dominika = new Dominika();
         brooke = new Brooke();
         bakeryScene = new BakeryScene();
         auntNancy = new AuntNancy();
         super();
         cotton = new Cotton();
      }
      
      public function watchUrtaBeABadass() : void
      {
         clearOutput();
         get_game().urta.urtaSprite();
         outputText("你挤过魁梧的半人马，无视附近狼和猎犬的" + (get_noFur() ? "毛茸茸的尾巴" : "粗糙的皮毛") + "，任由" + (get_noFur() ? "它们" : "它") + "擦过你，然后挤到人群的中心。最终人群散开，露出了正在交战的双方。一只咆哮的狼，将近八英尺高，耸立在" + (get_urtaDisabled() ? "拉尼斯" : "乌尔塔") + "上方。" + (get_urtaDisabled() ? "魁梧的狗人" : "相对娇小的狐狸女人") + "穿着轻便的皮甲，汗流浃背。体型较大的狼人摇摇晃晃，他的" + (get_noFur() ? "衣服被鲜血浸透了" : "深棕色的皮毛被鲜血粘结在一起") + "。[pg]");
         outputText("体型较大的犬科动物咆哮着冲了过来，伸出了爪子。" + (get_urtaDisabled() ? "拉尼斯" : "乌尔塔") + "侧身避开并转身，" + (get_urtaDisabled() ? "他" : "她") + "的惯性带动" + (get_urtaDisabled() ? "他" : "她") + "的脚狠狠地踢了出去。" + (get_urtaDisabled() ? "他" : "她") + "的脚重重地踢在野兽膝盖的侧面，足以让它弯曲，狼发出一声痛苦的嚎叫，跪倒在地。" + (get_urtaDisabled() ? "拉尼斯" : "乌尔塔") + "滑到他的手臂下并扭动，将他的倒下变成了一次摔倒。野兽沉重的身体猛地撞在鹅卵石街道上，扬起了一阵灰尘。[pg]");
         outputText("现在它动弹不得了，你可以更好地观察这个战败的对手，你对你所看到的感到");
         if(get_player().hasStatusEffect(StatusEffects.Infested))
         {
            outputText("兴奋");
         }
         else if(get_player().cor < 50)
         {
            outputText("恐惧");
         }
         else
         {
            outputText("困惑");
         }
         outputText("。一对粗壮的恶魔之角向后弯曲，穿过它那像狼一样的耳朵底部。它全身覆盖着起伏的肌肉，让你对它的力量深信不疑。即使膝盖断了，这个狼人也明显处于发情状态：从肿胀的包皮中伸出，他巨大的狗鸡巴完全勃起，呈纯黑色，带着一个肿胀的肉结。白色的小蠕虫在他的阴茎表面爬行，从顶端蠕动出来，顺着长度往下爬，在它们身后留下粘液的痕迹。[pg]");
         outputText((get_urtaDisabled() ? "拉尼斯" : "乌尔塔") + "跪在这只被腐化的狼的喉咙上，切断了它的空气，它在" + (get_urtaDisabled() ? "他" : "她") + "身下口吐白沫并挣扎着。带着冷酷的决心，" + (get_urtaDisabled() ? "他" : "她") + "将这只虚弱的、被恶魔污染的狼压在" + (get_urtaDisabled() ? "他" : "她") + "身下，将" + (get_urtaDisabled() ? "他" : "她") + "全身的重量都压在" + (get_urtaDisabled() ? "他" : "她") + "的膝盖上以压制它。它挣扎了似乎很久，但最终这只被污染的狼翻了翻白眼，闭上了眼睛。" + (get_urtaDisabled() ? "拉尼斯" : "乌尔塔") + "点点头站了起来，密切注视着这只野兽恢复呼吸。[pg]");
         outputText((get_urtaDisabled() ? "他" : "她") + "厉声说道，[say:在他醒来之前把他弄到城墙外面去。我绝不允许这种腐化的污秽留在我们的城市里，确保你们更新了结界。如果他设法找回来的话，你们这些可悲的守卫就跟他一起滚出去。][pg]");
         outputText("几个穿着和" + (get_urtaDisabled() ? "拉尼斯" : "乌尔塔") + "类似盔甲的狗" + (get_noFur() ? "人" : "兽人") + "走上前来，用绳子绑住那只狼的腿。他们把绳子递给一个半人马，然后一行人开始把失去知觉的身体拖走。随着行动结束，人群开始散去。好几个" + (get_urtaDisabled() ? "人恭敬地向拉尼斯点头致意。他面无表情地告辞继续巡逻，一边在镶钉皮裤上擦着手一边" : "男性恭敬地向乌尔塔点头致意。她面无表情地告辞继续巡逻，一边在镶钉皮裙上擦着手一边") + "离开了。");
         doNext(telAdreMenu);
      }
      
      public function urtaIsABadass() : void
      {
         FlagDict_Impl_.arrayWriteInt(KFLAGS.flags,33,1);
         clearOutput();
         outputText("特尔阿德雷的街道上发生了一阵骚动。街道中心聚集了一大群围观者，他们挤得水泄不通，除了其他围观者的后脑勺，你什么也看不见。在人群的嘈杂声中，可以听到拳头打在肉体上的声音，这提醒你人群中心正在发生斗殴。");
         menu();
         addButton(0,"调查",watchUrtaBeABadass);
         addButton(1,"谁在乎？",telAdreMenu);
      }
      
      public function telAdreTourLoli() : void
      {
         setStatus(true,true);
         clearOutput();
         spriteSelect(null);
         outputText("埃德琳在特尔阿德雷的街道上疾驰。[say: 你叫什么名字，小" + get_player().mf("男孩","女孩") + "？] 她一边问，一边和路人打招呼。你记起礼节，恭敬地回答。[say: 我叫[name]，女士。] 埃德琳笑了。[say: 女士？哈，你真是个有礼貌的年轻[boy]。]");
         outputText("[pg]她简短地给你介绍了一下这座城市的来历。[say: 大概二十年前吧，一群特别坏的恶魔在马雷斯到处祸害人。盟约——那是一群法力高强又心善的巫师——想要保护像你我这样的好人，免受恶魔侵害。他们用魔法把我们藏在了这片沙漠里，在这儿，我们安全得很。你用不着担心恶魔，明白了吗？] 她转过头想面向你，等着你回答。你点了点头。她微微一笑，又转回身去。[pg]");
         outputText("埃德琳继续向市中心走去。[say: 既然知道了这个故事，[name]，你到底是从哪里来的，又是怎么找到这座城市的？] 你挺起胸膛，解释了你作为英格纳姆被选中的勇者的身份，以及你保护村庄免受任何威胁的使命。埃德琳停下脚步，再次转过头试图看着你。[pg]");
         outputText("[say: <b>什么？</b> 哪个变态混蛋会选一个无辜的孩子当——] 她注意到你惊讶地睁大了眼睛。[say: 我-我是说……那……你真的很勇敢。但是听着，你知道你可以直接留在这里，对吧？把那些任务交给大人吧。] 你解释说英格纳姆对你很重要，而且，虽然你很害怕，但你有责任去履行。她叹了口气，转过头去，继续往前走。");
         outputText("[pg]往前走了几分钟后，你们俩来到了一个繁忙的十字路口中心。许多市民盯着骑在城市卫兵背上的孩子看，让你和埃德琳都红了脸，但她还是继续往前走。埃德琳解释说，这里是城市的主广场，虽然城市很大，但很大一部分仍然是空着的。[say: 我不想吓唬你，但看到那些空房子了吗？那些都是试图与恶魔战斗的人。他们再也没有回来，[name]。求你了，好好想想你在做什么。] 她举起一只手引起你的注意，并指着一家商店。一家面包店！");
         outputText("[pg]埃德琳走进商店，把你从她背上抱了下来。面包店里的味道好极了，新鲜面包和甜食的香气唤醒了你内心的贪吃鬼，你立刻觉得饿了。");
         outputText("[pg]柜台后面出现了另一个半人马娘。[say: 哦，嘿，埃德琳！我不知道你下班了。这孩子是谁？]埃德琳走上前向她介绍你。[say: 这是[name]，[he]几分钟前出现在城墙外。你能给[him]点东西补充[his]能量吗？一块饼干或纸杯蛋糕。我稍后付钱。]");
         if(get_player().get_gems() < 40)
         {
            outputText("毕竟，你现在身无分文，也付不起钱。");
         }
         else
         {
            outputText("你大概能自己付钱，但拒绝别人的好意，哪怕只是一块饼干，也可能显得有些失礼。");
         }
         outputText("[pg][say: 没问题，埃德琳，没问题！给你。]她拿出一块大大的巧克力碎饼干递给你。饼干几乎是刚出炉的，温热酥脆，巧克力碎在你手中几乎要融化了。你瞬间就把它吃了个精光，这让埃德琳露出了微笑。这可能是你离开英格纳姆以来吃过的最美味的东西了。");
         get_player().refillHunger(30);
         outputText("[pg]你们俩很快就离开了面包店。她再次伸出手，你骑上她的背，继续你们的游览。");
         outputText("[pg]你的目光不由自主地被广场中央一块招牌吸引了过去——“湿身婊酒馆”。你戳了戳女半人马的肩膀，问那是什么地方。她先哼唧了一声才回你。[say:那是家挺火的酒馆。你应该能经常在那找到我和" + (get_urtaDisabled() ? "拉尼斯" : "乌尔塔") + "，不过你最好别进去，因为——，毕竟我——……总之除了白水什么都别喝！那可不是给小孩去的地方。]这种被当小孩看的语气让你多少有点不爽，但你也没太往心里去。");
         outputText("[pg]再往前走一段，你被领到了一家穿环店前面。一个长着猫耳的可爱人类女孩从门口探出头来，友好地朝你们俩挥了挥手。看到这么多人聚在同一个地方，干的居然是干炮之外的事情，简直太奇怪了。这一切让你前所未有地想念自己的家乡。眼泪不由自主地涌了上来，你赶紧抬手擦掉，心里庆幸至少还有这么一个能让你想起正常生活的地方。埃德琳注意到你的异样，挠了挠头，完全不知道该怎么应对这个场面。[say:别难过，[name]。家是你自己一手搭建起来的地方，而这里，用来当作家已经相当不错了！]当她发现自己的鸡汤发言根本没起什么作用时，那股热情劲儿一下子泄了气，化成了一声叹息。");
         outputText("[pg]她走回主广场，停下来帮你从她背上下来。[say: 我得去保护城市了，好吗，[name]？别惹麻烦，如果有人要你……做-爱，我，呃，总之——别惹麻烦，好吗？][pg]");
         outputText("还没等你回答，她就跑回城门去了。好吧，你现在可以自由活动了。");
         doNext(telAdreMenu);
      }
      
      public function telAdreTour() : void
      {
         setStatus(true,true);
         clearOutput();
         get_game().urta.urtaSprite();
         outputText((get_urtaDisabled() ? "拉尼斯" : "乌尔塔") + "带领你走在特尔阿德雷的街道上，向你简要介绍了" + (get_urtaDisabled() ? "这座" : "她的") + "城市，[say: 你看，大约二十年前，恶魔们正在吞噬玛瑞斯的每一个定居点和文明。集会，一群强大的魔法使用者，意识到直接对抗注定会失败。他们用魔法把我们藏在沙漠里，恶魔无法腐化他们找不到的东西。所以我们暂时是安全的。][pg]");
         outputText("你们俩来到了一个繁忙的十字路口中心。" + (get_urtaDisabled() ? "拉尼斯" : "乌尔塔") + "解释说这是城市的主广场，尽管城市很大，但很大一部分区域仍然空置着。大部分居民离开去协助其他定居点抵抗恶魔，结果都牺牲了。" + (get_urtaDisabled() ? "他" : "她") + "把一缕散落的头发从" + (get_urtaDisabled() ? "他" : "她") + "的眼前拨开，引导你沿着路走，并特意指出了" + (get_urtaDisabled() ? "他" : "她") + "最喜欢的酒馆——“湿身婊酒馆”。你");
         if(get_player().cor < 25)
         {
            outputText("脸红了");
         }
         else
         {
            outputText("轻笑");
         }
         outputText("听到这个颇具暗示性的名字，" + (get_urtaDisabled() ? "拉尼斯" : "乌尔塔") + "转过身来说：[say: 鉴于目前的情况，我们都对自己的性取向感到更加自在了。希望这不会让你感到困扰。][pg]");
         outputText("再往前走一点，你看到了一家穿孔店，显然这也是" + (get_urtaDisabled() ? "他" : "乌尔塔") + "的最爱之一。一个长着猫耳的可爱人类女孩从店前探出头来，友好地向你们挥手。看到这么多人聚在一个地方，做着除了做爱以外的事情，感觉真是太奇怪了。这一切让你比以往任何时候都更想念你的家乡。眼泪不由自主地涌上眼眶，你擦去泪水，很高兴至少还有这个能让你想起正常生活的地方。" + (get_urtaDisabled() ? "拉尼斯" : "乌尔塔") + "礼貌地假装没有注意到" + (get_urtaDisabled() ? "，因为他" : "，尽管她一直缠在腿上的尾巴抽搐了一下，因为她") + "结束了这次游览。[pg]");
         outputText((get_urtaDisabled() ? "他粗鲁地拍了拍你" : "她友好地给了你一拳") + "的肩膀，说道：[say: 好了，我得走了！乖乖的，别惹麻烦，好吗？][pg]");
         outputText("还没等你回答，" + (get_urtaDisabled() ? "他就跑回城门去了，留下你自由探索这座城市。" : "她就跑回街上去了，可能是在“湿身婊酒馆”停下来喝一杯。奇怪，她离开得太突然了……"));
         doNext(telAdreMenu);
      }
      
      public function telAdreMenuShow() : void
      {
         var _loc1_:Boolean = false;
         if(get_game().raphael.finaleCovered() && get_game().raphael.raphaelLikes())
         {
            _loc1_ = true;
         }
         else if(get_player().hasKeyItem("Spare Key to Urta\'s House"))
         {
            _loc1_ = true;
         }
         else if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,398) >= 5)
         {
            _loc1_ = true;
         }
         else if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,934) >= 4 && !get_game().arianScene.arianFollower())
         {
            _loc1_ = true;
         }
         spriteSelect(null);
         menu();
         addButton(0,"商店",armorShops).hint("去特尔阿德雷的商店看看。");
         addButton(1,"面包店",bakeryScene.bakeryuuuuuu).hint("去面包店品尝美味的食物，买些食材，或者找人作伴。");
         addButton(2,"酒吧",enterBarTelAdre).hint("进入“湿身婊酒馆”，这是你在这里看到的唯一一家酒吧。");
         addButton(3,"健身房",gym.gymDesc).hint("去健身房锻炼或结识朋友。");
         if(_loc1_)
         {
            addButton(4,"住宅",houses).hint("既然你认识住在这里的人，你可以去拜访他们的家。");
         }
         if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,934) > 0 && FlagDict_Impl_.arrayReadInt(KFLAGS.flags,934) < 4)
         {
            addButton(5,"公园",get_game().arianScene.visitThePark).hint("去公园看看。");
         }
         addButton(6,"当铺",oswaldPawn).hint(!get_player().hasStatusEffect(StatusEffects.Oswald) ? "进入当铺。也许你可以在这里卖掉多余的战利品？" : "拜访奥斯瓦尔德，买点东西或处理掉不需要的物品。");
         addButton(7,"法师塔",library.visitZeMagesTower).hint("仔细看看那座法师塔。");
         setExitButton().hint("离开特尔阿德雷，回到你的营地。");
      }
      
      public function telAdreMenu() : void
      {
         if(get_game().raphael.finaleBetrayed() && !get_game().raphael.get_bountyReceived() && get_urtaDisabled())
         {
            ranisPaysBounty();
            return;
         }
         if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,736) < int(get_date().getFullYear()) && get_player().balls > 0 && get_player().hasCock() && FlagDict_Impl_.arrayReadInt(KFLAGS.flags,54) >= 4 && FlagDict_Impl_.arrayReadInt(KFLAGS.flags,105) > 0 && isValentine())
         {
            get_game().valentines.crazyVDayShenanigansByVenithil();
            return;
         }
         if(!get_game().urtaQuest.urtaBusy() && FlagDict_Impl_.arrayReadInt(KFLAGS.flags,33) == 0 && Utils.rand(15) == 0 && get_game().time.hours > 15)
         {
            urtaIsABadass();
            return;
         }
         if(!get_game().urtaQuest.urtaBusy() && get_game().urta.pregnancy.get_event() > 5 && Utils.rand(30) == 0)
         {
            get_game().urtaPregs.urtaIsAPregnantCopScene();
            return;
         }
         var _loc1_:int = FlagDict_Impl_.arrayReadInt(KFLAGS.flags,398);
         while(true)
         {
            if(_loc1_ != -1)
            {
               if(_loc1_ != 0)
               {
                  if(_loc1_ != 1)
                  {
                     if(_loc1_ != 2)
                     {
                        if(_loc1_ != 3)
                        {
                           if(_loc1_ == 4)
                           {
                              if(!katherine.isAt(1) && FlagDict_Impl_.arrayReadInt(KFLAGS.flags,1226) >= 100)
                              {
                                 katherineEmployment.katherineGetsEmployed();
                                 return;
                              }
                              break;
                           }
                           if(get_game().time.hours < 10 && Utils.rand(12) == 0)
                           {
                              katherine.katherineOnDuty();
                              return;
                           }
                           break;
                        }
                     }
                  }
                  break;
               }
            }
            if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,1184) == 0 && get_player().get_gems() > 34 && Utils.rand(25) == 0)
            {
               if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,398) == 0)
               {
                  katherine.ambushByVagrantKittyKats();
               }
               else
               {
                  katherine.repeatAmbushKatherineRecruitMent();
               }
               return;
            }
            break;
         }
         if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,934) == 0 && Utils.rand(10) == 0 && FlagDict_Impl_.arrayReadInt(KFLAGS.flags,1253) == 0)
         {
            get_game().arianScene.meetArian();
            return;
         }
         if(!kittens.saveContent.metKittens && get_time().hours > 16 && get_time().hours < 21 && Utils.rand(20) == 0)
         {
            kittens.kittensMeet();
            return;
         }
         if(!edryn.saveContent.kidMet && get_time().isTimeBetween(10,16) && FlagDict_Impl_.arrayReadInt(KFLAGS.flags,69) > 0 && Utils.rand(10) == 0)
         {
            edryn.edrynKidEncounter();
            return;
         }
         if(get_player().isChild() && get_time().isTimeBetween(11,16) && Utils.randomChance(3) && !saveContent.iceCreamed)
         {
            iceCream();
            return;
         }
         if(get_game().urta.pregnancy.get_event() > 2 && Utils.rand(4) == 0 && FlagDict_Impl_.arrayReadInt(KFLAGS.flags,802) == 0 && get_player().hasKeyItem("Spare Key to Urta\'s House"))
         {
            get_game().urtaPregs.urtaSpecialDeliveries();
            return;
         }
         if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,242) == -1)
         {
            maddie.runAwayMaddieFollowup();
            return;
         }
         spriteSelect(null);
         get_images().showImage("location-teladre");
         clearOutput();
         outputText("特尔阿德雷是座庞大的城市，不过大部分居民的活动范围都集中在前几个街区。看来玛瑞斯的陷落并没让特尔阿德雷完全幸免于难。城中心耸立着一座巨塔，闪烁着诡异的光芒。从街头巷尾的闲谈中你得知，誓约的法师们在那座塔里日夜苦干，维持着遮蔽整座城市的结界，让外界的危险无法窥探。城市里那些闲置的区域似乎没有路可以进去，但你会留个心眼的。[pg]");
         outputText("一栋砂岩建筑前挂着块招牌，上面画着一个浑身布满穿孔的扶她半人马，亮粉色的字写着“穿孔工作室”。你瞥了一眼，看到那家木制门面的——" + (get_urtaDisabled() ? "酒吧，\'湿身婊酒馆\'。你" : "乌尔塔最爱的酒吧，\'湿身婊酒馆\'。真奇怪，她怎么会在一趟导览里专门提起这些。总之，你") + "还注意到，有个狼人模样的家伙在铁匠铺的砧板上叮叮当当地敲打个不停，还有个打扮花哨、耷拉着大耳朵的狗头人似乎在自家铺子里经营着当铺生意。街尾附近有座圆顶建筑，顶部蒸腾着滚滚白汽，圆顶上刷着朴素的字，说那是家面包房。说不定那几家店也挺有意思的。");
         telAdreMenuShow();
      }
      
      public function telAdreCrystal() : void
      {
         if(!get_game().telAdre.isDiscovered())
         {
            setStatus(true,false);
         }
         if(get_player().hasStatusEffect(StatusEffects.Exgartuan) || !get_player().isPureEnough(70))
         {
            outputText("水晶吊坠开始在空中振动，旋转着，发出危险的黑光。埃德琳猛地把手缩回去，说道：[say: 很抱歉，但你已经病入膏肓，不能踏入我们的城市。如果奇迹发生，你能摆脱体内的腐化，再回到我们这里吧。][pg]");
            outputText("你耸耸肩，后退了一步。你也许能打败这两个人，但你知道你无法对抗城墙外他们可能拥有的众多朋友。你转过身离开，对他们的待客之道有些不满。走下沙丘一半后，你回头看了一眼，发现城市已经消失了！你惊讶地冲回沙丘，把沙子弄得到处都是，但当你到达顶点时，城市已经不见了。");
            doNext(get_camp().returnToCampUseOneHour);
            return;
         }
         if(!get_player().isPureEnough(50) || get_game().jojoScene.isJojoCorrupted())
         {
            outputText("水晶吊坠闪烁着，在原地振动，发出紫色的光芒。埃德琳后退了一步，警惕地看着你，[say: 你已经被腐化深深触及。你在彻底堕落和恢复理智之间走钢丝。你可以进去，但我们会密切监视你的。][pg]");
         }
         else if(!get_player().isPureEnough(25) || FlagDict_Impl_.arrayReadInt(KFLAGS.flags,2024) == 2)
         {
            outputText("水晶吊坠在原地旋转，发出暗红色的光芒。埃德琳向后退了一小步，低声说道：[say: 你亲眼见识过这片土地的黑暗，但它对你的影响并不深。你可以在这里找到圣所。恶魔们还无法发现这个地方，我们保证你在城墙内绝对安全。][pg]");
         }
         else
         {
            outputText("水晶闪烁着苍白的光芒。埃德琳退后一步，对你露出灿烂的笑容，说道：[say: 你还没有被弥漫在玛瑞斯大陆的恶魔污染所毁掉。来吧，你可以进入我们的城墙，在这里找到安全之所，尽管这只有在盟约的白魔法保护我们免受恶魔走狗侵扰时才有效。][pg]");
         }
         outputText("那个" + (get_urtaDisabled() ? "卫兵队长自我介绍说他叫拉尼斯，然后" : "狐娘乌尔塔") + "指着那扇较小的门问道：[say: 新来的，你想参观一下特尔阿德雷吗？][pg]");
         if(get_player().isChild())
         {
            outputText("还没等你回答，半人马就插了进来，站在了" + (get_urtaDisabled() ? "狗人" : "乌尔塔") + "和你之间。[say: " + (get_urtaDisabled() ? "队长" : "乌尔塔") + "，你能替我站会儿岗吗？我带[him]在城里转转。如果你需要的话，我晚点可以加个班。][pg]" + (get_urtaDisabled() ? "拉尼斯" : "乌尔塔") + "皱了皱眉，质疑了她一会儿，但随后耸了耸肩表示接受，向大门走去。");
            outputText("[pg]在" + (get_urtaDisabled() ? "狗" : "狐狸") + "离开后，埃德琳深吸了一口气，盯着你看。你被她那相当有气势的目光吓得微微退缩，但她笑了笑，向你伸出一只手，脸微微发红。[say: 来吧，孩子。你穿过那片沙漠，简直像是走了一趟地狱。抓住我的手。]");
            outputText("[pg]你考虑了片刻，还是决定握住她的手。伴随着一声低吟和一个敏捷的动作，她把你从地上拉起，甩到了她的背上。你差点失去平衡摔倒，但还是勉强坐稳了。[say: 后面舒服吗？我带你逛逛镇子。抓紧点，但别扯我的头发，不然你会后悔的。]");
            outputText("[pg]你的双手在半空中停滞了片刻，寻找可以抓握的地方。由于别无选择，你把手放在了她紧实的小腹上。当你刚抓紧时，她紧张了一下，但很快就放松下来，开始向城市走去。");
            doNext(telAdreTourLoli);
         }
         else
         {
            outputText("你记起礼节并点了点头，很感激能在这个陌生的地方得到快速的介绍。" + (get_urtaDisabled() ? "拉尼斯" : "乌尔塔") + "留下埃德琳看守城门，带领你走了进去。" + (get_urtaDisabled() ? "" : " 你确实注意到她的步态有些奇怪，而且她毛茸茸的狐狸尾巴似乎一直缠在右腿上") + "。当你踏入特尔阿德雷城时，大门在你身后轻松地关上了……");
            doNext(telAdreTour);
         }
      }
      
      public function setStatus(param1:Boolean, param2:Boolean) : void
      {
         if(!param1)
         {
            get_player().removeStatusEffect(StatusEffects.TelAdre);
         }
         else if(!get_player().hasStatusEffect(StatusEffects.TelAdre))
         {
            get_player().createStatusEffect(StatusEffects.TelAdre,param2 ? 1 : 0,0,0,0);
         }
         else
         {
            get_player().changeStatusValue(StatusEffects.TelAdre,1,param2 ? 1 : 0);
         }
      }
      
      public function saveToObject() : Object
      {
         return saveContent;
      }
      
      public function reset() : void
      {
         saveContent.iceCreamed = false;
      }
      
      public function ranisPaysBounty() : void
      {
         clearOutput();
         outputText("当你进入城市时，拉尼斯在门口拦住了你。[say: 我听说你帮忙抓住了那只讨厌的狐狸。他虽然一直算不上特别危险，但绝对是个让人头疼的家伙，而且从轻信他的女人那里偷了足够多的贵重物品，悬赏金已经相当可观了。] 他从身旁的地上提起一个皮袋，递给你时发出宝石碰撞的清脆声响。[say: 一千颗宝石。感谢你的协助，我敢肯定那些没用的狼自己是抓不到他的。]");
         outputText("他向你点点头，挥手目送你进入特尔阿德雷。");
         get_game().raphael.set_bountyReceived(true);
         get_player().gainGems(1000);
         doNext(telAdreMenu);
      }
      
      public function oswaldTransactBuy(param1:int = 1) : void
      {
         var _loc2_:* = null as ItemType;
         clearOutput();
         var _loc3_:Number = 2;
         if(param1 == 1)
         {
            _loc2_ = ItemType.lookupItem(FlagDict_Impl_.arrayReadString(KFLAGS.flags,567));
         }
         else if(param1 == 2)
         {
            _loc2_ = ItemType.lookupItem(FlagDict_Impl_.arrayReadString(KFLAGS.flags,568));
         }
         else
         {
            _loc2_ = ItemType.lookupItem(FlagDict_Impl_.arrayReadString(KFLAGS.flags,569));
         }
         if(get_player().get_gems() < Math.round(_loc3_ * _loc2_.get_value()))
         {
            outputText("你考虑买点什么，但你没有足够的宝石来完成交易。");
            doNext(oswaldBuyMenu);
            return;
         }
         outputText("奥斯瓦尔德用手指检查了你挑选的物品后，将它递给你，报出价格，并简短地点了点头收下你的宝石。[pg]");
         var _loc4_:Player = get_player();
         _loc4_.set_gems(_loc4_.get_gems() - int(Math.round(_loc3_ * _loc2_.get_value())));
         statScreenRefresh();
         if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,2140) == 1 && _loc2_ is Consumable)
         {
            _loc2_.useItem();
            doNext(oswaldBuyMenu);
         }
         else
         {
            get_inventory().takeItem(_loc2_,oswaldBuyMenu);
         }
      }
      
      public function oswaldPawnSellAll() : void
      {
         var returnFromSelling:Boolean;
         var _g:TelAdre;
         var _loc3_:int = 0;
         spriteSelect(SpriteDb.get_s_oswald());
         var _loc1_:int = 0;
         clearOutput();
         var _loc2_:int = 0;
         while(_loc2_ < 10)
         {
            _loc3_ = _loc2_++;
            if(get_player().itemSlots[_loc3_].quantity > 0 && get_player().itemSlots[_loc3_].itype.get_value() >= 1)
            {
               _loc1_ += get_player().itemSlots[_loc3_].quantity * (int(get_player().itemSlots[_loc3_].itype.get_value() / 2));
               get_player().itemSlots[_loc3_].set_quantity(0);
            }
         }
         outputText("你把身上带着的所有物品都摆在奥斯瓦尔德面前的柜台上。他仔细检查了一番，点了点头。他紧张地掏出 " + Utils.num2Text(_loc1_) + " 颗宝石，放进你摊开的手中。");
         var _loc4_:Player = get_player();
         _loc4_.set_gems(_loc4_.get_gems() + _loc1_);
         statScreenRefresh();
         _g = this;
         returnFromSelling = true;
         doNext(function():void
         {
            _g.oswaldPawnMenu(returnFromSelling);
         });
      }
      
      public function oswaldPawnSell(param1:int) : void
      {
         var returnFromSelling:Boolean;
         var _g:TelAdre;
         var _loc3_:* = null as Player;
         spriteSelect(SpriteDb.get_s_oswald());
         var _loc2_:int = int(get_player().itemSlots[param1].itype.get_value() / 2);
         clearOutput();
         if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,2140) == 1)
         {
            if(_loc2_ == 0)
            {
               outputText("你把 " + Utils.num2Text(get_player().itemSlots[param1].quantity) + " 个 " + Utils.cnName(get_player().itemSlots[param1].itype.get_shortName()) + " 递给奥斯瓦尔德。他耸了耸肩说道：[say: 好吧，这东西不值什么钱，但我收下了。]");
            }
            else
            {
               outputText("你把 " + Utils.num2Text(get_player().itemSlots[param1].quantity) + " 个 " + Utils.cnName(get_player().itemSlots[param1].itype.get_shortName()) + " 递给奥斯瓦尔德。他紧张地掏出 " + _loc2_ * get_player().itemSlots[param1].quantity + " 颗宝石，放进你摊开的手中。");
            }
            while(get_player().itemSlots[param1].quantity > 0)
            {
               get_player().itemSlots[param1].removeOneItem();
               _loc3_ = get_player();
               _loc3_.set_gems(_loc3_.get_gems() + _loc2_);
            }
         }
         else
         {
            if(_loc2_ == 0)
            {
               outputText("你把 " + Utils.cnName(get_player().itemSlots[param1].itype.get_longName()) + " 递给奥斯瓦尔德。他耸了耸肩说道：[say: 好吧，这东西不值什么钱，但我收下了。]");
            }
            else
            {
               outputText("你把 " + Utils.cnName(get_player().itemSlots[param1].itype.get_longName()) + " 递给奥斯瓦尔德。他紧张地掏出 " + Utils.num2Text(_loc2_) + " 颗宝石，放进你摊开的手中。");
            }
            get_player().itemSlots[param1].removeOneItem();
            _loc3_ = get_player();
            _loc3_.set_gems(_loc3_.get_gems() + _loc2_);
         }
         statScreenRefresh();
         _g = this;
         returnFromSelling = true;
         doNext(function():void
         {
            _g.oswaldPawnMenu(returnFromSelling);
         });
      }
      
      public function oswaldPawnMenu(param1:Boolean = false) : void
      {
         var _loc4_:int = 0;
         clearOutput();
         spriteSelect(SpriteDb.get_s_oswald());
         outputText("当你再次靠近他的摊位时，你看到奥斯瓦尔德正在摆弄一顶大礼帽。他抬起头笑了笑，" + (get_noFur() ? "走到你面前，搓着他的" : "轻步走到你面前，搓着他毛茸茸的") + "双手。他问道：[say: 有什么商品要卖给我吗，" + get_player().mf("先生","亲爱的") + "？][pg]");
         outputText("（你可以在这里出售物品，但奥斯瓦尔德不会让你再买回来，所以请确定你要出售。你可以按住Shift点击来出售所选堆叠中的所有物品。）");
         outputText("[pg]<b><u>奥斯瓦尔德的估价</u></b>");
         menu();
         var _loc2_:int = 0;
         var _loc3_:int = 0;
         while(_loc3_ < 10)
         {
            _loc4_ = _loc3_++;
            if(get_player().itemSlots[_loc4_].quantity > 0 && get_player().itemSlots[_loc4_].itype.get_value() >= 1)
            {
               outputText("\n" + int(get_player().itemSlots[_loc4_].itype.get_value() / 2) + " 颗宝石，收购 " + Utils.cnName(get_player().itemSlots[_loc4_].itype.get_longName()) + "。");
               addButton(_loc4_,get_player().itemSlots[_loc4_].get_invLabel(),(function(param1:Array, param2:Array):Function
               {
                  var _g:Array = param1;
                  var slot:Array = param2;
                  return function():void
                  {
                     _g[0].oswaldPawnSell(int(slot[0]));
                  };
               })([this],[_loc4_])).hint(get_player().itemSlots[_loc4_].get_tooltipText(),get_player().itemSlots[_loc4_].get_tooltipHeader());
               _loc2_ += get_player().itemSlots[_loc4_].quantity;
            }
         }
         if(_loc2_ > 1)
         {
            addButton(12,"全部出售",oswaldPawnSellAll);
         }
         addButton(14,"返回",oswaldPawn);
      }
      
      public function oswaldPawn() : void
      {
         var _g:TelAdre;
         spriteSelect(SpriteDb.get_s_oswald());
         clearOutput();
         if(!get_player().hasStatusEffect(StatusEffects.Oswald))
         {
            outputText("走近一看，你发现这位当铺老板" + (get_noFur() ? "的耳朵像金毛犬的耳朵" : "似乎是某种金毛犬") + "。他看起来并不完全自在，有些驼背，但他一直努力保持着微笑。除此之外，他的外表完美无瑕，穿着考究的西装外套，打着领带，不过他似乎没穿裤子。令人惊讶的是，他的命根子是缩进去的。");
            if(get_player().cor < 75)
            {
               outputText("谁能想到，看到别人没有发情居然会让你感到震惊？");
            }
            else
            {
               outputText("真遗憾，不过也许你能给他一个挺直腰板的理由？");
            }
            outputText("他的摊位乱七八糟，与他那打理得井井有条的主人形成了鲜明的对比。他现在似乎什么都没在卖。[pg]");
            outputText("这只狗" + (get_noFur() ? "人" : "") + "自我介绍说他叫奥斯瓦尔德，并开始推销，[say:你有什么想卖的吗？我叫奥斯瓦尔德，是特尔阿德雷最好的商人。][pg]");
            outputText("（你可以在这里出售物品，但奥斯瓦尔德不会让你买回来，所以请确定你要卖的东西。）");
            get_player().createStatusEffect(StatusEffects.Oswald,0,0,0,0);
         }
         else
         {
            outputText("当你再次靠近他的摊位时，你看到奥斯瓦尔德正在摆弄一顶大礼帽。他抬起头笑了笑，" + (get_noFur() ? "走到你面前，搓着他的" : "轻步走到你面前，搓着他毛茸茸的") + "双手。他问道：[say: 有什么商品要卖给我吗，" + get_player().mf("先生","亲爱的") + "？][pg]");
         }
         menu();
         addButton(0,"购买",oswaldBuyMenu);
         _g = this;
         addButton(1,"出售",function():void
         {
            _g.oswaldPawnMenu();
         });
         switch(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,398))
         {
            case 1:
            case 2:
               addButton(2,"凯丝的小巷",katherine.visitKatherine);
               break;
            case 3:
               addButton(2,"安全屋",katherineEmployment.katherineTrainingWithUrta);
               break;
            case 4:
               addButton(2,"凯丝的小巷",katherineEmployment.postTrainingAlleyDescription);
         }
         if(!get_player().hasKeyItem("Carrot") && get_game().xmas.nieve.get_stage() > 0 && get_game().xmas.nieve.get_stage() < 4)
         {
            outputText("[pg]顺便一提，你说你正在找一根胡萝卜。");
            outputText("[pg]奥斯瓦尔德的耳朵竖了起来，他的大礼帽摇摇欲坠，他高兴地宣布，[say:我最近刚好碰到一根——在这个黑暗的时代，这可是个稀罕物，你懂的。如果你感兴趣的话，我可以以500颗宝石的价格卖给你。]");
            if(get_player().get_gems() < 500)
            {
               outputText("[pg]<b>你买不起！</b>");
            }
            else
            {
               addButton(3,"买胡萝卜",buyCarrotFromOswald);
            }
         }
         addButton(14,"返回",telAdreMenu);
      }
      
      public function oswaldBuyMenu() : void
      {
         var slot2:int;
         var _g2:TelAdre;
         var slot1:int;
         var _g1:TelAdre;
         var slot:int;
         var _g:TelAdre;
         if(!(567 in KFLAGS.flags.h))
         {
            get_game().bazaar.benoit.updateBenoitInventory();
         }
         clearOutput();
         var _loc1_:ItemType = ItemType.lookupItem(FlagDict_Impl_.arrayReadString(KFLAGS.flags,567));
         var _loc2_:ItemType = ItemType.lookupItem(FlagDict_Impl_.arrayReadString(KFLAGS.flags,568));
         var _loc3_:ItemType = ItemType.lookupItem(FlagDict_Impl_.arrayReadString(KFLAGS.flags,569));
         var _loc4_:Number = 2;
         outputText("你问奥斯瓦尔德有没有什么东西要卖。他点点头说，[say:当然。如果你没有看到感兴趣的东西，明天再来。我们一直都有新货。]");
         outputText("[pg]<b><u>奥斯瓦尔德的价格</u></b>");
         outputText("\n" + Utils.cnName(_loc1_.get_longName()) + "：" + Math.round(_loc4_ * _loc1_.get_value()));
         outputText("\n" + Utils.cnName(_loc2_.get_longName()) + "：" + Math.round(_loc4_ * _loc2_.get_value()));
         outputText("\n" + Utils.cnName(_loc3_.get_longName()) + "：" + Math.round(_loc4_ * _loc3_.get_value()));
         menu();
         _g = this;
         slot = 1;
         var _loc5_:Function = function():void
         {
            _g.oswaldTransactBuy(slot);
         };
         addButton(0,Utils.cnName(_loc1_.get_shortName()),_loc5_).hint(_loc1_.get_tooltipText(),_loc1_.get_tooltipHeader());
         _g1 = this;
         slot1 = 2;
         var _loc6_:Function = function():void
         {
            _g1.oswaldTransactBuy(slot1);
         };
         addButton(1,Utils.cnName(_loc2_.get_shortName()),_loc6_).hint(_loc2_.get_tooltipText(),_loc2_.get_tooltipHeader());
         _g2 = this;
         slot2 = 3;
         var _loc7_:Function = function():void
         {
            _g2.oswaldTransactBuy(slot2);
         };
         addButton(2,Utils.cnName(_loc3_.get_shortName()),_loc7_).hint(_loc3_.get_tooltipText(),_loc3_.get_tooltipHeader());
         addButton(14,"返回",oswaldPawn);
      }
      
      public function onAscend(param1:Boolean) : void
      {
         reset();
      }
      
      public function load(param1:int, param2:*) : void
      {
         Utils.recursiveLoad(param2,saveContent);
      }
      
      public function isDiscovered() : Boolean
      {
         return get_player().hasStatusEffect(StatusEffects.TelAdre);
      }
      
      public function isAllowedInto() : Boolean
      {
         return get_player().statusEffectv1(StatusEffects.TelAdre) >= 1;
      }
      
      public function iceCreamYes() : void
      {
         clearOutput();
         outputText("[say:太好了，]他咧嘴笑着，比之前笑得更灿烂了，[say:那真是太好了！你在这里等一会儿，我去给你拿点好吃的。]他眨了一只眼，就跑开了，他那双长腿带着他以惊人的速度消失在视线中。");
         outputText("[pg]你不确定地等了几分钟，人群在你面前继续熙熙攘攘。你不太确定他是否值得信任，但能有冰凉舒爽的东西来驱散这令人窒息的酷热，是你现在唯一能想到的事。几乎任何事情都比在庇护所外刺痛的空气中受苦要好，所以当你看到那个男人高大的身躯再次从行人中显现出来时，你甚至感到非常高兴。");
         outputText("[pg][say:嘿，]他走过来时说道，举起一小团白色漩涡状、宛如琼浆玉液般的美味。[say:希望你喜欢香草味。]");
         outputText("[pg]你现在可不挑剔，所以你高兴地从他递过来的手中接过甜筒，送到嘴边。当第一口冰淇淋触碰到你的舌头时，你几乎要融化了，一种明显的如释重负感席卷全身。这种甜蜜的感觉干扰了你的平衡，让你在原地摇晃了一下。");
         outputText("[pg][say:哇哦，你看起来有点站不稳，]男人说道。[say:来，我帮你。]还没等你反应过来，他就抓住你的手臂，把你拉过几步，然后坐在一个废弃的板条箱上，拍了拍他的大腿。你还有些犹豫，但在他手的引导下，你走了过去，坐在了他身上。他的身体宽阔而结实，坐起来还算舒服。");
         outputText("[pg][say:继续吃吧，别管我。]他的头倾向你手中的甜筒。你觉得这确实是眼下最要紧的事，于是你继续吃了起来，急切地再次品尝那份甜蜜的幸福。这美味让你忍不住闭上眼睛，你感到无比庆幸，自己能安全、宁静地坐在这条小巷里，而不是在外面忍受酷暑。你太满足了，以至于当男人的手向前滑到你的[if (tailLeg) {尾巴|大腿}]上轻轻抚摸时，你并没有感到太惊讶。");
         outputText("[pg][say:嗯，味道不错吧？我在这座城市待了很久了，每次吃它都觉得很治愈……]");
         outputText("[pg]你抬起头，看到这个陌生人的目光正迷离地望向右方。你等了一会儿，但他那双稳健的手依然停留在你的[skinshort]上，也没有再说什么，于是你继续吃你的冰淇淋。它的美味丝毫不减，不过已经开始有点融化了，你因此加快了进食的速度。");
         outputText("[pg]舔了一口又一口，冰凉的甜点越来越小，直到只剩下甜筒。几口咬下去，甜筒也没了，只在你的手上和嘴里留下一丝微凉。你的恩人看到你吃完了，带着你已经习惯的那种温暖笑容，最后捏了一把，松开了你的[if (singleleg) {身体|双腿}]。");
         outputText("[pg][say:感觉好点了吧？]你向他点头确认，他轻声笑了起来。[say:太好了。你没事真是太好了，但请记住要照顾好自己。太阳有时候可是很无情的，所以你一定要多喝水，注意防暑。]");
         outputText("[pg]不知为何，他看起来特别高兴，但没过几秒，他就轻轻把你扶起，让你双[feet]站稳，然后自己也站了起来。他迅速地点了点头作为道别，接着便迈着轻快的步伐走进了街道的人群中。仅仅几秒钟后，你就再也看不清他的身影了。");
         outputText("[pg]这确实是一次奇妙的邂逅，但你现在感觉神清气爽，准备好再次探索这座沙漠之城了。");
         doNext(telAdreMenu);
      }
      
      public function iceCreamRun() : void
      {
         clearOutput();
         outputText("你不知道到底发生了什么，但你知道你不该待在这里。虽然天气热得让人窒息，但如果你再在这个狭窄的巷子里多待一秒，你不知道会发生什么。唯一的问题是你到底该怎么做。他块头很大，但看起来并没有做好反应的准备，所以你或许有机会。");
         outputText("[pg]你只能冒险一试。趁他还在滔滔不绝地说着你根本没在听的话时，你突然向前冲去，从他的腿和墙壁之间的缝隙中穿过。虽然很挤，但你成功了，你的[legs]在之后的一段时间里继续奔跑，尽力把你带到一个安全的距离。");
         outputText("[pg]直到你感到一丝安全感时，你才愿意回头看。你喘着粗气，完全准备好在需要时再次出发，但奇怪的是，你没有。那个人根本没有动，甚至没有改变他慵懒的蹲姿。他伸长脖子朝你的方向看去，脸上带着一丝失望的表情。");
         outputText("[pg]你的不安感并没有真正消退，但他站起身来，慵懒地伸了个懒腰，打破了这种气氛。当你还在犹豫是逃跑还是再观察他一会儿时，他突然快步离开，在人群中穿梭时甚至没有看你一眼。仅仅几秒钟后，你就再也看不到他了，你开始怀疑自己是否看错了情况。");
         outputText("[pg]无论如何，除了继续在沙漠的烈日下前行，你别无他法。");
         doNext(telAdreMenu);
      }
      
      public function iceCreamNoFinal() : void
      {
         clearOutput();
         outputText("你坚定地摇了摇头。在随之而来的沉默中，即使城市里酷热难耐，你还是感到了一阵寒意。男人的肩膀向前倾，你的心猛地跳了一下，但他只是站起身来，咕哝了一声。");
         outputText("[pg][say:好吧，尽量照顾好自己。这真的很重要，特别是对你这样正在长身体的[boy]来说。如果你需要帮助，请找守卫或者你信任的大人谈谈，]他说道。男人接着压了压帽檐，让你瞥见了他头上某种动物的耳朵，然后他最后一次微笑着，和之前一样温暖，随后转身大步走入城市中。");
         outputText("[pg]你感到有些不安。你看着男人的背影消失在人群中，想知道他到底在那里做什么。直到你再也看不见他，你也没有找到答案，但你在阴凉处多逗留了一会儿，恢复体力，试图重新积攒面对烈日的力气。");
         outputText("[pg]然后，既然无事可做，你便继续前行。");
         doNext(telAdreMenu);
      }
      
      public function iceCreamNo() : void
      {
         clearOutput();
         outputText("你对此不太确定。你告诉这个陌生的男人你不需要他的任何东西，随后是一阵短暂的沉默。你只能听到他在沙漠空气中轻微的呼吸声，以及现在似乎变得很遥远的人群的微弱嘈杂声。你微微打了个寒颤。");
         outputText("[pg][say:你确定吗？]他问道。[say:我刚到这里的时候，你看起来好像快要晕倒了。你需要点东西来提提神，让我请你吧。]他向你露出温暖的微笑。");
         menu();
         addNextButton("要",iceCreamYes);
         addNextButton("不要",iceCreamNoFinal);
         addNextButton("逃跑",iceCreamRun);
      }
      
      public function iceCream() : void
      {
         saveContent.iceCreamed = true;
         clearOutput();
         outputText("特尔阿德雷炎热、尘土飞扬的道路对你这个试图穿过的人来说并不友好。只需一阵狂风就能让你咳嗽不止，而且你越来越觉得太阳直射在你的头上，确实如此。你已经头晕目眩了，你需要找个地方躲避，而且要快。");
         outputText("[pg]附近的一条小巷看起来能满足你的需求。它离道路本身足够远，让你能够避开人群，当你最终躲进凉爽的阴影中时，你深吸了一口气，感觉就像刚从令人窒息的毯子下钻出来一样。你完全不知道当你不得不离开这个避难所时，你将如何应对酷暑。");
         outputText("[pg]就在这时，你听到身后传来一个声音。");
         outputText("[pg][say:嘿，你好。你迷路了吗？]它问道，声音温柔而低沉。你转过身。一个男人站在那里，他高大宽阔的剪影映衬在身后明亮、泛红的天空下。[say:你是和你爸爸妈妈一起来的吗？他们知道你在哪里吗？]");
         outputText("[pg]你摇摇头表示没有，他蹲下来，让你更好地看清他的容貌。他是个中年人，但依然健壮，穿着一件厚重的皮革旅行斗篷，上面有许多小袋和带子。一顶平顶帽戴在他那头短而浓密的深棕色头发上，他那刮得干干净净的脸上带着微笑。");
         outputText("[pg][say:你是说你一个人？]你点点头，他继续说道，[say:在这沙漠中央？那太可怕了！]他停顿了一下，看向一旁模糊的地方。[say:太可怕了……你看起来精神恍惚。这附近的沙漠绝对不是闹着玩的，你得小心点。]");
         outputText("[pg]他又在小巷入口处蹲了一会儿，小巷的宽度勉强能容下他，他一只手托着下巴，若有所思。[say:你知道吗，]他终于说道，[say:你看起来真的很需要吃点冰淇淋。在这样的地方吃冰淇淋最棒了，能让你立刻精神起来！你想要吗？你想吃点冰淇淋吗？]");
         outputText("[pg]他用明亮的蓝眼睛期待地看着你。你想要一份款待吗？");
         menu();
         addNextButton("要",iceCreamYes);
         addNextButton("不要",iceCreamNo);
         addNextButton("逃跑",iceCreamRun);
      }
      
      public function houses() : void
      {
         clearOutput();
         outputText("你要去拜访谁的家？");
         var _loc1_:Function = null;
         if(get_game().raphael.finaleCovered())
         {
            if(get_game().raphael.raphaelLikes())
            {
               _loc1_ = get_game().raphael.orphanageIntro;
            }
            else
            {
               outputText("[pg]你记起了拉斐尔关于孤儿院的提议，但你可能想先把自己塑造成更符合他口味的样子。毕竟他是一只挑剔的狐狸，你怀疑他是否会乐意看到你现在的样子。");
            }
         }
         menu();
         if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,398) >= 5)
         {
            addButton(0,"凯丝公寓",katherine.visitAtHome);
         }
         if(get_game().urtaPregs.urtaKids() > 0 && get_player().hasKeyItem("Spare Key to Urta\'s House"))
         {
            addButton(1,"乌尔塔家",katherine.isAt(3) ? katherine.katherineAtUrtas : get_game().urtaPregs.visitTheHouse);
         }
         if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,934) >= 4 && !get_game().arianScene.arianFollower())
         {
            addButton(2,"阿瑞安家",get_game().arianScene.visitAriansHouse);
         }
         addButton(3,"孤儿院",_loc1_);
         addButton(14,"返回",telAdreMenu);
      }
      
      public function get_debugName() : String
      {
         return "Tel\'Adre";
      }
      
      public function get_debugHint() : String
      {
         return "";
      }
      
      public function enterBarTelAdre() : void
      {
         if(get_game().thanksgiving.pigSlutAllowed())
         {
            get_game().thanksgiving.pigSlutRoastingGreet();
         }
         else
         {
            barTelAdre();
         }
      }
      
      public function encounterTelAdre() : void
      {
         clearOutput();
         if(!get_game().telAdre.isDiscovered())
         {
            outputText("你在变幻莫测的沙地中艰难跋涉了很长时间，似乎并没有靠近多少。就在你快要放弃的时候，你爬上了一个大沙丘，来到了你之前看到的城市城墙前。这绝对不是海市蜃楼。整个定居点周围环绕着至少五十英尺高的砂岩城墙，你能看到的唯一入口是一扇带有厚重木门的大门。入口处似乎由一个" + (get_urtaDisabled() ? "魁梧的狗耳男子" : (get_noFur() ? "灰发狐耳女孩" : "雌性灰狐")) + "守卫着，比起监视沙漠，" + (get_urtaDisabled() ? "他" : "她") + "更忙于从瓶子里喝着什么。[pg]");
            outputText("仿佛察觉到了你的想法，" + (get_urtaDisabled() ? "他" : "她") + "扔下瓶子，拔出了一把比" + (get_urtaDisabled() ? "他" : "她") + "还要高得多的长戟。[pg]");
            outputText("[say: 站住！]" + (get_urtaDisabled() ? "狗人" : "狐" + (get_noFur() ? "娘" : "狸")) + "大声喝道，" + (get_urtaDisabled() ? "他的尾巴" : (get_noFur() ? "她深灰色的尾巴" : "她深灰色的皮毛")) + "因为你的突然出现而警惕地竖起，[say: 你来特尔阿德雷城有什么事？][pg]");
            outputText("你耸耸肩，解释说你对这个小镇一无所知，只是在探索沙漠时偶然发现的。那个" + (get_urtaDisabled() ? "男人" : "女孩") + "怀疑地盯着你看了一会儿，然后吹响了一声尖锐的口哨。" + (get_urtaDisabled() ? "他" : "她") + "命令道：[say: 别轻举妄动。][pg]");
            outputText("你决定顺从，反正也没什么损失，于是你站在那里，等待着这个" + (get_urtaDisabled() ? "守卫" : "可爱的狐娘") + "召唤的任何增援。不到一分钟，一个胸部相当丰满的半人马娘从大门上开的一扇小门里走了出来，手里拿着一把巨大的弓，箭已经搭在弦上。[pg]");
            outputText("[say: 怎么了，" + (get_urtaDisabled() ? "队长" : "乌尔塔") + "？有恶魔穿过屏障了吗？]这位气势逼人的半人马娘问道。[pg]" + (get_urtaDisabled() ? "狗耳守卫队长摇了摇" : "狐狸乌尔塔摇了摇") + "头，回答道：[say: 我觉得不是，埃德琳。" + get_player().mf("他","她") + "是别的什么东西。我们应该用水晶看看[he]是否适合进入特尔阿德雷。][pg]");
            outputText("你谨慎地看着那个高大的半人马娘拿出一个吊坠，向你走来。[say: 别动，]她说，[say: 这不会伤害你的。][pg]");
            outputText("她把一只手放在你的肩膀上，另一只手拿着水晶。她闭上眼睛，但眉头紧锁，似乎在专注于什么。");
            telAdreCrystal();
         }
         else
         {
            outputText("你再次发现那个" + (get_urtaDisabled() ? "肌肉发达的守卫队长" : "灰" + (get_noFur() ? "发" : "") + "狐狸，乌尔塔，") + "在守卫大门。" + (get_urtaDisabled() ? "他向你点点头，并吹口哨叫来了他的" : "她向你点点头，并吹口哨叫来了她的") + "同伴，埃德琳。半人马娘谨慎地走上前，你再次接受了她的检查，她又拿出了她的魔法护身符。");
            telAdreCrystal();
         }
      }
      
      public function discoverTelAdre() : void
      {
         clearOutput();
         if(!get_game().telAdre.isDiscovered())
         {
            outputText("当你走在沙丘上，试图在这片无迹可寻的沙漠中揭开它的神秘面纱时，无情的沙漠之沙在你的[feet]下发出令人不适的摩擦声。突然，你可以看到远处有一座小城的轮廓，被砂岩城墙环绕着。奇怪的是，几分钟前它还不在那里。这可能只是炎热带来的海市蜃楼。不过话又说回来，你并没有什么特定的方向，往那边走走又有什么坏处呢？");
            outputText("[pg]你要去调查远处的城市吗？");
         }
         else
         {
            outputText("在沙漠沙丘中徘徊时，你再次发现了沙漠之城特尔阿德雷。你可以再次徒步走过去，但你内心深处有些害怕再次因为“不纯洁”而被拒绝。你要尝试吗？");
         }
         doYesNo(encounterTelAdre,get_camp().returnToCampUseOneHour);
      }
      
      public function debugMenu(param1:Boolean = true) : void
      {
         get_game().debugMenu.debugCompEdit(saveContent,new SaveContent(null));
      }
      
      public function buyCarrotFromOswald() : void
      {
         var _loc1_:Player = get_player();
         _loc1_.set_gems(_loc1_.get_gems() - 500);
         statScreenRefresh();
         get_player().createKeyItem("Carrot",0,0,0,0);
         clearOutput();
         outputText("宝石瞬间易手，你现在是一根鲜橙色胡萝卜的骄傲主人了！");
         outputText("[pg](<b>获得关键物品：胡萝卜</b>)");
         menu();
         addButton(0,"继续",oswaldPawn);
      }
      
      public function barTelAdre() : void
      {
         spriteSelect(null);
         hideUpDown();
         clearOutput();
         if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,693) == 0 && FlagDict_Impl_.arrayReadInt(KFLAGS.flags,695) == 0 && Utils.rand(10) == 0)
         {
            loppe.loppeFirstMeeting();
            return;
         }
         get_images().showImage("location-teladre-thewetbitch");
         outputText("湿身婊酒馆的内部与它的名字所暗示的画面截然不同。它看起来就像一家普通的酒馆，有一个巨大的中央壁炉，许多桌椅，以及一个抛光的深色木制吧台。这里的顾客似乎都穿着得体，像正常人一样交流，前提是如果正常人大多是半人马和各种亚种的犬" + (get_noFur() ? "耳人" : "兽人") + "的话。这里的气氛温暖而友好，而且");
         if(get_player().humanScore() <= 3)
         {
            outputText("尽管你的外貌发生了改变，");
         }
         outputText("你几乎没有受到任何异样的目光。后面有几个房间，还有一条通往楼上的楼梯。");
         scylla.scyllaBarSelectAction();
         menu();
         if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,346) == 1)
         {
            addNextButton("询问艾米莉",get_game().followerInteractions.askAboutAmily);
         }
         if(get_game().time.hours > 17 && get_game().time.hours < 20 && FlagDict_Impl_.arrayReadInt(KFLAGS.flags,150) != -1)
         {
            dominika.fellatrixBarAppearance();
            addNextButton(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,150) == 0 ? "斗篷女" : "多米妮卡",dominika.fellatrixBarApproach).hint(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,150) == 0 ? "靠近那个裹着布的女人，试着和她搭话。" : "和多米妮卡搭讪，她是一个裹着布的女人。在玛瑞斯这可是个罕见的景象。");
         }
         if(edryn.pregnancy.get_type() != 31)
         {
            if(edryn.edrynBar())
            {
               if(edryn.pregnancy.get_isPregnant())
               {
                  if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,71) == 0)
                  {
                     FlagDict_Impl_.arrayWriteInt(KFLAGS.flags,71,1);
                     if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,69) == 0)
                     {
                        outputText("[pg]埃德琳看到你时笑了笑，并向你招手。恐惧和某种狂热的渴求写在她的脸上，恳求你立刻过去。不管是什么问题，看起来都刻不容缓。");
                        doNext(edryn.findOutEdrynIsPregnant);
                        return;
                     }
                     outputText("[pg]埃德琳冲你笑了笑，大喊道：[say: 猜猜怎么着，[name]？我又怀孕了！]酒馆里响起了一阵起哄和口哨声，但很快就平息了。你想知道她的气味是否还会像以前一样浓烈？");
                  }
                  else
                  {
                     outputText("[pg]埃德琳坐在她常坐的桌子旁，正狼吞虎咽地大吃特吃。她旁边堆着一叠盘子。显然，她一直在尽最大努力喂养她未出生的孩子。她注意到了你，向你挥手，脸涨得通红。");
                  }
               }
               else if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,72) == 1)
               {
                  outputText("[pg]半人马娘埃德琳不再怀孕了！她兴奋地向你挥手，示意你过去看她。看来她已经生下了你的孩子！");
               }
               else if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,69) > 0)
               {
                  outputText("[pg]埃德琳坐在她常坐的位置上，挑着一盘蔬菜，喝着一杯当地的蜂蜜酒。她看起来很无聊，直到她看到了你。她的表情立刻亮了起来，埃德琳摆弄着她的头发，稍微改变了她的姿势。你不确定她是否是有意的，但她的乳沟以一种诱人的方式突出地展示出来。");
               }
               else if(get_player().statusEffectv1(StatusEffects.Edryn) < 3)
               {
                  outputText("[pg]你在门口遇到的半人马娘埃德琳在这里，独自坐在桌旁喝着一杯酒。你想你可以过去和她聊聊。");
               }
               else
               {
                  outputText("[pg]半人马娘埃德琳在这里，独自在一张桌子旁喝着酒。她抬起头发现了你，眼睛里闪烁着幸福的光芒。她向你眨了眨眼，问你是否愿意加入她。");
               }
               addNextButton("埃德琳",edryn.edrynBarTalk).hint("与半人马娘埃德琳交谈" + (get_urtaDisabled() ? "" : "，她是乌尔塔的朋友") + "。");
            }
         }
         if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,1225) == 4)
         {
            if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,398) == 4)
            {
               katherine.barFirstEncounter();
               return;
            }
            if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,1232) == 31 && get_game().urta.urtaAtBar() && !get_game().urta.urtaDrunk() && FlagDict_Impl_.arrayReadInt(KFLAGS.flags,31) == 0)
            {
               katherine.barKathUrtaLoveAnnounce();
               return;
            }
            katherine.barDescription();
            addNextButton("凯瑟琳",katherine.barApproach).hint("和你的猫" + (get_noFur() ? "娘" : "人") + "情人交谈。如果你想的话，你们也许可以一起去她的公寓。");
         }
         if(edryn.edrynHeliaThreesomePossible())
         {
            edryn.helAppearance();
            addNextButton("赫莉娅",edryn.approachHelAtZeBitch).hint("去看看赫莉娅和那些狐狸在做什么。了解她的话，这很可能会以四人行结束。");
         }
         if(auntNancy.auntNancy(false))
         {
            auntNancy.auntNancy(true);
            if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,263) > 0)
            {
               addNextButton("南希",auntNancy.interactWithAuntNancy);
            }
            else
            {
               addNextButton("酒保",auntNancy.interactWithAuntNancy);
            }
         }
         else
         {
            outputText("[pg]看起来现在没有酒保在工作。");
         }
         if(get_game().time.hours >= 8 && get_game().time.hours <= 16 && FlagDict_Impl_.arrayReadInt(KFLAGS.flags,450) == 0)
         {
            niamh.telAdreNiamh();
            if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,446) == 0)
            {
               addNextButton("啤酒猫",niamh.approachNiamh);
            }
            else
            {
               addNextButton("妮芙",niamh.approachNiamh);
            }
         }
         if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,407) == 3 && FlagDict_Impl_.arrayReadInt(KFLAGS.flags,410) == 0 && FlagDict_Impl_.arrayReadInt(KFLAGS.flags,411) == 0)
         {
            addNextButton("兜帽人",get_game().swamp.rogar.rogarThirdPhase);
            outputText("[pg]你注意到吧台前有一个披着斗篷的人影，不过因为背对着你，你完全无法辨认出其他的特征。");
         }
         else if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,407) >= 4 && FlagDict_Impl_.arrayReadInt(KFLAGS.flags,410) == 0 && FlagDict_Impl_.arrayReadInt(KFLAGS.flags,411) == 0)
         {
            addNextButton("罗加",get_game().swamp.rogar.rogarPhaseFour).hint("也许你可以和罗加喝一杯或者找点乐子？");
            outputText("[pg]罗加在这里，背对着门，穿着他平时那件遮蔽身形的斗篷。");
         }
         switch(scylla.get_action())
         {
            case 1:
               outputText("[pg]坐在角落卡座里的一位修女引起了你的注意。她背靠着深色的木椅坐得笔直，纤细的腰肢突显出她胸部柔软的曲线。她穿着一件黑色的长袍，对她的臀部来说似乎小了几个号，头上戴着一块黑白相间的布。");
               addNextButton("修女",scylla.talkToScylla).hint("试着和修女搭讪。");
               break;
            case 2:
               scylla.scyllaRoundII();
               return;
            case 3:
               scylla.scyllaRoundThreeCUM();
               return;
            case 4:
               scylla.scyllaRoundIVGo();
               return;
            case 5:
               outputText("[pg]斯库拉似乎在这里，但正准备离开。你可以去看看这个误入歧途的修女在干什么。");
               addNextButton("斯库拉",scylla.Scylla6);
               break;
            case 6:
               outputText("[pg]你看到斯库拉黑白相间的修女服在其他顾客的头顶上若隐若现。这位高挑的女士似乎并没有意识到她对周围人的影响，但从人们拥挤的方式来看，她显然已经有了一定的名气。你不确定她在做什么，但你可以挤过去看看。");
               addNextButton("斯库拉",scylla.scyllaAdictsAnonV);
               break;
            case 7:
               outputText("[pg]看起来斯库拉今天早上在这里转悠，一边祈祷一边留意着有没有人需要“帮助”。");
               addNextButton("斯库拉",scylla.scyllasFlyingSolo);
         }
         if(katherine.needIntroductionFromScylla())
         {
            katherine.catMorphIntr();
            addNextButton("斯库拉与猫",katherine.katherineGreeting);
         }
         if(get_game().urta.urtaAtBar())
         {
            if(scylla.get_action() == 9)
            {
               outputText("[pg]斯库拉在酒吧里的位置明显空着。她通常在这个时候都在附近，不是吗？乌尔塔吹了声口哨引起了你的注意，并指着后面的一个房间，同时向你眨了眨眼。哦……原来如此。修女肯定不会介意有人帮她喂食的……");
               addNextButton("后室",scylla.openTheDoorToFoursomeWivScyllaAndFurries);
            }
            if(scylla.get_action() == 8)
            {
               if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,143) == 0)
               {
                  outputText("[pg]<b>虽然乌尔塔通常会在这里喝得烂醉，但她常坐的位置却完全空着。你四处打听，但得到的只有耸肩和咯咯的笑声。这里似乎有些不对劲。你看到她最喜欢的一个牌子的威士忌空瓶还在她的桌子上滚动，所以她不可能离开太久。也许她有守卫的任务，或者不得不去后面的房间拿点什么？</b>");
               }
               else
               {
                  outputText("[pg]乌尔塔常坐的位置空着，尽管她的桌子上还放着半杯烈性酒精饮料。如果和上次发生这种情况一样，她肯定是和斯库拉溜进了后面的房间去释放压力了。加入她们也许没什么坏处……");
               }
               FlagDict_Impl_.arrayWriteInt(KFLAGS.flags,13,4);
               addNextButton("后室",get_game().urta.scyllaAndUrtaSittingInATree);
            }
            else if(get_game().urta.urtaBarDescript())
            {
               if(auntNancy.auntNancy(false) && FlagDict_Impl_.arrayReadInt(KFLAGS.flags,801) == 0 && get_game().urta.pregnancy.get_type() == 25)
               {
                  get_game().urtaPregs.urtaIsHappyAboutPregnancyAtTheBar();
                  return;
               }
               addNextButton("乌尔塔",get_game().urta.urtaBarApproach);
            }
         }
         if(vala.purifiedFaerieBitchBar())
         {
            addNextButton("瓦拉",vala.chooseValaInBar).hint("查看瓦拉的新生活。");
         }
         setExitButton("离开",telAdreMenu);
      }
      
      public function armorShops() : void
      {
         var _g:UmasShop;
         clearOutput();
         outputText("特尔阿德雷的商业区恰好位于一条宽阔的死胡同里，入口处有一扇大门，用来在夜间防范小偷。从高处看，这里就像一个巨大的方形庭院。由于城市的购物区集中在一个地方，几乎所有可见的墙壁都被改造成了店面。区域中心还有一些小摊位，看来不是每个人都租得起真正的店铺。");
         outputText("[pg]你一眼就看到了“穿孔工作室”，它那挂满穿孔饰品的半人马招牌非常引人注目。你还能看到一个狼人正在铁匠铺的铁砧上敲打着什么。墙边还排列着其他商店，也许那些店也会很有趣。");
         menu();
         addButton(0,"护甲匠",armorShop.enter).hint("去铁匠铺看看有没有什么防护装备。");
         addButton(1,"武器匠",weaponShop.enter).hint("这里有各种制造痛苦的工具。");
         addButton(2,"裁缝",tailorShop.enter).hint("在这里满足你所有的服装需求。从西装到内衣，应有尽有。");
         addButton(3,"珠宝",jewelryShop.enter).hint("如果你在寻找魔法或装饰用的珠宝，那你来对地方了。");
         addButton(4,"穿孔",yarasShop.piercingStudio).hint("去穿孔工作室做些身体改造。");
         _g = umasShop;
         addButton(5,"诊所",function():void
         {
            _g.enterClinic();
         }).hint("“兽人东方诊所”。这里宣传着一种不同寻常的医疗方式。");
         addButton(6,"木匠",carpentryShop.enter).hint("一家出售建筑设备和材料的商店。");
         addButton(14,"返回",telAdreMenu);
      }
   }
}

