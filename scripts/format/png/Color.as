package format.png
{
   import flash.Boot;
   
   public final class Color
   {
      
      public static const __isenum:Boolean = true;
      
      public static var ColIndexed:Color = new Color("ColIndexed",2,null);
      
      public static var __constructs__:Array = ["ColGrey","ColTrue","ColIndexed"];
      
      public var tag:String;
      
      public var index:int;
      
      public var params:Array;
      
      public const __enum__:Boolean = true;
      
      public function Color(param1:String, param2:int, param3:Array)
      {
         tag = param1;
         index = param2;
         params = param3;
      }
      
      public static function ColGrey(param1:Boolean) : Color
      {
         return new Color("ColGrey",0,[param1]);
      }
      
      public static function ColTrue(param1:Boolean) : Color
      {
         return new Color("ColTrue",1,[param1]);
      }
      
      final public function toString() : String
      {
         return Boot.enum_to_string(this);
      }
   }
}

