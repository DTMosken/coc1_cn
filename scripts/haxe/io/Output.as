package haxe.io
{
   import flash.utils.ByteArray;
   import haxe.Exception;
   import haxe.exceptions.NotImplementedException;
   
   public class Output
   {
      
      public var bigEndian:Boolean;
      
      public function Output()
      {
      }
      
      public function writeString(param1:String, param2:Encoding = undefined) : void
      {
         var _loc3_:Bytes = Bytes.ofString(param1,param2);
         writeFullBytes(_loc3_,0,_loc3_.length);
      }
      
      public function writeInt32(param1:int) : void
      {
         if(bigEndian)
         {
            writeByte(param1 >>> 24);
            writeByte(param1 >> 16 & 0xFF);
            writeByte(param1 >> 8 & 0xFF);
            writeByte(param1 & 0xFF);
         }
         else
         {
            writeByte(param1 & 0xFF);
            writeByte(param1 >> 8 & 0xFF);
            writeByte(param1 >> 16 & 0xFF);
            writeByte(param1 >>> 24);
         }
      }
      
      public function writeFullBytes(param1:Bytes, param2:int, param3:int) : void
      {
         var _loc4_:int = 0;
         while(param3 > 0)
         {
            _loc4_ = writeBytes(param1,param2,param3);
            param2 += _loc4_;
            param3 -= _loc4_;
         }
      }
      
      public function writeBytes(param1:Bytes, param2:int, param3:int) : int
      {
         if(param2 < 0 || param3 < 0 || param2 + param3 > param1.length)
         {
            throw Exception.thrown(haxe.io.Error.OutsideBounds);
         }
         var _loc4_:ByteArray = param1.b;
         var _loc5_:int = param3;
         while(_loc5_ > 0)
         {
            writeByte(int(_loc4_[param2]));
            param2++;
            _loc5_--;
         }
         return param3;
      }
      
      public function writeByte(param1:int) : void
      {
         throw new NotImplementedException(null,null,{
            "fileName":"haxe/io/Output.hx",
            "lineNumber":47,
            "className":"haxe.io.Output",
            "methodName":"writeByte"
         });
      }
      
      public function write(param1:Bytes) : void
      {
         var _loc4_:int = 0;
         var _loc2_:int = param1.length;
         var _loc3_:int = 0;
         while(_loc2_ > 0)
         {
            _loc4_ = writeBytes(param1,_loc3_,_loc2_);
            if(_loc4_ == 0)
            {
               throw Exception.thrown(haxe.io.Error.Blocked);
            }
            _loc3_ += _loc4_;
            _loc2_ -= _loc4_;
         }
      }
      
      public function set_bigEndian(param1:Boolean) : Boolean
      {
         bigEndian = param1;
         return param1;
      }
   }
}

