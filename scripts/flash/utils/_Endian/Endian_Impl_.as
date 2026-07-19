package flash.utils._Endian
{
   import lime.system.Endian;
   
   public final class Endian_Impl_
   {
      
      public static var init__:Boolean;
      
      public static var BIG_ENDIAN:String;
      
      public static var LITTLE_ENDIAN:String;
      
      public function Endian_Impl_()
      {
      }
      
      public static function fromLimeEndian(param1:Endian) : String
      {
         switch(param1.index)
         {
            case 0:
               return "littleEndian";
            case 1:
               return "bigEndian";
            default:
               return;
         }
      }
      
      public static function toLimeEndian(param1:String) : Endian
      {
         var _loc2_:String = param1;
         if(_loc2_ == "bigEndian")
         {
            return Endian.BIG_ENDIAN;
         }
         if(_loc2_ == "littleEndian")
         {
            return Endian.LITTLE_ENDIAN;
         }
         return null;
      }
   }
}

