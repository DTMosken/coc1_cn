package haxe.macro
{
   import flash.Boot;
   
   public final class ExprDef
   {
      
      public static const __isenum:Boolean = true;
      
      public static var EBreak:ExprDef = new ExprDef("EBreak",19,null);
      
      public static var EContinue:ExprDef = new ExprDef("EContinue",20,null);
      
      public static var __constructs__:Array = ["EConst","EArray","EBinop","EField","EParenthesis","EObjectDecl","EArrayDecl","ECall","ENew","EUnop","EVars","EFunction","EBlock","EFor","EIf","EWhile","ESwitch","ETry","EReturn","EBreak","EContinue","EUntyped","EThrow","ECast","EDisplay","ETernary","ECheckType","EMeta","EIs"];
      
      public var tag:String;
      
      public var index:int;
      
      public var params:Array;
      
      public const __enum__:Boolean = true;
      
      public function ExprDef(param1:String, param2:int, param3:Array)
      {
         tag = param1;
         index = param2;
         params = param3;
      }
      
      public static function EArray(param1:Object, param2:Object) : ExprDef
      {
         return new ExprDef("EArray",1,[param1,param2]);
      }
      
      public static function EArrayDecl(param1:Array) : ExprDef
      {
         return new ExprDef("EArrayDecl",6,[param1]);
      }
      
      public static function EBinop(param1:Binop, param2:Object, param3:Object) : ExprDef
      {
         return new ExprDef("EBinop",2,[param1,param2,param3]);
      }
      
      public static function EBlock(param1:Array) : ExprDef
      {
         return new ExprDef("EBlock",12,[param1]);
      }
      
      public static function ECall(param1:Object, param2:Array) : ExprDef
      {
         return new ExprDef("ECall",7,[param1,param2]);
      }
      
      public static function ECast(param1:Object, param2:ComplexType) : ExprDef
      {
         return new ExprDef("ECast",23,[param1,param2]);
      }
      
      public static function ECheckType(param1:Object, param2:ComplexType) : ExprDef
      {
         return new ExprDef("ECheckType",26,[param1,param2]);
      }
      
      public static function EConst(param1:Constant) : ExprDef
      {
         return new ExprDef("EConst",0,[param1]);
      }
      
      public static function EDisplay(param1:Object, param2:DisplayKind) : ExprDef
      {
         return new ExprDef("EDisplay",24,[param1,param2]);
      }
      
      public static function EField(param1:Object, param2:String, param3:EFieldKind = undefined) : ExprDef
      {
         return new ExprDef("EField",3,[param1,param2,param3]);
      }
      
      public static function EFor(param1:Object, param2:Object) : ExprDef
      {
         return new ExprDef("EFor",13,[param1,param2]);
      }
      
      public static function EFunction(param1:FunctionKind, param2:Object) : ExprDef
      {
         return new ExprDef("EFunction",11,[param1,param2]);
      }
      
      public static function EIf(param1:Object, param2:Object, param3:Object) : ExprDef
      {
         return new ExprDef("EIf",14,[param1,param2,param3]);
      }
      
      public static function EIs(param1:Object, param2:ComplexType) : ExprDef
      {
         return new ExprDef("EIs",28,[param1,param2]);
      }
      
      public static function EMeta(param1:Object, param2:Object) : ExprDef
      {
         return new ExprDef("EMeta",27,[param1,param2]);
      }
      
      public static function ENew(param1:Object, param2:Array) : ExprDef
      {
         return new ExprDef("ENew",8,[param1,param2]);
      }
      
      public static function EObjectDecl(param1:Array) : ExprDef
      {
         return new ExprDef("EObjectDecl",5,[param1]);
      }
      
      public static function EParenthesis(param1:Object) : ExprDef
      {
         return new ExprDef("EParenthesis",4,[param1]);
      }
      
      public static function EReturn(param1:Object = undefined) : ExprDef
      {
         return new ExprDef("EReturn",18,[param1]);
      }
      
      public static function ESwitch(param1:Object, param2:Array, param3:Object) : ExprDef
      {
         return new ExprDef("ESwitch",16,[param1,param2,param3]);
      }
      
      public static function ETernary(param1:Object, param2:Object, param3:Object) : ExprDef
      {
         return new ExprDef("ETernary",25,[param1,param2,param3]);
      }
      
      public static function EThrow(param1:Object) : ExprDef
      {
         return new ExprDef("EThrow",22,[param1]);
      }
      
      public static function ETry(param1:Object, param2:Array) : ExprDef
      {
         return new ExprDef("ETry",17,[param1,param2]);
      }
      
      public static function EUnop(param1:Unop, param2:Boolean, param3:Object) : ExprDef
      {
         return new ExprDef("EUnop",9,[param1,param2,param3]);
      }
      
      public static function EUntyped(param1:Object) : ExprDef
      {
         return new ExprDef("EUntyped",21,[param1]);
      }
      
      public static function EVars(param1:Array) : ExprDef
      {
         return new ExprDef("EVars",10,[param1]);
      }
      
      public static function EWhile(param1:Object, param2:Object, param3:Boolean) : ExprDef
      {
         return new ExprDef("EWhile",15,[param1,param2,param3]);
      }
      
      final public function toString() : String
      {
         return Boot.enum_to_string(this);
      }
   }
}

