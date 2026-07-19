package lime.ui
{
   import flash.Boot;
   import flash.display.Stage;
   import lime._internal.backend.flash.FlashWindow;
   import lime.app.Application;
   import lime.app._Event_Float_Float_Int_Void;
   import lime.app._Event_Float_Float_Void;
   import lime.app._Event_Float_Float_lime_ui_MouseButton_Void;
   import lime.app._Event_Float_Float_lime_ui_MouseWheelMode_Void;
   import lime.app._Event_Int_Int_Void;
   import lime.app._Event_String_Int_Int_Void;
   import lime.app._Event_String_Void;
   import lime.app._Event_Void_Void;
   import lime.app._Event_lime_graphics_RenderContext_Void;
   import lime.app._Event_lime_ui_KeyCode_lime_ui_KeyModifier_Void;
   import lime.graphics.Image;
   import lime.graphics.RenderContext;
   import lime.math.Rectangle;
   import lime.system.Display;
   import lime.system.DisplayMode;
   
   public class Window
   {
      
      public var stage:Stage;
      
      public var scale:Number;
      
      public var parameters:*;
      
      public var onTextInput:_Event_String_Void;
      
      public var onTextEdit:_Event_String_Int_Int_Void;
      
      public var onShow:_Event_Void_Void;
      
      public var onRestore:_Event_Void_Void;
      
      public var onResize:_Event_Int_Int_Void;
      
      public var onRenderContextRestored:_Event_lime_graphics_RenderContext_Void;
      
      public var onRenderContextLost:_Event_Void_Void;
      
      public var onRender:_Event_lime_graphics_RenderContext_Void;
      
      public var onMove:_Event_Float_Float_Void;
      
      public var onMouseWheel:_Event_Float_Float_lime_ui_MouseWheelMode_Void;
      
      public var onMouseUp:_Event_Float_Float_Int_Void;
      
      public var onMouseMoveRelative:_Event_Float_Float_Void;
      
      public var onMouseMove:_Event_Float_Float_Void;
      
      public var onMouseDown:_Event_Float_Float_lime_ui_MouseButton_Void;
      
      public var onMinimize:_Event_Void_Void;
      
      public var onMaximize:_Event_Void_Void;
      
      public var onLeave:_Event_Void_Void;
      
      public var onKeyUp:_Event_lime_ui_KeyCode_lime_ui_KeyModifier_Void;
      
      public var onKeyDown:_Event_lime_ui_KeyCode_lime_ui_KeyModifier_Void;
      
      public var onHide:_Event_Void_Void;
      
      public var onFullscreen:_Event_Void_Void;
      
      public var onFocusOut:_Event_Void_Void;
      
      public var onFocusIn:_Event_Void_Void;
      
      public var onExpose:_Event_Void_Void;
      
      public var onEnter:_Event_Void_Void;
      
      public var onDropFile:_Event_String_Void;
      
      public var onDeactivate:_Event_Void_Void;
      
      public var onClose:_Event_Void_Void;
      
      public var onActivate:_Event_Void_Void;
      
      public var id:int;
      
      public var hidden:Boolean;
      
      public var element:*;
      
      public var display:Display;
      
      public var context:RenderContext;
      
      public var clickCount:int;
      
      public var application:Application;
      
      public var __y:int;
      
      public var __x:int;
      
      public var __width:int;
      
      public var __title:String;
      
      public var __scale:Number;
      
      public var __resizable:Boolean;
      
      public var __minimized:Boolean;
      
      public var __minWidth:int;
      
      public var __minHeight:int;
      
      public var __maximized:Boolean;
      
      public var __maxWidth:int;
      
      public var __maxHeight:int;
      
      public var __hidden:Boolean;
      
      public var __height:int;
      
      public var __fullscreen:Boolean;
      
      public var __borderless:Boolean;
      
      public var __backend:FlashWindow;
      
      public var __attributes:Object;
      
      public function Window(param1:Application = undefined, param2:Object = undefined)
      {
         if(Boot.skip_constructor)
         {
            return;
         }
         __maxHeight = 2147483647;
         __maxWidth = 2147483647;
         __minHeight = 0;
         __minWidth = 0;
         clickCount = 0;
         onTextInput = new _Event_String_Void();
         onTextEdit = new _Event_String_Int_Int_Void();
         onShow = new _Event_Void_Void();
         onRestore = new _Event_Void_Void();
         onResize = new _Event_Int_Int_Void();
         onRenderContextRestored = new _Event_lime_graphics_RenderContext_Void();
         onRenderContextLost = new _Event_Void_Void();
         onRender = new _Event_lime_graphics_RenderContext_Void();
         onMove = new _Event_Float_Float_Void();
         onMouseWheel = new _Event_Float_Float_lime_ui_MouseWheelMode_Void();
         onMouseUp = new _Event_Float_Float_Int_Void();
         onMouseMoveRelative = new _Event_Float_Float_Void();
         onMouseMove = new _Event_Float_Float_Void();
         onMouseDown = new _Event_Float_Float_lime_ui_MouseButton_Void();
         onMinimize = new _Event_Void_Void();
         onMaximize = new _Event_Void_Void();
         onLeave = new _Event_Void_Void();
         onKeyUp = new _Event_lime_ui_KeyCode_lime_ui_KeyModifier_Void();
         onKeyDown = new _Event_lime_ui_KeyCode_lime_ui_KeyModifier_Void();
         onHide = new _Event_Void_Void();
         onFullscreen = new _Event_Void_Void();
         onFocusOut = new _Event_Void_Void();
         onFocusIn = new _Event_Void_Void();
         onExpose = new _Event_Void_Void();
         onEnter = new _Event_Void_Void();
         onDropFile = new _Event_String_Void();
         onDeactivate = new _Event_Void_Void();
         onClose = new _Event_Void_Void();
         onActivate = new _Event_Void_Void();
         application = param1;
         __attributes = param2 != null ? param2 : {};
         if(Reflect.hasField(__attributes,"parameters"))
         {
            parameters = __attributes.parameters;
         }
         __width = 0;
         __height = 0;
         __fullscreen = false;
         __scale = 1;
         __x = 0;
         __y = 0;
         __title = Reflect.hasField(__attributes,"title") ? __attributes.title : "";
         __hidden = false;
         __borderless = Reflect.hasField(__attributes,"borderless") && Boolean(__attributes.borderless);
         __resizable = Reflect.hasField(__attributes,"resizable") && Boolean(__attributes.resizable);
         __maximized = Reflect.hasField(__attributes,"maximized") && Boolean(__attributes.maximized);
         __minimized = Reflect.hasField(__attributes,"minimized") && Boolean(__attributes.minimized);
         id = -1;
         __backend = new FlashWindow(this);
      }
      
      public function warpMouse(param1:int, param2:int) : void
      {
         __backend.warpMouse(param1,param2);
      }
      
      public function toString() : String
      {
         return "[object Window]";
      }
      
      public function set_y(param1:int) : int
      {
         move(__x,param1);
         return __y;
      }
      
      public function set_x(param1:int) : int
      {
         move(param1,__y);
         return __x;
      }
      
      public function set_width(param1:int) : int
      {
         resize(param1,__height);
         return __width;
      }
      
      public function set_visible(param1:Boolean) : Boolean
      {
         __hidden = !__backend.setVisible(param1);
         return !__hidden;
      }
      
      public function set_title(param1:String) : String
      {
         return __title = __backend.setTitle(param1);
      }
      
      public function set_textInputEnabled(param1:Boolean) : Boolean
      {
         return __backend.setTextInputEnabled(param1);
      }
      
      public function set_resizable(param1:Boolean) : Boolean
      {
         __resizable = __backend.setResizable(param1);
         return __resizable;
      }
      
      public function set_opacity(param1:Number) : Number
      {
         __backend.setOpacity(param1);
         return param1;
      }
      
      public function set_mouseLock(param1:Boolean) : Boolean
      {
         __backend.setMouseLock(param1);
         return param1;
      }
      
      public function set_minimized(param1:Boolean) : Boolean
      {
         __maximized = false;
         return __minimized = __backend.setMinimized(param1);
      }
      
      public function set_minWidth(param1:int) : int
      {
         setMinSize(param1,__minHeight);
         return __minWidth;
      }
      
      public function set_minHeight(param1:int) : int
      {
         setMinSize(__minWidth,param1);
         return __minHeight;
      }
      
      public function set_maximized(param1:Boolean) : Boolean
      {
         __minimized = false;
         return __maximized = __backend.setMaximized(param1);
      }
      
      public function set_maxWidth(param1:int) : int
      {
         setMinSize(param1,__maxHeight);
         return __maxWidth;
      }
      
      public function set_maxHeight(param1:int) : int
      {
         setMaxSize(__maxWidth,param1);
         return __maxHeight;
      }
      
      public function set_height(param1:int) : int
      {
         resize(__width,param1);
         return __height;
      }
      
      public function set_fullscreen(param1:Boolean) : Boolean
      {
         return __fullscreen = __backend.setFullscreen(param1);
      }
      
      public function set_frameRate(param1:Number) : Number
      {
         return __backend.setFrameRate(param1);
      }
      
      public function set_displayMode(param1:DisplayMode) : DisplayMode
      {
         return __backend.setDisplayMode(param1);
      }
      
      public function set_cursor(param1:MouseCursor) : MouseCursor
      {
         return __backend.setCursor(param1);
      }
      
      public function set_borderless(param1:Boolean) : Boolean
      {
         return __borderless = __backend.setBorderless(param1);
      }
      
      public function setTextInputRect(param1:Rectangle) : Rectangle
      {
         return __backend.setTextInputRect(param1);
      }
      
      public function setMinSize(param1:int, param2:int) : void
      {
         __backend.setMinSize(param1,param2);
         __minWidth = param1;
         __minHeight = param2;
         if(__width < __minWidth || __height < __minHeight)
         {
            resize(__width,__height);
         }
      }
      
      public function setMaxSize(param1:int, param2:int) : void
      {
         __backend.setMaxSize(param1,param2);
         __maxWidth = param1;
         __maxHeight = param2;
         if(__width > __maxWidth || __height > __maxHeight)
         {
            resize(__width,__height);
         }
      }
      
      public function setIcon(param1:Image) : void
      {
         if(param1 == null)
         {
            return;
         }
         __backend.setIcon(param1);
      }
      
      public function resize(param1:int, param2:int) : void
      {
         if(param1 < __minWidth)
         {
            param1 = __minWidth;
         }
         else if(param1 > __maxWidth)
         {
            param1 = __maxWidth;
         }
         if(param2 < __minHeight)
         {
            param2 = __minHeight;
         }
         else if(param2 > __maxHeight)
         {
            param2 = __maxHeight;
         }
         __backend.resize(param1,param2);
         __width = param1;
         __height = param2;
      }
      
      public function readPixels(param1:Rectangle = undefined) : Image
      {
         return __backend.readPixels(param1);
      }
      
      public function move(param1:int, param2:int) : void
      {
         __backend.move(param1,param2);
         __x = param1;
         __y = param2;
      }
      
      public function get_y() : int
      {
         return __y;
      }
      
      public function get_x() : int
      {
         return __x;
      }
      
      public function get_width() : int
      {
         return __width;
      }
      
      public function get_visible() : Boolean
      {
         return !__hidden;
      }
      
      public function get_title() : String
      {
         return __title;
      }
      
      public function get_textInputEnabled() : Boolean
      {
         return __backend.getTextInputEnabled();
      }
      
      public function get_scale() : Number
      {
         return __scale;
      }
      
      public function get_resizable() : Boolean
      {
         return __resizable;
      }
      
      public function get_opacity() : Number
      {
         return __backend.getOpacity();
      }
      
      public function get_mouseLock() : Boolean
      {
         return __backend.getMouseLock();
      }
      
      public function get_minimized() : Boolean
      {
         return __minimized;
      }
      
      public function get_minWidth() : int
      {
         return __minWidth;
      }
      
      public function get_minHeight() : int
      {
         return __minHeight;
      }
      
      public function get_maximized() : Boolean
      {
         return __maximized;
      }
      
      public function get_maxWidth() : int
      {
         return __maxWidth;
      }
      
      public function get_maxHeight() : int
      {
         return __maxHeight;
      }
      
      public function get_hidden() : Boolean
      {
         return __hidden;
      }
      
      public function get_height() : int
      {
         return __height;
      }
      
      public function get_fullscreen() : Boolean
      {
         return __fullscreen;
      }
      
      public function get_frameRate() : Number
      {
         return __backend.getFrameRate();
      }
      
      public function get_displayMode() : DisplayMode
      {
         return __backend.getDisplayMode();
      }
      
      public function get_display() : Display
      {
         return __backend.getDisplay();
      }
      
      public function get_cursor() : MouseCursor
      {
         return __backend.getCursor();
      }
      
      public function get_borderless() : Boolean
      {
         return __borderless;
      }
      
      public function focus() : void
      {
         __backend.focus();
      }
      
      public function close() : void
      {
         __backend.close();
      }
      
      public function alert(param1:String = undefined, param2:String = undefined) : void
      {
         __backend.alert(param1,param2);
      }
   }
}

