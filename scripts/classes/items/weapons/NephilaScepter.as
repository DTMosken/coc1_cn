package classes.items.weapons
{
   import classes.StatusEffects;
   import classes.internals._ValueFunc.NumberFunc_Impl_;
   import classes.items.Weapon;
   import flash.Boot;
   
   public class NephilaScepter extends Weapon
   {
      
      public function NephilaScepter()
      {
         if(Boot.skip_constructor)
         {
            return;
         }
         set_weightCategory("Heavy");
         super("N.Scepter","Nephila Scepter","nephila scepter","the nephila scepter",["smack","wallop"],8,800,"A gilt wooden scepter. It\'s the length of a magus\'s staff, but much girthier, and carved with reliefs of pregnant women in coitus with members of many different races. A carved sculpture of a hypermassively pregnant goddess crowns the scepter\'s top, her belly represented by a single, fist sized ruby. Her legs are spread wide, and the other figures on the scepter are depicted swirling either into or out from her swollen puss. The faces of the lovers reflect through the goddess\'s gemstone belly, their looks of ecstasy transformed to looks of torture within it. As you heft it, the scepter fills you with power and a distinctly magical feeling of cold purpose",["Magic","Staff","Blunt"]);
         boost("法术修正",NumberFunc_Impl_.fromFloatFun(getSpellBonus),false);
      }
      
      public function getSpellBonus() : Number
      {
         return 45 + int(get_player().statusEffectv1(StatusEffects.ParasiteNephila) * 2);
      }
   }
}

