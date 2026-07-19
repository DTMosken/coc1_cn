package classes.scenes.monsters.pregnancies
{
   import classes.DynStat;
   import classes.Player;
   import classes.Vagina;
   import classes._FlagDict.FlagDict_Impl_;
   import classes.globalFlags.KFLAGS;
   import classes.globalFlags.KGAMECLASS;
   import classes.internals.GuiOutput;
   import classes.internals.PregnancyUtils;
   import classes.internals.Utils;
   import classes.scenes.PregnancyProgression;
   import classes.scenes.VaginalPregnancy;
   import flash.Boot;
   import haxe.IMap;
   
   public class PlayerMinotaurPregnancy implements VaginalPregnancy
   {
      
      public var output:GuiOutput;
      
      public function PlayerMinotaurPregnancy(param1:GuiOutput = undefined)
      {
         if(Boot.skip_constructor)
         {
            return;
         }
         output = param1;
         PregnancyProgression.registerVaginalPregnancyScene(25,2,this);
      }
      
      public function vaginalBirth() : void
      {
         var _loc1_:Player = KGAMECLASS.kGAMECLASS.player;
         KGAMECLASS.kGAMECLASS.images.showImage("birth-minotaur");
         PregnancyUtils.createVaginaIfMissing(output,_loc1_);
         _loc1_.boostLactation(0.01);
         output.text("你突然被肠道里强烈的疼痛和压力痛醒。你猛地睁开眼睛，低头看到你的肚子大得离谱，而且还在膨胀。你能感觉到皮肤下的动静，看着它凸起和移动，就像另一个生命体在你体内独立活动一样。本能地，当你感觉到那个生物向外挤压，撑开你的子宫颈时，你张开了双腿。[pg]你试图用阴道肌肉推挤，但你感觉到那个生物更多的是在自己移动。当一双长满黑毛的手抓住你的外阴并开始向外拉扯时，你的嘴唇微微张开。你痛苦地大叫，因为你的臀部被离开子宫的生物强行撑开。一张牛脸出现了，谢天谢地，没有角。接着是肩膀，新生儿身上的肌肉已经开始起伏。接着是厚实的桶状胸膛，狭窄的男性臀部，以及强壮的牛腿和蹄子。[pg]最后，最糟糕的时刻过去了，这个蹒跚学步大小的牛头人站了起来，显然已经能够站立和行走了。他在你的腿周围走来走去，走到你的上半身，抓住你肿胀的乳房之一。他用野兽般的嘴唇裹住你的乳头，开始吸吮，减轻了肿胀乳房的压力。[pg]");
         output.text("他吸啊吸啊吸，让你不禁想知道你到底装了多少奶，但就在你想的时候，你的眼睛睁大了，因为新生的牛头人开始生长。他一次长高几英寸，他的角开始从头骨上长出来，他的肌肉起伏变厚，他的肉棒变长，他的睾丸肿胀。他长到了四英尺高，但还在继续长，很快就到了五英尺高，开始越来越像生他的怪物。最后，他松开了你的乳房，在六英尺高的时候结束了由乳汁引发的生长突增，看起来几乎完全长大了。他为了表达被带到这个世界上的感激之情，在你的脸颊上舔了一口，然后转身向山里跑去，留下你从折磨中恢复过来。你很快就晕了过去。[pg]");
         if(_loc1_.averageLactation() > 0 && _loc1_.averageLactation() < 5)
         {
            output.text("你的乳房似乎无法停止滴奶，分泌的乳汁比以前更多了。");
            _loc1_.boostLactation(1);
         }
         _loc1_.cuntChange(120,true,true,false);
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
         if(_loc1_.butt.rating < 12 && Utils.rand(2) == 0)
         {
            _temp_2.rating += 1;
            output.text("[pg]你注意到在经历了这场折磨后，你的" + _loc1_.buttDescript() + "感觉变得更大更丰满了。");
         }
         else if(_loc1_.hips.rating < 15)
         {
            _temp_3.rating += 1;
            output.text("[pg]分娩之后，你的" + Utils.cnName(_loc1_.get_armorName()) + "在你的" + _loc1_.hipDescript() + "上显得更紧绷了一些。");
         }
         _loc1_.knockUpForce();
         output.text("[pg]");
         var _loc2_:IMap = KFLAGS.flags;
         FlagDict_Impl_.arrayWriteInt(_loc2_,327,FlagDict_Impl_.arrayReadInt(_loc2_,327) + 1);
         if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,328) == 0)
         {
            FlagDict_Impl_.arrayWriteInt(KFLAGS.flags,328,150);
         }
      }
      
      public function updateVaginalPregnancy() : Boolean
      {
         var _loc1_:Player = KGAMECLASS.kGAMECLASS.player;
         var _loc2_:Boolean = false;
         if(_loc1_.get_pregnancyIncubation() == 336)
         {
            output.text("<b>你意识到你的肚子变大了一点。也许你需要少吃点那些奇怪的食物了。</b>[pg]");
            _loc2_ = true;
         }
         if(_loc1_.get_pregnancyIncubation() == 280)
         {
            output.text("<b>你的肚子越来越明显地隆起，并且在蠕动。你可能怀孕了。</b>[pg]");
            _loc2_ = true;
         }
         if(_loc1_.get_pregnancyIncubation() == 216)
         {
            output.text("<b>你肚子上怀孕的隆起已经清晰可见。它感觉越来越沉重了。");
            if(_loc1_.cor < 40)
            {
               output.text("你为你这不想要的怀孕感到苦恼，也为你无法将这东西排出体外而感到无助。</b>");
            }
            if(_loc1_.cor >= 40 && _loc1_.cor < 75)
            {
               output.text("考虑到你操过的那些生物的体型，你希望它出来的时候不会太痛。</b>");
            }
            if(_loc1_.cor >= 75)
            {
               output.text("你梦幻般地回想着最近操过你的那些巨大的肉棒，并希望你的后代也能继承这样的极乐工具。</b>");
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
            output.text("[pg]");
            _loc2_ = true;
         }
         if(_loc1_.get_pregnancyIncubation() == 180)
         {
            output.text("<b>你那肿胀的子宫里突然传来一阵踢打，吓了你一跳。片刻之后，这种感觉再次袭来，让你倒吸一口凉气，踉跄了一下。不管你肚子里长的是什么，它都很强壮。</b>[pg]");
            _loc2_ = true;
         }
         if(_loc1_.get_pregnancyIncubation() == 120)
         {
            output.text("<b>你那不断变大的肚子让周围的人都能明显看出你怀孕了。它已经和家乡任何孕妇的肚子一样大了。</b>[pg]");
            _loc2_ = true;
         }
         if(_loc1_.get_pregnancyIncubation() == 72)
         {
            output.text("<b>你的肚子痛苦地膨胀着，被某种巨大野兽的后代撑得过分肿胀，");
            if(_loc1_.cor < 40)
            {
               output.text("让你行动困难。</b>");
            }
            if(_loc1_.cor >= 40 && _loc1_.cor < 75)
            {
               output.text("你想知道自己还要等多久。</b>");
            }
            if(_loc1_.cor >= 75)
            {
               output.text("你渴望分娩，这样你就能再次被那些巨大的肉棒受孕，让它们把堕落的种子直接射进你饥渴的子宫里。</b>");
            }
            output.text("[pg]");
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
            _loc2_ = true;
            output.text("[bstart]你抚摸着自己隆起的肚子，沉浸在母性的感觉中。不管你过度拉伸的子宫里孕育着什么野兽，它似乎很享受这种关注，停止了不断的蠕动。");
            if(_loc1_.cor < 40)
            {
               output.text("之后，你对自己感到有些厌恶。[bend][pg]");
            }
            if(_loc1_.cor >= 40 && _loc1_.cor < 75)
            {
               output.text("你估计自己会在接下来的几天内分娩。[bend][pg]");
            }
            if(_loc1_.cor >= 75)
            {
               output.text("你发现自己幻想着生下一只巨大的怪物，然后把它养大，让它一遍又一遍地操你湿润的小穴。[bend][pg]");
            }
         }
         if(_loc1_.get_pregnancyIncubation() == 32 || _loc1_.get_pregnancyIncubation() == 64 || _loc1_.get_pregnancyIncubation() == 85 || _loc1_.get_pregnancyIncubation() == 150)
         {
            _loc2_ = true;
            if(_loc1_.biggestTitSize() >= 3 && _loc1_.mostBreastsPerRow() > 1 && _loc1_.biggestLactation() >= 1 && _loc1_.biggestLactation() < 2)
            {
               output.text("你的乳房因为积聚了多余的乳汁而感到肿胀。你想知道它们准备喂养什么样的生物。[pg]");
               _loc1_.boostLactation(0.5);
            }
            if(_loc1_.biggestTitSize() >= 3 && _loc1_.mostBreastsPerRow() > 1 && _loc1_.biggestLactation() > 0 && _loc1_.biggestLactation() < 1)
            {
               output.text("随着你的身体为即将到来的分娩做准备，乳汁从你的乳头滴落。[pg]");
               _loc1_.boostLactation(0.5);
            }
            if(_loc1_.biggestTitSize() >= 3 && _loc1_.mostBreastsPerRow() > 1 && _loc1_.biggestLactation() == 0)
            {
               output.text("<b>你意识到你的乳房感觉很饱满，偶尔还会分泌乳汁</b>。这一定是因为怀孕了。[pg]");
               _loc1_.boostLactation(1);
            }
            if(_loc1_.biggestTitSize() == 2 && _loc1_.mostBreastsPerRow() > 1)
            {
               output.text("<b>你的乳房已经肿胀到了C罩杯，</b>这是为了迎接即将到来的分娩。[pg]");
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

