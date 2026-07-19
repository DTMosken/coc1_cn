package classes.scenes.dungeons
{
   import classes.BaseContent;
   import classes.CoC;
   import classes.Monster;
   import classes.PerkLib;
   import classes.Player;
   import classes._FlagDict.FlagDict_Impl_;
   import classes.globalFlags.KFLAGS;
   import classes.items.ArmorLib;
   import classes.items.ConsumableLib;
   import classes.items.ShieldLib;
   import classes.items.Weapon;
   import classes.items.WeaponLib;
   import classes.scenes.Camp;
   import classes.scenes.Inventory;
   import classes.scenes.combat.Combat;
   import classes.scenes.dungeons.deepCave.ImpHorde;
   import classes.scenes.monsters.RandomSuccubus;
   import coc.view.CoCButton;
   import flash.Boot;
   
   public class LiddelliumEventDungeon extends BaseContent
   {
      
      public var whipsLeft:int;
      
      public var takenPhial:Boolean;
      
      public var takenLPop:Boolean;
      
      public var takenBStrap:Boolean;
      
      public var takenAxe:Boolean;
      
      public var swordsTaken:int;
      
      public var spearsTaken:int;
      
      public var shieldsTaken:int;
      
      public var sMilkLeft:int;
      
      public var impFoodTaken:int;
      
      public var iDraftLeft:int;
      
      public var beatenCamp:Boolean;
      
      public function LiddelliumEventDungeon()
      {
         if(Boot.skip_constructor)
         {
            return;
         }
         takenLPop = false;
         sMilkLeft = 5;
         iDraftLeft = 5;
         takenBStrap = false;
         whipsLeft = 3;
         takenPhial = false;
         shieldsTaken = 0;
         swordsTaken = 0;
         spearsTaken = 0;
         takenAxe = false;
         impFoodTaken = 0;
         beatenCamp = false;
         super();
      }
      
      public function workshop() : void
      {
         var from:String;
         var _g:LiddelliumEventDungeon;
         clearOutput();
         outputText("这个工作坊没有前墙，完全向营地敞开。里面有一张非常宽大结实的工作台，上面放着一些常见的维护工具和适合修理或更换他们装备损坏部件的小材料。虽然他们沉迷于性，但这是一个简洁明智的预防措施。既然你已经拥有了大部分你认为值得注意的工具，这就很难让人感到兴奋了。粗略地看了一眼散落的物品，只有几件潜在的战利品。");
         menu();
         _g = this;
         from = "Workshop";
         addButton(0,"离开",function():void
         {
            _g.campMenu(from);
         });
      }
      
      public function takeWhip() : void
      {
         --whipsLeft;
         get_inventory().takeItem(get_weapons().WHIP,quarters);
      }
      
      public function takeSword() : void
      {
         if(swordsTaken == 0)
         {
            outputText("[pg]四把武士刀，整齐地展示着！这四把刀都无比锋利，带有优美的弧度，能干净利落地劈开血肉。你拿了一把放进你的[inv]。[pg]");
         }
         else
         {
            outputText("[pg]你又拿了一把武士刀。[pg]");
         }
         swordsTaken += 1;
         get_inventory().takeItem(get_weapons().KATANA,haremHouseWeaponRack);
      }
      
      public function takeSpear() : void
      {
         outputText("[pg]这把长矛制作精良，拥有锋利的边缘和枪尖。你将它放入了你的[inv][pg]");
         spearsTaken += 1;
         get_inventory().takeItem(get_weapons().SPEAR,haremHouseWeaponRack);
      }
      
      public function takeShield() : void
      {
         outputText("[pg]你从展示架上拿了一面鸢盾。[pg]");
         shieldsTaken += 1;
         get_inventory().takeItem(get_shields().KITE_SH,haremHouseWeaponRack);
      }
      
      public function takeSMilk() : void
      {
         --sMilkLeft;
         get_inventory().takeItem(get_consumables().SUCMILK,lab);
      }
      
      public function takeLPop() : void
      {
         clearOutput();
         outputText("奇怪的是，你在其中一个罐子里发现了一根闪闪发光的棒棒糖。它闻起来香甜芬芳，就像糖果应该有的味道。你把这个相当不合时宜的零食塞进了口袋。[pg]");
         takenLPop = true;
         get_inventory().takeItem(get_consumables().LOLIPOP,lab);
      }
      
      public function takeImpFood() : void
      {
         clearOutput();
         var _loc1_:int;
         impFoodTaken = (_loc1_ = impFoodTaken) + 1;
         switch(_loc1_)
         {
            case 0:
               outputText("周围有很多口粮，多得超出了你的实际需求。他们没有食堂之类的东西吗？这似乎是个健康和安全隐患。不过话又说回来，也许连虫子和细菌都讨厌小恶魔的食物。你一边思考着这个问题，一边把一些口粮塞进你的[inv]里。");
               break;
            case 1:
               outputText("你是真的那么饿，还是想让小恶魔们挨饿？不管怎样，你又往包里塞了一份口粮。");
               break;
            case 2:
               outputText("也许你有偷窃癖。盗窃癖？另一方面，食物就是食物，你迟早要吃的。");
               break;
            case 3:
               outputText("那些小恶魔会挨饿的，而且他们很可能会因此受到惩罚，前提是你没有杀掉他们的主人。");
               break;
            default:
               if(impFoodTaken > 3 && impFoodTaken < 30)
               {
                  outputText("你收集了这么多垃圾。如果你不是在对小恶魔施虐，那你可能需要寻求精神科医生的帮助了。");
               }
               else
               {
                  outputText("就这样，你剥夺了整个兵营的食物，还把这里弄得一团糟。那些可怜的小恶魔！为了这么点微不足道的收获做到这种地步，你可能真的是个彻头彻尾的疯子。");
               }
         }
         doNext(impRoom);
      }
      
      public function takeIDraft() : void
      {
         --iDraftLeft;
         get_inventory().takeItem(get_consumables().INCUBID,lab);
      }
      
      public function takeBStrap() : void
      {
         takenBStrap = true;
         outputText("[pg]你拿起了束缚带，注意到上面隐约散发着恶魔的气味。如果你介意的话，也许在使用前应该洗一洗。[pg]");
         get_inventory().takeItem(get_armors().BONSTRP,quarters);
      }
      
      public function takeAxe() : void
      {
         outputText("[pg]那些恶魔里有谁能挥舞这么巨大的斧头吗？你对此表示怀疑。而你，另一方面，至少拥有十几个恶魔的力量！[pg]");
         if(get_player().get_tallness() > 78 || get_player().get_str() >= 90)
         {
            outputText("[pg]你将大斧放入了你的[inv]");
            takenAxe = true;
            get_inventory().takeItem(get_weapons().L__AXE,haremHouseWeaponRack);
         }
         else
         {
            outputText("[pg]你举起这把巨大的武器，跌跌撞撞地摔倒了，险些把整个展示架给劈塌。你环顾四周，希望没人看到你，然后轻轻放下斧头，继续浏览。[pg]");
            doNext(haremHouseWeaponRack);
         }
      }
      
      public function sneakImps() : void
      {
         var _g:LiddelliumEventDungeon;
         outputText("这些小混蛋不值得你费心去战斗。你迅速绕过他们，时刻注意着他们的巡逻路线，毫无问题地穿了过去。");
         _g = this;
         doNext(function():void
         {
            _g.demonCampScene();
         });
      }
      
      public function quitWhileAhead() : void
      {
         outputText("[pg]你的闯入毁了一些小恶魔的一天，这就足够了。发生冲突的风险太大，你今天不想惹事。你原路返回了。");
         doNext(get_camp().returnToCampUseOneHour);
      }
      
      public function quarters() : void
      {
         var from:String;
         var _g:LiddelliumEventDungeon;
         clearOutput();
         outputText("和许多建筑一样，这栋建筑紧贴着营地的墙壁，屋顶向下倾斜，以便从外面看尽可能不引人注意。结果就是，对于你见过的像魅魔和梦魔那么高的恶魔来说，这里显得有些拥挤，不过还算合适，里面配有一张他们一起睡的大床。不用说，房间里散发着浓烈的性爱气味。");
         outputText("[pg]除了一些皮鞭和绑带（如果你对这种东西感兴趣的话），这里几乎没有什么你想拿走的东西。[pg]");
         menu();
         if(whipsLeft > 0)
         {
            addButton(0,"皮鞭",takeWhip);
         }
         if(!takenBStrap)
         {
            addButton(1,"绑带",takeBStrap);
         }
         _g = this;
         from = "Quarters";
         addButton(2,"离开",function():void
         {
            _g.campMenu(from);
         });
      }
      
      public function nextBuilding() : void
      {
         outputText("[pg]你小心翼翼地从门口探出头，寻找最有可能藏着真正值钱战利品的地方。根据其他建筑的用途来推测，这里似乎有一间炼金\"实验室\"、几座囚笼、几间生活区、几间茅厕，除此之外就只剩首领居住的那栋大房子了。这些选项里虽然也有几个还算有点意思，但你很清楚最好的战利品肯定在首领那里。[pg]");
         menu();
         addButton(0,"恶魔领主的房子",demonLordHouse).hint("为了荣耀和战利品！");
         addButton(1,"离开",quitWhileAhead).hint("见好就收！");
      }
      
      public function moveAlong() : void
      {
         outputText("[pg]在未来的岁月里，他们会讲述关于你的传说；一个幽灵把他们洗劫一空的那一天！或者说，一个幽灵洗劫了<b>瞎子</b>的那一天！他们真该雇点不是一天到晚都在做爱的守卫。你得意洋洋地带着战利品，悄悄地逃离了这个淫乱的巢穴！");
         FlagDict_Impl_.arrayWriteInt(KFLAGS.flags,2731,1);
         doNext(get_camp().returnToCampUseTwoHours);
      }
      
      public function massacre() : void
      {
         outputText("[pg]你投入战斗，枪口在比喻意义上" + (get_player().get_weapon().isFirearm() ? "——也许在字面意义上也是——" : "") + "喷吐着火焰。");
         demonCampBattle();
      }
      
      public function lab() : void
      {
         var from:String;
         var _g:LiddelliumEventDungeon;
         clearOutput();
         outputText("这间颇为凌乱的炼金实验室里摆放着各种奇特的原料和混合物。你无法确定其中大部分东西的用途，但以你的经验足以认出魅魔乳汁和男魅魔的\"乳汁\"。其中一些看起来还很新鲜，尚未被用于他们正在进行的实验。你还注意到，在一个复杂的奥术法阵旁边摆放着不少附魔物品。魔法与炼金术是危险的组合；一想到他们可能构想的那些主意，你就不寒而栗。[pg]");
         menu();
         if(iDraftLeft > 0)
         {
            addButton(0,"梦魔药水",takeIDraft);
         }
         if(sMilkLeft > 0)
         {
            addButton(1,"魅魔乳液",takeSMilk);
         }
         if(!takenLPop)
         {
            addButton(2,"棒棒糖",takeLPop);
         }
         _g = this;
         from = "Lab";
         addButton(3,"离开",function():void
         {
            _g.campMenu(from);
         });
      }
      
      public function impRoom() : void
      {
         var from:String;
         var _g:LiddelliumEventDungeon;
         var _loc1_:* = null as Function;
         clearOutput();
         outputText("这个房间似乎是他们小恶魔部落的“兵营”。房间两侧排列着无数小床和极少的私人物品，中间只有一条直通门口的通道。这里的气味并不像你想象的那么糟糕，毕竟这里挤了十几个发情的小矮子。也许他们会因为弄脏环境而受到惩罚。");
         menu();
         addButton(0,"小恶魔食物",takeImpFood).hint("小恶魔们在这里储存了口粮。").disableIf(impFoodTaken >= 30,"小恶魔们曾在这里储存了口粮。你这个怪物。");
         if(beatenCamp)
         {
            _g = this;
            from = "ImpRoom";
            _loc1_ = function():void
            {
               _g.campMenu(from);
            };
         }
         else
         {
            _loc1_ = nextBuilding;
         }
         addButton(1,"下一栋建筑",_loc1_);
      }
      
      public function haremLeave() : void
      {
         outputText("[pg]这个淫乱的巢穴里没有什么值得费心的有价值的东西，因此你选择离开。");
         FlagDict_Impl_.arrayWriteInt(KFLAGS.flags,2731,1);
         doNext(get_camp().returnToCampUseTwoHours);
      }
      
      public function haremHouseWeaponRack() : void
      {
         clearOutput();
         outputText("在你面前摆放着建造这个营地的恶魔们收集的武器和盾牌。[pg]");
         if(takenAxe && spearsTaken == 2 && swordsTaken == 4 && shieldsTaken == 4)
         {
            outputText("你已经把架子上的所有物品都洗劫一空了！这真是一次丰厚的收获。也许你也应该为你的所有武士刀弄个展示架。[pg]");
         }
         menu();
         addButton(0,"大斧",takeAxe).disableIf(takenAxe,"你已经拿过了！");
         addButton(1,"长矛",takeSpear).disableIf(spearsTaken >= 2,"你已经拿过长矛了！");
         addButton(2,"剑",takeSword).disableIf(swordsTaken >= 4,"你已经拿走了所有四把武士刀。");
         addButton(3,"盾牌",takeShield).disableIf(shieldsTaken >= 4,"展示架上没有更多的盾牌了。");
         addButton(4,"继续前进",moveAlong);
      }
      
      public function haremHouseSteal() : void
      {
         var _g1:LiddelliumEventDungeon;
         var _g:LiddelliumEventDungeon;
         var _loc2_:* = null as Function;
         var _loc1_:String = "[pg]他们在消磨时间，但你没有时间消磨，所以你开始侧身穿过，没有引起任何注意。";
         if(get_player().get_tallness() > 86 || get_player().thickness > 70)
         {
            _loc1_ += "然而，也许是因为你庞大的身躯，这个计划失败了。[pg]其中一个较小的奴隶开口了。[say:嗯……你是谁？]提醒了王座上的恶魔。他们争先恐后地准备战斗！";
            outputText(_loc1_);
            _g = this;
            doNext(function():void
            {
               _g.haremHouseBattle();
            });
         }
         else
         {
            _loc1_ += "通常你不敢尝试潜行穿过拥挤的房间，但另一种选择是如果你被抓住会发生什么。考虑到这一点，你没有什么可失去的，事实上，你惊讶地发现自己毫发无损地漫步过去。看到你能拿到的第一件物品是瓶子，你高兴地伸手去拿。";
            if(get_player().get_tallness() < 60)
            {
               _loc1_ += "不幸的是，你的手不够长。看来你有点太小了。你紧张地环顾四周，以确保没有人费心去观察周围的环境。你已经走到这一步了，你会坚持到底！你轻声哼了一声，爬上了一些目前未使用的家具以增加高度。终于，有价值的战利品！";
            }
            _loc1_ += "[pg]试图搬动大型金属物品可能会引起注意。考虑到这一点，你觉得到现在还没被发现，要么是某种值得进一步利用的狗屎运，要么就是神明保佑。你赶紧跑向存放在后面的装备处。[pg]";
            if(get_player().get_tallness() > 59)
            {
               _loc1_ += "一声尖叫刺痛了你的耳朵！其中一个奴隶注意到了你笨重的身躯在到处乱窜，还以为你是个怪物。巧的是，你还真是！王座上的恶魔们迅速摆出战斗姿态，促使你也做好了准备。[pg]";
               outputText(_loc1_);
               _g1 = this;
               _loc2_ = function():void
               {
                  _g1.haremHouseBattle();
               };
               get_inventory().takeItem(get_consumables().LIDDELL,_loc2_);
            }
            else
            {
               _loc1_ += "可能至少部分归功于你娇小的体型，你毫无阻碍地到达了武器库。[pg]";
               outputText(_loc1_);
               get_inventory().takeItem(get_consumables().LIDDELL,haremHouseWeaponRack);
            }
         }
      }
      
      public function haremHouseBattle(param1:Boolean = false) : void
      {
         var nextFunc1:Object;
         var _g1:Combat;
         var nextFunc:Object;
         var _g:Combat;
         if(param1)
         {
            clearOutput();
            outputText("是时候解散这个氏族，把他们连根拔起了。奴隶们注意到你准备攻击，尖叫着提醒首领们立刻做好准备。");
         }
         var _loc2_:RandomSuccubus = new RandomSuccubus("M","LiddelliumHL");
         var _loc3_:RandomSuccubus = new RandomSuccubus("F","LiddelliumHL");
         _g = get_combat();
         nextFunc = haremBattleWin;
         var _loc4_:Function = function():void
         {
            _g.cleanupAfterCombat(nextFunc);
         };
         _g1 = get_combat();
         nextFunc1 = haremBattleWin;
         startCombatMultiple(_loc2_,_loc3_,null,null,_loc4_,haremBattleLose,function():void
         {
            _g1.cleanupAfterCombat(nextFunc1);
         },haremBattleLose,"你正在与后宫首领战斗。[pg]这个男魅魔和魅魔都是深紫色的，有着黑色的头发和淡褐色的眼睛。 ",false,param1);
      }
      
      public function haremHouse() : void
      {
         var delay:Boolean;
         var _g:LiddelliumEventDungeon;
         clearOutput();
         outputText("这个营地的后宫里到处都是各种精美的织物。几张小床和奢侈品点缀着这座显而易见的享乐宫殿的主房间。右后角有一批武器，其中一些似乎完全是装饰性的，还有几个相同的盾牌。除此之外，墙上断断续续地挂着淫秽的肖像和一些看似无害的精美肖像。你发现左墙上的一个架子上放着一个好看的玻璃小瓶。");
         outputText("[pg]哦，还有人在这里做爱。这个房间里有很多人在做爱。这是一个如此标准的景象，以至于你几乎忽略了它。大概奴隶们是在房间里随机的床上嬉戏的人，而在中央王座上做爱的大男魅魔和魅魔是负责人。你真幸运，这个房间里的每个人都在做爱，而不是看着门。");
         get_player().takeLustDamage(15);
         menu();
         addButton(0,"偷窃",haremHouseSteal).hint("他们似乎很忙，没必要打扰。");
         _g = this;
         delay = true;
         addButton(1,"战斗",function():void
         {
            _g.haremHouseBattle(delay);
         }).hint("他们似乎很忙，让我们打扰一下。");
      }
      
      public function haremBattleWin() : void
      {
         clearOutput();
         outputText("这对恶魔倒在了你的力量之下。恶魔氏族对你这种级别的勇者来说根本不算什么！令人高兴的是，你现在可以随意挑选他们的贵重物品了。");
         menu();
         addButton(0,"武器架",haremHouseWeaponRack);
         if(!takenPhial)
         {
            addButton(1,"药瓶",getPhial);
         }
         addButton(2,"离开",haremLeave).hint("除了回家，没什么可做的了。");
      }
      
      public function haremBattleLose2() : void
      {
         clearOutput();
         outputText("你在一个狭小的木屋里醒来。这里非常黑，只有少量的光线从木板的缝隙中透进来。你被绑着，嘴巴被某种装置固定在墙上，被迫张开。持续的疲惫让任何动作都变得微弱而毫无意义。很快，一阵骚动引起了你的注意。浓烈的精液气味终于让你恍然大悟，你意识到自己正处于之前注意到的那个寻欢洞里。");
         outputText("[pg]你的身体没有任何肌肉，将被困在这里，任由你的新主人摆布，直到你生命的尽头。你只能靠吃恶魔的精液维持生命。");
         get_game().gameOver();
      }
      
      public function haremBattleLose() : void
      {
         clearOutput();
         outputText("这对恶魔太强了，完全压制了你。");
         outputText("[pg]魅魔对你的失败咯咯直笑。[say: 真可爱！有人决定扮演英雄，袭击恶魔的氏族。不过，我确实很钦佩你英勇的努力。] 男魅魔悄悄走到她身后，紧紧抓住她的身体。[pg]男魅魔上下打量着你，向那个女人提出了一个建议。[say: 也许这是使用一些利德尔药水的好机会。大家都很听话，我们已经很久没有机会使用它了。] 他对你坏笑，显然在幻想着之后要对你做什么。[pg]魅魔露出极其兴奋的笑容，表示同意。[say: 好主意，哥哥。我太喜欢你的想法了。]");
         outputText("[pg]深紫色的魅魔从她兄弟的怀抱中挣脱出来，大步走到墙边，从架子上取下一个精致的玻璃药瓶。与此同时，男魅魔走近你，掐住你的脖子把你提了起来。你徒劳地挣扎着。");
         outputText("[pg]女恶魔拔掉瓶塞，带着令人眼花缭乱的期待走过来。男魅魔捏住你的鼻子，测试你能憋气多久，直到你不可避免地大口喘气，让你毫无防备地吞下那邪恶的液体。当你终于屈服时，药水抽走了你所有的力量，你晕了过去。");
         doNext(haremBattleLose2);
      }
      
      public function getPhial() : void
      {
         outputText("[pg]在一个单独的架子上放着一个看起来很昂贵的瓶子。不管它是什么，你觉得它一定值得拿走。" + (get_player().get_tallness() < 60 ? "不幸的是，你的手够不到。看来你有点太矮了。你环顾四周，寻找可以踩着爬上去的东西。你轻哼一声，爬上了一些目前闲置的家具以增加高度。终于，拿到了贵重的战利品！" : "") + "[pg]");
         takenPhial = true;
         get_inventory().takeItem(get_consumables().LIDDELL,haremBattleWin);
      }
      
      public function fightImps() : void
      {
         var _g:LiddelliumEventDungeon;
         outputText("去他们的，你可是勇者！你从掩体中跳出，准备好[weapon]，立即准备攻击。");
         outputText("[pg]小恶魔们惊讶地尖叫起来，");
         if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,1272) > 0)
         {
            outputText("大喊道[say: 是勇者，[name]！快跑！快飞！快逃！这不值得！]");
            outputText("[pg]这群小恶魔四散奔逃。好吧，你觉得你已经给他们留下了相当深刻的印象。");
            _g = this;
            doNext(function():void
            {
               _g.demonCampScene();
            });
         }
         else
         {
            outputText("像你一样准备好战斗。");
            startCombat(new ImpHorde("Liddellium"));
         }
      }
      
      public function encounterImps() : void
      {
         clearOutput();
         outputText("你停下脚步，竖起耳朵。你不是一个人。当你潜入掩体时，你环顾四周，发现一群小恶魔正在巡逻。巡逻。这可不像他们平时那样漫无目的地游荡，这是有目的的。");
         outputText("[pg]他们毕竟只是小恶魔。你可能在与他们战斗时不会遇到什么麻烦，但如果他们聚集在一起并有目的地巡逻，那么你可能会遇到比你预想的更多麻烦。潜行当然是一个选择；小恶魔并不以其令人难以置信的观察能力而闻名。[pg]");
         menu();
         addButton(0,"战斗",fightImps).hint("击溃他们");
         addButton(1,"潜行",sneakImps).hint("避开他们。");
         addButton(2,"离开",get_camp().returnToCampUseOneHour).hint("不管他们是为了什么而来，现在都不值得去理会。");
      }
      
      public function demonLordHouse() : void
      {
         clearOutput();
         var _loc1_:String = "在营地里游荡的各种恶魔似乎仍然很漫不经心。潜行过去并不容易，但这是尝试的最佳机会。[pg]";
         if(get_player().get_tallness() > 86 || get_player().thickness > 70)
         {
            _loc1_ += "你冲了出去，在视线中躲闪，没有避开任何人。许多恶魔惊讶而困惑地看着你庞大的身躯试图在众目睽睽之下潜行。事实证明，";
            _loc1_ += get_player().get_tallness() > 86 ? "巨人" : "胖子";
            _loc1_ += "并不是出色的潜行者。好的一面是，你有你的[weapon]。[pg]";
            outputText(_loc1_);
            doNext(demonCampBattle);
         }
         else
         {
            _loc1_ += "你冲了过去，小心翼翼地在掩体中穿梭，巧妙地避开了视线！几秒钟后，你已经到了门口，完全没有被发现。回头看，你得意地对着那些即将被洗劫一空的粗心大意的笨蛋咧嘴一笑。";
            outputText(_loc1_);
            doNext(haremHouse);
         }
      }
      
      public function demonCampScene(param1:Boolean = false) : void
      {
         var impFight:Boolean;
         var _g:LiddelliumEventDungeon;
         var _loc2_:* = null as Function;
         if(param1)
         {
            _g = this;
            impFight = false;
            _loc2_ = function():void
            {
               _g.demonCampScene(impFight);
            };
            get_combat().cleanupAfterCombat(_loc2_);
         }
         clearOutput();
         outputText("看来这些小恶魔是在\"守卫\"着某个恶魔营地。你心想，它们大概是最廉价、最可消耗的守卫了，离称职还差得远。营地的布局也相当简陋——一切都尽可能用天然的方式围起来或遮挡住，里面则是一些粗制滥造的建筑。");
         outputText("[pg]至于居民，你发现了更多的小恶魔——他们真的很容易成群结队，还有四个魅魔和一个男魅魔。任何低级奴隶或者也许是首领，都可能在离入口最远、最大的建筑里。继续监视并没有发现更多东西，然而那个男魅魔和一个魅魔结对飞出了营地。不管是为了什么，这似乎是采取行动的绝佳时机。");
         menu();
         addButton(0,"屠杀",massacre).hint("♪ 死亡！屠杀与死亡！屠杀-与-死亡！ ♪");
         addButton(1,"盗窃",campThievery).hint("没必要打架，你拥有" + (get_player().get_tallness() > 84 || get_player().thickness > 70 ? "大象" : "盗贼大师") + "般的敏捷，该死，你会用上它的。");
         addButton(2,"离开",campLeave).hint("整个营地……也许别这么做。");
      }
      
      public function demonCampBattle() : void
      {
         var nextFunc1:Object;
         var _g1:Combat;
         var nextFunc:Object;
         var _g:Combat;
         var _loc1_:RandomSuccubus = new RandomSuccubus("F","LiddelliumCampSucc");
         var _loc2_:RandomSuccubus = new RandomSuccubus("F","LiddelliumCampSucc");
         var _loc3_:RandomSuccubus = new RandomSuccubus("F","LiddelliumCampSucc");
         var _loc4_:ImpHorde = new ImpHorde("Liddellium");
         _g = get_combat();
         nextFunc = campVictory;
         var _loc5_:Function = function():void
         {
            _g.cleanupAfterCombat(nextFunc);
         };
         _g1 = get_combat();
         nextFunc1 = campVictory;
         startCombatMultiple(_loc1_,_loc2_,_loc3_,_loc4_,_loc5_,campLoss,function():void
         {
            _g1.cleanupAfterCombat(nextFunc1);
         },campLoss,"你正在与恶魔战斗。\n在你面前的是三只魅魔和她们的一群小恶魔。\n\n",false,true);
      }
      
      public function campVictory() : void
      {
         clearOutput();
         outputText("最后一个邪恶的威胁倒下了，标志着你作为被派到这里的勇者取得了胜利。当荣耀的时刻洗刷着你时，你花时间环顾了一下营地。很明显，首领肯定在营地尽头最大的房子里，但你注意到了其他建筑，并开始在脑海中列出可能值得检查的东西。");
         outputText("[pg]在你左边，一间看起来相当破旧的棚屋敞开着，里面摆满了非常小的床铺。旁边是一个外屋，看起来更像是一个小恶魔尺寸的寻欢洞，上面有许多绑带，不管别人愿不愿意，都可以把人绑在里面。这是一种惩罚吗？");
         outputText("[pg]在你右边营地较大的一侧，有一个简陋的炼金实验室、一个敞开式的工坊、另一个带有寻欢洞的外屋，以及与首领住所分开的、相当舒适的生活区。");
         beatenCamp = true;
         campMenu();
      }
      
      public function campThievery() : void
      {
         clearOutput();
         var _loc1_:String = "他们永远不会知道自己是怎么死的；你就像个幽灵！";
         if(get_player().hasPerk(PerkLib.Incorporeality))
         {
            _loc1_ += "好吧，你承认，不仅仅是“像”个幽灵。[pg]";
         }
         if(get_game().shouldraFollower.followerShouldra())
         {
            _loc1_ += "[say: 而且是一个被幽灵附身的幽灵！] 你的虚体同伴插话道。她这次居然在关注你的生活？[pg]";
            if(get_silly())
            {
               _loc1_ += "[say: 关注？你以为是谁在为大屠杀选项唱提示音？我可不只有性爱魔法这一个天赋！] ";
            }
            else
            {
               _loc1_ += "[say: 哦，勇者，我可不会错过像突袭这么刺激的事情！] ";
            }
         }
         _loc1_ += "把关于幽灵双关语的思绪暂且放到一边，你决定专注于手头的真正任务。正门入口实在太过显眼，而且被严密监视着；然而，营地为了营造出所谓的\"自然\"环境，反而在左侧中部留下了一个可供利用的缺口。你悄然接近，如同一条穿梭于林间的蛇，蜿蜒滑行着穿过了那个缺口。";
         if(get_player().hasTailInsteadOfLegs())
         {
            if(get_player().hasPerk(PerkLib.Incorporeality))
            {
               _loc1_ += " 你低头看了看自己盘绕的蛇身。好吧，比喻够了，你真的很不擅长这个。";
            }
            else
            {
               _loc1_ += " 好吧，你承认，不仅仅是“像”一条蛇。";
            }
         }
         _loc1_ += "[pg]现在已经进入了营地内部，下一步就是找点值得偷的东西！你觉得检查最近的建筑是理所当然的。你沿着墙边侧身走着，发现了一扇窗户……正对着你溜进来的那个缺口。设计缺陷？有些人就是无法抗拒美景，甚至不惜牺牲安全性。对你来说幸运的是，里面没有人。你毫不费力地打开了窗户，跳了进去。";
         outputText(_loc1_);
         doNext(impRoom);
      }
      
      public function campMenu(param1:String = undefined) : void
      {
         if(param1 == null)
         {
            param1 = "";
         }
         if(param1 != "")
         {
            clearOutput();
            if(param1 == "Quarters")
            {
               outputText("你已经看完了所有需要看的东西，回到了营地中心。");
            }
            if(param1 == "ImpRoom")
            {
               outputText("小恶魔那里几乎没有什么有价值的东西。说真的，这不足为奇。");
            }
            if(param1 == "Lab")
            {
               outputText("真遗憾，他们不是那种热衷于囤货的炼金术士，但你也只能将就着用你能找到的东西了。");
            }
            if(param1 == "Workshop")
            {
               outputText("虽然最终毫无意义，但知道他们也会做些明智且无害的事情，还是让人感到一种莫名的欣慰。");
            }
         }
         menu();
         addButton(0,"首领住所",haremHouse);
         addButton(1,"小恶魔营房",impRoom);
         addButton(2,"实验室",lab);
         addButton(3,"工坊",workshop);
         addButton(4,"生活区",quarters);
      }
      
      public function campLoss() : void
      {
         clearOutput();
         outputText("你知道自己卷入了什么，但你低估了自己能应付的程度。其中一个魅魔用尾巴缠住你的脖子，把你拉倒仰面躺下。");
         outputText("[pg][say: 哎呀，你真是个勇敢又愚蠢的小家伙。很少有玩物这么方便地落入我们手中。] 即使从你倒立的视角来看，魅魔也显得非常得意。[pg]她的朋友们爬到你的身上，用手指在你的躯干上挑逗地划过。另一个说道，[say: 亲爱的们，我们要拿这个怎么办呢？把他们绑起来，用我们的尾巴抽打他们，直到他们可怜地哭泣？][pg]第三个回答说，[say: 这个太蠢了，我说它配不上我们。让小恶魔们尽情享用这顿美餐吧，等我们无聊了，再把剩下的东西随便踢来踢去。]");
         outputText("[pg]三个魅魔继续开着玩笑，忘记了其中一个的尾巴还缠在你的脖子上。随着你的视线变得模糊，你刚好瞥见其中一个的胯下长出了一根肉棒，直到你终于晕了过去。注定要过奴隶生活，再加上缺氧导致你智力低下，你学会了爱上扶他恶魔的肉棒。");
         get_game().gameOver();
      }
      
      public function campLeave() : void
      {
         outputText("[pg]不管时机是否合适，这里有很多恶魔，而那些缺席的恶魔只会提供侧翼包抄的机会。你要么准备得更充分再来，要么完全避开这里，你心想。你毫无问题地溜回了营地。");
         doNext(get_camp().returnToCampUseOneHour);
      }
   }
}

