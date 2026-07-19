package format.png
{
   import flash.Boot;
   import flash.utils.ByteArray;
   import haxe.ds.List;
   import haxe.ds._List.ListNode;
   import haxe.io.Bytes;
   import haxe.io.BytesOutput;
   import haxe.io.Output;
   
   public class Writer
   {
      
      public var o:Output;
      
      public function Writer(param1:Output = undefined)
      {
         if(Boot.skip_constructor)
         {
            return;
         }
         o = param1;
         param1.set_bigEndian(true);
      }
      
      public function writeChunk(param1:String, param2:Bytes) : void
      {
         var _loc7_:int = 0;
         var _loc8_:int = 0;
         o.writeInt32(param2.length);
         o.writeString(param1);
         o.write(param2);
         var _loc3_:int = -1;
         var _loc4_:int = (_loc3_ ^ int(param1.charCodeAt(0))) & 0xFF;
         _loc4_ = _loc4_ >>> 1 ^ -(_loc4_ & 1) & -306674912;
         _loc4_ = _loc4_ >>> 1 ^ -(_loc4_ & 1) & -306674912;
         _loc4_ = _loc4_ >>> 1 ^ -(_loc4_ & 1) & -306674912;
         _loc4_ = _loc4_ >>> 1 ^ -(_loc4_ & 1) & -306674912;
         _loc4_ = _loc4_ >>> 1 ^ -(_loc4_ & 1) & -306674912;
         _loc4_ = _loc4_ >>> 1 ^ -(_loc4_ & 1) & -306674912;
         _loc4_ = _loc4_ >>> 1 ^ -(_loc4_ & 1) & -306674912;
         _loc4_ = _loc4_ >>> 1 ^ -(_loc4_ & 1) & -306674912;
         _loc3_ = _loc3_ >>> 8 ^ _loc4_;
         _loc4_ = (_loc3_ ^ int(param1.charCodeAt(1))) & 0xFF;
         _loc4_ = _loc4_ >>> 1 ^ -(_loc4_ & 1) & -306674912;
         _loc4_ = _loc4_ >>> 1 ^ -(_loc4_ & 1) & -306674912;
         _loc4_ = _loc4_ >>> 1 ^ -(_loc4_ & 1) & -306674912;
         _loc4_ = _loc4_ >>> 1 ^ -(_loc4_ & 1) & -306674912;
         _loc4_ = _loc4_ >>> 1 ^ -(_loc4_ & 1) & -306674912;
         _loc4_ = _loc4_ >>> 1 ^ -(_loc4_ & 1) & -306674912;
         _loc4_ = _loc4_ >>> 1 ^ -(_loc4_ & 1) & -306674912;
         _loc4_ = _loc4_ >>> 1 ^ -(_loc4_ & 1) & -306674912;
         _loc3_ = _loc3_ >>> 8 ^ _loc4_;
         _loc4_ = (_loc3_ ^ int(param1.charCodeAt(2))) & 0xFF;
         _loc4_ = _loc4_ >>> 1 ^ -(_loc4_ & 1) & -306674912;
         _loc4_ = _loc4_ >>> 1 ^ -(_loc4_ & 1) & -306674912;
         _loc4_ = _loc4_ >>> 1 ^ -(_loc4_ & 1) & -306674912;
         _loc4_ = _loc4_ >>> 1 ^ -(_loc4_ & 1) & -306674912;
         _loc4_ = _loc4_ >>> 1 ^ -(_loc4_ & 1) & -306674912;
         _loc4_ = _loc4_ >>> 1 ^ -(_loc4_ & 1) & -306674912;
         _loc4_ = _loc4_ >>> 1 ^ -(_loc4_ & 1) & -306674912;
         _loc4_ = _loc4_ >>> 1 ^ -(_loc4_ & 1) & -306674912;
         _loc3_ = _loc3_ >>> 8 ^ _loc4_;
         _loc4_ = (_loc3_ ^ int(param1.charCodeAt(3))) & 0xFF;
         _loc4_ = _loc4_ >>> 1 ^ -(_loc4_ & 1) & -306674912;
         _loc4_ = _loc4_ >>> 1 ^ -(_loc4_ & 1) & -306674912;
         _loc4_ = _loc4_ >>> 1 ^ -(_loc4_ & 1) & -306674912;
         _loc4_ = _loc4_ >>> 1 ^ -(_loc4_ & 1) & -306674912;
         _loc4_ = _loc4_ >>> 1 ^ -(_loc4_ & 1) & -306674912;
         _loc4_ = _loc4_ >>> 1 ^ -(_loc4_ & 1) & -306674912;
         _loc4_ = _loc4_ >>> 1 ^ -(_loc4_ & 1) & -306674912;
         _loc4_ = _loc4_ >>> 1 ^ -(_loc4_ & 1) & -306674912;
         _loc3_ = _loc3_ >>> 8 ^ _loc4_;
         var _loc5_:ByteArray = param2.b;
         _loc4_ = 0;
         var _loc6_:int = param2.length;
         while(_loc4_ < _loc6_)
         {
            _loc7_ = _loc4_++;
            _loc8_ = (_loc3_ ^ int(_loc5_[_loc7_])) & 0xFF;
            _loc8_ = _loc8_ >>> 1 ^ -(_loc8_ & 1) & -306674912;
            _loc8_ = _loc8_ >>> 1 ^ -(_loc8_ & 1) & -306674912;
            _loc8_ = _loc8_ >>> 1 ^ -(_loc8_ & 1) & -306674912;
            _loc8_ = _loc8_ >>> 1 ^ -(_loc8_ & 1) & -306674912;
            _loc8_ = _loc8_ >>> 1 ^ -(_loc8_ & 1) & -306674912;
            _loc8_ = _loc8_ >>> 1 ^ -(_loc8_ & 1) & -306674912;
            _loc8_ = _loc8_ >>> 1 ^ -(_loc8_ & 1) & -306674912;
            _loc8_ = _loc8_ >>> 1 ^ -(_loc8_ & 1) & -306674912;
            _loc3_ = _loc3_ >>> 8 ^ _loc8_;
         }
         o.writeInt32(_loc3_ ^ -1);
      }
      
      public function write(param1:List) : void
      {
         var _loc2_:int = 0;
         var _loc4_:* = null as Chunk;
         var _loc5_:* = null as Chunk;
         var _loc6_:* = null;
         var _loc7_:* = null as BytesOutput;
         var _loc8_:* = null as Color;
         var _loc9_:Boolean = false;
         var _loc10_:* = null as Bytes;
         var _loc11_:* = null as String;
         _loc2_ = 137;
         o.writeByte(_loc2_);
         _loc2_ = 80;
         o.writeByte(_loc2_);
         _loc2_ = 78;
         o.writeByte(_loc2_);
         _loc2_ = 71;
         o.writeByte(_loc2_);
         _loc2_ = 13;
         o.writeByte(_loc2_);
         _loc2_ = 10;
         o.writeByte(_loc2_);
         _loc2_ = 26;
         o.writeByte(_loc2_);
         _loc2_ = 10;
         o.writeByte(_loc2_);
         var _loc3_:ListNode = param1.h;
         while(_loc3_ != null)
         {
            _loc4_ = _loc3_.item;
            _loc3_ = _loc3_.next;
            _loc5_ = _loc4_;
            switch(_loc5_.index)
            {
               case 0:
                  writeChunk("IEND",Bytes.alloc(0));
                  break;
               case 1:
                  _loc6_ = _loc5_.params[0];
                  _loc7_ = new BytesOutput();
                  _loc7_.set_bigEndian(true);
                  _loc7_.writeInt32(int(_loc6_.width));
                  _loc7_.writeInt32(int(_loc6_.height));
                  _loc7_.writeByte(int(_loc6_.colbits));
                  _loc8_ = _loc6_.color;
                  switch(_loc8_.index)
                  {
                     case 0:
                        _loc9_ = Boolean(_loc8_.params[0]);
                        _loc2_ = _loc9_ ? 4 : 0;
                        break;
                     case 1:
                        _loc9_ = Boolean(_loc8_.params[0]);
                        _loc2_ = _loc9_ ? 6 : 2;
                        break;
                     case 2:
                        _loc2_ = 3;
                  }
                  _loc7_.writeByte(_loc2_);
                  _loc7_.writeByte(0);
                  _loc7_.writeByte(0);
                  _loc7_.writeByte(Boolean(_loc6_.interlaced) ? 1 : 0);
                  writeChunk("IHDR",_loc7_.getBytes());
                  break;
               case 2:
                  _loc10_ = _loc5_.params[0];
                  writeChunk("IDAT",_loc10_);
                  break;
               case 3:
                  _loc10_ = _loc5_.params[0];
                  writeChunk("PLTE",_loc10_);
                  break;
               case 4:
                  _loc11_ = _loc5_.params[0];
                  _loc10_ = _loc5_.params[1];
                  writeChunk(_loc11_,_loc10_);
            }
         }
      }
   }
}

