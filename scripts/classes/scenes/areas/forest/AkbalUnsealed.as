package classes.scenes.areas.forest
{
   import classes.CoC;
   import classes.CockTypesEnum;
   import classes.Creature;
   import classes.Monster;
   import classes.PerkLib;
   import classes.Player;
   import classes.StatusEffectType;
   import classes.StatusEffects;
   import classes._FlagDict.FlagDict_Impl_;
   import classes.internals.MonsterAI;
   import classes.internals.Utils;
   import classes.items.Weapon;
   import classes.scenes.combat.AvoidDamageParameters;
   import classes.scenes.combat.CombatDistance;
   import classes.scenes.combat.CombatRange;
   import flash.Boot;
   import haxe.IMap;
   
   public class AkbalUnsealed extends Monster
   {
      
      public var rageMod:Number;
      
      public var playerActions:Object;
      
      public var cooldowns:Object;
      
      public function AkbalUnsealed()
      {
         if(Boot.skip_constructor)
         {
            return;
         }
         cooldowns = {
            "psiAssault":0,
            "terraFire":0,
            "swoop":0
         };
         playerActions = {
            "melee":0,
            "ranged":0,
            "magic":0,
            "dodge":0,
            "gotStunned":0,
            "attemptStunned":0
         };
         super();
         rageMod = (1 + 0.05 * FlagDict_Impl_.arrayReadInt(get_flags(),2716)) * (1 + 0.3 * get_player().newGamePlusMod());
         set_a("");
         set_short("Akbal");
         set_long("阿克巴尔身高将近8英尺，用那双熟悉的翠绿色眼睛" + (get_player().get_tallness() < 94 ? "居高临下地" : "") + "盯着你。他的皮肤呈现深邃的暗红色，肌肉线条分明。他的翅膀向外延伸数英尺，和他本人一样高大宽阔，令人印象深刻。他的脸庞高傲而自信，胡须刮得干干净净，头顶长着几英尺长如丝般顺滑的黑发和两根长长的恶魔之角。他自诩为神，看起来也确实像那种会这么想的家伙。他的双臂上纹着散发绿光的水平线条，每只手臂上各有三条。他的手指末端都长着深色、灰白色的爪状指甲。一条粗壮尖锐的恶魔尾巴在他身后蜿蜒。他唯一的衣物是一条兽皮缠腰布，也许是受菲拉影响的风格选择。");
         imageName = "akbalUnsealed";
         set_race("Demon");
         createCock(15,2.5,CockTypesEnum.DEMON);
         balls = 2;
         ballSize = 4;
         set_tallness(95);
         createBreastRow();
         hips.rating = 2;
         butt.rating = 2;
         skin.tone = "dark red";
         hair.color = "black";
         hair.length = 36;
         wings.type = 11;
         initStrTouSpeInte(120,120,150,150);
         initLibSensCor(50,50,100);
         set_weaponName("fist");
         set_weaponVerb("punch");
         set_weaponAttack(30);
         set_armorName("demonic skin");
         set_armorDef(30);
         bonusHP = 1500;
         bonusLust = 100;
         lustVuln = 0.2;
         level = 30;
         set_gems(int(Math.round((500 + Utils.rand(100)) * (1 + 0.15 * FlagDict_Impl_.arrayReadInt(get_flags(),2716)))));
         additionalXP = 1000 * (1 + 0.1 * FlagDict_Impl_.arrayReadInt(get_flags(),2716));
         createPerk(PerkLib.BlindImmune,0,0,0,0);
         createPerk(PerkLib.StunImmune,0,0,0,0);
         createPerk(PerkLib.SpeedyRecovery,0,0,0,0);
         createPerk(PerkLib.Frustration,0,0,0,0);
         set_drop(NO_DROP);
         checkMonster();
      }
      
      override public function won(param1:Boolean, param2:Boolean = false) : void
      {
         get_game().forest.akbalScene.akbalQuestConclusionLose();
      }
      
      public function terraFire() : void
      {
         var _loc1_:Number = get_player().reduceDamage((get_inte() + 50) * rageMod,this,80);
         var _loc2_:Boolean = true;
         cooldowns.terraFire = 2;
         if(!hasStatusEffect(StatusEffects.AkbalFireUsed))
         {
            createStatusEffect(StatusEffects.AkbalFireUsed,0,0,0,0);
            _loc1_ *= 1.5;
            outputText("[say:告诉我，[name]，你知道“陆地”的含义吗？]阿克巴尔走上前来，双手掌心向前，手指指向地面。[say:它的意思是……属于<b>大地！</b>]他用洪亮的声音喊道，同时一道道翡翠般的光芒在地面上向你飞射而来。你根本来不及反应，脚下的地面就碎裂了，绿色的火焰四处喷发，将你击倒。");
            if(get_player().canFly())
            {
               _loc1_ *= 0.25;
               _loc2_ = false;
               outputText("你以最快的速度跳跃，飞向天空以逃避这片火海。你在一段距离外降落，警惕地意识到在这场战斗中，离开地面可能更安全。");
            }
            else
            {
               outputText("这片火海烫伤了你的肉体，在你跌跌撞撞地逃开之前造成了可怕的伤害。");
            }
         }
         else
         {
            outputText("阿克巴尔双脚踏地，将翡翠般的光芒注入大地。");
            if(playerAvoidDamage(new AvoidDamageParameters(true,false,false,null,null,null,null,null)))
            {
               _loc1_ *= 0.25;
               _loc2_ = false;
               outputText("你以最快的速度冲刺，以逃避随之而来的地震混乱。");
               var _temp_1:* = playerActions;
               _temp_1.dodge = int(_temp_1.dodge) + 1;
            }
            else
            {
               outputText("一瞬间后，你脚下的地面碎裂，将你卷入升腾的火焰中！");
            }
         }
         get_game().combat.monsterDamageType = "Fire";
         get_player().takeDamage(_loc1_,true);
         if(_loc2_)
         {
            var _temp_2:* = playerActions;
            _temp_2.attemptStunned = Number(_temp_2.attemptStunned) + 1;
            if(get_player().stun(1,100))
            {
               var _temp_3:* = playerActions;
               _temp_3.gotStunned = int(_temp_3.gotStunned) + 1;
            }
         }
      }
      
      public function swoop() : void
      {
         var _loc1_:Number = get_player().reduceDamage((get_str() + get_spe() + get_weaponAttack()) * rageMod,this,70);
         cooldowns.swoop = 2;
         outputText("阿克巴尔用力拍打翅膀，将自己推向你。你准备好闪避，");
         if(get_player().hasStatusEffect(StatusEffects.TrueWhispered))
         {
            outputText("但头部的剧痛让你动弹不得！恶魔沉重的身躯猛地撞向你，将你击倒在地。" + (get_game().get_silly() ? " 阿克巴尔悬停在空中，居高临下地看着你。[say: 你还没准备好！]" : ""));
         }
         else if(Boolean(combatAvoidDamage(new AvoidDamageParameters(true,false,false,null,null,null,null,null)).attackFailed))
         {
            outputText("并在他掠过时险之又险地避开了他的攻击。");
            var _temp_1:* = playerActions;
            _temp_1.dodge = int(_temp_1.dodge) + 1;
            return;
         }
         outputText("却发现还没来得及反应，他的拳头就已经结结实实地打在了你的胸口上。你痛苦地摔倒在地。");
         var _temp_2:* = playerActions;
         _temp_2.attemptStunned = Number(_temp_2.attemptStunned) + 0.5;
         if(get_player().stun(1,50))
         {
            var _temp_3:* = playerActions;
            _temp_3.gotStunned = int(_temp_3.gotStunned) + 1;
         }
         if(Utils.rand(2) == 0)
         {
            get_player().bleed(this,1 + Utils.rand(4),1 + Utils.rand(2));
         }
      }
      
      public function superHeal() : void
      {
         var _loc3_:* = null as StatusEffectType;
         var _loc4_:* = null as StatusEffectType;
         outputText("大恶魔向后退了几步，感觉到自己受到的伤害正在不断累积。他愤怒地瞪着你。");
         outputText("[say: 我是地炎之神。我是最早飞升的存在之一。你<b>休想</b>挡我的路！]");
         outputText("阿克巴尔的肉体闪烁着，仿佛你在看着海市蜃楼；很快他的伤口便消失得无影无踪，一阵绿色的火焰洗涤并净化了他的身体，让他恢复到了巅峰状态。");
         set_HP(maxHP());
         set_lust(0);
         set_fatigue(0);
         var _loc1_:int = 0;
         var _loc2_:Array = StatusEffects.monsterNegativeEffects;
         while(_loc1_ < int(_loc2_.length))
         {
            _loc3_ = _loc2_[_loc1_];
            _loc1_++;
            _loc4_ = _loc3_;
            if(indexOfStatusEffect(_loc4_) != -1)
            {
               removeStatusEffect(_loc4_);
            }
         }
         rageMod += 0.3;
         createStatusEffect(StatusEffects.AkbalHealUsed,0,0,0,0);
      }
      
      override public function shouldMove(param1:CombatDistance, param2:Boolean = false) : Boolean
      {
         var _loc3_:int = 0;
         if(FlagDict_Impl_.arrayReadInt(get_flags(),2716) >= 5)
         {
            return Boolean(super.shouldMove(param1,param2));
         }
         if(isFlying)
         {
            return false;
         }
         _loc3_ = int(playerActions.melee) + int(playerActions.ranged) + int(playerActions.magic);
         if(param1 == CombatDistance.Distant && (int(playerActions.melee) >= _loc3_ / 3 || int(playerActions.melee) >= _loc3_ / 4 && get_player().get_weapon().getAttackRange() != CombatRange.Ranged))
         {
            return true;
         }
         if(param1 == CombatDistance.Melee && get_player().canFly() && int(playerActions.gotStunned) > 0 && get_player().damagePercent(false,false,false,true) > 80)
         {
            return true;
         }
         return false;
      }
      
      public function punch() : void
      {
         var _loc1_:Number = (get_str() / 2 + get_inte() / 2 + get_weaponAttack()) * rageMod;
         var _loc2_:Number = 50;
         var _loc3_:AvoidDamageParameters = new AvoidDamageParameters(true,true,true,null,true,null,null,null);
         outputText("大恶魔的手握成拳头，挥舞着绿色的火焰，向你冲来！\n");
         if(playerAvoidDamage(_loc3_))
         {
            var _temp_1:* = playerActions;
            _temp_1.dodge = int(_temp_1.dodge) + 1;
            return;
         }
         outputText("他的指关节以惊人的力量猛击你，将你击退。");
         var _temp_2:* = playerActions;
         _temp_2.attemptStunned = Number(_temp_2.attemptStunned) + 0.2;
         if(get_player().stun(1,20))
         {
            var _temp_3:* = playerActions;
            _temp_3.gotStunned = int(_temp_3.gotStunned) + 1;
         }
         _loc1_ = get_player().reduceDamage(_loc1_,this,_loc2_);
         get_player().takeDamage(_loc1_,true);
      }
      
      public function psiAssault() : void
      {
         var _loc1_:Number = (get_inte() / 10 + Utils.rand(get_inte() / 10) - get_player().get_inte() / 10) * (1 + get_player().get_lib100() / 200);
         cooldowns.psiAssault = 3;
         _loc1_ *= (rageMod + 1) / 2;
         outputText("阿克巴尔停顿了片刻，当他闭上眼睛时，时间似乎变慢了。当他再次睁开眼，你只能看到他那翠绿色的瞳孔在黑色的虚空中闪烁。尖锐的尖叫声在你的脑海中回荡，而阿克巴尔那舒缓的声音却不知为何清晰地传了过来。");
         outputText("\n[say: 向你的神跪拜吧。]");
         outputText("\n你感到胸口发闷，呼吸变得困难。");
         if(get_player().hasStatusEffect(StatusEffects.TrueWhispered))
         {
            get_player().createStatusEffect(StatusEffects.Whispered,0,0,0,0);
         }
         else
         {
            get_player().createStatusEffect(StatusEffects.TrueWhispered,0,1,0,0);
         }
         get_player().takeLustDamage(_loc1_,true);
      }
      
      override public function performCombatAction() : void
      {
         if(int(cooldowns.psiAssault) > 0)
         {
            var _temp_1:* = cooldowns;
            _temp_1.psiAssault = int(_temp_1.psiAssault) - 1;
         }
         if(int(cooldowns.terraFire) > 0)
         {
            var _temp_2:* = cooldowns;
            _temp_2.terraFire = int(_temp_2.terraFire) - 1;
         }
         if(int(cooldowns.swoop) > 0)
         {
            var _temp_3:* = cooldowns;
            _temp_3.swoop = int(_temp_3.swoop) - 1;
         }
         var _loc1_:Boolean = true;
         var _loc2_:Number = 1;
         var _loc3_:Boolean = true;
         var _loc4_:Number = 1;
         var _loc5_:Boolean = true;
         var _loc6_:Number = 1;
         var _loc7_:Boolean = int(cooldowns.terraFire) <= 0 && !(hasStatusEffect(StatusEffects.AkbalFireUsed) && get_player().canFly());
         var _loc8_:Number = 1;
         var _loc9_:Boolean = int(cooldowns.psiAssault) <= 0;
         var _loc10_:Number = 1;
         var _loc11_:Boolean = false;
         var _loc12_:Number = 1000;
         var _loc13_:Boolean = int(cooldowns.swoop) <= 0 && isFlying;
         var _loc14_:Number = 1;
         var _loc15_:Boolean = !hasStatusEffect(StatusEffects.AkbalHealUsed) && (HPRatio() < 0.5 || get_lust100() > 70);
         var _loc16_:Number = 1000;
         if(FlagDict_Impl_.arrayReadInt(get_flags(),2716) < 8)
         {
            if(FlagDict_Impl_.arrayReadInt(get_flags(),2716) >= 5)
            {
               if(int(playerActions.gotStunned) == 0)
               {
                  _loc2_ = Math.max(0,1 - Number(playerActions.attemptStunned) / 3);
               }
               _loc6_ = int(playerActions.dodge);
               _loc10_ = get_player().hasStatusEffect(StatusEffects.TrueWhispered) ? 1 : 2;
               _loc11_ = !isFlying && hasStatusEffect(StatusEffects.AkbalHealUsed) && HPRatio() < 0.3;
               _loc15_ = !hasStatusEffect(StatusEffects.AkbalHealUsed) && (HPRatio() < 0.4 || get_lust100() > 70);
            }
            else
            {
               if(!hasStatusEffect(StatusEffects.AkbalFireUsed) && hasFatigue(20,FATIGUE_MAGICAL))
               {
                  terraFire();
                  return;
               }
               if(!get_player().hasStatusEffect(StatusEffects.TrueWhispered) && hasFatigue(10,FATIGUE_MAGICAL) && int(cooldowns.psiAssault) <= 0)
               {
                  psiAssault();
                  return;
               }
               if(int(playerActions.dodge) >= 4 && hasFatigue(10,FATIGUE_MAGICAL))
               {
                  fireBreath();
                  return;
               }
               if(int(playerActions.gotStunned) == 0)
               {
                  _loc2_ = Math.max(0,1 - Number(playerActions.attemptStunned) / 3);
                  _loc10_ = Math.max(0.2,get_player().get_lust100() / 25 - 0.7);
               }
               _loc6_ = int(playerActions.dodge);
               _loc11_ = !isFlying && hasStatusEffect(StatusEffects.AkbalHealUsed) && HPRatio() < 0.4;
               _loc15_ = !hasStatusEffect(StatusEffects.AkbalHealUsed) && (HPRatio() < 0.3 || get_lust100() > 70);
               if(_loc13_)
               {
                  _loc2_ = 0.1;
                  _loc4_ = 0.1;
               }
            }
         }
         var _loc17_:MonsterAI = new MonsterAI();
         _loc17_.add(punch,_loc2_,_loc1_,0,FATIGUE_NONE,CombatRange.Melee);
         _loc17_.add(claw,_loc4_,_loc3_,0,FATIGUE_NONE,CombatRange.Melee);
         _loc17_.add(terraFire,_loc8_,_loc7_,20,FATIGUE_MAGICAL,CombatRange.Ranged);
         _loc17_.add(fireBreath,_loc6_,_loc5_,10,FATIGUE_MAGICAL,CombatRange.Ranged);
         _loc17_.add(psiAssault,_loc10_,_loc9_,10,FATIGUE_MAGICAL,CombatRange.Omni);
         _loc17_.add(superHeal,_loc16_,_loc15_,0,FATIGUE_NONE,CombatRange.Self);
         _loc17_.add(flyUp,_loc12_,_loc11_,10,FATIGUE_PHYSICAL,CombatRange.Self);
         _loc17_.add(swoop,_loc14_,_loc13_,15,FATIGUE_PHYSICAL,CombatRange.FlyingMelee);
         _loc17_.exec();
      }
      
      override public function handleDamaged(param1:Number, param2:Boolean = true) : Number
      {
         if(get_game().combat.damageType == "PhysicalM" || get_game().combat.damageType == "MagicalM")
         {
            var _temp_1:* = playerActions;
            _temp_1.melee = int(_temp_1.melee) + 1;
         }
         if(get_game().combat.damageType == "PhysicalR" || get_game().combat.damageType == "MagicalR")
         {
            var _temp_2:* = playerActions;
            _temp_2.ranged = int(_temp_2.ranged) + 1;
         }
         if(get_game().combat.damageType == "MagicalM" || get_game().combat.damageType == "MagicalR")
         {
            var _temp_3:* = playerActions;
            _temp_3.magic = int(_temp_3.magic) + 1;
         }
         return param1;
      }
      
      public function flyUp() : void
      {
         outputText("随着伤势不断加重，阿克巴尔皱起了眉头，他突然跃入空中，凭借强壮的翅膀悬停在半空。");
         outputText("[pg]他保持着谨慎的距离，居高临下地瞪着你，眼中燃烧着怒火。");
         rageMod += 0.3;
         fly();
         createStatusEffect(StatusEffects.PermaFlyStatus,0,0,0,0);
      }
      
      public function fireBreath() : void
      {
         var _loc1_:Number = get_player().reduceDamage((get_inte() + Utils.rand(get_inte() / 2)) * rageMod,this,100);
         outputText("阿克巴尔发出一声低沉而凶猛的咆哮，从喉咙里喷出如洪流般的翡翠火焰。\n");
         var _loc2_:Array = ["你险之又险地避开了阿克巴尔的火焰！","你以极快的速度躲开了阿克巴尔的火焰！","你灵巧地避开了阿克巴尔的吐息。"];
         var _loc3_:Array = _loc2_;
         var _loc4_:Array = ["[SPEED]" + _loc3_[Utils.rand(int(_loc3_.length))],"[EVADE]利用你闪避攻击的技巧，你预判并侧身躲开了阿克巴尔的吐息。","[MISDIRECTION]运用拉斐尔的教导，你预判并侧身躲开了阿克巴尔的吐息。","[FLEXIBILITY]凭借你猫娘般的敏捷，你扭动身体避开了阿克巴尔的吐息。","[UNHANDLED]你成功躲开了阿克巴尔的火焰吐息。"];
         if(!playerAvoidDamage(new AvoidDamageParameters(true,false,false,null,null,null,null,null),_loc4_))
         {
            outputText("当火焰吞噬你时，你的血肉起泡并开裂。");
            get_game().combat.monsterDamageType = "Fire";
            get_player().takeDamage(_loc1_,true);
         }
         outputText("\n他烧焦的地面依然火光冲天！你现在闪避的空间变小了。");
         if(get_player().hasStatusEffect(StatusEffects.AkbalFlameDebuff))
         {
            get_player().addStatusValue(StatusEffects.AkbalFlameDebuff,1,1);
         }
         else
         {
            get_player().createStatusEffect(StatusEffects.AkbalFlameDebuff,1,0,0,0);
         }
         playerActions.dodge = 0;
      }
      
      override public function eAttack() : void
      {
         if(Utils.rand(2) == 0)
         {
            punch();
         }
         else
         {
            claw();
         }
      }
      
      override public function defeated(param1:Boolean) : void
      {
         get_game().forest.akbalScene.akbalQuestConclusionWin();
      }
      
      public function claw() : void
      {
         var _loc1_:Number = (get_str() + get_weaponAttack()) * rageMod;
         var _loc2_:Number = 0;
         set_weaponName("claws");
         set_weaponVerb("claw");
         var _loc3_:AvoidDamageParameters = new AvoidDamageParameters(true,true,true,null,true,null,null,null);
         outputText("阿克巴尔那如爪子般的指甲闪烁着绿光，他向前跃起，试图抓向你。\n");
         if(playerAvoidDamage(_loc3_))
         {
            var _temp_1:* = playerActions;
            _temp_1.dodge = int(_temp_1.dodge) + 1;
            return;
         }
         outputText("你还没来得及反应，他的爪子就撕裂了你。");
         if(Utils.rand(2) == 0)
         {
            get_player().bleed(this,1 + Utils.rand(4),1 + Utils.rand(2));
         }
         _loc1_ = get_player().reduceDamage(_loc1_,this,_loc2_);
         get_player().takeDamage(_loc1_,true);
      }
      
      override public function chanceToHit(param1:Creature = undefined) : Number
      {
         var _loc2_:Number = 95;
         return _loc2_ - FlagDict_Impl_.arrayReadInt(get_flags(),2716) * 2;
      }
   }
}

