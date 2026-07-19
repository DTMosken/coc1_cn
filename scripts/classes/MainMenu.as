package classes
{
   import classes.display.GameViewData;
   import classes.display.ScreenType;
   import coc.view.BitmapDataSprite;
   import coc.view.Block;
   import coc.view.ButtonData;
   import coc.view.CoCButton;
   import coc.view.LayoutConfig;
   import coc.view.MainView;
   import coc.view.Theme;
   import coc.view.ThemeObserver;
   import coc.view.Warning;
   import com.bit101.components.SearchBar;
   import flash.Boot;
   import flash.display.Bitmap;
   import flash.display.DisplayObject;
   import flash.events.Event;
   import flash.system.System;
   import flash.text.Font;
   import flash.text.TextField;
   import flash.text.TextFormat;
   import haxe.Serializer;
   import haxe.Unserializer;
   import openfl.utils.Assets;
   
   public class MainMenu extends BaseContent implements ThemeObserver
   {
      
      public static var init__:Boolean;
      
      public static var _hggConfig:Credits;
      
      public static var _revampConfig:Credits;
      
      public static var lstMarker:String = "   •  ";
      
      public var buttonData:Array;
      
      public var _versionInfo:TextField;
      
      public var _searchedArray:Array;
      
      public var _searchBar:SearchBar;
      
      public var _miniCredit:TextField;
      
      public var _mainMenu:Block;
      
      public var _disclaimerIcon:BitmapDataSprite;
      
      public var _disclaimerBackground:BitmapDataSprite;
      
      public var _currentScreen:int;
      
      public var _creditsInfo:Credits;
      
      public var _cocLogo:BitmapDataSprite;
      
      public function MainMenu()
      {
         if(Boot.skip_constructor)
         {
            return;
         }
         _searchBar = new SearchBar();
         _currentScreen = 0;
         buttonData = [];
         super();
         Theme.subscribe(this);
      }
      
      public static function tallyString(param1:String, param2:Array) : int
      {
         var _loc5_:* = null as String;
         var _loc3_:int = 0;
         var _loc4_:int = 0;
         while(_loc4_ < int(param2.length))
         {
            _loc5_ = param2[_loc4_];
            _loc4_++;
            if(param1.toLowerCase().indexOf(_loc5_) > -1)
            {
               _loc3_++;
            }
         }
         return _loc3_;
      }
      
      public static function tallyConts(param1:Contribution, param2:Array) : int
      {
         var _loc3_:* = null as String;
         var _loc4_:* = null as Array;
         var _loc5_:int = 0;
         var _loc6_:int = 0;
         var _loc7_:* = null as String;
         switch(param1.index)
         {
            case 0:
               _loc3_ = param1.params[0];
               return MainMenu.tallyString(_loc3_,param2);
            case 1:
               _loc3_ = param1.params[0];
               _loc4_ = param1.params[1];
               _loc5_ = MainMenu.tallyString(_loc3_,param2);
               _loc6_ = 0;
               while(_loc6_ < int(_loc4_.length))
               {
                  _loc7_ = _loc4_[_loc6_];
                  _loc6_++;
                  _loc5_ += MainMenu.tallyString(_loc7_,param2);
               }
               return _loc5_;
            default:
               return;
         }
      }
      
      public static function conts(param1:Array) : Array
      {
         return param1;
      }
      
      public function vanillaCreditsScreen() : void
      {
         displayHeader("原版游戏制作人员名单");
         outputText("[b: 编程与主要事件:]\n");
         rawOutputText("   •  " + " Fenoxo\n\n");
         outputText("[b: 错别字报告]\n");
         rawOutputText("   •  " + " SoS\n");
         rawOutputText("   •  " + " Prisoner416\n");
         rawOutputText("   •  " + " Chibodee\n");
         outputText("[b: 图像美化:]\n");
         rawOutputText("   •  " + " Dasutin (背景图像)\n");
         rawOutputText("   •  " + " Invader (按钮图形、字体及其他酷炫设计)\n");
         outputText("[b: 补充事件：]\n");
         rawOutputText("   •  " + " Dxasmodeus（触手，蠕虫，贾科莫）\n");
         rawOutputText("   •  " + " Kirbster（圣诞兔陷阱）\n");
         rawOutputText("   •  " + " nRage（圣诞袋鼠卡米）\n");
         rawOutputText("   •  " + " Abraxas（与各种怪物的备用娜迦场景，塔玛尼肛交，女性舒尔德拉舔舌，变色龙女孩，圣诞哈比）\n");
         rawOutputText("   •  " + " Astronomy (恋物癖邪教徒半人马足交场景)\n");
         rawOutputText("   •  " + " Adjatha (精液成瘾的修女斯库拉、瓦拉、粘液女孩、无脑荡妇苏菲的蛋、塞拉芙与乌尔塔的角色扮演、带蛋蛋的豺狼人场景、奇哈扶他场景、地精蜘蛛网操弄场景以及69兔子场景)\n");
         rawOutputText("   •  " + " ComfyCushion (阴毛牧马人)\n");
         rawOutputText("   •  " + " B (布鲁克)\n");
         rawOutputText("   •  " + " Quiet Browser (一半的妮芙、烬、老鼠女孩繁育者艾米莉、凯瑟琳、凯瑟琳雇佣扩展的一部分、乌尔塔在酒吧内的对话树、部分伊兹玛、洛珀)\n");
         rawOutputText("   •  " + " Indirect (非斯库拉路线的凯瑟琳招募，部分凯瑟琳雇佣扩展，普卡，蜂女扩展的代码)\n");
         rawOutputText("   •  " + " Schpadoinkle (维多利亚性爱场景)\n");
         rawOutputText("   •  " + " Donto (兽人罗加，极地皮特)\n");
         rawOutputText("   •  " + " Angel (额外的艾米莉场景)\n");
         rawOutputText("   •  " + " Firedragon (额外的艾米莉场景)\n");
         rawOutputText("   •  " + " Danaume (乔乔自慰文本)\n");
         rawOutputText("   •  " + " LimitLax (沙漠女巫坏结局)\n");
         rawOutputText("   •  " + " KLN (马人坏结局)\n");
         rawOutputText("   •  " + " TheDarkTemplar11111 (犬胡椒坏结局)\n");
         rawOutputText("   •  " + " Silmarion (犬胡椒坏结局)\n");
         rawOutputText("   •  " + " Soretu (原版牛头怪强暴)\n");
         rawOutputText("   •  " + " NinjArt (小体型男性对地精强暴变体)\n");
         rawOutputText("   •  " + " DoubleRedd (“太大”腐化地精性交)\n");
         rawOutputText("   •  " + " Nightshade (额外牛头怪强暴)\n");
         rawOutputText("   •  " + " JCM (小恶魔夜间轮奸，额外牛头怪战败强暴 - 口交)\n");
         rawOutputText("   •  " + " Xodin（小恶魔轮奸的乳交段落，被巨大生殖器阻碍的探索场景，大部件奔跑阻碍，玩家获得啤酒奶，沙漠女巫地牢杂项场景）\n");
         rawOutputText("   •  " + " Blusox6（原版蜂后强暴）\n");
         rawOutputText("   •  " + " Thrext（附加自慰代码，仙女，象牙魅魔）\n");
         rawOutputText("   •  " + " XDumort（无性别肛门自慰）\n");
         rawOutputText("   •  " + " Uldego（史莱姆怪物）\n");
         rawOutputText("   •  " + " Noogai、Reaper和Numbers（乳交胜利 vs 小恶魔强暴）\n");
         rawOutputText("   •  " + " Verse和IAMurow（蜂女多根肉棒强暴）\n");
         rawOutputText("   •  " + " Sombrero（额外的小恶魔欲望战败场景（肉棒插入啦！））\n");
         rawOutputText("   •  " + " The Dark Master（玛布尔、恋物教徒、恋物狂热者、地狱犬、露米、部分猫咪改造、拉波瓦、塞拉芙的猫奴、一个精液女巫场景、老鼠梦境、强制哺乳：小恶魔与地精、蜂女扩展）\n");
         rawOutputText("   •  " + " Mr. Fleshcage（猫咪改造/自慰）\n");
         rawOutputText("   •  " + " Spy (猫咪自慰，强制哺乳：牛头怪、蜜蜂与邪教徒)\n");
         rawOutputText("   •  " + " PostNuclearMan (一些猫咪变形)\n");
         rawOutputText("   •  " + " MiscChaos (强制哺乳：史莱姆怪物)\n");
         rawOutputText("   •  " + " Ourakun (半人马凯尔特)\n");
         rawOutputText("   •  " + " Rika_star25 (沙漠部落坏结局)\n");
         rawOutputText("   •  " + " Versesai (额外的蜜蜂强暴场景)\n");
         rawOutputText("   •  " + " Mallowman (额外的蜜蜂强暴场景)\n");
         rawOutputText("   •  " + " HypnoKitten (额外的半人马 x 小恶魔强暴场景)\n");
         rawOutputText("   •  " + " Ari (牛头怪寻欢洞场景)\n");
         rawOutputText("   •  " + " SpectralTime (南希阿姨)\n");
         rawOutputText("   •  " + " Foxxling (阿克巴尔)\n");
         rawOutputText("   •  " + " Elfensyne (菲拉)\n");
         rawOutputText("   •  " + " Radar (支配沙漠女巫，部分菲拉)\n");
         rawOutputText("   •  " + " Jokester (鲨鱼女孩，伊兹玛，以及额外的艾米莉场景)\n");
         rawOutputText("   •  " + " Lukadoc (额外的伊兹玛，塞拉芙追随者腐化群交，萨堤尔，烬)\n");
         rawOutputText("   •  " + " IxFa (假阴茎场景、豪华假阴茎的处女场景、娜迦尾巴自慰)\n");
         rawOutputText("   •  " + " Bob (额外的伊兹玛内容)\n");
         rawOutputText("   •  " + " lh84 (各种错别字修正与代码建议)\n");
         rawOutputText("   •  " + " Dextersinister (平原上的豺狼人女孩)\n");
         rawOutputText("   •  " + " ElAcechador, Bandichar, TheParanoidOne, Xoeleox (所有娜迦相关内容)\n");
         rawOutputText("   •  " + " Symphonie (口交者多米妮卡，塞拉芙扮演多米妮卡，特尔阿德雷图书馆)\n");
         rawOutputText("   •  " + " Soulsemmer (伊弗里斯)\n");
         rawOutputText("   •  " + " WedgeSkyrocket (绝子，纯洁艾米莉肛交，狐妖)\n");
         rawOutputText("   •  " + " Zeikfried (阿涅莫涅，男性挤奶器坏结局，袋鼠变形，浣熊变形，牛头怪厨师对话，希拉，以及更多)\n");
         rawOutputText("   •  " + " User21 (额外的半人马/娜迦场景)\n");
         rawOutputText("   •  " + " ~M~ (荡妇 + 小恶魔战败场景)\n");
         rawOutputText("   •  " + " Grype (强暴地狱犬)\n");
         rawOutputText("   •  " + " B-Side (芬天堂娱乐中心搞笑模式场景)\n");
         rawOutputText("   •  " + " Not Important (操战败牛头人的脸)\n");
         rawOutputText("   •  " + " Third (科顿、鲁比、尼芙、乌尔塔宠物play)\n");
         rawOutputText("   •  " + " Gurumash（尼芙的部分）\n");
         rawOutputText("   •  " + " Kinathis（尼芙场景，索菲女儿乱伦，密涅瓦）\n");
         rawOutputText("   •  " + " Jibajabroar（杰森）\n");
         rawOutputText("   •  " + " Merauder（拉斐尔）\n");
         rawOutputText("   •  " + " EdgeofReality（健身房操穴机）\n");
         rawOutputText("   •  " + " Bronycray (鬣狗海克尔)\n");
         rawOutputText("   •  " + " Sablegryphon (豺狼人掷矛手)\n");
         rawOutputText("   •  " + " Nonesuch (蛇怪，沙坑，协助制作奥夫卡/瓦普拉，惠特尼农场腐化)\n");
         rawOutputText("   •  " + " 匿名人士 (莉莉姆，玩家产下蛛化精灵)\n");
         rawOutputText("   •  " + " PKD (奥夫卡，瓦普拉，打飞机竞技场，伊莎贝拉触手性爱，洛蒂触手性爱)\n");
         rawOutputText("   •  " + " Shamblesworth (妮芙一半的剧情，幽灵女孩舒尔德拉，塞拉芙角色扮演玛布尔，雅拉性爱场景，舒尔德拉跟随扩展)\n");
         rawOutputText("   •  " + " Kirbu (Exgartuan扩展，雅拉性爱场景，Shambles的协助者，舒尔德拉跟随扩展)\n");
         rawOutputText("   •  " + " 05095 (舒尔德拉扩展，大量编辑工作)\n");
         rawOutputText("   •  " + " Smidgeums (舒尔德拉 + 瓦拉三人行)\n");
         rawOutputText("   •  " + " FC (舒尔德拉通用对话场景)\n");
         rawOutputText("   •  " + " Oak (兄弟 + 荡妇转化，伊莎贝拉的ProBova打嗝)\n");
         rawOutputText("   •  " + " Space (战胜奇哈后的肛交)\n");
         rawOutputText("   •  " + " Venithil (与斯库拉的LippleLock & 额外的乌尔塔场景)\n");
         rawOutputText("   •  " + " Butts McGee (牛头怪热狗式战败，塔玛尼女同骑脸，无脑荡妇苏菲的粗暴/温柔操弄)\n");
         rawOutputText("   •  " + " Savin (火蜥蜴海尔，瓦莱丽亚，打醉酒乌尔塔的屁股，不死鸟高塔，蛛魔肛交胜利，海尔 x 伊莎贝拉三人行，半人马性玩具，感恩节火鸡，未腐化的拉特克西招募，直接喂食拉特克西的强硬路线，斯芬克斯萨努拉)\n");
         rawOutputText("   •  " + " Gats (洛蒂，精灵与士兵圣诞活动，奇哈强制自慰，地精后入，鸡身女妖卖蛋人)\n");
         rawOutputText("   •  " + " Aeron the Demoness (普通地精肛交，调教最年长的牛头怪)\n");
         rawOutputText("   •  " + " Gats、Shamblesworth、Symphonie 和 Fenoxo (腐化蛛化精灵)\n");
         rawOutputText("   •  " + " Bagpuss (女性感恩节活动，哈比磨豆腐，蛛化精灵捆绑操)\n");
         rawOutputText("   •  " + " Frogapus (狂野狩猎)\n");
         rawOutputText("   •  " + " Fenoxo (((其他所有内容)))\n");
         outputText("[b: 产卵更新制作人员名单 - 名字按在产卵文档中出现的顺序排列]\n");
         rawOutputText("   •  " + " DCR (创意、蛛化精灵转化，以及蛛化精灵对以下物种的受孕：地精、蜂女、娜迦、哈比和蛇怪)\n");
         rawOutputText("   •  " + " Fenoxo (蜜蜂产卵管转化，蜜蜂对娜迦和乔乔的产卵，蛛化精灵对塔玛尼的产卵)\n");
         rawOutputText("   •  " + " Smokescreen (蜜蜂对蛇怪的产卵)\n");
         rawOutputText("   •  " + " Radar (沙漠女巫产卵)\n");
         rawOutputText("   •  " + " OutlawVee (黏液女孩的蜜蜂产卵)\n");
         rawOutputText("   •  " + " Zeikfried (编辑这堆烂摊子，阿涅莫涅产卵)\n");
         rawOutputText("   •  " + " Woodrobin (牛头怪产卵)\n");
         rawOutputText("   •  " + " Posthuman (塞拉芙追随者产卵)\n");
         rawOutputText("   •  " + " Slywyn (蜜蜂在玩家巨根中产卵)\n");
         rawOutputText("   •  " + " Shaxarok (蛛化精灵在巨乳乳头穴中产卵)\n");
         rawOutputText("   •  " + " Quiet Browser (蜜蜂在乌尔塔体内产卵)\n");
         rawOutputText("   •  " + " Bagpuss (在纯洁的艾米莉体内产卵)\n");
         rawOutputText("   •  " + " Eliria (蜜蜂在兔女郎体内产卵)\n");
         rawOutputText("   •  " + " Gardeford (赫莉娅 x 无脑荡妇苏菲 三人行)\n");
      }
      
      public function updateMainMenuTextColors() : void
      {
         var _loc3_:* = null as TextField;
         var _loc4_:* = null as TextFormat;
         var _loc1_:Array = [_miniCredit,_versionInfo];
         var _loc2_:int = 0;
         while(_loc2_ < int(_loc1_.length))
         {
            _loc3_ = _loc1_[_loc2_];
            _loc2_++;
            _loc3_.textColor = Theme.current.get_menuTextColor();
            _loc4_ = _loc3_.defaultTextFormat;
            _loc4_.color = Theme.current.get_menuTextColor();
            _loc3_.defaultTextFormat = _loc4_;
         }
      }
      
      public function update(param1:String) : void
      {
         _cocLogo.set_bitmap(Theme.current.get_CoCLogo());
         _disclaimerBackground.set_bitmap(Theme.current.get_disclaimerBg());
         _disclaimerIcon.set_bitmap(Theme.current.get_warningImage());
         updateMainMenuTextColors();
      }
      
      public function showCredits() : void
      {
         var _loc5_:* = null as CreditSection;
         var _loc6_:* = null as Array;
         var _loc7_:int = 0;
         var _loc8_:* = null as Array;
         var _loc9_:* = null as Credit;
         var _loc10_:int = 0;
         var _loc11_:* = null as Array;
         var _loc12_:* = null as Contribution;
         var _loc13_:* = null as String;
         var _loc14_:* = null as Array;
         get_mainView().addElement(_searchBar);
         var _loc1_:String = "      ◦  ";
         if(_searchedArray == null)
         {
            _searchedArray = _creditsInfo.credits;
         }
         var _loc2_:Array = _searchedArray;
         displayHeader(_creditsInfo.heading);
         outputText("<font size=\"6\">\n</font>");
         var _loc3_:int = 0;
         var _loc4_:Array = _creditsInfo.sections;
         while(_loc3_ < int(_loc4_.length))
         {
            _loc5_ = _loc4_[_loc3_];
            _loc3_++;
            _loc6_ = [];
            _loc7_ = 0;
            _loc8_ = _loc2_;
            while(_loc7_ < int(_loc8_.length))
            {
               _loc9_ = _loc8_[_loc7_];
               _loc7_++;
               if(Boolean(_loc9_.types.contains(_loc5_.type)))
               {
                  _loc6_.push(_loc9_);
               }
            }
            _loc8_ = _loc6_;
            if(int(_loc8_.length) != 0)
            {
               outputText("[bu: " + _loc5_.heading + "]：\n");
               if(_loc5_.type.index == 3)
               {
                  _loc7_ = 0;
                  while(_loc7_ < int(_loc8_.length))
                  {
                     _loc9_ = _loc8_[_loc7_];
                     _loc7_++;
                     outputText("[b: " + _loc9_.name + "]" + _loc9_.hash + "\n");
                     _loc10_ = 0;
                     _loc11_ = _loc9_.contributions;
                     while(_loc10_ < int(_loc11_.length))
                     {
                        _loc12_ = _loc11_[_loc10_];
                        _loc10_++;
                        switch(_loc12_.index)
                        {
                           case 0:
                              _loc13_ = _loc12_.params[0];
                              rawOutputText("   •  " + _loc13_ + "\n");
                              break;
                           case 1:
                              _loc13_ = _loc12_.params[0];
                              _loc14_ = _loc12_.params[1];
                              rawOutputText("   •  " + _loc13_ + "\n");
                              rawOutputText(_loc1_ + _loc14_.join("\n" + _loc1_) + "\n");
                        }
                     }
                  }
                  outputText("<font size=\"8\">\n</font>");
               }
               else
               {
                  _loc7_ = 0;
                  while(_loc7_ < int(_loc8_.length))
                  {
                     _loc9_ = _loc8_[_loc7_];
                     _loc7_++;
                     rawOutputText("   •  ");
                     outputText("[b: " + _loc9_.name + "]" + _loc9_.hash + "\n");
                  }
                  outputText("\n");
               }
            }
         }
         if(_creditsInfo.displayFooting && _creditsInfo.footing != "")
         {
            outputText(_creditsInfo.footing);
         }
      }
      
      public function setContinue(param1:CoCButton) : void
      {
         var _loc2_:int = 0;
         var _loc3_:* = null as String;
         if(param1 != null)
         {
            _loc2_ = get_game().saves.getLatestSaveSlot();
            _loc3_ = "";
            if(_loc2_ == -2)
            {
               _loc3_ = get_miscSettings().lastFileSaveName;
            }
            else if(_loc2_ >= 0)
            {
               _loc3_ = "栏位" + (_loc2_ + 1) + "的" + "[b:" + get_game().saves.getSaveName(_loc2_) + "]";
            }
            if(get_player().loaded)
            {
               param1.enable("要回到最近的游戏进度吗？");
            }
            else if(get_gameplaySettings().preload != 0 && _loc2_ != -1)
            {
               param1.enable("最近的存档是" + _loc3_ + "。[pg-]要加载存档吗？");
            }
            else
            {
               param1.disable("请开始新游戏或加载已有的存档文件。");
            }
         }
      }
      
      public function search(param1:Event) : void
      {
         var _loc7_:* = null as String;
         var _loc10_:* = null as Credit;
         var _loc11_:int = 0;
         var _loc12_:Boolean = false;
         var _loc13_:int = 0;
         var _loc14_:* = null as Array;
         var _loc15_:* = null as CreditSection;
         var _loc16_:int = 0;
         var _loc17_:int = 0;
         var _loc18_:int = 0;
         var _loc19_:int = 0;
         var _loc20_:int = 0;
         var _loc21_:* = null as Contribution;
         var _loc22_:int = 0;
         var _loc2_:MainMenu = this;
         var _loc3_:String = StringTools.trim(Reflect.getProperty(param1.target,"text")).toLowerCase();
         _searchedArray = Unserializer.run(Serializer.run(_creditsInfo.credits));
         var _loc4_:Array = [];
         var _loc5_:int = 0;
         var _loc6_:Array = new EReg("\\W","g").split(_loc3_);
         while(_loc5_ < int(_loc6_.length))
         {
            _loc7_ = _loc6_[_loc5_];
            _loc5_++;
            if(_loc7_ != null && _loc7_.length > 0)
            {
               _loc4_.push(_loc7_);
            }
         }
         _loc6_ = _loc4_;
         if(_creditsInfo.footing != "")
         {
            _creditsInfo.displayFooting = int(_loc6_.length) > 0;
         }
         if(int(_loc6_.length) == 0)
         {
            creditsScreen(_currentScreen);
            return;
         }
         var _loc8_:Array = [];
         _loc5_ = 0;
         var _loc9_:Array = _searchedArray;
         while(_loc5_ < int(_loc9_.length))
         {
            _loc10_ = _loc9_[_loc5_];
            _loc5_++;
            _loc11_ = MainMenu.tallyString(_loc10_.name,_loc6_) + MainMenu.tallyString(_loc10_.hash,_loc6_);
            if(_loc11_ > 0)
            {
               _loc10_.rank = 2147483647;
               _loc12_ = true;
            }
            else
            {
               _loc13_ = 0;
               _loc14_ = _loc2_._creditsInfo.sections;
               while(_loc13_ < int(_loc14_.length))
               {
                  _loc15_ = _loc14_[_loc13_];
                  _loc13_++;
                  if(Boolean(_loc10_.types.contains(_loc15_.type)))
                  {
                     if(_loc15_.type != ContributionType.Contributions)
                     {
                        _loc10_.types.remove(_loc15_.type);
                     }
                     else
                     {
                        _loc16_ = 0;
                        _loc17_ = int(_loc10_.contributions.length);
                        _loc18_ = _loc17_ - 1;
                        _loc19_ = _loc16_;
                        while(_loc18_ >= _loc19_)
                        {
                           _loc20_ = _loc18_--;
                           _loc21_ = _loc10_.contributions[_loc20_];
                           _loc22_ = MainMenu.tallyConts(_loc21_,_loc6_);
                           _loc11_ += _loc22_;
                           if(_loc22_ == 0)
                           {
                              _loc10_.contributions.splice(_loc20_,1);
                           }
                        }
                     }
                  }
               }
               _loc10_.rank = _loc11_;
               _loc12_ = _loc10_.rank > 0;
            }
            if(_loc12_)
            {
               _loc8_.push(_loc10_);
            }
         }
         _searchedArray = _loc8_;
         _searchedArray.sort(function(param1:Credit, param2:Credit):int
         {
            return param1.rank - param2.rank;
         });
         creditsScreen(_currentScreen);
      }
      
      public function quitGame() : void
      {
         System.exit(0);
      }
      
      public function mainMenu() : void
      {
         var _loc2_:* = null;
         var _loc3_:* = null as CoCButton;
         try
         {
            get_mainView().removeElement(_searchBar);
         }
         catch(_loc_e_:*)
         {
            clearOutput();
            hideStats();
            hideMenus();
            menu();
            get_game().gameStateDirectSet(3);
            get_mainView().hideMainText();
            get_mainView().minimapView.hide();
            get_mainView().dungeonMap.visible = false;
            if(_mainMenu == null)
            {
               configureMainMenu();
            }
            else
            {
               _loc3_ = _mainMenu.getElementByName("mainmenu_button_0");
               setContinue(_loc3_);
               buttonData[0] = _loc3_.buttonData();
               updateMainMenuTextColors();
               _mainMenu.visible = true;
            }
            GameViewData.screenType = ScreenType.MainMenu;
            GameViewData.menuData = buttonData;
            GameViewData.playerStatData = null;
            GameViewData.flush();
            return;
         }
      }
      
      public function howToPlay() : void
      {
         hideMainMenu();
         clearOutput();
         displayHeader("游戏说明");
         outputText("[b: <u>如何游玩：</u>]\n点击按钮即可，这很好懂。[pg]");
         outputText("[b: 探索：]\n在营地菜单中选择[b: 探索]，然后在探索菜单中再次选择[b: 探索]来寻找新的区域。探索这些区域。不久之后，你将解锁可以随时从营地菜单访问的[b: 地点]。[pg]");
         outputText("[b: 战斗：]\n通常，将对手的欲望提升至100或将其生命值降至0即可赢得战斗。如果敌人对你做了同样的事，你通常会输。战败并不意味着游戏结束，但可能会产生一些后果。[pg]");
         outputText("[b: 控制:]\n游戏提供了许多快捷键，让游玩更加快捷轻松。你可以在“设置”菜单中查看和编辑它们。[pg]");
         outputText("[b: 保存到文件] - 这比保存到存档槽更可靠，丢失存档的几率更小。");
         menu();
         addButton(14,"返回",mainMenu);
      }
      
      public function hideMainMenu() : void
      {
         if(_mainMenu != null)
         {
            _mainMenu.visible = false;
         }
         GameViewData.screenType = ScreenType.Default;
         get_mainView().showMainText();
      }
      
      public function creditsScreen(param1:int = 0) : void
      {
         var page3:int;
         var _g2:MainMenu;
         var page2:int;
         var _g1:MainMenu;
         var page1:int;
         var _g:MainMenu;
         var _gthis:MainMenu;
         var _loc3_:* = null;
         _gthis = this;
         try
         {
            get_mainView().removeElement(_searchBar);
         }
         catch(_loc_e_:*)
         {
            get_mainView().scrollBar.set_autoHide(false);
            hideMainMenu();
            clearOutput();
            if(_currentScreen != param1)
            {
               _searchBar.set_text("");
               _searchedArray = null;
               _currentScreen = param1;
            }
            switch(param1)
            {
               case 0:
                  _creditsInfo = MainMenu._hggConfig;
                  showCredits();
                  break;
               case 1:
                  _creditsInfo = MainMenu._revampConfig;
                  showCredits();
                  break;
               case 2:
                  vanillaCreditsScreen();
            }
            menu();
            _g = this;
            page1 = 0;
            addButton(0,"/hgg/",function():void
            {
               _g.creditsScreen(page1);
            }).hint("你现在正在玩的模组。");
            _g1 = this;
            page2 = 1;
            addButton(1,"Revamp",function():void
            {
               _g1.creditsScreen(page2);
            }).hint("本模组所基于的模组。后来更名为非官方扩展版（Unofficially Expanded Edition）。");
            _g2 = this;
            page3 = 2;
            addButton(2,"原版",function():void
            {
               _g2.creditsScreen(page3);
            }).hint("原版游戏。");
            button(param1).disable();
            addButton(14,"返回",function():void
            {
               _gthis.get_mainView().scrollBar.set_autoHide(true);
               _gthis._searchBar.set_text("");
               _gthis._searchedArray = null;
               _gthis.mainMenu();
            });
            return;
         }
      }
      
      public function continueButton() : void
      {
         if(!get_player().loaded)
         {
            get_game().saves.loadLatest(mainMenu);
            return;
         }
         playerMenu();
      }
      
      public function configureMainMenu() : void
      {
         var _g1:MainMenu;
         var _g:GameSettings;
         var _loc15_:* = null as CoCButton;
         _searchBar.set_searchFunction(search);
         var _loc1_:* = {
            "label":"开始",
            "fun":get_game().charCreation.newGameFromScratch,
            "hint":"开始新游戏。"
         };
         var _loc2_:* = {
            "label":"数据",
            "fun":get_game().saves.saveLoad,
            "hint":"加载或管理已保存的游戏。"
         };
         _g = get_game().gameSettings;
         var _loc3_:* = {
            "label":"设置",
            "fun":function():void
            {
               _g.enterSettings();
            },
            "hint":"配置游戏或启用作弊功能。"
         };
         _g1 = this;
         var _loc4_:Function = function():void
         {
            _g1.creditsScreen();
         };
         var _loc5_:Array = [{
            "label":"继续",
            "fun":continueButton,
            "hint":"要回到最近的游戏进度吗？"
         },_loc1_,_loc2_,_loc3_,{
            "label":"成就",
            "fun":get_game().achievementList.achievementsScreen,
            "hint":"查看目前获得的所有成就。"
         },{
            "label":"说明",
            "fun":howToPlay,
            "hint":"游玩指南。"
         },{
            "label":"鸣谢",
            "fun":_loc4_,
            "hint":"查看所有为这款游戏提供内容的贡献者名单。"
         },{
            "label":"结束",
            "fun":quitGame,
            "hint":"结束游戏。"
         }];
         var _loc6_:Block = new Block(null,0,0,1000,800,"MainMenu");
         _cocLogo = new BitmapDataSprite(new Bitmap(new GameLogo(0,0)),null,true,Math.floor(500) - 300,52,364,600,true,"",0,false,1,true);
         _disclaimerBackground = new BitmapDataSprite(new Bitmap(new DisclaimerBG(0,0)),null,true,Math.floor(500) - 310,Math.floor(400) + 80,90,620,false,"",0,false,1,true);
         _disclaimerIcon = new BitmapDataSprite(null,Warning,true,_disclaimerBackground.x + 10,_disclaimerBackground.y + 15,60,60,false,"",0,false,1,true);
         var _loc7_:String = Assets.getFont("res/fonts/pala.ttf").fontName;
         _miniCredit = new TextField();
         _miniCredit.name = "miniCredit";
         _miniCredit.multiline = true;
         _miniCredit.wordWrap = false;
         _miniCredit.autoSize = "center";
         _miniCredit.defaultTextFormat = new TextFormat(_loc7_,16,Theme.current.get_menuTextColor(),null,null,null,null,null,"center",null,null,null,-2);
         var _loc8_:TextField = _miniCredit;
         _loc8_.htmlText += "<b>代码编写：</b>OtherCoCAnon，Koraeli，Mothman，Anonymous\n";
         var _loc9_:TextField = _miniCredit;
         _loc9_.htmlText += "<b>贡献者：</b>Satan，Chronicler，Anonymous\n";
         _miniCredit.x = Math.floor(500) - _miniCredit.width / 2;
         _miniCredit.y = Math.floor(400) + 30;
         var _loc10_:TextField = new TextField();
         _loc10_.name = "disclaimerInfo";
         _loc10_.multiline = true;
         _loc10_.wordWrap = true;
         _loc10_.height = _disclaimerBackground.height;
         _loc10_.width = 540;
         _loc10_.x = _disclaimerBackground.x + 80;
         _loc10_.y = _disclaimerBackground.y;
         _loc10_.defaultTextFormat = new TextFormat(_loc7_,16,Theme.current.get_textColor(),null,null,null,null,null,"left",null,null,null,-2);
         _loc10_.htmlText = "这是一款成人游戏，只适合成年人游玩。\n";
         _loc10_.htmlText += "如果你未满18岁或厌恶非常规的恋物癖，请不要游玩。如果你是在某处花钱得到这个免费游戏，说明你上当了。\n";
         _loc10_.htmlText += "<b>提醒过你了的说！</b>";
         var _loc11_:String = "flash".toUpperCase();
         var _loc12_:String = CoC_Settings.debugBuild ? "测试" : "发布";
         _versionInfo = new TextField();
         _versionInfo.name = "versionInfo";
         _versionInfo.multiline = true;
         _versionInfo.autoSize = "right";
         _versionInfo.defaultTextFormat = new TextFormat(_loc7_,16,Theme.current.get_menuTextColor(),true,null,null,null,null,"right");
         _versionInfo.htmlText = "原版游戏作者：Fenoxo\n游戏模组作者：/hgg/，内容来自Revamp/UEE\n";
         var _loc13_:TextField = _versionInfo;
         _loc13_.htmlText += "" + get_game().version + ", " + _loc11_ + " " + _loc12_ + "版本";
         _versionInfo.x = 1000 - _versionInfo.width;
         _versionInfo.y = 720;
         var _loc14_:int = 0;
         while(_loc14_ < int(_loc5_.length))
         {
            _loc15_ = new CoCButton();
            _loc15_.name = "mainmenu_button_" + _loc14_;
            _loc15_.position = _loc14_;
            _loc15_.x = Math.floor(500) - 310 + int(_loc14_ % 4) * 155;
            _loc15_.y = Math.floor(400) + 175 + Math.floor(_loc14_ / 4) * 45;
            _loc15_.set_labelText(_loc5_[_loc14_].label);
            _loc15_.callback = _loc5_[_loc14_].fun;
            _loc15_.hint(_loc5_[_loc14_].hint);
            get_mainView().hookButton(_loc15_);
            _loc6_.addElement(_loc15_);
            if(_loc14_ == 0)
            {
               setContinue(_loc15_);
            }
            buttonData.push(_loc15_.buttonData());
            _loc14_++;
         }
         _loc6_.addElement(_cocLogo);
         _loc6_.addElement(_disclaimerBackground);
         _loc6_.addElement(_disclaimerIcon);
         _loc6_.addElement(_loc10_);
         _loc6_.addElement(_miniCredit);
         _loc6_.addElement(_versionInfo);
         _mainMenu = _loc6_;
         get_mainView().addElementAt(_mainMenu,2);
      }
   }
}

