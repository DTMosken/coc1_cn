package classes.items.consumables
{
   import classes.Player;
   import classes.StatusEffects;
   import classes._FlagDict.FlagDict_Impl_;
   import classes.globalFlags.KFLAGS;
   import classes.items.Consumable;
   import flash.Boot;
   
   public class CeruleanPotion extends Consumable
   {
      
      public static var ITEM_VALUE:int = 75;
      
      public function CeruleanPotion()
      {
         if(Boot.skip_constructor)
         {
            return;
         }
         super("Cerul P","CeruleanPotion","a cerulean-tinted potion",75,"A mysterious bottle filled with a sky-blue liquid that sloshes gently inside. Supposedly it will make you irresistible, though to what or who you cannot say.");
      }
      
      override public function useItem() : Boolean
      {
         get_player().slimeFeed();
         if(get_player().get_gender() == 0 && FlagDict_Impl_.arrayReadInt(KFLAGS.flags,62) > 0)
         {
            outputText("你又喝了一口蔚蓝药水。你觉得它很舒缓，并对魅魔可能再次来访感到非常兴奋。");
         }
         else if(get_player().get_gender() == 3 && FlagDict_Impl_.arrayReadInt(KFLAGS.flags,111) > 0)
         {
            outputText("带着期待，你又灌下了一瓶蔚蓝药水。当你感觉到药水流经全身时，一股暖流从你的胃里散发出来。");
         }
         else
         {
            outputText("这液体尝起来相当平淡，很容易就咽了下去。");
            if(get_player().hasStatusEffect(StatusEffects.RepeatSuccubi))
            {
               outputText("你期待着今晚的邂逅。");
            }
            else
            {
               outputText("你没有注意到任何实质性的效果。那个商人骗了你吗？");
            }
         }
         if(get_player().hasStatusEffect(StatusEffects.SuccubiNight))
         {
            if(get_player().statusEffectv1(StatusEffects.SuccubiNight) < 3)
            {
               get_player().addStatusValue(StatusEffects.SuccubiNight,1,1);
            }
         }
         else
         {
            get_player().createStatusEffect(StatusEffects.SuccubiNight,1,0,0,0);
         }
         get_player().refillHunger(20);
         return false;
      }
   }
}

