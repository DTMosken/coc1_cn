package classes.scenes.places.telAdre
{
   import classes.Player;
   import classes._FlagDict.FlagDict_Impl_;
   import classes.display.SpriteDb;
   import classes.globalFlags.KFLAGS;
   import classes.internals.Utils;
   import classes.scenes.Camp;
   import classes.scenes.places.TelAdre;
   import flash.Boot;
   import haxe.IMap;
   
   public class CarpentryShop extends TelAdreAbstractContent
   {
      
      public var wood:int;
      
      public var stone:int;
      
      public var nails:int;
      
      public function CarpentryShop()
      {
         if(Boot.skip_constructor)
         {
            return;
         }
         stone = 0;
         wood = 0;
         nails = 0;
         super();
      }
      
      public function enter() : void
      {
         clearOutput();
         spriteSelect(SpriteDb.get_s_carpenter());
         outputText("你走进了一家挂着画有锤子和锯子标志招牌的商店。里面整齐地挂着一排排工具。一个六英尺高的" + (get_noFur() ? "男人站在柜台后面，他的皮肤上有着斑马一样的条纹，长着马耳和马尾" : "斑马兽人种马") + "。他看起来穿着典型的伐木工装束。[pg]");
         outputText("[say: 欢迎光临我的五金店，亲爱的顾客。请随意看看，]他说道。");
         unlockCodexEntry(2270);
         if(get_player().hasKeyItem("Carpenter\'s Toolbox"))
         {
            get_camp().cabinProgress.checkMaterials();
         }
         menu();
         if(get_player().hasKeyItem("Carpenter\'s Toolbox"))
         {
            addButton(0,"购买钉子",carpentryShopBuyNails);
         }
         else
         {
            addButtonDisabled(0,"买钉子","你没有工具箱，要怎么安全地携带钉子？");
         }
         addButton(1,"购买木材",carpentryShopBuyWood);
         addButton(2,"购买石头",carpentryShopBuyStone);
         if(get_player().keyItemv1("Carpenter\'s Toolbox") > 0)
         {
            addButton(5,"出售钉子",carpentryShopSellNails);
         }
         else
         {
            addButtonDisabled(5,"出售钉子","你没有钉子可以出售。");
         }
         if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,2005) > 0)
         {
            addButton(6,"出售木材",carpentryShopSellWood);
         }
         else
         {
            addButtonDisabled(6,"出售木材","你没有木材可卖。");
         }
         if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,2267) > 0)
         {
            addButton(7,"出售石头",carpentryShopSellStone);
         }
         else
         {
            addButtonDisabled(7,"出售石头","你没有可出售的石头。");
         }
         if(!get_player().hasKeyItem("Carpenter\'s Toolbox"))
         {
            addButton(10,"工具箱",carpentryShopBuySet);
            addButtonDisabled(11,"钉子盒","你需要一个木匠工具箱才能使用这个。");
         }
         else
         {
            addButtonDisabled(10,"工具箱","你已经拥有一套木工工具了。");
            if(!get_player().hasKeyItem("Carpenter\'s Nail Box"))
            {
               addButton(11,"钉子盒",carpentryShopBuyNailbox);
            }
            else
            {
               addButtonDisabled(11,"钉子盒","你已经拥有一个钉子盒。");
            }
         }
         addButton(14,"离开",get_telAdre().armorShops);
      }
      
      public function carpentryShopSellWoodYes() : void
      {
         var _loc1_:* = null as Player;
         var _loc2_:* = null as IMap;
         clearOutput();
         if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,2005) >= wood)
         {
            _loc1_ = get_player();
            _loc1_.set_gems(_loc1_.get_gems() + wood * 5);
            _loc2_ = KFLAGS.flags;
            FlagDict_Impl_.arrayWriteInt(_loc2_,2005,FlagDict_Impl_.arrayReadInt(_loc2_,2005) - wood);
            outputText("你签署了许可表，以便将 " + Utils.num2Text(wood) + " 根木材从营地卸下。[say: 成交。给你 " + wood * 5 + " 宝石，]他说。[pg]");
            get_camp().cabinProgress.checkMaterials(2);
         }
         else
         {
            outputText("[say: 抱歉，我的朋友。你没有足够的木材。]");
         }
         statScreenRefresh();
         doNext(carpentryShopSellWood);
      }
      
      public function carpentryShopSellWoodAmount(param1:int) : void
      {
         clearOutput();
         wood = param1;
         outputText("你愿意提供 " + Utils.num2Text(param1) + " 块木材。他回答道[say: 我出 " + param1 * 5 + " 宝石。]");
         outputText("[pg]你要出售木材吗？");
         doYesNo(carpentryShopSellWoodYes,carpentryShopSellWood);
      }
      
      public function carpentryShopSellWood() : void
      {
         var amount4:int;
         var _g4:CarpentryShop;
         var amount3:int;
         var _g3:CarpentryShop;
         var amount2:int;
         var _g2:CarpentryShop;
         var amount1:int;
         var _g1:CarpentryShop;
         var amount:int;
         var _g:CarpentryShop;
         clearOutput();
         outputText("你问他是否愿意从你这里收购木材。他说，[say: 当然！我会以每块五颗宝石的价格收购木材。][pg]");
         get_camp().cabinProgress.checkMaterials(2);
         menu();
         if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,2005) >= 1)
         {
            _g = this;
            amount = 1;
            addButton(0,"出售一份",function():void
            {
               _g.carpentryShopSellWoodAmount(amount);
            });
         }
         if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,2005) >= 5)
         {
            _g1 = this;
            amount1 = 5;
            addButton(1,"出售五份",function():void
            {
               _g1.carpentryShopSellWoodAmount(amount1);
            });
         }
         if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,2005) >= 10)
         {
            _g2 = this;
            amount2 = 10;
            addButton(2,"出售十份",function():void
            {
               _g2.carpentryShopSellWoodAmount(amount2);
            });
         }
         if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,2005) >= 25)
         {
            _g3 = this;
            amount3 = 25;
            addButton(3,"出售二十五份",function():void
            {
               _g3.carpentryShopSellWoodAmount(amount3);
            });
         }
         if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,2005) > 0)
         {
            _g4 = this;
            amount4 = FlagDict_Impl_.arrayReadInt(KFLAGS.flags,2005);
            addButton(4,"全部出售",function():void
            {
               _g4.carpentryShopSellWoodAmount(amount4);
            });
         }
         addButton(14,"返回",enter);
      }
      
      public function carpentryShopSellStoneYes() : void
      {
         var _loc1_:* = null as Player;
         var _loc2_:* = null as IMap;
         clearOutput();
         if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,2267) >= stone)
         {
            _loc1_ = get_player();
            _loc1_.set_gems(_loc1_.get_gems() + stone * 10);
            _loc2_ = KFLAGS.flags;
            FlagDict_Impl_.arrayWriteInt(_loc2_,2267,FlagDict_Impl_.arrayReadInt(_loc2_,2267) - stone);
            outputText("你签署了许可表，允许从营地卸下 " + Utils.num2Text(stone) + "" + (FlagDict_Impl_.arrayReadInt(KFLAGS.flags,2267) == 1 ? "块" : "块") + " 石头。[say: 成交。这里是 " + stone * 10 + " 宝石，] 他说。[pg]");
            get_camp().cabinProgress.checkMaterials(3);
         }
         else
         {
            outputText("[say: 抱歉，我的朋友。你没有足够的石头。]");
         }
         statScreenRefresh();
         doNext(carpentryShopSellStone);
      }
      
      public function carpentryShopSellStoneAmount(param1:int) : void
      {
         clearOutput();
         stone = param1;
         outputText("你愿意提供" + Utils.num2Text(param1) + (FlagDict_Impl_.arrayReadInt(KFLAGS.flags,2267) == 1 ? "块" : "块") + "石头。他回答道，[say: 我会用" + param1 * 10 + "颗宝石买下它。]");
         outputText("[pg]你要出售石头吗？");
         doYesNo(carpentryShopSellStoneYes,carpentryShopSellStone);
      }
      
      public function carpentryShopSellStone() : void
      {
         var amount4:int;
         var _g4:CarpentryShop;
         var amount3:int;
         var _g3:CarpentryShop;
         var amount2:int;
         var _g2:CarpentryShop;
         var amount1:int;
         var _g1:CarpentryShop;
         var amount:int;
         var _g:CarpentryShop;
         clearOutput();
         outputText("你问他是否愿意从你这儿买些石头。他说，[say:当然可以！我收石头的价格是一块十宝石。][pg]");
         get_camp().cabinProgress.checkMaterials(3);
         menu();
         if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,2267) >= 1)
         {
            _g = this;
            amount = 1;
            addButton(0,"出售一份",function():void
            {
               _g.carpentryShopSellStoneAmount(amount);
            });
         }
         if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,2267) >= 5)
         {
            _g1 = this;
            amount1 = 5;
            addButton(1,"出售五份",function():void
            {
               _g1.carpentryShopSellStoneAmount(amount1);
            });
         }
         if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,2267) >= 10)
         {
            _g2 = this;
            amount2 = 10;
            addButton(2,"出售十份",function():void
            {
               _g2.carpentryShopSellStoneAmount(amount2);
            });
         }
         if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,2267) >= 25)
         {
            _g3 = this;
            amount3 = 25;
            addButton(3,"出售二十五份",function():void
            {
               _g3.carpentryShopSellStoneAmount(amount3);
            });
         }
         if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,2267) > 0)
         {
            _g4 = this;
            amount4 = FlagDict_Impl_.arrayReadInt(KFLAGS.flags,2267);
            addButton(4,"全部出售",function():void
            {
               _g4.carpentryShopSellStoneAmount(amount4);
            });
         }
         addButton(14,"返回",enter);
      }
      
      public function carpentryShopSellNailsYes() : void
      {
         var _loc1_:* = null as Player;
         clearOutput();
         if(get_player().keyItemv1("Carpenter\'s Toolbox") >= nails)
         {
            _loc1_ = get_player();
            _loc1_.set_gems(_loc1_.get_gems() + nails);
            get_player().addKeyValue("Carpenter\'s Toolbox",1,-nails);
            outputText("你从工具箱里取出 " + Utils.num2Text(nails) + "" + (get_player().keyItemv1("Carpenter\'s Toolbox") == 1 ? "枚" : "枚") + " 钉子，递给了木匠。[say: 成交。这是 " + nails + " 宝石，] 他说道。[pg]");
            get_camp().cabinProgress.checkMaterials(1);
         }
         else
         {
            outputText("[say: 抱歉，我的朋友。你的钉子不够。]");
         }
         statScreenRefresh();
         doNext(carpentryShopSellNails);
      }
      
      public function carpentryShopSellNailsAmount(param1:int) : void
      {
         clearOutput();
         nails = param1;
         outputText("你愿意提供 " + Utils.num2Text(param1) + "" + (get_player().keyItemv1("Carpenter\'s Toolbox") == 1 ? "枚" : "枚") + "钉子。他回答道[say: 我愿意用" + param1 + "宝石来买下它。]");
         outputText("[pg]你要出售钉子吗？");
         doYesNo(carpentryShopSellNailsYes,carpentryShopSellNails);
      }
      
      public function carpentryShopSellNails() : void
      {
         var amount5:int;
         var _g5:CarpentryShop;
         var amount4:int;
         var _g4:CarpentryShop;
         var amount3:int;
         var _g3:CarpentryShop;
         var amount2:int;
         var _g2:CarpentryShop;
         var amount1:int;
         var _g1:CarpentryShop;
         var amount:int;
         var _g:CarpentryShop;
         clearOutput();
         outputText("你问他是否愿意从你这里购买钉子。他说，[say:当然！我会以每根钉子一颗宝石的价格收购。][pg]");
         get_camp().cabinProgress.checkMaterials(1);
         menu();
         if(get_player().keyItemv1("Carpenter\'s Toolbox") >= 10)
         {
            _g = this;
            amount = 10;
            addButton(0,"出售10根",function():void
            {
               _g.carpentryShopSellNailsAmount(amount);
            });
         }
         if(get_player().keyItemv1("Carpenter\'s Toolbox") >= 25)
         {
            _g1 = this;
            amount1 = 25;
            addButton(1,"出售25根",function():void
            {
               _g1.carpentryShopSellNailsAmount(amount1);
            });
         }
         if(get_player().keyItemv1("Carpenter\'s Toolbox") >= 50)
         {
            _g2 = this;
            amount2 = 50;
            addButton(2,"出售50根",function():void
            {
               _g2.carpentryShopSellNailsAmount(amount2);
            });
         }
         if(get_player().keyItemv1("Carpenter\'s Toolbox") >= 75)
         {
            _g3 = this;
            amount3 = 75;
            addButton(3,"出售75根",function():void
            {
               _g3.carpentryShopSellNailsAmount(amount3);
            });
         }
         if(get_player().keyItemv1("Carpenter\'s Toolbox") >= 100)
         {
            _g4 = this;
            amount4 = 100;
            addButton(3,"出售100根",function():void
            {
               _g4.carpentryShopSellNailsAmount(amount4);
            });
         }
         if(get_player().keyItemv1("Carpenter\'s Toolbox") > 0)
         {
            _g5 = this;
            amount5 = get_player().keyItemv1("Carpenter\'s Toolbox");
            addButton(4,"全部出售",function():void
            {
               _g5.carpentryShopSellNailsAmount(amount5);
            });
         }
         addButton(14,"返回",enter);
      }
      
      public function carpentryShopBuyWoodYes() : void
      {
         var _loc1_:* = null as Player;
         var _loc2_:* = null as IMap;
         var _loc3_:* = null as Player;
         clearOutput();
         if(get_player().get_gems() >= wood * 10)
         {
            _loc1_ = get_player();
            _loc1_.set_gems(_loc1_.get_gems() - wood * 10);
            _loc2_ = KFLAGS.flags;
            FlagDict_Impl_.arrayWriteInt(_loc2_,2101,FlagDict_Impl_.arrayReadInt(_loc2_,2101) + wood);
            if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,2101) >= 100)
            {
               awardAchievement("我才不是伐木工",154);
            }
            _loc2_ = KFLAGS.flags;
            FlagDict_Impl_.arrayWriteInt(_loc2_,2005,FlagDict_Impl_.arrayReadInt(_loc2_,2005) + wood);
            outputText("你递过去 " + wood * 10 + " 宝石。[say: 等你一离开我的店铺，商队就会把木材送到你的营地，] 他说。[pg]");
            if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,2005) > get_camp().cabinProgress.maxWoodSupply())
            {
               outputText("不幸的是，你的木材储备似乎已经满了。你告诉了他。他把宝石退还给了你。[pg]");
               _loc3_ = get_player();
               _loc3_.set_gems(_loc3_.get_gems() + (FlagDict_Impl_.arrayReadInt(KFLAGS.flags,2005) - get_camp().cabinProgress.maxWoodSupply()) * 10);
               _loc2_ = KFLAGS.flags;
               FlagDict_Impl_.arrayWriteInt(_loc2_,2005,FlagDict_Impl_.arrayReadInt(_loc2_,2005) - (FlagDict_Impl_.arrayReadInt(KFLAGS.flags,2005) - get_camp().cabinProgress.maxWoodSupply()));
            }
            get_camp().cabinProgress.checkMaterials(2);
         }
         else
         {
            clearOutput();
            outputText("[say: 抱歉，我的朋友。你的宝石不够。]");
         }
         statScreenRefresh();
         doNext(carpentryShopBuyWood);
      }
      
      public function carpentryShopBuyWoodAmount(param1:int) : void
      {
         clearOutput();
         wood = param1;
         outputText("你向他索要" + param1 + "块木材。他回答 [say: 那需要" + param1 * 10 + "宝石。]");
         outputText("[pg]你要买这些木材吗？");
         doYesNo(carpentryShopBuyWoodYes,carpentryShopBuyWood);
      }
      
      public function carpentryShopBuyWood() : void
      {
         var amount4:int;
         var _g4:CarpentryShop;
         var amount3:int;
         var _g3:CarpentryShop;
         var amount2:int;
         var _g2:CarpentryShop;
         var amount1:int;
         var _g1:CarpentryShop;
         var amount:int;
         var _g:CarpentryShop;
         clearOutput();
         outputText("你问他有没有木材卖。他回答道：[say: 当然有！我有多余的木材储备。每块木板售价10颗宝石。][pg]");
         get_camp().cabinProgress.checkMaterials(2);
         menu();
         _g = this;
         amount = 10;
         addButton(0,"购买十份",function():void
         {
            _g.carpentryShopBuyWoodAmount(amount);
         });
         _g1 = this;
         amount1 = 20;
         addButton(1,"购买二十份",function():void
         {
            _g1.carpentryShopBuyWoodAmount(amount1);
         });
         _g2 = this;
         amount2 = 30;
         addButton(2,"购买三十份",function():void
         {
            _g2.carpentryShopBuyWoodAmount(amount2);
         });
         _g3 = this;
         amount3 = 40;
         addButton(3,"购买四十份",function():void
         {
            _g3.carpentryShopBuyWoodAmount(amount3);
         });
         _g4 = this;
         amount4 = 50;
         addButton(4,"购买五十份",function():void
         {
            _g4.carpentryShopBuyWoodAmount(amount4);
         });
         addButton(14,"返回",enter);
      }
      
      public function carpentryShopBuyStoneYes() : void
      {
         var _loc1_:* = null as Player;
         var _loc2_:* = null as IMap;
         var _loc3_:* = null as Player;
         if(get_player().get_gems() >= stone * 20)
         {
            _loc1_ = get_player();
            _loc1_.set_gems(_loc1_.get_gems() - stone * 20);
            _loc2_ = KFLAGS.flags;
            FlagDict_Impl_.arrayWriteInt(_loc2_,2268,FlagDict_Impl_.arrayReadInt(_loc2_,2268) + stone);
            if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,2268) >= 100)
            {
               awardAchievement("呀吧嗒吧嘟",170);
            }
            _loc2_ = KFLAGS.flags;
            FlagDict_Impl_.arrayWriteInt(_loc2_,2267,FlagDict_Impl_.arrayReadInt(_loc2_,2267) + stone);
            outputText("你递上了" + stone * 20 + " 颗宝石。[say:等你一离开我的店铺，我就让商队把石头送到你的营地。]他说。[pg]");
            if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,2267) > get_camp().cabinProgress.maxStoneSupply())
            {
               outputText("不幸的是，你的石头似乎已经满了。你告知了他，他将宝石退还给了你。[pg]");
               _loc3_ = get_player();
               _loc3_.set_gems(_loc3_.get_gems() + (FlagDict_Impl_.arrayReadInt(KFLAGS.flags,2267) - get_camp().cabinProgress.maxStoneSupply()) * 20);
               _loc2_ = KFLAGS.flags;
               FlagDict_Impl_.arrayWriteInt(_loc2_,2267,FlagDict_Impl_.arrayReadInt(_loc2_,2267) - (FlagDict_Impl_.arrayReadInt(KFLAGS.flags,2267) - get_camp().cabinProgress.maxStoneSupply()));
            }
            get_camp().cabinProgress.checkMaterials(3);
         }
         else
         {
            outputText("[say: 抱歉，我的朋友。你的宝石不够。]");
         }
         statScreenRefresh();
         doNext(carpentryShopBuyStone);
      }
      
      public function carpentryShopBuyStoneAmount(param1:int) : void
      {
         clearOutput();
         stone = param1;
         outputText("你向他索要" + param1 + "块石头。他回答[say: 那需要" + param1 * 20 + "宝石。]");
         outputText("[pg]你要买这些石头吗？");
         doYesNo(carpentryShopBuyStoneYes,carpentryShopBuyStone);
      }
      
      public function carpentryShopBuyStone() : void
      {
         var amount4:int;
         var _g4:CarpentryShop;
         var amount3:int;
         var _g3:CarpentryShop;
         var amount2:int;
         var _g2:CarpentryShop;
         var amount1:int;
         var _g1:CarpentryShop;
         var amount:int;
         var _g:CarpentryShop;
         clearOutput();
         outputText("你问他有没有石头要卖。他回答道[say: 当然！我这里有额外的石头库存。我会以每块20宝石的价格出售。][pg]");
         get_camp().cabinProgress.checkMaterials(3);
         menu();
         _g = this;
         amount = 10;
         addButton(0,"购买十份",function():void
         {
            _g.carpentryShopBuyStoneAmount(amount);
         });
         _g1 = this;
         amount1 = 20;
         addButton(1,"购买二十份",function():void
         {
            _g1.carpentryShopBuyStoneAmount(amount1);
         });
         _g2 = this;
         amount2 = 30;
         addButton(2,"购买三十份",function():void
         {
            _g2.carpentryShopBuyStoneAmount(amount2);
         });
         _g3 = this;
         amount3 = 40;
         addButton(3,"购买四十份",function():void
         {
            _g3.carpentryShopBuyStoneAmount(amount3);
         });
         _g4 = this;
         amount4 = 50;
         addButton(4,"购买五十份",function():void
         {
            _g4.carpentryShopBuyStoneAmount(amount4);
         });
         addButton(14,"返回",enter);
      }
      
      public function carpentryShopBuySetYes() : void
      {
         var _loc1_:Player = get_player();
         _loc1_.set_gems(_loc1_.get_gems() - 200);
         outputText("你把两百颗宝石交给了店主。");
         outputText("[say: 给你,] 他说。你为自己拥有了建造工具而感到无比自豪！[pg]");
         outputText("<b>获得关键物品：木匠工具箱！</b>");
         get_player().createKeyItem("Carpenter\'s Toolbox",0,0,0,0);
         statScreenRefresh();
         doNext(enter);
      }
      
      public function carpentryShopBuySetNo() : void
      {
         clearOutput();
         outputText("[say: 不，谢谢，]你告诉他。[pg]");
         outputText("[say: 随你便，]他说道，你把工具箱放回了原处。");
         doNext(enter);
      }
      
      public function carpentryShopBuySet() : void
      {
         clearOutput();
         if(get_player().hasKeyItem("Carpenter\'s Toolbox"))
         {
            outputText("<b>你已经拥有一套木工工具了！</b>");
            doNext(enter);
            return;
         }
         outputText("你四处走动了一会儿，直到你看到一个木制工具箱。里面装满了各种工具。其中一个是锤子。另一个是锯子。甚至还有一把斧头。还有卷尺。甚至还有一本几百页的书，全都是关于如何使用工具的，甚至还有项目说明！工具箱里还有一个放钉子的隔间。");
         if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,2004) >= 4)
         {
            outputText("正是你建造小屋所需的东西。[pg]");
         }
         else
         {
            outputText("要是你想造点什么东西让自己过得舒服点，这玩意儿可趁手了。[pg]");
         }
         outputText("[say: 两百颗宝石，它就是你的了，]店主说道。[pg]");
         if(get_player().get_gems() >= 200)
         {
            outputText("要买吗？");
            doYesNo(carpentryShopBuySetYes,carpentryShopBuySetNo);
         }
         else
         {
            outputText("你数了数自己的宝石，意识到价格超出了你的承受范围。");
            doNext(enter);
         }
      }
      
      public function carpentryShopBuyNailsYes() : void
      {
         var _loc1_:* = null as Player;
         var _loc2_:* = null as IMap;
         var _loc3_:* = null as Player;
         clearOutput();
         if(get_player().get_gems() >= nails * 2)
         {
            _loc1_ = get_player();
            _loc1_.set_gems(_loc1_.get_gems() - nails * 2);
            _loc2_ = KFLAGS.flags;
            FlagDict_Impl_.arrayWriteInt(_loc2_,2102,FlagDict_Impl_.arrayReadInt(_loc2_,2102) + nails);
            if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,2102) >= 300)
            {
               awardAchievement("锤子时间",156);
            }
            get_player().addKeyValue("Carpenter\'s Toolbox",1,nails);
            outputText("你递给他 " + nails * 2 + " 颗宝石。[say: 好了，] 他说着，递给你一捆 " + nails + " 根钉子。[pg]");
            if(get_player().keyItemv1("Carpenter\'s Toolbox") > get_camp().cabinProgress.maxNailSupply())
            {
               outputText("不幸的是，你的工具箱已经装不下更多钉子了。你告知了他，他便退还了你宝石。[pg]");
               _loc3_ = get_player();
               _loc3_.set_gems(_loc3_.get_gems() + int((get_player().keyItemv1("Carpenter\'s Toolbox") - get_camp().cabinProgress.maxNailSupply()) * 2));
               get_player().addKeyValue("Carpenter\'s Toolbox",1,-(get_player().keyItemv1("Carpenter\'s Toolbox") - get_camp().cabinProgress.maxNailSupply()));
            }
            get_camp().cabinProgress.checkMaterials(1);
         }
         else
         {
            outputText("[say: 抱歉，我的朋友。你的宝石不够。]");
         }
         statScreenRefresh();
         doNext(carpentryShopBuyNails);
      }
      
      public function carpentryShopBuyNailsAmount(param1:int) : void
      {
         clearOutput();
         nails = param1;
         outputText("你向他要了 " + param1 + " 根钉子。他回答道：[say: 一共是 " + param1 * 2 + " 颗宝石，谢谢。]");
         outputText("[pg]你要买下这些钉子吗？");
         doYesNo(carpentryShopBuyNailsYes,carpentryShopBuyNails);
      }
      
      public function carpentryShopBuyNails() : void
      {
         var amount4:int;
         var _g4:CarpentryShop;
         var amount3:int;
         var _g3:CarpentryShop;
         var amount2:int;
         var _g2:CarpentryShop;
         var amount1:int;
         var _g1:CarpentryShop;
         var amount:int;
         var _g:CarpentryShop;
         clearOutput();
         outputText("你问他是否有钉子出售。他回答道[say: 当然！我有钉子。你的工具箱最多可以存放" + get_camp().cabinProgress.maxNailSupply() + "枚钉子。我以每枚两宝石的价格出售钉子。][pg]");
         get_camp().cabinProgress.checkMaterials(1);
         menu();
         _g = this;
         amount = 10;
         addButton(0,"购买10根",function():void
         {
            _g.carpentryShopBuyNailsAmount(amount);
         });
         _g1 = this;
         amount1 = 25;
         addButton(1,"购买25根",function():void
         {
            _g1.carpentryShopBuyNailsAmount(amount1);
         });
         _g2 = this;
         amount2 = 50;
         addButton(2,"购买50根",function():void
         {
            _g2.carpentryShopBuyNailsAmount(amount2);
         });
         _g3 = this;
         amount3 = 75;
         addButton(3,"购买75根",function():void
         {
            _g3.carpentryShopBuyNailsAmount(amount3);
         });
         _g4 = this;
         amount4 = 100;
         addButton(4,"购买100根",function():void
         {
            _g4.carpentryShopBuyNailsAmount(amount4);
         });
         addButton(14,"返回",enter);
      }
      
      public function carpentryShopBuyNailboxYes() : void
      {
         var _loc1_:Player = get_player();
         _loc1_.set_gems(_loc1_.get_gems() - 200);
         outputText("你把两百颗宝石交给了店主。");
         outputText("[say: 给你，]他说。现在你可以为你的项目携带更多钉子了！[pg]");
         outputText("<b>获得关键物品：木工钉盒！</b>");
         get_player().createKeyItem("Carpenter\'s Nail Box",400,0,0,0);
         statScreenRefresh();
         doNext(enter);
      }
      
      public function carpentryShopBuyNailboxNo() : void
      {
         clearOutput();
         outputText("[say: 不，谢谢，]你告诉他。[pg]");
         outputText("[say: 随你便吧，] 你刚把钉子盒放回原处，他就说道。");
         doNext(enter);
      }
      
      public function carpentryShopBuyNailbox() : void
      {
         if(get_player().hasKeyItem("Carpenter\'s Nail Box"))
         {
            outputText("<b>你已经拥有一个钉子盒了！</b>");
            doNext(enter);
            return;
         }
         outputText("[pg]你走回你记得买工具箱的地方。那里有可以装四百颗钉子的钉子盒。毫无疑问，这样你就能携带更多钉子，确保一趟就能继续建造工程。");
         outputText("[say: 两百颗宝石，它就是你的了，]店主说道。[pg]");
         if(get_player().get_gems() >= 200)
         {
            outputText("要买吗？");
            doYesNo(carpentryShopBuyNailboxYes,carpentryShopBuyNailboxNo);
         }
         else
         {
            outputText("你数了数自己的宝石，意识到价格超出了你的承受范围。");
            doNext(enter);
         }
      }
   }
}

