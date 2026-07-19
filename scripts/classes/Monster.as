package classes
{
   import classes._FlagDict.FlagDict_Impl_;
   import classes.globalFlags.KGAMECLASS;
   import classes.internals.ChainedDrop;
   import classes.internals.RandomChoice;
   import classes.internals.Utils;
   import classes.internals.WeightedChoice;
   import classes.items.Armor;
   import classes.items.ArmorLib;
   import classes.items.ConsumableLib;
   import classes.items.JewelryLib;
   import classes.items.ShieldLib;
   import classes.items.UndergarmentLib;
   import classes.items.UseableLib;
   import classes.items.Weapon;
   import classes.items.WeaponLib;
   import classes.scenes.areas.forest.AkbalUnsealed;
   import classes.scenes.areas.volcanicCrag.VolcanicGolem;
   import classes.scenes.combat.AvoidDamageParameters;
   import classes.scenes.combat.Combat;
   import classes.scenes.combat.CombatAttackBuilder;
   import classes.scenes.combat.CombatDistance;
   import classes.scenes.dungeons.factory.SecretarialSuccubus;
   import classes.scenes.quests.urtaQuest.MilkySuccubus;
   import classes.statusEffects.combat.BasiliskSlowDebuff;
   import classes.statusEffects.combat.BrutalBlowsDebuff;
   import classes.statusEffects.combat.CombatBuff;
   import classes.statusEffects.combat.ConstrictedDebuff;
   import classes.statusEffects.combat.SeverTendonsDebuff;
   import flash.Boot;
   import haxe.IMap;
   
   public class Monster extends Creature
   {
      
      public static var TEMPERMENT_AVOID_GRAPPLES:int = 0;
      
      public static var TEMPERMENT_LUSTY_GRAPPLES:int = 1;
      
      public static var TEMPERMENT_RANDOM_GRAPPLES:int = 2;
      
      public static var TEMPERMENT_LOVE_GRAPPLES:int = 3;
      
      public var unitHP:Number;
      
      public var unitAmount:Number;
      
      public var tookAction:Boolean;
      
      public var temporary:Boolean;
      
      public var temperment:Number;
      
      public var tagList:Array;
      
      public var special3:Function;
      
      public var special2:Function;
      
      public var special1:Function;
      
      public var scaleTou:int;
      
      public var scaleStr:int;
      
      public var scaleSpe:int;
      
      public var scaleInte:int;
      
      public var pronoun3:String;
      
      public var pronoun2:String;
      
      public var pronoun1:String;
      
      public var prefersRanged:Boolean;
      
      public var onWon:Function;
      
      public var onPcRunAttempt:Function;
      
      public var onDefeated:Function;
      
      public var normalAttackAvoid:AvoidDamageParameters;
      
      public var neverAct:Boolean;
      
      public var moveCooldown:int;
      
      public var lustVuln:Number;
      
      public var initsCalled:Object;
      
      public var imageName:String;
      
      public var ignoreLust:Boolean;
      
      public var ignoreHP:Boolean;
      
      public var currTarget:int;
      
      public var checkError:String;
      
      public var canBlock:Boolean;
      
      public var bonusLust:Number;
      
      public var bonusHP:Number;
      
      public var _possessive:String;
      
      public var _plural:Boolean;
      
      public var _long:String;
      
      public var _drop:RandomChoice;
      
      public var _checkCalled:Boolean;
      
      public var NO_DROP:WeightedChoice;
      
      public function Monster()
      {
         if(Boot.skip_constructor)
         {
            return;
         }
         moveCooldown = 0;
         onPcRunAttempt = null;
         onWon = null;
         onDefeated = null;
         normalAttackAvoid = new AvoidDamageParameters(true,true,true,true,true,null,null,null);
         NO_DROP = new WeightedChoice();
         initsCalled = {
            "a":false,
            "short":false,
            "long":false,
            "genitals":false,
            "breasts":false,
            "tallness":false,
            "str_tou_spe_inte":false,
            "lib_sens_cor":false,
            "drop":false
         };
         checkError = "";
         _checkCalled = false;
         _drop = new ChainedDrop();
         _possessive = "default";
         pronoun3 = "";
         pronoun2 = "";
         pronoun1 = "";
         tagList = [];
         special3 = null;
         special2 = null;
         special1 = null;
         temperment = 0;
         lustVuln = 1;
         imageName = "";
         unitAmount = 0;
         unitHP = 0;
         _plural = false;
         _long = "<b>你遇到了一个未初始化的怪物。请将此作为bug报告</b>。";
         scaleTou = 0;
         scaleSpe = 0;
         scaleInte = 0;
         scaleStr = 0;
         canBlock = false;
         temporary = false;
         ignoreHP = false;
         ignoreLust = false;
         prefersRanged = false;
         bonusLust = 0;
         bonusHP = 0;
         tookAction = false;
         neverAct = false;
         currTarget = 0;
         super();
      }
      
      public static function showStatDown(param1:String) : void
      {
         KGAMECLASS.kGAMECLASS.mainView.statsView.showStatDown(param1);
      }
      
      final public function won_(param1:Boolean, param2:Boolean = false) : void
      {
         if(onWon != null)
         {
            onWon(param1,param2);
         }
         else
         {
            won(param1,param2);
         }
      }
      
      public function won(param1:Boolean, param2:Boolean = false) : void
      {
         clearOutput();
         if(param1)
         {
            get_player().set_HP(1);
            outputText("你的伤势过重，无法承受，你失去了意识。");
         }
         else
         {
            outputText("你的欲望达到了无法控制的地步，最终你竟然公然自慰起来。");
            outputText("[pg]强烈的欲望与快感让你连续昏迷了几个小时。");
            get_player().set_lust(0);
         }
         get_game().set_inCombat(false);
         get_game().combat.clearStatuses();
         var _loc3_:int = Utils.rand(10) + 1;
         if(_loc3_ > get_player().get_gems())
         {
            _loc3_ = get_player().get_gems();
         }
         outputText("[pg]你大概会在八小时后醒来，并且丢失了 " + _loc3_ + " 颗宝石。");
         var _loc4_:Player = get_player();
         _loc4_.set_gems(_loc4_.get_gems() - _loc3_);
         get_player().sleeping = true;
         get_game().output.doNext(get_game().camp.returnToCampUseEightHours);
      }
      
      override public function validate() : String
      {
         var _loc1_:String = "";
         if(!isFullyInit())
         {
            _loc1_ += "缺失阶段: " + missingInits() + ". ";
         }
         if(get_game().get_modeSettings().scaling)
         {
            scaleToLevel();
         }
         set_HP(maxHP());
         XP = totalXP();
         _loc1_ += super.validate();
         return _loc1_ + Utils.validateNonNegativeNumberFields(this,"Monster.validate",["lustVuln","temperment"]);
      }
      
      override public function updateBleed() : void
      {
         var _loc3_:Number = NaN;
         var _loc1_:Number = 0;
         var _loc2_:int = 0;
         while(_loc2_ < int(statusEffects.length))
         {
            if(statusEffects[_loc2_].get_stype().get_id() == "Izma Bleed")
            {
               _temp_1.value1 -= 1;
               _loc1_ += statusEffects[_loc2_].value1;
               if(statusEffects[_loc2_].value1 <= 0)
               {
                  statusEffects.splice(_loc2_,1);
               }
            }
            _loc2_++;
         }
         if(_loc1_ <= 0)
         {
            get_game().outputText("你在" + get_themonster() + "身上留下的伤口不再流那么多血了。[pg]");
         }
         else
         {
            _loc3_ = bleedDamage();
            _loc3_ = get_game().combat.doDamage(_loc3_);
            if(get_plural())
            {
               get_game().outputText(get_Themonster() + "的伤口参差不齐，鲜血直流。<b>(<font color=\"" + get_game().mainViewManager.colorHpMinus() + "\">" + _loc3_ + "</font>)</b>[pg]");
            }
            else
            {
               get_game().outputText(get_Themonster() + " 的伤口参差不齐，鲜血直流。<b>(<font color=\"" + get_game().mainViewManager.colorHpMinus() + "\">" + _loc3_ + "</font>)</b>[pg]");
            }
         }
      }
      
      public function totalXP(param1:Number = -1) : Number
      {
         var _loc2_:Number = 1;
         _loc2_ += get_game().player.perkv1(PerkLib.AscensionWisdom) * 0.1;
         if(param1 == -1)
         {
            param1 = get_game().player.potentialLevel();
         }
         var _loc3_:Number = param1 - level;
         if(_loc3_ <= 2)
         {
            _loc3_ = 0;
         }
         else
         {
            _loc3_ -= 2;
         }
         if(_loc3_ > 4)
         {
            _loc3_ = 4;
         }
         _loc3_ = (5 - _loc3_) * 20 / 100;
         if(param1 - level > 10)
         {
            return 1;
         }
         return Math.round(additionalXP + (baseXP() + bonusXP()) * _loc3_ * _loc2_);
      }
      
      public function teased(param1:Number) : void
      {
         outputDefaultTeaseReaction(param1);
         if(param1 > 0)
         {
            if(hasStatusEffect(StatusEffects.ImpUber))
            {
               outputText("\n后面的小恶魔在施法时绊了一下，你的表演打断了他们的施法，他们的遮阴布明显地撑起了帐篷。其中一个小恶魔自发地高潮了，他的法术反噬了。他倒在地上，虚弱地抽搐着，一滩越来越大的白色液体包围了他被打败的身体。");
               set_HP(get_HP() - bonusHP * 0.05);
               set_lust(get_lust() - 15);
               removeStatusEffect(StatusEffects.ImpUber);
            }
         }
         applyTease(param1);
      }
      
      public function struggle() : void
      {
      }
      
      final public function statScreenRefresh() : void
      {
         get_game().output.statScreenRefresh();
      }
      
      public function shouldWait() : Boolean
      {
         return get_fatigue() >= maxFatigue() * 0.85;
      }
      
      public function shouldMove(param1:CombatDistance, param2:Boolean = false) : Boolean
      {
         if(isFlying || moveCooldown != 0 || hasPerk(PerkLib.Immovable))
         {
            return false;
         }
         switch(param1.index)
         {
            case 0:
               return !prefersRanged;
            case 1:
               if(prefersRanged)
               {
                  if(initiativeValue() <= 15)
                  {
                     return param2;
                  }
                  return true;
               }
               return false;
               break;
            default:
               return;
         }
      }
      
      override public function set_tallness(param1:Number) : Number
      {
         initsCalled.tallness = true;
         return Number(super.set_tallness(param1));
      }
      
      override public function set_short(param1:String) : String
      {
         initsCalled.short = true;
         return super.set_short(param1);
      }
      
      public function set_possessive(param1:String) : String
      {
         return _possessive = param1;
      }
      
      public function set_plural(param1:Boolean) : Boolean
      {
         return _plural = param1;
      }
      
      override public function set_lust(param1:Number) : Number
      {
         super.set_lust(param1);
         get_game().mainView.monsterStatsView.refreshStats(get_game());
         return param1;
      }
      
      public function set_long(param1:String) : String
      {
         initsCalled.long = true;
         return _long = param1;
      }
      
      public function set_initedStrTouSpeInte(param1:Boolean) : Boolean
      {
         initsCalled.str_tou_spe_inte = param1;
         return param1;
      }
      
      public function set_initedLibSensCor(param1:Boolean) : Boolean
      {
         initsCalled.lib_sens_cor = param1;
         return param1;
      }
      
      public function set_initedGenitals(param1:Boolean) : Boolean
      {
         initsCalled.genitals = param1;
         return param1;
      }
      
      public function set_initedDrop(param1:Boolean) : Boolean
      {
         initsCalled.drop = param1;
         return param1;
      }
      
      public function set_initedBreasts(param1:Boolean) : Boolean
      {
         initsCalled.breasts = param1;
         return param1;
      }
      
      public function set_images(param1:ImageManager) : ImageManager
      {
         return get_game().images = param1;
      }
      
      override public function set_fatigue(param1:Number) : Number
      {
         super.set_fatigue(param1);
         get_game().mainView.monsterStatsView.refreshStats(get_game());
         return param1;
      }
      
      public function set_drop(param1:RandomChoice) : RandomChoice
      {
         _drop = param1;
         set_initedDrop(true);
         return param1;
      }
      
      override public function set_a(param1:String) : String
      {
         initsCalled.a = true;
         return super.set_a(param1);
      }
      
      override public function set_HP(param1:Number) : Number
      {
         super.set_HP(param1);
         get_game().mainView.monsterStatsView.refreshStats(get_game());
         return param1;
      }
      
      public function setLoot(param1:ItemType) : void
      {
         set_drop(new WeightedChoice(param1,1));
      }
      
      public function scaleToLevel(param1:int = 0) : void
      {
         if(param1 == 0)
         {
            param1 = int(get_player().level - level);
         }
         if(param1 <= 0)
         {
            return;
         }
         scaleStr = int(get_str() * param1 * 0.025);
         scaleInte = int(get_inte() * param1 * 0.05);
         scaleSpe = int(get_spe() * param1 * 0.05);
         scaleTou = int(get_tou() * param1 * 0.05);
         dynStats(DynStat.Str(scaleStr),DynStat.NoScale);
         dynStats(DynStat.Inte(scaleInte),DynStat.NoScale);
         dynStats(DynStat.Spe(scaleSpe),DynStat.NoScale);
         dynStats(DynStat.Tou(scaleTou),DynStat.NoScale);
         set_weaponAttack(get_weaponAttack() * (1 + param1 * 0.025));
         bonusHP += maxHP() * (1 + param1 * 0.0125);
         level = get_player().level;
         set_HP(maxHP());
      }
      
      public function runSuccess() : void
      {
         if(get_player().canFly())
         {
            outputText("[Themonster]抓不到你。");
         }
         if(get_player().hasPerk(PerkLib.Runner))
         {
            if(get_player().tail.type == 15 && get_player().ears.type == 11)
            {
               outputText("得益于你的奔跑技巧，你鼓足干劲猛地起跳，然后张开双臂，疯狂地挥舞尾巴；你的对手拼尽全力对你穷追不舍，但当看到你那抽搐的尾巴慢慢将你推向几米高的空中时，[monster.he]停下脚步，呆呆地盯着你！你用这种笨拙、颠簸的短距离飞行把[monster.him]远远甩在了后面。");
            }
            else
            {
               outputText("多亏了你奔跑的天赋，你成功逃脱了。");
            }
         }
         else
         {
            outputText("[Themonster]迅速消失在你身后不断变化的风景中。");
         }
         outputText("[pg]");
         onPcRunSuccess();
         get_game().combat.doRunAway();
      }
      
      public function runFail() : void
      {
         if(get_player().canFly())
         {
            outputText("[Themonster]成功抓住了你的[legs]，在你飞走之前把你拖回了地面！");
         }
         else if(get_player().tail.type == 15 && get_player().ears.type == 11 && get_player().hasPerk(PerkLib.Runner))
         {
            outputText("你运用你的奔跑技巧，鼓足干劲跳了起来，但还没等你离地超过一英尺，你的对手就死死抓住了你，伴随着“砰”的一声闷响把你拖回了地面！");
         }
         else if(get_player().balls > 0 && get_player().ballSize >= 24)
         {
            if(get_player().ballSize < 48)
            {
               outputText("由于你的[balls]在你身下沉甸甸地晃荡着，逃跑变得比想象中困难得多。");
            }
            else
            {
               outputText("由于你的[balls]在地上拖拽着，逃跑变得比想象中困难得多。");
            }
         }
         else if(get_player().biggestTitSize() >= 66)
         {
            if(get_player().hips.rating >= 20)
            {
               outputText("你的[chest]几乎拖在地上，而你的[hips]则在左右摇摆，");
               if(get_player().butt.rating >= 20)
               {
                  outputText("导致你" + get_player().skin.tone + get_player().buttDescript() + "上的肥肉剧烈摇晃，");
               }
               outputText("使你的身体失去平衡，无法快速移动以逃脱。");
            }
            else if(get_player().butt.rating >= 20)
            {
               outputText("你的[chest]几乎拖在地上，而你" + get_player().skin.tone + get_player().buttDescript() + "上的肥肉剧烈地左右摇晃，使你的身体失去平衡，无法快速移动以逃脱。");
            }
            else
            {
               outputText("你的[chest]几乎拖在地上，使你无法快速移动以逃脱。");
            }
         }
         else if(get_player().biggestTitSize() >= 35)
         {
            if(get_player().hips.rating >= 20)
            {
               outputText("你的[hips]迫使你的步态微微左右摇晃，这导致你[skintone]的");
               if(get_player().butt.rating >= 20)
               {
                  outputText("[ass]和");
               }
               outputText("[chest]上的肥肉剧烈晃动，让你失去平衡，无法快速移动来逃跑。");
            }
            else if(get_player().butt.rating >= 20)
            {
               outputText("你的" + get_player().skin.tone + get_player().buttDescript() + "和[chest]剧烈地晃动弹跳，让你失去平衡，无法快速移动来逃跑。");
            }
            else
            {
               outputText("你的[chest]像装满乳脂的[skintone]肉袋一样左右摇晃、抖动，这股力量不断让你失去平衡，让你无法快速移动以逃脱。");
            }
         }
         else if(get_player().hips.rating >= 20)
         {
            outputText("你的[hips]沉重地左右摇摆");
            if(get_player().butt.rating >= 20)
            {
               outputText("导致你那" + get_player().skin.tone + get_player().buttDescript() + "淫荡地晃动");
            }
            outputText("并迫使你的身体陷入一种笨拙的步态，减慢了你的速度，让你无法逃脱。");
         }
         else if(get_player().butt.rating >= 20)
         {
            outputText("你的" + get_player().skin.tone + get_player().buttDescript() + "摇晃得太厉害，导致你无法快速移动来逃跑。");
         }
         else
         {
            outputText("[Themonster]紧跟在你的身后，不给你任何逃跑的机会！");
         }
         get_game().combat.startMonsterTurn();
      }
      
      public function runCheck() : void
      {
         var newRound1:Boolean;
         var _g1:Combat;
         var newRound:Boolean;
         var _g:Combat;
         if(get_player().hasStatusEffect(StatusEffects.Sealed) && get_player().statusEffectv2(StatusEffects.Sealed) == 4)
         {
            outputText("你试图逃跑，但似乎根本无法脱身。<b>你逃跑的能力被封印了，现在你白白浪费了一次攻击机会！</b>[pg]");
            get_game().combat.startMonsterTurn();
         }
         else if(get_player().get_inRut() && totalCocks() > 0)
         {
            outputText("一想到你的地盘上有另一个雄性在和你争夺所有的逼，你就怒火中烧！你绝不可能逃跑！");
            _g = get_game().combat;
            newRound = false;
            doNext(function():void
            {
               _g.combatMenu(newRound);
            });
         }
         else if(hasStatusEffect(StatusEffects.GenericRunDisabled) || get_game().urtaQuest.isUrta())
         {
            outputText("你无法逃离这场战斗！");
            _g1 = get_game().combat;
            newRound1 = false;
            doNext(function():void
            {
               _g1.combatMenu(newRound1);
            });
         }
         else if(get_game().inDungeon || get_game().inRoomedDungeon)
         {
            outputText("你被困在敌人的地盘里——无处可逃！[pg]");
            get_game().combat.startMonsterTurn();
         }
         else if(get_player().hasStatusEffect(StatusEffects.NoFlee))
         {
            outputText("你使出浑身解数试图逃跑，但还是无法脱身！[pg]");
            get_game().combat.startMonsterTurn();
         }
         else
         {
            if(get_player().canFly())
            {
               outputText("你咬紧牙关，快速拍打翅膀，腾空而起！");
            }
            else
            {
               outputText("你转身逃跑！");
            }
            if(runChance())
            {
               runSuccess();
            }
            else
            {
               runFail();
            }
         }
      }
      
      public function runChance() : Boolean
      {
         var _loc4_:* = null as Monster;
         var _loc1_:int = 0;
         var _loc2_:int = 0;
         var _loc3_:Array = get_game().monsterArray;
         while(_loc2_ < int(_loc3_.length))
         {
            _loc4_ = _loc3_[_loc2_];
            _loc2_++;
            if(_loc4_.escapeMod() > _loc1_)
            {
               _loc1_ = _loc4_.escapeMod();
            }
         }
         _loc2_ = _loc1_ + get_player().escapeMod();
         if(get_player().get_spe() <= Utils.rand(_loc2_))
         {
            if(get_player().hasPerk(PerkLib.Runner))
            {
               return Utils.rand(100) < 50;
            }
            return false;
         }
         return true;
      }
      
      public function replacesDescribeAttacked(param1:Weapon, param2:int, param3:Boolean = false) : Boolean
      {
         return false;
      }
      
      public function reduceDamageMin(param1:Number, param2:Number = 0, param3:Boolean = false, param4:Boolean = false) : int
      {
         return reduceDamage(param1,get_player(),param2,param4,false,false,true,param3);
      }
      
      public function reduceDamageMax(param1:Number, param2:Number = 0, param3:Boolean = false, param4:Boolean = false) : int
      {
         return reduceDamage(param1,get_player(),param2,param4,false,true,false,param3);
      }
      
      public function reduceDamageCombat(param1:Number, param2:Number = 0, param3:Boolean = false, param4:Boolean = false) : int
      {
         return reduceDamage(param1,get_player(),param2,param4,true,false,false,param3);
      }
      
      public function reactWrapper(param1:ReactionContext) : Boolean
      {
         if(get_player().hasStatusEffect(StatusEffects.TimeFrozen))
         {
            return true;
         }
         return react(param1);
      }
      
      public function react(param1:ReactionContext) : Boolean
      {
         return true;
      }
      
      public function postAttack(param1:int) : void
      {
         var _loc2_:Boolean = false;
         var _loc3_:Boolean = false;
         var _loc4_:Number = NaN;
         if(get_player().statusEffectv1(StatusEffects.CounterAB) == 1 && distance != CombatDistance.Distant)
         {
            get_game().combat.performRegularAttack(0);
            get_player().addStatusValue(StatusEffects.CounterAB,1,-1);
         }
         if(param1 > 0)
         {
            if(lustVuln > 0 && get_player().get_armor() == get_game().armors.BONSTRP)
            {
               if(!get_plural())
               {
                  outputText("\n" + get_Themonster() + "擦过你裸露的肌肤，然后惊讶地猛然后退，因为看到你暴露了这么多而微微脸红。");
               }
               else
               {
                  outputText("\n" + get_Themonster() + "擦过你裸露的肌肤，然后惊讶地猛然后退，因为看到你暴露了这么多而微微脸红。");
               }
               set_lust(get_lust() + 5 * lustVuln);
            }
            if(get_player().get_armor().get_id() == get_armors().GOLARMR.get_id() || get_player().hasStatusEffect(StatusEffects.TFMoltenPlate))
            {
               _loc2_ = get_player().get_armor().get_id() == get_armors().GOLARMR.get_id();
               _loc3_ = get_player().hasStatusEffect(StatusEffects.TFMoltenPlate);
               outputText("\n你的护甲对伤害做出了反应，向攻击者喷射出岩浆！");
               if(!get_plural())
               {
                  outputText("\n" + get_Themonster() + " 被岩浆烧伤了。");
               }
               else
               {
                  outputText("\n" + get_Themonster() + "被岩浆烧伤了。");
               }
               _loc4_ = 0;
               if(_loc2_)
               {
                  _loc4_ += Utils.rand(20) + 15;
               }
               if(_loc3_)
               {
                  _loc4_ += get_game().combat.combatAbilities.tfMoltenPlateCalc();
               }
               set_HP(get_HP() - _loc4_);
               outputText("<b>(<font color=\"#ff8d29\">" + _loc4_ + "</font>)</b>");
               if(_loc3_)
               {
                  outputText("\n不幸的是，岩浆也烧伤了你。");
                  get_player().takeDamage(get_game().combat.combatAbilities.tfMoltenPlateCalc("self"),true);
               }
            }
            if(get_player().get_armor().get_id() == get_armors().VINARMR.get_id() && get_armors().VINARMR.saveContent.armorStage > 2)
            {
               outputText("\n藤蔓对冲击做出了反应，立刻从其肉质的茎干中向攻击者射出恶毒的尖刺。");
               _loc4_ = reduceDamage(Utils.rand(20) + 15,get_player());
               param1 = int(get_game().combat.doDamage(_loc4_,true,true));
               if(Utils.rand(5) == 0)
               {
                  if(bleed(get_player()))
                  {
                     outputText("");
                  }
               }
            }
         }
      }
      
      public function playerWinCondition() : Object
      {
         return null;
      }
      
      public function playerLossCondition() : Object
      {
         return null;
      }
      
      final public function playerAvoidDamage(param1:AvoidDamageParameters, param2:Array = undefined) : Boolean
      {
         var _loc4_:int = 0;
         var _loc5_:* = null as String;
         var _loc3_:CombatAttackBuilder = new CombatAttackBuilder();
         _loc3_.attack = param1;
         if(param2 != null)
         {
            _loc4_ = 0;
            while(_loc4_ < int(param2.length))
            {
               _loc5_ = param2[_loc4_];
               _loc4_++;
               if(_loc5_.indexOf("[SPEED]") != -1)
               {
                  _loc3_.combatReactions.speed = StringTools.replace(_loc5_,"[SPEED]","");
               }
               if(_loc5_.indexOf("[EVADE]") != -1)
               {
                  _loc3_.combatReactions.evade = StringTools.replace(_loc5_,"[EVADE]","");
               }
               if(_loc5_.indexOf("[MISDIRECTION]") != -1)
               {
                  _loc3_.combatReactions.misdirection = StringTools.replace(_loc5_,"[MISDIRECTION]","");
               }
               if(_loc5_.indexOf("[UNHANDLED]") != -1)
               {
                  _loc3_.combatReactions.unhandled = StringTools.replace(_loc5_,"[UNHANDLED]","");
               }
               if(_loc5_.indexOf("[BLOCK]") != -1)
               {
                  _loc3_.combatReactions.block = StringTools.replace(_loc5_,"[BLOCK]","");
               }
               if(_loc5_.indexOf("[PARRY]") != -1)
               {
                  _loc3_.combatReactions.parry = StringTools.replace(_loc5_,"[PARRY]","");
               }
               if(_loc5_.indexOf("[FLEXIBILITY]") != -1)
               {
                  _loc3_.combatReactions.flexibility = StringTools.replace(_loc5_,"[FLEXIBILITY]","");
               }
               if(_loc5_.indexOf("[BLIND]") != -1)
               {
                  _loc3_.combatReactions.blind = StringTools.replace(_loc5_,"[BLIND]","");
               }
               if(_loc5_.indexOf("[COUNTER]") != -1)
               {
                  _loc3_.combatReactions.counter = StringTools.replace(_loc5_,"[COUNTER]","");
               }
            }
         }
         return !_loc3_.executeAttack().isSuccessfulHit();
      }
      
      public function performCombatAction() : void
      {
         var _loc4_:* = null as Function;
         var _loc1_:Array = [];
         var _loc2_:int = 0;
         var _loc3_:Array = [eAttack,special1,special2,special3];
         while(_loc2_ < int(_loc3_.length))
         {
            _loc4_ = _loc3_[_loc2_];
            _loc2_++;
            if(_loc4_ != null)
            {
               _loc1_.push(_loc4_);
            }
         }
         _loc3_ = _loc1_;
         var _loc5_:Array = _loc3_;
         _loc4_ = _loc5_[Utils.rand(int(_loc5_.length))];
         _loc4_();
      }
      
      final public function outputText(param1:String, param2:Boolean = false) : void
      {
         get_game().outputText(param1);
      }
      
      public function outputPlayerDodged(param1:int) : void
      {
         if(param1 == 1)
         {
            outputText("你险险地躲开了" + get_themonster() + "的" + Utils.cnName(get_weaponVerb()) + "！\n");
         }
         else if(param1 == 2)
         {
            outputText("你以极快的速度躲开了" + get_themonster() + "的" + Utils.cnName(get_weaponVerb()) + "！\n");
         }
         else
         {
            outputText("你灵巧地避开了" + get_themonster());
            if(get_plural())
            {
               outputText("的");
            }
            else
            {
               outputText("");
            }
            outputText("缓慢的" + Utils.cnName(get_weaponVerb()) + "。\n");
         }
      }
      
      public function outputDefaultTeaseReaction(param1:Number) : void
      {
         if(lustVuln == 0)
         {
            outputText("你试图用你的身体挑逗[themonster]，但这似乎对[monster.him]没有任何效果。[pg]");
         }
         if(get_plural())
         {
            if(param1 == 0)
            {
               outputText("[pg-]" + get_Themonster() + "似乎不为所动。");
            }
            if(param1 > 0 && param1 < 4)
            {
               outputText("[pg-]" + get_Themonster() + "对" + pronoun1 + "看到的东西似乎很感兴趣。");
            }
            if(param1 >= 4 && param1 < 10)
            {
               outputText("[pg-]" + get_Themonster() + "显然很享受这场表演。");
            }
            if(param1 >= 10 && param1 < 15)
            {
               outputText("[pg-]" + get_Themonster() + "一边看着你，一边公然抚摸着" + pronoun2 + "自己。");
            }
            if(param1 >= 15 && param1 < 20)
            {
               outputText("[pg-]" + get_Themonster() + "因欲望而面红耳赤，" + pronoun3 + "的眼中充满了渴望。");
            }
            if(param1 >= 20)
            {
               outputText("[pg-]" + get_Themonster() + "满怀期待地舔了舔" + pronoun3 + "的嘴唇，" + pronoun3 + "的双手漫不经心地抚摸着" + pronoun3 + "的身体。");
            }
         }
         else
         {
            if(param1 == 0)
            {
               outputText("[pg-]" + get_Themonster() + " 似乎不为所动。");
            }
            if(param1 > 0 && param1 < 4)
            {
               if(get_plural())
               {
                  outputText("[pg-]" + get_Themonster() + " 对" + pronoun1 + "看到的东西很感兴趣。");
               }
               else
               {
                  outputText("[pg-]" + get_Themonster() + " 对" + pronoun1 + "看到的东西很感兴趣。");
               }
            }
            if(param1 >= 4 && param1 < 10)
            {
               outputText("[pg-]" + get_Themonster() + " 显然很享受这场表演。");
            }
            if(param1 >= 10 && param1 < 15)
            {
               if(get_plural())
               {
                  outputText("[pg-]" + get_Themonster() + " 在" + pronoun1 + "看着你时，公然抚摸着" + pronoun2 + "自己。");
               }
               else
               {
                  outputText("[pg-]" + get_Themonster() + " 毫不掩饰地抚摸着" + pronoun2 + "自己，同时" + pronoun1 + "注视着你。");
               }
            }
            if(param1 >= 15 && param1 < 20)
            {
               if(get_plural())
               {
                  outputText("[pg-]" + get_Themonster() + " 因欲望而面红耳赤，" + pronoun3 + " 眼中充满了渴望。");
               }
               else
               {
                  outputText("[pg-]" + get_Themonster() + " 因欲望而面红耳赤，" + pronoun3 + " 眼中充满了渴望。");
               }
            }
            if(param1 >= 20)
            {
               if(get_plural())
               {
                  outputText("[pg-]" + get_Themonster() + " 舔了舔" + pronoun3 + "的嘴唇，满怀期待，" + pronoun3 + "的双手漫不经心地抚摸着" + pronoun3 + "自己的身体。");
               }
               else
               {
                  outputText("[pg-]" + get_Themonster() + " 舔了舔" + pronoun3 + "的嘴唇，满怀期待，" + pronoun3 + "的双手漫不经心地抚摸着" + pronoun3 + "自己的身体。");
               }
            }
         }
      }
      
      public function outputDefaultFantasy(param1:Number) : void
      {
         var _loc2_:* = null as Player;
         if(get_player().balls > 0 && get_player().ballSize >= 10 && Utils.rand(2) == 0)
         {
            outputText("你幻想着操[themonster]，感觉你的蛋蛋因为精液而肿胀，你准备把[monster.him]操得满满的。");
            outputText("你不确定这是否只是幻想，但你的[balls]确实感觉比以前更饱满了……");
            _loc2_ = get_player();
            _loc2_.set_hoursSinceCum(_loc2_.get_hoursSinceCum() + 50);
         }
         else if(get_player().biggestTitSize() >= 6 && Utils.rand(2) == 0)
         {
            outputText("你幻想着一把抓住[themonster]，将[monster.him]塞进你那摇晃的双乳之间，在你尽情发泄欲望时几乎让[monster.him]窒息。");
         }
         else if(get_player().biggestLactation() >= 6 && Utils.rand(2) == 0)
         {
            outputText("你幻想着一把抓住[themonster]，强迫[monster.him]贴在你的[nipple]上，感受着乳汁的分泌。想要强行喂食点什么的渴望让你的乳头变得坚挺，并被溢出的乳汁打湿。");
         }
         else
         {
            outputText("你的脑海中充满了关于[themonster]的下流念头，想象着[monster.him]和你一起陷入各种淫乱的场景中。");
         }
         if(param1 >= 20)
         {
            outputText("这幻想如此生动且令人愉悦，你恨不得它现在就变成现实。你暗自琢磨[themonster]是否能看穿你脑子里的念头。");
         }
      }
      
      public function outputAttack(param1:int) : void
      {
         if(param1 <= 0)
         {
            if(get_player().statusEffectv1(StatusEffects.CounterAB) == 1)
            {
               outputText("你招架并反击了敌人的攻击！");
            }
            else if(Utils.rand(get_player().get_armorDef() + get_player().get_tou()) < get_player().get_armorDef())
            {
               outputText("你吸收并偏转了每一次" + get_weaponVerb() + "用你的" + (get_player().get_armor() != ArmorLib.NOTHING ? get_player().get_armor().get_name() : get_player().get_armorName()) + ".");
            }
            else if(get_plural())
            {
               outputText("你偏转并格挡了 " + get_themonster() + "向你发起的每一次" + Utils.cnName(get_weaponVerb()) + "。");
            }
            else
            {
               outputText("你格挡并化解了所有的" + Utils.cnName(get_weaponVerb()) + "，任凭" + get_themonster() + "怎么向你攻击。");
            }
         }
         else if(param1 < 6)
         {
            outputText("你被" + get_themonster() + "击中，但只是擦伤！");
         }
         else if(param1 < 11)
         {
            outputText(get_Themonster() + "击伤");
            if(!get_plural())
            {
               outputText("");
            }
            outputText("你！");
         }
         else if(param1 < 21)
         {
            outputText(get_Themonster() + Utils.cnName(get_weaponVerb()) + "一击" + "，使");
            if(!get_plural())
            {
               outputText("");
            }
            outputText("你一阵踉跄！");
         }
         else if(param1 > 20)
         {
            outputText(get_Themonster() + "<b>残害");
            if(!get_plural())
            {
               outputText("");
            }
            outputText("</b>，用" + pronoun3 + "强力的" + Utils.cnName(get_weaponVerb()) + "击中了你！");
         }
         if(param1 > 0)
         {
            if(FlagDict_Impl_.arrayReadInt(get_flags(),2138) > 0)
            {
               outputText("<b>暴击！</b>");
            }
            outputText("<b>(<font color=\"" + get_game().mainViewManager.colorHpMinus() + "\">" + param1 + "</font>)</b>");
         }
         else
         {
            outputText("<b>(<font color=\"" + get_game().mainViewManager.colorHpNeutral() + "\">" + param1 + "</font>)</b>");
         }
         if(hasPerk(PerkLib.BrutalBlows) && get_str() > 75)
         {
            if(get_player().get_armorDef() > 0)
            {
               outputText("\n[Themonster]的攻击如此残暴，破坏了你的防御！");
            }
            get_player().createOrFindStatusEffect(StatusEffects.BrutalBlows).applyEffect(1);
         }
         if(hasPerk(PerkLib.SeverTendons) && Utils.rand(100) <= 25)
         {
            outputText("\n[Themonster]的精准打击使你部分瘫痪，削弱了你的力量和速度！");
            get_player().createOrFindStatusEffect(StatusEffects.SeverTendons).applyEffect(5);
         }
      }
      
      public function onPcRunSuccess() : void
      {
      }
      
      public function missingInits() : String
      {
         var _loc4_:* = null as String;
         var _loc5_:Boolean = false;
         var _loc1_:Array = [];
         var _loc2_:Array = Reflect.fields(initsCalled);
         var _loc3_:int = 0;
         while(_loc3_ < int(_loc2_.length))
         {
            _loc4_ = _loc2_[_loc3_];
            _loc3_++;
            _loc5_ = Reflect.field(initsCalled,_loc4_);
            if(Std.isOfType(_loc5_,Boolean) && !_loc5_)
            {
               _loc1_.push(_loc4_);
            }
         }
         return _loc1_.join(", ");
      }
      
      override public function maxLust() : Number
      {
         var _loc1_:Number = 100 + bonusLust;
         if(hasPerk(PerkLib.ImprovedSelfControl))
         {
            _loc1_ += 20;
         }
         return _loc1_;
      }
      
      override public function maxHP() : Number
      {
         var _loc1_:Number = Number(super.maxHP()) + bonusHP;
         if(FlagDict_Impl_.arrayReadInt(get_flags(),2644) == 0)
         {
            if(get_short() == "doppelganger" || get_short() == "pod" || get_short() == "sand trap" || get_short() == "sand tarp")
            {
               _loc1_ += 200 * get_player().newGamePlusMod();
            }
            else if(get_short() == "Lethice")
            {
               _loc1_ += 1200 * get_player().newGamePlusMod();
            }
            else if(get_short() == "Marae")
            {
               _loc1_ += 2500 * get_player().newGamePlusMod();
            }
            else if(this is AkbalUnsealed)
            {
               _loc1_ += 1500 * get_player().newGamePlusMod();
            }
            else
            {
               _loc1_ += 1000 * get_player().newGamePlusMod();
            }
         }
         if(FlagDict_Impl_.arrayReadInt(get_flags(),2644) == 1)
         {
            if(get_short() == "doppelganger" || get_short() == "pod" || get_short() == "sand trap" || get_short() == "sand tarp")
            {
               _loc1_ += 10 * get_player().newGamePlusMod();
            }
            else if(get_short() == "Lethice")
            {
               _loc1_ += 80 * get_player().newGamePlusMod();
            }
            else if(get_short() == "Marae")
            {
               _loc1_ += 100 * get_player().newGamePlusMod();
            }
            else if(this is AkbalUnsealed)
            {
               _loc1_ += 100 * get_player().newGamePlusMod();
            }
            else
            {
               _loc1_ += 10 * get_player().newGamePlusMod();
            }
         }
         switch(get_game().get_difficulty())
         {
            case 1:
               _loc1_ *= 1.25;
               break;
            case 2:
               _loc1_ *= 1.5;
               break;
            case 3:
               _loc1_ *= 2;
         }
         return Math.round(_loc1_);
      }
      
      public function isFullyInit() : Boolean
      {
         if(Boolean(initsCalled.a) && Boolean(initsCalled.short) && Boolean(initsCalled.long) && Boolean(initsCalled.genitals) && Boolean(initsCalled.breasts) && Boolean(initsCalled.tallness) && Boolean(initsCalled.str_tou_spe_inte) && Boolean(initsCalled.lib_sens_cor))
         {
            return Boolean(initsCalled.drop);
         }
         return false;
      }
      
      public function initiativeValue() : int
      {
         var _loc1_:Number = get_player().level - level;
         _loc1_ += 15 * (1 - Math.max(HPRatio(),0.1));
         _loc1_ += 10 * LustRatio();
         if(get_player().spellMod() > 3)
         {
            _loc1_ += 2;
         }
         if(get_game().combat.calcWeaponDamage(false) >= maxHP() / 4 || get_game().combat.calcWeaponDamage(false) * get_game().combat.getNumAttacks() * 0.7 >= maxHP() / 4)
         {
            _loc1_ += 5;
         }
         return int(Math.round(_loc1_));
      }
      
      public function initStrTouSpeInte(param1:Number, param2:Number, param3:Number, param4:Number) : void
      {
         set_str(param1);
         set_tou(param2);
         set_spe(param3);
         set_inte(param4);
         set_initedStrTouSpeInte(true);
      }
      
      public function initLibSensCor(param1:Number, param2:Number, param3:Number) : void
      {
         lib = param1;
         sens = param2;
         cor = param3;
         set_initedLibSensCor(true);
      }
      
      public function initGenderless() : void
      {
         cocks.resize(0);
         vaginas.resize(0);
         set_initedGenitals(true);
         if(get_plural())
         {
            pronoun1 = "他们";
            pronoun2 = "他们";
            pronoun3 = "他们的";
         }
         else
         {
            pronoun1 = "它";
            pronoun2 = "它";
            pronoun3 = "它的";
         }
      }
      
      public function hasTag(param1:String) : Boolean
      {
         return tagList.indexOf(param1) >= 0;
      }
      
      public function handleStun() : Boolean
      {
         if(get_plural())
         {
            get_game().outputText("你的敌人们被你刚才的攻击打得晕头转向，无法还击！");
         }
         else
         {
            get_game().outputText("你的敌人被你刚才的攻击打得晕头转向，无法还击！");
         }
         if(statusEffectv1(StatusEffects.Stunned) <= 0)
         {
            removeStatusEffect(StatusEffects.Stunned);
         }
         else
         {
            addStatusValue(StatusEffects.Stunned,1,-1);
         }
         if(hasStatusEffect(StatusEffects.Uber))
         {
            removeStatusEffect(StatusEffects.Uber);
         }
         return false;
      }
      
      public function handleFear() : Boolean
      {
         if(hasPerk(PerkLib.FearImmune))
         {
            get_game().outputText(get_Themonster() + " 似乎对你的恐惧免疫。[pg]");
            removeStatusEffect(StatusEffects.Fear);
            return true;
         }
         if(statusEffectv1(StatusEffects.Fear) == 0)
         {
            if(get_plural())
            {
               removeStatusEffect(StatusEffects.Fear);
               get_game().outputText("你的敌人们摆脱了恐惧，准备战斗。");
            }
            else
            {
               removeStatusEffect(StatusEffects.Fear);
               get_game().outputText("你的敌人摆脱了恐惧，准备战斗。");
            }
         }
         else
         {
            addStatusValue(StatusEffects.Fear,1,-1);
            if(get_plural())
            {
               get_game().outputText(get_Themonster() + " 吓得瑟瑟发抖，根本无力战斗。");
            }
            else
            {
               get_game().outputText(get_Themonster() + " 吓得瑟瑟发抖，根本无力战斗。");
            }
         }
         return false;
      }
      
      public function handleDamaged(param1:Number, param2:Boolean = true) : Number
      {
         return param1;
      }
      
      public function handleConstricted() : Boolean
      {
         var _loc1_:ConstrictedDebuff = statusEffectByType(StatusEffects.Constricted);
         _loc1_.struggle();
         return false;
      }
      
      public function handleCombatLossText(param1:Boolean, param2:int) : int
      {
         if(!param1)
         {
            outputText("[pg]你大概会在八小时左右后恢复意识");
            if(get_player().get_gems() > 1)
            {
               outputText("，并且丢失了 " + param2 + " 颗宝石。");
            }
            else if(get_player().get_gems() == 1)
            {
               outputText("，并且丢失了你仅有的一颗宝石。");
            }
            else
            {
               outputText("。");
            }
         }
         else
         {
            outputText("[pg]不知怎么的，你竟然活着逃出来了");
            if(get_player().get_gems() > 1)
            {
               outputText("，但在检查了你的宝石袋后，你发现你丢失了 " + param2 + " 颗宝石。");
            }
            else if(get_player().get_gems() == 1)
            {
               outputText("，但在检查了你的宝石袋后，你发现你唯一的一颗宝石不见了。");
            }
            else
            {
               outputText("。");
            }
         }
         return 8;
      }
      
      public function handleBlind() : Boolean
      {
         if(Utils.rand(3) < 2)
         {
            if(get_weaponVerb() == "tongue-slap")
            {
               outputText(get_Themonster() + "用" + pronoun3 + "的舌头猛刺，但完全没有击中你！\n");
            }
            else
            {
               outputText(get_Themonster() + "的盲目攻击完全没有击中你！\n");
            }
            return false;
         }
         return true;
      }
      
      public function handleAwardText() : void
      {
         if(get_gems() == 1)
         {
            outputText("[pg]你带着胜利离开，顺手拿走了一颗宝石和 " + XP + " 点经验值。");
         }
         else if(get_gems() > 1)
         {
            outputText("[pg]你从胜利中获得了 " + get_gems() + " 颗宝石和 " + XP + " 点经验值。");
         }
         else if(get_gems() == 0)
         {
            outputText("[pg]你从战斗中获得了 " + XP + " 点经验值。");
         }
      }
      
      public function handleAwardItemText(param1:ItemType) : void
      {
         if(param1 != null)
         {
            outputText("\n你在被击败的对手身上发现了" + Utils.cnName(param1.get_longName()) + "。");
         }
      }
      
      public function get_weapons() : WeaponLib
      {
         return get_game().weapons;
      }
      
      public function get_useables() : UseableLib
      {
         return get_game().useables;
      }
      
      public function get_undergarments() : UndergarmentLib
      {
         return get_game().undergarments;
      }
      
      public function get_touUnscaled() : int
      {
         return int(Math.max(1,get_tou() - scaleTou));
      }
      
      public function get_touRescaled() : int
      {
         var _loc1_:int = int(get_touUnscaled() * 0.5);
         return get_touUnscaled() + Utils.boundInt(-_loc1_,scaleTou,_loc1_);
      }
      
      public function get_themonster() : String
      {
         return Utils.cnName(get_short());
      }
      
      public function get_strUnscaled() : int
      {
         return int(Math.max(1,get_str() - scaleStr));
      }
      
      public function get_strRescaled() : int
      {
         var _loc1_:int = int(get_strUnscaled() * 0.5);
         return get_strUnscaled() + Utils.boundInt(-_loc1_,scaleStr,_loc1_);
      }
      
      public function get_speUnscaled() : int
      {
         return int(Math.max(1,get_spe() - scaleSpe));
      }
      
      public function get_speRescaled() : int
      {
         var _loc1_:int = int(get_speUnscaled() * 0.5);
         return get_speUnscaled() + Utils.boundInt(-_loc1_,scaleSpe,_loc1_);
      }
      
      public function get_shields() : ShieldLib
      {
         return get_game().shields;
      }
      
      public function get_possessive() : String
      {
         if(_possessive == "default")
         {
            if(get_plural() && get_short().charAt(get_short().length - 1) == "s")
            {
               return "";
            }
            return "";
         }
         return _possessive;
      }
      
      public function get_plural() : Boolean
      {
         return _plural;
      }
      
      final public function get_player() : Player
      {
         return get_game().player;
      }
      
      public function get_onPcRunAttempt() : Function
      {
         if(onPcRunAttempt != null)
         {
            return onPcRunAttempt;
         }
         return runCheck;
      }
      
      public function get_long() : String
      {
         return _long;
      }
      
      public function get_jewelries() : JewelryLib
      {
         return get_game().jewelries;
      }
      
      public function get_inteUnscaled() : int
      {
         return int(Math.max(1,get_inte() - scaleInte));
      }
      
      public function get_inteRescaled() : int
      {
         var _loc1_:int = int(get_inteUnscaled() * 0.5);
         return get_inteUnscaled() + Utils.boundInt(-_loc1_,scaleInte,_loc1_);
      }
      
      public function get_images() : ImageManager
      {
         return get_game().images;
      }
      
      public function get_drop() : RandomChoice
      {
         return _drop;
      }
      
      public function get_consumables() : ConsumableLib
      {
         return get_game().consumables;
      }
      
      public function get_checkCalled() : Boolean
      {
         return _checkCalled;
      }
      
      public function get_armors() : ArmorLib
      {
         return get_game().armors;
      }
      
      public function get_Themonster() : String
      {
         return Utils.cnName(get_short());
      }
      
      public function get_Pronoun3() : String
      {
         if(pronoun3 == "")
         {
            return "";
         }
         return pronoun3.substr(0,1).toUpperCase() + pronoun3.substr(1);
      }
      
      public function get_Pronoun2() : String
      {
         if(pronoun2 == "")
         {
            return "";
         }
         return pronoun2.substr(0,1).toUpperCase() + pronoun2.substr(1);
      }
      
      public function get_Pronoun1() : String
      {
         if(pronoun1 == "")
         {
            return "";
         }
         return pronoun1.substr(0,1).toUpperCase() + pronoun1.substr(1);
      }
      
      public function getDistanceDescription() : String
      {
         var _loc4_:* = null as String;
         var _loc1_:String = isFlying ? "[b: 飞行中]并且" : "";
         var _loc2_:String = isFlying ? "" : "，并且可以被任何攻击命中";
         var _loc3_:String = "敌人正" + _loc1_;
         switch(distance.index)
         {
            case 0:
               _loc4_ = "处于近战距离" + _loc2_ + ".[pg-]";
               break;
            case 1:
               _loc4_ = extraDistance > 0 ? "离你非常远。接近" + pronoun2 + "需要[b: " + extraDistance + "]次移动。" : "与你[b: 保持着距离]。你可以靠近或使用远程攻击。[pg-]";
         }
         return _loc3_ + _loc4_;
      }
      
      public function getCurrMonsterIndex() : int
      {
         var _loc1_:int = 0;
         while(_loc1_ < int(get_game().monsterArray.length))
         {
            if(get_game().monsterArray[_loc1_] == this)
            {
               return _loc1_;
            }
            _loc1_++;
         }
         return -1;
      }
      
      public function generateTooltip() : String
      {
         var _loc4_:* = null as StatusEffect;
         var _loc5_:* = null as StatusEffect;
         var _loc6_:* = null as Perk;
         var _loc1_:String = "[b:腐化：]" + (get_game().player.hasPerk(PerkLib.Awareness) ? Std.string(cor) : "???") + "[pg-][b:护甲：]" + (get_game().player.hasPerk(PerkLib.Awareness) ? Std.string(get_armorDef()) : "???") + "[pg-]";
         if(hasStatusEffect(StatusEffects.IzmaBleed))
         {
            _loc1_ += "[b:Bleeding:]目标正在流血并承受[b:(<font color=\"" + get_game().mainViewManager.colorHpMinus() + "\">" + Math.round(bleedDamage(false,true)) + "-" + Math.round(bleedDamage(true)) + "</font>)] 点伤害。[pg-]";
         }
         if(hasStatusEffect(StatusEffects.Stunned))
         {
            _loc1_ += "[b:眩晕：]目标被眩晕，在" + (statusEffectv1(StatusEffects.Stunned) + 1) + "回合内无法行动。[pg-]";
         }
         if(hasStatusEffect(StatusEffects.Blind))
         {
            _loc1_ += "[b:致盲：]目标被致盲，攻击失误率大幅增加。[pg-]";
         }
         if(hasStatusEffect(StatusEffects.Fear))
         {
            _loc1_ += "[b:恐惧：]目标因恐惧而僵住，无法攻击。[pg-]";
         }
         if(hasStatusEffect(StatusEffects.NagaVenom))
         {
            _loc1_ += "[b:中毒(娜迦)：]目标正在不断流失速度和力量。[pg-]";
         }
         if(hasStatusEffect(StatusEffects.Whispered))
         {
            _loc1_ += "[b:低语：]目标被黑暗的低语所迷惑，无法攻击。[pg-]";
         }
         if(hasStatusEffect(StatusEffects.OnFire))
         {
            _loc1_ += "[b:点燃：]目标正在燃烧，每回合受到伤害，持续" + statusEffectv1(StatusEffects.OnFire) + "回合。[pg-]";
         }
         if(hasStatusEffect(StatusEffects.Shell))
         {
            _loc1_ += "[b:硬壳：]目标受到魔法护壳保护，持续" + statusEffectv1(StatusEffects.Shell) + "回合，并会吸收部分魔法攻击。[pg-]";
         }
         if(hasStatusEffect(StatusEffects.GuardAB))
         {
            _loc1_ += "[b:护卫：]目标受到护卫，无法被直接攻击。[pg-]";
         }
         if(get_HP() <= 0)
         {
            _loc1_ += "[b:该敌人已退出战斗。][pg-]";
         }
         if(get_lust() >= maxLust() && !ignoreLust)
         {
            _loc1_ += "[b:这个敌人发情得无心战斗。][pg-]";
         }
         if(hasStatusEffect(StatusEffects.GuardAB))
         {
            _loc1_ += "[b:这个敌人正受到另一个敌人的保护，无法被攻击。][pg-]";
         }
         var _loc2_:int = 0;
         var _loc3_:Array = statusEffects;
         while(_loc2_ < int(_loc3_.length))
         {
            _loc4_ = _loc3_[_loc2_];
            _loc2_++;
            _loc5_ = _loc4_;
            if(_loc5_ is CombatBuff && _loc5_.get_tooltip() != "")
            {
               _loc1_ += _loc5_.get_tooltip() + "[pg-]";
            }
         }
         _loc2_ = 0;
         _loc3_ = get_perks();
         while(_loc2_ < int(_loc3_.length))
         {
            _loc6_ = _loc3_[_loc2_];
            _loc2_++;
            if(_loc6_.get_ptype().get_enemyDesc() != "")
            {
               _loc1_ += "[b:" + Utils.cnName(_loc6_.get_ptype().get_name()) + ":] " + _loc6_.get_ptype().get_enemyDesc() + "[pg-]";
            }
         }
         return _loc1_ + getDistanceDescription();
      }
      
      public function generateDebugDescription() : String
      {
         var _loc7_:* = null as Cock;
         var _loc8_:* = null as Vagina;
         var _loc9_:* = null as String;
         var _loc10_:* = null as BreastRow;
         var _loc11_:Number = NaN;
         var _loc12_:Number = NaN;
         var _loc1_:String = get_plural() ? "是" : "是";
         var _loc2_:String = get_plural() ? "有" : "有";
         var _loc3_:String = get_Pronoun1() + " " + _loc1_ + " ";
         var _loc4_:String = get_Pronoun1() + " " + _loc2_ + " ";
         var _loc5_:String = "[pg]你正在检查" + get_themonster() + " (imageName=\'" + imageName + "\', class=\'" + Type.getClassName(Type.getClass(this)) + "\')。你正在与" + pronoun2 + "战斗。\n\n";
         _loc5_ += _loc3_ + fromDefault(Appearance.DEFAULT_GENDER_NAMES,get_gender(),"gender#") + "拥有" + Utils.numberOfThings(int(cocks.length),"cock") + ", " + Utils.numberOfThings(int(vaginas.length),"个小穴") + "和" + Utils.numberOfThings(int(breastRows.length),"排乳房") + ".\n\n";
         _loc5_ += _loc3_ + Appearance.inchesAndFeetsAndInches(get_tallness()) + "高，有着" + Appearance.describeByScale(hips.rating,Appearance.DEFAULT_HIPS_RATING_SCALES,"窄于","宽于") + "臀部和" + Appearance.describeByScale(butt.rating,Appearance.DEFAULT_BUTT_RATING_SCALES,"比...更瘦","比...更宽") + "屁股。\n";
         _loc5_ += get_Pronoun3() + "下半身是" + fromDefault(Appearance.DEFAULT_LOWER_BODY_NAMES,lowerBody.type,"lowerBody#");
         _loc5_ += ", " + pronoun3 + "手臂是" + fromDefault(Appearance.DEFAULT_ARM_NAMES,arms.type,"armType#");
         _loc5_ += ", " + pronoun1 + " " + _loc2_ + " " + skin.tone + " " + skin.adj + " " + skin.desc + "(类型" + fromDefault(Appearance.DEFAULT_SKIN_NAMES,skin.type,"skinType#") + ").\n";
         _loc5_ += _loc4_;
         if(hair.length > 0)
         {
            _loc5_ += hair.color + " " + Appearance.inchesAndFeetsAndInches(hair.length) + "长" + fromDefault(Appearance.DEFAULT_HAIR_NAMES,hair.type,"hair.type#") + "头发。\n";
         }
         else
         {
            _loc5_ += "没有头发。\n";
         }
         _loc5_ += _loc4_;
         if(beard.length > 0)
         {
            _loc5_ += hair.color + " " + Appearance.inchesAndFeetsAndInches(beard.length) + "长" + fromDefault(Appearance.DEFAULT_BEARD_NAMES,beard.style,"beardType#") + ".\n";
         }
         else
         {
            _loc5_ += "没有胡须。\n";
         }
         _loc5_ += _loc4_ + fromDefault(Appearance.DEFAULT_FACE_NAMES,face.type,"face.type#") + "脸，" + fromDefault(Appearance.DEFAULT_EARS_NAMES,ears.type,"ears.type#") + "耳朵，" + fromDefault(Appearance.DEFAULT_TONGUE_NAMES,tongue.type,"tongueType#") + "舌头和" + fromDefault(Appearance.DEFAULT_EYES_NAMES,eyes.type,"eyes.type#") + "眼睛。\n";
         _loc5_ += _loc4_;
         if(tail.type == 0)
         {
            _loc5_ += "没有尾巴，";
         }
         else
         {
            _loc5_ += fromDefault(Appearance.DEFAULT_TAIL_NAMES,tail.type,"tailType#") + "尾巴，毒液=" + tail.venom + "，充能=" + tail.recharge + ", ";
         }
         if(horns.type == 0)
         {
            _loc5_ += "没有角，";
         }
         else
         {
            _loc5_ += horns.value + " " + fromDefault(Appearance.DEFAULT_HORN_NAMES,horns.type,"hornsPart.type#") + "角，";
         }
         if(wings.type == 0)
         {
            _loc5_ += "没有翅膀，";
         }
         else
         {
            _loc5_ += Appearance.DEFAULT_WING_DESCS.h[wings.type] + "翅膀（类型" + fromDefault(Appearance.DEFAULT_WING_NAMES,wings.type,"wingType#") + "), ";
         }
         if(antennae.type == 0)
         {
            _loc5_ += "没有触角。\n\n";
         }
         else
         {
            _loc5_ += fromDefault(Appearance.DEFAULT_ANTENNAE_NAMES,antennae.type,"antennaeType#") + "触角。\n\n";
         }
         var _loc6_:int = 0;
         while(_loc6_ < int(cocks.length))
         {
            _loc7_ = cocks[_loc6_];
            _loc5_ += get_Pronoun3() + (_loc6_ > 0 ? " #" + (_loc6_ + 1) : "") + "" + _loc7_.get_cockType().toString().toLowerCase() + "肉棒";
            _loc5_ += Appearance.inchesAndFeetsAndInches(_loc7_.cockLength) + "长，" + _loc7_.cockThickness + "英寸粗";
            if(_loc7_.get_isPierced())
            {
               _loc5_ += "，穿戴着" + _loc7_.pLongDesc;
            }
            if(_loc7_.knotMultiplier != 1)
            {
               _loc5_ += "，带有大小为 " + _loc7_.knotMultiplier + " 的肉结";
            }
            _loc5_ += ".\n";
            _loc6_++;
         }
         if(balls > 0 || ballSize > 0)
         {
            _loc5_ += _loc4_ + Utils.numberOfThings(int(balls),"个睾丸") + "，大小为 " + ballSize + "。\n";
         }
         if(cumMultiplier != 1 || int(cocks.length) > 0)
         {
            _loc5_ += get_Pronoun1() + "" + _loc2_ + "精液倍率" + cumMultiplier + "。";
         }
         if(get_hoursSinceCum() > 0 || int(cocks.length) > 0)
         {
            _loc5_ += "距离" + pronoun1 + "上次射精已经过去了 " + get_hoursSinceCum() + " 小时。\n\n";
         }
         _loc6_ = 0;
         while(_loc6_ < int(vaginas.length))
         {
            _loc8_ = vaginas[_loc6_];
            _loc5_ += get_Pronoun3() + (_loc6_ > 0 ? " #" + (_loc6_ + 1) : "") + " " + fromDefault(Appearance.DEFAULT_VAGINA_TYPE_NAMES,_loc8_.type,"vaginaType#") + (_loc8_.virgin ? "" : "非") + "处女小穴";
            _loc5_ += Appearance.describeByScale(_loc8_.vaginalLooseness,Appearance.DEFAULT_VAGINA_LOOSENESS_SCALES,"紧于","松于");
            _loc5_ += "，" + Appearance.describeByScale(_loc8_.vaginalWetness,Appearance.DEFAULT_VAGINA_WETNESS_SCALES,"干于","湿于");
            if(_loc8_.labiaPierced != 0)
            {
               _loc5_ += "。阴唇上穿有" + _loc8_.labiaPLong;
            }
            if(_loc8_.clitPierced != 0)
            {
               _loc5_ += "。阴蒂上穿有" + _loc8_.clitPLong;
            }
            if(statusEffectv1(StatusEffects.BonusVCapacity) > 0)
            {
               _loc5_ += "；阴道容量增加了" + statusEffectv1(StatusEffects.BonusVCapacity);
            }
            _loc5_ += ".\n";
            _loc6_++;
         }
         if(int(breastRows.length) > 0)
         {
            _loc9_ = nippleLength + "\" ";
            if(nipplesPierced != 0)
            {
               _loc9_ += "戴着" + nipplesPLong + "的";
            }
            _loc6_ = 0;
            while(_loc6_ < int(breastRows.length))
            {
               _loc10_ = breastRows[_loc6_];
               _loc5_ += get_Pronoun3() + (_loc6_ > 0 ? "第" + (_loc6_ + 1) + "排" : "") + "胸部有" + _loc10_.breasts;
               _loc11_ = Math.pow(10,2);
               _loc12_ = Math.round(_loc11_ * _loc10_.breastRating) / _loc11_;
               _loc5_ += " 个尺寸为" + Std.string(_loc12_) + "（" + Appearance.breastCup(_loc10_.breastRating) + "）的乳房，上面有";
               _loc5_ += Utils.numberOfThings(int(_loc10_.nipplesPerBreast),_loc9_ + (_loc10_.fuckable ? "可操的乳头" : "不可操的乳头")) + "在每个上面。\n";
               _loc6_++;
            }
         }
         _loc5_ += get_Pronoun3() + "屁股是" + Appearance.describeByScale(ass.analLooseness,Appearance.DEFAULT_ANAL_LOOSENESS_SCALES,"紧于","松于") + ", " + Appearance.describeByScale(ass.analWetness,Appearance.DEFAULT_ANAL_WETNESS_SCALES,"干于","湿于");
         if(statusEffectv1(StatusEffects.BonusACapacity) > 0)
         {
            _loc5_ += "; 肛门容量增加了 " + statusEffectv1(StatusEffects.BonusACapacity);
         }
         _loc5_ += ".\n\n";
         _loc5_ += _loc4_ + "力量=" + get_str() + ", 体质=" + get_tou() + ", 速度=" + get_spe() + ", 智力=" + get_inte() + ", lib=" + lib + ", sens=" + sens + ", cor=" + cor + ".\n";
         _loc5_ += get_Pronoun1() + "能用" + get_weaponPerk().join("") + "" + get_weaponName() + "" + Utils.cnName(get_weaponVerb()) + "你（攻击 " + get_weaponAttack() + "，价值 " + get_weaponValue() + ").\n";
         _loc5_ += get_Pronoun1() + "被守卫着，守卫装备有" + get_armorPerk() + " " + get_armorName() + "(防御" + get_armorDef() + "，价值" + get_armorValue() + ").\n";
         _loc5_ += _loc4_ + get_HP() + "/" + maxHP() + " 生命值，" + get_lust() + "/" + maxLust() + " 欲望，" + get_fatigue() + "/100 疲劳。" + get_Pronoun3() + " 额外生命值=" + bonusHP + "，且欲望易伤=" + lustVuln + "。\n";
         _loc5_ += _loc3_ + "等级 " + level + "，并且" + _loc2_ + "" + get_gems() + " 颗宝石。你将获得 " + XP + " 经验值。\n";
         var _loc13_:int = (special1 != null ? 1 : 0) + (special2 != null ? 1 : 0) + (special3 != null ? 1 : 0);
         if(_loc13_ > 0)
         {
            _loc5_ += _loc4_ + _loc13_ + " 个特殊攻击。\n";
         }
         else
         {
            _loc5_ += _loc4_ + "没有特殊攻击。\n";
         }
         return _loc5_;
      }
      
      public function fromDefault(param1:IMap, param2:int, param3:String) : String
      {
         if(param2 in param1.h)
         {
            return param1.h[param2];
         }
         return param3 + param2;
      }
      
      public function escapeMod() : int
      {
         var _loc1_:int = int(get_spe() + level * 3);
         if(hasPerk(PerkLib.Immovable))
         {
            _loc1_ -= 30;
         }
         if(distance == CombatDistance.Distant)
         {
            _loc1_ -= 50;
         }
         if(hasStatusEffect(StatusEffects.Stunned))
         {
            _loc1_ -= 50;
         }
         return _loc1_;
      }
      
      public function eOneAttack() : int
      {
         var _loc1_:int = calcDamage();
         if(_loc1_ > 0)
         {
            _loc1_ = int(get_player().takeDamage(_loc1_));
         }
         return _loc1_;
      }
      
      public function eBaseDamage() : Number
      {
         var _loc1_:Number = getTotalStat("武器伤害",get_weaponAttack());
         return getTotalStat("物理伤害",get_str() + _loc1_);
      }
      
      public function eAttack() : void
      {
         var _loc2_:int = 0;
         var _loc1_:int = int(statusEffectv1(StatusEffects.Attacks));
         if(_loc1_ == 0)
         {
            _loc1_ = 1;
         }
         while(_loc1_ > 0)
         {
            if(attackSucceeded())
            {
               _loc2_ = eOneAttack();
               outputAttack(_loc2_);
               postAttack(_loc2_);
               get_game().output.statScreenRefresh();
               outputText("\n");
            }
            if(statusEffectv1(StatusEffects.Attacks) >= 0)
            {
               addStatusValue(StatusEffects.Attacks,1,-1);
            }
            _loc1_--;
         }
         removeStatusEffect(StatusEffects.Attacks);
         if(hasPerk(PerkLib.ChargingSwings))
         {
            get_game().combatRangeData.closeDistance(get_game().monster);
         }
      }
      
      public function dropLoot() : ItemType
      {
         return _drop.choose();
      }
      
      final public function doNext(param1:Function) : void
      {
         get_game().output.doNext(param1);
      }
      
      public function doAI() : void
      {
         if(hasStatusEffect(StatusEffects.Stunned))
         {
            if(!handleStun())
            {
               return;
            }
         }
         if(hasStatusEffect(StatusEffects.Fear))
         {
            if(!handleFear())
            {
               return;
            }
         }
         if(get_game().player.hasStatusEffect(StatusEffects.Exgartuan) && get_game().player.statusEffectv2(StatusEffects.Exgartuan) == 0 && Utils.rand(3) == 0)
         {
            if(get_game().exgartuan.exgartuanCombatUpdate())
            {
               get_game().outputText("[pg]");
            }
         }
         if(hasStatusEffect(StatusEffects.Constricted))
         {
            if(!handleConstricted())
            {
               return;
            }
         }
         moveCooldown = int(Math.max(moveCooldown - 1,0));
         performCombatAction();
      }
      
      public function describeParry(param1:String = undefined, param2:String = undefined) : void
      {
         if(param1 == null)
         {
            param1 = "攻击";
         }
         if(param2 == null)
         {
            param2 = "攻击";
         }
         outputText(get_Themonster() + "设法用" + pronoun3 + "的" + get_weaponName() + "招架了你的" + Utils.cnName(param1) + "！");
      }
      
      public function describeDodge(param1:String = undefined, param2:String = undefined) : void
      {
         if(param1 == null)
         {
            param1 = "攻击";
         }
         if(param2 == null)
         {
            param2 = "攻击";
         }
         switch(Utils.rand(3))
         {
            case 0:
               outputText(get_Themonster() + "险险地避开了你的" + Utils.cnName(param1) + "！");
               break;
            case 1:
               outputText(get_Themonster() + "以极快的速度躲开了你的" + Utils.cnName(param1) + "！");
               break;
            case 2:
               outputText(get_Themonster() + "灵巧地避开了你缓慢的" + Utils.cnName(param1) + "。");
         }
      }
      
      public function describeBlock(param1:String = undefined, param2:String = undefined) : void
      {
         if(param1 == null)
         {
            param1 = "攻击";
         }
         if(param2 == null)
         {
            param2 = "攻击";
         }
         outputText(get_Themonster() + "设法用" + pronoun3 + "的" + get_shieldName() + "挡住了你的" + Utils.cnName(param1) + "！");
      }
      
      final public function defeated_(param1:Boolean) : void
      {
         if(onDefeated != null)
         {
            onDefeated(param1);
         }
         else
         {
            defeated(param1);
         }
      }
      
      public function defeated(param1:Boolean) : void
      {
         get_game().combat.finishCombat();
      }
      
      override public function createVagina(param1:Boolean = true, param2:Number = 1, param3:int = 0) : Boolean
      {
         set_initedGenitals(true);
         if(!_checkCalled)
         {
            if(get_plural())
            {
               pronoun1 = "他们";
               pronoun2 = "他们";
               pronoun3 = "他们的";
            }
            else
            {
               pronoun1 = "她";
               pronoun2 = "她";
               pronoun3 = "她的";
            }
         }
         return Boolean(super.createVagina(param1,param2,param3));
      }
      
      override public function createStatusEffectAllowDuplicates(param1:StatusEffectType, param2:Number = 0, param3:Number = 0, param4:Number = 0, param5:Number = 0, param6:Boolean = true) : StatusEffect
      {
         var _loc7_:StatusEffect = super.createStatusEffectAllowDuplicates(param1,param2,param3,param4,param5,param6);
         reactWrapper(ReactionContext.StatusApplied(param1));
         return _loc7_;
      }
      
      override public function createStatusEffect(param1:StatusEffectType, param2:Number = 0, param3:Number = 0, param4:Number = 0, param5:Number = 0, param6:Boolean = true) : StatusEffect
      {
         var _loc7_:StatusEffect = super.createStatusEffect(param1,param2,param3,param4,param5,param6);
         reactWrapper(ReactionContext.StatusApplied(param1));
         return _loc7_;
      }
      
      override public function createCock(param1:Number = 5.5, param2:Number = 1, param3:CockTypesEnum = undefined) : Boolean
      {
         set_initedGenitals(true);
         if(!_checkCalled)
         {
            if(get_plural())
            {
               pronoun1 = "他们";
               pronoun2 = "他们";
               pronoun3 = "他们的";
            }
            else
            {
               pronoun1 = "他";
               pronoun2 = "他";
               pronoun3 = "他的";
            }
         }
         return Boolean(super.createCock(param1,param2,param3));
      }
      
      override public function createBreastRow(param1:Number = 0, param2:Number = 1) : Boolean
      {
         set_initedBreasts(true);
         return Boolean(super.createBreastRow(param1,param2));
      }
      
      public function combatRoundUpdate() : void
      {
         var _loc3_:Number = NaN;
         var _loc4_:Number = NaN;
         var _loc5_:* = null as BasiliskSlowDebuff;
         var _loc6_:int = 0;
         if(get_HP() <= 0 || get_lust() >= maxLust() && !ignoreLust)
         {
            return;
         }
         var _loc1_:Number = 0;
         if(hasStatusEffect(StatusEffects.MilkyUrta))
         {
            get_game().urtaQuest.milkyUrtaTic();
         }
         var _loc2_:StatusEffect = statusEffectByType(StatusEffects.TentacleCoolDown);
         if(_loc2_ != null)
         {
            _loc2_.value1 -= 1;
            if(_loc2_.value1 <= 0)
            {
               removeStatusEffect(StatusEffects.TentacleCoolDown);
            }
         }
         if(hasStatusEffect(StatusEffects.GuardAB))
         {
            addStatusValue(StatusEffects.GuardAB,1,-1);
            if(statusEffectv1(StatusEffects.GuardAB) <= 0)
            {
               outputText(get_Themonster() + " 不再受到保护！[pg]");
               removeStatusEffect(StatusEffects.GuardAB);
            }
            else
            {
               outputText(get_Themonster() + " 目前正受到保护，你无法攻击到它。[pg]");
            }
         }
         if(hasStatusEffect(StatusEffects.CoonWhip))
         {
            if(statusEffectv2(StatusEffects.CoonWhip) <= 0)
            {
               set_armorDef(get_armorDef() + statusEffectv1(StatusEffects.CoonWhip));
               if(this is VolcanicGolem && get_armorDef() >= 300)
               {
                  set_armorDef(300);
               }
               outputText("<b>尾部鞭击的效果消失了！</b>[pg]");
               removeStatusEffect(StatusEffects.CoonWhip);
            }
            else
            {
               addStatusValue(StatusEffects.CoonWhip,2,-1);
               outputText("<b>尾部鞭击目前使你的敌人");
               if(get_plural())
               {
                  outputText("们");
               }
               else
               {
                  outputText("");
               }
               outputText("的护甲降低了 " + statusEffectv1(StatusEffects.CoonWhip) + " 点。</b>[pg]");
            }
         }
         if(hasStatusEffect(StatusEffects.Blind))
         {
            addStatusValue(StatusEffects.Blind,1,-1);
            if(statusEffectv1(StatusEffects.Blind) <= 0)
            {
               outputText("<b>" + get_Themonster() + (get_plural() ? "" : "") + "不再失明了！</b>[pg]");
               removeStatusEffect(StatusEffects.Blind);
            }
            else
            {
               outputText("<b>" + get_Themonster() + (get_plural() ? "现在" : "现在") + "失明了！</b>[pg]");
            }
         }
         if(hasStatusEffect(StatusEffects.Earthshield))
         {
            outputText("<b>" + get_Themonster() + "被岩石护盾保护着！</b>[pg]");
         }
         if(hasStatusEffect(StatusEffects.Sandstorm))
         {
            if(get_player().hasStatusEffect(StatusEffects.Blind))
            {
               outputText("<b>你眨眼弄掉眼里的沙子，但你确信如果不快点结束战斗，会有更多的沙子迷住你的眼睛！</b>[pg]");
               get_player().removeStatusEffect(StatusEffects.Blind);
            }
            else if(statusEffectv1(StatusEffects.Sandstorm) == 0 || statusEffectv1(StatusEffects.Sandstorm) % 4 == 0)
            {
               get_player().createStatusEffect(StatusEffects.Blind,0,0,0,0);
               outputText("<b>沙子进了你的眼睛！你这回合失明了！</b>[pg]");
            }
            else
            {
               outputText("[b:这些沙砾割伤了你暴露在外的血肉，并钻进了你盔甲的每一道缝隙。]");
               get_player().takeDamage(1 + Utils.rand(2),true);
               outputText("[pg]");
            }
            addStatusValue(StatusEffects.Sandstorm,1,1);
         }
         if(hasStatusEffect(StatusEffects.Stunned))
         {
            outputText("<b>" + get_Themonster() + (get_plural() ? "仍然" : "仍然") + "处于昏迷状态！</b>[pg]");
         }
         if(hasStatusEffect(StatusEffects.Shell))
         {
            if(statusEffectv1(StatusEffects.Shell) >= 0)
            {
               outputText("<b>一道色彩斑斓的光墙在" + get_themonster() + "周围闪烁。</b>[pg]");
               addStatusValue(StatusEffects.Shell,1,-1);
            }
            else
            {
               outputText("<b>" + get_themonster() + "竖起的魔法屏障终于彻底消散了。</b>[pg]");
               removeStatusEffect(StatusEffects.Shell);
            }
         }
         if(hasStatusEffect(StatusEffects.IzmaBleed))
         {
            updateBleed();
         }
         if(hasStatusEffect(StatusEffects.BasiliskCompulsion) && get_spe() > 1)
         {
            _loc3_ = get_spe();
            _loc4_ = 0;
            _loc5_ = createOrFindStatusEffect(StatusEffects.BasiliskSlow);
            _loc5_.applyEffect(statusEffectv1(StatusEffects.BasiliskCompulsion));
            _loc4_ = Math.round(_loc3_ - get_spe());
            if(get_plural())
            {
               outputText(get_Themonster() + "仍然能感受到那双灰色眼眸的魔力，让" + pronoun3 + "动作变得迟缓而艰难，记忆中的话语也在诱惑着" + pronoun2 + "再次看向你的双眼。" + get_Pronoun1() + "必须尽快结束这场战斗，只要" + pronoun3 + "沉重的四肢拖慢了动作。<b>(<font color=\"" + get_game().mainViewManager.colorHpMinus() + "\">" + Math.round(_loc4_) + "</font>)</b>[pg]");
            }
            else
            {
               outputText(get_Themonster() + "依然能感受到那双灰眼睛的魔力，这让" + pronoun3 + "动作变得迟缓而艰难，记忆中的话语也在诱惑着" + pronoun2 + "再次看向你的双眼。" + get_Pronoun1() + "必须尽快结束这场战斗，尽管" + pronoun3 + "沉重的四肢拖慢了动作。<b>(<font color=\"" + get_game().mainViewManager.colorHpMinus() + "\">" + Math.round(_loc4_) + "</font>)</b>[pg]");
            }
         }
         if(hasStatusEffect(StatusEffects.Timer))
         {
            if(statusEffectv1(StatusEffects.Timer) <= 0)
            {
               removeStatusEffect(StatusEffects.Timer);
            }
            addStatusValue(StatusEffects.Timer,1,-1);
         }
         if(hasStatusEffect(StatusEffects.LustStick))
         {
            _loc3_ = statusEffectv1(StatusEffects.LustStick);
            if(_loc3_ == 1)
            {
               if(get_plural())
               {
                  outputText("其中一个" + get_themonster() + "喘着粗气，眼神迷离了片刻。[monster.his]的肉棒绷紧并胀大，随着[monster.he]沉浸在口红引发的幻想中而抽动。当[monster.he]回过神来时，你舔了舔嘴唇，看着[monster.his]脸上的红晕蔓延开来。");
               }
               else
               {
                  outputText(get_Themonster() + "喘着粗气，" + pronoun3 + "双眼失神了片刻。[Monster.his]肉棒绷紧胀大，不断抽动着，因为" + pronoun1 + "沉浸在口红带来的幻想中。当" + pronoun1 + "回过神来时，你舔了舔嘴唇，看着[monster.his]红晕蔓延开来。");
               }
            }
            else if(_loc3_ == 2)
            {
               if(get_plural())
               {
                  outputText(get_Themonster() + "大声呻吟着，" + pronoun3 + "的肉棒不断渗出并滴下淫液，同时" + pronoun1 + "努力克制着不去碰" + pronoun2 + ".");
               }
               else
               {
                  outputText(get_Themonster() + "大声呻吟着，" + pronoun3 + "的肉棒不断渗出并滴下淫液，同时" + pronoun1 + "努力克制着不去碰它。");
               }
            }
            else if(_loc3_ == 3)
            {
               if(get_plural())
               {
                  outputText(get_Themonster() + "抽插着" + pronoun3 + "徒劳地挺动着臀部，对着空气操干着不存在的伴侣。显然你的口红正在影响" + pronoun2 + ".");
               }
               else
               {
                  outputText(get_Themonster() + "挺动着" + pronoun3 + "徒劳地挺动着臀部，对着空气操干着不存在的伴侣。显然你的口红正在影响" + pronoun2 + ".");
               }
            }
            else if(_loc3_ == 4)
            {
               if(get_plural())
               {
                  outputText(get_Themonster() + "闭上" + pronoun3 + "的眼睛并发出闷哼，" + pronoun3 + "的肉棒抽搐着、弹跳着，渗出了前列腺液。");
               }
               else
               {
                  outputText(get_Themonster() + "闭上" + pronoun2 + "的眼睛，发出一声闷哼，" + pronoun3 + "的肉棒抽动着、弹跳着，渗出前列腺液。");
               }
            }
            else if(get_plural())
            {
               outputText("前列腺液不断从他们的肉棒中滴落。真是个奇迹，" + pronoun1 + "还没有屈服于" + pronoun3 + "的欲望。");
            }
            else
            {
               outputText("前列腺液不断从" + get_themonster() + "的肉棒中滴落。真是个奇迹，" + pronoun1 + "还没有屈服于" + pronoun3 + "的欲望。");
            }
            addStatusValue(StatusEffects.LustStick,1,1);
            get_player().takeLustDamage(5 + statusEffectv2(StatusEffects.LustStick));
            outputText("[pg]");
         }
         if(hasStatusEffect(StatusEffects.PCTailTangle))
         {
            outputText("你被紧紧地束缚在狐妖的尾巴里。<b>你唯一能做的就是努力挣脱！</b>[pg]");
            outputText("在毛茸茸的尾巴缠绕刺激下，你发现自己变得越来越兴奋……");
            get_player().takeLustDamage(5 + get_player().sens / 10);
            outputText("[pg]");
         }
         if(hasStatusEffect(StatusEffects.QueenBind))
         {
            outputText("你被鹰身人女王的魔法绳索死死地捆住了！");
            if(get_game().ceraphScene.hasBondage())
            {
               get_player().takeLustDamage(3);
            }
            outputText("[pg]");
         }
         if(this is SecretarialSuccubus || this is MilkySuccubus)
         {
            if(get_player().get_lust100() < 45)
            {
               outputText("你的对手周围弥漫着某种让你感到燥热的气息。");
            }
            if(get_player().get_lust100() >= 45 && get_player().get_lust100() < 70)
            {
               outputText("你不知道为什么，但你很难将视线从对手淫荡的身躯上移开。");
            }
            if(get_player().get_lust100() >= 70 && get_player().get_lust100() < 90)
            {
               outputText("当你发现自己正盯着敌人的胸部，看着它随着她的每一步而晃动时，你脸红了。");
            }
            if(get_player().get_lust100() >= 90)
            {
               outputText("你很难把饥渴的双手从下体移开。只要躺下来，看着你那曲线动人的敌人自慰，是多么容易的事。魅魔用一种性感而意味深长的表情看着你。");
            }
            get_player().takeLustDamage(1 + Utils.rand(8));
            outputText("[pg]");
         }
         if(hasStatusEffect(StatusEffects.LustAura))
         {
            if(get_player().get_lust100() < 33)
            {
               outputText("你的下体感到一阵温暖的酥麻。恶魔的气息开始影响你了。");
            }
            if(get_player().get_lust100() >= 33 && get_player().get_lust100() < 66)
            {
               outputText("随着恶魔的气息渗入你的体内，你脸红了，变得越来越兴奋。");
            }
            if(get_player().get_lust100() >= 66)
            {
               outputText("随着空气中的情欲钻进你的体内，你因欲望而涨红了脸。");
               _loc6_ = Utils.rand(4);
               if(_loc6_ == 0)
               {
                  outputText("你强忍着才没有立刻跪倒在地去服侍她。");
               }
               if(_loc6_ == 2)
               {
                  outputText("你几乎无法克制将脸埋进她双乳间、吸吮她粉色乳头的冲动。");
               }
               if(_loc6_ == 1)
               {
                  outputText("你神魂颠倒地舔了舔嘴唇，品尝着空气中那恶魔小穴的气味。");
               }
               if(_loc6_ == 3)
               {
                  outputText("她向你抛了个媚眼，舔了舔嘴唇，你忍不住想象她的舌头在你全身游走的画面。就在你差点扑向她之前，你勉强恢复了理智。好险。");
               }
            }
            get_player().takeLustDamage(3 + (int(get_player().lib / 20 + get_player().cor / 30)));
            outputText("[pg]");
         }
      }
      
      final public function combatRoundOver() : void
      {
      }
      
      final public function combatBlock(param1:Boolean = false) : Boolean
      {
         return get_game().combat.combatBlock(this,get_player(),param1);
      }
      
      final public function combatAvoidDamage(param1:AvoidDamageParameters) : Object
      {
         param1.attacker = this;
         param1.defender = get_player();
         return get_game().combat.combatAvoidDamage(param1);
      }
      
      public function clearOutput() : void
      {
         get_game().clearOutput();
      }
      
      public function checkMonster() : Boolean
      {
         _checkCalled = true;
         checkError = validate();
         if(checkError.length > 0)
         {
            CoC_Settings.error("怪物未初始化:" + checkError);
         }
         return checkError.length == 0;
      }
      
      override public function canMove() : Boolean
      {
         if(Boolean(super.canMove()))
         {
            return !get_player().hasStatusEffect(StatusEffects.TimeFrozen);
         }
         return false;
      }
      
      public function calcDamage() : int
      {
         if(get_player().hasStatusEffect(StatusEffects.CounterAB))
         {
            if(attackCountered(get_player()))
            {
               return 0;
            }
         }
         return get_player().reduceDamage(eBaseDamage(),this);
      }
      
      public function bonusXP() : Number
      {
         var _loc1_:Array = [200,10,20,30,40,50,55,58,66,75,83,85,85,86,92,94,96,98,99,101,107];
         var _loc2_:int = int(Math.round(level));
         if(_loc2_ < 1 || _loc2_ >= int(_loc1_.length))
         {
            return Utils.rand(130);
         }
         return Utils.rand(int(_loc1_[_loc2_]));
      }
      
      public function baseXP() : Number
      {
         var _loc1_:Array = [200,10,20,30,40,50,55,60,66,75,83,85,92,100,107,115,118,121,128,135,145];
         var _loc2_:int = int(Math.round(level));
         if(_loc2_ < 1 || _loc2_ >= int(_loc1_.length))
         {
            return 200;
         }
         return int(_loc1_[_loc2_]);
      }
      
      public function attackSucceeded() : Boolean
      {
         return !playerAvoidDamage(normalAttackAvoid);
      }
      
      override public function attackOfOpportunity() : void
      {
         outputText(get_Themonster() + "迅速对你的动作做出反应，趁你逃跑时发起了攻击！\n");
         eAttack();
      }
      
      public function applyTease(param1:Number) : void
      {
         set_lust(get_lust() + param1);
         param1 = Math.round(param1 * 10) / 10;
         outputText("<b>(<font color=\"" + get_game().mainViewManager.colorLustPlus() + "\">" + param1 + "</font>)</b>");
      }
      
      override public function addStatusEffect(param1:StatusEffect) : void
      {
         super.addStatusEffect(param1);
         reactWrapper(ReactionContext.StatusApplied(param1.get_stype()));
      }
      
      public function addHP(param1:Number) : void
      {
         HPChange(param1,false);
      }
   }
}

