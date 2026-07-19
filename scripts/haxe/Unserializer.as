package haxe
{
   import flash.Boot;
   import flash.utils.ByteArray;
   import haxe._Unserializer.DefaultResolver;
   import haxe.ds.IntMap;
   import haxe.ds.List;
   import haxe.ds.ObjectMap;
   import haxe.ds.StringMap;
   import haxe.io.Bytes;
   
   public class Unserializer
   {
      
      public static var init__:Boolean;
      
      public static var DEFAULT_RESOLVER:Object;
      
      public static var BASE64:String = "ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789%:";
      
      public static var CODES:ByteArray = null;
      
      public var scache:Array;
      
      public var resolver:Object;
      
      public var pos:int;
      
      public var length:int;
      
      public var cache:Array;
      
      public var buf:String;
      
      public function Unserializer(param1:String = undefined)
      {
         if(Boot.skip_constructor)
         {
            return;
         }
         buf = param1;
         length = buf.length;
         pos = 0;
         scache = [];
         cache = [];
         var _loc2_:* = Unserializer.DEFAULT_RESOLVER;
         if(_loc2_ == null)
         {
            _loc2_ = new DefaultResolver();
            Unserializer.DEFAULT_RESOLVER = _loc2_;
         }
         resolver = _loc2_;
      }
      
      public static function initCodes() : ByteArray
      {
         var _loc4_:int = 0;
         var _loc1_:ByteArray = new ByteArray();
         var _loc2_:int = 0;
         var _loc3_:int = Unserializer.BASE64.length;
         while(_loc2_ < _loc3_)
         {
            _loc4_ = _loc2_++;
            _loc1_[int(Unserializer.BASE64.charCodeAt(_loc4_))] = _loc4_;
         }
         return _loc1_;
      }
      
      public static function run(param1:String) : *
      {
         return new Unserializer(param1).unserialize();
      }
      
      public function unserializeObject(param1:Object) : void
      {
         var _loc2_:* = null;
         var _loc3_:* = null;
         while(true)
         {
            if(pos >= length)
            {
               throw Exception.thrown("Invalid object");
            }
            if(int(buf.charCodeAt(pos)) == 103)
            {
               break;
            }
            _loc2_ = unserialize();
            if(!(_loc2_ is String))
            {
               throw Exception.thrown("Invalid object key");
            }
            _loc3_ = unserialize();
            param1[_loc2_] = _loc3_;
         }
         ++pos;
      }
      
      public function unserializeEnum(param1:Class, param2:String) : Object
      {
         var _temp_2:* = buf;
         var _loc3_:int;
         pos = (_loc3_ = pos) + 1;
         if(int(_temp_2.charCodeAt(_loc3_)) != 58)
         {
            throw Exception.thrown("Invalid enum format");
         }
         _loc3_ = readDigits();
         if(_loc3_ == 0)
         {
            return Type.createEnum(param1,param2);
         }
         var _loc4_:Array = [];
         while(_loc3_-- > 0)
         {
            _loc4_.push(unserialize());
         }
         return Type.createEnum(param1,param2,_loc4_);
      }
      
      public function unserialize() : *
      {
         var _loc1_:int = 0;
         var _loc2_:* = null as String;
         var _loc3_:* = null as Class;
         var _loc4_:* = null;
         var _loc5_:* = null as ObjectMap;
         var _loc6_:* = null as Array;
         var _loc7_:int = 0;
         var _loc8_:* = null as StringMap;
         var _loc9_:* = null as String;
         var _loc10_:* = null as List;
         var _loc11_:* = null as IntMap;
         var _loc12_:int = 0;
         var _loc13_:* = null as ByteArray;
         var _loc14_:int = 0;
         var _loc15_:int = 0;
         var _loc16_:* = null as Bytes;
         var _loc17_:int = 0;
         var _loc18_:int = 0;
         var _loc19_:int = 0;
         var _loc20_:int = 0;
         var _loc21_:int = 0;
         var _loc22_:* = null as Date;
         var _temp_2:* = buf;
         pos = (_loc1_ = pos) + 1;
         switch(int(_temp_2.charCodeAt(_loc1_)))
         {
            case 65:
               _loc2_ = unserialize();
               _loc3_ = resolver.resolveClass(_loc2_);
               if(_loc3_ == null)
               {
                  throw Exception.thrown("Class not found " + _loc2_);
               }
               return _loc3_;
               break;
            case 66:
               _loc2_ = unserialize();
               _loc3_ = resolver.resolveEnum(_loc2_);
               if(_loc3_ == null)
               {
                  throw Exception.thrown("Enum not found " + _loc2_);
               }
               return _loc3_;
               break;
            case 67:
               _loc2_ = unserialize();
               _loc3_ = resolver.resolveClass(_loc2_);
               if(_loc3_ == null)
               {
                  throw Exception.thrown("Class not found " + _loc2_);
               }
               _loc4_ = Type.createEmptyInstance(_loc3_);
               cache.push(_loc4_);
               _loc4_.hxUnserialize(this);
               var _temp_4:* = buf;
               pos = (_loc1_ = pos) + 1;
               if(int(_temp_4.charCodeAt(_loc1_)) != 103)
               {
                  throw Exception.thrown("Invalid custom data");
               }
               return _loc4_;
               break;
            case 77:
               _loc5_ = new ObjectMap();
               cache.push(_loc5_);
               _loc2_ = buf;
               while(int(buf.charCodeAt(pos)) != 104)
               {
                  _loc4_ = unserialize();
                  _loc5_[_loc4_] = unserialize();
               }
               ++pos;
               return _loc5_;
            case 82:
               _loc1_ = readDigits();
               if(_loc1_ < 0 || _loc1_ >= int(scache.length))
               {
                  throw Exception.thrown("Invalid string reference");
               }
               return scache[_loc1_];
               break;
            case 97:
               _loc2_ = buf;
               _loc6_ = [];
               cache.push(_loc6_);
               while(true)
               {
                  _loc1_ = int(buf.charCodeAt(pos));
                  if(_loc1_ == 104)
                  {
                     ++pos;
                     break;
                  }
                  if(_loc1_ == 117)
                  {
                     ++pos;
                     _loc7_ = readDigits();
                     _loc6_[int(_loc6_.length) + _loc7_ - 1] = null;
                  }
                  else
                  {
                     _loc6_.push(unserialize());
                  }
               }
               return _loc6_;
            case 98:
               _loc8_ = new StringMap();
               cache.push(_loc8_);
               _loc2_ = buf;
               while(int(buf.charCodeAt(pos)) != 104)
               {
                  _loc9_ = unserialize();
                  _loc4_ = unserialize();
                  if(_loc9_ in StringMap.reserved)
                  {
                     _loc8_.setReserved(_loc9_,_loc4_);
                  }
                  else
                  {
                     _loc8_.h[_loc9_] = _loc4_;
                  }
               }
               ++pos;
               return _loc8_;
            case 99:
               _loc2_ = unserialize();
               _loc3_ = resolver.resolveClass(_loc2_);
               if(_loc3_ == null)
               {
                  throw Exception.thrown("Class not found " + _loc2_);
               }
               _loc4_ = Type.createEmptyInstance(_loc3_);
               cache.push(_loc4_);
               unserializeObject(_loc4_);
               return _loc4_;
               break;
            case 100:
               return readFloat();
            case 102:
               return false;
            case 105:
               return readDigits();
            case 106:
               _loc2_ = unserialize();
               _loc3_ = resolver.resolveEnum(_loc2_);
               if(_loc3_ == null)
               {
                  throw Exception.thrown("Enum not found " + _loc2_);
               }
               ++pos;
               _loc1_ = readDigits();
               _loc9_ = Type.getEnumConstructs(_loc3_)[_loc1_];
               if(_loc9_ == null)
               {
                  throw Exception.thrown("Unknown enum index " + _loc2_ + "@" + _loc1_);
               }
               _loc4_ = unserializeEnum(_loc3_,_loc9_);
               cache.push(_loc4_);
               return _loc4_;
               break;
            case 107:
               return Number(Math.NaN);
            case 108:
               _loc10_ = new List();
               cache.push(_loc10_);
               _loc2_ = buf;
               while(int(buf.charCodeAt(pos)) != 104)
               {
                  _loc10_.add(unserialize());
               }
               ++pos;
               return _loc10_;
            case 109:
               return Number(Math.NEGATIVE_INFINITY);
            case 110:
               return null;
            case 111:
               _loc4_ = {};
               cache.push(_loc4_);
               unserializeObject(_loc4_);
               return _loc4_;
            case 112:
               return Number(Math.POSITIVE_INFINITY);
            case 113:
               _loc11_ = new IntMap();
               cache.push(_loc11_);
               _loc2_ = buf;
               var _temp_6:* = buf;
               pos = (_loc7_ = pos) + 1;
               _loc1_ = int(_temp_6.charCodeAt(_loc7_));
               while(_loc1_ == 58)
               {
                  _loc7_ = readDigits();
                  _loc4_ = unserialize();
                  _loc11_.h[_loc7_] = _loc4_;
                  var _temp_8:* = buf;
                  pos = (_loc12_ = pos) + 1;
                  _loc1_ = int(_temp_8.charCodeAt(_loc12_));
               }
               if(_loc1_ != 104)
               {
                  throw Exception.thrown("Invalid IntMap format");
               }
               return _loc11_;
               break;
            case 114:
               _loc1_ = readDigits();
               if(_loc1_ < 0 || _loc1_ >= int(cache.length))
               {
                  throw Exception.thrown("Invalid reference");
               }
               return cache[_loc1_];
               break;
            case 115:
               _loc1_ = readDigits();
               _loc2_ = buf;
               §§push(true);
               var _temp_10:* = buf;
               pos = (_loc7_ = pos) + 1;
               if(int(_temp_10.charCodeAt(_loc7_)) == 58)
               {
                  §§pop();
                  §§push(length - pos < _loc1_);
               }
               if(§§pop())
               {
                  throw Exception.thrown("Invalid bytes length");
               }
               _loc13_ = Unserializer.CODES;
               if(_loc13_ == null)
               {
                  _loc13_ = Unserializer.initCodes();
                  Unserializer.CODES = _loc13_;
               }
               _loc7_ = pos;
               _loc12_ = _loc1_ & 3;
               _loc14_ = (_loc1_ >> 2) * 3 + (_loc12_ >= 2 ? _loc12_ - 1 : 0);
               _loc15_ = _loc7_ + (_loc1_ - _loc12_);
               _loc16_ = Bytes.alloc(_loc14_);
               _loc17_ = 0;
               while(_loc7_ < _loc15_)
               {
                  _loc18_ = int(_loc13_[int(_loc2_.charCodeAt(_loc7_++))]);
                  _loc19_ = int(_loc13_[int(_loc2_.charCodeAt(_loc7_++))]);
                  _loc16_.b[_loc17_++] = _loc18_ << 2 | _loc19_ >> 4;
                  _loc20_ = int(_loc13_[int(_loc2_.charCodeAt(_loc7_++))]);
                  _loc16_.b[_loc17_++] = _loc19_ << 4 | _loc20_ >> 2;
                  _loc21_ = int(_loc13_[int(_loc2_.charCodeAt(_loc7_++))]);
                  _loc16_.b[_loc17_++] = _loc20_ << 6 | _loc21_;
               }
               if(_loc12_ >= 2)
               {
                  _loc18_ = int(_loc13_[int(_loc2_.charCodeAt(_loc7_++))]);
                  _loc19_ = int(_loc13_[int(_loc2_.charCodeAt(_loc7_++))]);
                  _loc16_.b[_loc17_++] = _loc18_ << 2 | _loc19_ >> 4;
                  if(_loc12_ == 3)
                  {
                     _loc20_ = int(_loc13_[int(_loc2_.charCodeAt(_loc7_++))]);
                     _loc16_.b[_loc17_++] = _loc19_ << 4 | _loc20_ >> 2;
                  }
               }
               pos += _loc1_;
               cache.push(_loc16_);
               return _loc16_;
               break;
            case 116:
               return true;
            case 118:
               if(int(buf.charCodeAt(pos)) >= 48 && int(buf.charCodeAt(pos)) <= 57 && int(buf.charCodeAt(pos + 1)) >= 48 && int(buf.charCodeAt(pos + 1)) <= 57 && int(buf.charCodeAt(pos + 2)) >= 48 && int(buf.charCodeAt(pos + 2)) <= 57 && int(buf.charCodeAt(pos + 3)) >= 48 && int(buf.charCodeAt(pos + 3)) <= 57 && int(buf.charCodeAt(pos + 4)) == 45)
               {
                  _loc22_ = Date.fromString(buf.substr(pos,19));
                  pos += 19;
               }
               else
               {
                  _loc22_ = Date.fromTime(readFloat());
               }
               cache.push(_loc22_);
               return _loc22_;
            case 119:
               _loc2_ = unserialize();
               _loc3_ = resolver.resolveEnum(_loc2_);
               if(_loc3_ == null)
               {
                  throw Exception.thrown("Enum not found " + _loc2_);
               }
               _loc4_ = unserializeEnum(_loc3_,unserialize());
               cache.push(_loc4_);
               return _loc4_;
               break;
            case 120:
               throw Exception.thrown(unserialize());
            case 121:
               _loc1_ = readDigits();
               §§push(true);
               var _temp_12:* = buf;
               pos = (_loc7_ = pos) + 1;
               if(int(_temp_12.charCodeAt(_loc7_)) == 58)
               {
                  §§pop();
                  §§push(length - pos < _loc1_);
               }
               if(§§pop())
               {
                  throw Exception.thrown("Invalid string length");
               }
               _loc2_ = buf.substr(pos,_loc1_);
               pos += _loc1_;
               _loc2_ = decodeURIComponent(_loc2_.split("+").join(" "));
               scache.push(_loc2_);
               return _loc2_;
               break;
            case 122:
               return 0;
            default:
               --pos;
               throw Exception.thrown("Invalid char " + buf.charAt(pos) + " at position " + pos);
         }
      }
      
      public function readFloat() : Number
      {
         var _loc2_:int = 0;
         var _loc1_:int = pos;
         while(true)
         {
            _loc2_ = int(buf.charCodeAt(pos));
            if(_loc2_ == 0)
            {
               break;
            }
            if(!(_loc2_ >= 43 && _loc2_ < 58 || _loc2_ == 101 || _loc2_ == 69))
            {
               break;
            }
            ++pos;
         }
         return Std.parseFloat(buf.substr(_loc1_,pos - _loc1_));
      }
      
      public function readDigits() : int
      {
         var _loc4_:int = 0;
         var _loc1_:int = 0;
         var _loc2_:Boolean = false;
         var _loc3_:int = pos;
         while(true)
         {
            _loc4_ = int(buf.charCodeAt(pos));
            if(_loc4_ == 0)
            {
               break;
            }
            if(_loc4_ == 45)
            {
               if(pos != _loc3_)
               {
                  break;
               }
               _loc2_ = true;
               ++pos;
            }
            else
            {
               if(_loc4_ < 48 || _loc4_ > 57)
               {
                  break;
               }
               _loc1_ = _loc1_ * 10 + (_loc4_ - 48);
               ++pos;
            }
         }
         if(_loc2_)
         {
            _loc1_ *= -1;
         }
         return _loc1_;
      }
   }
}

import flash.utils.ByteArray;

