package classes.items.consumables
{
   import classes.CoC;
   import classes.DynStat;
   import classes.Player;
   import classes.StatusEffects;
   import classes.internals.Utils;
   import classes.items.Consumable;
   import classes.items.ConsumableLib;
   import classes.items.UseableLib;
   import classes.scenes.Inventory;
   import flash.Boot;
   
   public final class KitsuneGift extends Consumable
   {
      
      public function KitsuneGift()
      {
         if(Boot.skip_constructor)
         {
            return;
         }
         super("KitGift","Kitsune Gift","a kitsune\'s gift",0,"A small square package given to you by a forest kitsune. It is wrapped up in plain white paper and tied with a string. Who knows what\'s inside?");
      }
      
      override public function useItem() : Boolean
      {
         var _loc1_:int = 0;
         var _loc2_:* = null as Player;
         var _loc3_:* = null as Consumable;
         outputText("好奇心战胜了你，你决定打开包裹。毕竟，最坏的情况能是什么呢？[pg]");
         switch(Utils.rand(14))
         {
            case 0:
               outputText("随着包装纸剥落，你小心翼翼地掀开盒盖，双手紧张地颤抖着。盒子内部衬着紫色的天鹅绒，令你高兴的是，中央放着一颗水滴状的小宝石！");
               outputText("[pg]<b>你从狐妖的礼物中获得了一颗闪闪发光的狐狸宝珠！真是太慷慨了！</b>");
               get_inventory().takeItem(get_consumables().FOXJEWL,get_inventory().inventoryMenu);
               return true;
            case 1:
               outputText("随着包装纸剥落，你小心翼翼地掀开盒盖，双手紧张地颤抖着。盒子内部衬着紫色的天鹅绒，令你高兴的是，中央放着一小串橙色的浆果！");
               outputText("[pg]<b>你从狐妖的礼物中获得了一颗狐狸浆果！真是太慷慨了！</b>");
               get_inventory().takeItem(get_consumables().FOXBERY,get_inventory().inventoryMenu);
               return true;
            case 2:
               outputText("随着包装纸剥落，你小心翼翼地掀开盒盖，双手紧张地颤抖着。盒子内部衬着紫色的天鹅绒，令你高兴的是，里面装满了闪闪发光的宝石！");
               _loc1_ = 2 + Utils.rand(20);
               outputText("[pg]<b>你从狐妖的礼物中获得了 " + Utils.num2Text(_loc1_) + " 颗闪亮的宝石！真是太慷慨了！</b>");
               _loc2_ = get_player();
               _loc2_.set_gems(_loc2_.get_gems() + _loc1_);
               statScreenRefresh();
               break;
            case 3:
               outputText("随着包装纸剥落，你小心翼翼地掀开盒盖，双手紧张地颤抖着。盒子内部衬着紫色的天鹅绒，令你高兴的是，里面装着一小袋干茶叶！");
               outputText("[pg]<b>你从狐妖的礼物中获得了一袋茶叶！真是太贴心了！</b>");
               get_inventory().takeItem(get_consumables().SMART_T,get_inventory().inventoryMenu);
               return true;
            case 4:
               outputText("随着包装纸剥落，你小心翼翼地掀开盒盖，双手紧张地颤抖着。盒子内部衬着紫色的天鹅绒，令你高兴的是，里面装着一小瓶染发剂！");
               _loc3_ = [get_consumables().RED_DYE,get_consumables().BLOND_D,get_consumables().BLACK_D,get_consumables().WHITEDY][Utils.rand(4)];
               outputText("[pg]<b>你从狐妖的礼物中获得了 " + Utils.cnName(_loc3_.get_longName()) + "！真是太慷慨了！</b>");
               get_inventory().takeItem(_loc3_,get_inventory().inventoryMenu);
               return true;
            case 5:
               outputText("随着包装纸脱落，你紧张地颤抖着双手，小心翼翼地掀开盒盖。盒子内部衬着紫色的天鹅绒，但里面似乎什么也没有。当你往盒子里看时，一个充满奇怪符号的发光圆圈突然闪烁起来！光芒洗刷着你，你的脑海中突然涌入了新的知识……以及用这些知识去恶作剧的冲动！");
               outputText("[pg]<b>狐妖与你分享了它的一些知识！</b>但在这一过程中，你也沾染了一些狐妖那淫荡又爱恶作剧的本性……");
               dynStats(DynStat.Inte(4),DynStat.Sens(2),DynStat.Lust(10));
               break;
            case 6:
               outputText("随着包装纸脱落，你紧张地颤抖着双手，小心翼翼地掀开盒盖。盒子内部衬着紫色的天鹅绒，正中央放着一个制作精巧的纸人。就在你眼前，纸人活了过来，奇妙地跳起舞来。毫无预兆地，它跳进了你的[inv]，然后蹦蹦跳跳地跑进了树林，顺走了一小笔宝石财富。");
               outputText("[pg]<b>狐妖的使魔偷走了你的宝石！</b>");
               _loc2_ = get_player();
               _loc2_.set_gems(_loc2_.get_gems() - (2 + Utils.rand(15)));
               statScreenRefresh();
               break;
            case 7:
               outputText("随着包装纸脱落，你紧张地颤抖着双手，小心翼翼地掀开盒盖。盒子内部衬着紫色的天鹅绒，正中央放着一个制作精巧的纸人。就在你眼前，纸人活了过来，奇妙地跳起舞来。毫无预兆地，它凭空掏出一支大毛笔，跳到你的脸上，然后蹦蹦跳跳地跑进了树林。你试探性地摸了摸自己的脸，指尖沾上了一层新鲜的黑墨水。");
               outputText("[pg]<b>狐妖的使魔在你脸上乱画了一通！</b> 这些顽固的印记花了一小时才在附近的小溪里彻底洗掉。在清洗的时候，你发誓你听到了树林里传来幸灾乐祸的窃笑声。");
               dynStats(DynStat.Lust(-20));
               break;
            case 8:
               outputText("随着包装纸落下，你小心翼翼地掀开盒盖，双手紧张地颤抖着。盒子内部衬着紫色的天鹅绒，中央坐着一个制作精巧的纸人。就在你眼前，纸人活了过来，异想天开地跳起舞来。毫无预兆地，它抓起一把散发着甜香的粉色粉末撒在你脸上，然后跳出盒子，蹦蹦跳跳地跑进了树林。还没等你反应过来，你就感到浑身发热，面红耳赤，双手不由自主地摸向自己的下体。");
               outputText("[pg]<b>糟糕！狐妖的使魔用强力催情剂击中了你！你现在欲火焚身，除了自慰什么也想不了。</b>");
               dynStats(DynStat.Lust(100),DynStat.NoScale);
               break;
            case 9:
               outputText("随着包装纸落下，你小心翼翼地掀开盒盖，双手紧张地颤抖着。盒子内部衬着紫色的天鹅绒，中央坐着一个制作精巧的纸人。就在你眼前，纸人活了过来，异想天开地跳起舞来。毫无预兆地，它抓起一把散发着酸味的橙色粉末撒在你脸上，然后跳出盒子，蹦蹦跳跳地跑进了树林。还没等你反应过来，你就感到肌肉的力量正在流失，眼睁睁地看着自己变得虚弱。");
               outputText("[pg]<b>糟糕！狐妖的使魔用吸取力量的法术击中了你！希望这只是暂时的……</b>");
               dynStats(DynStat.Str(-5),DynStat.Tou(-5));
               break;
            case 10:
               outputText("随着包装纸脱落，你小心翼翼地掀开盒盖，双手紧张地颤抖着。盒子内部衬着紫色的天鹅绒，但令你失望的是，里面似乎只有树枝、树叶和其他森林里的垃圾。");
               outputText("[pg]<b>看来狐妖的礼物只是一堆没用的垃圾！真是坑人！</b>");
               break;
            case 11:
               outputText("随着包装纸脱落，你小心翼翼地掀开盒盖，双手紧张地颤抖着。盒子内部衬着紫色的天鹅绒，但令你失望的是，里面似乎只有树枝、树叶和其他森林里的垃圾。不过，在进一步检查后，你发现这堆没用的垃圾里混杂着一块闪亮的黑色甲壳碎片。");
               outputText("[pg]<b>至少你从中找到了一块黑色甲壳碎片……</b>");
               get_inventory().takeItem(get_useables().B_CHITN,get_inventory().inventoryMenu);
               return true;
            case 12:
               outputText("随着包装纸脱落，你小心翼翼地掀开盒盖。盒子内部衬着紫色的天鹅绒，但里面的东西却是一大堆看起来很普通的棍子。你差点把这些垃圾扔掉，直到你注意到其中一根棍子顶端有一个闪亮的红色圆球。进一步检查后，你意识到那是一块硬糖！[pg]");
               get_inventory().takeItem(get_consumables().LOLIPOP,get_inventory().inventoryMenu);
               return true;
            case 13:
               outputText("随着包装纸脱落，你小心翼翼地掀开盒盖，双手紧张地颤抖着。一缕闪烁着蓝光的稀薄烟雾从盒子里飘出，你不小心吸入了一口。你的心沉了下去，做好了最坏的打算。");
               outputText("[pg]……但什么也没发生。你耸了耸肩，有些生气这个盒子里竟然没有值钱的东西。你打开你的[inv]，不出所料，几只狐妖已经溜了进去。你把它们赶走，并告诉它们等你回到营地里的狐妖那里后，再去摸它们毛茸茸的尾巴。然后你注意到一只特别小的狐妖已经设法钻进了你的耳朵里。你试图把她弄出来，但你的动作不够快；她已经深入了你的脑海。该死的狐妖。也许你狐妖村里的狐妖会知道怎么移除脑子里的狐妖。");
               get_game().forest.kitsuneScene.saveContent.hadVision = true;
               get_player().createStatusEffect(StatusEffects.kitsuneVision,0,0,0,0);
         }
         return false;
      }
   }
}

