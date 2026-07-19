package classes.items.consumables
{
   import classes.DynStat;
   import classes.Player;
   import classes.StatusEffects;
   import classes.items.Consumable;
   import flash.Boot;
   
   public class BlackSpellBook extends Consumable
   {
      
      public static var ITEM_VALUE:int = 40;
      
      public function BlackSpellBook()
      {
         if(Boot.skip_constructor)
         {
            return;
         }
         super("B. Book","Black Book","a small book with a midnight-black cover",40,"This solid black book is totally unmarked, save for a blood red clasp that holds the covers closed until you are ready to read it. The pages are edged with gold, like some of the fancy books in the monastery back home.");
      }
      
      override public function useItem() : Boolean
      {
         outputText("你打开这本黑色的小书，发现这是一本关于如何使用黑魔法的指导书。书中的大部分内容都是关于黑魔法的基础知识——它是如何从情感（通常是性欲）中汲取力量的，以及它如何拥有影响身体和情感的力量。书中还警告不要对自己使用黑魔法，因为在干涉自己身体的同时很难调动自己的情绪。你很快就读完了整本书，但还没等你把它收起来，它就凭空消失了。");
         if(get_player().get_inte100() < 30)
         {
            outputText("[pg]你觉得花时间阅读让你大受启发。");
            dynStats(DynStat.Inte(4));
         }
         else if(get_player().get_inte100() < 60)
         {
            outputText("[pg]花点时间阅读对你来说可能是件好事，你确实觉得自己变聪明了。");
            dynStats(DynStat.Inte(2));
         }
         else if(get_player().get_inte100() < 80)
         {
            outputText("[pg]读完这本小书后，你本就敏捷的思维感到更加活跃了。");
            dynStats(DynStat.Inte(1));
         }
         else
         {
            outputText("[pg]这本书的内容对你已经相当高的智力没什么帮助。");
            dynStats(DynStat.Inte(0.6));
         }
         if(get_player().get_inte() >= 25 && !get_player().hasStatusEffect(StatusEffects.KnowsArouse))
         {
            outputText("[pg]你惊讶地眨了眨眼，脑海中突然涌现出一个<b>新法术：催情。</b>");
            get_player().createStatusEffect(StatusEffects.KnowsArouse,0,0,0,0);
            return false;
         }
         if(get_player().get_inte() >= 30 && !get_player().hasStatusEffect(StatusEffects.KnowsHeal))
         {
            outputText("[pg]你惊讶地眨了眨眼，脑海中突然涌入了一个<b>新法术的知识：治疗。</b>");
            get_player().createStatusEffect(StatusEffects.KnowsHeal,0,0,0,0);
            return false;
         }
         if(get_player().get_inte() >= 40 && !get_player().hasStatusEffect(StatusEffects.KnowsMight))
         {
            outputText("[pg]你惊讶地眨了眨眼，脑海中突然涌入了一个<b>新法术的知识：力量。</b>");
            get_player().createStatusEffect(StatusEffects.KnowsMight,0,0,0,0);
         }
         return false;
      }
   }
}

