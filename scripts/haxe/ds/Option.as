package haxe.ds
{
   import flash.Boot;
   
   public final class Option
   {
      
      public static const __isenum:Boolean = true;
      
      public static var None:Option = new Option("None",1,null);
      
      public static var __constructs__:Array = ["Some","None"];
      
      public var tag:String;
      
      public var index:int;
      
      public var params:Array;
      
      public const __enum__:Boolean = true;
      
      public function Option(param1:String, param2:int, param3:Array)
      {
         tag = param1;
         index = param2;
         params = param3;
      }
      
      public static function Some(param1:Object) : Option
      {
         return new Option("Some",0,[param1]);
      }
      
      final public function toString() : String
      {
         return Boot.enum_to_string(this);
      }
   }
}

