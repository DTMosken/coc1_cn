package classes.scenes.monsters.pregnancies
{
   import classes.DynStat;
   import classes.Player;
   import classes.globalFlags.KGAMECLASS;
   import classes.internals.GuiOutput;
   import classes.scenes.AnalPregnancy;
   import classes.scenes.PregnancyProgression;
   import classes.scenes.VaginalPregnancy;
   import flash.Boot;
   
   public class PlayerDriderPregnancy implements AnalPregnancy, VaginalPregnancy
   {
      
      public var output:GuiOutput;
      
      public function PlayerDriderPregnancy(param1:GuiOutput = undefined)
      {
         if(Boot.skip_constructor)
         {
            return;
         }
         output = param1;
         PregnancyProgression.registerVaginalPregnancyScene(25,15,this);
         PregnancyProgression.registerAnalPregnancyScene(25,15,this);
      }
      
      public function vaginalBirth() : void
      {
         KGAMECLASS.kGAMECLASS.swamp.corruptedDriderScene.driderPregVagBirth();
      }
      
      public function updateVaginalPregnancy() : Boolean
      {
         var _loc1_:Player = KGAMECLASS.kGAMECLASS.player;
         var _loc2_:Boolean = false;
         if(_loc1_.get_pregnancyIncubation() == 399)
         {
            output.text("<b>在与蜘蛛交媾之后，你感觉……充实多了。就你所见，你的身体并没有什么外在的变化，但每当你移动时，你的子宫都会感到轻微的刺痛。希望这没什么大不了的。</b>[pg]");
            _loc2_ = true;
         }
         if(_loc1_.get_pregnancyIncubation() == 275)
         {
            output.text("<b>你的肚子咕咕叫着，好像空了一样，尽管你不久前才吃过东西。也许是因为你运动量太大了，只需要多吃一点就行了。</b>[pg]");
            _loc2_ = true;
         }
         if(_loc1_.get_pregnancyIncubation() == 250)
         {
            output.text("<b>你的肚子看起来有点胖乎乎的");
            if(_loc1_.thickness > 60 && _loc1_.tone < 40)
            {
               output.text(" 甚至对你来说");
            }
            output.text("，也许你应该减少最近摄入的食物量？</b>[pg]");
            _loc2_ = true;
         }
         if(_loc1_.get_pregnancyIncubation() == 216)
         {
            output.text("<b>你的肚子肯定变大了，而且无论你怎么做，只要一感到饥饿，你就无法控制自己去吃东西。你唯一能想到的解释就是你在旅行中怀孕了。希望这不会妨碍你的冒险。</b>[pg]");
            _loc2_ = true;
         }
         if(_loc1_.get_pregnancyIncubation() == 180)
         {
            KGAMECLASS.kGAMECLASS.images.showImage("spidermorph-male-loss-vag");
            output.text("<b>一阵燥热传遍全身，发情的");
            output.text("蛛化精灵");
            output.text("的画面很快占据了你的脑海。你开始把玩着乳头，沉浸在幻想中，想象着被蛛网绑起来，被一遍又一遍地交配，被一群饥渴的雄性侵犯，每个人都希望能成为你下一窝孩子的父亲。你从幻想中挣脱出来，注意到你的手正在抚摸着你微微隆起的肚子。也许这也没那么糟糕？</b>[pg]");
            if(int([DynStat.Lib(1),DynStat.Sens(1),DynStat.Lust(20)].length) == 0)
            {
               KGAMECLASS.kGAMECLASS.player.dynStats();
            }
            else if(int([DynStat.Lib(1),DynStat.Sens(1),DynStat.Lust(20)].length) == 1)
            {
               KGAMECLASS.kGAMECLASS.player.dynStats([DynStat.Lib(1),DynStat.Sens(1),DynStat.Lust(20)][0]);
            }
            else if(int([DynStat.Lib(1),DynStat.Sens(1),DynStat.Lust(20)].length) == 2)
            {
               KGAMECLASS.kGAMECLASS.player.dynStats([DynStat.Lib(1),DynStat.Sens(1),DynStat.Lust(20)][0],[DynStat.Lib(1),DynStat.Sens(1),DynStat.Lust(20)][1]);
            }
            else if(int([DynStat.Lib(1),DynStat.Sens(1),DynStat.Lust(20)].length) == 3)
            {
               KGAMECLASS.kGAMECLASS.player.dynStats([DynStat.Lib(1),DynStat.Sens(1),DynStat.Lust(20)][0],[DynStat.Lib(1),DynStat.Sens(1),DynStat.Lust(20)][1],[DynStat.Lib(1),DynStat.Sens(1),DynStat.Lust(20)][2]);
            }
            else if(int([DynStat.Lib(1),DynStat.Sens(1),DynStat.Lust(20)].length) == 4)
            {
               KGAMECLASS.kGAMECLASS.player.dynStats([DynStat.Lib(1),DynStat.Sens(1),DynStat.Lust(20)][0],[DynStat.Lib(1),DynStat.Sens(1),DynStat.Lust(20)][1],[DynStat.Lib(1),DynStat.Sens(1),DynStat.Lust(20)][2],[DynStat.Lib(1),DynStat.Sens(1),DynStat.Lust(20)][3]);
            }
            else if(int([DynStat.Lib(1),DynStat.Sens(1),DynStat.Lust(20)].length) == 5)
            {
               KGAMECLASS.kGAMECLASS.player.dynStats([DynStat.Lib(1),DynStat.Sens(1),DynStat.Lust(20)][0],[DynStat.Lib(1),DynStat.Sens(1),DynStat.Lust(20)][1],[DynStat.Lib(1),DynStat.Sens(1),DynStat.Lust(20)][2],[DynStat.Lib(1),DynStat.Sens(1),DynStat.Lust(20)][3],[DynStat.Lib(1),DynStat.Sens(1),DynStat.Lust(20)][4]);
            }
            else if(int([DynStat.Lib(1),DynStat.Sens(1),DynStat.Lust(20)].length) == 6)
            {
               KGAMECLASS.kGAMECLASS.player.dynStats([DynStat.Lib(1),DynStat.Sens(1),DynStat.Lust(20)][0],[DynStat.Lib(1),DynStat.Sens(1),DynStat.Lust(20)][1],[DynStat.Lib(1),DynStat.Sens(1),DynStat.Lust(20)][2],[DynStat.Lib(1),DynStat.Sens(1),DynStat.Lust(20)][3],[DynStat.Lib(1),DynStat.Sens(1),DynStat.Lust(20)][4],[DynStat.Lib(1),DynStat.Sens(1),DynStat.Lust(20)][5]);
            }
            else if(int([DynStat.Lib(1),DynStat.Sens(1),DynStat.Lust(20)].length) == 7)
            {
               KGAMECLASS.kGAMECLASS.player.dynStats([DynStat.Lib(1),DynStat.Sens(1),DynStat.Lust(20)][0],[DynStat.Lib(1),DynStat.Sens(1),DynStat.Lust(20)][1],[DynStat.Lib(1),DynStat.Sens(1),DynStat.Lust(20)][2],[DynStat.Lib(1),DynStat.Sens(1),DynStat.Lust(20)][3],[DynStat.Lib(1),DynStat.Sens(1),DynStat.Lust(20)][4],[DynStat.Lib(1),DynStat.Sens(1),DynStat.Lust(20)][5],[DynStat.Lib(1),DynStat.Sens(1),DynStat.Lust(20)][6]);
            }
            else if(int([DynStat.Lib(1),DynStat.Sens(1),DynStat.Lust(20)].length) == 8)
            {
               KGAMECLASS.kGAMECLASS.player.dynStats([DynStat.Lib(1),DynStat.Sens(1),DynStat.Lust(20)][0],[DynStat.Lib(1),DynStat.Sens(1),DynStat.Lust(20)][1],[DynStat.Lib(1),DynStat.Sens(1),DynStat.Lust(20)][2],[DynStat.Lib(1),DynStat.Sens(1),DynStat.Lust(20)][3],[DynStat.Lib(1),DynStat.Sens(1),DynStat.Lust(20)][4],[DynStat.Lib(1),DynStat.Sens(1),DynStat.Lust(20)][5],[DynStat.Lib(1),DynStat.Sens(1),DynStat.Lust(20)][6],[DynStat.Lib(1),DynStat.Sens(1),DynStat.Lust(20)][7]);
            }
            else if(int([DynStat.Lib(1),DynStat.Sens(1),DynStat.Lust(20)].length) == 9)
            {
               KGAMECLASS.kGAMECLASS.player.dynStats([DynStat.Lib(1),DynStat.Sens(1),DynStat.Lust(20)][0],[DynStat.Lib(1),DynStat.Sens(1),DynStat.Lust(20)][1],[DynStat.Lib(1),DynStat.Sens(1),DynStat.Lust(20)][2],[DynStat.Lib(1),DynStat.Sens(1),DynStat.Lust(20)][3],[DynStat.Lib(1),DynStat.Sens(1),DynStat.Lust(20)][4],[DynStat.Lib(1),DynStat.Sens(1),DynStat.Lust(20)][5],[DynStat.Lib(1),DynStat.Sens(1),DynStat.Lust(20)][6],[DynStat.Lib(1),DynStat.Sens(1),DynStat.Lust(20)][7],[DynStat.Lib(1),DynStat.Sens(1),DynStat.Lust(20)][8]);
            }
            else if(int([DynStat.Lib(1),DynStat.Sens(1),DynStat.Lust(20)].length) == 10)
            {
               KGAMECLASS.kGAMECLASS.player.dynStats([DynStat.Lib(1),DynStat.Sens(1),DynStat.Lust(20)][0],[DynStat.Lib(1),DynStat.Sens(1),DynStat.Lust(20)][1],[DynStat.Lib(1),DynStat.Sens(1),DynStat.Lust(20)][2],[DynStat.Lib(1),DynStat.Sens(1),DynStat.Lust(20)][3],[DynStat.Lib(1),DynStat.Sens(1),DynStat.Lust(20)][4],[DynStat.Lib(1),DynStat.Sens(1),DynStat.Lust(20)][5],[DynStat.Lib(1),DynStat.Sens(1),DynStat.Lust(20)][6],[DynStat.Lib(1),DynStat.Sens(1),DynStat.Lust(20)][7],[DynStat.Lib(1),DynStat.Sens(1),DynStat.Lust(20)][8],[DynStat.Lib(1),DynStat.Sens(1),DynStat.Lust(20)][9]);
            }
            else if(int([DynStat.Lib(1),DynStat.Sens(1),DynStat.Lust(20)].length) == 11)
            {
               KGAMECLASS.kGAMECLASS.player.dynStats([DynStat.Lib(1),DynStat.Sens(1),DynStat.Lust(20)][0],[DynStat.Lib(1),DynStat.Sens(1),DynStat.Lust(20)][1],[DynStat.Lib(1),DynStat.Sens(1),DynStat.Lust(20)][2],[DynStat.Lib(1),DynStat.Sens(1),DynStat.Lust(20)][3],[DynStat.Lib(1),DynStat.Sens(1),DynStat.Lust(20)][4],[DynStat.Lib(1),DynStat.Sens(1),DynStat.Lust(20)][5],[DynStat.Lib(1),DynStat.Sens(1),DynStat.Lust(20)][6],[DynStat.Lib(1),DynStat.Sens(1),DynStat.Lust(20)][7],[DynStat.Lib(1),DynStat.Sens(1),DynStat.Lust(20)][8],[DynStat.Lib(1),DynStat.Sens(1),DynStat.Lust(20)][9],[DynStat.Lib(1),DynStat.Sens(1),DynStat.Lust(20)][10]);
            }
            else if(int([DynStat.Lib(1),DynStat.Sens(1),DynStat.Lust(20)].length) == 12)
            {
               KGAMECLASS.kGAMECLASS.player.dynStats([DynStat.Lib(1),DynStat.Sens(1),DynStat.Lust(20)][0],[DynStat.Lib(1),DynStat.Sens(1),DynStat.Lust(20)][1],[DynStat.Lib(1),DynStat.Sens(1),DynStat.Lust(20)][2],[DynStat.Lib(1),DynStat.Sens(1),DynStat.Lust(20)][3],[DynStat.Lib(1),DynStat.Sens(1),DynStat.Lust(20)][4],[DynStat.Lib(1),DynStat.Sens(1),DynStat.Lust(20)][5],[DynStat.Lib(1),DynStat.Sens(1),DynStat.Lust(20)][6],[DynStat.Lib(1),DynStat.Sens(1),DynStat.Lust(20)][7],[DynStat.Lib(1),DynStat.Sens(1),DynStat.Lust(20)][8],[DynStat.Lib(1),DynStat.Sens(1),DynStat.Lust(20)][9],[DynStat.Lib(1),DynStat.Sens(1),DynStat.Lust(20)][10],[DynStat.Lib(1),DynStat.Sens(1),DynStat.Lust(20)][11]);
            }
            else if(int([DynStat.Lib(1),DynStat.Sens(1),DynStat.Lust(20)].length) == 13)
            {
               KGAMECLASS.kGAMECLASS.player.dynStats([DynStat.Lib(1),DynStat.Sens(1),DynStat.Lust(20)][0],[DynStat.Lib(1),DynStat.Sens(1),DynStat.Lust(20)][1],[DynStat.Lib(1),DynStat.Sens(1),DynStat.Lust(20)][2],[DynStat.Lib(1),DynStat.Sens(1),DynStat.Lust(20)][3],[DynStat.Lib(1),DynStat.Sens(1),DynStat.Lust(20)][4],[DynStat.Lib(1),DynStat.Sens(1),DynStat.Lust(20)][5],[DynStat.Lib(1),DynStat.Sens(1),DynStat.Lust(20)][6],[DynStat.Lib(1),DynStat.Sens(1),DynStat.Lust(20)][7],[DynStat.Lib(1),DynStat.Sens(1),DynStat.Lust(20)][8],[DynStat.Lib(1),DynStat.Sens(1),DynStat.Lust(20)][9],[DynStat.Lib(1),DynStat.Sens(1),DynStat.Lust(20)][10],[DynStat.Lib(1),DynStat.Sens(1),DynStat.Lust(20)][11],[DynStat.Lib(1),DynStat.Sens(1),DynStat.Lust(20)][12]);
            }
            else if(int([DynStat.Lib(1),DynStat.Sens(1),DynStat.Lust(20)].length) == 14)
            {
               KGAMECLASS.kGAMECLASS.player.dynStats([DynStat.Lib(1),DynStat.Sens(1),DynStat.Lust(20)][0],[DynStat.Lib(1),DynStat.Sens(1),DynStat.Lust(20)][1],[DynStat.Lib(1),DynStat.Sens(1),DynStat.Lust(20)][2],[DynStat.Lib(1),DynStat.Sens(1),DynStat.Lust(20)][3],[DynStat.Lib(1),DynStat.Sens(1),DynStat.Lust(20)][4],[DynStat.Lib(1),DynStat.Sens(1),DynStat.Lust(20)][5],[DynStat.Lib(1),DynStat.Sens(1),DynStat.Lust(20)][6],[DynStat.Lib(1),DynStat.Sens(1),DynStat.Lust(20)][7],[DynStat.Lib(1),DynStat.Sens(1),DynStat.Lust(20)][8],[DynStat.Lib(1),DynStat.Sens(1),DynStat.Lust(20)][9],[DynStat.Lib(1),DynStat.Sens(1),DynStat.Lust(20)][10],[DynStat.Lib(1),DynStat.Sens(1),DynStat.Lust(20)][11],[DynStat.Lib(1),DynStat.Sens(1),DynStat.Lust(20)][12],[DynStat.Lib(1),DynStat.Sens(1),DynStat.Lust(20)][13]);
            }
            else if(int([DynStat.Lib(1),DynStat.Sens(1),DynStat.Lust(20)].length) == 15)
            {
               KGAMECLASS.kGAMECLASS.player.dynStats([DynStat.Lib(1),DynStat.Sens(1),DynStat.Lust(20)][0],[DynStat.Lib(1),DynStat.Sens(1),DynStat.Lust(20)][1],[DynStat.Lib(1),DynStat.Sens(1),DynStat.Lust(20)][2],[DynStat.Lib(1),DynStat.Sens(1),DynStat.Lust(20)][3],[DynStat.Lib(1),DynStat.Sens(1),DynStat.Lust(20)][4],[DynStat.Lib(1),DynStat.Sens(1),DynStat.Lust(20)][5],[DynStat.Lib(1),DynStat.Sens(1),DynStat.Lust(20)][6],[DynStat.Lib(1),DynStat.Sens(1),DynStat.Lust(20)][7],[DynStat.Lib(1),DynStat.Sens(1),DynStat.Lust(20)][8],[DynStat.Lib(1),DynStat.Sens(1),DynStat.Lust(20)][9],[DynStat.Lib(1),DynStat.Sens(1),DynStat.Lust(20)][10],[DynStat.Lib(1),DynStat.Sens(1),DynStat.Lust(20)][11],[DynStat.Lib(1),DynStat.Sens(1),DynStat.Lust(20)][12],[DynStat.Lib(1),DynStat.Sens(1),DynStat.Lust(20)][13],[DynStat.Lib(1),DynStat.Sens(1),DynStat.Lust(20)][14]);
            }
            else if(int([DynStat.Lib(1),DynStat.Sens(1),DynStat.Lust(20)].length) == 16)
            {
               KGAMECLASS.kGAMECLASS.player.dynStats([DynStat.Lib(1),DynStat.Sens(1),DynStat.Lust(20)][0],[DynStat.Lib(1),DynStat.Sens(1),DynStat.Lust(20)][1],[DynStat.Lib(1),DynStat.Sens(1),DynStat.Lust(20)][2],[DynStat.Lib(1),DynStat.Sens(1),DynStat.Lust(20)][3],[DynStat.Lib(1),DynStat.Sens(1),DynStat.Lust(20)][4],[DynStat.Lib(1),DynStat.Sens(1),DynStat.Lust(20)][5],[DynStat.Lib(1),DynStat.Sens(1),DynStat.Lust(20)][6],[DynStat.Lib(1),DynStat.Sens(1),DynStat.Lust(20)][7],[DynStat.Lib(1),DynStat.Sens(1),DynStat.Lust(20)][8],[DynStat.Lib(1),DynStat.Sens(1),DynStat.Lust(20)][9],[DynStat.Lib(1),DynStat.Sens(1),DynStat.Lust(20)][10],[DynStat.Lib(1),DynStat.Sens(1),DynStat.Lust(20)][11],[DynStat.Lib(1),DynStat.Sens(1),DynStat.Lust(20)][12],[DynStat.Lib(1),DynStat.Sens(1),DynStat.Lust(20)][13],[DynStat.Lib(1),DynStat.Sens(1),DynStat.Lust(20)][14],[DynStat.Lib(1),DynStat.Sens(1),DynStat.Lust(20)][15]);
            }
            else if(int([DynStat.Lib(1),DynStat.Sens(1),DynStat.Lust(20)].length) == 17)
            {
               KGAMECLASS.kGAMECLASS.player.dynStats([DynStat.Lib(1),DynStat.Sens(1),DynStat.Lust(20)][0],[DynStat.Lib(1),DynStat.Sens(1),DynStat.Lust(20)][1],[DynStat.Lib(1),DynStat.Sens(1),DynStat.Lust(20)][2],[DynStat.Lib(1),DynStat.Sens(1),DynStat.Lust(20)][3],[DynStat.Lib(1),DynStat.Sens(1),DynStat.Lust(20)][4],[DynStat.Lib(1),DynStat.Sens(1),DynStat.Lust(20)][5],[DynStat.Lib(1),DynStat.Sens(1),DynStat.Lust(20)][6],[DynStat.Lib(1),DynStat.Sens(1),DynStat.Lust(20)][7],[DynStat.Lib(1),DynStat.Sens(1),DynStat.Lust(20)][8],[DynStat.Lib(1),DynStat.Sens(1),DynStat.Lust(20)][9],[DynStat.Lib(1),DynStat.Sens(1),DynStat.Lust(20)][10],[DynStat.Lib(1),DynStat.Sens(1),DynStat.Lust(20)][11],[DynStat.Lib(1),DynStat.Sens(1),DynStat.Lust(20)][12],[DynStat.Lib(1),DynStat.Sens(1),DynStat.Lust(20)][13],[DynStat.Lib(1),DynStat.Sens(1),DynStat.Lust(20)][14],[DynStat.Lib(1),DynStat.Sens(1),DynStat.Lust(20)][15],[DynStat.Lib(1),DynStat.Sens(1),DynStat.Lust(20)][16]);
            }
            else if(int([DynStat.Lib(1),DynStat.Sens(1),DynStat.Lust(20)].length) == 18)
            {
               KGAMECLASS.kGAMECLASS.player.dynStats([DynStat.Lib(1),DynStat.Sens(1),DynStat.Lust(20)][0],[DynStat.Lib(1),DynStat.Sens(1),DynStat.Lust(20)][1],[DynStat.Lib(1),DynStat.Sens(1),DynStat.Lust(20)][2],[DynStat.Lib(1),DynStat.Sens(1),DynStat.Lust(20)][3],[DynStat.Lib(1),DynStat.Sens(1),DynStat.Lust(20)][4],[DynStat.Lib(1),DynStat.Sens(1),DynStat.Lust(20)][5],[DynStat.Lib(1),DynStat.Sens(1),DynStat.Lust(20)][6],[DynStat.Lib(1),DynStat.Sens(1),DynStat.Lust(20)][7],[DynStat.Lib(1),DynStat.Sens(1),DynStat.Lust(20)][8],[DynStat.Lib(1),DynStat.Sens(1),DynStat.Lust(20)][9],[DynStat.Lib(1),DynStat.Sens(1),DynStat.Lust(20)][10],[DynStat.Lib(1),DynStat.Sens(1),DynStat.Lust(20)][11],[DynStat.Lib(1),DynStat.Sens(1),DynStat.Lust(20)][12],[DynStat.Lib(1),DynStat.Sens(1),DynStat.Lust(20)][13],[DynStat.Lib(1),DynStat.Sens(1),DynStat.Lust(20)][14],[DynStat.Lib(1),DynStat.Sens(1),DynStat.Lust(20)][15],[DynStat.Lib(1),DynStat.Sens(1),DynStat.Lust(20)][16],[DynStat.Lib(1),DynStat.Sens(1),DynStat.Lust(20)][17]);
            }
            else if(int([DynStat.Lib(1),DynStat.Sens(1),DynStat.Lust(20)].length) == 19)
            {
               KGAMECLASS.kGAMECLASS.player.dynStats([DynStat.Lib(1),DynStat.Sens(1),DynStat.Lust(20)][0],[DynStat.Lib(1),DynStat.Sens(1),DynStat.Lust(20)][1],[DynStat.Lib(1),DynStat.Sens(1),DynStat.Lust(20)][2],[DynStat.Lib(1),DynStat.Sens(1),DynStat.Lust(20)][3],[DynStat.Lib(1),DynStat.Sens(1),DynStat.Lust(20)][4],[DynStat.Lib(1),DynStat.Sens(1),DynStat.Lust(20)][5],[DynStat.Lib(1),DynStat.Sens(1),DynStat.Lust(20)][6],[DynStat.Lib(1),DynStat.Sens(1),DynStat.Lust(20)][7],[DynStat.Lib(1),DynStat.Sens(1),DynStat.Lust(20)][8],[DynStat.Lib(1),DynStat.Sens(1),DynStat.Lust(20)][9],[DynStat.Lib(1),DynStat.Sens(1),DynStat.Lust(20)][10],[DynStat.Lib(1),DynStat.Sens(1),DynStat.Lust(20)][11],[DynStat.Lib(1),DynStat.Sens(1),DynStat.Lust(20)][12],[DynStat.Lib(1),DynStat.Sens(1),DynStat.Lust(20)][13],[DynStat.Lib(1),DynStat.Sens(1),DynStat.Lust(20)][14],[DynStat.Lib(1),DynStat.Sens(1),DynStat.Lust(20)][15],[DynStat.Lib(1),DynStat.Sens(1),DynStat.Lust(20)][16],[DynStat.Lib(1),DynStat.Sens(1),DynStat.Lust(20)][17],[DynStat
               .Lib(1),DynStat.Sens(1),DynStat.Lust(20)][18]);
            }
            else
            {
               if(int([DynStat.Lib(1),DynStat.Sens(1),DynStat.Lust(20)].length) != 20)
               {
                  throw "Too many rest arguments";
               }
               KGAMECLASS.kGAMECLASS.player.dynStats([DynStat.Lib(1),DynStat.Sens(1),DynStat.Lust(20)][0],[DynStat.Lib(1),DynStat.Sens(1),DynStat.Lust(20)][1],[DynStat.Lib(1),DynStat.Sens(1),DynStat.Lust(20)][2],[DynStat.Lib(1),DynStat.Sens(1),DynStat.Lust(20)][3],[DynStat.Lib(1),DynStat.Sens(1),DynStat.Lust(20)][4],[DynStat.Lib(1),DynStat.Sens(1),DynStat.Lust(20)][5],[DynStat.Lib(1),DynStat.Sens(1),DynStat.Lust(20)][6],[DynStat.Lib(1),DynStat.Sens(1),DynStat.Lust(20)][7],[DynStat.Lib(1),DynStat.Sens(1),DynStat.Lust(20)][8],[DynStat.Lib(1),DynStat.Sens(1),DynStat.Lust(20)][9],[DynStat.Lib(1),DynStat.Sens(1),DynStat.Lust(20)][10],[DynStat.Lib(1),DynStat.Sens(1),DynStat.Lust(20)][11],[DynStat.Lib(1),DynStat.Sens(1),DynStat.Lust(20)][12],[DynStat.Lib(1),DynStat.Sens(1),DynStat.Lust(20)][13],[DynStat.Lib(1),DynStat.Sens(1),DynStat.Lust(20)][14],[DynStat.Lib(1),DynStat.Sens(1),DynStat.Lust(20)][15],[DynStat.Lib(1),DynStat.Sens(1),DynStat.Lust(20)][16],[DynStat.Lib(1),DynStat.Sens(1),DynStat.Lust(20)][17],[DynStat
               .Lib(1),DynStat.Sens(1),DynStat.Lust(20)][18],[DynStat.Lib(1),DynStat.Sens(1),DynStat.Lust(20)][19]);
            }
            _loc2_ = true;
         }
         if(_loc1_.get_pregnancyIncubation() == 120)
         {
            output.text("<b>你的肚子已经变得又圆又大，也许和你记忆中家乡那些孕妇的肚子一样大了。长者们总是坚持每个人都要尽自己的一份力，以保持足够的人口来承受每年失去一位勇者的代价。你给了自己一个小小的拥抱，从你那被荷尔蒙扰乱的身体里涌起一阵幸福感。怀孕真是太棒了！</b>[pg]");
            _loc2_ = true;
         }
         if(_loc1_.get_pregnancyIncubation() == 72)
         {
            output.text("<b>你那巨大的孕肚不断阻碍着你的行动，但未出生的后代不断地蠕动和摇晃，让你确信你不需要再怀它们太久了。一种母性的自豪感在你的胸中涌起——你就是知道你会拥有如此出色的宝宝。");
            if(_loc1_.cor < 50)
            {
               output.text(" 你打了个寒颤，摇了摇头，想知道自己为什么会想这些不寻常的事情。");
            }
            output.text("</b>[pg]");
            _loc2_ = true;
         }
         if(_loc1_.get_pregnancyIncubation() == 32 || _loc1_.get_pregnancyIncubation() == 64 || _loc1_.get_pregnancyIncubation() == 85 || _loc1_.get_pregnancyIncubation() == 150)
         {
            if(_loc1_.biggestTitSize() >= 3 && _loc1_.mostBreastsPerRow() > 1 && _loc1_.biggestLactation() >= 1 && _loc1_.biggestLactation() < 2)
            {
               output.text("你的乳房因为积聚了多余的乳汁而感到肿胀。[pg]");
               _loc1_.boostLactation(0.5);
               _loc2_ = true;
            }
            if(_loc1_.biggestTitSize() >= 3 && _loc1_.mostBreastsPerRow() > 1 && _loc1_.biggestLactation() > 0 && _loc1_.biggestLactation() < 1)
            {
               output.text("随着你的身体为即将到来的分娩做准备，几滴母乳从你的乳头溢出。[pg]");
               _loc1_.boostLactation(0.5);
               _loc2_ = true;
            }
            if(_loc1_.biggestTitSize() >= 3 && _loc1_.mostBreastsPerRow() > 1 && _loc1_.biggestLactation() == 0)
            {
               output.text("<b>你意识到你的乳房感觉很胀，偶尔还会分泌乳汁</b>。这一定是因为怀孕的缘故。[pg]");
               _loc1_.boostLactation(1);
               _loc2_ = true;
            }
            if(_loc1_.biggestTitSize() == 2 && _loc1_.mostBreastsPerRow() > 1)
            {
               output.text("<b>你的乳房已经胀到了C罩杯，</b>这是为了迎接即将到来的分娩。[pg]");
               _loc1_.growTits(1,1,false,3);
               _loc2_ = true;
            }
            if(_loc1_.biggestTitSize() == 1 && _loc1_.mostBreastsPerRow() > 1)
            {
               output.text("<b>你的乳房已经长到了B罩杯，</b>这可能是由于你怀孕期间的荷尔蒙变化。[pg]");
               _loc1_.growTits(1,1,false,3);
               _loc2_ = true;
            }
         }
         return _loc2_;
      }
      
      public function updateAnalPregnancy() : Boolean
      {
         var _loc1_:Player = KGAMECLASS.kGAMECLASS.player;
         var _loc2_:Boolean = false;
         if(_loc1_.get_buttPregnancyIncubation() == 199)
         {
            output.text("<b>在与蛛化精灵交媾之后，你感觉非常舒服，而且……被填得很满。除了你那塞满卵而隆起的肚子外，你的身体没有明显的外在变化，但你的" + _loc1_.assholeDescript() + "微微发麻，并不时漏出绿色的粘液。希望这没什么好大惊小怪的。</b>[pg]");
            _loc2_ = true;
         }
         if(_loc1_.get_buttPregnancyIncubation() == 180)
         {
            KGAMECLASS.kGAMECLASS.images.showImage("cDrider-loss-butt");
            output.text("<b>一阵潮热传遍全身，发情的蛛化精灵的幻象很快占据了你的思绪。你开始玩弄起自己的乳头，同时沉浸在幻想中，想象着被蛛网绑起来，被完全塞满卵，用那些不断膨胀的爱的圆球把你的肚子完全填满。你从幻想中挣脱出来，注意到自己的双手正在抚摸着微微隆起的肚子。也许这也没那么糟？</b>[pg]");
            if(int([DynStat.Lib(1),DynStat.Sens(1),DynStat.Lust(20)].length) == 0)
            {
               KGAMECLASS.kGAMECLASS.player.dynStats();
            }
            else if(int([DynStat.Lib(1),DynStat.Sens(1),DynStat.Lust(20)].length) == 1)
            {
               KGAMECLASS.kGAMECLASS.player.dynStats([DynStat.Lib(1),DynStat.Sens(1),DynStat.Lust(20)][0]);
            }
            else if(int([DynStat.Lib(1),DynStat.Sens(1),DynStat.Lust(20)].length) == 2)
            {
               KGAMECLASS.kGAMECLASS.player.dynStats([DynStat.Lib(1),DynStat.Sens(1),DynStat.Lust(20)][0],[DynStat.Lib(1),DynStat.Sens(1),DynStat.Lust(20)][1]);
            }
            else if(int([DynStat.Lib(1),DynStat.Sens(1),DynStat.Lust(20)].length) == 3)
            {
               KGAMECLASS.kGAMECLASS.player.dynStats([DynStat.Lib(1),DynStat.Sens(1),DynStat.Lust(20)][0],[DynStat.Lib(1),DynStat.Sens(1),DynStat.Lust(20)][1],[DynStat.Lib(1),DynStat.Sens(1),DynStat.Lust(20)][2]);
            }
            else if(int([DynStat.Lib(1),DynStat.Sens(1),DynStat.Lust(20)].length) == 4)
            {
               KGAMECLASS.kGAMECLASS.player.dynStats([DynStat.Lib(1),DynStat.Sens(1),DynStat.Lust(20)][0],[DynStat.Lib(1),DynStat.Sens(1),DynStat.Lust(20)][1],[DynStat.Lib(1),DynStat.Sens(1),DynStat.Lust(20)][2],[DynStat.Lib(1),DynStat.Sens(1),DynStat.Lust(20)][3]);
            }
            else if(int([DynStat.Lib(1),DynStat.Sens(1),DynStat.Lust(20)].length) == 5)
            {
               KGAMECLASS.kGAMECLASS.player.dynStats([DynStat.Lib(1),DynStat.Sens(1),DynStat.Lust(20)][0],[DynStat.Lib(1),DynStat.Sens(1),DynStat.Lust(20)][1],[DynStat.Lib(1),DynStat.Sens(1),DynStat.Lust(20)][2],[DynStat.Lib(1),DynStat.Sens(1),DynStat.Lust(20)][3],[DynStat.Lib(1),DynStat.Sens(1),DynStat.Lust(20)][4]);
            }
            else if(int([DynStat.Lib(1),DynStat.Sens(1),DynStat.Lust(20)].length) == 6)
            {
               KGAMECLASS.kGAMECLASS.player.dynStats([DynStat.Lib(1),DynStat.Sens(1),DynStat.Lust(20)][0],[DynStat.Lib(1),DynStat.Sens(1),DynStat.Lust(20)][1],[DynStat.Lib(1),DynStat.Sens(1),DynStat.Lust(20)][2],[DynStat.Lib(1),DynStat.Sens(1),DynStat.Lust(20)][3],[DynStat.Lib(1),DynStat.Sens(1),DynStat.Lust(20)][4],[DynStat.Lib(1),DynStat.Sens(1),DynStat.Lust(20)][5]);
            }
            else if(int([DynStat.Lib(1),DynStat.Sens(1),DynStat.Lust(20)].length) == 7)
            {
               KGAMECLASS.kGAMECLASS.player.dynStats([DynStat.Lib(1),DynStat.Sens(1),DynStat.Lust(20)][0],[DynStat.Lib(1),DynStat.Sens(1),DynStat.Lust(20)][1],[DynStat.Lib(1),DynStat.Sens(1),DynStat.Lust(20)][2],[DynStat.Lib(1),DynStat.Sens(1),DynStat.Lust(20)][3],[DynStat.Lib(1),DynStat.Sens(1),DynStat.Lust(20)][4],[DynStat.Lib(1),DynStat.Sens(1),DynStat.Lust(20)][5],[DynStat.Lib(1),DynStat.Sens(1),DynStat.Lust(20)][6]);
            }
            else if(int([DynStat.Lib(1),DynStat.Sens(1),DynStat.Lust(20)].length) == 8)
            {
               KGAMECLASS.kGAMECLASS.player.dynStats([DynStat.Lib(1),DynStat.Sens(1),DynStat.Lust(20)][0],[DynStat.Lib(1),DynStat.Sens(1),DynStat.Lust(20)][1],[DynStat.Lib(1),DynStat.Sens(1),DynStat.Lust(20)][2],[DynStat.Lib(1),DynStat.Sens(1),DynStat.Lust(20)][3],[DynStat.Lib(1),DynStat.Sens(1),DynStat.Lust(20)][4],[DynStat.Lib(1),DynStat.Sens(1),DynStat.Lust(20)][5],[DynStat.Lib(1),DynStat.Sens(1),DynStat.Lust(20)][6],[DynStat.Lib(1),DynStat.Sens(1),DynStat.Lust(20)][7]);
            }
            else if(int([DynStat.Lib(1),DynStat.Sens(1),DynStat.Lust(20)].length) == 9)
            {
               KGAMECLASS.kGAMECLASS.player.dynStats([DynStat.Lib(1),DynStat.Sens(1),DynStat.Lust(20)][0],[DynStat.Lib(1),DynStat.Sens(1),DynStat.Lust(20)][1],[DynStat.Lib(1),DynStat.Sens(1),DynStat.Lust(20)][2],[DynStat.Lib(1),DynStat.Sens(1),DynStat.Lust(20)][3],[DynStat.Lib(1),DynStat.Sens(1),DynStat.Lust(20)][4],[DynStat.Lib(1),DynStat.Sens(1),DynStat.Lust(20)][5],[DynStat.Lib(1),DynStat.Sens(1),DynStat.Lust(20)][6],[DynStat.Lib(1),DynStat.Sens(1),DynStat.Lust(20)][7],[DynStat.Lib(1),DynStat.Sens(1),DynStat.Lust(20)][8]);
            }
            else if(int([DynStat.Lib(1),DynStat.Sens(1),DynStat.Lust(20)].length) == 10)
            {
               KGAMECLASS.kGAMECLASS.player.dynStats([DynStat.Lib(1),DynStat.Sens(1),DynStat.Lust(20)][0],[DynStat.Lib(1),DynStat.Sens(1),DynStat.Lust(20)][1],[DynStat.Lib(1),DynStat.Sens(1),DynStat.Lust(20)][2],[DynStat.Lib(1),DynStat.Sens(1),DynStat.Lust(20)][3],[DynStat.Lib(1),DynStat.Sens(1),DynStat.Lust(20)][4],[DynStat.Lib(1),DynStat.Sens(1),DynStat.Lust(20)][5],[DynStat.Lib(1),DynStat.Sens(1),DynStat.Lust(20)][6],[DynStat.Lib(1),DynStat.Sens(1),DynStat.Lust(20)][7],[DynStat.Lib(1),DynStat.Sens(1),DynStat.Lust(20)][8],[DynStat.Lib(1),DynStat.Sens(1),DynStat.Lust(20)][9]);
            }
            else if(int([DynStat.Lib(1),DynStat.Sens(1),DynStat.Lust(20)].length) == 11)
            {
               KGAMECLASS.kGAMECLASS.player.dynStats([DynStat.Lib(1),DynStat.Sens(1),DynStat.Lust(20)][0],[DynStat.Lib(1),DynStat.Sens(1),DynStat.Lust(20)][1],[DynStat.Lib(1),DynStat.Sens(1),DynStat.Lust(20)][2],[DynStat.Lib(1),DynStat.Sens(1),DynStat.Lust(20)][3],[DynStat.Lib(1),DynStat.Sens(1),DynStat.Lust(20)][4],[DynStat.Lib(1),DynStat.Sens(1),DynStat.Lust(20)][5],[DynStat.Lib(1),DynStat.Sens(1),DynStat.Lust(20)][6],[DynStat.Lib(1),DynStat.Sens(1),DynStat.Lust(20)][7],[DynStat.Lib(1),DynStat.Sens(1),DynStat.Lust(20)][8],[DynStat.Lib(1),DynStat.Sens(1),DynStat.Lust(20)][9],[DynStat.Lib(1),DynStat.Sens(1),DynStat.Lust(20)][10]);
            }
            else if(int([DynStat.Lib(1),DynStat.Sens(1),DynStat.Lust(20)].length) == 12)
            {
               KGAMECLASS.kGAMECLASS.player.dynStats([DynStat.Lib(1),DynStat.Sens(1),DynStat.Lust(20)][0],[DynStat.Lib(1),DynStat.Sens(1),DynStat.Lust(20)][1],[DynStat.Lib(1),DynStat.Sens(1),DynStat.Lust(20)][2],[DynStat.Lib(1),DynStat.Sens(1),DynStat.Lust(20)][3],[DynStat.Lib(1),DynStat.Sens(1),DynStat.Lust(20)][4],[DynStat.Lib(1),DynStat.Sens(1),DynStat.Lust(20)][5],[DynStat.Lib(1),DynStat.Sens(1),DynStat.Lust(20)][6],[DynStat.Lib(1),DynStat.Sens(1),DynStat.Lust(20)][7],[DynStat.Lib(1),DynStat.Sens(1),DynStat.Lust(20)][8],[DynStat.Lib(1),DynStat.Sens(1),DynStat.Lust(20)][9],[DynStat.Lib(1),DynStat.Sens(1),DynStat.Lust(20)][10],[DynStat.Lib(1),DynStat.Sens(1),DynStat.Lust(20)][11]);
            }
            else if(int([DynStat.Lib(1),DynStat.Sens(1),DynStat.Lust(20)].length) == 13)
            {
               KGAMECLASS.kGAMECLASS.player.dynStats([DynStat.Lib(1),DynStat.Sens(1),DynStat.Lust(20)][0],[DynStat.Lib(1),DynStat.Sens(1),DynStat.Lust(20)][1],[DynStat.Lib(1),DynStat.Sens(1),DynStat.Lust(20)][2],[DynStat.Lib(1),DynStat.Sens(1),DynStat.Lust(20)][3],[DynStat.Lib(1),DynStat.Sens(1),DynStat.Lust(20)][4],[DynStat.Lib(1),DynStat.Sens(1),DynStat.Lust(20)][5],[DynStat.Lib(1),DynStat.Sens(1),DynStat.Lust(20)][6],[DynStat.Lib(1),DynStat.Sens(1),DynStat.Lust(20)][7],[DynStat.Lib(1),DynStat.Sens(1),DynStat.Lust(20)][8],[DynStat.Lib(1),DynStat.Sens(1),DynStat.Lust(20)][9],[DynStat.Lib(1),DynStat.Sens(1),DynStat.Lust(20)][10],[DynStat.Lib(1),DynStat.Sens(1),DynStat.Lust(20)][11],[DynStat.Lib(1),DynStat.Sens(1),DynStat.Lust(20)][12]);
            }
            else if(int([DynStat.Lib(1),DynStat.Sens(1),DynStat.Lust(20)].length) == 14)
            {
               KGAMECLASS.kGAMECLASS.player.dynStats([DynStat.Lib(1),DynStat.Sens(1),DynStat.Lust(20)][0],[DynStat.Lib(1),DynStat.Sens(1),DynStat.Lust(20)][1],[DynStat.Lib(1),DynStat.Sens(1),DynStat.Lust(20)][2],[DynStat.Lib(1),DynStat.Sens(1),DynStat.Lust(20)][3],[DynStat.Lib(1),DynStat.Sens(1),DynStat.Lust(20)][4],[DynStat.Lib(1),DynStat.Sens(1),DynStat.Lust(20)][5],[DynStat.Lib(1),DynStat.Sens(1),DynStat.Lust(20)][6],[DynStat.Lib(1),DynStat.Sens(1),DynStat.Lust(20)][7],[DynStat.Lib(1),DynStat.Sens(1),DynStat.Lust(20)][8],[DynStat.Lib(1),DynStat.Sens(1),DynStat.Lust(20)][9],[DynStat.Lib(1),DynStat.Sens(1),DynStat.Lust(20)][10],[DynStat.Lib(1),DynStat.Sens(1),DynStat.Lust(20)][11],[DynStat.Lib(1),DynStat.Sens(1),DynStat.Lust(20)][12],[DynStat.Lib(1),DynStat.Sens(1),DynStat.Lust(20)][13]);
            }
            else if(int([DynStat.Lib(1),DynStat.Sens(1),DynStat.Lust(20)].length) == 15)
            {
               KGAMECLASS.kGAMECLASS.player.dynStats([DynStat.Lib(1),DynStat.Sens(1),DynStat.Lust(20)][0],[DynStat.Lib(1),DynStat.Sens(1),DynStat.Lust(20)][1],[DynStat.Lib(1),DynStat.Sens(1),DynStat.Lust(20)][2],[DynStat.Lib(1),DynStat.Sens(1),DynStat.Lust(20)][3],[DynStat.Lib(1),DynStat.Sens(1),DynStat.Lust(20)][4],[DynStat.Lib(1),DynStat.Sens(1),DynStat.Lust(20)][5],[DynStat.Lib(1),DynStat.Sens(1),DynStat.Lust(20)][6],[DynStat.Lib(1),DynStat.Sens(1),DynStat.Lust(20)][7],[DynStat.Lib(1),DynStat.Sens(1),DynStat.Lust(20)][8],[DynStat.Lib(1),DynStat.Sens(1),DynStat.Lust(20)][9],[DynStat.Lib(1),DynStat.Sens(1),DynStat.Lust(20)][10],[DynStat.Lib(1),DynStat.Sens(1),DynStat.Lust(20)][11],[DynStat.Lib(1),DynStat.Sens(1),DynStat.Lust(20)][12],[DynStat.Lib(1),DynStat.Sens(1),DynStat.Lust(20)][13],[DynStat.Lib(1),DynStat.Sens(1),DynStat.Lust(20)][14]);
            }
            else if(int([DynStat.Lib(1),DynStat.Sens(1),DynStat.Lust(20)].length) == 16)
            {
               KGAMECLASS.kGAMECLASS.player.dynStats([DynStat.Lib(1),DynStat.Sens(1),DynStat.Lust(20)][0],[DynStat.Lib(1),DynStat.Sens(1),DynStat.Lust(20)][1],[DynStat.Lib(1),DynStat.Sens(1),DynStat.Lust(20)][2],[DynStat.Lib(1),DynStat.Sens(1),DynStat.Lust(20)][3],[DynStat.Lib(1),DynStat.Sens(1),DynStat.Lust(20)][4],[DynStat.Lib(1),DynStat.Sens(1),DynStat.Lust(20)][5],[DynStat.Lib(1),DynStat.Sens(1),DynStat.Lust(20)][6],[DynStat.Lib(1),DynStat.Sens(1),DynStat.Lust(20)][7],[DynStat.Lib(1),DynStat.Sens(1),DynStat.Lust(20)][8],[DynStat.Lib(1),DynStat.Sens(1),DynStat.Lust(20)][9],[DynStat.Lib(1),DynStat.Sens(1),DynStat.Lust(20)][10],[DynStat.Lib(1),DynStat.Sens(1),DynStat.Lust(20)][11],[DynStat.Lib(1),DynStat.Sens(1),DynStat.Lust(20)][12],[DynStat.Lib(1),DynStat.Sens(1),DynStat.Lust(20)][13],[DynStat.Lib(1),DynStat.Sens(1),DynStat.Lust(20)][14],[DynStat.Lib(1),DynStat.Sens(1),DynStat.Lust(20)][15]);
            }
            else if(int([DynStat.Lib(1),DynStat.Sens(1),DynStat.Lust(20)].length) == 17)
            {
               KGAMECLASS.kGAMECLASS.player.dynStats([DynStat.Lib(1),DynStat.Sens(1),DynStat.Lust(20)][0],[DynStat.Lib(1),DynStat.Sens(1),DynStat.Lust(20)][1],[DynStat.Lib(1),DynStat.Sens(1),DynStat.Lust(20)][2],[DynStat.Lib(1),DynStat.Sens(1),DynStat.Lust(20)][3],[DynStat.Lib(1),DynStat.Sens(1),DynStat.Lust(20)][4],[DynStat.Lib(1),DynStat.Sens(1),DynStat.Lust(20)][5],[DynStat.Lib(1),DynStat.Sens(1),DynStat.Lust(20)][6],[DynStat.Lib(1),DynStat.Sens(1),DynStat.Lust(20)][7],[DynStat.Lib(1),DynStat.Sens(1),DynStat.Lust(20)][8],[DynStat.Lib(1),DynStat.Sens(1),DynStat.Lust(20)][9],[DynStat.Lib(1),DynStat.Sens(1),DynStat.Lust(20)][10],[DynStat.Lib(1),DynStat.Sens(1),DynStat.Lust(20)][11],[DynStat.Lib(1),DynStat.Sens(1),DynStat.Lust(20)][12],[DynStat.Lib(1),DynStat.Sens(1),DynStat.Lust(20)][13],[DynStat.Lib(1),DynStat.Sens(1),DynStat.Lust(20)][14],[DynStat.Lib(1),DynStat.Sens(1),DynStat.Lust(20)][15],[DynStat.Lib(1),DynStat.Sens(1),DynStat.Lust(20)][16]);
            }
            else if(int([DynStat.Lib(1),DynStat.Sens(1),DynStat.Lust(20)].length) == 18)
            {
               KGAMECLASS.kGAMECLASS.player.dynStats([DynStat.Lib(1),DynStat.Sens(1),DynStat.Lust(20)][0],[DynStat.Lib(1),DynStat.Sens(1),DynStat.Lust(20)][1],[DynStat.Lib(1),DynStat.Sens(1),DynStat.Lust(20)][2],[DynStat.Lib(1),DynStat.Sens(1),DynStat.Lust(20)][3],[DynStat.Lib(1),DynStat.Sens(1),DynStat.Lust(20)][4],[DynStat.Lib(1),DynStat.Sens(1),DynStat.Lust(20)][5],[DynStat.Lib(1),DynStat.Sens(1),DynStat.Lust(20)][6],[DynStat.Lib(1),DynStat.Sens(1),DynStat.Lust(20)][7],[DynStat.Lib(1),DynStat.Sens(1),DynStat.Lust(20)][8],[DynStat.Lib(1),DynStat.Sens(1),DynStat.Lust(20)][9],[DynStat.Lib(1),DynStat.Sens(1),DynStat.Lust(20)][10],[DynStat.Lib(1),DynStat.Sens(1),DynStat.Lust(20)][11],[DynStat.Lib(1),DynStat.Sens(1),DynStat.Lust(20)][12],[DynStat.Lib(1),DynStat.Sens(1),DynStat.Lust(20)][13],[DynStat.Lib(1),DynStat.Sens(1),DynStat.Lust(20)][14],[DynStat.Lib(1),DynStat.Sens(1),DynStat.Lust(20)][15],[DynStat.Lib(1),DynStat.Sens(1),DynStat.Lust(20)][16],[DynStat.Lib(1),DynStat.Sens(1),DynStat.Lust(20)][17]);
            }
            else if(int([DynStat.Lib(1),DynStat.Sens(1),DynStat.Lust(20)].length) == 19)
            {
               KGAMECLASS.kGAMECLASS.player.dynStats([DynStat.Lib(1),DynStat.Sens(1),DynStat.Lust(20)][0],[DynStat.Lib(1),DynStat.Sens(1),DynStat.Lust(20)][1],[DynStat.Lib(1),DynStat.Sens(1),DynStat.Lust(20)][2],[DynStat.Lib(1),DynStat.Sens(1),DynStat.Lust(20)][3],[DynStat.Lib(1),DynStat.Sens(1),DynStat.Lust(20)][4],[DynStat.Lib(1),DynStat.Sens(1),DynStat.Lust(20)][5],[DynStat.Lib(1),DynStat.Sens(1),DynStat.Lust(20)][6],[DynStat.Lib(1),DynStat.Sens(1),DynStat.Lust(20)][7],[DynStat.Lib(1),DynStat.Sens(1),DynStat.Lust(20)][8],[DynStat.Lib(1),DynStat.Sens(1),DynStat.Lust(20)][9],[DynStat.Lib(1),DynStat.Sens(1),DynStat.Lust(20)][10],[DynStat.Lib(1),DynStat.Sens(1),DynStat.Lust(20)][11],[DynStat.Lib(1),DynStat.Sens(1),DynStat.Lust(20)][12],[DynStat.Lib(1),DynStat.Sens(1),DynStat.Lust(20)][13],[DynStat.Lib(1),DynStat.Sens(1),DynStat.Lust(20)][14],[DynStat.Lib(1),DynStat.Sens(1),DynStat.Lust(20)][15],[DynStat.Lib(1),DynStat.Sens(1),DynStat.Lust(20)][16],[DynStat.Lib(1),DynStat.Sens(1),DynStat.Lust(20)][17],[DynStat
               .Lib(1),DynStat.Sens(1),DynStat.Lust(20)][18]);
            }
            else
            {
               if(int([DynStat.Lib(1),DynStat.Sens(1),DynStat.Lust(20)].length) != 20)
               {
                  throw "Too many rest arguments";
               }
               KGAMECLASS.kGAMECLASS.player.dynStats([DynStat.Lib(1),DynStat.Sens(1),DynStat.Lust(20)][0],[DynStat.Lib(1),DynStat.Sens(1),DynStat.Lust(20)][1],[DynStat.Lib(1),DynStat.Sens(1),DynStat.Lust(20)][2],[DynStat.Lib(1),DynStat.Sens(1),DynStat.Lust(20)][3],[DynStat.Lib(1),DynStat.Sens(1),DynStat.Lust(20)][4],[DynStat.Lib(1),DynStat.Sens(1),DynStat.Lust(20)][5],[DynStat.Lib(1),DynStat.Sens(1),DynStat.Lust(20)][6],[DynStat.Lib(1),DynStat.Sens(1),DynStat.Lust(20)][7],[DynStat.Lib(1),DynStat.Sens(1),DynStat.Lust(20)][8],[DynStat.Lib(1),DynStat.Sens(1),DynStat.Lust(20)][9],[DynStat.Lib(1),DynStat.Sens(1),DynStat.Lust(20)][10],[DynStat.Lib(1),DynStat.Sens(1),DynStat.Lust(20)][11],[DynStat.Lib(1),DynStat.Sens(1),DynStat.Lust(20)][12],[DynStat.Lib(1),DynStat.Sens(1),DynStat.Lust(20)][13],[DynStat.Lib(1),DynStat.Sens(1),DynStat.Lust(20)][14],[DynStat.Lib(1),DynStat.Sens(1),DynStat.Lust(20)][15],[DynStat.Lib(1),DynStat.Sens(1),DynStat.Lust(20)][16],[DynStat.Lib(1),DynStat.Sens(1),DynStat.Lust(20)][17],[DynStat
               .Lib(1),DynStat.Sens(1),DynStat.Lust(20)][18],[DynStat.Lib(1),DynStat.Sens(1),DynStat.Lust(20)][19]);
            }
            _loc2_ = true;
         }
         if(_loc1_.get_buttPregnancyIncubation() == 120)
         {
            output.text("<b>你的肚子因为里面生长的卵而高高隆起，几乎每次走路都会发出咕噜咕噜的声音。绿色的粘液经常顺着你的" + _loc1_.legs() + "流下来，从你那怀孕的后穴里滴落。</b>[pg]");
            _loc2_ = true;
         }
         if(_loc1_.get_buttPregnancyIncubation() == 72)
         {
            output.text("<b>你那巨大的孕肚不断阻碍着你的行动，但未出生的后代不断地蠕动和摇晃，让你确信你不需要再怀它们太久了。");
            output.text("</b>[pg]");
            _loc2_ = true;
         }
         return _loc2_;
      }
      
      public function analBirth() : void
      {
         KGAMECLASS.kGAMECLASS.swamp.corruptedDriderScene.birthSpiderEggsFromAnusITSBLEEDINGYAYYYYY();
      }
   }
}

