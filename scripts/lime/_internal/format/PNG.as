package lime._internal.format
{
   import format.png.Chunk;
   import format.png.Color;
   import format.png.Writer;
   import haxe.ds.List;
   import haxe.io.Bytes;
   import haxe.io.BytesOutput;
   import lime.graphics.Image;
   
   public class PNG
   {
      
      public function PNG()
      {
      }
      
      public static function decodeBytes(param1:Bytes, param2:Boolean = true) : Image
      {
         return null;
      }
      
      public static function decodeFile(param1:String, param2:Boolean = true) : Image
      {
         return null;
      }
      
      public static function encode(param1:Image) : Bytes
      {
         var _loc3_:* = null as Bytes;
         var _loc4_:* = null as Bytes;
         var _loc5_:int = 0;
         var _loc6_:int = 0;
         var _loc7_:int = 0;
         var _loc8_:int = 0;
         var _loc9_:int = 0;
         var _loc10_:* = null as List;
         var _loc11_:* = null as BytesOutput;
         var _loc12_:* = null as Writer;
         var _loc13_:* = null;
         if(param1.get_premultiplied() || param1.get_format() != 0)
         {
            param1 = param1.clone();
            param1.set_premultiplied(false);
            param1.set_format(0);
         }
         try
         {
            _loc3_ = Bytes.alloc(param1.width * param1.height * 4 + param1.height);
            _loc4_ = param1.buffer.data.buffer;
            _loc7_ = 0;
            _loc8_ = param1.height;
            while(_loc7_ < _loc8_)
            {
               _loc9_ = _loc7_++;
               _loc5_ = _loc9_ * param1.width * 4;
               _loc6_ = _loc9_ * param1.width * 4 + _loc9_;
               _loc3_.b[_loc6_] = 0;
               _loc3_.blit(_loc6_ + 1,_loc4_,_loc5_,param1.width * 4);
            }
            _loc10_ = new List();
            _loc10_.add(Chunk.CHeader({
               "width":param1.width,
               "height":param1.height,
               "colbits":8,
               "color":Color.ColTrue(true),
               "interlaced":false
            }));
            _loc10_.add(Chunk.CData(Zlib.compress(_loc3_)));
            _loc10_.add(Chunk.CEnd);
            _loc11_ = new BytesOutput();
            _loc12_ = new Writer(_loc11_);
            _loc12_.write(_loc10_);
            return _loc11_.getBytes();
         }
         catch(_loc_e_:*)
         {
         }
      }
   }
}

