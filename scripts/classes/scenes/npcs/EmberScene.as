package classes.scenes.npcs
{
   import classes.CoC;
   import classes.Cock;
   import classes.CockTypesEnum;
   import classes.DebugMenu;
   import classes.DynStat;
   import classes.ImageManager;
   import classes.PerkLib;
   import classes.Player;
   import classes.PregnancyStore;
   import classes.SelfDebug;
   import classes.StatusEffects;
   import classes.Time;
   import classes.TimeAwareInterface;
   import classes._FlagDict.FlagDict_Impl_;
   import classes.globalFlags.KFLAGS;
   import classes.internals.Utils;
   import classes.items.ConsumableLib;
   import classes.items.ShieldLib;
   import classes.parser._Parser.TagFun_Impl_;
   import classes.saves.SelfSaver;
   import classes.saves.SelfSaving;
   import classes.scenes.Camp;
   import classes.scenes.Inventory;
   import classes.scenes.PregnancyProgression;
   import classes.scenes.VaginalPregnancy;
   import classes.scenes.combat.Combat;
   import classes.scenes.npcs._EmberScene.SaveContent;
   import classes.scenes.places.telAdre.YvonneArmorShop;
   import coc.view.CoCButton;
   import flash.Boot;
   import haxe.IMap;
   
   public class EmberScene extends NPCAwareContent implements VaginalPregnancy, TimeAwareInterface, SelfDebug, SelfSaving
   {
      
      public var saveVersion:int;
      
      public var saveName:String;
      
      public var saveContent:SaveContent;
      
      public var pregnancy:PregnancyStore;
      
      public var globalSave:Boolean;
      
      public function EmberScene()
      {
         if(Boot.skip_constructor)
         {
            return;
         }
         globalSave = false;
         saveVersion = 1;
         saveName = "ember";
         saveContent = new SaveContent(null,null,null,null,null,null,null);
         super();
         pregnancy = new PregnancyStore(1208,553);
         pregnancy.addPregnancyEventSet(25,[330,270,200,180,100,75,48,15]);
         CoC.timeAwareClassAdd(this);
         PregnancyProgression.registerVaginalPregnancyScene(25,17,this);
         SelfSaver.register(this);
         DebugMenu.register(this);
      }
      
      public function watchMediumAffectionEmberEggLay() : void
      {
         clearOutput();
         outputText("当你接受时，烬无法掩饰她的兴奋。[say:好吧，那跟我来。] 你们俩走到一个僻静的地方。一旦她确定周围没有人偷看，烬转过身来面对你");
         if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,525) == 3)
         {
            outputText("，肉棒直挺挺地戳了出来");
         }
         if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,531) == 0 || FlagDict_Impl_.arrayReadInt(KFLAGS.flags,534) > 0)
         {
            outputText("从它藏身的地方");
         }
         outputText("。[say:好吧……但你只允许看！如果你做任何奇怪的事，我发誓我会揍你！]");
         outputText("[pg]你向她保证你不会做任何事");
         if(get_player().lib >= 50)
         {
            outputText("除非她要求你，你露出一个淫荡的笑容");
         }
         outputText("。");
         outputText("[pg]烬坐在附近的一块岩石上，张开双腿，让你完美地看到她" + (littleEmber() ? "无毛的" : "湿润的") + "小穴，因为她即将表演的行为而滴着兴奋的液体。她的手开始按摩，慢慢地描绘着" + (littleEmber() ? "肿胀的" : "") + "外阴唇，每一次抚摸都引起她轻柔的呻吟。她用一只手慢慢地拨开她的阴唇；水分大量泄漏，让她的阴部和手指都看起来闪亮、光滑。");
         outputText("[pg]一旦她完全暴露，你凝视着她粉红色的外阴，它像花朵一样绽放；一朵随着烬发出的每一次愉悦呻吟而收缩的花朵，仿佛在邀请你抚摸它。");
         outputText("[pg]随着烬的表演让你越来越兴奋，你早先承诺要守规矩变得越来越难遵守");
         if(get_player().get_gender() > 0)
         {
            outputText("；");
            if(get_player().hasCock())
            {
               outputText("你[armor]里的凸起");
               if(get_player().hasVagina())
               {
                  outputText("和");
               }
            }
            if(get_player().hasVagina())
            {
               outputText("你自己小穴里聚集的湿润");
            }
            outputText("充分表明");
            if(!get_player().hasCock() || !get_player().hasVagina())
            {
               outputText("");
            }
            outputText("你想要打破承诺的渴望。");
         }
         outputText("[pg]烬的一根带爪的手指慢慢地插入她的深处，一直没入到指关节，引起她长长的喉音呻吟。她设定了一个稳定的节奏；每一次插入都伴随着哼声。很快，你意识到她的抽插变得越来越浅，越来越不规律，直到她拔出手指；蛋的外壳清晰可见，从她的褶皱中露出来。");
         outputText("[pg]这种行为带来的快感，加上在你面前展示如此脆弱姿态的兴奋，几乎让她失去了行动能力。她呻吟着，感觉太舒服了，无法停下，但又太虚弱了，无法继续。[say:[name]！给——给我个痛快！]她在激情的阵痛中喘息着。");
         outputText("[pg]希望她事后不会改变主意，你走上前，开始用手指轻轻抚摸和描摹她的阴唇，挑逗她的阴蒂");
         if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,525) == 3)
         {
            outputText("并抚摸她那根跳动着的肉棒");
         }
         outputText("。");
         outputText("[pg]伴随着一声深沉的呻吟，烬颤抖着高潮了。");
         if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,525) == 3)
         {
            outputText("一股股精液从她的肉棒中喷涌而出，在空中划出一道弧线，落在附近的地上。");
         }
         outputText("蛋堵住了她湿润的欢愉之穴，阻止了任何液体的流出，直到最后伴随着一声湿润的、吧唧作响的爆裂声，它从她的阴部飞出，落入你等待的双手；释放出洪流般的汁液。");
         outputText("[pg]伴随着最后一声如释重负的叹息，烬瘫倒在地，从岩石上滑落到下方干燥的地面上。");
         outputText("[pg]你简单打量了一下这枚蛋，然后将注意力转回了它的源头。你简直不敢相信，你那一直压抑着的龙性竟然真的会做出这种事；看着她，双腿大张地瘫倒在草地上");
         if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,525) == 3)
         {
            outputText("以及她露在外面的肉棒");
         }
         outputText("，很难把她和之前那个充满防御性、愤怒的" + (littleEmber() ? "青春期前小女孩" : "冰山女王") + "联系起来。");
         outputText("[pg]烬慢慢地坐了起来，舔了舔嘴唇，轻声喘息着。[say: 呼……我做到了……]");
         outputText("[pg]你忍不住告诉她，她确实做到了，你举起她刚产下的蛋欣赏着，然后殷勤地伸出手，想拉她站起来。烬接受了，慢慢地稳住身体，但随后，当她握着你湿漉漉的手时，她想起了刚才的一切是怎么结束的。");
         outputText("[pg][say: 你……你……你摸了我……我的……你摸了……]");
         outputText("[pg]是的，你摸了，因为她要求了，而且她似乎需要你的帮助，你指出了这一点。烬懒得想什么说辞，她只是展开翅膀，伴随着一阵风跃入空中。");
         outputText("[pg]你摇了摇头，轻声叹息。");
         get_inventory().takeItem(get_consumables().DRGNEGG,get_camp().returnToCampUseOneHour);
         emberAffection(5);
      }
      
      public function vaginalBirth() : void
      {
         var _loc1_:int = 0;
         var _loc2_:* = null as IMap;
         if(pregnancy.allowHerm && Utils.rand(100) < 20)
         {
            _loc1_ = 3;
         }
         else
         {
            _loc1_ = 1 + Utils.rand(2);
         }
         outputText("[pg]");
         if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,530) == 0)
         {
            get_images().showImage("birth-ember-live");
            if(!get_player().hasVagina())
            {
               outputText("你的胯部传来一阵可怕的撕裂感。你伸手去摸那个柔软的地方，感觉到一阵快感和湿润。<b>你长出了一个阴道！</b>[pg]");
               get_player().createVagina();
            }
            outputText("你发现自己弯下了腰——好吧，考虑到你那巨大的孕肚，你只能尽量弯腰，发出一声空洞的痛苦叫喊。你能感觉到腹部的肌肉开始以一种你确切知道标志着分娩开始的方式挤压和起伏。你大声呼唤烬过来照顾你。烬化作一道模糊的影子冲向你，在离你只有几英寸的地方停下，气喘吁吁。[say: 怎么了？是时候了吗！？你要生了吗！？][Ember ey]急忙问道。你点点头，告诉[Ember em]是的。");
            outputText("[pg]烬没有浪费时间，[Ember ey]把你抱在怀里，带你去了[Ember eir]的巢穴，轻轻地把你放在柔软的树叶上；然后[Ember ey]开始脱你的衣服，以最快的速度脱下你的[armor]。[say: 好的，好的……你需要什么？我、我该怎么办！？你需要什么吗！？你感觉怎么样！？]烬惊慌失措地问，即将发生的事情带来的兴奋对这个龙" + emberMF("男孩","女孩") + "来说太难以承受了。");
            outputText("[pg]你咬紧牙关说你感觉很痛，你想要的是[Ember em]帮你找个舒服的地方，这样你就能把这条像蛇一样的婴儿从你的肠子里弄出来——最好是在他或她直接踢破你的肚子而不是从产道出来之前！!");
            outputText("[pg][say: 好的！马上！]烬赶紧去拿了一堆干净的布，然后把它们铺在[Ember eir]巢穴长满树叶的草地上。" + emberMF("他","她") + "小心翼翼地扶你躺在上面，分开你的双腿，跪在它们之间。[say: 我想尝试一些东西……告诉我你的感觉。]");
            outputText("[pg]烬低下[Ember eir]头，靠近你颤抖的阴道，");
            if(get_player().balls > 0)
            {
               outputText("慢慢地把你的[balls]");
            }
            else if(get_player().hasCock())
            {
               outputText("慢慢地把你的[cocks]");
            }
            if(get_player().balls > 0 || get_player().hasCock())
            {
               outputText("推开，");
            }
            outputText("然后[Ember ey]轻轻地向你收缩的爱穴吹气，慢慢伸出[Ember eir]舌头插入你体内。");
            outputText("[pg]你在痛苦与欢愉交织中呻吟，告诉[Ember em][Ember eir]动作感觉很好，很舒服。[say:求你了，继续，]你恳求道。你问[Ember ey]能不能也试着按摩一下你的肚子，帮着缓解肌肉的紧绷。");
            outputText("[pg]烬照做了，更深地探入你滚烫的产道。其中一只长着爪子的手轻轻伸出，抚摸着你肚子里蠕动的凸起，尽[Ember ey]所能地为你按摩。缓慢但稳定地，你体内的龙宝宝开始顺着产道往下走，在寻求自由的过程中撑开你的身体。");
            get_player().cuntChange(80,true,true,false);
            outputText("[pg]你拼尽全力，汲取着你甚至不确定自己是否拥有的内在力量，徘徊在");
            if(get_player().hasPerk(PerkLib.Masochist))
            {
               outputText("美妙的");
            }
            outputText("痛苦与欢愉的边界上。你不确定自己还能承受多少。");
            outputText("[pg]烬突然抽出[Ember eir]舌头，高兴地尖叫起来，[say:我看到了！用力，[name]！马上就出来了！]");
            outputText("[pg]伴随着最后一声空洞的呻吟，你拼尽全力推挤，迫切地想把孩子抱在怀里，更重要的是，把孩子从子宫里弄出来。突然有一种仿佛被翻转过来的感觉，然后是一种奇妙的、幸福的麻木感。你瘫倒在地，精疲力竭，仿佛从很远的地方听到了新生儿的哭声。");
            outputText("[pg][say:...你...没事吧？...]你隐约听到烬在问你。你看着[Ember eir]眼睛，勉强地点了点头。烬担忧的脸庞变成了如释重负的表情，[Ember ey]平静地照顾着哇哇大哭的小龙，同时等着你休息一会儿，舔舐着它，清理掉伴随你宝宝而来的体液。");
            outputText("[pg]你闭上眼睛，精疲力竭，但很高兴看到你的孩子。不知不觉中，你晕了过去。当你醒来时，你发现自己躺在[bed]上，烬保护性地在你上方盘旋。你问孩子在哪。");
            outputText("[pg]烬平静地对你微笑，指了指你的[chest]。你顺着[Ember eir]手指看去，看到小龙正在吸吮你的[nipple]。[saystart]抱歉。");
            if(_loc1_ == 1)
            {
               outputText("他");
            }
            else
            {
               outputText("她");
            }
            outputText("饿了，我不知道该怎么办，[sayend]烬解释道。");
            if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,529) > 0)
            {
               outputText("[saystart]我试着自己喂");
               if(_loc1_ == 1)
               {
                  outputText("他");
               }
               else
               {
                  outputText("她");
               }
               outputText("，但是");
               if(_loc1_ == 1)
               {
                  outputText("他");
               }
               else
               {
                  outputText("她");
               }
               outputText("想要你的……[sayend]");
            }
            outputText("[pg]你轻叹一声，抚摸着新生儿的头，任由它卖力地吸吮着你的[nipple]。说到这个，你问烬你生了什么——男孩？女孩？还是双性？");
            outputText("[pg]烬叹了口气，对你微笑着。[saystart]是个漂亮、健康的");
            switch(_loc1_)
            {
               case 1:
                  outputText("男孩");
                  break;
               case 2:
                  outputText("女孩");
                  break;
               case 3:
                  outputText("双性儿");
                  break;
               default:
                  outputText("错误 " + _loc1_);
            }
            outputText("。[sayend]");
            outputText("[pg]你对着[Ember em]和你美丽的新生儿微笑，孩子突然停止了吸吮，皱起");
            if(_loc1_ == 1)
            {
               outputText("他");
            }
            else
            {
               outputText("她");
            }
            outputText("的小脸，开始轻声哭泣。你温柔地把");
            if(_loc1_ == 1)
            {
               outputText("他");
            }
            else
            {
               outputText("她");
            }
            outputText("抱到你的肩膀上，轻轻拍打");
            if(_loc1_ == 1)
            {
               outputText("他");
            }
            else
            {
               outputText("她");
            }
            outputText("的背部，就在");
            if(_loc1_ == 1)
            {
               outputText("他");
            }
            else
            {
               outputText("她");
            }
            outputText("小翅膀，引得");
            if(_loc1_ == 1)
            {
               outputText("他");
            }
            else
            {
               outputText("她");
            }
            outputText("打了个嗝，显然感觉好多了。");
            if(_loc1_ == 1)
            {
               outputText("他");
            }
            else
            {
               outputText("她");
            }
            outputText("咕咕叫着，咯咯笑着，在你的脖子上蹭来蹭去，显然很高兴终于来到了这个真实的世界。");
            outputText("[pg][say: 我来照顾小家伙，你可以再休息一会儿，] 烬提议道，将可爱的小龙抱在[Ember eir]怀里。你叹了口气，感激地点点头，然后躺下继续休息。[pg]");
            switch(_loc1_)
            {
               case 1:
                  _loc2_ = KFLAGS.flags;
                  FlagDict_Impl_.arrayWriteInt(_loc2_,554,FlagDict_Impl_.arrayReadInt(_loc2_,554) + 1);
                  break;
               case 2:
                  _loc2_ = KFLAGS.flags;
                  FlagDict_Impl_.arrayWriteInt(_loc2_,555,FlagDict_Impl_.arrayReadInt(_loc2_,555) + 1);
                  break;
               case 3:
                  _loc2_ = KFLAGS.flags;
                  FlagDict_Impl_.arrayWriteInt(_loc2_,556,FlagDict_Impl_.arrayReadInt(_loc2_,556) + 1);
            }
            saveContent.newbornGender = _loc1_;
            saveContent.birthTime = get_time().days;
         }
         else
         {
            get_images().showImage("birth-ember-egg");
            if(!get_player().hasVagina())
            {
               outputText("你的胯部传来一阵可怕的撕裂感。你伸手去摸那个柔软的地方，感觉到一阵快感和湿润。<b>你长出了一个阴道！</b>[pg]");
               get_player().createVagina();
            }
            outputText("你发现自己弯下了腰——好吧，考虑到你那巨大沉重的肚子，你只能弯到这种程度，发出一声空洞的痛苦叫喊。你能感觉到腹部的肌肉开始以一种你确信标志着分娩开始的方式挤压和起伏。你大声呼唤烬来照顾你。烬化作一道残影冲向你，在离你几英寸的地方停下，气喘吁吁。[say: 怎么了？是时候了吗！？你准备好下蛋了吗！？] [Ember ey]急忙问道。你点点头，告诉[Ember em]你准备好了。");
            outputText("[pg]烬没有浪费时间——[Ember ey]把你抱在[Ember eir]怀里，带你去了[Ember eir]巢穴，轻轻地把你放在柔软的叶子上。然后[Ember ey]开始给你脱衣服，以最快的速度脱下你的[armor]。[say: 好的，好的……你需要什么？我-我该怎么做！？你需要什么吗！？你感觉怎么样！？] 烬惊慌失措地问道，即将发生的事情带来的兴奋让这个龙" + emberMF("男孩","女孩") + "难以承受。");
            outputText("[pg]你咬紧牙关说你感觉很痛，你想要的是[Ember em]帮你找个舒服的地方，这样你就能把这个该死的巨蛋生出来。");
            outputText("[pg][say: 好的！对！] 烬急忙去拿了一堆干净的布；然后把它们铺在[Ember eir]巢穴长满叶子的草地上。小心翼翼地，[Ember ey]扶你躺在上面，分开你的[legs]，跪在它们之间。[say: 我要试一试……告诉我你感觉怎么样。]");
            outputText("[pg]烬将[Ember eir]头低下，靠近你颤抖的[vagina]，");
            if(get_player().balls > 0)
            {
               outputText("慢慢地把你的[balls]");
            }
            else if(get_player().hasCock())
            {
               outputText("慢慢地把你的[cocks]");
            }
            if(get_player().balls > 0 || get_player().hasCock())
            {
               outputText("推开，");
            }
            outputText("然后[Ember ey]轻轻地向你收缩的爱穴吹气，慢慢伸出[Ember eir]舌头插入你体内。");
            outputText("[pg]你在快感和痛苦中呻吟，告诉[Ember em][Ember eir]的动作感觉很好，很舒缓，并恳求她继续。你问[Ember ey]能不能也试着按摩你的肚子，帮助放松你肌肉的紧张。");
            outputText("[pg]烬照做了，更深地探入你灼热的通道；[Ember eir]的一只爪子轻轻伸向你腹部突出的肿块，尽[Ember ey]所能地为你按摩。缓慢而稳定地，你体内的龙蛋开始顺着产道往下走，在寻求自由的过程中撑开你。");
            outputText("[pg]你拼尽全力，汲取着你甚至不确定自己是否拥有的内在力量，徘徊在");
            if(get_player().hasPerk(PerkLib.Masochist))
            {
               outputText("美妙的");
            }
            outputText("痛苦与欢愉的边界上。你不确定自己还能承受多少。");
            outputText("[pg]烬突然抽出[Ember eir]舌头，高兴地尖叫起来，[say:我看到了！用力，[name]！马上就出来了！]");
            outputText("[pg]伴随着最后一声空洞的呻吟，你拼尽全力推挤，渴望摆脱这沉重的龙蛋。突然，你感觉自己仿佛被翻转了过来，紧接着是一种奇妙而幸福的麻木感。你瘫倒在地，精疲力竭。");
            get_player().cuntChange(80,true,true,false);
            outputText("[pg][say:……你……还好吗？……]你隐约听到烬在问你。你看着[Ember eir]眼睛，勉强虚弱地点了点头。烬担忧的脸庞转为释然，[Ember ey]平静地照料着龙蛋，等你稍微休息一会儿，同时舔舐着龙蛋，清理掉上面附着的体液。");
            outputText("[pg]你看着[Ember em]照料龙蛋，虚弱地问谁来负责保护它直到孵化。[say:别担心，[name]。我会照顾这颗蛋的。现在，你只管休息，]烬回答道，俯下身在你的额头上轻轻吻了一下。");
            outputText("[pg]你疲惫地点点头，躺下闭上眼睛，让自己沉入梦乡，以逃避这具饱受摧残的身体带来的疲惫。");
            outputText("[pg]当你终于恢复意识时，你不确定自己睡了多久。不过，你醒来时，感觉到[nipple]传来最美妙的感觉，还有柔软的手在抚摸和挤压你的[chest]。你睁开眼睛，发现烬正俯身在你上方，贪婪地吸吮着你的乳汁。你忍不住问[Ember ey]在做什么。");
            outputText("[pg]烬");
            if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,531) > 0)
            {
               outputText("脸红了，");
            }
            outputText("退了回去，舔掉嘴唇上残留的一滴乳汁。[say:抱歉，只是你看起来太胀了，那么多奶水浪费了多可惜……所以，我想我可以自己来，才不是我一直想喝你的奶什么的。]");
            outputText("[pg]你告诉[Ember em]，先问一下才礼貌。不过，你很乐意让[Ember em]喝个够。这确实让你的乳房感觉好多了。烬慢慢回到你期待的乳头前，继续[Ember eir]吸吮。");
            outputText("[pg]你躺回去享受着，等待[Ember em]喝饱。当[Ember ey]终于喝完时，烬在你的脸颊上轻轻吻了一下，说道，[say:谢谢你的奶水。你应该再休息一会儿，抱歉吵醒你了。]");
            outputText("[pg]你告诉[Ember em]没关系。然后，你对[Ember em]苦笑了一下，告诉[Ember em]这可能是为将来蛋");
            if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,557) > 0)
            {
               outputText("孵化");
            }
            else
            {
               outputText("孵化");
            }
            outputText("做练习。这条龙");
            if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,531) > 0)
            {
               outputText("脸红了，然后");
            }
            outputText("匆匆跑开了，而你也撑起身子，准备去忙自己的事。[pg]");
            if(get_player().pregnancyAllowHerm)
            {
               _loc2_ = KFLAGS.flags;
               FlagDict_Impl_.arrayWriteInt(_loc2_,2789,FlagDict_Impl_.arrayReadInt(_loc2_,2789) + 1);
            }
            else
            {
               _loc2_ = KFLAGS.flags;
               FlagDict_Impl_.arrayWriteInt(_loc2_,557,FlagDict_Impl_.arrayReadInt(_loc2_,557) + 1);
            }
            saveContent.eggArray.push(336);
         }
         get_player().createStatusEffect(StatusEffects.EmberNapping,5,0,0,0);
      }
      
      public function useSuccubiMilkOnEmber(param1:Boolean = false) : void
      {
         clearOutput();
         if(param1)
         {
            get_player().consumeItem(get_consumables().P_S_MLK);
            emberCorruption(-10);
         }
         else
         {
            get_player().consumeItem(get_consumables().SUCMILK);
            emberCorruption(10);
         }
         outputText("拔下奶瓶的盖子，你将里面的东西倒在蛋上——多孔的蛋壳吸收牛奶的速度和你倒的一样快，一滴也没有洒出来。");
         if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,525) == 3 || FlagDict_Impl_.arrayReadInt(KFLAGS.flags,525) == 0)
         {
            outputText("蛋壳慢慢变成暗粉色。");
            FlagDict_Impl_.arrayWriteInt(KFLAGS.flags,525,2);
         }
         else if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,525) == 1)
         {
            outputText("蛋壳慢慢变成淡紫色。");
            FlagDict_Impl_.arrayWriteInt(KFLAGS.flags,525,3);
         }
         var _loc2_:IMap = KFLAGS.flags;
         FlagDict_Impl_.arrayWriteInt(_loc2_,532,FlagDict_Impl_.arrayReadInt(_loc2_,532) + 1);
         doNext(playerMenu);
      }
      
      public function useOviElixerOnEmber() : void
      {
         clearOutput();
         get_player().consumeItem(get_consumables().OVIELIX);
         outputText("拔开水晶瓶的塞子，你将里面奇怪的绿色液体倒在蛋上，短暂地想知道它到底要这东西干什么，然后才意识到自己的谬误。这是一个蛋，对吧？它不可能想要东西……液体洒满了蛋壳，将其覆盖，然后渗入内部，在蛋原本苍白的表面留下了绿色的小斑点。");
         FlagDict_Impl_.arrayWriteInt(KFLAGS.flags,530,1);
         var _loc1_:IMap = KFLAGS.flags;
         FlagDict_Impl_.arrayWriteInt(_loc1_,532,FlagDict_Impl_.arrayReadInt(_loc1_,532) + 1);
         doNext(playerMenu);
      }
      
      public function useLolipopOnEmber() : void
      {
         clearOutput();
         get_player().consumeItem(get_consumables().LOLIPOP);
         outputText("你把硬糖磨成粉末，和水混合，变成粘稠的红色糊状物。当你把混合物倒在蛋上时，甜甜的气味充满了你的鼻子，蛋壳慢慢变成了较浅的颜色。");
         FlagDict_Impl_.arrayWriteInt(KFLAGS.flags,2779,1);
         var _loc1_:IMap = KFLAGS.flags;
         FlagDict_Impl_.arrayWriteInt(_loc1_,532,FlagDict_Impl_.arrayReadInt(_loc1_,532) + 1);
         doNext(playerMenu);
      }
      
      public function useLactaidOnEmber() : void
      {
         clearOutput();
         get_player().consumeItem(get_consumables().LACTAID);
         outputText("你感到有些困惑，将乳白色的液体倒在蛋上。它被蛋壳吸收了，蛋壳表面突然形成了一张蜘蛛网般的乳黄色静脉状斑纹。");
         FlagDict_Impl_.arrayWriteInt(KFLAGS.flags,529,1);
         var _loc1_:IMap = KFLAGS.flags;
         FlagDict_Impl_.arrayWriteInt(_loc1_,532,FlagDict_Impl_.arrayReadInt(_loc1_,532) + 1);
         doNext(playerMenu);
      }
      
      public function useIncubusDraftOnEmber(param1:Boolean = false) : void
      {
         clearOutput();
         if(param1)
         {
            get_player().consumeItem(get_consumables().P_DRAFT);
            emberCorruption(-10);
         }
         else
         {
            get_player().consumeItem(get_consumables().INCUBID);
            emberCorruption(10);
         }
         outputText("拔开小瓶的塞子，你将黏糊糊的灰白色液体滴在蛋的尖端。液体在表面缓慢流淌，然后渗入蛋壳，没有留下一滴水分。");
         if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,525) == 3 || FlagDict_Impl_.arrayReadInt(KFLAGS.flags,525) == 0)
         {
            outputText("蛋壳慢慢变成柔和的淡蓝色。");
            FlagDict_Impl_.arrayWriteInt(KFLAGS.flags,525,1);
         }
         else if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,525) == 2)
         {
            outputText("蛋壳慢慢变成淡紫色。");
            FlagDict_Impl_.arrayWriteInt(KFLAGS.flags,525,3);
         }
         var _loc2_:IMap = KFLAGS.flags;
         FlagDict_Impl_.arrayWriteInt(_loc2_,532,FlagDict_Impl_.arrayReadInt(_loc2_,532) + 1);
         doNext(playerMenu);
      }
      
      public function updateVaginalPregnancy() : Boolean
      {
         var _loc1_:Boolean = false;
         var _loc2_:String = "";
         if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,530) > 0)
         {
            if(get_player().get_pregnancyIncubation() == 330)
            {
               _loc2_ = "你的肚子肿胀起来，变得更大了——这证明烬的种子起了作用。这条龙似乎一直在打量你，仿佛在寻找体重增加的迹象。";
            }
            if(get_player().get_pregnancyIncubation() == 250)
            {
               _loc2_ = "你的肚子越来越大，让你的怀孕变得显而易见；你的肚子也感觉有些坚实。每当[Ember ey]认为你没在看的时候，烬就会向你投来满意的目光。";
            }
            if(get_player().get_pregnancyIncubation() == 170)
            {
               _loc2_ = "你长大了不少。任何人只要看一眼就能看出你怀孕了；而且从形状来看，你毫不怀疑你的子宫里有一颗蛋；一颗很大的蛋。";
               if(get_player().cor < 40)
               {
                  _loc2_ += " 你的内心深处其实并不想怀孕，但这是为了一个崇高的目标。而且，每当烬看向你的肚子时，[Ember ey]试图掩饰自己喜悦的样子看起来非常可爱……...";
               }
               else if(get_player().cor < 75)
               {
                  _loc2_ += " 考虑到这颗蛋的大小，你希望孩子出生时不会太疼。你希望烬能陪你度过这个难关。";
               }
               else
               {
                  _loc2_ += " 你满怀憧憬地回味着孕育这个小生命的狂野性爱。烬的性爱技巧真是太棒了" + (littleEmber() ? " 这么年轻就这么厉害" : "") + "。说真的，你为这个世界带来更多烬的后代，简直是在造福世界。";
               }
            }
            if(get_player().get_pregnancyIncubation() == 120)
            {
               _loc2_ = "虽然你确信这个时候普通的婴儿应该已经开始胎动了，但你的肚子只是沉甸甸、鼓鼓地待在那里。如果你不记得烬是从蛋里孵出来的，你肯定会担心的。有时，一股令人愉悦、清爽的凉意会从你的肚子蔓延到全身；让你感到精神焕发，准备好迎接任何挑战。";
            }
            if(get_player().get_pregnancyIncubation() == 90)
            {
               _loc2_ = "不知怎么的，你的肚子变得更大了，蛋的轮廓透过你的肚皮显现出来。到现在，你已经对行动越来越困难感到相当烦恼了。烬在营地里总是形影不离地跟着你，确保你安然无恙，不过如果你问起[Ember em]，[Ember ey]只会说你们刚好顺路。";
            }
            if(get_player().get_pregnancyIncubation() == 60)
            {
               _loc2_ = "你肚子里的蛋似乎一天比一天重。";
               if(get_player().cor < 40)
               {
                  _loc2_ += "你承受着相当大的负担。不过，为了复兴烬的种族，做出这样的牺牲是值得的。";
               }
               else if(get_player().cor < 75)
               {
                  _loc2_ += "你想知道还要等多久。这颗蛋真是个沉重的负担。你一方面对它的大小感到害怕，另一方面又为能生出这么大的蛋而感到高兴。";
               }
               else
               {
                  _loc2_ += "你渴望分娩，只是为了能再次怀孕。特别是因为这意味着能和" + (littleEmber() ? "你未成年的龙" : "烬") + "进行更多狂野的性爱。";
               }
            }
            if(get_player().get_pregnancyIncubation() == 30)
            {
               _loc2_ = "你抚摸着自己成熟的肚子，沉浸在做母亲的感觉中。";
               dynStats(DynStat.Sens(5),DynStat.Lust(5 + get_player().sens / 20));
               if(get_player().cor < 40)
               {
                  _loc2_ += "尽管你最初有些不情愿，但你已经开始在怀孕中找到一种非常真实的快乐。你希望烬将来想要更多的孩子……...";
               }
               else if(get_player().cor < 75)
               {
                  _loc2_ += "你微笑着，知道在接下来的几天里，你就能把蛋捧在手里了。你心里有一丝失落，因为你的肚子即将变空，但你总是可以诱惑烬让你再次怀孕。";
               }
               else
               {
                  _loc2_ += "你发现自己开始幻想分娩的情景，你的肚子肿胀得巨大——比现在还要大——许多又大又圆的蛋从你的[vagina]滑出，带来高潮般的快感。\n\n当你想象着成打的蛋从你体内产出时，你开始心不在焉地抚摸自己；你将成为一个全新龙族的母神……...";
                  dynStats(DynStat.Lust(35));
               }
               _loc2_ += "\n\n烬的一个问题打断了你的沉思。[say: 你感觉怎么样？需要我给你拿点什么吗？]";
               _loc2_ += "\n\n这条龙的问题对[Ember em]来说很不寻常。不过，你确实很感激你得到的关注，所以你让烬去给你拿些食物和水。烬冲出去满足你要求的速度真是令人印象深刻！没过多久，烬就带着一块烤肉和一个水袋回来了。";
               _loc2_ += "\n\n当你吃饱喝足时，烬用一只翅膀为你遮挡阳光。你开始真正享受所有的关注，但看到烬放弃了[Ember eir]平时的滑稽动作，还是觉得很奇怪。";
            }
         }
         else
         {
            if(get_player().get_pregnancyIncubation() == 330)
            {
               _loc2_ = "你的肚子有点肿——要么是你吃得太多，要么是烬的种子真的起作用了。";
            }
            if(get_player().get_pregnancyIncubation() == 250)
            {
               _loc2_ = "你的肚子越来越大，让你的怀孕变得显而易见。烬飞快地瞥了你几眼，每次都试图掩饰[Ember eir]成功的得意笑容。你对着[Ember em]得意地笑回去，偶尔还会巧妙地展示一下你怀孕的身姿，只是为了看看[Ember em]被这景象弄得欲火焚身的样子。";
            }
            if(get_player().get_pregnancyIncubation() == 170)
            {
               _loc2_ = "你长大了不少，任何人一眼就能看出你怀孕了。";
               if(get_player().cor < 40)
               {
                  _loc2_ += "你的内心深处其实并不想怀孕。然而，每当烬看向你时，[Ember ey]满足的表情还是让你觉得很值得。而且，这是为了一个崇高的目标。你满意地笑了笑——有几条龙听候你的差遣，事情确实会大不相同。";
               }
               else if(get_player().cor < 75)
               {
                  _loc2_ += "你咧嘴一笑，品味着从你日益隆起的子宫内孕育的生命中传来的那种奇妙而又情色的感觉，以及即将成为母亲的期盼。嗯，如果感觉这么好，也许你应该[say: 鼓励]烬再让你怀孕一次。";
               }
               else
               {
                  _loc2_ += "你如梦似幻地回味着孕育这个小家伙的那场狂野性爱。烬的床技真是太棒了" + (littleEmber() ? "，尽管年纪还这么小" : "") + "。说真的，给这个世界带来更多烬的后代，你简直是在造福世界。";
               }
            }
            if(get_player().get_pregnancyIncubation() == 120)
            {
               _loc2_ = "每隔一会儿，你就会感觉到高高隆起的肚子里传来一阵踢动。现在，它简直是在里面翻江倒海，所以你决定坐下来休息一下。你不断抚摸着肚子，希望能安抚你的孩子，让它别再折腾你的内脏了。";
               _loc2_ += "[pg]烬走到你身边，随口问道：[say: 所以……它已经开始踢了吗？]";
               _loc2_ += "[pg]你抚摸着肚子，承认确实如此。你随口问烬是否想摸摸你的肚子，心里好奇[Ember ey]能不能鼓起勇气这么做。";
               _loc2_ += "[pg][say: 想！当然想！]烬回答道";
               if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,531) == 1)
               {
                  _loc2_ += "，为自己过于热情的回答羞红了脸";
               }
               _loc2_ += "。你只是鼓励地对着这个龙族" + get_game().emberScene.emberMF("男孩","扶她") + "笑了笑，身子微微后倾，挺出你怀孕的腹部，公开鼓励它的" + get_game().emberScene.emberMF("父亲","母亲") + "试着与[Ember eir]未出生的孩子建立联系。";
               _loc2_ += "[pg]烬将长着爪子的手放在你的肚子上，小心翼翼地不让爪子弄伤你。[Ember ey]慢慢地抚摸着你的肚子，直到感觉到一阵轻微的踢动，[Ember ey]高兴地笑了起来。看着[Ember eir]脸上喜悦的神情，你也露出了微笑，直到[Ember ey]意识到自己在做什么，尴尬地嘟囔了一个借口，转身走开了。";
            }
            if(get_player().get_pregnancyIncubation() == 90)
            {
               _loc2_ = "你停下脚步，在附近的一块石头上坐下。你的肚子感觉比平时重得多，光是走动就成了一件苦差事。烬注意到了你的疲态，迅速拉近了你们之间的距离。[say: [name]，你感觉还好吗？]";
               _loc2_ += "[pg]你告诉[Ember em]你没事，只是累坏了。毕竟，怀着[Ember eir]孩子可不是件容易的事。";
               _loc2_ += "[pg]烬松了一口气。[say: 那就好，有什么我能为你做的吗？]";
               _loc2_ += "[pg]你若有所思地轻敲嘴唇，仔细琢磨着。";
               if(get_player().cor <= 33)
               {
                  _loc2_ += "你现在确实不觉得需要什么……也许喝点水？或者你可以让烬扶你回" + get_camp().homeDesc() + "稍微休息一下？";
               }
               else if(get_player().cor <= 66)
               {
                  _loc2_ += "你想知道是否应该占一下烬的便宜——你最近确实感觉有点烦躁，而且[Ember ey]确实说了“任何事”。你又考虑了一会儿。";
               }
               else
               {
                  _loc2_ += "你已经想到了一个让这个性感的龙族" + (littleEmber() ? "孩子" : "") + "帮你的完美方法，但最好不要着急。烬可不是每天都会说[Ember ey]愿意为你做“任何事”的。不过，未出生的孩子在肚子里猛地一踢，让你微微瑟缩了一下。也许最好还是等这个小家伙出生以后再说，这样你就能再怀一个了。你又琢磨了一会儿该向[Ember em]提出什么要求。";
               }
               _loc2_ += "[pg]最后，你决定确实没什么需要烬帮忙的，并把这告诉了[Ember em]。不过，等孩子出生需要照顾的时候，[Ember ey]最好准备好尽到[Ember eir]本分。";
               if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,525) == 1 && FlagDict_Impl_.arrayReadInt(KFLAGS.flags,529) > 0)
               {
                  _loc2_ += " 你忍不住坏笑起来，拍了拍你这只扶她龙" + (littleEmber() ? "小巧的" : "丰满的") + "乳房，心想也许你应该让他来包揽所有的母乳喂养工作。";
               }
               _loc2_ += "[pg]";
               if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,531) > 0)
               {
                  _loc2_ += "烬红了脸。";
               }
               _loc2_ += "[say: 当、当然，我会尽我所能。如果你不需要我帮忙，那我就先走了。] " + get_game().emberScene.emberMF("他","她") + "转过身，径直走开了。你看着[Ember em]离去的背影，拍了拍自己的肚子，然后费力地站直身子，继续赶路。";
            }
            if(get_player().get_pregnancyIncubation() == 60)
            {
               _loc2_ = "你的肚子不仅大得离谱，如果在英格纳姆，别人肯定会问你是不是怀了双胞胎，而且还重得要命，";
               if(get_player().cor <= 33)
               {
                  _loc2_ += "这让你比以往任何时候都更加怀疑，怀上一条龙的孩子到底是不是个好主意。诚然，看到你硕果累累的肚子，烬看起来自豪得快要爆炸了，但你觉得自己才是真的快要爆炸了。";
               }
               else if(get_player().cor <= 66)
               {
                  _loc2_ += "你不知道还要等多久。尽管有些麻烦，但你很高兴你的孩子正在长成一条健康、希望也很性感的龙；就像它的父亲一样。";
               }
               else
               {
                  _loc2_ += "你渴望生下孩子，这样你就能再次怀孕了。特别是因为这意味着烬会更狂野地操你。";
               }
            }
            if(get_player().get_pregnancyIncubation() == 30)
            {
               _loc2_ = "你抚摸着自己那饱满成熟的肚子，沉浸在母性的感觉中。";
               if(get_player().cor <= 33)
               {
                  _loc2_ += "尽管一开始有些不情愿，但你已经开始在怀孕中找到了真正的乐趣。你希望烬将来能想要更多的孩子。";
               }
               else if(get_player().cor <= 66)
               {
                  _loc2_ += "你微笑着，知道在接下来的几天里你就能见到你的孩子了。你心里有一部分几乎因为即将变得空虚而感到悲伤，但你总是可以诱惑烬让你再次怀孕。";
               }
               else
               {
                  _loc2_ += "你发现自己做起了白日梦，梦想着成为一支庞大龙族军队的受人尊敬的母后，幻想着那些华丽、性感、长满鳞片的野兽横扫大地，以你的名义征服一切，向孕育了它们的永远成熟的子宫献上贡品；它们在地上翻滚，交配的麝香味弥漫在空气中。这个画面太美妙了，你都不想从幻想中醒来。";
               }
            }
         }
         if(_loc2_ != "")
         {
            outputText("[pg]" + _loc2_ + "[pg]");
            _loc1_ = true;
         }
         return _loc1_;
      }
      
      public function timeToPuffTheMagicDragon() : void
      {
         clearOutput();
         outputText("你晕晕乎乎的，也回嗅着烬。嗯……" + emberMF("他","她") + "闻起来也很美味，你告诉[Ember em]。");
         outputText("[pg][say: 我知道，对吧？]烬在你耳边发出呼噜声，调皮地舔了你一下。[say: 噢，玛莱啊，脱掉你的[armor]，我们来做吧！我才不管我们是不是在营地中间！]");
         outputText("[pg]你勉强抵挡住了[Ember eir]的暗示，强迫自己踉踉跄跄地走向你的[cabin]，以求一点隐私。这比你想象的要难，不仅因为你下半身熊熊燃烧的欲火，还因为" + (littleEmber() ? "那个小" + emberMF("男孩","女孩") : "烬") + "正死死地缠着你，拼尽全力想要脱掉你的[armor]。你很欣赏[Ember eir]的热情，但[Ember ey]所做的只是在碍事！!");
         outputText("[pg]不知怎么的，你避开了[Ember eir]紧抓不放的爪子，脱得只剩内衣，烬立刻咬住它，差点把它从你的[legs]上撕下来。烬扑通一声倒在你的[bed]上，咀嚼着你的内裤。" + emberMF("他","她") + "诱人地张开双腿，吐出你——现在已经湿透了的——内裤。[say: 我们在你的床上做吧！它闻起来太像你了……我说过你闻起来有多香吗？来吧，[name]；操我，妈的！]");
         outputText("[pg]你再也受不了了，猛地扑向[Ember em]；[Ember ey]这么想要你？好吧，你也一样想要[Ember em]；让我们看看[Ember ey]会怎么对你！!");
         if(get_player().get_pregnancyIncubation() == 0 && !pregnancy.get_isPregnant() && FlagDict_Impl_.arrayReadInt(KFLAGS.flags,525) == 3 && get_player().get_gender() == 3)
         {
            outputText("[pg](谁来生孩子？)");
            menu();
            addButton(0,"烬",breedEmberPregnantAsIfThereWasAnyOtherKindOfBreeding);
            addButton(1,"你",getKnockedUpByEmbrahBroBaby);
         }
         else if(get_player().get_pregnancyIncubation() == 0 && emberHasCock() && get_player().get_inHeat())
         {
            getKnockedUpByEmbrahBroBaby();
         }
         else
         {
            breedEmberPregnantAsIfThereWasAnyOtherKindOfBreeding();
         }
      }
      
      public function timeChangeLarge() : Boolean
      {
         if(!get_player().hasStatusEffect(StatusEffects.EmberNapping) && followerEmber() && !get_player().hasStatusEffect(StatusEffects.EmberFuckCooldown))
         {
            if(get_player().hasVagina() && get_player().get_inHeat() && get_player().get_pregnancyIncubation() == 0 && Utils.rand(10) == 0 && emberHasCock())
            {
               emberRapesYourHeatness();
               return true;
            }
            if(get_player().hasCock() && get_player().get_inRut() && !pregnancy.get_isPregnant() && Utils.rand(10) == 0 && emberHasVagina())
            {
               emberRapesYourHeatness();
               return true;
            }
         }
         return false;
      }
      
      public function timeChange() : Boolean
      {
         var _loc3_:* = null as Array;
         var _loc4_:* = null as IMap;
         var _loc1_:Boolean = false;
         pregnancy.pregnancyAdvance();
         if(pregnancy.get_isPregnant())
         {
            if(emberPregUpdate())
            {
               _loc1_ = true;
            }
            if(pregnancy.get_incubation() == 0)
            {
               emberGivesBirth();
               pregnancy.knockUpForce();
               _loc1_ = true;
            }
         }
         while(int(saveContent.eggArray.length) < FlagDict_Impl_.arrayReadInt(KFLAGS.flags,557) + FlagDict_Impl_.arrayReadInt(KFLAGS.flags,2789))
         {
            saveContent.eggArray.push(336);
         }
         var _loc2_:int = 0;
         while(_loc2_ < int(saveContent.eggArray.length))
         {
            _loc3_ = saveContent.eggArray;
            _loc3_[_loc2_] -= 1;
            if(int(saveContent.eggArray[_loc2_]) <= 0 && saveContent.hatchedToday != get_time().days)
            {
               emberHatchEggs(_loc2_);
               saveContent.hatchedToday = get_time().days;
               _loc1_ = true;
            }
            _loc2_++;
         }
         if(get_player().statusEffectv1(StatusEffects.EmberFuckCooldown) > 0)
         {
            get_player().addStatusValue(StatusEffects.EmberFuckCooldown,1,-1);
            if(get_player().statusEffectv1(StatusEffects.EmberFuckCooldown) < 1)
            {
               get_player().removeStatusEffect(StatusEffects.EmberFuckCooldown);
            }
         }
         if(get_player().hasStatusEffect(StatusEffects.EmberNapping))
         {
            get_player().addStatusValue(StatusEffects.EmberNapping,1,-1);
            if(get_player().statusEffectv1(StatusEffects.EmberNapping) <= 0)
            {
               get_player().removeStatusEffect(StatusEffects.EmberNapping);
            }
         }
         if(followerEmber() && !get_player().hasStatusEffect(StatusEffects.EmberNapping))
         {
            if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,20) == 1 && !get_player().hasPerk(PerkLib.MinotaurCumAddict) && FlagDict_Impl_.arrayReadInt(KFLAGS.flags,542) == 0)
            {
               minotaurJizzFreakout();
               _loc1_ = true;
            }
            else if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,20) == 0 && FlagDict_Impl_.arrayReadInt(KFLAGS.flags,542) == 1)
            {
               emberGetOverFreakingOutAboutMinoJizz();
               _loc1_ = true;
            }
            if(get_player().get_lust() >= get_player().maxLust() && get_player().get_gender() > 0)
            {
               _loc4_ = KFLAGS.flags;
               FlagDict_Impl_.arrayWriteInt(_loc4_,541,FlagDict_Impl_.arrayReadInt(_loc4_,541) + 1);
               if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,541) >= 24)
               {
                  emberBitchesAtYouAboutLustiness();
                  _loc1_ = true;
               }
            }
            else
            {
               FlagDict_Impl_.arrayWriteInt(KFLAGS.flags,541,0);
            }
         }
         if(get_game().time.hours > 23)
         {
            if(!get_player().isPregnant())
            {
               FlagDict_Impl_.arrayWriteInt(KFLAGS.flags,558,0);
            }
            FlagDict_Impl_.arrayWriteInt(KFLAGS.flags,543,0);
         }
         return _loc1_;
      }
      
      public function talkToEmberAboutYourself() : void
      {
         clearOutput();
         var _loc1_:Number = 0;
         outputText("你问烬[Ember ey]觉得你怎么样。");
         if(emberAffection() <= 25)
         {
            outputText("[pg][say: 你就是在浪费时间，]烬漫不经心地说道。" + emberMF("他","她") + "从你身边走过，然后飞走了。");
            doNext(get_camp().returnToCampUseOneHour);
            return;
         }
         outputText("[pg]烬把手放在下巴上，仔细地打量着你。" + emberMF("他","她") + "靠近你，抓住你的手臂，检查你的肌肉。");
         if(get_player().get_str100() < 50)
         {
            outputText("[say: 你还需要更多训练；你看起来挺弱的……]烬挑剔地说道。");
         }
         else if(get_player().get_str100() < 90)
         {
            outputText("[say: 你快要变得像龙一样强壮了，但还有进步的空间。]烬满意地说道。");
            _loc1_++;
         }
         else
         {
            outputText("[say: 有了这样的肌肉，你可以轻松举起任何你想要的东西……甚至是我……]烬的声音渐渐变小" + (littleEmber() ? "，眼中带着梦幻般的神情" : "，如梦似幻，几乎发出了满足的呼噜声") + "。[say: 我、我才不是想让你把我抱在怀里什么的……]");
            _loc1_ += 2;
         }
         outputText("[pg]接着，烬戳了戳你的胸口和肋骨。");
         if(get_player().get_tou100() < 50)
         {
            outputText("[say: 我不知道你还怎么指望在外面生存。你看起来就像一阵风就能吹跑似的。]");
         }
         else if(get_player().get_tou100() < 90)
         {
            outputText("[say: 不错；再多训练一下，你就能和我一样结实了！]烬满意地说道。");
            _loc1_++;
         }
         else
         {
            outputText("[say: 你的身体像石头一样结实，你应该多展示一下……我、我才不是想让你光着身子！你还是得穿点什么保护自己，][Ember ey]急忙补充道。");
            emberAffection(1);
            _loc1_ += 2;
         }
         outputText("[pg]然后这条龙直视着你的眼睛。");
         if(get_player().get_inte100() < 50)
         {
            outputText("[say: 你还是太天真了……任何人或事都可能随时欺骗你……] 烬皱起眉头。");
         }
         else if(get_player().get_inte100() < 90)
         {
            outputText("[say: 我在你的眼中看到了智慧，但你总是需要更多的教训。]");
            _loc1_++;
         }
         else
         {
            outputText("烬睁大了眼睛。[say: 我在你的眼中看到了大智慧……] 烬的表情越来越心不在焉，[Ember ey]陷入了沉思，直到恍惚状态被打破。" + emberMF("他","她") + "朝你的脸吹了一口气，用爪子拂过你的额头。[say: 你、你脸上有东西……我才没有盯着你那" + (littleEmber() ? "" : "坚定的") + "眼睛看。]");
            _loc1_ += 2;
         }
         outputText("[pg]烬转过身背对着你走开了。然后[Ember ey]突然说道：[say: 反应快点！] 接着甩动[Ember eir]尾巴，朝你弹了一颗小石子。");
         if(get_player().get_spe100() < 50)
         {
            outputText("你试图挡住石子，但你的速度不够快。它击中了你的肚子，不过并没有用力到让你受伤。[say: 你需要锻炼你的反应能力；在外面任何事情都可能让你措手不及，而你将毫无还手之力。]");
         }
         else if(get_player().get_spe100() < 90)
         {
            outputText("你成功地挡开了石子。[say: 不错！下次试着接住它，] 烬满意地说。");
            _loc1_++;
         }
         else
         {
            outputText("你轻松地接住了石子，并把它扔回给烬，这让[Ember em]吃了一惊。[say: 有这样的反应速度，你甚至可以……] 烬喃喃自语。[say: 别、别想了！] [Ember ey]厉声说道。");
            _loc1_ += 2;
         }
         outputText("[pg]烬满意地转过身，又看了你一眼。");
         if(get_player().nagaScore() >= 3 || get_player().lizardScore() >= 3 || get_player().dragonScore() >= 3)
         {
            outputText("烬的目光在你的身上停留。在片刻尴尬的沉默之后，你清了清嗓子。[Ember ey]眨了眨眼，急忙说道。[say: 抱歉……我只是在欣赏你——] 意识到[Ember ey]要说什么，[Ember ey]赶紧脱口而出。[say: 我是说天气！是的，今天天气不错，不是吗？] 你并不相信，但还是让它过去了。烬恢复了平静，清了清[Ember eir]嗓子，然后说道。");
            _loc1_++;
         }
         outputText("[pg][saystart]好吧，这就是我对你的看法：");
         if(_loc1_ < 2)
         {
            outputText("这可不太妙；你能在这样的世界里活到现在简直是个奇迹。就我所见，在这片土地上游荡的那些东西……[sayend] 烬的声音渐渐变小，显得有些担忧。[say: 你应该留在营地里；我会帮你训练的。] 你不太喜欢这个评价。");
         }
         else if(_loc1_ < 6)
         {
            outputText("你做得很好，但要确保你不要懈怠，继续训练。[sayend] 你感谢烬分享了[Ember eir]想法。");
         }
         else
         {
            outputText("你很迷人……如果你走在街上，会有龙对你趋之若鹜的……[sayend] 意识到[Ember ey]刚才说了什么，烬猛烈地咳嗽起来。[say: 我、我是说……低等龙可能会对你趋之若鹜。你达不到我的标准！]");
            emberAffection(5);
         }
         doNext(playerMenu);
         cheatTime(0.16666666666666666);
      }
      
      public function talkToEmberAboutDragonzzz() : void
      {
         clearOutput();
         outputText("你让烬多讲讲关于[Ember eir]种族的事。");
         var _loc1_:Number = Utils.rand(5);
         if(_loc1_ == 0)
         {
            outputText("[pg]烬交叉起" + emberMF("他","她") + (littleEmber() ? "纤细的" : "") + "双臂。[say: 龙族既强大又骄傲！你永远不会看到一条龙在挑战面前退缩；相反，我们乐于竞争。]烬继续讲述龙族是如何喜欢互相挑战的。虽然一开始很有趣，但你很快就觉得无聊了，于是你找了个借口离开了。烬似乎没有注意到，并且看起来很高兴有机会赞美[Ember eir]种族的美德。");
            emberAffection(2 + Utils.rand(3));
         }
         else if(_loc1_ == 1)
         {
            outputText("[pg]烬想了一会儿才开口。[say: 嗯，我们来谈谈龙的解剖学吧。]烬开始解释龙的身体构造的细节……[say: 如果我们被固定住了，我们仍然可以使用强大的吐息攻击。通常龙只能使用一种元素，但我能使用三种！]烬说着，骄傲地挺起[Ember eir]" + (littleEmber() ? "平坦的" : "") + "胸膛。你感谢烬的解释，然后离开了。");
            emberAffection(2 + Utils.rand(3));
         }
         else if(_loc1_ == 2)
         {
            outputText("[pg]烬决定谈谈龙族的交配仪式。[say: 龙族通过展示力量来向彼此证明自己……这不一定局限于身体上的力量。通常是在竞争中进行的。一个好的伴侣必须骄傲、勇敢、聪明和强壮。所以，如你所见，你几乎不可能看到一条龙和非龙族交配。]");
            outputText("[pg]烬停止了说话，[Ember eir]脸上的表情变得严肃起来；[Ember ey]看起来陷入了沉思。[say: 龙族不会和非龙族交配……事实上，龙族甚至不会觉得非龙族有吸引力……]你觉得你听到[Ember em]在嘟囔。[say: " + (littleEmber() ? "……对吧？" : "该死，那我为什么会有这种感觉……") + "]");
            outputText("[pg]你让[Ember em]大声点说。烬脱口而出，[say: 没什么！课上完了……]然后退回了[Ember eir]巢穴。");
            emberAffection(5);
         }
         else if(_loc1_ == 3)
         {
            outputText("[pg]烬详细说明了龙族的求偶方式。[say: 有一种罕见的花，叫做龙心花。它非常美丽，而且香味，尤其是对龙族来说，非常精致。通常，龙族会把这种花送给他们打算求偶的对象。]");
            outputText("[pg]这种花对你来说完全是个谜，你好奇地问烬这个[say: 龙心花]长什么样，以及它长在哪里……或者曾经长在哪里。");
            if(emberAffection() <= 25)
            {
               outputText("[pg]烬哼了一声，露出了一个被逗乐的微笑，[Ember ey]" + (littleEmber() ? "咯咯地笑了起来" : "轻笑了起来") + "。[say: 怎么，“勇者”觉得自己配得上向我求偶吗？真好笑！]" + emberMF("他","她") + "毫不掩饰地咯咯笑着，以表明[Ember eir]对你缺乏兴趣……然而，这似乎有些勉强。");
            }
            else if(emberAffection() <= 75)
            {
               outputText("[pg]你发誓你能看到这条龙在听到你的话时在做白日梦，但这并没有持续多久。[say: " + (littleEmber() ? "" : "听着，") + "我不介意你有些好奇心，但别想对我动手动脚！]" + emberMF("他","她") + "的举止暗示着烦恼，但也许这只是一个强硬的伪装，[Ember ey]实际上在等着你表现出一些感情和关注。");
            }
            else
            {
               outputText("[pg]这条" + (littleEmber() ? "小" : "") + "龙毫不掩饰[Ember eir]尴尬的反应，因为[Ember ey]对你的询问想得有点太多了。[say: 嗯……我-哦……好吧……]烬结结巴巴地说。[say: " + (littleEmber() ? "" : "听着，") + "我还有其他事情要做" + (littleEmber() ? "！" : "。") + "]");
            }
            outputText("[pg]你对这条龙的想法感到好奇，同意结束对话，并礼貌地感谢[Ember em]抽出时间。");
            emberAffection(5);
            saveContent.flowerExplained = true;
         }
         else
         {
            outputText("[pg]烬开始谈论龙族的习惯，而框住[Ember em]的洞口让你想知道为什么龙族要挖这样的巢穴。烬耸了耸肩。[say: 这很方便。石头很坚硬，可以抵抗各种形式的危险，而且我总是知道我可以把我的东西安全地放在里面。][Ember ey]陷入沉思，盯着[Ember eir]巢穴。");
            outputText("[pg][say: 不过它有点小……如果……我可能需要一个更大的。]烬突然停了下来");
            if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,531) == 1)
            {
               outputText("，红晕爬上了[Ember eir]脸颊");
            }
            outputText("。");
            outputText("[pg]你问[Ember ey]是否没事。[say: 啊？是的，我很好！总之，课上完了。]烬匆忙地回到了[Ember eir]巢穴里。");
            emberAffection(5);
         }
         doNext(playerMenu);
         cheatTime(0.16666666666666666);
      }
      
      public function talkToEmber() : void
      {
         var _g:EmberScene;
         if(get_player().isPregnant() && emberHasCock())
         {
            if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,540) == 0 && get_player().get_pregnancyType() == 5)
            {
               emberBitchesAboutPCBeingFullOfEggs();
               doNext(get_camp().returnToCampUseOneHour);
               return;
            }
            if(get_player().get_pregnancyIncubation() < 200 && get_player().get_pregnancyType() != 17 && FlagDict_Impl_.arrayReadInt(KFLAGS.flags,558) == 0)
            {
               manEmberBitchesAboutPCPregnancy();
               doNext(get_camp().returnToCampUseOneHour);
               return;
            }
            if(get_player().get_pregnancyType() == 17 && get_player().get_pregnancyType() < 300 && FlagDict_Impl_.arrayReadInt(KFLAGS.flags,559) == 0)
            {
               emberTalksToPCAboutPCDragoNPregnancy();
               doNext(get_camp().returnToCampUseOneHour);
               return;
            }
         }
         if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,560) == 0 && pregnancy.get_event() > 1)
         {
            emberIsPregnantFirstTimeTalkScene();
            doNext(get_camp().returnToCampUseOneHour);
         }
         clearOutput();
         outputText("你要谈论什么？");
         menu();
         addButton(0,"龙",talkToEmberAboutDragonzzz);
         addButton(1,"探索",discussExplorationWithEmber);
         addButton(2,"你自己",talkToEmberAboutYourself);
         if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,523) >= 100 && FlagDict_Impl_.arrayReadInt(KFLAGS.flags,537) < 1)
         {
            addButton(3,"蛋壳",askEmberForEggshell).hint("向烬索要蛋壳。毕竟，你现在应该已经有资格得到蛋壳了。");
         }
         _g = this;
         addButton(14,"返回",function():void
         {
            _g.emberCampMenu();
         });
      }
      
      public function takeEmbersEggHomeInADoggieBag() : void
      {
         clearOutput();
         outputText("你决定带走这枚蛋，心想也许这条龙能在你的旅途中帮助你。");
         if(get_player().get_tallness() < 84)
         {
            outputText("举起它并没有你想象的那么困难；它出奇地轻。然而，它非常大，携带起来非常不方便。");
         }
         else
         {
            outputText("鉴于这枚蛋出奇的轻，再加上你自己的体型和宽阔的手臂，你可以轻松地搬运它。");
         }
         outputText("[pg]你回到了那个奇怪的走廊入口……但当你试图穿过洞口时，你感觉到蛋撞到了什么东西。你吃了一惊，迅速检查它的表面。");
         outputText("[pg]谢天谢地，它似乎完好无损；你放下蛋，试图把它轻轻滚过敞开的洞口。它又撞到了什么东西，一些看不见的东西。然后你回想起书上提到的某种保护蛋的结界；然而，当你试图触摸并感受这个隐形的结界时，你的手直接穿了过去。事实上，你可以轻松穿过这个“结界”，就好像它根本不存在一样……但是，如果你试图带着蛋，就会有一道坚固的屏障阻止它通过。");
         outputText("[pg]你感到很烦躁，决定在孵化室周围寻找其他出路。");
         if(get_player().get_inte() >= 50)
         {
            outputText("[pg]当你经过洞穴深处的一面远墙时，你感到一阵电流流过脊背；检查墙壁后，你很快发现了一块奇怪的石头。当你把它捡起来时，你意识到它的底部画满了某种铭文；你猜想它可能就是结界的源头，于是你把石头砸向远处的墙壁，把它摔成了许多碎片。");
            outputText("[pg]你感觉到一股微弱的能量脉冲穿过洞穴，进入了走廊。你跑向入口，发现现在可以轻松地把蛋拿出来了。当你把它带出洞穴时，它开始发出柔和的光芒；起初你以为是光线的错觉，但随后你想起，在这个该死的黑暗沼泽里根本没有光！!");
         }
         else
         {
            if(get_player().get_str() < 90)
            {
               outputText("[pg]你一遍又一遍地四处寻找……但无论你怎么找，都看不到任何类似魔法符文、激活按钮，或者任何能解除结界的东西。你沮丧地呻吟了一声。");
               outputText("[pg]看来你现在只能把蛋留在这里了，直到你更精通魔法……或者强壮到能推倒一座山！你把它滚回走廊，放回它的神龛里，以免从洞口被发现。");
               doNext(get_camp().returnToCampUseOneHour);
               return;
            }
            outputText("[pg]你一遍又一遍地四处寻找……但无论你怎么找，都看不到任何类似魔法符文、激活按钮，或者任何能解除结界的东西。你沮丧地呻吟了一声。");
            outputText("[pg]好吧，既然没有出路，那你就只能自己开辟一条了，对吧？凭借着巨大的力量，你折断了一根看起来很结实的石笋，开始敲击墙壁，希望能打破或解除屏障。");
            outputText("[pg]这比你最初预想的要花更长的时间，但果然，不久后你感觉到一股微弱的能量脉冲穿过洞穴，进入了走廊。你跑向入口，发现现在可以轻松地把蛋拿出来了。当你把它带出洞穴时，它开始发出柔和的光芒；起初你以为是光线的错觉，但随后你想起，在这个该死的黑暗沼泽里根本没有光！!");
         }
         outputText("[pg](<b>你现在已经开始了神秘蛋的任务。神秘蛋已添加到营地的<i>营地行动</i>中。</b>)");
         get_player().createKeyItem("Dragon Egg",0,0,0,0);
         FlagDict_Impl_.arrayWriteInt(KFLAGS.flags,536,1);
         FlagDict_Impl_.arrayWriteInt(KFLAGS.flags,527,50);
         doNext(get_camp().returnToCampUseOneHour);
      }
      
      public function suckEmberCock() : void
      {
         clearOutput();
         get_images().showImage("ember-give-her-a-blowjob");
         outputText("你盯着烬的胯部，想象着龙精在你舌尖上的味道。这个想法让你渴望地舔了舔嘴唇，你问烬是否愿意让你吸[Ember eir]肉棒。");
         if(emberAffection() <= 25)
         {
            outputText("[pg][say: 呵……我想我可以做点那种事。][pg]你注意到，尽管口头上缺乏热情，但烬的肉棒已经开始从[Ember eir]腹股沟里探出头来，但你把这事藏在了心里。");
         }
         else if(emberAffection() < 75)
         {
            outputText("[pg][say: 我想我会喜欢的……不过别以为我接受你只是因为我不介意！][pg]你强忍住笑意，坚持说你明白；[Ember ey]只是利用你来发泄，仅此而已。你对[Ember eir]眼中交织着受伤和感激的神情感到好奇，于是你请这条难以捉摸的龙带路。");
         }
         else
         {
            outputText("[pg]甚至在烬回答之前，[Ember eir]肉棒就因期待而跳动起来。[say: 当然！我很乐意……我是说……我没意见，]烬说道，试图掩饰[Ember eir]兴奋，尽管[Ember eir]整个身体都在出卖[Ember em]。");
         }
         outputText("[pg]你跟随着你的龙族恋人，等着看[Ember ey]会把你带到哪里。结果你们来到了一片干涸的空地，中央是一个长满地衣的大树桩。烬松开你的手，走向树桩，像坐在王座上的" + emberMF("皇帝","女皇") + "一样傲慢地坐下。");
         outputText("[pg]" + emberMF("他","她") + "张开双腿，露出");
         if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,525) == 1)
         {
            if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,531) == 0 || FlagDict_Impl_.arrayReadInt(KFLAGS.flags,534) == 1)
            {
               outputText("他那唯一的生殖裂口");
            }
            else
            {
               outputText("他的生殖器");
            }
         }
         else if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,531) == 0 || FlagDict_Impl_.arrayReadInt(KFLAGS.flags,534) == 1)
         {
            outputText("她那对生殖裂口");
         }
         else
         {
            outputText("她的生殖器");
         }
         outputText("，[Ember eir]");
         if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,531) == 0 || FlagDict_Impl_.arrayReadInt(KFLAGS.flags,534) == 1)
         {
            outputText("龙");
         }
         outputText("肉棒早已坚硬跳动。这头龙漫不经心地用爪子敲击着树桩，等待着你的服侍。");
         outputText("[pg]你迅速脱下你的[armor]，以免它们被你接下来要做的事弄脏。你走上前，跪在[Ember em]面前，伸出手轻轻握住[Ember eir]勃起的肉棒。你即将做出的淫荡举动让你感到一阵变态的快感。");
         if(get_player().hasCock())
         {
            outputText("[EachCock]硬了起来，在你的兴奋中漫无目的地戳向地面。");
         }
         if(get_player().hasVagina())
         {
            outputText("你的[vagina]开始渗出女性的汁液，你的[clit]因期待而变硬，你的兴奋滴落在干渴的地面上。");
         }
         outputText("[pg][say: 快、快开始吧，]烬结结巴巴地说，把双腿张得更开，呼吸沉重。");
         outputText("[pg]你充满爱意地对你的恋人微笑，伸出手去抚摸那根肉棒");
         if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,531) == 0 || FlagDict_Impl_.arrayReadInt(KFLAGS.flags,534) == 1)
         {
            outputText("，它甚至现在正从[Ember eir]");
            if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,525) == 3)
            {
               outputText("第一个");
            }
            outputText("生殖裂口");
         }
         outputText("中弹出来。它越升越高，直到所有" + (littleEmber() ? "5" : "16") + "英寸的");
         if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,531) == 0 || FlagDict_Impl_.arrayReadInt(KFLAGS.flags,534) == 1)
         {
            outputText("龙族");
         }
         outputText("肉棒正骄傲地直指你的脸，顶端缓缓冒出些许前列腺液，顺着柱身流下。你一边按摩一边用唾液润滑，好让它更容易被吞咽。你向这只龙抛去一个娇媚的眼神，[Ember ey]正因你的服侍而颤抖，却又强装镇定，不愿表现出你对[Ember em]的影响有多大。既然[Ember ey]不愿配合，你也不想再玩下去了，于是你张开嘴，开始吞咽[Ember eir]肉棒。");
         outputText("[pg]你" + (littleEmber() ? "吞下了前两三英寸" : "轻松地吞下了前三四英寸") + "，停下来用舌头舔过龟头和尿道口，品尝着龙族前列腺液的味道；浓郁、粘稠、带着些许酸味，清凉且出人意料地令人神清气爽。你享受了几秒钟这味道，然后继续，一寸一寸地吞咽下去。");
         outputText("[pg][say: 呃……别、别逗我了，快点，] 烬催促着你。");
         if(littleEmber())
         {
            outputText("[pg]受到[Ember eir]明显享受的鼓舞，你继续尽可能多地吞咽。它的长度刚好能碰到你的喉咙，你开始在龙的肉棒上前后套弄着脑袋。");
            outputText("[pg]你抬起头想看看烬的反应，映入你眼帘的是一只张着嘴、喘着粗气的龙，而且[Ember ey]正直勾勾地盯着你。[say: 你不知道你现在看起来有多性感……]");
            if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,525) == 3 && (FlagDict_Impl_.arrayReadInt(KFLAGS.flags,531) == 0 || FlagDict_Impl_.arrayReadInt(KFLAGS.flags,534) > 0))
            {
               outputText("受到变态灵感的启发，你设法将舌头扭动到[Ember eir]肉棒的根部，并将其刺入[Ember eir]的生殖裂缝中。你引导它尽可能深地进入那个奇怪的像小穴一样的孔洞，进行着挠痒和抚摸。");
               if(get_player().tongue.type > 0)
               {
                  outputText("你那非人般长度的舌头在里面越滑越深，你意识到你能感觉到两个圆润的物体；[Ember eir]的蛋蛋！你实际上正在触摸那些通常被锁在[Ember eir]体内的睾丸，除非[Ember ey]达到[Ember eir]最兴奋的状态……...");
               }
            }
            outputText("[pg][say: 啊！更……更多……多摸摸我……]烬恳求着，在你的手中屈服于快感。");
            outputText("[pg]你上下吞吐，吸吮着[Ember eir]的肉棒并按摩着它");
            if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,525) == 3)
            {
               outputText("，你的舌头在[Ember eir]的裂缝中扭动着");
            }
            outputText("，这一切都是为了让[Ember em]把那浓郁的龙精直接射进你饥渴的嘴里。你抬头看着这头龙，露出恳求的表情，默默地乞求[Ember em]能主动一点。");
            outputText("[pg]烬发出愉悦而急切的低语。[say: 如果你一直这样看着我……我想我可能……嗯……忍不住了。] 就像[Ember ey]说的那样，你真切地感觉到[Ember eir]肉棒在你饥渴的嘴里抽动。");
            outputText("[pg]最后，烬的双手移到了你的脸颊上，顺着脸颊抚摸，感受着你脸上的每一处轮廓、每一道细微的曲线，然后大声说道：[say: 忍不住了！] " + emberMF("他","她") + "抓住你的头，开始强迫你在[Ember eir]肉棒上套弄。你全身放松，任由[Ember em]把你当成活体飞机杯，感受着这头龙在你的嘴里来回抽插。");
            outputText("[pg]" + emberMF("他","她") + "的抽插力度越来越大，一边挺动腰身一边大声呻吟，舌头都伸了出来。[say: 哦！哦！要……要……！] " + emberMF("他","她") + "发出一声震耳欲聋的咆哮，一股爆炸般的精液射入你的嘴里。");
            get_player().refillHunger(50);
            outputText("[pg]你尽力吞咽，但喷涌而出的精液还是从你嘴里溢了出来，因为量实在太大，你根本咽不过来。突然，烬把你推开，将[Ember eir]还在喷射的肉棒从你嘴里拔出，最后几股精液全喷在了你的脸上。");
            outputText("[pg]你只是跪在那里承受着，对这场精液浴无动于衷。");
            outputText("[pg]当[Ember ey]完事后，烬用双手捧起你的脸，在你的唇上印下一个热情的吻，品尝着[Ember em]自己和你的味道，同时舔去残留的精液。" + emberMF("He","She") + "伴随着一声湿润的吧唧声松开了你，唾液的拉丝将你们的嘴唇连在一起，接着[Ember ey]开始舔舐你的脸庞，清理[Ember ey]刚才弄出的脏乱。");
         }
         else
         {
            outputText("[pg]受到[Ember eir]明显享受的鼓舞，你继续吞咽着，尽可能多地吞下。然而，在吞入大约六英寸时，你发现自己被迫停了下来；烬的肉棒抵住了你的喉咙深处，引发了你的呕吐反射。你试图让自己平静下来，深呼吸，看到[Ember eir]至少还有一半的长度在你的嘴外。");
            outputText("[pg][say: 别、别勉强自己。不想让你被我的老二噎到，]烬喘息着，随着快感的升级，开始失去[Ember eir]的冷静。");
            outputText("[pg]" + emberMF("His","Her") + "的话语只是在你心中点燃了一丝骄傲的火花；你不会被打败的，绝不会被这根肉棒打败！毕竟，外面还有比你这只小龙大得多的怪物肉棒。你尽可能多地吸入空气，然后把头向前探去，努力刺穿你闭合的喉咙，直到最后，它湿漉漉地“啵”一声进入了你的食道。随着肉棒的头部已经进入你的喉咙，继续滑入就容易多了。你一寸一寸地向前推进，感觉它撑开了你的脖子，深深地、深深地插入你的体内。最后，你发现你的鼻子轻轻地压在了烬的");
            if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,531) == 0)
            {
               outputText("长满鳞片的");
            }
            else
            {
               outputText("皮肤柔软的");
            }
            outputText("下腹");
            if(pregnancy.get_event() > 3)
            {
               outputText("，尽管那沉甸甸的球体在抗拒你");
            }
            outputText("，并发现自己心中涌起一股自豪感，因为你把那整整十六英寸的肉棒都吞了下去。");
            outputText("[pg]你抬起头想看看烬的反应，映入你那因用力而紧绷的眼帘的，是一条张着嘴、气喘吁吁的龙，[Ember eir]眼睛直勾勾地盯着你。[say: 你不知道你现在看起来有多性感……]");
            outputText("[pg]你含着[Ember eir]那根能把下巴撑脱臼的肉棒，虚弱地咧嘴一笑，开始尽可能地前后摆动头部。你能感觉到[Ember eir]龟头顶到了像是你肚子的地方，你努力收紧喉咙，紧紧包裹住这根长得不似人类的工具，疯狂地吸吮着仍留在你嘴里的部分。");
            if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,525) == 3 && (FlagDict_Impl_.arrayReadInt(KFLAGS.flags,531) == 0 || FlagDict_Impl_.arrayReadInt(KFLAGS.flags,534) > 0))
            {
               outputText("受到变态灵感的启发，你设法将舌头扭动到[Ember eir]肉棒的根部，并将其刺入[Ember eir]的生殖裂缝中。你引导它尽可能深地进入那个奇怪的像小穴一样的孔洞，进行着挠痒和抚摸。");
               if(get_player().tongue.type > 0)
               {
                  outputText("你那非人般长度的舌头在里面越滑越深，你意识到你能感觉到两个圆润的物体；[Ember eir]的蛋蛋！你实际上正在触摸那些通常被锁在[Ember eir]体内的睾丸，除非[Ember ey]达到[Ember eir]最兴奋的状态……...");
               }
            }
            outputText("[pg][say: 啊！更……更多……多摸摸我……]烬恳求着，在你的手中屈服于快感。");
            outputText("[pg]你上下吞吐，吸吮着[Ember eir]的肉棒并按摩着它");
            if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,525) == 3)
            {
               outputText("，你的舌头在[Ember eir]的裂缝中扭动着");
            }
            outputText("，这一切都是为了让[Ember em]把那浓郁的龙精直接射进你饥渴的肚子里。你尽你所能，但你不知道在[Ember eir]整根肉棒都埋在你喉咙里的情况下，还能怎么取悦[Ember em]。你用恳求的眼神看着这条龙，无声地乞求[Ember em]主动采取行动，否则[Ember ey]永远也射不出来！!");
            outputText("[pg]烬发出愉悦而急切的呢喃。[say: 如果你一直那样看着我……我想我可能……嗯……忍不住了。] 就像[Ember eir]说的那样，你确实感觉到[Ember eir]肉棒在你饥渴的嘴里抽动。你露出最恳求的眼神；不在乎[Ember ey]是否需要操你的喉咙才能射出来，你只需要[Ember em]在你晕过去之前射进你体内！!");
            outputText("[pg]终于，烬的双手移到了你的脸颊上，顺着脸颊抚摸，感受着你脸上的每一处轮廓、每一道细微的曲线，然后宣布：[say: 忍不住了！] " + emberMF("他","她") + "抓住你的头，开始强迫你在[Ember eir]肉棒上上下套弄。你浑身瘫软，任由[Ember em]把你当成活体飞机杯使用，感受着这条龙在你嘴里像活塞一样来回抽插，你努力收缩喉咙，试图达到像小穴一样合适的紧致度。");
            outputText("[pg]" + emberMF("他","她") + "用越来越大的力气抽插着，身体剧烈地挺动，大声呻吟，舌头耷拉在[Ember eir]胸前。[say: 哦！哦！要……要射了……！] " + emberMF("他","她") + "发出一声响彻喉咙的咆哮，将一股爆炸般的精液射入你体内。由于[Ember eir]肉棒完全埋入你体内，你别无选择，只能吞咽——或者更准确地说，任由[Ember em]将一股又一股的精液直接射进你的肚子里。");
            get_player().refillHunger(50);
            outputText("[pg]大量的精液涌入你的腹部，你能感觉到随着精液的积累，肚子变得越来越沉重，你的皮肤被撑起一个仿佛怀孕般的隆起。突然，烬把你从[Ember em]身上拉开，让你嘴里含满精液；你尽力吞咽，但还是忍不住让一些精液漏了出来。不过这也没什么关系，因为很快烬就把[Ember eir]还在喷射的肉棒从你嘴里拔了出来，用最后几股精液涂满了你的脸。");
            outputText("[pg]你只是跪在那里承受着，肚子太撑，又喘不过气来，对这场精液浴无能为力。不过，最终，这条龙过度刺激的肉棒喷出了最后几股泡沫状的精液，落在了你的脸上，而烬则瘫倒在[Ember eir]座位上，筋疲力尽地喘着粗气。你大口喘息着，精液从你嘴里溢出，当你终于让肺部充满空气时，你如释重负地叹了口气，然后捧着你那咕噜作响、晃荡着的肚子，脸上因压力而露出不适的表情，接着你打了一个带有精液气味的嗝。感觉好多了。");
            outputText("[pg]你的轻松是短暂的，因为烬用[Ember eir]双手捧起你的脸，在你的嘴唇上印下了一个热情的吻，品尝着[Ember em]自己和你，同时[Ember ey]舔去了残留的精液块。" + emberMF("他","她") + "伴随着一声湿润的吧唧声放开了你，口水丝连着你们的嘴，接着[Ember ey]开始舔干净你脸上[Ember ey]刚才弄出的脏污。");
         }
         outputText("[pg]你闭上眼睛，顺从地接受这条龙温柔的服侍，享受着[Ember eir]冰凉的舌头滑过你[skinfurscales]时的亲密接触。烬不慌不忙，确保把你舔得干干净净。一旦你被清理干净并被舔到让[Ember eir]满意的程度，[Ember ey]终于平静下来；从树桩上下来，躺在地板上，把你拉到[Ember em]身上；紧紧地抱着你。");
         outputText("[pg]你不太明白为什么[Ember ey]在喂你吃完[Ember eir]精液后还想抱着你，但你也不太想抱怨。不过，最终你意识到时间正在流逝，于是轻轻地试图从[Ember eir]怀抱中挣脱出来，开玩笑地告诉[Ember em]，虽然你很喜欢和[Ember em]亲近，但你还有其他事情要做。");
         outputText("[pg]烬猛地睁大眼睛，粗暴地把你推到一边。[say: 你……你让我做了什么……我的精液……那个吻……你……你让我把你脸上的精液舔干净了！]");
         outputText("[pg]你指出是[Ember ey]吻了你，而不是反过来。你当然没有强迫[Ember em]舔你。再说，凭什么只有你能享受[Ember ey]的味道？");
         outputText("[pg][say: 我需要洗个澡！] [Ember ey]匆忙地宣布，然后飞奔而去。你看着这头龙离去，");
         if(get_player().cor < 80)
         {
            outputText("觉得好笑");
         }
         else
         {
            outputText("对[Ember eir]古怪的行为越来越警惕");
         }
         outputText("，然后爬起来准备回营地。");
         get_player().slimeFeed();
         emberAffection(6);
         dynStats(DynStat.Lust(10 + get_player().lib / 10));
         doNext(get_camp().returnToCampUseOneHour);
      }
      
      public function stickItInEmbersButt() : void
      {
         clearOutput();
         get_images().showImage("ember-fuck-her-in-her-buttz");
         outputText("你的目光像铁屑被磁铁吸引一样，被烬" + (littleEmber() ? "可爱的小" : "") + "屁股吸引。你被想要看到[Ember em]弯下腰，向你饥渴的触摸献上[Ember eir]屁股的诱惑所困扰，你问烬是否愿意在肛交中做承受方。");
         if(emberAffection() <= 25)
         {
            outputText("[pg]" + emberMF("他","她") + "的眼睛睁大了。[say: 绝不！绝——不！除非我死了！]烬惊呼道。这头龙展开了[Ember eir]的翅膀起飞，愤怒地拍打着空气。");
            doNext(get_camp().returnToCampUseOneHour);
            return;
         }
         if(emberAffection() < 75)
         {
            outputText("[pg][say: 咦！你怎么能向我提出这种要求！？想点别的吧。]烬抗议着，鼻孔里喷出一小股烟雾，不过你还是忍不住注意到[Ember eir]乳头变硬了……...");
            emberSexMenu(false);
            return;
         }
         outputText("[pg][say: 我倒是想，但……但那绝对进不去的……而且……而且……总之就是进不去！]烬的眼睛死死盯着你的胯部；");
         if(emberHasCock())
         {
            outputText(emberMF("他","她") + "变硬的肉棒");
            if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,525) == 3)
            {
               outputText("和");
            }
         }
         if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,525) == 2)
         {
            outputText("她");
         }
         if(emberHasVagina())
         {
            outputText("滴水的阴户");
         }
         outputText("清楚地表明，这个想法至少在某种程度上让[Ember em]兴奋了。");
         if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,545) == 0)
         {
            outputText("[pg]你问[Ember ey]是不是真的那么肯定进不去；如果[Ember ey]愿意，你很乐意试一试，但如果[Ember ey]真的很害怕，你也不会勉强……...");
         }
         else
         {
            outputText("[pg]你问[Ember ey]怎么那么肯定……难道是[Ember ey]害怕了？因为如果[Ember ey]害怕，你不会勉强……...");
         }
         var _loc1_:IMap = KFLAGS.flags;
         FlagDict_Impl_.arrayWriteInt(_loc1_,545,FlagDict_Impl_.arrayReadInt(_loc1_,545) + 1);
         outputText("[pg]一听到“害怕”这个词，烬眼中的火焰重新燃起，死死盯着你。[say: 害怕！？我什么都不怕！放马过来！][Ember ey]骄傲地宣布，抓起你的手，把你拉向附近的一小片空地。[say: 脱！]烬急促地命令道。");
         outputText("[pg]你赶紧照做，脱下衣服，向龙展示着[eachCock]");
         if(get_player().hasVagina())
         {
            outputText("和[vagina]");
         }
         outputText("。当你完全脱光后，你转头看向烬，看到[Ember em]正毫不掩饰地自慰；[Ember ey]喘息着，一只手抚摸着[Ember eir]" + emberGroinDesc("肉棒","阴户") + "，另一只手吮吸着手指。");
         var _loc2_:int = get_player().cockThatFits(emberAnalCapacity());
         if(_loc2_ < 0)
         {
            _loc2_ = get_player().smallestCockIndex();
         }
         outputText("[pg]当[Ember ey]看到你完全脱光后，[Ember ey]走到你面前，伴随着充满欲望的低吼，把你推倒在草地上。一只手滑腻的手指缠绕住你勃起的" + get_player().cockDescript(_loc2_) + "，而另一只手的手指则按压着烬紧致的" + (littleEmber() ? "小洞" : "后庭") + "，慢慢地扩张它以容纳你。");
         if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,545) == 1)
         {
            outputText("[pg]龙轻声呻吟，低吼声中夹杂着明显的紧张和痛苦；毕竟[Ember ey]要把[Ember eir]后庭的第一次交给你，所以[Ember ey]有着处女般的紧致和恐惧。你向龙保证你会慢慢来，温柔一点。");
            outputText("[pg]烬紧张地瞪了你一眼，然后命令道：[say: 你什么都别做！就坐在那里，让我来处理！]你不想引起争吵，决定照[Ember ey]说的做。");
            outputText("[pg][say: 真不敢相信我必须做这种事……做这种屈辱……又奇怪的事……]你叹了口气，告诉烬够了；[Ember ey]不必做任何[Ember ey]不想做的事，你不是故意嘲笑[Ember em]害怕的。烬用带爪子的手指打断了你。[say: 闭嘴。我……我想做……没人能命令我！所以如果我做这件事……那是因为我想做！]");
            outputText("[pg]当[Ember ey]这么说时，你对[Ember em]露出令人安心的微笑，决定让烬安静地准备。");
            outputText("[pg]当[Ember ey]觉得准备好了，龙把[Ember eir]手指从现在已经绽放的后庭中抽出来，转向你。");
         }
         else
         {
            outputText("[pg]龙轻声呻吟并低吼着，再次扩张[Ember em]自己来接纳你。你考虑说点什么，但想起烬第一次说的话，你觉得如果[Ember ey]在做这件事，那是因为[Ember ey]想做……所以你只是给了[Ember em]一个令人安心的微笑。");
            outputText("[pg]注意到你的笑容，烬停下了[Ember eir]准备动作。[say: 你、你在笑什么？]");
            outputText("[pg]" + emberMF("他","她") + "看起来很可爱，就像[Ember eir]第一次那样做着准备。回忆涌上心头，烬转过头去。沉默了片刻后，[Ember ey]再次发出一声呻吟，继续用手指在[Ember eir]屁股上动作着。");
            outputText("[pg]当[Ember ey]觉得准备好时，[Ember ey]将手指从那已经绽放的紧致后庭中抽出，转身看向你。");
         }
         outputText("[pg][say: 听好了。你只能按我说的做。我要完全掌控局面。如果你敢做任何让我之后感到疼的事，我发誓我会揍你。明白了吗？]");
         outputText("[pg]你");
         if(get_player().cor < 50)
         {
            outputText("向这只龙保证你明白了，并坚称你绝不会有别的想法；你希望这能让[Ember em]感到舒服，而不是给[Ember em]带来痛苦。");
         }
         else
         {
            outputText("点头。");
         }
         outputText("[pg][say: 嗯……那好吧。]这只龙跨过你，抬起[Ember eir]尾巴，将你对准那" + (littleEmber() ? "小巧的" : "紧致的") + "小穴。慢慢地，烬用[Ember eir]" + (littleEmber() ? "稚嫩的" : "") + "屁股在你身上摩擦，刺激你分泌出一滴淫液来润滑通道。" + emberMF("他","她") + "没有等太久，深吸了一口气，[Ember ey]终于顺应重力坐了下来，你的" + get_player().cockDescript(_loc2_) + "深深刺入了[Ember eir]紧致的深处。");
         outputText("[pg]当" + (littleEmber() ? "这个小" + emberMF("男孩","女孩") + "稚嫩的后庭" : "烬的后庭") + "张开并吞没你时，你轻声呻吟起来。就像[Ember em]身体的其他部位一样，这里比人类的体温要低，但又不会冷得让人不适。那是一种带着些许辛辣的清凉感，让你舒服得直打颤。你捏住烬的屁股，紧紧抓着并将[Ember em]完全拉下吞没你的整根肉棒，努力克制着自己，以免动作太快让这只龙感到不适。");
         outputText("[pg][say: 喂！啊！我没让你把我拉下来！]烬抗议道。");
         outputText("[pg]你向这只龙道歉，但你实在忍不住；[Ember eir]屁股实在是太" + (littleEmber() ? "可爱娇小" : "丰满圆润") + "了，如此美妙的清凉与紧致——简直让人无法抗拒。你用力挺进[Ember eir]后庭以示强调，粗暴地揉捏着[Ember eir]" + (littleEmber() ? "紧实的" : "诱人的"));
         if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,531) == 0)
         {
            outputText("长有鳞片的");
         }
         outputText("臀瓣，并摩擦着[Ember eir]那条长而灵活的尾巴根部，试图表达[Ember eir]屁股让你有多么疯狂。");
         outputText("[pg][say: 嗷！好了，好了！快停下，至少给我点时间适应一下，]烬回答道");
         if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,531) == 0)
         {
            outputText("，因情欲而喘息着");
         }
         else
         {
            outputText("，脸上泛起红晕");
         }
         outputText("。你强迫自己保持静止，让这只发情的龙有机会从你的" + get_player().cockDescript(_loc2_) + "刺穿[Ember eir]后庭的冲击中缓过来，同时品味着[Ember eir]冰凉的肌肉在你的肉棒周围挤压和蠕动的感觉。");
         outputText("[pg]几分钟后，烬终于开始动了，用[Ember eir]内部的肌肉套弄着你。");
         if(emberHasCock())
         {
            outputText("几滴淫液顺着[Ember eir]自己的肉棒滑落，流过[Ember eir]蛋蛋，汇聚在你的肚子上。");
         }
         if(emberHasVagina())
         {
            outputText("她湿润的小穴有节奏地滴着水，用滑腻的龙淫液打湿了你的下半身。");
         }
         outputText(emberMF("他","她") + "那充满情欲的呻吟，每次[Ember ey]坐下吞没你的" + get_player().cockDescript(_loc2_) + "时都会让你的脊背一阵酥麻，而从[Ember eir]胸腔传出的低沉呼噜声清晰可闻，足以让你知道，尽管一开始有些不情愿，但烬现在有多么享受这一切。");
         outputText("[pg]让你最终失去控制、屈服于最原始本能的，不是那呼噜声，不是紧致的内壁，也不是那轻柔的呻吟，而是烬的脸庞……[Ember ey]向你投来纯粹的幸福、欲望与爱意交织的目光。这直击你的灵魂深处。你的双手从烬的屁股上移开，" + (littleEmber() ? "" : "环抱住") + "[Ember eir]胸膛，手指开始抚摸、爱抚，并轻轻揉捏[Ember eir]乳头，试图用欲望让这条龙变得更加狂野，同时你的臀部像活塞一样疯狂地挺进[Ember eir]" + (littleEmber() ? "年轻的" : "诱人的") + "屁股里。");
         outputText("[pg]你突如其来的动作让烬吃了一惊，仰面摔倒；在[Ember ey]倒下时，[Ember ey]也把你拉了下去，你们的位置互换了；现在是你压在上面，有力地挺进[Ember eir]诱人的肠道中。每次你的胯部撞击[Ember eir]屁股，[Ember ey]都会舒服地扭动；每次空地上响起响亮的拍打声，烬都会呻吟。[say: 我……啊！没……哦！让你……嗯！开始动！]");
         outputText("[pg]你问[Ember ey]是不是真的想让你现在停下来，同时做最后一次用力的挺送，然后缓慢、慵懒地抽出来以示强调。你调皮地拍了一下[Ember eir]屁股；你本以为你们俩都快完事了。不过，如果[Ember ey]真的想现在停下来……...");
         outputText("[pg][say: 不！你敢停下来试试！把我的屁股操烂！啊！我需要你！]");
         outputText("[pg]你猜到[Ember ey]会这么说，于是你继续倾尽全力地干[Ember em]。你能感觉到那种无比熟悉、无比美妙的紧绷感正在盘旋，就在");
         if(get_player().balls > 0)
         {
            outputText("你的[balls]里");
         }
         else
         {
            outputText("你的脊椎底部");
         }
         outputText("，你向烬低吼着你很快就要射了。");
         outputText("[pg][say: 是的！和我一起高潮！用你滚烫的白色精液填满我！给我打上你的标记！] 烬在极乐中尖叫。");
         outputText("[pg]好吧，既然这是[Ember ey]想要的……伴随着一声喘息和喊叫，你屈服于这种感觉，让快感的浪潮席卷全身，将你的精液如瀑布般射入" + (littleEmber() ? "这个孩子" : "烬") + "等待着的肠道中。你的高潮引发了[Ember eir]高潮，伴随着一声咆哮，[Ember ey]也高潮了");
         if(emberHasCock())
         {
            outputText("，一股股精液越过[Ember eir]头顶，喷洒在下方的地面上");
         }
         if(emberHasVagina())
         {
            outputText("；名副其实的汁液从她被遗忘的爱穴中喷涌而出，溅在你的下半身和她自己身上");
         }
         outputText("。高潮的力量让这条龙夹紧了[Ember eir]屁股，一波又一波新的快感传遍你的全身。");
         if(get_player().cumQ() < 250)
         {
            outputText("[pg]没过多久你就精疲力尽了，但即便如此，你射出的量也比平时多得多，给烬留下了一个湿滑、泥泞、充满精液的后庭。");
         }
         else if(get_player().cumQ() < 1000)
         {
            outputText("[pg]你的高潮持续的时间比平时长得多，把烬紧致的小穴填得满满的，甚至让[Ember eir]肚子都微微鼓了起来。");
         }
         else
         {
            outputText("[pg]你雷霆般的高潮似乎要撕裂烬娇嫩的小穴，你喷射精液的力量如此之大，以至于你把[Ember em]震得前后摇晃。烬看起来不仅是被填满了，甚至可以说是被撑爆了；[Ember ey]看起来就像一个随时待产的孕妇。尽管[Ember ey]很紧，但[Ember ey]还是没能把你所有的精液都包住，回流的精液以巨大的力量从[Ember eir]屁股里喷涌而出，糊在你的下半身和烬的腿上。");
         }
         outputText("[pg]精疲力尽的烬瘫倒在地，沉浸在极乐与满足之中。你也好不到哪里去，伴随着一声[say: 哎哟]倒在[Ember em]身上。烬喘息了一会儿，然后用[Ember eir]双手捧起你的头，在你的嘴唇上印下一吻。你既惊讶又高兴，沉浸在这个吻中，抚摸着[Ember eir]脸颊以示回应，让满足感笼罩着你们俩。一吻结束，烬对你笑了笑，闭上[Ember eir]眼睛小憩了一会儿。");
         outputText("[pg]你对着熟睡的龙笑了笑，轻轻地从[Ember em]体内抽出；然后走到最近的溪流边清洗自己。洗干净后，你回到刚才留下烬的地方。当你看到[Ember em]抱着[Ember eir]膝盖慢慢摇晃时，你吃了一惊，而且……[Ember ey]在哼歌？你慢慢走近，[Ember ey]微笑着看着你，但在意识到你是谁后，[Ember ey]倒吸了一口凉气，[Ember eir]脸皱了起来。");
         outputText("[pg][say: [name]！！你……在我告诉你之后……你还……该死，我会疼上好几天的……这都是你的错！]");
         outputText("[pg]你承认你对此负有部分责任，但也指出烬和你一样想要这样，甚至可能比你更想。");
         outputText("[pg]烬喷出一口烟。[say: 哦，是吗！？所以你甚至不打算承担责任？好！]");
         outputText("[pg]你指出你并不是那个意思，只是烬在这里也有责任。");
         outputText("[pg][say: 我不想再听了！] 烬站起来，用[Ember eir]尾巴推了你一下，举起一堆叠好的衣服。事实上……那堆衣服很眼熟……实际上……那是你的[armor]。");
         outputText("[pg][say: 我甚至还为你捡起了这些……好吧，你可以自己来！] 烬开始随意地把你的衣服扔向四面八方，你");
         if(get_player().get_str() < 70)
         {
            outputText("拼命地想要抓住任何飞在空中的衣服，但烬用[Ember eir]尾巴把你压住");
            outputText("。");
            outputText("[pg][say: 这应该能给你个教训！] [Ember ey]自信地喷出一口烟，转过身走开了……走得相当笨拙。你觉得你应该指出，当[Ember ey]走回营地时，你们之前活动的成果还在从[Ember eir]屁股里滴出来，但你觉得还是保持安静为好，以免激化矛盾。另外，这也是对扔你衣服的报复。");
            outputText("[pg]你叹了口气，想知道为什么烬的脾气这么暴躁，然后开始收拾你的衣服，准备带回营地。这花了一两分钟，但[Ember ey]并没有真的花力气把它们散开，你知道情况本来可能会更糟。");
         }
         else
         {
            outputText("抓住[Ember eir]尾巴，把龙拉倒在地，当你翻滚时把[Ember em]摔在地上……并导致[Ember em]在跌倒时把它们掉得到处都是。");
            outputText("[pg]烬尖叫着，挣扎着重新站起来。一团白色的东西从[Ember eir]屁股缝里掉到地上，是被摔出来的，龙僵在原地。你苦笑了一下。");
            outputText("[say: 你以为你在干什么！？] 烬对你大喊，显然对你的小把戏很生气，一只手伸到后面防止更多的精液溢出。");
            outputText("[pg]你告诉[Ember em]，你今天没心情玩[Ember eir]小游戏；[Ember ey]真的需要控制一下[Ember eir]脾气，否则总有一天[Ember ey]可能会咬下连[Ember ey]自己都嚼不烂的东西。");
            outputText("[pg]烬对你咆哮，有一瞬间你以为[Ember ey]要对你大吼大叫，但令你惊讶的是，[Ember ey]移开了[Ember eir]视线，发出几乎听不见的。[say: 对不起……]");
            outputText("[pg]你轻轻叹了口气，点了点头；这不算什么，但以[Ember ey]的骄傲，这已经是相当大的让步了。你告诉[Ember em]没关系，但[Ember ey]既然和你一样享受，就不应该这么生气。");
            outputText("[pg]当你讲完话时，烬浑身发抖，喷出一口烟，然后转身匆匆走向最近的溪流。你只是看着[Ember em]离去，用手指堵住[Ember eir]用过的玫瑰花蕾，你注意到[Ember eir]笨拙的步伐，不知怎么的……[Ember ey]离开时似乎并没有那么生气……...");
         }
         get_player().orgasm("Dick");
         dynStats(DynStat.Sens(-2));
         doNext(get_camp().returnToCampUseOneHour);
      }
      
      public function stickDickInKnifeDrawer() : void
      {
         clearOutput();
         get_images().showImage("ember-gives-you-a-blowjob");
         outputText("你试图表现得自信又有些冷漠，建议烬也许愿意用[Ember eir]灵活的舌头在你的肉棒上做点什么。");
         if(emberAffection() <= 25)
         {
            outputText("[pg][say: 啊。而且……你凭什么认为我会考虑那个？] 烬气愤地哼了一声，转身走开了。");
            doNext(get_camp().returnToCampUseOneHour);
            return;
         }
         if(emberAffection() < 75)
         {
            outputText("[pg][say: 没门！做那种事太掉价了；想点别的！] 烬双臂交叉，等待你的回答。");
            emberSexMenu(false);
            return;
         }
         outputText("[pg]烬看了看你的胯部，又看了看你；[Ember eir]眼睛里闪烁着共谋的光芒。[say: 好吧……但就这一次！]");
         outputText("[pg]意识到[Ember ey]正看着你带路，你示意[Ember ey]跟着你，开始向营地边缘走去。一旦你确信你们已经到了安全的距离，你");
         if(!get_player().hasTailInsteadOfLegs())
         {
            outputText("在一块长满地衣的巨石上坐下");
         }
         else
         {
            outputText("盘起你的[if (isNaga) {蛇|[if (isMer) {鱼}]}]尾");
         }
         outputText("并开始脱掉下半身的衣服，将[eachCock]暴露在空气中，等待烬的反应。");
         outputText("[pg]当[Ember eir]目光落在你的肉棒上时，" + (littleEmber() ? "小" + emberMF("男孩","女孩") : "烬") + "的眼睛亮了起来");
         if(get_player().cockTotal() > 1)
         {
            outputText("");
         }
         outputText("。");
         var _loc1_:int = get_player().biggestCockIndex();
         var _loc2_:int = _loc1_ + 1;
         if(get_player().cockTotal() > 1)
         {
            outputText("" + emberMF("他","她") + "挑了最大的一根肉棒，轻轻抚摸着，");
         }
         else
         {
            outputText("" + emberMF("他","她") + "将你的[cock " + _loc2_ + "]握在手中，开始轻轻抚摸，");
         }
         outputText("明显带着喜悦地嗅着你的麝香。");
         if(get_player().cocks[_loc1_].get_cockType() == CockTypesEnum.DRAGON)
         {
            outputText("[pg][say: 如此宏伟、美丽的肉棒……感觉充满力量……而且很熟悉。]");
         }
         else
         {
            outputText("[pg][say: 这、这不是我懂得怎么弄的东西……但我想我可以试试……为了你。]");
         }
         outputText("[pg]当烬" + (littleEmber() ? "小小的" : "") + "手放在你的肉棒上时，你因那触感而颤抖");
         if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,531) == 0)
         {
            outputText("，[Ember eir]手掌上的鳞片滑过你敏感的肌肤，产生了一种难以言喻的感觉，");
         }
         outputText("你不假思索地脱口而出表示理解。");
         outputText("[pg]对此感到满意，烬伸出[Ember eir]舌头，慢慢地包裹住你的" + get_player().cockDescript(_loc1_) + "，这个动作让你浑身发抖，因为那条非人般长且灵活的舌头就像一条滑溜溜的蛇一样缠绕着你的阴茎。" + emberMF("他","她") + "熟练地将它盘绕在你的肉棒上，紧紧握住你，就像一个临时的飞机杯。");
         outputText("[pg]低头看着烬，你看到这条龙洋溢着幸福；[Ember ey]如此专注于[Ember eir]任务，以至于[Ember ey]甚至没有注意到你在盯着看。用[Ember eir]盘绕的舌头，[Ember ey]开始为你手淫；这种感觉既熟悉又如此陌生……只用了几下，你的" + get_player().cockDescript(_loc1_) + "就闪烁着烬的唾液，在一次特别愉悦的拉扯中，你呻吟出声。一滴前列腺液从你的" + get_player().cockHead(_loc1_) + "溢出，慢慢地顺着你的肉棒滑下，直到它接触到烬的舌头。");
         outputText("[pg]在[Ember ey]尝到你的那一刻，[Ember eir]眼睛似乎发出了光芒。伴随着鞭子般的动作，烬将[Ember eir]舌头缩回[Ember eir]等待着的嘴里，吞没了你的" + get_player().cockDescript(_loc1_) + "。当冰凉滑溜的肉包裹住你时，你喘息着，毫不在意那些偶尔能感觉到擦过你的坚硬锋利的牙齿。你太信任你的龙了，不相信[Ember ey]会伤害你。");
         outputText("[pg]烬用力地吸吮着你，用[Ember eir]灵活的舌头在你的肉棒周围发出啧啧声，并愉悦地发出咕噜声。");
         if(emberHasCock())
         {
            outputText("" + emberMF("他","她") + "的肉棒已经坚硬如石，有时你能感觉到它戳到你的[feet]，将烬几乎无法抑制的愉悦水滴涂抹在你的[skinfurscales]上。");
         }
         if(emberHasVagina())
         {
            outputText("看着她的身后，你看到一小滩她的女性淫液已经形成；信息素在空气中飘荡，像海浪一样冲击着你，刺激着你，让你喂给烬更多你美味的前列腺液。");
         }
         outputText("[pg]在一个迅速的动作中，烬尽可能用力地吸吮你，然后伴随着响亮的吧唧嘴声放开了你。你大叫一声，不确定发生了什么，无言地看着这条龙，恳求[Ember em]帮你解决；你才刚刚进入状态！!");
         outputText("[pg][say: 别担心，[name]。我可没打算让你收起这根美味多汁的肉棒。我只是想尽情享受它，]烬梦幻般地说着，带着淫荡的笑容用鼻子蹭着你敏感的阴茎。");
         outputText("[pg]你微笑着看着，既兴奋又觉得有趣，忍不住轻轻抚摸[Ember em]的");
         if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,528) == 0 && FlagDict_Impl_.arrayReadInt(KFLAGS.flags,531) == 0)
         {
            outputText("布满鳞片的头顶");
         }
         else
         {
            outputText("头发");
         }
         outputText("，告诉[Ember em][Ember ey]确实吸引了你的注意力，你很期待看看[Ember ey]在想什么。");
         outputText("[pg]烬用[Ember eir]舌头轻弹你的");
         if(get_player().balls > 0)
         {
            outputText("蛋蛋");
         }
         else if(get_player().hasVagina())
         {
            outputText(get_player().vaginaDescript());
         }
         else
         {
            outputText("[cock " + _loc2_ + "]");
         }
         outputText("并开始从根部到顶端缓慢地、几乎是折磨般地舔舐你。[say: 嗯。真好吃……]在这条龙的服侍下，愉悦的火花涌遍你的全身，你发现自己把话咽了回去，因为你不确定你是想让[Ember em]快点，还是继续保持这样。");
         outputText("[pg]此时你已经像泉水一样漏个不停，而烬贪婪地舔舐着每一滴。[say: 喂我，[name]。我好渴……]烬挑逗着你，给了你渗出液体的龟头最轻柔的吻。你向前挺动，渴望再次被这头龙诱人的嘴唇包裹，并承诺只要[Ember ey]继续这样，你就会把所有的东西都喂给[Ember em]！烬对你的承诺报以微笑，并顺从地像吃冰棍一样把你吸了回去。");
         outputText("[pg]长着利爪的双手抓住你的腰部作为支撑，[Ember ey]终于开始肆无忌惮地上下摆动[Ember eir]的头，意图榨干你的每一滴精液。你自己的手也不由自主地抓住了[Ember eir]的角，用它们来帮助固定[Ember eir]的头，顺从地将你的肉棒插入" + (littleEmber() ? "这个孩子的嘴里" : "烬的下巴里") + "，而[Ember eir]的嘴唇和长长灵活的舌头在努力榨取你的精液时，让你感受到狂喜的电流传遍全身。");
         outputText("[pg]你没有等太久，伴随着一声无言的叫喊，你将自己释放到了烬饥渴的嘴里。当第一股精液击中烬的舌头时，[Ember ey]幸福地叫了出来，并尽可能深地将你喷发的[cock " + _loc2_ + "]埋入[Ember em]的体内。");
         if(get_player().cumQ() < 250)
         {
            outputText("[pg]烬吸干了你身上的每一滴精液，把你榨得一干二净，像沙漠里饥渴的人一样喝着它。即使你觉得你已经给了[Ember em]你所能给的一切，烬还是插入了");
            if(!get_player().isTaur())
            {
               outputText("一根手指");
            }
            else
            {
               outputText("她翅膀上的拇指");
            }
            outputText("进入你的屁股来刺激你的前列腺，从你身上抽出最后几滴。");
         }
         else if(get_player().cumQ() < 1000)
         {
            outputText("[pg]烬微笑着喝下了你所能提供的一切。一旦你给出了你所能给的全部，烬就放开了你，舔着[Ember eir]的嘴唇，好像[Ember ey]刚刚吃了一顿大餐。当你结束时，" + emberMF("他","她") + "的肚子明显鼓了起来。");
         }
         else
         {
            outputText("[pg]烬坚持要喝下每一滴，尽管[Ember ey]几乎无法容纳你注入[Ember eir]急切的");
            if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,531) > 0)
            {
               outputText("嘴里");
            }
            else
            {
               outputText("嘴里");
            }
            outputText("的惊人精液量。有那么一瞬间，你觉得[Ember ey]快被你的精液淹死了，试图抽离，但烬不让你这么做；[Ember ey]用[Ember eir]锋利的牙齿小心翼翼地鼓励你回到原来的位置，并继续喝着。当你结束时，[Ember ey]看起来几乎怀孕了，因为[Ember eir]充满精液的胃被撑得很大。");
         }
         outputText("[pg]伴随着一声幸福的叹息，烬抱住你的腰，把[Ember eir]的头埋在你的肚子里，开心地舔着[Ember eir]的嘴唇。你幸福地沉浸在这个拥抱中，回味着余韵。你慵懒地抚摸着烬的头，以示爱意。可悲的是，你没能享受太久，[Ember ey]突然回过神来，从你身边退开，一屁股坐在地上。[say: 你……你以为你在干什么！？等一下……你……你刚才是不是让我喝光了你所有的精液！？]");
         outputText("[pg]你漫不经心地看了[Ember em]一眼，温和地指出你并没有强迫[Ember em]喝它。你脑海中闪过一个念头，要么咽下去，要么让它溅满[Ember eir]" + (littleEmber() ? "可爱的小" : "") + "脸，但你决定把这个想法藏在心里。");
         outputText("[pg][say: 我……我绝不会做那种事！]烬抗议道。[say: 绝不！我死也不会喝你美……我是说，难喝的精液！我不敢相信你对我做了这种事！我得去洗洗嘴！]" + emberMF("他","她") + "站起身，向最近的溪流跑去。");
         outputText("[pg]你看着[Ember em]离去");
         if(get_player().cor < 75)
         {
            outputText("并轻笑起来；你知道[Ember ey]其实是爱你的。");
         }
         else
         {
            outputText("，双臂交叉；[Ember eir]的痴呆症越来越严重了……...");
         }
         get_player().orgasm("Dick");
         dynStats(DynStat.Sens(-1));
         doNext(get_camp().returnToCampUseOneHour);
      }
      
      public function stayWithEmberAfterLustFuck() : void
      {
         var _g1:EmberScene;
         var _g:EmberScene;
         clearOutput();
         var _loc1_:int = get_player().cockThatFits(emberVaginalCapacity());
         if(_loc1_ < 0)
         {
            _loc1_ = get_player().smallestCockIndex();
         }
         outputText("你微笑着告诉[Ember em]你很乐意。[say: 太好了，过来……] [Ember ey]轻柔地说道，向你挪过来。你张开双臂，让这条龙依偎在你身上，将你的手臂舒服地放在[Ember eir]的翅膀下。");
         if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,525) == 1)
         {
            outputText("[pg]当你们拥抱在一起时，你感觉到有什么东西在摩擦你的[skinfurscales]。你松开拥抱往下看，发现烬的龙根再次勃起了。[say: 我……好吧……你总不能指望我现在抱着我赤裸的伴侣还能让它软着吧？] 他说道，对自己的反应感到相当慌乱。[OneCock]勃起并摩擦着他的肉棒，这就是你的回答。");
            outputText("[pg]当你们的阴茎触碰在一起时，烬因为接触而颤抖，愉悦的电流传遍了他的全身。[say:这、这感觉真好！]他惊呼道，微微挺动腰部，再次摩擦你们的阴茎。[say:是的……[name]，这次我们一起打个手枪怎么样？我喜欢这种下流的感觉；而且我的屁股还是很痛，如果你从后面上我，我就抱不到你了……]");
            outputText("[pg]你觉得没有理由拒绝，并告诉了他。");
            menu();
            _g = this;
            addButton(0,"继续",function():void
            {
               _g.frottingWithEmber();
            });
         }
         else if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,525) == 2)
         {
            outputText("[pg]烬紧紧地抱着你，把你压在她的" + (littleEmber() ? "平坦胸膛" : "胸部") + "上。你享受着龙的");
            if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,529) > 0)
            {
               outputText("充满乳汁的");
            }
            outputText((littleEmber() ? "胸膛" : "乳房") + "贴着你的感觉，柔软、光滑，而且比你的体温稍微凉一点。你们就这样享受了一会儿彼此，直到你感觉到你的阴茎再次勃起。烬的鼻孔张开了一会儿，她心领神会地对你笑了笑。[say:还没要够我吗？]你把问题抛回给她，问她是不是说她还没要够你。[say:我可以肯定地说，我永远也无法满足你……我已经湿透了。]龙");
            if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,531) > 0)
            {
               outputText("娘");
            }
            outputText("拉着你的手，把它压在她湿润的阴户上。你的手指本能地移动，滑过并微微探入那湿润的阴唇。[say:哦……感觉真好……但你知道什么感觉会更好吗？]她一边抚摸你的侧腹一边挑逗地问。你开玩笑地问她那可能是什么。");
            outputText("[pg]烬伸出手，握住你[cock biggest]的根部。[say:这个。]你忍不住取笑烬，说她现在是个相当好色的女孩了。[say:只有和你在一起的时候。]她咯咯地笑了起来。[say:事实是我一直都是这样的。我想在内心深处，我一直知道你是我真正的伴侣，我只是……嗯……我想我让骄傲蒙蔽了双眼。抱歉这么久以来一直这么难伺候……]你在龙的嘴唇上印下一吻；烬显然很感激这个让她闭嘴的借口，因为她热切地回吻了你。");
            outputText("[pg]她结束了亲吻，轻轻抚摸着你的阴茎，对你微笑着。然后她将你的" + get_player().cockDescript(_loc1_) + "的顶端对准了她的阴部。");
            menu();
            _g1 = this;
            addButton(0,"继续",function():void
            {
               _g1.penetrateWithEmber();
            });
         }
         else
         {
            outputText("[pg]当你们拥抱彼此时，你感觉到有什么东西在你的[skinfurscales]上摩擦。你松开拥抱向下看去，发现烬的龙根再次勃起了。[say:我……好吧……你不能指望我在抱着我赤裸的伴侣时还能让它软着，对吧？]她说道，对自己的反应感到相当慌乱。你自己的[cock biggest]也勃起了，摩擦着她的，这便是你的回答。");
            outputText("[pg]当你们的阴茎触碰在一起时，烬因为接触而颤抖，愉悦的电流传遍了她的全身。[say:这、这感觉真好！]她惊呼道，微微挺动腰部，再次摩擦你们的阴茎。[say:这感觉太好了，我下面变得更湿了，]扶她龙");
            if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,531) > 0)
            {
               outputText("娘");
            }
            outputText("说道，漫不经心地摩擦着你们的阴茎。你的一只手滑到你们两人之间，滑过扶她龙阴茎那布满脊状突起的表面，然后按在她那被充分使用过的阴户上；果然，它已经因为渴望再次被填满而急切地流着淫液。");
            outputText("[pg][say:嗯……[name]，我的伴侣？想尝试点不一样的吗？或者如果你不想，你至少能把那根阴茎再放进我里面一次吗？我想要你……]烬期待地舔了舔嘴唇。");
            menu();
            addButton(0,"摩擦",frottingWithFrottingEmberHerm);
            addButton(1,"插入",penetrateEmberHerm);
         }
      }
      
      public function slurpDraggieCunnies() : void
      {
         clearOutput();
         get_images().showImage("ember-eat-out-her-vagoo");
         outputText("你思考着各种可能性，然后提议跪在龙面前，用嘴取悦她。你很乐意尝尝" + (littleEmber() && get_silly() ? "萝莉" : "") + "龙汁的味道。");
         if(emberAffection() <= 25)
         {
            outputText("[pg][say: 我想我可能会享受那个……勉强吧，] 烬回答，试图隐藏她明显的兴奋。[saystart]但别以为你会得到任何分数");
            if(!get_silly())
            {
               outputText("在我这里");
            }
            else
            {
               outputText("在我的好感度计上");
            }
            outputText("仅仅因为你主动提出这样做，[sayend] 龙急忙补充道。");
         }
         else if(emberAffection() < 75)
         {
            outputText("[pg]烬的爪子移到她的阴唇上挑逗着，想象着你跪在她面前取悦她的样子。[say: 好、好吧，如果你真的想那样做的话……] 烬回答道，尽管她的蜜壶已经湿透了，但她还是试图装作若无其事的样子");
            if(emberHasCock())
            {
               outputText("并且肉棒也在慢慢变硬");
            }
            outputText("。");
         }
         else
         {
            outputText("[pg]仅仅是你提议的暗示就足以让烬几乎因为期待而流出汁液。烬迅速捂住下体，试图隐藏她滴着爱液的洞口");
            if(emberHasCock())
            {
               outputText("和肉棒");
            }
            outputText("。 [say: 好吧……我想我会喜欢的，] 烬回答道，试图让自己平静下来，以免显得对这个想法过于兴奋。");
         }
         outputText("[pg]烬牵起你的手，把你带到灌木丛外一个隐蔽的地方；一旦她确定只有你们两个人，烬就向后靠在附近的一棵树上作为支撑，并张开双腿，让你接触她" + (littleEmber() ? "肿胀的小" : "绽放、湿润的") + "花朵。");
         outputText("[pg][say: 好、好吧……我准备好了，] 烬说道，尾巴像钟摆一样在她身后摆动，等待着你的下一步动作。");
         outputText("[pg]你在她的双腿之间安顿下来，弯下腰去够她的阴唇。从这里，你处于一个绝佳的位置，可以轻轻地用舌头顺着她的裂缝向上滑动，从她的双腿之间开始，然后轻轻向前滑动，抚摸她的欢乐按钮，向上推入她的嘴唇之间，挠痒她女性气质的内部。");
         if(emberHasCock())
         {
            outputText("随着烬的肉棒在你的头顶上方突出，你忍不住用舌头沿着她肉棒的下侧滑动，只是为了增加一点挑逗的动作。");
         }
         outputText("[pg]烬舒服地喘息着，双腿弯曲了一会儿，尽管她很快就通过将爪子深深地刺入树皮恢复了过来。 [say: 你、你至少可以警告我你要开始了！] 烬说道，");
         if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,531) > 0)
         {
            outputText("一直红着脸并且");
         }
         outputText("因为刺激而喘息着。");
         outputText("[pg]你抬头看着她" + (littleEmber() ? "" : " 尽可能绕过她起伏的胸部") + " 并给了她一个无辜的微笑，然后立刻回到舌头上的任务。" + (littleEmber() ? "" : " 这个婊子现在是你的了。") + " 你滑过她的阴唇，用你所能聚集的所有口交技巧抚摸她；她的汁液现在开始流动，让你能够接住它们并在每次舔舐时品尝它们。");
         if(emberHasCock())
         {
            outputText("你觉得预先的汁液滴开始顺着她的女孩肉棒滑落并滴在你的头上……但这是爱一个双性人的必然部分，所以你没有理会它。");
         }
         outputText("[pg]烬的享受非常明显，因为每次你甚至在她的快乐小芽上呼吸时，烬都会向你挺身；她的阴道壁收缩，希望能抓住你的舌头并将其拉入她体内更深处，但你的唾液加上不断流动的龙汁使其保持足够光滑，以至于烬根本没有机会留住你的舌头。 [say: 嗯……啊！再往左一点……] 烬指挥着你。");
         outputText("[pg]你的舌头以你所能聚集的所有");
         if(get_player().tongue.type > 0)
         {
            outputText("非人的");
         }
         outputText("灵活性弯曲着，蠕动进入龙的深处，试图抚摸和摩擦她所有最私密的地方。在探索烬颤抖的深处的某个时刻，你发现了一个特殊的地方，每次你接触到那个海绵状的小地方，烬都会用挺身和新的液体涌出作为奖励。");
         outputText("[pg][say: 啊！如果你继续这样做，我会——哦！] 烬喘息着，舌头伸出来，因为她迷失在你全权负责的愉悦感觉中。你继续蠕动和起伏你的舌头，尽可能小心地摩擦那个特殊的点");
         if(emberHasCock())
         {
            outputText("，不顾滴入你[hair]的预先汁液的稳定雨滴。你相信她很快就会崩溃……...");
         }
         outputText("[pg]烬突然抓住你的头，把你推开，她摇摇晃晃地转过身，靠在树上支撑着自己，她的尾巴离你的头只有几英寸远。[say: 给……给我点时间喘口气……如果你继续这样，我会……我会……] " + (littleEmber() ? "小龙女" : "烬") + " 没有说完她的话，只是呆在那里，高高举起尾巴，让你清楚地看到她湿透的小穴，仿佛在乞求你再舔一次。");
         outputText("[pg]你无法抗拒。即使烬的尾巴在头顶来回甩动，你还是偷偷溜到她身后，伸出手抚摸她" + (littleEmber() ? "可爱的小" : "丰满的") + "屁股，同时将你的舌头直直地探入她滴着蜜汁的花穴。");
         outputText("[pg]烬沙哑的呻吟变成了一声强烈的欢愉咆哮，她的尾巴缠绕在你的脖子上，没有勒紧也没有让你窒息，只是帮助这条龙在强烈的性高潮中稳定自己，并用大量的甜美龙汁奖励你。");
         if(emberHasCock())
         {
            outputText("她那跳动的肉棒也不甘落后，在树皮上留下了白色的龙精，记录下了这一时刻。");
         }
         outputText("[pg]烬慢慢地瘫软下来，她的双腿再也支撑不住她了；当她跪倒在地时，她的爪子在树上留下了长长的抓痕，缠在你脖子上的尾巴性感地滑动着，按摩着你。最后，伴随着一声喘息和叹息，烬仰面躺下，半眯着眼睛抬头看着你；你惊讶地喘了口气，因为尾巴突然抓住你的脖子，把你拉下来，给了你一个倒立的吻。烬似乎并不介意品尝自己的味道，她在你嘴里舔来舔去，然后又舔了舔你的脸。");
         outputText("[pg]你一直等到她把舌头从你嘴里抽出来，然后对她微笑，抚摸她的脸颊，问她感觉好不好。[say: 太棒了……] 烬轻声低语。你微笑着弯下腰再次吻她；她有可能会因为你的冒昧而咬你一口，但你觉得她更有可能会让你得逞。");
         outputText("[pg]起初，烬迎合着你的吻，再次探索你的口腔……但某一刻，她突然睁大眼睛，迅速中断了亲吻，挣扎着站起来，怒视着你。[saystart]谁……谁说你可以亲我的！？!?");
         if(get_silly())
         {
            outputText("我的好感度还没那么高呢！!");
         }
         outputText("[sayend]");
         outputText("[pg]你问她是不是只有她才能主动接吻。当这条龙回想起刚才的吻时，她恍然大悟。[say: 那……那是……你！你骗了我！你……你怎么能那样做？我要走了！] 烬脱口而出，匆匆跑开了。");
         outputText("[pg]你看着她离去，微笑着舔了舔嘴唇，品尝着她最后几滴花蜜。她真的应该学着放松点；这会让一切都变得更加愉快。你漫不经心地揉着自己");
         if(get_player().hasCock())
         {
            outputText("坚挺的肉棒");
         }
         if(get_player().get_gender() == 3)
         {
            outputText("和");
         }
         if(get_player().hasVagina())
         {
            outputText("湿润的小穴");
         }
         if(get_player().get_gender() == 0)
         {
            outputText("空荡荡的胯部");
         }
         outputText("以示同情，然后返回营地。");
         get_player().slimeFeed();
         emberAffection(6);
         dynStats(DynStat.Lust(10 + get_player().lib / 10));
         doNext(get_camp().returnToCampUseOneHour);
      }
      
      public function sleepWithEmber() : void
      {
         var _loc2_:* = null as String;
         var _loc3_:Boolean = false;
         var _loc4_:* = null as String;
         var _loc5_:* = null as String;
         var _loc6_:* = null as String;
         var _loc7_:Boolean = false;
         var _loc8_:* = null as String;
         var _loc9_:* = null as String;
         var _loc10_:* = null as String;
         var _loc11_:Boolean = false;
         var _loc12_:Boolean = false;
         var _loc13_:* = null as String;
         var _loc14_:* = null as IMap;
         if(get_game().time.hours >= 21)
         {
            get_game().timeQ = 24 - get_game().time.hours;
         }
         else
         {
            get_game().timeQ = 0;
         }
         var _temp_1:* = get_game();
         _temp_1.timeQ = _temp_1.timeQ + get_camp().wakeupTime();
         var _loc1_:int = Utils.rand(3);
         clearOutput();
         outputText("在今天休息之前，你决定去看看烬……...");
         if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,523) < 25)
         {
            if(_loc1_ == 0)
            {
               outputText("[pg]当你靠近龙穴时，你打了个哈欠，一整天冒险的疲惫终于涌了上来。心不在焉又睡眠不足的你，结果撞上了烬。");
               outputText("[pg][say: 嘿！走路看着点！] 烬责备道，但当[Ember ey]看到你状态不佳时，[Ember ey]又带着真诚的关切补充道，[say: 你没事吧？]");
               outputText("[pg]你为撞到龙而道歉，解释说你只是太累了。几个大大的哈欠打断了你的话，但你还是把意思表达得很清楚。");
               outputText("[pg][say: 呵……那你为什么不去准备睡觉，而是在这里漫无目的地瞎逛？]");
               outputText("[pg]你告诉烬，你想在睡觉前看看[Ember em]，确保[Ember em]一切都好。");
               outputText("[pg][say: 我当然没事。我又不是需要人照顾的小孩。] " + (littleEmber() ? "你忍住没有指出[Ember ey]其实就是个小孩。" : "") + "烬又看了你一眼。[say: 而且你现在的状态也不适合检查什么，我们还是送你回床上吧。] 烬抓住你的手臂，带你走向你的[cabin]。你觉得[Ember ey]说得有道理，便任由[Ember em]带你走，心里漫不经心地想着，为什么这只脾气暴躁的龙似乎很关心你的状况。");
               outputText("[pg][say: 好了，到了。现在脱衣服睡觉吧；你休息的时候我会看着营地的。]");
               outputText("[pg]你给了这只龙一个疑惑、困惑的眼神，但既然这本来就是你的打算，你便顺其自然地脱下你的[armorName]，倒在你的[bed]上。");
            }
            else if(_loc1_ == 1)
            {
               outputText("[pg]当你靠近烬的巢穴时，你发现这只龙在家，坐在[Ember eir]临时搭建的洞穴的庇护下。当你走近时，你注意到[Ember ey]正在小心翼翼地摘着一朵花的花瓣。");
               outputText("[pg][say: 爱我……不爱我……爱我……]");
               outputText("[pg]你简直不敢相信……你以前在村子里经常听到女孩，甚至偶尔也有男孩，用这首童谣。你不知道他们在玛瑞斯也用同样的童谣……等一下，真的是烬在做那件事吗？！你无法抑制自己的难以置信，惊讶地向这只龙喊了一声。");
               outputText("[pg]烬看着你，僵住了，把剩下的花扔在地上，眼睛睁得大大的，就像一只被困在陷阱里的鹿。烬转过身，冲进夜色中，展开[Ember eir]翅膀，以最快的速度飞走了。你一直看着，直到这只龙从视线中消失，感觉比以往任何时候都更加困惑。");
               outputText("[pg]在玛瑞斯，有谁能让像[Ember em]这样骄傲、高傲的野兽做出如此浪漫的仪式呢？");
            }
            else
            {
               outputText("[pg]当你靠近龙穴时，你看到烬正走向夜色中。出于好奇，你决定跟着[Ember em]。");
               outputText("[pg]漫无目的地走了几分钟后，烬终于停下来，看了看[Ember eir]周围；确信[Ember ey]是独自一人后，烬开始嘟囔着什么。你无法抗拒自己的好奇心，偷偷靠近，以便偷听这只" + (littleEmber() ? "小孩" : "龙") + "的话。");
               outputText("[pg][say: 该死的[name]，居然让我做这种事……]");
               outputText("[pg]你看着烬开始抚摸[Ember eir]" + (littleEmber() ? "小小的" : "") + "身体……...");
               if(emberHasCock())
               {
                  outputText("[pg]烬用一只手开始戳[Ember eir]生殖器，慢慢地把[Ember eir]阴茎" + (FlagDict_Impl_.arrayReadInt(KFLAGS.flags,534) > 0 ? "弄出来" : "弄到完全勃起") + "。然后[Ember ey]开始抚摸[Ember em]自己，在每一次压抑的呻吟后呼唤你的名字。");
               }
               if(emberHasVagina())
               {
                  outputText("[pg]两根试探的手指滑入[Ember eir]小穴，轻轻抚摸着[Ember eir]外阴，然后猛地插了进去，引得烬发出一声愉悦的叹息。[say:哦……[name]……]烬呼唤着。");
               }
               outputText("[pg][Ember ey]是在……是的，[Ember ey]确实是在。但是……为什么？你暗自纳闷。你小心翼翼地确保自己完全隐藏起来；你最不希望的就是被这头龙发现你在偷窥[Ember eir][say:独处时光]，然后大发雷霆。你保持沉默，等着看[Ember ey]是否真的把你当成了自慰的幻想对象，或者[Ember eir]幻想中是否还有更黑暗的成分。");
               outputText("[pg]随着[Ember ey]抚摸[Ember emself]，烬的呼吸变得急促起来。[say:啊……对……给我……嗯……[name]……]");
               outputText("[pg]没过多久，烬就达到了高潮。" + (emberHasCock() ? "" + emberMF("His","Her") + "精液溅落在[Ember em]面前的地上" : "") + (FlagDict_Impl_.arrayReadInt(KFLAGS.flags,525) == 3 ? "同时" : "") + (emberHasVagina() ? "她的淫液顺着[Ember eir]双腿流下，在下方汇聚成一滩" : "") + "伴随着一声如释重负……又带着些许失望的叹息？烬开始舔干净[Ember eir]手指上的痕迹。[say:为什么非得是这样……]");
               outputText("[pg]你好奇[Ember ey]在说什么，但你断定，如果你现在靠近[Ember em]，[Ember eir]自尊心绝对受不了。你决定等[Ember ey]离开，把这件事藏在心里。");
            }
         }
         else if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,523) >= 25 && FlagDict_Impl_.arrayReadInt(KFLAGS.flags,523) < 75)
         {
            if(_loc1_ == 0 && get_player().get_HP() < get_player().maxHP() * 0.8)
            {
               outputText("[pg]当你靠近烬的巢穴时，你看到这头龙正在舔干净[Ember eir]爪子，你猜那大概是[Ember eir]晚餐的残渣。");
               outputText("[pg]你向这头龙打招呼，问[Ember ey]今晚给自己抓了什么当晚餐。");
               outputText("[pg][say:鱼，还有一些水果……没什么特别的。]烬瞥了你一眼，发现了你手臂上的瘀伤。[say:那是什么？][Ember ey]指着你的手臂问道。");
               outputText("[pg]你顺着[Ember ey]指的方向看去，意识到[Ember ey]指的是你众多瘀伤和擦伤中的一处。你耸耸肩，表示这没什么，只是一个小小的提醒，告诉你在这个恶魔出没的世界里游荡有多危险。");
               outputText("[pg][say:你应该处理一下……过来。]烬退回了[Ember eir]巢穴。");
               outputText("[pg]你有些惊讶，但觉得[Ember ey]总不至于让情况变得更糟，于是你跟着这头龙走进了[Ember eir]黑暗凉爽的巢穴。在那里，你看到烬正在墙上的一个洞里翻找。[say:找到了！]烬宣布着，拿出一个小罐子放在你面前。[say:坐下，让我看看。]");
               outputText("[pg]你在一堆散发着甜香的草和树叶上——烬的床？——尽可能舒服地坐下。[say:你的手臂？][Ember ey]伸出一只手问道。你伸出手，握住[Ember eir]手，让[Ember em]检查你的伤口。");
               outputText("[pg]烬打开罐子，喝了一大口。你往里看，发现那只是水。有那么一瞬间，你想问这头龙打算做什么；但还没等你开口，烬的舌头就从[Ember eir]" + (FlagDict_Impl_.arrayReadInt(KFLAGS.flags,531) == 0 ? "嘴里" : "口中") + "伸了出来，[Ember ey]开始舔你的手臂。你困惑地看着，问[Ember ey]为什么要这么做。烬停下了[Ember eir]舔舐。");
               outputText("[pg][say:我在清理你的伤口。你看我像在做什么？]" + (littleEmber() ? "这个小" + emberMF("男孩","女孩") : "烬") + "继续舔你的手臂。");
               outputText("[pg]你告诉[Ember em]你看出来了，但为什么[Ember ey]要舔你，而不是用你的一些药膏呢？");
               outputText("[pg]烬打了个寒颤。[say:恶！那东西闻起来太难闻了！而且，我很确定我的唾液效果一样好，甚至更好。你看……]烬按了按你的一处伤口。");
               outputText("[pg]你皱起眉头，已经预感到一阵刺痛，但是……并没有你预想的那么疼。你确实能感觉到[Ember em]在按压你的伤口，但那种疼痛感并不如你所料。证明了[Ember eir]观点后，烬又喝了一口罐子里的水，继续[Ember eir]舔舐。");
               outputText("[pg]你轻叹一声，虽然还是觉得有点怪异，但是，嘿，它不疼，而且对你有好处，对吧？所以，你任由[Ember em]继续。");
               outputText("[pg]等烬弄完，你的手臂几乎不疼了。你检查了一下伤口，发现虽然它们看起来还是很难看，但似乎正在愈合。你感谢烬的帮助。[say:不客气……以后小心点。]");
               outputText("[pg]你保证你会尽力，但这个世界并不总是给你机会。你强忍着哈欠，再次感谢[Ember em]的帮助，然后返回你的[cabin]，投入床铺的怀抱。");
            }
            else if(_loc1_ == 1)
            {
               outputText("[pg]当你靠近烬的巢穴时，你注意到有些不对劲……仔细一看，你发现烬不在家……难道[Ember ey]还在外面飞翔探索吗？");
               outputText("[pg]好吧，烬已经是个大" + emberMF("男孩","女孩") + "了，你很确定[Ember ey]能照顾好[Ember emself]；所以你决定回到你的[cabin]里去。");
               outputText("[pg]当你走进你的[cabin]时，你非常惊讶地发现你的" + get_camp().bedDesc() + "被某只熟睡的" + (FlagDict_Impl_.arrayReadInt(KFLAGS.flags,531) == 0 ? "龙" : emberMF("龙男孩","龙女孩")) + "占据了；而且从[bed]的状态以及……烬那凌乱的……睡姿来看，[Ember ey]似乎在睡梦中翻来覆去。你叹了口气，清了清嗓子，想把烬叫醒。");
               outputText("[pg]烬打了个哈欠，嘟囔着让你回床上去……好吧……你倒是想呢，所以你决定稍微粗暴一点，把烬摇醒。");
               outputText("[pg][say: 什……好吧！我起来了，我起来了！]烬抱怨着，揉了揉[Ember eir]眼睛里的睡意。[say: 怎么了？]");
               outputText("[pg]你好奇地问烬，为什么[Ember ey]会躺在你的床上。烬倒吸了一口凉气，脸颊瞬间涨得通红。");
               outputText("[pg][say: 我-我只是想看看睡在上面是什么感觉，]烬说道，试图让自己的声音听起来平静镇定。");
               outputText("[pg]好吧，现在[Ember ey]知道了，所以如果[Ember ey]能好心地回到[Ember eir]巢穴里去，你现在想要回你的" + (FlagDict_Impl_.arrayReadInt(KFLAGS.flags,2006) > 0 ? "床" : "铺盖") + "了。");
               outputText("[pg][say: 实际上，我可能会留着它。和睡在一堆树叶上相比，它相当舒服……]");
               outputText("[pg]真的吗？所以[Ember ey]想保留这张你在漫长、艰苦的冒险之后睡觉的[bed]？就算你偶尔会清理一下，它应该还是会有很重的你的味道。[Ember ey]不会介意吗？你坏笑着问道。");
               outputText("[pg]烬的脸颊泛起了红晕。[say: 恶心！不要！你留着吧！] 烬手忙脚乱地爬起来，急匆匆地冲出了你的[cabin]。");
               outputText("[pg]你轻笑出声，看来烬上钩了……现在你的[bed]上没有龙了，你仔细地铺好床，躺下准备休息……不过在入睡前，你注意到床上似乎沾染了一些烬的气味……并不难闻，只是有些不同……也许你能习惯这种味道……...");
            }
            else
            {
               outputText("[pg]当你靠近烬的巢穴时，你注意到有些不对劲……仔细一看，你发现烬不在家……难道[Ember ey]还在外面飞翔探索吗？");
               outputText("[pg]好吧，烬已经是个大" + emberMF("男孩","女孩") + "了，你很确定[Ember ey]能照顾好[Ember emself]；所以你决定回到你的[cabin]里去。");
               outputText("[pg]当你走进你的" + get_camp().homeDesc() + "时，你注意到你的[bed]上放着一个不寻常的东西。那是一朵你从未见过的花，无论你走得多远、见识多广，都没见过这种由紫色、粉色和金色花瓣组成的同心圆、几乎呈心形的花朵。它很美丽，闻起来甜美、清新而纯洁。你想知道是谁送了这份意想不到的礼物，但周围似乎没有人……你挠着头思考着走到外面，发现有一串非常清晰的脚印进出你的[cabin]；凭借你培养的生存技能，你断定这些脚印只能属于烬，而且看起来是刚留下的……考虑到这条龙的脾气，你明白为什么[Ember ey]没有留下来亲自把它交给你，不过这还是很贴心……...");
            }
         }
         else
         {
            _loc1_ = Utils.rand(3);
            if(FlagDict_Impl_.arrayReadString(KFLAGS.flags,701) != "Ember" && FlagDict_Impl_.arrayReadInt(KFLAGS.flags,2113) > 0)
            {
               outputText("[pg]在你出发前往烬的巢穴之前，你走进小屋带上了你的闹钟。");
            }
            if(_loc1_ == 0 && FlagDict_Impl_.arrayReadInt(KFLAGS.flags,529) > 0 && FlagDict_Impl_.arrayReadInt(KFLAGS.flags,2206) > 0)
            {
               outputText("[pg]你决定接受烬的提议，在[Ember eir]巢穴里过夜。不过在路上，你到处都没看到这条龙的身影；[Ember ey]一定在里面……所以你决定进入[Ember eir]巢穴去看看[Ember em]。");
               outputText("[pg]当你终于进入烬的巢穴时，你看到烬已经在那里了，坐在[Ember eir]窝上。然而，不寻常的是，[Ember ey]简直是在用力揉抓[Ember eir]" + (littleEmber() ? "胸膛" : "乳房") + "，发出明显的挫败的低吼和嘶嘶声，这让你忍不住问怎么了。");
               outputText("[pg][say: " + (littleEmber() ? "是这个" : "是这些") + "。]烬指着[Ember eir]" + (littleEmber() ? "胸" : "乳房") + "说道。你看着[Ember eir]" + (littleEmber() ? "平坦光滑的胸膛；它看起来" : "丰满的F罩杯；它们看起来") + "挺正常的，并指出了这一点。然而，紧接着你注意到了什么；细小的乳汁水珠，正凝结在[Ember eir]看起来非常酸痛的乳头顶端。你问[Ember ey]是不是感觉有点……涨奶了？");
               outputText("[pg][say: 是啊……感觉好烦人，好胀，好满……啊！这样我根本睡不着！]");
               outputText("[pg]你问有没有什么你能帮忙的；也许你可以试着挤一挤" + (littleEmber() ? "[Ember em]" : "[Ember eir]的乳房") + "？");
               outputText("[pg][say: 嗯……也许你可以试试……]烬有些尴尬地回答。");
               outputText("[pg]你立刻摆好姿势，开始轻轻揉捏这只龙" + (littleEmber() ? "未发育的胸部" : "丰满的乳房") + "。尽管你很努力，但无论你怎么抚摸、揉捏或用手指滚动，两个乳头都只勉强渗出一小股液体。");
               outputText("[pg][say: 拜托！你就没有更好的办法吗？照这个速度，等我被榨干都要到早上了，]烬沮丧地抗议道。");
               outputText("[pg]你注意到，单靠手部刺激似乎无法让[Ember eir]乳房排出乳汁。也许如果你亲自吸吮[Ember em]，它们就会开始排空？这可能是龙族某种奇怪的生理特征，只有在被主动吸吮时才会分泌乳汁。");
               outputText("[pg]烬摸着下巴思考了一下，然后低吼了一声，终于妥协了。[say: 好吧，来吧。只要把这些排空就行。]" + emberMF("他","她") + "揉了揉[Ember eir]胸部以示强调。");
               outputText("[pg]你默默地点了点头，选择不去冒犯烬的自尊心，然后轻轻伸出手抚摸[Ember eir]一直裸露的胸膛，感受着手中" + (littleEmber() ? "肿胀的" : "[Ember eir]沉甸甸的") + "乳房。" + (littleEmber() ? "与平时完美的平坦相比，这轻微的肿胀显得格外明显" : "它们感觉确实比平时重得多") + "……可怜的家伙，[Ember ey]一定痛坏了。为了不让[Ember em]久等，你低下头，用嘴唇含住第一颗乳头。乳汁立刻喷涌进你的嘴里，一如既往地清凉甘甜，几乎不需要怎么费力，就从龙的乳房被吸进了你的嘴里。");
               outputText("[pg][say: 啊！……小心点！它们很敏感……]烬责备着你，慢慢向后靠，躺在[Ember eir]巢穴上。你道了歉，试着动作更轻柔一些，轻轻按摩着[Ember eir]乳房以帮助缓解胀痛，同时继续吸吮着那清凉甘甜的乳汁。");
               get_player().refillHunger(25);
               outputText("[pg]烬如释重负地叹了口气。[say: 啊……就是这样……你根本不知道这有多舒服……我感觉自己都要炸了……]你对烬突然平静下来的反应感到惊讶；老实说，你已经习惯了[Ember eir]相当粗鲁的举止……不过现在可不是思考这些的时候。毕竟，你还要把满满一乳房的龙乳排空，装进你饥渴的肚子里。");
               outputText("[pg]你继续吮吸和揉捏，享受着这美味的款待，并温柔地抚摸着你龙族恋人的" + (littleEmber() ? "胸膛" : "乳房") + "，[Ember ey]显然很享受，从[Ember eir]轻柔的呼噜声和愉悦的叹息声中就能看出来。当你觉得已经把第一侧乳房里最胀的部分吸空后，你开始对付第二侧，继续你的治疗。");
               outputText("[pg][say: 对……别停……嗯……] 烬的呼噜声变得更响了，你快速瞥了一眼[Ember eir]的脸，发现[Ember ey]竟然闭着眼睛在微笑。你很高兴自己似乎做得不错，当然，这美味的乳汁也功不可没……不过你有些纳闷……尽管烬平时的产奶量就很高，但这甚至对[Ember em]来说也太多了点。也许[Ember ey]吃了什么引发了这种情况？你只能等完事后再问[Ember em]了。");
               outputText("[pg]你喝了又喝，但随着你不断地喝，你感觉到脸颊上有一阵湿润。你停止吮吸，从烬的乳房上抬起头，发现另一侧乳房明显又胀了起来；它现在充满了乳汁，就像你刚开始时一样！!");
               outputText("[pg]你问烬[Ember ey]到底做了什么？[Ember eir]产奶量这么高是不正常的。然而，你得到的唯一回答是这只——现在已经睡着的——龙发出的轻柔鼾声。看来你吮吸带来的缓解足以让[Ember em]像被吹灭的蜡烛一样睡去……好吧，不管怎样，你确实主动提出要帮[Ember em]，所以你得做到底。你叹了口气，重新含住第一侧乳房，开始新一轮的畅饮。");
               get_player().refillHunger(25);
               outputText("[pg]过了一会儿，你发现每当你以一种特别令人愉悦的方式吮吸[Ember em]时，你就会用叹息或喘息打断烬轻柔的鼾声，但这只龙依然没有醒来。这其实挺有趣的……...");
               outputText("[pg]<b>一段时间后……</b>");
               outputText("[pg]你已经这样做了很长一段时间了……你吸干了烬的乳房多少次了？四次？五次？你不知道……除此之外，你自己也觉得相当累了……加上所有这些在你的肚子里晃荡的乳汁并不能帮助你保持清醒……但你仍然必须坚持下去……...");
               outputText("[pg]<b>更晚些时候……</b>");
               outputText("[pg]伴随着最后一次有力的吸吮，你终于吸干了烬最后的乳汁……你相信这是第8次了……又累又饱……你甚至懒得从沉睡的龙身上下来。你把头靠在" + (littleEmber() ? "孩子赤裸的胸膛上，并且" : "烬柔软的、充满乳汁的乳房之间，被它们柔软的" + (FlagDict_Impl_.arrayReadInt(KFLAGS.flags,531) == 0 ? "鳞片" : "肉体") + "包围着，") + "你就在那里睡着了……...");
               get_player().removeStatusEffect(StatusEffects.DragonBreathCooldown);
               get_player().slimeFeed();
               get_player().changeFatigue(-40);
            }
            else if(_loc1_ == 1 && (get_player().lib + get_player().cor / 2 >= 50 || get_player().get_lust100() >= 70) && FlagDict_Impl_.arrayReadInt(KFLAGS.flags,2206) > 0)
            {
               outputText("[pg]经过一天的辛苦工作，你只想回到你的[cabin]里，倒头就睡。不过，你觉得在睡觉前去看看烬也没什么坏处，也许[Ember ey]今晚需要人陪……");
               if(get_player().lib >= 66 || get_player().get_lust100() >= 90)
               {
                  outputText("也许你运气好，[Ember ey]也会想找点乐子呢？");
               }
               outputText("[pg]当你靠近[Ember eir]巢穴时，你瞥见烬正坐在外面的尘土中，吃着小零食。尽管[Ember ey]通常偏爱肉食，但这显然是你没见过的一种水果……不过它非常多汁；烬每咬一口，都会爆出一点看起来很甜的汁液，顺着烬的手和手臂流下来。");
               outputText("[pg]烬吃完了最后几口，正如你所料，[Ember ey]开始舔掉[Ember eir]鳞片上的汁液，慢慢地舔掉[Ember eir]手臂上的汁液，品味着每一次性感的舔舐；然后转移到[Ember eir]手指上。" + emberMF("他","她") + "挑出一根带爪的手指，小心翼翼地用[Ember eir]舌头环绕着它；然后慢慢地把它吸进去，让爪子小心地滑过[Ember eir]嘴唇……[Ember eir]柔软奇妙的嘴唇……像吸吮乳头一样吸吮着手指……到处舔舐以确保它干净……最后伴随着“啵”的一声把它拔出来，吧唧着[Ember eir]嘴唇，舔着它们以确保[Ember ey]把所有的汁液都舔干净了……...");
               outputText("[pg]一阵突如其来的骚动" + (get_player().get_gender() > 0 ? "在你的腹股沟" : "在你的体内") + "显现出来；如果你不知道的话，你还以为烬是在为你表演呢……[Ember ey]在[Ember eir]每一根沾满汁液的手指上重复着这个过程，最后以一声愉悦的叹息结束。你对这场即兴表演的短暂持续时间感到有些失望……也许你现在该去睡觉了……...");
               outputText("[pg]但正当你准备移开视线时，你看到烬站起身来，开始伸懒腰。" + emberMF("他","她") + "把[Ember eir]手臂放在[Ember eir]脑后，挺起[Ember eir]胸膛，让你能清楚地看到[Ember eir]" + (littleEmber() ? "平坦的胸部" : (FlagDict_Impl_.arrayReadInt(KFLAGS.flags,529) > 0 || emberIsFeminine() ? "丰满的胸部" : "结实的胸膛")) + "。火光映照在[Ember eir]" + (FlagDict_Impl_.arrayReadInt(KFLAGS.flags,531) == 0 ? "鳞片" : "皮肤") + "上，看起来就像小手一样，抚摸和舔舐着[Ember eir]乳头，以最变态的方式扭动着它们，让烬舒服得呻吟起来……...");
               outputText("[pg]现在你已经完全忘记了疲惫，你的眼睛紧紧盯着烬，只见[Ember ey]转过身，向下够向[Ember eir]脚，保持[Ember eir]双腿笔直以完成伸展；[Ember eir]尾巴翘在空中帮助[Ember em]保持平衡，让你能完美地看到[Ember eir]" + (littleEmber() ? "小巧的" : "盈盈一握的") + "屁股" + (emberHasVagina() ? "以及[Ember eir]" + (littleEmber() ? "小穴" : "欢愉之洞") + "柔软的阴唇" : "") + "。当烬发出一声如释重负的呻吟叹息时，你呜咽了一声；想象着自己和烬在那个特定的姿势下做着真正美妙的事情……你被烬慢慢弯曲的背部迷住了，向[Ember em]迈出了一步，踢翻了一块小石头。烬吓了一跳，看向声音的来源，结果发现了你。");
               outputText("[pg][say: 哦……你好[name]。我马上就要去睡觉了，只是需要喝点水。]");
               outputText("[pg]你只是点点头，艰难地咽了口唾沫……你想把你的性奋归咎于这个世界，但老实说，你不太确定如果在英格纳姆看到这样的景象，你是否也会有这种感觉。");
               outputText("[pg]烬拿来一个小水袋，把打开的盖子举到[Ember eir]唇边，然后[Ember ey]开始揉捏水袋，把里面新鲜的液体挤进[Ember eir]嘴里；一些水从[Ember eir]嘴角漏了出来，顺着[Ember eir]身体滑落，在[Ember eir]下巴形成一条小溪流，流过[Ember eir]" + (FlagDict_Impl_.arrayReadInt(KFLAGS.flags,529) > 0 || emberIsFeminine() ? "柔软的乳房" : "结实的胸膛") + "，汇集在[Ember eir]小肚脐上。");
               outputText("[pg]一种突然的、不可能的冲动闪过你的脑海，你想拉近你们之间的距离，把[Ember em]舔干，然后你猛地打消了这个念头。");
               outputText("[pg]烬疑惑地看着你。[say: 怎么了，[name]？有什么不对劲吗？]");
               outputText("[pg]你想知道烬是故意这么做还是无意的……你敢冒着惹怒这条龙的风险问[Ember ey]是不是在和你调情吗？最后，你决定说没什么，你只是累了。");
               outputText("[pg][say: 既然如此，既然你都大老远跑来了，也许你应该和我一起上床睡觉？]");
               outputText("[pg]好吧……在收到这个邀请后，你觉得你的[cabin]太远了，懒得回去，所以你问烬是否介意让你和[Ember em]一起过夜？");
               outputText("[pg][say: 当然。我说过随时欢迎你来。]");
               outputText("[pg]烬走进[Ember eir]巢穴，四肢着地……爬向[Ember eir]窝，尾巴左右摇摆，动作优雅得像只猫。" + emberMF("他","她") + "慢慢地绕着[Ember eir]窝转了一圈，然后四脚朝天地倒下，轻轻地抓挠着[Ember eir]脖子和肚子；然后把[Ember eir]手移到[Ember eir]乳头上，按压[Ember eir]" + (!littleEmber() && (emberIsFeminine() || FlagDict_Impl_.arrayReadInt(KFLAGS.flags,529) > 0) ? "柔软的球体" : "胸部") + "，一直打着呼噜，闭着眼睛。");
               outputText("[pg]烬半眯着眼睛看着你，向你伸出一只手臂，邀请你加入[Ember em]。你忍不住盯着这条龙，再次怀疑[Ember ey]是不是故意想挑逗你，还是你在这个性欲过剩的世界里待得太久了。决定把一切交到[Ember eir]手里，你悄悄地走过去，和这个" + (littleEmber() ? "小" + emberMF("男孩","女孩") : "龙") + "一起躺在[Ember eir]床上……你忍不住想，你是怎么变得对这种事如此习以为常的。");
               outputText("[pg]烬慢慢地拥抱你，把你紧紧地抱在[Ember em]怀里，在你耳边低语，[say: 晚安，[name]。]然后闭上[Ember eir]眼睛，叹了口气，终于睡着了。");
               outputText("[pg]在目睹了之前那些场景后，你很难入睡……当你终于设法闭上眼睛时，你看到的只有烬……以各种姿势，召唤你加入[Ember em]并满足自己……...");
               dynStats(DynStat.Lust(30));
            }
            else if(_loc1_ == 2 && Utils.rand(2) == 0 && FlagDict_Impl_.arrayReadInt(KFLAGS.flags,2206) > 0)
            {
               outputText("[pg]你想知道烬今晚是否需要人陪伴，于是你走向龙的巢穴，对生活的讽刺苦笑。在村子里，那些进入龙穴的人的故事通常以愚蠢的入侵者惨死而告终；然而此时此地，很少有地方能让人感觉如此安全。");
               outputText("[pg]烬看到你走近，转过身来迎接你，揉着[Ember eir]睡眼惺忪的眼睛。[say: [name]？你想要什么？]");
               outputText("[pg]你告诉这" + (littleEmber() ? "小" + emberMF("男孩","女孩") : "条龙") + "，你只是好奇[Ember ey]今晚是否需要有人陪[Ember ey]睡觉。烬打了个哈欠，对你短暂地笑了一下；然而，当[Ember ey]再次看你时，[Ember eir]表情变了。[say: 是的，我需要人陪……而你需要洗个澡。看看你自己……你在外面闲逛后弄得浑身脏兮兮的。] " + emberMF("他","她") + "指着你强调道。");
               outputText("[pg]你停下来闻了闻自己……这龙说得有道理。即使在你的[cabin]里，你这样也很难入睡；在烬那更狭窄的巢穴里，那简直无法忍受。你告诉[Ember em]你要去洗漱一下……然后，你忍不住露出调皮的笑容，问[Ember ey]是否也想梳洗一下。[say: 是的，但只是因为我想确保你一尘不染，] 烬回答道，拉着你的手臂，带你走向最近的溪流。");
               outputText("[pg]一到溪边，烬就剥光了你的衣服；当[Ember ey]整齐地折叠你的[armor]时，[Ember ey]对你露出了恶作剧般的笑容。[say: 去吧！] 随着[Ember eir]尾巴猛地一推，你一头栽进了溪流中。你迅速挣扎着浮出水面，吐出水，并咒骂这龙的诡计。说起来……你到处都看不到烬……[Ember ey]能去哪儿了？");
               outputText("[pg]这个问题并没有萦绕太久，一声巨大的水花溅起，一股水浪拍打在你的背上。你摇了摇头，甩着湿漉漉的[haircolor]头发，环顾四周，试图找到刚刚向你俯冲轰炸的龙。你再次未能发现烬的踪影……" + (littleEmber() ? "" : " 这么大的东西怎么能这么鬼祟！？!?"));
               outputText("[pg]有什么东西缠住了你的腰，把你拉向一双长着爪子的手，那双手开始用捣碎的花朵制成的糖浆状溶液忙碌地擦洗你的[hair]。你不假思索地挣扎着，不知道发生了什么，但当气味扑鼻而来时，你放松了下来。显然是烬在做这件事……但你问，为什么[Ember ey]要这样做？");
               outputText("[pg][say: 多么愚蠢的问题……你不会指望在水里快速泡一下就能干净吧？让我来，我保证你一会儿就干净了。]");
               outputText("[pg]你注意到[Ember ey]避开了你问题的核心，但决定不再追问。");
               outputText("[pg]而且……这感觉很好，闻起来也很香。烬似乎也很享受……每隔一会儿，[Ember eir]手就会游移到你身上各个敏感部位触摸……在你现在的位置你可能看不到，但你几乎能感觉到烬在每一次游移的抚摸中都会颤抖。");
               outputText("[pg][say: 转过身来，我现在要洗你的前面。] 烬伸手去拿附近的一个碗，在[Ember eir]爪子里收集更多的乳液。");
               outputText("[pg]你平静地呼吸着，转过身来，在水中轻轻地趟着，直到你面对着你那" + (littleEmber() ? "孩子般" : "龙族") + "的爱人。快速瞥了烬一眼证实了你的怀疑；[Ember ey]几乎有些头晕目眩。然而，烬试图在[Ember eir]任务中至少看起来很专业；[Ember ey]开始揉搓你的[breasts]，在你的[nipple]上停留的时间比必要的要长一点。");
               outputText("[pg][say: 感觉怎么样？好点了吗？] 烬问道，试图开启对话。");
               outputText("[pg]你只是轻轻地点了点头，闭上眼睛，享受着这种待遇，并试图不让这个情感上缺乏安全感的" + (littleEmber() ? "孩子" : "龙") + "感到更加尴尬。");
               _loc2_ = get_player().hasCock() ? get_player().multiCockDescriptLight() : "";
               _loc3_ = get_player().hasCock() && get_player().hasVagina();
               _loc4_ = get_player().hasVagina() ? get_player().vaginaDescript() : "";
               _loc5_ = get_player().get_gender() == 0 ? "腹股沟" : "";
               outputText("[pg]烬笑了。[say: 很好。] 缓慢而坚定地向你的" + _loc2_ + (_loc3_ ? "和" : "") + _loc4_ + _loc5_ + "移动。");
               outputText("[pg]你在这份关注下颤抖着，即使你的大脑在飞速运转。嗯……" + (FlagDict_Impl_.arrayReadInt(KFLAGS.flags,531) == 0 && FlagDict_Impl_.arrayReadInt(KFLAGS.flags,528) == 0 ? "你注意到烬[Ember emself]没有头发，但这并没有阻止你伸出手开始轻轻抚摸" + emberMF("他","她") + "的头皮。" : "认为公平起见，你伸出手开始轻轻抚摸烬的头发，收集了一些[Ember ey]用来洗你头发的同种粘液。") + "");
               outputText("[pg][say: 喂-喂！我不是那个需要洗澡的人！] 烬抗议道。");
               outputText("[pg]你只是笑了笑，告诉[Ember em]既然你们在一起，你也可以这样做。也许[Ember ey]不需要像你那样洗澡，但你不得不承认，[Ember eir]麝香味最近变得有点重了。");
               _loc6_ = get_player().hasCock() ? get_player().multiCockDescriptLight() : "";
               _loc7_ = get_player().hasCock() && get_player().hasVagina();
               _loc8_ = get_player().hasVagina() ? get_player().vaginaDescript() : "";
               _loc9_ = get_player().get_gender() == 0 ? "无性别的胯部" : "";
               _loc10_ = FlagDict_Impl_.arrayReadInt(KFLAGS.flags,531) == 0 ? "头皮" : "头发";
               _loc11_ = !littleEmber() && (emberIsFeminine() || FlagDict_Impl_.arrayReadInt(KFLAGS.flags,529) > 0);
               outputText("[pg][say: 好-好吧……随你……] 烬妥协了，终于伸手去摸你的" + _loc6_ + (_loc7_ ? "和" : "") + _loc8_ + _loc9_ + "。你揉捏并按摩[Ember eir]" + _loc10_ + "，然后开始把手往下移，揉搓[Ember eir]肩膀和脖子，然后移到[Ember eir]" + (_loc11_ ? "丰满的乳房" : "平坦的胸部") + "，轻轻地玩弄着这龙的乳头。");
               outputText("[pg]烬颤抖着，你听到一声微弱的愉悦叹息。[say: 你-你应该是在清洗它们！而不是玩弄它们！] 烬责骂你。");
               _loc12_ = FlagDict_Impl_.arrayReadInt(KFLAGS.flags,529) > 0 || emberIsFeminine();
               _loc13_ = pregnancy.get_isPregnant() ? "肿胀的" : "平坦而肌肉发达的";
               outputText("[pg]你无辜地评论说，你只是在确保它们尽可能干净，用手指轻轻地描绘着" + (_loc12_ ? "一个乳头" : "[Ember eir]胸部心形的印记") + "。尽管如此，你还是决定你已经戏弄够了[Ember em]，开始把手继续往下移，穿过[Ember eir]" + _loc13_ + "肚子。");
               outputText("[pg]烬停下了清理动作，转而靠在溪流岸边，向后倾斜身体，让你能更方便地触碰。看来你们的角色互换了……不过你并不抱怨。你的手指在[Ember eir]" + (pregnancy.get_isPregnant() ? "怀孕的" : "") + "腹部上下抚摸，轻轻划过那里的鳞片，看着这只龙因为你的服侍而兴奋地颤抖。" + emberMF("他","她") + "的" + emberGroinDesc("肉棒开始" + (emberInternalDick() ? "从缝隙中探出并" : "") + "勃起","小穴开始变得湿润，润滑液顺着[Ember eir]双腿滴落进水里") + "。诱人地，一寸一寸，你的手向龙的胯部游移，在即将触碰到[Ember eir]生殖器时停了下来。");
               outputText("[pg][say: 够、够了……我自己能洗完，]烬抗议道，声音听起来有些虚弱。");
               outputText("[pg]你告诉[Ember em]，如果[Ember ey]真的这么想的话……你放开[Ember em]，转身面向湖面，" + (get_player().hasTailInsteadOfLegs() || get_player().isGoo() ? "滑" : "走") + "进水里，准备洗完剩下的部分。还没走多远，你就感觉到烬的尾巴第二次缠上了你的腰。");
               outputText("[pg][say: 你的澡还没洗完呢！]烬宣布道，把你拉向[Ember em]，并揉捏着你的[ass]；[Ember eir]双手在你下半身游走" + (get_player().get_gender() > 0 ? "，也抚摸着你的生殖器" : "") + "。最后，[Ember ey]在你的屁股上轻轻拍了一下，宣布你洗干净了。");
               outputText("[pg][say: 好了……现在我只需要把自己洗干净就行了。]烬伸手去拿装有花香乳液的碗，但在[Ember ey]的爪子碰到它之前，你一把抢过碗，把手伸了进去。[Ember Ey]帮你洗干净了，所以你也应该这么做才公平……在烬还没来得及抗议之前，你就开始揉捏和摩擦" + (littleEmber() ? "这个孩子的" : "[Ember eir]") + "大腿。你的手滑过[Ember eir]双腿和尾巴，最后终于触碰到了你的战利品；烬的" + emberGroinDesc("勃起的肉棒","湿润的小穴") + "。");
               outputText("[pg]你小心翼翼地将药膏涂抹在[Ember eir]" + emberGroinDesc("肉棒","小穴") + "上，抚摸着" + emberGroinDesc((littleEmber() ? "" : "长长的") + "肉棒","[Ember eir]女性私处柔软湿润的内壁") + "。烬喘息着，但强烈的快感让[Ember em]无法发出任何抗议。你迅速而高效地完成了工作，不想过度挑逗这只龙；于是你微笑着宣布龙洗干净了，再次走向岸边去拿你的衣服。");
               outputText("[pg]决定找点乐子，你故意诱人地弯下腰，摇晃着你的[butt]，抖落并刮掉皮肤上的水，然后拿起衣服。你回头抛了个媚眼，看看烬对你的小表演有什么反应；谁让[Ember em]摸你还把你弄得欲火焚身……而且还是借着帮你洗澡的名义。");
               outputText("[pg]烬的眼睛紧紧盯着你的身姿，过了一小会儿[Ember em]才注意到你在看，但一旦[Ember ey]发现了；[Ember ey]立刻转过头去。");
               outputText("[pg][say: 你、你先去巢穴里等我……我得处理点事……]");
               outputText("[pg]你给了[Ember em]一个无辜的微笑，清楚地表明你知道[Ember ey]要去做什么，然后转身回去，渴望能睡个好觉。一进去，你就在烬的巢里躺下，没过多久烬也加入了你。" + emberMF("他","她") + "在你的脸颊上飞快地啄了一下，依偎着你，用[Ember eir]翅膀盖住你们俩，终于让睡意带走了[Ember em]……你也很乐意跟着入睡……");
               dynStats(DynStat.Lust(20));
               get_player().hasGottenWashed();
            }
            else if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,2206) <= 0)
            {
               outputText("[pg]你走向烬晚上通常睡觉的地方，但令你惊讶的是，这只龙不在那里。你想知道[Ember ey]去哪了；也许是在月光下飞行？放弃了今晚见到[Ember em]的念头，你转身准备回你的[cabin]，打算睡一觉。");
               outputText("[pg]然而，还没走多远，烬就降落在了你身后。[say: [name]？你想见我吗？]");
               outputText("[pg]你回答说，是的，你想。你想在睡前确认一下[Ember ey]是否安好。");
               outputText("[pg]烬交叉着[Ember eir]双臂。[say: 哼……你把我当什么了？小孩子吗？我已经够大了，能照顾好自己，而且如你所见，我好得很。]");
               outputText("[pg]" + (littleEmber() ? "决定不指出[Ember ey]<i>确实</i>是个孩子" : "看到情况确实如此") + "，你向[Ember em]道了晚安，转身准备回你的[cabin]休息。烬伸手抓住你的肩膀，在你离开之前拦住了你。[say: 但是……]");
               outputText("[pg][say: 但是]什么，你回答道？[say: 既然你似乎这么担心我；有件事你可以为我做。]你问[Ember em]那可能是什么？烬移开[Ember eir]视线，揉了揉[Ember eir]后颈。[say: 留下来，][Ember ey]轻声说道。");
               outputText("[pg]……你说什么？[Ember ey]真的问了你以为你听到的那个问题吗？");
               outputText("[pg][say: 别胡思乱想！这不是邀请你做什么，]烬急忙脱口而出。然后用更柔和的语气，[Ember ey]说，[say: 我只是今晚不想一个人待着。]");
               outputText("[pg]有那么一瞬间，那些关于走进龙穴是多么愚蠢的古老故事在你脑海中回响……但你把它们抛在脑后。烬不像你村里故事中的那些龙（尽管你忍不住想，如果[Ember ey]有十米高什么的，操[Ember em]会是什么感觉），而且这样做完全没有危险。所以，如果[Ember ey]真的想让你陪[Ember em]过夜……为什么要拒绝呢？你告诉[Ember em]，如果[Ember ey]真的想让你今晚睡在[Ember eir]巢穴里，你很乐意。");
               outputText("[pg][say: 太好了，进来吧。]烬微笑着，向[Ember eir]巢穴入口伸出一只手臂。你按照[Ember ey]的指示挤了进去，在凉爽的黑暗中摸索着前进；在你身后，你能听到你那龙族恋人跟着你。[say: 床在你的右边。]烬提醒你。");
               outputText("[pg]你在昏暗中摸索着，为了帮你，烬轻轻呼出一团摇曳的火焰，这光亮足以让你看清那张[say: 床]——或许叫[say: 巢]更合适。那是一大堆散发着甜香的树叶和干草，上面有一个明显的凹痕，显然是烬平时休息的地方。你脱下觉得碍事的衣服，陷进这出乎意料柔软舒适的草堆里，小心翼翼地避开[say: 烬的位置。]烬在你身边躺下，一把将你抱进怀里，把你拉向[Ember eir]" + (FlagDict_Impl_.arrayReadInt(KFLAGS.flags,529) > 0 && !littleEmber() ? "丰满的" : "") + "胸膛，正好落入[Ember eir]“位置”……看来你是白躲了……...");
               outputText("[pg]烬温柔地用一只翅膀盖住你，尽可能地把你包裹起来；[Ember eir]尾巴盘绕在你的[legs]上，轻轻地缠着你。[say: 舒服吗？]");
               outputText("[pg]你回答说，是的，很舒服，但你没说这比你想象的还要舒服得多。[say: 那就好……]烬抱得更紧了，短暂的沉默后，[Ember ey]说道：[say: [name]……我……我想让你知道，这里随时欢迎你。以防你厌倦了你睡的那个脆弱又难闻的[cabin]……]");
               outputText("[pg]你告诉[Ember em]你会记住的……然后抗议说你的" + get_camp().homeDesc() + "一点也不难闻！[say: 是啊……当然……随你怎么说……]烬敷衍地回答，但你还是听出了一丝讽刺的意味……不过现在不是计较这个的时候。也许你该找个时间把你的[cabin]洗洗了？");
               outputText("[pg]烬打了个哈欠，终于向你道了晚安。[say: 睡个好觉。]你也回了一句，带着一丝难以置信，任由自己被紧紧依偎着，慢慢进入了梦乡。");
            }
            else
            {
               outputText("[pg]你想知道烬今晚是否需要人陪伴，于是你走向龙的巢穴，对生活的讽刺苦笑。在村子里，那些进入龙穴的人的故事通常以愚蠢的入侵者惨死而告终；然而此时此地，很少有地方能让人感觉如此安全。");
               outputText("[pg]烬看到你走近，转过身来迎接你，揉着[Ember eir]睡眼惺忪的眼睛。[say: [name]？你想要什么？]");
               outputText("[pg]你告诉这只" + (littleEmber() ? "孩子" : "龙") + "，你只是好奇[Ember ey]今晚在床上是否需要人陪。烬打了个哈欠，对你短暂地笑了笑。[say: 是的……我确实需要人陪……而且我也说过，你随时都可以过来。所以……进来吧。]烬靠在[Ember eir]巢穴入口处，等着你进去。");
               outputText("[pg]你跟着龙走了进去，凭着记忆轻松找到了烬的树叶床，你开始脱下并扔掉多余的衣服，然后躺下，让自己舒服点。");
               outputText("[pg]烬也跟着躺下，尽可能地抱住你，依偎在你身边。[say: 晚安，[name]。]" + emberMF("他","她") + "轻轻吻了吻你的脸颊。[say: 睡个好觉。]");
               outputText("[pg]你也回了一句，调整了一下姿势抱住[Ember em]，[Ember eir]翅膀像毯子一样盖在你们俩身上。");
            }
            outputText("[pg]你打算睡" + Utils.num2Text(get_timeQ()) + "个小时。");
            FlagDict_Impl_.arrayWriteString(KFLAGS.flags,701,"Ember");
            _loc14_ = KFLAGS.flags;
            FlagDict_Impl_.arrayWriteInt(_loc14_,2206,FlagDict_Impl_.arrayReadInt(_loc14_,2206) + 1);
            FlagDict_Impl_.arrayWriteInt(KFLAGS.flags,2207,1);
         }
         emberAffection(3);
         doNext(get_camp().sleepWrapper);
      }
      
      public function saveToObject() : Object
      {
         return saveContent;
      }
      
      public function reset() : void
      {
         saveContent.flowerExplained = false;
         saveContent.newbornGender = 0;
         saveContent.birthTime = 0;
         saveContent.learnedFeeding = false;
         saveContent.eggArray = [];
         saveContent.hatchedToday = 0;
         saveContent.tuckedToday = 0;
      }
      
      public function postEmberSleep() : void
      {
         FlagDict_Impl_.arrayWriteInt(KFLAGS.flags,2207,0);
         clearOutput();
         outputText("你打了个哈欠，伸了个懒腰，在……烬？的身边睡了个好觉后，舒展了一下筋骨。?");
         outputText("[pg]你环顾四周，却没有看到龙的踪影……[Ember ey]大概是去吃早饭了。" + get_player().clothedOrNaked("……看向一旁，你发现你的[armorName]整齐地叠放在巢穴旁边。") + "你暗自笑了笑，" + get_player().clothedOrNaked("穿上你的[armorName]并") + "准备迎接新的一天……...");
         doNext(playerMenu);
      }
      
      public function penetrateWithEmber(param1:Boolean = true) : void
      {
         if(param1)
         {
            clearOutput();
         }
         else
         {
            outputText("[pg]");
         }
         var _loc2_:int = get_player().cockThatFits(emberVaginalCapacity());
         if(_loc2_ < 0)
         {
            _loc2_ = get_player().smallestCockIndex();
         }
         outputText("[say:来吧。]她伸出双臂抱住你。[say:进来吧。]不需要更多的前戏，你滑入她湿润的小穴，这个器官急切地第四次接纳了你。");
         outputText("[pg]烬紧紧地拥抱着你，用她长着爪子的手抚摸着你的身体两侧，始终小心翼翼地不弄伤你。[say:感觉真好……不过尽量温柔点，我刚才还有点疼，]她轻声哼唱着，亲吻你的脸颊。你温柔地把玩着她的" + (littleEmber() ? "乳头" : "乳房"));
         if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,529) > 0)
         {
            outputText("，乳汁渗过你的手指，");
         }
         outputText("并向她保证你会的，慢慢地滑入，直到你再次没入根部。");
         outputText("[pg]龙");
         if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,531) > 0)
         {
            outputText("娘");
         }
         outputText("在你的服侍下呻吟着");
         if(emberHasCock())
         {
            outputText("，她那龙形的肉棒紧紧地压着你，不断渗出淫液，弄湿了");
            if(get_player().biggestTitSize() > 1)
            {
               outputText("你的[chest]、");
            }
            outputText("你的肚子");
            if(get_player().biggestTitSize() > 1)
            {
               outputText("，");
            }
            outputText("还有烬自己的肚子。");
         }
         outputText("[say:你喜欢玩弄我这" + (littleEmber() ? "未发育的" : "") + "身体吗？]烬半眯着眼睛注视着你问道。你给了她一个戏谑的坏笑，手指熟练地滑过她的乳头，让她在刺激下发出呻吟和娇喘，这比单纯的言语更能说明问题。");
         outputText("[pg][say:我很高兴你喜欢我的身体……但你知道我也喜欢你的吗？而且我非常……非常喜欢……]她在你耳边低语，用她长长的舌头舔舐着你的耳朵。她游移的双手摸到了");
         if(get_player().tail.type > 0)
         {
            outputText("你的尾根，轻轻地拉扯并抚摸了一会儿，然后她的手移到了");
         }
         outputText("你的[butt]上，抓住了");
         outputText("臀瓣。你在她的抓握下感激地扭动着身体，清楚地表明她在这方面也很有一套。母龙对你的赞美咯咯地笑了起来，将尾巴缠绕在你的[legs]上。[say:我还没开始好好玩弄你呢，我的伴侣，你就已经这么兴奋了……]她咂了咂嘴，假装责备。[say:你真是个变态，不是吗，[name]？幸运的是，你是<b>我的</b>变态，而且我很喜欢被玩弄……所以尽管随心所欲地玩弄我的身体吧。我一定会报答你的，]她深情地发出呼噜声，双手顺着你的背部向上滑动，");
         if(get_player().wings.type > 0)
         {
            outputText("她停顿了一下，抚摸着你的[wings]，然后继续向上，");
         }
         outputText("停在你的后脑勺上。");
         outputText("[pg]她慢慢地引导你靠近她挺立的乳头之一。[saystart]");
         if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,529) > 0)
         {
            outputText("喝我的奶吧，我可是专门为你攒的，");
         }
         else
         {
            outputText("我现在乳房里可能没有奶水，但也许如果你继续吸吮，我就能为你产出一些，");
         }
         outputText("[sayend]烬挑逗着你。你对她笑了笑，含住乳头，在唇间滚动，并用牙齿施加温柔、挑逗的压力。");
         if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,529) > 0)
         {
            outputText("你品尝着随之喷涌而出的甜美龙乳，它顺从地喷射进你的喉咙。");
         }
         outputText("[pg][say: 嗯……感觉真好。只是……别忘了现在的重点是什么。]她迎合着你的阴茎挺动，它仍然紧紧地插在她体内。");
         if(emberHasCock())
         {
            outputText("随着动作带来的快感，一小滴前列腺液从烬的龙根中溢出。");
         }
         outputText("[say: 还有，别忘了" + (littleEmber() ? "另一边" : "我的另一个乳房") + "。]她握住你的手，引导它到她的另一座双峰上，帮你揉捏它。");
         outputText("[pg]你如她所愿地挤压她的乳房，抚摸着那" + (littleEmber() ? "小巧的乳头" : "坚挺却柔软的肉体") + "。与此同时，你挑逗地吸吮着她的另一个乳头，");
         if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,529) > 0)
         {
            outputText("任由乳汁溢入你的口中，大口吞咽着一波又一波甜美的汁液，");
         }
         outputText("听着她因你的动作而发出轻柔的呻吟，感受着她的阴唇在你的" + get_player().cockDescript(_loc2_) + "周围泛起涟漪。你的吸吮突然被打断，你被拉离烬的乳房，陷入一个深吻。龙女将舌头伸进你的嘴里，仔细地探索着");
         if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,529) > 0)
         {
            outputText("，甚至不在乎你在咽下乳汁时她尝到了自己的奶水");
         }
         outputText("。你尽可能热烈地回吻她，直到缺氧迫使你打破这个吻，大口喘气。");
         outputText("[pg][say: 我好爱你，[name]。为我射出来吧……]她蹭着你。即使你想，你也无法抗拒她，你过度敏感的阴茎痉挛着，第三次将自己清空在她那被充分使用的阴道里。你的高潮引发了烬的高潮，龙");
         if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,531) > 0)
         {
            outputText("娘");
         }
         outputText("对着天花板咆哮，然后转头看着你，她的阴道收缩着，榨干你所有的精华。由于前三次高潮已经精疲力尽，你只是向后靠去，享受着最后一次被她强健的阴道肌肉榨取的感觉。");
         if(get_player().cumQ() < 250)
         {
            outputText("[pg]只有一丝细流从你体内流出，因为你在前两次高潮中已经耗尽了存货");
         }
         else if(get_player().cumQ() < 500)
         {
            outputText("[pg]尽管此时已经被榨干了，但你的射精量仍然足以与正常的高潮相比，又增加了几股粗大的精液，将她原本就微微隆起的肚子撑得更大了");
         }
         else
         {
            outputText("[pg]凭借你惊人的产量，虽然你射出的量比平时少得多，但仍然比任何普通男人的第一次要多得多。烬呻吟着，她本就肿胀的肚子又大了一两英寸，看起来完全是一副“随时可能生”的孕妇模样。");
         }
         outputText("。");
         if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,525) == 3)
         {
            outputText("她的龙根在你高潮的整个过程中都在跳动，空射了几次后，在她的肚子上喷出了几股清液。");
         }
         outputText("[pg]你们俩瘫倒在彼此的怀里。你正想拔出来，但烬按住你的臀部阻止了你。[say:留在里面……它就该待在那儿。]她对你微笑着，微微喘着气。你太累也太高兴了，不想争辩，只是点了点头，靠在她身上，任由睡意袭来。在失去意识之前，你隐约感觉到烬也做了同样的事。");
         get_player().orgasm("Generic");
         menu();
         addButton(0,"继续",emberJizzbangbangEnding);
      }
      
      public function penetrateEmbrahPartII() : void
      {
         clearOutput();
         outputText("你醒来时发现烬微笑着俯身看着你；一旦她意识到你醒了，她迅速移开了视线。");
         outputText("[pg][say: 哦，太好了！你终于醒了！现在，让我听听你缺乏自制力的借口；多亏了你，我下面要疼好一阵子了！]烬责骂你，喷出一小口烟。");
         outputText("[pg]你困倦地打了个哈欠，评论说你只是在做她想做的事；毕竟，她想让你让她高潮，而你做到了。");
         outputText("[pg][say: 嗯……是啊……但这并不意味着你必须这么粗暴！除此之外，你上了我两次！两次！而且还是在一个非常屈辱的姿势下！]她又喷出一口烟补充道。");
         outputText("[pg]你笑着回忆起你们这场交锋的结局；当你从后面骑上她时，你没听到她抱怨，而且是她选的姿势……<i>而且</i>从你的回忆来看，她似乎很享受第二次四肢着地的感觉。你还以为她是一条强大、有支配欲的龙呢……...");
         outputText("[pg][say: 你……你……]烬低声对你咆哮道。[say: 你让我……哼！]烬放弃了反驳，在你还能说些什么之前就跑开了。不知为何，你觉得她对被提起这件事并没有那么生气；而她转身离开时，你瞥见她湿润的小穴，这更加证实了你的猜想。");
         outputText("[pg]你暗自微笑，开始重新穿上衣服，[balls]深处传来的阵痛让你皱了皱眉；烬可真是把你折腾得够呛。");
         if(get_player().cumQ() < 1000)
         {
            outputText("[pg]如果你完全恢复后，能产生比以前更多的精液，你也不会感到惊讶。");
            var _temp_1:* = get_player();
            _temp_1.cumMultiplier = _temp_1.cumMultiplier + (1 + Utils.rand(3));
         }
         else
         {
            outputText("[pg]不过，你觉得你不可能产生比现在更多的精液了……...");
         }
         outputText("[pg]恢复了体面后，你回到了营地。");
         var _loc1_:IMap = KFLAGS.flags;
         FlagDict_Impl_.arrayWriteInt(_loc1_,544,FlagDict_Impl_.arrayReadInt(_loc1_,544) + 1);
         doNext(get_camp().returnToCampUseTwoHours);
      }
      
      public function penetrateEmbrah() : void
      {
         var _loc4_:* = null as IMap;
         clearOutput();
         get_images().showImage("ember-fuck-her-in-the-vagoo-with-your-penor");
         outputText("你的目光被龙的胯部吸引，你问她是否有任何想要被抓挠的女性瘙痒。");
         if(emberAffection() <= 25)
         {
            outputText("[pg][say: 被你？哈！真好笑！] 烬一边走开一边勉强地笑着。");
            doNext(get_camp().returnToCampUseOneHour);
            return;
         }
         if(emberAffection() < 75)
         {
            outputText("[pg][say: 我可能……关你什么事？] 她转过身去，似乎要给你冷落——但继续期待地看着你。你优雅地提出，如果烬有心情寻求一点肉体上的解脱，你可以提供帮助。她移开视线，摇了摇头。[say: 不-不……这种事……！] 看来她鳞片盔甲上的裂缝还没有那么大，即使……好吧，即使它真的那么大，并且流着口水。当然，这是比喻。");
         }
         else
         {
            outputText("[pg]你可以看到烬的" + (littleEmber() ? "小穴" : "阴道") + "湿润了");
            if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,525) == 3)
            {
               if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,531) == 0 || FlagDict_Impl_.arrayReadInt(KFLAGS.flags,534) == 1)
               {
                  outputText("并且她的肉棒从保护性的缝隙中探出头来");
               }
               else
               {
                  outputText("并且她的肉棒开始变硬");
               }
            }
            outputText("充满期待。[say: 是的……也许……你为什么问？]");
         }
         if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,544) == 0)
         {
            outputText("[pg]烬的尾巴滑入她的手中，她紧张地扭动着它。[say: 我不能……我的意思是，我从来没有……而你……] 烬似乎不知所措；难道她一直保持着处女之身？");
            outputText("[pg]从她的反应来看，很明显你猜对了。[say: 是-是又怎样！？] 你叹了口气。如果是这样的话，有些紧张是意料之中的，但烬的脾气只会让事情变得更困难……看着她，从她下半身的反应来看，很明显她想要这个。");
            outputText("[pg]你握住" + (littleEmber() ? "小女孩" : "烬") + "的手，向她保证你会很温柔；她没有什么好害怕的。当然，一开始可能会有点痛，但开始之后就会很棒。烬深深地看着你的眼睛。[say: 你保证？] 你再次向她保证。[say: 那-那好吧……我想我可以把我的……初夜给你。]");
            outputText("[pg]可悲的是，没过多久，她那疯狂的脾气就占了上风。[say: 但-但我这样做不是因为你很特别……或者很性感……我也从来没有梦想过这个！一次也没有！] 当烬继续说下去时，你翻了个白眼。");
            if(get_player().cor > 75)
            {
               outputText("就好像像她这样的婊子除了最字面意义上的处女之外，还能算得上是处女一样。");
            }
            outputText("[pg][say: 我希望你能明白你所获得的荣誉。能夺走我的初夜……你很幸运，我正好有心情的时候你就在附近。]烬的这一面");
            if(get_player().cor <= 75)
            {
               outputText("很可爱……但也非常麻烦");
            }
            else
            {
               outputText("烦死人了");
            }
            outputText("。你想知道是否应该逗逗她；从她那冗长的独白中可以明显看出，和你做这种事的念头在她脑海中闪过不止一次……但既然这是她的第一次，你觉得还是放过她吧。你告诉她你明白了，并且感到很荣幸，然后耐心等待她的下一步行动。");
         }
         outputText("[pg]烬挠了挠后颈，似乎在思考，尽管你很确定她已经做出了决定。[say: 那好吧……我想你也只能凑合了……]");
         outputText("[pg]你对她微笑，等待她主动出击。[say: 好吧，那我们别再浪费时间了！]烬抓住你的手，拉着你离开。");
         outputText("[pg]当你到达目的地时，你发现自己身处一个小空地；附近似乎没有任何生物，你唯一能听到的声音是附近溪流微弱的潺潺水声。烬转向你，迅速打量了你一番。[say: 拜托，你怎么还穿着衣服！？我还以为你想做爱呢；别让我等了！]烬不耐烦地要求道。");
         outputText("[pg]你");
         if(get_player().cor < 50)
         {
            outputText("急忙为这位不耐烦的龙女脱下衣服，迅速脱掉");
         }
         else
         {
            outputText("慵懒地脱下衣服，确保在脱下");
         }
         outputText("你的[armor]时夸大每一个动作，直到你赤身裸体地站在她面前，让她看看你在阳具方面能提供什么乐趣。");
         if(get_player().cockThatFits(emberVaginalCapacity()) == -1)
         {
            outputText("[pg]烬看着你的[cocks]，然后摸了摸自己的小穴，陷入了沉思。最后，她恼怒地咆哮起来。[saystart]");
            if(get_player().cockTotal() == 1)
            {
               outputText("它不");
            }
            else
            {
               outputText("它们都不");
            }
            outputText("合适！[sayend]");
            outputText("[pg]你问她是否确定它太大了。难道你不应该至少试一试吗？");
            outputText("[pg][saystart]我比任何人都了解我的身体……如果你把");
            if(get_player().cockTotal() == 1)
            {
               outputText("那个……那个……怪物塞进" + (littleEmber() ? "任何小女孩" : "我") + "的身体里，");
            }
            else
            {
               outputText((littleEmber() ? "其中一个" : "任何一个") + "那些……那些……怪物塞进" + (littleEmber() ? "任何小女孩" : "我") + "的身体里，");
            }
            outputText((littleEmber() ? "她会被劈成两半的" : "你会把我撕裂的") + "！[sayend] 烬说完，沮丧地呼出一口烟……很明显，她和你一样渴望这件事。");
            outputText("[saystart]想办法缩小");
            if(get_player().cockTotal() == 1)
            {
               outputText("那个");
            }
            else
            {
               outputText("那些");
            }
            outputText("然后再回来！[sayend]烬转过身走开了，情绪比平时更暴躁。");
            doNext(get_camp().returnToCampUseOneHour);
            return;
         }
         var _loc1_:int = get_player().cockThatFits(emberVaginalCapacity());
         if(_loc1_ < 0)
         {
            _loc1_ = get_player().smallestCockIndex();
         }
         if(get_player().hasCockThatFits(emberVaginalCapacity()) && get_player().cockThatFits2(emberVaginalCapacity()) >= 0)
         {
            outputText("[pg][say: 你的选择还挺多，但我只需要一根……就这根！]烬说着，把你的" + get_player().cockDescript(_loc1_) + "握在手里，把它撸到完全勃起。");
         }
         if(get_player().cocks[_loc1_].get_cockType() == CockTypesEnum.DRAGON)
         {
            outputText("[pg][say: 你的这根东西真不错……我想这应该足够让我高潮了，]烬一边欣赏着你的肉棒一边说道。");
            outputText("[pg]你忍不住笑了，注意到烬似乎总是最喜欢那根。也许是因为熟悉吧。");
            outputText("[pg][say: 其实你用哪根我都……不等等，我的意思是……当然了！龙喜欢龙的肉棒是理所当然的！]烬回答道。");
         }
         else
         {
            outputText("[pg]烬用" + (littleEmber() ? "她那双小手" : "她的手") + "握住你的" + get_player().cockDescript(_loc1_) + "，开始温柔地抚摸，直到你完全勃起。[say: 我希望你知道怎么用这玩意儿，]烬说道。");
            outputText("[pg]你向她保证你完全知道自己在做什么。");
         }
         outputText("[pg]你决定最好先让这条龙自己做好心理准备，于是你耐心地等待着；看起来她很快就会采取行动了。烬的手在你的" + get_player().cockDescript(_loc1_) + "上游走，你觉得你几乎能听到她胸腔里发出微弱的呼噜声。慢慢地，她的一只手伸下去按摩她" + (littleEmber() ? "肿胀的肉阜" : "湿润的阴唇") + "。烬在恍惚中继续为你们俩自慰，舒服地喘息着，直到她突然从恍惚中清醒过来。");
         outputText("[pg][say: 够了！你以为你在干什么？沉迷于前戏……你是来和我做爱的，对吧！？所以，躺下给我准备好！]烬要求道。你");
         outputText("微笑着，以一种浮夸的优雅轻轻躺下，张开四肢，明确表示你已经准备好迎接她的任何想法。");
         outputText("[pg]烬跨坐在你身上时，忍不住舔了舔[Ember eir]嘴唇，将你的" + get_player().cockDescript(_loc1_) + "对准她滴水的花穴；最后，伴随着一声叹息，她借助重力让你勃起的肉棒进入她诱人的深处。当她的肉壁紧紧包裹住你的肉棒时，你咬紧牙关，里面紧实的肌肉饥渴地吞没你的长度，并开始本能地在周围起伏涌动，开始榨取你。你自己的本能也促使你挺动腰身，努力将自己更深地埋入烬渴望的深处。");
         if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,544) == 0)
         {
            outputText("[pg]" + (littleEmber() ? "这个小女孩" : "烬") + "痛苦地嘶嘶作响，因为你撕裂了她的处女膜；你暗骂自己的粗心，停下来开始后退。烬张开[Ember eir]嘴，似乎想抗议，但令你惊讶的是，她发出的只有愉悦的呻吟。你吓了一跳，立刻改变方向，重新插回她的深处；烬再次发出嘶嘶声，但这次是因为快乐而不是痛苦。你很快意识到烬已经做好了充分的准备，于是你继续在她体内抽插，沉浸在这场性爱中。");
         }
         outputText("[pg]当你将自己完全没入她体内时，烬喘息着呻吟起来。[say: 喂——喂！应该是我来主导的！]这条龙抗议道，尽管她很享受你的主动。");
         outputText("[pg]你一时沉浸在抽插中无法回答，但还是勉强找回了一丝理智告诉她，如果她想占据主导，她就需要表现得像个主导者。然后你继续将臀部向上挺入她的身体，每一次有力而急切的抽插都将你的" + get_player().cockDescript(_loc1_) + "吞吐着。");
         outputText("[pg]烬低吼一声，按住你的肩膀把你压在身下，然后开始上下摆动她的臀部");
         if(emberHasCock())
         {
            outputText("；她的");
            if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,531) == 0 || FlagDict_Impl_.arrayReadInt(KFLAGS.flags,534) > 0)
            {
               outputText("龙的");
            }
            else
            {
               outputText("人形的");
            }
            outputText("肉棒随着你的每一次抽插湿漉漉地拍打在你的肚子上，充血的器官来回晃动，把前列腺液抹在你的身上");
         }
         outputText("。");
         outputText("[pg]她随着每一次插入呻吟，随着每一次抽出满足地呼噜，明显因为你给她那被性欲占据的大脑带来的快感而喘息着。[say: 就、就在那。现在是我说了算，所以你必须听我的，]烬宣告道，然后俯下身亲吻你的嘴唇。你在她嘴里发出低沉的呻吟并回吻她；你无法移动双手去拥抱或抚摸她，所以你只能饥渴地将身体贴着她摩擦，用你的胸膛蹭着她" + (littleEmber() ? "平坦的" : "柔软的") + "乳房，来回扭动，同时继续在她的" + (littleEmber() ? "小" : "贪婪的") + "龙穴里抽插。");
         outputText("[pg][say: 停、停止抽插！如果你继续这样，我——啊！]烬喘息着，因为一次特别用力的挺进正好摩擦到了她的敏感点，回报你的是一股突然涌出的淫液，这只会让你加快速度");
         if(emberHasCock())
         {
            outputText("；她自己勃起的肉棒也喷出了一小股前列腺液");
         }
         outputText("。");
         var _loc2_:Boolean = littleEmber() && get_silly();
         var _loc3_:String = littleEmber() ? "小女孩" : "龙";
         outputText("[pg]你能感觉到她的" + (_loc2_ ? "萝莉穴" : "内壁") + "挤压并按摩着你发烫的肉棒，它们凉爽湿润的表面与你热血沸腾的器官形成了美妙的对比。你感觉自己就像一只没有理智的野兽；只有即将到来的释放才是重要的，驱使你挺动、挣扎、扭动，一次又一次地将自己刺入坐在你身上的" + _loc3_ + "体内。快到了……...");
         outputText("[pg]被快感淹没的烬坐在你身上停止了动作，瘫软下来，因为用力过度而喘息着，[say: 胯、胯部动不了了……]");
         if(get_player().cor >= 80)
         {
            outputText("[pg]吵闹、虚弱，现在还无助……你怀疑自己是不是应该养只小猫而不是一条龙，至少能图个清静。");
         }
         else
         {
            outputText("[pg]你无法接受——你<b>绝不</b>接受！!");
         }
         outputText("伴随着一阵被欲望点燃的力量，你向前猛挺，把毫无防备的烬撞倒。你把她翻过来，让你在上面，分开她的双腿，随意地搭在你的臀部，然后以越来越大的力量继续抽插。就像一只饥渴的野兽，你抽插、交配，为了追求那萦绕在你心头、诱人且即将到来的释放，把现在无助的" + (littleEmber() ? "孩子" : "龙") + "操得红肿。");
         outputText("[pg][say: 啊！别停！操、操我！深一点！用、用力！]烬恳求道，不在乎你似乎占据了主导。你急切地服从了，用尽全力操她——但你的高潮来了，伴随着一声大喊，你将自己释放在她等待的深处。当你填满她时，烬发出了愉悦的尖叫。");
         if(get_player().cumQ() < 250)
         {
            outputText("[pg]她跳动的小穴把你榨干了，似乎像一张口渴的嘴用吸管吸饮料一样把精液从你体内吸出来。");
         }
         else if(get_player().cumQ() < 1000)
         {
            outputText("[pg]她的阴道壁配合着你强有力的跳动，把你的精液带入她" + (littleEmber() ? "未成熟的" : "") + "子宫深处，填满她，直到你被榨干，她挺起了一个小小的孕肚。");
         }
         else
         {
            outputText("[pg]尽管她的收缩有助于把你肉棒里所有充满活力的精子都挤出来，但你真的觉得没有必要。你强有力的精液喷射几乎瞬间填满了她，迫使浓稠的精液直接穿过她的子宫颈进入她等待的子宫，把她填得满满当当，甚至溢出。当你结束时，倒流的精液从她被撑开的小穴喷出，溅到你的胯部，给她留下了一个相当大的肚子。");
         }
         outputText("[pg]你满足地在喉咙深处发出低沉的呻吟。你双手抓住龙的腿，把自己从她体内拔出来，让你的精液");
         if(get_player().cumQ() < 250)
         {
            outputText("滴落");
         }
         else if(get_player().cumQ() < 1000)
         {
            outputText("流出");
         }
         else
         {
            outputText("涌出");
         }
         outputText("从她被使用过的小穴里流出，你坐在地上，而烬则瘫软在地上喘息。仍然沉浸在刚才高潮的余韵中，你隐约意识到烬自己似乎还没有高潮；从她小穴里滴落的液体只有你的");
         if(emberHasCock())
         {
            outputText("，而她的肉棒虽然充血肿胀，但还没有喷射出来");
         }
         outputText("。");
         outputText("[pg]你半睁着眼睛迎上烬的目光。她慢慢地翻过身，四肢着地，翘起尾巴，让你能完美地看到她那沾满精液、滴着淫水、刚被狠狠使用过的小穴。[say: 哈……哈哈……你就这点本事？连让我……高潮……都做不到……]烬嘲弄着你，诱惑地左右摇晃着臀部。");
         if(get_player().cor >= 66)
         {
            outputText("[pg][say: 你也没能让我高潮，]你双臂交叉说道。[say: 刚才可是你在主导，所以失败全怪你……幸运的是，我的体力足够撑到最后，尽管你中途就变得毫无用处了。]你捡起装备，把这条龙抛在脑后；她在你身后气喘吁吁地骂着，但你只是漫不经心地挥了挥手作为回应。");
            get_player().orgasm("Dick");
            dynStats(DynStat.Sens(-2));
            emberAffection(-5);
            doNext(get_camp().returnToCampUseOneHour);
            _loc4_ = KFLAGS.flags;
            FlagDict_Impl_.arrayWriteInt(_loc4_,544,FlagDict_Impl_.arrayReadInt(_loc4_,544) + 1);
            return;
         }
         outputText("[pg]她说的有道理……而且，你无法抗拒眼前的绝佳机会，这幅景象让你的下半身重新燃起了一阵短暂的冲动。你扑向受惊的母龙，把她的尾巴拉开，粗暴地抓住她" + (littleEmber() ? "平坦的胸部" : "丰满的双峰") + "，然后再次挺身插入她那被精液润滑的小穴。你开始缓慢而刻意地抽插，随意地将她的尾巴搭在你的肩膀上，尽力俯身压在她身上，用后入式狠狠地干她。");
         outputText("[pg]你突然的插入将烬推向了顶峰，她发出一声咆哮；她湿润的龙淫液洒满了你的胯部，与你刚才留下的果实混合在一起");
         if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,525) == 3)
         {
            outputText("；她的肉棒跳动着，将精液倾泻在下方的地面上，标记着你们做爱的地方");
         }
         outputText("。她" + (littleEmber() ? "小巧的" : "") + "肉穴像老虎钳一样紧紧夹住你，巨大的压力让你难以动弹，尽管她的小穴已经被你们混合的体液充分润滑了。");
         outputText("[pg]你无法动弹，只能尽可能深地顶入她的体内，而她颤抖的肉洞也非常乐意接受这额外的几英寸，将你的肉棒吸入深处并紧紧咬住，她的肌肉以你从未想过的方式按摩着你。烬回头看着你，眼神中充满了深沉的快感和情欲，努力让你迎来第二次高潮。你呻吟喘息着，发现自己再次在她的深处释放，榨干了你甚至不知道自己还拥有的储备。");
         if(get_player().cumQ() < 250)
         {
            outputText("[pg]你更加卖力地把最后的精液射过她的子宫颈，灌满她的子宫，直到她的肚子微微隆起才停下来。");
         }
         else if(get_player().cumQ() < 1000)
         {
            outputText("[pg]你射入她子宫的精液让她膨胀起来，直到她挺起了一个看起来像怀孕了的肚子；有了你刚刚给她的所有精液，她简直就像真的怀孕了一样。");
         }
         else
         {
            outputText("[pg]等到你操劳过度的");
            if(get_player().balls == 0)
            {
               outputText("肉棒");
            }
            else
            {
               outputText("[balls]都");
            }
            outputText("完事时，烬看起来不仅像怀孕了几个月；她的肚子看起来绝对巨大，就像羊水随时会破一样！!");
         }
         outputText("[pg]你气喘吁吁地瘫倒在烬的背上，你的力量和你的肉棒一样被榨干了。你问她是否满意。");
         outputText("[pg][say: 是的……我们再来一次……]她疲惫地回答，然后瘫倒下去小睡了一会儿。你自己也心满意足，叹息呻吟着趴在她身上，调整姿势让自己更舒服，和" + (littleEmber() ? "你的小龙" : "她") + "一起入睡。");
         get_player().orgasm("Dick");
         dynStats(DynStat.Lib(0.5),DynStat.Sens(-2));
         doNext(penetrateEmbrahPartII);
      }
      
      public function penetrateEmberHerm() : void
      {
         clearOutput();
         outputText("你决定还是再用她一次，所以你再次用手指抠弄她的阴部。[say:哦……来吧，我属于你，我的伴侣，]她说着，微微张开双腿，让你更容易进入。你滑到她入口处调整好姿势，然后停在那里，准备开始。");
         penetrateWithEmber(false);
      }
      
      public function onAscend(param1:Boolean) : void
      {
         reset();
      }
      
      public function noStayingForCuddlesPostLustFuck() : void
      {
         clearOutput();
         outputText("你告诉烬你不能留下，你现在必须走了。" + emberMF("他","她") + "看起来有点失望，但还是强迫自己挤出一个微笑。[say: 我明白，你还有其他事情要做……只要知道我会一直在这里等你，无论好坏。] 你");
         if(get_player().cor < 50)
         {
            outputText("感谢她的理解");
         }
         else
         {
            outputText("咕哝着表示同意");
         }
         outputText("，然后收拾好你的东西，去清洗身体。");
         doNext(get_camp().returnToCampUseOneHour);
      }
      
      public function noMoDagronBlud() : void
      {
         clearOutput();
         if(emberAffection() < 75)
         {
            outputText("你决定暂时停止并抽身离开。烬自己舔了舔[Ember eir]的伤口，你感谢[Ember em]的分享。");
            outputText("[pg][say: 别、别客气……]");
         }
         else
         {
            outputText("你决定暂时停止并抽身离开。烬舔了舔[Ember eir]的嘴唇，将[Ember eir]的舌头收回[Ember eir]的嘴里，并发出愉悦的呼噜声。不过，当[Ember ey]意识到[Ember ey]在做什么时，[Ember ey]清醒了过来。[say: 别、别有什么奇怪的想法……]");
            outputText("[pg]你温柔地问[Ember ey]说的[say: 奇怪的想法]是什么意思。");
            outputText("[pg][say: 就是你现在想的那些！]烬脱口而出，然后转过身，留你一个人。你看着[Ember em]离去，露出了微笑。");
         }
         doNext(get_camp().returnToCampUseOneHour);
      }
      
      public function minotaurJizzFreakout() : void
      {
         outputText("[pg]你试图和烬聊天，但你很难集中注意力；你满脑子想的都是那美味的、灼烧灵魂的、热气腾腾的、咸咸的牛头人精液，直接从牛头人的阴茎里射出来的。不可避免地，烬问你怎么了，你流着口水，向她描绘了这幅画面。");
         outputText("[pg]烬突然仰起头，发出一声可怕的狂怒咆哮，震得脚下的岩石都嘎嘎作响。[say: 我要杀了他们！我要砸碎他们的脑袋——我要撕下他们那臭气熏天的毛皮！我要吃他们的肉，用他们的角剔牙！没有人会这样毒害你——没有人！]");
         outputText("[pg]还没等你做出任何反应，这头暴怒的龙就展开了[Ember eir]翅膀。[say: 等我回来，我会仔细盯着你，看你能不能克服这种……瘾。] " + emberMF("他","她") + "飞走了，朝着山脉的方向飞去。你以前从未见过[Ember em]这么生气……...");
         if(followerKiha())
         {
            outputText("[pg]奇哈慢悠悠地走过来，得意地笑了笑。[say: 我还以为我的脾气已经够大了。]");
         }
         FlagDict_Impl_.arrayWriteInt(KFLAGS.flags,542,1);
         outputText("[pg]");
      }
      
      public function meetEmberAftermath() : void
      {
         clearOutput();
         outputText("你只能站在那里，盯着这个奇怪的生物，据说是一条龙，感觉过了好几个小时。");
         outputText("[pg]它是第一个打破沉默的，皱着眉头看着你。[say: 你是谁？我在哪里？]它咆哮着问道。");
         if(littleEmber())
         {
            outputText("当咆哮声来自这样一个孩子般的身体时，任何威慑感都被破坏了。");
         }
         outputText("[pg]奇怪的是，它会说你的语言……不妨认为僵局已经被打破了。你介绍了自己，告诉这个生物是你帮它从蛋里孵出来的。");
         outputText("[pg]它稍微放松了一点。[say: 蛋？哦，对。那个。既然你说你帮了我，我想我应该自我介绍一下……] 你耐心地等待着，但这生物只是盯着地面，显然在努力回忆自己的名字。[say: 最后的希望之烬，我的脑海里是这么告诉我的。我想你们这种生物，和其他人一样，很难记住超过一个词的名字，所以我允许你叫我“烬”。如你所见，我是……] 它停顿了一下，以一种" + (littleEmber() ? "可爱" : "炫耀") + "的姿态张开双臂和翅膀。[say: ……最后一条伟大的龙！] 它朝你挥了挥手，开始走开。[say: 现在，让我看看我将把什么样的地方称为我自己的领地……]");
         outputText("[pg]你看着这只刚孵化出来的龙，它把鼻子探进每一个吸引它注意力的东西里。当它开始在开裂的地面上挖一个小土包时，你轻轻叹了口气。看来是个难伺候的主。不过，它似乎不像你迄今为止遇到的其他奇怪的当地人那样是个色情狂怪物。也许你们两个可以互相帮助？");
         outputText("[pg]<b>(烬已加入追随者菜单！神秘蛋任务现已完成。)</b>");
         FlagDict_Impl_.arrayWriteInt(KFLAGS.flags,524,1);
         get_player().removeKeyItem("Dragon Egg");
         doNext(get_camp().returnToCampUseOneHour);
      }
      
      public function masturbateOntoAnEgg() : void
      {
         clearOutput();
         if(get_player().get_gender() == 0)
         {
            outputText("当你脱下衣服露出光溜溜的胯部时，光芒闪烁的速度变慢了，这让你在鼓起变态的勇气走到这一步后感到失望。你觉得你好像不知怎么地让它失望了……这太令人困惑了！你决定先离开，改天再来对付这个善变的蛋。");
            doNext(get_camp().returnToCampUseOneHour);
            return;
         }
         if(get_player().get_gender() == 1)
         {
            outputText("蛋的光芒快速闪烁着，在你急忙脱下[armor]时，在你的身上投下奇怪的光影，你已经沉沦得太深，无法意识到这有多荒谬。你的心因兴奋、欲望和期待而跳得飞快……当你注意到的时候，它实际上与蛋闪烁的节奏相吻合。");
            outputText("[pg]你用手握住你的[cock]，站在蛋前，");
            if(get_player().cockTotal() <= 2)
            {
               outputText("用力地套弄着。");
            }
            else
            {
               outputText("把你所有的肉棒笨拙地拢成一束，尽你所能地疯狂套弄和挤压");
            }
            outputText("。蛋的脉动诱惑着你，哄骗着你尽你所能地挤压、拉扯、抽插和按摩[eachcock]。你越来越用力，越来越快，感觉到内心深处翻江倒海的酸痛。最后，伴随着一声释放的叫喊，你释放出一");
            if(get_player().cumQ() < 100)
            {
               outputText("滴");
            }
            else if(get_player().cumQ() <= 500)
            {
               outputText("股");
            }
            else if(get_player().cumQ() <= 1000)
            {
               outputText("团");
            }
            else
            {
               outputText("波");
            }
            outputText("精液在蛋上。");
            outputText("[pg]你喘着粗气，盯着你释放出来的东西。在你的眼前，随着你的体液渗入蛋壳，脉动变得难以置信地迅速。然后，当每一滴都被喝干时，光芒恢复了正常的节奏。");
            if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,525) == 0)
            {
               outputText("[pg]蛋壳的颜色变了，从白色变成了柔和的粉红色。");
               FlagDict_Impl_.arrayWriteInt(KFLAGS.flags,525,2);
            }
            outputText("[pg]你惊奇地看着蛋的表面，检查是否有精液的痕迹；当你触摸蛋壳时，你感觉到一种奇怪的感觉从蛋里散发出来；一种满足和充实的感觉。无论那颗蛋里存在着什么样的生命力，可能都因为你的……贡献而得到了加强。你忍不住想知道里面的生物是什么。");
         }
         else if(get_player().get_gender() == 2)
         {
            outputText("蛋的光芒快速闪烁着，在你急忙脱下[armor]时，在你的身上投下奇怪的光影，你已经沉沦得太深，无法意识到这有多荒谬。你的心因兴奋、欲望和期待而跳得飞快……当你注意到的时候，它实际上与蛋闪烁的节奏相吻合。");
            outputText("[pg]你不假思索地走向那颗蛋；你的[vagina]渴望被使用。你用双臂环抱住它，蹲下身子，开始用你的胯部摩擦它温暖、坚硬的表面。这种质感与你以前用过的任何东西都不同，随着你的爱液开始流淌，润滑了蛋壳，你舒服地呻吟起来。你更用力地压在它上面，在坚硬的表面上摩擦，上下起伏，越来越快。蛋壳摩擦你饥渴的阴唇的感觉只会让你充满兴奋；这就像你以前从未用过的玩具。你短暂地想，这可能是因为它根本不是玩具，但随着你下一次的抽插，这个想法就烟消云散了。你越来越用力、越来越快地挺动和扭动，尖叫着你的兴奋和喜悦，直到最后，你的[vagina]痉挛，一");
            if(get_player().wetness() <= 3)
            {
               outputText("几滴");
            }
            else if(get_player().wetness() < 5)
            {
               outputText("股");
            }
            else
            {
               outputText("洪流般的");
            }
            outputText("淫水从你的小穴喷射到蛋上。");
            outputText("[pg]你松开它的表面，因为用力而喘着粗气，你后退了一步，双腿发软了一会儿。你盯着你释放出来的东西。在你的眼前，随着你的体液渗入蛋壳，脉动变得难以置信地迅速。然后，当每一滴都被喝干时，光芒恢复了正常的节奏。");
            if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,525) == 0)
            {
               FlagDict_Impl_.arrayWriteInt(KFLAGS.flags,525,1);
               outputText("[pg]你好奇地盯着蛋壳的颜色变化，从白色变成了淡蓝色。");
            }
            outputText("[pg]你惊奇地看着蛋的表面，检查是否有精液的痕迹；当你触摸蛋壳时，你感觉到一种奇怪的感觉从蛋里散发出来；一种满足和充实的感觉。无论那颗蛋里存在着什么样的生命力，可能都因为你的……贡献而得到了加强。你忍不住想知道里面的生物是什么。");
         }
         else
         {
            outputText("蛋的光芒快速闪烁着，在你急忙脱下[armor]时，在你的身上投下奇怪的光影，你已经沉沦得太深，无法意识到这有多荒谬。你的心因兴奋、欲望和期待而跳得飞快……当你注意到的时候，它实际上与蛋闪烁的节奏相吻合。");
            outputText("[pg]被[cocks]和[vagina]的双重渴望折磨着，你笨拙地跨坐在蛋的顶部，一边用下体摩擦着蛋壳，一边抚摸着[eachCock]。这是一个尴尬而又断断续续的动作，你努力保持平衡以免摔倒……但随之而来的快感弥补了这一切。你的[vagina]在坚硬的蛋壳上滑动摩擦，同时你的手拉扯着");
            if(get_player().cockTotal() == 1)
            {
               outputText("你的[cock]");
            }
            else
            {
               outputText("尽可能多地抓住你的肉棒，同时努力不让自己掉下来");
            }
            outputText("。终于，你无法抑制地高潮了，精液喷洒在空中，然后溅落在蛋上，与你下体流出的少女淫液混合在一起，浸透了蛋壳表面，让它沾满了你混合的体液。");
            outputText("[pg]难怪你最终失去了平衡滑落下来，重重地摔在背上。你躺在那里，大口喘着气，直到你看到蛋发生的变化，才刚开始恢复正常的呼吸。在你的眼前，随着你的体液渗入蛋壳，蛋的脉动变得异常迅速。然后，当每一滴体液都被吸收殆尽时，光芒又恢复了正常的节奏。");
            if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,525) == 0)
            {
               FlagDict_Impl_.arrayWriteInt(KFLAGS.flags,525,3);
               outputText("[pg]你盯着蛋壳的颜色发生变化，从白色变成了淡紫色。");
            }
            outputText("[pg]你惊奇地看着蛋的表面，检查是否有精液的痕迹；当你触摸蛋壳时，你感觉到一种奇怪的感觉从蛋里散发出来；一种满足和充实的感觉。无论那颗蛋里存在着什么样的生命力，可能都因为你的……贡献而得到了加强。你忍不住想知道里面的生物是什么。");
         }
         if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,532) < 5)
         {
            outputText("[pg]你注意到蛋散发出的满足感比以前更强烈了，但似乎还不够。也许你再喂它一点，它就会孵化？");
         }
         get_player().orgasm("Generic");
         dynStats(DynStat.Sens(-1));
         FlagDict_Impl_.arrayWriteInt(KFLAGS.flags,539,1);
         var _loc1_:IMap = KFLAGS.flags;
         FlagDict_Impl_.arrayWriteInt(_loc1_,532,FlagDict_Impl_.arrayReadInt(_loc1_,532) + 1);
         doNext(get_camp().returnToCampUseOneHour);
      }
      
      public function manEmberBitchesAboutPCPregnancy() : void
      {
         clearOutput();
         FlagDict_Impl_.arrayWriteInt(KFLAGS.flags,558,1);
         if(emberAffection() <= 25)
         {
            outputText("你们俩漫无目的地聊着。话题轻松、空洞且毫无意义。然而，当你们结束谈话时，你意识到了一件奇怪的事；在整个谈话过程中，烬都在尽力避免看你怀孕的肚子——就好像[Ember ey]对此感到心烦意乱？");
         }
         else if(emberAffection() < 75)
         {
            outputText("烬冷冷地盯着你怀孕的腹部，你一次又一次的破冰尝试都失败了。你问怎么了。[say: 没事。什么事都没有，] 烬平淡地说道。");
         }
         else
         {
            outputText("烬冷冷地看着你。[say: 这是什么意思！？][Ember ey]指着你鼓胀的肚子说道。[say: 你应该帮<b>我</b>繁衍更多的龙；而不是" + (littleEmber() ? "和其他人" : "和垃圾鬼混") + "！]烬愤愤不平地喷出一口烟，转身走开了。");
         }
      }
      
      public function loseToEmberSpar() : void
      {
         clearOutput();
         if(emberAffection() <= 25)
         {
            outputText("你气喘吁吁地放下战斗姿态，坐在地上，举起一只手表示你受够了。");
            outputText("[pg][say: 哈！就像我说的，你最后还是把自己弄伤了。]");
            outputText("[pg]是的，你这次可能输了，但你暗自发誓以后一定要赢。");
            outputText("[pg][say: 我等着。]烬转过身，走回[Ember eir]的巢穴。你决定也回去休息一会儿。");
            emberAffection(-10);
         }
         else if(emberAffection() < 75)
         {
            outputText("你气喘吁吁地放下战斗姿态，坐在地上，举起一只手表示你受够了。");
            outputText("[pg][say: 我警告过你。我可是全力以赴地和你打，所以你输了也不奇怪！]烬骄傲地吹嘘着，向你伸出援手。");
            outputText("[pg]你承认失败，但挑衅地笑了笑，保证下次会有所不同。");
            outputText("[pg]烬对你笑了笑。[say: 哈！好吧，我会让你好好训练的，这样你下次就能兑现你的承诺了！]这只龙转过身，因为[Ember eir]的胜利而兴高采烈地走开了。");
            emberAffection(-5);
         }
         else
         {
            outputText("你气喘吁吁地放下战斗姿态，坐在地上，举起一只手表示你受够了。");
            outputText("[pg]烬急忙伸出援手，[Ember eir]脸上写满了关切。[say: 你还好吗？也许我应该手下留情一点……]");
            outputText("[pg]你猛烈地摇头；你需要变强，败在朋友手里总比败在那些被欲望冲昏头脑的恶魔怪物手里要好得多。");
            outputText("[pg]烬叹了口气。[say: 那好吧……只要你想，我随时准备接受重赛。现在我们带你回去吧。]烬将你抱起" + (littleEmber() ? "，尽管她身体娇小，却显得很轻松" : "") + "，和你一起走回营地。");
            emberAffection(-5);
         }
         get_combat().cleanupAfterCombat(get_camp().returnToCampUseOneHour,false);
         get_player().HPChange(get_player().maxHP() * 0.33,false);
      }
      
      public function load(param1:int, param2:*) : void
      {
         Utils.extend(saveContent,param2);
      }
      
      public function littleEmber() : Boolean
      {
         if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,2779) == 1)
         {
            return get_allowChild();
         }
         return false;
      }
      
      public function leaveWithoutUsingAnEmberItem() : void
      {
         clearOutput();
         outputText("你摇了摇头；最好还是不要乱动它。你把东西放回口袋，不去管那颗蛋。当你把东西收起来时，蛋的光芒急剧减弱，几乎就像是它感到了……失望？");
         doNext(playerMenu);
      }
      
      public function leaveEmbersAssOutToDry() : void
      {
         clearOutput();
         outputText("你现在无法决定该怎么做，所以你把蛋留在原地，回到了你的营地。");
         doNext(get_camp().returnToCampUseOneHour);
      }
      
      public function highAffectionEmberLustFuck() : void
      {
         clearOutput();
         var _loc1_:int = get_player().cockThatFits(emberVaginalCapacity());
         if(_loc1_ < 0)
         {
            _loc1_ = get_player().smallestCockIndex();
         }
         outputText("你脱下你的[armor]，看着烬打量你赤裸的身体。你可以看到" + emberMF("他的","她的"));
         if(emberHasCock())
         {
            outputText("龙根");
            if(emberInternalDick())
            {
               outputText("从[Ember eir]保护性的缝隙中探出");
            }
            else
            {
               outputText("勃起");
            }
         }
         if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,525) == 3)
         {
            outputText("并且");
         }
         if(emberHasVagina())
         {
            outputText("她的小穴因为兴奋而开始滴水");
         }
         outputText("。");
         outputText("[pg][saystart]嗯……这风景真不错；看看你……多么迷人的" + get_player().mf("男人","女孩") + "，有着如此");
         if(get_player().cockTotal() == 1)
         {
            outputText("美妙的[cock]");
         }
         else
         {
            outputText("美妙的肉棒");
         }
         outputText("……而你现在全都是我的，[sayend] [Ember ey]赞赏地轻哼着，对你抛了个下流的媚眼，并舔了舔嘴唇。[say: 不过，虽然我很享受这风景，但别让" + emberMF("男人","女孩") + "一直悬着心；你有什么计划？] [Ember ey]问道，尾巴有趣地左右甩动着。");
         outputText("[pg]你告诉[Ember em]，你想给你的龙伴侣来一次真正的操弄。也许你们两个可以用[Ember ey]从图书馆拿来的那本书。");
         outputText("[pg]" + emberMF("他","她") + "盯着你，显然惊呆了。如果龙会脸红的话，" + emberMF("他","她") + "肯定已经脸红了，但" + emberGroinDesc("[Ember eir]肉棒的硬度","她小穴的湿润") + "，加上[Ember eir]整体的肢体语言，很清楚地表明[Ember ey]喜欢你所说的。在脚跟上转了个圈，[Ember ey]走开了，摇晃着[Ember eirs]那" + (littleEmber() ? (get_silly() ? emberMF("正太","萝莉") : "小小的") : "") + "屁股，让你欣赏。在不跑动的情况下，[Ember ey]尽可能快地拿着那本书回来，并把它举起来。[say: 那么……你心里有什么姿势？] [Ember ey]颤音说道，急切地想听听你的想法。");
         if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,824) == 0)
         {
            outputText("[pg]你微笑着接过递来的书，翻了几页，把最喜欢的几页指给烬看。");
            outputText("[pg][say: 再具体一点，拜托，我的伴侣；我看得出你喜欢那些，但你还没告诉我我们要用哪一个，] [Ember ey]说着，对你的傻气调皮地翻了个白眼。");
            outputText("[say: 全都要，] 你声明道。");
            outputText("[pg]你迎来了难以置信的目光。最终，烬设法合上了[Ember eir]掉到地上的下巴。[say: 全、全都要！？] [Ember ey]脱口而出。你只是点了点头。");
            outputText("[pg][say: 好吧，我完全赞成，但你<b>确定</b>你有能力一个接一个地完成所有这些吗，嗯？] 烬说着，好脾气地翻了个白眼。");
            if(get_player().lib >= 50 || get_player().minLust() >= 40)
            {
               outputText("[pg]你对自己的性欲很有信心，真正的问题是[Ember ey]是否有这个能力。");
            }
            else
            {
               outputText("[pg]即使你不行，体力也不会是问题。你随意地在你的小袋里翻找，拿出一瓶催情剂，展示给这条龙看。");
               get_player().consumeItem(get_consumables().L_DRAFT);
            }
         }
         else
         {
            outputText("[pg][say: 我猜有人又想试着一次性搞定所有的姿势了，嗯？] [Ember ey]笑着说，对这个前景感到非常高兴。");
            outputText("[pg]你点点头");
            if(get_player().lib < 50 && get_player().minLust() < 40)
            {
               outputText("，从你的小袋里拿出一瓶催情剂");
               get_player().consumeItem(get_consumables().L_DRAFT);
            }
            outputText("。");
         }
         var _loc2_:IMap = KFLAGS.flags;
         FlagDict_Impl_.arrayWriteInt(_loc2_,824,FlagDict_Impl_.arrayReadInt(_loc2_,824) + 1);
         outputText("[pg][say: 嘛，满足伴侣的每一个需求是龙的责任……这并不是说我不会享受这其中的每一分钟，] [Ember ey]低声说道，长长的舌头在空中滑行，做出一个淫荡的舔舐动作。" + emberMF("他","她") + "转过身，开始走向[Ember eir]的巢穴，[Ember eir]长长且灵活的尾巴尖端在你下巴下挑逗地划过，随着[Ember ey]走开并消失在洞口，慢慢地从你身上滑落。");
         outputText("[pg]你跟在[Ember eir]后面，感觉自己因为即将要做的事情变得更加坚硬。");
         outputText("[pg]烬已经让自己舒服地躺平了，[Ember eir]的翅膀在树叶中展开以保持稳定，[Ember eir]的腿在[Ember em]面前抬起，双手环抱着[Ember eir]弯曲的膝盖，把它们固定在不妨碍的地方。");
         if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,525) == 1)
         {
            outputText("[pg][say: 我……嗯……那个，你教我的姿势其实更适合处于接受位置的母龙，但既然我是个男孩，你可能得……呃……将就一下我现有的，]他羞愧地移开视线，不过很难说是因为他想说的话，还是因为他缺乏这些姿势所需的部位。他转动一只手臂，用手掰开他的屁股，让你清楚地看到他的肛门；这邀请再明显不过了。");
            outputText("[pg]你俯身在尴尬的龙旁边，把手放在他的肩膀上，然后向他保证会让他感觉很好，而且你会很温柔。");
            outputText("[pg]烬看起来尽可能地尴尬，虽然没有脸红，然后开心地笑了，用溺爱的笑容盯着你。他的舌头伸出来，深情地舔了舔你的脸颊。");
            outputText("[pg]你摆好姿势，将你的肉棒对准龙那皱缩的穴口。你试探性地挺动了几下；每次你的" + get_player().cockHead(_loc1_) + "撞击他紧致的屁股，并试图挤过他的括约肌时，龙都会喘息。如果他的目光不是那么充满欲望和期待，你可能会担心。");
            outputText("[pg][say: 求、求你了，别逗我了；继续吧。哦，我太想让你进来了……]他用舞台上的耳语对你说，他的声音因为渴望而沙哑。");
            outputText("[pg]你看着他的眼睛笑了笑，慢慢地压入他紧致的男孩小穴，用你的粗壮撑开他的臀瓣。烬呻吟着，弓起背，发出愉悦的低吼，屁股已经急切地收紧，包裹着你入侵的" + get_player().cockDescript(_loc1_) + "。再挺动几下，你感觉自己已经尽可能深地进入了他的屁股。");
            outputText("[pg][say: 哦……哦，玛莱啊，我感觉好满，被我伴侣的肉棒塞得满满的……感觉太棒了，]他呻吟着，尽管你很清楚他声音中夹杂着一丝痛苦，脸上也带着不适的表情。");
            outputText("[pg]考虑到他接下来要面对的，你希望在你结束时他不会太疼。");
         }
         else if(get_player().cockTotal() == 1)
         {
            outputText("[pg][say: 好了，我的伴侣；我希望你会觉得我的身体像我觉得你的一样令人愉悦——使用我，直到我们都尽可能地满足，]她咯咯笑着说，并对她的话做出了一个少女般的撅嘴。");
            outputText("[pg]这正是你打算做的。你用手抚摸她的屁股，用拇指轻轻地抠弄她湿润的小穴。她发出一声赞赏的嗡嗡声，轻轻地颤抖着，但保持安静和静止，用她长而光滑的尾巴拂过你的[leg]。");
            outputText("[pg]你移开拇指并展示给她看。它湿漉漉的，就像她的爱穴一样。一小滴液体从你的拇指滴落，打在她的阴蒂上，导致她下体内的湿润湖泊最终因为她的兴奋而泛滥，流得她巢穴里的草地上到处都是。");
            outputText("[pg][say: 哦哦……还在等什么，我的伴侣？我准备好了——不，我早就准备好了，我要你的肉棒插进我身体里，用精液填满我，我现在就要！]她厉声说道……然后因为自己的夸张表现而大笑起来。[say: 不过，说真的，求求你现在就给我吧？]她柔声说道。");
            outputText("[pg]你对她的反应轻笑了一声，将自己对准她的入口，然后开始将自己推入。你呻吟着，她的深处太热了……尽管她的体温通常比你略低。她一定是被彻底挑起了性欲。她狂喜地呻吟着，双腿颤抖着，因为她正在克制将双腿缠绕在你身上，将你紧紧夹在中间，迫使你将肉棒完全滑入她体内的冲动。");
            outputText("[pg]你刻意缓慢地一寸一寸滑入她的小穴，试图品味深入她体内的每一秒。直到你无法再深入时，你才停下来。");
            outputText("[pg]你的");
            if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,531) == 0)
            {
               outputText("母龙");
            }
            else
            {
               outputText("龙女");
            }
            outputText("喉间发出一声呻吟，给了你一个狂喜的眼神。[say:我爱你，[name]……天哪，我太爱你了，我很高兴终于能当面对你说这句话了，]她对你说。");
            outputText("[pg]你也很高兴终于能听到她这么说。但尽管你很感激这份感情，你还有更紧迫的事情要处理。");
         }
         else
         {
            outputText("[pg]烬的眼睛死死盯着[eachCock]，轻轻咽了口唾沫。她有些尴尬地说，[saystart]也、也许你想把");
            if(get_player().cockTotal() == 2)
            {
               outputText("两根");
            }
            else
            {
               outputText("两根");
            }
            outputText("都用上？我、我知道这不完全是这个姿势的一部分，但是……[sayend]");
            outputText("[pg]你眨了眨眼。她是在暗示你所想的那样吗？");
            outputText("[pg][say:你觉得我是在暗示我想被我伴侣那美妙的肉棒双重填满吗？]烬咯咯地笑了起来。[say:好吧，那答案是肯定的……哦，求求你了好吗？]她娇嗔着，对你眨巴着眼睛，试图诱惑你。");
            outputText("[pg]看着这条龙试图向你投来恳求的目光，感觉有点好笑……但也无可否认地可爱。你怎么能拒绝这样的请求呢！!");
            outputText("[pg]你俯下身，在她的嘴唇上飞快地啄了一下，然后低头看着她湿润的小穴。你慢慢地用手抚过她的屁股，将一根手指按进她的穴口逗弄着。她轻哼了一声，感激地甩了甩尾巴。一股细细的淫液顺着她多汁的阴唇流下，流进她的股沟，流过她的屁股。你又抽插了一会儿，然后抽出手指去试探她的小菊花。这时她发出一声微弱的轻哼，在压力下扭动着身体，但并没有抱怨。");
            outputText("[pg]尽管她不由自主地试图抵抗，你滑溜的手指还是毫不费力地插进了她的体内。你慢慢地抠挖着她的屁股，确保里面足够湿滑，能容纳你的肉棒。一声淫荡的呻吟从她的喉咙深处爬了出来，她的小穴湿漉漉的，润滑液顺着股沟滴落下来");
            if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,525) == 3)
            {
               outputText("，更不用说她那硬挺的肉棒了");
            }
            outputText("，这显然说明她已经准备好了。[say:哦，我的伴侣……求你了，现在就填满我！别再逗我了，把你的肉棒塞进你的龙准备好的小穴里，能插多深就插多深！]她恳求着，但因为自己说的脏话而感到尴尬，不敢直视你的眼睛。");
            outputText("[pg]你很想这么做，但你也想好好品味一下。你将你的肉棒对准她准备好的小穴，开始往里推。这是一种奇怪但令人愉悦的感觉。她的屁股试图拒绝你" + get_player().cockDescript(_loc1_) + "的入侵，而她的小穴似乎一心想把你另一根" + get_player().cockDescript(_loc1_) + "吸进去。你只坚持挺动了几下，就突破了她括约肌形成的屏障，插进了她的屁股。");
            outputText("[pg]烬大叫出声，全身都在愉悦中颤抖，两个小穴都在挤压收缩，试图把你吸进去");
            if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,525) == 3)
            {
               outputText("，肉棒将前列腺液滴在她的肚子上");
            }
            outputText("。");
            outputText("[pg]拥有");
            if(get_player().cockTotal() == 2)
            {
               outputText("两根");
            }
            else
            {
               outputText("两根");
            }
            outputText("你的肉棒被湿滑紧致的温暖包裹着，这感觉几乎让你当场就把精液射满她体内，但不知怎的，你还是忍住了。");
            outputText("[pg]你的");
            if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,531) == 0)
            {
               outputText("母龙");
            }
            else
            {
               outputText("龙女");
            }
            outputText("喉咙里发出低沉的呻吟，用狂喜的眼神看着你。[say: 我爱你，[name]……天哪，我太爱你了，我很高兴终于能当面对你说出这句话，]她对你说。然后，她眼中的爱意渐渐被情欲取代。[say: 但我也爱死这些肉棒了；这两根美妙的配种棒——来吧，伴侣！快来让你的发情母龙怀孕吧！]她充满欲望地命令道。");
         }
         outputText("[pg]你抬起烬的双腿，将它们架在你的肩膀上。这样你就可以抱住她的腿，让你的臀部更贴近[Ember em]。这头龙眼中闪烁着放肆的情欲，毫不掩饰对你的赤裸渴望，[Ember em]在巢穴的树叶床上撑住身体，手指在树叶和草丛中沙沙作响，等待你开始。");
         outputText("[pg]你开始抽插，起初很慢，但很快加快了节奏，直到洞穴里充满了你的胯部拍打" + emberMF("他屁股","她柔软的阴唇") + "的声音。烬呻吟喘息着，将[Ember eir]屁股向后迎合你，" + emberMF("他的屁股","她的小穴"));
         if(emberHasVagina() && get_player().cockTotal() > 1)
         {
            outputText("和屁股");
         }
         outputText("收缩蠕动着，紧紧挤压着你插入的肉棒");
         if(emberHasVagina() && get_player().cockTotal() > 1)
         {
            outputText("");
         }
         outputText("。");
         outputText("[pg]听到你的龙伴侣赞许的呻吟，你加倍努力地在[Ember em]体内抽插，给[Ember eirs]紧致的");
         if(emberHasVagina())
         {
            outputText("小穴");
         }
         else
         {
            outputText("屁股");
         }
         outputText("应得的猛烈撞击。");
         outputText("[pg][say: 来……来吧……射进我里面，求你了！用你的精液填满我！]烬喘息着，向你恳求。");
         outputText("[pg]你插入了[Ember em]一次，两次，最后将你的" + get_player().cockDescript(_loc1_) + "尽可能深地埋入" + emberMF("他","她") + "的" + emberGroinDesc("紧致屁股","湿滑小穴") + "中，然后射出了你的精液。");
         outputText("[pg]当滚烫的精液涌入[Ember em]体内时，烬狂喜地嚎叫起来。" + emberMF("他","她") + "的");
         if(emberHasVagina())
         {
            outputText("小穴颤抖着，将淫水溅满了你插入的肉棒");
            if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,525) == 3)
            {
               outputText("，而她的");
            }
            else
            {
               outputText("，");
            }
         }
         if(emberHasCock())
         {
            outputText("肉棒喷发了，将龙精喷向空中，然后像雨点一样落回[Ember eir]的身体上，让[Ember em]溅满了[Ember eir]自己的体液，并且");
         }
         outputText("随着高潮的消退，[Ember em]大口喘着粗气。");
         outputText("[pg]你们俩不约而同地喘息着，只花了一会儿时间恢复呼吸，你便从[Ember eir]的洞里拔了出来");
         if(emberHasVagina() && get_player().cockTotal() > 1)
         {
            outputText("");
         }
         outputText("，让一股令人满足的白浊流淌在下方的树叶上。你对着烬微笑，肉棒");
         if(get_player().cockTotal() > 1)
         {
            outputText("");
         }
         outputText("依然在[Ember em]上方摇晃着。");
         outputText("[pg][say:还不满足吗？][Ember ey]轻哼着，温柔地抚摸着你的脸颊。然后[Ember eir]的嘴唇卷起一个邪恶的、露出尖牙的笑容。[say:很好。我也一样。该进行第二回合了……]" + emberMF("他","她") + "在你身下扭动着，重新调整了姿势，让[Ember em]自己四肢着地，尾巴卷到一边，从[Ember eir]的翅膀下越过肩膀看着你。[say:怎么？你还在等什么，等我给你发请柬吗？][Ember ey]戏弄着你。臀部的摇晃清楚地表明[Ember ey]现在正期待着你从后面干[Ember em]。");
         outputText("[pg]你抚摸着[Ember eir]的尾巴，[Ember ey]也充满爱意地将它缠绕着你，然后你毫不客气地将自己重新插进[Ember eir]依然松弛的");
         if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,525) == 1)
         {
            outputText("屁股");
         }
         else if(get_player().cockTotal() == 1)
         {
            outputText("小穴");
         }
         else
         {
            outputText("洞穴");
         }
         outputText("里，发出一声吧唧的黏腻声。感觉太棒了……一次又一次地占有[Ember em]。");
         outputText("[pg][say:呃啊……俯下身，抱住我的肚子，]这条龙指导着你，因为被如此填满而在欲望中呻吟。你按照[Ember ey]说的做，用尽全力抱紧。[say:别抱那么紧，笨蛋！][Ember ey]没好气地回了一句，尾巴轻轻拍打你的额头以示惩戒。你道了歉并松开了手。[say:哦，对，这样好多了……现在，动起来，不然我就要自己动了，][Ember ey]说道，[Ember eir]声音里带着明显的坏笑。");
         outputText("[pg]你以稳定的节奏开始抽插。烬在你身下呻吟，[Ember eir]的胸腔随着[Ember eir]低沉的呼噜声而震动。" + emberMF("他","她") + "配合着你的冲刺而移动，帮助你在[Ember eir]的");
         if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,525) == 1)
         {
            outputText("屁股");
         }
         else if(get_player().cockTotal() == 1)
         {
            outputText("小穴");
         }
         else
         {
            outputText("洞穴");
         }
         outputText("里进进出出。你们臀部互相拍打的湿润黏腻声在巢穴中回荡，让你十分享受。[say:嗯，太棒了……但是，你就不能再用力点吗？来吧，我的伴侣；我是一条龙，不是什么娇滴滴的公主——我这个" + emberMF("家伙","公主") + "绝对承受得住，][Ember ey]在[Ember eir]的快感中向你低吼，淫荡地呻吟着，随着你在[Ember em]体内的每一次抽插而紧紧夹住你。");
         outputText("[pg]你照[Ember ey]说的做，开始更猛烈地在[Ember em]体内进出。[say:再用力！给我再用力点！][Ember ey]催促道。你加倍努力，每一次摇晃臀部刺入你的龙伴侣时都大口喘气。[say:啊！就是这样。向我展示你拥有我，就像我拥有你一样。呃！向我展示你是一个多么强大的勇者。嗯！强大到可以把像我这样的龙按在身下干到发狂。[name]，我太爱你了……][Ember ey]的声音渐渐变成了低沉的呼噜声。被[Ember eir]鼓励的话语所点燃，你用尽全力抓住[Ember em]并向[Ember em]体内冲刺。如果不是因为[Ember ey]尽力迎合你时，对你的粗暴发出的淫荡呻吟，你甚至会担心弄伤[Ember em]。");
         outputText("[pg]你感觉到体内有什么东西爆发了，你俯身压在下方呻吟的龙身上，咬住[Ember eir]的背部，再次射在里面。一股又一股的精液喷射在[Ember eir]渴望的洞穴里");
         if(emberHasVagina() && get_player().cockTotal() > 1)
         {
            outputText("");
         }
         outputText("。这条龙发出一声欢呼，因为[Ember eir]沾满精液的");
         if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,525) == 1)
         {
            outputText("屁眼紧缩");
         }
         else if(get_player().cockTotal() == 1)
         {
            outputText("小穴紧缩");
         }
         else
         {
            outputText("双穴紧缩");
         }
         outputText("着你，榨取着你的");
         if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,525) == 1)
         {
            outputText("肉棒，同时他的阴茎将龙精喷射到他身下的树叶上，空气中弥漫着精液的气味，将树叶粘结成一团冒着热气的泥沼。");
         }
         else
         {
            if(get_player().cockTotal() == 1)
            {
               outputText("肉棒，同时她的小穴湿润地痉挛着，用新鲜的淫液浸透了你的大腿");
            }
            else
            {
               outputText("双龙，同时她的小穴湿润地痉挛着，用新鲜的淫液浸透了你的大腿");
            }
            if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,525) == 3)
            {
               outputText("，她的阴茎将龙精喷射到她身下的树叶上，空气中弥漫着精液的气味，将树叶粘结成一团冒着热气的泥沼");
            }
            outputText("。");
         }
         outputText("像个荡妇一样呻吟着，巨龙拍打着翅膀，在[Ember ey]瘫倒在地上之前，送来阵阵凉风吹过你们过热的身体，[Ember ey]几乎无法支撑自己站立。[say:...太棒了...]烬喘息着。[say:我...呃...你确定你想要...第三回合？][Ember ey]问道，听起来有些疲惫，显然不确定你是否能应付得来。");
         if(get_player().lib >= 50 || get_player().minLust() >= 40)
         {
            outputText("[pg]你还没有完全满足。你低头看着[oneCock]，看着它跳动，仍然像你刚开始操烬时一样坚挺。[say:你-你还没满足？]烬敬畏地问道，" + emberGroinDesc("[ember Eir]的肉棒再次变硬","她的小穴开始滴水") + "看到这一幕，既对你惊人的性欲印象深刻，又被唤起了性欲。你确实说过要给[Ember em]应得的操弄。烬听到这话温柔地笑了笑，然后喉咙里发出低吼，用崇拜和欲望交织的眼神盯着你。[say:好吧，既然这样...]");
         }
         else
         {
            outputText("[pg]嗯，你觉得[Ember ey]还没有得到[Ember ey]应得的操弄。此外，你确实有备而来。你拿起你的药水瓶。烬温柔地对你微笑。[say:你知道吗，你不需要为我做到这种地步？不过，我很高兴你这么喜欢操我。]你回以微笑，拔掉软木塞，一大口喝下了药水。烬惊讶地看着[eachCock]恢复了狂暴的勃起。当巨龙看着时，" + emberGroinDesc("[ember eir]的肉棒开始再次勃起","她的小穴开始滴下水滴") + "，惊讶变成了兴奋。" + emberMF("他","她") + "用[Ember eir]非人的舌头舔了舔[Ember eir]嘴唇，显然渴望再次开始。");
         }
         outputText("[pg]烬爬向你，握住你肉棒的根部");
         if(get_player().cockTotal() > 1 && emberHasVagina())
         {
            outputText("");
         }
         outputText("温柔而坚定地，慢慢地抚摸着你。[saystart]我简直不敢相信，当我看到你挺着");
         if(get_player().cockTotal() == 1)
         {
            outputText("这根");
         }
         else
         {
            outputText("这些");
         }
         outputText("时，我有多饥渴。这简直太...令人陶醉了...你的气味，你看着我的方式，一切都是。[sayend]你拍了拍烬的头");
         if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,531) == 1 || FlagDict_Impl_.arrayReadInt(KFLAGS.flags,528) > 0)
         {
            outputText("，揉乱了" + emberMF("他的","她的"));
            if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,528) >= 2)
            {
               outputText("鬃毛");
            }
            else
            {
               outputText("头发");
            }
         }
         outputText("。" + emberMF("他","她") + "靠在你的手上，抱着你的腰，让你的肉棒");
         if(get_player().cockTotal() > 1)
         {
            outputText("");
         }
         outputText("擦过[Ember eir]脸颊。");
         outputText("[pg]这只龙对你笑了笑，然后烬张开[Ember eir]嘴，让[Ember eir]非人的舌头滑出。伴随着充满爱意的奢华抚摸，它在你的[cock biggest]上上下滑动，清理掉你");
         if(emberHasVagina())
         {
            outputText("混合的");
         }
         outputText("体液，然后像蛇一样蜿蜒盘绕在上面，用凉爽、光滑、天鹅绒般的触感包围着你。它开始坚持不懈地滑回[Ember eir]嘴里，带着你的肉棒一起，直到这只龙闭上[Ember eir]嘴，在这个过程中包裹住你的肉棒，并开始急切地吮吸，[Ember eir]舌头在里面抚摸和挤压。");
         outputText("[pg]当这只龙开始给你口交时，你呻吟起来。很难相信[Ember ey]现在有多喜欢你……以前[Ember ey]似乎不喜欢给你口交，但现在呢？" + emberMF("He","She") + "做得如此急切，你忍不住用几股前列腺液奖励[Ember eir]。");
         outputText("[pg]烬大声而淫荡地吸吮着，她的舌头继续在你的肉棒周围跳舞，但随后它松开了，[Ember ey]伴随着湿润的啵声拔了出来，她的手指轻轻抚摸着敏感的肉体，用[Ember eir]嘴唇在上面吹起一阵令人发痒的微风。");
         outputText("[pg][say:你喜欢吗？当我给你口交的时候？][Ember ey]满怀期待地抬头看着你。当[Ember ey]做得这么好时，很难不喜欢。听到这个，[Ember ey]笑了。[say:我很高兴你喜欢。你知道吗，我真的很喜欢你的味道。]烬站起来，走向巢穴远处的墙壁，撅起[Ember eir]屁股，诱人地摇晃着[Ember eir]尾巴。" + emberMF("He","She") + "充满爱意地回头看着你，向你吹了一个烟圈，不久之后又在中间吹出一条直线。[say:我准备好了……][Ember ey]低语道。");
         outputText("[pg]你向[Ember em]逼近，粗暴地抓住[Ember eir]屁股，掰开[Ember eir]臀瓣，当你再次将自己插入[Ember eir]");
         if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,525) == 1)
         {
            outputText("深处");
         }
         else
         {
            outputText("下体");
         }
         if(emberHasVagina() && get_player().cockTotal() > 1)
         {
            outputText("和深处");
         }
         outputText("。[say:啊。再、再深一点……]你用手臂勾住[Ember eir]膝盖，把[Ember eir]腿拉起来，几乎让这只龙失去平衡。[say:啊！你、你喜欢我让你掌控一切吗？呃——哦！好吧，我想我也许也有点喜欢让你掌控一切……]你几乎没有注意[Ember eir]戏弄的话语，而是专注于探索[Ember eir]沾满精液的");
         if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,525) == 1)
         {
            outputText("屁股");
         }
         else if(get_player().cockTotal() == 1)
         {
            outputText("小穴");
         }
         else
         {
            outputText("爱洞");
         }
         outputText("。[say:嗯……是的……再要我一次。]" + emberMF("He","She") + "在快乐中喘息时，让[Ember eir]舌头垂在外面。");
         outputText("[pg]当烬急切地在你身上摩擦和挺动时，足以让妓女脸红的呻吟从她的喉咙里溢出。" + emberMF("His","Her") + "内壁紧紧抓住并挤压着");
         if(emberHasVagina() && get_player().cockTotal() > 1)
         {
            outputText("你的两根肉棒");
         }
         else
         {
            outputText("你的肉棒");
         }
         if(emberHasVagina())
         {
            outputText("，当它贪婪地在你燃烧的肉体上流口水时，水分浸透了埋在她小穴里的肉棒。");
         }
         if(emberHasCock())
         {
            outputText("" + emberMF("他","她") + "的肉棒跳动着，阵阵快感化作精液，从[Ember eir]青筋暴起的肉棒中喷射而出，湿漉漉地溅在墙上。");
         }
         outputText("这条龙摇摇晃晃的，越来越依赖你来支撑[Ember em]站立——高潮即将来临，而且看起来会非常猛烈……...");
         outputText("[pg]你松开[Ember eir]的腿，抓住[Ember eir]的腰，将[Ember em]拉向你，让[Ember em]直接倒进你的怀里，比以往任何时候都更深地插入你的龙伴侣。伴随着震动[Ember eir]巢穴墙壁的雷鸣般的吼声，烬高潮了，" + emberGroinDesc("[ember eir]的肉棒将精液喷洒在墙上，滚烫的龙精几乎把墙壁刷白了","她的阴户喷涌出雌性的潮吹液，如瀑布般的女性体液几乎把你浸透，在你的[feet]边汇成一滩水") + "。");
         outputText("[pg]烬的高潮也引发了你的高潮。你将一波又一波的爱液喷射进[Ember eir]被使用过的");
         if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,525) == 1)
         {
            outputText("屁股");
         }
         else if(get_player().cockTotal() == 1)
         {
            outputText("小穴");
         }
         else
         {
            outputText("爱洞");
         }
         outputText("，感觉多余的液体顺着你的肉棒滑落");
         if(emberHasVagina() && get_player().cockTotal() > 1)
         {
            outputText("");
         }
         outputText("。[say: 啊……更多爱人的精液……] [Ember ey]低语着，几乎要在快感中晕厥过去。你感到自己也因快感而头晕目眩，和烬一起倒在覆盖着巢穴地板的柔软草地上。你的肉棒");
         if(emberHasVagina() && get_player().cockTotal() > 1)
         {
            outputText("");
         }
         outputText("滑出");
         if(get_player().cockTotal() == 1)
         {
            outputText("");
         }
         outputText("了[Ember eir]的身体，发出一声湿润的吧唧声，让你注入的液体在你们俯卧的身体下流淌。");
         outputText("[pg]你们俩都花了一点时间喘口气，然后烬翻过身看着你。" + emberMF("他","她") + "伸出一只长着爪子的手，轻轻抚摸你的脸颊。[say: [name]……你真的很懂怎么让一条龙感受到爱……] 你也回以抚摸，告诉[Ember em]，当一条龙似乎也同样爱你时，这很容易。烬满眼爱意地对你微笑。[say: 嘿，我能问你件事吗，[name]？] 你表示没问题。[say: 我想和你待在一起……抱你一会儿……我们可以这样做吗？]");
         get_player().orgasm("Generic");
         dynStats(DynStat.Sens(-5));
         menu();
         addButton(0,"好的",stayWithEmberAfterLustFuck);
         addButton(1,"不行",noStayingForCuddlesPostLustFuck);
      }
      
      public function hatchZeMuzzles() : void
      {
         clearOutput();
         outputText("你软绵绵地躺在地上，重新审视着导致你对着这个奇怪的蛋高潮的动机，当它突然发出耀眼的光芒时，你吓了一跳。然后，它又突然变暗了。你感到不安，爬到你昔日的性玩具旁检查它。当你靠近时，蛋开始出现轻微的颤抖。破裂的声音在空气中回荡，蛋壳表面开始出现细小的裂纹。你及时得到了警告，转过脸去，捂住头，蛋壳爆裂成了一团细小的碎片！当你蜷缩在蛋壳碎片的风暴中时，你听到了一声巨大的咆哮。");
         outputText("[pg]抬起头，你发现蛋不见了；取而代之的是一个陌生的身影，被一缕缕");
         if(littleEmber())
         {
            if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,525) == 0)
            {
               outputText("明亮的");
            }
            else
            {
               outputText("浅色的");
            }
         }
         if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,525) == 0)
         {
            outputText("白色的");
         }
         else if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,525) == 1)
         {
            outputText("蓝色的");
         }
         else if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,525) == 2)
         {
            outputText("粉色的");
         }
         else
         {
            outputText("紫色的");
         }
         outputText("灰尘。");
         if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,531) == 0)
         {
            if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,525) == 1)
            {
               outputText("[pg]它" + (littleEmber() ? "比预期的要矮，身高只有4英尺多一点" : "非常巨大，至少有7英尺高") + "。它的体型修长苗条，强壮的手臂和腿末端长着爬行动物的爪子，脚趾张开，长着令人生畏的利爪。");
               outputText("[pg]它的背上长着皮革般的爬行动物翅膀，当它测试和伸展翅膀时，展示了它们令人印象深刻的翼展。翅膀由紧绷的薄膜组成；鳞片状的肉在突出的骨架之间伸展。" + (littleEmber() ? " 它们长在这么小的身体上似乎有点不协调。" : "") + " 一个长满锋利牙齿、适合捕食者的爬行动物口鼻部出现在世界上，一根" + (littleEmber() ? "短粗的" : "巨大的") + "乌木角从两侧太阳穴向前弯曲。");
               outputText("[pg]一条长长的舌头，像鞭子一样长，从它的下巴里滑出来舔了舔它长着爪子的手，然后以闪电般的速度缩回嘴里。骄傲、凶猛的眼睛盯着你，瞳孔呈狭缝状，燃烧的橙色虹膜即使在黑暗中也闪闪发光。");
               outputText("[pg]这个生物从头到脚都覆盖着突出的盾形鳞片。它的背部鳞片是银色的，能反射光线，而它的腹部是金色的，让它看起来有一种王者风范。");
               if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,529) > 0)
               {
                  outputText("[pg]你的目光落在了它的胸部，挺拔的乳头正从那对乳房上凸起，还滴落着液体。你目测这只生物大约有" + (littleEmber() ? "A" : "F") + "罩杯。");
               }
               else
               {
                  outputText("[pg]你的目光落在了它的胸部，挺拔的乳头从小巧的金色腹鳞之间凸显出来。");
               }
               if(get_player().lib >= 50)
               {
                  outputText("[pg]你不由自主地将目光移向了");
               }
               else
               {
                  outputText("[pg]你偷偷地瞥了一眼");
               }
               outputText("这只怪物的胯部；在那里，一条看似很小的肉缝突然吐出了一根" + (littleEmber() ? "5" : "16") + "英寸长的阴茎，与你以前见过的任何东西都不一样，它有一个圆润细长的龟头，还有一系列让它看起来几乎呈分节状的隆起。一对" + (littleEmber() ? "小" : "苹果般大小") + "的睾丸沉甸甸地垂在下面。他绝对是个雄性");
               if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,529) > 0)
               {
                  outputText("，尽管乳头还在滴水");
               }
               outputText("。");
            }
            else if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,525) == 2)
            {
               outputText("[pg]它" + (littleEmber() ? "比预期的要矮，身高只有4英尺多一点" : "非常巨大，至少有7英尺高") + "。它的体型修长苗条，强壮的手臂和腿末端长着爬行动物的爪子，脚趾张开，长着令人生畏的利爪。");
               outputText("[pg]它的背上长着皮革般的爬行动物翅膀，当它测试和伸展翅膀时，展示了它们令人印象深刻的翼展。翅膀由紧绷的薄膜组成；鳞片状的肉在突出的骨架之间伸展。" + (littleEmber() ? " 它们长在这么小的身体上似乎有点不协调。" : "") + " 一个长满锋利牙齿、适合捕食者的爬行动物口鼻部出现在世界上，一根" + (littleEmber() ? "短粗的" : "巨大的") + "乌木角从两侧太阳穴向前弯曲。");
               outputText("[pg]一条长长的舌头，像鞭子一样长，从它的下巴里滑出来舔了舔它长着爪子的手，然后以闪电般的速度缩回嘴里。骄傲、凶猛的眼睛盯着你，瞳孔呈狭缝状，燃烧的橙色虹膜即使在黑暗中也闪闪发光。");
               outputText("[pg]这个生物从头到脚都覆盖着突出的盾形鳞片。它的背部鳞片是银色的，能反射光线，而它的腹部是金色的，让它看起来有一种王者风范。");
               outputText("[pg]你的目光落在了它的胸部，挺拔的乳头正从那对乳房上凸起。你目测这只生物大约有" + (littleEmber() ? "A" : "F") + "罩杯。");
               if(get_player().lib >= 50)
               {
                  outputText("[pg]你不由自主地将目光移向了");
               }
               else
               {
                  outputText("[pg]你偷偷地瞥了一眼");
               }
               outputText("这只怪物的胯部；在那里，你看到细密的鳞片实际上分开了，露出了一个" + (littleEmber() ? "微小的、" : "") + "看起来很湿滑的小穴。她显然是个雌性，没有你所能看到的任何值得注意的“附加物”。");
            }
            else
            {
               outputText("[pg]它" + (littleEmber() ? "比预期的要矮，身高只有4英尺多一点" : "非常巨大，至少有7英尺高") + "。它的体型修长苗条，强壮的手臂和腿末端长着爬行动物的爪子，脚趾张开，长着令人生畏的利爪。");
               outputText("[pg]它的背上长着皮革般的爬行动物翅膀，当它测试和伸展翅膀时，展示了它们令人印象深刻的翼展。翅膀由紧绷的薄膜组成；鳞片状的肉在突出的骨架之间伸展。" + (littleEmber() ? " 它们长在这么小的身体上似乎有点不协调。" : "") + " 一个长满锋利牙齿、适合捕食者的爬行动物口鼻部出现在世界上，一根" + (littleEmber() ? "短粗的" : "巨大的") + "乌木角从两侧太阳穴向前弯曲。");
               outputText("[pg]一条长长的舌头，像鞭子一样长，从它的下巴里滑出来舔了舔它长着爪子的手，然后以闪电般的速度缩回嘴里。骄傲、凶猛的眼睛盯着你，瞳孔呈狭缝状，燃烧的橙色虹膜即使在黑暗中也闪闪发光。");
               outputText("[pg]这个生物从头到脚都覆盖着突出的盾形鳞片。它的背部鳞片是银色的，能反射光线，而它的腹部是金色的，让它看起来有一种王者风范。");
               outputText("[pg]你的目光落在了它的胸部，挺拔的乳头正从那对乳房上凸起。你目测这只生物大约有" + (littleEmber() ? "A" : "F") + "罩杯。");
               if(get_player().lib >= 50)
               {
                  outputText("[pg]你不由自主地将目光移向了");
               }
               else
               {
                  outputText("[pg]你偷偷地瞥了一眼");
               }
               outputText("这怪物的胯部；在那里，你看到鳞片在两个地方分开了。下面的开口毫无疑问是一个" + (littleEmber() ? "小巧的" : "") + "小穴；但从它正上方的缝隙中突然伸出一根" + (littleEmber() ? "5" : "16") + "英寸长的阴茎，这与你以前见过的任何东西都不一样，它有一个圆润细长的龟头，以及一系列让它看起来几乎呈分节状的隆起。在它下面，一对" + (littleEmber() ? "小巧的" : "苹果大小的") + "睾丸沉甸甸地落入原位，让你毫不怀疑她是个双性人。");
            }
         }
         else if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,525) == 1)
         {
            if(littleEmber())
            {
               outputText("[pg]你的第一印象是一个人类小孩，但仔细一看，你会发现一些非常非人类的特征。虽然它的一部分被橄榄色的皮肤覆盖，但其余部分闪烁着银色的爬行动物鳞片。它的身高不超过一个10岁的孩子，从这里你可以看到巨大的龙翼、一对短小的乌黑犄角，以及一条不断甩动的鳞片尾巴。当它警惕地盯着你时，那双爬行动物的眼睛简直闪烁着火红色的光芒。");
               outputText("[pg]这个身影的外表略显男性化，有着强壮、轮廓分明的肌肉特征。他的体格有一种雌雄同体的感觉");
               if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,529) > 0 || FlagDict_Impl_.arrayReadInt(KFLAGS.flags,528) > 0)
               {
                  outputText("，配有");
               }
               if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,529) > 0)
               {
                  outputText("小巧的乳房，大约是A罩杯");
                  if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,528) > 0)
                  {
                     outputText("和");
                  }
               }
               if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,528) > 0)
               {
                  outputText("长长的、充满女性魅力的秀发");
               }
               outputText("，但他的男性特征是不可否认的。尤其是当你看到");
               if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,534) > 0)
               {
                  outputText("他骨盆上的裂缝里吐出一根五英寸长的非人阴茎");
               }
               else
               {
                  outputText("一根五英寸长的人类阴茎在他双腿间摇晃");
               }
               outputText("，肉囊里还装着小巧的睾丸。");
            }
            else
            {
               outputText("[pg]你的第一印象是一个人形生物，但仔细观察就会发现一些非常非人类的特征。虽然它的一部分覆盖着橄榄色的皮肤，但其余部分闪烁着银色的爬行动物鳞片。它比任何人类都要高，轻松超过7英尺，即使从这里你也能看到巨大的龙翼，一对长长的乌黑角，以及一条甩动着的鳞片尾巴。当它警惕地盯着你时，爬行动物的眼睛真的闪烁着火红色的光芒。");
               outputText("[pg]这个身影外貌上偏男性化，有着强壮、线条分明的肌肉特征。他的体格中有一种雌雄同体的感觉");
               if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,529) > 0 || FlagDict_Impl_.arrayReadInt(KFLAGS.flags,528) > 0)
               {
                  outputText("，配有");
               }
               if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,529) > 0)
               {
                  outputText("巨大的乳房，起码有F罩杯");
                  if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,528) > 0)
                  {
                     outputText("和");
                  }
               }
               if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,528) > 0)
               {
                  outputText("长长的、充满女性魅力的秀发");
               }
               outputText("，但他的男性特征是不可否认的。尤其是当你看到");
               if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,534) > 0)
               {
                  outputText("他骨盆上的裂缝里吐出一根一英尺半长的非人阴茎");
               }
               else
               {
                  outputText("一根一英尺半长的人类阴茎在双腿间摇晃");
               }
               outputText("，下面还挂着一个肉囊，里面装着苹果大小的睾丸。");
            }
         }
         else if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,525) == 2)
         {
            if(littleEmber())
            {
               outputText("[pg]你的第一印象是一个人类小孩，但仔细一看，它身上有一些非常非人的特征。虽然部分身体覆盖着橄榄色的皮肤，但其余部分闪烁着银色的爬行动物鳞片。它的身高不超过一个10岁的孩子，从这里你可以看到巨大的龙翼，一对小巧的乌黑龙角，以及一条甩动的爬行动物尾巴。当它警惕地盯着你时，那双爬行动物的眼睛真的闪烁着火红色的光芒。");
               outputText("[pg]这个身影略显女性化，有着几乎难以察觉的曲线。对于某些口味来说，她的身形令人愉悦，有着男孩般的轮廓和平坦的胸部。往下看，你会看到紧绷的腹部、娇小的臀部和修长的大腿，她的一举一动都吸引着你的注意力……在那些美妙的大腿之间，你看到了一条光滑的、看起来像人类的阴道口；它看起来发育不全，但仍然很诱人，尽管它是否能够发挥其作用还值得怀疑。");
            }
            else
            {
               outputText("[pg]你的第一印象是一个人形生物，但仔细一看，它身上有一些非常非人的特征。虽然部分身体覆盖着橄榄色的皮肤，但其余部分闪烁着银色的爬行动物鳞片。它比任何人类都要高，轻松超过7英尺，即使从这里你也能看到巨大的龙翼，一对长长的乌黑龙角，以及一条甩动的爬行动物尾巴。当它警惕地盯着你时，那双爬行动物的眼睛真的闪烁着火红色的光芒。");
               outputText("[pg]这个身影看起来很女性化，有着优雅、匀称的曲线。她的身形令人愉悦，给了她一个英格纳姆任何女人都会嫉妒的轮廓；巨大的、柔软的乳房装饰着她的胸部。往下看，你会看到紧绷的腹部、圆润的臀部和女性化的大腿，她的一举一动都吸引着你的注意力……在那些美妙的大腿之间，你看到了一条诱人的、看起来像人类的阴道口；那里聚集了一些水分，让它看起来很光滑，简直是在乞求关注。");
            }
         }
         else if(littleEmber())
         {
            outputText("[pg]你的第一印象是一个人类小孩，但仔细一看，它身上有一些非常非人的特征。虽然部分身体覆盖着橄榄色的皮肤，但其余部分闪烁着银色的爬行动物鳞片。它的身高不超过一个10岁的孩子，从这里你可以看到巨大的龙翼，一对小巧的乌黑龙角，以及一条甩动的爬行动物尾巴。当它警惕地盯着你时，那双爬行动物的眼睛真的闪烁着火红色的光芒。");
            outputText("[pg]这个身影太中性了，乍一看很难猜出性别；娇小、苗条的身体，男孩般的胸部和狭窄的臀部。看她的双腿之间并没有提供多少清晰度；悬挂在一条光滑的、发育不全的阴道口上方，她有一根");
            if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,534) == 0)
            {
               outputText("五英寸长的人类阴茎");
            }
            else
            {
               outputText("五英寸长的非人阴茎，从某种内部鞘中垂下");
            }
            outputText("以及下面挂着的一个肉囊，里面装着小小的睾丸。她……还是他？显然是一个双性人。");
         }
         else
         {
            outputText("[pg]你的第一印象是一个人形生物，但仔细一看，它身上有一些非常非人的特征。虽然部分身体覆盖着橄榄色的皮肤，但其余部分闪烁着银色的爬行动物鳞片。它比任何人类都要高，轻松超过7英尺，即使从这里你也能看到巨大的龙翼，一对长长的乌黑龙角，以及一条甩动的爬行动物尾巴。当它警惕地盯着你时，那双爬行动物的眼睛真的闪烁着火红色的光芒。");
            outputText("[pg]这个身影乍一看似乎很女性化；美丽的女性特征，令人愉悦的曲线身材，以及胸前巨大的乳房。然而，看她的双腿之间却发现了一个非常不淑女的额外特征；悬挂在阴道口上方，她有一根");
            if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,534) == 0)
            {
               outputText("巨大的人类阴茎");
            }
            else
            {
               outputText("巨大的非人阴茎，从某种内部鞘中垂下");
            }
            outputText("以及下面挂着的一个肉囊，里面装着苹果大小的睾丸——这套装备几乎垂到了她的膝盖。她……还是他？显然是一个双性人。");
         }
         doNext(meetEmberAftermath);
      }
      
      public function hairExtensionSerum() : void
      {
         clearOutput();
         get_player().consumeItem(get_consumables().EXTSERM);
         outputText("你一边怀疑自己的动机，一边把地精黏液倒在蛋上。大部分液体都顺着蛋壳流了下来，让你对这种浪费感到恼火……直到你看到");
         if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,528) == 0)
         {
            outputText("细长的虎斑纹突然浮现");
            FlagDict_Impl_.arrayWriteInt(KFLAGS.flags,528,1);
         }
         else
         {
            outputText("虎斑纹变得更加密集");
            FlagDict_Impl_.arrayWriteInt(KFLAGS.flags,528,2);
         }
         outputText("在蛋壳上。");
         var _loc1_:IMap = KFLAGS.flags;
         FlagDict_Impl_.arrayWriteInt(_loc1_,532,FlagDict_Impl_.arrayReadInt(_loc1_,532) + 1);
         doNext(playerMenu);
      }
      
      public function giveEmberBludSausages() : void
      {
         clearOutput();
         outputText("观察着你的手以及蛋对它的反应，你想知道这是否就是书上所说的“分享你的精华”。也许值得一试。你忍痛咬破拇指的皮肤，将流血的手指涂抹在蛋的表面，在它的外壳上留下深红色的印记。不久之后，血液被吸收了，只留下一个污迹。你满怀期待地等待着其他事情发生");
         if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,531) == 0)
         {
            outputText("但蛋只是闪烁着兴奋的光芒，似乎还想要更多。");
            FlagDict_Impl_.arrayWriteInt(KFLAGS.flags,534,1);
         }
         else
         {
            outputText("，但什么也没发生。真令人失望。");
            FlagDict_Impl_.arrayWriteInt(KFLAGS.flags,534,0);
         }
         get_player().takeDamage(1);
         FlagDict_Impl_.arrayWriteInt(KFLAGS.flags,531,1);
         get_player().takeDamage(10);
         var _loc1_:IMap = KFLAGS.flags;
         FlagDict_Impl_.arrayWriteInt(_loc1_,532,FlagDict_Impl_.arrayReadInt(_loc1_,532) + 1);
         doNext(playerMenu);
      }
      
      public function giftDrakeFlower() : void
      {
         clearOutput();
         get_player().consumeItem(get_consumables().DRAKHRT,1);
         outputText("你把礼物藏在背后，走向这只" + emberMF("龙","龙娘") + "。当你靠近时，烬狐疑地看着你。");
         outputText("[pg][say: 你、你想要什么，[name]？][Ember ey]说道，试图掩饰[Ember eir]对你身后传来的甜香的明显兴奋。你解释说，为了回报[Ember eir]陪伴，你给[Ember em]带了点特别的东西。随着紧张感蔓延，烬坐直了身子。");
         outputText("[pg][say: 龙有足够的能力去寻找任何他们想要的东西，你不需要给我带任何东西，]骄傲的" + (littleEmber() ? "小" + emberMF("男孩","女孩") : "[Ember short]") + "说道。你可以从[Ember eir]脸上看出，[Ember ey]很想知道那是什么。你不想再拖延，拿出了龙心花，用真诚（也许有些俗气）的宣言表达了你的爱意。");
         outputText("[pg]烬的眼睛立刻亮了起来，[Ember eir]全身紧绷，站得笔直。[say: 什——我——那是——]这只传说中的凶猛生物结结巴巴地说。你把这朵美丽的花举到面前，示意烬收下。带着连鳞片都掩盖不住的深红，[Ember ey]焦急地抓住花托，连同你的手一起握住。");
         outputText("[pg]烬深情地注视着你。[say: 谢……谢谢你，[name]。你——<b>它</b>很美。我……我不会接受其他任何人的这个。][Ember ey]握着你的手，盯着你的眼睛看了好一会儿，才终于拿过龙心花并抽回手。[say: 这、这并不意味着你现在就拥有我了。我的标准可是很高的！如果你想留住我这样身份的龙，你就得保持强大和敏锐。]");
         outputText("[pg]烬满脸通红，转过身，带着龙心花走进了[Ember eir]巢穴。你注意到[Ember ey]离开时，尾巴在左右摇摆，简直就像一只开心的小狗。真可爱。");
         doNext(playerMenu);
         FlagDict_Impl_.arrayWriteInt(KFLAGS.flags,2688,1);
         var _temp_1:* = get_game();
         _temp_1.timeQ = _temp_1.timeQ + 1;
      }
      
      public function get_debugName() : String
      {
         return "烬";
      }
      
      public function get_debugHint() : String
      {
         return "";
      }
      
      public function getSomeStuff() : void
      {
         clearOutput();
         outputText("你惊愕地抿紧嘴唇，拿出那个所谓的“龙蛋”的蛋壳，递给她并问她是否能用得上。");
         outputText("[pg][say: 这是什么？一个蛋？蛋可不适合做盔甲，小可爱，不管它有多大。只要用力一击，砰！] 为了演示，她举起手，然后用手刀劈向蛋壳——接着疼得缩回了手。[say: 我的天！它太硬了！好吧……也许我们能用它做点什么。]");
         outputText("[pg]她在手里翻转着破裂的蛋壳，然后把它放进火里，用一把钳子敲打它，试图把它弄弯或弄碎。[say: 它根本没有变软。啧，如果我不能给它塑形，就没法做成盔甲。不过，它的弧度很不错，对吧？如果我把边缘打磨平滑，再装上一些带子，它会成为一面用来偏转攻击的不错的小盾牌。]");
         outputText("[pg]你告诉护甲匠做成盾牌就行，她便开始打磨边缘。在你漫不经心地浏览了近一个小时你并不怎么关心的盔甲后，她引起了你的注意。[say: 做好了，小可爱。先付钱。]");
         outputText("[pg]递过宝石，你从她手中接过白色的蛋壳；正如她所说，她把它打磨成了一面像样的盾牌，并在背面安装了可调节的带子。它的硬度毋庸置疑，但你只能好奇它的液体吸收特性是否依然完好。值得一试，对吧？");
         var _loc1_:Player = get_player();
         _loc1_.set_gems(_loc1_.get_gems() - 200);
         statScreenRefresh();
         get_player().removeKeyItem("Dragon Eggshell");
         get_inventory().takeItem(get_shields().DRGNSHL,new YvonneArmorShop().enter);
      }
      
      public function getPenetratedByEmberLastSexSceneWooooPartII() : void
      {
         clearOutput();
         outputText("你设法在你熟睡的龙族情人之前醒来；似乎在[Ember eir]睡眠中的某个时候，烬认为用[Ember eir]手臂、尾巴甚至腿紧紧地包裹住你是合适的。你依偎在" + (littleEmber() ? "孩子" : "龙") + "的怀抱中并享受它；[Ember ey]通常在情感上太懦弱了，不会这样对待你。不幸的是，拥抱并没有持续多久……烬很快醒来，昏昏沉沉地打着哈欠，慢慢地解开[Ember em]自己以便伸展。龙的脸上闪过痛苦，[Ember ey]迅速移动[Ember eir]手捂住[Ember eir]胯部。");
         outputText("[pg][say: 哎哟……]烬指责地看着你。[say: 我觉得浑身酸痛……尤其是下面……]烬说，按摩着[Ember eir]");
         if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,531) == 0 || FlagDict_Impl_.arrayReadInt(KFLAGS.flags,534) == 1)
         {
            outputText("保护性裂缝");
         }
         else
         {
            outputText("疲软的肉棒和睾丸");
         }
         outputText("。[say: 你把我当成性玩具一样用！]");
         outputText("[pg]你承认，是的，你确实这么做了……但[Ember ey]真的要坐在这里告诉你，[Ember ey]不喜欢被这样使用吗？再说，是谁说");
         if(emberAffection() < 75)
         {
            outputText("[Ember eir]鸡巴是这个世界上独一无二的？");
         }
         else
         {
            outputText("[Ember ey]可以同时应付两个甚至三个你？");
         }
         outputText("如果是那样的话，你还以为会有更多的抵抗呢。");
         outputText("[pg][say: 好吧，行！但你没必要让我高潮那么多次！我觉得我差点脱水了！]");
         outputText("[pg]你夸张地叹了口气，表示同情。好吧，你告诉[Ember em]，你确信[Ember ey]很快就会恢复精力，准备好再战。你站起身，强忍住痛苦——你的身体将为你的放纵付出代价，但你不需要让烬知道——并试图让走过去捡起衣服的动作尽可能显得色情。当你回头看时，你对自己的成功露出了得意的笑容；烬在颤抖，试图压抑另一次勃起。你温柔地问[Ember ey]是否想再来一回合……嗯，那是第几回合了？第十二回合？");
         outputText("[pg]烬惊恐地睁大了眼睛。[say: 什么！？不！不要再来了！]烬尖叫着，站起身来，毫不犹豫地逃跑了，一跑到足够远的地方就开始摇摇晃晃地飞行。你一直等到[Ember ey]离开，然后爆发出大笑。完全值得……即使正如俗话所说，你因此要在沙发上睡一个星期。");
         doNext(get_camp().returnToCampUseOneHour);
      }
      
      public function getPenetratedByEmberLastSexSceneWoooo() : void
      {
         clearOutput();
         get_images().showImage("ember-sticks-her-penor-in-your-vagoo");
         outputText("你的目光被烬双腿间那根" + (littleEmber() ? "5" : "16") + "英寸长、冰凉且跳动着的");
         if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,531) == 0 || FlagDict_Impl_.arrayReadInt(KFLAGS.flags,534) > 0)
         {
            outputText("龙");
         }
         else
         {
            outputText(littleEmber() && get_silly() ? emberMF("正太","萝莉") : "人类");
         }
         outputText("肉棒吸引，你饥渴地舔了舔嘴唇。你的[vagina]急切地跳动着，你告诉烬你有些地方痒得难受，需要抓一抓……烬算得上是个足够强壮的" + emberMF("男人","扶她") + "，能帮你解痒吗？[pg]");
         if(emberAffection() <= 25)
         {
            outputText("[pg][say: 哈！我可比你能承受的要厉害得多！等你有什么东西能容下我一半的时候再来找我吧。]烬嘲笑你，然后转身走开了。" + (littleEmber() ? "" + emberMF("他","她") + "似乎有点夸大其词了……" : ""));
            doNext(get_camp().returnToCampUseOneHour);
            return;
         }
         if(emberAffection() < 75)
         {
            outputText("[pg][say: 你在质疑我作为龙的尊严吗！？我告诉你，这个世界上没有哪根肉棒能比得上我的！]烬骄傲地自夸道。");
         }
         else
         {
            outputText("烬的肉棒猛地");
            if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,531) > 0 && FlagDict_Impl_.arrayReadInt(KFLAGS.flags,534) == 0)
            {
               outputText("立正");
            }
            else
            {
               outputText("从保护性的包皮中弹出");
            }
            outputText("，仅仅是提到你期望[Ember em]做什么，它就有了反应。[say: 我对付两个……不……三个你都绰绰有余！如果你想要证明，尽管开口！]烬骄傲地自夸道。");
         }
         outputText("[pg][say: 那好吧，]你娇嗔道，一只手轻佻地放在臀部，对着你那龙族情人眨了眨眼。[say: 既然你这么准备好要占有我，狠狠地操我……那你为什么不证明一下呢？]");
         outputText("[pg][say: 好吧，过来！]烬抓住你的手臂，把你带向荒野深处。当你们到达营地边缘的一小片空地时，烬转过头看着你。[say: 你……你为什么还穿着衣服？]烬问道，双臂交叉，不耐烦地用脚敲打着地面。");
         outputText("[pg]你脱下衣服，直到赤身裸体，毫不掩饰，尽情享受着烬投向你的那种震惊而狂喜的欲望目光。你的手指在你的上臂上轻轻滑动，你撅起嘴，问[Ember ey]是不是要让你一直等下去，享受着你对这只发情的" + (littleEmber() ? "小家伙" : "龙") + "的情感控制。");
         outputText("[pg]烬猛地一缩，从恍惚中惊醒。[say: 我……呃……好吧！过来！]烬向你走来。你张开双臂，准备给[Ember em]一个拥抱，却发现自己被一把抱起。这只龙对你邪恶地笑了笑，然后突然给了你一个狂野的吻，[Ember eir]长长的舌头缠绕着");
         if(get_player().tongue.type == 0)
         {
            outputText("你的");
         }
         else
         {
            outputText("你自己那非人般柔软的肌肉");
         }
         outputText("几乎滑进了你的喉咙里。" + emberMF("他","她") + "疯狂地亲吻着你，甚至当[Ember ey]跪倒在地，温柔地将你平放在地上时，显然已经准备好开始做爱了。");
         if(get_player().hasCock())
         {
            outputText("好像[Ember eir]抚摸你阴茎的手还不足以证明这一点似的。");
         }
         outputText("[pg]烬开始用[Ember eir]的龟头轻轻试探你的[vagina]，品味着你那渗出淫液的肉套散发出的热量。[say: 准备好了吗？]烬问道，在几乎无法抑制的期待中颤抖着。你喉咙里发出一声呻吟，试图用你的[legs]缠住[Ember eir]的臀部，希望能把[Ember em]拉向你。领会了你的暗示，烬开始缓慢地向你的深处挺进。");
         outputText("[pg]你喘息着，然后在快感中呻吟，因为烬的");
         if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,531) == 0 || FlagDict_Impl_.arrayReadInt(KFLAGS.flags,534) > 0)
         {
            outputText("龙");
         }
         else
         {
            outputText(littleEmber() && get_silly() ? emberMF("正太 ","萝莉 ") : "类人");
         }
         outputText("阴茎开始穿过你的阴唇。");
         if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,531) == 0 || FlagDict_Impl_.arrayReadInt(KFLAGS.flags,534) > 0)
         {
            outputText("[pg]首先是烬那锥形的长矛状龟头；它慢慢地撑开你，毫无阻力地滑入你的体内。接着是[Ember eir]带有脊状突起的肉棒；每一个脊状突起进入体内，都感觉像是一个里程碑被征服。");
            get_player().cuntChange(littleEmber() ? 10 : 32,true,false,true);
            outputText("最后，你到达了[Ember eir]阴茎的根部，那里有一个球状的肉结；谢天谢地，它还没有膨胀，但你还是忍不住呻吟起来，因为它的进入让你被撑得更开了。");
         }
         else
         {
            outputText("[pg]烬的肉棒在你的体内抽插，用它那令人惊讶的凉爽肉体压制着你的热量。");
            get_player().cuntChange(littleEmber() ? 10 : 32,true,true,false);
            outputText("并不是说它不温暖……但它较低的温度让人感到既解脱又兴奋。");
         }
         outputText("[pg][say: 进、进去了！]烬高兴地说，[Ember eir]的臀部与你的臀部接触。[say: 我要开始动了。]你点头允许。");
         if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,531) == 0 || FlagDict_Impl_.arrayReadInt(KFLAGS.flags,534) > 0)
         {
            outputText("[pg]当烬慢慢地把[Ember eir]的阴茎从你滴水的阴户中拔出时，那种感觉和[Ember eir]进入时一样令人愉悦。首先是肉结拉扯着你的内壁，当它从你被撑开的阴唇中滑出时，你松了一口气。接着是那些极其美妙的脊状突起，拉扯并按摩着你的通道，带来一阵阵微小的快感涟漪，震撼着你的核心。最后是龟头……那顽固的龟头拉扯着你的阴唇，拒绝离开它温暖的边界，拉扯着你的阴唇，直到烬决定再次插入。");
         }
         else
         {
            outputText("[pg]当烬的肉体离开你的爱洞，让它空虚地重新生长出难以忍受的热量时，你几乎想痛苦地呻吟……然后当烬开始再次在你的体内抽插，再次熄灭你欲望的火焰时，你又在喜悦中尖叫。");
         }
         outputText("[pg]你陶醉在烬的动作中；在表达感情方面，[Ember ey]可能缺乏安全感，但一旦让[Ember em]进入实际的做爱过程，[Ember ey]就会真正展示出[Ember ey]的实力！你用[legs]把烬缠得更紧，开始挺动和抽插，反复将自己刺穿在[Ember eir]美味的男子气概上，品味着被撑开和填满的感觉，在[Ember eir]的阴茎上上下摩擦你的[clit]，以增强做爱的快感。");
         outputText("[pg]烬俯身在你上方，喘着粗气，[Ember eir]灼热的呼吸离你的[face]只有几英寸，用半闭的、充满欲望的眼睛凝视着你。[say: 你感觉真好……真热……真性感……]烬喘息着说。你也喘息着回应，伸出手臂搂住[Ember eir]的脖子，用同样的表情回望着[Ember em]，告诉[Ember em]你觉得[Ember ey]感觉也一样好。");
         outputText("[pg]烬深深地插入你体内，喘息着；前列腺液从[Ember eir]的阴茎射入你润滑良好的通道，[Ember ey]停止了动作。[say: 我、我快到了……]烬警告说，在快感中颤抖着，你的肉壁收缩并抓住[Ember eir]的肉棒，渴望那种点燃你神经快感的摩擦。");
         outputText("[pg]你从牙缝里轻柔地低吼回去；你还没准备好呢！好吧，如果[Ember ey]快到了，那[Ember ey]就需要快点，这样你也能高潮！你嫉妒地用手臂和[legs]缠住[Ember em]，用你所能聚集的所有速度和力量来回抽插，利用你[vagina]里能控制的每一块肌肉来挤奶和挤压你的龙族情人……是的，是的，再来一点……烬对你突然的动作发出呻吟，摇摇晃晃地瘫倒在你身上，压倒性的快感耗尽了[Ember em]所有的力量。");
         outputText("[pg]沮丧、饥渴，而且几乎快到了，你把[Ember em]翻转过来，让[Ember eir]仰面躺着，继续挺动……是的，是的，就是这个！当快感的浪潮在你的身体里激荡和涌动时，你在狂喜中尖叫；高潮像海啸一样击中你，在你的神经中倾泻而下，驱使你进入受欢迎的、幸福的释放。");
         if(get_player().hasCock())
         {
            outputText("你的肉棒爆发了，喷吐出精液");
            if(get_player().cumQ() < 250)
            {
               outputText("溅满");
            }
            else if(get_player().cumQ() < 1000)
            {
               outputText("浸透");
            }
            else if(get_player().cumQ() < 2000)
            {
               outputText("完全覆盖");
            }
            else
            {
               outputText("彻底湿透");
            }
            outputText("你的龙族伴侣。");
         }
         outputText("[pg]你的高潮引发了烬的高潮，你感觉到[Ember eir]肉棒跳动着变得更加坚硬。伴随着一声咆哮，烬将[Ember eir]精液深深地射入你痉挛的[vagina]中，确保用白色、清爽的龙精涂满你体内的每一个角落。当你感觉到烬的种子在你体内流淌，进入你等待的子宫时，你忍不住松了一口气；这种感觉如此强烈，就好像你被点燃了，而[Ember ey]刚刚倒了一桶水，仁慈地扑灭了火焰。伴随着一声呻吟，烬将你翻转到一边并拔出，让瀑布般的白色龙精从你被使用和虐待的[vagina]中漏出。");
         outputText("[pg]你在愉悦和解脱中轻声叹息，沐浴在与一位好情人做爱后的美妙余韵中。你不假思索地依偎在龙的身边，试图困住[Ember em]，这样你就可以紧紧抱住[Ember em]，一起品味这种幸福的感觉。你的手不经意地滑落到你的阴部，感觉到龙精从里面漏出来，并开始玩弄它。就像一个玩水的孩子一样，你把手指浸入浓稠、起泡、气味浓烈的精液中，无忧无虑地随意涂抹，涂在你的大腿内侧，并在你的肚子上画出条纹。");
         outputText("[pg]你的举动并没有被躺在你身边的龙忽视；烬干咽了一下，开始重新喘息，很快你就感觉到有什么东西在戳你的大腿。低头一看，你看到烬正炫耀着全新的勃起。[say: 如果你在我面前做这种事，我-我忍不住……]烬借口说。");
         outputText("[pg]你只是饥渴地笑了笑。好吧，如果[Ember ey]这么渴望第二回合，你不会让[Ember em]失望的。你轻轻握住[Ember eir]阴茎，慢慢地将它引导回你的阴唇之间，开玩笑地告诉烬，这次你会对[Ember em]更慢、更温柔。");
         outputText("[pg]烬愉悦地发出嘶嘶声；[Ember eir]仍然敏感的肉棒勉强进入你体内，然后跳动并在第二次高潮中爆发，用额外的龙种弹幕填满你。你忍不住对烬意想不到的高潮咯咯笑起来。[say: 小-小心！我还是很敏感！]烬喘息着，因为[Ember ey]再次慢慢从你体内拔出。你给了[Ember em]一个天真无邪的表情，然后再次轻轻地插入[Ember em]。此时" + emberMF("他","她") + "仍然疲软，但你相信这很快就会改变。");
         outputText("[pg]烬呻吟着，因为[Ember ey]再次变硬，敏感而跳动，因为[Ember eir]肉棒慢慢地用它不断增加的周长填满你。你开始前后摆动你的臀部；你想知道你能从你无助的龙族情人那里哄出多少次高潮……[say: 要-要射了！！]烬咆哮着，因为[Ember ey]在你体内又射了几股。");
         outputText("[pg][say: 我-我不能再这样做了……你会把我榨干的……]烬说，疲惫地喘息着，尽管从[Ember eir]表情来看，你很难相信[Ember ey]不享受它。你给了[Ember em]一个夸张的撅嘴，告诉[Ember em]你还没完呢。当然，只要再来一两次……？...?");
         if(get_player().hasPerk(PerkLib.HistoryWhore) || get_player().hasPerk(PerkLib.HistorySlut))
         {
            outputText("利用你磨练出来的技巧，你让你阴道里的肌肉起伏和起皱，以少数女人能做到的方式戏弄夹在你体内的肉棒。");
         }
         outputText("嗯……你能感觉到你自己的第二次高潮正在火热地到来。也许再来4或5次，你就会放过这条龙……...");
         outputText("[pg]最终，你筋疲力尽，肚子里塞满了龙精，以至于你看起来准备生下一对龙宝宝，感觉非常满足，你躺在烬的胸前，拥抱着你柔软、完全被榨干的情人。这条龙睡得很熟，因为疲惫而昏倒了，你通过听[Ember eir]心跳来娱乐自己，因为[Ember ey]在[Ember eir]睡眠中轻柔地吸气和呼气。老实说，你也需要小睡一会儿，然后你在[Ember em]身上昏倒了。");
         get_player().orgasm("Vaginal");
         dynStats(DynStat.Sens(-2));
         if(get_player().lib > 50)
         {
            dynStats(DynStat.Lib(-3));
         }
         get_player().slimeFeed();
         doNext(getPenetratedByEmberLastSexSceneWooooPartII);
      }
      
      public function getMilkFromEmber() : void
      {
         clearOutput();
         get_images().showImage("ember-drink-her-milk");
         if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,529) > 0)
         {
            outputText("你想了一会儿，然后发现你的目光被烬那" + (littleEmber() ? "平坦的" : "圆润坚挺的"));
            if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,531) == 0)
            {
               outputText("、长满鳞片的");
            }
            outputText((littleEmber() ? "胸膛" : "乳房") + "吸引了，[Ember eir]" + (littleEmber() ? "小巧的" : "挺拔的") + "乳头一如既往地裸露着，诱惑着你。你强忍着笑意，问[Ember ey]是否愿意让你吸吮[Ember eir]的乳汁。");
         }
         else
         {
            outputText("你想了一会儿，然后发现你的目光被烬那" + (littleEmber() ? "平坦的" : "圆润坚挺的"));
            if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,531) == 0)
            {
               outputText("、长满鳞片的");
            }
            outputText((littleEmber() ? "胸膛" : "乳房") + "，[Ember eir]" + (littleEmber() ? "小巧的" : "挺拔的") + "乳头一如既往地裸露着，诱惑着你。你强忍着笑意，问[Ember ey]如果你给[Ember em]一瓶催乳剂，[Ember ey]是否愿意让你吸吮[Ember eir]乳汁。");
         }
         if(emberAffection() <= 25)
         {
            outputText("[pg][say:什么！？我为什么要让你这么做！？你现在还吸奶是不是有点太老了？]");
            outputText("[pg]你告诉了[Ember em]实话；你很渴，而且[Ember ey]看起来绝对美味。此外，难道[Ember ey]没有感到哪怕一丝的憋闷吗？难道[Ember eir]乳房没有因为" + (littleEmber() ? "这么小的乳房里装了这么多奶" : "里面晃荡的沉重乳汁") + "而感到胀痛吗？你是在主动帮忙排空它们，让[Ember em]感觉好点……...");
            outputText("[pg]听到你的话，烬的脸色阴沉下来。[say:它们有时候确实感觉很胀……但这些不是给你的！]" + emberMF("他","她") + "的手保护性地捂住了[Ember eir]" + (littleEmber() ? "平坦的胸膛" : "乳房") + "。");
            outputText("[pg]你问它们是给谁的，那么——[Ember ey]自己又不能喝，而且");
            if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,557) == 0 && emberChildren() == 0)
            {
               outputText(emberMF("他","她") + "没有后代需要喂养。");
            }
            else if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,557) > 0)
            {
               outputText(emberMF("他","她") + "的孩子还没孵化出来。");
            }
            else if(littleEmber())
            {
               outputText("孩子们刚吃完，这些小东西就又胀满了奶水，难道[Ember ey]就要一直忍受乳房胀痛的折磨吗？");
            }
            else
            {
               outputText("[Ember eir]孩子喝的奶根本不足以把[Ember em]吸空，难道[Ember ey]就要一直忍受乳房胀痛的折磨吗？");
            }
            outputText("[pg]烬的眼神黯淡下来，陷入了沉思；最后，[Ember ey]叹了口气，妥协了。[say:好吧。但如果你敢做什么奇怪的事，我发誓我会揍你的！]");
            outputText("[pg]你保证自己会规矩点，并告诉[Ember eir]找个舒服的姿势，这样你们就可以一起哺乳了。");
            outputText("[pg]烬靠在巢穴里的一堆树叶上，背靠着墙，然后轻轻地将双臂垂在身侧。" + emberMF("他","她") + "显得更加心不在焉了，[Ember ey]说道，[say: 那我们快点结束吧……]");
            outputText("[pg]你走上前，让" + (littleEmber() ? "[Ember em]坐在你的" : "自己坐在[Ember eir]的") + "腿上，轻轻地伸手抚摸[Ember eir]" + (littleEmber() ? "小巧的" : "丰满的") + "、充满乳汁的乳房。");
            outputText("[pg]刚接触时，烬瑟缩了一下，但随着你继续抚摸和爱抚[Ember eir]的胸部，感受着" + (littleEmber() ? "几乎平坦的胸部" : "重量") + "和光滑的");
            if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,531) == 0)
            {
               outputText("鳞片");
            }
            else
            {
               outputText("皮肤");
            }
            outputText("。" + emberMF("他","她") + "发出一声可爱的娇喘，眼睛飞快地四处乱瞟，就是不看你。你冲着[Ember ey]微微一笑，[Ember ey]尴尬地转过头去。[say: 喂，你这样它们可不会变空啊！？]");
            outputText("[pg]你不为所动，继续手上的动作，直到[Ember eir]乳头挺立，开始渗出第一滴乳汁；然后，看到[Ember ey]准备好了，你轻轻地含住[Ember eir]第一个乳头。你细细品味着舌尖上的味道；清凉爽口，清脆甘甜，还有一种你说不上来的味道……这一定是烬特有的香料。它和其他任何东西都如此不同。尝起来更甜，你吸得更用力了。");
            outputText("[pg][say: 啊！感觉真好……你敢停下来试试。]");
            outputText("[pg]你不需要更多的鼓励，就把脸完全埋进[Ember eir]胸前，开始认真地吸吮。虽然你可以享受你们俩之间的温度差，[Ember eir]肉体比你的凉爽宜人，但你的注意力都集中在乳汁上。");
            if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,525) != 2)
            {
               outputText("[pg]你感觉到有什么东西顶着你的");
               if(!get_player().isTaur() || littleEmber())
               {
                  outputText("肚子");
               }
               else
               {
                  outputText("后背");
               }
               outputText("，低头一看，是烬正在充血胀大的肉棒。你含着烬的乳头微笑，开始温柔地抚摸和揉捏[Ember ey]露出的半勃起的龙根。既然[Ember ey]这么享受，那为什么不让[Ember em]更爽一点呢？");
            }
            else
            {
               outputText("[pg]在你继续吸吮时，烬发出轻哼和呻吟；她的一只手慢慢滑到你身下，抚摸着她柔软的下体。你一时胆大，伸手推开她的手，亲自抚摸她湿润的阴唇。烬没有抗议，只是安静下来，任由你继续抚摸新的目标。");
            }
            outputText("[pg]突然，烬如梦初醒般站了起来，把你撞得仰面朝天。[say: 你、你以为你在干什么！？我没说你可以碰我！]");
            outputText("[pg]你道了歉，但指出[Ember ey]看起来和你享受她的乳汁一样享受这种接触。");
            outputText("[pg]烬尴尬地红了脸。[say: 我、我……够了！不给你喝奶了！][Ember ey]宣布道，把你拉起来，赶出了她的巢穴。");
            outputText("[pg]你脾气很好地摇了摇头。不过，你已经喝饱了她的乳汁，感觉神清气爽，焕然一新，新的活力在你的血管中流淌。");
            if(get_player().hasStatusEffect(StatusEffects.DragonBreathCooldown))
            {
               get_player().removeStatusEffect(StatusEffects.DragonBreathCooldown);
               outputText("你的喉咙感觉很舒服，抓挠感和酸痛感都消失了；你觉得你可以对着山顶大喊！!");
            }
            get_player().refillHunger(25);
            if(Utils.rand(2) == 0 && get_player().dragonScore() >= 4 && get_player().get_gender() > 0 && (get_player().get_gender() != FlagDict_Impl_.arrayReadInt(KFLAGS.flags,525) || get_player().get_gender() == 3 && FlagDict_Impl_.arrayReadInt(KFLAGS.flags,525) == 3))
            {
               outputText("然而，一阵突如其来的欲望涌过你的");
               if(get_player().hasCock())
               {
                  outputText(get_player().cockDescript(0));
                  if(get_player().hasVagina())
                  {
                     outputText("和");
                  }
               }
               if(get_player().hasVagina())
               {
                  outputText(get_player().vaginaDescript());
               }
               outputText("，让你希望烬没有把你赶走。你现在满脑子想的都是操[Ember eir]；");
               if(get_player().hasCock() && emberHasVagina())
               {
                  outputText("用你的精液填满她的子宫，让她的卵子受精");
                  if(get_player().hasVagina() && FlagDict_Impl_.arrayReadInt(KFLAGS.flags,525) == 3)
                  {
                     outputText("甚至在");
                  }
               }
               if(get_player().hasVagina() && emberHasCock())
               {
                  outputText("把那根坚硬、喷射的肉棒塞进你自己的" + get_player().vaginaDescript(0) + "里");
               }
               outputText("……太迟了，你意识到<b>烬的乳汁让你的龙体进入了");
               if(get_player().hasCock() && emberHasVagina())
               {
                  outputText("发情期");
                  get_player().goIntoRut(false);
               }
               else
               {
                  outputText("发情期");
                  get_player().goIntoHeat(false);
               }
               outputText("！</b>");
            }
         }
         else if(emberAffection() < 75)
         {
            if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,529) <= 0)
            {
               outputText("[pg]你把催乳剂递给烬，[Ember ey]说道：[say: 好吧。我会喝的，但警告你，这只是暂时的！] " + emberMF("他","她") + "瞪了你一眼，喝下了催乳剂。" + emberMF("他","她") + (littleEmber() ? "平坦的胸部微微隆起" : "的乳房膨胀起来") + "，看起来充满了乳汁。");
               get_player().destroyItems(get_consumables().LACTAID,1);
            }
            outputText("[pg][say: 好吧。我想我可以给你点甜头……但别想耍花招！] 说完，烬走进[Ember eir]的巢穴，靠在洞壁旁的一堆软树叶上。");
            outputText("[pg]你保证会规矩点，然后" + (littleEmber() ? "把[Ember em]拉进你的" : "坐在[Ember eir]的") + "腿上，伸手抚摸[Ember eir]" + (littleEmber() ? "小巧" : "丰满") + "且充满乳汁的乳房。");
            outputText("[pg]烬睁大了眼睛，在你刚碰到[Ember ey]时，[Ember ey]就舒服地喘息起来。[say: 别、别这么快！至少在开始前给我个警告。它们很敏感……]");
            outputText("[pg]你道了歉……不过既然你知道[Ember ey]喜欢这样，你就忍不住想逗弄[Ember em]，用你能想到的最挑逗的方式按摩[Ember eir]的乳房，揉捏[Ember eir]的乳头。");
            outputText("[pg]在整个过程中，烬大部分时间都在发出呼噜声，每次你的手指拂过[Ember eir]的乳头，[Ember ey]都会舒服地喘息。[say: 你在干什么？啊！你到底开不开始？如果你继续这样……]");
            if(emberHasCock())
            {
               outputText("[pg]你感觉到有什么东西在戳你；低头一看，你发现烬的肉棒正顶着你。当你再次抬头时，[Ember eir]的脸因为尴尬而完全紧绷起来。[say: 这都怪你！] 烬干巴巴地宣布，试图掩饰[Ember ey]其实很享受这个事实。");
            }
            else
            {
               outputText("[pg]烬呻吟着扭动身体，你感觉到身下有一点湿润。伸手往下摸，你感觉到了她因为明显享受你的服侍而聚集的湿润。你抬头看着她，她的脸因为尴尬而紧绷起来。[say: 这都怪你！] 烬干巴巴地宣布，试图掩饰她其实很享受这个事实。");
            }
            outputText("[pg]你微笑着告诉她你会负全责。你觉得前戏已经够了，而且看到乳汁已经开始从[Ember eir]潮红、勃起的乳头中渗出，你放弃了进一步的交谈，俯身含住了离你最近的那颗乳头。");
            outputText("[pg]当你终于开始你的任务时，烬发出隆隆的呼噜声，震动着你选择的乳房；那柔软的");
            if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,531) == 1)
            {
               outputText("肉体");
            }
            else
            {
               outputText("鳞片");
            }
            outputText((littleEmber() ? "因为装满了乳汁而微微隆起" : " 随着它们永远装满的乳汁而晃动") + "。看来你喝得越多，烬产生的乳汁就越多；不过你现在没时间思考这些，因为甜美、清爽的龙乳流入你的嘴里，落入你饥饿的肚子里，这才是你现在唯一能关心的事情。");
            outputText("[pg]有一次，烬的手臂环绕着你，将你拥入一个柔软的怀抱，这与[Ember eir]傲慢的性格截然不同。你几乎迷失在烬柔软的双峰中，从表面上看；烬似乎也同样沉浸在用[Ember eir]的母乳哺育你之中。你愉快地顺从了[Ember eir]的欲望，将你的[face]埋在[Ember eir]胸前令人愉悦的凉爽中，尽情地享受着。");
            outputText("[pg]然而，最终你的食欲减退了；你已经吃得撑不下了，所以你停止了吸吮，让[Ember eir]的乳头从你的唇间滑出，继续让乳汁滴落在你的脸上和胸前，趁着这个借口依偎在幸福的龙怀里。");
            outputText("[pg]烬停止了[Ember eir]的哼唱，叹了口气；一半是如释重负，一半是失望。[say: 好了？你喝够了吗？]");
            outputText("[pg]你向[Ember em]承认你已经饱了，并感谢[Ember em]分享了美味的乳汁。");
            outputText("[pg]烬无法掩饰[Ember eir]脸上那抹淡淡的微笑。当你感觉到肚子上有一阵尖锐的刺痛时，你轻声叫了一下；当你再次感觉到时，你" + (littleEmber() ? "向后靠，远离你腿上的小" + emberMF("男孩","女孩") : "从烬的腿上跳起来") + "，露出了戳你的带爪子的手指。[say: 这是对你刚才逗我的报复。别以为你每次要求我都会喂你我的奶，] [Ember ey]说完，吐出一小口烟。");
            outputText("[pg]你忍不住指出，[Ember ey]显然很乐意让你喝个够，而且你也没听到[Ember eir]在打呼噜时有什么抱怨。在[Ember ey]反驳之前，你转身离开了龙的巢穴。");
            outputText("[pg]你喝的饮料对你大有裨益；你感到神清气爽，焕然一新，新的活力在你的血管中流淌。");
            if(get_player().hasStatusEffect(StatusEffects.DragonBreathCooldown))
            {
               get_player().removeStatusEffect(StatusEffects.DragonBreathCooldown);
               outputText("你的喉咙感觉很舒服，抓挠感和酸痛感都消失了；你觉得你可以对着山顶大喊！!");
            }
            get_player().refillHunger(50);
            if(Utils.rand(2) == 0 && get_player().dragonScore() >= 4 && get_player().get_gender() > 0 && (get_player().get_gender() != FlagDict_Impl_.arrayReadInt(KFLAGS.flags,525) || get_player().get_gender() == 3 && FlagDict_Impl_.arrayReadInt(KFLAGS.flags,525) == 3))
            {
               outputText("然而，一阵突如其来的欲望涌过你的");
               if(get_player().hasCock())
               {
                  outputText(get_player().cockDescript(0));
                  if(get_player().hasVagina())
                  {
                     outputText("和");
                  }
               }
               if(get_player().hasVagina())
               {
                  outputText(get_player().vaginaDescript());
               }
               outputText("，让你希望烬没有把你赶走。你现在满脑子想的都是操[Ember eir]；");
               if(get_player().hasCock() && emberHasVagina())
               {
                  outputText("用你的精液填满她的子宫，让她的卵子受精");
                  if(get_player().hasVagina() && FlagDict_Impl_.arrayReadInt(KFLAGS.flags,525) == 3)
                  {
                     outputText("甚至在");
                  }
               }
               if(get_player().hasVagina() && emberHasCock())
               {
                  outputText("把那根坚硬、喷射的肉棒塞进你自己的" + get_player().vaginaDescript(0) + "里");
               }
               outputText("……太迟了，你意识到<b>烬的乳汁让你的龙体进入了");
               if(get_player().hasCock() && emberHasVagina())
               {
                  outputText("发情期");
                  get_player().goIntoRut(false);
               }
               else
               {
                  outputText("发情期");
                  get_player().goIntoHeat(false);
               }
               outputText("！</b>");
            }
         }
         else
         {
            outputText("[pg]听到你的请求，烬的尾巴摇晃了起来，尽管她强装出皱眉的样子，而且你发誓你能看到");
            if(emberHasCock())
            {
               outputText("[Ember eir]肉棒最微弱的痕迹");
               if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,531) == 0 || FlagDict_Impl_.arrayReadInt(KFLAGS.flags,534) > 0)
               {
                  outputText("露了出来");
               }
               else
               {
                  outputText("变硬了");
               }
            }
            else
            {
               outputText("小水珠聚集在她的蜜壶上");
            }
            outputText("。 [say: 好吧……我想我确实需要一些帮助来排空自己，但不许有小动作！]");
            outputText("[pg]你保证你不会尝试任何事情……只要[Ember ey]也保证做到同样的事。");
            outputText("[pg]烬的眉头皱得更深了。 [say: 别傻了！我永远不会那样做！] 烬在巢穴的墙边找了个好地方，一屁股坐在一堆树叶上；然后[Ember ey]张开双臂，邀请般地说，[say: 来吧，我们赶紧把这事办完。]");
            outputText("[pg]你脸上带着灿烂的笑容，走上前坐下，注意到[Ember eir]乳头已经开始滴奶了。你想知道你是应该先和[Ember em]玩玩，还是直接开始吸吮……...");
            outputText("[pg]你不需要疑惑太久；在你的[butt]上那并不单纯的抚摸就是你想要的全部指引。你坏笑着开始" + (littleEmber() ? "抚摸她几乎平坦的胸部" : "揉捏[Ember eir]傲人的双峰") + "，告诉[Ember em]，[Ember ey]一定" + (littleEmber() ? "很高兴能有这样少女般的胸部，没有脂肪块妨碍战斗，也不需要担心下垂或背痛。" : "很自豪能有如此大而圆润，却又如此坚挺，没有丝毫下垂或赘肉的乳房。"));
            outputText("[pg]烬自信地吐出一口烟圈。[say: 当然" + (littleEmber() ? (get_silly() ? "我很自豪。平胸可是地位的象征！" : "。我敢打赌，在这个世界上你找不到几个有这么完美胸部的女孩。") : "我很自豪。我敢打赌你没见过像我这样拥有完美乳房的女孩。") + "]");
            outputText("[pg]你承认" + (littleEmber() ? "她是对的" : "你没见过") + "，然后凑上前去亲吻[Ember eir]渗出乳汁的乳头，将乳头含在唇间，熟练地在唇间滚动滑动，逗弄着它的顶端，品尝着[Ember eir]香甜、清凉、带有天然香料味的乳汁。");
            outputText("[pg]但你现在的重点是和你的龙玩耍，而不是单纯地喝奶，所以你的一只手有目的地伸向");
            if(emberHasCock())
            {
               outputText(emberMF("他","她") + "勃起的龙根，轻轻抚摸它");
               if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,531) == 0 || FlagDict_Impl_.arrayReadInt(KFLAGS.flags,534) > 0)
               {
                  outputText("奇特隆起、几乎像鳞片一样的");
               }
               outputText("表面");
            }
            else
            {
               outputText("她轻轻滴水的" + (littleEmber() ? "小穴" : "阴户") + "，滑入阴唇之间抚摸湿润的内部");
            }
            outputText("。");
            outputText("[pg]烬抓着你[butt]的手猛地收紧。[say: 你在——啊！做什么？]");
            outputText("[pg]你装出一副无辜的样子，开始认真地吸吮，同时你的手继续");
            if(emberHasCock())
            {
               outputText("抚摸[Ember eir]肉棒");
            }
            else
            {
               outputText("温柔地探入她湿滑的深处");
            }
            outputText("。烬扭动着呻吟，轻声哼唱，而你则吸吮逗弄，既享受着你给予的快感，也享受着顺着你干渴的喉咙流下的美味乳汁。");
            outputText("[pg][say: 所——所以就是这样，是吧？]烬突然把你的头拉起来，直接吻上你的嘴唇，强行将[Ember eir]舌头伸进你的嘴里，舔舐[Ember eir]自己的乳汁。当[Ember ey]确定[Ember ey]把所有的都舔干净后，烬再次" + (littleEmber() ? "放开你" : "把你放下") + "。");
            outputText("[pg][say: 如果你不乖乖的，那就没有奶喝了。]龙得意地笑了。");
            outputText("[pg]" + (littleEmber() ? "看着顺着她下巴滴落的乳汁" : "在你被[Ember ey]放下的地方重新调整姿势以获得更好的舒适度") + "，你微笑着换上你最无辜的表情，然后继续喝奶。");
            outputText("[pg]这一次，你专注于单纯地从烬" + (littleEmber() ? "小巧" : "丰满") + "的乳房中吸吮，品尝[Ember eir]乳汁的美妙滋味。你觉得你永远都不会厌倦这个……这乳汁香甜、清爽，还带有一点点辛辣。你忍不住将它与[Ember em]进行比较，发现它们是如此相似。");
            outputText("[pg]伴随着每一次吸吮的轻柔呼噜声，以及在你身上轻柔的抚摸，让你越来越靠近这两座充满烬风味的宝库，这一切都进一步提升了整个体验。");
            outputText("[pg]最终，随着你的胃被填满，你停止了吞咽那浓郁、源源不断、奶油般的龙乳。");
            if(get_player().hasStatusEffect(StatusEffects.DragonBreathCooldown))
            {
               get_player().removeStatusEffect(StatusEffects.DragonBreathCooldown);
               outputText("你的喉咙感觉很舒服，抓挠感和酸痛感都消失了；你觉得你可以对着山顶大喊！!");
            }
            outputText("你告诉你的龙你已经完事了。你站起身，正准备转身离开时，一条尾巴缠住了你的腰，拦住了你。");
            outputText("[pg][say:你现在哪儿也别想去。你还有一个乳房没吸空呢。] 烬微笑着，尽管[Ember eir]脸上带着嘲弄般严厉的表情。");
            if(get_player().cor < 50)
            {
               outputText("[pg]你看着[Ember em]，尽管你的肚子发出了微弱的抗议，但你觉得不能让这个龙" + emberMF("男孩","女孩") + "失望。而且，你也清楚[Ember eir]的脾气……你重新调整好姿势，开始吸吮[Ember eir]的另一只乳房。");
               outputText("[pg][say: 啊！真舒服……]烬紧紧地抱住你，让你尽可能地贴近[Ember em]。你含着乳头微笑着，享受着这种感觉，慵懒地吮吸着[Ember em]，与其说是为了解渴，不如说是为了延长与这只毛茸茸的奇特龙亲近的借口。");
               outputText("[pg]等你完事的时候，烬已经融化成了一滩发出呼噜声的软泥，满足于只是" + (littleEmber() ? "依偎在你的腿上" : "让你坐在[Ember eir]腿上") + "。[say: 别以为这感觉很好，我就会让你想做就做。]");
               outputText("[pg]你告诉[Ember em]你绝不会有这种想法，并趁着[Ember eir]防备松懈时偷亲了[Ember em]一下。就在你这么做的时候，你的肚子开始绞痛，试图消化那些难以处理的乳汁，但却失败了，乳汁开始变质。你待会儿肯定会生病的，这是毫无疑问的……...");
               if(get_player().get_tou() > 40)
               {
                  dynStats(DynStat.Tou(-1));
               }
            }
            else
            {
               outputText("[pg]哦，这简直是……当你考虑到要喝下比预期多一倍的量时，你的肚子发出了抗议的咕噜声。你并不想因为未消化的乳汁在肠胃里凝结而呕吐，所以你只是做出了再次" + (littleEmber() ? "把烬拉进你的" : "把自己放低到烬的") + "大腿上的动作，并把乳头含进嘴里。");
               outputText("[pg]乳汁立刻开始流出，你又把乳头吐了出来，引来了你爱人的惊呼。[say: 嘿，我刚才说什么来着？]这头龙质问道。[say: 把你的饮料喝完！]相反，你开始拉扯和揉捏那" + (littleEmber() ? "小巧的乳房" : "乳房，将乳头指向地面") + "，并尽可能地挤奶" + (littleEmber() ? "，让乳汁顺着她孩子般的身体滴落" : "") + "。[say: 你-你在浪费它！快停下！]尽管嘴上抗议，烬还是发出了娇喘，就像刚才被你的嘴巴弄得神魂颠倒一样，现在也被你的双手弄得欲罢不能。");
               outputText("[pg][say: 好了，好了，]你告诫道。[say: 我不可能把你所有的恩赐都喝光；我只是在考虑压力的问题。]你灵巧地抽动和捏弄着那个小凸起，将乳汁喷射到烬屁股下面的水坑里。");
               outputText("[pg][say: 别-别以为我同意你这样浪费我的奶水，][Ember ey]反驳道，在一次特别用力的拉扯下，[Ember eir]眼角泛起了泪花。[say: 我只是……不想感觉两边不对称，那样太尴尬了！这会让我飞起来很奇怪……]");
               outputText("[pg]是啦，是啦。你吸干了第二只乳房，然后" + (littleEmber() ? "俯下身" : "抬起它") + "，在敏感的乳头上印下一吻。");
            }
            get_player().refillHunger(50);
            outputText("[pg]烬变得如此慌乱，以至于[Ember ey]只是在震惊的沉默中盯着你，带着傻乎乎的笑容。[say: 什……你知道，说什么都没用。我知道你以后还会偷偷找机会这样做的……但这并不意味着我以后抓到你时不会让你付出代价。]");
            outputText("[pg]你在她耳边低语，说你很期待，然后轻轻地" + (littleEmber() ? "把[Ember em]从你的腿上滑下来" : "从[Ember eir]腿上站起来") + "准备离开。");
            if(Utils.rand(2) == 0 && get_player().dragonScore() >= 4 && get_player().get_gender() > 0 && (get_player().get_gender() != FlagDict_Impl_.arrayReadInt(KFLAGS.flags,525) || get_player().get_gender() == 3 && FlagDict_Impl_.arrayReadInt(KFLAGS.flags,525) == 3))
            {
               outputText("然而，一阵突如其来的欲望涌过你的");
               if(get_player().hasCock())
               {
                  outputText(get_player().cockDescript(0));
                  if(get_player().hasVagina())
                  {
                     outputText("和");
                  }
               }
               if(get_player().hasVagina())
               {
                  outputText(get_player().vaginaDescript());
               }
               outputText("，让你希望烬没有把你赶走。你现在满脑子想的都是操[Ember eir]；");
               if(get_player().hasCock() && emberHasVagina())
               {
                  outputText("用你的精液填满她的子宫，让她的卵子受精");
                  if(get_player().hasVagina() && FlagDict_Impl_.arrayReadInt(KFLAGS.flags,525) == 3)
                  {
                     outputText("甚至在");
                  }
               }
               if(get_player().hasVagina() && emberHasCock())
               {
                  outputText("把那根坚硬、喷射的肉棒塞进你自己的" + get_player().vaginaDescript(0) + "里");
               }
               outputText("……太迟了，你意识到<b>烬的乳汁让你的龙体进入了");
               if(get_player().hasCock() && emberHasVagina())
               {
                  outputText("发情期");
                  get_player().goIntoRut(false);
               }
               else
               {
                  outputText("发情期");
                  get_player().goIntoHeat(false);
               }
               outputText("！</b>");
            }
         }
         emberAffection(1);
         if(emberAffection() < 75)
         {
            dynStats(DynStat.Lust(20));
         }
         get_player().changeFatigue(-50);
         get_player().slimeFeed();
         get_player().HPChange(get_player().maxHP() * 0.33,false);
         doNext(get_camp().returnToCampUseOneHour);
      }
      
      public function getKnockedUpByEmbrahBroBaby() : void
      {
         var emberPregged:Boolean;
         var _g:EmberScene;
         clearOutput();
         outputText("烬抓住你，把你翻来覆去，用[Ember eir]" + (littleEmber() ? "娇小的身体" : "体重") + "将你压在身下，同时亲吻着你。你任由这只龙将你压在[bed]上，双手抚摸着");
         if(littleEmber())
         {
            outputText("[Ember eir]光滑平坦的胸部");
         }
         else if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,525) == 1 && FlagDict_Impl_.arrayReadInt(KFLAGS.flags,529) == 0)
         {
            outputText("他平坦结实的胸膛");
         }
         else
         {
            outputText("[Ember eir]柔软好捏的乳房");
         }
         outputText("并享受着这个吻。你胆子大了起来，把舌头探进[Ember eir]嘴里，想看看[Ember ey]会有什么反应。");
         outputText("[pg]烬没有反抗，挺起[Ember eir]胸膛迎向你的双手，用[Ember eir]自己的舌头吸吮你的舌头，同时探索着你的口腔。伴随着一声湿润的<b>吧唧</b>声，烬结束了这个吻。[saystart]什么都不用担心……我会确保我们俩都能享受这一切，到最后，你会被");
         if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,530) == 0)
         {
            outputText("小龙");
         }
         else
         {
            outputText("龙蛋");
         }
         outputText("填满的，我的美人。[sayend] 烬继续亲吻着你；[Ember eir]双手在你身上游走，仿佛在通过触摸描绘你的身体，寻找最适合抚摸和挑逗的地方。");
         outputText("[pg]你试图在这个过分热情的" + (littleEmber() ? "未成年" : "龙族") + "情人面前保持自我，抚摸着[Ember eir]布满鳞片的四肢，试图发现[Ember eir]性感带在哪里，以便让[Ember em]知道什么是欲求不满、苦苦哀求的滋味。你能感觉到下腹燃烧的欲火，你的[vagina]里有一团湿润、准备就绪的火焰；你准备好被播种了，让你的肚子被烬的精液填满，直到你的子宫里塞满");
         if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,530) == 0)
         {
            outputText("小龙");
         }
         else
         {
            outputText("龙蛋");
         }
         outputText("。你想要被播种！!");
         if(get_player().hasCock())
         {
            outputText("[pg]烬游走的一只手找到了你勃起的[cock biggest]并开始套弄，完全不在意你把前列腺液抹在[Ember eir]身上。同时，烬的另一只手开始抚摸你的大腿，哄骗你张开双腿，然后将[Ember eir]坚硬如铁的肉棒对准你饥渴的[vagina]。");
         }
         else
         {
            outputText("[pg]烬游走的双手停留在你的大腿上，哄骗你张开双腿，然后将[Ember eir]坚硬如铁的肉棒对准你饥渴的[vagina]。");
         }
         outputText("你喉咙里发出一声低吼，渴望在你体内燃烧，你开始试图在烬的肉棒上摩擦自己。" + emberMF("他","她") + "却把你按住，让你除了用[Ember eir]龟头摩擦你饥渴的阴唇之外，什么也做不了。");
         outputText("[pg]幸运的是，这条龙[Ember emself]似乎和你一样兴奋，准备就绪。[say: 你太火辣了，我能感觉到你的肉体在我身上燃烧。我……我忍不住了！] [Ember ey]在喉咙深处低吼。");
         outputText("[pg]烬的第一次挺进有些笨拙，没有命中目标，而是在你的阴唇上摩擦；你几乎要咒骂这个" + (littleEmber() ? "孩子" : "龙") + "糟糕的瞄准，但幸运的是[Ember eir]第二次挺进准确无误，当你感觉到烬锥形的肉棒进入你收缩的肉壁时，你如释重负地叹了口气，它在跳动，按摩着你的内脏，就像你努力按摩[Ember eir]自己的肉棒一样。你们在亲吻间交换着欢愉的呻吟，当[Ember ey]用[Ember eir]整个身体摩擦你时，烬隆隆的呼噜声按摩着你的[chest]。你短暂地睁开眼睛，凝视着[Ember eirs]；你几乎要高潮了。烬的眼睛闪烁着情欲的光芒，燃烧着原始的、本能的渴望……...");
         get_player().cuntChange(littleEmber() ? 10 : 20,true,true,false);
         if(emberHasVagina())
         {
            outputText("[pg]你身下的[bed]变得越来越湿滑，因为润滑液从这条双性龙被冷落的阴户中流出，她的尾巴疯狂地甩动着，然后滑入湿润的孔洞，以帮助刺激她完成让你怀孕的目标。");
         }
         else
         {
            outputText("[pg]");
         }
         outputText("你喉咙里发出一声低吼，感觉到同样的渴望在你体内燃烧。你紧紧抓住这条龙，手指深深地抓进[Ember eir]布满鳞片的四肢，当你拖拽、刮擦、并在[Ember em]身上摩擦时");
         if(get_player().hasCock())
         {
            outputText("，你被冷落的[cock]流出前列腺液，随着你的每一个动作，涂抹在你的肚子和[Ember eirs]身上");
         }
         outputText("。天哪，你能感觉到[Ember em]正在填满你……...");
         outputText("[pg]烬每一次抽插都伴随着喘息和低吼，直到[Ember ey]发出一声咆哮，紧紧抓住你的臀部，尽[Ember ey]所能地深深刺入，然后将[Ember eir]精液射入你的子宫深处。[say: 啊！全、全收下吧！]烬呻吟着。");
         outputText("[pg]虽然你别无选择，但你很乐意接受，任由龙那清凉、令人精神振奋的精液涌入你滚烫的阴户，淹没你那隐隐作痛、<i>渴望着</i>的子宫。你发出空洞而愉悦的呻吟；感觉太棒了……但这还不够，你想要更多，你告诉龙，[Ember ey]还没完事呢。");
         outputText("[pg][say: 当然没有……]烬咧嘴一笑。[say: 只要给我几……呼……几分钟恢复一下。]");
         outputText("[pg]你发现自己因沮丧而咆哮，露出牙齿——几分钟可不行！你需要更多，而且现在就要！你猛地一动，撞向龙，试图把[Ember em]推倒，这样你就可以骑到[Ember em]身上了。");
         outputText("[pg]你很快就骑在了这头惊愕的龙身上。你带着色欲的冷笑告诉[Ember em]，你现在就要[Ember em]，而不是几分钟后，并开始扭动和挺送你的臀部，清楚地表明你要得到你想要的，即使这意味着要带着烬一起享受。");
         outputText("[pg][say: 啊！你要占据主动吗？哦！好吧，但是……啊！……只有这次。]烬躺下，轻轻挺动以迎合你对[Ember eir]阴茎的撞击，喘息和呻吟声伴随着湿润的拍打声充满了[cabin]。");
         outputText("[pg]你没有理会，而是细细品味着[Ember eir]" + (littleEmber() ? "" : "又长") + "又粗的肉棒在你饥渴的阴户里的感觉，用这个世界赋予你的所有本能和经验去挤压和收缩。嗯……那节段状的隆起以最美妙的方式摩擦着你的内壁……你喉咙里发出渴望的呻吟，像一个着魔的" + get_player().mf("扶她","女人") + "一样狂热地骑着龙；你想怀孕……你<b>必须</b>怀孕！!");
         outputText("[pg]在最原始的本能驱使下，你开始试图哄骗烬更用力地干你；[Ember ey]不想当父亲吗？[Ember ey]不想让你怀上[Ember eir]后代吗？还是说[Ember ey]宁愿你去荒野，冒着让你那成熟、准备好的子宫被某个堕落怪物占便宜的风险？看着你挺着大肚子在营地里闲逛，里面怀着一窝小恶魔或者野兽般的牛头人幼崽，而不是一条新龙，烬自己的血脉？");
         outputText("[pg]你的话似乎达到了预期的效果；因为就在你刚说完不久，烬就把你和[Ember em]一起抱进了[Ember eir]怀里。" + emberMF("他","她") + "用重新燃起的火焰深深地看着你的眼睛。[say: 绝不，]烬说着，深深地吻了你，开始肆无忌惮地在你体内抽插。这就是你一直在等待的。终于！!");
         outputText("[pg]烬粗暴的抽插震撼着你的核心，让阵阵快感传遍你的全身。" + emberMF("他","她") + "热情地吻着你，吸吮着你的舌头，品尝着你的味道。你喘息着，颤抖着，同样粗暴地回击，努力抓住并吸吮龙那非人般修长灵活的舌头，这样你也能品尝到[Ember eir]味道。");
         if(emberHasVagina())
         {
            outputText("[pg]你听到淫水溅在湿润铺盖上的声音；烬的高潮带着新的活力再次涌现。");
         }
         else
         {
            outputText("[pg]");
         }
         outputText("新的一股龙精冲入你过度充盈的体内，在你的[cabin]里四处飞溅；令你惊讶的是，烬继续在你体内抽插，丝毫没有减速。甚至当你在亲吻中呻吟时，第三次高潮冲入你的体内，用肥沃的龙种填满了你的肚子。");
         outputText("[pg]你现在离得那么近……那么近！你的手下意识地伸向烬的手，试图与那个你深知即将成为你孩子父亲的" + emberMF("雄性","扶她") + "十指紧扣。你结束了亲吻，仰起头对着天空呻吟，终于达到了高潮。");
         if(get_player().hasCock())
         {
            outputText("[pg]你射在你们的胸膛和肚子上，用你浓稠的精液将你和龙粘在一起。");
         }
         else
         {
            outputText("[pg]");
         }
         outputText("你收缩的内壁挤压着龙敏感的阴茎，试图从你气喘吁吁的龙情人那里榨出更多的种子。[say: 是、是时候了，]烬咕哝着，倒在你湿润的铺盖上，深深地刺入你的体内。");
         outputText("[pg]当你感觉到被蹂躏的阴户压力增加时，你喘着粗气，意识到那是烬的肉结！它在肿胀！肉结如此美妙地填满了你，你忍不住又释放了一波体液，直到烬将你堵住，把你们俩锁在一起。");
         outputText("[pg]你能感觉到。烬继续用缓慢但稳定的精液流填满你。你短暂地想知道这个" + (littleEmber() ? "小孩子" : "龙") + "怎么能在[Ember em]体内装下这么多精液，但最终你决定那不重要，在筋疲力尽的龙身上放松下来，享受这短暂的亲密。");
         outputText("[pg]烬叹了口气，一只手揉着你的背，另一只手紧紧地抱着你。");
         outputText("[pg][say: 别以为这样我们就是正式伴侣了，]烬在你耳边低语。你抬起头，看着[Ember eir]");
         if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,531) == 1)
         {
            outputText("红扑扑的");
         }
         outputText("脸。[say: 但如果你非要知道的话，我确实爱你。]伴随着最后一声叹息，烬在你的[bed]上躺下，准备小睡一会儿。");
         outputText("[pg]感觉到[Ember eir]肉结仍然肿胀着，将你们俩紧紧地连在一起，你轻叹一声，和这条龙一起躺下休息，估计大约一个小时后就能重获自由。与此同时，你很满足于就这样紧紧地抱着[Ember em]，一只手抚摸着你被精液胀满的肚子。你几乎敢发誓，你能感觉到龙族那充满活力的精液正在起作用，那冰凉的生命之液淹没了你燃烧的繁殖欲望，并且已经开始孕育一个新的");
         if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,530) == 0)
         {
            outputText("龙宝宝");
         }
         else
         {
            outputText("龙蛋");
         }
         outputText("。你打了个哈欠，蜷缩在龙的身边，也准备小睡一会儿。");
         get_player().orgasm("Vaginal");
         dynStats(DynStat.Sens(-2));
         get_player().knockUp(17,336,0,0,emberIsHerm());
         get_player().createStatusEffect(StatusEffects.EmberFuckCooldown,36,0,0,0);
         _g = this;
         emberPregged = false;
         doNext(function():void
         {
            _g.emberBreedingAfterMathWatchOutForRadioactiveFallout(emberPregged);
         });
      }
      
      public function getEatenOutByEmbra() : void
      {
         clearOutput();
         get_images().showImage("ember-eats-your-vagoo-out");
         outputText("你想到烬长长的舌头和它肯定具有的许多优势，突然有了一个主意。你问" + (littleEmber() ? (get_silly() ? "你的" + emberMF("正太龙","萝莉龙") : "小" + emberMF("男孩","女孩")) : "烬") + "，[Ember ey]是否愿意用[Ember eirs]舌头来舔你的小穴。");
         if(emberAffection() <= 25)
         {
            outputText("[pg][say: 没门！我才不知道那里有什么！而且，那太恶心了！] 烬转过身，径直走开了。");
            doNext(get_camp().returnToCampUseOneHour);
            return;
         }
         if(emberAffection() < 75)
         {
            outputText("[pg][say: 我宁愿不。你为什么不想点能让我们俩都感觉舒服的事情呢？] 烬建议道，出奇地平静。");
            emberSexMenu(false);
            return;
         }
         outputText("[pg][say: 我想我可以那样做……如果你好好求我的话……] 烬回答道，尽管[Ember eir]肢体语言表明[Ember ey]非常渴望品尝你的味道。");
         outputText("[pg]你决定顺水推舟，礼貌地问[Ember ey]是否愿意用[Ember eir]那长长、灵活的龙舌来取悦你的" + (get_player().isChild() ? "" : "女人") + "花瓣，同时给了[Ember em]一个火热的眼神，并挑逗地扭动了一下你的[hips]。烬看着你那诱人的身姿，紧张地咽了口唾沫。[say: 既然你这么诚恳地请求了……那好吧……跟我来。] " + emberMF("他","她") + "抓起你的一只手，急匆匆地把你拉到一个更隐蔽的地方。");
         outputText("[pg]当烬确认你们不会被偷窥后，[Ember ey]转过头看着你，贪婪地注视着你的身体，用一种混合着敬畏和欲望的眼神打量着你。烬张开[Ember eir]嘴想说些什么，但却说不出话来，最后[Ember ey]只是轻声喘息着。烬拉近了你们之间的距离，跪在你面前，开始解开你的[armor]，用颤抖的双手剥去你下半身的衣物。");
         outputText("[pg]你看着[Ember em]因兴奋而明显颤抖的样子，对这条龙露出了一个捕食者般的笑容，心想这可绝对不是村里流传的巨龙与少女的故事。你自信地走到一棵树前，在它面前站定，向后靠在树上作为支撑");
         if(!get_player().hasTailInsteadOfLegs())
         {
            outputText("，将你的[legs]大大地张开");
         }
         outputText("，展示出你的[vagina]。你告诉烬，接下来就看[Ember ey]的了，同时微笑着看着[Ember ey]。");
         outputText("[pg]这只" + (littleEmber() ? "小" : "") + "龙向你爬来，轻轻地将[Ember eir]鼻子靠近你那湿润的穴口，嗅着你散发出的女性气息");
         if(get_player().hasCock())
         {
            outputText("，以及你那流着口水的肉棒散发出的麝香味");
         }
         outputText("。烬闭上眼睛，品味着你的气味，将其铭记在心，并舔了舔[Ember eir]嘴唇，为接下来的任务做准备。");
         outputText("[pg]终于决定开始[Ember eir]任务，这条龙从上到下舔舐着你湿润的缝隙，中途停下来亲吻你的[clit]。[say: 太棒了……]你听到烬低语，然后[Ember ey]突然将[Ember eir]舌头探入你温暖的深处，探索着每一个角落，让你感到无比愉悦。");
         outputText("[pg]你颤抖着呻吟，感觉到你的汁液从你的女性部位滴落到龙的舌头上");
         if(get_player().hasCock())
         {
            outputText("，而[eachcock]也开始冒出前列腺液");
         }
         outputText("。你高兴地扭动着，赞美烬舌头的技巧，并乞求[Ember em]继续。");
         outputText("[pg]烬继续动作，用[Ember eir]鼻子轻蹭你的敏感豆，并将你的[vagina]包裹进[Ember eir]");
         if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,531) == 0)
         {
            outputText("嘴里");
         }
         else
         {
            outputText("嘴里");
         }
         outputText("，亲吻着你不断收缩的肉穴，仿佛那是久别重逢的恋人，将[Ember eir]的舌头越探越深，仿佛想要直达你的子宫。");
         outputText("[pg]你嚎叫着哭泣，随着你的" + (littleEmber() ? "未成年" : "") + "龙忙碌地吞噬着你的女性部位而扭动，你发现自己滑到了地上，这样你就可以用你的[legs]环绕住烬的脖子，把[Ember eir]脸紧紧贴在你的小穴上。你渴望感觉到龙用[Ember eirs]那长长、蠕动、湿润的舌头填满你，你命令[Ember em]舔得更深。");
         outputText("[pg]没有抗议，只有顺从，烬的舌头开始拍打你的子宫颈，要求进入你最深处的圣所。你试图坚持，但这是一场必败的战斗；烬的舌头就像一根奇妙的长而细的肉棒，不仅灵活，而且自带天然润滑剂。当高潮震撼你时，你大叫起来，");
         if(get_player().wetness() >= 4)
         {
            outputText("溅湿了");
         }
         else
         {
            outputText("浸透了");
         }
         outputText("用你充满雌性气息的蜜汁喷溅在烬的脸上");
         if(get_player().hasCock())
         {
            outputText("甚至当[eachcock]将精液喷洒在全神贯注的龙身上时");
         }
         outputText("。");
         outputText("[pg]你的汁液在龙舌的引导下流入烬等待着的嘴里，[Ember ey]非常乐意地喝下，并尽[Ember eir]最大努力不浪费一滴。");
         if(get_player().wetness() >= 4)
         {
            outputText("然而，你喷射出的汁液让这成为一项不可能完成的任务。烬似乎并不在意，即使[Ember eir]的脸完全被你的淫水覆盖。");
         }
         outputText("[pg]最后，伴随着几声呻吟和空洞的喘息，你瘫倒在地，彻底筋疲力尽。你的[legs]松开了烬的脖子，你的肌肉被被狠狠操过后的美妙麻木感所淹没。你虚弱地称赞烬舔穴的技巧。");
         outputText("[pg]烬尽[Ember ey]所能地舔舐[Ember eir]自己的脸，确保[Ember ey]完全干净。你的称赞让烬的眼中闪过一丝骄傲的光芒，[Ember ey]向你投来尴尬的目光。[say: 嗯……谢谢，我想。只是别习惯了！] [Ember ey]在转身离开前，又带着一阵新的反抗补充道。");
         outputText("[pg]你漫不经心地告诉[Ember em]，你当然希望不要习惯；如果你习惯了，那就不好玩了。烬转过身，愤愤不平地朝你的方向喷出一口烟，然后继续[Ember eir]的路。");
         outputText("[pg]你微笑着，" + (littleEmber() ? "看着这个可爱的小" + emberMF("男孩","女孩") + "离开时的屁股" : "讨厌看到[Ember em]走，但又那么喜欢看着[Ember em]离开") + "。摆脱了你愉快的幻想，你设法让自己重新站直，穿好衣服，然后回到营地。");
         get_player().orgasm("Vaginal");
         doNext(get_camp().returnToCampUseOneHour);
      }
      
      public function fuckOffEmberIWantANap() : void
      {
         clearOutput();
         dynStats(DynStat.Lust(10 + get_player().lib / 10));
         outputText("哦，你的");
         if(get_player().hasVagina())
         {
            outputText("[vagina]");
         }
         if(get_player().get_gender() == 3)
         {
            outputText("和");
         }
         if(get_player().hasCock())
         {
            outputText("[eachCock]");
         }
         outputText("如此渴望");
         if(get_player().get_gender() == 1 || get_player().get_gender() == 2)
         {
            outputText("");
         }
         outputText("接受烬的提议！……但你比这更好；你不是什么无脑的野兽，不是欲望的奴隶。你压下啃噬着你的性欲，告诉烬你不想操[Ember em]。");
         outputText("[pg]烬听到你的话后呜咽起来。[say: 你、你难道看不出你对我做了什么吗？来嘛，[name]，就快活一下！]烬恳求道。");
         outputText("[pg]你告诉[Ember em]你很抱歉，但你不想生孩子——至少现在不想。如果你们现在做爱，那就一定会发生这种事。");
         if(littleEmber())
         {
            outputText("而且，[Ember ey]自己也还是个孩子。");
         }
         outputText("[pg]烬低吼一声，把你转过身来，直接夺走了你的吻。[say: 我讨厌你……你……你这个性感的野兽！]说完，[Ember ey]展开翅膀飞向天空，因为[Ember eir]" + emberGroinDesc("突出的肉棒","湿透的阴道") + "，[Ember ey]几乎无法直线飞行。毫无疑问，[Ember ey]是去自己解决[Ember eir]需求了。你怀疑等[Ember eir]头脑清醒后，[Ember ey]会不会高兴……不过，[Ember ey]会克服的。");
         emberAffection(-10);
         if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,523) < 75 && FlagDict_Impl_.arrayReadString(KFLAGS.flags,701) == "Ember")
         {
            FlagDict_Impl_.arrayWriteString(KFLAGS.flags,701,"");
         }
         get_player().createStatusEffect(StatusEffects.EmberFuckCooldown,12,0,0,0);
         doNext(playerMenu);
      }
      
      public function frottingWithFrottingEmberHerm() : void
      {
         clearOutput();
         outputText("你考虑了一下，然后慢慢地用你的[cock biggest]摩擦烬的阴茎来回答她的问题。扶她龙喘了口气，然后淫荡地对你笑了笑。");
         frottingWithEmber(false);
      }
      
      public function frottingWithEmber(param1:Boolean = true) : void
      {
         var _loc2_:int = get_player().biggestCockIndex();
         if(param1)
         {
            clearOutput();
         }
         else
         {
            outputText("[pg]");
         }
         outputText("烬在你的肉棒上摩擦着；[Ember eir]阴茎上的纹路刺激着你的" + get_player().cockDescript(_loc2_) + "，你舒服得呻吟起来。[say: 来吧，[name]。你打算让我做所有的工作吗？][Ember ey]戏弄你。你慢慢地在[Ember eirs]的肉棒上摩擦着你的肉棒，问[Ember ey]心里在想什么；[Ember ey]不是打算休息一下吗？");
         outputText("[pg][say: 我随时准备取悦我的伴侣……而且，我们互相摩擦的时候我还能抱着你，]烬说着，把你抱进怀里，紧紧地贴着[Ember eir]自己，把你们的肉棒挤在一起。");
         if(get_player().get_gender() == 1 && FlagDict_Impl_.arrayReadInt(KFLAGS.flags,525) == 1)
         {
            outputText("[pg][say: 有时候我想知道其他龙会怎么说……我本该在玛瑞斯繁衍和生育新一代的龙。然而我却在这里和一个男人鬼混……]他冲你坏笑。[say: 但我才不在乎呢，我太爱你了，不能再让这事困扰我了……而且也许如果我们非常努力的话，你还能让我怀孕？或者你更希望我让你怀孕？]你翻了个白眼，吻了他，但这并没有抹去他脸上的坏笑。");
         }
         outputText("[pg]你们俩紧紧地贴在一起，刺激着你敏感的阴茎，让你忍不住在你们俩的肚子上流下预精。然而，烬比你快得多。" + emberMF("His","Her") + "肉棒滴下润滑液，润滑了你们的肚子，缓解了你们肉棒之间的接触，让你更容易在[Ember eir]身上摩擦。");
         outputText("[pg][say: 嗯……对……用我的肉棒让你自己高潮。也让我高潮，你这性感的野兽，你。]龙");
         if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,531) > 0)
         {
            outputText(emberMF("男孩","女孩"));
         }
         outputText("过长的舌头伸了出来，快感压倒了[Ember eir]的感官。当你把肉棒在烬的肉棒上滑动时，你呻吟着，想到当不可避免的事情发生时，这将会变得非常混乱，但你太不知所措了，无法说出口。");
         outputText("[pg]仿佛看穿了你的心思，烬说：[say: 尽情享受吧，别担心会弄脏。我稍后会清理一切。啊！而且，清理伴侣的身体是龙的责任。]你建议说，享受制造混乱也是龙的乐趣。");
         outputText("[pg]烬不再浪费时间闲聊，[Ember ey]紧紧地拥抱着你，开始在你们滑溜溜的肚子上真正地摩擦，不在乎[Ember eir]的预精似乎在你们俩之间汇聚。");
         if(emberHasVagina())
         {
            outputText("她湿润的龙穴对这混乱的局面毫无帮助。你能闻到她的爱液和预精混合在一起的味道。");
         }
         outputText("[pg]你配合着龙的动作，一次又一次地摩擦，轻柔地呻吟着；这不像操一个洞，但它肯定也有它的魅力。你能感觉到那种美妙的压力第四次在你体内积聚，你喘息着告诉烬高潮快到了。[say: 别憋着……][Ember ey]低语着，深深地吻了你。");
         outputText("[pg]伴随着呻吟和喘息，你照[Ember ey]说的做了，让快感席卷全身，把精液洒在龙的肚子上，随着火花穿过你的神经而抽搐。烬结束了亲吻，咆哮着，[Ember eir]自己的肉棒也加入了你的行列，把你们俩的肚子弄得一团糟。当你体内的最后一滴精液流出时，你如释重负地叹了口气，本能地依偎在你龙族情人黏糊糊的身体上，把[Ember eir]抱得更紧，你高潮的最后一滴精液渗出，把你们俩都涂满了精液。");
         outputText("[pg]烬松开拥抱，向后退去，靠在巢穴的墙上。你一直看着[Ember em]，" + emberMF("his","she") + "从[Ember eir]自己的身体上舀起一些你的精液，用它来摩擦[Ember em]自己，进入另一次较弱的高潮。几股微弱的精液从[Ember eir]锥形的尖端喷出，无力地落在[Ember em]面前的地上。");
         if(emberHasVagina())
         {
            outputText("她的另一只手在从高潮中恢复过来时抚摸着她的阴部，喷出女性的汁液，并漏出一些你之前射入她体内的精液。");
         }
         outputText("[pg]龙");
         if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,531) > 0)
         {
            outputText(emberMF("男孩","女孩"));
         }
         outputText("用[Ember ey]仅存的力气爬到你身边，滑回你的双臂之间。[say: 抱歉，我只是必须把最后一点排出去。]" + emberMF("He","She") + "大声打了个哈欠。[say: [name]？小睡一会儿怎么样？]" + emberMF("He","She") + "问道，甚至懒得听你的回答，疲惫就抓住了[Ember eir]，[Ember ey]睡着了，发出轻微的鼾声。你对[Ember em]微笑，抚摸着" + emberMF("his","her"));
         if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,528) == 0 && FlagDict_Impl_.arrayReadInt(KFLAGS.flags,531) == 0)
         {
            outputText("头");
         }
         else if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,528) == 2)
         {
            outputText("鬃毛");
         }
         else
         {
            outputText("头发");
         }
         outputText("，然后你也让自己进入了梦乡。");
         get_player().orgasm("Dick");
         if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,529) > 0)
         {
            get_player().refillHunger(25);
         }
         menu();
         addButton(0,"继续",emberJizzbangbangEnding);
      }
      
      override public function followerEmber() : Boolean
      {
         return FlagDict_Impl_.arrayReadInt(KFLAGS.flags,524) > 0;
      }
      
      public function findEmbersEgg() : void
      {
         clearOutput();
         if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,538) == 0)
         {
            outputText("你发现了一个部分隐藏在长满青苔的植被后面的洞穴入口，决定去调查一下。");
            outputText("[pg]洞穴的地面非常潮湿，地上生长的青苔让它变得格外湿滑。不幸的是，尽管你眯着眼睛想看清里面，但几乎没有摩擦力的地面让你失去了平衡，你向后倒向墙壁。你试图抓住坚固的岩壁来稳住自己，但你的手只抓到了空气；墙壁在你眼前消散，你伴随着一声惊呼和一声巨响摔在地上。");
            outputText("[pg]幸运的是，你似乎没有受伤，但你的好奇心被激起了……这面墙是某种幻象吗？你向前看去，看到微小的发光蘑菇照亮了一条明显是人工开凿的小路。由于洞穴的其他地方太暗，你决定沿着这条小路继续前进。");
            outputText("[pg]你继续前进，直到来到一个相当大且光线充足的房间。墙壁似乎是雕刻出来的，而不是切割出来的，中央有一个小神龛，里面放着一个看起来像大蛋的东西……旁边放着一本破旧的小书；也许它能提供答案？你翻开第一页开始阅读。");
            outputText("[pg][say: 亲爱的读者；在你面前的是一个装着我孩子的蛋——我们最后的希望。这个房间被一个强大的结界保护着，旨在击退除了我们自己以外的任何玛瑞斯种族，任何试图闯入这个房间但失败的生物都会受到诅咒。]");
            outputText("[pg][say: 只有同为龙族才能穿过结界，即使在龙族中，也不是所有人都能看穿幻象。为此，我们向你致敬。]");
            outputText("[pg]你惊讶地睁大了眼睛；龙！？这个世界上竟然有龙？你的思绪立刻回到了童年时代关于强大的骑士屠杀凶猛恶龙的故事……如果这条“龙”和故事里的一样，让它孵化出来绝对不是什么好事……另一方面，日记里说它是“最后的希望”。.\"");
            outputText("[pg][saystart]我们被消灭了。某种奇怪的魔法开始把我们的幼崽和未出生的孩子变成畸形、扭曲的小怪物，我们称之为狗头人；它们很弱小，而我们出于骄傲低估了它们。");
            outputText("[pg]它们有能力迅速繁殖，虽然我们可以轻易地解决掉几个，但我们无法对抗它们的大军。");
            outputText("[pg]我们是一小群设法逃脱的人……这个蛋，我们的孩子，是事件发生后出生的最后一个健康的龙宝宝。我们把孩子留在这里，保护它免受外面的邪恶侵害，作为我们确保物种生存的最后一次绝望尝试。");
            outputText("[pg]在这封信之后，是关于我的孩子如何被包裹在这个蛋里，以及你如何释放她……或他的所有笔记。请照顾好我的孩子；我们的命运掌握在你的手中。[sayend]");
            outputText("[pg]正如信中所说，你看到了各种关于蛋是如何创造的以及如何孵化的笔记。你需要进行一个小仪式才能将它从魔法停滞状态中唤醒，并“分享你的精华”来让它孵化。研究笔记指出，通过吸收你的精华，蛋里的生命将孵化成一个合适的伴侣……...");
            outputText("[pg]尽管如此，你真的应该考虑带走这个蛋吗？");
         }
         else
         {
            outputText("你发现了一个部分隐藏在长满青苔的植被后面的熟悉的洞穴入口，决定去证实你的怀疑。");
            outputText("[pg]果然，在穿过熟悉的隧道进行了一段短暂的跋涉后，你发现自己再次站在了那个所谓的“龙蛋”面前。\'.");
         }
         var _loc1_:IMap = KFLAGS.flags;
         FlagDict_Impl_.arrayWriteInt(_loc1_,538,FlagDict_Impl_.arrayReadInt(_loc1_,538) + 1);
         menu();
         addButton(0,"带走",takeEmbersEggHomeInADoggieBag).hint("把蛋带回家。[pg]你最终将能够孵化这个蛋。");
         addButton(1,"摧毁",destroyBabyEmberYouMonster).hint("摧毁这个蛋。（并且可以选择吃掉它）[pg]你为什么要这么做？");
         addButton(14,"离开",leaveEmbersAssOutToDry);
      }
      
      public function embersAppearance() : void
      {
         var _g:EmberScene;
         clearOutput();
         get_images().showImage("ember-examine-appearance");
         if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,531) == 0)
         {
            outputText("烬是一条" + (littleEmber() ? "4英尺4英寸" : "7英尺3英寸") + "高的人形龙，四肢修长柔软，体格健美，肌肉发达。" + emberMF("他","她") + "看起来很强壮" + (littleEmber() ? "，尽管[Ember eir]体型很小" : "且气势逼人") + "，但是");
            if(emberIsMasculine())
            {
               outputText("并没有过度发达的肌肉。");
            }
            else
            {
               outputText("很有女人味。");
            }
            if(emberIsMasculine())
            {
               outputText("[pg]烬的身体是健康男性的完美写照。不瘦也不胖，脂肪量恰到好处，除了");
               if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,529) > 0)
               {
                  outputText("滴着奶水的乳房，");
               }
               outputText("鼻子、翅膀和角之外，他的轮廓就像你村里故事中的王子：英俊潇洒。");
            }
            else
            {
               outputText("[pg]烬的身体" + (littleEmber() ? "很苗条" : "曲线优美") + "，不像你想象的爬行动物那样粗糙，而是圆润的，看起来几乎很柔软，腹部紧绷，有着" + (littleEmber() ? "男孩般" : "完美的沙漏") + "的身材" + (littleEmber() ? "。尽管[Ember eir]体型很小，但[Ember ey]在鳞片下有着轮廓分明的肌肉组织，这让[Ember em]看起来很有力量" : "，这让[Ember em]轮廓就像你村里历史上的亚马逊女战士：美丽而强大。当然，除了翅膀和角") + "。");
            }
            if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,531) == 0)
            {
               outputText("[Ember Eir]脖子从[Ember eir]后脑勺开始，长约两英尺半，比[Ember eir]手臂长约六英寸。[Ember Ey]可以毫不费力地把它弯向[Ember ey]想要的任何方向，并且可以轻松地看到[Ember eir]背部。");
            }
            outputText("[pg]这条龙对衣服嗤之以鼻，对你和恶劣的天气都同样漠不关心，声称[Ember eir]鳞片就是[Ember ey]需要的所有遮蔽物……然而，当你欣赏[Ember eir]身体时，[Ember ey]却很快把它从你游移的目光中隐藏起来。");
            outputText("[pg]" + emberMF("他","她") + "的头是爬行动物的，有着适合捕食者的锋利牙齿，下巴下方有坚硬的隆起。[Ember eir]头部两侧是奇怪的鳍状生长物，隐藏着小孔；你推测这些是龙的耳朵。[Ember eir]头顶上坐落着两对优雅向后弯曲的乌木角；尽管坚硬如钢，但它们的形状不适合用于战斗，而仅仅是为了美观，赋予了烬一种威严的外貌。一条长长的舌头偶尔会滑出来，舔舐[Ember eir]下巴和牙齿。骄傲、凶猛的眼睛，有着狭长的瞳孔和燃烧的橙色虹膜，即使在黑暗中也闪闪发光。");
            outputText("它们带有典型的第二层眼睑，允许[Ember em]眨眼的次数是其他人的两倍。");
            if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,528) == 1)
            {
               if(emberIsMasculine())
               {
                  outputText("短短的");
               }
               else
               {
                  outputText("齐肩的");
               }
               outputText("钢灰色的头发从[Ember eir]头上长出来。你可能会认为长着头发的龙看起来很奇怪，但它实际上很好地衬托了烬的外貌。");
            }
            else if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,528) == 2)
            {
               outputText("沿着[Ember eir]脊柱，长着一圈鬃毛；从[Ember eir]脖子底部开始，一直延伸到[Ember eir]尾巴，在[Ember eir]尾巴尖端形成一小簇。它与[Ember eir]头上的头发颜色相同，但更短、更密；它长成一条粗粗的垂直条纹，大约两英寸宽。它让你隐约想起了马的鬃毛。");
            }
            if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,528) != 2)
            {
               outputText("沿着[Ember eir]脊柱，突出一排短的钢灰色向后弯曲的尖刺；从[Ember eir]脖子底部开始，一直延伸到[Ember eir]尾巴，在[Ember eir]尾巴尖端结束。它们长成一条粗粗的垂直条纹，大约一英寸宽，两英寸高。它让你非常隐约地想起了马的鬃毛。");
            }
            outputText("[pg]" + emberMF("他","她") + "的背上长着一对强壮的、布满鳞片的龙翼，上面覆盖着膜状的皮革鳞片。肌肉紧绷着，仿佛随时准备展开双翼飞向天空。");
            if(emberIsMasculine())
            {
               outputText("[pg]他的臀部看起来很普通，并没有什么特别引人注目的地方。他的屁股紧致结实，很适合保持平衡。");
            }
            else
            {
               outputText("[pg]她那" + (littleEmber() ? "像男孩一样的臀部出奇地引人注目，还有她那小巧的屁股" : "像女孩一样的臀部和她那形状优美的屁股一样引人注目，让烬走起路来姿态优雅") + "。她那迷人的屁股简直让人忍不住想去摸一摸，柔软得只会微微晃动，却又足够结实，不会影响这头龙的平衡。");
            }
            outputText("[pg]一条长长的、布满鳞片的灵活尾巴在[Ember em]身后甩动，尾巴的后三分之一处长着小凸起，可以伸展成看起来很凶残的尖刺。" + emberMF("他","她") + "的腿看起来像人类，直到脚部，脚部末端是强壮的、长着利爪的爬行动物爪子，用来抓地。");
            outputText("[pg]烬从头到脚都覆盖着盾形的鳞片。" + emberMF("他","她") + "背部的鳞片是银色的，反光很好，而" + emberMF("他","她") + "腹部则是浓郁的金色，形成了鲜明的对比。这些金属色的鳞片在烬的背部和[Ember eir]四肢外侧很大很突出，但在[Ember eir]脸上、[Ember eir]四肢内侧和[Ember eir]身体前部，它们非常小而细密，赋予了它们光滑如丝的质感。");
            outputText("烬身上那");
            if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,531) == 0)
            {
               outputText("少许");
            }
            outputText("裸露的肌肤呈现出浅粉色；但当[Ember ey]发情时，肌肤会泛起红晕，将你的目光吸引到[Ember eir]最性感的部位。");
            switch(pregnancy.get_event())
            {
               case 2:
                  outputText("此刻，她金色的肚子显得有些肉嘟嘟的。");
                  break;
               case 3:
                  outputText("她金色的肚子比平时更大、更结实了一些。");
                  break;
               case 4:
               case 5:
                  outputText("她金色的肚子变大了不少。烬经常把手放在上面，尤其是当她看到你盯着看的时候。");
                  break;
               case 6:
                  outputText("她高高隆起的孕肚迫使烬改变了姿势。看起来就像她的肚子上画了一个巨大的金色靶心。烬看起来有些疲惫，但很幸福。");
                  break;
               case 7:
                  outputText("她肿胀的肚子和你记忆中英格纳姆的任何孕妇一样大，你" + (FlagDict_Impl_.arrayReadInt(KFLAGS.flags,530) > 0 ? "可以轻易地看出她金色皮肤下蛋的轮廓" : "偶尔能看到婴儿在烬的子宫里移动") + "。");
                  break;
               case 8:
               case 9:
                  outputText("烬金色的肚子被她子宫里巨大的" + (FlagDict_Impl_.arrayReadInt(KFLAGS.flags,530) > 0 ? "蛋" : "婴儿") + "撑得紧绷绷的。你确信她很快就会生产，因为已经没有空间让" + (FlagDict_Impl_.arrayReadInt(KFLAGS.flags,530) > 0 ? "蛋" : "婴儿") + "长得更大了。");
            }
            outputText("[pg]在[Ember eir]的胸前，有一对");
            if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,529) > 0 || emberIsFeminine())
            {
               outputText((littleEmber() ? "A" : "F") + "罩杯" + (littleEmber() ? "挺拔的" : "柔软如枕的") + "乳房");
            }
            else
            {
               outputText("平坦结实的胸肌");
            }
            outputText("，除了[Ember eir]的乳晕外，上面覆盖着细密的鳞片；0.5英寸长的乳头挺立在");
            if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,529) > 0 || emberIsFeminine())
            {
               outputText("丰满的乳丘中央");
            }
            else
            {
               outputText("充满男子气概的胸肌中央");
            }
            outputText("。");
            if(emberHasCock())
            {
               outputText("[pg]在[Ember eir]胯下，从通向[Ember eir]骨盆腔内部的裂口处，垂着一根" + (littleEmber() ? " 5" : " 16") + "英寸长，" + (littleEmber() ? "一" : "两") + "英寸宽的阴茎，其形状与你在这个世界见过的任何阴茎都不同。");
               outputText("[pg]龟头圆润细长，而阴茎干上有一系列隆起，间距均匀，非常突出，使其看起来几乎呈分节状。当完全伸展时，一对" + (littleEmber() ? "小" : "苹果大小的") + "睾丸会从[Ember eir]生殖裂中掉出来。");
            }
            if(emberHasVagina())
            {
               outputText("[pg]烬双腿之间的鳞片特别光滑细腻，微微分开，刚好露出她湿滑小穴的内部；柔软、诱人且湿润。");
            }
            outputText("[pg]起初，烬因为你对[Ember eir]身体的明显欣赏而骄傲地挺起[Ember eir]胸膛，任由你随心所欲地仔细打量[Ember em]，但一分钟后，[Ember ey]开始因为兴奋和尴尬而脸红，最终遮住[Ember em]自己，脱口而出，[say: 看够了吧！]");
            outputText("[pg]" + emberMF("他","她") + "对你注视的反应其实挺可爱的。" + emberMF("他","她") + "摇晃的尾巴和小动作让你知道，[Ember ey]其实可能有点太享受了……...");
         }
         else
         {
            outputText("烬是一个身高" + (littleEmber() ? "4英尺4英寸" : "7英尺3英寸") + "的");
            if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,525) == 1)
            {
               outputText("男性");
            }
            else if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,525) == 2)
            {
               outputText("女性");
            }
            else
            {
               outputText("双性");
            }
            outputText("龙" + emberMF("男孩","女孩") + "，四肢修长，骨架纤细；[Ember ey]拒绝穿任何种类的衣服，自然地向世界暴露[Ember em]自己。" + emberMF("他","她") + "长着一张相当像人类的脸，但有几个关键的区别。在正常人类眼睛所在的位置，取而代之的是一对橙色的爬行动物眼睛回望着你，充满了无尽的骄傲和凶猛。");
            outputText("[pg]在[Ember eir]脸的两侧，你发现了一种奇异的龙鳞图案，它们与[Ember eir]橄榄色、类似人类的皮肤交织在一起，沿着[Ember eir]脖子和肩膀向下延伸，然后与[Ember eir]长满鳞片的四肢和背部融合。就像你村庄传说中的龙一样，烬" + (littleEmber() ? "正在长出" : "长着") + "一对从[Ember eir]太阳穴长出的乌黑龙角" + (littleEmber() ? "，尽管它们还不到一英寸长" : "，大胆地向后弯曲，越过[Ember eir]头皮") + "。虽然你不确定它们的硬度，但它们看起来可以" + (littleEmber() ? "承受任何" : "偏转大多数来自头顶的") + "攻击。你的目光被[Ember eir]下巴吸引，你锁定了一对迷人的粉红色人类嘴唇。[Ember eir]嘴巴平静的外表几乎让你忘记了烬长着的许多锋利牙齿，如果烬愿意，它们可以轻易地从身体上撕下肉来。");
            outputText("[pg]梳理在龙头上的闪亮银发很好地衬托了[Ember eir]面部特征，并且");
            if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,528) < 1)
            {
               outputText("很短，给了[Ember em]那种明确的" + emberMF(littleEmber() ? "男孩气" : "阳刚","假小子") + "的外貌。");
            }
            else
            {
               outputText("垂到[Ember eir]肩膀，给了[Ember em]你村庄传说中" + emberMF("英俊","美丽") + "战士的外貌。");
            }
            if(littleEmber())
            {
               outputText("[pg]" + emberMF("他","她") + "平坦的胸部在外貌上也像人类，" + emberMF("","将来会变成乳房的轮廓仅仅以微小的婴儿肥垫的形式隐约可见") + "，顶部有两个微小的乳头。");
               outputText("就在[Ember eir]锁骨下方，在[Ember eir]胸部中间，你看到了一个看起来像小巧的金色心形鳞片的东西；像某种胎记一样装饰着胸部。");
            }
            else
            {
               outputText("[pg]" + emberMF("他","她") + "的胸部在外貌上也像人类，并且容纳了一对");
               if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,529) > 0 || emberIsFeminine())
               {
                  outputText("F罩杯的乳房，支撑着0.5英寸的乳头，沉甸甸地垂着；你漫不经心地想，随着她在玛瑞斯度过更多时间，[Ember ey]是否会患上腰痛");
               }
               else
               {
                  outputText("长着0.5英寸乳头的阳刚胸肌");
               }
               outputText("。就在[Ember eir]锁骨下方，在[Ember eir]胸部中间，你看到了一个看起来像小巧的金色心形鳞片的东西；像某种胎记一样装饰着胸部。");
            }
            outputText("[pg]当你低头注视着烬的腹部时，你注意到人类般的那层血肉到此为止，取而代之的是长满鳞片的龙皮。虽然仍是人形，但你还是能清楚地辨认出烬腹部和下半身那" + (littleEmber() ? "稚嫩" : emberMF("男性化","女性化")) + "的特征。");
            outputText("[pg]这层鳞片也延伸到了[Ember eir]背部，尽管那里没有任何人类皮肤的斑块。一条细细的白色鬃毛点缀在烬的脊椎上，吸引了你的目光。从烬背部伸出的" + (littleEmber() ? "巨大的" : "") + "皮质翅膀，更是增添了" + emberMF("他","她") + (littleEmber() ? "小巧" : "") + "身体的凶悍外貌，看起来它们可以轻松地将主人推向空中。");
            outputText("[pg]在大多数方面，烬的骨盆看起来相当像人类。");
            if(emberHasCock())
            {
               if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,534) == 0)
               {
                  outputText("" + emberMF("他","她") + "长着一根疲软的阴茎和一对" + (littleEmber() ? "偏小" : "苹果大小") + "的睾丸，它们危险地暴露在自然环境中，更不用说面对利刃或重击了。然而[Ember ey]似乎一点也不担心，几乎是在挑衅任何人去注意它们。虽然[Ember ey]现在没有发情，但烬的阴茎可以达到大约" + (littleEmber() ? "5" : "16") + "英寸长，看起来大约有" + (littleEmber() ? "1英寸" : "2英寸") + "粗。");
               }
               else
               {
                  outputText("" + emberMF("他","她") + "长着一个看起来像某种保护性裂缝的东西，保护着[Ember eir]阴茎免受自然环境和意外打击的伤害。你现在看不到它；但你记得它大约有" + (littleEmber() ? "5英寸长，1英寸粗。" : "16英寸长，2英寸粗。"));
               }
            }
            if(emberHasVagina())
            {
               if(littleEmber())
               {
                  outputText("在她的双腿之间，隐藏着一个看起来像人类阴部一样柔软光滑的阴唇；它看起来太小、发育不全，似乎无法容纳任何东西，但却足够诱人，让人忍不住想要尝试一下。");
               }
               else
               {
                  outputText("诱人的、看起来像人类阴户的嘴唇在她的双腿之间微微撅起；她的阴唇上似乎聚集了一些水分，让它看起来很湿滑，简直是在乞求关注。");
               }
            }
            outputText("[pg]烬的双腿看起来有些像人类，但上面覆盖着厚厚的保护性鳞片，这些鳞片覆盖了[Ember eir]大部分的四肢。只有脚看起来完全不像正常的人类解剖结构；取而代之的是掠食者长有爪子的脚，脚趾上长着利爪，用来抓地……或者抓取猎物。");
            if(littleEmber())
            {
               outputText("[pg]起初，烬骄傲地挺起[Ember eir]平坦的胸膛，对你明显的欣赏感到自豪，任由你随心所欲地仔细打量[Ember em]孩子般的身体。但过了一分钟，[Ember ey]开始羞涩地脸红，最终遮住[Ember em]自己，脱口而出，[say:看够了吧！]");
               outputText("[pg]" + emberMF("他","她") + "对你注视的反应有点可爱。" + emberMF("他","她") + "摇摆的尾巴和小动作让你知道，[Ember ey]可能比[Ember ey]承认的更享受这种关注。");
            }
            else
            {
               outputText("[pg]你对烬身体的打量引起了[Ember eir]的注意，烬从[Ember eir]的唇间吐出爬行动物般的舌头，似乎在引诱你。");
            }
         }
         _g = this;
         doNext(function():void
         {
            _g.emberCampMenu();
         });
      }
      
      public function emberVaginalCapacity() : int
      {
         if(littleEmber())
         {
            return 15;
         }
         return 60;
      }
      
      public function emberTuckIn() : void
      {
         clearOutput();
         registerTag("kids",TagFun_Impl_.fromBool(emberChildren() > 1));
         registerTag("dson",FlagDict_Impl_.arrayReadInt(KFLAGS.flags,555) + FlagDict_Impl_.arrayReadInt(KFLAGS.flags,556) > 0 ? TagFun_Impl_.fromString("女儿") : TagFun_Impl_.fromString("儿子"));
         registerTag("dboy",FlagDict_Impl_.arrayReadInt(KFLAGS.flags,555) + FlagDict_Impl_.arrayReadInt(KFLAGS.flags,556) > 0 ? TagFun_Impl_.fromString("女孩") : TagFun_Impl_.fromString("男孩"));
         registerTag("dhe",FlagDict_Impl_.arrayReadInt(KFLAGS.flags,555) + FlagDict_Impl_.arrayReadInt(KFLAGS.flags,556) > 0 ? TagFun_Impl_.fromString("她") : TagFun_Impl_.fromString("他"));
         registerTag("dhim",FlagDict_Impl_.arrayReadInt(KFLAGS.flags,555) + FlagDict_Impl_.arrayReadInt(KFLAGS.flags,556) > 0 ? TagFun_Impl_.fromString("她") : TagFun_Impl_.fromString("他"));
         registerTag("dhis",FlagDict_Impl_.arrayReadInt(KFLAGS.flags,555) + FlagDict_Impl_.arrayReadInt(KFLAGS.flags,556) > 0 ? TagFun_Impl_.fromString("她的") : TagFun_Impl_.fromString("他的"));
         outputText("你注意到[if (kids) {其中一个}]你的小龙[dson]在不远处显眼地打着哈欠。作为一个负责任的父母，你[walk]过去[if (tallness > 54) {并[if (singleleg) {放低身子|跪下}]}]和[dhim]说话。你告诉[dhim]现在已经很晚了，而且[dhe]看起来该睡觉了。");
         outputText("[pg]然而，小[dboy]却猛烈地摇着[dhis]头回应。[say:不！我不困！]你叹了口气，已经知道接下来要面对的挣扎了。尽管如此，你还是牵起你[dson]的手，告诉[dhim]既然[dhe]还不想睡，你想和[dhim]一起待一会儿。这让[dhim]立刻咧开嘴笑了起来，所以你把[dhim]带到[dhis]床边并[if (tailLeg) {爬上去|坐下}]。");
         outputText("[pg]当你问[dhim]想先做什么时，[dhe]露出了极其严肃的表情，显然在非常认真地思考这个问题。过了一会儿，[dhe]倒吸了一口气，问道：[say:我能给你梳头吗？][if (hashair) {[if (hairlength < 6) {嗯，虽然你没多少头发可梳，但|听起来不错，}]你很乐意满足你[dson]的请求。[Dhe]笑着开始动手，[dhis]小手穿过你的头发，抚摸着你的头皮|但你根本没有头发。你[dson]的眼睛慢慢睁大，但只过了一会儿，[dhe]就说：[say:没关系！]然后还是把手伸向了你的头}]。");
         outputText("[pg]被人抚摸[if (hashair) {头发|头皮}]的感觉令人无比放松，你几乎要忘了自己来这里的目的。然而，无论你[dson]的服侍有多么美妙，你仍然一心想做一个好[father]，所以在[dhe]忙活的时候，你问起了[dhim]关于[dhis]这一天的事情。");
         outputText("[pg][say:嗯，我，呃……我今天去找虫子了。][dhe]找到了吗？[say:嗯哼！我找到了一只虫……呃……一只蝴蝶！它在树上。]那很好。[dhe]还做了什么？[say:嗯，呃……早些时候，我和" + emberMF("爸爸","妈妈") + "玩了。我们玩了抓人游戏，[ember ey]还试图教我怎么飞。不过总是[ember ey]赢……]在[dhis]短暂的沮丧破坏气氛之前，你继续问[dhim]各种各样的事情。");
         outputText("[pg]你的[dson]越来越投入，兴致勃勃地向你讲述着这一天发生的各种事情。[Dhis]充满活力的热情让每一件事听起来都无比令人兴奋，你发现自己[if (ischild) {想要加入其中|怀念起逝去的童年时光}]。那些令人振奋的探索故事和幽默的恶作剧在你的耳边回荡，正如你所料，所有的热情很快就让[dhim]筋疲力尽，[dhis]话语中夹杂着越来越多的哈欠。[if (hashair) {甚至连梳头都顾不上了|[Dhis]语速明显慢了下来}]，[dhe]开始用[dhis]长着小爪子的手揉眼睛。");
         outputText("[pg]你尽可能装作若无其事地慢慢躺在床上，把你的[dson]也拉过来，直到你们俩并排躺在一起。[Dhe]几乎已经睡着了，所以你的动作没有被注意到，你可以肆无忌惮地依偎在这个[dboy]身边。[Dhe]勇敢地试图继续给你讲故事，但[dhis]话语之间的停顿越来越长，直到[dhe]终于完全停了下来，[dhis]胸膛轻轻起伏着。");
         outputText("[pg]你在[dhim]的额头上印下最后一个吻，这足以让[dhim]最终睡着。你用双臂环抱住这条小龙，只是享受着[dhis]令人平静的温暖，不受周围世界的打扰。只有你们俩，在纯粹的家庭之爱中结合在一起。你发现自己希望时间能够暂停，希望你能在这个时刻度过余生。");
         outputText("[pg]最后，[dhis]的呼吸变得足够深沉，你觉得你可以再次脱身了。你尽可能轻柔地滑下床，但考虑到[dhe]睡得有多熟，其实没什么好担心的。看着[dhis]可爱的小脸，你实际上也开始觉得有点累了。");
         get_player().changeFatigue(10);
         saveContent.tuckedToday = get_time().days;
         doNext(get_camp().returnToCampUseTwoHours);
      }
      
      public function emberTribbing2() : void
      {
         clearOutput();
         outputText("当你和你的龙族情人躺在那里时，你的身体在几分钟内继续起伏和跳动。此刻你们谁也没有说话，但在那短暂而模糊的瞬间，你发现你们根本不需要言语。最终，一阵凉风拂过你的臀部，你打了个寒颤，从迷雾中清醒过来。");
         outputText("[pg]当你起身时，烬转头看着你。[if (emberaffection < 25) {她什么也没说，但她脸上那可爱又纠结的皱眉已经告诉了你一切。|[say:我-我，嗯……[if (emberaffection < 75) {感觉还不错|谢-谢谢}]。我不介意……以后再试一次……]}] 这条[if (littleember) {小}]龙红着脸移开视线，显然还没准备好站起来。");
         outputText("[pg]当你[if (isnaked){伸展酸痛的[if (singleleg){身体|双腿}]|穿上衣服}]时，你对她微笑着。虽然你们之间没有再多说一句话，但这种沉默一点也不让人觉得尴尬。");
         doNext(get_camp().returnToCampUseOneHour);
      }
      
      public function emberTribbing() : void
      {
         clearOutput();
         outputText("你的目光顺着她[if (littleember){正在发育的|紧致的}]身体往下游走，越过她[if (littleember){娇小的|优雅的}]肩膀，扫过她[if (littleember){初具雏形的|丰满的}]双乳，最后落到她[if (littleember){纤细的|柔韧的}]双腿上。你[if (littleember){恨不得立刻把她吃干抹净|想立刻占有她}]，但你知道对待她需要更讲究策略。");
         outputText("[pg]她在你的注视下显得有些局促，长着鳞片的手臂交叉起来，[if (littleember){暂时挡住了你欣赏她诱人胸部的视线|紧紧挤压着她的胸部}]。[if (emberaffection <25){她给你的那种鄙夷的眼神多少有些令人气馁，但|她脸上明显的红晕泄露了她所有的秘密，而且}]你能看出来她和你一样被唤起了情欲。");
         outputText("[pg][say:[if (littleember) {那-}]那个？你还在等什么？别告诉我你打算光看不练。呃，我是说——]");
         outputText("[pg]她还没来得及解释她的意思，你就已经霸占了她[if (littleember){娇小的}]嘴唇。[if (emberaffection < 25){她显然缺乏热情，但你用你的主动弥补了这一点|她短暂地抵抗了一下，但很快就被你迷住了}]，你把舌头探进去，与她的舌头交缠共舞。");
         outputText("[pg]当你们终于结束这个吻时，两人都在大口喘气，你清楚地看到她眼中燃烧的欲望，再也无法否认。当你[if (isnaked){伸展身体|脱下衣服}]，然后在离她几步远的地方坐下时，烬带着淡淡的红晕注视着你。");
         outputText("[pg]你拍了拍身旁的地面，她不情愿地坐了过来，但距离却远得让人不满意。你可不是那么容易被打发的人，你挪得更近了，已经能感觉到她[if (littleember){年轻|诱人}]的身体散发出的热量。你离她足够近了，于是你把手放在她的膝盖上，她嘟囔着什么，你没听清。");
         outputText("[pg]但即使你们俩坐得这么近，她似乎还是有些矜持。你慢慢地、装作若无其事地向这条[if (littleember){小}]龙挪去，但她把头和臀部转向一边，向后靠在手臂上，试图显得若无其事。尽管她表现得很勇敢，但你还是听到了她身后尾巴不耐烦地甩动的声音。");
         outputText("[pg]你告诉她，如果她想继续下去，就必须面对你。");
         outputText("[pg][say:嗯，是啊，废话！我、我知道……]她声音颤抖地说。随着她慢慢地、不情愿地把头转向你，她脸上的红晕也随着脖子扭转的角度成比例地加深。[say:[if (littleember) {但是，嗯……我、我们该怎么做……？|我只是在等你开始。}]]");
         outputText("[pg]你很乐意主导[if (ischild && littleember) {，即使你并不比她成熟多少}]。你慢慢地将[hands]顺着她的大腿向上滑，引得这只[if (littleember){娇小|高傲}]的龙打了个寒颤。你的手指一直向上，直到停留在她的入口外。她仍然足够湿润，但你想好好地做些前戏，所以你温柔地用手掌抚摸她的阴阜，按摩着她，让她适应这种接触。");
         outputText("[pg]她现在的呼吸很沉重，眼睑低垂，不过你觉得如果她注意到后一个细节，她肯定会非常慌乱。不管怎样，你觉得是时候开始了，所以你[if (singleleg) {[if (isgoo) {移动你无定形的身体，靠近到足以让你们的胯部接触|将你的尾巴滑到她身下，让她跨坐在你身上}]|将你的双腿与她的交缠在一起，把她拉近，直到你们的骨盆几乎贴在一起}]。");
         outputText("[pg]她没有抱怨，所以你迈出了最后一步，终于将你的嘴唇贴在了她的嘴唇上。一股电流立刻穿过你的身体，你几乎要退缩，但你控制住了自己的感官，开始缓慢而温柔地摩擦[if (littleember){这个女孩。[if (ischild){即使你们同龄，她看起来还是那么娇弱|她的身体是如此娇小}]，你几乎不敢相信你竟然能这样触碰她。|你的伴侣。她的身体是如此诱人，你很感激能有机会这样了解她。}]");
         outputText("[pg]你保持着坚定但有分寸的节奏，想尽可能久地享受这一刻；烬似乎很欣赏这一点，尽管她永远不会承认，但她表面上缺乏反应只会驱使你更进一步，更彻底地爱她。而且，随着一次特别热烈的挺进，你成功地让她倒吸了一口凉气。");
         outputText("[pg]仿佛是为了弥补这一点，她开始说话，声音中虚假的自信骗不了任何人。[say:如果你觉得这就够了……]她试图继续说下去，但她已经上气不接下气了，所以她只是坐在那里，几乎是挑衅地盯着你。");
         outputText("[pg]然而，你完全知道该怎么做，你调整臀部的角度，让你的[clit]直接压在她的阴蒂上。她那[if (littleember){可爱的小|[if (emberroundface) {火红的|龙族的}]}]眼睛几乎要瞪出来了，但这与你开始动作时的反应相比根本算不上什么。她发出一声[if (littleember){尖锐的|沙哑的}]叫喊，头向前垂下，[if (littleember){她的小角突轻轻地戳着你|她弯曲的角不经意地撞到了你}]。");
         outputText("[pg]你用双臂环抱住她，[if (littleember){[if (ischild) {把你的额头贴在她的额头上|用鼻子蹭她的头顶}]|亲吻她的脖子}]，同时确保你的旋转动作没有停下。你们的阴蒂现在随着每一次抽动互相摩擦，没过多久你就能感觉到自己快要到了。你压向她，想要感受她的体温，她[if (emberroundface){柔软的肌肤|光滑的鳞片}]紧贴着你。这还不够，你[b:需要]靠得更近，但当她的每一寸肌肤都已经属于你时，你还能怎么靠近呢？");
         outputText("[pg]但是，当你终于突破极限时，你突然感到一阵平静。她和你在一起，她起伏的胸膛，她颤抖的双腿，她[if (littleember){微弱的|灼热的}]喘息，这一切交织在一起，填满了你，将你脑海中的其他念头全部驱散。当高潮席卷你的身体时，你紧紧抱住烬，感觉彼此更加亲密。");
         get_player().orgasm("Vaginal");
         doNext(emberTribbing2);
      }
      
      public function emberTalksToPCAboutPCDragoNPregnancy() : void
      {
         clearOutput();
         FlagDict_Impl_.arrayWriteInt(KFLAGS.flags,559,1);
         outputText("你注意到烬的目光一直盯着你隆起的肚子，于是小心翼翼地问[Ember ey]在看什么。");
         outputText("[pg][say: 我希望这只是许多次中的第一次……]烬嘟囔着，然后才意识到你在问问题。[say: 呃？什么？]");
         outputText("[pg]出于好奇，你追问[Ember em][Ember ey]那句话是什么意思——关于这是许多次中的第一次。");
         outputText("[pg][say: 那——我没说过那种话！我只是问你感觉怎么样！]烬偷偷瞥了一眼你的肚子。");
         outputText("[pg]你告诉[Ember em]你感觉很好……不过你必须承认，这个孩子变得有点重了。但你确信[Ember ey]说了别的话；你咧嘴一笑，戏谑地问那是什么。");
         outputText("[pg]烬的羞涩达到了顶点，[Ember ey]终于屈服了。[say: 好吧！就算我喜欢做爱并让你怀孕又怎样？就算我想再来一次又有什么关系？有什么大不了的！]烬移开[Ember eir]视线，双手交叉在胸前。");
         outputText("[pg]你");
         if(get_player().lib < 40)
         {
            outputText("对这个启示感到惊讶，然后");
         }
         outputText("给了[Ember em]一个性感的微笑，并" + (littleEmber() ? "把[Ember em]拉到你的腿上" : "坐在[Ember eir]腿上") + "。烬试图掩饰任何反应，但[Ember eir]变硬的肉棒告诉你[Ember ey]真正在想什么。" + emberMF("他","她") + "咬着[Ember eir]下唇，终于站了起来。[say: 噢，看看时间；我得走了！]烬从你" + (littleEmber() ? "身边滑开" : "身下滑出") + "，飞快地跑开了，试图进一步掩饰[Ember eir]兴奋。");
         outputText("[pg]你微笑着目送[Ember em]离开；逗[Ember ey]真有趣……你把一只手放在肚子上保持平衡，努力站直身体。");
      }
      
      public function emberSprite() : void
      {
         spriteSelect(null);
      }
      
      public function emberSparIntensity() : int
      {
         var _loc1_:int = 0;
         _loc1_ += int(Math.floor(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,523) / 5));
         _loc1_ += FlagDict_Impl_.arrayReadInt(KFLAGS.flags,2108);
         if(_loc1_ > 100)
         {
            _loc1_ = 100;
         }
         return _loc1_;
      }
      
      public function emberSexMenu(param1:Boolean = true) : void
      {
         var _g:EmberScene;
         if(param1)
         {
            clearOutput();
            outputText("你色眯眯地盯着烬，打量着" + emberMF("他","她") + (littleEmber() ? "青春期前的" : "") + "身体的每一处细节。");
            if(emberAffection() <= 25)
            {
               outputText("[pg][say:你干嘛那样看着我？] [Ember ey]平淡地说。");
            }
            else if(emberAffection() < 75)
            {
               outputText("[pg][say:怎么了？我的身体有什么不对劲吗？] 烬一边检查着[Ember em]自己一边问道。");
            }
            else
            {
               outputText("[pg][say:别、别那样盯着我看！] 烬咬着[Ember eir]嘴唇抗议道。");
            }
            outputText("[pg]你对着烬微笑，欣赏着这头龙的身段，并随口称赞了几句。");
            if(emberAffection() <= 25)
            {
               outputText("[pg][say:拍马屁在我这里可加不了分" + (littleEmber() ? "，你这个恋童癖" : "") + "！] 烬宣称道。");
            }
            else if(emberAffection() < 75)
            {
               outputText("[pg][say:我才不信……你肯定在打什么算盘，我看得出来，] 烬回答道。");
            }
            else
            {
               outputText("[pg][say:哎呀，别看了！你弄得我……] 烬没有把话说完，" + (littleEmber() ? "" : "夹杂着情欲与") + "尴尬让[Ember em]慌乱不已。");
            }
            outputText("");
            if(emberHasCock())
            {
               outputText(emberMF("他","她") + "的肉棒");
               if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,534) == 1 || FlagDict_Impl_.arrayReadInt(KFLAGS.flags,531) == 0)
               {
                  outputText("正从[Ember eir]生殖裂里探出头来");
               }
               else
               {
                  outputText("开始充血肿胀");
               }
               outputText("。");
            }
            if(emberHasVagina())
            {
               outputText("你可以看到细小的水流开始顺着烬的大腿内侧流下，随着双腿的摩擦，几乎无法在你饥渴的目光下掩藏她那珍贵的宝藏。");
            }
            outputText("好吧，[Ember ey]是个性感的尤物；你顺理成章地问出了脑海中浮现的想法。");
            if(emberAffection() <= 25)
            {
               outputText("[pg][say:这、这只是生理反应！跟你没关系！] 看着烬试图为[Ember eir]不断高涨的情欲辩解却失败的样子，你忍不住轻笑起来。");
            }
            else if(emberAffection() < 75)
            {
               outputText("[pg][say:我……我想如果你愿意的话，我可以帮你点什么。]");
            }
            else
            {
               outputText("[pg][say:看情况……你有什么想法？]");
            }
         }
         menu();
         addButtonDisabled(0,"承受肛交","此场景需要烬拥有肉棒。");
         addButtonDisabled(1,"主导肛交","此场景需要你拥有肉棒且有足够的性奋度。");
         addButtonDisabled(2,"给烬口交","这个场景需要烬有阴茎。");
         addButtonDisabled(3,"被口交","这个场景需要你有阴茎并且有足够的性欲。");
         addButtonDisabled(4,"舔" + emberMF("他","她") + "的阴部","这个场景需要烬有阴道。");
         addButtonDisabled(5,"被舔阴","这个场景需要你有阴道并且有足够的性欲。");
         addButtonDisabled(6,"插入" + emberMF("他","她"),"这个场景需要你有阴茎并且有足够的性欲。烬需要有阴道。");
         addButtonDisabled(7,"被插入","这个场景需要你有阴道并且有足够的性欲。烬需要有阴茎。");
         addButtonDisabled(8,"情欲交媾","这个场景需要你有阴茎和无法满足的性欲，或者一瓶催情剂。烬的好感度需要非常高。");
         if(emberHasCock())
         {
            addButton(0,"承受肛交",catchAnal).hint("问问烬，" + emberMF("他","她") + "是否愿意用" + emberMF("他","她") + "的阴茎插入你的" + get_player().assDescript() + "。");
         }
         if(get_player().hasCock() && get_player().get_lust() >= 33)
         {
            addButton(1,"主导肛交",stickItInEmbersButt).hint("用你的阴茎插入烬的肛门。");
         }
         if(emberHasCock())
         {
            addButton(2,"给烬口交",suckEmberCock).hint("吸吮烬的阴茎，尝尝" + emberMF("他","她") + "的精液。" + (get_survival() ? "[pg]当然，还要把你的肚子填满！" : "") + "");
         }
         if(get_player().hasCock() && get_player().get_lust() >= 33)
         {
            addButton(3,"被口交",stickDickInKnifeDrawer).hint("问问烬，" + emberMF("他","她") + "是否愿意给你口交。");
         }
         if(emberHasVagina())
         {
            addButton(4,"舔她的阴部",slurpDraggieCunnies).hint("尝尝烬的阴道！!");
         }
         if(get_player().hasVagina() && get_player().get_lust() >= 33)
         {
            addButton(5,"被舔阴",getEatenOutByEmbra).hint("问问烬，" + emberMF("他","她") + "是否愿意尝尝你的阴道。");
         }
         if(emberHasVagina() && get_player().hasCock() && get_player().get_lust() >= 33)
         {
            addButton(6,"插入" + emberMF("他","她"),penetrateEmbrah).hint("插入烬的阴道！!");
         }
         if(emberHasCock() && get_player().get_lust() >= 33 && get_player().hasVagina())
         {
            addButton(7,"被插入",getPenetratedByEmberLastSexSceneWoooo).hint("问问烬，" + emberMF("他","她") + "是否愿意用" + emberMF("他","她") + "的阴茎插入你的阴道。");
         }
         if(emberAffection() >= 95 && get_player().hasCockThatFits(emberVaginalCapacity()) && (get_player().hasItem(get_consumables().L_DRAFT) || get_player().lib >= 50 || get_player().minLust() >= 40))
         {
            addButton(8,"情欲交媾",highAffectionEmberLustFuck);
         }
         addNextButton("磨豆腐",emberTribbing).sexButton(2).disableIf(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,525) < 2,"烬没有阴道。");
         _g = this;
         addButton(14,"返回",function():void
         {
            _g.emberCampMenu();
         });
      }
      
      public function emberRapesYourHeatness() : void
      {
         outputText("[pg]一双长满鳞片、长着爪子的手突然抓住你的[hips]，你感觉到烬深深地吸了一口你的气味。[say: 太好闻了……你闻起来真香，你知道吗，[name]？]");
         outputText("[pg]你甚至没有对[Ember eir]的举动感到惊讶；你满脑子想的都是胯下燃烧的深深渴望，");
         if(get_player().hasVagina() && get_player().get_inHeat() && emberHasCock())
         {
            outputText("你的[vagina]渴望被填满，你的子宫渴望发挥它应有的作用");
         }
         else
         {
            outputText("[eachCock]燃烧着想要播种成熟、准备好的子宫");
         }
         outputText("。");
         outputText("[pg]烬的回应是");
         if(get_player().hasVagina() && get_player().get_inHeat() && emberHasCock())
         {
            outputText("在你身上摩擦，把龙的预液涂抹在你的大腿上。");
         }
         else
         {
            outputText("紧紧地将她流着口水、肿胀的" + (littleEmber() ? "小穴" : "下唇") + "压在你的大腿上。");
         }
         outputText("[say: 我需要你，[name]。我太需要你了……你能看出我有多需要你吗？]" + (littleEmber() ? "小" + emberMF("男孩","女孩") : "烬") + "气喘吁吁地问，几乎无法掩饰自己的欲望。[say: 我太想操你了……我们现在就生个孩子吧！]");
         dynStats(DynStat.Lust(10 + get_player().lib / 10));
         outputText("[pg]你该怎么说？");
         menu();
         addButton(0,"接受",timeToPuffTheMagicDragon);
         addButton(1,"拒绝",fuckOffEmberIWantANap);
      }
      
      public function emberPregUpdate() : Boolean
      {
         switch(pregnancy.eventTriggered())
         {
            case 1:
               outputText("[pg]烬的肚子似乎在隆起；看来你的种子终究还是生根发芽了。这个" + (littleEmber() ? "小女孩" : "龙") + "没有表现出任何明显的迹象表明她注意到了自己体重的增加，而且你认为引起注意是不明智的，即使这[say: 只是]怀孕的隆起。[pg]");
               return true;
            case 2:
               if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,530) > 0)
               {
                  outputText("[pg]烬的肚子越来越大，让她的怀孕变得显而易见。她大着肚子的样子看起来非常性感……你摇了摇头，把这些胡思乱想抛在脑后。[pg]");
               }
               else
               {
                  outputText("[pg]烬的肚子越来越大，让她的怀孕变得显而易见。她隆起的腹部很适合她；老实说，她那样看起来相当性感。[pg]");
               }
               dynStats(DynStat.Lust(5 + get_player().lib / 20));
               return true;
            case 4:
               outputText("[pg]烬的肚子已经长大了不少。任何人一眼就能看出她怀孕了。");
               if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,530) > 0)
               {
                  outputText("烬注意到你在看她。[say: 怎、怎么了？没见过怀孕的" + (littleEmber() ? "小孩" : "女人") + "吗？]她愤愤不平地问道，但当你继续看着她时，她却掩饰不住嘴角的笑意。[pg]");
               }
               else
               {
                  outputText("烬发现你在看她" + (FlagDict_Impl_.arrayReadInt(KFLAGS.flags,531) == 1 ? "，脸红了" : "") + "。[say: 怎、怎么了？]你只是回答说她怀孕的样子很好看；她怀孕的样子很美。[say: 哦，呃……谢谢？]她回答道，移开视线，紧张地吐了吐舌头。[pg]");
               }
               return true;
            case 5:
               if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,530) > 0)
               {
                  outputText("[pg]你听到烬呻吟了一声，然后坐了下来。你冲到她身边，问她是不是不舒服。[say: 没事，我很好。只是有点累。]她安慰你；然后拉起你的手，按在她的肚子上。你感觉到里面有个硬硬的、略微圆润的东西。[say: 你感觉到了吗？这颗蛋已经比其他的都大多了。这证明你的种子起作用了，]她微笑着说。你回以微笑，然后告辞了。[pg]");
               }
               else
               {
                  outputText("[pg]烬微笑着坐着，抚摸着自己的肚子；你走上前去，问她感觉好不好。");
                  outputText("[pg][say: 嗯，我们都很好。我已经能感觉到我们的宝宝开始动了。你也想摸摸看吗？]你回答说想，然后轻轻地靠近她，伸出手抚摸她怀孕的肚子，感觉" + (FlagDict_Impl_.arrayReadInt(KFLAGS.flags,531) == 0 ? "鳞片" : "皮肤") + "已经在她隆起的子宫上绷得紧紧的。");
                  outputText("[pg]你感觉到手下似乎有轻微的踢动。一丝淡淡的父爱之情涌上心头，你忍不住揉了揉宝宝踢过的地方。烬叹了口气，任由你尽情抚摸她的肚子。不幸的是，责任在召唤，所以你向烬告别，回去继续你的工作。[pg]");
               }
               return true;
            case 6:
               if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,530) > 0)
               {
                  outputText("[pg]烬似乎一直在长胖。你走近她，把手放在她的肚子上，感受着里面不断长大的蛋。[say: 这生下来肯定很痛，]她说道，对即将到来的任务感到恐惧。[say: 这都是你的错……所以我希望你能在这里帮我。]烬说。[say: 现在我需要吃点东西，我饿了。]烬说着，走开去吃东西了。[pg]");
               }
               else
               {
                  outputText("[pg]最近烬的肚子越来越大，脾气也越来越暴躁。她经常对任何靠近她的人或事物咆哮，甚至连无害的虫子也不放过。你决定在她身边小心行事——怀孕的女人在英格纳姆就已经够可怕了，而且她们还没有锋利的牙齿或喷火的能力。");
                  outputText("[pg][say: 怎么了！？]烬质问你，怒视着你。你的观点得到了证实，你告诉她没什么，你只是在想你以前的家。[pg][say: 好吧，如果你有足够的时间回忆过去，不如过来帮我一把！？毕竟，你要为此负责。]");
                  outputText("[pg]你赶紧去帮她做她认为需要你做的任何琐事，直到她迅速打发你走。[pg]");
               }
               return true;
            case 7:
               if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,530) > 0)
               {
                  outputText("[pg]烬看起来非常疲惫；你很惊讶她挺着这么大的肚子还能一直这么活跃。你走近她，问她是否需要什么。[say:是的……嗯，你能……]她红着脸回答。[say:你能摸摸我的肚子吗？这能帮我放松，]烬请求道。[pg]你微笑着开始抚摸她的肚子；在抚摸的过程中，你能感觉到蛋坚硬的外壳撑起了烬的肚皮。烬松了一口气，开始发出呼噜声。[say:啊，感觉真好，]她高兴地说。你继续抚摸她的肚子，直到她闭上眼睛，开始发出轻微的鼾声。意识到烬睡着了，你停下手走开了。烬一定累坏了……[pg]");
               }
               else
               {
                  outputText("[pg]烬最近的活动量少了很多，只要看一眼她那大腹便便的样子，你就知道原因了。她太大了！你很惊讶她挺着这么大的肚子还能四处走动。凑近一看，你很确定你能看到肚子在蠕动，那是小龙在探索它有限的领地。");
                  outputText("[pg][say: 嘿，[name]。能帮我打点水来吗？][pg]你决定大方一点，帮她打水——如果她现在重得连自己走到小溪边都困难，你也毫不意外。你很快就带着装满水的水袋回来，递给她解渴。[pg]烬一把从你手里夺过水袋，毫不客气地一饮而尽，喝完后长舒了一口气。[say: 啊，太爽了，谢谢。] 你问她还需要什么，但当她确认自己没事后，你点点头，偷偷抚摸了一下她高高隆起的肚子，然后离开了。[pg]");
               }
               return true;
            case 8:
               if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,530) > 0)
               {
                  outputText("[pg]她的" + (littleEmber() ? "平坦的胸部已经肿胀成了可爱的、含苞待放的乳房" : "乳房看起来肿胀不堪") + "，你觉得你能看到一滴乳汁从她那挺拔的乳头上漏出来。[say: 帮我把这些吸出来，]她说着，" + (littleEmber() ? "揉着那充满乳汁的肿块" : "托起她那充满乳汁的双峰，然后任其落下") + "。[pg]你问她这样会不会不够宝宝吃。[say: 当然够，它不需要任何奶水。至少在它孵化出来之前不需要。那还需要一段时间，而我的乳房感觉太难受了。所以别问了，喝就是了！]她要求道" + (FlagDict_Impl_.arrayReadInt(KFLAGS.flags,531) > 0 ? "，因为自己的要求，她的脸颊上泛起了一丝红晕" : "") + "。[pg]你点点头，躺在她身边，温柔地将她的一颗乳头含入嘴里；然后你开始吮吸。[say: 哦哦哦，对……继续……这感觉太好了，]她呻吟着，既有快感，也有解脱的轻松。");
                  outputText("[pg]你很乐意效劳，开始不停地吸吮。烬营养丰富的乳汁填满了你。");
                  get_player().refillHunger(40,true);
                  if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,529) > 0)
                  {
                     outputText("她的乳房一直都很丰满，但这次流出的乳汁量简直惊人。她一定非常难受，你每吸吮一次，都会换来一股乳汁喷射和烬如释重负的呻吟。你持续了很长时间；直到你吸干了烬的一只成熟的乳房。");
                     outputText("[pg]然后你转向另一只，打算如法炮制，然而你已经觉得很饱了；你觉得你无法吸空这只了。烬愉悦和解脱的呻吟声推动着你继续。你不顾一切地继续喝着，在你意识到之前，她的另一只乳房也被吸干了。");
                     outputText("[pg][say: 啊，感觉好多了。我想你在让人感觉舒服这方面还不赖，]她承认道" + (FlagDict_Impl_.arrayReadInt(KFLAGS.flags,531) > 0 ? "，微微脸红" : "") + "。你强忍住一个饱嗝，笑了笑，然后回到了你的职责中。[pg]");
                  }
                  else
                  {
                     outputText("很快，你已经吸干了一只乳房，然后你转向另一只打算如法炮制；然而很快她就被吸干了，而你还意犹未尽。");
                     outputText("[pg][say: 啊，感觉好多了。干得好，]她评论道。你回以微笑，然后回到了你的职责中。[pg]");
                  }
               }
               else
               {
                  outputText("[pg]你决定去看看烬，看看她最近怎么样。当你走近时，她用疲惫的眼神看着你；很明显她最近没怎么睡好。[say: [name]，你来得正好！我需要你帮我排空乳房，它们太" + (littleEmber() ? "肿了" : "重了") + "，疼死我了。][pg]你看着她的乳房；" + (littleEmber() ? "曾经平坦的胸部现在肿胀成了可爱的、含苞待放的乳房" : "它们肿得至少比平时大了一个罩杯，甚至可能大了两个罩杯") + "。你完全相信她因为带着这么多" + (littleEmber() ? "奶水" : "") + "而感到疼痛，于是同意帮她，然后问她有什么特别的偏好。[pg][say: 赶紧解决它……现在！]烬咆哮道。[pg]你长叹一口气，在她身边坐下，" + (littleEmber() ? "" : "轻轻托起她其中一个涨满奶水的乳房，") + "双唇轻柔地含住乳头，开始吮吸。你的努力立刻得到了回报，一股甘甜清凉的龙奶喷涌而出。烬如释重负地叹了口气，伸手将你的头按在她的乳房上。[pg]你温柔地吮吸着，心里琢磨着烬会如何适应哺乳一个真正的婴儿，但你只是单纯地享受着与她如此亲近的时刻。你喝了又喝，在两个乳房之间交替，直到最后你释放了最严重的压力，代价是你喝下的奶水让你的肚子明显鼓了起来。你一屁股坐回你的[ass]上，强忍住一个饱嗝，看着烬，想知道她对你帮忙的努力有什么看法。[pg]烬打了个哈欠。[say: 很好……我现在感觉好多了，我想我需要睡个午觉。]");
                  outputText("[pg]你轻声叹息，看着她侧身倒下，肚子明显地晃动着，惊动了她子宫里未出生的龙，很快她就沉沉睡去。你爬起来，让她好好休息；你有一种感觉，用不了多久她就要生了。[pg]");
                  get_player().refillHunger(40,false);
               }
               get_player().changeFatigue(-25);
               return true;
            default:
               return false;
         }
      }
      
      public function emberPlayerFeeds() : void
      {
         clearOutput();
         registerTag("kid.he",saveContent.newbornGender == 1 ? TagFun_Impl_.fromString("he") : TagFun_Impl_.fromString("she"));
         registerTag("kid.him",saveContent.newbornGender == 1 ? TagFun_Impl_.fromString("him") : TagFun_Impl_.fromString("her"));
         registerTag("kid.his",saveContent.newbornGender == 1 ? TagFun_Impl_.fromString("他的") : TagFun_Impl_.fromString("她的"));
         registerTag("dragonkid",saveContent.newbornGender == 1 ? (FlagDict_Impl_.arrayReadInt(KFLAGS.flags,531) > 0 ? TagFun_Impl_.fromString("dragon-boy") : TagFun_Impl_.fromString("dragon")) : (FlagDict_Impl_.arrayReadInt(KFLAGS.flags,531) > 0 ? TagFun_Impl_.fromString("dragon-girl") : TagFun_Impl_.fromString("dragoness")));
         outputText("[if (issleeping) {有人轻声呼唤你名字的声音在你的意识边缘掠过，你睡眼惺忪地环顾你的[if (builtcabin) {卧室|帐篷}]寻找原因。虽然你怀疑袭击者是否会如此礼貌地叫醒你，但银色鳞片的闪光和四只橙色、像蜥蜴一样的眼睛注视着你，足以让你停顿下来，尽管你小[dragonkid]那明确无误的哭声很快就让一切变得清晰。|一阵[if (littleember) {疯狂的|雷鸣般的}]敲击声从你身后传来，你转过身，正好看到烬走到你身边，你的小[dragonkid]在[ember eir]怀里。[Kid.his]眼睛在看到[kid.his][father]时亮了起来，但短暂的兴奋很快被饥饿的哭声所取代。}]");
         if(littleEmber() && !saveContent.learnedFeeding)
         {
            outputText("[pg][say: [Kid.he]只想吃我的手指！] 看到平时自信的烬如此动摇[if (ischild) {只会让你更紧张|有点让人不安}]，当[ember ey]把你的孩子[if (tallness < 50) {递给|举向}]你时，[ember ey][if (!emberroundface) {几乎无法保持镇定|几乎要哭出来了}]。[if (ischild) {[say: 我-我们该怎么办，[name]？]|[say: 请帮帮[kid.him]，[name]！]}]");
            outputText("[pg]幸运的是，你知道[kid.he]需要什么，烬好奇地看着你");
         }
         else if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,525) == 1 && FlagDict_Impl_.arrayReadInt(KFLAGS.flags,529) == 0)
         {
            outputText("[pg][say: 我想[kid.he]是饿了。] 烬[if (issleeping) {试图忍住哈欠，}]看起来有点慌乱，尽管很难说这是因为照顾你的孩子的压力，还是因为遇到了他自己无法解决的问题。");
            outputText("[pg]当你……时，他脸上闪过一丝如释重负的神情");
         }
         else
         {
            outputText("[pg][say: 这次轮到你了，[name]。] 烬[if (issleeping) {瘫倒在你身边，}]歉意地笑了笑，但[ember ey]无法长久掩饰[ember eir]对你孩子的骄傲。[say: 照[kid.he]这么吃下去，[kid.he]很快就会[if (littleember) {比我还大|长成一条大龙}]的。]");
            outputText("[pg]你觉得这很公平，并且");
         }
         outputText("把你的小[dragonkid]抱在怀里，小心翼翼地把[kid.him]抱在你的[chest]前，以免压到[kid.his]翅膀。几乎没有时间[if (isnaked) {安顿好|把你的[armor]滑开}]，你刚出生的孩子就含住了一个乳头，在尝到你乳汁的第一口时立刻平静下来。");
         if(littleEmber() && !saveContent.learnedFeeding)
         {
            outputText("[pg]烬[ember emself]也安顿下来，惊讶地看着饥饿的龙安静地吸吮[kid.his][father]的乳汁。");
            outputText("[pg][say: 我-我也可以那样做吗？] [Ember ey]问道，当你低头看时，你发现[ember em]离你如此之近，你只能想这只小龙是什么意思。[if (cor > 50) {但既然[ember ey]这么好玩|因为你很乐意分享}]，你[if (!ischild) {在她身边放低身子，}]引导你空着的[if (biggesttitsize < 1) {乳头|乳房}]靠近[ember eir]嘴。");
            outputText("[pg][Ember Ey]迅速转过头去[if (!emberroundface) {，脸红得厉害}]。[say: 我是说……喂宝宝……]");
            outputText("[pg]" + (FlagDict_Impl_.arrayReadInt(KFLAGS.flags,525) == 1 && FlagDict_Impl_.arrayReadInt(KFLAGS.flags,529) == 0 ? "不幸的是不行，你不得不告诉他，当你解释这是只有女孩才能做的事情时，烬脸上的失望显而易见。" + get_player().mf(" 考虑到你自己也不是女孩，你不确定这种情况是否会更尴尬，当[ember ey]没有在这个问题上逼迫你时，你感到非常欣慰。","") : "试试也无妨，你告诉[ember em]，烬理解地点了点头。"));
            saveContent.learnedFeeding = true;
         }
         else
         {
            if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,525) == 1 && FlagDict_Impl_.arrayReadInt(KFLAGS.flags,529) == 0)
            {
               outputText("[pg]烬[if (littleember) {惊奇地|满足地}]看着你的孩子进食，很快将他的手臂[if (littleember) {}]环绕在你的[if (littleember) {[if (singleleg) {身体|腿}]|肩膀}]上，直到[if (emberkids == 1) {你们全家|你们三个}]拥抱在一起。[if (littleember) {[say: 我也想帮忙……]|[say: 谢谢你照顾[kid.him]，[name]。]}]");
            }
            else
            {
               outputText("[pg]当你的孩子进食时，烬[if (ischild && !littleember) {抚摸你的[if (hairlength > 0) {[hair]|头皮}]|依偎着你}]，[ember eir]的触摸是一种你不想失去的安慰。" + (get_player().dragonScore() >= 4 ? "[say: 有这么强壮的伴侣，难怪[kid.he]这么渴……]" : "[say: 我很惊讶[kid.he]这么喜欢[race]的奶……]") + " [ember ey]说，你几乎能感觉到[ember eir]声音中的爱慕。" + (get_player().dragonScore() < 4 ? "[say: 肯定是遗传了我的……]" : ""));
               outputText("[pg]你[if (littleember) {小小的}]龙族爱人依偎在你的温暖中，当[ember ey]靠着你放松时叹了口气。[say: 谢谢你帮我弄这个。]");
            }
            outputText("[pg]当你试图解释[i:你]才应该感谢[ember em]在你不在的时候照顾你们的小[dragonkid]时，[ember ey]却不以为然。[if (littleember) {[say: 我必须这么做，才能让龙族复兴。]|[say: 当我被赋予复兴我们种族的重任时，我就知道我的责任是什么了。]}]");
            outputText("[pg]虽然这可能是真的，但你确实很感激[ember eir]的帮助。即使你知道[ember ey]不会承认你的赞美，[ember eir]的微笑也已经说明了一切。");
         }
         outputText("[pg]当你的孩子喝饱了奶，松开你的乳房时，你感觉自己完全被抽干了，吃饱的[dragonkid]现在安静地躺在你的怀里。[Kid.his]呼吸变慢，[kid.his]抽动的尾巴也静止下来，在父母充满爱意的注视下，[kid.he]放松下来，没过多久，[kid.he]就在你的胸前睡着了。当你把熟睡的新生儿递给[ember em]时，烬点了点头，在回到[ember eir]巢穴之前，偷偷地吻了你一下。");
         outputText("[pg][if (issleeping) {在[ember ey]离开后，你扑通一声倒在[bed]上，闭上了眼睛。[pg]}]");
         get_player().milked();
         goNext(get_timeQ(),true);
      }
      
      override public function emberMF(param1:String, param2:String) : String
      {
         if(emberIsMasculine())
         {
            return param1;
         }
         return param2;
      }
      
      public function emberKidsMenu() : void
      {
         var _g:EmberScene;
         clearOutput();
         outputText("你和烬有" + (emberChildren() != 0 ? Utils.num2Text(emberChildren()) + "个孩子" + (FlagDict_Impl_.arrayReadInt(KFLAGS.flags,557) + FlagDict_Impl_.arrayReadInt(KFLAGS.flags,2789) != 0 ? "和" : "") : "") + (FlagDict_Impl_.arrayReadInt(KFLAGS.flags,557) + FlagDict_Impl_.arrayReadInt(KFLAGS.flags,2789) > 0 ? Utils.num2Text(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,557) + FlagDict_Impl_.arrayReadInt(KFLAGS.flags,2789)) + "个蛋" : "") + "。");
         menu();
         if(emberChildren() != 0)
         {
            addNextButton("安顿入睡",emberTuckIn).hint("把" + (emberChildren() > 1 ? "你的一个孩子" : "你的" + (FlagDict_Impl_.arrayReadInt(KFLAGS.flags,554) != 0 ? "儿子" : "女儿")) + "安顿到床上。").disableIf(get_time().hours < 18,"还没到睡觉时间。").disableIf(saveContent.tuckedToday == get_time().days,(emberChildren() != 0 ? "你的孩子" : "你所有的孩子") + "已经睡着了。");
         }
         if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,557) + FlagDict_Impl_.arrayReadInt(KFLAGS.flags,2789) != 0)
         {
            addNextButton("蛋",emberEggAppearance).hint("看看你们俩一起孕育的蛋。");
         }
         _g = this;
         setExitButton("返回",function():void
         {
            _g.emberCampMenu();
         });
      }
      
      public function emberJizzbangbangEnding() : void
      {
         clearOutput();
         outputText("随着意识的恢复，你呻吟了一声，隐约感觉到有什么湿润冰凉的东西包裹着你的阴茎，有什么坚实有力的东西正以最令人愉悦的方式缠绕并挤压着你。你睁开眼睛坐了起来，看到烬正跪在你面前，嘴巴急切地包裹着你的肉棒。");
         outputText("[pg]" + emberMF("他","她") + "抬起头，尽可能地绕着你的肉棒对你微笑。在[Ember eir]嘴里，你能感觉到[Ember eir]舌头紧紧地缠绕着你，就像一条蛇，然后[Ember ey]猛地一吸，像品尝高级点心一样吸吮着你的阴茎。你原本想对[Ember em]说的话都化作了喘息和痉挛，将最后一大股精液射进了龙吸吮着的嘴里。烬起初有些惊讶，但很快就尽可能深地把你含进去，让你直接射进[Ember eir]喉咙里。" + emberMF("他","她") + "的舌头舔舐着你的肉棒，品尝着你的味道，然后[Ember ey]慢慢松开，让一些精液留在[Ember eir]嘴里。当[Ember ey]移开时，你呻吟了一声，任由冷风吹打着你敏感的肉棒。" + emberMF("他","她") + "张开[Ember eir]");
         if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,531) == 0)
         {
            outputText("嘴里");
         }
         else
         {
            outputText("嘴里");
         }
         outputText("，让你看到[Ember eir]舌头上的白色液体，然后仰起头咽了下去，舔了舔嘴唇，呻吟着，仿佛在品尝美酒。[say:谢谢你的点心，我的伴侣。]" + emberMF("他","她") + "对你轻声说道，脸上带着戏谑的表情。");
         outputText("[pg]" + emberMF("他","她") + "真的很享受和你在一起的时光，不是吗？[say:你觉得呢？]" + emberMF("他","她") + "咧嘴一笑。[say:不过，看得出来我挑了个相当强壮的伴侣。在经历了之前那么多次性爱之后还能射精？你真是不一般，我的伴侣……]" + emberMF("他","她") + "舔了舔嘴唇，站了起来。");
         if(emberHasCock())
         {
            outputText("[pg][say:我怀疑在上次之后我还能不能勃起。]那你两腿之间晃动的是什么，你讽刺地指出，指着烬明显自发勃起的部位。");
            outputText("[pg][say:嗯……好吧，也许我还能硬起来，但我肯定射不出来了。]你看着龙，敲了敲手指，等着这个羞怯的");
            if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,531) == 0)
            {
               outputText("兽人");
            }
            else
            {
               outputText("怪物" + emberMF("男孩","女孩"));
            }
            outputText("坦白。[say:饶了我吧……我又不是石头做的。我只是在给我的伴侣口交，你总不能指望我对此毫无反应吧……]" + emberMF("他","她") + "交叉双臂，吐出一口烟圈，把头转过去，显然是慌了神。");
            outputText("[pg]你忍不住笑了起来；烬的态度可能有所好转，但" + emberMF("他","她") + "还是像以前一样容易被逗弄。" + emberMF("他","她") + "又朝你吐了一口烟圈。[say:算你走运我爱你，否则我发誓我会让你后悔逗我的。]");
         }
         outputText("[pg]你注意到你的爱人身上还沾满了你们刚才做爱留下的液体，并向龙指出了这一点。");
         outputText("[pg][say:哦，别担心这些，我待会儿会清理干净的。至于你，我的伴侣，我想你该走了吧？]你觉得[Ember ey]说得对，开始从烬的床上爬起来。[say:我来帮你。]");
         outputText("[pg]烬走到外面去收你的衣服，拍掉上面的灰尘，然后拿给你。龙很认真地帮你穿衣服，你很快就穿好了，不过[Ember ey]也没那么专业，还是忍不住在过程中偷摸了几把。[say:好了。]");
         outputText("[pg]你的龙伴侣凑过来，在你的嘴唇上飞快地啄了一下。[say:我们有空应该再来一次……我真的很享受。]" + emberMF("他","她") + "尴尬地笑了笑。[say:现在我得去洗洗了！]" + emberMF("他","她") + "没等你的回答，就冲过灌木丛，朝最近的溪流跑去。");
         outputText("[pg]你独自出发，准备继续你这一天的行程。");
         get_player().changeFatigue(-20);
         dynStats(DynStat.Lib(-1));
         doNext(get_camp().returnToCampUseTwoHours);
      }
      
      public function emberIsPregnantFirstTimeTalkScene() : void
      {
         clearOutput();
         FlagDict_Impl_.arrayWriteInt(KFLAGS.flags,560,1);
         outputText("你忍不住盯着烬隆起的肚子；你仍然很难接受你居然和一个传说中的生物生了一个孩子" + (littleEmber() ? "，而且[Ember emself]还是个孩子" : "") + "。特别是考虑到有时候很难完全确定烬是否真的喜欢你。");
         outputText("[pg]烬发现你在盯着看");
         if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,531) == 1)
         {
            outputText("并脸红了");
         }
         outputText("，她的一只手充满爱意和温柔地抚摸着她的肚子。[say: 怎-怎么了？你为什么那样看着我？有什么不对劲吗？]");
         outputText("[pg]你只是给了她一个淡淡的微笑，告诉她怀孕的时候很美。");
         if(get_player().cor >= 66)
         {
            outputText("你差点被这些肉麻的话噎住；不过，如果你不讨好她，她永远不会为你付出。");
         }
         outputText("[pg][say: 你……我……你真的这么认为吗？]烬问道，放下了她的防备。");
         outputText("[pg]你点点头，向她保证她看起来棒极了；她散发着真正耀眼的光芒，一种独特且完全属于她自己的母性之美。你考虑告诉她，因为怀孕，她的鳞片变得非常闪亮，但你不确定她是否会把这当作赞美。");
         if(get_player().cor >= 66)
         {
            outputText("她真的相信这些胡说八道吗？如果你让嘴角稍微上扬一点，你的笑容就会咧到耳根，所以你尽职尽责地保持着严肃的表情。");
         }
         outputText("[pg]烬无法掩饰她对你赞美的喜悦，她抚摸肚子的速度稍微快了一些，但仿佛突然从恍惚中惊醒；她抬起头，用自信的目光看着你，说道：[say: 我当然很漂亮！不然你为什么会投怀送抱，最后还把事办了？]");
         outputText("[pg]你记忆中的受孕过程可不是这样的，你苦笑着指出事实恰恰相反。你有时就是忍不住想逗逗她。");
         outputText("[pg][say: 呃……要不是你一直挑逗我，我也不会那样做！] 烬脱口而出。");
         outputText("[pg]你？挑逗她？你不记得有这回事，你换上一副夸张的沉思表情告诉她。");
         outputText("[pg][say: 呃……我们……你作弊！我不知道你怎么做到的，但你就是作弊了！] 烬终于转过身，大步走开。");
         outputText("[pg]你追上去抓住她，为逗弄她道歉，并让她冷静下来；在她现在的状态下，这么激动可不好。当她失去平衡、慌乱失措时，简直<i>可爱极了</i>。");
         if(get_player().cor < 30)
         {
            outputText("考虑到她的态度和本性，你知道能有像她这样的人想成为你的伴侣是多么幸运。");
         }
         outputText("[pg]当你说话时，烬的笑容扩大了，等你一说完，她就拍了拍你的背。[say: 很好！别忘了这是你的孩子。] 然后她转身走回她的巢穴去睡个短觉。");
      }
      
      public function emberIsMasculine() : Boolean
      {
         return !emberIsFeminine();
      }
      
      public function emberIsHerm() : Boolean
      {
         return FlagDict_Impl_.arrayReadInt(KFLAGS.flags,525) == 3;
      }
      
      public function emberIsFeminine() : Boolean
      {
         return emberHasVagina();
      }
      
      public function emberIsAnEggFactory() : void
      {
         clearOutput();
         outputText("你问烬是否愿意为你产下一枚卵");
         if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,530) <= 0)
         {
            outputText("如果你给她一瓶产卵灵药");
         }
         outputText("。");
         if(emberAffection() <= 25)
         {
            outputText("[pg]烬的眼神暗了下来。[say: 你怎么敢！居然让我做这种……这种……丢人的事！]");
            outputText("[pg]你道了歉，但你真的需要她在你的任务中生下的那些未受精的蛋……而且，她反正也需要把它们生下来处理掉，不是吗？憋在肚子里让它们在里面繁殖肯定不好受。");
            outputText("[pg]烬吐出一个烟圈。[say: 就算我留着没用，那也是我身体非常私密的一部分！]然而，她摸着下巴陷入了沉思……也许是在权衡是否应该把蛋给你。最后她妥协了。[say: 好吧！但你最好别拿它做什么奇怪的事！]");
            outputText("[pg]你向她保证你没有计划任何奇怪的事情。你心里有一部分在想，除了吃掉它");
            if(get_player().cor >= 40)
            {
               outputText("或者卖掉换点快钱");
            }
            outputText("还能拿它做什么，但你没有告诉她。");
            outputText("[pg][say: 好吧，那就在这儿等着。]烬钻进了几丛灌木，显然是想找点隐私。");
            outputText("[pg]无法抗拒诱惑，你决定偷偷跟在她后面，看看她将如何哄骗自己在身体通常会让她排出未受精卵之前产卵。你小心翼翼地穿过荒原，密切注视着地面，以避免发出任何可能暴露你的声音。");
            outputText("[pg]烬坐在石头上，双腿张开");
            if(emberHasCock())
            {
               outputText("并且她的");
               if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,531) == 0 || FlagDict_Impl_.arrayReadInt(KFLAGS.flags,534) > 0)
               {
                  outputText("龙根从缝隙中突出，");
               }
               else
               {
                  outputText("青筋暴起、球状的阴茎完全");
               }
               outputText("勃起");
            }
            outputText("。她的一只手轻轻地挑逗着她的阴蒂，另一只手则描摹着她" + (littleEmber() ? "肿胀的" : "") + "外阴唇；她咬着嘴唇，试图抑制住快乐的呻吟，但这是徒劳的……每一次触摸都会带来一声叹息。");
            outputText("[pg]她的节奏加快了，呻吟声变得更加强烈，你觉得你似乎能看到一个蛋壳开始从她的下体中探出头来。果然，烬用一只手撑开她的阴道，另一只手托住蛋。她因为用力的推挤而呻吟着，蛋慢慢地出来了；一旦最大的部分通过了，蛋就迅速地从她体内滑出，扑通一声落入她的手中。");
            outputText("[pg]她喘着粗气，看着那颗光滑的蛋一会儿，然后舔干净了上面的汁液，接着躺了下来，显然是打算等到她稍微冷静下来");
            if(emberHasCock())
            {
               outputText("并且她那跳动的肉棒软到可以藏起来");
            }
            outputText("之后再把蛋交给你。");
            outputText("[pg]你决定回到你应该等烬的地方，希望能隐藏起你在看了" + (littleEmber() ? "小" + emberMF("男孩的","女孩的") : "烬的小小") + "表演后自己有多兴奋。");
            outputText("[pg]几分钟后，烬拿着蛋出现了；幸运的是，你已经成功地恢复了原来的姿势并掩饰了你的兴奋。");
            outputText("[pg][say: 你的蛋。]烬把蛋递给你，移开了视线。你微笑着从她手中接过，并感谢她的慷慨。");
            outputText("[pg]烬小声嘟囔着：[say: 下次，帮我受精好吗？]你吃了一惊；她真的大声说出来了吗？但是，考虑到她的脾气，你决定还是不问了。");
            dynStats(DynStat.Lust(10 + get_player().lib / 10));
            get_inventory().takeItem(get_consumables().DRGNEGG,get_camp().returnToCampUseOneHour);
         }
         else if(emberAffection() < 75)
         {
            outputText("[pg]烬倒吸了一口气");
            if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,531) == 1)
            {
               outputText("，脸颊因尴尬而涨得通红");
            }
            outputText("。[say: 这-这……]她实在无法把话说完，只好低头看着地面。");
            outputText("[pg]你道了歉，但向她保证，如果她能提供哪怕一颗未受精的蛋，也真的会帮上大忙。");
            outputText("[pg]当你提到“未受精的蛋”时，烬似乎瑟缩了一下，但她还是站在原地。终于，在感觉像是一个世纪的尴尬沉默之后，烬叹了口气。[say: 好吧……我给你下一颗蛋。你……呃……想不想……]你歪了歪头，让她再说一遍；你没听清。");
            outputText("[pg]烬咬了咬嘴唇，又说了一遍，这次声音大了一点：[say: 你想看吗？]");
            outputText("[pg]你对这个提议眨了眨眼，然后给了她一个最迷人的微笑。你可以同意，或者用花言巧语推脱掉。");
            menu();
            addButton(0,"观看",watchMediumAffectionEmberEggLay);
            addButton(1,"不看",dontWatchEmberLayEgg);
         }
         else
         {
            outputText("[pg]尽管烬越来越尴尬，但她还是假笑了一下，打量着你。[say: 好-好吧……但我希望你能帮忙。]");
            if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,530) <= 0)
            {
               outputText("她拔开一瓶产卵灵药的塞子，将里面的液体一饮而尽。她的肚子立刻膨胀起来。");
               get_player().destroyItems(get_consumables().OVIELIX,1);
            }
            outputText("[pg]你问她有什么打算。");
            outputText("[pg][say: 别傻了！你知道我的意思……]烬的表情紧绷得像条蛇一样；一些淫液顺着她的大腿流了下来");
            if(emberHasCock())
            {
               outputText("，她的肉棒带着指责的意味指向你");
            }
            outputText("。");
            outputText("[pg]她把你带到一个僻静的地方，在附近的一个树桩上坐下，然后呼出一口气，集中精神，慢慢张开双腿，让你能接触到她最私密的部位。[say: 看-看……]烬坚持着，拨开她的阴唇，让你能完美地看到她" + (littleEmber() ? "小巧、未发育的阴户" : "粉嫩、湿润的肉洞") + "。[say: 喜-喜欢你看到的吗？]");
            outputText("[pg]你告诉她你很喜欢，不过你还是忍不住评论说她这次的动作比平时快了一点。烬半眯着眼睛看着你。[say: 而你的动作还不够快。]你对她难得的好心情咧嘴一笑，走近她，在她的双腿之间站定。你问她这次是想让你的手还是舌头来“帮”她。");
            outputText("[pg][say: 快-快开始吧……趁我还没改变主意……]");
            outputText("[pg]好吧，没必要让她干等着。你伸出舌头");
            if(get_player().tongue.type > 0)
            {
               outputText("伸出……再伸出……...");
            }
            outputText("然后倾身向前，给了她一个大大的、湿漉漉的、黏糊糊的舔舐，径直舔过她小穴的中心");
            if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,525) == 3)
            {
               outputText("直到你一路吸溜到她肉棒的最顶端才停下来");
            }
            outputText("，品尝着她私处汁液那独特的味道。");
            outputText("[pg]烬喘息着呻吟起来，向后仰去，对着天空发出欢愉的叫声；她的双腿颤抖着，爪子深深陷入木头里；她的翅膀展开，轻轻拍打着以帮助自己保持平衡。[say: 别……别停……] 她恳求道。");
            outputText("[pg]你本就没打算停下，继续舔舐着，尽可能深地将舌头探入她的深处，");
            if(get_player().tongue.type > 0)
            {
               outputText("确实相当深，");
            }
            outputText("爱抚、摩擦，用尽你能想到的所有技巧，用口舌取悦你这位龙族情人。从开始渗到你舔舐的舌头上的汁液量来看");
            if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,525) == 3)
            {
               outputText("以及顺着她那硬得发疼的肉棒滴落的量来看");
            }
            outputText("，你觉得你做得相当不错。");
            outputText("[pg]当你的鼻子撞到她那小小的欢愉按钮时，烬几乎跳了起来；她用大腿夹住你的头，将你闷在她那滴水的阴道上。");
            if(get_player().tongue.type > 0)
            {
               outputText("就在这时，你感觉到舌尖上有什么圆润光滑的东西，正轻轻撑开烬的肉壁。意识到这只能是她的蛋，你开始尝试将你那长长、灵活的舌头钻进它和她最深处的肉壁之间，希望能把它哄出来。");
            }
            outputText("[pg][say: 要出来了！啊！我要高潮了！！] 烬尖叫着，因几乎无法抑制的快感而颤抖。当烬的双腿紧紧夹住你时，如潮水般的汁液几乎要将你淹没。");
            if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,525) == 3)
            {
               outputText("她的肉棒跳动着，喷出长长的精液，涂满了你们周围的地面；将其标记为你们的特殊之地。");
            }
            if(get_player().tongue.type > 0)
            {
               outputText("[pg]你现在能真切地感觉到她的蛋了，并尽力用你那非人的舌头紧紧缠绕住它。你轻轻地拉扯、滑动、扭动，直到它湿漉漉地从母亲体内掉落到你等待的双手之中；你的舌头强壮而灵活，但你还不太相信它能独自将你的战利品高高举起。");
            }
            else
            {
               outputText("[pg]你能感觉到烬的蛋壳压在你的舌头上，你放弃了舔舐，开始用手指轻轻探查。在你的小心引导下，蛋顺利地从烬的身体滑落到你的手中。");
            }
            outputText("[pg]烬的双腿终于放松到足以让你逃脱……但她" + (littleEmber() ? "小小的" : "") + "身体慢慢向你倾斜，直到她最终支撑不住，瘫倒在你身上。幸运的是，你设法把蛋移开了，在你们俩摔成一团之前，把它从这堆沉浸在欢愉中的龙身上救了下来。你摇摇头，对烬笑了笑，打趣她怎么这么容易就因为一点快感而化成一滩烂泥。");
            outputText("[pg]这换来了她的一个白眼。烬迅速爬起来，拍掉鳞片上的泥土。[say: 也许我该停止为你下蛋了，] 她不屑地说道。");
            outputText("[pg]你打趣她说，她绝不可能放弃这么方便的借口，让你给她舔穴，而且还不指望她回报，你还伸出舌头以示强调。");
            outputText("[pg]烬" + (littleEmber() ? "撅起嘴" : "叹了口气") + "，意识到自己正在打一场必败的仗。[say: 至少我知道当我最终产下一枚受精卵时会发生什么了。] 在她说完这句话的片刻之后，她的脸上闪过一丝恍然大悟和尴尬。[say: 我……我是说……]");
            outputText("[pg]你只是微笑着告诉她你完全明白她的意思。一个快速的吻后，你回到了营地，留下了一只可爱又慌乱的龙。");
            dynStats(DynStat.Lust(10 + get_player().lib / 10));
            get_inventory().takeItem(get_consumables().DRGNEGG,get_camp().returnToCampUseOneHour);
         }
      }
      
      public function emberInternalDick() : Boolean
      {
         if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,531) != 0)
         {
            return FlagDict_Impl_.arrayReadInt(KFLAGS.flags,534) > 0;
         }
         return true;
      }
      
      public function emberHatchEggs(param1:int) : void
      {
         var _loc2_:int = 0;
         var _loc3_:int = 0;
         var _loc4_:* = null as String;
         var _loc5_:* = null as String;
         var _loc6_:* = null as IMap;
         var _loc7_:int = 0;
         clearOutput();
         registerTag("children",emberChildren() > 1 ? TagFun_Impl_.fromString("孩子们") : (FlagDict_Impl_.arrayReadInt(KFLAGS.flags,554) > 0 ? TagFun_Impl_.fromString("儿子") : TagFun_Impl_.fromString("女儿")));
         if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,2789) > 0 && Utils.rand(100) < 20)
         {
            _loc2_ = 3;
         }
         else
         {
            _loc2_ = 1 + Utils.rand(2);
         }
         registerTag("kid.he",_loc2_ == 1 ? TagFun_Impl_.fromString("他") : TagFun_Impl_.fromString("她"));
         registerTag("kid.him",_loc2_ == 1 ? TagFun_Impl_.fromString("他") : TagFun_Impl_.fromString("她"));
         registerTag("kid.his",_loc2_ == 1 ? TagFun_Impl_.fromString("他的") : TagFun_Impl_.fromString("她的"));
         registerTag("dragonkid",_loc2_ == 1 ? (FlagDict_Impl_.arrayReadInt(KFLAGS.flags,531) > 0 ? TagFun_Impl_.fromString("龙男孩") : TagFun_Impl_.fromString("公龙")) : (FlagDict_Impl_.arrayReadInt(KFLAGS.flags,531) > 0 ? TagFun_Impl_.fromString("龙女孩") : TagFun_Impl_.fromString("母龙")));
         if(emberChildren() <= FlagDict_Impl_.arrayReadInt(KFLAGS.flags,554))
         {
            _loc3_ = 1;
         }
         else
         {
            _loc3_ = Utils.rand(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,555) + FlagDict_Impl_.arrayReadInt(KFLAGS.flags,556)) <= FlagDict_Impl_.arrayReadInt(KFLAGS.flags,555) ? 2 : 3;
         }
         registerTag("rand.he",_loc3_ == 1 ? TagFun_Impl_.fromString("他") : TagFun_Impl_.fromString("她"));
         registerTag("rand.him",_loc3_ == 1 ? TagFun_Impl_.fromString("他") : TagFun_Impl_.fromString("她"));
         registerTag("rand.his",_loc3_ == 1 ? TagFun_Impl_.fromString("他的") : TagFun_Impl_.fromString("她的"));
         if(emberChildren() > 0)
         {
            outputText((emberChildren() > 1 ? "你" : "你") + "和烬的[children]正焦急地在你的[cabin]等候，[rand.he]一看到你，就抓住你的手，把你拉到[rand.his]" + emberMF("父亲","母亲") + "的巢穴。出什么事了吗？");
         }
         else
         {
            outputText("烬大声呼唤你的名字，你赶紧冲到[ember eir]巢穴。出什么事了吗？");
         }
         outputText("[pg]你的眼睛还没适应黑暗，烬就[if (littleember) {[if (!ischild) {朝你扑了过来，你勉强把[ember em]抱在怀里，[ember ey]兴奋地尖叫着|拉着你的手，把" + (emberChildren() > 0 ? "你们俩" : "你") + "拉进洞穴深处}]|[if (ischild) {把你抱起来，[ember eir]笑容比你见过的任何时候都要灿烂，[ember ey]抱着你往洞穴深处走去|冲向你，她兴奋地把你带进洞穴深处}]}]。");
         outputText("[pg][if (littleember) {[say: 它要孵化了！] 烬的尖叫声在墙壁上回荡，你真怕[ember eir]声音会把蛋震碎。|[say: 我希望你准备好" + (emberChildren() > 0 ? "照顾另一只小龙了" : "当[father]了") + "，[name]。] }][Ember Ey] [if (ischild) {把你抱得更紧了|把你拉进怀里}]。[say: 看！]");
         outputText("[pg]你顺着看去，" + (emberChildren() > 1 ? "但很难看清什么，因为你那群扭动着的孩子们挤在蛋周围，焦急地等待着他们的新弟弟或妹妹" : "不过要不是" + (emberChildren() > 0 ? "你的[children]坐在旁边，焦急地等待着[rand.his]新弟弟或妹妹" : "烬指给你看") + "，你几乎注意不到蛋有什么变化") + "。你猜，这一定是" + get_player().mf("母亲的本能",get_player().dragonScore() < 4 ? "龙的本能" : "本能") + "。");
         outputText("[pg]你继续等待，[if (littleember && !ischild) {烬在你怀里扭动着，充满了[ember eir]青春活力|[if (!littleember && ischild) {被烬温暖的拥抱包裹着|烬握着你的手[if (littleember) {——而且捏得有点太紧了——| }]，[ember ey]站在你身边}]}]。感觉好像[if (cor < 50) {过了好几个小时|在浪费时间}]，但随后蛋开始孵化发出的微弱沙沙声引起了你的注意。[if (littleember) {烬立刻安静下来，你|你}]觉得随着魔法的展开，你们俩连呼吸都屏住了。" + (emberChildren() > 0 ? "甚至你的[children]也安静下来，只能着迷地看着" + (emberChildren() > 1 ? "他们" : "[rand.his]") + "新弟弟或妹妹的诞生。" : ""));
         outputText("[pg]发丝般的裂纹像划破天空的闪电一样沿着蛋壳顶部蔓延，不断扩散，直到整个蛋似乎都在因新生命而颤抖。只需轻轻呼出一口气，它就会碎裂——然后它真的碎了，一个美丽的[if (!emberroundface) {龙宝宝|龙孩}]第一次探出头来看看这个世界。看到你刚出生的孩子的[if (!emberroundface) {龙族面容|可爱脸庞}]，你的心因[paternal]的骄傲而怦怦直跳，没过多久，蛋壳最后一次摇晃，终于裂开，你的孩子跌跌撞撞地迈出了第一步。");
         outputText("[pg]现在它从蛋里出来了，你可以看出你有一个新的小[dragonkid]" + (_loc2_ == 3 ? "，不过她显然也继承了她" + (get_player().isHerm() && FlagDict_Impl_.arrayReadInt(KFLAGS.flags,525) == 3 ? "父母" : emberMF("母亲","父亲")) + "的额外天赋" : "") + "。[Kid.he]充满爱意地抬头看着[kid.his]" + (emberChildren() > 0 ? "充满爱的家人" : "父母") + "，" + (get_player().dragonScore() < 4 ? "显然并不在意你看起来" + (get_player().dragonScore() == 0 ? "一点也不" : "不太") + "像[kid.him]" : "而且与[kid.his]龙族亲属的相似之处显而易见") + "，这时烬走上前抱起[ember eir]新" + (_loc2_ == 1 ? "儿子" : "女儿") + "。");
         outputText("[pg][say: [kid.he]不完美吗？] [ember ey]说道，你不得不表示同意。" + (emberChildren() > 0 ? "你的" + (emberChildren() > 1 ? "其他" : "") + "[children]在你们俩周围争抢着，渴望见到" + (emberChildren() > 1 ? "他们" : "[rand.his]") + "新" + (_loc2_ == 1 ? "弟弟" : "妹妹") + "，但是" : "") + "烬把你的孩子[if (!emberroundface) {舔|擦}]干净，" + (emberChildren() > 0 ? "首先" : "") + "把[kid.him]递给你。当你借此机会近距离观察你的小[dragonkid]时，[Kid.he]紧紧抓住你的手指。[Kid.his][if (!emberroundface) {鳞片|皮肤}]闪烁着健康的光泽，当你的目光与[kid.his]相遇时，[kid.he]笑了，不过当你把[kid.him]递回去时，[kid.he]仍然很兴奋地回到[kid.his]" + emberMF("父亲","母亲") + "身边。");
         if(emberChildren() > 0)
         {
            _loc4_ = emberChildren() > 1 ? "他们" : "[Rand.he]";
            _loc5_ = emberChildren() > 1 ? "他们" : "[rand.his]";
            outputText("[pg][say: 小心点你的小" + (_loc2_ == 1 ? "弟弟" : "妹妹") + "，好吗？] 烬[if (!littleember) {跪下来}]举起[ember eir]孩子，这让[kid.his]兄弟姐妹们非常高兴。" + _loc4_ + "挤在" + _loc5_ + "的" + emberMF("父亲","母亲") + "周围" + (emberChildren() > 1 ? "，互相推搡着，想成为第一个抱你最新出生的" + (_loc2_ == 1 ? "儿子" : "女儿") + "的人" : "，急切地想第一次触摸[rand.his]最新的家庭成员") + "。");
         }
         outputText("[pg]烬" + (emberChildren() > 0 ? "好不容易才从你的" + (emberChildren() > 1 ? "其他" : "") + "[children]中脱身，走到" : "走到") + "你身边，[ember eir]笑容极具感染力，[ember ey][if (littleember) {几乎兴奋得发抖|靠在你身上}]。[if (littleember) {[say: [Kid.he]太可爱了！]|[say: 我们的小" + (_loc2_ == 1 ? "男孩" : "女孩") + "比我能要求的还要好。]}]");
         outputText("[pg]你告诉[ember em]你很快就会回来照顾你的孩子，[ember ey]在你离开前迅速凑过来给了你一个吻。[say: 说“再见，[Daddy]！”]");
         outputText("[pg][Kid.he]并没有，但当你向[kid.him]挥手时，[kid.he]给你的微笑已经足够了。[pg]");
         switch(_loc2_)
         {
            case 1:
               _loc6_ = KFLAGS.flags;
               FlagDict_Impl_.arrayWriteInt(_loc6_,554,FlagDict_Impl_.arrayReadInt(_loc6_,554) + 1);
               break;
            case 2:
               _loc6_ = KFLAGS.flags;
               FlagDict_Impl_.arrayWriteInt(_loc6_,555,FlagDict_Impl_.arrayReadInt(_loc6_,555) + 1);
               break;
            case 3:
               _loc6_ = KFLAGS.flags;
               FlagDict_Impl_.arrayWriteInt(_loc6_,556,FlagDict_Impl_.arrayReadInt(_loc6_,556) + 1);
         }
         if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,2789) != 0)
         {
            _loc7_ = 2789;
            FlagDict_Impl_.arrayWriteInt(KFLAGS.flags,_loc7_,FlagDict_Impl_.arrayReadInt(KFLAGS.flags,_loc7_) - 1);
         }
         else
         {
            _loc7_ = 557;
            FlagDict_Impl_.arrayWriteInt(KFLAGS.flags,_loc7_,FlagDict_Impl_.arrayReadInt(KFLAGS.flags,_loc7_) - 1);
         }
         saveContent.eggArray.splice(param1,1);
         saveContent.newbornGender = _loc2_;
         saveContent.birthTime = get_time().days;
         doNext(playerMenu);
      }
      
      public function emberHasVagina() : Boolean
      {
         if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,525) != 2)
         {
            return FlagDict_Impl_.arrayReadInt(KFLAGS.flags,525) == 3;
         }
         return true;
      }
      
      public function emberHasHair() : Boolean
      {
         if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,528) == 0)
         {
            return FlagDict_Impl_.arrayReadInt(KFLAGS.flags,531) != 0;
         }
         return true;
      }
      
      public function emberHasCock() : Boolean
      {
         if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,525) != 1)
         {
            return FlagDict_Impl_.arrayReadInt(KFLAGS.flags,525) == 3;
         }
         return true;
      }
      
      public function emberGroinDesc(param1:String, param2:String, param3:String = undefined) : String
      {
         if(param3 == null)
         {
            param3 = " 和 ";
         }
         var _loc4_:String = "";
         if(emberHasCock())
         {
            _loc4_ += param1;
         }
         if(emberIsHerm())
         {
            _loc4_ += param3;
         }
         if(emberHasVagina())
         {
            _loc4_ += param2;
         }
         return _loc4_;
      }
      
      public function emberGivesBirth() : void
      {
         var _loc1_:int = 0;
         var _loc2_:* = null as IMap;
         if(pregnancy.allowHerm && Utils.rand(100) < 20)
         {
            _loc1_ = 3;
         }
         else
         {
            _loc1_ = 1 + Utils.rand(2);
         }
         if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,530) == 0)
         {
            outputText("[pg]一声咆哮打断了你的日常，你赶紧跑去查看声音的来源。你看到烬弯着腰坐在她的巢穴里，痛苦地扭曲着脸。她突然抬头看着你。");
            outputText("[pg][say: 太好了，你来了。时间到了！孩子要出生了。]");
            outputText("[pg]出于本能，你试图抓住她的手，安慰她你就在这里，你会尽力帮助她。随着又一阵宫缩袭来，烬尖叫起来，她紧紧握住你的手，力量之大让你觉得她快要把你的手捏碎了。你痛苦地咧着嘴，但还是尽力同样用力地回握——哪怕只是为了不让她捏断你的手。");
            outputText("[pg][say: 别、别光抓着我的手……做点什么，随便什么！好痛！]" + (littleEmber() ? "小女孩" : "烬") + "明显痛苦地对你大喊。");
            outputText("[pg]你用力挣脱烬的抓握，蹲在她面前。你几乎能看到她坚硬的腹肌在她的");
            if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,531) == 0)
            {
               outputText("鳞片");
            }
            else
            {
               outputText("皮肤");
            }
            outputText("下起伏，她的子宫正在努力排出里面长期的住客。你把手放在那鼓胀的圆球两侧，开始按摩，试图帮助舒缓紧绷酸痛的肌肉。你的目光从她的肚子移到她的胯部；她的阴道大张着，里面的婴儿开始来到这个世界。");
            if(emberHasCock())
            {
               if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,531) == 0 && FlagDict_Impl_.arrayReadInt(KFLAGS.flags,534) == 0)
               {
                  outputText("她那类似人类的阴茎沉甸甸地悬挂在她的阴部前，因为肌肉痉挛而部分勃起。");
               }
               else
               {
                  outputText("她那龙形的阴茎被压力从内部的包皮中推了出来，但她痛得无法勃起。");
               }
            }
            outputText("[pg]你脑子飞转，凑近头部，伸出舌头，在嘴里进进出出，让它变得湿润，然后在她的内壁上舔了长长的一口。你能尝到她的味道，羊水那种奇怪的咸血味与她天然的润滑液混合在一起。这是一种不寻常的味道，但并非无法忍受，你开始更加热情和有目的地舔舐。你的意图是试图用愉悦的刺激来淹没她宫缩的痛苦。这是一个疯狂的想法，但在玛瑞斯这样的地方却很合理。");
            outputText("[pg][say: 啊！对、对，别停。继续做你正在做的事。]看来你的理论是正确的。烬的双腿缠住你，将你锁定在原位；她的尾巴移动着抚摸你，慢慢地缠绕在你的腰上；她的双手抚摸着肚子，试图哄她未出生的孩子出来。");
            outputText("[pg][say: 我能感觉到它……在动……[name]……准备好毛巾，它要出来了！]当她肚子里的凸起向下移动时，烬痛苦地咆哮着。你试图迅速从你的位置爬起来，跑去拿毛巾，但烬死死地抓住了你，不让你走，迫使你指出在你们纠缠成这样的时候你拿不到毛巾。");
            outputText("[pg][say: 好痛！做点什么，[name]！]烬大喊，完全没有注意到你现在的状态。");
            outputText("[pg]你挣扎着，扭打着，但把这个念头抛在脑后；你能看到");
            if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,531) > 0)
            {
               outputText("头露出来了");
            }
            else
            {
               outputText("口鼻的尖端突出来了");
            }
            outputText("，你知道你没有时间了。相反，你轻轻地把手伸进烬的阴部，帮她扩张，并调整自己的位置来接住你的孩子。伴随着一声震耳欲聋的咆哮，烬最后一次用力，将她的后代从她过度拉伸的阴部送出，落入你的手中；随之而来的是真正的汁液喷泉，将你的手、手臂和脸都涂满了残留的羊水。");
            outputText("[pg]体力耗尽后，烬瘫倒在地，大口喘着粗气，你终于可以自由活动了。你双臂环抱着扭动着的后代，听着它像人类婴儿一样哇哇大哭。你低头看着你们结合的结晶，微笑着；它看起来就像它的母亲，一个");
            if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,531) == 0)
            {
               outputText("拟人化的龙");
            }
            else
            {
               outputText("人类和龙的混血儿");
            }
            outputText("。这是一个美丽、强壮、健康的小");
            switch(_loc1_)
            {
               case 1:
                  outputText("男孩");
                  break;
               case 2:
                  outputText("女孩");
                  break;
               case 3:
                  outputText("双性儿");
                  break;
               default:
                  outputText("错误 " + _loc1_);
            }
            outputText("。");
            outputText("[pg]你把");
            if(_loc1_ == 1)
            {
               outputText("他");
            }
            else
            {
               outputText("她");
            }
            outputText("抱在怀里，毫不在意它小身体上浸透的液体弄脏了你的[armor]，只是温柔地安抚着");
            if(_loc1_ == 1)
            {
               outputText("他");
            }
            else
            {
               outputText("她");
            }
            outputText("。然后，看到烬正从刚才的劳累中恢复过来，你骄傲地对她咧嘴一笑，轻轻地把你的");
            if(_loc1_ == 1)
            {
               outputText("儿子");
            }
            else
            {
               outputText("女儿");
            }
            outputText("递给她。");
            outputText("[pg]烬带着深深的幸福感凝视着新生儿。[say:它太美了……让我抱抱它，[name]……让我抱抱你们俩……]");
            outputText("[pg]你当然不会错过这个机会，把新生儿递到了");
            if(_loc1_ == 1)
            {
               outputText("他");
            }
            else
            {
               outputText("她");
            }
            outputText("母亲充满爱意的臂弯中，然后跪在她身边，在她情感流露的时刻拥抱她。烬把婴儿抱到胸前，让它把她的一侧乳头含进没有牙齿的小嘴里，开始吸吮烬营养丰富的乳汁。当婴儿忙着吸奶时，烬决定把注意力转向你，将你拉入一个深情的吻中。");
            outputText("[pg]你回抚着她的脸颊，热切地沉浸在她的吻中，张开嘴，任由她的舌头挑逗地探入你的口中，拂过你的舌头，然后像一条多情的蛇一样温柔地缠绕着它。烬叹了口气，结束了这个吻，疲惫感淹没了[Ember em]。她凑过来在你脸颊上最后啄了一下，然后躺在铺满她巢穴的柔软树叶上。[say: 抱歉……我现在需要睡一会儿了……]");
            outputText("[pg]你平静地扶她躺下，帮她把刚出生的婴儿安全地安顿在她身边。它继续吸吮了一会儿，然后困倦地松开嘴，打了个哈欠，蜷缩起来，准备和母亲一起入睡。");
            if(emberChildren() > 1)
            {
               outputText("你其他的龙族子嗣悄悄地探头看向巢穴，在烬分娩时他们就腾出了这个地方。看到他们的新手足，他们露出了微笑，轻轻地溜进来，蜷缩在母亲和新出生的孩子身边。");
            }
            outputText("带着满足的神情，你离开了烬和你");
            if(emberChildren() <= 1)
            {
               outputText("刚出生的孩子");
            }
            else
            {
               outputText("新扩大的龙族子嗣们");
            }
            outputText("，让她们好好休息，随后离开了巢穴。[pg]");
            switch(_loc1_)
            {
               case 1:
                  _loc2_ = KFLAGS.flags;
                  FlagDict_Impl_.arrayWriteInt(_loc2_,554,FlagDict_Impl_.arrayReadInt(_loc2_,554) + 1);
                  break;
               case 2:
                  _loc2_ = KFLAGS.flags;
                  FlagDict_Impl_.arrayWriteInt(_loc2_,555,FlagDict_Impl_.arrayReadInt(_loc2_,555) + 1);
                  break;
               case 3:
                  _loc2_ = KFLAGS.flags;
                  FlagDict_Impl_.arrayWriteInt(_loc2_,556,FlagDict_Impl_.arrayReadInt(_loc2_,556) + 1);
            }
            saveContent.newbornGender = _loc1_;
            saveContent.birthTime = get_time().days;
         }
         else
         {
            outputText("[pg]一声咆哮打断了你的日常，你赶紧跑去查看声音的来源。你看到烬弯着腰坐在她的巢穴里，痛苦地扭曲着脸。她突然抬头看着你。");
            outputText("[pg][say: 太好了，你来了。时间到了！我要下蛋了。]");
            outputText("[pg]出于本能，你试图抓住她的手，安慰" + (littleEmber() ? "这个小女孩" : "她") + "你就在这里陪着她，并且会尽全力帮助她。随着又一阵宫缩袭来，烬尖叫起来，她紧紧握住你的手，力气大得让你觉得她要把你的手捏碎了。你痛得龇牙咧嘴，但还是尽力同样用力地回握——哪怕只是为了不让她把你的手捏断。");
            outputText("[pg][say: 别、别光抓着我的手……做点什么，什么都行！好痛！] 烬痛苦地对你大喊。");
            outputText("[pg]你用力挣脱烬的抓握，蹲在她面前。你几乎能看到她坚硬的腹肌在她的");
            if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,531) == 0)
            {
               outputText("鳞片");
            }
            else
            {
               outputText("皮肤");
            }
            outputText("下起伏，因为她的子宫正在努力排出里面长期的住客。你把双手放在她隆起的肚子两侧开始按摩，试图帮助舒缓紧绷疼痛的肌肉。你的目光从她的肚子移向她的胯部；她的阴道大张着，里面球状的蛋开始向外坠落，准备降临这个世界。");
            if(emberHasCock())
            {
               if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,531) > 0 && FlagDict_Impl_.arrayReadInt(KFLAGS.flags,534) == 0)
               {
                  outputText("她的人类肉棒沉甸甸地悬挂在小穴前，因为肌肉痉挛而部分勃起。");
               }
               else
               {
                  outputText("她那龙形的阴茎被压力从内部的包皮中推了出来，但她痛得无法勃起。");
               }
            }
            outputText("[pg]你脑子飞转，凑近头部，伸出舌头，在嘴里进进出出，让它变得湿润，然后在她的内壁上舔了长长的一口。你能尝到她的味道，羊水那种奇怪的咸血味与她天然的润滑液混合在一起。这是一种不寻常的味道，但并非无法忍受，你开始更加热情和有目的地舔舐。你的意图是试图用愉悦的刺激来淹没她宫缩的痛苦。这是一个疯狂的想法，但在玛瑞斯这样的地方却很合理。");
            outputText("[pg][say: 啊！对，对，别停。继续你刚才的动作。] 看来你的理论是正确的。烬的双腿缠住你，将你锁定在原位；她的尾巴移动着抚摸你，慢慢地盘绕在你的腰间；她的双手抚摸着自己的肚子，试图将那颗沉重的蛋哄出来。");
            outputText("[pg][say: 我能感觉到它……在动……[name]……准备好毛巾，它要出来了！] 当肚子里的凸起向下移动时，烬痛苦地咆哮着。你试图迅速从你的位置爬起来，跑去拿毛巾，但烬死死地抓住你，不让你走，迫使你指出，在你们纠缠成这样的时候，你根本拿不到毛巾。");
            outputText("[pg][say: 好痛！做点什么，[name]！]烬大喊，完全没有注意到你现在的状态。");
            outputText("[pg]你挣扎着，扭打着，但把这个想法抛在脑后；你可以看到蛋圆润的外壳从烬的下体探出，你知道你没有时间了。相反，你轻轻地将手伸进烬的小穴，帮她撑开，并调整好自己的位置来接住你的孩子。伴随着一声震耳欲聋的咆哮，烬最后一次用力，将蛋从她过度拉伸的阴道中挤出，落入你的手中；随之而来的是名副其实的汁液喷泉，将你的手、手臂和脸都染上了残留的羊水。");
            outputText("[pg]不过，你现在无暇顾及刚刚溅了你一身的液体；你正努力地抱着蛋，不让它掉下来。它很大，比你见过的任何其他蛋都要大得多，重量很容易就能和一个体型不错的蹒跚学步的孩子相比。难怪烬肚子里带着这个嘎嘎作响的东西会行动迟缓。不过，最终你觉得你已经舒服地抓住了它，你站了起来，抱着这个硬壳蛋，最终，你的后代将从里面孵化出来。");
            outputText("[pg]烬喘着粗气，因为刚才的折磨而疲惫不堪；当她有时间恢复时，她凝视着你。她睁大眼睛，钦佩地看着她刚刚产下的蛋。[say: 它真美，] 烬充满爱意地说。你点头表示同意，并将其轻轻地放在巢穴避风处的一个角落里");
            if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,557) > 0)
            {
               outputText("，和");
               if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,557) == 1)
               {
                  outputText("另一个");
               }
               else
               {
                  outputText(Utils.num2Text(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,557)) + " 其他的");
               }
            }
            outputText("放在一起，然后告诉她，她也很美，你们的女儿一定会孵化出来，长大后会和她一样漂亮。");
            outputText("[pg]烬只是对你微笑，用尾巴勾住你的腰，把你拉向她。[say: 过来。] 你没有反抗，任由她把你拉进她的怀抱，依偎着她。烬抚摸着你的头，轻轻地揉着你的后颈，把你拉得更近。[say: 你知道，你还有一件事要为我做。]");
            outputText("[pg]你问她那是什么。烬用手托起她肿胀的乳房之一，轻轻地从她挺拔的乳头上挤出一滴乳汁。[say: 这些需要排空，] 她说，期待地看着你。");
            outputText("[pg]你给了她一个会意的眼神和微笑，然后依偎着她开始吸吮。[say: 嗯……不用着急，它们跑不掉的，] 烬说，在愉悦和解脱中叹了口气。她的双臂环绕着你，紧紧地抱着你，她的尾巴绕着你的腰部，轻轻地引导你的身体躺在她的身上。");
            outputText("[pg]你任由她为所欲为，确保不要过多地压迫她的腰部；毕竟，她刚刚生完孩子。你深情地依偎着你那" + (littleEmber() ? "未成年" : "龙") + "情人，很高兴能利用她愿意对你敞开心扉的机会。通常烬会说些否认的话然后跑开。实际上，像这样度过时光是一种解脱，尤其是在玛瑞斯这样的世界里。");
            outputText("[pg]你继续喝着，排空烬肿胀的乳房，凉爽营养的乳汁帮助你放松片刻，忘记你的烦恼。当你发现自己渐渐入睡，在烬轻柔的呼噜声——或者那是打呼噜声？——的引导下进入梦乡时，你的折磨被遗忘了。你分辨不出来，现在这也不重要了……...");
            get_player().refillHunger(40);
            outputText("[pg]不久后你醒了。烬乳房里的奶水已经完全排空了，你的肚子因为喝了太多而有些鼓胀。烬在你身下安详地睡着。你轻轻地从烬的怀抱中挣脱出来——这是一项艰巨的任务，因为烬的尾巴像蟒蛇一样紧紧地缠着你。不过，最终你还是设法从它坚持不懈的抓握中抽身，慢慢地溜出了巢穴。[pg]");
            if(pregnancy.allowHerm)
            {
               _loc2_ = KFLAGS.flags;
               FlagDict_Impl_.arrayWriteInt(_loc2_,2789,FlagDict_Impl_.arrayReadInt(_loc2_,2789) + 1);
            }
            else
            {
               _loc2_ = KFLAGS.flags;
               FlagDict_Impl_.arrayWriteInt(_loc2_,557,FlagDict_Impl_.arrayReadInt(_loc2_,557) + 1);
            }
            saveContent.eggArray.push(336);
         }
         get_player().createStatusEffect(StatusEffects.EmberNapping,12,0,0,0);
      }
      
      public function emberGetOverFreakingOutAboutMinoJizz() : void
      {
         FlagDict_Impl_.arrayWriteInt(KFLAGS.flags,542,0);
         outputText("[pg]你也许应该让烬知道，你不再被牛头人的念头所困扰了……哪怕只是为了防止生态崩溃。幸运的是，你刚好发现[Ember em]降落在[Ember eir]巢穴前。[Ember ey]把另一个牛头人的头骨扔在最小的那堆骨头上，然后转过身来面对你。[say: 什么事让你这么高兴？] [Ember ey]问道。");
         outputText("[pg]当你解释说你觉得你已经克服了你的瘾时，[Ember eir]脸亮了起来。[Ember ey]发出一声喜悦的咆哮，然后突然把你紧紧地抱在怀里——只是当[Ember ey]意识到自己在做什么时，很快就放开了你，看起来明显很尴尬。");
         outputText("[pg][say: 听-听到这个真是太好了。没有人应该忍受像对性液的实际渴望这样不体面的事情，特别是来自那种野兽的。]");
         outputText("[pg]你指出，这意味着[Ember ey]不再需要为了你而去猎杀牛头人了。你还指出，这意味着她可以停止在营地里到处乱扔牛头骨、牛蹄和其他垃圾了。");
         outputText("[pg]" + emberMF("他","她") + "立刻打了一个震耳欲聋的饱嗝，沉重、湿润又粗俗，空气中弥漫着血和牛肉的臭味。然后，这头龙漫不经心地看着[Ember ey]堆积起来的“战利品堆”。");
         if(emberAffection() <= 25)
         {
            outputText("[pg][say: 蠢货。搞得好像我是为了你才这么做的一样。] 烬看着你，迅速补充道。[say: 如果你从品尝公牛的阴茎中获得快感，那你就不值得我花时间。] " + emberMF("他","她") + "轻蔑地转过身去。[say: 别多想；这并不意味着我们是朋友什么的。我只是真的很讨厌那些蠢牛。]");
            outputText("[pg]不管[Ember ey]猎杀它们是为了帮你，还是[Ember ey]只是在过去的几天里想吃牛肉，事实是她确实帮你压制了它们带来的，呃，诱惑。");
         }
         else if(emberAffection() < 75)
         {
            outputText("[pg][say: 终于……我早就厌倦了整天吃烤牛肉。] 烬看着你，迅速补充道。[say: 你应该感激我花了我宝贵的一点时间来帮你！]");
            outputText("[pg]你告诉她你确实很感激[Ember eir]意图，并且你很抱歉[Ember ey]为了你不得不让[Ember eir]胃承受这么多的折磨。");
            outputText("[pg][say: 很好。现在，你，如果你真的那么抱歉，你可以先给我做点什么吃的，好去掉我嘴里的味道。] 烬交叉着[Ember eir]手臂，等着你。");
            outputText("[pg]注意到自从开始这场小小的十字军东征以来，[Ember ey]就一直被慢性消化不良所困扰，你本以为[Ember ey]在一段时间内最不想要的就是更多的食物。毕竟，[Ember ey]之所以会胀气得这么厉害，是因为[Ember ey]一直吃得太多。");
            outputText("[pg][say: 那就给我弄点茶或者别的什么！]烬愤愤不平地回答。");
            outputText("[pg]生活真他妈奇怪。");
         }
         else
         {
            outputText("[pg]烬叹了口气，转头看着你。[saystart]我希望你以后能离那些蠢牛远点。下次你再有渴望的时候");
            if(emberHasCock())
            {
               outputText("，特别是想吸鸡巴的时候，");
            }
            outputText("你应该来找我；我会帮你的。[sayend]然后，似乎意识到了[Ember ey]刚才话里的暗示，烬移开了视线，急忙补充道：[say: 但不是你想的那种方式……]");
            outputText("[pg]你只是挑了挑眉，问[Ember ey]还打算怎么帮忙。");
            outputText("[pg][say: 算、算了！] " + emberMF("他","她") + " 转身走开，中途停了一下，强忍住另一个饱嗝，捂住[Ember eir]肚子。你对着这条龙喊道，连骨头带肉地吃掉牛头人对[Ember eir]胃绝对没好处；事实上，考虑到[Ember ey]几乎一直遭受着胃痛和打嗝的折磨，也许需要帮助的是[Ember em]？吃点药，或者至少揉揉肚子？");
            outputText("[pg][say: 揉、揉肚子？我看起来像什么！？宠物吗！？]烬大喊着，自己揉了揉[Ember eir]肚子。");
         }
         outputText("[pg]你轻轻叹了口气，摇摇头走开了。你不确定自己是否会选择烬“帮助”你克服瘾头的方式，但你无法否认[Ember ey]确实是想帮忙，而且在某种程度上，[Ember ey]也确实做到了。[pg]");
      }
      
      public function emberEggInteraction() : void
      {
         var purified3:Boolean;
         var _g3:EmberScene;
         var purified2:Boolean;
         var _g2:EmberScene;
         var purified1:Boolean;
         var _g1:EmberScene;
         var purified:Boolean;
         var _g:EmberScene;
         clearOutput();
         outputText("你走近在那个被幻象隐藏的洞穴里发现的蛋。虽然光芒继续随着心跳的节奏闪烁，但它仍然只是静静地待在那里，什么也没做。");
         outputText("当你观察这颗蛋时，它闪烁着明亮而俗气的脉冲光芒，你被一种傲慢和力量感所淹没。你莫名地觉得你可以做任何事，仿佛你凌驾于一切之上，没有人敢说不。");
         if(get_player().get_lust() >= 33 && (FlagDict_Impl_.arrayReadInt(KFLAGS.flags,532) < 5 || FlagDict_Impl_.arrayReadInt(KFLAGS.flags,539) == 0))
         {
            outputText("[pg]你盯着蛋有节奏的脉动。然而，当你这样做时，你意识到脉动的模式开始改变。它变得不稳定，仿佛这颗蛋很兴奋。出于某种原因，你突然感到兴奋，这颗蛋看起来出奇地诱人……...");
            outputText("[pg]你伸出手，有一种明显的呼吸感……不，不是呼吸……是喘息。感觉这颗蛋在喘息，渴望着什么，你发现它的渴望很有感染力。把手放在蛋壳上，你倾身将脸颊贴在表面，倾听着；这颗蛋感觉很温暖，随着脉动而跳动……几乎就像情人在你们圆房前夕的胸膛。你有一种极其奇怪的冲动，想和这颗神秘的蛋做同样的事……...");
            if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,532) == 4)
            {
               outputText("[pg]一种恼怒的感觉也充满了你，仿佛你即将完成某件事，但缺少完成它所需的最后一步。");
            }
            doYesNo(masturbateOntoAnEgg,dontEggFap);
            return;
         }
         outputText("[pg]你盯着蛋的脉动，节奏微微改变。你感到一丝兴奋，一种不属于你自己的遥远期待。虽然对里面可能是什么感到好奇，但你决定现在什么也做不了。");
         menu();
         if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,532) >= 5 && FlagDict_Impl_.arrayReadInt(KFLAGS.flags,539) > 0 && FlagDict_Impl_.arrayReadInt(KFLAGS.flags,525) > 0)
         {
            outputText("[pg]<b>这颗蛋已经准备好孵化了——如果你也准备好了的话。</b>");
            addButton(0,"孵化",hatchZeMuzzles);
         }
         else if(get_player().get_lust() >= 33 && !get_player().isGenderless())
         {
            addButton(0,"自慰",masturbateOntoAnEgg);
         }
         else
         {
            addButtonDisabled(0,"自慰","这个场景需要你有生殖器和足够的性奋度。");
         }
         addButton(1,"血液",giveEmberBludSausages);
         if(get_player().hasItem(get_consumables().INCUBID))
         {
            _g = this;
            purified = false;
            addButton(2,"梦魇药剂",function():void
            {
               _g.useIncubusDraftOnEmber(purified);
            });
         }
         else
         {
            addButtonDisabled(2,"梦魇药剂");
         }
         if(get_player().hasItem(get_consumables().P_DRAFT))
         {
            _g1 = this;
            purified1 = true;
            addButton(3,"纯净药剂",function():void
            {
               _g1.useIncubusDraftOnEmber(purified1);
            });
         }
         else
         {
            addButtonDisabled(3,"纯净药剂");
         }
         if(get_player().hasItem(get_consumables().SUCMILK))
         {
            _g2 = this;
            purified2 = false;
            addButton(4,"魅魔乳液",function():void
            {
               _g2.useSuccubiMilkOnEmber(purified2);
            });
         }
         else
         {
            addButtonDisabled(4,"魅魔乳液");
         }
         if(get_player().hasItem(get_consumables().P_S_MLK))
         {
            _g3 = this;
            purified3 = true;
            addButton(5,"纯净乳液",function():void
            {
               _g3.useSuccubiMilkOnEmber(purified3);
            });
         }
         else
         {
            addButtonDisabled(5,"纯净乳液");
         }
         if(get_player().hasItem(get_consumables().EXTSERM))
         {
            addButton(6,"生发精华",hairExtensionSerum);
         }
         else
         {
            addButtonDisabled(6,"生发精华");
         }
         if(get_player().hasItem(get_consumables().OVIELIX))
         {
            addButton(7,"产卵灵药",useOviElixerOnEmber);
         }
         else
         {
            addButtonDisabled(7,"产卵灵药");
         }
         if(get_player().hasItem(get_consumables().LACTAID))
         {
            addButton(8,"催乳剂",useLactaidOnEmber);
         }
         else
         {
            addButtonDisabled(8,"催乳剂");
         }
         if(get_player().hasItem(get_consumables().LOLIPOP))
         {
            addButton(9,"棒棒糖",useLolipopOnEmber).disableIf(!get_allowChild(),"未成年内容已禁用。");
         }
         else
         {
            addButtonDisabled(9,"棒棒糖");
         }
         addButton(14,"返回",leaveWithoutUsingAnEmberItem);
      }
      
      public function emberEggAppearance() : void
      {
         clearOutput();
         registerTag("children",emberChildren() > 1 ? TagFun_Impl_.fromString("孩子们") : (FlagDict_Impl_.arrayReadInt(KFLAGS.flags,554) > 0 ? TagFun_Impl_.fromString("儿子") : TagFun_Impl_.fromString("女儿")));
         outputText("当你走向[ember eir]巢穴角落那个简陋的窝时，烬只是好奇地看着你，但没过多久[ember ey]就走到你身边" + (emberChildren() > 0 ? "，你的[children]也跟在后面" : "") + "。" + (emberChildren() > 0 ? "你们" + (emberChildren() == 1 ? "三个" : "所有") : "你们俩") + "都默默地注视着那颗蛋，它的存在是你们即将与烬拥有孩子的不可否认的证明[if (littleember) {[if (ischild) {，即使你们俩自己还是个孩子|，即使[ember ey]自己还是个孩子}]|[if (ischild){，即使你自己只是个孩子}]}]。[if (tallness < 48) {它几乎和你一样大|它比你想象的要大}]，但你认为这[if (littleember) {对于烬来说，[ember ey]自己还有很大的成长空间|对于烬这种体型的人来说是意料之中的}]。");
         outputText("[pg]它依偎在草床上看起来如此宁静，以至于你忍不住也感到满足，特别是当你把手放在蛋上，感觉到它的温暖渗入你的身体时。与烬孵化出来的那颗蛋不同，这颗蛋对你的触摸没有反应——看来你的孩子必须以传统的方式发育了。");
         outputText("[pg][say: 再等一会儿，[name]。] [if (littleember) {烬握住你的手，靠向你|烬用[ember eir]手臂环住你，将你拉近}]。" + (pregnancy.get_isPregnant() || get_player().isPregnant() ? "[say: 然后我们就会有另一个……]" : (get_player().get_gender() != FlagDict_Impl_.arrayReadInt(KFLAGS.flags,525) && get_player().get_gender() != 3 ? "[say: 但我们可以开始准备下一个了……]" : "[say: 我希望有一天我们能有另一个……]")));
         doNext(emberKidsMenu);
      }
      
      public function emberCorruption(param1:int = 0) : int
      {
         var _loc2_:IMap = KFLAGS.flags;
         FlagDict_Impl_.arrayWriteInt(_loc2_,527,FlagDict_Impl_.arrayReadInt(_loc2_,527) + param1);
         if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,527) > 100)
         {
            FlagDict_Impl_.arrayWriteInt(KFLAGS.flags,527,100);
         }
         else if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,527) < 0)
         {
            FlagDict_Impl_.arrayWriteInt(KFLAGS.flags,527,0);
         }
         return FlagDict_Impl_.arrayReadInt(KFLAGS.flags,527);
      }
      
      public function emberChildren() : int
      {
         return FlagDict_Impl_.arrayReadInt(KFLAGS.flags,554) + FlagDict_Impl_.arrayReadInt(KFLAGS.flags,555) + FlagDict_Impl_.arrayReadInt(KFLAGS.flags,556);
      }
      
      public function emberCampMenu(param1:Boolean = true) : void
      {
         var _g1:Camp;
         var _g:EmberScene;
         if(param1)
         {
            if(get_time().days - saveContent.birthTime < 14 && !(littleEmber() && !saveContent.learnedFeeding) && !(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,525) == 1 && FlagDict_Impl_.arrayReadInt(KFLAGS.flags,529) == 0) && Utils.rand(3) == 0)
            {
               emberBreastfeeding();
               return;
            }
            clearOutput();
            get_images().showImage("ember-visit-at-camp");
            if(emberAffection() <= 25)
            {
               outputText("当你靠近时，烬叹了口气，甚至没有正眼看你，就开口说道：[say:你想要什么？]");
            }
            else if(emberAffection() <= 75)
            {
               outputText("烬显得有些局促不安，[Ember eir]尾巴开始左右摇摆，[Ember ey]看着你问道：[say:怎么了？]");
            }
            else
            {
               outputText("当你靠近[Ember em]时，烬的眼睛亮了起来，[Ember ey]紧张地笑了笑。[say:有、有什么事吗？]");
            }
         }
         menu();
         addButton(0,"外貌",embersAppearance).hint("检查烬的外貌。");
         addButton(1,"交谈",talkToEmber).hint("和烬谈论一些话题。");
         _g = this;
         addButton(2,"做爱",function():void
         {
            _g.emberSexMenu();
         }).hint("和烬来一场性爱。");
         addButton(3,"切磋",decideToSparEmbra).hint("和烬进行一场快速战斗！[pg]当前强度：" + emberSparIntensity());
         if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,557) + FlagDict_Impl_.arrayReadInt(KFLAGS.flags,2789) + emberChildren() > 0)
         {
            addButton(5,"孩子",emberKidsMenu).hint("与你的龙族孩子互动。");
         }
         addRowButton(1,"喝血",bloodForTheBloodGod).hint("问问" + (littleEmber() ? "小" + emberMF("男孩","女孩") : "烬") + "是否愿意给你一些" + emberMF("他","她") + "的血来获得力量。");
         if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,529) > 0 || get_player().hasItem(get_consumables().LACTAID,1) && FlagDict_Impl_.arrayReadInt(KFLAGS.flags,523) >= 75)
         {
            addRowButton(1,"喝奶",getMilkFromEmber).hint("问问烬是否愿意让你喝" + emberMF("他","她") + "的奶。" + (FlagDict_Impl_.arrayReadInt(KFLAGS.flags,529) > 0 ? "" : "[pg]每次你想吸奶时，这将花费你1个催乳剂。") + "");
         }
         if((FlagDict_Impl_.arrayReadInt(KFLAGS.flags,530) > 0 || get_player().hasItem(get_consumables().OVIELIX,1) && FlagDict_Impl_.arrayReadInt(KFLAGS.flags,523) >= 75) && emberHasVagina() && !pregnancy.get_isPregnant())
         {
            addRowButton(1,"要蛋",emberIsAnEggFactory).hint("问问烬是否愿意为你下一个未受精的蛋。" + (FlagDict_Impl_.arrayReadInt(KFLAGS.flags,530) > 0 ? "" : "[pg]每次你想让" + emberMF("他","她") + "下一个未受精的蛋时，这将花费你1个产卵灵药。") + "");
         }
         if(get_game().time.hours >= 21 || get_game().time.hours < 5)
         {
            if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,523) < 75)
            {
               addButton(9,"一起睡？",sleepWithEmber).hint("试着和烬共度良宵。");
            }
            else
            {
               addButton(9,"一起睡",sleepWithEmber).hint("和烬共度良宵。");
            }
         }
         if(emberAffection() > 0 && get_player().hasItem(get_consumables().DRAKHRT,1) && FlagDict_Impl_.arrayReadInt(KFLAGS.flags,2688) == 0)
         {
            addButton(10,"赠送花朵",giftDrakeFlower).hint("你找到的龙心花据说在龙族中是用来求偶的礼物。也许烬会喜欢？");
         }
         _g1 = get_camp();
         addButton(14,"返回",function():void
         {
            _g1.campFollowers();
         });
      }
      
      public function emberCampDesc() : void
      {
         var _loc1_:* = null as Array;
         var _loc2_:Number = NaN;
         outputText("[pg]");
         if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,524) == 0)
         {
            outputText("[pg]你在洞穴里发现的神秘蛋静静地躺在你为它搭建的草窝里；它有三英尺高，周长近两英尺。这个窝本身并不怎么好看，但至少足够结实，能防止蛋滚来滚去。");
         }
         else if(get_camp().isForceSleepTime())
         {
            if(FlagDict_Impl_.arrayReadString(KFLAGS.flags,701) == "Ember")
            {
               outputText("烬在你的[cabin]周围徘徊，故意不看向那个方向，但显然在等你进去。");
            }
            else
            {
               _loc1_ = ["烬舒适地蜷缩在[ember eir]洞穴的床上，翅膀折叠在身上，四肢着地趴着。","从远处看，你看到烬在[ember eir]洞穴里睡着了。"];
               outputText(_loc1_[Utils.rand(int(_loc1_.length))]);
            }
         }
         else
         {
            _loc2_ = Utils.rand(3);
            if(_loc2_ == 0)
            {
               outputText("烬趴在[Ember eir]挖出的巢穴前，注视着营地并休息。每隔一会儿，[Ember eir]目光就会瞥向你的方向，然后[Ember ey]又迅速移开视线。");
            }
            else if(_loc2_ == 1)
            {
               outputText("烬似乎不在[Ember eir]挖出的巢穴附近……没过多久，烬就在它面前降落，然后再次起飞，显然正忙着在天空中飞来飞去玩耍。");
            }
            else
            {
               outputText("烬似乎在努力保持清醒；有时[Ember ey]会打瞌睡，但很快又会清醒过来。");
            }
            if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,2688) == 1)
            {
               outputText("你送给[Ember eir]的龙心花被小心翼翼地放在一小堆土上，就在[Ember ey]睡觉的地方旁边。");
            }
         }
         outputText("[pg]");
      }
      
      public function emberBreedingAfterMathWatchOutForRadioactiveFallout(param1:Boolean = true) : void
      {
         clearOutput();
         outputText("你醒了过来，在与" + (littleEmber() ? "一个娇小的青春期前" + emberMF("男孩","女孩") : "你的龙族情人") + "进行了令人筋疲力尽的交配后，你感到精力充沛，并伸展了最后几处僵硬的肌肉。当你这样做时，你意识到你仍然在你的[cabin]里，这里非常干净，没有你和烬在临时小睡前到处飞溅的大量体液的痕迹。");
         outputText("[pg]你环顾四周寻找那条龙，发现[Ember em]盘腿坐在[cabin]门口，半个身子在里面，半个身子在外面。[Ember ey]是在你睡觉时保护你吗？");
         outputText("[pg]当[Ember ey]注意到你醒了时，烬高兴地朝你瞥了一眼。[say:所以你终于醒了，是吧？很好，我坐在这里都快累死了……]");
         outputText("[pg]你感谢[Ember em]打扫了这里，并告诉[Ember em]你很感激。" + emberMF("他","她") + "实际上很擅长做这种事情。");
         outputText("[pg]烬的脸颊");
         if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,531) == 0)
         {
            outputText("在[Ember eir]鳞片下可能正在发红。");
         }
         else
         {
            outputText("脸红。");
         }
         outputText("[say:不客气，但这是我唯一一次为你打扫！我不是你的私人女仆！]");
         outputText("[pg]你想知道是否应该指出，既然大部分烂摊子都是[Ember ey]造成的，烬打扫也是公平的，但你决定只是感谢[Ember em]的慷慨。你的手下意识地去");
         if(!param1)
         {
            outputText("摸你的肚子");
         }
         else
         {
            outputText("指着烬的肚子");
         }
         outputText("，你问这条龙[Ember ey]是否认为它[say:成功了]" + (littleEmber() && emberChildren() == 0 ? " 尽管[Ember eir]年龄还小" : "") + "。");
         outputText("[pg]烬挺起[Ember eir]胸膛，自豪地吹嘘道，[saystart]当然成功了！我们俩都非常强壮！而且在你");
         if(param1)
         {
            outputText("射进我体内的所有精液之后……...");
         }
         else
         {
            outputText("让我射进你体内的所有精液之后……...");
         }
         outputText("[sayend] 烬的声音渐渐变小，你可以看到[Ember eir]手移到[Ember eir]胯部去抚摸[Ember eir]");
         if(param1)
         {
            outputText("小穴");
         }
         else
         {
            outputText("肉棒");
         }
         outputText("，仿佛在回味你们刚刚那场激烈的性爱。");
         outputText("[pg]你忍不住指出，明明是[Ember ey]先精疲力尽的；是你逼着[Ember em]继续下去的……所以，这难道不说明你比[Ember em]更精力旺盛吗？");
         outputText("[pg]烬的");
         if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,531) == 1)
         {
            outputText("脸红");
         }
         else
         {
            outputText("不适");
         }
         outputText("加深了，[Ember ey]对你皱起眉头。[say: 你、你是在质疑我的精力吗！？好吧，如果你想的话，我现在就可以再来一次！]");
         outputText("[pg]你强忍着笑，告诉[Ember em]没那个必要。不过，你确实想知道[Ember ey]是否认为你们俩现在会有个孩子。");
         outputText("[pg]烬愤愤不平地喷出一口烟。[say: 是的，就像我说的。我很确定怀上了……我是说……我们交配了，而且当龙交配时，我们肯定会怀孕的。]");
         outputText("[pg]你理解地点点头，然后故作天真地评论说，如果没有怀上，嗯，也许你们需要再试一次。");
         outputText("[pg]烬");
         if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,531) == 1)
         {
            outputText("脸红了");
         }
         else
         {
            outputText("皱起眉头");
         }
         outputText("再一次。[say: 别、别得意忘形！] [Ember ey]愤愤不平地大喊，然后站起来跑开了。你看着[Ember ey]的背影，露出了微笑；[Ember ey]迫不及待地想和你生孩子，但又无法坦白[Ember ey]的真实感受。不过，你很确定你的努力奏效了。");
         if(!param1)
         {
            outputText("你摸着自己的肚子，得意地笑了。非常确定确实奏效了……...");
         }
         doNext(playerMenu);
      }
      
      public function emberBreastfeeding() : void
      {
         clearOutput();
         registerTag("kid.he",saveContent.newbornGender == 1 ? TagFun_Impl_.fromString("he") : TagFun_Impl_.fromString("she"));
         registerTag("kid.him",saveContent.newbornGender == 1 ? TagFun_Impl_.fromString("him") : TagFun_Impl_.fromString("her"));
         registerTag("kid.his",saveContent.newbornGender == 1 ? TagFun_Impl_.fromString("他的") : TagFun_Impl_.fromString("她的"));
         registerTag("dragonkid",saveContent.newbornGender == 1 ? (FlagDict_Impl_.arrayReadInt(KFLAGS.flags,531) > 0 ? TagFun_Impl_.fromString("dragon-boy") : TagFun_Impl_.fromString("dragon")) : (FlagDict_Impl_.arrayReadInt(KFLAGS.flags,531) > 0 ? TagFun_Impl_.fromString("dragon-girl") : TagFun_Impl_.fromString("dragoness")));
         var _loc1_:Boolean = littleEmber() || emberIsMasculine();
         var _loc2_:String = FlagDict_Impl_.arrayReadInt(KFLAGS.flags,557) + FlagDict_Impl_.arrayReadInt(KFLAGS.flags,2789) > 0 ? "，在[ember eir]最新的蛋旁边，" : "";
         outputText("当你[if (singleleg) {进入|走进}][ember eir]的巢穴时，烬并没有在等你，[if (emberkids > 1) {但你的一个龙孩子把你带到了|你开始寻找她，走向}]洞穴的深处。在那里你看到了" + (_loc1_ ? "最意想不到的景象：烬" : "她，") + "坐在[ember eir]的巢穴里" + _loc2_ + "[if (littleember) {努力地抱着|抱着}]你的新生儿，贴在[if (littleember) {[ember eir]刚刚发育，却依然充满乳汁的胸前|" + emberMF("他那明显不具男子气概的胸膛上","她沉甸甸的乳房上") + "}]。你的小龙[if (emberroundface){-" + (saveContent.newbornGender == 1 ? "男孩" : "女孩") + "}]满足地吸吮着，当[ember ey]抬起头看到你走近时，[kid.his]" + emberMF("父亲","母亲") + "脸上的笑容让你很难不分享[ember eir]的喜悦。");
         if(littleEmber())
         {
            outputText("[pg]烬呼唤你，当孩子在[ember eir]怀里动弹时，[if (!emberroundface) {恐慌|尴尬}]爬上了[ember eir]的脸庞，毫无疑问是被[kid.his]" + emberMF("父亲","母亲") + "的兴奋吓到了。[say: 嗯……]这次当[ember ey]说话时，[ember eir]的声音几乎低得像耳语。[say: 感觉好奇怪……]");
            outputText("[pg]你告诉[ember eir]，[if (islactating) {如果[ember ey]需要休息，[ember ey]可以把[kid.him]交给你，但烬摇了摇[ember eir]的头。[say: 我当然能做到，][ember ey]回答道，尽管你怀疑这更多是说给[ember emself]听的，而不是对你说的。|[ember ey]做得很好，烬因为你的赞美而感到自豪。[say: 多亏了你。]}]");
         }
         else
         {
            outputText("[pg][say: 啊，[name]。][Ember ey]示意你靠近，你[if (singleleg) {走到|移动到}][ember eir]身边，[if (tallness > " + (littleEmber() ? "60" : "80") + ") {低头|}[if (tallness < " + (littleEmber() ? "40" : "60") + ") {抬头}]}]看了一眼正在吃奶的" + (saveContent.newbornGender == 1 ? "儿子" : "女儿") + "。小[dragonkid]看到你时动了动，当你把[kid.his]爪子[if (hasclaws) {握在自己手里|夹在手指间}]时，抓得更紧了，但谢天谢地，这还不足以分散你饥饿的孩子对眼前任务的注意力。");
         }
         outputText("[pg][if (littleember) {[say: [Kid.he]长得越来越大了……]仿佛为了向你展示，烬把[ember eir]怀里不断长大的新生儿举得更高了。[say: 很快[kid.he]就会比我还大了。]|[say: 照这个速度，[kid.he]很快就会长成一只体型完全的[dragonkid]了。]}]你新生儿的快速发育似乎让烬感到担忧，但当你解释说这里的生物就是这样生长时，[ember ey]稍微平静了一些。");
         if(littleEmber())
         {
            outputText("[pg][say: 但是……]不想继续[i:那个]话题，你用手指" + (emberHasHair() ? "穿过[ember eir]的头发" : "抚摸[ember eir]光滑的鳞片") + "来分散小龙的注意力，很快就换来了[if (emberroundface) {一阵脸红和}]慌乱的反应。[say: 别、别在孩子面前这样，[name]。]");
         }
         outputText("[pg]回想起你第一次见到的那个傲慢、冷漠的烬，眼前这个溺爱的" + emberMF("父亲","母亲") + "简直不像是同一个物种，更不用说是同一个人了。[ember em]这种深情的——你敢说，甚至有些[i:喜欢抱抱的]——一面只会让你更爱[ember em]，当[ember ey]迎上你的目光时，[ember ey]给了你一个[if (littleember) {无忧无虑的|满足的}]微笑。");
         outputText("[pg]你——和[ember eir]——的注意力很快被吸引到了[if (tallness > " + (littleEmber() ? "52" : "78") + ") {下方|其他地方}]，因为你的孩子吃完了[kid.his]饭，依偎在[kid.his]" + emberMF("父亲","母亲") + "的怀里，用充满睡意的眼睛抬头看着你。[Kid.he]微笑着伸手去抓你的手，但尽管小[dragonkid]尽了最大努力，[kid.he]还是很快就累了，躺下时[kid.he]便沉沉睡去。");
         outputText("[pg]你们三个留在那里，依偎在彼此的温暖中，舒适的沉默笼罩着你们。很快，烬轻手轻脚地走开，把你的孩子塞进[kid.his]草床里" + (FlagDict_Impl_.arrayReadInt(KFLAGS.flags,557) + FlagDict_Impl_.arrayReadInt(KFLAGS.flags,2789) > 0 ? "，在[kid.his]未来的兄弟姐妹旁边" : "") + "，然后回到你身边。[Ember ey]在带你回到[ember eir]巢穴中心时偷吻了你一下。");
         outputText("[pg][say: [if (littleember) {我们今天要做什么？|今天是什么风把你吹来了？}]]");
         emberCampMenu(false);
      }
      
      public function emberBitchesAtYouAboutLustiness() : void
      {
         outputText("你努力保持注意力集中，但是……你的性欲在向你尖叫，");
         if(get_player().hasCock())
         {
            outputText("你的[cocks]硬得像铁一样");
            if(get_player().hasVagina())
            {
               outputText("和");
            }
         }
         if(get_player().hasVagina())
         {
            outputText("你的[vagina]湿滑多汁，准备好挨操了");
         }
         outputText("。你太想做爱了，甚至感觉有些痛苦……...");
         outputText("[pg][say: 怎么了？发情发得脑子都不清楚了？] 烬调侃道。");
         outputText("[pg]你勇敢地试图坚持说没事，但最终不得不承认你感觉有点……欲火焚身。");
         if(emberAffection() <= 25)
         {
            outputText("[pg][say: 好吧，你应该想点办法……反正我也帮不了你。]");
         }
         else if(emberAffection() < 75)
         {
            outputText("[pg][say: 好吧……如果你好好求我的话，我或许会被说服来帮帮你。]");
         }
         else
         {
            outputText("[pg]烬在你的脸颊上印下一吻。[say: 我可以帮你……我-我是说，如果你跪下来求我的话，我大概可以帮你……] 从[Ember eir]躲闪的目光和沙哑的声音来看，你怀疑这个请求根本不需要那么正式。");
         }
         outputText("[pg]");
         FlagDict_Impl_.arrayWriteInt(KFLAGS.flags,541,0);
      }
      
      public function emberBitchesAboutPCBeingFullOfEggs() : void
      {
         clearOutput();
         outputText("正当你试图想个话题聊聊时，你发现烬正盯着你因怀卵而肿胀的肚子——不是带着愤怒或蔑视，而是带着兴趣。你带着得意的笑容，把一只手放在肚子上，问[Ember ey]是不是觉得你现在的样子很有趣。");
         outputText("[pg][say: 啊？我没盯着看！谁会觉得你那一堆未受精的卵有趣？] 烬脱口而出，移开了视线。");
         outputText("[pg]你挑起一根眉毛；谁说是未受精的卵了？");
         outputText("[pg][say: 呃……我……我得去洗个澡！这个想法太恶心了，我得把它洗掉！] 烬迅速从你身边跑过。");
         outputText("[pg]你看着[Ember em]离去，摇了摇头，不知道这是怎么回事。");
         FlagDict_Impl_.arrayWriteInt(KFLAGS.flags,540,1);
      }
      
      public function emberAnalCapacity() : int
      {
         if(littleEmber())
         {
            return 15;
         }
         return 60;
      }
      
      public function emberAffection(param1:int = 0) : int
      {
         var _loc2_:IMap = KFLAGS.flags;
         FlagDict_Impl_.arrayWriteInt(_loc2_,523,FlagDict_Impl_.arrayReadInt(_loc2_,523) + param1);
         if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,523) > 100)
         {
            FlagDict_Impl_.arrayWriteInt(KFLAGS.flags,523,100);
         }
         else if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,523) < 0)
         {
            FlagDict_Impl_.arrayWriteInt(KFLAGS.flags,523,0);
         }
         return FlagDict_Impl_.arrayReadInt(KFLAGS.flags,523);
      }
      
      public function eatEmbersYolkLikeAnEvenBiggerDick() : void
      {
         clearOutput();
         outputText("不知道这股冲动从何而来，但你并不在意，你蹲在你的“猎物”破碎的蛋壳上，开始胡乱地抓起大把的蛋黄塞进嘴里。");
         outputText("[pg]味道简直不可思议；带着一丝苦涩，但浓郁而丝滑，像最美味的佳肴一样滑入你的喉咙。你吃下的每一口都让你充满能量和力量，你几乎能感觉到自己变得越来越强。");
         get_player().refillHunger(100);
         outputText("[pg]不知不觉中，你已经尽可能多地吃掉了它，空空的两半蛋壳躺在你面前——就在你注视的时候，剩下的蛋清渗入了多孔的蛋壳中，完全消失了。你拿起蛋壳，看着底部，但没有一滴液体渗出。有意思……...");
         outputText("[pg]感到心满意足后，你站起身准备返回营地，但一时兴起，你把蛋壳当作纪念品带走了。");
         outputText("[pg](<b>获得关键物品：龙蛋壳</b>)");
         get_player().createKeyItem("Dragon Eggshell",0,0,0,0);
         dynStats(DynStat.Str(5 + Utils.rand(5)),DynStat.Tou(5 + Utils.rand(5)),DynStat.Inte(5 + Utils.rand(5)),DynStat.Cor(20));
         get_player().slimeFeed();
         doNext(get_camp().returnToCampUseOneHour);
      }
      
      public function drinkDeeplyOfDagronBlud() : void
      {
         var output1:Boolean;
         var _g:EmberScene;
         var _loc1_:Boolean = false;
         clearOutput();
         if(emberAffection() < 75)
         {
            outputText("你决定继续饮用烬的血液；意图获取它能从你体内激发出的所有力量。");
            _loc1_ = get_consumables().EMBERBL.useItem();
            outputText("[pg][say: 呃……你喝得太多了……我觉得头晕，]龙抱怨道。");
            outputText("[pg]你向[Ember em]伸出援手。令人惊讶的是，烬接受了你的帮助。[say: 谢谢。我想今天不能再工作了……我需要吃点东西，睡一觉。]");
         }
         else
         {
            outputText("你决定继续饮用烬的血液；意图获取它能从你体内激发出的所有力量。");
            _loc1_ = get_consumables().EMBERBL.useItem();
            outputText("[pg]当你结束这个吻时，烬靠了过来，靠在你的肩膀上支撑着[Ember em]自己。[say: 呃……我想我们做得太过火了……我觉得头晕。]");
            outputText("[pg]你迅速向[Ember em]伸出援手，询问[Ember ey]是否还好。烬接受了你的帮助，用你的手来保持平衡。[say: 我、我会没事的……只是，今天不能再分享了……]");
         }
         if(!_loc1_)
         {
            _g = this;
            output1 = false;
            doNext(function():void
            {
               _g.emberCampMenu(output1);
            });
         }
      }
      
      public function dontWatchEmberLayEgg() : void
      {
         clearOutput();
         outputText("你握住她的手，告诉她你绝不会梦想侵犯她的隐私，但如果她需要灵感，请她想想你。她害羞地移开视线，脸上露出一丝微笑。看来她已经按照你的指示去做了。");
         outputText("[pg]她扭着腰走开了，大腿间闪烁着湿润的光泽，你坐在石头上等待结果。三十多分钟后，气喘吁吁的龙重新出现，递给你一个仍然黏糊糊的蛋。");
         if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,525) == 3)
         {
            outputText("……它甚至滴着某种灰白色的液体。");
         }
         outputText("[say:这-这是你的蛋。趁新鲜用，好吗？] 她的眼神有些迷离，咯咯地笑了起来。");
         get_inventory().takeItem(get_consumables().DRGNEGG,get_camp().returnToCampUseOneHour);
      }
      
      public function dontEggFap() : void
      {
         var purified3:Boolean;
         var _g3:EmberScene;
         var purified2:Boolean;
         var _g2:EmberScene;
         var purified1:Boolean;
         var _g1:EmberScene;
         var purified:Boolean;
         var _g:EmberScene;
         clearOutput();
         outputText("你摇了摇头，对这些奇怪的冲动感到困惑和惊讶，暂时退开了一步。一旦远离了那颗蛋，它脉动的频率就恢复了正常，你感觉那种冲动也随之消失了。");
         outputText("蛋的节奏突然改变了；就好像它被什么东西激发了兴奋——某种你带到它附近的东西。");
         outputText("[pg]你开始在口袋里摸索，拿出你拥有的各种物品；它对某些物品没有反应，而另一些则让它的闪烁加快。你把这些挑了出来。当你测试完口袋里的所有东西后，你看着这颗蛋挑选出来的物品。当你把手放在蛋上考虑你的选择时，它再次开始兴奋起来，这让你感到惊恐。你把手抽开，它就平静下来了……显然，这颗蛋把<b>你</b>也当成了一件物品！!");
         menu();
         if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,532) >= 5 && FlagDict_Impl_.arrayReadInt(KFLAGS.flags,539) > 0 && FlagDict_Impl_.arrayReadInt(KFLAGS.flags,525) > 0)
         {
            outputText("[pg]<b>这颗蛋已经准备好孵化了——如果你也准备好了的话。</b>");
            addButton(0,"孵化",hatchZeMuzzles);
         }
         else if(get_player().get_lust() >= 33 && !get_player().isGenderless())
         {
            addButton(0,"自慰",masturbateOntoAnEgg);
         }
         else
         {
            addButtonDisabled(0,"自慰","这个场景需要你有生殖器和足够的性奋度。");
         }
         addButton(1,"血液",giveEmberBludSausages);
         if(get_player().hasItem(get_consumables().INCUBID))
         {
            _g = this;
            purified = false;
            addButton(2,"梦魇药剂",function():void
            {
               _g.useIncubusDraftOnEmber(purified);
            });
         }
         else
         {
            addButtonDisabled(2,"梦魇药剂");
         }
         if(get_player().hasItem(get_consumables().P_DRAFT))
         {
            _g1 = this;
            purified1 = true;
            addButton(3,"纯净药剂",function():void
            {
               _g1.useIncubusDraftOnEmber(purified1);
            });
         }
         else
         {
            addButtonDisabled(3,"纯净药剂");
         }
         if(get_player().hasItem(get_consumables().SUCMILK))
         {
            _g2 = this;
            purified2 = false;
            addButton(4,"魅魔乳液",function():void
            {
               _g2.useSuccubiMilkOnEmber(purified2);
            });
         }
         else
         {
            addButtonDisabled(4,"魅魔乳液");
         }
         if(get_player().hasItem(get_consumables().P_S_MLK))
         {
            _g3 = this;
            purified3 = true;
            addButton(5,"纯净乳液",function():void
            {
               _g3.useSuccubiMilkOnEmber(purified3);
            });
         }
         else
         {
            addButtonDisabled(5,"纯净乳液");
         }
         if(get_player().hasItem(get_consumables().EXTSERM))
         {
            addButton(6,"生发精华",hairExtensionSerum);
         }
         else
         {
            addButtonDisabled(6,"生发精华");
         }
         if(get_player().hasItem(get_consumables().OVIELIX))
         {
            addButton(7,"产卵灵药",useOviElixerOnEmber);
         }
         else
         {
            addButtonDisabled(7,"产卵灵药");
         }
         if(get_player().hasItem(get_consumables().LACTAID))
         {
            addButton(8,"催乳剂",useLactaidOnEmber);
         }
         else
         {
            addButtonDisabled(8,"催乳剂");
         }
         if(get_player().hasItem(get_consumables().LOLIPOP))
         {
            addButton(9,"棒棒糖",useLolipopOnEmber).disableIf(!get_allowChild(),"未成年内容已禁用。");
         }
         else
         {
            addButtonDisabled(9,"棒棒糖");
         }
         addButton(14,"返回",leaveWithoutUsingAnEmberItem);
      }
      
      public function discussExplorationWithEmber() : void
      {
         clearOutput();
         var _loc1_:int = Utils.rand(4);
         var _loc2_:int = 0;
         outputText("你向烬询问[Ember ey]在玛瑞斯上空探索时是否看到了什么有趣的新闻。");
         outputText("[pg]烬点了点头，若有所思地挠了挠[Ember eir]下巴。[say: 让我想想……]");
         if(_loc1_ == 0)
         {
            _loc2_ = Utils.rand(6);
            outputText("[pg][saystart]在我的旅行中，我发现了一条山脉。我在它周围飞了" + (littleEmber() ? "很长时间" : "好一阵子") + "……感觉好……熟悉，你知道吗？当我在那里的时候，我看到了");
            if(_loc2_ == 0)
            {
               outputText("小恶魔。只有几只小恶魔，而且它们看起来" + (littleEmber() ? "真的" : "非常") + "紧张。我猜不管那里" + (littleEmber() ? "" : "自然") + "生活着什么，都是它们绝对不想招惹的东西。");
            }
            else if(_loc2_ == 1)
            {
               outputText("两个地精在山脚下互相争吵。一个说另一个不应该上山，" + (littleEmber() ? "因为" : "显然是因为") + "住在在那里的牛头人对她这样未经训练的女孩来说太难对付了，会被撕裂的。第二个地精只是嘲笑她，叫她“懦夫”，并告诉她她会给自己弄到“一些多汁的牛屌和美味的牛头人精液”。" + (littleEmber() ? "她们真的很下流！" : "呃，恶心的小生物。"));
            }
            else if(_loc2_ == 2)
            {
               outputText("一对肌肉发达的牛头人正赤手空拳地互相殴打。他们花了一个多小时把对方打得血肉模糊，然后获胜者" + (littleEmber() ? "开始对失败者的屁股做下流的事情" : "立刻开始操失败者的屁眼") + "。我" + (littleEmber() ? "不想继续看下去了" : "到那时已经看够了") + "，所以我离开了。");
            }
            else if(_loc2_ == 3)
            {
               outputText("这个……" + (littleEmber() ? "东西" : "生物") + "……看起来有点像人类女性，但在她阴蒂的地方长着一根大鸡巴。她" + (littleEmber() ? "" : "一丝不挂地") + "走来走去，除了身上的一堆穿孔，还像牵宠物一样用一条链子牵着这个牛头人，链子连在一个固定在他龟头上的环上。");
            }
            else if(_loc2_ == 4)
            {
               outputText("几个地精在外面有门的洞穴外的石头上磨剪刀。真奇怪。" + (littleEmber() ? "我" : "") + "想知道他们在里面干什么？");
            }
            else if(Utils.randomChance(get_parasiteRating() * 25))
            {
               outputText("一群可怕的黏糊糊的白虫子，聚集成一个" + (littleEmber() ? "扭曲的人形" : "对人类形态的嘲弄") + "，并发出吧唧吧唧的声音。它设法" + (littleEmber() ? "抓" : "附") + "在这只双头狗生物身上，然后……呃！虫子开始强行钻进它的两个" + (littleEmber() ? "鸡巴" : "肉棒") + "里！我从来没见过这么恶心的东西！!");
            }
            else if(_loc2_ == 5)
            {
               outputText("这只双头狗在四处游荡；它" + (littleEmber() ? "看" : "发现") + "了一只小恶魔，然后" + (littleEmber() ? "开始追它" : "追了上去") + "。" + (littleEmber() ? "它" : "") + "设法抓住了这个丑陋的小恶魔，" + (littleEmber() ? "在吃掉它之前对它的屁股做了下流的事" : "然后强奸了它的屁股，接着把它吃掉了。"));
            }
         }
         else if(_loc1_ == 1)
         {
            if(FlagDict_Impl_.arrayReadFloat(KFLAGS.flags,2275) <= 0)
            {
               _loc2_ = Utils.rand(5);
            }
            else
            {
               _loc2_ = Utils.rand(4);
               if(_loc2_ == 3)
               {
                  _loc2_++;
               }
            }
            outputText("[pg][saystart]在我的旅行中，我发现了一片森林；我" + (littleEmber() ? "" : "必须承认我") + "避开了最深处，但那里有很多猎物。鹿、野猪、兔子、鹌鹑，还有" + (littleEmber() ? "一堆" : "一大群") + "其他东西……并非所有东西都很友好。让我想想，那里有");
            if(_loc2_ == 0)
            {
               outputText("一整群小恶魔，就在林间空地上闲逛，" + (littleEmber() ? "对自己做下流的事" : "自慰") + "或者为了食物" + (littleEmber() ? "打架" : "争吵") + "。恶心的小东西，但很容易解决。");
            }
            else if(_loc2_ == 1)
            {
               outputText("一个挺着大孕肚的地精，一边自己笑着，一边大口喝着她们酿造的麦酒，弄得自己满身都是。小享乐主义者。");
            }
            else if(_loc2_ == 2)
            {
               outputText("这个奇怪的蜂女生物……她制造了这种，这种开始扰乱我心智的音乐。我朝她吐了一团火焰，幸运的是，她吓得飞走了。");
            }
            else if(_loc2_ == 3 && FlagDict_Impl_.arrayReadInt(KFLAGS.flags,1204) > 0)
            {
               outputText("那个绿皮肤的生育机器婊子，塔玛尼。她让一些女儿吸吮她的乳汁，并咧嘴笑着说出她用来让她们怀孕的“战利品”的名字，敦促她们去追捕他。");
               if(emberIsFeminine())
               {
                  outputText("你应该更有尊严，而不是让那种无脑的" + (littleEmber() ? "荡妇" : "婊子") + "对你为所欲为！!");
               }
            }
            else if(_loc2_ == 3 && !get_game().forest.tamaniScene.pregnancy.get_isPregnant())
            {
               outputText("一个地精因为还没有怀孕而被一群怀孕的地精嘲笑。她只是反驳说，她想要一个比区区小恶魔“更好的猎物”来做她的播种机，然后就走开了。");
            }
            else if(Utils.rand(2) == 0 && FlagDict_Impl_.arrayReadInt(KFLAGS.flags,2311) <= 1 && !jojoFollower())
            {
               outputText("这个长着老鼠" + (get_noFur() ? "耳朵" : "特征") + "的僧侣，坐在林间空地上冥想。一个地精试图向他求欢；他只是给她上了一课，把她骂哭了。当一个小恶魔试图攻击他时，他用一根法杖敲碎了它的头骨。对于这么个瘦弱的小东西来说，身手还不错……...");
            }
            else
            {
               outputText("我在一个林间空地降落，想抓几只肥美的兔子，突然这个……这个由挥舞的藤蔓和水果组成的东西攻击了我。当然，我一烧它，它就化作一缕青烟消失了。");
            }
         }
         else if(_loc1_ == 2)
         {
            _loc2_ = Utils.rand(2);
            outputText("[pg][saystart]在我的旅行中，我发现了一个湖……又大又宽，里面满是鱼，但那个地方有些东西让我感到不舒服。水闻起来很怪，鱼吃起来也有股恶心的余味。那里没什么好看的，但我确实发现了");
            if(_loc2_ == 0)
            {
               outputText("一对鲨鱼女——嗯，一个是女人，另一个有乳房但也有鸡巴");
               if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,525) == 3)
               {
                  outputText("像我一样");
               }
               outputText("。她们在沙滩上，" + (littleEmber() ? "做爱" : "疯狂地操着对方") + "。");
            }
            else if(Utils.rand(3) == 0 && get_player().statusEffectv1(StatusEffects.MetWhitney) <= 1)
            {
               outputText("海岸线上有一个大农场。我看到某种牛女在照料辣椒田，还有一个狗女在放牛。它们看起来也很肥美……什么？我是说那些牛，笨蛋！而且我不会去抓它们——抢夺牲畜一点意思都没有。我更喜欢追捕鹿、野牛之类的东西。");
            }
            else if(Utils.rand(3) == 0 && get_player().hasStatusEffect(StatusEffects.FetishOn))
            {
               outputText("一对人类，在争论关于" + (littleEmber() ? "下流的事" : "性") + "。他们都想" + (littleEmber() ? "做" : "") + "，但男的说他想玩“调皮男学生和女老师”的戏码，而女的想玩“贵妇人和爱情奴仆”的戏码。真奇怪；他们争论时，衣服一直在变来变去。");
            }
            else if(Utils.rand(3) == 0 && !get_player().hasStatusEffect(StatusEffects.TookBlessedSword) && !get_player().hasStatusEffect(StatusEffects.BSwordBroken))
            {
               outputText("一把插在树上的剑。真奇怪；什么样的白痴会把武器那样插在那里？又是什么样的弱鸡拔不出来？");
            }
            else if(Utils.rand(3) == 0 && !get_rathazul().followerRathazul())
            {
               outputText("一个臭烘烘的鼠人在四处闲逛，旁边一些奇怪的设备在冒泡沸腾。我想他可能是一个炼金术士。");
            }
            else
            {
               outputText("一大团绿色的黏液，自顾自地滑行着。我发誓它看了我一眼，然后长出了一根阴茎……不过那应该不可能吧。");
            }
         }
         else if(_loc1_ == 3)
         {
            _loc2_ = Utils.rand(4);
            outputText("[pg][saystart]在我的旅行中，我发现了一片沙漠。我讨厌沙漠。虽然热气流不错，但那里" + (littleEmber() ? "" : "实在") + "太干太热了。而且大部分地方都是荒地。不过，我还是看到了一些有趣的东西；");
            if(_loc2_ == 0)
            {
               outputText("一个长着四个大乳房的女人，正把奶水从她的" + (littleEmber() ? "胸部" : "奶子") + "里挤出来，滴在沙子上。我都不知道乳房能装下那么多奶！!");
            }
            else if(_loc2_ == 1)
            {
               outputText("一整个恶魔部落，正在绿洲旁闲逛。要把他们揍一顿太麻烦了，所以我就没管他们——好吧，我承认，我确实低飞掠过他们，看着他们像受惊的羊群一样四处逃窜，还挺好玩的。");
            }
            else if(Utils.rand(2) == 0 && !get_player().hasStatusEffect(StatusEffects.WandererDemon) && !get_player().hasStatusEffect(StatusEffects.WandererHuman))
            {
               outputText("一个人类，他的蛋蛋大到必须用独轮车推着走，正和一个魅魔一起在荒地里跋涉。他们还在争论他到底要不要变成男魅魔。");
            }
            else
            {
               outputText("一个奇怪的生物，像是一个用蛇尾代替双腿的女人，在沙地里滑行。");
               if(get_player().isNaga())
               {
                  outputText("她看起来和你很像。");
               }
               else
               {
                  outputText("我以前从来没见过像她那样的生物。");
               }
            }
         }
         outputText("[sayend]");
         doNext(playerMenu);
         cheatTime(0.16666666666666666);
      }
      
      public function destroyBabyEmberYouMonster() : void
      {
         clearOutput();
         outputText("举起你的[weapon]，你对着蛋一次又一次地猛击。蛋壳异常坚硬，承受了大量的打击才碎裂开来，将一波蛋清洒在你的[feet]上；破碎的蛋壳里留下了一大团奇怪的蓝红色蛋黄。");
         outputText("[pg]你已经决定了一个物种的命运……你感到内疚，但这是最好的选择。无法知道这条龙孵化后会做什么。");
         outputText("[pg]洞穴里没有其他东西了，你准备离开，但突然被一个念头阻止了。蛋黄虽然是生的，但看起来却出奇地诱人……...");
         FlagDict_Impl_.arrayWriteInt(KFLAGS.flags,537,1);
         menu();
         addButton(0,"吃掉它",eatEmbersYolkLikeAnEvenBiggerDick);
         setExitButton();
      }
      
      public function decideToSparEmbra() : void
      {
         clearOutput();
         outputText("你觉得你需要一些练习，以便为冒险时遇到的任何情况做好准备，于是你问烬是否愿意和你切磋一下。");
         if(emberAffection() <= 25 && emberSparIntensity() <= 5)
         {
            outputText("[pg][say: 哈！你一定是在开玩笑。我们都知道你最后只会伤到自己。]");
            outputText("[pg]为了证明[Ember em]是错的，你挥舞着你的[weapon]。");
            outputText("[pg][say: 好吧，既然你这么想挨揍……] 烬把你带到营地边缘的一片空地，摆出了战斗姿势。");
         }
         else if(emberAffection() < 75 && emberSparIntensity() <= 15)
         {
            outputText("[pg][say: 你确定吗？我得让你知道，我可不会手下留情！] 烬警告你，摆出了[Ember eir]战斗姿势。");
            outputText("[pg]这正是你对[Ember em]的期望。你需要变强，而[Ember ey]是你所能期望的最好的陪练。");
            outputText("[pg]烬对你笑了笑。[say: 哈！奉承可不会让你得到任何怜悯！准备好了吗！]");
         }
         else
         {
            outputText("[pg][say: 好吧……别指望我会对你手下留情！我们龙族可是非常好胜的！我也不介意把你揍一顿，即使你是我的朋友！] 烬警告你，摆出了[Ember eir]战斗姿势。");
            outputText("[pg]你对[Ember em]咧嘴一笑，告诉[Ember em]放马过来——你太兴奋了，以至于没有因为这头龙公开称你为朋友而感到惊讶。");
         }
         startCombat(new Ember());
      }
      
      public function debugMenu(param1:Boolean = true) : void
      {
         get_game().debugMenu.debugCompEdit(saveContent,new SaveContent(null,null,null,null,null,null,null));
      }
      
      public function catchAnal() : void
      {
         clearOutput();
         get_images().showImage("ember-fucks-your-ass");
         outputText("你回想起烬在床上有些强势的倾向，问[Ember ey]是否有心情操你的屁股。");
         if(emberAffection() <= 25)
         {
            outputText("[pg][say: 什么！？那太恶心了！更不用说，根本塞不进去！]烬没有等你回答，就把你赶出了[Ember eir]的巢穴。");
            doNext(get_camp().returnToCampUseOneHour);
            return;
         }
         if(emberAffection() < 75)
         {
            outputText("[pg][say: 如果你真的是这么想的。也许，仅仅是也许……我可以为你这么做……]烬回答道，[Ember eir]的肉棒探了出来");
            if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,534) == 1 || FlagDict_Impl_.arrayReadInt(KFLAGS.flags,531) == 0)
            {
               outputText("从它藏身的地方");
            }
            outputText("，缓慢而稳定地变大。");
            outputText("[pg]你对[Ember em]笑了笑。");
         }
         else
         {
            outputText("[pg]烬咽了口唾沫，声音清晰可闻，一想到这个主意，[Ember eir]的肉棒就变得更硬了。[say: 好吧……但我只是为了你才这么做的。我从中得不到任何乐趣。]即使在[Ember ey]回答的时候，这只龙的肉棒也开始明显地跳动起来。");
            outputText("[pg]你告诉[Ember em]你完全理解，让[Ember em]用这个明显的谎言蒙混过关。");
         }
         outputText("[pg]烬把你带到离营地不远的地方，来到干涸河流旁的一小块空地上。" + emberMF("他","她") + "选了一块看起来比较茂盛的草地，指了指。你急切地脱下衣服，随意地把你的[armor]扔到一边，向烬展示你诱人的[ass]，");
         if(get_player().balls > 0)
         {
            outputText("当你向" + emberMF("他","她") + "拱起后背时，睾丸轻轻摇晃");
            if(get_player().hasVagina())
            {
               outputText("同时……");
            }
            else
            {
               outputText("。");
            }
         }
         if(get_player().hasVagina())
         {
            outputText("你的[clit]随着时间的流逝不断滴下淫液。");
         }
         outputText("[pg]烬贪婪地注视着你赤裸身体的每一寸肌肤，[Ember eir]长长的舌头滑了出来，已经流出了口水，然后又被吵闹地吸了回去。[say: 记住，我只是因为你要求才这么做的；我对此没有任何快感，][Ember ey]声明道，尽管[Ember eir]勃起得非常厉害。终于等不及了，[Ember ey]扭动着腰肢走向你，尾巴在[Ember em]身后轻轻摆动，肉棒随着[Ember ey]的靠近上下跳动。");
         outputText("[pg]烬停在你正后方，轻轻地摩擦着");
         if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,531) == 0 || FlagDict_Impl_.arrayReadInt(KFLAGS.flags,534) > 0)
         {
            outputText("分节的");
         }
         else
         {
            outputText("光滑的");
         }
         outputText("肉棒在你[ass]瓣间摩擦，让你感受到从顶端滴落的先头液带来的清凉。[say:这样……行不通，][Ember ey]低吼道。");
         outputText("[pg]" + emberMF("His","Her") + "双手抓住你的屁股，缓慢而坚定地揉捏着，带着贪婪的期待抚摸和按摩着。从你所在的位置看不到[Ember ey]在做什么，但你绝对能听到。身后传来柔软湿润的吸吮和吧唧声，你意识到这条龙一定是在舔[Ember eir]自己的阴茎，直到它沾满黏糊糊的龙涎。");
         outputText("[pg]你绝对没想到[Ember ey]会如此……亲密地给[Ember eir]阴茎润滑。一想到要被[Ember eir]沾满唾液的阴茎插入并吞没到深处，你的性欲就涌遍全身，让你感到一阵眩晕。");
         outputText("[pg][say:我想现在可以了，]烬轻声说道，将长长的舌头吸回[Ember eir]");
         if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,531) > 0)
         {
            outputText("嘴里");
         }
         else
         {
            outputText("嘴里");
         }
         outputText("并用[Ember eir]阴茎意味深长地在你的后庭滑动。[say:你确定要这样吗？最后退出的机会。]就好像你现在会拒绝一样，你已经迫不及待地想要一根又热又硬的阴茎填满你的屁股了。你翘起屁股，向[Ember em]展示你已经准备好了。");
         outputText("[pg]" + emberMF("He","She") + "饥渴地低吼着，不再浪费时间。手指深深地陷入你的[butt]，[Ember ey]强行将[Ember eir]龟头推入你的[asshole]，并开始向里推进");
         if(get_player().ass.analLooseness == 0 || get_player().analCapacity() < (littleEmber() ? 7 : 25))
         {
            outputText("，当[Ember eir]敏感的龟头努力挤进去时，你们俩都疼得倒吸一口凉气。[say:真不敢相信你真的想让我插这里……你太紧了，都有点疼了，][Ember ey]呜咽道。");
         }
         if(get_player().analCapacity() < (littleEmber() ? 24 : 50))
         {
            outputText("，当[Ember eir]");
            if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,531) == 0 || FlagDict_Impl_.arrayReadInt(KFLAGS.flags,534) == 1)
            {
               outputText("龙");
            }
            outputText("根滑入你体内时，你喘息着；当[Ember eir]唾液摩擦着你肛门内壁时，你被撑开，疼得倒吸一口凉气。[say:感觉很紧……幸好我做好了准备，][Ember ey]喘息着说道。");
         }
         else
         {
            outputText("；你松弛的[asshole]没有给[Ember em]任何阻力，[Ember ey]毫不费力地滑了进去。[say:哈……比我想象的要容易，][Ember ey]惊讶地说道。[say:你都经历了些什么？]");
         }
         get_player().buttChange(littleEmber() ? 10 : 32,true,true,false);
         outputText("[pg]烬开始缓慢地抽插，轻轻地引导着[Ember eir]");
         if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,531) == 0 || FlagDict_Impl_.arrayReadInt(KFLAGS.flags,534) == 1)
         {
            outputText("龙");
         }
         outputText("根进出，深入你最深处的隐秘地带，摩擦着正确的位置。");
         outputText("[pg]当烬在你体内抽插时，你喘息呻吟着，感觉到[Ember em]将[Ember eir]肉棒伸展到最长，并以此将[Ember emself]推入你肠道更深处。");
         if(get_player().hasCock())
         {
            outputText("你能感觉到龙的肉棒摩擦着你的前列腺，让[eachcock]痛苦地勃起，冒出先头液，顺着肉棒滴落到地上。");
         }
         if(get_player().hasVagina())
         {
            outputText("这种刺激也开始让你湿润，你的[vagina]流出女性的爱液");
            if(get_player().balls > 0)
            {
               outputText("流过你的[balls]");
            }
            outputText("在你身下汇聚成一滩");
            if(get_player().hasCock())
            {
               outputText("，与你的前列腺液混合，形成一滩不断扩大的混合体液。");
            }
         }
         outputText("[pg][say: 哦！我要开始动了……] 烬说着，开始加快节奏，随着[Ember eir]越来越快的抽插，轻轻地摇晃着你。操，[Ember ey]刚才难道没在动吗？你喉咙深处发出一声长长而空洞的呻吟，品味着这深入的探索。你试图享受，完全沉浸在快感中，却发现自己并不满足。这只龙似乎就是找不到合适的节奏，你乞求[Ember em]加快速度，真正地干你……你又不是玻璃做的，不会坏的。");
         outputText("[pg]烬皱起[Ember eir]眉头。[say: 你想要？好，我给你……] " + emberMF("他","她") + "低吼着——或者说是呼噜声？终于，你要得到你想要的了；你能感觉到烬抬起[Ember eir]臀部，准备对你发起猛烈的攻势，正如[Ember eir]所说，这只龙终于开始在你体内像活塞一样抽插，拍打着你的屁股，奏响了一曲充满原始快感和狂野性爱的淫荡奏鸣曲。");
         if(get_player().balls > 0)
         {
            outputText("" + emberMF("他","她") + "自己的蛋蛋撞向你的，每一次碰撞都有一股尖锐的快感流遍你的全身。");
         }
         outputText("[pg]你喉咙里发出叫喊，品味着你的龙又硬又快地捣入你体内的感觉。烬俯身压在你身上，从背后抱住你，[Ember eir]臀部继续不受控制地运动着；[Ember eir]舌头伸在外面，[Ember ey]在你耳边火热地喘息着。[say: 呃……太爽了。真不敢相信这感觉。啊！……我从没想过……哈！……会是这样。来-来吧[name]，为我摇晃那屁股。让我看看你有多爽！] 烬似乎迷失在你[butt]带来的快感中了。");
         outputText("[pg]你挺动并用你的后庭摩擦着烬的肉棒，尽你所能用肛门肌肉挤压、挑逗和绞紧……但是，还是感觉不太对。你忍不住笑着，用开玩笑的语气警告烬，也许你得掌控局面，向[Ember em]展示到底该怎么好好干你。");
         outputText("[pg][say: 好！！向我展示一切！我想看到一切，感受一切，了解关于你的一切！] 烬大声回应。");
         outputText("[pg]那好吧；");
         if(get_silly())
         {
            outputText("接管直接控制权。");
         }
         else
         {
            outputText("是时候掌控局面了。");
         }
         outputText("你绷紧肌肉，从地上撑起身体，推向[Ember em]，试图把这只龙推倒，让[Ember eir]仰面躺下。烬沉浸在快感中，甚至没有试图反抗，伴随着沉重的<i>砰</i>的一声倒下。[say: 啊！要骑我的小龙了吗？] [Ember ey]对你喘息着，兴奋得根本不在乎[Ember ey]已经不再是掌控者了。");
         outputText("[pg]你带着坏笑在烬的腿上转过身，烬的肉棒在你深处滑动的感觉让你高兴得发抖，直到你与这只挣扎扭动的龙面对面。你伸出手捏住[Ember eir]乳头，手指诱人地顺着[Ember eir]");
         if(pregnancy.get_event() > 3)
         {
            if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,530) == 0)
            {
               outputText("肿胀的");
            }
            else
            {
               outputText("满载着蛋的");
            }
         }
         outputText("肚子滑下，开始起伏，让你的屁股像活塞一样上下运动。你完全掌控了这场性爱，并且你打算好好利用这一点。");
         outputText("[pg][say: 感觉怎么样？我的肉棒深深插在你体内？希望我能让你爽……啊！] [Ember ey]喘息着。");
         outputText("[pg][say: 我不知道；顺便搭个便车感觉怎么样？] 你厚颜无耻地评论道。");
         outputText("[pg][say: 哈！最棒的……骑乘……啊！] 烬淫荡地咕哝着，当你把[Ember em]按倒时，[Ember ey]尽[Ember eir]所能把[Ember eir]肉棒像活塞一样插进你贪婪的屁股里。");
         outputText("[pg]你低头看着身下挣扎的龙，咧嘴一笑。你动作缓慢而刻意地抬起身体，直到[Ember eir]肉棒几乎要滑出来……然后，你极其缓慢地将臀部压向[Ember eir]大腿，直到你吞下了[Ember eir]那" + (littleEmber() ? "五" : "十六") + "英寸的每一寸。你一次又一次地重复这个动作，带着残忍的天真，想知道[Ember ey]还要多久才会爆发，把一发浓稠的龙精射进你的肚子里。");
         outputText("[pg][say: [name]！我要射了！啊！射进你这美丽、奇妙的屁股里！哦！吻我！我想在占有你的时候感受到你的全部！] [Ember ey]向你嚎叫着，完全沉浸在情绪中，已经顾不上[Ember eir]形象了。");
         outputText("[pg]你弯下腰，尽可能深地吻了[Ember em]，用舌头舔舐[Ember eir]嘴唇，邀请[Ember em]也用[Ember eir]舌头回应。与此同时，你继续收缩内部肌肉，按摩着[Ember em]，直到[Ember ey]别无选择，只能释放……...");
         outputText("[pg]你可以看到烬最终爆发的完美瞬间；[Ember eir]眼睛翻白，[Ember ey]发出愉悦的呼噜声，让你的喉咙也感受到轻微的震动。" + emberMF("他","她") + "的肉棒抽动了一次，两次，然后最终膨胀起来，将烬所有积蓄的精液释放到你的肠道里。你甚至能感觉到，随着[Ember ey]泵入你体内的每一团精液，[Ember eir]蛋蛋都在收缩，用[Ember eir]愉悦淹没了你。");
         outputText("[pg]感受到龙精涌入体内，你呻吟着喘息，烬那浓郁、充满活力的精液让你的肚子胀了起来。这种感觉令人难以置信，你也忍不住跟着高潮了");
         if(get_player().get_gender() > 0)
         {
            outputText("，");
         }
         if(get_player().hasVagina())
         {
            outputText("你的小穴喷涌出女性的淫液，涂满了烬的肚子");
         }
         if(get_player().hasVagina() && get_player().hasCock())
         {
            outputText("和");
         }
         if(get_player().hasCock())
         {
            outputText("你的肉棒");
            if(get_player().cumQ() < 250)
            {
               outputText("将大股精液喷射到烬的上半身");
            }
            else if(get_player().cumQ() < 1000)
            {
               outputText("将精液如雨点般洒在仰卧的龙身上");
            }
            else
            {
               outputText("将你的男人精华倾泻在你那沉浸在极乐中的爱人身上，直到[Ember ey]完全被一层精液覆盖");
            }
         }
         outputText("。");
         outputText("[pg]烬紧紧抱住你，享受着余韵");
         if(get_player().get_gender() > 0)
         {
            outputText("并将你自己高潮的产物蹭在你身上");
         }
         outputText("。你顺从地依偎在龙的怀抱中，在[Ember em]身上蹭着，在经历了一场酣畅淋漓的性爱后感到困倦而幸福。可悲的是，这片刻的喘息并没有持续多久；当烬的身体变热时，你感到有些不适。抬起头，你看到[Ember eir]眼睛睁得大大的。还没等你问[Ember em]怎么了，[Ember ey]就猛地把你推开了。");
         outputText("[pg][say: 你……你……你这个变态！你……你怎么敢让我说那些……那些……令人尴尬的话……而且……而且……你还亲了我！就那样！你把我的舌头从我嘴里拉出来，吸进你嘴里……呃……光是想想就……] 与烬嘴上说的相反，你实际上看到[Ember eir]半勃起的肉棒变得更硬了，因为这条龙又开始发情了！!");
         outputText("[pg]你慵懒地笑了笑；据你回忆，[Ember ey]当时很享受。你的手滑到你的[legs]之间，轻轻抹起一把从你刚被填满的屁眼滴落的龙精，递给[Ember em]。你当然不是自己把肚子填满的。");
         outputText("[pg]烬做出了[Ember ey]能做出的最厌恶的表情。[say: 呃！我需要洗个澡！现在！] 伴随着一个快速的转身，[Ember ey]冲出去找小溪了。你看着[Ember em]离去，苦涩地笑了笑；你已经习惯了这条龙的行为方式，你知道[Ember ey]确实很享受，但这种做戏可能有点令人厌倦。你抓起一把干草，擦掉身上最严重的体液污渍，重新穿好衣服，慵懒地走回营地。");
         emberAffection(6);
         get_player().orgasm("Anal");
         dynStats(DynStat.Sens(3));
         get_player().slimeFeed();
         doNext(get_camp().returnToCampUseOneHour);
      }
      
      public function breedEmberPregnantAsIfThereWasAnyOtherKindOfBreeding() : void
      {
         var emberPregged:Boolean;
         var _g:EmberScene;
         clearOutput();
         var _loc1_:IMap = KFLAGS.flags;
         FlagDict_Impl_.arrayWriteInt(_loc1_,544,FlagDict_Impl_.arrayReadInt(_loc1_,544) + 1);
         var _loc2_:int = get_player().cockThatFits(emberVaginalCapacity());
         if(_loc2_ < 0)
         {
            _loc2_ = get_player().smallestCockIndex();
         }
         outputText("烬抓住你，把你翻转过来，将你压在[bed]上。" + (littleEmber() ? "小女孩" : "她") + "诱惑地对你微笑，伸手去抚摸你的" + get_player().cockDescript(_loc2_) + "。");
         if(get_player().balls > 0)
         {
            outputText("然后她把手伸得更低，揉捏着你充满精液的睾丸。");
         }
         if(get_player().hasVagina())
         {
            outputText("她的尾巴尖轻轻地挑逗着你湿滑的[vagina]，动作细微。");
         }
         outputText("你浑身一颤，本能地向她挺动，让她感受到你那渴望的阴茎，饱满而又渴望成为父亲。");
         outputText("[pg][say: 你太性感了……你根本不知道，]烬如梦似幻地发出呼噜声。你带着温柔的微笑告诉她，她自己也很性感——这也许不是最明智的话，但你那被汹涌的荷尔蒙搅得晕头转向的大脑里，只能想到这些了。你被她身上散发出的美味气息迷住了，现在她离你这么近，如此成熟，如此准备就绪……...");
         outputText("[pg]烬暂时从你身上跳开，吸入你的体香，抚摸着你，直到你的" + get_player().cockHead(_loc2_) + "上形成一滴先露。烬的眼睛睁得大大的，仿佛发现了一颗珍珠；她毫不犹豫地伸出舌头，将那滴液体舔掉。[say: 嗯，真美味……你准备好了，我也是！]");
         outputText("[pg]你将阴茎向上瞄准；烬跨坐在你身上，将自己降到你跳动的" + get_player().cockDescript(_loc2_) + "上，当你的滚烫肉体终于接触到她的" + (littleEmber() ? "小巧的阴户" : "流着淫水的肉洞") + "时，她发出了愉悦的嘶嘶声");
         if(emberHasCock())
         {
            outputText("，她自己的阴茎也弹了起来，随着这触电般的接触而跳动。");
         }
         else
         {
            outputText("。");
         }
         outputText("[pg]你对她发出嘶嘶声作为回应，这种感觉让你充满了愉悦，你那渴望繁殖的肉棒终于插进了" + (emberChildren() < 1 && littleEmber() ? "你希望尽管她外表如此，但仍是一个成熟、准备就绪的繁殖洞" : "一个成熟、准备就绪的繁殖洞") + "，她那凉爽的内壁包裹着你滚烫的肉体。");
         outputText("[pg]你抓住她的肩膀，感受着鳞片和下面坚如钢铁的肌肉，开始向她体内挺进，扭动着臀部，像活塞一样抽插，将自己推入那个凉爽、湿润的洞穴，完全屈服于让" + (littleEmber() ? "这个小孩子" : "她") + "怀孕的渴望。");
         outputText("[pg][say: 啊！是的！我-我的胸部！呃！求你了！]烬乞求着，抓住你的肩膀作为支撑；她那迷离的眼睛深深地看着你，被与你繁殖的渴望所征服。你隐约听到了她的请求，开始抚摸和揉捏你龙族情人的" + (littleEmber() ? "可爱、平坦的胸部" : "巨大、沉重的乳房") + "，感觉到了");
         if(littleEmber())
         {
            outputText("小巧的乳头变硬了");
            if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,529) > 0)
            {
               outputText("并且渗出乳汁");
            }
         }
         else
         {
            if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,531) == 0)
            {
               outputText("覆盖着鳞片的");
            }
            outputText("肉球轻轻挤压");
            if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,529) > 0)
            {
               outputText("并渗出乳汁");
            }
         }
         outputText("在你的抓握下。");
         outputText("[pg]烬呻吟着，将胸部挺向你的双手，任由你把玩她的乳头（这难道不奇怪吗？一个爬虫类女孩竟然有" + (littleEmber() ? "" : "乳房和") + "乳头？你脑海中隐约闪过这个念头），但是");
         if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,529) > 0)
         {
            outputText("缓缓流淌的乳汁以及");
         }
         outputText("烬愉悦的呻吟足以让你抛开这些想法，你很高兴她有这些！!");
         outputText("[pg]你饥渴地亲吻她");
         if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,531) == 0)
         {
            outputText("龙");
         }
         else
         {
            outputText("如此像人类的");
         }
         outputText("脸庞，轻轻咬着她的嘴唇，用舌头卷着她的舌头，品尝着她非人的味道；烬也以吻回应，在你的嘴里发出呼噜声和呻吟声。" + (littleEmber() ? "" : "当你揉捏、托起并把玩她的乳房时，它们震颤着按摩你的双手。"));
         if(emberHasCock())
         {
            outputText("[pg]你感觉到有什么东西戳到了你的[chest]，低头一看，是烬那根硬得发疼的");
            if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,531) == 0 || FlagDict_Impl_.arrayReadInt(KFLAGS.flags,534) == 1)
            {
               outputText("龙族");
            }
            outputText("肉棒。你嘴角勾起一抹调皮的微笑，将烬拉入更深的吻中，抓住她的阴茎，用力地套弄起来。");
         }
         outputText("[pg]烬在你的吻中尖叫起来——你没想到这个平时粗鲁的龙竟然能发出如此少女的尖叫。她的小穴收缩着，拉扯着你跳动的阴茎；");
         if(emberHasCock())
         {
            outputText("她的肉棒在你的[chest]上喷射出几股精液；");
         }
         outputText("她的眼睛翻白。伴随着一声闷吼，她终于屈服了，一股名副其实的龙之体液如波涛般冲击着你的下半身，在你的[bed]上汇聚成一滩，让整个[cabin]充满了美妙的性爱和信息素的气味。");
         if(emberHasCock())
         {
            outputText("烬的肉棒不断喷射出精液，弄湿了[cabin]的侧面，当她在你身上排空自己时，这只会增加本已浓烈的性爱气味。");
         }
         outputText("[pg]烬结束了亲吻，喘着粗气，用混合着爱意、满足和渴望的眼神看着你。你也充满需求地回望着她，浑身湿透了性液，空气中弥漫着浓重的麝香味。这还不够，你还没高潮。你需要高潮！!");
         outputText("[pg]你不假思索地、本能地在烬的脖子侧面咬了一口——虽然不够深，没见血（尤其是考虑到她那装甲般的鳞片），但这是一种宣示主权的标志。与此同时，你继续挺动腰身，在她体内抽插，渴望着释放，渴望着受精的那一刻。");
         outputText("[pg]烬吐出舌头，向你露出脖子，这是一种你平时很难见到的臣服姿态。不过，这并没有持续太久。看到烬的脸上完全被幸福占据，你忍不住再次吻了她，将她的舌头吸回你的嘴里，再次品尝她的味道。你再次感觉到她的肉壁在收缩；");
         if(emberHasCock())
         {
            outputText("她那射过的肉棒在跳动；");
         }
         outputText("当她达到第二次高潮时，她舒服地紧闭双眼。你用自己的呻吟掩盖了她欢愉的呻吟。第二波龙液加入了第一波的行列，打湿了你的下半身，还有你的[bed]。");
         if(emberHasCock())
         {
            outputText("一小团一小团的精液从她的肉棒溢出，顺着她的阴茎滑落，聚集在你的肚脐上。");
         }
         outputText("她的尾巴缠绕着你，帮助她保持姿势，同时她像烂泥一样瘫软在你身上。");
         outputText("[pg][say: 我……我不能再这样下去了，]烬低语着，瘫倒在你身上，四肢的力气都被抽干了。");
         outputText("[pg]但你已经很接近了……就差一点点……你向她保证很快就会结束，同时你继续抽插，拼命想要抓住那近在咫尺的释放。");
         outputText("[pg][say: 好吧，我试试，]烬疲惫地回答，但她只能在你身上再弹跳几下，然后就瘫软下来，差点掉下去。你太渴望了，不能让这阻止你；你把她滚到铺盖卷上，自己骑在她身上，继续凭着盲目的本能抽插。");
         outputText("[pg]烬甚至没有抗议，她只是呻吟着，尽可能地用身体缠住你，像抓住救命稻草一样紧紧抱着你。");
         outputText("[pg]然后，终于，你感觉到自己冲过了临界点，释放了所有积攒的精液；");
         if(get_player().hasVagina())
         {
            outputText("你那被冷落的小穴喷出淫液，顺着你的[legs]流下，并且");
         }
         outputText("你的" + get_player().cockDescript(_loc2_) + "喷涌进这个" + (littleEmber() ? "小女孩" : "龙") + "准备好的子宫里。");
         outputText("[pg]烬感觉到你滚烫的种子射入她的子宫，寻找着" + (littleEmber() ? "" : "她的") + "受精卵，她发出低吼和呼噜声。她的阴唇紧紧夹住你的阴茎，形成水密的密封，防止你的种子溢出，同时她的肉壁努力地榨取你。");
         if(get_player().cumQ() < 250)
         {
            outputText("虽然你通常不会射那么多，但烬收缩的肉壁简直是在把你体内的精液吸出来；迫使你交出比平时更多的量……而你非常乐意这样做！!");
         }
         else if(get_player().cumQ() < 1000)
         {
            outputText("你慷慨的精液顺着通道流向她等待的子宫。事实上，由于你的阴茎正在享受烬收缩、几乎在吸吮的阴道壁带来的美妙按摩，你发现自己泵出的精液比平时还要多，很快就把她填得满满当当，甚至溢出来。直到烬的肚子微微隆起，你才停下来。");
         }
         else
         {
            outputText("你把一大股精液射进烬等待的肚子里，但她收缩的肉壁似乎还在不断地榨取你！烬被填得满满当当，她的肚子已经微微隆起，但你仍然继续用你的种子填满她。烬紧闭的阴唇意味着精液无处可去，所以它聚集在她的子宫里，撑大了她的肚子，直到她看起来至少怀孕了几个月；从烬喘息的脸上那愉悦的表情来看，你觉得她并不介意。");
         }
         outputText("[pg]伴随着一声喘息和彻底解脱的叹息，你瘫倒在烬的怀里，倒在她");
         if(emberHasCock())
         {
            outputText("沾满精液的");
         }
         outputText("肚子上，躺在那里恢复体力，");
         if(emberHasCock())
         {
            outputText("对夹在你们之间那根疲软的肉棒毫不在意，因为你开始");
         }
         outputText("感觉到她腹部传来的热量，这标志着一个新生命的开始。");
         outputText("[pg]烬发出满足的呼噜声，将你拉入另一个吻中，用她的尾巴、双腿和手臂紧紧抱住你；意图让你乖乖待在原地。好吧，反正你也去不了别的地方，因为她的小穴已经把你的" + get_player().cockDescript(_loc2_) + "紧紧锁在深处了。");
         outputText("[pg]结束了这个吻，她在你耳边低语，[say:别以为这就能让我们成为正式伴侣。] 然后她在你脸颊上飞快地啄了一下，补充道，[say:但我确实爱你。] 接着她瘫倒在你的[bed]上，准备小睡一会儿。");
         outputText("[pg]考虑到在烬那紧致的下体愿意放开你之前，你还有些时间，你依偎在她身边，也准备小睡一会儿……...");
         pregnancy.knockUp(25,336,emberIsHerm());
         get_player().createStatusEffect(StatusEffects.EmberFuckCooldown,36,0,0,0);
         get_player().removeStatusEffect(StatusEffects.Rut);
         get_player().orgasm("Dick");
         dynStats(DynStat.Sens(-2));
         _g = this;
         emberPregged = true;
         doNext(function():void
         {
            _g.emberBreedingAfterMathWatchOutForRadioactiveFallout(emberPregged);
         });
      }
      
      public function bloodForTheBloodGod() : void
      {
         var output1:Boolean;
         var _g:EmberScene;
         clearOutput();
         outputText("你问烬是否愿意让你尝尝[Ember eir]血，你渴望蕴含其中的力量。");
         if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,543) == 1 && !get_debug())
         {
            outputText("[pg][say: 抱歉，但我还在从上次的事情中恢复，所以不能给你血，]烬一本正经地说道。");
            _g = this;
            output1 = false;
            doNext(function():void
            {
               _g.emberCampMenu(output1);
            });
            return;
         }
         if(emberAffection() <= 25)
         {
            outputText("[pg][say: 什么！？我为什么要为了你伤害自己？！]烬愤愤不平地朝你吐了一个小火圈，然后走开了。");
            doNext(playerMenu);
            return;
         }
         if(emberAffection() < 75)
         {
            outputText("[pg][say: 嗯……好吧！如果有什么的话，我可能会传染给你一点。你可以变得更威风一点！]烬用爪子在[Ember eir]手掌上划了一道口子，把流血的手伸向你。");
            outputText("[pg]你伸出手，将其握在你的手中");
            if(get_player().cor < 50)
            {
               outputText("，表达你的感激之情；你温柔地亲吻[Ember eir]手指，然后是伤口，让那冰凉、带着铁锈味的气息在你的唇舌间流转。你小心翼翼地舔舐着，尽量避免引起疼痛，饮下[Ember ey]如此慷慨提供给你的东西。");
            }
            else
            {
               outputText("，迅速将其拉到嘴边，用嘴唇封住伤口，急切地不让一滴血漏掉。");
            }
            outputText("[pg]当你开始舔舐[Ember eir]伤口时，烬皱了皱眉，但很快恢复了镇定。你飞快地抬起眼睛看了看[Ember eir]脸；[Ember ey]有点慌乱，很明显你的舔舐至少给[Ember em]带来了一些缓解伤口疼痛的作用。");
            outputText("[pg]当你饮下血液时，你感到一股能量涌遍全身；你感到高尚、强大且博学。谁知道如果你继续喝下去会发生什么……...");
            menu();
            addButton(0,"继续",drinkDeeplyOfDagronBlud);
            addButton(1,"停止",noMoDagronBlud);
         }
         else
         {
            outputText("[pg][say: 我觉得你表现得够好了，值得我帮个小忙……但我希望你能让我觉得物有所值。过来拿吧。]");
            outputText("[pg]烬用一颗邪恶的匕首般的尖牙咬破了[Ember eir]的舌头，然后将舌头伸出嘴唇几英寸，把蓝色的血液涂抹在嘴唇上，张开双臂，用一个小小的吻邀请你。");
            outputText("[pg]让" + (littleEmber() ? "你的小" + emberMF("男","女") + "朋友" : "[Ember em]") + "久等是不礼貌的；你滑过去，任由[Ember em]将你拥入[Ember eir]的怀抱，并将那条流血的舌头吸入你的口中。");
            outputText("[pg]烬回吻了你；[Ember eir]流血的舌头充满爱意地抚摸着你的舌头。");
            outputText("[pg]当你饮下血液时，你感到一股能量涌遍全身；你感到高尚、强大而博学。谁知道如果你继续喝下去会发生什么？");
            menu();
            addButton(0,"继续",drinkDeeplyOfDagronBlud);
            addButton(1,"停止",noMoDagronBlud);
         }
         FlagDict_Impl_.arrayWriteInt(KFLAGS.flags,543,1);
         var _loc1_:int = Utils.rand(4);
         if(_loc1_ == 0)
         {
            dynStats(DynStat.Str(1));
         }
         else if(_loc1_ == 1)
         {
            dynStats(DynStat.Tou(1));
         }
         else if(_loc1_ == 2)
         {
            dynStats(DynStat.Spe(1));
         }
         else
         {
            dynStats(DynStat.Inte(1));
         }
      }
      
      public function beatEmberSpar() : void
      {
         clearOutput();
         var _loc1_:int = emberSparIntensity();
         if(emberAffection() <= 25)
         {
            outputText("烬仰面躺着，而你则得意洋洋地站在被击败的龙面前。你伸出援助之手，打算把[Ember em]拉起来，但[Ember ey]却把它拍开了，因为[Ember eir]失败而羞愧地退缩了。");
            outputText("[pg][say: 我不需要你的帮助，你……你……骗子！]");
            outputText("[pg]再说一遍？你光明正大地赢了这场战斗。这是[Ember eir]自己低估你的错。");
            outputText("[pg][say: 是的，好吧！也许我错了，但你还是作弊了！你趁我分心的时候攻击我！那就是作弊！] 烬甚至不给你回答的时间，就起身飞走了。[say: 下次你可没这么好运了！] [Ember ey]在空中对你喊道。");
            outputText("[pg]你失望地叹了口气；你不知道为什么你期望烬不要那么输不起，但你确实这么期望了。往好处想，也许[Ember ey]从现在开始会收敛一下那种态度……...");
            outputText("[pg][say: 啊！下次我一定会赢的！] 远处传来了喊声。");
            outputText("[pg]也许不会。");
            emberAffection(10);
         }
         else if(emberAffection() < 75)
         {
            outputText("烬仰面躺着，而你则得意洋洋地站在被击败的龙面前。你伸出援助之手，打算把[Ember em]拉起来；[Ember ey]接受了。");
            outputText("[pg][say: 这次算你赢了……但你只是运气好！别以为下次还能打败我！]");
            outputText("[pg]你当然希望[Ember ey]下次能打得更好点……还是说[Ember ey]刚才对你手下留情了？");
            outputText("[pg]烬瞪着你。[say: 你在嘲笑我吗？我从来不留手！从来不！]");
            outputText("[pg]你微笑着摆了个姿势。如果是这样的话，那你确实变强了。");
            outputText("[pg]烬喷出一小股烟。[say: 是，行吧……我还是觉得你只是运气好！要不是我分心了，现在就是我拉你起来了！]");
            outputText("[pg]" + emberMF("他","她") + "又喷了口气，转过身走开了；虽然[Ember ey]看起来很生气，但[Ember eir]轻快的步伐让你知道，[Ember ey]其实很享受你们的这场小切磋。");
            emberAffection(8);
         }
         else
         {
            outputText("烬仰面躺在地上，而你得意洋洋地站在被击败的龙上方。你伸出援手，打算拉[Ember em]起来；[Ember ey]高兴地接受了你的帮助。");
            outputText("[pg][say: 好吧……我承认你还是有点本事的，]烬承认道。[say: 下次我一定会把你揍趴下，我保证！]你微笑着，知道这条龙咽下了多少骄傲，并告诉[Ember em]到时候走着瞧。");
            outputText("[pg][say: 好吧，那我们回去吧，]烬说着，把你拉近，和你一起走回营地。");
            emberAffection(5);
         }
         var _loc2_:IMap = KFLAGS.flags;
         FlagDict_Impl_.arrayWriteInt(_loc2_,2108,FlagDict_Impl_.arrayReadInt(_loc2_,2108) + 1);
         if(emberSparIntensity() >= 5 && _loc1_ < 5)
         {
            outputText("[pg]<b>烬现在会在随后的切磋中使用[Ember eir]的龙息特殊攻击。伤害随强度增加。</b>");
         }
         if(emberSparIntensity() >= 15 && _loc1_ < 15)
         {
            outputText("[pg]<b>烬现在会在随后的切磋中使用[Ember eir]的龙力特殊攻击。此类攻击可能会击晕你。</b>");
         }
         if(emberSparIntensity() >= 30 && _loc1_ < 30)
         {
            outputText("[pg]<b>烬的龙力特殊攻击现在有50%的几率无视坚决特质。此外，烬的龙力特殊攻击的冷却时间现在减少了一回合。</b>");
         }
         if(emberSparIntensity() >= 45 && _loc1_ < 45)
         {
            outputText("[pg]<b>烬的龙力特殊攻击的冷却时间现在减少了一回合。</b>");
         }
         get_combat().cleanupAfterCombat();
      }
      
      public function askEmberForEggshell() : void
      {
         clearOutput();
         outputText("你问烬是否愿意把蛋壳给你。毕竟，它可能有什么用处。");
         outputText("[pg][say: 好吧。既然我喜欢你，我就把蛋壳给你，] 烬说道。" + emberMF("他","她") + "走进巢穴的黑暗中，过了一会儿，她带着蛋壳碎片回来了。");
         outputText("[pg][say: 把这些带给沙漠那座城市里的护甲匠，] [Ember ey]说道。你感谢[Ember em]给了你蛋壳。");
         FlagDict_Impl_.arrayWriteInt(KFLAGS.flags,537,1);
         outputText("[pg](<b>获得关键物品：龙蛋壳</b>)");
         get_player().createKeyItem("Dragon Eggshell",0,0,0,0);
         doNext(playerMenu);
         cheatTime(0.3333333333333333);
      }
   }
}

