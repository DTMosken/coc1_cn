package openfl.utils
{
   import flash.Boot;
   import flash.display.BitmapData;
   import flash.media.Sound;
   import flash.text.Font;
   import haxe.IMap;
   import haxe.ds.StringMap;
   import lime.utils.Assets;
   
   public class AssetCache implements IAssetCache
   {
      
      public var sound:IMap;
      
      public var font:IMap;
      
      public var bitmapData:IMap;
      
      public var __enabled:Boolean;
      
      public function AssetCache()
      {
         if(Boot.skip_constructor)
         {
            return;
         }
         __enabled = true;
         bitmapData = new StringMap();
         font = new StringMap();
         sound = new StringMap();
      }
      
      public function set_enabled(param1:Boolean) : Boolean
      {
         return __enabled = param1;
      }
      
      public function setSound(param1:String, param2:Sound) : void
      {
         var _loc3_:StringMap = sound;
         if(param1 in StringMap.reserved)
         {
            _loc3_.setReserved(param1,param2);
         }
         else
         {
            _loc3_.h[param1] = param2;
         }
      }
      
      public function setFont(param1:String, param2:Font) : void
      {
         var _loc3_:StringMap = font;
         if(param1 in StringMap.reserved)
         {
            _loc3_.setReserved(param1,param2);
         }
         else
         {
            _loc3_.h[param1] = param2;
         }
      }
      
      public function setBitmapData(param1:String, param2:BitmapData) : void
      {
         var _loc3_:StringMap = bitmapData;
         if(param1 in StringMap.reserved)
         {
            _loc3_.setReserved(param1,param2);
         }
         else
         {
            _loc3_.h[param1] = param2;
         }
      }
      
      public function removeSound(param1:String) : Boolean
      {
         lime.utils.Assets.cache.audio.remove(param1);
         return sound.remove(param1);
      }
      
      public function removeFont(param1:String) : Boolean
      {
         lime.utils.Assets.cache.font.remove(param1);
         return font.remove(param1);
      }
      
      public function removeBitmapData(param1:String) : Boolean
      {
         lime.utils.Assets.cache.image.remove(param1);
         return bitmapData.remove(param1);
      }
      
      public function hasSound(param1:String) : Boolean
      {
         var _loc2_:StringMap = sound;
         if(param1 in StringMap.reserved)
         {
            return _loc2_.existsReserved(param1);
         }
         return param1 in _loc2_.h;
      }
      
      public function hasFont(param1:String) : Boolean
      {
         var _loc2_:StringMap = font;
         if(param1 in StringMap.reserved)
         {
            return _loc2_.existsReserved(param1);
         }
         return param1 in _loc2_.h;
      }
      
      public function hasBitmapData(param1:String) : Boolean
      {
         var _loc2_:StringMap = bitmapData;
         if(param1 in StringMap.reserved)
         {
            return _loc2_.existsReserved(param1);
         }
         return param1 in _loc2_.h;
      }
      
      public function get_enabled() : Boolean
      {
         return __enabled;
      }
      
      public function getSound(param1:String) : Sound
      {
         var _loc2_:StringMap = sound;
         if(param1 in StringMap.reserved)
         {
            return _loc2_.getReserved(param1);
         }
         return _loc2_.h[param1];
      }
      
      public function getFont(param1:String) : Font
      {
         var _loc2_:StringMap = font;
         if(param1 in StringMap.reserved)
         {
            return _loc2_.getReserved(param1);
         }
         return _loc2_.h[param1];
      }
      
      public function getBitmapData(param1:String) : BitmapData
      {
         var _loc2_:StringMap = bitmapData;
         if(param1 in StringMap.reserved)
         {
            return _loc2_.getReserved(param1);
         }
         return _loc2_.h[param1];
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
            bitmapData = new StringMap();
            font = new StringMap();
            sound = new StringMap();
         }
         else
         {
            _loc2_ = bitmapData;
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
                  removeBitmapData(_loc15_);
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
                  removeFont(_loc15_);
               }
            }
            _loc25_ = sound;
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
                  removeSound(_loc15_);
               }
            }
         }
      }
   }
}

