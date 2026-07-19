package coc.view.selfDebug
{
   import com.bit101.components.PushButton;
   import flash.Boot;
   import flash.display.DisplayObject;
   import flash.events.Event;
   import flash.events.MouseEvent;
   
   public class BoolComponent implements Component
   {
      
      public var onChange:Function;
      
      public var button:PushButton;
      
      public function BoolComponent(param1:Boolean = false, param2:Function = undefined)
      {
         if(Boot.skip_constructor)
         {
            return;
         }
         button = new PushButton();
         button.set_toggle(true);
         button.set_selected(param1);
         button.set_label("" + param1);
         onChange = param2;
         button.addEventListener(MouseEvent.CLICK,handleChanged);
      }
      
      public function handleChanged(param1:MouseEvent) : void
      {
         var _loc2_:Boolean = Boolean(onChange(button.get_selected()));
         button.set_label("" + _loc2_);
         button.set_selected(_loc2_);
         button.dispatchEvent(new Event(DebugComp.UPDATED));
      }
      
      public function displayObject() : DisplayObject
      {
         return button;
      }
   }
}

