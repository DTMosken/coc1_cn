package classes.scenes.quests.urtaQuest
{
   import classes.CoC;
   import classes.Creature;
   import classes.DynStat;
   import classes.Player;
   import classes.StatusEffects;
   import classes.internals.MonsterAI;
   import classes.internals.Utils;
   import classes.scenes.areas.desert.Naga;
   import classes.scenes.combat.AvoidDamageParameters;
   import classes.scenes.combat.CombatRange;
   import flash.Boot;
   
   public class Sirius extends Naga
   {
      
      public function Sirius()
      {
         if(Boot.skip_constructor)
         {
            return;
         }
         super(true);
         set_a("");
         set_short("Sirius, a naga hypnotist");
         imageName = "sirius";
         set_long("一个奇怪的生物站在你面前，他有着人类男性的上半身，顶着一个巨大的蛇头，愤怒地发出嘶嘶声，偶尔让一条长长的、分叉的舌头在嘴唇间闪烁。一张具有帝国特征的男性人类面孔以冷漠的表情注视着你。一条深橙色——几乎是鲜红色——的马尾辫垂在他的肩膀之间，由银色的蛇形头饰固定在一起，手腕上戴着相同材质和设计的匹配手镯。鳞片从他的下腰开始，向你隐藏了他的男子气概；除此之外，他完全赤裸。他的蛇身细长，覆盖着丰富的橙红色调的精细啮合鳞片，红色被随机粗细的黑色条纹图案打破。他燃烧的黄色眼睛直视着你的眼睛，垂直的瞳孔裂缝固定在你的眼睛上，他以一种令人毛骨悚然的诱人方式起伏和盘绕。");
         set_race("Naga");
         set_plural(false);
         createCock(14,2);
         createBreastRow(0);
         ass.analLooseness = 1;
         ass.analWetness = 0;
         createStatusEffect(StatusEffects.BonusACapacity,10,0,0,0);
         set_tallness(70);
         hips.rating = 8;
         butt.rating = 8;
         lowerBody.type = 3;
         skin.tone = "mediterranean-toned";
         hair.color = "orange";
         hair.length = 16;
         initStrTouSpeInte(75,70,75,92);
         initLibSensCor(45,35,40);
         set_weaponName("fangs");
         set_weaponVerb("bite");
         set_weaponAttack(25);
         normalAttackAvoid.doParry = false;
         normalAttackAvoid.doCounter = false;
         set_armorName("scales");
         set_armorDef(30);
         bonusHP = 400;
         set_lust(30);
         temperment = 2;
         level = 12;
         set_gems(Utils.rand(5) + 8);
         set_drop(NO_DROP);
         special1 = nagaPoisonBiteAttack;
         special2 = nagaConstrict;
         special3 = nagaTailWhip;
         checkMonster();
      }
      
      override public function won(param1:Boolean, param2:Boolean = false) : void
      {
         get_game().urtaQuest.urtaLosesToSirriusSnakeRadio();
      }
      
      public function poisonBite() : void
      {
         outputText("伴随着一声响亮而恶毒的嘶嘶声，西里斯突然向你扑来，嘴巴张得不可思议地大，露出四颗滴着毒液的针状毒牙！");
         if(Boolean(combatAvoidDamage(new AvoidDamageParameters(true,false,false,null,null,null,null,null)).attackFailed))
         {
            outputText("你在千钧一发之际躲开了，并在西里斯飞过时用戟柄给了他沉重的一击，迫使他滑过你，准备再次防御。");
         }
         outputText("蛇人的动作太快，你无法躲避，他将长长的毒牙刺入你的肉体，留下一个燃烧着可怕疼痛的伤口。");
         var _loc1_:Number = 40 + Utils.rand(20);
         get_player().takeDamage(_loc1_,true);
      }
      
      override public function performCombatAction() : void
      {
         var _loc1_:MonsterAI = new MonsterAI();
         _loc1_.add(eAttack,1,true,0,FATIGUE_NONE,CombatRange.Melee);
         _loc1_.add(poisonBite,1,true,10,FATIGUE_PHYSICAL,CombatRange.ChargingMelee);
         _loc1_.add(manNagaTease,1,true,0,FATIGUE_NONE,CombatRange.Tease);
         _loc1_.add(nagaSpitAttack,1,get_player().hasStatusEffect(StatusEffects.Blind),10,FATIGUE_PHYSICAL,CombatRange.Ranged);
         _loc1_.exec();
      }
      
      override public function outputPlayerDodged(param1:int) : void
      {
         outputText("凭借你训练有素的眼睛，你看穿了他的虚招，有效地挡住了他的第一击，然后迅速扭动身体将他踢开。他捂着被你踢中的肚子，但很快就恢复了，眼睛死死盯着你。\n");
      }
      
      override public function outputAttack(param1:int) : void
      {
         if(param1 <= 0)
         {
            super.outputAttack(param1);
         }
         else
         {
            outputText("你误判了他的攻击模式，结果被他锋利的指甲连续抓伤。他拉开与你的距离以避免遭到反击，并用他那锐利的黄色眼睛瞪着你，脸上带着一丝微笑。<b>(<font color=\"" + get_game().mainViewManager.colorHpMinus() + "\">" + param1 + "</font>)</b>");
         }
      }
      
      public function nagaSpitAttack() : void
      {
         outputText("西里斯大声嘶嘶叫着，突然卷起嘴唇，朝你的眼睛吐口水！");
         if(get_spe() / 20 + Utils.rand(20) + 1 > get_player().get_spe() / 20 + 10)
         {
            outputText("那恶毒的喷雾击中了你的眼睛，你痛苦地尖叫起来，猛烈地抓挠着你那燃烧、流泪、哭泣的眼睛。<b>你看不见了！在这种状态下战斗会困难得多，但同时，他的催眠效果也不会那么有效了……</b>");
            get_player().createStatusEffect(StatusEffects.Blind,3,0,0,0);
         }
         else
         {
            outputText("你迅速向侧面倾斜，险些被蛇人的口水弄瞎！");
         }
      }
      
      public function manNagaTease() : void
      {
         var _loc1_:* = null as CoC;
         var _loc2_:* = null as Array;
         outputText("蛇人深深地凝视着你的眼睛，似乎看穿了它们，有那么一瞬间，你的身体变得麻木了。");
         if(Utils.rand(10) == 0)
         {
            outputText("你眨了眨眼，摇了摇头，摆脱了蛇人那锐利目光的影响。");
         }
         if(hasStatusEffect(StatusEffects.Blind))
         {
            outputText("尽管你的视线仍然模糊，但你感觉自己被吸入了那金色的瞳孔深处，让你忘记了所有的烦恼，哪怕只有一瞬间。当你沉浸在他的目光中时，你唯一能集中注意力的就是你不断增长的性欲。你摇了摇头，清除了蛇人眼睛似乎拥有的催眠效果，尽管性欲依然存在。");
            _loc1_ = get_game();
            _loc2_ = [DynStat.Lust(5 + get_player().lib / 10 - get_player().get_inte() / 20)];
            if(int(_loc2_.length) == 0)
            {
               _loc1_.player.dynStats();
            }
            else if(int(_loc2_.length) == 1)
            {
               _loc1_.player.dynStats(_loc2_[0]);
            }
            else if(int(_loc2_.length) == 2)
            {
               _loc1_.player.dynStats(_loc2_[0],_loc2_[1]);
            }
            else if(int(_loc2_.length) == 3)
            {
               _loc1_.player.dynStats(_loc2_[0],_loc2_[1],_loc2_[2]);
            }
            else if(int(_loc2_.length) == 4)
            {
               _loc1_.player.dynStats(_loc2_[0],_loc2_[1],_loc2_[2],_loc2_[3]);
            }
            else if(int(_loc2_.length) == 5)
            {
               _loc1_.player.dynStats(_loc2_[0],_loc2_[1],_loc2_[2],_loc2_[3],_loc2_[4]);
            }
            else if(int(_loc2_.length) == 6)
            {
               _loc1_.player.dynStats(_loc2_[0],_loc2_[1],_loc2_[2],_loc2_[3],_loc2_[4],_loc2_[5]);
            }
            else if(int(_loc2_.length) == 7)
            {
               _loc1_.player.dynStats(_loc2_[0],_loc2_[1],_loc2_[2],_loc2_[3],_loc2_[4],_loc2_[5],_loc2_[6]);
            }
            else if(int(_loc2_.length) == 8)
            {
               _loc1_.player.dynStats(_loc2_[0],_loc2_[1],_loc2_[2],_loc2_[3],_loc2_[4],_loc2_[5],_loc2_[6],_loc2_[7]);
            }
            else if(int(_loc2_.length) == 9)
            {
               _loc1_.player.dynStats(_loc2_[0],_loc2_[1],_loc2_[2],_loc2_[3],_loc2_[4],_loc2_[5],_loc2_[6],_loc2_[7],_loc2_[8]);
            }
            else if(int(_loc2_.length) == 10)
            {
               _loc1_.player.dynStats(_loc2_[0],_loc2_[1],_loc2_[2],_loc2_[3],_loc2_[4],_loc2_[5],_loc2_[6],_loc2_[7],_loc2_[8],_loc2_[9]);
            }
            else if(int(_loc2_.length) == 11)
            {
               _loc1_.player.dynStats(_loc2_[0],_loc2_[1],_loc2_[2],_loc2_[3],_loc2_[4],_loc2_[5],_loc2_[6],_loc2_[7],_loc2_[8],_loc2_[9],_loc2_[10]);
            }
            else if(int(_loc2_.length) == 12)
            {
               _loc1_.player.dynStats(_loc2_[0],_loc2_[1],_loc2_[2],_loc2_[3],_loc2_[4],_loc2_[5],_loc2_[6],_loc2_[7],_loc2_[8],_loc2_[9],_loc2_[10],_loc2_[11]);
            }
            else if(int(_loc2_.length) == 13)
            {
               _loc1_.player.dynStats(_loc2_[0],_loc2_[1],_loc2_[2],_loc2_[3],_loc2_[4],_loc2_[5],_loc2_[6],_loc2_[7],_loc2_[8],_loc2_[9],_loc2_[10],_loc2_[11],_loc2_[12]);
            }
            else if(int(_loc2_.length) == 14)
            {
               _loc1_.player.dynStats(_loc2_[0],_loc2_[1],_loc2_[2],_loc2_[3],_loc2_[4],_loc2_[5],_loc2_[6],_loc2_[7],_loc2_[8],_loc2_[9],_loc2_[10],_loc2_[11],_loc2_[12],_loc2_[13]);
            }
            else if(int(_loc2_.length) == 15)
            {
               _loc1_.player.dynStats(_loc2_[0],_loc2_[1],_loc2_[2],_loc2_[3],_loc2_[4],_loc2_[5],_loc2_[6],_loc2_[7],_loc2_[8],_loc2_[9],_loc2_[10],_loc2_[11],_loc2_[12],_loc2_[13],_loc2_[14]);
            }
            else if(int(_loc2_.length) == 16)
            {
               _loc1_.player.dynStats(_loc2_[0],_loc2_[1],_loc2_[2],_loc2_[3],_loc2_[4],_loc2_[5],_loc2_[6],_loc2_[7],_loc2_[8],_loc2_[9],_loc2_[10],_loc2_[11],_loc2_[12],_loc2_[13],_loc2_[14],_loc2_[15]);
            }
            else if(int(_loc2_.length) == 17)
            {
               _loc1_.player.dynStats(_loc2_[0],_loc2_[1],_loc2_[2],_loc2_[3],_loc2_[4],_loc2_[5],_loc2_[6],_loc2_[7],_loc2_[8],_loc2_[9],_loc2_[10],_loc2_[11],_loc2_[12],_loc2_[13],_loc2_[14],_loc2_[15],_loc2_[16]);
            }
            else if(int(_loc2_.length) == 18)
            {
               _loc1_.player.dynStats(_loc2_[0],_loc2_[1],_loc2_[2],_loc2_[3],_loc2_[4],_loc2_[5],_loc2_[6],_loc2_[7],_loc2_[8],_loc2_[9],_loc2_[10],_loc2_[11],_loc2_[12],_loc2_[13],_loc2_[14],_loc2_[15],_loc2_[16],_loc2_[17]);
            }
            else if(int(_loc2_.length) == 19)
            {
               _loc1_.player.dynStats(_loc2_[0],_loc2_[1],_loc2_[2],_loc2_[3],_loc2_[4],_loc2_[5],_loc2_[6],_loc2_[7],_loc2_[8],_loc2_[9],_loc2_[10],_loc2_[11],_loc2_[12],_loc2_[13],_loc2_[14],_loc2_[15],_loc2_[16],_loc2_[17],_loc2_[18]);
            }
            else
            {
               if(int(_loc2_.length) != 20)
               {
                  throw "Too many rest arguments";
               }
               _loc1_.player.dynStats(_loc2_[0],_loc2_[1],_loc2_[2],_loc2_[3],_loc2_[4],_loc2_[5],_loc2_[6],_loc2_[7],_loc2_[8],_loc2_[9],_loc2_[10],_loc2_[11],_loc2_[12],_loc2_[13],_loc2_[14],_loc2_[15],_loc2_[16],_loc2_[17],_loc2_[18],_loc2_[19]);
            }
         }
         else
         {
            outputText("那黄色的水潭将你吸入其金色的深处，让你忘记了所有的烦恼，哪怕只有一瞬间。当你沉浸在他的目光中时，你唯一能集中注意力的就是你不断增长的性欲。你摇了摇头，清除了蛇人眼睛似乎拥有的催眠效果，尽管性欲依然存在。");
            _loc1_ = get_game();
            _loc2_ = [DynStat.Lust(10 + get_player().lib / 7 - get_player().get_inte() / 20)];
            if(int(_loc2_.length) == 0)
            {
               _loc1_.player.dynStats();
            }
            else if(int(_loc2_.length) == 1)
            {
               _loc1_.player.dynStats(_loc2_[0]);
            }
            else if(int(_loc2_.length) == 2)
            {
               _loc1_.player.dynStats(_loc2_[0],_loc2_[1]);
            }
            else if(int(_loc2_.length) == 3)
            {
               _loc1_.player.dynStats(_loc2_[0],_loc2_[1],_loc2_[2]);
            }
            else if(int(_loc2_.length) == 4)
            {
               _loc1_.player.dynStats(_loc2_[0],_loc2_[1],_loc2_[2],_loc2_[3]);
            }
            else if(int(_loc2_.length) == 5)
            {
               _loc1_.player.dynStats(_loc2_[0],_loc2_[1],_loc2_[2],_loc2_[3],_loc2_[4]);
            }
            else if(int(_loc2_.length) == 6)
            {
               _loc1_.player.dynStats(_loc2_[0],_loc2_[1],_loc2_[2],_loc2_[3],_loc2_[4],_loc2_[5]);
            }
            else if(int(_loc2_.length) == 7)
            {
               _loc1_.player.dynStats(_loc2_[0],_loc2_[1],_loc2_[2],_loc2_[3],_loc2_[4],_loc2_[5],_loc2_[6]);
            }
            else if(int(_loc2_.length) == 8)
            {
               _loc1_.player.dynStats(_loc2_[0],_loc2_[1],_loc2_[2],_loc2_[3],_loc2_[4],_loc2_[5],_loc2_[6],_loc2_[7]);
            }
            else if(int(_loc2_.length) == 9)
            {
               _loc1_.player.dynStats(_loc2_[0],_loc2_[1],_loc2_[2],_loc2_[3],_loc2_[4],_loc2_[5],_loc2_[6],_loc2_[7],_loc2_[8]);
            }
            else if(int(_loc2_.length) == 10)
            {
               _loc1_.player.dynStats(_loc2_[0],_loc2_[1],_loc2_[2],_loc2_[3],_loc2_[4],_loc2_[5],_loc2_[6],_loc2_[7],_loc2_[8],_loc2_[9]);
            }
            else if(int(_loc2_.length) == 11)
            {
               _loc1_.player.dynStats(_loc2_[0],_loc2_[1],_loc2_[2],_loc2_[3],_loc2_[4],_loc2_[5],_loc2_[6],_loc2_[7],_loc2_[8],_loc2_[9],_loc2_[10]);
            }
            else if(int(_loc2_.length) == 12)
            {
               _loc1_.player.dynStats(_loc2_[0],_loc2_[1],_loc2_[2],_loc2_[3],_loc2_[4],_loc2_[5],_loc2_[6],_loc2_[7],_loc2_[8],_loc2_[9],_loc2_[10],_loc2_[11]);
            }
            else if(int(_loc2_.length) == 13)
            {
               _loc1_.player.dynStats(_loc2_[0],_loc2_[1],_loc2_[2],_loc2_[3],_loc2_[4],_loc2_[5],_loc2_[6],_loc2_[7],_loc2_[8],_loc2_[9],_loc2_[10],_loc2_[11],_loc2_[12]);
            }
            else if(int(_loc2_.length) == 14)
            {
               _loc1_.player.dynStats(_loc2_[0],_loc2_[1],_loc2_[2],_loc2_[3],_loc2_[4],_loc2_[5],_loc2_[6],_loc2_[7],_loc2_[8],_loc2_[9],_loc2_[10],_loc2_[11],_loc2_[12],_loc2_[13]);
            }
            else if(int(_loc2_.length) == 15)
            {
               _loc1_.player.dynStats(_loc2_[0],_loc2_[1],_loc2_[2],_loc2_[3],_loc2_[4],_loc2_[5],_loc2_[6],_loc2_[7],_loc2_[8],_loc2_[9],_loc2_[10],_loc2_[11],_loc2_[12],_loc2_[13],_loc2_[14]);
            }
            else if(int(_loc2_.length) == 16)
            {
               _loc1_.player.dynStats(_loc2_[0],_loc2_[1],_loc2_[2],_loc2_[3],_loc2_[4],_loc2_[5],_loc2_[6],_loc2_[7],_loc2_[8],_loc2_[9],_loc2_[10],_loc2_[11],_loc2_[12],_loc2_[13],_loc2_[14],_loc2_[15]);
            }
            else if(int(_loc2_.length) == 17)
            {
               _loc1_.player.dynStats(_loc2_[0],_loc2_[1],_loc2_[2],_loc2_[3],_loc2_[4],_loc2_[5],_loc2_[6],_loc2_[7],_loc2_[8],_loc2_[9],_loc2_[10],_loc2_[11],_loc2_[12],_loc2_[13],_loc2_[14],_loc2_[15],_loc2_[16]);
            }
            else if(int(_loc2_.length) == 18)
            {
               _loc1_.player.dynStats(_loc2_[0],_loc2_[1],_loc2_[2],_loc2_[3],_loc2_[4],_loc2_[5],_loc2_[6],_loc2_[7],_loc2_[8],_loc2_[9],_loc2_[10],_loc2_[11],_loc2_[12],_loc2_[13],_loc2_[14],_loc2_[15],_loc2_[16],_loc2_[17]);
            }
            else if(int(_loc2_.length) == 19)
            {
               _loc1_.player.dynStats(_loc2_[0],_loc2_[1],_loc2_[2],_loc2_[3],_loc2_[4],_loc2_[5],_loc2_[6],_loc2_[7],_loc2_[8],_loc2_[9],_loc2_[10],_loc2_[11],_loc2_[12],_loc2_[13],_loc2_[14],_loc2_[15],_loc2_[16],_loc2_[17],_loc2_[18]);
            }
            else
            {
               if(int(_loc2_.length) != 20)
               {
                  throw "Too many rest arguments";
               }
               _loc1_.player.dynStats(_loc2_[0],_loc2_[1],_loc2_[2],_loc2_[3],_loc2_[4],_loc2_[5],_loc2_[6],_loc2_[7],_loc2_[8],_loc2_[9],_loc2_[10],_loc2_[11],_loc2_[12],_loc2_[13],_loc2_[14],_loc2_[15],_loc2_[16],_loc2_[17],_loc2_[18],_loc2_[19]);
            }
         }
      }
      
      override public function eAttack() : void
      {
         outputText("西里斯准备好双手，身体不规则地快速起伏，试图让你措手不及并攻击你。\n");
         super.eAttack();
      }
      
      override public function defeated(param1:Boolean) : void
      {
         get_game().urtaQuest.urtaBeatsUpSiriusRadio();
      }
   }
}

