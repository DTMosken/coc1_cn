package classes.items.consumables
{
   import classes.DynStat;
   import classes.PerkLib;
   import classes.Player;
   import classes.items.Consumable;
   import classes.items.ConsumableLib;
   import classes.scenes.Inventory;
   import flash.Boot;
   
   public class PurePearl extends Consumable
   {
      
      public static var ITEM_VALUE:int = 1000;
      
      public function PurePearl()
      {
         if(Boot.skip_constructor)
         {
            return;
         }
         super("P.Pearl","Pure Pearl","a pure pearl",1000,"Marae gave you this pure pearl as a reward for shutting down the demonic factory.");
      }
      
      override public function useItem() : Boolean
      {
         if(get_player().hasPerk(PerkLib.PurityBlessing))
         {
            outputText("正当你准备把珍珠塞进嘴里时，你的直觉提醒你，既然你已经拥有了这个特质，就不应该浪费这颗珍珠。你把它放回了你的[inv]里。");
            get_inventory().takeItem(get_consumables().P_PEARL,get_inventory().inventoryMenu);
            return false;
         }
         outputText("你把珍珠塞进嘴里，像吞一颗巨大的药丸一样艰难地咽了下去。令人惊讶的是，你并没有感到任何不适，只有一种清凉平静的感觉从你的核心涌起。");
         outputText("[pg]<b>获得特质：纯洁祝福！</b>");
         dynStats(DynStat.Lib(-5),DynStat.Lust(-25),DynStat.Cor(-10));
         get_player().createPerk(PerkLib.PurityBlessing,0,0,0,0);
         return false;
      }
   }
}

