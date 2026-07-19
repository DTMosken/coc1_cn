package classes.scenes.npcs.pregnancies
{
   import classes.Cock;
   import classes.CockTypesEnum;
   import classes.DynStat;
   import classes.Player;
   import classes.StatusEffects;
   import classes.Vagina;
   import classes._FlagDict.FlagDict_Impl_;
   import classes.globalFlags.KFLAGS;
   import classes.globalFlags.KGAMECLASS;
   import classes.internals.GuiOutput;
   import classes.internals.PregnancyUtils;
   import classes.internals.Utils;
   import classes.scenes.PregnancyProgression;
   import classes.scenes.VaginalPregnancy;
   import coc.view.CoCButton;
   import flash.Boot;
   
   public class PlayerAnemonePregnancy implements VaginalPregnancy
   {
      
      public var output:GuiOutput;
      
      public function PlayerAnemonePregnancy(param1:GuiOutput = undefined)
      {
         if(Boot.skip_constructor)
         {
            return;
         }
         output = param1;
         PregnancyProgression.registerVaginalPregnancyScene(25,10,this);
      }
      
      public function vaginalBirth() : void
      {
         var _loc1_:Player = KGAMECLASS.kGAMECLASS.player;
         KGAMECLASS.kGAMECLASS.images.showImage("birth-anemone");
         PregnancyUtils.createVaginaIfMissing(output,_loc1_);
         output.text("你的" + Utils.cnName(_loc1_.get_armorName()) + "在腹股沟周围感觉湿漉漉的，你伸手去检查那个区域。你摸到的" + _loc1_.vaginaDescript(0) + "扩张了，并且因为异常的湿润而变得光滑；你的羊水一定破了！[pg]");
         output.text("你急忙脱下装备，背靠着一块石头坐下。你集中精神，试图为分娩做准备；你努力回忆最近的伴侣，并担心你可能不得不从你的" + _loc1_.vaginaDescript(0) + "里挤出什么样的怪物婴儿。第一次宫缩来了，你用尽全力推，作为回报，你感觉到有什么东西从你的阴唇间滑了出来。你尝试再推几次，但似乎没有更多的东西出来；出于好奇，你低头看着你的胯部，却发现一根蓝色的茎骄傲地从你的阴道里伸出来！[pg]");
         if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,454) > 0)
         {
            output.text("当你看着眼前的景象时，尖端周围的小结节开始形成并变长，直到小海葵的顶部盖满了一团蠕动的蓝绿色触手。你惊恐万分，抓住它的底部，猛地一拉。当它粘稠的表面松开对你阴唇和" + _loc1_.clitDescript() + "的抓握时，剧痛让你僵住，几乎让你失去意识！它扭动着从你痛苦不堪的手中滑落，让你的手感到刺痛。当你躺在那里，惊呆了的时候，它开始慢慢向你的" + _loc1_.vaginaDescript(0) + "爬去。你旁边响起了脚步声，一只蓝色的手捡起了那个蠕动的、长满纤毛的生物。小A给了你一个害羞的微笑，然后转向她的木桶。伴随着一声轻快的泼水声和一个装满水的水袋，她带着你像蛆一样的后代走向了小溪。");
            _loc1_.cuntChange(20,true,true,false);
            output.text("[pg]分娩让你精疲力竭，但心中的重担终于卸下，你满怀感激地沉沉睡去。");
            _loc1_.knockUpForce();
            return;
         }
         if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,454) == 0 && (_loc1_.countCocksOfType(CockTypesEnum.ANEMONE) > 0 && _loc1_.isPureEnough(25)))
         {
            output.text("当你注视着这景象时，它顶端周围开始形成并伸长出小结节，直到这只小海葵的顶部覆盖着一团蠕动的蓝绿色触手。你惊恐万分，抓住它的底部猛地一拉。随之而来的是阴唇和" + _loc1_.clitDescript() + "的剧痛，让你浑身僵硬，几乎失去意识[if (hascock) {，而且因为你的[cocks]挡在中间，你根本使不上劲！|。}]海葵无力地脱落，但它扭动着从你因痛苦而颤抖的手中滑落，让你的双手感到一阵刺痛。当你惊呆地躺在那里时，它开始慢慢向你的" + _loc1_.vaginaDescript(0) + "爬去。它用触须虚弱地四处摸索，触碰到你的大腿，寻找着你小穴的入口。当那长满触手的冠部拂过你的阴唇时，一股毒液般的热流在你的胯下涌动，让你充满能量；你猛然清醒过来，看着这个荒谬的生物。你抬起手臂想拍打它，但有什么东西阻止了你的手。仿佛感觉到了你的犹豫，它直立起来，保持着立正的姿势等待检查。把它打飞很容易……然而，这个不起眼的小东西看起来如此骄傲，让你实在不忍心这么做。");
            output.text("[pg]你捞起这只小海葵，四处寻找潮湿的地方安置它。小溪太远了，湖泊更是遥不可及；你因为猛拉阴蒂而感到恶心，根本走不到那里。被逼无奈之下，你踉跄地走到营地的水桶旁，猛地掀开盖子，毫不客气地把这根蓝色的茎秆扔了进去。经历了这场磨难的震惊和痛苦，你精疲力竭地瘫倒在水桶旁，沉沉睡去……");
            _loc1_.cuntChange(20,true,true,false);
            output.text("[pg]");
            _loc1_.createStatusEffect(StatusEffects.CampAnemoneTrigger,0,0,0,0);
            _loc1_.knockUpForce();
            return;
         }
         if(_loc1_.cockTotal() < 10)
         {
            output.text("当你注视着这景象时，它顶端周围开始形成并伸长出小结节，直到这只小海葵的顶部覆盖着一团蠕动的蓝绿色触手。你惊恐万分，抓住它的底部猛地一拉。当它粘稠的表面松开对你阴唇和" + _loc1_.clitDescript() + "的抓附时，剧痛让你浑身僵硬，几乎失去意识！小海葵和你都躺在那里抽搐，但它先恢复了方向感；透过痛苦的迷雾，你看着它弯曲身体，把头部塞到身下，抬起底部。");
            _loc1_.cuntChange(20,true,true,false);
            output.text("[pg]你陷入了恐慌，眼睁睁地看着这个奇怪的东西将底部贴在你的耻骨丘上，并粘附在");
            if(_loc1_.cockTotal() > 0)
            {
               output.text("在你" + _loc1_.multiCockDescriptLight() + "的下方");
            }
            output.text("。一阵剧痛刺穿了你腹股沟的神经，让你条件反射般地伸手去抓它。这种较轻微的疼痛，加上终于驱散你脑海中迷雾的肾上腺素和多巴胺，足以让你集中注意力，再次尝试移除这个奇怪的寄生后代。你换了个姿势又拉扯了几次，但这东西纹丝不动。");
            FlagDict_Impl_.arrayWriteInt(KFLAGS.flags,800,1);
            KGAMECLASS.kGAMECLASS.output.menu();
            KGAMECLASS.kGAMECLASS.output.addNextButton("接受它",anemoneAccept).hint("你可不想把自己的耻骨撕裂。");
            KGAMECLASS.kGAMECLASS.output.addNextButton("撕下它",anemoneRip).hint("不惜一切代价移除。");
         }
         else
         {
            output.text("当你看着这一幕时，顶端周围的小结节开始形成并变长，直到小海葵的顶端长出了一簇蠕动的蓝绿色触手。你惊恐万分，抓住它的底部猛地一拉。随之而来的是阴唇和" + _loc1_.clitDescript() + "的剧痛，让你浑身僵硬，几乎失去意识，手上的力气也随之消散。海葵虚弱地脱落，但扭动着从你痛苦的抓握中滑落，让你的双手感到刺痛。当你躺在那里，惊魂未定的时候，它开始慢慢地向你的" + _loc1_.vaginaDescript(0) + "爬去。它用触须四处探索，触碰着你的大腿，寻找着你小穴的入口。当长满触手的冠部擦过你的阴唇时，一股毒热在你的胯下搅动，让你充满了能量；你恢复了力气，拍打着它，试图把这个小生物打走。你虚弱地打中了它几下，它似乎被激怒了，触手抓住你的阴唇，把茎部拉回你的胯下，然后钻进你的小穴。接着，你感觉到那东西在移动，紧贴着你的内壁，然后小海葵压在你的阴道壁上，让你感到一阵刺痛。这可不是什么好事。");
            _loc1_.cuntChange(20,true,true,false);
            output.text("[pg]无论你怎么用力，都无法让它再探出头来。更糟糕的是，热量并没有消退，因为触手现在已经卡在你的小穴里了！戳弄和拉扯你的" + _loc1_.vaginaDescript(0) + "只会让情况变得更糟；当你试图找回入侵者时，" + _loc1_.sMultiCockDesc() + "和你的阴蒂变硬了。随着你的阴道对你内壁的每一次抚摸产生痉挛，你的探索变得越来越微弱；每次你触摸这个生物，这种感觉都会直接传回你的神经。最终，你把自己推向了意外的高潮；你的" + _loc1_.vaginaDescript(0) + "在你的手指周围颤抖，你的" + _loc1_.multiCockDescriptLight() + "在几乎没有热身时间也没有直接刺激的情况下，尽其所能地射精。即使在高潮结束后，触手继续折磨着你的腹股沟。<b>有这个东西在你体内，你非常饥渴……虽然你够不到它，也许有办法把它挤出来？</b>[pg]");
            _loc1_.orgasm("Generic");
            if(int([DynStat.Lib(2),DynStat.Sens(5)].length) == 0)
            {
               KGAMECLASS.kGAMECLASS.player.dynStats();
            }
            else if(int([DynStat.Lib(2),DynStat.Sens(5)].length) == 1)
            {
               KGAMECLASS.kGAMECLASS.player.dynStats([DynStat.Lib(2),DynStat.Sens(5)][0]);
            }
            else if(int([DynStat.Lib(2),DynStat.Sens(5)].length) == 2)
            {
               KGAMECLASS.kGAMECLASS.player.dynStats([DynStat.Lib(2),DynStat.Sens(5)][0],[DynStat.Lib(2),DynStat.Sens(5)][1]);
            }
            else if(int([DynStat.Lib(2),DynStat.Sens(5)].length) == 3)
            {
               KGAMECLASS.kGAMECLASS.player.dynStats([DynStat.Lib(2),DynStat.Sens(5)][0],[DynStat.Lib(2),DynStat.Sens(5)][1],[DynStat.Lib(2),DynStat.Sens(5)][2]);
            }
            else if(int([DynStat.Lib(2),DynStat.Sens(5)].length) == 4)
            {
               KGAMECLASS.kGAMECLASS.player.dynStats([DynStat.Lib(2),DynStat.Sens(5)][0],[DynStat.Lib(2),DynStat.Sens(5)][1],[DynStat.Lib(2),DynStat.Sens(5)][2],[DynStat.Lib(2),DynStat.Sens(5)][3]);
            }
            else if(int([DynStat.Lib(2),DynStat.Sens(5)].length) == 5)
            {
               KGAMECLASS.kGAMECLASS.player.dynStats([DynStat.Lib(2),DynStat.Sens(5)][0],[DynStat.Lib(2),DynStat.Sens(5)][1],[DynStat.Lib(2),DynStat.Sens(5)][2],[DynStat.Lib(2),DynStat.Sens(5)][3],[DynStat.Lib(2),DynStat.Sens(5)][4]);
            }
            else if(int([DynStat.Lib(2),DynStat.Sens(5)].length) == 6)
            {
               KGAMECLASS.kGAMECLASS.player.dynStats([DynStat.Lib(2),DynStat.Sens(5)][0],[DynStat.Lib(2),DynStat.Sens(5)][1],[DynStat.Lib(2),DynStat.Sens(5)][2],[DynStat.Lib(2),DynStat.Sens(5)][3],[DynStat.Lib(2),DynStat.Sens(5)][4],[DynStat.Lib(2),DynStat.Sens(5)][5]);
            }
            else if(int([DynStat.Lib(2),DynStat.Sens(5)].length) == 7)
            {
               KGAMECLASS.kGAMECLASS.player.dynStats([DynStat.Lib(2),DynStat.Sens(5)][0],[DynStat.Lib(2),DynStat.Sens(5)][1],[DynStat.Lib(2),DynStat.Sens(5)][2],[DynStat.Lib(2),DynStat.Sens(5)][3],[DynStat.Lib(2),DynStat.Sens(5)][4],[DynStat.Lib(2),DynStat.Sens(5)][5],[DynStat.Lib(2),DynStat.Sens(5)][6]);
            }
            else if(int([DynStat.Lib(2),DynStat.Sens(5)].length) == 8)
            {
               KGAMECLASS.kGAMECLASS.player.dynStats([DynStat.Lib(2),DynStat.Sens(5)][0],[DynStat.Lib(2),DynStat.Sens(5)][1],[DynStat.Lib(2),DynStat.Sens(5)][2],[DynStat.Lib(2),DynStat.Sens(5)][3],[DynStat.Lib(2),DynStat.Sens(5)][4],[DynStat.Lib(2),DynStat.Sens(5)][5],[DynStat.Lib(2),DynStat.Sens(5)][6],[DynStat.Lib(2),DynStat.Sens(5)][7]);
            }
            else if(int([DynStat.Lib(2),DynStat.Sens(5)].length) == 9)
            {
               KGAMECLASS.kGAMECLASS.player.dynStats([DynStat.Lib(2),DynStat.Sens(5)][0],[DynStat.Lib(2),DynStat.Sens(5)][1],[DynStat.Lib(2),DynStat.Sens(5)][2],[DynStat.Lib(2),DynStat.Sens(5)][3],[DynStat.Lib(2),DynStat.Sens(5)][4],[DynStat.Lib(2),DynStat.Sens(5)][5],[DynStat.Lib(2),DynStat.Sens(5)][6],[DynStat.Lib(2),DynStat.Sens(5)][7],[DynStat.Lib(2),DynStat.Sens(5)][8]);
            }
            else if(int([DynStat.Lib(2),DynStat.Sens(5)].length) == 10)
            {
               KGAMECLASS.kGAMECLASS.player.dynStats([DynStat.Lib(2),DynStat.Sens(5)][0],[DynStat.Lib(2),DynStat.Sens(5)][1],[DynStat.Lib(2),DynStat.Sens(5)][2],[DynStat.Lib(2),DynStat.Sens(5)][3],[DynStat.Lib(2),DynStat.Sens(5)][4],[DynStat.Lib(2),DynStat.Sens(5)][5],[DynStat.Lib(2),DynStat.Sens(5)][6],[DynStat.Lib(2),DynStat.Sens(5)][7],[DynStat.Lib(2),DynStat.Sens(5)][8],[DynStat.Lib(2),DynStat.Sens(5)][9]);
            }
            else if(int([DynStat.Lib(2),DynStat.Sens(5)].length) == 11)
            {
               KGAMECLASS.kGAMECLASS.player.dynStats([DynStat.Lib(2),DynStat.Sens(5)][0],[DynStat.Lib(2),DynStat.Sens(5)][1],[DynStat.Lib(2),DynStat.Sens(5)][2],[DynStat.Lib(2),DynStat.Sens(5)][3],[DynStat.Lib(2),DynStat.Sens(5)][4],[DynStat.Lib(2),DynStat.Sens(5)][5],[DynStat.Lib(2),DynStat.Sens(5)][6],[DynStat.Lib(2),DynStat.Sens(5)][7],[DynStat.Lib(2),DynStat.Sens(5)][8],[DynStat.Lib(2),DynStat.Sens(5)][9],[DynStat.Lib(2),DynStat.Sens(5)][10]);
            }
            else if(int([DynStat.Lib(2),DynStat.Sens(5)].length) == 12)
            {
               KGAMECLASS.kGAMECLASS.player.dynStats([DynStat.Lib(2),DynStat.Sens(5)][0],[DynStat.Lib(2),DynStat.Sens(5)][1],[DynStat.Lib(2),DynStat.Sens(5)][2],[DynStat.Lib(2),DynStat.Sens(5)][3],[DynStat.Lib(2),DynStat.Sens(5)][4],[DynStat.Lib(2),DynStat.Sens(5)][5],[DynStat.Lib(2),DynStat.Sens(5)][6],[DynStat.Lib(2),DynStat.Sens(5)][7],[DynStat.Lib(2),DynStat.Sens(5)][8],[DynStat.Lib(2),DynStat.Sens(5)][9],[DynStat.Lib(2),DynStat.Sens(5)][10],[DynStat.Lib(2),DynStat.Sens(5)][11]);
            }
            else if(int([DynStat.Lib(2),DynStat.Sens(5)].length) == 13)
            {
               KGAMECLASS.kGAMECLASS.player.dynStats([DynStat.Lib(2),DynStat.Sens(5)][0],[DynStat.Lib(2),DynStat.Sens(5)][1],[DynStat.Lib(2),DynStat.Sens(5)][2],[DynStat.Lib(2),DynStat.Sens(5)][3],[DynStat.Lib(2),DynStat.Sens(5)][4],[DynStat.Lib(2),DynStat.Sens(5)][5],[DynStat.Lib(2),DynStat.Sens(5)][6],[DynStat.Lib(2),DynStat.Sens(5)][7],[DynStat.Lib(2),DynStat.Sens(5)][8],[DynStat.Lib(2),DynStat.Sens(5)][9],[DynStat.Lib(2),DynStat.Sens(5)][10],[DynStat.Lib(2),DynStat.Sens(5)][11],[DynStat.Lib(2),DynStat.Sens(5)][12]);
            }
            else if(int([DynStat.Lib(2),DynStat.Sens(5)].length) == 14)
            {
               KGAMECLASS.kGAMECLASS.player.dynStats([DynStat.Lib(2),DynStat.Sens(5)][0],[DynStat.Lib(2),DynStat.Sens(5)][1],[DynStat.Lib(2),DynStat.Sens(5)][2],[DynStat.Lib(2),DynStat.Sens(5)][3],[DynStat.Lib(2),DynStat.Sens(5)][4],[DynStat.Lib(2),DynStat.Sens(5)][5],[DynStat.Lib(2),DynStat.Sens(5)][6],[DynStat.Lib(2),DynStat.Sens(5)][7],[DynStat.Lib(2),DynStat.Sens(5)][8],[DynStat.Lib(2),DynStat.Sens(5)][9],[DynStat.Lib(2),DynStat.Sens(5)][10],[DynStat.Lib(2),DynStat.Sens(5)][11],[DynStat.Lib(2),DynStat.Sens(5)][12],[DynStat.Lib(2),DynStat.Sens(5)][13]);
            }
            else if(int([DynStat.Lib(2),DynStat.Sens(5)].length) == 15)
            {
               KGAMECLASS.kGAMECLASS.player.dynStats([DynStat.Lib(2),DynStat.Sens(5)][0],[DynStat.Lib(2),DynStat.Sens(5)][1],[DynStat.Lib(2),DynStat.Sens(5)][2],[DynStat.Lib(2),DynStat.Sens(5)][3],[DynStat.Lib(2),DynStat.Sens(5)][4],[DynStat.Lib(2),DynStat.Sens(5)][5],[DynStat.Lib(2),DynStat.Sens(5)][6],[DynStat.Lib(2),DynStat.Sens(5)][7],[DynStat.Lib(2),DynStat.Sens(5)][8],[DynStat.Lib(2),DynStat.Sens(5)][9],[DynStat.Lib(2),DynStat.Sens(5)][10],[DynStat.Lib(2),DynStat.Sens(5)][11],[DynStat.Lib(2),DynStat.Sens(5)][12],[DynStat.Lib(2),DynStat.Sens(5)][13],[DynStat.Lib(2),DynStat.Sens(5)][14]);
            }
            else if(int([DynStat.Lib(2),DynStat.Sens(5)].length) == 16)
            {
               KGAMECLASS.kGAMECLASS.player.dynStats([DynStat.Lib(2),DynStat.Sens(5)][0],[DynStat.Lib(2),DynStat.Sens(5)][1],[DynStat.Lib(2),DynStat.Sens(5)][2],[DynStat.Lib(2),DynStat.Sens(5)][3],[DynStat.Lib(2),DynStat.Sens(5)][4],[DynStat.Lib(2),DynStat.Sens(5)][5],[DynStat.Lib(2),DynStat.Sens(5)][6],[DynStat.Lib(2),DynStat.Sens(5)][7],[DynStat.Lib(2),DynStat.Sens(5)][8],[DynStat.Lib(2),DynStat.Sens(5)][9],[DynStat.Lib(2),DynStat.Sens(5)][10],[DynStat.Lib(2),DynStat.Sens(5)][11],[DynStat.Lib(2),DynStat.Sens(5)][12],[DynStat.Lib(2),DynStat.Sens(5)][13],[DynStat.Lib(2),DynStat.Sens(5)][14],[DynStat.Lib(2),DynStat.Sens(5)][15]);
            }
            else if(int([DynStat.Lib(2),DynStat.Sens(5)].length) == 17)
            {
               KGAMECLASS.kGAMECLASS.player.dynStats([DynStat.Lib(2),DynStat.Sens(5)][0],[DynStat.Lib(2),DynStat.Sens(5)][1],[DynStat.Lib(2),DynStat.Sens(5)][2],[DynStat.Lib(2),DynStat.Sens(5)][3],[DynStat.Lib(2),DynStat.Sens(5)][4],[DynStat.Lib(2),DynStat.Sens(5)][5],[DynStat.Lib(2),DynStat.Sens(5)][6],[DynStat.Lib(2),DynStat.Sens(5)][7],[DynStat.Lib(2),DynStat.Sens(5)][8],[DynStat.Lib(2),DynStat.Sens(5)][9],[DynStat.Lib(2),DynStat.Sens(5)][10],[DynStat.Lib(2),DynStat.Sens(5)][11],[DynStat.Lib(2),DynStat.Sens(5)][12],[DynStat.Lib(2),DynStat.Sens(5)][13],[DynStat.Lib(2),DynStat.Sens(5)][14],[DynStat.Lib(2),DynStat.Sens(5)][15],[DynStat.Lib(2),DynStat.Sens(5)][16]);
            }
            else if(int([DynStat.Lib(2),DynStat.Sens(5)].length) == 18)
            {
               KGAMECLASS.kGAMECLASS.player.dynStats([DynStat.Lib(2),DynStat.Sens(5)][0],[DynStat.Lib(2),DynStat.Sens(5)][1],[DynStat.Lib(2),DynStat.Sens(5)][2],[DynStat.Lib(2),DynStat.Sens(5)][3],[DynStat.Lib(2),DynStat.Sens(5)][4],[DynStat.Lib(2),DynStat.Sens(5)][5],[DynStat.Lib(2),DynStat.Sens(5)][6],[DynStat.Lib(2),DynStat.Sens(5)][7],[DynStat.Lib(2),DynStat.Sens(5)][8],[DynStat.Lib(2),DynStat.Sens(5)][9],[DynStat.Lib(2),DynStat.Sens(5)][10],[DynStat.Lib(2),DynStat.Sens(5)][11],[DynStat.Lib(2),DynStat.Sens(5)][12],[DynStat.Lib(2),DynStat.Sens(5)][13],[DynStat.Lib(2),DynStat.Sens(5)][14],[DynStat.Lib(2),DynStat.Sens(5)][15],[DynStat.Lib(2),DynStat.Sens(5)][16],[DynStat.Lib(2),DynStat.Sens(5)][17]);
            }
            else if(int([DynStat.Lib(2),DynStat.Sens(5)].length) == 19)
            {
               KGAMECLASS.kGAMECLASS.player.dynStats([DynStat.Lib(2),DynStat.Sens(5)][0],[DynStat.Lib(2),DynStat.Sens(5)][1],[DynStat.Lib(2),DynStat.Sens(5)][2],[DynStat.Lib(2),DynStat.Sens(5)][3],[DynStat.Lib(2),DynStat.Sens(5)][4],[DynStat.Lib(2),DynStat.Sens(5)][5],[DynStat.Lib(2),DynStat.Sens(5)][6],[DynStat.Lib(2),DynStat.Sens(5)][7],[DynStat.Lib(2),DynStat.Sens(5)][8],[DynStat.Lib(2),DynStat.Sens(5)][9],[DynStat.Lib(2),DynStat.Sens(5)][10],[DynStat.Lib(2),DynStat.Sens(5)][11],[DynStat.Lib(2),DynStat.Sens(5)][12],[DynStat.Lib(2),DynStat.Sens(5)][13],[DynStat.Lib(2),DynStat.Sens(5)][14],[DynStat.Lib(2),DynStat.Sens(5)][15],[DynStat.Lib(2),DynStat.Sens(5)][16],[DynStat.Lib(2),DynStat.Sens(5)][17],[DynStat.Lib(2),DynStat.Sens(5)][18]);
            }
            else
            {
               if(int([DynStat.Lib(2),DynStat.Sens(5)].length) != 20)
               {
                  throw "Too many rest arguments";
               }
               KGAMECLASS.kGAMECLASS.player.dynStats([DynStat.Lib(2),DynStat.Sens(5)][0],[DynStat.Lib(2),DynStat.Sens(5)][1],[DynStat.Lib(2),DynStat.Sens(5)][2],[DynStat.Lib(2),DynStat.Sens(5)][3],[DynStat.Lib(2),DynStat.Sens(5)][4],[DynStat.Lib(2),DynStat.Sens(5)][5],[DynStat.Lib(2),DynStat.Sens(5)][6],[DynStat.Lib(2),DynStat.Sens(5)][7],[DynStat.Lib(2),DynStat.Sens(5)][8],[DynStat.Lib(2),DynStat.Sens(5)][9],[DynStat.Lib(2),DynStat.Sens(5)][10],[DynStat.Lib(2),DynStat.Sens(5)][11],[DynStat.Lib(2),DynStat.Sens(5)][12],[DynStat.Lib(2),DynStat.Sens(5)][13],[DynStat.Lib(2),DynStat.Sens(5)][14],[DynStat.Lib(2),DynStat.Sens(5)][15],[DynStat.Lib(2),DynStat.Sens(5)][16],[DynStat.Lib(2),DynStat.Sens(5)][17],[DynStat.Lib(2),DynStat.Sens(5)][18],[DynStat.Lib(2),DynStat.Sens(5)][19]);
            }
            if(!_loc1_.hasStatusEffect(StatusEffects.AnemoneArousal))
            {
               _loc1_.createStatusEffect(StatusEffects.AnemoneArousal,0,0,0,0);
            }
         }
         _loc1_.knockUpForce();
         output.text("在经历了“分娩”和高潮的疲惫之后，你陷入了沉睡。[pg]");
      }
      
      public function updateVaginalPregnancy() : Boolean
      {
         var _loc1_:Player = KGAMECLASS.kGAMECLASS.player;
         var _loc2_:Boolean = false;
         if(_loc1_.get_pregnancyIncubation() == 240)
         {
            output.text("<b>你感觉到体内有什么东西在移动。你开始觉得你可能怀孕了。</b>[pg]");
            _loc2_ = true;
         }
         if(_loc1_.get_pregnancyIncubation() == 210)
         {
            output.text("<b>你体内的悸动感越来越强烈，也越来越频繁。有时甚至感觉像是子宫内膜在刺痛。</b>[pg]");
            if(int([DynStat.Lust(5 + _loc1_.lib / 20)].length) == 0)
            {
               KGAMECLASS.kGAMECLASS.player.dynStats();
            }
            else if(int([DynStat.Lust(5 + _loc1_.lib / 20)].length) == 1)
            {
               KGAMECLASS.kGAMECLASS.player.dynStats([DynStat.Lust(5 + _loc1_.lib / 20)][0]);
            }
            else if(int([DynStat.Lust(5 + _loc1_.lib / 20)].length) == 2)
            {
               KGAMECLASS.kGAMECLASS.player.dynStats([DynStat.Lust(5 + _loc1_.lib / 20)][0],[DynStat.Lust(5 + _loc1_.lib / 20)][1]);
            }
            else if(int([DynStat.Lust(5 + _loc1_.lib / 20)].length) == 3)
            {
               KGAMECLASS.kGAMECLASS.player.dynStats([DynStat.Lust(5 + _loc1_.lib / 20)][0],[DynStat.Lust(5 + _loc1_.lib / 20)][1],[DynStat.Lust(5 + _loc1_.lib / 20)][2]);
            }
            else if(int([DynStat.Lust(5 + _loc1_.lib / 20)].length) == 4)
            {
               KGAMECLASS.kGAMECLASS.player.dynStats([DynStat.Lust(5 + _loc1_.lib / 20)][0],[DynStat.Lust(5 + _loc1_.lib / 20)][1],[DynStat.Lust(5 + _loc1_.lib / 20)][2],[DynStat.Lust(5 + _loc1_.lib / 20)][3]);
            }
            else if(int([DynStat.Lust(5 + _loc1_.lib / 20)].length) == 5)
            {
               KGAMECLASS.kGAMECLASS.player.dynStats([DynStat.Lust(5 + _loc1_.lib / 20)][0],[DynStat.Lust(5 + _loc1_.lib / 20)][1],[DynStat.Lust(5 + _loc1_.lib / 20)][2],[DynStat.Lust(5 + _loc1_.lib / 20)][3],[DynStat.Lust(5 + _loc1_.lib / 20)][4]);
            }
            else if(int([DynStat.Lust(5 + _loc1_.lib / 20)].length) == 6)
            {
               KGAMECLASS.kGAMECLASS.player.dynStats([DynStat.Lust(5 + _loc1_.lib / 20)][0],[DynStat.Lust(5 + _loc1_.lib / 20)][1],[DynStat.Lust(5 + _loc1_.lib / 20)][2],[DynStat.Lust(5 + _loc1_.lib / 20)][3],[DynStat.Lust(5 + _loc1_.lib / 20)][4],[DynStat.Lust(5 + _loc1_.lib / 20)][5]);
            }
            else if(int([DynStat.Lust(5 + _loc1_.lib / 20)].length) == 7)
            {
               KGAMECLASS.kGAMECLASS.player.dynStats([DynStat.Lust(5 + _loc1_.lib / 20)][0],[DynStat.Lust(5 + _loc1_.lib / 20)][1],[DynStat.Lust(5 + _loc1_.lib / 20)][2],[DynStat.Lust(5 + _loc1_.lib / 20)][3],[DynStat.Lust(5 + _loc1_.lib / 20)][4],[DynStat.Lust(5 + _loc1_.lib / 20)][5],[DynStat.Lust(5 + _loc1_.lib / 20)][6]);
            }
            else if(int([DynStat.Lust(5 + _loc1_.lib / 20)].length) == 8)
            {
               KGAMECLASS.kGAMECLASS.player.dynStats([DynStat.Lust(5 + _loc1_.lib / 20)][0],[DynStat.Lust(5 + _loc1_.lib / 20)][1],[DynStat.Lust(5 + _loc1_.lib / 20)][2],[DynStat.Lust(5 + _loc1_.lib / 20)][3],[DynStat.Lust(5 + _loc1_.lib / 20)][4],[DynStat.Lust(5 + _loc1_.lib / 20)][5],[DynStat.Lust(5 + _loc1_.lib / 20)][6],[DynStat.Lust(5 + _loc1_.lib / 20)][7]);
            }
            else if(int([DynStat.Lust(5 + _loc1_.lib / 20)].length) == 9)
            {
               KGAMECLASS.kGAMECLASS.player.dynStats([DynStat.Lust(5 + _loc1_.lib / 20)][0],[DynStat.Lust(5 + _loc1_.lib / 20)][1],[DynStat.Lust(5 + _loc1_.lib / 20)][2],[DynStat.Lust(5 + _loc1_.lib / 20)][3],[DynStat.Lust(5 + _loc1_.lib / 20)][4],[DynStat.Lust(5 + _loc1_.lib / 20)][5],[DynStat.Lust(5 + _loc1_.lib / 20)][6],[DynStat.Lust(5 + _loc1_.lib / 20)][7],[DynStat.Lust(5 + _loc1_.lib / 20)][8]);
            }
            else if(int([DynStat.Lust(5 + _loc1_.lib / 20)].length) == 10)
            {
               KGAMECLASS.kGAMECLASS.player.dynStats([DynStat.Lust(5 + _loc1_.lib / 20)][0],[DynStat.Lust(5 + _loc1_.lib / 20)][1],[DynStat.Lust(5 + _loc1_.lib / 20)][2],[DynStat.Lust(5 + _loc1_.lib / 20)][3],[DynStat.Lust(5 + _loc1_.lib / 20)][4],[DynStat.Lust(5 + _loc1_.lib / 20)][5],[DynStat.Lust(5 + _loc1_.lib / 20)][6],[DynStat.Lust(5 + _loc1_.lib / 20)][7],[DynStat.Lust(5 + _loc1_.lib / 20)][8],[DynStat.Lust(5 + _loc1_.lib / 20)][9]);
            }
            else if(int([DynStat.Lust(5 + _loc1_.lib / 20)].length) == 11)
            {
               KGAMECLASS.kGAMECLASS.player.dynStats([DynStat.Lust(5 + _loc1_.lib / 20)][0],[DynStat.Lust(5 + _loc1_.lib / 20)][1],[DynStat.Lust(5 + _loc1_.lib / 20)][2],[DynStat.Lust(5 + _loc1_.lib / 20)][3],[DynStat.Lust(5 + _loc1_.lib / 20)][4],[DynStat.Lust(5 + _loc1_.lib / 20)][5],[DynStat.Lust(5 + _loc1_.lib / 20)][6],[DynStat.Lust(5 + _loc1_.lib / 20)][7],[DynStat.Lust(5 + _loc1_.lib / 20)][8],[DynStat.Lust(5 + _loc1_.lib / 20)][9],[DynStat.Lust(5 + _loc1_.lib / 20)][10]);
            }
            else if(int([DynStat.Lust(5 + _loc1_.lib / 20)].length) == 12)
            {
               KGAMECLASS.kGAMECLASS.player.dynStats([DynStat.Lust(5 + _loc1_.lib / 20)][0],[DynStat.Lust(5 + _loc1_.lib / 20)][1],[DynStat.Lust(5 + _loc1_.lib / 20)][2],[DynStat.Lust(5 + _loc1_.lib / 20)][3],[DynStat.Lust(5 + _loc1_.lib / 20)][4],[DynStat.Lust(5 + _loc1_.lib / 20)][5],[DynStat.Lust(5 + _loc1_.lib / 20)][6],[DynStat.Lust(5 + _loc1_.lib / 20)][7],[DynStat.Lust(5 + _loc1_.lib / 20)][8],[DynStat.Lust(5 + _loc1_.lib / 20)][9],[DynStat.Lust(5 + _loc1_.lib / 20)][10],[DynStat.Lust(5 + _loc1_.lib / 20)][11]);
            }
            else if(int([DynStat.Lust(5 + _loc1_.lib / 20)].length) == 13)
            {
               KGAMECLASS.kGAMECLASS.player.dynStats([DynStat.Lust(5 + _loc1_.lib / 20)][0],[DynStat.Lust(5 + _loc1_.lib / 20)][1],[DynStat.Lust(5 + _loc1_.lib / 20)][2],[DynStat.Lust(5 + _loc1_.lib / 20)][3],[DynStat.Lust(5 + _loc1_.lib / 20)][4],[DynStat.Lust(5 + _loc1_.lib / 20)][5],[DynStat.Lust(5 + _loc1_.lib / 20)][6],[DynStat.Lust(5 + _loc1_.lib / 20)][7],[DynStat.Lust(5 + _loc1_.lib / 20)][8],[DynStat.Lust(5 + _loc1_.lib / 20)][9],[DynStat.Lust(5 + _loc1_.lib / 20)][10],[DynStat.Lust(5 + _loc1_.lib / 20)][11],[DynStat.Lust(5 + _loc1_.lib / 20)][12]);
            }
            else if(int([DynStat.Lust(5 + _loc1_.lib / 20)].length) == 14)
            {
               KGAMECLASS.kGAMECLASS.player.dynStats([DynStat.Lust(5 + _loc1_.lib / 20)][0],[DynStat.Lust(5 + _loc1_.lib / 20)][1],[DynStat.Lust(5 + _loc1_.lib / 20)][2],[DynStat.Lust(5 + _loc1_.lib / 20)][3],[DynStat.Lust(5 + _loc1_.lib / 20)][4],[DynStat.Lust(5 + _loc1_.lib / 20)][5],[DynStat.Lust(5 + _loc1_.lib / 20)][6],[DynStat.Lust(5 + _loc1_.lib / 20)][7],[DynStat.Lust(5 + _loc1_.lib / 20)][8],[DynStat.Lust(5 + _loc1_.lib / 20)][9],[DynStat.Lust(5 + _loc1_.lib / 20)][10],[DynStat.Lust(5 + _loc1_.lib / 20)][11],[DynStat.Lust(5 + _loc1_.lib / 20)][12],[DynStat.Lust(5 + _loc1_.lib / 20)][13]);
            }
            else if(int([DynStat.Lust(5 + _loc1_.lib / 20)].length) == 15)
            {
               KGAMECLASS.kGAMECLASS.player.dynStats([DynStat.Lust(5 + _loc1_.lib / 20)][0],[DynStat.Lust(5 + _loc1_.lib / 20)][1],[DynStat.Lust(5 + _loc1_.lib / 20)][2],[DynStat.Lust(5 + _loc1_.lib / 20)][3],[DynStat.Lust(5 + _loc1_.lib / 20)][4],[DynStat.Lust(5 + _loc1_.lib / 20)][5],[DynStat.Lust(5 + _loc1_.lib / 20)][6],[DynStat.Lust(5 + _loc1_.lib / 20)][7],[DynStat.Lust(5 + _loc1_.lib / 20)][8],[DynStat.Lust(5 + _loc1_.lib / 20)][9],[DynStat.Lust(5 + _loc1_.lib / 20)][10],[DynStat.Lust(5 + _loc1_.lib / 20)][11],[DynStat.Lust(5 + _loc1_.lib / 20)][12],[DynStat.Lust(5 + _loc1_.lib / 20)][13],[DynStat.Lust(5 + _loc1_.lib / 20)][14]);
            }
            else if(int([DynStat.Lust(5 + _loc1_.lib / 20)].length) == 16)
            {
               KGAMECLASS.kGAMECLASS.player.dynStats([DynStat.Lust(5 + _loc1_.lib / 20)][0],[DynStat.Lust(5 + _loc1_.lib / 20)][1],[DynStat.Lust(5 + _loc1_.lib / 20)][2],[DynStat.Lust(5 + _loc1_.lib / 20)][3],[DynStat.Lust(5 + _loc1_.lib / 20)][4],[DynStat.Lust(5 + _loc1_.lib / 20)][5],[DynStat.Lust(5 + _loc1_.lib / 20)][6],[DynStat.Lust(5 + _loc1_.lib / 20)][7],[DynStat.Lust(5 + _loc1_.lib / 20)][8],[DynStat.Lust(5 + _loc1_.lib / 20)][9],[DynStat.Lust(5 + _loc1_.lib / 20)][10],[DynStat.Lust(5 + _loc1_.lib / 20)][11],[DynStat.Lust(5 + _loc1_.lib / 20)][12],[DynStat.Lust(5 + _loc1_.lib / 20)][13],[DynStat.Lust(5 + _loc1_.lib / 20)][14],[DynStat.Lust(5 + _loc1_.lib / 20)][15]);
            }
            else if(int([DynStat.Lust(5 + _loc1_.lib / 20)].length) == 17)
            {
               KGAMECLASS.kGAMECLASS.player.dynStats([DynStat.Lust(5 + _loc1_.lib / 20)][0],[DynStat.Lust(5 + _loc1_.lib / 20)][1],[DynStat.Lust(5 + _loc1_.lib / 20)][2],[DynStat.Lust(5 + _loc1_.lib / 20)][3],[DynStat.Lust(5 + _loc1_.lib / 20)][4],[DynStat.Lust(5 + _loc1_.lib / 20)][5],[DynStat.Lust(5 + _loc1_.lib / 20)][6],[DynStat.Lust(5 + _loc1_.lib / 20)][7],[DynStat.Lust(5 + _loc1_.lib / 20)][8],[DynStat.Lust(5 + _loc1_.lib / 20)][9],[DynStat.Lust(5 + _loc1_.lib / 20)][10],[DynStat.Lust(5 + _loc1_.lib / 20)][11],[DynStat.Lust(5 + _loc1_.lib / 20)][12],[DynStat.Lust(5 + _loc1_.lib / 20)][13],[DynStat.Lust(5 + _loc1_.lib / 20)][14],[DynStat.Lust(5 + _loc1_.lib / 20)][15],[DynStat.Lust(5 + _loc1_.lib / 20)][16]);
            }
            else if(int([DynStat.Lust(5 + _loc1_.lib / 20)].length) == 18)
            {
               KGAMECLASS.kGAMECLASS.player.dynStats([DynStat.Lust(5 + _loc1_.lib / 20)][0],[DynStat.Lust(5 + _loc1_.lib / 20)][1],[DynStat.Lust(5 + _loc1_.lib / 20)][2],[DynStat.Lust(5 + _loc1_.lib / 20)][3],[DynStat.Lust(5 + _loc1_.lib / 20)][4],[DynStat.Lust(5 + _loc1_.lib / 20)][5],[DynStat.Lust(5 + _loc1_.lib / 20)][6],[DynStat.Lust(5 + _loc1_.lib / 20)][7],[DynStat.Lust(5 + _loc1_.lib / 20)][8],[DynStat.Lust(5 + _loc1_.lib / 20)][9],[DynStat.Lust(5 + _loc1_.lib / 20)][10],[DynStat.Lust(5 + _loc1_.lib / 20)][11],[DynStat.Lust(5 + _loc1_.lib / 20)][12],[DynStat.Lust(5 + _loc1_.lib / 20)][13],[DynStat.Lust(5 + _loc1_.lib / 20)][14],[DynStat.Lust(5 + _loc1_.lib / 20)][15],[DynStat.Lust(5 + _loc1_.lib / 20)][16],[DynStat.Lust(5 + _loc1_.lib / 20)][17]);
            }
            else if(int([DynStat.Lust(5 + _loc1_.lib / 20)].length) == 19)
            {
               KGAMECLASS.kGAMECLASS.player.dynStats([DynStat.Lust(5 + _loc1_.lib / 20)][0],[DynStat.Lust(5 + _loc1_.lib / 20)][1],[DynStat.Lust(5 + _loc1_.lib / 20)][2],[DynStat.Lust(5 + _loc1_.lib / 20)][3],[DynStat.Lust(5 + _loc1_.lib / 20)][4],[DynStat.Lust(5 + _loc1_.lib / 20)][5],[DynStat.Lust(5 + _loc1_.lib / 20)][6],[DynStat.Lust(5 + _loc1_.lib / 20)][7],[DynStat.Lust(5 + _loc1_.lib / 20)][8],[DynStat.Lust(5 + _loc1_.lib / 20)][9],[DynStat.Lust(5 + _loc1_.lib / 20)][10],[DynStat.Lust(5 + _loc1_.lib / 20)][11],[DynStat.Lust(5 + _loc1_.lib / 20)][12],[DynStat.Lust(5 + _loc1_.lib / 20)][13],[DynStat.Lust(5 + _loc1_.lib / 20)][14],[DynStat.Lust(5 + _loc1_.lib / 20)][15],[DynStat.Lust(5 + _loc1_.lib / 20)][16],[DynStat.Lust(5 + _loc1_.lib / 20)][17],[DynStat.Lust(5 + _loc1_.lib / 20)][18]);
            }
            else
            {
               if(int([DynStat.Lust(5 + _loc1_.lib / 20)].length) != 20)
               {
                  throw "Too many rest arguments";
               }
               KGAMECLASS.kGAMECLASS.player.dynStats([DynStat.Lust(5 + _loc1_.lib / 20)][0],[DynStat.Lust(5 + _loc1_.lib / 20)][1],[DynStat.Lust(5 + _loc1_.lib / 20)][2],[DynStat.Lust(5 + _loc1_.lib / 20)][3],[DynStat.Lust(5 + _loc1_.lib / 20)][4],[DynStat.Lust(5 + _loc1_.lib / 20)][5],[DynStat.Lust(5 + _loc1_.lib / 20)][6],[DynStat.Lust(5 + _loc1_.lib / 20)][7],[DynStat.Lust(5 + _loc1_.lib / 20)][8],[DynStat.Lust(5 + _loc1_.lib / 20)][9],[DynStat.Lust(5 + _loc1_.lib / 20)][10],[DynStat.Lust(5 + _loc1_.lib / 20)][11],[DynStat.Lust(5 + _loc1_.lib / 20)][12],[DynStat.Lust(5 + _loc1_.lib / 20)][13],[DynStat.Lust(5 + _loc1_.lib / 20)][14],[DynStat.Lust(5 + _loc1_.lib / 20)][15],[DynStat.Lust(5 + _loc1_.lib / 20)][16],[DynStat.Lust(5 + _loc1_.lib / 20)][17],[DynStat.Lust(5 + _loc1_.lib / 20)][18],[DynStat.Lust(5 + _loc1_.lib / 20)][19]);
            }
            _loc2_ = true;
         }
         if(_loc1_.get_pregnancyIncubation() == 185)
         {
            output.text("<b>你肚子上怀孕的隆起已经清晰可见。");
            if(_loc1_.cor < 40)
            {
               output.text("你对这意外的怀孕感到苦恼，也对自己无法将这东西排出体外感到无力。</b>");
            }
            if(_loc1_.cor >= 40 && _loc1_.cor < 75)
            {
               output.text("考虑到可能的父亲，你希望它不要太大。</b>");
            }
            if(_loc1_.cor >= 75)
            {
               output.text("你梦幻般地回想着最近操过你的那些肉棒，并希望你的后代能继承这样神圣的欢愉工具。</b>");
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
         if(_loc1_.get_pregnancyIncubation() == 154)
         {
            output.text("<b>子宫内突然传来的强烈胎动让你吓了一跳。</b>[pg]");
            _loc2_ = true;
         }
         if(_loc1_.get_pregnancyIncubation() == 120)
         {
            output.text("<b>你那巨大、蠕动的肚子让周围的人都能明显看出你怀孕了");
            if(_loc1_.hasVagina())
            {
               output.text(" 并且子宫里持续不断的刺痛感让你的" + _loc1_.vaginaDescript(0) + "一直处于发情状态");
            }
            output.text("。</b>[pg]");
            if(int([DynStat.Lust(10 + _loc1_.lib / 20)].length) == 0)
            {
               KGAMECLASS.kGAMECLASS.player.dynStats();
            }
            else if(int([DynStat.Lust(10 + _loc1_.lib / 20)].length) == 1)
            {
               KGAMECLASS.kGAMECLASS.player.dynStats([DynStat.Lust(10 + _loc1_.lib / 20)][0]);
            }
            else if(int([DynStat.Lust(10 + _loc1_.lib / 20)].length) == 2)
            {
               KGAMECLASS.kGAMECLASS.player.dynStats([DynStat.Lust(10 + _loc1_.lib / 20)][0],[DynStat.Lust(10 + _loc1_.lib / 20)][1]);
            }
            else if(int([DynStat.Lust(10 + _loc1_.lib / 20)].length) == 3)
            {
               KGAMECLASS.kGAMECLASS.player.dynStats([DynStat.Lust(10 + _loc1_.lib / 20)][0],[DynStat.Lust(10 + _loc1_.lib / 20)][1],[DynStat.Lust(10 + _loc1_.lib / 20)][2]);
            }
            else if(int([DynStat.Lust(10 + _loc1_.lib / 20)].length) == 4)
            {
               KGAMECLASS.kGAMECLASS.player.dynStats([DynStat.Lust(10 + _loc1_.lib / 20)][0],[DynStat.Lust(10 + _loc1_.lib / 20)][1],[DynStat.Lust(10 + _loc1_.lib / 20)][2],[DynStat.Lust(10 + _loc1_.lib / 20)][3]);
            }
            else if(int([DynStat.Lust(10 + _loc1_.lib / 20)].length) == 5)
            {
               KGAMECLASS.kGAMECLASS.player.dynStats([DynStat.Lust(10 + _loc1_.lib / 20)][0],[DynStat.Lust(10 + _loc1_.lib / 20)][1],[DynStat.Lust(10 + _loc1_.lib / 20)][2],[DynStat.Lust(10 + _loc1_.lib / 20)][3],[DynStat.Lust(10 + _loc1_.lib / 20)][4]);
            }
            else if(int([DynStat.Lust(10 + _loc1_.lib / 20)].length) == 6)
            {
               KGAMECLASS.kGAMECLASS.player.dynStats([DynStat.Lust(10 + _loc1_.lib / 20)][0],[DynStat.Lust(10 + _loc1_.lib / 20)][1],[DynStat.Lust(10 + _loc1_.lib / 20)][2],[DynStat.Lust(10 + _loc1_.lib / 20)][3],[DynStat.Lust(10 + _loc1_.lib / 20)][4],[DynStat.Lust(10 + _loc1_.lib / 20)][5]);
            }
            else if(int([DynStat.Lust(10 + _loc1_.lib / 20)].length) == 7)
            {
               KGAMECLASS.kGAMECLASS.player.dynStats([DynStat.Lust(10 + _loc1_.lib / 20)][0],[DynStat.Lust(10 + _loc1_.lib / 20)][1],[DynStat.Lust(10 + _loc1_.lib / 20)][2],[DynStat.Lust(10 + _loc1_.lib / 20)][3],[DynStat.Lust(10 + _loc1_.lib / 20)][4],[DynStat.Lust(10 + _loc1_.lib / 20)][5],[DynStat.Lust(10 + _loc1_.lib / 20)][6]);
            }
            else if(int([DynStat.Lust(10 + _loc1_.lib / 20)].length) == 8)
            {
               KGAMECLASS.kGAMECLASS.player.dynStats([DynStat.Lust(10 + _loc1_.lib / 20)][0],[DynStat.Lust(10 + _loc1_.lib / 20)][1],[DynStat.Lust(10 + _loc1_.lib / 20)][2],[DynStat.Lust(10 + _loc1_.lib / 20)][3],[DynStat.Lust(10 + _loc1_.lib / 20)][4],[DynStat.Lust(10 + _loc1_.lib / 20)][5],[DynStat.Lust(10 + _loc1_.lib / 20)][6],[DynStat.Lust(10 + _loc1_.lib / 20)][7]);
            }
            else if(int([DynStat.Lust(10 + _loc1_.lib / 20)].length) == 9)
            {
               KGAMECLASS.kGAMECLASS.player.dynStats([DynStat.Lust(10 + _loc1_.lib / 20)][0],[DynStat.Lust(10 + _loc1_.lib / 20)][1],[DynStat.Lust(10 + _loc1_.lib / 20)][2],[DynStat.Lust(10 + _loc1_.lib / 20)][3],[DynStat.Lust(10 + _loc1_.lib / 20)][4],[DynStat.Lust(10 + _loc1_.lib / 20)][5],[DynStat.Lust(10 + _loc1_.lib / 20)][6],[DynStat.Lust(10 + _loc1_.lib / 20)][7],[DynStat.Lust(10 + _loc1_.lib / 20)][8]);
            }
            else if(int([DynStat.Lust(10 + _loc1_.lib / 20)].length) == 10)
            {
               KGAMECLASS.kGAMECLASS.player.dynStats([DynStat.Lust(10 + _loc1_.lib / 20)][0],[DynStat.Lust(10 + _loc1_.lib / 20)][1],[DynStat.Lust(10 + _loc1_.lib / 20)][2],[DynStat.Lust(10 + _loc1_.lib / 20)][3],[DynStat.Lust(10 + _loc1_.lib / 20)][4],[DynStat.Lust(10 + _loc1_.lib / 20)][5],[DynStat.Lust(10 + _loc1_.lib / 20)][6],[DynStat.Lust(10 + _loc1_.lib / 20)][7],[DynStat.Lust(10 + _loc1_.lib / 20)][8],[DynStat.Lust(10 + _loc1_.lib / 20)][9]);
            }
            else if(int([DynStat.Lust(10 + _loc1_.lib / 20)].length) == 11)
            {
               KGAMECLASS.kGAMECLASS.player.dynStats([DynStat.Lust(10 + _loc1_.lib / 20)][0],[DynStat.Lust(10 + _loc1_.lib / 20)][1],[DynStat.Lust(10 + _loc1_.lib / 20)][2],[DynStat.Lust(10 + _loc1_.lib / 20)][3],[DynStat.Lust(10 + _loc1_.lib / 20)][4],[DynStat.Lust(10 + _loc1_.lib / 20)][5],[DynStat.Lust(10 + _loc1_.lib / 20)][6],[DynStat.Lust(10 + _loc1_.lib / 20)][7],[DynStat.Lust(10 + _loc1_.lib / 20)][8],[DynStat.Lust(10 + _loc1_.lib / 20)][9],[DynStat.Lust(10 + _loc1_.lib / 20)][10]);
            }
            else if(int([DynStat.Lust(10 + _loc1_.lib / 20)].length) == 12)
            {
               KGAMECLASS.kGAMECLASS.player.dynStats([DynStat.Lust(10 + _loc1_.lib / 20)][0],[DynStat.Lust(10 + _loc1_.lib / 20)][1],[DynStat.Lust(10 + _loc1_.lib / 20)][2],[DynStat.Lust(10 + _loc1_.lib / 20)][3],[DynStat.Lust(10 + _loc1_.lib / 20)][4],[DynStat.Lust(10 + _loc1_.lib / 20)][5],[DynStat.Lust(10 + _loc1_.lib / 20)][6],[DynStat.Lust(10 + _loc1_.lib / 20)][7],[DynStat.Lust(10 + _loc1_.lib / 20)][8],[DynStat.Lust(10 + _loc1_.lib / 20)][9],[DynStat.Lust(10 + _loc1_.lib / 20)][10],[DynStat.Lust(10 + _loc1_.lib / 20)][11]);
            }
            else if(int([DynStat.Lust(10 + _loc1_.lib / 20)].length) == 13)
            {
               KGAMECLASS.kGAMECLASS.player.dynStats([DynStat.Lust(10 + _loc1_.lib / 20)][0],[DynStat.Lust(10 + _loc1_.lib / 20)][1],[DynStat.Lust(10 + _loc1_.lib / 20)][2],[DynStat.Lust(10 + _loc1_.lib / 20)][3],[DynStat.Lust(10 + _loc1_.lib / 20)][4],[DynStat.Lust(10 + _loc1_.lib / 20)][5],[DynStat.Lust(10 + _loc1_.lib / 20)][6],[DynStat.Lust(10 + _loc1_.lib / 20)][7],[DynStat.Lust(10 + _loc1_.lib / 20)][8],[DynStat.Lust(10 + _loc1_.lib / 20)][9],[DynStat.Lust(10 + _loc1_.lib / 20)][10],[DynStat.Lust(10 + _loc1_.lib / 20)][11],[DynStat.Lust(10 + _loc1_.lib / 20)][12]);
            }
            else if(int([DynStat.Lust(10 + _loc1_.lib / 20)].length) == 14)
            {
               KGAMECLASS.kGAMECLASS.player.dynStats([DynStat.Lust(10 + _loc1_.lib / 20)][0],[DynStat.Lust(10 + _loc1_.lib / 20)][1],[DynStat.Lust(10 + _loc1_.lib / 20)][2],[DynStat.Lust(10 + _loc1_.lib / 20)][3],[DynStat.Lust(10 + _loc1_.lib / 20)][4],[DynStat.Lust(10 + _loc1_.lib / 20)][5],[DynStat.Lust(10 + _loc1_.lib / 20)][6],[DynStat.Lust(10 + _loc1_.lib / 20)][7],[DynStat.Lust(10 + _loc1_.lib / 20)][8],[DynStat.Lust(10 + _loc1_.lib / 20)][9],[DynStat.Lust(10 + _loc1_.lib / 20)][10],[DynStat.Lust(10 + _loc1_.lib / 20)][11],[DynStat.Lust(10 + _loc1_.lib / 20)][12],[DynStat.Lust(10 + _loc1_.lib / 20)][13]);
            }
            else if(int([DynStat.Lust(10 + _loc1_.lib / 20)].length) == 15)
            {
               KGAMECLASS.kGAMECLASS.player.dynStats([DynStat.Lust(10 + _loc1_.lib / 20)][0],[DynStat.Lust(10 + _loc1_.lib / 20)][1],[DynStat.Lust(10 + _loc1_.lib / 20)][2],[DynStat.Lust(10 + _loc1_.lib / 20)][3],[DynStat.Lust(10 + _loc1_.lib / 20)][4],[DynStat.Lust(10 + _loc1_.lib / 20)][5],[DynStat.Lust(10 + _loc1_.lib / 20)][6],[DynStat.Lust(10 + _loc1_.lib / 20)][7],[DynStat.Lust(10 + _loc1_.lib / 20)][8],[DynStat.Lust(10 + _loc1_.lib / 20)][9],[DynStat.Lust(10 + _loc1_.lib / 20)][10],[DynStat.Lust(10 + _loc1_.lib / 20)][11],[DynStat.Lust(10 + _loc1_.lib / 20)][12],[DynStat.Lust(10 + _loc1_.lib / 20)][13],[DynStat.Lust(10 + _loc1_.lib / 20)][14]);
            }
            else if(int([DynStat.Lust(10 + _loc1_.lib / 20)].length) == 16)
            {
               KGAMECLASS.kGAMECLASS.player.dynStats([DynStat.Lust(10 + _loc1_.lib / 20)][0],[DynStat.Lust(10 + _loc1_.lib / 20)][1],[DynStat.Lust(10 + _loc1_.lib / 20)][2],[DynStat.Lust(10 + _loc1_.lib / 20)][3],[DynStat.Lust(10 + _loc1_.lib / 20)][4],[DynStat.Lust(10 + _loc1_.lib / 20)][5],[DynStat.Lust(10 + _loc1_.lib / 20)][6],[DynStat.Lust(10 + _loc1_.lib / 20)][7],[DynStat.Lust(10 + _loc1_.lib / 20)][8],[DynStat.Lust(10 + _loc1_.lib / 20)][9],[DynStat.Lust(10 + _loc1_.lib / 20)][10],[DynStat.Lust(10 + _loc1_.lib / 20)][11],[DynStat.Lust(10 + _loc1_.lib / 20)][12],[DynStat.Lust(10 + _loc1_.lib / 20)][13],[DynStat.Lust(10 + _loc1_.lib / 20)][14],[DynStat.Lust(10 + _loc1_.lib / 20)][15]);
            }
            else if(int([DynStat.Lust(10 + _loc1_.lib / 20)].length) == 17)
            {
               KGAMECLASS.kGAMECLASS.player.dynStats([DynStat.Lust(10 + _loc1_.lib / 20)][0],[DynStat.Lust(10 + _loc1_.lib / 20)][1],[DynStat.Lust(10 + _loc1_.lib / 20)][2],[DynStat.Lust(10 + _loc1_.lib / 20)][3],[DynStat.Lust(10 + _loc1_.lib / 20)][4],[DynStat.Lust(10 + _loc1_.lib / 20)][5],[DynStat.Lust(10 + _loc1_.lib / 20)][6],[DynStat.Lust(10 + _loc1_.lib / 20)][7],[DynStat.Lust(10 + _loc1_.lib / 20)][8],[DynStat.Lust(10 + _loc1_.lib / 20)][9],[DynStat.Lust(10 + _loc1_.lib / 20)][10],[DynStat.Lust(10 + _loc1_.lib / 20)][11],[DynStat.Lust(10 + _loc1_.lib / 20)][12],[DynStat.Lust(10 + _loc1_.lib / 20)][13],[DynStat.Lust(10 + _loc1_.lib / 20)][14],[DynStat.Lust(10 + _loc1_.lib / 20)][15],[DynStat.Lust(10 + _loc1_.lib / 20)][16]);
            }
            else if(int([DynStat.Lust(10 + _loc1_.lib / 20)].length) == 18)
            {
               KGAMECLASS.kGAMECLASS.player.dynStats([DynStat.Lust(10 + _loc1_.lib / 20)][0],[DynStat.Lust(10 + _loc1_.lib / 20)][1],[DynStat.Lust(10 + _loc1_.lib / 20)][2],[DynStat.Lust(10 + _loc1_.lib / 20)][3],[DynStat.Lust(10 + _loc1_.lib / 20)][4],[DynStat.Lust(10 + _loc1_.lib / 20)][5],[DynStat.Lust(10 + _loc1_.lib / 20)][6],[DynStat.Lust(10 + _loc1_.lib / 20)][7],[DynStat.Lust(10 + _loc1_.lib / 20)][8],[DynStat.Lust(10 + _loc1_.lib / 20)][9],[DynStat.Lust(10 + _loc1_.lib / 20)][10],[DynStat.Lust(10 + _loc1_.lib / 20)][11],[DynStat.Lust(10 + _loc1_.lib / 20)][12],[DynStat.Lust(10 + _loc1_.lib / 20)][13],[DynStat.Lust(10 + _loc1_.lib / 20)][14],[DynStat.Lust(10 + _loc1_.lib / 20)][15],[DynStat.Lust(10 + _loc1_.lib / 20)][16],[DynStat.Lust(10 + _loc1_.lib / 20)][17]);
            }
            else if(int([DynStat.Lust(10 + _loc1_.lib / 20)].length) == 19)
            {
               KGAMECLASS.kGAMECLASS.player.dynStats([DynStat.Lust(10 + _loc1_.lib / 20)][0],[DynStat.Lust(10 + _loc1_.lib / 20)][1],[DynStat.Lust(10 + _loc1_.lib / 20)][2],[DynStat.Lust(10 + _loc1_.lib / 20)][3],[DynStat.Lust(10 + _loc1_.lib / 20)][4],[DynStat.Lust(10 + _loc1_.lib / 20)][5],[DynStat.Lust(10 + _loc1_.lib / 20)][6],[DynStat.Lust(10 + _loc1_.lib / 20)][7],[DynStat.Lust(10 + _loc1_.lib / 20)][8],[DynStat.Lust(10 + _loc1_.lib / 20)][9],[DynStat.Lust(10 + _loc1_.lib / 20)][10],[DynStat.Lust(10 + _loc1_.lib / 20)][11],[DynStat.Lust(10 + _loc1_.lib / 20)][12],[DynStat.Lust(10 + _loc1_.lib / 20)][13],[DynStat.Lust(10 + _loc1_.lib / 20)][14],[DynStat.Lust(10 + _loc1_.lib / 20)][15],[DynStat.Lust(10 + _loc1_.lib / 20)][16],[DynStat.Lust(10 + _loc1_.lib / 20)][17],[DynStat.Lust(10 + _loc1_.lib / 20)][18]);
            }
            else
            {
               if(int([DynStat.Lust(10 + _loc1_.lib / 20)].length) != 20)
               {
                  throw "Too many rest arguments";
               }
               KGAMECLASS.kGAMECLASS.player.dynStats([DynStat.Lust(10 + _loc1_.lib / 20)][0],[DynStat.Lust(10 + _loc1_.lib / 20)][1],[DynStat.Lust(10 + _loc1_.lib / 20)][2],[DynStat.Lust(10 + _loc1_.lib / 20)][3],[DynStat.Lust(10 + _loc1_.lib / 20)][4],[DynStat.Lust(10 + _loc1_.lib / 20)][5],[DynStat.Lust(10 + _loc1_.lib / 20)][6],[DynStat.Lust(10 + _loc1_.lib / 20)][7],[DynStat.Lust(10 + _loc1_.lib / 20)][8],[DynStat.Lust(10 + _loc1_.lib / 20)][9],[DynStat.Lust(10 + _loc1_.lib / 20)][10],[DynStat.Lust(10 + _loc1_.lib / 20)][11],[DynStat.Lust(10 + _loc1_.lib / 20)][12],[DynStat.Lust(10 + _loc1_.lib / 20)][13],[DynStat.Lust(10 + _loc1_.lib / 20)][14],[DynStat.Lust(10 + _loc1_.lib / 20)][15],[DynStat.Lust(10 + _loc1_.lib / 20)][16],[DynStat.Lust(10 + _loc1_.lib / 20)][17],[DynStat.Lust(10 + _loc1_.lib / 20)][18],[DynStat.Lust(10 + _loc1_.lib / 20)][19]);
            }
            _loc2_ = true;
         }
         if(_loc1_.get_pregnancyIncubation() == 72)
         {
            output.text("<b>你的肚子明显隆起，");
            if(_loc1_.cor < 40)
            {
               output.text("并且不断地移动和蠕动。你到底要生出什么样的野兽？</b>");
            }
            if(_loc1_.cor >= 40 && _loc1_.cor < 75)
            {
               output.text("你想知道你还要等多久。</b>");
            }
            if(_loc1_.cor >= 75)
            {
               output.text("你渴望分娩，这样你就可以再次被腐化或怪物的精液填满你渴望的子宫，再次怀孕。</b>");
            }
            output.text("[pg]");
            if(int([DynStat.Spe(-3),DynStat.Lib(1),DynStat.Sens(1),DynStat.Lust(5 + _loc1_.lib / 20)].length) == 0)
            {
               KGAMECLASS.kGAMECLASS.player.dynStats();
            }
            else if(int([DynStat.Spe(-3),DynStat.Lib(1),DynStat.Sens(1),DynStat.Lust(5 + _loc1_.lib / 20)].length) == 1)
            {
               KGAMECLASS.kGAMECLASS.player.dynStats([DynStat.Spe(-3),DynStat.Lib(1),DynStat.Sens(1),DynStat.Lust(5 + _loc1_.lib / 20)][0]);
            }
            else if(int([DynStat.Spe(-3),DynStat.Lib(1),DynStat.Sens(1),DynStat.Lust(5 + _loc1_.lib / 20)].length) == 2)
            {
               KGAMECLASS.kGAMECLASS.player.dynStats([DynStat.Spe(-3),DynStat.Lib(1),DynStat.Sens(1),DynStat.Lust(5 + _loc1_.lib / 20)][0],[DynStat.Spe(-3),DynStat.Lib(1),DynStat.Sens(1),DynStat.Lust(5 + _loc1_.lib / 20)][1]);
            }
            else if(int([DynStat.Spe(-3),DynStat.Lib(1),DynStat.Sens(1),DynStat.Lust(5 + _loc1_.lib / 20)].length) == 3)
            {
               KGAMECLASS.kGAMECLASS.player.dynStats([DynStat.Spe(-3),DynStat.Lib(1),DynStat.Sens(1),DynStat.Lust(5 + _loc1_.lib / 20)][0],[DynStat.Spe(-3),DynStat.Lib(1),DynStat.Sens(1),DynStat.Lust(5 + _loc1_.lib / 20)][1],[DynStat.Spe(-3),DynStat.Lib(1),DynStat.Sens(1),DynStat.Lust(5 + _loc1_.lib / 20)][2]);
            }
            else if(int([DynStat.Spe(-3),DynStat.Lib(1),DynStat.Sens(1),DynStat.Lust(5 + _loc1_.lib / 20)].length) == 4)
            {
               KGAMECLASS.kGAMECLASS.player.dynStats([DynStat.Spe(-3),DynStat.Lib(1),DynStat.Sens(1),DynStat.Lust(5 + _loc1_.lib / 20)][0],[DynStat.Spe(-3),DynStat.Lib(1),DynStat.Sens(1),DynStat.Lust(5 + _loc1_.lib / 20)][1],[DynStat.Spe(-3),DynStat.Lib(1),DynStat.Sens(1),DynStat.Lust(5 + _loc1_.lib / 20)][2],[DynStat.Spe(-3),DynStat.Lib(1),DynStat.Sens(1),DynStat.Lust(5 + _loc1_.lib / 20)][3]);
            }
            else if(int([DynStat.Spe(-3),DynStat.Lib(1),DynStat.Sens(1),DynStat.Lust(5 + _loc1_.lib / 20)].length) == 5)
            {
               KGAMECLASS.kGAMECLASS.player.dynStats([DynStat.Spe(-3),DynStat.Lib(1),DynStat.Sens(1),DynStat.Lust(5 + _loc1_.lib / 20)][0],[DynStat.Spe(-3),DynStat.Lib(1),DynStat.Sens(1),DynStat.Lust(5 + _loc1_.lib / 20)][1],[DynStat.Spe(-3),DynStat.Lib(1),DynStat.Sens(1),DynStat.Lust(5 + _loc1_.lib / 20)][2],[DynStat.Spe(-3),DynStat.Lib(1),DynStat.Sens(1),DynStat.Lust(5 + _loc1_.lib / 20)][3],[DynStat.Spe(-3),DynStat.Lib(1),DynStat.Sens(1),DynStat.Lust(5 + _loc1_.lib / 20)][4]);
            }
            else if(int([DynStat.Spe(-3),DynStat.Lib(1),DynStat.Sens(1),DynStat.Lust(5 + _loc1_.lib / 20)].length) == 6)
            {
               KGAMECLASS.kGAMECLASS.player.dynStats([DynStat.Spe(-3),DynStat.Lib(1),DynStat.Sens(1),DynStat.Lust(5 + _loc1_.lib / 20)][0],[DynStat.Spe(-3),DynStat.Lib(1),DynStat.Sens(1),DynStat.Lust(5 + _loc1_.lib / 20)][1],[DynStat.Spe(-3),DynStat.Lib(1),DynStat.Sens(1),DynStat.Lust(5 + _loc1_.lib / 20)][2],[DynStat.Spe(-3),DynStat.Lib(1),DynStat.Sens(1),DynStat.Lust(5 + _loc1_.lib / 20)][3],[DynStat.Spe(-3),DynStat.Lib(1),DynStat.Sens(1),DynStat.Lust(5 + _loc1_.lib / 20)][4],[DynStat.Spe(-3),DynStat.Lib(1),DynStat.Sens(1),DynStat.Lust(5 + _loc1_.lib / 20)][5]);
            }
            else if(int([DynStat.Spe(-3),DynStat.Lib(1),DynStat.Sens(1),DynStat.Lust(5 + _loc1_.lib / 20)].length) == 7)
            {
               KGAMECLASS.kGAMECLASS.player.dynStats([DynStat.Spe(-3),DynStat.Lib(1),DynStat.Sens(1),DynStat.Lust(5 + _loc1_.lib / 20)][0],[DynStat.Spe(-3),DynStat.Lib(1),DynStat.Sens(1),DynStat.Lust(5 + _loc1_.lib / 20)][1],[DynStat.Spe(-3),DynStat.Lib(1),DynStat.Sens(1),DynStat.Lust(5 + _loc1_.lib / 20)][2],[DynStat.Spe(-3),DynStat.Lib(1),DynStat.Sens(1),DynStat.Lust(5 + _loc1_.lib / 20)][3],[DynStat.Spe(-3),DynStat.Lib(1),DynStat.Sens(1),DynStat.Lust(5 + _loc1_.lib / 20)][4],[DynStat.Spe(-3),DynStat.Lib(1),DynStat.Sens(1),DynStat.Lust(5 + _loc1_.lib / 20)][5],[DynStat.Spe(-3),DynStat.Lib(1),DynStat.Sens(1),DynStat.Lust(5 + _loc1_.lib / 20)][6]);
            }
            else if(int([DynStat.Spe(-3),DynStat.Lib(1),DynStat.Sens(1),DynStat.Lust(5 + _loc1_.lib / 20)].length) == 8)
            {
               KGAMECLASS.kGAMECLASS.player.dynStats([DynStat.Spe(-3),DynStat.Lib(1),DynStat.Sens(1),DynStat.Lust(5 + _loc1_.lib / 20)][0],[DynStat.Spe(-3),DynStat.Lib(1),DynStat.Sens(1),DynStat.Lust(5 + _loc1_.lib / 20)][1],[DynStat.Spe(-3),DynStat.Lib(1),DynStat.Sens(1),DynStat.Lust(5 + _loc1_.lib / 20)][2],[DynStat.Spe(-3),DynStat.Lib(1),DynStat.Sens(1),DynStat.Lust(5 + _loc1_.lib / 20)][3],[DynStat.Spe(-3),DynStat.Lib(1),DynStat.Sens(1),DynStat.Lust(5 + _loc1_.lib / 20)][4],[DynStat.Spe(-3),DynStat.Lib(1),DynStat.Sens(1),DynStat.Lust(5 + _loc1_.lib / 20)][5],[DynStat.Spe(-3),DynStat.Lib(1),DynStat.Sens(1),DynStat.Lust(5 + _loc1_.lib / 20)][6],[DynStat.Spe(-3),DynStat.Lib(1),DynStat.Sens(1),DynStat.Lust(5 + _loc1_.lib / 20)][7]);
            }
            else if(int([DynStat.Spe(-3),DynStat.Lib(1),DynStat.Sens(1),DynStat.Lust(5 + _loc1_.lib / 20)].length) == 9)
            {
               KGAMECLASS.kGAMECLASS.player.dynStats([DynStat.Spe(-3),DynStat.Lib(1),DynStat.Sens(1),DynStat.Lust(5 + _loc1_.lib / 20)][0],[DynStat.Spe(-3),DynStat.Lib(1),DynStat.Sens(1),DynStat.Lust(5 + _loc1_.lib / 20)][1],[DynStat.Spe(-3),DynStat.Lib(1),DynStat.Sens(1),DynStat.Lust(5 + _loc1_.lib / 20)][2],[DynStat.Spe(-3),DynStat.Lib(1),DynStat.Sens(1),DynStat.Lust(5 + _loc1_.lib / 20)][3],[DynStat.Spe(-3),DynStat.Lib(1),DynStat.Sens(1),DynStat.Lust(5 + _loc1_.lib / 20)][4],[DynStat.Spe(-3),DynStat.Lib(1),DynStat.Sens(1),DynStat.Lust(5 + _loc1_.lib / 20)][5],[DynStat.Spe(-3),DynStat.Lib(1),DynStat.Sens(1),DynStat.Lust(5 + _loc1_.lib / 20)][6],[DynStat.Spe(-3),DynStat.Lib(1),DynStat.Sens(1),DynStat.Lust(5 + _loc1_.lib / 20)][7],[DynStat.Spe(-3),DynStat.Lib(1),DynStat.Sens(1),DynStat.Lust(5 + _loc1_.lib / 20)][8]);
            }
            else if(int([DynStat.Spe(-3),DynStat.Lib(1),DynStat.Sens(1),DynStat.Lust(5 + _loc1_.lib / 20)].length) == 10)
            {
               KGAMECLASS.kGAMECLASS.player.dynStats([DynStat.Spe(-3),DynStat.Lib(1),DynStat.Sens(1),DynStat.Lust(5 + _loc1_.lib / 20)][0],[DynStat.Spe(-3),DynStat.Lib(1),DynStat.Sens(1),DynStat.Lust(5 + _loc1_.lib / 20)][1],[DynStat.Spe(-3),DynStat.Lib(1),DynStat.Sens(1),DynStat.Lust(5 + _loc1_.lib / 20)][2],[DynStat.Spe(-3),DynStat.Lib(1),DynStat.Sens(1),DynStat.Lust(5 + _loc1_.lib / 20)][3],[DynStat.Spe(-3),DynStat.Lib(1),DynStat.Sens(1),DynStat.Lust(5 + _loc1_.lib / 20)][4],[DynStat.Spe(-3),DynStat.Lib(1),DynStat.Sens(1),DynStat.Lust(5 + _loc1_.lib / 20)][5],[DynStat.Spe(-3),DynStat.Lib(1),DynStat.Sens(1),DynStat.Lust(5 + _loc1_.lib / 20)][6],[DynStat.Spe(-3),DynStat.Lib(1),DynStat.Sens(1),DynStat.Lust(5 + _loc1_.lib / 20)][7],[DynStat.Spe(-3),DynStat.Lib(1),DynStat.Sens(1),DynStat.Lust(5 + _loc1_.lib / 20)][8],[DynStat.Spe(-3),DynStat.Lib(1),DynStat.Sens(1),DynStat.Lust(5 + _loc1_.lib / 20)][9]);
            }
            else if(int([DynStat.Spe(-3),DynStat.Lib(1),DynStat.Sens(1),DynStat.Lust(5 + _loc1_.lib / 20)].length) == 11)
            {
               KGAMECLASS.kGAMECLASS.player.dynStats([DynStat.Spe(-3),DynStat.Lib(1),DynStat.Sens(1),DynStat.Lust(5 + _loc1_.lib / 20)][0],[DynStat.Spe(-3),DynStat.Lib(1),DynStat.Sens(1),DynStat.Lust(5 + _loc1_.lib / 20)][1],[DynStat.Spe(-3),DynStat.Lib(1),DynStat.Sens(1),DynStat.Lust(5 + _loc1_.lib / 20)][2],[DynStat.Spe(-3),DynStat.Lib(1),DynStat.Sens(1),DynStat.Lust(5 + _loc1_.lib / 20)][3],[DynStat.Spe(-3),DynStat.Lib(1),DynStat.Sens(1),DynStat.Lust(5 + _loc1_.lib / 20)][4],[DynStat.Spe(-3),DynStat.Lib(1),DynStat.Sens(1),DynStat.Lust(5 + _loc1_.lib / 20)][5],[DynStat.Spe(-3),DynStat.Lib(1),DynStat.Sens(1),DynStat.Lust(5 + _loc1_.lib / 20)][6],[DynStat.Spe(-3),DynStat.Lib(1),DynStat.Sens(1),DynStat.Lust(5 + _loc1_.lib / 20)][7],[DynStat.Spe(-3),DynStat.Lib(1),DynStat.Sens(1),DynStat.Lust(5 + _loc1_.lib / 20)][8],[DynStat.Spe(-3),DynStat.Lib(1),DynStat.Sens(1),DynStat.Lust(5 + _loc1_.lib / 20)][9],[DynStat.Spe(-3),DynStat.Lib(1),DynStat.Sens(1),DynStat.Lust(5 + _loc1_.lib / 20)][10]);
            }
            else if(int([DynStat.Spe(-3),DynStat.Lib(1),DynStat.Sens(1),DynStat.Lust(5 + _loc1_.lib / 20)].length) == 12)
            {
               KGAMECLASS.kGAMECLASS.player.dynStats([DynStat.Spe(-3),DynStat.Lib(1),DynStat.Sens(1),DynStat.Lust(5 + _loc1_.lib / 20)][0],[DynStat.Spe(-3),DynStat.Lib(1),DynStat.Sens(1),DynStat.Lust(5 + _loc1_.lib / 20)][1],[DynStat.Spe(-3),DynStat.Lib(1),DynStat.Sens(1),DynStat.Lust(5 + _loc1_.lib / 20)][2],[DynStat.Spe(-3),DynStat.Lib(1),DynStat.Sens(1),DynStat.Lust(5 + _loc1_.lib / 20)][3],[DynStat.Spe(-3),DynStat.Lib(1),DynStat.Sens(1),DynStat.Lust(5 + _loc1_.lib / 20)][4],[DynStat.Spe(-3),DynStat.Lib(1),DynStat.Sens(1),DynStat.Lust(5 + _loc1_.lib / 20)][5],[DynStat.Spe(-3),DynStat.Lib(1),DynStat.Sens(1),DynStat.Lust(5 + _loc1_.lib / 20)][6],[DynStat.Spe(-3),DynStat.Lib(1),DynStat.Sens(1),DynStat.Lust(5 + _loc1_.lib / 20)][7],[DynStat.Spe(-3),DynStat.Lib(1),DynStat.Sens(1),DynStat.Lust(5 + _loc1_.lib / 20)][8],[DynStat.Spe(-3),DynStat.Lib(1),DynStat.Sens(1),DynStat.Lust(5 + _loc1_.lib / 20)][9],[DynStat.Spe(-3),DynStat.Lib(1),DynStat.Sens(1),DynStat.Lust(5 + _loc1_.lib / 20)][10],[DynStat.Spe(-3)
               ,DynStat.Lib(1),DynStat.Sens(1),DynStat.Lust(5 + _loc1_.lib / 20)][11]);
            }
            else if(int([DynStat.Spe(-3),DynStat.Lib(1),DynStat.Sens(1),DynStat.Lust(5 + _loc1_.lib / 20)].length) == 13)
            {
               KGAMECLASS.kGAMECLASS.player.dynStats([DynStat.Spe(-3),DynStat.Lib(1),DynStat.Sens(1),DynStat.Lust(5 + _loc1_.lib / 20)][0],[DynStat.Spe(-3),DynStat.Lib(1),DynStat.Sens(1),DynStat.Lust(5 + _loc1_.lib / 20)][1],[DynStat.Spe(-3),DynStat.Lib(1),DynStat.Sens(1),DynStat.Lust(5 + _loc1_.lib / 20)][2],[DynStat.Spe(-3),DynStat.Lib(1),DynStat.Sens(1),DynStat.Lust(5 + _loc1_.lib / 20)][3],[DynStat.Spe(-3),DynStat.Lib(1),DynStat.Sens(1),DynStat.Lust(5 + _loc1_.lib / 20)][4],[DynStat.Spe(-3),DynStat.Lib(1),DynStat.Sens(1),DynStat.Lust(5 + _loc1_.lib / 20)][5],[DynStat.Spe(-3),DynStat.Lib(1),DynStat.Sens(1),DynStat.Lust(5 + _loc1_.lib / 20)][6],[DynStat.Spe(-3),DynStat.Lib(1),DynStat.Sens(1),DynStat.Lust(5 + _loc1_.lib / 20)][7],[DynStat.Spe(-3),DynStat.Lib(1),DynStat.Sens(1),DynStat.Lust(5 + _loc1_.lib / 20)][8],[DynStat.Spe(-3),DynStat.Lib(1),DynStat.Sens(1),DynStat.Lust(5 + _loc1_.lib / 20)][9],[DynStat.Spe(-3),DynStat.Lib(1),DynStat.Sens(1),DynStat.Lust(5 + _loc1_.lib / 20)][10],[DynStat.Spe(-3)
               ,DynStat.Lib(1),DynStat.Sens(1),DynStat.Lust(5 + _loc1_.lib / 20)][11],[DynStat.Spe(-3),DynStat.Lib(1),DynStat.Sens(1),DynStat.Lust(5 + _loc1_.lib / 20)][12]);
            }
            else if(int([DynStat.Spe(-3),DynStat.Lib(1),DynStat.Sens(1),DynStat.Lust(5 + _loc1_.lib / 20)].length) == 14)
            {
               KGAMECLASS.kGAMECLASS.player.dynStats([DynStat.Spe(-3),DynStat.Lib(1),DynStat.Sens(1),DynStat.Lust(5 + _loc1_.lib / 20)][0],[DynStat.Spe(-3),DynStat.Lib(1),DynStat.Sens(1),DynStat.Lust(5 + _loc1_.lib / 20)][1],[DynStat.Spe(-3),DynStat.Lib(1),DynStat.Sens(1),DynStat.Lust(5 + _loc1_.lib / 20)][2],[DynStat.Spe(-3),DynStat.Lib(1),DynStat.Sens(1),DynStat.Lust(5 + _loc1_.lib / 20)][3],[DynStat.Spe(-3),DynStat.Lib(1),DynStat.Sens(1),DynStat.Lust(5 + _loc1_.lib / 20)][4],[DynStat.Spe(-3),DynStat.Lib(1),DynStat.Sens(1),DynStat.Lust(5 + _loc1_.lib / 20)][5],[DynStat.Spe(-3),DynStat.Lib(1),DynStat.Sens(1),DynStat.Lust(5 + _loc1_.lib / 20)][6],[DynStat.Spe(-3),DynStat.Lib(1),DynStat.Sens(1),DynStat.Lust(5 + _loc1_.lib / 20)][7],[DynStat.Spe(-3),DynStat.Lib(1),DynStat.Sens(1),DynStat.Lust(5 + _loc1_.lib / 20)][8],[DynStat.Spe(-3),DynStat.Lib(1),DynStat.Sens(1),DynStat.Lust(5 + _loc1_.lib / 20)][9],[DynStat.Spe(-3),DynStat.Lib(1),DynStat.Sens(1),DynStat.Lust(5 + _loc1_.lib / 20)][10],[DynStat.Spe(-3)
               ,DynStat.Lib(1),DynStat.Sens(1),DynStat.Lust(5 + _loc1_.lib / 20)][11],[DynStat.Spe(-3),DynStat.Lib(1),DynStat.Sens(1),DynStat.Lust(5 + _loc1_.lib / 20)][12],[DynStat.Spe(-3),DynStat.Lib(1),DynStat.Sens(1),DynStat.Lust(5 + _loc1_.lib / 20)][13]);
            }
            else if(int([DynStat.Spe(-3),DynStat.Lib(1),DynStat.Sens(1),DynStat.Lust(5 + _loc1_.lib / 20)].length) == 15)
            {
               KGAMECLASS.kGAMECLASS.player.dynStats([DynStat.Spe(-3),DynStat.Lib(1),DynStat.Sens(1),DynStat.Lust(5 + _loc1_.lib / 20)][0],[DynStat.Spe(-3),DynStat.Lib(1),DynStat.Sens(1),DynStat.Lust(5 + _loc1_.lib / 20)][1],[DynStat.Spe(-3),DynStat.Lib(1),DynStat.Sens(1),DynStat.Lust(5 + _loc1_.lib / 20)][2],[DynStat.Spe(-3),DynStat.Lib(1),DynStat.Sens(1),DynStat.Lust(5 + _loc1_.lib / 20)][3],[DynStat.Spe(-3),DynStat.Lib(1),DynStat.Sens(1),DynStat.Lust(5 + _loc1_.lib / 20)][4],[DynStat.Spe(-3),DynStat.Lib(1),DynStat.Sens(1),DynStat.Lust(5 + _loc1_.lib / 20)][5],[DynStat.Spe(-3),DynStat.Lib(1),DynStat.Sens(1),DynStat.Lust(5 + _loc1_.lib / 20)][6],[DynStat.Spe(-3),DynStat.Lib(1),DynStat.Sens(1),DynStat.Lust(5 + _loc1_.lib / 20)][7],[DynStat.Spe(-3),DynStat.Lib(1),DynStat.Sens(1),DynStat.Lust(5 + _loc1_.lib / 20)][8],[DynStat.Spe(-3),DynStat.Lib(1),DynStat.Sens(1),DynStat.Lust(5 + _loc1_.lib / 20)][9],[DynStat.Spe(-3),DynStat.Lib(1),DynStat.Sens(1),DynStat.Lust(5 + _loc1_.lib / 20)][10],[DynStat.Spe(-3)
               ,DynStat.Lib(1),DynStat.Sens(1),DynStat.Lust(5 + _loc1_.lib / 20)][11],[DynStat.Spe(-3),DynStat.Lib(1),DynStat.Sens(1),DynStat.Lust(5 + _loc1_.lib / 20)][12],[DynStat.Spe(-3),DynStat.Lib(1),DynStat.Sens(1),DynStat.Lust(5 + _loc1_.lib / 20)][13],[DynStat.Spe(-3),DynStat.Lib(1),DynStat.Sens(1),DynStat.Lust(5 + _loc1_.lib / 20)][14]);
            }
            else if(int([DynStat.Spe(-3),DynStat.Lib(1),DynStat.Sens(1),DynStat.Lust(5 + _loc1_.lib / 20)].length) == 16)
            {
               KGAMECLASS.kGAMECLASS.player.dynStats([DynStat.Spe(-3),DynStat.Lib(1),DynStat.Sens(1),DynStat.Lust(5 + _loc1_.lib / 20)][0],[DynStat.Spe(-3),DynStat.Lib(1),DynStat.Sens(1),DynStat.Lust(5 + _loc1_.lib / 20)][1],[DynStat.Spe(-3),DynStat.Lib(1),DynStat.Sens(1),DynStat.Lust(5 + _loc1_.lib / 20)][2],[DynStat.Spe(-3),DynStat.Lib(1),DynStat.Sens(1),DynStat.Lust(5 + _loc1_.lib / 20)][3],[DynStat.Spe(-3),DynStat.Lib(1),DynStat.Sens(1),DynStat.Lust(5 + _loc1_.lib / 20)][4],[DynStat.Spe(-3),DynStat.Lib(1),DynStat.Sens(1),DynStat.Lust(5 + _loc1_.lib / 20)][5],[DynStat.Spe(-3),DynStat.Lib(1),DynStat.Sens(1),DynStat.Lust(5 + _loc1_.lib / 20)][6],[DynStat.Spe(-3),DynStat.Lib(1),DynStat.Sens(1),DynStat.Lust(5 + _loc1_.lib / 20)][7],[DynStat.Spe(-3),DynStat.Lib(1),DynStat.Sens(1),DynStat.Lust(5 + _loc1_.lib / 20)][8],[DynStat.Spe(-3),DynStat.Lib(1),DynStat.Sens(1),DynStat.Lust(5 + _loc1_.lib / 20)][9],[DynStat.Spe(-3),DynStat.Lib(1),DynStat.Sens(1),DynStat.Lust(5 + _loc1_.lib / 20)][10],[DynStat.Spe(-3)
               ,DynStat.Lib(1),DynStat.Sens(1),DynStat.Lust(5 + _loc1_.lib / 20)][11],[DynStat.Spe(-3),DynStat.Lib(1),DynStat.Sens(1),DynStat.Lust(5 + _loc1_.lib / 20)][12],[DynStat.Spe(-3),DynStat.Lib(1),DynStat.Sens(1),DynStat.Lust(5 + _loc1_.lib / 20)][13],[DynStat.Spe(-3),DynStat.Lib(1),DynStat.Sens(1),DynStat.Lust(5 + _loc1_.lib / 20)][14],[DynStat.Spe(-3),DynStat.Lib(1),DynStat.Sens(1),DynStat.Lust(5 + _loc1_.lib / 20)][15]);
            }
            else if(int([DynStat.Spe(-3),DynStat.Lib(1),DynStat.Sens(1),DynStat.Lust(5 + _loc1_.lib / 20)].length) == 17)
            {
               KGAMECLASS.kGAMECLASS.player.dynStats([DynStat.Spe(-3),DynStat.Lib(1),DynStat.Sens(1),DynStat.Lust(5 + _loc1_.lib / 20)][0],[DynStat.Spe(-3),DynStat.Lib(1),DynStat.Sens(1),DynStat.Lust(5 + _loc1_.lib / 20)][1],[DynStat.Spe(-3),DynStat.Lib(1),DynStat.Sens(1),DynStat.Lust(5 + _loc1_.lib / 20)][2],[DynStat.Spe(-3),DynStat.Lib(1),DynStat.Sens(1),DynStat.Lust(5 + _loc1_.lib / 20)][3],[DynStat.Spe(-3),DynStat.Lib(1),DynStat.Sens(1),DynStat.Lust(5 + _loc1_.lib / 20)][4],[DynStat.Spe(-3),DynStat.Lib(1),DynStat.Sens(1),DynStat.Lust(5 + _loc1_.lib / 20)][5],[DynStat.Spe(-3),DynStat.Lib(1),DynStat.Sens(1),DynStat.Lust(5 + _loc1_.lib / 20)][6],[DynStat.Spe(-3),DynStat.Lib(1),DynStat.Sens(1),DynStat.Lust(5 + _loc1_.lib / 20)][7],[DynStat.Spe(-3),DynStat.Lib(1),DynStat.Sens(1),DynStat.Lust(5 + _loc1_.lib / 20)][8],[DynStat.Spe(-3),DynStat.Lib(1),DynStat.Sens(1),DynStat.Lust(5 + _loc1_.lib / 20)][9],[DynStat.Spe(-3),DynStat.Lib(1),DynStat.Sens(1),DynStat.Lust(5 + _loc1_.lib / 20)][10],[DynStat.Spe(-3)
               ,DynStat.Lib(1),DynStat.Sens(1),DynStat.Lust(5 + _loc1_.lib / 20)][11],[DynStat.Spe(-3),DynStat.Lib(1),DynStat.Sens(1),DynStat.Lust(5 + _loc1_.lib / 20)][12],[DynStat.Spe(-3),DynStat.Lib(1),DynStat.Sens(1),DynStat.Lust(5 + _loc1_.lib / 20)][13],[DynStat.Spe(-3),DynStat.Lib(1),DynStat.Sens(1),DynStat.Lust(5 + _loc1_.lib / 20)][14],[DynStat.Spe(-3),DynStat.Lib(1),DynStat.Sens(1),DynStat.Lust(5 + _loc1_.lib / 20)][15],[DynStat.Spe(-3),DynStat.Lib(1),DynStat.Sens(1),DynStat.Lust(5 + _loc1_.lib / 20)][16]);
            }
            else if(int([DynStat.Spe(-3),DynStat.Lib(1),DynStat.Sens(1),DynStat.Lust(5 + _loc1_.lib / 20)].length) == 18)
            {
               KGAMECLASS.kGAMECLASS.player.dynStats([DynStat.Spe(-3),DynStat.Lib(1),DynStat.Sens(1),DynStat.Lust(5 + _loc1_.lib / 20)][0],[DynStat.Spe(-3),DynStat.Lib(1),DynStat.Sens(1),DynStat.Lust(5 + _loc1_.lib / 20)][1],[DynStat.Spe(-3),DynStat.Lib(1),DynStat.Sens(1),DynStat.Lust(5 + _loc1_.lib / 20)][2],[DynStat.Spe(-3),DynStat.Lib(1),DynStat.Sens(1),DynStat.Lust(5 + _loc1_.lib / 20)][3],[DynStat.Spe(-3),DynStat.Lib(1),DynStat.Sens(1),DynStat.Lust(5 + _loc1_.lib / 20)][4],[DynStat.Spe(-3),DynStat.Lib(1),DynStat.Sens(1),DynStat.Lust(5 + _loc1_.lib / 20)][5],[DynStat.Spe(-3),DynStat.Lib(1),DynStat.Sens(1),DynStat.Lust(5 + _loc1_.lib / 20)][6],[DynStat.Spe(-3),DynStat.Lib(1),DynStat.Sens(1),DynStat.Lust(5 + _loc1_.lib / 20)][7],[DynStat.Spe(-3),DynStat.Lib(1),DynStat.Sens(1),DynStat.Lust(5 + _loc1_.lib / 20)][8],[DynStat.Spe(-3),DynStat.Lib(1),DynStat.Sens(1),DynStat.Lust(5 + _loc1_.lib / 20)][9],[DynStat.Spe(-3),DynStat.Lib(1),DynStat.Sens(1),DynStat.Lust(5 + _loc1_.lib / 20)][10],[DynStat.Spe(-3)
               ,DynStat.Lib(1),DynStat.Sens(1),DynStat.Lust(5 + _loc1_.lib / 20)][11],[DynStat.Spe(-3),DynStat.Lib(1),DynStat.Sens(1),DynStat.Lust(5 + _loc1_.lib / 20)][12],[DynStat.Spe(-3),DynStat.Lib(1),DynStat.Sens(1),DynStat.Lust(5 + _loc1_.lib / 20)][13],[DynStat.Spe(-3),DynStat.Lib(1),DynStat.Sens(1),DynStat.Lust(5 + _loc1_.lib / 20)][14],[DynStat.Spe(-3),DynStat.Lib(1),DynStat.Sens(1),DynStat.Lust(5 + _loc1_.lib / 20)][15],[DynStat.Spe(-3),DynStat.Lib(1),DynStat.Sens(1),DynStat.Lust(5 + _loc1_.lib / 20)][16],[DynStat.Spe(-3),DynStat.Lib(1),DynStat.Sens(1),DynStat.Lust(5 + _loc1_.lib / 20)][17]);
            }
            else if(int([DynStat.Spe(-3),DynStat.Lib(1),DynStat.Sens(1),DynStat.Lust(5 + _loc1_.lib / 20)].length) == 19)
            {
               KGAMECLASS.kGAMECLASS.player.dynStats([DynStat.Spe(-3),DynStat.Lib(1),DynStat.Sens(1),DynStat.Lust(5 + _loc1_.lib / 20)][0],[DynStat.Spe(-3),DynStat.Lib(1),DynStat.Sens(1),DynStat.Lust(5 + _loc1_.lib / 20)][1],[DynStat.Spe(-3),DynStat.Lib(1),DynStat.Sens(1),DynStat.Lust(5 + _loc1_.lib / 20)][2],[DynStat.Spe(-3),DynStat.Lib(1),DynStat.Sens(1),DynStat.Lust(5 + _loc1_.lib / 20)][3],[DynStat.Spe(-3),DynStat.Lib(1),DynStat.Sens(1),DynStat.Lust(5 + _loc1_.lib / 20)][4],[DynStat.Spe(-3),DynStat.Lib(1),DynStat.Sens(1),DynStat.Lust(5 + _loc1_.lib / 20)][5],[DynStat.Spe(-3),DynStat.Lib(1),DynStat.Sens(1),DynStat.Lust(5 + _loc1_.lib / 20)][6],[DynStat.Spe(-3),DynStat.Lib(1),DynStat.Sens(1),DynStat.Lust(5 + _loc1_.lib / 20)][7],[DynStat.Spe(-3),DynStat.Lib(1),DynStat.Sens(1),DynStat.Lust(5 + _loc1_.lib / 20)][8],[DynStat.Spe(-3),DynStat.Lib(1),DynStat.Sens(1),DynStat.Lust(5 + _loc1_.lib / 20)][9],[DynStat.Spe(-3),DynStat.Lib(1),DynStat.Sens(1),DynStat.Lust(5 + _loc1_.lib / 20)][10],[DynStat.Spe(-3)
               ,DynStat.Lib(1),DynStat.Sens(1),DynStat.Lust(5 + _loc1_.lib / 20)][11],[DynStat.Spe(-3),DynStat.Lib(1),DynStat.Sens(1),DynStat.Lust(5 + _loc1_.lib / 20)][12],[DynStat.Spe(-3),DynStat.Lib(1),DynStat.Sens(1),DynStat.Lust(5 + _loc1_.lib / 20)][13],[DynStat.Spe(-3),DynStat.Lib(1),DynStat.Sens(1),DynStat.Lust(5 + _loc1_.lib / 20)][14],[DynStat.Spe(-3),DynStat.Lib(1),DynStat.Sens(1),DynStat.Lust(5 + _loc1_.lib / 20)][15],[DynStat.Spe(-3),DynStat.Lib(1),DynStat.Sens(1),DynStat.Lust(5 + _loc1_.lib / 20)][16],[DynStat.Spe(-3),DynStat.Lib(1),DynStat.Sens(1),DynStat.Lust(5 + _loc1_.lib / 20)][17],[DynStat.Spe(-3),DynStat.Lib(1),DynStat.Sens(1),DynStat.Lust(5 + _loc1_.lib / 20)][18]);
            }
            else
            {
               if(int([DynStat.Spe(-3),DynStat.Lib(1),DynStat.Sens(1),DynStat.Lust(5 + _loc1_.lib / 20)].length) != 20)
               {
                  throw "Too many rest arguments";
               }
               KGAMECLASS.kGAMECLASS.player.dynStats([DynStat.Spe(-3),DynStat.Lib(1),DynStat.Sens(1),DynStat.Lust(5 + _loc1_.lib / 20)][0],[DynStat.Spe(-3),DynStat.Lib(1),DynStat.Sens(1),DynStat.Lust(5 + _loc1_.lib / 20)][1],[DynStat.Spe(-3),DynStat.Lib(1),DynStat.Sens(1),DynStat.Lust(5 + _loc1_.lib / 20)][2],[DynStat.Spe(-3),DynStat.Lib(1),DynStat.Sens(1),DynStat.Lust(5 + _loc1_.lib / 20)][3],[DynStat.Spe(-3),DynStat.Lib(1),DynStat.Sens(1),DynStat.Lust(5 + _loc1_.lib / 20)][4],[DynStat.Spe(-3),DynStat.Lib(1),DynStat.Sens(1),DynStat.Lust(5 + _loc1_.lib / 20)][5],[DynStat.Spe(-3),DynStat.Lib(1),DynStat.Sens(1),DynStat.Lust(5 + _loc1_.lib / 20)][6],[DynStat.Spe(-3),DynStat.Lib(1),DynStat.Sens(1),DynStat.Lust(5 + _loc1_.lib / 20)][7],[DynStat.Spe(-3),DynStat.Lib(1),DynStat.Sens(1),DynStat.Lust(5 + _loc1_.lib / 20)][8],[DynStat.Spe(-3),DynStat.Lib(1),DynStat.Sens(1),DynStat.Lust(5 + _loc1_.lib / 20)][9],[DynStat.Spe(-3),DynStat.Lib(1),DynStat.Sens(1),DynStat.Lust(5 + _loc1_.lib / 20)][10],[DynStat.Spe(-3)
               ,DynStat.Lib(1),DynStat.Sens(1),DynStat.Lust(5 + _loc1_.lib / 20)][11],[DynStat.Spe(-3),DynStat.Lib(1),DynStat.Sens(1),DynStat.Lust(5 + _loc1_.lib / 20)][12],[DynStat.Spe(-3),DynStat.Lib(1),DynStat.Sens(1),DynStat.Lust(5 + _loc1_.lib / 20)][13],[DynStat.Spe(-3),DynStat.Lib(1),DynStat.Sens(1),DynStat.Lust(5 + _loc1_.lib / 20)][14],[DynStat.Spe(-3),DynStat.Lib(1),DynStat.Sens(1),DynStat.Lust(5 + _loc1_.lib / 20)][15],[DynStat.Spe(-3),DynStat.Lib(1),DynStat.Sens(1),DynStat.Lust(5 + _loc1_.lib / 20)][16],[DynStat.Spe(-3),DynStat.Lib(1),DynStat.Sens(1),DynStat.Lust(5 + _loc1_.lib / 20)][17],[DynStat.Spe(-3),DynStat.Lib(1),DynStat.Sens(1),DynStat.Lust(5 + _loc1_.lib / 20)][18],[DynStat.Spe(-3),DynStat.Lib(1),DynStat.Sens(1),DynStat.Lust(5 + _loc1_.lib / 20)][19]);
            }
            _loc2_ = true;
         }
         if(_loc1_.get_pregnancyIncubation() == 48)
         {
            output.text("[bstart]你用手抚摸着隆起的肚子，沉浸在做母亲的感觉中。");
            if(_loc1_.cor < 40)
            {
               output.text("之后你对自己感到有些厌恶，但又很饥渴。[bend][pg]");
            }
            if(_loc1_.cor >= 40 && _loc1_.cor < 75)
            {
               output.text("你估计在接下来的几天里就会分娩。你希望分娩能像怀孕一样充满情欲。[bend][pg]");
            }
            if(_loc1_.cor >= 75)
            {
               output.text("你发现自己幻想着生下长满纤毛的蠕虫，每次它们成千上万的毒刺擦过你的阴蒂，让它充满增强感觉的药物时，你都会高潮。[bend][pg]");
            }
            if(int([DynStat.Spe(-1),DynStat.Lib(1),DynStat.Sens(1),DynStat.Lust(10 + _loc1_.lib / 20)].length) == 0)
            {
               KGAMECLASS.kGAMECLASS.player.dynStats();
            }
            else if(int([DynStat.Spe(-1),DynStat.Lib(1),DynStat.Sens(1),DynStat.Lust(10 + _loc1_.lib / 20)].length) == 1)
            {
               KGAMECLASS.kGAMECLASS.player.dynStats([DynStat.Spe(-1),DynStat.Lib(1),DynStat.Sens(1),DynStat.Lust(10 + _loc1_.lib / 20)][0]);
            }
            else if(int([DynStat.Spe(-1),DynStat.Lib(1),DynStat.Sens(1),DynStat.Lust(10 + _loc1_.lib / 20)].length) == 2)
            {
               KGAMECLASS.kGAMECLASS.player.dynStats([DynStat.Spe(-1),DynStat.Lib(1),DynStat.Sens(1),DynStat.Lust(10 + _loc1_.lib / 20)][0],[DynStat.Spe(-1),DynStat.Lib(1),DynStat.Sens(1),DynStat.Lust(10 + _loc1_.lib / 20)][1]);
            }
            else if(int([DynStat.Spe(-1),DynStat.Lib(1),DynStat.Sens(1),DynStat.Lust(10 + _loc1_.lib / 20)].length) == 3)
            {
               KGAMECLASS.kGAMECLASS.player.dynStats([DynStat.Spe(-1),DynStat.Lib(1),DynStat.Sens(1),DynStat.Lust(10 + _loc1_.lib / 20)][0],[DynStat.Spe(-1),DynStat.Lib(1),DynStat.Sens(1),DynStat.Lust(10 + _loc1_.lib / 20)][1],[DynStat.Spe(-1),DynStat.Lib(1),DynStat.Sens(1),DynStat.Lust(10 + _loc1_.lib / 20)][2]);
            }
            else if(int([DynStat.Spe(-1),DynStat.Lib(1),DynStat.Sens(1),DynStat.Lust(10 + _loc1_.lib / 20)].length) == 4)
            {
               KGAMECLASS.kGAMECLASS.player.dynStats([DynStat.Spe(-1),DynStat.Lib(1),DynStat.Sens(1),DynStat.Lust(10 + _loc1_.lib / 20)][0],[DynStat.Spe(-1),DynStat.Lib(1),DynStat.Sens(1),DynStat.Lust(10 + _loc1_.lib / 20)][1],[DynStat.Spe(-1),DynStat.Lib(1),DynStat.Sens(1),DynStat.Lust(10 + _loc1_.lib / 20)][2],[DynStat.Spe(-1),DynStat.Lib(1),DynStat.Sens(1),DynStat.Lust(10 + _loc1_.lib / 20)][3]);
            }
            else if(int([DynStat.Spe(-1),DynStat.Lib(1),DynStat.Sens(1),DynStat.Lust(10 + _loc1_.lib / 20)].length) == 5)
            {
               KGAMECLASS.kGAMECLASS.player.dynStats([DynStat.Spe(-1),DynStat.Lib(1),DynStat.Sens(1),DynStat.Lust(10 + _loc1_.lib / 20)][0],[DynStat.Spe(-1),DynStat.Lib(1),DynStat.Sens(1),DynStat.Lust(10 + _loc1_.lib / 20)][1],[DynStat.Spe(-1),DynStat.Lib(1),DynStat.Sens(1),DynStat.Lust(10 + _loc1_.lib / 20)][2],[DynStat.Spe(-1),DynStat.Lib(1),DynStat.Sens(1),DynStat.Lust(10 + _loc1_.lib / 20)][3],[DynStat.Spe(-1),DynStat.Lib(1),DynStat.Sens(1),DynStat.Lust(10 + _loc1_.lib / 20)][4]);
            }
            else if(int([DynStat.Spe(-1),DynStat.Lib(1),DynStat.Sens(1),DynStat.Lust(10 + _loc1_.lib / 20)].length) == 6)
            {
               KGAMECLASS.kGAMECLASS.player.dynStats([DynStat.Spe(-1),DynStat.Lib(1),DynStat.Sens(1),DynStat.Lust(10 + _loc1_.lib / 20)][0],[DynStat.Spe(-1),DynStat.Lib(1),DynStat.Sens(1),DynStat.Lust(10 + _loc1_.lib / 20)][1],[DynStat.Spe(-1),DynStat.Lib(1),DynStat.Sens(1),DynStat.Lust(10 + _loc1_.lib / 20)][2],[DynStat.Spe(-1),DynStat.Lib(1),DynStat.Sens(1),DynStat.Lust(10 + _loc1_.lib / 20)][3],[DynStat.Spe(-1),DynStat.Lib(1),DynStat.Sens(1),DynStat.Lust(10 + _loc1_.lib / 20)][4],[DynStat.Spe(-1),DynStat.Lib(1),DynStat.Sens(1),DynStat.Lust(10 + _loc1_.lib / 20)][5]);
            }
            else if(int([DynStat.Spe(-1),DynStat.Lib(1),DynStat.Sens(1),DynStat.Lust(10 + _loc1_.lib / 20)].length) == 7)
            {
               KGAMECLASS.kGAMECLASS.player.dynStats([DynStat.Spe(-1),DynStat.Lib(1),DynStat.Sens(1),DynStat.Lust(10 + _loc1_.lib / 20)][0],[DynStat.Spe(-1),DynStat.Lib(1),DynStat.Sens(1),DynStat.Lust(10 + _loc1_.lib / 20)][1],[DynStat.Spe(-1),DynStat.Lib(1),DynStat.Sens(1),DynStat.Lust(10 + _loc1_.lib / 20)][2],[DynStat.Spe(-1),DynStat.Lib(1),DynStat.Sens(1),DynStat.Lust(10 + _loc1_.lib / 20)][3],[DynStat.Spe(-1),DynStat.Lib(1),DynStat.Sens(1),DynStat.Lust(10 + _loc1_.lib / 20)][4],[DynStat.Spe(-1),DynStat.Lib(1),DynStat.Sens(1),DynStat.Lust(10 + _loc1_.lib / 20)][5],[DynStat.Spe(-1),DynStat.Lib(1),DynStat.Sens(1),DynStat.Lust(10 + _loc1_.lib / 20)][6]);
            }
            else if(int([DynStat.Spe(-1),DynStat.Lib(1),DynStat.Sens(1),DynStat.Lust(10 + _loc1_.lib / 20)].length) == 8)
            {
               KGAMECLASS.kGAMECLASS.player.dynStats([DynStat.Spe(-1),DynStat.Lib(1),DynStat.Sens(1),DynStat.Lust(10 + _loc1_.lib / 20)][0],[DynStat.Spe(-1),DynStat.Lib(1),DynStat.Sens(1),DynStat.Lust(10 + _loc1_.lib / 20)][1],[DynStat.Spe(-1),DynStat.Lib(1),DynStat.Sens(1),DynStat.Lust(10 + _loc1_.lib / 20)][2],[DynStat.Spe(-1),DynStat.Lib(1),DynStat.Sens(1),DynStat.Lust(10 + _loc1_.lib / 20)][3],[DynStat.Spe(-1),DynStat.Lib(1),DynStat.Sens(1),DynStat.Lust(10 + _loc1_.lib / 20)][4],[DynStat.Spe(-1),DynStat.Lib(1),DynStat.Sens(1),DynStat.Lust(10 + _loc1_.lib / 20)][5],[DynStat.Spe(-1),DynStat.Lib(1),DynStat.Sens(1),DynStat.Lust(10 + _loc1_.lib / 20)][6],[DynStat.Spe(-1),DynStat.Lib(1),DynStat.Sens(1),DynStat.Lust(10 + _loc1_.lib / 20)][7]);
            }
            else if(int([DynStat.Spe(-1),DynStat.Lib(1),DynStat.Sens(1),DynStat.Lust(10 + _loc1_.lib / 20)].length) == 9)
            {
               KGAMECLASS.kGAMECLASS.player.dynStats([DynStat.Spe(-1),DynStat.Lib(1),DynStat.Sens(1),DynStat.Lust(10 + _loc1_.lib / 20)][0],[DynStat.Spe(-1),DynStat.Lib(1),DynStat.Sens(1),DynStat.Lust(10 + _loc1_.lib / 20)][1],[DynStat.Spe(-1),DynStat.Lib(1),DynStat.Sens(1),DynStat.Lust(10 + _loc1_.lib / 20)][2],[DynStat.Spe(-1),DynStat.Lib(1),DynStat.Sens(1),DynStat.Lust(10 + _loc1_.lib / 20)][3],[DynStat.Spe(-1),DynStat.Lib(1),DynStat.Sens(1),DynStat.Lust(10 + _loc1_.lib / 20)][4],[DynStat.Spe(-1),DynStat.Lib(1),DynStat.Sens(1),DynStat.Lust(10 + _loc1_.lib / 20)][5],[DynStat.Spe(-1),DynStat.Lib(1),DynStat.Sens(1),DynStat.Lust(10 + _loc1_.lib / 20)][6],[DynStat.Spe(-1),DynStat.Lib(1),DynStat.Sens(1),DynStat.Lust(10 + _loc1_.lib / 20)][7],[DynStat.Spe(-1),DynStat.Lib(1),DynStat.Sens(1),DynStat.Lust(10 + _loc1_.lib / 20)][8]);
            }
            else if(int([DynStat.Spe(-1),DynStat.Lib(1),DynStat.Sens(1),DynStat.Lust(10 + _loc1_.lib / 20)].length) == 10)
            {
               KGAMECLASS.kGAMECLASS.player.dynStats([DynStat.Spe(-1),DynStat.Lib(1),DynStat.Sens(1),DynStat.Lust(10 + _loc1_.lib / 20)][0],[DynStat.Spe(-1),DynStat.Lib(1),DynStat.Sens(1),DynStat.Lust(10 + _loc1_.lib / 20)][1],[DynStat.Spe(-1),DynStat.Lib(1),DynStat.Sens(1),DynStat.Lust(10 + _loc1_.lib / 20)][2],[DynStat.Spe(-1),DynStat.Lib(1),DynStat.Sens(1),DynStat.Lust(10 + _loc1_.lib / 20)][3],[DynStat.Spe(-1),DynStat.Lib(1),DynStat.Sens(1),DynStat.Lust(10 + _loc1_.lib / 20)][4],[DynStat.Spe(-1),DynStat.Lib(1),DynStat.Sens(1),DynStat.Lust(10 + _loc1_.lib / 20)][5],[DynStat.Spe(-1),DynStat.Lib(1),DynStat.Sens(1),DynStat.Lust(10 + _loc1_.lib / 20)][6],[DynStat.Spe(-1),DynStat.Lib(1),DynStat.Sens(1),DynStat.Lust(10 + _loc1_.lib / 20)][7],[DynStat.Spe(-1),DynStat.Lib(1),DynStat.Sens(1),DynStat.Lust(10 + _loc1_.lib / 20)][8],[DynStat.Spe(-1),DynStat.Lib(1),DynStat.Sens(1),DynStat.Lust(10 + _loc1_.lib / 20)][9]);
            }
            else if(int([DynStat.Spe(-1),DynStat.Lib(1),DynStat.Sens(1),DynStat.Lust(10 + _loc1_.lib / 20)].length) == 11)
            {
               KGAMECLASS.kGAMECLASS.player.dynStats([DynStat.Spe(-1),DynStat.Lib(1),DynStat.Sens(1),DynStat.Lust(10 + _loc1_.lib / 20)][0],[DynStat.Spe(-1),DynStat.Lib(1),DynStat.Sens(1),DynStat.Lust(10 + _loc1_.lib / 20)][1],[DynStat.Spe(-1),DynStat.Lib(1),DynStat.Sens(1),DynStat.Lust(10 + _loc1_.lib / 20)][2],[DynStat.Spe(-1),DynStat.Lib(1),DynStat.Sens(1),DynStat.Lust(10 + _loc1_.lib / 20)][3],[DynStat.Spe(-1),DynStat.Lib(1),DynStat.Sens(1),DynStat.Lust(10 + _loc1_.lib / 20)][4],[DynStat.Spe(-1),DynStat.Lib(1),DynStat.Sens(1),DynStat.Lust(10 + _loc1_.lib / 20)][5],[DynStat.Spe(-1),DynStat.Lib(1),DynStat.Sens(1),DynStat.Lust(10 + _loc1_.lib / 20)][6],[DynStat.Spe(-1),DynStat.Lib(1),DynStat.Sens(1),DynStat.Lust(10 + _loc1_.lib / 20)][7],[DynStat.Spe(-1),DynStat.Lib(1),DynStat.Sens(1),DynStat.Lust(10 + _loc1_.lib / 20)][8],[DynStat.Spe(-1),DynStat.Lib(1),DynStat.Sens(1),DynStat.Lust(10 + _loc1_.lib / 20)][9],[DynStat.Spe(-1),DynStat.Lib(1),DynStat.Sens(1),DynStat.Lust(10 + _loc1_.lib / 20)][10]);
            }
            else if(int([DynStat.Spe(-1),DynStat.Lib(1),DynStat.Sens(1),DynStat.Lust(10 + _loc1_.lib / 20)].length) == 12)
            {
               KGAMECLASS.kGAMECLASS.player.dynStats([DynStat.Spe(-1),DynStat.Lib(1),DynStat.Sens(1),DynStat.Lust(10 + _loc1_.lib / 20)][0],[DynStat.Spe(-1),DynStat.Lib(1),DynStat.Sens(1),DynStat.Lust(10 + _loc1_.lib / 20)][1],[DynStat.Spe(-1),DynStat.Lib(1),DynStat.Sens(1),DynStat.Lust(10 + _loc1_.lib / 20)][2],[DynStat.Spe(-1),DynStat.Lib(1),DynStat.Sens(1),DynStat.Lust(10 + _loc1_.lib / 20)][3],[DynStat.Spe(-1),DynStat.Lib(1),DynStat.Sens(1),DynStat.Lust(10 + _loc1_.lib / 20)][4],[DynStat.Spe(-1),DynStat.Lib(1),DynStat.Sens(1),DynStat.Lust(10 + _loc1_.lib / 20)][5],[DynStat.Spe(-1),DynStat.Lib(1),DynStat.Sens(1),DynStat.Lust(10 + _loc1_.lib / 20)][6],[DynStat.Spe(-1),DynStat.Lib(1),DynStat.Sens(1),DynStat.Lust(10 + _loc1_.lib / 20)][7],[DynStat.Spe(-1),DynStat.Lib(1),DynStat.Sens(1),DynStat.Lust(10 + _loc1_.lib / 20)][8],[DynStat.Spe(-1),DynStat.Lib(1),DynStat.Sens(1),DynStat.Lust(10 + _loc1_.lib / 20)][9],[DynStat.Spe(-1),DynStat.Lib(1),DynStat.Sens(1),DynStat.Lust(10 + _loc1_.lib / 20)][10],[DynStat
               .Spe(-1),DynStat.Lib(1),DynStat.Sens(1),DynStat.Lust(10 + _loc1_.lib / 20)][11]);
            }
            else if(int([DynStat.Spe(-1),DynStat.Lib(1),DynStat.Sens(1),DynStat.Lust(10 + _loc1_.lib / 20)].length) == 13)
            {
               KGAMECLASS.kGAMECLASS.player.dynStats([DynStat.Spe(-1),DynStat.Lib(1),DynStat.Sens(1),DynStat.Lust(10 + _loc1_.lib / 20)][0],[DynStat.Spe(-1),DynStat.Lib(1),DynStat.Sens(1),DynStat.Lust(10 + _loc1_.lib / 20)][1],[DynStat.Spe(-1),DynStat.Lib(1),DynStat.Sens(1),DynStat.Lust(10 + _loc1_.lib / 20)][2],[DynStat.Spe(-1),DynStat.Lib(1),DynStat.Sens(1),DynStat.Lust(10 + _loc1_.lib / 20)][3],[DynStat.Spe(-1),DynStat.Lib(1),DynStat.Sens(1),DynStat.Lust(10 + _loc1_.lib / 20)][4],[DynStat.Spe(-1),DynStat.Lib(1),DynStat.Sens(1),DynStat.Lust(10 + _loc1_.lib / 20)][5],[DynStat.Spe(-1),DynStat.Lib(1),DynStat.Sens(1),DynStat.Lust(10 + _loc1_.lib / 20)][6],[DynStat.Spe(-1),DynStat.Lib(1),DynStat.Sens(1),DynStat.Lust(10 + _loc1_.lib / 20)][7],[DynStat.Spe(-1),DynStat.Lib(1),DynStat.Sens(1),DynStat.Lust(10 + _loc1_.lib / 20)][8],[DynStat.Spe(-1),DynStat.Lib(1),DynStat.Sens(1),DynStat.Lust(10 + _loc1_.lib / 20)][9],[DynStat.Spe(-1),DynStat.Lib(1),DynStat.Sens(1),DynStat.Lust(10 + _loc1_.lib / 20)][10],[DynStat
               .Spe(-1),DynStat.Lib(1),DynStat.Sens(1),DynStat.Lust(10 + _loc1_.lib / 20)][11],[DynStat.Spe(-1),DynStat.Lib(1),DynStat.Sens(1),DynStat.Lust(10 + _loc1_.lib / 20)][12]);
            }
            else if(int([DynStat.Spe(-1),DynStat.Lib(1),DynStat.Sens(1),DynStat.Lust(10 + _loc1_.lib / 20)].length) == 14)
            {
               KGAMECLASS.kGAMECLASS.player.dynStats([DynStat.Spe(-1),DynStat.Lib(1),DynStat.Sens(1),DynStat.Lust(10 + _loc1_.lib / 20)][0],[DynStat.Spe(-1),DynStat.Lib(1),DynStat.Sens(1),DynStat.Lust(10 + _loc1_.lib / 20)][1],[DynStat.Spe(-1),DynStat.Lib(1),DynStat.Sens(1),DynStat.Lust(10 + _loc1_.lib / 20)][2],[DynStat.Spe(-1),DynStat.Lib(1),DynStat.Sens(1),DynStat.Lust(10 + _loc1_.lib / 20)][3],[DynStat.Spe(-1),DynStat.Lib(1),DynStat.Sens(1),DynStat.Lust(10 + _loc1_.lib / 20)][4],[DynStat.Spe(-1),DynStat.Lib(1),DynStat.Sens(1),DynStat.Lust(10 + _loc1_.lib / 20)][5],[DynStat.Spe(-1),DynStat.Lib(1),DynStat.Sens(1),DynStat.Lust(10 + _loc1_.lib / 20)][6],[DynStat.Spe(-1),DynStat.Lib(1),DynStat.Sens(1),DynStat.Lust(10 + _loc1_.lib / 20)][7],[DynStat.Spe(-1),DynStat.Lib(1),DynStat.Sens(1),DynStat.Lust(10 + _loc1_.lib / 20)][8],[DynStat.Spe(-1),DynStat.Lib(1),DynStat.Sens(1),DynStat.Lust(10 + _loc1_.lib / 20)][9],[DynStat.Spe(-1),DynStat.Lib(1),DynStat.Sens(1),DynStat.Lust(10 + _loc1_.lib / 20)][10],[DynStat
               .Spe(-1),DynStat.Lib(1),DynStat.Sens(1),DynStat.Lust(10 + _loc1_.lib / 20)][11],[DynStat.Spe(-1),DynStat.Lib(1),DynStat.Sens(1),DynStat.Lust(10 + _loc1_.lib / 20)][12],[DynStat.Spe(-1),DynStat.Lib(1),DynStat.Sens(1),DynStat.Lust(10 + _loc1_.lib / 20)][13]);
            }
            else if(int([DynStat.Spe(-1),DynStat.Lib(1),DynStat.Sens(1),DynStat.Lust(10 + _loc1_.lib / 20)].length) == 15)
            {
               KGAMECLASS.kGAMECLASS.player.dynStats([DynStat.Spe(-1),DynStat.Lib(1),DynStat.Sens(1),DynStat.Lust(10 + _loc1_.lib / 20)][0],[DynStat.Spe(-1),DynStat.Lib(1),DynStat.Sens(1),DynStat.Lust(10 + _loc1_.lib / 20)][1],[DynStat.Spe(-1),DynStat.Lib(1),DynStat.Sens(1),DynStat.Lust(10 + _loc1_.lib / 20)][2],[DynStat.Spe(-1),DynStat.Lib(1),DynStat.Sens(1),DynStat.Lust(10 + _loc1_.lib / 20)][3],[DynStat.Spe(-1),DynStat.Lib(1),DynStat.Sens(1),DynStat.Lust(10 + _loc1_.lib / 20)][4],[DynStat.Spe(-1),DynStat.Lib(1),DynStat.Sens(1),DynStat.Lust(10 + _loc1_.lib / 20)][5],[DynStat.Spe(-1),DynStat.Lib(1),DynStat.Sens(1),DynStat.Lust(10 + _loc1_.lib / 20)][6],[DynStat.Spe(-1),DynStat.Lib(1),DynStat.Sens(1),DynStat.Lust(10 + _loc1_.lib / 20)][7],[DynStat.Spe(-1),DynStat.Lib(1),DynStat.Sens(1),DynStat.Lust(10 + _loc1_.lib / 20)][8],[DynStat.Spe(-1),DynStat.Lib(1),DynStat.Sens(1),DynStat.Lust(10 + _loc1_.lib / 20)][9],[DynStat.Spe(-1),DynStat.Lib(1),DynStat.Sens(1),DynStat.Lust(10 + _loc1_.lib / 20)][10],[DynStat
               .Spe(-1),DynStat.Lib(1),DynStat.Sens(1),DynStat.Lust(10 + _loc1_.lib / 20)][11],[DynStat.Spe(-1),DynStat.Lib(1),DynStat.Sens(1),DynStat.Lust(10 + _loc1_.lib / 20)][12],[DynStat.Spe(-1),DynStat.Lib(1),DynStat.Sens(1),DynStat.Lust(10 + _loc1_.lib / 20)][13],[DynStat.Spe(-1),DynStat.Lib(1),DynStat.Sens(1),DynStat.Lust(10 + _loc1_.lib / 20)][14]);
            }
            else if(int([DynStat.Spe(-1),DynStat.Lib(1),DynStat.Sens(1),DynStat.Lust(10 + _loc1_.lib / 20)].length) == 16)
            {
               KGAMECLASS.kGAMECLASS.player.dynStats([DynStat.Spe(-1),DynStat.Lib(1),DynStat.Sens(1),DynStat.Lust(10 + _loc1_.lib / 20)][0],[DynStat.Spe(-1),DynStat.Lib(1),DynStat.Sens(1),DynStat.Lust(10 + _loc1_.lib / 20)][1],[DynStat.Spe(-1),DynStat.Lib(1),DynStat.Sens(1),DynStat.Lust(10 + _loc1_.lib / 20)][2],[DynStat.Spe(-1),DynStat.Lib(1),DynStat.Sens(1),DynStat.Lust(10 + _loc1_.lib / 20)][3],[DynStat.Spe(-1),DynStat.Lib(1),DynStat.Sens(1),DynStat.Lust(10 + _loc1_.lib / 20)][4],[DynStat.Spe(-1),DynStat.Lib(1),DynStat.Sens(1),DynStat.Lust(10 + _loc1_.lib / 20)][5],[DynStat.Spe(-1),DynStat.Lib(1),DynStat.Sens(1),DynStat.Lust(10 + _loc1_.lib / 20)][6],[DynStat.Spe(-1),DynStat.Lib(1),DynStat.Sens(1),DynStat.Lust(10 + _loc1_.lib / 20)][7],[DynStat.Spe(-1),DynStat.Lib(1),DynStat.Sens(1),DynStat.Lust(10 + _loc1_.lib / 20)][8],[DynStat.Spe(-1),DynStat.Lib(1),DynStat.Sens(1),DynStat.Lust(10 + _loc1_.lib / 20)][9],[DynStat.Spe(-1),DynStat.Lib(1),DynStat.Sens(1),DynStat.Lust(10 + _loc1_.lib / 20)][10],[DynStat
               .Spe(-1),DynStat.Lib(1),DynStat.Sens(1),DynStat.Lust(10 + _loc1_.lib / 20)][11],[DynStat.Spe(-1),DynStat.Lib(1),DynStat.Sens(1),DynStat.Lust(10 + _loc1_.lib / 20)][12],[DynStat.Spe(-1),DynStat.Lib(1),DynStat.Sens(1),DynStat.Lust(10 + _loc1_.lib / 20)][13],[DynStat.Spe(-1),DynStat.Lib(1),DynStat.Sens(1),DynStat.Lust(10 + _loc1_.lib / 20)][14],[DynStat.Spe(-1),DynStat.Lib(1),DynStat.Sens(1),DynStat.Lust(10 + _loc1_.lib / 20)][15]);
            }
            else if(int([DynStat.Spe(-1),DynStat.Lib(1),DynStat.Sens(1),DynStat.Lust(10 + _loc1_.lib / 20)].length) == 17)
            {
               KGAMECLASS.kGAMECLASS.player.dynStats([DynStat.Spe(-1),DynStat.Lib(1),DynStat.Sens(1),DynStat.Lust(10 + _loc1_.lib / 20)][0],[DynStat.Spe(-1),DynStat.Lib(1),DynStat.Sens(1),DynStat.Lust(10 + _loc1_.lib / 20)][1],[DynStat.Spe(-1),DynStat.Lib(1),DynStat.Sens(1),DynStat.Lust(10 + _loc1_.lib / 20)][2],[DynStat.Spe(-1),DynStat.Lib(1),DynStat.Sens(1),DynStat.Lust(10 + _loc1_.lib / 20)][3],[DynStat.Spe(-1),DynStat.Lib(1),DynStat.Sens(1),DynStat.Lust(10 + _loc1_.lib / 20)][4],[DynStat.Spe(-1),DynStat.Lib(1),DynStat.Sens(1),DynStat.Lust(10 + _loc1_.lib / 20)][5],[DynStat.Spe(-1),DynStat.Lib(1),DynStat.Sens(1),DynStat.Lust(10 + _loc1_.lib / 20)][6],[DynStat.Spe(-1),DynStat.Lib(1),DynStat.Sens(1),DynStat.Lust(10 + _loc1_.lib / 20)][7],[DynStat.Spe(-1),DynStat.Lib(1),DynStat.Sens(1),DynStat.Lust(10 + _loc1_.lib / 20)][8],[DynStat.Spe(-1),DynStat.Lib(1),DynStat.Sens(1),DynStat.Lust(10 + _loc1_.lib / 20)][9],[DynStat.Spe(-1),DynStat.Lib(1),DynStat.Sens(1),DynStat.Lust(10 + _loc1_.lib / 20)][10],[DynStat
               .Spe(-1),DynStat.Lib(1),DynStat.Sens(1),DynStat.Lust(10 + _loc1_.lib / 20)][11],[DynStat.Spe(-1),DynStat.Lib(1),DynStat.Sens(1),DynStat.Lust(10 + _loc1_.lib / 20)][12],[DynStat.Spe(-1),DynStat.Lib(1),DynStat.Sens(1),DynStat.Lust(10 + _loc1_.lib / 20)][13],[DynStat.Spe(-1),DynStat.Lib(1),DynStat.Sens(1),DynStat.Lust(10 + _loc1_.lib / 20)][14],[DynStat.Spe(-1),DynStat.Lib(1),DynStat.Sens(1),DynStat.Lust(10 + _loc1_.lib / 20)][15],[DynStat.Spe(-1),DynStat.Lib(1),DynStat.Sens(1),DynStat.Lust(10 + _loc1_.lib / 20)][16]);
            }
            else if(int([DynStat.Spe(-1),DynStat.Lib(1),DynStat.Sens(1),DynStat.Lust(10 + _loc1_.lib / 20)].length) == 18)
            {
               KGAMECLASS.kGAMECLASS.player.dynStats([DynStat.Spe(-1),DynStat.Lib(1),DynStat.Sens(1),DynStat.Lust(10 + _loc1_.lib / 20)][0],[DynStat.Spe(-1),DynStat.Lib(1),DynStat.Sens(1),DynStat.Lust(10 + _loc1_.lib / 20)][1],[DynStat.Spe(-1),DynStat.Lib(1),DynStat.Sens(1),DynStat.Lust(10 + _loc1_.lib / 20)][2],[DynStat.Spe(-1),DynStat.Lib(1),DynStat.Sens(1),DynStat.Lust(10 + _loc1_.lib / 20)][3],[DynStat.Spe(-1),DynStat.Lib(1),DynStat.Sens(1),DynStat.Lust(10 + _loc1_.lib / 20)][4],[DynStat.Spe(-1),DynStat.Lib(1),DynStat.Sens(1),DynStat.Lust(10 + _loc1_.lib / 20)][5],[DynStat.Spe(-1),DynStat.Lib(1),DynStat.Sens(1),DynStat.Lust(10 + _loc1_.lib / 20)][6],[DynStat.Spe(-1),DynStat.Lib(1),DynStat.Sens(1),DynStat.Lust(10 + _loc1_.lib / 20)][7],[DynStat.Spe(-1),DynStat.Lib(1),DynStat.Sens(1),DynStat.Lust(10 + _loc1_.lib / 20)][8],[DynStat.Spe(-1),DynStat.Lib(1),DynStat.Sens(1),DynStat.Lust(10 + _loc1_.lib / 20)][9],[DynStat.Spe(-1),DynStat.Lib(1),DynStat.Sens(1),DynStat.Lust(10 + _loc1_.lib / 20)][10],[DynStat
               .Spe(-1),DynStat.Lib(1),DynStat.Sens(1),DynStat.Lust(10 + _loc1_.lib / 20)][11],[DynStat.Spe(-1),DynStat.Lib(1),DynStat.Sens(1),DynStat.Lust(10 + _loc1_.lib / 20)][12],[DynStat.Spe(-1),DynStat.Lib(1),DynStat.Sens(1),DynStat.Lust(10 + _loc1_.lib / 20)][13],[DynStat.Spe(-1),DynStat.Lib(1),DynStat.Sens(1),DynStat.Lust(10 + _loc1_.lib / 20)][14],[DynStat.Spe(-1),DynStat.Lib(1),DynStat.Sens(1),DynStat.Lust(10 + _loc1_.lib / 20)][15],[DynStat.Spe(-1),DynStat.Lib(1),DynStat.Sens(1),DynStat.Lust(10 + _loc1_.lib / 20)][16],[DynStat.Spe(-1),DynStat.Lib(1),DynStat.Sens(1),DynStat.Lust(10 + _loc1_.lib / 20)][17]);
            }
            else if(int([DynStat.Spe(-1),DynStat.Lib(1),DynStat.Sens(1),DynStat.Lust(10 + _loc1_.lib / 20)].length) == 19)
            {
               KGAMECLASS.kGAMECLASS.player.dynStats([DynStat.Spe(-1),DynStat.Lib(1),DynStat.Sens(1),DynStat.Lust(10 + _loc1_.lib / 20)][0],[DynStat.Spe(-1),DynStat.Lib(1),DynStat.Sens(1),DynStat.Lust(10 + _loc1_.lib / 20)][1],[DynStat.Spe(-1),DynStat.Lib(1),DynStat.Sens(1),DynStat.Lust(10 + _loc1_.lib / 20)][2],[DynStat.Spe(-1),DynStat.Lib(1),DynStat.Sens(1),DynStat.Lust(10 + _loc1_.lib / 20)][3],[DynStat.Spe(-1),DynStat.Lib(1),DynStat.Sens(1),DynStat.Lust(10 + _loc1_.lib / 20)][4],[DynStat.Spe(-1),DynStat.Lib(1),DynStat.Sens(1),DynStat.Lust(10 + _loc1_.lib / 20)][5],[DynStat.Spe(-1),DynStat.Lib(1),DynStat.Sens(1),DynStat.Lust(10 + _loc1_.lib / 20)][6],[DynStat.Spe(-1),DynStat.Lib(1),DynStat.Sens(1),DynStat.Lust(10 + _loc1_.lib / 20)][7],[DynStat.Spe(-1),DynStat.Lib(1),DynStat.Sens(1),DynStat.Lust(10 + _loc1_.lib / 20)][8],[DynStat.Spe(-1),DynStat.Lib(1),DynStat.Sens(1),DynStat.Lust(10 + _loc1_.lib / 20)][9],[DynStat.Spe(-1),DynStat.Lib(1),DynStat.Sens(1),DynStat.Lust(10 + _loc1_.lib / 20)][10],[DynStat
               .Spe(-1),DynStat.Lib(1),DynStat.Sens(1),DynStat.Lust(10 + _loc1_.lib / 20)][11],[DynStat.Spe(-1),DynStat.Lib(1),DynStat.Sens(1),DynStat.Lust(10 + _loc1_.lib / 20)][12],[DynStat.Spe(-1),DynStat.Lib(1),DynStat.Sens(1),DynStat.Lust(10 + _loc1_.lib / 20)][13],[DynStat.Spe(-1),DynStat.Lib(1),DynStat.Sens(1),DynStat.Lust(10 + _loc1_.lib / 20)][14],[DynStat.Spe(-1),DynStat.Lib(1),DynStat.Sens(1),DynStat.Lust(10 + _loc1_.lib / 20)][15],[DynStat.Spe(-1),DynStat.Lib(1),DynStat.Sens(1),DynStat.Lust(10 + _loc1_.lib / 20)][16],[DynStat.Spe(-1),DynStat.Lib(1),DynStat.Sens(1),DynStat.Lust(10 + _loc1_.lib / 20)][17],[DynStat.Spe(-1),DynStat.Lib(1),DynStat.Sens(1),DynStat.Lust(10 + _loc1_.lib / 20)][18]);
            }
            else
            {
               if(int([DynStat.Spe(-1),DynStat.Lib(1),DynStat.Sens(1),DynStat.Lust(10 + _loc1_.lib / 20)].length) != 20)
               {
                  throw "Too many rest arguments";
               }
               KGAMECLASS.kGAMECLASS.player.dynStats([DynStat.Spe(-1),DynStat.Lib(1),DynStat.Sens(1),DynStat.Lust(10 + _loc1_.lib / 20)][0],[DynStat.Spe(-1),DynStat.Lib(1),DynStat.Sens(1),DynStat.Lust(10 + _loc1_.lib / 20)][1],[DynStat.Spe(-1),DynStat.Lib(1),DynStat.Sens(1),DynStat.Lust(10 + _loc1_.lib / 20)][2],[DynStat.Spe(-1),DynStat.Lib(1),DynStat.Sens(1),DynStat.Lust(10 + _loc1_.lib / 20)][3],[DynStat.Spe(-1),DynStat.Lib(1),DynStat.Sens(1),DynStat.Lust(10 + _loc1_.lib / 20)][4],[DynStat.Spe(-1),DynStat.Lib(1),DynStat.Sens(1),DynStat.Lust(10 + _loc1_.lib / 20)][5],[DynStat.Spe(-1),DynStat.Lib(1),DynStat.Sens(1),DynStat.Lust(10 + _loc1_.lib / 20)][6],[DynStat.Spe(-1),DynStat.Lib(1),DynStat.Sens(1),DynStat.Lust(10 + _loc1_.lib / 20)][7],[DynStat.Spe(-1),DynStat.Lib(1),DynStat.Sens(1),DynStat.Lust(10 + _loc1_.lib / 20)][8],[DynStat.Spe(-1),DynStat.Lib(1),DynStat.Sens(1),DynStat.Lust(10 + _loc1_.lib / 20)][9],[DynStat.Spe(-1),DynStat.Lib(1),DynStat.Sens(1),DynStat.Lust(10 + _loc1_.lib / 20)][10],[DynStat
               .Spe(-1),DynStat.Lib(1),DynStat.Sens(1),DynStat.Lust(10 + _loc1_.lib / 20)][11],[DynStat.Spe(-1),DynStat.Lib(1),DynStat.Sens(1),DynStat.Lust(10 + _loc1_.lib / 20)][12],[DynStat.Spe(-1),DynStat.Lib(1),DynStat.Sens(1),DynStat.Lust(10 + _loc1_.lib / 20)][13],[DynStat.Spe(-1),DynStat.Lib(1),DynStat.Sens(1),DynStat.Lust(10 + _loc1_.lib / 20)][14],[DynStat.Spe(-1),DynStat.Lib(1),DynStat.Sens(1),DynStat.Lust(10 + _loc1_.lib / 20)][15],[DynStat.Spe(-1),DynStat.Lib(1),DynStat.Sens(1),DynStat.Lust(10 + _loc1_.lib / 20)][16],[DynStat.Spe(-1),DynStat.Lib(1),DynStat.Sens(1),DynStat.Lust(10 + _loc1_.lib / 20)][17],[DynStat.Spe(-1),DynStat.Lib(1),DynStat.Sens(1),DynStat.Lust(10 + _loc1_.lib / 20)][18],[DynStat.Spe(-1),DynStat.Lib(1),DynStat.Sens(1),DynStat.Lust(10 + _loc1_.lib / 20)][19]);
            }
            _loc2_ = true;
         }
         return _loc2_;
      }
      
      public function anemoneWater() : void
      {
         KGAMECLASS.kGAMECLASS.output.clear();
         output.text("不管是不是寄生虫，你的[paternal]本能都不允许你让这个可怜的小东西枯萎。你挣扎着站起来，立刻感到一阵眩晕。在这种状态下，你绝对到不了小溪边。[if (builtbarrel) {环顾四周，最近的水源似乎是一个木桶。就它了。}]");
         output.text("[pg][if (builtbarrel) {你笨拙地跌跌撞撞走过去，把海葵茎干扔进水里。|你脑子转得飞快，得出结论：你必须把它扔过去。这个小小的茎状生物痛苦地扭动着，但稍微抚摸一下它就平静下来了。趁它不动的时候，你稳住身子，把它[if (silly) {丢|扔}]向小溪！}]片刻之后，你倒在地上。是时候睡一觉来缓解疼痛了。");
         KGAMECLASS.kGAMECLASS.player.cuntChange(20,true,true,false);
         KGAMECLASS.kGAMECLASS.player.createStatusEffect(StatusEffects.CampAnemoneTrigger,0,0,0,0);
         KGAMECLASS.kGAMECLASS.player.knockUpForce();
         KGAMECLASS.kGAMECLASS.output.doNext(KGAMECLASS.kGAMECLASS.playerMenu);
      }
      
      public function anemoneRip() : void
      {
         KGAMECLASS.kGAMECLASS.output.clear();
         output.text("你咽了口唾沫，鼓起意志力继续。你用[claws]死死抓住，拼命想要抓紧，但让你恐惧的是，你" + (KGAMECLASS.kGAMECLASS.player.hasCockType(CockTypesEnum.ANEMONE) ? "已经" : "") + "能感觉到那种仿佛挖进自己肉里的剧痛。你强忍着这种感觉，咬紧牙关尖叫着，拼尽全力拉扯。寄生的海葵从你的腹股沟被撕裂下来！");
         output.text("[pg]你意识到自己现在大汗淋漓。再多一秒钟，它肯定就会扎根太深、太牢固而拔不出来了。你虚弱地注视着那根肉质的蓝色茎干，现在它看起来似乎也很痛苦。尽管经历了这场磨难，但这在技术上算是你的孩子……");
         KGAMECLASS.kGAMECLASS.output.menu();
         KGAMECLASS.kGAMECLASS.output.addNextButton("让它死",anemoneLetDie).hint("这是寄生虫，不是婴儿。");
         KGAMECLASS.kGAMECLASS.output.addNextButton("浇水",anemoneWater).hint("给它一个生存的机会。");
      }
      
      public function anemoneLetDie() : void
      {
         KGAMECLASS.kGAMECLASS.output.clear();
         output.text("毫不夸张地说，你今天把自己的阴茎扯了下来。任何给你这种体验的东西都必须死。你用尽最后的力气，把寄生虫从你身边扔开。它落在一些毫无生气的干涸泥土上，注定要枯萎死亡，而你则要在小睡中熬过这场磨难。");
         KGAMECLASS.kGAMECLASS.player.knockUpForce();
         KGAMECLASS.kGAMECLASS.output.doNext(KGAMECLASS.kGAMECLASS.playerMenu);
      }
      
      public function anemoneAccept() : void
      {
         var _loc1_:Player = KGAMECLASS.kGAMECLASS.player;
         KGAMECLASS.kGAMECLASS.output.clear();
         output.text("对它的抚摸只会让茎部变粗变硬；渐渐地，你注意到你感觉到了自己拉扯的感觉，不是来自附着点的皮肤，而是来自茎部本身，伴随着这种认识，触手环打开并向后拉，露出了阴茎的冠部！[b:你长出了一根新的海葵阴茎！]");
         if(_loc1_.cockTotal() > 0)
         {
            output.text(" 触手扭动着，摩擦着你的" + _loc1_.multiCockDescriptLight());
         }
         else
         {
            output.text("触手向内卷曲，摩擦着你新长出的蓝色肉棒的龟头");
         }
         _loc1_.createCock(4 + Utils.rand(3),1.2);
         _loc1_.cocks[_loc1_.cockTotal() - 1].set_cockType(CockTypesEnum.ANEMONE);
         output.text("，它们注入的催情剂让你迅速完全勃起。触手一遍又一遍地色情地抚摸着" + _loc1_.sMultiCockDesc() + "，留下令人酥麻的强烈快感");
         if(_loc1_.totalCocks() == 1 && _loc1_.balls == 0)
         {
            output.text("；你感觉到肉棒下方、靠近屁眼的地方积聚起一股压力");
         }
         output.text("。随着毒液和摩擦将你推向高潮的边缘，你的肌肉紧绷，一");
         if(_loc1_.cumQ() < 100)
         {
            output.text("大股");
         }
         else if(_loc1_.cumQ() < 500)
         {
            output.text("喷射");
         }
         else
         {
            output.text("喷洒");
         }
         output.text("的精液从你的新阴茎射出，落在了你的");
         if(_loc1_.biggestTitSize() >= 1)
         {
            output.text(_loc1_.allBreastsDescript() + "和");
         }
         output.text("肚子上");
         if(_loc1_.cockTotal() > 1)
         {
            output.text("，紧接着" + _loc1_.sMultiCockDesc() + "剩余的阴茎也喷出白色的液体");
         }
         output.text("。你的" + _loc1_.vaginaDescript(0) + "也颤抖着收缩，将");
         if(_loc1_.vaginas[0].vaginalWetness < 3)
         {
            output.text("一小股");
         }
         else if(_loc1_.vaginas[0].vaginalWetness < 5)
         {
            output.text("一股");
         }
         else
         {
            output.text("近乎一杯的液体");
         }
         output.text("从你女性高潮中喷出，汇入你屁股下方地面的水洼中。[pg]");
         _loc1_.orgasm("Vaginal");
         if(int([DynStat.Lib(2),DynStat.Sens(5)].length) == 0)
         {
            KGAMECLASS.kGAMECLASS.player.dynStats();
         }
         else if(int([DynStat.Lib(2),DynStat.Sens(5)].length) == 1)
         {
            KGAMECLASS.kGAMECLASS.player.dynStats([DynStat.Lib(2),DynStat.Sens(5)][0]);
         }
         else if(int([DynStat.Lib(2),DynStat.Sens(5)].length) == 2)
         {
            KGAMECLASS.kGAMECLASS.player.dynStats([DynStat.Lib(2),DynStat.Sens(5)][0],[DynStat.Lib(2),DynStat.Sens(5)][1]);
         }
         else if(int([DynStat.Lib(2),DynStat.Sens(5)].length) == 3)
         {
            KGAMECLASS.kGAMECLASS.player.dynStats([DynStat.Lib(2),DynStat.Sens(5)][0],[DynStat.Lib(2),DynStat.Sens(5)][1],[DynStat.Lib(2),DynStat.Sens(5)][2]);
         }
         else if(int([DynStat.Lib(2),DynStat.Sens(5)].length) == 4)
         {
            KGAMECLASS.kGAMECLASS.player.dynStats([DynStat.Lib(2),DynStat.Sens(5)][0],[DynStat.Lib(2),DynStat.Sens(5)][1],[DynStat.Lib(2),DynStat.Sens(5)][2],[DynStat.Lib(2),DynStat.Sens(5)][3]);
         }
         else if(int([DynStat.Lib(2),DynStat.Sens(5)].length) == 5)
         {
            KGAMECLASS.kGAMECLASS.player.dynStats([DynStat.Lib(2),DynStat.Sens(5)][0],[DynStat.Lib(2),DynStat.Sens(5)][1],[DynStat.Lib(2),DynStat.Sens(5)][2],[DynStat.Lib(2),DynStat.Sens(5)][3],[DynStat.Lib(2),DynStat.Sens(5)][4]);
         }
         else if(int([DynStat.Lib(2),DynStat.Sens(5)].length) == 6)
         {
            KGAMECLASS.kGAMECLASS.player.dynStats([DynStat.Lib(2),DynStat.Sens(5)][0],[DynStat.Lib(2),DynStat.Sens(5)][1],[DynStat.Lib(2),DynStat.Sens(5)][2],[DynStat.Lib(2),DynStat.Sens(5)][3],[DynStat.Lib(2),DynStat.Sens(5)][4],[DynStat.Lib(2),DynStat.Sens(5)][5]);
         }
         else if(int([DynStat.Lib(2),DynStat.Sens(5)].length) == 7)
         {
            KGAMECLASS.kGAMECLASS.player.dynStats([DynStat.Lib(2),DynStat.Sens(5)][0],[DynStat.Lib(2),DynStat.Sens(5)][1],[DynStat.Lib(2),DynStat.Sens(5)][2],[DynStat.Lib(2),DynStat.Sens(5)][3],[DynStat.Lib(2),DynStat.Sens(5)][4],[DynStat.Lib(2),DynStat.Sens(5)][5],[DynStat.Lib(2),DynStat.Sens(5)][6]);
         }
         else if(int([DynStat.Lib(2),DynStat.Sens(5)].length) == 8)
         {
            KGAMECLASS.kGAMECLASS.player.dynStats([DynStat.Lib(2),DynStat.Sens(5)][0],[DynStat.Lib(2),DynStat.Sens(5)][1],[DynStat.Lib(2),DynStat.Sens(5)][2],[DynStat.Lib(2),DynStat.Sens(5)][3],[DynStat.Lib(2),DynStat.Sens(5)][4],[DynStat.Lib(2),DynStat.Sens(5)][5],[DynStat.Lib(2),DynStat.Sens(5)][6],[DynStat.Lib(2),DynStat.Sens(5)][7]);
         }
         else if(int([DynStat.Lib(2),DynStat.Sens(5)].length) == 9)
         {
            KGAMECLASS.kGAMECLASS.player.dynStats([DynStat.Lib(2),DynStat.Sens(5)][0],[DynStat.Lib(2),DynStat.Sens(5)][1],[DynStat.Lib(2),DynStat.Sens(5)][2],[DynStat.Lib(2),DynStat.Sens(5)][3],[DynStat.Lib(2),DynStat.Sens(5)][4],[DynStat.Lib(2),DynStat.Sens(5)][5],[DynStat.Lib(2),DynStat.Sens(5)][6],[DynStat.Lib(2),DynStat.Sens(5)][7],[DynStat.Lib(2),DynStat.Sens(5)][8]);
         }
         else if(int([DynStat.Lib(2),DynStat.Sens(5)].length) == 10)
         {
            KGAMECLASS.kGAMECLASS.player.dynStats([DynStat.Lib(2),DynStat.Sens(5)][0],[DynStat.Lib(2),DynStat.Sens(5)][1],[DynStat.Lib(2),DynStat.Sens(5)][2],[DynStat.Lib(2),DynStat.Sens(5)][3],[DynStat.Lib(2),DynStat.Sens(5)][4],[DynStat.Lib(2),DynStat.Sens(5)][5],[DynStat.Lib(2),DynStat.Sens(5)][6],[DynStat.Lib(2),DynStat.Sens(5)][7],[DynStat.Lib(2),DynStat.Sens(5)][8],[DynStat.Lib(2),DynStat.Sens(5)][9]);
         }
         else if(int([DynStat.Lib(2),DynStat.Sens(5)].length) == 11)
         {
            KGAMECLASS.kGAMECLASS.player.dynStats([DynStat.Lib(2),DynStat.Sens(5)][0],[DynStat.Lib(2),DynStat.Sens(5)][1],[DynStat.Lib(2),DynStat.Sens(5)][2],[DynStat.Lib(2),DynStat.Sens(5)][3],[DynStat.Lib(2),DynStat.Sens(5)][4],[DynStat.Lib(2),DynStat.Sens(5)][5],[DynStat.Lib(2),DynStat.Sens(5)][6],[DynStat.Lib(2),DynStat.Sens(5)][7],[DynStat.Lib(2),DynStat.Sens(5)][8],[DynStat.Lib(2),DynStat.Sens(5)][9],[DynStat.Lib(2),DynStat.Sens(5)][10]);
         }
         else if(int([DynStat.Lib(2),DynStat.Sens(5)].length) == 12)
         {
            KGAMECLASS.kGAMECLASS.player.dynStats([DynStat.Lib(2),DynStat.Sens(5)][0],[DynStat.Lib(2),DynStat.Sens(5)][1],[DynStat.Lib(2),DynStat.Sens(5)][2],[DynStat.Lib(2),DynStat.Sens(5)][3],[DynStat.Lib(2),DynStat.Sens(5)][4],[DynStat.Lib(2),DynStat.Sens(5)][5],[DynStat.Lib(2),DynStat.Sens(5)][6],[DynStat.Lib(2),DynStat.Sens(5)][7],[DynStat.Lib(2),DynStat.Sens(5)][8],[DynStat.Lib(2),DynStat.Sens(5)][9],[DynStat.Lib(2),DynStat.Sens(5)][10],[DynStat.Lib(2),DynStat.Sens(5)][11]);
         }
         else if(int([DynStat.Lib(2),DynStat.Sens(5)].length) == 13)
         {
            KGAMECLASS.kGAMECLASS.player.dynStats([DynStat.Lib(2),DynStat.Sens(5)][0],[DynStat.Lib(2),DynStat.Sens(5)][1],[DynStat.Lib(2),DynStat.Sens(5)][2],[DynStat.Lib(2),DynStat.Sens(5)][3],[DynStat.Lib(2),DynStat.Sens(5)][4],[DynStat.Lib(2),DynStat.Sens(5)][5],[DynStat.Lib(2),DynStat.Sens(5)][6],[DynStat.Lib(2),DynStat.Sens(5)][7],[DynStat.Lib(2),DynStat.Sens(5)][8],[DynStat.Lib(2),DynStat.Sens(5)][9],[DynStat.Lib(2),DynStat.Sens(5)][10],[DynStat.Lib(2),DynStat.Sens(5)][11],[DynStat.Lib(2),DynStat.Sens(5)][12]);
         }
         else if(int([DynStat.Lib(2),DynStat.Sens(5)].length) == 14)
         {
            KGAMECLASS.kGAMECLASS.player.dynStats([DynStat.Lib(2),DynStat.Sens(5)][0],[DynStat.Lib(2),DynStat.Sens(5)][1],[DynStat.Lib(2),DynStat.Sens(5)][2],[DynStat.Lib(2),DynStat.Sens(5)][3],[DynStat.Lib(2),DynStat.Sens(5)][4],[DynStat.Lib(2),DynStat.Sens(5)][5],[DynStat.Lib(2),DynStat.Sens(5)][6],[DynStat.Lib(2),DynStat.Sens(5)][7],[DynStat.Lib(2),DynStat.Sens(5)][8],[DynStat.Lib(2),DynStat.Sens(5)][9],[DynStat.Lib(2),DynStat.Sens(5)][10],[DynStat.Lib(2),DynStat.Sens(5)][11],[DynStat.Lib(2),DynStat.Sens(5)][12],[DynStat.Lib(2),DynStat.Sens(5)][13]);
         }
         else if(int([DynStat.Lib(2),DynStat.Sens(5)].length) == 15)
         {
            KGAMECLASS.kGAMECLASS.player.dynStats([DynStat.Lib(2),DynStat.Sens(5)][0],[DynStat.Lib(2),DynStat.Sens(5)][1],[DynStat.Lib(2),DynStat.Sens(5)][2],[DynStat.Lib(2),DynStat.Sens(5)][3],[DynStat.Lib(2),DynStat.Sens(5)][4],[DynStat.Lib(2),DynStat.Sens(5)][5],[DynStat.Lib(2),DynStat.Sens(5)][6],[DynStat.Lib(2),DynStat.Sens(5)][7],[DynStat.Lib(2),DynStat.Sens(5)][8],[DynStat.Lib(2),DynStat.Sens(5)][9],[DynStat.Lib(2),DynStat.Sens(5)][10],[DynStat.Lib(2),DynStat.Sens(5)][11],[DynStat.Lib(2),DynStat.Sens(5)][12],[DynStat.Lib(2),DynStat.Sens(5)][13],[DynStat.Lib(2),DynStat.Sens(5)][14]);
         }
         else if(int([DynStat.Lib(2),DynStat.Sens(5)].length) == 16)
         {
            KGAMECLASS.kGAMECLASS.player.dynStats([DynStat.Lib(2),DynStat.Sens(5)][0],[DynStat.Lib(2),DynStat.Sens(5)][1],[DynStat.Lib(2),DynStat.Sens(5)][2],[DynStat.Lib(2),DynStat.Sens(5)][3],[DynStat.Lib(2),DynStat.Sens(5)][4],[DynStat.Lib(2),DynStat.Sens(5)][5],[DynStat.Lib(2),DynStat.Sens(5)][6],[DynStat.Lib(2),DynStat.Sens(5)][7],[DynStat.Lib(2),DynStat.Sens(5)][8],[DynStat.Lib(2),DynStat.Sens(5)][9],[DynStat.Lib(2),DynStat.Sens(5)][10],[DynStat.Lib(2),DynStat.Sens(5)][11],[DynStat.Lib(2),DynStat.Sens(5)][12],[DynStat.Lib(2),DynStat.Sens(5)][13],[DynStat.Lib(2),DynStat.Sens(5)][14],[DynStat.Lib(2),DynStat.Sens(5)][15]);
         }
         else if(int([DynStat.Lib(2),DynStat.Sens(5)].length) == 17)
         {
            KGAMECLASS.kGAMECLASS.player.dynStats([DynStat.Lib(2),DynStat.Sens(5)][0],[DynStat.Lib(2),DynStat.Sens(5)][1],[DynStat.Lib(2),DynStat.Sens(5)][2],[DynStat.Lib(2),DynStat.Sens(5)][3],[DynStat.Lib(2),DynStat.Sens(5)][4],[DynStat.Lib(2),DynStat.Sens(5)][5],[DynStat.Lib(2),DynStat.Sens(5)][6],[DynStat.Lib(2),DynStat.Sens(5)][7],[DynStat.Lib(2),DynStat.Sens(5)][8],[DynStat.Lib(2),DynStat.Sens(5)][9],[DynStat.Lib(2),DynStat.Sens(5)][10],[DynStat.Lib(2),DynStat.Sens(5)][11],[DynStat.Lib(2),DynStat.Sens(5)][12],[DynStat.Lib(2),DynStat.Sens(5)][13],[DynStat.Lib(2),DynStat.Sens(5)][14],[DynStat.Lib(2),DynStat.Sens(5)][15],[DynStat.Lib(2),DynStat.Sens(5)][16]);
         }
         else if(int([DynStat.Lib(2),DynStat.Sens(5)].length) == 18)
         {
            KGAMECLASS.kGAMECLASS.player.dynStats([DynStat.Lib(2),DynStat.Sens(5)][0],[DynStat.Lib(2),DynStat.Sens(5)][1],[DynStat.Lib(2),DynStat.Sens(5)][2],[DynStat.Lib(2),DynStat.Sens(5)][3],[DynStat.Lib(2),DynStat.Sens(5)][4],[DynStat.Lib(2),DynStat.Sens(5)][5],[DynStat.Lib(2),DynStat.Sens(5)][6],[DynStat.Lib(2),DynStat.Sens(5)][7],[DynStat.Lib(2),DynStat.Sens(5)][8],[DynStat.Lib(2),DynStat.Sens(5)][9],[DynStat.Lib(2),DynStat.Sens(5)][10],[DynStat.Lib(2),DynStat.Sens(5)][11],[DynStat.Lib(2),DynStat.Sens(5)][12],[DynStat.Lib(2),DynStat.Sens(5)][13],[DynStat.Lib(2),DynStat.Sens(5)][14],[DynStat.Lib(2),DynStat.Sens(5)][15],[DynStat.Lib(2),DynStat.Sens(5)][16],[DynStat.Lib(2),DynStat.Sens(5)][17]);
         }
         else if(int([DynStat.Lib(2),DynStat.Sens(5)].length) == 19)
         {
            KGAMECLASS.kGAMECLASS.player.dynStats([DynStat.Lib(2),DynStat.Sens(5)][0],[DynStat.Lib(2),DynStat.Sens(5)][1],[DynStat.Lib(2),DynStat.Sens(5)][2],[DynStat.Lib(2),DynStat.Sens(5)][3],[DynStat.Lib(2),DynStat.Sens(5)][4],[DynStat.Lib(2),DynStat.Sens(5)][5],[DynStat.Lib(2),DynStat.Sens(5)][6],[DynStat.Lib(2),DynStat.Sens(5)][7],[DynStat.Lib(2),DynStat.Sens(5)][8],[DynStat.Lib(2),DynStat.Sens(5)][9],[DynStat.Lib(2),DynStat.Sens(5)][10],[DynStat.Lib(2),DynStat.Sens(5)][11],[DynStat.Lib(2),DynStat.Sens(5)][12],[DynStat.Lib(2),DynStat.Sens(5)][13],[DynStat.Lib(2),DynStat.Sens(5)][14],[DynStat.Lib(2),DynStat.Sens(5)][15],[DynStat.Lib(2),DynStat.Sens(5)][16],[DynStat.Lib(2),DynStat.Sens(5)][17],[DynStat.Lib(2),DynStat.Sens(5)][18]);
         }
         else
         {
            if(int([DynStat.Lib(2),DynStat.Sens(5)].length) != 20)
            {
               throw "Too many rest arguments";
            }
            KGAMECLASS.kGAMECLASS.player.dynStats([DynStat.Lib(2),DynStat.Sens(5)][0],[DynStat.Lib(2),DynStat.Sens(5)][1],[DynStat.Lib(2),DynStat.Sens(5)][2],[DynStat.Lib(2),DynStat.Sens(5)][3],[DynStat.Lib(2),DynStat.Sens(5)][4],[DynStat.Lib(2),DynStat.Sens(5)][5],[DynStat.Lib(2),DynStat.Sens(5)][6],[DynStat.Lib(2),DynStat.Sens(5)][7],[DynStat.Lib(2),DynStat.Sens(5)][8],[DynStat.Lib(2),DynStat.Sens(5)][9],[DynStat.Lib(2),DynStat.Sens(5)][10],[DynStat.Lib(2),DynStat.Sens(5)][11],[DynStat.Lib(2),DynStat.Sens(5)][12],[DynStat.Lib(2),DynStat.Sens(5)][13],[DynStat.Lib(2),DynStat.Sens(5)][14],[DynStat.Lib(2),DynStat.Sens(5)][15],[DynStat.Lib(2),DynStat.Sens(5)][16],[DynStat.Lib(2),DynStat.Sens(5)][17],[DynStat.Lib(2),DynStat.Sens(5)][18],[DynStat.Lib(2),DynStat.Sens(5)][19]);
         }
         KGAMECLASS.kGAMECLASS.player.knockUpForce();
         KGAMECLASS.kGAMECLASS.output.doNext(KGAMECLASS.kGAMECLASS.playerMenu);
      }
   }
}

