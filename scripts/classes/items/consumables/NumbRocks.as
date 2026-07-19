package classes.items.consumables
{
   import classes.DynStat;
   import classes.PerkLib;
   import classes.Player;
   import classes.StatusEffects;
   import classes.internals.Utils;
   import classes.items.Consumable;
   import flash.Boot;
   
   public class NumbRocks extends Consumable
   {
      
      public static var ITEM_VALUE:int = 15;
      
      public function NumbRocks()
      {
         if(Boot.skip_constructor)
         {
            return;
         }
         super("NumbRox","Numb Rocks","a strange packet of candy called \'Numb Rocks\'",15,"This packet of innocuous looking \'candy\' guarantees to reduce troublesome sensations and taste delicious.");
      }
      
      override public function useItem() : Boolean
      {
         var _loc1_:* = null as Player;
         outputText("你打开跳跳糖的包装，把它倒进你张开的嘴里。奇怪的糖果发出嘶嘶声和爆裂声，当你吞下这甜美的混合物时，你舌头上的神经感觉有点麻木。");
         if(get_player().get_lust() >= 33)
         {
            outputText("[pg]麻木感蔓延到你的全身，带来一种平静的感觉，似乎抑制了你的性冲动。");
            _loc1_ = get_player();
            _loc1_.set_lust(_loc1_.get_lust() - (20 + Utils.rand(40)));
         }
         if(Utils.rand(5) == 0)
         {
            if(!get_player().hasStatusEffect(StatusEffects.Dysfunction))
            {
               outputText("[pg]不幸的是，");
               if(get_player().cockTotal() > 0)
               {
                  outputText(get_player().sMultiCockDesc());
                  if(get_player().hasVagina())
                  {
                     outputText("和");
                  }
                  outputText("");
               }
               if(get_player().hasVagina())
               {
                  if(!get_player().hasCock())
                  {
                     outputText("你的 ");
                  }
                  outputText(get_player().vaginaDescript(0) + " ");
               }
               if(!(get_player().hasCock() || get_player().hasVagina()))
               {
                  outputText("[asshole] ");
               }
               outputText("的皮肤也麻木了。你轻轻地摸了摸自己，但当你意识到你几乎感觉不到它时，你感到非常不安。你可能仍然可以操些什么来发泄，但普通的自慰是不可能的了……");
               get_player().createStatusEffect(StatusEffects.Dysfunction,50 + Utils.rand(100),0,0,0);
            }
            else
            {
               outputText("[pg]可悲的是，你的腹股沟对感觉变得更加麻木。你想知道你还要等多久才能再次取悦自己。");
               get_player().addStatusValue(StatusEffects.Dysfunction,1,50 + Utils.rand(100));
            }
         }
         else if(Utils.rand(4) == 0 && get_player().get_inte() > 15)
         {
            outputText("[pg]麻木感笼罩了你的大脑，让你觉得反应迟钝，头脑发昏。也许这些糖果并不是什么绝妙的……好主意。");
            dynStats(DynStat.Inte(-(1 + Utils.rand(5))));
         }
         if(!get_player().hasPerk(PerkLib.ThickSkin) && get_player().get_sens100() < 30 && Utils.rand(4) == 0)
         {
            outputText("慢慢地，");
            if(get_player().hasPlainSkin())
            {
               outputText("你的皮肤");
            }
            else
            {
               outputText("你[skindesc]下的皮肤");
            }
            outputText("开始感觉变得迟钝，几乎……变厚了。你捏了捏自己，发现你的表皮对伤害的抵抗力更强了，简直就像天然的盔甲！\n<b>（获得专长 - 厚皮！）</b>");
            get_player().createPerk(PerkLib.ThickSkin,0,0,0,0);
         }
         outputText("[pg]感觉消退后，你的[skindesc]对触觉的敏感度稍微降低了一些。");
         dynStats(DynStat.Sens(-3));
         if(get_player().sens < 1)
         {
            get_player().sens = 1;
         }
         get_player().refillHunger(20);
         return false;
      }
   }
}

