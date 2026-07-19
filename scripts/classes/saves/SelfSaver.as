package classes.saves
{
   import classes.internals.Utils;
   import haxe.Exception;
   import haxe.IMap;
   import haxe.Log;
   import haxe.ds.StringMap;
   
   public final class SelfSaver
   {
      
      public static var init__:Boolean;
      
      public static var saveList:IMap;
      
      public function SelfSaver()
      {
      }
      
      public static function register(param1:SelfSaving) : void
      {
         var _loc2_:String = param1.saveName;
         var _loc3_:StringMap = SelfSaver.saveList;
         if(_loc2_ in StringMap.reserved ? _loc3_.existsReserved(_loc2_) : _loc2_ in _loc3_.h)
         {
            throw Exception.thrown("Self Saving Class with save name \"" + param1.saveName + "\" already registered");
         }
         var _loc4_:String = param1.saveName;
         var _loc5_:StringMap = SelfSaver.saveList;
         if(_loc4_ in StringMap.reserved)
         {
            _loc5_.setReserved(_loc4_,param1);
         }
         else
         {
            _loc5_.h[_loc4_] = param1;
         }
         param1.reset();
      }
      
      public static function load(param1:*, param2:Boolean = false) : void
      {
         var _loc3_:* = null as StringMap;
         var _loc4_:* = null;
         var _loc11_:* = null;
         var _loc12_:int = 0;
         var _loc13_:Boolean = false;
         var _loc14_:* = null as SelfSaving;
         var _loc15_:* = null as SelfSaving;
         var _loc17_:* = null as String;
         _loc3_ = SelfSaver.saveList;
         _loc4_ = _loc3_.h;
         var _loc5_:* = _loc3_.rh;
         var _loc6_:int = 0;
         var _loc7_:* = _loc4_;
         var _loc8_:int = _loc6_;
         var _loc9_:Boolean = §§hasnext(_loc7_,_loc8_);
         if(!_loc9_ && _loc5_ != null)
         {
            _loc4_ = _loc5_;
            _loc7_ = _loc4_;
            _loc6_ = 0;
            _loc8_ = _loc6_;
            _loc5_ = null;
            _loc9_ = §§hasnext(_loc7_,_loc8_);
         }
         var _loc10_:int = _loc8_;
         while(true)
         {
            _loc11_ = _loc4_;
            _loc12_ = _loc6_;
            _loc13_ = §§hasnext(_loc11_,_loc12_);
            if(!_loc13_ && _loc5_ != null)
            {
               _loc4_ = _loc5_;
               _loc11_ = _loc4_;
               _loc6_ = 0;
               _loc12_ = _loc6_;
               _loc5_ = null;
               _loc13_ = §§hasnext(_loc11_,_loc12_);
            }
            _loc10_ = _loc12_;
            if(!_loc13_)
            {
               break;
            }
            _loc14_ = §§nextvalue(_loc10_,_loc4_);
            _loc6_ = _loc10_;
            _loc15_ = _loc14_;
            if(Boolean(_loc15_.globalSave) == param2)
            {
               _loc15_.reset();
            }
         }
         _loc6_ = 0;
         var _loc16_:Array = Reflect.fields(param1);
         while(_loc6_ < int(_loc16_.length))
         {
            _loc17_ = _loc16_[_loc6_];
            _loc6_++;
            _loc3_ = SelfSaver.saveList;
            _loc14_ = _loc17_ in StringMap.reserved ? _loc3_.getReserved(_loc17_) : _loc3_.h[_loc17_];
            if(_loc14_ == null)
            {
               Log.trace("Unknown self save object: " + _loc17_,{
                  "fileName":"src/classes/saves/SelfSaver.hx",
                  "lineNumber":26,
                  "className":"classes.saves.SelfSaver",
                  "methodName":"load"
               });
            }
            else if(Boolean(_loc14_.globalSave) == param2)
            {
               _loc4_ = Utils.copy(Reflect.field(param1,_loc17_));
               _loc14_.load(int(_loc4_.version),_loc4_.data);
            }
         }
      }
      
      public static function save(param1:Boolean = false) : *
      {
         var _loc11_:* = null;
         var _loc12_:int = 0;
         var _loc13_:Boolean = false;
         var _loc14_:* = null as SelfSaving;
         var _loc15_:* = null as SelfSaving;
         var _loc16_:* = null as String;
         var _loc17_:* = null;
         var _loc2_:* = {};
         var _loc3_:StringMap = SelfSaver.saveList;
         var _loc4_:* = _loc3_.h;
         var _loc5_:* = _loc3_.rh;
         var _loc6_:int = 0;
         var _loc7_:* = _loc4_;
         var _loc8_:int = _loc6_;
         var _loc9_:Boolean = §§hasnext(_loc7_,_loc8_);
         if(!_loc9_ && _loc5_ != null)
         {
            _loc4_ = _loc5_;
            _loc7_ = _loc4_;
            _loc6_ = 0;
            _loc8_ = _loc6_;
            _loc5_ = null;
            _loc9_ = §§hasnext(_loc7_,_loc8_);
         }
         var _loc10_:int = _loc8_;
         while(true)
         {
            _loc11_ = _loc4_;
            _loc12_ = _loc6_;
            _loc13_ = §§hasnext(_loc11_,_loc12_);
            if(!_loc13_ && _loc5_ != null)
            {
               _loc4_ = _loc5_;
               _loc11_ = _loc4_;
               _loc6_ = 0;
               _loc12_ = _loc6_;
               _loc5_ = null;
               _loc13_ = §§hasnext(_loc11_,_loc12_);
            }
            _loc10_ = _loc12_;
            if(!_loc13_)
            {
               break;
            }
            _loc14_ = §§nextvalue(_loc10_,_loc4_);
            _loc6_ = _loc10_;
            _loc15_ = _loc14_;
            if(Boolean(_loc15_.globalSave) == param1)
            {
               _loc16_ = _loc15_.saveName;
               _loc17_ = {
                  "version":int(_loc15_.saveVersion),
                  "data":JSON.parse(JSON.stringify(_loc15_.saveToObject()))
               };
               _loc2_[_loc16_] = _loc17_;
            }
         }
         return _loc2_;
      }
      
      public static function ascend(param1:Boolean) : void
      {
         var _loc10_:* = null;
         var _loc11_:int = 0;
         var _loc12_:Boolean = false;
         var _loc13_:* = null as SelfSaving;
         var _loc14_:* = null as SelfSaving;
         var _loc2_:StringMap = SelfSaver.saveList;
         var _loc3_:* = _loc2_.h;
         var _loc4_:* = _loc2_.rh;
         var _loc5_:int = 0;
         var _loc6_:* = _loc3_;
         var _loc7_:int = _loc5_;
         var _loc8_:Boolean = §§hasnext(_loc6_,_loc7_);
         if(!_loc8_ && _loc4_ != null)
         {
            _loc3_ = _loc4_;
            _loc6_ = _loc3_;
            _loc5_ = 0;
            _loc7_ = _loc5_;
            _loc4_ = null;
            _loc8_ = §§hasnext(_loc6_,_loc7_);
         }
         var _loc9_:int = _loc7_;
         while(true)
         {
            _loc10_ = _loc3_;
            _loc11_ = _loc5_;
            _loc12_ = §§hasnext(_loc10_,_loc11_);
            if(!_loc12_ && _loc4_ != null)
            {
               _loc3_ = _loc4_;
               _loc10_ = _loc3_;
               _loc5_ = 0;
               _loc11_ = _loc5_;
               _loc4_ = null;
               _loc12_ = §§hasnext(_loc10_,_loc11_);
            }
            _loc9_ = _loc11_;
            if(!_loc12_)
            {
               break;
            }
            _loc13_ = §§nextvalue(_loc9_,_loc3_);
            _loc5_ = _loc9_;
            _loc14_ = _loc13_;
            _loc14_.onAscend(param1);
         }
      }
   }
}

