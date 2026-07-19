package classes.scenes.places.bazaar
{
   import classes.Cock;
   import classes.DynStat;
   import classes.PerkLib;
   import classes.Player;
   import classes.Time;
   import classes._FlagDict.FlagDict_Impl_;
   import classes.display.SpriteDb;
   import classes.globalFlags.KFLAGS;
   import classes.items.ArmorLib;
   import classes.items.Undergarment;
   import classes.items.UndergarmentLib;
   import classes.items.undergarments.NobleShirt;
   import classes.parser._Parser.TagFun_Impl_;
   import classes.scenes.Inventory;
   import classes.scenes.places.Bazaar;
   import coc.view.CoCButton;
   import flash.Boot;
   import haxe.IMap;
   import haxe.ds.IntMap;
   
   public class GretasGarments extends BazaarAbstractContent
   {
      
      public var cockSockDb:Array;
      
      public function GretasGarments()
      {
         if(Boot.skip_constructor)
         {
            return;
         }
         cockSockDb = [new CockSockEntry("羊毛","wool",10,"你瞥见柜台上放着一只厚实的羊毛袜，便把它拿给格蕾塔看。[say: 啊，对。那是我们的基础款。温暖舒适，非常适合那些寒冷的夜晚。那只只要10颗宝石。当然，这简直是白菜价。]"),new CockSockEntry("屌环","cockring",100,"你拿起一只袜子，惊讶地发现它竟然这么重。光滑的鸡巴袜底部环绕着巨大的金属环，还有一个松散的环悬挂下来，毫无疑问是打算缠绕在你的阴囊底部的。[say: 哦，对，那是个有趣的玩意儿。那些环会不断地束缚你的命根子，所以你会一直保持勃起，随时准备大干一场。] 她咯咯地笑着挥了挥手，[say: 那其实是一只非常受欢迎的袜子……很多恶魔都会来给他们的后宫买这些。100颗宝石。]"),new CockSockEntry("纯白","alabaster",25,"你拿起一只袜子仔细端详。这是一只纯白色的鸡巴袜，边缘镶有精致的蕾丝。它看起来几乎像是某种新娘装……尽管你不知道有哪种新娘会穿这种东西。[say: 啊，对，那是个抢手货。有些人喜欢它所暗示的纯洁……虽然我猜不到为什么。不过，它要25颗宝石。]"),new CockSockEntry("翠绿","viridian",1000,"你拿起一只袜子仔细端详。整个袜子呈现出一种浓郁自然的绿色，完全由蕾丝制成，上面点缀着鲜艳的红玫瑰。仅仅是触摸它就让你感觉更健康、更有活力。[say: 啊，那可是个有趣的玩意儿。它能加速你的自然愈合。非常实用，而且如果让我自己说的话，它也很漂亮。1000颗宝石。] 你被这个价格吓得脸色发白，但格蕾塔挥了挥手，[say: 相信我，亲爱的，它物超所值。]"),new CockSockEntry("猩红","scarlet",250,"你拿起一只袜子仔细端详。这只袜子呈现出令人惊艳的深红色，由柔软的缎面制成，并点缀着红色的蕾丝。它看起来比你见过的其他袜子都要小，你忍不住想象它穿在你的鸡巴上会有多紧。[say: 嗯，那只很特别。它能增加你小鸡巴的血液循环，让它长得更快。这只卖得很快。每个人都想变成牛头人！250颗宝石。]"),new CockSockEntry("钴蓝","cobalt",250,"你拿起一只袜子仔细端详。这只袜子呈现出清凉柔软的蓝色，由缎面制成，并点缀着浅蓝色的蕾丝。与店里的其他袜子相比，它看起来非常小，你忍不住觉得穿上它肯定会非常不舒服。[say: 噢，那只很有趣。那些可爱的小伪娘们都为它疯狂。如你所见，它有点小，实际上它会抑制你的鸡巴长得太大。250颗宝石。]")
         ,new CockSockEntry("紫色","amaranthine",1000,"你拿起一只袜子仔细端详。这只袜子呈现出丝滑奢华的紫色，上面精美的蕾丝描绘着某种六条腿的狼形生物。不过，总的来说，这只袜子的形状很奇怪，似乎是为那些长着肉结和某种类似马的龟头冠状沟的人准备的。格蕾塔看到你手里拿着的物品，挑了挑眉毛，[say: 噢，那只。亲爱的，那是一个实验品。我提取了一些从星星上引导下来的魔法，注入到一只新袜子里，结果就是这样。说实话，我也不完全确定它有什么用，但我可以1000颗宝石卖给你。]"),new CockSockEntry("镀金","gilded",3000,"你拿起一只袜子仔细端详，惊讶地发现它竟然如此坚硬沉重。与店里的其他袜子不同，这只似乎是由一种冰凉的金色金属材料制成的。顶部镶嵌着闪闪发光的宝石，而底部则用皮绳系紧。[say: 你的眼光不错，]格蕾塔说道，她的眼睛里闪烁着贪婪的光芒。[say: 有了这个坏男孩，你实际上可以把你的一些……甜美的精液转化成更甜美的宝石。当然，拥有这种惊人的力量，你得明白它要花你3000颗宝石。]"),new CockSockEntry("金属绿","green",500,"你拿起一只袜子仔细端详。这只袜子呈现出深邃的金属绿色，并交织着更明亮的绿色高光。格蕾塔看到你手里拿着的物品，挑了挑眉毛，[say: 噢，那只。这是我最新系列的鸡巴袜之一。如果你对自己的耐力没有信心，这可能会有所帮助，因为它的魔法能增强你的整体生命值上限。我可以500颗宝石卖给你。]"),new CockSockEntry("金属红","red",500,"你拿起一只袜子仔细端详。它是深金属红色的，交织着更亮的红色高光。整体看起来有点吓人。格蕾塔看到你手里的东西，挑了挑眉，[say: 哦，那个啊。这是我最新推出的一系列鸡巴袜之一。这只鸡巴袜能增强你的力量，让你在肉搏中击败更强悍的对手。500颗宝石卖给你。]"),new CockSockEntry("金属蓝","blue",500,"你拿起一只袜子仔细端详。它是深金属蓝色的，交织着似乎能在黑暗中发光的更亮蓝色高光。格蕾塔看到你手里的东西，挑了挑眉，[say: 哦，那个啊。这是我最新推出的一系列鸡巴袜之一。这只鸡巴袜能增强你的法术强度。500颗宝石卖给你。]")];
         super();
      }
      
      public function yesPutDatSockOnMe(param1:int, param2:CockSockEntry) : void
      {
         clearOutput();
         var _loc3_:Boolean = false;
         var _loc4_:String = param2.id;
         if(_loc4_ == "blue")
         {
            if(!get_player().hasPerk(PerkLib.PhallicPower))
            {
               get_player().createPerk(PerkLib.PhallicPower,0,0,0,0);
            }
         }
         else if(_loc4_ == "cobalt")
         {
            if(!get_player().hasPerk(PerkLib.PhallicRestraint))
            {
               get_player().createPerk(PerkLib.PhallicRestraint,0,0,0,0);
            }
         }
         else if(_loc4_ == "cockring")
         {
            if(!get_player().hasPerk(PerkLib.PentUp))
            {
               get_player().createPerk(PerkLib.PentUp,10,0,0,0);
            }
            else
            {
               get_player().addPerkValue(PerkLib.PentUp,1,5);
            }
         }
         else if(_loc4_ == "gilded")
         {
            if(!get_player().hasPerk(PerkLib.PentUp))
            {
               get_player().createPerk(PerkLib.MidasCock,5,0,0,0);
            }
            else
            {
               get_player().addPerkValue(PerkLib.MidasCock,1,5);
            }
         }
         else if(_loc4_ == "scarlet")
         {
            if(!get_player().hasPerk(PerkLib.PhallicPotential))
            {
               get_player().createPerk(PerkLib.PhallicPotential,0,0,0,0);
            }
         }
         else if(_loc4_ == "viridian")
         {
            if(!get_player().hasPerk(PerkLib.LustyRegeneration))
            {
               get_player().createPerk(PerkLib.LustyRegeneration,0,0,0,0);
            }
            else
            {
               _loc3_ = true;
            }
         }
         var _loc5_:Player = get_player();
         _loc5_.set_gems(_loc5_.get_gems() - param2.price);
         outputText("你对这位巨乳魅魔点了点头，脱下你的[armor]，露出赤裸的身体。格蕾塔打量着你的身体，眼中闪烁着难以掩饰的欲望。最后，她的目光停留在你的" + get_player().cockDescript(param1) + "上，舔了舔嘴唇。");
         if(!_loc3_)
         {
            get_player().cocks[param1].sock = param2.id;
            statScreenRefresh();
            outputText("她用一只手托起你疲软的阴茎，愉快地轻轻抚摸着。");
            outputText("[pg]她的另一只手靠近，拇指、食指和中指撑开袜子，将其套在你的" + get_player().cockHead(param1) + "上。她把它紧紧地拉到位，然后给了你的阴茎一个小小的吻。当她的嘴唇接触到你的肉体的那一刻，一阵寒意传遍你的全身，紧接着是一股暖流。");
            outputText("[pg]格蕾塔会意地笑了笑，回到了柜台后面的椅子上。");
            dynStats(DynStat.Lust(5),DynStat.Cor(2));
            menu();
            addButton(0,"继续",gretasGarments);
         }
         else
         {
            outputText("然后她突然停了下来，盯着你的腹股沟。[pg][say:哦，亲爱的……] 她说，[say:虽然我很想赚你的钱，亲爱的，但我不能把魔法这样混合起来。]");
            menu();
            addButton(0,"继续",gretasGarments);
         }
      }
      
      public function takeOffDatSock() : void
      {
         clearOutput();
         outputText("你想取下哪只鸡巴袜？");
         menu();
         var _loc1_:int = 0;
         while(_loc1_ < get_player().cockTotal())
         {
            if(get_player().cocks[_loc1_].sock != "")
            {
               addNextButton(Std.string(_loc1_ + 1),(function(param1:Array, param2:Array):Function
               {
                  var _g:Array = param1;
                  var index:Array = param2;
                  return function():void
                  {
                     _g[0].removeTargettedSock(int(index[0]));
                  };
               })([this],[_loc1_]));
            }
            _loc1_++;
         }
         addButton(14,"取消",gretasGarments);
      }
      
      public function removeTargettedSock(param1:int) : void
      {
         clearOutput();
         outputText("你走到柜台前。魅魔格蕾塔从她最新的作品上抬起头看着你，你解释说你想取下一个阴茎套。");
         outputText("[pg][say:啊，好吧，]她平静地说着，把织针放在一边。[say:是想给新套子腾地方，还是单纯想把这个脱掉？没关系，这只是个简单的反制咒语。]格蕾塔从椅子上站起来，不过她只站了一会儿，就在你面前跪了下来，把一只手放在你的" + get_player().cockDescript(param1) + "下面。她用另一只手在你的" + get_player().cockHead(param1) + "周围画了个小圈，嘴里低声嘟囔着什么。");
         outputText("[pg]突然，你的阴茎感到一阵白热，燃烧着激情的欲望。它立刻挺立起来");
         if(get_player().cockArea(param1) >= 100)
         {
            outputText("，在这个过程中差点把格蕾塔撞倒");
         }
         outputText("，阴茎套突然感觉紧得让人无法忍受。伴随着一声轻笑，格蕾塔给了你的阴茎一个轻柔的吻，那燃烧的欲望似乎消散了，取而代之的是一种凉爽、放松的感觉，蔓延至你的全身。");
         outputText("[pg]你的肉棒迅速软了下来，随着它的缩小，套在上面的袜子自然地脱落了。巨乳魅魔捡起那只现在变得普普通通的袜子，回到了柜台后的座位上。");
         var _loc2_:String = get_player().cocks[param1].sock;
         var _loc3_:Boolean = false;
         get_player().cocks[param1].sock = "";
         var _loc4_:int = get_player().cockTotal();
         while(_loc4_ > 0)
         {
            _loc4_--;
            if(get_player().cocks[_loc4_].sock == _loc2_)
            {
               _loc3_ = true;
            }
         }
         if(_loc3_)
         {
            if(_loc2_ == "cockring")
            {
               get_player().setPerkValue(PerkLib.PentUp,1,5 + get_player().countCockSocks("cockring") * 5);
            }
            if(_loc2_ == "gilded")
            {
               get_player().setPerkValue(PerkLib.MidasCock,1,get_player().countCockSocks("gilded") * 5);
            }
         }
         else
         {
            if(_loc2_ == "gilded")
            {
               get_player().removePerk(PerkLib.MidasCock);
            }
            if(_loc2_ == "cobalt")
            {
               get_player().removePerk(PerkLib.PhallicRestraint);
            }
            if(_loc2_ == "scarlet")
            {
               get_player().removePerk(PerkLib.PhallicPotential);
            }
            if(_loc2_ == "viridian")
            {
               get_player().removePerk(PerkLib.LustyRegeneration);
            }
            if(_loc2_ == "cockring")
            {
               get_player().removePerk(PerkLib.PentUp);
            }
         }
         outputText("[pg][say:如果你还需要的话，我们这里还有很多存货。]");
         dynStats(DynStat.Lust(-10),DynStat.Cor(1));
         menu();
         addButton(0,"继续",gretasGarments);
      }
      
      public function pickACockForSock(param1:CockSockEntry) : void
      {
         var selection1:CockSockEntry;
         var target:int;
         var _g:GretasGarments;
         var _loc2_:int = 0;
         var _loc3_:int = 0;
         var _loc4_:int = 0;
         clearOutput();
         outputText("你拿着鸡巴袜走到格蕾塔坐着的柜台前，她正在编织更多的衣物，你放下所需的宝石。[say: 啊哈，好眼光，亲爱的！]魅魔说着，一把抓起钱收了起来。[say: 现在让我们把这坏家伙给你套上吧。]");
         menu();
         if(get_player().cockTotal() == 1)
         {
            _g = this;
            target = 0;
            selection1 = param1;
            addButton(0,"继续",function():void
            {
               _g.cockSockTarget(target,selection1);
            });
         }
         else
         {
            outputText("[pg]你想把它套在哪根鸡巴上？");
            _loc2_ = 0;
            _loc3_ = get_player().cockTotal();
            while(_loc2_ < _loc3_)
            {
               _loc4_ = _loc2_++;
               if(get_player().cocks[_loc4_].sock == "")
               {
                  addNextButton(Std.string(_loc4_ + 1),(function(param1:Array, param2:Array, param3:Array):Function
                  {
                     var _g:Array = param1;
                     var selection:Array = param2;
                     var target:Array = param3;
                     return function():void
                     {
                        _g[0].cockSockTarget(int(target[0]),selection[0]);
                     };
                  })([this],[param1],[_loc4_]));
               }
            }
         }
      }
      
      public function noCockSock() : void
      {
         clearOutput();
         KFLAGS.flags.remove(896);
         outputText("你摇了摇头。格蕾塔叹了口气，[say: 猜也是。钱退给你，亲爱的。改变主意了再来找我吧。]");
         menu();
         addButton(0,"继续",gretasGarments);
      }
      
      public function gretasGarments() : void
      {
         clearOutput();
         spriteSelect(SpriteDb.get_s_greta());
         var _loc1_:NobleShirt = get_undergarments().SEA_SHIRT;
         if(FlagDict_Impl_.arrayReadFloat(KFLAGS.flags,897) == 1 && FlagDict_Impl_.arrayReadInt(KFLAGS.flags,895) == 0)
         {
            outputText("当你走进商店时，惊讶地发现货架上摆满了各种各样的商品。各种材质、尺寸和形状的衣服叠放在这家小店的架子和桌子上。柜台旁立着一个孤零零的假人模特，令人惊讶的是它的解剖结构非常精确，除了木制阴茎上紧绷着的一块薄薄的蕾丝布料外，全身赤裸。");
            outputText("[pg]女恶魔格蕾塔发现你在看那件奇怪的衣服。[say: 啊哈，你回来了！]她说着，张开双臂，这个动作无意中让她那对巨大的乳房晃动起来，不过这画面倒也挺赏心悦目。[say: 如你所见，我已经全面恢复生产了。我终于处理完了那些烦人的积压订单……不过有一个害羞的顾客，或者说一个安静的闲逛者，总是用新订单让我忙得团团转。我发誓他和他的伴侣迟早会要了我的命！]");
            outputText("[pg]这位粉红皮肤的魅魔不以为然地啧了一声，然后把目光转回你身上。[say: 总之，我现在有满满一库存的美味鸡巴袜可供选购。请随便看看，如果你找到任何……合适的东西，请告诉我，]她咯咯笑着，把注意力转回了编织上。");
            unlockCodexEntry(2055);
            menu();
            addButton(0,"继续",gretasGarments);
            FlagDict_Impl_.arrayWriteFloat(KFLAGS.flags,897,2);
            return;
         }
         if(_loc1_.saveContent.gretaBoughtUnbind && get_time().days > _loc1_.saveContent.gretaBoughtUnbindDay)
         {
            registerTag("dispell",TagFun_Impl_.fromBool(_loc1_.saveContent.gretaDidDispell));
            outputText("你走进格蕾塔的服装店，一边打量着色彩缤纷的内部装饰，一边走向这位常驻裁缝。格蕾塔向你打招呼并站起身来，在她寻找你委托的作品时，她那肥大的乳房也随之晃动。");
            outputText("[pg][say:啊，在这里。]粉红色的魅魔举起那件贵族衬衫给你看，它看起来和你交给她时一模一样。[say:没问题了，不再有[if (dispel) {诅咒|束缚}][if (silly) {，但是——啊——现在只能手洗了}]。]");
            outputText("[pg]你非常感激地接过了这件衣服。");
            if(_loc1_.saveContent.gretaDidDispell)
            {
               _loc1_.saveContent.enchanted = false;
            }
            _loc1_.saveContent.bound = false;
            _loc1_.saveContent.gretaBoughtUnbind = false;
            get_inventory().takeItem(_loc1_,gretasGarments);
            return;
         }
         if(FlagDict_Impl_.arrayReadFloat(KFLAGS.flags,897) < 2)
         {
            outputText("格蕾塔的服装店内部出奇地简陋。这简直就是一辆空荡荡的马车，里面只有一条粗糙的长凳、一个保险箱、几台织布机和一些缝纫工具。然而，这并不是说店里空无一人。柜台后面斜靠着一个粉色皮肤的魅魔，正忙着织一件看起来像袜子的东西。即使她姿势慵懒，你也能看出她的乳房真的非常巨大——那简直是两座肉山，她织布时甚至能把手臂搁在上面。她浑身赤裸，除了两块薄薄的黑色方块布料绷在她紧挺的乳头上（根本起不到任何遮掩作用），以及一块湿透的三角形布料，眼看就要永远消失在她那汁液横流的缝隙里了。");
            if(FlagDict_Impl_.arrayReadFloat(KFLAGS.flags,897) == 0)
            {
               FlagDict_Impl_.arrayWriteFloat(KFLAGS.flags,897,0.5);
            }
         }
         else
         {
            outputText("格蕾塔的服装店内部出奇地色彩斑斓。虽然它一开始只是一辆装满散乱布匹和缝纫工具的空马车，但现在鲜艳的布料已经铺满了所有的架子。墙上挂着彩虹般五颜六色的窗帘，柜台附近立着一个木制人体模型，它那惊人地符合解剖学结构的鸡巴上套着一只薄薄的蕾丝鸡巴袜。柜台后面坐着一个粉色皮肤的魅魔，正忙着织一件看起来像另一只鸡巴袜的东西。即使她姿势慵懒，你也能看出她的乳房真的非常巨大——那简直是两座肉山，她织布时甚至能把手臂搁在上面。她浑身赤裸，除了两块薄薄的黑色方块布料绷在她紧挺的乳头上（根本起不到任何遮掩作用），以及一块湿透的三角形布料，眼看就要永远消失在她那汁液横流的缝隙里了。");
         }
         outputText("[pg]注意到你的目光，她坐直了一点，在某种旋转椅上转过身来，更直接地面对你。她那晃动的乳房在面前的柜台上慢慢弹跳着停了下来，她问道：[say:亲爱的，有什么能让你感兴趣的吗？]");
         unlockCodexEntry(2055);
         if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,770) == 0)
         {
            outputText("[pg]你发现了一件极其暴露的锁子甲比基尼，上面点缀着白色和金色的装饰。");
         }
         dynStats(DynStat.Lust(2),DynStat.NoScale);
         menu();
         if(FlagDict_Impl_.arrayReadFloat(KFLAGS.flags,897) < 2)
         {
            addButton(0,"库存不足",askGretaAboutInventory).disableIf(FlagDict_Impl_.arrayReadFloat(KFLAGS.flags,897) == 1,"格蕾塔还没有处理完她积压的鸡巴袜订单。");
         }
         else
         {
            addNextButton("浏览套套",browseDemSocksSon).disableIf(!get_player().hasSockRoom(),"你没有空间放另一个套套了。").disableIf(!get_player().hasCock(),"这需要你有一根肉棒。");
            addNextButton("脱下套套",takeOffDatSock).disableIf(!get_player().hasSock(),"你没有戴着套套。");
         }
         if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,770) == 0)
         {
            addRowButton(1,"比基尼",askGretaAboutZeBikini).hint("向她询问关于锁链比基尼的事。");
         }
         if(get_player().get_upperGarment() == _loc1_ && _loc1_.knownBound())
         {
            addRowButton(2,"诅咒衬衫",askGretaAboutNobleShirt).hint("格蕾塔对魔法衣物有所了解。");
         }
         else if(get_player().hasItem(_loc1_) && _loc1_.saveContent.unequipTried && !_loc1_.isNormalShirt() && !_loc1_.saveContent.gretaBoughtUnbind)
         {
            addRowButton(2,"解除衬衫附魔",askGretaToUnbind).hint("她能解除这件衣服上的诅咒吗？");
         }
         addButton(14,"离开",get_bazaar().leaveShop);
      }
      
      public function dontPayGretaUnbind() : void
      {
         outputText("[pg]你才不会付那笔钱，但至少你知道如果你改变主意，她会接这个活。");
         doNext(gretasGarments);
      }
      
      public function dontPayGreta() : void
      {
         outputText("[pg]你决定碰碰运气。");
         doNext(gretasGarments);
      }
      
      public function doPayGretaUnbind(param1:Boolean) : void
      {
         var _loc2_:* = null as Player;
         outputText("[pg]你深吸一口气，然后呼出，觉得这笔交易还算划算。在钱袋里摸索了一会儿后，你交了钱，格蕾塔对你灿烂地笑了笑。[say:我明天就能弄好，]她保证道。你稍微皱了下眉头，但还是接受了这个等待时间。");
         if(param1)
         {
            get_undergarments().SEA_SHIRT.saveContent.gretaDidDispell = true;
            _loc2_ = get_player();
            _loc2_.set_gems(_loc2_.get_gems() - 300);
         }
         else
         {
            get_undergarments().SEA_SHIRT.saveContent.gretaDidDispell = false;
            _loc2_ = get_player();
            _loc2_.set_gems(_loc2_.get_gems() - 200);
         }
         get_undergarments().SEA_SHIRT.saveContent.gretaBoughtUnbind = true;
         get_undergarments().SEA_SHIRT.saveContent.gretaBoughtUnbindDay = get_time().days;
         get_player().destroyItems(get_undergarments().SEA_SHIRT,1);
         doNext(gretasGarments);
      }
      
      public function doPayGreta() : void
      {
         clearOutput();
         outputText("[pg]她是个生意人；你对这种安排并不感到太惊讶。你妥协了，交出了费用，格蕾塔开始[if (hasarmor) {毫无预兆地扒光你的衣服，然后}]在你的衬衫上潦草地画着各种神秘符号。她那巨大、起伏的双乳不断地撞击着你，推搡着你，但无论你怎么动，她的笔迹看起来依然清晰利落。格蕾塔吟唱着什么，闪烁着能量的光芒，你感到一阵恶心。");
         outputText("[pg]她停了下来，四周陷入了沉寂。");
         outputText("[pg][say:Rettahs！]她大喊一声，将手掌猛地拍在你的胸口！一股如同火山喷发般的热浪袭来，你那曾经精美的衬衫从你身上炸裂开来！这让你有些不知所措。");
         outputText("[pg][say:好了，亲爱的，诅咒解除了，]格蕾塔擦了擦额头，向你保证道。你不是附魔专家，但这次体验显然不够优雅。不过，它确实起作用了，你的钱花得值。[if (hasarmor) {重新穿好衣服后，你|你}]向这位裁缝道别。");
         get_player().setUndergarment(UndergarmentLib.NOTHING,0);
         var _loc1_:Player = get_player();
         _loc1_.set_gems(_loc1_.get_gems() - 200);
         doNext(gretasGarments);
      }
      
      public function cockSockTarget(param1:int, param2:CockSockEntry) : void
      {
         var selection1:CockSockEntry;
         var target1:int;
         var _g:GretasGarments;
         clearOutput();
         var _loc3_:IMap = KFLAGS.flags;
         FlagDict_Impl_.arrayWriteInt(_loc3_,898,FlagDict_Impl_.arrayReadInt(_loc3_,898) + 1);
         if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,898) == 1)
         {
            outputText("这位有着反重力身材的魅魔指了指你的胯部。[say: 好了，快点吧，让我看看这根美味的鸡巴穿上衣服的样子，]她说道，声音变成了低沉的呼噜声。你挑了挑眉，不明白她为什么要看这个。");
            outputText("[pg][say: 哦，你不知道吗？这些可不是普通的衣服，]她轻声笑道。[say: 这些是非常特别的鸡巴袜。它们不会滑落或移位。无论发生什么，它们都会乖乖待在原位，直到你想让我把它取下来。]");
            outputText("[pg]你有些犹豫。这些东西要永久地附着在你身上吗？");
            outputText("[pg]看到你的反应，格蕾塔平静地解释道：[say: 别担心，这只是一个简单的小法术。你仍然可以使用你的老二，射精，以及做所有那些美味有趣的事情。这个法术只是为了防止它滑落，无论你是疲软还是勃起，它还能保持材料的清洁和完好。在我学会这个法术之前，你绝对<b>无法想象</b>我得洗多少只袜子，还得把它们缝补好。我根本没时间做新的！]");
            outputText("[pg]你咽了口唾沫。你真的想让这只鸡巴袜半永久地附着在你的阴茎上吗？");
         }
         else
         {
            outputText("格蕾塔招了招手，这个动作让她那傲人的双峰诱人地晃动起来。[say: 好吧，那就来吧，让我看看这根美味的鸡巴穿上衣服的样子，]她说道，声音变得低沉而充满诱惑。");
            outputText("[pg]那么？你确定要让这只鸡巴袜半永久地套在你的阴茎上吗？");
         }
         menu();
         _g = this;
         target1 = param1;
         selection1 = param2;
         addButton(0,"确定",function():void
         {
            _g.yesPutDatSockOnMe(target1,selection1);
         });
         addButton(1,"取消",noCockSock);
      }
      
      public function cockSelectionMenu(param1:CockSockEntry) : void
      {
         var selection1:CockSockEntry;
         var _g:GretasGarments;
         clearOutput();
         outputText(param1.description);
         menu();
         if(get_player().get_gems() >= param1.price)
         {
            _g = this;
            selection1 = param1;
            addButton(0,"购买",function():void
            {
               _g.pickACockForSock(selection1);
            });
         }
         else
         {
            outputText("[pg]<b>你买不起这个。</b>");
         }
         addButton(14,"返回",browseDemSocksSon);
      }
      
      public function buyGretasBikini() : void
      {
         clearOutput();
         FlagDict_Impl_.arrayWriteInt(KFLAGS.flags,770,1);
         var _loc1_:Player = get_player();
         _loc1_.set_gems(_loc1_.get_gems() - 500);
         statScreenRefresh();
         outputText("格蕾塔惊讶地睁大了眼睛。[say: 真的吗？]");
         outputText("[pg]你点点头，拿出宝石，数出准确的金额递给她。你刚数完，格蕾塔就把你拉过柜台，吻上了你的嘴唇，她的舌头性感地袭击了你惊讶的口腔。还没等你反应过来，她就带着愉悦的哼声退了回去。");
         outputText("[pg][say: 谢谢你，亲爱的！玩得开心，注意安全，如果你不想安全，有空来看看我！]");
         outputText("[pg]你得把这事记在心里……");
         get_inventory().takeItem(get_armors().LMARMOR,gretasGarments);
      }
      
      public function browseDemSocksSon() : void
      {
         var _loc3_:int = 0;
         var _loc4_:* = null as CockSockEntry;
         clearOutput();
         outputText("你想看哪种鸡巴袜？");
         menu();
         var _loc1_:int = 0;
         var _loc2_:int = int(cockSockDb.length);
         while(_loc1_ < _loc2_)
         {
            _loc3_ = _loc1_++;
            _loc4_ = cockSockDb[_loc3_];
            addButton(_loc3_,_loc4_.buttonText,(function(param1:Array, param2:Array):Function
            {
               var _g:Array = param1;
               var selection:Array = param2;
               return function():void
               {
                  _g[0].cockSelectionMenu(selection[0]);
               };
            })([this],[_loc4_]));
         }
         addButton(14,"返回",gretasGarments);
      }
      
      public function askGretaToUnbind() : void
      {
         var dispell:Boolean;
         var _g:GretasGarments;
         clearOutput();
         outputText("知道这位裁缝标榜自己擅长处理附魔衣物，你提起了你在湖边找到的那件看起来很花哨的衬衫。它肯定被诅咒了，就像上一件一样，你希望她能解除诅咒——并且不要损坏衣物，你补充道。");
         outputText("[pg]格蕾塔从你手中接过那件衣服，抚摸了一会儿。[say:没问题，亲爱的，确保它不会再绑定到任何人身上花不了多少时间。200颗宝石，我帮你搞定。]");
         menu();
         _g = this;
         dispell = false;
         addButton(0,"支付",function():void
         {
            _g.doPayGretaUnbind(dispell);
         }).disableIf(!get_undergarments().SEA_SHIRT.saveContent.bound).disableIf(get_player().get_gems() < 200,"你买不起。");
         addButton(1,"拒绝",dontPayGretaUnbind);
         addButton(2,"驱散",askGretaToDispellToo).hint("等等，你不只是想解除绑定，你想移除所有的魔法。").disableIf(!get_undergarments().SEA_SHIRT.saveContent.enchanted,"它已经被驱散了。");
      }
      
      public function askGretaToDispellToo() : void
      {
         var dispell:Boolean;
         var _g:GretasGarments;
         outputText("[pg]你停下来澄清——你不是要求它不粘在你的皮肤上，你是想要移除整个魔法效果。你的身体需要保持完好无损。对此，她翻了个白眼。");
         outputText("[pg][say:好吧，亲爱的，但这更费事。特别是还要保持这件衬衫完好无损。300宝石。]");
         menu();
         _g = this;
         dispell = true;
         addButton(0,"支付",function():void
         {
            _g.doPayGretaUnbind(dispell);
         }).disableIf(get_player().get_gems() < 300,"你付不起。");
         addButton(1,"拒绝",dontPayGretaUnbind);
      }
      
      public function askGretaAboutZeBikini() : void
      {
         clearOutput();
         outputText("[say: 哦，那个？] 格蕾塔问道。[say: 那是我以前的一个项目。以前有个自称纯洁少女的荡妇穿着它，直到我让她背弃誓言，长出鸡巴，操我操到她对我的小穴和奶水的味道上瘾为止。据我所知，她来自一个地方，那里穿着类似服装的战士们为了成为某个愚蠢国家的女王而战斗。不管怎样，那件装备上有一些强大的魔法，我们这种人碰了会很痛苦。我一直想在业余时间把它腐化成更有趣的东西，但进展并不顺利。]");
         outputText("[pg]魅魔放下一只缝了一半的袜子，抱怨道：[say: 你知道一边解开结界一边注入腐化有多难吗？]");
         outputText("[pg]你耸了耸肩。");
         outputText("[pg]格蕾塔吹开挡在脸前的一缕墨黑头发，若有所思地说：[say: 我猜你不知道，对吧？好吧，我已经完成了一半——如果你体内有很多腐化，它就不会烧伤你，但我现在还不能轻易地处理它。根据我的宠物告诉我的，处女穿上它实际上会更强，但由于我的干预，它可能会，嗯……引发一些更原始的冲动。我想如果你想要的话，500宝石就可以拿走。毕竟这破地方的租金快到期了。]");
         menu();
         addButton(0,"购买比基尼",buyGretasBikini).hint(get_armors().LMARMOR.get_tooltipText(),get_armors().LMARMOR.get_tooltipHeader()).disableIf(get_player().get_gems() < 500,"你没有足够的宝石。");
         addButton(1,"不了，谢谢",gretasGarments).hint("你对购买这个不感兴趣。");
      }
      
      public function askGretaAboutNobleShirt() : void
      {
         clearOutput();
         outputText("你转向这位裁缝，正准备解释——[say:哎呀，你身上的附魔真可爱！]魅魔惊呼道。");
         outputText("[pg]虽然打断别人可能有些失礼，但你满心希望她一定知道些打破诅咒的方法。然而，格蕾塔对此嗤之以鼻。[say:享受一下生活吧，亲爱的。]你抗议着，但她只是静静地对你微笑，不为所动。当你在交谈中提出愿意付钱时，这位裁缝立刻变得和蔼可亲起来。格蕾塔抓住你身后垂下的宽松布料，仔细端详着。");
         if(get_undergarments().SEA_SHIRT.saveContent.armorStage > 2)
         {
            outputText("[pg][say:等一下，别动，]她说着，双手闪烁起光芒。轻声的咒语持续了一会儿，很快她就皱起了眉头。[say:我其实完全不知道该怎么解决这个。]");
            doNext(gretasGarments);
         }
         else
         {
            outputText("[pg][say:你看起来[if (isfeminine) {很漂亮|很帅气}]，破坏它太可惜了，但我可以帮你解除这个附魔，只要200宝石。]");
            menu();
            addButton(0,"支付",doPayGreta).disableIf(get_player().get_gems() < 200,"你付不起。");
            addButton(1,"否",dontPayGreta);
         }
      }
      
      public function askGretaAboutInventory() : void
      {
         clearOutput();
         outputText("你对这里商品种类的匮乏感到好奇，于是向这个风骚的店主提起这个话题，询问她要卖的商品都在哪里。");
         outputText("[pg]这个女恶魔，肯定就是格蕾塔了，她笑着说：[say: 噢，你问这个真是贴心，但我才刚在这里安顿下来。你不知道要忍住不去驯服外面那些晃来晃去的可爱小肉棒有多难，但用自己的汗水、努力和魅力赚取利润，也是别有一番滋味的。]她把双手压在胸部两侧，将她那惊人的乳沟挤成了一道令人愉悦的肉欲峡谷。");
         outputText("[pg][say: 看到喜欢的东西了？]格蕾塔问道，将你迷离的目光拉回到她的脸上。[say: 嘛，这可不在今天的菜单上，不过要我说的话，你看起来确实像一块美味的小点心。如果我要满足大家对我产品的所有需求，我还有很多工作要做呢！]");
         outputText("[pg]你环顾店里，询问她说的产品到底是指什么。格蕾塔举起她正在织的袜子说：[say: 这些！我做的速度都赶不上卖的！每次我刚做完一只，就会有可爱的双性人或者宽臀的伪娘跑进来把它买走。]");
         outputText("[pg]你满脸困惑地问道：[say: 袜子？] 扶他和伪娘要这些奇怪的袜子干什么？这家店看起来应该是专卖性感服饰的，而不是日常装扮！");
         outputText("[pg]格蕾塔笑得花枝乱颤，连胸部都在跟着晃动，把她的织针都弄散了。她的尾巴灵巧地接住了一根滚落到粗糙柜台边缘的针，转了几圈后把它插进了头顶紧紧盘起的发髻里。[say: 你以为这是一只袜子！？啊哈哈哈哈！不，亲爱的[boy]，这不是普通的袜子。这是一只鸡巴袜。看到这里的图案了吗？还有这些特意缝制的缝隙？它们能让穿戴者凸显出勃起时每一道迷人的曲线和跳动的静脉，同时还能把最敏感的部位暴露出来，方便像我这样忙碌的双手和饥渴的舌头去品尝。] 她让舌头慢慢从嘴里伸出，一寸又一寸扭动着、滑溜溜的器官慢慢消失在她双乳之间的沟壑里。她咯咯笑着，慢慢把它缩了回去。");
         outputText("[pg][say: 这些东西的订单都排到几英里外了，所以你得等我赶完工，我才会考虑给你做。]");
         if(FlagDict_Impl_.arrayReadFloat(KFLAGS.flags,897) < 1)
         {
            FlagDict_Impl_.arrayWriteFloat(KFLAGS.flags,897,1);
         }
         if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,895) == 0)
         {
            FlagDict_Impl_.arrayWriteInt(KFLAGS.flags,895,24);
         }
         doNext(gretasGarments);
      }
   }
}

