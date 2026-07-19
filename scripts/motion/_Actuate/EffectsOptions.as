package motion._Actuate
{
   import flash.Boot;
   import flash.display.DisplayObject;
   import motion.Actuate;
   import motion.actuators.FilterActuator;
   import motion.actuators.GenericActuator;
   import motion.actuators.IGenericActuator;
   
   public class EffectsOptions
   {
      
      public var target:DisplayObject;
      
      public var overwrite:Boolean;
      
      public var duration:Number;
      
      public function EffectsOptions(param1:DisplayObject = undefined, param2:Number = 0, param3:Boolean = false)
      {
         if(Boot.skip_constructor)
         {
            return;
         }
         target = param1;
         duration = param2;
         overwrite = param3;
      }
      
      public function filter(param1:*, param2:*) : IGenericActuator
      {
         param2.filter = param1;
         return Actuate.tween(target,duration,param2,overwrite,FilterActuator);
      }
   }
}

