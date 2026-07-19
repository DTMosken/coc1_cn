package classes.items.consumables
{
   import classes.DynStat;
   import classes.Player;
   import classes.items.Consumable;
   import flash.Boot;
   
   public class NumbingOil extends Consumable
   {
      
      public static var ITEM_VALUE:int = 100;
      
      public function NumbingOil()
      {
         if(Boot.skip_constructor)
         {
            return;
         }
         super("NumbOil","Numbing Oil","a bottle of numbing oil",100,"This bottle feels a bit warm to the touch. From the look of the label on the bottle of oil, you suspect this will make you less sensitive.");
      }
      
      override public function useItem() : Boolean
      {
         outputText("你打开瓶子，开始把油倒满全身。[pg]");
         if(get_player().get_sens100() < 20)
         {
            outputText("你的皮肤微微刺痛，之后，你感觉比以前不那么敏感了。");
         }
         if(get_player().get_sens100() >= 20 && get_player().get_sens100() < 40)
         {
            outputText("你的皮肤有点灼痛，但最终灼痛感消退了，让你的皮肤比以前不那么敏感了。");
         }
         if(get_player().get_sens100() >= 40 && get_player().get_sens100() < 60)
         {
            outputText("你的皮肤灼痛发痒，难以忍受地持续了几分钟，但最终恢复了正常。你感觉比以前不那么敏感了。");
         }
         if(get_player().get_sens100() >= 60)
         {
            outputText("当你把油涂抹完皮肤后，你喘着粗气跪倒在地。感觉就像有人把你点着了，而且那火是由咬人的蚂蚁组成的。你在痛苦中挣扎了几分钟，直到感觉消退。你感觉比以前稍微不那么敏感了。");
         }
         var _loc1_:Number = 5 + Math.floor(get_player().sens / 10);
         dynStats(DynStat.Sens(-_loc1_));
         return false;
      }
   }
}

