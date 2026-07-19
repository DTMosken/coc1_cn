package classes.scenes.seasonal
{
   import classes.BaseContent;
   import classes.ImageManager;
   import classes.Player;
   import classes._FlagDict.FlagDict_Impl_;
   import classes.globalFlags.KFLAGS;
   import classes.internals.Utils;
   import classes.internals._OneOf.OneOf_Impl_;
   import classes.items.ArmorLib;
   import classes.items.ConsumableLib;
   import classes.items.UseableLib;
   import classes.items.Weapon;
   import classes.items.WeaponLib;
   import classes.scenes.Camp;
   import classes.scenes.api.Encounter;
   import classes.scenes.api.EncounterDef;
   import classes.scenes.api.Encounters;
   import classes.scenes.api._Encounters.EncounterChance_Impl_;
   import coc.view.CoCButton;
   import flash.Boot;
   import haxe.IMap;
   import haxe.ds.Either;
   
   public class AprilFools extends BaseContent
   {
      
      public var poniesEncounter:Encounter;
      
      public function AprilFools()
      {
         var _gthis:AprilFools;
         if(Boot.skip_constructor)
         {
            return;
         }
         _gthis = this;
         super();
         var _loc1_:Either = OneOf_Impl_.fromA(poniesFn);
         var _loc2_:Object = EncounterChance_Impl_.fromBoolFun(function():Boolean
         {
            if(_gthis.get_player().lowerBody.type == 1 && _gthis.get_player().isTaur() && _gthis.isAprilFools())
            {
               return FlagDict_Impl_.arrayReadInt(KFLAGS.flags,118) == 0;
            }
            return false;
         });
         poniesEncounter = Encounters.build(new EncounterDef("小马",EncounterChance_Impl_.fromFloatConst(0.25),_loc2_,_loc1_,null));
      }
      
      public function reallyCheckout() : void
      {
         clearOutput();
         get_images().showImage("monster-troll");
         outputText("愚人节快乐！这款游戏将永远完全免费。:)");
         FlagDict_Impl_.arrayWriteInt(KFLAGS.flags,2210,1);
         doNext(playerMenu);
      }
      
      public function proceedToCheckout(param1:String, param2:Object = undefined) : void
      {
         clearOutput();
         if(param1 != "Gems")
         {
            outputText("你将被带到一个外部网站以完成结账。是否继续？");
         }
         else
         {
            outputText("幸运的是，你可以选择用宝石支付，汇率为1美元兑换1000颗宝石！是否继续？");
         }
         doYesNo(reallyCheckout,param2);
      }
      
      public function poniesFn() : void
      {
         clearOutput();
         outputText("在湖边散步时，你听到女性欢笑和交谈的声音，伴随着独特的马蹄声。你轻快地穿过茂密的植被，偶然发现了一群色彩鲜艳的小马。它们奇怪的地方不在于体型，而在于身体的形状。它们看起来几乎像卡通一样，有几只甚至长着毛茸茸的翅膀。[pg]");
         menu();
         addButton(0,"靠近",approachPonies);
         addButton(14,"离开",leavePonies);
         var _loc1_:IMap = KFLAGS.flags;
         FlagDict_Impl_.arrayWriteInt(_loc1_,118,FlagDict_Impl_.arrayReadInt(_loc1_,118) + 1);
      }
      
      public function pay2WinSelection() : void
      {
         var nextFunc11:Object;
         var dlcPrice11:String;
         var dlcName11:String;
         var _g11:AprilFools;
         var nextFunc10:Object;
         var dlcPrice10:String;
         var dlcName10:String;
         var _g10:AprilFools;
         var nextFunc9:Object;
         var dlcPrice9:String;
         var dlcName9:String;
         var _g9:AprilFools;
         var nextFunc8:Object;
         var dlcPrice8:String;
         var dlcName8:String;
         var _g8:AprilFools;
         var nextFunc7:Object;
         var dlcPrice7:String;
         var dlcName7:String;
         var _g7:AprilFools;
         var nextFunc6:Object;
         var dlcPrice6:String;
         var dlcName6:String;
         var _g6:AprilFools;
         var nextFunc5:Object;
         var dlcPrice5:String;
         var dlcName5:String;
         var _g5:AprilFools;
         var nextFunc4:Object;
         var dlcPrice4:String;
         var dlcName4:String;
         var _g4:AprilFools;
         var nextFunc3:Object;
         var dlcPrice3:String;
         var dlcName3:String;
         var _g3:AprilFools;
         var nextFunc2:Object;
         var dlcPrice2:String;
         var dlcName2:String;
         var _g2:AprilFools;
         var nextFunc1:Object;
         var dlcPrice1:String;
         var dlcName1:String;
         var _g1:AprilFools;
         var nextFunc:Object;
         var dlcPrice:String;
         var dlcName:String;
         var _g:AprilFools;
         clearOutput();
         displayHeader("高级商店");
         outputText("不想费力去赚取这些物品？需要更多宝石？为什么不自己买呢？");
         outputText("[pg]<b><u>宝石</u></b>");
         outputText("\n1000 宝石 - $0.99");
         outputText("\n2500 宝石 - $1.99");
         outputText("\n5000 宝石 - $2.99");
         outputText("\n10,000 宝石 - $4.99");
         outputText("\n25,000 宝石 - $7.99");
         outputText("[pg]<b><u>特殊物品</u></b>");
         outputText("\n莱希石护甲 - $2.99");
         outputText("\n神圣树皮护甲 - $0.99");
         outputText("\n莱希石法杖 - $0.99");
         outputText("\n莉希丝的鞭子 - $0.99");
         outputText("\n5x 莱希石 - $0.99");
         outputText("\n5x 优质蜂蜜酒 - $1.99");
         outputText("\n5x 薄荷白酒 - $2.99");
         menu();
         _g = this;
         dlcName = "1000 Gems";
         dlcPrice = "$0.99";
         nextFunc = pay2WinSelection;
         addButton(0,"1000宝石",function():void
         {
            _g.buyDLCPrompt(dlcName,dlcPrice,nextFunc);
         }).hint("充值宝石，确保你能买得起想要的东西！");
         _g1 = this;
         dlcName1 = "2500 Gems";
         dlcPrice1 = "$1.99";
         nextFunc1 = pay2WinSelection;
         addButton(1,"2500宝石",function():void
         {
            _g1.buyDLCPrompt(dlcName1,dlcPrice1,nextFunc1);
         }).hint("充值宝石，确保你能买得起想要的东西！");
         _g2 = this;
         dlcName2 = "5000 Gems";
         dlcPrice2 = "$2.99";
         nextFunc2 = pay2WinSelection;
         addButton(2,"5000宝石",function():void
         {
            _g2.buyDLCPrompt(dlcName2,dlcPrice2,nextFunc2);
         }).hint("充值宝石，确保你能买得起想要的东西！");
         _g3 = this;
         dlcName3 = "10,000 Gems";
         dlcPrice3 = "$4.99";
         nextFunc3 = pay2WinSelection;
         addButton(3,"10,000宝石",function():void
         {
            _g3.buyDLCPrompt(dlcName3,dlcPrice3,nextFunc3);
         }).hint("充值宝石，确保你能买得起想要的东西！");
         _g4 = this;
         dlcName4 = "25,000 Gems";
         dlcPrice4 = "$7.99";
         nextFunc4 = pay2WinSelection;
         addButton(4,"25,000宝石",function():void
         {
            _g4.buyDLCPrompt(dlcName4,dlcPrice4,nextFunc4);
         }).hint("充值宝石，确保你能买得起想要的东西！");
         _g5 = this;
         dlcName5 = "Chronicler\'s Tears";
         dlcPrice5 = "$2.99";
         nextFunc5 = pay2WinSelection;
         addButton(5,"记录者之泪",function():void
         {
            _g5.buyDLCPrompt(dlcName5,dlcPrice5,nextFunc5);
         });
         var _loc1_:String = get_armors().DBARMOR.get_shortName();
         _g6 = this;
         dlcName6 = get_armors().DBARMOR.get_longName();
         dlcPrice6 = "$0.99";
         nextFunc6 = pay2WinSelection;
         addButton(6,_loc1_,function():void
         {
            _g6.buyDLCPrompt(dlcName6,dlcPrice6,nextFunc6);
         });
         var _loc2_:String = get_weapons().L_STAFF.get_shortName();
         _g7 = this;
         dlcName7 = get_weapons().L_STAFF.get_longName();
         dlcPrice7 = "$0.99";
         nextFunc7 = pay2WinSelection;
         addButton(7,_loc2_,function():void
         {
            _g7.buyDLCPrompt(dlcName7,dlcPrice7,nextFunc7);
         });
         var _loc3_:String = get_weapons().L_WHIP.get_shortName();
         _g8 = this;
         dlcName8 = get_weapons().L_WHIP.get_longName();
         dlcPrice8 = "$0.99";
         nextFunc8 = pay2WinSelection;
         addButton(8,_loc3_,function():void
         {
            _g8.buyDLCPrompt(dlcName8,dlcPrice8,nextFunc8);
         });
         var _loc4_:String = get_useables().LETHITE.get_shortName();
         _g9 = this;
         dlcName9 = "5x " + get_useables().LETHITE.get_longName();
         dlcPrice9 = "$0.99";
         nextFunc9 = pay2WinSelection;
         addButton(9,_loc4_,function():void
         {
            _g9.buyDLCPrompt(dlcName9,dlcPrice9,nextFunc9);
         });
         var _loc5_:String = Utils.cnName(get_consumables().PROMEAD.get_shortName());
         _g10 = this;
         dlcName10 = "5x " + Utils.cnName(get_consumables().PROMEAD.get_longName());
         dlcPrice10 = "$1.99";
         nextFunc10 = pay2WinSelection;
         addButton(10,_loc5_,function():void
         {
            _g10.buyDLCPrompt(dlcName10,dlcPrice10,nextFunc10);
         });
         var _loc6_:String = Utils.cnName(get_consumables().PEPPWHT.get_shortName());
         _g11 = this;
         dlcName11 = "5x " + Utils.cnName(get_consumables().PEPPWHT.get_longName());
         dlcPrice11 = "$2.99";
         nextFunc11 = pay2WinSelection;
         addButton(11,_loc6_,function():void
         {
            _g11.buyDLCPrompt(dlcName11,dlcPrice11,nextFunc11);
         });
         addButton(14,"返回",playerMenu);
      }
      
      public function leavePonies() : void
      {
         clearOutput();
         outputText("你断定这一定是某种恶魔的把戏，决定在它们注意到你之前撤离现场。");
         doNext(get_camp().returnToCampUseOneHour);
      }
      
      public function derpyParty() : void
      {
         clearOutput();
         outputText("你惊讶地看着飞马们挂起横幅，而紫色的那只用她头上角发出的发光力量摆好了一桌零食和饮料。在她们布置的时候，你和橙色的那只讨论了你的家乡，她将其与在苹果农场工作进行了比较；你尽量无视白色的那只在你周围打扮和瞎忙活，显然她不愿意让你穿着——用她自己的话来说——[say: 毫无优雅或格调可言的丑陋装束。][pg]");
         outputText("时间流逝，剩下的一天变得模糊不清，你猜测这主要是因为你喝了大量的小马潘趣酒。当你摇摇晃晃地试图站起来时，昨晚发生的事情的片段在你的脑海中闪过：粉色那只讲的一个有趣的笑话；黄色那只从藏身处出来，指挥由鸣禽合唱团演唱的即兴协奏曲；在赛跑中输给了蓝色那只（飞行绝对是作弊）；一只看起来傻乎乎的灰色小马，把她周围两米半径内的所有东西都撞倒了。你的思绪慢慢回到现在，当你回过神来时，你看了看自己。第一眼看到你的衣服，白色那只所做的神奇“改进”已经开始消退，碎成一团粉红色的灰尘被吹走，让你变回了你的[armor]。看着你的衣服变化相当让人分心，但现在你站起来了，而且，哦，这引起的头痛真要命，你发现你的衣服并不是唯一改变的东西！！[pg]");
         outputText("你强壮的下半身缩小了，结实的肌肉被一种奇怪的卡通形状所取代。事实上，从腰部以下，你看起来就像一只小马！一切似乎都在原来的位置，对你新下半身的快速测试证明它的功能仍然差不多。你花了一点时间才习惯新蹄子的形状，但除此之外，你几乎毫不费力地就习惯了你的新下半身");
         outputText("[pg](<i>*注意：你真的应该检查一下角色面板</i>)");
         get_player().lowerBody.type = 11;
         get_player().lowerBody.legCount = 4;
         doNext(get_camp().returnToCampUseEightHours);
      }
      
      public function derpPolitely() : void
      {
         clearOutput();
         outputText("你伸出手臂，拦住了小马们。一旦引起了她们的注意，你便告诉她们你现在有重要的事情要做，但很快就会回来。你挥了挥手，转身走回树林，身后传来一阵失望的[say: 唉——]声，主要来自粉色的那只。");
         doNext(get_camp().returnToCampUseOneHour);
      }
      
      public function derpCreepy() : void
      {
         clearOutput();
         outputText("鸡巴、角和流着口水的阴道是一回事，但这实在可爱得让人难以接受。你决定离开这片树林，并且永远、<b>永远</b>不再回来。脑海中不断闪过的画面仍然让你感到不安，在回营地的路上，你冷酷地屠杀了一只小恶魔。嗯，感觉好多了。");
         outputText("[pg](+10 经验值！+5 宝石！)");
         var _temp_1:* = get_player();
         _temp_1.XP = _temp_1.XP + 10;
         var _loc1_:Player = get_player();
         _loc1_.set_gems(_loc1_.get_gems() + 5);
         doNext(get_camp().returnToCampUseOneHour);
      }
      
      public function buyDLCPrompt(param1:String, param2:String, param3:Object = undefined) : void
      {
         var nextFunc4:Object;
         var method3:String;
         var _g3:AprilFools;
         var nextFunc3:Object;
         var method2:String;
         var _g2:AprilFools;
         var nextFunc2:Object;
         var method1:String;
         var _g1:AprilFools;
         var nextFunc1:Object;
         var method:String;
         var _g:AprilFools;
         clearOutput();
         outputText("<b>物品：</b> " + param1 + "\n");
         outputText("<b>价格：</b> " + param2 + "\n");
         outputText("请选择购买方式。");
         menu();
         _g = this;
         method = "Credit/Debit Card";
         nextFunc1 = param3;
         addButton(0,"信用卡/借记卡",function():void
         {
            _g.proceedToCheckout(method,nextFunc1);
         });
         _g1 = this;
         method1 = "Paypal";
         nextFunc2 = param3;
         addButton(1,"PayPal",function():void
         {
            _g1.proceedToCheckout(method1,nextFunc2);
         });
         _g2 = this;
         method2 = "Interac";
         nextFunc3 = param3;
         addButton(2,"Interac",function():void
         {
            _g2.proceedToCheckout(method2,nextFunc3);
         });
         _g3 = this;
         method3 = "Gems";
         nextFunc4 = param3;
         addButton(3,"宝石",function():void
         {
            _g3.proceedToCheckout(method3,nextFunc4);
         });
         addButton(14,"取消",param3);
      }
      
      public function approachPonies() : void
      {
         clearOutput();
         outputText("你慢慢地开始靠近，尽管你几乎立刻就被那只粉红色的发现了。[pg]");
         outputText("你刚走出森林没两步，她——绝对是个“她”——就仿佛瞬间移动般出现在你面前，脸上挂着狂喜的表情。粉红色的身影突然贴脸，吓得你几乎本能地拔出了[weapon]。她立刻开始连珠炮似地发问，语速快得让人一个字也听不清。同样令人震惊的是，她说的居然是人类的语言。还没等你回过神来弄清楚这粉红色的家伙在说什么，甚至还没搞懂发生了什么，她队伍里的其他人就已经赶上了她，并开始安抚她的情绪。[pg]");
         outputText("紫色的那只转向你，看起来有些歉意和无奈，[say: 抱歉我们的朋友吓到你了。她<b>真的</b>很容易激动。][pg]");
         outputText("你回答说没关系，但她接近陌生人时应该更小心一点");
         if(!get_player().get_weapon().isUnarmed())
         {
            outputText("，尤其是带着武器的陌生人");
         }
         outputText("。[pg]");
         outputText("蓝色的那只悬停在半空中，一脸疑惑地看着你，[say: 实际上，你是我们见过的第一个不是小马的人。][pg]");
         outputText("你告诉她们，说实话，你也没见过任何<b>是</b>小马的人。粉色的那只现在稍微平静了一点，插话道[say: 小马，不是小马，管他呢！我们有新朋友了，我说，开派对！！！][pg]");
         outputText("这些小马绝对是一群吵闹的家伙，尤其是白色的那只，从她看到你的那一刻起，就一直在抱怨你糟糕的时尚品味。唯一的例外似乎是那只黄色的，她躲在一群松鼠、鸟类和——你觉得可能是三代同堂的——兔子后面。[pg]");
         outputText("你该怎么做？你可以和这些小马一起开派对；毕竟，自从来到这里，你还没有理由开派对。你也可以暂时礼貌地拒绝，或者离开这些颜色奇怪、有点令人不安的生物，去寻找更熟悉的恶魔身影。[pg]");
         outputText("无论你选择什么，直觉告诉你，你不会再见到这些小马了。");
         menu();
         addButton(0,"太诡异了",derpCreepy);
         addButton(1,"耶，派对！",derpyParty);
         addButton(14,"离开",derpPolitely);
      }
      
      public function DLCPrompt(param1:String, param2:String, param3:String, param4:Object = undefined) : void
      {
         var nextFunc1:Object;
         var dlcPrice1:String;
         var dlcName1:String;
         var _g:AprilFools;
         clearOutput();
         outputText(param2);
         outputText("[pg]你可以花费 " + param3 + " 购买 " + param1 + "。你现在想购买吗？");
         menu();
         _g = this;
         dlcName1 = param1;
         dlcPrice1 = param3;
         nextFunc1 = param4;
         addButton(0,"是",function():void
         {
            _g.buyDLCPrompt(dlcName1,dlcPrice1,nextFunc1);
         });
         if(param4 != null)
         {
            addButton(1,"否",param4);
         }
         else
         {
            addButton(1,"否",playerMenu);
         }
      }
   }
}

