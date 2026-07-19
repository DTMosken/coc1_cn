package classes.items.consumables
{
   import classes.Player;
   import classes.items.Consumable;
   import flash.Boot;
   
   public class UnlabeledBrownMilkBottle extends Consumable
   {
      
      public function UnlabeledBrownMilkBottle()
      {
         if(Boot.skip_constructor)
         {
            return;
         }
         super("UBMBottle","U.MilkBottle","Unlabled Brown Milk Bottle",1000,"A simple brown bottle made of translucent glass. It\'s filled with what looks to be ordinary milk, but curiously, it\'s not labeled.");
      }
      
      override public function useItem() : Boolean
      {
         if(!get_player().udder.hasUdder)
         {
            if(get_player().isMale())
            {
               outputText("你短暂地踉跄了一下，因为你生殖器上方的区域肿胀起来，迅速膨胀成一个沉甸甸的囊袋。你的皮肤感到刺痛，因为上面长出了成排的乳头，让你拥有了一个完美无缺的乳房。");
            }
            if(get_player().isFemale())
            {
               outputText("你短暂地踉跄了一下，因为你双腿之间的皮肤肿胀起来，迅速膨胀成一个沉甸甸的囊袋。你的皮肤感到刺痛，因为上面长出了成排的乳头，让你拥有了一个完美无缺的乳房。");
            }
            get_player().udder.hasUdder = true;
         }
         else if(get_player().udder.fullness >= 1000)
         {
            outputText("你感觉到你的乳房排空了，因为它再也装不下更多的乳汁了。");
            get_player().udder.fullness = 0;
         }
         else
         {
            outputText("你感觉到你的乳房轻轻地咕噜作响，并充满了少量的乳汁。");
            var _temp_1:* = get_player().udder;
            _temp_1.fullness = _temp_1.fullness + 10;
         }
         return false;
      }
   }
}

