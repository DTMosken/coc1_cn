package classes.bodyParts
{
   public class BaseBodyPart
   {
      
      public static var COLOR_ID_MAIN:int = 1;
      
      public static var COLOR_ID_2ND:int = 2;
      
      public function BaseBodyPart()
      {
      }
      
      public function hasOilColor(param1:String) : Boolean
      {
         return true;
      }
      
      public function hasOil2Color(param1:String) : Boolean
      {
         return true;
      }
      
      public function hasDyeColor(param1:String) : Boolean
      {
         return true;
      }
      
      public function getColorDesc(param1:int) : String
      {
         return "";
      }
      
      public function canOil2() : Boolean
      {
         return false;
      }
      
      public function canOil() : Boolean
      {
         return false;
      }
      
      public function canDye() : Boolean
      {
         return false;
      }
      
      public function applyOil2(param1:String) : void
      {
      }
      
      public function applyOil(param1:String) : void
      {
      }
      
      public function applyDye(param1:String) : void
      {
      }
   }
}

