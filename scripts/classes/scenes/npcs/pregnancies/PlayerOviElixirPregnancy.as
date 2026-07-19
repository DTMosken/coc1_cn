package classes.scenes.npcs.pregnancies
{
   import classes.CoC;
   import classes.CoC_Settings;
   import classes.DynStat;
   import classes.DynStatOp;
   import classes.PerkLib;
   import classes.Player;
   import classes.StatusEffects;
   import classes.Vagina;
   import classes._FlagDict.FlagDict_Impl_;
   import classes.globalFlags.KFLAGS;
   import classes.globalFlags.KGAMECLASS;
   import classes.internals.GuiOutput;
   import classes.internals.Utils;
   import classes.scenes.PregnancyProgression;
   import classes.scenes.VaginalPregnancy;
   import flash.Boot;
   
   public class PlayerOviElixirPregnancy implements VaginalPregnancy
   {
      
      public var output:GuiOutput;
      
      public function PlayerOviElixirPregnancy(param1:GuiOutput = undefined)
      {
         if(Boot.skip_constructor)
         {
            return;
         }
         output = param1;
         PregnancyProgression.registerVaginalPregnancyScene(25,5,this);
      }
      
      public function vaginalBirth() : void
      {
         var _loc3_:* = null as CoC;
         var _loc4_:* = null as Array;
         var _loc1_:Player = KGAMECLASS.kGAMECLASS.player;
         if(!vaginaCheck())
         {
            return;
         }
         var _loc2_:Boolean = false;
         if(!_loc1_.hasPerk(PerkLib.Oviposition) && FlagDict_Impl_.arrayReadInt(KFLAGS.flags,1295) > 0 && Utils.rand(3) < FlagDict_Impl_.arrayReadInt(KFLAGS.flags,1295))
         {
            output.text("你立刻感觉到身体僵硬，知道事情不对劲。[if (hasWeapon) {你松开了手中的[weapon]，然后你的|你的}]双腿完全失去了力量，你跪倒在地，嘴里发出一声尖锐的、令人毛骨悚然的惨叫。你捂着肚子，把脸埋在地上，尖叫声变成了剧烈而尖锐的哀号。在你的子宫深处，你感觉到一种令人战栗的、非人的变化，你的子宫剧烈而痛苦地移动和扭曲，围绕着你未受精的卵子，变成了一个更宽敞、更像洞穴的家。你的哀号声渐渐平息，变成了沉重的叹息和呻吟。你虚弱的目光注意到你的肚子正在剧烈地颤抖，你意识到还有更多的东西要出来。[pg]");
            _loc2_ = true;
         }
         FlagDict_Impl_.arrayWriteInt(KFLAGS.flags,1295,0);
         if(_loc1_.statusEffectv2(StatusEffects.Eggs) == 0)
         {
            if(_loc1_.statusEffectv3(StatusEffects.Eggs) < 10)
            {
               output.text("你被打断了，因为你发现自己被一种无法控制的脱衣和蹲下的冲动所占据。你责备自己屈服于这种冲动，片刻之后，你感觉到有什么东西在移动。你听到液体溅在地上的声音，低头一看，发现你身下有一滩浓稠的绿色液体。你没有时间思考这种变化，因为一个圆形的物体顺着你的产道滑下，撑开了你的阴唇，让你的脸颊泛起红晕。它扑通一声掉进水坑里，你发现自己因为产下这么健康的卵而感到明显的喜悦。");
               _loc1_.cuntChange(10,true);
               output.text("又一颗卵滑落下来，你意识到这个过程让你越来越兴奋。你总共生下了");
               output.text(eggDescript());
               output.text("，把自己逼到了高潮的边缘。");
               _loc3_ = KGAMECLASS.kGAMECLASS;
               _loc4_ = [DynStat.Lust(_loc1_.maxLust(),DynStatOp.Eq),DynStat.NoScale];
               if(int(_loc4_.length) == 0)
               {
                  _loc3_.player.dynStats();
               }
               else if(int(_loc4_.length) == 1)
               {
                  _loc3_.player.dynStats(_loc4_[0]);
               }
               else if(int(_loc4_.length) == 2)
               {
                  _loc3_.player.dynStats(_loc4_[0],_loc4_[1]);
               }
               else if(int(_loc4_.length) == 3)
               {
                  _loc3_.player.dynStats(_loc4_[0],_loc4_[1],_loc4_[2]);
               }
               else if(int(_loc4_.length) == 4)
               {
                  _loc3_.player.dynStats(_loc4_[0],_loc4_[1],_loc4_[2],_loc4_[3]);
               }
               else if(int(_loc4_.length) == 5)
               {
                  _loc3_.player.dynStats(_loc4_[0],_loc4_[1],_loc4_[2],_loc4_[3],_loc4_[4]);
               }
               else if(int(_loc4_.length) == 6)
               {
                  _loc3_.player.dynStats(_loc4_[0],_loc4_[1],_loc4_[2],_loc4_[3],_loc4_[4],_loc4_[5]);
               }
               else if(int(_loc4_.length) == 7)
               {
                  _loc3_.player.dynStats(_loc4_[0],_loc4_[1],_loc4_[2],_loc4_[3],_loc4_[4],_loc4_[5],_loc4_[6]);
               }
               else if(int(_loc4_.length) == 8)
               {
                  _loc3_.player.dynStats(_loc4_[0],_loc4_[1],_loc4_[2],_loc4_[3],_loc4_[4],_loc4_[5],_loc4_[6],_loc4_[7]);
               }
               else if(int(_loc4_.length) == 9)
               {
                  _loc3_.player.dynStats(_loc4_[0],_loc4_[1],_loc4_[2],_loc4_[3],_loc4_[4],_loc4_[5],_loc4_[6],_loc4_[7],_loc4_[8]);
               }
               else if(int(_loc4_.length) == 10)
               {
                  _loc3_.player.dynStats(_loc4_[0],_loc4_[1],_loc4_[2],_loc4_[3],_loc4_[4],_loc4_[5],_loc4_[6],_loc4_[7],_loc4_[8],_loc4_[9]);
               }
               else if(int(_loc4_.length) == 11)
               {
                  _loc3_.player.dynStats(_loc4_[0],_loc4_[1],_loc4_[2],_loc4_[3],_loc4_[4],_loc4_[5],_loc4_[6],_loc4_[7],_loc4_[8],_loc4_[9],_loc4_[10]);
               }
               else if(int(_loc4_.length) == 12)
               {
                  _loc3_.player.dynStats(_loc4_[0],_loc4_[1],_loc4_[2],_loc4_[3],_loc4_[4],_loc4_[5],_loc4_[6],_loc4_[7],_loc4_[8],_loc4_[9],_loc4_[10],_loc4_[11]);
               }
               else if(int(_loc4_.length) == 13)
               {
                  _loc3_.player.dynStats(_loc4_[0],_loc4_[1],_loc4_[2],_loc4_[3],_loc4_[4],_loc4_[5],_loc4_[6],_loc4_[7],_loc4_[8],_loc4_[9],_loc4_[10],_loc4_[11],_loc4_[12]);
               }
               else if(int(_loc4_.length) == 14)
               {
                  _loc3_.player.dynStats(_loc4_[0],_loc4_[1],_loc4_[2],_loc4_[3],_loc4_[4],_loc4_[5],_loc4_[6],_loc4_[7],_loc4_[8],_loc4_[9],_loc4_[10],_loc4_[11],_loc4_[12],_loc4_[13]);
               }
               else if(int(_loc4_.length) == 15)
               {
                  _loc3_.player.dynStats(_loc4_[0],_loc4_[1],_loc4_[2],_loc4_[3],_loc4_[4],_loc4_[5],_loc4_[6],_loc4_[7],_loc4_[8],_loc4_[9],_loc4_[10],_loc4_[11],_loc4_[12],_loc4_[13],_loc4_[14]);
               }
               else if(int(_loc4_.length) == 16)
               {
                  _loc3_.player.dynStats(_loc4_[0],_loc4_[1],_loc4_[2],_loc4_[3],_loc4_[4],_loc4_[5],_loc4_[6],_loc4_[7],_loc4_[8],_loc4_[9],_loc4_[10],_loc4_[11],_loc4_[12],_loc4_[13],_loc4_[14],_loc4_[15]);
               }
               else if(int(_loc4_.length) == 17)
               {
                  _loc3_.player.dynStats(_loc4_[0],_loc4_[1],_loc4_[2],_loc4_[3],_loc4_[4],_loc4_[5],_loc4_[6],_loc4_[7],_loc4_[8],_loc4_[9],_loc4_[10],_loc4_[11],_loc4_[12],_loc4_[13],_loc4_[14],_loc4_[15],_loc4_[16]);
               }
               else if(int(_loc4_.length) == 18)
               {
                  _loc3_.player.dynStats(_loc4_[0],_loc4_[1],_loc4_[2],_loc4_[3],_loc4_[4],_loc4_[5],_loc4_[6],_loc4_[7],_loc4_[8],_loc4_[9],_loc4_[10],_loc4_[11],_loc4_[12],_loc4_[13],_loc4_[14],_loc4_[15],_loc4_[16],_loc4_[17]);
               }
               else if(int(_loc4_.length) == 19)
               {
                  _loc3_.player.dynStats(_loc4_[0],_loc4_[1],_loc4_[2],_loc4_[3],_loc4_[4],_loc4_[5],_loc4_[6],_loc4_[7],_loc4_[8],_loc4_[9],_loc4_[10],_loc4_[11],_loc4_[12],_loc4_[13],_loc4_[14],_loc4_[15],_loc4_[16],_loc4_[17],_loc4_[18]);
               }
               else
               {
                  if(int(_loc4_.length) != 20)
                  {
                     throw "Too many rest arguments";
                  }
                  _loc3_.player.dynStats(_loc4_[0],_loc4_[1],_loc4_[2],_loc4_[3],_loc4_[4],_loc4_[5],_loc4_[6],_loc4_[7],_loc4_[8],_loc4_[9],_loc4_[10],_loc4_[11],_loc4_[12],_loc4_[13],_loc4_[14],_loc4_[15],_loc4_[16],_loc4_[17],_loc4_[18],_loc4_[19]);
               }
            }
            else
            {
               output.text("一种奇怪的欲望压倒了你的理智，迫使你脱下你的" + Utils.cnName(_loc1_.get_armorName()) + "，双手双膝着地。你设法翻过身，靠在一块光滑的石头上，低头看着你那看起来像怀孕一样的肚子，绿色的液体从你身上漏出来，浸透了地面。一阵强烈的宫缩撕裂了你，你的双腿本能地张开，打开你的" + _loc1_.vaginaDescript(0) + "，以便更好地存放你珍贵的货物。你看到一颗卵的圆形表面从你的阴唇间露出来，上面布满了奇怪的颜色。你用力一推，它伴随着突然的剧烈动作掉了出来。摩擦和粘稠的液体开始唤起你的情欲，当感觉到第二颗卵往下推时，你的下体充满了热量。它比第一颗更容易滑落，让你更加兴奋，你因为意想不到的快感而发出一声呻吟。");
               _loc1_.cuntChange(10,true);
               output.text("在它停止在地上滚动之前，你感觉到下一颗卵顺着你那布满粘液的通道滑下，在滑落时完美地摩擦着你。你失去了对卵的计数，开始自慰，");
               if(_loc1_.getClitLength() > 5)
               {
                  output.text("像撸管一样撸动你巨大的阴蒂，随着每一颗卵从你逐渐缩小的肚子中滑落，你呻吟着喘息着。你用你的爱液和粘液的混合物润滑它，直到");
               }
               if(_loc1_.getClitLength() > 2 && _loc1_.getClitLength() <= 5)
               {
                  output.text("把你过大的阴蒂当成小鸡巴一样玩弄，随着卵从你逐渐缩小的肚子中滑落，你呻吟着喘息着。你把粘液和淫水涂抹在上面，挑逗和抚摸，直到");
               }
               if(_loc1_.getClitLength() <= 2)
               {
                  output.text("拉开你的阴唇，玩弄你的阴蒂，又一颗卵从你逐渐缩小的肚子中滑落。你把粘液涂抹开，发出湿润的摩擦声，用力地揉搓自己，直到");
               }
               output.text("你在高潮中颤抖，排出最后一颗卵，你的身体在地上无力地抽搐。你总共生下了" + eggDescript() + "。");
               _loc1_.orgasm("Vaginal");
               if(int([DynStat.NoScale].length) == 0)
               {
                  KGAMECLASS.kGAMECLASS.player.dynStats();
               }
               else if(int([DynStat.NoScale].length) == 1)
               {
                  KGAMECLASS.kGAMECLASS.player.dynStats([DynStat.NoScale][0]);
               }
               else if(int([DynStat.NoScale].length) == 2)
               {
                  KGAMECLASS.kGAMECLASS.player.dynStats([DynStat.NoScale][0],[DynStat.NoScale][1]);
               }
               else if(int([DynStat.NoScale].length) == 3)
               {
                  KGAMECLASS.kGAMECLASS.player.dynStats([DynStat.NoScale][0],[DynStat.NoScale][1],[DynStat.NoScale][2]);
               }
               else if(int([DynStat.NoScale].length) == 4)
               {
                  KGAMECLASS.kGAMECLASS.player.dynStats([DynStat.NoScale][0],[DynStat.NoScale][1],[DynStat.NoScale][2],[DynStat.NoScale][3]);
               }
               else if(int([DynStat.NoScale].length) == 5)
               {
                  KGAMECLASS.kGAMECLASS.player.dynStats([DynStat.NoScale][0],[DynStat.NoScale][1],[DynStat.NoScale][2],[DynStat.NoScale][3],[DynStat.NoScale][4]);
               }
               else if(int([DynStat.NoScale].length) == 6)
               {
                  KGAMECLASS.kGAMECLASS.player.dynStats([DynStat.NoScale][0],[DynStat.NoScale][1],[DynStat.NoScale][2],[DynStat.NoScale][3],[DynStat.NoScale][4],[DynStat.NoScale][5]);
               }
               else if(int([DynStat.NoScale].length) == 7)
               {
                  KGAMECLASS.kGAMECLASS.player.dynStats([DynStat.NoScale][0],[DynStat.NoScale][1],[DynStat.NoScale][2],[DynStat.NoScale][3],[DynStat.NoScale][4],[DynStat.NoScale][5],[DynStat.NoScale][6]);
               }
               else if(int([DynStat.NoScale].length) == 8)
               {
                  KGAMECLASS.kGAMECLASS.player.dynStats([DynStat.NoScale][0],[DynStat.NoScale][1],[DynStat.NoScale][2],[DynStat.NoScale][3],[DynStat.NoScale][4],[DynStat.NoScale][5],[DynStat.NoScale][6],[DynStat.NoScale][7]);
               }
               else if(int([DynStat.NoScale].length) == 9)
               {
                  KGAMECLASS.kGAMECLASS.player.dynStats([DynStat.NoScale][0],[DynStat.NoScale][1],[DynStat.NoScale][2],[DynStat.NoScale][3],[DynStat.NoScale][4],[DynStat.NoScale][5],[DynStat.NoScale][6],[DynStat.NoScale][7],[DynStat.NoScale][8]);
               }
               else if(int([DynStat.NoScale].length) == 10)
               {
                  KGAMECLASS.kGAMECLASS.player.dynStats([DynStat.NoScale][0],[DynStat.NoScale][1],[DynStat.NoScale][2],[DynStat.NoScale][3],[DynStat.NoScale][4],[DynStat.NoScale][5],[DynStat.NoScale][6],[DynStat.NoScale][7],[DynStat.NoScale][8],[DynStat.NoScale][9]);
               }
               else if(int([DynStat.NoScale].length) == 11)
               {
                  KGAMECLASS.kGAMECLASS.player.dynStats([DynStat.NoScale][0],[DynStat.NoScale][1],[DynStat.NoScale][2],[DynStat.NoScale][3],[DynStat.NoScale][4],[DynStat.NoScale][5],[DynStat.NoScale][6],[DynStat.NoScale][7],[DynStat.NoScale][8],[DynStat.NoScale][9],[DynStat.NoScale][10]);
               }
               else if(int([DynStat.NoScale].length) == 12)
               {
                  KGAMECLASS.kGAMECLASS.player.dynStats([DynStat.NoScale][0],[DynStat.NoScale][1],[DynStat.NoScale][2],[DynStat.NoScale][3],[DynStat.NoScale][4],[DynStat.NoScale][5],[DynStat.NoScale][6],[DynStat.NoScale][7],[DynStat.NoScale][8],[DynStat.NoScale][9],[DynStat.NoScale][10],[DynStat.NoScale][11]);
               }
               else if(int([DynStat.NoScale].length) == 13)
               {
                  KGAMECLASS.kGAMECLASS.player.dynStats([DynStat.NoScale][0],[DynStat.NoScale][1],[DynStat.NoScale][2],[DynStat.NoScale][3],[DynStat.NoScale][4],[DynStat.NoScale][5],[DynStat.NoScale][6],[DynStat.NoScale][7],[DynStat.NoScale][8],[DynStat.NoScale][9],[DynStat.NoScale][10],[DynStat.NoScale][11],[DynStat.NoScale][12]);
               }
               else if(int([DynStat.NoScale].length) == 14)
               {
                  KGAMECLASS.kGAMECLASS.player.dynStats([DynStat.NoScale][0],[DynStat.NoScale][1],[DynStat.NoScale][2],[DynStat.NoScale][3],[DynStat.NoScale][4],[DynStat.NoScale][5],[DynStat.NoScale][6],[DynStat.NoScale][7],[DynStat.NoScale][8],[DynStat.NoScale][9],[DynStat.NoScale][10],[DynStat.NoScale][11],[DynStat.NoScale][12],[DynStat.NoScale][13]);
               }
               else if(int([DynStat.NoScale].length) == 15)
               {
                  KGAMECLASS.kGAMECLASS.player.dynStats([DynStat.NoScale][0],[DynStat.NoScale][1],[DynStat.NoScale][2],[DynStat.NoScale][3],[DynStat.NoScale][4],[DynStat.NoScale][5],[DynStat.NoScale][6],[DynStat.NoScale][7],[DynStat.NoScale][8],[DynStat.NoScale][9],[DynStat.NoScale][10],[DynStat.NoScale][11],[DynStat.NoScale][12],[DynStat.NoScale][13],[DynStat.NoScale][14]);
               }
               else if(int([DynStat.NoScale].length) == 16)
               {
                  KGAMECLASS.kGAMECLASS.player.dynStats([DynStat.NoScale][0],[DynStat.NoScale][1],[DynStat.NoScale][2],[DynStat.NoScale][3],[DynStat.NoScale][4],[DynStat.NoScale][5],[DynStat.NoScale][6],[DynStat.NoScale][7],[DynStat.NoScale][8],[DynStat.NoScale][9],[DynStat.NoScale][10],[DynStat.NoScale][11],[DynStat.NoScale][12],[DynStat.NoScale][13],[DynStat.NoScale][14],[DynStat.NoScale][15]);
               }
               else if(int([DynStat.NoScale].length) == 17)
               {
                  KGAMECLASS.kGAMECLASS.player.dynStats([DynStat.NoScale][0],[DynStat.NoScale][1],[DynStat.NoScale][2],[DynStat.NoScale][3],[DynStat.NoScale][4],[DynStat.NoScale][5],[DynStat.NoScale][6],[DynStat.NoScale][7],[DynStat.NoScale][8],[DynStat.NoScale][9],[DynStat.NoScale][10],[DynStat.NoScale][11],[DynStat.NoScale][12],[DynStat.NoScale][13],[DynStat.NoScale][14],[DynStat.NoScale][15],[DynStat.NoScale][16]);
               }
               else if(int([DynStat.NoScale].length) == 18)
               {
                  KGAMECLASS.kGAMECLASS.player.dynStats([DynStat.NoScale][0],[DynStat.NoScale][1],[DynStat.NoScale][2],[DynStat.NoScale][3],[DynStat.NoScale][4],[DynStat.NoScale][5],[DynStat.NoScale][6],[DynStat.NoScale][7],[DynStat.NoScale][8],[DynStat.NoScale][9],[DynStat.NoScale][10],[DynStat.NoScale][11],[DynStat.NoScale][12],[DynStat.NoScale][13],[DynStat.NoScale][14],[DynStat.NoScale][15],[DynStat.NoScale][16],[DynStat.NoScale][17]);
               }
               else if(int([DynStat.NoScale].length) == 19)
               {
                  KGAMECLASS.kGAMECLASS.player.dynStats([DynStat.NoScale][0],[DynStat.NoScale][1],[DynStat.NoScale][2],[DynStat.NoScale][3],[DynStat.NoScale][4],[DynStat.NoScale][5],[DynStat.NoScale][6],[DynStat.NoScale][7],[DynStat.NoScale][8],[DynStat.NoScale][9],[DynStat.NoScale][10],[DynStat.NoScale][11],[DynStat.NoScale][12],[DynStat.NoScale][13],[DynStat.NoScale][14],[DynStat.NoScale][15],[DynStat.NoScale][16],[DynStat.NoScale][17],[DynStat.NoScale][18]);
               }
               else
               {
                  if(int([DynStat.NoScale].length) != 20)
                  {
                     throw "Too many rest arguments";
                  }
                  KGAMECLASS.kGAMECLASS.player.dynStats([DynStat.NoScale][0],[DynStat.NoScale][1],[DynStat.NoScale][2],[DynStat.NoScale][3],[DynStat.NoScale][4],[DynStat.NoScale][5],[DynStat.NoScale][6],[DynStat.NoScale][7],[DynStat.NoScale][8],[DynStat.NoScale][9],[DynStat.NoScale][10],[DynStat.NoScale][11],[DynStat.NoScale][12],[DynStat.NoScale][13],[DynStat.NoScale][14],[DynStat.NoScale][15],[DynStat.NoScale][16],[DynStat.NoScale][17],[DynStat.NoScale][18],[DynStat.NoScale][19]);
               }
            }
         }
         else
         {
            output.text("你怀孕的肚子重量突然发生变化，让你踉跄了一下，跪倒在地。你意识到有什么东西要出生了，你脱下你的" + Utils.cnName(_loc1_.get_armorName()) + "，以免被即将到来的东西弄脏。一阵宫缩剧烈地推过你的腹部，");
            if(_loc1_.vaginas[0].vaginalLooseness < 2)
            {
               output.text("痛苦地撑开你紧致的小穴，阴唇张得大大的");
            }
            if(_loc1_.vaginas[0].vaginalLooseness >= 2 && _loc1_.vaginas[0].vaginalLooseness <= 4)
            {
               output.text("暂时撑开你的阴唇");
            }
            if(_loc1_.vaginas[0].vaginalLooseness > 4)
            {
               output.text("分开你已经张开的阴唇");
            }
            output.text("有什么东西开始顺着你的通道滑下。随着分娩的正式开始，一股绿色的粘液浸透了下面的地面，一颗颜色奇怪的卵的圆形表面在你的阴唇间露出来。你用力一推，大卵终于掉了出来，当它掉进粘液池时，你松了一口气。这种经历绝对让你兴奋，你感觉到你的阴蒂从包皮中长出来，另一颗大卵开始顺着你的产道往下走，令人愉悦地摩擦着你敏感的阴道壁。你喘息着呻吟着，宫缩将你紧紧地拉伸在下一颗卵周围，慢慢地将它从你的下体阴唇间挤出来。一声喘息声吓了你一跳，直到它掉出来，你才意识到那是你自己的声音在回应突然的压力和快感。你兴奋得无法理喻，开始自慰");
            if(_loc1_.getClitLength() > 5)
            {
               output.text("你那巨大的像鸡巴一样的阴蒂，用粘稠的分娩液作为润滑剂撸动它。它随着你的心跳跳动和抽搐，它敏感的表面用快感让你的脆弱神经超载。");
            }
            if(_loc1_.getClitLength() > 2 && _loc1_.getClitLength() <= 5)
            {
               output.text("你那像小鸡巴一样的大阴蒂，在你涂满粘液的拇指和食指之间上下抚摸它。它随着你的心跳抽搐和跳动，它令人难以置信的敏感度用一波波的快感让你的脆弱神经超载。");
            }
            if(_loc1_.getClitLength() <= 2)
            {
               output.text("你的" + _loc1_.vaginaDescript(0) + "，拉开你的阴唇，玩弄你的阴蒂。又一颗卵从你逐渐缩小的肚子中滑落，伴随着一声明显的如释重负的喘息。你把粘液涂抹开，发出湿润的摩擦声，用力地揉搓自己。");
            }
            output.text("你猛烈地高潮了，大卵在掉出来之前都让你的小穴张得大大的。你瘫倒在地，筋疲力尽，几乎因为高潮的力量而失去意识。");
            _loc1_.cuntChange(20,true);
            if(_loc1_.statusEffectv3(StatusEffects.Eggs) >= 11)
            {
               output.text("你肿胀的肚子似乎还没有放过你，又一颗卵挣扎着获得了自由。高潮后这么快就受到刺激，让你陷入了快感的昏迷中。如果现在有任何人或任何东西发现你，他们会看到你瘫倒在一堆卵旁边，你的手指描绘着你的" + _loc1_.vaginaDescript(0) + "的轮廓，越来越多的卵滑落出来。过了一会儿，你的理智恢复了，让你意识到终于结束了。");
            }
            output.text("[pg]你低头看着这一地狼藉，数了数，一共是" + eggDescript() + "。");
            _loc1_.orgasm("Vaginal");
            if(int([DynStat.NoScale].length) == 0)
            {
               KGAMECLASS.kGAMECLASS.player.dynStats();
            }
            else if(int([DynStat.NoScale].length) == 1)
            {
               KGAMECLASS.kGAMECLASS.player.dynStats([DynStat.NoScale][0]);
            }
            else if(int([DynStat.NoScale].length) == 2)
            {
               KGAMECLASS.kGAMECLASS.player.dynStats([DynStat.NoScale][0],[DynStat.NoScale][1]);
            }
            else if(int([DynStat.NoScale].length) == 3)
            {
               KGAMECLASS.kGAMECLASS.player.dynStats([DynStat.NoScale][0],[DynStat.NoScale][1],[DynStat.NoScale][2]);
            }
            else if(int([DynStat.NoScale].length) == 4)
            {
               KGAMECLASS.kGAMECLASS.player.dynStats([DynStat.NoScale][0],[DynStat.NoScale][1],[DynStat.NoScale][2],[DynStat.NoScale][3]);
            }
            else if(int([DynStat.NoScale].length) == 5)
            {
               KGAMECLASS.kGAMECLASS.player.dynStats([DynStat.NoScale][0],[DynStat.NoScale][1],[DynStat.NoScale][2],[DynStat.NoScale][3],[DynStat.NoScale][4]);
            }
            else if(int([DynStat.NoScale].length) == 6)
            {
               KGAMECLASS.kGAMECLASS.player.dynStats([DynStat.NoScale][0],[DynStat.NoScale][1],[DynStat.NoScale][2],[DynStat.NoScale][3],[DynStat.NoScale][4],[DynStat.NoScale][5]);
            }
            else if(int([DynStat.NoScale].length) == 7)
            {
               KGAMECLASS.kGAMECLASS.player.dynStats([DynStat.NoScale][0],[DynStat.NoScale][1],[DynStat.NoScale][2],[DynStat.NoScale][3],[DynStat.NoScale][4],[DynStat.NoScale][5],[DynStat.NoScale][6]);
            }
            else if(int([DynStat.NoScale].length) == 8)
            {
               KGAMECLASS.kGAMECLASS.player.dynStats([DynStat.NoScale][0],[DynStat.NoScale][1],[DynStat.NoScale][2],[DynStat.NoScale][3],[DynStat.NoScale][4],[DynStat.NoScale][5],[DynStat.NoScale][6],[DynStat.NoScale][7]);
            }
            else if(int([DynStat.NoScale].length) == 9)
            {
               KGAMECLASS.kGAMECLASS.player.dynStats([DynStat.NoScale][0],[DynStat.NoScale][1],[DynStat.NoScale][2],[DynStat.NoScale][3],[DynStat.NoScale][4],[DynStat.NoScale][5],[DynStat.NoScale][6],[DynStat.NoScale][7],[DynStat.NoScale][8]);
            }
            else if(int([DynStat.NoScale].length) == 10)
            {
               KGAMECLASS.kGAMECLASS.player.dynStats([DynStat.NoScale][0],[DynStat.NoScale][1],[DynStat.NoScale][2],[DynStat.NoScale][3],[DynStat.NoScale][4],[DynStat.NoScale][5],[DynStat.NoScale][6],[DynStat.NoScale][7],[DynStat.NoScale][8],[DynStat.NoScale][9]);
            }
            else if(int([DynStat.NoScale].length) == 11)
            {
               KGAMECLASS.kGAMECLASS.player.dynStats([DynStat.NoScale][0],[DynStat.NoScale][1],[DynStat.NoScale][2],[DynStat.NoScale][3],[DynStat.NoScale][4],[DynStat.NoScale][5],[DynStat.NoScale][6],[DynStat.NoScale][7],[DynStat.NoScale][8],[DynStat.NoScale][9],[DynStat.NoScale][10]);
            }
            else if(int([DynStat.NoScale].length) == 12)
            {
               KGAMECLASS.kGAMECLASS.player.dynStats([DynStat.NoScale][0],[DynStat.NoScale][1],[DynStat.NoScale][2],[DynStat.NoScale][3],[DynStat.NoScale][4],[DynStat.NoScale][5],[DynStat.NoScale][6],[DynStat.NoScale][7],[DynStat.NoScale][8],[DynStat.NoScale][9],[DynStat.NoScale][10],[DynStat.NoScale][11]);
            }
            else if(int([DynStat.NoScale].length) == 13)
            {
               KGAMECLASS.kGAMECLASS.player.dynStats([DynStat.NoScale][0],[DynStat.NoScale][1],[DynStat.NoScale][2],[DynStat.NoScale][3],[DynStat.NoScale][4],[DynStat.NoScale][5],[DynStat.NoScale][6],[DynStat.NoScale][7],[DynStat.NoScale][8],[DynStat.NoScale][9],[DynStat.NoScale][10],[DynStat.NoScale][11],[DynStat.NoScale][12]);
            }
            else if(int([DynStat.NoScale].length) == 14)
            {
               KGAMECLASS.kGAMECLASS.player.dynStats([DynStat.NoScale][0],[DynStat.NoScale][1],[DynStat.NoScale][2],[DynStat.NoScale][3],[DynStat.NoScale][4],[DynStat.NoScale][5],[DynStat.NoScale][6],[DynStat.NoScale][7],[DynStat.NoScale][8],[DynStat.NoScale][9],[DynStat.NoScale][10],[DynStat.NoScale][11],[DynStat.NoScale][12],[DynStat.NoScale][13]);
            }
            else if(int([DynStat.NoScale].length) == 15)
            {
               KGAMECLASS.kGAMECLASS.player.dynStats([DynStat.NoScale][0],[DynStat.NoScale][1],[DynStat.NoScale][2],[DynStat.NoScale][3],[DynStat.NoScale][4],[DynStat.NoScale][5],[DynStat.NoScale][6],[DynStat.NoScale][7],[DynStat.NoScale][8],[DynStat.NoScale][9],[DynStat.NoScale][10],[DynStat.NoScale][11],[DynStat.NoScale][12],[DynStat.NoScale][13],[DynStat.NoScale][14]);
            }
            else if(int([DynStat.NoScale].length) == 16)
            {
               KGAMECLASS.kGAMECLASS.player.dynStats([DynStat.NoScale][0],[DynStat.NoScale][1],[DynStat.NoScale][2],[DynStat.NoScale][3],[DynStat.NoScale][4],[DynStat.NoScale][5],[DynStat.NoScale][6],[DynStat.NoScale][7],[DynStat.NoScale][8],[DynStat.NoScale][9],[DynStat.NoScale][10],[DynStat.NoScale][11],[DynStat.NoScale][12],[DynStat.NoScale][13],[DynStat.NoScale][14],[DynStat.NoScale][15]);
            }
            else if(int([DynStat.NoScale].length) == 17)
            {
               KGAMECLASS.kGAMECLASS.player.dynStats([DynStat.NoScale][0],[DynStat.NoScale][1],[DynStat.NoScale][2],[DynStat.NoScale][3],[DynStat.NoScale][4],[DynStat.NoScale][5],[DynStat.NoScale][6],[DynStat.NoScale][7],[DynStat.NoScale][8],[DynStat.NoScale][9],[DynStat.NoScale][10],[DynStat.NoScale][11],[DynStat.NoScale][12],[DynStat.NoScale][13],[DynStat.NoScale][14],[DynStat.NoScale][15],[DynStat.NoScale][16]);
            }
            else if(int([DynStat.NoScale].length) == 18)
            {
               KGAMECLASS.kGAMECLASS.player.dynStats([DynStat.NoScale][0],[DynStat.NoScale][1],[DynStat.NoScale][2],[DynStat.NoScale][3],[DynStat.NoScale][4],[DynStat.NoScale][5],[DynStat.NoScale][6],[DynStat.NoScale][7],[DynStat.NoScale][8],[DynStat.NoScale][9],[DynStat.NoScale][10],[DynStat.NoScale][11],[DynStat.NoScale][12],[DynStat.NoScale][13],[DynStat.NoScale][14],[DynStat.NoScale][15],[DynStat.NoScale][16],[DynStat.NoScale][17]);
            }
            else if(int([DynStat.NoScale].length) == 19)
            {
               KGAMECLASS.kGAMECLASS.player.dynStats([DynStat.NoScale][0],[DynStat.NoScale][1],[DynStat.NoScale][2],[DynStat.NoScale][3],[DynStat.NoScale][4],[DynStat.NoScale][5],[DynStat.NoScale][6],[DynStat.NoScale][7],[DynStat.NoScale][8],[DynStat.NoScale][9],[DynStat.NoScale][10],[DynStat.NoScale][11],[DynStat.NoScale][12],[DynStat.NoScale][13],[DynStat.NoScale][14],[DynStat.NoScale][15],[DynStat.NoScale][16],[DynStat.NoScale][17],[DynStat.NoScale][18]);
            }
            else
            {
               if(int([DynStat.NoScale].length) != 20)
               {
                  throw "Too many rest arguments";
               }
               KGAMECLASS.kGAMECLASS.player.dynStats([DynStat.NoScale][0],[DynStat.NoScale][1],[DynStat.NoScale][2],[DynStat.NoScale][3],[DynStat.NoScale][4],[DynStat.NoScale][5],[DynStat.NoScale][6],[DynStat.NoScale][7],[DynStat.NoScale][8],[DynStat.NoScale][9],[DynStat.NoScale][10],[DynStat.NoScale][11],[DynStat.NoScale][12],[DynStat.NoScale][13],[DynStat.NoScale][14],[DynStat.NoScale][15],[DynStat.NoScale][16],[DynStat.NoScale][17],[DynStat.NoScale][18],[DynStat.NoScale][19]);
            }
         }
         if(_loc2_)
         {
            output.text("[pg](<b>获得特质：产卵</b>)");
            _loc1_.createPerk(PerkLib.Oviposition,0,0,0,0);
         }
         output.text("[pg]<b>你感到一种冲动，想要把这些蛋留下，");
         output.text("但你身体的直觉提醒你，它们应该是未受精的，而且你的肚子正饿得咕咕叫。</b>[pg]");
         _loc1_.createStatusEffect(StatusEffects.LootEgg,0,0,0,0);
         _loc1_.knockUpForce();
      }
      
      public function vaginaCheck() : Boolean
      {
         var _loc1_:Player = KGAMECLASS.kGAMECLASS.player;
         if(int(_loc1_.vaginas.length) == 0)
         {
            _loc1_.removeStatusEffect(StatusEffects.Eggs);
            output.text("<b>你怀孕的肚子突然开始缩小，直到完全消失。</b>[pg]");
            _loc1_.knockUpForce();
            return false;
         }
         return true;
      }
      
      public function updateVaginalPregnancy() : Boolean
      {
         return !vaginaCheck();
      }
      
      public function eggDescript(param1:Boolean = true) : String
      {
         var _loc2_:Player = KGAMECLASS.kGAMECLASS.player;
         var _loc3_:String = "";
         if(_loc2_.hasStatusEffect(StatusEffects.Eggs))
         {
            _loc3_ += Utils.num2Text(_loc2_.statusEffectv3(StatusEffects.Eggs)) + " ";
            if(_loc2_.statusEffectv2(StatusEffects.Eggs) == 1)
            {
               _loc3_ += "大大的";
            }
            if(_loc2_.statusEffectv1(StatusEffects.Eggs) == 0)
            {
               _loc3_ += "棕色的";
            }
            if(_loc2_.statusEffectv1(StatusEffects.Eggs) == 1)
            {
               _loc3_ += "紫色的";
            }
            if(_loc2_.statusEffectv1(StatusEffects.Eggs) == 2)
            {
               _loc3_ += "蓝色的";
            }
            if(_loc2_.statusEffectv1(StatusEffects.Eggs) == 3)
            {
               _loc3_ += "粉色的";
            }
            if(_loc2_.statusEffectv1(StatusEffects.Eggs) == 4)
            {
               _loc3_ += "白色的";
            }
            if(_loc2_.statusEffectv1(StatusEffects.Eggs) == 5)
            {
               _loc3_ += "橡胶般黑色的";
            }
            if(param1)
            {
               _loc3_ += "蛋";
            }
            else
            {
               _loc3_ += "蛋";
            }
            return _loc3_;
         }
         CoC_Settings.error("");
         return "蛋错误";
      }
   }
}

