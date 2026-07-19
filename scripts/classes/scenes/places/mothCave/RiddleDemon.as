package classes.scenes.places.mothCave
{
   import classes.CoC;
   import classes.CockTypesEnum;
   import classes.Monster;
   import classes.PerkLib;
   import classes.Player;
   import classes.ReactionContext;
   import classes.StatusEffects;
   import classes.internals.MonsterAI;
   import classes.internals.Utils;
   import classes.scenes.combat.CombatAttackBuilder;
   import classes.scenes.combat.CombatRange;
   import flash.Boot;
   
   public class RiddleDemon extends Monster
   {
      
      public var whisperCooldown:int;
      
      public var doloresFree:Boolean;
      
      public function RiddleDemon()
      {
         if(Boot.skip_constructor)
         {
            return;
         }
         whisperCooldown = 0;
         doloresFree = false;
         super();
         doloresFree = (get_game().mothCave.doloresScene.saveContent.hikkiQuest & get_game().mothCave.doloresScene.HQFREE) > 0;
         set_a("");
         set_short("old demon");
         set_long("你正在和一个年迈可悲的恶魔战斗。他破旧的衣服下肌肉不自然地隆起，移动速度完全出乎你的意料。只要你的视线离开他哪怕一秒钟，这个恶魔就会以惊人的敏捷冲向你，让这场战斗变成一次令人毛骨悚然的经历。");
         imageName = "riddleDemon";
         set_race("Demon");
         createCock(10,1.5,CockTypesEnum.DEMON);
         balls = 2;
         ballSize = 3;
         set_tallness(78);
         createBreastRow();
         ass.analLooseness = 1;
         ass.analWetness = 1;
         skin.tone = "pale";
         hair.color = "gray";
         hips.rating = 2;
         butt.rating = 4;
         initStrTouSpeInte(60,180,110,120);
         initLibSensCor(75,50,100);
         set_weaponName("nails");
         set_weaponVerb("slash");
         set_weaponAttack(30);
         set_armorName("shabby clothing");
         set_armorDef(10);
         bonusHP = 3000;
         bonusLust = 100;
         lustVuln = 0.4;
         temperment = 1;
         level = 30;
         createStatusEffect(StatusEffects.GenericRunDisabled,0,0,0,0);
         createPerk(PerkLib.StunImmune,0,0,0,0);
         createPerk(PerkLib.SpeedyRecovery,0,0,0,0);
         additionalXP = 200;
         set_drop(NO_DROP);
         checkMonster();
      }
      
      override public function won(param1:Boolean, param2:Boolean = false) : void
      {
         get_game().mothCave.doloresScene.hikkiFightLoss();
      }
      
      public function whisper() : void
      {
         outputText("恶魔冲到近前，但他没有攻击，而是开始低语。你听不清他在说什么，但你开始感到头晕目眩，踉跄后退，差点[if (hasweapon) {掉落武器|放下拳头}]。你脑海中有一个声音开始胡言乱语，你费尽全力才保持[if (singleleg) {直立|站稳}]。当你抬起头时，整个世界似乎都变得混乱不堪，仿佛一切都没有拼凑好。");
         get_player().createStatusEffect(StatusEffects.Whispered,0,0,0,0);
         whisperCooldown = 4;
      }
      
      public function slash() : void
      {
         outputText("恶魔向你扑来，");
         var _loc1_:CombatAttackBuilder = new CombatAttackBuilder().canDodge().canBlock().canParry();
         _loc1_.combatReactions = {
            "blind":"但由于失去了视觉，他几乎无法判断你的位置，让你轻松躲开了他的攻击。",
            "speed":"你在他的爪子抓到你之前，勉强躲开了。",
            "evade":"你在他的爪子抓到你之前，勉强躲开了。",
            "misdirection":"你在他的爪子抓到你之前，勉强躲开了。",
            "flexibility":"你在他的爪子抓到你之前，勉强躲开了。",
            "unhandled":"你勉强躲开了他的爪子，没被抓伤。",
            "block":"但你成功地在他击中你之前挡开了他那撕裂般的斩击。",
            "parry":"但你成功地在他击中你之前挡开了他那撕裂般的斩击。",
            "counter":""
         };
         if(_loc1_.executeAttack().isSuccessfulHit())
         {
            outputText("还没等你做出任何反应，他的爪子[if (hasarmor) {突破了你的防御|刺入了你赤裸的肉体}]，深深地挖了进去，一阵灼痛传遍全身。即使你捂着受伤的侧腹退开，你的身体仍在继续抽痛，每一次脉动都让你失去平衡。");
            if(!get_player().hasStatusEffect(StatusEffects.Poison))
            {
               get_player().createStatusEffect(StatusEffects.Poison,0,2,0,0);
            }
            get_player().takeDamage(get_player().reduceDamage(get_str() + get_weaponAttack() + Utils.rand(20),this),true);
         }
      }
      
      override public function react(param1:ReactionContext) : Boolean
      {
         if(param1.index == 9)
         {
            if(Utils.randomChance(10))
            {
               outputText("恶魔做了一个灵巧的假动作，然后开始逼近准备攻击，但就在他碰到你之前，你的女儿从后面掠过他，让他失去平衡，迫使他暂时撤退。[pg]");
               tookAction = true;
            }
            else if(doloresFree)
            {
               if(Utils.randomChance(10) && get_player().get_HP() < get_player().maxHP())
               {
                  outputText("身后传来的一阵轻微的呢喃声引起了你的注意。你转过头，看到多洛雷斯闭着眼睛，脸颊绯红，看起来不仅仅是因为集中注意力。过了一会儿，她向你伸出双手，你能感觉到你的一些伤口正在愈合。[pg]");
                  get_player().HPChange(get_player().maxHP() * 0.1,true);
               }
               else if(Utils.randomChance(10))
               {
                  outputText("恶魔目前只专注于你一个人，这让你的女儿有机会念诵一段简短的咒语。她伸出四只手，喷出一股苍白的火焰，灼烧着恶魔。[pg]");
                  takeDamage(50 + Utils.rand(50),true);
               }
            }
         }
         return true;
      }
      
      override public function performCombatAction() : void
      {
         var _loc1_:MonsterAI = new MonsterAI();
         _loc1_.add(slash,3,true,5,FATIGUE_PHYSICAL,CombatRange.Melee);
         _loc1_.add(feint,1,true,10,FATIGUE_PHYSICAL,CombatRange.ChargingMelee);
         var _temp_4:* = _loc1_;
         var _temp_3:* = whisper;
         var _temp_2:* = 1;
         var _loc2_:int;
         whisperCooldown = (_loc2_ = whisperCooldown) - 1;
         _temp_4.add(_temp_3,_temp_2,_loc2_ <= 0,10,FATIGUE_MAGICAL,CombatRange.Omni);
         _loc1_.exec();
      }
      
      public function feint() : void
      {
         outputText("狡猾的恶魔径直向你冲来，但就在他的攻击落下之前，他以一种不自然的姿势弯曲身体，");
         if(Utils.randomChance(get_player().get_inte100() - 10))
         {
            outputText("但你成功预判了他的动作，依然躲过了这一击。");
         }
         else
         {
            outputText("让他占了个便宜，这一击因为他的诡计而显得更加疼痛。");
            get_player().takeDamage(get_player().reduceDamage(get_str() + get_weaponAttack() + Utils.rand(10),this,10),true);
         }
      }
      
      override public function defeated(param1:Boolean) : void
      {
         get_game().mothCave.doloresScene.hikkiFightWin();
      }
   }
}

