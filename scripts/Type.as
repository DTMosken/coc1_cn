package
{
   import flash.Boot;
   import flash.utils.describeType;
   import flash.utils.getDefinitionByName;
   import flash.utils.getQualifiedClassName;
   import flash.utils.getQualifiedSuperclassName;
   import haxe.Exception;
   
   public class Type
   {
      
      public function Type()
      {
      }
      
      public static function getClass(param1:Object) : Class
      {
         var _loc2_:String = getQualifiedClassName(param1);
         if(_loc2_ == "null" || _loc2_ == "Object" || _loc2_ == "int" || _loc2_ == "Number" || _loc2_ == "Boolean")
         {
            return null;
         }
         if(param1.hasOwnProperty("prototype"))
         {
            return null;
         }
         var _loc3_:* = getDefinitionByName(_loc2_) as Class;
         if(Boolean(_loc3_.__isenum))
         {
            return null;
         }
         return _loc3_;
      }
      
      public static function getSuperClass(param1:Class) : Class
      {
         var _loc2_:String = getQualifiedSuperclassName(param1);
         if(_loc2_ == null || _loc2_ == "Object")
         {
            return null;
         }
         return getDefinitionByName(_loc2_) as Class;
      }
      
      public static function getClassName(param1:Class) : String
      {
         var _loc4_:int = 0;
         if(param1 == null)
         {
            return null;
         }
         var _loc2_:String = getQualifiedClassName(param1);
         var _loc3_:String = _loc2_;
         if(_loc3_ == "Boolean")
         {
            return "Bool";
         }
         if(_loc3_ == "Number")
         {
            return "Float";
         }
         if(_loc3_ == "int")
         {
            return "Int";
         }
         _loc4_ = _loc2_.lastIndexOf("::");
         if(_loc4_ == -1)
         {
            return _loc2_;
         }
         return _loc2_.substring(0,_loc4_) + "." + _loc2_.substring(_loc4_ + 2);
      }
      
      public static function getEnumName(param1:Class) : String
      {
         return Type.getClassName(param1);
      }
      
      public static function resolveClass(param1:String) : Class
      {
         var _loc3_:* = null as Class;
         var _loc4_:* = null;
         var _loc5_:* = null as String;
         try
         {
            _loc3_ = getDefinitionByName(param1) as Class;
            if(Boolean(_loc3_.__isenum))
            {
               return null;
            }
            return _loc3_;
         }
         catch(_loc_e_:*)
         {
            if(_loc5_ == "Int")
            {
               return int;
            }
            return null;
         }
      }
      
      public static function resolveEnum(param1:String) : Class
      {
         var _loc3_:* = null;
         var _loc4_:* = null;
         try
         {
            _loc3_ = getDefinitionByName(param1);
            if(!_loc3_.__isenum)
            {
               return null;
            }
            return _loc3_;
         }
         catch(_loc_e_:*)
         {
            return null;
         }
      }
      
      public static function createInstance(param1:Class, param2:Array) : Object
      {
         switch(int(param2.length))
         {
            case 0:
               return new param1();
            case 1:
               return new param1(param2[0]);
            case 2:
               return new param1(param2[0],param2[1]);
            case 3:
               return new param1(param2[0],param2[1],param2[2]);
            case 4:
               return new param1(param2[0],param2[1],param2[2],param2[3]);
            case 5:
               return new param1(param2[0],param2[1],param2[2],param2[3],param2[4]);
            case 6:
               return new param1(param2[0],param2[1],param2[2],param2[3],param2[4],param2[5]);
            case 7:
               return new param1(param2[0],param2[1],param2[2],param2[3],param2[4],param2[5],param2[6]);
            case 8:
               return new param1(param2[0],param2[1],param2[2],param2[3],param2[4],param2[5],param2[6],param2[7]);
            case 9:
               return new param1(param2[0],param2[1],param2[2],param2[3],param2[4],param2[5],param2[6],param2[7],param2[8]);
            case 10:
               return new param1(param2[0],param2[1],param2[2],param2[3],param2[4],param2[5],param2[6],param2[7],param2[8],param2[9]);
            case 11:
               return new param1(param2[0],param2[1],param2[2],param2[3],param2[4],param2[5],param2[6],param2[7],param2[8],param2[9],param2[10]);
            case 12:
               return new param1(param2[0],param2[1],param2[2],param2[3],param2[4],param2[5],param2[6],param2[7],param2[8],param2[9],param2[10],param2[11]);
            case 13:
               return new param1(param2[0],param2[1],param2[2],param2[3],param2[4],param2[5],param2[6],param2[7],param2[8],param2[9],param2[10],param2[11],param2[12]);
            case 14:
               return new param1(param2[0],param2[1],param2[2],param2[3],param2[4],param2[5],param2[6],param2[7],param2[8],param2[9],param2[10],param2[11],param2[12],param2[13]);
            default:
               throw Exception.thrown("Too many arguments");
         }
      }
      
      public static function createEmptyInstance(param1:Class) : Object
      {
         var _loc3_:* = null as Object;
         var _loc4_:* = null;
         var _loc5_:* = null;
         try
         {
            Boot.skip_constructor = true;
            _loc3_ = new param1();
            Boot.skip_constructor = false;
            return _loc3_;
         }
         catch(_loc_e_:*)
         {
            _loc5_ = Exception.caught(_loc4_).unwrap();
            Boot.skip_constructor = false;
            throw Exception.thrown(_loc5_);
         }
      }
      
      public static function createEnum(param1:Class, param2:String, param3:Array = undefined) : Object
      {
         var _loc4_:* = param1[param2];
         if(_loc4_ == null)
         {
            throw Exception.thrown("No such constructor " + param2);
         }
         if(Reflect.isFunction(_loc4_))
         {
            if(param3 == null)
            {
               throw Exception.thrown("Constructor " + param2 + " need parameters");
            }
            return _loc4_.apply(param1,param3);
         }
         if(param3 != null && int(param3.length) != 0)
         {
            throw Exception.thrown("Constructor " + param2 + " does not need parameters");
         }
         return _loc4_;
      }
      
      public static function describe(param1:*, param2:Boolean) : Array
      {
         var _loc8_:int = 0;
         var _loc3_:Array = [];
         var _loc4_:XML = describeType(param1);
         if(param2)
         {
            _loc4_ = _loc4_.factory[0];
         }
         var _loc5_:XMLList = _loc4_.child("method");
         var _loc6_:int = 0;
         var _loc7_:int = _loc5_.length();
         while(_loc6_ < _loc7_)
         {
            _loc8_ = _loc6_++;
            _loc3_.push(Std.string(_loc5_[_loc8_].attribute("name")));
         }
         var _loc9_:XMLList = _loc4_.child("variable");
         _loc6_ = 0;
         _loc7_ = _loc9_.length();
         while(_loc6_ < _loc7_)
         {
            _loc8_ = _loc6_++;
            _loc3_.push(Std.string(_loc9_[_loc8_].attribute("name")));
         }
         var _loc10_:XMLList = _loc4_.child("accessor");
         _loc6_ = 0;
         _loc7_ = _loc10_.length();
         while(_loc6_ < _loc7_)
         {
            _loc8_ = _loc6_++;
            _loc3_.push(Std.string(_loc10_[_loc8_].attribute("name")));
         }
         return _loc3_;
      }
      
      public static function getInstanceFields(param1:Class) : Array
      {
         return Type.describe(param1,true);
      }
      
      public static function getEnumConstructs(param1:Class) : Array
      {
         var _loc2_:Array = param1.__constructs__;
         return _loc2_.copy();
      }
      
      public static function §typeof§(param1:*) : ValueType
      {
         var _loc5_:* = null;
         var _loc6_:* = null;
         var _loc3_:String = getQualifiedClassName(param1);
         var _loc4_:String = _loc3_;
         if(_loc4_ == "Boolean")
         {
            return ValueType.TBool;
         }
         if(_loc4_ == "Function")
         {
            return ValueType.TFunction;
         }
         if(_loc4_ == "Number")
         {
            if((param1 < -268435456 || param1 >= 268435456) && int(Number(param1)) == param1)
            {
               return ValueType.TInt;
            }
            return ValueType.TFloat;
         }
         if(_loc4_ == "Object")
         {
            return ValueType.TObject;
         }
         if(_loc4_ == "int")
         {
            return ValueType.TInt;
         }
         if(_loc4_ == "null")
         {
            return ValueType.TNull;
         }
         if(_loc4_ == "void")
         {
            return ValueType.TNull;
         }
         _loc5_ = null;
         try
         {
            _loc5_ = getDefinitionByName(_loc3_);
            if(param1.hasOwnProperty("prototype"))
            {
               return ValueType.TObject;
            }
            if(_loc5_.__isenum)
            {
               return ValueType.TEnum(_loc5_);
            }
            return ValueType.TClass(_loc5_);
         }
         catch(_loc_e_:*)
         {
            if(§§pop())
            {
               return ValueType.TFunction;
            }
            if(_loc5_ == null)
            {
               return ValueType.TFunction;
            }
            return ValueType.TClass(_loc5_);
         }
      }
      
      public static function enumParameters(param1:Object) : Array
      {
         if(param1.params == null)
         {
            return [];
         }
         return param1.params;
      }
   }
}

