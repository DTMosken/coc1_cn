package coc.view.selfDebug
{
   import com.bit101.components.ComboBox;
   import flash.Boot;
   import flash.display.DisplayObject;
   import flash.events.Event;
   
   public class Combo implements Component
   {
      
      public var onChange:Function;
      
      public var combo:ComboBox;
      
      public function Combo(param1:Object = undefined, param2:Function = undefined, ... rest)
      {
         var _loc7_:* = null;
         if(Boot.skip_constructor)
         {
            return;
         }
         combo = new ComboBox();
         combo.set_items(rest.copy());
         combo.addEventListener(Event.SELECT,handleSelect);
         onChange = param2;
         var _loc5_:int = 0;
         var _loc6_:Array = combo.get_items();
         while(_loc5_ < int(_loc6_.length))
         {
            _loc7_ = _loc6_[_loc5_];
            _loc5_++;
            if(_loc7_.value == param1)
            {
               combo.set_selectedItem(_loc7_);
            }
         }
      }
      
      public function handleSelect(param1:Event) : void
      {
         onChange(combo.get_selectedItem().value);
         combo.dispatchEvent(new Event(DebugComp.UPDATED));
      }
      
      public function displayObject() : DisplayObject
      {
         return combo;
      }
   }
}

