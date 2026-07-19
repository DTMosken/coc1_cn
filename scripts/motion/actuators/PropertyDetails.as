package motion.actuators
{
   import flash.Boot;
   
   public class PropertyDetails
   {
      
      public var target:Object;
      
      public var start:Number;
      
      public var propertyName:String;
      
      public var isField:Boolean;
      
      public var change:Number;
      
      public function PropertyDetails(param1:Object = undefined, param2:String = undefined, param3:Number = 0, param4:Number = 0, param5:Boolean = true)
      {
         if(Boot.skip_constructor)
         {
            return;
         }
         target = param1;
         propertyName = param2;
         start = param3;
         change = param4;
         isField = param5;
      }
   }
}

