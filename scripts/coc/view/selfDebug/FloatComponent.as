package coc.view.selfDebug
{
   import com.bit101.components.NumericStepper;
   import flash.Boot;
   import flash.display.DisplayObject;
   import flash.events.Event;
   
   public class FloatComponent implements Component
   {
      
      public var stepper:NumericStepper;
      
      public var onChange:Function;
      
      public function FloatComponent(param1:Number = 0, param2:Function = undefined)
      {
         if(Boot.skip_constructor)
         {
            return;
         }
         stepper = new NumericStepper();
         stepper.set_labelPrecision(3);
         stepper.addEventListener(Event.CHANGE,doChange);
         stepper.set_value(param1);
         onChange = param2;
      }
      
      public function doChange(param1:Event) : void
      {
         stepper.set_value(Number(onChange(stepper.get_value())));
         stepper.dispatchEvent(new Event(DebugComp.UPDATED));
      }
      
      public function displayObject() : DisplayObject
      {
         return stepper;
      }
   }
}

