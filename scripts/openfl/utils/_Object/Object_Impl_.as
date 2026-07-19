package openfl.utils._Object
{
   import flash.display.DisplayObject;
   import flash.display.DisplayObjectContainer;
   import haxe.iterators.ArrayIterator;
   import haxe.lang.Iterable;
   
   public final class Object_Impl_
   {
      
      public static var __meta__:* = {"statics":{
         "iterator":{"SuppressWarnings":["checkstyle:FieldDocComment"]},
         "__get":{"SuppressWarnings":["checkstyle:FieldDocComment"]},
         "__set":{"SuppressWarnings":["checkstyle:FieldDocComment"]},
         "__getArray":{"SuppressWarnings":["checkstyle:FieldDocComment"]},
         "__setArray":{"SuppressWarnings":["checkstyle:FieldDocComment"]}
      }};
      
      public function Object_Impl_()
      {
      }
      
      public static function _new() : Object
      {
         return {};
      }
      
      public static function hasOwnProperty(param1:Object, param2:String) : Boolean
      {
         if(param1 != null)
         {
            return Reflect.hasField(param1,param2);
         }
         return false;
      }
      
      public static function isPrototypeOf(param1:Object, param2:Class) : Boolean
      {
         var _loc3_:* = null as Class;
         if(param1 != null)
         {
            _loc3_ = Type.getClass(param1);
            while(_loc3_ != null)
            {
               if(_loc3_ == param2)
               {
                  return true;
               }
               _loc3_ = Type.getSuperClass(_loc3_);
            }
         }
         return false;
      }
      
      public static function iterator(param1:Object) : Object
      {
         var _loc2_:* = null as Array;
         var _loc3_:* = null as DisplayObjectContainer;
         var _loc4_:int = 0;
         var _loc5_:int = 0;
         var _loc6_:int = 0;
         var _loc7_:* = null as DisplayObject;
         var _loc8_:* = null as String;
         if(param1 is Array)
         {
            _loc2_ = param1;
            return new ArrayIterator(_loc2_);
         }
         _loc2_ = Reflect.fields(param1);
         if(_loc2_ == null)
         {
            _loc2_ = [];
         }
         if(param1 is DisplayObjectContainer)
         {
            _loc3_ = param1;
            _loc4_ = 0;
            _loc5_ = _loc3_.numChildren;
            while(_loc4_ < _loc5_)
            {
               _loc6_ = _loc4_++;
               _loc7_ = _loc3_.getChildAt(_loc6_);
               _loc8_ = _loc7_.name;
               if(_loc8_ != null && _loc2_.indexOf(_loc8_) == -1)
               {
                  _loc2_.push(_loc8_);
               }
            }
         }
         return new ArrayIterator(_loc2_);
      }
      
      public static function propertyIsEnumerable(param1:Object, param2:String) : Boolean
      {
         if(param1 != null && Reflect.hasField(param1,param2))
         {
            return Reflect.field(param1,param2) is Iterable;
         }
         return false;
      }
      
      public static function toLocaleString(param1:Object) : String
      {
         if(param1 == null)
         {
            return null;
         }
         return Std.string(param1);
      }
      
      public static function toString(param1:Object) : String
      {
         if(param1 == null)
         {
            return null;
         }
         return Std.string(param1);
      }
      
      public static function valueOf(param1:Object) : Object
      {
         return param1;
      }
      
      public static function __fieldRead(param1:Object, param2:String) : Object
      {
         return Object_Impl_.__get(param1,param2);
      }
      
      public static function __fieldWrite(param1:Object, param2:String, param3:Object) : Object
      {
         if(param1 != null)
         {
            Reflect.setProperty(param1,param2,param3);
         }
         return param3;
      }
      
      public static function __get(param1:Object, param2:String) : Object
      {
         var _loc3_:* = null as DisplayObjectContainer;
         var _loc4_:* = null as DisplayObject;
         if(param1 == null || param2 == null)
         {
            return null;
         }
         if(Reflect.hasField(param1,param2))
         {
            return Reflect.field(param1,param2);
         }
         if(param1 is DisplayObjectContainer)
         {
            _loc3_ = param1;
            _loc4_ = _loc3_.getChildByName(param2);
            if(_loc4_ != null)
            {
               return _loc4_;
            }
         }
         return Reflect.getProperty(param1,param2);
      }
      
      public static function __set(param1:Object, param2:String, param3:Object) : Object
      {
         if(param1 != null)
         {
            Reflect.setProperty(param1,param2,param3);
         }
         return param3;
      }
      
      public static function __getArray(param1:Object, param2:int) : Object
      {
         if(param1 == null)
         {
            return null;
         }
         var _loc3_:Array = param1;
         return _loc3_[param2];
      }
      
      public static function __setArray(param1:Object, param2:int, param3:Object) : Object
      {
         if(param1 == null)
         {
            return param3;
         }
         var _loc4_:Array = param1;
         return _loc4_[param2] = param3;
      }
      
      public static function toFunction(param1:Object) : *
      {
         return param1;
      }
      
      public static function toFloat(param1:Object) : Number
      {
         if(Std.isOfType(param1,Number))
         {
            return Number(param1);
         }
         return Number(Math.NaN);
      }
      
      public static function toInt(param1:Object) : int
      {
         return int(param1);
      }
      
      public static function toBool(param1:Object) : Boolean
      {
         if(Std.isOfType(param1,Boolean))
         {
            return Boolean(param1);
         }
         if(Std.isOfType(param1,Number))
         {
            return param1 != 0;
         }
         return param1 != null;
      }
      
      public static function __negate(param1:Object) : *
      {
         var _loc2_:Number = Number(param1);
         return -_loc2_;
      }
      
      public static function __preIncrement(param1:Object) : *
      {
         var _loc2_:Number = Number(param1);
         return ++_loc2_;
      }
      
      public static function __postIncrement(param1:Object) : *
      {
         var _loc2_:Number = Number(param1);
         var _loc3_:Number = _loc2_;
         _loc2_ = _loc3_ + 1;
         return _loc3_;
      }
      
      public static function __preDecrement(param1:Object) : *
      {
         var _loc2_:Number = Number(param1);
         return --_loc2_;
      }
      
      public static function __postDecrement(param1:Object) : *
      {
         var _loc2_:Number = Number(param1);
         var _loc3_:Number = _loc2_;
         _loc2_ = _loc3_ - 1;
         return _loc3_;
      }
      
      public static function __add(param1:Object, param2:Object) : *
      {
         var _loc3_:Number = NaN;
         var _loc4_:Number = NaN;
         if(param1 is String || param2 is String)
         {
            return (param1 == null ? "null" : (param1 == null ? null : Std.string(param1))) + (param2 == null ? "null" : (param2 == null ? null : Std.string(param2)));
         }
         _loc3_ = Number(param1);
         _loc4_ = Number(param2);
         return _loc3_ + _loc4_;
      }
      
      public static function __addString(param1:Object, param2:String) : String
      {
         var _loc3_:String = param1 == null ? "null" : (param1 == null ? null : Std.string(param1));
         return _loc3_ + param2;
      }
      
      public static function __addInt(param1:Object, param2:int) : *
      {
         var _loc3_:Number = Number(param1);
         return _loc3_ + param2;
      }
      
      public static function __addFloat(param1:Object, param2:Number) : Number
      {
         var _loc3_:Number = Number(param1);
         return _loc3_ + param2;
      }
      
      public static function __sub(param1:Object, param2:Object) : *
      {
         var _loc3_:Number = Number(param1);
         var _loc4_:Number = Number(param2);
         return _loc3_ - _loc4_;
      }
      
      public static function __subInt(param1:Object, param2:int) : *
      {
         var _loc3_:Number = Number(param1);
         return _loc3_ - param2;
      }
      
      public static function __intSub(param1:int, param2:Object) : *
      {
         var _loc3_:Number = Number(param2);
         return param1 - _loc3_;
      }
      
      public static function __subFloat(param1:Object, param2:Number) : Number
      {
         var _loc3_:Number = Number(param1);
         return _loc3_ - param2;
      }
      
      public static function __floatSub(param1:Number, param2:Object) : Number
      {
         var _loc3_:Number = Number(param2);
         return param1 - _loc3_;
      }
      
      public static function __mul(param1:Object, param2:Object) : *
      {
         var _loc3_:Number = Number(param1);
         var _loc4_:Number = Number(param2);
         return _loc3_ * _loc4_;
      }
      
      public static function __mulInt(param1:Object, param2:int) : *
      {
         var _loc3_:Number = Number(param1);
         return _loc3_ * param2;
      }
      
      public static function __mulFloat(param1:Object, param2:Number) : Number
      {
         var _loc3_:Number = Number(param1);
         return _loc3_ * param2;
      }
      
      public static function __div(param1:Object, param2:Object) : Number
      {
         var _loc3_:Number = Number(param1);
         var _loc4_:Number = Number(param2);
         return _loc3_ / _loc4_;
      }
      
      public static function __divInt(param1:Object, param2:int) : Number
      {
         var _loc3_:Number = Number(param1);
         return _loc3_ / param2;
      }
      
      public static function __intDiv(param1:int, param2:Object) : Number
      {
         var _loc3_:Number = Number(param2);
         return param1 / _loc3_;
      }
      
      public static function __divFloat(param1:Object, param2:Number) : Number
      {
         var _loc3_:Number = Number(param1);
         return _loc3_ / param2;
      }
      
      public static function __floatDiv(param1:Number, param2:Object) : Number
      {
         var _loc3_:Number = Number(param2);
         return param1 / _loc3_;
      }
      
      public static function __mod(param1:Object, param2:Object) : Number
      {
         var _loc3_:Number = Number(param1);
         var _loc4_:Number = Number(param2);
         return _loc3_ % _loc4_;
      }
      
      public static function __modInt(param1:Object, param2:int) : Number
      {
         var _loc3_:Number = Number(param1);
         return _loc3_ % param2;
      }
      
      public static function __intMod(param1:int, param2:Object) : Number
      {
         var _loc3_:Number = Number(param2);
         return param1 % _loc3_;
      }
      
      public static function __modFloat(param1:Object, param2:Number) : Number
      {
         var _loc3_:Number = Number(param1);
         return _loc3_ % param2;
      }
      
      public static function __floatMod(param1:Number, param2:Object) : Number
      {
         var _loc3_:Number = Number(param2);
         return param1 % _loc3_;
      }
      
      public static function __eq(param1:Object, param2:Object) : Boolean
      {
         var _loc3_:* = param1;
         var _loc4_:* = param2;
         return _loc3_ == _loc4_;
      }
      
      public static function __eqDynamic(param1:Object, param2:*) : Boolean
      {
         var _loc3_:* = param1;
         return _loc3_ == param2;
      }
      
      public static function __neq(param1:Object, param2:Object) : Boolean
      {
         var _loc3_:* = param1;
         var _loc4_:* = param2;
         return _loc3_ != _loc4_;
      }
      
      public static function __neqDynamic(param1:Object, param2:*) : Boolean
      {
         var _loc3_:* = param1;
         return _loc3_ != param2;
      }
      
      public static function __lt(param1:Object, param2:Object) : Boolean
      {
         var _loc3_:Number = Number(param1);
         var _loc4_:Number = Number(param2);
         return _loc3_ < _loc4_;
      }
      
      public static function __ltInt(param1:Object, param2:int) : Boolean
      {
         var _loc3_:Number = Number(param1);
         return _loc3_ < param2;
      }
      
      public static function __intLt(param1:int, param2:Object) : Boolean
      {
         var _loc3_:Number = Number(param2);
         return param1 < _loc3_;
      }
      
      public static function __ltFloat(param1:Object, param2:Number) : Boolean
      {
         var _loc3_:Number = Number(param1);
         return _loc3_ < param2;
      }
      
      public static function __floatLt(param1:Number, param2:Object) : Boolean
      {
         var _loc3_:Number = Number(param2);
         return param1 < _loc3_;
      }
      
      public static function __lte(param1:Object, param2:Object) : Boolean
      {
         var _loc3_:Number = Number(param1);
         var _loc4_:Number = Number(param2);
         return _loc3_ <= _loc4_;
      }
      
      public static function __lteInt(param1:Object, param2:int) : Boolean
      {
         var _loc3_:Number = param2;
         return Object_Impl_.__lte(param1,_loc3_);
      }
      
      public static function __intLte(param1:int, param2:Object) : Boolean
      {
         var _loc3_:Number = param1;
         return Object_Impl_.__lte(_loc3_,param2);
      }
      
      public static function __lteFloat(param1:Object, param2:Number) : Boolean
      {
         var _loc3_:Number = param2;
         return Object_Impl_.__lte(param1,_loc3_);
      }
      
      public static function __floatLte(param1:Number, param2:Object) : Boolean
      {
         var _loc3_:Number = param1;
         return Object_Impl_.__lte(_loc3_,param2);
      }
      
      public static function __gt(param1:Object, param2:Object) : Boolean
      {
         var _loc3_:Number = Number(param1);
         var _loc4_:Number = Number(param2);
         return _loc3_ > _loc4_;
      }
      
      public static function __gtInt(param1:Object, param2:int) : Boolean
      {
         var _loc3_:Number = param2;
         return Object_Impl_.__gt(param1,_loc3_);
      }
      
      public static function __intGt(param1:int, param2:Object) : Boolean
      {
         var _loc3_:Number = Number(param2);
         return param1 > _loc3_;
      }
      
      public static function __gtFloat(param1:Object, param2:Number) : Boolean
      {
         var _loc3_:Number = param2;
         return Object_Impl_.__gt(param1,_loc3_);
      }
      
      public static function __floatGt(param1:Number, param2:Object) : Boolean
      {
         var _loc3_:Number = Number(param2);
         return param1 > _loc3_;
      }
      
      public static function __gte(param1:Object, param2:Object) : Boolean
      {
         var _loc3_:Number = Number(param1);
         var _loc4_:Number = Number(param2);
         return _loc3_ >= _loc4_;
      }
      
      public static function __gteInt(param1:Object, param2:int) : Boolean
      {
         var _loc3_:Number = param2;
         return Object_Impl_.__gte(param1,_loc3_);
      }
      
      public static function __intGte(param1:int, param2:Object) : Boolean
      {
         var _loc3_:Number = Number(param2);
         return param1 >= _loc3_;
      }
      
      public static function __gteFloat(param1:Object, param2:Number) : Boolean
      {
         var _loc3_:Number = param2;
         return Object_Impl_.__gte(param1,_loc3_);
      }
      
      public static function __floatGte(param1:Number, param2:Object) : Boolean
      {
         var _loc3_:Number = Number(param2);
         return param1 >= _loc3_;
      }
      
      public static function __complement(param1:Object) : int
      {
         var _loc2_:int = int(param1);
         return ~_loc2_;
      }
      
      public static function __and(param1:Object, param2:Object) : int
      {
         var _loc3_:int = int(param1);
         var _loc4_:int = int(param2);
         return _loc3_ & _loc4_;
      }
      
      public static function __andInt(param1:Object, param2:int) : int
      {
         var _loc3_:int = int(param1);
         return _loc3_ & param2;
      }
      
      public static function __or(param1:Object, param2:Object) : int
      {
         var _loc3_:int = int(param1);
         var _loc4_:int = int(param2);
         return _loc3_ | _loc4_;
      }
      
      public static function __orInt(param1:Object, param2:int) : int
      {
         var _loc3_:int = int(param1);
         return _loc3_ | param2;
      }
      
      public static function __xor(param1:Object, param2:Object) : int
      {
         var _loc3_:int = int(param1);
         var _loc4_:int = int(param2);
         return _loc3_ ^ _loc4_;
      }
      
      public static function __xorInt(param1:Object, param2:int) : int
      {
         var _loc3_:int = int(param1);
         return _loc3_ ^ param2;
      }
      
      public static function __shr(param1:Object, param2:Object) : int
      {
         var _loc3_:int = int(param1);
         var _loc4_:int = int(param2);
         return _loc3_ >> _loc4_;
      }
      
      public static function __shrInt(param1:Object, param2:int) : int
      {
         var _loc3_:int = int(param1);
         return _loc3_ >> param2;
      }
      
      public static function __intShr(param1:int, param2:Object) : int
      {
         var _loc3_:int = int(param2);
         return param1 >> _loc3_;
      }
      
      public static function __ushr(param1:Object, param2:Object) : int
      {
         var _loc3_:int = int(param1);
         var _loc4_:int = int(param2);
         return _loc3_ >>> _loc4_;
      }
      
      public static function __ushrInt(param1:Object, param2:int) : int
      {
         var _loc3_:int = int(param1);
         return _loc3_ >>> param2;
      }
      
      public static function __intUshr(param1:int, param2:Object) : int
      {
         var _loc3_:int = int(param2);
         return param1 >>> _loc3_;
      }
      
      public static function __shl(param1:Object, param2:Object) : int
      {
         var _loc3_:int = int(param1);
         var _loc4_:int = int(param2);
         return _loc3_ << _loc4_;
      }
      
      public static function __shlInt(param1:Object, param2:int) : int
      {
         var _loc3_:int = int(param1);
         return _loc3_ << param2;
      }
      
      public static function __intShl(param1:int, param2:Object) : int
      {
         var _loc3_:int = int(param2);
         return param1 << _loc3_;
      }
   }
}

