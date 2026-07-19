package haxe
{
   import flash.Boot;
   import flash.utils.Dictionary;
   import flash.utils.describeType;
   import haxe.ds.IntMap;
   import haxe.ds.List;
   import haxe.ds.ObjectMap;
   import haxe.ds.StringMap;
   import haxe.ds._List.ListNode;
   import haxe.io.Bytes;
   
   public class Serializer
   {
      
      public static var USE_CACHE:Boolean = false;
      
      public static var USE_ENUM_INDEX:Boolean = false;
      
      public static var BASE64:String = "ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789%:";
      
      public static var BASE64_CODES:Vector.<Object> = null;
      
      public var useEnumIndex:Boolean;
      
      public var useCache:Boolean;
      
      public var shash:StringMap;
      
      public var scount:int;
      
      public var cache:Array;
      
      public var buf:StringBuf;
      
      public function Serializer()
      {
         if(Boot.skip_constructor)
         {
            return;
         }
         buf = new StringBuf();
         cache = [];
         useCache = Serializer.USE_CACHE;
         useEnumIndex = Serializer.USE_ENUM_INDEX;
         shash = new StringMap();
         scount = 0;
      }
      
      public static function run(param1:*) : String
      {
         var _loc2_:Serializer = new Serializer();
         _loc2_.serialize(param1);
         return _loc2_.toString();
      }
      
      public function toString() : String
      {
         return buf.b;
      }
      
      public function serializeString(param1:String) : void
      {
         var _loc2_:StringMap = shash;
         var _loc3_:Object = param1 in StringMap.reserved ? _loc2_.getReserved(param1) : _loc2_.h[param1];
         if(_loc3_ != null)
         {
            _temp_1.b += "R";
            _temp_2.b += Std.string(_loc3_);
            return;
         }
         var _loc4_:StringMap = shash;
         var _loc6_:int;
         scount = (_loc6_ = scount) + 1;
         var _loc5_:int = _loc6_;
         if(param1 in StringMap.reserved)
         {
            _loc4_.setReserved(param1,_loc5_);
         }
         else
         {
            _loc4_.h[param1] = _loc5_;
         }
         _temp_4.b += "y";
         param1 = encodeURIComponent(param1);
         _temp_5.b += Std.string(param1.length);
         _temp_6.b += ":";
         _temp_7.b += Std.string(param1);
      }
      
      public function serializeRef(param1:*) : Boolean
      {
         var _loc4_:int = 0;
         var _loc2_:int = 0;
         var _loc3_:int = int(cache.length);
         while(_loc2_ < _loc3_)
         {
            _loc4_ = _loc2_++;
            if(cache[_loc4_] == param1)
            {
               _temp_1.b += "r";
               _temp_2.b += Std.string(_loc4_);
               return true;
            }
         }
         cache.push(param1);
         return false;
      }
      
      public function serializeFields(param1:Object) : void
      {
         var _loc4_:* = null as String;
         var _loc2_:int = 0;
         var _loc3_:Array = Reflect.fields(param1);
         while(_loc2_ < int(_loc3_.length))
         {
            _loc4_ = _loc3_[_loc2_];
            _loc2_++;
            serializeString(_loc4_);
            serialize(Reflect.field(param1,_loc4_));
         }
         _temp_1.b += "g";
      }
      
      public function serializeClassFields(param1:*, param2:*) : void
      {
         var _loc7_:int = 0;
         var _loc8_:* = null as String;
         var _loc3_:XML = describeType(param2);
         var _loc4_:XMLList = _loc3_.factory[0].child("variable");
         var _loc5_:int = 0;
         var _loc6_:int = _loc4_.length();
         while(_loc5_ < _loc6_)
         {
            _loc7_ = _loc5_++;
            _loc8_ = _loc4_[_loc7_].attribute("name").toString();
            if(param1.hasOwnProperty(_loc8_))
            {
               serializeString(_loc8_);
               serialize(Reflect.field(param1,_loc8_));
            }
         }
         _temp_1.b += "g";
      }
      
      public function serialize(param1:*) : void
      {
         var _loc4_:int = 0;
         var _loc5_:Number = NaN;
         var _loc6_:* = null as String;
         var _loc7_:* = null as Class;
         var _loc8_:* = null as Class;
         var _loc9_:* = null as Array;
         var _loc10_:int = 0;
         var _loc11_:int = 0;
         var _loc12_:int = 0;
         var _loc13_:int = 0;
         var _loc14_:* = null as Date;
         var _loc15_:* = null as StringBuf;
         var _loc16_:* = null as IntMap;
         var _loc17_:* = null as Dictionary;
         var _loc18_:* = null as Dictionary;
         var _loc19_:Boolean = false;
         var _loc20_:* = null as Dictionary;
         var _loc21_:Boolean = false;
         var _loc22_:int = 0;
         var _loc23_:* = null as List;
         var _loc24_:* = null as ListNode;
         var _loc25_:* = null;
         var _loc26_:* = null;
         var _loc27_:* = null as ObjectMap;
         var _loc28_:* = null as StringMap;
         var _loc29_:* = null;
         var _loc30_:* = null;
         var _loc31_:Boolean = false;
         var _loc32_:* = null as String;
         var _loc33_:* = null as Bytes;
         var _loc34_:* = null as Vector.<Object>;
         var _loc3_:ValueType = Type.§typeof§(param1);
         switch(_loc3_.index)
         {
            case 0:
               _temp_1.b += "n";
               break;
            case 1:
               _loc4_ = param1;
               if(_loc4_ == 0)
               {
                  _temp_2.b += "z";
                  return;
               }
               _temp_3.b += "i";
               _temp_4.b += Std.string(_loc4_);
               break;
            case 2:
               _loc5_ = param1;
               if(Boolean(Math.isNaN(_loc5_)))
               {
                  _temp_5.b += "k";
               }
               else if(!Boolean(Math.isFinite(_loc5_)))
               {
                  var _temp_6:* = buf;
                  _temp_6.b += Std.string(_loc5_ < 0 ? "m" : "p");
               }
               else
               {
                  _temp_7.b += "d";
                  _temp_8.b += Std.string(_loc5_);
               }
               break;
            case 3:
               var _temp_9:* = buf;
               _temp_9.b += Std.string(param1 ? "t" : "f");
               break;
            case 4:
               if(Std.isOfType(param1,Class))
               {
                  _loc6_ = Type.getClassName(param1);
                  if(Type.resolveEnum(_loc6_) != null)
                  {
                     _temp_10.b += "B";
                  }
                  else
                  {
                     _temp_11.b += "A";
                  }
                  serializeString(_loc6_);
               }
               else if(Std.isOfType(param1,Class))
               {
                  _temp_12.b += "B";
                  serializeString(Type.getEnumName(param1));
               }
               else
               {
                  if(useCache && serializeRef(param1))
                  {
                     return;
                  }
                  _temp_13.b += "o";
                  serializeFields(param1);
               }
               break;
            case 5:
               throw Exception.thrown("Cannot serialize function");
            case 6:
               _loc7_ = _loc3_.params[0];
               if(_loc7_ == String)
               {
                  serializeString(param1);
                  return;
               }
               if(useCache && serializeRef(param1))
               {
                  return;
               }
               _loc8_ = _loc7_;
               if(_loc8_ == Array)
               {
                  _loc4_ = 0;
                  _temp_14.b += "a";
                  _loc9_ = param1;
                  _loc10_ = int(_loc9_.length);
                  _loc11_ = 0;
                  _loc12_ = _loc10_;
                  while(_loc11_ < _loc12_)
                  {
                     _loc13_ = _loc11_++;
                     if(_loc9_[_loc13_] == null)
                     {
                        _loc4_++;
                     }
                     else
                     {
                        if(_loc4_ > 0)
                        {
                           if(_loc4_ == 1)
                           {
                              _temp_15.b += "n";
                           }
                           else
                           {
                              _temp_16.b += "u";
                              _temp_17.b += Std.string(_loc4_);
                           }
                           _loc4_ = 0;
                        }
                        serialize(_loc9_[_loc13_]);
                     }
                  }
                  if(_loc4_ > 0)
                  {
                     if(_loc4_ == 1)
                     {
                        _temp_18.b += "n";
                     }
                     else
                     {
                        _temp_19.b += "u";
                        _temp_20.b += Std.string(_loc4_);
                     }
                  }
                  _temp_21.b += "h";
               }
               else if(_loc8_ == Date)
               {
                  _loc14_ = param1;
                  _temp_22.b += "v";
                  _loc15_ = buf;
                  _loc5_ = _loc14_.getTime();
                  _loc15_.b += Std.string(_loc5_);
               }
               else if(_loc8_ == IntMap)
               {
                  _temp_23.b += "q";
                  _loc16_ = param1;
                  _loc17_ = _loc16_.h;
                  _loc4_ = 0;
                  _loc18_ = _loc17_;
                  _loc10_ = _loc4_;
                  _loc19_ = §§hasnext(_loc18_,_loc10_);
                  _loc11_ = _loc10_;
                  while(true)
                  {
                     _loc20_ = _loc17_;
                     _loc12_ = _loc4_;
                     _loc21_ = §§hasnext(_loc20_,_loc12_);
                     _loc11_ = _loc12_;
                     if(!_loc21_)
                     {
                        break;
                     }
                     _loc13_ = §§nextname(_loc11_,_loc17_);
                     _loc4_ = _loc11_;
                     _loc22_ = _loc13_;
                     _temp_24.b += ":";
                     _temp_25.b += Std.string(_loc22_);
                     serialize(_loc16_.h[_loc22_]);
                  }
                  _temp_26.b += "h";
               }
               else if(_loc8_ == List)
               {
                  _temp_27.b += "l";
                  _loc23_ = param1;
                  _loc24_ = _loc23_.h;
                  while(_loc24_ != null)
                  {
                     _loc25_ = _loc24_.item;
                     _loc24_ = _loc24_.next;
                     _loc26_ = _loc25_;
                     serialize(_loc26_);
                  }
                  _temp_28.b += "h";
               }
               else if(_loc8_ == ObjectMap)
               {
                  _temp_29.b += "M";
                  _loc27_ = param1;
                  _loc25_ = _loc27_.keys();
                  while(Boolean(_loc25_.hasNext()))
                  {
                     _loc26_ = _loc25_.next();
                     serialize(_loc26_);
                     serialize(_loc27_[_loc26_]);
                  }
                  _temp_30.b += "h";
               }
               else if(_loc8_ == StringMap)
               {
                  _temp_31.b += "b";
                  _loc28_ = param1;
                  _loc25_ = _loc28_.h;
                  _loc26_ = _loc28_.rh;
                  _loc4_ = 0;
                  _loc19_ = false;
                  _loc29_ = _loc25_;
                  _loc10_ = _loc4_;
                  _loc21_ = §§hasnext(_loc29_,_loc10_);
                  if(!_loc21_ && _loc26_ != null)
                  {
                     _loc25_ = _loc26_;
                     _loc29_ = _loc25_;
                     _loc4_ = 0;
                     _loc10_ = _loc4_;
                     _loc26_ = null;
                     _loc19_ = true;
                     _loc21_ = §§hasnext(_loc29_,_loc10_);
                  }
                  _loc11_ = _loc10_;
                  while(true)
                  {
                     _loc30_ = _loc25_;
                     _loc12_ = _loc4_;
                     _loc31_ = §§hasnext(_loc30_,_loc12_);
                     if(!_loc31_ && _loc26_ != null)
                     {
                        _loc25_ = _loc26_;
                        _loc30_ = _loc25_;
                        _loc4_ = 0;
                        _loc12_ = _loc4_;
                        _loc26_ = null;
                        _loc19_ = true;
                        _loc31_ = §§hasnext(_loc30_,_loc12_);
                     }
                     _loc11_ = _loc12_;
                     if(!_loc31_)
                     {
                        break;
                     }
                     _loc6_ = §§nextname(_loc11_,_loc25_);
                     _loc4_ = _loc11_;
                     if(_loc19_)
                     {
                        _loc6_ = _loc6_.substr(1);
                     }
                     _loc32_ = _loc6_;
                     serializeString(_loc32_);
                     serialize(_loc32_ in StringMap.reserved ? _loc28_.getReserved(_loc32_) : _loc28_.h[_loc32_]);
                  }
                  _temp_32.b += "h";
               }
               else if(_loc8_ == Bytes)
               {
                  _loc33_ = param1;
                  _temp_33.b += "s";
                  _temp_34.b += Std.string(int(Math.ceil(_loc33_.length * 8 / 6)));
                  _temp_35.b += ":";
                  _loc4_ = 0;
                  _loc10_ = _loc33_.length - 2;
                  _loc34_ = Serializer.BASE64_CODES;
                  if(_loc34_ == null)
                  {
                     _loc34_ = new Vector.<Object>(Serializer.BASE64.length,true);
                     _loc11_ = 0;
                     _loc12_ = Serializer.BASE64.length;
                     while(_loc11_ < _loc12_)
                     {
                        _loc13_ = _loc11_++;
                        _loc34_[_loc13_] = Serializer.BASE64.charCodeAt(_loc13_);
                     }
                     Serializer.BASE64_CODES = _loc34_;
                  }
                  while(_loc4_ < _loc10_)
                  {
                     _loc11_ = int(_loc33_.b[_loc4_++]);
                     _loc12_ = int(_loc33_.b[_loc4_++]);
                     _loc13_ = int(_loc33_.b[_loc4_++]);
                     _loc22_ = int(_loc34_[_loc11_ >> 2]);
                     var _temp_36:* = buf;
                     _temp_36.b += _loc22_ < 65536 ? String["fromCharCode"](_loc22_) : Boot.fromCodePoint(_loc22_);
                     _loc22_ = int(_loc34_[(_loc11_ << 4 | _loc12_ >> 4) & 0x3F]);
                     var _temp_37:* = buf;
                     _temp_37.b += _loc22_ < 65536 ? String["fromCharCode"](_loc22_) : Boot.fromCodePoint(_loc22_);
                     _loc22_ = int(_loc34_[(_loc12_ << 2 | _loc13_ >> 6) & 0x3F]);
                     var _temp_38:* = buf;
                     _temp_38.b += _loc22_ < 65536 ? String["fromCharCode"](_loc22_) : Boot.fromCodePoint(_loc22_);
                     _loc22_ = int(_loc34_[_loc13_ & 0x3F]);
                     var _temp_39:* = buf;
                     _temp_39.b += _loc22_ < 65536 ? String["fromCharCode"](_loc22_) : Boot.fromCodePoint(_loc22_);
                  }
                  if(_loc4_ == _loc10_)
                  {
                     _loc11_ = int(_loc33_.b[_loc4_++]);
                     _loc12_ = int(_loc33_.b[_loc4_++]);
                     _loc13_ = int(_loc34_[_loc11_ >> 2]);
                     var _temp_40:* = buf;
                     _temp_40.b += _loc13_ < 65536 ? String["fromCharCode"](_loc13_) : Boot.fromCodePoint(_loc13_);
                     _loc13_ = int(_loc34_[(_loc11_ << 4 | _loc12_ >> 4) & 0x3F]);
                     var _temp_41:* = buf;
                     _temp_41.b += _loc13_ < 65536 ? String["fromCharCode"](_loc13_) : Boot.fromCodePoint(_loc13_);
                     _loc13_ = int(_loc34_[_loc12_ << 2 & 0x3F]);
                     var _temp_42:* = buf;
                     _temp_42.b += _loc13_ < 65536 ? String["fromCharCode"](_loc13_) : Boot.fromCodePoint(_loc13_);
                  }
                  else if(_loc4_ == _loc10_ + 1)
                  {
                     _loc11_ = int(_loc33_.b[_loc4_++]);
                     _loc12_ = int(_loc34_[_loc11_ >> 2]);
                     var _temp_43:* = buf;
                     _temp_43.b += _loc12_ < 65536 ? String["fromCharCode"](_loc12_) : Boot.fromCodePoint(_loc12_);
                     _loc12_ = int(_loc34_[_loc11_ << 4 & 0x3F]);
                     var _temp_44:* = buf;
                     _temp_44.b += _loc12_ < 65536 ? String["fromCharCode"](_loc12_) : Boot.fromCodePoint(_loc12_);
                  }
               }
               else
               {
                  if(useCache)
                  {
                     cache.pop();
                  }
                  try
                  {
                     _loc19_ = param1.hxSerialize != null;
                  }
                  catch(_loc_e_:*)
                  {
                     if(_loc19_)
                     {
                        _temp_45.b += "C";
                        serializeString(Type.getClassName(_loc7_));
                        if(useCache)
                        {
                           cache.push(param1);
                        }
                        param1.hxSerialize(this);
                        _temp_46.b += "g";
                     }
                     else
                     {
                        _temp_47.b += "c";
                        serializeString(Type.getClassName(_loc7_));
                        if(useCache)
                        {
                           cache.push(param1);
                        }
                        serializeClassFields(param1,_loc7_);
                     }
                  }
               }
               break;
            case 7:
               _loc7_ = _loc3_.params[0];
               if(useCache)
               {
                  if(serializeRef(param1))
                  {
                     return;
                  }
                  cache.pop();
               }
               var _temp_48:* = buf;
               _temp_48.b += Std.string(useEnumIndex ? "j" : "w");
               serializeString(Type.getEnumName(_loc7_));
               if(useEnumIndex)
               {
                  _temp_49.b += ":";
                  _loc4_ = param1.index;
                  _temp_50.b += Std.string(_loc4_);
               }
               else
               {
                  serializeString(param1.tag);
               }
               _temp_51.b += ":";
               _loc9_ = param1.params;
               if(_loc9_ == null)
               {
                  _temp_52.b += "0";
               }
               else
               {
                  _temp_53.b += Std.string(int(_loc9_.length));
                  _loc4_ = 0;
                  while(_loc4_ < int(_loc9_.length))
                  {
                     _loc25_ = _loc9_[_loc4_];
                     _loc4_++;
                     serialize(_loc25_);
                  }
               }
               if(useCache)
               {
                  cache.push(param1);
               }
               break;
            default:
               throw Exception.thrown("Cannot serialize " + Std.string(param1));
         }
      }
   }
}

