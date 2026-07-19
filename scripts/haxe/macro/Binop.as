package haxe.macro
{
   import flash.Boot;
   
   public final class Binop
   {
      
      public static const __isenum:Boolean = true;
      
      public static var OpAdd:Binop = new Binop("OpAdd",0,null);
      
      public static var OpAnd:Binop = new Binop("OpAnd",11,null);
      
      public static var OpArrow:Binop = new Binop("OpArrow",22,null);
      
      public static var OpAssign:Binop = new Binop("OpAssign",4,null);
      
      public static var OpBoolAnd:Binop = new Binop("OpBoolAnd",14,null);
      
      public static var OpBoolOr:Binop = new Binop("OpBoolOr",15,null);
      
      public static var OpDiv:Binop = new Binop("OpDiv",2,null);
      
      public static var OpEq:Binop = new Binop("OpEq",5,null);
      
      public static var OpGt:Binop = new Binop("OpGt",7,null);
      
      public static var OpGte:Binop = new Binop("OpGte",8,null);
      
      public static var OpIn:Binop = new Binop("OpIn",23,null);
      
      public static var OpInterval:Binop = new Binop("OpInterval",21,null);
      
      public static var OpLt:Binop = new Binop("OpLt",9,null);
      
      public static var OpLte:Binop = new Binop("OpLte",10,null);
      
      public static var OpMod:Binop = new Binop("OpMod",19,null);
      
      public static var OpMult:Binop = new Binop("OpMult",1,null);
      
      public static var OpNotEq:Binop = new Binop("OpNotEq",6,null);
      
      public static var OpNullCoal:Binop = new Binop("OpNullCoal",24,null);
      
      public static var OpOr:Binop = new Binop("OpOr",12,null);
      
      public static var OpShl:Binop = new Binop("OpShl",16,null);
      
      public static var OpShr:Binop = new Binop("OpShr",17,null);
      
      public static var OpSub:Binop = new Binop("OpSub",3,null);
      
      public static var OpUShr:Binop = new Binop("OpUShr",18,null);
      
      public static var OpXor:Binop = new Binop("OpXor",13,null);
      
      public static var __constructs__:Array = ["OpAdd","OpMult","OpDiv","OpSub","OpAssign","OpEq","OpNotEq","OpGt","OpGte","OpLt","OpLte","OpAnd","OpOr","OpXor","OpBoolAnd","OpBoolOr","OpShl","OpShr","OpUShr","OpMod","OpAssignOp","OpInterval","OpArrow","OpIn","OpNullCoal"];
      
      public var tag:String;
      
      public var index:int;
      
      public var params:Array;
      
      public const __enum__:Boolean = true;
      
      public function Binop(param1:String, param2:int, param3:Array)
      {
         tag = param1;
         index = param2;
         params = param3;
      }
      
      public static function OpAssignOp(param1:Binop) : Binop
      {
         return new Binop("OpAssignOp",20,[param1]);
      }
      
      final public function toString() : String
      {
         return Boot.enum_to_string(this);
      }
   }
}

