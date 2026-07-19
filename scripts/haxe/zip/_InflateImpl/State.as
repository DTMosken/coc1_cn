package haxe.zip._InflateImpl
{
   import flash.Boot;
   
   public final class State
   {
      
      public static const __isenum:Boolean = true;
      
      public static var Block:State = new State("Block",1,null);
      
      public static var CData:State = new State("CData",2,null);
      
      public static var Crc:State = new State("Crc",4,null);
      
      public static var Dist:State = new State("Dist",5,null);
      
      public static var DistOne:State = new State("DistOne",6,null);
      
      public static var Done:State = new State("Done",7,null);
      
      public static var Flat:State = new State("Flat",3,null);
      
      public static var Head:State = new State("Head",0,null);
      
      public static var __constructs__:Array = ["Head","Block","CData","Flat","Crc","Dist","DistOne","Done"];
      
      public var tag:String;
      
      public var index:int;
      
      public var params:Array;
      
      public const __enum__:Boolean = true;
      
      public function State(param1:String, param2:int, param3:Array)
      {
         tag = param1;
         index = param2;
         params = param3;
      }
      
      final public function toString() : String
      {
         return Boot.enum_to_string(this);
      }
   }
}

