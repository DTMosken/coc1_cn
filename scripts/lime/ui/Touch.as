package lime.ui
{
   import flash.Boot;
   import lime.app._Event_lime_ui_Touch_Void;
   
   public class Touch
   {
      
      public static var init__:Boolean;
      
      public static var onCancel:_Event_lime_ui_Touch_Void;
      
      public static var onEnd:_Event_lime_ui_Touch_Void;
      
      public static var onMove:_Event_lime_ui_Touch_Void;
      
      public static var onStart:_Event_lime_ui_Touch_Void;
      
      public var y:Number;
      
      public var x:Number;
      
      public var pressure:Number;
      
      public var id:int;
      
      public var dy:Number;
      
      public var dx:Number;
      
      public var device:int;
      
      public function Touch(param1:Number = 0, param2:Number = 0, param3:int = 0, param4:Number = 0, param5:Number = 0, param6:Number = 0, param7:int = 0)
      {
         if(Boot.skip_constructor)
         {
            return;
         }
         x = param1;
         y = param2;
         id = param3;
         dx = param4;
         dy = param5;
         pressure = param6;
         device = param7;
      }
   }
}

