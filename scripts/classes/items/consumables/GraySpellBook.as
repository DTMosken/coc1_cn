package classes.items.consumables
{
   import classes.DynStat;
   import classes.Player;
   import classes.StatusEffects;
   import classes.items.Consumable;
   import flash.Boot;
   
   public class GraySpellBook extends Consumable
   {
      
      public static var ITEM_VALUE:int = 250;
      
      public function GraySpellBook()
      {
         if(Boot.skip_constructor)
         {
            return;
         }
         super("G. Book","Gray Book","a small gray book with white and black runes ",250,"This gray grimoire is adorned with beveled white and black runes. The pages are edged with gold, like some of the fancy books in the monastery back home.");
      }
      
      override public function useItem() : Boolean
      {
         outputText("你打开了这本魔法书。它解释了一种独特的魔法——黑白魔法的混合体——如果你受到情绪的影响，但又没有被情绪淹没，这种魔法就会变得更加强大。你很快就读完了整本书，但还没等你把它收起来，它就凭空消失了。");
         if(get_player().get_inte100() < 30)
         {
            outputText("[pg]阅读的时光让你感到大受启发。");
            dynStats(DynStat.Inte(4));
         }
         else if(get_player().get_inte100() < 60)
         {
            outputText("[pg]花点时间阅读对你可能是有好处的，你确实觉得自己因此变聪明了。");
            dynStats(DynStat.Inte(2));
         }
         else if(get_player().get_inte100() < 80)
         {
            outputText("[pg]读完这本小册子后，你本就敏捷的思维感到更加活跃了。");
            dynStats(DynStat.Inte(1));
         }
         else
         {
            outputText("[pg]这本书的内容对你本就相当高的智力并没有什么帮助。");
            dynStats(DynStat.Inte(0.6));
         }
         if(get_player().get_inte() >= 55 && !get_player().hasStatusEffect(StatusEffects.KnowsTKBlast))
         {
            outputText("[pg]你惊讶地眨了眨眼，脑海中突然涌入了一个<b>新法术的知识：念力冲击。</b>");
            get_player().createStatusEffect(StatusEffects.KnowsTKBlast,0,0,0,0);
            return false;
         }
         if(get_player().get_inte() >= 70 && !get_player().hasStatusEffect(StatusEffects.KnowsLeech))
         {
            outputText("[pg]你惊讶地眨了眨眼，脑海中突然涌入了一个<b>新法术的知识：吸血。</b>");
            get_player().createStatusEffect(StatusEffects.KnowsLeech,0,0,0,0);
            return false;
         }
         return false;
      }
   }
}

