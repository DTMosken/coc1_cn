package coc.view.selfDebug
{
   import com.bit101.components.NumericStepper;
   import flash.Boot;
   import flash.display.DisplayObject;
   import flash.events.Event;
   
   public class IntComponent implements Component
   {
      
      public var stepper:NumericStepper;
      
      public var onChange:Function;
      
      public function IntComponent(param1:int = 0, param2:Function = undefined)
      {
         if(Boot.skip_constructor)
         {
            return;
         }
         stepper = new NumericStepper();
         var _loc3_:int = 2147483647;
         stepper.set_maximum(_loc3_);
         stepper.set_minimum(~_loc3_);
         stepper.set_labelPrecision(0);
         stepper.set_value(param1);
         stepper.addEventListener(Event.CHANGE,doChange);
         onChange = param2;
      }
      
      public function doChange(param1:Event) : void
      {
         stepper.set_value(int(onChange(int(stepper.get_value()))));
         stepper.dispatchEvent(new Event(DebugComp.UPDATED));
      }
      
      public function displayObject() : DisplayObject
      {
         return stepper;
      }
   }
}

