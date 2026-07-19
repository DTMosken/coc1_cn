package flash.display
{
   import flash.Boot;
   import flash.events.MouseEvent;
   import flash.utils.getTimer;
   import openfl.display.Timeline;
   import openfl.display._internal.FlashRenderer;
   import openfl.display._internal.IDisplayObject;
   import openfl.utils._Object.Object_Impl_;
   
   public class MovieClip2 extends MovieClip implements IDisplayObject
   {
      
      public var __timeline:Timeline;
      
      public var __mouseIsDown:Boolean;
      
      public var __hasUp:Boolean;
      
      public var __hasOver:Boolean;
      
      public var __hasDown:Boolean;
      
      public var __cacheTime:int;
      
      public function MovieClip2(param1:Timeline = undefined)
      {
         var _loc2_:* = null as Function;
         if(Boot.skip_constructor)
         {
            return;
         }
         super();
         __cacheTime = getTimer();
         if(param1 != null)
         {
            __timeline = param1;
            __timeline.__attachMovieClip(this);
            play();
         }
         if(MovieClip.__constructor != null)
         {
            _loc2_ = MovieClip.__constructor;
            MovieClip.__constructor = null;
            _loc2_(this);
         }
         FlashRenderer.register(this);
      }
      
      override public function stop() : void
      {
         if(__timeline != null)
         {
            __timeline.__stop();
         }
      }
      
      public function set_buttonMode(param1:Boolean) : Boolean
      {
         var _loc2_:int = 0;
         var _loc3_:* = null as Array;
         var _loc4_:* = null as FrameLabel;
         var _loc5_:* = null as String;
         var _loc6_:Boolean = false;
         if(buttonMode != param1)
         {
            if(param1)
            {
               __hasDown = false;
               __hasOver = false;
               __hasUp = false;
               _loc2_ = 0;
               _loc3_ = get_currentLabels();
               while(_loc2_ < int(_loc3_.length))
               {
                  _loc4_ = _loc3_[_loc2_];
                  _loc2_++;
                  _loc5_ = _loc4_.name;
                  if(_loc5_ == "_down")
                  {
                     __hasDown = true;
                  }
                  else if(_loc5_ == "_over")
                  {
                     __hasOver = true;
                  }
                  else if(_loc5_ == "_up")
                  {
                     __hasUp = true;
                  }
               }
               if(__hasDown || __hasOver || __hasUp)
               {
                  addEventListener(MouseEvent.ROLL_OVER,__onRollOver);
                  addEventListener(MouseEvent.ROLL_OUT,__onRollOut);
                  addEventListener(MouseEvent.MOUSE_DOWN,__onMouseDown);
               }
            }
            else
            {
               removeEventListener(MouseEvent.ROLL_OVER,__onRollOver);
               removeEventListener(MouseEvent.ROLL_OUT,__onRollOut);
               removeEventListener(MouseEvent.MOUSE_DOWN,__onMouseDown);
            }
            return super.buttonMode = param1;
         }
         return buttonMode;
      }
      
      override public function set buttonMode(param1:Boolean) : void
      {
         set_buttonMode(param1);
      }
      
      override public function prevScene() : void
      {
         if(__timeline != null)
         {
            __timeline.__prevScene();
         }
      }
      
      override public function prevFrame() : void
      {
         if(__timeline != null)
         {
            __timeline.__prevFrame();
         }
      }
      
      override public function play() : void
      {
         if(__timeline != null)
         {
            __timeline.__play();
         }
      }
      
      override public function nextScene() : void
      {
         if(__timeline != null)
         {
            __timeline.__nextScene();
         }
      }
      
      override public function nextFrame() : void
      {
         if(__timeline != null)
         {
            __timeline.__nextFrame();
         }
      }
      
      override public function gotoAndStop(param1:Object, param2:String = undefined) : void
      {
         if(__timeline != null)
         {
            __timeline.__gotoAndStop(param1,param2);
         }
      }
      
      override public function gotoAndPlay(param1:Object, param2:String = undefined) : void
      {
         if(__timeline != null)
         {
            __timeline.__gotoAndPlay(param1,param2);
         }
      }
      
      public function get_totalFrames() : int
      {
         if(__timeline != null)
         {
            return __timeline.__totalFrames;
         }
         return 1;
      }
      
      override public function get totalFrames() : int
      {
         return get_totalFrames();
      }
      
      public function get_scenes() : Array
      {
         if(__timeline != null)
         {
            return __timeline.scenes;
         }
         return null;
      }
      
      override public function get scenes() : Array
      {
         return get_scenes();
      }
      
      public function get_isPlaying() : Boolean
      {
         if(__timeline != null)
         {
            return __timeline.__isPlaying;
         }
         return false;
      }
      
      override public function get isPlaying() : Boolean
      {
         return get_isPlaying();
      }
      
      public function get_framesLoaded() : int
      {
         if(__timeline != null)
         {
            return __timeline.__framesLoaded;
         }
         return 1;
      }
      
      override public function get framesLoaded() : int
      {
         return get_framesLoaded();
      }
      
      public function get_currentScene() : Scene
      {
         if(__timeline != null)
         {
            return __timeline.__currentScene;
         }
         return super.currentScene;
      }
      
      override public function get currentScene() : Scene
      {
         return get_currentScene();
      }
      
      public function get_currentLabels() : Array
      {
         if(__timeline != null)
         {
            return __timeline.__currentLabels;
         }
         return [];
      }
      
      override public function get currentLabels() : Array
      {
         return get_currentLabels();
      }
      
      public function get_currentLabel() : String
      {
         if(__timeline != null)
         {
            return __timeline.__currentLabel;
         }
         return null;
      }
      
      override public function get currentLabel() : String
      {
         return get_currentLabel();
      }
      
      public function get_currentFrameLabel() : String
      {
         if(__timeline != null)
         {
            return __timeline.__currentFrameLabel;
         }
         return null;
      }
      
      override public function get currentFrameLabel() : String
      {
         return get_currentFrameLabel();
      }
      
      public function get_currentFrame() : int
      {
         if(__timeline != null)
         {
            return __timeline.__currentFrame;
         }
         return 1;
      }
      
      override public function get currentFrame() : int
      {
         return get_currentFrame();
      }
      
      public function attachTimeline(param1:Timeline) : void
      {
         __timeline = param1;
         if(param1 != null)
         {
            param1.__attachMovieClip(this);
            play();
         }
      }
      
      public function __renderFlash() : void
      {
         var _loc1_:int = getTimer();
         var _loc2_:int = _loc1_ - __cacheTime;
         __cacheTime = _loc1_;
         if(__timeline != null)
         {
            __timeline.__enterFrame(_loc2_);
         }
      }
      
      public function __onRollOver(param1:MouseEvent) : void
      {
         if(enabled && __hasOver)
         {
            gotoAndStop("_over");
         }
      }
      
      public function __onRollOut(param1:MouseEvent) : void
      {
         if(!enabled)
         {
            return;
         }
         if(__mouseIsDown && __hasOver)
         {
            gotoAndStop("_over");
         }
         else if(__hasUp)
         {
            gotoAndStop("_up");
         }
      }
      
      public function __onMouseUp(param1:MouseEvent) : void
      {
         __mouseIsDown = false;
         if(stage != null)
         {
            stage.removeEventListener(MouseEvent.MOUSE_UP,__onMouseUp);
         }
         if(!buttonMode)
         {
            return;
         }
         if(Object_Impl_.__eq(param1.target,this) && enabled && __hasOver)
         {
            gotoAndStop("_over");
         }
         else if(enabled && __hasUp)
         {
            gotoAndStop("_up");
         }
      }
      
      public function __onMouseDown(param1:MouseEvent) : void
      {
         if(enabled && __hasDown)
         {
            gotoAndStop("_down");
         }
         __mouseIsDown = true;
         stage.addEventListener(MouseEvent.MOUSE_UP,__onMouseUp,true);
      }
   }
}

