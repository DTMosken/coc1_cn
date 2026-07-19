package format.amf3
{
   import haxe.Exception;
   import haxe.IMap;
   import haxe.ds.EnumValueMap;
   import haxe.ds.IntMap;
   import haxe.ds.ObjectMap;
   import haxe.ds.StringMap;
   import haxe.io.Bytes;
   
   public class Tools
   {
      
      public function Tools()
      {
      }
      
      public static function encode(param1:*) : Value
      {
         var _loc3_:* = null as IMap;
         var _loc4_:int = 0;
         var _loc5_:* = null as Array;
         var _loc6_:* = null as String;
         var _loc7_:* = null as Value;
         var _loc8_:* = null as Class;
         var _loc9_:* = null as Class;
         var _loc10_:* = null as Array;
         var _loc11_:* = null;
         var _loc12_:* = null as Amf3Array;
         var _loc13_:* = null as StringMap;
         var _loc14_:* = null;
         var _loc15_:* = null;
         var _loc16_:int = 0;
         var _loc17_:Boolean = false;
         var _loc18_:int = 0;
         var _loc19_:* = null;
         var _loc20_:int = 0;
         var _loc21_:Boolean = false;
         var _loc22_:* = null as String;
         var _loc23_:* = null as StringMap;
         var _loc24_:* = null as IMap;
         var _loc25_:Boolean = false;
         var _loc2_:ValueType = Type.§typeof§(param1);
         switch(_loc2_.index)
         {
            case 0:
               return Value.ANull;
            case 1:
               return Value.AInt(param1);
            case 2:
               return Value.ANumber(param1);
            case 3:
               return Value.ABool(param1);
            case 4:
               _loc3_ = new StringMap();
               _loc4_ = 0;
               _loc5_ = Reflect.fields(param1);
               while(_loc4_ < int(_loc5_.length))
               {
                  _loc6_ = _loc5_[_loc4_];
                  _loc4_++;
                  _loc7_ = Tools.encode(Reflect.field(param1,_loc6_));
                  if(_loc6_ in StringMap.reserved)
                  {
                     _loc3_.setReserved(_loc6_,_loc7_);
                  }
                  else
                  {
                     _loc3_.h[_loc6_] = _loc7_;
                  }
               }
               return Value.AObject(_loc3_,null,null);
            case 6:
               _loc8_ = _loc2_.params[0];
               _loc9_ = _loc8_;
               if(_loc9_ == Array)
               {
                  _loc5_ = param1;
                  _loc10_ = [];
                  _loc4_ = 0;
                  while(_loc4_ < int(_loc5_.length))
                  {
                     _loc11_ = _loc5_[_loc4_];
                     _loc4_++;
                     _loc10_.push(Tools.encode(_loc11_));
                  }
                  return Value.AArray(_loc10_);
               }
               if(_loc9_ == Date)
               {
                  return Value.ADate(param1);
               }
               if(_loc9_ == String)
               {
                  return Value.AString(param1);
               }
               if(_loc9_ == Xml)
               {
                  return Value.AXml(param1);
               }
               if(_loc9_ == Amf3Array)
               {
                  _loc12_ = param1;
                  _loc5_ = [];
                  _loc3_ = new StringMap();
                  _loc4_ = 0;
                  _loc10_ = _loc12_.a;
                  while(_loc4_ < int(_loc10_.length))
                  {
                     _loc11_ = _loc10_[_loc4_];
                     _loc4_++;
                     _loc5_.push(Tools.encode(_loc11_));
                  }
                  _loc13_ = _loc12_.extra;
                  _loc11_ = _loc13_.h;
                  _loc14_ = _loc13_.rh;
                  _loc4_ = 0;
                  _loc15_ = _loc11_;
                  _loc16_ = _loc4_;
                  _loc17_ = §§hasnext(_loc15_,_loc16_);
                  if(!_loc17_ && _loc14_ != null)
                  {
                     _loc11_ = _loc14_;
                     _loc15_ = _loc11_;
                     _loc4_ = 0;
                     _loc16_ = _loc4_;
                     _loc14_ = null;
                     _loc17_ = §§hasnext(_loc15_,_loc16_);
                  }
                  _loc18_ = _loc16_;
                  while(true)
                  {
                     _loc19_ = _loc11_;
                     _loc20_ = _loc4_;
                     _loc21_ = §§hasnext(_loc19_,_loc20_);
                     if(!_loc21_ && _loc14_ != null)
                     {
                        _loc11_ = _loc14_;
                        _loc19_ = _loc11_;
                        _loc4_ = 0;
                        _loc20_ = _loc4_;
                        _loc14_ = null;
                        _loc21_ = §§hasnext(_loc19_,_loc20_);
                     }
                     _loc18_ = _loc20_;
                     if(!_loc21_)
                     {
                        break;
                     }
                     _loc6_ = §§nextvalue(_loc18_,_loc11_);
                     _loc4_ = _loc18_;
                     _loc22_ = _loc6_;
                     _loc23_ = _loc12_.extra;
                     _loc7_ = Tools.encode(_loc22_ in StringMap.reserved ? _loc23_.getReserved(_loc22_) : _loc23_.h[_loc22_]);
                     if(_loc22_ in StringMap.reserved)
                     {
                        _loc3_.setReserved(_loc22_,_loc7_);
                     }
                     else
                     {
                        _loc3_.h[_loc22_] = _loc7_;
                     }
                  }
                  return Value.AArray(_loc5_,_loc3_);
               }
               if(_loc9_ != IntMap)
               {
                  if(_loc9_ != ObjectMap)
                  {
                     if(_loc9_ != StringMap)
                     {
                        if(_loc9_ == Bytes)
                        {
                           return Value.ABytes(param1);
                        }
                        _loc3_ = new StringMap();
                        _loc4_ = 0;
                        _loc9_ = Type.getClass(param1);
                        _loc16_ = 0;
                        _loc5_ = Type.getInstanceFields(_loc9_);
                        while(_loc16_ < int(_loc5_.length))
                        {
                           _loc6_ = _loc5_[_loc16_];
                           _loc16_++;
                           _loc7_ = Tools.encode(Reflect.getProperty(param1,_loc6_));
                           if(_loc6_ in StringMap.reserved)
                           {
                              _loc3_.setReserved(_loc6_,_loc7_);
                           }
                           else
                           {
                              _loc3_.h[_loc6_] = _loc7_;
                           }
                           _loc4_++;
                        }
                        return Value.AObject(_loc3_,_loc4_,Type.getClassName(_loc9_));
                     }
                  }
               }
               _loc3_ = param1;
               _loc24_ = new EnumValueMap();
               _loc11_ = _loc3_.h;
               _loc14_ = _loc3_.rh;
               _loc4_ = 0;
               _loc17_ = false;
               _loc15_ = _loc11_;
               _loc16_ = _loc4_;
               _loc21_ = §§hasnext(_loc15_,_loc16_);
               if(!_loc21_ && _loc14_ != null)
               {
                  _loc11_ = _loc14_;
                  _loc15_ = _loc11_;
                  _loc4_ = 0;
                  _loc16_ = _loc4_;
                  _loc14_ = null;
                  _loc17_ = true;
                  _loc21_ = §§hasnext(_loc15_,_loc16_);
               }
               _loc18_ = _loc16_;
               while(true)
               {
                  _loc19_ = _loc11_;
                  _loc20_ = _loc4_;
                  _loc25_ = §§hasnext(_loc19_,_loc20_);
                  if(!_loc25_ && _loc14_ != null)
                  {
                     _loc11_ = _loc14_;
                     _loc19_ = _loc11_;
                     _loc4_ = 0;
                     _loc20_ = _loc4_;
                     _loc14_ = null;
                     _loc17_ = true;
                     _loc25_ = §§hasnext(_loc19_,_loc20_);
                  }
                  _loc18_ = _loc20_;
                  if(!_loc25_)
                  {
                     break;
                  }
                  _loc6_ = §§nextname(_loc18_,_loc11_);
                  _loc4_ = _loc18_;
                  if(_loc17_)
                  {
                     _loc6_ = _loc6_.substr(1);
                  }
                  _loc22_ = _loc6_;
                  _loc24_.set(Tools.encode(_loc22_),Tools.encode(_loc22_ in StringMap.reserved ? _loc3_.getReserved(_loc22_) : _loc3_.h[_loc22_]));
               }
               return Value.AMap(_loc24_);
               break;
            default:
               throw Exception.thrown("Can\'t encode " + Std.string(param1));
         }
      }
      
      public static function decode(param1:Value) : *
      {
         var _loc2_:Boolean = false;
         var _loc3_:int = 0;
         var _loc4_:Number = NaN;
         var _loc5_:* = null as String;
         var _loc6_:* = null as Date;
         var _loc7_:* = null as IMap;
         var _loc8_:* = null as Object;
         var _loc9_:* = null as Array;
         var _loc10_:* = null as Vector.<Value>;
         var _loc11_:* = null as Xml;
         var _loc12_:* = null as Bytes;
         switch(param1.index)
         {
            case 0:
               return Tools.undefined(param1);
            case 1:
               return Tools.anull(param1);
            case 2:
               _loc2_ = Boolean(param1.params[0]);
               return Tools.bool(param1);
            case 3:
               _loc3_ = int(param1.params[0]);
               return Tools._int(param1);
            case 4:
               _loc4_ = Number(param1.params[0]);
               return Tools.number(param1);
            case 5:
               _loc5_ = param1.params[0];
               return Tools.string(param1);
            case 6:
               _loc6_ = param1.params[0];
               return Tools.date(param1);
            case 7:
               _loc7_ = param1.params[0];
               _loc8_ = param1.params[1];
               _loc5_ = param1.params[2];
               return Tools.object(param1);
            case 8:
               _loc9_ = param1.params[0];
               _loc7_ = param1.params[1];
               return Tools.array(param1);
            case 9:
               _loc10_ = param1.params[0];
               _loc5_ = param1.params[1];
               return Tools.vector(param1);
            case 10:
               _loc11_ = param1.params[0];
               return Tools.xml(param1);
            case 11:
               _loc12_ = param1.params[0];
               return Tools.bytes(param1);
            case 12:
               _loc7_ = param1.params[0];
               return Tools.map(param1);
            default:
               return;
         }
      }
      
      public static function undefined(param1:Value) : *
      {
         return null;
      }
      
      public static function anull(param1:Value) : *
      {
         return null;
      }
      
      public static function bool(param1:Value) : Object
      {
         var _loc2_:Boolean = false;
         if(param1 == null)
         {
            return null;
         }
         if(param1.index == 2)
         {
            return Boolean(param1.params[0]);
         }
         return null;
      }
      
      public static function _int(param1:Value) : Object
      {
         var _loc2_:int = 0;
         if(param1 == null)
         {
            return null;
         }
         if(param1.index == 3)
         {
            return int(param1.params[0]);
         }
         return null;
      }
      
      public static function number(param1:Value) : Object
      {
         var _loc2_:Number = NaN;
         if(param1 == null)
         {
            return null;
         }
         if(param1.index == 4)
         {
            return Number(param1.params[0]);
         }
         return null;
      }
      
      public static function string(param1:Value) : String
      {
         var _loc2_:* = null as String;
         if(param1 == null)
         {
            return null;
         }
         if(param1.index == 5)
         {
            return param1.params[0];
         }
         return null;
      }
      
      public static function date(param1:Value) : Date
      {
         var _loc2_:* = null as Date;
         if(param1 == null)
         {
            return null;
         }
         if(param1.index == 6)
         {
            return param1.params[0];
         }
         return null;
      }
      
      public static function array(param1:Value) : Amf3Array
      {
         var _loc2_:* = null as Array;
         var _loc3_:* = null as IMap;
         var _loc4_:* = null as Array;
         var _loc5_:int = 0;
         var _loc6_:* = null as Value;
         var _loc7_:* = null as IMap;
         var _loc8_:* = null;
         var _loc9_:* = null;
         var _loc10_:Boolean = false;
         var _loc11_:* = null;
         var _loc12_:int = 0;
         var _loc13_:Boolean = false;
         var _loc14_:int = 0;
         var _loc15_:* = null;
         var _loc16_:int = 0;
         var _loc17_:Boolean = false;
         var _loc18_:* = null as String;
         var _loc19_:* = null as String;
         var _loc20_:* = null;
         var _loc21_:* = null;
         if(param1 == null)
         {
            return null;
         }
         if(param1.index == 8)
         {
            _loc2_ = param1.params[0];
            _loc3_ = param1.params[1];
            _loc4_ = [];
            _loc5_ = 0;
            while(_loc5_ < int(_loc2_.length))
            {
               _loc6_ = _loc2_[_loc5_];
               _loc5_++;
               _loc4_.push(Tools.decode(_loc6_));
            }
            _loc7_ = new StringMap();
            _loc8_ = _loc3_.h;
            _loc9_ = _loc3_.rh;
            _loc5_ = 0;
            _loc10_ = false;
            _loc11_ = _loc8_;
            _loc12_ = _loc5_;
            _loc13_ = §§hasnext(_loc11_,_loc12_);
            if(!_loc13_ && _loc9_ != null)
            {
               _loc8_ = _loc9_;
               _loc11_ = _loc8_;
               _loc5_ = 0;
               _loc12_ = _loc5_;
               _loc9_ = null;
               _loc10_ = true;
               _loc13_ = §§hasnext(_loc11_,_loc12_);
            }
            _loc14_ = _loc12_;
            while(true)
            {
               _loc15_ = _loc8_;
               _loc16_ = _loc5_;
               _loc17_ = §§hasnext(_loc15_,_loc16_);
               if(!_loc17_ && _loc9_ != null)
               {
                  _loc8_ = _loc9_;
                  _loc15_ = _loc8_;
                  _loc5_ = 0;
                  _loc16_ = _loc5_;
                  _loc9_ = null;
                  _loc10_ = true;
                  _loc17_ = §§hasnext(_loc15_,_loc16_);
               }
               _loc14_ = _loc16_;
               if(!_loc17_)
               {
                  break;
               }
               _loc18_ = §§nextname(_loc14_,_loc8_);
               _loc5_ = _loc14_;
               if(_loc10_)
               {
                  _loc18_ = _loc18_.substr(1);
               }
               _loc19_ = _loc18_;
               _loc20_ = Tools.decode(_loc19_ in StringMap.reserved ? _loc3_.getReserved(_loc19_) : _loc3_.h[_loc19_]);
               _loc21_ = _loc20_;
               if(_loc19_ in StringMap.reserved)
               {
                  _loc7_.setReserved(_loc19_,_loc21_);
               }
               else
               {
                  _loc7_.h[_loc19_] = _loc21_;
               }
            }
            return new Amf3Array(_loc4_,_loc7_);
         }
         return null;
      }
      
      public static function vector(param1:Value) : Vector.<Object>
      {
         var _loc2_:* = null as String;
         var _loc3_:* = null as Vector.<Value>;
         var _loc4_:* = null as Vector.<Object>;
         var _loc5_:int = 0;
         var _loc6_:int = 0;
         var _loc7_:int = 0;
         if(param1 == null)
         {
            return null;
         }
         if(param1.index == 9)
         {
            _loc2_ = param1.params[1];
            _loc3_ = param1.params[0];
            _loc4_ = new Vector.<Object>(int(_loc3_.length),true);
            _loc5_ = 0;
            _loc6_ = int(_loc3_.length);
            while(_loc5_ < _loc6_)
            {
               _loc7_ = _loc5_++;
               _loc4_[_loc7_] = Tools.decode(_loc3_[_loc7_]);
            }
            return _loc4_;
         }
         return null;
      }
      
      public static function object(param1:Value) : IMap
      {
         var _loc2_:* = null as Object;
         var _loc3_:* = null as String;
         var _loc4_:* = null as IMap;
         var _loc5_:* = null as IMap;
         var _loc6_:* = null;
         var _loc7_:* = null;
         var _loc8_:int = 0;
         var _loc9_:Boolean = false;
         var _loc10_:* = null;
         var _loc11_:int = 0;
         var _loc12_:Boolean = false;
         var _loc13_:int = 0;
         var _loc14_:* = null;
         var _loc15_:int = 0;
         var _loc16_:Boolean = false;
         var _loc17_:* = null as String;
         var _loc18_:* = null as String;
         var _loc19_:* = null;
         if(param1 == null)
         {
            return null;
         }
         if(param1.index == 7)
         {
            _loc2_ = param1.params[1];
            _loc3_ = param1.params[2];
            _loc4_ = param1.params[0];
            _loc5_ = new StringMap();
            _loc6_ = _loc4_.h;
            _loc7_ = _loc4_.rh;
            _loc8_ = 0;
            _loc9_ = false;
            _loc10_ = _loc6_;
            _loc11_ = _loc8_;
            _loc12_ = §§hasnext(_loc10_,_loc11_);
            if(!_loc12_ && _loc7_ != null)
            {
               _loc6_ = _loc7_;
               _loc10_ = _loc6_;
               _loc8_ = 0;
               _loc11_ = _loc8_;
               _loc7_ = null;
               _loc9_ = true;
               _loc12_ = §§hasnext(_loc10_,_loc11_);
            }
            _loc13_ = _loc11_;
            while(true)
            {
               _loc14_ = _loc6_;
               _loc15_ = _loc8_;
               _loc16_ = §§hasnext(_loc14_,_loc15_);
               if(!_loc16_ && _loc7_ != null)
               {
                  _loc6_ = _loc7_;
                  _loc14_ = _loc6_;
                  _loc8_ = 0;
                  _loc15_ = _loc8_;
                  _loc7_ = null;
                  _loc9_ = true;
                  _loc16_ = §§hasnext(_loc14_,_loc15_);
               }
               _loc13_ = _loc15_;
               if(!_loc16_)
               {
                  break;
               }
               _loc17_ = §§nextname(_loc13_,_loc6_);
               _loc8_ = _loc13_;
               if(_loc9_)
               {
                  _loc17_ = _loc17_.substr(1);
               }
               _loc18_ = _loc17_;
               _loc19_ = Tools.decode(_loc18_ in StringMap.reserved ? _loc4_.getReserved(_loc18_) : _loc4_.h[_loc18_]);
               if(_loc18_ in StringMap.reserved)
               {
                  _loc5_.setReserved(_loc18_,_loc19_);
               }
               else
               {
                  _loc5_.h[_loc18_] = _loc19_;
               }
            }
            return _loc5_;
         }
         return null;
      }
      
      public static function xml(param1:Value) : Xml
      {
         var _loc2_:* = null as Xml;
         if(param1 == null)
         {
            return null;
         }
         if(param1.index == 10)
         {
            return param1.params[0];
         }
         return null;
      }
      
      public static function bytes(param1:Value) : Bytes
      {
         var _loc2_:* = null as Bytes;
         if(param1 == null)
         {
            return null;
         }
         if(param1.index == 11)
         {
            return param1.params[0];
         }
         return null;
      }
      
      public static function map(param1:Value) : IMap
      {
         var _loc2_:* = null as IMap;
         var _loc3_:* = null as IMap;
         var _loc4_:* = null;
         var _loc5_:* = null as Value;
         if(param1 == null)
         {
            return null;
         }
         if(param1.index == 12)
         {
            _loc2_ = param1.params[0];
            _loc3_ = new EnumValueMap();
            _loc4_ = _loc2_.keys();
            while(Boolean(_loc4_.hasNext()))
            {
               _loc5_ = _loc4_.next();
               _loc3_.set(Tools.decode(_loc5_),Tools.decode(_loc2_.get(_loc5_)));
            }
            return _loc3_;
         }
         return null;
      }
   }
}

