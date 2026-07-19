package format.amf3
{
   import flash.Boot;
   import haxe.IMap;
   
   public class Amf3Array
   {
      
      public static var __meta__:* = {"fields":{"extra":{"optional":null}}};
      
      public var extra:IMap;
      
      public var a:Array;
      
      public function Amf3Array(param1:Array = undefined, param2:IMap = undefined)
      {
         if(Boot.skip_constructor)
         {
            return;
         }
         a = param1;
         extra = param2;
      }
   }
}

