package classes.perks
{
   import classes.Perk;
   import classes.PerkType;
   import flash.Boot;
   
   public class ScatteringPerk extends PerkType
   {
      
      public function ScatteringPerk()
      {
         if(Boot.skip_constructor)
         {
            return;
         }
         super("Scattering","Scattering","Missed attacks still deal some damage.");
      }
      
      override public function keepOnAscension(param1:Boolean = false) : Boolean
      {
         return false;
      }
      
      override public function desc(param1:Perk = undefined) : String
      {
         return "未命中的攻击仍会造成<b>" + param1.value1 * 100 + "%</b>的伤害";
      }
   }
}

