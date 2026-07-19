package motion._Actuate
{
   import flash.Boot;
   import motion.Actuate;
   import motion.actuators.GenericActuator;
   import motion.actuators.IGenericActuator;
   import motion.actuators.TransformActuator;
   
   public class TransformOptions
   {
      
      public var target:Object;
      
      public var overwrite:Boolean;
      
      public var duration:Number;
      
      public function TransformOptions(param1:Object = undefined, param2:Number = 0, param3:Boolean = false)
      {
         if(Boot.skip_constructor)
         {
            return;
         }
         target = param1;
         duration = param2;
         overwrite = param3;
      }
      
      public function sound(param1:Object = undefined, param2:Object = undefined) : IGenericActuator
      {
         var _loc3_:* = {};
         if(param1 != null)
         {
            _loc3_.soundVolume = param1;
         }
         if(param2 != null)
         {
            _loc3_.soundPan = param2;
         }
         return Actuate.tween(target,duration,_loc3_,overwrite,TransformActuator);
      }
      
      public function color(param1:int = 0, param2:Number = 1, param3:Object = undefined) : IGenericActuator
      {
         var _loc4_:* = {
            "colorValue":param1,
            "colorStrength":param2
         };
         if(param3 != null)
         {
            _loc4_.colorAlpha = param3;
         }
         return Actuate.tween(target,duration,_loc4_,overwrite,TransformActuator);
      }
   }
}

