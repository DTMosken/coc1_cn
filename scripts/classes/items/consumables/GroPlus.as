package classes.items.consumables
{
   import classes.BreastRow;
   import classes.DynStat;
   import classes.Player;
   import classes.internals.Utils;
   import classes.items.Consumable;
   import classes.scenes.Inventory;
   import coc.view.CoCButton;
   import flash.Boot;
   
   public final class GroPlus extends Consumable
   {
      
      public function GroPlus()
      {
         if(Boot.skip_constructor)
         {
            return;
         }
         super("GroPlus","Gro+","a needle filled with Gro+",50,"This is a small needle with a reservoir full of blue liquid. A faded label marks it as \"Gro+\". Its purpose seems obvious.");
      }
      
      override public function useItem() : Boolean
      {
         outputText("你打量着手中的针管，知道它会增大注射部位。你要把它用在身体的哪个部位？");
         menu();
         addButton(0,"蛋蛋",growPlusBalls).disableIf(get_player().balls <= 0);
         addButton(1,"乳房",growPlusBreasts).disableIf(int(get_player().breastRows.length) <= 0);
         addButton(2,"阴蒂",growPlusClit).disableIf(int(get_player().vaginas.length) <= 0);
         addButton(3,"肉棒",growPlusCock).disableIf(get_player().cockTotal() <= 0);
         addButton(4,"乳头",growPlusNipples).disableIf(get_player().totalNipples() <= 0);
         addButton(14,"算了",growPlusCancel);
         return true;
      }
      
      public function growPlusNipples() : void
      {
         var _loc1_:Boolean = false;
         var _loc2_:int = 0;
         clearOutput();
         get_player().slimeFeed();
         outputText("你依次将针头扎进你的[nipples]中，将液体均匀地分配给它们。虽然每次注射都很疼，但这种疼痛很快就被强效的化学混合物冲刷掉了。[pg]");
         outputText("你的乳头充血肿胀，硬挺地顶在你的[armor]内侧。你突然意识到它们又长长了超过四分之一英寸。[pg]");
         var _temp_1:* = get_player();
         _temp_1.nippleLength = _temp_1.nippleLength + (Utils.rand(2) + 3) / 10;
         dynStats(DynStat.Lust(15));
         if(!get_player().hasFuckableNipples() && Utils.rand(4) == 0)
         {
            _loc1_ = false;
            _loc2_ = 0;
            while(_loc2_ < int(get_player().breastRows.length))
            {
               if(!get_player().breastRows[_loc2_].fuckable && get_player().nippleLength >= 2)
               {
                  get_player().breastRows[_loc2_].fuckable = true;
                  _loc1_ = true;
               }
               _loc2_++;
            }
            if(_loc1_)
            {
               outputText("你的" + get_player().allBreastsDescript() + "感到一阵温暖的刺痛，这股暖流慢慢转移到你的乳头，让它们充满了温热感。你喘息着呻吟，用手指揉搓着它们。当你的手指滑进乳头时，突然有一丝湿润感包裹住了你的手指。你震惊地把手指抽了出来。<b>你现在拥有了可以操的乳头！</b>[pg]");
            }
         }
         get_inventory().itemGoNext();
      }
      
      public function growPlusCock() : void
      {
         var _loc1_:Number = NaN;
         var _loc2_:int = 0;
         clearOutput();
         get_player().slimeFeed();
         outputText("你将针头刺入[cocks]的根部。这疼得要命，但当你按下注射器推杆时，疼痛消失了，取而代之的是化学物质起效时带来的刺痛快感。[pg]");
         if(int(get_player().cocks.length) == 1)
         {
            _loc1_ = get_player().increaseCock(0,4);
            outputText("你的[cock]抽搐着变粗，从你的" + (_loc1_ > 1 ? "一英寸多" : "大约一英寸") + "粗长的新肉中涌出");
         }
         else
         {
            outputText("你的[cocks]抽搐着变粗，每根肉棒都从你的" + "涌出超过一英寸的新长度");
            _loc2_ = 0;
            while(_loc2_ < int(get_player().cocks.length))
            {
               get_player().increaseCock(_loc2_,2);
               _loc2_++;
            }
         }
         if(get_player().hasSheath())
         {
            outputText("阴茎鞘中。");
         }
         else
         {
            outputText("胯部。");
         }
         dynStats(DynStat.Sens(2),DynStat.Lust(10));
         get_inventory().itemGoNext();
      }
      
      public function growPlusClit() : void
      {
         clearOutput();
         get_player().slimeFeed();
         outputText("你将针头扎进你的阴蒂，疼得几乎要哭出来。你按下推杆，随着你的阴蒂开始生长，疼痛也随之消失了。[pg]");
         get_player().changeClitLength(1);
         outputText("你的[clit]在从阴唇中涌出一英寸的新肉后停止了生长。它抽动着，感觉异常敏感。");
         dynStats(DynStat.Sens(2),DynStat.Lust(10));
         get_inventory().itemGoNext();
      }
      
      public function growPlusCancel() : void
      {
         clearOutput();
         outputText("你把小瓶收了起来。[pg]");
         get_inventory().returnItemToInventory(this);
      }
      
      public function growPlusBreasts() : void
      {
         clearOutput();
         get_player().slimeFeed();
         outputText("你将针头扎进你 " + get_player().allBreastsDescript() + " 的肉里，给每个乳房都注射了一部分药剂。[pg]");
         if(int(get_player().breastRows.length) == 1)
         {
            get_player().growTits(Utils.rand(5) + 1,1,true,1);
         }
         else
         {
            get_player().growTits(Utils.rand(2) + 1,int(get_player().breastRows.length),true,1);
         }
         dynStats(DynStat.Lust(10));
         get_inventory().itemGoNext();
      }
      
      public function growPlusBalls() : void
      {
         clearOutput();
         get_player().slimeFeed();
         outputText("你将针头深深扎进你的[sack]里。这疼得要命，但当你按下柱塞，针管里的液体流入你的身体时，疼痛感就消失了。[pg]");
         if(Utils.rand(4) == 0)
         {
            outputText("当化学物质开始起作用时，你感觉到你的[balls]在颤抖。你可以肯定它们会非常有效。\n");
            var _temp_1:* = get_player();
            _temp_1.ballSize = _temp_1.ballSize + (Utils.rand(4) + 2);
            outputText("它们移动着，把你的[sack]撑得紧紧的，因为它们变大了好几英寸。由于你新变大的[balls]导致重心偏移，你不得不迈出一步来稳住自己。");
         }
         else
         {
            var _temp_2:* = get_player();
            _temp_2.ballSize = _temp_2.ballSize + (Utils.rand(2) + 1);
            outputText("你感觉到你的睾丸在移动，随着它们长到[aballs]大，稍微拉扯着你[sack]的皮肤。");
         }
         if(get_player().ballSize > 10)
         {
            outputText("双腿间肿胀的肉团让你走路变得更加困难。也许这是个坏主意。");
         }
         dynStats(DynStat.Lust(10));
         get_inventory().itemGoNext();
      }
      
      override public function canUse() : Boolean
      {
         return true;
      }
   }
}

