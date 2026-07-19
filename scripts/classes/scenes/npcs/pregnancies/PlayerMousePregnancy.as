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
   import classes.internals.Utils;
   import classes.scenes.PregnancyProgression;
   import classes.scenes.VaginalPregnancy;
   import flash.Boot;
   
   public class PlayerMousePregnancy implements VaginalPregnancy
   {
      
      public var output:GuiOutput;
      
      public function PlayerMousePregnancy(param1:GuiOutput = undefined)
      {
         if(Boot.skip_constructor)
         {
            return;
         }
         output = param1;
         PregnancyProgression.registerVaginalPregnancyScene(25,4,this);
         PregnancyProgression.registerVaginalPregnancyScene(25,29,this);
      }
      
      public function vaginalBirth() : void
      {
         var _loc1_:Player = KGAMECLASS.kGAMECLASS.player;
         _loc1_.boostLactation(0.01);
         output.text("你突然被肠胃中强烈的疼痛和压迫感惊醒。你猛地睁开眼睛，低头看到自己的肚子异常饱满和肿胀。你能感觉到皮肤下的动静，看着它在许多地方被顶起，以令人不安的方式翻滚和蠕动。你从体内感受到的感觉同样令人不安。你数了数，不止一个，而是有许多小东西在你体内游走。数量太多了，你根本数不清。[pg]");
         PregnancyUtils.createVaginaIfMissing(output,_loc1_);
         if(_loc1_.get_pregnancyType() == 29 && FlagDict_Impl_.arrayReadInt(KFLAGS.flags,2311) < 0)
         {
            KGAMECLASS.kGAMECLASS.jojoScene.giveBirthToPureJojoBabies();
         }
         else
         {
            output.text("当它们用力撑开你的子宫颈时，一阵剧痛传遍全身。你抓紧地面，大口喘息着用力，分娩的阵痛将你淹没。你感觉到你的骨盆被沿着产道向下移动的生物群强行撑宽。你张开双腿，仰起头发出痛苦的呻吟和惨叫，白色的小身影开始从你饱受蹂躏的小穴中钻出。无辜的大眼睛，甚至更大的耳朵，可爱的小" + (KGAMECLASS.kGAMECLASS.get_noFur() ? "faces" : "muzzles") + "，细长的粉色尾巴，都随着这些身影的出现而显现。每一个可能都不超过六英寸高，但它们看起来就像已经发育完全的孩子一样活跃和好奇。");
            output.text("[pg]两只出来了，然后是四只，八只……你数不清了。它们蜂拥在你的身上，争抢着爬上你的胸膛，轮流吮吸你的乳头。乳汁对它们的身体大有裨益，让它们迅速生长，性别特征也变得明显：女孩们长出了可爱的小乳房，臀部变得更宽；男孩们则发育出了小老鼠鸡巴，睾丸也肿胀起来。每只长到两英尺高时就会停止吮吸，当最后一只离开你酸痛、受虐的小穴并喝饱了你的奶水后，它们感激地蹭了蹭你，然后跑向森林，留下你独自恢复。");
         }
         if(_loc1_.averageLactation() > 0 && _loc1_.averageLactation() < 5)
         {
            output.text("[pg]你的[chest]似乎无法停止滴落乳汁，泌乳量比以前更大了。");
            _loc1_.boostLactation(0.5);
         }
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
         if(_loc1_.butt.rating < 14 && Utils.rand(2) == 0)
         {
            if(_loc1_.butt.rating < 10)
            {
               _temp_2.rating += 1;
               output.text("[pg]你注意到在经历了这场磨难后，你的" + _loc1_.buttDescript() + "感觉变得更大更丰满了。");
            }
            else if(_loc1_.butt.rating < 14 && Utils.rand(2) == 0)
            {
               _temp_3.rating += 1;
               output.text("[pg]你注意到在经历了这场磨难后，你的" + _loc1_.buttDescript() + "感觉变得更大更丰满了。");
            }
         }
         output.text("[pg]");
      }
      
      public function updateVaginalPregnancy() : Boolean
      {
         var _loc1_:Player = KGAMECLASS.kGAMECLASS.player;
         var _loc2_:Boolean = false;
         if(_loc1_.get_pregnancyIncubation() == 336)
         {
            output.text("<b>你发现自己的肚子稍微变大了一些。也许你需要少吃点那些奇怪的食物了。</b>[pg]");
            _loc2_ = true;
         }
         if(_loc1_.get_pregnancyIncubation() == 280)
         {
            output.text("<b>你的肚子明显隆起，并且里面还在蠕动。你可能怀孕了。</b>[pg]");
            _loc2_ = true;
         }
         if(_loc1_.get_pregnancyIncubation() == 216)
         {
            output.text("<b>你肚子上那明显的怀孕隆起已经清晰可见。它感觉越来越沉重。");
            if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,2311) > 0)
            {
               if(_loc1_.cor < 40)
               {
                  output.text("你对这意外的怀孕感到苦恼，也为自己无法将这东西逼出体外而感到无助。</b>");
               }
               if(_loc1_.cor >= 40 && _loc1_.cor < 75)
               {
                  output.text("考虑到和你做爱过的那些怪物的体型，你只希望它出来的时候不要太疼。</b>");
               }
               if(_loc1_.cor >= 75)
               {
                  output.text("你梦幻般地回味着最近操过你的那些巨大肉棒，并希望你的后代也能继承这样一件带来快感的工具。</b>");
               }
            }
            else
            {
               output.text("</b>");
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
            output.text("<b>你膨胀的子宫里突然传来一阵微小的踢动，吓了你一跳。片刻之后，它又动了一下，让你忍不住喘息。</b>[pg]");
            _loc2_ = true;
         }
         if(_loc1_.get_pregnancyIncubation() == 120)
         {
            output.text("<b>你不断变大的肚子让周围的人都能明显看出你怀孕了。它已经和家乡那些孕妇的肚子一样大了。</b>[pg]");
            _loc2_ = true;
         }
         if(_loc1_.get_pregnancyIncubation() == 72)
         {
            output.text("<b>你的肚子被里面蠕动的后代撑得痛苦地膨胀着，");
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
               output.text("你迫不及待地想要分娩，这样你就能再次被那些巨大的肉棒直接将它们堕落的精液射入你饥渴的子宫里，让你再次怀孕。</b>");
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
            output.text("[bstart]你用手抚摸着隆起的肚子，沉浸在做母亲的感觉中。无论你那被过度撑大的子宫里装的是什么，它似乎都很享受你的关注，停止了不断地蠕动。");
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
               output.text("你发现自己幻想着生下数百个小宝宝，然后慵懒地躺着，任由他们不停地吸吮你越来越敏感的乳房。[bend][pg]");
            }
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
               output.text("<b>你感觉你的乳房胀鼓鼓的，偶尔还会分泌乳汁</b>。这一定是因为怀孕了。[pg]");
               _loc1_.boostLactation(1);
            }
            if(_loc1_.biggestTitSize() == 2 && _loc1_.mostBreastsPerRow() > 1)
            {
               output.text("<b>你的乳房已经胀大到了C罩杯，</b>这是为了迎接即将到来的分娩。[pg]");
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

