package classes
{
   import flash.Boot;
   
   public class Credits
   {
      
      public var sections:Array;
      
      public var heading:String;
      
      public var footing:String;
      
      public var displayFooting:Boolean;
      
      public var credits:Array;
      
      public function Credits(param1:Array = undefined, param2:String = undefined, param3:String = undefined, param4:Array = undefined, param5:Object = undefined)
      {
         if(Boot.skip_constructor)
         {
            return;
         }
         displayFooting = false;
         footing = "";
         sections = param1;
         heading = param2;
         if(param3 != null)
         {
            footing = param3;
         }
         credits = param4;
         if(param5 != null)
         {
            displayFooting = param5;
         }
      }
   }
}

