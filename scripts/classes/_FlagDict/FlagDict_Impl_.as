package classes._FlagDict
{
   import haxe.IMap;
   import haxe.ds.IntMap;
   
   public final class FlagDict_Impl_
   {
      
      public function FlagDict_Impl_()
      {
      }
      
      public static function _new() : IMap
      {
         return new IntMap();
      }
      
      public static function arrayReadString(param1:IMap, param2:int) : String
      {
         var _loc3_:* = param1.h[param2];
         return _loc3_ != null ? _loc3_ : "";
      }
      
      public static function arrayReadInt(param1:IMap, param2:int) : int
      {
         var _loc3_:* = param1.h[param2];
         return _loc3_ != null ? _loc3_ : 0;
      }
      
      public static function arrayReadFloat(param1:IMap, param2:int) : Number
      {
         var _loc3_:* = param1.h[param2];
         return _loc3_ != null ? _loc3_ : 0;
      }
      
      public static function arrayReadBool(param1:IMap, param2:int) : Boolean
      {
         var _loc3_:* = param1.h[param2];
         return _loc3_ != null && Boolean(_loc3_);
      }
      
      public static function arrayWriteString(param1:IMap, param2:int, param3:String) : void
      {
         if(param3 == "")
         {
            param1.remove(param2);
         }
         else
         {
            param1.h[param2] = param3;
         }
      }
      
      public static function arrayWriteInt(param1:IMap, param2:int, param3:int) : void
      {
         if(param3 == 0)
         {
            param1.remove(param2);
         }
         else
         {
            param1.h[param2] = param3;
         }
      }
      
      public static function arrayWriteFloat(param1:IMap, param2:int, param3:Number) : void
      {
         if(param3 == 0)
         {
            param1.remove(param2);
         }
         else
         {
            param1.h[param2] = param3;
         }
      }
      
      public static function arrayWriteBool(param1:IMap, param2:int, param3:Boolean) : void
      {
         param1.h[param2] = param3;
      }
      
      public static function load(param1:IMap, param2:*) : void
      {
         var _loc7_:* = null as String;
         var _loc8_:* = null;
         var _loc9_:* = null as String;
         var _loc10_:* = null as String;
         var _loc11_:* = null;
         var _loc12_:int = 0;
         var _loc3_:* = param2;
         var _loc4_:* = _loc3_;
         var _loc5_:Array = Reflect.fields(_loc3_);
         var _loc6_:int = 0;
         while(_loc6_ < int(_loc5_.length))
         {
            _loc7_ = _loc5_[_loc6_++];
            _loc8_ = Reflect.field(_loc4_,_loc7_);
            _loc9_ = _loc7_;
            _loc10_ = _loc9_;
            _loc11_ = _loc8_;
            _loc12_ = int(Std.parseInt(_loc10_));
            param1.h[_loc12_] = _loc11_;
         }
      }
   }
}

