package coc.view
{
   import flash.Boot;
   
   public final class LayoutType
   {
      
      public static const __isenum:Boolean = true;
      
      public static var None:LayoutType = new LayoutType("None",0,null);
      
      public static var __constructs__:Array = ["None","Flow","Grid"];
      
      public var tag:String;
      
      public var index:int;
      
      public var params:Array;
      
      public const __enum__:Boolean = true;
      
      public function LayoutType(param1:String, param2:int, param3:Array)
      {
         tag = param1;
         index = param2;
         params = param3;
      }
      
      public static function Flow(param1:FlowDirection, param2:Object = undefined, param3:Object = undefined) : LayoutType
      {
         return new LayoutType("Flow",1,[param1,param2,param3]);
      }
      
      public static function Grid(param1:int, param2:int, param3:Object = undefined, param4:Object = undefined) : LayoutType
      {
         return new LayoutType("Grid",2,[param1,param2,param3,param4]);
      }
      
      final public function toString() : String
      {
         return Boot.enum_to_string(this);
      }
   }
}

