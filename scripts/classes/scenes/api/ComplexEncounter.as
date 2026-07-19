package classes.scenes.api
{
   import flash.Boot;
   
   public class ComplexEncounter extends GroupEncounter
   {
      
      public var _chance:Function;
      
      public function ComplexEncounter(param1:String = undefined, param2:Function = undefined, param3:Array = undefined)
      {
         if(Boot.skip_constructor)
         {
            return;
         }
         super(param1,param3);
         _chance = param2;
      }
      
      override public function encounterChance() : Number
      {
         return Number(_chance());
      }
   }
}

