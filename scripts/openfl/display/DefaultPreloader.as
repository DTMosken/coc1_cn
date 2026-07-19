package openfl.display
{
   import flash.Boot;
   import flash.display.BitmapData;
   import flash.display.Graphics;
   import flash.display.MovieClip;
   import flash.display.Shape;
   import flash.display.Sprite;
   import flash.display.Stage;
   import flash.events.Event;
   import flash.events.ProgressEvent;
   import openfl.Lib;
   import openfl.display._internal.FlashGraphics;
   
   public class DefaultPreloader extends Sprite
   {
      
      public static var __meta__:* = {"obj":{"SuppressWarnings":["checkstyle:FieldDocComment"]}};
      
      public var startAnimation:int;
      
      public var progress:Shape;
      
      public var outline:Shape;
      
      public var endAnimation:int;
      
      public function DefaultPreloader()
      {
         if(Boot.skip_constructor)
         {
            return;
         }
         super();
         var _loc1_:int = getBackgroundColor();
         var _loc2_:int = _loc1_ >> 16 & 0xFF;
         var _loc3_:int = _loc1_ >> 8 & 0xFF;
         var _loc4_:int = _loc1_ & 0xFF;
         var _loc5_:Number = 0.299 * _loc2_ + 0.587 * _loc3_ + 0.114 * _loc4_;
         var _loc6_:int = 0;
         if(_loc5_ < 70)
         {
            _loc6_ = 16777215;
         }
         var _loc7_:int = 30;
         var _loc8_:int = 7;
         var _loc9_:Number = getHeight() / 2 - _loc8_ / 2;
         var _loc10_:Number = getWidth() - _loc7_ * 2;
         var _loc11_:int = 2;
         outline = new Shape();
         var _loc12_:Graphics = outline.graphics;
         var _loc13_:BitmapData = null;
         FlashGraphics.bitmapFill[_loc12_] = _loc13_;
         _loc12_.beginFill(_loc6_,0.07);
         outline.graphics.drawRect(0,0,_loc10_,_loc8_);
         outline.x = _loc7_;
         outline.y = _loc9_;
         outline.alpha = 0;
         addChild(outline);
         progress = new Shape();
         _loc12_ = progress.graphics;
         _loc13_ = null;
         FlashGraphics.bitmapFill[_loc12_] = _loc13_;
         _loc12_.beginFill(_loc6_,0.35);
         progress.graphics.drawRect(0,0,_loc10_ - _loc11_ * 2,_loc8_ - _loc11_ * 2);
         progress.x = _loc7_ + _loc11_;
         progress.y = _loc9_ + _loc11_;
         progress.scaleX = 0;
         progress.alpha = 0;
         addChild(progress);
         startAnimation = Lib.getTimer() + 100;
         endAnimation = startAnimation + 1000;
         addEventListener(Event.ADDED_TO_STAGE,this_onAddedToStage);
      }
      
      public function this_onProgress(param1:ProgressEvent) : void
      {
         onUpdate(int(param1.bytesLoaded),int(param1.bytesTotal));
      }
      
      public function this_onEnterFrame(param1:Event) : void
      {
         var _loc2_:int = Lib.getTimer() - startAnimation;
         var _loc3_:int = endAnimation - startAnimation;
         var _loc4_:Number = _loc2_ / _loc3_;
         if(_loc4_ < 0)
         {
            _loc4_ = 0;
         }
         if(_loc4_ > 1)
         {
            _loc4_ = 1;
         }
         outline.alpha = progress.alpha = _loc4_;
      }
      
      public function this_onComplete(param1:Event) : void
      {
         param1.preventDefault();
         removeEventListener(ProgressEvent.PROGRESS,this_onProgress);
         removeEventListener(Event.COMPLETE,this_onComplete);
         onLoaded();
      }
      
      public function this_onAddedToStage(param1:Event) : void
      {
         removeEventListener(Event.ADDED_TO_STAGE,this_onAddedToStage);
         onInit();
         onUpdate(loaderInfo.bytesLoaded,loaderInfo.bytesTotal);
         addEventListener(ProgressEvent.PROGRESS,this_onProgress);
         addEventListener(Event.COMPLETE,this_onComplete);
      }
      
      public function onUpdate(param1:int, param2:int) : void
      {
         var _loc3_:Number = 0;
         if(param2 > 0)
         {
            _loc3_ = param1 / param2;
            if(_loc3_ > 1)
            {
               _loc3_ = 1;
            }
         }
         progress.scaleX = _loc3_;
      }
      
      public function onLoaded() : void
      {
         removeEventListener(Event.ENTER_FRAME,this_onEnterFrame);
         dispatchEvent(new Event(Event.UNLOAD));
      }
      
      public function onInit() : void
      {
         addEventListener(Event.ENTER_FRAME,this_onEnterFrame);
      }
      
      public function getWidth() : Number
      {
         var _loc1_:Stage = Lib.get_current().stage;
         var _loc2_:int = Lib.get_application().__window.__width;
         if(_loc2_ > 0)
         {
            return _loc2_;
         }
         return Lib.get_current().stage.stageWidth;
      }
      
      public function getHeight() : Number
      {
         var _loc1_:Stage = Lib.get_current().stage;
         var _loc2_:int = Lib.get_application().__window.__height;
         if(_loc2_ > 0)
         {
            return _loc2_;
         }
         return Lib.get_current().stage.stageHeight;
      }
      
      public function getBackgroundColor() : int
      {
         var _loc1_:Stage = Lib.get_current().stage;
         var _loc2_:* = Lib.get_application().__window.context.attributes;
         if(Reflect.hasField(_loc2_,"background") && _loc2_.background != null)
         {
            return _loc2_.background;
         }
         return 0;
      }
   }
}

