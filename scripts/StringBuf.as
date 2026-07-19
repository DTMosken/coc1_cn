package
{
   import flash.Boot;
   
   public class StringBuf
   {
      
      public var b:String;
      
      public function StringBuf()
      {
         if(Boot.skip_constructor)
         {
            return;
         }
         b = "";
      }
   }
}

