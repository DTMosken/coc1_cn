package _String
{
   import flash.Boot;
   
   public class String_Impl_
   {
      
      public function String_Impl_()
      {
      }
      
      public static function fromCharCode(param1:int) : String
      {
         if(param1 < 65536)
         {
            return String["fromCharCode"](param1);
         }
         return Boot.fromCodePoint(param1);
      }
   }
}

