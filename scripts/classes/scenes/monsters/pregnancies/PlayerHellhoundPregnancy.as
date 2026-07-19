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
   
   public class PlayerHellhoundPregnancy implements VaginalPregnancy
   {
      
      public var output:GuiOutput;
      
      public function PlayerHellhoundPregnancy(param1:GuiOutput = undefined)
      {
         if(Boot.skip_constructor)
         {
            return;
         }
         output = param1;
         PregnancyProgression.registerVaginalPregnancyScene(25,6,this);
      }
      
      public function vaginalBirth() : void
      {
         var _loc1_:Player = KGAMECLASS.kGAMECLASS.player;
         output.text("你突然被子宫内猛烈燃烧的热量惊醒。它给了你一股突如其来的能量，你感到一种强烈的站起来的冲动。你能感觉到两个脑袋在你体内移动，你知道一只地狱犬很快就要出生了。在直觉的引导下，你张开双腿蹲下，但你想知道你到底要怎么生出一个有两个脑袋的生物？[pg]");
         PregnancyUtils.createVaginaIfMissing(output,_loc1_);
         output.text("听到嘶嘶声，你低头看到水滴落在地上，瞬间变成了蒸汽。一种不自然的热量充满了你，热得足以把水烧开；但多亏了你体内的生物，你几乎感觉不到任何不适！更多的能量充满了你，你开始认真地向下推挤体内的孩子。这个过程很痛苦，但很满足；你觉得以你现在的能量，你可以推出一座山。不到一分钟，你就能感觉到脑袋出来了。脑袋后面紧跟着身体的其他部分，你用双手接住你的地狱犬孩子，把它举起来看着它。[pg]");
         output.text("你可以看到那两个独特的狗头互相缠绕着，并发出轻柔的" + (KGAMECLASS.kGAMECLASS.get_noFur() ? "尖叫声" : "吠叫声") + "；有时还能看到它们嘴里闪烁着一丝火焰。它可爱的爪子在空中挥舞，似乎在寻找抓握的地方" + (KGAMECLASS.kGAMECLASS.get_noFur() ? "，除了那微小的双茎外，它身体的其余部分看起来就像一只普通的新生小狗" : "，但除了双茎外，它身体的其余部分看起来完全是人类的模样，甚至还有着和你一样的肤色") + "。它的嘴巴渴望着营养，你意识到你的乳房里充满了这只小狗需要的东西，于是把它拉到胸前。每个头都迅速找到了一个乳头，开始吮吸起来。分娩结束后，你心满意足地坐下，沉浸在给孩子喂奶的感觉中，或者说，是孩子们？[pg]");
         output.text("你在这种欣快感中坐了一会儿。直到你面前的孩子开始变得异常滚烫和沉重，你才被拉回现实。你低头一看，发现这只地狱犬幼崽已经长到了原来体型的三倍，甚至长出了那层独特的坚韧黑毛。这只野兽正心满意足地舔着你的乳房，而不是在吮吸。正是它嘴里现在燃烧着的火焰打破了你的遐想，但在你真正弄清楚发生了什么之前，地狱犬从你身边退开，冲你欢快地叫了几声，然后转身跑进了荒野" + (KGAMECLASS.kGAMECLASS.get_noFur() ? "" : "，在从视线中消失之前，它四肢着地跑了起来") + "。你感觉到分娩时获得的那种异常力量消退了，你陷入了深沉而满足的睡眠中。[pg]");
         _loc1_.boostLactation(0.01);
         if(_loc1_.averageLactation() > 0 && _loc1_.averageLactation() < 5)
         {
            output.text("你的乳房似乎无法停止滴奶，泌乳量比以前更大了。");
            _loc1_.boostLactation(0.5);
         }
         _loc1_.cuntChange(60,true);
         if(_loc1_.vaginas[0].vaginalWetness == 0)
         {
            _temp_1.vaginalWetness += 1;
         }
         _loc1_.orgasm("Vaginal");
         if(int([DynStat.Str(-1),DynStat.Tou(-1),DynStat.Spe(2),DynStat.Lib(1),DynStat.Sens(0.5)].length) == 0)
         {
            KGAMECLASS.kGAMECLASS.player.dynStats();
         }
         else if(int([DynStat.Str(-1),DynStat.Tou(-1),DynStat.Spe(2),DynStat.Lib(1),DynStat.Sens(0.5)].length) == 1)
         {
            KGAMECLASS.kGAMECLASS.player.dynStats([DynStat.Str(-1),DynStat.Tou(-1),DynStat.Spe(2),DynStat.Lib(1),DynStat.Sens(0.5)][0]);
         }
         else if(int([DynStat.Str(-1),DynStat.Tou(-1),DynStat.Spe(2),DynStat.Lib(1),DynStat.Sens(0.5)].length) == 2)
         {
            KGAMECLASS.kGAMECLASS.player.dynStats([DynStat.Str(-1),DynStat.Tou(-1),DynStat.Spe(2),DynStat.Lib(1),DynStat.Sens(0.5)][0],[DynStat.Str(-1),DynStat.Tou(-1),DynStat.Spe(2),DynStat.Lib(1),DynStat.Sens(0.5)][1]);
         }
         else if(int([DynStat.Str(-1),DynStat.Tou(-1),DynStat.Spe(2),DynStat.Lib(1),DynStat.Sens(0.5)].length) == 3)
         {
            KGAMECLASS.kGAMECLASS.player.dynStats([DynStat.Str(-1),DynStat.Tou(-1),DynStat.Spe(2),DynStat.Lib(1),DynStat.Sens(0.5)][0],[DynStat.Str(-1),DynStat.Tou(-1),DynStat.Spe(2),DynStat.Lib(1),DynStat.Sens(0.5)][1],[DynStat.Str(-1),DynStat.Tou(-1),DynStat.Spe(2),DynStat.Lib(1),DynStat.Sens(0.5)][2]);
         }
         else if(int([DynStat.Str(-1),DynStat.Tou(-1),DynStat.Spe(2),DynStat.Lib(1),DynStat.Sens(0.5)].length) == 4)
         {
            KGAMECLASS.kGAMECLASS.player.dynStats([DynStat.Str(-1),DynStat.Tou(-1),DynStat.Spe(2),DynStat.Lib(1),DynStat.Sens(0.5)][0],[DynStat.Str(-1),DynStat.Tou(-1),DynStat.Spe(2),DynStat.Lib(1),DynStat.Sens(0.5)][1],[DynStat.Str(-1),DynStat.Tou(-1),DynStat.Spe(2),DynStat.Lib(1),DynStat.Sens(0.5)][2],[DynStat.Str(-1),DynStat.Tou(-1),DynStat.Spe(2),DynStat.Lib(1),DynStat.Sens(0.5)][3]);
         }
         else if(int([DynStat.Str(-1),DynStat.Tou(-1),DynStat.Spe(2),DynStat.Lib(1),DynStat.Sens(0.5)].length) == 5)
         {
            KGAMECLASS.kGAMECLASS.player.dynStats([DynStat.Str(-1),DynStat.Tou(-1),DynStat.Spe(2),DynStat.Lib(1),DynStat.Sens(0.5)][0],[DynStat.Str(-1),DynStat.Tou(-1),DynStat.Spe(2),DynStat.Lib(1),DynStat.Sens(0.5)][1],[DynStat.Str(-1),DynStat.Tou(-1),DynStat.Spe(2),DynStat.Lib(1),DynStat.Sens(0.5)][2],[DynStat.Str(-1),DynStat.Tou(-1),DynStat.Spe(2),DynStat.Lib(1),DynStat.Sens(0.5)][3],[DynStat.Str(-1),DynStat.Tou(-1),DynStat.Spe(2),DynStat.Lib(1),DynStat.Sens(0.5)][4]);
         }
         else if(int([DynStat.Str(-1),DynStat.Tou(-1),DynStat.Spe(2),DynStat.Lib(1),DynStat.Sens(0.5)].length) == 6)
         {
            KGAMECLASS.kGAMECLASS.player.dynStats([DynStat.Str(-1),DynStat.Tou(-1),DynStat.Spe(2),DynStat.Lib(1),DynStat.Sens(0.5)][0],[DynStat.Str(-1),DynStat.Tou(-1),DynStat.Spe(2),DynStat.Lib(1),DynStat.Sens(0.5)][1],[DynStat.Str(-1),DynStat.Tou(-1),DynStat.Spe(2),DynStat.Lib(1),DynStat.Sens(0.5)][2],[DynStat.Str(-1),DynStat.Tou(-1),DynStat.Spe(2),DynStat.Lib(1),DynStat.Sens(0.5)][3],[DynStat.Str(-1),DynStat.Tou(-1),DynStat.Spe(2),DynStat.Lib(1),DynStat.Sens(0.5)][4],[DynStat.Str(-1),DynStat.Tou(-1),DynStat.Spe(2),DynStat.Lib(1),DynStat.Sens(0.5)][5]);
         }
         else if(int([DynStat.Str(-1),DynStat.Tou(-1),DynStat.Spe(2),DynStat.Lib(1),DynStat.Sens(0.5)].length) == 7)
         {
            KGAMECLASS.kGAMECLASS.player.dynStats([DynStat.Str(-1),DynStat.Tou(-1),DynStat.Spe(2),DynStat.Lib(1),DynStat.Sens(0.5)][0],[DynStat.Str(-1),DynStat.Tou(-1),DynStat.Spe(2),DynStat.Lib(1),DynStat.Sens(0.5)][1],[DynStat.Str(-1),DynStat.Tou(-1),DynStat.Spe(2),DynStat.Lib(1),DynStat.Sens(0.5)][2],[DynStat.Str(-1),DynStat.Tou(-1),DynStat.Spe(2),DynStat.Lib(1),DynStat.Sens(0.5)][3],[DynStat.Str(-1),DynStat.Tou(-1),DynStat.Spe(2),DynStat.Lib(1),DynStat.Sens(0.5)][4],[DynStat.Str(-1),DynStat.Tou(-1),DynStat.Spe(2),DynStat.Lib(1),DynStat.Sens(0.5)][5],[DynStat.Str(-1),DynStat.Tou(-1),DynStat.Spe(2),DynStat.Lib(1),DynStat.Sens(0.5)][6]);
         }
         else if(int([DynStat.Str(-1),DynStat.Tou(-1),DynStat.Spe(2),DynStat.Lib(1),DynStat.Sens(0.5)].length) == 8)
         {
            KGAMECLASS.kGAMECLASS.player.dynStats([DynStat.Str(-1),DynStat.Tou(-1),DynStat.Spe(2),DynStat.Lib(1),DynStat.Sens(0.5)][0],[DynStat.Str(-1),DynStat.Tou(-1),DynStat.Spe(2),DynStat.Lib(1),DynStat.Sens(0.5)][1],[DynStat.Str(-1),DynStat.Tou(-1),DynStat.Spe(2),DynStat.Lib(1),DynStat.Sens(0.5)][2],[DynStat.Str(-1),DynStat.Tou(-1),DynStat.Spe(2),DynStat.Lib(1),DynStat.Sens(0.5)][3],[DynStat.Str(-1),DynStat.Tou(-1),DynStat.Spe(2),DynStat.Lib(1),DynStat.Sens(0.5)][4],[DynStat.Str(-1),DynStat.Tou(-1),DynStat.Spe(2),DynStat.Lib(1),DynStat.Sens(0.5)][5],[DynStat.Str(-1),DynStat.Tou(-1),DynStat.Spe(2),DynStat.Lib(1),DynStat.Sens(0.5)][6],[DynStat.Str(-1),DynStat.Tou(-1),DynStat.Spe(2),DynStat.Lib(1),DynStat.Sens(0.5)][7]);
         }
         else if(int([DynStat.Str(-1),DynStat.Tou(-1),DynStat.Spe(2),DynStat.Lib(1),DynStat.Sens(0.5)].length) == 9)
         {
            KGAMECLASS.kGAMECLASS.player.dynStats([DynStat.Str(-1),DynStat.Tou(-1),DynStat.Spe(2),DynStat.Lib(1),DynStat.Sens(0.5)][0],[DynStat.Str(-1),DynStat.Tou(-1),DynStat.Spe(2),DynStat.Lib(1),DynStat.Sens(0.5)][1],[DynStat.Str(-1),DynStat.Tou(-1),DynStat.Spe(2),DynStat.Lib(1),DynStat.Sens(0.5)][2],[DynStat.Str(-1),DynStat.Tou(-1),DynStat.Spe(2),DynStat.Lib(1),DynStat.Sens(0.5)][3],[DynStat.Str(-1),DynStat.Tou(-1),DynStat.Spe(2),DynStat.Lib(1),DynStat.Sens(0.5)][4],[DynStat.Str(-1),DynStat.Tou(-1),DynStat.Spe(2),DynStat.Lib(1),DynStat.Sens(0.5)][5],[DynStat.Str(-1),DynStat.Tou(-1),DynStat.Spe(2),DynStat.Lib(1),DynStat.Sens(0.5)][6],[DynStat.Str(-1),DynStat.Tou(-1),DynStat.Spe(2),DynStat.Lib(1),DynStat.Sens(0.5)][7],[DynStat.Str(-1),DynStat.Tou(-1),DynStat.Spe(2),DynStat.Lib(1),DynStat.Sens(0.5)][8]);
         }
         else if(int([DynStat.Str(-1),DynStat.Tou(-1),DynStat.Spe(2),DynStat.Lib(1),DynStat.Sens(0.5)].length) == 10)
         {
            KGAMECLASS.kGAMECLASS.player.dynStats([DynStat.Str(-1),DynStat.Tou(-1),DynStat.Spe(2),DynStat.Lib(1),DynStat.Sens(0.5)][0],[DynStat.Str(-1),DynStat.Tou(-1),DynStat.Spe(2),DynStat.Lib(1),DynStat.Sens(0.5)][1],[DynStat.Str(-1),DynStat.Tou(-1),DynStat.Spe(2),DynStat.Lib(1),DynStat.Sens(0.5)][2],[DynStat.Str(-1),DynStat.Tou(-1),DynStat.Spe(2),DynStat.Lib(1),DynStat.Sens(0.5)][3],[DynStat.Str(-1),DynStat.Tou(-1),DynStat.Spe(2),DynStat.Lib(1),DynStat.Sens(0.5)][4],[DynStat.Str(-1),DynStat.Tou(-1),DynStat.Spe(2),DynStat.Lib(1),DynStat.Sens(0.5)][5],[DynStat.Str(-1),DynStat.Tou(-1),DynStat.Spe(2),DynStat.Lib(1),DynStat.Sens(0.5)][6],[DynStat.Str(-1),DynStat.Tou(-1),DynStat.Spe(2),DynStat.Lib(1),DynStat.Sens(0.5)][7],[DynStat.Str(-1),DynStat.Tou(-1),DynStat.Spe(2),DynStat.Lib(1),DynStat.Sens(0.5)][8],[DynStat.Str(-1),DynStat.Tou(-1),DynStat.Spe(2),DynStat.Lib(1),DynStat.Sens(0.5)][9]);
         }
         else if(int([DynStat.Str(-1),DynStat.Tou(-1),DynStat.Spe(2),DynStat.Lib(1),DynStat.Sens(0.5)].length) == 11)
         {
            KGAMECLASS.kGAMECLASS.player.dynStats([DynStat.Str(-1),DynStat.Tou(-1),DynStat.Spe(2),DynStat.Lib(1),DynStat.Sens(0.5)][0],[DynStat.Str(-1),DynStat.Tou(-1),DynStat.Spe(2),DynStat.Lib(1),DynStat.Sens(0.5)][1],[DynStat.Str(-1),DynStat.Tou(-1),DynStat.Spe(2),DynStat.Lib(1),DynStat.Sens(0.5)][2],[DynStat.Str(-1),DynStat.Tou(-1),DynStat.Spe(2),DynStat.Lib(1),DynStat.Sens(0.5)][3],[DynStat.Str(-1),DynStat.Tou(-1),DynStat.Spe(2),DynStat.Lib(1),DynStat.Sens(0.5)][4],[DynStat.Str(-1),DynStat.Tou(-1),DynStat.Spe(2),DynStat.Lib(1),DynStat.Sens(0.5)][5],[DynStat.Str(-1),DynStat.Tou(-1),DynStat.Spe(2),DynStat.Lib(1),DynStat.Sens(0.5)][6],[DynStat.Str(-1),DynStat.Tou(-1),DynStat.Spe(2),DynStat.Lib(1),DynStat.Sens(0.5)][7],[DynStat.Str(-1),DynStat.Tou(-1),DynStat.Spe(2),DynStat.Lib(1),DynStat.Sens(0.5)][8],[DynStat.Str(-1),DynStat.Tou(-1),DynStat.Spe(2),DynStat.Lib(1),DynStat.Sens(0.5)][9],[DynStat.Str(-1),DynStat.Tou(-1),DynStat.Spe(2),DynStat.Lib(1),DynStat.Sens(0.5)][10]);
         }
         else if(int([DynStat.Str(-1),DynStat.Tou(-1),DynStat.Spe(2),DynStat.Lib(1),DynStat.Sens(0.5)].length) == 12)
         {
            KGAMECLASS.kGAMECLASS.player.dynStats([DynStat.Str(-1),DynStat.Tou(-1),DynStat.Spe(2),DynStat.Lib(1),DynStat.Sens(0.5)][0],[DynStat.Str(-1),DynStat.Tou(-1),DynStat.Spe(2),DynStat.Lib(1),DynStat.Sens(0.5)][1],[DynStat.Str(-1),DynStat.Tou(-1),DynStat.Spe(2),DynStat.Lib(1),DynStat.Sens(0.5)][2],[DynStat.Str(-1),DynStat.Tou(-1),DynStat.Spe(2),DynStat.Lib(1),DynStat.Sens(0.5)][3],[DynStat.Str(-1),DynStat.Tou(-1),DynStat.Spe(2),DynStat.Lib(1),DynStat.Sens(0.5)][4],[DynStat.Str(-1),DynStat.Tou(-1),DynStat.Spe(2),DynStat.Lib(1),DynStat.Sens(0.5)][5],[DynStat.Str(-1),DynStat.Tou(-1),DynStat.Spe(2),DynStat.Lib(1),DynStat.Sens(0.5)][6],[DynStat.Str(-1),DynStat.Tou(-1),DynStat.Spe(2),DynStat.Lib(1),DynStat.Sens(0.5)][7],[DynStat.Str(-1),DynStat.Tou(-1),DynStat.Spe(2),DynStat.Lib(1),DynStat.Sens(0.5)][8],[DynStat.Str(-1),DynStat.Tou(-1),DynStat.Spe(2),DynStat.Lib(1),DynStat.Sens(0.5)][9],[DynStat.Str(-1),DynStat.Tou(-1),DynStat.Spe(2),DynStat.Lib(1),DynStat.Sens(0.5)][10],[DynStat.Str(-1),DynStat.Tou(-1)
            ,DynStat.Spe(2),DynStat.Lib(1),DynStat.Sens(0.5)][11]);
         }
         else if(int([DynStat.Str(-1),DynStat.Tou(-1),DynStat.Spe(2),DynStat.Lib(1),DynStat.Sens(0.5)].length) == 13)
         {
            KGAMECLASS.kGAMECLASS.player.dynStats([DynStat.Str(-1),DynStat.Tou(-1),DynStat.Spe(2),DynStat.Lib(1),DynStat.Sens(0.5)][0],[DynStat.Str(-1),DynStat.Tou(-1),DynStat.Spe(2),DynStat.Lib(1),DynStat.Sens(0.5)][1],[DynStat.Str(-1),DynStat.Tou(-1),DynStat.Spe(2),DynStat.Lib(1),DynStat.Sens(0.5)][2],[DynStat.Str(-1),DynStat.Tou(-1),DynStat.Spe(2),DynStat.Lib(1),DynStat.Sens(0.5)][3],[DynStat.Str(-1),DynStat.Tou(-1),DynStat.Spe(2),DynStat.Lib(1),DynStat.Sens(0.5)][4],[DynStat.Str(-1),DynStat.Tou(-1),DynStat.Spe(2),DynStat.Lib(1),DynStat.Sens(0.5)][5],[DynStat.Str(-1),DynStat.Tou(-1),DynStat.Spe(2),DynStat.Lib(1),DynStat.Sens(0.5)][6],[DynStat.Str(-1),DynStat.Tou(-1),DynStat.Spe(2),DynStat.Lib(1),DynStat.Sens(0.5)][7],[DynStat.Str(-1),DynStat.Tou(-1),DynStat.Spe(2),DynStat.Lib(1),DynStat.Sens(0.5)][8],[DynStat.Str(-1),DynStat.Tou(-1),DynStat.Spe(2),DynStat.Lib(1),DynStat.Sens(0.5)][9],[DynStat.Str(-1),DynStat.Tou(-1),DynStat.Spe(2),DynStat.Lib(1),DynStat.Sens(0.5)][10],[DynStat.Str(-1),DynStat.Tou(-1)
            ,DynStat.Spe(2),DynStat.Lib(1),DynStat.Sens(0.5)][11],[DynStat.Str(-1),DynStat.Tou(-1),DynStat.Spe(2),DynStat.Lib(1),DynStat.Sens(0.5)][12]);
         }
         else if(int([DynStat.Str(-1),DynStat.Tou(-1),DynStat.Spe(2),DynStat.Lib(1),DynStat.Sens(0.5)].length) == 14)
         {
            KGAMECLASS.kGAMECLASS.player.dynStats([DynStat.Str(-1),DynStat.Tou(-1),DynStat.Spe(2),DynStat.Lib(1),DynStat.Sens(0.5)][0],[DynStat.Str(-1),DynStat.Tou(-1),DynStat.Spe(2),DynStat.Lib(1),DynStat.Sens(0.5)][1],[DynStat.Str(-1),DynStat.Tou(-1),DynStat.Spe(2),DynStat.Lib(1),DynStat.Sens(0.5)][2],[DynStat.Str(-1),DynStat.Tou(-1),DynStat.Spe(2),DynStat.Lib(1),DynStat.Sens(0.5)][3],[DynStat.Str(-1),DynStat.Tou(-1),DynStat.Spe(2),DynStat.Lib(1),DynStat.Sens(0.5)][4],[DynStat.Str(-1),DynStat.Tou(-1),DynStat.Spe(2),DynStat.Lib(1),DynStat.Sens(0.5)][5],[DynStat.Str(-1),DynStat.Tou(-1),DynStat.Spe(2),DynStat.Lib(1),DynStat.Sens(0.5)][6],[DynStat.Str(-1),DynStat.Tou(-1),DynStat.Spe(2),DynStat.Lib(1),DynStat.Sens(0.5)][7],[DynStat.Str(-1),DynStat.Tou(-1),DynStat.Spe(2),DynStat.Lib(1),DynStat.Sens(0.5)][8],[DynStat.Str(-1),DynStat.Tou(-1),DynStat.Spe(2),DynStat.Lib(1),DynStat.Sens(0.5)][9],[DynStat.Str(-1),DynStat.Tou(-1),DynStat.Spe(2),DynStat.Lib(1),DynStat.Sens(0.5)][10],[DynStat.Str(-1),DynStat.Tou(-1)
            ,DynStat.Spe(2),DynStat.Lib(1),DynStat.Sens(0.5)][11],[DynStat.Str(-1),DynStat.Tou(-1),DynStat.Spe(2),DynStat.Lib(1),DynStat.Sens(0.5)][12],[DynStat.Str(-1),DynStat.Tou(-1),DynStat.Spe(2),DynStat.Lib(1),DynStat.Sens(0.5)][13]);
         }
         else if(int([DynStat.Str(-1),DynStat.Tou(-1),DynStat.Spe(2),DynStat.Lib(1),DynStat.Sens(0.5)].length) == 15)
         {
            KGAMECLASS.kGAMECLASS.player.dynStats([DynStat.Str(-1),DynStat.Tou(-1),DynStat.Spe(2),DynStat.Lib(1),DynStat.Sens(0.5)][0],[DynStat.Str(-1),DynStat.Tou(-1),DynStat.Spe(2),DynStat.Lib(1),DynStat.Sens(0.5)][1],[DynStat.Str(-1),DynStat.Tou(-1),DynStat.Spe(2),DynStat.Lib(1),DynStat.Sens(0.5)][2],[DynStat.Str(-1),DynStat.Tou(-1),DynStat.Spe(2),DynStat.Lib(1),DynStat.Sens(0.5)][3],[DynStat.Str(-1),DynStat.Tou(-1),DynStat.Spe(2),DynStat.Lib(1),DynStat.Sens(0.5)][4],[DynStat.Str(-1),DynStat.Tou(-1),DynStat.Spe(2),DynStat.Lib(1),DynStat.Sens(0.5)][5],[DynStat.Str(-1),DynStat.Tou(-1),DynStat.Spe(2),DynStat.Lib(1),DynStat.Sens(0.5)][6],[DynStat.Str(-1),DynStat.Tou(-1),DynStat.Spe(2),DynStat.Lib(1),DynStat.Sens(0.5)][7],[DynStat.Str(-1),DynStat.Tou(-1),DynStat.Spe(2),DynStat.Lib(1),DynStat.Sens(0.5)][8],[DynStat.Str(-1),DynStat.Tou(-1),DynStat.Spe(2),DynStat.Lib(1),DynStat.Sens(0.5)][9],[DynStat.Str(-1),DynStat.Tou(-1),DynStat.Spe(2),DynStat.Lib(1),DynStat.Sens(0.5)][10],[DynStat.Str(-1),DynStat.Tou(-1)
            ,DynStat.Spe(2),DynStat.Lib(1),DynStat.Sens(0.5)][11],[DynStat.Str(-1),DynStat.Tou(-1),DynStat.Spe(2),DynStat.Lib(1),DynStat.Sens(0.5)][12],[DynStat.Str(-1),DynStat.Tou(-1),DynStat.Spe(2),DynStat.Lib(1),DynStat.Sens(0.5)][13],[DynStat.Str(-1),DynStat.Tou(-1),DynStat.Spe(2),DynStat.Lib(1),DynStat.Sens(0.5)][14]);
         }
         else if(int([DynStat.Str(-1),DynStat.Tou(-1),DynStat.Spe(2),DynStat.Lib(1),DynStat.Sens(0.5)].length) == 16)
         {
            KGAMECLASS.kGAMECLASS.player.dynStats([DynStat.Str(-1),DynStat.Tou(-1),DynStat.Spe(2),DynStat.Lib(1),DynStat.Sens(0.5)][0],[DynStat.Str(-1),DynStat.Tou(-1),DynStat.Spe(2),DynStat.Lib(1),DynStat.Sens(0.5)][1],[DynStat.Str(-1),DynStat.Tou(-1),DynStat.Spe(2),DynStat.Lib(1),DynStat.Sens(0.5)][2],[DynStat.Str(-1),DynStat.Tou(-1),DynStat.Spe(2),DynStat.Lib(1),DynStat.Sens(0.5)][3],[DynStat.Str(-1),DynStat.Tou(-1),DynStat.Spe(2),DynStat.Lib(1),DynStat.Sens(0.5)][4],[DynStat.Str(-1),DynStat.Tou(-1),DynStat.Spe(2),DynStat.Lib(1),DynStat.Sens(0.5)][5],[DynStat.Str(-1),DynStat.Tou(-1),DynStat.Spe(2),DynStat.Lib(1),DynStat.Sens(0.5)][6],[DynStat.Str(-1),DynStat.Tou(-1),DynStat.Spe(2),DynStat.Lib(1),DynStat.Sens(0.5)][7],[DynStat.Str(-1),DynStat.Tou(-1),DynStat.Spe(2),DynStat.Lib(1),DynStat.Sens(0.5)][8],[DynStat.Str(-1),DynStat.Tou(-1),DynStat.Spe(2),DynStat.Lib(1),DynStat.Sens(0.5)][9],[DynStat.Str(-1),DynStat.Tou(-1),DynStat.Spe(2),DynStat.Lib(1),DynStat.Sens(0.5)][10],[DynStat.Str(-1),DynStat.Tou(-1)
            ,DynStat.Spe(2),DynStat.Lib(1),DynStat.Sens(0.5)][11],[DynStat.Str(-1),DynStat.Tou(-1),DynStat.Spe(2),DynStat.Lib(1),DynStat.Sens(0.5)][12],[DynStat.Str(-1),DynStat.Tou(-1),DynStat.Spe(2),DynStat.Lib(1),DynStat.Sens(0.5)][13],[DynStat.Str(-1),DynStat.Tou(-1),DynStat.Spe(2),DynStat.Lib(1),DynStat.Sens(0.5)][14],[DynStat.Str(-1),DynStat.Tou(-1),DynStat.Spe(2),DynStat.Lib(1),DynStat.Sens(0.5)][15]);
         }
         else if(int([DynStat.Str(-1),DynStat.Tou(-1),DynStat.Spe(2),DynStat.Lib(1),DynStat.Sens(0.5)].length) == 17)
         {
            KGAMECLASS.kGAMECLASS.player.dynStats([DynStat.Str(-1),DynStat.Tou(-1),DynStat.Spe(2),DynStat.Lib(1),DynStat.Sens(0.5)][0],[DynStat.Str(-1),DynStat.Tou(-1),DynStat.Spe(2),DynStat.Lib(1),DynStat.Sens(0.5)][1],[DynStat.Str(-1),DynStat.Tou(-1),DynStat.Spe(2),DynStat.Lib(1),DynStat.Sens(0.5)][2],[DynStat.Str(-1),DynStat.Tou(-1),DynStat.Spe(2),DynStat.Lib(1),DynStat.Sens(0.5)][3],[DynStat.Str(-1),DynStat.Tou(-1),DynStat.Spe(2),DynStat.Lib(1),DynStat.Sens(0.5)][4],[DynStat.Str(-1),DynStat.Tou(-1),DynStat.Spe(2),DynStat.Lib(1),DynStat.Sens(0.5)][5],[DynStat.Str(-1),DynStat.Tou(-1),DynStat.Spe(2),DynStat.Lib(1),DynStat.Sens(0.5)][6],[DynStat.Str(-1),DynStat.Tou(-1),DynStat.Spe(2),DynStat.Lib(1),DynStat.Sens(0.5)][7],[DynStat.Str(-1),DynStat.Tou(-1),DynStat.Spe(2),DynStat.Lib(1),DynStat.Sens(0.5)][8],[DynStat.Str(-1),DynStat.Tou(-1),DynStat.Spe(2),DynStat.Lib(1),DynStat.Sens(0.5)][9],[DynStat.Str(-1),DynStat.Tou(-1),DynStat.Spe(2),DynStat.Lib(1),DynStat.Sens(0.5)][10],[DynStat.Str(-1),DynStat.Tou(-1)
            ,DynStat.Spe(2),DynStat.Lib(1),DynStat.Sens(0.5)][11],[DynStat.Str(-1),DynStat.Tou(-1),DynStat.Spe(2),DynStat.Lib(1),DynStat.Sens(0.5)][12],[DynStat.Str(-1),DynStat.Tou(-1),DynStat.Spe(2),DynStat.Lib(1),DynStat.Sens(0.5)][13],[DynStat.Str(-1),DynStat.Tou(-1),DynStat.Spe(2),DynStat.Lib(1),DynStat.Sens(0.5)][14],[DynStat.Str(-1),DynStat.Tou(-1),DynStat.Spe(2),DynStat.Lib(1),DynStat.Sens(0.5)][15],[DynStat.Str(-1),DynStat.Tou(-1),DynStat.Spe(2),DynStat.Lib(1),DynStat.Sens(0.5)][16]);
         }
         else if(int([DynStat.Str(-1),DynStat.Tou(-1),DynStat.Spe(2),DynStat.Lib(1),DynStat.Sens(0.5)].length) == 18)
         {
            KGAMECLASS.kGAMECLASS.player.dynStats([DynStat.Str(-1),DynStat.Tou(-1),DynStat.Spe(2),DynStat.Lib(1),DynStat.Sens(0.5)][0],[DynStat.Str(-1),DynStat.Tou(-1),DynStat.Spe(2),DynStat.Lib(1),DynStat.Sens(0.5)][1],[DynStat.Str(-1),DynStat.Tou(-1),DynStat.Spe(2),DynStat.Lib(1),DynStat.Sens(0.5)][2],[DynStat.Str(-1),DynStat.Tou(-1),DynStat.Spe(2),DynStat.Lib(1),DynStat.Sens(0.5)][3],[DynStat.Str(-1),DynStat.Tou(-1),DynStat.Spe(2),DynStat.Lib(1),DynStat.Sens(0.5)][4],[DynStat.Str(-1),DynStat.Tou(-1),DynStat.Spe(2),DynStat.Lib(1),DynStat.Sens(0.5)][5],[DynStat.Str(-1),DynStat.Tou(-1),DynStat.Spe(2),DynStat.Lib(1),DynStat.Sens(0.5)][6],[DynStat.Str(-1),DynStat.Tou(-1),DynStat.Spe(2),DynStat.Lib(1),DynStat.Sens(0.5)][7],[DynStat.Str(-1),DynStat.Tou(-1),DynStat.Spe(2),DynStat.Lib(1),DynStat.Sens(0.5)][8],[DynStat.Str(-1),DynStat.Tou(-1),DynStat.Spe(2),DynStat.Lib(1),DynStat.Sens(0.5)][9],[DynStat.Str(-1),DynStat.Tou(-1),DynStat.Spe(2),DynStat.Lib(1),DynStat.Sens(0.5)][10],[DynStat.Str(-1),DynStat.Tou(-1)
            ,DynStat.Spe(2),DynStat.Lib(1),DynStat.Sens(0.5)][11],[DynStat.Str(-1),DynStat.Tou(-1),DynStat.Spe(2),DynStat.Lib(1),DynStat.Sens(0.5)][12],[DynStat.Str(-1),DynStat.Tou(-1),DynStat.Spe(2),DynStat.Lib(1),DynStat.Sens(0.5)][13],[DynStat.Str(-1),DynStat.Tou(-1),DynStat.Spe(2),DynStat.Lib(1),DynStat.Sens(0.5)][14],[DynStat.Str(-1),DynStat.Tou(-1),DynStat.Spe(2),DynStat.Lib(1),DynStat.Sens(0.5)][15],[DynStat.Str(-1),DynStat.Tou(-1),DynStat.Spe(2),DynStat.Lib(1),DynStat.Sens(0.5)][16],[DynStat.Str(-1),DynStat.Tou(-1),DynStat.Spe(2),DynStat.Lib(1),DynStat.Sens(0.5)][17]);
         }
         else if(int([DynStat.Str(-1),DynStat.Tou(-1),DynStat.Spe(2),DynStat.Lib(1),DynStat.Sens(0.5)].length) == 19)
         {
            KGAMECLASS.kGAMECLASS.player.dynStats([DynStat.Str(-1),DynStat.Tou(-1),DynStat.Spe(2),DynStat.Lib(1),DynStat.Sens(0.5)][0],[DynStat.Str(-1),DynStat.Tou(-1),DynStat.Spe(2),DynStat.Lib(1),DynStat.Sens(0.5)][1],[DynStat.Str(-1),DynStat.Tou(-1),DynStat.Spe(2),DynStat.Lib(1),DynStat.Sens(0.5)][2],[DynStat.Str(-1),DynStat.Tou(-1),DynStat.Spe(2),DynStat.Lib(1),DynStat.Sens(0.5)][3],[DynStat.Str(-1),DynStat.Tou(-1),DynStat.Spe(2),DynStat.Lib(1),DynStat.Sens(0.5)][4],[DynStat.Str(-1),DynStat.Tou(-1),DynStat.Spe(2),DynStat.Lib(1),DynStat.Sens(0.5)][5],[DynStat.Str(-1),DynStat.Tou(-1),DynStat.Spe(2),DynStat.Lib(1),DynStat.Sens(0.5)][6],[DynStat.Str(-1),DynStat.Tou(-1),DynStat.Spe(2),DynStat.Lib(1),DynStat.Sens(0.5)][7],[DynStat.Str(-1),DynStat.Tou(-1),DynStat.Spe(2),DynStat.Lib(1),DynStat.Sens(0.5)][8],[DynStat.Str(-1),DynStat.Tou(-1),DynStat.Spe(2),DynStat.Lib(1),DynStat.Sens(0.5)][9],[DynStat.Str(-1),DynStat.Tou(-1),DynStat.Spe(2),DynStat.Lib(1),DynStat.Sens(0.5)][10],[DynStat.Str(-1),DynStat.Tou(-1)
            ,DynStat.Spe(2),DynStat.Lib(1),DynStat.Sens(0.5)][11],[DynStat.Str(-1),DynStat.Tou(-1),DynStat.Spe(2),DynStat.Lib(1),DynStat.Sens(0.5)][12],[DynStat.Str(-1),DynStat.Tou(-1),DynStat.Spe(2),DynStat.Lib(1),DynStat.Sens(0.5)][13],[DynStat.Str(-1),DynStat.Tou(-1),DynStat.Spe(2),DynStat.Lib(1),DynStat.Sens(0.5)][14],[DynStat.Str(-1),DynStat.Tou(-1),DynStat.Spe(2),DynStat.Lib(1),DynStat.Sens(0.5)][15],[DynStat.Str(-1),DynStat.Tou(-1),DynStat.Spe(2),DynStat.Lib(1),DynStat.Sens(0.5)][16],[DynStat.Str(-1),DynStat.Tou(-1),DynStat.Spe(2),DynStat.Lib(1),DynStat.Sens(0.5)][17],[DynStat.Str(-1),DynStat.Tou(-1),DynStat.Spe(2),DynStat.Lib(1),DynStat.Sens(0.5)][18]);
         }
         else
         {
            if(int([DynStat.Str(-1),DynStat.Tou(-1),DynStat.Spe(2),DynStat.Lib(1),DynStat.Sens(0.5)].length) != 20)
            {
               throw "Too many rest arguments";
            }
            KGAMECLASS.kGAMECLASS.player.dynStats([DynStat.Str(-1),DynStat.Tou(-1),DynStat.Spe(2),DynStat.Lib(1),DynStat.Sens(0.5)][0],[DynStat.Str(-1),DynStat.Tou(-1),DynStat.Spe(2),DynStat.Lib(1),DynStat.Sens(0.5)][1],[DynStat.Str(-1),DynStat.Tou(-1),DynStat.Spe(2),DynStat.Lib(1),DynStat.Sens(0.5)][2],[DynStat.Str(-1),DynStat.Tou(-1),DynStat.Spe(2),DynStat.Lib(1),DynStat.Sens(0.5)][3],[DynStat.Str(-1),DynStat.Tou(-1),DynStat.Spe(2),DynStat.Lib(1),DynStat.Sens(0.5)][4],[DynStat.Str(-1),DynStat.Tou(-1),DynStat.Spe(2),DynStat.Lib(1),DynStat.Sens(0.5)][5],[DynStat.Str(-1),DynStat.Tou(-1),DynStat.Spe(2),DynStat.Lib(1),DynStat.Sens(0.5)][6],[DynStat.Str(-1),DynStat.Tou(-1),DynStat.Spe(2),DynStat.Lib(1),DynStat.Sens(0.5)][7],[DynStat.Str(-1),DynStat.Tou(-1),DynStat.Spe(2),DynStat.Lib(1),DynStat.Sens(0.5)][8],[DynStat.Str(-1),DynStat.Tou(-1),DynStat.Spe(2),DynStat.Lib(1),DynStat.Sens(0.5)][9],[DynStat.Str(-1),DynStat.Tou(-1),DynStat.Spe(2),DynStat.Lib(1),DynStat.Sens(0.5)][10],[DynStat.Str(-1),DynStat.Tou(-1)
            ,DynStat.Spe(2),DynStat.Lib(1),DynStat.Sens(0.5)][11],[DynStat.Str(-1),DynStat.Tou(-1),DynStat.Spe(2),DynStat.Lib(1),DynStat.Sens(0.5)][12],[DynStat.Str(-1),DynStat.Tou(-1),DynStat.Spe(2),DynStat.Lib(1),DynStat.Sens(0.5)][13],[DynStat.Str(-1),DynStat.Tou(-1),DynStat.Spe(2),DynStat.Lib(1),DynStat.Sens(0.5)][14],[DynStat.Str(-1),DynStat.Tou(-1),DynStat.Spe(2),DynStat.Lib(1),DynStat.Sens(0.5)][15],[DynStat.Str(-1),DynStat.Tou(-1),DynStat.Spe(2),DynStat.Lib(1),DynStat.Sens(0.5)][16],[DynStat.Str(-1),DynStat.Tou(-1),DynStat.Spe(2),DynStat.Lib(1),DynStat.Sens(0.5)][17],[DynStat.Str(-1),DynStat.Tou(-1),DynStat.Spe(2),DynStat.Lib(1),DynStat.Sens(0.5)][18],[DynStat.Str(-1),DynStat.Tou(-1),DynStat.Spe(2),DynStat.Lib(1),DynStat.Sens(0.5)][19]);
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
         output.text("[pg]");
      }
      
      public function updateVaginalPregnancy() : Boolean
      {
         var _loc1_:Player = KGAMECLASS.kGAMECLASS.player;
         var _loc2_:Boolean = false;
         if(_loc1_.get_pregnancyIncubation() == 290)
         {
            output.text("<b>你发现自己的肚子微微变大了。也许你需要少吃点奇怪的食物了。</b>[pg]");
            _loc2_ = true;
         }
         if(_loc1_.get_pregnancyIncubation() == 240)
         {
            output.text("<b>你的肚子明显隆起，并且在里面蠕动。你可能怀孕了。</b>[pg]");
            _loc2_ = true;
         }
         if(_loc1_.get_pregnancyIncubation() == 216)
         {
            output.text("<b>你的肚子上出现了明显的怀孕隆起。你感觉它越来越重了。");
            if(_loc1_.cor < 40)
            {
               output.text("你为这意外的怀孕感到苦恼，也为自己无法将这东西逼出体外而感到无助。</b>");
            }
            if(_loc1_.cor >= 40 && _loc1_.cor < 75)
            {
               output.text("考虑到那些操过你的生物的尺寸，你只希望它出来的时候不会太疼。</b>");
            }
            if(_loc1_.cor >= 75)
            {
               output.text("你梦幻般地回味着最近操过你的那些巨大肉棒，并希望你的后代也能继承这样一件带来快感的工具。</b>");
            }
            output.text("[pg]");
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
            output.text("<b>你的肚子里有一股奇怪的热流，这让你感到有些疲惫。</b>[pg]");
            if(int([DynStat.Tou(-1)].length) == 0)
            {
               KGAMECLASS.kGAMECLASS.player.dynStats();
            }
            else if(int([DynStat.Tou(-1)].length) == 1)
            {
               KGAMECLASS.kGAMECLASS.player.dynStats([DynStat.Tou(-1)][0]);
            }
            else if(int([DynStat.Tou(-1)].length) == 2)
            {
               KGAMECLASS.kGAMECLASS.player.dynStats([DynStat.Tou(-1)][0],[DynStat.Tou(-1)][1]);
            }
            else if(int([DynStat.Tou(-1)].length) == 3)
            {
               KGAMECLASS.kGAMECLASS.player.dynStats([DynStat.Tou(-1)][0],[DynStat.Tou(-1)][1],[DynStat.Tou(-1)][2]);
            }
            else if(int([DynStat.Tou(-1)].length) == 4)
            {
               KGAMECLASS.kGAMECLASS.player.dynStats([DynStat.Tou(-1)][0],[DynStat.Tou(-1)][1],[DynStat.Tou(-1)][2],[DynStat.Tou(-1)][3]);
            }
            else if(int([DynStat.Tou(-1)].length) == 5)
            {
               KGAMECLASS.kGAMECLASS.player.dynStats([DynStat.Tou(-1)][0],[DynStat.Tou(-1)][1],[DynStat.Tou(-1)][2],[DynStat.Tou(-1)][3],[DynStat.Tou(-1)][4]);
            }
            else if(int([DynStat.Tou(-1)].length) == 6)
            {
               KGAMECLASS.kGAMECLASS.player.dynStats([DynStat.Tou(-1)][0],[DynStat.Tou(-1)][1],[DynStat.Tou(-1)][2],[DynStat.Tou(-1)][3],[DynStat.Tou(-1)][4],[DynStat.Tou(-1)][5]);
            }
            else if(int([DynStat.Tou(-1)].length) == 7)
            {
               KGAMECLASS.kGAMECLASS.player.dynStats([DynStat.Tou(-1)][0],[DynStat.Tou(-1)][1],[DynStat.Tou(-1)][2],[DynStat.Tou(-1)][3],[DynStat.Tou(-1)][4],[DynStat.Tou(-1)][5],[DynStat.Tou(-1)][6]);
            }
            else if(int([DynStat.Tou(-1)].length) == 8)
            {
               KGAMECLASS.kGAMECLASS.player.dynStats([DynStat.Tou(-1)][0],[DynStat.Tou(-1)][1],[DynStat.Tou(-1)][2],[DynStat.Tou(-1)][3],[DynStat.Tou(-1)][4],[DynStat.Tou(-1)][5],[DynStat.Tou(-1)][6],[DynStat.Tou(-1)][7]);
            }
            else if(int([DynStat.Tou(-1)].length) == 9)
            {
               KGAMECLASS.kGAMECLASS.player.dynStats([DynStat.Tou(-1)][0],[DynStat.Tou(-1)][1],[DynStat.Tou(-1)][2],[DynStat.Tou(-1)][3],[DynStat.Tou(-1)][4],[DynStat.Tou(-1)][5],[DynStat.Tou(-1)][6],[DynStat.Tou(-1)][7],[DynStat.Tou(-1)][8]);
            }
            else if(int([DynStat.Tou(-1)].length) == 10)
            {
               KGAMECLASS.kGAMECLASS.player.dynStats([DynStat.Tou(-1)][0],[DynStat.Tou(-1)][1],[DynStat.Tou(-1)][2],[DynStat.Tou(-1)][3],[DynStat.Tou(-1)][4],[DynStat.Tou(-1)][5],[DynStat.Tou(-1)][6],[DynStat.Tou(-1)][7],[DynStat.Tou(-1)][8],[DynStat.Tou(-1)][9]);
            }
            else if(int([DynStat.Tou(-1)].length) == 11)
            {
               KGAMECLASS.kGAMECLASS.player.dynStats([DynStat.Tou(-1)][0],[DynStat.Tou(-1)][1],[DynStat.Tou(-1)][2],[DynStat.Tou(-1)][3],[DynStat.Tou(-1)][4],[DynStat.Tou(-1)][5],[DynStat.Tou(-1)][6],[DynStat.Tou(-1)][7],[DynStat.Tou(-1)][8],[DynStat.Tou(-1)][9],[DynStat.Tou(-1)][10]);
            }
            else if(int([DynStat.Tou(-1)].length) == 12)
            {
               KGAMECLASS.kGAMECLASS.player.dynStats([DynStat.Tou(-1)][0],[DynStat.Tou(-1)][1],[DynStat.Tou(-1)][2],[DynStat.Tou(-1)][3],[DynStat.Tou(-1)][4],[DynStat.Tou(-1)][5],[DynStat.Tou(-1)][6],[DynStat.Tou(-1)][7],[DynStat.Tou(-1)][8],[DynStat.Tou(-1)][9],[DynStat.Tou(-1)][10],[DynStat.Tou(-1)][11]);
            }
            else if(int([DynStat.Tou(-1)].length) == 13)
            {
               KGAMECLASS.kGAMECLASS.player.dynStats([DynStat.Tou(-1)][0],[DynStat.Tou(-1)][1],[DynStat.Tou(-1)][2],[DynStat.Tou(-1)][3],[DynStat.Tou(-1)][4],[DynStat.Tou(-1)][5],[DynStat.Tou(-1)][6],[DynStat.Tou(-1)][7],[DynStat.Tou(-1)][8],[DynStat.Tou(-1)][9],[DynStat.Tou(-1)][10],[DynStat.Tou(-1)][11],[DynStat.Tou(-1)][12]);
            }
            else if(int([DynStat.Tou(-1)].length) == 14)
            {
               KGAMECLASS.kGAMECLASS.player.dynStats([DynStat.Tou(-1)][0],[DynStat.Tou(-1)][1],[DynStat.Tou(-1)][2],[DynStat.Tou(-1)][3],[DynStat.Tou(-1)][4],[DynStat.Tou(-1)][5],[DynStat.Tou(-1)][6],[DynStat.Tou(-1)][7],[DynStat.Tou(-1)][8],[DynStat.Tou(-1)][9],[DynStat.Tou(-1)][10],[DynStat.Tou(-1)][11],[DynStat.Tou(-1)][12],[DynStat.Tou(-1)][13]);
            }
            else if(int([DynStat.Tou(-1)].length) == 15)
            {
               KGAMECLASS.kGAMECLASS.player.dynStats([DynStat.Tou(-1)][0],[DynStat.Tou(-1)][1],[DynStat.Tou(-1)][2],[DynStat.Tou(-1)][3],[DynStat.Tou(-1)][4],[DynStat.Tou(-1)][5],[DynStat.Tou(-1)][6],[DynStat.Tou(-1)][7],[DynStat.Tou(-1)][8],[DynStat.Tou(-1)][9],[DynStat.Tou(-1)][10],[DynStat.Tou(-1)][11],[DynStat.Tou(-1)][12],[DynStat.Tou(-1)][13],[DynStat.Tou(-1)][14]);
            }
            else if(int([DynStat.Tou(-1)].length) == 16)
            {
               KGAMECLASS.kGAMECLASS.player.dynStats([DynStat.Tou(-1)][0],[DynStat.Tou(-1)][1],[DynStat.Tou(-1)][2],[DynStat.Tou(-1)][3],[DynStat.Tou(-1)][4],[DynStat.Tou(-1)][5],[DynStat.Tou(-1)][6],[DynStat.Tou(-1)][7],[DynStat.Tou(-1)][8],[DynStat.Tou(-1)][9],[DynStat.Tou(-1)][10],[DynStat.Tou(-1)][11],[DynStat.Tou(-1)][12],[DynStat.Tou(-1)][13],[DynStat.Tou(-1)][14],[DynStat.Tou(-1)][15]);
            }
            else if(int([DynStat.Tou(-1)].length) == 17)
            {
               KGAMECLASS.kGAMECLASS.player.dynStats([DynStat.Tou(-1)][0],[DynStat.Tou(-1)][1],[DynStat.Tou(-1)][2],[DynStat.Tou(-1)][3],[DynStat.Tou(-1)][4],[DynStat.Tou(-1)][5],[DynStat.Tou(-1)][6],[DynStat.Tou(-1)][7],[DynStat.Tou(-1)][8],[DynStat.Tou(-1)][9],[DynStat.Tou(-1)][10],[DynStat.Tou(-1)][11],[DynStat.Tou(-1)][12],[DynStat.Tou(-1)][13],[DynStat.Tou(-1)][14],[DynStat.Tou(-1)][15],[DynStat.Tou(-1)][16]);
            }
            else if(int([DynStat.Tou(-1)].length) == 18)
            {
               KGAMECLASS.kGAMECLASS.player.dynStats([DynStat.Tou(-1)][0],[DynStat.Tou(-1)][1],[DynStat.Tou(-1)][2],[DynStat.Tou(-1)][3],[DynStat.Tou(-1)][4],[DynStat.Tou(-1)][5],[DynStat.Tou(-1)][6],[DynStat.Tou(-1)][7],[DynStat.Tou(-1)][8],[DynStat.Tou(-1)][9],[DynStat.Tou(-1)][10],[DynStat.Tou(-1)][11],[DynStat.Tou(-1)][12],[DynStat.Tou(-1)][13],[DynStat.Tou(-1)][14],[DynStat.Tou(-1)][15],[DynStat.Tou(-1)][16],[DynStat.Tou(-1)][17]);
            }
            else if(int([DynStat.Tou(-1)].length) == 19)
            {
               KGAMECLASS.kGAMECLASS.player.dynStats([DynStat.Tou(-1)][0],[DynStat.Tou(-1)][1],[DynStat.Tou(-1)][2],[DynStat.Tou(-1)][3],[DynStat.Tou(-1)][4],[DynStat.Tou(-1)][5],[DynStat.Tou(-1)][6],[DynStat.Tou(-1)][7],[DynStat.Tou(-1)][8],[DynStat.Tou(-1)][9],[DynStat.Tou(-1)][10],[DynStat.Tou(-1)][11],[DynStat.Tou(-1)][12],[DynStat.Tou(-1)][13],[DynStat.Tou(-1)][14],[DynStat.Tou(-1)][15],[DynStat.Tou(-1)][16],[DynStat.Tou(-1)][17],[DynStat.Tou(-1)][18]);
            }
            else
            {
               if(int([DynStat.Tou(-1)].length) != 20)
               {
                  throw "Too many rest arguments";
               }
               KGAMECLASS.kGAMECLASS.player.dynStats([DynStat.Tou(-1)][0],[DynStat.Tou(-1)][1],[DynStat.Tou(-1)][2],[DynStat.Tou(-1)][3],[DynStat.Tou(-1)][4],[DynStat.Tou(-1)][5],[DynStat.Tou(-1)][6],[DynStat.Tou(-1)][7],[DynStat.Tou(-1)][8],[DynStat.Tou(-1)][9],[DynStat.Tou(-1)][10],[DynStat.Tou(-1)][11],[DynStat.Tou(-1)][12],[DynStat.Tou(-1)][13],[DynStat.Tou(-1)][14],[DynStat.Tou(-1)][15],[DynStat.Tou(-1)][16],[DynStat.Tou(-1)][17],[DynStat.Tou(-1)][18],[DynStat.Tou(-1)][19]);
            }
            _loc2_ = true;
         }
         if(_loc1_.get_pregnancyIncubation() == 120)
         {
            output.text("<b>你不断变大的肚子让周围的人都能明显看出你怀孕了。每一天你都能感觉到体内的热量在不断增加。</b>[pg]");
            _loc2_ = true;
            if(int([DynStat.Tou(-1)].length) == 0)
            {
               KGAMECLASS.kGAMECLASS.player.dynStats();
            }
            else if(int([DynStat.Tou(-1)].length) == 1)
            {
               KGAMECLASS.kGAMECLASS.player.dynStats([DynStat.Tou(-1)][0]);
            }
            else if(int([DynStat.Tou(-1)].length) == 2)
            {
               KGAMECLASS.kGAMECLASS.player.dynStats([DynStat.Tou(-1)][0],[DynStat.Tou(-1)][1]);
            }
            else if(int([DynStat.Tou(-1)].length) == 3)
            {
               KGAMECLASS.kGAMECLASS.player.dynStats([DynStat.Tou(-1)][0],[DynStat.Tou(-1)][1],[DynStat.Tou(-1)][2]);
            }
            else if(int([DynStat.Tou(-1)].length) == 4)
            {
               KGAMECLASS.kGAMECLASS.player.dynStats([DynStat.Tou(-1)][0],[DynStat.Tou(-1)][1],[DynStat.Tou(-1)][2],[DynStat.Tou(-1)][3]);
            }
            else if(int([DynStat.Tou(-1)].length) == 5)
            {
               KGAMECLASS.kGAMECLASS.player.dynStats([DynStat.Tou(-1)][0],[DynStat.Tou(-1)][1],[DynStat.Tou(-1)][2],[DynStat.Tou(-1)][3],[DynStat.Tou(-1)][4]);
            }
            else if(int([DynStat.Tou(-1)].length) == 6)
            {
               KGAMECLASS.kGAMECLASS.player.dynStats([DynStat.Tou(-1)][0],[DynStat.Tou(-1)][1],[DynStat.Tou(-1)][2],[DynStat.Tou(-1)][3],[DynStat.Tou(-1)][4],[DynStat.Tou(-1)][5]);
            }
            else if(int([DynStat.Tou(-1)].length) == 7)
            {
               KGAMECLASS.kGAMECLASS.player.dynStats([DynStat.Tou(-1)][0],[DynStat.Tou(-1)][1],[DynStat.Tou(-1)][2],[DynStat.Tou(-1)][3],[DynStat.Tou(-1)][4],[DynStat.Tou(-1)][5],[DynStat.Tou(-1)][6]);
            }
            else if(int([DynStat.Tou(-1)].length) == 8)
            {
               KGAMECLASS.kGAMECLASS.player.dynStats([DynStat.Tou(-1)][0],[DynStat.Tou(-1)][1],[DynStat.Tou(-1)][2],[DynStat.Tou(-1)][3],[DynStat.Tou(-1)][4],[DynStat.Tou(-1)][5],[DynStat.Tou(-1)][6],[DynStat.Tou(-1)][7]);
            }
            else if(int([DynStat.Tou(-1)].length) == 9)
            {
               KGAMECLASS.kGAMECLASS.player.dynStats([DynStat.Tou(-1)][0],[DynStat.Tou(-1)][1],[DynStat.Tou(-1)][2],[DynStat.Tou(-1)][3],[DynStat.Tou(-1)][4],[DynStat.Tou(-1)][5],[DynStat.Tou(-1)][6],[DynStat.Tou(-1)][7],[DynStat.Tou(-1)][8]);
            }
            else if(int([DynStat.Tou(-1)].length) == 10)
            {
               KGAMECLASS.kGAMECLASS.player.dynStats([DynStat.Tou(-1)][0],[DynStat.Tou(-1)][1],[DynStat.Tou(-1)][2],[DynStat.Tou(-1)][3],[DynStat.Tou(-1)][4],[DynStat.Tou(-1)][5],[DynStat.Tou(-1)][6],[DynStat.Tou(-1)][7],[DynStat.Tou(-1)][8],[DynStat.Tou(-1)][9]);
            }
            else if(int([DynStat.Tou(-1)].length) == 11)
            {
               KGAMECLASS.kGAMECLASS.player.dynStats([DynStat.Tou(-1)][0],[DynStat.Tou(-1)][1],[DynStat.Tou(-1)][2],[DynStat.Tou(-1)][3],[DynStat.Tou(-1)][4],[DynStat.Tou(-1)][5],[DynStat.Tou(-1)][6],[DynStat.Tou(-1)][7],[DynStat.Tou(-1)][8],[DynStat.Tou(-1)][9],[DynStat.Tou(-1)][10]);
            }
            else if(int([DynStat.Tou(-1)].length) == 12)
            {
               KGAMECLASS.kGAMECLASS.player.dynStats([DynStat.Tou(-1)][0],[DynStat.Tou(-1)][1],[DynStat.Tou(-1)][2],[DynStat.Tou(-1)][3],[DynStat.Tou(-1)][4],[DynStat.Tou(-1)][5],[DynStat.Tou(-1)][6],[DynStat.Tou(-1)][7],[DynStat.Tou(-1)][8],[DynStat.Tou(-1)][9],[DynStat.Tou(-1)][10],[DynStat.Tou(-1)][11]);
            }
            else if(int([DynStat.Tou(-1)].length) == 13)
            {
               KGAMECLASS.kGAMECLASS.player.dynStats([DynStat.Tou(-1)][0],[DynStat.Tou(-1)][1],[DynStat.Tou(-1)][2],[DynStat.Tou(-1)][3],[DynStat.Tou(-1)][4],[DynStat.Tou(-1)][5],[DynStat.Tou(-1)][6],[DynStat.Tou(-1)][7],[DynStat.Tou(-1)][8],[DynStat.Tou(-1)][9],[DynStat.Tou(-1)][10],[DynStat.Tou(-1)][11],[DynStat.Tou(-1)][12]);
            }
            else if(int([DynStat.Tou(-1)].length) == 14)
            {
               KGAMECLASS.kGAMECLASS.player.dynStats([DynStat.Tou(-1)][0],[DynStat.Tou(-1)][1],[DynStat.Tou(-1)][2],[DynStat.Tou(-1)][3],[DynStat.Tou(-1)][4],[DynStat.Tou(-1)][5],[DynStat.Tou(-1)][6],[DynStat.Tou(-1)][7],[DynStat.Tou(-1)][8],[DynStat.Tou(-1)][9],[DynStat.Tou(-1)][10],[DynStat.Tou(-1)][11],[DynStat.Tou(-1)][12],[DynStat.Tou(-1)][13]);
            }
            else if(int([DynStat.Tou(-1)].length) == 15)
            {
               KGAMECLASS.kGAMECLASS.player.dynStats([DynStat.Tou(-1)][0],[DynStat.Tou(-1)][1],[DynStat.Tou(-1)][2],[DynStat.Tou(-1)][3],[DynStat.Tou(-1)][4],[DynStat.Tou(-1)][5],[DynStat.Tou(-1)][6],[DynStat.Tou(-1)][7],[DynStat.Tou(-1)][8],[DynStat.Tou(-1)][9],[DynStat.Tou(-1)][10],[DynStat.Tou(-1)][11],[DynStat.Tou(-1)][12],[DynStat.Tou(-1)][13],[DynStat.Tou(-1)][14]);
            }
            else if(int([DynStat.Tou(-1)].length) == 16)
            {
               KGAMECLASS.kGAMECLASS.player.dynStats([DynStat.Tou(-1)][0],[DynStat.Tou(-1)][1],[DynStat.Tou(-1)][2],[DynStat.Tou(-1)][3],[DynStat.Tou(-1)][4],[DynStat.Tou(-1)][5],[DynStat.Tou(-1)][6],[DynStat.Tou(-1)][7],[DynStat.Tou(-1)][8],[DynStat.Tou(-1)][9],[DynStat.Tou(-1)][10],[DynStat.Tou(-1)][11],[DynStat.Tou(-1)][12],[DynStat.Tou(-1)][13],[DynStat.Tou(-1)][14],[DynStat.Tou(-1)][15]);
            }
            else if(int([DynStat.Tou(-1)].length) == 17)
            {
               KGAMECLASS.kGAMECLASS.player.dynStats([DynStat.Tou(-1)][0],[DynStat.Tou(-1)][1],[DynStat.Tou(-1)][2],[DynStat.Tou(-1)][3],[DynStat.Tou(-1)][4],[DynStat.Tou(-1)][5],[DynStat.Tou(-1)][6],[DynStat.Tou(-1)][7],[DynStat.Tou(-1)][8],[DynStat.Tou(-1)][9],[DynStat.Tou(-1)][10],[DynStat.Tou(-1)][11],[DynStat.Tou(-1)][12],[DynStat.Tou(-1)][13],[DynStat.Tou(-1)][14],[DynStat.Tou(-1)][15],[DynStat.Tou(-1)][16]);
            }
            else if(int([DynStat.Tou(-1)].length) == 18)
            {
               KGAMECLASS.kGAMECLASS.player.dynStats([DynStat.Tou(-1)][0],[DynStat.Tou(-1)][1],[DynStat.Tou(-1)][2],[DynStat.Tou(-1)][3],[DynStat.Tou(-1)][4],[DynStat.Tou(-1)][5],[DynStat.Tou(-1)][6],[DynStat.Tou(-1)][7],[DynStat.Tou(-1)][8],[DynStat.Tou(-1)][9],[DynStat.Tou(-1)][10],[DynStat.Tou(-1)][11],[DynStat.Tou(-1)][12],[DynStat.Tou(-1)][13],[DynStat.Tou(-1)][14],[DynStat.Tou(-1)][15],[DynStat.Tou(-1)][16],[DynStat.Tou(-1)][17]);
            }
            else if(int([DynStat.Tou(-1)].length) == 19)
            {
               KGAMECLASS.kGAMECLASS.player.dynStats([DynStat.Tou(-1)][0],[DynStat.Tou(-1)][1],[DynStat.Tou(-1)][2],[DynStat.Tou(-1)][3],[DynStat.Tou(-1)][4],[DynStat.Tou(-1)][5],[DynStat.Tou(-1)][6],[DynStat.Tou(-1)][7],[DynStat.Tou(-1)][8],[DynStat.Tou(-1)][9],[DynStat.Tou(-1)][10],[DynStat.Tou(-1)][11],[DynStat.Tou(-1)][12],[DynStat.Tou(-1)][13],[DynStat.Tou(-1)][14],[DynStat.Tou(-1)][15],[DynStat.Tou(-1)][16],[DynStat.Tou(-1)][17],[DynStat.Tou(-1)][18]);
            }
            else
            {
               if(int([DynStat.Tou(-1)].length) != 20)
               {
                  throw "Too many rest arguments";
               }
               KGAMECLASS.kGAMECLASS.player.dynStats([DynStat.Tou(-1)][0],[DynStat.Tou(-1)][1],[DynStat.Tou(-1)][2],[DynStat.Tou(-1)][3],[DynStat.Tou(-1)][4],[DynStat.Tou(-1)][5],[DynStat.Tou(-1)][6],[DynStat.Tou(-1)][7],[DynStat.Tou(-1)][8],[DynStat.Tou(-1)][9],[DynStat.Tou(-1)][10],[DynStat.Tou(-1)][11],[DynStat.Tou(-1)][12],[DynStat.Tou(-1)][13],[DynStat.Tou(-1)][14],[DynStat.Tou(-1)][15],[DynStat.Tou(-1)][16],[DynStat.Tou(-1)][17],[DynStat.Tou(-1)][18],[DynStat.Tou(-1)][19]);
            }
         }
         if(_loc1_.get_pregnancyIncubation() == 72)
         {
            output.text("<b>体内的热量不再像以前那样消耗你的体力，反而给了你一种奇特的力量。</b>[pg]");
            if(int([DynStat.Str(1),DynStat.Tou(1)].length) == 0)
            {
               KGAMECLASS.kGAMECLASS.player.dynStats();
            }
            else if(int([DynStat.Str(1),DynStat.Tou(1)].length) == 1)
            {
               KGAMECLASS.kGAMECLASS.player.dynStats([DynStat.Str(1),DynStat.Tou(1)][0]);
            }
            else if(int([DynStat.Str(1),DynStat.Tou(1)].length) == 2)
            {
               KGAMECLASS.kGAMECLASS.player.dynStats([DynStat.Str(1),DynStat.Tou(1)][0],[DynStat.Str(1),DynStat.Tou(1)][1]);
            }
            else if(int([DynStat.Str(1),DynStat.Tou(1)].length) == 3)
            {
               KGAMECLASS.kGAMECLASS.player.dynStats([DynStat.Str(1),DynStat.Tou(1)][0],[DynStat.Str(1),DynStat.Tou(1)][1],[DynStat.Str(1),DynStat.Tou(1)][2]);
            }
            else if(int([DynStat.Str(1),DynStat.Tou(1)].length) == 4)
            {
               KGAMECLASS.kGAMECLASS.player.dynStats([DynStat.Str(1),DynStat.Tou(1)][0],[DynStat.Str(1),DynStat.Tou(1)][1],[DynStat.Str(1),DynStat.Tou(1)][2],[DynStat.Str(1),DynStat.Tou(1)][3]);
            }
            else if(int([DynStat.Str(1),DynStat.Tou(1)].length) == 5)
            {
               KGAMECLASS.kGAMECLASS.player.dynStats([DynStat.Str(1),DynStat.Tou(1)][0],[DynStat.Str(1),DynStat.Tou(1)][1],[DynStat.Str(1),DynStat.Tou(1)][2],[DynStat.Str(1),DynStat.Tou(1)][3],[DynStat.Str(1),DynStat.Tou(1)][4]);
            }
            else if(int([DynStat.Str(1),DynStat.Tou(1)].length) == 6)
            {
               KGAMECLASS.kGAMECLASS.player.dynStats([DynStat.Str(1),DynStat.Tou(1)][0],[DynStat.Str(1),DynStat.Tou(1)][1],[DynStat.Str(1),DynStat.Tou(1)][2],[DynStat.Str(1),DynStat.Tou(1)][3],[DynStat.Str(1),DynStat.Tou(1)][4],[DynStat.Str(1),DynStat.Tou(1)][5]);
            }
            else if(int([DynStat.Str(1),DynStat.Tou(1)].length) == 7)
            {
               KGAMECLASS.kGAMECLASS.player.dynStats([DynStat.Str(1),DynStat.Tou(1)][0],[DynStat.Str(1),DynStat.Tou(1)][1],[DynStat.Str(1),DynStat.Tou(1)][2],[DynStat.Str(1),DynStat.Tou(1)][3],[DynStat.Str(1),DynStat.Tou(1)][4],[DynStat.Str(1),DynStat.Tou(1)][5],[DynStat.Str(1),DynStat.Tou(1)][6]);
            }
            else if(int([DynStat.Str(1),DynStat.Tou(1)].length) == 8)
            {
               KGAMECLASS.kGAMECLASS.player.dynStats([DynStat.Str(1),DynStat.Tou(1)][0],[DynStat.Str(1),DynStat.Tou(1)][1],[DynStat.Str(1),DynStat.Tou(1)][2],[DynStat.Str(1),DynStat.Tou(1)][3],[DynStat.Str(1),DynStat.Tou(1)][4],[DynStat.Str(1),DynStat.Tou(1)][5],[DynStat.Str(1),DynStat.Tou(1)][6],[DynStat.Str(1),DynStat.Tou(1)][7]);
            }
            else if(int([DynStat.Str(1),DynStat.Tou(1)].length) == 9)
            {
               KGAMECLASS.kGAMECLASS.player.dynStats([DynStat.Str(1),DynStat.Tou(1)][0],[DynStat.Str(1),DynStat.Tou(1)][1],[DynStat.Str(1),DynStat.Tou(1)][2],[DynStat.Str(1),DynStat.Tou(1)][3],[DynStat.Str(1),DynStat.Tou(1)][4],[DynStat.Str(1),DynStat.Tou(1)][5],[DynStat.Str(1),DynStat.Tou(1)][6],[DynStat.Str(1),DynStat.Tou(1)][7],[DynStat.Str(1),DynStat.Tou(1)][8]);
            }
            else if(int([DynStat.Str(1),DynStat.Tou(1)].length) == 10)
            {
               KGAMECLASS.kGAMECLASS.player.dynStats([DynStat.Str(1),DynStat.Tou(1)][0],[DynStat.Str(1),DynStat.Tou(1)][1],[DynStat.Str(1),DynStat.Tou(1)][2],[DynStat.Str(1),DynStat.Tou(1)][3],[DynStat.Str(1),DynStat.Tou(1)][4],[DynStat.Str(1),DynStat.Tou(1)][5],[DynStat.Str(1),DynStat.Tou(1)][6],[DynStat.Str(1),DynStat.Tou(1)][7],[DynStat.Str(1),DynStat.Tou(1)][8],[DynStat.Str(1),DynStat.Tou(1)][9]);
            }
            else if(int([DynStat.Str(1),DynStat.Tou(1)].length) == 11)
            {
               KGAMECLASS.kGAMECLASS.player.dynStats([DynStat.Str(1),DynStat.Tou(1)][0],[DynStat.Str(1),DynStat.Tou(1)][1],[DynStat.Str(1),DynStat.Tou(1)][2],[DynStat.Str(1),DynStat.Tou(1)][3],[DynStat.Str(1),DynStat.Tou(1)][4],[DynStat.Str(1),DynStat.Tou(1)][5],[DynStat.Str(1),DynStat.Tou(1)][6],[DynStat.Str(1),DynStat.Tou(1)][7],[DynStat.Str(1),DynStat.Tou(1)][8],[DynStat.Str(1),DynStat.Tou(1)][9],[DynStat.Str(1),DynStat.Tou(1)][10]);
            }
            else if(int([DynStat.Str(1),DynStat.Tou(1)].length) == 12)
            {
               KGAMECLASS.kGAMECLASS.player.dynStats([DynStat.Str(1),DynStat.Tou(1)][0],[DynStat.Str(1),DynStat.Tou(1)][1],[DynStat.Str(1),DynStat.Tou(1)][2],[DynStat.Str(1),DynStat.Tou(1)][3],[DynStat.Str(1),DynStat.Tou(1)][4],[DynStat.Str(1),DynStat.Tou(1)][5],[DynStat.Str(1),DynStat.Tou(1)][6],[DynStat.Str(1),DynStat.Tou(1)][7],[DynStat.Str(1),DynStat.Tou(1)][8],[DynStat.Str(1),DynStat.Tou(1)][9],[DynStat.Str(1),DynStat.Tou(1)][10],[DynStat.Str(1),DynStat.Tou(1)][11]);
            }
            else if(int([DynStat.Str(1),DynStat.Tou(1)].length) == 13)
            {
               KGAMECLASS.kGAMECLASS.player.dynStats([DynStat.Str(1),DynStat.Tou(1)][0],[DynStat.Str(1),DynStat.Tou(1)][1],[DynStat.Str(1),DynStat.Tou(1)][2],[DynStat.Str(1),DynStat.Tou(1)][3],[DynStat.Str(1),DynStat.Tou(1)][4],[DynStat.Str(1),DynStat.Tou(1)][5],[DynStat.Str(1),DynStat.Tou(1)][6],[DynStat.Str(1),DynStat.Tou(1)][7],[DynStat.Str(1),DynStat.Tou(1)][8],[DynStat.Str(1),DynStat.Tou(1)][9],[DynStat.Str(1),DynStat.Tou(1)][10],[DynStat.Str(1),DynStat.Tou(1)][11],[DynStat.Str(1),DynStat.Tou(1)][12]);
            }
            else if(int([DynStat.Str(1),DynStat.Tou(1)].length) == 14)
            {
               KGAMECLASS.kGAMECLASS.player.dynStats([DynStat.Str(1),DynStat.Tou(1)][0],[DynStat.Str(1),DynStat.Tou(1)][1],[DynStat.Str(1),DynStat.Tou(1)][2],[DynStat.Str(1),DynStat.Tou(1)][3],[DynStat.Str(1),DynStat.Tou(1)][4],[DynStat.Str(1),DynStat.Tou(1)][5],[DynStat.Str(1),DynStat.Tou(1)][6],[DynStat.Str(1),DynStat.Tou(1)][7],[DynStat.Str(1),DynStat.Tou(1)][8],[DynStat.Str(1),DynStat.Tou(1)][9],[DynStat.Str(1),DynStat.Tou(1)][10],[DynStat.Str(1),DynStat.Tou(1)][11],[DynStat.Str(1),DynStat.Tou(1)][12],[DynStat.Str(1),DynStat.Tou(1)][13]);
            }
            else if(int([DynStat.Str(1),DynStat.Tou(1)].length) == 15)
            {
               KGAMECLASS.kGAMECLASS.player.dynStats([DynStat.Str(1),DynStat.Tou(1)][0],[DynStat.Str(1),DynStat.Tou(1)][1],[DynStat.Str(1),DynStat.Tou(1)][2],[DynStat.Str(1),DynStat.Tou(1)][3],[DynStat.Str(1),DynStat.Tou(1)][4],[DynStat.Str(1),DynStat.Tou(1)][5],[DynStat.Str(1),DynStat.Tou(1)][6],[DynStat.Str(1),DynStat.Tou(1)][7],[DynStat.Str(1),DynStat.Tou(1)][8],[DynStat.Str(1),DynStat.Tou(1)][9],[DynStat.Str(1),DynStat.Tou(1)][10],[DynStat.Str(1),DynStat.Tou(1)][11],[DynStat.Str(1),DynStat.Tou(1)][12],[DynStat.Str(1),DynStat.Tou(1)][13],[DynStat.Str(1),DynStat.Tou(1)][14]);
            }
            else if(int([DynStat.Str(1),DynStat.Tou(1)].length) == 16)
            {
               KGAMECLASS.kGAMECLASS.player.dynStats([DynStat.Str(1),DynStat.Tou(1)][0],[DynStat.Str(1),DynStat.Tou(1)][1],[DynStat.Str(1),DynStat.Tou(1)][2],[DynStat.Str(1),DynStat.Tou(1)][3],[DynStat.Str(1),DynStat.Tou(1)][4],[DynStat.Str(1),DynStat.Tou(1)][5],[DynStat.Str(1),DynStat.Tou(1)][6],[DynStat.Str(1),DynStat.Tou(1)][7],[DynStat.Str(1),DynStat.Tou(1)][8],[DynStat.Str(1),DynStat.Tou(1)][9],[DynStat.Str(1),DynStat.Tou(1)][10],[DynStat.Str(1),DynStat.Tou(1)][11],[DynStat.Str(1),DynStat.Tou(1)][12],[DynStat.Str(1),DynStat.Tou(1)][13],[DynStat.Str(1),DynStat.Tou(1)][14],[DynStat.Str(1),DynStat.Tou(1)][15]);
            }
            else if(int([DynStat.Str(1),DynStat.Tou(1)].length) == 17)
            {
               KGAMECLASS.kGAMECLASS.player.dynStats([DynStat.Str(1),DynStat.Tou(1)][0],[DynStat.Str(1),DynStat.Tou(1)][1],[DynStat.Str(1),DynStat.Tou(1)][2],[DynStat.Str(1),DynStat.Tou(1)][3],[DynStat.Str(1),DynStat.Tou(1)][4],[DynStat.Str(1),DynStat.Tou(1)][5],[DynStat.Str(1),DynStat.Tou(1)][6],[DynStat.Str(1),DynStat.Tou(1)][7],[DynStat.Str(1),DynStat.Tou(1)][8],[DynStat.Str(1),DynStat.Tou(1)][9],[DynStat.Str(1),DynStat.Tou(1)][10],[DynStat.Str(1),DynStat.Tou(1)][11],[DynStat.Str(1),DynStat.Tou(1)][12],[DynStat.Str(1),DynStat.Tou(1)][13],[DynStat.Str(1),DynStat.Tou(1)][14],[DynStat.Str(1),DynStat.Tou(1)][15],[DynStat.Str(1),DynStat.Tou(1)][16]);
            }
            else if(int([DynStat.Str(1),DynStat.Tou(1)].length) == 18)
            {
               KGAMECLASS.kGAMECLASS.player.dynStats([DynStat.Str(1),DynStat.Tou(1)][0],[DynStat.Str(1),DynStat.Tou(1)][1],[DynStat.Str(1),DynStat.Tou(1)][2],[DynStat.Str(1),DynStat.Tou(1)][3],[DynStat.Str(1),DynStat.Tou(1)][4],[DynStat.Str(1),DynStat.Tou(1)][5],[DynStat.Str(1),DynStat.Tou(1)][6],[DynStat.Str(1),DynStat.Tou(1)][7],[DynStat.Str(1),DynStat.Tou(1)][8],[DynStat.Str(1),DynStat.Tou(1)][9],[DynStat.Str(1),DynStat.Tou(1)][10],[DynStat.Str(1),DynStat.Tou(1)][11],[DynStat.Str(1),DynStat.Tou(1)][12],[DynStat.Str(1),DynStat.Tou(1)][13],[DynStat.Str(1),DynStat.Tou(1)][14],[DynStat.Str(1),DynStat.Tou(1)][15],[DynStat.Str(1),DynStat.Tou(1)][16],[DynStat.Str(1),DynStat.Tou(1)][17]);
            }
            else if(int([DynStat.Str(1),DynStat.Tou(1)].length) == 19)
            {
               KGAMECLASS.kGAMECLASS.player.dynStats([DynStat.Str(1),DynStat.Tou(1)][0],[DynStat.Str(1),DynStat.Tou(1)][1],[DynStat.Str(1),DynStat.Tou(1)][2],[DynStat.Str(1),DynStat.Tou(1)][3],[DynStat.Str(1),DynStat.Tou(1)][4],[DynStat.Str(1),DynStat.Tou(1)][5],[DynStat.Str(1),DynStat.Tou(1)][6],[DynStat.Str(1),DynStat.Tou(1)][7],[DynStat.Str(1),DynStat.Tou(1)][8],[DynStat.Str(1),DynStat.Tou(1)][9],[DynStat.Str(1),DynStat.Tou(1)][10],[DynStat.Str(1),DynStat.Tou(1)][11],[DynStat.Str(1),DynStat.Tou(1)][12],[DynStat.Str(1),DynStat.Tou(1)][13],[DynStat.Str(1),DynStat.Tou(1)][14],[DynStat.Str(1),DynStat.Tou(1)][15],[DynStat.Str(1),DynStat.Tou(1)][16],[DynStat.Str(1),DynStat.Tou(1)][17],[DynStat.Str(1),DynStat.Tou(1)][18]);
            }
            else
            {
               if(int([DynStat.Str(1),DynStat.Tou(1)].length) != 20)
               {
                  throw "Too many rest arguments";
               }
               KGAMECLASS.kGAMECLASS.player.dynStats([DynStat.Str(1),DynStat.Tou(1)][0],[DynStat.Str(1),DynStat.Tou(1)][1],[DynStat.Str(1),DynStat.Tou(1)][2],[DynStat.Str(1),DynStat.Tou(1)][3],[DynStat.Str(1),DynStat.Tou(1)][4],[DynStat.Str(1),DynStat.Tou(1)][5],[DynStat.Str(1),DynStat.Tou(1)][6],[DynStat.Str(1),DynStat.Tou(1)][7],[DynStat.Str(1),DynStat.Tou(1)][8],[DynStat.Str(1),DynStat.Tou(1)][9],[DynStat.Str(1),DynStat.Tou(1)][10],[DynStat.Str(1),DynStat.Tou(1)][11],[DynStat.Str(1),DynStat.Tou(1)][12],[DynStat.Str(1),DynStat.Tou(1)][13],[DynStat.Str(1),DynStat.Tou(1)][14],[DynStat.Str(1),DynStat.Tou(1)][15],[DynStat.Str(1),DynStat.Tou(1)][16],[DynStat.Str(1),DynStat.Tou(1)][17],[DynStat.Str(1),DynStat.Tou(1)][18],[DynStat.Str(1),DynStat.Tou(1)][19]);
            }
            _loc2_ = true;
         }
         if(_loc1_.get_pregnancyIncubation() == 48)
         {
            output.text("<b>你能感觉到有两个大肿块一起挤压着你的子宫");
            if(_loc1_.cor < 40)
            {
               output.text("让你行动困难。</b>");
            }
            if(_loc1_.cor >= 40 && _loc1_.cor < 75)
            {
               output.text("你想知道还要等多久。</b>");
            }
            if(_loc1_.cor >= 75)
            {
               output.text("你渴望分娩，这样你就能再次被怪物巨大的肉棒射满，将它们堕落的种子直接注入你饥渴的子宫。</b>");
            }
            output.text("[pg]");
            if(int([DynStat.Spe(-2),DynStat.Lib(1),DynStat.Sens(1),DynStat.Lust(4)].length) == 0)
            {
               KGAMECLASS.kGAMECLASS.player.dynStats();
            }
            else if(int([DynStat.Spe(-2),DynStat.Lib(1),DynStat.Sens(1),DynStat.Lust(4)].length) == 1)
            {
               KGAMECLASS.kGAMECLASS.player.dynStats([DynStat.Spe(-2),DynStat.Lib(1),DynStat.Sens(1),DynStat.Lust(4)][0]);
            }
            else if(int([DynStat.Spe(-2),DynStat.Lib(1),DynStat.Sens(1),DynStat.Lust(4)].length) == 2)
            {
               KGAMECLASS.kGAMECLASS.player.dynStats([DynStat.Spe(-2),DynStat.Lib(1),DynStat.Sens(1),DynStat.Lust(4)][0],[DynStat.Spe(-2),DynStat.Lib(1),DynStat.Sens(1),DynStat.Lust(4)][1]);
            }
            else if(int([DynStat.Spe(-2),DynStat.Lib(1),DynStat.Sens(1),DynStat.Lust(4)].length) == 3)
            {
               KGAMECLASS.kGAMECLASS.player.dynStats([DynStat.Spe(-2),DynStat.Lib(1),DynStat.Sens(1),DynStat.Lust(4)][0],[DynStat.Spe(-2),DynStat.Lib(1),DynStat.Sens(1),DynStat.Lust(4)][1],[DynStat.Spe(-2),DynStat.Lib(1),DynStat.Sens(1),DynStat.Lust(4)][2]);
            }
            else if(int([DynStat.Spe(-2),DynStat.Lib(1),DynStat.Sens(1),DynStat.Lust(4)].length) == 4)
            {
               KGAMECLASS.kGAMECLASS.player.dynStats([DynStat.Spe(-2),DynStat.Lib(1),DynStat.Sens(1),DynStat.Lust(4)][0],[DynStat.Spe(-2),DynStat.Lib(1),DynStat.Sens(1),DynStat.Lust(4)][1],[DynStat.Spe(-2),DynStat.Lib(1),DynStat.Sens(1),DynStat.Lust(4)][2],[DynStat.Spe(-2),DynStat.Lib(1),DynStat.Sens(1),DynStat.Lust(4)][3]);
            }
            else if(int([DynStat.Spe(-2),DynStat.Lib(1),DynStat.Sens(1),DynStat.Lust(4)].length) == 5)
            {
               KGAMECLASS.kGAMECLASS.player.dynStats([DynStat.Spe(-2),DynStat.Lib(1),DynStat.Sens(1),DynStat.Lust(4)][0],[DynStat.Spe(-2),DynStat.Lib(1),DynStat.Sens(1),DynStat.Lust(4)][1],[DynStat.Spe(-2),DynStat.Lib(1),DynStat.Sens(1),DynStat.Lust(4)][2],[DynStat.Spe(-2),DynStat.Lib(1),DynStat.Sens(1),DynStat.Lust(4)][3],[DynStat.Spe(-2),DynStat.Lib(1),DynStat.Sens(1),DynStat.Lust(4)][4]);
            }
            else if(int([DynStat.Spe(-2),DynStat.Lib(1),DynStat.Sens(1),DynStat.Lust(4)].length) == 6)
            {
               KGAMECLASS.kGAMECLASS.player.dynStats([DynStat.Spe(-2),DynStat.Lib(1),DynStat.Sens(1),DynStat.Lust(4)][0],[DynStat.Spe(-2),DynStat.Lib(1),DynStat.Sens(1),DynStat.Lust(4)][1],[DynStat.Spe(-2),DynStat.Lib(1),DynStat.Sens(1),DynStat.Lust(4)][2],[DynStat.Spe(-2),DynStat.Lib(1),DynStat.Sens(1),DynStat.Lust(4)][3],[DynStat.Spe(-2),DynStat.Lib(1),DynStat.Sens(1),DynStat.Lust(4)][4],[DynStat.Spe(-2),DynStat.Lib(1),DynStat.Sens(1),DynStat.Lust(4)][5]);
            }
            else if(int([DynStat.Spe(-2),DynStat.Lib(1),DynStat.Sens(1),DynStat.Lust(4)].length) == 7)
            {
               KGAMECLASS.kGAMECLASS.player.dynStats([DynStat.Spe(-2),DynStat.Lib(1),DynStat.Sens(1),DynStat.Lust(4)][0],[DynStat.Spe(-2),DynStat.Lib(1),DynStat.Sens(1),DynStat.Lust(4)][1],[DynStat.Spe(-2),DynStat.Lib(1),DynStat.Sens(1),DynStat.Lust(4)][2],[DynStat.Spe(-2),DynStat.Lib(1),DynStat.Sens(1),DynStat.Lust(4)][3],[DynStat.Spe(-2),DynStat.Lib(1),DynStat.Sens(1),DynStat.Lust(4)][4],[DynStat.Spe(-2),DynStat.Lib(1),DynStat.Sens(1),DynStat.Lust(4)][5],[DynStat.Spe(-2),DynStat.Lib(1),DynStat.Sens(1),DynStat.Lust(4)][6]);
            }
            else if(int([DynStat.Spe(-2),DynStat.Lib(1),DynStat.Sens(1),DynStat.Lust(4)].length) == 8)
            {
               KGAMECLASS.kGAMECLASS.player.dynStats([DynStat.Spe(-2),DynStat.Lib(1),DynStat.Sens(1),DynStat.Lust(4)][0],[DynStat.Spe(-2),DynStat.Lib(1),DynStat.Sens(1),DynStat.Lust(4)][1],[DynStat.Spe(-2),DynStat.Lib(1),DynStat.Sens(1),DynStat.Lust(4)][2],[DynStat.Spe(-2),DynStat.Lib(1),DynStat.Sens(1),DynStat.Lust(4)][3],[DynStat.Spe(-2),DynStat.Lib(1),DynStat.Sens(1),DynStat.Lust(4)][4],[DynStat.Spe(-2),DynStat.Lib(1),DynStat.Sens(1),DynStat.Lust(4)][5],[DynStat.Spe(-2),DynStat.Lib(1),DynStat.Sens(1),DynStat.Lust(4)][6],[DynStat.Spe(-2),DynStat.Lib(1),DynStat.Sens(1),DynStat.Lust(4)][7]);
            }
            else if(int([DynStat.Spe(-2),DynStat.Lib(1),DynStat.Sens(1),DynStat.Lust(4)].length) == 9)
            {
               KGAMECLASS.kGAMECLASS.player.dynStats([DynStat.Spe(-2),DynStat.Lib(1),DynStat.Sens(1),DynStat.Lust(4)][0],[DynStat.Spe(-2),DynStat.Lib(1),DynStat.Sens(1),DynStat.Lust(4)][1],[DynStat.Spe(-2),DynStat.Lib(1),DynStat.Sens(1),DynStat.Lust(4)][2],[DynStat.Spe(-2),DynStat.Lib(1),DynStat.Sens(1),DynStat.Lust(4)][3],[DynStat.Spe(-2),DynStat.Lib(1),DynStat.Sens(1),DynStat.Lust(4)][4],[DynStat.Spe(-2),DynStat.Lib(1),DynStat.Sens(1),DynStat.Lust(4)][5],[DynStat.Spe(-2),DynStat.Lib(1),DynStat.Sens(1),DynStat.Lust(4)][6],[DynStat.Spe(-2),DynStat.Lib(1),DynStat.Sens(1),DynStat.Lust(4)][7],[DynStat.Spe(-2),DynStat.Lib(1),DynStat.Sens(1),DynStat.Lust(4)][8]);
            }
            else if(int([DynStat.Spe(-2),DynStat.Lib(1),DynStat.Sens(1),DynStat.Lust(4)].length) == 10)
            {
               KGAMECLASS.kGAMECLASS.player.dynStats([DynStat.Spe(-2),DynStat.Lib(1),DynStat.Sens(1),DynStat.Lust(4)][0],[DynStat.Spe(-2),DynStat.Lib(1),DynStat.Sens(1),DynStat.Lust(4)][1],[DynStat.Spe(-2),DynStat.Lib(1),DynStat.Sens(1),DynStat.Lust(4)][2],[DynStat.Spe(-2),DynStat.Lib(1),DynStat.Sens(1),DynStat.Lust(4)][3],[DynStat.Spe(-2),DynStat.Lib(1),DynStat.Sens(1),DynStat.Lust(4)][4],[DynStat.Spe(-2),DynStat.Lib(1),DynStat.Sens(1),DynStat.Lust(4)][5],[DynStat.Spe(-2),DynStat.Lib(1),DynStat.Sens(1),DynStat.Lust(4)][6],[DynStat.Spe(-2),DynStat.Lib(1),DynStat.Sens(1),DynStat.Lust(4)][7],[DynStat.Spe(-2),DynStat.Lib(1),DynStat.Sens(1),DynStat.Lust(4)][8],[DynStat.Spe(-2),DynStat.Lib(1),DynStat.Sens(1),DynStat.Lust(4)][9]);
            }
            else if(int([DynStat.Spe(-2),DynStat.Lib(1),DynStat.Sens(1),DynStat.Lust(4)].length) == 11)
            {
               KGAMECLASS.kGAMECLASS.player.dynStats([DynStat.Spe(-2),DynStat.Lib(1),DynStat.Sens(1),DynStat.Lust(4)][0],[DynStat.Spe(-2),DynStat.Lib(1),DynStat.Sens(1),DynStat.Lust(4)][1],[DynStat.Spe(-2),DynStat.Lib(1),DynStat.Sens(1),DynStat.Lust(4)][2],[DynStat.Spe(-2),DynStat.Lib(1),DynStat.Sens(1),DynStat.Lust(4)][3],[DynStat.Spe(-2),DynStat.Lib(1),DynStat.Sens(1),DynStat.Lust(4)][4],[DynStat.Spe(-2),DynStat.Lib(1),DynStat.Sens(1),DynStat.Lust(4)][5],[DynStat.Spe(-2),DynStat.Lib(1),DynStat.Sens(1),DynStat.Lust(4)][6],[DynStat.Spe(-2),DynStat.Lib(1),DynStat.Sens(1),DynStat.Lust(4)][7],[DynStat.Spe(-2),DynStat.Lib(1),DynStat.Sens(1),DynStat.Lust(4)][8],[DynStat.Spe(-2),DynStat.Lib(1),DynStat.Sens(1),DynStat.Lust(4)][9],[DynStat.Spe(-2),DynStat.Lib(1),DynStat.Sens(1),DynStat.Lust(4)][10]);
            }
            else if(int([DynStat.Spe(-2),DynStat.Lib(1),DynStat.Sens(1),DynStat.Lust(4)].length) == 12)
            {
               KGAMECLASS.kGAMECLASS.player.dynStats([DynStat.Spe(-2),DynStat.Lib(1),DynStat.Sens(1),DynStat.Lust(4)][0],[DynStat.Spe(-2),DynStat.Lib(1),DynStat.Sens(1),DynStat.Lust(4)][1],[DynStat.Spe(-2),DynStat.Lib(1),DynStat.Sens(1),DynStat.Lust(4)][2],[DynStat.Spe(-2),DynStat.Lib(1),DynStat.Sens(1),DynStat.Lust(4)][3],[DynStat.Spe(-2),DynStat.Lib(1),DynStat.Sens(1),DynStat.Lust(4)][4],[DynStat.Spe(-2),DynStat.Lib(1),DynStat.Sens(1),DynStat.Lust(4)][5],[DynStat.Spe(-2),DynStat.Lib(1),DynStat.Sens(1),DynStat.Lust(4)][6],[DynStat.Spe(-2),DynStat.Lib(1),DynStat.Sens(1),DynStat.Lust(4)][7],[DynStat.Spe(-2),DynStat.Lib(1),DynStat.Sens(1),DynStat.Lust(4)][8],[DynStat.Spe(-2),DynStat.Lib(1),DynStat.Sens(1),DynStat.Lust(4)][9],[DynStat.Spe(-2),DynStat.Lib(1),DynStat.Sens(1),DynStat.Lust(4)][10],[DynStat.Spe(-2),DynStat.Lib(1),DynStat.Sens(1),DynStat.Lust(4)][11]);
            }
            else if(int([DynStat.Spe(-2),DynStat.Lib(1),DynStat.Sens(1),DynStat.Lust(4)].length) == 13)
            {
               KGAMECLASS.kGAMECLASS.player.dynStats([DynStat.Spe(-2),DynStat.Lib(1),DynStat.Sens(1),DynStat.Lust(4)][0],[DynStat.Spe(-2),DynStat.Lib(1),DynStat.Sens(1),DynStat.Lust(4)][1],[DynStat.Spe(-2),DynStat.Lib(1),DynStat.Sens(1),DynStat.Lust(4)][2],[DynStat.Spe(-2),DynStat.Lib(1),DynStat.Sens(1),DynStat.Lust(4)][3],[DynStat.Spe(-2),DynStat.Lib(1),DynStat.Sens(1),DynStat.Lust(4)][4],[DynStat.Spe(-2),DynStat.Lib(1),DynStat.Sens(1),DynStat.Lust(4)][5],[DynStat.Spe(-2),DynStat.Lib(1),DynStat.Sens(1),DynStat.Lust(4)][6],[DynStat.Spe(-2),DynStat.Lib(1),DynStat.Sens(1),DynStat.Lust(4)][7],[DynStat.Spe(-2),DynStat.Lib(1),DynStat.Sens(1),DynStat.Lust(4)][8],[DynStat.Spe(-2),DynStat.Lib(1),DynStat.Sens(1),DynStat.Lust(4)][9],[DynStat.Spe(-2),DynStat.Lib(1),DynStat.Sens(1),DynStat.Lust(4)][10],[DynStat.Spe(-2),DynStat.Lib(1),DynStat.Sens(1),DynStat.Lust(4)][11],[DynStat.Spe(-2),DynStat.Lib(1),DynStat.Sens(1),DynStat.Lust(4)][12]);
            }
            else if(int([DynStat.Spe(-2),DynStat.Lib(1),DynStat.Sens(1),DynStat.Lust(4)].length) == 14)
            {
               KGAMECLASS.kGAMECLASS.player.dynStats([DynStat.Spe(-2),DynStat.Lib(1),DynStat.Sens(1),DynStat.Lust(4)][0],[DynStat.Spe(-2),DynStat.Lib(1),DynStat.Sens(1),DynStat.Lust(4)][1],[DynStat.Spe(-2),DynStat.Lib(1),DynStat.Sens(1),DynStat.Lust(4)][2],[DynStat.Spe(-2),DynStat.Lib(1),DynStat.Sens(1),DynStat.Lust(4)][3],[DynStat.Spe(-2),DynStat.Lib(1),DynStat.Sens(1),DynStat.Lust(4)][4],[DynStat.Spe(-2),DynStat.Lib(1),DynStat.Sens(1),DynStat.Lust(4)][5],[DynStat.Spe(-2),DynStat.Lib(1),DynStat.Sens(1),DynStat.Lust(4)][6],[DynStat.Spe(-2),DynStat.Lib(1),DynStat.Sens(1),DynStat.Lust(4)][7],[DynStat.Spe(-2),DynStat.Lib(1),DynStat.Sens(1),DynStat.Lust(4)][8],[DynStat.Spe(-2),DynStat.Lib(1),DynStat.Sens(1),DynStat.Lust(4)][9],[DynStat.Spe(-2),DynStat.Lib(1),DynStat.Sens(1),DynStat.Lust(4)][10],[DynStat.Spe(-2),DynStat.Lib(1),DynStat.Sens(1),DynStat.Lust(4)][11],[DynStat.Spe(-2),DynStat.Lib(1),DynStat.Sens(1),DynStat.Lust(4)][12],[DynStat.Spe(-2),DynStat.Lib(1),DynStat.Sens(1),DynStat.Lust(4)][13]);
            }
            else if(int([DynStat.Spe(-2),DynStat.Lib(1),DynStat.Sens(1),DynStat.Lust(4)].length) == 15)
            {
               KGAMECLASS.kGAMECLASS.player.dynStats([DynStat.Spe(-2),DynStat.Lib(1),DynStat.Sens(1),DynStat.Lust(4)][0],[DynStat.Spe(-2),DynStat.Lib(1),DynStat.Sens(1),DynStat.Lust(4)][1],[DynStat.Spe(-2),DynStat.Lib(1),DynStat.Sens(1),DynStat.Lust(4)][2],[DynStat.Spe(-2),DynStat.Lib(1),DynStat.Sens(1),DynStat.Lust(4)][3],[DynStat.Spe(-2),DynStat.Lib(1),DynStat.Sens(1),DynStat.Lust(4)][4],[DynStat.Spe(-2),DynStat.Lib(1),DynStat.Sens(1),DynStat.Lust(4)][5],[DynStat.Spe(-2),DynStat.Lib(1),DynStat.Sens(1),DynStat.Lust(4)][6],[DynStat.Spe(-2),DynStat.Lib(1),DynStat.Sens(1),DynStat.Lust(4)][7],[DynStat.Spe(-2),DynStat.Lib(1),DynStat.Sens(1),DynStat.Lust(4)][8],[DynStat.Spe(-2),DynStat.Lib(1),DynStat.Sens(1),DynStat.Lust(4)][9],[DynStat.Spe(-2),DynStat.Lib(1),DynStat.Sens(1),DynStat.Lust(4)][10],[DynStat.Spe(-2),DynStat.Lib(1),DynStat.Sens(1),DynStat.Lust(4)][11],[DynStat.Spe(-2),DynStat.Lib(1),DynStat.Sens(1),DynStat.Lust(4)][12],[DynStat.Spe(-2),DynStat.Lib(1),DynStat.Sens(1),DynStat.Lust(4)][13],[DynStat
               .Spe(-2),DynStat.Lib(1),DynStat.Sens(1),DynStat.Lust(4)][14]);
            }
            else if(int([DynStat.Spe(-2),DynStat.Lib(1),DynStat.Sens(1),DynStat.Lust(4)].length) == 16)
            {
               KGAMECLASS.kGAMECLASS.player.dynStats([DynStat.Spe(-2),DynStat.Lib(1),DynStat.Sens(1),DynStat.Lust(4)][0],[DynStat.Spe(-2),DynStat.Lib(1),DynStat.Sens(1),DynStat.Lust(4)][1],[DynStat.Spe(-2),DynStat.Lib(1),DynStat.Sens(1),DynStat.Lust(4)][2],[DynStat.Spe(-2),DynStat.Lib(1),DynStat.Sens(1),DynStat.Lust(4)][3],[DynStat.Spe(-2),DynStat.Lib(1),DynStat.Sens(1),DynStat.Lust(4)][4],[DynStat.Spe(-2),DynStat.Lib(1),DynStat.Sens(1),DynStat.Lust(4)][5],[DynStat.Spe(-2),DynStat.Lib(1),DynStat.Sens(1),DynStat.Lust(4)][6],[DynStat.Spe(-2),DynStat.Lib(1),DynStat.Sens(1),DynStat.Lust(4)][7],[DynStat.Spe(-2),DynStat.Lib(1),DynStat.Sens(1),DynStat.Lust(4)][8],[DynStat.Spe(-2),DynStat.Lib(1),DynStat.Sens(1),DynStat.Lust(4)][9],[DynStat.Spe(-2),DynStat.Lib(1),DynStat.Sens(1),DynStat.Lust(4)][10],[DynStat.Spe(-2),DynStat.Lib(1),DynStat.Sens(1),DynStat.Lust(4)][11],[DynStat.Spe(-2),DynStat.Lib(1),DynStat.Sens(1),DynStat.Lust(4)][12],[DynStat.Spe(-2),DynStat.Lib(1),DynStat.Sens(1),DynStat.Lust(4)][13],[DynStat
               .Spe(-2),DynStat.Lib(1),DynStat.Sens(1),DynStat.Lust(4)][14],[DynStat.Spe(-2),DynStat.Lib(1),DynStat.Sens(1),DynStat.Lust(4)][15]);
            }
            else if(int([DynStat.Spe(-2),DynStat.Lib(1),DynStat.Sens(1),DynStat.Lust(4)].length) == 17)
            {
               KGAMECLASS.kGAMECLASS.player.dynStats([DynStat.Spe(-2),DynStat.Lib(1),DynStat.Sens(1),DynStat.Lust(4)][0],[DynStat.Spe(-2),DynStat.Lib(1),DynStat.Sens(1),DynStat.Lust(4)][1],[DynStat.Spe(-2),DynStat.Lib(1),DynStat.Sens(1),DynStat.Lust(4)][2],[DynStat.Spe(-2),DynStat.Lib(1),DynStat.Sens(1),DynStat.Lust(4)][3],[DynStat.Spe(-2),DynStat.Lib(1),DynStat.Sens(1),DynStat.Lust(4)][4],[DynStat.Spe(-2),DynStat.Lib(1),DynStat.Sens(1),DynStat.Lust(4)][5],[DynStat.Spe(-2),DynStat.Lib(1),DynStat.Sens(1),DynStat.Lust(4)][6],[DynStat.Spe(-2),DynStat.Lib(1),DynStat.Sens(1),DynStat.Lust(4)][7],[DynStat.Spe(-2),DynStat.Lib(1),DynStat.Sens(1),DynStat.Lust(4)][8],[DynStat.Spe(-2),DynStat.Lib(1),DynStat.Sens(1),DynStat.Lust(4)][9],[DynStat.Spe(-2),DynStat.Lib(1),DynStat.Sens(1),DynStat.Lust(4)][10],[DynStat.Spe(-2),DynStat.Lib(1),DynStat.Sens(1),DynStat.Lust(4)][11],[DynStat.Spe(-2),DynStat.Lib(1),DynStat.Sens(1),DynStat.Lust(4)][12],[DynStat.Spe(-2),DynStat.Lib(1),DynStat.Sens(1),DynStat.Lust(4)][13],[DynStat
               .Spe(-2),DynStat.Lib(1),DynStat.Sens(1),DynStat.Lust(4)][14],[DynStat.Spe(-2),DynStat.Lib(1),DynStat.Sens(1),DynStat.Lust(4)][15],[DynStat.Spe(-2),DynStat.Lib(1),DynStat.Sens(1),DynStat.Lust(4)][16]);
            }
            else if(int([DynStat.Spe(-2),DynStat.Lib(1),DynStat.Sens(1),DynStat.Lust(4)].length) == 18)
            {
               KGAMECLASS.kGAMECLASS.player.dynStats([DynStat.Spe(-2),DynStat.Lib(1),DynStat.Sens(1),DynStat.Lust(4)][0],[DynStat.Spe(-2),DynStat.Lib(1),DynStat.Sens(1),DynStat.Lust(4)][1],[DynStat.Spe(-2),DynStat.Lib(1),DynStat.Sens(1),DynStat.Lust(4)][2],[DynStat.Spe(-2),DynStat.Lib(1),DynStat.Sens(1),DynStat.Lust(4)][3],[DynStat.Spe(-2),DynStat.Lib(1),DynStat.Sens(1),DynStat.Lust(4)][4],[DynStat.Spe(-2),DynStat.Lib(1),DynStat.Sens(1),DynStat.Lust(4)][5],[DynStat.Spe(-2),DynStat.Lib(1),DynStat.Sens(1),DynStat.Lust(4)][6],[DynStat.Spe(-2),DynStat.Lib(1),DynStat.Sens(1),DynStat.Lust(4)][7],[DynStat.Spe(-2),DynStat.Lib(1),DynStat.Sens(1),DynStat.Lust(4)][8],[DynStat.Spe(-2),DynStat.Lib(1),DynStat.Sens(1),DynStat.Lust(4)][9],[DynStat.Spe(-2),DynStat.Lib(1),DynStat.Sens(1),DynStat.Lust(4)][10],[DynStat.Spe(-2),DynStat.Lib(1),DynStat.Sens(1),DynStat.Lust(4)][11],[DynStat.Spe(-2),DynStat.Lib(1),DynStat.Sens(1),DynStat.Lust(4)][12],[DynStat.Spe(-2),DynStat.Lib(1),DynStat.Sens(1),DynStat.Lust(4)][13],[DynStat
               .Spe(-2),DynStat.Lib(1),DynStat.Sens(1),DynStat.Lust(4)][14],[DynStat.Spe(-2),DynStat.Lib(1),DynStat.Sens(1),DynStat.Lust(4)][15],[DynStat.Spe(-2),DynStat.Lib(1),DynStat.Sens(1),DynStat.Lust(4)][16],[DynStat.Spe(-2),DynStat.Lib(1),DynStat.Sens(1),DynStat.Lust(4)][17]);
            }
            else if(int([DynStat.Spe(-2),DynStat.Lib(1),DynStat.Sens(1),DynStat.Lust(4)].length) == 19)
            {
               KGAMECLASS.kGAMECLASS.player.dynStats([DynStat.Spe(-2),DynStat.Lib(1),DynStat.Sens(1),DynStat.Lust(4)][0],[DynStat.Spe(-2),DynStat.Lib(1),DynStat.Sens(1),DynStat.Lust(4)][1],[DynStat.Spe(-2),DynStat.Lib(1),DynStat.Sens(1),DynStat.Lust(4)][2],[DynStat.Spe(-2),DynStat.Lib(1),DynStat.Sens(1),DynStat.Lust(4)][3],[DynStat.Spe(-2),DynStat.Lib(1),DynStat.Sens(1),DynStat.Lust(4)][4],[DynStat.Spe(-2),DynStat.Lib(1),DynStat.Sens(1),DynStat.Lust(4)][5],[DynStat.Spe(-2),DynStat.Lib(1),DynStat.Sens(1),DynStat.Lust(4)][6],[DynStat.Spe(-2),DynStat.Lib(1),DynStat.Sens(1),DynStat.Lust(4)][7],[DynStat.Spe(-2),DynStat.Lib(1),DynStat.Sens(1),DynStat.Lust(4)][8],[DynStat.Spe(-2),DynStat.Lib(1),DynStat.Sens(1),DynStat.Lust(4)][9],[DynStat.Spe(-2),DynStat.Lib(1),DynStat.Sens(1),DynStat.Lust(4)][10],[DynStat.Spe(-2),DynStat.Lib(1),DynStat.Sens(1),DynStat.Lust(4)][11],[DynStat.Spe(-2),DynStat.Lib(1),DynStat.Sens(1),DynStat.Lust(4)][12],[DynStat.Spe(-2),DynStat.Lib(1),DynStat.Sens(1),DynStat.Lust(4)][13],[DynStat
               .Spe(-2),DynStat.Lib(1),DynStat.Sens(1),DynStat.Lust(4)][14],[DynStat.Spe(-2),DynStat.Lib(1),DynStat.Sens(1),DynStat.Lust(4)][15],[DynStat.Spe(-2),DynStat.Lib(1),DynStat.Sens(1),DynStat.Lust(4)][16],[DynStat.Spe(-2),DynStat.Lib(1),DynStat.Sens(1),DynStat.Lust(4)][17],[DynStat.Spe(-2),DynStat.Lib(1),DynStat.Sens(1),DynStat.Lust(4)][18]);
            }
            else
            {
               if(int([DynStat.Spe(-2),DynStat.Lib(1),DynStat.Sens(1),DynStat.Lust(4)].length) != 20)
               {
                  throw "Too many rest arguments";
               }
               KGAMECLASS.kGAMECLASS.player.dynStats([DynStat.Spe(-2),DynStat.Lib(1),DynStat.Sens(1),DynStat.Lust(4)][0],[DynStat.Spe(-2),DynStat.Lib(1),DynStat.Sens(1),DynStat.Lust(4)][1],[DynStat.Spe(-2),DynStat.Lib(1),DynStat.Sens(1),DynStat.Lust(4)][2],[DynStat.Spe(-2),DynStat.Lib(1),DynStat.Sens(1),DynStat.Lust(4)][3],[DynStat.Spe(-2),DynStat.Lib(1),DynStat.Sens(1),DynStat.Lust(4)][4],[DynStat.Spe(-2),DynStat.Lib(1),DynStat.Sens(1),DynStat.Lust(4)][5],[DynStat.Spe(-2),DynStat.Lib(1),DynStat.Sens(1),DynStat.Lust(4)][6],[DynStat.Spe(-2),DynStat.Lib(1),DynStat.Sens(1),DynStat.Lust(4)][7],[DynStat.Spe(-2),DynStat.Lib(1),DynStat.Sens(1),DynStat.Lust(4)][8],[DynStat.Spe(-2),DynStat.Lib(1),DynStat.Sens(1),DynStat.Lust(4)][9],[DynStat.Spe(-2),DynStat.Lib(1),DynStat.Sens(1),DynStat.Lust(4)][10],[DynStat.Spe(-2),DynStat.Lib(1),DynStat.Sens(1),DynStat.Lust(4)][11],[DynStat.Spe(-2),DynStat.Lib(1),DynStat.Sens(1),DynStat.Lust(4)][12],[DynStat.Spe(-2),DynStat.Lib(1),DynStat.Sens(1),DynStat.Lust(4)][13],[DynStat
               .Spe(-2),DynStat.Lib(1),DynStat.Sens(1),DynStat.Lust(4)][14],[DynStat.Spe(-2),DynStat.Lib(1),DynStat.Sens(1),DynStat.Lust(4)][15],[DynStat.Spe(-2),DynStat.Lib(1),DynStat.Sens(1),DynStat.Lust(4)][16],[DynStat.Spe(-2),DynStat.Lib(1),DynStat.Sens(1),DynStat.Lust(4)][17],[DynStat.Spe(-2),DynStat.Lib(1),DynStat.Sens(1),DynStat.Lust(4)][18],[DynStat.Spe(-2),DynStat.Lib(1),DynStat.Sens(1),DynStat.Lust(4)][19]);
            }
            _loc2_ = true;
         }
         if(_loc1_.get_pregnancyIncubation() == 32 || _loc1_.get_pregnancyIncubation() == 64 || _loc1_.get_pregnancyIncubation() == 85 || _loc1_.get_pregnancyIncubation() == 150)
         {
            if(_loc1_.biggestTitSize() >= 3 && _loc1_.mostBreastsPerRow() > 1 && _loc1_.biggestLactation() >= 1 && _loc1_.biggestLactation() < 2)
            {
               output.text("你的乳房因为积聚了多余的乳汁而感到肿胀。你想知道它们准备喂养什么样的生物。[pg]");
               _loc1_.boostLactation(0.5);
            }
            if(_loc1_.biggestTitSize() >= 3 && _loc1_.mostBreastsPerRow() > 1 && _loc1_.biggestLactation() > 0 && _loc1_.biggestLactation() < 1)
            {
               output.text("随着你的身体为即将到来的分娩做准备，几滴母乳从你的乳头溢出。[pg]");
               _loc1_.boostLactation(0.5);
            }
            if(_loc1_.biggestTitSize() >= 3 && _loc1_.mostBreastsPerRow() > 1 && _loc1_.biggestLactation() == 0)
            {
               output.text("<b>你意识到你的乳房感觉很饱满，偶尔还会分泌乳汁</b>。这一定是怀孕引起的。[pg]");
               _loc1_.boostLactation(1);
            }
            if(_loc1_.biggestTitSize() == 2 && _loc1_.mostBreastsPerRow() > 1)
            {
               output.text("<b>你的乳房已经肿胀到了C罩杯，</b>这是为了迎接即将到来的怀孕。[pg]");
               _loc1_.growTits(1,1,false,3);
            }
            if(_loc1_.biggestTitSize() == 1 && _loc1_.mostBreastsPerRow() > 1)
            {
               output.text("<b>你的乳房已经长到了B罩杯，</b>这可能是由于怀孕引起的荷尔蒙变化。[pg]");
               _loc1_.growTits(1,1,false,3);
            }
         }
         return _loc2_;
      }
   }
}

