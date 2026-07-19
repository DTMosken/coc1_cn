package classes.scenes.monsters.pregnancies
{
   import classes.DynStat;
   import classes.Player;
   import classes.globalFlags.KGAMECLASS;
   import classes.internals.GuiOutput;
   import classes.internals.Utils;
   import classes.scenes.AnalPregnancy;
   import classes.scenes.PregnancyProgression;
   import flash.Boot;
   
   public class PlayerSandTrapFertilePregnancy implements AnalPregnancy
   {
      
      public var output:GuiOutput;
      
      public function PlayerSandTrapFertilePregnancy(param1:GuiOutput = undefined)
      {
         if(Boot.skip_constructor)
         {
            return;
         }
         output = param1;
         PregnancyProgression.registerAnalPregnancyScene(25,27,this);
      }
      
      public function updateAnalPregnancy() : Boolean
      {
         var _loc1_:Player = KGAMECLASS.kGAMECLASS.player;
         var _loc2_:Boolean = false;
         if(_loc1_.get_buttPregnancyIncubation() == 36)
         {
            output.text("<b>你的肠道发出奇怪的咕噜声，不安地蠕动着。你感到腹胀和饱腹感；这种感觉并不完全令人不快。</b>[pg]");
            _loc2_ = true;
         }
         if(_loc1_.get_buttPregnancyIncubation() == 20)
         {
            output.text("某种油腻的东西从你的括约肌滴落，弄脏了地面。你觉得你应该为此感到担心，但在你肠胃里翻滚的主要情绪是一种感官上的、顺从的平静。过去几天里在你的肠道中积累的压力不知怎么地感觉很对，而你的后庭正在滴落润滑液的事实让你感到难以置信的、反常的兴奋。当你站在那里，品味着那种湿润、舒缓的感觉时，一个幻想挤进了你的脑海，你四肢着地，让无数的生物使用你的屁股，被美丽、不可抑制的昆虫生物一遍又一遍地繁殖。你费了些力气压制住这些异样的情绪，继续前进，试图忽略偶尔从你的" + _loc1_.assholeDescript() + "渗出并弄脏你[armor]的油。[pg]");
            if(int([DynStat.Inte(-0.5),DynStat.Lust(500)].length) == 0)
            {
               KGAMECLASS.kGAMECLASS.player.dynStats();
            }
            else if(int([DynStat.Inte(-0.5),DynStat.Lust(500)].length) == 1)
            {
               KGAMECLASS.kGAMECLASS.player.dynStats([DynStat.Inte(-0.5),DynStat.Lust(500)][0]);
            }
            else if(int([DynStat.Inte(-0.5),DynStat.Lust(500)].length) == 2)
            {
               KGAMECLASS.kGAMECLASS.player.dynStats([DynStat.Inte(-0.5),DynStat.Lust(500)][0],[DynStat.Inte(-0.5),DynStat.Lust(500)][1]);
            }
            else if(int([DynStat.Inte(-0.5),DynStat.Lust(500)].length) == 3)
            {
               KGAMECLASS.kGAMECLASS.player.dynStats([DynStat.Inte(-0.5),DynStat.Lust(500)][0],[DynStat.Inte(-0.5),DynStat.Lust(500)][1],[DynStat.Inte(-0.5),DynStat.Lust(500)][2]);
            }
            else if(int([DynStat.Inte(-0.5),DynStat.Lust(500)].length) == 4)
            {
               KGAMECLASS.kGAMECLASS.player.dynStats([DynStat.Inte(-0.5),DynStat.Lust(500)][0],[DynStat.Inte(-0.5),DynStat.Lust(500)][1],[DynStat.Inte(-0.5),DynStat.Lust(500)][2],[DynStat.Inte(-0.5),DynStat.Lust(500)][3]);
            }
            else if(int([DynStat.Inte(-0.5),DynStat.Lust(500)].length) == 5)
            {
               KGAMECLASS.kGAMECLASS.player.dynStats([DynStat.Inte(-0.5),DynStat.Lust(500)][0],[DynStat.Inte(-0.5),DynStat.Lust(500)][1],[DynStat.Inte(-0.5),DynStat.Lust(500)][2],[DynStat.Inte(-0.5),DynStat.Lust(500)][3],[DynStat.Inte(-0.5),DynStat.Lust(500)][4]);
            }
            else if(int([DynStat.Inte(-0.5),DynStat.Lust(500)].length) == 6)
            {
               KGAMECLASS.kGAMECLASS.player.dynStats([DynStat.Inte(-0.5),DynStat.Lust(500)][0],[DynStat.Inte(-0.5),DynStat.Lust(500)][1],[DynStat.Inte(-0.5),DynStat.Lust(500)][2],[DynStat.Inte(-0.5),DynStat.Lust(500)][3],[DynStat.Inte(-0.5),DynStat.Lust(500)][4],[DynStat.Inte(-0.5),DynStat.Lust(500)][5]);
            }
            else if(int([DynStat.Inte(-0.5),DynStat.Lust(500)].length) == 7)
            {
               KGAMECLASS.kGAMECLASS.player.dynStats([DynStat.Inte(-0.5),DynStat.Lust(500)][0],[DynStat.Inte(-0.5),DynStat.Lust(500)][1],[DynStat.Inte(-0.5),DynStat.Lust(500)][2],[DynStat.Inte(-0.5),DynStat.Lust(500)][3],[DynStat.Inte(-0.5),DynStat.Lust(500)][4],[DynStat.Inte(-0.5),DynStat.Lust(500)][5],[DynStat.Inte(-0.5),DynStat.Lust(500)][6]);
            }
            else if(int([DynStat.Inte(-0.5),DynStat.Lust(500)].length) == 8)
            {
               KGAMECLASS.kGAMECLASS.player.dynStats([DynStat.Inte(-0.5),DynStat.Lust(500)][0],[DynStat.Inte(-0.5),DynStat.Lust(500)][1],[DynStat.Inte(-0.5),DynStat.Lust(500)][2],[DynStat.Inte(-0.5),DynStat.Lust(500)][3],[DynStat.Inte(-0.5),DynStat.Lust(500)][4],[DynStat.Inte(-0.5),DynStat.Lust(500)][5],[DynStat.Inte(-0.5),DynStat.Lust(500)][6],[DynStat.Inte(-0.5),DynStat.Lust(500)][7]);
            }
            else if(int([DynStat.Inte(-0.5),DynStat.Lust(500)].length) == 9)
            {
               KGAMECLASS.kGAMECLASS.player.dynStats([DynStat.Inte(-0.5),DynStat.Lust(500)][0],[DynStat.Inte(-0.5),DynStat.Lust(500)][1],[DynStat.Inte(-0.5),DynStat.Lust(500)][2],[DynStat.Inte(-0.5),DynStat.Lust(500)][3],[DynStat.Inte(-0.5),DynStat.Lust(500)][4],[DynStat.Inte(-0.5),DynStat.Lust(500)][5],[DynStat.Inte(-0.5),DynStat.Lust(500)][6],[DynStat.Inte(-0.5),DynStat.Lust(500)][7],[DynStat.Inte(-0.5),DynStat.Lust(500)][8]);
            }
            else if(int([DynStat.Inte(-0.5),DynStat.Lust(500)].length) == 10)
            {
               KGAMECLASS.kGAMECLASS.player.dynStats([DynStat.Inte(-0.5),DynStat.Lust(500)][0],[DynStat.Inte(-0.5),DynStat.Lust(500)][1],[DynStat.Inte(-0.5),DynStat.Lust(500)][2],[DynStat.Inte(-0.5),DynStat.Lust(500)][3],[DynStat.Inte(-0.5),DynStat.Lust(500)][4],[DynStat.Inte(-0.5),DynStat.Lust(500)][5],[DynStat.Inte(-0.5),DynStat.Lust(500)][6],[DynStat.Inte(-0.5),DynStat.Lust(500)][7],[DynStat.Inte(-0.5),DynStat.Lust(500)][8],[DynStat.Inte(-0.5),DynStat.Lust(500)][9]);
            }
            else if(int([DynStat.Inte(-0.5),DynStat.Lust(500)].length) == 11)
            {
               KGAMECLASS.kGAMECLASS.player.dynStats([DynStat.Inte(-0.5),DynStat.Lust(500)][0],[DynStat.Inte(-0.5),DynStat.Lust(500)][1],[DynStat.Inte(-0.5),DynStat.Lust(500)][2],[DynStat.Inte(-0.5),DynStat.Lust(500)][3],[DynStat.Inte(-0.5),DynStat.Lust(500)][4],[DynStat.Inte(-0.5),DynStat.Lust(500)][5],[DynStat.Inte(-0.5),DynStat.Lust(500)][6],[DynStat.Inte(-0.5),DynStat.Lust(500)][7],[DynStat.Inte(-0.5),DynStat.Lust(500)][8],[DynStat.Inte(-0.5),DynStat.Lust(500)][9],[DynStat.Inte(-0.5),DynStat.Lust(500)][10]);
            }
            else if(int([DynStat.Inte(-0.5),DynStat.Lust(500)].length) == 12)
            {
               KGAMECLASS.kGAMECLASS.player.dynStats([DynStat.Inte(-0.5),DynStat.Lust(500)][0],[DynStat.Inte(-0.5),DynStat.Lust(500)][1],[DynStat.Inte(-0.5),DynStat.Lust(500)][2],[DynStat.Inte(-0.5),DynStat.Lust(500)][3],[DynStat.Inte(-0.5),DynStat.Lust(500)][4],[DynStat.Inte(-0.5),DynStat.Lust(500)][5],[DynStat.Inte(-0.5),DynStat.Lust(500)][6],[DynStat.Inte(-0.5),DynStat.Lust(500)][7],[DynStat.Inte(-0.5),DynStat.Lust(500)][8],[DynStat.Inte(-0.5),DynStat.Lust(500)][9],[DynStat.Inte(-0.5),DynStat.Lust(500)][10],[DynStat.Inte(-0.5),DynStat.Lust(500)][11]);
            }
            else if(int([DynStat.Inte(-0.5),DynStat.Lust(500)].length) == 13)
            {
               KGAMECLASS.kGAMECLASS.player.dynStats([DynStat.Inte(-0.5),DynStat.Lust(500)][0],[DynStat.Inte(-0.5),DynStat.Lust(500)][1],[DynStat.Inte(-0.5),DynStat.Lust(500)][2],[DynStat.Inte(-0.5),DynStat.Lust(500)][3],[DynStat.Inte(-0.5),DynStat.Lust(500)][4],[DynStat.Inte(-0.5),DynStat.Lust(500)][5],[DynStat.Inte(-0.5),DynStat.Lust(500)][6],[DynStat.Inte(-0.5),DynStat.Lust(500)][7],[DynStat.Inte(-0.5),DynStat.Lust(500)][8],[DynStat.Inte(-0.5),DynStat.Lust(500)][9],[DynStat.Inte(-0.5),DynStat.Lust(500)][10],[DynStat.Inte(-0.5),DynStat.Lust(500)][11],[DynStat.Inte(-0.5),DynStat.Lust(500)][12]);
            }
            else if(int([DynStat.Inte(-0.5),DynStat.Lust(500)].length) == 14)
            {
               KGAMECLASS.kGAMECLASS.player.dynStats([DynStat.Inte(-0.5),DynStat.Lust(500)][0],[DynStat.Inte(-0.5),DynStat.Lust(500)][1],[DynStat.Inte(-0.5),DynStat.Lust(500)][2],[DynStat.Inte(-0.5),DynStat.Lust(500)][3],[DynStat.Inte(-0.5),DynStat.Lust(500)][4],[DynStat.Inte(-0.5),DynStat.Lust(500)][5],[DynStat.Inte(-0.5),DynStat.Lust(500)][6],[DynStat.Inte(-0.5),DynStat.Lust(500)][7],[DynStat.Inte(-0.5),DynStat.Lust(500)][8],[DynStat.Inte(-0.5),DynStat.Lust(500)][9],[DynStat.Inte(-0.5),DynStat.Lust(500)][10],[DynStat.Inte(-0.5),DynStat.Lust(500)][11],[DynStat.Inte(-0.5),DynStat.Lust(500)][12],[DynStat.Inte(-0.5),DynStat.Lust(500)][13]);
            }
            else if(int([DynStat.Inte(-0.5),DynStat.Lust(500)].length) == 15)
            {
               KGAMECLASS.kGAMECLASS.player.dynStats([DynStat.Inte(-0.5),DynStat.Lust(500)][0],[DynStat.Inte(-0.5),DynStat.Lust(500)][1],[DynStat.Inte(-0.5),DynStat.Lust(500)][2],[DynStat.Inte(-0.5),DynStat.Lust(500)][3],[DynStat.Inte(-0.5),DynStat.Lust(500)][4],[DynStat.Inte(-0.5),DynStat.Lust(500)][5],[DynStat.Inte(-0.5),DynStat.Lust(500)][6],[DynStat.Inte(-0.5),DynStat.Lust(500)][7],[DynStat.Inte(-0.5),DynStat.Lust(500)][8],[DynStat.Inte(-0.5),DynStat.Lust(500)][9],[DynStat.Inte(-0.5),DynStat.Lust(500)][10],[DynStat.Inte(-0.5),DynStat.Lust(500)][11],[DynStat.Inte(-0.5),DynStat.Lust(500)][12],[DynStat.Inte(-0.5),DynStat.Lust(500)][13],[DynStat.Inte(-0.5),DynStat.Lust(500)][14]);
            }
            else if(int([DynStat.Inte(-0.5),DynStat.Lust(500)].length) == 16)
            {
               KGAMECLASS.kGAMECLASS.player.dynStats([DynStat.Inte(-0.5),DynStat.Lust(500)][0],[DynStat.Inte(-0.5),DynStat.Lust(500)][1],[DynStat.Inte(-0.5),DynStat.Lust(500)][2],[DynStat.Inte(-0.5),DynStat.Lust(500)][3],[DynStat.Inte(-0.5),DynStat.Lust(500)][4],[DynStat.Inte(-0.5),DynStat.Lust(500)][5],[DynStat.Inte(-0.5),DynStat.Lust(500)][6],[DynStat.Inte(-0.5),DynStat.Lust(500)][7],[DynStat.Inte(-0.5),DynStat.Lust(500)][8],[DynStat.Inte(-0.5),DynStat.Lust(500)][9],[DynStat.Inte(-0.5),DynStat.Lust(500)][10],[DynStat.Inte(-0.5),DynStat.Lust(500)][11],[DynStat.Inte(-0.5),DynStat.Lust(500)][12],[DynStat.Inte(-0.5),DynStat.Lust(500)][13],[DynStat.Inte(-0.5),DynStat.Lust(500)][14],[DynStat.Inte(-0.5),DynStat.Lust(500)][15]);
            }
            else if(int([DynStat.Inte(-0.5),DynStat.Lust(500)].length) == 17)
            {
               KGAMECLASS.kGAMECLASS.player.dynStats([DynStat.Inte(-0.5),DynStat.Lust(500)][0],[DynStat.Inte(-0.5),DynStat.Lust(500)][1],[DynStat.Inte(-0.5),DynStat.Lust(500)][2],[DynStat.Inte(-0.5),DynStat.Lust(500)][3],[DynStat.Inte(-0.5),DynStat.Lust(500)][4],[DynStat.Inte(-0.5),DynStat.Lust(500)][5],[DynStat.Inte(-0.5),DynStat.Lust(500)][6],[DynStat.Inte(-0.5),DynStat.Lust(500)][7],[DynStat.Inte(-0.5),DynStat.Lust(500)][8],[DynStat.Inte(-0.5),DynStat.Lust(500)][9],[DynStat.Inte(-0.5),DynStat.Lust(500)][10],[DynStat.Inte(-0.5),DynStat.Lust(500)][11],[DynStat.Inte(-0.5),DynStat.Lust(500)][12],[DynStat.Inte(-0.5),DynStat.Lust(500)][13],[DynStat.Inte(-0.5),DynStat.Lust(500)][14],[DynStat.Inte(-0.5),DynStat.Lust(500)][15],[DynStat.Inte(-0.5),DynStat.Lust(500)][16]);
            }
            else if(int([DynStat.Inte(-0.5),DynStat.Lust(500)].length) == 18)
            {
               KGAMECLASS.kGAMECLASS.player.dynStats([DynStat.Inte(-0.5),DynStat.Lust(500)][0],[DynStat.Inte(-0.5),DynStat.Lust(500)][1],[DynStat.Inte(-0.5),DynStat.Lust(500)][2],[DynStat.Inte(-0.5),DynStat.Lust(500)][3],[DynStat.Inte(-0.5),DynStat.Lust(500)][4],[DynStat.Inte(-0.5),DynStat.Lust(500)][5],[DynStat.Inte(-0.5),DynStat.Lust(500)][6],[DynStat.Inte(-0.5),DynStat.Lust(500)][7],[DynStat.Inte(-0.5),DynStat.Lust(500)][8],[DynStat.Inte(-0.5),DynStat.Lust(500)][9],[DynStat.Inte(-0.5),DynStat.Lust(500)][10],[DynStat.Inte(-0.5),DynStat.Lust(500)][11],[DynStat.Inte(-0.5),DynStat.Lust(500)][12],[DynStat.Inte(-0.5),DynStat.Lust(500)][13],[DynStat.Inte(-0.5),DynStat.Lust(500)][14],[DynStat.Inte(-0.5),DynStat.Lust(500)][15],[DynStat.Inte(-0.5),DynStat.Lust(500)][16],[DynStat.Inte(-0.5),DynStat.Lust(500)][17]);
            }
            else if(int([DynStat.Inte(-0.5),DynStat.Lust(500)].length) == 19)
            {
               KGAMECLASS.kGAMECLASS.player.dynStats([DynStat.Inte(-0.5),DynStat.Lust(500)][0],[DynStat.Inte(-0.5),DynStat.Lust(500)][1],[DynStat.Inte(-0.5),DynStat.Lust(500)][2],[DynStat.Inte(-0.5),DynStat.Lust(500)][3],[DynStat.Inte(-0.5),DynStat.Lust(500)][4],[DynStat.Inte(-0.5),DynStat.Lust(500)][5],[DynStat.Inte(-0.5),DynStat.Lust(500)][6],[DynStat.Inte(-0.5),DynStat.Lust(500)][7],[DynStat.Inte(-0.5),DynStat.Lust(500)][8],[DynStat.Inte(-0.5),DynStat.Lust(500)][9],[DynStat.Inte(-0.5),DynStat.Lust(500)][10],[DynStat.Inte(-0.5),DynStat.Lust(500)][11],[DynStat.Inte(-0.5),DynStat.Lust(500)][12],[DynStat.Inte(-0.5),DynStat.Lust(500)][13],[DynStat.Inte(-0.5),DynStat.Lust(500)][14],[DynStat.Inte(-0.5),DynStat.Lust(500)][15],[DynStat.Inte(-0.5),DynStat.Lust(500)][16],[DynStat.Inte(-0.5),DynStat.Lust(500)][17],[DynStat.Inte(-0.5),DynStat.Lust(500)][18]);
            }
            else
            {
               if(int([DynStat.Inte(-0.5),DynStat.Lust(500)].length) != 20)
               {
                  throw "Too many rest arguments";
               }
               KGAMECLASS.kGAMECLASS.player.dynStats([DynStat.Inte(-0.5),DynStat.Lust(500)][0],[DynStat.Inte(-0.5),DynStat.Lust(500)][1],[DynStat.Inte(-0.5),DynStat.Lust(500)][2],[DynStat.Inte(-0.5),DynStat.Lust(500)][3],[DynStat.Inte(-0.5),DynStat.Lust(500)][4],[DynStat.Inte(-0.5),DynStat.Lust(500)][5],[DynStat.Inte(-0.5),DynStat.Lust(500)][6],[DynStat.Inte(-0.5),DynStat.Lust(500)][7],[DynStat.Inte(-0.5),DynStat.Lust(500)][8],[DynStat.Inte(-0.5),DynStat.Lust(500)][9],[DynStat.Inte(-0.5),DynStat.Lust(500)][10],[DynStat.Inte(-0.5),DynStat.Lust(500)][11],[DynStat.Inte(-0.5),DynStat.Lust(500)][12],[DynStat.Inte(-0.5),DynStat.Lust(500)][13],[DynStat.Inte(-0.5),DynStat.Lust(500)][14],[DynStat.Inte(-0.5),DynStat.Lust(500)][15],[DynStat.Inte(-0.5),DynStat.Lust(500)][16],[DynStat.Inte(-0.5),DynStat.Lust(500)][17],[DynStat.Inte(-0.5),DynStat.Lust(500)][18],[DynStat.Inte(-0.5),DynStat.Lust(500)][19]);
            }
            _loc2_ = true;
         }
         return _loc2_;
      }
      
      public function analBirth() : void
      {
         var _loc1_:Player = KGAMECLASS.kGAMECLASS.player;
         var _loc2_:Boolean = false;
         KGAMECLASS.kGAMECLASS.desert.sandTrapScene.birfSandTarps();
         if(_loc1_.butt.rating < 17)
         {
            if(_loc1_.butt.rating < 13)
            {
               _temp_1.rating += 1;
               output.text("你注意到你的" + _loc1_.buttDescript() + "在经历了这场折磨后感觉更大更丰满了。[pg]");
            }
            else if(Utils.rand(2) == 0)
            {
               _temp_2.rating += 1;
               output.text("你注意到你的" + _loc1_.buttDescript() + "在经历了这场折磨后感觉更大更丰满了。[pg]");
            }
         }
         _loc2_ = true;
      }
   }
}

