package
{
   import flash.Boot;
   
   public final class ValueType
   {
      
      public static const __isenum:Boolean = true;
      
      public static var TBool:ValueType = new ValueType("TBool",3,null);
      
      public static var TFloat:ValueType = new ValueType("TFloat",2,null);
      
      public static var TFunction:ValueType = new ValueType("TFunction",5,null);
      
      public static var TInt:ValueType = new ValueType("TInt",1,null);
      
      public static var TNull:ValueType = new ValueType("TNull",0,null);
      
      public static var TObject:ValueType = new ValueType("TObject",4,null);
      
      public static var TUnknown:ValueType = new ValueType("TUnknown",8,null);
      
      public static var __constructs__:Array = ["TNull","TInt","TFloat","TBool","TObject","TFunction","TClass","TEnum","TUnknown"];
      
      public var tag:String;
      
      public var index:int;
      
      public var params:Array;
      
      public const __enum__:Boolean = true;
      
      public function ValueType(param1:String, param2:int, param3:Array)
      {
         tag = param1;
         index = param2;
         params = param3;
      }
      
      public static function TClass(param1:Class) : ValueType
      {
         return new ValueType("TClass",6,[param1]);
      }
      
      public static function TEnum(param1:Class) : ValueType
      {
         return new ValueType("TEnum",7,[param1]);
      }
      
      final public function toString() : String
      {
         return Boot.enum_to_string(this);
      }
   }
}

