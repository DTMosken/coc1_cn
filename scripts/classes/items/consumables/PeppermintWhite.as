package classes.items.consumables
{
   import classes.Player;
   import classes.items.Consumable;
   import flash.Boot;
   
   public class PeppermintWhite extends Consumable
   {
      
      public function PeppermintWhite()
      {
         if(Boot.skip_constructor)
         {
            return;
         }
         super("PeppWht","Mint White","a vial of peppermint white",120,"This tightly corked glass bottle gives off a peppermint-like smell and reminds you of the winter holidays. How odd.");
      }
      
      override public function useItem() : Boolean
      {
         outputText("你拔下神秘陌生人送的礼物的软木塞。迷人的薄荷香味再次充满你的鼻腔。你把瓶口凑到唇边，仰起头，乳白色的液体落在你的舌头上，滑下你的喉咙。这种液体出人意料地令人耳目一新，奶油薄荷的味道萦绕在你的舌头和口腔里，当你呼气时，你的呼吸感觉凉飕飕的。你能感觉到液体滴入你的胃里，让你充满了一种愉快的温暖和节日的欢乐。[pg]");
         get_player().HPChange(get_player().maxHP(),true);
         get_player().changeFatigue(-100);
         return false;
      }
   }
}

