package classes.scenes.places.bazaar
{
   import flash.Boot;
   
   public final class TellyCom
   {
      
      public static const __isenum:Boolean = true;
      
      public static var TellyComA:TellyCom = new TellyCom("TellyComA",4,null);
      
      public static var TellyComB:TellyCom = new TellyCom("TellyComB",1,null);
      
      public static var TellyComD:TellyCom = new TellyCom("TellyComD",6,null);
      
      public static var TellyComH:TellyCom = new TellyCom("TellyComH",5,null);
      
      public static var TellyComK:TellyCom = new TellyCom("TellyComK",2,null);
      
      public static var TellyComL:TellyCom = new TellyCom("TellyComL",0,null);
      
      public static var TellyComP:TellyCom = new TellyCom("TellyComP",3,null);
      
      public static var __constructs__:Array = ["TellyComL","TellyComB","TellyComK","TellyComP","TellyComA","TellyComH","TellyComD"];
      
      public var tag:String;
      
      public var index:int;
      
      public var params:Array;
      
      public const __enum__:Boolean = true;
      
      public function TellyCom(param1:String, param2:int, param3:Array)
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

