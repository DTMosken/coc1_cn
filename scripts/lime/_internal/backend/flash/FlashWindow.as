package lime._internal.backend.flash
{
   import flash.Boot;
   import flash.Lib;
   import flash.display.BitmapData;
   import flash.display.Stage;
   import flash.events.Event;
   import flash.events.FocusEvent;
   import flash.events.KeyboardEvent;
   import flash.events.MouseEvent;
   import flash.events.TouchEvent;
   import flash.geom.Matrix;
   import flash.system.Capabilities;
   import flash.ui.Mouse;
   import flash.utils.getTimer;
   import haxe.IMap;
   import haxe.ds.IntMap;
   import haxe.ds.List;
   import lime.app._Event_String_Void;
   import lime.graphics.Image;
   import lime.graphics.RenderContext;
   import lime.math.Rectangle;
   import lime.system.Display;
   import lime.system.DisplayMode;
   import lime.system.System;
   import lime.ui.MouseCursor;
   import lime.ui.MouseWheelMode;
   import lime.ui.Touch;
   import lime.ui.Window;
   
   public class FlashWindow
   {
      
      public static var windowID:int = 0;
      
      public var unusedTouchesPool:List;
      
      public var textInputRect:Rectangle;
      
      public var textInputEnabled:Boolean;
      
      public var parent:Window;
      
      public var mouseLeft:Boolean;
      
      public var frameRate:Number;
      
      public var cursor:MouseCursor;
      
      public var currentTouches:IMap;
      
      public var cacheTime:int;
      
      public var cacheMouseY:Number;
      
      public var cacheMouseX:Number;
      
      public function FlashWindow(param1:Window = undefined)
      {
         if(Boot.skip_constructor)
         {
            return;
         }
         unusedTouchesPool = new List();
         currentTouches = new IntMap();
         parent = param1;
         cacheMouseX = 0;
         cacheMouseY = 0;
         cursor = MouseCursor.DEFAULT;
         create();
      }
      
      public function warpMouse(param1:int, param2:int) : void
      {
      }
      
      public function setVisible(param1:Boolean) : Boolean
      {
         return param1;
      }
      
      public function setTitle(param1:String) : String
      {
         return param1;
      }
      
      public function setTextInputRect(param1:Rectangle) : Rectangle
      {
         return textInputRect = param1;
      }
      
      public function setTextInputEnabled(param1:Boolean) : Boolean
      {
         return textInputEnabled = param1;
      }
      
      public function setResizable(param1:Boolean) : Boolean
      {
         return param1;
      }
      
      public function setOpacity(param1:Number) : void
      {
      }
      
      public function setMouseLock(param1:Boolean) : void
      {
      }
      
      public function setMinimized(param1:Boolean) : Boolean
      {
         return false;
      }
      
      public function setMinSize(param1:int, param2:int) : void
      {
      }
      
      public function setMaximized(param1:Boolean) : Boolean
      {
         return false;
      }
      
      public function setMaxSize(param1:int, param2:int) : void
      {
      }
      
      public function setIcon(param1:Image) : void
      {
      }
      
      public function setFullscreen(param1:Boolean) : Boolean
      {
         parent.stage.displayState = param1 ? "fullScreenInteractive" : "normal";
         return param1;
      }
      
      public function setFrameRate(param1:Number) : Number
      {
         frameRate = param1;
         if(parent.stage != null)
         {
            parent.stage.frameRate = param1;
         }
         return param1;
      }
      
      public function setDisplayMode(param1:DisplayMode) : DisplayMode
      {
         return param1;
      }
      
      public function setCursor(param1:MouseCursor) : MouseCursor
      {
         var _loc2_:* = null as String;
         if(cursor != param1)
         {
            if(param1 == null)
            {
               Mouse.hide();
            }
            else
            {
               if(cursor == null)
               {
                  Mouse.show();
               }
               switch(param1.index)
               {
                  case 0:
                     _loc2_ = "arrow";
                     break;
                  case 1:
                     _loc2_ = "arrow";
                     break;
                  case 3:
                     _loc2_ = "hand";
                     break;
                  case 4:
                     _loc2_ = "button";
                     break;
                  case 5:
                     _loc2_ = "hand";
                     break;
                  case 6:
                     _loc2_ = "hand";
                     break;
                  case 7:
                     _loc2_ = "hand";
                     break;
                  case 8:
                     _loc2_ = "hand";
                     break;
                  case 9:
                     _loc2_ = "ibeam";
                     break;
                  case 10:
                     _loc2_ = "arrow";
                     break;
                  case 11:
                     _loc2_ = "arrow";
                     break;
                  default:
                     _loc2_ = "auto";
               }
               Mouse.cursor = _loc2_;
            }
            cursor = param1;
         }
         return cursor;
      }
      
      public function setBorderless(param1:Boolean) : Boolean
      {
         return param1;
      }
      
      public function resize(param1:int, param2:int) : void
      {
      }
      
      public function readPixels(param1:Rectangle) : Image
      {
         var _loc3_:* = null as Rectangle;
         var _loc4_:* = null as BitmapData;
         var _loc5_:* = null as Matrix;
         var _loc2_:Rectangle = new Rectangle(0,0,parent.stage.stageWidth,parent.stage.stageHeight);
         if(param1 == null)
         {
            param1 = _loc2_;
         }
         else
         {
            _loc3_ = param1.intersection(_loc2_);
         }
         if(param1.width > 0 && param1.height > 0)
         {
            _loc4_ = new BitmapData(int(param1.width),int(param1.height));
            _loc5_ = new Matrix();
            _loc5_.tx = -param1.x;
            _loc5_.ty = -param1.y;
            _loc4_.draw(parent.stage,_loc5_);
            return Image.fromBitmapData(_loc4_);
         }
         return null;
      }
      
      public function move(param1:int, param2:int) : void
      {
      }
      
      public function handleWindowEvent(param1:Event) : void
      {
         var _loc2_:String = param1.type;
         if(_loc2_ == Event.ACTIVATE)
         {
            parent.onActivate.dispatch();
         }
         else if(_loc2_ == Event.DEACTIVATE)
         {
            parent.onDeactivate.dispatch();
         }
         else if(_loc2_ == FocusEvent.FOCUS_IN)
         {
            parent.onFocusIn.dispatch();
         }
         else if(_loc2_ == FocusEvent.FOCUS_OUT)
         {
            parent.onFocusOut.dispatch();
         }
         else if(_loc2_ == Event.MOUSE_LEAVE)
         {
            mouseLeft = true;
            parent.onLeave.dispatch();
         }
         else if(_loc2_ == Event.RESIZE)
         {
            parent.__width = parent.stage.stageWidth;
            parent.__height = parent.stage.stageHeight;
            parent.onResize.dispatch(parent.__width,parent.__height);
         }
      }
      
      public function handleTouchEvent(param1:TouchEvent) : void
      {
         var _loc5_:* = null as Touch;
         var _loc6_:* = null as IMap;
         var _loc7_:int = 0;
         var _loc8_:Number = NaN;
         var _loc9_:Number = NaN;
         var _loc2_:Number = param1.stageX;
         var _loc3_:Number = param1.stageY;
         var _loc4_:String = param1.type;
         if(_loc4_ == TouchEvent.TOUCH_BEGIN)
         {
            _loc5_ = unusedTouchesPool.pop();
            if(_loc5_ == null)
            {
               _loc5_ = new Touch(_loc2_ / parent.__width,_loc3_ / parent.__height,param1.touchPointID,0,0,param1.pressure,parent.id);
            }
            else
            {
               _loc5_.x = _loc2_ / parent.__width;
               _loc5_.y = _loc3_ / parent.__height;
               _loc5_.id = param1.touchPointID;
               _loc5_.dx = 0;
               _loc5_.dy = 0;
               _loc5_.pressure = param1.pressure;
               _loc5_.device = parent.id;
            }
            _loc6_ = currentTouches;
            _loc7_ = param1.touchPointID;
            _loc6_.h[_loc7_] = _loc5_;
            Touch.onStart.dispatch(_loc5_);
            if(param1.isPrimaryTouchPoint)
            {
               parent.onMouseDown.dispatch(_loc2_,_loc3_,0);
            }
         }
         else if(_loc4_ == TouchEvent.TOUCH_END)
         {
            _loc6_ = currentTouches;
            _loc7_ = param1.touchPointID;
            _loc5_ = _loc6_.h[_loc7_];
            if(_loc5_ != null)
            {
               _loc8_ = _loc5_.x;
               _loc9_ = _loc5_.y;
               _loc5_.x = _loc2_ / parent.__width;
               _loc5_.y = _loc3_ / parent.__height;
               _loc5_.dx = _loc5_.x - _loc8_;
               _loc5_.dy = _loc5_.y - _loc9_;
               _loc5_.pressure = param1.pressure;
               Touch.onEnd.dispatch(_loc5_);
               currentTouches.remove(param1.touchPointID);
               unusedTouchesPool.add(_loc5_);
               if(param1.isPrimaryTouchPoint)
               {
                  parent.onMouseUp.dispatch(_loc2_,_loc3_,0);
               }
            }
         }
         else if(_loc4_ == TouchEvent.TOUCH_MOVE)
         {
            _loc6_ = currentTouches;
            _loc7_ = param1.touchPointID;
            _loc5_ = _loc6_.h[_loc7_];
            if(_loc5_ != null)
            {
               _loc8_ = _loc5_.x;
               _loc9_ = _loc5_.y;
               _loc5_.x = _loc2_ / parent.__width;
               _loc5_.y = _loc3_ / parent.__height;
               _loc5_.dx = _loc5_.x - _loc8_;
               _loc5_.dy = _loc5_.y - _loc9_;
               _loc5_.pressure = param1.pressure;
               Touch.onMove.dispatch(_loc5_);
               if(param1.isPrimaryTouchPoint)
               {
                  parent.onMouseMove.dispatch(_loc2_,_loc3_);
               }
            }
         }
      }
      
      public function handleMouseEvent(param1:MouseEvent) : void
      {
         var _loc2_:int = 0;
         var _loc4_:Number = NaN;
         var _loc5_:Number = NaN;
         var _loc3_:String = param1.type;
         while(true)
         {
            if(_loc3_ != "middleMouseDown")
            {
               if(_loc3_ != "middleMouseUp")
               {
                  if(_loc3_ != "rightMouseDown")
                  {
                     if(_loc3_ != "rightMouseUp")
                     {
                        _loc2_ = 0;
                        break;
                     }
                  }
                  _loc2_ = 2;
                  break;
               }
            }
            _loc2_ = 1;
            break;
         }
         _loc3_ = param1.type;
         if(_loc3_ == "mouseMove")
         {
            if(mouseLeft)
            {
               mouseLeft = false;
               parent.onEnter.dispatch();
            }
            _loc4_ = param1.stageX;
            _loc5_ = param1.stageY;
            parent.onMouseMove.dispatch(_loc4_,_loc5_);
            parent.onMouseMoveRelative.dispatch(_loc4_ - cacheMouseX,_loc5_ - cacheMouseY);
            cacheMouseX = _loc4_;
            cacheMouseY = _loc5_;
         }
         else if(_loc3_ == "mouseWheel")
         {
            parent.onMouseWheel.dispatch(0,param1.delta,MouseWheelMode.LINES);
         }
         else
         {
            while(true)
            {
               if(_loc3_ != "middleMouseDown")
               {
                  if(_loc3_ != "mouseDown")
                  {
                     if(_loc3_ != "rightMouseDown")
                     {
                        if(_loc3_ != "middleMouseUp")
                        {
                           if(_loc3_ != "mouseUp")
                           {
                              if(_loc3_ != "rightMouseUp")
                              {
                                 break;
                              }
                           }
                        }
                        parent.onMouseUp.dispatch(param1.stageX,param1.stageY,_loc2_);
                        break;
                     }
                  }
               }
               parent.onMouseDown.dispatch(param1.stageX,param1.stageY,_loc2_);
               break;
            }
         }
      }
      
      public function handleKeyEvent(param1:KeyboardEvent) : void
      {
         var _loc4_:* = null as _Event_String_Void;
         var _loc5_:int = 0;
         var _loc2_:int = convertKeyCode(param1.keyCode);
         var _loc3_:int = (param1.shiftKey ? 3 : 0) | (param1.ctrlKey ? 192 : 0) | (param1.altKey ? 768 : 0);
         if(param1.type == KeyboardEvent.KEY_DOWN)
         {
            parent.onKeyDown.dispatch(_loc2_,_loc3_);
            if(parent.__backend.getTextInputEnabled())
            {
               _loc4_ = parent.onTextInput;
               _loc5_ = int(param1.charCode);
               _loc4_.dispatch(_loc5_ < 65536 ? String["fromCharCode"](_loc5_) : Boot.fromCodePoint(_loc5_));
            }
         }
         else
         {
            parent.onKeyUp.dispatch(_loc2_,_loc3_);
         }
      }
      
      public function handleApplicationEvent(param1:Event) : void
      {
         var _loc2_:int = getTimer();
         var _loc3_:int = _loc2_ - cacheTime;
         cacheTime = _loc2_;
         parent.application.onUpdate.dispatch(_loc3_);
         parent.onRender.dispatch(parent.context);
      }
      
      public function getTextInputEnabled() : Boolean
      {
         return textInputEnabled;
      }
      
      public function getOpacity() : Number
      {
         return 1;
      }
      
      public function getMouseLock() : Boolean
      {
         return false;
      }
      
      public function getFrameRate() : Number
      {
         return frameRate;
      }
      
      public function getDisplayMode() : DisplayMode
      {
         return System.getDisplay(0).currentMode;
      }
      
      public function getDisplay() : Display
      {
         return System.getDisplay(0);
      }
      
      public function getCursor() : MouseCursor
      {
         return cursor;
      }
      
      public function focus() : void
      {
      }
      
      public function create() : void
      {
         var _loc1_:* = null;
         var _loc2_:int = 0;
         var _loc3_:* = null as Stage;
         var _loc4_:* = null as Array;
         var _loc5_:* = null as String;
         var _loc6_:* = null as RenderContext;
         var _loc7_:* = null;
         if(FlashApplication.createFirstWindow)
         {
            _loc1_ = parent.__attributes;
            var _temp_3:* = parent;
            var _temp_1:* = FlashWindow;
            _temp_1.windowID = (_loc2_ = int(_temp_1.windowID)) + 1;
            _temp_3.id = _loc2_;
            if(parent.stage == null)
            {
               parent.stage = Lib.current.stage;
            }
            _loc3_ = parent.stage;
            parent.__width = _loc3_.stageWidth;
            parent.__height = _loc3_.stageHeight;
            _loc3_.align = "TL";
            _loc3_.scaleMode = "noScale";
            _loc3_.addEventListener(KeyboardEvent.KEY_DOWN,handleKeyEvent);
            _loc3_.addEventListener(KeyboardEvent.KEY_UP,handleKeyEvent);
            _loc4_ = ["mouseDown","mouseMove","mouseUp","mouseWheel","middleMouseDown","middleMouseMove","middleMouseUp"];
            _loc2_ = 0;
            while(_loc2_ < int(_loc4_.length))
            {
               _loc5_ = _loc4_[_loc2_];
               _loc2_++;
               _loc3_.addEventListener(_loc5_,handleMouseEvent);
            }
            _loc3_.addEventListener(TouchEvent.TOUCH_BEGIN,handleTouchEvent);
            _loc3_.addEventListener(TouchEvent.TOUCH_MOVE,handleTouchEvent);
            _loc3_.addEventListener(TouchEvent.TOUCH_END,handleTouchEvent);
            _loc3_.addEventListener(Event.ACTIVATE,handleWindowEvent);
            _loc3_.addEventListener(Event.DEACTIVATE,handleWindowEvent);
            _loc3_.addEventListener(FocusEvent.FOCUS_IN,handleWindowEvent);
            _loc3_.addEventListener(FocusEvent.FOCUS_OUT,handleWindowEvent);
            _loc3_.addEventListener(Event.MOUSE_LEAVE,handleWindowEvent);
            _loc3_.addEventListener(Event.RESIZE,handleWindowEvent);
            _loc6_ = new RenderContext();
            _loc6_.flash = Lib.current;
            _loc6_.type = "flash";
            _loc6_.version = Capabilities.version;
            _loc6_.window = parent;
            _loc7_ = {
               "antialiasing":0,
               "background":null,
               "colorDepth":32,
               "depth":false,
               "hardware":false,
               "stencil":false,
               "type":"flash",
               "version":Capabilities.version,
               "vsync":false
            };
            if(Reflect.hasField(_loc1_,"context") && Reflect.hasField(_loc1_.context,"background") && _loc1_.context.background != null)
            {
               _loc3_.color = _loc1_.context.background;
               _loc7_.background = _loc3_.color;
            }
            setFrameRate(Reflect.hasField(_loc1_,"frameRate") ? Number(_loc1_.frameRate) : 60);
            _loc6_.attributes = _loc7_;
            parent.context = _loc6_;
            cacheTime = getTimer();
            _loc3_.addEventListener(Event.ENTER_FRAME,handleApplicationEvent);
         }
      }
      
      public function convertKeyCode(param1:int) : int
      {
         if(param1 >= 65 && param1 <= 90)
         {
            return param1 + 32;
         }
         switch(param1)
         {
            case 16:
               return 1073742049;
            case 17:
               return 1073742048;
            case 18:
               return 1073742050;
            case 20:
               return 1073741881;
            case 33:
               return 1073741899;
            case 34:
               return 1073741902;
            case 35:
               return 1073741901;
            case 36:
               return 1073741898;
            case 37:
               return 1073741904;
            case 38:
               return 1073741906;
            case 39:
               return 1073741903;
            case 40:
               return 1073741905;
            case 45:
               return 1073741897;
            case 46:
               return 127;
            case 96:
               return 1073741922;
            case 97:
               return 1073741913;
            case 98:
               return 1073741914;
            case 99:
               return 1073741915;
            case 100:
               return 1073741916;
            case 101:
               return 1073741917;
            case 102:
               return 1073741918;
            case 103:
               return 1073741919;
            case 104:
               return 1073741920;
            case 105:
               return 1073741921;
            case 106:
               return 1073741909;
            case 107:
               return 1073741911;
            case 108:
               return 1073741912;
            case 109:
               return 1073741910;
            case 110:
               return 1073741923;
            case 111:
               return 1073741908;
            case 112:
               return 1073741882;
            case 113:
               return 1073741883;
            case 114:
               return 1073741884;
            case 115:
               return 1073741885;
            case 116:
               return 1073741886;
            case 117:
               return 1073741887;
            case 118:
               return 1073741888;
            case 119:
               return 1073741889;
            case 120:
               return 1073741890;
            case 121:
               return 1073741891;
            case 122:
               return 1073741892;
            case 123:
               return 1073741893;
            case 124:
               return 1073741928;
            case 125:
               return 1073741929;
            case 126:
               return 1073741930;
            case 144:
               return 1073741907;
            case 186:
               return 59;
            case 187:
               return 61;
            case 188:
               return 44;
            case 189:
               return 45;
            case 190:
               return 46;
            case 191:
               return 47;
            case 192:
               return 96;
            case 219:
               return 91;
            case 220:
               return 92;
            case 221:
               return 93;
            case 222:
               return 39;
            default:
               return param1;
         }
      }
      
      public function close() : void
      {
         parent.application.__removeWindow(parent);
      }
      
      public function alert(param1:String, param2:String) : void
      {
      }
   }
}

