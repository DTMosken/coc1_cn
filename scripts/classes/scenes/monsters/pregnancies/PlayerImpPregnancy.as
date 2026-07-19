package classes.scenes.monsters.pregnancies
{
   import classes.DynStat;
   import classes.Player;
   import classes.StatusEffects;
   import classes.Vagina;
   import classes.globalFlags.KGAMECLASS;
   import classes.internals.GuiOutput;
   import classes.internals.PregnancyUtils;
   import classes.internals.Utils;
   import classes.scenes.PregnancyProgression;
   import classes.scenes.VaginalPregnancy;
   import flash.Boot;
   
   public class PlayerImpPregnancy implements VaginalPregnancy
   {
      
      public var output:GuiOutput;
      
      public function PlayerImpPregnancy(param1:GuiOutput = undefined)
      {
         if(Boot.skip_constructor)
         {
            return;
         }
         output = param1;
         PregnancyProgression.registerVaginalPregnancyScene(25,1,this);
      }
      
      public function vaginalBirth() : void
      {
         var _loc1_:Player = KGAMECLASS.kGAMECLASS.player;
         KGAMECLASS.kGAMECLASS.images.showImage("birth-imp");
         if(_loc1_.hasStatusEffect(StatusEffects.BirthedImps))
         {
            _loc1_.addStatusValue(StatusEffects.BirthedImps,1,1);
         }
         else
         {
            _loc1_.createStatusEffect(StatusEffects.BirthedImps,1,0,0,0);
         }
         PregnancyUtils.createVaginaIfMissing(output,_loc1_);
         output.text("一股液体突然从你的阴道喷涌而出——你的羊水破了。你痛苦地闷哼着，感觉到肚子里有什么东西在蠕动扭曲，肌肉的收缩正迫使它向下移动。");
         if(_loc1_.cor < 50)
         {
            output.text("你无比后悔遇到那只可恨的小恶魔的那一天。");
         }
         output.text("随着分娩的继续，疼痛开始消退……取而代之的是一种不断累积的快感。随着宫缩的加剧，性唤起传遍全身，当你感觉到有什么东西通过时，你经历了一次小小的性高潮。[pg]然而，你感觉到体内还有更多，宫缩再次加剧，当排出了其他东西时，你再次被推向高潮。这重复了一次又一次，你分娩并高潮了近十几次。在经历了漫长的繁衍与快感之后，你感觉到折磨终于结束，随后便失去了意识，瘫倒在地。");
         if(_loc1_.vaginas[0].vaginalLooseness == 0)
         {
            _temp_1.vaginalLooseness += 1;
         }
         if(_loc1_.vaginas[0].vaginalLooseness < 4 && Utils.rand(2) == 0)
         {
            _temp_2.vaginalLooseness += 1;
            output.text("[pg]<b>你的小穴因为这场折磨被痛苦地撑开了，永久性地变大了。</b>");
         }
         output.text("[pg]当你醒来时，你发现了大量微小的小恶魔足迹……以及溅在你的衣服和身体上的精液。它们出生时一定已经完全成型了。");
         if(_loc1_.averageLactation() > 0 && _loc1_.averageLactation() < 5)
         {
            output.text(" 你的乳房似乎无法停止滴落乳汁，泌乳量比以前更大了。");
            _loc1_.boostLactation(0.5);
         }
         if(_loc1_.biggestTitSize() >= 3 && _loc1_.mostBreastsPerRow() > 1 && _loc1_.averageLactation() == 0)
         {
            output.text(" 当你思考这意味着什么时，<b>你意识到你的乳房一直在缓慢地分泌乳汁</b>。你想知道还要多久它们才会停止。");
            _loc1_.boostLactation(1);
         }
         _loc1_.boostLactation(0.01);
         if(_loc1_.biggestTitSize() == 2 && _loc1_.mostBreastsPerRow() > 1)
         {
            output.text(" <b>你的乳房长到了C罩杯！</b>");
            _loc1_.growTits(1,1,false,3);
         }
         if(_loc1_.biggestTitSize() == 1 && _loc1_.mostBreastsPerRow() > 1)
         {
            output.text(" <b>你的乳房长到了B罩杯！</b>");
            _loc1_.growTits(1,1,false,3);
         }
         if(_loc1_.vaginas[0].vaginalWetness == 0)
         {
            _temp_3.vaginalWetness += 1;
         }
         _loc1_.orgasm("Vaginal");
         _loc1_.dynStats(DynStat.Tou(-2),DynStat.Spe(2),DynStat.Lib(1),DynStat.Sens(0.5),DynStat.Cor(7));
         if(_loc1_.butt.rating < 10 && Utils.rand(2) == 0)
         {
            _temp_4.rating += 1;
            output.text("[pg]你注意到你的" + _loc1_.buttDescript() + "在这场折磨后感觉更大了，也更丰满了。");
         }
         else if(_loc1_.hips.rating < 10)
         {
            _temp_5.rating += 1;
            output.text("[pg]分娩之后，你的" + Utils.cnName(_loc1_.get_armorName()) + "在你的" + _loc1_.hipDescript() + "上显得更紧绷了一些。");
         }
         output.text("[pg]");
      }
      
      public function updateVaginalPregnancy() : Boolean
      {
         var _loc1_:Player = KGAMECLASS.kGAMECLASS.player;
         var _loc2_:Boolean = false;
         if(_loc1_.get_pregnancyIncubation() == 336)
         {
            output.text("<b>你发现自己的肚子变大了一点。也许你需要少吃点那些奇怪的食物了。</b>[pg]");
            _loc2_ = true;
         }
         if(_loc1_.get_pregnancyIncubation() == 280)
         {
            output.text("<b>你的肚子明显隆起。你可能怀孕了。</b>[pg]");
            _loc2_ = true;
         }
         if(_loc1_.get_pregnancyIncubation() == 216)
         {
            output.text("<b>你的肚子上出现了明显的孕肚。");
            if(_loc1_.cor < 40)
            {
               output.text("你对这意外的怀孕感到苦恼，却又无法将这东西从体内弄出来。</b>");
            }
            if(_loc1_.cor >= 40 && _loc1_.cor < 75)
            {
               output.text("考虑到和你做爱过的那些生物的尺寸，你只希望它生出来的时候不会太疼。</b>");
            }
            if(_loc1_.cor >= 75)
            {
               output.text("你满怀憧憬地回味着最近操过你的那些巨大肉棒，希望你的后代也能继承这样一件极乐工具。</b>");
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
            output.text("<b>子宫里突如其来的一记胎动吓了你一跳。</b>[pg]");
            _loc2_ = true;
         }
         if(_loc1_.get_pregnancyIncubation() == 120)
         {
            output.text("<b>你日益变大的肚子让周围的人都能明显看出你怀孕了。</b>[pg]");
            _loc2_ = true;
         }
         if(_loc1_.get_pregnancyIncubation() == 72)
         {
            output.text("<b>你的肚子胀得发痛， ");
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
               output.text("你迫不及待地想要分娩，这样你就能再次被腐化或怪物的精液灌满你那饥渴的子宫，再次怀孕。</b>");
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
            output.text("[bstart]你抚摸着高高隆起的肚子，沉浸在初为人母的感觉中。");
            if(_loc1_.cor < 40)
            {
               output.text("回过神来，你对自己感到有些厌恶。[bend][pg]");
            }
            if(_loc1_.cor >= 40 && _loc1_.cor < 75)
            {
               output.text("你估计自己这几天就要生了。[bend][pg]");
            }
            if(_loc1_.cor >= 75)
            {
               output.text("你发现自己幻想着不断生下恶魔，每次生完又被你那群性欲旺盛的青春期孩子们再次弄大肚子。[bend][pg]");
            }
            _loc2_ = true;
         }
         return _loc2_;
      }
   }
}

