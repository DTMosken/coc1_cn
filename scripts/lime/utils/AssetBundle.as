package lime.utils
{
   import flash.Boot;
   import haxe.IMap;
   import haxe.ds.List;
   import haxe.ds.StringMap;
   import haxe.ds._List.ListNode;
   import haxe.io.Bytes;
   import haxe.io.BytesInput;
   import haxe.io.Input;
   import haxe.zip.Reader;
   import lime.app.Future;
   import lime.utils._Bytes.Bytes_Impl_;
   
   public class AssetBundle
   {
      
      public var paths:Array;
      
      public var data:IMap;
      
      public function AssetBundle()
      {
         if(Boot.skip_constructor)
         {
            return;
         }
         data = new StringMap();
         paths = [];
      }
      
      public static function fromBytes(param1:Bytes) : AssetBundle
      {
         var _loc2_:BytesInput = new BytesInput(param1);
         return AssetBundle.__extractBundle(_loc2_);
      }
      
      public static function fromFile(param1:String) : AssetBundle
      {
         return null;
      }
      
      public static function loadFromBytes(param1:Bytes) : Future
      {
         return Future.withValue(AssetBundle.fromBytes(param1));
      }
      
      public static function loadFromFile(param1:String) : Future
      {
         return Bytes_Impl_.loadFromFile(param1).then(AssetBundle.loadFromBytes);
      }
      
      public static function __extractBundle(param1:Input) : AssetBundle
      {
         var _loc5_:* = null;
         var _loc6_:* = null;
         var _loc7_:* = null as Bytes;
         var _loc8_:* = null as IMap;
         var _loc9_:* = null as String;
         var _loc10_:* = null as Bytes;
         var _loc11_:* = null as StringMap;
         var _loc2_:List = Reader.readZip(param1);
         var _loc3_:AssetBundle = new AssetBundle();
         var _loc4_:ListNode = _loc2_.h;
         while(_loc4_ != null)
         {
            _loc5_ = _loc4_.item;
            _loc4_ = _loc4_.next;
            _loc6_ = _loc5_;
            if(Boolean(_loc6_.compressed))
            {
               _loc7_ = _loc6_.data;
               _loc8_ = _loc3_.data;
               _loc9_ = _loc6_.fileName;
               _loc10_ = Bytes_Impl_.decompress(_loc7_,CompressionAlgorithm.DEFLATE);
               _loc11_ = _loc8_;
               if(_loc9_ in StringMap.reserved)
               {
                  _loc11_.setReserved(_loc9_,_loc10_);
               }
               else
               {
                  _loc11_.h[_loc9_] = _loc10_;
               }
            }
            else
            {
               _loc9_ = _loc6_.fileName;
               _loc7_ = _loc6_.data;
               _loc11_ = _loc3_.data;
               if(_loc9_ in StringMap.reserved)
               {
                  _loc11_.setReserved(_loc9_,_loc7_);
               }
               else
               {
                  _loc11_.h[_loc9_] = _loc7_;
               }
            }
            _loc3_.paths.push(_loc6_.fileName);
         }
         return _loc3_;
      }
   }
}

