package classes
{
   import flash.Boot;
   import haxe.IMap;
   import haxe.ds.StringMap;
   
   public class StatusEffectType
   {
      
      public static var init__:Boolean;
      
      public static var STATUSAFFECT_LIBRARY:IMap;
      
      public var arity:int;
      
      public var _secClazz:Class;
      
      public var _id:String;
      
      public function StatusEffectType(param1:String = undefined, param2:Class = undefined, param3:int = 0)
      {
         if(Boot.skip_constructor)
         {
            return;
         }
         arity = 0;
         _id = param1;
         arity = param3;
         _secClazz = param2;
         var _loc4_:StringMap = StatusEffectType.STATUSAFFECT_LIBRARY;
         if((param1 in StringMap.reserved ? _loc4_.getReserved(param1) : _loc4_.h[param1]) != null)
         {
            CoC_Settings.error("重复的状态效果 " + param1);
         }
         var _loc5_:StringMap = StatusEffectType.STATUSAFFECT_LIBRARY;
         if(param1 in StringMap.reserved)
         {
            _loc5_.setReserved(param1,this);
         }
         else
         {
            _loc5_.h[param1] = this;
         }
         if(!(param3 >= 0 && param3 <= 1))
         {
            throw new Error("不支持的状态效果 \'" + param1 + "\' 构造函数参数数量 " + param3);
         }
      }
      
      public static function lookupStatusEffect(param1:String) : StatusEffectType
      {
         var _loc2_:StringMap = StatusEffectType.STATUSAFFECT_LIBRARY;
         if(param1 in StringMap.reserved)
         {
            return _loc2_.getReserved(param1);
         }
         return _loc2_.h[param1];
      }
      
      public static function getStatusEffectLibrary() : IMap
      {
         return StatusEffectType.STATUSAFFECT_LIBRARY;
      }
      
      public function toString() : String
      {
         return "\"" + _id + "\"";
      }
      
      public function get_id() : String
      {
         return _id;
      }
      
      public function create(param1:Number, param2:Number, param3:Number, param4:Number) : StatusEffect
      {
         var _loc5_:StatusEffect = null;
         if(arity == 0)
         {
            _loc5_ = Type.createInstance(_secClazz,[]);
         }
         else if(arity == 1)
         {
            _loc5_ = Type.createInstance(_secClazz,[this]);
         }
         _loc5_.value1 = param1;
         _loc5_.value2 = param2;
         _loc5_.value3 = param3;
         _loc5_.value4 = param4;
         return _loc5_;
      }
   }
}

