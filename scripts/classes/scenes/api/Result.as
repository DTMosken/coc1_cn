package classes.scenes.api
{
   import flash.Boot;
   
   public final class Result
   {
      
      public static const __isenum:Boolean = true;
      
      public static var __constructs__:Array = ["Success","Failure"];
      
      public var tag:String;
      
      public var index:int;
      
      public var params:Array;
      
      public const __enum__:Boolean = true;
      
      public function Result(param1:String, param2:int, param3:Array)
      {
         tag = param1;
         index = param2;
         params = param3;
      }
      
      public static function Failure(param1:Object) : Result
      {
         return new Result("Failure",1,[param1]);
      }
      
      public static function Success(param1:Object) : Result
      {
         return new Result("Success",0,[param1]);
      }
      
      final public function toString() : String
      {
         return Boot.enum_to_string(this);
      }
   }
}

