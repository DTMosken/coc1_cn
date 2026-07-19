package classes.items.useables
{
   import classes.CoC;
   import classes.items.Useable;
   import classes.scenes.Inventory;
   import flash.Boot;
   
   public class DesertRose extends Useable
   {
      
      public function DesertRose()
      {
         if(Boot.skip_constructor)
         {
            return;
         }
         super("DstRose","Desert Rose","a desert rose",1,"Being a balled-up tumbleweed roughly the size of a fist, this is only a rose in name. Its branches are withered and dry, though these plants are known to miraculously spring back to false life when watered, giving the illusion of immortality.");
      }
      
      override public function useItem() : Boolean
      {
         if(get_game().get_gameState() == 0)
         {
            outputText("你检查了这株干枯的植物。它的树枝卷曲起来，形成美丽、迷宫般的星座，形成一个紧密的球，在这个保护状态下等待，直到它们可以再次被解开。");
            outputText("[pg]为了测试它所谓的特性，你[walk]到溪流边，让它漂浮在浅水区，并把它卡在两块石头之间。奇怪的是，观察了几分钟后，你确实注意到这株死去的植物恢复了一丝绿意，它的一些叶子和树枝慢慢地从干瘪的球体上剥落，在水中浸泡时呈扇形散开。这真的就像植物复活了一样，违背了死亡的规律。");
         }
         else
         {
            outputText("你看着这个干瘪的球，以及这株植物像迷宫一样卷曲起来的样子。除了它奇特的美丽之外，似乎没有什么其他特别之处。也许如果附近有水，你可以试着把它放进去。");
         }
         get_inventory().returnItemToInventory(this);
         return true;
      }
      
      override public function getMaxStackSize() : int
      {
         return 1;
      }
   }
}

