package classes.items.consumables
{
   import classes.DynStat;
   import classes.Player;
   import classes.StatusEffects;
   import classes.internals.Utils;
   import classes.items.Consumable;
   import flash.Boot;
   
   public class BlackCatBeer extends Consumable
   {
      
      public function BlackCatBeer()
      {
         if(Boot.skip_constructor)
         {
            return;
         }
         super("BC Beer","BlackCatBeer","a mug of Black Cat Beer",1,"A capped mug containing an alcoholic drink secreted from the breasts of Niamh. It smells tasty.");
         addTags("Fluid");
      }
      
      override public function useItem() : Boolean
      {
         return applyEffect(get_player(),false);
      }
      
      public function blackCatBeerExpires() : void
      {
         dynStats(DynStat.Spe(4.5),DynStat.Inte(4.5),DynStat.Lib(-1 * get_player().statusEffectv2(StatusEffects.BlackCatBeer)));
         get_player().removeStatusEffect(StatusEffects.BlackCatBeer);
         outputText("[pg]<b>那种温暖、毛茸茸的感觉终于消散了，让你思维更清晰，注意力更集中，也不那么饥渴了。虽然那种感觉很棒，但恢复正常也不错。不过，你心里还是有点想再来一杯啤酒。</b>[pg]");
      }
      
      public function applyEffect(param1:Player, param2:Boolean = true, param3:Boolean = false) : Boolean
      {
         if(param2)
         {
            clearOutput();
         }
         if(param3)
         {
            outputText("[pg]");
         }
         outputText("打开杯盖，你一口气把里面的东西灌了下去，当它在你的肚子里燃烧出一条火热的轨迹时，你忍不住喘着粗气。它醇厚又香甜，而且妈的，这玩意儿劲真大！");
         outputText("[pg]一种美妙的温暖感传遍全身，让你的疼痛消散。然而，它也让你的胯下感到一阵酥麻——加上已经带来的放松感，你感到<b>非常</b>性奋。紧接着，一种美妙、温暖、迷糊的感觉充满了你的大脑，就像你的脑子被棉花包裹着一样。你觉得自己的脑子不如以前好使了，但没关系，这种感觉太舒服了……");
         outputText("[pg]你突然感觉失去了平衡，踉跄了一下，险些摔倒。你就是没法像以前动得那么快了，毕竟你的脑袋里充满了轻飘飘的迷糊感；当你的脑袋被填满后，你的身体在温暖中感到阵阵酥麻，这种感觉集中在你的性感带周围。你只觉得整个人软绵绵的……你也想抱住某个人，和他们分享你的温暖；这真是太美妙了。");
         param1.HPChange(40 + Utils.rand(21),false);
         var _loc4_:Number = 0;
         if(param1.getMaxStats("lib") - param1.lib >= 10)
         {
            _loc4_ = 10;
         }
         else
         {
            _loc4_ = param1.getMaxStats("lib") - param1.lib;
         }
         if(!param1.hasStatusEffect(StatusEffects.BlackCatBeer))
         {
            param1.createStatusEffect(StatusEffects.BlackCatBeer,8,_loc4_,0,0);
            dynStats(DynStat.Spe(-5),DynStat.Inte(-5),DynStat.Lib(_loc4_),DynStat.Lust(20 + Utils.rand(param1.lib / 4)));
         }
         else
         {
            param1.addStatusValue(StatusEffects.BlackCatBeer,1,4);
            param1.addStatusValue(StatusEffects.BlackCatBeer,2,_loc4_);
            outputText("[pg]该死，每多喝一杯感觉就更好！");
            dynStats(DynStat.Spe(-1),DynStat.Inte(-1),DynStat.Lib(_loc4_),DynStat.Lust(30 + Utils.rand(param1.lib / 4)));
         }
         param1.slimeFeed();
         return false;
      }
   }
}

