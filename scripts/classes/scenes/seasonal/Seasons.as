package classes.scenes.seasonal
{
   import classes.BaseContent;
   import classes.PerkLib;
   import classes.Player;
   import classes._FlagDict.FlagDict_Impl_;
   import classes.globalFlags.KFLAGS;
   import classes.scenes.Inventory;
   import flash.Boot;
   
   public class Seasons extends BaseContent
   {
      
      public static var WINTER:int = 0;
      
      public static var SPRING:int = 1;
      
      public static var SUMMER:int = 2;
      
      public static var AUTUMN:int = 3;
      
      public static var WITCH:int = -1;
      
      public function Seasons()
      {
         if(Boot.skip_constructor)
         {
            return;
         }
         super();
      }
      
      public function isItWinter(param1:Boolean = false) : Boolean
      {
         if(!(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,2996) > 0 && !param1))
         {
            return get_season() == 0;
         }
         return true;
      }
      
      public function isItValentine(param1:Boolean = false) : Boolean
      {
         if(!(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,2996) > 0 && !param1))
         {
            if(int(get_date().getMonth()) == 1 && int(get_date().getDate()) >= 7)
            {
               return int(get_date().getDate()) <= 21;
            }
            return false;
         }
         return true;
      }
      
      public function isItThanksgiving(param1:Boolean = false) : Boolean
      {
         if(!(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,2996) > 0 && !param1 || int(get_date().getMonth()) == 10 && int(get_date().getDate()) >= 18 || int(get_date().getMonth()) == 11 && int(get_date().getDate()) <= 2))
         {
            if(get_inventory().countTotalFoodItems() >= 15)
            {
               return !param1;
            }
            return false;
         }
         return true;
      }
      
      public function isItSummer(param1:Boolean = false) : Boolean
      {
         if(!(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,2996) > 0 && !param1))
         {
            return get_season() == 2;
         }
         return true;
      }
      
      public function isItSpring(param1:Boolean = false) : Boolean
      {
         if(!(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,2996) > 0 && !param1))
         {
            return get_season() == 1;
         }
         return true;
      }
      
      public function isItSaturnalia(param1:Boolean = false) : Boolean
      {
         if(!(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,2996) > 0 && !param1 || get_player().hasPerk(PerkLib.AChristmasCarol) && !param1 || int(get_date().getMonth()) == 11 && int(get_date().getDate()) >= 18))
         {
            if(int(get_date().getMonth()) == 0)
            {
               return int(get_date().getDate()) <= 1;
            }
            return false;
         }
         return true;
      }
      
      public function isItHalloween(param1:Boolean = false) : Boolean
      {
         if(!(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,2996) > 0 && !param1 || int(get_date().getMonth()) == 9 && int(get_date().getDate()) >= 24 || int(get_date().getMonth()) == 10 && int(get_date().getDate()) <= 7))
         {
            if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,2678) >= 4)
            {
               return !param1;
            }
            return false;
         }
         return true;
      }
      
      public function isItEaster(param1:Boolean = false) : Boolean
      {
         if(!(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,2996) > 0 && !param1))
         {
            if(int(get_date().getMonth()) == 3)
            {
               return int(get_date().getDate()) <= 15;
            }
            return false;
         }
         return true;
      }
      
      public function isItAutumn(param1:Boolean = false) : Boolean
      {
         if(!(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,2996) > 0 && !param1))
         {
            return get_season() == 3;
         }
         return true;
      }
      
      public function isItAprilFools() : Boolean
      {
         if(int(get_date().getMonth()) == 3)
         {
            return int(get_date().getDate()) == 1;
         }
         return false;
      }
      
      public function get_season() : int
      {
         switch(int(get_date().getMonth()))
         {
            case 0:
            case 1:
            case 11:
               return 0;
            case 2:
            case 3:
            case 4:
               return 1;
            case 5:
            case 6:
            case 7:
               return 2;
            case 8:
            case 9:
            case 10:
               return 3;
            default:
               return -1;
         }
      }
   }
}

