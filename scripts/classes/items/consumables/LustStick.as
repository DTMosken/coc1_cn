package classes.items.consumables
{
   import classes.DynStat;
   import classes.PerkLib;
   import classes.Player;
   import classes.StatusEffects;
   import classes.internals.Utils;
   import classes.items.Consumable;
   import flash.Boot;
   
   public final class LustStick extends Consumable
   {
      
      public function LustStick()
      {
         if(Boot.skip_constructor)
         {
            return;
         }
         super("LustStk","GoldenLipstick","a tube of golden lipstick",6,"This tube of golden lipstick is used by harpies to keep males aroused. It has aphrodisiac properties on anyone with male genitalia and is most effective when applied to the lips or groin.");
         _headerName = "金色唇膏";
      }
      
      override public function useItem() : Boolean
      {
         if(get_player().hasStatusEffect(StatusEffects.LustStickApplied))
         {
            get_player().addStatusValue(StatusEffects.LustStickApplied,1,Utils.rand(12) + 12);
            outputText("你小心翼翼地打开散发着甜香的管子，将口红涂抹在已经涂过口红的嘴唇上。<b>毫无疑问，再涂一层会让它持续更久！</b>");
            outputText("你涂完后撅起嘴唇，感觉自己化了更浓的新妆后相当性感。[pg]");
         }
         else
         {
            get_player().createStatusEffect(StatusEffects.LustStickApplied,24,0,0,0);
            outputText("你小心翼翼地打开散发着甜香的管子，将口红涂抹在嘴唇上。");
            if(get_player().hasCock())
            {
               outputText("有点刺痛，但这些药物现在对你几乎没有影响。");
            }
            else
            {
               outputText("老实说，仅仅一个吻就能让一个男人在你手中变得像烂泥一样，这让你感到惊讶。");
            }
            outputText("你涂完后撅起嘴唇，感觉自己化了新妆后相当性感。[pg]");
         }
         dynStats(DynStat.Lust(1));
         return false;
      }
      
      override public function canUse() : Boolean
      {
         if(get_player().hasCock() && !get_player().hasPerk(PerkLib.LuststickAdapted))
         {
            outputText("你看着这管口红，但觉得在自己的嘴唇上涂上一层厚厚的、能让鸡巴变硬的春药绝对是个坏主意。");
            return false;
         }
         return true;
      }
   }
}

