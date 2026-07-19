package openfl.display
{
   import flash.Boot;
   import flash.display.InteractiveObject;
   import flash.display.MovieClip;
   import flash.display.Sprite;
   import flash.events.Event;
   import flash.events.ProgressEvent;
   import lime.app._Event_Void_Void;
   import openfl.Lib;
   
   public class Preloader
   {
      
      public static var __meta__:* = {
         "obj":{"SuppressWarnings":["checkstyle:FieldDocComment"]},
         "fields":{"onComplete":{"SuppressWarnings":["checkstyle:Dynamic"]}}
      };
      
      public var ready:Boolean;
      
      public var onComplete:_Event_Void_Void;
      
      public var display:Sprite;
      
      public var complete:Boolean;
      
      public function Preloader(param1:Sprite = undefined)
      {
         if(Boot.skip_constructor)
         {
            return;
         }
         onComplete = new _Event_Void_Void();
         display = param1;
         if(param1 != null)
         {
            param1.addEventListener(Event.UNLOAD,display_onUnload);
            Lib.get_current().addChild(param1);
         }
      }
      
      public function update(param1:int, param2:int) : void
      {
         if(display != null)
         {
            display.dispatchEvent(new ProgressEvent(ProgressEvent.PROGRESS,true,true,param1,param2));
         }
      }
      
      public function start() : void
      {
         var _loc1_:* = null as Event;
         ready = true;
         if(display != null)
         {
            _loc1_ = new Event(Event.COMPLETE,true,true);
            display.dispatchEvent(_loc1_);
            if(!_loc1_.isDefaultPrevented())
            {
               display.dispatchEvent(new Event(Event.UNLOAD));
            }
         }
         else if(!complete)
         {
            complete = true;
            onComplete.dispatch();
         }
      }
      
      public function display_onUnload(param1:Event) : void
      {
         if(display != null)
         {
            display.removeEventListener(Event.UNLOAD,display_onUnload);
            if(display.parent == Lib.get_current())
            {
               Lib.get_current().removeChild(display);
            }
            Lib.get_current().stage.focus = null;
            display = null;
         }
         if(ready)
         {
            if(!complete)
            {
               complete = true;
               onComplete.dispatch();
            }
         }
      }
   }
}

