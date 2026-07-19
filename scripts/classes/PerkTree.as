package classes
{
   import flash.Boot;
   import haxe.IMap;
   import haxe.ds.StringMap;
   
   public class PerkTree
   {
      
      public var unlocks:IMap;
      
      public function PerkTree()
      {
         var _loc9_:* = null;
         var _loc10_:int = 0;
         var _loc11_:Boolean = false;
         var _loc12_:* = null as PerkType;
         var _loc13_:* = null as PerkType;
         var _loc14_:int = 0;
         var _loc15_:* = null as Array;
         var _loc16_:* = null as Requirement;
         var _loc17_:* = null as RequirementType;
         var _loc18_:* = null as PerkType;
         var _loc19_:* = null as Array;
         var _loc20_:int = 0;
         if(Boot.skip_constructor)
         {
            return;
         }
         unlocks = new StringMap();
         var _loc1_:IMap = PerkType.getPerkLibrary();
         var _loc2_:* = _loc1_.h;
         var _loc3_:* = _loc1_.rh;
         var _loc4_:int = 0;
         var _loc5_:* = _loc2_;
         var _loc6_:int = _loc4_;
         var _loc7_:Boolean = §§hasnext(_loc5_,_loc6_);
         if(!_loc7_ && _loc3_ != null)
         {
            _loc2_ = _loc3_;
            _loc5_ = _loc2_;
            _loc4_ = 0;
            _loc6_ = _loc4_;
            _loc3_ = null;
            _loc7_ = §§hasnext(_loc5_,_loc6_);
         }
         var _loc8_:int = _loc6_;
         while(true)
         {
            _loc9_ = _loc2_;
            _loc10_ = _loc4_;
            _loc11_ = §§hasnext(_loc9_,_loc10_);
            if(!_loc11_ && _loc3_ != null)
            {
               _loc2_ = _loc3_;
               _loc9_ = _loc2_;
               _loc4_ = 0;
               _loc10_ = _loc4_;
               _loc3_ = null;
               _loc11_ = §§hasnext(_loc9_,_loc10_);
            }
            _loc8_ = _loc10_;
            if(!_loc11_)
            {
               break;
            }
            _loc12_ = §§nextvalue(_loc8_,_loc2_);
            _loc4_ = _loc8_;
            _loc13_ = _loc12_;
            _loc14_ = 0;
            _loc15_ = _loc13_.requirements;
            while(_loc14_ < int(_loc15_.length))
            {
               _loc16_ = _loc15_[_loc14_];
               _loc14_++;
               _loc17_ = _loc16_.type;
               switch(_loc17_.index)
               {
                  case 0:
                     _loc18_ = _loc17_.params[0];
                     pushUnlock(_loc18_,_loc13_);
                     break;
                  case 1:
                     _loc19_ = _loc17_.params[0];
                     _loc20_ = 0;
                     while(_loc20_ < int(_loc19_.length))
                     {
                        _loc18_ = _loc19_[_loc20_];
                        _loc20_++;
                        pushUnlock(_loc18_,_loc13_);
                     }
               }
            }
         }
      }
      
      public static function obtainablePerks() : Array
      {
         var _loc10_:* = null;
         var _loc11_:int = 0;
         var _loc12_:Boolean = false;
         var _loc13_:* = null as PerkType;
         var _loc14_:* = null as PerkType;
         var _loc1_:Array = [];
         var _loc2_:StringMap = PerkType.getPerkLibrary();
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
            if(int(_loc14_.requirements.length) > 0)
            {
               _loc1_.push(_loc14_);
            }
         }
         _loc1_.sort(function(param1:PerkType, param2:PerkType):int
         {
            return Reflect.compare(param1.get_name(),param2.get_name());
         });
         return _loc1_;
      }
      
      public static function availablePerks(param1:Player) : Array
      {
         var _loc5_:* = null as PerkType;
         var _loc2_:Array = [];
         var _loc3_:int = 0;
         var _loc4_:Array = PerkTree.obtainablePerks();
         while(_loc3_ < int(_loc4_.length))
         {
            _loc5_ = _loc4_[_loc3_];
            _loc3_++;
            if(!param1.hasPerk(_loc5_) && _loc5_.available(param1))
            {
               _loc2_.push(_loc5_);
            }
         }
         return _loc2_;
      }
      
      public function pushUnlock(param1:PerkType, param2:PerkType) : void
      {
         var _loc6_:* = null as IMap;
         var _loc7_:* = null as String;
         var _loc8_:* = null as StringMap;
         var _loc9_:* = null as Array;
         var _loc3_:IMap = unlocks;
         var _loc4_:String = param1.get_id();
         var _loc5_:StringMap = _loc3_;
         if(!(_loc4_ in StringMap.reserved ? _loc5_.existsReserved(_loc4_) : _loc4_ in _loc5_.h))
         {
            _loc6_ = unlocks;
            _loc7_ = param1.get_id();
            _loc8_ = _loc6_;
            _loc9_ = [];
            if(_loc7_ in StringMap.reserved)
            {
               _loc8_.setReserved(_loc7_,_loc9_);
            }
            else
            {
               _loc8_.h[_loc7_] = _loc9_;
            }
         }
         _loc6_ = unlocks;
         _loc7_ = param1.get_id();
         _loc8_ = _loc6_;
         (_loc7_ in StringMap.reserved ? _loc8_.getReserved(_loc7_) : _loc8_.h[_loc7_]).push(param2);
      }
      
      public function listUnlocks(param1:PerkType) : Array
      {
         var _loc2_:IMap = unlocks;
         var _loc3_:String = param1.get_id();
         var _loc4_:StringMap = _loc2_;
         var _loc5_:Array = _loc3_ in StringMap.reserved ? _loc4_.getReserved(_loc3_) : _loc4_.h[_loc3_];
         if(_loc5_ != null)
         {
            return _loc5_;
         }
         return [];
      }
   }
}

