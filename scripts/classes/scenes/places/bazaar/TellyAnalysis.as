package classes.scenes.places.bazaar
{
   import flash.Boot;
   import haxe.ds.Either;
   
   public class TellyAnalysis
   {
      
      public var tellyPrompt:String;
      
      public var tellyProcessing:Either;
      
      public var tellyPayment:int;
      
      public var tellyNym:String;
      
      public function TellyAnalysis(param1:Either = undefined, param2:String = undefined, param3:int = 0, param4:String = undefined)
      {
         if(Boot.skip_constructor)
         {
            return;
         }
         tellyProcessing = param1;
         tellyNym = param2;
         tellyPayment = param3;
         tellyPrompt = param4;
      }
   }
}

