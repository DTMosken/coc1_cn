package classes.items.weapons
{
   import classes.internals._ValueFunc.NumberFunc_Impl_;
   import classes.items.Weapon;
   import flash.Boot;
   
   public class EldritchStaff extends Weapon
   {
      
      public function EldritchStaff()
      {
         if(Boot.skip_constructor)
         {
            return;
         }
         set_weightCategory("Medium");
         super("E.Staff","Eldritch Staff","eldritch staff","an eldritch staff",["swing","smack"],10,1000,"This eldritch staff once belonged to the Harpy Queen, who was killed after her defeat at your hands. It fairly sizzles with magical power.",["魔法","Staff"]);
         boost("法术修正",NumberFunc_Impl_.fromInt(60),false);
      }
      
      override public function get_armorMod() : Number
      {
         if(isChanneling())
         {
            return 0.3;
         }
         return 1;
      }
   }
}

