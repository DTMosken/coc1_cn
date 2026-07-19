package classes.items.consumables
{
   import classes.DynStat;
   import classes.Player;
   import classes.items.Consumable;
   import flash.Boot;
   
   public class HealPill extends Consumable
   {
      
      public function HealPill()
      {
         if(Boot.skip_constructor)
         {
            return;
         }
         super("H. Pill","Healing Pill","a small healing pill",6,"A small healing pill that\'s guaranteed to heal you by a bit.");
      }
      
      override public function useItem() : Boolean
      {
         var _loc1_:int = int(Math.random() * 100);
         outputText("你把小药丸塞进嘴里吞了下去。");
         if(get_player().HPChange(50 + get_player().get_tou(),true) != 0)
         {
            outputText("你的一些伤口被治疗了。");
         }
         else
         {
            outputText("你感到一种奇怪的感觉。");
         }
         if(_loc1_ < 70 && get_player().lib < 40)
         {
            outputText("你感到一股暖流蔓延过你的敏感带。");
            dynStats(DynStat.Lib(1));
         }
         if(_loc1_ >= 70 && _loc1_ <= 90)
         {
            outputText("你的身体微微发麻，感觉更加敏感了。");
            dynStats(DynStat.Sens(4));
         }
         if(_loc1_ > 90)
         {
            outputText("一阵小小的性高潮传遍全身，让你不禁颤抖。当你恢复过来时，你反而觉得更加兴奋了。");
            dynStats(DynStat.Lust(5));
         }
         return false;
      }
      
      override public function getMaxStackSize() : int
      {
         return 5;
      }
   }
}

