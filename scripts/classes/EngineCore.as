package classes
{
   import classes._FlagDict.FlagDict_Impl_;
   import classes.globalFlags.KFLAGS;
   import classes.globalFlags.KGAMECLASS;
   import haxe.IMap;
   import haxe.ds.IntMap;
   
   public class EngineCore
   {
      
      public function EngineCore()
      {
      }
      
      public static function get_achievements() : IMap
      {
         return KGAMECLASS.kGAMECLASS.achievements;
      }
      
      public static function get_player() : Player
      {
         return KGAMECLASS.kGAMECLASS.player;
      }
      
      public static function get_flags() : IMap
      {
         return KFLAGS.flags;
      }
      
      public static function outputText(param1:String) : void
      {
         KGAMECLASS.kGAMECLASS.outputText(param1);
      }
      
      public static function awardAchievement(param1:String, param2:int, param3:Boolean = true, param4:Boolean = false, param5:Boolean = true) : void
      {
         if(!EngineCore.get_achievements().h[param2])
         {
            EngineCore.get_achievements().h[param2] = true;
            if(param3)
            {
               if(param4)
               {
                  EngineCore.outputText("[pg]");
               }
               EngineCore.outputText("<font color=\"#000080\"><b>解锁成就：" + param1 + "</b></font>");
               if(param5)
               {
                  EngineCore.outputText("[pg]");
               }
            }
            KGAMECLASS.kGAMECLASS.saves.savePermObject();
         }
      }
      
      public static function unlockCodexEntry(param1:int, param2:Boolean = true, param3:Boolean = false) : void
      {
         var _loc5_:* = null as String;
         var _loc4_:IMap = KGAMECLASS.kGAMECLASS.camp.codex.allEntries;
         if(param1 in _loc4_.h)
         {
            if(FlagDict_Impl_.arrayReadInt(EngineCore.get_flags(),param1) <= 0)
            {
               _loc5_ = KGAMECLASS.kGAMECLASS.camp.codex.allEntries.h[param1].name;
               FlagDict_Impl_.arrayWriteInt(EngineCore.get_flags(),param1,1);
               EngineCore.outputText((param2 ? "[pg]" : "") + "[b: 解锁新图鉴条目：" + _loc5_ + "!]" + (param3 ? "[pg]" : ""));
            }
         }
      }
   }
}

