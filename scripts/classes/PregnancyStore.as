package classes
{
   import classes._FlagDict.FlagDict_Impl_;
   import classes.globalFlags.KFLAGS;
   import classes.globalFlags.KGAMECLASS;
   import classes.internals.Utils;
   import flash.Boot;
   import haxe.IMap;
   import haxe.ds.IntMap;
   
   public class PregnancyStore
   {
      
      public static var PREGNANCY_IMP:int = 1;
      
      public static var PREGNANCY_MINOTAUR:int = 2;
      
      public static var PREGNANCY_COCKATRICE:int = 3;
      
      public static var PREGNANCY_MOUSE:int = 4;
      
      public static var PREGNANCY_OVIELIXIR_EGGS:int = 5;
      
      public static var PREGNANCY_HELL_HOUND:int = 6;
      
      public static var PREGNANCY_CENTAUR:int = 7;
      
      public static var PREGNANCY_MARBLE:int = 8;
      
      public static var PREGNANCY_BUNNY:int = 9;
      
      public static var PREGNANCY_ANEMONE:int = 10;
      
      public static var PREGNANCY_AMILY:int = 11;
      
      public static var PREGNANCY_IZMA:int = 12;
      
      public static var PREGNANCY_SPIDER:int = 13;
      
      public static var PREGNANCY_BASILISK:int = 14;
      
      public static var PREGNANCY_DRIDER_EGGS:int = 15;
      
      public static var PREGNANCY_GOO_GIRL:int = 16;
      
      public static var PREGNANCY_EMBER:int = 17;
      
      public static var PREGNANCY_BENOIT:int = 18;
      
      public static var PREGNANCY_SATYR:int = 19;
      
      public static var PREGNANCY_COTTON:int = 20;
      
      public static var PREGNANCY_URTA:int = 21;
      
      public static var PREGNANCY_SAND_WITCH:int = 22;
      
      public static var PREGNANCY_FROG_GIRL:int = 23;
      
      public static var PREGNANCY_FAERIE:int = 24;
      
      public static var PREGNANCY_PLAYER:int = 25;
      
      public static var PREGNANCY_BEE_EGGS:int = 26;
      
      public static var PREGNANCY_SANDTRAP_FERTILE:int = 27;
      
      public static var PREGNANCY_SANDTRAP:int = 28;
      
      public static var PREGNANCY_JOJO:int = 29;
      
      public static var PREGNANCY_KELT:int = 30;
      
      public static var PREGNANCY_TAOTH:int = 31;
      
      public static var PREGNANCY_GOO_STUFFED:int = 32;
      
      public static var PREGNANCY_WORM_STUFFED:int = 33;
      
      public static var PREGNANCY_MINERVA:int = 34;
      
      public static var PREGNANCY_PHOENIX:int = 36;
      
      public static var PREGNANCY_ANDY:int = 37;
      
      public static var PREGNANCY_CORRWITCH:int = 38;
      
      public static var PREGNANCY_TENTACLE_BEAST_SEED:int = 39;
      
      public static var PREG_NOT_PREGANT:int = 0;
      
      public static var PREG_NO_SIGNS_UNKNOWN:int = 1;
      
      public static var PREG_NO_SIGNS_KNOWN:int = 2;
      
      public static var PREG_START_BULGE:int = 3;
      
      public static var PREG_SWOLLEN:int = 4;
      
      public static var PREG_SIZEABLE:int = 5;
      
      public static var PREG_BLATANT:int = 6;
      
      public static var PREG_FULL_TERM:int = 7;
      
      public static var PREG_OVERDUE:int = 8;
      
      public static var PREG_VERY_OVERDUE:int = 9;
      
      public static var INCUBATION_IMP:int = 432;
      
      public static var INCUBATION_MINOTAUR:int = 432;
      
      public static var INCUBATION_MOUSE:int = 350;
      
      public static var INCUBATION_OVIELIXIR_EGGS:int = 50;
      
      public static var INCUBATION_HELL_HOUND:int = 352;
      
      public static var INCUBATION_CENTAUR:int = 420;
      
      public static var INCUBATION_CORRWITCH:int = 240;
      
      public static var INCUBATION_MARBLE:int = 368;
      
      public static var INCUBATION_BUNNY_BABY:int = 200;
      
      public static var INCUBATION_BUNNY_EGGS:int = 808;
      
      public static var INCUBATION_ANEMONE:int = 256;
      
      public static var INCUBATION_IZMA:int = 300;
      
      public static var INCUBATION_SPIDER:int = 400;
      
      public static var INCUBATION_BASILISK:int = 250;
      
      public static var INCUBATION_COCKATRICE:int = 225;
      
      public static var INCUBATION_DRIDER:int = 400;
      
      public static var INCUBATION_GOO_GIRL:int = 85;
      
      public static var INCUBATION_EMBER:int = 336;
      
      public static var INCUBATION_SATYR:int = 160;
      
      public static var INCUBATION_COTTON:int = 350;
      
      public static var INCUBATION_URTA:int = 515;
      
      public static var INCUBATION_SAND_WITCH:int = 360;
      
      public static var INCUBATION_FROG_GIRL:int = 30;
      
      public static var INCUBATION_FAERIE:int = 200;
      
      public static var INCUBATION_BEE:int = 48;
      
      public static var INCUBATION_SANDTRAP:int = 42;
      
      public static var INCUBATION_HARPY:int = 168;
      
      public static var INCUBATION_SHIELA:int = 72;
      
      public static var INCUBATION_SALAMANDER:int = 336;
      
      public static var INCUBATION_MINERVA:int = 216;
      
      public static var INCUBATION_PHOENIX:int = 168;
      
      public static var INCUBATION_KIHA:int = 336;
      
      public static var INCUBATION_ISABELLA:int = 2160;
      
      public static var INCUBATION_TENTACLE_BEAST_SEED:int = 120;
      
      public static var INCUBATION_SYLVIA:int = 336;
      
      public static var MAX_FLAG_VALUE:int = 2999;
      
      public static var PREG_TYPE_MASK:int = 65535;
      
      public static var PREG_NOTICE_MASK:int = 2147418112;
      
      public var allowHerm:Boolean;
      
      public var _pregnancyTypeFlag:int;
      
      public var _pregnancyIncubationFlag:int;
      
      public var _pregnancyEventValue:IMap;
      
      public function PregnancyStore(param1:int = 0, param2:int = 0)
      {
         if(Boot.skip_constructor)
         {
            return;
         }
         allowHerm = false;
         _pregnancyEventValue = new IntMap();
         _pregnancyTypeFlag = param1;
         _pregnancyIncubationFlag = param2;
      }
      
      public function set_incubation(param1:int) : int
      {
         FlagDict_Impl_.arrayWriteInt(KFLAGS.flags,_pregnancyIncubationFlag,param1);
         return param1;
      }
      
      public function pregnancyAdvance() : void
      {
         var _loc1_:int = get_incubation() - 1;
         if(_loc1_ >= 0)
         {
            set_incubation(_loc1_);
         }
      }
      
      public function knockUpForce(param1:int = 0, param2:int = 0, param3:Boolean = false) : void
      {
         var _loc4_:int = 0;
         if(param1 != 0)
         {
            _loc4_ = FlagDict_Impl_.arrayReadInt(KFLAGS.flags,_pregnancyTypeFlag);
            param1 = (_loc4_ & 0x7FFF0000) + param1;
         }
         FlagDict_Impl_.arrayWriteInt(KFLAGS.flags,_pregnancyTypeFlag,param1);
         FlagDict_Impl_.arrayWriteInt(KFLAGS.flags,_pregnancyIncubationFlag,param1 == 0 ? 0 : param2);
         if(param3 || KGAMECLASS.kGAMECLASS.player.isHerm())
         {
            allowHerm = true;
         }
      }
      
      public function knockUpChance(param1:int = 20, param2:int = 60, param3:Creature = undefined) : Boolean
      {
         if(get_isPregnant())
         {
            return false;
         }
         if(param3 == null)
         {
            param3 = KGAMECLASS.kGAMECLASS.player;
         }
         return Utils.randomChance(Utils.boundInt(param1,param1 + param3.virilityQ(),param2));
      }
      
      public function knockUp(param1:int = 0, param2:int = 0, param3:Boolean = false) : void
      {
         if(!get_isPregnant())
         {
            knockUpForce(param1,param2,param3);
         }
      }
      
      public function get_type() : int
      {
         return FlagDict_Impl_.arrayReadInt(KFLAGS.flags,_pregnancyTypeFlag) & 0xFFFF;
      }
      
      public function get_isPregnant() : Boolean
      {
         return get_type() != 0;
      }
      
      public function get_incubation() : int
      {
         return FlagDict_Impl_.arrayReadInt(KFLAGS.flags,_pregnancyIncubationFlag);
      }
      
      public function get_event() : int
      {
         var _loc6_:int = 0;
         if(get_type() == 0)
         {
            return 0;
         }
         var _loc1_:IMap = _pregnancyEventValue;
         var _loc2_:int = get_type();
         var _loc3_:Array = _loc1_.h[_loc2_];
         if(_loc3_ == null)
         {
            return 1;
         }
         var _loc4_:int = 0;
         var _loc5_:int = int(_loc3_.length);
         while(_loc4_ < _loc5_)
         {
            _loc6_ = _loc4_++;
            if(get_incubation() > int(_loc3_[_loc6_]))
            {
               return _loc6_ + 1;
            }
         }
         return int(_loc3_.length) + 1;
      }
      
      public function eventTriggered() : int
      {
         var _loc1_:int = get_event();
         var _loc2_:int = FlagDict_Impl_.arrayReadInt(KFLAGS.flags,_pregnancyTypeFlag) & 0x7FFF0000;
         var _loc3_:int = _loc1_ * 65536;
         if(_loc3_ == _loc2_)
         {
            return 0;
         }
         FlagDict_Impl_.arrayWriteInt(KFLAGS.flags,_pregnancyTypeFlag,get_type() + _loc3_);
         return _loc1_;
      }
      
      public function addPregnancyEventSet(param1:int, param2:Array) : void
      {
         _pregnancyEventValue.h[param1] = param2;
      }
   }
}

