package classes.perks
{
   import classes.Perk;
   import classes.PerkType;
   import flash.Boot;
   
   public class WizardsFocusPerk extends PerkType
   {
      
      public function WizardsFocusPerk()
      {
         if(Boot.skip_constructor)
         {
            return;
         }
         super("Wizard\'s Focus","Wizard\'s Focus","Your wizard\'s staff grants you additional focus, reducing the use of fatigue for spells.");
      }
      
      override public function keepOnAscension(param1:Boolean = false) : Boolean
      {
         return false;
      }
      
      override public function desc(param1:Perk = undefined) : String
      {
         return "你的法术效果修正提高 <b>" + param1.value1 * 100 + "%</b>。";
      }
   }
}

