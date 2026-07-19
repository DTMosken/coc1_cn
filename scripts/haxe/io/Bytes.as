package haxe.io
{
   import flash.Boot;
   import flash.utils.ByteArray;
   import haxe.Exception;
   
   public class Bytes
   {
      
      public var length:int;
      
      public var b:ByteArray;
      
      public function Bytes(param1:int = 0, param2:ByteArray = undefined)
      {
         if(Boot.skip_constructor)
         {
            return;
         }
         length = param1;
         b = param2;
         param2.endian = "littleEndian";
      }
      
      public static function alloc(param1:int) : Bytes
      {
         var _loc2_:ByteArray = new ByteArray();
         _loc2_.length = param1;
         return new Bytes(param1,_loc2_);
      }
      
      public static function ofString(param1:String, param2:Encoding = undefined) : Bytes
      {
         var _loc3_:ByteArray = new ByteArray();
         if(param2 == Encoding.RawNative)
         {
            _loc3_.writeMultiByte(param1,"unicode");
         }
         else
         {
            _loc3_.writeUTFBytes(param1);
         }
         return new Bytes(_loc3_.length,_loc3_);
      }
      
      public static function ofData(param1:ByteArray) : Bytes
      {
         return new Bytes(param1.length,param1);
      }
      
      public function toString() : String
      {
         b.position = 0;
         return b.toString();
      }
      
      public function getString(param1:int, param2:int, param3:Encoding = undefined) : String
      {
         var _loc4_:Boolean = param3 == null;
         if(param1 < 0 || param2 < 0 || param1 + param2 > length)
         {
            throw Exception.thrown(haxe.io.Error.OutsideBounds);
         }
         b.position = param1;
         if(param3 == Encoding.RawNative)
         {
            return b.readMultiByte(param2,"unicode");
         }
         return b.readUTFBytes(param2);
      }
      
      public function fill(param1:int, param2:int, param3:int) : void
      {
         var _loc7_:int = 0;
         var _loc4_:int = param3 & 0xFF;
         _loc4_ |= _loc4_ << 8;
         _loc4_ |= _loc4_ << 16;
         b.position = param1;
         var _loc5_:int = 0;
         var _loc6_:int = param2 >> 2;
         while(_loc5_ < _loc6_)
         {
            _loc7_ = _loc5_++;
            b.writeUnsignedInt(_loc4_);
         }
         param1 += param2 & -4;
         _loc5_ = 0;
         _loc6_ = param2 & 3;
         while(_loc5_ < _loc6_)
         {
            _loc7_ = _loc5_++;
            b[param1++] = param3;
         }
      }
      
      public function blit(param1:int, param2:Bytes, param3:int, param4:int) : void
      {
         if(param1 < 0 || param3 < 0 || param4 < 0 || param1 + param4 > length || param3 + param4 > param2.length)
         {
            throw Exception.thrown(haxe.io.Error.OutsideBounds);
         }
         b.position = param1;
         if(param4 > 0)
         {
            b.writeBytes(param2.b,param3,param4);
         }
      }
   }
}

