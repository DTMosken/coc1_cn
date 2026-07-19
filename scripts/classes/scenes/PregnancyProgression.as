package classes.scenes
{
   import classes.DynStat;
   import classes.PerkLib;
   import classes.Player;
   import classes.StatusEffects;
   import classes._FlagDict.FlagDict_Impl_;
   import classes.globalFlags.KFLAGS;
   import classes.globalFlags.KGAMECLASS;
   import haxe.IMap;
   
   public class PregnancyProgression
   {
      
      public static var init__:Boolean;
      
      public static var vaginalPregnancyScenes:IMap;
      
      public static var analPregnancyScenes:IMap;
      
      public function PregnancyProgression()
      {
      }
      
      public static function registerVaginalPregnancyScene(param1:int, param2:int, param3:VaginalPregnancy) : Boolean
      {
         if(param1 != 25)
         {
            throw new ArgumentError("Currently only the player is supported as mother");
         }
         var _loc4_:Boolean = param2 in PregnancyProgression.vaginalPregnancyScenes.h;
         PregnancyProgression.vaginalPregnancyScenes.h[param2] = param3;
         return _loc4_;
      }
      
      public static function registerAnalPregnancyScene(param1:int, param2:int, param3:AnalPregnancy) : Boolean
      {
         if(param1 != 25)
         {
            throw new ArgumentError("Currently only the player is supported as mother");
         }
         var _loc4_:Boolean = param2 in PregnancyProgression.analPregnancyScenes.h;
         PregnancyProgression.analPregnancyScenes.h[param2] = param3;
         return _loc4_;
      }
      
      public static function updatePregnancy(param1:Player) : Boolean
      {
         var _loc2_:Boolean = false;
         if(param1.get_pregnancyIncubation() <= 0 && param1.get_buttPregnancyIncubation() <= 0 || param1.get_pregnancyType() == 0 && param1.get_buttPregnancyType() == 0)
         {
            return false;
         }
         _loc2_ = PregnancyProgression.cancelHeat(param1);
         if(param1.get_pregnancyIncubation() > 0 && param1.get_pregnancyIncubation() < 2)
         {
            param1.knockUpForce(param1.get_pregnancyType(),1);
         }
         if(param1.get_pregnancyIncubation() > 1)
         {
            _loc2_ ||= PregnancyProgression.updateVaginalPregnancy(param1);
         }
         if(param1.get_buttPregnancyIncubation() > 1)
         {
            _loc2_ ||= PregnancyProgression.updateAnalPregnancy(param1);
         }
         PregnancyProgression.amilyPregnancyFailsafe(param1);
         if(param1.get_pregnancyIncubation() == 1)
         {
            _loc2_ ||= PregnancyProgression.updateVaginalBirth(param1);
         }
         if(param1.get_buttPregnancyIncubation() == 1)
         {
            _loc2_ ||= PregnancyProgression.updateAnalBirth(param1);
         }
         return _loc2_;
      }
      
      public static function cancelHeat(param1:Player) : Boolean
      {
         if(param1.get_inHeat())
         {
            KGAMECLASS.kGAMECLASS.outputText("[pg]你冷静了一点，意识到你不再幻想一直被操了。看来你的发情期已经结束了。[pg]");
            param1.dynStats(DynStat.Lib(-param1.statusEffectv2(StatusEffects.Heat)));
            if(param1.lib < 10)
            {
               param1.lib = 10;
            }
            KGAMECLASS.kGAMECLASS.output.statScreenRefresh();
            param1.removeStatusEffect(StatusEffects.Heat);
            return true;
         }
         return false;
      }
      
      public static function updateVaginalPregnancy(param1:Player) : Boolean
      {
         var _loc2_:int = param1.get_pregnancyType();
         var _loc3_:VaginalPregnancy = PregnancyProgression.vaginalPregnancyScenes.h[_loc2_];
         var _loc4_:Object = _loc3_ != null ? _loc3_.updateVaginalPregnancy() : null;
         if(_loc4_ != null)
         {
            return _loc4_;
         }
         return false;
      }
      
      public static function updateAnalPregnancy(param1:Player) : Boolean
      {
         var _loc2_:int = param1.get_buttPregnancyType();
         var _loc3_:AnalPregnancy = PregnancyProgression.analPregnancyScenes.h[_loc2_];
         var _loc4_:Object = _loc3_ != null ? _loc3_.updateAnalPregnancy() : null;
         if(_loc4_ != null)
         {
            return _loc4_;
         }
         return false;
      }
      
      public static function amilyPregnancyFailsafe(param1:Player) : void
      {
         if(param1.get_pregnancyIncubation() == 1 && param1.get_pregnancyType() == 11)
         {
            if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,43) == 2 || FlagDict_Impl_.arrayReadInt(KFLAGS.flags,170) > 0)
            {
               param1.knockUpForce(4,param1.get_pregnancyIncubation());
            }
         }
         if(param1.get_pregnancyIncubation() == 1 && param1.get_pregnancyType() == 11)
         {
            if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,346) == 1 || FlagDict_Impl_.arrayReadInt(KFLAGS.flags,346) == 2)
            {
               param1.knockUpForce(4,param1.get_pregnancyIncubation());
            }
         }
      }
      
      public static function updateVaginalBirth(param1:Player) : Boolean
      {
         var _loc4_:int = 0;
         var _loc2_:int = param1.get_pregnancyType();
         var _loc3_:Boolean = _loc2_ in PregnancyProgression.vaginalPregnancyScenes.h;
         if(_loc3_)
         {
            _loc4_ = param1.get_pregnancyType();
            PregnancyProgression.vaginalPregnancyScenes.h[_loc4_].vaginalBirth();
            if(param1.get_pregnancyType() != 18)
            {
               PregnancyProgression.giveBirth(param1);
            }
         }
         if(param1.get_pregnancyType() == 18 && param1.get_pregnancyIncubation() == 3)
         {
            return false;
         }
         param1.knockUpForce();
         return true;
      }
      
      public static function giveBirth(param1:Player) : void
      {
         if(param1.fertility < 15)
         {
            param1.fertility += 1;
         }
         if(param1.fertility < 25)
         {
            param1.fertility += 1;
         }
         if(param1.fertility < 40)
         {
            param1.fertility += 1;
         }
         if(!param1.hasStatusEffect(StatusEffects.Birthed))
         {
            param1.createStatusEffect(StatusEffects.Birthed,1,0,0,0);
         }
         else
         {
            param1.addStatusValue(StatusEffects.Birthed,1,1);
            if(!param1.hasPerk(PerkLib.BroodMother) && param1.statusEffectv1(StatusEffects.Birthed) >= 10)
            {
               KGAMECLASS.kGAMECLASS.output.text("\n<b>你获得了育母特质</b>（怀孕速度是正常女性的两倍）。\n");
               param1.createPerk(PerkLib.BroodMother,0,0,0,0);
            }
         }
      }
      
      public static function updateAnalBirth(param1:Player) : Boolean
      {
         var _loc2_:int = param1.get_buttPregnancyType();
         var _loc3_:Boolean = _loc2_ in PregnancyProgression.analPregnancyScenes.h;
         if(_loc3_)
         {
            PregnancyProgression.analPregnancyScenes.h[_loc2_].analBirth();
         }
         param1.buttKnockUpForce();
         return _loc3_;
      }
   }
}

