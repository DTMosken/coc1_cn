package haxe.ds
{
   import flash.Boot;
   
   public final class Either
   {
      
      public static const __isenum:Boolean = true;
      
      public static var __constructs__:Array = ["Left","Right"];
      
      public var tag:String;
      
      public var index:int;
      
      public var params:Array;
      
      public const __enum__:Boolean = true;
      
      public function Either(param1:String, param2:int, param3:Array)
      {
         tag = param1;
         index = param2;
         params = param3;
      }
      
      public static function Left(param1:Object) : Either
      {
         return new Either("Left",0,[param1]);
      }
      
      public static function Right(param1:Object) : Either
      {
         return new Either("Right",1,[param1]);
      }
      
      final public function toString() : String
      {
         return Boot.enum_to_string(this);
      }
   }
}

