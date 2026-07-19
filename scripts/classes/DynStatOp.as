package classes
{
   import flash.Boot;
   
   public final class DynStatOp
   {
      
      public static const __isenum:Boolean = true;
      
      public static var Add:DynStatOp = new DynStatOp("Add",0,null);
      
      public static var Div:DynStatOp = new DynStatOp("Div",3,null);
      
      public static var Eq:DynStatOp = new DynStatOp("Eq",4,null);
      
      public static var Mul:DynStatOp = new DynStatOp("Mul",2,null);
      
      public static var Sub:DynStatOp = new DynStatOp("Sub",1,null);
      
      public static var __constructs__:Array = ["Add","Sub","Mul","Div","Eq"];
      
      public var tag:String;
      
      public var index:int;
      
      public var params:Array;
      
      public const __enum__:Boolean = true;
      
      public function DynStatOp(param1:String, param2:int, param3:Array)
      {
         tag = param1;
         index = param2;
         params = param3;
      }
      
      final public function toString() : String
      {
         return Boot.enum_to_string(this);
      }
   }
}

