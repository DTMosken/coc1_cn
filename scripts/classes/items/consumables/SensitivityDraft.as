package classes.items.consumables
{
   import classes.DynStat;
   import classes.Player;
   import classes.StatusEffects;
   import classes.internals.Utils;
   import classes.items.Consumable;
   import flash.Boot;
   
   public class SensitivityDraft extends Consumable
   {
      
      public static var ITEM_VALUE:int = 15;
      
      public function SensitivityDraft()
      {
         if(Boot.skip_constructor)
         {
            return;
         }
         super("SensDrf","Sens. Draft","a bottle of sensitivity draft",15,"This carefully labeled potion is a \'Sensitivity Draft\', and if the diagrams are any indication, it will make your body more sensitive.");
      }
      
      override public function useItem() : Boolean
      {
         get_player().slimeFeed();
         outputText("你拔掉这个小药瓶的软木塞，喝下里面清澈的液体。它让你的嘴唇和舌头产生一种奇怪的刺痛感，让你能感觉到嘴里的每一滴唾液，以及滑过嘴唇的每一次呼吸。");
         if(get_player().hasStatusEffect(StatusEffects.Dysfunction))
         {
            outputText("[pg]谢天谢地，这剂药水让你腹股沟重新焕发活力，用原始的快感取代了麻木。看来你的胯部已经恢复正常，<b>你又可以自慰了！</b>");
            get_player().removeStatusEffect(StatusEffects.Dysfunction);
         }
         if(Utils.rand(4) == 0 && !get_player().hasStatusEffect(StatusEffects.LustyTongue))
         {
            outputText("你嘴里持续的刺痛感越来越强烈，尤其是嘴唇周围，直到它们感觉像");
            if(get_player().hasVagina())
            {
               outputText("你的");
            }
            else
            {
               outputText("女人的");
            }
            outputText("下唇。你必须小心不要舔到它们！");
            get_player().createStatusEffect(StatusEffects.LustyTongue,25,0,0,0);
         }
         outputText("[pg]在感觉的浪潮过去后，你的[skindesc]对触摸变得更加敏感。");
         if(get_player().get_lust100() > 70 || get_player().get_lib100() > 70)
         {
            outputText("你颤抖着，想着这会让做爱和自慰变得多么美妙。");
         }
         else
         {
            outputText("你担心这会让你更难抵抗恶魔的诱惑。");
         }
         dynStats(DynStat.Sens(10),DynStat.Lust(5));
         get_player().refillHunger(5);
         return false;
      }
   }
}

