package classes
{
   import flash.Boot;
   
   public class Credit
   {
      
      public var types:Array;
      
      public var rank:int;
      
      public var name:String;
      
      public var hash:String;
      
      public var contributions:Array;
      
      public function Credit(param1:String = undefined, param2:String = undefined, param3:Array = undefined, param4:Array = undefined, param5:Object = undefined)
      {
         if(Boot.skip_constructor)
         {
            return;
         }
         rank = 0;
         contributions = [];
         hash = "";
         name = param1;
         if(param2 != null)
         {
            hash = param2;
         }
         if(param3 != null)
         {
            contributions = param3;
         }
         types = param4;
         if(param5 != null)
         {
            rank = param5;
         }
      }
   }
}

