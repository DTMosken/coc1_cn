package classes.bodyParts
{
   import flash.Boot;
   
   public class Wings extends BaseBodyPart
   {
      
      public static var NONE:int = 0;
      
      public static var BEE_LIKE_SMALL:int = 1;
      
      public static var BEE_LIKE_LARGE:int = 2;
      
      public static var HARPY:int = 4;
      
      public static var IMP:int = 5;
      
      public static var BAT_LIKE_TINY:int = 6;
      
      public static var BAT_LIKE_LARGE:int = 7;
      
      public static var FEATHERED_LARGE:int = 9;
      
      public static var DRACONIC_SMALL:int = 10;
      
      public static var DRACONIC_LARGE:int = 11;
      
      public static var GIANT_DRAGONFLY:int = 12;
      
      public static var IMP_LARGE:int = 13;
      
      public static var FAERIE_SMALL:int = 14;
      
      public static var FAERIE_LARGE:int = 15;
      
      public static var WOODEN:int = 16;
      
      public static var WILLOW:int = 17;
      
      public static var WEEPING:int = 18;
      
      public var type:int;
      
      public var color2:String;
      
      public var color:String;
      
      public function Wings()
      {
         if(Boot.skip_constructor)
         {
            return;
         }
         color2 = "no";
         color = "no";
         type = 0;
      }
      
      public function setProps(param1:Object) : void
      {
         if(param1.type != null)
         {
            type = param1.type;
         }
         if(param1.color != null)
         {
            color = param1.color;
         }
         if(param1.color2 != null)
         {
            color2 = param1.color2;
         }
      }
      
      public function setAllProps(param1:Object) : void
      {
         restore();
         setProps(param1);
      }
      
      public function restore() : void
      {
         type = 0;
         color = "no";
         color2 = "no";
      }
      
      override public function hasOilColor(param1:String) : Boolean
      {
         return color == param1;
      }
      
      override public function hasOil2Color(param1:String) : Boolean
      {
         return color2 == param1;
      }
      
      override public function hasDyeColor(param1:String) : Boolean
      {
         return color == param1;
      }
      
      override public function getColorDesc(param1:int) : String
      {
         if(type == 10 || type == 11)
         {
            switch(param1)
            {
               case 1:
                  return "membranes";
               case 2:
                  return "bones";
            }
         }
         return "";
      }
      
      override public function canOil2() : Boolean
      {
         return [10,11].indexOf(type) != -1;
      }
      
      override public function canOil() : Boolean
      {
         return [10,11].indexOf(type) != -1;
      }
      
      override public function canDye() : Boolean
      {
         return [4,9].indexOf(type) != -1;
      }
      
      override public function applyOil2(param1:String) : void
      {
         color2 = param1;
      }
      
      override public function applyOil(param1:String) : void
      {
         color = param1;
      }
      
      override public function applyDye(param1:String) : void
      {
         color = param1;
      }
   }
}

