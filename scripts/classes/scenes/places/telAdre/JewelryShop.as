package classes.scenes.places.telAdre
{
   import classes.CoC;
   import classes.ItemType;
   import classes.Player;
   import classes.items.JewelryLib;
   import classes.scenes.places.TelAdre;
   import coc.view.CoCButton;
   import flash.Boot;
   
   public class JewelryShop extends Shop
   {
      
      public var firstEntry:Boolean;
      
      public function JewelryShop()
      {
         if(Boot.skip_constructor)
         {
            return;
         }
         firstEntry = true;
         super();
      }
      
      public function tieredRings(param1:int) : void
      {
         var itype23:ItemType;
         var _g23:JewelryShop;
         var itype22:ItemType;
         var _g22:JewelryShop;
         var itype21:ItemType;
         var _g21:JewelryShop;
         var itype20:ItemType;
         var _g20:JewelryShop;
         var itype19:ItemType;
         var _g19:JewelryShop;
         var itype18:ItemType;
         var _g18:JewelryShop;
         var itype17:ItemType;
         var _g17:JewelryShop;
         var itype16:ItemType;
         var _g16:JewelryShop;
         var itype15:ItemType;
         var _g15:JewelryShop;
         var itype14:ItemType;
         var _g14:JewelryShop;
         var itype13:ItemType;
         var _g13:JewelryShop;
         var itype12:ItemType;
         var _g12:JewelryShop;
         var itype11:ItemType;
         var _g11:JewelryShop;
         var itype10:ItemType;
         var _g10:JewelryShop;
         var itype9:ItemType;
         var _g9:JewelryShop;
         var itype8:ItemType;
         var _g8:JewelryShop;
         var itype7:ItemType;
         var _g7:JewelryShop;
         var itype6:ItemType;
         var _g6:JewelryShop;
         var itype5:ItemType;
         var _g5:JewelryShop;
         var itype4:ItemType;
         var _g4:JewelryShop;
         var itype3:ItemType;
         var _g3:JewelryShop;
         var itype2:ItemType;
         var _g2:JewelryShop;
         var itype1:ItemType;
         var _g1:JewelryShop;
         var itype:ItemType;
         var _g:JewelryShop;
         var _loc2_:* = null as String;
         var _loc3_:* = null as String;
         var _loc4_:* = null as String;
         var _loc5_:* = null as String;
         var _loc6_:* = null as String;
         var _loc7_:* = null as String;
         var _loc8_:* = null as String;
         var _loc9_:* = null as String;
         menu();
         switch(param1)
         {
            case 1:
               _loc2_ = get_jewelries().CRIMRN1.get_shortName();
               _g = this;
               itype = get_jewelries().CRIMRN1;
               addNextButton(_loc2_,function():void
               {
                  _g.confirmBuy(itype);
               }).hint(get_jewelries().CRIMRN1.get_tooltipText(),get_jewelries().CRIMRN1.get_tooltipHeader());
               _loc3_ = get_jewelries().FERTRN1.get_shortName();
               _g1 = this;
               itype1 = get_jewelries().FERTRN1;
               addNextButton(_loc3_,function():void
               {
                  _g1.confirmBuy(itype1);
               }).hint(get_jewelries().FERTRN1.get_tooltipText(),get_jewelries().FERTRN1.get_tooltipHeader());
               _loc4_ = get_jewelries().ICE_RN1.get_shortName();
               _g2 = this;
               itype2 = get_jewelries().ICE_RN1;
               addNextButton(_loc4_,function():void
               {
                  _g2.confirmBuy(itype2);
               }).hint(get_jewelries().ICE_RN1.get_tooltipText(),get_jewelries().ICE_RN1.get_tooltipHeader());
               _loc5_ = get_jewelries().CRITRN1.get_shortName();
               _g3 = this;
               itype3 = get_jewelries().CRITRN1;
               addNextButton(_loc5_,function():void
               {
                  _g3.confirmBuy(itype3);
               }).hint(get_jewelries().CRITRN1.get_tooltipText(),get_jewelries().CRITRN1.get_tooltipHeader());
               _loc6_ = get_jewelries().REGNRN1.get_shortName();
               _g4 = this;
               itype4 = get_jewelries().REGNRN1;
               addNextButton(_loc6_,function():void
               {
                  _g4.confirmBuy(itype4);
               }).hint(get_jewelries().REGNRN1.get_tooltipText(),get_jewelries().REGNRN1.get_tooltipHeader());
               _loc7_ = get_jewelries().LIFERN1.get_shortName();
               _g5 = this;
               itype5 = get_jewelries().LIFERN1;
               addNextButton(_loc7_,function():void
               {
                  _g5.confirmBuy(itype5);
               }).hint(get_jewelries().LIFERN1.get_tooltipText(),get_jewelries().LIFERN1.get_tooltipHeader());
               _loc8_ = get_jewelries().MYSTRN1.get_shortName();
               _g6 = this;
               itype6 = get_jewelries().MYSTRN1;
               addNextButton(_loc8_,function():void
               {
                  _g6.confirmBuy(itype6);
               }).hint(get_jewelries().MYSTRN1.get_tooltipText(),get_jewelries().MYSTRN1.get_tooltipHeader());
               _loc9_ = get_jewelries().POWRRN1.get_shortName();
               _g7 = this;
               itype7 = get_jewelries().POWRRN1;
               addNextButton(_loc9_,function():void
               {
                  _g7.confirmBuy(itype7);
               }).hint(get_jewelries().POWRRN1.get_tooltipText(),get_jewelries().POWRRN1.get_tooltipHeader());
               break;
            case 2:
               _loc2_ = get_jewelries().CRIMRN2.get_shortName();
               _g8 = this;
               itype8 = get_jewelries().CRIMRN2;
               addNextButton(_loc2_,function():void
               {
                  _g8.confirmBuy(itype8);
               }).hint(get_jewelries().CRIMRN2.get_tooltipText(),get_jewelries().CRIMRN2.get_tooltipHeader());
               _loc3_ = get_jewelries().FERTRN2.get_shortName();
               _g9 = this;
               itype9 = get_jewelries().FERTRN2;
               addNextButton(_loc3_,function():void
               {
                  _g9.confirmBuy(itype9);
               }).hint(get_jewelries().FERTRN2.get_tooltipText(),get_jewelries().FERTRN2.get_tooltipHeader());
               _loc4_ = get_jewelries().ICE_RN2.get_shortName();
               _g10 = this;
               itype10 = get_jewelries().ICE_RN2;
               addNextButton(_loc4_,function():void
               {
                  _g10.confirmBuy(itype10);
               }).hint(get_jewelries().ICE_RN2.get_tooltipText(),get_jewelries().ICE_RN2.get_tooltipHeader());
               _loc5_ = get_jewelries().CRITRN2.get_shortName();
               _g11 = this;
               itype11 = get_jewelries().CRITRN2;
               addNextButton(_loc5_,function():void
               {
                  _g11.confirmBuy(itype11);
               }).hint(get_jewelries().CRITRN2.get_tooltipText(),get_jewelries().CRITRN2.get_tooltipHeader());
               _loc6_ = get_jewelries().REGNRN2.get_shortName();
               _g12 = this;
               itype12 = get_jewelries().REGNRN2;
               addNextButton(_loc6_,function():void
               {
                  _g12.confirmBuy(itype12);
               }).hint(get_jewelries().REGNRN2.get_tooltipText(),get_jewelries().REGNRN2.get_tooltipHeader());
               _loc7_ = get_jewelries().LIFERN2.get_shortName();
               _g13 = this;
               itype13 = get_jewelries().LIFERN2;
               addNextButton(_loc7_,function():void
               {
                  _g13.confirmBuy(itype13);
               }).hint(get_jewelries().LIFERN2.get_tooltipText(),get_jewelries().LIFERN2.get_tooltipHeader());
               _loc8_ = get_jewelries().MYSTRN2.get_shortName();
               _g14 = this;
               itype14 = get_jewelries().MYSTRN2;
               addNextButton(_loc8_,function():void
               {
                  _g14.confirmBuy(itype14);
               }).hint(get_jewelries().MYSTRN2.get_tooltipText(),get_jewelries().MYSTRN2.get_tooltipHeader());
               _loc9_ = get_jewelries().POWRRN2.get_shortName();
               _g15 = this;
               itype15 = get_jewelries().POWRRN2;
               addNextButton(_loc9_,function():void
               {
                  _g15.confirmBuy(itype15);
               }).hint(get_jewelries().POWRRN2.get_tooltipText(),get_jewelries().POWRRN2.get_tooltipHeader());
               break;
            case 3:
               _loc2_ = get_jewelries().CRIMRN3.get_shortName();
               _g16 = this;
               itype16 = get_jewelries().CRIMRN3;
               addNextButton(_loc2_,function():void
               {
                  _g16.confirmBuy(itype16);
               }).hint(get_jewelries().CRIMRN3.get_tooltipText(),get_jewelries().CRIMRN3.get_tooltipHeader());
               _loc3_ = get_jewelries().FERTRN3.get_shortName();
               _g17 = this;
               itype17 = get_jewelries().FERTRN3;
               addNextButton(_loc3_,function():void
               {
                  _g17.confirmBuy(itype17);
               }).hint(get_jewelries().FERTRN3.get_tooltipText(),get_jewelries().FERTRN3.get_tooltipHeader());
               _loc4_ = get_jewelries().ICE_RN3.get_shortName();
               _g18 = this;
               itype18 = get_jewelries().ICE_RN3;
               addNextButton(_loc4_,function():void
               {
                  _g18.confirmBuy(itype18);
               }).hint(get_jewelries().ICE_RN3.get_tooltipText(),get_jewelries().ICE_RN3.get_tooltipHeader());
               _loc5_ = get_jewelries().CRITRN3.get_shortName();
               _g19 = this;
               itype19 = get_jewelries().CRITRN3;
               addNextButton(_loc5_,function():void
               {
                  _g19.confirmBuy(itype19);
               }).hint(get_jewelries().CRITRN3.get_tooltipText(),get_jewelries().CRITRN3.get_tooltipHeader());
               _loc6_ = get_jewelries().REGNRN3.get_shortName();
               _g20 = this;
               itype20 = get_jewelries().REGNRN3;
               addNextButton(_loc6_,function():void
               {
                  _g20.confirmBuy(itype20);
               }).hint(get_jewelries().REGNRN3.get_tooltipText(),get_jewelries().REGNRN3.get_tooltipHeader());
               _loc7_ = get_jewelries().LIFERN3.get_shortName();
               _g21 = this;
               itype21 = get_jewelries().LIFERN3;
               addNextButton(_loc7_,function():void
               {
                  _g21.confirmBuy(itype21);
               }).hint(get_jewelries().LIFERN3.get_tooltipText(),get_jewelries().LIFERN3.get_tooltipHeader());
               _loc8_ = get_jewelries().MYSTRN3.get_shortName();
               _g22 = this;
               itype22 = get_jewelries().MYSTRN3;
               addNextButton(_loc8_,function():void
               {
                  _g22.confirmBuy(itype22);
               }).hint(get_jewelries().MYSTRN3.get_tooltipText(),get_jewelries().MYSTRN3.get_tooltipHeader());
               _loc9_ = get_jewelries().POWRRN3.get_shortName();
               _g23 = this;
               itype23 = get_jewelries().POWRRN3;
               addNextButton(_loc9_,function():void
               {
                  _g23.confirmBuy(itype23);
               }).hint(get_jewelries().POWRRN3.get_tooltipText(),get_jewelries().POWRRN3.get_tooltipHeader());
         }
         addButton(14,"返回",enchantedRings);
      }
      
      public function specialRings() : void
      {
         var itype1:ItemType;
         var _g1:JewelryShop;
         var itype:ItemType;
         var _g:JewelryShop;
         clearOutput();
         outputText("在最里面的墙上，有一个隐藏在格格不入的玻璃柜后面的戒指架。透明的表面上贴满了画着奇怪奥术符号的纸莎草纸标签，几乎遮住了里面的收藏品。");
         outputText("[pg]商人注意到你的凝视，咯咯地笑了起来，指着展示柜。[say:啊哈！像刀刃一样锐利的眼睛！你挑中了我店里最引人入胜的展品！并不是说我其他的商品不吸引人。不过，这对小东西有着不同的故事。]他敲了敲其中一枚戒指旁边的玻璃，那是一块熟悉的黑色石头，上面布满了红色的裂纹。[say:它们是一套的，是一场悲剧的遗物，你明白吗。传说这些戒指曾经是美丽的少女！这一个，嫉妒它的另一半，一个准新娘。在仪式开始前，这个好色又嫉妒的少女袭击了新郎，夺走了他的贞洁。而那个准新娘，对纯洁有着近乎痴狂的执念，为了一个诅咒牺牲了自己，把他们俩的灵魂都变成了石头。所以，这一个就是那个新娘。]他的手移动了几英寸，再次敲了敲玻璃，旁边是一块对比鲜明、光滑如珍珠般洁白的石头。[say:嘿嘿嘿……我可不会廉价出售灵魂，你呢？我们从3000开始吧。]");
         menu();
         var _loc1_:String = get_jewelries().LTHCRNG.get_shortName();
         _g = this;
         itype = get_jewelries().LTHCRNG;
         addNextButton(_loc1_,function():void
         {
            _g.confirmBuy(itype);
         }).hint(get_jewelries().LTHCRNG.get_tooltipText(),get_jewelries().LTHCRNG.get_tooltipHeader());
         var _loc2_:String = get_jewelries().PURERNG.get_shortName();
         _g1 = this;
         itype1 = get_jewelries().PURERNG;
         addNextButton(_loc2_,function():void
         {
            _g1.confirmBuy(itype1);
         }).hint(get_jewelries().PURERNG.get_tooltipText(),get_jewelries().PURERNG.get_tooltipHeader());
         addButton(14,"返回",inside);
      }
      
      public function normalRings() : void
      {
         var itype3:ItemType;
         var _g3:JewelryShop;
         var itype2:ItemType;
         var _g2:JewelryShop;
         var itype1:ItemType;
         var _g1:JewelryShop;
         var itype:ItemType;
         var _g:JewelryShop;
         clearOutput();
         outputText("摊位左侧的小钉子上挂着一系列标准的珠宝，镶嵌着各种颜色的宝石。当你浏览时，商人不耐烦地敲击着手指，兴奋地自言自语。");
         menu();
         var _loc1_:String = get_jewelries().SILVRNG.get_shortName();
         _g = this;
         itype = get_jewelries().SILVRNG;
         addNextButton(_loc1_,function():void
         {
            _g.confirmBuy(itype);
         }).hint(get_jewelries().SILVRNG.get_tooltipText(),get_jewelries().SILVRNG.get_tooltipHeader());
         var _loc2_:String = get_jewelries().GOLDRNG.get_shortName();
         _g1 = this;
         itype1 = get_jewelries().GOLDRNG;
         addNextButton(_loc2_,function():void
         {
            _g1.confirmBuy(itype1);
         }).hint(get_jewelries().GOLDRNG.get_tooltipText(),get_jewelries().GOLDRNG.get_tooltipHeader());
         var _loc3_:String = get_jewelries().PLATRNG.get_shortName();
         _g2 = this;
         itype2 = get_jewelries().PLATRNG;
         addNextButton(_loc3_,function():void
         {
            _g2.confirmBuy(itype2);
         }).hint(get_jewelries().PLATRNG.get_tooltipText(),get_jewelries().PLATRNG.get_tooltipHeader());
         var _loc4_:String = get_jewelries().DIAMRNG.get_shortName();
         _g3 = this;
         itype3 = get_jewelries().DIAMRNG;
         addNextButton(_loc4_,function():void
         {
            _g3.confirmBuy(itype3);
         }).hint(get_jewelries().DIAMRNG.get_tooltipText(),get_jewelries().DIAMRNG.get_tooltipHeader());
         addButton(14,"返回",inside);
      }
      
      override public function noBuyOption(param1:ItemType = undefined, param2:String = undefined) : void
      {
         if(param2 == null)
         {
            param2 = "";
         }
         clearOutput();
         if(isJewelryBox(param2))
         {
            outputText("你坚定地摇了摇头，拒绝了他，这让商人低声咆哮起来。[say:呸，好吧！那你最好有个好藏身之处。]他用细长的手臂撑在柜台外，看了一眼你的[butt]。他起初面无表情，但随后便轻笑起来。");
         }
         else
         {
            outputText("你拒绝了这个提议，商人嘲弄地哼了一声，双臂交叉。[say:嗯，真令人失望。嘿嘿嘿，随你的便！]");
         }
         doNext(inside);
      }
      
      public function isJewelryBox(param1:String) : Boolean
      {
         return param1 == "Equipment Storage - Jewelry Box";
      }
      
      override public function inside() : void
      {
         var keyItem:String;
         var priceOverride:int;
         var itype:ItemType;
         var _g:JewelryShop;
         clearOutput();
         outputText("[say:那么，你想要什么？]");
         menu();
         addButton(0,"普通戒指",normalRings);
         addButton(1,"特殊戒指",specialRings);
         addButton(2,"附魔戒指",enchantedRings);
         _g = this;
         itype = null;
         priceOverride = 500;
         keyItem = "Equipment Storage - Jewelry Box";
         addButton(5,"珠宝盒",function():void
         {
            _g.confirmBuy(itype,priceOverride,keyItem);
         }).disableIf(get_player().hasKeyItem("Equipment Storage - Jewelry Box"),"你已经拥有了一个珠宝盒。");
         addButton(14,"离开",get_telAdre().armorShops);
      }
      
      override public function enter() : void
      {
         spriteSelect(sprite);
         clearOutput();
         if(firstEntry)
         {
            outputText("在特尔阿德雷的众多市场中，有一处奇特的地方成功吸引了你的注意。那是一个简陋的摊位，挂着一块歪歪扭扭的招牌，上面用极其潦草的草书写着“珠宝！”。摊位上的商品大多被一个满是破洞的遮阳篷遮挡着，不过沙漠的阳光透过这些破洞，顽皮地照耀在一堆失去光泽的珍宝上。镶有金属的玻璃器皿、项链、戒指、小饰品、搭扣等等，杂乱无章地挂在格子墙上。");
            outputText("[pg]在闪闪发光的玻璃器皿那不均匀的光芒中，坐着一个矮小的身影，身高不超过4英尺。他的外貌被一件完全遮蔽身体的披肩的兜帽和包裹物所掩盖，不透明的布料上印着远方沙丘的图案，边缘装饰着闪烁着金线的流苏。");
            outputText("[pg]你的凝视被一个路人挡住了视线，还没等你考虑这个打扰，你就发现看摊的人不见了。眨眼间，你的手腕就被一双布满破旧肮脏纱布的细长手指抓住了，透过裂缝和破洞，隐约能看到祖母绿色的鳞片。尽管你最初想站稳脚跟，但对于这样一个矮小的男人来说，这个披着斗篷的身影双手的握力却出人意料地大。[say:啊！别害羞！别害羞……我能看出你的兴趣，一个对美有敏锐眼光的[manboy]！]他一边用令人放松的语气胡扯，一边把你拖到摊位前，他短促而用力的动作让他那令人印象深刻的手镯发出嘈杂的碰撞声。把你从街上拉过来后，他跳上了那个摇摇欲坠的柜台，奇迹般的是，柜台竟然没有散架。[pg]他指了指摊位里挂着的众多装饰品。[say:美丽的小饰品和闪闪发光的宝石，只有最精美的珠宝才配得上尊贵的顾客！嘿嘿！]商人一边咯咯笑着，一边摩擦着他那戴着纱布手套的双手，发出一种相当令人不适的沙沙声。");
            firstEntry = false;
         }
         else
         {
            outputText("珠宝商看到你走近，微微抬起头，挥手欢迎你的到来。[say:嘿嘿嘿！又见面了，旅行者。凑够了宝石来用我的商品装饰自己吗？希望如此……]他沉默下来，十指交叉，观察着你的浏览。");
         }
         outputText("[pg]");
         doNext(inside);
      }
      
      public function enchantedRings() : void
      {
         var tier2:int;
         var _g2:JewelryShop;
         var tier1:int;
         var _g1:JewelryShop;
         var tier:int;
         var _g:JewelryShop;
         clearOutput();
         outputText("坦白说，这不过是一堆失去光泽的银饰和粗糙的金饰。你甚至能在尸体上找到更好的首饰。小贩察觉到了你的心思，将一条悬挂的项链从他包裹着的" + (get_noFur() ? "脸" : "鼻子") + "前挥开。[say: 呸！当然，当然……展示柜里的存货怎么可能配得上您！] 他把手伸到柜台下面，停顿了一下，像是在准备一场戏剧性的演讲。[say: 您是一位充满神秘与力量的旅行者，我能从您身上闻到那种气息。魔法肯定与您的灵魂产生了共鸣！] 他将一个小木盒放在了台面上。[pg]这个盒子看起来确实比你之前看到的那些首饰要好得多。木材被染成了鲜艳的颜色，表面涂着像玻璃一样光滑的漆。金色的铰链边缘镶嵌着银边，闪闪发光，前面的配套锁扣形成了三个相同的日晷。这位古怪的商人用一根包裹着的手指拨动了表盘，伴随着一声轻微的“咔哒”声，盒子自己打开了。里面所有的小抽屉像立体书一样展开，露出了一小批戒指。单是它们的工艺和优雅就足以让人惊叹，但它们身上还有一些难以言喻的吸引力。[pg]看到你的表情，这个蒙面男人喘着粗气，用手滑过这些特色商品。[say: 强者会被这些石头赋予活力，但不要鲁莽！这些珠宝会以您意想不到的方式与佩戴者相辅相成！咳嘿嘿嘿……] 他的笑声渐渐变成了一阵咳嗽，他那爬行动物般的眼睛也随之暴露了一瞬间。");
         outputText("[pg]您在寻找哪个级别的戒指？");
         menu();
         _g = this;
         tier = 1;
         addButton(0,"一阶戒指",function():void
         {
            _g.tieredRings(tier);
         });
         if(get_player().level >= 10 || get_game().time.days >= 100)
         {
            _g1 = this;
            tier1 = 2;
            addButton(1,"二阶戒指",function():void
            {
               _g1.tieredRings(tier1);
            });
         }
         if(get_player().level >= 20 || get_game().time.days >= 200)
         {
            _g2 = this;
            tier2 = 3;
            addButton(2,"三阶戒指",function():void
            {
               _g2.tieredRings(tier2);
            });
         }
         addButton(14,"返回",inside);
      }
      
      override public function debit(param1:ItemType = undefined, param2:int = -1, param3:String = undefined) : void
      {
         if(param3 == null)
         {
            param3 = "";
         }
         if(isJewelryBox(param3))
         {
            outputText("你有些怀疑地点了点头，但还是交出了500宝石。为了它的收纳价值，这很值得。你伸出手想从柜台上拿走盒子，但他却发出令人警觉的嘶嘶声，伸出一只手臂挡住了你。你吃了一惊，看着这个古怪的小商人通过掷骰子和敲击来检查宝石的真伪。[say:看来一切正常。非常感谢！嘿嘿嘿……]");
            outputText("[pg]你更加小心地、毫不费力地拿起盒子并将其收好，与此同时，商人也收起了你的宝石");
         }
         else
         {
            outputText("你刚数完宝石，他就一把从你手中抢过它们，然后把你要买的东西塞给你，他双手捧着宝石，暗自窃笑。");
         }
         super.debit(param1,param2,param3);
      }
      
      override public function confirmBuy(param1:ItemType = undefined, param2:int = -1, param3:String = undefined) : void
      {
         if(param3 == null)
         {
            param3 = "";
         }
         clearOutput();
         if(isJewelryBox(param3))
         {
            if(get_player().hasKeyItem("Equipment Storage - Jewelry Box"))
            {
               outputText("<b>你已经有一个首饰盒了！</b>");
               doNext(inside);
               return;
            }
            outputText("你的目光落在商人身后的架子上，那里摆满了小木盒。商人顺着你的目光看去，眼中闪烁着贪婪的光芒，他从架子上抓起一个盒子，轻轻抚摸着它的表面，发出一声轻哼。[say:啊！眼光真敏锐，哪个骄傲的珠宝拥有者会没有一个安全的储物盒来存放他们无价的宝石呢？你不会，只要一点点费用！是的，有了这些密码箱中的一个，就没有哪个掠夺者或者穿着紧身衣、挥舞着烤串的愚蠢狐狸能从你这里抢走你珍贵的首饰。要是贞操带能像我的盒子一样结实就好了……啊，不过那样就没什么意思了，对吧？嘿嘿嘿！500宝石！]");
         }
         else
         {
            outputText("当你带着几乎可以触摸到的兴奋指着那件物品时，商人盯着你的手。[say:啊，极好的选择！]他拿起那件首饰，在手掌里掂量了几下，[say:嘿嘿，我愿意以，比如说，" + param1.get_value() + " 宝石的价格把它卖给你？]");
         }
         super.confirmBuy(param1,param2,param3);
      }
   }
}

