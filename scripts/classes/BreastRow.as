package classes
{
   import classes.internals.Utils;
   import flash.Boot;
   
   public class BreastRow
   {
      
      public var nipplesPerBreast:Number;
      
      public var nippleCocks:Boolean;
      
      public var milkFullness:Number;
      
      public var lactationMultiplier:Number;
      
      public var fullness:Number;
      
      public var fuckable:Boolean;
      
      public var breasts:Number;
      
      public var breastRating:Number;
      
      public function BreastRow()
      {
         if(Boot.skip_constructor)
         {
            return;
         }
         nippleCocks = false;
         fuckable = false;
         fullness = 0;
         milkFullness = 0;
         lactationMultiplier = 0;
         breastRating = 0;
         nipplesPerBreast = 1;
         breasts = 2;
      }
      
      public function validate() : String
      {
         var _loc1_:String = "";
         return _loc1_ + Utils.validateNonNegativeNumberFields(this,"BreastRow.validate",["breasts","nipplesPerBreast","breastRating","lactationMultiplier","milkFullness","fullness"]);
      }
      
      public function restore() : void
      {
         breasts = 2;
         nipplesPerBreast = 1;
         breastRating = 0;
         lactationMultiplier = 0;
         milkFullness = 0;
         fullness = 0;
         fuckable = false;
         nippleCocks = false;
      }
   }
}

