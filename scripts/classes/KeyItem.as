package classes
{
   import flash.Boot;
   
   public class KeyItem
   {
      
      public var value4:Number;
      
      public var value3:Number;
      
      public var value2:Number;
      
      public var value1:Number;
      
      public var keyName:String;
      
      public function KeyItem()
      {
         if(Boot.skip_constructor)
         {
            return;
         }
         value4 = 0;
         value3 = 0;
         value2 = 0;
         value1 = 0;
         keyName = "";
      }
   }
}

