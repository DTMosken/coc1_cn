package classes.scenes.monsters.pregnancies
{
   import classes.DynStat;
   import classes.Player;
   import classes.Vagina;
   import classes.globalFlags.KGAMECLASS;
   import classes.internals.GuiOutput;
   import classes.internals.PregnancyUtils;
   import classes.internals.Utils;
   import classes.scenes.PregnancyProgression;
   import classes.scenes.VaginalPregnancy;
   import flash.Boot;
   
   public class PlayerCentaurPregnancy implements VaginalPregnancy
   {
      
      public var output:GuiOutput;
      
      public function PlayerCentaurPregnancy(param1:GuiOutput = undefined)
      {
         if(Boot.skip_constructor)
         {
            return;
         }
         output = param1;
         PregnancyProgression.registerVaginalPregnancyScene(25,7,this);
         PregnancyProgression.registerVaginalPregnancyScene(25,30,this);
      }
      
      public function vaginalBirth() : void
      {
         var _loc1_:Player = KGAMECLASS.kGAMECLASS.player;
         output.text("你眨了眨眼，感觉到一种突然的渴望从你巨大的胃部辐射出来。你甚至无法从地上爬起来，它太重了……你只能侧躺着，带着欲望喘息，随着抽搐的开始。新的生命在你的胃下移动，准备出生，现在是你尽自己本分的时候了。[pg]");
         PregnancyUtils.createVaginaIfMissing(output,_loc1_);
         _loc1_.boostLactation(0.01);
         output.text("也许很奇怪，没有疼痛，只有一种稳定、有节奏的冲动，引导你平稳地呼吸，并尽可能地张开双腿。你几乎不需要用力，因为孩子——不，你的孩子，开始挤压你子宫的壁，寻找出口。它找到了，并开始艰难地挤过你的子宫颈，让你喘息着，几乎无法掩饰快乐。它甚至不疼；只有一种沉闷的快乐低语，随后是满足的潮水。[pg]");
         output.text("头先出来，当你看到一个像精灵一样的小孩的脸时，你的第一个想法是松了一口气。她身上沾满了胎盘，正努力挣脱出来。但更重要的部分还在后面。她把身体拉出来，很容易就有她人类躯干的两倍大。柔软的绒毛，长而细长的腿和刚毛的尾巴……她是一个半人马！你尽你所能地帮忙，为你的成就感到自豪，但因为这场磨难而太累了。你新出生的女儿做了大部分的工作。[pg]");
         output.text("起初她站不起来，在她自己摇晃的腿上绊倒，以一种可爱、天真的方式。她看起来像一个六岁的女孩，被困在一匹小马驹的身体上，你的心不由自主地向她飞去。她终于站了起来，摇摇晃晃地，立刻向你俯卧的身体走去。知道她的需要，你向她露出了一个乳房，她深情地嘶鸣着，然后吸住，饥渴地喝着你大量分泌乳汁的乳头。[pg]");
         output.text("她不停地喝着，每一口似乎都让她更有活力、更强壮。几个小时在安静、母性的幸福中过去，她先从一个乳房吸干你的母乳，然后是另一个。她的小肚子微微隆起，但她没有停下来，你也不想让她停下来。即使怀孕带来的奇怪、舒缓的效果消失了，你对这个孩子也只有喜爱。[pg]");
         output.text("当她喝完时，半人马女孩明显更强壮了，能够自己站立和走动。她探索着自己的新身体，快乐地跳跃和腾跃，而你躺在后面看着，太累了，无法加入她。然而，突然间，她的耳朵竖了起来，因为她急切地看向地平线。她犹豫了一下，刚好够在你脸颊上印下一个甜蜜的吻，然后跑开了，笑得很开心。筋疲力尽的你无法跟上……但那种安慰的感觉又回来了。不知为何，你感觉到她会没事的。");
         if(_loc1_.averageLactation() > 0 && _loc1_.averageLactation() < 5)
         {
            output.text("你的" + _loc1_.allBreastsDescript() + "似乎止不住地滴奶，泌乳量比以前更大了。");
            _loc1_.boostLactation(0.5);
         }
         output.text(" ");
         _loc1_.cuntChange(100,true);
         if(_loc1_.vaginas[0].vaginalWetness == 0)
         {
            _temp_1.vaginalWetness += 1;
         }
         _loc1_.orgasm("Vaginal");
         if(int([DynStat.Str(-1),DynStat.Tou(-4),DynStat.Spe(2),DynStat.Lib(1),DynStat.Sens(0.5)].length) == 0)
         {
            KGAMECLASS.kGAMECLASS.player.dynStats();
         }
         else if(int([DynStat.Str(-1),DynStat.Tou(-4),DynStat.Spe(2),DynStat.Lib(1),DynStat.Sens(0.5)].length) == 1)
         {
            KGAMECLASS.kGAMECLASS.player.dynStats([DynStat.Str(-1),DynStat.Tou(-4),DynStat.Spe(2),DynStat.Lib(1),DynStat.Sens(0.5)][0]);
         }
         else if(int([DynStat.Str(-1),DynStat.Tou(-4),DynStat.Spe(2),DynStat.Lib(1),DynStat.Sens(0.5)].length) == 2)
         {
            KGAMECLASS.kGAMECLASS.player.dynStats([DynStat.Str(-1),DynStat.Tou(-4),DynStat.Spe(2),DynStat.Lib(1),DynStat.Sens(0.5)][0],[DynStat.Str(-1),DynStat.Tou(-4),DynStat.Spe(2),DynStat.Lib(1),DynStat.Sens(0.5)][1]);
         }
         else if(int([DynStat.Str(-1),DynStat.Tou(-4),DynStat.Spe(2),DynStat.Lib(1),DynStat.Sens(0.5)].length) == 3)
         {
            KGAMECLASS.kGAMECLASS.player.dynStats([DynStat.Str(-1),DynStat.Tou(-4),DynStat.Spe(2),DynStat.Lib(1),DynStat.Sens(0.5)][0],[DynStat.Str(-1),DynStat.Tou(-4),DynStat.Spe(2),DynStat.Lib(1),DynStat.Sens(0.5)][1],[DynStat.Str(-1),DynStat.Tou(-4),DynStat.Spe(2),DynStat.Lib(1),DynStat.Sens(0.5)][2]);
         }
         else if(int([DynStat.Str(-1),DynStat.Tou(-4),DynStat.Spe(2),DynStat.Lib(1),DynStat.Sens(0.5)].length) == 4)
         {
            KGAMECLASS.kGAMECLASS.player.dynStats([DynStat.Str(-1),DynStat.Tou(-4),DynStat.Spe(2),DynStat.Lib(1),DynStat.Sens(0.5)][0],[DynStat.Str(-1),DynStat.Tou(-4),DynStat.Spe(2),DynStat.Lib(1),DynStat.Sens(0.5)][1],[DynStat.Str(-1),DynStat.Tou(-4),DynStat.Spe(2),DynStat.Lib(1),DynStat.Sens(0.5)][2],[DynStat.Str(-1),DynStat.Tou(-4),DynStat.Spe(2),DynStat.Lib(1),DynStat.Sens(0.5)][3]);
         }
         else if(int([DynStat.Str(-1),DynStat.Tou(-4),DynStat.Spe(2),DynStat.Lib(1),DynStat.Sens(0.5)].length) == 5)
         {
            KGAMECLASS.kGAMECLASS.player.dynStats([DynStat.Str(-1),DynStat.Tou(-4),DynStat.Spe(2),DynStat.Lib(1),DynStat.Sens(0.5)][0],[DynStat.Str(-1),DynStat.Tou(-4),DynStat.Spe(2),DynStat.Lib(1),DynStat.Sens(0.5)][1],[DynStat.Str(-1),DynStat.Tou(-4),DynStat.Spe(2),DynStat.Lib(1),DynStat.Sens(0.5)][2],[DynStat.Str(-1),DynStat.Tou(-4),DynStat.Spe(2),DynStat.Lib(1),DynStat.Sens(0.5)][3],[DynStat.Str(-1),DynStat.Tou(-4),DynStat.Spe(2),DynStat.Lib(1),DynStat.Sens(0.5)][4]);
         }
         else if(int([DynStat.Str(-1),DynStat.Tou(-4),DynStat.Spe(2),DynStat.Lib(1),DynStat.Sens(0.5)].length) == 6)
         {
            KGAMECLASS.kGAMECLASS.player.dynStats([DynStat.Str(-1),DynStat.Tou(-4),DynStat.Spe(2),DynStat.Lib(1),DynStat.Sens(0.5)][0],[DynStat.Str(-1),DynStat.Tou(-4),DynStat.Spe(2),DynStat.Lib(1),DynStat.Sens(0.5)][1],[DynStat.Str(-1),DynStat.Tou(-4),DynStat.Spe(2),DynStat.Lib(1),DynStat.Sens(0.5)][2],[DynStat.Str(-1),DynStat.Tou(-4),DynStat.Spe(2),DynStat.Lib(1),DynStat.Sens(0.5)][3],[DynStat.Str(-1),DynStat.Tou(-4),DynStat.Spe(2),DynStat.Lib(1),DynStat.Sens(0.5)][4],[DynStat.Str(-1),DynStat.Tou(-4),DynStat.Spe(2),DynStat.Lib(1),DynStat.Sens(0.5)][5]);
         }
         else if(int([DynStat.Str(-1),DynStat.Tou(-4),DynStat.Spe(2),DynStat.Lib(1),DynStat.Sens(0.5)].length) == 7)
         {
            KGAMECLASS.kGAMECLASS.player.dynStats([DynStat.Str(-1),DynStat.Tou(-4),DynStat.Spe(2),DynStat.Lib(1),DynStat.Sens(0.5)][0],[DynStat.Str(-1),DynStat.Tou(-4),DynStat.Spe(2),DynStat.Lib(1),DynStat.Sens(0.5)][1],[DynStat.Str(-1),DynStat.Tou(-4),DynStat.Spe(2),DynStat.Lib(1),DynStat.Sens(0.5)][2],[DynStat.Str(-1),DynStat.Tou(-4),DynStat.Spe(2),DynStat.Lib(1),DynStat.Sens(0.5)][3],[DynStat.Str(-1),DynStat.Tou(-4),DynStat.Spe(2),DynStat.Lib(1),DynStat.Sens(0.5)][4],[DynStat.Str(-1),DynStat.Tou(-4),DynStat.Spe(2),DynStat.Lib(1),DynStat.Sens(0.5)][5],[DynStat.Str(-1),DynStat.Tou(-4),DynStat.Spe(2),DynStat.Lib(1),DynStat.Sens(0.5)][6]);
         }
         else if(int([DynStat.Str(-1),DynStat.Tou(-4),DynStat.Spe(2),DynStat.Lib(1),DynStat.Sens(0.5)].length) == 8)
         {
            KGAMECLASS.kGAMECLASS.player.dynStats([DynStat.Str(-1),DynStat.Tou(-4),DynStat.Spe(2),DynStat.Lib(1),DynStat.Sens(0.5)][0],[DynStat.Str(-1),DynStat.Tou(-4),DynStat.Spe(2),DynStat.Lib(1),DynStat.Sens(0.5)][1],[DynStat.Str(-1),DynStat.Tou(-4),DynStat.Spe(2),DynStat.Lib(1),DynStat.Sens(0.5)][2],[DynStat.Str(-1),DynStat.Tou(-4),DynStat.Spe(2),DynStat.Lib(1),DynStat.Sens(0.5)][3],[DynStat.Str(-1),DynStat.Tou(-4),DynStat.Spe(2),DynStat.Lib(1),DynStat.Sens(0.5)][4],[DynStat.Str(-1),DynStat.Tou(-4),DynStat.Spe(2),DynStat.Lib(1),DynStat.Sens(0.5)][5],[DynStat.Str(-1),DynStat.Tou(-4),DynStat.Spe(2),DynStat.Lib(1),DynStat.Sens(0.5)][6],[DynStat.Str(-1),DynStat.Tou(-4),DynStat.Spe(2),DynStat.Lib(1),DynStat.Sens(0.5)][7]);
         }
         else if(int([DynStat.Str(-1),DynStat.Tou(-4),DynStat.Spe(2),DynStat.Lib(1),DynStat.Sens(0.5)].length) == 9)
         {
            KGAMECLASS.kGAMECLASS.player.dynStats([DynStat.Str(-1),DynStat.Tou(-4),DynStat.Spe(2),DynStat.Lib(1),DynStat.Sens(0.5)][0],[DynStat.Str(-1),DynStat.Tou(-4),DynStat.Spe(2),DynStat.Lib(1),DynStat.Sens(0.5)][1],[DynStat.Str(-1),DynStat.Tou(-4),DynStat.Spe(2),DynStat.Lib(1),DynStat.Sens(0.5)][2],[DynStat.Str(-1),DynStat.Tou(-4),DynStat.Spe(2),DynStat.Lib(1),DynStat.Sens(0.5)][3],[DynStat.Str(-1),DynStat.Tou(-4),DynStat.Spe(2),DynStat.Lib(1),DynStat.Sens(0.5)][4],[DynStat.Str(-1),DynStat.Tou(-4),DynStat.Spe(2),DynStat.Lib(1),DynStat.Sens(0.5)][5],[DynStat.Str(-1),DynStat.Tou(-4),DynStat.Spe(2),DynStat.Lib(1),DynStat.Sens(0.5)][6],[DynStat.Str(-1),DynStat.Tou(-4),DynStat.Spe(2),DynStat.Lib(1),DynStat.Sens(0.5)][7],[DynStat.Str(-1),DynStat.Tou(-4),DynStat.Spe(2),DynStat.Lib(1),DynStat.Sens(0.5)][8]);
         }
         else if(int([DynStat.Str(-1),DynStat.Tou(-4),DynStat.Spe(2),DynStat.Lib(1),DynStat.Sens(0.5)].length) == 10)
         {
            KGAMECLASS.kGAMECLASS.player.dynStats([DynStat.Str(-1),DynStat.Tou(-4),DynStat.Spe(2),DynStat.Lib(1),DynStat.Sens(0.5)][0],[DynStat.Str(-1),DynStat.Tou(-4),DynStat.Spe(2),DynStat.Lib(1),DynStat.Sens(0.5)][1],[DynStat.Str(-1),DynStat.Tou(-4),DynStat.Spe(2),DynStat.Lib(1),DynStat.Sens(0.5)][2],[DynStat.Str(-1),DynStat.Tou(-4),DynStat.Spe(2),DynStat.Lib(1),DynStat.Sens(0.5)][3],[DynStat.Str(-1),DynStat.Tou(-4),DynStat.Spe(2),DynStat.Lib(1),DynStat.Sens(0.5)][4],[DynStat.Str(-1),DynStat.Tou(-4),DynStat.Spe(2),DynStat.Lib(1),DynStat.Sens(0.5)][5],[DynStat.Str(-1),DynStat.Tou(-4),DynStat.Spe(2),DynStat.Lib(1),DynStat.Sens(0.5)][6],[DynStat.Str(-1),DynStat.Tou(-4),DynStat.Spe(2),DynStat.Lib(1),DynStat.Sens(0.5)][7],[DynStat.Str(-1),DynStat.Tou(-4),DynStat.Spe(2),DynStat.Lib(1),DynStat.Sens(0.5)][8],[DynStat.Str(-1),DynStat.Tou(-4),DynStat.Spe(2),DynStat.Lib(1),DynStat.Sens(0.5)][9]);
         }
         else if(int([DynStat.Str(-1),DynStat.Tou(-4),DynStat.Spe(2),DynStat.Lib(1),DynStat.Sens(0.5)].length) == 11)
         {
            KGAMECLASS.kGAMECLASS.player.dynStats([DynStat.Str(-1),DynStat.Tou(-4),DynStat.Spe(2),DynStat.Lib(1),DynStat.Sens(0.5)][0],[DynStat.Str(-1),DynStat.Tou(-4),DynStat.Spe(2),DynStat.Lib(1),DynStat.Sens(0.5)][1],[DynStat.Str(-1),DynStat.Tou(-4),DynStat.Spe(2),DynStat.Lib(1),DynStat.Sens(0.5)][2],[DynStat.Str(-1),DynStat.Tou(-4),DynStat.Spe(2),DynStat.Lib(1),DynStat.Sens(0.5)][3],[DynStat.Str(-1),DynStat.Tou(-4),DynStat.Spe(2),DynStat.Lib(1),DynStat.Sens(0.5)][4],[DynStat.Str(-1),DynStat.Tou(-4),DynStat.Spe(2),DynStat.Lib(1),DynStat.Sens(0.5)][5],[DynStat.Str(-1),DynStat.Tou(-4),DynStat.Spe(2),DynStat.Lib(1),DynStat.Sens(0.5)][6],[DynStat.Str(-1),DynStat.Tou(-4),DynStat.Spe(2),DynStat.Lib(1),DynStat.Sens(0.5)][7],[DynStat.Str(-1),DynStat.Tou(-4),DynStat.Spe(2),DynStat.Lib(1),DynStat.Sens(0.5)][8],[DynStat.Str(-1),DynStat.Tou(-4),DynStat.Spe(2),DynStat.Lib(1),DynStat.Sens(0.5)][9],[DynStat.Str(-1),DynStat.Tou(-4),DynStat.Spe(2),DynStat.Lib(1),DynStat.Sens(0.5)][10]);
         }
         else if(int([DynStat.Str(-1),DynStat.Tou(-4),DynStat.Spe(2),DynStat.Lib(1),DynStat.Sens(0.5)].length) == 12)
         {
            KGAMECLASS.kGAMECLASS.player.dynStats([DynStat.Str(-1),DynStat.Tou(-4),DynStat.Spe(2),DynStat.Lib(1),DynStat.Sens(0.5)][0],[DynStat.Str(-1),DynStat.Tou(-4),DynStat.Spe(2),DynStat.Lib(1),DynStat.Sens(0.5)][1],[DynStat.Str(-1),DynStat.Tou(-4),DynStat.Spe(2),DynStat.Lib(1),DynStat.Sens(0.5)][2],[DynStat.Str(-1),DynStat.Tou(-4),DynStat.Spe(2),DynStat.Lib(1),DynStat.Sens(0.5)][3],[DynStat.Str(-1),DynStat.Tou(-4),DynStat.Spe(2),DynStat.Lib(1),DynStat.Sens(0.5)][4],[DynStat.Str(-1),DynStat.Tou(-4),DynStat.Spe(2),DynStat.Lib(1),DynStat.Sens(0.5)][5],[DynStat.Str(-1),DynStat.Tou(-4),DynStat.Spe(2),DynStat.Lib(1),DynStat.Sens(0.5)][6],[DynStat.Str(-1),DynStat.Tou(-4),DynStat.Spe(2),DynStat.Lib(1),DynStat.Sens(0.5)][7],[DynStat.Str(-1),DynStat.Tou(-4),DynStat.Spe(2),DynStat.Lib(1),DynStat.Sens(0.5)][8],[DynStat.Str(-1),DynStat.Tou(-4),DynStat.Spe(2),DynStat.Lib(1),DynStat.Sens(0.5)][9],[DynStat.Str(-1),DynStat.Tou(-4),DynStat.Spe(2),DynStat.Lib(1),DynStat.Sens(0.5)][10],[DynStat.Str(-1),DynStat.Tou(-4)
            ,DynStat.Spe(2),DynStat.Lib(1),DynStat.Sens(0.5)][11]);
         }
         else if(int([DynStat.Str(-1),DynStat.Tou(-4),DynStat.Spe(2),DynStat.Lib(1),DynStat.Sens(0.5)].length) == 13)
         {
            KGAMECLASS.kGAMECLASS.player.dynStats([DynStat.Str(-1),DynStat.Tou(-4),DynStat.Spe(2),DynStat.Lib(1),DynStat.Sens(0.5)][0],[DynStat.Str(-1),DynStat.Tou(-4),DynStat.Spe(2),DynStat.Lib(1),DynStat.Sens(0.5)][1],[DynStat.Str(-1),DynStat.Tou(-4),DynStat.Spe(2),DynStat.Lib(1),DynStat.Sens(0.5)][2],[DynStat.Str(-1),DynStat.Tou(-4),DynStat.Spe(2),DynStat.Lib(1),DynStat.Sens(0.5)][3],[DynStat.Str(-1),DynStat.Tou(-4),DynStat.Spe(2),DynStat.Lib(1),DynStat.Sens(0.5)][4],[DynStat.Str(-1),DynStat.Tou(-4),DynStat.Spe(2),DynStat.Lib(1),DynStat.Sens(0.5)][5],[DynStat.Str(-1),DynStat.Tou(-4),DynStat.Spe(2),DynStat.Lib(1),DynStat.Sens(0.5)][6],[DynStat.Str(-1),DynStat.Tou(-4),DynStat.Spe(2),DynStat.Lib(1),DynStat.Sens(0.5)][7],[DynStat.Str(-1),DynStat.Tou(-4),DynStat.Spe(2),DynStat.Lib(1),DynStat.Sens(0.5)][8],[DynStat.Str(-1),DynStat.Tou(-4),DynStat.Spe(2),DynStat.Lib(1),DynStat.Sens(0.5)][9],[DynStat.Str(-1),DynStat.Tou(-4),DynStat.Spe(2),DynStat.Lib(1),DynStat.Sens(0.5)][10],[DynStat.Str(-1),DynStat.Tou(-4)
            ,DynStat.Spe(2),DynStat.Lib(1),DynStat.Sens(0.5)][11],[DynStat.Str(-1),DynStat.Tou(-4),DynStat.Spe(2),DynStat.Lib(1),DynStat.Sens(0.5)][12]);
         }
         else if(int([DynStat.Str(-1),DynStat.Tou(-4),DynStat.Spe(2),DynStat.Lib(1),DynStat.Sens(0.5)].length) == 14)
         {
            KGAMECLASS.kGAMECLASS.player.dynStats([DynStat.Str(-1),DynStat.Tou(-4),DynStat.Spe(2),DynStat.Lib(1),DynStat.Sens(0.5)][0],[DynStat.Str(-1),DynStat.Tou(-4),DynStat.Spe(2),DynStat.Lib(1),DynStat.Sens(0.5)][1],[DynStat.Str(-1),DynStat.Tou(-4),DynStat.Spe(2),DynStat.Lib(1),DynStat.Sens(0.5)][2],[DynStat.Str(-1),DynStat.Tou(-4),DynStat.Spe(2),DynStat.Lib(1),DynStat.Sens(0.5)][3],[DynStat.Str(-1),DynStat.Tou(-4),DynStat.Spe(2),DynStat.Lib(1),DynStat.Sens(0.5)][4],[DynStat.Str(-1),DynStat.Tou(-4),DynStat.Spe(2),DynStat.Lib(1),DynStat.Sens(0.5)][5],[DynStat.Str(-1),DynStat.Tou(-4),DynStat.Spe(2),DynStat.Lib(1),DynStat.Sens(0.5)][6],[DynStat.Str(-1),DynStat.Tou(-4),DynStat.Spe(2),DynStat.Lib(1),DynStat.Sens(0.5)][7],[DynStat.Str(-1),DynStat.Tou(-4),DynStat.Spe(2),DynStat.Lib(1),DynStat.Sens(0.5)][8],[DynStat.Str(-1),DynStat.Tou(-4),DynStat.Spe(2),DynStat.Lib(1),DynStat.Sens(0.5)][9],[DynStat.Str(-1),DynStat.Tou(-4),DynStat.Spe(2),DynStat.Lib(1),DynStat.Sens(0.5)][10],[DynStat.Str(-1),DynStat.Tou(-4)
            ,DynStat.Spe(2),DynStat.Lib(1),DynStat.Sens(0.5)][11],[DynStat.Str(-1),DynStat.Tou(-4),DynStat.Spe(2),DynStat.Lib(1),DynStat.Sens(0.5)][12],[DynStat.Str(-1),DynStat.Tou(-4),DynStat.Spe(2),DynStat.Lib(1),DynStat.Sens(0.5)][13]);
         }
         else if(int([DynStat.Str(-1),DynStat.Tou(-4),DynStat.Spe(2),DynStat.Lib(1),DynStat.Sens(0.5)].length) == 15)
         {
            KGAMECLASS.kGAMECLASS.player.dynStats([DynStat.Str(-1),DynStat.Tou(-4),DynStat.Spe(2),DynStat.Lib(1),DynStat.Sens(0.5)][0],[DynStat.Str(-1),DynStat.Tou(-4),DynStat.Spe(2),DynStat.Lib(1),DynStat.Sens(0.5)][1],[DynStat.Str(-1),DynStat.Tou(-4),DynStat.Spe(2),DynStat.Lib(1),DynStat.Sens(0.5)][2],[DynStat.Str(-1),DynStat.Tou(-4),DynStat.Spe(2),DynStat.Lib(1),DynStat.Sens(0.5)][3],[DynStat.Str(-1),DynStat.Tou(-4),DynStat.Spe(2),DynStat.Lib(1),DynStat.Sens(0.5)][4],[DynStat.Str(-1),DynStat.Tou(-4),DynStat.Spe(2),DynStat.Lib(1),DynStat.Sens(0.5)][5],[DynStat.Str(-1),DynStat.Tou(-4),DynStat.Spe(2),DynStat.Lib(1),DynStat.Sens(0.5)][6],[DynStat.Str(-1),DynStat.Tou(-4),DynStat.Spe(2),DynStat.Lib(1),DynStat.Sens(0.5)][7],[DynStat.Str(-1),DynStat.Tou(-4),DynStat.Spe(2),DynStat.Lib(1),DynStat.Sens(0.5)][8],[DynStat.Str(-1),DynStat.Tou(-4),DynStat.Spe(2),DynStat.Lib(1),DynStat.Sens(0.5)][9],[DynStat.Str(-1),DynStat.Tou(-4),DynStat.Spe(2),DynStat.Lib(1),DynStat.Sens(0.5)][10],[DynStat.Str(-1),DynStat.Tou(-4)
            ,DynStat.Spe(2),DynStat.Lib(1),DynStat.Sens(0.5)][11],[DynStat.Str(-1),DynStat.Tou(-4),DynStat.Spe(2),DynStat.Lib(1),DynStat.Sens(0.5)][12],[DynStat.Str(-1),DynStat.Tou(-4),DynStat.Spe(2),DynStat.Lib(1),DynStat.Sens(0.5)][13],[DynStat.Str(-1),DynStat.Tou(-4),DynStat.Spe(2),DynStat.Lib(1),DynStat.Sens(0.5)][14]);
         }
         else if(int([DynStat.Str(-1),DynStat.Tou(-4),DynStat.Spe(2),DynStat.Lib(1),DynStat.Sens(0.5)].length) == 16)
         {
            KGAMECLASS.kGAMECLASS.player.dynStats([DynStat.Str(-1),DynStat.Tou(-4),DynStat.Spe(2),DynStat.Lib(1),DynStat.Sens(0.5)][0],[DynStat.Str(-1),DynStat.Tou(-4),DynStat.Spe(2),DynStat.Lib(1),DynStat.Sens(0.5)][1],[DynStat.Str(-1),DynStat.Tou(-4),DynStat.Spe(2),DynStat.Lib(1),DynStat.Sens(0.5)][2],[DynStat.Str(-1),DynStat.Tou(-4),DynStat.Spe(2),DynStat.Lib(1),DynStat.Sens(0.5)][3],[DynStat.Str(-1),DynStat.Tou(-4),DynStat.Spe(2),DynStat.Lib(1),DynStat.Sens(0.5)][4],[DynStat.Str(-1),DynStat.Tou(-4),DynStat.Spe(2),DynStat.Lib(1),DynStat.Sens(0.5)][5],[DynStat.Str(-1),DynStat.Tou(-4),DynStat.Spe(2),DynStat.Lib(1),DynStat.Sens(0.5)][6],[DynStat.Str(-1),DynStat.Tou(-4),DynStat.Spe(2),DynStat.Lib(1),DynStat.Sens(0.5)][7],[DynStat.Str(-1),DynStat.Tou(-4),DynStat.Spe(2),DynStat.Lib(1),DynStat.Sens(0.5)][8],[DynStat.Str(-1),DynStat.Tou(-4),DynStat.Spe(2),DynStat.Lib(1),DynStat.Sens(0.5)][9],[DynStat.Str(-1),DynStat.Tou(-4),DynStat.Spe(2),DynStat.Lib(1),DynStat.Sens(0.5)][10],[DynStat.Str(-1),DynStat.Tou(-4)
            ,DynStat.Spe(2),DynStat.Lib(1),DynStat.Sens(0.5)][11],[DynStat.Str(-1),DynStat.Tou(-4),DynStat.Spe(2),DynStat.Lib(1),DynStat.Sens(0.5)][12],[DynStat.Str(-1),DynStat.Tou(-4),DynStat.Spe(2),DynStat.Lib(1),DynStat.Sens(0.5)][13],[DynStat.Str(-1),DynStat.Tou(-4),DynStat.Spe(2),DynStat.Lib(1),DynStat.Sens(0.5)][14],[DynStat.Str(-1),DynStat.Tou(-4),DynStat.Spe(2),DynStat.Lib(1),DynStat.Sens(0.5)][15]);
         }
         else if(int([DynStat.Str(-1),DynStat.Tou(-4),DynStat.Spe(2),DynStat.Lib(1),DynStat.Sens(0.5)].length) == 17)
         {
            KGAMECLASS.kGAMECLASS.player.dynStats([DynStat.Str(-1),DynStat.Tou(-4),DynStat.Spe(2),DynStat.Lib(1),DynStat.Sens(0.5)][0],[DynStat.Str(-1),DynStat.Tou(-4),DynStat.Spe(2),DynStat.Lib(1),DynStat.Sens(0.5)][1],[DynStat.Str(-1),DynStat.Tou(-4),DynStat.Spe(2),DynStat.Lib(1),DynStat.Sens(0.5)][2],[DynStat.Str(-1),DynStat.Tou(-4),DynStat.Spe(2),DynStat.Lib(1),DynStat.Sens(0.5)][3],[DynStat.Str(-1),DynStat.Tou(-4),DynStat.Spe(2),DynStat.Lib(1),DynStat.Sens(0.5)][4],[DynStat.Str(-1),DynStat.Tou(-4),DynStat.Spe(2),DynStat.Lib(1),DynStat.Sens(0.5)][5],[DynStat.Str(-1),DynStat.Tou(-4),DynStat.Spe(2),DynStat.Lib(1),DynStat.Sens(0.5)][6],[DynStat.Str(-1),DynStat.Tou(-4),DynStat.Spe(2),DynStat.Lib(1),DynStat.Sens(0.5)][7],[DynStat.Str(-1),DynStat.Tou(-4),DynStat.Spe(2),DynStat.Lib(1),DynStat.Sens(0.5)][8],[DynStat.Str(-1),DynStat.Tou(-4),DynStat.Spe(2),DynStat.Lib(1),DynStat.Sens(0.5)][9],[DynStat.Str(-1),DynStat.Tou(-4),DynStat.Spe(2),DynStat.Lib(1),DynStat.Sens(0.5)][10],[DynStat.Str(-1),DynStat.Tou(-4)
            ,DynStat.Spe(2),DynStat.Lib(1),DynStat.Sens(0.5)][11],[DynStat.Str(-1),DynStat.Tou(-4),DynStat.Spe(2),DynStat.Lib(1),DynStat.Sens(0.5)][12],[DynStat.Str(-1),DynStat.Tou(-4),DynStat.Spe(2),DynStat.Lib(1),DynStat.Sens(0.5)][13],[DynStat.Str(-1),DynStat.Tou(-4),DynStat.Spe(2),DynStat.Lib(1),DynStat.Sens(0.5)][14],[DynStat.Str(-1),DynStat.Tou(-4),DynStat.Spe(2),DynStat.Lib(1),DynStat.Sens(0.5)][15],[DynStat.Str(-1),DynStat.Tou(-4),DynStat.Spe(2),DynStat.Lib(1),DynStat.Sens(0.5)][16]);
         }
         else if(int([DynStat.Str(-1),DynStat.Tou(-4),DynStat.Spe(2),DynStat.Lib(1),DynStat.Sens(0.5)].length) == 18)
         {
            KGAMECLASS.kGAMECLASS.player.dynStats([DynStat.Str(-1),DynStat.Tou(-4),DynStat.Spe(2),DynStat.Lib(1),DynStat.Sens(0.5)][0],[DynStat.Str(-1),DynStat.Tou(-4),DynStat.Spe(2),DynStat.Lib(1),DynStat.Sens(0.5)][1],[DynStat.Str(-1),DynStat.Tou(-4),DynStat.Spe(2),DynStat.Lib(1),DynStat.Sens(0.5)][2],[DynStat.Str(-1),DynStat.Tou(-4),DynStat.Spe(2),DynStat.Lib(1),DynStat.Sens(0.5)][3],[DynStat.Str(-1),DynStat.Tou(-4),DynStat.Spe(2),DynStat.Lib(1),DynStat.Sens(0.5)][4],[DynStat.Str(-1),DynStat.Tou(-4),DynStat.Spe(2),DynStat.Lib(1),DynStat.Sens(0.5)][5],[DynStat.Str(-1),DynStat.Tou(-4),DynStat.Spe(2),DynStat.Lib(1),DynStat.Sens(0.5)][6],[DynStat.Str(-1),DynStat.Tou(-4),DynStat.Spe(2),DynStat.Lib(1),DynStat.Sens(0.5)][7],[DynStat.Str(-1),DynStat.Tou(-4),DynStat.Spe(2),DynStat.Lib(1),DynStat.Sens(0.5)][8],[DynStat.Str(-1),DynStat.Tou(-4),DynStat.Spe(2),DynStat.Lib(1),DynStat.Sens(0.5)][9],[DynStat.Str(-1),DynStat.Tou(-4),DynStat.Spe(2),DynStat.Lib(1),DynStat.Sens(0.5)][10],[DynStat.Str(-1),DynStat.Tou(-4)
            ,DynStat.Spe(2),DynStat.Lib(1),DynStat.Sens(0.5)][11],[DynStat.Str(-1),DynStat.Tou(-4),DynStat.Spe(2),DynStat.Lib(1),DynStat.Sens(0.5)][12],[DynStat.Str(-1),DynStat.Tou(-4),DynStat.Spe(2),DynStat.Lib(1),DynStat.Sens(0.5)][13],[DynStat.Str(-1),DynStat.Tou(-4),DynStat.Spe(2),DynStat.Lib(1),DynStat.Sens(0.5)][14],[DynStat.Str(-1),DynStat.Tou(-4),DynStat.Spe(2),DynStat.Lib(1),DynStat.Sens(0.5)][15],[DynStat.Str(-1),DynStat.Tou(-4),DynStat.Spe(2),DynStat.Lib(1),DynStat.Sens(0.5)][16],[DynStat.Str(-1),DynStat.Tou(-4),DynStat.Spe(2),DynStat.Lib(1),DynStat.Sens(0.5)][17]);
         }
         else if(int([DynStat.Str(-1),DynStat.Tou(-4),DynStat.Spe(2),DynStat.Lib(1),DynStat.Sens(0.5)].length) == 19)
         {
            KGAMECLASS.kGAMECLASS.player.dynStats([DynStat.Str(-1),DynStat.Tou(-4),DynStat.Spe(2),DynStat.Lib(1),DynStat.Sens(0.5)][0],[DynStat.Str(-1),DynStat.Tou(-4),DynStat.Spe(2),DynStat.Lib(1),DynStat.Sens(0.5)][1],[DynStat.Str(-1),DynStat.Tou(-4),DynStat.Spe(2),DynStat.Lib(1),DynStat.Sens(0.5)][2],[DynStat.Str(-1),DynStat.Tou(-4),DynStat.Spe(2),DynStat.Lib(1),DynStat.Sens(0.5)][3],[DynStat.Str(-1),DynStat.Tou(-4),DynStat.Spe(2),DynStat.Lib(1),DynStat.Sens(0.5)][4],[DynStat.Str(-1),DynStat.Tou(-4),DynStat.Spe(2),DynStat.Lib(1),DynStat.Sens(0.5)][5],[DynStat.Str(-1),DynStat.Tou(-4),DynStat.Spe(2),DynStat.Lib(1),DynStat.Sens(0.5)][6],[DynStat.Str(-1),DynStat.Tou(-4),DynStat.Spe(2),DynStat.Lib(1),DynStat.Sens(0.5)][7],[DynStat.Str(-1),DynStat.Tou(-4),DynStat.Spe(2),DynStat.Lib(1),DynStat.Sens(0.5)][8],[DynStat.Str(-1),DynStat.Tou(-4),DynStat.Spe(2),DynStat.Lib(1),DynStat.Sens(0.5)][9],[DynStat.Str(-1),DynStat.Tou(-4),DynStat.Spe(2),DynStat.Lib(1),DynStat.Sens(0.5)][10],[DynStat.Str(-1),DynStat.Tou(-4)
            ,DynStat.Spe(2),DynStat.Lib(1),DynStat.Sens(0.5)][11],[DynStat.Str(-1),DynStat.Tou(-4),DynStat.Spe(2),DynStat.Lib(1),DynStat.Sens(0.5)][12],[DynStat.Str(-1),DynStat.Tou(-4),DynStat.Spe(2),DynStat.Lib(1),DynStat.Sens(0.5)][13],[DynStat.Str(-1),DynStat.Tou(-4),DynStat.Spe(2),DynStat.Lib(1),DynStat.Sens(0.5)][14],[DynStat.Str(-1),DynStat.Tou(-4),DynStat.Spe(2),DynStat.Lib(1),DynStat.Sens(0.5)][15],[DynStat.Str(-1),DynStat.Tou(-4),DynStat.Spe(2),DynStat.Lib(1),DynStat.Sens(0.5)][16],[DynStat.Str(-1),DynStat.Tou(-4),DynStat.Spe(2),DynStat.Lib(1),DynStat.Sens(0.5)][17],[DynStat.Str(-1),DynStat.Tou(-4),DynStat.Spe(2),DynStat.Lib(1),DynStat.Sens(0.5)][18]);
         }
         else
         {
            if(int([DynStat.Str(-1),DynStat.Tou(-4),DynStat.Spe(2),DynStat.Lib(1),DynStat.Sens(0.5)].length) != 20)
            {
               throw "Too many rest arguments";
            }
            KGAMECLASS.kGAMECLASS.player.dynStats([DynStat.Str(-1),DynStat.Tou(-4),DynStat.Spe(2),DynStat.Lib(1),DynStat.Sens(0.5)][0],[DynStat.Str(-1),DynStat.Tou(-4),DynStat.Spe(2),DynStat.Lib(1),DynStat.Sens(0.5)][1],[DynStat.Str(-1),DynStat.Tou(-4),DynStat.Spe(2),DynStat.Lib(1),DynStat.Sens(0.5)][2],[DynStat.Str(-1),DynStat.Tou(-4),DynStat.Spe(2),DynStat.Lib(1),DynStat.Sens(0.5)][3],[DynStat.Str(-1),DynStat.Tou(-4),DynStat.Spe(2),DynStat.Lib(1),DynStat.Sens(0.5)][4],[DynStat.Str(-1),DynStat.Tou(-4),DynStat.Spe(2),DynStat.Lib(1),DynStat.Sens(0.5)][5],[DynStat.Str(-1),DynStat.Tou(-4),DynStat.Spe(2),DynStat.Lib(1),DynStat.Sens(0.5)][6],[DynStat.Str(-1),DynStat.Tou(-4),DynStat.Spe(2),DynStat.Lib(1),DynStat.Sens(0.5)][7],[DynStat.Str(-1),DynStat.Tou(-4),DynStat.Spe(2),DynStat.Lib(1),DynStat.Sens(0.5)][8],[DynStat.Str(-1),DynStat.Tou(-4),DynStat.Spe(2),DynStat.Lib(1),DynStat.Sens(0.5)][9],[DynStat.Str(-1),DynStat.Tou(-4),DynStat.Spe(2),DynStat.Lib(1),DynStat.Sens(0.5)][10],[DynStat.Str(-1),DynStat.Tou(-4)
            ,DynStat.Spe(2),DynStat.Lib(1),DynStat.Sens(0.5)][11],[DynStat.Str(-1),DynStat.Tou(-4),DynStat.Spe(2),DynStat.Lib(1),DynStat.Sens(0.5)][12],[DynStat.Str(-1),DynStat.Tou(-4),DynStat.Spe(2),DynStat.Lib(1),DynStat.Sens(0.5)][13],[DynStat.Str(-1),DynStat.Tou(-4),DynStat.Spe(2),DynStat.Lib(1),DynStat.Sens(0.5)][14],[DynStat.Str(-1),DynStat.Tou(-4),DynStat.Spe(2),DynStat.Lib(1),DynStat.Sens(0.5)][15],[DynStat.Str(-1),DynStat.Tou(-4),DynStat.Spe(2),DynStat.Lib(1),DynStat.Sens(0.5)][16],[DynStat.Str(-1),DynStat.Tou(-4),DynStat.Spe(2),DynStat.Lib(1),DynStat.Sens(0.5)][17],[DynStat.Str(-1),DynStat.Tou(-4),DynStat.Spe(2),DynStat.Lib(1),DynStat.Sens(0.5)][18],[DynStat.Str(-1),DynStat.Tou(-4),DynStat.Spe(2),DynStat.Lib(1),DynStat.Sens(0.5)][19]);
         }
         if(_loc1_.butt.rating < 14 && Utils.rand(2) == 0)
         {
            if(_loc1_.butt.rating < 10)
            {
               _temp_2.rating += 1;
               output.text("[pg]你注意到在经历了这场磨难之后，你的" + _loc1_.buttDescript() + "感觉变得更大更丰满了。");
            }
            else if(_loc1_.butt.rating < 14 && Utils.rand(2) == 0)
            {
               _temp_3.rating += 1;
               output.text("[pg]你注意到在经历了这场磨难之后，你的" + _loc1_.buttDescript() + "感觉变得更大更丰满了。");
            }
         }
         _loc1_.knockUpForce();
         output.text("[pg]");
      }
      
      public function updateVaginalPregnancy() : Boolean
      {
         var _loc1_:Player = KGAMECLASS.kGAMECLASS.player;
         var _loc2_:Boolean = false;
         if(_loc1_.get_pregnancyIncubation() == 350)
         {
            output.text("<b>你意识到你的肚子变大了。也许你应该少吃点那些奇怪的食物。</b>[pg]");
            _loc2_ = true;
         }
         if(_loc1_.get_pregnancyIncubation() == 280)
         {
            output.text("<b>你的肚子明显隆起。你可能怀孕了。</b>[pg]");
            _loc2_ = true;
         }
         if(_loc1_.get_pregnancyIncubation() == 216)
         {
            output.text("<b>你肚子上明显的怀孕隆起清晰可见。不知为何，你并不感到担心。只有满足。</b>[pg]");
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
            output.text("<b>怀孕的进程比你预想的要快得多。它已经和家乡任何孕妇的肚子一样大了。然而，一种温暖的满足感充满了你。</b>[pg]");
            _loc2_ = true;
         }
         if(_loc1_.get_pregnancyIncubation() == 120)
         {
            output.text("<b>你的肚子痛苦地膨胀着，被某种巨大野兽的后代撑得过分肿胀，让你难以活动。</b>[pg]");
            if(int([DynStat.Spe(-1),DynStat.Lib(0.5),DynStat.Sens(0.5),DynStat.Lust(4)].length) == 0)
            {
               KGAMECLASS.kGAMECLASS.player.dynStats();
            }
            else if(int([DynStat.Spe(-1),DynStat.Lib(0.5),DynStat.Sens(0.5),DynStat.Lust(4)].length) == 1)
            {
               KGAMECLASS.kGAMECLASS.player.dynStats([DynStat.Spe(-1),DynStat.Lib(0.5),DynStat.Sens(0.5),DynStat.Lust(4)][0]);
            }
            else if(int([DynStat.Spe(-1),DynStat.Lib(0.5),DynStat.Sens(0.5),DynStat.Lust(4)].length) == 2)
            {
               KGAMECLASS.kGAMECLASS.player.dynStats([DynStat.Spe(-1),DynStat.Lib(0.5),DynStat.Sens(0.5),DynStat.Lust(4)][0],[DynStat.Spe(-1),DynStat.Lib(0.5),DynStat.Sens(0.5),DynStat.Lust(4)][1]);
            }
            else if(int([DynStat.Spe(-1),DynStat.Lib(0.5),DynStat.Sens(0.5),DynStat.Lust(4)].length) == 3)
            {
               KGAMECLASS.kGAMECLASS.player.dynStats([DynStat.Spe(-1),DynStat.Lib(0.5),DynStat.Sens(0.5),DynStat.Lust(4)][0],[DynStat.Spe(-1),DynStat.Lib(0.5),DynStat.Sens(0.5),DynStat.Lust(4)][1],[DynStat.Spe(-1),DynStat.Lib(0.5),DynStat.Sens(0.5),DynStat.Lust(4)][2]);
            }
            else if(int([DynStat.Spe(-1),DynStat.Lib(0.5),DynStat.Sens(0.5),DynStat.Lust(4)].length) == 4)
            {
               KGAMECLASS.kGAMECLASS.player.dynStats([DynStat.Spe(-1),DynStat.Lib(0.5),DynStat.Sens(0.5),DynStat.Lust(4)][0],[DynStat.Spe(-1),DynStat.Lib(0.5),DynStat.Sens(0.5),DynStat.Lust(4)][1],[DynStat.Spe(-1),DynStat.Lib(0.5),DynStat.Sens(0.5),DynStat.Lust(4)][2],[DynStat.Spe(-1),DynStat.Lib(0.5),DynStat.Sens(0.5),DynStat.Lust(4)][3]);
            }
            else if(int([DynStat.Spe(-1),DynStat.Lib(0.5),DynStat.Sens(0.5),DynStat.Lust(4)].length) == 5)
            {
               KGAMECLASS.kGAMECLASS.player.dynStats([DynStat.Spe(-1),DynStat.Lib(0.5),DynStat.Sens(0.5),DynStat.Lust(4)][0],[DynStat.Spe(-1),DynStat.Lib(0.5),DynStat.Sens(0.5),DynStat.Lust(4)][1],[DynStat.Spe(-1),DynStat.Lib(0.5),DynStat.Sens(0.5),DynStat.Lust(4)][2],[DynStat.Spe(-1),DynStat.Lib(0.5),DynStat.Sens(0.5),DynStat.Lust(4)][3],[DynStat.Spe(-1),DynStat.Lib(0.5),DynStat.Sens(0.5),DynStat.Lust(4)][4]);
            }
            else if(int([DynStat.Spe(-1),DynStat.Lib(0.5),DynStat.Sens(0.5),DynStat.Lust(4)].length) == 6)
            {
               KGAMECLASS.kGAMECLASS.player.dynStats([DynStat.Spe(-1),DynStat.Lib(0.5),DynStat.Sens(0.5),DynStat.Lust(4)][0],[DynStat.Spe(-1),DynStat.Lib(0.5),DynStat.Sens(0.5),DynStat.Lust(4)][1],[DynStat.Spe(-1),DynStat.Lib(0.5),DynStat.Sens(0.5),DynStat.Lust(4)][2],[DynStat.Spe(-1),DynStat.Lib(0.5),DynStat.Sens(0.5),DynStat.Lust(4)][3],[DynStat.Spe(-1),DynStat.Lib(0.5),DynStat.Sens(0.5),DynStat.Lust(4)][4],[DynStat.Spe(-1),DynStat.Lib(0.5),DynStat.Sens(0.5),DynStat.Lust(4)][5]);
            }
            else if(int([DynStat.Spe(-1),DynStat.Lib(0.5),DynStat.Sens(0.5),DynStat.Lust(4)].length) == 7)
            {
               KGAMECLASS.kGAMECLASS.player.dynStats([DynStat.Spe(-1),DynStat.Lib(0.5),DynStat.Sens(0.5),DynStat.Lust(4)][0],[DynStat.Spe(-1),DynStat.Lib(0.5),DynStat.Sens(0.5),DynStat.Lust(4)][1],[DynStat.Spe(-1),DynStat.Lib(0.5),DynStat.Sens(0.5),DynStat.Lust(4)][2],[DynStat.Spe(-1),DynStat.Lib(0.5),DynStat.Sens(0.5),DynStat.Lust(4)][3],[DynStat.Spe(-1),DynStat.Lib(0.5),DynStat.Sens(0.5),DynStat.Lust(4)][4],[DynStat.Spe(-1),DynStat.Lib(0.5),DynStat.Sens(0.5),DynStat.Lust(4)][5],[DynStat.Spe(-1),DynStat.Lib(0.5),DynStat.Sens(0.5),DynStat.Lust(4)][6]);
            }
            else if(int([DynStat.Spe(-1),DynStat.Lib(0.5),DynStat.Sens(0.5),DynStat.Lust(4)].length) == 8)
            {
               KGAMECLASS.kGAMECLASS.player.dynStats([DynStat.Spe(-1),DynStat.Lib(0.5),DynStat.Sens(0.5),DynStat.Lust(4)][0],[DynStat.Spe(-1),DynStat.Lib(0.5),DynStat.Sens(0.5),DynStat.Lust(4)][1],[DynStat.Spe(-1),DynStat.Lib(0.5),DynStat.Sens(0.5),DynStat.Lust(4)][2],[DynStat.Spe(-1),DynStat.Lib(0.5),DynStat.Sens(0.5),DynStat.Lust(4)][3],[DynStat.Spe(-1),DynStat.Lib(0.5),DynStat.Sens(0.5),DynStat.Lust(4)][4],[DynStat.Spe(-1),DynStat.Lib(0.5),DynStat.Sens(0.5),DynStat.Lust(4)][5],[DynStat.Spe(-1),DynStat.Lib(0.5),DynStat.Sens(0.5),DynStat.Lust(4)][6],[DynStat.Spe(-1),DynStat.Lib(0.5),DynStat.Sens(0.5),DynStat.Lust(4)][7]);
            }
            else if(int([DynStat.Spe(-1),DynStat.Lib(0.5),DynStat.Sens(0.5),DynStat.Lust(4)].length) == 9)
            {
               KGAMECLASS.kGAMECLASS.player.dynStats([DynStat.Spe(-1),DynStat.Lib(0.5),DynStat.Sens(0.5),DynStat.Lust(4)][0],[DynStat.Spe(-1),DynStat.Lib(0.5),DynStat.Sens(0.5),DynStat.Lust(4)][1],[DynStat.Spe(-1),DynStat.Lib(0.5),DynStat.Sens(0.5),DynStat.Lust(4)][2],[DynStat.Spe(-1),DynStat.Lib(0.5),DynStat.Sens(0.5),DynStat.Lust(4)][3],[DynStat.Spe(-1),DynStat.Lib(0.5),DynStat.Sens(0.5),DynStat.Lust(4)][4],[DynStat.Spe(-1),DynStat.Lib(0.5),DynStat.Sens(0.5),DynStat.Lust(4)][5],[DynStat.Spe(-1),DynStat.Lib(0.5),DynStat.Sens(0.5),DynStat.Lust(4)][6],[DynStat.Spe(-1),DynStat.Lib(0.5),DynStat.Sens(0.5),DynStat.Lust(4)][7],[DynStat.Spe(-1),DynStat.Lib(0.5),DynStat.Sens(0.5),DynStat.Lust(4)][8]);
            }
            else if(int([DynStat.Spe(-1),DynStat.Lib(0.5),DynStat.Sens(0.5),DynStat.Lust(4)].length) == 10)
            {
               KGAMECLASS.kGAMECLASS.player.dynStats([DynStat.Spe(-1),DynStat.Lib(0.5),DynStat.Sens(0.5),DynStat.Lust(4)][0],[DynStat.Spe(-1),DynStat.Lib(0.5),DynStat.Sens(0.5),DynStat.Lust(4)][1],[DynStat.Spe(-1),DynStat.Lib(0.5),DynStat.Sens(0.5),DynStat.Lust(4)][2],[DynStat.Spe(-1),DynStat.Lib(0.5),DynStat.Sens(0.5),DynStat.Lust(4)][3],[DynStat.Spe(-1),DynStat.Lib(0.5),DynStat.Sens(0.5),DynStat.Lust(4)][4],[DynStat.Spe(-1),DynStat.Lib(0.5),DynStat.Sens(0.5),DynStat.Lust(4)][5],[DynStat.Spe(-1),DynStat.Lib(0.5),DynStat.Sens(0.5),DynStat.Lust(4)][6],[DynStat.Spe(-1),DynStat.Lib(0.5),DynStat.Sens(0.5),DynStat.Lust(4)][7],[DynStat.Spe(-1),DynStat.Lib(0.5),DynStat.Sens(0.5),DynStat.Lust(4)][8],[DynStat.Spe(-1),DynStat.Lib(0.5),DynStat.Sens(0.5),DynStat.Lust(4)][9]);
            }
            else if(int([DynStat.Spe(-1),DynStat.Lib(0.5),DynStat.Sens(0.5),DynStat.Lust(4)].length) == 11)
            {
               KGAMECLASS.kGAMECLASS.player.dynStats([DynStat.Spe(-1),DynStat.Lib(0.5),DynStat.Sens(0.5),DynStat.Lust(4)][0],[DynStat.Spe(-1),DynStat.Lib(0.5),DynStat.Sens(0.5),DynStat.Lust(4)][1],[DynStat.Spe(-1),DynStat.Lib(0.5),DynStat.Sens(0.5),DynStat.Lust(4)][2],[DynStat.Spe(-1),DynStat.Lib(0.5),DynStat.Sens(0.5),DynStat.Lust(4)][3],[DynStat.Spe(-1),DynStat.Lib(0.5),DynStat.Sens(0.5),DynStat.Lust(4)][4],[DynStat.Spe(-1),DynStat.Lib(0.5),DynStat.Sens(0.5),DynStat.Lust(4)][5],[DynStat.Spe(-1),DynStat.Lib(0.5),DynStat.Sens(0.5),DynStat.Lust(4)][6],[DynStat.Spe(-1),DynStat.Lib(0.5),DynStat.Sens(0.5),DynStat.Lust(4)][7],[DynStat.Spe(-1),DynStat.Lib(0.5),DynStat.Sens(0.5),DynStat.Lust(4)][8],[DynStat.Spe(-1),DynStat.Lib(0.5),DynStat.Sens(0.5),DynStat.Lust(4)][9],[DynStat.Spe(-1),DynStat.Lib(0.5),DynStat.Sens(0.5),DynStat.Lust(4)][10]);
            }
            else if(int([DynStat.Spe(-1),DynStat.Lib(0.5),DynStat.Sens(0.5),DynStat.Lust(4)].length) == 12)
            {
               KGAMECLASS.kGAMECLASS.player.dynStats([DynStat.Spe(-1),DynStat.Lib(0.5),DynStat.Sens(0.5),DynStat.Lust(4)][0],[DynStat.Spe(-1),DynStat.Lib(0.5),DynStat.Sens(0.5),DynStat.Lust(4)][1],[DynStat.Spe(-1),DynStat.Lib(0.5),DynStat.Sens(0.5),DynStat.Lust(4)][2],[DynStat.Spe(-1),DynStat.Lib(0.5),DynStat.Sens(0.5),DynStat.Lust(4)][3],[DynStat.Spe(-1),DynStat.Lib(0.5),DynStat.Sens(0.5),DynStat.Lust(4)][4],[DynStat.Spe(-1),DynStat.Lib(0.5),DynStat.Sens(0.5),DynStat.Lust(4)][5],[DynStat.Spe(-1),DynStat.Lib(0.5),DynStat.Sens(0.5),DynStat.Lust(4)][6],[DynStat.Spe(-1),DynStat.Lib(0.5),DynStat.Sens(0.5),DynStat.Lust(4)][7],[DynStat.Spe(-1),DynStat.Lib(0.5),DynStat.Sens(0.5),DynStat.Lust(4)][8],[DynStat.Spe(-1),DynStat.Lib(0.5),DynStat.Sens(0.5),DynStat.Lust(4)][9],[DynStat.Spe(-1),DynStat.Lib(0.5),DynStat.Sens(0.5),DynStat.Lust(4)][10],[DynStat.Spe(-1),DynStat.Lib(0.5),DynStat.Sens(0.5),DynStat.Lust(4)][11]);
            }
            else if(int([DynStat.Spe(-1),DynStat.Lib(0.5),DynStat.Sens(0.5),DynStat.Lust(4)].length) == 13)
            {
               KGAMECLASS.kGAMECLASS.player.dynStats([DynStat.Spe(-1),DynStat.Lib(0.5),DynStat.Sens(0.5),DynStat.Lust(4)][0],[DynStat.Spe(-1),DynStat.Lib(0.5),DynStat.Sens(0.5),DynStat.Lust(4)][1],[DynStat.Spe(-1),DynStat.Lib(0.5),DynStat.Sens(0.5),DynStat.Lust(4)][2],[DynStat.Spe(-1),DynStat.Lib(0.5),DynStat.Sens(0.5),DynStat.Lust(4)][3],[DynStat.Spe(-1),DynStat.Lib(0.5),DynStat.Sens(0.5),DynStat.Lust(4)][4],[DynStat.Spe(-1),DynStat.Lib(0.5),DynStat.Sens(0.5),DynStat.Lust(4)][5],[DynStat.Spe(-1),DynStat.Lib(0.5),DynStat.Sens(0.5),DynStat.Lust(4)][6],[DynStat.Spe(-1),DynStat.Lib(0.5),DynStat.Sens(0.5),DynStat.Lust(4)][7],[DynStat.Spe(-1),DynStat.Lib(0.5),DynStat.Sens(0.5),DynStat.Lust(4)][8],[DynStat.Spe(-1),DynStat.Lib(0.5),DynStat.Sens(0.5),DynStat.Lust(4)][9],[DynStat.Spe(-1),DynStat.Lib(0.5),DynStat.Sens(0.5),DynStat.Lust(4)][10],[DynStat.Spe(-1),DynStat.Lib(0.5),DynStat.Sens(0.5),DynStat.Lust(4)][11],[DynStat.Spe(-1),DynStat.Lib(0.5),DynStat.Sens(0.5),DynStat.Lust(4)][12]);
            }
            else if(int([DynStat.Spe(-1),DynStat.Lib(0.5),DynStat.Sens(0.5),DynStat.Lust(4)].length) == 14)
            {
               KGAMECLASS.kGAMECLASS.player.dynStats([DynStat.Spe(-1),DynStat.Lib(0.5),DynStat.Sens(0.5),DynStat.Lust(4)][0],[DynStat.Spe(-1),DynStat.Lib(0.5),DynStat.Sens(0.5),DynStat.Lust(4)][1],[DynStat.Spe(-1),DynStat.Lib(0.5),DynStat.Sens(0.5),DynStat.Lust(4)][2],[DynStat.Spe(-1),DynStat.Lib(0.5),DynStat.Sens(0.5),DynStat.Lust(4)][3],[DynStat.Spe(-1),DynStat.Lib(0.5),DynStat.Sens(0.5),DynStat.Lust(4)][4],[DynStat.Spe(-1),DynStat.Lib(0.5),DynStat.Sens(0.5),DynStat.Lust(4)][5],[DynStat.Spe(-1),DynStat.Lib(0.5),DynStat.Sens(0.5),DynStat.Lust(4)][6],[DynStat.Spe(-1),DynStat.Lib(0.5),DynStat.Sens(0.5),DynStat.Lust(4)][7],[DynStat.Spe(-1),DynStat.Lib(0.5),DynStat.Sens(0.5),DynStat.Lust(4)][8],[DynStat.Spe(-1),DynStat.Lib(0.5),DynStat.Sens(0.5),DynStat.Lust(4)][9],[DynStat.Spe(-1),DynStat.Lib(0.5),DynStat.Sens(0.5),DynStat.Lust(4)][10],[DynStat.Spe(-1),DynStat.Lib(0.5),DynStat.Sens(0.5),DynStat.Lust(4)][11],[DynStat.Spe(-1),DynStat.Lib(0.5),DynStat.Sens(0.5),DynStat.Lust(4)][12],[DynStat.Spe(-1),DynStat
               .Lib(0.5),DynStat.Sens(0.5),DynStat.Lust(4)][13]);
            }
            else if(int([DynStat.Spe(-1),DynStat.Lib(0.5),DynStat.Sens(0.5),DynStat.Lust(4)].length) == 15)
            {
               KGAMECLASS.kGAMECLASS.player.dynStats([DynStat.Spe(-1),DynStat.Lib(0.5),DynStat.Sens(0.5),DynStat.Lust(4)][0],[DynStat.Spe(-1),DynStat.Lib(0.5),DynStat.Sens(0.5),DynStat.Lust(4)][1],[DynStat.Spe(-1),DynStat.Lib(0.5),DynStat.Sens(0.5),DynStat.Lust(4)][2],[DynStat.Spe(-1),DynStat.Lib(0.5),DynStat.Sens(0.5),DynStat.Lust(4)][3],[DynStat.Spe(-1),DynStat.Lib(0.5),DynStat.Sens(0.5),DynStat.Lust(4)][4],[DynStat.Spe(-1),DynStat.Lib(0.5),DynStat.Sens(0.5),DynStat.Lust(4)][5],[DynStat.Spe(-1),DynStat.Lib(0.5),DynStat.Sens(0.5),DynStat.Lust(4)][6],[DynStat.Spe(-1),DynStat.Lib(0.5),DynStat.Sens(0.5),DynStat.Lust(4)][7],[DynStat.Spe(-1),DynStat.Lib(0.5),DynStat.Sens(0.5),DynStat.Lust(4)][8],[DynStat.Spe(-1),DynStat.Lib(0.5),DynStat.Sens(0.5),DynStat.Lust(4)][9],[DynStat.Spe(-1),DynStat.Lib(0.5),DynStat.Sens(0.5),DynStat.Lust(4)][10],[DynStat.Spe(-1),DynStat.Lib(0.5),DynStat.Sens(0.5),DynStat.Lust(4)][11],[DynStat.Spe(-1),DynStat.Lib(0.5),DynStat.Sens(0.5),DynStat.Lust(4)][12],[DynStat.Spe(-1),DynStat
               .Lib(0.5),DynStat.Sens(0.5),DynStat.Lust(4)][13],[DynStat.Spe(-1),DynStat.Lib(0.5),DynStat.Sens(0.5),DynStat.Lust(4)][14]);
            }
            else if(int([DynStat.Spe(-1),DynStat.Lib(0.5),DynStat.Sens(0.5),DynStat.Lust(4)].length) == 16)
            {
               KGAMECLASS.kGAMECLASS.player.dynStats([DynStat.Spe(-1),DynStat.Lib(0.5),DynStat.Sens(0.5),DynStat.Lust(4)][0],[DynStat.Spe(-1),DynStat.Lib(0.5),DynStat.Sens(0.5),DynStat.Lust(4)][1],[DynStat.Spe(-1),DynStat.Lib(0.5),DynStat.Sens(0.5),DynStat.Lust(4)][2],[DynStat.Spe(-1),DynStat.Lib(0.5),DynStat.Sens(0.5),DynStat.Lust(4)][3],[DynStat.Spe(-1),DynStat.Lib(0.5),DynStat.Sens(0.5),DynStat.Lust(4)][4],[DynStat.Spe(-1),DynStat.Lib(0.5),DynStat.Sens(0.5),DynStat.Lust(4)][5],[DynStat.Spe(-1),DynStat.Lib(0.5),DynStat.Sens(0.5),DynStat.Lust(4)][6],[DynStat.Spe(-1),DynStat.Lib(0.5),DynStat.Sens(0.5),DynStat.Lust(4)][7],[DynStat.Spe(-1),DynStat.Lib(0.5),DynStat.Sens(0.5),DynStat.Lust(4)][8],[DynStat.Spe(-1),DynStat.Lib(0.5),DynStat.Sens(0.5),DynStat.Lust(4)][9],[DynStat.Spe(-1),DynStat.Lib(0.5),DynStat.Sens(0.5),DynStat.Lust(4)][10],[DynStat.Spe(-1),DynStat.Lib(0.5),DynStat.Sens(0.5),DynStat.Lust(4)][11],[DynStat.Spe(-1),DynStat.Lib(0.5),DynStat.Sens(0.5),DynStat.Lust(4)][12],[DynStat.Spe(-1),DynStat
               .Lib(0.5),DynStat.Sens(0.5),DynStat.Lust(4)][13],[DynStat.Spe(-1),DynStat.Lib(0.5),DynStat.Sens(0.5),DynStat.Lust(4)][14],[DynStat.Spe(-1),DynStat.Lib(0.5),DynStat.Sens(0.5),DynStat.Lust(4)][15]);
            }
            else if(int([DynStat.Spe(-1),DynStat.Lib(0.5),DynStat.Sens(0.5),DynStat.Lust(4)].length) == 17)
            {
               KGAMECLASS.kGAMECLASS.player.dynStats([DynStat.Spe(-1),DynStat.Lib(0.5),DynStat.Sens(0.5),DynStat.Lust(4)][0],[DynStat.Spe(-1),DynStat.Lib(0.5),DynStat.Sens(0.5),DynStat.Lust(4)][1],[DynStat.Spe(-1),DynStat.Lib(0.5),DynStat.Sens(0.5),DynStat.Lust(4)][2],[DynStat.Spe(-1),DynStat.Lib(0.5),DynStat.Sens(0.5),DynStat.Lust(4)][3],[DynStat.Spe(-1),DynStat.Lib(0.5),DynStat.Sens(0.5),DynStat.Lust(4)][4],[DynStat.Spe(-1),DynStat.Lib(0.5),DynStat.Sens(0.5),DynStat.Lust(4)][5],[DynStat.Spe(-1),DynStat.Lib(0.5),DynStat.Sens(0.5),DynStat.Lust(4)][6],[DynStat.Spe(-1),DynStat.Lib(0.5),DynStat.Sens(0.5),DynStat.Lust(4)][7],[DynStat.Spe(-1),DynStat.Lib(0.5),DynStat.Sens(0.5),DynStat.Lust(4)][8],[DynStat.Spe(-1),DynStat.Lib(0.5),DynStat.Sens(0.5),DynStat.Lust(4)][9],[DynStat.Spe(-1),DynStat.Lib(0.5),DynStat.Sens(0.5),DynStat.Lust(4)][10],[DynStat.Spe(-1),DynStat.Lib(0.5),DynStat.Sens(0.5),DynStat.Lust(4)][11],[DynStat.Spe(-1),DynStat.Lib(0.5),DynStat.Sens(0.5),DynStat.Lust(4)][12],[DynStat.Spe(-1),DynStat
               .Lib(0.5),DynStat.Sens(0.5),DynStat.Lust(4)][13],[DynStat.Spe(-1),DynStat.Lib(0.5),DynStat.Sens(0.5),DynStat.Lust(4)][14],[DynStat.Spe(-1),DynStat.Lib(0.5),DynStat.Sens(0.5),DynStat.Lust(4)][15],[DynStat.Spe(-1),DynStat.Lib(0.5),DynStat.Sens(0.5),DynStat.Lust(4)][16]);
            }
            else if(int([DynStat.Spe(-1),DynStat.Lib(0.5),DynStat.Sens(0.5),DynStat.Lust(4)].length) == 18)
            {
               KGAMECLASS.kGAMECLASS.player.dynStats([DynStat.Spe(-1),DynStat.Lib(0.5),DynStat.Sens(0.5),DynStat.Lust(4)][0],[DynStat.Spe(-1),DynStat.Lib(0.5),DynStat.Sens(0.5),DynStat.Lust(4)][1],[DynStat.Spe(-1),DynStat.Lib(0.5),DynStat.Sens(0.5),DynStat.Lust(4)][2],[DynStat.Spe(-1),DynStat.Lib(0.5),DynStat.Sens(0.5),DynStat.Lust(4)][3],[DynStat.Spe(-1),DynStat.Lib(0.5),DynStat.Sens(0.5),DynStat.Lust(4)][4],[DynStat.Spe(-1),DynStat.Lib(0.5),DynStat.Sens(0.5),DynStat.Lust(4)][5],[DynStat.Spe(-1),DynStat.Lib(0.5),DynStat.Sens(0.5),DynStat.Lust(4)][6],[DynStat.Spe(-1),DynStat.Lib(0.5),DynStat.Sens(0.5),DynStat.Lust(4)][7],[DynStat.Spe(-1),DynStat.Lib(0.5),DynStat.Sens(0.5),DynStat.Lust(4)][8],[DynStat.Spe(-1),DynStat.Lib(0.5),DynStat.Sens(0.5),DynStat.Lust(4)][9],[DynStat.Spe(-1),DynStat.Lib(0.5),DynStat.Sens(0.5),DynStat.Lust(4)][10],[DynStat.Spe(-1),DynStat.Lib(0.5),DynStat.Sens(0.5),DynStat.Lust(4)][11],[DynStat.Spe(-1),DynStat.Lib(0.5),DynStat.Sens(0.5),DynStat.Lust(4)][12],[DynStat.Spe(-1),DynStat
               .Lib(0.5),DynStat.Sens(0.5),DynStat.Lust(4)][13],[DynStat.Spe(-1),DynStat.Lib(0.5),DynStat.Sens(0.5),DynStat.Lust(4)][14],[DynStat.Spe(-1),DynStat.Lib(0.5),DynStat.Sens(0.5),DynStat.Lust(4)][15],[DynStat.Spe(-1),DynStat.Lib(0.5),DynStat.Sens(0.5),DynStat.Lust(4)][16],[DynStat.Spe(-1),DynStat.Lib(0.5),DynStat.Sens(0.5),DynStat.Lust(4)][17]);
            }
            else if(int([DynStat.Spe(-1),DynStat.Lib(0.5),DynStat.Sens(0.5),DynStat.Lust(4)].length) == 19)
            {
               KGAMECLASS.kGAMECLASS.player.dynStats([DynStat.Spe(-1),DynStat.Lib(0.5),DynStat.Sens(0.5),DynStat.Lust(4)][0],[DynStat.Spe(-1),DynStat.Lib(0.5),DynStat.Sens(0.5),DynStat.Lust(4)][1],[DynStat.Spe(-1),DynStat.Lib(0.5),DynStat.Sens(0.5),DynStat.Lust(4)][2],[DynStat.Spe(-1),DynStat.Lib(0.5),DynStat.Sens(0.5),DynStat.Lust(4)][3],[DynStat.Spe(-1),DynStat.Lib(0.5),DynStat.Sens(0.5),DynStat.Lust(4)][4],[DynStat.Spe(-1),DynStat.Lib(0.5),DynStat.Sens(0.5),DynStat.Lust(4)][5],[DynStat.Spe(-1),DynStat.Lib(0.5),DynStat.Sens(0.5),DynStat.Lust(4)][6],[DynStat.Spe(-1),DynStat.Lib(0.5),DynStat.Sens(0.5),DynStat.Lust(4)][7],[DynStat.Spe(-1),DynStat.Lib(0.5),DynStat.Sens(0.5),DynStat.Lust(4)][8],[DynStat.Spe(-1),DynStat.Lib(0.5),DynStat.Sens(0.5),DynStat.Lust(4)][9],[DynStat.Spe(-1),DynStat.Lib(0.5),DynStat.Sens(0.5),DynStat.Lust(4)][10],[DynStat.Spe(-1),DynStat.Lib(0.5),DynStat.Sens(0.5),DynStat.Lust(4)][11],[DynStat.Spe(-1),DynStat.Lib(0.5),DynStat.Sens(0.5),DynStat.Lust(4)][12],[DynStat.Spe(-1),DynStat
               .Lib(0.5),DynStat.Sens(0.5),DynStat.Lust(4)][13],[DynStat.Spe(-1),DynStat.Lib(0.5),DynStat.Sens(0.5),DynStat.Lust(4)][14],[DynStat.Spe(-1),DynStat.Lib(0.5),DynStat.Sens(0.5),DynStat.Lust(4)][15],[DynStat.Spe(-1),DynStat.Lib(0.5),DynStat.Sens(0.5),DynStat.Lust(4)][16],[DynStat.Spe(-1),DynStat.Lib(0.5),DynStat.Sens(0.5),DynStat.Lust(4)][17],[DynStat.Spe(-1),DynStat.Lib(0.5),DynStat.Sens(0.5),DynStat.Lust(4)][18]);
            }
            else
            {
               if(int([DynStat.Spe(-1),DynStat.Lib(0.5),DynStat.Sens(0.5),DynStat.Lust(4)].length) != 20)
               {
                  throw "Too many rest arguments";
               }
               KGAMECLASS.kGAMECLASS.player.dynStats([DynStat.Spe(-1),DynStat.Lib(0.5),DynStat.Sens(0.5),DynStat.Lust(4)][0],[DynStat.Spe(-1),DynStat.Lib(0.5),DynStat.Sens(0.5),DynStat.Lust(4)][1],[DynStat.Spe(-1),DynStat.Lib(0.5),DynStat.Sens(0.5),DynStat.Lust(4)][2],[DynStat.Spe(-1),DynStat.Lib(0.5),DynStat.Sens(0.5),DynStat.Lust(4)][3],[DynStat.Spe(-1),DynStat.Lib(0.5),DynStat.Sens(0.5),DynStat.Lust(4)][4],[DynStat.Spe(-1),DynStat.Lib(0.5),DynStat.Sens(0.5),DynStat.Lust(4)][5],[DynStat.Spe(-1),DynStat.Lib(0.5),DynStat.Sens(0.5),DynStat.Lust(4)][6],[DynStat.Spe(-1),DynStat.Lib(0.5),DynStat.Sens(0.5),DynStat.Lust(4)][7],[DynStat.Spe(-1),DynStat.Lib(0.5),DynStat.Sens(0.5),DynStat.Lust(4)][8],[DynStat.Spe(-1),DynStat.Lib(0.5),DynStat.Sens(0.5),DynStat.Lust(4)][9],[DynStat.Spe(-1),DynStat.Lib(0.5),DynStat.Sens(0.5),DynStat.Lust(4)][10],[DynStat.Spe(-1),DynStat.Lib(0.5),DynStat.Sens(0.5),DynStat.Lust(4)][11],[DynStat.Spe(-1),DynStat.Lib(0.5),DynStat.Sens(0.5),DynStat.Lust(4)][12],[DynStat.Spe(-1),DynStat
               .Lib(0.5),DynStat.Sens(0.5),DynStat.Lust(4)][13],[DynStat.Spe(-1),DynStat.Lib(0.5),DynStat.Sens(0.5),DynStat.Lust(4)][14],[DynStat.Spe(-1),DynStat.Lib(0.5),DynStat.Sens(0.5),DynStat.Lust(4)][15],[DynStat.Spe(-1),DynStat.Lib(0.5),DynStat.Sens(0.5),DynStat.Lust(4)][16],[DynStat.Spe(-1),DynStat.Lib(0.5),DynStat.Sens(0.5),DynStat.Lust(4)][17],[DynStat.Spe(-1),DynStat.Lib(0.5),DynStat.Sens(0.5),DynStat.Lust(4)][18],[DynStat.Spe(-1),DynStat.Lib(0.5),DynStat.Sens(0.5),DynStat.Lust(4)][19]);
            }
            _loc2_ = true;
         }
         if(_loc1_.get_pregnancyIncubation() == 72)
         {
            output.text("<b>你的肚子绝对有沙滩排球那么大，而且还在继续变大。奇怪的是，你并没有感到阻碍。事实上，你感觉想跑……</b>[pg]");
            if(int([DynStat.Spe(-1),DynStat.Lib(1),DynStat.Sens(1),DynStat.Lust(4)].length) == 0)
            {
               KGAMECLASS.kGAMECLASS.player.dynStats();
            }
            else if(int([DynStat.Spe(-1),DynStat.Lib(1),DynStat.Sens(1),DynStat.Lust(4)].length) == 1)
            {
               KGAMECLASS.kGAMECLASS.player.dynStats([DynStat.Spe(-1),DynStat.Lib(1),DynStat.Sens(1),DynStat.Lust(4)][0]);
            }
            else if(int([DynStat.Spe(-1),DynStat.Lib(1),DynStat.Sens(1),DynStat.Lust(4)].length) == 2)
            {
               KGAMECLASS.kGAMECLASS.player.dynStats([DynStat.Spe(-1),DynStat.Lib(1),DynStat.Sens(1),DynStat.Lust(4)][0],[DynStat.Spe(-1),DynStat.Lib(1),DynStat.Sens(1),DynStat.Lust(4)][1]);
            }
            else if(int([DynStat.Spe(-1),DynStat.Lib(1),DynStat.Sens(1),DynStat.Lust(4)].length) == 3)
            {
               KGAMECLASS.kGAMECLASS.player.dynStats([DynStat.Spe(-1),DynStat.Lib(1),DynStat.Sens(1),DynStat.Lust(4)][0],[DynStat.Spe(-1),DynStat.Lib(1),DynStat.Sens(1),DynStat.Lust(4)][1],[DynStat.Spe(-1),DynStat.Lib(1),DynStat.Sens(1),DynStat.Lust(4)][2]);
            }
            else if(int([DynStat.Spe(-1),DynStat.Lib(1),DynStat.Sens(1),DynStat.Lust(4)].length) == 4)
            {
               KGAMECLASS.kGAMECLASS.player.dynStats([DynStat.Spe(-1),DynStat.Lib(1),DynStat.Sens(1),DynStat.Lust(4)][0],[DynStat.Spe(-1),DynStat.Lib(1),DynStat.Sens(1),DynStat.Lust(4)][1],[DynStat.Spe(-1),DynStat.Lib(1),DynStat.Sens(1),DynStat.Lust(4)][2],[DynStat.Spe(-1),DynStat.Lib(1),DynStat.Sens(1),DynStat.Lust(4)][3]);
            }
            else if(int([DynStat.Spe(-1),DynStat.Lib(1),DynStat.Sens(1),DynStat.Lust(4)].length) == 5)
            {
               KGAMECLASS.kGAMECLASS.player.dynStats([DynStat.Spe(-1),DynStat.Lib(1),DynStat.Sens(1),DynStat.Lust(4)][0],[DynStat.Spe(-1),DynStat.Lib(1),DynStat.Sens(1),DynStat.Lust(4)][1],[DynStat.Spe(-1),DynStat.Lib(1),DynStat.Sens(1),DynStat.Lust(4)][2],[DynStat.Spe(-1),DynStat.Lib(1),DynStat.Sens(1),DynStat.Lust(4)][3],[DynStat.Spe(-1),DynStat.Lib(1),DynStat.Sens(1),DynStat.Lust(4)][4]);
            }
            else if(int([DynStat.Spe(-1),DynStat.Lib(1),DynStat.Sens(1),DynStat.Lust(4)].length) == 6)
            {
               KGAMECLASS.kGAMECLASS.player.dynStats([DynStat.Spe(-1),DynStat.Lib(1),DynStat.Sens(1),DynStat.Lust(4)][0],[DynStat.Spe(-1),DynStat.Lib(1),DynStat.Sens(1),DynStat.Lust(4)][1],[DynStat.Spe(-1),DynStat.Lib(1),DynStat.Sens(1),DynStat.Lust(4)][2],[DynStat.Spe(-1),DynStat.Lib(1),DynStat.Sens(1),DynStat.Lust(4)][3],[DynStat.Spe(-1),DynStat.Lib(1),DynStat.Sens(1),DynStat.Lust(4)][4],[DynStat.Spe(-1),DynStat.Lib(1),DynStat.Sens(1),DynStat.Lust(4)][5]);
            }
            else if(int([DynStat.Spe(-1),DynStat.Lib(1),DynStat.Sens(1),DynStat.Lust(4)].length) == 7)
            {
               KGAMECLASS.kGAMECLASS.player.dynStats([DynStat.Spe(-1),DynStat.Lib(1),DynStat.Sens(1),DynStat.Lust(4)][0],[DynStat.Spe(-1),DynStat.Lib(1),DynStat.Sens(1),DynStat.Lust(4)][1],[DynStat.Spe(-1),DynStat.Lib(1),DynStat.Sens(1),DynStat.Lust(4)][2],[DynStat.Spe(-1),DynStat.Lib(1),DynStat.Sens(1),DynStat.Lust(4)][3],[DynStat.Spe(-1),DynStat.Lib(1),DynStat.Sens(1),DynStat.Lust(4)][4],[DynStat.Spe(-1),DynStat.Lib(1),DynStat.Sens(1),DynStat.Lust(4)][5],[DynStat.Spe(-1),DynStat.Lib(1),DynStat.Sens(1),DynStat.Lust(4)][6]);
            }
            else if(int([DynStat.Spe(-1),DynStat.Lib(1),DynStat.Sens(1),DynStat.Lust(4)].length) == 8)
            {
               KGAMECLASS.kGAMECLASS.player.dynStats([DynStat.Spe(-1),DynStat.Lib(1),DynStat.Sens(1),DynStat.Lust(4)][0],[DynStat.Spe(-1),DynStat.Lib(1),DynStat.Sens(1),DynStat.Lust(4)][1],[DynStat.Spe(-1),DynStat.Lib(1),DynStat.Sens(1),DynStat.Lust(4)][2],[DynStat.Spe(-1),DynStat.Lib(1),DynStat.Sens(1),DynStat.Lust(4)][3],[DynStat.Spe(-1),DynStat.Lib(1),DynStat.Sens(1),DynStat.Lust(4)][4],[DynStat.Spe(-1),DynStat.Lib(1),DynStat.Sens(1),DynStat.Lust(4)][5],[DynStat.Spe(-1),DynStat.Lib(1),DynStat.Sens(1),DynStat.Lust(4)][6],[DynStat.Spe(-1),DynStat.Lib(1),DynStat.Sens(1),DynStat.Lust(4)][7]);
            }
            else if(int([DynStat.Spe(-1),DynStat.Lib(1),DynStat.Sens(1),DynStat.Lust(4)].length) == 9)
            {
               KGAMECLASS.kGAMECLASS.player.dynStats([DynStat.Spe(-1),DynStat.Lib(1),DynStat.Sens(1),DynStat.Lust(4)][0],[DynStat.Spe(-1),DynStat.Lib(1),DynStat.Sens(1),DynStat.Lust(4)][1],[DynStat.Spe(-1),DynStat.Lib(1),DynStat.Sens(1),DynStat.Lust(4)][2],[DynStat.Spe(-1),DynStat.Lib(1),DynStat.Sens(1),DynStat.Lust(4)][3],[DynStat.Spe(-1),DynStat.Lib(1),DynStat.Sens(1),DynStat.Lust(4)][4],[DynStat.Spe(-1),DynStat.Lib(1),DynStat.Sens(1),DynStat.Lust(4)][5],[DynStat.Spe(-1),DynStat.Lib(1),DynStat.Sens(1),DynStat.Lust(4)][6],[DynStat.Spe(-1),DynStat.Lib(1),DynStat.Sens(1),DynStat.Lust(4)][7],[DynStat.Spe(-1),DynStat.Lib(1),DynStat.Sens(1),DynStat.Lust(4)][8]);
            }
            else if(int([DynStat.Spe(-1),DynStat.Lib(1),DynStat.Sens(1),DynStat.Lust(4)].length) == 10)
            {
               KGAMECLASS.kGAMECLASS.player.dynStats([DynStat.Spe(-1),DynStat.Lib(1),DynStat.Sens(1),DynStat.Lust(4)][0],[DynStat.Spe(-1),DynStat.Lib(1),DynStat.Sens(1),DynStat.Lust(4)][1],[DynStat.Spe(-1),DynStat.Lib(1),DynStat.Sens(1),DynStat.Lust(4)][2],[DynStat.Spe(-1),DynStat.Lib(1),DynStat.Sens(1),DynStat.Lust(4)][3],[DynStat.Spe(-1),DynStat.Lib(1),DynStat.Sens(1),DynStat.Lust(4)][4],[DynStat.Spe(-1),DynStat.Lib(1),DynStat.Sens(1),DynStat.Lust(4)][5],[DynStat.Spe(-1),DynStat.Lib(1),DynStat.Sens(1),DynStat.Lust(4)][6],[DynStat.Spe(-1),DynStat.Lib(1),DynStat.Sens(1),DynStat.Lust(4)][7],[DynStat.Spe(-1),DynStat.Lib(1),DynStat.Sens(1),DynStat.Lust(4)][8],[DynStat.Spe(-1),DynStat.Lib(1),DynStat.Sens(1),DynStat.Lust(4)][9]);
            }
            else if(int([DynStat.Spe(-1),DynStat.Lib(1),DynStat.Sens(1),DynStat.Lust(4)].length) == 11)
            {
               KGAMECLASS.kGAMECLASS.player.dynStats([DynStat.Spe(-1),DynStat.Lib(1),DynStat.Sens(1),DynStat.Lust(4)][0],[DynStat.Spe(-1),DynStat.Lib(1),DynStat.Sens(1),DynStat.Lust(4)][1],[DynStat.Spe(-1),DynStat.Lib(1),DynStat.Sens(1),DynStat.Lust(4)][2],[DynStat.Spe(-1),DynStat.Lib(1),DynStat.Sens(1),DynStat.Lust(4)][3],[DynStat.Spe(-1),DynStat.Lib(1),DynStat.Sens(1),DynStat.Lust(4)][4],[DynStat.Spe(-1),DynStat.Lib(1),DynStat.Sens(1),DynStat.Lust(4)][5],[DynStat.Spe(-1),DynStat.Lib(1),DynStat.Sens(1),DynStat.Lust(4)][6],[DynStat.Spe(-1),DynStat.Lib(1),DynStat.Sens(1),DynStat.Lust(4)][7],[DynStat.Spe(-1),DynStat.Lib(1),DynStat.Sens(1),DynStat.Lust(4)][8],[DynStat.Spe(-1),DynStat.Lib(1),DynStat.Sens(1),DynStat.Lust(4)][9],[DynStat.Spe(-1),DynStat.Lib(1),DynStat.Sens(1),DynStat.Lust(4)][10]);
            }
            else if(int([DynStat.Spe(-1),DynStat.Lib(1),DynStat.Sens(1),DynStat.Lust(4)].length) == 12)
            {
               KGAMECLASS.kGAMECLASS.player.dynStats([DynStat.Spe(-1),DynStat.Lib(1),DynStat.Sens(1),DynStat.Lust(4)][0],[DynStat.Spe(-1),DynStat.Lib(1),DynStat.Sens(1),DynStat.Lust(4)][1],[DynStat.Spe(-1),DynStat.Lib(1),DynStat.Sens(1),DynStat.Lust(4)][2],[DynStat.Spe(-1),DynStat.Lib(1),DynStat.Sens(1),DynStat.Lust(4)][3],[DynStat.Spe(-1),DynStat.Lib(1),DynStat.Sens(1),DynStat.Lust(4)][4],[DynStat.Spe(-1),DynStat.Lib(1),DynStat.Sens(1),DynStat.Lust(4)][5],[DynStat.Spe(-1),DynStat.Lib(1),DynStat.Sens(1),DynStat.Lust(4)][6],[DynStat.Spe(-1),DynStat.Lib(1),DynStat.Sens(1),DynStat.Lust(4)][7],[DynStat.Spe(-1),DynStat.Lib(1),DynStat.Sens(1),DynStat.Lust(4)][8],[DynStat.Spe(-1),DynStat.Lib(1),DynStat.Sens(1),DynStat.Lust(4)][9],[DynStat.Spe(-1),DynStat.Lib(1),DynStat.Sens(1),DynStat.Lust(4)][10],[DynStat.Spe(-1),DynStat.Lib(1),DynStat.Sens(1),DynStat.Lust(4)][11]);
            }
            else if(int([DynStat.Spe(-1),DynStat.Lib(1),DynStat.Sens(1),DynStat.Lust(4)].length) == 13)
            {
               KGAMECLASS.kGAMECLASS.player.dynStats([DynStat.Spe(-1),DynStat.Lib(1),DynStat.Sens(1),DynStat.Lust(4)][0],[DynStat.Spe(-1),DynStat.Lib(1),DynStat.Sens(1),DynStat.Lust(4)][1],[DynStat.Spe(-1),DynStat.Lib(1),DynStat.Sens(1),DynStat.Lust(4)][2],[DynStat.Spe(-1),DynStat.Lib(1),DynStat.Sens(1),DynStat.Lust(4)][3],[DynStat.Spe(-1),DynStat.Lib(1),DynStat.Sens(1),DynStat.Lust(4)][4],[DynStat.Spe(-1),DynStat.Lib(1),DynStat.Sens(1),DynStat.Lust(4)][5],[DynStat.Spe(-1),DynStat.Lib(1),DynStat.Sens(1),DynStat.Lust(4)][6],[DynStat.Spe(-1),DynStat.Lib(1),DynStat.Sens(1),DynStat.Lust(4)][7],[DynStat.Spe(-1),DynStat.Lib(1),DynStat.Sens(1),DynStat.Lust(4)][8],[DynStat.Spe(-1),DynStat.Lib(1),DynStat.Sens(1),DynStat.Lust(4)][9],[DynStat.Spe(-1),DynStat.Lib(1),DynStat.Sens(1),DynStat.Lust(4)][10],[DynStat.Spe(-1),DynStat.Lib(1),DynStat.Sens(1),DynStat.Lust(4)][11],[DynStat.Spe(-1),DynStat.Lib(1),DynStat.Sens(1),DynStat.Lust(4)][12]);
            }
            else if(int([DynStat.Spe(-1),DynStat.Lib(1),DynStat.Sens(1),DynStat.Lust(4)].length) == 14)
            {
               KGAMECLASS.kGAMECLASS.player.dynStats([DynStat.Spe(-1),DynStat.Lib(1),DynStat.Sens(1),DynStat.Lust(4)][0],[DynStat.Spe(-1),DynStat.Lib(1),DynStat.Sens(1),DynStat.Lust(4)][1],[DynStat.Spe(-1),DynStat.Lib(1),DynStat.Sens(1),DynStat.Lust(4)][2],[DynStat.Spe(-1),DynStat.Lib(1),DynStat.Sens(1),DynStat.Lust(4)][3],[DynStat.Spe(-1),DynStat.Lib(1),DynStat.Sens(1),DynStat.Lust(4)][4],[DynStat.Spe(-1),DynStat.Lib(1),DynStat.Sens(1),DynStat.Lust(4)][5],[DynStat.Spe(-1),DynStat.Lib(1),DynStat.Sens(1),DynStat.Lust(4)][6],[DynStat.Spe(-1),DynStat.Lib(1),DynStat.Sens(1),DynStat.Lust(4)][7],[DynStat.Spe(-1),DynStat.Lib(1),DynStat.Sens(1),DynStat.Lust(4)][8],[DynStat.Spe(-1),DynStat.Lib(1),DynStat.Sens(1),DynStat.Lust(4)][9],[DynStat.Spe(-1),DynStat.Lib(1),DynStat.Sens(1),DynStat.Lust(4)][10],[DynStat.Spe(-1),DynStat.Lib(1),DynStat.Sens(1),DynStat.Lust(4)][11],[DynStat.Spe(-1),DynStat.Lib(1),DynStat.Sens(1),DynStat.Lust(4)][12],[DynStat.Spe(-1),DynStat.Lib(1),DynStat.Sens(1),DynStat.Lust(4)][13]);
            }
            else if(int([DynStat.Spe(-1),DynStat.Lib(1),DynStat.Sens(1),DynStat.Lust(4)].length) == 15)
            {
               KGAMECLASS.kGAMECLASS.player.dynStats([DynStat.Spe(-1),DynStat.Lib(1),DynStat.Sens(1),DynStat.Lust(4)][0],[DynStat.Spe(-1),DynStat.Lib(1),DynStat.Sens(1),DynStat.Lust(4)][1],[DynStat.Spe(-1),DynStat.Lib(1),DynStat.Sens(1),DynStat.Lust(4)][2],[DynStat.Spe(-1),DynStat.Lib(1),DynStat.Sens(1),DynStat.Lust(4)][3],[DynStat.Spe(-1),DynStat.Lib(1),DynStat.Sens(1),DynStat.Lust(4)][4],[DynStat.Spe(-1),DynStat.Lib(1),DynStat.Sens(1),DynStat.Lust(4)][5],[DynStat.Spe(-1),DynStat.Lib(1),DynStat.Sens(1),DynStat.Lust(4)][6],[DynStat.Spe(-1),DynStat.Lib(1),DynStat.Sens(1),DynStat.Lust(4)][7],[DynStat.Spe(-1),DynStat.Lib(1),DynStat.Sens(1),DynStat.Lust(4)][8],[DynStat.Spe(-1),DynStat.Lib(1),DynStat.Sens(1),DynStat.Lust(4)][9],[DynStat.Spe(-1),DynStat.Lib(1),DynStat.Sens(1),DynStat.Lust(4)][10],[DynStat.Spe(-1),DynStat.Lib(1),DynStat.Sens(1),DynStat.Lust(4)][11],[DynStat.Spe(-1),DynStat.Lib(1),DynStat.Sens(1),DynStat.Lust(4)][12],[DynStat.Spe(-1),DynStat.Lib(1),DynStat.Sens(1),DynStat.Lust(4)][13],[DynStat
               .Spe(-1),DynStat.Lib(1),DynStat.Sens(1),DynStat.Lust(4)][14]);
            }
            else if(int([DynStat.Spe(-1),DynStat.Lib(1),DynStat.Sens(1),DynStat.Lust(4)].length) == 16)
            {
               KGAMECLASS.kGAMECLASS.player.dynStats([DynStat.Spe(-1),DynStat.Lib(1),DynStat.Sens(1),DynStat.Lust(4)][0],[DynStat.Spe(-1),DynStat.Lib(1),DynStat.Sens(1),DynStat.Lust(4)][1],[DynStat.Spe(-1),DynStat.Lib(1),DynStat.Sens(1),DynStat.Lust(4)][2],[DynStat.Spe(-1),DynStat.Lib(1),DynStat.Sens(1),DynStat.Lust(4)][3],[DynStat.Spe(-1),DynStat.Lib(1),DynStat.Sens(1),DynStat.Lust(4)][4],[DynStat.Spe(-1),DynStat.Lib(1),DynStat.Sens(1),DynStat.Lust(4)][5],[DynStat.Spe(-1),DynStat.Lib(1),DynStat.Sens(1),DynStat.Lust(4)][6],[DynStat.Spe(-1),DynStat.Lib(1),DynStat.Sens(1),DynStat.Lust(4)][7],[DynStat.Spe(-1),DynStat.Lib(1),DynStat.Sens(1),DynStat.Lust(4)][8],[DynStat.Spe(-1),DynStat.Lib(1),DynStat.Sens(1),DynStat.Lust(4)][9],[DynStat.Spe(-1),DynStat.Lib(1),DynStat.Sens(1),DynStat.Lust(4)][10],[DynStat.Spe(-1),DynStat.Lib(1),DynStat.Sens(1),DynStat.Lust(4)][11],[DynStat.Spe(-1),DynStat.Lib(1),DynStat.Sens(1),DynStat.Lust(4)][12],[DynStat.Spe(-1),DynStat.Lib(1),DynStat.Sens(1),DynStat.Lust(4)][13],[DynStat
               .Spe(-1),DynStat.Lib(1),DynStat.Sens(1),DynStat.Lust(4)][14],[DynStat.Spe(-1),DynStat.Lib(1),DynStat.Sens(1),DynStat.Lust(4)][15]);
            }
            else if(int([DynStat.Spe(-1),DynStat.Lib(1),DynStat.Sens(1),DynStat.Lust(4)].length) == 17)
            {
               KGAMECLASS.kGAMECLASS.player.dynStats([DynStat.Spe(-1),DynStat.Lib(1),DynStat.Sens(1),DynStat.Lust(4)][0],[DynStat.Spe(-1),DynStat.Lib(1),DynStat.Sens(1),DynStat.Lust(4)][1],[DynStat.Spe(-1),DynStat.Lib(1),DynStat.Sens(1),DynStat.Lust(4)][2],[DynStat.Spe(-1),DynStat.Lib(1),DynStat.Sens(1),DynStat.Lust(4)][3],[DynStat.Spe(-1),DynStat.Lib(1),DynStat.Sens(1),DynStat.Lust(4)][4],[DynStat.Spe(-1),DynStat.Lib(1),DynStat.Sens(1),DynStat.Lust(4)][5],[DynStat.Spe(-1),DynStat.Lib(1),DynStat.Sens(1),DynStat.Lust(4)][6],[DynStat.Spe(-1),DynStat.Lib(1),DynStat.Sens(1),DynStat.Lust(4)][7],[DynStat.Spe(-1),DynStat.Lib(1),DynStat.Sens(1),DynStat.Lust(4)][8],[DynStat.Spe(-1),DynStat.Lib(1),DynStat.Sens(1),DynStat.Lust(4)][9],[DynStat.Spe(-1),DynStat.Lib(1),DynStat.Sens(1),DynStat.Lust(4)][10],[DynStat.Spe(-1),DynStat.Lib(1),DynStat.Sens(1),DynStat.Lust(4)][11],[DynStat.Spe(-1),DynStat.Lib(1),DynStat.Sens(1),DynStat.Lust(4)][12],[DynStat.Spe(-1),DynStat.Lib(1),DynStat.Sens(1),DynStat.Lust(4)][13],[DynStat
               .Spe(-1),DynStat.Lib(1),DynStat.Sens(1),DynStat.Lust(4)][14],[DynStat.Spe(-1),DynStat.Lib(1),DynStat.Sens(1),DynStat.Lust(4)][15],[DynStat.Spe(-1),DynStat.Lib(1),DynStat.Sens(1),DynStat.Lust(4)][16]);
            }
            else if(int([DynStat.Spe(-1),DynStat.Lib(1),DynStat.Sens(1),DynStat.Lust(4)].length) == 18)
            {
               KGAMECLASS.kGAMECLASS.player.dynStats([DynStat.Spe(-1),DynStat.Lib(1),DynStat.Sens(1),DynStat.Lust(4)][0],[DynStat.Spe(-1),DynStat.Lib(1),DynStat.Sens(1),DynStat.Lust(4)][1],[DynStat.Spe(-1),DynStat.Lib(1),DynStat.Sens(1),DynStat.Lust(4)][2],[DynStat.Spe(-1),DynStat.Lib(1),DynStat.Sens(1),DynStat.Lust(4)][3],[DynStat.Spe(-1),DynStat.Lib(1),DynStat.Sens(1),DynStat.Lust(4)][4],[DynStat.Spe(-1),DynStat.Lib(1),DynStat.Sens(1),DynStat.Lust(4)][5],[DynStat.Spe(-1),DynStat.Lib(1),DynStat.Sens(1),DynStat.Lust(4)][6],[DynStat.Spe(-1),DynStat.Lib(1),DynStat.Sens(1),DynStat.Lust(4)][7],[DynStat.Spe(-1),DynStat.Lib(1),DynStat.Sens(1),DynStat.Lust(4)][8],[DynStat.Spe(-1),DynStat.Lib(1),DynStat.Sens(1),DynStat.Lust(4)][9],[DynStat.Spe(-1),DynStat.Lib(1),DynStat.Sens(1),DynStat.Lust(4)][10],[DynStat.Spe(-1),DynStat.Lib(1),DynStat.Sens(1),DynStat.Lust(4)][11],[DynStat.Spe(-1),DynStat.Lib(1),DynStat.Sens(1),DynStat.Lust(4)][12],[DynStat.Spe(-1),DynStat.Lib(1),DynStat.Sens(1),DynStat.Lust(4)][13],[DynStat
               .Spe(-1),DynStat.Lib(1),DynStat.Sens(1),DynStat.Lust(4)][14],[DynStat.Spe(-1),DynStat.Lib(1),DynStat.Sens(1),DynStat.Lust(4)][15],[DynStat.Spe(-1),DynStat.Lib(1),DynStat.Sens(1),DynStat.Lust(4)][16],[DynStat.Spe(-1),DynStat.Lib(1),DynStat.Sens(1),DynStat.Lust(4)][17]);
            }
            else if(int([DynStat.Spe(-1),DynStat.Lib(1),DynStat.Sens(1),DynStat.Lust(4)].length) == 19)
            {
               KGAMECLASS.kGAMECLASS.player.dynStats([DynStat.Spe(-1),DynStat.Lib(1),DynStat.Sens(1),DynStat.Lust(4)][0],[DynStat.Spe(-1),DynStat.Lib(1),DynStat.Sens(1),DynStat.Lust(4)][1],[DynStat.Spe(-1),DynStat.Lib(1),DynStat.Sens(1),DynStat.Lust(4)][2],[DynStat.Spe(-1),DynStat.Lib(1),DynStat.Sens(1),DynStat.Lust(4)][3],[DynStat.Spe(-1),DynStat.Lib(1),DynStat.Sens(1),DynStat.Lust(4)][4],[DynStat.Spe(-1),DynStat.Lib(1),DynStat.Sens(1),DynStat.Lust(4)][5],[DynStat.Spe(-1),DynStat.Lib(1),DynStat.Sens(1),DynStat.Lust(4)][6],[DynStat.Spe(-1),DynStat.Lib(1),DynStat.Sens(1),DynStat.Lust(4)][7],[DynStat.Spe(-1),DynStat.Lib(1),DynStat.Sens(1),DynStat.Lust(4)][8],[DynStat.Spe(-1),DynStat.Lib(1),DynStat.Sens(1),DynStat.Lust(4)][9],[DynStat.Spe(-1),DynStat.Lib(1),DynStat.Sens(1),DynStat.Lust(4)][10],[DynStat.Spe(-1),DynStat.Lib(1),DynStat.Sens(1),DynStat.Lust(4)][11],[DynStat.Spe(-1),DynStat.Lib(1),DynStat.Sens(1),DynStat.Lust(4)][12],[DynStat.Spe(-1),DynStat.Lib(1),DynStat.Sens(1),DynStat.Lust(4)][13],[DynStat
               .Spe(-1),DynStat.Lib(1),DynStat.Sens(1),DynStat.Lust(4)][14],[DynStat.Spe(-1),DynStat.Lib(1),DynStat.Sens(1),DynStat.Lust(4)][15],[DynStat.Spe(-1),DynStat.Lib(1),DynStat.Sens(1),DynStat.Lust(4)][16],[DynStat.Spe(-1),DynStat.Lib(1),DynStat.Sens(1),DynStat.Lust(4)][17],[DynStat.Spe(-1),DynStat.Lib(1),DynStat.Sens(1),DynStat.Lust(4)][18]);
            }
            else
            {
               if(int([DynStat.Spe(-1),DynStat.Lib(1),DynStat.Sens(1),DynStat.Lust(4)].length) != 20)
               {
                  throw "Too many rest arguments";
               }
               KGAMECLASS.kGAMECLASS.player.dynStats([DynStat.Spe(-1),DynStat.Lib(1),DynStat.Sens(1),DynStat.Lust(4)][0],[DynStat.Spe(-1),DynStat.Lib(1),DynStat.Sens(1),DynStat.Lust(4)][1],[DynStat.Spe(-1),DynStat.Lib(1),DynStat.Sens(1),DynStat.Lust(4)][2],[DynStat.Spe(-1),DynStat.Lib(1),DynStat.Sens(1),DynStat.Lust(4)][3],[DynStat.Spe(-1),DynStat.Lib(1),DynStat.Sens(1),DynStat.Lust(4)][4],[DynStat.Spe(-1),DynStat.Lib(1),DynStat.Sens(1),DynStat.Lust(4)][5],[DynStat.Spe(-1),DynStat.Lib(1),DynStat.Sens(1),DynStat.Lust(4)][6],[DynStat.Spe(-1),DynStat.Lib(1),DynStat.Sens(1),DynStat.Lust(4)][7],[DynStat.Spe(-1),DynStat.Lib(1),DynStat.Sens(1),DynStat.Lust(4)][8],[DynStat.Spe(-1),DynStat.Lib(1),DynStat.Sens(1),DynStat.Lust(4)][9],[DynStat.Spe(-1),DynStat.Lib(1),DynStat.Sens(1),DynStat.Lust(4)][10],[DynStat.Spe(-1),DynStat.Lib(1),DynStat.Sens(1),DynStat.Lust(4)][11],[DynStat.Spe(-1),DynStat.Lib(1),DynStat.Sens(1),DynStat.Lust(4)][12],[DynStat.Spe(-1),DynStat.Lib(1),DynStat.Sens(1),DynStat.Lust(4)][13],[DynStat
               .Spe(-1),DynStat.Lib(1),DynStat.Sens(1),DynStat.Lust(4)][14],[DynStat.Spe(-1),DynStat.Lib(1),DynStat.Sens(1),DynStat.Lust(4)][15],[DynStat.Spe(-1),DynStat.Lib(1),DynStat.Sens(1),DynStat.Lust(4)][16],[DynStat.Spe(-1),DynStat.Lib(1),DynStat.Sens(1),DynStat.Lust(4)][17],[DynStat.Spe(-1),DynStat.Lib(1),DynStat.Sens(1),DynStat.Lust(4)][18],[DynStat.Spe(-1),DynStat.Lib(1),DynStat.Sens(1),DynStat.Lust(4)][19]);
            }
            _loc2_ = true;
         }
         if(_loc1_.get_pregnancyIncubation() == 48)
         {
            output.text("<b>你怀孕的肚子似乎不可能再变大了，但你现在却感到前所未有的快乐，满足于不知为何，你正在履行你的职责。怀孕感觉很对，你迫不及待地想在之后再次被搞大肚子。</b>[pg]");
            _loc2_ = true;
         }
         if(_loc1_.get_pregnancyIncubation() == 32 || _loc1_.get_pregnancyIncubation() == 64 || _loc1_.get_pregnancyIncubation() == 85 || _loc1_.get_pregnancyIncubation() == 150)
         {
            _loc2_ = true;
            if(_loc1_.biggestTitSize() >= 3 && _loc1_.mostBreastsPerRow() > 1 && _loc1_.biggestLactation() >= 1 && _loc1_.biggestLactation() < 2)
            {
               output.text("你的乳房感觉肿胀，因为它们积聚了所有多余的乳汁。你想知道它们准备喂养什么样的生物。[pg]");
               _loc1_.boostLactation(0.5);
            }
            if(_loc1_.biggestTitSize() >= 3 && _loc1_.mostBreastsPerRow() > 1 && _loc1_.biggestLactation() > 0 && _loc1_.biggestLactation() < 1)
            {
               output.text("随着你的身体为即将到来的分娩做准备，几滴母乳从你的乳头溢出。[pg]");
               _loc1_.boostLactation(0.5);
            }
            if(_loc1_.biggestTitSize() >= 3 && _loc1_.mostBreastsPerRow() > 1 && _loc1_.biggestLactation() == 0)
            {
               output.text("<b>你意识到你的乳房感觉很饱满，偶尔还会分泌乳汁</b>。这一定是因为怀孕。[pg]");
               _loc1_.boostLactation(1);
            }
            if(_loc1_.biggestTitSize() == 2 && _loc1_.mostBreastsPerRow() > 1)
            {
               output.text("<b>你的乳房已经肿胀到了C罩杯，</b>考虑到你即将到来的怀孕。[pg]");
               _loc1_.growTits(1,1,false,3);
            }
            if(_loc1_.biggestTitSize() == 1 && _loc1_.mostBreastsPerRow() > 1)
            {
               output.text("<b>你的乳房已经长到了B罩杯，</b>可能是由于你怀孕的荷尔蒙变化。[pg]");
               _loc1_.growTits(1,1,false,3);
            }
         }
         return _loc2_;
      }
   }
}

