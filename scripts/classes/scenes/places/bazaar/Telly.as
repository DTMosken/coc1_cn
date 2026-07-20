package classes.scenes.places.bazaar
{
   import classes.CoC;
   import classes.DebugMenu;
   import classes.DynStat;
   import classes.ItemType;
   import classes.Measurements;
   import classes.PerkLib;
   import classes.Player;
   import classes.SelfDebug;
   import classes.StatusEffect;
   import classes.StatusEffects;
   import classes.Time;
   import classes._FlagDict.FlagDict_Impl_;
   import classes.display.ImageDb;
   import classes.globalFlags.KFLAGS;
   import classes.internals.Utils;
   import classes.internals._OneOf.OneOf_Impl_;
   import classes.items.ConsumableLib;
   import classes.items.UseableLib;
   import classes.items.useables.TeddyBear;
   import classes.saves.SelfSaver;
   import classes.saves.SelfSaving;
   import classes.scenes.Camp;
   import classes.scenes.Inventory;
   import classes.scenes.places.Bazaar;
   import classes.scenes.places.bazaar._Telly.SaveContent;
   import classes.statusEffects.TellyVisedStatus;
   import coc.view.CoCButton;
   import flash.Boot;
   import haxe.Exception;
   import haxe.ds.Either;
   
   public class Telly extends BazaarAbstractContent implements SelfDebug, SelfSaving
   {
      
      public static var TELLYPATH:int = 4;
      
      public var uTellyty:int;
      
      public var tellyTubbies:Array;
      
      public var tellyMetry:SaveContent;
      
      public var tellyGraphs:Array;
      
      public var saveVersion:int;
      
      public var saveName:String;
      
      public var incidenTelly:Boolean;
      
      public var globalSave:Boolean;
      
      public var TELLYPHOTOS:Array;
      
      public function Telly()
      {
         if(Boot.skip_constructor)
         {
            return;
         }
         globalSave = false;
         saveVersion = 3;
         saveName = "telly";
         uTellyty = 0;
         TELLYPHOTOS = ["butterfly","flower","heart","star","skull"];
         tellyGraphs = ["butterfly","heart","star","flower","cluster of hearts","shooting star","winged-heart","snowflake"];
         tellyTubbies = ["red","blue","pink","purple","yellow","magenta","green"];
         incidenTelly = false;
         tellyMetry = new SaveContent(null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null);
         super();
         SelfSaver.register(this);
         DebugMenu.register(this);
      }
      
      public function viTellyty() : void
      {
         var _g:Telly;
         clearOutput();
         outputText("不用多说，你的生活中需要更多特莉的拥抱。");
         outputText(get_vesTelly() == get_time().days * 100 + get_time().hours ? "[say: 但是[mister]，我刚刚才抱过你！]她回答道。[pg]很明显，她的收费不够高，因为你觉得这太有价值了，不容错过。" : "[pg]");
         outputText("你赶紧交出" + (get_player().get_gems() < 20 ? "你仅有的一点资金" : "20颗宝石") + "，毫不迟疑地拥抱了这位恶魔。");
         outputText("[pg]特莉笑着，全心全意地回抱了你，并用她的脸蹭着你，进一步强调了拥抱的亲密感。[say: 感谢您的惠顾。]");
         outputText("[pg]不久之后，你松开了这位孩子气的商人，感觉这次交流让你充满了活力。");
         get_player().dynStats(DynStat.Cor(0.5));
         get_player().changeFatigue(-20);
         var _loc1_:Player = get_player();
         _loc1_.set_gems(_loc1_.get_gems() - (get_player().get_gems() >= 20 ? 20 : get_player().get_gems()));
         set_vesTelly(int(Math.floor(get_time().days * 100 + get_time().hours)));
         _g = this;
         doNext(function():void
         {
            _g.tellyMarket();
         });
      }
      
      public function tellyVision() : void
      {
         var _g:Telly;
         clearOutput();
         outputText("特莉是一个娇小的、孩子般的恶魔，身高大约" + Measurements.briefHeight(46) + "。她身材娇小，皮肤白皙，金色的长发垂至腰部上方几英寸处。特莉的脸庞和她身体的其他部分一样，带着孩子气，圆圆的脸蛋让人忍不住想捏一捏。她的淡褐色眼睛总是闪烁着兴奋的光芒，今天她在脸颊上画了一个[tellyvisual]，更增添了她天真无邪的风格。");
         if(isHalloween(true))
         {
            outputText("她那不同寻常但又出奇合身的装束，包括一件浅蓝色的连衣裙和一条白色的围裙，以及她角之间的一个漂亮蝴蝶结。这套衣服保养得很好，但也穿了很久。");
         }
         else
         {
            outputText("她平时和现在的装束，包括一件浅色的蕾丝连衣裙，裙摆上有多层褶边。");
         }
         _g = this;
         doNext(function():void
         {
            _g.tellyMarket();
         });
      }
      
      public function tellySurvey(param1:int = -1) : void
      {
         var _g:Telly;
         menu();
         addButton(0,"聊天",tellyCommunication).hint("想到什么就聊什么。");
         addButton(1,"经商",tellyMotor);
         if(get_tellyGenesis())
         {
            addButton(2,"集市",tellyOperation);
         }
         addButton(3,"顾客",tellyRgy);
         if(get_player().hasItem(get_consumables().LIDDELL) && FlagDict_Impl_.arrayReadInt(KFLAGS.flags,2727) >= 0)
         {
            addButton(4,"奇怪药水",tellyStic);
         }
         else if(!tellyCom(TellyCom.TellyComL) && FlagDict_Impl_.arrayReadInt(KFLAGS.flags,2727) < 0)
         {
            addButton(4,"利德尔药水",tellyOtic);
         }
         if(affectionaTelly(false))
         {
            _g = this;
            addNextButton("送礼物",function():Boolean
            {
               return _g.affectionaTelly();
            }).hint("你有一件泰莉可能会喜欢的东西。要给她吗？");
         }
         if(param1 != -1)
         {
            button(param1).disable();
         }
         setExitButton("返回",tellyCopy);
      }
      
      public function tellyStic() : void
      {
         clearOutput();
         outputText("尽管特莉平时举止随和，但她[i:毕竟]是个恶魔；她很可能知道你找到的药水是用来干什么的。你从[inv]中拿出那个奇怪的药瓶，问她能不能看出点名堂。");
         outputText("[pg]特莉盯着你手中的药瓶，抬起头，心里已经有了答案。[say:那是利德尔药水，他们就是用这个制造更多特莉的！]");
         outputText("[pg]哦，那可真是简单明了。你由此推断，这种药水能把恶魔变成爱丽丝。");
         FlagDict_Impl_.arrayWriteInt(KFLAGS.flags,2727,-1);
         tellySurvey(4);
      }
      
      public function tellyStially(param1:int, param2:Array) : void
      {
         var tellyCall3:Array;
         var tellyGuidance2:int;
         var _g2:Telly;
         var tellyCall2:Array;
         var tellyGuidance1:int;
         var _g1:Telly;
         var tellyCall1:Array;
         var tellyGuidance:int;
         var _g:Telly;
         var _gthis:Telly = this;
         clearOutput();
         switch(param1)
         {
            case 0:
               outputText("[say: 你想喝点茶吗？] 特莉问道。恶魔举起茶壶和茶杯，天真地对着眼前这个笼罩现实的怪异<i>东西</i>微笑。在所有令人心智扭曲的混乱中，你几乎忘了她在这里。[say: 这是用我家乡特有的一种叶子泡的，但加了一种特殊的香料，带有一点樱桃和杏仁的味道！]");
               outputText("[pg]怪物停顿了一下，思考着，然后选择在桌旁坐下，特莉也跟着坐下。恶魔看向你。[say: 来吧，[mister]，加入我们！]");
               outputText("[pg]你再次环顾四周，确定除了加入他们或漫无目的地漂浮之外，你真的无事可做，于是你走过去，在他们俩旁边坐下。");
               break;
            case 1:
               outputText("你抿了一口茶。味道温暖、舒缓，隐约带有樱桃和杏仁的味道。");
               break;
            case 2:
               outputText("你问了实体几个问题，想更好地了解它。作为礼貌的回应，这团蹒跚的肉块用现存的所有语言尖叫起来。鲜血开始从你的[ears]滴落。");
               outputText("[pg][say: 哇，我以前都不知道这些！] 特莉惊呼道，尾巴高兴地甩动着。[say: 你看起来真是个见多识广的人，] 她说，被这生物的故事逗乐了。");
               break;
            case 3:
               outputText("由于此刻你没有任何东西能让你脚踏实地，你转向了最具体的、可能让你稳定下来的行为。这个实体是否有兴趣和你以及特莉发生性关系？");
               outputText("[pg]这只怪异的野兽对你的举止感到震惊，把茶泼在了你的脸上。你盘旋着飞向宇宙，速度越来越快，呈指数级加速。一切都变得模糊和扭曲，很快你发现自己躺在床上。");
               doNext(function():void
               {
                  _gthis.cheatTime(21 - _gthis.get_time().hours);
                  _gthis.playerMenu();
               });
               return;
         }
         param2.push(param1);
         menu();
         _g = this;
         tellyGuidance = 1;
         tellyCall1 = param2;
         addNextButton("喝茶",function():void
         {
            _g.tellyStially(tellyGuidance,tellyCall1);
         }).hint("品尝一些茶水。").disableIf(param2.indexOf(1) >= 0);
         _g1 = this;
         tellyGuidance1 = 2;
         tellyCall2 = param2;
         addNextButton("提问",function():void
         {
            _g1.tellyStially(tellyGuidance1,tellyCall2);
         }).hint("了解这团蹒跚的肉块。").disableIf(param2.indexOf(2) >= 0);
         _g2 = this;
         tellyGuidance2 = 3;
         tellyCall3 = param2;
         addNextButton("性爱",function():void
         {
            _g2.tellyStially(tellyGuidance2,tellyCall3);
         }).hint("建议在这个小商人、深不可测的古神和你自己之间来一场三人行。");
      }
      
      public function tellyStial() : void
      {
         var _gthis:Telly = this;
         clearOutput();
         outputText("在死者与被诅咒者的领地跋涉之后，你找到了一件美得无法形容的神器；凝视这颗宝石闪烁的形态，就如同将漫天繁星捧在手心。曾经无法尽收眼底的景象，如今却在你的掌握之中，没有任何物品能与它的壮丽相媲美。如此美景该赠予谁呢？当然是那个眼中同样闪烁着星辰与光辉的人。");
         outputText("[pg]特莉接过黑色宝石，惊叹于其中蕴含的宇宙奇观。[say: 太美了，[mister]！] 她敬畏地喊道。她转动着宝石，仔细端详，眼中倒映着无尽的苍穹。");
         outputText("[pg]当你凝视那片星空深渊时，你也感到了一种敬畏和惊叹，很快你发现自己走近并拥抱了特莉。虽然你的举动毫无预兆，但她的注意力仍然集中在礼物上，完全被它的美丽所吸引。在她的眼中，星辰移动、旋转，飞越虚空。你看到的只有广阔无垠，整个世界都在褪色。");
         tellyCom(TellyCom.TellyComA,true);
         doNext(function():void
         {
            var tellyCall:Array;
            var tellyGuidance:int;
            var _g:Telly;
            _gthis.clearOutput();
            _gthis.outputText("特莉眨了眨眼。[say: 它去哪儿了？] 她看着空空如也的双手问道。她抬起头，注意到你正抱着她。[say: [Mister]？]");
            _gthis.outputText("[pg]你回过神来，放开了这位商人。出于本能，你可能会开始试图解释，但当你们看清自己身处何方时，两人都默默地站着。四面八方，星尘和闪烁的光芒在完全虚无的背景中闪耀。你环顾四周，发现很难保持任何方向感。就好像你在移动，但你的四肢却保持静止。");
            _gthis.outputText("[pg]光线本身在原地弯曲扭曲。阴影般的触手侵入你的余光，偏头痛将你的精神推向了你能承受的极限。你痛苦地退缩，挣扎着，很快睁开眼睛，看到了一个形状和结构都无法想象的新实体。");
            _gthis.outputText("[pg]这个无名的怪物从肉茎中伸出舌头，品尝着你的存在。这该死的恐怖生物发出尖叫，用十亿陨落凡人的痛苦填满了你的灵魂。你看到的只有终结。");
            _g = _gthis;
            tellyGuidance = 0;
            tellyCall = [];
            var _loc1_:Function = function():void
            {
               _g.tellyStially(tellyGuidance,tellyCall);
            };
            _gthis.doNext(_loc1_);
         });
      }
      
      public function tellySis(param1:Boolean) : void
      {
         var _g:Telly;
         tellyMetry.immorTelly = int(get_date().getFullYear());
         clearOutput();
         if(param1)
         {
            outputText("你不能确定她心目中的情人节到底是什么样的，但你肯定有自己的经历。");
         }
         else
         {
            outputText("你甚至不能说你真的明白她的意思，但据你所知，你还没有亲身体验过。");
         }
         outputText("[pg]特莉咯咯地笑了起来。[say: 今年，我希望你能因为特莉的玩具与零食而觉得自己是一个特别的情人。]恶魔从她身后的地板上抓起什么东西，很快就把一张看起来像纸的东西递给了你。[say: 只要25颗宝石，[mister]！这是我用自制的颜料为你画的。]");
         outputText("[pg]凝视着这幅画，你看到它描绘了商店，就像它现在的样子，你旁边的窗户在背景中。特莉靠在柜台上微笑着，而你站在画中，手里拿着一张纸，正在专注地看着。她甚至画出了你[armor]的所有细节，就好像你为这幅画当过模特一样。你把目光从画上移开，看向恶魔，她的表情和她画的一模一样。再次惊叹之余，你注意到画和真实的房间之间有一个区别：她在柜台上画了一小袋宝石。");
         outputText("[pg][say: 25颗宝石，[mister]！]");
         outputText("[pg]眨了几下眼睛，你感到有些迷失方向，然后把手伸进你的[pouch]里，把钱递了过去。特莉把它装进一个小袋子里放下，于是生活模仿了艺术。[say: 情人节快乐，[mister]！]");
         outputText("[pg]带着一阵奇怪的奉承感，你离开了商店，走的时候[if (singleleg) {\"步履\"|步履}]轻盈。");
         var _loc2_:Player = get_player();
         _loc2_.set_gems(_loc2_.get_gems() - 25);
         get_player().dynStats(DynStat.Cor(3));
         get_player().changeFatigue(-20);
         _g = this;
         doNext(function():void
         {
            _g.tellyHo();
         });
      }
      
      public function tellyShopping() : void
      {
         var _loc1_:Array = [new TellyAnalysis(OneOf_Impl_.fromA(get_consumables().LOLIPOP),"棒棒糖",300,"你查看了一个装满硬糖棒的罐子，上面贴着标签[say: 棒棒糖！]，标签下还附有一个警告标志。特莉用几乎像唱歌一样的语调插话解释道，[say: 它们又亮又甜，就像我一样！吃太多的话，你也会变得像我一样哦！[if (ischild) { 或者，其实对你来说可能没什么区别。}] 如果你还有兴趣的话，300宝石。]"),new TellyAnalysis(OneOf_Impl_.fromA(get_consumables().NUMBROX),"跳跳糖",60,"你查看了一个摆满小糖果包的架子。[say: 那些是跳跳糖，]特莉解释道，[say: 它们尝起来像闪闪发光的东西！一包60宝石。]"),new TellyAnalysis(OneOf_Impl_.fromB(tellyPlasm),"糖果",3,""),new TellyAnalysis(OneOf_Impl_.fromB(tellyBear),"泰迪熊",50,""),new TellyAnalysis(OneOf_Impl_.fromA(get_useables().RBRBALL),"橡胶球",10,"你检查了一个塑料罐，发现里面有许多紫色的球。特莉插话道，[say: 那些是弹力球，[mister]！]她一边解释一边前后跳跃，[say: 你把它们扔出去，它们就会弹回来！]很好玩，虽然可能有点危险。[say: 每个10宝石！]"),new TellyAnalysis(OneOf_Impl_.fromB(tellyPhoto),"面部彩绘",5,"")];
         if(tellyCom(TellyCom.TellyComH))
         {
            _loc1_.push(new TellyAnalysis(OneOf_Impl_.fromB(viTellyty),"拥抱",1,"再来一个拥抱会让你的一天都亮起来。当然，你需要支付她20宝石作为服务费。"));
         }
         menu();
         addButton(14,"返回",tellyCopy);
         var _loc2_:int = 0;
         while(_loc2_ < int(_loc1_.length))
         {
            tellyLens(_loc1_[_loc2_]);
            _loc2_++;
         }
      }
      
      public function tellySales(param1:TellyAnalysis) : void
      {
         var tellyStasis:Boolean;
         var _g1:Telly;
         var tellyAnalysis1:TellyAnalysis;
         var _g:Telly;
         clearOutput();
         outputText(param1.tellyPrompt + "[pg]");
         _g = this;
         tellyAnalysis1 = param1;
         _g1 = this;
         tellyStasis = true;
         doYesNo(function():void
         {
            _g.tellyKinesis(tellyAnalysis1);
         },function():void
         {
            _g1.tellyMarket(tellyStasis);
         });
      }
      
      public function tellyRgy() : void
      {
         clearOutput();
         outputText("在任何行业，顾客有时都会非常难缠。特莉是如何忍受这种事情的？");
         outputText("[pg][say:每个人偶尔都会有倒霉的一天，所以特莉带着玩具和糖果来啦！]这位爱丽丝商人左右转动，俏皮地来回旋转着她的裙子，跳了一段迷你吉格舞。她绝对是天生做推销的料。[say:当然，有时候倒霉的一天需要的不止是一个微笑来点亮，但我们爱丽丝以磨练魅力而闻名。]接着她眨了眨眼，让你感到一种可疑的安心。");
         tellySurvey(3);
      }
      
      public function tellyPresence(param1:Boolean = false) : void
      {
         var _g:Telly;
         var _loc2_:Boolean = get_time().hours >= 6 && get_time().hours < 18;
         if(param1)
         {
            _g = this;
            addButton(4,"特莉的玩具与零食",function():void
            {
               _g.tellyMarket();
            }).hint("一辆布满明亮装饰的小马车。","特莉的玩具与零食！");
            if(!_loc2_)
            {
               button(4).disable((get_tellyGenesis() ? "特莉的马车现在似乎不在附近。" : "这里有一些装饰奇特的招牌，表明有一家名为“特莉的玩具与零食”的商店在这里营业。") + "\n(营业时间：[if (time12Hour) {早上6点到下午6点|6:00到18:00}])");
            }
            if(get_tellyCommand() == get_time().days)
            {
               if(get_tellyGenesis())
               {
                  button(4).disable("特莉现在没空。");
               }
               else
               {
                  button(4).hide();
               }
            }
         }
         else if(_loc2_)
         {
            outputText("[pg]另一辆马车上挂着一块写着“特莉的玩具与零食！”的牌子。这辆马车明显比其他的要小，漆成了粉红色，角落里点缀着一簇簇黄色的星星。虽然漆面和涂装都还不错，但还是能看出一些业余翻新的痕迹。");
         }
      }
      
      public function tellyPlasmic() : void
      {
         var tellyStasis:Boolean;
         var _g:Telly;
         clearOutput();
         var _loc1_:Player = get_player();
         _loc1_.set_gems(_loc1_.get_gems() - 3);
         statScreenRefresh();
         outputText("你扔给特莉几颗宝石，从罐子里拿出一颗糖果，塞进嘴里。爆发出的甜味带着一丝水果的香气，这是一种很好的享受，让你心情大好。特莉看到你的认可，高兴地笑了起来，很高兴你喜欢她的糖果。");
         get_player().refillHunger(1);
         set_tellyPlasmed(true);
         _g = this;
         tellyStasis = true;
         doNext(function():void
         {
            _g.tellyMarket(tellyStasis);
         });
      }
      
      public function tellyPlasm() : void
      {
         var tellyStasis:Boolean;
         var _g:Telly;
         clearOutput();
         outputText("其中一个最大的罐子里装着许多不同的小糖果。特莉兴奋地开口解释，[say: 那些是我自制的一堆糖果，用我自己的配方做的！只要3宝石就能买一个！]");
         _g = this;
         tellyStasis = true;
         doYesNo(tellyPlasmic,function():void
         {
            _g.tellyMarket(tellyStasis);
         });
      }
      
      public function tellyPhoto() : void
      {
         var _loc3_:int = 0;
         clearOutput();
         outputText("你注意到店主喜欢在脸颊上画各种形状和符号，你想知道她是否愿意也在你的脸上画一个。");
         outputText("[pg]特莉听到这个建议，立刻跳了起来，以惊人的速度抓起她的面部彩绘材料。[say: 当然可以，[mister]！我能画各种可爱的东西，5宝石怎么样？这些颜料很便宜，而且很容易洗掉！]");
         menu();
         var _loc1_:int = 0;
         var _loc2_:int = int(TELLYPHOTOS.length);
         while(_loc1_ < _loc2_)
         {
            _loc3_ = _loc1_++;
            addNextButton(Utils.capitalizeFirstLetter(TELLYPHOTOS[_loc3_]),(function(param1:Array, param2:Array):Function
            {
               var _g:Array = param1;
               var tellyGuidance:Array = param2;
               return function():void
               {
                  _g[0].tellyAlgia(int(tellyGuidance[0]));
               };
            })([this],[_loc3_]));
         }
         addButton(14,"算了",tellyDramatic);
      }
      
      public function tellyOtic() : void
      {
         clearOutput();
         outputText("特莉能卖给你几瓶利德尔药水吗？毕竟她是个恶魔，也是个商人。");
         outputText("[pg]特莉摇了摇头。[say:不行！我是特莉，我卖玩具和糖果；利德尔药水[b:不是玩具]，当然也不是糖果！]");
         outputText("[pg]不能全盘否定，看看特莉如今过得多好就知道了！");
         outputText("[pg]店主虽然保持着快活的举止，但还是轻轻叹了口气。[say: 谢谢你，[mister]，但说正经的，其他爱丽丝可不是特莉！对大多数人来说，那可不是什么好体验，不是所有的爱丽丝都像蝴蝶和软糖一样美好；而且，我觉得我甚至在经济上都负担不起进货的费用。]");
         tellyCom(TellyCom.TellyComL,true);
         tellySurvey(4);
      }
      
      public function tellyOperation() : void
      {
         clearOutput();
         outputText("集市的生活怎么样？他们似乎很接受恶魔" + (!incidenTelly ? "" : "t") + "在这里，尽管你对商业方面不太熟悉。");
         outputText("[pg][say:有钱能使鬼推磨！]特莉宣称。[say:虽然……身为爱丽丝和身为恶魔是不一样的。他们把下属变成爱丽丝作为一种惩罚，]她补充道，在解释这件事时显得有些难为情，[say:也就是说，因为犯了非常非常非常严重的错误。不管我是怎么变成这样的，也不管为什么，他们都自信地认为我只会惹麻烦。]");
         outputText("[pg]特莉把目光转向你身旁的窗户。[say:只要我能赚钱——在人多的地方赚钱更容易——他们就会容忍我。]她从相当低沉的语气中转变过来，笑容又恢复了往日的灿烂。[say:当他们了解我之后，很多人其实都是好人！]");
         tellySurvey(2);
      }
      
      public function tellyMotor() : void
      {
         clearOutput();
         outputText("特莉是如何——或者说，为什么要经商的？世界各地的文明都已沦为废墟，而她却在这里试图通过卖毛绒玩具和糖果来赚钱。");
         outputText("[pg][say:世界很危险，但这恰恰说明，那些只为了让你微笑而存在的东西有多么重要！]特莉用手指抵住脸颊，夸张地咧嘴一笑，强调了她的观点。");
         outputText("[pg]那么她是如何起步的呢？虽然不像其他马车那样宽敞豪华，但要造一辆这样的马车依然既昂贵又困难。她的存货也需要物资和准备，这同样花费不菲。所有的投资资本是从哪里来的？");
         outputText("[pg]特莉眨了眨眼，茫然地微笑着。[say:这可真是个严肃的话题，[mister]！这辆马车其实是我在一条古道上发现的，当时它已经被拆得只剩骨架了。因为它不是用来住人的，所以比其他的要小。我自己调了漆，最初用的是我自己做的一种粗糙的红色染料。在阳光下晒了一个星期后，颜色就褪了，变成了粉红色。我更喜欢那样！后来我开始赚钱，能买得起更好的油漆了，才把它打磨得更好看些。]这位恶魔向你讲述她的历史，眼中闪烁着巨大的喜悦，显然很高兴有人对她是如何走到今天这一步感兴趣。不过，那些商品呢？糖果、毛绒玩具，甚至她的私人物品又是怎么来的？");
         outputText("[pg]特莉翻出破旧的玩具和布料，很乐意满足你的好奇心。[say:我主要缝补那些别人扔掉或花钱请人修补的玩具。我现在还是会收我找到的旧玩具，但现在我也从其他定居点买材料。如果我不在集市，我要么在安全的地方扎营，要么去像袋鼠定居点那样的地方买物资" + (FlagDict_Impl_.arrayReadInt(KFLAGS.flags,764) != 1 ? "——但他们不让我进去。我必须预先付钱，通过守卫代理交易" : "") + "。]");
         outputText("[pg]特莉走到今天这一步真的很不容易。不过，爱丽丝终究是爱丽丝，似乎大多数人都不怎么给她好脸色。");
         tellySurvey(1);
      }
      
      public function tellyMarket(param1:Boolean = false, param2:Boolean = false) : void
      {
         var tellyGuidance1:Boolean;
         var _g1:Telly;
         var tellyGuidance:Boolean;
         var _g:Telly;
         clearOutput();
         imageSelect(null);
         tellyGenic();
         var _loc3_:int = int(Math.floor(int(get_time().hours % 3)));
         if(tellyMetry.immorTelly < int(get_date().getFullYear()) && isValentine() && tellyGifted() && get_player().get_gems() >= 25)
         {
            outputText("当你走进这家小小的商店时，特莉跳了起来，微笑着。[say: 情人节快乐，[mister]！]她自豪地宣布。当她对你灿烂地笑着等待回应时，你感到一阵情绪波动，仿佛你能感觉到她还有别的打算。你靠近小女孩站着的柜台，用你自己的话回应了她的问候。");
            outputText("[pg]正如你所料，今天对她来说还有些别的意义。特莉双手撑在桌子上借力，探出身子和你面对面。[say: 你有过情人节伴侣吗，[mister]？]");
            _g = this;
            tellyGuidance = true;
            addButton(0,"有过",function():void
            {
               _g.tellySis(tellyGuidance);
            }).hint("你并没有错过这个节日的欢乐。");
            _g1 = this;
            tellyGuidance1 = false;
            addButton(1,"没有",function():void
            {
               _g1.tellySis(tellyGuidance1);
            }).hint("你对这个节日不太熟悉。");
            addButton(2,"特莉",enTellychy).hint("你去年来过这里！她怎么这么健忘？").disableIf(tellyMetry.immorTelly + 1 != int(get_date().getFullYear()),"你去年没来过这里。");
         }
         else
         {
            if(!incidenTelly && !get_tellyGenesis())
            {
               set_tellyGenesis(true);
               if(get_tellyCommute())
               {
                  outputText("里面的景象和你旅行中遇到她的马车时记忆中的一模一样，小恶魔正开心地坐在柜台后面，在已经画满花朵、爱心和星星的涂鸦上漫不经心地画着什么。她抬起头，开始欢迎你。[say: 欢迎来到特莉的玩具与零食！我是特莉，而且——就是你以前见过的那个特莉！又见面了，[mister]！]她高兴地欢呼道。[say: 希望你在集市玩得开心！你想买点玩具或零食吗？]");
               }
               else
               {
                  outputText("特莉的玩具与零食店内部和外面一样色彩斑斓。右侧有两扇窗户，可以俯瞰许多箱子和抽屉，大概装着多余的库存或私人物品，而左侧则有一排被窗户照亮的架子。最底层的架子上放着许多装满彩色糖果的罐子；高层的架子上放着玩具和毛绒动物，都贴着标签和标价。在画满涂鸦的柜台后面，坐着一个金发小女孩，她有着淡褐色的眼睛，脸颊上画着一个[tellyvisual]，似乎正在缝补什么东西。你正想问这么一个看起来天真无邪的孩子在这个地方做什么，却注意到她头发里探出的小角。" + (FlagDict_Impl_.arrayReadInt(KFLAGS.flags,2698) > 0 ? "一个爱丽丝？" : "一个恶魔？"));
                  outputText("[pg]女孩从工作中抬起头，注意到了你，她的眼睛瞬间亮了起来。[say: 有客人了！终于！]她兴奋地从座位上跳起来，绕过柜台来迎接你。据你所见，她的裙子似乎完全由褶边和蕾丝组成，身高似乎不到四英尺。她伸出手抓住你的手，还没等你反应过来就摇了摇。[say: 欢迎来到特莉的玩具与零食！我是特莉，我卖玩具和零食！]");
                  outputText("[pg]你迅速缩回手，对这些看起来如此无辜的恶魔依然保持警惕。特莉咯咯地笑着对你说，[say: 我不会伤害你的，[mister]。我可能是一个爱丽丝，但我对作为商人的生活很满意！而且我告诉你：伤害你可能会让我在这个世界的生活变得复杂得多；即使守卫不在乎，其他店主肯定会在乎的！所以你跟我在一起很安全，我发誓！]她骄傲地站着，把一只手放在胸前。尽管信任一个恶魔听起来是个坏主意，但她说得很有道理。如果她只是想谋生，伤害你对她没什么好处。");
                  unlockCodexEntry(2698);
                  outputText("[pg]女孩回到柜台继续缝合看起来像是一只毛绒狼的东西。[say: 那么，你想买点什么吗？]");
               }
            }
            else if(incidenTelly && !get_tellyCommute())
            {
               set_tellyCommute(true);
               if(get_tellyGenesis())
               {
                  outputText("门没锁，你打开门，看到特莉开心地坐在柜台后面，正在缝补一个破损的毛绒玩具。你的进入引起了她的注意，她抬起头，兴奋地容光焕发。[say: 欢迎来到特莉的玩具与零食！我是特莉，而且——而且我记得你在集市上，[mister]！]她灿烂地笑着，脸颊上画着的[tellyvisual]形状都变形了。你同样对在这里找到她感到惊讶，离商队这么远。");
                  outputText("[pg][say: 那是个做生意的好地方，但把[b:所有]时间都花在那里太浪费钱了，]她解释道。特莉举起手中的玩具继续说道。[say: 我在哪里都能修东西，说不定还能找到一些不敢穿越平原的新顾客呢！而且我偶尔还要和一些定居点做生意。]");
               }
               else
               {
                  outputText("特莉的玩具与零食店内部和外面一样色彩斑斓。右侧有两扇窗户，可以俯瞰许多箱子和抽屉，大概装着多余的库存或私人物品，而左侧则有一排被窗户照亮的架子。最底层的架子上放着许多装满彩色糖果的罐子；高层的架子上放着玩具和毛绒动物，都贴着标签和标价。在画满涂鸦的柜台后面，坐着一个金发小女孩，她有着淡褐色的眼睛，脸颊上画着一个[tellyvisual]，似乎正在缝补什么东西。你正想问这么一个看起来天真无邪的孩子在这个地方做什么，却注意到她头发里探出的小角。" + (FlagDict_Impl_.arrayReadInt(KFLAGS.flags,2698) > 0 ? "一个爱丽丝？" : "一个恶魔？"));
                  outputText("[pg]女孩把针穿过手中的布料，然后抬头看了你一眼。[say: 哦？有客人？嗨！]她兴奋地喊道。[say: 我没想到这么偏僻的地方会有人来。欢迎来到特莉的玩具与零食，我是特莉，我卖玩具和零食！]她蹦蹦跳跳地绕过柜台，走到你面前伸出手想和你握手，这让你本能地往后缩了一下，对信任一个恶魔保持警惕，即使是一个[if (isChild) {和你同龄的|看起来如此无害的}]恶魔。看到你的反应，特莉咯咯地笑着解释道，[say: 我可不会伤害客人，[mister]，那对生意不好！]这位商人调皮地向后退了一步，把手背在身后补充道，[say: 而且我是一个爱丽丝，我做不了什么伤害别人的事。]");
                  unlockCodexEntry(2698);
               }
            }
            else if(get_time().days > get_experimenTelly() && get_experimenTelly() != 0 && !incidenTelly)
            {
               outputText("当你[walk]进特莉的店里时，这个小恶魔跳了起来。[say: [Mister]！]她惊呼着，冲过来迎接你。");
               outputText("[pg]你回应了她的问候，她激动得浑身发抖。[say: [Mister]，我给你做了个东西！]特莉冲到柜台后面，拿出了什么东西。不一会儿，她端着一个糕点卷回来了。她热情地递给你，渴望看到你的反应。面团被捏成了波浪状的褶皱，看起来几乎像一朵玫瑰。上面覆盖着一层棕褐色的糖霜。你无法拒绝她，便咬了一口。");
               outputText("[pg]你立刻尝到了肉桂、香草和奶油糖果的味道。它又甜又咸，带着挥之不去的黄油和糖的香气，不知怎的让你充满了活力。特莉等不及你的评价，开始解释这种零食。[say: 花会枯萎的，我知道我可以用龙心花做些特别的东西，所以我做了一种奶油糖果酱！]");
               outputText("[pg]她那细长的紫色尾巴来回摆动着，带着只有孩子才能表现出的那种无拘无束的喜悦。这糕点很美味，你无法否认，虽然对某些人来说可能太甜了。你感谢特莉的礼物。");
               outputText("[pg][say: 我很高兴能分享这份异国礼物的成果，]她说。[say: 你在这里还需要什么吗，[mister]？]");
               if(get_player().hasStatusEffect(StatusEffects.DragonBreathCooldown))
               {
                  get_player().removeStatusEffect(StatusEffects.DragonBreathCooldown);
               }
               get_player().changeFatigue(-get_player().get_fatigue());
               get_player().refillHunger(20);
               set_experimenTelly(0);
            }
            else if(param2)
            {
               outputText("当然，这听起来是个好建议。特莉咧嘴一笑，示意你走向后面的门。当你打开门走进去时，你看到柜台后面特莉床上的窗户开着，她倒挂着滑了进来，咯咯笑着落在枕头和毯子上。她滚下床，不一会儿就蹦蹦跳跳地来到了柜台前。");
               outputText("[pg][say: 欢迎来到特莉的玩具与零食！我是特莉，我卖玩具和零食！]");
               set_tellyGram(0);
            }
            else if(isHalloween(true) && !incidenTelly)
            {
               outputText("你走进这家色彩缤纷的商店，映入眼帘的是陈列着的各种玩具和装饰品，还有挂在各个角落的蜘蛛网。在画满涂鸦的柜台后面，坐着一个金发小女孩，她戴着可爱的蝴蝶结，头上长着两只短小的紫色角。她跳了起来，小小的恶魔翅膀拍打着，以稳定她过分热情的动作。");
               outputText("[pg][say:欢迎来到特莉的恶作剧与零食！]她大喊道。她浅蓝色的连衣裙和白色的围裙旋转着、跳跃着，她跑到柜台前面，拉近了距离。[say:我是特莉，我卖恶作剧和零食！]她灿烂的笑容使画在她脸颊上的[tellyvisual]变形了，她现在完全是一副活泼开朗的样子。");
               outputText("[pg]你向特莉打招呼，她跳了起来，好像想起了什么。[say:又到了每年的这个时候了，[mister]！一定要在天黑前买很多恶作剧和零食哦！]");
               outputText("[pg]这就是她卖的东西，所以“每年的这个时候”难道不是一整年吗？");
            }
            else
            {
               outputText("特莉的玩具与零食店内部和外部一样色彩缤纷。右侧有两扇窗户，可以俯瞰许多盒子和抽屉，里面大概装着多余的库存或个人物品，而左侧则有一排架子，被前面提到的窗户照亮。最底层的架子上放着许多装满彩色糖果的罐子；较高的架子上有玩具和毛绒动物，都贴有标签和标价。");
               if(get_tasTelly() == get_time().days * 100 + get_time().hours)
               {
                  outputText("特莉开心地坐在柜台后面，还在津津有味地吃着你给她的桃子。");
               }
               else if(get_experimenTelly() == get_time().days)
               {
                  outputText("特莉坐在柜台后面，开心地哼着歌，旁边展示着她新得的龙心花。");
               }
               else
               {
                  switch(get_tellyCardiogram())
                  {
                     case 0:
                        outputText("在画满涂鸦的柜台后面坐着特莉，那个活泼的金发爱丽丝。");
                        break;
                     case 1:
                        outputText("特莉坐在柜台后面不远处的一张床上，正拼命地紧紧抱着她的一个毛绒玩具。");
                        break;
                     case 2:
                        outputText("特莉正调皮地在她的柜台上画着更多的心。");
                  }
               }
               if(!param1)
               {
                  outputText("她抬头看着你，笑了。[say: 欢迎回到特莉的玩具与零食！我是特莉，我卖玩具和零食！你今天对什么感兴趣，[mister]？]");
                  set_tellyGram(0);
               }
            }
            if(param1)
            {
               tellyShopping();
            }
            else
            {
               tellyCopy();
            }
         }
      }
      
      public function tellyLens(param1:TellyAnalysis) : void
      {
         var tellyAnalysis1:TellyAnalysis;
         var _g1:Telly;
         var _loc3_:* = null as CoCButton;
         var _loc5_:* = null as ItemType;
         var _loc6_:* = null as Function;
         var _loc2_:int = param1.tellyPayment;
         var _loc4_:Either = param1.tellyProcessing;
         switch(_loc4_.index)
         {
            case 0:
               _loc5_ = _loc4_.params[0];
               _g1 = this;
               tellyAnalysis1 = param1;
               _loc6_ = function():void
               {
                  _g1.tellySales(tellyAnalysis1);
               };
               _loc3_ = addNextButton(param1.tellyNym,_loc6_).hint(_loc5_.get_tooltipText(),_loc5_.get_tooltipHeader());
               break;
            case 1:
               _loc6_ = _loc4_.params[0];
               _loc3_ = addNextButton(param1.tellyNym,_loc6_).hint(param1.tellyPrompt);
         }
         _loc3_.disableIf(get_player().get_gems() < _loc2_,_loc2_ > 1 ? "你需要" + _loc2_ + "宝石。" : "你没有任何东西可以付给她。");
      }
      
      public function tellyKinesis(param1:TellyAnalysis) : void
      {
         var tellyAnalysis1:TellyAnalysis;
         var _g1:Telly;
         var tellyStasis:Boolean;
         var _g:Telly;
         var _loc2_:* = null as ItemType;
         var _loc4_:* = null as ItemType;
         var _loc3_:Either = param1.tellyProcessing;
         if(_loc3_.index == 0)
         {
            _loc4_ = _loc3_.params[0];
            _loc2_ = _loc4_;
            var _loc5_:int = param1.tellyPayment;
            var _loc6_:Player = get_player();
            _loc6_.set_gems(_loc6_.get_gems() - _loc5_);
            statScreenRefresh();
            _g = this;
            tellyStasis = true;
            var _loc7_:Function = function():void
            {
               _g.tellyMarket(tellyStasis);
            };
            _g1 = this;
            tellyAnalysis1 = param1;
            var _loc8_:Function = function():void
            {
               _g1.tellyDrama(tellyAnalysis1);
            };
            get_inventory().takeItem(_loc2_,_loc7_,_loc8_);
            return;
         }
         throw Exception.thrown("在tellyProcessing中成功用函数命中了tellyKinesis。");
      }
      
      public function tellyHo(param1:String = undefined) : void
      {
         if(param1 == null)
         {
            param1 = "";
         }
         if(incidenTelly)
         {
            incidenTelly = false;
            if(param1 == "")
            {
               get_camp().returnToCampUseOneHour();
            }
            else
            {
               outputText(param1);
               doNext(get_camp().returnToCampUseOneHour);
            }
         }
         else
         {
            get_bazaar().enterTheBazaarAndMenu();
            get_bazaar().shopMenu();
         }
      }
      
      public function tellyGifted() : Boolean
      {
         if(tellyCom(TellyCom.TellyComB) || tellyCom(TellyCom.TellyComK) || tellyCom(TellyCom.TellyComP) || tellyCom(TellyCom.TellyComA) || tellyCom(TellyCom.TellyComD) || tellyCom(TellyCom.TellyComCC))
         {
            return true;
         }
         return false;
      }
      
      public function tellyGenic() : void
      {
         var _loc1_:* = null as Array;
         var _loc2_:* = null as Array;
         if(!get_tellyGenesis())
         {
            set_tellyTubby("purple");
            set_tellyGraph("butterfly");
         }
         else if(get_time().days > get_tellyTimer())
         {
            _loc1_ = tellyTubbies;
            set_tellyTubby(_loc1_[Utils.rand(int(_loc1_.length))]);
            _loc2_ = tellyGraphs;
            set_tellyGraph(_loc2_[Utils.rand(int(_loc2_.length))]);
         }
         if(get_time().days + get_time().hours / 24 > get_tellyTimer())
         {
            set_tellyCardiogram(Utils.rand(3));
         }
         set_tellyTimer(get_time().days + get_time().hours / 24);
      }
      
      public function tellyDramatic() : void
      {
         var _g:Telly;
         clearOutput();
         outputText("重新考虑了一下，你决定还是不要在脸上涂抹任何黏糊糊的东西了，尽管这种消遣很受欢迎。");
         outputText("[pg]小恶魔把颜料放在一边，发出一声委屈的[say:啊——]，然后回到了柜台后的座位上。");
         _g = this;
         doNext(function():void
         {
            _g.tellyMarket();
         });
      }
      
      public function tellyDrama(param1:TellyAnalysis) : void
      {
         var tellyStasis:Boolean;
         var _g:Telly;
         var _loc2_:int = param1.tellyPayment;
         var _loc3_:Player = get_player();
         _loc3_.set_gems(_loc3_.get_gems() + _loc2_);
         statScreenRefresh();
         outputText("[pg]特莉把宝石还给了你。[say: 等你有更多空间的时候，随时可以回来！]");
         _g = this;
         tellyStasis = true;
         doNext(function():void
         {
            _g.tellyMarket(tellyStasis);
         });
      }
      
      public function tellyDoscopic(param1:Boolean) : void
      {
         var _g1:Bazaar;
         var _g:Telly;
         clearOutput();
         if(param1)
         {
            outputText("虽然她的要求相当新奇，但你会尽力而为。");
            outputText("[pg]小恶魔指了指柜台后面的座位，示意你坐下。");
            if(get_player().isTaur())
            {
               outputText("作为一个非两足行走的生物，你没法像她那混乱的脑子想的那样做。这些腿可不只是毛茸茸的尾巴，特莉！");
               outputText("[pg][say: 哦，] 她说。[say: 那特莉就把尾巴带给你！]");
               outputText("[pg]特莉蹦蹦跳跳地" + (get_player().get_tallness() > 64 ? "跳上柜台" : "走过来") + "，转过身，调皮地摇晃着她的尾巴。");
            }
            else
            {
               outputText("按照指示，你坐在椅子上，特莉紧接着坐在你的腿上。她的尾巴来回摆动，带着孩子气的活力挥舞着黑桃形的尾尖。小恶魔向后靠，将她紫色的小翅膀贴在你的身上。");
            }
            outputText("[pg][say: 揉吧！] 她命令道。虽然这个姿势有点尴尬，但你还是赶紧抓住那条从她裙子腰部褶皱处伸出来的、肆意摆动的鞭子。令你惊讶和担忧的是，她猛地一抖。[say: 别粗鲁，[mister]！揉尾巴可是件精细活！]");
            outputText("[pg]你保持着小心翼翼和温柔的触感，抓住了那条紫色的尾巴。感觉和" + (get_player().tail.type == 3 ? "你自己的" : "皮革") + "差不多，绝对算不上毛茸茸。做着这个世界唯一训练过你的事情，你开始按摩这条长长的、肉质的附肢。特莉高兴地向后靠，发出幸福的呼噜声。当她前后摇晃时，丝绸般柔软的金发摩擦着你的手臂，带来一种舒缓的感觉，你还闻到了淡淡的樱桃香味。");
            outputText("[pg][say: 干得好，[Mister]狐妖！你让我们村子感到骄傲，你已经真正掌握了揉尾巴的艺术！] 女孩欢呼道。她向前倾身，走了几步，然后转过身来。[say: 在你正式获得揉尾巴大师认证之前，只剩下最后一次揉尾巴了！] 她张开双臂，示意要一个拥抱。");
            outputText("[pg]你拥抱了这只甜美的小妖狐，将你所有的毛茸茸都传递给她。作为回报，特莉用尽她所有的力气拥抱了你。");
            outputText("[pg][say: 你是我教过的最棒的揉尾巴大师！去向四面八方代表我们的村子，向他们展示真正的妖狐能做什么！]");
            outputText("[pg]特莉把你赶了出去，几乎是把你推向了她马车的出口。门在你身后关上，留下你独自沉思。");
            doNext(get_camp().returnToCampUseOneHour);
         }
         else
         {
            outputText("那条尾巴上根本没有毛茸茸的东西可以揉！她的尾巴就像一条带有黑桃形尖端的皮鞭，她一定是有什么毛病。");
            outputText("[pg]小恶魔对你的说法感到震惊，反驳道：[say: 特莉的尾巴和绒毛店只有最毛茸茸的绒毛！而且我是特莉，我的尾巴上有绒毛！]");
            outputText("[pg]即使中了那些该死的妖狐幻术，她还在使用头韵。你对这种胡言乱语摇了摇头，坚持认为店主被诅咒了，她实际上并没有任何毛茸茸的尾巴。她甚至根本没有多条尾巴。");
            outputText("[pg]特莉气呼呼地跺了跺脚，开始把你往出口推。[say: 我绝不容忍你在我的妖狐村里侮辱我的尾巴！] 当你走到门口时，她停了下来，示意你出去。[say: 没收集到50条毛茸茸的尾巴之前，别再回来了！]");
            outputText("[pg]说完，这位爱丽丝商人关上了马车。该死的精神妖狐。");
            set_tellyCommand(int(Math.floor(get_time().days)));
            if(incidenTelly)
            {
               _g = this;
               doNext(function():void
               {
                  _g.tellyHo();
               });
            }
            else
            {
               _g1 = get_bazaar();
               doNext(function():void
               {
                  _g1.enterTheBazaarAndMenu();
               });
            }
         }
      }
      
      public function tellyDoscopes(param1:Boolean) : void
      {
         var tellyGuidance1:Boolean;
         var _g1:Telly;
         var tellyGuidance:Boolean;
         var _g:Telly;
         clearOutput();
         if(param1)
         {
            outputText("如果不加入她这贪玩的性子，你可就太失职了——不然你来拜访她干嘛？你以符合你风格的浮夸动作，把小乐器拉近，开始敲击出完美的、制造悬念的节奏。");
            outputText("[pg][say: 完美！]快乐的小店主大喊道。");
         }
         else
         {
            outputText("你忍不住叹了口气，拒绝了她的请求，并告诉她赶紧打开礼物。");
            outputText("[pg][say: 可是[mister]，激动人心的揭晓时刻总是需要鼓声的！]她嘟着嘴说。这位店主并未气馁，把鼓放在身边，用尾巴练习敲了几下。她集中注意力了一会儿，在心理上为接下来的表演做准备，直到很快她的尾巴释放出一阵惊人的连续敲击。听起来她自己就能搞定这鼓声。");
         }
         outputText("[pg]特莉的双手放在盒盖上，随着鼓声急促的节奏，她脸上的兴奋之情溢于言表。当节拍达到高潮时，特莉将盖子举过头顶，眼睛紧紧盯着里面的东西。紧随其后，一股蓝色的烟雾喷到了恶魔的脸上。");
         outputText("[pg]小女孩被这突如其来的喷射弄得晕头转向，她皱着眉头，踉跄着后退。[say: 啊！]她只说了这么一句。特莉揉了揉脸，意识到自己没事后，很快又看向了你。她脸上带着一种指责但又俏皮的神情，问道：[say: 你是在恶作剧吗，[mister]？]");
         outputText("[pg]老实说，你并不清楚盒子里装的是什么，尽管你有一些猜测。但至少，它不会太危险。" + (get_player().cor > 66 || get_player().lib > 66 ? "你内心深处的本能希望那是一种妖狐催情剂。" : ""));
         outputText("[pg]还没等你做出适当的回应，特莉双手叉腰，大声宣布：[say: 那么，为了弥补那个恶作剧，你最好来揉揉我的尾巴！]");
         outputText("[pg]你说什么？");
         menu();
         _g = this;
         tellyGuidance = true;
         addNextButton("揉尾巴",function():void
         {
            _g.tellyDoscopic(tellyGuidance);
         }).hint("摸摸特莉的尾巴！");
         _g1 = this;
         tellyGuidance1 = false;
         addNextButton("什么？",function():void
         {
            _g1.tellyDoscopic(tellyGuidance1);
         }).hint("她的尾巴又细又长，根本没法揉。");
      }
      
      public function tellyDoscope() : void
      {
         var tellyGuidance1:Boolean;
         var _g1:Telly;
         var tellyGuidance:Boolean;
         var _g:Telly;
         clearOutput();
         outputText("你向恶魔女孩献上一份礼物：一个用白纸包裹、细绳系着的方形包裹。");
         outputText("[pg]特莉的眼睛里闪烁着兴奋的光芒。[say: 谢谢你，[mister]！我喜欢礼物！]她惊呼道，迅速解开绑绳，展开包装纸。小女孩深吸了一口气，双手悬停在上面，享受着这一刻。[say: 等等！]她大喊一声，跑到柜台后面的房间里去拿什么东西。");
         outputText("[pg]特莉拿着一个小鼓回来了。[say: 请来点鼓声！]");
         tellyCom(TellyCom.TellyComK,true);
         get_player().destroyItems(get_consumables().KITGIFT,1);
         menu();
         _g = this;
         tellyGuidance = true;
         addNextButton("好的",function():void
         {
            _g.tellyDoscopes(tellyGuidance);
         }).hint("你很乐意配合她。");
         _g1 = this;
         tellyGuidance1 = false;
         addNextButton("直接打开",function():void
         {
            _g1.tellyDoscopes(tellyGuidance1);
         }).hint("快点吧！");
      }
      
      public function tellyCopy() : void
      {
         var _g1:Telly;
         var _g:Telly;
         menu();
         addButton(0,"购买",tellyShopping);
         addButton(1,"外貌",tellyVision);
         _g = this;
         addButton(2,"交谈",function():void
         {
            _g.tellySurvey();
         }).hint("她看起来很友好，聊聊怎么样？");
         _g1 = this;
         addButton(14,"离开",function():void
         {
            _g1.tellyHo();
         });
      }
      
      public function tellyCommunication() : void
      {
         var tellyCall:Function;
         var _gthis:Telly;
         var _loc4_:* = null as Array;
         var _loc5_:int = 0;
         var _loc6_:* = null as String;
         var _loc7_:Boolean = false;
         var _loc8_:* = null as String;
         var _loc9_:* = null as String;
         var _loc10_:Boolean = false;
         var _loc11_:* = null as Object;
         _gthis = this;
         clearOutput();
         set_tellyGram(get_tellyGram() + 1);
         tellyCall = function(param1:int):Boolean
         {
            if(param1 == _gthis.uTellyty)
            {
               return false;
            }
            switch(param1)
            {
               case 6:
                  return _gthis.get_game().telAdre.isDiscovered();
               case 8:
                  if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,2727) > 0)
                  {
                     return _gthis.get_player().isChild();
                  }
                  return false;
                  break;
               case 9:
                  return _gthis.get_game().akky.isOwned();
               case 10:
                  return _gthis.get_tellyGram() > 2;
               case 12:
                  return FlagDict_Impl_.arrayReadInt(KFLAGS.flags,628) > 0;
               case 13:
                  if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,2697) != 0)
                  {
                     return _gthis.get_allowChild();
                  }
                  return false;
                  break;
               case 18:
                  return _gthis.get_player().hasKeyItem("Hentai Comic");
               case 20:
                  return _gthis.get_tellyPlasmed();
               case 21:
                  return _gthis.get_tellyGenesis();
               case 23:
                  return _gthis.get_tellyGram() > 22;
               default:
                  return true;
            }
         };
         var _loc1_:Array = [];
         var _loc2_:* = get_tellyOphile();
         var _loc3_:* = _loc2_;
         _loc4_ = Reflect.fields(_loc2_);
         _loc5_ = 0;
         while(_loc5_ < int(_loc4_.length))
         {
            _loc6_ = _loc4_[_loc5_++];
            _loc7_ = Boolean(Reflect.field(_loc3_,_loc6_));
            _loc8_ = _loc6_;
            _loc9_ = _loc8_;
            _loc10_ = _loc7_;
            _loc11_ = Std.parseInt(_loc9_);
            if(!_loc10_ && Boolean(tellyCall(_loc11_)))
            {
               _loc1_.push(_loc11_);
            }
         }
         if(int(_loc1_.length) == 0)
         {
            _loc5_ = 0;
            _loc4_ = Reflect.fields(get_tellyOphile());
            while(_loc5_ < int(_loc4_.length))
            {
               _loc6_ = _loc4_[_loc5_];
               _loc5_++;
               _loc11_ = Std.parseInt(_loc6_);
               if(Boolean(tellyCall(_loc11_)))
               {
                  _loc1_.push(_loc11_);
               }
            }
         }
         _loc4_ = _loc1_;
         _loc5_ = int(_loc4_[Utils.rand(int(_loc4_.length))]);
         get_tellyOphile()["" + _loc5_] = true;
         uTellyty = _loc5_;
         switch(_loc5_)
         {
            case 1:
               outputText("特莉最喜欢的颜色是什么？");
               outputText("[pg][say: [b: 黑色]，比黑夜更深邃，被我灵魂中暗影般的墨汁洗涤过，]她睁大眼睛回答道。你几乎能看到她眼中强忍着的笑意，然后她终于绷不住了。[say: 哈！我喜欢这个问题，从来没人问过！我喜欢……粉色。不——紫色！紫红色！]特莉把手托在下巴上，皱起眉头，仔细思考着这个问题。[say: 蓝色没有得到足够的重视！不过红色真的很热情！]");
               outputText("[pg]恶魔以一种戏剧性的方式旋转着，倒在身后紧贴着马车后部的床上。[say: 所有的颜色都需要它们闪耀的时刻。]她的声音渐渐小了下去。");
               outputText("[pg]特莉重新站起来，反问道。[say: 你最喜欢什么颜色？]");
               break;
            case 2:
               outputText("特莉双手托腮，身体前倾，在讲述她那些随意的轶事时，尾巴俏皮地甩动着。");
               outputText("[pg][say: 哦！]店主惊呼道，她的尾巴绷得笔直，以示强调，[say: 前几天，我在穿过森林的小路上停下来，看到了一只[b: 狐狸！]]特莉双手握拳，努力控制着自己的兴奋。[say: 他的毛超级柔软，而且他真的很友好！]");
               outputText("[pg]狐狸通常会避开人类。特莉对野生动物有什么神奇的亲和力吗？");
               outputText("[pg]特莉给了你一个眯起眼睛、露出牙齿的灿烂笑容。[say: 我喜欢动物！你只需要温柔友好，它们就会回报你。你有最喜欢的动物吗，[mister]？]");
               break;
            case 3:
               outputText("当你们聊着一些日常话题时，你的目光扫过特莉坐着的那个画满涂鸦的柜台。虽然有些涂鸦很粗糙、很滑稽，但另一些却出奇地细致。总的来说，她的画风偏向可爱。你问了一些关于涂鸦的事情。");
               outputText("[pg][say: 有一天，我没有多余的钱，不能去买更多的材料来做更多的产品。我必须先把我现有的东西卖掉。]特莉的手划过柜台上一部分画着的蜿蜒藤蔓，手指在上面长出的一些复杂图案上摩擦着。[say: 我觉得无聊，就开始乱画。]");
               outputText("[pg]恶魔歪着头回忆着。[say: 我本来想让柜台保持专业，像个正经商人一样，但后来我发现我喜欢这样！这让我在等待的时候有事可做，也让我的店更“我”！]她抬起头，露出自豪的表情。");
               break;
            case 4:
               outputText("相对于这个世界上的其他人来说，特莉很有时尚感。她那些衣服是自己做的吗，就像她做那些毛绒玩具一样？");
               outputText("[pg][say: 我的一些衣服和其他爱丽丝获得衣服的方式一样。]特莉在说这话时高兴地盯着你，似乎觉得这个回答已经足够了。");
               break;
            case 5:
               outputText("也许正如预料的那样，话题转向了甜食。特莉对糖果有着相当的偏好，无法确定最喜欢哪一种。");
               outputText("[pg]特莉详细阐述了她的首选。[say: 最好的味道是苦的、咸的和香的。分别是巧克力、海盐焦糖和奶油糖果！]她捧着脸，幻想着那些美食，口水都流出来了。");
               break;
            case 6:
               outputText("很遗憾特莉是个恶魔；否则在城里做生意会有很大的潜力。特莉不知道你指的是什么，让你具体说明是哪个城市，你向她详细介绍了特尔阿德雷及其现状。");
               outputText("[pg]在吸收了你给她的所有背景信息后，特莉似乎对她无法进入那里感到无动于衷。[say: 特尔阿德雷听起来就像是我预想中那种会用税收把我榨干的城市。]");
               outputText("[pg]说得像个真正的商人。");
               break;
            case 7:
               outputText("你好奇特莉还认识其他的爱丽丝吗？");
               outputText("[pg][say: 当然，我认识好几个！]她回答道。[say: 她们通常很高兴能和一个有家的爱丽丝待在一起——特莉给了她们希望！]");
               break;
            case 8:
               outputText("[say: 你是我最喜欢的爱丽丝，[mister]！]小恶魔突然插嘴道。");
               break;
            case 9:
               outputText("[say: 你有宠物吗？]她兴奋地甩着铲状的尾巴问道。");
               outputText("[pg]碰巧你确实有，你把[akky]的事都告诉了她。这只毛茸茸、短毛的小家猫是一个非常友好的伙伴。");
               outputText("[pg][say: 他听起来很可爱，[mister]！我也喜欢猫，如果我碰巧发现流浪猫，我总是忍不住去喂它们！]");
               break;
            case 10:
               outputText("特莉灿烂地笑了。[say: 我喜欢和你说话，[mister]。]");
               break;
            case 11:
               outputText("当商人详细介绍许多适合给漆上色的染料时，你思考她是如何学会这么多手艺的。");
               outputText("[pg]特莉很高兴地解释道，[say: 在我长大的地方，父母教孩子如何运用他们的技能是很正常的。]");
               outputText("[pg]既然如此，特莉的父母是做漆器的吗？");
               outputText("[pg]小恶魔点点头。[say: 它制作起来非常便宜和容易，几乎任何房子有了它都会更好。它有助于隔热、支撑和装饰！]");
               break;
            case 12:
               outputText("这片土地上有许多奇怪的生物，与你在英格纳姆所知道的完全不同，而妖狐是你见过的魔法能力更强的生物之一。你似乎无法靠近她们，因为她们的幻觉开始压迫你的精神。");
               outputText("[pg]特莉用关切的语气说道，[say: 小心那些狐狸女孩，[mister]。]她警惕地环顾四周，凑近低声说，[say: 我听说她们甚至绑架爱丽丝，让她们连续几个小时玩换装游戏！]");
               outputText("[pg]真是可怕的命运。");
               break;
            case 13:
               outputText("作为一个爱丽丝，她进食一定很困难。她怎么能如此热情地经营一家商店？她以谁为食？");
               outputText("[pg][say: 我唯一需要进食的就是甜食和微笑！]她笑着说。");
               break;
            case 14:
               outputText("[say: 事实上，是的。]小女孩说道。至于对什么，你毫无头绪。");
               outputText("[pg]她轻笑了一声。[say: 我一直希望有一天我能在有人问我是否有读心术之前说出这句话。]");
               break;
            case 15:
               outputText("你们俩开始讨论天气。虽然在你的家乡这只是简单的闲聊，但在某些圈子里，这显然是一个备受争议的话题。");
               break;
            case 16:
               outputText("那么，特莉今天过得怎么样？");
               outputText("[pg][say: 我一醒来就笑了，我打算一整天都保持微笑，]特莉欢快地说。[say: 如果你今天也多笑笑，我的笑容会更灿烂，[mister]。]");
               break;
            case 17:
               outputText("魔法是一个相当广泛的学科，恶魔通常掌握了其中的一部分。特莉知道多少呢？");
               outputText("[pg][say: 我知道很多基础的东西，主要是关于身体和精神效果的，]她解释道。有点模糊，这并不能缩小多少范围。她重新思考答案时，轻轻哼了一声。[say: 我知道很多黑魔法，一些白魔法，还有很多幻术。]");
               if(!get_player().hasSpells())
               {
                  outputText("[pg]黑魔法和白魔法，她说？你没想到恶魔也能使用白魔法。");
                  outputText("[pg][say: 咦？哦，黑魔法只是身体操纵，而白魔法更像是物质方面的东西，]她澄清道，努力想表达得更好。[say: 也不完全是，我想，但很接近。白魔法更完全是非物质的，但在物质方面有很好的实用性。]特莉抓着头呻吟着。[say: 我不是个好老师，对不起，[mister]。]");
                  outputText("[pg]这个解释还不算太糟。虽然可能不够全面，但你觉得你已经抓住了要点。");
               }
               break;
            case 18:
               outputText("店主注意到你的变态漫画从包里露出了一个角。[say: 哦！你看漫画？]她问道。[say: 是什么类型的？我能看看吗？]");
               outputText("[pg]她是个恶魔，没错，但不知怎么的，你不确定她是否喜欢你碰巧拥有的那种漫画。");
               menu();
               addNextButton("分享",function():void
               {
                  _gthis.outputText("[pg]为了满足小女孩的好奇心，你拿出漫画扔给了她。特莉以熟练的敏捷接住了书并打开，目光在书页上流连。");
                  _gthis.outputText("[pg]红晕蔓延了她的整张脸。[say: 哦-哦，是<b>这种</b>漫画。]");
                  _gthis.outputText("[pg]恶魔女孩迅速把它还给了你，看起来对这件事感到非常尴尬。");
                  _gthis.tellySurvey();
               }).hint("不管怎样，她仍然是个恶魔" + (incidenTelly ? "" : "在集市上") + "。不会太震惊的。");
               addNextButton("解释",function():void
               {
                  _gthis.outputText("[pg]试图平息她的兴奋，你解释说这是一本相当成人的漫画。");
                  _gthis.outputText("[pg]特莉双手叉腰，装出一副愤慨的样子。[say: 我比看起来要大！]");
                  _gthis.outputText("[pg]你的意思是，这是一本画着色情内容的下流书。");
                  _gthis.outputText("[pg][say: 哦！]她惊讶地说。[say: 对不起，我不是故意侵犯你的隐私的！]");
                  _gthis.outputText("[pg]没关系。");
                  _gthis.tellySurvey();
               }).hint("也许可以保护她可能不是处女的眼睛。");
               return;
            case 19:
               outputText("谈话不知不觉地转到了你的任务上，就像许多谈话经常发生的那样。当你概述你消灭莉希丝和瓦解恶魔大军的任务时，你想知道特莉是否对此感到困扰。");
               outputText("[pg][say: 根本不会，[mister]，你看起来是个好人。]特莉对你笑了笑，简单地表达了她的想法。[say: 你只会伤害那些坏恶魔。]");
               outputText("[pg]她乐观的态度令人耳目一新。既然她这么善良，她会不会知道一些关于恶魔的内幕消息，能对你的任务有所帮助？");
               outputText("[pg][say: 抱歉，我不是什么士兵，也不是什么大恶魔，]她解释道，举起双手摆出爪子的形状，来展示她作为\'大恶魔\'的凶猛。");
               break;
            case 20:
               outputText("你琢磨着这个小恶魔是怎么做糖果的，因为它们非常美味。");
               outputText("[pg][say: 实验很有趣，但糖、水、蜂蜜和果汁是主要成分，]她说。她似乎很乐意给出大致的制作过程，并进一步阐述道，[say: 我把它煮沸，然后尝试加入不同种类的水果或任何我想加的东西。这真的很简单，而且发现你能做出什么东西来也很令人兴奋！]");
               break;
            case 21:
               outputText("在你的经验中，恶魔店主并不常见，但外面还是有一些的。你们俩的谈话逐渐转移到了这个话题上，特莉提到了集市上的常驻裁缝，格蕾塔。");
               outputText("[pg][say: 她是一个高大、粉红色的魅魔，]特莉解释道。[say: 我很高兴她除了做爱之外，还找到了自己追求的激情。]");
               outputText("[pg]不用说，你很好奇她们俩是怎么相处的，因为她们都懂缝纫和编织。面对这个问题，特莉的表情有些动摇。");
               outputText("[pg][say: 格蕾塔真的很讨厌爱丽丝，]她承认道。[say: 但她并没有对我<b>做</b>什么，所以也没那么糟。大多数恶魔都认为我们是最差劲的，甚至可能比小恶魔还不如。]");
               break;
            case 22:
               outputText("恶魔是强大的、没有灵魂的怪物，散发着性欲和力量，至少你一直被引导着这么认为。" + (FlagDict_Impl_.arrayReadInt(KFLAGS.flags,2044) > 0 ? "显然小恶魔不是这样的，但为" : "为") + "什么爱丽丝们如此不符合这种刻板印象呢？");
               outputText("[pg][say: 魔法和炼金术，[mister]！]特莉回答道。[say: 而且是非常强大的东西！如果你有幸找到那些特殊的药水，你最好祈祷你不会不小心喝掉它！]");
               outputText("[pg]记下了。");
               break;
            case 23:
               outputText("特莉咯咯地笑了起来。[say: 你真的很健谈，[mister]！]");
         }
         tellySurvey();
      }
      
      public function tellyCom(param1:TellyCom, param2:Boolean = false) : Boolean
      {
         var _loc3_:Boolean = false;
         switch(param1.index)
         {
            case 0:
               return tellyMetry.tellyComL = tellyMetry.tellyComL || param2;
            case 1:
               return tellyMetry.tellyComB = tellyMetry.tellyComB || param2;
            case 2:
               return tellyMetry.tellyComK = tellyMetry.tellyComK || param2;
            case 3:
               return tellyMetry.tellyComP = tellyMetry.tellyComP || param2;
            case 4:
               return tellyMetry.tellyComA = tellyMetry.tellyComA || param2;
            case 5:
               return tellyMetry.tellyComH = tellyMetry.tellyComH || param2;
            case 6:
               return tellyMetry.tellyComD = tellyMetry.tellyComD || param2;
            case 7:
               return tellyMetry.tellyComCC = tellyMetry.tellyComCC || param2;
            default:
               return;
         }
      }
      
      public function tellyBears(param1:Boolean = true, param2:int = 0) : void
      {
         var tellyAnalysis:TellyAnalysis;
         var _g4:Telly;
         var tellyStasis:Boolean;
         var _g3:Telly;
         var tellyGuidance3:int;
         var tellyCall2:Boolean;
         var _g2:Telly;
         var tellyGuidance2:int;
         var tellyCall1:Boolean;
         var _g1:Telly;
         var tellyGuidance1:int;
         var tellyCall:Boolean;
         var _g:Telly;
         var _loc3_:* = null as Player;
         var _loc4_:* = null as Inventory;
         var _loc5_:* = null as TeddyBear;
         var _loc6_:* = null as Function;
         if(param1)
         {
            clearOutput();
            outputText("既然可以直接让特莉用拥抱为你充能，只买熊似乎太浪费了。那样效率会高得多。");
            outputText("[pg]特莉咯咯地笑了起来。[say: 特别温暖的特莉抱抱只为你准备，[mister]！来让特莉为你充能吧！] 她张开双臂大声说道。");
            outputText("[pg]你顺势[walk]过去，紧紧拥抱住这个恶魔女孩，" + (get_player().get_tallness() > 53 ? "顺势将她抱离地面，" : "") + "发现你对这个世界的所有烦恼和担忧都烟消云散了。特莉的身体柔软而温暖，当她尽可能紧地抱住你时，你能感受到她那欣喜若狂的天性。与此同时，她的尾巴像兴奋的小狗一样来回摇摆。");
            outputText("[pg]松开拥抱后，特莉灿烂的笑容点亮了她的整个脸庞。[say: 希望这能让你一整天都充满活力，[mister]。] 她的双手交叠放在腰间，淡褐色的眼眸移开了视线。[say: 但如果想在家里或出门在外时补充活力，这些毛绒熊随时都能给你打气！]");
            get_player().dynStats(DynStat.Cor(0.5));
            get_player().changeFatigue(-20);
            set_vesTelly(int(Math.floor(get_time().days * 100 + get_time().hours)));
            menu();
            _g = this;
            tellyCall = false;
            tellyGuidance1 = 0;
            addNextButton("购买",function():void
            {
               _g.tellyBears(tellyCall,tellyGuidance1);
            }).hint("你现在很乐意买下它！").disableIf(get_player().get_gems() < 50,"你需要50颗宝石。");
            _g1 = this;
            tellyCall1 = false;
            tellyGuidance2 = 1;
            addNextButton("捐赠",function():void
            {
               _g1.tellyBears(tellyCall1,tellyGuidance2);
            }).hint("她已经赚够了这只熊的钱。").disableIf(get_player().get_gems() == 0,"你没有多余的宝石。");
            _g2 = this;
            tellyCall2 = false;
            tellyGuidance3 = 2;
            addNextButton("不用了",function():void
            {
               _g2.tellyBears(tellyCall2,tellyGuidance3);
            }).hint(get_player().get_gems() < 20 ? "不管怎样，你进来时就没打算给她钱。" : "你打算再逛逛。");
         }
         else
         {
            switch(param2)
            {
               case 0:
                  clearOutput();
                  outputText("在体验了特莉那令人想抱抱的魅力后，你确信买下这些熊绝对物超所值！你毫不犹豫地支付了50颗宝石。");
                  outputText("[pg][say: 非常感谢您光临特莉的玩具与零食！]这位熟练的小商人说道。");
                  _loc3_ = get_player();
                  _loc3_.set_gems(_loc3_.get_gems() - 50);
                  tellyCom(TellyCom.TellyComH,true);
                  _loc4_ = get_inventory();
                  _loc5_ = get_useables().TELBEAR;
                  _g3 = this;
                  tellyStasis = true;
                  _loc6_ = function():void
                  {
                     _g3.tellyMarket(tellyStasis);
                  };
                  _g4 = this;
                  tellyAnalysis = new TellyAnalysis(OneOf_Impl_.fromA(get_useables().TELBEAR),"TeddyBear",50,"");
                  _loc4_.takeItem(_loc5_,_loc6_,function():void
                  {
                     _g4.tellyDrama(tellyAnalysis);
                  });
                  break;
               case 1:
                  clearOutput();
                  outputText("没有这个必要，你非常自信地认为，一个直接的拥抱绝对抵得上这只熊的价值，于是你给了她" + (get_player().get_gems() < 51 ? "你所有的宝石" : "全额的50颗宝石") + "。");
                  outputText("[pg]特莉高兴得发抖，接过了钱。[say: 非常感谢您光临特莉的玩具与零食！我很乐意给您尽可能多充满爱的特莉拥抱！]");
                  outputText("[pg]她说完后，突然又给了你一个更短暂、更自然的拥抱。");
                  _loc3_ = get_player();
                  _loc3_.set_gems(_loc3_.get_gems() - (get_player().get_gems() >= 50 ? 50 : get_player().get_gems()));
                  tellyCom(TellyCom.TellyComH,true);
                  doNext(tellyShopping);
                  break;
               case 2:
                  clearOutput();
                  outputText("就目前而言，你宁愿现在不拿熊" + (get_game().cabin.get_bedBears() >= 10 ? "，你家里的泰迪堡垒已经满员了" : "") + "。尽管如此，这个拥抱还是很棒的，你很感激她。");
                  outputText("[pg]特莉的情绪微微黯淡了一些。[say: 我明白了。我希望您能看到我提供的其他产品和服务的价值！]");
                  doNext(tellyShopping);
            }
         }
      }
      
      public function tellyBear() : void
      {
         var _g2:Telly;
         var tellyStasis:Boolean;
         var _g1:Telly;
         var tellyAnalysis:TellyAnalysis;
         var _g:Telly;
         clearOutput();
         outputText("你查看了一大堆毛绒小熊。[say:那些可是正宗的特莉熊哦，[mister]！]特莉在柜台后喊道。[say:每一只我都抱过，给它们充满了爱，好温暖每一个需要拥抱的人的心！]她用小指戳着脸颊，露出灿烂的笑容，以此来强调她的推销。[say:如果你感兴趣的话，只要50宝石！]");
         menu();
         _g = this;
         tellyAnalysis = new TellyAnalysis(OneOf_Impl_.fromA(get_useables().TELBEAR),"TeddyBear",50,"");
         addNextButton("是",function():void
         {
            _g.tellyKinesis(tellyAnalysis);
         }).disableIf(get_player().get_gems() < 50,"你需要50宝石。");
         _g1 = this;
         tellyStasis = true;
         addNextButton("否",function():void
         {
            _g1.tellyMarket(tellyStasis);
         });
         _g2 = this;
         addNextButton("拥抱特莉",function():void
         {
            _g2.tellyBears();
         }).hint("跳过中间" + (get_silly() ? "熊" : "商") + "。");
      }
      
      public function tellyAlgia(param1:int) : void
      {
         var _g:Telly;
         var _loc2_:Player = get_player();
         _loc2_.set_gems(_loc2_.get_gems() - 5);
         statScreenRefresh();
         clearOutput();
         outputText("你递给女孩5颗宝石，并告诉她你想要什么。她招呼你坐下，立刻开始工作。");
         if(get_player().isFurry())
         {
            outputText("[pg][say: 在毛皮上画画有点奇怪，但我会尽力的！]");
         }
         else if(get_player().hasGooSkin())
         {
            outputText("[pg][say: 呃，让我想想，] 她一边说，一边用画笔试探性地画了几笔。[say: 哦！可以画！我本来还不确定颜料能不能在这么黏糊糊的东西上起作用呢！]");
         }
         outputText("[pg]特莉开始作画时高兴地哼着歌，[say: 别担心，有我照顾你呢，大家都知道特莉非常关心她的顾客！]");
         outputText("[pg]她每画一笔都伴随着欢快的哼唱声，在画出大体轮廓后，她用一个小巧扁平的工具清理形状的边缘。当特莉装饰你的脸颊时，她漫不经心地聊着她对艺术的热爱。然而，你任何试图回应的举动，都会换来她警告你画画时不要乱动嘴巴。");
         outputText("[pg]特莉画完了，迅速抓起一面镜子向你展示她的作品。[say:看！为了像你这样棒的顾客，我可是尽了全力的！希望你能喜欢。]你微微偏头，欣赏着" + Utils.cnName(TELLYPHOTOS[param1]) + "。[say:不过要记住哦，这是一种相当便宜的糊状颜料，很容易就会掉色。欢迎你随时再来画一个。这可是特莉的特别招待！]");
         var _loc3_:StatusEffect = get_player().createOrFindStatusEffect(StatusEffects.TellyVised);
         _loc3_.value1 = param1;
         _loc3_.setDuration(12);
         _g = this;
         doNext(function():void
         {
            _g.tellyMarket();
         });
      }
      
      public function sweeTelly() : void
      {
         var _g:Telly;
         clearOutput();
         outputText("考虑到特莉对甜食的喜爱，她可能会喜欢这个桃子。而且，它来自一个如此遥远而独特的地方，你敢打赌她绝对没尝过。");
         outputText("[pg]她惊叹于这颗带有红色条纹的水果，向你道谢后，立刻咬了一口。[say: 好甜啊！] 她惊呼道，在嘴里细细品味着果香。[say: 这让我想起了胡须果，但味道没那么冲。真的很清爽。]");
         outputText("[pg]店主一边嚼着水果，一边继续发出各种高兴的声音。[say: 非常感谢你给我带来这个，[mister]。]");
         get_player().destroyItems(get_consumables().PURPEAC,1);
         tellyCom(TellyCom.TellyComP,true);
         set_tasTelly(int(Math.floor(get_time().days * 100 + get_time().hours)));
         _g = this;
         doNext(function():void
         {
            _g.tellyMarket();
         });
      }
      
      public function set_vesTelly(param1:int) : int
      {
         tellyMetry.vesTelly = param1;
         return param1;
      }
      
      public function set_tellyTubby(param1:String) : String
      {
         tellyMetry.tellyTubby = param1;
         return param1;
      }
      
      public function set_tellyTimer(param1:Number) : Number
      {
         tellyMetry.tellyTimer = param1;
         return param1;
      }
      
      public function set_tellyPlasmed(param1:Boolean) : Boolean
      {
         tellyMetry.tellyPlasmed = param1;
         return param1;
      }
      
      public function set_tellyOphile(param1:*) : *
      {
         return param1;
      }
      
      public function set_tellyGraph(param1:String) : String
      {
         tellyMetry.tellyGraph = param1;
         return param1;
      }
      
      public function set_tellyGram(param1:int) : int
      {
         tellyMetry.tellyGram = param1;
         return param1;
      }
      
      public function set_tellyGenesis(param1:Boolean) : Boolean
      {
         tellyMetry.tellyGenesis = param1;
         return param1;
      }
      
      public function set_tellyCommute(param1:Boolean) : Boolean
      {
         return tellyMetry.tellyCommute = param1;
      }
      
      public function set_tellyCommand(param1:int) : int
      {
         tellyMetry.tellyCommand = param1;
         return param1;
      }
      
      public function set_tellyCardiogram(param1:int) : int
      {
         tellyMetry.tellyCardiogram = param1;
         return param1;
      }
      
      public function set_tasTelly(param1:int) : int
      {
         tellyMetry.tasTelly = param1;
         return param1;
      }
      
      public function set_noncommiTelly(param1:Boolean) : Boolean
      {
         return tellyMetry.noncommiTelly = param1;
      }
      
      public function set_experimenTelly(param1:int) : int
      {
         tellyMetry.experimenTelly = param1;
         return param1;
      }
      
      public function saveToObject() : Object
      {
         return tellyMetry;
      }
      
      public function reset() : void
      {
         tellyMetry.tellyGenesis = false;
         tellyMetry.noncommiTelly = false;
         tellyMetry.tellyCommute = false;
         tellyMetry.tellyTubby = "purple";
         tellyMetry.tellyGraph = "butterfly";
         tellyMetry.tellyCardiogram = 0;
         tellyMetry.tellyTimer = 0;
         tellyMetry.tellyGram = 0;
         tellyMetry.tellyCommand = 0;
         tellyMetry.tellyPlasmed = false;
         tellyMetry.vesTelly = 0;
         tellyMetry.tasTelly = 0;
         tellyMetry.experimenTelly = 0;
         tellyMetry.immorTelly = 0;
         tellyMetry.tellyComL = false;
         tellyMetry.tellyComB = false;
         tellyMetry.tellyComK = false;
         tellyMetry.tellyComP = false;
         tellyMetry.tellyComA = false;
         tellyMetry.tellyComH = false;
         tellyMetry.tellyComD = false;
         tellyMetry.tellyComCC = false;
         tellyMetry.tellyOphile = {
            "1":false,
            "2":false,
            "3":false,
            "4":false,
            "5":false,
            "6":false,
            "7":false,
            "8":false,
            "9":false,
            "10":false,
            "11":false,
            "12":false,
            "13":false,
            "14":false,
            "15":false,
            "16":false,
            "17":false,
            "18":false,
            "19":false,
            "20":false,
            "21":false,
            "22":false,
            "23":false
         };
      }
      
      public function onAscend(param1:Boolean) : void
      {
         reset();
      }
      
      public function load(param1:int, param2:*) : void
      {
         var _loc3_:* = null as Array;
         Utils.extend(tellyMetry,param2);
         if(param1 == 1)
         {
            _loc3_ = Utils.bits2Array(Reflect.field(param2,"tellyOphile"),30);
            tellyMetry.tellyComL = Boolean(_loc3_[7]);
            tellyMetry.tellyComB = Boolean(_loc3_[8]);
            tellyMetry.tellyComK = Boolean(_loc3_[25]);
            tellyMetry.tellyComP = Boolean(_loc3_[26]);
            tellyMetry.tellyComA = Boolean(_loc3_[27]);
            tellyMetry.tellyComH = Boolean(_loc3_[28]);
            tellyMetry.tellyComD = Boolean(_loc3_[29]);
            tellyMetry.tellyOphile = {
               "1":Boolean(_loc3_[1]),
               "2":Boolean(_loc3_[2]),
               "3":Boolean(_loc3_[3]),
               "4":Boolean(_loc3_[4]),
               "5":Boolean(_loc3_[5]),
               "6":Boolean(_loc3_[6]),
               "7":Boolean(_loc3_[9]),
               "8":Boolean(_loc3_[10]),
               "9":Boolean(_loc3_[11]),
               "10":Boolean(_loc3_[12]),
               "11":Boolean(_loc3_[13]),
               "12":Boolean(_loc3_[14]),
               "13":Boolean(_loc3_[15]),
               "14":Boolean(_loc3_[16]),
               "15":Boolean(_loc3_[17]),
               "16":Boolean(_loc3_[18]),
               "17":Boolean(_loc3_[19]),
               "18":Boolean(_loc3_[20]),
               "19":Boolean(_loc3_[21]),
               "20":Boolean(_loc3_[22]),
               "21":Boolean(_loc3_[23]),
               "22":Boolean(_loc3_[24]),
               "23":false
            };
         }
         if(param1 == 2)
         {
            tellyMetry.tellyOphile["23"] = false;
         }
      }
      
      public function hospiTellyty() : void
      {
         var hasTellyVista2:String;
         var _g5:Telly;
         var _g4:Telly;
         var hasTellyVista1:String;
         var _g3:Telly;
         var _g2:Telly;
         var hasTellyVista:String;
         var _g1:Telly;
         var floaTelly:Boolean;
         var tellyStasis:Boolean;
         var _g:Telly;
         incidenTelly = true;
         menu();
         if(get_tellyCommute())
         {
            outputText("在旅行途中，你偶然发现了特莉的马车，它正沿着人们曾经称之为道路的崎岖小径艰难前行。她从前面的座位上看到了你，放慢了拉车的马的速度。");
            outputText("[pg][say: 嗨，[mister]！你今天有兴趣买点什么吗？]她带着愉快的笑容说道。");
            _g = this;
            tellyStasis = false;
            floaTelly = true;
            addButton(0,"商店",function():void
            {
               _g.tellyMarket(tellyStasis,floaTelly);
            }).hint("进去看看她的商品。");
            _g1 = this;
            hasTellyVista = "[pg]虽然这个提议很诱人，但你还有事情要做，而且并不急需她的商品。你向她挥手告别，她也同样挥手回应，高兴地祝你一切顺利，然后继续她的旅程。";
            addButton(1,"离开",function():void
            {
               _g1.tellyHo(hasTellyVista);
            }).hint("你很忙，只是路过。");
         }
         else if(get_tellyGenesis())
         {
            outputText("一辆熟悉的粉色马车在原本平淡无奇的地形中显得格外显眼。角落里点缀的黄色星星在这种风景中给人一种明显格格不入的幼稚感，你琢磨着别人在看到这种情况时，读到“特莉的玩具与零食”会怎么想。大概，店主就在里面。");
            _g2 = this;
            addButton(0,"进入",function():void
            {
               _g2.tellyMarket();
            }).hint("看看是什么把她带到这里来的，也许还能买点东西。");
            _g3 = this;
            hasTellyVista1 = "[pg]不管是什么原因让她来到这里，你都不打算打扰她。如果你改变主意想去她的店里看看，你知道以后大概能在哪里找到她。";
            addButton(1,"离开",function():void
            {
               _g3.tellyHo(hasTellyVista1);
            }).hint("让她忙自己的事吧。");
         }
         else
         {
            if(get_noncommiTelly())
            {
               outputText("沿着路走，你看到了特莉的玩具与零食，就是你之前见过的那辆淡粉色马车。虽然地点变了，拉车的坐骑看起来也有些无精打采，但情况和上次大体相同。是时候去买点这个世界所谓的\"玩具和零食\"了吗？");
            }
            else
            {
               set_noncommiTelly(true);
               outputText("沿着你勉强能辨认出的道路轮廓，你发现了一辆淡粉色的马车，大到足以装下相当多的东西。假设没有直接的危险，你继续靠近它，同时进一步打量着它。马车前面拴着一匹马，平静而耐心地等待着下一次小跑。马车侧面装饰着黄色的星星，你看到上面有一块牌子，写着\"特莉的玩具与零食！\"");
            }
            _g4 = this;
            addButton(0,"进入",function():void
            {
               _g4.tellyMarket();
            }).hint("你也许能在这里买些东西。");
            _g5 = this;
            hasTellyVista2 = "[pg]你继续旅行，因为你对这辆柔和色彩的马车或它的玩具和零食不感兴趣。";
            addButton(1,"离开",function():void
            {
               _g5.tellyHo(hasTellyVista2);
            }).hint("没有这些东西你也能过得很好。");
         }
      }
      
      public function get_vesTelly() : int
      {
         return tellyMetry.vesTelly;
      }
      
      public function get_tellyTimer() : Number
      {
         return tellyMetry.tellyTimer;
      }
      
      public function get_tellyScope() : String
      {
         return Utils.cnName(tellyMetry.tellyTubby) + "" + Utils.cnName(tellyMetry.tellyGraph);
      }
      
      public function get_tellyPlasmed() : Boolean
      {
         return tellyMetry.tellyPlasmed;
      }
      
      public function get_tellyOphile() : *
      {
         return tellyMetry.tellyOphile;
      }
      
      public function get_tellyGram() : int
      {
         return tellyMetry.tellyGram;
      }
      
      public function get_tellyGenesis() : Boolean
      {
         return tellyMetry.tellyGenesis;
      }
      
      public function get_tellyCommute() : Boolean
      {
         return tellyMetry.tellyCommute;
      }
      
      public function get_tellyCommand() : int
      {
         return tellyMetry.tellyCommand;
      }
      
      public function get_tellyCardiogram() : int
      {
         return tellyMetry.tellyCardiogram;
      }
      
      public function get_tasTelly() : int
      {
         return tellyMetry.tasTelly;
      }
      
      public function get_noncommiTelly() : Boolean
      {
         return tellyMetry.noncommiTelly;
      }
      
      public function get_experimenTelly() : int
      {
         return tellyMetry.experimenTelly;
      }
      
      public function get_debugName() : String
      {
         return "Telly";
      }
      
      public function get_debugHint() : String
      {
         return "";
      }
      
      public function enTellychy() : void
      {
         var _g:Telly;
         var _loc2_:* = null as Array;
         tellyMetry.immorTelly = int(get_date().getFullYear());
         clearOutput();
         outputText("现在你知道为什么你期待更多了：她去年情人节也这么做了！特莉忘记你了吗？对于你的提醒，她咯咯地笑了起来。[say: 我知道我去年给了你一张画，[mister]，但我从来没有要求做[b:你的]情人。]恶魔停顿了一下，微微脸红。[say: 此外，你不会想要一" + (get_player().get_race() == "alice" ? " 个其他的" : "") + " 爱丽丝做情人的。]那句话在空气中悬了一会儿后，她又振作起来，说道，[say: 我只是想丰富你的情人节体验！你今年也想要一些特别的东西吗？]");
         outputText("[pg]听了她的话，你的胸口有一种飘飘然的感觉，但你还没来得及细想，店主就拿出一罐心形的小糖果。[say: 25颗宝石！]");
         outputText("[pg]拿出一颗糖果，你读到[istart]");
         var _loc1_:String = get_player().highestRaceScore();
         if(_loc1_ == "alice")
         {
            outputText("仙境");
         }
         else if(_loc1_ == "bee")
         {
            outputText("做我的蜜蜂");
         }
         else if(_loc1_ == "cat")
         {
            outputText("完美");
         }
         else if(_loc1_ == "dryad")
         {
            outputText("多情树苗");
         }
         else
         {
            while(true)
            {
               if(_loc1_ != "dog")
               {
                  if(_loc1_ != "fox")
                  {
                     if(_loc1_ != "wolf")
                     {
                        if(_loc1_ == "goo")
                        {
                           outputText("为你融化");
                           break;
                        }
                        if(_loc1_ == "harpy")
                        {
                           outputText("爱情鸟");
                           break;
                        }
                        if(_loc1_ == "insect")
                        {
                           outputText("爱情虫");
                           break;
                        }
                        if(_loc1_ == "kitsune")
                        {
                           outputText("揉揉我");
                           break;
                        }
                        if(_loc1_ == "pig")
                        {
                           outputText("独占爱意");
                           break;
                        }
                        if(_loc1_ == "sheep")
                        {
                           outputText("爱你哟");
                           break;
                        }
                        if(get_player().thickness < 75 && get_player().tone < 25)
                        {
                           outputText(get_player().mf("熊抱","漂亮小猪"));
                           break;
                        }
                        if(get_player().hasPerk(PerkLib.BimboBrains) || get_player().hasPerk(PerkLib.FutaFaculties))
                        {
                           outputText("迷糊宝贝");
                           break;
                        }
                        if(get_player().hasPerk(PerkLib.BroBrains))
                        {
                           outputText("兄弟情深");
                           break;
                        }
                        _loc2_ = ["抱抱我","亲亲抱抱","你最棒","小可爱","甜蜜的爱","甜心","情人节快乐"];
                        outputText(_loc2_[Utils.rand(int(_loc2_.length))]);
                        break;
                     }
                  }
               }
               outputText("小狗之恋");
               break;
            }
         }
         outputText("[iend]");
         outputText("刻在上面。当你回头看罐子时，特莉已经把它放在一边，等着你为你拿走的那颗付钱。虽然它又小又简单，但你还是被它的魅力所吸引。你把宝石递给特莉，在你转身离开时，收到了她一句欢快的[say: 情人节快乐！]。");
         var _loc3_:Player = get_player();
         _loc3_.set_gems(_loc3_.get_gems() - 25);
         get_player().dynStats(DynStat.Cor(3));
         get_player().changeFatigue(-20);
         _g = this;
         doNext(function():void
         {
            _g.tellyHo();
         });
      }
      
      public function dirTellyLick() : void
      {
         var _g:Bazaar;
         clearOutput();
         outputText("[Walking]凑近后，你打量了一下纸杯蛋糕，随即转过注意力，嘴唇覆上她的鼻子，亲了一口，把上面的糖霜舔掉。特莉满脸通红，慌乱地喊了一声[say:嘿！]，然后调皮地冲你吐出舌头，气鼓鼓的样子。她没有责怪你，而是擦掉自己一边脸颊上的糖霜，把手指伸到你面前。[say:你漏了一些。]");
         outputText("[pg]你吸吮着她指尖的甜奶油，那种感觉让她咯咯笑了起来，特莉继续埋头吃着纸杯蛋糕。她确实在吃，只是短时间内根本吃不完——尽管你很想多陪她一会儿，但最终还是不得不离开。");
         _g = get_bazaar();
         doNext(function():void
         {
            _g.enterTheBazaarAndMenu();
         });
      }
      
      public function dirTellyDecline() : void
      {
         var _g:Bazaar;
         clearOutput();
         outputText("只有供一个人吃的才能叫[i:杯]蛋糕，所以这次就不分享了。这是送给特莉的礼物，得由她自己吃完——就算要吃上一整[day]，那也得由她自己来做。");
         outputText("[pg][say:我接受挑战！] 她宣布完，又咬了一小口。很小的一口。你在脑子里计算了一下——以她那么小的嘴巴和这么大的蛋糕，吃完需要……太久太久了，你根本不可能一直坐在这儿等她。你已经看到了她的笑容，那才是你真正的收获，没必要看她吃完。");
         _g = get_bazaar();
         doNext(function():void
         {
            _g.enterTheBazaarAndMenu();
         });
      }
      
      public function dirTellyBite() : void
      {
         var _g:Bazaar;
         clearOutput();
         outputText("你把双手撑在柜台上借力，稳住身体向前探去，咬了一大口巧克力纸杯蛋糕，脸颊和鼻尖也沾满了糖霜。特莉伸出手指，把你脸上那些黏糊糊的东西抹掉了一些。");
         outputText("[pg][say:你脸上沾到东西了，] 她说道。你也伸手把她脸上的糖霜抹掉了一些，惹得小恶魔咯咯笑了起来。即便两个人一起吃，也没法把这个纸杯蛋糕全部解决[if (silly){——，你那宇宙般的时间感提醒你每个整点都得赶回营地之前|——，除非你乐意花费一整天时间}]，于是你留下小恶魔一个人慢慢吃完。");
         _g = get_bazaar();
         doNext(function():void
         {
            _g.enterTheBazaarAndMenu();
         });
      }
      
      public function dirTelly() : void
      {
         clearOutput();
         outputText("当特莉开心地坐等着你挑选要买的东西时，你却将一个[i:巨大]的纸杯蛋糕放到桌上，让她惊得[say:哇！]了一声——海绵蛋糕在自身重量下微微下沉，又缓缓弹起。特莉目瞪口呆地看着，惊叹不已。[say:那是生日蛋糕吗？]她问道。你告诉她这是纸杯蛋糕——是你专门带给她的！[say:这叫[cup:纸杯]蛋糕！？也太大了！]");
         outputText("[pg]这简直就是DD纸杯蛋糕。");
         outputText("[pg]特莉凑近打量着这个过于庞大的糕点，顶上那根孤零零的蜡烛自己燃了起来，照亮了她的脸庞。一圈软糖在糖晶折射的光芒下闪闪发亮。这位小店主用手比划了一下大小，然后放下手臂，跟自己的肚子对比起来。[say:[Mister], 这也太大了吧，根本塞不进去！纸杯蛋糕应该是单人份的才对！]");
         outputText("[pg]你指出，事实上这个纸杯蛋糕就是一个人的分量。");
         outputText("[pg]尽管心里还有些犹豫，这个小恶魔还是先抓起一颗软糖，用它抹掉了一点糖霜，然后整颗丢进嘴里，笑了起来。[say:一口气吃这么多甜的东西……！而且我得用勺子，不能直接咬——] 她突然打住。[say:反正你也不会拦我，那我[b:就]直接咬下去！] 特莉一头扑向纸杯蛋糕，大口啃了起来，她嘴里塞得满满当当，脸颊和鼻尖都沾上了香草糖霜。你本来觉得她没有看上去那么年幼，可这会儿你又开始怀疑她或许也没多大年纪……");
         outputText("[pg][say:你不来一点吗，[mister]？就算照这个吃法，我一个人也绝对吃不完的！]");
         get_player().destroyItems(get_consumables().CCUPCAK,1);
         tellyCom(TellyCom.TellyComCC,true);
         set_tellyCommand(int(Math.floor(get_time().days)));
         menu();
         addNextButton("咬一口",dirTellyBite).hint("当你在罗马的时候……我是说客随主便");
         addNextButton("舔她",dirTellyLick).hint("你想来点，但只吃糖霜。");
         addNextButton("拒绝",dirTellyDecline).hint("你更想下次再吃她的蛋糕。");
      }
      
      public function delicaTelly() : void
      {
         var _g:Telly;
         clearOutput();
         outputText("你把龙心花送给特莉，明确表示你想送她一些好东西。");
         outputText("[pg]特莉倒吸了一口气，当她把花拿在手里时，淡褐色的眼睛睁得大大的。[say: 好漂亮啊，[mister]！]店主停顿了一下，把鼻子埋在花里闻了闻。[say: 闻起来好甜好香，就像香草和玫瑰！]");
         outputText("[pg]她眼中闪烁的光芒和脸上张开嘴的笑容充分说明了她的感激之情，让你对这份精心挑选的礼物感到满意。");
         outputText("[pg][say: 这花真奇特，非常感谢，]她说着，走上前拥抱了你。");
         get_player().consumeItem(get_consumables().DRAKHRT);
         tellyCom(TellyCom.TellyComD,true);
         set_experimenTelly(int(Math.floor(get_time().days)));
         get_player().dynStats(DynStat.Cor(0.5));
         get_player().changeFatigue(-20);
         _g = this;
         doNext(function():void
         {
            _g.tellyMarket();
         });
      }
      
      public function debugMenu(param1:Boolean = true) : void
      {
         get_game().debugMenu.debugCompEdit(tellyMetry,new SaveContent(null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null));
      }
      
      public function compassionaTellyHug() : void
      {
         var _g:Telly;
         clearOutput();
         outputText("顺应她的要求，你紧紧地将泰迪熊抱在[chest]前，并向她展示你的笑容，让她知道你倾注了满满的爱意。对你的努力感到满意，你把它递给特莉，她立刻也紧紧地抱住了它。");
         outputText("[pg][say: 谢谢你，[mister]。]");
         get_player().consumeItem(get_useables().TELBEAR);
         _g = this;
         doNext(function():void
         {
            _g.tellyMarket();
         });
      }
      
      public function compassionaTellyForce() : void
      {
         var _g:Telly;
         clearOutput();
         outputText("该死的婊子，赶紧把这破玩意儿收下吧。");
         outputText("[pg]特莉对你这种充满攻击性的送礼方式咯咯笑个不停。[say: 谢谢你，[mister]。我保证熊先生会代替你得到很多爱的。]");
         get_player().consumeItem(get_useables().TELBEAR);
         _g = this;
         doNext(function():void
         {
            _g.tellyMarket();
         });
      }
      
      public function compassionaTelly() : void
      {
         clearOutput();
         tellyCom(TellyCom.TellyComB,true);
         if(get_silly())
         {
            imageSelect(ImageDb.get_i_telly(),483,339);
         }
         outputText("这些熊是很不错的礼物，不是吗？你觉得特莉绝对值得拥有一个。你把礼物送给她，她歪着头，一脸茫然地看着你。");
         outputText("[pg][say: 你的熊有什么问题吗，[mister]？特莉很乐意提供维修服务！]");
         outputText("[pg]没什么问题，你打算把它作为礼物送给她。特莉将双臂收紧，微笑着说。[say: 可是你付了钱的！我建议把它送给特别的人！]");
         outputText("[pg]谁说你现在不是在这么做呢？");
         outputText("[pg]特莉红着脸，避开了你的视线。带着灿烂的笑容，她又抬起头来。[say: 别忘了给熊先生一个告别的拥抱！]");
         menu();
         addButton(0,"拥抱",compassionaTellyHug);
         addButton(1,"强迫收下",compassionaTellyForce);
      }
      
      public function affectionaTelly(param1:Boolean = true) : Boolean
      {
         var _g:Telly;
         var _loc2_:Boolean = false;
         if(param1)
         {
            menu();
         }
         if(get_player().hasItem(get_useables().TELBEAR) && !tellyCom(TellyCom.TellyComB))
         {
            if(param1)
            {
               addNextButton("送熊",compassionaTelly).hint("送给可爱的特莉一个可爱的玩具。");
            }
            else
            {
               _loc2_ = true;
            }
         }
         if(get_player().hasItem(get_consumables().KITGIFT) && !tellyCom(TellyCom.TellyComK) && get_game().forest.kitsuneScene.saveContent.hadVision)
         {
            if(param1)
            {
               addNextButton("送工具包",tellyDoscope).hint("谁不喜欢拆礼物呢？");
            }
            else
            {
               _loc2_ = true;
            }
         }
         if(get_player().hasItem(get_consumables().PURPEAC) && !tellyCom(TellyCom.TellyComP))
         {
            if(param1)
            {
               addNextButton("桃子",sweeTelly).hint("特莉喜欢甜食。");
            }
            else
            {
               _loc2_ = true;
            }
         }
         if(get_player().hasItem(get_useables().A_SHARD) && !tellyCom(TellyCom.TellyComA) && get_silly())
         {
            if(param1)
            {
               addNextButton("深渊碎片",tellyStial).hint("你在那座该死的庄园里发现了一件非常奇特的文物，但这块水晶的美丽促使你把它送给这个小女孩。","深渊碎片");
            }
            else
            {
               _loc2_ = true;
            }
         }
         if(get_player().hasItem(get_consumables().DRAKHRT) && !tellyCom(TellyCom.TellyComD))
         {
            if(param1)
            {
               addNextButton("花",delicaTelly).hint("龙心花是一件充满异国情调的美丽礼物。");
            }
            else
            {
               _loc2_ = true;
            }
         }
         if(get_player().hasItem(get_consumables().CCUPCAK) && !tellyCom(TellyCom.TellyComCC))
         {
            if(param1)
            {
               addNextButton("纸杯蛋糕",dirTelly).hint("谁不想把脸埋进一个大蛋糕里呢？");
            }
            else
            {
               _loc2_ = true;
            }
         }
         _g = this;
         addButton(14,"返回",function():void
         {
            _g.tellySurvey();
         });
         return _loc2_;
      }
   }
}

