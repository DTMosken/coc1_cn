package classes.scenes.npcs.pregnancies
{
   import classes.DynStat;
   import classes.Player;
   import classes.Vagina;
   import classes._FlagDict.FlagDict_Impl_;
   import classes.globalFlags.KFLAGS;
   import classes.globalFlags.KGAMECLASS;
   import classes.internals.GuiOutput;
   import classes.internals.PregnancyUtils;
   import classes.scenes.PregnancyProgression;
   import classes.scenes.VaginalPregnancy;
   import flash.Boot;
   
   public class PlayerAmilyPregnancy implements VaginalPregnancy
   {
      
      public var output:GuiOutput;
      
      public function PlayerAmilyPregnancy(param1:GuiOutput = undefined)
      {
         if(Boot.skip_constructor)
         {
            return;
         }
         output = param1;
         PregnancyProgression.registerVaginalPregnancyScene(25,11,this);
      }
      
      public function vaginalBirth() : void
      {
         var _loc1_:Player = KGAMECLASS.kGAMECLASS.player;
         _loc1_.boostLactation(0.01);
         PregnancyUtils.createVaginaIfMissing(output,_loc1_);
         KGAMECLASS.kGAMECLASS.amilyScene.pcBirthsAmilysKidsQuestVersion();
         _loc1_.cuntChange(60,true,true,false);
         if(_loc1_.vaginas[0].vaginalWetness == 0)
         {
            _temp_1.vaginalWetness += 1;
         }
         _loc1_.orgasm("Vaginal");
         if(int([DynStat.Str(-1),DynStat.Tou(-2),DynStat.Spe(3),DynStat.Lib(1),DynStat.Sens(0.5)].length) == 0)
         {
            KGAMECLASS.kGAMECLASS.player.dynStats();
         }
         else if(int([DynStat.Str(-1),DynStat.Tou(-2),DynStat.Spe(3),DynStat.Lib(1),DynStat.Sens(0.5)].length) == 1)
         {
            KGAMECLASS.kGAMECLASS.player.dynStats([DynStat.Str(-1),DynStat.Tou(-2),DynStat.Spe(3),DynStat.Lib(1),DynStat.Sens(0.5)][0]);
         }
         else if(int([DynStat.Str(-1),DynStat.Tou(-2),DynStat.Spe(3),DynStat.Lib(1),DynStat.Sens(0.5)].length) == 2)
         {
            KGAMECLASS.kGAMECLASS.player.dynStats([DynStat.Str(-1),DynStat.Tou(-2),DynStat.Spe(3),DynStat.Lib(1),DynStat.Sens(0.5)][0],[DynStat.Str(-1),DynStat.Tou(-2),DynStat.Spe(3),DynStat.Lib(1),DynStat.Sens(0.5)][1]);
         }
         else if(int([DynStat.Str(-1),DynStat.Tou(-2),DynStat.Spe(3),DynStat.Lib(1),DynStat.Sens(0.5)].length) == 3)
         {
            KGAMECLASS.kGAMECLASS.player.dynStats([DynStat.Str(-1),DynStat.Tou(-2),DynStat.Spe(3),DynStat.Lib(1),DynStat.Sens(0.5)][0],[DynStat.Str(-1),DynStat.Tou(-2),DynStat.Spe(3),DynStat.Lib(1),DynStat.Sens(0.5)][1],[DynStat.Str(-1),DynStat.Tou(-2),DynStat.Spe(3),DynStat.Lib(1),DynStat.Sens(0.5)][2]);
         }
         else if(int([DynStat.Str(-1),DynStat.Tou(-2),DynStat.Spe(3),DynStat.Lib(1),DynStat.Sens(0.5)].length) == 4)
         {
            KGAMECLASS.kGAMECLASS.player.dynStats([DynStat.Str(-1),DynStat.Tou(-2),DynStat.Spe(3),DynStat.Lib(1),DynStat.Sens(0.5)][0],[DynStat.Str(-1),DynStat.Tou(-2),DynStat.Spe(3),DynStat.Lib(1),DynStat.Sens(0.5)][1],[DynStat.Str(-1),DynStat.Tou(-2),DynStat.Spe(3),DynStat.Lib(1),DynStat.Sens(0.5)][2],[DynStat.Str(-1),DynStat.Tou(-2),DynStat.Spe(3),DynStat.Lib(1),DynStat.Sens(0.5)][3]);
         }
         else if(int([DynStat.Str(-1),DynStat.Tou(-2),DynStat.Spe(3),DynStat.Lib(1),DynStat.Sens(0.5)].length) == 5)
         {
            KGAMECLASS.kGAMECLASS.player.dynStats([DynStat.Str(-1),DynStat.Tou(-2),DynStat.Spe(3),DynStat.Lib(1),DynStat.Sens(0.5)][0],[DynStat.Str(-1),DynStat.Tou(-2),DynStat.Spe(3),DynStat.Lib(1),DynStat.Sens(0.5)][1],[DynStat.Str(-1),DynStat.Tou(-2),DynStat.Spe(3),DynStat.Lib(1),DynStat.Sens(0.5)][2],[DynStat.Str(-1),DynStat.Tou(-2),DynStat.Spe(3),DynStat.Lib(1),DynStat.Sens(0.5)][3],[DynStat.Str(-1),DynStat.Tou(-2),DynStat.Spe(3),DynStat.Lib(1),DynStat.Sens(0.5)][4]);
         }
         else if(int([DynStat.Str(-1),DynStat.Tou(-2),DynStat.Spe(3),DynStat.Lib(1),DynStat.Sens(0.5)].length) == 6)
         {
            KGAMECLASS.kGAMECLASS.player.dynStats([DynStat.Str(-1),DynStat.Tou(-2),DynStat.Spe(3),DynStat.Lib(1),DynStat.Sens(0.5)][0],[DynStat.Str(-1),DynStat.Tou(-2),DynStat.Spe(3),DynStat.Lib(1),DynStat.Sens(0.5)][1],[DynStat.Str(-1),DynStat.Tou(-2),DynStat.Spe(3),DynStat.Lib(1),DynStat.Sens(0.5)][2],[DynStat.Str(-1),DynStat.Tou(-2),DynStat.Spe(3),DynStat.Lib(1),DynStat.Sens(0.5)][3],[DynStat.Str(-1),DynStat.Tou(-2),DynStat.Spe(3),DynStat.Lib(1),DynStat.Sens(0.5)][4],[DynStat.Str(-1),DynStat.Tou(-2),DynStat.Spe(3),DynStat.Lib(1),DynStat.Sens(0.5)][5]);
         }
         else if(int([DynStat.Str(-1),DynStat.Tou(-2),DynStat.Spe(3),DynStat.Lib(1),DynStat.Sens(0.5)].length) == 7)
         {
            KGAMECLASS.kGAMECLASS.player.dynStats([DynStat.Str(-1),DynStat.Tou(-2),DynStat.Spe(3),DynStat.Lib(1),DynStat.Sens(0.5)][0],[DynStat.Str(-1),DynStat.Tou(-2),DynStat.Spe(3),DynStat.Lib(1),DynStat.Sens(0.5)][1],[DynStat.Str(-1),DynStat.Tou(-2),DynStat.Spe(3),DynStat.Lib(1),DynStat.Sens(0.5)][2],[DynStat.Str(-1),DynStat.Tou(-2),DynStat.Spe(3),DynStat.Lib(1),DynStat.Sens(0.5)][3],[DynStat.Str(-1),DynStat.Tou(-2),DynStat.Spe(3),DynStat.Lib(1),DynStat.Sens(0.5)][4],[DynStat.Str(-1),DynStat.Tou(-2),DynStat.Spe(3),DynStat.Lib(1),DynStat.Sens(0.5)][5],[DynStat.Str(-1),DynStat.Tou(-2),DynStat.Spe(3),DynStat.Lib(1),DynStat.Sens(0.5)][6]);
         }
         else if(int([DynStat.Str(-1),DynStat.Tou(-2),DynStat.Spe(3),DynStat.Lib(1),DynStat.Sens(0.5)].length) == 8)
         {
            KGAMECLASS.kGAMECLASS.player.dynStats([DynStat.Str(-1),DynStat.Tou(-2),DynStat.Spe(3),DynStat.Lib(1),DynStat.Sens(0.5)][0],[DynStat.Str(-1),DynStat.Tou(-2),DynStat.Spe(3),DynStat.Lib(1),DynStat.Sens(0.5)][1],[DynStat.Str(-1),DynStat.Tou(-2),DynStat.Spe(3),DynStat.Lib(1),DynStat.Sens(0.5)][2],[DynStat.Str(-1),DynStat.Tou(-2),DynStat.Spe(3),DynStat.Lib(1),DynStat.Sens(0.5)][3],[DynStat.Str(-1),DynStat.Tou(-2),DynStat.Spe(3),DynStat.Lib(1),DynStat.Sens(0.5)][4],[DynStat.Str(-1),DynStat.Tou(-2),DynStat.Spe(3),DynStat.Lib(1),DynStat.Sens(0.5)][5],[DynStat.Str(-1),DynStat.Tou(-2),DynStat.Spe(3),DynStat.Lib(1),DynStat.Sens(0.5)][6],[DynStat.Str(-1),DynStat.Tou(-2),DynStat.Spe(3),DynStat.Lib(1),DynStat.Sens(0.5)][7]);
         }
         else if(int([DynStat.Str(-1),DynStat.Tou(-2),DynStat.Spe(3),DynStat.Lib(1),DynStat.Sens(0.5)].length) == 9)
         {
            KGAMECLASS.kGAMECLASS.player.dynStats([DynStat.Str(-1),DynStat.Tou(-2),DynStat.Spe(3),DynStat.Lib(1),DynStat.Sens(0.5)][0],[DynStat.Str(-1),DynStat.Tou(-2),DynStat.Spe(3),DynStat.Lib(1),DynStat.Sens(0.5)][1],[DynStat.Str(-1),DynStat.Tou(-2),DynStat.Spe(3),DynStat.Lib(1),DynStat.Sens(0.5)][2],[DynStat.Str(-1),DynStat.Tou(-2),DynStat.Spe(3),DynStat.Lib(1),DynStat.Sens(0.5)][3],[DynStat.Str(-1),DynStat.Tou(-2),DynStat.Spe(3),DynStat.Lib(1),DynStat.Sens(0.5)][4],[DynStat.Str(-1),DynStat.Tou(-2),DynStat.Spe(3),DynStat.Lib(1),DynStat.Sens(0.5)][5],[DynStat.Str(-1),DynStat.Tou(-2),DynStat.Spe(3),DynStat.Lib(1),DynStat.Sens(0.5)][6],[DynStat.Str(-1),DynStat.Tou(-2),DynStat.Spe(3),DynStat.Lib(1),DynStat.Sens(0.5)][7],[DynStat.Str(-1),DynStat.Tou(-2),DynStat.Spe(3),DynStat.Lib(1),DynStat.Sens(0.5)][8]);
         }
         else if(int([DynStat.Str(-1),DynStat.Tou(-2),DynStat.Spe(3),DynStat.Lib(1),DynStat.Sens(0.5)].length) == 10)
         {
            KGAMECLASS.kGAMECLASS.player.dynStats([DynStat.Str(-1),DynStat.Tou(-2),DynStat.Spe(3),DynStat.Lib(1),DynStat.Sens(0.5)][0],[DynStat.Str(-1),DynStat.Tou(-2),DynStat.Spe(3),DynStat.Lib(1),DynStat.Sens(0.5)][1],[DynStat.Str(-1),DynStat.Tou(-2),DynStat.Spe(3),DynStat.Lib(1),DynStat.Sens(0.5)][2],[DynStat.Str(-1),DynStat.Tou(-2),DynStat.Spe(3),DynStat.Lib(1),DynStat.Sens(0.5)][3],[DynStat.Str(-1),DynStat.Tou(-2),DynStat.Spe(3),DynStat.Lib(1),DynStat.Sens(0.5)][4],[DynStat.Str(-1),DynStat.Tou(-2),DynStat.Spe(3),DynStat.Lib(1),DynStat.Sens(0.5)][5],[DynStat.Str(-1),DynStat.Tou(-2),DynStat.Spe(3),DynStat.Lib(1),DynStat.Sens(0.5)][6],[DynStat.Str(-1),DynStat.Tou(-2),DynStat.Spe(3),DynStat.Lib(1),DynStat.Sens(0.5)][7],[DynStat.Str(-1),DynStat.Tou(-2),DynStat.Spe(3),DynStat.Lib(1),DynStat.Sens(0.5)][8],[DynStat.Str(-1),DynStat.Tou(-2),DynStat.Spe(3),DynStat.Lib(1),DynStat.Sens(0.5)][9]);
         }
         else if(int([DynStat.Str(-1),DynStat.Tou(-2),DynStat.Spe(3),DynStat.Lib(1),DynStat.Sens(0.5)].length) == 11)
         {
            KGAMECLASS.kGAMECLASS.player.dynStats([DynStat.Str(-1),DynStat.Tou(-2),DynStat.Spe(3),DynStat.Lib(1),DynStat.Sens(0.5)][0],[DynStat.Str(-1),DynStat.Tou(-2),DynStat.Spe(3),DynStat.Lib(1),DynStat.Sens(0.5)][1],[DynStat.Str(-1),DynStat.Tou(-2),DynStat.Spe(3),DynStat.Lib(1),DynStat.Sens(0.5)][2],[DynStat.Str(-1),DynStat.Tou(-2),DynStat.Spe(3),DynStat.Lib(1),DynStat.Sens(0.5)][3],[DynStat.Str(-1),DynStat.Tou(-2),DynStat.Spe(3),DynStat.Lib(1),DynStat.Sens(0.5)][4],[DynStat.Str(-1),DynStat.Tou(-2),DynStat.Spe(3),DynStat.Lib(1),DynStat.Sens(0.5)][5],[DynStat.Str(-1),DynStat.Tou(-2),DynStat.Spe(3),DynStat.Lib(1),DynStat.Sens(0.5)][6],[DynStat.Str(-1),DynStat.Tou(-2),DynStat.Spe(3),DynStat.Lib(1),DynStat.Sens(0.5)][7],[DynStat.Str(-1),DynStat.Tou(-2),DynStat.Spe(3),DynStat.Lib(1),DynStat.Sens(0.5)][8],[DynStat.Str(-1),DynStat.Tou(-2),DynStat.Spe(3),DynStat.Lib(1),DynStat.Sens(0.5)][9],[DynStat.Str(-1),DynStat.Tou(-2),DynStat.Spe(3),DynStat.Lib(1),DynStat.Sens(0.5)][10]);
         }
         else if(int([DynStat.Str(-1),DynStat.Tou(-2),DynStat.Spe(3),DynStat.Lib(1),DynStat.Sens(0.5)].length) == 12)
         {
            KGAMECLASS.kGAMECLASS.player.dynStats([DynStat.Str(-1),DynStat.Tou(-2),DynStat.Spe(3),DynStat.Lib(1),DynStat.Sens(0.5)][0],[DynStat.Str(-1),DynStat.Tou(-2),DynStat.Spe(3),DynStat.Lib(1),DynStat.Sens(0.5)][1],[DynStat.Str(-1),DynStat.Tou(-2),DynStat.Spe(3),DynStat.Lib(1),DynStat.Sens(0.5)][2],[DynStat.Str(-1),DynStat.Tou(-2),DynStat.Spe(3),DynStat.Lib(1),DynStat.Sens(0.5)][3],[DynStat.Str(-1),DynStat.Tou(-2),DynStat.Spe(3),DynStat.Lib(1),DynStat.Sens(0.5)][4],[DynStat.Str(-1),DynStat.Tou(-2),DynStat.Spe(3),DynStat.Lib(1),DynStat.Sens(0.5)][5],[DynStat.Str(-1),DynStat.Tou(-2),DynStat.Spe(3),DynStat.Lib(1),DynStat.Sens(0.5)][6],[DynStat.Str(-1),DynStat.Tou(-2),DynStat.Spe(3),DynStat.Lib(1),DynStat.Sens(0.5)][7],[DynStat.Str(-1),DynStat.Tou(-2),DynStat.Spe(3),DynStat.Lib(1),DynStat.Sens(0.5)][8],[DynStat.Str(-1),DynStat.Tou(-2),DynStat.Spe(3),DynStat.Lib(1),DynStat.Sens(0.5)][9],[DynStat.Str(-1),DynStat.Tou(-2),DynStat.Spe(3),DynStat.Lib(1),DynStat.Sens(0.5)][10],[DynStat.Str(-1),DynStat.Tou(-2)
            ,DynStat.Spe(3),DynStat.Lib(1),DynStat.Sens(0.5)][11]);
         }
         else if(int([DynStat.Str(-1),DynStat.Tou(-2),DynStat.Spe(3),DynStat.Lib(1),DynStat.Sens(0.5)].length) == 13)
         {
            KGAMECLASS.kGAMECLASS.player.dynStats([DynStat.Str(-1),DynStat.Tou(-2),DynStat.Spe(3),DynStat.Lib(1),DynStat.Sens(0.5)][0],[DynStat.Str(-1),DynStat.Tou(-2),DynStat.Spe(3),DynStat.Lib(1),DynStat.Sens(0.5)][1],[DynStat.Str(-1),DynStat.Tou(-2),DynStat.Spe(3),DynStat.Lib(1),DynStat.Sens(0.5)][2],[DynStat.Str(-1),DynStat.Tou(-2),DynStat.Spe(3),DynStat.Lib(1),DynStat.Sens(0.5)][3],[DynStat.Str(-1),DynStat.Tou(-2),DynStat.Spe(3),DynStat.Lib(1),DynStat.Sens(0.5)][4],[DynStat.Str(-1),DynStat.Tou(-2),DynStat.Spe(3),DynStat.Lib(1),DynStat.Sens(0.5)][5],[DynStat.Str(-1),DynStat.Tou(-2),DynStat.Spe(3),DynStat.Lib(1),DynStat.Sens(0.5)][6],[DynStat.Str(-1),DynStat.Tou(-2),DynStat.Spe(3),DynStat.Lib(1),DynStat.Sens(0.5)][7],[DynStat.Str(-1),DynStat.Tou(-2),DynStat.Spe(3),DynStat.Lib(1),DynStat.Sens(0.5)][8],[DynStat.Str(-1),DynStat.Tou(-2),DynStat.Spe(3),DynStat.Lib(1),DynStat.Sens(0.5)][9],[DynStat.Str(-1),DynStat.Tou(-2),DynStat.Spe(3),DynStat.Lib(1),DynStat.Sens(0.5)][10],[DynStat.Str(-1),DynStat.Tou(-2)
            ,DynStat.Spe(3),DynStat.Lib(1),DynStat.Sens(0.5)][11],[DynStat.Str(-1),DynStat.Tou(-2),DynStat.Spe(3),DynStat.Lib(1),DynStat.Sens(0.5)][12]);
         }
         else if(int([DynStat.Str(-1),DynStat.Tou(-2),DynStat.Spe(3),DynStat.Lib(1),DynStat.Sens(0.5)].length) == 14)
         {
            KGAMECLASS.kGAMECLASS.player.dynStats([DynStat.Str(-1),DynStat.Tou(-2),DynStat.Spe(3),DynStat.Lib(1),DynStat.Sens(0.5)][0],[DynStat.Str(-1),DynStat.Tou(-2),DynStat.Spe(3),DynStat.Lib(1),DynStat.Sens(0.5)][1],[DynStat.Str(-1),DynStat.Tou(-2),DynStat.Spe(3),DynStat.Lib(1),DynStat.Sens(0.5)][2],[DynStat.Str(-1),DynStat.Tou(-2),DynStat.Spe(3),DynStat.Lib(1),DynStat.Sens(0.5)][3],[DynStat.Str(-1),DynStat.Tou(-2),DynStat.Spe(3),DynStat.Lib(1),DynStat.Sens(0.5)][4],[DynStat.Str(-1),DynStat.Tou(-2),DynStat.Spe(3),DynStat.Lib(1),DynStat.Sens(0.5)][5],[DynStat.Str(-1),DynStat.Tou(-2),DynStat.Spe(3),DynStat.Lib(1),DynStat.Sens(0.5)][6],[DynStat.Str(-1),DynStat.Tou(-2),DynStat.Spe(3),DynStat.Lib(1),DynStat.Sens(0.5)][7],[DynStat.Str(-1),DynStat.Tou(-2),DynStat.Spe(3),DynStat.Lib(1),DynStat.Sens(0.5)][8],[DynStat.Str(-1),DynStat.Tou(-2),DynStat.Spe(3),DynStat.Lib(1),DynStat.Sens(0.5)][9],[DynStat.Str(-1),DynStat.Tou(-2),DynStat.Spe(3),DynStat.Lib(1),DynStat.Sens(0.5)][10],[DynStat.Str(-1),DynStat.Tou(-2)
            ,DynStat.Spe(3),DynStat.Lib(1),DynStat.Sens(0.5)][11],[DynStat.Str(-1),DynStat.Tou(-2),DynStat.Spe(3),DynStat.Lib(1),DynStat.Sens(0.5)][12],[DynStat.Str(-1),DynStat.Tou(-2),DynStat.Spe(3),DynStat.Lib(1),DynStat.Sens(0.5)][13]);
         }
         else if(int([DynStat.Str(-1),DynStat.Tou(-2),DynStat.Spe(3),DynStat.Lib(1),DynStat.Sens(0.5)].length) == 15)
         {
            KGAMECLASS.kGAMECLASS.player.dynStats([DynStat.Str(-1),DynStat.Tou(-2),DynStat.Spe(3),DynStat.Lib(1),DynStat.Sens(0.5)][0],[DynStat.Str(-1),DynStat.Tou(-2),DynStat.Spe(3),DynStat.Lib(1),DynStat.Sens(0.5)][1],[DynStat.Str(-1),DynStat.Tou(-2),DynStat.Spe(3),DynStat.Lib(1),DynStat.Sens(0.5)][2],[DynStat.Str(-1),DynStat.Tou(-2),DynStat.Spe(3),DynStat.Lib(1),DynStat.Sens(0.5)][3],[DynStat.Str(-1),DynStat.Tou(-2),DynStat.Spe(3),DynStat.Lib(1),DynStat.Sens(0.5)][4],[DynStat.Str(-1),DynStat.Tou(-2),DynStat.Spe(3),DynStat.Lib(1),DynStat.Sens(0.5)][5],[DynStat.Str(-1),DynStat.Tou(-2),DynStat.Spe(3),DynStat.Lib(1),DynStat.Sens(0.5)][6],[DynStat.Str(-1),DynStat.Tou(-2),DynStat.Spe(3),DynStat.Lib(1),DynStat.Sens(0.5)][7],[DynStat.Str(-1),DynStat.Tou(-2),DynStat.Spe(3),DynStat.Lib(1),DynStat.Sens(0.5)][8],[DynStat.Str(-1),DynStat.Tou(-2),DynStat.Spe(3),DynStat.Lib(1),DynStat.Sens(0.5)][9],[DynStat.Str(-1),DynStat.Tou(-2),DynStat.Spe(3),DynStat.Lib(1),DynStat.Sens(0.5)][10],[DynStat.Str(-1),DynStat.Tou(-2)
            ,DynStat.Spe(3),DynStat.Lib(1),DynStat.Sens(0.5)][11],[DynStat.Str(-1),DynStat.Tou(-2),DynStat.Spe(3),DynStat.Lib(1),DynStat.Sens(0.5)][12],[DynStat.Str(-1),DynStat.Tou(-2),DynStat.Spe(3),DynStat.Lib(1),DynStat.Sens(0.5)][13],[DynStat.Str(-1),DynStat.Tou(-2),DynStat.Spe(3),DynStat.Lib(1),DynStat.Sens(0.5)][14]);
         }
         else if(int([DynStat.Str(-1),DynStat.Tou(-2),DynStat.Spe(3),DynStat.Lib(1),DynStat.Sens(0.5)].length) == 16)
         {
            KGAMECLASS.kGAMECLASS.player.dynStats([DynStat.Str(-1),DynStat.Tou(-2),DynStat.Spe(3),DynStat.Lib(1),DynStat.Sens(0.5)][0],[DynStat.Str(-1),DynStat.Tou(-2),DynStat.Spe(3),DynStat.Lib(1),DynStat.Sens(0.5)][1],[DynStat.Str(-1),DynStat.Tou(-2),DynStat.Spe(3),DynStat.Lib(1),DynStat.Sens(0.5)][2],[DynStat.Str(-1),DynStat.Tou(-2),DynStat.Spe(3),DynStat.Lib(1),DynStat.Sens(0.5)][3],[DynStat.Str(-1),DynStat.Tou(-2),DynStat.Spe(3),DynStat.Lib(1),DynStat.Sens(0.5)][4],[DynStat.Str(-1),DynStat.Tou(-2),DynStat.Spe(3),DynStat.Lib(1),DynStat.Sens(0.5)][5],[DynStat.Str(-1),DynStat.Tou(-2),DynStat.Spe(3),DynStat.Lib(1),DynStat.Sens(0.5)][6],[DynStat.Str(-1),DynStat.Tou(-2),DynStat.Spe(3),DynStat.Lib(1),DynStat.Sens(0.5)][7],[DynStat.Str(-1),DynStat.Tou(-2),DynStat.Spe(3),DynStat.Lib(1),DynStat.Sens(0.5)][8],[DynStat.Str(-1),DynStat.Tou(-2),DynStat.Spe(3),DynStat.Lib(1),DynStat.Sens(0.5)][9],[DynStat.Str(-1),DynStat.Tou(-2),DynStat.Spe(3),DynStat.Lib(1),DynStat.Sens(0.5)][10],[DynStat.Str(-1),DynStat.Tou(-2)
            ,DynStat.Spe(3),DynStat.Lib(1),DynStat.Sens(0.5)][11],[DynStat.Str(-1),DynStat.Tou(-2),DynStat.Spe(3),DynStat.Lib(1),DynStat.Sens(0.5)][12],[DynStat.Str(-1),DynStat.Tou(-2),DynStat.Spe(3),DynStat.Lib(1),DynStat.Sens(0.5)][13],[DynStat.Str(-1),DynStat.Tou(-2),DynStat.Spe(3),DynStat.Lib(1),DynStat.Sens(0.5)][14],[DynStat.Str(-1),DynStat.Tou(-2),DynStat.Spe(3),DynStat.Lib(1),DynStat.Sens(0.5)][15]);
         }
         else if(int([DynStat.Str(-1),DynStat.Tou(-2),DynStat.Spe(3),DynStat.Lib(1),DynStat.Sens(0.5)].length) == 17)
         {
            KGAMECLASS.kGAMECLASS.player.dynStats([DynStat.Str(-1),DynStat.Tou(-2),DynStat.Spe(3),DynStat.Lib(1),DynStat.Sens(0.5)][0],[DynStat.Str(-1),DynStat.Tou(-2),DynStat.Spe(3),DynStat.Lib(1),DynStat.Sens(0.5)][1],[DynStat.Str(-1),DynStat.Tou(-2),DynStat.Spe(3),DynStat.Lib(1),DynStat.Sens(0.5)][2],[DynStat.Str(-1),DynStat.Tou(-2),DynStat.Spe(3),DynStat.Lib(1),DynStat.Sens(0.5)][3],[DynStat.Str(-1),DynStat.Tou(-2),DynStat.Spe(3),DynStat.Lib(1),DynStat.Sens(0.5)][4],[DynStat.Str(-1),DynStat.Tou(-2),DynStat.Spe(3),DynStat.Lib(1),DynStat.Sens(0.5)][5],[DynStat.Str(-1),DynStat.Tou(-2),DynStat.Spe(3),DynStat.Lib(1),DynStat.Sens(0.5)][6],[DynStat.Str(-1),DynStat.Tou(-2),DynStat.Spe(3),DynStat.Lib(1),DynStat.Sens(0.5)][7],[DynStat.Str(-1),DynStat.Tou(-2),DynStat.Spe(3),DynStat.Lib(1),DynStat.Sens(0.5)][8],[DynStat.Str(-1),DynStat.Tou(-2),DynStat.Spe(3),DynStat.Lib(1),DynStat.Sens(0.5)][9],[DynStat.Str(-1),DynStat.Tou(-2),DynStat.Spe(3),DynStat.Lib(1),DynStat.Sens(0.5)][10],[DynStat.Str(-1),DynStat.Tou(-2)
            ,DynStat.Spe(3),DynStat.Lib(1),DynStat.Sens(0.5)][11],[DynStat.Str(-1),DynStat.Tou(-2),DynStat.Spe(3),DynStat.Lib(1),DynStat.Sens(0.5)][12],[DynStat.Str(-1),DynStat.Tou(-2),DynStat.Spe(3),DynStat.Lib(1),DynStat.Sens(0.5)][13],[DynStat.Str(-1),DynStat.Tou(-2),DynStat.Spe(3),DynStat.Lib(1),DynStat.Sens(0.5)][14],[DynStat.Str(-1),DynStat.Tou(-2),DynStat.Spe(3),DynStat.Lib(1),DynStat.Sens(0.5)][15],[DynStat.Str(-1),DynStat.Tou(-2),DynStat.Spe(3),DynStat.Lib(1),DynStat.Sens(0.5)][16]);
         }
         else if(int([DynStat.Str(-1),DynStat.Tou(-2),DynStat.Spe(3),DynStat.Lib(1),DynStat.Sens(0.5)].length) == 18)
         {
            KGAMECLASS.kGAMECLASS.player.dynStats([DynStat.Str(-1),DynStat.Tou(-2),DynStat.Spe(3),DynStat.Lib(1),DynStat.Sens(0.5)][0],[DynStat.Str(-1),DynStat.Tou(-2),DynStat.Spe(3),DynStat.Lib(1),DynStat.Sens(0.5)][1],[DynStat.Str(-1),DynStat.Tou(-2),DynStat.Spe(3),DynStat.Lib(1),DynStat.Sens(0.5)][2],[DynStat.Str(-1),DynStat.Tou(-2),DynStat.Spe(3),DynStat.Lib(1),DynStat.Sens(0.5)][3],[DynStat.Str(-1),DynStat.Tou(-2),DynStat.Spe(3),DynStat.Lib(1),DynStat.Sens(0.5)][4],[DynStat.Str(-1),DynStat.Tou(-2),DynStat.Spe(3),DynStat.Lib(1),DynStat.Sens(0.5)][5],[DynStat.Str(-1),DynStat.Tou(-2),DynStat.Spe(3),DynStat.Lib(1),DynStat.Sens(0.5)][6],[DynStat.Str(-1),DynStat.Tou(-2),DynStat.Spe(3),DynStat.Lib(1),DynStat.Sens(0.5)][7],[DynStat.Str(-1),DynStat.Tou(-2),DynStat.Spe(3),DynStat.Lib(1),DynStat.Sens(0.5)][8],[DynStat.Str(-1),DynStat.Tou(-2),DynStat.Spe(3),DynStat.Lib(1),DynStat.Sens(0.5)][9],[DynStat.Str(-1),DynStat.Tou(-2),DynStat.Spe(3),DynStat.Lib(1),DynStat.Sens(0.5)][10],[DynStat.Str(-1),DynStat.Tou(-2)
            ,DynStat.Spe(3),DynStat.Lib(1),DynStat.Sens(0.5)][11],[DynStat.Str(-1),DynStat.Tou(-2),DynStat.Spe(3),DynStat.Lib(1),DynStat.Sens(0.5)][12],[DynStat.Str(-1),DynStat.Tou(-2),DynStat.Spe(3),DynStat.Lib(1),DynStat.Sens(0.5)][13],[DynStat.Str(-1),DynStat.Tou(-2),DynStat.Spe(3),DynStat.Lib(1),DynStat.Sens(0.5)][14],[DynStat.Str(-1),DynStat.Tou(-2),DynStat.Spe(3),DynStat.Lib(1),DynStat.Sens(0.5)][15],[DynStat.Str(-1),DynStat.Tou(-2),DynStat.Spe(3),DynStat.Lib(1),DynStat.Sens(0.5)][16],[DynStat.Str(-1),DynStat.Tou(-2),DynStat.Spe(3),DynStat.Lib(1),DynStat.Sens(0.5)][17]);
         }
         else if(int([DynStat.Str(-1),DynStat.Tou(-2),DynStat.Spe(3),DynStat.Lib(1),DynStat.Sens(0.5)].length) == 19)
         {
            KGAMECLASS.kGAMECLASS.player.dynStats([DynStat.Str(-1),DynStat.Tou(-2),DynStat.Spe(3),DynStat.Lib(1),DynStat.Sens(0.5)][0],[DynStat.Str(-1),DynStat.Tou(-2),DynStat.Spe(3),DynStat.Lib(1),DynStat.Sens(0.5)][1],[DynStat.Str(-1),DynStat.Tou(-2),DynStat.Spe(3),DynStat.Lib(1),DynStat.Sens(0.5)][2],[DynStat.Str(-1),DynStat.Tou(-2),DynStat.Spe(3),DynStat.Lib(1),DynStat.Sens(0.5)][3],[DynStat.Str(-1),DynStat.Tou(-2),DynStat.Spe(3),DynStat.Lib(1),DynStat.Sens(0.5)][4],[DynStat.Str(-1),DynStat.Tou(-2),DynStat.Spe(3),DynStat.Lib(1),DynStat.Sens(0.5)][5],[DynStat.Str(-1),DynStat.Tou(-2),DynStat.Spe(3),DynStat.Lib(1),DynStat.Sens(0.5)][6],[DynStat.Str(-1),DynStat.Tou(-2),DynStat.Spe(3),DynStat.Lib(1),DynStat.Sens(0.5)][7],[DynStat.Str(-1),DynStat.Tou(-2),DynStat.Spe(3),DynStat.Lib(1),DynStat.Sens(0.5)][8],[DynStat.Str(-1),DynStat.Tou(-2),DynStat.Spe(3),DynStat.Lib(1),DynStat.Sens(0.5)][9],[DynStat.Str(-1),DynStat.Tou(-2),DynStat.Spe(3),DynStat.Lib(1),DynStat.Sens(0.5)][10],[DynStat.Str(-1),DynStat.Tou(-2)
            ,DynStat.Spe(3),DynStat.Lib(1),DynStat.Sens(0.5)][11],[DynStat.Str(-1),DynStat.Tou(-2),DynStat.Spe(3),DynStat.Lib(1),DynStat.Sens(0.5)][12],[DynStat.Str(-1),DynStat.Tou(-2),DynStat.Spe(3),DynStat.Lib(1),DynStat.Sens(0.5)][13],[DynStat.Str(-1),DynStat.Tou(-2),DynStat.Spe(3),DynStat.Lib(1),DynStat.Sens(0.5)][14],[DynStat.Str(-1),DynStat.Tou(-2),DynStat.Spe(3),DynStat.Lib(1),DynStat.Sens(0.5)][15],[DynStat.Str(-1),DynStat.Tou(-2),DynStat.Spe(3),DynStat.Lib(1),DynStat.Sens(0.5)][16],[DynStat.Str(-1),DynStat.Tou(-2),DynStat.Spe(3),DynStat.Lib(1),DynStat.Sens(0.5)][17],[DynStat.Str(-1),DynStat.Tou(-2),DynStat.Spe(3),DynStat.Lib(1),DynStat.Sens(0.5)][18]);
         }
         else
         {
            if(int([DynStat.Str(-1),DynStat.Tou(-2),DynStat.Spe(3),DynStat.Lib(1),DynStat.Sens(0.5)].length) != 20)
            {
               throw "Too many rest arguments";
            }
            KGAMECLASS.kGAMECLASS.player.dynStats([DynStat.Str(-1),DynStat.Tou(-2),DynStat.Spe(3),DynStat.Lib(1),DynStat.Sens(0.5)][0],[DynStat.Str(-1),DynStat.Tou(-2),DynStat.Spe(3),DynStat.Lib(1),DynStat.Sens(0.5)][1],[DynStat.Str(-1),DynStat.Tou(-2),DynStat.Spe(3),DynStat.Lib(1),DynStat.Sens(0.5)][2],[DynStat.Str(-1),DynStat.Tou(-2),DynStat.Spe(3),DynStat.Lib(1),DynStat.Sens(0.5)][3],[DynStat.Str(-1),DynStat.Tou(-2),DynStat.Spe(3),DynStat.Lib(1),DynStat.Sens(0.5)][4],[DynStat.Str(-1),DynStat.Tou(-2),DynStat.Spe(3),DynStat.Lib(1),DynStat.Sens(0.5)][5],[DynStat.Str(-1),DynStat.Tou(-2),DynStat.Spe(3),DynStat.Lib(1),DynStat.Sens(0.5)][6],[DynStat.Str(-1),DynStat.Tou(-2),DynStat.Spe(3),DynStat.Lib(1),DynStat.Sens(0.5)][7],[DynStat.Str(-1),DynStat.Tou(-2),DynStat.Spe(3),DynStat.Lib(1),DynStat.Sens(0.5)][8],[DynStat.Str(-1),DynStat.Tou(-2),DynStat.Spe(3),DynStat.Lib(1),DynStat.Sens(0.5)][9],[DynStat.Str(-1),DynStat.Tou(-2),DynStat.Spe(3),DynStat.Lib(1),DynStat.Sens(0.5)][10],[DynStat.Str(-1),DynStat.Tou(-2)
            ,DynStat.Spe(3),DynStat.Lib(1),DynStat.Sens(0.5)][11],[DynStat.Str(-1),DynStat.Tou(-2),DynStat.Spe(3),DynStat.Lib(1),DynStat.Sens(0.5)][12],[DynStat.Str(-1),DynStat.Tou(-2),DynStat.Spe(3),DynStat.Lib(1),DynStat.Sens(0.5)][13],[DynStat.Str(-1),DynStat.Tou(-2),DynStat.Spe(3),DynStat.Lib(1),DynStat.Sens(0.5)][14],[DynStat.Str(-1),DynStat.Tou(-2),DynStat.Spe(3),DynStat.Lib(1),DynStat.Sens(0.5)][15],[DynStat.Str(-1),DynStat.Tou(-2),DynStat.Spe(3),DynStat.Lib(1),DynStat.Sens(0.5)][16],[DynStat.Str(-1),DynStat.Tou(-2),DynStat.Spe(3),DynStat.Lib(1),DynStat.Sens(0.5)][17],[DynStat.Str(-1),DynStat.Tou(-2),DynStat.Spe(3),DynStat.Lib(1),DynStat.Sens(0.5)][18],[DynStat.Str(-1),DynStat.Tou(-2),DynStat.Spe(3),DynStat.Lib(1),DynStat.Sens(0.5)][19]);
         }
         output.text("");
      }
      
      public function updateVaginalPregnancy() : Boolean
      {
         var _loc1_:Player = KGAMECLASS.kGAMECLASS.player;
         var _loc2_:Boolean = false;
         if(_loc1_.get_pregnancyIncubation() == 336)
         {
            output.text("<b>你醒来时感觉肚子胀胀的，而且看起来确实有点浮肿。但与此同时，你却有着最奇怪的渴望……你真的很想吃点混合坚果。也许再来点奶酪。</b>[pg]");
            _loc2_ = true;
         }
         if(_loc1_.get_pregnancyIncubation() == 280)
         {
            output.text("<b>你的肚子越来越明显地隆起，并且在蠕动。你可能怀孕了。</b>[pg]");
            _loc2_ = true;
         }
         if(_loc1_.get_pregnancyIncubation() == 216)
         {
            output.text("[b:毫无疑问，你怀孕了；你的肚子已经和家乡任何孕妇的一样大了。][pg]");
            if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,43) == 1)
            {
               output.text("艾米莉对你露出令人安心的微笑。[say: 我们确实是一胎多仔的，亲爱的，这很正常。][pg]");
            }
            if(int([DynStat.Spe(-1),DynStat.Lib(1),DynStat.Sens(1),DynStat.Lust(2)].length) == 0)
            {
               KGAMECLASS.kGAMECLASS.player.dynStats();
            }
            else if(int([DynStat.Spe(-1),DynStat.Lib(1),DynStat.Sens(1),DynStat.Lust(2)].length) == 1)
            {
               KGAMECLASS.kGAMECLASS.player.dynStats([DynStat.Spe(-1),DynStat.Lib(1),DynStat.Sens(1),DynStat.Lust(2)][0]);
            }
            else if(int([DynStat.Spe(-1),DynStat.Lib(1),DynStat.Sens(1),DynStat.Lust(2)].length) == 2)
            {
               KGAMECLASS.kGAMECLASS.player.dynStats([DynStat.Spe(-1),DynStat.Lib(1),DynStat.Sens(1),DynStat.Lust(2)][0],[DynStat.Spe(-1),DynStat.Lib(1),DynStat.Sens(1),DynStat.Lust(2)][1]);
            }
            else if(int([DynStat.Spe(-1),DynStat.Lib(1),DynStat.Sens(1),DynStat.Lust(2)].length) == 3)
            {
               KGAMECLASS.kGAMECLASS.player.dynStats([DynStat.Spe(-1),DynStat.Lib(1),DynStat.Sens(1),DynStat.Lust(2)][0],[DynStat.Spe(-1),DynStat.Lib(1),DynStat.Sens(1),DynStat.Lust(2)][1],[DynStat.Spe(-1),DynStat.Lib(1),DynStat.Sens(1),DynStat.Lust(2)][2]);
            }
            else if(int([DynStat.Spe(-1),DynStat.Lib(1),DynStat.Sens(1),DynStat.Lust(2)].length) == 4)
            {
               KGAMECLASS.kGAMECLASS.player.dynStats([DynStat.Spe(-1),DynStat.Lib(1),DynStat.Sens(1),DynStat.Lust(2)][0],[DynStat.Spe(-1),DynStat.Lib(1),DynStat.Sens(1),DynStat.Lust(2)][1],[DynStat.Spe(-1),DynStat.Lib(1),DynStat.Sens(1),DynStat.Lust(2)][2],[DynStat.Spe(-1),DynStat.Lib(1),DynStat.Sens(1),DynStat.Lust(2)][3]);
            }
            else if(int([DynStat.Spe(-1),DynStat.Lib(1),DynStat.Sens(1),DynStat.Lust(2)].length) == 5)
            {
               KGAMECLASS.kGAMECLASS.player.dynStats([DynStat.Spe(-1),DynStat.Lib(1),DynStat.Sens(1),DynStat.Lust(2)][0],[DynStat.Spe(-1),DynStat.Lib(1),DynStat.Sens(1),DynStat.Lust(2)][1],[DynStat.Spe(-1),DynStat.Lib(1),DynStat.Sens(1),DynStat.Lust(2)][2],[DynStat.Spe(-1),DynStat.Lib(1),DynStat.Sens(1),DynStat.Lust(2)][3],[DynStat.Spe(-1),DynStat.Lib(1),DynStat.Sens(1),DynStat.Lust(2)][4]);
            }
            else if(int([DynStat.Spe(-1),DynStat.Lib(1),DynStat.Sens(1),DynStat.Lust(2)].length) == 6)
            {
               KGAMECLASS.kGAMECLASS.player.dynStats([DynStat.Spe(-1),DynStat.Lib(1),DynStat.Sens(1),DynStat.Lust(2)][0],[DynStat.Spe(-1),DynStat.Lib(1),DynStat.Sens(1),DynStat.Lust(2)][1],[DynStat.Spe(-1),DynStat.Lib(1),DynStat.Sens(1),DynStat.Lust(2)][2],[DynStat.Spe(-1),DynStat.Lib(1),DynStat.Sens(1),DynStat.Lust(2)][3],[DynStat.Spe(-1),DynStat.Lib(1),DynStat.Sens(1),DynStat.Lust(2)][4],[DynStat.Spe(-1),DynStat.Lib(1),DynStat.Sens(1),DynStat.Lust(2)][5]);
            }
            else if(int([DynStat.Spe(-1),DynStat.Lib(1),DynStat.Sens(1),DynStat.Lust(2)].length) == 7)
            {
               KGAMECLASS.kGAMECLASS.player.dynStats([DynStat.Spe(-1),DynStat.Lib(1),DynStat.Sens(1),DynStat.Lust(2)][0],[DynStat.Spe(-1),DynStat.Lib(1),DynStat.Sens(1),DynStat.Lust(2)][1],[DynStat.Spe(-1),DynStat.Lib(1),DynStat.Sens(1),DynStat.Lust(2)][2],[DynStat.Spe(-1),DynStat.Lib(1),DynStat.Sens(1),DynStat.Lust(2)][3],[DynStat.Spe(-1),DynStat.Lib(1),DynStat.Sens(1),DynStat.Lust(2)][4],[DynStat.Spe(-1),DynStat.Lib(1),DynStat.Sens(1),DynStat.Lust(2)][5],[DynStat.Spe(-1),DynStat.Lib(1),DynStat.Sens(1),DynStat.Lust(2)][6]);
            }
            else if(int([DynStat.Spe(-1),DynStat.Lib(1),DynStat.Sens(1),DynStat.Lust(2)].length) == 8)
            {
               KGAMECLASS.kGAMECLASS.player.dynStats([DynStat.Spe(-1),DynStat.Lib(1),DynStat.Sens(1),DynStat.Lust(2)][0],[DynStat.Spe(-1),DynStat.Lib(1),DynStat.Sens(1),DynStat.Lust(2)][1],[DynStat.Spe(-1),DynStat.Lib(1),DynStat.Sens(1),DynStat.Lust(2)][2],[DynStat.Spe(-1),DynStat.Lib(1),DynStat.Sens(1),DynStat.Lust(2)][3],[DynStat.Spe(-1),DynStat.Lib(1),DynStat.Sens(1),DynStat.Lust(2)][4],[DynStat.Spe(-1),DynStat.Lib(1),DynStat.Sens(1),DynStat.Lust(2)][5],[DynStat.Spe(-1),DynStat.Lib(1),DynStat.Sens(1),DynStat.Lust(2)][6],[DynStat.Spe(-1),DynStat.Lib(1),DynStat.Sens(1),DynStat.Lust(2)][7]);
            }
            else if(int([DynStat.Spe(-1),DynStat.Lib(1),DynStat.Sens(1),DynStat.Lust(2)].length) == 9)
            {
               KGAMECLASS.kGAMECLASS.player.dynStats([DynStat.Spe(-1),DynStat.Lib(1),DynStat.Sens(1),DynStat.Lust(2)][0],[DynStat.Spe(-1),DynStat.Lib(1),DynStat.Sens(1),DynStat.Lust(2)][1],[DynStat.Spe(-1),DynStat.Lib(1),DynStat.Sens(1),DynStat.Lust(2)][2],[DynStat.Spe(-1),DynStat.Lib(1),DynStat.Sens(1),DynStat.Lust(2)][3],[DynStat.Spe(-1),DynStat.Lib(1),DynStat.Sens(1),DynStat.Lust(2)][4],[DynStat.Spe(-1),DynStat.Lib(1),DynStat.Sens(1),DynStat.Lust(2)][5],[DynStat.Spe(-1),DynStat.Lib(1),DynStat.Sens(1),DynStat.Lust(2)][6],[DynStat.Spe(-1),DynStat.Lib(1),DynStat.Sens(1),DynStat.Lust(2)][7],[DynStat.Spe(-1),DynStat.Lib(1),DynStat.Sens(1),DynStat.Lust(2)][8]);
            }
            else if(int([DynStat.Spe(-1),DynStat.Lib(1),DynStat.Sens(1),DynStat.Lust(2)].length) == 10)
            {
               KGAMECLASS.kGAMECLASS.player.dynStats([DynStat.Spe(-1),DynStat.Lib(1),DynStat.Sens(1),DynStat.Lust(2)][0],[DynStat.Spe(-1),DynStat.Lib(1),DynStat.Sens(1),DynStat.Lust(2)][1],[DynStat.Spe(-1),DynStat.Lib(1),DynStat.Sens(1),DynStat.Lust(2)][2],[DynStat.Spe(-1),DynStat.Lib(1),DynStat.Sens(1),DynStat.Lust(2)][3],[DynStat.Spe(-1),DynStat.Lib(1),DynStat.Sens(1),DynStat.Lust(2)][4],[DynStat.Spe(-1),DynStat.Lib(1),DynStat.Sens(1),DynStat.Lust(2)][5],[DynStat.Spe(-1),DynStat.Lib(1),DynStat.Sens(1),DynStat.Lust(2)][6],[DynStat.Spe(-1),DynStat.Lib(1),DynStat.Sens(1),DynStat.Lust(2)][7],[DynStat.Spe(-1),DynStat.Lib(1),DynStat.Sens(1),DynStat.Lust(2)][8],[DynStat.Spe(-1),DynStat.Lib(1),DynStat.Sens(1),DynStat.Lust(2)][9]);
            }
            else if(int([DynStat.Spe(-1),DynStat.Lib(1),DynStat.Sens(1),DynStat.Lust(2)].length) == 11)
            {
               KGAMECLASS.kGAMECLASS.player.dynStats([DynStat.Spe(-1),DynStat.Lib(1),DynStat.Sens(1),DynStat.Lust(2)][0],[DynStat.Spe(-1),DynStat.Lib(1),DynStat.Sens(1),DynStat.Lust(2)][1],[DynStat.Spe(-1),DynStat.Lib(1),DynStat.Sens(1),DynStat.Lust(2)][2],[DynStat.Spe(-1),DynStat.Lib(1),DynStat.Sens(1),DynStat.Lust(2)][3],[DynStat.Spe(-1),DynStat.Lib(1),DynStat.Sens(1),DynStat.Lust(2)][4],[DynStat.Spe(-1),DynStat.Lib(1),DynStat.Sens(1),DynStat.Lust(2)][5],[DynStat.Spe(-1),DynStat.Lib(1),DynStat.Sens(1),DynStat.Lust(2)][6],[DynStat.Spe(-1),DynStat.Lib(1),DynStat.Sens(1),DynStat.Lust(2)][7],[DynStat.Spe(-1),DynStat.Lib(1),DynStat.Sens(1),DynStat.Lust(2)][8],[DynStat.Spe(-1),DynStat.Lib(1),DynStat.Sens(1),DynStat.Lust(2)][9],[DynStat.Spe(-1),DynStat.Lib(1),DynStat.Sens(1),DynStat.Lust(2)][10]);
            }
            else if(int([DynStat.Spe(-1),DynStat.Lib(1),DynStat.Sens(1),DynStat.Lust(2)].length) == 12)
            {
               KGAMECLASS.kGAMECLASS.player.dynStats([DynStat.Spe(-1),DynStat.Lib(1),DynStat.Sens(1),DynStat.Lust(2)][0],[DynStat.Spe(-1),DynStat.Lib(1),DynStat.Sens(1),DynStat.Lust(2)][1],[DynStat.Spe(-1),DynStat.Lib(1),DynStat.Sens(1),DynStat.Lust(2)][2],[DynStat.Spe(-1),DynStat.Lib(1),DynStat.Sens(1),DynStat.Lust(2)][3],[DynStat.Spe(-1),DynStat.Lib(1),DynStat.Sens(1),DynStat.Lust(2)][4],[DynStat.Spe(-1),DynStat.Lib(1),DynStat.Sens(1),DynStat.Lust(2)][5],[DynStat.Spe(-1),DynStat.Lib(1),DynStat.Sens(1),DynStat.Lust(2)][6],[DynStat.Spe(-1),DynStat.Lib(1),DynStat.Sens(1),DynStat.Lust(2)][7],[DynStat.Spe(-1),DynStat.Lib(1),DynStat.Sens(1),DynStat.Lust(2)][8],[DynStat.Spe(-1),DynStat.Lib(1),DynStat.Sens(1),DynStat.Lust(2)][9],[DynStat.Spe(-1),DynStat.Lib(1),DynStat.Sens(1),DynStat.Lust(2)][10],[DynStat.Spe(-1),DynStat.Lib(1),DynStat.Sens(1),DynStat.Lust(2)][11]);
            }
            else if(int([DynStat.Spe(-1),DynStat.Lib(1),DynStat.Sens(1),DynStat.Lust(2)].length) == 13)
            {
               KGAMECLASS.kGAMECLASS.player.dynStats([DynStat.Spe(-1),DynStat.Lib(1),DynStat.Sens(1),DynStat.Lust(2)][0],[DynStat.Spe(-1),DynStat.Lib(1),DynStat.Sens(1),DynStat.Lust(2)][1],[DynStat.Spe(-1),DynStat.Lib(1),DynStat.Sens(1),DynStat.Lust(2)][2],[DynStat.Spe(-1),DynStat.Lib(1),DynStat.Sens(1),DynStat.Lust(2)][3],[DynStat.Spe(-1),DynStat.Lib(1),DynStat.Sens(1),DynStat.Lust(2)][4],[DynStat.Spe(-1),DynStat.Lib(1),DynStat.Sens(1),DynStat.Lust(2)][5],[DynStat.Spe(-1),DynStat.Lib(1),DynStat.Sens(1),DynStat.Lust(2)][6],[DynStat.Spe(-1),DynStat.Lib(1),DynStat.Sens(1),DynStat.Lust(2)][7],[DynStat.Spe(-1),DynStat.Lib(1),DynStat.Sens(1),DynStat.Lust(2)][8],[DynStat.Spe(-1),DynStat.Lib(1),DynStat.Sens(1),DynStat.Lust(2)][9],[DynStat.Spe(-1),DynStat.Lib(1),DynStat.Sens(1),DynStat.Lust(2)][10],[DynStat.Spe(-1),DynStat.Lib(1),DynStat.Sens(1),DynStat.Lust(2)][11],[DynStat.Spe(-1),DynStat.Lib(1),DynStat.Sens(1),DynStat.Lust(2)][12]);
            }
            else if(int([DynStat.Spe(-1),DynStat.Lib(1),DynStat.Sens(1),DynStat.Lust(2)].length) == 14)
            {
               KGAMECLASS.kGAMECLASS.player.dynStats([DynStat.Spe(-1),DynStat.Lib(1),DynStat.Sens(1),DynStat.Lust(2)][0],[DynStat.Spe(-1),DynStat.Lib(1),DynStat.Sens(1),DynStat.Lust(2)][1],[DynStat.Spe(-1),DynStat.Lib(1),DynStat.Sens(1),DynStat.Lust(2)][2],[DynStat.Spe(-1),DynStat.Lib(1),DynStat.Sens(1),DynStat.Lust(2)][3],[DynStat.Spe(-1),DynStat.Lib(1),DynStat.Sens(1),DynStat.Lust(2)][4],[DynStat.Spe(-1),DynStat.Lib(1),DynStat.Sens(1),DynStat.Lust(2)][5],[DynStat.Spe(-1),DynStat.Lib(1),DynStat.Sens(1),DynStat.Lust(2)][6],[DynStat.Spe(-1),DynStat.Lib(1),DynStat.Sens(1),DynStat.Lust(2)][7],[DynStat.Spe(-1),DynStat.Lib(1),DynStat.Sens(1),DynStat.Lust(2)][8],[DynStat.Spe(-1),DynStat.Lib(1),DynStat.Sens(1),DynStat.Lust(2)][9],[DynStat.Spe(-1),DynStat.Lib(1),DynStat.Sens(1),DynStat.Lust(2)][10],[DynStat.Spe(-1),DynStat.Lib(1),DynStat.Sens(1),DynStat.Lust(2)][11],[DynStat.Spe(-1),DynStat.Lib(1),DynStat.Sens(1),DynStat.Lust(2)][12],[DynStat.Spe(-1),DynStat.Lib(1),DynStat.Sens(1),DynStat.Lust(2)][13]);
            }
            else if(int([DynStat.Spe(-1),DynStat.Lib(1),DynStat.Sens(1),DynStat.Lust(2)].length) == 15)
            {
               KGAMECLASS.kGAMECLASS.player.dynStats([DynStat.Spe(-1),DynStat.Lib(1),DynStat.Sens(1),DynStat.Lust(2)][0],[DynStat.Spe(-1),DynStat.Lib(1),DynStat.Sens(1),DynStat.Lust(2)][1],[DynStat.Spe(-1),DynStat.Lib(1),DynStat.Sens(1),DynStat.Lust(2)][2],[DynStat.Spe(-1),DynStat.Lib(1),DynStat.Sens(1),DynStat.Lust(2)][3],[DynStat.Spe(-1),DynStat.Lib(1),DynStat.Sens(1),DynStat.Lust(2)][4],[DynStat.Spe(-1),DynStat.Lib(1),DynStat.Sens(1),DynStat.Lust(2)][5],[DynStat.Spe(-1),DynStat.Lib(1),DynStat.Sens(1),DynStat.Lust(2)][6],[DynStat.Spe(-1),DynStat.Lib(1),DynStat.Sens(1),DynStat.Lust(2)][7],[DynStat.Spe(-1),DynStat.Lib(1),DynStat.Sens(1),DynStat.Lust(2)][8],[DynStat.Spe(-1),DynStat.Lib(1),DynStat.Sens(1),DynStat.Lust(2)][9],[DynStat.Spe(-1),DynStat.Lib(1),DynStat.Sens(1),DynStat.Lust(2)][10],[DynStat.Spe(-1),DynStat.Lib(1),DynStat.Sens(1),DynStat.Lust(2)][11],[DynStat.Spe(-1),DynStat.Lib(1),DynStat.Sens(1),DynStat.Lust(2)][12],[DynStat.Spe(-1),DynStat.Lib(1),DynStat.Sens(1),DynStat.Lust(2)][13],[DynStat
               .Spe(-1),DynStat.Lib(1),DynStat.Sens(1),DynStat.Lust(2)][14]);
            }
            else if(int([DynStat.Spe(-1),DynStat.Lib(1),DynStat.Sens(1),DynStat.Lust(2)].length) == 16)
            {
               KGAMECLASS.kGAMECLASS.player.dynStats([DynStat.Spe(-1),DynStat.Lib(1),DynStat.Sens(1),DynStat.Lust(2)][0],[DynStat.Spe(-1),DynStat.Lib(1),DynStat.Sens(1),DynStat.Lust(2)][1],[DynStat.Spe(-1),DynStat.Lib(1),DynStat.Sens(1),DynStat.Lust(2)][2],[DynStat.Spe(-1),DynStat.Lib(1),DynStat.Sens(1),DynStat.Lust(2)][3],[DynStat.Spe(-1),DynStat.Lib(1),DynStat.Sens(1),DynStat.Lust(2)][4],[DynStat.Spe(-1),DynStat.Lib(1),DynStat.Sens(1),DynStat.Lust(2)][5],[DynStat.Spe(-1),DynStat.Lib(1),DynStat.Sens(1),DynStat.Lust(2)][6],[DynStat.Spe(-1),DynStat.Lib(1),DynStat.Sens(1),DynStat.Lust(2)][7],[DynStat.Spe(-1),DynStat.Lib(1),DynStat.Sens(1),DynStat.Lust(2)][8],[DynStat.Spe(-1),DynStat.Lib(1),DynStat.Sens(1),DynStat.Lust(2)][9],[DynStat.Spe(-1),DynStat.Lib(1),DynStat.Sens(1),DynStat.Lust(2)][10],[DynStat.Spe(-1),DynStat.Lib(1),DynStat.Sens(1),DynStat.Lust(2)][11],[DynStat.Spe(-1),DynStat.Lib(1),DynStat.Sens(1),DynStat.Lust(2)][12],[DynStat.Spe(-1),DynStat.Lib(1),DynStat.Sens(1),DynStat.Lust(2)][13],[DynStat
               .Spe(-1),DynStat.Lib(1),DynStat.Sens(1),DynStat.Lust(2)][14],[DynStat.Spe(-1),DynStat.Lib(1),DynStat.Sens(1),DynStat.Lust(2)][15]);
            }
            else if(int([DynStat.Spe(-1),DynStat.Lib(1),DynStat.Sens(1),DynStat.Lust(2)].length) == 17)
            {
               KGAMECLASS.kGAMECLASS.player.dynStats([DynStat.Spe(-1),DynStat.Lib(1),DynStat.Sens(1),DynStat.Lust(2)][0],[DynStat.Spe(-1),DynStat.Lib(1),DynStat.Sens(1),DynStat.Lust(2)][1],[DynStat.Spe(-1),DynStat.Lib(1),DynStat.Sens(1),DynStat.Lust(2)][2],[DynStat.Spe(-1),DynStat.Lib(1),DynStat.Sens(1),DynStat.Lust(2)][3],[DynStat.Spe(-1),DynStat.Lib(1),DynStat.Sens(1),DynStat.Lust(2)][4],[DynStat.Spe(-1),DynStat.Lib(1),DynStat.Sens(1),DynStat.Lust(2)][5],[DynStat.Spe(-1),DynStat.Lib(1),DynStat.Sens(1),DynStat.Lust(2)][6],[DynStat.Spe(-1),DynStat.Lib(1),DynStat.Sens(1),DynStat.Lust(2)][7],[DynStat.Spe(-1),DynStat.Lib(1),DynStat.Sens(1),DynStat.Lust(2)][8],[DynStat.Spe(-1),DynStat.Lib(1),DynStat.Sens(1),DynStat.Lust(2)][9],[DynStat.Spe(-1),DynStat.Lib(1),DynStat.Sens(1),DynStat.Lust(2)][10],[DynStat.Spe(-1),DynStat.Lib(1),DynStat.Sens(1),DynStat.Lust(2)][11],[DynStat.Spe(-1),DynStat.Lib(1),DynStat.Sens(1),DynStat.Lust(2)][12],[DynStat.Spe(-1),DynStat.Lib(1),DynStat.Sens(1),DynStat.Lust(2)][13],[DynStat
               .Spe(-1),DynStat.Lib(1),DynStat.Sens(1),DynStat.Lust(2)][14],[DynStat.Spe(-1),DynStat.Lib(1),DynStat.Sens(1),DynStat.Lust(2)][15],[DynStat.Spe(-1),DynStat.Lib(1),DynStat.Sens(1),DynStat.Lust(2)][16]);
            }
            else if(int([DynStat.Spe(-1),DynStat.Lib(1),DynStat.Sens(1),DynStat.Lust(2)].length) == 18)
            {
               KGAMECLASS.kGAMECLASS.player.dynStats([DynStat.Spe(-1),DynStat.Lib(1),DynStat.Sens(1),DynStat.Lust(2)][0],[DynStat.Spe(-1),DynStat.Lib(1),DynStat.Sens(1),DynStat.Lust(2)][1],[DynStat.Spe(-1),DynStat.Lib(1),DynStat.Sens(1),DynStat.Lust(2)][2],[DynStat.Spe(-1),DynStat.Lib(1),DynStat.Sens(1),DynStat.Lust(2)][3],[DynStat.Spe(-1),DynStat.Lib(1),DynStat.Sens(1),DynStat.Lust(2)][4],[DynStat.Spe(-1),DynStat.Lib(1),DynStat.Sens(1),DynStat.Lust(2)][5],[DynStat.Spe(-1),DynStat.Lib(1),DynStat.Sens(1),DynStat.Lust(2)][6],[DynStat.Spe(-1),DynStat.Lib(1),DynStat.Sens(1),DynStat.Lust(2)][7],[DynStat.Spe(-1),DynStat.Lib(1),DynStat.Sens(1),DynStat.Lust(2)][8],[DynStat.Spe(-1),DynStat.Lib(1),DynStat.Sens(1),DynStat.Lust(2)][9],[DynStat.Spe(-1),DynStat.Lib(1),DynStat.Sens(1),DynStat.Lust(2)][10],[DynStat.Spe(-1),DynStat.Lib(1),DynStat.Sens(1),DynStat.Lust(2)][11],[DynStat.Spe(-1),DynStat.Lib(1),DynStat.Sens(1),DynStat.Lust(2)][12],[DynStat.Spe(-1),DynStat.Lib(1),DynStat.Sens(1),DynStat.Lust(2)][13],[DynStat
               .Spe(-1),DynStat.Lib(1),DynStat.Sens(1),DynStat.Lust(2)][14],[DynStat.Spe(-1),DynStat.Lib(1),DynStat.Sens(1),DynStat.Lust(2)][15],[DynStat.Spe(-1),DynStat.Lib(1),DynStat.Sens(1),DynStat.Lust(2)][16],[DynStat.Spe(-1),DynStat.Lib(1),DynStat.Sens(1),DynStat.Lust(2)][17]);
            }
            else if(int([DynStat.Spe(-1),DynStat.Lib(1),DynStat.Sens(1),DynStat.Lust(2)].length) == 19)
            {
               KGAMECLASS.kGAMECLASS.player.dynStats([DynStat.Spe(-1),DynStat.Lib(1),DynStat.Sens(1),DynStat.Lust(2)][0],[DynStat.Spe(-1),DynStat.Lib(1),DynStat.Sens(1),DynStat.Lust(2)][1],[DynStat.Spe(-1),DynStat.Lib(1),DynStat.Sens(1),DynStat.Lust(2)][2],[DynStat.Spe(-1),DynStat.Lib(1),DynStat.Sens(1),DynStat.Lust(2)][3],[DynStat.Spe(-1),DynStat.Lib(1),DynStat.Sens(1),DynStat.Lust(2)][4],[DynStat.Spe(-1),DynStat.Lib(1),DynStat.Sens(1),DynStat.Lust(2)][5],[DynStat.Spe(-1),DynStat.Lib(1),DynStat.Sens(1),DynStat.Lust(2)][6],[DynStat.Spe(-1),DynStat.Lib(1),DynStat.Sens(1),DynStat.Lust(2)][7],[DynStat.Spe(-1),DynStat.Lib(1),DynStat.Sens(1),DynStat.Lust(2)][8],[DynStat.Spe(-1),DynStat.Lib(1),DynStat.Sens(1),DynStat.Lust(2)][9],[DynStat.Spe(-1),DynStat.Lib(1),DynStat.Sens(1),DynStat.Lust(2)][10],[DynStat.Spe(-1),DynStat.Lib(1),DynStat.Sens(1),DynStat.Lust(2)][11],[DynStat.Spe(-1),DynStat.Lib(1),DynStat.Sens(1),DynStat.Lust(2)][12],[DynStat.Spe(-1),DynStat.Lib(1),DynStat.Sens(1),DynStat.Lust(2)][13],[DynStat
               .Spe(-1),DynStat.Lib(1),DynStat.Sens(1),DynStat.Lust(2)][14],[DynStat.Spe(-1),DynStat.Lib(1),DynStat.Sens(1),DynStat.Lust(2)][15],[DynStat.Spe(-1),DynStat.Lib(1),DynStat.Sens(1),DynStat.Lust(2)][16],[DynStat.Spe(-1),DynStat.Lib(1),DynStat.Sens(1),DynStat.Lust(2)][17],[DynStat.Spe(-1),DynStat.Lib(1),DynStat.Sens(1),DynStat.Lust(2)][18]);
            }
            else
            {
               if(int([DynStat.Spe(-1),DynStat.Lib(1),DynStat.Sens(1),DynStat.Lust(2)].length) != 20)
               {
                  throw "Too many rest arguments";
               }
               KGAMECLASS.kGAMECLASS.player.dynStats([DynStat.Spe(-1),DynStat.Lib(1),DynStat.Sens(1),DynStat.Lust(2)][0],[DynStat.Spe(-1),DynStat.Lib(1),DynStat.Sens(1),DynStat.Lust(2)][1],[DynStat.Spe(-1),DynStat.Lib(1),DynStat.Sens(1),DynStat.Lust(2)][2],[DynStat.Spe(-1),DynStat.Lib(1),DynStat.Sens(1),DynStat.Lust(2)][3],[DynStat.Spe(-1),DynStat.Lib(1),DynStat.Sens(1),DynStat.Lust(2)][4],[DynStat.Spe(-1),DynStat.Lib(1),DynStat.Sens(1),DynStat.Lust(2)][5],[DynStat.Spe(-1),DynStat.Lib(1),DynStat.Sens(1),DynStat.Lust(2)][6],[DynStat.Spe(-1),DynStat.Lib(1),DynStat.Sens(1),DynStat.Lust(2)][7],[DynStat.Spe(-1),DynStat.Lib(1),DynStat.Sens(1),DynStat.Lust(2)][8],[DynStat.Spe(-1),DynStat.Lib(1),DynStat.Sens(1),DynStat.Lust(2)][9],[DynStat.Spe(-1),DynStat.Lib(1),DynStat.Sens(1),DynStat.Lust(2)][10],[DynStat.Spe(-1),DynStat.Lib(1),DynStat.Sens(1),DynStat.Lust(2)][11],[DynStat.Spe(-1),DynStat.Lib(1),DynStat.Sens(1),DynStat.Lust(2)][12],[DynStat.Spe(-1),DynStat.Lib(1),DynStat.Sens(1),DynStat.Lust(2)][13],[DynStat
               .Spe(-1),DynStat.Lib(1),DynStat.Sens(1),DynStat.Lust(2)][14],[DynStat.Spe(-1),DynStat.Lib(1),DynStat.Sens(1),DynStat.Lust(2)][15],[DynStat.Spe(-1),DynStat.Lib(1),DynStat.Sens(1),DynStat.Lust(2)][16],[DynStat.Spe(-1),DynStat.Lib(1),DynStat.Sens(1),DynStat.Lust(2)][17],[DynStat.Spe(-1),DynStat.Lib(1),DynStat.Sens(1),DynStat.Lust(2)][18],[DynStat.Spe(-1),DynStat.Lib(1),DynStat.Sens(1),DynStat.Lust(2)][19]);
            }
            _loc2_ = true;
         }
         if(_loc1_.get_pregnancyIncubation() == 180)
         {
            output.text("<b>你膨胀的子宫里突然传来一阵轻微的踢动，让你吓了一跳。片刻之后，它再次发生，让你倒吸一口凉气。</b>[pg]");
            _loc2_ = true;
         }
         if(_loc1_.get_pregnancyIncubation() == 120)
         {
            output.text("<b>你现在感觉（看起来也是）肚子大得惊人，但你感到很满足。你知道这些孩子的，呃，“父亲”爱你，他们也会反过来爱你。</b>[pg]");
            _loc2_ = true;
         }
         if(_loc1_.get_pregnancyIncubation() == 72)
         {
            output.text("<b>你肿胀的胃里传来一阵蠕动的感觉，让你猛地一震。幸运的是，这种感觉很快就消失了，但你确信你感觉到不止一个婴儿在你体内踢动。</b>[pg]");
            if(int([DynStat.Spe(-3),DynStat.Lib(1),DynStat.Sens(1),DynStat.Lust(4)].length) == 0)
            {
               KGAMECLASS.kGAMECLASS.player.dynStats();
            }
            else if(int([DynStat.Spe(-3),DynStat.Lib(1),DynStat.Sens(1),DynStat.Lust(4)].length) == 1)
            {
               KGAMECLASS.kGAMECLASS.player.dynStats([DynStat.Spe(-3),DynStat.Lib(1),DynStat.Sens(1),DynStat.Lust(4)][0]);
            }
            else if(int([DynStat.Spe(-3),DynStat.Lib(1),DynStat.Sens(1),DynStat.Lust(4)].length) == 2)
            {
               KGAMECLASS.kGAMECLASS.player.dynStats([DynStat.Spe(-3),DynStat.Lib(1),DynStat.Sens(1),DynStat.Lust(4)][0],[DynStat.Spe(-3),DynStat.Lib(1),DynStat.Sens(1),DynStat.Lust(4)][1]);
            }
            else if(int([DynStat.Spe(-3),DynStat.Lib(1),DynStat.Sens(1),DynStat.Lust(4)].length) == 3)
            {
               KGAMECLASS.kGAMECLASS.player.dynStats([DynStat.Spe(-3),DynStat.Lib(1),DynStat.Sens(1),DynStat.Lust(4)][0],[DynStat.Spe(-3),DynStat.Lib(1),DynStat.Sens(1),DynStat.Lust(4)][1],[DynStat.Spe(-3),DynStat.Lib(1),DynStat.Sens(1),DynStat.Lust(4)][2]);
            }
            else if(int([DynStat.Spe(-3),DynStat.Lib(1),DynStat.Sens(1),DynStat.Lust(4)].length) == 4)
            {
               KGAMECLASS.kGAMECLASS.player.dynStats([DynStat.Spe(-3),DynStat.Lib(1),DynStat.Sens(1),DynStat.Lust(4)][0],[DynStat.Spe(-3),DynStat.Lib(1),DynStat.Sens(1),DynStat.Lust(4)][1],[DynStat.Spe(-3),DynStat.Lib(1),DynStat.Sens(1),DynStat.Lust(4)][2],[DynStat.Spe(-3),DynStat.Lib(1),DynStat.Sens(1),DynStat.Lust(4)][3]);
            }
            else if(int([DynStat.Spe(-3),DynStat.Lib(1),DynStat.Sens(1),DynStat.Lust(4)].length) == 5)
            {
               KGAMECLASS.kGAMECLASS.player.dynStats([DynStat.Spe(-3),DynStat.Lib(1),DynStat.Sens(1),DynStat.Lust(4)][0],[DynStat.Spe(-3),DynStat.Lib(1),DynStat.Sens(1),DynStat.Lust(4)][1],[DynStat.Spe(-3),DynStat.Lib(1),DynStat.Sens(1),DynStat.Lust(4)][2],[DynStat.Spe(-3),DynStat.Lib(1),DynStat.Sens(1),DynStat.Lust(4)][3],[DynStat.Spe(-3),DynStat.Lib(1),DynStat.Sens(1),DynStat.Lust(4)][4]);
            }
            else if(int([DynStat.Spe(-3),DynStat.Lib(1),DynStat.Sens(1),DynStat.Lust(4)].length) == 6)
            {
               KGAMECLASS.kGAMECLASS.player.dynStats([DynStat.Spe(-3),DynStat.Lib(1),DynStat.Sens(1),DynStat.Lust(4)][0],[DynStat.Spe(-3),DynStat.Lib(1),DynStat.Sens(1),DynStat.Lust(4)][1],[DynStat.Spe(-3),DynStat.Lib(1),DynStat.Sens(1),DynStat.Lust(4)][2],[DynStat.Spe(-3),DynStat.Lib(1),DynStat.Sens(1),DynStat.Lust(4)][3],[DynStat.Spe(-3),DynStat.Lib(1),DynStat.Sens(1),DynStat.Lust(4)][4],[DynStat.Spe(-3),DynStat.Lib(1),DynStat.Sens(1),DynStat.Lust(4)][5]);
            }
            else if(int([DynStat.Spe(-3),DynStat.Lib(1),DynStat.Sens(1),DynStat.Lust(4)].length) == 7)
            {
               KGAMECLASS.kGAMECLASS.player.dynStats([DynStat.Spe(-3),DynStat.Lib(1),DynStat.Sens(1),DynStat.Lust(4)][0],[DynStat.Spe(-3),DynStat.Lib(1),DynStat.Sens(1),DynStat.Lust(4)][1],[DynStat.Spe(-3),DynStat.Lib(1),DynStat.Sens(1),DynStat.Lust(4)][2],[DynStat.Spe(-3),DynStat.Lib(1),DynStat.Sens(1),DynStat.Lust(4)][3],[DynStat.Spe(-3),DynStat.Lib(1),DynStat.Sens(1),DynStat.Lust(4)][4],[DynStat.Spe(-3),DynStat.Lib(1),DynStat.Sens(1),DynStat.Lust(4)][5],[DynStat.Spe(-3),DynStat.Lib(1),DynStat.Sens(1),DynStat.Lust(4)][6]);
            }
            else if(int([DynStat.Spe(-3),DynStat.Lib(1),DynStat.Sens(1),DynStat.Lust(4)].length) == 8)
            {
               KGAMECLASS.kGAMECLASS.player.dynStats([DynStat.Spe(-3),DynStat.Lib(1),DynStat.Sens(1),DynStat.Lust(4)][0],[DynStat.Spe(-3),DynStat.Lib(1),DynStat.Sens(1),DynStat.Lust(4)][1],[DynStat.Spe(-3),DynStat.Lib(1),DynStat.Sens(1),DynStat.Lust(4)][2],[DynStat.Spe(-3),DynStat.Lib(1),DynStat.Sens(1),DynStat.Lust(4)][3],[DynStat.Spe(-3),DynStat.Lib(1),DynStat.Sens(1),DynStat.Lust(4)][4],[DynStat.Spe(-3),DynStat.Lib(1),DynStat.Sens(1),DynStat.Lust(4)][5],[DynStat.Spe(-3),DynStat.Lib(1),DynStat.Sens(1),DynStat.Lust(4)][6],[DynStat.Spe(-3),DynStat.Lib(1),DynStat.Sens(1),DynStat.Lust(4)][7]);
            }
            else if(int([DynStat.Spe(-3),DynStat.Lib(1),DynStat.Sens(1),DynStat.Lust(4)].length) == 9)
            {
               KGAMECLASS.kGAMECLASS.player.dynStats([DynStat.Spe(-3),DynStat.Lib(1),DynStat.Sens(1),DynStat.Lust(4)][0],[DynStat.Spe(-3),DynStat.Lib(1),DynStat.Sens(1),DynStat.Lust(4)][1],[DynStat.Spe(-3),DynStat.Lib(1),DynStat.Sens(1),DynStat.Lust(4)][2],[DynStat.Spe(-3),DynStat.Lib(1),DynStat.Sens(1),DynStat.Lust(4)][3],[DynStat.Spe(-3),DynStat.Lib(1),DynStat.Sens(1),DynStat.Lust(4)][4],[DynStat.Spe(-3),DynStat.Lib(1),DynStat.Sens(1),DynStat.Lust(4)][5],[DynStat.Spe(-3),DynStat.Lib(1),DynStat.Sens(1),DynStat.Lust(4)][6],[DynStat.Spe(-3),DynStat.Lib(1),DynStat.Sens(1),DynStat.Lust(4)][7],[DynStat.Spe(-3),DynStat.Lib(1),DynStat.Sens(1),DynStat.Lust(4)][8]);
            }
            else if(int([DynStat.Spe(-3),DynStat.Lib(1),DynStat.Sens(1),DynStat.Lust(4)].length) == 10)
            {
               KGAMECLASS.kGAMECLASS.player.dynStats([DynStat.Spe(-3),DynStat.Lib(1),DynStat.Sens(1),DynStat.Lust(4)][0],[DynStat.Spe(-3),DynStat.Lib(1),DynStat.Sens(1),DynStat.Lust(4)][1],[DynStat.Spe(-3),DynStat.Lib(1),DynStat.Sens(1),DynStat.Lust(4)][2],[DynStat.Spe(-3),DynStat.Lib(1),DynStat.Sens(1),DynStat.Lust(4)][3],[DynStat.Spe(-3),DynStat.Lib(1),DynStat.Sens(1),DynStat.Lust(4)][4],[DynStat.Spe(-3),DynStat.Lib(1),DynStat.Sens(1),DynStat.Lust(4)][5],[DynStat.Spe(-3),DynStat.Lib(1),DynStat.Sens(1),DynStat.Lust(4)][6],[DynStat.Spe(-3),DynStat.Lib(1),DynStat.Sens(1),DynStat.Lust(4)][7],[DynStat.Spe(-3),DynStat.Lib(1),DynStat.Sens(1),DynStat.Lust(4)][8],[DynStat.Spe(-3),DynStat.Lib(1),DynStat.Sens(1),DynStat.Lust(4)][9]);
            }
            else if(int([DynStat.Spe(-3),DynStat.Lib(1),DynStat.Sens(1),DynStat.Lust(4)].length) == 11)
            {
               KGAMECLASS.kGAMECLASS.player.dynStats([DynStat.Spe(-3),DynStat.Lib(1),DynStat.Sens(1),DynStat.Lust(4)][0],[DynStat.Spe(-3),DynStat.Lib(1),DynStat.Sens(1),DynStat.Lust(4)][1],[DynStat.Spe(-3),DynStat.Lib(1),DynStat.Sens(1),DynStat.Lust(4)][2],[DynStat.Spe(-3),DynStat.Lib(1),DynStat.Sens(1),DynStat.Lust(4)][3],[DynStat.Spe(-3),DynStat.Lib(1),DynStat.Sens(1),DynStat.Lust(4)][4],[DynStat.Spe(-3),DynStat.Lib(1),DynStat.Sens(1),DynStat.Lust(4)][5],[DynStat.Spe(-3),DynStat.Lib(1),DynStat.Sens(1),DynStat.Lust(4)][6],[DynStat.Spe(-3),DynStat.Lib(1),DynStat.Sens(1),DynStat.Lust(4)][7],[DynStat.Spe(-3),DynStat.Lib(1),DynStat.Sens(1),DynStat.Lust(4)][8],[DynStat.Spe(-3),DynStat.Lib(1),DynStat.Sens(1),DynStat.Lust(4)][9],[DynStat.Spe(-3),DynStat.Lib(1),DynStat.Sens(1),DynStat.Lust(4)][10]);
            }
            else if(int([DynStat.Spe(-3),DynStat.Lib(1),DynStat.Sens(1),DynStat.Lust(4)].length) == 12)
            {
               KGAMECLASS.kGAMECLASS.player.dynStats([DynStat.Spe(-3),DynStat.Lib(1),DynStat.Sens(1),DynStat.Lust(4)][0],[DynStat.Spe(-3),DynStat.Lib(1),DynStat.Sens(1),DynStat.Lust(4)][1],[DynStat.Spe(-3),DynStat.Lib(1),DynStat.Sens(1),DynStat.Lust(4)][2],[DynStat.Spe(-3),DynStat.Lib(1),DynStat.Sens(1),DynStat.Lust(4)][3],[DynStat.Spe(-3),DynStat.Lib(1),DynStat.Sens(1),DynStat.Lust(4)][4],[DynStat.Spe(-3),DynStat.Lib(1),DynStat.Sens(1),DynStat.Lust(4)][5],[DynStat.Spe(-3),DynStat.Lib(1),DynStat.Sens(1),DynStat.Lust(4)][6],[DynStat.Spe(-3),DynStat.Lib(1),DynStat.Sens(1),DynStat.Lust(4)][7],[DynStat.Spe(-3),DynStat.Lib(1),DynStat.Sens(1),DynStat.Lust(4)][8],[DynStat.Spe(-3),DynStat.Lib(1),DynStat.Sens(1),DynStat.Lust(4)][9],[DynStat.Spe(-3),DynStat.Lib(1),DynStat.Sens(1),DynStat.Lust(4)][10],[DynStat.Spe(-3),DynStat.Lib(1),DynStat.Sens(1),DynStat.Lust(4)][11]);
            }
            else if(int([DynStat.Spe(-3),DynStat.Lib(1),DynStat.Sens(1),DynStat.Lust(4)].length) == 13)
            {
               KGAMECLASS.kGAMECLASS.player.dynStats([DynStat.Spe(-3),DynStat.Lib(1),DynStat.Sens(1),DynStat.Lust(4)][0],[DynStat.Spe(-3),DynStat.Lib(1),DynStat.Sens(1),DynStat.Lust(4)][1],[DynStat.Spe(-3),DynStat.Lib(1),DynStat.Sens(1),DynStat.Lust(4)][2],[DynStat.Spe(-3),DynStat.Lib(1),DynStat.Sens(1),DynStat.Lust(4)][3],[DynStat.Spe(-3),DynStat.Lib(1),DynStat.Sens(1),DynStat.Lust(4)][4],[DynStat.Spe(-3),DynStat.Lib(1),DynStat.Sens(1),DynStat.Lust(4)][5],[DynStat.Spe(-3),DynStat.Lib(1),DynStat.Sens(1),DynStat.Lust(4)][6],[DynStat.Spe(-3),DynStat.Lib(1),DynStat.Sens(1),DynStat.Lust(4)][7],[DynStat.Spe(-3),DynStat.Lib(1),DynStat.Sens(1),DynStat.Lust(4)][8],[DynStat.Spe(-3),DynStat.Lib(1),DynStat.Sens(1),DynStat.Lust(4)][9],[DynStat.Spe(-3),DynStat.Lib(1),DynStat.Sens(1),DynStat.Lust(4)][10],[DynStat.Spe(-3),DynStat.Lib(1),DynStat.Sens(1),DynStat.Lust(4)][11],[DynStat.Spe(-3),DynStat.Lib(1),DynStat.Sens(1),DynStat.Lust(4)][12]);
            }
            else if(int([DynStat.Spe(-3),DynStat.Lib(1),DynStat.Sens(1),DynStat.Lust(4)].length) == 14)
            {
               KGAMECLASS.kGAMECLASS.player.dynStats([DynStat.Spe(-3),DynStat.Lib(1),DynStat.Sens(1),DynStat.Lust(4)][0],[DynStat.Spe(-3),DynStat.Lib(1),DynStat.Sens(1),DynStat.Lust(4)][1],[DynStat.Spe(-3),DynStat.Lib(1),DynStat.Sens(1),DynStat.Lust(4)][2],[DynStat.Spe(-3),DynStat.Lib(1),DynStat.Sens(1),DynStat.Lust(4)][3],[DynStat.Spe(-3),DynStat.Lib(1),DynStat.Sens(1),DynStat.Lust(4)][4],[DynStat.Spe(-3),DynStat.Lib(1),DynStat.Sens(1),DynStat.Lust(4)][5],[DynStat.Spe(-3),DynStat.Lib(1),DynStat.Sens(1),DynStat.Lust(4)][6],[DynStat.Spe(-3),DynStat.Lib(1),DynStat.Sens(1),DynStat.Lust(4)][7],[DynStat.Spe(-3),DynStat.Lib(1),DynStat.Sens(1),DynStat.Lust(4)][8],[DynStat.Spe(-3),DynStat.Lib(1),DynStat.Sens(1),DynStat.Lust(4)][9],[DynStat.Spe(-3),DynStat.Lib(1),DynStat.Sens(1),DynStat.Lust(4)][10],[DynStat.Spe(-3),DynStat.Lib(1),DynStat.Sens(1),DynStat.Lust(4)][11],[DynStat.Spe(-3),DynStat.Lib(1),DynStat.Sens(1),DynStat.Lust(4)][12],[DynStat.Spe(-3),DynStat.Lib(1),DynStat.Sens(1),DynStat.Lust(4)][13]);
            }
            else if(int([DynStat.Spe(-3),DynStat.Lib(1),DynStat.Sens(1),DynStat.Lust(4)].length) == 15)
            {
               KGAMECLASS.kGAMECLASS.player.dynStats([DynStat.Spe(-3),DynStat.Lib(1),DynStat.Sens(1),DynStat.Lust(4)][0],[DynStat.Spe(-3),DynStat.Lib(1),DynStat.Sens(1),DynStat.Lust(4)][1],[DynStat.Spe(-3),DynStat.Lib(1),DynStat.Sens(1),DynStat.Lust(4)][2],[DynStat.Spe(-3),DynStat.Lib(1),DynStat.Sens(1),DynStat.Lust(4)][3],[DynStat.Spe(-3),DynStat.Lib(1),DynStat.Sens(1),DynStat.Lust(4)][4],[DynStat.Spe(-3),DynStat.Lib(1),DynStat.Sens(1),DynStat.Lust(4)][5],[DynStat.Spe(-3),DynStat.Lib(1),DynStat.Sens(1),DynStat.Lust(4)][6],[DynStat.Spe(-3),DynStat.Lib(1),DynStat.Sens(1),DynStat.Lust(4)][7],[DynStat.Spe(-3),DynStat.Lib(1),DynStat.Sens(1),DynStat.Lust(4)][8],[DynStat.Spe(-3),DynStat.Lib(1),DynStat.Sens(1),DynStat.Lust(4)][9],[DynStat.Spe(-3),DynStat.Lib(1),DynStat.Sens(1),DynStat.Lust(4)][10],[DynStat.Spe(-3),DynStat.Lib(1),DynStat.Sens(1),DynStat.Lust(4)][11],[DynStat.Spe(-3),DynStat.Lib(1),DynStat.Sens(1),DynStat.Lust(4)][12],[DynStat.Spe(-3),DynStat.Lib(1),DynStat.Sens(1),DynStat.Lust(4)][13],[DynStat
               .Spe(-3),DynStat.Lib(1),DynStat.Sens(1),DynStat.Lust(4)][14]);
            }
            else if(int([DynStat.Spe(-3),DynStat.Lib(1),DynStat.Sens(1),DynStat.Lust(4)].length) == 16)
            {
               KGAMECLASS.kGAMECLASS.player.dynStats([DynStat.Spe(-3),DynStat.Lib(1),DynStat.Sens(1),DynStat.Lust(4)][0],[DynStat.Spe(-3),DynStat.Lib(1),DynStat.Sens(1),DynStat.Lust(4)][1],[DynStat.Spe(-3),DynStat.Lib(1),DynStat.Sens(1),DynStat.Lust(4)][2],[DynStat.Spe(-3),DynStat.Lib(1),DynStat.Sens(1),DynStat.Lust(4)][3],[DynStat.Spe(-3),DynStat.Lib(1),DynStat.Sens(1),DynStat.Lust(4)][4],[DynStat.Spe(-3),DynStat.Lib(1),DynStat.Sens(1),DynStat.Lust(4)][5],[DynStat.Spe(-3),DynStat.Lib(1),DynStat.Sens(1),DynStat.Lust(4)][6],[DynStat.Spe(-3),DynStat.Lib(1),DynStat.Sens(1),DynStat.Lust(4)][7],[DynStat.Spe(-3),DynStat.Lib(1),DynStat.Sens(1),DynStat.Lust(4)][8],[DynStat.Spe(-3),DynStat.Lib(1),DynStat.Sens(1),DynStat.Lust(4)][9],[DynStat.Spe(-3),DynStat.Lib(1),DynStat.Sens(1),DynStat.Lust(4)][10],[DynStat.Spe(-3),DynStat.Lib(1),DynStat.Sens(1),DynStat.Lust(4)][11],[DynStat.Spe(-3),DynStat.Lib(1),DynStat.Sens(1),DynStat.Lust(4)][12],[DynStat.Spe(-3),DynStat.Lib(1),DynStat.Sens(1),DynStat.Lust(4)][13],[DynStat
               .Spe(-3),DynStat.Lib(1),DynStat.Sens(1),DynStat.Lust(4)][14],[DynStat.Spe(-3),DynStat.Lib(1),DynStat.Sens(1),DynStat.Lust(4)][15]);
            }
            else if(int([DynStat.Spe(-3),DynStat.Lib(1),DynStat.Sens(1),DynStat.Lust(4)].length) == 17)
            {
               KGAMECLASS.kGAMECLASS.player.dynStats([DynStat.Spe(-3),DynStat.Lib(1),DynStat.Sens(1),DynStat.Lust(4)][0],[DynStat.Spe(-3),DynStat.Lib(1),DynStat.Sens(1),DynStat.Lust(4)][1],[DynStat.Spe(-3),DynStat.Lib(1),DynStat.Sens(1),DynStat.Lust(4)][2],[DynStat.Spe(-3),DynStat.Lib(1),DynStat.Sens(1),DynStat.Lust(4)][3],[DynStat.Spe(-3),DynStat.Lib(1),DynStat.Sens(1),DynStat.Lust(4)][4],[DynStat.Spe(-3),DynStat.Lib(1),DynStat.Sens(1),DynStat.Lust(4)][5],[DynStat.Spe(-3),DynStat.Lib(1),DynStat.Sens(1),DynStat.Lust(4)][6],[DynStat.Spe(-3),DynStat.Lib(1),DynStat.Sens(1),DynStat.Lust(4)][7],[DynStat.Spe(-3),DynStat.Lib(1),DynStat.Sens(1),DynStat.Lust(4)][8],[DynStat.Spe(-3),DynStat.Lib(1),DynStat.Sens(1),DynStat.Lust(4)][9],[DynStat.Spe(-3),DynStat.Lib(1),DynStat.Sens(1),DynStat.Lust(4)][10],[DynStat.Spe(-3),DynStat.Lib(1),DynStat.Sens(1),DynStat.Lust(4)][11],[DynStat.Spe(-3),DynStat.Lib(1),DynStat.Sens(1),DynStat.Lust(4)][12],[DynStat.Spe(-3),DynStat.Lib(1),DynStat.Sens(1),DynStat.Lust(4)][13],[DynStat
               .Spe(-3),DynStat.Lib(1),DynStat.Sens(1),DynStat.Lust(4)][14],[DynStat.Spe(-3),DynStat.Lib(1),DynStat.Sens(1),DynStat.Lust(4)][15],[DynStat.Spe(-3),DynStat.Lib(1),DynStat.Sens(1),DynStat.Lust(4)][16]);
            }
            else if(int([DynStat.Spe(-3),DynStat.Lib(1),DynStat.Sens(1),DynStat.Lust(4)].length) == 18)
            {
               KGAMECLASS.kGAMECLASS.player.dynStats([DynStat.Spe(-3),DynStat.Lib(1),DynStat.Sens(1),DynStat.Lust(4)][0],[DynStat.Spe(-3),DynStat.Lib(1),DynStat.Sens(1),DynStat.Lust(4)][1],[DynStat.Spe(-3),DynStat.Lib(1),DynStat.Sens(1),DynStat.Lust(4)][2],[DynStat.Spe(-3),DynStat.Lib(1),DynStat.Sens(1),DynStat.Lust(4)][3],[DynStat.Spe(-3),DynStat.Lib(1),DynStat.Sens(1),DynStat.Lust(4)][4],[DynStat.Spe(-3),DynStat.Lib(1),DynStat.Sens(1),DynStat.Lust(4)][5],[DynStat.Spe(-3),DynStat.Lib(1),DynStat.Sens(1),DynStat.Lust(4)][6],[DynStat.Spe(-3),DynStat.Lib(1),DynStat.Sens(1),DynStat.Lust(4)][7],[DynStat.Spe(-3),DynStat.Lib(1),DynStat.Sens(1),DynStat.Lust(4)][8],[DynStat.Spe(-3),DynStat.Lib(1),DynStat.Sens(1),DynStat.Lust(4)][9],[DynStat.Spe(-3),DynStat.Lib(1),DynStat.Sens(1),DynStat.Lust(4)][10],[DynStat.Spe(-3),DynStat.Lib(1),DynStat.Sens(1),DynStat.Lust(4)][11],[DynStat.Spe(-3),DynStat.Lib(1),DynStat.Sens(1),DynStat.Lust(4)][12],[DynStat.Spe(-3),DynStat.Lib(1),DynStat.Sens(1),DynStat.Lust(4)][13],[DynStat
               .Spe(-3),DynStat.Lib(1),DynStat.Sens(1),DynStat.Lust(4)][14],[DynStat.Spe(-3),DynStat.Lib(1),DynStat.Sens(1),DynStat.Lust(4)][15],[DynStat.Spe(-3),DynStat.Lib(1),DynStat.Sens(1),DynStat.Lust(4)][16],[DynStat.Spe(-3),DynStat.Lib(1),DynStat.Sens(1),DynStat.Lust(4)][17]);
            }
            else if(int([DynStat.Spe(-3),DynStat.Lib(1),DynStat.Sens(1),DynStat.Lust(4)].length) == 19)
            {
               KGAMECLASS.kGAMECLASS.player.dynStats([DynStat.Spe(-3),DynStat.Lib(1),DynStat.Sens(1),DynStat.Lust(4)][0],[DynStat.Spe(-3),DynStat.Lib(1),DynStat.Sens(1),DynStat.Lust(4)][1],[DynStat.Spe(-3),DynStat.Lib(1),DynStat.Sens(1),DynStat.Lust(4)][2],[DynStat.Spe(-3),DynStat.Lib(1),DynStat.Sens(1),DynStat.Lust(4)][3],[DynStat.Spe(-3),DynStat.Lib(1),DynStat.Sens(1),DynStat.Lust(4)][4],[DynStat.Spe(-3),DynStat.Lib(1),DynStat.Sens(1),DynStat.Lust(4)][5],[DynStat.Spe(-3),DynStat.Lib(1),DynStat.Sens(1),DynStat.Lust(4)][6],[DynStat.Spe(-3),DynStat.Lib(1),DynStat.Sens(1),DynStat.Lust(4)][7],[DynStat.Spe(-3),DynStat.Lib(1),DynStat.Sens(1),DynStat.Lust(4)][8],[DynStat.Spe(-3),DynStat.Lib(1),DynStat.Sens(1),DynStat.Lust(4)][9],[DynStat.Spe(-3),DynStat.Lib(1),DynStat.Sens(1),DynStat.Lust(4)][10],[DynStat.Spe(-3),DynStat.Lib(1),DynStat.Sens(1),DynStat.Lust(4)][11],[DynStat.Spe(-3),DynStat.Lib(1),DynStat.Sens(1),DynStat.Lust(4)][12],[DynStat.Spe(-3),DynStat.Lib(1),DynStat.Sens(1),DynStat.Lust(4)][13],[DynStat
               .Spe(-3),DynStat.Lib(1),DynStat.Sens(1),DynStat.Lust(4)][14],[DynStat.Spe(-3),DynStat.Lib(1),DynStat.Sens(1),DynStat.Lust(4)][15],[DynStat.Spe(-3),DynStat.Lib(1),DynStat.Sens(1),DynStat.Lust(4)][16],[DynStat.Spe(-3),DynStat.Lib(1),DynStat.Sens(1),DynStat.Lust(4)][17],[DynStat.Spe(-3),DynStat.Lib(1),DynStat.Sens(1),DynStat.Lust(4)][18]);
            }
            else
            {
               if(int([DynStat.Spe(-3),DynStat.Lib(1),DynStat.Sens(1),DynStat.Lust(4)].length) != 20)
               {
                  throw "Too many rest arguments";
               }
               KGAMECLASS.kGAMECLASS.player.dynStats([DynStat.Spe(-3),DynStat.Lib(1),DynStat.Sens(1),DynStat.Lust(4)][0],[DynStat.Spe(-3),DynStat.Lib(1),DynStat.Sens(1),DynStat.Lust(4)][1],[DynStat.Spe(-3),DynStat.Lib(1),DynStat.Sens(1),DynStat.Lust(4)][2],[DynStat.Spe(-3),DynStat.Lib(1),DynStat.Sens(1),DynStat.Lust(4)][3],[DynStat.Spe(-3),DynStat.Lib(1),DynStat.Sens(1),DynStat.Lust(4)][4],[DynStat.Spe(-3),DynStat.Lib(1),DynStat.Sens(1),DynStat.Lust(4)][5],[DynStat.Spe(-3),DynStat.Lib(1),DynStat.Sens(1),DynStat.Lust(4)][6],[DynStat.Spe(-3),DynStat.Lib(1),DynStat.Sens(1),DynStat.Lust(4)][7],[DynStat.Spe(-3),DynStat.Lib(1),DynStat.Sens(1),DynStat.Lust(4)][8],[DynStat.Spe(-3),DynStat.Lib(1),DynStat.Sens(1),DynStat.Lust(4)][9],[DynStat.Spe(-3),DynStat.Lib(1),DynStat.Sens(1),DynStat.Lust(4)][10],[DynStat.Spe(-3),DynStat.Lib(1),DynStat.Sens(1),DynStat.Lust(4)][11],[DynStat.Spe(-3),DynStat.Lib(1),DynStat.Sens(1),DynStat.Lust(4)][12],[DynStat.Spe(-3),DynStat.Lib(1),DynStat.Sens(1),DynStat.Lust(4)][13],[DynStat
               .Spe(-3),DynStat.Lib(1),DynStat.Sens(1),DynStat.Lust(4)][14],[DynStat.Spe(-3),DynStat.Lib(1),DynStat.Sens(1),DynStat.Lust(4)][15],[DynStat.Spe(-3),DynStat.Lib(1),DynStat.Sens(1),DynStat.Lust(4)][16],[DynStat.Spe(-3),DynStat.Lib(1),DynStat.Sens(1),DynStat.Lust(4)][17],[DynStat.Spe(-3),DynStat.Lib(1),DynStat.Sens(1),DynStat.Lust(4)][18],[DynStat.Spe(-3),DynStat.Lib(1),DynStat.Sens(1),DynStat.Lust(4)][19]);
            }
            _loc2_ = true;
         }
         if(_loc1_.get_pregnancyIncubation() == 48)
         {
            output.text("<b>孩子们频繁地踢动和蠕动。你的膀胱、胃和肺都感觉被挤压得很厉害。你很高兴他们很快就会从你体内出来了。</b>[pg]");
         }
         if(_loc1_.get_pregnancyIncubation() == 32 || _loc1_.get_pregnancyIncubation() == 64 || _loc1_.get_pregnancyIncubation() == 85 || _loc1_.get_pregnancyIncubation() == 150)
         {
            if(_loc1_.biggestTitSize() >= 3 && _loc1_.mostBreastsPerRow() > 1 && _loc1_.biggestLactation() >= 1 && _loc1_.biggestLactation() < 2)
            {
               output.text("你的乳房因为积聚了多余的乳汁而感到肿胀。[pg]");
               _loc1_.boostLactation(0.5);
            }
            if(_loc1_.biggestTitSize() >= 3 && _loc1_.mostBreastsPerRow() > 1 && _loc1_.biggestLactation() > 0 && _loc1_.biggestLactation() < 1)
            {
               output.text("随着你的身体为即将到来的分娩做准备，几滴母乳从你的乳头溢出。[pg]");
               _loc1_.boostLactation(0.5);
            }
            if(_loc1_.biggestTitSize() >= 3 && _loc1_.mostBreastsPerRow() > 1 && _loc1_.biggestLactation() == 0)
            {
               output.text("<b>你意识到你的乳房感觉很饱满，偶尔还会分泌乳汁</b>。这一定是因为怀孕了。[pg]");
               _loc1_.boostLactation(1);
            }
            if(_loc1_.biggestTitSize() == 2 && _loc1_.mostBreastsPerRow() > 1)
            {
               output.text("<b>你的乳房已经肿胀到了C罩杯，</b>这是为了迎接你即将到来的怀孕。[pg]");
               _loc1_.growTits(1,1,false,3);
            }
            if(_loc1_.biggestTitSize() == 1 && _loc1_.mostBreastsPerRow() > 1)
            {
               output.text("<b>你的乳房已经长到了B罩杯，</b>这可能是由于你怀孕期间的荷尔蒙变化。[pg]");
               _loc1_.growTits(1,1,false,3);
            }
         }
         return _loc2_;
      }
   }
}

