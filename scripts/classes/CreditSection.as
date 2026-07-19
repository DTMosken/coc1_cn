package classes
{
   import flash.Boot;
   
   public class CreditSection
   {
      
      public var type:ContributionType;
      
      public var heading:String;
      
      public function CreditSection(param1:ContributionType = undefined, param2:String = undefined)
      {
         if(Boot.skip_constructor)
         {
            return;
         }
         type = param1;
         heading = param2;
      }
   }
}

