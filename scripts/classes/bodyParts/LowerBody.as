package classes.bodyParts
{
   import flash.Boot;
   
   public class LowerBody
   {
      
      public static var HUMAN:int = 0;
      
      public static var HOOFED:int = 1;
      
      public static var DOG:int = 2;
      
      public static var NAGA:int = 3;
      
      public static var DEMONIC_HIGH_HEELS:int = 5;
      
      public static var DEMONIC_CLAWS:int = 6;
      
      public static var BEE:int = 7;
      
      public static var GOO:int = 8;
      
      public static var CAT:int = 9;
      
      public static var LIZARD:int = 10;
      
      public static var PONY:int = 11;
      
      public static var BUNNY:int = 12;
      
      public static var HARPY:int = 13;
      
      public static var KANGAROO:int = 14;
      
      public static var CHITINOUS_SPIDER_LEGS:int = 15;
      
      public static var DRIDER:int = 16;
      
      public static var FOX:int = 17;
      
      public static var DRAGON:int = 18;
      
      public static var RACCOON:int = 19;
      
      public static var FERRET:int = 20;
      
      public static var CLOVEN_HOOFED:int = 21;
      
      public static var ECHIDNA:int = 23;
      
      public static var SALAMANDER:int = 25;
      
      public static var WOLF:int = 26;
      
      public static var IMP:int = 27;
      
      public static var COCKATRICE:int = 28;
      
      public static var RED_PANDA:int = 29;
      
      public static var ROOT_LEGS:int = 30;
      
      public static var GNOLL:int = 31;
      
      public static var MERMAID:int = 32;
      
      public static var BAT:int = 33;
      
      public var type:int;
      
      public var legCount:int;
      
      public var incorporeal:Boolean;
      
      public function LowerBody()
      {
         if(Boot.skip_constructor)
         {
            return;
         }
         incorporeal = false;
         legCount = 2;
         type = 0;
      }
      
      public function skin() : String
      {
         var _loc1_:String = "";
         switch(type)
         {
            case 1:
               _loc1_ = "兽皮";
               break;
            case 2:
            case 9:
            case 11:
            case 12:
            case 14:
            case 17:
            case 19:
            case 20:
            case 21:
            case 23:
            case 26:
            case 29:
               _loc1_ = "毛皮";
               break;
            case 3:
            case 10:
            case 18:
            case 25:
            case 32:
               _loc1_ = "鳞片";
               break;
            case 7:
            case 15:
            case 16:
               _loc1_ = "甲壳";
               break;
            case 8:
               _loc1_ = "史莱姆";
               break;
            case 13:
            case 28:
               _loc1_ = "羽毛";
               break;
            case 30:
               _loc1_ = "树皮";
               break;
            default:
               _loc1_ = "皮肤";
         }
         return _loc1_;
      }
      
      public function restore() : void
      {
         type = 0;
         legCount = 2;
         incorporeal = false;
      }
   }
}

