package lime.utils
{
   import flash.Boot;
   import haxe.Exception;
   import haxe.IMap;
   import haxe.ds.StringMap;
   import lime.graphics.Image;
   import lime.media.AudioBuffer;
   
   public class AssetCache
   {
      
      public var version:int;
      
      public var image:IMap;
      
      public var font:IMap;
      
      public var enabled:Boolean;
      
      public var audio:IMap;
      
      public function AssetCache()
      {
         if(Boot.skip_constructor)
         {
            return;
         }
         enabled = true;
         audio = new StringMap();
         font = new StringMap();
         image = new StringMap();
         version = 823617;
      }
      
      public function set(param1:String, param2:String, param3:*) : void
      {
         var _loc5_:* = null as StringMap;
         var _loc6_:* = null;
         var _loc7_:* = null as Image;
         var _loc8_:* = null as AudioBuffer;
         var _loc4_:String = param2;
         if(_loc4_ == "FONT")
         {
            _loc5_ = font;
            _loc6_ = param3;
            if(param1 in StringMap.reserved)
            {
               _loc5_.setReserved(param1,_loc6_);
            }
            else
            {
               _loc5_.h[param1] = _loc6_;
            }
         }
         else if(_loc4_ == "IMAGE")
         {
            if(!(param3 is Image))
            {
               throw Exception.thrown("Cannot cache non-Image asset: " + Std.string(param3) + " as Image");
            }
            _loc5_ = image;
            _loc7_ = param3;
            if(param1 in StringMap.reserved)
            {
               _loc5_.setReserved(param1,_loc7_);
            }
            else
            {
               _loc5_.h[param1] = _loc7_;
            }
         }
         else
         {
            if(_loc4_ != "MUSIC")
            {
               if(_loc4_ != "SOUND")
               {
                  throw Exception.thrown(param2 + " assets are not cachable");
               }
            }
            if(!(param3 is AudioBuffer))
            {
               throw Exception.thrown("Cannot cache non-AudioBuffer asset: " + Std.string(param3) + " as AudioBuffer");
            }
            _loc5_ = audio;
            _loc8_ = param3;
            if(param1 in StringMap.reserved)
            {
               _loc5_.setReserved(param1,_loc8_);
            }
            else
            {
               _loc5_.h[param1] = _loc8_;
            }
         }
      }
      
      public function exists(param1:String, param2:String = undefined) : Boolean
      {
         var _loc3_:* = null as StringMap;
         if(param2 == "IMAGE" || param2 == null)
         {
            _loc3_ = image;
            if(param1 in StringMap.reserved ? _loc3_.existsReserved(param1) : param1 in _loc3_.h)
            {
               return true;
            }
         }
         if(param2 == "FONT" || param2 == null)
         {
            _loc3_ = font;
            if(param1 in StringMap.reserved ? _loc3_.existsReserved(param1) : param1 in _loc3_.h)
            {
               return true;
            }
         }
         if(param2 == "SOUND" || param2 == "MUSIC" || param2 == null)
         {
            _loc3_ = audio;
            if(param1 in StringMap.reserved ? _loc3_.existsReserved(param1) : param1 in _loc3_.h)
            {
               return true;
            }
         }
         return false;
      }
      
      public function clear(param1:String = undefined) : void
      {
         var _loc2_:* = null as StringMap;
         var _loc3_:* = null;
         var _loc4_:* = null;
         var _loc5_:int = 0;
         var _loc6_:Boolean = false;
         var _loc7_:* = null;
         var _loc8_:int = 0;
         var _loc9_:Boolean = false;
         var _loc10_:int = 0;
         var _loc11_:* = null;
         var _loc12_:int = 0;
         var _loc13_:Boolean = false;
         var _loc14_:* = null as String;
         var _loc15_:* = null as String;
         var _loc16_:* = null as StringMap;
         var _loc17_:* = null;
         var _loc18_:* = null;
         var _loc19_:int = 0;
         var _loc20_:Boolean = false;
         var _loc21_:int = 0;
         var _loc22_:* = null;
         var _loc23_:int = 0;
         var _loc24_:Boolean = false;
         var _loc25_:* = null as StringMap;
         var _loc26_:* = null;
         var _loc27_:* = null;
         var _loc28_:int = 0;
         var _loc29_:Boolean = false;
         var _loc30_:int = 0;
         var _loc31_:* = null;
         var _loc32_:int = 0;
         var _loc33_:Boolean = false;
         if(param1 == null)
         {
            audio = new StringMap();
            font = new StringMap();
            image = new StringMap();
         }
         else
         {
            _loc2_ = audio;
            _loc3_ = _loc2_.h;
            _loc4_ = _loc2_.rh;
            _loc5_ = 0;
            _loc6_ = false;
            _loc7_ = _loc3_;
            _loc8_ = _loc5_;
            _loc9_ = §§hasnext(_loc7_,_loc8_);
            if(!_loc9_ && _loc4_ != null)
            {
               _loc3_ = _loc4_;
               _loc7_ = _loc3_;
               _loc5_ = 0;
               _loc8_ = _loc5_;
               _loc4_ = null;
               _loc6_ = true;
               _loc9_ = §§hasnext(_loc7_,_loc8_);
            }
            _loc10_ = _loc8_;
            while(true)
            {
               _loc11_ = _loc3_;
               _loc12_ = _loc5_;
               _loc13_ = §§hasnext(_loc11_,_loc12_);
               if(!_loc13_ && _loc4_ != null)
               {
                  _loc3_ = _loc4_;
                  _loc11_ = _loc3_;
                  _loc5_ = 0;
                  _loc12_ = _loc5_;
                  _loc4_ = null;
                  _loc6_ = true;
                  _loc13_ = §§hasnext(_loc11_,_loc12_);
               }
               _loc10_ = _loc12_;
               if(!_loc13_)
               {
                  break;
               }
               _loc14_ = §§nextname(_loc10_,_loc3_);
               _loc5_ = _loc10_;
               if(_loc6_)
               {
                  _loc14_ = _loc14_.substr(1);
               }
               _loc15_ = _loc14_;
               if(StringTools.startsWith(_loc15_,param1))
               {
                  audio.remove(_loc15_);
               }
            }
            _loc16_ = font;
            _loc11_ = _loc16_.h;
            _loc17_ = _loc16_.rh;
            _loc12_ = 0;
            _loc13_ = false;
            _loc18_ = _loc11_;
            _loc19_ = _loc12_;
            _loc20_ = §§hasnext(_loc18_,_loc19_);
            if(!_loc20_ && _loc17_ != null)
            {
               _loc11_ = _loc17_;
               _loc18_ = _loc11_;
               _loc12_ = 0;
               _loc19_ = _loc12_;
               _loc17_ = null;
               _loc13_ = true;
               _loc20_ = §§hasnext(_loc18_,_loc19_);
            }
            _loc21_ = _loc19_;
            while(true)
            {
               _loc22_ = _loc11_;
               _loc23_ = _loc12_;
               _loc24_ = §§hasnext(_loc22_,_loc23_);
               if(!_loc24_ && _loc17_ != null)
               {
                  _loc11_ = _loc17_;
                  _loc22_ = _loc11_;
                  _loc12_ = 0;
                  _loc23_ = _loc12_;
                  _loc17_ = null;
                  _loc13_ = true;
                  _loc24_ = §§hasnext(_loc22_,_loc23_);
               }
               _loc21_ = _loc23_;
               if(!_loc24_)
               {
                  break;
               }
               _loc14_ = §§nextname(_loc21_,_loc11_);
               _loc12_ = _loc21_;
               if(_loc13_)
               {
                  _loc14_ = _loc14_.substr(1);
               }
               _loc15_ = _loc14_;
               if(StringTools.startsWith(_loc15_,param1))
               {
                  font.remove(_loc15_);
               }
            }
            _loc25_ = image;
            _loc22_ = _loc25_.h;
            _loc26_ = _loc25_.rh;
            _loc23_ = 0;
            _loc24_ = false;
            _loc27_ = _loc22_;
            _loc28_ = _loc23_;
            _loc29_ = §§hasnext(_loc27_,_loc28_);
            if(!_loc29_ && _loc26_ != null)
            {
               _loc22_ = _loc26_;
               _loc27_ = _loc22_;
               _loc23_ = 0;
               _loc28_ = _loc23_;
               _loc26_ = null;
               _loc24_ = true;
               _loc29_ = §§hasnext(_loc27_,_loc28_);
            }
            _loc30_ = _loc28_;
            while(true)
            {
               _loc31_ = _loc22_;
               _loc32_ = _loc23_;
               _loc33_ = §§hasnext(_loc31_,_loc32_);
               if(!_loc33_ && _loc26_ != null)
               {
                  _loc22_ = _loc26_;
                  _loc31_ = _loc22_;
                  _loc23_ = 0;
                  _loc32_ = _loc23_;
                  _loc26_ = null;
                  _loc24_ = true;
                  _loc33_ = §§hasnext(_loc31_,_loc32_);
               }
               _loc30_ = _loc32_;
               if(!_loc33_)
               {
                  break;
               }
               _loc14_ = §§nextname(_loc30_,_loc22_);
               _loc23_ = _loc30_;
               if(_loc24_)
               {
                  _loc14_ = _loc14_.substr(1);
               }
               _loc15_ = _loc14_;
               if(StringTools.startsWith(_loc15_,param1))
               {
                  image.remove(_loc15_);
               }
            }
         }
      }
   }
}

