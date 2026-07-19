package haxe.io
{
   import flash.utils.ByteArray;
   import haxe.Exception;
   import haxe.exceptions.NotImplementedException;
   
   public class Input
   {
      
      public var bigEndian:Boolean;
      
      public function Input()
      {
      }
      
      public function set_bigEndian(param1:Boolean) : Boolean
      {
         bigEndian = param1;
         return param1;
      }
      
      public function readUInt16() : int
      {
         var _loc1_:int = readByte();
         var _loc2_:int = readByte();
         if(bigEndian)
         {
            return _loc2_ | _loc1_ << 8;
         }
         return _loc1_ | _loc2_ << 8;
      }
      
      public function readString(param1:int, param2:Encoding = undefined) : String
      {
         var _loc3_:Bytes = Bytes.alloc(param1);
         readFullBytes(_loc3_,0,param1);
         return _loc3_.getString(0,param1,param2);
      }
      
      public function readInt32() : int
      {
         var _loc1_:int = readByte();
         var _loc2_:int = readByte();
         var _loc3_:int = readByte();
         var _loc4_:int = readByte();
         if(bigEndian)
         {
            return _loc4_ | _loc3_ << 8 | _loc2_ << 16 | _loc1_ << 24;
         }
         return _loc1_ | _loc2_ << 8 | _loc3_ << 16 | _loc4_ << 24;
      }
      
      public function readInt16() : int
      {
         var _loc1_:int = readByte();
         var _loc2_:int = readByte();
         var _loc3_:int = bigEndian ? _loc2_ | _loc1_ << 8 : _loc1_ | _loc2_ << 8;
         if((_loc3_ & 0x8000) != 0)
         {
            return _loc3_ - 65536;
         }
         return _loc3_;
      }
      
      public function readFullBytes(param1:Bytes, param2:int, param3:int) : void
      {
         var _loc4_:int = 0;
         while(param3 > 0)
         {
            _loc4_ = readBytes(param1,param2,param3);
            if(_loc4_ == 0)
            {
               throw Exception.thrown(haxe.io.Error.Blocked);
            }
            param2 += _loc4_;
            param3 -= _loc4_;
         }
      }
      
      public function readDouble() : Number
      {
         var _loc1_:int = readInt32();
         var _loc2_:int = readInt32();
         if(bigEndian)
         {
            return FPHelper.i64ToDouble(_loc2_,_loc1_);
         }
         return FPHelper.i64ToDouble(_loc1_,_loc2_);
      }
      
      public function readBytes(param1:Bytes, param2:int, param3:int) : int
      {
         var _loc7_:* = null;
         var _loc5_:int = param3;
         var _loc6_:ByteArray = param1.b;
         if(param2 < 0 || param3 < 0 || param2 + param3 > param1.length)
         {
            throw Exception.thrown(haxe.io.Error.OutsideBounds);
         }
         try
         {
            while(_loc5_ > 0)
            {
               _loc6_[param2] = readByte();
               param2++;
               _loc5_--;
            }
         }
         catch(_loc_e_:*)
         {
            return param3 - _loc5_;
         }
      }
      
      public function readByte() : int
      {
         throw new NotImplementedException(null,null,{
            "fileName":"haxe/io/Input.hx",
            "lineNumber":53,
            "className":"haxe.io.Input",
            "methodName":"readByte"
         });
      }
      
      public function read(param1:int) : Bytes
      {
         var _loc4_:int = 0;
         var _loc2_:Bytes = Bytes.alloc(param1);
         var _loc3_:int = 0;
         while(param1 > 0)
         {
            _loc4_ = readBytes(_loc2_,_loc3_,param1);
            if(_loc4_ == 0)
            {
               throw Exception.thrown(haxe.io.Error.Blocked);
            }
            _loc3_ += _loc4_;
            param1 -= _loc4_;
         }
         return _loc2_;
      }
   }
}

