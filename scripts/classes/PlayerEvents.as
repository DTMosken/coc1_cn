package classes
{
   import classes._FlagDict.FlagDict_Impl_;
   import classes.globalFlags.KFLAGS;
   import classes.internals.Utils;
   import classes.internals.WeightedChoice;
   import classes.items.Armor;
   import classes.items.ArmorLib;
   import classes.items.ConsumableLib;
   import classes.items.Jewelry;
   import classes.items.JewelryLib;
   import classes.items.Mutations;
   import classes.scenes.Inventory;
   import classes.scenes.areas.volcanicCrag.CorruptedCoven;
   import flash.Boot;
   import haxe.IMap;
   
   public class PlayerEvents extends BaseContent implements TimeAwareInterface
   {
      
      public static var VAGINA_RECOVER_THRESHOLD_LOOSE:Number = 200;
      
      public static var VAGINA_RECOVER_THRESHOLD_GAPING:Number = 100;
      
      public static var VAGINA_RECOVER_THRESHOLD_GAPING_WIDE:Number = 70;
      
      public static var VAGINA_RECOVER_THRESHOLD_CLOWN_CAR:Number = 50;
      
      public var displayedBeeCock:Boolean;
      
      public var checkedTurkey:int;
      
      public var checkedDream:int;
      
      public function PlayerEvents()
      {
         if(Boot.skip_constructor)
         {
            return;
         }
         displayedBeeCock = false;
         checkedDream = 0;
         checkedTurkey = 0;
         super();
         CoC.timeAwareClassAdd(this);
      }
      
      public function timeChangeLarge() : Boolean
      {
         var _loc1_:int = 0;
         var _loc2_:* = null as IMap;
         if(Utils.rand(4) == 0 && isSaturnalia() && get_player().get_gender() > 0 && get_game().time.hours == 6 && FlagDict_Impl_.arrayReadInt(KFLAGS.flags,642) < int(get_game().date.getFullYear()))
         {
            get_game().xmas.xmasMisc.getAChristmasChicken();
            return true;
         }
         if(get_game().time.hours == 1 && isSaturnalia() && int(get_game().date.getFullYear()) > FlagDict_Impl_.arrayReadInt(KFLAGS.flags,34))
         {
            get_game().xmas.xmasElf.xmasBitchEncounter();
            return true;
         }
         §§push(false);
         §§push(false);
         §§push(false);
         §§push(false);
         checkedTurkey = (_loc1_ = checkedTurkey) + 1;
         if(_loc1_ == 0)
         {
            §§pop();
            §§push(Utils.rand(5) == 0 && (get_game().time.hours == 18 || get_game().time.hours == 19));
         }
         if(§§pop())
         {
            §§pop();
            §§push(int(get_game().date.getFullYear()) > FlagDict_Impl_.arrayReadInt(KFLAGS.flags,566) || FlagDict_Impl_.arrayReadInt(KFLAGS.flags,1021) > 0);
         }
         if(§§pop())
         {
            §§pop();
            §§push(isThanksgiving());
         }
         if(§§pop())
         {
            §§pop();
            §§push(get_player().get_gender() > 0);
         }
         if(§§pop())
         {
            get_game().thanksgiving.datTurkeyRumpMeeting();
            return true;
         }
         §§push(false);
         checkedDream = (_loc1_ = checkedDream) + 1;
         if(_loc1_ == 0)
         {
            §§pop();
            §§push(get_game().time.hours == 3);
         }
         if(§§pop())
         {
            if(get_player().get_gender() > 0 && get_game().time.days == 10)
            {
               get_game().dreams.dayTenDreams();
               return true;
            }
            if(get_game().izmaScene.nightmareCheck())
            {
               get_game().izmaScene.daughterNightmare();
               return true;
            }
            if(get_player().hasCock() && get_player().hasPerk(PerkLib.BeeOvipositor) && (get_player().eggs() >= 20 && Utils.rand(6) == 0))
            {
               outputText("你坐在你最喜欢的花朵上，享受着青草的芬芳和森林的声音。阳光明媚，照在你的甲壳上感觉棒极了。你的翅膀在微风中欢快地抽动着，活着并为蜂群工作的感觉真好……唯一美中不足的是你那沉重、臃肿的腹部，里面装满了未受精的卵，沉甸甸地垂着，压迫着你的背部，挤压着你的神经。尽管如此，今天天气太好了，你不想让这影响你的心情，于是你唱起了你习惯的歌，虽然不成调但声音甜美，一边哼唱一边等待着路人。");
               outputText("[pg]你的触角动了动——那是谁？你用眼角余光从树木之间望去，可以看到另一个人的身影，你加强了催眠般的嗡嗡声，试图把它引得更近。那个人影走进了你所在的空地，走出了阴影；穿着[armor]，[he]竟然是你自己！你困惑地停止了哼唱，盯着你自己的脸，而另一个你则趁机解开[his]衣服，露出了[his][cock]！");
               outputText("[pg]你吓了一跳，从座位上滑下来试图逃跑，但另一个你已经穿过空地，一把抓住了你沉甸甸、肿胀腹部上的绒毛；你脚下一滑，脸朝下摔倒在地。[He]把你拉向[his]自己，抓住你的一条甲壳质腿，把你翻了过来。另一个你分开你毛茸茸的大腿，露出你柔软湿润的小穴，蜂蜜的甜香扑鼻而来。闻到你充满信息素的花蜜香气，[His]肉棒立刻剧烈地硬了起来，[he]连一句道歉的话都没说就把它插进了你的体内，一边呻吟一边开始无情地操弄你。你能感觉到[his]滚烫肉棒的触感，仿佛那是你自己的感觉一样，尽管你的大脑因困惑而退缩，你的双腿还是本能地缠住了另一个自己。");
               outputText("[pg]另一个你闷哼一声，身体僵住了，因为[his]……你的[cock]开始在你流着蜂蜜的小穴里喷射，[he]倒在你身上，在里面插到底；你的阴道也同样收缩，喷出你甜美的汁液。当[he]射精时，无力地抽插着，你能感觉到体内有什么东西在移动，让你感到一阵酥麻……感觉就像[he]灌进你体内的温暖精液正在渗透你整个腹股沟，一路向后蔓延到你的腹部。它逼近你体内积聚的大量卵子，一想到你的孩子们要受精了，你的身体就在第二次高潮中紧绷起来——");
               outputText("[pg]你猛地惊醒，猛地坐直了身子。这到底是什么鬼……你的[cocks]正在迅速变软，当你挪动身体时，你能感觉到你的精液在你的[armor]里晃荡。真他妈的见鬼。");
               if(get_player().cumQ() >= 1000)
               {
                  outputText("它也完全浸透了你的铺盖……在洗干净之前，你没法再睡在上面了。你嘟囔着，把湿漉漉的、沾满白色污渍的布料卷起来收好。");
               }
               outputText("当你试图重新入睡时，衣服里湿漉漉的感觉折磨着你，激起了你的欲望，让你再次半勃起……你腹部卵子的躁动，仿佛它们准备好被产下一样，更是雪上加霜。[pg]");
               get_player().fertilizeEggs();
               get_player().orgasm("Dick");
               if(int([DynStat.Lust(20)].length) == 0)
               {
                  get_game().player.dynStats();
               }
               else if(int([DynStat.Lust(20)].length) == 1)
               {
                  get_game().player.dynStats([DynStat.Lust(20)][0]);
               }
               else if(int([DynStat.Lust(20)].length) == 2)
               {
                  get_game().player.dynStats([DynStat.Lust(20)][0],[DynStat.Lust(20)][1]);
               }
               else if(int([DynStat.Lust(20)].length) == 3)
               {
                  get_game().player.dynStats([DynStat.Lust(20)][0],[DynStat.Lust(20)][1],[DynStat.Lust(20)][2]);
               }
               else if(int([DynStat.Lust(20)].length) == 4)
               {
                  get_game().player.dynStats([DynStat.Lust(20)][0],[DynStat.Lust(20)][1],[DynStat.Lust(20)][2],[DynStat.Lust(20)][3]);
               }
               else if(int([DynStat.Lust(20)].length) == 5)
               {
                  get_game().player.dynStats([DynStat.Lust(20)][0],[DynStat.Lust(20)][1],[DynStat.Lust(20)][2],[DynStat.Lust(20)][3],[DynStat.Lust(20)][4]);
               }
               else if(int([DynStat.Lust(20)].length) == 6)
               {
                  get_game().player.dynStats([DynStat.Lust(20)][0],[DynStat.Lust(20)][1],[DynStat.Lust(20)][2],[DynStat.Lust(20)][3],[DynStat.Lust(20)][4],[DynStat.Lust(20)][5]);
               }
               else if(int([DynStat.Lust(20)].length) == 7)
               {
                  get_game().player.dynStats([DynStat.Lust(20)][0],[DynStat.Lust(20)][1],[DynStat.Lust(20)][2],[DynStat.Lust(20)][3],[DynStat.Lust(20)][4],[DynStat.Lust(20)][5],[DynStat.Lust(20)][6]);
               }
               else if(int([DynStat.Lust(20)].length) == 8)
               {
                  get_game().player.dynStats([DynStat.Lust(20)][0],[DynStat.Lust(20)][1],[DynStat.Lust(20)][2],[DynStat.Lust(20)][3],[DynStat.Lust(20)][4],[DynStat.Lust(20)][5],[DynStat.Lust(20)][6],[DynStat.Lust(20)][7]);
               }
               else if(int([DynStat.Lust(20)].length) == 9)
               {
                  get_game().player.dynStats([DynStat.Lust(20)][0],[DynStat.Lust(20)][1],[DynStat.Lust(20)][2],[DynStat.Lust(20)][3],[DynStat.Lust(20)][4],[DynStat.Lust(20)][5],[DynStat.Lust(20)][6],[DynStat.Lust(20)][7],[DynStat.Lust(20)][8]);
               }
               else if(int([DynStat.Lust(20)].length) == 10)
               {
                  get_game().player.dynStats([DynStat.Lust(20)][0],[DynStat.Lust(20)][1],[DynStat.Lust(20)][2],[DynStat.Lust(20)][3],[DynStat.Lust(20)][4],[DynStat.Lust(20)][5],[DynStat.Lust(20)][6],[DynStat.Lust(20)][7],[DynStat.Lust(20)][8],[DynStat.Lust(20)][9]);
               }
               else if(int([DynStat.Lust(20)].length) == 11)
               {
                  get_game().player.dynStats([DynStat.Lust(20)][0],[DynStat.Lust(20)][1],[DynStat.Lust(20)][2],[DynStat.Lust(20)][3],[DynStat.Lust(20)][4],[DynStat.Lust(20)][5],[DynStat.Lust(20)][6],[DynStat.Lust(20)][7],[DynStat.Lust(20)][8],[DynStat.Lust(20)][9],[DynStat.Lust(20)][10]);
               }
               else if(int([DynStat.Lust(20)].length) == 12)
               {
                  get_game().player.dynStats([DynStat.Lust(20)][0],[DynStat.Lust(20)][1],[DynStat.Lust(20)][2],[DynStat.Lust(20)][3],[DynStat.Lust(20)][4],[DynStat.Lust(20)][5],[DynStat.Lust(20)][6],[DynStat.Lust(20)][7],[DynStat.Lust(20)][8],[DynStat.Lust(20)][9],[DynStat.Lust(20)][10],[DynStat.Lust(20)][11]);
               }
               else if(int([DynStat.Lust(20)].length) == 13)
               {
                  get_game().player.dynStats([DynStat.Lust(20)][0],[DynStat.Lust(20)][1],[DynStat.Lust(20)][2],[DynStat.Lust(20)][3],[DynStat.Lust(20)][4],[DynStat.Lust(20)][5],[DynStat.Lust(20)][6],[DynStat.Lust(20)][7],[DynStat.Lust(20)][8],[DynStat.Lust(20)][9],[DynStat.Lust(20)][10],[DynStat.Lust(20)][11],[DynStat.Lust(20)][12]);
               }
               else if(int([DynStat.Lust(20)].length) == 14)
               {
                  get_game().player.dynStats([DynStat.Lust(20)][0],[DynStat.Lust(20)][1],[DynStat.Lust(20)][2],[DynStat.Lust(20)][3],[DynStat.Lust(20)][4],[DynStat.Lust(20)][5],[DynStat.Lust(20)][6],[DynStat.Lust(20)][7],[DynStat.Lust(20)][8],[DynStat.Lust(20)][9],[DynStat.Lust(20)][10],[DynStat.Lust(20)][11],[DynStat.Lust(20)][12],[DynStat.Lust(20)][13]);
               }
               else if(int([DynStat.Lust(20)].length) == 15)
               {
                  get_game().player.dynStats([DynStat.Lust(20)][0],[DynStat.Lust(20)][1],[DynStat.Lust(20)][2],[DynStat.Lust(20)][3],[DynStat.Lust(20)][4],[DynStat.Lust(20)][5],[DynStat.Lust(20)][6],[DynStat.Lust(20)][7],[DynStat.Lust(20)][8],[DynStat.Lust(20)][9],[DynStat.Lust(20)][10],[DynStat.Lust(20)][11],[DynStat.Lust(20)][12],[DynStat.Lust(20)][13],[DynStat.Lust(20)][14]);
               }
               else if(int([DynStat.Lust(20)].length) == 16)
               {
                  get_game().player.dynStats([DynStat.Lust(20)][0],[DynStat.Lust(20)][1],[DynStat.Lust(20)][2],[DynStat.Lust(20)][3],[DynStat.Lust(20)][4],[DynStat.Lust(20)][5],[DynStat.Lust(20)][6],[DynStat.Lust(20)][7],[DynStat.Lust(20)][8],[DynStat.Lust(20)][9],[DynStat.Lust(20)][10],[DynStat.Lust(20)][11],[DynStat.Lust(20)][12],[DynStat.Lust(20)][13],[DynStat.Lust(20)][14],[DynStat.Lust(20)][15]);
               }
               else if(int([DynStat.Lust(20)].length) == 17)
               {
                  get_game().player.dynStats([DynStat.Lust(20)][0],[DynStat.Lust(20)][1],[DynStat.Lust(20)][2],[DynStat.Lust(20)][3],[DynStat.Lust(20)][4],[DynStat.Lust(20)][5],[DynStat.Lust(20)][6],[DynStat.Lust(20)][7],[DynStat.Lust(20)][8],[DynStat.Lust(20)][9],[DynStat.Lust(20)][10],[DynStat.Lust(20)][11],[DynStat.Lust(20)][12],[DynStat.Lust(20)][13],[DynStat.Lust(20)][14],[DynStat.Lust(20)][15],[DynStat.Lust(20)][16]);
               }
               else if(int([DynStat.Lust(20)].length) == 18)
               {
                  get_game().player.dynStats([DynStat.Lust(20)][0],[DynStat.Lust(20)][1],[DynStat.Lust(20)][2],[DynStat.Lust(20)][3],[DynStat.Lust(20)][4],[DynStat.Lust(20)][5],[DynStat.Lust(20)][6],[DynStat.Lust(20)][7],[DynStat.Lust(20)][8],[DynStat.Lust(20)][9],[DynStat.Lust(20)][10],[DynStat.Lust(20)][11],[DynStat.Lust(20)][12],[DynStat.Lust(20)][13],[DynStat.Lust(20)][14],[DynStat.Lust(20)][15],[DynStat.Lust(20)][16],[DynStat.Lust(20)][17]);
               }
               else if(int([DynStat.Lust(20)].length) == 19)
               {
                  get_game().player.dynStats([DynStat.Lust(20)][0],[DynStat.Lust(20)][1],[DynStat.Lust(20)][2],[DynStat.Lust(20)][3],[DynStat.Lust(20)][4],[DynStat.Lust(20)][5],[DynStat.Lust(20)][6],[DynStat.Lust(20)][7],[DynStat.Lust(20)][8],[DynStat.Lust(20)][9],[DynStat.Lust(20)][10],[DynStat.Lust(20)][11],[DynStat.Lust(20)][12],[DynStat.Lust(20)][13],[DynStat.Lust(20)][14],[DynStat.Lust(20)][15],[DynStat.Lust(20)][16],[DynStat.Lust(20)][17],[DynStat.Lust(20)][18]);
               }
               else
               {
                  if(int([DynStat.Lust(20)].length) != 20)
                  {
                     throw "Too many rest arguments";
                  }
                  get_game().player.dynStats([DynStat.Lust(20)][0],[DynStat.Lust(20)][1],[DynStat.Lust(20)][2],[DynStat.Lust(20)][3],[DynStat.Lust(20)][4],[DynStat.Lust(20)][5],[DynStat.Lust(20)][6],[DynStat.Lust(20)][7],[DynStat.Lust(20)][8],[DynStat.Lust(20)][9],[DynStat.Lust(20)][10],[DynStat.Lust(20)][11],[DynStat.Lust(20)][12],[DynStat.Lust(20)][13],[DynStat.Lust(20)][14],[DynStat.Lust(20)][15],[DynStat.Lust(20)][16],[DynStat.Lust(20)][17],[DynStat.Lust(20)][18],[DynStat.Lust(20)][19]);
               }
               get_game().output.doNext(playerMenu);
               return true;
            }
            if(get_player().hasCock() && get_player().hasPerk(PerkLib.SpiderOvipositor) && (get_player().eggs() >= 20 && Utils.rand(6) == 0))
            {
               outputText("在月光照耀的森林里，你倒挂在一根粗壮的树枝上，仅靠一根蛛丝悬吊着。你欲火中烧地注视着下方一个倒霉的旅行者漫步而过，对你设下的陷阱毫无察觉。当[he]终于撞上你的蛛网，在黏糊糊的蛛丝中徒劳地挣扎时，你屏住了呼吸。一旦旅行者的挣扎因疲惫而减弱，你便轻松地降落到森林地面，用优雅的丝茧将" + get_player().mf("him","her") + "包裹起来，然后把[him]拉上树冠。将你的猎物靠在树干上，你把毒牙刺穿蛛网咬进肉里，随着每一滴毒液的注入，感受着[his]体温。切开[his]胯部的蛛丝，你解开[his][armor]，释放出");
               if(get_player().hasVagina())
               {
                  outputText(get_player().vaginaDescript(0) + "和");
               }
               outputText("里面的[cock]；你一次又一次地在" + get_player().mf("him","her") + "身上起伏，用[him]的肉棒刺穿你饥渴的小穴");
               if(get_player().hasVagina())
               {
                  outputText("同时你弯下腰，强行将自己的肉棒插进她的小穴");
               }
               outputText("。没过多久你就感觉到");
               if(get_player().hasVagina())
               {
                  outputText("当你在里面爆发性高潮时，她的小穴紧紧地夹着你，紧接着是");
               }
               outputText("你自己阴道里温暖湿润的感觉。你的俘虏呻吟着，[his]肉棒在你体内抽搐痉挛，将精液喷洒在你的体内；那是为你卵子准备的温暖、美味、粘稠的精液。你能感觉到它越来越靠近你未受精的卵群，随着那粘稠的热流向它们推进，你感到一阵眩晕，最后你终于看清了猎物的[face]……");
               outputText("[pg]你眨了眨眼，醒了过来。真是个奇怪的梦……啊，该死。你能感觉到你的[armor]摩擦着你的胯部，已经被精液浸透了。");
               if(get_player().cumQ() > 1000)
               {
                  outputText("连你的铺盖上也全都是……");
               }
               outputText("翻了个身，试图找个干爽的地方，你打算继续睡觉……胯部湿漉漉的压迫感让你难以入眠，腹部的咕噜声也无济于事，当你再次陷入另一个春梦时，你已经半勃起了。又一个旅行者从你下方经过，你准备用网困住她；你的产卵管急不可耐地探了出来，滴下一滴粘液，顺着你即将推入可怜受害者体内的第一颗受精卵流下……");
               get_player().fertilizeEggs();
               get_player().orgasm("Dick");
               if(int([DynStat.Lust(20)].length) == 0)
               {
                  get_game().player.dynStats();
               }
               else if(int([DynStat.Lust(20)].length) == 1)
               {
                  get_game().player.dynStats([DynStat.Lust(20)][0]);
               }
               else if(int([DynStat.Lust(20)].length) == 2)
               {
                  get_game().player.dynStats([DynStat.Lust(20)][0],[DynStat.Lust(20)][1]);
               }
               else if(int([DynStat.Lust(20)].length) == 3)
               {
                  get_game().player.dynStats([DynStat.Lust(20)][0],[DynStat.Lust(20)][1],[DynStat.Lust(20)][2]);
               }
               else if(int([DynStat.Lust(20)].length) == 4)
               {
                  get_game().player.dynStats([DynStat.Lust(20)][0],[DynStat.Lust(20)][1],[DynStat.Lust(20)][2],[DynStat.Lust(20)][3]);
               }
               else if(int([DynStat.Lust(20)].length) == 5)
               {
                  get_game().player.dynStats([DynStat.Lust(20)][0],[DynStat.Lust(20)][1],[DynStat.Lust(20)][2],[DynStat.Lust(20)][3],[DynStat.Lust(20)][4]);
               }
               else if(int([DynStat.Lust(20)].length) == 6)
               {
                  get_game().player.dynStats([DynStat.Lust(20)][0],[DynStat.Lust(20)][1],[DynStat.Lust(20)][2],[DynStat.Lust(20)][3],[DynStat.Lust(20)][4],[DynStat.Lust(20)][5]);
               }
               else if(int([DynStat.Lust(20)].length) == 7)
               {
                  get_game().player.dynStats([DynStat.Lust(20)][0],[DynStat.Lust(20)][1],[DynStat.Lust(20)][2],[DynStat.Lust(20)][3],[DynStat.Lust(20)][4],[DynStat.Lust(20)][5],[DynStat.Lust(20)][6]);
               }
               else if(int([DynStat.Lust(20)].length) == 8)
               {
                  get_game().player.dynStats([DynStat.Lust(20)][0],[DynStat.Lust(20)][1],[DynStat.Lust(20)][2],[DynStat.Lust(20)][3],[DynStat.Lust(20)][4],[DynStat.Lust(20)][5],[DynStat.Lust(20)][6],[DynStat.Lust(20)][7]);
               }
               else if(int([DynStat.Lust(20)].length) == 9)
               {
                  get_game().player.dynStats([DynStat.Lust(20)][0],[DynStat.Lust(20)][1],[DynStat.Lust(20)][2],[DynStat.Lust(20)][3],[DynStat.Lust(20)][4],[DynStat.Lust(20)][5],[DynStat.Lust(20)][6],[DynStat.Lust(20)][7],[DynStat.Lust(20)][8]);
               }
               else if(int([DynStat.Lust(20)].length) == 10)
               {
                  get_game().player.dynStats([DynStat.Lust(20)][0],[DynStat.Lust(20)][1],[DynStat.Lust(20)][2],[DynStat.Lust(20)][3],[DynStat.Lust(20)][4],[DynStat.Lust(20)][5],[DynStat.Lust(20)][6],[DynStat.Lust(20)][7],[DynStat.Lust(20)][8],[DynStat.Lust(20)][9]);
               }
               else if(int([DynStat.Lust(20)].length) == 11)
               {
                  get_game().player.dynStats([DynStat.Lust(20)][0],[DynStat.Lust(20)][1],[DynStat.Lust(20)][2],[DynStat.Lust(20)][3],[DynStat.Lust(20)][4],[DynStat.Lust(20)][5],[DynStat.Lust(20)][6],[DynStat.Lust(20)][7],[DynStat.Lust(20)][8],[DynStat.Lust(20)][9],[DynStat.Lust(20)][10]);
               }
               else if(int([DynStat.Lust(20)].length) == 12)
               {
                  get_game().player.dynStats([DynStat.Lust(20)][0],[DynStat.Lust(20)][1],[DynStat.Lust(20)][2],[DynStat.Lust(20)][3],[DynStat.Lust(20)][4],[DynStat.Lust(20)][5],[DynStat.Lust(20)][6],[DynStat.Lust(20)][7],[DynStat.Lust(20)][8],[DynStat.Lust(20)][9],[DynStat.Lust(20)][10],[DynStat.Lust(20)][11]);
               }
               else if(int([DynStat.Lust(20)].length) == 13)
               {
                  get_game().player.dynStats([DynStat.Lust(20)][0],[DynStat.Lust(20)][1],[DynStat.Lust(20)][2],[DynStat.Lust(20)][3],[DynStat.Lust(20)][4],[DynStat.Lust(20)][5],[DynStat.Lust(20)][6],[DynStat.Lust(20)][7],[DynStat.Lust(20)][8],[DynStat.Lust(20)][9],[DynStat.Lust(20)][10],[DynStat.Lust(20)][11],[DynStat.Lust(20)][12]);
               }
               else if(int([DynStat.Lust(20)].length) == 14)
               {
                  get_game().player.dynStats([DynStat.Lust(20)][0],[DynStat.Lust(20)][1],[DynStat.Lust(20)][2],[DynStat.Lust(20)][3],[DynStat.Lust(20)][4],[DynStat.Lust(20)][5],[DynStat.Lust(20)][6],[DynStat.Lust(20)][7],[DynStat.Lust(20)][8],[DynStat.Lust(20)][9],[DynStat.Lust(20)][10],[DynStat.Lust(20)][11],[DynStat.Lust(20)][12],[DynStat.Lust(20)][13]);
               }
               else if(int([DynStat.Lust(20)].length) == 15)
               {
                  get_game().player.dynStats([DynStat.Lust(20)][0],[DynStat.Lust(20)][1],[DynStat.Lust(20)][2],[DynStat.Lust(20)][3],[DynStat.Lust(20)][4],[DynStat.Lust(20)][5],[DynStat.Lust(20)][6],[DynStat.Lust(20)][7],[DynStat.Lust(20)][8],[DynStat.Lust(20)][9],[DynStat.Lust(20)][10],[DynStat.Lust(20)][11],[DynStat.Lust(20)][12],[DynStat.Lust(20)][13],[DynStat.Lust(20)][14]);
               }
               else if(int([DynStat.Lust(20)].length) == 16)
               {
                  get_game().player.dynStats([DynStat.Lust(20)][0],[DynStat.Lust(20)][1],[DynStat.Lust(20)][2],[DynStat.Lust(20)][3],[DynStat.Lust(20)][4],[DynStat.Lust(20)][5],[DynStat.Lust(20)][6],[DynStat.Lust(20)][7],[DynStat.Lust(20)][8],[DynStat.Lust(20)][9],[DynStat.Lust(20)][10],[DynStat.Lust(20)][11],[DynStat.Lust(20)][12],[DynStat.Lust(20)][13],[DynStat.Lust(20)][14],[DynStat.Lust(20)][15]);
               }
               else if(int([DynStat.Lust(20)].length) == 17)
               {
                  get_game().player.dynStats([DynStat.Lust(20)][0],[DynStat.Lust(20)][1],[DynStat.Lust(20)][2],[DynStat.Lust(20)][3],[DynStat.Lust(20)][4],[DynStat.Lust(20)][5],[DynStat.Lust(20)][6],[DynStat.Lust(20)][7],[DynStat.Lust(20)][8],[DynStat.Lust(20)][9],[DynStat.Lust(20)][10],[DynStat.Lust(20)][11],[DynStat.Lust(20)][12],[DynStat.Lust(20)][13],[DynStat.Lust(20)][14],[DynStat.Lust(20)][15],[DynStat.Lust(20)][16]);
               }
               else if(int([DynStat.Lust(20)].length) == 18)
               {
                  get_game().player.dynStats([DynStat.Lust(20)][0],[DynStat.Lust(20)][1],[DynStat.Lust(20)][2],[DynStat.Lust(20)][3],[DynStat.Lust(20)][4],[DynStat.Lust(20)][5],[DynStat.Lust(20)][6],[DynStat.Lust(20)][7],[DynStat.Lust(20)][8],[DynStat.Lust(20)][9],[DynStat.Lust(20)][10],[DynStat.Lust(20)][11],[DynStat.Lust(20)][12],[DynStat.Lust(20)][13],[DynStat.Lust(20)][14],[DynStat.Lust(20)][15],[DynStat.Lust(20)][16],[DynStat.Lust(20)][17]);
               }
               else if(int([DynStat.Lust(20)].length) == 19)
               {
                  get_game().player.dynStats([DynStat.Lust(20)][0],[DynStat.Lust(20)][1],[DynStat.Lust(20)][2],[DynStat.Lust(20)][3],[DynStat.Lust(20)][4],[DynStat.Lust(20)][5],[DynStat.Lust(20)][6],[DynStat.Lust(20)][7],[DynStat.Lust(20)][8],[DynStat.Lust(20)][9],[DynStat.Lust(20)][10],[DynStat.Lust(20)][11],[DynStat.Lust(20)][12],[DynStat.Lust(20)][13],[DynStat.Lust(20)][14],[DynStat.Lust(20)][15],[DynStat.Lust(20)][16],[DynStat.Lust(20)][17],[DynStat.Lust(20)][18]);
               }
               else
               {
                  if(int([DynStat.Lust(20)].length) != 20)
                  {
                     throw "Too many rest arguments";
                  }
                  get_game().player.dynStats([DynStat.Lust(20)][0],[DynStat.Lust(20)][1],[DynStat.Lust(20)][2],[DynStat.Lust(20)][3],[DynStat.Lust(20)][4],[DynStat.Lust(20)][5],[DynStat.Lust(20)][6],[DynStat.Lust(20)][7],[DynStat.Lust(20)][8],[DynStat.Lust(20)][9],[DynStat.Lust(20)][10],[DynStat.Lust(20)][11],[DynStat.Lust(20)][12],[DynStat.Lust(20)][13],[DynStat.Lust(20)][14],[DynStat.Lust(20)][15],[DynStat.Lust(20)][16],[DynStat.Lust(20)][17],[DynStat.Lust(20)][18],[DynStat.Lust(20)][19]);
               }
               get_game().output.doNext(playerMenu);
               return true;
            }
            switch(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,218) + FlagDict_Impl_.arrayReadInt(KFLAGS.flags,219) + FlagDict_Impl_.arrayReadInt(KFLAGS.flags,220))
            {
               case 0:
                  _loc1_ = 0;
                  break;
               case 1:
                  _loc1_ = 10;
                  break;
               case 2:
                  _loc1_ = 7;
                  break;
               case 3:
                  _loc1_ = 5;
                  break;
               case 4:
                  _loc1_ = 4;
                  break;
               default:
                  _loc1_ = 3;
            }
            if(_loc1_ > 0 && int(get_game().time.days % _loc1_) == 0)
            {
               get_game().ceraphScene.ceraphBodyPartDreams();
               return true;
            }
            if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,157) > 0 && FlagDict_Impl_.arrayReadInt(KFLAGS.flags,157) < 4)
            {
               outputText("<b>你的休息被奇怪的梦境搅得有些不安……</b>[pg]");
               get_game().telAdre.dominika.fellatrixDream();
               return true;
            }
            if(get_game().anemoneScene.kidAXP() >= 40 && FlagDict_Impl_.arrayReadInt(KFLAGS.flags,758) == 0 && get_player().get_gender() != 0)
            {
               get_game().anemoneScene.kidADreams();
               FlagDict_Impl_.arrayWriteInt(KFLAGS.flags,758,1);
               return true;
            }
            if(get_player().viridianChange())
            {
               get_game().dreams.fuckedUpCockDreamChange();
               return true;
            }
            if(!get_player().isGenderless() && FlagDict_Impl_.arrayReadString(KFLAGS.flags,701) == "" && get_game().helSpawnScene.helspawnLover() && get_game().helSpawnScene.helspawnSlutty() && get_game().time.days - get_game().helSpawnScene.saveContent.timeTalkedIncest >= 7 && get_game().time.days - get_game().helSpawnScene.saveContent.slutspawnLastTimeSex >= 7)
            {
               get_game().helSpawnScene.slutspawnDreaming();
               return true;
            }
            if(Utils.rand(40) == 0 && FlagDict_Impl_.arrayReadString(KFLAGS.flags,701) == "Marble")
            {
               if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,1051) == 1)
               {
                  get_game().dreams.marblePureNightmare1();
               }
               else
               {
                  get_game().dreams.marbleCorruptNightmare();
               }
               return true;
            }
            if(get_player().get_lib100() > 50 || get_player().get_lust100() > 40)
            {
               if(get_game().dreams.dreamSelect())
               {
                  return true;
               }
            }
         }
         if(get_player().statusEffectv1(StatusEffects.SlimeCraving) >= 18 && get_player().get_str() <= 1)
         {
            get_game().lake.gooGirlScene.slimeBadEnd();
            return true;
         }
         if(get_player().hasCock() && get_player().cocks[0].get_cockType() == CockTypesEnum.BEE && get_player().get_lust() >= get_player().maxLust())
         {
            if(get_player().hasItem(get_consumables().BEEHONY) || get_player().hasItem(get_consumables().PURHONY) || get_player().hasItem(get_consumables().SPHONEY))
            {
               outputText("你再也忍不住了。谢天谢地，你的[inv]里有蜂蜜，所以你拿出一小瓶蜂蜜。你绝对要用蜂蜜涂满你的蜜蜂肉棒来自慰。[pg]");
               doNext(get_game().masturbation.masturbateGo);
               return true;
            }
            outputText("你再也忍不住了，你现在就需要找到那个蜂女。你冲向森林，去寻找你绝对必须拥有的释放。凭着本能，你很快找到了蜂女的空地，以及在里面的她。[pg]");
            get_game().forest.beeGirlScene.beeSexForCocks(false);
            return true;
         }
         if(get_player().hasCock())
         {
            _loc1_ = 0;
            while(_loc1_ < int(get_player().cocks.length))
            {
               if(get_player().cocks[_loc1_].cockLength > 9999.9)
               {
                  get_player().cocks[_loc1_].cockLength = 9999.9;
               }
               if(get_player().cocks[_loc1_].cockThickness > 999.9)
               {
                  get_player().cocks[_loc1_].cockThickness = 999.9;
               }
               _loc1_++;
            }
         }
         if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,1279) > 0 && FlagDict_Impl_.arrayReadFloat(KFLAGS.flags,2273) <= 0)
         {
            _loc1_ = int(new WeightedChoice().add(0,40).add(1,20).add(2,20).add(3,16).add(4,4).choose());
            FlagDict_Impl_.arrayWriteInt(KFLAGS.flags,2272,_loc1_);
            FlagDict_Impl_.arrayWriteFloat(KFLAGS.flags,2273,Utils.randBetween(6,53));
            if(_loc1_ >= 3)
            {
               _loc2_ = KFLAGS.flags;
               FlagDict_Impl_.arrayWriteFloat(_loc2_,2273,FlagDict_Impl_.arrayReadFloat(_loc2_,2273) / (_loc1_ == 4 ? 3 : 2));
            }
         }
         return false;
      }
      
      public function timeChange() : Boolean
      {
         var _loc2_:int = 0;
         var _loc3_:* = null as Player;
         var _loc4_:* = null as Player;
         var _loc5_:* = null as IMap;
         var _loc6_:Number = NaN;
         var _loc7_:* = null as String;
         var _loc8_:* = null as CoC;
         var _loc9_:* = null as Array;
         var _loc10_:int = 0;
         var _loc11_:* = null as Vagina;
         var _loc12_:* = null as Ass;
         var _loc1_:Boolean = false;
         checkedTurkey = 0;
         checkedDream = 0;
         if(get_player().cumMultiplier > 19999)
         {
            get_player().cumMultiplier = 19999;
         }
         if(get_player().ballSize > 400)
         {
            get_player().ballSize = 400;
         }
         get_inventory().unlockSlots();
         if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,895) > 0)
         {
            _loc2_ = 895;
            FlagDict_Impl_.arrayWriteInt(KFLAGS.flags,_loc2_,FlagDict_Impl_.arrayReadInt(KFLAGS.flags,_loc2_) - 1);
            if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,895) < 0)
            {
               FlagDict_Impl_.arrayWriteInt(KFLAGS.flags,895,0);
            }
            if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,895) > 24)
            {
               FlagDict_Impl_.arrayWriteInt(KFLAGS.flags,895,24);
            }
         }
         if(!get_survival() || get_survival() && get_player().hunger >= 10)
         {
            _loc3_ = get_player();
            _loc3_.set_hoursSinceCum(_loc3_.get_hoursSinceCum() + 1);
            if(get_player().hasPerk(PerkLib.MaraesGiftProfractory))
            {
               _loc4_ = get_player();
               _loc4_.set_hoursSinceCum(_loc4_.get_hoursSinceCum() + 2);
            }
            if(get_player().hasPerk(PerkLib.FerasBoonAlpha))
            {
               _loc4_ = get_player();
               _loc4_.set_hoursSinceCum(_loc4_.get_hoursSinceCum() + 2);
            }
            if(get_player().hasPerk(PerkLib.ParasiteMusk))
            {
               _loc4_ = get_player();
               _loc4_.set_hoursSinceCum(_loc4_.get_hoursSinceCum() + 2);
            }
         }
         if(get_creepingTaint())
         {
            if(!get_player().hasPerk(PerkLib.PurityBlessing))
            {
               if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,2666) < 1)
               {
                  dynStats(DynStat.Cor(0.02));
               }
               dynStats(DynStat.Cor(0.02));
            }
         }
         if((FlagDict_Impl_.arrayReadInt(KFLAGS.flags,2675) & CorruptedCoven.BROUGHT_JEREMIAH_BACK) != 0 && !((FlagDict_Impl_.arrayReadInt(KFLAGS.flags,2683) & 0x0200) != 0 && !get_player().hasKeyItem("Talisman of the Flame")))
         {
            outputText("<b>出错了，但现在已经修复。请联系 OtherCoCAnon 并把这个交给他：" + FlagDict_Impl_.arrayReadInt(KFLAGS.flags,2675) + "" + FlagDict_Impl_.arrayReadInt(KFLAGS.flags,2683) + "</b>");
            _loc5_ = KFLAGS.flags;
            FlagDict_Impl_.arrayWriteInt(_loc5_,2675,FlagDict_Impl_.arrayReadInt(_loc5_,2675) ^ CorruptedCoven.BROUGHT_JEREMIAH_BACK);
            _loc1_ = true;
         }
         if(!get_player().hasPerk(PerkLib.WellAdjusted))
         {
            dynStats(DynStat.Lust(get_player().lib * 0.04),DynStat.NoScale);
            if(get_player().hasPerk(PerkLib.Lusty))
            {
               dynStats(DynStat.Lust(get_player().lib * 0.02),DynStat.NoScale);
            }
         }
         else
         {
            dynStats(DynStat.Lust(get_player().lib * 0.02),DynStat.NoScale);
            if(get_player().hasPerk(PerkLib.Lusty))
            {
               dynStats(DynStat.Lust(get_player().lib * 0.01),DynStat.NoScale);
            }
         }
         if(get_player().featheryHairPinEquipped() && get_mutations().lizardHairChange("PlayerEvents-benoitHairPin") != 0)
         {
            _loc1_ = true;
         }
         if(get_player().get_jewelryEffectId() == 9)
         {
            if(get_player().cor < 80)
            {
               dynStats(DynStat.Cor(get_player().get_jewelryEffectMagnitude() / 100));
            }
         }
         if(get_player().get_jewelryEffectId() == 8)
         {
            dynStats(DynStat.Cor(-(get_player().get_jewelryEffectMagnitude() / 100)));
         }
         if(get_player().get_armor() == get_armors().DBARMOR)
         {
            dynStats(DynStat.Cor(-0.1));
         }
         if(get_survival())
         {
            _loc6_ = 1;
            if(get_player().hasPerk(PerkLib.Survivalist))
            {
               _loc6_ -= 0.2;
            }
            if(get_player().hasPerk(PerkLib.Survivalist2))
            {
               _loc6_ -= 0.2;
            }
            var _temp_1:* = get_player();
            _temp_1.hunger = _temp_1.hunger - Math.ceil(get_player().get_hunger100() / 25) * (0.5 * _loc6_);
            if(get_player().get_buttPregnancyType() == 32)
            {
               get_player().hunger = 100;
            }
            if(get_player().hunger <= 0)
            {
               if(get_player().thickness < 25)
               {
                  get_player().takeDamage(get_player().maxHP() / 25);
                  get_player().changeFatigue(2);
                  dynStats(DynStat.Str(-0.5));
                  dynStats(DynStat.Tou(-0.5));
               }
               else if(int((get_game().time.hours + 2) % 4) == 0)
               {
                  get_player().modThickness(1,1);
                  get_player().modTone(1,1);
               }
               get_player().hunger = 0;
            }
            if(get_player().hunger < 10 && int(get_game().time.hours % 4) == 0)
            {
               get_player().modThickness(1,1);
               get_player().modTone(1,1);
            }
            if(get_player().hunger < 25)
            {
               if(get_player().hunger > 0)
               {
                  _loc5_ = KFLAGS.flags;
                  FlagDict_Impl_.arrayWriteInt(_loc5_,2081,FlagDict_Impl_.arrayReadInt(_loc5_,2081) + 1);
               }
               else
               {
                  FlagDict_Impl_.arrayWriteInt(KFLAGS.flags,2081,0);
               }
            }
            else
            {
               FlagDict_Impl_.arrayWriteInt(KFLAGS.flags,2081,0);
            }
            if(get_player().get_armor() == get_armors().GOOARMR)
            {
               if(get_player().hunger < 15)
               {
                  outputText("感觉到你咕咕叫的肚子表明你饿了，史莱姆护甲往你嘴里塞了一些蓝色的粘液。你吞下粘液，它进入了你的胃里。你还能感觉到一些粘液被你的[skinfurscales]吸收了。");
                  get_player().hunger = 20;
               }
               if(get_player().hunger < 20)
               {
                  get_player().hunger = 20;
               }
            }
         }
         if(get_player().cor >= 80)
         {
            if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,2083) == 0 || FlagDict_Impl_.arrayReadInt(KFLAGS.flags,2083) == 2)
            {
               _loc5_ = KFLAGS.flags;
               FlagDict_Impl_.arrayWriteInt(_loc5_,2083,FlagDict_Impl_.arrayReadInt(_loc5_,2083) + 1);
            }
         }
         if(get_player().cor <= 20)
         {
            if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,2083) == 1 || FlagDict_Impl_.arrayReadInt(KFLAGS.flags,2083) == 3)
            {
               _loc5_ = KFLAGS.flags;
               FlagDict_Impl_.arrayWriteInt(_loc5_,2083,FlagDict_Impl_.arrayReadInt(_loc5_,2083) + 1);
            }
         }
         if(get_player().cor >= 100)
         {
            if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,2084) == 0)
            {
               _loc5_ = KFLAGS.flags;
               FlagDict_Impl_.arrayWriteInt(_loc5_,2084,FlagDict_Impl_.arrayReadInt(_loc5_,2084) + 1);
            }
         }
         if(get_player().cor <= 0)
         {
            if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,2084) == 1)
            {
               _loc5_ = KFLAGS.flags;
               FlagDict_Impl_.arrayWriteInt(_loc5_,2084,FlagDict_Impl_.arrayReadInt(_loc5_,2084) + 1);
            }
         }
         if(get_game().valeria.valeriaFluidsEnabled())
         {
            if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,2200) > 0)
            {
               _loc2_ = 2200;
               FlagDict_Impl_.arrayWriteInt(KFLAGS.flags,_loc2_,FlagDict_Impl_.arrayReadInt(KFLAGS.flags,_loc2_) - 1);
            }
            else if(get_player().get_armor() == get_armors().GOOARMR)
            {
               dynStats(DynStat.Lust(2 + get_player().lib / 10),DynStat.NoScale);
               _loc1_ = true;
            }
            if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,2200) > 100)
            {
               FlagDict_Impl_.arrayWriteInt(KFLAGS.flags,2200,100);
            }
         }
         if(get_player().tail.type == 6 || get_player().tail.type == 5 || get_player().tail.type == 20)
         {
            if(get_player().tail.recharge < 5)
            {
               get_player().tail.recharge = 5;
            }
            var _temp_2:* = get_player().tail;
            _temp_2.venom = _temp_2.venom + get_player().tail.recharge;
            if(get_player().tail.venom > 100)
            {
               get_player().tail.venom = 100;
            }
         }
         if(get_player().tail.type == 8 && get_player().lowerBody.type == 9 && get_player().ears.type == 5)
         {
            if(!get_player().hasPerk(PerkLib.Flexibility))
            {
               outputText("在伸展身体时，你发现自己比以前柔韧多了。也许这会让你在战斗中更容易躲避攻击？");
               outputText("[pg](<b>获得特质：柔韧</b>)[pg]");
               get_player().createPerk(PerkLib.Flexibility,0,0,0,0);
               _loc1_ = true;
            }
         }
         else if(get_player().hasUnpermedPerk(PerkLib.Flexibility))
         {
            outputText("你注意到你不再像拥有更多猫科动物特征的身体时那样柔韧了。现在要躲避敌人的攻击可能会更困难。[pg](<b>失去特质：柔韧</b>)[pg]");
            get_player().removePerk(PerkLib.Flexibility);
            _loc1_ = true;
         }
         if(get_player().ferretScore() >= 6)
         {
            if(!get_player().hasPerk(PerkLib.WarDance))
            {
               outputText("由于你四肢的肌肉强壮而敏捷，你能够轻松击中敌人，使你的徒手攻击更强，也更难被躲避。");
               outputText("[pg](<b>获得特质：战舞</b>)[pg]");
               get_player().createPerk(PerkLib.WarDance,0,0,0,0);
               _loc1_ = true;
            }
         }
         else if(get_player().hasUnpermedPerk(PerkLib.WarDance))
         {
            outputText("你注意到你不再像拥有更多雪貂特征的身体时那样强壮和敏捷了。现在对你来说，肉搏战可能会更困难。");
            outputText("[pg](<b>失去特质：战舞</b>)[pg]");
            get_player().removePerk(PerkLib.WarDance);
            _loc1_ = true;
         }
         if(get_player().hasUnpermedPerk(PerkLib.Lustserker) && (get_player().tail.type != 25 || get_player().lowerBody.type != 25 || get_player().arms.type != 5))
         {
            outputText("突然之间，你的身体内部发生了一些变化。你思考了很久，直到恍然大悟。你再也感觉不到体内那种轻微的温暖感了，这意味着你现在无法再进入欲狂状态了。[pg](<b>失去特质：欲狂</b>)[pg]");
            get_player().removePerk(PerkLib.Lustserker);
            _loc1_ = true;
         }
         if(get_player().satyrScore() >= 4 && get_player().balls > 0)
         {
            if(!get_player().hasPerk(PerkLib.SatyrSexuality))
            {
               outputText("你感觉到[balls]里有一种奇怪的翻腾感。随着你看起来像个萨堤尔，你已经解锁了通过肛交使人怀孕的潜能！");
               outputText("[pg](<b>获得特质：萨堤尔性欲</b>)[pg]");
               get_player().createPerk(PerkLib.SatyrSexuality,0,0,0,0);
               _loc1_ = true;
            }
         }
         else if(get_player().hasUnpermedPerk(PerkLib.SatyrSexuality))
         {
            outputText("随着你的一些萨堤尔特征消失，你通过肛交使他人怀孕的能力也随之消失了。");
            outputText("[pg](<b>失去特质：萨堤尔性欲</b>)[pg]");
            get_player().removePerk(PerkLib.SatyrSexuality);
            _loc1_ = true;
         }
         if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,477) == 1)
         {
            if(get_player().face.type != 11 || get_player().tail.type != 13 || get_player().ears.type != 9 || get_player().lowerBody.type != 17 || !get_player().hasFur())
            {
               FlagDict_Impl_.arrayWriteInt(KFLAGS.flags,477,0);
            }
         }
         if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,2208) >= 100 && !get_player().hasPerk(PerkLib.BasiliskResistance))
         {
            outputText("你注意到自己感觉有些僵硬，皮肤也变得更坚硬了。你的脑海中灵光一闪，终于解锁了保护自己免受那些该死的蛇怪伤害的潜能！");
            outputText("[pg](<b>获得特质：蛇怪抵抗 - 除非你是蛇怪，否则你的最大速度将永久降低，但你现在对蛇怪的凝视免疫了！</b>)[pg]");
            get_player().createPerk(PerkLib.BasiliskResistance,0,0,0,0);
            _loc1_ = true;
         }
         if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,2077) >= 100 && !get_player().hasPerk(PerkLib.TransformationResistance))
         {
            outputText("你感到一种奇怪的刺痛感。似乎你终于适应了玛瑞斯食物的变形特性，你的身体终于建立起了足够的抵抗力！你怀疑自己仍然可以变形，但速度会有所减缓。");
            outputText("[pg](<b>获得特质：变形抵抗 - 变形道具现在让你变形的几率降低了。此外，任何与过量使用某些变形道具相关的坏结局现在都被禁用了。可以在特质菜单中开启/关闭抵抗。</b>)[pg]");
            get_player().createPerk(PerkLib.TransformationResistance,0,0,0,0);
            _loc1_ = true;
         }
         if(get_player().hasPerk(PerkLib.EnlightenedNinetails) && get_player().perkv4(PerkLib.EnlightenedNinetails) == 0 || get_player().hasPerk(PerkLib.CorruptedNinetails) && get_player().perkv4(PerkLib.CorruptedNinetails) == 0)
         {
            if(get_player().tail.type != 13 || get_player().tail.venom < 9)
            {
               outputText("<b>没有了尾巴，它们曾经赋予的魔力也随之枯萎消亡，彻底消失了。</b>[pg]");
               if(get_player().perkv4(PerkLib.EnlightenedNinetails) == 0)
               {
                  get_player().removePerk(PerkLib.EnlightenedNinetails);
               }
               if(get_player().perkv4(PerkLib.CorruptedNinetails) == 0)
               {
                  get_player().removePerk(PerkLib.CorruptedNinetails);
               }
               _loc1_ = true;
            }
         }
         if(get_player().hasUnpermedPerk(PerkLib.MermaidChant) && !get_player().isFullMermaid())
         {
            get_player().removePerk(PerkLib.MermaidChant);
         }
         else if(get_player().isFullMermaid() && !get_player().hasPerk(PerkLib.MermaidChant))
         {
            get_player().createPerk(PerkLib.MermaidChant);
         }
         if(get_player().hasUnpermedPerk(PerkLib.Bloodhound) && get_player().face.type != 24)
         {
            outputText("<b>你的嗅觉不再那么敏锐，狩猎本能也因为不再拥有狼的脸庞而消失了。</b>[pg]");
            get_player().removePerk(PerkLib.Bloodhound);
            _loc1_ = true;
         }
         if(get_player().hasPerk(PerkLib.HistoryDEUSVULT) && !get_player().isPureEnough(25) && get_player().perkv2(PerkLib.HistoryDEUSVULT) != 1)
         {
            outputText("<b>你未能阻止体内的腐化浪潮，训练失败了。你神赐的力量已经丧失，失败的认知将永久削弱你！</b>[pg]");
            get_player().setPerkValue(PerkLib.HistoryDEUSVULT,1,-25);
            get_player().setPerkValue(PerkLib.HistoryDEUSVULT,2,1);
            return true;
         }
         if(get_player().lowerBody.type == 13 && get_player().tail.type == 11 && get_player().hasPerk(PerkLib.HarpyWomb))
         {
            if(get_player().hasStatusEffect(StatusEffects.Eggs) && get_player().statusEffectv2(StatusEffects.Eggs) == 0)
            {
               get_player().changeStatusValue(StatusEffects.Eggs,2,1);
               outputText("<b>一阵熟悉的、充满母性的咕噜声让你知道，你那哈比般的子宫正在孕育着又大又好的卵。</b>[pg]");
               _loc1_ = true;
            }
         }
         if(get_player().hasCock() && get_player().cocks[0].get_cockType() == CockTypesEnum.BEE)
         {
            if(int(get_player().cocks.length) > 1)
            {
               outputText("你感到阴茎有些黏糊糊的，还伴随着刺痛感。看来你的蜜蜂阴茎已经吸收了新长出的部分，没有留下任何痕迹。[pg]");
               while(int(get_player().cocks.length) > 1)
               {
                  get_player().removeCock(1,1);
               }
            }
            if(get_player().cocks[0].cockLength < 25 || get_player().cocks[0].cockThickness < 4)
            {
               outputText("你的[cock]颤抖了片刻，然后稍微变");
               if(get_player().cocks[0].cockLength < 25 && get_player().cocks[0].cockThickness < 4)
               {
                  outputText("变得更长更粗");
               }
               else
               {
                  outputText(get_player().cocks[0].cockLength < 25 ? "再次变长" : "再次变粗");
               }
               outputText("，同时一阵痛楚传遍全身。看起来你的蜜蜂肉棒不会再变小了。[pg]");
               get_player().cocks[0].cockLength = Math.max(get_player().cocks[0].cockLength,25);
               get_player().cocks[0].cockThickness = Math.max(get_player().cocks[0].cockThickness,4);
            }
            if(get_player().hasPerk(PerkLib.WellAdjusted))
            {
               dynStats(DynStat.Lust(5));
            }
            else
            {
               dynStats(DynStat.Lust(10));
            }
            _loc1_ = true;
         }
         if(!get_player().hasVagina() && get_player().hasUnpermedPerk(PerkLib.Diapause))
         {
            outputText("<b>随着子宫的消失，你失去了类似袋鼠的胚胎滞育能力。</b>[pg]");
            get_player().removePerk(PerkLib.Diapause);
            _loc1_ = true;
         }
         if(get_player().lowerBody.type == 3)
         {
            if(get_player().tail.type > 0)
            {
               outputText("你的尾巴扭动着，在你更大的娜迦尾巴上摩擦，周围的鳞片分开，将其吸收。");
               outputText("[pg]<b>你的下半身完全变得布满鳞片且光滑。</b>[pg]");
               get_player().tail.type = 0;
               _loc1_ = true;
            }
         }
         if(get_player().hasPerk(PerkLib.WetPussy) && get_player().hasVagina())
         {
            if(get_player().vaginas[0].vaginalWetness < 2)
            {
               outputText("<b>你的" + get_player().vaginaDescript(0) + "恢复了正常湿润的状态。</b>[pg]");
               get_player().vaginas[0].vaginalWetness = 2;
               _loc1_ = true;
            }
         }
         if(get_player().hasPerk(PerkLib.MaraesGiftButtslut) && get_player().ass.analWetness < 2)
         {
            outputText("<b>你的[asshole]很快又变得湿润了。看来玛莱的“礼物”是无法移除的。</b>[pg]");
            get_player().ass.analWetness = 2;
            _loc1_ = true;
         }
         if(get_player().get_pregnancyIncubation() <= 0 && get_player().get_pregnancyType() == 5)
         {
            get_player().knockUpForce();
         }
         if(get_player().hasStatusEffect(StatusEffects.Uniball) && get_player().ballSize > 3 && get_player().balls > 0)
         {
            outputText("你感到生殖器周围有一种深深的释放感。你如释重负地叹了口气，心满意足，因为你的睾丸向下垂落并向外绽放，热量在其中跳动，它们分裂并形成了一个真正的阴囊。[pg]");
            get_player().removeStatusEffect(StatusEffects.Uniball);
            _loc1_ = true;
         }
         if(!get_player().hasPerk(PerkLib.Androgyny))
         {
            _loc7_ = get_player().fixFemininity();
            if(_loc7_ != "")
            {
               outputText(_loc7_);
               _loc1_ = true;
            }
         }
         if(get_player().hasStatusEffect(StatusEffects.LustStickApplied))
         {
            get_player().addStatusValue(StatusEffects.LustStickApplied,1,-1);
            if(get_player().statusEffectv1(StatusEffects.LustStickApplied) <= 0)
            {
               get_player().removeStatusEffect(StatusEffects.LustStickApplied);
               outputText("<b>你的迷药唇膏褪去了，只在嘴唇上留下极淡的痕迹。如果你想通过亲吻让敌人屈服，就得再涂一些！</b>[pg]");
            }
         }
         if(get_player().hasStatusEffect(StatusEffects.Luststick))
         {
            get_player().addStatusValue(StatusEffects.Luststick,1,-1);
            if(Utils.rand(2) == 0 && get_player().hasCock())
            {
               if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,95) == 0)
               {
                  outputText("你的身体一阵酥麻，简直成了哈比唇膏药效的奴隶。血液涌向[eachcock]，让你在被迫的快感中大声呻吟。不请自来的幻想侵袭着你，在恢复理智之前，你花了好一会儿幻想去操那些长满羽毛的女人。[pg]");
                  _loc5_ = KFLAGS.flags;
                  FlagDict_Impl_.arrayWriteInt(_loc5_,95,FlagDict_Impl_.arrayReadInt(_loc5_,95) + 1);
                  _loc1_ = true;
               }
               if(int([DynStat.Lust(20)].length) == 0)
               {
                  get_game().player.dynStats();
               }
               else if(int([DynStat.Lust(20)].length) == 1)
               {
                  get_game().player.dynStats([DynStat.Lust(20)][0]);
               }
               else if(int([DynStat.Lust(20)].length) == 2)
               {
                  get_game().player.dynStats([DynStat.Lust(20)][0],[DynStat.Lust(20)][1]);
               }
               else if(int([DynStat.Lust(20)].length) == 3)
               {
                  get_game().player.dynStats([DynStat.Lust(20)][0],[DynStat.Lust(20)][1],[DynStat.Lust(20)][2]);
               }
               else if(int([DynStat.Lust(20)].length) == 4)
               {
                  get_game().player.dynStats([DynStat.Lust(20)][0],[DynStat.Lust(20)][1],[DynStat.Lust(20)][2],[DynStat.Lust(20)][3]);
               }
               else if(int([DynStat.Lust(20)].length) == 5)
               {
                  get_game().player.dynStats([DynStat.Lust(20)][0],[DynStat.Lust(20)][1],[DynStat.Lust(20)][2],[DynStat.Lust(20)][3],[DynStat.Lust(20)][4]);
               }
               else if(int([DynStat.Lust(20)].length) == 6)
               {
                  get_game().player.dynStats([DynStat.Lust(20)][0],[DynStat.Lust(20)][1],[DynStat.Lust(20)][2],[DynStat.Lust(20)][3],[DynStat.Lust(20)][4],[DynStat.Lust(20)][5]);
               }
               else if(int([DynStat.Lust(20)].length) == 7)
               {
                  get_game().player.dynStats([DynStat.Lust(20)][0],[DynStat.Lust(20)][1],[DynStat.Lust(20)][2],[DynStat.Lust(20)][3],[DynStat.Lust(20)][4],[DynStat.Lust(20)][5],[DynStat.Lust(20)][6]);
               }
               else if(int([DynStat.Lust(20)].length) == 8)
               {
                  get_game().player.dynStats([DynStat.Lust(20)][0],[DynStat.Lust(20)][1],[DynStat.Lust(20)][2],[DynStat.Lust(20)][3],[DynStat.Lust(20)][4],[DynStat.Lust(20)][5],[DynStat.Lust(20)][6],[DynStat.Lust(20)][7]);
               }
               else if(int([DynStat.Lust(20)].length) == 9)
               {
                  get_game().player.dynStats([DynStat.Lust(20)][0],[DynStat.Lust(20)][1],[DynStat.Lust(20)][2],[DynStat.Lust(20)][3],[DynStat.Lust(20)][4],[DynStat.Lust(20)][5],[DynStat.Lust(20)][6],[DynStat.Lust(20)][7],[DynStat.Lust(20)][8]);
               }
               else if(int([DynStat.Lust(20)].length) == 10)
               {
                  get_game().player.dynStats([DynStat.Lust(20)][0],[DynStat.Lust(20)][1],[DynStat.Lust(20)][2],[DynStat.Lust(20)][3],[DynStat.Lust(20)][4],[DynStat.Lust(20)][5],[DynStat.Lust(20)][6],[DynStat.Lust(20)][7],[DynStat.Lust(20)][8],[DynStat.Lust(20)][9]);
               }
               else if(int([DynStat.Lust(20)].length) == 11)
               {
                  get_game().player.dynStats([DynStat.Lust(20)][0],[DynStat.Lust(20)][1],[DynStat.Lust(20)][2],[DynStat.Lust(20)][3],[DynStat.Lust(20)][4],[DynStat.Lust(20)][5],[DynStat.Lust(20)][6],[DynStat.Lust(20)][7],[DynStat.Lust(20)][8],[DynStat.Lust(20)][9],[DynStat.Lust(20)][10]);
               }
               else if(int([DynStat.Lust(20)].length) == 12)
               {
                  get_game().player.dynStats([DynStat.Lust(20)][0],[DynStat.Lust(20)][1],[DynStat.Lust(20)][2],[DynStat.Lust(20)][3],[DynStat.Lust(20)][4],[DynStat.Lust(20)][5],[DynStat.Lust(20)][6],[DynStat.Lust(20)][7],[DynStat.Lust(20)][8],[DynStat.Lust(20)][9],[DynStat.Lust(20)][10],[DynStat.Lust(20)][11]);
               }
               else if(int([DynStat.Lust(20)].length) == 13)
               {
                  get_game().player.dynStats([DynStat.Lust(20)][0],[DynStat.Lust(20)][1],[DynStat.Lust(20)][2],[DynStat.Lust(20)][3],[DynStat.Lust(20)][4],[DynStat.Lust(20)][5],[DynStat.Lust(20)][6],[DynStat.Lust(20)][7],[DynStat.Lust(20)][8],[DynStat.Lust(20)][9],[DynStat.Lust(20)][10],[DynStat.Lust(20)][11],[DynStat.Lust(20)][12]);
               }
               else if(int([DynStat.Lust(20)].length) == 14)
               {
                  get_game().player.dynStats([DynStat.Lust(20)][0],[DynStat.Lust(20)][1],[DynStat.Lust(20)][2],[DynStat.Lust(20)][3],[DynStat.Lust(20)][4],[DynStat.Lust(20)][5],[DynStat.Lust(20)][6],[DynStat.Lust(20)][7],[DynStat.Lust(20)][8],[DynStat.Lust(20)][9],[DynStat.Lust(20)][10],[DynStat.Lust(20)][11],[DynStat.Lust(20)][12],[DynStat.Lust(20)][13]);
               }
               else if(int([DynStat.Lust(20)].length) == 15)
               {
                  get_game().player.dynStats([DynStat.Lust(20)][0],[DynStat.Lust(20)][1],[DynStat.Lust(20)][2],[DynStat.Lust(20)][3],[DynStat.Lust(20)][4],[DynStat.Lust(20)][5],[DynStat.Lust(20)][6],[DynStat.Lust(20)][7],[DynStat.Lust(20)][8],[DynStat.Lust(20)][9],[DynStat.Lust(20)][10],[DynStat.Lust(20)][11],[DynStat.Lust(20)][12],[DynStat.Lust(20)][13],[DynStat.Lust(20)][14]);
               }
               else if(int([DynStat.Lust(20)].length) == 16)
               {
                  get_game().player.dynStats([DynStat.Lust(20)][0],[DynStat.Lust(20)][1],[DynStat.Lust(20)][2],[DynStat.Lust(20)][3],[DynStat.Lust(20)][4],[DynStat.Lust(20)][5],[DynStat.Lust(20)][6],[DynStat.Lust(20)][7],[DynStat.Lust(20)][8],[DynStat.Lust(20)][9],[DynStat.Lust(20)][10],[DynStat.Lust(20)][11],[DynStat.Lust(20)][12],[DynStat.Lust(20)][13],[DynStat.Lust(20)][14],[DynStat.Lust(20)][15]);
               }
               else if(int([DynStat.Lust(20)].length) == 17)
               {
                  get_game().player.dynStats([DynStat.Lust(20)][0],[DynStat.Lust(20)][1],[DynStat.Lust(20)][2],[DynStat.Lust(20)][3],[DynStat.Lust(20)][4],[DynStat.Lust(20)][5],[DynStat.Lust(20)][6],[DynStat.Lust(20)][7],[DynStat.Lust(20)][8],[DynStat.Lust(20)][9],[DynStat.Lust(20)][10],[DynStat.Lust(20)][11],[DynStat.Lust(20)][12],[DynStat.Lust(20)][13],[DynStat.Lust(20)][14],[DynStat.Lust(20)][15],[DynStat.Lust(20)][16]);
               }
               else if(int([DynStat.Lust(20)].length) == 18)
               {
                  get_game().player.dynStats([DynStat.Lust(20)][0],[DynStat.Lust(20)][1],[DynStat.Lust(20)][2],[DynStat.Lust(20)][3],[DynStat.Lust(20)][4],[DynStat.Lust(20)][5],[DynStat.Lust(20)][6],[DynStat.Lust(20)][7],[DynStat.Lust(20)][8],[DynStat.Lust(20)][9],[DynStat.Lust(20)][10],[DynStat.Lust(20)][11],[DynStat.Lust(20)][12],[DynStat.Lust(20)][13],[DynStat.Lust(20)][14],[DynStat.Lust(20)][15],[DynStat.Lust(20)][16],[DynStat.Lust(20)][17]);
               }
               else if(int([DynStat.Lust(20)].length) == 19)
               {
                  get_game().player.dynStats([DynStat.Lust(20)][0],[DynStat.Lust(20)][1],[DynStat.Lust(20)][2],[DynStat.Lust(20)][3],[DynStat.Lust(20)][4],[DynStat.Lust(20)][5],[DynStat.Lust(20)][6],[DynStat.Lust(20)][7],[DynStat.Lust(20)][8],[DynStat.Lust(20)][9],[DynStat.Lust(20)][10],[DynStat.Lust(20)][11],[DynStat.Lust(20)][12],[DynStat.Lust(20)][13],[DynStat.Lust(20)][14],[DynStat.Lust(20)][15],[DynStat.Lust(20)][16],[DynStat.Lust(20)][17],[DynStat.Lust(20)][18]);
               }
               else
               {
                  if(int([DynStat.Lust(20)].length) != 20)
                  {
                     throw "Too many rest arguments";
                  }
                  get_game().player.dynStats([DynStat.Lust(20)][0],[DynStat.Lust(20)][1],[DynStat.Lust(20)][2],[DynStat.Lust(20)][3],[DynStat.Lust(20)][4],[DynStat.Lust(20)][5],[DynStat.Lust(20)][6],[DynStat.Lust(20)][7],[DynStat.Lust(20)][8],[DynStat.Lust(20)][9],[DynStat.Lust(20)][10],[DynStat.Lust(20)][11],[DynStat.Lust(20)][12],[DynStat.Lust(20)][13],[DynStat.Lust(20)][14],[DynStat.Lust(20)][15],[DynStat.Lust(20)][16],[DynStat.Lust(20)][17],[DynStat.Lust(20)][18],[DynStat.Lust(20)][19]);
               }
               if(get_player().get_lust() > get_player().maxLust())
               {
                  get_player().set_lust(get_player().maxLust());
               }
            }
            if(get_player().statusEffectv1(StatusEffects.Luststick) <= 0)
            {
               get_player().removeStatusEffect(StatusEffects.Luststick);
               dynStats(DynStat.Lib(FlagDict_Impl_.arrayReadFloat(KFLAGS.flags,2071),DynStatOp.Eq));
               outputText("<b>哈比唇膏的催情效果已经消失了！</b>[pg]");
               _loc1_ = true;
            }
         }
         if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,285) >= 50 && !get_player().hasPerk(PerkLib.LuststickAdapted))
         {
            get_game().sophieBimbo.unlockResistance();
            if(get_player().hasStatusEffect(StatusEffects.Luststick))
            {
               get_player().removeStatusEffect(StatusEffects.Luststick);
            }
            _loc1_ = true;
         }
         if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,592) > 0)
         {
            _loc2_ = 592;
            FlagDict_Impl_.arrayWriteInt(KFLAGS.flags,_loc2_,FlagDict_Impl_.arrayReadInt(KFLAGS.flags,_loc2_) - 1);
            if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,592) == 1)
            {
               get_game().masturbation.birthBeeEggsOutYourWang();
               _loc1_ = true;
            }
         }
         if(get_player().hasStatusEffect(StatusEffects.Eggchest))
         {
            get_player().addStatusValue(StatusEffects.Eggchest,1,-1);
            if(get_player().statusEffectv1(StatusEffects.Eggchest) <= 0)
            {
               outputText("<b>你感觉到[fullChest]里圆润的卵正在消失，被你的身体吸收了。</b>");
               get_player().growTits(get_player().statusEffectv2(StatusEffects.Eggchest),get_player().bRows(),true,2);
               outputText("[pg]");
               get_player().removeStatusEffect(StatusEffects.Eggchest);
               _loc1_ = true;
            }
         }
         if(get_player().hasPerk(PerkLib.SpiderOvipositor) || get_player().hasPerk(PerkLib.BeeOvipositor))
         {
            if(get_player().hasUnpermedPerk(PerkLib.SpiderOvipositor) && (!get_player().isDrider() || get_player().tail.type != 5))
            {
               outputText("<b>由于你的身体不再那么像蜘蛛，你的产卵管（和卵）消失了。</b>[pg]");
               get_player().removePerk(PerkLib.SpiderOvipositor);
               _loc1_ = true;
            }
            else if(get_player().hasUnpermedPerk(PerkLib.BeeOvipositor) && get_player().tail.type != 6)
            {
               outputText("<b>由于你的身体不再那么像蜜蜂，你的产卵管（和卵）消失了。</b>[pg]");
               get_player().removePerk(PerkLib.BeeOvipositor);
               _loc1_ = true;
            }
            else
            {
               _loc2_ = get_player().eggs();
               if(_loc2_ < 10)
               {
                  get_player().addEggs(2);
               }
               else if(_loc2_ < 20 && int(get_game().time.hours % 2) == 0)
               {
                  get_player().addEggs(1);
               }
               else if(int(get_game().time.hours % 4) == 0)
               {
                  get_player().addEggs(1);
               }
               if(_loc2_ < 10 && get_player().eggs() >= 10)
               {
                  if(get_player().hasPerk(PerkLib.SpiderOvipositor))
                  {
                     outputText("你感觉到蜘蛛半身的腹部正在积聚一种充实感。");
                  }
                  else
                  {
                     outputText("你感觉到昆虫般的腹部正在积聚一种充实感。你已经准备好了一些卵……并且你感到一种奇怪的冲动，想要让它们受精。");
                     if(!get_player().hasVagina())
                     {
                        outputText("等等，你到底要怎么做呢？");
                     }
                  }
                  outputText("[pg]<b>你有足够的卵可以产了！</b>[pg]");
                  _loc1_ = true;
               }
               else if(_loc2_ < 20 && get_player().eggs() >= 20)
               {
                  if(get_player().hasPerk(PerkLib.SpiderOvipositor))
                  {
                     outputText("[pg]你的蜘蛛身体感觉紧绷绷的，一股沉甸甸的暖意蔓延全身。卵在你体内堆积的感觉足以让你心神不宁。找个地方把它们产下来是个好主意——但是，哦，如果能先用一根漂亮坚挺的肉棒给它们受精，那感觉该有多棒！");
                     if(!get_player().hasVagina())
                     {
                        outputText("等等，这不对劲……");
                     }
                  }
                  else
                  {
                     outputText("你的腹部感觉紧绷绷的，一股沉甸甸的暖意蔓延全身。随着你的每一个动作，它都在沉甸甸地摇摆，卵在你体内堆积的感觉足以让你心神不宁。");
                  }
                  outputText("[pg]<b>最低欲望值提升！</b>[pg]");
                  _loc1_ = true;
               }
               else if(_loc2_ < 40 && get_player().eggs() >= 40)
               {
                  if(get_player().hasPerk(PerkLib.SpiderOvipositor))
                  {
                     outputText("你的下半身变得如此沉重，现在连移动都很困难，卵的重量压在你被欲望冲昏头脑的身体上。你的产卵管从隐藏处探出，滴落着滑腻的润滑液，期待着将它的负担填满任何东西。你必须尽快找人帮你卸下重担……");
                     outputText("[pg]<b>最低欲望值提升！</b>[pg]");
                  }
                  else
                  {
                     outputText("你的蜜蜂下半身变得如此沉重，现在连移动都很困难，卵的重量压在你被欲望冲昏头脑的身体上。你的产卵管从隐藏处探出，滴落着甜美滑腻的润滑液，期待着将它的负担填满任何东西。你必须尽快找人帮你卸下重担……[pg]");
                  }
                  if(int([DynStat.Spe(-1)].length) == 0)
                  {
                     get_game().player.dynStats();
                  }
                  else if(int([DynStat.Spe(-1)].length) == 1)
                  {
                     get_game().player.dynStats([DynStat.Spe(-1)][0]);
                  }
                  else if(int([DynStat.Spe(-1)].length) == 2)
                  {
                     get_game().player.dynStats([DynStat.Spe(-1)][0],[DynStat.Spe(-1)][1]);
                  }
                  else if(int([DynStat.Spe(-1)].length) == 3)
                  {
                     get_game().player.dynStats([DynStat.Spe(-1)][0],[DynStat.Spe(-1)][1],[DynStat.Spe(-1)][2]);
                  }
                  else if(int([DynStat.Spe(-1)].length) == 4)
                  {
                     get_game().player.dynStats([DynStat.Spe(-1)][0],[DynStat.Spe(-1)][1],[DynStat.Spe(-1)][2],[DynStat.Spe(-1)][3]);
                  }
                  else if(int([DynStat.Spe(-1)].length) == 5)
                  {
                     get_game().player.dynStats([DynStat.Spe(-1)][0],[DynStat.Spe(-1)][1],[DynStat.Spe(-1)][2],[DynStat.Spe(-1)][3],[DynStat.Spe(-1)][4]);
                  }
                  else if(int([DynStat.Spe(-1)].length) == 6)
                  {
                     get_game().player.dynStats([DynStat.Spe(-1)][0],[DynStat.Spe(-1)][1],[DynStat.Spe(-1)][2],[DynStat.Spe(-1)][3],[DynStat.Spe(-1)][4],[DynStat.Spe(-1)][5]);
                  }
                  else if(int([DynStat.Spe(-1)].length) == 7)
                  {
                     get_game().player.dynStats([DynStat.Spe(-1)][0],[DynStat.Spe(-1)][1],[DynStat.Spe(-1)][2],[DynStat.Spe(-1)][3],[DynStat.Spe(-1)][4],[DynStat.Spe(-1)][5],[DynStat.Spe(-1)][6]);
                  }
                  else if(int([DynStat.Spe(-1)].length) == 8)
                  {
                     get_game().player.dynStats([DynStat.Spe(-1)][0],[DynStat.Spe(-1)][1],[DynStat.Spe(-1)][2],[DynStat.Spe(-1)][3],[DynStat.Spe(-1)][4],[DynStat.Spe(-1)][5],[DynStat.Spe(-1)][6],[DynStat.Spe(-1)][7]);
                  }
                  else if(int([DynStat.Spe(-1)].length) == 9)
                  {
                     get_game().player.dynStats([DynStat.Spe(-1)][0],[DynStat.Spe(-1)][1],[DynStat.Spe(-1)][2],[DynStat.Spe(-1)][3],[DynStat.Spe(-1)][4],[DynStat.Spe(-1)][5],[DynStat.Spe(-1)][6],[DynStat.Spe(-1)][7],[DynStat.Spe(-1)][8]);
                  }
                  else if(int([DynStat.Spe(-1)].length) == 10)
                  {
                     get_game().player.dynStats([DynStat.Spe(-1)][0],[DynStat.Spe(-1)][1],[DynStat.Spe(-1)][2],[DynStat.Spe(-1)][3],[DynStat.Spe(-1)][4],[DynStat.Spe(-1)][5],[DynStat.Spe(-1)][6],[DynStat.Spe(-1)][7],[DynStat.Spe(-1)][8],[DynStat.Spe(-1)][9]);
                  }
                  else if(int([DynStat.Spe(-1)].length) == 11)
                  {
                     get_game().player.dynStats([DynStat.Spe(-1)][0],[DynStat.Spe(-1)][1],[DynStat.Spe(-1)][2],[DynStat.Spe(-1)][3],[DynStat.Spe(-1)][4],[DynStat.Spe(-1)][5],[DynStat.Spe(-1)][6],[DynStat.Spe(-1)][7],[DynStat.Spe(-1)][8],[DynStat.Spe(-1)][9],[DynStat.Spe(-1)][10]);
                  }
                  else if(int([DynStat.Spe(-1)].length) == 12)
                  {
                     get_game().player.dynStats([DynStat.Spe(-1)][0],[DynStat.Spe(-1)][1],[DynStat.Spe(-1)][2],[DynStat.Spe(-1)][3],[DynStat.Spe(-1)][4],[DynStat.Spe(-1)][5],[DynStat.Spe(-1)][6],[DynStat.Spe(-1)][7],[DynStat.Spe(-1)][8],[DynStat.Spe(-1)][9],[DynStat.Spe(-1)][10],[DynStat.Spe(-1)][11]);
                  }
                  else if(int([DynStat.Spe(-1)].length) == 13)
                  {
                     get_game().player.dynStats([DynStat.Spe(-1)][0],[DynStat.Spe(-1)][1],[DynStat.Spe(-1)][2],[DynStat.Spe(-1)][3],[DynStat.Spe(-1)][4],[DynStat.Spe(-1)][5],[DynStat.Spe(-1)][6],[DynStat.Spe(-1)][7],[DynStat.Spe(-1)][8],[DynStat.Spe(-1)][9],[DynStat.Spe(-1)][10],[DynStat.Spe(-1)][11],[DynStat.Spe(-1)][12]);
                  }
                  else if(int([DynStat.Spe(-1)].length) == 14)
                  {
                     get_game().player.dynStats([DynStat.Spe(-1)][0],[DynStat.Spe(-1)][1],[DynStat.Spe(-1)][2],[DynStat.Spe(-1)][3],[DynStat.Spe(-1)][4],[DynStat.Spe(-1)][5],[DynStat.Spe(-1)][6],[DynStat.Spe(-1)][7],[DynStat.Spe(-1)][8],[DynStat.Spe(-1)][9],[DynStat.Spe(-1)][10],[DynStat.Spe(-1)][11],[DynStat.Spe(-1)][12],[DynStat.Spe(-1)][13]);
                  }
                  else if(int([DynStat.Spe(-1)].length) == 15)
                  {
                     get_game().player.dynStats([DynStat.Spe(-1)][0],[DynStat.Spe(-1)][1],[DynStat.Spe(-1)][2],[DynStat.Spe(-1)][3],[DynStat.Spe(-1)][4],[DynStat.Spe(-1)][5],[DynStat.Spe(-1)][6],[DynStat.Spe(-1)][7],[DynStat.Spe(-1)][8],[DynStat.Spe(-1)][9],[DynStat.Spe(-1)][10],[DynStat.Spe(-1)][11],[DynStat.Spe(-1)][12],[DynStat.Spe(-1)][13],[DynStat.Spe(-1)][14]);
                  }
                  else if(int([DynStat.Spe(-1)].length) == 16)
                  {
                     get_game().player.dynStats([DynStat.Spe(-1)][0],[DynStat.Spe(-1)][1],[DynStat.Spe(-1)][2],[DynStat.Spe(-1)][3],[DynStat.Spe(-1)][4],[DynStat.Spe(-1)][5],[DynStat.Spe(-1)][6],[DynStat.Spe(-1)][7],[DynStat.Spe(-1)][8],[DynStat.Spe(-1)][9],[DynStat.Spe(-1)][10],[DynStat.Spe(-1)][11],[DynStat.Spe(-1)][12],[DynStat.Spe(-1)][13],[DynStat.Spe(-1)][14],[DynStat.Spe(-1)][15]);
                  }
                  else if(int([DynStat.Spe(-1)].length) == 17)
                  {
                     get_game().player.dynStats([DynStat.Spe(-1)][0],[DynStat.Spe(-1)][1],[DynStat.Spe(-1)][2],[DynStat.Spe(-1)][3],[DynStat.Spe(-1)][4],[DynStat.Spe(-1)][5],[DynStat.Spe(-1)][6],[DynStat.Spe(-1)][7],[DynStat.Spe(-1)][8],[DynStat.Spe(-1)][9],[DynStat.Spe(-1)][10],[DynStat.Spe(-1)][11],[DynStat.Spe(-1)][12],[DynStat.Spe(-1)][13],[DynStat.Spe(-1)][14],[DynStat.Spe(-1)][15],[DynStat.Spe(-1)][16]);
                  }
                  else if(int([DynStat.Spe(-1)].length) == 18)
                  {
                     get_game().player.dynStats([DynStat.Spe(-1)][0],[DynStat.Spe(-1)][1],[DynStat.Spe(-1)][2],[DynStat.Spe(-1)][3],[DynStat.Spe(-1)][4],[DynStat.Spe(-1)][5],[DynStat.Spe(-1)][6],[DynStat.Spe(-1)][7],[DynStat.Spe(-1)][8],[DynStat.Spe(-1)][9],[DynStat.Spe(-1)][10],[DynStat.Spe(-1)][11],[DynStat.Spe(-1)][12],[DynStat.Spe(-1)][13],[DynStat.Spe(-1)][14],[DynStat.Spe(-1)][15],[DynStat.Spe(-1)][16],[DynStat.Spe(-1)][17]);
                  }
                  else if(int([DynStat.Spe(-1)].length) == 19)
                  {
                     get_game().player.dynStats([DynStat.Spe(-1)][0],[DynStat.Spe(-1)][1],[DynStat.Spe(-1)][2],[DynStat.Spe(-1)][3],[DynStat.Spe(-1)][4],[DynStat.Spe(-1)][5],[DynStat.Spe(-1)][6],[DynStat.Spe(-1)][7],[DynStat.Spe(-1)][8],[DynStat.Spe(-1)][9],[DynStat.Spe(-1)][10],[DynStat.Spe(-1)][11],[DynStat.Spe(-1)][12],[DynStat.Spe(-1)][13],[DynStat.Spe(-1)][14],[DynStat.Spe(-1)][15],[DynStat.Spe(-1)][16],[DynStat.Spe(-1)][17],[DynStat.Spe(-1)][18]);
                  }
                  else
                  {
                     if(int([DynStat.Spe(-1)].length) != 20)
                     {
                        throw "Too many rest arguments";
                     }
                     get_game().player.dynStats([DynStat.Spe(-1)][0],[DynStat.Spe(-1)][1],[DynStat.Spe(-1)][2],[DynStat.Spe(-1)][3],[DynStat.Spe(-1)][4],[DynStat.Spe(-1)][5],[DynStat.Spe(-1)][6],[DynStat.Spe(-1)][7],[DynStat.Spe(-1)][8],[DynStat.Spe(-1)][9],[DynStat.Spe(-1)][10],[DynStat.Spe(-1)][11],[DynStat.Spe(-1)][12],[DynStat.Spe(-1)][13],[DynStat.Spe(-1)][14],[DynStat.Spe(-1)][15],[DynStat.Spe(-1)][16],[DynStat.Spe(-1)][17],[DynStat.Spe(-1)][18],[DynStat.Spe(-1)][19]);
                  }
                  _loc1_ = true;
               }
            }
         }
         if(get_player().hasUnpermedPerk(PerkLib.BunnyEggs) && get_player().bunnyScore() < 3)
         {
            outputText("子宫的又一次变化波及了你的生殖系统。不知为何，你知道自己已经失去了自发产卵的能力。[pg](<b>失去特质：兔兔下蛋</b>)[pg]");
            get_player().removePerk(PerkLib.BunnyEggs);
            _loc1_ = true;
         }
         if(get_player().hasPerk(PerkLib.Oviposition) || get_player().hasPerk(PerkLib.BunnyEggs))
         {
            if(get_player().get_pregnancyIncubation() < 1 && get_player().hasVagina() && get_game().time.hours == 1)
            {
               if(get_player().totalFertility() > 50 && int(get_game().time.days % 15) == 0 || int(get_game().time.days % 30) == 0)
               {
                  outputText("<b>不知为何，你知道卵已经开始在你体内形成。你想知道还要多久它们才会显现出来？</b>[pg]");
                  get_player().knockUp(5,50,1,1);
                  get_player().createStatusEffect(StatusEffects.Eggs,Utils.rand(6),Utils.rand(2),5 + Utils.rand(3),0);
                  get_player().addPerkValue(PerkLib.Oviposition,1,1);
                  _loc1_ = true;
               }
            }
         }
         if(get_player().get_inHeat())
         {
            if(get_player().statusEffectv3(StatusEffects.Heat) <= 1 || int(get_player().vaginas.length) == 0)
            {
               _loc8_ = get_game();
               _loc9_ = [DynStat.Lib(-get_player().statusEffectv2(StatusEffects.Heat))];
               if(int(_loc9_.length) == 0)
               {
                  _loc8_.player.dynStats();
               }
               else if(int(_loc9_.length) == 1)
               {
                  _loc8_.player.dynStats(_loc9_[0]);
               }
               else if(int(_loc9_.length) == 2)
               {
                  _loc8_.player.dynStats(_loc9_[0],_loc9_[1]);
               }
               else if(int(_loc9_.length) == 3)
               {
                  _loc8_.player.dynStats(_loc9_[0],_loc9_[1],_loc9_[2]);
               }
               else if(int(_loc9_.length) == 4)
               {
                  _loc8_.player.dynStats(_loc9_[0],_loc9_[1],_loc9_[2],_loc9_[3]);
               }
               else if(int(_loc9_.length) == 5)
               {
                  _loc8_.player.dynStats(_loc9_[0],_loc9_[1],_loc9_[2],_loc9_[3],_loc9_[4]);
               }
               else if(int(_loc9_.length) == 6)
               {
                  _loc8_.player.dynStats(_loc9_[0],_loc9_[1],_loc9_[2],_loc9_[3],_loc9_[4],_loc9_[5]);
               }
               else if(int(_loc9_.length) == 7)
               {
                  _loc8_.player.dynStats(_loc9_[0],_loc9_[1],_loc9_[2],_loc9_[3],_loc9_[4],_loc9_[5],_loc9_[6]);
               }
               else if(int(_loc9_.length) == 8)
               {
                  _loc8_.player.dynStats(_loc9_[0],_loc9_[1],_loc9_[2],_loc9_[3],_loc9_[4],_loc9_[5],_loc9_[6],_loc9_[7]);
               }
               else if(int(_loc9_.length) == 9)
               {
                  _loc8_.player.dynStats(_loc9_[0],_loc9_[1],_loc9_[2],_loc9_[3],_loc9_[4],_loc9_[5],_loc9_[6],_loc9_[7],_loc9_[8]);
               }
               else if(int(_loc9_.length) == 10)
               {
                  _loc8_.player.dynStats(_loc9_[0],_loc9_[1],_loc9_[2],_loc9_[3],_loc9_[4],_loc9_[5],_loc9_[6],_loc9_[7],_loc9_[8],_loc9_[9]);
               }
               else if(int(_loc9_.length) == 11)
               {
                  _loc8_.player.dynStats(_loc9_[0],_loc9_[1],_loc9_[2],_loc9_[3],_loc9_[4],_loc9_[5],_loc9_[6],_loc9_[7],_loc9_[8],_loc9_[9],_loc9_[10]);
               }
               else if(int(_loc9_.length) == 12)
               {
                  _loc8_.player.dynStats(_loc9_[0],_loc9_[1],_loc9_[2],_loc9_[3],_loc9_[4],_loc9_[5],_loc9_[6],_loc9_[7],_loc9_[8],_loc9_[9],_loc9_[10],_loc9_[11]);
               }
               else if(int(_loc9_.length) == 13)
               {
                  _loc8_.player.dynStats(_loc9_[0],_loc9_[1],_loc9_[2],_loc9_[3],_loc9_[4],_loc9_[5],_loc9_[6],_loc9_[7],_loc9_[8],_loc9_[9],_loc9_[10],_loc9_[11],_loc9_[12]);
               }
               else if(int(_loc9_.length) == 14)
               {
                  _loc8_.player.dynStats(_loc9_[0],_loc9_[1],_loc9_[2],_loc9_[3],_loc9_[4],_loc9_[5],_loc9_[6],_loc9_[7],_loc9_[8],_loc9_[9],_loc9_[10],_loc9_[11],_loc9_[12],_loc9_[13]);
               }
               else if(int(_loc9_.length) == 15)
               {
                  _loc8_.player.dynStats(_loc9_[0],_loc9_[1],_loc9_[2],_loc9_[3],_loc9_[4],_loc9_[5],_loc9_[6],_loc9_[7],_loc9_[8],_loc9_[9],_loc9_[10],_loc9_[11],_loc9_[12],_loc9_[13],_loc9_[14]);
               }
               else if(int(_loc9_.length) == 16)
               {
                  _loc8_.player.dynStats(_loc9_[0],_loc9_[1],_loc9_[2],_loc9_[3],_loc9_[4],_loc9_[5],_loc9_[6],_loc9_[7],_loc9_[8],_loc9_[9],_loc9_[10],_loc9_[11],_loc9_[12],_loc9_[13],_loc9_[14],_loc9_[15]);
               }
               else if(int(_loc9_.length) == 17)
               {
                  _loc8_.player.dynStats(_loc9_[0],_loc9_[1],_loc9_[2],_loc9_[3],_loc9_[4],_loc9_[5],_loc9_[6],_loc9_[7],_loc9_[8],_loc9_[9],_loc9_[10],_loc9_[11],_loc9_[12],_loc9_[13],_loc9_[14],_loc9_[15],_loc9_[16]);
               }
               else if(int(_loc9_.length) == 18)
               {
                  _loc8_.player.dynStats(_loc9_[0],_loc9_[1],_loc9_[2],_loc9_[3],_loc9_[4],_loc9_[5],_loc9_[6],_loc9_[7],_loc9_[8],_loc9_[9],_loc9_[10],_loc9_[11],_loc9_[12],_loc9_[13],_loc9_[14],_loc9_[15],_loc9_[16],_loc9_[17]);
               }
               else if(int(_loc9_.length) == 19)
               {
                  _loc8_.player.dynStats(_loc9_[0],_loc9_[1],_loc9_[2],_loc9_[3],_loc9_[4],_loc9_[5],_loc9_[6],_loc9_[7],_loc9_[8],_loc9_[9],_loc9_[10],_loc9_[11],_loc9_[12],_loc9_[13],_loc9_[14],_loc9_[15],_loc9_[16],_loc9_[17],_loc9_[18]);
               }
               else
               {
                  if(int(_loc9_.length) != 20)
                  {
                     throw "Too many rest arguments";
                  }
                  _loc8_.player.dynStats(_loc9_[0],_loc9_[1],_loc9_[2],_loc9_[3],_loc9_[4],_loc9_[5],_loc9_[6],_loc9_[7],_loc9_[8],_loc9_[9],_loc9_[10],_loc9_[11],_loc9_[12],_loc9_[13],_loc9_[14],_loc9_[15],_loc9_[16],_loc9_[17],_loc9_[18],_loc9_[19]);
               }
               get_player().removeStatusEffect(StatusEffects.Heat);
               if(get_player().lib < 1)
               {
                  get_player().lib = 1;
               }
               get_output().statScreenRefresh();
               outputText("<b>你的身体平静下来，终于度过了发情期。</b>[pg]");
               _loc1_ = true;
            }
            else
            {
               get_player().addStatusValue(StatusEffects.Heat,3,-1);
            }
         }
         if(get_player().get_inRut())
         {
            if(get_player().statusEffectv3(StatusEffects.Rut) <= 1 || get_player().totalCocks() == 0)
            {
               _loc8_ = get_game();
               _loc9_ = [DynStat.Lib(-get_player().statusEffectv2(StatusEffects.Rut)),DynStat.NoScale];
               if(int(_loc9_.length) == 0)
               {
                  _loc8_.player.dynStats();
               }
               else if(int(_loc9_.length) == 1)
               {
                  _loc8_.player.dynStats(_loc9_[0]);
               }
               else if(int(_loc9_.length) == 2)
               {
                  _loc8_.player.dynStats(_loc9_[0],_loc9_[1]);
               }
               else if(int(_loc9_.length) == 3)
               {
                  _loc8_.player.dynStats(_loc9_[0],_loc9_[1],_loc9_[2]);
               }
               else if(int(_loc9_.length) == 4)
               {
                  _loc8_.player.dynStats(_loc9_[0],_loc9_[1],_loc9_[2],_loc9_[3]);
               }
               else if(int(_loc9_.length) == 5)
               {
                  _loc8_.player.dynStats(_loc9_[0],_loc9_[1],_loc9_[2],_loc9_[3],_loc9_[4]);
               }
               else if(int(_loc9_.length) == 6)
               {
                  _loc8_.player.dynStats(_loc9_[0],_loc9_[1],_loc9_[2],_loc9_[3],_loc9_[4],_loc9_[5]);
               }
               else if(int(_loc9_.length) == 7)
               {
                  _loc8_.player.dynStats(_loc9_[0],_loc9_[1],_loc9_[2],_loc9_[3],_loc9_[4],_loc9_[5],_loc9_[6]);
               }
               else if(int(_loc9_.length) == 8)
               {
                  _loc8_.player.dynStats(_loc9_[0],_loc9_[1],_loc9_[2],_loc9_[3],_loc9_[4],_loc9_[5],_loc9_[6],_loc9_[7]);
               }
               else if(int(_loc9_.length) == 9)
               {
                  _loc8_.player.dynStats(_loc9_[0],_loc9_[1],_loc9_[2],_loc9_[3],_loc9_[4],_loc9_[5],_loc9_[6],_loc9_[7],_loc9_[8]);
               }
               else if(int(_loc9_.length) == 10)
               {
                  _loc8_.player.dynStats(_loc9_[0],_loc9_[1],_loc9_[2],_loc9_[3],_loc9_[4],_loc9_[5],_loc9_[6],_loc9_[7],_loc9_[8],_loc9_[9]);
               }
               else if(int(_loc9_.length) == 11)
               {
                  _loc8_.player.dynStats(_loc9_[0],_loc9_[1],_loc9_[2],_loc9_[3],_loc9_[4],_loc9_[5],_loc9_[6],_loc9_[7],_loc9_[8],_loc9_[9],_loc9_[10]);
               }
               else if(int(_loc9_.length) == 12)
               {
                  _loc8_.player.dynStats(_loc9_[0],_loc9_[1],_loc9_[2],_loc9_[3],_loc9_[4],_loc9_[5],_loc9_[6],_loc9_[7],_loc9_[8],_loc9_[9],_loc9_[10],_loc9_[11]);
               }
               else if(int(_loc9_.length) == 13)
               {
                  _loc8_.player.dynStats(_loc9_[0],_loc9_[1],_loc9_[2],_loc9_[3],_loc9_[4],_loc9_[5],_loc9_[6],_loc9_[7],_loc9_[8],_loc9_[9],_loc9_[10],_loc9_[11],_loc9_[12]);
               }
               else if(int(_loc9_.length) == 14)
               {
                  _loc8_.player.dynStats(_loc9_[0],_loc9_[1],_loc9_[2],_loc9_[3],_loc9_[4],_loc9_[5],_loc9_[6],_loc9_[7],_loc9_[8],_loc9_[9],_loc9_[10],_loc9_[11],_loc9_[12],_loc9_[13]);
               }
               else if(int(_loc9_.length) == 15)
               {
                  _loc8_.player.dynStats(_loc9_[0],_loc9_[1],_loc9_[2],_loc9_[3],_loc9_[4],_loc9_[5],_loc9_[6],_loc9_[7],_loc9_[8],_loc9_[9],_loc9_[10],_loc9_[11],_loc9_[12],_loc9_[13],_loc9_[14]);
               }
               else if(int(_loc9_.length) == 16)
               {
                  _loc8_.player.dynStats(_loc9_[0],_loc9_[1],_loc9_[2],_loc9_[3],_loc9_[4],_loc9_[5],_loc9_[6],_loc9_[7],_loc9_[8],_loc9_[9],_loc9_[10],_loc9_[11],_loc9_[12],_loc9_[13],_loc9_[14],_loc9_[15]);
               }
               else if(int(_loc9_.length) == 17)
               {
                  _loc8_.player.dynStats(_loc9_[0],_loc9_[1],_loc9_[2],_loc9_[3],_loc9_[4],_loc9_[5],_loc9_[6],_loc9_[7],_loc9_[8],_loc9_[9],_loc9_[10],_loc9_[11],_loc9_[12],_loc9_[13],_loc9_[14],_loc9_[15],_loc9_[16]);
               }
               else if(int(_loc9_.length) == 18)
               {
                  _loc8_.player.dynStats(_loc9_[0],_loc9_[1],_loc9_[2],_loc9_[3],_loc9_[4],_loc9_[5],_loc9_[6],_loc9_[7],_loc9_[8],_loc9_[9],_loc9_[10],_loc9_[11],_loc9_[12],_loc9_[13],_loc9_[14],_loc9_[15],_loc9_[16],_loc9_[17]);
               }
               else if(int(_loc9_.length) == 19)
               {
                  _loc8_.player.dynStats(_loc9_[0],_loc9_[1],_loc9_[2],_loc9_[3],_loc9_[4],_loc9_[5],_loc9_[6],_loc9_[7],_loc9_[8],_loc9_[9],_loc9_[10],_loc9_[11],_loc9_[12],_loc9_[13],_loc9_[14],_loc9_[15],_loc9_[16],_loc9_[17],_loc9_[18]);
               }
               else
               {
                  if(int(_loc9_.length) != 20)
                  {
                     throw "Too many rest arguments";
                  }
                  _loc8_.player.dynStats(_loc9_[0],_loc9_[1],_loc9_[2],_loc9_[3],_loc9_[4],_loc9_[5],_loc9_[6],_loc9_[7],_loc9_[8],_loc9_[9],_loc9_[10],_loc9_[11],_loc9_[12],_loc9_[13],_loc9_[14],_loc9_[15],_loc9_[16],_loc9_[17],_loc9_[18],_loc9_[19]);
               }
               get_player().removeStatusEffect(StatusEffects.Rut);
               if(get_player().lib < 10)
               {
                  get_player().lib = 10;
               }
               get_output().statScreenRefresh();
               outputText("<b>你的身体平静下来，终于度过了发情期。</b>[pg]");
               _loc1_ = true;
            }
            else
            {
               get_player().addStatusValue(StatusEffects.Rut,3,-1);
            }
         }
         if(get_player().hasStatusEffect(StatusEffects.LustyTongue))
         {
            if(Utils.rand(5) == 0)
            {
               outputText("你不断舔舐着嘴唇，因这带来的性快感而涨红了脸。");
               _loc8_ = get_game();
               _loc9_ = [DynStat.Lust(2 + Utils.rand(15))];
               if(int(_loc9_.length) == 0)
               {
                  _loc8_.player.dynStats();
               }
               else if(int(_loc9_.length) == 1)
               {
                  _loc8_.player.dynStats(_loc9_[0]);
               }
               else if(int(_loc9_.length) == 2)
               {
                  _loc8_.player.dynStats(_loc9_[0],_loc9_[1]);
               }
               else if(int(_loc9_.length) == 3)
               {
                  _loc8_.player.dynStats(_loc9_[0],_loc9_[1],_loc9_[2]);
               }
               else if(int(_loc9_.length) == 4)
               {
                  _loc8_.player.dynStats(_loc9_[0],_loc9_[1],_loc9_[2],_loc9_[3]);
               }
               else if(int(_loc9_.length) == 5)
               {
                  _loc8_.player.dynStats(_loc9_[0],_loc9_[1],_loc9_[2],_loc9_[3],_loc9_[4]);
               }
               else if(int(_loc9_.length) == 6)
               {
                  _loc8_.player.dynStats(_loc9_[0],_loc9_[1],_loc9_[2],_loc9_[3],_loc9_[4],_loc9_[5]);
               }
               else if(int(_loc9_.length) == 7)
               {
                  _loc8_.player.dynStats(_loc9_[0],_loc9_[1],_loc9_[2],_loc9_[3],_loc9_[4],_loc9_[5],_loc9_[6]);
               }
               else if(int(_loc9_.length) == 8)
               {
                  _loc8_.player.dynStats(_loc9_[0],_loc9_[1],_loc9_[2],_loc9_[3],_loc9_[4],_loc9_[5],_loc9_[6],_loc9_[7]);
               }
               else if(int(_loc9_.length) == 9)
               {
                  _loc8_.player.dynStats(_loc9_[0],_loc9_[1],_loc9_[2],_loc9_[3],_loc9_[4],_loc9_[5],_loc9_[6],_loc9_[7],_loc9_[8]);
               }
               else if(int(_loc9_.length) == 10)
               {
                  _loc8_.player.dynStats(_loc9_[0],_loc9_[1],_loc9_[2],_loc9_[3],_loc9_[4],_loc9_[5],_loc9_[6],_loc9_[7],_loc9_[8],_loc9_[9]);
               }
               else if(int(_loc9_.length) == 11)
               {
                  _loc8_.player.dynStats(_loc9_[0],_loc9_[1],_loc9_[2],_loc9_[3],_loc9_[4],_loc9_[5],_loc9_[6],_loc9_[7],_loc9_[8],_loc9_[9],_loc9_[10]);
               }
               else if(int(_loc9_.length) == 12)
               {
                  _loc8_.player.dynStats(_loc9_[0],_loc9_[1],_loc9_[2],_loc9_[3],_loc9_[4],_loc9_[5],_loc9_[6],_loc9_[7],_loc9_[8],_loc9_[9],_loc9_[10],_loc9_[11]);
               }
               else if(int(_loc9_.length) == 13)
               {
                  _loc8_.player.dynStats(_loc9_[0],_loc9_[1],_loc9_[2],_loc9_[3],_loc9_[4],_loc9_[5],_loc9_[6],_loc9_[7],_loc9_[8],_loc9_[9],_loc9_[10],_loc9_[11],_loc9_[12]);
               }
               else if(int(_loc9_.length) == 14)
               {
                  _loc8_.player.dynStats(_loc9_[0],_loc9_[1],_loc9_[2],_loc9_[3],_loc9_[4],_loc9_[5],_loc9_[6],_loc9_[7],_loc9_[8],_loc9_[9],_loc9_[10],_loc9_[11],_loc9_[12],_loc9_[13]);
               }
               else if(int(_loc9_.length) == 15)
               {
                  _loc8_.player.dynStats(_loc9_[0],_loc9_[1],_loc9_[2],_loc9_[3],_loc9_[4],_loc9_[5],_loc9_[6],_loc9_[7],_loc9_[8],_loc9_[9],_loc9_[10],_loc9_[11],_loc9_[12],_loc9_[13],_loc9_[14]);
               }
               else if(int(_loc9_.length) == 16)
               {
                  _loc8_.player.dynStats(_loc9_[0],_loc9_[1],_loc9_[2],_loc9_[3],_loc9_[4],_loc9_[5],_loc9_[6],_loc9_[7],_loc9_[8],_loc9_[9],_loc9_[10],_loc9_[11],_loc9_[12],_loc9_[13],_loc9_[14],_loc9_[15]);
               }
               else if(int(_loc9_.length) == 17)
               {
                  _loc8_.player.dynStats(_loc9_[0],_loc9_[1],_loc9_[2],_loc9_[3],_loc9_[4],_loc9_[5],_loc9_[6],_loc9_[7],_loc9_[8],_loc9_[9],_loc9_[10],_loc9_[11],_loc9_[12],_loc9_[13],_loc9_[14],_loc9_[15],_loc9_[16]);
               }
               else if(int(_loc9_.length) == 18)
               {
                  _loc8_.player.dynStats(_loc9_[0],_loc9_[1],_loc9_[2],_loc9_[3],_loc9_[4],_loc9_[5],_loc9_[6],_loc9_[7],_loc9_[8],_loc9_[9],_loc9_[10],_loc9_[11],_loc9_[12],_loc9_[13],_loc9_[14],_loc9_[15],_loc9_[16],_loc9_[17]);
               }
               else if(int(_loc9_.length) == 19)
               {
                  _loc8_.player.dynStats(_loc9_[0],_loc9_[1],_loc9_[2],_loc9_[3],_loc9_[4],_loc9_[5],_loc9_[6],_loc9_[7],_loc9_[8],_loc9_[9],_loc9_[10],_loc9_[11],_loc9_[12],_loc9_[13],_loc9_[14],_loc9_[15],_loc9_[16],_loc9_[17],_loc9_[18]);
               }
               else
               {
                  if(int(_loc9_.length) != 20)
                  {
                     throw "Too many rest arguments";
                  }
                  _loc8_.player.dynStats(_loc9_[0],_loc9_[1],_loc9_[2],_loc9_[3],_loc9_[4],_loc9_[5],_loc9_[6],_loc9_[7],_loc9_[8],_loc9_[9],_loc9_[10],_loc9_[11],_loc9_[12],_loc9_[13],_loc9_[14],_loc9_[15],_loc9_[16],_loc9_[17],_loc9_[18],_loc9_[19]);
               }
               if(get_player().get_lust() >= get_player().maxLust())
               {
                  outputText("你的双膝因快感而僵直，愉悦地向后倒去，像个荡妇一样扭动呻吟着，不知怎的，你竟然通过嘴巴高潮了。当一切结束后，你发现你的嘴巴变得比以前更加敏感了。");
                  get_player().orgasm("Lips");
                  if(int([DynStat.Sens(2)].length) == 0)
                  {
                     get_game().player.dynStats();
                  }
                  else if(int([DynStat.Sens(2)].length) == 1)
                  {
                     get_game().player.dynStats([DynStat.Sens(2)][0]);
                  }
                  else if(int([DynStat.Sens(2)].length) == 2)
                  {
                     get_game().player.dynStats([DynStat.Sens(2)][0],[DynStat.Sens(2)][1]);
                  }
                  else if(int([DynStat.Sens(2)].length) == 3)
                  {
                     get_game().player.dynStats([DynStat.Sens(2)][0],[DynStat.Sens(2)][1],[DynStat.Sens(2)][2]);
                  }
                  else if(int([DynStat.Sens(2)].length) == 4)
                  {
                     get_game().player.dynStats([DynStat.Sens(2)][0],[DynStat.Sens(2)][1],[DynStat.Sens(2)][2],[DynStat.Sens(2)][3]);
                  }
                  else if(int([DynStat.Sens(2)].length) == 5)
                  {
                     get_game().player.dynStats([DynStat.Sens(2)][0],[DynStat.Sens(2)][1],[DynStat.Sens(2)][2],[DynStat.Sens(2)][3],[DynStat.Sens(2)][4]);
                  }
                  else if(int([DynStat.Sens(2)].length) == 6)
                  {
                     get_game().player.dynStats([DynStat.Sens(2)][0],[DynStat.Sens(2)][1],[DynStat.Sens(2)][2],[DynStat.Sens(2)][3],[DynStat.Sens(2)][4],[DynStat.Sens(2)][5]);
                  }
                  else if(int([DynStat.Sens(2)].length) == 7)
                  {
                     get_game().player.dynStats([DynStat.Sens(2)][0],[DynStat.Sens(2)][1],[DynStat.Sens(2)][2],[DynStat.Sens(2)][3],[DynStat.Sens(2)][4],[DynStat.Sens(2)][5],[DynStat.Sens(2)][6]);
                  }
                  else if(int([DynStat.Sens(2)].length) == 8)
                  {
                     get_game().player.dynStats([DynStat.Sens(2)][0],[DynStat.Sens(2)][1],[DynStat.Sens(2)][2],[DynStat.Sens(2)][3],[DynStat.Sens(2)][4],[DynStat.Sens(2)][5],[DynStat.Sens(2)][6],[DynStat.Sens(2)][7]);
                  }
                  else if(int([DynStat.Sens(2)].length) == 9)
                  {
                     get_game().player.dynStats([DynStat.Sens(2)][0],[DynStat.Sens(2)][1],[DynStat.Sens(2)][2],[DynStat.Sens(2)][3],[DynStat.Sens(2)][4],[DynStat.Sens(2)][5],[DynStat.Sens(2)][6],[DynStat.Sens(2)][7],[DynStat.Sens(2)][8]);
                  }
                  else if(int([DynStat.Sens(2)].length) == 10)
                  {
                     get_game().player.dynStats([DynStat.Sens(2)][0],[DynStat.Sens(2)][1],[DynStat.Sens(2)][2],[DynStat.Sens(2)][3],[DynStat.Sens(2)][4],[DynStat.Sens(2)][5],[DynStat.Sens(2)][6],[DynStat.Sens(2)][7],[DynStat.Sens(2)][8],[DynStat.Sens(2)][9]);
                  }
                  else if(int([DynStat.Sens(2)].length) == 11)
                  {
                     get_game().player.dynStats([DynStat.Sens(2)][0],[DynStat.Sens(2)][1],[DynStat.Sens(2)][2],[DynStat.Sens(2)][3],[DynStat.Sens(2)][4],[DynStat.Sens(2)][5],[DynStat.Sens(2)][6],[DynStat.Sens(2)][7],[DynStat.Sens(2)][8],[DynStat.Sens(2)][9],[DynStat.Sens(2)][10]);
                  }
                  else if(int([DynStat.Sens(2)].length) == 12)
                  {
                     get_game().player.dynStats([DynStat.Sens(2)][0],[DynStat.Sens(2)][1],[DynStat.Sens(2)][2],[DynStat.Sens(2)][3],[DynStat.Sens(2)][4],[DynStat.Sens(2)][5],[DynStat.Sens(2)][6],[DynStat.Sens(2)][7],[DynStat.Sens(2)][8],[DynStat.Sens(2)][9],[DynStat.Sens(2)][10],[DynStat.Sens(2)][11]);
                  }
                  else if(int([DynStat.Sens(2)].length) == 13)
                  {
                     get_game().player.dynStats([DynStat.Sens(2)][0],[DynStat.Sens(2)][1],[DynStat.Sens(2)][2],[DynStat.Sens(2)][3],[DynStat.Sens(2)][4],[DynStat.Sens(2)][5],[DynStat.Sens(2)][6],[DynStat.Sens(2)][7],[DynStat.Sens(2)][8],[DynStat.Sens(2)][9],[DynStat.Sens(2)][10],[DynStat.Sens(2)][11],[DynStat.Sens(2)][12]);
                  }
                  else if(int([DynStat.Sens(2)].length) == 14)
                  {
                     get_game().player.dynStats([DynStat.Sens(2)][0],[DynStat.Sens(2)][1],[DynStat.Sens(2)][2],[DynStat.Sens(2)][3],[DynStat.Sens(2)][4],[DynStat.Sens(2)][5],[DynStat.Sens(2)][6],[DynStat.Sens(2)][7],[DynStat.Sens(2)][8],[DynStat.Sens(2)][9],[DynStat.Sens(2)][10],[DynStat.Sens(2)][11],[DynStat.Sens(2)][12],[DynStat.Sens(2)][13]);
                  }
                  else if(int([DynStat.Sens(2)].length) == 15)
                  {
                     get_game().player.dynStats([DynStat.Sens(2)][0],[DynStat.Sens(2)][1],[DynStat.Sens(2)][2],[DynStat.Sens(2)][3],[DynStat.Sens(2)][4],[DynStat.Sens(2)][5],[DynStat.Sens(2)][6],[DynStat.Sens(2)][7],[DynStat.Sens(2)][8],[DynStat.Sens(2)][9],[DynStat.Sens(2)][10],[DynStat.Sens(2)][11],[DynStat.Sens(2)][12],[DynStat.Sens(2)][13],[DynStat.Sens(2)][14]);
                  }
                  else if(int([DynStat.Sens(2)].length) == 16)
                  {
                     get_game().player.dynStats([DynStat.Sens(2)][0],[DynStat.Sens(2)][1],[DynStat.Sens(2)][2],[DynStat.Sens(2)][3],[DynStat.Sens(2)][4],[DynStat.Sens(2)][5],[DynStat.Sens(2)][6],[DynStat.Sens(2)][7],[DynStat.Sens(2)][8],[DynStat.Sens(2)][9],[DynStat.Sens(2)][10],[DynStat.Sens(2)][11],[DynStat.Sens(2)][12],[DynStat.Sens(2)][13],[DynStat.Sens(2)][14],[DynStat.Sens(2)][15]);
                  }
                  else if(int([DynStat.Sens(2)].length) == 17)
                  {
                     get_game().player.dynStats([DynStat.Sens(2)][0],[DynStat.Sens(2)][1],[DynStat.Sens(2)][2],[DynStat.Sens(2)][3],[DynStat.Sens(2)][4],[DynStat.Sens(2)][5],[DynStat.Sens(2)][6],[DynStat.Sens(2)][7],[DynStat.Sens(2)][8],[DynStat.Sens(2)][9],[DynStat.Sens(2)][10],[DynStat.Sens(2)][11],[DynStat.Sens(2)][12],[DynStat.Sens(2)][13],[DynStat.Sens(2)][14],[DynStat.Sens(2)][15],[DynStat.Sens(2)][16]);
                  }
                  else if(int([DynStat.Sens(2)].length) == 18)
                  {
                     get_game().player.dynStats([DynStat.Sens(2)][0],[DynStat.Sens(2)][1],[DynStat.Sens(2)][2],[DynStat.Sens(2)][3],[DynStat.Sens(2)][4],[DynStat.Sens(2)][5],[DynStat.Sens(2)][6],[DynStat.Sens(2)][7],[DynStat.Sens(2)][8],[DynStat.Sens(2)][9],[DynStat.Sens(2)][10],[DynStat.Sens(2)][11],[DynStat.Sens(2)][12],[DynStat.Sens(2)][13],[DynStat.Sens(2)][14],[DynStat.Sens(2)][15],[DynStat.Sens(2)][16],[DynStat.Sens(2)][17]);
                  }
                  else if(int([DynStat.Sens(2)].length) == 19)
                  {
                     get_game().player.dynStats([DynStat.Sens(2)][0],[DynStat.Sens(2)][1],[DynStat.Sens(2)][2],[DynStat.Sens(2)][3],[DynStat.Sens(2)][4],[DynStat.Sens(2)][5],[DynStat.Sens(2)][6],[DynStat.Sens(2)][7],[DynStat.Sens(2)][8],[DynStat.Sens(2)][9],[DynStat.Sens(2)][10],[DynStat.Sens(2)][11],[DynStat.Sens(2)][12],[DynStat.Sens(2)][13],[DynStat.Sens(2)][14],[DynStat.Sens(2)][15],[DynStat.Sens(2)][16],[DynStat.Sens(2)][17],[DynStat.Sens(2)][18]);
                  }
                  else
                  {
                     if(int([DynStat.Sens(2)].length) != 20)
                     {
                        throw "Too many rest arguments";
                     }
                     get_game().player.dynStats([DynStat.Sens(2)][0],[DynStat.Sens(2)][1],[DynStat.Sens(2)][2],[DynStat.Sens(2)][3],[DynStat.Sens(2)][4],[DynStat.Sens(2)][5],[DynStat.Sens(2)][6],[DynStat.Sens(2)][7],[DynStat.Sens(2)][8],[DynStat.Sens(2)][9],[DynStat.Sens(2)][10],[DynStat.Sens(2)][11],[DynStat.Sens(2)][12],[DynStat.Sens(2)][13],[DynStat.Sens(2)][14],[DynStat.Sens(2)][15],[DynStat.Sens(2)][16],[DynStat.Sens(2)][17],[DynStat.Sens(2)][18],[DynStat.Sens(2)][19]);
                  }
                  get_player().changeStatusValue(StatusEffects.LustyTongue,1,get_player().statusEffectv1(StatusEffects.LustyTongue) + 10);
               }
               outputText("[pg]");
               _loc1_ = true;
            }
            get_player().changeStatusValue(StatusEffects.LustyTongue,1,get_player().statusEffectv1(StatusEffects.LustyTongue) - 1);
            if(get_player().statusEffectv1(StatusEffects.LustyTongue) <= 0)
            {
               get_player().removeStatusEffect(StatusEffects.LustyTongue);
               outputText("你的嘴巴和舌头恢复了正常。[pg]");
               _loc1_ = true;
            }
         }
         if(get_player().statusEffectv2(StatusEffects.Kelt) > 0)
         {
            get_player().addStatusValue(StatusEffects.Kelt,2,-0.15);
         }
         if(get_game().bog.parasiteScene.parasiteUpdate())
         {
            _loc1_ = true;
         }
         if(get_game().bog.infestedChameleonGirlScene.parasiteUpdate())
         {
            _loc1_ = true;
         }
         if(get_game().mountain.nephilaSlimeScene.nephilaUpdate())
         {
            _loc1_ = true;
         }
         if(get_player().spellMod() >= 2.8 && FlagDict_Impl_.arrayReadInt(KFLAGS.flags,2685) + 2 <= get_game().time.days && !get_inDungeon() && (FlagDict_Impl_.arrayReadInt(KFLAGS.flags,2683) & 0x1000) == 0 && (FlagDict_Impl_.arrayReadInt(KFLAGS.flags,2683) & 0x0100) != 0)
         {
            outputText("<b>你听到一阵隆隆声，</b>并感觉到地面在剧烈震动，几乎让你绊倒。");
            outputText("[pg]你环顾四周，想找出是什么引起了这场地震，但一无所获。");
            outputText("[pg]震动来得快去得也快。你挠了挠头，感到有些困惑。接着，眼角余光中有什么明亮的东西引起了你的注意。");
            outputText("[pg]你转头循着光线望去，眼前的景象让你惊叹不已；仰望天空，你注意到在地平线的远方，群山之外，有一道巨大的光柱。你想了一会儿，断定它一定是从<b>火山岩壁</b>发出的。[pg]");
            _loc5_ = KFLAGS.flags;
            FlagDict_Impl_.arrayWriteInt(_loc5_,2683,FlagDict_Impl_.arrayReadInt(_loc5_,2683) + 4096);
            _loc1_ = true;
         }
         if(get_game().mountain.minotaurScene.minoCumUpdate())
         {
            _loc1_ = true;
         }
         else if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,20) >= 2 && int(get_game().time.hours % 13) == 0 && FlagDict_Impl_.arrayReadInt(KFLAGS.flags,330) == 0)
         {
            if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,20) == 2)
            {
               outputText("<b>你打了个寒颤，感觉有点冷。也许你应该再弄点牛头人精液？如果没有那种在脑海深处令人愉悦的嗡嗡声，你总觉得不太对劲。</b>[pg]");
            }
            else if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,20) == 3)
            {
               outputText("<b>你体内持续燃烧的欲望之火炽热无比，让你浑身发抖，忍不住抱住头。在这么长时间没有得到牛头人的爱之后，你依然处于戒断反应中。你很清楚，在得到满足之前，你都会一直发情且浑身酸痛。</b>[pg]");
            }
            _loc1_ = true;
         }
         else if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,330) > 0)
         {
            _loc2_ = 330;
            FlagDict_Impl_.arrayWriteInt(KFLAGS.flags,_loc2_,FlagDict_Impl_.arrayReadInt(KFLAGS.flags,_loc2_) - 1);
         }
         if(get_player().hasPerk(PerkLib.FutaForm))
         {
            if(!get_player().hasCock())
            {
               get_player().createCock();
               get_player().cocks[0].cockLength = 10;
               get_player().cocks[0].cockThickness = 2.75;
               outputText("<b>随着时间推移，你的下体感到了一阵瘙痒。一瞬间后，一根肉柱从你的胯下喷薄而出。你那根崭新的、10英寸长的肉棒欢快地跳动着。");
               if(get_player().balls == 0)
               {
                  outputText("一对沉甸甸的睾丸在它下方就位，翻腾着产生精液。");
                  get_player().balls = 2;
                  get_player().ballSize = 3;
               }
               if(int([DynStat.Inte(-1),DynStat.Sens(5),DynStat.Lust(15)].length) == 0)
               {
                  get_game().player.dynStats();
               }
               else if(int([DynStat.Inte(-1),DynStat.Sens(5),DynStat.Lust(15)].length) == 1)
               {
                  get_game().player.dynStats([DynStat.Inte(-1),DynStat.Sens(5),DynStat.Lust(15)][0]);
               }
               else if(int([DynStat.Inte(-1),DynStat.Sens(5),DynStat.Lust(15)].length) == 2)
               {
                  get_game().player.dynStats([DynStat.Inte(-1),DynStat.Sens(5),DynStat.Lust(15)][0],[DynStat.Inte(-1),DynStat.Sens(5),DynStat.Lust(15)][1]);
               }
               else if(int([DynStat.Inte(-1),DynStat.Sens(5),DynStat.Lust(15)].length) == 3)
               {
                  get_game().player.dynStats([DynStat.Inte(-1),DynStat.Sens(5),DynStat.Lust(15)][0],[DynStat.Inte(-1),DynStat.Sens(5),DynStat.Lust(15)][1],[DynStat.Inte(-1),DynStat.Sens(5),DynStat.Lust(15)][2]);
               }
               else if(int([DynStat.Inte(-1),DynStat.Sens(5),DynStat.Lust(15)].length) == 4)
               {
                  get_game().player.dynStats([DynStat.Inte(-1),DynStat.Sens(5),DynStat.Lust(15)][0],[DynStat.Inte(-1),DynStat.Sens(5),DynStat.Lust(15)][1],[DynStat.Inte(-1),DynStat.Sens(5),DynStat.Lust(15)][2],[DynStat.Inte(-1),DynStat.Sens(5),DynStat.Lust(15)][3]);
               }
               else if(int([DynStat.Inte(-1),DynStat.Sens(5),DynStat.Lust(15)].length) == 5)
               {
                  get_game().player.dynStats([DynStat.Inte(-1),DynStat.Sens(5),DynStat.Lust(15)][0],[DynStat.Inte(-1),DynStat.Sens(5),DynStat.Lust(15)][1],[DynStat.Inte(-1),DynStat.Sens(5),DynStat.Lust(15)][2],[DynStat.Inte(-1),DynStat.Sens(5),DynStat.Lust(15)][3],[DynStat.Inte(-1),DynStat.Sens(5),DynStat.Lust(15)][4]);
               }
               else if(int([DynStat.Inte(-1),DynStat.Sens(5),DynStat.Lust(15)].length) == 6)
               {
                  get_game().player.dynStats([DynStat.Inte(-1),DynStat.Sens(5),DynStat.Lust(15)][0],[DynStat.Inte(-1),DynStat.Sens(5),DynStat.Lust(15)][1],[DynStat.Inte(-1),DynStat.Sens(5),DynStat.Lust(15)][2],[DynStat.Inte(-1),DynStat.Sens(5),DynStat.Lust(15)][3],[DynStat.Inte(-1),DynStat.Sens(5),DynStat.Lust(15)][4],[DynStat.Inte(-1),DynStat.Sens(5),DynStat.Lust(15)][5]);
               }
               else if(int([DynStat.Inte(-1),DynStat.Sens(5),DynStat.Lust(15)].length) == 7)
               {
                  get_game().player.dynStats([DynStat.Inte(-1),DynStat.Sens(5),DynStat.Lust(15)][0],[DynStat.Inte(-1),DynStat.Sens(5),DynStat.Lust(15)][1],[DynStat.Inte(-1),DynStat.Sens(5),DynStat.Lust(15)][2],[DynStat.Inte(-1),DynStat.Sens(5),DynStat.Lust(15)][3],[DynStat.Inte(-1),DynStat.Sens(5),DynStat.Lust(15)][4],[DynStat.Inte(-1),DynStat.Sens(5),DynStat.Lust(15)][5],[DynStat.Inte(-1),DynStat.Sens(5),DynStat.Lust(15)][6]);
               }
               else if(int([DynStat.Inte(-1),DynStat.Sens(5),DynStat.Lust(15)].length) == 8)
               {
                  get_game().player.dynStats([DynStat.Inte(-1),DynStat.Sens(5),DynStat.Lust(15)][0],[DynStat.Inte(-1),DynStat.Sens(5),DynStat.Lust(15)][1],[DynStat.Inte(-1),DynStat.Sens(5),DynStat.Lust(15)][2],[DynStat.Inte(-1),DynStat.Sens(5),DynStat.Lust(15)][3],[DynStat.Inte(-1),DynStat.Sens(5),DynStat.Lust(15)][4],[DynStat.Inte(-1),DynStat.Sens(5),DynStat.Lust(15)][5],[DynStat.Inte(-1),DynStat.Sens(5),DynStat.Lust(15)][6],[DynStat.Inte(-1),DynStat.Sens(5),DynStat.Lust(15)][7]);
               }
               else if(int([DynStat.Inte(-1),DynStat.Sens(5),DynStat.Lust(15)].length) == 9)
               {
                  get_game().player.dynStats([DynStat.Inte(-1),DynStat.Sens(5),DynStat.Lust(15)][0],[DynStat.Inte(-1),DynStat.Sens(5),DynStat.Lust(15)][1],[DynStat.Inte(-1),DynStat.Sens(5),DynStat.Lust(15)][2],[DynStat.Inte(-1),DynStat.Sens(5),DynStat.Lust(15)][3],[DynStat.Inte(-1),DynStat.Sens(5),DynStat.Lust(15)][4],[DynStat.Inte(-1),DynStat.Sens(5),DynStat.Lust(15)][5],[DynStat.Inte(-1),DynStat.Sens(5),DynStat.Lust(15)][6],[DynStat.Inte(-1),DynStat.Sens(5),DynStat.Lust(15)][7],[DynStat.Inte(-1),DynStat.Sens(5),DynStat.Lust(15)][8]);
               }
               else if(int([DynStat.Inte(-1),DynStat.Sens(5),DynStat.Lust(15)].length) == 10)
               {
                  get_game().player.dynStats([DynStat.Inte(-1),DynStat.Sens(5),DynStat.Lust(15)][0],[DynStat.Inte(-1),DynStat.Sens(5),DynStat.Lust(15)][1],[DynStat.Inte(-1),DynStat.Sens(5),DynStat.Lust(15)][2],[DynStat.Inte(-1),DynStat.Sens(5),DynStat.Lust(15)][3],[DynStat.Inte(-1),DynStat.Sens(5),DynStat.Lust(15)][4],[DynStat.Inte(-1),DynStat.Sens(5),DynStat.Lust(15)][5],[DynStat.Inte(-1),DynStat.Sens(5),DynStat.Lust(15)][6],[DynStat.Inte(-1),DynStat.Sens(5),DynStat.Lust(15)][7],[DynStat.Inte(-1),DynStat.Sens(5),DynStat.Lust(15)][8],[DynStat.Inte(-1),DynStat.Sens(5),DynStat.Lust(15)][9]);
               }
               else if(int([DynStat.Inte(-1),DynStat.Sens(5),DynStat.Lust(15)].length) == 11)
               {
                  get_game().player.dynStats([DynStat.Inte(-1),DynStat.Sens(5),DynStat.Lust(15)][0],[DynStat.Inte(-1),DynStat.Sens(5),DynStat.Lust(15)][1],[DynStat.Inte(-1),DynStat.Sens(5),DynStat.Lust(15)][2],[DynStat.Inte(-1),DynStat.Sens(5),DynStat.Lust(15)][3],[DynStat.Inte(-1),DynStat.Sens(5),DynStat.Lust(15)][4],[DynStat.Inte(-1),DynStat.Sens(5),DynStat.Lust(15)][5],[DynStat.Inte(-1),DynStat.Sens(5),DynStat.Lust(15)][6],[DynStat.Inte(-1),DynStat.Sens(5),DynStat.Lust(15)][7],[DynStat.Inte(-1),DynStat.Sens(5),DynStat.Lust(15)][8],[DynStat.Inte(-1),DynStat.Sens(5),DynStat.Lust(15)][9],[DynStat.Inte(-1),DynStat.Sens(5),DynStat.Lust(15)][10]);
               }
               else if(int([DynStat.Inte(-1),DynStat.Sens(5),DynStat.Lust(15)].length) == 12)
               {
                  get_game().player.dynStats([DynStat.Inte(-1),DynStat.Sens(5),DynStat.Lust(15)][0],[DynStat.Inte(-1),DynStat.Sens(5),DynStat.Lust(15)][1],[DynStat.Inte(-1),DynStat.Sens(5),DynStat.Lust(15)][2],[DynStat.Inte(-1),DynStat.Sens(5),DynStat.Lust(15)][3],[DynStat.Inte(-1),DynStat.Sens(5),DynStat.Lust(15)][4],[DynStat.Inte(-1),DynStat.Sens(5),DynStat.Lust(15)][5],[DynStat.Inte(-1),DynStat.Sens(5),DynStat.Lust(15)][6],[DynStat.Inte(-1),DynStat.Sens(5),DynStat.Lust(15)][7],[DynStat.Inte(-1),DynStat.Sens(5),DynStat.Lust(15)][8],[DynStat.Inte(-1),DynStat.Sens(5),DynStat.Lust(15)][9],[DynStat.Inte(-1),DynStat.Sens(5),DynStat.Lust(15)][10],[DynStat.Inte(-1),DynStat.Sens(5),DynStat.Lust(15)][11]);
               }
               else if(int([DynStat.Inte(-1),DynStat.Sens(5),DynStat.Lust(15)].length) == 13)
               {
                  get_game().player.dynStats([DynStat.Inte(-1),DynStat.Sens(5),DynStat.Lust(15)][0],[DynStat.Inte(-1),DynStat.Sens(5),DynStat.Lust(15)][1],[DynStat.Inte(-1),DynStat.Sens(5),DynStat.Lust(15)][2],[DynStat.Inte(-1),DynStat.Sens(5),DynStat.Lust(15)][3],[DynStat.Inte(-1),DynStat.Sens(5),DynStat.Lust(15)][4],[DynStat.Inte(-1),DynStat.Sens(5),DynStat.Lust(15)][5],[DynStat.Inte(-1),DynStat.Sens(5),DynStat.Lust(15)][6],[DynStat.Inte(-1),DynStat.Sens(5),DynStat.Lust(15)][7],[DynStat.Inte(-1),DynStat.Sens(5),DynStat.Lust(15)][8],[DynStat.Inte(-1),DynStat.Sens(5),DynStat.Lust(15)][9],[DynStat.Inte(-1),DynStat.Sens(5),DynStat.Lust(15)][10],[DynStat.Inte(-1),DynStat.Sens(5),DynStat.Lust(15)][11],[DynStat.Inte(-1),DynStat.Sens(5),DynStat.Lust(15)][12]);
               }
               else if(int([DynStat.Inte(-1),DynStat.Sens(5),DynStat.Lust(15)].length) == 14)
               {
                  get_game().player.dynStats([DynStat.Inte(-1),DynStat.Sens(5),DynStat.Lust(15)][0],[DynStat.Inte(-1),DynStat.Sens(5),DynStat.Lust(15)][1],[DynStat.Inte(-1),DynStat.Sens(5),DynStat.Lust(15)][2],[DynStat.Inte(-1),DynStat.Sens(5),DynStat.Lust(15)][3],[DynStat.Inte(-1),DynStat.Sens(5),DynStat.Lust(15)][4],[DynStat.Inte(-1),DynStat.Sens(5),DynStat.Lust(15)][5],[DynStat.Inte(-1),DynStat.Sens(5),DynStat.Lust(15)][6],[DynStat.Inte(-1),DynStat.Sens(5),DynStat.Lust(15)][7],[DynStat.Inte(-1),DynStat.Sens(5),DynStat.Lust(15)][8],[DynStat.Inte(-1),DynStat.Sens(5),DynStat.Lust(15)][9],[DynStat.Inte(-1),DynStat.Sens(5),DynStat.Lust(15)][10],[DynStat.Inte(-1),DynStat.Sens(5),DynStat.Lust(15)][11],[DynStat.Inte(-1),DynStat.Sens(5),DynStat.Lust(15)][12],[DynStat.Inte(-1),DynStat.Sens(5),DynStat.Lust(15)][13]);
               }
               else if(int([DynStat.Inte(-1),DynStat.Sens(5),DynStat.Lust(15)].length) == 15)
               {
                  get_game().player.dynStats([DynStat.Inte(-1),DynStat.Sens(5),DynStat.Lust(15)][0],[DynStat.Inte(-1),DynStat.Sens(5),DynStat.Lust(15)][1],[DynStat.Inte(-1),DynStat.Sens(5),DynStat.Lust(15)][2],[DynStat.Inte(-1),DynStat.Sens(5),DynStat.Lust(15)][3],[DynStat.Inte(-1),DynStat.Sens(5),DynStat.Lust(15)][4],[DynStat.Inte(-1),DynStat.Sens(5),DynStat.Lust(15)][5],[DynStat.Inte(-1),DynStat.Sens(5),DynStat.Lust(15)][6],[DynStat.Inte(-1),DynStat.Sens(5),DynStat.Lust(15)][7],[DynStat.Inte(-1),DynStat.Sens(5),DynStat.Lust(15)][8],[DynStat.Inte(-1),DynStat.Sens(5),DynStat.Lust(15)][9],[DynStat.Inte(-1),DynStat.Sens(5),DynStat.Lust(15)][10],[DynStat.Inte(-1),DynStat.Sens(5),DynStat.Lust(15)][11],[DynStat.Inte(-1),DynStat.Sens(5),DynStat.Lust(15)][12],[DynStat.Inte(-1),DynStat.Sens(5),DynStat.Lust(15)][13],[DynStat.Inte(-1),DynStat.Sens(5),DynStat.Lust(15)][14]);
               }
               else if(int([DynStat.Inte(-1),DynStat.Sens(5),DynStat.Lust(15)].length) == 16)
               {
                  get_game().player.dynStats([DynStat.Inte(-1),DynStat.Sens(5),DynStat.Lust(15)][0],[DynStat.Inte(-1),DynStat.Sens(5),DynStat.Lust(15)][1],[DynStat.Inte(-1),DynStat.Sens(5),DynStat.Lust(15)][2],[DynStat.Inte(-1),DynStat.Sens(5),DynStat.Lust(15)][3],[DynStat.Inte(-1),DynStat.Sens(5),DynStat.Lust(15)][4],[DynStat.Inte(-1),DynStat.Sens(5),DynStat.Lust(15)][5],[DynStat.Inte(-1),DynStat.Sens(5),DynStat.Lust(15)][6],[DynStat.Inte(-1),DynStat.Sens(5),DynStat.Lust(15)][7],[DynStat.Inte(-1),DynStat.Sens(5),DynStat.Lust(15)][8],[DynStat.Inte(-1),DynStat.Sens(5),DynStat.Lust(15)][9],[DynStat.Inte(-1),DynStat.Sens(5),DynStat.Lust(15)][10],[DynStat.Inte(-1),DynStat.Sens(5),DynStat.Lust(15)][11],[DynStat.Inte(-1),DynStat.Sens(5),DynStat.Lust(15)][12],[DynStat.Inte(-1),DynStat.Sens(5),DynStat.Lust(15)][13],[DynStat.Inte(-1),DynStat.Sens(5),DynStat.Lust(15)][14],[DynStat.Inte(-1),DynStat.Sens(5),DynStat.Lust(15)][15]);
               }
               else if(int([DynStat.Inte(-1),DynStat.Sens(5),DynStat.Lust(15)].length) == 17)
               {
                  get_game().player.dynStats([DynStat.Inte(-1),DynStat.Sens(5),DynStat.Lust(15)][0],[DynStat.Inte(-1),DynStat.Sens(5),DynStat.Lust(15)][1],[DynStat.Inte(-1),DynStat.Sens(5),DynStat.Lust(15)][2],[DynStat.Inte(-1),DynStat.Sens(5),DynStat.Lust(15)][3],[DynStat.Inte(-1),DynStat.Sens(5),DynStat.Lust(15)][4],[DynStat.Inte(-1),DynStat.Sens(5),DynStat.Lust(15)][5],[DynStat.Inte(-1),DynStat.Sens(5),DynStat.Lust(15)][6],[DynStat.Inte(-1),DynStat.Sens(5),DynStat.Lust(15)][7],[DynStat.Inte(-1),DynStat.Sens(5),DynStat.Lust(15)][8],[DynStat.Inte(-1),DynStat.Sens(5),DynStat.Lust(15)][9],[DynStat.Inte(-1),DynStat.Sens(5),DynStat.Lust(15)][10],[DynStat.Inte(-1),DynStat.Sens(5),DynStat.Lust(15)][11],[DynStat.Inte(-1),DynStat.Sens(5),DynStat.Lust(15)][12],[DynStat.Inte(-1),DynStat.Sens(5),DynStat.Lust(15)][13],[DynStat.Inte(-1),DynStat.Sens(5),DynStat.Lust(15)][14],[DynStat.Inte(-1),DynStat.Sens(5),DynStat.Lust(15)][15],[DynStat.Inte(-1),DynStat.Sens(5),DynStat.Lust(15)][16]);
               }
               else if(int([DynStat.Inte(-1),DynStat.Sens(5),DynStat.Lust(15)].length) == 18)
               {
                  get_game().player.dynStats([DynStat.Inte(-1),DynStat.Sens(5),DynStat.Lust(15)][0],[DynStat.Inte(-1),DynStat.Sens(5),DynStat.Lust(15)][1],[DynStat.Inte(-1),DynStat.Sens(5),DynStat.Lust(15)][2],[DynStat.Inte(-1),DynStat.Sens(5),DynStat.Lust(15)][3],[DynStat.Inte(-1),DynStat.Sens(5),DynStat.Lust(15)][4],[DynStat.Inte(-1),DynStat.Sens(5),DynStat.Lust(15)][5],[DynStat.Inte(-1),DynStat.Sens(5),DynStat.Lust(15)][6],[DynStat.Inte(-1),DynStat.Sens(5),DynStat.Lust(15)][7],[DynStat.Inte(-1),DynStat.Sens(5),DynStat.Lust(15)][8],[DynStat.Inte(-1),DynStat.Sens(5),DynStat.Lust(15)][9],[DynStat.Inte(-1),DynStat.Sens(5),DynStat.Lust(15)][10],[DynStat.Inte(-1),DynStat.Sens(5),DynStat.Lust(15)][11],[DynStat.Inte(-1),DynStat.Sens(5),DynStat.Lust(15)][12],[DynStat.Inte(-1),DynStat.Sens(5),DynStat.Lust(15)][13],[DynStat.Inte(-1),DynStat.Sens(5),DynStat.Lust(15)][14],[DynStat.Inte(-1),DynStat.Sens(5),DynStat.Lust(15)][15],[DynStat.Inte(-1),DynStat.Sens(5),DynStat.Lust(15)][16],[DynStat.Inte(-1),DynStat.Sens(5)
                  ,DynStat.Lust(15)][17]);
               }
               else if(int([DynStat.Inte(-1),DynStat.Sens(5),DynStat.Lust(15)].length) == 19)
               {
                  get_game().player.dynStats([DynStat.Inte(-1),DynStat.Sens(5),DynStat.Lust(15)][0],[DynStat.Inte(-1),DynStat.Sens(5),DynStat.Lust(15)][1],[DynStat.Inte(-1),DynStat.Sens(5),DynStat.Lust(15)][2],[DynStat.Inte(-1),DynStat.Sens(5),DynStat.Lust(15)][3],[DynStat.Inte(-1),DynStat.Sens(5),DynStat.Lust(15)][4],[DynStat.Inte(-1),DynStat.Sens(5),DynStat.Lust(15)][5],[DynStat.Inte(-1),DynStat.Sens(5),DynStat.Lust(15)][6],[DynStat.Inte(-1),DynStat.Sens(5),DynStat.Lust(15)][7],[DynStat.Inte(-1),DynStat.Sens(5),DynStat.Lust(15)][8],[DynStat.Inte(-1),DynStat.Sens(5),DynStat.Lust(15)][9],[DynStat.Inte(-1),DynStat.Sens(5),DynStat.Lust(15)][10],[DynStat.Inte(-1),DynStat.Sens(5),DynStat.Lust(15)][11],[DynStat.Inte(-1),DynStat.Sens(5),DynStat.Lust(15)][12],[DynStat.Inte(-1),DynStat.Sens(5),DynStat.Lust(15)][13],[DynStat.Inte(-1),DynStat.Sens(5),DynStat.Lust(15)][14],[DynStat.Inte(-1),DynStat.Sens(5),DynStat.Lust(15)][15],[DynStat.Inte(-1),DynStat.Sens(5),DynStat.Lust(15)][16],[DynStat.Inte(-1),DynStat.Sens(5)
                  ,DynStat.Lust(15)][17],[DynStat.Inte(-1),DynStat.Sens(5),DynStat.Lust(15)][18]);
               }
               else
               {
                  if(int([DynStat.Inte(-1),DynStat.Sens(5),DynStat.Lust(15)].length) != 20)
                  {
                     throw "Too many rest arguments";
                  }
                  get_game().player.dynStats([DynStat.Inte(-1),DynStat.Sens(5),DynStat.Lust(15)][0],[DynStat.Inte(-1),DynStat.Sens(5),DynStat.Lust(15)][1],[DynStat.Inte(-1),DynStat.Sens(5),DynStat.Lust(15)][2],[DynStat.Inte(-1),DynStat.Sens(5),DynStat.Lust(15)][3],[DynStat.Inte(-1),DynStat.Sens(5),DynStat.Lust(15)][4],[DynStat.Inte(-1),DynStat.Sens(5),DynStat.Lust(15)][5],[DynStat.Inte(-1),DynStat.Sens(5),DynStat.Lust(15)][6],[DynStat.Inte(-1),DynStat.Sens(5),DynStat.Lust(15)][7],[DynStat.Inte(-1),DynStat.Sens(5),DynStat.Lust(15)][8],[DynStat.Inte(-1),DynStat.Sens(5),DynStat.Lust(15)][9],[DynStat.Inte(-1),DynStat.Sens(5),DynStat.Lust(15)][10],[DynStat.Inte(-1),DynStat.Sens(5),DynStat.Lust(15)][11],[DynStat.Inte(-1),DynStat.Sens(5),DynStat.Lust(15)][12],[DynStat.Inte(-1),DynStat.Sens(5),DynStat.Lust(15)][13],[DynStat.Inte(-1),DynStat.Sens(5),DynStat.Lust(15)][14],[DynStat.Inte(-1),DynStat.Sens(5),DynStat.Lust(15)][15],[DynStat.Inte(-1),DynStat.Sens(5),DynStat.Lust(15)][16],[DynStat.Inte(-1),DynStat.Sens(5)
                  ,DynStat.Lust(15)][17],[DynStat.Inte(-1),DynStat.Sens(5),DynStat.Lust(15)][18],[DynStat.Inte(-1),DynStat.Sens(5),DynStat.Lust(15)][19]);
               }
               outputText("</b>[pg]");
               _loc1_ = true;
            }
            if(get_player().cocks[0].cockLength < 8)
            {
               outputText("<b>随着时间的推移，你的肉棒充血膨胀，一直长到8英寸长。你真的无法控制你的老二。</b>[pg]");
               get_player().cocks[0].cockLength = 8;
               if(get_player().cocks[0].cockThickness < 2)
               {
                  get_player().cocks[0].cockThickness = 2;
               }
               _loc1_ = true;
            }
            if(get_player().balls == 0)
            {
               outputText("<b>随着时间的推移，你下半身的压力加剧到了近乎痛苦的程度。[eachcock]下方的皮肤变得松弛下垂，接着两颗睾丸滚落下来，填满了你的阴囊。</b>[pg]");
               get_player().balls = 2;
               get_player().ballSize = 3;
               _loc1_ = true;
            }
            if(get_player().breastRows[0].breastRating < 5)
            {
               get_player().breastRows[0].breastRating = 5;
               if(get_player().hasPerk(PerkLib.FutaFaculties))
               {
                  outputText("<b>你的奶子再次变得丰满挺拔。既然你的乳房又变回了又大又胀的肉球，你现在可以好好享受一番了！</b>[pg]");
               }
               else
               {
                  outputText("<b>你的[breasts]恢复了以前那种荡妇般的尺寸。看起来你将永远被这对巨大、敏感的乳房困扰了，但至少这能帮你把敌人挑逗到屈服！</b>[pg]");
               }
               if(int([DynStat.Inte(-1),DynStat.Lust(15)].length) == 0)
               {
                  get_game().player.dynStats();
               }
               else if(int([DynStat.Inte(-1),DynStat.Lust(15)].length) == 1)
               {
                  get_game().player.dynStats([DynStat.Inte(-1),DynStat.Lust(15)][0]);
               }
               else if(int([DynStat.Inte(-1),DynStat.Lust(15)].length) == 2)
               {
                  get_game().player.dynStats([DynStat.Inte(-1),DynStat.Lust(15)][0],[DynStat.Inte(-1),DynStat.Lust(15)][1]);
               }
               else if(int([DynStat.Inte(-1),DynStat.Lust(15)].length) == 3)
               {
                  get_game().player.dynStats([DynStat.Inte(-1),DynStat.Lust(15)][0],[DynStat.Inte(-1),DynStat.Lust(15)][1],[DynStat.Inte(-1),DynStat.Lust(15)][2]);
               }
               else if(int([DynStat.Inte(-1),DynStat.Lust(15)].length) == 4)
               {
                  get_game().player.dynStats([DynStat.Inte(-1),DynStat.Lust(15)][0],[DynStat.Inte(-1),DynStat.Lust(15)][1],[DynStat.Inte(-1),DynStat.Lust(15)][2],[DynStat.Inte(-1),DynStat.Lust(15)][3]);
               }
               else if(int([DynStat.Inte(-1),DynStat.Lust(15)].length) == 5)
               {
                  get_game().player.dynStats([DynStat.Inte(-1),DynStat.Lust(15)][0],[DynStat.Inte(-1),DynStat.Lust(15)][1],[DynStat.Inte(-1),DynStat.Lust(15)][2],[DynStat.Inte(-1),DynStat.Lust(15)][3],[DynStat.Inte(-1),DynStat.Lust(15)][4]);
               }
               else if(int([DynStat.Inte(-1),DynStat.Lust(15)].length) == 6)
               {
                  get_game().player.dynStats([DynStat.Inte(-1),DynStat.Lust(15)][0],[DynStat.Inte(-1),DynStat.Lust(15)][1],[DynStat.Inte(-1),DynStat.Lust(15)][2],[DynStat.Inte(-1),DynStat.Lust(15)][3],[DynStat.Inte(-1),DynStat.Lust(15)][4],[DynStat.Inte(-1),DynStat.Lust(15)][5]);
               }
               else if(int([DynStat.Inte(-1),DynStat.Lust(15)].length) == 7)
               {
                  get_game().player.dynStats([DynStat.Inte(-1),DynStat.Lust(15)][0],[DynStat.Inte(-1),DynStat.Lust(15)][1],[DynStat.Inte(-1),DynStat.Lust(15)][2],[DynStat.Inte(-1),DynStat.Lust(15)][3],[DynStat.Inte(-1),DynStat.Lust(15)][4],[DynStat.Inte(-1),DynStat.Lust(15)][5],[DynStat.Inte(-1),DynStat.Lust(15)][6]);
               }
               else if(int([DynStat.Inte(-1),DynStat.Lust(15)].length) == 8)
               {
                  get_game().player.dynStats([DynStat.Inte(-1),DynStat.Lust(15)][0],[DynStat.Inte(-1),DynStat.Lust(15)][1],[DynStat.Inte(-1),DynStat.Lust(15)][2],[DynStat.Inte(-1),DynStat.Lust(15)][3],[DynStat.Inte(-1),DynStat.Lust(15)][4],[DynStat.Inte(-1),DynStat.Lust(15)][5],[DynStat.Inte(-1),DynStat.Lust(15)][6],[DynStat.Inte(-1),DynStat.Lust(15)][7]);
               }
               else if(int([DynStat.Inte(-1),DynStat.Lust(15)].length) == 9)
               {
                  get_game().player.dynStats([DynStat.Inte(-1),DynStat.Lust(15)][0],[DynStat.Inte(-1),DynStat.Lust(15)][1],[DynStat.Inte(-1),DynStat.Lust(15)][2],[DynStat.Inte(-1),DynStat.Lust(15)][3],[DynStat.Inte(-1),DynStat.Lust(15)][4],[DynStat.Inte(-1),DynStat.Lust(15)][5],[DynStat.Inte(-1),DynStat.Lust(15)][6],[DynStat.Inte(-1),DynStat.Lust(15)][7],[DynStat.Inte(-1),DynStat.Lust(15)][8]);
               }
               else if(int([DynStat.Inte(-1),DynStat.Lust(15)].length) == 10)
               {
                  get_game().player.dynStats([DynStat.Inte(-1),DynStat.Lust(15)][0],[DynStat.Inte(-1),DynStat.Lust(15)][1],[DynStat.Inte(-1),DynStat.Lust(15)][2],[DynStat.Inte(-1),DynStat.Lust(15)][3],[DynStat.Inte(-1),DynStat.Lust(15)][4],[DynStat.Inte(-1),DynStat.Lust(15)][5],[DynStat.Inte(-1),DynStat.Lust(15)][6],[DynStat.Inte(-1),DynStat.Lust(15)][7],[DynStat.Inte(-1),DynStat.Lust(15)][8],[DynStat.Inte(-1),DynStat.Lust(15)][9]);
               }
               else if(int([DynStat.Inte(-1),DynStat.Lust(15)].length) == 11)
               {
                  get_game().player.dynStats([DynStat.Inte(-1),DynStat.Lust(15)][0],[DynStat.Inte(-1),DynStat.Lust(15)][1],[DynStat.Inte(-1),DynStat.Lust(15)][2],[DynStat.Inte(-1),DynStat.Lust(15)][3],[DynStat.Inte(-1),DynStat.Lust(15)][4],[DynStat.Inte(-1),DynStat.Lust(15)][5],[DynStat.Inte(-1),DynStat.Lust(15)][6],[DynStat.Inte(-1),DynStat.Lust(15)][7],[DynStat.Inte(-1),DynStat.Lust(15)][8],[DynStat.Inte(-1),DynStat.Lust(15)][9],[DynStat.Inte(-1),DynStat.Lust(15)][10]);
               }
               else if(int([DynStat.Inte(-1),DynStat.Lust(15)].length) == 12)
               {
                  get_game().player.dynStats([DynStat.Inte(-1),DynStat.Lust(15)][0],[DynStat.Inte(-1),DynStat.Lust(15)][1],[DynStat.Inte(-1),DynStat.Lust(15)][2],[DynStat.Inte(-1),DynStat.Lust(15)][3],[DynStat.Inte(-1),DynStat.Lust(15)][4],[DynStat.Inte(-1),DynStat.Lust(15)][5],[DynStat.Inte(-1),DynStat.Lust(15)][6],[DynStat.Inte(-1),DynStat.Lust(15)][7],[DynStat.Inte(-1),DynStat.Lust(15)][8],[DynStat.Inte(-1),DynStat.Lust(15)][9],[DynStat.Inte(-1),DynStat.Lust(15)][10],[DynStat.Inte(-1),DynStat.Lust(15)][11]);
               }
               else if(int([DynStat.Inte(-1),DynStat.Lust(15)].length) == 13)
               {
                  get_game().player.dynStats([DynStat.Inte(-1),DynStat.Lust(15)][0],[DynStat.Inte(-1),DynStat.Lust(15)][1],[DynStat.Inte(-1),DynStat.Lust(15)][2],[DynStat.Inte(-1),DynStat.Lust(15)][3],[DynStat.Inte(-1),DynStat.Lust(15)][4],[DynStat.Inte(-1),DynStat.Lust(15)][5],[DynStat.Inte(-1),DynStat.Lust(15)][6],[DynStat.Inte(-1),DynStat.Lust(15)][7],[DynStat.Inte(-1),DynStat.Lust(15)][8],[DynStat.Inte(-1),DynStat.Lust(15)][9],[DynStat.Inte(-1),DynStat.Lust(15)][10],[DynStat.Inte(-1),DynStat.Lust(15)][11],[DynStat.Inte(-1),DynStat.Lust(15)][12]);
               }
               else if(int([DynStat.Inte(-1),DynStat.Lust(15)].length) == 14)
               {
                  get_game().player.dynStats([DynStat.Inte(-1),DynStat.Lust(15)][0],[DynStat.Inte(-1),DynStat.Lust(15)][1],[DynStat.Inte(-1),DynStat.Lust(15)][2],[DynStat.Inte(-1),DynStat.Lust(15)][3],[DynStat.Inte(-1),DynStat.Lust(15)][4],[DynStat.Inte(-1),DynStat.Lust(15)][5],[DynStat.Inte(-1),DynStat.Lust(15)][6],[DynStat.Inte(-1),DynStat.Lust(15)][7],[DynStat.Inte(-1),DynStat.Lust(15)][8],[DynStat.Inte(-1),DynStat.Lust(15)][9],[DynStat.Inte(-1),DynStat.Lust(15)][10],[DynStat.Inte(-1),DynStat.Lust(15)][11],[DynStat.Inte(-1),DynStat.Lust(15)][12],[DynStat.Inte(-1),DynStat.Lust(15)][13]);
               }
               else if(int([DynStat.Inte(-1),DynStat.Lust(15)].length) == 15)
               {
                  get_game().player.dynStats([DynStat.Inte(-1),DynStat.Lust(15)][0],[DynStat.Inte(-1),DynStat.Lust(15)][1],[DynStat.Inte(-1),DynStat.Lust(15)][2],[DynStat.Inte(-1),DynStat.Lust(15)][3],[DynStat.Inte(-1),DynStat.Lust(15)][4],[DynStat.Inte(-1),DynStat.Lust(15)][5],[DynStat.Inte(-1),DynStat.Lust(15)][6],[DynStat.Inte(-1),DynStat.Lust(15)][7],[DynStat.Inte(-1),DynStat.Lust(15)][8],[DynStat.Inte(-1),DynStat.Lust(15)][9],[DynStat.Inte(-1),DynStat.Lust(15)][10],[DynStat.Inte(-1),DynStat.Lust(15)][11],[DynStat.Inte(-1),DynStat.Lust(15)][12],[DynStat.Inte(-1),DynStat.Lust(15)][13],[DynStat.Inte(-1),DynStat.Lust(15)][14]);
               }
               else if(int([DynStat.Inte(-1),DynStat.Lust(15)].length) == 16)
               {
                  get_game().player.dynStats([DynStat.Inte(-1),DynStat.Lust(15)][0],[DynStat.Inte(-1),DynStat.Lust(15)][1],[DynStat.Inte(-1),DynStat.Lust(15)][2],[DynStat.Inte(-1),DynStat.Lust(15)][3],[DynStat.Inte(-1),DynStat.Lust(15)][4],[DynStat.Inte(-1),DynStat.Lust(15)][5],[DynStat.Inte(-1),DynStat.Lust(15)][6],[DynStat.Inte(-1),DynStat.Lust(15)][7],[DynStat.Inte(-1),DynStat.Lust(15)][8],[DynStat.Inte(-1),DynStat.Lust(15)][9],[DynStat.Inte(-1),DynStat.Lust(15)][10],[DynStat.Inte(-1),DynStat.Lust(15)][11],[DynStat.Inte(-1),DynStat.Lust(15)][12],[DynStat.Inte(-1),DynStat.Lust(15)][13],[DynStat.Inte(-1),DynStat.Lust(15)][14],[DynStat.Inte(-1),DynStat.Lust(15)][15]);
               }
               else if(int([DynStat.Inte(-1),DynStat.Lust(15)].length) == 17)
               {
                  get_game().player.dynStats([DynStat.Inte(-1),DynStat.Lust(15)][0],[DynStat.Inte(-1),DynStat.Lust(15)][1],[DynStat.Inte(-1),DynStat.Lust(15)][2],[DynStat.Inte(-1),DynStat.Lust(15)][3],[DynStat.Inte(-1),DynStat.Lust(15)][4],[DynStat.Inte(-1),DynStat.Lust(15)][5],[DynStat.Inte(-1),DynStat.Lust(15)][6],[DynStat.Inte(-1),DynStat.Lust(15)][7],[DynStat.Inte(-1),DynStat.Lust(15)][8],[DynStat.Inte(-1),DynStat.Lust(15)][9],[DynStat.Inte(-1),DynStat.Lust(15)][10],[DynStat.Inte(-1),DynStat.Lust(15)][11],[DynStat.Inte(-1),DynStat.Lust(15)][12],[DynStat.Inte(-1),DynStat.Lust(15)][13],[DynStat.Inte(-1),DynStat.Lust(15)][14],[DynStat.Inte(-1),DynStat.Lust(15)][15],[DynStat.Inte(-1),DynStat.Lust(15)][16]);
               }
               else if(int([DynStat.Inte(-1),DynStat.Lust(15)].length) == 18)
               {
                  get_game().player.dynStats([DynStat.Inte(-1),DynStat.Lust(15)][0],[DynStat.Inte(-1),DynStat.Lust(15)][1],[DynStat.Inte(-1),DynStat.Lust(15)][2],[DynStat.Inte(-1),DynStat.Lust(15)][3],[DynStat.Inte(-1),DynStat.Lust(15)][4],[DynStat.Inte(-1),DynStat.Lust(15)][5],[DynStat.Inte(-1),DynStat.Lust(15)][6],[DynStat.Inte(-1),DynStat.Lust(15)][7],[DynStat.Inte(-1),DynStat.Lust(15)][8],[DynStat.Inte(-1),DynStat.Lust(15)][9],[DynStat.Inte(-1),DynStat.Lust(15)][10],[DynStat.Inte(-1),DynStat.Lust(15)][11],[DynStat.Inte(-1),DynStat.Lust(15)][12],[DynStat.Inte(-1),DynStat.Lust(15)][13],[DynStat.Inte(-1),DynStat.Lust(15)][14],[DynStat.Inte(-1),DynStat.Lust(15)][15],[DynStat.Inte(-1),DynStat.Lust(15)][16],[DynStat.Inte(-1),DynStat.Lust(15)][17]);
               }
               else if(int([DynStat.Inte(-1),DynStat.Lust(15)].length) == 19)
               {
                  get_game().player.dynStats([DynStat.Inte(-1),DynStat.Lust(15)][0],[DynStat.Inte(-1),DynStat.Lust(15)][1],[DynStat.Inte(-1),DynStat.Lust(15)][2],[DynStat.Inte(-1),DynStat.Lust(15)][3],[DynStat.Inte(-1),DynStat.Lust(15)][4],[DynStat.Inte(-1),DynStat.Lust(15)][5],[DynStat.Inte(-1),DynStat.Lust(15)][6],[DynStat.Inte(-1),DynStat.Lust(15)][7],[DynStat.Inte(-1),DynStat.Lust(15)][8],[DynStat.Inte(-1),DynStat.Lust(15)][9],[DynStat.Inte(-1),DynStat.Lust(15)][10],[DynStat.Inte(-1),DynStat.Lust(15)][11],[DynStat.Inte(-1),DynStat.Lust(15)][12],[DynStat.Inte(-1),DynStat.Lust(15)][13],[DynStat.Inte(-1),DynStat.Lust(15)][14],[DynStat.Inte(-1),DynStat.Lust(15)][15],[DynStat.Inte(-1),DynStat.Lust(15)][16],[DynStat.Inte(-1),DynStat.Lust(15)][17],[DynStat.Inte(-1),DynStat.Lust(15)][18]);
               }
               else
               {
                  if(int([DynStat.Inte(-1),DynStat.Lust(15)].length) != 20)
                  {
                     throw "Too many rest arguments";
                  }
                  get_game().player.dynStats([DynStat.Inte(-1),DynStat.Lust(15)][0],[DynStat.Inte(-1),DynStat.Lust(15)][1],[DynStat.Inte(-1),DynStat.Lust(15)][2],[DynStat.Inte(-1),DynStat.Lust(15)][3],[DynStat.Inte(-1),DynStat.Lust(15)][4],[DynStat.Inte(-1),DynStat.Lust(15)][5],[DynStat.Inte(-1),DynStat.Lust(15)][6],[DynStat.Inte(-1),DynStat.Lust(15)][7],[DynStat.Inte(-1),DynStat.Lust(15)][8],[DynStat.Inte(-1),DynStat.Lust(15)][9],[DynStat.Inte(-1),DynStat.Lust(15)][10],[DynStat.Inte(-1),DynStat.Lust(15)][11],[DynStat.Inte(-1),DynStat.Lust(15)][12],[DynStat.Inte(-1),DynStat.Lust(15)][13],[DynStat.Inte(-1),DynStat.Lust(15)][14],[DynStat.Inte(-1),DynStat.Lust(15)][15],[DynStat.Inte(-1),DynStat.Lust(15)][16],[DynStat.Inte(-1),DynStat.Lust(15)][17],[DynStat.Inte(-1),DynStat.Lust(15)][18],[DynStat.Inte(-1),DynStat.Lust(15)][19]);
               }
               _loc1_ = true;
            }
            if(!get_player().hasVagina())
            {
               get_player().createVagina();
               if(get_player().hasPerk(PerkLib.FutaFaculties))
               {
                  outputText("<b>你的胯下感觉，好像有点痒痒的。该死！那里裂开了一条湿润的小缝，而且还一阵阵发麻！感觉太爽了，你以前为什么要把它弄没呢？</b>[pg]");
               }
               else
               {
                  outputText("<b>你的胯部刺痛了一秒钟，当你伸手去摸时，你的[legs]瘫软地折叠在身下。你长出了一个阴道——这该死的东西就是不肯消失，而且这次感觉敏感了两倍。操他妈的荡妇酒。</b>[pg]");
               }
               if(int([DynStat.Inte(-1),DynStat.Sens(10),DynStat.Lust(15)].length) == 0)
               {
                  get_game().player.dynStats();
               }
               else if(int([DynStat.Inte(-1),DynStat.Sens(10),DynStat.Lust(15)].length) == 1)
               {
                  get_game().player.dynStats([DynStat.Inte(-1),DynStat.Sens(10),DynStat.Lust(15)][0]);
               }
               else if(int([DynStat.Inte(-1),DynStat.Sens(10),DynStat.Lust(15)].length) == 2)
               {
                  get_game().player.dynStats([DynStat.Inte(-1),DynStat.Sens(10),DynStat.Lust(15)][0],[DynStat.Inte(-1),DynStat.Sens(10),DynStat.Lust(15)][1]);
               }
               else if(int([DynStat.Inte(-1),DynStat.Sens(10),DynStat.Lust(15)].length) == 3)
               {
                  get_game().player.dynStats([DynStat.Inte(-1),DynStat.Sens(10),DynStat.Lust(15)][0],[DynStat.Inte(-1),DynStat.Sens(10),DynStat.Lust(15)][1],[DynStat.Inte(-1),DynStat.Sens(10),DynStat.Lust(15)][2]);
               }
               else if(int([DynStat.Inte(-1),DynStat.Sens(10),DynStat.Lust(15)].length) == 4)
               {
                  get_game().player.dynStats([DynStat.Inte(-1),DynStat.Sens(10),DynStat.Lust(15)][0],[DynStat.Inte(-1),DynStat.Sens(10),DynStat.Lust(15)][1],[DynStat.Inte(-1),DynStat.Sens(10),DynStat.Lust(15)][2],[DynStat.Inte(-1),DynStat.Sens(10),DynStat.Lust(15)][3]);
               }
               else if(int([DynStat.Inte(-1),DynStat.Sens(10),DynStat.Lust(15)].length) == 5)
               {
                  get_game().player.dynStats([DynStat.Inte(-1),DynStat.Sens(10),DynStat.Lust(15)][0],[DynStat.Inte(-1),DynStat.Sens(10),DynStat.Lust(15)][1],[DynStat.Inte(-1),DynStat.Sens(10),DynStat.Lust(15)][2],[DynStat.Inte(-1),DynStat.Sens(10),DynStat.Lust(15)][3],[DynStat.Inte(-1),DynStat.Sens(10),DynStat.Lust(15)][4]);
               }
               else if(int([DynStat.Inte(-1),DynStat.Sens(10),DynStat.Lust(15)].length) == 6)
               {
                  get_game().player.dynStats([DynStat.Inte(-1),DynStat.Sens(10),DynStat.Lust(15)][0],[DynStat.Inte(-1),DynStat.Sens(10),DynStat.Lust(15)][1],[DynStat.Inte(-1),DynStat.Sens(10),DynStat.Lust(15)][2],[DynStat.Inte(-1),DynStat.Sens(10),DynStat.Lust(15)][3],[DynStat.Inte(-1),DynStat.Sens(10),DynStat.Lust(15)][4],[DynStat.Inte(-1),DynStat.Sens(10),DynStat.Lust(15)][5]);
               }
               else if(int([DynStat.Inte(-1),DynStat.Sens(10),DynStat.Lust(15)].length) == 7)
               {
                  get_game().player.dynStats([DynStat.Inte(-1),DynStat.Sens(10),DynStat.Lust(15)][0],[DynStat.Inte(-1),DynStat.Sens(10),DynStat.Lust(15)][1],[DynStat.Inte(-1),DynStat.Sens(10),DynStat.Lust(15)][2],[DynStat.Inte(-1),DynStat.Sens(10),DynStat.Lust(15)][3],[DynStat.Inte(-1),DynStat.Sens(10),DynStat.Lust(15)][4],[DynStat.Inte(-1),DynStat.Sens(10),DynStat.Lust(15)][5],[DynStat.Inte(-1),DynStat.Sens(10),DynStat.Lust(15)][6]);
               }
               else if(int([DynStat.Inte(-1),DynStat.Sens(10),DynStat.Lust(15)].length) == 8)
               {
                  get_game().player.dynStats([DynStat.Inte(-1),DynStat.Sens(10),DynStat.Lust(15)][0],[DynStat.Inte(-1),DynStat.Sens(10),DynStat.Lust(15)][1],[DynStat.Inte(-1),DynStat.Sens(10),DynStat.Lust(15)][2],[DynStat.Inte(-1),DynStat.Sens(10),DynStat.Lust(15)][3],[DynStat.Inte(-1),DynStat.Sens(10),DynStat.Lust(15)][4],[DynStat.Inte(-1),DynStat.Sens(10),DynStat.Lust(15)][5],[DynStat.Inte(-1),DynStat.Sens(10),DynStat.Lust(15)][6],[DynStat.Inte(-1),DynStat.Sens(10),DynStat.Lust(15)][7]);
               }
               else if(int([DynStat.Inte(-1),DynStat.Sens(10),DynStat.Lust(15)].length) == 9)
               {
                  get_game().player.dynStats([DynStat.Inte(-1),DynStat.Sens(10),DynStat.Lust(15)][0],[DynStat.Inte(-1),DynStat.Sens(10),DynStat.Lust(15)][1],[DynStat.Inte(-1),DynStat.Sens(10),DynStat.Lust(15)][2],[DynStat.Inte(-1),DynStat.Sens(10),DynStat.Lust(15)][3],[DynStat.Inte(-1),DynStat.Sens(10),DynStat.Lust(15)][4],[DynStat.Inte(-1),DynStat.Sens(10),DynStat.Lust(15)][5],[DynStat.Inte(-1),DynStat.Sens(10),DynStat.Lust(15)][6],[DynStat.Inte(-1),DynStat.Sens(10),DynStat.Lust(15)][7],[DynStat.Inte(-1),DynStat.Sens(10),DynStat.Lust(15)][8]);
               }
               else if(int([DynStat.Inte(-1),DynStat.Sens(10),DynStat.Lust(15)].length) == 10)
               {
                  get_game().player.dynStats([DynStat.Inte(-1),DynStat.Sens(10),DynStat.Lust(15)][0],[DynStat.Inte(-1),DynStat.Sens(10),DynStat.Lust(15)][1],[DynStat.Inte(-1),DynStat.Sens(10),DynStat.Lust(15)][2],[DynStat.Inte(-1),DynStat.Sens(10),DynStat.Lust(15)][3],[DynStat.Inte(-1),DynStat.Sens(10),DynStat.Lust(15)][4],[DynStat.Inte(-1),DynStat.Sens(10),DynStat.Lust(15)][5],[DynStat.Inte(-1),DynStat.Sens(10),DynStat.Lust(15)][6],[DynStat.Inte(-1),DynStat.Sens(10),DynStat.Lust(15)][7],[DynStat.Inte(-1),DynStat.Sens(10),DynStat.Lust(15)][8],[DynStat.Inte(-1),DynStat.Sens(10),DynStat.Lust(15)][9]);
               }
               else if(int([DynStat.Inte(-1),DynStat.Sens(10),DynStat.Lust(15)].length) == 11)
               {
                  get_game().player.dynStats([DynStat.Inte(-1),DynStat.Sens(10),DynStat.Lust(15)][0],[DynStat.Inte(-1),DynStat.Sens(10),DynStat.Lust(15)][1],[DynStat.Inte(-1),DynStat.Sens(10),DynStat.Lust(15)][2],[DynStat.Inte(-1),DynStat.Sens(10),DynStat.Lust(15)][3],[DynStat.Inte(-1),DynStat.Sens(10),DynStat.Lust(15)][4],[DynStat.Inte(-1),DynStat.Sens(10),DynStat.Lust(15)][5],[DynStat.Inte(-1),DynStat.Sens(10),DynStat.Lust(15)][6],[DynStat.Inte(-1),DynStat.Sens(10),DynStat.Lust(15)][7],[DynStat.Inte(-1),DynStat.Sens(10),DynStat.Lust(15)][8],[DynStat.Inte(-1),DynStat.Sens(10),DynStat.Lust(15)][9],[DynStat.Inte(-1),DynStat.Sens(10),DynStat.Lust(15)][10]);
               }
               else if(int([DynStat.Inte(-1),DynStat.Sens(10),DynStat.Lust(15)].length) == 12)
               {
                  get_game().player.dynStats([DynStat.Inte(-1),DynStat.Sens(10),DynStat.Lust(15)][0],[DynStat.Inte(-1),DynStat.Sens(10),DynStat.Lust(15)][1],[DynStat.Inte(-1),DynStat.Sens(10),DynStat.Lust(15)][2],[DynStat.Inte(-1),DynStat.Sens(10),DynStat.Lust(15)][3],[DynStat.Inte(-1),DynStat.Sens(10),DynStat.Lust(15)][4],[DynStat.Inte(-1),DynStat.Sens(10),DynStat.Lust(15)][5],[DynStat.Inte(-1),DynStat.Sens(10),DynStat.Lust(15)][6],[DynStat.Inte(-1),DynStat.Sens(10),DynStat.Lust(15)][7],[DynStat.Inte(-1),DynStat.Sens(10),DynStat.Lust(15)][8],[DynStat.Inte(-1),DynStat.Sens(10),DynStat.Lust(15)][9],[DynStat.Inte(-1),DynStat.Sens(10),DynStat.Lust(15)][10],[DynStat.Inte(-1),DynStat.Sens(10),DynStat.Lust(15)][11]);
               }
               else if(int([DynStat.Inte(-1),DynStat.Sens(10),DynStat.Lust(15)].length) == 13)
               {
                  get_game().player.dynStats([DynStat.Inte(-1),DynStat.Sens(10),DynStat.Lust(15)][0],[DynStat.Inte(-1),DynStat.Sens(10),DynStat.Lust(15)][1],[DynStat.Inte(-1),DynStat.Sens(10),DynStat.Lust(15)][2],[DynStat.Inte(-1),DynStat.Sens(10),DynStat.Lust(15)][3],[DynStat.Inte(-1),DynStat.Sens(10),DynStat.Lust(15)][4],[DynStat.Inte(-1),DynStat.Sens(10),DynStat.Lust(15)][5],[DynStat.Inte(-1),DynStat.Sens(10),DynStat.Lust(15)][6],[DynStat.Inte(-1),DynStat.Sens(10),DynStat.Lust(15)][7],[DynStat.Inte(-1),DynStat.Sens(10),DynStat.Lust(15)][8],[DynStat.Inte(-1),DynStat.Sens(10),DynStat.Lust(15)][9],[DynStat.Inte(-1),DynStat.Sens(10),DynStat.Lust(15)][10],[DynStat.Inte(-1),DynStat.Sens(10),DynStat.Lust(15)][11],[DynStat.Inte(-1),DynStat.Sens(10),DynStat.Lust(15)][12]);
               }
               else if(int([DynStat.Inte(-1),DynStat.Sens(10),DynStat.Lust(15)].length) == 14)
               {
                  get_game().player.dynStats([DynStat.Inte(-1),DynStat.Sens(10),DynStat.Lust(15)][0],[DynStat.Inte(-1),DynStat.Sens(10),DynStat.Lust(15)][1],[DynStat.Inte(-1),DynStat.Sens(10),DynStat.Lust(15)][2],[DynStat.Inte(-1),DynStat.Sens(10),DynStat.Lust(15)][3],[DynStat.Inte(-1),DynStat.Sens(10),DynStat.Lust(15)][4],[DynStat.Inte(-1),DynStat.Sens(10),DynStat.Lust(15)][5],[DynStat.Inte(-1),DynStat.Sens(10),DynStat.Lust(15)][6],[DynStat.Inte(-1),DynStat.Sens(10),DynStat.Lust(15)][7],[DynStat.Inte(-1),DynStat.Sens(10),DynStat.Lust(15)][8],[DynStat.Inte(-1),DynStat.Sens(10),DynStat.Lust(15)][9],[DynStat.Inte(-1),DynStat.Sens(10),DynStat.Lust(15)][10],[DynStat.Inte(-1),DynStat.Sens(10),DynStat.Lust(15)][11],[DynStat.Inte(-1),DynStat.Sens(10),DynStat.Lust(15)][12],[DynStat.Inte(-1),DynStat.Sens(10),DynStat.Lust(15)][13]);
               }
               else if(int([DynStat.Inte(-1),DynStat.Sens(10),DynStat.Lust(15)].length) == 15)
               {
                  get_game().player.dynStats([DynStat.Inte(-1),DynStat.Sens(10),DynStat.Lust(15)][0],[DynStat.Inte(-1),DynStat.Sens(10),DynStat.Lust(15)][1],[DynStat.Inte(-1),DynStat.Sens(10),DynStat.Lust(15)][2],[DynStat.Inte(-1),DynStat.Sens(10),DynStat.Lust(15)][3],[DynStat.Inte(-1),DynStat.Sens(10),DynStat.Lust(15)][4],[DynStat.Inte(-1),DynStat.Sens(10),DynStat.Lust(15)][5],[DynStat.Inte(-1),DynStat.Sens(10),DynStat.Lust(15)][6],[DynStat.Inte(-1),DynStat.Sens(10),DynStat.Lust(15)][7],[DynStat.Inte(-1),DynStat.Sens(10),DynStat.Lust(15)][8],[DynStat.Inte(-1),DynStat.Sens(10),DynStat.Lust(15)][9],[DynStat.Inte(-1),DynStat.Sens(10),DynStat.Lust(15)][10],[DynStat.Inte(-1),DynStat.Sens(10),DynStat.Lust(15)][11],[DynStat.Inte(-1),DynStat.Sens(10),DynStat.Lust(15)][12],[DynStat.Inte(-1),DynStat.Sens(10),DynStat.Lust(15)][13],[DynStat.Inte(-1),DynStat.Sens(10),DynStat.Lust(15)][14]);
               }
               else if(int([DynStat.Inte(-1),DynStat.Sens(10),DynStat.Lust(15)].length) == 16)
               {
                  get_game().player.dynStats([DynStat.Inte(-1),DynStat.Sens(10),DynStat.Lust(15)][0],[DynStat.Inte(-1),DynStat.Sens(10),DynStat.Lust(15)][1],[DynStat.Inte(-1),DynStat.Sens(10),DynStat.Lust(15)][2],[DynStat.Inte(-1),DynStat.Sens(10),DynStat.Lust(15)][3],[DynStat.Inte(-1),DynStat.Sens(10),DynStat.Lust(15)][4],[DynStat.Inte(-1),DynStat.Sens(10),DynStat.Lust(15)][5],[DynStat.Inte(-1),DynStat.Sens(10),DynStat.Lust(15)][6],[DynStat.Inte(-1),DynStat.Sens(10),DynStat.Lust(15)][7],[DynStat.Inte(-1),DynStat.Sens(10),DynStat.Lust(15)][8],[DynStat.Inte(-1),DynStat.Sens(10),DynStat.Lust(15)][9],[DynStat.Inte(-1),DynStat.Sens(10),DynStat.Lust(15)][10],[DynStat.Inte(-1),DynStat.Sens(10),DynStat.Lust(15)][11],[DynStat.Inte(-1),DynStat.Sens(10),DynStat.Lust(15)][12],[DynStat.Inte(-1),DynStat.Sens(10),DynStat.Lust(15)][13],[DynStat.Inte(-1),DynStat.Sens(10),DynStat.Lust(15)][14],[DynStat.Inte(-1),DynStat.Sens(10),DynStat.Lust(15)][15]);
               }
               else if(int([DynStat.Inte(-1),DynStat.Sens(10),DynStat.Lust(15)].length) == 17)
               {
                  get_game().player.dynStats([DynStat.Inte(-1),DynStat.Sens(10),DynStat.Lust(15)][0],[DynStat.Inte(-1),DynStat.Sens(10),DynStat.Lust(15)][1],[DynStat.Inte(-1),DynStat.Sens(10),DynStat.Lust(15)][2],[DynStat.Inte(-1),DynStat.Sens(10),DynStat.Lust(15)][3],[DynStat.Inte(-1),DynStat.Sens(10),DynStat.Lust(15)][4],[DynStat.Inte(-1),DynStat.Sens(10),DynStat.Lust(15)][5],[DynStat.Inte(-1),DynStat.Sens(10),DynStat.Lust(15)][6],[DynStat.Inte(-1),DynStat.Sens(10),DynStat.Lust(15)][7],[DynStat.Inte(-1),DynStat.Sens(10),DynStat.Lust(15)][8],[DynStat.Inte(-1),DynStat.Sens(10),DynStat.Lust(15)][9],[DynStat.Inte(-1),DynStat.Sens(10),DynStat.Lust(15)][10],[DynStat.Inte(-1),DynStat.Sens(10),DynStat.Lust(15)][11],[DynStat.Inte(-1),DynStat.Sens(10),DynStat.Lust(15)][12],[DynStat.Inte(-1),DynStat.Sens(10),DynStat.Lust(15)][13],[DynStat.Inte(-1),DynStat.Sens(10),DynStat.Lust(15)][14],[DynStat.Inte(-1),DynStat.Sens(10),DynStat.Lust(15)][15],[DynStat.Inte(-1),DynStat.Sens(10),DynStat.Lust(15)][16]);
               }
               else if(int([DynStat.Inte(-1),DynStat.Sens(10),DynStat.Lust(15)].length) == 18)
               {
                  get_game().player.dynStats([DynStat.Inte(-1),DynStat.Sens(10),DynStat.Lust(15)][0],[DynStat.Inte(-1),DynStat.Sens(10),DynStat.Lust(15)][1],[DynStat.Inte(-1),DynStat.Sens(10),DynStat.Lust(15)][2],[DynStat.Inte(-1),DynStat.Sens(10),DynStat.Lust(15)][3],[DynStat.Inte(-1),DynStat.Sens(10),DynStat.Lust(15)][4],[DynStat.Inte(-1),DynStat.Sens(10),DynStat.Lust(15)][5],[DynStat.Inte(-1),DynStat.Sens(10),DynStat.Lust(15)][6],[DynStat.Inte(-1),DynStat.Sens(10),DynStat.Lust(15)][7],[DynStat.Inte(-1),DynStat.Sens(10),DynStat.Lust(15)][8],[DynStat.Inte(-1),DynStat.Sens(10),DynStat.Lust(15)][9],[DynStat.Inte(-1),DynStat.Sens(10),DynStat.Lust(15)][10],[DynStat.Inte(-1),DynStat.Sens(10),DynStat.Lust(15)][11],[DynStat.Inte(-1),DynStat.Sens(10),DynStat.Lust(15)][12],[DynStat.Inte(-1),DynStat.Sens(10),DynStat.Lust(15)][13],[DynStat.Inte(-1),DynStat.Sens(10),DynStat.Lust(15)][14],[DynStat.Inte(-1),DynStat.Sens(10),DynStat.Lust(15)][15],[DynStat.Inte(-1),DynStat.Sens(10),DynStat.Lust(15)][16],[DynStat.Inte(-1)
                  ,DynStat.Sens(10),DynStat.Lust(15)][17]);
               }
               else if(int([DynStat.Inte(-1),DynStat.Sens(10),DynStat.Lust(15)].length) == 19)
               {
                  get_game().player.dynStats([DynStat.Inte(-1),DynStat.Sens(10),DynStat.Lust(15)][0],[DynStat.Inte(-1),DynStat.Sens(10),DynStat.Lust(15)][1],[DynStat.Inte(-1),DynStat.Sens(10),DynStat.Lust(15)][2],[DynStat.Inte(-1),DynStat.Sens(10),DynStat.Lust(15)][3],[DynStat.Inte(-1),DynStat.Sens(10),DynStat.Lust(15)][4],[DynStat.Inte(-1),DynStat.Sens(10),DynStat.Lust(15)][5],[DynStat.Inte(-1),DynStat.Sens(10),DynStat.Lust(15)][6],[DynStat.Inte(-1),DynStat.Sens(10),DynStat.Lust(15)][7],[DynStat.Inte(-1),DynStat.Sens(10),DynStat.Lust(15)][8],[DynStat.Inte(-1),DynStat.Sens(10),DynStat.Lust(15)][9],[DynStat.Inte(-1),DynStat.Sens(10),DynStat.Lust(15)][10],[DynStat.Inte(-1),DynStat.Sens(10),DynStat.Lust(15)][11],[DynStat.Inte(-1),DynStat.Sens(10),DynStat.Lust(15)][12],[DynStat.Inte(-1),DynStat.Sens(10),DynStat.Lust(15)][13],[DynStat.Inte(-1),DynStat.Sens(10),DynStat.Lust(15)][14],[DynStat.Inte(-1),DynStat.Sens(10),DynStat.Lust(15)][15],[DynStat.Inte(-1),DynStat.Sens(10),DynStat.Lust(15)][16],[DynStat.Inte(-1)
                  ,DynStat.Sens(10),DynStat.Lust(15)][17],[DynStat.Inte(-1),DynStat.Sens(10),DynStat.Lust(15)][18]);
               }
               else
               {
                  if(int([DynStat.Inte(-1),DynStat.Sens(10),DynStat.Lust(15)].length) != 20)
                  {
                     throw "Too many rest arguments";
                  }
                  get_game().player.dynStats([DynStat.Inte(-1),DynStat.Sens(10),DynStat.Lust(15)][0],[DynStat.Inte(-1),DynStat.Sens(10),DynStat.Lust(15)][1],[DynStat.Inte(-1),DynStat.Sens(10),DynStat.Lust(15)][2],[DynStat.Inte(-1),DynStat.Sens(10),DynStat.Lust(15)][3],[DynStat.Inte(-1),DynStat.Sens(10),DynStat.Lust(15)][4],[DynStat.Inte(-1),DynStat.Sens(10),DynStat.Lust(15)][5],[DynStat.Inte(-1),DynStat.Sens(10),DynStat.Lust(15)][6],[DynStat.Inte(-1),DynStat.Sens(10),DynStat.Lust(15)][7],[DynStat.Inte(-1),DynStat.Sens(10),DynStat.Lust(15)][8],[DynStat.Inte(-1),DynStat.Sens(10),DynStat.Lust(15)][9],[DynStat.Inte(-1),DynStat.Sens(10),DynStat.Lust(15)][10],[DynStat.Inte(-1),DynStat.Sens(10),DynStat.Lust(15)][11],[DynStat.Inte(-1),DynStat.Sens(10),DynStat.Lust(15)][12],[DynStat.Inte(-1),DynStat.Sens(10),DynStat.Lust(15)][13],[DynStat.Inte(-1),DynStat.Sens(10),DynStat.Lust(15)][14],[DynStat.Inte(-1),DynStat.Sens(10),DynStat.Lust(15)][15],[DynStat.Inte(-1),DynStat.Sens(10),DynStat.Lust(15)][16],[DynStat.Inte(-1)
                  ,DynStat.Sens(10),DynStat.Lust(15)][17],[DynStat.Inte(-1),DynStat.Sens(10),DynStat.Lust(15)][18],[DynStat.Inte(-1),DynStat.Sens(10),DynStat.Lust(15)][19]);
               }
               _loc1_ = true;
            }
         }
         if(get_player().hasPerk(PerkLib.BimboBody) || get_player().hasStatusEffect(StatusEffects.BimboChampagne))
         {
            if(get_player().breastRows[0].breastRating < 5)
            {
               get_player().breastRows[0].breastRating = 5;
               if(get_player().hasPerk(PerkLib.BimboBrains) || get_player().hasStatusEffect(StatusEffects.BimboChampagne))
               {
                  outputText("<b>你的咪咪好像，又变得又大又晃了！现在你的奶子又变回了又大又美味的巨乳，你会有很多乐趣的！</b>[pg]");
               }
               else
               {
                  outputText("<b>你的[breasts]恢复了以前那种荡妇般的尺寸。看起来你将永远被这对巨大、敏感的乳房困扰了，但至少这能帮你把敌人挑逗到屈服！</b>[pg]");
               }
               if(int([DynStat.Inte(-1),DynStat.Lust(15)].length) == 0)
               {
                  get_game().player.dynStats();
               }
               else if(int([DynStat.Inte(-1),DynStat.Lust(15)].length) == 1)
               {
                  get_game().player.dynStats([DynStat.Inte(-1),DynStat.Lust(15)][0]);
               }
               else if(int([DynStat.Inte(-1),DynStat.Lust(15)].length) == 2)
               {
                  get_game().player.dynStats([DynStat.Inte(-1),DynStat.Lust(15)][0],[DynStat.Inte(-1),DynStat.Lust(15)][1]);
               }
               else if(int([DynStat.Inte(-1),DynStat.Lust(15)].length) == 3)
               {
                  get_game().player.dynStats([DynStat.Inte(-1),DynStat.Lust(15)][0],[DynStat.Inte(-1),DynStat.Lust(15)][1],[DynStat.Inte(-1),DynStat.Lust(15)][2]);
               }
               else if(int([DynStat.Inte(-1),DynStat.Lust(15)].length) == 4)
               {
                  get_game().player.dynStats([DynStat.Inte(-1),DynStat.Lust(15)][0],[DynStat.Inte(-1),DynStat.Lust(15)][1],[DynStat.Inte(-1),DynStat.Lust(15)][2],[DynStat.Inte(-1),DynStat.Lust(15)][3]);
               }
               else if(int([DynStat.Inte(-1),DynStat.Lust(15)].length) == 5)
               {
                  get_game().player.dynStats([DynStat.Inte(-1),DynStat.Lust(15)][0],[DynStat.Inte(-1),DynStat.Lust(15)][1],[DynStat.Inte(-1),DynStat.Lust(15)][2],[DynStat.Inte(-1),DynStat.Lust(15)][3],[DynStat.Inte(-1),DynStat.Lust(15)][4]);
               }
               else if(int([DynStat.Inte(-1),DynStat.Lust(15)].length) == 6)
               {
                  get_game().player.dynStats([DynStat.Inte(-1),DynStat.Lust(15)][0],[DynStat.Inte(-1),DynStat.Lust(15)][1],[DynStat.Inte(-1),DynStat.Lust(15)][2],[DynStat.Inte(-1),DynStat.Lust(15)][3],[DynStat.Inte(-1),DynStat.Lust(15)][4],[DynStat.Inte(-1),DynStat.Lust(15)][5]);
               }
               else if(int([DynStat.Inte(-1),DynStat.Lust(15)].length) == 7)
               {
                  get_game().player.dynStats([DynStat.Inte(-1),DynStat.Lust(15)][0],[DynStat.Inte(-1),DynStat.Lust(15)][1],[DynStat.Inte(-1),DynStat.Lust(15)][2],[DynStat.Inte(-1),DynStat.Lust(15)][3],[DynStat.Inte(-1),DynStat.Lust(15)][4],[DynStat.Inte(-1),DynStat.Lust(15)][5],[DynStat.Inte(-1),DynStat.Lust(15)][6]);
               }
               else if(int([DynStat.Inte(-1),DynStat.Lust(15)].length) == 8)
               {
                  get_game().player.dynStats([DynStat.Inte(-1),DynStat.Lust(15)][0],[DynStat.Inte(-1),DynStat.Lust(15)][1],[DynStat.Inte(-1),DynStat.Lust(15)][2],[DynStat.Inte(-1),DynStat.Lust(15)][3],[DynStat.Inte(-1),DynStat.Lust(15)][4],[DynStat.Inte(-1),DynStat.Lust(15)][5],[DynStat.Inte(-1),DynStat.Lust(15)][6],[DynStat.Inte(-1),DynStat.Lust(15)][7]);
               }
               else if(int([DynStat.Inte(-1),DynStat.Lust(15)].length) == 9)
               {
                  get_game().player.dynStats([DynStat.Inte(-1),DynStat.Lust(15)][0],[DynStat.Inte(-1),DynStat.Lust(15)][1],[DynStat.Inte(-1),DynStat.Lust(15)][2],[DynStat.Inte(-1),DynStat.Lust(15)][3],[DynStat.Inte(-1),DynStat.Lust(15)][4],[DynStat.Inte(-1),DynStat.Lust(15)][5],[DynStat.Inte(-1),DynStat.Lust(15)][6],[DynStat.Inte(-1),DynStat.Lust(15)][7],[DynStat.Inte(-1),DynStat.Lust(15)][8]);
               }
               else if(int([DynStat.Inte(-1),DynStat.Lust(15)].length) == 10)
               {
                  get_game().player.dynStats([DynStat.Inte(-1),DynStat.Lust(15)][0],[DynStat.Inte(-1),DynStat.Lust(15)][1],[DynStat.Inte(-1),DynStat.Lust(15)][2],[DynStat.Inte(-1),DynStat.Lust(15)][3],[DynStat.Inte(-1),DynStat.Lust(15)][4],[DynStat.Inte(-1),DynStat.Lust(15)][5],[DynStat.Inte(-1),DynStat.Lust(15)][6],[DynStat.Inte(-1),DynStat.Lust(15)][7],[DynStat.Inte(-1),DynStat.Lust(15)][8],[DynStat.Inte(-1),DynStat.Lust(15)][9]);
               }
               else if(int([DynStat.Inte(-1),DynStat.Lust(15)].length) == 11)
               {
                  get_game().player.dynStats([DynStat.Inte(-1),DynStat.Lust(15)][0],[DynStat.Inte(-1),DynStat.Lust(15)][1],[DynStat.Inte(-1),DynStat.Lust(15)][2],[DynStat.Inte(-1),DynStat.Lust(15)][3],[DynStat.Inte(-1),DynStat.Lust(15)][4],[DynStat.Inte(-1),DynStat.Lust(15)][5],[DynStat.Inte(-1),DynStat.Lust(15)][6],[DynStat.Inte(-1),DynStat.Lust(15)][7],[DynStat.Inte(-1),DynStat.Lust(15)][8],[DynStat.Inte(-1),DynStat.Lust(15)][9],[DynStat.Inte(-1),DynStat.Lust(15)][10]);
               }
               else if(int([DynStat.Inte(-1),DynStat.Lust(15)].length) == 12)
               {
                  get_game().player.dynStats([DynStat.Inte(-1),DynStat.Lust(15)][0],[DynStat.Inte(-1),DynStat.Lust(15)][1],[DynStat.Inte(-1),DynStat.Lust(15)][2],[DynStat.Inte(-1),DynStat.Lust(15)][3],[DynStat.Inte(-1),DynStat.Lust(15)][4],[DynStat.Inte(-1),DynStat.Lust(15)][5],[DynStat.Inte(-1),DynStat.Lust(15)][6],[DynStat.Inte(-1),DynStat.Lust(15)][7],[DynStat.Inte(-1),DynStat.Lust(15)][8],[DynStat.Inte(-1),DynStat.Lust(15)][9],[DynStat.Inte(-1),DynStat.Lust(15)][10],[DynStat.Inte(-1),DynStat.Lust(15)][11]);
               }
               else if(int([DynStat.Inte(-1),DynStat.Lust(15)].length) == 13)
               {
                  get_game().player.dynStats([DynStat.Inte(-1),DynStat.Lust(15)][0],[DynStat.Inte(-1),DynStat.Lust(15)][1],[DynStat.Inte(-1),DynStat.Lust(15)][2],[DynStat.Inte(-1),DynStat.Lust(15)][3],[DynStat.Inte(-1),DynStat.Lust(15)][4],[DynStat.Inte(-1),DynStat.Lust(15)][5],[DynStat.Inte(-1),DynStat.Lust(15)][6],[DynStat.Inte(-1),DynStat.Lust(15)][7],[DynStat.Inte(-1),DynStat.Lust(15)][8],[DynStat.Inte(-1),DynStat.Lust(15)][9],[DynStat.Inte(-1),DynStat.Lust(15)][10],[DynStat.Inte(-1),DynStat.Lust(15)][11],[DynStat.Inte(-1),DynStat.Lust(15)][12]);
               }
               else if(int([DynStat.Inte(-1),DynStat.Lust(15)].length) == 14)
               {
                  get_game().player.dynStats([DynStat.Inte(-1),DynStat.Lust(15)][0],[DynStat.Inte(-1),DynStat.Lust(15)][1],[DynStat.Inte(-1),DynStat.Lust(15)][2],[DynStat.Inte(-1),DynStat.Lust(15)][3],[DynStat.Inte(-1),DynStat.Lust(15)][4],[DynStat.Inte(-1),DynStat.Lust(15)][5],[DynStat.Inte(-1),DynStat.Lust(15)][6],[DynStat.Inte(-1),DynStat.Lust(15)][7],[DynStat.Inte(-1),DynStat.Lust(15)][8],[DynStat.Inte(-1),DynStat.Lust(15)][9],[DynStat.Inte(-1),DynStat.Lust(15)][10],[DynStat.Inte(-1),DynStat.Lust(15)][11],[DynStat.Inte(-1),DynStat.Lust(15)][12],[DynStat.Inte(-1),DynStat.Lust(15)][13]);
               }
               else if(int([DynStat.Inte(-1),DynStat.Lust(15)].length) == 15)
               {
                  get_game().player.dynStats([DynStat.Inte(-1),DynStat.Lust(15)][0],[DynStat.Inte(-1),DynStat.Lust(15)][1],[DynStat.Inte(-1),DynStat.Lust(15)][2],[DynStat.Inte(-1),DynStat.Lust(15)][3],[DynStat.Inte(-1),DynStat.Lust(15)][4],[DynStat.Inte(-1),DynStat.Lust(15)][5],[DynStat.Inte(-1),DynStat.Lust(15)][6],[DynStat.Inte(-1),DynStat.Lust(15)][7],[DynStat.Inte(-1),DynStat.Lust(15)][8],[DynStat.Inte(-1),DynStat.Lust(15)][9],[DynStat.Inte(-1),DynStat.Lust(15)][10],[DynStat.Inte(-1),DynStat.Lust(15)][11],[DynStat.Inte(-1),DynStat.Lust(15)][12],[DynStat.Inte(-1),DynStat.Lust(15)][13],[DynStat.Inte(-1),DynStat.Lust(15)][14]);
               }
               else if(int([DynStat.Inte(-1),DynStat.Lust(15)].length) == 16)
               {
                  get_game().player.dynStats([DynStat.Inte(-1),DynStat.Lust(15)][0],[DynStat.Inte(-1),DynStat.Lust(15)][1],[DynStat.Inte(-1),DynStat.Lust(15)][2],[DynStat.Inte(-1),DynStat.Lust(15)][3],[DynStat.Inte(-1),DynStat.Lust(15)][4],[DynStat.Inte(-1),DynStat.Lust(15)][5],[DynStat.Inte(-1),DynStat.Lust(15)][6],[DynStat.Inte(-1),DynStat.Lust(15)][7],[DynStat.Inte(-1),DynStat.Lust(15)][8],[DynStat.Inte(-1),DynStat.Lust(15)][9],[DynStat.Inte(-1),DynStat.Lust(15)][10],[DynStat.Inte(-1),DynStat.Lust(15)][11],[DynStat.Inte(-1),DynStat.Lust(15)][12],[DynStat.Inte(-1),DynStat.Lust(15)][13],[DynStat.Inte(-1),DynStat.Lust(15)][14],[DynStat.Inte(-1),DynStat.Lust(15)][15]);
               }
               else if(int([DynStat.Inte(-1),DynStat.Lust(15)].length) == 17)
               {
                  get_game().player.dynStats([DynStat.Inte(-1),DynStat.Lust(15)][0],[DynStat.Inte(-1),DynStat.Lust(15)][1],[DynStat.Inte(-1),DynStat.Lust(15)][2],[DynStat.Inte(-1),DynStat.Lust(15)][3],[DynStat.Inte(-1),DynStat.Lust(15)][4],[DynStat.Inte(-1),DynStat.Lust(15)][5],[DynStat.Inte(-1),DynStat.Lust(15)][6],[DynStat.Inte(-1),DynStat.Lust(15)][7],[DynStat.Inte(-1),DynStat.Lust(15)][8],[DynStat.Inte(-1),DynStat.Lust(15)][9],[DynStat.Inte(-1),DynStat.Lust(15)][10],[DynStat.Inte(-1),DynStat.Lust(15)][11],[DynStat.Inte(-1),DynStat.Lust(15)][12],[DynStat.Inte(-1),DynStat.Lust(15)][13],[DynStat.Inte(-1),DynStat.Lust(15)][14],[DynStat.Inte(-1),DynStat.Lust(15)][15],[DynStat.Inte(-1),DynStat.Lust(15)][16]);
               }
               else if(int([DynStat.Inte(-1),DynStat.Lust(15)].length) == 18)
               {
                  get_game().player.dynStats([DynStat.Inte(-1),DynStat.Lust(15)][0],[DynStat.Inte(-1),DynStat.Lust(15)][1],[DynStat.Inte(-1),DynStat.Lust(15)][2],[DynStat.Inte(-1),DynStat.Lust(15)][3],[DynStat.Inte(-1),DynStat.Lust(15)][4],[DynStat.Inte(-1),DynStat.Lust(15)][5],[DynStat.Inte(-1),DynStat.Lust(15)][6],[DynStat.Inte(-1),DynStat.Lust(15)][7],[DynStat.Inte(-1),DynStat.Lust(15)][8],[DynStat.Inte(-1),DynStat.Lust(15)][9],[DynStat.Inte(-1),DynStat.Lust(15)][10],[DynStat.Inte(-1),DynStat.Lust(15)][11],[DynStat.Inte(-1),DynStat.Lust(15)][12],[DynStat.Inte(-1),DynStat.Lust(15)][13],[DynStat.Inte(-1),DynStat.Lust(15)][14],[DynStat.Inte(-1),DynStat.Lust(15)][15],[DynStat.Inte(-1),DynStat.Lust(15)][16],[DynStat.Inte(-1),DynStat.Lust(15)][17]);
               }
               else if(int([DynStat.Inte(-1),DynStat.Lust(15)].length) == 19)
               {
                  get_game().player.dynStats([DynStat.Inte(-1),DynStat.Lust(15)][0],[DynStat.Inte(-1),DynStat.Lust(15)][1],[DynStat.Inte(-1),DynStat.Lust(15)][2],[DynStat.Inte(-1),DynStat.Lust(15)][3],[DynStat.Inte(-1),DynStat.Lust(15)][4],[DynStat.Inte(-1),DynStat.Lust(15)][5],[DynStat.Inte(-1),DynStat.Lust(15)][6],[DynStat.Inte(-1),DynStat.Lust(15)][7],[DynStat.Inte(-1),DynStat.Lust(15)][8],[DynStat.Inte(-1),DynStat.Lust(15)][9],[DynStat.Inte(-1),DynStat.Lust(15)][10],[DynStat.Inte(-1),DynStat.Lust(15)][11],[DynStat.Inte(-1),DynStat.Lust(15)][12],[DynStat.Inte(-1),DynStat.Lust(15)][13],[DynStat.Inte(-1),DynStat.Lust(15)][14],[DynStat.Inte(-1),DynStat.Lust(15)][15],[DynStat.Inte(-1),DynStat.Lust(15)][16],[DynStat.Inte(-1),DynStat.Lust(15)][17],[DynStat.Inte(-1),DynStat.Lust(15)][18]);
               }
               else
               {
                  if(int([DynStat.Inte(-1),DynStat.Lust(15)].length) != 20)
                  {
                     throw "Too many rest arguments";
                  }
                  get_game().player.dynStats([DynStat.Inte(-1),DynStat.Lust(15)][0],[DynStat.Inte(-1),DynStat.Lust(15)][1],[DynStat.Inte(-1),DynStat.Lust(15)][2],[DynStat.Inte(-1),DynStat.Lust(15)][3],[DynStat.Inte(-1),DynStat.Lust(15)][4],[DynStat.Inte(-1),DynStat.Lust(15)][5],[DynStat.Inte(-1),DynStat.Lust(15)][6],[DynStat.Inte(-1),DynStat.Lust(15)][7],[DynStat.Inte(-1),DynStat.Lust(15)][8],[DynStat.Inte(-1),DynStat.Lust(15)][9],[DynStat.Inte(-1),DynStat.Lust(15)][10],[DynStat.Inte(-1),DynStat.Lust(15)][11],[DynStat.Inte(-1),DynStat.Lust(15)][12],[DynStat.Inte(-1),DynStat.Lust(15)][13],[DynStat.Inte(-1),DynStat.Lust(15)][14],[DynStat.Inte(-1),DynStat.Lust(15)][15],[DynStat.Inte(-1),DynStat.Lust(15)][16],[DynStat.Inte(-1),DynStat.Lust(15)][17],[DynStat.Inte(-1),DynStat.Lust(15)][18],[DynStat.Inte(-1),DynStat.Lust(15)][19]);
               }
               _loc1_ = true;
            }
            if(!get_player().hasVagina())
            {
               get_player().createVagina();
               if(get_player().hasPerk(PerkLib.BimboBrains) || get_player().hasStatusEffect(StatusEffects.BimboChampagne))
               {
                  outputText("<b>你的胯部好像，又痒又什么的。我的天呐！那里裂开了一条湿润的小缝，而且还刺刺的！感觉好舒服，也许，有人可以往里面塞点什么！</b>[pg]");
               }
               else
               {
                  outputText("<b>你的胯部刺痛了一秒钟，当你伸手去摸时，你的[legs]瘫软地折叠在身下。你长出了一个阴道——这该死的东西就是不肯消失，而且这次感觉敏感了两倍。操他妈的荡妇酒。</b>[pg]");
               }
               _loc1_ = true;
            }
            if(get_player().hips.rating < 12)
            {
               if(get_player().hasPerk(PerkLib.BimboBrains) || get_player().hasPerk(PerkLib.FutaFaculties))
               {
                  outputText("哇哦！当你移动时，你的[hips]向两侧摆动得越来越厉害，每走一步都在扩张，柔软的新肉填充进来，让你的胯部变得更适合一个娇笑的无脑荡妇。当你意识到自己没法用其他方式走路时，你咯咯地笑了起来。至少这让你看起来，超级性感！[pg]");
               }
               else
               {
                  outputText("哦，不！当你移动时，你的[hips]向两侧摆动得越来越厉害，每走一步都在扩张，柔软的新肉填充进来，让你的胯部变得更适合一个无脑荡妇。当你意识到自己没法用其他方式走路时，你重重地叹了口气，唯一的安慰是，你变宽的胯部可以更有效地挑逗别人。[pg]");
               }
               if(int([DynStat.Inte(-1)].length) == 0)
               {
                  get_game().player.dynStats();
               }
               else if(int([DynStat.Inte(-1)].length) == 1)
               {
                  get_game().player.dynStats([DynStat.Inte(-1)][0]);
               }
               else if(int([DynStat.Inte(-1)].length) == 2)
               {
                  get_game().player.dynStats([DynStat.Inte(-1)][0],[DynStat.Inte(-1)][1]);
               }
               else if(int([DynStat.Inte(-1)].length) == 3)
               {
                  get_game().player.dynStats([DynStat.Inte(-1)][0],[DynStat.Inte(-1)][1],[DynStat.Inte(-1)][2]);
               }
               else if(int([DynStat.Inte(-1)].length) == 4)
               {
                  get_game().player.dynStats([DynStat.Inte(-1)][0],[DynStat.Inte(-1)][1],[DynStat.Inte(-1)][2],[DynStat.Inte(-1)][3]);
               }
               else if(int([DynStat.Inte(-1)].length) == 5)
               {
                  get_game().player.dynStats([DynStat.Inte(-1)][0],[DynStat.Inte(-1)][1],[DynStat.Inte(-1)][2],[DynStat.Inte(-1)][3],[DynStat.Inte(-1)][4]);
               }
               else if(int([DynStat.Inte(-1)].length) == 6)
               {
                  get_game().player.dynStats([DynStat.Inte(-1)][0],[DynStat.Inte(-1)][1],[DynStat.Inte(-1)][2],[DynStat.Inte(-1)][3],[DynStat.Inte(-1)][4],[DynStat.Inte(-1)][5]);
               }
               else if(int([DynStat.Inte(-1)].length) == 7)
               {
                  get_game().player.dynStats([DynStat.Inte(-1)][0],[DynStat.Inte(-1)][1],[DynStat.Inte(-1)][2],[DynStat.Inte(-1)][3],[DynStat.Inte(-1)][4],[DynStat.Inte(-1)][5],[DynStat.Inte(-1)][6]);
               }
               else if(int([DynStat.Inte(-1)].length) == 8)
               {
                  get_game().player.dynStats([DynStat.Inte(-1)][0],[DynStat.Inte(-1)][1],[DynStat.Inte(-1)][2],[DynStat.Inte(-1)][3],[DynStat.Inte(-1)][4],[DynStat.Inte(-1)][5],[DynStat.Inte(-1)][6],[DynStat.Inte(-1)][7]);
               }
               else if(int([DynStat.Inte(-1)].length) == 9)
               {
                  get_game().player.dynStats([DynStat.Inte(-1)][0],[DynStat.Inte(-1)][1],[DynStat.Inte(-1)][2],[DynStat.Inte(-1)][3],[DynStat.Inte(-1)][4],[DynStat.Inte(-1)][5],[DynStat.Inte(-1)][6],[DynStat.Inte(-1)][7],[DynStat.Inte(-1)][8]);
               }
               else if(int([DynStat.Inte(-1)].length) == 10)
               {
                  get_game().player.dynStats([DynStat.Inte(-1)][0],[DynStat.Inte(-1)][1],[DynStat.Inte(-1)][2],[DynStat.Inte(-1)][3],[DynStat.Inte(-1)][4],[DynStat.Inte(-1)][5],[DynStat.Inte(-1)][6],[DynStat.Inte(-1)][7],[DynStat.Inte(-1)][8],[DynStat.Inte(-1)][9]);
               }
               else if(int([DynStat.Inte(-1)].length) == 11)
               {
                  get_game().player.dynStats([DynStat.Inte(-1)][0],[DynStat.Inte(-1)][1],[DynStat.Inte(-1)][2],[DynStat.Inte(-1)][3],[DynStat.Inte(-1)][4],[DynStat.Inte(-1)][5],[DynStat.Inte(-1)][6],[DynStat.Inte(-1)][7],[DynStat.Inte(-1)][8],[DynStat.Inte(-1)][9],[DynStat.Inte(-1)][10]);
               }
               else if(int([DynStat.Inte(-1)].length) == 12)
               {
                  get_game().player.dynStats([DynStat.Inte(-1)][0],[DynStat.Inte(-1)][1],[DynStat.Inte(-1)][2],[DynStat.Inte(-1)][3],[DynStat.Inte(-1)][4],[DynStat.Inte(-1)][5],[DynStat.Inte(-1)][6],[DynStat.Inte(-1)][7],[DynStat.Inte(-1)][8],[DynStat.Inte(-1)][9],[DynStat.Inte(-1)][10],[DynStat.Inte(-1)][11]);
               }
               else if(int([DynStat.Inte(-1)].length) == 13)
               {
                  get_game().player.dynStats([DynStat.Inte(-1)][0],[DynStat.Inte(-1)][1],[DynStat.Inte(-1)][2],[DynStat.Inte(-1)][3],[DynStat.Inte(-1)][4],[DynStat.Inte(-1)][5],[DynStat.Inte(-1)][6],[DynStat.Inte(-1)][7],[DynStat.Inte(-1)][8],[DynStat.Inte(-1)][9],[DynStat.Inte(-1)][10],[DynStat.Inte(-1)][11],[DynStat.Inte(-1)][12]);
               }
               else if(int([DynStat.Inte(-1)].length) == 14)
               {
                  get_game().player.dynStats([DynStat.Inte(-1)][0],[DynStat.Inte(-1)][1],[DynStat.Inte(-1)][2],[DynStat.Inte(-1)][3],[DynStat.Inte(-1)][4],[DynStat.Inte(-1)][5],[DynStat.Inte(-1)][6],[DynStat.Inte(-1)][7],[DynStat.Inte(-1)][8],[DynStat.Inte(-1)][9],[DynStat.Inte(-1)][10],[DynStat.Inte(-1)][11],[DynStat.Inte(-1)][12],[DynStat.Inte(-1)][13]);
               }
               else if(int([DynStat.Inte(-1)].length) == 15)
               {
                  get_game().player.dynStats([DynStat.Inte(-1)][0],[DynStat.Inte(-1)][1],[DynStat.Inte(-1)][2],[DynStat.Inte(-1)][3],[DynStat.Inte(-1)][4],[DynStat.Inte(-1)][5],[DynStat.Inte(-1)][6],[DynStat.Inte(-1)][7],[DynStat.Inte(-1)][8],[DynStat.Inte(-1)][9],[DynStat.Inte(-1)][10],[DynStat.Inte(-1)][11],[DynStat.Inte(-1)][12],[DynStat.Inte(-1)][13],[DynStat.Inte(-1)][14]);
               }
               else if(int([DynStat.Inte(-1)].length) == 16)
               {
                  get_game().player.dynStats([DynStat.Inte(-1)][0],[DynStat.Inte(-1)][1],[DynStat.Inte(-1)][2],[DynStat.Inte(-1)][3],[DynStat.Inte(-1)][4],[DynStat.Inte(-1)][5],[DynStat.Inte(-1)][6],[DynStat.Inte(-1)][7],[DynStat.Inte(-1)][8],[DynStat.Inte(-1)][9],[DynStat.Inte(-1)][10],[DynStat.Inte(-1)][11],[DynStat.Inte(-1)][12],[DynStat.Inte(-1)][13],[DynStat.Inte(-1)][14],[DynStat.Inte(-1)][15]);
               }
               else if(int([DynStat.Inte(-1)].length) == 17)
               {
                  get_game().player.dynStats([DynStat.Inte(-1)][0],[DynStat.Inte(-1)][1],[DynStat.Inte(-1)][2],[DynStat.Inte(-1)][3],[DynStat.Inte(-1)][4],[DynStat.Inte(-1)][5],[DynStat.Inte(-1)][6],[DynStat.Inte(-1)][7],[DynStat.Inte(-1)][8],[DynStat.Inte(-1)][9],[DynStat.Inte(-1)][10],[DynStat.Inte(-1)][11],[DynStat.Inte(-1)][12],[DynStat.Inte(-1)][13],[DynStat.Inte(-1)][14],[DynStat.Inte(-1)][15],[DynStat.Inte(-1)][16]);
               }
               else if(int([DynStat.Inte(-1)].length) == 18)
               {
                  get_game().player.dynStats([DynStat.Inte(-1)][0],[DynStat.Inte(-1)][1],[DynStat.Inte(-1)][2],[DynStat.Inte(-1)][3],[DynStat.Inte(-1)][4],[DynStat.Inte(-1)][5],[DynStat.Inte(-1)][6],[DynStat.Inte(-1)][7],[DynStat.Inte(-1)][8],[DynStat.Inte(-1)][9],[DynStat.Inte(-1)][10],[DynStat.Inte(-1)][11],[DynStat.Inte(-1)][12],[DynStat.Inte(-1)][13],[DynStat.Inte(-1)][14],[DynStat.Inte(-1)][15],[DynStat.Inte(-1)][16],[DynStat.Inte(-1)][17]);
               }
               else if(int([DynStat.Inte(-1)].length) == 19)
               {
                  get_game().player.dynStats([DynStat.Inte(-1)][0],[DynStat.Inte(-1)][1],[DynStat.Inte(-1)][2],[DynStat.Inte(-1)][3],[DynStat.Inte(-1)][4],[DynStat.Inte(-1)][5],[DynStat.Inte(-1)][6],[DynStat.Inte(-1)][7],[DynStat.Inte(-1)][8],[DynStat.Inte(-1)][9],[DynStat.Inte(-1)][10],[DynStat.Inte(-1)][11],[DynStat.Inte(-1)][12],[DynStat.Inte(-1)][13],[DynStat.Inte(-1)][14],[DynStat.Inte(-1)][15],[DynStat.Inte(-1)][16],[DynStat.Inte(-1)][17],[DynStat.Inte(-1)][18]);
               }
               else
               {
                  if(int([DynStat.Inte(-1)].length) != 20)
                  {
                     throw "Too many rest arguments";
                  }
                  get_game().player.dynStats([DynStat.Inte(-1)][0],[DynStat.Inte(-1)][1],[DynStat.Inte(-1)][2],[DynStat.Inte(-1)][3],[DynStat.Inte(-1)][4],[DynStat.Inte(-1)][5],[DynStat.Inte(-1)][6],[DynStat.Inte(-1)][7],[DynStat.Inte(-1)][8],[DynStat.Inte(-1)][9],[DynStat.Inte(-1)][10],[DynStat.Inte(-1)][11],[DynStat.Inte(-1)][12],[DynStat.Inte(-1)][13],[DynStat.Inte(-1)][14],[DynStat.Inte(-1)][15],[DynStat.Inte(-1)][16],[DynStat.Inte(-1)][17],[DynStat.Inte(-1)][18],[DynStat.Inte(-1)][19]);
               }
               get_player().hips.rating = 12;
               _loc1_ = true;
            }
            if(get_player().butt.rating < 12)
            {
               if(get_player().hasPerk(PerkLib.BimboBrains) || get_player().hasPerk(PerkLib.FutaFaculties))
               {
                  outputText("随着温度逐渐升高，你发现你的[butt]简直因情色的能量而发烫。你暗自微笑，想象着自己有多希望再次拥有一个漂亮、丰满的荡妇翘臀，你的双手不自觉地摸向了那团软肉。等等，手是怎么摸到那里的？当你意识到自己的屁股在手里感觉有多好时，你咬住了嘴唇，尤其是当它开始变大的时候。屁股本来就会这样吗？快乐的粉色念头冲刷掉了这种担忧——感觉很好，而且你想要一个性感的大屁股！生长最终停止了，当那充满欲望的温暖最后一点余韵消散时，你闷闷不乐地撅起了嘴。不过，当你移动并感觉到你的新屁股在身后晃动时，你还是笑了。这会很有趣的！[pg]");
               }
               else
               {
                  outputText("随着温度逐渐升高，你发现你的[butt]简直因情色的能量而发烫。哦，不！你本以为拥有一个肥大的荡妇大屁股已经是过去式了，但感受着它在你摸索的指尖下传来的酥麻感，你毫不怀疑你那性感的屁股即将迎来第二春。等等，你的手指是怎么摸到那里的？当你感觉到你的屁股蛋在膨胀时，你有些心虚地把手抽开。每次你弹跳并摇晃你的新屁股时，你都会享受地轻声呻吟。该死！你强迫自己停下来，你的屁股也随之停止了生长，但当你再次迈步时，你能感觉到它随着你的每一步在身后弹跳。至少这能帮你更有效地挑逗你的敌人……[pg]");
               }
               if(int([DynStat.Inte(-1),DynStat.Lust(10)].length) == 0)
               {
                  get_game().player.dynStats();
               }
               else if(int([DynStat.Inte(-1),DynStat.Lust(10)].length) == 1)
               {
                  get_game().player.dynStats([DynStat.Inte(-1),DynStat.Lust(10)][0]);
               }
               else if(int([DynStat.Inte(-1),DynStat.Lust(10)].length) == 2)
               {
                  get_game().player.dynStats([DynStat.Inte(-1),DynStat.Lust(10)][0],[DynStat.Inte(-1),DynStat.Lust(10)][1]);
               }
               else if(int([DynStat.Inte(-1),DynStat.Lust(10)].length) == 3)
               {
                  get_game().player.dynStats([DynStat.Inte(-1),DynStat.Lust(10)][0],[DynStat.Inte(-1),DynStat.Lust(10)][1],[DynStat.Inte(-1),DynStat.Lust(10)][2]);
               }
               else if(int([DynStat.Inte(-1),DynStat.Lust(10)].length) == 4)
               {
                  get_game().player.dynStats([DynStat.Inte(-1),DynStat.Lust(10)][0],[DynStat.Inte(-1),DynStat.Lust(10)][1],[DynStat.Inte(-1),DynStat.Lust(10)][2],[DynStat.Inte(-1),DynStat.Lust(10)][3]);
               }
               else if(int([DynStat.Inte(-1),DynStat.Lust(10)].length) == 5)
               {
                  get_game().player.dynStats([DynStat.Inte(-1),DynStat.Lust(10)][0],[DynStat.Inte(-1),DynStat.Lust(10)][1],[DynStat.Inte(-1),DynStat.Lust(10)][2],[DynStat.Inte(-1),DynStat.Lust(10)][3],[DynStat.Inte(-1),DynStat.Lust(10)][4]);
               }
               else if(int([DynStat.Inte(-1),DynStat.Lust(10)].length) == 6)
               {
                  get_game().player.dynStats([DynStat.Inte(-1),DynStat.Lust(10)][0],[DynStat.Inte(-1),DynStat.Lust(10)][1],[DynStat.Inte(-1),DynStat.Lust(10)][2],[DynStat.Inte(-1),DynStat.Lust(10)][3],[DynStat.Inte(-1),DynStat.Lust(10)][4],[DynStat.Inte(-1),DynStat.Lust(10)][5]);
               }
               else if(int([DynStat.Inte(-1),DynStat.Lust(10)].length) == 7)
               {
                  get_game().player.dynStats([DynStat.Inte(-1),DynStat.Lust(10)][0],[DynStat.Inte(-1),DynStat.Lust(10)][1],[DynStat.Inte(-1),DynStat.Lust(10)][2],[DynStat.Inte(-1),DynStat.Lust(10)][3],[DynStat.Inte(-1),DynStat.Lust(10)][4],[DynStat.Inte(-1),DynStat.Lust(10)][5],[DynStat.Inte(-1),DynStat.Lust(10)][6]);
               }
               else if(int([DynStat.Inte(-1),DynStat.Lust(10)].length) == 8)
               {
                  get_game().player.dynStats([DynStat.Inte(-1),DynStat.Lust(10)][0],[DynStat.Inte(-1),DynStat.Lust(10)][1],[DynStat.Inte(-1),DynStat.Lust(10)][2],[DynStat.Inte(-1),DynStat.Lust(10)][3],[DynStat.Inte(-1),DynStat.Lust(10)][4],[DynStat.Inte(-1),DynStat.Lust(10)][5],[DynStat.Inte(-1),DynStat.Lust(10)][6],[DynStat.Inte(-1),DynStat.Lust(10)][7]);
               }
               else if(int([DynStat.Inte(-1),DynStat.Lust(10)].length) == 9)
               {
                  get_game().player.dynStats([DynStat.Inte(-1),DynStat.Lust(10)][0],[DynStat.Inte(-1),DynStat.Lust(10)][1],[DynStat.Inte(-1),DynStat.Lust(10)][2],[DynStat.Inte(-1),DynStat.Lust(10)][3],[DynStat.Inte(-1),DynStat.Lust(10)][4],[DynStat.Inte(-1),DynStat.Lust(10)][5],[DynStat.Inte(-1),DynStat.Lust(10)][6],[DynStat.Inte(-1),DynStat.Lust(10)][7],[DynStat.Inte(-1),DynStat.Lust(10)][8]);
               }
               else if(int([DynStat.Inte(-1),DynStat.Lust(10)].length) == 10)
               {
                  get_game().player.dynStats([DynStat.Inte(-1),DynStat.Lust(10)][0],[DynStat.Inte(-1),DynStat.Lust(10)][1],[DynStat.Inte(-1),DynStat.Lust(10)][2],[DynStat.Inte(-1),DynStat.Lust(10)][3],[DynStat.Inte(-1),DynStat.Lust(10)][4],[DynStat.Inte(-1),DynStat.Lust(10)][5],[DynStat.Inte(-1),DynStat.Lust(10)][6],[DynStat.Inte(-1),DynStat.Lust(10)][7],[DynStat.Inte(-1),DynStat.Lust(10)][8],[DynStat.Inte(-1),DynStat.Lust(10)][9]);
               }
               else if(int([DynStat.Inte(-1),DynStat.Lust(10)].length) == 11)
               {
                  get_game().player.dynStats([DynStat.Inte(-1),DynStat.Lust(10)][0],[DynStat.Inte(-1),DynStat.Lust(10)][1],[DynStat.Inte(-1),DynStat.Lust(10)][2],[DynStat.Inte(-1),DynStat.Lust(10)][3],[DynStat.Inte(-1),DynStat.Lust(10)][4],[DynStat.Inte(-1),DynStat.Lust(10)][5],[DynStat.Inte(-1),DynStat.Lust(10)][6],[DynStat.Inte(-1),DynStat.Lust(10)][7],[DynStat.Inte(-1),DynStat.Lust(10)][8],[DynStat.Inte(-1),DynStat.Lust(10)][9],[DynStat.Inte(-1),DynStat.Lust(10)][10]);
               }
               else if(int([DynStat.Inte(-1),DynStat.Lust(10)].length) == 12)
               {
                  get_game().player.dynStats([DynStat.Inte(-1),DynStat.Lust(10)][0],[DynStat.Inte(-1),DynStat.Lust(10)][1],[DynStat.Inte(-1),DynStat.Lust(10)][2],[DynStat.Inte(-1),DynStat.Lust(10)][3],[DynStat.Inte(-1),DynStat.Lust(10)][4],[DynStat.Inte(-1),DynStat.Lust(10)][5],[DynStat.Inte(-1),DynStat.Lust(10)][6],[DynStat.Inte(-1),DynStat.Lust(10)][7],[DynStat.Inte(-1),DynStat.Lust(10)][8],[DynStat.Inte(-1),DynStat.Lust(10)][9],[DynStat.Inte(-1),DynStat.Lust(10)][10],[DynStat.Inte(-1),DynStat.Lust(10)][11]);
               }
               else if(int([DynStat.Inte(-1),DynStat.Lust(10)].length) == 13)
               {
                  get_game().player.dynStats([DynStat.Inte(-1),DynStat.Lust(10)][0],[DynStat.Inte(-1),DynStat.Lust(10)][1],[DynStat.Inte(-1),DynStat.Lust(10)][2],[DynStat.Inte(-1),DynStat.Lust(10)][3],[DynStat.Inte(-1),DynStat.Lust(10)][4],[DynStat.Inte(-1),DynStat.Lust(10)][5],[DynStat.Inte(-1),DynStat.Lust(10)][6],[DynStat.Inte(-1),DynStat.Lust(10)][7],[DynStat.Inte(-1),DynStat.Lust(10)][8],[DynStat.Inte(-1),DynStat.Lust(10)][9],[DynStat.Inte(-1),DynStat.Lust(10)][10],[DynStat.Inte(-1),DynStat.Lust(10)][11],[DynStat.Inte(-1),DynStat.Lust(10)][12]);
               }
               else if(int([DynStat.Inte(-1),DynStat.Lust(10)].length) == 14)
               {
                  get_game().player.dynStats([DynStat.Inte(-1),DynStat.Lust(10)][0],[DynStat.Inte(-1),DynStat.Lust(10)][1],[DynStat.Inte(-1),DynStat.Lust(10)][2],[DynStat.Inte(-1),DynStat.Lust(10)][3],[DynStat.Inte(-1),DynStat.Lust(10)][4],[DynStat.Inte(-1),DynStat.Lust(10)][5],[DynStat.Inte(-1),DynStat.Lust(10)][6],[DynStat.Inte(-1),DynStat.Lust(10)][7],[DynStat.Inte(-1),DynStat.Lust(10)][8],[DynStat.Inte(-1),DynStat.Lust(10)][9],[DynStat.Inte(-1),DynStat.Lust(10)][10],[DynStat.Inte(-1),DynStat.Lust(10)][11],[DynStat.Inte(-1),DynStat.Lust(10)][12],[DynStat.Inte(-1),DynStat.Lust(10)][13]);
               }
               else if(int([DynStat.Inte(-1),DynStat.Lust(10)].length) == 15)
               {
                  get_game().player.dynStats([DynStat.Inte(-1),DynStat.Lust(10)][0],[DynStat.Inte(-1),DynStat.Lust(10)][1],[DynStat.Inte(-1),DynStat.Lust(10)][2],[DynStat.Inte(-1),DynStat.Lust(10)][3],[DynStat.Inte(-1),DynStat.Lust(10)][4],[DynStat.Inte(-1),DynStat.Lust(10)][5],[DynStat.Inte(-1),DynStat.Lust(10)][6],[DynStat.Inte(-1),DynStat.Lust(10)][7],[DynStat.Inte(-1),DynStat.Lust(10)][8],[DynStat.Inte(-1),DynStat.Lust(10)][9],[DynStat.Inte(-1),DynStat.Lust(10)][10],[DynStat.Inte(-1),DynStat.Lust(10)][11],[DynStat.Inte(-1),DynStat.Lust(10)][12],[DynStat.Inte(-1),DynStat.Lust(10)][13],[DynStat.Inte(-1),DynStat.Lust(10)][14]);
               }
               else if(int([DynStat.Inte(-1),DynStat.Lust(10)].length) == 16)
               {
                  get_game().player.dynStats([DynStat.Inte(-1),DynStat.Lust(10)][0],[DynStat.Inte(-1),DynStat.Lust(10)][1],[DynStat.Inte(-1),DynStat.Lust(10)][2],[DynStat.Inte(-1),DynStat.Lust(10)][3],[DynStat.Inte(-1),DynStat.Lust(10)][4],[DynStat.Inte(-1),DynStat.Lust(10)][5],[DynStat.Inte(-1),DynStat.Lust(10)][6],[DynStat.Inte(-1),DynStat.Lust(10)][7],[DynStat.Inte(-1),DynStat.Lust(10)][8],[DynStat.Inte(-1),DynStat.Lust(10)][9],[DynStat.Inte(-1),DynStat.Lust(10)][10],[DynStat.Inte(-1),DynStat.Lust(10)][11],[DynStat.Inte(-1),DynStat.Lust(10)][12],[DynStat.Inte(-1),DynStat.Lust(10)][13],[DynStat.Inte(-1),DynStat.Lust(10)][14],[DynStat.Inte(-1),DynStat.Lust(10)][15]);
               }
               else if(int([DynStat.Inte(-1),DynStat.Lust(10)].length) == 17)
               {
                  get_game().player.dynStats([DynStat.Inte(-1),DynStat.Lust(10)][0],[DynStat.Inte(-1),DynStat.Lust(10)][1],[DynStat.Inte(-1),DynStat.Lust(10)][2],[DynStat.Inte(-1),DynStat.Lust(10)][3],[DynStat.Inte(-1),DynStat.Lust(10)][4],[DynStat.Inte(-1),DynStat.Lust(10)][5],[DynStat.Inte(-1),DynStat.Lust(10)][6],[DynStat.Inte(-1),DynStat.Lust(10)][7],[DynStat.Inte(-1),DynStat.Lust(10)][8],[DynStat.Inte(-1),DynStat.Lust(10)][9],[DynStat.Inte(-1),DynStat.Lust(10)][10],[DynStat.Inte(-1),DynStat.Lust(10)][11],[DynStat.Inte(-1),DynStat.Lust(10)][12],[DynStat.Inte(-1),DynStat.Lust(10)][13],[DynStat.Inte(-1),DynStat.Lust(10)][14],[DynStat.Inte(-1),DynStat.Lust(10)][15],[DynStat.Inte(-1),DynStat.Lust(10)][16]);
               }
               else if(int([DynStat.Inte(-1),DynStat.Lust(10)].length) == 18)
               {
                  get_game().player.dynStats([DynStat.Inte(-1),DynStat.Lust(10)][0],[DynStat.Inte(-1),DynStat.Lust(10)][1],[DynStat.Inte(-1),DynStat.Lust(10)][2],[DynStat.Inte(-1),DynStat.Lust(10)][3],[DynStat.Inte(-1),DynStat.Lust(10)][4],[DynStat.Inte(-1),DynStat.Lust(10)][5],[DynStat.Inte(-1),DynStat.Lust(10)][6],[DynStat.Inte(-1),DynStat.Lust(10)][7],[DynStat.Inte(-1),DynStat.Lust(10)][8],[DynStat.Inte(-1),DynStat.Lust(10)][9],[DynStat.Inte(-1),DynStat.Lust(10)][10],[DynStat.Inte(-1),DynStat.Lust(10)][11],[DynStat.Inte(-1),DynStat.Lust(10)][12],[DynStat.Inte(-1),DynStat.Lust(10)][13],[DynStat.Inte(-1),DynStat.Lust(10)][14],[DynStat.Inte(-1),DynStat.Lust(10)][15],[DynStat.Inte(-1),DynStat.Lust(10)][16],[DynStat.Inte(-1),DynStat.Lust(10)][17]);
               }
               else if(int([DynStat.Inte(-1),DynStat.Lust(10)].length) == 19)
               {
                  get_game().player.dynStats([DynStat.Inte(-1),DynStat.Lust(10)][0],[DynStat.Inte(-1),DynStat.Lust(10)][1],[DynStat.Inte(-1),DynStat.Lust(10)][2],[DynStat.Inte(-1),DynStat.Lust(10)][3],[DynStat.Inte(-1),DynStat.Lust(10)][4],[DynStat.Inte(-1),DynStat.Lust(10)][5],[DynStat.Inte(-1),DynStat.Lust(10)][6],[DynStat.Inte(-1),DynStat.Lust(10)][7],[DynStat.Inte(-1),DynStat.Lust(10)][8],[DynStat.Inte(-1),DynStat.Lust(10)][9],[DynStat.Inte(-1),DynStat.Lust(10)][10],[DynStat.Inte(-1),DynStat.Lust(10)][11],[DynStat.Inte(-1),DynStat.Lust(10)][12],[DynStat.Inte(-1),DynStat.Lust(10)][13],[DynStat.Inte(-1),DynStat.Lust(10)][14],[DynStat.Inte(-1),DynStat.Lust(10)][15],[DynStat.Inte(-1),DynStat.Lust(10)][16],[DynStat.Inte(-1),DynStat.Lust(10)][17],[DynStat.Inte(-1),DynStat.Lust(10)][18]);
               }
               else
               {
                  if(int([DynStat.Inte(-1),DynStat.Lust(10)].length) != 20)
                  {
                     throw "Too many rest arguments";
                  }
                  get_game().player.dynStats([DynStat.Inte(-1),DynStat.Lust(10)][0],[DynStat.Inte(-1),DynStat.Lust(10)][1],[DynStat.Inte(-1),DynStat.Lust(10)][2],[DynStat.Inte(-1),DynStat.Lust(10)][3],[DynStat.Inte(-1),DynStat.Lust(10)][4],[DynStat.Inte(-1),DynStat.Lust(10)][5],[DynStat.Inte(-1),DynStat.Lust(10)][6],[DynStat.Inte(-1),DynStat.Lust(10)][7],[DynStat.Inte(-1),DynStat.Lust(10)][8],[DynStat.Inte(-1),DynStat.Lust(10)][9],[DynStat.Inte(-1),DynStat.Lust(10)][10],[DynStat.Inte(-1),DynStat.Lust(10)][11],[DynStat.Inte(-1),DynStat.Lust(10)][12],[DynStat.Inte(-1),DynStat.Lust(10)][13],[DynStat.Inte(-1),DynStat.Lust(10)][14],[DynStat.Inte(-1),DynStat.Lust(10)][15],[DynStat.Inte(-1),DynStat.Lust(10)][16],[DynStat.Inte(-1),DynStat.Lust(10)][17],[DynStat.Inte(-1),DynStat.Lust(10)][18],[DynStat.Inte(-1),DynStat.Lust(10)][19]);
               }
               get_player().butt.rating = 12;
               _loc1_ = true;
            }
         }
         if(get_player().hasPerk(PerkLib.BroBody))
         {
            get_player().removeStatusEffect(StatusEffects.Feeder);
            get_player().removePerk(PerkLib.Feeder);
            if(!get_player().hasCock())
            {
               get_player().createCock();
               get_player().cocks[0].cockLength = 10;
               get_player().cocks[0].cockThickness = 2.75;
               outputText("<b>随着时间推移，你的下体感到了一阵瘙痒。一瞬间后，一根肉柱从你的胯下喷薄而出。你那根崭新的、10英寸长的肉棒欢快地跳动着。");
               if(get_player().balls == 0)
               {
                  outputText("一对沉甸甸的睾丸在它下方就位，翻腾着产生精液。");
                  get_player().balls = 2;
                  get_player().ballSize = 3;
               }
               outputText("</b>[pg]");
               _loc1_ = true;
            }
            if(get_player().cocks[0].cockLength < 8)
            {
               outputText("<b>随着时间的推移，你的阴茎充血膨胀，直到长到8英寸长。");
               if(get_player().hasPerk(PerkLib.BroBrains))
               {
                  outputText("该死，那玩意儿简直和你一样硬！");
               }
               outputText("你真的控制不住你的老二。</b>[pg]");
               get_player().cocks[0].cockLength = 8;
               if(get_player().cocks[0].cockThickness < 2)
               {
                  get_player().cocks[0].cockThickness = 1.5;
               }
               _loc1_ = true;
            }
            if(get_player().balls == 0)
            {
               outputText("<b>随着时间的推移，你下半身的压力加剧到了近乎痛苦的程度。[eachcock]下方的皮肤变得松弛下垂，接着两颗睾丸滚落下来，填满了你的阴囊。</b>[pg]");
               get_player().balls = 2;
               get_player().ballSize = 3;
               _loc1_ = true;
            }
         }
         if(get_player().hasStatusEffect(StatusEffects.Feeder))
         {
            if(get_player().hasUnpermedPerk(PerkLib.Feeder) && get_player().cor <= Math.max(5,20 - get_player().corruptionTolerance()) || get_player().breastRows[0].breastRating <= 1)
            {
               outputText("哺乳的欲望逐渐消退。这一定与你体内的腐化有关。[pg](<b>你失去了“喂养者”特质。</b>)[pg]");
               get_player().removeStatusEffect(StatusEffects.Feeder);
               get_player().removePerk(PerkLib.Feeder);
               _loc1_ = true;
            }
            else
            {
               if(get_player().breastRows[0].breastRating < 5)
               {
                  outputText("随着时间的推移，你的[breasts]开始晃动摇摆，似乎又重新充满了你那取之不尽的乳汁。只要你还如此专注于哺乳，看起来你就无法让它们保持在DD罩杯以下了。[pg]");
                  get_player().breastRows[0].breastRating = 5;
                  _loc1_ = true;
               }
               get_player().addStatusValue(StatusEffects.Feeder,2,1);
               if(get_player().statusEffectv2(StatusEffects.Feeder) >= 72 && get_game().time.hours == 14)
               {
                  outputText("<b>在这么长时间没有给别人喂奶之后，你开始感到有些奇怪。你每一寸皮肤都因敏感而微微颤动，尤其是你那酸痛、滴着奶水的乳头。</b>[pg]");
                  _loc8_ = get_game();
                  _loc9_ = [DynStat.Sens(2 + (get_player().statusEffectv2(StatusEffects.Feeder) - 70) / 20)];
                  if(int(_loc9_.length) == 0)
                  {
                     _loc8_.player.dynStats();
                  }
                  else if(int(_loc9_.length) == 1)
                  {
                     _loc8_.player.dynStats(_loc9_[0]);
                  }
                  else if(int(_loc9_.length) == 2)
                  {
                     _loc8_.player.dynStats(_loc9_[0],_loc9_[1]);
                  }
                  else if(int(_loc9_.length) == 3)
                  {
                     _loc8_.player.dynStats(_loc9_[0],_loc9_[1],_loc9_[2]);
                  }
                  else if(int(_loc9_.length) == 4)
                  {
                     _loc8_.player.dynStats(_loc9_[0],_loc9_[1],_loc9_[2],_loc9_[3]);
                  }
                  else if(int(_loc9_.length) == 5)
                  {
                     _loc8_.player.dynStats(_loc9_[0],_loc9_[1],_loc9_[2],_loc9_[3],_loc9_[4]);
                  }
                  else if(int(_loc9_.length) == 6)
                  {
                     _loc8_.player.dynStats(_loc9_[0],_loc9_[1],_loc9_[2],_loc9_[3],_loc9_[4],_loc9_[5]);
                  }
                  else if(int(_loc9_.length) == 7)
                  {
                     _loc8_.player.dynStats(_loc9_[0],_loc9_[1],_loc9_[2],_loc9_[3],_loc9_[4],_loc9_[5],_loc9_[6]);
                  }
                  else if(int(_loc9_.length) == 8)
                  {
                     _loc8_.player.dynStats(_loc9_[0],_loc9_[1],_loc9_[2],_loc9_[3],_loc9_[4],_loc9_[5],_loc9_[6],_loc9_[7]);
                  }
                  else if(int(_loc9_.length) == 9)
                  {
                     _loc8_.player.dynStats(_loc9_[0],_loc9_[1],_loc9_[2],_loc9_[3],_loc9_[4],_loc9_[5],_loc9_[6],_loc9_[7],_loc9_[8]);
                  }
                  else if(int(_loc9_.length) == 10)
                  {
                     _loc8_.player.dynStats(_loc9_[0],_loc9_[1],_loc9_[2],_loc9_[3],_loc9_[4],_loc9_[5],_loc9_[6],_loc9_[7],_loc9_[8],_loc9_[9]);
                  }
                  else if(int(_loc9_.length) == 11)
                  {
                     _loc8_.player.dynStats(_loc9_[0],_loc9_[1],_loc9_[2],_loc9_[3],_loc9_[4],_loc9_[5],_loc9_[6],_loc9_[7],_loc9_[8],_loc9_[9],_loc9_[10]);
                  }
                  else if(int(_loc9_.length) == 12)
                  {
                     _loc8_.player.dynStats(_loc9_[0],_loc9_[1],_loc9_[2],_loc9_[3],_loc9_[4],_loc9_[5],_loc9_[6],_loc9_[7],_loc9_[8],_loc9_[9],_loc9_[10],_loc9_[11]);
                  }
                  else if(int(_loc9_.length) == 13)
                  {
                     _loc8_.player.dynStats(_loc9_[0],_loc9_[1],_loc9_[2],_loc9_[3],_loc9_[4],_loc9_[5],_loc9_[6],_loc9_[7],_loc9_[8],_loc9_[9],_loc9_[10],_loc9_[11],_loc9_[12]);
                  }
                  else if(int(_loc9_.length) == 14)
                  {
                     _loc8_.player.dynStats(_loc9_[0],_loc9_[1],_loc9_[2],_loc9_[3],_loc9_[4],_loc9_[5],_loc9_[6],_loc9_[7],_loc9_[8],_loc9_[9],_loc9_[10],_loc9_[11],_loc9_[12],_loc9_[13]);
                  }
                  else if(int(_loc9_.length) == 15)
                  {
                     _loc8_.player.dynStats(_loc9_[0],_loc9_[1],_loc9_[2],_loc9_[3],_loc9_[4],_loc9_[5],_loc9_[6],_loc9_[7],_loc9_[8],_loc9_[9],_loc9_[10],_loc9_[11],_loc9_[12],_loc9_[13],_loc9_[14]);
                  }
                  else if(int(_loc9_.length) == 16)
                  {
                     _loc8_.player.dynStats(_loc9_[0],_loc9_[1],_loc9_[2],_loc9_[3],_loc9_[4],_loc9_[5],_loc9_[6],_loc9_[7],_loc9_[8],_loc9_[9],_loc9_[10],_loc9_[11],_loc9_[12],_loc9_[13],_loc9_[14],_loc9_[15]);
                  }
                  else if(int(_loc9_.length) == 17)
                  {
                     _loc8_.player.dynStats(_loc9_[0],_loc9_[1],_loc9_[2],_loc9_[3],_loc9_[4],_loc9_[5],_loc9_[6],_loc9_[7],_loc9_[8],_loc9_[9],_loc9_[10],_loc9_[11],_loc9_[12],_loc9_[13],_loc9_[14],_loc9_[15],_loc9_[16]);
                  }
                  else if(int(_loc9_.length) == 18)
                  {
                     _loc8_.player.dynStats(_loc9_[0],_loc9_[1],_loc9_[2],_loc9_[3],_loc9_[4],_loc9_[5],_loc9_[6],_loc9_[7],_loc9_[8],_loc9_[9],_loc9_[10],_loc9_[11],_loc9_[12],_loc9_[13],_loc9_[14],_loc9_[15],_loc9_[16],_loc9_[17]);
                  }
                  else if(int(_loc9_.length) == 19)
                  {
                     _loc8_.player.dynStats(_loc9_[0],_loc9_[1],_loc9_[2],_loc9_[3],_loc9_[4],_loc9_[5],_loc9_[6],_loc9_[7],_loc9_[8],_loc9_[9],_loc9_[10],_loc9_[11],_loc9_[12],_loc9_[13],_loc9_[14],_loc9_[15],_loc9_[16],_loc9_[17],_loc9_[18]);
                  }
                  else
                  {
                     if(int(_loc9_.length) != 20)
                     {
                        throw "Too many rest arguments";
                     }
                     _loc8_.player.dynStats(_loc9_[0],_loc9_[1],_loc9_[2],_loc9_[3],_loc9_[4],_loc9_[5],_loc9_[6],_loc9_[7],_loc9_[8],_loc9_[9],_loc9_[10],_loc9_[11],_loc9_[12],_loc9_[13],_loc9_[14],_loc9_[15],_loc9_[16],_loc9_[17],_loc9_[18],_loc9_[19]);
                  }
                  _loc1_ = true;
               }
            }
         }
         if(get_player().hasStatusEffect(StatusEffects.WormPlugged) && FlagDict_Impl_.arrayReadInt(KFLAGS.flags,10) == 0)
         {
            if(get_player().hasVagina())
            {
               if(Utils.rand(5) == 0)
               {
                  FlagDict_Impl_.arrayWriteInt(KFLAGS.flags,10,1);
                  outputText("一股裹着精液的蠕虫突然伴随着黏糊糊的吸溜声从你的子宫里涌出。当这些蠕虫拼命逃窜时，液体顺着你的双腿流下。这么多扭动的身躯从你的阴唇喷涌而出的感觉，让你兴奋得不愿承认。你想知道它们为什么待了这么久，你内心深处有些担心它们的停留可能会降低你生育孩子的能力，尽管在这样一个地方，这也许是一件幸事。[pg]");
                  _loc8_ = get_game();
                  _loc9_ = [DynStat.Lust(2 + get_player().sens / 10)];
                  if(int(_loc9_.length) == 0)
                  {
                     _loc8_.player.dynStats();
                  }
                  else if(int(_loc9_.length) == 1)
                  {
                     _loc8_.player.dynStats(_loc9_[0]);
                  }
                  else if(int(_loc9_.length) == 2)
                  {
                     _loc8_.player.dynStats(_loc9_[0],_loc9_[1]);
                  }
                  else if(int(_loc9_.length) == 3)
                  {
                     _loc8_.player.dynStats(_loc9_[0],_loc9_[1],_loc9_[2]);
                  }
                  else if(int(_loc9_.length) == 4)
                  {
                     _loc8_.player.dynStats(_loc9_[0],_loc9_[1],_loc9_[2],_loc9_[3]);
                  }
                  else if(int(_loc9_.length) == 5)
                  {
                     _loc8_.player.dynStats(_loc9_[0],_loc9_[1],_loc9_[2],_loc9_[3],_loc9_[4]);
                  }
                  else if(int(_loc9_.length) == 6)
                  {
                     _loc8_.player.dynStats(_loc9_[0],_loc9_[1],_loc9_[2],_loc9_[3],_loc9_[4],_loc9_[5]);
                  }
                  else if(int(_loc9_.length) == 7)
                  {
                     _loc8_.player.dynStats(_loc9_[0],_loc9_[1],_loc9_[2],_loc9_[3],_loc9_[4],_loc9_[5],_loc9_[6]);
                  }
                  else if(int(_loc9_.length) == 8)
                  {
                     _loc8_.player.dynStats(_loc9_[0],_loc9_[1],_loc9_[2],_loc9_[3],_loc9_[4],_loc9_[5],_loc9_[6],_loc9_[7]);
                  }
                  else if(int(_loc9_.length) == 9)
                  {
                     _loc8_.player.dynStats(_loc9_[0],_loc9_[1],_loc9_[2],_loc9_[3],_loc9_[4],_loc9_[5],_loc9_[6],_loc9_[7],_loc9_[8]);
                  }
                  else if(int(_loc9_.length) == 10)
                  {
                     _loc8_.player.dynStats(_loc9_[0],_loc9_[1],_loc9_[2],_loc9_[3],_loc9_[4],_loc9_[5],_loc9_[6],_loc9_[7],_loc9_[8],_loc9_[9]);
                  }
                  else if(int(_loc9_.length) == 11)
                  {
                     _loc8_.player.dynStats(_loc9_[0],_loc9_[1],_loc9_[2],_loc9_[3],_loc9_[4],_loc9_[5],_loc9_[6],_loc9_[7],_loc9_[8],_loc9_[9],_loc9_[10]);
                  }
                  else if(int(_loc9_.length) == 12)
                  {
                     _loc8_.player.dynStats(_loc9_[0],_loc9_[1],_loc9_[2],_loc9_[3],_loc9_[4],_loc9_[5],_loc9_[6],_loc9_[7],_loc9_[8],_loc9_[9],_loc9_[10],_loc9_[11]);
                  }
                  else if(int(_loc9_.length) == 13)
                  {
                     _loc8_.player.dynStats(_loc9_[0],_loc9_[1],_loc9_[2],_loc9_[3],_loc9_[4],_loc9_[5],_loc9_[6],_loc9_[7],_loc9_[8],_loc9_[9],_loc9_[10],_loc9_[11],_loc9_[12]);
                  }
                  else if(int(_loc9_.length) == 14)
                  {
                     _loc8_.player.dynStats(_loc9_[0],_loc9_[1],_loc9_[2],_loc9_[3],_loc9_[4],_loc9_[5],_loc9_[6],_loc9_[7],_loc9_[8],_loc9_[9],_loc9_[10],_loc9_[11],_loc9_[12],_loc9_[13]);
                  }
                  else if(int(_loc9_.length) == 15)
                  {
                     _loc8_.player.dynStats(_loc9_[0],_loc9_[1],_loc9_[2],_loc9_[3],_loc9_[4],_loc9_[5],_loc9_[6],_loc9_[7],_loc9_[8],_loc9_[9],_loc9_[10],_loc9_[11],_loc9_[12],_loc9_[13],_loc9_[14]);
                  }
                  else if(int(_loc9_.length) == 16)
                  {
                     _loc8_.player.dynStats(_loc9_[0],_loc9_[1],_loc9_[2],_loc9_[3],_loc9_[4],_loc9_[5],_loc9_[6],_loc9_[7],_loc9_[8],_loc9_[9],_loc9_[10],_loc9_[11],_loc9_[12],_loc9_[13],_loc9_[14],_loc9_[15]);
                  }
                  else if(int(_loc9_.length) == 17)
                  {
                     _loc8_.player.dynStats(_loc9_[0],_loc9_[1],_loc9_[2],_loc9_[3],_loc9_[4],_loc9_[5],_loc9_[6],_loc9_[7],_loc9_[8],_loc9_[9],_loc9_[10],_loc9_[11],_loc9_[12],_loc9_[13],_loc9_[14],_loc9_[15],_loc9_[16]);
                  }
                  else if(int(_loc9_.length) == 18)
                  {
                     _loc8_.player.dynStats(_loc9_[0],_loc9_[1],_loc9_[2],_loc9_[3],_loc9_[4],_loc9_[5],_loc9_[6],_loc9_[7],_loc9_[8],_loc9_[9],_loc9_[10],_loc9_[11],_loc9_[12],_loc9_[13],_loc9_[14],_loc9_[15],_loc9_[16],_loc9_[17]);
                  }
                  else if(int(_loc9_.length) == 19)
                  {
                     _loc8_.player.dynStats(_loc9_[0],_loc9_[1],_loc9_[2],_loc9_[3],_loc9_[4],_loc9_[5],_loc9_[6],_loc9_[7],_loc9_[8],_loc9_[9],_loc9_[10],_loc9_[11],_loc9_[12],_loc9_[13],_loc9_[14],_loc9_[15],_loc9_[16],_loc9_[17],_loc9_[18]);
                  }
                  else
                  {
                     if(int(_loc9_.length) != 20)
                     {
                        throw "Too many rest arguments";
                     }
                     _loc8_.player.dynStats(_loc9_[0],_loc9_[1],_loc9_[2],_loc9_[3],_loc9_[4],_loc9_[5],_loc9_[6],_loc9_[7],_loc9_[8],_loc9_[9],_loc9_[10],_loc9_[11],_loc9_[12],_loc9_[13],_loc9_[14],_loc9_[15],_loc9_[16],_loc9_[17],_loc9_[18],_loc9_[19]);
                  }
                  if(get_player().fertility > 5)
                  {
                     var _temp_3:* = get_player();
                     _temp_3.fertility = _temp_3.fertility - (1 + Math.round(get_player().fertility / 4));
                  }
                  get_player().addStatusValue(StatusEffects.WormPlugged,1,-1);
                  if(get_player().statusEffectv1(StatusEffects.WormPlugged) <= 0)
                  {
                     get_player().removeStatusEffect(StatusEffects.WormPlugged);
                     get_player().knockUpForce();
                  }
                  _loc1_ = true;
               }
            }
            else
            {
               get_player().removeStatusEffect(StatusEffects.WormPlugged);
               get_player().knockUpForce();
            }
         }
         if(get_player().hasStatusEffect(StatusEffects.Milked))
         {
            get_player().addStatusValue(StatusEffects.Milked,1,-1);
            if(get_player().statusEffectv1(StatusEffects.Milked) <= 0)
            {
               outputText("<b>你的[nipples]不再因为挤奶而酸痛了。</b>[pg]");
               get_player().removeStatusEffect(StatusEffects.Milked);
               _loc1_ = true;
            }
         }
         if(get_player().hasStatusEffect(StatusEffects.Jizzpants))
         {
            outputText("你的[armor]因为你卸在里面的精液而湿漉漉地挤压着，你的每一次动作都让你越来越兴奋。[pg]");
            _loc8_ = get_game();
            _loc9_ = [DynStat.Lust(10 + get_player().sens / 5)];
            if(int(_loc9_.length) == 0)
            {
               _loc8_.player.dynStats();
            }
            else if(int(_loc9_.length) == 1)
            {
               _loc8_.player.dynStats(_loc9_[0]);
            }
            else if(int(_loc9_.length) == 2)
            {
               _loc8_.player.dynStats(_loc9_[0],_loc9_[1]);
            }
            else if(int(_loc9_.length) == 3)
            {
               _loc8_.player.dynStats(_loc9_[0],_loc9_[1],_loc9_[2]);
            }
            else if(int(_loc9_.length) == 4)
            {
               _loc8_.player.dynStats(_loc9_[0],_loc9_[1],_loc9_[2],_loc9_[3]);
            }
            else if(int(_loc9_.length) == 5)
            {
               _loc8_.player.dynStats(_loc9_[0],_loc9_[1],_loc9_[2],_loc9_[3],_loc9_[4]);
            }
            else if(int(_loc9_.length) == 6)
            {
               _loc8_.player.dynStats(_loc9_[0],_loc9_[1],_loc9_[2],_loc9_[3],_loc9_[4],_loc9_[5]);
            }
            else if(int(_loc9_.length) == 7)
            {
               _loc8_.player.dynStats(_loc9_[0],_loc9_[1],_loc9_[2],_loc9_[3],_loc9_[4],_loc9_[5],_loc9_[6]);
            }
            else if(int(_loc9_.length) == 8)
            {
               _loc8_.player.dynStats(_loc9_[0],_loc9_[1],_loc9_[2],_loc9_[3],_loc9_[4],_loc9_[5],_loc9_[6],_loc9_[7]);
            }
            else if(int(_loc9_.length) == 9)
            {
               _loc8_.player.dynStats(_loc9_[0],_loc9_[1],_loc9_[2],_loc9_[3],_loc9_[4],_loc9_[5],_loc9_[6],_loc9_[7],_loc9_[8]);
            }
            else if(int(_loc9_.length) == 10)
            {
               _loc8_.player.dynStats(_loc9_[0],_loc9_[1],_loc9_[2],_loc9_[3],_loc9_[4],_loc9_[5],_loc9_[6],_loc9_[7],_loc9_[8],_loc9_[9]);
            }
            else if(int(_loc9_.length) == 11)
            {
               _loc8_.player.dynStats(_loc9_[0],_loc9_[1],_loc9_[2],_loc9_[3],_loc9_[4],_loc9_[5],_loc9_[6],_loc9_[7],_loc9_[8],_loc9_[9],_loc9_[10]);
            }
            else if(int(_loc9_.length) == 12)
            {
               _loc8_.player.dynStats(_loc9_[0],_loc9_[1],_loc9_[2],_loc9_[3],_loc9_[4],_loc9_[5],_loc9_[6],_loc9_[7],_loc9_[8],_loc9_[9],_loc9_[10],_loc9_[11]);
            }
            else if(int(_loc9_.length) == 13)
            {
               _loc8_.player.dynStats(_loc9_[0],_loc9_[1],_loc9_[2],_loc9_[3],_loc9_[4],_loc9_[5],_loc9_[6],_loc9_[7],_loc9_[8],_loc9_[9],_loc9_[10],_loc9_[11],_loc9_[12]);
            }
            else if(int(_loc9_.length) == 14)
            {
               _loc8_.player.dynStats(_loc9_[0],_loc9_[1],_loc9_[2],_loc9_[3],_loc9_[4],_loc9_[5],_loc9_[6],_loc9_[7],_loc9_[8],_loc9_[9],_loc9_[10],_loc9_[11],_loc9_[12],_loc9_[13]);
            }
            else if(int(_loc9_.length) == 15)
            {
               _loc8_.player.dynStats(_loc9_[0],_loc9_[1],_loc9_[2],_loc9_[3],_loc9_[4],_loc9_[5],_loc9_[6],_loc9_[7],_loc9_[8],_loc9_[9],_loc9_[10],_loc9_[11],_loc9_[12],_loc9_[13],_loc9_[14]);
            }
            else if(int(_loc9_.length) == 16)
            {
               _loc8_.player.dynStats(_loc9_[0],_loc9_[1],_loc9_[2],_loc9_[3],_loc9_[4],_loc9_[5],_loc9_[6],_loc9_[7],_loc9_[8],_loc9_[9],_loc9_[10],_loc9_[11],_loc9_[12],_loc9_[13],_loc9_[14],_loc9_[15]);
            }
            else if(int(_loc9_.length) == 17)
            {
               _loc8_.player.dynStats(_loc9_[0],_loc9_[1],_loc9_[2],_loc9_[3],_loc9_[4],_loc9_[5],_loc9_[6],_loc9_[7],_loc9_[8],_loc9_[9],_loc9_[10],_loc9_[11],_loc9_[12],_loc9_[13],_loc9_[14],_loc9_[15],_loc9_[16]);
            }
            else if(int(_loc9_.length) == 18)
            {
               _loc8_.player.dynStats(_loc9_[0],_loc9_[1],_loc9_[2],_loc9_[3],_loc9_[4],_loc9_[5],_loc9_[6],_loc9_[7],_loc9_[8],_loc9_[9],_loc9_[10],_loc9_[11],_loc9_[12],_loc9_[13],_loc9_[14],_loc9_[15],_loc9_[16],_loc9_[17]);
            }
            else if(int(_loc9_.length) == 19)
            {
               _loc8_.player.dynStats(_loc9_[0],_loc9_[1],_loc9_[2],_loc9_[3],_loc9_[4],_loc9_[5],_loc9_[6],_loc9_[7],_loc9_[8],_loc9_[9],_loc9_[10],_loc9_[11],_loc9_[12],_loc9_[13],_loc9_[14],_loc9_[15],_loc9_[16],_loc9_[17],_loc9_[18]);
            }
            else
            {
               if(int(_loc9_.length) != 20)
               {
                  throw "Too many rest arguments";
               }
               _loc8_.player.dynStats(_loc9_[0],_loc9_[1],_loc9_[2],_loc9_[3],_loc9_[4],_loc9_[5],_loc9_[6],_loc9_[7],_loc9_[8],_loc9_[9],_loc9_[10],_loc9_[11],_loc9_[12],_loc9_[13],_loc9_[14],_loc9_[15],_loc9_[16],_loc9_[17],_loc9_[18],_loc9_[19]);
            }
            get_player().removeStatusEffect(StatusEffects.Jizzpants);
            _loc1_ = true;
         }
         if(get_player().hasStatusEffect(StatusEffects.Dysfunction))
         {
            if(get_player().statusEffectv1(StatusEffects.Dysfunction) <= 1)
            {
               get_player().removeStatusEffect(StatusEffects.Dysfunction);
               outputText("你感觉到下身一阵刺痛……终于，你的腹股沟恢复了全部知觉。<b>你又可以自慰了！</b>[pg]");
               _loc1_ = true;
            }
            else
            {
               get_player().addStatusValue(StatusEffects.Dysfunction,1,-1);
            }
         }
         if(!get_player().hasStatusEffect(StatusEffects.LactationReduction))
         {
            if(get_player().biggestLactation() > 0)
            {
               get_player().createStatusEffect(StatusEffects.LactationReduction,0,0,0,0);
            }
         }
         else if(get_player().biggestLactation() > 0 && !get_player().hasStatusEffect(StatusEffects.Feeder) && !get_player().hasPerk(PerkLib.MilkMaid) && get_player().get_pregnancyIncubation() == 0)
         {
            get_player().addStatusValue(StatusEffects.LactationReduction,1,1);
            if(get_player().statusEffectv1(StatusEffects.LactationReduction) >= 48)
            {
               if(!get_player().hasStatusEffect(StatusEffects.LactationReduc0))
               {
                  get_player().createStatusEffect(StatusEffects.LactationReduc0,0,0,0,0);
                  if(get_player().biggestLactation() >= 1)
                  {
                     outputText("<b>你的[nipples]感觉肿胀发胀，需要挤奶了。</b>[pg]");
                     get_player().orgasm("Tits",false);
                  }
                  if(get_player().biggestLactation() <= 2)
                  {
                     get_player().createStatusEffect(StatusEffects.LactationReduc1,0,0,0,0);
                  }
                  if(get_player().biggestLactation() <= 1)
                  {
                     get_player().createStatusEffect(StatusEffects.LactationReduc2,0,0,0,0);
                  }
                  _loc1_ = true;
               }
               get_player().boostLactation(-0.5 * int(get_player().breastRows.length) / 24);
               if(get_player().biggestLactation() <= 2.5 && !get_player().hasStatusEffect(StatusEffects.LactationReduc1))
               {
                  outputText("<b>随着你身体的乳汁分泌减少，你的乳房感觉轻盈了一些。</b>[pg]");
                  get_player().createStatusEffect(StatusEffects.LactationReduc1,0,0,0,0);
                  _loc1_ = true;
               }
               else if(get_player().biggestLactation() <= 1.5 && !get_player().hasStatusEffect(StatusEffects.LactationReduc2))
               {
                  outputText("<b>你身体的乳汁产量下降到了孕妇的“正常”水平。</b>[pg]");
                  get_player().createStatusEffect(StatusEffects.LactationReduc2,0,0,0,0);
                  _loc1_ = true;
               }
               if(get_player().biggestLactation() < 1 && !get_player().hasStatusEffect(StatusEffects.LactationReduc3))
               {
                  get_player().createStatusEffect(StatusEffects.LactationReduc3,0,0,0,0);
                  outputText("<b>你的身体不再分泌任何乳汁。</b>[pg]");
                  _loc1_ = true;
               }
               if(get_player().biggestLactation() == 0 && get_player().hasStatusEffect(StatusEffects.LactationReduc3))
               {
                  get_player().removeStatusEffect(StatusEffects.LactationReduction);
                  _loc1_ = true;
               }
            }
         }
         if(int(get_player().vaginas.length) > 0)
         {
            var _temp_4:* = get_player().vaginas[0];
            _loc2_ = _temp_4.recoveryProgress = int(_temp_4.recoveryProgress + 1);
            if(!get_player().hasPerk(PerkLib.FerasBoonWideOpen))
            {
               if(get_player().vaginas[0].vaginalLooseness == 2 && _loc2_ >= 200)
               {
                  outputText("你的" + get_player().vaginaDescript(0) + "从折磨中恢复过来，变得紧致了一些。[pg]");
                  _loc11_ = get_player().vaginas[0];
                  --_loc11_.vaginalLooseness;
                  get_player().vaginas[0].resetRecoveryProgress();
                  _loc1_ = true;
               }
               if(get_player().vaginas[0].vaginalLooseness == 3 && _loc2_ >= 100)
               {
                  outputText("你的" + get_player().vaginaDescript(0) + "从折磨中恢复过来，变得紧致了一些。[pg]");
                  _loc11_ = get_player().vaginas[0];
                  --_loc11_.vaginalLooseness;
                  get_player().vaginas[0].resetRecoveryProgress();
                  _loc1_ = true;
               }
               if(get_player().vaginas[0].vaginalLooseness == 4 && _loc2_ >= 70)
               {
                  outputText("你的" + get_player().vaginaDescript(0) + "从折磨中恢复过来，变得更紧了。[pg]");
                  _loc11_ = get_player().vaginas[0];
                  --_loc11_.vaginalLooseness;
                  get_player().vaginas[0].resetRecoveryProgress();
                  _loc1_ = true;
               }
            }
            if(get_player().vaginas[0].vaginalLooseness >= 5 && _loc2_ >= 50)
            {
               outputText("你的" + get_player().vaginaDescript(0) + "从残酷的扩张中恢复过来，稍微收紧了一点，但变化不大。[pg]");
               _loc11_ = get_player().vaginas[0];
               --_loc11_.vaginalLooseness;
               get_player().vaginas[0].resetRecoveryProgress();
               _loc1_ = true;
            }
         }
         if(get_player().hasStatusEffect(StatusEffects.ButtStretched))
         {
            get_player().addStatusValue(StatusEffects.ButtStretched,1,1);
            if(get_player().ass.analLooseness == 2 && get_player().statusEffectv1(StatusEffects.ButtStretched) >= 72)
            {
               outputText("<b>你的[asshole]从折磨中恢复过来，稍微收紧了一点。</b>[pg]");
               _loc12_ = get_player().ass;
               --_loc12_.analLooseness;
               get_player().changeStatusValue(StatusEffects.ButtStretched,1,0);
               _loc1_ = true;
            }
            if(get_player().ass.analLooseness == 3 && get_player().statusEffectv1(StatusEffects.ButtStretched) >= 48)
            {
               outputText("<b>你的[asshole]从折磨中恢复过来，稍微收紧了一点。</b>[pg]");
               _loc12_ = get_player().ass;
               --_loc12_.analLooseness;
               get_player().changeStatusValue(StatusEffects.ButtStretched,1,0);
               _loc1_ = true;
            }
            if(get_player().ass.analLooseness == 4 && get_player().statusEffectv1(StatusEffects.ButtStretched) >= 24)
            {
               outputText("<b>你的[asshole]从折磨中恢复过来，变得更紧了。</b>[pg]");
               _loc12_ = get_player().ass;
               --_loc12_.analLooseness;
               get_player().changeStatusValue(StatusEffects.ButtStretched,1,0);
               _loc1_ = true;
            }
            if(get_player().ass.analLooseness >= 5 && get_player().statusEffectv1(StatusEffects.ButtStretched) >= 12)
            {
               outputText("<b>你的[asshole]从遭受的粗暴扩张中恢复过来，变得更加紧致。</b>[pg]");
               _loc12_ = get_player().ass;
               --_loc12_.analLooseness;
               get_player().changeStatusValue(StatusEffects.ButtStretched,1,0);
               _loc1_ = true;
            }
         }
         if(get_player().hasPerk(PerkLib.SlimeCore))
         {
            if(get_player().vaginalCapacity() < 9000 || get_player().skin.adj != "slimy" || get_player().skin.desc != "skin" || get_player().lowerBody.type != 8)
            {
               outputText("你的身体泛起涟漪，似乎对正在经历的变化感到不确定。你血肉中的史莱姆粘液冷却下来，敏感且反应迅速的薄膜变厚成为了[skin]，同时骨骼和肌肉交织成一个紧凑的躯干，胸部和臀部的轮廓变得清晰。半透明的粘液变得浑浊，你脚下涌动的液洼融合在一起，分裂成坚实的肢体，你重新长出了双腿。没过多久，你再也无法看透自己的身体，伴随着一阵不稳的颤抖，你拍了拍自己，重新适应着固体的形态。胸口一阵翻滚的灼热突然提醒了你，曾经漂浮在你体内的史莱姆核心。小心翼翼地触摸你的[chest]，你能感觉到肋骨下有微弱的第二心跳，它似乎在逐渐下沉，越过你的肚子。一股翻滚的暖流穿过你的身体，让你刚长出的双腿站立不稳，一屁股跌坐在你的[ass]上。一种美妙的压力在你的腹部跳动，你松开你的[armor]，汗珠顺着你的脖子流下。你紧闭双眼，舌头在嘴里耷拉着，压力越来越大，直到在狂喜中，你的身体因高潮的释放而弓起。");
               outputText("[pg]你喘着粗气睁开眼睛，发现这一次，你高潮的源头并不是你的下体。感觉到腹肌上一阵温暖的湿润，你查看了一下，发现曾经在你体内的小巧心形核心不知怎么地穿过了你的肚脐。暴露在空气中，这个深红色的器官慢慢结晶，缩小并硬化成一颗微小的红宝石。用拇指摩擦着这块石头，你惊讶地发现，你仍然能感觉到它闪烁的切面内有脉搏在跳动。你收起了这颗红宝石心脏，以备不时之需。[pg]");
               get_player().createKeyItem("Ruby Heart",0,0,0,0);
               get_player().removePerk(PerkLib.SlimeCore);
               _loc1_ = true;
            }
         }
         if(get_player().hasKeyItem("Ruby Heart"))
         {
            if(get_player().hasStatusEffect(StatusEffects.SlimeCraving) && !get_player().hasPerk(PerkLib.SlimeCore) && get_player().isGoo() && get_player().gooScore() >= 4 && get_player().vaginalCapacity() >= 9000 && get_player().skin.adj == "slimy" && get_player().skin.desc == "skin" && get_player().lowerBody.type == 8)
            {
               outputText("当你适应了新的史莱姆般的身体时，你想起了很久以前排出的那颗红宝石心脏。当你伸手去捡它时，它颤动着，散发出温暖、欢快的光芒。你的手指合拢，核心滑过你的手掌，进入了你的身体！[pg]");
               outputText("你的胸口感到一阵短暂的压力，一些不属于你的记忆在眼前闪烁。令人眼花缭乱的景象过去后，史莱姆核心在你的体内安顿下来，印上了你的性格和经历。你的新核心传来一种令人欣慰的平静，你觉得，有了新的记忆，你将能够更好地管理你身体的液体需求。[pg]");
               outputText("(<b>获得新Perk：史莱姆核心 - 水分渴望的增长速度大幅降低。</b>)[pg]");
               get_player().createPerk(PerkLib.SlimeCore,0,0,0,0);
               get_player().removeKeyItem("Ruby Heart");
               _loc1_ = true;
            }
         }
         if(get_player().hasStatusEffect(StatusEffects.SlimeCraving))
         {
            if(get_player().vaginalCapacity() < 9000 || get_player().skin.adj != "slimy" || get_player().skin.desc != "skin" || get_player().lowerBody.type != 8)
            {
               outputText("<b>你意识到你不再像以前那样渴望体液了。</b>[pg]");
               get_player().removeStatusEffect(StatusEffects.SlimeCraving);
               get_player().removeStatusEffect(StatusEffects.SlimeCravingFeed);
               _loc1_ = true;
            }
            else
            {
               _loc6_ = 1;
               if(get_player().hasPerk(PerkLib.SlimeCore))
               {
                  _loc6_ /= 2;
               }
               if(get_player().get_jewelry().get_id() == get_jewelries().AQUARING.get_id())
               {
                  _loc6_ /= 2;
               }
               get_player().addStatusValue(StatusEffects.SlimeCraving,1,_loc6_);
               if(get_player().statusEffectv1(StatusEffects.SlimeCraving) >= 18)
               {
                  if(!get_player().hasStatusEffect(StatusEffects.SlimeCravingOutput))
                  {
                     get_player().createStatusEffect(StatusEffects.SlimeCravingOutput,0,0,0,0);
                     outputText("<b>你对他人“体液”的渴望变得越来越强烈，你感觉到自己随着时间的流逝变得越来越虚弱和迟缓。</b>[pg]");
                     _loc1_ = true;
                  }
                  if(get_player().get_spe() > 1)
                  {
                     get_player().addStatusValue(StatusEffects.SlimeCraving,3,0.1);
                  }
                  if(int([DynStat.Str(-0.1),DynStat.Spe(-0.1),DynStat.Lust(2)].length) == 0)
                  {
                     get_game().player.dynStats();
                  }
                  else if(int([DynStat.Str(-0.1),DynStat.Spe(-0.1),DynStat.Lust(2)].length) == 1)
                  {
                     get_game().player.dynStats([DynStat.Str(-0.1),DynStat.Spe(-0.1),DynStat.Lust(2)][0]);
                  }
                  else if(int([DynStat.Str(-0.1),DynStat.Spe(-0.1),DynStat.Lust(2)].length) == 2)
                  {
                     get_game().player.dynStats([DynStat.Str(-0.1),DynStat.Spe(-0.1),DynStat.Lust(2)][0],[DynStat.Str(-0.1),DynStat.Spe(-0.1),DynStat.Lust(2)][1]);
                  }
                  else if(int([DynStat.Str(-0.1),DynStat.Spe(-0.1),DynStat.Lust(2)].length) == 3)
                  {
                     get_game().player.dynStats([DynStat.Str(-0.1),DynStat.Spe(-0.1),DynStat.Lust(2)][0],[DynStat.Str(-0.1),DynStat.Spe(-0.1),DynStat.Lust(2)][1],[DynStat.Str(-0.1),DynStat.Spe(-0.1),DynStat.Lust(2)][2]);
                  }
                  else if(int([DynStat.Str(-0.1),DynStat.Spe(-0.1),DynStat.Lust(2)].length) == 4)
                  {
                     get_game().player.dynStats([DynStat.Str(-0.1),DynStat.Spe(-0.1),DynStat.Lust(2)][0],[DynStat.Str(-0.1),DynStat.Spe(-0.1),DynStat.Lust(2)][1],[DynStat.Str(-0.1),DynStat.Spe(-0.1),DynStat.Lust(2)][2],[DynStat.Str(-0.1),DynStat.Spe(-0.1),DynStat.Lust(2)][3]);
                  }
                  else if(int([DynStat.Str(-0.1),DynStat.Spe(-0.1),DynStat.Lust(2)].length) == 5)
                  {
                     get_game().player.dynStats([DynStat.Str(-0.1),DynStat.Spe(-0.1),DynStat.Lust(2)][0],[DynStat.Str(-0.1),DynStat.Spe(-0.1),DynStat.Lust(2)][1],[DynStat.Str(-0.1),DynStat.Spe(-0.1),DynStat.Lust(2)][2],[DynStat.Str(-0.1),DynStat.Spe(-0.1),DynStat.Lust(2)][3],[DynStat.Str(-0.1),DynStat.Spe(-0.1),DynStat.Lust(2)][4]);
                  }
                  else if(int([DynStat.Str(-0.1),DynStat.Spe(-0.1),DynStat.Lust(2)].length) == 6)
                  {
                     get_game().player.dynStats([DynStat.Str(-0.1),DynStat.Spe(-0.1),DynStat.Lust(2)][0],[DynStat.Str(-0.1),DynStat.Spe(-0.1),DynStat.Lust(2)][1],[DynStat.Str(-0.1),DynStat.Spe(-0.1),DynStat.Lust(2)][2],[DynStat.Str(-0.1),DynStat.Spe(-0.1),DynStat.Lust(2)][3],[DynStat.Str(-0.1),DynStat.Spe(-0.1),DynStat.Lust(2)][4],[DynStat.Str(-0.1),DynStat.Spe(-0.1),DynStat.Lust(2)][5]);
                  }
                  else if(int([DynStat.Str(-0.1),DynStat.Spe(-0.1),DynStat.Lust(2)].length) == 7)
                  {
                     get_game().player.dynStats([DynStat.Str(-0.1),DynStat.Spe(-0.1),DynStat.Lust(2)][0],[DynStat.Str(-0.1),DynStat.Spe(-0.1),DynStat.Lust(2)][1],[DynStat.Str(-0.1),DynStat.Spe(-0.1),DynStat.Lust(2)][2],[DynStat.Str(-0.1),DynStat.Spe(-0.1),DynStat.Lust(2)][3],[DynStat.Str(-0.1),DynStat.Spe(-0.1),DynStat.Lust(2)][4],[DynStat.Str(-0.1),DynStat.Spe(-0.1),DynStat.Lust(2)][5],[DynStat.Str(-0.1),DynStat.Spe(-0.1),DynStat.Lust(2)][6]);
                  }
                  else if(int([DynStat.Str(-0.1),DynStat.Spe(-0.1),DynStat.Lust(2)].length) == 8)
                  {
                     get_game().player.dynStats([DynStat.Str(-0.1),DynStat.Spe(-0.1),DynStat.Lust(2)][0],[DynStat.Str(-0.1),DynStat.Spe(-0.1),DynStat.Lust(2)][1],[DynStat.Str(-0.1),DynStat.Spe(-0.1),DynStat.Lust(2)][2],[DynStat.Str(-0.1),DynStat.Spe(-0.1),DynStat.Lust(2)][3],[DynStat.Str(-0.1),DynStat.Spe(-0.1),DynStat.Lust(2)][4],[DynStat.Str(-0.1),DynStat.Spe(-0.1),DynStat.Lust(2)][5],[DynStat.Str(-0.1),DynStat.Spe(-0.1),DynStat.Lust(2)][6],[DynStat.Str(-0.1),DynStat.Spe(-0.1),DynStat.Lust(2)][7]);
                  }
                  else if(int([DynStat.Str(-0.1),DynStat.Spe(-0.1),DynStat.Lust(2)].length) == 9)
                  {
                     get_game().player.dynStats([DynStat.Str(-0.1),DynStat.Spe(-0.1),DynStat.Lust(2)][0],[DynStat.Str(-0.1),DynStat.Spe(-0.1),DynStat.Lust(2)][1],[DynStat.Str(-0.1),DynStat.Spe(-0.1),DynStat.Lust(2)][2],[DynStat.Str(-0.1),DynStat.Spe(-0.1),DynStat.Lust(2)][3],[DynStat.Str(-0.1),DynStat.Spe(-0.1),DynStat.Lust(2)][4],[DynStat.Str(-0.1),DynStat.Spe(-0.1),DynStat.Lust(2)][5],[DynStat.Str(-0.1),DynStat.Spe(-0.1),DynStat.Lust(2)][6],[DynStat.Str(-0.1),DynStat.Spe(-0.1),DynStat.Lust(2)][7],[DynStat.Str(-0.1),DynStat.Spe(-0.1),DynStat.Lust(2)][8]);
                  }
                  else if(int([DynStat.Str(-0.1),DynStat.Spe(-0.1),DynStat.Lust(2)].length) == 10)
                  {
                     get_game().player.dynStats([DynStat.Str(-0.1),DynStat.Spe(-0.1),DynStat.Lust(2)][0],[DynStat.Str(-0.1),DynStat.Spe(-0.1),DynStat.Lust(2)][1],[DynStat.Str(-0.1),DynStat.Spe(-0.1),DynStat.Lust(2)][2],[DynStat.Str(-0.1),DynStat.Spe(-0.1),DynStat.Lust(2)][3],[DynStat.Str(-0.1),DynStat.Spe(-0.1),DynStat.Lust(2)][4],[DynStat.Str(-0.1),DynStat.Spe(-0.1),DynStat.Lust(2)][5],[DynStat.Str(-0.1),DynStat.Spe(-0.1),DynStat.Lust(2)][6],[DynStat.Str(-0.1),DynStat.Spe(-0.1),DynStat.Lust(2)][7],[DynStat.Str(-0.1),DynStat.Spe(-0.1),DynStat.Lust(2)][8],[DynStat.Str(-0.1),DynStat.Spe(-0.1),DynStat.Lust(2)][9]);
                  }
                  else if(int([DynStat.Str(-0.1),DynStat.Spe(-0.1),DynStat.Lust(2)].length) == 11)
                  {
                     get_game().player.dynStats([DynStat.Str(-0.1),DynStat.Spe(-0.1),DynStat.Lust(2)][0],[DynStat.Str(-0.1),DynStat.Spe(-0.1),DynStat.Lust(2)][1],[DynStat.Str(-0.1),DynStat.Spe(-0.1),DynStat.Lust(2)][2],[DynStat.Str(-0.1),DynStat.Spe(-0.1),DynStat.Lust(2)][3],[DynStat.Str(-0.1),DynStat.Spe(-0.1),DynStat.Lust(2)][4],[DynStat.Str(-0.1),DynStat.Spe(-0.1),DynStat.Lust(2)][5],[DynStat.Str(-0.1),DynStat.Spe(-0.1),DynStat.Lust(2)][6],[DynStat.Str(-0.1),DynStat.Spe(-0.1),DynStat.Lust(2)][7],[DynStat.Str(-0.1),DynStat.Spe(-0.1),DynStat.Lust(2)][8],[DynStat.Str(-0.1),DynStat.Spe(-0.1),DynStat.Lust(2)][9],[DynStat.Str(-0.1),DynStat.Spe(-0.1),DynStat.Lust(2)][10]);
                  }
                  else if(int([DynStat.Str(-0.1),DynStat.Spe(-0.1),DynStat.Lust(2)].length) == 12)
                  {
                     get_game().player.dynStats([DynStat.Str(-0.1),DynStat.Spe(-0.1),DynStat.Lust(2)][0],[DynStat.Str(-0.1),DynStat.Spe(-0.1),DynStat.Lust(2)][1],[DynStat.Str(-0.1),DynStat.Spe(-0.1),DynStat.Lust(2)][2],[DynStat.Str(-0.1),DynStat.Spe(-0.1),DynStat.Lust(2)][3],[DynStat.Str(-0.1),DynStat.Spe(-0.1),DynStat.Lust(2)][4],[DynStat.Str(-0.1),DynStat.Spe(-0.1),DynStat.Lust(2)][5],[DynStat.Str(-0.1),DynStat.Spe(-0.1),DynStat.Lust(2)][6],[DynStat.Str(-0.1),DynStat.Spe(-0.1),DynStat.Lust(2)][7],[DynStat.Str(-0.1),DynStat.Spe(-0.1),DynStat.Lust(2)][8],[DynStat.Str(-0.1),DynStat.Spe(-0.1),DynStat.Lust(2)][9],[DynStat.Str(-0.1),DynStat.Spe(-0.1),DynStat.Lust(2)][10],[DynStat.Str(-0.1),DynStat.Spe(-0.1),DynStat.Lust(2)][11]);
                  }
                  else if(int([DynStat.Str(-0.1),DynStat.Spe(-0.1),DynStat.Lust(2)].length) == 13)
                  {
                     get_game().player.dynStats([DynStat.Str(-0.1),DynStat.Spe(-0.1),DynStat.Lust(2)][0],[DynStat.Str(-0.1),DynStat.Spe(-0.1),DynStat.Lust(2)][1],[DynStat.Str(-0.1),DynStat.Spe(-0.1),DynStat.Lust(2)][2],[DynStat.Str(-0.1),DynStat.Spe(-0.1),DynStat.Lust(2)][3],[DynStat.Str(-0.1),DynStat.Spe(-0.1),DynStat.Lust(2)][4],[DynStat.Str(-0.1),DynStat.Spe(-0.1),DynStat.Lust(2)][5],[DynStat.Str(-0.1),DynStat.Spe(-0.1),DynStat.Lust(2)][6],[DynStat.Str(-0.1),DynStat.Spe(-0.1),DynStat.Lust(2)][7],[DynStat.Str(-0.1),DynStat.Spe(-0.1),DynStat.Lust(2)][8],[DynStat.Str(-0.1),DynStat.Spe(-0.1),DynStat.Lust(2)][9],[DynStat.Str(-0.1),DynStat.Spe(-0.1),DynStat.Lust(2)][10],[DynStat.Str(-0.1),DynStat.Spe(-0.1),DynStat.Lust(2)][11],[DynStat.Str(-0.1),DynStat.Spe(-0.1),DynStat.Lust(2)][12]);
                  }
                  else if(int([DynStat.Str(-0.1),DynStat.Spe(-0.1),DynStat.Lust(2)].length) == 14)
                  {
                     get_game().player.dynStats([DynStat.Str(-0.1),DynStat.Spe(-0.1),DynStat.Lust(2)][0],[DynStat.Str(-0.1),DynStat.Spe(-0.1),DynStat.Lust(2)][1],[DynStat.Str(-0.1),DynStat.Spe(-0.1),DynStat.Lust(2)][2],[DynStat.Str(-0.1),DynStat.Spe(-0.1),DynStat.Lust(2)][3],[DynStat.Str(-0.1),DynStat.Spe(-0.1),DynStat.Lust(2)][4],[DynStat.Str(-0.1),DynStat.Spe(-0.1),DynStat.Lust(2)][5],[DynStat.Str(-0.1),DynStat.Spe(-0.1),DynStat.Lust(2)][6],[DynStat.Str(-0.1),DynStat.Spe(-0.1),DynStat.Lust(2)][7],[DynStat.Str(-0.1),DynStat.Spe(-0.1),DynStat.Lust(2)][8],[DynStat.Str(-0.1),DynStat.Spe(-0.1),DynStat.Lust(2)][9],[DynStat.Str(-0.1),DynStat.Spe(-0.1),DynStat.Lust(2)][10],[DynStat.Str(-0.1),DynStat.Spe(-0.1),DynStat.Lust(2)][11],[DynStat.Str(-0.1),DynStat.Spe(-0.1),DynStat.Lust(2)][12],[DynStat.Str(-0.1),DynStat.Spe(-0.1),DynStat.Lust(2)][13]);
                  }
                  else if(int([DynStat.Str(-0.1),DynStat.Spe(-0.1),DynStat.Lust(2)].length) == 15)
                  {
                     get_game().player.dynStats([DynStat.Str(-0.1),DynStat.Spe(-0.1),DynStat.Lust(2)][0],[DynStat.Str(-0.1),DynStat.Spe(-0.1),DynStat.Lust(2)][1],[DynStat.Str(-0.1),DynStat.Spe(-0.1),DynStat.Lust(2)][2],[DynStat.Str(-0.1),DynStat.Spe(-0.1),DynStat.Lust(2)][3],[DynStat.Str(-0.1),DynStat.Spe(-0.1),DynStat.Lust(2)][4],[DynStat.Str(-0.1),DynStat.Spe(-0.1),DynStat.Lust(2)][5],[DynStat.Str(-0.1),DynStat.Spe(-0.1),DynStat.Lust(2)][6],[DynStat.Str(-0.1),DynStat.Spe(-0.1),DynStat.Lust(2)][7],[DynStat.Str(-0.1),DynStat.Spe(-0.1),DynStat.Lust(2)][8],[DynStat.Str(-0.1),DynStat.Spe(-0.1),DynStat.Lust(2)][9],[DynStat.Str(-0.1),DynStat.Spe(-0.1),DynStat.Lust(2)][10],[DynStat.Str(-0.1),DynStat.Spe(-0.1),DynStat.Lust(2)][11],[DynStat.Str(-0.1),DynStat.Spe(-0.1),DynStat.Lust(2)][12],[DynStat.Str(-0.1),DynStat.Spe(-0.1),DynStat.Lust(2)][13],[DynStat.Str(-0.1),DynStat.Spe(-0.1),DynStat.Lust(2)][14]);
                  }
                  else if(int([DynStat.Str(-0.1),DynStat.Spe(-0.1),DynStat.Lust(2)].length) == 16)
                  {
                     get_game().player.dynStats([DynStat.Str(-0.1),DynStat.Spe(-0.1),DynStat.Lust(2)][0],[DynStat.Str(-0.1),DynStat.Spe(-0.1),DynStat.Lust(2)][1],[DynStat.Str(-0.1),DynStat.Spe(-0.1),DynStat.Lust(2)][2],[DynStat.Str(-0.1),DynStat.Spe(-0.1),DynStat.Lust(2)][3],[DynStat.Str(-0.1),DynStat.Spe(-0.1),DynStat.Lust(2)][4],[DynStat.Str(-0.1),DynStat.Spe(-0.1),DynStat.Lust(2)][5],[DynStat.Str(-0.1),DynStat.Spe(-0.1),DynStat.Lust(2)][6],[DynStat.Str(-0.1),DynStat.Spe(-0.1),DynStat.Lust(2)][7],[DynStat.Str(-0.1),DynStat.Spe(-0.1),DynStat.Lust(2)][8],[DynStat.Str(-0.1),DynStat.Spe(-0.1),DynStat.Lust(2)][9],[DynStat.Str(-0.1),DynStat.Spe(-0.1),DynStat.Lust(2)][10],[DynStat.Str(-0.1),DynStat.Spe(-0.1),DynStat.Lust(2)][11],[DynStat.Str(-0.1),DynStat.Spe(-0.1),DynStat.Lust(2)][12],[DynStat.Str(-0.1),DynStat.Spe(-0.1),DynStat.Lust(2)][13],[DynStat.Str(-0.1),DynStat.Spe(-0.1),DynStat.Lust(2)][14],[DynStat.Str(-0.1),DynStat.Spe(-0.1),DynStat.Lust(2)][15]);
                  }
                  else if(int([DynStat.Str(-0.1),DynStat.Spe(-0.1),DynStat.Lust(2)].length) == 17)
                  {
                     get_game().player.dynStats([DynStat.Str(-0.1),DynStat.Spe(-0.1),DynStat.Lust(2)][0],[DynStat.Str(-0.1),DynStat.Spe(-0.1),DynStat.Lust(2)][1],[DynStat.Str(-0.1),DynStat.Spe(-0.1),DynStat.Lust(2)][2],[DynStat.Str(-0.1),DynStat.Spe(-0.1),DynStat.Lust(2)][3],[DynStat.Str(-0.1),DynStat.Spe(-0.1),DynStat.Lust(2)][4],[DynStat.Str(-0.1),DynStat.Spe(-0.1),DynStat.Lust(2)][5],[DynStat.Str(-0.1),DynStat.Spe(-0.1),DynStat.Lust(2)][6],[DynStat.Str(-0.1),DynStat.Spe(-0.1),DynStat.Lust(2)][7],[DynStat.Str(-0.1),DynStat.Spe(-0.1),DynStat.Lust(2)][8],[DynStat.Str(-0.1),DynStat.Spe(-0.1),DynStat.Lust(2)][9],[DynStat.Str(-0.1),DynStat.Spe(-0.1),DynStat.Lust(2)][10],[DynStat.Str(-0.1),DynStat.Spe(-0.1),DynStat.Lust(2)][11],[DynStat.Str(-0.1),DynStat.Spe(-0.1),DynStat.Lust(2)][12],[DynStat.Str(-0.1),DynStat.Spe(-0.1),DynStat.Lust(2)][13],[DynStat.Str(-0.1),DynStat.Spe(-0.1),DynStat.Lust(2)][14],[DynStat.Str(-0.1),DynStat.Spe(-0.1),DynStat.Lust(2)][15],[DynStat.Str(-0.1),DynStat.Spe(-0.1),DynStat.Lust(2)][16]);
                  }
                  else if(int([DynStat.Str(-0.1),DynStat.Spe(-0.1),DynStat.Lust(2)].length) == 18)
                  {
                     get_game().player.dynStats([DynStat.Str(-0.1),DynStat.Spe(-0.1),DynStat.Lust(2)][0],[DynStat.Str(-0.1),DynStat.Spe(-0.1),DynStat.Lust(2)][1],[DynStat.Str(-0.1),DynStat.Spe(-0.1),DynStat.Lust(2)][2],[DynStat.Str(-0.1),DynStat.Spe(-0.1),DynStat.Lust(2)][3],[DynStat.Str(-0.1),DynStat.Spe(-0.1),DynStat.Lust(2)][4],[DynStat.Str(-0.1),DynStat.Spe(-0.1),DynStat.Lust(2)][5],[DynStat.Str(-0.1),DynStat.Spe(-0.1),DynStat.Lust(2)][6],[DynStat.Str(-0.1),DynStat.Spe(-0.1),DynStat.Lust(2)][7],[DynStat.Str(-0.1),DynStat.Spe(-0.1),DynStat.Lust(2)][8],[DynStat.Str(-0.1),DynStat.Spe(-0.1),DynStat.Lust(2)][9],[DynStat.Str(-0.1),DynStat.Spe(-0.1),DynStat.Lust(2)][10],[DynStat.Str(-0.1),DynStat.Spe(-0.1),DynStat.Lust(2)][11],[DynStat.Str(-0.1),DynStat.Spe(-0.1),DynStat.Lust(2)][12],[DynStat.Str(-0.1),DynStat.Spe(-0.1),DynStat.Lust(2)][13],[DynStat.Str(-0.1),DynStat.Spe(-0.1),DynStat.Lust(2)][14],[DynStat.Str(-0.1),DynStat.Spe(-0.1),DynStat.Lust(2)][15],[DynStat.Str(-0.1),DynStat.Spe(-0.1),DynStat.Lust(2)][16]
                     ,[DynStat.Str(-0.1),DynStat.Spe(-0.1),DynStat.Lust(2)][17]);
                  }
                  else if(int([DynStat.Str(-0.1),DynStat.Spe(-0.1),DynStat.Lust(2)].length) == 19)
                  {
                     get_game().player.dynStats([DynStat.Str(-0.1),DynStat.Spe(-0.1),DynStat.Lust(2)][0],[DynStat.Str(-0.1),DynStat.Spe(-0.1),DynStat.Lust(2)][1],[DynStat.Str(-0.1),DynStat.Spe(-0.1),DynStat.Lust(2)][2],[DynStat.Str(-0.1),DynStat.Spe(-0.1),DynStat.Lust(2)][3],[DynStat.Str(-0.1),DynStat.Spe(-0.1),DynStat.Lust(2)][4],[DynStat.Str(-0.1),DynStat.Spe(-0.1),DynStat.Lust(2)][5],[DynStat.Str(-0.1),DynStat.Spe(-0.1),DynStat.Lust(2)][6],[DynStat.Str(-0.1),DynStat.Spe(-0.1),DynStat.Lust(2)][7],[DynStat.Str(-0.1),DynStat.Spe(-0.1),DynStat.Lust(2)][8],[DynStat.Str(-0.1),DynStat.Spe(-0.1),DynStat.Lust(2)][9],[DynStat.Str(-0.1),DynStat.Spe(-0.1),DynStat.Lust(2)][10],[DynStat.Str(-0.1),DynStat.Spe(-0.1),DynStat.Lust(2)][11],[DynStat.Str(-0.1),DynStat.Spe(-0.1),DynStat.Lust(2)][12],[DynStat.Str(-0.1),DynStat.Spe(-0.1),DynStat.Lust(2)][13],[DynStat.Str(-0.1),DynStat.Spe(-0.1),DynStat.Lust(2)][14],[DynStat.Str(-0.1),DynStat.Spe(-0.1),DynStat.Lust(2)][15],[DynStat.Str(-0.1),DynStat.Spe(-0.1),DynStat.Lust(2)][16]
                     ,[DynStat.Str(-0.1),DynStat.Spe(-0.1),DynStat.Lust(2)][17],[DynStat.Str(-0.1),DynStat.Spe(-0.1),DynStat.Lust(2)][18]);
                  }
                  else
                  {
                     if(int([DynStat.Str(-0.1),DynStat.Spe(-0.1),DynStat.Lust(2)].length) != 20)
                     {
                        throw "Too many rest arguments";
                     }
                     get_game().player.dynStats([DynStat.Str(-0.1),DynStat.Spe(-0.1),DynStat.Lust(2)][0],[DynStat.Str(-0.1),DynStat.Spe(-0.1),DynStat.Lust(2)][1],[DynStat.Str(-0.1),DynStat.Spe(-0.1),DynStat.Lust(2)][2],[DynStat.Str(-0.1),DynStat.Spe(-0.1),DynStat.Lust(2)][3],[DynStat.Str(-0.1),DynStat.Spe(-0.1),DynStat.Lust(2)][4],[DynStat.Str(-0.1),DynStat.Spe(-0.1),DynStat.Lust(2)][5],[DynStat.Str(-0.1),DynStat.Spe(-0.1),DynStat.Lust(2)][6],[DynStat.Str(-0.1),DynStat.Spe(-0.1),DynStat.Lust(2)][7],[DynStat.Str(-0.1),DynStat.Spe(-0.1),DynStat.Lust(2)][8],[DynStat.Str(-0.1),DynStat.Spe(-0.1),DynStat.Lust(2)][9],[DynStat.Str(-0.1),DynStat.Spe(-0.1),DynStat.Lust(2)][10],[DynStat.Str(-0.1),DynStat.Spe(-0.1),DynStat.Lust(2)][11],[DynStat.Str(-0.1),DynStat.Spe(-0.1),DynStat.Lust(2)][12],[DynStat.Str(-0.1),DynStat.Spe(-0.1),DynStat.Lust(2)][13],[DynStat.Str(-0.1),DynStat.Spe(-0.1),DynStat.Lust(2)][14],[DynStat.Str(-0.1),DynStat.Spe(-0.1),DynStat.Lust(2)][15],[DynStat.Str(-0.1),DynStat.Spe(-0.1),DynStat.Lust(2)][16]
                     ,[DynStat.Str(-0.1),DynStat.Spe(-0.1),DynStat.Lust(2)][17],[DynStat.Str(-0.1),DynStat.Spe(-0.1),DynStat.Lust(2)][18],[DynStat.Str(-0.1),DynStat.Spe(-0.1),DynStat.Lust(2)][19]);
                  }
                  get_player().addStatusValue(StatusEffects.SlimeCraving,2,0.1);
               }
            }
         }
         if(get_player().hasStatusEffect(StatusEffects.SlimeCravingFeed))
         {
            outputText("<b>你从最近的摄入中感到恢复了活力，但很快你就会需要更多……</b>[pg]");
            _loc8_ = get_game();
            _loc9_ = [DynStat.Str(get_player().statusEffectv2(StatusEffects.SlimeCraving) * 0.5),DynStat.Spe(get_player().statusEffectv3(StatusEffects.SlimeCraving))];
            if(int(_loc9_.length) == 0)
            {
               _loc8_.player.dynStats();
            }
            else if(int(_loc9_.length) == 1)
            {
               _loc8_.player.dynStats(_loc9_[0]);
            }
            else if(int(_loc9_.length) == 2)
            {
               _loc8_.player.dynStats(_loc9_[0],_loc9_[1]);
            }
            else if(int(_loc9_.length) == 3)
            {
               _loc8_.player.dynStats(_loc9_[0],_loc9_[1],_loc9_[2]);
            }
            else if(int(_loc9_.length) == 4)
            {
               _loc8_.player.dynStats(_loc9_[0],_loc9_[1],_loc9_[2],_loc9_[3]);
            }
            else if(int(_loc9_.length) == 5)
            {
               _loc8_.player.dynStats(_loc9_[0],_loc9_[1],_loc9_[2],_loc9_[3],_loc9_[4]);
            }
            else if(int(_loc9_.length) == 6)
            {
               _loc8_.player.dynStats(_loc9_[0],_loc9_[1],_loc9_[2],_loc9_[3],_loc9_[4],_loc9_[5]);
            }
            else if(int(_loc9_.length) == 7)
            {
               _loc8_.player.dynStats(_loc9_[0],_loc9_[1],_loc9_[2],_loc9_[3],_loc9_[4],_loc9_[5],_loc9_[6]);
            }
            else if(int(_loc9_.length) == 8)
            {
               _loc8_.player.dynStats(_loc9_[0],_loc9_[1],_loc9_[2],_loc9_[3],_loc9_[4],_loc9_[5],_loc9_[6],_loc9_[7]);
            }
            else if(int(_loc9_.length) == 9)
            {
               _loc8_.player.dynStats(_loc9_[0],_loc9_[1],_loc9_[2],_loc9_[3],_loc9_[4],_loc9_[5],_loc9_[6],_loc9_[7],_loc9_[8]);
            }
            else if(int(_loc9_.length) == 10)
            {
               _loc8_.player.dynStats(_loc9_[0],_loc9_[1],_loc9_[2],_loc9_[3],_loc9_[4],_loc9_[5],_loc9_[6],_loc9_[7],_loc9_[8],_loc9_[9]);
            }
            else if(int(_loc9_.length) == 11)
            {
               _loc8_.player.dynStats(_loc9_[0],_loc9_[1],_loc9_[2],_loc9_[3],_loc9_[4],_loc9_[5],_loc9_[6],_loc9_[7],_loc9_[8],_loc9_[9],_loc9_[10]);
            }
            else if(int(_loc9_.length) == 12)
            {
               _loc8_.player.dynStats(_loc9_[0],_loc9_[1],_loc9_[2],_loc9_[3],_loc9_[4],_loc9_[5],_loc9_[6],_loc9_[7],_loc9_[8],_loc9_[9],_loc9_[10],_loc9_[11]);
            }
            else if(int(_loc9_.length) == 13)
            {
               _loc8_.player.dynStats(_loc9_[0],_loc9_[1],_loc9_[2],_loc9_[3],_loc9_[4],_loc9_[5],_loc9_[6],_loc9_[7],_loc9_[8],_loc9_[9],_loc9_[10],_loc9_[11],_loc9_[12]);
            }
            else if(int(_loc9_.length) == 14)
            {
               _loc8_.player.dynStats(_loc9_[0],_loc9_[1],_loc9_[2],_loc9_[3],_loc9_[4],_loc9_[5],_loc9_[6],_loc9_[7],_loc9_[8],_loc9_[9],_loc9_[10],_loc9_[11],_loc9_[12],_loc9_[13]);
            }
            else if(int(_loc9_.length) == 15)
            {
               _loc8_.player.dynStats(_loc9_[0],_loc9_[1],_loc9_[2],_loc9_[3],_loc9_[4],_loc9_[5],_loc9_[6],_loc9_[7],_loc9_[8],_loc9_[9],_loc9_[10],_loc9_[11],_loc9_[12],_loc9_[13],_loc9_[14]);
            }
            else if(int(_loc9_.length) == 16)
            {
               _loc8_.player.dynStats(_loc9_[0],_loc9_[1],_loc9_[2],_loc9_[3],_loc9_[4],_loc9_[5],_loc9_[6],_loc9_[7],_loc9_[8],_loc9_[9],_loc9_[10],_loc9_[11],_loc9_[12],_loc9_[13],_loc9_[14],_loc9_[15]);
            }
            else if(int(_loc9_.length) == 17)
            {
               _loc8_.player.dynStats(_loc9_[0],_loc9_[1],_loc9_[2],_loc9_[3],_loc9_[4],_loc9_[5],_loc9_[6],_loc9_[7],_loc9_[8],_loc9_[9],_loc9_[10],_loc9_[11],_loc9_[12],_loc9_[13],_loc9_[14],_loc9_[15],_loc9_[16]);
            }
            else if(int(_loc9_.length) == 18)
            {
               _loc8_.player.dynStats(_loc9_[0],_loc9_[1],_loc9_[2],_loc9_[3],_loc9_[4],_loc9_[5],_loc9_[6],_loc9_[7],_loc9_[8],_loc9_[9],_loc9_[10],_loc9_[11],_loc9_[12],_loc9_[13],_loc9_[14],_loc9_[15],_loc9_[16],_loc9_[17]);
            }
            else if(int(_loc9_.length) == 19)
            {
               _loc8_.player.dynStats(_loc9_[0],_loc9_[1],_loc9_[2],_loc9_[3],_loc9_[4],_loc9_[5],_loc9_[6],_loc9_[7],_loc9_[8],_loc9_[9],_loc9_[10],_loc9_[11],_loc9_[12],_loc9_[13],_loc9_[14],_loc9_[15],_loc9_[16],_loc9_[17],_loc9_[18]);
            }
            else
            {
               if(int(_loc9_.length) != 20)
               {
                  throw "Too many rest arguments";
               }
               _loc8_.player.dynStats(_loc9_[0],_loc9_[1],_loc9_[2],_loc9_[3],_loc9_[4],_loc9_[5],_loc9_[6],_loc9_[7],_loc9_[8],_loc9_[9],_loc9_[10],_loc9_[11],_loc9_[12],_loc9_[13],_loc9_[14],_loc9_[15],_loc9_[16],_loc9_[17],_loc9_[18],_loc9_[19]);
            }
            get_player().removeStatusEffect(StatusEffects.SlimeCravingFeed);
            get_player().changeStatusValue(StatusEffects.SlimeCraving,2,0);
            _loc1_ = true;
         }
         if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,769) > 0)
         {
            if(get_player().get_armorName() == "lusty maiden\'s armor")
            {
               if(get_game().time.hours == 0)
               {
                  _loc2_ = 769;
                  FlagDict_Impl_.arrayWriteInt(KFLAGS.flags,_loc2_,FlagDict_Impl_.arrayReadInt(KFLAGS.flags,_loc2_) - 1);
               }
               if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,769) < 0)
               {
                  FlagDict_Impl_.arrayWriteInt(KFLAGS.flags,769,0);
               }
               if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,769) > 8)
               {
                  FlagDict_Impl_.arrayWriteInt(KFLAGS.flags,769,8);
               }
            }
            else
            {
               FlagDict_Impl_.arrayWriteInt(KFLAGS.flags,769,0);
            }
         }
         if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,125) > 0)
         {
            _loc2_ = 125;
            FlagDict_Impl_.arrayWriteInt(KFLAGS.flags,_loc2_,FlagDict_Impl_.arrayReadInt(KFLAGS.flags,_loc2_) - 1);
         }
         if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,641) > 0)
         {
            _loc5_ = KFLAGS.flags;
            FlagDict_Impl_.arrayWriteInt(_loc5_,641,FlagDict_Impl_.arrayReadInt(_loc5_,641) + 1);
         }
         if(get_game().time.hours > 23)
         {
            FlagDict_Impl_.arrayWriteInt(KFLAGS.flags,921,0);
            if(int(get_game().time.days % 2) == 0 && FlagDict_Impl_.arrayReadInt(KFLAGS.flags,914) > 0)
            {
               _loc2_ = 914;
               FlagDict_Impl_.arrayWriteInt(KFLAGS.flags,_loc2_,FlagDict_Impl_.arrayReadInt(KFLAGS.flags,_loc2_) - 1);
               if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,914) < 0)
               {
                  FlagDict_Impl_.arrayWriteInt(KFLAGS.flags,914,0);
               }
            }
            FlagDict_Impl_.arrayWriteInt(KFLAGS.flags,899,0);
            FlagDict_Impl_.arrayWriteInt(KFLAGS.flags,779,0);
            FlagDict_Impl_.arrayWriteInt(KFLAGS.flags,1253,0);
            if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,621) > 0)
            {
               _loc5_ = KFLAGS.flags;
               FlagDict_Impl_.arrayWriteInt(_loc5_,624,FlagDict_Impl_.arrayReadInt(_loc5_,624) + (2 + Utils.rand(4)));
            }
            FlagDict_Impl_.arrayWriteInt(KFLAGS.flags,570,0);
            FlagDict_Impl_.arrayWriteInt(KFLAGS.flags,1302,0);
            get_game().bazaar.benoit.updateBenoitInventory();
            FlagDict_Impl_.arrayWriteInt(KFLAGS.flags,411,0);
            if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,285) > 0)
            {
               _loc2_ = 285;
               FlagDict_Impl_.arrayWriteInt(KFLAGS.flags,_loc2_,FlagDict_Impl_.arrayReadInt(KFLAGS.flags,_loc2_) - 1);
            }
            if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,155) > 0)
            {
               _loc2_ = 155;
               FlagDict_Impl_.arrayWriteInt(KFLAGS.flags,_loc2_,FlagDict_Impl_.arrayReadInt(KFLAGS.flags,_loc2_) - 1);
               if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,155) < 0)
               {
                  FlagDict_Impl_.arrayWriteInt(KFLAGS.flags,155,0);
               }
            }
            if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,692) > 0)
            {
               _loc2_ = 692;
               FlagDict_Impl_.arrayWriteInt(KFLAGS.flags,_loc2_,FlagDict_Impl_.arrayReadInt(KFLAGS.flags,_loc2_) - 1);
               if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,692) < 0)
               {
                  FlagDict_Impl_.arrayWriteInt(KFLAGS.flags,692,0);
               }
            }
            if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,120) > 0)
            {
               _loc2_ = 120;
               FlagDict_Impl_.arrayWriteInt(KFLAGS.flags,_loc2_,FlagDict_Impl_.arrayReadInt(KFLAGS.flags,_loc2_) - 1);
               if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,120) < 0)
               {
                  FlagDict_Impl_.arrayWriteInt(KFLAGS.flags,120,0);
               }
            }
            if(int(get_game().time.days % 7) == 0)
            {
               FlagDict_Impl_.arrayWriteInt(KFLAGS.flags,104,0);
            }
            if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,112) > 0)
            {
               FlagDict_Impl_.arrayWriteInt(KFLAGS.flags,112,0);
            }
            if(get_game().latexGirl.latexGooFollower())
            {
               get_game().latexGirl.gooFluid(-2,false);
               if(get_game().latexGirl.gooFluid() < 50)
               {
                  get_game().latexGirl.gooHappiness(-1,false);
               }
               if(get_game().latexGirl.gooFluid() < 25)
               {
                  get_game().latexGirl.gooHappiness(-1,false);
               }
               if(get_game().latexGirl.gooHappiness() < 75)
               {
                  get_game().latexGirl.gooObedience(-1,false);
               }
               if(get_game().latexGirl.gooHappiness() >= 90)
               {
                  get_game().latexGirl.gooObedience(1,false);
               }
            }
            get_game().farm.farmCorruption.updateFarmCorruption();
            if(get_player().hasStatusEffect(StatusEffects.Contraceptives))
            {
               if(get_player().statusEffectv1(StatusEffects.Contraceptives) == 1)
               {
                  get_player().addStatusValue(StatusEffects.Contraceptives,2,-1);
                  if(get_player().statusEffectv1(StatusEffects.Contraceptives) < 0)
                  {
                     get_player().removeStatusEffect(StatusEffects.Contraceptives);
                  }
               }
            }
            if(get_player().statusEffectv1(StatusEffects.SharkGirl) > 0)
            {
               get_player().addStatusValue(StatusEffects.SharkGirl,1,-1);
            }
            if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,25) > 0)
            {
               switch(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,26))
               {
                  case 1:
                     if(!_loc1_)
                     {
                        _loc1_ = get_player().growHair(0.2);
                     }
                     else
                     {
                        get_player().growHair(0.2);
                     }
                     break;
                  case 2:
                     if(!_loc1_)
                     {
                        _loc1_ = get_player().growHair(0.5);
                     }
                     else
                     {
                        get_player().growHair(0.5);
                     }
                     break;
                  case 3:
                     if(!_loc1_)
                     {
                        _loc1_ = get_player().growHair(1.1);
                        break;
                     }
                     get_player().growHair(1.1);
               }
               _loc2_ = 25;
               FlagDict_Impl_.arrayWriteInt(KFLAGS.flags,_loc2_,FlagDict_Impl_.arrayReadInt(KFLAGS.flags,_loc2_) - 1);
               if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,25) <= 0)
               {
                  FlagDict_Impl_.arrayWriteInt(KFLAGS.flags,25,0);
                  FlagDict_Impl_.arrayWriteInt(KFLAGS.flags,26,0);
                  outputText("<b>头皮上的刺痛感慢慢消退，接发精华液的药效过去了。也许是时候回沙龙再弄点儿了？</b>");
                  if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,66) > 0)
                  {
                     FlagDict_Impl_.arrayWriteInt(KFLAGS.flags,66,0);
                     outputText("<b>你的头发现在又开始正常生长了。</b>");
                  }
                  outputText("[pg]");
                  _loc1_ = true;
               }
            }
            if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,66) == 0)
            {
               if(!_loc1_)
               {
                  _loc1_ = get_player().growHair(0.1);
               }
               else
               {
                  get_player().growHair(0.1);
               }
               if(get_player().beard.length > 0 && get_player().beard.length < 12)
               {
                  get_player().growBeard(0.02);
               }
            }
            if(get_player().hasStatusEffect(StatusEffects.DragonBreathCooldown))
            {
               get_player().removeStatusEffect(StatusEffects.DragonBreathCooldown);
            }
         }
         if(FlagDict_Impl_.arrayReadFloat(KFLAGS.flags,2273) > 0)
         {
            _loc2_ = 2273;
            FlagDict_Impl_.arrayWriteFloat(KFLAGS.flags,_loc2_,FlagDict_Impl_.arrayReadFloat(KFLAGS.flags,_loc2_) - 1);
         }
         return _loc1_;
      }
   }
}

