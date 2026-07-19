package classes.items.consumables
{
   import classes.Cock;
   import classes.CockTypesEnum;
   import classes.DynStat;
   import classes.Player;
   import classes.internals.Utils;
   import classes.items.Consumable;
   import classes.scenes.Inventory;
   import coc.view.CoCButton;
   import flash.Boot;
   
   public final class Reducto extends Consumable
   {
      
      public var minNipples:Number;
      
      public var minHorns:Number;
      
      public var minHips:Number;
      
      public var minCock:Number;
      
      public var minClit:Number;
      
      public var minButt:Number;
      
      public var minBreast:Number;
      
      public var minBalls:Number;
      
      public function Reducto()
      {
         if(Boot.skip_constructor)
         {
            return;
         }
         minHorns = 2;
         minNipples = 0.1;
         minHips = 0;
         minCock = 4;
         minClit = 0.1;
         minButt = 0;
         minBreast = 0;
         minBalls = 0.5;
         super("Reducto","Reducto","a salve marked as \'Reducto\'",30,"A small tube with a label stating that the paste inside can be used to shrink a body part down by a significant amount.");
      }
      
      override public function useItem() : Boolean
      {
         var _loc1_:String = "缩形膏在这里已经无能为力了。";
         outputText("你端详着手中的药膏，思索着你想缩小身体的哪个部位。你要把它用在什么地方？");
         menu();
         addButton(0,"蛋蛋",reductoBalls).disableIf(get_player().ballSize <= minBalls,_loc1_).hideIf(!get_player().hasBalls());
         addButton(1,"胸部",reductoBreasts).disableIf(get_player().biggestTitSize() <= minBreast,_loc1_).hideIf(!get_player().hasBreasts());
         addButton(2,"屁股",reductoButt).disableIf(get_player().butt.rating <= minButt,_loc1_);
         addButton(3,"阴蒂",reductoClit).disableIf(get_player().getClitLength() <= minClit,_loc1_).hideIf(!get_player().hasVagina());
         addButton(4,"肉棒",reductoCock).disableIf(get_player().biggestCockArea() <= minCock,_loc1_).hideIf(!get_player().hasCock());
         addButton(5,"臀部",reductoHips).disableIf(get_player().hips.rating <= minHips,_loc1_);
         addButton(6,"乳头",reductoNipples).disableIf(get_player().nippleLength <= minNipples,_loc1_);
         addButton(7,"角",shrinkHorns).disableIf(get_player().horns.value <= minHorns,_loc1_).hideIf(!get_player().hasHorns());
         addButton(14,"算了",reductoCancel);
         return true;
      }
      
      public function shrinkHorns() : void
      {
         outputText("你怀疑这缩水药膏是否有效，但还是把这难闻的药膏涂满了你的角。");
         outputText("[pg]令人难以置信的是，它起作用了，你能感觉到你的角缩短了一英寸。");
         var _temp_1:* = get_player().horns;
         _temp_1.value = _temp_1.value - 1;
         get_inventory().itemGoNext();
      }
      
      public function reductoNipples() : void
      {
         clearOutput();
         outputText("你将药膏均匀地涂抹在[nipples]上，确保完全覆盖。");
         if(get_player().nippleLength / 2 < minNipples)
         {
            outputText("[pg]你的乳头不断缩小，直到变成微小的凸起。");
            get_player().nippleLength = minNipples;
         }
         else
         {
            outputText("[pg]你的[nipples]变得越来越小，直到只有原来的一半大小才停下来。");
            var _temp_1:* = get_player();
            _temp_1.nippleLength = _temp_1.nippleLength / 2;
         }
         dynStats(DynStat.Sens(-5),DynStat.Lust(-5));
         get_inventory().itemGoNext();
      }
      
      public function reductoHips() : void
      {
         clearOutput();
         outputText("你把散发着恶臭的药膏涂在你的[hips]上。起初感觉凉凉的，但很快就变得热得让人不舒服。");
         if(get_player().hips.rating >= 15)
         {
            var _temp_1:* = get_player().hips;
            _temp_1.rating = _temp_1.rating - (3 + int(get_player().hips.rating / 3));
            outputText("[pg]几秒钟内，你感觉明显变轻了，快速瞥了一眼你的臀部，发现它们明显变窄了。");
         }
         else if(get_player().hips.rating >= 10)
         {
            var _temp_2:* = get_player().hips;
            _temp_2.rating = _temp_2.rating - 3;
            outputText("[pg]随着你的[hips]微微移动，适应了更小的尺寸，你感觉轻盈了许多。");
         }
         else
         {
            var _temp_3:* = get_player().hips;
            _temp_3.rating = _temp_3.rating - Utils.randBetween(1,3);
            if(get_player().hips.rating < minHips)
            {
               get_player().hips.rating = minHips;
            }
            outputText("[pg]几秒钟后，你的[hips]缩小了许多！");
         }
         dynStats(DynStat.Lib(-2),DynStat.Lust(-10));
         get_inventory().itemGoNext();
      }
      
      public function reductoCock() : void
      {
         var _loc1_:int = 0;
         clearOutput();
         if(get_player().cocks[0].get_cockType() == CockTypesEnum.BEE)
         {
            outputText("当你把凝胶揉进你的[cock]时，它产生了一种奇怪的效果。它似乎真的平息了通常充满你的需求。事实上，随着你的[cock]缩小，它的肤色变得更符合你的肤色，覆盖在上面的蜂毛也脱落了。<b>你现在有了一根人类的阴茎！</b>");
            get_player().cocks[0].set_cockType(CockTypesEnum.HUMAN);
         }
         else
         {
            outputText("你把散发着令人作呕气味的药膏涂在你的[cocks]上。它立刻开始变热，几乎让人不舒服，因为你的[cocks]开始缩小。");
            if(int(get_player().cocks.length) == 1)
            {
               outputText("[pg]你的[cock]在缩小时抽搐着，稳步消失在你的" + (get_player().hasSheath() ? "包皮" : "胯部") + "中，直到它失去了大约三分之一的旧尺寸。");
               var _temp_1:* = get_player().cocks[0];
               _temp_1.cockLength = _temp_1.cockLength * 0.6666666666666666;
               var _temp_2:* = get_player().cocks[0];
               _temp_2.cockThickness = _temp_2.cockThickness * 0.6666666666666666;
            }
            else
            {
               outputText("[pg]你的[cocks]抽搐并缩小，每根阴茎都稳步消失在你的" + (get_player().hasSheath() ? "包皮" : "胯部") + "中，直到它们失去了大约三分之一的旧尺寸。");
               _loc1_ = 0;
               while(_loc1_ < int(get_player().cocks.length))
               {
                  var _temp_3:* = get_player().cocks[_loc1_];
                  _temp_3.cockLength = _temp_3.cockLength * 0.6666666666666666;
                  var _temp_4:* = get_player().cocks[_loc1_];
                  _temp_4.cockThickness = _temp_4.cockThickness * 0.6666666666666666;
                  _loc1_++;
               }
            }
         }
         dynStats(DynStat.Sens(-2),DynStat.Lust(-10));
         get_inventory().itemGoNext();
      }
      
      public function reductoClit() : void
      {
         clearOutput();
         outputText("你小心翼翼地将药膏涂抹在你的[clit]上，非常注意避免弄到你的[vagina]上。当它开始发挥作用时，它燃烧着热量……");
         get_player().setClitLength(get_player().getClitLength() / 1.7);
         get_player().setClitLength(int(get_player().getClitLength() * 100) / 100);
         outputText("[pg]你的[clit]迅速缩小，在吸收完药膏之前，缩小到原来的一半大小。");
         dynStats(DynStat.Sens(-2),DynStat.Lust(-10));
         get_inventory().itemGoNext();
      }
      
      public function reductoCancel() : void
      {
         clearOutput();
         outputText("你收起了药膏。[pg]");
         get_inventory().returnItemToInventory(this);
      }
      
      public function reductoButt() : void
      {
         clearOutput();
         outputText("你把散发着恶臭的药膏涂在你的[ass]上。起初感觉凉凉的，但很快就变得热得让人不舒服。");
         if(get_player().butt.rating >= 15)
         {
            var _temp_1:* = get_player().butt;
            _temp_1.rating = _temp_1.rating - (3 + int(get_player().butt.rating / 3));
            outputText("[pg]几秒钟内，你感觉明显变轻了，快速瞥了一眼，发现你的屁股明显变小了。");
         }
         else if(get_player().butt.rating >= 10)
         {
            var _temp_2:* = get_player().butt;
            _temp_2.rating = _temp_2.rating - 3;
            outputText("[pg]随着你的[ass]微微晃动，适应了更小的尺寸，你感觉轻盈了许多。");
         }
         else
         {
            var _temp_3:* = get_player().butt;
            _temp_3.rating = _temp_3.rating - Utils.randBetween(1,3);
            if(get_player().butt.rating < minButt)
            {
               get_player().butt.rating = minButt;
            }
            outputText("[pg]几秒钟后，你的[ass]缩小了很多！");
         }
         dynStats(DynStat.Lib(-2),DynStat.Lust(-10));
         get_inventory().itemGoNext();
      }
      
      public function reductoBreasts() : void
      {
         clearOutput();
         outputText("你把散发着恶臭的药膏涂满你的[allbreasts]，完全覆盖住它们，药膏开始被你的[skindesc]吸收。");
         get_player().shrinkTits(true);
         if(Utils.randomChance(50) && get_player().biggestTitSize() >= minBreast)
         {
            outputText("[pg]药膏的效果继续显现，你的身体又开始发生变化……");
            get_player().shrinkTits(true);
         }
         outputText("[pg]最后一点药膏渗入你的皮肤，完成了变化。");
         dynStats(DynStat.Sens(-2),DynStat.Lust(-5));
         get_inventory().itemGoNext();
      }
      
      public function reductoBalls() : void
      {
         clearOutput();
         outputText("你把散发着恶臭的药膏涂在你的[sack]上。起初感觉凉凉的，但很快就变得热得让人不舒服。");
         var _temp_1:* = get_player();
         _temp_1.ballSize = _temp_1.ballSize * 0.6666666666666666;
         if(get_player().ballSize < minBalls)
         {
            get_player().ballSize = minBalls;
         }
         outputText("[pg]你感觉到你的阴囊在移动，和你的[balls]一起缩小。几秒钟内，药膏就被完全吸收，缩小也停止了。");
         dynStats(DynStat.Lib(-2),DynStat.Lust(-10));
         get_inventory().itemGoNext();
      }
      
      override public function canUse() : Boolean
      {
         return true;
      }
   }
}

