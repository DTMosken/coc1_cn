package classes.items.consumables
{
   import classes.Player;
   import classes._FlagDict.FlagDict_Impl_;
   import classes.globalFlags.KFLAGS;
   import classes.internals.Utils;
   import classes.items.Consumable;
   import classes.items.Mutations;
   import flash.Boot;
   import haxe.IMap;
   
   public class RizzaRoot extends Consumable
   {
      
      public function RizzaRoot()
      {
         if(Boot.skip_constructor)
         {
            return;
         }
         super("RizzaRt","Rizza Root","a tube of rizza root strands",10,"A small ceramic tube full of fine red root strands. They smell something like citrus fruit.");
      }
      
      override public function useItem() : Boolean
      {
         var _loc3_:* = null as Player;
         var _loc1_:String = "rizzaRootEffect";
         var _loc2_:Number = 0;
         get_mutations().initTransformation([2,3,4]);
         get_player().refillHunger(15);
         outputText("你咀嚼着细细的红色根须。它们有一种橡胶般的质感，味道有点像柠檬和橙子混合在一起。当你咀嚼它们时，根须会让你的嘴巴变干，但同时它们也会引起一种相当令人愉快的清凉和麻木感。");
         if(get_changes() < get_changeLimit() && !get_player().hasPlainSkin() && Utils.rand(6) == 0)
         {
            if(get_player().hasFur())
            {
               outputText("[pg]你的皮毛痒得厉害，于是你开始抓挠。它开始大块大块地脱落，然后整个乱七八糟的东西开始从你身上脱落。几秒钟内，你的皮肤就变得没有毛发了，或者几乎没有了。<b>你失去了你的皮毛！</b>");
            }
            else if(get_player().hasScales())
            {
               outputText("[pg]你的鳞片痒得厉害，于是你抓挠它们。它们开始大批脱落，没过多久你就站在了一堆鳞片中。<b>你失去了你的鳞片！</b>");
            }
            else if(get_player().hasGooSkin())
            {
               outputText("[pg]你的[skinDesc]痒得厉害，当你抓挠它时，它发生了变化，变成了正常人类般的皮肤。<b>你的皮肤再次恢复正常！</b>");
            }
            get_player().skin.desc = "skin";
            get_player().skin.type = 0;
            set_changes(get_changes() + 2);
         }
         if(get_changes() < get_changeLimit() && get_player().ears.type != 4 && Utils.rand(4) == 0)
         {
            get_player().ears.type = 4;
            set_changes(get_changes() + 1);
            outputText("[pg]当你的[hair]微微移动时，一种奇怪的刺痛感流过你的头皮。你伸出手，你的手碰到了<b>你新长出的尖尖的精灵耳朵</b>。你敢打赌它们看起来很可爱！");
         }
         if(Utils.rand(5) == 0)
         {
            get_mutations().updateOvipositionPerk(_loc1_);
         }
         if(get_changes() < get_changeLimit() && get_player().get_tallness() < 108)
         {
            _loc3_ = get_player();
            _loc3_.set_tallness(_loc3_.get_tallness() + (get_changeLimit() - get_changes() + Utils.rand(2)));
            if(get_player().get_tallness() > 108)
            {
               get_player().set_tallness(108);
            }
            outputText("[pg]一阵战栗流过你的脊背。你意识到，它连同你身体的其他部分，现在都变高了一点。");
         }
         else if(get_player().get_tallness() >= 108)
         {
            outputText("[pg]你没有感觉到脊背有什么变化。也许这就是里扎根能让你长到的最高高度了。");
         }
         var _loc4_:IMap = KFLAGS.flags;
         FlagDict_Impl_.arrayWriteInt(_loc4_,2077,FlagDict_Impl_.arrayReadInt(_loc4_,2077) + get_changes());
         return false;
      }
   }
}

