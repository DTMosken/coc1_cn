package lime._internal.format
{
   import format.jpg.Writer;
   import haxe.io.Bytes;
   import haxe.io.BytesOutput;
   import lime.graphics.Image;
   
   public class JPEG
   {
      
      public function JPEG()
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
      
      public static function encode(param1:Image, param2:int) : Bytes
      {
         var _loc4_:* = null as Bytes;
         var _loc5_:* = null;
         var _loc6_:* = null as BytesOutput;
         var _loc7_:* = null as Writer;
         if(param1.get_premultiplied() || param1.get_format() != 0)
         {
            param1 = param1.clone();
            param1.set_premultiplied(false);
            param1.set_format(0);
         }
         try
         {
            _loc4_ = param1.buffer.data.buffer;
            _loc5_ = {
               "width":param1.width,
               "height":param1.height,
               "quality":param2,
               "pixels":_loc4_
            };
            _loc6_ = new BytesOutput();
            _loc7_ = new Writer(_loc6_);
            _loc7_.write(_loc5_);
            return _loc6_.getBytes();
         }
         catch(_loc_e_:*)
         {
         }
      }
   }
}

