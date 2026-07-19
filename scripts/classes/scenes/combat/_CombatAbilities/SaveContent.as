package classes.scenes.combat._CombatAbilities
{
   import flash.Boot;
   
   public class SaveContent
   {
      
      public var abilityUsage:*;
      
      public function SaveContent(param1:* = undefined)
      {
         if(Boot.skip_constructor)
         {
            return;
         }
         abilityUsage = {};
         if(param1 != null)
         {
            abilityUsage = param1;
         }
      }
   }
}

