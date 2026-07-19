package classes.display
{
   import flash.Boot;
   
   public final class MapData
   {
      
      public static const __isenum:Boolean = true;
      
      public static var __constructs__:Array = ["Alternative","Legacy"];
      
      public var tag:String;
      
      public var index:int;
      
      public var params:Array;
      
      public const __enum__:Boolean = true;
      
      public function MapData(param1:String, param2:int, param3:Array)
      {
         tag = param1;
         index = param2;
         params = param3;
      }
      
      public static function Alternative(param1:int, param2:Array, param3:Array, param4:int) : MapData
      {
         return new MapData("Alternative",0,[param1,param2,param3,param4]);
      }
      
      public static function Legacy(param1:String, param2:String) : MapData
      {
         return new MapData("Legacy",1,[param1,param2]);
      }
      
      final public function toString() : String
      {
         return Boot.enum_to_string(this);
      }
   }
}

