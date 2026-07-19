package classes.items.consumables
{
   import classes.DynStat;
   import classes.Player;
   import classes.internals.Utils;
   import classes.items.Consumable;
   import flash.Boot;
   
   public class VitalityTincture extends Consumable
   {
      
      public static var ITEM_VALUE:int = 15;
      
      public function VitalityTincture()
      {
         if(Boot.skip_constructor)
         {
            return;
         }
         super("Vital T","Vit. Tincture","a vitality tincture",15,"This potent tea is supposedly good for strengthening the body.");
      }
      
      override public function useItem() : Boolean
      {
         var _loc1_:int = 0;
         get_player().slimeFeed();
         outputText("你喝下了瓶子里的东西。液体很浓稠，尝起来非常像樱桃。片刻之后，你感觉身体更健康、更强壮了。");
         _loc1_ = Utils.rand(3);
         dynStats(DynStat.Str(_loc1_));
         if(_loc1_ == 0)
         {
            _loc1_ = Utils.rand(3);
            if(_loc1_ == 0)
            {
               _loc1_ = 1;
            }
         }
         else
         {
            _loc1_ = Utils.rand(3);
         }
         dynStats(DynStat.Tou(_loc1_));
         if(get_player().HPChange(50,false) != 0)
         {
            outputText("你遭受的任何疼痛、酸痛和瘀伤都不再痛了，你感觉好多了。");
         }
         if(Utils.rand(3) == 0)
         {
            outputText(get_player().modTone(95,3));
         }
         get_player().refillHunger(10);
         return false;
      }
   }
}

