package lime.ui
{
   import flash.Boot;
   import haxe.IMap;
   import haxe.ds.IntMap;
   import lime.app._Event_Void_Void;
   import lime.app._Event_lime_ui_GamepadAxis_Float_Void;
   import lime.app._Event_lime_ui_GamepadButton_Void;
   import lime.app._Event_lime_ui_Gamepad_Void;
   
   public class Gamepad
   {
      
      public static var init__:Boolean;
      
      public static var devices:IMap;
      
      public static var onConnect:_Event_lime_ui_Gamepad_Void;
      
      public var onDisconnect:_Event_Void_Void;
      
      public var onButtonUp:_Event_lime_ui_GamepadButton_Void;
      
      public var onButtonDown:_Event_lime_ui_GamepadButton_Void;
      
      public var onAxisMove:_Event_lime_ui_GamepadAxis_Float_Void;
      
      public var id:int;
      
      public var connected:Boolean;
      
      public function Gamepad(param1:int = 0)
      {
         if(Boot.skip_constructor)
         {
            return;
         }
         onDisconnect = new _Event_Void_Void();
         onButtonUp = new _Event_lime_ui_GamepadButton_Void();
         onButtonDown = new _Event_lime_ui_GamepadButton_Void();
         onAxisMove = new _Event_lime_ui_GamepadAxis_Float_Void();
         id = param1;
         connected = true;
      }
      
      public static function addMappings(param1:Array) : void
      {
      }
      
      public static function __connect(param1:int) : void
      {
         var _loc3_:* = null as Gamepad;
         var _loc2_:IMap = Gamepad.devices;
         if(!(param1 in _loc2_.h))
         {
            _loc3_ = new Gamepad(param1);
            Gamepad.devices.h[param1] = _loc3_;
            Gamepad.onConnect.dispatch(_loc3_);
         }
      }
      
      public static function __disconnect(param1:int) : void
      {
         var _loc2_:Gamepad = Gamepad.devices.h[param1];
         if(_loc2_ != null)
         {
            _loc2_.connected = false;
         }
         Gamepad.devices.remove(param1);
         if(_loc2_ != null)
         {
            _loc2_.onDisconnect.dispatch();
         }
      }
      
      public function rumble(param1:Number, param2:Number, param3:int) : void
      {
      }
      
      public function get_name() : String
      {
         return null;
      }
      
      public function get_guid() : String
      {
         return null;
      }
   }
}

