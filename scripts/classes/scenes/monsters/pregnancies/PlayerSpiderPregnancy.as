package classes.scenes.monsters.pregnancies
{
   import classes.DynStat;
   import classes.Player;
   import classes.globalFlags.KGAMECLASS;
   import classes.internals.GuiOutput;
   import classes.scenes.PregnancyProgression;
   import classes.scenes.VaginalPregnancy;
   import flash.Boot;
   
   public class PlayerSpiderPregnancy implements VaginalPregnancy
   {
      
      public var output:GuiOutput;
      
      public function PlayerSpiderPregnancy(param1:GuiOutput = undefined)
      {
         if(Boot.skip_constructor)
         {
            return;
         }
         output = param1;
         PregnancyProgression.registerVaginalPregnancyScene(25,13,this);
      }
      
      public function vaginalBirth() : void
      {
         KGAMECLASS.kGAMECLASS.swamp.maleSpiderMorphScene.spiderPregVagBirth();
      }
      
      public function updateVaginalPregnancy() : Boolean
      {
         var _loc1_:Player = KGAMECLASS.kGAMECLASS.player;
         var _loc2_:Boolean = false;
         if(_loc1_.get_pregnancyIncubation() == 399)
         {
            output.text("<b>在与蜘蛛交媾之后，你感觉……充实了许多。就你所见，你的身体表面并没有什么变化，但每当你移动时，你的子宫都会感到轻微的酥麻。希望这没什么大不了的。</b>[pg]");
            _loc2_ = true;
         }
         if(_loc1_.get_pregnancyIncubation() == 275)
         {
            output.text("<b>你的肚子咕咕叫着，好像空了一样，尽管你不久前才吃过东西。也许是因为你做了这么多运动，你只需要多吃一点。</b>[pg]");
            _loc2_ = true;
         }
         if(_loc1_.get_pregnancyIncubation() == 250)
         {
            output.text("<b>你的肚子看起来有点发福");
            if(_loc1_.thickness > 60 && _loc1_.tone < 40)
            {
               output.text("，即使对你来说也是如此");
            }
            output.text("，也许你应该减少最近的进食量？</b>[pg]");
            _loc2_ = true;
         }
         if(_loc1_.get_pregnancyIncubation() == 216)
         {
            output.text("<b>你的肚子明显变大了，而且无论你怎么做，只要一感到饿，你就忍不住想吃东西。你能想到的唯一解释就是你在旅行中怀孕了。希望这不会给你的冒险带来不便。</b>[pg]");
            _loc2_ = true;
         }
         if(_loc1_.get_pregnancyIncubation() == 180)
         {
            KGAMECLASS.kGAMECLASS.images.showImage("spidermorph-male-loss-vag");
            output.text("<b>一阵潮热传遍全身，脑海中不断浮现出发情的");
            output.text("蜘蛛人");
            output.text("的幻象，很快就占据了你的思绪。你开始把玩着乳头，沉浸在幻想中，想象着被蛛网绑起来，被一次又一次地交配，被一群饥渴的雄性侵犯，每一个都希望能成为你下一窝孩子的父亲。你从幻想中挣脱出来，注意到自己的双手正在抚摸着微微隆起的肚子。也许这也没那么糟？</b>[pg]");
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
            output.text("<b>你的肚子已经变得相当大了，也许和你记忆中家乡孕妇的肚子一样大。长老们总是坚持每个人都要尽自己的一份力量，保持足够高的人口数量，以承受每年失去一名勇者的损失。你轻轻地抱了抱自己，从被荷尔蒙扰乱的身体中感受到一阵幸福的涌动。怀孕真是太棒了！</b>[pg]");
            _loc2_ = true;
         }
         if(_loc1_.get_pregnancyIncubation() == 72)
         {
            output.text("<b>你巨大的孕肚不断阻碍着你的行动，但未出生的后代不断地蠕动和摇晃，让你很确定你不需要再怀它们多久了。一种母亲的自豪感在你的胸中涌起——你就是知道你会有这么棒的宝宝。");
            if(_loc1_.cor < 50)
            {
               output.text(" 你打了个寒颤，摇了摇头，想知道自己为什么会想这么奇怪的事情。");
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
               output.text("随着你的身体为即将到来的分娩做准备，几滴乳汁从你的乳头溢出。[pg]");
               _loc1_.boostLactation(0.5);
               _loc2_ = true;
            }
            if(_loc1_.biggestTitSize() >= 3 && _loc1_.mostBreastsPerRow() > 1 && _loc1_.biggestLactation() == 0)
            {
               output.text("<b>你意识到你的乳房感觉很胀，偶尔还会分泌乳汁</b>。这一定是怀孕引起的。[pg]");
               _loc1_.boostLactation(1);
               _loc2_ = true;
            }
            if(_loc1_.biggestTitSize() == 2 && _loc1_.mostBreastsPerRow() > 1)
            {
               output.text("<b>你的乳房已经肿胀到了C罩杯，</b>这是因为你即将怀孕。[pg]");
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
   }
}

