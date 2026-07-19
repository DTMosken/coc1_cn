package classes.scenes.quests.urtaQuest
{
   import classes.Appearance;
   import classes.CoC;
   import classes.DynStat;
   import classes.Player;
   import classes.StatusEffects;
   import classes.internals.MonsterAI;
   import classes.internals.Utils;
   import classes.scenes.combat.CombatRange;
   import classes.scenes.monsters.AbstractSuccubus;
   import flash.Boot;
   
   public class MilkySuccubus extends AbstractSuccubus
   {
      
      public var cumAvailable:int;
      
      public function MilkySuccubus()
      {
         if(Boot.skip_constructor)
         {
            return;
         }
         cumAvailable = 2;
         super();
         set_a("");
         set_short("milky succubus");
         imageName = "milkysuccubus";
         set_long("你正在与一只产奶的牛娘魅魔战斗。她身高约七英尺，极其丰满，乳房有她头部的三倍大，顶端长着一簇四个淫猥的像奶牛一样的乳头。她的臀部向外扩张成夸张的沙漏状，一条长长的尾巴在诱人的屁股上方摇摆，尾端长着一个肉质的箭头状铲子。在箭头的根部，用一条可爱的小丝带系着一个小牛铃。宽大的牛角从她头上长出，放在牛头人身上也毫不违和，她一边在恶魔般的高跟脚上左右摇曳，一边抖动着脑袋两侧的牛耳。她的皮肤是鲜艳的紫色，到处都有闪亮的黑色斑块，其中一大块覆盖了她的右眼。她使用一条皮鞭作为武器。");
         set_race("Demon");
         createVagina(false,5,1);
         createStatusEffect(StatusEffects.BonusVCapacity,300,0,0,0);
         createBreastRow(Appearance.breastCupInverse("G"));
         ass.analLooseness = 4;
         ass.analWetness = 5;
         set_tallness(84);
         hips.rating = 10;
         butt.rating = 9;
         lowerBody.type = 5;
         skin.tone = "blue";
         hair.color = "black";
         hair.length = 13;
         initStrTouSpeInte(75,50,125,95);
         initLibSensCor(90,60,99);
         set_weaponName("whip");
         set_weaponVerb("whipping");
         set_weaponAttack(10);
         normalAttackAvoid.doParry = false;
         normalAttackAvoid.doCounter = false;
         set_weaponPerk([]);
         set_weaponValue(150);
         set_armorName("demonic skin");
         set_armorDef(10);
         bonusHP = 700;
         set_lust(40);
         lustVuln = 0.3;
         temperment = 3;
         level = 16;
         set_gems(Utils.rand(25) + 10);
         additionalXP = 50;
         set_drop(NO_DROP);
         horns.type = 3;
         horns.value = 2;
         wings.type = 6;
         tail.type = 3;
         special1 = kissAttack;
         special2 = seduceAttack;
         special3 = whipAttack;
         set_drop(NO_DROP);
         checkMonster();
      }
      
      override public function won(param1:Boolean, param2:Boolean = false) : void
      {
         get_game().urtaQuest.urtaLosesToCowCubi();
      }
      
      override public function teased(param1:Number) : void
      {
         outputText(get_capitalA() + Utils.cnName(get_short()) + "微笑着，一边看着你的表演一边在自己身上抚摸。她似乎并没有被你的表演影响太多——至少在增加性欲方面是这样。但她看起来出奇地更加……充满活力，就好像她从你的表演中汲取了力量一样。");
         set_str(get_str() + 5);
         addHP(50);
         applyTease(param1);
      }
      
      public function succubusTease() : void
      {
         if(Utils.rand(4) == 0)
         {
            outputText("魅魔转过身，开始朝你的方向晃动她那相当圆润的臀部，随着每一次方向的改变，臀瓣淫荡地拍打在一起，露出她黑色的肛门和多汁的阴户，简直喷涌出一股润滑液。她的眼睛闪烁着微弱的紫光，低声说道：[say: 难道你不想……滑进来吗？]");
         }
         else if(Utils.rand(3) == 0)
         {
            outputText("魅魔挤压着她那布满斑点、被汗水浸透的乳房，挤出了一缕缕新鲜、浓郁的魅魔乳汁。她弯下腰，舔舐着自己的恩赐，抬起头迎上你的目光，她自己的眼睛闪烁着紫光。你不仅能听到她接下来的话，还能感觉到它们，它们深入你的大脑，在你的下半身激起了一股熟悉的燥热。[say: 屈服就意味着无尽的快乐，我亲爱的小狐狸。]");
         }
         else if(Utils.rand(2) == 0)
         {
            outputText("魅魔微微转身，慢慢弯下腰，双手顺着她那饱满的乳房两侧滑下。[say: 嗯，你能帮一个可怜的女孩放松一下吗？这些东西需要一些关注，] 她带着充满欲望的呻吟说道，同时她的手摸到了她那众多的乳头。");
         }
         else
         {
            outputText("魅魔向前倾身，托住她的乳房，同时用手指包裹住她的乳头。[say: 我的胸部好胀。你想帮我排空它们吗？] 她用沙哑的声音说道。");
         }
         if(int([DynStat.Lust(20)].length) == 0)
         {
            get_game().player.dynStats();
         }
         else if(int([DynStat.Lust(20)].length) == 1)
         {
            get_game().player.dynStats([DynStat.Lust(20)][0]);
         }
         else if(int([DynStat.Lust(20)].length) == 2)
         {
            get_game().player.dynStats([DynStat.Lust(20)][0],[DynStat.Lust(20)][1]);
         }
         else if(int([DynStat.Lust(20)].length) == 3)
         {
            get_game().player.dynStats([DynStat.Lust(20)][0],[DynStat.Lust(20)][1],[DynStat.Lust(20)][2]);
         }
         else if(int([DynStat.Lust(20)].length) == 4)
         {
            get_game().player.dynStats([DynStat.Lust(20)][0],[DynStat.Lust(20)][1],[DynStat.Lust(20)][2],[DynStat.Lust(20)][3]);
         }
         else if(int([DynStat.Lust(20)].length) == 5)
         {
            get_game().player.dynStats([DynStat.Lust(20)][0],[DynStat.Lust(20)][1],[DynStat.Lust(20)][2],[DynStat.Lust(20)][3],[DynStat.Lust(20)][4]);
         }
         else if(int([DynStat.Lust(20)].length) == 6)
         {
            get_game().player.dynStats([DynStat.Lust(20)][0],[DynStat.Lust(20)][1],[DynStat.Lust(20)][2],[DynStat.Lust(20)][3],[DynStat.Lust(20)][4],[DynStat.Lust(20)][5]);
         }
         else if(int([DynStat.Lust(20)].length) == 7)
         {
            get_game().player.dynStats([DynStat.Lust(20)][0],[DynStat.Lust(20)][1],[DynStat.Lust(20)][2],[DynStat.Lust(20)][3],[DynStat.Lust(20)][4],[DynStat.Lust(20)][5],[DynStat.Lust(20)][6]);
         }
         else if(int([DynStat.Lust(20)].length) == 8)
         {
            get_game().player.dynStats([DynStat.Lust(20)][0],[DynStat.Lust(20)][1],[DynStat.Lust(20)][2],[DynStat.Lust(20)][3],[DynStat.Lust(20)][4],[DynStat.Lust(20)][5],[DynStat.Lust(20)][6],[DynStat.Lust(20)][7]);
         }
         else if(int([DynStat.Lust(20)].length) == 9)
         {
            get_game().player.dynStats([DynStat.Lust(20)][0],[DynStat.Lust(20)][1],[DynStat.Lust(20)][2],[DynStat.Lust(20)][3],[DynStat.Lust(20)][4],[DynStat.Lust(20)][5],[DynStat.Lust(20)][6],[DynStat.Lust(20)][7],[DynStat.Lust(20)][8]);
         }
         else if(int([DynStat.Lust(20)].length) == 10)
         {
            get_game().player.dynStats([DynStat.Lust(20)][0],[DynStat.Lust(20)][1],[DynStat.Lust(20)][2],[DynStat.Lust(20)][3],[DynStat.Lust(20)][4],[DynStat.Lust(20)][5],[DynStat.Lust(20)][6],[DynStat.Lust(20)][7],[DynStat.Lust(20)][8],[DynStat.Lust(20)][9]);
         }
         else if(int([DynStat.Lust(20)].length) == 11)
         {
            get_game().player.dynStats([DynStat.Lust(20)][0],[DynStat.Lust(20)][1],[DynStat.Lust(20)][2],[DynStat.Lust(20)][3],[DynStat.Lust(20)][4],[DynStat.Lust(20)][5],[DynStat.Lust(20)][6],[DynStat.Lust(20)][7],[DynStat.Lust(20)][8],[DynStat.Lust(20)][9],[DynStat.Lust(20)][10]);
         }
         else if(int([DynStat.Lust(20)].length) == 12)
         {
            get_game().player.dynStats([DynStat.Lust(20)][0],[DynStat.Lust(20)][1],[DynStat.Lust(20)][2],[DynStat.Lust(20)][3],[DynStat.Lust(20)][4],[DynStat.Lust(20)][5],[DynStat.Lust(20)][6],[DynStat.Lust(20)][7],[DynStat.Lust(20)][8],[DynStat.Lust(20)][9],[DynStat.Lust(20)][10],[DynStat.Lust(20)][11]);
         }
         else if(int([DynStat.Lust(20)].length) == 13)
         {
            get_game().player.dynStats([DynStat.Lust(20)][0],[DynStat.Lust(20)][1],[DynStat.Lust(20)][2],[DynStat.Lust(20)][3],[DynStat.Lust(20)][4],[DynStat.Lust(20)][5],[DynStat.Lust(20)][6],[DynStat.Lust(20)][7],[DynStat.Lust(20)][8],[DynStat.Lust(20)][9],[DynStat.Lust(20)][10],[DynStat.Lust(20)][11],[DynStat.Lust(20)][12]);
         }
         else if(int([DynStat.Lust(20)].length) == 14)
         {
            get_game().player.dynStats([DynStat.Lust(20)][0],[DynStat.Lust(20)][1],[DynStat.Lust(20)][2],[DynStat.Lust(20)][3],[DynStat.Lust(20)][4],[DynStat.Lust(20)][5],[DynStat.Lust(20)][6],[DynStat.Lust(20)][7],[DynStat.Lust(20)][8],[DynStat.Lust(20)][9],[DynStat.Lust(20)][10],[DynStat.Lust(20)][11],[DynStat.Lust(20)][12],[DynStat.Lust(20)][13]);
         }
         else if(int([DynStat.Lust(20)].length) == 15)
         {
            get_game().player.dynStats([DynStat.Lust(20)][0],[DynStat.Lust(20)][1],[DynStat.Lust(20)][2],[DynStat.Lust(20)][3],[DynStat.Lust(20)][4],[DynStat.Lust(20)][5],[DynStat.Lust(20)][6],[DynStat.Lust(20)][7],[DynStat.Lust(20)][8],[DynStat.Lust(20)][9],[DynStat.Lust(20)][10],[DynStat.Lust(20)][11],[DynStat.Lust(20)][12],[DynStat.Lust(20)][13],[DynStat.Lust(20)][14]);
         }
         else if(int([DynStat.Lust(20)].length) == 16)
         {
            get_game().player.dynStats([DynStat.Lust(20)][0],[DynStat.Lust(20)][1],[DynStat.Lust(20)][2],[DynStat.Lust(20)][3],[DynStat.Lust(20)][4],[DynStat.Lust(20)][5],[DynStat.Lust(20)][6],[DynStat.Lust(20)][7],[DynStat.Lust(20)][8],[DynStat.Lust(20)][9],[DynStat.Lust(20)][10],[DynStat.Lust(20)][11],[DynStat.Lust(20)][12],[DynStat.Lust(20)][13],[DynStat.Lust(20)][14],[DynStat.Lust(20)][15]);
         }
         else if(int([DynStat.Lust(20)].length) == 17)
         {
            get_game().player.dynStats([DynStat.Lust(20)][0],[DynStat.Lust(20)][1],[DynStat.Lust(20)][2],[DynStat.Lust(20)][3],[DynStat.Lust(20)][4],[DynStat.Lust(20)][5],[DynStat.Lust(20)][6],[DynStat.Lust(20)][7],[DynStat.Lust(20)][8],[DynStat.Lust(20)][9],[DynStat.Lust(20)][10],[DynStat.Lust(20)][11],[DynStat.Lust(20)][12],[DynStat.Lust(20)][13],[DynStat.Lust(20)][14],[DynStat.Lust(20)][15],[DynStat.Lust(20)][16]);
         }
         else if(int([DynStat.Lust(20)].length) == 18)
         {
            get_game().player.dynStats([DynStat.Lust(20)][0],[DynStat.Lust(20)][1],[DynStat.Lust(20)][2],[DynStat.Lust(20)][3],[DynStat.Lust(20)][4],[DynStat.Lust(20)][5],[DynStat.Lust(20)][6],[DynStat.Lust(20)][7],[DynStat.Lust(20)][8],[DynStat.Lust(20)][9],[DynStat.Lust(20)][10],[DynStat.Lust(20)][11],[DynStat.Lust(20)][12],[DynStat.Lust(20)][13],[DynStat.Lust(20)][14],[DynStat.Lust(20)][15],[DynStat.Lust(20)][16],[DynStat.Lust(20)][17]);
         }
         else if(int([DynStat.Lust(20)].length) == 19)
         {
            get_game().player.dynStats([DynStat.Lust(20)][0],[DynStat.Lust(20)][1],[DynStat.Lust(20)][2],[DynStat.Lust(20)][3],[DynStat.Lust(20)][4],[DynStat.Lust(20)][5],[DynStat.Lust(20)][6],[DynStat.Lust(20)][7],[DynStat.Lust(20)][8],[DynStat.Lust(20)][9],[DynStat.Lust(20)][10],[DynStat.Lust(20)][11],[DynStat.Lust(20)][12],[DynStat.Lust(20)][13],[DynStat.Lust(20)][14],[DynStat.Lust(20)][15],[DynStat.Lust(20)][16],[DynStat.Lust(20)][17],[DynStat.Lust(20)][18]);
         }
         else
         {
            if(int([DynStat.Lust(20)].length) != 20)
            {
               throw "Too many rest arguments";
            }
            get_game().player.dynStats([DynStat.Lust(20)][0],[DynStat.Lust(20)][1],[DynStat.Lust(20)][2],[DynStat.Lust(20)][3],[DynStat.Lust(20)][4],[DynStat.Lust(20)][5],[DynStat.Lust(20)][6],[DynStat.Lust(20)][7],[DynStat.Lust(20)][8],[DynStat.Lust(20)][9],[DynStat.Lust(20)][10],[DynStat.Lust(20)][11],[DynStat.Lust(20)][12],[DynStat.Lust(20)][13],[DynStat.Lust(20)][14],[DynStat.Lust(20)][15],[DynStat.Lust(20)][16],[DynStat.Lust(20)][17],[DynStat.Lust(20)][18],[DynStat.Lust(20)][19]);
         }
      }
      
      override public function performCombatAction() : void
      {
         var _loc1_:MonsterAI = new MonsterAI();
         _loc1_.add(cowCubiMilkSprayAttack,0.3,!hasStatusEffect(StatusEffects.MilkyUrta),10,FATIGUE_MAGICAL,CombatRange.Ranged);
         _loc1_.add(drinkMinoCum,2,get_HP() < 400,0,FATIGUE_NONE,CombatRange.Self);
         _loc1_.add(eAttack,1,get_player().get_HP() < 100,0,FATIGUE_NONE,CombatRange.Melee);
         _loc1_.add(succubusTease,1,get_player().get_lust100() >= 90,0,FATIGUE_NONE,CombatRange.Tease);
         _loc1_.add(eAttack,1,true,0,FATIGUE_NONE,CombatRange.Melee);
         _loc1_.exec();
      }
      
      public function drinkMinoCum() : void
      {
         outputText("魅魔牛苦笑了一下，舔了舔嘴唇，用她那探寻的尾巴掏出了一瓶她宠物的精液。");
         if(cumAvailable <= 0)
         {
            outputText("[pg]她皱了皱眉，回头看了看，转过头来看你时微微撅起嘴。[say: 看来我的精液用光了。] 她邪恶地咧嘴一笑。[say: 等我解决完你，我再去弄点。]");
         }
         else
         {
            outputText("[pg]她得意地笑着，拿起瓶子“砰”的一声打开，高兴地喝下了里面的东西。喝完后，她扔掉瓶子，咂了咂嘴。[say: 没有什么比一瓶牛头人精液更能让你恢复活力的了，对吧？] 她咧嘴一笑，她的小穴滴下了更多的汁液。");
            addHP(400);
            set_lust(get_lust() + 25);
            cumAvailable -= 1;
         }
      }
      
      override public function defeated(param1:Boolean) : void
      {
         get_game().urtaQuest.urtaBeatsUpCowcubi();
      }
      
      public function cowCubiMilkSprayAttack() : void
      {
         outputText("[say: 尝尝怎么样？] 魅魔一边问，一边挤压着她的乳房。还没等你回答，一股名副其实的乳汁喷泉就朝你喷了过来！\n");
         if(Utils.rand(20) + 1 + get_player().get_spe() / 20 > 17)
         {
            outputText("凭借你训练有素的反应，你设法躲闪并翻滚，险险避开了被乳汁喷到。");
            outputText("[pg][say: 真是浪费。] 魅魔撅起嘴。[say: 没关系，我晚点让菲多清理干净就行了……也许我甚至会让你晚点来做，等你变成我的东西之后。] 魅魔咯咯地笑了起来。");
            if(int([DynStat.Lust(6)].length) == 0)
            {
               get_game().player.dynStats();
            }
            else if(int([DynStat.Lust(6)].length) == 1)
            {
               get_game().player.dynStats([DynStat.Lust(6)][0]);
            }
            else if(int([DynStat.Lust(6)].length) == 2)
            {
               get_game().player.dynStats([DynStat.Lust(6)][0],[DynStat.Lust(6)][1]);
            }
            else if(int([DynStat.Lust(6)].length) == 3)
            {
               get_game().player.dynStats([DynStat.Lust(6)][0],[DynStat.Lust(6)][1],[DynStat.Lust(6)][2]);
            }
            else if(int([DynStat.Lust(6)].length) == 4)
            {
               get_game().player.dynStats([DynStat.Lust(6)][0],[DynStat.Lust(6)][1],[DynStat.Lust(6)][2],[DynStat.Lust(6)][3]);
            }
            else if(int([DynStat.Lust(6)].length) == 5)
            {
               get_game().player.dynStats([DynStat.Lust(6)][0],[DynStat.Lust(6)][1],[DynStat.Lust(6)][2],[DynStat.Lust(6)][3],[DynStat.Lust(6)][4]);
            }
            else if(int([DynStat.Lust(6)].length) == 6)
            {
               get_game().player.dynStats([DynStat.Lust(6)][0],[DynStat.Lust(6)][1],[DynStat.Lust(6)][2],[DynStat.Lust(6)][3],[DynStat.Lust(6)][4],[DynStat.Lust(6)][5]);
            }
            else if(int([DynStat.Lust(6)].length) == 7)
            {
               get_game().player.dynStats([DynStat.Lust(6)][0],[DynStat.Lust(6)][1],[DynStat.Lust(6)][2],[DynStat.Lust(6)][3],[DynStat.Lust(6)][4],[DynStat.Lust(6)][5],[DynStat.Lust(6)][6]);
            }
            else if(int([DynStat.Lust(6)].length) == 8)
            {
               get_game().player.dynStats([DynStat.Lust(6)][0],[DynStat.Lust(6)][1],[DynStat.Lust(6)][2],[DynStat.Lust(6)][3],[DynStat.Lust(6)][4],[DynStat.Lust(6)][5],[DynStat.Lust(6)][6],[DynStat.Lust(6)][7]);
            }
            else if(int([DynStat.Lust(6)].length) == 9)
            {
               get_game().player.dynStats([DynStat.Lust(6)][0],[DynStat.Lust(6)][1],[DynStat.Lust(6)][2],[DynStat.Lust(6)][3],[DynStat.Lust(6)][4],[DynStat.Lust(6)][5],[DynStat.Lust(6)][6],[DynStat.Lust(6)][7],[DynStat.Lust(6)][8]);
            }
            else if(int([DynStat.Lust(6)].length) == 10)
            {
               get_game().player.dynStats([DynStat.Lust(6)][0],[DynStat.Lust(6)][1],[DynStat.Lust(6)][2],[DynStat.Lust(6)][3],[DynStat.Lust(6)][4],[DynStat.Lust(6)][5],[DynStat.Lust(6)][6],[DynStat.Lust(6)][7],[DynStat.Lust(6)][8],[DynStat.Lust(6)][9]);
            }
            else if(int([DynStat.Lust(6)].length) == 11)
            {
               get_game().player.dynStats([DynStat.Lust(6)][0],[DynStat.Lust(6)][1],[DynStat.Lust(6)][2],[DynStat.Lust(6)][3],[DynStat.Lust(6)][4],[DynStat.Lust(6)][5],[DynStat.Lust(6)][6],[DynStat.Lust(6)][7],[DynStat.Lust(6)][8],[DynStat.Lust(6)][9],[DynStat.Lust(6)][10]);
            }
            else if(int([DynStat.Lust(6)].length) == 12)
            {
               get_game().player.dynStats([DynStat.Lust(6)][0],[DynStat.Lust(6)][1],[DynStat.Lust(6)][2],[DynStat.Lust(6)][3],[DynStat.Lust(6)][4],[DynStat.Lust(6)][5],[DynStat.Lust(6)][6],[DynStat.Lust(6)][7],[DynStat.Lust(6)][8],[DynStat.Lust(6)][9],[DynStat.Lust(6)][10],[DynStat.Lust(6)][11]);
            }
            else if(int([DynStat.Lust(6)].length) == 13)
            {
               get_game().player.dynStats([DynStat.Lust(6)][0],[DynStat.Lust(6)][1],[DynStat.Lust(6)][2],[DynStat.Lust(6)][3],[DynStat.Lust(6)][4],[DynStat.Lust(6)][5],[DynStat.Lust(6)][6],[DynStat.Lust(6)][7],[DynStat.Lust(6)][8],[DynStat.Lust(6)][9],[DynStat.Lust(6)][10],[DynStat.Lust(6)][11],[DynStat.Lust(6)][12]);
            }
            else if(int([DynStat.Lust(6)].length) == 14)
            {
               get_game().player.dynStats([DynStat.Lust(6)][0],[DynStat.Lust(6)][1],[DynStat.Lust(6)][2],[DynStat.Lust(6)][3],[DynStat.Lust(6)][4],[DynStat.Lust(6)][5],[DynStat.Lust(6)][6],[DynStat.Lust(6)][7],[DynStat.Lust(6)][8],[DynStat.Lust(6)][9],[DynStat.Lust(6)][10],[DynStat.Lust(6)][11],[DynStat.Lust(6)][12],[DynStat.Lust(6)][13]);
            }
            else if(int([DynStat.Lust(6)].length) == 15)
            {
               get_game().player.dynStats([DynStat.Lust(6)][0],[DynStat.Lust(6)][1],[DynStat.Lust(6)][2],[DynStat.Lust(6)][3],[DynStat.Lust(6)][4],[DynStat.Lust(6)][5],[DynStat.Lust(6)][6],[DynStat.Lust(6)][7],[DynStat.Lust(6)][8],[DynStat.Lust(6)][9],[DynStat.Lust(6)][10],[DynStat.Lust(6)][11],[DynStat.Lust(6)][12],[DynStat.Lust(6)][13],[DynStat.Lust(6)][14]);
            }
            else if(int([DynStat.Lust(6)].length) == 16)
            {
               get_game().player.dynStats([DynStat.Lust(6)][0],[DynStat.Lust(6)][1],[DynStat.Lust(6)][2],[DynStat.Lust(6)][3],[DynStat.Lust(6)][4],[DynStat.Lust(6)][5],[DynStat.Lust(6)][6],[DynStat.Lust(6)][7],[DynStat.Lust(6)][8],[DynStat.Lust(6)][9],[DynStat.Lust(6)][10],[DynStat.Lust(6)][11],[DynStat.Lust(6)][12],[DynStat.Lust(6)][13],[DynStat.Lust(6)][14],[DynStat.Lust(6)][15]);
            }
            else if(int([DynStat.Lust(6)].length) == 17)
            {
               get_game().player.dynStats([DynStat.Lust(6)][0],[DynStat.Lust(6)][1],[DynStat.Lust(6)][2],[DynStat.Lust(6)][3],[DynStat.Lust(6)][4],[DynStat.Lust(6)][5],[DynStat.Lust(6)][6],[DynStat.Lust(6)][7],[DynStat.Lust(6)][8],[DynStat.Lust(6)][9],[DynStat.Lust(6)][10],[DynStat.Lust(6)][11],[DynStat.Lust(6)][12],[DynStat.Lust(6)][13],[DynStat.Lust(6)][14],[DynStat.Lust(6)][15],[DynStat.Lust(6)][16]);
            }
            else if(int([DynStat.Lust(6)].length) == 18)
            {
               get_game().player.dynStats([DynStat.Lust(6)][0],[DynStat.Lust(6)][1],[DynStat.Lust(6)][2],[DynStat.Lust(6)][3],[DynStat.Lust(6)][4],[DynStat.Lust(6)][5],[DynStat.Lust(6)][6],[DynStat.Lust(6)][7],[DynStat.Lust(6)][8],[DynStat.Lust(6)][9],[DynStat.Lust(6)][10],[DynStat.Lust(6)][11],[DynStat.Lust(6)][12],[DynStat.Lust(6)][13],[DynStat.Lust(6)][14],[DynStat.Lust(6)][15],[DynStat.Lust(6)][16],[DynStat.Lust(6)][17]);
            }
            else if(int([DynStat.Lust(6)].length) == 19)
            {
               get_game().player.dynStats([DynStat.Lust(6)][0],[DynStat.Lust(6)][1],[DynStat.Lust(6)][2],[DynStat.Lust(6)][3],[DynStat.Lust(6)][4],[DynStat.Lust(6)][5],[DynStat.Lust(6)][6],[DynStat.Lust(6)][7],[DynStat.Lust(6)][8],[DynStat.Lust(6)][9],[DynStat.Lust(6)][10],[DynStat.Lust(6)][11],[DynStat.Lust(6)][12],[DynStat.Lust(6)][13],[DynStat.Lust(6)][14],[DynStat.Lust(6)][15],[DynStat.Lust(6)][16],[DynStat.Lust(6)][17],[DynStat.Lust(6)][18]);
            }
            else
            {
               if(int([DynStat.Lust(6)].length) != 20)
               {
                  throw "Too many rest arguments";
               }
               get_game().player.dynStats([DynStat.Lust(6)][0],[DynStat.Lust(6)][1],[DynStat.Lust(6)][2],[DynStat.Lust(6)][3],[DynStat.Lust(6)][4],[DynStat.Lust(6)][5],[DynStat.Lust(6)][6],[DynStat.Lust(6)][7],[DynStat.Lust(6)][8],[DynStat.Lust(6)][9],[DynStat.Lust(6)][10],[DynStat.Lust(6)][11],[DynStat.Lust(6)][12],[DynStat.Lust(6)][13],[DynStat.Lust(6)][14],[DynStat.Lust(6)][15],[DynStat.Lust(6)][16],[DynStat.Lust(6)][17],[DynStat.Lust(6)][18],[DynStat.Lust(6)][19]);
            }
         }
         else
         {
            outputText("你只来得及捂住脸；然而，你身体的其他部分却被恶魔堕落的乳汁完全浸透了。低头看看自己，你发现自己正在喘息，乳汁溅到你" + (get_game().get_noFur() ? "皮肤" : "皮毛") + "上的地方开始发热。哦，不！<b>你最好在屈服于欲望之前解决掉这个魅魔！</b>");
            if(int([DynStat.Lust(15)].length) == 0)
            {
               get_game().player.dynStats();
            }
            else if(int([DynStat.Lust(15)].length) == 1)
            {
               get_game().player.dynStats([DynStat.Lust(15)][0]);
            }
            else if(int([DynStat.Lust(15)].length) == 2)
            {
               get_game().player.dynStats([DynStat.Lust(15)][0],[DynStat.Lust(15)][1]);
            }
            else if(int([DynStat.Lust(15)].length) == 3)
            {
               get_game().player.dynStats([DynStat.Lust(15)][0],[DynStat.Lust(15)][1],[DynStat.Lust(15)][2]);
            }
            else if(int([DynStat.Lust(15)].length) == 4)
            {
               get_game().player.dynStats([DynStat.Lust(15)][0],[DynStat.Lust(15)][1],[DynStat.Lust(15)][2],[DynStat.Lust(15)][3]);
            }
            else if(int([DynStat.Lust(15)].length) == 5)
            {
               get_game().player.dynStats([DynStat.Lust(15)][0],[DynStat.Lust(15)][1],[DynStat.Lust(15)][2],[DynStat.Lust(15)][3],[DynStat.Lust(15)][4]);
            }
            else if(int([DynStat.Lust(15)].length) == 6)
            {
               get_game().player.dynStats([DynStat.Lust(15)][0],[DynStat.Lust(15)][1],[DynStat.Lust(15)][2],[DynStat.Lust(15)][3],[DynStat.Lust(15)][4],[DynStat.Lust(15)][5]);
            }
            else if(int([DynStat.Lust(15)].length) == 7)
            {
               get_game().player.dynStats([DynStat.Lust(15)][0],[DynStat.Lust(15)][1],[DynStat.Lust(15)][2],[DynStat.Lust(15)][3],[DynStat.Lust(15)][4],[DynStat.Lust(15)][5],[DynStat.Lust(15)][6]);
            }
            else if(int([DynStat.Lust(15)].length) == 8)
            {
               get_game().player.dynStats([DynStat.Lust(15)][0],[DynStat.Lust(15)][1],[DynStat.Lust(15)][2],[DynStat.Lust(15)][3],[DynStat.Lust(15)][4],[DynStat.Lust(15)][5],[DynStat.Lust(15)][6],[DynStat.Lust(15)][7]);
            }
            else if(int([DynStat.Lust(15)].length) == 9)
            {
               get_game().player.dynStats([DynStat.Lust(15)][0],[DynStat.Lust(15)][1],[DynStat.Lust(15)][2],[DynStat.Lust(15)][3],[DynStat.Lust(15)][4],[DynStat.Lust(15)][5],[DynStat.Lust(15)][6],[DynStat.Lust(15)][7],[DynStat.Lust(15)][8]);
            }
            else if(int([DynStat.Lust(15)].length) == 10)
            {
               get_game().player.dynStats([DynStat.Lust(15)][0],[DynStat.Lust(15)][1],[DynStat.Lust(15)][2],[DynStat.Lust(15)][3],[DynStat.Lust(15)][4],[DynStat.Lust(15)][5],[DynStat.Lust(15)][6],[DynStat.Lust(15)][7],[DynStat.Lust(15)][8],[DynStat.Lust(15)][9]);
            }
            else if(int([DynStat.Lust(15)].length) == 11)
            {
               get_game().player.dynStats([DynStat.Lust(15)][0],[DynStat.Lust(15)][1],[DynStat.Lust(15)][2],[DynStat.Lust(15)][3],[DynStat.Lust(15)][4],[DynStat.Lust(15)][5],[DynStat.Lust(15)][6],[DynStat.Lust(15)][7],[DynStat.Lust(15)][8],[DynStat.Lust(15)][9],[DynStat.Lust(15)][10]);
            }
            else if(int([DynStat.Lust(15)].length) == 12)
            {
               get_game().player.dynStats([DynStat.Lust(15)][0],[DynStat.Lust(15)][1],[DynStat.Lust(15)][2],[DynStat.Lust(15)][3],[DynStat.Lust(15)][4],[DynStat.Lust(15)][5],[DynStat.Lust(15)][6],[DynStat.Lust(15)][7],[DynStat.Lust(15)][8],[DynStat.Lust(15)][9],[DynStat.Lust(15)][10],[DynStat.Lust(15)][11]);
            }
            else if(int([DynStat.Lust(15)].length) == 13)
            {
               get_game().player.dynStats([DynStat.Lust(15)][0],[DynStat.Lust(15)][1],[DynStat.Lust(15)][2],[DynStat.Lust(15)][3],[DynStat.Lust(15)][4],[DynStat.Lust(15)][5],[DynStat.Lust(15)][6],[DynStat.Lust(15)][7],[DynStat.Lust(15)][8],[DynStat.Lust(15)][9],[DynStat.Lust(15)][10],[DynStat.Lust(15)][11],[DynStat.Lust(15)][12]);
            }
            else if(int([DynStat.Lust(15)].length) == 14)
            {
               get_game().player.dynStats([DynStat.Lust(15)][0],[DynStat.Lust(15)][1],[DynStat.Lust(15)][2],[DynStat.Lust(15)][3],[DynStat.Lust(15)][4],[DynStat.Lust(15)][5],[DynStat.Lust(15)][6],[DynStat.Lust(15)][7],[DynStat.Lust(15)][8],[DynStat.Lust(15)][9],[DynStat.Lust(15)][10],[DynStat.Lust(15)][11],[DynStat.Lust(15)][12],[DynStat.Lust(15)][13]);
            }
            else if(int([DynStat.Lust(15)].length) == 15)
            {
               get_game().player.dynStats([DynStat.Lust(15)][0],[DynStat.Lust(15)][1],[DynStat.Lust(15)][2],[DynStat.Lust(15)][3],[DynStat.Lust(15)][4],[DynStat.Lust(15)][5],[DynStat.Lust(15)][6],[DynStat.Lust(15)][7],[DynStat.Lust(15)][8],[DynStat.Lust(15)][9],[DynStat.Lust(15)][10],[DynStat.Lust(15)][11],[DynStat.Lust(15)][12],[DynStat.Lust(15)][13],[DynStat.Lust(15)][14]);
            }
            else if(int([DynStat.Lust(15)].length) == 16)
            {
               get_game().player.dynStats([DynStat.Lust(15)][0],[DynStat.Lust(15)][1],[DynStat.Lust(15)][2],[DynStat.Lust(15)][3],[DynStat.Lust(15)][4],[DynStat.Lust(15)][5],[DynStat.Lust(15)][6],[DynStat.Lust(15)][7],[DynStat.Lust(15)][8],[DynStat.Lust(15)][9],[DynStat.Lust(15)][10],[DynStat.Lust(15)][11],[DynStat.Lust(15)][12],[DynStat.Lust(15)][13],[DynStat.Lust(15)][14],[DynStat.Lust(15)][15]);
            }
            else if(int([DynStat.Lust(15)].length) == 17)
            {
               get_game().player.dynStats([DynStat.Lust(15)][0],[DynStat.Lust(15)][1],[DynStat.Lust(15)][2],[DynStat.Lust(15)][3],[DynStat.Lust(15)][4],[DynStat.Lust(15)][5],[DynStat.Lust(15)][6],[DynStat.Lust(15)][7],[DynStat.Lust(15)][8],[DynStat.Lust(15)][9],[DynStat.Lust(15)][10],[DynStat.Lust(15)][11],[DynStat.Lust(15)][12],[DynStat.Lust(15)][13],[DynStat.Lust(15)][14],[DynStat.Lust(15)][15],[DynStat.Lust(15)][16]);
            }
            else if(int([DynStat.Lust(15)].length) == 18)
            {
               get_game().player.dynStats([DynStat.Lust(15)][0],[DynStat.Lust(15)][1],[DynStat.Lust(15)][2],[DynStat.Lust(15)][3],[DynStat.Lust(15)][4],[DynStat.Lust(15)][5],[DynStat.Lust(15)][6],[DynStat.Lust(15)][7],[DynStat.Lust(15)][8],[DynStat.Lust(15)][9],[DynStat.Lust(15)][10],[DynStat.Lust(15)][11],[DynStat.Lust(15)][12],[DynStat.Lust(15)][13],[DynStat.Lust(15)][14],[DynStat.Lust(15)][15],[DynStat.Lust(15)][16],[DynStat.Lust(15)][17]);
            }
            else if(int([DynStat.Lust(15)].length) == 19)
            {
               get_game().player.dynStats([DynStat.Lust(15)][0],[DynStat.Lust(15)][1],[DynStat.Lust(15)][2],[DynStat.Lust(15)][3],[DynStat.Lust(15)][4],[DynStat.Lust(15)][5],[DynStat.Lust(15)][6],[DynStat.Lust(15)][7],[DynStat.Lust(15)][8],[DynStat.Lust(15)][9],[DynStat.Lust(15)][10],[DynStat.Lust(15)][11],[DynStat.Lust(15)][12],[DynStat.Lust(15)][13],[DynStat.Lust(15)][14],[DynStat.Lust(15)][15],[DynStat.Lust(15)][16],[DynStat.Lust(15)][17],[DynStat.Lust(15)][18]);
            }
            else
            {
               if(int([DynStat.Lust(15)].length) != 20)
               {
                  throw "Too many rest arguments";
               }
               get_game().player.dynStats([DynStat.Lust(15)][0],[DynStat.Lust(15)][1],[DynStat.Lust(15)][2],[DynStat.Lust(15)][3],[DynStat.Lust(15)][4],[DynStat.Lust(15)][5],[DynStat.Lust(15)][6],[DynStat.Lust(15)][7],[DynStat.Lust(15)][8],[DynStat.Lust(15)][9],[DynStat.Lust(15)][10],[DynStat.Lust(15)][11],[DynStat.Lust(15)][12],[DynStat.Lust(15)][13],[DynStat.Lust(15)][14],[DynStat.Lust(15)][15],[DynStat.Lust(15)][16],[DynStat.Lust(15)][17],[DynStat.Lust(15)][18],[DynStat.Lust(15)][19]);
            }
            createStatusEffect(StatusEffects.MilkyUrta,3,0,0,0);
         }
      }
   }
}

