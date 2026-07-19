package haxe.macro
{
   import flash.Boot;
   
   public final class ComplexType
   {
      
      public static const __isenum:Boolean = true;
      
      public static var __constructs__:Array = ["TPath","TFunction","TAnonymous","TParent","TExtend","TOptional","TNamed","TIntersection"];
      
      public var tag:String;
      
      public var index:int;
      
      public var params:Array;
      
      public const __enum__:Boolean = true;
      
      public function ComplexType(param1:String, param2:int, param3:Array)
      {
         tag = param1;
         index = param2;
         params = param3;
      }
      
      public static function TAnonymous(param1:Array) : ComplexType
      {
         return new ComplexType("TAnonymous",2,[param1]);
      }
      
      public static function TExtend(param1:Array, param2:Array) : ComplexType
      {
         return new ComplexType("TExtend",4,[param1,param2]);
      }
      
      public static function TFunction(param1:Array, param2:ComplexType) : ComplexType
      {
         return new ComplexType("TFunction",1,[param1,param2]);
      }
      
      public static function TIntersection(param1:Array) : ComplexType
      {
         return new ComplexType("TIntersection",7,[param1]);
      }
      
      public static function TNamed(param1:String, param2:ComplexType) : ComplexType
      {
         return new ComplexType("TNamed",6,[param1,param2]);
      }
      
      public static function TOptional(param1:ComplexType) : ComplexType
      {
         return new ComplexType("TOptional",5,[param1]);
      }
      
      public static function TParent(param1:ComplexType) : ComplexType
      {
         return new ComplexType("TParent",3,[param1]);
      }
      
      public static function TPath(param1:Object) : ComplexType
      {
         return new ComplexType("TPath",0,[param1]);
      }
      
      final public function toString() : String
      {
         return Boot.enum_to_string(this);
      }
   }
}

