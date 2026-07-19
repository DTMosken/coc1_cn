package classes.items.armors
{
   import classes.Player;
   import classes.internals._ValueFunc.NumberFunc_Impl_;
   import classes.items.Armor;
   import classes.items.Undergarment;
   import classes.items.UndergarmentLib;
   import flash.Boot;
   
   public class AdventurersLewdChain extends Armor
   {
      
      public function AdventurersLewdChain()
      {
         if(Boot.skip_constructor)
         {
            return;
         }
         super("AdvLChn","Kokiri Lewd Chain","lewd green adventurer\'s tunic","a pantsless green adventurer\'s tunic-over-chain outfit, complete with pointed cap",7,250,"A set of comfortable green adventurer\'s clothes over well made chainmail. It comes complete with a pointed hat.","Medium");
         boost("挑逗几率",NumberFunc_Impl_.fromIntFun(getTeaseBonus),false);
         boost("挑逗伤害",NumberFunc_Impl_.fromIntFun(getTeaseBonus),false);
      }
      
      override public function useText() : void
      {
         outputText("你[if (!isnaked) {先脱光衣服，然后}]穿上了那件淫荡的冒险者锁子甲。套上短袖束腰外衣时，你意识到加上锁子甲后它重了多少，随后你在臀部上方紧紧系上腰带。显然，伊冯很贴心地收紧了外衣的腰部，让它能自然地展现出你的腰身。而且外衣的下摆刚好只到你的大腿，一想到只要弯下腰就能轻易露出你的[butt]，你的脸上就泛起了一阵红晕。");
         outputText("[pg]滑入护手，现在护腕的皮革之间也用锁链加固了，你的手指从手套的另一端伸了出来。");
         outputText("[pg]最后，你穿上了伊冯擅自改动过的靴子。以前坚韧的皮革一直延伸到膝盖下方，现在却勉强盖住你的脚踝！增加的鞋跟突显了你光裸的双腿，让你的脊背窜起一阵兴奋的战栗。");
      }
      
      public function getTeaseBonus() : int
      {
         if(get_player().hasCock() && get_player().get_lowerGarment() == get_undergarments().EBNRJCK || get_player().get_lowerGarment() == get_undergarments().EBNJOCK)
         {
            return 8;
         }
         return 6;
      }
   }
}

