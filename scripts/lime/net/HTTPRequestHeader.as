package lime.net
{
   import flash.Boot;
   
   public class HTTPRequestHeader
   {
      
      public var value:String;
      
      public var name:String;
      
      public function HTTPRequestHeader(param1:String = undefined, param2:String = undefined)
      {
         if(param2 == null)
         {
            param2 = "";
         }
         if(Boot.skip_constructor)
         {
            return;
         }
         name = param1;
         value = param2;
      }
   }
}

