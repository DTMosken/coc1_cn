package haxe.crypto
{
   import flash.Boot;
   import haxe.io.Bytes;
   import haxe.io.Input;
   
   public class Adler32
   {
      
      public var a2:int;
      
      public var a1:int;
      
      public function Adler32()
      {
         if(Boot.skip_constructor)
         {
            return;
         }
         a1 = 1;
         a2 = 0;
      }
      
      public static function read(param1:Input) : Adler32
      {
         var _loc2_:Adler32 = new Adler32();
         var _loc3_:int = param1.readByte();
         var _loc4_:int = param1.readByte();
         var _loc5_:int = param1.readByte();
         var _loc6_:int = param1.readByte();
         _loc2_.a1 = _loc5_ << 8 | _loc6_;
         _loc2_.a2 = _loc3_ << 8 | _loc4_;
         return _loc2_;
      }
      
      public function update(param1:Bytes, param2:int, param3:int) : void
      {
         var _loc8_:int = 0;
         var _loc9_:int = 0;
         var _loc4_:int = a1;
         var _loc5_:int = a2;
         var _loc6_:int = param2;
         var _loc7_:int = param2 + param3;
         while(_loc6_ < _loc7_)
         {
            _loc8_ = _loc6_++;
            _loc9_ = int(param1.b[_loc8_]);
            _loc4_ = int((_loc4_ + _loc9_) % 65521);
            _loc5_ = int((_loc5_ + _loc4_) % 65521);
         }
         a1 = _loc4_;
         a2 = _loc5_;
      }
      
      public function equals(param1:Adler32) : Boolean
      {
         if(param1.a1 == a1)
         {
            return param1.a2 == a2;
         }
         return false;
      }
   }
}

