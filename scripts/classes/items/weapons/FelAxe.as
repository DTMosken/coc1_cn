package classes.items.weapons
{
   import classes.CoC;
   import classes.DynStat;
   import classes.TimeAwareInterface;
   import classes.items.Weapon;
   import flash.Boot;
   
   public class FelAxe extends Weapon implements TimeAwareInterface
   {
      
      public function FelAxe()
      {
         if(Boot.skip_constructor)
         {
            return;
         }
         super("Fel Axe","Fel Axe","tainted felling axe","a tainted felling axe",["swing","chop"],11,150,"A felling axe, designed to specialize in bringing down trees, but more than capable of bringing down people just the same. This weapon feels tainted by its former wielder, and the slowly tapered edge is extremely sharp. Of course, in addition to chopping down foes, it remains convenient to carry in the event you want to fell an actual tree with it.",["Axe"]);
         CoC.timeAwareClassAdd(this);
      }
      
      public function timeChangeLarge() : Boolean
      {
         return false;
      }
      
      public function timeChange() : Boolean
      {
         if(int(get_time().hours % 7) == 0 && get_player().cor < 33 && get_player().get_weapon() is FelAxe)
         {
            outputText("[pg]你的斧头在你的[hands]里感觉温暖而沉重。");
            dynStats(DynStat.Cor(0.5));
         }
         return false;
      }
   }
}

