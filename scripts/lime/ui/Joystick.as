package lime.ui
{
   import flash.Boot;
   import haxe.IMap;
   import haxe.ds.IntMap;
   import lime.app._Event_Int_Float_Void;
   import lime.app._Event_Int_Void;
   import lime.app._Event_Int_lime_ui_JoystickHatPosition_Void;
   import lime.app._Event_Void_Void;
   import lime.app._Event_lime_ui_Joystick_Void;
   
   public class Joystick
   {
      
      public static var init__:Boolean;
      
      public static var devices:IMap;
      
      public static var onConnect:_Event_lime_ui_Joystick_Void;
      
      public var onHatMove:_Event_Int_lime_ui_JoystickHatPosition_Void;
      
      public var onDisconnect:_Event_Void_Void;
      
      public var onButtonUp:_Event_Int_Void;
      
      public var onButtonDown:_Event_Int_Void;
      
      public var onAxisMove:_Event_Int_Float_Void;
      
      public var id:int;
      
      public var connected:Boolean;
      
      public function Joystick(param1:int = 0)
      {
         if(Boot.skip_constructor)
         {
            return;
         }
         onHatMove = new _Event_Int_lime_ui_JoystickHatPosition_Void();
         onDisconnect = new _Event_Void_Void();
         onButtonUp = new _Event_Int_Void();
         onButtonDown = new _Event_Int_Void();
         onAxisMove = new _Event_Int_Float_Void();
         id = param1;
         connected = true;
      }
      
      public static function __connect(param1:int) : void
      {
         var _loc3_:* = null as Joystick;
         var _loc2_:IMap = Joystick.devices;
         if(!(param1 in _loc2_.h))
         {
            _loc3_ = new Joystick(param1);
            Joystick.devices.h[param1] = _loc3_;
            Joystick.onConnect.dispatch(_loc3_);
         }
      }
      
      public static function __disconnect(param1:int) : void
      {
         var _loc2_:Joystick = Joystick.devices.h[param1];
         if(_loc2_ != null)
         {
            _loc2_.connected = false;
         }
         Joystick.devices.remove(param1);
         if(_loc2_ != null)
         {
            _loc2_.onDisconnect.dispatch();
         }
      }
      
      public function get_numHats() : int
      {
         return 0;
      }
      
      public function get_numButtons() : int
      {
         return 0;
      }
      
      public function get_numAxes() : int
      {
         return 0;
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

