package haxe.ds
{
   import flash.Boot;
   import haxe.IMap;
   
   public class EnumValueMap extends BalancedTree implements IMap
   {
      
      public function EnumValueMap()
      {
         if(Boot.skip_constructor)
         {
            return;
         }
         super();
      }
      
      public function compareArgs(param1:Array, param2:Array) : int
      {
         var _loc6_:int = 0;
         var _loc7_:int = 0;
         var _loc3_:int = int(param1.length) - int(param2.length);
         if(_loc3_ != 0)
         {
            return _loc3_;
         }
         var _loc4_:int = 0;
         var _loc5_:int = int(param1.length);
         while(_loc4_ < _loc5_)
         {
            _loc6_ = _loc4_++;
            _loc7_ = compareArg(param1[_loc6_],param2[_loc6_]);
            if(_loc7_ != 0)
            {
               return _loc7_;
            }
         }
         return 0;
      }
      
      public function compareArg(param1:*, param2:*) : int
      {
         if(Reflect.isEnumValue(param1) && Reflect.isEnumValue(param2))
         {
            return compare(param1,param2);
         }
         if(param1 is Array && param2 is Array)
         {
            return compareArgs(param1,param2);
         }
         return Reflect.compare(param1,param2);
      }
      
      override public function compare(param1:Object, param2:Object) : int
      {
         var _loc3_:Object = param1;
         var _loc4_:Object = param2;
         var _loc5_:int = int(_loc3_.index) - int(_loc4_.index);
         if(_loc5_ != 0)
         {
            return _loc5_;
         }
         var _loc6_:Array = Type.enumParameters(_loc3_);
         var _loc7_:Array = Type.enumParameters(_loc4_);
         if(int(_loc6_.length) == 0 && int(_loc7_.length) == 0)
         {
            return 0;
         }
         return compareArgs(_loc6_,_loc7_);
      }
   }
}

