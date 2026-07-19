package coc.view.selfDebug
{
   import com.bit101.components.InputText;
   import flash.Boot;
   import flash.display.DisplayObject;
   import flash.events.Event;
   
   public class StringComponent implements Component
   {
      
      public var textField:InputText;
      
      public var onChange:Function;
      
      public function StringComponent(param1:String = undefined, param2:Function = undefined)
      {
         if(Boot.skip_constructor)
         {
            return;
         }
         textField = new InputText();
         textField.set_text(param1);
         onChange = param2;
         textField.addEventListener(Event.CHANGE,handleChanged);
      }
      
      public function handleChanged(param1:Event) : void
      {
         textField.set_text(onChange(textField.get_text()));
         textField.dispatchEvent(new Event(DebugComp.UPDATED));
      }
      
      public function displayObject() : DisplayObject
      {
         return textField;
      }
   }
}

