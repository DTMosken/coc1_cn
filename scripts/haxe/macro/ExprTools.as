package haxe.macro
{
   public class ExprTools
   {
      
      public function ExprTools()
      {
      }
      
      public static function toString(param1:Object) : String
      {
         return new Printer().printExpr(param1);
      }
   }
}

