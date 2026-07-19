package classes
{
   import flash.Boot;
   
   public class StatStore
   {
      
      public var tou:Number;
      
      public var str:Number;
      
      public var spe:Number;
      
      public var sens:Number;
      
      public var lust:Number;
      
      public var lib:Number;
      
      public var inte:Number;
      
      public var hunger:Number;
      
      public var hp:Number;
      
      public var fatigue:Number;
      
      public var cor:Number;
      
      public function StatStore(param1:Number = 0, param2:Number = 0, param3:Number = 0, param4:Number = 0, param5:Number = 0, param6:Number = 0, param7:Number = 0, param8:Number = 0, param9:Number = 0, param10:Number = 0, param11:Number = 0)
      {
         if(Boot.skip_constructor)
         {
            return;
         }
         str = param1;
         tou = param2;
         spe = param3;
         inte = param4;
         sens = param5;
         lib = param6;
         cor = param7;
         hp = param8;
         lust = param9;
         fatigue = param10;
         hunger = param11;
      }
   }
}

