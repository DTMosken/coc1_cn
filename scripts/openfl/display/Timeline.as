package openfl.display
{
   import flash.Boot;
   import flash.display.FrameLabel;
   import flash.display.MovieClip;
   import flash.display.Scene;
   import flash.display.Sprite;
   import haxe.Exception;
   import haxe.IMap;
   import haxe.ds.IntMap;
   
   public class Timeline
   {
      
      public var scripts:Array;
      
      public var scenes:Array;
      
      public var frameRate:Object;
      
      public var __totalFrames:int;
      
      public var __timeElapsed:int;
      
      public var __scope:MovieClip;
      
      public var __lastFrameUpdate:int;
      
      public var __lastFrameScriptEval:int;
      
      public var __isPlaying:Boolean;
      
      public var __framesLoaded:int;
      
      public var __frameTime:int;
      
      public var __frameScripts:IMap;
      
      public var __currentScene:Scene;
      
      public var __currentLabels:Array;
      
      public var __currentLabel:String;
      
      public var __currentFrameLabel:String;
      
      public var __currentFrame:int;
      
      public function Timeline()
      {
         if(Boot.skip_constructor)
         {
            return;
         }
         __framesLoaded = 1;
         __totalFrames = 1;
         __currentLabels = [];
         __currentFrame = 1;
         __lastFrameScriptEval = -1;
         __lastFrameUpdate = -1;
      }
      
      public function initializeSprite(param1:Sprite) : void
      {
      }
      
      public function enterFrame(param1:int) : void
      {
      }
      
      public function attachMovieClip(param1:MovieClip) : void
      {
      }
      
      public function __updateSymbol(param1:int) : void
      {
         if(__currentFrame != __lastFrameUpdate)
         {
            __updateFrameLabel();
            enterFrame(param1);
            __lastFrameUpdate = __currentFrame;
         }
      }
      
      public function __updateFrameLabel() : void
      {
         var _loc3_:* = null as FrameLabel;
         __currentLabel = null;
         __currentFrameLabel = null;
         var _loc1_:int = 0;
         var _loc2_:Array = __currentLabels;
         while(_loc1_ < int(_loc2_.length))
         {
            _loc3_ = _loc2_[_loc1_];
            _loc1_++;
            if(_loc3_.frame < __currentFrame)
            {
               __currentLabel = _loc3_.name;
            }
            else
            {
               if(_loc3_.frame != __currentFrame)
               {
                  break;
               }
               __currentLabel = _loc3_.name;
               __currentFrameLabel = _loc3_.name;
            }
         }
      }
      
      public function __stop() : void
      {
         __isPlaying = false;
      }
      
      public function __resolveFrameReference(param1:*) : int
      {
         var _loc2_:* = null as String;
         var _loc3_:int = 0;
         var _loc4_:* = null as Array;
         var _loc5_:* = null as FrameLabel;
         if(Std.isOfType(param1,int))
         {
            return int(param1);
         }
         if(param1 is String)
         {
            _loc2_ = param1;
            _loc3_ = 0;
            _loc4_ = __currentLabels;
            while(_loc3_ < int(_loc4_.length))
            {
               _loc5_ = _loc4_[_loc3_];
               _loc3_++;
               if(_loc5_.name == _loc2_)
               {
                  return _loc5_.frame;
               }
            }
            throw new ArgumentError("Error #2109: Frame label " + _loc2_ + " not found in scene.");
         }
         throw Exception.thrown("Invalid type for frame " + Type.getClassName(param1));
      }
      
      public function __prevScene() : void
      {
      }
      
      public function __prevFrame() : void
      {
         __stop();
         __goto(__currentFrame - 1);
      }
      
      public function __play() : void
      {
         if(__isPlaying || __totalFrames < 2)
         {
            return;
         }
         __isPlaying = true;
         if(frameRate != null)
         {
            __frameTime = int(1000 / frameRate);
            __timeElapsed = 0;
         }
      }
      
      public function __nextScene() : void
      {
      }
      
      public function __nextFrame() : void
      {
         __stop();
         __goto(__currentFrame + 1);
      }
      
      public function __gotoAndStop(param1:*, param2:String = undefined) : void
      {
         __stop();
         __goto(__resolveFrameReference(param1));
      }
      
      public function __gotoAndPlay(param1:*, param2:String = undefined) : void
      {
         __play();
         __goto(__resolveFrameReference(param1));
      }
      
      public function __goto(param1:int) : void
      {
         if(param1 < 1)
         {
            param1 = 1;
         }
         else if(param1 > __totalFrames)
         {
            param1 = __totalFrames;
         }
         __lastFrameScriptEval = -1;
         __currentFrame = param1;
         __updateSymbol(__currentFrame);
         __evaluateFrameScripts(__currentFrame);
      }
      
      public function __getNextFrame(param1:int) : int
      {
         var _loc2_:int = 0;
         if(frameRate != null)
         {
            __timeElapsed += param1;
            _loc2_ = __currentFrame + int(Math.floor(__timeElapsed / __frameTime));
            if(_loc2_ < 1)
            {
               _loc2_ = 1;
            }
            if(_loc2_ > __totalFrames)
            {
               _loc2_ = int(Math.floor(int((_loc2_ - 1) % __totalFrames))) + 1;
            }
            __timeElapsed %= __frameTime;
         }
         else
         {
            _loc2_ = __currentFrame + 1;
            if(_loc2_ > __totalFrames)
            {
               _loc2_ = 1;
            }
         }
         return _loc2_;
      }
      
      public function __evaluateFrameScripts(param1:int) : Boolean
      {
         var _loc4_:int = 0;
         var _loc5_:* = null as IMap;
         var _loc6_:* = null as Object;
         if(__frameScripts == null)
         {
            return true;
         }
         var _loc2_:int = __currentFrame;
         var _loc3_:int = param1 + 1;
         while(_loc2_ < _loc3_)
         {
            _loc4_ = _loc2_++;
            if(_loc4_ != __lastFrameScriptEval)
            {
               __lastFrameScriptEval = _loc4_;
               __currentFrame = _loc4_;
               _loc5_ = __frameScripts;
               if(_loc4_ in _loc5_.h)
               {
                  __updateSymbol(_loc4_);
                  _loc6_ = __frameScripts.h[_loc4_];
                  _loc6_(__scope);
                  if(__currentFrame != _loc4_)
                  {
                     return false;
                  }
               }
               if(!__isPlaying)
               {
                  return false;
               }
            }
         }
         return true;
      }
      
      public function __enterFrame(param1:int) : void
      {
         var _loc2_:int = 0;
         if(__isPlaying)
         {
            _loc2_ = __getNextFrame(param1);
            if(__lastFrameScriptEval == _loc2_)
            {
               return;
            }
            if(__frameScripts != null)
            {
               if(_loc2_ < __currentFrame)
               {
                  if(!__evaluateFrameScripts(__totalFrames))
                  {
                     return;
                  }
                  __currentFrame = 1;
               }
               if(!__evaluateFrameScripts(_loc2_))
               {
                  return;
               }
            }
            else
            {
               __currentFrame = _loc2_;
            }
         }
         __updateSymbol(__currentFrame);
      }
      
      public function __attachMovieClip(param1:MovieClip) : void
      {
         var append:Array;
         var existing:Array;
         var _loc2_:int = 0;
         var _loc3_:* = null as Array;
         var _loc4_:* = null as Scene;
         var _loc5_:* = null as FrameScript;
         var _loc6_:* = null as IMap;
         var _loc7_:int = 0;
         __scope = param1;
         __totalFrames = 0;
         __framesLoaded = 0;
         if(scenes != null && int(scenes.length) > 0)
         {
            _loc2_ = 0;
            _loc3_ = scenes;
            while(_loc2_ < int(_loc3_.length))
            {
               _loc4_ = _loc3_[_loc2_];
               _loc2_++;
               __totalFrames += _loc4_.numFrames;
               __framesLoaded += _loc4_.numFrames;
               if(_loc4_.labels != null)
               {
                  __currentLabels = __currentLabels.concat(_loc4_.labels);
               }
            }
            __currentScene = scenes[0];
         }
         if(scripts != null && int(scripts.length) > 0)
         {
            __frameScripts = new IntMap();
            _loc2_ = 0;
            _loc3_ = scripts;
            while(_loc2_ < int(_loc3_.length))
            {
               _loc5_ = _loc3_[_loc2_];
               _loc2_++;
               _loc6_ = __frameScripts;
               _loc7_ = _loc5_.frame;
               if(_loc7_ in _loc6_.h)
               {
                  existing = [__frameScripts.h[_loc5_.frame]];
                  append = [_loc5_.script];
                  __frameScripts.h[_loc5_.frame] = (function(param1:Array, param2:Array):Function
                  {
                     var append:Array = param1;
                     var existing:Array = param2;
                     return function(param1:MovieClip):void
                     {
                        existing[0](param1);
                        append[0](param1);
                     };
                  })(append,existing);
               }
               else
               {
                  __frameScripts.h[_loc5_.frame] = _loc5_.script;
               }
            }
         }
         attachMovieClip(param1);
      }
      
      public function __addFrameScript(param1:int, param2:Function) : void
      {
         var method:Function = param2;
         if(param1 < 0)
         {
            return;
         }
         var _loc3_:int = param1 + 1;
         if(method != null)
         {
            if(__frameScripts == null)
            {
               __frameScripts = new IntMap();
            }
            __frameScripts.h[_loc3_] = function(param1:MovieClip):void
            {
               method();
            };
         }
         else if(__frameScripts != null)
         {
            __frameScripts.remove(_loc3_);
         }
      }
   }
}

