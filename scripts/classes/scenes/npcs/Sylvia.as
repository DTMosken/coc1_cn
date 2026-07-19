package classes.scenes.npcs
{
   import classes.Appearance;
   import classes.CoC;
   import classes.Creature;
   import classes.Monster;
   import classes.PerkLib;
   import classes.Player;
   import classes.ReactionContext;
   import classes.StatusEffects;
   import classes.internals.MonsterAI;
   import classes.internals.Utils;
   import classes.internals.WeightedChoice;
   import classes.scenes.combat.AvoidDamageParameters;
   import classes.scenes.combat.CombatRange;
   import classes.statusEffects.combat.MothPheromones;
   import flash.Boot;
   
   public class Sylvia extends Monster
   {
      
      public function Sylvia()
      {
         if(Boot.skip_constructor)
         {
            return;
         }
         super();
         set_a(get_game().sylviaScene.get_sylviaProg() > 1 ? "" : "这只");
         set_short(get_game().sylviaScene.get_sylviaProg() > 1 ? "西尔维娅" : "蛾女");
         imageName = "sylvia";
         set_long("你正面对着" + (get_game().sylviaScene.get_sylviaProg() > 1 ? "西尔维娅，" : "") + "一个淫荡的蛾女。她眼中闪烁的色欲光芒让你对她的意图一清二楚，而她闪电般的动作则预示着她绝对有能力得逞。她拍打着巨大而美丽的翅膀在森林中飞舞，几乎不给你机会去仔细打量她丰满的身材，不过在她偶尔停下的那几秒钟里，她一丝不挂的身体还是让你大饱眼福。");
         set_race("Moth");
         createVagina(false,3,0);
         createBreastRow(Appearance.breastCupInverse("E"));
         ass.analLooseness = 1;
         set_tallness(70);
         hips.rating = 8;
         butt.rating = 8;
         skin.tone = "pale white";
         hair.color = "purple";
         hair.length = 8;
         initStrTouSpeInte(45,65,120,75);
         initLibSensCor(65,35,35);
         set_weaponName("chitin-plated fist");
         set_weaponVerb("strike");
         set_armorName("chitin");
         bonusHP = 270;
         set_lust(get_game().sylviaScene.get_sylviaProg() <= 4 ? 33 : 0);
         temperment = 1;
         level = 20;
         set_gems(Utils.rand(50) + 25);
         createPerk(PerkLib.Evade,0,0,0,0);
         createStatusEffect(StatusEffects.GenericRunDisabled,0,0,0,0);
         additionalXP = 150;
         set_drop(new WeightedChoice());
         checkMonster();
      }
      
      override public function won(param1:Boolean, param2:Boolean = false) : void
      {
         get_game().sylviaScene.sylviaDefeat();
      }
      
      public function sylviaPheromones() : void
      {
         outputText("蛾女俯冲下来，但她没有攻击你，而是用翅膀向你扇起一阵风。");
         if(Boolean(combatAvoidDamage(new AvoidDamageParameters(true,false,false,null,null,null,null,null)).attackFailed))
         {
            outputText("[pg]你反应迅速，赶紧躲开了，只有一丝危险的气味在你的鼻尖萦绕。");
         }
         else
         {
            outputText("[pg]你没能躲开，一股芳香的气流直接扑面而来，让你深深地吸入了一股甜腻的气味。");
            get_player().addStatusEffect(new MothPheromones(5));
         }
      }
      
      public function sylviaHypnotize() : void
      {
         var _loc1_:int = 0;
         var _loc2_:int = 0;
         outputText("毫无预兆地，蛾女以惊人的速度向你逼近，双臂张开。");
         if(Boolean(combatAvoidDamage(new AvoidDamageParameters(true,false,true,null,null,null,null,null)).attackFailed))
         {
            outputText("[pg]你灵巧地躲开了蛾女的擒抱。");
         }
         else
         {
            outputText("[pg]蛾女用双臂环抱住你，随后扬起翅膀，遮蔽了你头顶的天空。距离如此之近，你忍不住凝视着她深邃的黑色眼眸。你开始感到一阵眩晕。");
            if(get_player().stun(2,66))
            {
               outputText("[pg]当她退开时，你踉跄了一会儿，她双眼的画面依然在你眼前挥之不去。");
            }
            _loc2_ = 4;
            createStatusEffect(StatusEffects.StunCooldown,_loc2_,0,0,0);
            _loc1_ = Utils.rand(30) + 20;
            get_player().takeLustDamage(_loc1_,true);
         }
      }
      
      public function seduceAttack() : void
      {
         var _loc1_:int = Utils.rand(3);
         switch(_loc1_)
         {
            case 0:
               outputText("蛾女落在几英尺外，漂亮的脸蛋上撅起小嘴。她假装对你持续的抵抗感到懊恼，挺起胸膛，将她那硕大的双乳向前挺了挺。");
               break;
            case 1:
               outputText("蛾女在空中做出了一个复杂的飞行动作。她优雅的身姿与惊艳的美貌交织在一起，令人叹为观止，你觉得自己的脸开始发烫。");
               break;
            case 2:
               outputText((get_game().sylviaScene.get_sylviaProg() > 1 ? "西尔维娅" : "她") + "突然从后面猛扑过来，双臂环抱住你的身前。你设法甩开了她，但她还是在你耳边低语道：[say:我们会玩得很开心的……] 当她再次起飞时，留下了一丝甜腻的气味。");
         }
         var _loc2_:int = Utils.rand(15) + 10;
         get_player().takeLustDamage(_loc2_,true);
      }
      
      override public function react(param1:ReactionContext) : Boolean
      {
         if(param1.index == 9)
         {
            if(Utils.rand(10) == 0 && !get_player().hasStatusEffect(StatusEffects.Stunned) && get_player().hasStatusEffect(StatusEffects.MothDose))
            {
               clearOutput();
               tookAction = true;
               outputText("正当你准备行动时，" + get_a() + get_short() + "高高飞起，与你拉开了相当一段距离，随后突然调转方向，朝你猛冲过来。");
               if(Boolean(combatAvoidDamage(new AvoidDamageParameters(true,false,false,null,null,null,null,null)).attackFailed))
               {
                  outputText("[pg]你侧步躲开了攻击，蛾女从你身旁掠过，停在了相当远的地方。");
                  get_game().combatRangeData.moveMonsterDistant(this);
                  return true;
               }
               outputText("[pg]你太慢了，这记横扫冲锋结结实实地击中了你，将你" + (get_player().lowerBody.legCount < 2 ? "击倒在地" : "击飞出去") + "。");
               outputText("[pg]<b>你失去了准备动作。</b>");
               return false;
            }
         }
         return true;
      }
      
      override public function performCombatAction() : void
      {
         var _loc1_:MonsterAI = new MonsterAI();
         _loc1_.add(sylviaPheromones,10,!get_player().hasStatusEffect(StatusEffects.MothDose),4,FATIGUE_PHYSICAL,CombatRange.Ranged);
         _loc1_.add(sylviaHypnotize,7,!hasStatusEffect(StatusEffects.StunCooldown),5,FATIGUE_PHYSICAL,CombatRange.ChargingMelee);
         _loc1_.add(seduceAttack,5,true,0,FATIGUE_NONE,CombatRange.Tease);
         _loc1_.add(eAttack,1,true,0,FATIGUE_NONE,CombatRange.Melee);
         _loc1_.exec();
      }
      
      override public function defeated(param1:Boolean) : void
      {
         get_game().sylviaScene.sylviaVictory();
      }
   }
}

