package lime.app
{
   import flash.Boot;
   import flash.utils.Dictionary;
   import haxe.IMap;
   import haxe.ds.IntMap;
   import haxe.ds.StringMap;
   import lime._internal.backend.flash.FlashApplication;
   import lime.graphics.RenderContext;
   import lime.system.System;
   import lime.ui.Gamepad;
   import lime.ui.Joystick;
   import lime.ui.MouseWheelMode;
   import lime.ui.Touch;
   import lime.ui.Window;
   import lime.utils.Preloader;
   
   public class Application extends Module
   {
      
      public static var current:Application;
      
      public var windows:Array;
      
      public var window:Window;
      
      public var preloader:Preloader;
      
      public var onUpdate:_Event_Int_Void;
      
      public var onDisplayOrientationChange:_Event_Int_lime_system_Orientation_Void;
      
      public var onDeviceOrientationChange:_Event_lime_system_Orientation_Void;
      
      public var onCreateWindow:_Event_lime_ui_Window_Void;
      
      public var modules:Array;
      
      public var meta:IMap;
      
      public var __windows:Array;
      
      public var __windowByID:IMap;
      
      public var __window:Window;
      
      public var __preloader:Preloader;
      
      public var __backend:FlashApplication;
      
      public function Application()
      {
         if(Boot.skip_constructor)
         {
            return;
         }
         onDeviceOrientationChange = new _Event_lime_system_Orientation_Void();
         onDisplayOrientationChange = new _Event_Int_lime_system_Orientation_Void();
         onCreateWindow = new _Event_lime_ui_Window_Void();
         onUpdate = new _Event_Int_Void();
         super();
         if(Application.current == null)
         {
            Application.current = this;
         }
         meta = new StringMap();
         modules = [];
         __windowByID = new IntMap();
         __windows = [];
         __backend = new FlashApplication(this);
         __registerLimeModule(this);
         __preloader = new Preloader();
         __preloader.onProgress.add(onPreloadProgress);
         __preloader.onComplete.add(onPreloadComplete);
      }
      
      public function update(param1:int) : void
      {
      }
      
      public function render(param1:RenderContext) : void
      {
      }
      
      public function removeModule(param1:IModule) : void
      {
         if(param1 != null)
         {
            param1.__unregisterLimeModule(this);
            modules.remove(param1);
         }
      }
      
      public function onWindowRestore() : void
      {
      }
      
      public function onWindowResize(param1:int, param2:int) : void
      {
      }
      
      public function onWindowMove(param1:Number, param2:Number) : void
      {
      }
      
      public function onWindowMinimize() : void
      {
      }
      
      public function onWindowLeave() : void
      {
      }
      
      public function onWindowFullscreen() : void
      {
      }
      
      public function onWindowFocusOut() : void
      {
      }
      
      public function onWindowFocusIn() : void
      {
      }
      
      public function onWindowExpose() : void
      {
      }
      
      public function onWindowEnter() : void
      {
      }
      
      public function onWindowDropFile(param1:String) : void
      {
      }
      
      public function onWindowDeactivate() : void
      {
      }
      
      public function onWindowCreate() : void
      {
      }
      
      public function onWindowClose() : void
      {
      }
      
      public function onWindowActivate() : void
      {
      }
      
      public function onTouchStart(param1:Touch) : void
      {
      }
      
      public function onTouchMove(param1:Touch) : void
      {
      }
      
      public function onTouchEnd(param1:Touch) : void
      {
      }
      
      public function onTouchCancel(param1:Touch) : void
      {
      }
      
      public function onTextInput(param1:String) : void
      {
      }
      
      public function onTextEdit(param1:String, param2:int, param3:int) : void
      {
      }
      
      public function onRenderContextRestored(param1:RenderContext) : void
      {
      }
      
      public function onRenderContextLost() : void
      {
      }
      
      public function onPreloadProgress(param1:int, param2:int) : void
      {
      }
      
      public function onPreloadComplete() : void
      {
      }
      
      public function onMouseWheel(param1:Number, param2:Number, param3:MouseWheelMode) : void
      {
      }
      
      public function onMouseUp(param1:Number, param2:Number, param3:int) : void
      {
      }
      
      public function onMouseMoveRelative(param1:Number, param2:Number) : void
      {
      }
      
      public function onMouseMove(param1:Number, param2:Number) : void
      {
      }
      
      public function onMouseDown(param1:Number, param2:Number, param3:int) : void
      {
      }
      
      public function onModuleExit(param1:int) : void
      {
      }
      
      public function onKeyUp(param1:int, param2:int) : void
      {
      }
      
      public function onKeyDown(param1:int, param2:int) : void
      {
      }
      
      public function onJoystickHatMove(param1:Joystick, param2:int, param3:int) : void
      {
      }
      
      public function onJoystickDisconnect(param1:Joystick) : void
      {
      }
      
      public function onJoystickConnect(param1:Joystick) : void
      {
      }
      
      public function onJoystickButtonUp(param1:Joystick, param2:int) : void
      {
      }
      
      public function onJoystickButtonDown(param1:Joystick, param2:int) : void
      {
      }
      
      public function onJoystickAxisMove(param1:Joystick, param2:int, param3:Number) : void
      {
      }
      
      public function onGamepadDisconnect(param1:Gamepad) : void
      {
      }
      
      public function onGamepadConnect(param1:Gamepad) : void
      {
      }
      
      public function onGamepadButtonUp(param1:Gamepad, param2:int) : void
      {
      }
      
      public function onGamepadButtonDown(param1:Gamepad, param2:int) : void
      {
      }
      
      public function onGamepadAxisMove(param1:Gamepad, param2:int, param3:Number) : void
      {
      }
      
      public function get_windows() : Array
      {
         return __windows;
      }
      
      public function get_window() : Window
      {
         return __window;
      }
      
      public function get_preloader() : Preloader
      {
         return __preloader;
      }
      
      public function get_deviceOrientation() : int
      {
         return __backend.getDeviceOrientation();
      }
      
      public function exec() : int
      {
         Application.current = this;
         return __backend.exec();
      }
      
      public function createWindow(param1:Object) : Window
      {
         var _loc2_:Window = __createWindow(param1);
         __addWindow(_loc2_);
         return _loc2_;
      }
      
      public function addModule(param1:IModule) : void
      {
         param1.__registerLimeModule(this);
         modules.push(param1);
      }
      
      override public function __unregisterLimeModule(param1:Application) : void
      {
         param1.onUpdate.remove(update);
         param1.onExit.remove(__onModuleExit);
         param1.onExit.remove(onModuleExit);
         Gamepad.onConnect.remove(__onGamepadConnect);
         Joystick.onConnect.remove(__onJoystickConnect);
         Touch.onCancel.remove(onTouchCancel);
         Touch.onStart.remove(onTouchStart);
         Touch.onMove.remove(onTouchMove);
         Touch.onEnd.remove(onTouchEnd);
      }
      
      public function __removeWindow(param1:Window) : void
      {
         var _loc2_:Boolean = false;
         var _loc3_:* = null as IMap;
         var _loc4_:int = 0;
         if(param1 != null)
         {
            _loc3_ = __windowByID;
            _loc4_ = param1.id;
            _loc2_ = _loc4_ in _loc3_.h;
         }
         else
         {
            _loc2_ = false;
         }
         if(_loc2_)
         {
            if(__window == param1)
            {
               __window = null;
            }
            __windows.remove(param1);
            __windowByID.remove(param1.id);
            param1.close();
            __checkForAllWindowsClosed();
         }
      }
      
      override public function __registerLimeModule(param1:Application) : void
      {
         var _loc8_:* = null as Dictionary;
         var _loc9_:int = 0;
         var _loc10_:Boolean = false;
         var _loc11_:* = null as Gamepad;
         var _loc12_:* = null as Gamepad;
         var _loc13_:* = null as Joystick;
         var _loc14_:* = null as Joystick;
         param1.onUpdate.add(update);
         param1.onExit.add(onModuleExit,false,0);
         param1.onExit.add(__onModuleExit,false,-1000);
         var _loc2_:Dictionary = Gamepad.devices.h;
         var _loc3_:int = 0;
         var _loc4_:Dictionary = _loc2_;
         var _loc5_:int = _loc3_;
         var _loc6_:Boolean = §§hasnext(_loc4_,_loc5_);
         var _loc7_:int = _loc5_;
         while(true)
         {
            _loc8_ = _loc2_;
            _loc9_ = _loc3_;
            _loc10_ = §§hasnext(_loc8_,_loc9_);
            _loc7_ = _loc9_;
            if(!_loc10_)
            {
               break;
            }
            _loc11_ = §§nextvalue(_loc7_,_loc2_);
            _loc3_ = _loc7_;
            _loc12_ = _loc11_;
            __onGamepadConnect(_loc12_);
         }
         Gamepad.onConnect.add(__onGamepadConnect);
         _loc2_ = Joystick.devices.h;
         _loc3_ = 0;
         _loc4_ = _loc2_;
         _loc5_ = _loc3_;
         _loc6_ = §§hasnext(_loc4_,_loc5_);
         _loc7_ = _loc5_;
         while(true)
         {
            _loc8_ = _loc2_;
            _loc9_ = _loc3_;
            _loc10_ = §§hasnext(_loc8_,_loc9_);
            _loc7_ = _loc9_;
            if(!_loc10_)
            {
               break;
            }
            _loc13_ = §§nextvalue(_loc7_,_loc2_);
            _loc3_ = _loc7_;
            _loc14_ = _loc13_;
            __onJoystickConnect(_loc14_);
         }
         Joystick.onConnect.add(__onJoystickConnect);
         Touch.onCancel.add(onTouchCancel);
         Touch.onStart.add(onTouchStart);
         Touch.onMove.add(onTouchMove);
         Touch.onEnd.add(onTouchEnd);
      }
      
      public function __onWindowClose(param1:Window) : void
      {
         if(__window == param1)
         {
            onWindowClose();
         }
         __removeWindow(param1);
      }
      
      public function __onModuleExit(param1:int) : void
      {
         if(onExit.canceled)
         {
            return;
         }
         __unregisterLimeModule(this);
         __backend.exit();
         if(Application.current == this)
         {
            Application.current = null;
         }
      }
      
      public function __onJoystickConnect(param1:Joystick) : void
      {
         var joystick5:Joystick;
         var _g4:Application;
         var joystick4:Joystick;
         var _g3:Application;
         var joystick3:Joystick;
         var _g2:Application;
         var joystick2:Joystick;
         var _g1:Application;
         var joystick1:Joystick;
         var _g:Application;
         onJoystickConnect(param1);
         _g = this;
         joystick1 = param1;
         var _loc2_:Function = function(param1:int, param2:Number):void
         {
            _g.onJoystickAxisMove(joystick1,param1,param2);
         };
         param1.onAxisMove.add(_loc2_);
         _g1 = this;
         joystick2 = param1;
         var _loc3_:Function = function(param1:int):void
         {
            _g1.onJoystickButtonDown(joystick2,param1);
         };
         param1.onButtonDown.add(_loc3_);
         _g2 = this;
         joystick3 = param1;
         var _loc4_:Function = function(param1:int):void
         {
            _g2.onJoystickButtonUp(joystick3,param1);
         };
         param1.onButtonUp.add(_loc4_);
         _g3 = this;
         joystick4 = param1;
         var _loc5_:Function = function():void
         {
            _g3.onJoystickDisconnect(joystick4);
         };
         param1.onDisconnect.add(_loc5_);
         _g4 = this;
         joystick5 = param1;
         var _loc6_:Function = function(param1:int, param2:int):void
         {
            _g4.onJoystickHatMove(joystick5,param1,param2);
         };
         param1.onHatMove.add(_loc6_);
      }
      
      public function __onGamepadConnect(param1:Gamepad) : void
      {
         var gamepad4:Gamepad;
         var _g3:Application;
         var gamepad3:Gamepad;
         var _g2:Application;
         var gamepad2:Gamepad;
         var _g1:Application;
         var gamepad1:Gamepad;
         var _g:Application;
         onGamepadConnect(param1);
         _g = this;
         gamepad1 = param1;
         var _loc2_:Function = function(param1:int, param2:Number):void
         {
            _g.onGamepadAxisMove(gamepad1,param1,param2);
         };
         param1.onAxisMove.add(_loc2_);
         _g1 = this;
         gamepad2 = param1;
         var _loc3_:Function = function(param1:int):void
         {
            _g1.onGamepadButtonDown(gamepad2,param1);
         };
         param1.onButtonDown.add(_loc3_);
         _g2 = this;
         gamepad3 = param1;
         var _loc4_:Function = function(param1:int):void
         {
            _g2.onGamepadButtonUp(gamepad3,param1);
         };
         param1.onButtonUp.add(_loc4_);
         _g3 = this;
         gamepad4 = param1;
         var _loc5_:Function = function():void
         {
            _g3.onGamepadDisconnect(gamepad4);
         };
         param1.onDisconnect.add(_loc5_);
      }
      
      public function __createWindow(param1:Object) : Window
      {
         var _loc2_:Window = new Window(this,param1);
         if(_loc2_.id == -1)
         {
            return null;
         }
         return _loc2_;
      }
      
      public function __checkForAllWindowsClosed() : void
      {
         if(int(__windows.length) == 0)
         {
            System.exit(0);
         }
      }
      
      public function __addWindow(param1:Window) : void
      {
         var window1:Window;
         var _g:Application;
         var _loc2_:* = null as Function;
         if(param1 != null)
         {
            __windows.push(param1);
            __windowByID.h[param1.id] = param1;
            _g = this;
            window1 = param1;
            _loc2_ = function():void
            {
               _g.__onWindowClose(window1);
            };
            param1.onClose.add(_loc2_,false,-10000);
            if(__window == null)
            {
               __window = param1;
               param1.onActivate.add(onWindowActivate);
               param1.onRenderContextLost.add(onRenderContextLost);
               param1.onRenderContextRestored.add(onRenderContextRestored);
               param1.onDeactivate.add(onWindowDeactivate);
               param1.onDropFile.add(onWindowDropFile);
               param1.onEnter.add(onWindowEnter);
               param1.onExpose.add(onWindowExpose);
               param1.onFocusIn.add(onWindowFocusIn);
               param1.onFocusOut.add(onWindowFocusOut);
               param1.onFullscreen.add(onWindowFullscreen);
               param1.onKeyDown.add(onKeyDown);
               param1.onKeyUp.add(onKeyUp);
               param1.onLeave.add(onWindowLeave);
               param1.onMinimize.add(onWindowMinimize);
               param1.onMouseDown.add(onMouseDown);
               param1.onMouseMove.add(onMouseMove);
               param1.onMouseMoveRelative.add(onMouseMoveRelative);
               param1.onMouseUp.add(onMouseUp);
               param1.onMouseWheel.add(onMouseWheel);
               param1.onMove.add(onWindowMove);
               param1.onRender.add(render);
               param1.onResize.add(onWindowResize);
               param1.onRestore.add(onWindowRestore);
               param1.onTextEdit.add(onTextEdit);
               param1.onTextInput.add(onTextInput);
               onWindowCreate();
            }
            onCreateWindow.dispatch(param1);
         }
      }
   }
}

import lime._internal.backend.flash.FlashApplication;

FlashApplication;

