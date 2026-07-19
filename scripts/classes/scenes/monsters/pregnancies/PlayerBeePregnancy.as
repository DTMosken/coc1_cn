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
   
   public class PlayerBeePregnancy implements AnalPregnancy
   {
      
      public var pregnancyProgression:PregnancyProgression;
      
      public var output:GuiOutput;
      
      public function PlayerBeePregnancy(param1:GuiOutput = undefined)
      {
         if(Boot.skip_constructor)
         {
            return;
         }
         output = param1;
         PregnancyProgression.registerAnalPregnancyScene(25,26,this);
      }
      
      public function updateAnalPregnancy() : Boolean
      {
         var _loc1_:Player = KGAMECLASS.kGAMECLASS.player;
         var _loc2_:Boolean = false;
         if(_loc1_.get_buttPregnancyIncubation() == 36)
         {
            output.text("<b>你感到腹胀，肠道时不时地翻腾，让你很不舒服。</b>[pg]");
            _loc2_ = true;
         }
         if(_loc1_.get_buttPregnancyIncubation() == 20)
         {
            output.text("<b>一种散发着蜂蜜香味的液体从你的直肠滴落。</b>起初这让你感到担忧，但随着香味弥漫在你周围的空气中，你意识到任何散发着如此美妙气味的东西都一定是好东西。");
            if(_loc1_.cockTotal() > 0)
            {
               output.text("这种香气似乎渗透了你的整个存在，慢慢地聚集在你的");
            }
            if(_loc1_.cockTotal() == 1)
            {
               output.text("[cock]里，每一次吸气都让它变得更粗、更硬、更坚挺。你大口大口地吸入空气，渴望得到更多，直到你的[cock]抽搐着滴下液体，[if (hasknot) {它的[knotword]膨胀到了极限，并且}]那[cockhead]肿胀发紫。");
            }
            if(_loc1_.cockTotal() > 1)
            {
               output.text("腹股沟。你每吸入一口那种物质，你的" + _loc1_.multiCockDescriptLight() + "就会充血变大。你大口大口地吸入被污染的空气，渴望得到更多，你的阴茎因需求而抽搐滴液。");
            }
            output.text("你微笑着，知道即使你想停下来，也无法停止自慰。[pg]");
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
         output.text("[pg]");
         KGAMECLASS.kGAMECLASS.images.showImage("birth-beegirl");
         output.text("突然，一股蜂蜜色的液体从你的屁股里涌出。在恐慌袭来之前，一种美妙的香味笼罩了你，让一切都变得美好起来。");
         if(_loc1_.cockTotal() > 0)
         {
            output.text("充满你大脑的迷糊感似乎向下渗透，让你的装备变得坚硬紧绷。");
         }
         if(int(_loc1_.vaginas.length) > 0)
         {
            output.text("你的" + _loc1_.vaginaDescript(0) + "变得充血且敏感。");
         }
         output.text("你的手猛地伸向那琥珀色的液体，舀起一把黏糊糊的东西。你不知道你的手在做什么，它把液体送到你的嘴边，你的嘴本能地张开了。当你吞下这甜甜的东西时，你厌恶地颤抖了一下，你的大脑短暂地想知道为什么要这么做。这东西似乎散发着温暖，当你舀起更多时，迅速将那些烦人的想法推开。[pg]");
         output.text("下面突然滑落的东西让你吃了一惊；一个白色的球体伴随着另一股喷出的蜂蜜从你的肛门里滑了出来。你被药物麻痹的大脑试图理解正在发生的事情，但它放弃了，你的双手只是漫不经心地在你的下体上涂抹着蜂蜜。片刻之后，下一个圆球弹了出来，迫使你发出一声惊愕的呻吟。那感觉真好。你开始幻想着产下更多的卵并自慰起来……是的，那就是卵。当第三个卵挤出来时，你几乎要高潮了。");
         if(_loc1_.averageLactation() >= 1 && _loc1_.biggestTitSize() > 2)
         {
            output.text("为了寻求更大的快感，你的双手捧起蜂蜜，将其揉捏进你的" + _loc1_.breastDescript(0) + "，慢慢地向上揉搓到你的乳头。在这样的刺激下，乳汁立刻涌了出来，让你的胸膛充满了温暖。");
         }
         output.text("每一枚卵似乎都紧接着前一枚产出，每一次你的意识都会丧失更多，除了自慰和在蜂蜜中打滚之外，什么也做不了。[pg]");
         output.text("过了一段时间，你的意识开始恢复，被一阵极其响亮的嗡嗡声唤醒……你坐起身，看到几十枚卵堆积在一滩粘稠的蜂蜜中。大部分卵已经空了，但还有几枚正涌出成百上千只蜜蜂，加入了你上方庞大的蜂群中。");
         if(_loc1_.cor < 35)
         {
            output.text("你感到一阵恶心，但很庆幸在这场折磨中没有被蛰。你踉跄着走开，找到一条小溪漱了漱口。");
         }
         if(_loc1_.cor >= 35 && _loc1_.cor < 65)
         {
            output.text("你很惊讶自己竟然能产下这么多卵，虽然这种行为很奇怪，但绝对有某种令人兴奋的地方。");
         }
         if(_loc1_.cor >= 65 && _loc1_.cor < 90)
         {
            output.text("你慵懒地伸了个懒腰，注意到大部分含有迷药的蜂蜜都不见了。也许你可以再去找那只蜂娘，并记住下次把它装进瓶子里。");
         }
         if(_loc1_.cor >= 90)
         {
            output.text("你舔了舔嘴唇，品尝着上面残留的蜂蜜，同时欣赏着你成千上万的孩子。如果每天晚上都能像这样就好了……[pg]");
         }
         _loc1_.orgasm("Anal");
         if(int([DynStat.Inte(1),DynStat.Lib(4),DynStat.Sens(3)].length) == 0)
         {
            KGAMECLASS.kGAMECLASS.player.dynStats();
         }
         else if(int([DynStat.Inte(1),DynStat.Lib(4),DynStat.Sens(3)].length) == 1)
         {
            KGAMECLASS.kGAMECLASS.player.dynStats([DynStat.Inte(1),DynStat.Lib(4),DynStat.Sens(3)][0]);
         }
         else if(int([DynStat.Inte(1),DynStat.Lib(4),DynStat.Sens(3)].length) == 2)
         {
            KGAMECLASS.kGAMECLASS.player.dynStats([DynStat.Inte(1),DynStat.Lib(4),DynStat.Sens(3)][0],[DynStat.Inte(1),DynStat.Lib(4),DynStat.Sens(3)][1]);
         }
         else if(int([DynStat.Inte(1),DynStat.Lib(4),DynStat.Sens(3)].length) == 3)
         {
            KGAMECLASS.kGAMECLASS.player.dynStats([DynStat.Inte(1),DynStat.Lib(4),DynStat.Sens(3)][0],[DynStat.Inte(1),DynStat.Lib(4),DynStat.Sens(3)][1],[DynStat.Inte(1),DynStat.Lib(4),DynStat.Sens(3)][2]);
         }
         else if(int([DynStat.Inte(1),DynStat.Lib(4),DynStat.Sens(3)].length) == 4)
         {
            KGAMECLASS.kGAMECLASS.player.dynStats([DynStat.Inte(1),DynStat.Lib(4),DynStat.Sens(3)][0],[DynStat.Inte(1),DynStat.Lib(4),DynStat.Sens(3)][1],[DynStat.Inte(1),DynStat.Lib(4),DynStat.Sens(3)][2],[DynStat.Inte(1),DynStat.Lib(4),DynStat.Sens(3)][3]);
         }
         else if(int([DynStat.Inte(1),DynStat.Lib(4),DynStat.Sens(3)].length) == 5)
         {
            KGAMECLASS.kGAMECLASS.player.dynStats([DynStat.Inte(1),DynStat.Lib(4),DynStat.Sens(3)][0],[DynStat.Inte(1),DynStat.Lib(4),DynStat.Sens(3)][1],[DynStat.Inte(1),DynStat.Lib(4),DynStat.Sens(3)][2],[DynStat.Inte(1),DynStat.Lib(4),DynStat.Sens(3)][3],[DynStat.Inte(1),DynStat.Lib(4),DynStat.Sens(3)][4]);
         }
         else if(int([DynStat.Inte(1),DynStat.Lib(4),DynStat.Sens(3)].length) == 6)
         {
            KGAMECLASS.kGAMECLASS.player.dynStats([DynStat.Inte(1),DynStat.Lib(4),DynStat.Sens(3)][0],[DynStat.Inte(1),DynStat.Lib(4),DynStat.Sens(3)][1],[DynStat.Inte(1),DynStat.Lib(4),DynStat.Sens(3)][2],[DynStat.Inte(1),DynStat.Lib(4),DynStat.Sens(3)][3],[DynStat.Inte(1),DynStat.Lib(4),DynStat.Sens(3)][4],[DynStat.Inte(1),DynStat.Lib(4),DynStat.Sens(3)][5]);
         }
         else if(int([DynStat.Inte(1),DynStat.Lib(4),DynStat.Sens(3)].length) == 7)
         {
            KGAMECLASS.kGAMECLASS.player.dynStats([DynStat.Inte(1),DynStat.Lib(4),DynStat.Sens(3)][0],[DynStat.Inte(1),DynStat.Lib(4),DynStat.Sens(3)][1],[DynStat.Inte(1),DynStat.Lib(4),DynStat.Sens(3)][2],[DynStat.Inte(1),DynStat.Lib(4),DynStat.Sens(3)][3],[DynStat.Inte(1),DynStat.Lib(4),DynStat.Sens(3)][4],[DynStat.Inte(1),DynStat.Lib(4),DynStat.Sens(3)][5],[DynStat.Inte(1),DynStat.Lib(4),DynStat.Sens(3)][6]);
         }
         else if(int([DynStat.Inte(1),DynStat.Lib(4),DynStat.Sens(3)].length) == 8)
         {
            KGAMECLASS.kGAMECLASS.player.dynStats([DynStat.Inte(1),DynStat.Lib(4),DynStat.Sens(3)][0],[DynStat.Inte(1),DynStat.Lib(4),DynStat.Sens(3)][1],[DynStat.Inte(1),DynStat.Lib(4),DynStat.Sens(3)][2],[DynStat.Inte(1),DynStat.Lib(4),DynStat.Sens(3)][3],[DynStat.Inte(1),DynStat.Lib(4),DynStat.Sens(3)][4],[DynStat.Inte(1),DynStat.Lib(4),DynStat.Sens(3)][5],[DynStat.Inte(1),DynStat.Lib(4),DynStat.Sens(3)][6],[DynStat.Inte(1),DynStat.Lib(4),DynStat.Sens(3)][7]);
         }
         else if(int([DynStat.Inte(1),DynStat.Lib(4),DynStat.Sens(3)].length) == 9)
         {
            KGAMECLASS.kGAMECLASS.player.dynStats([DynStat.Inte(1),DynStat.Lib(4),DynStat.Sens(3)][0],[DynStat.Inte(1),DynStat.Lib(4),DynStat.Sens(3)][1],[DynStat.Inte(1),DynStat.Lib(4),DynStat.Sens(3)][2],[DynStat.Inte(1),DynStat.Lib(4),DynStat.Sens(3)][3],[DynStat.Inte(1),DynStat.Lib(4),DynStat.Sens(3)][4],[DynStat.Inte(1),DynStat.Lib(4),DynStat.Sens(3)][5],[DynStat.Inte(1),DynStat.Lib(4),DynStat.Sens(3)][6],[DynStat.Inte(1),DynStat.Lib(4),DynStat.Sens(3)][7],[DynStat.Inte(1),DynStat.Lib(4),DynStat.Sens(3)][8]);
         }
         else if(int([DynStat.Inte(1),DynStat.Lib(4),DynStat.Sens(3)].length) == 10)
         {
            KGAMECLASS.kGAMECLASS.player.dynStats([DynStat.Inte(1),DynStat.Lib(4),DynStat.Sens(3)][0],[DynStat.Inte(1),DynStat.Lib(4),DynStat.Sens(3)][1],[DynStat.Inte(1),DynStat.Lib(4),DynStat.Sens(3)][2],[DynStat.Inte(1),DynStat.Lib(4),DynStat.Sens(3)][3],[DynStat.Inte(1),DynStat.Lib(4),DynStat.Sens(3)][4],[DynStat.Inte(1),DynStat.Lib(4),DynStat.Sens(3)][5],[DynStat.Inte(1),DynStat.Lib(4),DynStat.Sens(3)][6],[DynStat.Inte(1),DynStat.Lib(4),DynStat.Sens(3)][7],[DynStat.Inte(1),DynStat.Lib(4),DynStat.Sens(3)][8],[DynStat.Inte(1),DynStat.Lib(4),DynStat.Sens(3)][9]);
         }
         else if(int([DynStat.Inte(1),DynStat.Lib(4),DynStat.Sens(3)].length) == 11)
         {
            KGAMECLASS.kGAMECLASS.player.dynStats([DynStat.Inte(1),DynStat.Lib(4),DynStat.Sens(3)][0],[DynStat.Inte(1),DynStat.Lib(4),DynStat.Sens(3)][1],[DynStat.Inte(1),DynStat.Lib(4),DynStat.Sens(3)][2],[DynStat.Inte(1),DynStat.Lib(4),DynStat.Sens(3)][3],[DynStat.Inte(1),DynStat.Lib(4),DynStat.Sens(3)][4],[DynStat.Inte(1),DynStat.Lib(4),DynStat.Sens(3)][5],[DynStat.Inte(1),DynStat.Lib(4),DynStat.Sens(3)][6],[DynStat.Inte(1),DynStat.Lib(4),DynStat.Sens(3)][7],[DynStat.Inte(1),DynStat.Lib(4),DynStat.Sens(3)][8],[DynStat.Inte(1),DynStat.Lib(4),DynStat.Sens(3)][9],[DynStat.Inte(1),DynStat.Lib(4),DynStat.Sens(3)][10]);
         }
         else if(int([DynStat.Inte(1),DynStat.Lib(4),DynStat.Sens(3)].length) == 12)
         {
            KGAMECLASS.kGAMECLASS.player.dynStats([DynStat.Inte(1),DynStat.Lib(4),DynStat.Sens(3)][0],[DynStat.Inte(1),DynStat.Lib(4),DynStat.Sens(3)][1],[DynStat.Inte(1),DynStat.Lib(4),DynStat.Sens(3)][2],[DynStat.Inte(1),DynStat.Lib(4),DynStat.Sens(3)][3],[DynStat.Inte(1),DynStat.Lib(4),DynStat.Sens(3)][4],[DynStat.Inte(1),DynStat.Lib(4),DynStat.Sens(3)][5],[DynStat.Inte(1),DynStat.Lib(4),DynStat.Sens(3)][6],[DynStat.Inte(1),DynStat.Lib(4),DynStat.Sens(3)][7],[DynStat.Inte(1),DynStat.Lib(4),DynStat.Sens(3)][8],[DynStat.Inte(1),DynStat.Lib(4),DynStat.Sens(3)][9],[DynStat.Inte(1),DynStat.Lib(4),DynStat.Sens(3)][10],[DynStat.Inte(1),DynStat.Lib(4),DynStat.Sens(3)][11]);
         }
         else if(int([DynStat.Inte(1),DynStat.Lib(4),DynStat.Sens(3)].length) == 13)
         {
            KGAMECLASS.kGAMECLASS.player.dynStats([DynStat.Inte(1),DynStat.Lib(4),DynStat.Sens(3)][0],[DynStat.Inte(1),DynStat.Lib(4),DynStat.Sens(3)][1],[DynStat.Inte(1),DynStat.Lib(4),DynStat.Sens(3)][2],[DynStat.Inte(1),DynStat.Lib(4),DynStat.Sens(3)][3],[DynStat.Inte(1),DynStat.Lib(4),DynStat.Sens(3)][4],[DynStat.Inte(1),DynStat.Lib(4),DynStat.Sens(3)][5],[DynStat.Inte(1),DynStat.Lib(4),DynStat.Sens(3)][6],[DynStat.Inte(1),DynStat.Lib(4),DynStat.Sens(3)][7],[DynStat.Inte(1),DynStat.Lib(4),DynStat.Sens(3)][8],[DynStat.Inte(1),DynStat.Lib(4),DynStat.Sens(3)][9],[DynStat.Inte(1),DynStat.Lib(4),DynStat.Sens(3)][10],[DynStat.Inte(1),DynStat.Lib(4),DynStat.Sens(3)][11],[DynStat.Inte(1),DynStat.Lib(4),DynStat.Sens(3)][12]);
         }
         else if(int([DynStat.Inte(1),DynStat.Lib(4),DynStat.Sens(3)].length) == 14)
         {
            KGAMECLASS.kGAMECLASS.player.dynStats([DynStat.Inte(1),DynStat.Lib(4),DynStat.Sens(3)][0],[DynStat.Inte(1),DynStat.Lib(4),DynStat.Sens(3)][1],[DynStat.Inte(1),DynStat.Lib(4),DynStat.Sens(3)][2],[DynStat.Inte(1),DynStat.Lib(4),DynStat.Sens(3)][3],[DynStat.Inte(1),DynStat.Lib(4),DynStat.Sens(3)][4],[DynStat.Inte(1),DynStat.Lib(4),DynStat.Sens(3)][5],[DynStat.Inte(1),DynStat.Lib(4),DynStat.Sens(3)][6],[DynStat.Inte(1),DynStat.Lib(4),DynStat.Sens(3)][7],[DynStat.Inte(1),DynStat.Lib(4),DynStat.Sens(3)][8],[DynStat.Inte(1),DynStat.Lib(4),DynStat.Sens(3)][9],[DynStat.Inte(1),DynStat.Lib(4),DynStat.Sens(3)][10],[DynStat.Inte(1),DynStat.Lib(4),DynStat.Sens(3)][11],[DynStat.Inte(1),DynStat.Lib(4),DynStat.Sens(3)][12],[DynStat.Inte(1),DynStat.Lib(4),DynStat.Sens(3)][13]);
         }
         else if(int([DynStat.Inte(1),DynStat.Lib(4),DynStat.Sens(3)].length) == 15)
         {
            KGAMECLASS.kGAMECLASS.player.dynStats([DynStat.Inte(1),DynStat.Lib(4),DynStat.Sens(3)][0],[DynStat.Inte(1),DynStat.Lib(4),DynStat.Sens(3)][1],[DynStat.Inte(1),DynStat.Lib(4),DynStat.Sens(3)][2],[DynStat.Inte(1),DynStat.Lib(4),DynStat.Sens(3)][3],[DynStat.Inte(1),DynStat.Lib(4),DynStat.Sens(3)][4],[DynStat.Inte(1),DynStat.Lib(4),DynStat.Sens(3)][5],[DynStat.Inte(1),DynStat.Lib(4),DynStat.Sens(3)][6],[DynStat.Inte(1),DynStat.Lib(4),DynStat.Sens(3)][7],[DynStat.Inte(1),DynStat.Lib(4),DynStat.Sens(3)][8],[DynStat.Inte(1),DynStat.Lib(4),DynStat.Sens(3)][9],[DynStat.Inte(1),DynStat.Lib(4),DynStat.Sens(3)][10],[DynStat.Inte(1),DynStat.Lib(4),DynStat.Sens(3)][11],[DynStat.Inte(1),DynStat.Lib(4),DynStat.Sens(3)][12],[DynStat.Inte(1),DynStat.Lib(4),DynStat.Sens(3)][13],[DynStat.Inte(1),DynStat.Lib(4),DynStat.Sens(3)][14]);
         }
         else if(int([DynStat.Inte(1),DynStat.Lib(4),DynStat.Sens(3)].length) == 16)
         {
            KGAMECLASS.kGAMECLASS.player.dynStats([DynStat.Inte(1),DynStat.Lib(4),DynStat.Sens(3)][0],[DynStat.Inte(1),DynStat.Lib(4),DynStat.Sens(3)][1],[DynStat.Inte(1),DynStat.Lib(4),DynStat.Sens(3)][2],[DynStat.Inte(1),DynStat.Lib(4),DynStat.Sens(3)][3],[DynStat.Inte(1),DynStat.Lib(4),DynStat.Sens(3)][4],[DynStat.Inte(1),DynStat.Lib(4),DynStat.Sens(3)][5],[DynStat.Inte(1),DynStat.Lib(4),DynStat.Sens(3)][6],[DynStat.Inte(1),DynStat.Lib(4),DynStat.Sens(3)][7],[DynStat.Inte(1),DynStat.Lib(4),DynStat.Sens(3)][8],[DynStat.Inte(1),DynStat.Lib(4),DynStat.Sens(3)][9],[DynStat.Inte(1),DynStat.Lib(4),DynStat.Sens(3)][10],[DynStat.Inte(1),DynStat.Lib(4),DynStat.Sens(3)][11],[DynStat.Inte(1),DynStat.Lib(4),DynStat.Sens(3)][12],[DynStat.Inte(1),DynStat.Lib(4),DynStat.Sens(3)][13],[DynStat.Inte(1),DynStat.Lib(4),DynStat.Sens(3)][14],[DynStat.Inte(1),DynStat.Lib(4),DynStat.Sens(3)][15]);
         }
         else if(int([DynStat.Inte(1),DynStat.Lib(4),DynStat.Sens(3)].length) == 17)
         {
            KGAMECLASS.kGAMECLASS.player.dynStats([DynStat.Inte(1),DynStat.Lib(4),DynStat.Sens(3)][0],[DynStat.Inte(1),DynStat.Lib(4),DynStat.Sens(3)][1],[DynStat.Inte(1),DynStat.Lib(4),DynStat.Sens(3)][2],[DynStat.Inte(1),DynStat.Lib(4),DynStat.Sens(3)][3],[DynStat.Inte(1),DynStat.Lib(4),DynStat.Sens(3)][4],[DynStat.Inte(1),DynStat.Lib(4),DynStat.Sens(3)][5],[DynStat.Inte(1),DynStat.Lib(4),DynStat.Sens(3)][6],[DynStat.Inte(1),DynStat.Lib(4),DynStat.Sens(3)][7],[DynStat.Inte(1),DynStat.Lib(4),DynStat.Sens(3)][8],[DynStat.Inte(1),DynStat.Lib(4),DynStat.Sens(3)][9],[DynStat.Inte(1),DynStat.Lib(4),DynStat.Sens(3)][10],[DynStat.Inte(1),DynStat.Lib(4),DynStat.Sens(3)][11],[DynStat.Inte(1),DynStat.Lib(4),DynStat.Sens(3)][12],[DynStat.Inte(1),DynStat.Lib(4),DynStat.Sens(3)][13],[DynStat.Inte(1),DynStat.Lib(4),DynStat.Sens(3)][14],[DynStat.Inte(1),DynStat.Lib(4),DynStat.Sens(3)][15],[DynStat.Inte(1),DynStat.Lib(4),DynStat.Sens(3)][16]);
         }
         else if(int([DynStat.Inte(1),DynStat.Lib(4),DynStat.Sens(3)].length) == 18)
         {
            KGAMECLASS.kGAMECLASS.player.dynStats([DynStat.Inte(1),DynStat.Lib(4),DynStat.Sens(3)][0],[DynStat.Inte(1),DynStat.Lib(4),DynStat.Sens(3)][1],[DynStat.Inte(1),DynStat.Lib(4),DynStat.Sens(3)][2],[DynStat.Inte(1),DynStat.Lib(4),DynStat.Sens(3)][3],[DynStat.Inte(1),DynStat.Lib(4),DynStat.Sens(3)][4],[DynStat.Inte(1),DynStat.Lib(4),DynStat.Sens(3)][5],[DynStat.Inte(1),DynStat.Lib(4),DynStat.Sens(3)][6],[DynStat.Inte(1),DynStat.Lib(4),DynStat.Sens(3)][7],[DynStat.Inte(1),DynStat.Lib(4),DynStat.Sens(3)][8],[DynStat.Inte(1),DynStat.Lib(4),DynStat.Sens(3)][9],[DynStat.Inte(1),DynStat.Lib(4),DynStat.Sens(3)][10],[DynStat.Inte(1),DynStat.Lib(4),DynStat.Sens(3)][11],[DynStat.Inte(1),DynStat.Lib(4),DynStat.Sens(3)][12],[DynStat.Inte(1),DynStat.Lib(4),DynStat.Sens(3)][13],[DynStat.Inte(1),DynStat.Lib(4),DynStat.Sens(3)][14],[DynStat.Inte(1),DynStat.Lib(4),DynStat.Sens(3)][15],[DynStat.Inte(1),DynStat.Lib(4),DynStat.Sens(3)][16],[DynStat.Inte(1),DynStat.Lib(4),DynStat.Sens(3)][17]);
         }
         else if(int([DynStat.Inte(1),DynStat.Lib(4),DynStat.Sens(3)].length) == 19)
         {
            KGAMECLASS.kGAMECLASS.player.dynStats([DynStat.Inte(1),DynStat.Lib(4),DynStat.Sens(3)][0],[DynStat.Inte(1),DynStat.Lib(4),DynStat.Sens(3)][1],[DynStat.Inte(1),DynStat.Lib(4),DynStat.Sens(3)][2],[DynStat.Inte(1),DynStat.Lib(4),DynStat.Sens(3)][3],[DynStat.Inte(1),DynStat.Lib(4),DynStat.Sens(3)][4],[DynStat.Inte(1),DynStat.Lib(4),DynStat.Sens(3)][5],[DynStat.Inte(1),DynStat.Lib(4),DynStat.Sens(3)][6],[DynStat.Inte(1),DynStat.Lib(4),DynStat.Sens(3)][7],[DynStat.Inte(1),DynStat.Lib(4),DynStat.Sens(3)][8],[DynStat.Inte(1),DynStat.Lib(4),DynStat.Sens(3)][9],[DynStat.Inte(1),DynStat.Lib(4),DynStat.Sens(3)][10],[DynStat.Inte(1),DynStat.Lib(4),DynStat.Sens(3)][11],[DynStat.Inte(1),DynStat.Lib(4),DynStat.Sens(3)][12],[DynStat.Inte(1),DynStat.Lib(4),DynStat.Sens(3)][13],[DynStat.Inte(1),DynStat.Lib(4),DynStat.Sens(3)][14],[DynStat.Inte(1),DynStat.Lib(4),DynStat.Sens(3)][15],[DynStat.Inte(1),DynStat.Lib(4),DynStat.Sens(3)][16],[DynStat.Inte(1),DynStat.Lib(4),DynStat.Sens(3)][17],[DynStat.Inte(1),DynStat
            .Lib(4),DynStat.Sens(3)][18]);
         }
         else
         {
            if(int([DynStat.Inte(1),DynStat.Lib(4),DynStat.Sens(3)].length) != 20)
            {
               throw "Too many rest arguments";
            }
            KGAMECLASS.kGAMECLASS.player.dynStats([DynStat.Inte(1),DynStat.Lib(4),DynStat.Sens(3)][0],[DynStat.Inte(1),DynStat.Lib(4),DynStat.Sens(3)][1],[DynStat.Inte(1),DynStat.Lib(4),DynStat.Sens(3)][2],[DynStat.Inte(1),DynStat.Lib(4),DynStat.Sens(3)][3],[DynStat.Inte(1),DynStat.Lib(4),DynStat.Sens(3)][4],[DynStat.Inte(1),DynStat.Lib(4),DynStat.Sens(3)][5],[DynStat.Inte(1),DynStat.Lib(4),DynStat.Sens(3)][6],[DynStat.Inte(1),DynStat.Lib(4),DynStat.Sens(3)][7],[DynStat.Inte(1),DynStat.Lib(4),DynStat.Sens(3)][8],[DynStat.Inte(1),DynStat.Lib(4),DynStat.Sens(3)][9],[DynStat.Inte(1),DynStat.Lib(4),DynStat.Sens(3)][10],[DynStat.Inte(1),DynStat.Lib(4),DynStat.Sens(3)][11],[DynStat.Inte(1),DynStat.Lib(4),DynStat.Sens(3)][12],[DynStat.Inte(1),DynStat.Lib(4),DynStat.Sens(3)][13],[DynStat.Inte(1),DynStat.Lib(4),DynStat.Sens(3)][14],[DynStat.Inte(1),DynStat.Lib(4),DynStat.Sens(3)][15],[DynStat.Inte(1),DynStat.Lib(4),DynStat.Sens(3)][16],[DynStat.Inte(1),DynStat.Lib(4),DynStat.Sens(3)][17],[DynStat.Inte(1),DynStat
            .Lib(4),DynStat.Sens(3)][18],[DynStat.Inte(1),DynStat.Lib(4),DynStat.Sens(3)][19]);
         }
         if(_loc1_.buttChange(20,true))
         {
            output.text("[pg]");
         }
         if(_loc1_.butt.rating < 17)
         {
            if(_loc1_.butt.rating < 13)
            {
               _temp_1.rating += 1;
               output.text("你注意到在经历了这场折磨后，你的" + _loc1_.buttDescript() + "感觉变得更加丰满硕大了。");
            }
            else if(Utils.rand(2) == 0)
            {
               _temp_2.rating += 1;
               output.text("你注意到在经历了这场折磨后，你的" + _loc1_.buttDescript() + "感觉变得更加丰满硕大了。");
            }
         }
         output.text("[pg]");
         _loc2_ = true;
      }
   }
}

