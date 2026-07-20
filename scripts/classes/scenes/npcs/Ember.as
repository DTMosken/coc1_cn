package classes.scenes.npcs
{
   import classes.Appearance;
   import classes.CoC;
   import classes.CockTypesEnum;
   import classes.Creature;
   import classes.Monster;
   import classes.PerkLib;
   import classes.Player;
   import classes.StatusEffects;
   import classes._FlagDict.FlagDict_Impl_;
   import classes.globalFlags.KFLAGS;
   import classes.internals.ChainedDrop;
   import classes.internals.MonsterAI;
   import classes.internals.Utils;
   import classes.items.UseableLib;
   import classes.scenes.combat.AvoidDamageParameters;
   import classes.scenes.combat.CombatRange;
   import flash.Boot;
   import haxe.IMap;
   
   public class Ember extends Monster
   {
      
      public function Ember()
      {
         if(Boot.skip_constructor)
         {
            return;
         }
         super();
         set_a(" ");
         set_short("Ember");
         imageName = "ember";
         set_long("你目前正在和" + (littleEmber() ? "小龙" + emberMF("男孩","女孩") : "龙") + "烬进行一场“战斗”，这只是一场打闹。至少，本来是这么打算的。但看着[Ember ey]在地上甩动着[Ember eir]尾巴，张牙舞爪、凶相毕露的样子，让你不禁有些怀疑。");
         set_race("Dragon");
         pronoun1 = get_game().emberScene.emberMF("他","她");
         pronoun2 = get_game().emberScene.emberMF("他","她");
         pronoun3 = get_game().emberScene.emberMF("他的","她的");
         var _loc1_:int = FlagDict_Impl_.arrayReadInt(KFLAGS.flags,525);
         if(_loc1_ == 1 || _loc1_ == 3)
         {
            createCock(littleEmber() ? 4 : 16,2,CockTypesEnum.DRAGON);
            balls = 2;
            ballSize = littleEmber() ? 0.5 : 4;
            cumMultiplier = 3;
         }
         if(_loc1_ >= 2)
         {
            createVagina(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,544) == 0,littleEmber() ? 1 : 5,littleEmber() ? 0 : 2);
            createBreastRow(Appearance.breastCupInverse(littleEmber() ? (FlagDict_Impl_.arrayReadInt(get_flags(),531) == 0 ? "A" : "flat") : "F"));
         }
         else
         {
            createBreastRow(Appearance.breastCupInverse("flat"));
         }
         var _loc2_:int = littleEmber() ? 0 : 2;
         ass.analLooseness = _loc2_;
         ass.analWetness = 0;
         set_tallness(littleEmber() ? 52 : Utils.rand(8) + 70);
         var _loc3_:Number = littleEmber() ? 0 : 8;
         hips.rating = _loc3_;
         var _loc4_:Number = littleEmber() ? 2 : 8;
         butt.rating = _loc4_;
         skin.tone = "red";
         hair.color = "black";
         hair.length = 15;
         horns.type = 4;
         horns.value = 4;
         wings.type = 11;
         tail.type = 14;
         initStrTouSpeInte(75 + Math.floor(get_game().emberScene.emberSparIntensity() / 3),75 + Math.floor(get_game().emberScene.emberSparIntensity() / 3),75 + Math.floor(get_game().emberScene.emberSparIntensity() / 3),75 + Math.floor(get_game().emberScene.emberSparIntensity() / 3));
         initLibSensCor(50,35,FlagDict_Impl_.arrayReadInt(KFLAGS.flags,527));
         set_weaponName("claws");
         set_weaponVerb("claw");
         set_weaponAttack(30);
         set_armorName("scales");
         set_armorDef(40);
         bonusHP = 550;
         bonusLust = 0;
         set_lust(20);
         lustVuln = 0.25;
         temperment = 3;
         level = 15;
         set_gems(0);
         set_drop(new ChainedDrop().add(get_useables().D_SCALE,0.2));
         if(get_game().emberScene.emberSparIntensity() < 100)
         {
            bonusHP += get_game().emberScene.emberSparIntensity() * 20;
            bonusLust += get_game().emberScene.emberSparIntensity();
            set_weaponAttack(get_weaponAttack() + get_game().emberScene.emberSparIntensity() * 2);
            if(get_game().emberScene.emberSparIntensity() < 50)
            {
               level += Math.floor(get_game().emberScene.emberSparIntensity() / 5);
            }
            else
            {
               level += 10 + Math.floor((get_game().emberScene.emberSparIntensity() - 50) / 10);
            }
         }
         else
         {
            bonusHP += 2000;
            bonusLust += 100;
            set_weaponAttack(get_weaponAttack() + 200);
            level += 15;
         }
         checkMonster();
      }
      
      override public function won(param1:Boolean, param2:Boolean = false) : void
      {
         get_game().emberScene.loseToEmberSpar();
      }
      
      override public function runSuccess() : void
      {
         if(get_player().hasPerk(PerkLib.Runner))
         {
            outputText("利用你奔跑的技巧，你");
         }
         else
         {
            outputText("你");
         }
         outputText("轻松地把这条龙甩在了后面，对方开始对你破口大骂。[say: 搞什么鬼，[name]，你这个胆小鬼；你害怕得连惩罚都不敢接受了吗？]");
         outputText("[pg]你不甘示弱地回嘴，嘲笑她抓不到你，而她只能在远处气得七窍生烟。");
         get_game().combat.doRunAway();
      }
      
      override public function runFail() : void
      {
         outputText("尽管你做出了一些令人惊叹的躲闪动作，" + get_game().emberScene.emberMF("他","她") + "还是抓住了你，将你扑倒在地。[pg]");
         get_game().combat.startMonsterTurn();
      }
      
      override public function runCheck() : void
      {
         outputText("你起飞了");
         if(!get_player().canFly())
         {
            outputText("跑着");
         }
         else
         {
            outputText("，拼命地拍打着翅膀");
         }
         outputText("，而烬也沉浸在这一刻，紧追不舍。");
         if(runChance())
         {
            runSuccess();
         }
         else
         {
            runFail();
         }
      }
      
      override public function performCombatAction() : void
      {
         var _loc1_:MonsterAI = new MonsterAI();
         if(get_lust() >= maxLust() * 0.6)
         {
            emberReactsToLustiness();
            return;
         }
         if(hasStatusEffect(StatusEffects.StunCooldown))
         {
            addStatusValue(StatusEffects.StunCooldown,1,-1);
            if(statusEffectv1(StatusEffects.StunCooldown) <= 0)
            {
               removeStatusEffect(StatusEffects.StunCooldown);
            }
         }
         _loc1_.add(dragonFarce,0.75,get_game().emberScene.emberSparIntensity() >= 15 && hasStatusEffect(StatusEffects.StunCooldown),10,FATIGUE_PHYSICAL,CombatRange.Ranged);
         _loc1_.add(embersSupahSpecialDragonBreath,0.75,get_game().emberScene.emberSparIntensity() >= 5,15,FATIGUE_PHYSICAL,CombatRange.Ranged);
         _loc1_.add(emberTailSlap,1,true,5,FATIGUE_PHYSICAL,CombatRange.ChargingMelee);
         _loc1_.add(emberAttack,1,true,0,FATIGUE_NONE,CombatRange.FlyingMelee);
         _loc1_.exec();
      }
      
      public function littleEmber() : Boolean
      {
         return get_game().emberScene.littleEmber();
      }
      
      public function embersSupahSpecialDragonBreath() : void
      {
         var _loc1_:Number = NaN;
         if(hasStatusEffect(StatusEffects.Blind) && Utils.rand(2) == 0)
         {
            outputText("这头被致盲的龙在你绕着地形冲刺时艰难地追踪着你；看准机会，你绕到[Ember eir]侧面，躲在[Ember em]附近的一块平坦大石头后面，并用一块小石头砸向" + emberMF(littleEmber() ? "小男孩" : "他",littleEmber() ? "小女孩" : "她") + "。当这头龙将魔法烈焰转向你，却只打在石头上并在[Ember eir]脸上爆炸时，那声尖叫真是令人满足。");
            get_game().combat.doDamage(50,true,true);
         }
         else
         {
            outputText("烬深吸一口气，然后[Ember eir]张开下巴，释放出火焰、冰霜和闪电的洪流；这些华丽的攻击并非物理性质，而是魔法，在飞向你时失去了凝聚力，融合成了原始能量的火柱。");
            if(Boolean(combatAvoidDamage(new AvoidDamageParameters(true,false,false,null,null,null,null,null)).attackFailed))
            {
               outputText("真是千钧一发，但你还是在最后一刻设法扑向了一旁。幸运的是，能量在周围旋转并撕裂土壤，这让烬在恢复视力之前无法发现你的逃跑，而你已经准备好继续战斗了。");
            }
            else
            {
               outputText("当这致命的组合席卷你时，那种痛苦是难以言喻的。你能忍受下来简直是个奇迹，甚至连烬看到你还站着都显得很惊讶。");
               get_game().combat.monsterDamageType = "Fire";
               _loc1_ = 100 + Utils.rand(100) + get_game().emberScene.emberSparIntensity() * 4 * (1 + get_player().newGamePlusMod() * 0.3);
               _loc1_ = get_player().reduceDamage(_loc1_,this);
               get_player().takeDamage(_loc1_,true);
            }
         }
      }
      
      public function emberTailSlap() : void
      {
         var _loc1_:int = 0;
         if(hasStatusEffect(StatusEffects.Blind))
         {
            outputText(get_capitalA() + Utils.cnName(get_short()) + "盲目的一记尾击完全没有打中你！");
            return;
         }
         outputText("烬突然用脚跟旋转，在[Ember em]身后展开的长尾巴像鞭子一样猛烈抽打。当它在空中向你呼啸而来时，你的注意力集中在突然从其尖端突出的那排尖刺上！");
         if(combatAvoidDamage(new AvoidDamageParameters(true,false,false,null,null,null,null,null)).attackFailed || Utils.rand(2) == 0)
         {
            outputText("你在最后一刻");
            if(Utils.rand(2) == 0)
            {
               outputText("低头躲过");
            }
            else
            {
               outputText("跳过");
            }
            outputText("了尾巴，导致烬失去了对[Ember eir]自身动量的控制并踉跄了一下。");
         }
         else
         {
            _loc1_ = int(get_str() + get_weaponAttack() + 100 + get_game().emberScene.emberSparIntensity() * 2);
            outputText("尾巴以碎骨般的力量猛击你，将你重重地击倒在地，同时尖刺也恶毒地刺伤了你。你在痛苦和震惊中喘息着，但还是设法挣扎着重新站了起来。");
            _loc1_ = get_player().reduceDamage(_loc1_,this);
            get_player().takeDamage(_loc1_,true);
         }
      }
      
      public function emberReactsToLustiness() : void
      {
         outputText("这只龙" + (littleEmber() ? "发出可爱的呜咽声" : "呻吟着") + "，身体轻轻地左右摇晃，眼神迷离" + (littleEmber() ? "" : "，舌头耷拉着") + "，似乎在期待着亲密的性爱……但随后，令你惊讶的是，[Ember ey]明显地摇了摇头，重新振作起来，皱着眉头看着你。");
         outputText("[pg][say: 你、你以为你在干什么！？我可不是什么普通的怪物！别以为你能用色诱来逃避战斗！]");
         outputText("[pg]尽管烬最初表现得那样；但你意识到，烬离[Ember eir]的兴奋巅峰还有一段距离。这只龙气呼呼地飞走了，对你竟然堕落到用这种方式战斗感到恼火。");
         if(get_player().lib >= 50)
         {
            outputText("真无聊。");
         }
         set_gems(0);
         XP = 0;
         set_HP(0);
         get_game().combat.cleanupAfterCombat();
      }
      
      public function emberMF(param1:String, param2:String) : String
      {
         return get_game().emberScene.emberMF(param1,param2);
      }
      
      public function emberAttack() : void
      {
         var _loc1_:int = 0;
         outputText("伴随着一声低吼，这只" + (littleEmber() ? "小" : "") + "龙张开五指，凶猛地挥出一记爪击，[Ember eir]的利爪蓄势待发，准备撕裂你的血肉。");
         if(hasStatusEffect(StatusEffects.Blind) && Utils.rand(2) == 0)
         {
            outputText(get_capitalA() + Utils.cnName(get_short()) + "的盲目攻击完全没有打中你！");
         }
         else if(Boolean(combatAvoidDamage(new AvoidDamageParameters(true,true,false,null,null,null,null,null)).attackFailed))
         {
            outputText("你在最后一秒闪身躲开，烬的爪子从你身旁呼啸而过。");
         }
         else
         {
            _loc1_ = get_player().reduceDamage(get_str() + get_weaponAttack(),this);
            if(_loc1_ <= 0)
            {
               outputText("烬的爪子在你的[armor]上刮出刺耳的声音，但并没有造成伤害。");
            }
            else
            {
               outputText("烬的爪子撕裂了你，留下了刺痛的伤口。");
               get_player().takeDamage(_loc1_,true);
            }
         }
      }
      
      public function dragonFarce() : void
      {
         var _loc1_:int = 0;
         var _loc2_:Number = NaN;
         outputText("烬露出[Ember eir]牙齿，发出一声震耳欲聋的咆哮；一股冲击波径直向你袭来！");
         if(Boolean(combatAvoidDamage(new AvoidDamageParameters(true,false,false,null,null,null,null,null)).attackFailed))
         {
            outputText("你迅速设法跳开，敬畏地看着冲击波在你刚才站立的地面上凿出一个大坑。");
         }
         else
         {
            outputText("无论你怎么努力，似乎都无法保护自己；冲击波像石头一样击中你，将你击倒在地。");
            if(get_player().stun(0,get_game().emberScene.emberSparIntensity() >= 30 ? 33 : 0))
            {
               outputText("你的头晕目眩——你需要一点时间才能恢复平衡。");
            }
            _loc1_ = 4;
            if(get_game().emberScene.emberSparIntensity() >= 30)
            {
               _loc1_--;
            }
            if(get_game().emberScene.emberSparIntensity() >= 45)
            {
               _loc1_--;
            }
            createStatusEffect(StatusEffects.StunCooldown,_loc1_,0,0,0);
            _loc2_ = 10 + Utils.rand(10) + get_game().emberScene.emberSparIntensity() / 2;
            get_game().combat.monsterDamageType = "Fire";
            get_player().takeDamage(_loc2_,true);
         }
      }
      
      override public function defeated(param1:Boolean) : void
      {
         if(param1)
         {
            get_game().emberScene.beatEmberSpar();
         }
         else
         {
            emberReactsToLustiness();
         }
      }
   }
}

