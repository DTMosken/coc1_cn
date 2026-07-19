package classes.items.weapons
{
   import classes.internals._ValueFunc.NumberFunc_Impl_;
   import classes.items.Weapon;
   import flash.Boot;
   
   public class LethiciteStaff extends Weapon
   {
      
      public function LethiciteStaff()
      {
         if(Boot.skip_constructor)
         {
            return;
         }
         set_weightCategory("Medium");
         super("L.Staff","Lethicite Staff","lethicite staff","a lethicite staff",["smack"],14,1337,"This staff is made of a dark material and seems to tingle to the touch. The top consists of a glowing lethicite orb. Somehow you know this will greatly empower your spellcasting abilities.",["Magic","Staff"]);
         boost("法术修正",NumberFunc_Impl_.fromInt(80),false);
      }
      
      override public function get_armorMod() : Number
      {
         if(isChanneling())
         {
            return 0;
         }
         return 1;
      }
   }
}

