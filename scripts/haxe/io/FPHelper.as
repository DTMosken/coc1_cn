package haxe.io
{
   import flash.utils.ByteArray;
   
   public class FPHelper
   {
      
      public static var init__:Boolean;
      
      public static var helper:ByteArray;
      
      public function FPHelper()
      {
      }
      
      public static function i64ToDouble(param1:int, param2:int) : Number
      {
         var _loc3_:ByteArray = FPHelper.helper;
         _loc3_.position = 0;
         _loc3_.writeUnsignedInt(param1);
         _loc3_.writeUnsignedInt(param2);
         _loc3_.position = 0;
         return _loc3_.readDouble();
      }
   }
}

