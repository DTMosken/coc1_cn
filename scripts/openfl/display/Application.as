package openfl.display
{
   import flash.Boot;
   import haxe.ds.IntMap;
   import lime.app.Application;
   import lime.ui.Window;
   import openfl.utils._internal.Lib;
   
   public class Application extends lime.app.Application
   {
      
      public static var __meta__:* = {"obj":{"SuppressWarnings":["checkstyle:FieldDocComment"]}};
      
      public function Application()
      {
         if(Boot.skip_constructor)
         {
            return;
         }
         super();
         if(Lib.application == null)
         {
            Lib.application = this;
         }
      }
      
      override public function exec() : int
      {
         return int(super.exec());
      }
      
      override public function createWindow(param1:Object) : lime.ui.Window
      {
         var window1:lime.ui.Window;
         var _g:openfl.display.Application;
         var _loc2_:openfl.display.Window = new openfl.display.Window(this,param1);
         __windows.push(_loc2_);
         __windowByID.h[_loc2_.id] = _loc2_;
         _g = this;
         window1 = _loc2_;
         var _loc3_:Function = function():void
         {
            _g.__onWindowClose(window1);
         };
         _loc2_.onClose.add(_loc3_,false,-10000);
         if(__window == null)
         {
            __window = _loc2_;
            _loc2_.onActivate.add(onWindowActivate);
            _loc2_.onRenderContextLost.add(onRenderContextLost);
            _loc2_.onRenderContextRestored.add(onRenderContextRestored);
            _loc2_.onDeactivate.add(onWindowDeactivate);
            _loc2_.onDropFile.add(onWindowDropFile);
            _loc2_.onEnter.add(onWindowEnter);
            _loc2_.onExpose.add(onWindowExpose);
            _loc2_.onFocusIn.add(onWindowFocusIn);
            _loc2_.onFocusOut.add(onWindowFocusOut);
            _loc2_.onFullscreen.add(onWindowFullscreen);
            _loc2_.onKeyDown.add(onKeyDown);
            _loc2_.onKeyUp.add(onKeyUp);
            _loc2_.onLeave.add(onWindowLeave);
            _loc2_.onMinimize.add(onWindowMinimize);
            _loc2_.onMouseDown.add(onMouseDown);
            _loc2_.onMouseMove.add(onMouseMove);
            _loc2_.onMouseMoveRelative.add(onMouseMoveRelative);
            _loc2_.onMouseUp.add(onMouseUp);
            _loc2_.onMouseWheel.add(onMouseWheel);
            _loc2_.onMove.add(onWindowMove);
            _loc2_.onRender.add(render);
            _loc2_.onResize.add(onWindowResize);
            _loc2_.onRestore.add(onWindowRestore);
            _loc2_.onTextEdit.add(onTextEdit);
            _loc2_.onTextInput.add(onTextInput);
            onWindowCreate();
         }
         onCreateWindow.dispatch(_loc2_);
         return _loc2_;
      }
      
      override public function __onModuleExit(param1:int) : void
      {
         if(onExit.canceled)
         {
            return;
         }
         if(Lib.application == this)
         {
            Lib.application = null;
         }
         super.__onModuleExit(param1);
      }
      
      override public function __checkForAllWindowsClosed() : void
      {
         if(int(__windows.length) > 0)
         {
            return;
         }
         super.__checkForAllWindowsClosed();
      }
   }
}

