package classes.scenes.places.bazaar
{
   import classes.ItemType;
   import classes.Player;
   import classes.display.SpriteDb;
   import classes.internals.Utils;
   import classes.items.ArmorLib;
   import classes.items.WeaponLib;
   import classes.scenes.Inventory;
   import classes.scenes.places.Bazaar;
   import coc.view.CoCButton;
   import flash.Boot;
   
   public class ChillySmith extends BazaarAbstractContent
   {
      
      public function ChillySmith()
      {
         if(Boot.skip_constructor)
         {
            return;
         }
         super();
      }
      
      public function transactionYes(param1:ItemType, param2:int, param3:int) : void
      {
         var shop1:int;
         var _g:ChillySmith;
         var _loc5_:* = null as Player;
         var _loc4_:Function = param3 == 1 ? buySomeWeapons : buySomeArmor;
         clearOutput();
         if(get_player().get_gems() >= param2)
         {
            outputText("桑花了一会儿时间数清了宝石，然后把" + Utils.cnName(param1.get_longName()) + "递给你，说道：[say:给你。]");
            _loc5_ = get_player();
            _loc5_.set_gems(_loc5_.get_gems() - param2);
            menu();
            statScreenRefresh();
            get_inventory().takeItem(param1,_loc4_);
         }
         else
         {
            outputText("你数了数你的宝石，发现自己买不起。");
            menu();
            _g = this;
            shop1 = param3;
            addButton(0,"继续",function():void
            {
               _g.transactionNo(shop1);
            });
         }
      }
      
      public function transactionNo(param1:int) : void
      {
         if(param1 == 1)
         {
            buySomeWeapons();
         }
         else
         {
            buySomeArmor();
         }
      }
      
      public function transactionItemConfirmation(param1:ItemType, param2:int, param3:int) : void
      {
         var shop3:int;
         var _g2:ChillySmith;
         var shop2:int;
         var _g1:ChillySmith;
         var shop1:int;
         var price1:int;
         var item1:ItemType;
         var _g:ChillySmith;
         clearOutput();
         outputText("当你把" + Utils.cnName(param1.get_longName()) + "拿到桑面前，递给他并询问价格时，他看了过来。他从你手中接过物品看了一会儿，然后咕哝道：[say:" + Utils.Num2Text(param2) + "颗宝石。]");
         if(get_player().get_gems() >= param2)
         {
            outputText("[pg]你要买下它吗？");
            menu();
            _g = this;
            item1 = param1;
            price1 = param2;
            shop1 = param3;
            addButton(0,"是",function():void
            {
               _g.transactionYes(item1,price1,shop1);
            });
            _g1 = this;
            shop2 = param3;
            addButton(1,"否",function():void
            {
               _g1.transactionNo(shop2);
            });
         }
         else
         {
            outputText("[pg]你数了数你的宝石，发现自己买不起。");
            menu();
            _g2 = this;
            shop3 = param3;
            addButton(0,"继续",function():void
            {
               _g2.transactionNo(shop3);
            });
         }
      }
      
      public function theFuckIsYouWho() : void
      {
         var _loc1_:* = null as Player;
         clearOutput();
         outputText("你走到桑面前，愉快地向他打了个招呼。他上下打量着你，似乎不太高兴。[pg]");
         if(Utils.rand(4) == 0)
         {
            outputText("桑把手伸进口袋，抓起一把宝石塞到你胸前，说道：[saystart]我给你五");
            if(get_silly())
            {
               outputText("块钱");
            }
            else
            {
               outputText("颗宝石");
            }
            outputText("，给我滚。[sayend]你困惑地道了谢，然后退开了。");
            _loc1_ = get_player();
            _loc1_.set_gems(_loc1_.get_gems() + 5);
         }
         else if(Utils.rand(2) == 0)
         {
            outputText("当他只是恶狠狠地瞪着你时，你明白了意思，[if (cor < 40) {低声道歉|嘟囔着}]退开了。");
         }
         else
         {
            outputText("[say:我有男朋友了。]他朝哈莫妮的方向竖起大拇指。你瞥了一眼哈莫妮，他耸耸肩，举起双手，然后你对着桑眨了几下眼睛。这并不是你真正想要的，但好吧。你向他表示祝贺，然后溜出了商店。");
         }
         doNext(smithShop);
      }
      
      public function smithShop() : void
      {
         spriteSelect(SpriteDb.get_s_chillySmith());
         clearOutput();
         outputText("你走进");
         if(get_silly())
         {
            outputText("奇利店");
         }
         else
         {
            outputText("冷酷铁匠铺");
         }
         outputText("并环顾四周，映入眼帘的是冷色调的墙壁和相当宁静的环境。美洲豹兽人店主看向你，甩了甩尾巴，仿佛这就是正经的问候。他身旁的黑色鸟人挥了挥手，喊道：[say:欢迎来到[if (silly) {奇利餐厅|冷酷铁匠铺}]。我是哈莫妮，那是桑。[if (silly) {请问您要点什么？|需要什么尽管喊一声！}]] 这两人是一对相当有趣的组合，桑是一堵 " + (!get_metric() ? "6英尺4英寸" : "193厘米") + " 高的肌肉墙，而哈莫妮则极其苗条，勉强够到桑的肩膀。当你在货架间漫步并浏览商品时，你注意到这家店本身也是极简而直白的风格。");
         menu();
         addButton(0,"购买",buySomeShit);
         addButton(1,"交谈",theFuckIsYouWho);
         addButton(14,"离开",get_bazaar().leaveShop);
      }
      
      public function smithButton(param1:Boolean = false) : void
      {
         if(!param1)
         {
            outputText("[pg]集市后方有一辆大马车，尽管体积庞大，却几乎引不起注意。上面只有一个牌子，写着\"");
            if(get_silly())
            {
               outputText("奇利");
            }
            else
            {
               outputText("冷酷铁匠铺");
            }
            outputText("\"。与周围耀眼的一切相比，它的颜色暗淡而深沉，仿佛在试图隐藏自己。");
         }
         else
         {
            addButton(3,"冷酷铁匠",smithShop).hint("看看当地铁匠的商品。","冷酷铁匠铺");
         }
      }
      
      public function buySomeWeapons() : void
      {
         clearOutput();
         outputText("你决定看看店里储备的武器。\n");
         menu();
         addShopItem(0,get_weapons().PTCHFRK,200,1);
         addShopItem(1,get_weapons().L_DAGGR,150,1);
         addShopItem(2,get_weapons().RIDINGC,50,1);
         addShopItem(3,get_weapons().SUCWHIP,400,1);
         addShopItem(4,get_weapons().SCIMITR,500,1);
         addShopItem(5,get_weapons().SPEAR,450,1);
         addShopItem(6,get_weapons().U_SWORD,800,1);
         addShopItem(7,get_weapons().MRAPIER,25000,1);
         addButton(14,"返回",buySomeShit);
      }
      
      public function buySomeShit() : void
      {
         clearOutput();
         outputText("[pg]你宣布你想买点东西，这引起了桑的注意。他转头看向你，眼神一如既往地死气沉沉，说道：[say:好吧。选好了就把东西拿到前面来。]");
         menu();
         addButton(0,"武器",buySomeWeapons);
         addButton(1,"护甲",buySomeArmor);
         addButton(14,"返回",smithShop);
      }
      
      public function buySomeArmor() : void
      {
         clearOutput();
         outputText("你决定看看店里储备的护甲。\n");
         menu();
         addShopItem(0,get_armors().DSCLARM,1000,2);
         addShopItem(1,get_armors().SSARMOR,2000,2);
         addShopItem(2,get_armors().FULLPLT,700,2);
         addShopItem(3,get_armors().SCALEML,500,2);
         addShopItem(4,get_armors().EBNJACK,6000,2);
         addShopItem(5,get_armors().SS_ROBE,2500,2);
         addShopItem(6,get_armors().BIMBOSK,250,2);
         addButton(14,"返回",buySomeShit);
      }
      
      public function addShopItem(param1:Number, param2:ItemType, param3:int, param4:int) : void
      {
         var shop1:int;
         var price1:int;
         var item1:ItemType;
         var _g:ChillySmith;
         outputText("\n" + Utils.cnName(Utils.capitalizeFirstLetter(param2.get_longName())) + " - " + Utils.addComma(param3) + " 宝石");
         _g = this;
         item1 = param2;
         price1 = param3;
         shop1 = param4;
         var _loc5_:Function = function():void
         {
            _g.transactionItemConfirmation(item1,price1,shop1);
         };
         addButton(int(param1),param2.get_shortName(),_loc5_).hint(param2.get_tooltipText(),param2.get_tooltipHeader());
      }
   }
}

