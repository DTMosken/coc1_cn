package classes.scenes.monsters.pregnancies
{
   import classes.DynStat;
   import classes.Player;
   import classes.StatusEffects;
   import classes.globalFlags.KGAMECLASS;
   import classes.internals.GuiOutput;
   import classes.internals.PregnancyUtils;
   import classes.items.Mutations;
   import classes.scenes.AnalPregnancy;
   import classes.scenes.PregnancyProgression;
   import classes.scenes.VaginalPregnancy;
   import flash.Boot;
   
   public class PlayerBunnyPregnancy implements AnalPregnancy, VaginalPregnancy
   {
      
      public var output:GuiOutput;
      
      public var mutations:Mutations;
      
      public function PlayerBunnyPregnancy(param1:GuiOutput = undefined, param2:Mutations = undefined)
      {
         if(Boot.skip_constructor)
         {
            return;
         }
         output = param1;
         mutations = param2;
         PregnancyProgression.registerVaginalPregnancyScene(25,9,this);
         PregnancyProgression.registerAnalPregnancyScene(25,9,this);
      }
      
      public function vaginalBirth() : void
      {
         var _loc1_:Player = KGAMECLASS.kGAMECLASS.player;
         KGAMECLASS.kGAMECLASS.images.showImage("birth-bunny");
         PregnancyUtils.createVaginaIfMissing(output,_loc1_);
         output.text("你的子宫传来一阵危险的轰鸣，这预示着终于到了卸货的时候。你的" + _loc1_.legs() + "摇晃不稳，随着羊水破裂后不断喷涌而出的液体，你的力气也在一点点流失，直到你瘫倒在你的" + _loc1_.buttDescript() + "上，痛苦地呻吟着。起初进展缓慢——只有几次轻微的宫缩，感觉更多的是奇怪，它们在你的" + _loc1_.vaginaDescript(0) + "中荡漾，喷出更多怀孕的体液。很快节奏就加快了，你感觉到有什么东西开始把你撑得越来越大。[pg]");
         output.text("你本能地用力推挤，驱使着你甚至不知道自己拥有的肌肉，以加快你进入的超人般的分娩过程。");
         if(_loc1_.vaginalCapacity() < 60)
         {
            output.text("当你的子宫颈开始被撑大时，感觉有点痛");
         }
         else
         {
            output.text("当你的子宫颈被撑大时，感觉其实还挺舒服的");
         }
         output.text("，但不知为何，你的身体适应了这种强制扩张，并没有感到太多的不适。很快，当你感觉到你的" + _loc1_.vaginaDescript(0) + "被撑成一个大球，包裹着你孩子那非人的形态，它在你体内蠕动挣扎着，寻找自由的道路时，这种不适就被抛到了脑后。你咕哝着，用力收缩肌肉，难以置信地看着一个长着兔耳的小小身影从你湿滑的产道滑落到草地上，这个过程让你的" + _loc1_.chestDesc() + "因意想不到的快感而剧烈起伏。[pg]");
         output.text("整个过程又重新开始了——还有一个！现在，你被充分撑开的小穴正渗出羊水和你自己的润滑液，第二个兔娘孩子轻松地滑落下来，撞到了它的兄弟姐妹。你颤抖着，呻吟着，痉挛着，几乎要因为这种刺激而高潮，但最后你只剩下喘息和发情。这两只兔娘看起来就像" + (KGAMECLASS.kGAMECLASS.get_noFur() ? "普通的人类婴儿" : "迷你人类") + "，除了它们的" + (KGAMECLASS.kGAMECLASS.get_noFur() ? "毛茸茸的耳朵和尾巴" : "耳朵、尾巴和毛茸茸的腿") + "。你的孩子们把自己舔干净，然后跳到你的" + _loc1_.chestDesc() + "上，吸吮了一会儿你的乳头");
         if(_loc1_.lactationQ() > 500)
         {
            output.text("，喝足了奶水变得胖乎乎的");
         }
         output.text("。最后它们吃饱了，在最后一次依偎之后，你奇怪的兔娘孩子们蹦蹦跳跳地离开了，毫无疑问是去寻找更多它们的同类了。[pg]");
         output.text("你陷入了宁静的昏迷中，惊叹于你的" + _loc1_.vaginaDescript(0) + "现在感觉有多么的有弹性和敏感。");
         _loc1_.cuntChange(60,true,true,false);
         _loc1_.boostLactation(0.01);
         if(_loc1_.vaginalCapacity() < 300)
         {
            if(!_loc1_.hasStatusEffect(StatusEffects.BonusVCapacity))
            {
               _loc1_.createStatusEffect(StatusEffects.BonusVCapacity,0,0,0,0);
            }
            _loc1_.addStatusValue(StatusEffects.BonusVCapacity,1,10);
         }
         _loc1_.orgasm("Vaginal");
         if(int([DynStat.Lib(1),DynStat.Sens(10),DynStat.Cor(-2)].length) == 0)
         {
            KGAMECLASS.kGAMECLASS.player.dynStats();
         }
         else if(int([DynStat.Lib(1),DynStat.Sens(10),DynStat.Cor(-2)].length) == 1)
         {
            KGAMECLASS.kGAMECLASS.player.dynStats([DynStat.Lib(1),DynStat.Sens(10),DynStat.Cor(-2)][0]);
         }
         else if(int([DynStat.Lib(1),DynStat.Sens(10),DynStat.Cor(-2)].length) == 2)
         {
            KGAMECLASS.kGAMECLASS.player.dynStats([DynStat.Lib(1),DynStat.Sens(10),DynStat.Cor(-2)][0],[DynStat.Lib(1),DynStat.Sens(10),DynStat.Cor(-2)][1]);
         }
         else if(int([DynStat.Lib(1),DynStat.Sens(10),DynStat.Cor(-2)].length) == 3)
         {
            KGAMECLASS.kGAMECLASS.player.dynStats([DynStat.Lib(1),DynStat.Sens(10),DynStat.Cor(-2)][0],[DynStat.Lib(1),DynStat.Sens(10),DynStat.Cor(-2)][1],[DynStat.Lib(1),DynStat.Sens(10),DynStat.Cor(-2)][2]);
         }
         else if(int([DynStat.Lib(1),DynStat.Sens(10),DynStat.Cor(-2)].length) == 4)
         {
            KGAMECLASS.kGAMECLASS.player.dynStats([DynStat.Lib(1),DynStat.Sens(10),DynStat.Cor(-2)][0],[DynStat.Lib(1),DynStat.Sens(10),DynStat.Cor(-2)][1],[DynStat.Lib(1),DynStat.Sens(10),DynStat.Cor(-2)][2],[DynStat.Lib(1),DynStat.Sens(10),DynStat.Cor(-2)][3]);
         }
         else if(int([DynStat.Lib(1),DynStat.Sens(10),DynStat.Cor(-2)].length) == 5)
         {
            KGAMECLASS.kGAMECLASS.player.dynStats([DynStat.Lib(1),DynStat.Sens(10),DynStat.Cor(-2)][0],[DynStat.Lib(1),DynStat.Sens(10),DynStat.Cor(-2)][1],[DynStat.Lib(1),DynStat.Sens(10),DynStat.Cor(-2)][2],[DynStat.Lib(1),DynStat.Sens(10),DynStat.Cor(-2)][3],[DynStat.Lib(1),DynStat.Sens(10),DynStat.Cor(-2)][4]);
         }
         else if(int([DynStat.Lib(1),DynStat.Sens(10),DynStat.Cor(-2)].length) == 6)
         {
            KGAMECLASS.kGAMECLASS.player.dynStats([DynStat.Lib(1),DynStat.Sens(10),DynStat.Cor(-2)][0],[DynStat.Lib(1),DynStat.Sens(10),DynStat.Cor(-2)][1],[DynStat.Lib(1),DynStat.Sens(10),DynStat.Cor(-2)][2],[DynStat.Lib(1),DynStat.Sens(10),DynStat.Cor(-2)][3],[DynStat.Lib(1),DynStat.Sens(10),DynStat.Cor(-2)][4],[DynStat.Lib(1),DynStat.Sens(10),DynStat.Cor(-2)][5]);
         }
         else if(int([DynStat.Lib(1),DynStat.Sens(10),DynStat.Cor(-2)].length) == 7)
         {
            KGAMECLASS.kGAMECLASS.player.dynStats([DynStat.Lib(1),DynStat.Sens(10),DynStat.Cor(-2)][0],[DynStat.Lib(1),DynStat.Sens(10),DynStat.Cor(-2)][1],[DynStat.Lib(1),DynStat.Sens(10),DynStat.Cor(-2)][2],[DynStat.Lib(1),DynStat.Sens(10),DynStat.Cor(-2)][3],[DynStat.Lib(1),DynStat.Sens(10),DynStat.Cor(-2)][4],[DynStat.Lib(1),DynStat.Sens(10),DynStat.Cor(-2)][5],[DynStat.Lib(1),DynStat.Sens(10),DynStat.Cor(-2)][6]);
         }
         else if(int([DynStat.Lib(1),DynStat.Sens(10),DynStat.Cor(-2)].length) == 8)
         {
            KGAMECLASS.kGAMECLASS.player.dynStats([DynStat.Lib(1),DynStat.Sens(10),DynStat.Cor(-2)][0],[DynStat.Lib(1),DynStat.Sens(10),DynStat.Cor(-2)][1],[DynStat.Lib(1),DynStat.Sens(10),DynStat.Cor(-2)][2],[DynStat.Lib(1),DynStat.Sens(10),DynStat.Cor(-2)][3],[DynStat.Lib(1),DynStat.Sens(10),DynStat.Cor(-2)][4],[DynStat.Lib(1),DynStat.Sens(10),DynStat.Cor(-2)][5],[DynStat.Lib(1),DynStat.Sens(10),DynStat.Cor(-2)][6],[DynStat.Lib(1),DynStat.Sens(10),DynStat.Cor(-2)][7]);
         }
         else if(int([DynStat.Lib(1),DynStat.Sens(10),DynStat.Cor(-2)].length) == 9)
         {
            KGAMECLASS.kGAMECLASS.player.dynStats([DynStat.Lib(1),DynStat.Sens(10),DynStat.Cor(-2)][0],[DynStat.Lib(1),DynStat.Sens(10),DynStat.Cor(-2)][1],[DynStat.Lib(1),DynStat.Sens(10),DynStat.Cor(-2)][2],[DynStat.Lib(1),DynStat.Sens(10),DynStat.Cor(-2)][3],[DynStat.Lib(1),DynStat.Sens(10),DynStat.Cor(-2)][4],[DynStat.Lib(1),DynStat.Sens(10),DynStat.Cor(-2)][5],[DynStat.Lib(1),DynStat.Sens(10),DynStat.Cor(-2)][6],[DynStat.Lib(1),DynStat.Sens(10),DynStat.Cor(-2)][7],[DynStat.Lib(1),DynStat.Sens(10),DynStat.Cor(-2)][8]);
         }
         else if(int([DynStat.Lib(1),DynStat.Sens(10),DynStat.Cor(-2)].length) == 10)
         {
            KGAMECLASS.kGAMECLASS.player.dynStats([DynStat.Lib(1),DynStat.Sens(10),DynStat.Cor(-2)][0],[DynStat.Lib(1),DynStat.Sens(10),DynStat.Cor(-2)][1],[DynStat.Lib(1),DynStat.Sens(10),DynStat.Cor(-2)][2],[DynStat.Lib(1),DynStat.Sens(10),DynStat.Cor(-2)][3],[DynStat.Lib(1),DynStat.Sens(10),DynStat.Cor(-2)][4],[DynStat.Lib(1),DynStat.Sens(10),DynStat.Cor(-2)][5],[DynStat.Lib(1),DynStat.Sens(10),DynStat.Cor(-2)][6],[DynStat.Lib(1),DynStat.Sens(10),DynStat.Cor(-2)][7],[DynStat.Lib(1),DynStat.Sens(10),DynStat.Cor(-2)][8],[DynStat.Lib(1),DynStat.Sens(10),DynStat.Cor(-2)][9]);
         }
         else if(int([DynStat.Lib(1),DynStat.Sens(10),DynStat.Cor(-2)].length) == 11)
         {
            KGAMECLASS.kGAMECLASS.player.dynStats([DynStat.Lib(1),DynStat.Sens(10),DynStat.Cor(-2)][0],[DynStat.Lib(1),DynStat.Sens(10),DynStat.Cor(-2)][1],[DynStat.Lib(1),DynStat.Sens(10),DynStat.Cor(-2)][2],[DynStat.Lib(1),DynStat.Sens(10),DynStat.Cor(-2)][3],[DynStat.Lib(1),DynStat.Sens(10),DynStat.Cor(-2)][4],[DynStat.Lib(1),DynStat.Sens(10),DynStat.Cor(-2)][5],[DynStat.Lib(1),DynStat.Sens(10),DynStat.Cor(-2)][6],[DynStat.Lib(1),DynStat.Sens(10),DynStat.Cor(-2)][7],[DynStat.Lib(1),DynStat.Sens(10),DynStat.Cor(-2)][8],[DynStat.Lib(1),DynStat.Sens(10),DynStat.Cor(-2)][9],[DynStat.Lib(1),DynStat.Sens(10),DynStat.Cor(-2)][10]);
         }
         else if(int([DynStat.Lib(1),DynStat.Sens(10),DynStat.Cor(-2)].length) == 12)
         {
            KGAMECLASS.kGAMECLASS.player.dynStats([DynStat.Lib(1),DynStat.Sens(10),DynStat.Cor(-2)][0],[DynStat.Lib(1),DynStat.Sens(10),DynStat.Cor(-2)][1],[DynStat.Lib(1),DynStat.Sens(10),DynStat.Cor(-2)][2],[DynStat.Lib(1),DynStat.Sens(10),DynStat.Cor(-2)][3],[DynStat.Lib(1),DynStat.Sens(10),DynStat.Cor(-2)][4],[DynStat.Lib(1),DynStat.Sens(10),DynStat.Cor(-2)][5],[DynStat.Lib(1),DynStat.Sens(10),DynStat.Cor(-2)][6],[DynStat.Lib(1),DynStat.Sens(10),DynStat.Cor(-2)][7],[DynStat.Lib(1),DynStat.Sens(10),DynStat.Cor(-2)][8],[DynStat.Lib(1),DynStat.Sens(10),DynStat.Cor(-2)][9],[DynStat.Lib(1),DynStat.Sens(10),DynStat.Cor(-2)][10],[DynStat.Lib(1),DynStat.Sens(10),DynStat.Cor(-2)][11]);
         }
         else if(int([DynStat.Lib(1),DynStat.Sens(10),DynStat.Cor(-2)].length) == 13)
         {
            KGAMECLASS.kGAMECLASS.player.dynStats([DynStat.Lib(1),DynStat.Sens(10),DynStat.Cor(-2)][0],[DynStat.Lib(1),DynStat.Sens(10),DynStat.Cor(-2)][1],[DynStat.Lib(1),DynStat.Sens(10),DynStat.Cor(-2)][2],[DynStat.Lib(1),DynStat.Sens(10),DynStat.Cor(-2)][3],[DynStat.Lib(1),DynStat.Sens(10),DynStat.Cor(-2)][4],[DynStat.Lib(1),DynStat.Sens(10),DynStat.Cor(-2)][5],[DynStat.Lib(1),DynStat.Sens(10),DynStat.Cor(-2)][6],[DynStat.Lib(1),DynStat.Sens(10),DynStat.Cor(-2)][7],[DynStat.Lib(1),DynStat.Sens(10),DynStat.Cor(-2)][8],[DynStat.Lib(1),DynStat.Sens(10),DynStat.Cor(-2)][9],[DynStat.Lib(1),DynStat.Sens(10),DynStat.Cor(-2)][10],[DynStat.Lib(1),DynStat.Sens(10),DynStat.Cor(-2)][11],[DynStat.Lib(1),DynStat.Sens(10),DynStat.Cor(-2)][12]);
         }
         else if(int([DynStat.Lib(1),DynStat.Sens(10),DynStat.Cor(-2)].length) == 14)
         {
            KGAMECLASS.kGAMECLASS.player.dynStats([DynStat.Lib(1),DynStat.Sens(10),DynStat.Cor(-2)][0],[DynStat.Lib(1),DynStat.Sens(10),DynStat.Cor(-2)][1],[DynStat.Lib(1),DynStat.Sens(10),DynStat.Cor(-2)][2],[DynStat.Lib(1),DynStat.Sens(10),DynStat.Cor(-2)][3],[DynStat.Lib(1),DynStat.Sens(10),DynStat.Cor(-2)][4],[DynStat.Lib(1),DynStat.Sens(10),DynStat.Cor(-2)][5],[DynStat.Lib(1),DynStat.Sens(10),DynStat.Cor(-2)][6],[DynStat.Lib(1),DynStat.Sens(10),DynStat.Cor(-2)][7],[DynStat.Lib(1),DynStat.Sens(10),DynStat.Cor(-2)][8],[DynStat.Lib(1),DynStat.Sens(10),DynStat.Cor(-2)][9],[DynStat.Lib(1),DynStat.Sens(10),DynStat.Cor(-2)][10],[DynStat.Lib(1),DynStat.Sens(10),DynStat.Cor(-2)][11],[DynStat.Lib(1),DynStat.Sens(10),DynStat.Cor(-2)][12],[DynStat.Lib(1),DynStat.Sens(10),DynStat.Cor(-2)][13]);
         }
         else if(int([DynStat.Lib(1),DynStat.Sens(10),DynStat.Cor(-2)].length) == 15)
         {
            KGAMECLASS.kGAMECLASS.player.dynStats([DynStat.Lib(1),DynStat.Sens(10),DynStat.Cor(-2)][0],[DynStat.Lib(1),DynStat.Sens(10),DynStat.Cor(-2)][1],[DynStat.Lib(1),DynStat.Sens(10),DynStat.Cor(-2)][2],[DynStat.Lib(1),DynStat.Sens(10),DynStat.Cor(-2)][3],[DynStat.Lib(1),DynStat.Sens(10),DynStat.Cor(-2)][4],[DynStat.Lib(1),DynStat.Sens(10),DynStat.Cor(-2)][5],[DynStat.Lib(1),DynStat.Sens(10),DynStat.Cor(-2)][6],[DynStat.Lib(1),DynStat.Sens(10),DynStat.Cor(-2)][7],[DynStat.Lib(1),DynStat.Sens(10),DynStat.Cor(-2)][8],[DynStat.Lib(1),DynStat.Sens(10),DynStat.Cor(-2)][9],[DynStat.Lib(1),DynStat.Sens(10),DynStat.Cor(-2)][10],[DynStat.Lib(1),DynStat.Sens(10),DynStat.Cor(-2)][11],[DynStat.Lib(1),DynStat.Sens(10),DynStat.Cor(-2)][12],[DynStat.Lib(1),DynStat.Sens(10),DynStat.Cor(-2)][13],[DynStat.Lib(1),DynStat.Sens(10),DynStat.Cor(-2)][14]);
         }
         else if(int([DynStat.Lib(1),DynStat.Sens(10),DynStat.Cor(-2)].length) == 16)
         {
            KGAMECLASS.kGAMECLASS.player.dynStats([DynStat.Lib(1),DynStat.Sens(10),DynStat.Cor(-2)][0],[DynStat.Lib(1),DynStat.Sens(10),DynStat.Cor(-2)][1],[DynStat.Lib(1),DynStat.Sens(10),DynStat.Cor(-2)][2],[DynStat.Lib(1),DynStat.Sens(10),DynStat.Cor(-2)][3],[DynStat.Lib(1),DynStat.Sens(10),DynStat.Cor(-2)][4],[DynStat.Lib(1),DynStat.Sens(10),DynStat.Cor(-2)][5],[DynStat.Lib(1),DynStat.Sens(10),DynStat.Cor(-2)][6],[DynStat.Lib(1),DynStat.Sens(10),DynStat.Cor(-2)][7],[DynStat.Lib(1),DynStat.Sens(10),DynStat.Cor(-2)][8],[DynStat.Lib(1),DynStat.Sens(10),DynStat.Cor(-2)][9],[DynStat.Lib(1),DynStat.Sens(10),DynStat.Cor(-2)][10],[DynStat.Lib(1),DynStat.Sens(10),DynStat.Cor(-2)][11],[DynStat.Lib(1),DynStat.Sens(10),DynStat.Cor(-2)][12],[DynStat.Lib(1),DynStat.Sens(10),DynStat.Cor(-2)][13],[DynStat.Lib(1),DynStat.Sens(10),DynStat.Cor(-2)][14],[DynStat.Lib(1),DynStat.Sens(10),DynStat.Cor(-2)][15]);
         }
         else if(int([DynStat.Lib(1),DynStat.Sens(10),DynStat.Cor(-2)].length) == 17)
         {
            KGAMECLASS.kGAMECLASS.player.dynStats([DynStat.Lib(1),DynStat.Sens(10),DynStat.Cor(-2)][0],[DynStat.Lib(1),DynStat.Sens(10),DynStat.Cor(-2)][1],[DynStat.Lib(1),DynStat.Sens(10),DynStat.Cor(-2)][2],[DynStat.Lib(1),DynStat.Sens(10),DynStat.Cor(-2)][3],[DynStat.Lib(1),DynStat.Sens(10),DynStat.Cor(-2)][4],[DynStat.Lib(1),DynStat.Sens(10),DynStat.Cor(-2)][5],[DynStat.Lib(1),DynStat.Sens(10),DynStat.Cor(-2)][6],[DynStat.Lib(1),DynStat.Sens(10),DynStat.Cor(-2)][7],[DynStat.Lib(1),DynStat.Sens(10),DynStat.Cor(-2)][8],[DynStat.Lib(1),DynStat.Sens(10),DynStat.Cor(-2)][9],[DynStat.Lib(1),DynStat.Sens(10),DynStat.Cor(-2)][10],[DynStat.Lib(1),DynStat.Sens(10),DynStat.Cor(-2)][11],[DynStat.Lib(1),DynStat.Sens(10),DynStat.Cor(-2)][12],[DynStat.Lib(1),DynStat.Sens(10),DynStat.Cor(-2)][13],[DynStat.Lib(1),DynStat.Sens(10),DynStat.Cor(-2)][14],[DynStat.Lib(1),DynStat.Sens(10),DynStat.Cor(-2)][15],[DynStat.Lib(1),DynStat.Sens(10),DynStat.Cor(-2)][16]);
         }
         else if(int([DynStat.Lib(1),DynStat.Sens(10),DynStat.Cor(-2)].length) == 18)
         {
            KGAMECLASS.kGAMECLASS.player.dynStats([DynStat.Lib(1),DynStat.Sens(10),DynStat.Cor(-2)][0],[DynStat.Lib(1),DynStat.Sens(10),DynStat.Cor(-2)][1],[DynStat.Lib(1),DynStat.Sens(10),DynStat.Cor(-2)][2],[DynStat.Lib(1),DynStat.Sens(10),DynStat.Cor(-2)][3],[DynStat.Lib(1),DynStat.Sens(10),DynStat.Cor(-2)][4],[DynStat.Lib(1),DynStat.Sens(10),DynStat.Cor(-2)][5],[DynStat.Lib(1),DynStat.Sens(10),DynStat.Cor(-2)][6],[DynStat.Lib(1),DynStat.Sens(10),DynStat.Cor(-2)][7],[DynStat.Lib(1),DynStat.Sens(10),DynStat.Cor(-2)][8],[DynStat.Lib(1),DynStat.Sens(10),DynStat.Cor(-2)][9],[DynStat.Lib(1),DynStat.Sens(10),DynStat.Cor(-2)][10],[DynStat.Lib(1),DynStat.Sens(10),DynStat.Cor(-2)][11],[DynStat.Lib(1),DynStat.Sens(10),DynStat.Cor(-2)][12],[DynStat.Lib(1),DynStat.Sens(10),DynStat.Cor(-2)][13],[DynStat.Lib(1),DynStat.Sens(10),DynStat.Cor(-2)][14],[DynStat.Lib(1),DynStat.Sens(10),DynStat.Cor(-2)][15],[DynStat.Lib(1),DynStat.Sens(10),DynStat.Cor(-2)][16],[DynStat.Lib(1),DynStat.Sens(10),DynStat.Cor(-2)][17]);
         }
         else if(int([DynStat.Lib(1),DynStat.Sens(10),DynStat.Cor(-2)].length) == 19)
         {
            KGAMECLASS.kGAMECLASS.player.dynStats([DynStat.Lib(1),DynStat.Sens(10),DynStat.Cor(-2)][0],[DynStat.Lib(1),DynStat.Sens(10),DynStat.Cor(-2)][1],[DynStat.Lib(1),DynStat.Sens(10),DynStat.Cor(-2)][2],[DynStat.Lib(1),DynStat.Sens(10),DynStat.Cor(-2)][3],[DynStat.Lib(1),DynStat.Sens(10),DynStat.Cor(-2)][4],[DynStat.Lib(1),DynStat.Sens(10),DynStat.Cor(-2)][5],[DynStat.Lib(1),DynStat.Sens(10),DynStat.Cor(-2)][6],[DynStat.Lib(1),DynStat.Sens(10),DynStat.Cor(-2)][7],[DynStat.Lib(1),DynStat.Sens(10),DynStat.Cor(-2)][8],[DynStat.Lib(1),DynStat.Sens(10),DynStat.Cor(-2)][9],[DynStat.Lib(1),DynStat.Sens(10),DynStat.Cor(-2)][10],[DynStat.Lib(1),DynStat.Sens(10),DynStat.Cor(-2)][11],[DynStat.Lib(1),DynStat.Sens(10),DynStat.Cor(-2)][12],[DynStat.Lib(1),DynStat.Sens(10),DynStat.Cor(-2)][13],[DynStat.Lib(1),DynStat.Sens(10),DynStat.Cor(-2)][14],[DynStat.Lib(1),DynStat.Sens(10),DynStat.Cor(-2)][15],[DynStat.Lib(1),DynStat.Sens(10),DynStat.Cor(-2)][16],[DynStat.Lib(1),DynStat.Sens(10),DynStat.Cor(-2)][17],[DynStat
            .Lib(1),DynStat.Sens(10),DynStat.Cor(-2)][18]);
         }
         else
         {
            if(int([DynStat.Lib(1),DynStat.Sens(10),DynStat.Cor(-2)].length) != 20)
            {
               throw "Too many rest arguments";
            }
            KGAMECLASS.kGAMECLASS.player.dynStats([DynStat.Lib(1),DynStat.Sens(10),DynStat.Cor(-2)][0],[DynStat.Lib(1),DynStat.Sens(10),DynStat.Cor(-2)][1],[DynStat.Lib(1),DynStat.Sens(10),DynStat.Cor(-2)][2],[DynStat.Lib(1),DynStat.Sens(10),DynStat.Cor(-2)][3],[DynStat.Lib(1),DynStat.Sens(10),DynStat.Cor(-2)][4],[DynStat.Lib(1),DynStat.Sens(10),DynStat.Cor(-2)][5],[DynStat.Lib(1),DynStat.Sens(10),DynStat.Cor(-2)][6],[DynStat.Lib(1),DynStat.Sens(10),DynStat.Cor(-2)][7],[DynStat.Lib(1),DynStat.Sens(10),DynStat.Cor(-2)][8],[DynStat.Lib(1),DynStat.Sens(10),DynStat.Cor(-2)][9],[DynStat.Lib(1),DynStat.Sens(10),DynStat.Cor(-2)][10],[DynStat.Lib(1),DynStat.Sens(10),DynStat.Cor(-2)][11],[DynStat.Lib(1),DynStat.Sens(10),DynStat.Cor(-2)][12],[DynStat.Lib(1),DynStat.Sens(10),DynStat.Cor(-2)][13],[DynStat.Lib(1),DynStat.Sens(10),DynStat.Cor(-2)][14],[DynStat.Lib(1),DynStat.Sens(10),DynStat.Cor(-2)][15],[DynStat.Lib(1),DynStat.Sens(10),DynStat.Cor(-2)][16],[DynStat.Lib(1),DynStat.Sens(10),DynStat.Cor(-2)][17],[DynStat
            .Lib(1),DynStat.Sens(10),DynStat.Cor(-2)][18],[DynStat.Lib(1),DynStat.Sens(10),DynStat.Cor(-2)][19]);
         }
      }
      
      public function updateVaginalPregnancy() : Boolean
      {
         var _loc1_:Player = KGAMECLASS.kGAMECLASS.player;
         var _loc2_:Boolean = false;
         if(_loc1_.get_pregnancyIncubation() == 800)
         {
            output.text("你的子宫发出奇怪的咕噜声。[pg]");
            _loc2_ = true;
         }
         if(_loc1_.get_pregnancyIncubation() == 785)
         {
            KGAMECLASS.kGAMECLASS.consumables.NPNKEGG.applyEffect(_loc1_,true);
            output.text("[pg]");
            _loc2_ = true;
         }
         if(_loc1_.get_pregnancyIncubation() == 776)
         {
            output.text("你的子宫感觉饱满且胀大。[pg]");
            _loc2_ = true;
         }
         if(_loc1_.get_pregnancyIncubation() == 765)
         {
            KGAMECLASS.kGAMECLASS.consumables.NPNKEGG.applyEffect(_loc1_,true);
            output.text("[pg]");
            _loc2_ = true;
         }
         if(_loc1_.get_pregnancyIncubation() <= 745 && _loc1_.get_pregnancyIncubation() > 400)
         {
            output.text("<b>在忍受了过去一天左右的不适和身体变化后，你终于感觉到子宫里的卵已经溶解了。</b>[pg]");
            _loc2_ = true;
            _loc1_.knockUpForce();
         }
         if(_loc1_.get_pregnancyIncubation() == 198)
         {
            output.text("<b>你发现自己的肚子稍微变大了一些。也许那个兔娘说的是真的。</b>[pg]");
            _loc2_ = true;
         }
         if(_loc1_.get_pregnancyIncubation() == 178)
         {
            output.text("<b>你的肚子明显隆起得更厉害了。你大概是怀孕了。</b>[pg]");
            _loc2_ = true;
         }
         if(_loc1_.get_pregnancyIncubation() == 156)
         {
            output.text("<b>你肚子上那明显的怀孕隆起已经清晰可见。");
            if(_loc1_.cor < 40)
            {
               output.text("你对这意外的怀孕感到苦恼，却又无法将这东西从体内逼出来。</b>");
            }
            if(_loc1_.cor >= 40 && _loc1_.cor < 75)
            {
               output.text("你发现自己开始好奇生下兔娘会是什么感觉。</b>");
            }
            if(_loc1_.cor >= 75)
            {
               output.text("你梦幻般地想象着，是否能找到一只愿意一次在你体内产下两枚以上卵的兔子。</b>");
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
         if(_loc1_.get_pregnancyIncubation() == 140)
         {
            output.text("<b>子宫内突然传来的一阵踢动让你吓了一跳，紧接着另一侧又传来了一次。</b>[pg]");
            _loc2_ = true;
         }
         if(_loc1_.get_pregnancyIncubation() == 120)
         {
            output.text("<b>你不断变大的肚子让周围的人都能明显看出你怀孕了。</b>[pg]");
            _loc2_ = true;
         }
         if(_loc1_.get_pregnancyIncubation() == 72)
         {
            output.text("<b>你的肚子胀得发痛，");
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
               output.text("你迫不及待地想要分娩，这样你就能再次怀孕了。</b>");
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
            output.text("[bstart]你抚摸着自己隆起的肚子，沉浸在做母亲的感觉中。");
            if(_loc1_.cor < 40)
            {
               output.text("之后你对自己感到有些厌恶。[bend][pg]");
            }
            if(_loc1_.cor >= 40 && _loc1_.cor < 75)
            {
               output.text("你估计自己会在接下来的几天内分娩。[bend][pg]");
            }
            if(_loc1_.cor >= 75)
            {
               output.text("你发现自己总在幻想不断地生下小兔子，每次都被你那些精力旺盛的青春期孩子们重新注入几十枚卵。[bend][pg]");
            }
            _loc2_ = true;
         }
         return _loc2_;
      }
      
      public function updateAnalPregnancy() : Boolean
      {
         var _loc1_:Player = KGAMECLASS.kGAMECLASS.player;
         var _loc2_:Boolean = false;
         if(_loc1_.get_buttPregnancyIncubation() == 800)
         {
            output.text("你的肠胃发出奇怪的咕噜声。[pg]");
            _loc2_ = true;
         }
         if(_loc1_.get_buttPregnancyIncubation() == 785)
         {
            KGAMECLASS.kGAMECLASS.consumables.NPNKEGG.applyEffect(_loc1_,true);
            output.text("[pg]");
            _loc2_ = true;
         }
         if(_loc1_.get_buttPregnancyIncubation() == 776)
         {
            output.text("你的肠胃感觉又胀又满。[pg]");
            _loc2_ = true;
         }
         if(_loc1_.get_buttPregnancyIncubation() == 765)
         {
            KGAMECLASS.kGAMECLASS.consumables.NPNKEGG.applyEffect(_loc1_,true);
            output.text("[pg]");
            _loc2_ = true;
         }
         if(_loc1_.get_buttPregnancyIncubation() == 745)
         {
            output.text("<b>在过去的一天左右处理了不适和身体变化之后，你终于感觉到你屁股里的卵已经溶解了。</b>[pg]");
            _loc2_ = true;
            _loc1_.buttKnockUpForce();
         }
         return _loc2_;
      }
      
      public function analBirth() : void
      {
      }
   }
}

