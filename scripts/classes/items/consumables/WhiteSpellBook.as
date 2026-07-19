package classes.items.consumables
{
   import classes.DynStat;
   import classes.Player;
   import classes.StatusEffects;
   import classes.items.Consumable;
   import flash.Boot;
   
   public class WhiteSpellBook extends Consumable
   {
      
      public static var ITEM_VALUE:int = 40;
      
      public function WhiteSpellBook()
      {
         if(Boot.skip_constructor)
         {
            return;
         }
         super("W. Book","White Book","a small book with a pristine white cover",40,"This white book is totally unmarked, and the cover is devoid of any lettering or title. A shiny brass clasp keeps the covers closed until you are ready to read it.");
      }
      
      override public function useItem() : Boolean
      {
         outputText("你打开这本白色的书，发现这是一本关于使用白魔法的指导书。里面大部分都是关于白魔法的通用信息——它是如何通过精神集中来提取的，在疲劳或兴奋时很难使用，并且可以用来创造和控制能量。你很快就读完了整本书，但在你把它收起来之前，它就凭空消失了。");
         if(get_player().get_inte100() < 30)
         {
            outputText("[pg]你觉得花时间阅读让你大受启发。");
            dynStats(DynStat.Inte(4));
         }
         else if(get_player().get_inte100() < 60)
         {
            outputText("[pg]花点时间阅读对你来说可能是有好处的，你绝对觉得自己因此变得更聪明了。");
            dynStats(DynStat.Inte(2));
         }
         else if(get_player().get_inte100() < 80)
         {
            outputText("[pg]读完这本小书后，你原本就敏捷的头脑感到精力充沛。");
            dynStats(DynStat.Inte(1));
         }
         else
         {
            outputText("[pg]这本书的内容对你原本就相当高的智力几乎没有什么帮助。");
            dynStats(DynStat.Inte(0.6));
         }
         if(get_player().get_inte100() >= 25 && !get_player().hasStatusEffect(StatusEffects.KnowsCharge))
         {
            outputText("[pg]你惊讶地眨了眨眼，脑海中涌入了一个<b>新法术的知识：充能武器。</b>");
            get_player().createStatusEffect(StatusEffects.KnowsCharge,0,0,0,0);
            return false;
         }
         if(get_player().get_inte100() >= 30 && !get_player().hasStatusEffect(StatusEffects.KnowsBlind))
         {
            outputText("[pg]你惊讶地眨了眨眼，脑海中涌入了一个<b>新法术的知识：致盲。</b>");
            get_player().createStatusEffect(StatusEffects.KnowsBlind,0,0,0,0);
            return false;
         }
         if(get_player().get_inte100() >= 40 && !get_player().hasStatusEffect(StatusEffects.KnowsWhitefire))
         {
            outputText("[pg]你惊讶地眨了眨眼，脑海中涌入了一个<b>新法术的知识：白火。</b>");
            get_player().createStatusEffect(StatusEffects.KnowsWhitefire,0,0,0,0);
         }
         return false;
      }
   }
}

