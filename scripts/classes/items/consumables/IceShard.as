package classes.items.consumables
{
   import classes.DynStat;
   import classes.Player;
   import classes.internals.Utils;
   import classes.items.Consumable;
   import flash.Boot;
   
   public class IceShard extends Consumable
   {
      
      public function IceShard()
      {
         if(Boot.skip_constructor)
         {
            return;
         }
         super("Icicle ","Icicle","an ice shard",6,"An icicle that seems to be incapable of melting. It numbs your hands as you hold it. ");
      }
      
      override public function useItem() : Boolean
      {
         outputText("你试探性地舔了舔冰柱，小心翼翼地不让舌头粘在上面。它的味道很清爽，就像清凉、纯净的冰川水。随着你不断地舔舐，冰块在你口腔的温度下很容易就溶解了。没过多久，冰柱就缩小成了一小片，刚好可以塞进嘴里。当那一点点冰融化时，你冰冷的舌头在嘴里滑动，回味着那种清脆的感觉。[pg]");
         if(Utils.rand(2) == 0 && (get_player().get_str100() < 75 || get_player().get_tou100() < 75))
         {
            outputText("一阵寒意让你的肌肉紧绷，强健了你的身体，让你感觉比以往任何时候都更强壮。");
            if(get_player().get_str100() < 75)
            {
               dynStats(DynStat.Str((1 + Utils.rand(5)) / 5));
            }
            if(get_player().get_tou100() < 75)
            {
               dynStats(DynStat.Tou((1 + Utils.rand(5)) / 5));
            }
         }
         if(Utils.rand(2) == 0 && get_player().get_spe100() > 25)
         {
            outputText("你感到一阵寒意传遍全身；当它消退时，你觉得更加慵懒迟钝了。");
            if(get_player().get_spe100() > 25)
            {
               dynStats(DynStat.Spe(-((1 + Utils.rand(5)) / 5)));
            }
         }
         if(Utils.rand(2) == 0)
         {
            outputText("你还感到全身有些麻木，在很多方面都是如此……");
            dynStats(DynStat.Lib(-((1 + Utils.rand(2)) / 2)));
            dynStats(DynStat.Sens(-((1 + Utils.rand(2)) / 2)));
         }
         get_player().refillHunger(5);
         return false;
      }
   }
}

