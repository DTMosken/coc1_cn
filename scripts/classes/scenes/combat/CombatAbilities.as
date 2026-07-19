package classes.scenes.combat
{
   import classes.BaseContent;
   import classes.CoC;
   import classes.Creature;
   import classes.DynStat;
   import classes.DynStatOp;
   import classes.MasteryLib;
   import classes.Monster;
   import classes.Output;
   import classes.PerkLib;
   import classes.Player;
   import classes.ReactionContext;
   import classes.StatusEffect;
   import classes.StatusEffects;
   import classes.Vagina;
   import classes._FlagDict.FlagDict_Impl_;
   import classes.globalFlags.KFLAGS;
   import classes.internals.Utils;
   import classes.internals._ValueFunc.NumberFunc_Impl_;
   import classes.internals._ValueFunc.ValueFunc_Impl_;
   import classes.items.Armor;
   import classes.items.ArmorLib;
   import classes.items.Shield;
   import classes.items.ShieldLib;
   import classes.items.Weapon;
   import classes.items.WeaponLib;
   import classes.saves.SelfSaver;
   import classes.saves.SelfSaving;
   import classes.scenes.areas.forest.Akbal;
   import classes.scenes.areas.forest.AkbalUnsealed;
   import classes.scenes.areas.forest.Dullahan;
   import classes.scenes.areas.forest.DullahanHorse;
   import classes.scenes.areas.forest.TentacleBeast;
   import classes.scenes.areas.glacialRift.FrostGiant;
   import classes.scenes.areas.volcanicCrag.VolcanicGolem;
   import classes.scenes.camp.TrainingDummy;
   import classes.scenes.combat._CombatAbilities.SaveContent;
   import classes.scenes.dungeons.deepCave.EncapsulationPod;
   import classes.scenes.dungeons.lethicesKeep.Doppelganger;
   import classes.scenes.dungeons.lethicesKeep.LivingStatue;
   import classes.scenes.dungeons.wizardTower.ArchInquisitorVilkus;
   import classes.scenes.npcs.Anemone;
   import classes.statusEffects.combat.BackstabBuff;
   import classes.statusEffects.combat.BasiliskSlowDebuff;
   import classes.statusEffects.combat.ChantedDebuff;
   import classes.statusEffects.combat.ConstrictedDebuff;
   import classes.statusEffects.combat.DivineWindBuff;
   import classes.statusEffects.combat.NagaBiteDebuff;
   import classes.statusEffects.combat.RetributionBuff;
   import classes.statusEffects.combat.TerraStarCooldown;
   import classes.statusEffects.combat.TerraStarDebuff;
   import classes.statusEffects.combat.Tripped;
   import classes.statusEffects.combat.WitheringDebuff;
   import coc.view.ButtonData;
   import coc.view.ButtonDataList;
   import coc.view.CoCButton;
   import coc.view.MainView;
   import flash.Boot;
   import flash.events.TimerEvent;
   import flash.utils.Timer;
   import haxe.IMap;
   import haxe.ds.IntMap;
   import haxe.ds.Option;
   
   public class CombatAbilities extends BaseContent implements SelfSaving
   {
      
      public var whipTripFunc:CombatAbility;
      
      public var waitAb:CombatAbility;
      
      public var vineTripFunc:CombatAbility;
      
      public var unarmedStances:Array;
      
      public var teaseAb:CombatAbility;
      
      public var saveVersion:int;
      
      public var saveName:String;
      
      public var saveContent:SaveContent;
      
      public var run:CombatAbility;
      
      public var quakeText:String;
      
      public var powerThroughAb:CombatAbility;
      
      public var physicalAbilities:Array;
      
      public var miscAbilities:Array;
      
      public var magicSpells:Array;
      
      public var magicAbilities:Array;
      
      public var globalSave:Boolean;
      
      public var flurryAmount:int;
      
      public var fireMagicLastTurn:int;
      
      public var fireMagicCumulated:int;
      
      public var fantasize:CombatAbility;
      
      public var distanceSelfAb:CombatAbility;
      
      public var currDamage:Number;
      
      public var attackAb:CombatAbility;
      
      public var approachSelf:CombatAbility;
      
      public var allAbilities:Array;
      
      public var abilityTarget:Monster;
      
      public function CombatAbilities()
      {
         if(Boot.skip_constructor)
         {
            return;
         }
         quakeText = "";
         flurryAmount = 1;
         globalSave = false;
         saveVersion = 1;
         saveName = "combatAbilities";
         saveContent = new SaveContent(null);
         currDamage = 0;
         fireMagicCumulated = 0;
         fireMagicLastTurn = -100;
         miscAbilities = [];
         unarmedStances = [];
         magicAbilities = [];
         physicalAbilities = [];
         magicSpells = [];
         allAbilities = [];
         super();
         SelfSaver.register(this);
      }
      
      public function witherChance() : Number
      {
         return standardStatComparison(get_player().get_inte(),(get_monster().get_inteRescaled() + get_monster().get_touRescaled()) / 2,-10);
      }
      
      public function wither() : void
      {
         outputText("你举起拳头放在嘴边，集中精神，在其中引导治愈能量。你的手闪耀着清澈纯净的魔法光芒，但你却对着它低语亵渎的咒语，彻底扭曲了这个法术！你的手闪烁着紫黑色的光环，你向[themonster]发射了这个法术！");
         if(Utils.rand(100) <= witherChance())
         {
            outputText("\n法术击中了你的[themonster]，[monster.he]没能抵抗！亵渎的妖术流经[monster.his]的身体，将任何治疗效果腐化为伤害！");
            get_monster().addStatusEffect(new WitheringDebuff(int(1 + Math.round(get_player().spellMod() * 2))));
         }
         else
         {
            outputText("\n法术击中了[themonster]，但[monster.he]设法凝聚了足够的精神毅力来反弹效果，将其完全抵消！");
         }
         get_combat().startMonsterTurn();
      }
      
      public function whiteFireDamage(param1:Boolean = false, param2:Boolean = false) : Number
      {
         var _loc3_:Number = int((10 + (get_player().get_inte() / 3 + (param1 ? 0 : Utils.rand(get_player().get_inte() / 2))) + (param2 ? get_player().get_inte() / 2 : 0)) * get_player().spellMod());
         _loc3_ = calcInfernoMod(_loc3_);
         _loc3_ = Math.round(_loc3_ * get_monster().get_fireRes());
         return get_combat().globalMod(_loc3_);
      }
      
      public function whipTripChance() : Number
      {
         return get_monster().standardDodgeFunc(get_player(),-10);
      }
      
      public function whipTrip() : void
      {
         outputText("你对[themonster]试图逃跑的举动反应迅速，将你的[weapon]砸在地上，然后迅速向[themonster]挥去！");
         if(Boolean(combatAvoidDamage(new AvoidDamageParameters(true,false,false,null,null,whipTripChance(),null,null)).attackHit))
         {
            outputText("\n你抓住了[monster.his]腿，阻止了[monster.him]的脚步！你用力一拉，让[monster.him]绊倒，脸朝下摔在地上！[Monster.he]很快就挣脱了，但[monster.he]显然有些头晕目眩，失去了平衡！");
            get_monster().addStatusEffect(new Tripped());
         }
         else
         {
            outputText("\n你没能抓住[themonster]，[monster.he]设法拉开了与你的距离！");
            get_combatRangeData().moveMonsterDistant(get_monster());
         }
         get_combat().execMonsterAI(get_combat().currMonsterIndex + 1);
      }
      
      public function webbingCost() : int
      {
         var _loc1_:int = 33;
         if(get_player().hasPerk(PerkLib.NaturalWeapons))
         {
            _loc1_ = 25;
         }
         return _loc1_;
      }
      
      public function vineTrip() : void
      {
         outputText("你对[themonster]试图逃跑的举动反应迅速，将藤蔓在地上抽打得啪啪作响，然后迅速向[themonster]甩去！");
         if(Boolean(combatAvoidDamage(new AvoidDamageParameters(true,false,false,null,null,whipTripChance(),null,null)).attackHit))
         {
            outputText("\n你抓住了[monster.his]腿，阻止了[monster.him]的脚步！你用力一拉，让[monster.him]绊倒，脸朝下摔在地上！[Monster.he]很快就挣脱了，但[monster.he]显然有些头晕目眩，失去了平衡！");
            get_monster().addStatusEffect(new Tripped());
            if(get_monster().bleed(get_player()))
            {
               outputText("");
            }
         }
         else
         {
            outputText("\n你没能抓住[themonster]，[monster.he]设法拉开了与你的距离！");
            get_combatRangeData().moveMonsterDistant(get_monster());
         }
         get_combat().execMonsterAI(get_combat().currMonsterIndex + 1);
      }
      
      public function vineGrab() : void
      {
         var newRound1:Boolean;
         var _g1:Combat;
         var newRound:Boolean;
         var _g:Combat;
         var _loc1_:* = null as Monster;
         clearOutput();
         if(get_monster().get_plural())
         {
            outputText("敌人太多了。");
            menu();
            _g = get_combat();
            newRound = false;
            addButton(0,"继续",function():void
            {
               _g.combatMenu(newRound);
            });
            return;
         }
         if(get_monster().get_short() == "pod")
         {
            outputText("你无法抓住困住你的东西！");
            menu();
            _g1 = get_combat();
            newRound1 = false;
            addButton(0,"继续",function():void
            {
               _g1.combatMenu(newRound1);
            });
            return;
         }
         if(get_monster().hasStatusEffect(StatusEffects.Concentration))
         {
            outputText("艾米莉完全专注于你的动作，轻松地滑步避开了你的攻击。");
            get_combat().startMonsterTurn();
            return;
         }
         if(get_monster() is VolcanicGolem)
         {
            if(get_monster().hasStatusEffect(StatusEffects.VolcanicFistProblem))
            {
               outputText("\n看到魔像的手臂半埋在地下，你决定用藤蔓缠住它，用尽全力拉扯，一边忍受着灼热的高温一边退缩。\n");
               if(get_player().get_str() > 80 && !get_monster().hasStatusEffect(StatusEffects.VolcanicFrenzy))
               {
                  outputText("\n你使出非人的力量，硬生生扯下了魔像的手臂！这具构装体踉跄后退，岩浆从它断臂的接口处喷涌而出。它似乎感觉不到疼痛，但你确信它现在的物理攻击威力肯定大打折扣了！\n");
                  get_monster().createStatusEffect(StatusEffects.VolcanicWeapRed,3,0,0,0);
                  _loc1_ = get_monster();
                  _loc1_.set_weaponAttack(_loc1_.get_weaponAttack() - 40);
                  if(get_monster().get_weaponAttack() <= 0)
                  {
                     get_monster().set_weaponAttack(10);
                  }
               }
               else
               {
                  outputText("\n你的力量不足以抗衡魔像的怪力。在它反击之前，你赶紧松开了藤蔓。");
               }
            }
            else
            {
               outputText("你刚想抓住魔像，就被它一把拍飞了。");
            }
            get_combat().startMonsterTurn();
            return;
         }
         if(Utils.randomChance(grabChance()))
         {
            if(get_monster().get_short() == "demons")
            {
               outputText("你扫视了一圈人群，盘算着该把谁捆起来。你的目光落在了恶魔群中一个倒霉蛋身上。趁着恶魔们向你逼近，你迅速在它们之间穿梭，将藤蔓射向选定的猎物。你一把将他从怪物海中拽了出来，用长满尖刺的藤蔓将他死死缠住，然后用力收紧。听着他欢愉的咆哮变成痛苦的哀嚎，你咧嘴笑了起来。");
            }
            else
            {
               outputText("你猛地将藤蔓甩向[themonster]，长满尖刺的藤蔓死死缠住了[monster.his]身体。你用力一拽，将[monster.him]拉向自己。");
               if(get_monster() is Dullahan)
               {
                  outputText("[pg]眼看无路可逃，无头骑士在你的束缚下猛地向后仰去，然后用力向前一甩。她的头颅从躯干上飞出，直直地落在你的肩膀上，开始拼命撕咬你的血肉！");
                  get_player().takeDamage(10,true);
                  if(get_player().get_HP() <= 0)
                  {
                     doNext(get_combat().endHpLoss);
                     return;
                  }
               }
            }
            get_monster().addStatusEffect(new ConstrictedDebuff(vineConstrict,nagaLeggoMyEggo,1 + Utils.rand(3),"你的猎物在藤蔓中拼命推搡、扭动、挣扎，试图逃脱你的束缚。","[Themonster]的力量超出了藤蔓的承受极限，挣脱了你紧紧缠绕的触须。","尽管[themonster]拼命挣扎，你依然死死地缠住[monster.him]。"));
            get_game().combatRangeData.closeDistance(get_monster());
            if(get_monster().bleed(get_player(),1,0.5))
            {
               outputText("");
            }
         }
         else
         {
            if(!get_monster().hasPerk(PerkLib.Juggernaut))
            {
               outputText("你向对手射出藤蔓，试图将[monster.him]缠住。还没等你靠近，[themonster]就跳开了，让你完全扑了个空。你迅速收回藤蔓，重新摆好架势。");
            }
            else
            {
               outputText("你向对手射出藤蔓，试图将[monster.him]缠住。你拼尽全力想把[monster.him]困在你的掌控之中，但[monster.he]简直就是个不可阻挡的庞然大物！[monster.he]强行挣脱了你的束缚，震得你连连后退。");
            }
            if(get_player().get_HP() <= 0)
            {
               doNext(get_combat().endHpLoss);
               return;
            }
         }
         outputText("[pg]");
         get_combat().startMonsterTurn();
      }
      
      public function vineConstrict() : void
      {
         var newRound:Boolean;
         var _g:Combat;
         clearOutput();
         if(get_player().get_fatigue() + get_player().physicalCost(10) > get_player().maxFatigue())
         {
            outputText("你太累了，无法缠住[themonster]。");
            _g = get_combat();
            newRound = false;
            addButton(0,"继续",function():void
            {
               _g.combatMenu(newRound);
            });
            return;
         }
         get_player().changeFatigue(10,2);
         var _loc1_:int = int(get_monster().maxHP() * (0.1 + Utils.rand(15) / 100));
         outputText("黑曜石藤蔓猛地收紧，深深勒进[themonster]的血肉之中。");
         get_combat().doDamage(_loc1_,true,true);
         if(get_monster().bleed(get_player(),1,1.5))
         {
            outputText("");
         }
         if(get_monster().get_HP() < 1)
         {
            outputText("你能感觉到[themonster]的生命体征开始减弱，在彻底挤碎[monster.his]生机之前，你松开了手，任由[monster.him]瘫倒在地，虽然昏迷不醒，但好歹还活着。没过多久，[monster.his]眼皮就开始跳动，你毫不怀疑[monster.he]很快就会醒来。");
            if(get_monster().get_short() == "demons")
            {
               outputText("其他人见状赶紧后退，一想到你可能会对他们做出的事情就感到恐惧。");
            }
            outputText("[pg]");
            doNext(get_combat().endHpVictory);
            return;
         }
         if(get_monster() is Dullahan)
         {
            outputText("[pg]尽管你拼尽全力，无头骑士依然死死咬住你的肩膀不放！");
            get_player().takeDamage(10,true);
            if(get_player().get_HP() <= 0)
            {
               doNext(get_combat().endHpLoss);
               return;
            }
         }
         outputText("[pg]");
         get_combat().startMonsterTurn();
      }
      
      public function upheavalCalc(param1:Boolean = false, param2:Boolean = false) : Number
      {
         var _loc3_:Number = int(get_player().get_str() + (get_player().get_spe() * 0.2 + get_player().level * 2));
         if(_loc3_ < 0)
         {
            _loc3_ = 5;
         }
         if(_loc3_ > get_player().level * 10 + 100)
         {
            _loc3_ = get_player().level * 10 + 100;
         }
         if(_loc3_ > 0)
         {
            _loc3_ *= get_player().physMod();
            _loc3_ = get_combat().bodyMod(_loc3_);
            _loc3_ = get_combat().globalMod(_loc3_);
         }
         if(param1)
         {
            return get_monster().reduceDamageMin(_loc3_);
         }
         if(param2)
         {
            return get_monster().reduceDamageMax(_loc3_);
         }
         return get_monster().reduceDamageCombat(_loc3_);
      }
      
      public function upheavalAttack() : void
      {
         clearOutput();
         if(get_monster().get_short() == "worms")
         {
            outputText("利用你新获得的天然武器，你迅速向这个畸形的怪物冲去。感觉到迫在眉睫的危险，这怪物主动散开了身体，导致这团蠕虫伴随着令人作呕的湿润“砰”声落到地上，让你的角只刺中了空气。[pg]");
            get_combat().startMonsterTurn();
            return;
         }
         get_combat().damageType = "PhysicalM";
         if(goreChance() > Utils.rand(100))
         {
            currDamage = upheavalCalc();
            outputText("你低下头向敌人猛扑过去，然后猛地抬起头，每一块肌肉都在用力，将你的敌人击飞。");
            if(get_combat().combatCritical(get_player(),get_monster()))
            {
               outputText("[b:暴击！]");
               currDamage *= 1.75;
            }
            if(currDamage > 0)
            {
               currDamage = get_combat().doDamage(currDamage,true,true);
            }
            outputText("[pg]");
         }
         else if(get_monster().get_short() == "Vala")
         {
            outputText("你低下头向瓦拉冲去，但她只是飞得更高，在你靠近时抓住了你的角，并将她多汁、芳香的小穴蹭在你的鼻子上。那感官上的气味和她兴奋的呻吟让你愣了一下，让她得以继续把你当作自慰辅助工具，但她很快就厌倦了这样的前戏，眨了眨眼飞了回去。[pg]");
            dynStats(DynStat.Lust(5));
         }
         else
         {
            outputText("你低下头向敌人猛扑过去，然后猛地抬起头，却只击中了空气。");
         }
         outputText("[pg]");
         get_combat().startMonsterTurn();
      }
      
      public function updateCooldowns() : void
      {
         var _loc3_:* = null as CombatAbility;
         var _loc1_:int = 0;
         var _loc2_:Array = allAbilities;
         while(_loc1_ < int(_loc2_.length))
         {
            _loc3_ = _loc2_[_loc1_];
            _loc1_++;
            if(_loc3_.currCooldown < _loc3_.cooldown && _loc3_.cooldown != 0)
            {
               _loc3_.currCooldown += 1;
            }
         }
      }
      
      public function unleashBrood() : void
      {
         clearOutput();
         if(get_monster() is EncapsulationPod)
         {
            outputText("在这个狭小的豆荚里，这种攻击毫无用处！");
            get_combat().startMonsterTurn();
            return;
         }
         if(get_monster() is TentacleBeast)
         {
            outputText("这只可怕的触手怪很感激你为它提供了如此美味的零食！它现在太活泼了，这种攻击无法成功。");
            get_combat().startMonsterTurn();
            return;
         }
         if(get_monster().hasStatusEffect(StatusEffects.Shell))
         {
            outputText("当你的子嗣接触到[themonster]周围五颜六色的岩壳时，它们发出嘶嘶声并被烤焦，痛苦地尖叫着，然后退回你体内疗伤，没有产生任何效果。不管那是什么东西，它完全阻挡了你的子嗣！");
            get_combat().startMonsterTurn();
            return;
         }
         outputText("你张开双腿，一股长着羽毛、黏糊糊的触手从你的[vagina]中扑通一声掉了出来，蜂拥向[themonster]，试图麻痹[monster.him]，以便它们能把[monster.him]拉进你的子宫。");
         get_combat().damageType = "PhysicalR";
         currDamage = broodBiteCalc();
         if(currDamage <= 0)
         {
            currDamage = 0;
            outputText("你子嗣的撕咬被[themonster]挡住了。");
         }
         else if(currDamage < 10)
         {
            outputText("你子嗣的啃咬对[themonster]造成的伤害微乎其微！");
         }
         else if(currDamage < 20)
         {
            outputText("你子嗣的啃咬严重地伤到了[themonster]！");
         }
         else if(currDamage < 30)
         {
            outputText("你子嗣的啃咬让[themonster]踉跄了一下。");
         }
         else
         {
            outputText("你子嗣强力的啃咬[b:重创]了[themonster]！");
         }
         currDamage = get_combat().doDamage(currDamage,true,true);
         if(get_monster().bleed(get_player()))
         {
            outputText("[pg-][Themonster]身上被你饥饿的孩子们咬出了许多血洞，[monster.he]流血不止，它们正试图将[monster.him]活活吃掉。");
         }
         else if(get_monster() is LivingStatue)
         {
            outputText("尽管你蜂拥而至的孩子们在雕像坚硬的外表上撕开了裂口，但它并没有流血。");
         }
         if(!get_monster().hasStatusEffect(StatusEffects.NephilaCompulsion))
         {
            outputText("[Themonster]努力抵抗着饥饿史莱姆的浪潮，但它们陷入了狂乱，[themonster][if (monster.plural) {}] [monster.is]受到了极大的阻碍。");
            get_monster().createStatusEffect(StatusEffects.NephilaCompulsion);
         }
         else if(get_monster().get_spe() <= 1)
         {
            if(get_monster().get_plural())
            {
               outputText("[pg][Themonster]完全被寄生虫覆盖了。尽管[monster.he]拼命挣扎哀嚎，却无法阻止蠕动的触手造成[b:巨大的伤害！]");
            }
            else
            {
               outputText("[pg][Themonster]完全被寄生虫覆盖了。在触手浪潮的拖拽下，[monster.he]被拉倒在地，并被拖向你的[vagina]。触手将[monster.him]塞进你极度肿胀的小穴，让你的肚子因为新装入的猎物而高高隆起。无论你的受害者在你的肚子里遭遇了什么，那都意味着[b:巨大的伤害！]之后，为了防止[monster.his]依然充满活力的挣扎伤到你宝贵的子宫，你在一阵粘液和触手的浪潮中将[monster.him]从你大张的爱之穴中喷射了出去。");
            }
         }
         else
         {
            if(get_monster().get_plural())
            {
               outputText("[pg][Themonster]努力抵抗着饥饿史莱姆的浪潮。[Monster.he]被撞倒并被拖向你片刻，但最终还是设法稳住了[monster.himself]。");
            }
            else
            {
               outputText("[pg][Themonster]努力抵抗着饥饿史莱姆的浪潮。[Monster.he]被撞倒并被拖向你片刻，但最终还是设法稳住了[monster.himself]。[pg]");
            }
            get_monster().dynStats(DynStat.Spe(-30));
         }
         get_combat().startMonsterTurn();
      }
      
      public function tripleHit(param1:Number) : void
      {
         shootArrow(param1,true,true);
         shootArrow(param1,true,false);
         shootArrow(param1,true,false);
      }
      
      public function tkBlastCalc(param1:Boolean = false, param2:Boolean = false) : Number
      {
         var _loc3_:Number = int(15 + (get_player().get_inte() / 2 + (param1 ? 0 : Utils.rand(get_player().get_inte() / 2)) + (param2 ? get_player().get_inte() / 2 : 0)) * get_player().spellMod() * calcGrayMagicMod());
         _loc3_ = get_combat().globalMod(_loc3_);
         if(param1)
         {
            return get_monster().reduceDamageMin(_loc3_);
         }
         if(param2)
         {
            return get_monster().reduceDamageMax(_loc3_);
         }
         return get_monster().reduceDamageCombat(_loc3_);
      }
      
      public function tfXP(param1:int, param2:Number = 1) : void
      {
         var _loc3_:int = int(Math.round((10 / (1 + Math.max(0,get_player().masteryLevel(MasteryLib.TerrestrialFire) - param1)) + param1 * 2) * param2));
         _loc3_ = Utils.randBetween(_loc3_ / 2,_loc3_ * 1.5);
         var _loc4_:int = FlagDict_Impl_.arrayReadInt(KFLAGS.flags,2715);
         if((_loc4_ & 0x40) == 0)
         {
            _loc3_ = int(Math.max(1,_loc3_ / 5));
         }
         get_player().masteryXP(MasteryLib.TerrestrialFire,_loc3_);
      }
      
      public function tfTerraStarCalc(param1:String = undefined) : int
      {
         if(param1 == null)
         {
            param1 = "default";
         }
         var _loc2_:int = int(Math.min(get_player().level,20));
         var _loc3_:Number = 3;
         var _loc4_:Number = 600;
         var _loc5_:Number = 4 / (1 / (_loc2_ * 5) + 1 / get_player().get_str() + 1 / get_player().get_inte() + 1 / (tfSpellMod(true) * 50)) * get_player().masteryLevel(MasteryLib.TerrestrialFire);
         _loc5_ = Math.pow(_loc5_,_loc3_) * Math.pow(_loc4_,1 - _loc3_);
         var _loc6_:String = param1;
         if(_loc6_ == "max")
         {
            _loc5_ *= 1.2;
            _loc5_ = get_monster().reduceDamageMax(_loc5_,70);
         }
         else if(_loc6_ == "min")
         {
            _loc5_ *= 0.8;
            _loc5_ = get_monster().reduceDamageMin(_loc5_,70);
         }
         else
         {
            _loc5_ *= Utils.randBetween(80,120) / 100;
            _loc5_ = get_monster().reduceDamageCombat(_loc5_,70);
         }
         return int(Math.round(_loc5_));
      }
      
      public function tfTerraStarAttack(param1:Boolean = false) : void
      {
         var bonusDamage:int;
         var _gthis:CombatAbilities;
         var _loc14_:* = null as Function;
         _gthis = this;
         currDamage = tfTerraStarCalc();
         bonusDamage = 0;
         var _loc2_:Number = get_player().get_inte() / (get_player().get_str() + get_player().get_inte());
         var _loc3_:int = param1 ? 3 : 2;
         var _loc4_:Array = ["nothing","nothing"];
         var _loc5_:Boolean = false;
         var _loc6_:int = -1;
         var _loc7_:int = param1 ? 100 : 50;
         var _loc8_:Boolean = false;
         if(param1)
         {
            clearOutput();
            get_player().changeStatusValue(StatusEffects.TFTerraStar,1,1);
            _loc4_ = _loc4_.concat(["stun","double","flare","pulse"]);
            outputText("你集中精力引导微型恒星的运动。");
         }
         var _loc9_:* = combatAvoidDamage(new AvoidDamageParameters(true,true,true,null,null,tfTerraStarAccuracy(param1),null,null));
         if(_loc9_.dodge != null)
         {
            if(Utils.rand(100) < tfTerraStarAccuracy(param1))
            {
               currDamage *= _loc2_ * 0.25;
               _loc2_ = 1;
               outputText("[pg]翡翠之星迅速飞向[themonster]，虽然勉强避开，但高温仍让[monster.him]感到疲惫和痛苦。");
            }
            else
            {
               currDamage *= 0;
               _loc2_ = 1;
               _loc3_ -= 2;
               outputText("[pg]翡翠之星迅速飞向[themonster]，但被轻易躲开了。");
            }
         }
         else if(Boolean(_loc9_.parry))
         {
            currDamage *= _loc2_ * 0.4;
            _loc2_ = 1;
            _loc3_++;
            outputText("[pg][Themonster]设法偏转了恒星，避免了直接命中，但消耗的体力和与火焰的近距离接触仍然让[monster.him]筋疲力尽。");
            _loc5_ ||= Utils.rand(100) < 50;
         }
         else if(Boolean(_loc9_.block))
         {
            currDamage *= _loc2_ * 0.6;
            _loc2_ = 1;
            _loc3_ += 2;
            outputText("[pg][Themonster]举起[monster.his]盾牌，在翡翠之星冲向[monster.him]时站稳脚跟。盾牌吸收了大部分冲击力，但[themonster]仍被这一击打得踉跄，火焰越过了盾牌。");
            _loc6_++;
         }
         else
         {
            outputText("[pg]翡翠之星划破长空，火焰汹涌澎湃，以粉碎骨头的力量撞击在[themonster]身上！");
         }
         var _loc10_:Number = 1 + (get_monster().get_fireRes() - 1) * _loc2_;
         currDamage = get_combat().doDamage(currDamage * _loc10_,true,true);
         get_monster().changeFatigue(_loc3_);
         if(_loc5_)
         {
            get_monster().createOrFindStatusEffect(StatusEffects.TFTerraStarWeaken).increase();
            outputText("[pg-][Themonster]在招架了恒星之后似乎变弱了。");
         }
         var _loc11_:Array = _loc4_;
         var _loc12_:String = _loc11_[Utils.rand(int(_loc11_.length))];
         if(_loc12_ == "stun")
         {
            _loc6_++;
         }
         if(_loc6_ >= 0 && get_monster().stun(_loc6_,_loc7_))
         {
            outputText("[pg-][Themonster][monster.is]被击晕了！");
         }
         var _loc13_:String = _loc12_;
         if(_loc13_ == "double")
         {
            _loc8_ = true;
         }
         else if(_loc13_ == "flare")
         {
            outputText("[pg-]你的恒星突然爆发出炽热的高温，随后射出无数细丝，犹如火焰长鞭，轰炸整个区域。");
            _loc14_ = function():void
            {
               bonusDamage = _gthis.tfTerraStarCalc() / 3;
               _gthis.outputText("[pg-][Themonster]被璀璨的火焰击中。");
               _gthis.get_combat().doDamage(bonusDamage * _gthis.get_monster().get_fireRes(),true,true);
            };
            allMonsters(_loc14_);
         }
         else if(_loc13_ == "pulse")
         {
            outputText("[pg-]你的恒星短暂地发出耀眼的光芒，强烈的辐射即使闭上眼睛也会感到疼痛。");
            _loc14_ = function():void
            {
               if(!_gthis.get_monster().reactWrapper(ReactionContext.Blinded))
               {
                  return;
               }
               _gthis.outputText("[pg-][Themonster][monster.is]失明了！");
               _gthis.get_monster().createStatusEffect(StatusEffects.Blind,3,0,0,0);
            };
            allMonsters(_loc14_);
         }
         if(_loc8_)
         {
            tfTerraStarAttack(false);
         }
         if(param1)
         {
            get_combat().startMonsterTurn();
         }
      }
      
      public function tfTerraStarAccuracy(param1:Boolean = false) : int
      {
         return int(get_monster().standardDodgeFunc(get_player(),param1 ? -10 : -40));
      }
      
      public function tfTerraStar() : void
      {
         clearOutput();
         outputText("你用一块锯齿状的岩石割破手掌，然后将双手猛地拍在地上，让你的血液浸透震动的大地，同时在胸腔深处聚集火焰。一道深深的裂缝在你面前裂开，你将所有的能量倾注到地下，呼出如洪流般的翡翠色火焰填满裂缝。");
         outputText("[pg]血液迅速从你体内流失，裂缝自行闭合，而你则集中精力压缩困在地下的能量。震动平息下来，纵横交错在战场上的火焰被重新吸收回地下，带来短暂的宁静，直到一个燃烧的球体从你面前的地下爆裂而出，那是一个由璀璨的翡翠色火焰紧紧包裹着坚实土核的球体。[pg-]");
         get_player().set_fatigue(get_player().maxFatigue());
         get_player().HPChange(-get_player().get_HP() / 2,true,true);
         get_player().createStatusEffect(StatusEffects.TFTerraStar);
         get_player().createStatusEffect(StatusEffects.TFTerraStarCooldown);
         get_player().removeStatusEffect(StatusEffects.TFQuake);
         get_player().removeStatusEffect(StatusEffects.TFScorch);
         tfXP(7,3);
         get_combat().startMonsterTurn();
      }
      
      public function tfTerraFlamesExec() : void
      {
         currDamage = tfTerraFlamesCalc();
         outputText("[pg-][Themonster]被翡翠色的火焰所环绕。");
         doFireDamage(currDamage,false);
      }
      
      public function tfTerraFlamesCalc(param1:String = undefined) : Number
      {
         if(param1 == null)
         {
            param1 = "default";
         }
         var _loc2_:int = int(Math.min(get_player().level,30));
         var _loc3_:int = int(get_combat().globalMod(25 + get_player().get_inte() / 2 + (get_player().masteryLevel(MasteryLib.TerrestrialFire) >= 5 ? _loc2_ * 3 : 0)) * tfSpellMod());
         var _loc4_:String = param1;
         if(_loc4_ == "max")
         {
            _loc3_ = get_monster().reduceDamageMax(_loc3_,100);
         }
         else if(_loc4_ == "min")
         {
            _loc3_ = get_monster().reduceDamageMin(_loc3_,100);
         }
         else
         {
            _loc3_ = get_monster().reduceDamageCombat(_loc3_,100);
         }
         return int(Math.round(_loc3_ * get_monster().get_fireRes()));
      }
      
      public function tfTerraFlames() : void
      {
         clearOutput();
         get_combat().damageType = "MagicalR";
         outputText("你双脚稳稳地踩在地上，将能量导入大地，翡翠色的火焰在你的脚边翻滚，地面开始隆隆作响。下一刻，整个战场都在颤抖，地狱之火的炼狱从地下汹涌而出！");
         infernoDisplay();
         allMonsters(tfTerraFlamesExec);
         boostInferno();
         tfXP(6,1.5);
         get_combat().startMonsterTurn();
      }
      
      public function tfTerraCoreRetry() : void
      {
         get_player().removeStatusEffect(StatusEffects.TFTerraCore);
         currDamage = tfTerraCoreCalc();
         outputText("[pg]熔火核心再次尝试，拖着长长的尾迹冲向[themonster]，");
         if(Boolean(combatAvoidDamage(new AvoidDamageParameters(true,false,false,null,null,tfTerraCoreAccuracy(),null,null)).attackFailed))
         {
            outputText("但再次落空，无害地砸在地上，再也没有能量进行下一次攻击了。");
         }
         else
         {
            if(Utils.rand(2) == 0)
            {
               currDamage *= 0.5;
               outputText("撞击在[monster.him]身上时轰然炸裂！不幸的是，在长距离飞行后它失去了一些力量，撞击的威力不如预期。");
            }
            else
            {
               outputText("以惊人的力量撞击在[monster.him]身上！");
            }
            currDamage = get_combat().doDamage(currDamage,true,true);
         }
      }
      
      public function tfTerraCoreCalc(param1:String = undefined) : int
      {
         if(param1 == null)
         {
            param1 = "default";
         }
         var _loc2_:int = int(Math.min(get_player().level,30));
         var _loc3_:int = 0;
         var _loc4_:Number = get_combat().globalMod(25 + get_player().get_inte() / 2 + get_player().get_str() / 2 + (get_player().masteryLevel(MasteryLib.TerrestrialFire) >= 5 ? _loc2_ * 3 : 0)) * tfSpellMod();
         var _loc5_:Number = _loc4_ + get_combat().globalMod(get_player().get_inte() / 3 + get_player().get_str() / 3) * tfSpellMod();
         var _loc6_:String = param1;
         if(_loc6_ == "max")
         {
            _loc3_ = get_monster().reduceDamageMax(_loc5_,30);
         }
         else if(_loc6_ == "min")
         {
            _loc3_ = get_monster().reduceDamageMin(_loc4_,30);
         }
         else
         {
            _loc3_ = get_monster().reduceDamageCombat(Utils.randBetween(_loc4_,_loc5_),30);
         }
         var _loc7_:Number = 1 + (get_monster().get_fireRes() - 1) / 4;
         return int(Math.round(_loc3_ * _loc7_));
      }
      
      public function tfTerraCoreAccuracy() : int
      {
         return int(get_monster().standardDodgeFunc(get_player(),get_player().masteryLevel(MasteryLib.TerrestrialFire) >= 5 ? 0 : -10));
      }
      
      public function tfTerraCore() : void
      {
         clearOutput();
         get_combat().damageType = "PhysicalR";
         currDamage = tfTerraCoreCalc();
         outputText("翠绿色的地狱之火从你的手中盘旋而上。你身体的核心以不屈的岩石形态被召唤出来，并融入了精神。你双臂用力一挥，将这块巨大的地核抛了出去");
         if(Boolean(combatAvoidDamage(new AvoidDamageParameters(true,false,false,null,null,tfTerraCoreAccuracy(),null,null)).attackFailed))
         {
            outputText("飞向[themonster]，但未能击中目标。它继续飞行，划出一道大弧线，准备再次尝试。");
            get_player().createStatusEffect(StatusEffects.TFTerraCore);
         }
         else
         {
            outputText("撞击在[themonster]身上，你狂怒的惊人力量将[monster.him]击退！");
            currDamage = get_combat().doDamage(currDamage,true,true);
         }
         tfXP(6,1.5);
         get_combat().startMonsterTurn();
      }
      
      public function tfSupernovaHit() : void
      {
         currDamage = tfSupernovaCalc();
         currDamage = get_combat().doDamage(currDamage,true,false);
         if(get_monster().get_HP() > 0)
         {
            outputText("[pg-][Themonster][monster.is]受了重伤，但遗憾的是并没有被击败。" + get_combat().getDamageText(currDamage));
         }
      }
      
      public function tfSupernovaExec() : void
      {
         get_player().createOrFindStatusEffect(StatusEffects.TFTerraStarCooldown).setDuration(120);
         get_player().addStatusValue(StatusEffects.TFTerraStarCooldown,2,1);
         get_player().addStatusValue(StatusEffects.TFSupercharging,2,1);
         if(get_silly())
         {
            outputText("你突然踮起脚跟，双臂呈一定角度举起，手掌向外，当你凝视着你自己的太阳牺牲的那一刻，一滴眼泪从你的眼角滑落。");
         }
         outputText("恒星的嗡嗡声达到了顶点。慢慢地，它开始膨胀，直径几乎翻了一倍，然后突然以灾难性的力量爆发。冲击波将大地撕裂，整个区域被火焰、熔岩和坚硬的岩石碎片风暴所覆盖。");
         outputText("[pg]无法抵抗超新星爆发的力量，你烧焦且残缺不全的身体倒在地上，勉强维持着生命。你只能希望你的" + (get_monster().get_plural() || int(get_monsterArray().length) > 1 ? "敌人" : "敌人") + "比你更惨。");
         allMonsters(tfSupernovaHit);
         get_player().set_HP(0);
         tfXP(10,4);
         get_combat().startMonsterTurn();
      }
      
      public function tfSupernovaCalc() : int
      {
         return tfTerraStarCalc() * (10 + Utils.rand(11));
      }
      
      public function tfSupernova() : void
      {
         clearOutput();
         outputText("你和你的恒星都变得静止，当你集中精力在它内部聚集能量时，恒星发出轻柔的嗡嗡声。");
         get_player().createStatusEffect(StatusEffects.TFSupercharging,0,0,0,0);
         get_combat().startMonsterTurn();
      }
      
      public function tfSupercharge() : void
      {
         clearOutput();
         if(get_player().statusEffectv1(StatusEffects.TFSupercharging) >= 2)
         {
            tfSupernovaExec();
         }
         else
         {
            outputText("随着你继续集中注意力，恒星的嗡嗡声变得越来越大，与大地产生共鸣。");
            get_player().addStatusValue(StatusEffects.TFSupercharging,1,1);
            get_combat().startMonsterTurn();
         }
      }
      
      public function tfStoneKnivesExec() : int
      {
         var _loc1_:int = tfStoneKnivesCalc();
         if(Boolean(combatAvoidDamage(new AvoidDamageParameters(true,true,true,null,null,tfStoneKnivesAccuracy(),null,null)).attackHit))
         {
            currDamage += _loc1_;
            return 1;
         }
         return 0;
      }
      
      public function tfStoneKnivesCalc(param1:String = undefined) : int
      {
         if(param1 == null)
         {
            param1 = "default";
         }
         var _loc2_:int = 0;
         var _loc3_:int = int(Math.round(get_combat().globalMod(1 + get_player().get_str() / (30 - 2 * get_player().masteryLevel(MasteryLib.TerrestrialFire))) * tfSpellMod()));
         var _loc4_:int = int(_loc3_ + Math.round(get_combat().globalMod(get_player().get_str() / (30 - 2 * get_player().masteryLevel(MasteryLib.TerrestrialFire))) * tfSpellMod()));
         var _loc5_:String = param1;
         if(_loc5_ == "max")
         {
            _loc2_ = get_monster().reduceDamageMax(_loc4_);
         }
         else if(_loc5_ == "min")
         {
            _loc2_ = get_monster().reduceDamageMin(_loc3_);
         }
         else
         {
            _loc2_ = get_monster().reduceDamageCombat(Utils.randBetween(_loc3_,_loc4_));
         }
         return int(Math.round(_loc2_));
      }
      
      public function tfStoneKnivesAccuracy() : int
      {
         return int(get_monster().standardDodgeFunc(get_player(),-35 + 5 * get_player().masteryLevel(MasteryLib.TerrestrialFire)));
      }
      
      public function tfStoneKnives() : void
      {
         var _loc5_:int = 0;
         var _loc1_:int = Utils.randBetween(5 + 4 * get_player().masteryLevel(MasteryLib.TerrestrialFire),25);
         var _loc2_:int = 0;
         clearOutput();
         get_combat().damageType = "PhysicalR";
         currDamage = 0;
         var _loc3_:int = 0;
         var _loc4_:int = _loc1_;
         while(_loc3_ < _loc4_)
         {
            _loc5_ = _loc3_++;
            _loc2_ += tfStoneKnivesExec();
         }
         outputText("你将手插入地下，向前滑动，然后向上拉起。随着你的手抬起，几十块岩石碎片飞出，用无数把刀子射向你的敌人。");
         if(_loc2_ == 0)
         {
            outputText("[pg-]……但没有一块击中[themonster]。");
         }
         else if(_loc2_ * 2 < _loc1_)
         {
            outputText("[pg-][Themonster]设法避开了大部分碎片，" + (currDamage > 5 ? "只有 " + Utils.num2Text(_loc2_) + " 块击中了目标。" : "而那些击中目标的碎片似乎并没有造成任何实质性的伤害。"));
         }
         else
         {
            outputText("[pg-][Themonster]被 " + Utils.num2Text(_loc2_) + " 块石头碎片击中" + (currDamage > 5 ? "。" : "，但似乎毫发无损。"));
         }
         currDamage = get_combat().doDamage(currDamage,true,true);
         tfXP(3);
         get_combat().startMonsterTurn();
      }
      
      public function tfSpoutCalc(param1:String = undefined) : Number
      {
         if(param1 == null)
         {
            param1 = "default";
         }
         var _loc2_:int = 0;
         var _loc3_:Number = calcInfernoMod(get_combat().globalMod(5 * get_player().masteryLevel(MasteryLib.TerrestrialFire) + get_player().get_inte() / 2)) * tfSpellMod();
         var _loc4_:Number = _loc3_ + calcInfernoMod(get_combat().globalMod(get_player().get_inte() * get_player().masteryLevel(MasteryLib.TerrestrialFire) / 10)) * tfSpellMod();
         var _loc5_:String = param1;
         if(_loc5_ == "max")
         {
            _loc2_ = get_monster().reduceDamageMax(_loc4_,90);
         }
         else if(_loc5_ == "min")
         {
            _loc2_ = get_monster().reduceDamageMin(_loc3_,90);
         }
         else
         {
            _loc2_ = get_monster().reduceDamageCombat(Utils.randBetween(_loc3_,_loc4_),90);
         }
         return int(Math.round(_loc2_ * get_monster().get_fireRes()));
      }
      
      public function tfSpout() : void
      {
         clearOutput();
         get_combat().damageType = "MagicalR";
         currDamage = tfSpoutCalc();
         outputText("你的双手紧紧抓住地面，发出阵阵光波。几秒钟后，翠绿色的螺旋吞噬了[themonster]！");
         doFireDamage(currDamage);
         tfXP(2);
         get_combat().startMonsterTurn();
      }
      
      public function tfSpellMod(param1:Boolean = false) : Number
      {
         return 1 + (get_player().spellMod(param1) - 1) * get_player().masteryLevel(MasteryLib.TerrestrialFire) / 10;
      }
      
      public function tfShell() : void
      {
         get_player().createStatusEffect(StatusEffects.TFShell);
         clearOutput();
         outputText("你压低身子，你的岩石护甲密度和重量都在增加，将你锁在一个保护壳中。");
         tfXP(3);
         get_combat().startMonsterTurn();
      }
      
      public function tfScorchCheck() : void
      {
         if(get_player().hasStatusEffect(StatusEffects.TFScorch))
         {
            outputText("[pg-]覆盖战场的灼热火焰在[monster.him]经过时烧伤了[monster.him]。");
            get_combat().doDamage(tfScorchCalc(),true,true);
         }
      }
      
      public function tfScorchCalc(param1:String = undefined) : int
      {
         if(param1 == null)
         {
            param1 = "default";
         }
         var _loc2_:int = 0;
         var _loc3_:Number = calcInfernoMod(get_combat().globalMod(5 + 2 * get_player().masteryLevel(MasteryLib.TerrestrialFire) + get_player().get_inte() / 4)) * tfSpellMod();
         var _loc4_:Number = _loc3_ + calcInfernoMod(get_combat().globalMod(get_player().get_inte() * get_player().masteryLevel(MasteryLib.TerrestrialFire) / 15)) * tfSpellMod();
         var _loc5_:String = param1;
         if(_loc5_ == "max")
         {
            _loc2_ = get_monster().reduceDamageMax(_loc4_,90);
         }
         else if(_loc5_ == "min")
         {
            _loc2_ = get_monster().reduceDamageMin(_loc3_,90);
         }
         else
         {
            _loc2_ = get_monster().reduceDamageCombat(Utils.randBetween(_loc3_,_loc4_),90);
         }
         return int(Math.round(_loc2_ * get_monster().get_fireRes()));
      }
      
      public function tfScorch() : void
      {
         clearOutput();
         outputText("高举双臂，魔法火焰的编织成为一门艺术；你在战场上涂抹出一片片灼热的翠绿火焰。所有敢于踏入你新神圣领地的人都将燃烧并屈服于你的力量！");
         get_player().createStatusEffect(StatusEffects.TFScorch,0,0,0,0);
         boostInferno();
         tfXP(3);
         get_combat().startMonsterTurn();
      }
      
      public function tfQuakeExec(param1:Monster = undefined, param2:Boolean = true) : Boolean
      {
         get_combat().damageType = "MagicalR";
         currDamage = tfQuakeCalc();
         var _loc3_:int = (5 + get_player().masteryLevel(MasteryLib.TerrestrialFire)) * (param2 ? 1 : 5);
         var _loc4_:int = 0;
         var _loc5_:Boolean = false;
         if(get_monster() == param1)
         {
            currDamage *= 1.5;
            if(param2)
            {
               _loc3_ *= 2;
            }
            else
            {
               _loc3_ = 100;
               _loc4_++;
            }
         }
         if(get_monster().stun(_loc4_,_loc3_))
         {
            quakeText += "[pg-][Themonster]被地震震晕了！";
            _loc5_ = true;
         }
         else
         {
            quakeText += "[pg-][Themonster]勉强站稳了脚跟。";
         }
         currDamage = get_combat().doDamage(currDamage,true,false);
         quakeText += get_combat().getDamageText(currDamage);
         return _loc5_;
      }
      
      public function tfQuakeCalc(param1:String = undefined) : int
      {
         if(param1 == null)
         {
            param1 = "default";
         }
         var _loc2_:int = 0;
         var _loc3_:Number = get_player().get_str() / 10;
         var _loc4_:Number = Math.max(_loc3_,get_combat().globalMod(5 * get_player().masteryLevel(MasteryLib.TerrestrialFire)) * tfSpellMod());
         var _loc5_:String = param1;
         if(_loc5_ == "max")
         {
            _loc2_ = get_monster().reduceDamageMax(_loc4_);
         }
         else if(_loc5_ == "min")
         {
            _loc2_ = get_monster().reduceDamageMin(_loc3_);
         }
         else
         {
            _loc2_ = get_monster().reduceDamageCombat(Utils.randBetween(_loc3_,_loc4_));
         }
         return int(Math.round(_loc2_));
      }
      
      public function tfQuakeAftershocks() : void
      {
         var _g:CombatAbilities;
         quakeText = "[pg]地震的余震在开裂的大地上隆隆作响。";
         get_combat().damageType = "MagicalR";
         _g = this;
         allMonsters(function():Boolean
         {
            return _g.tfQuakeExec();
         });
         outputText(quakeText);
      }
      
      public function tfQuake() : void
      {
         var mainTarget:Monster;
         var didStun:Boolean;
         var _gthis:CombatAbilities = this;
         get_player().createStatusEffect(StatusEffects.TFQuake);
         clearOutput();
         quakeText = "";
         didStun = false;
         mainTarget = get_monster();
         allMonsters(function():void
         {
            didStun ||= _gthis.tfQuakeExec(mainTarget,false);
         });
         outputText("你将双臂猛击地面，在战场上引发震颤和细密的裂纹网，");
         if(didStun)
         {
            outputText("将你的敌人" + (int(get_combat().getActiveEnemies().length) > 1 ? "绊倒" : "[if (monster.plural) {们}]绊倒") + "在破碎的地面上。");
         }
         else
         {
            outputText("除了恐吓之外，几乎没有取得任何效果。");
         }
         outputText(quakeText);
         tfXP(2);
         get_combat().startMonsterTurn();
      }
      
      public function tfPlateCalc() : int
      {
         return int(Math.round(get_player().get_str() / (25 - 2 * get_player().masteryLevel(MasteryLib.TerrestrialFire)) * tfSpellMod()));
      }
      
      public function tfPlate() : void
      {
         get_player().createStatusEffect(StatusEffects.TFPlate,tfPlateCalc(),0,0,0);
         clearOutput();
         outputText("你的身体与大地产生共鸣，在你的血肉周围召唤出岩石板。");
         tfXP(1);
         get_combat().startMonsterTurn();
      }
      
      public function tfMoltenPlateDesc() : String
      {
         var _loc1_:String = "";
         if(get_player().hasStatusEffect(StatusEffects.TFPlate))
         {
            _loc1_ = "将火焰注入你的武器和土系护甲，增加你的攻击伤害 " + get_combat().colorText(DamageColor.Damage,"" + tfInflameCalc("damage")) + " 并伤害靠得太近的敌人。";
         }
         else
         {
            _loc1_ = "用石头覆盖你燃烧的身体，融合土与火，增加你的护甲 " + get_combat().colorText(DamageColor.Heal,"" + tfPlateCalc()) + " 并伤害靠得太近的敌人。";
         }
         return _loc1_ + (" 警告：用熔岩覆盖身体确实有其缺点。" + tfComboList("Molten Plate"));
      }
      
      public function tfMoltenPlateCalc(param1:String = undefined) : int
      {
         if(param1 == null)
         {
            param1 = "damage";
         }
         var _loc2_:Number = (10 + get_player().get_str() * get_player().masteryLevel(MasteryLib.TerrestrialFire) / 50 + get_player().get_inte() * get_player().masteryLevel(MasteryLib.TerrestrialFire) / 50) * tfSpellMod();
         var _loc3_:Number = _loc2_ / 2;
         _loc3_ *= 0.4 + 60 / (100 + get_player().get_tou());
         var _loc4_:Number = 0.5 + Math.random() * 0.5;
         if(param1 == "self")
         {
            return int(Math.round(_loc4_ * _loc3_));
         }
         return int(Math.round(_loc4_ * _loc2_));
      }
      
      public function tfMoltenPlate() : void
      {
         get_player().createOrFindStatusEffect(StatusEffects.TFPlate).value1 = tfPlateCalc();
         get_player().createOrFindStatusEffect(StatusEffects.TFInflame).value1 = tfInflameCalc();
         get_player().createOrFindStatusEffect(StatusEffects.TFInflame).value2 = tfInflameCalc("spellblade");
         get_player().createStatusEffect(StatusEffects.TFMoltenPlate);
         clearOutput();
         if(get_player().hasStatusEffect(StatusEffects.TFPlate))
         {
            outputText("召唤体内的火焰，你护甲板之间的每一道裂缝都开始闪耀出耀眼的绿光，直到火焰溢出到你的[weapon]上。");
         }
         else
         {
            outputText("土系护甲板在你的血肉周围生长，压缩着注入你体内的翠绿火焰。滚烫的黑色石头装饰着你，深绿色从护甲板之间的裂缝中闪耀出来。");
         }
         tfXP(2,2);
         get_combat().startMonsterTurn();
      }
      
      public function tfMeteorShowerExec(param1:Monster, param2:int) : void
      {
         var _loc9_:int = 0;
         set_monster(param1);
         var _loc3_:int = 0;
         var _loc4_:int = 0;
         var _loc5_:int = 0;
         var _loc6_:Boolean = false;
         currDamage = 0;
         var _loc7_:int = 0;
         var _loc8_:int = param2;
         while(_loc7_ < _loc8_)
         {
            _loc9_ = _loc7_++;
            if(Boolean(combatAvoidDamage(new AvoidDamageParameters(true,true,true,null,null,tfMeteorShowerAccuracy(),null,null)).attackHit))
            {
               _loc3_ = int(tfMeteorShowerCalc());
               _loc4_++;
               _loc5_ = 0;
               if(get_monster().isFlying)
               {
                  _loc5_ = Utils.randBetween(1,3);
                  if(_loc4_ + _loc5_ > 4)
                  {
                     _loc6_ = true;
                  }
               }
               _loc4_ += _loc5_;
               currDamage += _loc3_ * (1 + _loc5_);
            }
         }
         if(_loc6_ && get_monster().stun(1,100))
         {
            outputText("[Themonster]在猛攻中燃烧并碎裂，在被" + Utils.numberOfThings(_loc4_,"块石头") + "击中后，痛苦地倒成一团。");
         }
         else if(_loc4_ == 0)
         {
            outputText("\n[Themonster]完全毫发无损地逃脱了流星雨。");
         }
         else
         {
            outputText("\n[Themonster]被 " + Utils.numberOfThings(_loc4_,"块石头") + " 击中" + (currDamage > 5 ? "。" : "，但似乎毫发无损。"));
         }
         currDamage = get_combat().doDamage(currDamage,true,true);
      }
      
      public function tfMeteorShowerCalc(param1:String = undefined) : Number
      {
         if(param1 == null)
         {
            param1 = "default";
         }
         var _loc2_:int = 0;
         var _loc3_:int = int(Math.round(get_combat().globalMod(1 + get_player().get_str() / (30 - 2 * get_player().masteryLevel(MasteryLib.TerrestrialFire))) * tfSpellMod()));
         var _loc4_:int = int(_loc3_ + Math.round(get_combat().globalMod(get_player().get_str() / (30 - 2 * get_player().masteryLevel(MasteryLib.TerrestrialFire))) * tfSpellMod()));
         var _loc5_:String = param1;
         if(_loc5_ == "max")
         {
            _loc2_ = get_monster().reduceDamageMax(_loc4_,30);
         }
         else if(_loc5_ == "min")
         {
            _loc2_ = get_monster().reduceDamageMin(_loc3_,30);
         }
         else
         {
            _loc2_ = get_monster().reduceDamageCombat(Utils.randBetween(_loc3_,_loc4_),30);
         }
         return int(Math.round(_loc2_));
      }
      
      public function tfMeteorShowerAccuracy() : int
      {
         return int(get_monster().standardDodgeFunc(get_player(),-40 + 5 * get_player().masteryLevel(MasteryLib.TerrestrialFire)));
      }
      
      public function tfMeteorShower() : void
      {
         var _loc8_:int = 0;
         var _loc2_:int = Utils.randBetween(10 * get_player().masteryLevel(MasteryLib.TerrestrialFire),50);
         clearOutput();
         get_combat().damageType = "PhysicalR";
         outputText("你将身体猛击在被火焰炙烤的大地上，将双臂深深插入其中。随着土与火的真正交汇，你撕裂大地，将数百块燃烧的石头抛向天空。");
         var _loc3_:Monster = get_monster();
         var _loc4_:Array = get_combat().getActiveEnemies();
         var _loc5_:Array = [];
         var _loc6_:int = 0;
         var _loc7_:int = int(_loc4_.length);
         while(_loc6_ < _loc7_)
         {
            _loc8_ = _loc6_++;
            _loc5_.push(1);
         }
         var _loc9_:Array = _loc5_;
         _loc2_ -= int(_loc4_.length);
         _loc6_ = 0;
         _loc7_ = _loc2_;
         while(_loc6_ < _loc7_)
         {
            _loc8_ = _loc6_++;
            var _temp_2:* = _loc9_;
            var _temp_1:* = Utils.rand(int(_loc9_.length));
            _temp_2[_temp_1] = _loc9_[_temp_1] + 1;
         }
         _loc6_ = 0;
         _loc7_ = int(_loc9_.length);
         while(_loc6_ < _loc7_)
         {
            _loc8_ = _loc6_++;
            tfMeteorShowerExec(_loc4_[_loc8_],int(_loc9_[_loc8_]));
         }
         set_monster(_loc3_);
         tfXP(4,2);
         get_combat().startMonsterTurn();
      }
      
      public function tfInflameCalc(param1:String = undefined) : int
      {
         var _loc5_:Number = NaN;
         if(param1 == null)
         {
            param1 = "damage";
         }
         var _loc2_:Number = (12 + get_player().get_inte() * get_player().masteryLevel(MasteryLib.TerrestrialFire) / 50) * tfSpellMod();
         var _loc3_:Number = _loc2_ * (get_player().spellbladeBonus() - 1);
         var _loc4_:Number = Math.max(get_player().maxHP() * get_player().get_inte() / 5000,_loc2_ / 2);
         _loc4_ *= 0.6 + 40 / (100 + get_player().get_tou());
         var _loc6_:String = param1;
         if(_loc6_ == "damage")
         {
            _loc5_ = _loc2_;
         }
         else if(_loc6_ == "self")
         {
            _loc5_ = _loc4_;
         }
         else if(_loc6_ == "spellblade")
         {
            _loc5_ = _loc3_;
         }
         else if(_loc6_ == "total")
         {
            _loc5_ = _loc2_ + _loc3_;
         }
         else
         {
            _loc5_ = _loc2_;
         }
         return int(Math.round(_loc5_));
      }
      
      public function tfInflameApply() : void
      {
         get_player().createStatusEffect(StatusEffects.TFInflame,tfInflameCalc(),tfInflameCalc("spellblade"));
      }
      
      public function tfInflame() : void
      {
         tfInflameApply();
         clearOutput();
         outputText("你眼中的火焰瞬间明亮起来。刹那间，一缕缕翠绿色的火焰从你的核心溢出，沿着你每一块肌肉的轮廓燃烧，直到滑过你的[weapon]。");
         tfXP(1);
         get_combat().startMonsterTurn();
      }
      
      public function tfGeodeKnuckleDispel() : void
      {
         var newRound:Boolean;
         var _g:Combat;
         clearOutput();
         outputText("当你解除法术时，泥土从你的拳头上脱落。");
         get_player().setUnarmed();
         menu();
         _g = get_combat();
         newRound = false;
         addButton(0,"继续",function():void
         {
            _g.combatMenu(newRound);
         });
      }
      
      public function tfGeodeKnuckle() : void
      {
         clearOutput();
         var _loc1_:Player = get_player();
         _loc1_.set_gems(_loc1_.get_gems() - 10);
         get_combat().damageType = "PhysicalM";
         var _loc2_:Number = 1.3 + 0.35 * (get_player().masteryLevel(MasteryLib.TerrestrialFire) - 3);
         outputText("你的双臂被石头和水晶吞噬，指关节上排列着宝石碎片。带着注入大地的力量，你以狂怒的力量向前猛扑，用你的力量摧残对手！\n");
         var _loc3_:StatusEffect = get_player().createStatusEffect(StatusEffects.TFGeodeKnuckle);
         var _loc4_:Boolean = get_player().get_weapon().isUnarmed();
         var _loc5_:Weapon = get_player().get_weapon();
         get_player().setWeapon(get_weapons().G_KNUCKLE);
         get_combat().performAttack(get_combat().calcWeaponDamage(false) * _loc2_);
         if(!_loc4_)
         {
            get_player().setWeapon(_loc5_);
         }
         tfXP(4);
         get_combat().startMonsterTurn();
      }
      
      public function tfFatigue(param1:Number, param2:int) : Number
      {
         return param1 * (1 - Math.max(0,0.05 * (1 + get_player().masteryLevel(MasteryLib.TerrestrialFire) - param2)));
      }
      
      public function tfEruptionExec() : void
      {
         get_combat().damageType = "MagicalR";
         currDamage = tfEruptionCalc();
         outputText("[pg-][Themonster]被火焰吞噬了！");
         doFireDamage(currDamage,false);
      }
      
      public function tfEruptionCalc(param1:String = undefined) : Number
      {
         if(param1 == null)
         {
            param1 = "default";
         }
         var _loc2_:int = 0;
         var _loc3_:Number = calcInfernoMod(get_combat().globalMod(5 * get_player().masteryLevel(MasteryLib.TerrestrialFire) + get_player().get_inte() / 2)) * tfSpellMod();
         var _loc4_:Number = _loc3_ + calcInfernoMod(get_combat().globalMod(get_player().get_inte() * get_player().masteryLevel(MasteryLib.TerrestrialFire) / 10)) * tfSpellMod();
         var _loc5_:String = param1;
         if(_loc5_ == "max")
         {
            _loc2_ = get_monster().reduceDamageMax(_loc4_,90);
         }
         else if(_loc5_ == "min")
         {
            _loc2_ = get_monster().reduceDamageMin(_loc3_,90);
         }
         else
         {
            _loc2_ = get_monster().reduceDamageCombat(Utils.randBetween(_loc3_,_loc4_),90);
         }
         return int(Math.round(_loc2_ * get_monster().get_fireRes()));
      }
      
      public function tfEruption() : void
      {
         clearOutput();
         outputText("召唤出巨大的翠绿光芒，大地上的裂缝闪烁着光芒，整个战场沐浴在地狱之火中！");
         infernoDisplay();
         allMonsters(tfEruptionExec);
         boostInferno();
         tfXP(3,2);
         get_combat().startMonsterTurn();
      }
      
      public function tfCombod(param1:String) : Boolean
      {
         var _loc2_:String = param1;
         if(_loc2_ == "Inflame")
         {
            if(tfComboReady("Molten Plate") || tfComboReady("Shell"))
            {
               return true;
            }
         }
         else if(_loc2_ == "Molten Plate")
         {
            if(tfComboReady("Shell"))
            {
               return true;
            }
         }
         else if(_loc2_ == "Plate")
         {
            if(tfComboReady("Molten Plate") || tfComboReady("Shell"))
            {
               return true;
            }
         }
         else if(_loc2_ == "Spout")
         {
            if(tfComboReady("Eruption"))
            {
               return true;
            }
         }
         else if(_loc2_ == "Stone Knives")
         {
            if(tfComboReady("Meteor Shower"))
            {
               return true;
            }
         }
         else if(_loc2_ == "Terra Core")
         {
            if(tfComboReady("Terra Star"))
            {
               return true;
            }
         }
         else
         {
            if(_loc2_ != "Terra Flames")
            {
               return false;
            }
            if(tfComboReady("Terra Star"))
            {
               return true;
            }
         }
         return false;
      }
      
      public function tfComboReady(param1:String) : Boolean
      {
         var _loc2_:String = param1;
         if(_loc2_ == "Eruption")
         {
            if(get_player().masteryLevel(MasteryLib.TerrestrialFire) >= 2 && get_player().hasStatusEffect(StatusEffects.TFQuake))
            {
               return true;
            }
         }
         else if(_loc2_ == "Meteor Shower")
         {
            if(get_player().masteryLevel(MasteryLib.TerrestrialFire) >= 3 && get_player().hasStatusEffect(StatusEffects.TFScorch))
            {
               return true;
            }
         }
         else if(_loc2_ == "Molten Plate")
         {
            if(get_player().masteryLevel(MasteryLib.TerrestrialFire) >= 1 && (get_player().hasStatusEffect(StatusEffects.TFInflame) || get_player().hasStatusEffect(StatusEffects.TFPlate)))
            {
               return true;
            }
         }
         else if(_loc2_ == "Shell")
         {
            if(get_player().masteryLevel(MasteryLib.TerrestrialFire) >= 2 && get_player().hasStatusEffect(StatusEffects.TFMoltenPlate))
            {
               return true;
            }
         }
         else if(_loc2_ == "Terra Star")
         {
            if(get_player().masteryLevel(MasteryLib.TerrestrialFire) >= 5 && get_player().hasStatusEffect(StatusEffects.TFMoltenPlate) && get_player().hasStatusEffect(StatusEffects.TFQuake) && get_player().hasStatusEffect(StatusEffects.TFScorch) && get_player().get_str() + get_player().get_inte() >= 150 && tfSpellMod() >= 2)
            {
               return true;
            }
         }
         return false;
      }
      
      public function tfComboList(param1:String) : String
      {
         var _loc2_:String = "\n连击：";
         var _loc3_:String = param1;
         if(_loc3_ == "Inflame")
         {
            if(get_player().masteryLevel(MasteryLib.TerrestrialFire) >= 1)
            {
               _loc2_ += "岩甲";
            }
            else
            {
               _loc2_ = "";
            }
         }
         else if(_loc3_ == "Plate")
         {
            if(get_player().masteryLevel(MasteryLib.TerrestrialFire) >= 1)
            {
               _loc2_ += "引燃";
               if(get_player().masteryLevel(MasteryLib.TerrestrialFire) >= 2)
               {
                  _loc2_ += "，熔岩护甲";
               }
            }
            else
            {
               _loc2_ = "";
            }
         }
         else if(_loc3_ == "Spout")
         {
            if(get_player().masteryLevel(MasteryLib.TerrestrialFire) >= 2)
            {
               _loc2_ += "地震";
            }
            else
            {
               _loc2_ = "";
            }
         }
         else if(_loc3_ == "Stone Knives")
         {
            if(get_player().masteryLevel(MasteryLib.TerrestrialFire) >= 3)
            {
               _loc2_ += "焦土";
            }
            else
            {
               _loc2_ = "";
            }
         }
         else if(_loc3_ == "Terra Core")
         {
            if(get_player().masteryLevel(MasteryLib.TerrestrialFire) >= 5 && Boolean(get_achievements().h[283]))
            {
               _loc2_ = "\n特殊连击：地震 + 焦土 + 熔岩护甲";
            }
            else
            {
               _loc2_ = "";
            }
         }
         else if(_loc3_ == "Terra Flames")
         {
            if(get_player().masteryLevel(MasteryLib.TerrestrialFire) >= 5 && Boolean(get_achievements().h[283]))
            {
               _loc2_ = "\n特殊连击：地震 + 焦土 + 熔岩护甲";
            }
            else
            {
               _loc2_ = "";
            }
         }
         else
         {
            _loc2_ = "";
         }
         return _loc2_;
      }
      
      public function tfCarnalBurnExec() : void
      {
         currDamage = tfCarnalBurnCalc();
         outputText("[pg-][Themonster]被你欲望的火焰烧伤了！");
         doFireDamage(currDamage,false);
      }
      
      public function tfCarnalBurnCalc(param1:String = undefined) : int
      {
         if(param1 == null)
         {
            param1 = "damage";
         }
         var _loc2_:Number = get_player().get_lust100() / 2 * get_player().maxHP() / 100;
         if(param1 == "damage")
         {
            _loc2_ = calcInfernoMod(get_combat().globalMod(_loc2_)) * tfSpellMod();
            _loc2_ = Math.round(get_monster().reduceDamageCombat(_loc2_ * get_monster().get_fireRes(),100));
         }
         return int(_loc2_);
      }
      
      public function tfCarnalBurn() : void
      {
         clearOutput();
         get_combat().damageType = "MagicalR";
         var _loc1_:Boolean = false;
         outputText("你下半身的灼热随着血液流淌，你像召唤火焰一般将其唤起，化作翡翠色的波浪。这股烈焰撕裂你的血肉喷涌而出，直指");
         if(get_player().get_lust100() > 70)
         {
            _loc1_ = true;
            outputText("任何胆敢阻挡你力量的人！");
         }
         else
         {
            outputText("[themonster]被包裹在火球之中！");
         }
         infernoDisplay();
         if(_loc1_)
         {
            allMonsters(tfCarnalBurnExec);
         }
         else
         {
            doFireDamage(tfCarnalBurnCalc());
         }
         get_combat().monsterDamageType = "Fire";
         get_player().takeDamage(tfCarnalBurnCalc("self"),false);
         dynStats(DynStat.Lust(0,DynStatOp.Eq));
         boostInferno();
         tfXP(4);
         get_combat().startMonsterTurn();
      }
      
      public function testResolve2() : void
      {
         var newRound:Boolean;
         var _g:Combat;
         get_game().dungeons.manor.testResolve();
         outputText("[pg]");
         _g = get_combat();
         newRound = false;
         doNext(function():void
         {
            _g.combatMenu(newRound);
         });
      }
      
      public function testResolve() : void
      {
         clearOutput();
         outputText("你拿起护身符，深深地凝视着它。你短暂地瞥见了一些可怕的真相，关于即将到来的末日和超出你理解的启示。当你试图应对你刚刚目睹的恐怖时，你的心智被扭曲了，你踉跄着向后退去。[pg]");
         outputText("你的信念正在经受考验……\n");
         doNext(testResolve2);
      }
      
      public function talismanHealCalc(param1:Boolean = false, param2:Boolean = false) : Number
      {
         if(param1)
         {
            if(param2)
            {
               return (get_player().level * 5 + get_player().get_inte() / 1.5 + get_player().get_inte()) * get_player().spellMod() * 1.5;
            }
            return (get_player().level * 5 + get_player().get_inte() / 1.5) * get_player().spellMod() * 1.5;
         }
         return (get_player().level * 5 + get_player().get_inte() / 1.5 + Utils.rand(get_player().get_inte())) * get_player().spellMod() * 1.5;
      }
      
      public function tailslamcalc(param1:Boolean = false, param2:Boolean = false) : Number
      {
         var _loc3_:Number = int(10 + get_player().get_str() / 1.1);
         if(_loc3_ < 0)
         {
            _loc3_ = 5;
         }
         if(_loc3_ > 0)
         {
            _loc3_ *= get_player().physMod();
            _loc3_ = get_combat().bodyMod(_loc3_);
            _loc3_ = get_combat().globalMod(_loc3_);
         }
         if(param1)
         {
            return get_monster().reduceDamageMin(_loc3_);
         }
         if(param2)
         {
            return get_monster().reduceDamageMax(_loc3_);
         }
         return get_monster().reduceDamageCombat(_loc3_);
      }
      
      public function tailWhipAttack() : void
      {
         var _loc1_:* = null as Monster;
         var _loc2_:int = 0;
         var _loc3_:int = 0;
         clearOutput();
         get_combat().damageType = "PhysicalM";
         if(get_monster() is VolcanicGolem)
         {
            if(get_player().hasStatusEffect(StatusEffects.Blind) && Utils.rand(2) == 0 || get_monster().get_spe() - get_player().get_spe() > 0 && int(Math.random() * ((get_monster().get_spe() - get_player().get_spe()) / 4 + 80)) > 80)
            {
               outputText("你像陀螺一样旋转，挥动着尾巴，却只打中了空气。");
               outputText("[pg]");
               get_combat().startMonsterTurn();
               return;
            }
            outputText("你像陀螺一样旋转，击中了魔像，并在高温变得难以忍受之前，设法拍掉了它的一些装甲板。");
            get_monster().createStatusEffect(StatusEffects.CoonWhip,150,2,0,0);
            _loc1_ = get_monster();
            _loc1_.set_armorDef(_loc1_.get_armorDef() - 150);
            outputText("[pg]");
            get_combat().startMonsterTurn();
            return;
         }
         if(Boolean(combatAvoidDamage(new AvoidDamageParameters(null,false,false,null,null,null,null,null)).attackFailed))
         {
            outputText("你像陀螺一样旋转，挥动着尾巴，却只打中了空气。");
         }
         else
         {
            if(!get_monster().get_plural())
            {
               outputText("你像陀螺一样旋转，用尾巴拍打你的对手。有那么一瞬间，[monster.he]看起来难以置信，仿佛[monster.his]世界天翻地覆了，但[monster.he]很快变得愤怒，加倍了[monster.his]攻势，在[monster.his]防守中留下了巨大的漏洞。如果你想利用这个机会，最好马上行动；[monster.he]可能会很快冷静下来。");
            }
            else
            {
               outputText("你像陀螺一样旋转，用尾巴拍打你的对手。有那么一瞬间，[monster.he]看起来难以置信，仿佛[monster.his]世界天翻地覆了，但[monster.he]很快变得愤怒，加倍了[monster.his]攻势，在[monster.his]防守中留下了巨大的漏洞。如果你想利用这个机会，最好马上行动；[monster.he]可能会很快冷静下来。");
            }
            if(!get_monster().hasStatusEffect(StatusEffects.CoonWhip))
            {
               get_monster().createStatusEffect(StatusEffects.CoonWhip,0,0,0,0);
            }
            _loc2_ = int(Math.round(get_monster().get_armorDef() * 0.75));
            while(_loc2_ > 0 && get_monster().get_armorDef() >= 1)
            {
               _loc1_ = get_monster();
               _loc1_.set_armorDef(_loc1_.get_armorDef() - 1);
               get_monster().addStatusValue(StatusEffects.CoonWhip,1,1);
               _loc2_--;
            }
            _loc3_ = 2;
            if(get_player().tail.type == 15)
            {
               _loc3_ += 2;
            }
            if(get_player().hasPerk(PerkLib.NaturalWeapons))
            {
               _loc3_++;
            }
            get_monster().addStatusValue(StatusEffects.CoonWhip,2,_loc3_);
         }
         outputText("[pg]");
         get_combat().startMonsterTurn();
      }
      
      public function tailSlapCalc() : DamageRange
      {
         var _loc1_:int = calcInfernoMod(get_combat().calcBodyDamage(20) * 1.5);
         var _loc2_:int = Utils.boundInt(0,int(40 * get_monster().get_fireRes() - 20),40);
         return get_combat().standardReduceDamage(_loc1_,_loc2_);
      }
      
      public function tailSlapAttack() : void
      {
         var _loc1_:int = 0;
         clearOutput();
         get_combat().damageType = "PhysicalM";
         outputText("只要一个简单的念头，你就能让你的尾巴燃烧起来。");
         if(Boolean(combatAvoidDamage(new AvoidDamageParameters(null,false,false,null,null,null,null,null)).attackFailed))
         {
            outputText("你像陀螺一样旋转，挥动着尾巴，却只打中了空气。");
         }
         else
         {
            if(!get_monster().get_plural())
            {
               outputText("你像陀螺一样旋转，用尾巴拍打你的对手。");
            }
            else
            {
               outputText("你像陀螺一样旋转，用尾巴拍打你的对手们。");
            }
            currDamage = tailSlapCalc().combat;
            currDamage = get_combat().doDamage(currDamage,true,true);
            _loc1_ = getInfernoCount();
            if(_loc1_ > 0)
            {
               outputText("[pg-]你利用之前火魔法的痕迹来增强你的火焰，点燃了[themonster]！");
               get_monster().createStatusEffect(StatusEffects.OnFire,1 + _loc1_,calcInfernoMod(40));
            }
         }
         get_combat().startMonsterTurn();
      }
      
      public function tailSlamAttack() : void
      {
         clearOutput();
         get_combat().damageType = "PhysicalM";
         if(Boolean(combatAvoidDamage(new AvoidDamageParameters(null,false,false,null,null,null,null,null)).attackFailed))
         {
            outputText("你挥动着强有力的尾巴，但你的攻击只打中了空气。[pg]");
            get_combat().startMonsterTurn();
            return;
         }
         outputText("你猛地一扫，用强有力的尾巴猛击你的[if (monster.plural) {对手们|对手}]。[Monster.a][monster.short][if (monster.plural) {们}]在冲击下踉跄后退，一屁股摔倒在地，被打得鼻青脸肿。");
         currDamage = tailslamcalc();
         currDamage = get_combat().doDamage(currDamage,true,true);
         var _loc1_:int = int(100 / (2 + get_monster().statusEffectv1(StatusEffects.TimesBashed)));
         if(_loc1_ < 10)
         {
            _loc1_ = 10;
         }
         if(get_monster().stun(1,_loc1_))
         {
            outputText("[b: 这沉重的一击也成功地击晕了[themonster]！]");
            if(!get_monster().hasStatusEffect(StatusEffects.TimesBashed))
            {
               get_monster().createStatusEffect(StatusEffects.TimesBashed,1,0,0,0);
            }
            else
            {
               get_monster().addStatusValue(StatusEffects.TimesBashed,1,1);
            }
         }
         if(get_monster().bleed(get_player()))
         {
            outputText("[pg-][Themonster]从你的尾刺留下的许多血淋淋的刺孔中大量[if (monster.plural) {流血|流血}]。");
         }
         else if(get_monster() is LivingStatue)
         {
            outputText("尽管你在它坚硬的石头外表上撕开了裂口，但雕像并没有流血。");
         }
         outputText("[pg]");
         get_combat().startMonsterTurn();
      }
      
      public function superWhisperAttack() : void
      {
         var newRound:Boolean;
         var _g:Combat;
         clearOutput();
         if(get_player().hasStatusEffect(StatusEffects.ThroatPunch) || get_player().hasStatusEffect(StatusEffects.WebSilence))
         {
            outputText("当你呼吸如此困难时，你无法集中精力去触及敌人的心灵。");
            _g = get_combat();
            newRound = false;
            doNext(function():void
            {
               _g.combatMenu(newRound);
            });
            return;
         }
         if(get_monster() is Akbal && FlagDict_Impl_.arrayReadInt(KFLAGS.flags,2715) > 0)
         {
            if(Utils.rand(get_player().get_inte() / 10) == 0)
            {
               outputText("你探入敌人的心灵，却发现它被阿克巴尔坚定的意志完全挡开了。");
               if(Utils.rand(2) == 0)
               {
                  outputText("\n利用你主动建立的精神连接，恶魔用他自己的攻击进行反击，");
                  if(get_player().stun(1,50))
                  {
                     outputText("让你陷入昏迷并且");
                  }
                  outputText("迟钝你的心智！");
                  get_player().addCombatBuff("inte",-(get_player().get_inte() / 5));
               }
               get_player().changeFatigue(10);
            }
            else
            {
               outputText("你探入敌人的心灵，将恐惧和压力深深地打入他的精神深处。你还用精神力向他发送响亮的信息，傲慢地宣告你对他的法术拥有统治权。[pg]");
               get_monster().createStatusEffect(StatusEffects.Fear,1,0,0,0);
            }
            get_combat().startMonsterTurn();
            return;
         }
         if(get_monster() is AkbalUnsealed)
         {
            outputText("你集中精力用你的低语扰乱恶魔的心智，却只听到阿克巴尔的声音在你自己的脑海中回荡。");
            outputText("\n[say: 你如此尊重我教你的技巧，真是让人受宠若惊。不过，一次又一次地弯下腰来接受我的肉棒，就已经是足够的感谢了。]");
            outputText("\n你的自尊心对此感到不悦，但体内的一阵酥麻提醒着你曾经感受过的快感。");
            get_player().takeLustDamage(5 + Utils.rand(6),true);
            get_combat().startMonsterTurn();
            return;
         }
         if(get_monster().get_short() == "pod" || get_monster().get_inte() == 0)
         {
            outputText("你试图触及敌人的心灵，却什么也找不到。你疯狂地四处搜寻，但在这个房间里，并没有你所认知的那种意识存在。[pg]");
            get_player().changeFatigue(1);
            get_combat().startMonsterTurn();
            return;
         }
         if(get_monster() is LivingStatue || get_monster() is VolcanicGolem)
         {
            outputText("魔像体内没有任何可以低语的对象。");
            get_player().changeFatigue(1);
            get_combat().startMonsterTurn();
            return;
         }
         if(get_monster().hasPerk(PerkLib.Focused))
         {
            if(!get_monster().get_plural())
            {
               outputText("[Themonster]太专注了，你的低语无法影响到他们！[pg]");
            }
            get_combat().startMonsterTurn();
            return;
         }
         if(get_player().get_inte() < get_monster().get_inte() || get_monster().get_plural())
         {
            outputText("你试图触及敌人的心灵，但无法突破。\n");
            get_player().changeFatigue(10);
            get_combat().startMonsterTurn();
            return;
         }
         if(Utils.rand(10) == 0)
         {
            outputText("当你试图触及敌人的心灵时，你分心了，各种声音的合唱在你的脑海中同时尖叫起来。你被迫匆忙让这些声音安静下来以保护自己。");
            get_player().changeFatigue(10);
            get_combat().startMonsterTurn();
            return;
         }
         outputText("你触及敌人的心灵，看着突如其来的恐惧让你的敌人石化。[pg]");
         get_monster().createStatusEffect(StatusEffects.Fear,1,0,0,0);
         get_combat().startMonsterTurn();
      }
      
      public function summonedSwordSlash(param1:Boolean = false) : void
      {
         outputText("[pg-]你召唤的剑在飞向[themonster]并攻击时被蓝色能量包裹！");
         if(Boolean(combatAvoidDamage(new AvoidDamageParameters(true,false,false,null,null,summonedSwordChance(),null,null)).attackFailed))
         {
            outputText("攻击未命中！");
         }
         else
         {
            outputText("攻击命中！");
            if(get_player().statusEffectv1(StatusEffects.CirceSummonedScimitar) == 1)
            {
               outputText("[pg-]魔法之刃准确地击中了目标，造成了精确的打击，并在遭到反击之前迅速飞走！");
               switch(Utils.rand(3))
               {
                  case 0:
                     outputText("它在半空中旋转翻滚，显然对击中目标感到兴奋。");
                     break;
                  case 1:
                     outputText("刀刃指向[themonster]并刺了几下，嘲弄着它的敌人。");
                     break;
                  case 2:
                     outputText("弯刀花哨地旋转着，仿佛被一位熟练的剑客握着。");
               }
            }
            get_combat().doDamage(summonedSwordDamage(),true,true,false,param1);
         }
      }
      
      public function summonedSwordExec() : void
      {
         var _loc4_:int = 0;
         var _loc1_:int = int(get_player().statusEffectv1(StatusEffects.CirceSummonedScimitar));
         outputText("[pg]");
         var _loc2_:int = 0;
         var _loc3_:int = _loc1_;
         while(_loc2_ < _loc3_)
         {
            _loc4_ = _loc2_++;
            randomMonster((function(param1:Array, param2:Array):Function
            {
               var _g:Array = param1;
               var firstSlash:Array = param2;
               return function():void
               {
                  _g[0].summonedSwordSlash(Boolean(firstSlash[0]));
               };
            })([this],[_loc4_ == 0]));
         }
      }
      
      public function summonedSwordDamage(param1:Boolean = false, param2:Boolean = false) : Number
      {
         if(param1)
         {
            return get_monster().reduceDamageMin(50 * (1 + get_player().spellMod() / 3));
         }
         if(param2)
         {
            return get_monster().reduceDamageMax(80 * (1 + get_player().spellMod() / 3));
         }
         return get_monster().reduceDamageCombat(Utils.randBetween(50,80) * (1 + get_player().spellMod() / 3));
      }
      
      public function summonedSwordChance() : Number
      {
         return 75 - get_monster().getEvasionChance();
      }
      
      public function summonSword() : void
      {
         outputText("你双手合十，将魔法集中在手上。当你将它们分开时，它们闪烁着能量，将纯粹的奥术力量塑造成弯刀的形状！");
         outputText("[pg-]在完成刀尖和刀柄后，弯刀变得栩栩如生，从你的手中悬浮起来，指向你的目标！");
         var _temp_1:* = get_player().createOrFindStatusEffect(StatusEffects.CirceSummonedScimitar);
         _temp_1.value1 = _temp_1.value1 + 1;
         get_combat().startMonsterTurn();
      }
      
      public function stingerCalc(param1:Boolean = false, param2:Boolean = false) : Number
      {
         var _loc3_:Number = 35 + (param1 ? 0 : Utils.rand(get_player().lib / 10)) + (param2 ? get_player().lib / 10 : 0);
         if(get_player().level < 10)
         {
            _loc3_ += get_player().level * 3;
         }
         else if(get_player().level < 20)
         {
            _loc3_ += 30 + (get_player().level - 10) * 2;
         }
         else if(get_player().level < 30)
         {
            _loc3_ += 50 + (get_player().level - 20);
         }
         else
         {
            _loc3_ += 60;
         }
         _loc3_ = get_combat().bodyMod(_loc3_);
         return int(get_monster().lustVuln * _loc3_);
      }
      
      public function standardStatComparison(param1:Number, param2:Number, param3:int = 0) : int
      {
         var _loc4_:Number = 70;
         var _loc5_:Number = Math.log(-100 / (_loc4_ - 100));
         var _loc6_:Number = Math.pow(param1 / param2,1.35);
         var _loc7_:int = int(Math.round(100 * (1 - Math.exp(-_loc5_ * _loc6_))));
         return Utils.boundInt(0,_loc7_ + param3,100);
      }
      
      public function standardDodge(param1:int = 0) : int
      {
         return int(get_monster().standardDodgeFunc(get_player(),param1));
      }
      
      public function stanceChange(param1:FistStances) : void
      {
         get_player().removeStatusEffect(StatusEffects.MonkStance);
         get_player().removeStatusEffect(StatusEffects.BrawlerStance);
         get_player().removeStatusEffect(StatusEffects.ClawStance);
         switch(param1.index)
         {
            case 0:
               get_player().createStatusEffect(StatusEffects.MonkStance);
               break;
            case 1:
               get_player().createStatusEffect(StatusEffects.BrawlerStance);
               break;
            case 2:
               get_player().createStatusEffect(StatusEffects.ClawStance);
         }
      }
      
      public function spiderbiteChance() : Number
      {
         if(get_monster().hasPerk(PerkLib.PoisonImmune))
         {
            return 0;
         }
         if(get_monster().hasStatusEffect(StatusEffects.Constricted))
         {
            return 100;
         }
         var _loc1_:int = 10;
         if(get_player().hasPerk(PerkLib.NaturalWeapons))
         {
            _loc1_ += 20;
         }
         return standardStatComparison(get_player().get_spe(),get_monster().get_speRescaled(),_loc1_);
      }
      
      public function spiderbiteCalc() : Number
      {
         return get_combat().bodyMod(25) * get_monster().lustVuln;
      }
      
      public function spiderBiteAttack() : void
      {
         var _loc1_:int = 0;
         clearOutput();
         if(get_monster().hasPerk(PerkLib.PoisonImmune))
         {
            outputText("[themonster]对任何类型的毒药免疫！你的咬击毫无作用！[pg]");
            get_combat().startMonsterTurn();
            return;
         }
         if(get_monster().hasPerk(PerkLib.BiteImmune))
         {
            outputText("你向前猛扑，露出毒牙，用尽全力咬向[themonster]。当你咬中的那一刻，一阵刺痛直冲你的头骨，你的牙齿甚至无法在上面留下最轻微的凹痕。你还不如去咬一块石头！");
            get_player().takeDamage(5,true);
            get_combat().startMonsterTurn();
            return;
         }
         if(spiderbiteChance() > Utils.rand(100))
         {
            if(get_monster().get_short() == "demons")
            {
               outputText("你看了看人群，想知道该咬他们中的哪一个。你的目光落在了这群人的首领身上，由于他穿着蛇皮斗篷，很容易被认出来。当恶魔人群向你逼近时，你迅速在其中穿梭，并向首领宽阔的身体扑去。你趁恶魔不备，将你针状的毒牙深深刺入他的肉中。你迅速释放毒液，并在他或这群人的其他人做出反应之前撤退。");
            }
            else if(!get_monster().get_plural())
            {
               outputText("你头朝下向敌人扑去，露出毒牙。你设法趁[themonster]不备，你针状的毒牙深深刺入[monster.his]的身体。你迅速释放毒液，并在[monster.he]做出反应之前撤退。");
            }
            else
            {
               outputText("你头朝下向敌人扑去，露出毒牙。你设法趁[themonster]中的一个不备，你针状的毒牙深深刺入[monster.his]的身体。你迅速释放毒液，并在[monster.he]做出反应之前撤退。");
            }
            if(get_monster().lustVuln == 0)
            {
               outputText("你的催情毒素毫无作用！");
            }
            else
            {
               if(get_monster().get_plural())
               {
                  outputText("被你咬到的那个人满脸通红，不过整个群体似乎都因为同情他们现在充满欲望的同胞而变得更加兴奋。");
               }
               else
               {
                  outputText("" + get_monster().mf("他","她") + "满脸通红，" + get_monster().mf("摸着他突然变硬的阴茎，淫荡地呻吟了一会儿。","摸着突然变硬的乳头，淫荡地呻吟着。你能闻到空气中她发情的味道。"));
               }
               _loc1_ = int(spiderbiteCalc());
               if(Utils.rand(5) == 0)
               {
                  _loc1_ *= 2;
               }
               get_monster().teased(_loc1_);
            }
         }
         else
         {
            outputText("你头朝下猛扑，露出毒牙。你的尝试惨败，因为[themonster]设法反击了你的猛扑，将你推回了攻击范围之外。");
         }
         outputText("[pg]");
         get_combat().startMonsterTurn();
      }
      
      public function spellWhitefire() : void
      {
         get_combat().damageType = "MagicalR";
         if(get_monster() is Doppelganger)
         {
            get_monster().handleSpellResistance("whitefire");
            return;
         }
         outputText("你眯起眼睛，带着致命的意图集中精神。你打了个响指，[themonster]被一阵白色的火焰吞没！");
         currDamage = whiteFireDamage();
         if(get_monster() is ArchInquisitorVilkus && currDamage > 250 && get_monster().nextAction == 1)
         {
            outputText("[b:你的法术压制了审判官的法术]，它的魔法能量被吸收到你的法术中，形成了一次极其有效的攻击！");
            get_monster().nextAction = 0;
            currDamage += Utils.rand(200);
         }
         doFireDamage(currDamage);
         get_combat().startMonsterTurn();
      }
      
      public function spellTKBlast() : void
      {
         clearOutput();
         get_combat().damageType = "PhysicalR";
         outputText("你举起手，仿佛抓住了某个看不见的球体。片刻之后，你挥动手臂划出一个大弧线，向你的敌人释放出一股巨大的念力波！");
         currDamage = tkBlastCalc();
         get_combat().doDamage(currDamage,true,true);
         outputText("[pg-]");
         if(get_monster().stun(0,Utils.rand(get_player().get_inte()),int(get_monster().get_str())))
         {
            outputText("你的念力冲击对你的敌人来说太强了，让它踉跄了一下！[pg]");
         }
         get_combat().startMonsterTurn();
      }
      
      public function spellMightApply() : void
      {
         get_player().createStatusEffect(StatusEffects.Might,mightCalc(),0,0,0);
      }
      
      public function spellMight() : void
      {
         spellMightApply();
         outputText("你满脸通红，利用身体的欲望来增强你的肌肉，让你变得更强壮。[pg]");
         var _loc1_:int = 25;
         if(get_player().hasPerk(PerkLib.FocusedMind))
         {
            _loc1_ = 15;
         }
         if(Utils.rand(100) < _loc1_)
         {
            outputText("一个错误的性念头闪过你的脑海，你失去了对法术的控制！你的");
            if(get_player().get_gender() == 0)
            {
               outputText("[asshole]因渴望被填满而刺痛，你的性欲失去了控制。");
            }
            if(get_player().get_gender() == 1)
            {
               if(get_player().cockTotal() == 1)
               {
                  outputText("[cock]淫秽地抽动着，滴下预精，你的性欲失去了控制。");
               }
               else
               {
                  outputText("[cocks]淫秽地抽动着，滴下预精，你的性欲失去了控制。");
               }
            }
            if(get_player().get_gender() == 2)
            {
               outputText(get_player().vaginaDescript(0) + "变得肿胀、发热，准备好被触摸，因为魔法转移到了它上面。");
            }
            if(get_player().get_gender() == 3)
            {
               outputText(get_player().vaginaDescript(0) + "和[cocks]充满了血液，变得肿胀和极其敏感，因为魔法集中在它们身上。");
            }
            dynStats(DynStat.Lib(0.25),DynStat.Lust(15));
         }
         else
         {
            outputText("成功和力量的冲击流遍你的全身。你觉得你可以做任何事情！");
            get_player().createStatusEffect(StatusEffects.Might,mightCalc(),0,0,0);
         }
         outputText("[pg]");
         get_combat().startMonsterTurn();
      }
      
      public function spellLeech() : void
      {
         outputText("你低声念诵一系列奥术咒语，同时将一只手悬停在你的[weapon]上。它发出微弱的绿光，表明你的法术起作用了。[pg]");
         get_player().createStatusEffect(StatusEffects.Leeching,3,leechCalc(),0,0);
         get_combat().startMonsterTurn();
      }
      
      public function spellHeal() : void
      {
         clearOutput();
         outputText("你将注意力集中在你的身体和它结束痛苦的渴望上，试图利用你的欲望而不增强它。\n");
         var _loc1_:int = 25;
         if(get_player().hasPerk(PerkLib.FocusedMind))
         {
            _loc1_ = 15;
         }
         if(Utils.rand(100) < _loc1_)
         {
            outputText("一个错误的性念头闪过你的脑海，你失去了对法术的控制！你的");
            if(get_player().get_gender() == 0)
            {
               outputText("[asshole]因渴望被填满而刺痛，你的性欲失去了控制。");
            }
            if(get_player().get_gender() == 1)
            {
               if(get_player().cockTotal() == 1)
               {
                  outputText("[cock]淫秽地抽动着，滴下预精，你的性欲失去了控制。");
               }
               else
               {
                  outputText("[cocks]淫秽地抽动着，滴下预精，你的性欲失去了控制。");
               }
            }
            if(get_player().get_gender() == 2)
            {
               outputText(get_player().vaginaDescript(0) + "变得肿胀、发热，准备好被触摸，因为魔法转移到了它上面。");
            }
            if(get_player().get_gender() == 3)
            {
               outputText(get_player().vaginaDescript(0) + "和[cocks]充满了血液，变得肿胀和极其敏感，因为魔法集中在它们身上。");
            }
            dynStats(DynStat.Lib(0.25),DynStat.Lust(15));
         }
         else
         {
            outputText("当你的伤口开始愈合时，你因成功而兴奋得满脸通红。");
            get_player().HPChange(healCalc(),true);
         }
         outputText("[pg]");
         get_combat().startMonsterTurn();
      }
      
      public function spellCleansingPalm() : void
      {
         var _loc1_:Number = NaN;
         get_combat().damageType = "MagicalR";
         if(get_monster().get_short() == "Jojo")
         {
            if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,2311) < 2)
            {
               outputText("你向前猛推手掌，向乔乔发出一道纯粹的能量冲击。在最后一秒，他也向你发出了一道冲击，抵消了你的攻击。");
               get_player().masteryXP(MasteryLib.Casting,2 + Utils.rand(7));
               get_combat().startMonsterTurn();
               return;
            }
         }
         if(get_monster() is LivingStatue)
         {
            outputText("你向前猛推手掌，导致一道纯粹的能量冲击猛烈撞击在巨大的石像上——毫无效果！");
            get_combat().startMonsterTurn();
            return;
         }
         currDamage = cleansingPalmCalc().combat;
         if(currDamage > 0)
         {
            outputText("你向前猛推手掌，导致一道纯粹的能量冲击猛烈撞击在[themonster]身上，抛掷");
            if(get_monster().get_plural())
            {
               outputText("他们");
            }
            else
            {
               outputText(get_monster().mfn("他","她","它"));
            }
            outputText("击退了几英尺。");
            if(get_silly() && get_monster().cor >= 85)
            {
               outputText("[pg-]效果拔群！");
            }
         }
         else
         {
            currDamage = 0;
            outputText("你向前推出手掌，释放出一股纯净的能量冲击[themonster]，但对方完全无视了它。你最好不要对纯洁的生物使用这个技能。");
         }
         get_combat().doDamage(currDamage,true,true);
         if(canFist(3,FistStances.Monk))
         {
            _loc1_ = get_player().get_lust();
            dynStats(DynStat.Lust(-2 * get_player().masteryLevel(MasteryLib.Fist)));
            _loc1_ = int(Math.round(_loc1_ - get_player().get_lust()));
            outputText("[pg-]残余的能量清除了你脑海中的淫念。" + get_combat().getLustText(-_loc1_));
         }
         get_combat().startMonsterTurn();
      }
      
      public function spellChargeWeapon() : void
      {
         get_player().createStatusEffect(StatusEffects.ChargeWeapon,chargeWeaponCalc());
         outputText("你念出力量的咒语，在你的[weapon]周围召唤出电荷。它发出巨大的噼啪声，确保你在接下来的战斗中能用它造成更多的伤害。[pg]");
         get_combat().startMonsterTurn();
      }
      
      public function spellBlindExec() : void
      {
         if(!get_monster().reactWrapper(ReactionContext.Blinded))
         {
            return;
         }
         outputText("[pg-]");
         if(Utils.rand(3) != 0)
         {
            get_monster().createStatusEffect(StatusEffects.Blind,5 * get_player().spellMod(),0,0,0);
            outputText("[b: [Themonster]被致盲了！]");
         }
         else
         {
            outputText("[Themonster]眨了眨眼！");
         }
      }
      
      public function spellBlind() : void
      {
         outputText("你怒视着[themonster]并指着[monster.him]。一道耀眼的闪光在[monster.him]面前爆发！");
         allMonsters(spellBlindExec);
         get_combat().startMonsterTurn();
      }
      
      public function spellArouse() : void
      {
         var _loc2_:Number = NaN;
         clearOutput();
         outputText("你做出一系列奥术手势，利用你自己的欲望将其施加在你的敌人身上！");
         if(get_monster().get_short() == "worms")
         {
            outputText("[pg-]蠕虫似乎不受你魔法的影响！");
            get_combat().startMonsterTurn();
            return;
         }
         if(get_monster().lustVuln == 0)
         {
            outputText("[pg-]这没有效果！你的敌人显然没有像你一样体验到欲望。");
            get_combat().startMonsterTurn();
            return;
         }
         var _loc1_:Number = arouseCalc();
         if(get_monster().get_lust100() < 30)
         {
            outputText("[pg-][Themonster]在魔法影响到[monster.him]时扭动着。");
         }
         else if(get_monster().get_lust100() < 60)
         {
            outputText("[pg-][Themonster]踉跄了一下，突然变得虚弱，难以集中注意力保持直立。");
         }
         else if(get_monster() is Dullahan)
         {
            outputText("[pg-]奇怪的是，虽然无头骑士的目光依然冰冷而专注，但她的身体却因欲望而颤抖。");
         }
         else
         {
            outputText("[pg-][Monster.his]眼睛因欲望而变得呆滞了片刻。");
         }
         if(get_monster().hasCock())
         {
            if(get_monster().get_lust100() >= 60)
            {
               outputText("你看到[monster.his]" + get_monster().multiCockDescriptLight() + "滴下预精。");
            }
            else if(get_monster().get_lust100() >= 30)
            {
               if(int(get_monster().cocks.length) > 1)
               {
                  outputText("你看到[monster.his]" + get_monster().multiCockDescriptLight() + "不舒服地变硬了。");
               }
               else
               {
                  outputText("[Themonster]的" + get_monster().cockDescriptShort(0) + "变硬了，进一步分散了[monster.him]的注意力。");
               }
            }
         }
         if(get_monster().hasVagina())
         {
            if(get_monster().get_lust100() >= 60)
            {
               _loc2_ = get_monster().vaginas[0].vaginalWetness;
               if(_loc2_ == 1)
               {
                  outputText("[Themonster]的" + get_monster().vaginaDescript() + "明显变湿了。");
               }
               else if(_loc2_ == 2)
               {
                  outputText("[Themonster]的胯部变得黏糊糊的，充满了女孩的欲望。");
               }
               else if(_loc2_ == 3)
               {
                  outputText("[Themonster]的" + get_monster().vaginaDescript() + "变得湿漉漉的。");
               }
               else if(_loc2_ == 4)
               {
                  outputText("浓稠的女孩淫液顺着[themonster]的大腿内侧流下。");
               }
               else if(_loc2_ == 5)
               {
                  outputText("[Themonster]的" + get_monster().vaginaDescript() + "瞬间浸湿了[monster.his]腹股沟。");
               }
            }
         }
         if(get_monster() is ArchInquisitorVilkus && _loc1_ > 30 && get_monster().nextAction == 3)
         {
            outputText("[pg-][b: 你的法术压制了审判官的法术]，它的魔法能量被吸收到你的法术中，形成了一次极其有效的攻击！");
            get_monster().nextAction = 0;
            _loc1_ += 5 + Utils.rand(20);
         }
         get_monster().teased(_loc1_);
         get_combat().startMonsterTurn();
      }
      
      public function soulburst() : void
      {
         clearOutput();
         outputText("你闭上眼睛集中精神，挖掘隐藏在你内心深处的力量。无与伦比的力量流经你的血管，你绷紧身体，试图控制它。");
         outputText("\n突然，你睁开双眼，爆发出纯粹的魔法力量！[pg]");
         if(get_player().hasStatusEffect(StatusEffects.Soulburst))
         {
            get_player().addStatusValue(StatusEffects.Soulburst,1,1);
         }
         else
         {
            get_player().createStatusEffect(StatusEffects.Soulburst,1,0,0,0);
         }
         if(get_player().maxHP() < get_player().get_HP())
         {
            get_player().set_HP(get_player().maxHP());
         }
         get_player().takeDamage(1);
         get_combat().startMonsterTurn();
      }
      
      public function skirmishDamage() : DamageRange
      {
         var _loc1_:Number = get_combat().calcWeaponDamage() * 0.7;
         var _loc2_:Number = 0;
         var _loc3_:Boolean = true;
         return get_combat().standardReduceDamage(_loc1_,_loc2_,_loc3_);
      }
      
      public function skirmishChance() : Number
      {
         return get_monster().standardDodgeFunc(get_player(),-15);
      }
      
      public function skirmish() : void
      {
         var _loc1_:* = null;
         outputText("你急忙向后冲刺，灵巧地准备好你的[weapon]，并在拉开与对手距离的同时" + (get_player().get_weapon().needsReload() ? "重新装填" : "发动攻击") + "！[pg]");
         if(get_player().get_weapon().preAttack())
         {
            _loc1_ = combatAvoidDamage(new AvoidDamageParameters(true,true,true,null,null,skirmishChance(),null,null));
            currDamage = 0;
            if(Boolean(_loc1_.attackHit))
            {
               currDamage = skirmishDamage().combat;
               currDamage = get_combat().doDamage(currDamage);
            }
            get_player().get_weapon().describeAttack({
               "damage":int(currDamage),
               "attackResult":_loc1_
            });
         }
         execDistance();
         get_combat().startMonsterTurn();
      }
      
      public function shootArrow(param1:Number = -1, param2:Boolean = false, param3:Boolean = true) : void
      {
         var _loc4_:* = null;
         var _loc5_:Boolean = false;
         var _loc6_:Boolean = false;
         if(param1 == -1)
         {
            param1 = fireBowChance();
         }
         if(get_monster().get_HP() <= 0)
         {
            return;
         }
         outputText("[pg-]");
         if(get_player().hasStatusEffect(StatusEffects.Blind))
         {
            outputText("箭矢射中了什么东西，但你现在是个瞎子，根本不可能用弓射中任何特定的目标。");
            return;
         }
         if(get_monster().hasStatusEffect(StatusEffects.Sandstorm))
         {
            if(Utils.randomChance(get_player().hasPerk(PerkLib.EagleEye) ? 50 : 90))
            {
               outputText("你的射击被沙尘暴吹偏了。该死！");
               return;
            }
         }
         if(!Utils.randomChance(param1))
         {
            outputText("箭矢射偏了，消失在你的敌人[if (monster.plural) {}]身后。");
            get_player().masteryXP(MasteryLib.Bow,param2 ? 1 + Utils.rand(3) : 5 + Utils.rand(11));
         }
         else if(get_monster().reactWrapper(ReactionContext.BowHit))
         {
            _loc4_ = fireBowCalc();
            _loc5_ = Boolean(_loc4_.isCrit);
            _loc6_ = Boolean(_loc4_.isMiniCrit);
            currDamage = int(_loc4_.finalDamage);
            if(param2)
            {
               currDamage /= 2;
            }
            if(currDamage == 0)
            {
               outputText("箭矢在[themonster]身上弹开，没有造成任何伤害。");
            }
            else
            {
               if(get_monster().get_short() == "pod")
               {
                  outputText("箭矢深深地扎进了肉荚的肉壁中。");
               }
               else
               {
                  outputText("箭矢精准地射中了目标，深深地扎进了[if (monster.plural) {其中一个}][themonster]的身体里。");
               }
               if(_loc5_)
               {
                  outputText("[b:暴击！]");
               }
               if(_loc6_)
               {
                  outputText("[b:趁虚而入！]");
               }
               currDamage = get_combat().doDamage(currDamage,true,false,true,param3);
               get_monster().takeLustDamage(param2 ? -5 : -20);
               if(get_monster().get_HP() <= 0)
               {
                  outputText("[pg-][Themonster]低头看[monster.s]着从[if (monster.plural) {他们中的一个的身体|[monster.his]身体}]上突出的箭矢，踉跄[monster.s]了一下，因为你对[monster.him]造成的伤口而[if (monster.plural) {纷纷}]倒下。");
               }
               outputText(get_combat().getDamageText(currDamage));
            }
         }
      }
      
      public function shieldingSpell() : void
      {
         clearOutput();
         outputText("你在护身符中聚集能量，并释放出其中包含的法术。一道光之屏障吞没了你，然后变得完全透明。你的防御力提升了。[pg]");
         get_player().createStatusEffect(StatusEffects.Shielding,0,0,0,0);
         get_game().arianScene.clearTalisman();
         get_combat().startMonsterTurn();
      }
      
      public function shieldBash() : void
      {
         var _loc2_:* = null as Monster;
         clearOutput();
         outputText("你准备好你的[shield]，准备把它砸向[themonster]。");
         get_combat().damageType = "PhysicalM";
         if(Boolean(combatAvoidDamage(new AvoidDamageParameters(null,false,false,null,null,null,null,null)).attackFailed))
         {
            if(get_monster().get_spe() - get_player().get_spe() >= 8 && get_monster().get_spe() - get_player().get_spe() < 20)
            {
               outputText("[Themonster]以极快的速度躲开了你的攻击！");
            }
            else if(get_monster().get_spe() - get_player().get_spe() >= 20)
            {
               outputText("[Themonster]灵巧地避开了你缓慢的攻击。");
            }
            else
            {
               outputText("[Themonster]险之又险地避开了你的攻击！");
            }
            get_player().masteryXP(MasteryLib.Shield,5 + Utils.rand(31));
            get_combat().startMonsterTurn();
            return;
         }
         currDamage = bashCalc();
         var _loc1_:int = int(100 / (2 + get_monster().statusEffectv1(StatusEffects.TimesBashed)));
         if(_loc1_ < 10)
         {
            _loc1_ = 10;
         }
         currDamage = get_combat().doDamage(currDamage,true);
         outputText("你的[shield]猛击[themonster]，造成了" + get_combat().colorText(DamageColor.Damage,"" + currDamage) + "点伤害！");
         if(get_monster() is VolcanicGolem)
         {
            if(get_monster().hasStatusEffect(StatusEffects.VolcanicFistProblem))
            {
               if(!get_monster().hasStatusEffect(StatusEffects.VolcanicFrenzy))
               {
                  outputText("趁着怪物弯腰试图把拳头从地里拔出来的时候，你成功地对它的头部进行了毁灭性的打击，导致它摇摇晃晃地倒下了。");
                  outputText("[pg]魔像的岩石板滑落，露出了它熔融的内部。[b:这是你攻击的机会！]");
                  get_monster().createStatusEffect(StatusEffects.Stunned,1,0,0,0);
                  get_monster().set_armorDef(0);
               }
               else
               {
                  outputText("趁着怪物弯腰试图把拳头从地里拔出来的时候，你成功地对它的头部进行了毁灭性的打击。然而，在狂暴中，魔像无视了冲击，保持了专注！");
                  if(get_monster().hasStatusEffect(StatusEffects.VolcanicArmorRed))
                  {
                     get_monster().addStatusValue(StatusEffects.VolcanicArmorRed,1,3);
                     get_monster().addStatusValue(StatusEffects.VolcanicArmorRed,2,1);
                     _loc2_ = get_monster();
                     _loc2_.set_armorDef(_loc2_.get_armorDef() - 150);
                     if(get_monster().get_armorDef() < 0)
                     {
                        get_monster().set_armorDef(0);
                     }
                  }
                  else
                  {
                     get_monster().createStatusEffect(StatusEffects.VolcanicArmorRed,3,1,0,0);
                     _loc2_ = get_monster();
                     _loc2_.set_armorDef(_loc2_.get_armorDef() - 150);
                     if(get_monster().get_armorDef() < 0)
                     {
                        get_monster().set_armorDef(0);
                     }
                  }
               }
               outputText("[pg]");
               get_combat().startMonsterTurn();
               return;
            }
            outputText("你的冲击在坚不可摧的岩石板上无害地消散了，魔像并没有被击晕。");
            outputText("[pg]");
            get_combat().startMonsterTurn();
            return;
         }
         if(get_monster().stun(1,_loc1_))
         {
            outputText("[b: 你的冲击也成功地击晕了[themonster]！]");
            if(!get_monster().hasStatusEffect(StatusEffects.TimesBashed))
            {
               get_monster().createStatusEffect(StatusEffects.TimesBashed,get_player().hasPerk(PerkLib.ShieldSlam) ? 0.5 : 1,0,0,0);
            }
            else
            {
               get_monster().addStatusValue(StatusEffects.TimesBashed,1,get_player().hasPerk(PerkLib.ShieldSlam) ? 0.5 : 1);
            }
         }
         outputText("[pg]");
         get_player().masteryXP(MasteryLib.Shield,5 + Utils.rand(21));
         get_combat().startMonsterTurn();
      }
      
      public function setSpells() : void
      {
         var _gthis:CombatAbilities = this;
         var _loc1_:Object = NumberFunc_Impl_.fromInt(15);
         var _loc2_:Function = function():String
         {
            return "充能武器法术会用电能包裹你的武器，使其造成 " + _gthis.get_combat().colorText(DamageColor.Damage,"" + _gthis.chargeWeaponCalc()) + " 点额外伤害。该效果在整场战斗中持续有效。";
         };
         var _loc3_:Function = function():Boolean
         {
            return _gthis.get_player().hasStatusEffect(StatusEffects.KnowsCharge);
         };
         var _loc4_:Object = function():Boolean
         {
            return _gthis.get_player().hasStatusEffect(StatusEffects.ChargeWeapon);
         };
         var _loc5_:Object = ValueFunc_Impl_.fromT("[b:充能武器已经激活，无法再次施放。]");
         var _loc6_:Object = ValueFunc_Impl_.fromT("Charge W.");
         var _loc7_:Object = ValueFunc_Impl_.fromT(CombatRange.Self);
         var _loc8_:CombatAbility = new CombatAbility(new AbilityDef(spellChargeWeapon,_loc2_,_loc3_,_loc4_,_loc5_,_loc1_,"Charge Weapon",_loc6_,ValueFunc_Impl_.fromT(0),null,null,true,null,null,null,null,_loc7_,null,null));
         var _loc9_:Object = NumberFunc_Impl_.fromInt(20);
         var _loc10_:Function = ValueFunc_Impl_.fromT("致盲是一个顾名思义的法术。它会在受害者眼前制造一道强光，使其暂时失明。不过，如果对方眨眼，这个法术就会白费。");
         var _loc11_:Function = function():Boolean
         {
            return _gthis.get_player().hasStatusEffect(StatusEffects.KnowsBlind);
         };
         var _loc12_:Object = function():Boolean
         {
            var _loc3_:* = null as Monster;
            var _loc1_:int = 0;
            var _loc2_:Array = _gthis.get_combat().getActiveEnemies();
            while(_loc1_ < int(_loc2_.length))
            {
               _loc3_ = _loc2_[_loc1_];
               _loc1_++;
               if(!_loc3_.hasStatusEffect(StatusEffects.Blind))
               {
                  return false;
               }
            }
            return true;
         };
         var _loc13_:Object = ValueFunc_Impl_.fromT((int(get_combat().getActiveEnemies().length) > 1 ? "你的敌人" : "[Themonster] [monster.is]") + " 已经被致盲了。");
         var _loc14_:Object = ValueFunc_Impl_.fromT("Blind");
         var _loc15_:Object = ValueFunc_Impl_.fromT(CombatRange.Ranged);
         var _loc16_:CombatAbility = new CombatAbility(new AbilityDef(spellBlind,_loc10_,_loc11_,_loc12_,_loc13_,_loc9_,"Blind",_loc14_,ValueFunc_Impl_.fromT(0),null,null,null,null,null,null,3,_loc15_,null,null));
         var _loc17_:Object = NumberFunc_Impl_.fromInt(30);
         var _loc18_:Function = function():String
         {
            return "白火是一种强大的火系攻击，会用闪烁的白色火焰燃烧你的敌人，无视其物理韧性和大部分护甲。" + _gthis.get_combat().fancifyDamageRange(_gthis.whiteFireDamage(true),_gthis.whiteFireDamage(true,true));
         };
         var _loc19_:Function = function():Boolean
         {
            return _gthis.get_player().hasStatusEffect(StatusEffects.KnowsWhitefire);
         };
         var _loc20_:Object = ValueFunc_Impl_.fromT("Whitefire");
         var _loc21_:Object = ValueFunc_Impl_.fromT(CombatRange.Ranged);
         var _loc22_:CombatAbility = new CombatAbility(new AbilityDef(spellWhitefire,_loc18_,_loc19_,null,null,_loc17_,"Whitefire",_loc20_,ValueFunc_Impl_.fromT(0),null,null,null,null,null,null,3,_loc21_,null,null));
         var _loc23_:Object = NumberFunc_Impl_.fromInt(15);
         var _loc24_:Function = function():String
         {
            return "唤情法术会汲取你内心的欲望，以此来点燃敌人的激情。" + _gthis.get_combat().fancifyLustRange(_gthis.arouseCalc(true),_gthis.arouseCalc(true,true));
         };
         var _loc25_:Function = function():Boolean
         {
            return _gthis.get_player().hasStatusEffect(StatusEffects.KnowsArouse);
         };
         var _loc26_:Object = ValueFunc_Impl_.fromT("Arouse");
         var _loc27_:Object = ValueFunc_Impl_.fromT(CombatRange.Ranged);
         var _loc28_:CombatAbility = new CombatAbility(new AbilityDef(spellArouse,_loc24_,_loc25_,null,null,_loc23_,"Arouse",_loc26_,ValueFunc_Impl_.fromT(1),null,null,null,null,null,null,3,_loc27_,null,null));
         var _loc29_:Object = NumberFunc_Impl_.fromInt(20);
         var _loc30_:Function = function():String
         {
            return "治疗法术会尝试使用黑魔法来愈合你的伤口并恢复你的身体，然而就像所有对自己使用的黑魔法一样，它有几率产生反噬，让你欲火焚身。" + _gthis.get_combat().fancifyHealRange(_gthis.healCalc(true),_gthis.healCalc(true,true));
         };
         var _loc31_:Function = function():Boolean
         {
            return _gthis.get_player().hasStatusEffect(StatusEffects.KnowsHeal);
         };
         var _loc32_:Object = ValueFunc_Impl_.fromT("Heal");
         var _loc33_:Object = ValueFunc_Impl_.fromT(CombatRange.Self);
         var _loc34_:CombatAbility = new CombatAbility(new AbilityDef(spellHeal,_loc30_,_loc31_,null,null,_loc29_,"Heal",_loc32_,ValueFunc_Impl_.fromT(1),true,null,true,null,null,null,3,_loc33_,null,null));
         var _loc35_:Object = NumberFunc_Impl_.fromInt(25);
         var _loc36_:Function = function():String
         {
            return "强力法术会汲取你的欲望，并以此为燃料暂时增加肌肉的体积和力量，使力量和体质提高 " + _gthis.get_combat().colorText(DamageColor.Heal,"" + _gthis.mightCalc()) + "。就像所有对自己使用的黑魔法一样，它也带有反噬和增加欲望的风险。";
         };
         var _loc37_:Function = function():Boolean
         {
            return _gthis.get_player().hasStatusEffect(StatusEffects.KnowsMight);
         };
         var _loc38_:Object = function():Boolean
         {
            return _gthis.get_player().hasStatusEffect(StatusEffects.Might);
         };
         var _loc39_:Object = ValueFunc_Impl_.fromT("强力已经激活，无法再次施放。");
         var _loc40_:Object = ValueFunc_Impl_.fromT("Might");
         var _loc41_:Object = ValueFunc_Impl_.fromT(CombatRange.Self);
         var _loc42_:CombatAbility = new CombatAbility(new AbilityDef(spellMight,_loc36_,_loc37_,_loc38_,_loc39_,_loc35_,"Might",_loc40_,ValueFunc_Impl_.fromT(1),null,null,true,null,null,null,null,_loc41_,null,null));
         var _loc43_:Object = NumberFunc_Impl_.fromInt(30);
         var _loc44_:Function = function():String
         {
            return "向你的对手释放一道念力波。造成物理伤害，并可能导致目标在本回合退缩。" + _gthis.get_combat().fancifyDamageRange(_gthis.tkBlastCalc(true),_gthis.tkBlastCalc(false,true));
         };
         var _loc45_:Function = function():Boolean
         {
            return _gthis.get_player().hasStatusEffect(StatusEffects.KnowsTKBlast);
         };
         var _loc46_:Object = ValueFunc_Impl_.fromT("TK. Blast");
         var _loc47_:Object = ValueFunc_Impl_.fromT(CombatRange.Ranged);
         var _loc48_:CombatAbility = new CombatAbility(new AbilityDef(spellTKBlast,_loc44_,_loc45_,null,null,_loc43_,"TK. Blast",_loc46_,ValueFunc_Impl_.fromT(4),null,null,null,null,null,null,3,_loc47_,null,null));
         var _loc49_:Object = NumberFunc_Impl_.fromInt(20);
         var _loc50_:Function = function():String
         {
            return "为你的武器附魔，在接下来的3次物理攻击中，将 " + _gthis.get_combat().colorText(DamageColor.Heal,"" + _gthis.leechCalc()) + "% 的伤害转化为生命值。";
         };
         var _loc51_:Function = function():Boolean
         {
            return _gthis.get_player().hasStatusEffect(StatusEffects.KnowsLeech);
         };
         var _loc52_:Object = function():Boolean
         {
            return _gthis.get_player().hasStatusEffect(StatusEffects.Leeching);
         };
         var _loc53_:Object = ValueFunc_Impl_.fromT("你的武器已经附魔了。");
         var _loc54_:Object = ValueFunc_Impl_.fromT("Leech");
         var _loc55_:Object = ValueFunc_Impl_.fromT(CombatRange.Self);
         var _loc56_:CombatAbility = new CombatAbility(new AbilityDef(spellLeech,_loc50_,_loc51_,_loc52_,_loc53_,_loc49_,"Leech",_loc54_,ValueFunc_Impl_.fromT(4),null,null,true,null,null,null,null,_loc55_,null,null));
         var _loc57_:Object = NumberFunc_Impl_.fromFloat(tfFatigue(25,1));
         var _loc58_:Function = function():String
         {
            return "用泥土碎片覆盖全身，获得 " + _gthis.get_combat().colorText(DamageColor.Heal,"" + _gthis.tfPlateCalc()) + " 点护甲。" + _gthis.tfComboList("Plate");
         };
         var _loc59_:Function = function():Boolean
         {
            if(_gthis.get_player().hasPerk(PerkLib.TerrestrialFire))
            {
               return !_gthis.tfCombod("Plate");
            }
            return false;
         };
         var _loc60_:Object = function():Boolean
         {
            return _gthis.get_player().hasStatusEffect(StatusEffects.TFPlate);
         };
         var _loc61_:Object = ValueFunc_Impl_.fromT("你已经被土制护甲覆盖了。");
         var _loc62_:Object = ValueFunc_Impl_.fromT("Plate");
         var _loc63_:Object = ValueFunc_Impl_.fromT(CombatRange.Self);
         var _loc64_:CombatAbility = new CombatAbility(new AbilityDef(tfPlate,_loc58_,_loc59_,_loc60_,_loc61_,_loc57_,"Plate",_loc62_,ValueFunc_Impl_.fromT(5),null,null,true,null,null,null,null,_loc63_,null,null));
         var _loc65_:Object = NumberFunc_Impl_.fromFloat(tfFatigue(20,1));
         var _loc66_:Function = function():String
         {
            return "将火焰注入你的物理攻击中，造成 " + _gthis.get_combat().colorText(DamageColor.Damage,"" + _gthis.tfInflameCalc("total")) + " 点额外伤害，但同时也会伤害自己。" + _gthis.tfComboList("Inflame");
         };
         var _loc67_:Function = function():Boolean
         {
            if(_gthis.get_player().hasPerk(PerkLib.TerrestrialFire))
            {
               return !_gthis.tfCombod("Inflame");
            }
            return false;
         };
         var _loc68_:Object = function():Boolean
         {
            return _gthis.get_player().hasStatusEffect(StatusEffects.TFInflame);
         };
         var _loc69_:Object = ValueFunc_Impl_.fromT("你已经着火了。");
         var _loc70_:Object = ValueFunc_Impl_.fromT("Inflame");
         var _loc71_:Object = ValueFunc_Impl_.fromT(CombatRange.Self);
         var _loc72_:CombatAbility = new CombatAbility(new AbilityDef(tfInflame,_loc66_,_loc67_,_loc68_,_loc69_,_loc65_,"Inflame",_loc70_,ValueFunc_Impl_.fromT(5),null,null,true,null,null,null,null,_loc71_,null,null));
         var _loc73_:Object = NumberFunc_Impl_.fromFloat(tfFatigue(20,2));
         var _loc74_:Function = function():String
         {
            return "连击：岩甲 + 引燃[pg-]" + _gthis.tfMoltenPlateDesc();
         };
         var _loc75_:Function = function():Boolean
         {
            if(_gthis.get_player().masteryLevel(MasteryLib.TerrestrialFire) >= 1 && _gthis.tfComboReady("Molten Plate"))
            {
               return !_gthis.tfCombod("Molten Plate");
            }
            return false;
         };
         var _loc76_:Object = function():Boolean
         {
            return _gthis.get_player().hasStatusEffect(StatusEffects.TFMoltenPlate);
         };
         var _loc77_:Object = ValueFunc_Impl_.fromT("你已经被熔岩护甲覆盖了。");
         var _loc78_:Object = ValueFunc_Impl_.fromT("MoltenPlate");
         var _loc79_:Object = ValueFunc_Impl_.fromT(CombatRange.Self);
         var _loc80_:CombatAbility = new CombatAbility(new AbilityDef(tfMoltenPlate,_loc74_,_loc75_,_loc76_,_loc77_,_loc73_,"Molten Plate",_loc78_,ValueFunc_Impl_.fromT(5),null,null,true,null,null,null,null,_loc79_,null,null));
         var _loc81_:Object = NumberFunc_Impl_.fromFloat(tfFatigue(20,3));
         var _loc82_:Function = function():Boolean
         {
            if(_gthis.get_player().masteryLevel(MasteryLib.TerrestrialFire) >= 2)
            {
               return _gthis.tfComboReady("Shell");
            }
            return false;
         };
         var _loc83_:Object = ValueFunc_Impl_.fromT("Shell");
         var _loc84_:Object = ValueFunc_Impl_.fromT(CombatRange.Self);
         var _loc85_:CombatAbility = new CombatAbility(new AbilityDef(tfShell,function():String
         {
            return "连击：岩甲 + 熔岩护甲[pg-]硬化你的熔岩护甲，在一回合内免疫所有伤害。";
         },_loc82_,null,null,_loc81_,"Shell",_loc83_,ValueFunc_Impl_.fromT(5),null,null,true,null,null,null,4,_loc84_,null,null));
         var _loc86_:Object = NumberFunc_Impl_.fromFloat(tfFatigue(30,2));
         var _loc87_:Function = function():String
         {
            return "将你的魔力注入大地，造成轻微的物理伤害并使敌人踉跄。" + _gthis.get_combat().fancifyDamageRange(_gthis.tfQuakeCalc("min"),_gthis.tfQuakeCalc("max"));
         };
         var _loc88_:Function = function():Boolean
         {
            return _gthis.get_player().masteryLevel(MasteryLib.TerrestrialFire) >= 1;
         };
         var _loc89_:Object = ValueFunc_Impl_.fromT("Quake");
         var _loc90_:Object = ValueFunc_Impl_.fromT(CombatRange.Omni);
         var _loc91_:CombatAbility = new CombatAbility(new AbilityDef(tfQuake,_loc87_,_loc88_,null,null,_loc86_,"Quake",_loc89_,ValueFunc_Impl_.fromT(5),null,null,null,null,null,null,4,_loc90_,null,null));
         var _loc92_:Object = NumberFunc_Impl_.fromFloat(tfFatigue(40,2));
         var _loc93_:Function = function():String
         {
            return "从地下喷射出火焰。" + _gthis.get_combat().fancifyDamageRange(_gthis.tfSpoutCalc("min"),_gthis.tfSpoutCalc("max")) + _gthis.tfComboList("Spout");
         };
         var _loc94_:Function = function():Boolean
         {
            if(_gthis.get_player().masteryLevel(MasteryLib.TerrestrialFire) >= 1)
            {
               return !_gthis.tfCombod("Spout");
            }
            return false;
         };
         var _loc95_:Object = ValueFunc_Impl_.fromT("Spout");
         var _loc96_:Object = ValueFunc_Impl_.fromT(CombatRange.Ranged);
         var _loc97_:CombatAbility = new CombatAbility(new AbilityDef(tfSpout,_loc93_,_loc94_,null,null,_loc92_,"Spout",_loc95_,ValueFunc_Impl_.fromT(5),null,null,null,null,null,null,4,_loc96_,null,null));
         var _loc98_:Object = NumberFunc_Impl_.fromFloat(tfFatigue(50,3));
         var _loc99_:Function = function():String
         {
            return "连击：地震 + 喷发[pg-]利用裂开的大地，在大范围内释放火焰。" + _gthis.get_combat().fancifyDamageRange(_gthis.tfEruptionCalc("min"),_gthis.tfEruptionCalc("max"));
         };
         var _loc100_:Function = function():Boolean
         {
            if(_gthis.get_player().masteryLevel(MasteryLib.TerrestrialFire) >= 2)
            {
               return _gthis.tfComboReady("Eruption");
            }
            return false;
         };
         var _loc101_:Object = ValueFunc_Impl_.fromT("Eruption");
         var _loc102_:Object = ValueFunc_Impl_.fromT(CombatRange.Omni);
         var _loc103_:CombatAbility = new CombatAbility(new AbilityDef(tfEruption,_loc99_,_loc100_,null,null,_loc98_,"Eruption",_loc101_,ValueFunc_Impl_.fromT(5),null,null,null,null,null,null,4,_loc102_,null,null));
         var _loc104_:Object = NumberFunc_Impl_.fromFloat(tfFatigue(30,3));
         var _loc105_:Function = function():String
         {
            return "将你的力量注入大地，向敌人发射石块。每块石头" + _gthis.get_combat().fancifyDamageRange(_gthis.tfStoneKnivesCalc("min"),_gthis.tfStoneKnivesCalc("max")) + "，[b: " + _gthis.tfStoneKnivesAccuracy() + "%] 命中率)" + _gthis.tfComboList("Stone Knives");
         };
         var _loc106_:Function = function():Boolean
         {
            if(_gthis.get_player().masteryLevel(MasteryLib.TerrestrialFire) >= 2)
            {
               return !_gthis.tfCombod("Stone Knives");
            }
            return false;
         };
         var _loc107_:Object = ValueFunc_Impl_.fromT("StoneKnives");
         var _loc108_:Object = ValueFunc_Impl_.fromT(CombatRange.Ranged);
         var _loc109_:CombatAbility = new CombatAbility(new AbilityDef(tfStoneKnives,_loc105_,_loc106_,null,null,_loc104_,"Stone Knives",_loc107_,ValueFunc_Impl_.fromT(5),null,null,null,null,null,null,4,_loc108_,null,null));
         var _loc110_:Object = NumberFunc_Impl_.fromFloat(tfFatigue(40,4));
         var _loc111_:Function = function():String
         {
            return "连击：石刃 + 焦土[pg-]向所有敌人发射燃烧的石块弹幕，使飞行目标落地并造成更严重的伤害。每块石头" + _gthis.get_combat().fancifyDamageRange(_gthis.tfMeteorShowerCalc("min"),_gthis.tfMeteorShowerCalc("max")) + "，[b: " + _gthis.tfMeteorShowerAccuracy() + "%] 命中率)";
         };
         var _loc112_:Function = function():Boolean
         {
            if(_gthis.get_player().masteryLevel(MasteryLib.TerrestrialFire) >= 3)
            {
               return _gthis.tfComboReady("Meteor Shower");
            }
            return false;
         };
         var _loc113_:Object = ValueFunc_Impl_.fromT("MeteorShower");
         var _loc114_:Object = ValueFunc_Impl_.fromT(CombatRange.Ranged);
         var _loc115_:CombatAbility = new CombatAbility(new AbilityDef(tfMeteorShower,_loc111_,_loc112_,null,null,_loc110_,"Meteor Shower",_loc113_,ValueFunc_Impl_.fromT(5),null,null,null,null,null,null,4,_loc114_,null,null));
         var _loc116_:Object = NumberFunc_Impl_.fromFloat(tfFatigue(20,3));
         var _loc117_:Function = function():String
         {
            return "燃烧战场，对所有移动的敌人造成伤害。" + _gthis.get_combat().fancifyDamageRange(_gthis.tfScorchCalc("min"),_gthis.tfScorchCalc("max"));
         };
         var _loc118_:Function = function():Boolean
         {
            return _gthis.get_player().masteryLevel(MasteryLib.TerrestrialFire) >= 2;
         };
         var _loc119_:Object = function():Boolean
         {
            return _gthis.get_player().hasStatusEffect(StatusEffects.TFScorch);
         };
         var _loc120_:Object = ValueFunc_Impl_.fromT("焦土已经激活。");
         var _loc121_:Object = ValueFunc_Impl_.fromT("Scorch");
         var _loc122_:Object = ValueFunc_Impl_.fromT(CombatRange.Omni);
         var _loc123_:CombatAbility = new CombatAbility(new AbilityDef(tfScorch,_loc117_,_loc118_,_loc119_,_loc120_,_loc116_,"Scorch",_loc121_,ValueFunc_Impl_.fromT(5),null,null,null,null,null,null,4,_loc122_,null,null));
         var _loc124_:Object = NumberFunc_Impl_.fromFloat(tfFatigue(30,4));
         var _loc125_:Function = function():Boolean
         {
            return _gthis.get_player().masteryLevel(MasteryLib.TerrestrialFire) >= 3;
         };
         var _loc126_:Object = function():Boolean
         {
            return _gthis.get_player().get_gems() < 10;
         };
         var _loc127_:Object = ValueFunc_Impl_.fromT("需要10颗宝石。");
         var _loc128_:Object = ValueFunc_Impl_.fromT("GeodeKnuckle");
         var _loc129_:Object = ValueFunc_Impl_.fromT(CombatRange.Melee);
         var _loc130_:CombatAbility = new CombatAbility(new AbilityDef(tfGeodeKnuckle,function():String
         {
            return "注入大地的力量，给他们一拳。[pg-]消耗10颗宝石施放。";
         },_loc125_,_loc126_,_loc127_,_loc124_,"Geode Knuckle",_loc128_,ValueFunc_Impl_.fromT(5),null,null,null,null,null,null,4,_loc129_,null,null));
         var _loc131_:Object = NumberFunc_Impl_.fromInt(0);
         var _loc132_:Function = function():Boolean
         {
            return _gthis.get_player().get_weapon() == _gthis.get_weapons().G_KNUCKLE;
         };
         var _loc133_:Object = ValueFunc_Impl_.fromT("DispelKnuckle");
         var _loc134_:Object = ValueFunc_Impl_.fromT(CombatRange.Self);
         var _loc135_:CombatAbility = new CombatAbility(new AbilityDef(tfGeodeKnuckleDispel,function():String
         {
            return "解除装备的晶洞指虎。不消耗回合。";
         },_loc132_,null,null,_loc131_,"Dispel Geode Knuckle",_loc133_,ValueFunc_Impl_.fromT(5),null,true,true,null,null,null,0,_loc134_,null,null));
         var _loc136_:Object = NumberFunc_Impl_.fromFloat(tfFatigue(80,4));
         var _loc137_:Function = function():String
         {
            return "释放血液中的热量，以生命值为代价将欲望转化为伤害。" + _gthis.get_combat().fancifyLustRange(_gthis.tfCarnalBurnCalc("self")) + "" + _gthis.get_combat().fancifyDamageRange(_gthis.tfCarnalBurnCalc("damage"));
         };
         var _loc138_:Function = function():Boolean
         {
            return _gthis.get_player().masteryLevel(MasteryLib.TerrestrialFire) >= 3;
         };
         var _loc139_:Object = function():Boolean
         {
            return _gthis.tfCarnalBurnCalc("self") >= _gthis.get_player().get_HP();
         };
         var _loc140_:Object = ValueFunc_Impl_.fromT("如果你现在施放这个，你会没命的。");
         var _loc141_:Object = ValueFunc_Impl_.fromT("CarnalBurn");
         var _loc142_:Object = ValueFunc_Impl_.fromT(CombatRange.Ranged);
         var _loc143_:CombatAbility = new CombatAbility(new AbilityDef(tfCarnalBurn,_loc137_,_loc138_,_loc139_,_loc140_,_loc136_,"Carnal Burn",_loc141_,ValueFunc_Impl_.fromT(5),null,null,null,null,null,null,4,_loc142_,null,null));
         var _loc144_:Object = NumberFunc_Impl_.fromFloat(tfFatigue(70,6));
         var _loc145_:Function = function():String
         {
            return "大地与火焰合一，造成毁灭性的伤害。" + _gthis.get_combat().fancifyDamageRange(_gthis.tfTerraCoreCalc("min"),_gthis.tfTerraCoreCalc("max")) + _gthis.tfComboList("Terra Core");
         };
         var _loc146_:Function = function():Boolean
         {
            if(_gthis.get_player().masteryLevel(MasteryLib.TerrestrialFire) >= 4)
            {
               return !_gthis.tfCombod("Terra Core");
            }
            return false;
         };
         var _loc147_:Object = ValueFunc_Impl_.fromT("TerraCore");
         var _loc148_:Object = ValueFunc_Impl_.fromT(CombatRange.Ranged);
         var _loc149_:CombatAbility = new CombatAbility(new AbilityDef(tfTerraCore,_loc145_,_loc146_,null,null,_loc144_,"Terra Core",_loc147_,ValueFunc_Impl_.fromT(5),null,null,null,null,null,null,5,_loc148_,null,null));
         var _loc150_:Object = NumberFunc_Impl_.fromFloat(tfFatigue(70,6));
         var _loc151_:Function = function():String
         {
            return "释放大地与火焰的力量，摧毁战场。" + _gthis.get_combat().fancifyDamageRange(_gthis.tfTerraFlamesCalc("min"),_gthis.tfTerraFlamesCalc("max")) + _gthis.tfComboList("Terra Flames");
         };
         var _loc152_:Function = function():Boolean
         {
            if(_gthis.get_player().masteryLevel(MasteryLib.TerrestrialFire) >= 4)
            {
               return !_gthis.tfCombod("Terra Flames");
            }
            return false;
         };
         var _loc153_:Object = ValueFunc_Impl_.fromT("TerraFlames");
         var _loc154_:Object = ValueFunc_Impl_.fromT(CombatRange.Omni);
         var _loc155_:CombatAbility = new CombatAbility(new AbilityDef(tfTerraFlames,_loc151_,_loc152_,null,null,_loc150_,"Terra Flames",_loc153_,ValueFunc_Impl_.fromT(5),null,null,null,null,null,null,5,_loc154_,null,null));
         var _loc156_:Object = NumberFunc_Impl_.fromInt(0);
         var _loc157_:Function = function():String
         {
            return "特殊连击：地核 + 地火 + " + (_gthis.get_achievements().h[283] ? "地震 + 焦土 + 熔岩护甲" : "???") + "[pg-]土与火的完美融合，召唤一颗微型恒星持续攻击你的敌人。这是你魔法的巅峰，极其消耗体力，无法频繁使用。";
         };
         var _loc158_:Function = function():Boolean
         {
            if(_gthis.get_player().masteryLevel(MasteryLib.TerrestrialFire) >= 5 && _gthis.tfComboReady("Terra Star"))
            {
               return !_gthis.get_player().hasStatusEffect(StatusEffects.TFTerraStar);
            }
            return false;
         };
         var _loc159_:Object = function():Boolean
         {
            if(_gthis.get_player().get_fatigue100() <= 40)
            {
               return _gthis.get_player().hasStatusEffect(StatusEffects.TFTerraStarCooldown);
            }
            return true;
         };
         var _loc160_:Object = function():String
         {
            if(_gthis.get_player().hasStatusEffect(StatusEffects.TFTerraStarCooldown))
            {
               if(_gthis.get_player().statusEffectv2(StatusEffects.TFTerraStarCooldown) > 0)
               {
                  return "从超新星爆发中恢复并再次施放需要好几天的时间。";
               }
               return "你不能这么快再次施放。";
            }
            if(_gthis.get_player().get_fatigue100() > 40)
            {
               return "需要至少剩余60%的疲劳值。";
            }
            return "";
         };
         var _loc161_:Object = ValueFunc_Impl_.fromT("TerraStar");
         var _loc162_:Object = ValueFunc_Impl_.fromT(CombatRange.Self);
         var _loc163_:CombatAbility = new CombatAbility(new AbilityDef(tfTerraStar,_loc157_,_loc158_,_loc159_,_loc160_,_loc156_,"Terrestrial Star",_loc161_,ValueFunc_Impl_.fromT(5),null,true,null,null,null,null,null,_loc162_,null,null));
         var _loc164_:Object = NumberFunc_Impl_.fromInt(0);
         var _loc165_:Function = function():String
         {
            var _loc1_:String = "在你的星辰中聚集能量，然后以一场巨大的力量爆炸释放出来，消灭所有挡在你面前的人，完全不顾你自己的安全。[pg-]需要多个回合来充能，在此期间你无法做任何其他事情。";
            if(_gthis.getUseCount("Supernova") > 0 && !_gthis.get_achievements().h[283])
            {
               _loc1_ += "[pg]为了完全掌握地火，请用超新星击败一个更强的敌人来展示你的精通。";
            }
            return _loc1_;
         };
         var _loc166_:Function = function():Boolean
         {
            return _gthis.get_player().hasStatusEffect(StatusEffects.TFTerraStar);
         };
         var _loc167_:Object = ValueFunc_Impl_.fromT("Supernova");
         var _loc168_:Object = ValueFunc_Impl_.fromT(CombatRange.Omni);
         var _loc169_:CombatAbility = new CombatAbility(new AbilityDef(tfSupernova,_loc165_,_loc166_,null,null,_loc164_,"Supernova",_loc167_,ValueFunc_Impl_.fromT(5),null,true,null,null,null,null,null,_loc168_,null,null));
         var _loc170_:Function = function():Boolean
         {
            if(_gthis.get_achievements().h[283] || _gthis.get_player().hasStatusEffect(StatusEffects.TFTerraStar))
            {
               return false;
            }
            if(_gthis.get_player().masteryLevel(MasteryLib.TerrestrialFire) < 5 || _gthis.getUseCount("Supernova") < 1)
            {
               return !(_gthis.get_player().masteryLevel(MasteryLib.TerrestrialFire) >= 5 && _gthis.tfComboReady("Terra Star") && !_gthis.get_player().hasStatusEffect(StatusEffects.TFTerraStar));
            }
            return false;
         };
         var _loc171_:Object = function():String
         {
            var _loc1_:String = "你觉得关于地火还有更多需要学习的地方。";
            if(_gthis.get_player().masteryLevel(MasteryLib.TerrestrialFire) >= 5)
            {
               if(_gthis.getUseCount("Terrestrial Star") > 0)
               {
                  _loc1_ += "[pg-]你已经成功创造了一颗微型星辰，但毫无疑问，它还有更多用途。";
               }
               else
               {
                  _loc1_ += "[pg-]你应该能够将你的法术融合出惊人的效果，但你不太确定该怎么做。";
                  if(_gthis.get_player().get_str() + _gthis.get_player().get_inte() < 150)
                  {
                     _loc1_ += " 首先，你需要提升你的身心。";
                  }
                  else if(_gthis.tfSpellMod() < 2)
                  {
                     _loc1_ += " 你的魔法需要更强才有成功的机会。";
                  }
               }
            }
            return _loc1_;
         };
         var _loc172_:CombatAbility = new CombatAbility(new AbilityDef(function():void
         {
         },ValueFunc_Impl_.fromT(""),_loc170_,ValueFunc_Impl_.fromT(true),_loc171_,null,"???",ValueFunc_Impl_.fromT("???"),ValueFunc_Impl_.fromT(5),null,true,null,null,null,null,null,null,null,null));
         var _loc173_:Object = NumberFunc_Impl_.fromInt(30);
         var _loc174_:Function = function():String
         {
            var _loc1_:DamageRange = _gthis.cleansingPalmCalc();
            var _loc2_:String = "释放你净化光环的力量！对腐化的对手更有效，徒手时更强。对纯洁者无效。" + _loc1_.fancify();
            if(_gthis.canFist(3,FistStances.Monk))
            {
               _loc2_ += "[pg-][b:武僧架势]：净化掌同时会降低你的欲火。";
            }
            return _loc2_;
         };
         var _loc175_:Function = function():Boolean
         {
            return _gthis.get_player().hasPerk(PerkLib.CleansingPalm);
         };
         var _loc176_:Object = function():Boolean
         {
            return !_gthis.get_player().isPureEnough(10);
         };
         var _loc177_:Object = ValueFunc_Impl_.fromT("你太腐化了，无法使用这个法术。");
         var _loc178_:Object = ValueFunc_Impl_.fromT("C. Palm");
         var _loc179_:Object = ValueFunc_Impl_.fromT(CombatRange.Ranged);
         var _loc180_:CombatAbility = new CombatAbility(new AbilityDef(spellCleansingPalm,_loc174_,_loc175_,_loc176_,_loc177_,_loc173_,"Cleansing Palm",_loc178_,ValueFunc_Impl_.fromT(3),null,null,null,null,null,null,3,_loc179_,null,null));
         var _loc181_:Object = NumberFunc_Impl_.fromInt(15);
         var _loc182_:Function = function():String
         {
            return "召唤一把活体剑在战斗中协助你。它会在每回合结束时随机攻击一个目标，造成物理伤害。伤害由法术强度决定。" + _gthis.get_combat().fancifyDamageRange(_gthis.summonedSwordDamage(true,false),_gthis.summonedSwordDamage(false,true),_gthis.summonedSwordChance());
         };
         var _loc183_:Function = ValueFunc_Impl_.fromT(get_player().hasStatusEffect(StatusEffects.KnowsCSS));
         var _loc184_:Object = function():Boolean
         {
            return _gthis.get_player().statusEffectv1(StatusEffects.CirceSummonedScimitar) >= 3;
         };
         var _loc185_:Object = ValueFunc_Impl_.fromT("你无法集中精力控制更多的弯刀了。");
         var _loc186_:Object = ValueFunc_Impl_.fromT("Summon Scim.");
         var _loc187_:Object = ValueFunc_Impl_.fromT(CombatRange.Self);
         var _loc188_:CombatAbility = new CombatAbility(new AbilityDef(summonSword,_loc182_,_loc183_,_loc184_,_loc185_,_loc181_,"Circe\'s Summoned Scimitars",_loc186_,ValueFunc_Impl_.fromT(3),null,null,null,null,null,null,1,_loc187_,null,null));
         var _loc189_:Object = NumberFunc_Impl_.fromInt(20);
         var _loc190_:Function = ValueFunc_Impl_.fromT("对你的目标施放一个亵渎法术，使任何未来的治疗都会造成部分伤害。命中率受智力加成，持续时间由法术强度决定。[b:(" + Math.round(witherChance()) + "%)]");
         var _loc191_:Function = ValueFunc_Impl_.fromT(get_player().hasStatusEffect(StatusEffects.KnowsWither));
         var _loc192_:Object = function():Boolean
         {
            return _gthis.get_monster().hasStatusEffect(StatusEffects.Withering);
         };
         var _loc193_:Object = ValueFunc_Impl_.fromT("你的目标已经枯萎了！");
         var _loc194_:Object = ValueFunc_Impl_.fromT("Wither. Touch");
         var _loc195_:Object = ValueFunc_Impl_.fromT(CombatRange.Melee);
         var _loc196_:CombatAbility = new CombatAbility(new AbilityDef(wither,_loc190_,_loc191_,_loc192_,_loc193_,_loc189_,"Withering Touch",_loc194_,ValueFunc_Impl_.fromT(3),null,null,null,null,null,null,3,_loc195_,null,null));
         var _loc197_:Object = NumberFunc_Impl_.fromInt(20);
         var _loc198_:Function = ValueFunc_Impl_.fromT("用纯净的能量召唤并附魔战场周围的风，使每个角色在3回合内每回合有33%的几率恢复生命值。治疗量由法术强度决定。" + get_combat().fancifyHealRange(divineWindAmount(true,false),divineWindAmount(false,true)));
         var _loc199_:Function = ValueFunc_Impl_.fromT(get_player().hasStatusEffect(StatusEffects.KnowsDivineWind));
         var _loc200_:Object = function():Boolean
         {
            return _gthis.get_player().hasStatusEffect(StatusEffects.DivineWind);
         };
         var _loc201_:Object = ValueFunc_Impl_.fromT("战场已经被附魔了！");
         var _loc202_:Object = ValueFunc_Impl_.fromT("Divine Wind");
         var _loc203_:Object = ValueFunc_Impl_.fromT(CombatRange.Ranged);
         magicSpells = [_loc8_,_loc16_,_loc22_,_loc28_,_loc34_,_loc42_,_loc48_,_loc56_,_loc64_,_loc72_,_loc80_,_loc85_,_loc91_,_loc97_,_loc103_,_loc109_,_loc115_,_loc123_,_loc130_,_loc135_,_loc143_,_loc149_,_loc155_,_loc163_,_loc169_,_loc172_,_loc180_,_loc188_,_loc196_,new CombatAbility(new AbilityDef(divineWind,_loc198_,_loc199_,_loc200_,_loc201_,_loc197_,"Divine Wind",_loc202_,ValueFunc_Impl_.fromT(6),true,null,null,null,null,null,null,_loc203_,null,null))];
         var _loc204_:Function = ValueFunc_Impl_.fromT("移除你和目标敌人身上的大部分魔法效果，无论是正面的还是负面的。");
         var _loc205_:Function = function():Boolean
         {
            return _gthis.get_player().keyItemv1("Arian\'s Charged Talisman") == 1;
         };
         var _loc206_:Object = ValueFunc_Impl_.fromT("Dispel");
         var _loc207_:Object = ValueFunc_Impl_.fromT(CombatRange.Omni);
         var _loc208_:CombatAbility = new CombatAbility(new AbilityDef(dispellingSpell,_loc204_,_loc205_,null,null,null,"Arian\'s Talisman - Dispel",_loc206_,ValueFunc_Impl_.fromT(3),null,null,true,null,null,null,null,_loc207_,null,null));
         var _loc209_:Function = function():String
         {
            return "使用阿瑞安的护符治疗自己。" + _gthis.get_combat().fancifyHealRange(_gthis.talismanHealCalc(true),_gthis.talismanHealCalc(true,true));
         };
         var _loc210_:Function = function():Boolean
         {
            return _gthis.get_player().keyItemv1("Arian\'s Charged Talisman") == 2;
         };
         var _loc211_:Object = ValueFunc_Impl_.fromT("Healing");
         var _loc212_:Object = ValueFunc_Impl_.fromT(CombatRange.Self);
         var _loc213_:CombatAbility = new CombatAbility(new AbilityDef(healingSpell,_loc209_,_loc210_,null,null,null,"Arian\'s Talisman - Heal",_loc211_,ValueFunc_Impl_.fromT(3),true,null,true,null,null,null,null,_loc212_,null,null));
         var _loc214_:Function = function():String
         {
            return "使用阿瑞安的护符焚烧一个目标。" + _gthis.get_combat().fancifyDamageRange(_gthis.immolationDamageCalc(true),_gthis.immolationDamageCalc(true,true));
         };
         var _loc215_:Function = function():Boolean
         {
            return _gthis.get_player().keyItemv1("Arian\'s Charged Talisman") == 3;
         };
         var _loc216_:Object = ValueFunc_Impl_.fromT("Immolation");
         var _loc217_:Object = ValueFunc_Impl_.fromT(CombatRange.Ranged);
         var _loc218_:CombatAbility = new CombatAbility(new AbilityDef(immolationSpell,_loc214_,_loc215_,null,null,null,"Arian\'s Talisman - Immolation",_loc216_,ValueFunc_Impl_.fromT(3),null,null,null,null,null,null,null,_loc217_,null,null));
         var _loc219_:Function = ValueFunc_Impl_.fromT("使用阿瑞安的护符使自己平静下来并降低你的欲望。");
         var _loc220_:Function = function():Boolean
         {
            return _gthis.get_player().keyItemv1("Arian\'s Charged Talisman") == 4;
         };
         var _loc221_:Object = ValueFunc_Impl_.fromT("Lust Reduc.");
         var _loc222_:Object = ValueFunc_Impl_.fromT(CombatRange.Self);
         var _loc223_:CombatAbility = new CombatAbility(new AbilityDef(lustReductionSpell,_loc219_,_loc220_,null,null,null,"Arian\'s Talisman - Lust",_loc221_,ValueFunc_Impl_.fromT(3),null,null,true,null,null,null,null,_loc222_,null,null));
         var _loc224_:Function = ValueFunc_Impl_.fromT("使用你的络新妇法杖将疲劳转化为欲望。");
         var _loc225_:Function = function():Boolean
         {
            if(_gthis.get_player().get_weapon() == _gthis.get_weapons().NEPHSCEPT)
            {
               return _gthis.get_player().hasPerk(PerkLib.NephilaArchQueen);
            }
            return false;
         };
         var _loc226_:Object = ValueFunc_Impl_.fromT("\"Channel\" Staff");
         var _loc227_:Object = ValueFunc_Impl_.fromT(CombatRange.Self);
         var _loc228_:CombatAbility = new CombatAbility(new AbilityDef(nephilaStaffSpell,_loc224_,_loc225_,null,null,null,"Nephila Staff",_loc226_,ValueFunc_Impl_.fromT(3),null,null,true,null,null,null,null,_loc227_,null,null));
         var _loc229_:Function = ValueFunc_Impl_.fromT("使用阿瑞安的护符，用魔法护盾强化自己。");
         var _loc230_:Function = function():Boolean
         {
            return _gthis.get_player().keyItemv1("Arian\'s Charged Talisman") == 5;
         };
         var _loc231_:Object = ValueFunc_Impl_.fromT("Shielding");
         var _loc232_:Object = ValueFunc_Impl_.fromT(CombatRange.Self);
         var _loc233_:CombatAbility = new CombatAbility(new AbilityDef(shieldingSpell,_loc229_,_loc230_,null,null,null,"Arian\'s Talisman - Shield",_loc231_,ValueFunc_Impl_.fromT(3),null,null,true,null,null,null,null,_loc232_,null,null));
         var _loc234_:Function = ValueFunc_Impl_.fromT("让自己陷入狂怒！大幅提高你的武器强度并增加情欲抗性，但你的护甲防御会降至" + (get_player().hasPerk(PerkLib.ColdFury) ? "一半" : "零") + "！");
         var _loc235_:Function = function():Boolean
         {
            return _gthis.get_player().hasPerk(PerkLib.Berserker);
         };
         var _loc236_:Object = ValueFunc_Impl_.fromT("Berserk");
         var _loc237_:Object = function():Boolean
         {
            return _gthis.get_player().hasStatusEffect(StatusEffects.Berserking);
         };
         var _loc238_:Object = ValueFunc_Impl_.fromT("你已经够他妈的生气了！");
         var _loc239_:Object = ValueFunc_Impl_.fromT(CombatRange.Self);
         var _loc240_:CombatAbility = new CombatAbility(new AbilityDef(berserk,_loc234_,_loc235_,_loc237_,_loc238_,null,"Berserk",_loc236_,ValueFunc_Impl_.fromT(3),null,null,true,null,null,null,null,_loc239_,null,null));
         var _loc241_:Function = ValueFunc_Impl_.fromT("让自己陷入情欲狂怒！大幅提高你的武器强度并增加护甲防御，但你的情欲抗性会减半！");
         var _loc242_:Function = function():Boolean
         {
            return _gthis.get_player().hasPerk(PerkLib.Lustserker);
         };
         var _loc243_:Object = function():Boolean
         {
            return _gthis.get_player().hasStatusEffect(StatusEffects.Lustserking);
         };
         var _loc244_:Object = ValueFunc_Impl_.fromT("你已经够他妈的生气了！");
         var _loc245_:Object = ValueFunc_Impl_.fromT("Lustserk");
         var _loc246_:Object = ValueFunc_Impl_.fromT(CombatRange.Self);
         var _loc247_:CombatAbility = new CombatAbility(new AbilityDef(lustserk,_loc241_,_loc242_,_loc243_,_loc244_,null,"Lustserk",_loc245_,ValueFunc_Impl_.fromT(3),null,null,true,null,null,null,null,_loc246_,null,null));
         var _loc248_:Object = NumberFunc_Impl_.fromInt(20);
         var _loc249_:Function = function():String
         {
            return "从口中喷出火焰。每天只能使用一次。" + _gthis.get_combat().fancifyDamageRange(_gthis.dragonBreathCalc(true),_gthis.dragonBreathCalc(true,true));
         };
         var _loc250_:Function = function():Boolean
         {
            return _gthis.get_player().hasPerk(PerkLib.Dragonfire);
         };
         var _loc251_:Object = function():Boolean
         {
            return _gthis.get_player().hasStatusEffect(StatusEffects.DragonBreathCooldown);
         };
         var _loc252_:Object = ValueFunc_Impl_.fromT("你燃烧的喉咙提醒你，你还没有准备好再次释放龙息。");
         var _loc253_:Object = ValueFunc_Impl_.fromT("Dragon B.");
         var _loc254_:Object = ValueFunc_Impl_.fromT(CombatRange.Ranged);
         var _loc255_:CombatAbility = new CombatAbility(new AbilityDef(dragonBreath,_loc249_,_loc250_,_loc251_,_loc252_,_loc248_,"Dragon Breath",_loc253_,ValueFunc_Impl_.fromT(3),null,null,true,null,null,null,null,_loc254_,null,null));
         var _loc256_:Object = NumberFunc_Impl_.fromInt(20);
         var _loc257_:Function = function():String
         {
            return "从口中喷出地火。" + _gthis.get_combat().fancifyDamageRange(_gthis.fireballCalc(true),_gthis.fireballCalc(true,true),_gthis.fireballChance());
         };
         var _loc258_:Function = function():Boolean
         {
            if(!_gthis.get_player().hasPerk(PerkLib.FireLord))
            {
               return _gthis.get_player().hasPerk(PerkLib.TerrestrialFire);
            }
            return true;
         };
         var _loc259_:Object = ValueFunc_Impl_.fromT("Terra Fire");
         var _loc260_:Object = ValueFunc_Impl_.fromT(CombatRange.Ranged);
         var _loc261_:CombatAbility = new CombatAbility(new AbilityDef(fireballuuuuu,_loc257_,_loc258_,null,null,_loc256_,"Terra Fire",_loc259_,ValueFunc_Impl_.fromT(3),null,null,null,null,null,null,2,_loc260_,null,null));
         var _loc262_:Object = NumberFunc_Impl_.fromInt(20);
         var _loc263_:Function = function():String
         {
            return "从口中喷出地狱火。" + _gthis.get_combat().fancifyDamageRange(_gthis.firebreathCalc(true),_gthis.firebreathCalc(true,true),_gthis.fireballChance());
         };
         var _loc264_:Function = function():Boolean
         {
            return _gthis.get_player().hasPerk(PerkLib.Hellfire);
         };
         var _loc265_:Object = ValueFunc_Impl_.fromT("Hellfire");
         var _loc266_:Object = ValueFunc_Impl_.fromT(CombatRange.Ranged);
         var _loc267_:CombatAbility = new CombatAbility(new AbilityDef(hellFire,_loc263_,_loc264_,null,null,_loc262_,"Hellfire",_loc265_,ValueFunc_Impl_.fromT(3),null,null,null,null,null,null,3,_loc266_,null,null));
         var _loc268_:Function = function():String
         {
            return "尝试暂时附身敌人，迫使他们提升自己的欲望。[b:(" + _gthis.possessChance() + "%)]";
         };
         var _loc269_:Function = function():Boolean
         {
            return _gthis.get_player().hasPerk(PerkLib.Incorporeality);
         };
         var _loc270_:Object = ValueFunc_Impl_.fromT("Possess");
         var _loc271_:Object = ValueFunc_Impl_.fromT(CombatRange.Ranged);
         var _loc272_:CombatAbility = new CombatAbility(new AbilityDef(possess,_loc268_,_loc269_,null,null,null,"Possess",_loc270_,ValueFunc_Impl_.fromT(3),null,null,null,null,null,null,3,_loc271_,null,null));
         var _loc273_:Object = NumberFunc_Impl_.fromInt(10);
         var _loc274_:Function = ValueFunc_Impl_.fromT("如果你的精神强于对手，低语并使其产生恐惧。");
         var _loc275_:Function = function():Boolean
         {
            return _gthis.get_player().hasPerk(PerkLib.Whispered);
         };
         var _loc276_:Object = function():Boolean
         {
            return _gthis.get_monster().hasStatusEffect(StatusEffects.Fear);
         };
         var _loc277_:Object = ValueFunc_Impl_.fromT("你的目标已经被低语了！");
         var _loc278_:Object = ValueFunc_Impl_.fromT("Whisper");
         var _loc279_:Object = ValueFunc_Impl_.fromT(CombatRange.Ranged);
         var _loc280_:CombatAbility = new CombatAbility(new AbilityDef(superWhisperAttack,_loc274_,_loc275_,_loc276_,_loc277_,_loc273_,"Whisper",_loc278_,ValueFunc_Impl_.fromT(3),null,null,null,null,null,null,3,_loc279_,null,null));
         var _loc281_:Object = NumberFunc_Impl_.fromInt(35);
         var _loc282_:Function = function():String
         {
            return "向对手释放一团腐化的紫色火焰，造成高额伤害。对腐化敌人效果较弱，目标欲望越高，造成的伤害越大。" + _gthis.get_combat().fancifyDamageRange(_gthis.corrFoxFireCalc(true),_gthis.corrFoxFireCalc(true,true));
         };
         var _loc283_:Function = function():Boolean
         {
            return _gthis.get_player().hasPerk(PerkLib.CorruptedNinetails);
         };
         var _loc284_:Object = ValueFunc_Impl_.fromT("C. Foxfire");
         var _loc285_:Object = ValueFunc_Impl_.fromT(CombatRange.Ranged);
         var _loc286_:CombatAbility = new CombatAbility(new AbilityDef(corruptedFoxFire,_loc282_,_loc283_,null,null,_loc281_,"Corrupted Foxfire",_loc284_,ValueFunc_Impl_.fromT(3),null,null,null,null,null,null,3,_loc285_,null,null));
         var _loc287_:Object = NumberFunc_Impl_.fromInt(20);
         var _loc288_:Function = function():String
         {
            return "用不可名状的恐怖让对手感到恐惧。在一场战斗中施放次数越多，效果越弱。[b:(" + _gthis.kitsuneChanceCalc() + "%)]";
         };
         var _loc289_:Function = function():Boolean
         {
            return _gthis.get_player().hasPerk(PerkLib.CorruptedNinetails);
         };
         var _loc290_:Object = ValueFunc_Impl_.fromT("Terror");
         var _loc291_:Object = ValueFunc_Impl_.fromT(CombatRange.Ranged);
         var _loc292_:CombatAbility = new CombatAbility(new AbilityDef(kitsuneTerror,_loc288_,_loc289_,null,null,_loc287_,"Terror",_loc290_,ValueFunc_Impl_.fromT(3),null,null,null,null,null,null,3,_loc291_,null,null));
         var _loc293_:Object = NumberFunc_Impl_.fromInt(35);
         var _loc294_:Function = function():String
         {
            return "向对手释放一团空灵的蓝色火焰，造成高额伤害。对腐化敌人效果更强，根据目标的欲望比例治疗你。" + _gthis.get_combat().fancifyDamageRange(_gthis.foxFireCalc(true),_gthis.foxFireCalc(true,true)) + "" + _gthis.get_combat().fancifyHealRange(_gthis.foxFireCalc(true,false,true),_gthis.foxFireCalc(true,true,true));
         };
         var _loc295_:Function = function():Boolean
         {
            return _gthis.get_player().hasPerk(PerkLib.EnlightenedNinetails);
         };
         var _loc296_:Object = ValueFunc_Impl_.fromT("Foxfire");
         var _loc297_:Object = ValueFunc_Impl_.fromT(CombatRange.Ranged);
         var _loc298_:CombatAbility = new CombatAbility(new AbilityDef(foxFire,_loc294_,_loc295_,null,null,_loc293_,"Foxfire",_loc296_,ValueFunc_Impl_.fromT(3),null,null,null,null,null,null,3,_loc297_,null,null));
         var _loc299_:Object = NumberFunc_Impl_.fromInt(25);
         var _loc300_:Function = function():String
         {
            return "扭曲对手周围的现实，降低他们的速度。在一场战斗中施放次数越多，效果越弱。[b:(" + _gthis.kitsuneIllusionChance() + "%)]";
         };
         var _loc301_:Function = function():Boolean
         {
            return _gthis.get_player().hasPerk(PerkLib.EnlightenedNinetails);
         };
         var _loc302_:Object = ValueFunc_Impl_.fromT("Illusion");
         var _loc303_:Object = ValueFunc_Impl_.fromT(CombatRange.Omni);
         var _loc304_:CombatAbility = new CombatAbility(new AbilityDef(kitsuneIllusion,_loc300_,_loc301_,null,null,_loc299_,"Illusion",_loc302_,ValueFunc_Impl_.fromT(3),null,null,null,null,null,null,3,_loc303_,null,null));
         var _loc305_:Object = NumberFunc_Impl_.fromInt(20);
         var _loc306_:Function = function():String
         {
            return "凝视对手，降低他们的速度。在一场战斗中使用次数越多，效果越弱。[b:(" + _gthis.paralyzingStareChance() + "%)]";
         };
         var _loc307_:Function = function():Boolean
         {
            return _gthis.get_player().canUseStare();
         };
         var _loc308_:Object = ValueFunc_Impl_.fromT("Stare");
         var _loc309_:Object = ValueFunc_Impl_.fromT(CombatRange.Ranged);
         var _loc310_:CombatAbility = new CombatAbility(new AbilityDef(paralyzingStare,_loc306_,_loc307_,null,null,_loc305_,"Paralyzing Stare",_loc308_,ValueFunc_Impl_.fromT(3),null,null,null,null,null,null,3,_loc309_,null,null));
         var _loc311_:Function = ValueFunc_Impl_.fromT("凝视被诅咒的护身符，考验你自己的精神。");
         var _loc312_:Function = function():Boolean
         {
            return _gthis.get_player().hasKeyItem("Family Talisman");
         };
         var _loc313_:Object = function():Boolean
         {
            return _gthis.get_player().hasStatusEffect(StatusEffects.Resolve);
         };
         var _loc314_:Object = ValueFunc_Impl_.fromT("你的精神已经被考验过了！");
         var _loc315_:Object = ValueFunc_Impl_.fromT("Test Resolve");
         var _loc316_:Object = ValueFunc_Impl_.fromT(CombatRange.Self);
         var _loc317_:CombatAbility = new CombatAbility(new AbilityDef(testResolve,_loc311_,_loc312_,_loc313_,_loc314_,null,"Test Resolve",_loc315_,ValueFunc_Impl_.fromT(3),null,null,true,null,null,null,null,_loc316_,null,null));
         var _loc318_:Function = ValueFunc_Impl_.fromT("让你的灵魂燃烧，大幅增强你的法术强度，但会使你的生命值减半，并移除所有的物理防御。");
         var _loc319_:Function = function():Boolean
         {
            return _gthis.get_player().hasStatusEffect(StatusEffects.KnowsSoulburst);
         };
         var _loc320_:Object = ValueFunc_Impl_.fromT("Soulburst");
         var _loc321_:Object = ValueFunc_Impl_.fromT(CombatRange.Self);
         var _loc322_:CombatAbility = new CombatAbility(new AbilityDef(soulburst,_loc318_,_loc319_,null,null,null,"Soulburst",_loc320_,ValueFunc_Impl_.fromT(3),null,null,true,null,null,null,5,_loc321_,null,null));
         var _loc323_:Function = ValueFunc_Impl_.fromT("测试");
         var _loc324_:Function = ValueFunc_Impl_.fromT(get_debug());
         var _loc325_:Object = ValueFunc_Impl_.fromT("Soulburst");
         var _loc326_:Object = ValueFunc_Impl_.fromT(CombatRange.Self);
         var _loc327_:CombatAbility = new CombatAbility(new AbilityDef(overhealtest,_loc323_,_loc324_,null,null,null,"Soulburst",_loc325_,ValueFunc_Impl_.fromT(3),null,null,true,null,null,null,null,_loc326_,null,null));
         var _loc328_:Object = NumberFunc_Impl_.fromInt(10);
         var _loc329_:Function = function():String
         {
            var _loc1_:DamageRange = _gthis.mermaidChantLust();
            var _loc2_:DamageRange = _gthis.mermaidChantDebuff();
            return "唱歌以减缓并诱惑所有听到的人。受挑逗加成影响。" + _loc1_.fancifyLust() + "" + _loc2_.fancify();
         };
         var _loc330_:Function = function():Boolean
         {
            return _gthis.get_player().hasPerk(PerkLib.MermaidChant);
         };
         var _loc331_:Object = ValueFunc_Impl_.fromT("Chant");
         var _loc332_:Object = ValueFunc_Impl_.fromT(CombatRange.Ranged);
         magicAbilities = [_loc208_,_loc213_,_loc218_,_loc223_,_loc228_,_loc233_,_loc240_,_loc247_,_loc255_,_loc261_,_loc267_,_loc272_,_loc280_,_loc286_,_loc292_,_loc298_,_loc304_,_loc310_,_loc317_,_loc322_,_loc327_,new CombatAbility(new AbilityDef(mermaidChant,_loc329_,_loc330_,null,null,_loc328_,"Chant",_loc331_,ValueFunc_Impl_.fromT(3),null,null,null,null,null,null,null,_loc332_,null,null))];
         var _loc333_:Function = function():String
         {
            return "尝试用头皮上长出的刺痛触手攻击对手。增加敌人的欲望，同时降低他们的速度。" + _gthis.get_combat().fancifyLustRange(_gthis.anemoneCalc(true),_gthis.anemoneCalc(true,true)) + "" + _gthis.get_combat().fancifyDamageRange(_gthis.anemoneCalc(true,false,true),_gthis.anemoneCalc(true,true,true),_gthis.anemoneChance());
         };
         var _loc334_:Function = function():Boolean
         {
            return _gthis.get_player().hair.type == 4;
         };
         var _loc335_:Object = ValueFunc_Impl_.fromT("AnemoneSting");
         var _loc336_:Object = ValueFunc_Impl_.fromT(CombatRange.Melee);
         var _loc337_:CombatAbility = new CombatAbility(new AbilityDef(anemoneSting,_loc333_,_loc334_,null,null,null,"Anemone Sting",_loc335_,ValueFunc_Impl_.fromT(2),null,null,null,null,null,null,3,_loc336_,null,null));
         var _loc338_:Object = NumberFunc_Impl_.fromInt(35);
         var _loc339_:Function = function():String
         {
            return "释放居住在你子宫里的黏液触手怪物幼体。它们会蜂拥攻击你的对手，降低他们的速度，造成伤害，并可能造成流血。在一场战斗中使用的次数越多，流血效果就越差。" + _gthis.get_combat().fancifyDamageRange(_gthis.broodBiteCalc(true),_gthis.broodBiteCalc(false,true));
         };
         var _loc340_:Function = function():Boolean
         {
            return _gthis.get_player().hasPerk(PerkLib.NephilaArchQueen);
         };
         var _loc341_:Object = ValueFunc_Impl_.fromT("Unleash");
         var _loc342_:Object = ValueFunc_Impl_.fromT(CombatRange.Ranged);
         var _loc343_:CombatAbility = new CombatAbility(new AbilityDef(unleashBrood,_loc339_,_loc340_,null,null,_loc338_,"Unleash Brood",_loc341_,ValueFunc_Impl_.fromT(2),null,null,null,null,null,null,3,_loc342_,null,null));
         var _loc344_:Object = NumberFunc_Impl_.fromInt(25);
         var _loc345_:Function = function():String
         {
            return "尝试用你的鲨鱼牙齿咬你的对手。可能会造成流血。" + _gthis.get_combat().fancifyDamageRange(_gthis.biteCalc(true),_gthis.biteCalc(false,true));
         };
         var _loc346_:Function = function():Boolean
         {
            return _gthis.get_player().face.type == 4;
         };
         var _loc347_:Object = ValueFunc_Impl_.fromT("SharkBite");
         var _loc348_:Object = ValueFunc_Impl_.fromT(CombatRange.Melee);
         var _loc349_:CombatAbility = new CombatAbility(new AbilityDef(bite,_loc345_,_loc346_,null,null,_loc344_,"Shark Bite",_loc347_,ValueFunc_Impl_.fromT(2),null,null,null,null,null,null,2,_loc348_,null,null));
         var _loc350_:Object = NumberFunc_Impl_.fromInt(10);
         var _loc351_:Function = function():String
         {
            return "尝试咬你的对手并注入毒液，降低力量和速度" + _gthis.get_combat().fancifyDamageRange(_gthis.nagaCalc(true),_gthis.nagaCalc(true,true),_gthis.nagaChance()) + "。如果你缠绕住了敌人，效果翻倍。";
         };
         var _loc352_:Function = function():Boolean
         {
            return _gthis.get_player().face.type == 5;
         };
         var _loc353_:Object = ValueFunc_Impl_.fromT("Naga Bite");
         var _loc354_:Object = ValueFunc_Impl_.fromT(CombatRange.Melee);
         var _loc355_:CombatAbility = new CombatAbility(new AbilityDef(nagaBiteAttack,_loc351_,_loc352_,null,null,_loc350_,"Naga Bite",_loc353_,ValueFunc_Impl_.fromT(2),null,null,null,null,null,null,2,_loc354_,null,null));
         var _loc356_:Object = NumberFunc_Impl_.fromInt(10);
         var _loc357_:Function = function():String
         {
            return "尝试咬你的对手并注入毒液。" + _gthis.get_combat().fancifyLustRange(_gthis.spiderbiteCalc(),0,_gthis.spiderbiteChance());
         };
         var _loc358_:Function = function():Boolean
         {
            return _gthis.get_player().face.type == 10;
         };
         var _loc359_:Object = ValueFunc_Impl_.fromT("Sp. Bite");
         var _loc360_:Object = ValueFunc_Impl_.fromT(CombatRange.Melee);
         var _loc361_:CombatAbility = new CombatAbility(new AbilityDef(spiderBiteAttack,_loc357_,_loc358_,null,null,_loc356_,"Spider Bite",_loc359_,ValueFunc_Impl_.fromT(2),null,null,null,null,null,null,2,_loc360_,null,null));
         var _loc362_:Object = NumberFunc_Impl_.fromFloatFun(function():Number
         {
            return (_gthis.get_player().hasPerk(PerkLib.PracticedForm) ? 20 : 25) - Math.min(15,_gthis.get_player().masteryLevel(MasteryLib.Bow) * 5);
         });
         var _loc363_:Function = function():String
         {
            return "使用弓向你的对手射箭。" + _gthis.get_combat().fancifyDamageRange(int(_gthis.fireBowCalc(true).finalDamage),int(_gthis.fireBowCalc(true,true).finalDamage),_gthis.fireBowChance());
         };
         var _loc364_:Function = function():Boolean
         {
            if(!_gthis.get_player().hasKeyItem("Bow"))
            {
               return _gthis.get_player().hasKeyItem("Kelt\'s Bow");
            }
            return true;
         };
         var _loc365_:Object = ValueFunc_Impl_.fromT("Fire Bow");
         var _loc366_:Object = ValueFunc_Impl_.fromT(CombatRange.Ranged);
         var _loc367_:CombatAbility = new CombatAbility(new AbilityDef(fireBow,_loc363_,_loc364_,null,null,_loc362_,"Fire Bow",_loc365_,ValueFunc_Impl_.fromT(2),null,null,null,true,null,null,null,_loc366_,null,null));
         var _loc368_:Object = NumberFunc_Impl_.fromFloatFun(function():Number
         {
            return (_gthis.get_player().hasPerk(PerkLib.PracticedForm) ? 80 : 100) - _gthis.get_player().masteryLevel(MasteryLib.Bow) * 12;
         });
         var _loc369_:Function = function():String
         {
            return "使用弓箭向对手射出扇形的箭矢。每支箭造成 " + _gthis.get_combat().fancifyDamageRange(int(_gthis.fireBowCalc(true).finalDamage) / 2,int(_gthis.fireBowCalc(true,true).finalDamage) / 2,_gthis.fireBowChance() / 1.75) + " 点伤害";
         };
         var _loc370_:Function = function():Boolean
         {
            if(_gthis.get_player().hasPerk(PerkLib.FanShot))
            {
               if(!_gthis.get_player().hasKeyItem("Bow"))
               {
                  return _gthis.get_player().hasKeyItem("Kelt\'s Bow");
               }
               return true;
            }
            return false;
         };
         var _loc371_:Object = ValueFunc_Impl_.fromT("Fan Shot");
         var _loc372_:Object = ValueFunc_Impl_.fromT(CombatRange.Ranged);
         var _loc373_:CombatAbility = new CombatAbility(new AbilityDef(fanShot,_loc369_,_loc370_,null,null,_loc368_,"Fan Shot",_loc371_,ValueFunc_Impl_.fromT(2),null,null,null,null,null,null,null,_loc372_,null,null));
         var _loc374_:Object = NumberFunc_Impl_.fromInt(10);
         var _loc375_:Function = ValueFunc_Impl_.fromT("尝试用你长长的蛇尾缠绕敌人。");
         var _loc376_:Function = function():Boolean
         {
            return _gthis.get_player().lowerBody.type == 3;
         };
         var _loc377_:Object = ValueFunc_Impl_.fromT("Constrict");
         var _loc378_:Object = ValueFunc_Impl_.fromT(CombatRange.ChargingMelee);
         var _loc379_:CombatAbility = new CombatAbility(new AbilityDef(nagaPlayerConstrict,_loc375_,_loc376_,null,null,_loc374_,"Constrict",_loc377_,ValueFunc_Impl_.fromT(2),null,null,null,null,null,null,null,_loc378_,null,null));
         var _loc380_:Object = NumberFunc_Impl_.fromInt(15);
         var _loc381_:Function = function():String
         {
            return "尝试用你强壮的下半身踢击敌人。" + _gthis.get_combat().fancifyDamageRange(_gthis.kickCalc(true),_gthis.kickCalc(false,true),_gthis.get_monster().standardDodgeFunc(_gthis.get_player()));
         };
         var _loc382_:Function = function():Boolean
         {
            if(!(_gthis.get_player().isTaur() || _gthis.get_player().lowerBody.type == 1 || _gthis.get_player().lowerBody.type == 12))
            {
               return _gthis.get_player().lowerBody.type == 14;
            }
            return true;
         };
         var _loc383_:Object = ValueFunc_Impl_.fromT("Kick");
         var _loc384_:Object = ValueFunc_Impl_.fromT(CombatRange.ChargingMelee);
         var _loc385_:CombatAbility = new CombatAbility(new AbilityDef(kick,_loc381_,_loc382_,null,null,_loc380_,"Kick",_loc383_,ValueFunc_Impl_.fromT(2),null,null,null,null,null,null,null,_loc384_,null,null));
         var _loc386_:Object = NumberFunc_Impl_.fromInt(15);
         var _loc387_:Function = function():String
         {
            return "低下头向对手冲锋，试图用你的角刺穿他们。角越大，这种攻击越强，也越容易命中。" + _gthis.get_combat().fancifyDamageRange(_gthis.goreCalc(true),_gthis.goreCalc(false,true),_gthis.goreChance());
         };
         var _loc388_:Function = function():Boolean
         {
            if(_gthis.get_player().horns.type == 2)
            {
               return _gthis.get_player().horns.value >= 6;
            }
            return false;
         };
         var _loc389_:Object = ValueFunc_Impl_.fromT("Gore");
         var _loc390_:Object = ValueFunc_Impl_.fromT(CombatRange.ChargingMelee);
         var _loc391_:CombatAbility = new CombatAbility(new AbilityDef(goreAttack,_loc387_,_loc388_,null,null,_loc386_,"Gore",_loc389_,ValueFunc_Impl_.fromT(2),null,null,null,null,null,null,null,_loc390_,null,null));
         var _loc392_:Object = NumberFunc_Impl_.fromInt(15);
         var _loc393_:Function = function():String
         {
            return "使用冲撞头槌试图击晕你的敌人。" + _gthis.get_combat().fancifyDamageRange(_gthis.ramCalc(true),_gthis.ramCalc(false,true),_gthis.goreChance());
         };
         var _loc394_:Function = function():Boolean
         {
            if(_gthis.get_player().horns.type == 10)
            {
               return _gthis.get_player().horns.value >= 2;
            }
            return false;
         };
         var _loc395_:Object = ValueFunc_Impl_.fromT("Horn Stun");
         var _loc396_:Object = ValueFunc_Impl_.fromT(CombatRange.ChargingMelee);
         var _loc397_:CombatAbility = new CombatAbility(new AbilityDef(ramsStun,_loc393_,_loc394_,null,null,_loc392_,"Horn Stun",_loc395_,ValueFunc_Impl_.fromT(2),null,null,null,null,null,null,3,_loc396_,null,null));
         var _loc398_:Function = get_game().mountain.wormsScene.playerInfest;
         var _loc399_:Object = NumberFunc_Impl_.fromInt(40);
         var _loc400_:Function = function():Boolean
         {
            if(_gthis.get_player().hasStatusEffect(StatusEffects.Infested) && _gthis.get_player().statusEffectv1(StatusEffects.Infested) == 5)
            {
               return _gthis.get_player().hasCock();
            }
            return false;
         };
         var _loc401_:Object = ValueFunc_Impl_.fromT("Infest");
         var _loc402_:Object = ValueFunc_Impl_.fromT(CombatRange.Ranged);
         var _loc403_:CombatAbility = new CombatAbility(new AbilityDef(_loc398_,function():String
         {
            return "寄生攻击允许你随意射精，向你的对手发射精液和蠕虫流以寄生他们。除非你的敌人非常兴奋，否则他们很可能会轻易避开它。仅对男性或扶他有效。[pg-]同时也是降低你欲望的好方法。";
         },_loc400_,null,null,_loc399_,"Infest",_loc401_,ValueFunc_Impl_.fromT(2),null,null,null,null,null,null,null,_loc402_,null,null));
         var _loc404_:Function = ValueFunc_Impl_.fromT("让你的寄生虫产生的甜美麝香弥漫在空气中，持续几个回合。这种气味会提高敌人的欲望，同时也会以较低的速度提高你的欲望。");
         var _loc405_:Function = function():Boolean
         {
            return _gthis.get_player().hasPerk(PerkLib.ParasiteMusk);
         };
         var _loc406_:Object = ValueFunc_Impl_.fromT("空气中已经弥漫着寄生虫的麝香了！");
         var _loc407_:Object = function():Boolean
         {
            return _gthis.get_player().hasStatusEffect(StatusEffects.ParasiteSlugMusk);
         };
         var _loc408_:Object = ValueFunc_Impl_.fromT("Release Scent");
         var _loc409_:Object = ValueFunc_Impl_.fromT(CombatRange.Omni);
         var _loc410_:CombatAbility = new CombatAbility(new AbilityDef(parasiteReleaseMusk,_loc404_,_loc405_,_loc407_,_loc406_,null,"Release Scent",_loc408_,ValueFunc_Impl_.fromT(2),null,null,true,null,null,null,null,_loc409_,null,null));
         var _loc411_:Function = function():String
         {
            return "牺牲你的一只寄生虫，获得 " + _gthis.get_combat().colorText(DamageColor.Heal,"" + _gthis.parasiteCalc()) + " 点力量、体质和速度。";
         };
         var _loc412_:Function = function():Boolean
         {
            return _gthis.get_player().hasPerk(PerkLib.ParasiteQueen);
         };
         var _loc413_:Object = function():String
         {
            if(_gthis.get_player().hasStatusEffect(StatusEffects.ParasiteQueen))
            {
               return "你已经因为牺牲了一只寄生虫而精力充沛了！";
            }
            return "你没有足够的寄生虫，它们不会服从你的！";
         };
         var _loc414_:Object = function():Boolean
         {
            if(_gthis.get_player().statusEffectv1(StatusEffects.ParasiteEel) > 5)
            {
               return _gthis.get_player().hasStatusEffect(StatusEffects.ParasiteQueen);
            }
            return true;
         };
         var _loc415_:Object = ValueFunc_Impl_.fromT("Parasite Queen");
         var _loc416_:Object = ValueFunc_Impl_.fromT(CombatRange.Self);
         var _loc417_:CombatAbility = new CombatAbility(new AbilityDef(parasiteQueen,_loc411_,_loc412_,_loc414_,_loc413_,null,"Parasite Queen",_loc415_,ValueFunc_Impl_.fromT(2),null,null,true,null,null,null,null,_loc416_,null,null));
         var _loc418_:Function = function():String
         {
            return "牺牲你的一只寄生虫，获得 " + _gthis.get_combat().colorText(DamageColor.Heal,"" + _gthis.nephilaCalc()) + " 点智力提升。";
         };
         var _loc419_:Function = function():Boolean
         {
            return _gthis.get_player().hasPerk(PerkLib.NephilaQueen);
         };
         var _loc420_:Object = function():String
         {
            if(_gthis.get_player().hasStatusEffect(StatusEffects.NephilaQueen))
            {
               return "你已经因为牺牲了一只寄生虫而精力充沛了！";
            }
            return "你没有足够的寄生虫，它们不会服从你的！";
         };
         var _loc421_:Object = function():Boolean
         {
            if(_gthis.get_player().statusEffectv1(StatusEffects.ParasiteNephila) > 2)
            {
               return _gthis.get_player().hasStatusEffect(StatusEffects.NephilaQueen);
            }
            return true;
         };
         var _loc422_:Object = ValueFunc_Impl_.fromT("Nephila Queen");
         var _loc423_:Object = ValueFunc_Impl_.fromT(CombatRange.Self);
         var _loc424_:CombatAbility = new CombatAbility(new AbilityDef(nephilaQueen,_loc418_,_loc419_,_loc421_,_loc420_,null,"Nephila Queen",_loc422_,ValueFunc_Impl_.fromT(2),null,null,true,null,null,null,null,_loc423_,null,null));
         var _loc425_:Function = ValueFunc_Impl_.fromT("尝试用涂有药物的口红亲吻敌人的嘴唇。对没有阴茎的敌人无效。");
         var _loc426_:Function = function():Boolean
         {
            return _gthis.get_player().hasStatusEffect(StatusEffects.LustStickApplied);
         };
         var _loc427_:Object = ValueFunc_Impl_.fromT("Kiss");
         var _loc428_:Object = ValueFunc_Impl_.fromT(CombatRange.Ranged);
         var _loc429_:CombatAbility = new CombatAbility(new AbilityDef(kissAttack,_loc425_,_loc426_,null,null,null,"Kiss",_loc427_,ValueFunc_Impl_.fromT(2),null,null,null,null,null,null,null,_loc428_,null,null));
         var _loc430_:Function = function():String
         {
            return "尝试用你那有毒的蜜蜂毒刺攻击敌人。" + _gthis.get_combat().fancifyLustRange(_gthis.stingerCalc(true),_gthis.stingerCalc(true,true),_gthis.get_monster().standardDodgeFunc(_gthis.get_player())) + "[pg-]请注意，你的毒液需要相当长的时间才能积聚，因此根据你腹部的不应期，你可能需要在两次蛰刺之间等待很长时间。[pg-]毒液：" + Math.floor(_gthis.get_player().tail.venom) + "/100";
         };
         var _loc431_:Function = function():Boolean
         {
            return _gthis.get_player().tail.type == 6;
         };
         var _loc432_:Object = function():Boolean
         {
            return _gthis.get_player().tail.venom < 33;
         };
         var _loc433_:Object = ValueFunc_Impl_.fromT("你现在没有足够的毒液来蛰刺！");
         var _loc434_:Object = ValueFunc_Impl_.fromT("Sting");
         var _loc435_:Object = ValueFunc_Impl_.fromT(CombatRange.Melee);
         var _loc436_:CombatAbility = new CombatAbility(new AbilityDef(playerStinger,_loc430_,_loc431_,_loc432_,_loc433_,null,"Sting",_loc434_,ValueFunc_Impl_.fromT(2),null,null,null,null,null,null,3,_loc435_,null,null));
         var _loc437_:Function = function():String
         {
            return "尝试用你的腹部向敌人喷射粘稠的蜘蛛网，并使其速度降低 " + _gthis.get_combat().colorText(DamageColor.Damage,"45") + " [b:(" + _gthis.get_monster().standardDodgeFunc(_gthis.get_player()) + "%)]。[pg-]请注意，你的蜘蛛网需要一段时间才能积聚。[pg-]蜘蛛网数量：" + Math.floor(_gthis.get_player().tail.venom) + "/100";
         };
         var _loc438_:Function = function():Boolean
         {
            return _gthis.get_player().tail.type == 5;
         };
         var _loc439_:Object = function():Boolean
         {
            return _gthis.get_player().tail.venom < _gthis.webbingCost();
         };
         var _loc440_:Object = ValueFunc_Impl_.fromT("你现在没有足够的蜘蛛网来射击！");
         var _loc441_:Object = ValueFunc_Impl_.fromT("Web");
         var _loc442_:Object = ValueFunc_Impl_.fromT(CombatRange.Ranged);
         var _loc443_:CombatAbility = new CombatAbility(new AbilityDef(PCWebAttack,_loc437_,_loc438_,_loc439_,_loc440_,null,"Web",_loc441_,ValueFunc_Impl_.fromT(2),null,null,null,null,null,null,3,_loc442_,null,null));
         var _loc444_:Object = NumberFunc_Impl_.fromInt(30);
         var _loc445_:Function = function():String
         {
            var _loc1_:DamageRange = _gthis.tailSlapCalc();
            return "让你的尾巴燃起炽热的火焰，用它鞭打你的敌人，造成伤害并烧伤他们！" + _loc1_.fancify(_gthis.get_monster().standardDodgeFunc(_gthis.get_player()));
         };
         var _loc446_:Function = function():Boolean
         {
            return _gthis.get_player().tail.type == 25;
         };
         var _loc447_:Object = ValueFunc_Impl_.fromT("Tail Slap");
         var _loc448_:Object = ValueFunc_Impl_.fromT(CombatRange.Melee);
         var _loc449_:CombatAbility = new CombatAbility(new AbilityDef(tailSlapAttack,_loc445_,_loc446_,null,null,_loc444_,"Tail Slap",_loc447_,ValueFunc_Impl_.fromT(2),null,null,null,null,null,null,3,_loc448_,null,null));
         var _loc450_:Object = NumberFunc_Impl_.fromInt(15);
         var _loc451_:Function = ValueFunc_Impl_.fromT("用你的尾巴鞭打你的敌人，激怒他们并降低他们的防御！降低护甲 " + get_combat().colorText(DamageColor.Damage,"75") + "%。");
         var _loc452_:Function = function():Boolean
         {
            if(!(_gthis.get_player().tail.type == 7 || _gthis.get_player().tail.type == 9 || _gthis.get_player().tail.type == 12 || _gthis.get_player().tail.type == 15))
            {
               return _gthis.get_player().tail.type == 17;
            }
            return true;
         };
         var _loc453_:Object = ValueFunc_Impl_.fromT("Tail Whip");
         var _loc454_:Object = ValueFunc_Impl_.fromT(CombatRange.Melee);
         var _loc455_:CombatAbility = new CombatAbility(new AbilityDef(tailWhipAttack,_loc451_,_loc452_,null,null,_loc450_,"Tail Whip",_loc453_,ValueFunc_Impl_.fromT(2),null,null,null,null,null,null,3,_loc454_,null,null));
         var _loc456_:Object = NumberFunc_Impl_.fromInt(20);
         var _loc457_:Function = function():String
         {
            return "用你强大的龙尾猛击你的敌人！这种攻击会造成严重的伤害，并可能使你的对手眩晕或流血。" + _gthis.get_combat().fancifyDamageRange(_gthis.tailslamcalc(true),_gthis.tailslamcalc(false,true),_gthis.get_monster().standardDodgeFunc(_gthis.get_player())) + "[pg-]你击晕对手的次数越多，就越难再次击晕他们。";
         };
         var _loc458_:Function = function():Boolean
         {
            return _gthis.get_player().tail.type == 14;
         };
         var _loc459_:Object = ValueFunc_Impl_.fromT("Tail Slam");
         var _loc460_:Object = ValueFunc_Impl_.fromT(CombatRange.Melee);
         var _loc461_:CombatAbility = new CombatAbility(new AbilityDef(tailSlamAttack,_loc457_,_loc458_,null,null,_loc456_,"Tail Slam",_loc459_,ValueFunc_Impl_.fromT(2),null,null,null,null,null,null,3,_loc460_,null,null));
         var _loc462_:Object = NumberFunc_Impl_.fromFloatFun(function():Number
         {
            return 30 - 2 * _gthis.get_player().masteryLevel(MasteryLib.Shield);
         });
         var _loc463_:Function = function():String
         {
            return "用盾牌猛击你的对手。有几率使其眩晕。" + _gthis.get_combat().fancifyDamageRange(_gthis.bashCalc(true),_gthis.bashCalc(false,true),_gthis.get_monster().standardDodgeFunc(_gthis.get_player())) + "[pg-]你击晕对手的次数越多，就越难再次击晕他们。";
         };
         var _loc464_:Function = function():Boolean
         {
            if(_gthis.get_player().get_shield() != ShieldLib.NOTHING)
            {
               return _gthis.get_player().masteryLevel(MasteryLib.Shield) >= 1;
            }
            return false;
         };
         var _loc465_:Object = ValueFunc_Impl_.fromT("Shield Bash");
         var _loc466_:Object = ValueFunc_Impl_.fromT(CombatRange.Melee);
         var _loc467_:CombatAbility = new CombatAbility(new AbilityDef(shieldBash,_loc463_,_loc464_,null,null,_loc462_,"Shield Bash",_loc465_,ValueFunc_Impl_.fromT(2),null,null,null,null,null,null,3,_loc466_,null,null));
         var _loc468_:Function = ValueFunc_Impl_.fromT("进入一种特殊的姿态，持续几个回合，让你能够反击敌人的攻击。");
         var _loc469_:Function = function():Boolean
         {
            return _gthis.get_player().hasPerk(PerkLib.CounterAB);
         };
         var _loc470_:Object = function():Boolean
         {
            return _gthis.get_player().hasStatusEffect(StatusEffects.CounterAB);
         };
         var _loc471_:Object = ValueFunc_Impl_.fromT("Counter");
         var _loc472_:Object = ValueFunc_Impl_.fromT(CombatRange.Self);
         var _loc473_:CombatAbility = new CombatAbility(new AbilityDef(counterAbility,_loc468_,_loc469_,_loc470_,null,null,"Counter",_loc471_,ValueFunc_Impl_.fromT(2),null,null,true,null,null,null,null,_loc472_,null,null));
         var _loc474_:Object = NumberFunc_Impl_.fromInt(20);
         var _loc475_:Function = function():String
         {
            return "用你自己的生命值作为镰刀邪恶力量的燃料，尝试收割敌人。如果能终结敌人，伤害会成倍增加。" + _gthis.get_combat().fancifyDamageRange(_gthis.reapCalc(true),_gthis.reapCalc(false,true),_gthis.reapChance());
         };
         var _loc476_:Function = function():Boolean
         {
            return _gthis.get_player().get_weapon() == _gthis.get_weapons().DULLSC;
         };
         var _loc477_:Object = ValueFunc_Impl_.fromT("Reap");
         var _loc478_:Object = ValueFunc_Impl_.fromT(CombatRange.ChargingMelee);
         var _loc479_:CombatAbility = new CombatAbility(new AbilityDef(reapDull,_loc475_,_loc476_,null,null,_loc474_,"Reap",_loc477_,ValueFunc_Impl_.fromT(2),null,null,null,null,true,null,null,_loc478_,true,null));
         var _loc480_:Object = NumberFunc_Impl_.fromInt(20);
         var _loc481_:Function = ValueFunc_Impl_.fromT("你不应该看到这个。此能力提供等于你护甲一半的伤害阈值。伤害阈值直接减少伤害，在伤害抗性之后应用。");
         var _loc482_:Function = ValueFunc_Impl_.fromT(get_debug());
         var _loc483_:Object = ValueFunc_Impl_.fromT("Ironflesh");
         var _loc484_:Object = ValueFunc_Impl_.fromT(CombatRange.Self);
         var _loc485_:CombatAbility = new CombatAbility(new AbilityDef(ironflesh,_loc481_,_loc482_,null,null,_loc480_,"Ironflesh",_loc483_,ValueFunc_Impl_.fromT(2),null,null,null,null,null,null,null,_loc484_,null,null));
         var _loc486_:Object = NumberFunc_Impl_.fromInt(20);
         var _loc487_:Function = ValueFunc_Impl_.fromT("你不应该看到这个。测试飞行。");
         var _loc488_:Function = ValueFunc_Impl_.fromT(get_debug());
         var _loc489_:Object = ValueFunc_Impl_.fromT("testfly");
         var _loc490_:Object = ValueFunc_Impl_.fromT(CombatRange.Self);
         var _loc491_:CombatAbility = new CombatAbility(new AbilityDef(function():void
         {
            _gthis.get_player().fly();
            _gthis.get_combat().startMonsterTurn();
         },_loc487_,_loc488_,null,null,_loc486_,"testfly",_loc489_,ValueFunc_Impl_.fromT(2),null,null,null,null,null,null,null,_loc490_,null,null));
         var _loc492_:Object = NumberFunc_Impl_.fromFloatFun(function():Number
         {
            return 45 - 5 * _gthis.get_player().get_weapon().masteryLevel();
         });
         var _loc493_:Object = function():Boolean
         {
            return _gthis.get_monster().distance != CombatDistance.Distant;
         };
         var _loc494_:Function = function():String
         {
            return "拉近距离，用你的长矛以强力突刺刺穿你的敌人，完全无视护甲并造成额外伤害。" + _gthis.get_combat().fancifyDamageRange(_gthis.grandThrustDamage(true),_gthis.grandThrustDamage(true,false),_gthis.grandThrustChance());
         };
         var _loc495_:Object = ValueFunc_Impl_.fromT("你不能在近战范围内使用这个技能！");
         var _loc496_:Function = function():Boolean
         {
            if(_gthis.get_player().get_weapon().isSpear())
            {
               return _gthis.get_player().get_weapon().masteryLevel() >= 2;
            }
            return false;
         };
         var _loc497_:Object = ValueFunc_Impl_.fromT("Grand Thrust");
         var _loc498_:Object = ValueFunc_Impl_.fromT(CombatRange.ChargingMelee);
         var _loc499_:CombatAbility = new CombatAbility(new AbilityDef(grandThrust,_loc494_,_loc496_,_loc493_,_loc495_,_loc492_,"Grand Thrust",_loc497_,ValueFunc_Impl_.fromT(2),null,null,null,null,null,null,3,_loc498_,true,null));
         var _loc500_:Object = NumberFunc_Impl_.fromFloatFun(function():Number
         {
            return 35 - 5 * _gthis.get_player().get_weapon().masteryLevel();
         });
         var _loc501_:Function = function():String
         {
            return "跳过你的回合，潜入阴影中，获得额外的闪避几率。如果你在这个回合闪避了攻击，在回合结束时用强力的背刺反击！" + _gthis.get_combat().fancifyDamageRange(_gthis.backstabDamage(true),_gthis.backstabDamage(false,true),_gthis.get_monster().standardDodgeFunc(_gthis.get_player()));
         };
         var _loc502_:Function = function():Boolean
         {
            if(_gthis.get_player().get_weapon().isKnife())
            {
               return _gthis.get_player().get_weapon().masteryLevel() >= 2;
            }
            return false;
         };
         var _loc503_:Object = ValueFunc_Impl_.fromT("Backstab");
         var _loc504_:Object = ValueFunc_Impl_.fromT(CombatRange.Melee);
         var _loc505_:CombatAbility = new CombatAbility(new AbilityDef(backstabStart,_loc501_,_loc502_,null,null,_loc500_,"Backstab",_loc503_,ValueFunc_Impl_.fromT(2),null,null,null,null,null,null,3,_loc504_,true,null));
         var _loc506_:Object = NumberFunc_Impl_.fromFloatFun(function():Number
         {
            return 50 - 5 * _gthis.get_player().get_weapon().masteryLevel();
         });
         var _loc507_:Function = function():Boolean
         {
            if(_gthis.get_player().get_weapon().isLarge())
            {
               return _gthis.get_player().get_weapon().masteryLevel() >= 2;
            }
            return false;
         };
         var _loc508_:Object = ValueFunc_Impl_.fromT("RetributionArc");
         var _loc509_:Object = ValueFunc_Impl_.fromT(CombatRange.Melee);
         var _loc510_:CombatAbility = new CombatAbility(new AbilityDef(retributionStart,function():String
         {
            return "调整姿势，在回合结束时释放一次巨大的打击。伤害会根据你在这个回合受到的伤害而增加！";
         },_loc507_,null,null,_loc506_,"Arc of Retribution",_loc508_,ValueFunc_Impl_.fromT(2),null,null,null,null,null,null,3,_loc509_,true,null));
         var _loc511_:Object = NumberFunc_Impl_.fromFloatFun(function():Number
         {
            return (_gthis.get_player().get_weapon().isUnarmed() ? 25 : 30) - 3 * _gthis.get_player().get_weapon().masteryLevel();
         });
         var _loc512_:Function = function():String
         {
            var _loc1_:Boolean = _gthis.canClawFist(3,FistStances.Claw);
            var _loc2_:int = int(Math.floor(Math.max(_gthis.flurryAmount,_loc1_ ? 2 : 1)));
            var _loc3_:String = "释放 " + _loc2_ + " 次攻击，造成一半伤害。下一次无尽连打的攻击次数增加 1，持续整个战斗，最多 5 次。";
            if(_loc1_)
            {
               _loc3_ += "[pg-][b:利爪架势]：无尽连击将始终至少命中2次。连击增长速率不变。";
            }
            return _loc3_;
         };
         var _loc513_:Function = function():Boolean
         {
            if(_gthis.get_player().get_weapon().isOneHandedMelee())
            {
               return _gthis.get_player().get_weapon().masteryLevel() >= 2;
            }
            return false;
         };
         var _loc514_:Object = ValueFunc_Impl_.fromT("Endless Flurry");
         var _loc515_:Object = ValueFunc_Impl_.fromT(CombatRange.Melee);
         var _loc516_:CombatAbility = new CombatAbility(new AbilityDef(endlessFlurry,_loc512_,_loc513_,null,null,_loc511_,"Endless Flurry",_loc514_,ValueFunc_Impl_.fromT(2),null,null,null,null,null,null,null,_loc515_,true,null));
         var _loc517_:Object = NumberFunc_Impl_.fromInt(10);
         var _loc518_:Function = ValueFunc_Impl_.fromT("尝试用你鞭子般的藤蔓束缚敌人。");
         var _loc519_:Function = function():Boolean
         {
            if(_gthis.get_armors().VINARMR.saveContent.armorStage > 4)
            {
               return !_gthis.get_monster().hasStatusEffect(StatusEffects.Constricted);
            }
            return false;
         };
         var _loc520_:Object = ValueFunc_Impl_.fromT("Vine Grab");
         var _loc521_:Object = ValueFunc_Impl_.fromT(CombatRange.Ranged);
         var _loc522_:CombatAbility = new CombatAbility(new AbilityDef(vineGrab,_loc518_,_loc519_,null,null,_loc517_,"Vine Grab",_loc520_,ValueFunc_Impl_.fromT(2),null,null,null,null,null,null,null,_loc521_,null,null));
         var _loc523_:Object = NumberFunc_Impl_.fromInt(20);
         var _loc524_:Function = ValueFunc_Impl_.fromT("使用这面奇怪的盾牌将你的敌人冻结在原地一小段时间。");
         var _loc525_:Function = function():Boolean
         {
            return _gthis.get_player().get_shield().get_id() == _gthis.get_shields().CLKSHLD.get_id();
         };
         var _loc526_:Object = function():Boolean
         {
            if(_gthis.get_shields().CLKSHLD.saveContent.used)
            {
               return _gthis.get_shields().CLKSHLD.saveContent.used;
            }
            return _gthis.get_combat().combatRound < 3;
         };
         var _loc527_:Object = ValueFunc_Impl_.fromT("盾牌需要时间来" + (get_combat().combatRound < 3 ? "" : "重新") + "充能。");
         var _loc528_:Object = ValueFunc_Impl_.fromT("Freeze Time");
         var _loc529_:Object = ValueFunc_Impl_.fromT(CombatRange.Omni);
         var _loc530_:CombatAbility = new CombatAbility(new AbilityDef(freezeTime,_loc524_,_loc525_,_loc526_,_loc527_,_loc523_,"Freeze Time",_loc528_,ValueFunc_Impl_.fromT(3),null,null,null,null,null,null,null,_loc529_,null,null));
         var _loc531_:Object = NumberFunc_Impl_.fromFloatFun(function():Number
         {
            return 45 - 5 * _gthis.get_player().get_weapon().masteryLevel();
         });
         var _loc532_:Function = function():String
         {
            var _loc1_:DamageRange = _gthis.aimedShotCalc();
            return "尝试击中敌人的弱点。在近距离更难。" + _loc1_.fancify(_gthis.aimedShotChance());
         };
         var _loc533_:Function = function():Boolean
         {
            if(_gthis.get_player().get_weapon().isFirearm())
            {
               return _gthis.get_player().get_weapon().masteryLevel() >= 2;
            }
            return false;
         };
         var _loc534_:Object = ValueFunc_Impl_.fromT("Aimed Shot");
         var _loc535_:Object = ValueFunc_Impl_.fromT(CombatRange.Ranged);
         var _loc536_:CombatAbility = new CombatAbility(new AbilityDef(aimedShot,_loc532_,_loc533_,null,null,_loc531_,"Aimed Shot",_loc534_,ValueFunc_Impl_.fromT(2),null,null,null,null,null,null,null,_loc535_,true,null));
         var _loc537_:Object = NumberFunc_Impl_.fromInt(15);
         var _loc538_:Function = function():String
         {
            var _loc1_:DamageRange = _gthis.skirmishDamage();
            return "尝试拉开距离，同时发射一次较弱的射击，无法造成暴击。" + _loc1_.fancify(_gthis.skirmishChance());
         };
         var _loc539_:Function = function():Boolean
         {
            return _gthis.get_player().get_weapon().isRanged();
         };
         var _loc540_:Object = ValueFunc_Impl_.fromT("Skirmish");
         var _loc541_:Object = ValueFunc_Impl_.fromT(CombatRange.Ranged);
         var _loc542_:CombatAbility = new CombatAbility(new AbilityDef(skirmish,_loc538_,_loc539_,null,null,_loc537_,"Skirmish",_loc540_,ValueFunc_Impl_.fromT(2),null,null,null,null,null,null,null,_loc541_,true,null));
         var _loc543_:Object = NumberFunc_Impl_.fromFloatFun(function():Number
         {
            return 40 - 3 * _gthis.get_player().get_weapon().masteryLevel();
         });
         var _loc544_:Function = function():String
         {
            var _loc1_:DamageRange = _gthis.rendCalc();
            return "用你的斧头撕裂敌人的防御。" + _loc1_.fancify(_gthis.get_monster().standardDodgeFunc(_gthis.get_player()));
         };
         var _loc545_:Function = function():Boolean
         {
            if(_gthis.get_player().get_weapon().isAxe())
            {
               return _gthis.get_player().get_weapon().masteryLevel() >= 2;
            }
            return false;
         };
         var _loc546_:Object = ValueFunc_Impl_.fromT("Rend");
         var _loc547_:Object = ValueFunc_Impl_.fromT(CombatRange.Melee);
         var _loc548_:CombatAbility = new CombatAbility(new AbilityDef(rend,_loc544_,_loc545_,null,null,_loc543_,"Rend",_loc546_,ValueFunc_Impl_.fromT(2),null,null,null,null,null,null,null,_loc547_,true,null));
         var _loc549_:Function = ValueFunc_Impl_.fromT("查看你可以使用的徒手架势列表。[pg]所有架势持续到战斗结束，或者直到改变架势。");
         var _loc550_:Function = function():Boolean
         {
            return _gthis.get_player().hasPerk(PerkLib.FistsOfFury);
         };
         var _loc551_:Object = function():Boolean
         {
            if(_gthis.get_player().get_weapon().isUnarmed())
            {
               return _gthis.get_player().get_shield() != ShieldLib.NOTHING;
            }
            return true;
         };
         var _loc552_:Object = ValueFunc_Impl_.fromT("需要徒手且没有盾牌。");
         var _loc553_:Object = ValueFunc_Impl_.fromT("Fists of Fury");
         var _loc554_:Object = ValueFunc_Impl_.fromT(CombatRange.Self);
         physicalAbilities = [_loc337_,_loc343_,_loc349_,_loc355_,_loc361_,_loc367_,_loc373_,_loc379_,_loc385_,_loc391_,_loc397_,_loc403_,_loc410_,_loc417_,_loc424_,_loc429_,_loc436_,_loc443_,_loc449_,_loc455_,_loc461_,_loc467_,_loc473_,_loc479_,_loc485_,_loc491_,_loc499_,_loc505_,_loc510_,_loc516_,_loc522_,_loc530_,_loc536_,_loc542_,_loc548_,new CombatAbility(new AbilityDef(fistFuriously,_loc549_,_loc550_,_loc551_,_loc552_,null,"Fists of Fury",_loc553_,ValueFunc_Impl_.fromT(7),null,true,true,null,null,false,null,_loc554_,null,null))];
         var _loc555_:Object = NumberFunc_Impl_.fromInt(5);
         var _loc556_:Function = function():String
         {
            var _loc1_:String = "集中精神，进入防御架势。[pg]";
            if(_gthis.canFist(1))
            {
               _loc1_ += "[pg-][b:被动]：提升闪避、格挡几率和命中率";
            }
            if(_gthis.canFist(3))
            {
               _loc1_ += "[pg-][b:协同]：强化净化掌";
            }
            if(_gthis.canFist(4))
            {
               _loc1_ += "[pg-][b:激活]：本回合获得100%格挡几率";
            }
            if(_gthis.canFist(5))
            {
               _loc1_ += "[pg-][b:升级]：接近与拉开距离升级为快步与脱战";
            }
            if(!_gthis.canFist(5))
            {
               _loc1_ += "[pg-]更高的精通等级将解锁更多加成。";
            }
            return _loc1_;
         };
         var _loc557_:Function = ValueFunc_Impl_.fromT(true);
         var _loc558_:Object = function():Boolean
         {
            if(!(_gthis.get_player().hasStatusEffect(StatusEffects.MonkStance) || !_gthis.get_player().get_weapon().isBareFist()))
            {
               return _gthis.get_player().get_shield() != ShieldLib.NOTHING;
            }
            return true;
         };
         var _loc559_:Object = function():String
         {
            if(_gthis.get_player().hasStatusEffect(StatusEffects.MonkStance))
            {
               return "你已经处于僧侣架势了。";
            }
            return "需要空手且不装备盾牌。";
         };
         var _loc560_:Object = ValueFunc_Impl_.fromT("Monk Stance");
         var _loc561_:Object = ValueFunc_Impl_.fromT(CombatRange.Self);
         var _loc562_:CombatAbility = new CombatAbility(new AbilityDef(monkStance,_loc556_,_loc557_,_loc558_,_loc559_,_loc555_,"Monk Stance",_loc560_,ValueFunc_Impl_.fromT(2),null,null,true,null,null,null,null,_loc561_,null,null));
         var _loc563_:Object = NumberFunc_Impl_.fromInt(5);
         var _loc564_:Function = function():String
         {
            var _loc1_:String = "握紧双拳，准备痛击你的对手。[pg]";
            if(_gthis.canFist(1))
            {
               _loc1_ += "[pg-][b:被动]：提升伤害与护甲穿透";
            }
            if(_gthis.canFist(3))
            {
               _loc1_ += "[pg-][b:协同]：可在同一回合激活格斗架势与狂暴或欲火狂暴";
            }
            if(_gthis.canFist(4))
            {
               _loc1_ += "[pg-][b:激活]：进入架势时发动攻击";
            }
            if(_gthis.canFist(5))
            {
               _loc1_ += "[pg-][b:升级]：攻击升级为猛击连打";
            }
            if(!_gthis.canFist(5))
            {
               _loc1_ += "[pg-]更高的精通等级将解锁更多加成。";
            }
            return _loc1_;
         };
         var _loc565_:Function = ValueFunc_Impl_.fromT(true);
         var _loc566_:Object = function():Boolean
         {
            if(!(_gthis.get_player().hasStatusEffect(StatusEffects.BrawlerStance) || !_gthis.get_player().get_weapon().isBareFist()))
            {
               return _gthis.get_player().get_shield() != ShieldLib.NOTHING;
            }
            return true;
         };
         var _loc567_:Object = function():String
         {
            if(_gthis.get_player().hasStatusEffect(StatusEffects.BrawlerStance))
            {
               return "你已经处于斗士架势了。";
            }
            return "需要空手且不装备盾牌。";
         };
         var _loc568_:Object = ValueFunc_Impl_.fromT("Brawler Stance");
         var _loc569_:Object = ValueFunc_Impl_.fromT(CombatRange.Self);
         var _loc570_:CombatAbility = new CombatAbility(new AbilityDef(brawlerStance,_loc564_,_loc565_,_loc566_,_loc567_,_loc563_,"Brawler Stance",_loc568_,ValueFunc_Impl_.fromT(2),null,null,true,null,null,null,null,_loc569_,null,null));
         var _loc571_:Object = NumberFunc_Impl_.fromInt(5);
         var _loc572_:Function = ValueFunc_Impl_.fromT("抛弃所有求生的念头，全身心投入到将敌人砸成肉酱的行动中。[pg]同时激活狂暴和斗士架势。");
         var _loc573_:Function = function():Boolean
         {
            if(_gthis.get_player().hasPerk(PerkLib.Berserker))
            {
               return _gthis.canFist(3);
            }
            return false;
         };
         var _loc574_:Object = function():Boolean
         {
            if(!(_gthis.get_player().hasStatusEffect(StatusEffects.Berserking) || _gthis.get_player().hasStatusEffect(StatusEffects.BrawlerStance) || !_gthis.get_player().get_weapon().isBareFist()))
            {
               return _gthis.get_player().get_shield() != ShieldLib.NOTHING;
            }
            return true;
         };
         var _loc575_:Object = function():String
         {
            if(_gthis.get_player().hasStatusEffect(StatusEffects.Berserking))
            {
               return "你已经够疯狂了！";
            }
            if(_gthis.get_player().hasStatusEffect(StatusEffects.BrawlerStance))
            {
               return "你已经处于斗士架势了。";
            }
            return "需要空手且不装备盾牌。";
         };
         var _loc576_:Object = ValueFunc_Impl_.fromT("Berserk Brawl");
         var _loc577_:Object = ValueFunc_Impl_.fromT(CombatRange.Self);
         var _loc578_:CombatAbility = new CombatAbility(new AbilityDef(brawlerBerserk,_loc572_,_loc573_,_loc574_,_loc575_,_loc571_,"Berserk Brawl",_loc576_,ValueFunc_Impl_.fromT(2),null,null,true,null,null,null,null,_loc577_,null,null));
         var _loc579_:Object = NumberFunc_Impl_.fromInt(5);
         var _loc580_:Function = ValueFunc_Impl_.fromT("抛弃所有求生的念头，将你的全部身心投入到把敌人砸成肉泥中去。[pg]同时激活情欲狂暴和斗士架势。");
         var _loc581_:Function = function():Boolean
         {
            if(_gthis.get_player().hasPerk(PerkLib.Lustserker))
            {
               return _gthis.canFist(3);
            }
            return false;
         };
         var _loc582_:Object = function():Boolean
         {
            if(!(_gthis.get_player().hasStatusEffect(StatusEffects.Lustserking) || _gthis.get_player().hasStatusEffect(StatusEffects.BrawlerStance) || !_gthis.get_player().get_weapon().isBareFist()))
            {
               return _gthis.get_player().get_shield() != ShieldLib.NOTHING;
            }
            return true;
         };
         var _loc583_:Object = function():String
         {
            if(_gthis.get_player().hasStatusEffect(StatusEffects.Lustserking))
            {
               return "你已经够疯狂了！";
            }
            if(_gthis.get_player().hasStatusEffect(StatusEffects.BrawlerStance))
            {
               return "你已经处于斗士架势了。";
            }
            return "需要空手且不装备盾牌。";
         };
         var _loc584_:Object = ValueFunc_Impl_.fromT("Lustserk Brawl");
         var _loc585_:Object = ValueFunc_Impl_.fromT(CombatRange.Self);
         var _loc586_:CombatAbility = new CombatAbility(new AbilityDef(brawlerLustserk,_loc580_,_loc581_,_loc582_,_loc583_,_loc579_,"Lustserk Brawl",_loc584_,ValueFunc_Impl_.fromT(2),null,null,true,null,null,null,null,_loc585_,null,null));
         var _loc587_:Object = NumberFunc_Impl_.fromInt(5);
         var _loc588_:Function = function():String
         {
            var _loc1_:String = "准备好撕咬、撕碎你的猎物。[pg]";
            if(_gthis.canClawFist(1))
            {
               _loc1_ += "[pg-][b:被动]：提升流血几率，基础几率越高则加成越小";
            }
            if(_gthis.canClawFist(3))
            {
               _loc1_ += "[pg-][b:协同]：强化无尽连击";
            }
            if(_gthis.canClawFist(4))
            {
               _loc1_ += "[pg-][b:激活]：进入架势后的下一回合强化普通攻击";
            }
            if(_gthis.canClawFist(5))
            {
               _loc1_ += "[pg-][b:升级]：等待升级为潜伏";
            }
            if(!_gthis.canClawFist(5))
            {
               _loc1_ += "[pg-]更高的精通等级将解锁更多加成。";
            }
            return _loc1_;
         };
         var _loc589_:Function = function():Boolean
         {
            if(_gthis.get_player().hasPerk(PerkLib.NaturalWeapons))
            {
               return _gthis.canClawFist();
            }
            return false;
         };
         var _loc590_:Object = function():Boolean
         {
            if(!(_gthis.get_player().hasStatusEffect(StatusEffects.ClawStance) || !_gthis.get_player().get_weapon().isClaw() || !_gthis.get_player().get_weapon().isUnarmed()))
            {
               return _gthis.get_player().get_shield() != ShieldLib.NOTHING;
            }
            return true;
         };
         var _loc591_:Object = function():String
         {
            if(_gthis.get_player().hasStatusEffect(StatusEffects.ClawStance))
            {
               return "你已经处于利爪架势了。";
            }
            return "需要空手且不装备盾牌。";
         };
         var _loc592_:Object = ValueFunc_Impl_.fromT("Claw Stance");
         var _loc593_:Object = ValueFunc_Impl_.fromT(CombatRange.Self);
         unarmedStances = [_loc562_,_loc570_,_loc578_,_loc586_,new CombatAbility(new AbilityDef(clawStance,_loc588_,_loc589_,_loc590_,_loc591_,_loc587_,"Claw Stance",_loc592_,ValueFunc_Impl_.fromT(2),null,null,true,null,null,null,null,_loc593_,null,null))];
         setMiscAbilities();
         allAbilities = magicSpells.concat(physicalAbilities).concat(magicAbilities).concat(miscAbilities);
      }
      
      public function setMiscAbilities() : void
      {
         var _gthis:CombatAbilities = this;
         var _loc1_:Function = get_combat().normalAttack;
         var _loc2_:Object = NumberFunc_Impl_.fromInt(0);
         var _loc3_:CombatAbility = attackAb = new CombatAbility(new AbilityDef(_loc1_,function():String
         {
            var _loc1_:String = "尝试用你的[weapon]攻击敌人。造成的伤害由你的力量和武器决定。" + _gthis.get_combat().displayAttackRange();
            if(_gthis.get_player().get_weapon().isChanneling())
            {
               _loc1_ = "尝试用你的[weapon]发射魔法弹攻击敌人。造成的伤害由你的智力、速度和武器决定。" + _gthis.get_combat().displayAttackRange();
            }
            else if(_gthis.get_player().get_weapon().needsReload())
            {
               _loc1_ = "你的[weapon]没有弹药了。你必须在攻击前重新装填。";
            }
            else if(_gthis.get_player().get_weapon().isRanged())
            {
               _loc1_ = "用你的[weapon]向对手开火。造成的伤害由你的力量、速度和武器决定。" + _gthis.get_combat().displayAttackRange();
            }
            else if(_gthis.canFist(5,FistStances.Brawler))
            {
               _loc1_ = "冲向敌人并用拳头猛击他们。冲向远处的敌人时，伤害和护甲穿透会降低。" + _gthis.get_combat().displayAttackRange();
            }
            if(_gthis.get_player().get_weapon().get_ammoMax() > 0)
            {
               _loc1_ += "[pg-]弹药：" + _gthis.get_player().get_weapon().get_currentAmmo() + "/" + _gthis.get_player().get_weapon().get_ammoMax();
            }
            return _loc1_;
         },ValueFunc_Impl_.fromT(true),null,null,_loc2_,"Attack",function():String
         {
            if(_gthis.get_player().get_weapon().isChanneling())
            {
               return "魔法弹";
            }
            if(_gthis.get_player().get_weapon().needsReload())
            {
               return "装填";
            }
            if(_gthis.get_player().get_weapon().isRanged())
            {
               return "射击";
            }
            if(_gthis.canFist(5,FistStances.Brawler))
            {
               return "猛击";
            }
            return "攻击";
         },function():int
         {
            if(_gthis.get_player().get_weapon().isChanneling())
            {
               return 3;
            }
            return 2;
         },null,true,null,null,null,null,null,function():CombatRange
         {
            if(_gthis.get_combat().isWieldingRangedWeapon())
            {
               return CombatRange.Ranged;
            }
            if(_gthis.canFist(5,FistStances.Brawler))
            {
               return CombatRange.ChargingMelee;
            }
            return CombatRange.Melee;
         },null,null));
         var _loc5_:Function = get_combat().wait;
         var _loc6_:Object = NumberFunc_Impl_.fromInt(0);
         var _loc7_:Function = function():String
         {
            if(_gthis.canClawFist(5,FistStances.Claw))
            {
               return "本回合不采取任何行动，并在下回合的普通攻击中获得命中率和暴击率加成。";
            }
            return "本回合不采取任何行动。你为什么要这么做？这真是个糟糕的主意。";
         };
         var _loc8_:Function = ValueFunc_Impl_.fromT(true);
         var _loc9_:Object = function():String
         {
            if(_gthis.canClawFist(5,FistStances.Claw))
            {
               return "潜伏";
            }
            return "等待";
         };
         var _loc10_:Object = ValueFunc_Impl_.fromT(CombatRange.Self);
         var _loc4_:CombatAbility = waitAb = new CombatAbility(new AbilityDef(_loc5_,_loc7_,_loc8_,null,null,_loc6_,"Wait",_loc9_,ValueFunc_Impl_.fromT(7),null,true,null,null,null,null,null,_loc10_,null,null));
         var _loc12_:Function = get_combat().fantasy;
         var _loc13_:Object = NumberFunc_Impl_.fromInt(0);
         var _loc14_:Function = ValueFunc_Impl_.fromT("以性幻想的方式想象你的对手。除非你想被强奸，否则这可能是一个非常糟糕的主意。");
         var _loc15_:Function = ValueFunc_Impl_.fromT(true);
         var _loc16_:Object = ValueFunc_Impl_.fromT("Fantasize");
         var _loc17_:Object = ValueFunc_Impl_.fromT(CombatRange.Self);
         var _loc11_:CombatAbility = fantasize = new CombatAbility(new AbilityDef(_loc12_,_loc14_,_loc15_,null,null,_loc13_,"Fantasize",_loc16_,ValueFunc_Impl_.fromT(7),null,true,true,null,null,null,null,_loc17_,null,null));
         var _loc19_:Function = get_combat().runAway;
         var _loc20_:Object = NumberFunc_Impl_.fromInt(0);
         var _loc21_:Function = ValueFunc_Impl_.fromT("选择逃跑可以让你尝试摆脱敌人。然而，很难逃脱比你快的敌人，如果你失败了，你的敌人将获得一次免费攻击的机会。");
         var _loc22_:Function = ValueFunc_Impl_.fromT(true);
         var _loc23_:Object = function():Boolean
         {
            if(_gthis.get_player().canMove())
            {
               return _gthis.get_player().isCornered;
            }
            return true;
         };
         var _loc24_:Object = ValueFunc_Impl_.fromT("你无法移动。");
         var _loc25_:Object = ValueFunc_Impl_.fromT("Run Away");
         var _loc26_:Object = ValueFunc_Impl_.fromT(CombatRange.Self);
         var _loc18_:CombatAbility = run = new CombatAbility(new AbilityDef(_loc19_,_loc21_,_loc22_,_loc23_,_loc24_,_loc20_,"Run Away",_loc25_,ValueFunc_Impl_.fromT(9),null,true,true,null,null,null,null,_loc26_,null,null));
         var _loc28_:Function = ValueFunc_Impl_.fromT(true);
         var _loc29_:Object = function():Boolean
         {
            if(!(_gthis.get_monster().distance == CombatDistance.Distant || _gthis.get_monster().hasStatusEffect(StatusEffects.Level) || !_gthis.get_player().canMove()))
            {
               return _gthis.get_player().isImmobilized;
            }
            return true;
         };
         var _loc30_:Function = function():String
         {
            var _loc1_:Boolean = !_gthis.get_monster().shouldMove(CombatDistance.Distant,true) || !_gthis.get_monster().canMove();
            var _loc2_:String = "尝试与敌人拉开距离。成功率基于速度。";
            if(_gthis.canFist(5,FistStances.Monk))
            {
               _loc2_ = "做出佯攻以分散敌人注意力，同时尝试拉开距离。";
            }
            return _loc2_ + (" ([b:" + (_loc1_ ? 100 : _gthis.get_player().movementChance(_gthis.get_monster())) + "%])");
         };
         var _loc31_:Object = function():String
         {
            if(_gthis.get_player().canMove())
            {
               return "你无法再拉开距离了！";
            }
            return "你无法移动！";
         };
         var _loc32_:Object = NumberFunc_Impl_.fromInt(10);
         var _loc33_:Object = function():String
         {
            if(_gthis.canFist(5,FistStances.Monk))
            {
               return "脱战";
            }
            return "拉开距离";
         };
         var _loc34_:Object = ValueFunc_Impl_.fromT(CombatRange.Self);
         var _loc27_:CombatAbility = distanceSelfAb = new CombatAbility(new AbilityDef(distanceSelf,_loc30_,_loc28_,_loc29_,_loc31_,_loc32_,"Distance",_loc33_,ValueFunc_Impl_.fromT(9),null,null,true,null,null,null,null,_loc34_,null,null));
         var _loc36_:Function = ValueFunc_Impl_.fromT(true);
         var _loc37_:Function = function():String
         {
            var _loc1_:Boolean = !_gthis.get_monster().shouldMove(CombatDistance.Distant,true) || !_gthis.get_monster().canMove();
            var _loc2_:String = "尝试逼近敌人。成功率基于速度。";
            if(_gthis.canFist(5,FistStances.Monk))
            {
               _loc2_ = "冲向敌人，用复杂的步法将其绊倒。";
            }
            return _loc2_ + (" ([b:" + (_loc1_ ? 100 : _gthis.get_player().movementChance(_gthis.get_monster())) + "%])");
         };
         var _loc38_:Object = function():Boolean
         {
            if(!(_gthis.get_monster().distance == CombatDistance.Melee || _gthis.get_monster().hasStatusEffect(StatusEffects.Level) || !_gthis.get_player().canMove()))
            {
               return _gthis.get_player().isImmobilized;
            }
            return true;
         };
         var _loc39_:Object = function():String
         {
            if(_gthis.get_player().canMove())
            {
               return "你无法靠近这个敌人！";
            }
            return "你无法移动！";
         };
         var _loc40_:Object = NumberFunc_Impl_.fromInt(10);
         var _loc41_:Object = function():String
         {
            if(_gthis.canFist(5,FistStances.Monk))
            {
               return "快步";
            }
            return "靠近";
         };
         var _loc42_:Object = ValueFunc_Impl_.fromT(CombatRange.Self);
         var _loc35_:CombatAbility = approachSelf = new CombatAbility(new AbilityDef(approach,_loc37_,_loc36_,_loc38_,_loc39_,_loc40_,"Approach",_loc41_,ValueFunc_Impl_.fromT(9),null,null,true,null,null,null,null,_loc42_,null,null));
         var _loc44_:Function = get_combat().combatTeases.teaseAttack;
         var _loc45_:Object = NumberFunc_Impl_.fromInt(0);
         var _loc46_:Function = ValueFunc_Impl_.fromT("摆出诱人的姿势并暴露身体部位，试图让敌人更加兴奋。");
         var _loc47_:Function = ValueFunc_Impl_.fromT(true);
         var _loc48_:Object = ValueFunc_Impl_.fromT("Tease");
         var _loc49_:Object = ValueFunc_Impl_.fromT(CombatRange.Tease);
         var _loc43_:CombatAbility = teaseAb = new CombatAbility(new AbilityDef(_loc44_,_loc46_,_loc47_,null,null,_loc45_,"Tease",_loc48_,ValueFunc_Impl_.fromT(8),null,true,null,null,null,null,null,_loc49_,null,null));
         var _loc51_:Function = function():Boolean
         {
            if(_gthis.get_player().hasStatusEffect(StatusEffects.Stunned) && _gthis.get_player().statusEffectv2(StatusEffects.Stunned) == 1 && _gthis.get_player().hasPerk(PerkLib.Resolute))
            {
               return _gthis.get_player().get_tou() > 75;
            }
            return false;
         };
         var _loc52_:Function = ValueFunc_Impl_.fromT("强行突破并立即恢复理智，代价是消耗一些疲劳。");
         var _loc53_:Object = NumberFunc_Impl_.fromInt(15);
         var _loc54_:Object = ValueFunc_Impl_.fromT("Power Through");
         var _loc55_:Object = ValueFunc_Impl_.fromT(CombatRange.Self);
         var _loc50_:CombatAbility = powerThroughAb = new CombatAbility(new AbilityDef(powerThrough,_loc52_,_loc51_,null,null,_loc53_,"Power Through",_loc54_,ValueFunc_Impl_.fromT(2),null,null,true,null,null,null,null,_loc55_,null,null));
         var _loc57_:Object = NumberFunc_Impl_.fromFloatFun(function():Number
         {
            return 15 - _gthis.get_player().get_weapon().masteryLevel();
         });
         var _loc58_:Function = function():String
         {
            return "用你的鞭子绊倒你的目标！如果成功，将阻止其移动并在一个回合内大幅降低其速度。" + _gthis.get_combat().fancifyDamageRange(0,0,_gthis.whipTripChance());
         };
         var _loc59_:Function = function():Boolean
         {
            if(_gthis.get_player().get_weapon().isWhip())
            {
               return _gthis.get_player().masteryLevel(MasteryLib.Whip) >= 2;
            }
            return false;
         };
         var _loc60_:Object = ValueFunc_Impl_.fromT("Whip Trip");
         var _loc61_:Object = ValueFunc_Impl_.fromT(CombatRange.Melee);
         var _loc56_:CombatAbility = whipTripFunc = new CombatAbility(new AbilityDef(whipTrip,_loc58_,_loc59_,null,null,_loc57_,"Whip Trip",_loc60_,ValueFunc_Impl_.fromT(2),null,null,null,null,null,null,null,_loc61_,null,null));
         var _loc63_:Object = NumberFunc_Impl_.fromFloatFun(function():Number
         {
            return 10;
         });
         var _loc64_:Function = function():String
         {
            return "用你的藤蔓绊倒你的目标！如果成功，将阻止其移动并在一个回合内大幅降低其速度。" + _gthis.get_combat().fancifyDamageRange(0,0,_gthis.whipTripChance());
         };
         var _loc65_:Function = function():Boolean
         {
            return _gthis.get_game().armors.VINARMR.saveContent.armorStage > 3;
         };
         var _loc66_:Object = ValueFunc_Impl_.fromT("Vine Trip");
         var _loc67_:Object = ValueFunc_Impl_.fromT(CombatRange.Melee);
         var _loc62_:CombatAbility = vineTripFunc = new CombatAbility(new AbilityDef(vineTrip,_loc64_,_loc65_,null,null,_loc63_,"Vine Trip",_loc66_,ValueFunc_Impl_.fromT(2),null,null,null,null,null,null,null,_loc67_,null,null));
         var _loc69_:Object = NumberFunc_Impl_.fromInt(0);
         var _loc70_:Function = ValueFunc_Impl_.fromT("");
         var _loc71_:Function = function():Boolean
         {
            return _gthis.get_player().lowerBody.type == 3;
         };
         var _loc72_:Object = ValueFunc_Impl_.fromT("Tease");
         var _loc73_:Object = ValueFunc_Impl_.fromT(CombatRange.Tease);
         miscAbilities = [_loc3_,_loc4_,_loc11_,_loc18_,_loc27_,_loc35_,_loc43_,_loc50_,_loc56_,_loc62_,new CombatAbility(new AbilityDef(naggaTease,_loc70_,_loc71_,null,null,_loc69_,"Naga Tease",_loc72_,ValueFunc_Impl_.fromT(8),null,true,null,null,null,null,null,_loc73_,null,null))];
      }
      
      public function saveToObject() : Object
      {
         return saveContent;
      }
      
      public function retributionStart() : void
      {
         abilityTarget = get_monster();
         outputText("你双手握住[weapon]并将其举过肩膀，打算蓄力进行一次极其强大的攻击。\n你当前的姿势和意图使得躲避或格挡变得不可能，但你愿意咬牙忍受痛苦！");
         get_player().addStatusEffect(new RetributionBuff());
         get_combat().startMonsterTurn();
      }
      
      public function retributionExec() : void
      {
         var _loc1_:Monster = get_monster();
         set_monster(abilityTarget);
         outputText("[pg]你完成了蓄力并开始攻击，你所承受的打击带来的痛苦为你提供了力量！\n你扭动身体，为你的攻击增加额外的力量，向斜下方挥舞，打算将" + abilityTarget.get_a() + abilityTarget.get_short() + "劈成两半！[pg]你的[weapon]以可怕的力量击中了你的敌人，凭借你这一击的重量将" + abilityTarget.pronoun2 + "击倒。当你的挥击接触到地面时，地面都裂开了，声音震耳欲聋！");
         get_combat().doDamage(retributionDamage(),true,true,false,true);
         get_player().get_weapon().weaponXP(10 + Utils.rand(21));
         set_monster(_loc1_);
      }
      
      public function retributionDamage() : Number
      {
         return get_monster().reduceDamageCombat(get_combat().globalMod(get_combat().damageTaken * 2 + get_combat().calcWeaponDamage(false)),0,true);
      }
      
      public function reset() : void
      {
         saveContent.abilityUsage = {};
      }
      
      public function rendCalc() : DamageRange
      {
         return new DamageRange(get_monster().reduceDamageMin(get_combat().calcWeaponDamage() * 1.5),get_monster().reduceDamageMax(get_combat().calcWeaponDamage() * 1.5),get_monster().reduceDamageCombat(get_combat().calcWeaponDamage() * 1.5));
      }
      
      public function rend() : void
      {
         outputText("你将手臂向后收，然后挥舞你的[weapon]，以致命的对角线劈砍");
         var _loc1_:* = combatAvoidDamage(new AvoidDamageParameters(true,true,true,null,null,get_monster().standardDodgeFunc(get_player()),null,null));
         if(_loc1_.dodge != null)
         {
            outputText("就在[themonster]向后躲闪时，仅仅是擦肩而过。");
         }
         else if(_loc1_.block || Boolean(_loc1_.parry))
         {
            outputText("[themonster]勉强及时挡住了攻击。");
         }
         else
         {
            outputText("正中目标，撕裂了[themonster]");
            if(get_monster().bleed(get_player(),3,0.5))
            {
               outputText("并导致鲜血喷涌而出");
            }
            outputText("。这一击的威力似乎损坏了[monster.his][monster.armor]！");
            get_combat().doDamage(rendCalc().combat,true,true);
            get_monster().set_armorDef(Math.max(0,get_monster().get_armorDef() - get_player().get_weapon().masteryLevel()));
            get_player().get_weapon().weaponXP(10 + Utils.rand(21));
         }
         get_combat().startMonsterTurn();
      }
      
      public function reapDull() : void
      {
         clearOutput();
         get_combat().damageType = "PhysicalM";
         outputText("你扭动身体，盘旋着将无头骑士镰刀锋利的边缘带到你的背后。你专注于它邪恶的力量，当你周围的世界变暗，被黑暗吞噬时，你感觉到它在吸取你的生命力。");
         get_player().takeDamage(100 + Utils.rand(150),true);
         outputText("[pg]在所有的光芒消失后，你展开身体，一道闪光掠过你的敌人。压倒性的黑暗像烟雾一样消散，爬回来并汇聚在你镰刀闪亮的银色刀刃上。");
         if(Boolean(combatAvoidDamage(new AvoidDamageParameters(null,false,false,null,null,reapChance(),null,null)).attackFailed))
         {
            outputText("\n当战场再次亮起时，你发现你没有击中你的敌人！");
            outputText("[pg]你没能收割你的敌人，镰刀对生命的渴望反噬了你！");
            get_player().takeDamage(400 + Utils.rand(150),true);
            get_player().get_weapon().weaponXP(10 + Utils.rand(11));
            get_combat().startMonsterTurn();
            return;
         }
         outputText("[pg]当战场再次亮起时，你敌人身上的伤口爆发出黑暗能量，对[monster.him]造成了重创！");
         currDamage = get_combat().doDamage(reapCalc(),true,true,true,true);
         outputText("[pg]");
         get_player().get_weapon().weaponXP(5 + Utils.rand(11));
         get_combat().startMonsterTurn();
      }
      
      public function reapChance() : Number
      {
         return get_monster().standardDodgeFunc(get_player(),-15);
      }
      
      public function reapCalc(param1:Boolean = false, param2:Boolean = false) : Number
      {
         var _loc3_:Number = get_game().combat.calcWeaponDamage(false) * 1.5;
         if(param1)
         {
            get_monster().reduceDamageMin(_loc3_,33,true);
         }
         else if(param2)
         {
            get_monster().reduceDamageMax(_loc3_,33,true);
         }
         else
         {
            get_monster().reduceDamageCombat(_loc3_,33,true);
         }
         if(_loc3_ * 2.75 > get_monster().get_HP())
         {
            _loc3_ *= 2.75;
         }
         return _loc3_;
      }
      
      public function randomMonster(param1:Function) : void
      {
         var _loc2_:Array = get_combat().getActiveEnemies();
         if(int(_loc2_.length) == 0)
         {
            return;
         }
         var _loc3_:Monster = get_monster();
         var _loc4_:Array = _loc2_;
         set_monster(_loc4_[Utils.rand(int(_loc4_.length))]);
         param1();
         set_monster(_loc3_);
      }
      
      public function ramsStun() : void
      {
         clearOutput();
         if(get_monster().get_short() == "worms")
         {
            outputText("利用你新获得的天然武器，你迅速向这个畸形的怪物冲去。感觉到迫在眉睫的危险，这怪物主动散开了身体，导致这团蠕虫伴随着令人作呕的湿润“砰”声落到地上，让你的角只刺中了空气。[pg]");
            get_combat().startMonsterTurn();
            return;
         }
         if(goreChance() > Utils.rand(100))
         {
            currDamage = ramCalc();
            outputText("你将角对准你的对手。伴随着一次快速的冲锋，你打得他们措手不及，将他们撞倒在地！");
            if(get_combat().combatCritical(get_player(),get_monster()))
            {
               outputText("[b:暴击！]");
               currDamage *= 1.75;
            }
            currDamage = get_combat().doDamage(currDamage,true,false);
            if(get_monster().stun(2,int(goreChance())))
            {
               outputText("[b:你的撞击也成功击晕了[themonster]！]");
            }
            outputText(get_combat().getDamageText(currDamage));
            outputText("[pg]");
         }
         else if(get_monster().get_short() == "Vala")
         {
            outputText("你低下头向瓦拉冲去，但她只是飞得更高，在你靠近时抓住了你的角，并将她多汁、芳香的小穴蹭在你的鼻子上。那感官上的气味和她兴奋的呻吟让你愣了一下，让她得以继续把你当作自慰辅助工具，但她很快就厌倦了这样的前戏，眨了眨眼飞了回去。[pg]");
            dynStats(DynStat.Lust(5));
         }
         else
         {
            outputText("你将角对准你的对手。伴随着一次快速的冲锋，你试图将他们撞倒在地。他们在最后一刻成功躲开了，留下你气喘吁吁又恼火。");
         }
         outputText("[pg]");
         get_combat().startMonsterTurn();
      }
      
      public function ramCalc(param1:Boolean = false, param2:Boolean = false) : Number
      {
         var _loc3_:Number = int(get_player().get_str() + (get_player().get_spe() * 0.2 + get_player().level * 2) * 0.7);
         if(_loc3_ < 0)
         {
            _loc3_ = 5;
         }
         if(_loc3_ > get_player().level * 10 + 100)
         {
            _loc3_ = get_player().level * 10 + 100;
         }
         if(_loc3_ > 0)
         {
            _loc3_ *= get_player().physMod();
            _loc3_ = get_combat().bodyMod(_loc3_);
            _loc3_ = get_combat().globalMod(_loc3_);
         }
         if(param1)
         {
            return get_monster().reduceDamageMin(_loc3_);
         }
         if(param2)
         {
            return get_monster().reduceDamageMax(_loc3_);
         }
         return get_monster().reduceDamageCombat(_loc3_);
      }
      
      public function powerThrough() : void
      {
         var _loc1_:String = "你咬紧牙关，摇了摇头，鼓起意志力，立刻从昏迷中恢复过来！[pg]";
         get_player().removeStatusEffect(StatusEffects.Stunned);
         get_combat().combatMenu(false,_loc1_);
      }
      
      public function possessChance() : Number
      {
         if(!get_monster().hasCock() && !get_monster().hasVagina() || get_monster().lustVuln == 0 || get_monster().get_inteUnscaled() == 0 || get_monster().get_inteUnscaled() > 100 || get_player().get_inte() < get_monster().get_inteUnscaled() - 10)
         {
            return 0;
         }
         return standardStatComparison(get_player().get_inte(),get_monster().get_inteRescaled(),-10);
      }
      
      public function possessCalc(param1:Boolean = false, param2:Boolean = false) : Number
      {
         return Math.round((get_player().get_inte() / 5 + (param1 ? 0 : Utils.rand(get_player().level)) + (param2 ? get_player().level : 0) + get_player().level) * get_monster().lustVuln);
      }
      
      public function possess() : void
      {
         var _loc1_:Number = NaN;
         clearOutput();
         if(get_monster().get_short() == "plain girl" || get_monster().hasPerk(PerkLib.Incorporeality))
         {
            outputText("伴随着一个微笑和眨眼，你的身形变得完全无形，你毫不迟疑地扑向对手的身躯。可悲的是，这注定要失败，因为你直接从敌人幽灵般的身躯上弹开了。");
         }
         else if(get_monster() is Dullahan || get_monster() is DullahanHorse)
         {
            outputText("伴随着一个微笑和眨眼，你的身形变得完全无形，你毫不迟疑地扑向对手的身躯。奇怪的是，你穿了过去，仿佛那里什么都没有。");
         }
         else if(get_monster() is LivingStatue || get_monster() is VolcanicGolem || get_monster() is TrainingDummy)
         {
            outputText("[themonster]体内没有任何可以附身的东西。");
         }
         else if(!get_monster().hasCock() && !get_monster().hasVagina() || get_monster().lustVuln == 0 || get_monster().get_inte() == 0 || get_monster().get_inte() > 100)
         {
            outputText("伴随着一个微笑和眨眼，你的身形变得完全无形，你毫不迟疑地扑向对手的身躯。不幸的是，似乎");
            if(get_monster().get_inte() > 100)
            {
               outputText("他们在精神上的准备远超你的应对能力，你甚至还没来得及和他们寻欢作乐，就被立刻赶出了他们的身体。该死，你暗自嘀咕。[pg]");
            }
            else
            {
               outputText("他们的身体与任何形式的附身都不兼容。[pg]");
            }
         }
         else if(possessChance() > Utils.rand(100))
         {
            outputText("伴随着一个微笑和眨眼，你的身形变得完全无形，你毫不迟疑地扑向对手的身躯。在他们夺回主动权之前，你控制了他们的一只手臂，用力自慰了几秒钟，然后才最终被赶出来。重新恢复实体后，你注意到敌人脸上的红晕，知道你的努力还是有些成效的。");
            _loc1_ = possessCalc();
            get_monster().teased(_loc1_);
            outputText("[pg]");
         }
         else
         {
            outputText("伴随着一个微笑和眨眼，你的身形变得完全无形，你毫不迟疑地扑向对手的身躯。不幸的是，似乎他们在精神上的准备比你预想的要充分，你甚至还没来得及和他们寻欢作乐，就被立刻赶出了他们的身体。该死，你暗自嘀咕。得变得更聪明些才行。[pg]");
         }
         get_combat().startMonsterTurn();
      }
      
      public function playerStinger() : void
      {
         clearOutput();
         if(get_player().tail.venom < 33)
         {
            outputText("你现在没有足够的毒液来蛰刺！");
            doNext(physicalSpecials);
            return;
         }
         if(get_monster().get_short() == "worms")
         {
            outputText("利用你新获得的天然武器，你迅速将毒刺刺向这个畸形的怪物。感觉到迫在眉睫的危险，这怪物主动散开了身体，导致这团蠕虫伴随着令人作呕的湿润“砰”声落到地上，让你只刺中了空气。[pg]");
            get_combat().startMonsterTurn();
            return;
         }
         var _loc1_:* = combatAvoidDamage(new AvoidDamageParameters(null,false,true,null,true,null,null,null));
         if(Boolean(_loc1_.attackFailed))
         {
            if(_loc1_.dodge != null)
            {
               switch(Utils.rand(2))
               {
                  case 0:
                     outputText("[Themonster]险险地避开了你的毒刺！[pg]");
                     break;
                  case 1:
                     outputText("[Themonster]以极快的速度躲开了你的毒刺！[pg]");
                     break;
                  case 2:
                     outputText("[Themonster]灵巧地避开了你缓慢的蛰刺尝试。[pg]");
               }
            }
            if(Boolean(_loc1_.block))
            {
               outputText("[Themonster]及时举起了[monster.his]盾牌，挡住了你的蛰刺！[pg]");
            }
            get_combat().startMonsterTurn();
            return;
         }
         if(get_monster().get_armorDef() - get_player().level >= 10 && Utils.rand(4) > 0)
         {
            outputText("尽管你尽了最大努力，你的蛰刺攻击还是无法穿透[themonster]的防御。[pg]");
            get_combat().startMonsterTurn();
            return;
         }
         outputText("当你成功蛰刺到[monster.him]时，灼热的剧痛穿透了[themonster]！");
         if(get_monster().get_plural())
         {
            outputText("你看着[monster.he]踉跄着后退了一步，差点绊倒，脸涨得通红。");
         }
         else
         {
            outputText("你看着[monster.he]踉跄着后退了一步，差点绊倒，脸涨得通红。");
         }
         var _loc2_:Number = stingerCalc();
         get_monster().teased(_loc2_);
         if(!get_monster().hasStatusEffect(StatusEffects.lustvenom))
         {
            get_monster().createStatusEffect(StatusEffects.lustvenom,0,0,0,0);
         }
         outputText("[pg]");
         var _temp_1:* = get_player().tail;
         _temp_1.venom = _temp_1.venom - 25;
         get_combat().startMonsterTurn();
      }
      
      public function physicalSpecials() : void
      {
         var newRound:Boolean;
         var _g:Combat;
         var _loc3_:* = null as CombatAbility;
         if(get_game().urtaQuest.isUrta())
         {
            get_game().urtaQuest.urtaSpecials();
            return;
         }
         if(get_game().get_inCombat() && get_player().hasStatusEffect(StatusEffects.Sealed) && get_player().statusEffectv2(StatusEffects.Sealed) == 5)
         {
            clearOutput();
            outputText("你试图准备一次特殊攻击，结果却头晕目眩地踉跄了一下。[b:你使用物理特殊攻击的能力被封印了，现在你浪费了一次攻击机会！][pg]");
            get_combat().startMonsterTurn();
            return;
         }
         menu();
         var _loc1_:int = 0;
         var _loc2_:Array = physicalAbilities;
         while(_loc1_ < int(_loc2_.length))
         {
            _loc3_ = _loc2_[_loc1_];
            _loc1_++;
            _loc3_.createButton();
         }
         _g = get_combat();
         newRound = false;
         setExitButton("返回",function():void
         {
            _g.combatMenu(newRound);
         });
      }
      
      public function parasiteReleaseMusk() : void
      {
         clearOutput();
         if(get_player().cockTotal() == 1)
         {
            outputText("你抓住你的" + get_player().cockDescript() + "并抚摸了几下，迅速产生了几缕预先液。你摇晃了一会儿，很快整个战场都被你的寄生虫产生的压倒性麝香所覆盖。\n");
         }
         if(get_player().cockTotal() > 1)
         {
            outputText("你抓住你的一个" + get_player().multiCockDescript() + "并抚摸了几下，迅速产生了几缕预先液。你摇晃了一会儿，很快整个战场都被你的寄生虫产生的压倒性麝香所覆盖。\n");
         }
         outputText("你的头有点晕，你希望你的敌人也受到它的影响。");
         get_player().createStatusEffect(StatusEffects.ParasiteSlugMusk,4,0,0,0);
         outputText("[pg]");
         get_combat().startMonsterTurn();
      }
      
      public function parasiteQueen() : void
      {
         clearOutput();
         var _loc1_:int = int(parasiteCalc());
         get_player().createStatusEffect(StatusEffects.ParasiteQueen,_loc1_,0,0,0);
         get_mainView().statsView.showStatUp("str");
         get_mainView().statsView.showStatUp("tou");
         get_mainView().statsView.showStatUp("spe");
         statScreenRefresh();
         if(get_monster() is FrostGiant && get_player().hasStatusEffect(StatusEffects.GiantBoulder))
         {
            get_monster().giantBoulderHit(2);
            get_combat().startMonsterTurn();
            return;
         }
         outputText("你集中精神，向你的子嗣发送了一个精神命令，让它们为了它们的育母牺牲自己！[pg]");
         outputText("寄生虫响应了召唤，为你牺牲了自己。你感觉到你的身体随着新发现的力量而成长！");
         get_player().addStatusValue(StatusEffects.ParasiteEel,1,-1);
         outputText("[pg]");
         get_combat().startMonsterTurn();
      }
      
      public function parasiteCalc() : Number
      {
         return Math.min(get_player().statusEffectv1(StatusEffects.ParasiteEel) * 2,20);
      }
      
      public function paralyzingStareChance() : Number
      {
         if(get_monster() is EncapsulationPod || get_monster().get_inteUnscaled() == 0 || get_monster().hasPerk(PerkLib.BasiliskResistance) || get_monster().hasStatusEffect(StatusEffects.Shell) || get_monster().hasStatusEffect(StatusEffects.BasiliskCompulsion))
         {
            return 0;
         }
         var _loc1_:Number = Utils.boundFloat(0,FlagDict_Impl_.arrayReadInt(KFLAGS.flags,2208) / 100,1);
         var _loc2_:int = int(-30 * (1 - _loc1_));
         if(get_player().hasPerk(PerkLib.NaturalWeapons))
         {
            _loc2_ += 20;
         }
         return standardStatComparison(get_player().get_inte(),get_monster().get_inteRescaled(),_loc2_);
      }
      
      public function paralyzingStare() : void
      {
         var _loc7_:* = null as IMap;
         var _loc1_:Number = Math.min(1,FlagDict_Impl_.arrayReadInt(KFLAGS.flags,2208) / 100);
         var _loc2_:Number = 16 + _loc1_ * 8;
         var _loc3_:BasiliskSlowDebuff = get_monster().createOrFindStatusEffect(StatusEffects.BasiliskSlow);
         var _loc4_:Number = get_monster().get_spe();
         var _loc5_:int = 0;
         var _loc6_:String = "";
         if(_loc1_ > 1)
         {
            _loc1_ = 1;
         }
         get_output().clear();
         if(get_player().hasStatusEffect(StatusEffects.ThroatPunch) || get_player().hasStatusEffect(StatusEffects.WebSilence))
         {
            get_output().text("你现在呼吸困难，无法说话来维持强迫。");
            doNext(magicalSpecials);
            return;
         }
         if(get_monster() is EncapsulationPod || get_monster().get_inteUnscaled() == 0)
         {
            get_output().text("在这个狭小的豆荚里，这种攻击毫无用处！\n\n");
            get_player().changeFatigue(1);
            get_combat().startMonsterTurn();
            return;
         }
         if(get_monster() is TentacleBeast)
         {
            get_output().text("你试图寻找野兽的眼睛来凝视它们，但你很快意识到，它根本没有眼睛！\n\n");
            get_player().changeFatigue(1);
            get_combat().startMonsterTurn();
            return;
         }
         if(get_monster().hasPerk(PerkLib.BasiliskResistance))
         {
            get_output().text("你试图对[themonster]施加你那令人瘫痪的凝视，但你很快意识到，[monster.he]对你的眼睛免疫，所以你迅速后退。\n\n");
            get_combat().startMonsterTurn();
            return;
         }
         if(get_monster().hasStatusEffect(StatusEffects.Shell))
         {
            get_output().text("当你的魔法接触到[themonster]周围五颜六色的岩壳时，它发出嘶嘶声并消失得无影无踪。不管那是什么东西，它完全阻挡了你的魔法！\n\n");
            get_combat().startMonsterTurn();
            return;
         }
         get_output().text("你张开嘴，盯着[themonster]，说出平静的话语来安抚[monster.his]心智。这些声音钻进[themonster]的脑海，在[monster.his]决心的边缘起作用并嗡嗡作响，暗示、强迫，然后要求[monster.him]看着你的眼睛。");
         if(Utils.randomChance(paralyzingStareChance()))
         {
            _loc6_ = "[Themonster]情不自禁……[monster.he]瞥见了你的眼睛。[monster.he]迅速移开视线，但[monster.he]能在[monster.his]脑海中想象出它们，盯着[monster.his]想法，让[monster.him]感到迟钝，无法协调。这种无助感让人感觉如此美妙……[monster.he]无法消除这种感觉，实际上，[monster.he]想永远看着你的眼睛，让你完全控制[monster.him]。";
            _loc3_.applyEffect(_loc2_);
            get_monster().createStatusEffect(StatusEffects.BasiliskCompulsion,_loc2_ * 0.75,0,0,0);
            _loc7_ = KFLAGS.flags;
            FlagDict_Impl_.arrayWriteInt(_loc7_,2208,FlagDict_Impl_.arrayReadInt(_loc7_,2208) + 4);
            _loc5_ = int(Math.round(_loc4_ - get_monster().get_spe()));
            get_output().text(_loc6_ + get_combat().getDamageText(_loc5_) + "\n\n");
         }
         else
         {
            get_output().text("就像橡皮筋弹回一样，当[themonster]逃脱你的凝视时，现实又回到了它应有的位置。\n\n");
            _loc7_ = KFLAGS.flags;
            FlagDict_Impl_.arrayWriteInt(_loc7_,2208,FlagDict_Impl_.arrayReadInt(_loc7_,2208) + 2);
         }
         get_combat().startMonsterTurn();
      }
      
      public function overhealtest() : void
      {
         clearOutput();
         outputText("如果你在这里，OtherCoCAnon就是一个忘记从列表中删除这个测试能力的白痴。它将任何超过你最大生命值的额外治疗量的50%作为过量治疗，最高可达最大生命值的50%。\n");
         get_player().createStatusEffect(StatusEffects.Overhealing,0,0,0,0);
         get_combat().startMonsterTurn();
      }
      
      public function onslaught() : void
      {
         var t:Timer;
         var _gthis:CombatAbilities = this;
         menu();
         t = new Timer(400,10);
         t.addEventListener(TimerEvent.TIMER,function(param1:*):void
         {
            _gthis.outputText("你击中了！\n");
            _gthis.get_output().flush();
            _gthis.get_monster().takeDamage(100,true);
            _gthis.statScreenRefresh();
            t.delay -= 5 * t.currentCount;
            if(t.currentCount == 10)
            {
               _gthis.outputText("\n结束了");
            }
         });
         t.addEventListener(TimerEvent.TIMER_COMPLETE,function(param1:*):void
         {
            _gthis.get_output().flush();
            _gthis.get_combat().startMonsterTurn();
         });
         t.start();
      }
      
      public function onAscend(param1:Boolean) : void
      {
         reset();
      }
      
      public function nephilaStaffSpell() : void
      {
         clearOutput();
         outputText("你向前滚动，趴在你那淫秽的肚子上，在身体其余部分的重量下将其稍微压平，然后将你的皇家权杖举到你面前的半空中。三根长长的、黏糊糊的触手从你颤抖的肉缝中蜿蜒而出，抓住权杖，把它带到你的后端，用权杖末端那颗看起来像怀孕一样的宝石挑逗你。当触手在你的小穴外唇上下来回滚动宝石时，你能感觉到你的疲惫正在慢慢流失。作为回应，宝石闪烁着柔和的紫色能量，其切面上反射出的面孔似乎充满了情欲的活力。紫罗兰色的欲望光环向外扩展，让你的[skin]沐浴在性高潮前夕的感觉中。感觉恢复了活力，你伸出一只手臂，你的触手小心翼翼地将法杖放在你伸出的手掌中。重新掌握控制权后，你向后滚动，恢复到你那饱满的身体所能做出的最接近战斗姿态的姿势。");
         var _loc1_:int = 10 + int(get_player().statusEffectv1(StatusEffects.ParasiteNephila) / 2);
         var _loc2_:int = 10 + int(get_player().statusEffectv1(StatusEffects.ParasiteNephila) / 4);
         dynStats(DynStat.Lust(_loc1_ / 2));
         get_player().changeFatigue(-_loc1_);
         outputText("[b:(" + get_combat().colorText(DamageColor.Damage,"-" + _loc1_) + " 疲劳和 " + get_combat().colorText(DamageColor.Lust,"+" + _loc1_ / 2) + " 欲望)][pg]");
         get_combat().startMonsterTurn();
      }
      
      public function nephilaQueen() : void
      {
         clearOutput();
         var _loc1_:int = int(nephilaCalc());
         get_player().createStatusEffect(StatusEffects.NephilaQueen,_loc1_,0,0,0);
         get_mainView().statsView.showStatUp("int");
         statScreenRefresh();
         if(get_monster() is FrostGiant && get_player().hasStatusEffect(StatusEffects.GiantBoulder))
         {
            get_monster().giantBoulderHit(2);
            get_combat().startMonsterTurn();
            return;
         }
         outputText("你集中精神，向你的子嗣发送了一个精神命令，让它们为了它们的育母牺牲自己！[pg]");
         get_player().addStatusValue(StatusEffects.ParasiteEel,1,-1);
         outputText("[pg]");
         get_combat().startMonsterTurn();
      }
      
      public function nephilaCalc() : Number
      {
         return Math.min(get_player().statusEffectv1(StatusEffects.ParasiteNephila) * 5,50);
      }
      
      public function naggaTease() : void
      {
         var _loc1_:Number = NaN;
         var _loc2_:Number = NaN;
         var _loc3_:Boolean = false;
         var _loc4_:Boolean = false;
         var _loc5_:Boolean = false;
         var _loc6_:Number = NaN;
         var _loc7_:Boolean = false;
         var _loc8_:Boolean = false;
         var _loc9_:Boolean = false;
         var _loc10_:Boolean = false;
         var _loc11_:Boolean = false;
         var _loc12_:Boolean = false;
         var _loc13_:Boolean = false;
         clearOutput();
         if(get_monster().hasStatusEffect(StatusEffects.NagaVenom))
         {
            outputText("你试图通过摩擦[themonster]的下体来刺激[monster.him]，但[monster.his]似乎受你的毒素影响太深而无法做出反应。[pg]");
         }
         else if(get_monster().get_gender() == 0)
         {
            outputText("你打量着[themonster]，但想不出该如何挑逗这样一个不寻常的敌人。[pg]");
         }
         else
         {
            get_combat().fatigueRecovery();
            _loc1_ = 0;
            _loc2_ = 0;
            _loc3_ = false;
            _loc4_ = false;
            _loc5_ = false;
            _loc6_ = 0;
            _loc7_ = false;
            _loc8_ = false;
            _loc9_ = false;
            _loc10_ = false;
            _loc11_ = false;
            _loc12_ = false;
            _loc13_ = true;
            _loc2_ = 60;
            _loc2_ += get_player().masteryLevel(MasteryLib.Tease) * 5;
            if(get_player().hasPerk(PerkLib.Seduction))
            {
               _loc2_ += 10;
            }
            _loc2_ += get_player().getBonusStat("挑逗几率");
            if(get_player().hasPerk(PerkLib.BimboBody))
            {
               _loc2_ += 10;
               _loc3_ = true;
            }
            if(get_player().hasPerk(PerkLib.BroBody))
            {
               _loc2_ += 10;
               _loc4_ = true;
            }
            if(get_player().hasPerk(PerkLib.FutaForm))
            {
               _loc2_ += 10;
               _loc5_ = true;
            }
            if(get_player().hasPerk(PerkLib.SensualLover))
            {
               _loc2_ += 2;
            }
            _loc1_ = 6 + Utils.rand(3);
            if(get_player().hasPerk(PerkLib.SensualLover))
            {
               _loc1_ += 2;
            }
            if(get_player().hasPerk(PerkLib.Seduction))
            {
               _loc1_ += 5;
            }
            _loc1_ += get_player().getBonusStat("挑逗伤害");
            if(_loc3_ || _loc4_ || _loc5_)
            {
               _loc1_ += 5;
               _loc3_ = true;
            }
            _loc1_ += get_player().level;
            _loc1_ += get_player().masteryLevel(MasteryLib.Tease) * 2;
            _loc1_ += Utils.rand(7);
            _loc2_ += 2;
            if(get_monster().get_short() == "demons")
            {
               outputText("当你刺激他们中的一个兄弟时，其他恶魔不禁被这一幕激起了更多的性欲，都希望能触摸和感受到你光滑、布满鳞片的身体。");
            }
            else if(get_monster().get_short() == "slime")
            {
               outputText("尽管史莱姆没有任何性器官，你还是试图刺激它。不知怎么的，这奏效了！");
            }
            else
            {
               if(get_monster().get_gender() == 1)
               {
                  outputText("你灵活的尾巴开始轻轻抚摸他的" + get_monster().cockDescriptShort(0) + "，你可以从他的脸上看出，他正试图掩饰这感觉很好的事实。");
               }
               if(get_monster().get_gender() == 2)
               {
                  outputText("你灵活的尾巴设法钻进了她的双腿之间，用你尾巴上布满鳞片的皮肤摩擦她的阴蒂。她似乎很享受，但很明显她正试图向你隐瞒。");
               }
               if(get_monster().get_gender() == 3)
               {
                  outputText("你灵活的尾巴设法钻进了[monster.his]的双腿之间，接触到了两套生殖器。当你粗糙、布满鳞片的皮肤摩擦过[monster.his]的阴蒂时，你的尾巴开始轻轻抚摸[monster.his]的肉棒。[monster.his]脸上压抑的表情背叛了[monster.his]自己对这种待遇的享受。");
               }
            }
            if(Utils.rand(100) <= _loc2_)
            {
               _loc1_ *= 0.9;
               if(get_player().hasPerk(PerkLib.HistoryWhore))
               {
                  _loc1_ *= 1.15;
               }
               if(get_player().hasPerk(PerkLib.AscensionSeduction))
               {
                  _loc1_ *= 1 + get_player().perkv1(PerkLib.AscensionSeduction) * 0.05;
               }
               get_monster().teased(get_monster().lustVuln * _loc1_);
               get_player().masteryXP(MasteryLib.Tease,1 + Utils.rand(9));
            }
            else
            {
               outputText("[pg-][Themonster]似乎不为所动。");
               get_player().masteryXP(MasteryLib.Tease,4 + Utils.rand(33));
            }
            outputText("[pg]");
            if(get_monster().get_lust() >= get_monster().maxLust())
            {
               doNext(get_combat().endLustVictory);
               return;
            }
            if(get_monster() is Dullahan)
            {
               outputText("[pg]尽管你拼尽全力，无头骑士依然死死咬住你的肩膀不放！");
               get_player().takeDamage(10,true);
               if(get_player().get_HP() <= 0)
               {
                  doNext(get_combat().endHpLoss);
                  return;
               }
            }
         }
         get_combat().startMonsterTurn();
      }
      
      public function naggaSqueeze() : void
      {
         clearOutput();
         outputText("你的线圈将猎物缠得更紧，让[monster.him]喘不过气来。当[monster.his]的挣扎短暂加剧时，你能在尾巴上感觉到。");
         var _loc1_:int = int(get_monster().maxHP() * (0.1 + Utils.rand(15) / 100));
         get_combat().doDamage(_loc1_,true,true);
         get_player().changeFatigue(10,2);
         if(get_monster().get_HP() < 1)
         {
            outputText("你能感觉到[themonster]的生命体征开始减弱，在彻底挤碎[monster.his]生机之前，你松开了手，任由[monster.him]瘫倒在地，虽然昏迷不醒，但好歹还活着。没过多久，[monster.his]眼皮就开始跳动，你毫不怀疑[monster.he]很快就会醒来。");
            if(get_monster().get_short() == "demons")
            {
               outputText("其他人迅速后退，对你可能对他们做的事情感到恐惧。");
            }
            outputText("[pg]");
            doNext(get_combat().endHpVictory);
            return;
         }
         if(get_monster() is Dullahan)
         {
            outputText("[pg]尽管你拼尽全力，无头骑士依然死死咬住你的肩膀不放！");
            get_player().takeDamage(10,true);
            if(get_player().get_HP() <= 0)
            {
               doNext(get_combat().endHpLoss);
               return;
            }
         }
         get_combat().startMonsterTurn();
      }
      
      public function nagaPlayerConstrict() : void
      {
         var newRound:Boolean;
         var _g:Combat;
         var _loc1_:* = null as Monster;
         clearOutput();
         if(get_monster().get_plural())
         {
            outputText("你扑向[themonster]，但面对多个敌人，缠住其中一个会让你完全暴露在攻击之下。你在将自己暴露在危险中之前，急忙向后滑行。");
            get_combat().startMonsterTurn();
            return;
         }
         if(get_monster().get_short() == "pod")
         {
            outputText("你无法缠绕困住你的东西！");
            menu();
            _g = get_combat();
            newRound = false;
            addButton(0,"继续",function():void
            {
               _g.combatMenu(newRound);
            });
            return;
         }
         if(get_monster().hasStatusEffect(StatusEffects.Concentration))
         {
            outputText("艾米莉完全专注于你的动作，轻松地滑步避开了你的攻击。");
            get_combat().startMonsterTurn();
            return;
         }
         if(get_monster() is VolcanicGolem)
         {
            if(get_monster().hasStatusEffect(StatusEffects.VolcanicFistProblem))
            {
               outputText("[pg-]看到魔像的手臂半埋在地下，你决定缠住它并用尽全力拉扯，在抵抗灼热高温的同时痛苦地畏缩着。[pg-]");
               if(get_player().get_str() > 80 && !get_monster().hasStatusEffect(StatusEffects.VolcanicFrenzy))
               {
                  outputText("[pg-]凭借非人的力量，你成功地扯下了魔像的手臂！这个构造体踉跄后退，岩浆从它的手臂插槽中喷涌而出。这似乎并没有给它带来任何痛苦，但你确信它现在的物理攻击威力会大减！[pg-]");
                  get_monster().createStatusEffect(StatusEffects.VolcanicWeapRed,3,0,0,0);
                  _loc1_ = get_monster();
                  _loc1_.set_weaponAttack(_loc1_.get_weaponAttack() - 40);
                  if(get_monster().get_weaponAttack() <= 0)
                  {
                     get_monster().set_weaponAttack(10);
                  }
               }
               else
               {
                  outputText("[pg-]你就是不够强壮，无法战胜魔像的力量。在这个构造体有机会攻击你之前，你松开了自己。");
               }
            }
            else
            {
               outputText("当你试图缠绕魔像时，它一把将你拍开。");
            }
            get_combat().startMonsterTurn();
            return;
         }
         if(Utils.randomChance(constrictChance()))
         {
            if(get_monster().get_short() == "demons")
            {
               outputText("你看了看人群，想知道该缠住他们中的哪一个。你的目光落在了人群中一个随机的恶魔身上。当恶魔人群向你逼近时，你迅速在其中滑行，并向你选定的猎物扑去。你把他从怪物海中抓了出来，用你长长的蛇尾缠住他的身体，紧紧地挤压着，当你听到他欢愉的吼叫变成痛苦的呼喊时，你咧嘴笑了。");
            }
            else
            {
               outputText("你向[themonster]扑去，并缠绕在[monster.him]身上。你紧紧地挤压[monster.him]，听到[monster.him]痛苦地大叫。");
               if(get_monster() is Dullahan)
               {
                  outputText("[pg]眼看无路可逃，无头骑士在你的束缚下猛地向后仰去，然后用力向前一甩。她的头颅从躯干上飞出，直直地落在你的肩膀上，开始拼命撕咬你的血肉！");
                  get_player().takeDamage(10,true);
                  if(get_player().get_HP() <= 0)
                  {
                     doNext(get_combat().endHpLoss);
                     return;
                  }
               }
            }
            get_monster().addStatusEffect(new ConstrictedDebuff(naggaSqueeze,nagaLeggoMyEggo,1 + Utils.rand(4),"你的猎物推着你的尾巴，扭动挣扎着试图从你尾巴紧紧的束缚中逃脱。"," [Themonster]证明了你的尾巴无法对付它，它挣脱了你紧紧缠绕的线圈。"," 尽管[themonster]努力挣扎，你对[monster.him]的抓握依然存在。"));
         }
         else
         {
            if(!get_monster().hasPerk(PerkLib.Juggernaut))
            {
               outputText("你向对手扑去，试图缠绕在[monster.him]身上。还没等你靠近，[themonster]就跳开了，导致你脸朝下摔倒在地。你赶紧爬起来，向后跳开。");
            }
            else
            {
               outputText("你向对手扑去，试图缠绕在[monster.him]身上。你拼尽全力想把[monster.him]困在你的线圈里，但[monster.he]太像个主宰了！[monster.he]强行挣脱了你的束缚，造成了极大的痛苦。");
            }
            get_player().takeDamage(5,true);
            if(get_player().get_HP() <= 0)
            {
               doNext(get_combat().endHpLoss);
               return;
            }
         }
         get_combat().startMonsterTurn();
      }
      
      public function nagaLeggoMyEggo() : void
      {
         clearOutput();
         outputText("你将[themonster]从[monster.his]的束缚中释放出来，[monster.he]倒在地上，喘了口气，然后[monster.he]重新站起来，显然准备再战。");
         if(get_monster() is Dullahan)
         {
            outputText("[pg]她的头从你的肩膀上松开，开始滑稽地向它的身体滚去，她迅速抓住它，以便重新接上。");
         }
         get_monster().removeStatusEffect(StatusEffects.Constricted);
         get_combat().startMonsterTurn();
      }
      
      public function nagaChance() : Number
      {
         if(get_monster().hasPerk(PerkLib.PoisonImmune))
         {
            return 0;
         }
         if(get_monster().hasStatusEffect(StatusEffects.Constricted))
         {
            return 100;
         }
         var _loc1_:int = -20;
         if(get_player().hasPerk(PerkLib.NaturalWeapons))
         {
            _loc1_ = 0;
         }
         return get_monster().standardDodgeFunc(get_player(),_loc1_);
      }
      
      public function nagaCalc(param1:Boolean = false, param2:Boolean = false) : Number
      {
         if(param1)
         {
            if(param2)
            {
               return 10;
            }
            return 5;
         }
         return Utils.randBetween(5,10);
      }
      
      public function nagaBiteAttack() : void
      {
         var _loc1_:Number = NaN;
         var _loc2_:Number = NaN;
         var _loc3_:* = null as Array;
         var _loc4_:Number = NaN;
         var _loc5_:Number = NaN;
         var _loc6_:* = null as NagaBiteDebuff;
         clearOutput();
         if(get_monster().hasPerk(PerkLib.PoisonImmune))
         {
            outputText("[Themonster]对任何类型的毒素免疫！你的啃咬毫无作用！[pg]");
            get_combat().startMonsterTurn();
            return;
         }
         if(get_monster().hasPerk(PerkLib.BiteImmune))
         {
            outputText("你向前猛扑，露出毒牙，用尽全力咬向[themonster]。当你咬中的那一刻，一阵刺痛直冲你的头骨，你的牙齿甚至无法在上面留下最轻微的凹痕。你还不如去咬一块石头！");
            get_player().takeDamage(5,true);
            get_combat().startMonsterTurn();
            return;
         }
         if(nagaChance() > Utils.rand(100))
         {
            if(get_monster().get_short() == "demons")
            {
               outputText("你看了看人群，想知道该咬他们中的哪一个。你的目光落在了这群人的首领身上，由于他穿着蛇皮斗篷，很容易被认出来。当恶魔人群向你逼近时，你迅速在其中穿梭，并向首领宽阔的身体扑去。你趁恶魔不备，将你针状的毒牙深深刺入他的肉中。你迅速释放毒液，并在他或这群人的其他人做出反应之前撤退。");
            }
            else
            {
               outputText("你头朝下向敌人扑去，露出毒牙。你设法趁[themonster]不备，你针状的毒牙深深刺入[monster.his]的身体。你迅速释放毒液，并在[monster.he]做出反应之前撤退。");
            }
            _loc1_ = get_monster().get_str();
            _loc2_ = get_monster().get_spe();
            _loc3_ = [];
            _loc4_ = 0;
            _loc5_ = 0;
            _loc6_ = get_monster().createOrFindStatusEffect(StatusEffects.NagaBite);
            _loc6_.increase();
            if(get_monster().hasStatusEffect(StatusEffects.Constricted))
            {
               _loc6_.increase();
            }
            _loc4_ = _loc1_ - get_monster().get_str();
            _loc5_ = _loc2_ - get_monster().get_spe();
            if(_loc4_ > 0)
            {
               _loc3_.push("[monster.his]力量降低了" + get_combat().colorText(DamageColor.Damage,"" + _loc4_));
            }
            if(_loc5_ > 0)
            {
               _loc3_.push("[monster.his]速度降低了" + get_combat().colorText(DamageColor.Damage,"" + _loc5_));
            }
            if(int(_loc3_.length) > 0)
            {
               outputText("[pg]毒素降低了" + Utils.formatStringArray(_loc3_) + "！");
               _loc3_ = [];
               if(get_monster().get_str() <= 1)
               {
                  _loc3_.push("力量");
               }
               if(get_monster().get_spe() <= 1)
               {
                  _loc3_.push("速度");
               }
               if(int(_loc3_.length) > 0)
               {
                  outputText("[pg-][Monster.his]" + Utils.formatStringArray(_loc3_) + "无法再降低了。");
               }
            }
         }
         else
         {
            outputText("你一头扑向敌人，露出獠牙。你的尝试失败得极其惨烈，因为[themonster]成功反击了你的猛扑，把你的头打飞，力道之大让你的耳朵嗡嗡作响。");
         }
         get_combat().startMonsterTurn();
      }
      
      public function monkStance() : void
      {
         outputText("你控制着呼吸，集中精神，调整重心，准备迎接任何攻击。");
         stanceChange(FistStances.Monk);
         if(canFist(4))
         {
            outputText("[pg-]对手的每一个动作都被你锐利的[eyes]尽收眼底。");
            get_player().createStatusEffect(StatusEffects.TrueParry);
         }
         get_combat().startMonsterTurn();
      }
      
      public function mightCalc(param1:Boolean = false) : Number
      {
         return Math.round(10 * get_player().spellMod());
      }
      
      public function mermaidChantLust() : DamageRange
      {
         var _loc1_:Number = get_monster().lustVuln;
         if(get_player().hasPerk(PerkLib.HistoryWhore))
         {
            _loc1_ *= 1.15;
         }
         if(get_player().hasPerk(PerkLib.AscensionSeduction))
         {
            _loc1_ *= 1 + get_player().perkv1(PerkLib.AscensionSeduction) * 0.05;
         }
         var _loc2_:Number = get_player().getTotalStat("挑逗伤害",20) * _loc1_ / 2;
         var _loc3_:int = int(Math.round(_loc2_ * 0.85));
         var _loc4_:int = int(Math.round(_loc2_ * 1.15));
         return new DamageRange(_loc3_,_loc4_,Utils.randBetween(_loc3_,_loc4_));
      }
      
      public function mermaidChantDebuff() : DamageRange
      {
         var _loc1_:Number = get_player().getBonusStat("挑逗伤害");
         var _loc2_:Number = get_player().getBonusStatMultiplicative("挑逗伤害");
         var _loc3_:Number = (10 + _loc1_ * 2 / 3) * _loc2_;
         var _loc4_:Number = (0.1 + _loc1_ / 300) * _loc2_ * get_monster().get_spe();
         var _loc5_:Number = (_loc3_ + _loc4_) / 2;
         var _loc6_:int = int(Math.round(_loc5_ * 0.8));
         var _loc7_:int = int(Math.round(_loc5_ * 1.2));
         return new DamageRange(_loc6_,_loc7_,Utils.randBetween(_loc6_,_loc7_));
      }
      
      public function mermaidChant() : void
      {
         var _gthis:CombatAbilities = this;
         clearOutput();
         outputText("你闭上眼睛，世界变得安静。深吸一口气，你开始哼唱一首没有歌词的曲调——温柔而富有节奏感。它那优雅、细腻的声音安抚着每一个听到它的人。");
         allMonsters(function():void
         {
            var _loc1_:Number = _gthis.get_monster().get_spe();
            var _loc2_:int = _gthis.mermaidChantLust().combat;
            var _loc3_:Number = _gthis.get_monster().takeLustDamage(_loc2_);
            var _loc4_:int = _gthis.mermaidChantDebuff().combat;
            var _loc5_:ChantedDebuff = _gthis.get_monster().createOrFindStatusEffect(StatusEffects.Chanted);
            _loc5_.applyEffect(_loc4_);
            _loc1_ -= _gthis.get_monster().get_spe();
            _gthis.outputText("[pg-][Themonster]被这首歌迷住了，[monster.his]速度降低了" + int(Math.round(_loc1_)) + "。" + _gthis.get_combat().getLustText(_loc3_));
         });
         get_combat().startMonsterTurn();
      }
      
      public function magicalSpecials() : void
      {
         var newRound:Boolean;
         var _g:Combat;
         var _loc3_:* = null as CombatAbility;
         if(get_combat().get_inCombat() && get_player().hasStatusEffect(StatusEffects.Sealed) && get_player().statusEffectv2(StatusEffects.Sealed) == 6)
         {
            clearOutput();
            outputText("你试图准备一个特殊能力，但却头晕目眩地跌倒了。[b:你使用魔法特殊攻击的能力被封印了，现在你浪费了一次攻击的机会！][pg]");
            get_combat().startMonsterTurn();
            return;
         }
         menu();
         var _loc1_:int = 0;
         var _loc2_:Array = magicAbilities;
         while(_loc1_ < int(_loc2_.length))
         {
            _loc3_ = _loc2_[_loc1_];
            _loc1_++;
            _loc3_.createButton();
         }
         _g = get_combat();
         newRound = false;
         setExitButton("返回",function():void
         {
            _g.combatMenu(newRound);
         });
      }
      
      public function magicMenu() : void
      {
         var newRound:Boolean;
         var _g:Combat;
         var _loc4_:* = null as CombatAbility;
         var _loc5_:* = null as Option;
         var _loc6_:* = null as ButtonData;
         if(get_combat().get_inCombat() && get_player().hasStatusEffect(StatusEffects.Sealed) && get_player().statusEffectv2(StatusEffects.Sealed) == 2)
         {
            clearOutput();
            outputText("你试图使用魔法，但你就是无法集中必要的注意力。[b:你使用魔法的能力被封印了，现在你浪费了一次攻击的机会！][pg]");
            get_combat().startMonsterTurn();
            return;
         }
         menu();
         clearOutput();
         var _loc1_:ButtonDataList = new ButtonDataList();
         outputText("你要使用什么法术？[pg]");
         var _loc2_:int = 0;
         var _loc3_:Array = magicSpells;
         while(_loc2_ < int(_loc3_.length))
         {
            _loc4_ = _loc3_[_loc2_];
            _loc2_++;
            _loc5_ = _loc4_.makeButtonData();
            switch(_loc5_.index)
            {
               case 0:
                  _loc6_ = _loc5_.params[0];
                  _loc1_.push(_loc6_);
                  break;
               case 1:
            }
         }
         _g = get_combat();
         newRound = false;
         _loc1_.submenu(function():void
         {
            _g.combatMenu(newRound);
         });
      }
      
      public function lustserk() : void
      {
         clearOutput();
         outputText("你咆哮着释放出你充满情欲的狂怒，然后向前冲锋，为了摧毁你的敌人而忘记了防御任何性攻击！[pg]");
         get_player().createStatusEffect(StatusEffects.Lustserking,0,0,0,0);
         get_combatRangeData().closeDistance(get_monster());
         get_combat().performAttack(get_combat().calcWeaponDamage());
         get_combat().startMonsterTurn();
      }
      
      public function lustReductionSpell() : void
      {
         clearOutput();
         outputText("你在护身符中聚集能量，并释放出其中包含的法术。一道粉红色的光环笼罩着你，光环一消退，你就感觉没那么饥渴了。");
         var _loc1_:int = int(30 + Utils.rand(get_player().get_inte() / 5) * get_player().spellMod());
         dynStats(DynStat.Lust(-_loc1_));
         outputText(get_combat().getLustText(-_loc1_) + "[pg]");
         get_game().arianScene.clearTalisman();
         get_combat().startMonsterTurn();
      }
      
      public function load(param1:int, param2:*) : void
      {
         Utils.extend(saveContent,param2);
      }
      
      public function lightRailStrike(param1:int = 0) : void
      {
         var numOfStrikes:int;
         var finish1:Boolean;
         var _g2:CombatAbilities;
         var numOfStrikes2:int;
         var finish:Boolean;
         var _g1:CombatAbilities;
         var numOfStrikes1:int;
         var _g:CombatAbilities;
         menu();
         if(Boolean(combatAvoidDamage(new AvoidDamageParameters(null,false,false,null,null,lightRailHitChance(param1),null,null)).attackHit))
         {
            outputText("[pg-]");
            switch(param1)
            {
               case 0:
                  outputText("[say: 为剑而生！]");
                  break;
               case 1:
                  outputText("[say: 为剑而死！]");
                  break;
               case 2:
                  outputText("[say: 当我站起来战斗时，我怨恨的只有我自己！]");
                  break;
               case 3:
                  outputText("[say: 将会有流血事件！]");
                  break;
               case 4:
                  outputText("[say: 唯一剩下的人……]");
                  break;
               case 5:
                  outputText("[say: 将骑在龙背上！]");
                  param1 += 4;
            }
            outputText("[pg-]你再次出击，刀刃像光一样快地划破空气！");
            if(++param1 < 7)
            {
               _g = this;
               numOfStrikes1 = param1;
               addButton(0,"打击！",function():void
               {
                  _g.lightRailStrike(numOfStrikes1);
               }).hint("尝试攻击你的敌人。" + get_combat().fancifyDamageRange(lightRailDamage(true) * (param1 + 1),lightRailDamage(true,true) * (param1 + 1),lightRailHitChance(param1)));
            }
            _g1 = this;
            finish = true;
            numOfStrikes2 = param1;
            addButton(1,"结束了。",function():void
            {
               _g1.lightRailAvenger(finish,numOfStrikes2);
            }).hint("一切都结束了。");
         }
         else
         {
            outputText("[pg-]你再次出击，但没有击中目标！");
            outputText("[pg-]这种耻辱让你无法承受，你伤害了自己作为惩罚！");
            get_player().takeDamage(100 + Utils.rand(100),true);
            _g2 = this;
            finish1 = true;
            numOfStrikes = 0;
            doNext(function():void
            {
               _g2.lightRailAvenger(finish1,numOfStrikes);
            });
         }
      }
      
      public function lightRailHitChance(param1:int = 0) : Number
      {
         if(param1 == 0)
         {
            return 100;
         }
         var _loc2_:Number = 30 - 15 * param1;
         return get_monster().standardDodgeFunc(get_player(),_loc2_);
      }
      
      public function lightRailDamage(param1:Boolean = false, param2:Boolean = false) : Number
      {
         return get_combat().globalMod(10 + (get_player().get_spe() / 3 + (param1 ? 0 : Utils.rand(get_player().get_spe() / 2)) + (param2 ? get_player().get_spe() / 2 : 0)) * get_player().physMod());
      }
      
      public function lightRailAvenger(param1:Boolean = false, param2:int = 0) : void
      {
         var _g:CombatAbilities;
         var _loc3_:int = 0;
         var _loc4_:int = 0;
         var _loc5_:int = 0;
         var _loc6_:int = 0;
         clearOutput();
         if(!param1)
         {
            outputText("你在眨眼间拔出你那把可靠的刀，摆好姿势，将刀刃靠在手指上，伸直手臂。");
            outputText("[pg-][say: 老师，拜托了！]");
            outputText("[pg-]时间本身也停滞了，见证你这毫不费力的完美一击。你准备出击，速度快到任何生物都无法看清。");
            menu();
            _g = this;
            addButton(0,"打击！",function():void
            {
               _g.lightRailStrike();
            }).hint("尝试攻击你的敌人。" + get_combat().fancifyDamageRange(lightRailDamage(true),lightRailDamage(true,true),lightRailHitChance()));
         }
         else
         {
            if(param2 > 0)
            {
               get_player().get_weapon().weaponXP(2 + Utils.rand(7));
               outputText("[say: 结束了。]");
               outputText("[pg-]你在手中旋转着你那把可靠的武士刀，然后慢慢地将其收回鞘中。");
               outputText("[pg-]你在最后一寸时放慢了速度。然后你迅速完成收刀，护手与木鞘碰撞时发出一声清脆的咔哒声。[pg]");
               _loc3_ = 1;
               _loc4_ = param2 + 1;
               while(_loc3_ < _loc4_)
               {
                  _loc5_ = _loc3_++;
                  outputText("[pg-][Themonster]被幽灵般的攻击击中了！");
                  currDamage = get_combat().doDamage(lightRailDamage(),true,true,false);
                  _loc6_ = _loc5_ == 10 ? 100 : 25;
                  if(Utils.randomChance(_loc6_) && get_monster().bleed(get_player(),3,1))
                  {
                     outputText("[pg-]你精准的打击让伤口喷涌出可怕的血柱！");
                  }
               }
            }
            outputText("[pg-][say: 我最大的力量……也是我最大的诅咒。]");
            if(get_player().hasStatusEffect(StatusEffects.TimeFrozen))
            {
               outputText("[pg]但是当你看着你的对手，一动不动地悬在半空中，[monster.his]身体被你的斩击撕裂时，你意识到这不对。这样战斗是不对的。");
               outputText("[pg]你不仅欺骗了自己，也欺骗了剑道。你没有成长。你没有进步。你走了捷径，失去了你的荣誉。你经历了一场空虚的胜利。你没有冒任何风险，却失去了一切。你的存在是不光彩的，因此必须结束它。这是剑的最后一次光荣之举。");
               outputText("[pg]但你甚至没有反抗——你知道你罪有应得。你无法光荣地度过一生，所以你必须光荣地放弃它，这是当刀刃刺穿你黑色的心脏时，你最后的想法。");
               get_player().takeDamage(999999);
               if(get_monster().get_HP() < 1)
               {
                  get_monster().set_HP(1);
               }
            }
            get_combat().startMonsterTurn();
         }
      }
      
      public function leechCalc() : Number
      {
         return 20 * get_player().spellMod() * calcGrayMagicMod() * get_player().spellbladeBonus();
      }
      
      public function kitsuneTerror() : void
      {
         var _loc1_:* = null as Monster;
         clearOutput();
         if(get_player().hasStatusEffect(StatusEffects.ThroatPunch) || get_player().hasStatusEffect(StatusEffects.WebSilence))
         {
            outputText("当你呼吸如此困难时，你无法集中精力去触及敌人的心灵。");
            doNext(magicalSpecials);
            return;
         }
         if(get_monster() is AkbalUnsealed)
         {
            outputText("当你试图扰乱恶魔的心智时，周围的世界扭曲了，却发现这毫无作用。");
            outputText("\n[say: 心智就是我的武器，在我无法说话的时候，我有很多时间来磨练它。]");
            outputText("\n他的话语中回荡着傲慢与自大。");
            get_combat().startMonsterTurn();
            return;
         }
         if(get_monster().get_short() == "pod" || get_monster().get_inte() == 0)
         {
            outputText("你试图触及敌人的心灵，却什么也找不到。你疯狂地四处搜寻，但在这个房间里，并没有你所认知的那种意识存在。[pg]");
            get_player().changeFatigue(1);
            get_combat().startMonsterTurn();
            return;
         }
         outputText("世界变得黑暗，漆黑的阴影笼罩了视线内的一切，你用难以名状的超凡脱俗的恐怖景象填满了[themonster]的脑海。");
         if(kitsuneChanceCalc() > Utils.rand(100))
         {
            outputText("他们在恐惧中畏缩，屈服于你的幻象，相信自己被超越了最疯狂噩梦的恐怖存在所包围。[pg]");
            if(get_monster().statusEffectv2(StatusEffects.Fear) > 0)
            {
               get_monster().addStatusValue(StatusEffects.Fear,2,1);
            }
            else
            {
               get_monster().createStatusEffect(StatusEffects.Fear,0,1,0,0);
            }
            get_monster().addStatusValue(StatusEffects.Fear,1,5);
            _loc1_ = get_monster();
            _loc1_.set_spe(_loc1_.get_spe() - 5);
            if(get_monster().get_spe() < 1)
            {
               get_monster().set_spe(1);
            }
         }
         else
         {
            outputText("黑暗的雾气像涌来时一样迅速退去，他们击退了你的幻象，抵抗了你的催眠影响。");
            if(get_monster().statusEffectv2(StatusEffects.Fear) >= 4)
            {
               outputText("你的敌人现在可能已经产生抗性了。");
            }
            outputText("[pg]");
         }
         get_combat().startMonsterTurn();
      }
      
      public function kitsuneIllusionExec() : void
      {
         var _loc1_:* = null as Monster;
         if(get_monster() is AkbalUnsealed)
         {
            outputText("当你试图扰乱恶魔的心智时，周围的世界扭曲了，却发现这毫无作用。");
            outputText("[pg-][say: 心智就是我的武器，在我无法说话的时候，我有大把的时间来磨砺它。]");
            outputText("[pg-]他的话语中回荡着傲慢与自大。");
            return;
         }
         if(get_monster().get_short() == "pod" || get_monster().get_inte() == 0)
         {
            outputText("在这个狭小的豆荚里，这种攻击毫无用处！[pg-]");
            get_player().changeFatigue(1);
            return;
         }
         outputText("现实屈从于你的意志，你周围的世界开始扭曲变形，[themonster]的心智被你幻象的浓雾所笼罩。");
         if(kitsuneIllusionChance() > Utils.rand(100))
         {
            outputText("[Monster.he]滑稽地踉跄着，无法跟上蒙蔽了[monster.his]感知的变移幻象。[pg-]");
            if(get_monster().statusEffectv1(StatusEffects.Illusion) > 0)
            {
               get_monster().addStatusValue(StatusEffects.Illusion,1,1);
            }
            else
            {
               get_monster().createStatusEffect(StatusEffects.Illusion,1,0,0,0);
            }
            if(get_monster().get_spe() >= 0)
            {
               _loc1_ = get_monster();
               _loc1_.set_spe(_loc1_.get_spe() - (20 - get_monster().statusEffectv1(StatusEffects.Illusion) * 5));
            }
            if(get_monster().lustVuln > 0)
            {
               var _temp_1:* = get_monster();
               _temp_1.lustVuln = _temp_1.lustVuln + 0.1;
            }
            if(get_monster().get_spe() < 1)
            {
               get_monster().set_spe(1);
            }
         }
         else
         {
            outputText("就像橡皮筋弹回一样，当[monster.he]抵抗了你召唤的幻象时，现实又回到了它应有的位置。[pg-]");
         }
      }
      
      public function kitsuneIllusionChance() : Number
      {
         if(get_monster().hasStatusEffect(StatusEffects.Shell) || get_monster().get_short() == "pod" || get_monster().get_inteUnscaled() == 0)
         {
            return 0;
         }
         return standardStatComparison(get_player().get_inte(),get_monster().get_inteRescaled(),int(15 - 10 * get_monster().statusEffectv2(StatusEffects.Illusion)));
      }
      
      public function kitsuneIllusion() : void
      {
         clearOutput();
         if(get_player().hasStatusEffect(StatusEffects.ThroatPunch) || get_player().hasStatusEffect(StatusEffects.WebSilence))
         {
            outputText("你现在呼吸困难，无法集中精力使用这个能力。");
            doNext(magicalSpecials);
            return;
         }
         allMonsters(kitsuneIllusionExec);
         get_combat().startMonsterTurn();
      }
      
      public function kitsuneChanceCalc() : Number
      {
         if(get_monster().hasStatusEffect(StatusEffects.Shell) || get_monster().get_short() == "pod" || get_monster().get_inteUnscaled() == 0)
         {
            return 0;
         }
         return standardStatComparison(get_player().get_inte(),get_monster().get_inteRescaled(),int(-30 - 10 * get_monster().statusEffectv2(StatusEffects.Fear)));
      }
      
      public function kissAttack() : void
      {
         var _loc2_:Number = NaN;
         clearOutput();
         if(get_player().hasStatusEffect(StatusEffects.Blind))
         {
            outputText("在你失明的情况下，你根本不可能找到他们的嘴唇！");
            doNext(physicalSpecials);
            return;
         }
         var _loc1_:Number = Utils.rand(6);
         _loc2_ = _loc1_;
         if(_loc2_ == 1)
         {
            outputText("你跳到[themonster]面前，试图在[monster.his]身上印下一个吻。");
         }
         else if(_loc2_ == 2)
         {
            outputText("你漫步上前，突然向前冲去，撅起你金色的嘴唇，准备献上一个完美的吻。");
         }
         else if(_loc2_ == 3)
         {
            outputText("你性感地摇曳着身姿，扭动着靠近[themonster]，试图在[monster.him]身上印下一个湿漉漉的吻。");
         }
         else if(_loc2_ == 4)
         {
            outputText("你向前猛扑，在半空中飞向[themonster]，撅起嘴唇，准备把春药涂满[monster.him]全身。");
         }
         else if(_loc2_ == 5)
         {
            outputText("你俯下身，嘴唇因欲望而肿胀，沾满了你渴望的口水，逐渐逼近[themonster]。");
         }
         else
         {
            outputText("你撅起涂满春药的嘴唇，靠近[themonster]，试图在[monster.him]身上印下一个湿漉漉的吻。");
         }
         if(Boolean(combatAvoidDamage(new AvoidDamageParameters(null,false,false,null,null,null,null,null)).attackFailed))
         {
            _loc1_ = Utils.rand(3);
            _loc2_ = _loc1_;
            if(_loc2_ == 1)
            {
               if(get_monster().get_plural())
               {
                  outputText("[Themonster]预见到了你的动作，在千钧一发之际躲开了！[pg]");
               }
            }
            else if(_loc2_ == 2)
            {
               if(get_monster().get_plural())
               {
                  outputText("不幸的是，你太慢了，还没等你把湿吻印在他们其中一个身上，[themonster]就滑开了。[pg]");
               }
               else
               {
                  outputText("不幸的是，你太慢了，还没等你把湿吻印在[monster.him]身上，[themonster]就滑开了。[pg]");
               }
            }
            else if(get_monster().get_plural())
            {
               outputText("遗憾的是，[themonster]闪到了一边，让你失去了亲吻他们其中一个的机会。[pg]");
            }
            else
            {
               outputText("遗憾的是，[themonster]闪到了一边，让你失去了亲吻[monster.him]的机会。[pg]");
            }
            get_combat().startMonsterTurn();
            return;
         }
         if(get_monster().lustVuln <= 0 || !get_monster().hasCock())
         {
            if(get_monster().get_plural())
            {
               outputText("嘴唇贴着嘴唇，你伸出舌头品尝他们其中一人的唾液，确保给他们灌下了一大剂春药。退后一步，你看着[themonster]，立刻后悔把时间浪费在这个吻上。它没有任何效果！[pg]");
            }
            else
            {
               outputText("嘴唇贴着嘴唇，你伸出舌头品尝[monster.his]的唾液，确保给他们灌下了一大剂春药。退后一步，你看着[themonster]，立刻后悔把时间浪费在这个吻上。它没有任何效果！[pg]");
            }
            get_combat().startMonsterTurn();
            return;
         }
         _loc1_ = Utils.rand(4);
         _loc2_ = 0;
         var _loc3_:Number = _loc1_;
         if(_loc3_ == 1)
         {
            if(get_monster().get_plural())
            {
               outputText("成功了！一个沾满口水的吻准确地落在了他们其中一人的嘴上。受害者很快融化在你的拥抱中，任由你给他们灌下一大剂黏糊糊的口服春药。");
            }
            else
            {
               outputText("成功了！一个沾满口水的吻准确地落在了[themonster]的嘴上。" + get_monster().mf("他","她") + "很快融化在你的拥抱中，任由你给他们灌下一大剂黏糊糊的口服春药。");
            }
            _loc2_ = 15;
         }
         else if(_loc3_ == 2)
         {
            if(get_monster().get_plural())
            {
               outputText("镀金的嘴唇压在他们其中一人的嘴上，受害者的嘴唇与你的融合在一起。你慢条斯理地对待这个突然变得配合的俘虏，在放走他们之前，确保用你的口红覆盖他们嘴巴的每一个角落。");
            }
            else
            {
               outputText("镀金的嘴唇压在[themonster]身上，[monster.his]嘴唇与你的融合在一起。你慢条斯理地对待这个突然变得配合的俘虏，在放走[monster.him]之前，确保用你的口红覆盖[monster.his]每一寸肌肤。");
            }
            _loc2_ = 20;
         }
         else if(_loc3_ == 3)
         {
            if(get_monster().get_plural())
            {
               outputText("你滑过[themonster]的防守，把嘴唇贴在他们其中一人身上。" + get_monster().mf("他","她") + "融化在你身上，" + get_monster().mf("他的","她的") + "舌头滑进你的嘴里，因为" + get_monster().mf("他","她") + "很快就屈服于这个火热的、让肉棒肿胀的吻。这个吻持续了很长一段时间。一旦你确定你已经给" + get_monster().mf("他的","她的") + "嘴里灌满了春药，你退后一步，观察你的杰作。[themonster]中的一个仍然站在那里，舔着" + get_monster().mf("他的","她的") + "嘴唇，而" + get_monster().mf("他的","她的") + "肉棒挺立着，坚硬如铁。你觉得有点大胆，又在肿胀的肉棒上啄了一下，把龟头涂成金色。现在" + get_monster().mf("他","她") + "绝对不可能软下去了。虽然你没有给其他人下药，但他们可能因为这场表演而有点“兴奋”了。");
            }
            else
            {
               outputText("你滑过[themonster]的防守，把嘴唇贴在[monster.his]身上。" + get_monster().mf("他","她") + "融化在你身上，[monster.his]舌头滑进你的嘴里，因为[monster.he]很快就屈服于这个火热的、让肉棒肿胀的吻。这个吻持续了很长一段时间。一旦你确定你已经给[monster.his]嘴里灌满了春药，你退后一步，观察你的杰作。[Themonster]仍然站在那里，舔着[monster.his]嘴唇，而[monster.his]肉棒挺立着，坚硬如铁。你觉得有点大胆，又在肿胀的肉棒上啄了一下，把龟头涂成金色。现在[monster.he]绝对不可能软下去了。");
            }
            _loc2_ = 30;
         }
         else
         {
            outputText("你费了很大的劲，从一个空隙中滑过，把他们的嘴唇压在你的嘴唇上，欲望伴随着一大剂春药通过口唇的拥抱渗透进去。");
            _loc2_ = 12;
         }
         if(!get_monster().hasStatusEffect(StatusEffects.LustStick))
         {
            get_monster().createStatusEffect(StatusEffects.LustStick,0,0,0,0);
         }
         else
         {
            get_monster().addStatusValue(StatusEffects.LustStick,2,Math.round(_loc2_ / 10));
         }
         get_monster().teased(get_monster().lustVuln * _loc2_);
         outputText("[pg]");
         get_combat().startMonsterTurn();
      }
      
      public function kickCalc(param1:Boolean = false, param2:Boolean = false) : Number
      {
         var _loc3_:Number = get_player().get_str();
         if(get_player().lowerBody.type == 1 || get_player().lowerBody.type == 11 || get_player().lowerBody.type == 21)
         {
            _loc3_ += 30;
         }
         else if(get_player().lowerBody.type == 12)
         {
            _loc3_ += 20;
         }
         else if(get_player().lowerBody.type == 14)
         {
            _loc3_ += 35;
         }
         if(get_player().isTaur())
         {
            _loc3_ += 10;
         }
         _loc3_ *= get_player().physMod();
         _loc3_ = get_combat().bodyMod(_loc3_);
         _loc3_ = get_combat().globalMod(_loc3_);
         if(param1)
         {
            return get_monster().reduceDamageMin(_loc3_);
         }
         if(param2)
         {
            return get_monster().reduceDamageMax(_loc3_);
         }
         return get_monster().reduceDamageCombat(_loc3_);
      }
      
      public function kick() : void
      {
         var _loc1_:* = null as Monster;
         clearOutput();
         get_combat().damageType = "PhysicalM";
         if(get_player().lowerBody.type == 14)
         {
            if(get_player().tail.type == 12)
            {
               outputText("你用灵活的袋鼠尾巴保持平衡，将双腿抬起，然后同时向前猛踢。");
            }
            else
            {
               outputText("你单腿站立，翘起你强壮的、像袋鼠一样的腿，然后向前猛踢。");
            }
         }
         else if(get_player().lowerBody.type == 12)
         {
            outputText("你直接跳到半空中，同时用你长满毛的双脚猛烈地踢出。");
         }
         else if(get_player().lowerBody.type == 1 || get_player().lowerBody.type == 11 || get_player().lowerBody.type == 21)
         {
            if(get_player().isTaur())
            {
               outputText("你用后腿站立，在猛烈踢出前的一瞬间将前腿抬离地面。");
            }
            else
            {
               outputText("你扭动身体，抬起一条腿，用蹄子向前猛踢。");
            }
         }
         if(get_game().ceraphScene.hasPacifism())
         {
            outputText("你试图攻击，但在最后一刻你的身体扭开了，让你甚至无法接近目标！塞拉芙的穿环让普通攻击变得不可能！也许你可以尝试点别的？[pg]");
            get_combat().startMonsterTurn();
            return;
         }
         if(get_player().hasStatusEffect(StatusEffects.Blind))
         {
            outputText("你试图攻击，但你现在瞎了眼，你怀疑自己不会有太好的运气！");
         }
         if(get_monster().get_short() == "worms")
         {
            if(Utils.rand(100) + get_player().get_inte() / 3 >= 50)
            {
               currDamage = int(get_player().get_str() / 5 - Utils.rand(5));
               if(currDamage == 0)
               {
                  currDamage = 1;
               }
               outputText("你攻击了那个混合体，将无数的蠕虫碾成肉泥，造成了 " + currDamage + " 点伤害。[pg]");
               _loc1_ = get_monster();
               _loc1_.set_HP(_loc1_.get_HP() - currDamage);
               if(get_combat().totalHP() <= 0)
               {
                  doNext(get_combat().endHpVictory);
                  return;
               }
            }
            else
            {
               outputText("你试图用你的反击碾碎蠕虫，但这个集合体移动了它的个体成员，在撞击点创造了一个空隙，让你只攻击到了空气。[pg]");
            }
            get_combat().startMonsterTurn();
            return;
         }
         if(Boolean(combatAvoidDamage(new AvoidDamageParameters(true,false,false,null,null,null,null,null)).attackFailed))
         {
            if(get_monster().get_short() == "Akbal")
            {
               outputText("阿克巴尔动如闪电，以符合他美洲豹身体的速度和优雅在你的猛烈攻击中穿梭。\n");
            }
            else
            {
               outputText("[Themonster]设法");
               if(!get_monster().get_plural())
               {
                  outputText("");
               }
               outputText("躲开了你的踢击！");
               outputText("[pg]");
            }
            get_combat().startMonsterTurn();
            return;
         }
         currDamage = kickCalc();
         if(currDamage <= 0)
         {
            currDamage = 0;
            outputText("[Themonster]");
            if(get_monster().get_plural())
            {
               outputText("\'");
            }
            else
            {
               outputText("");
            }
            outputText("防御太强了，你的踢击无法穿透！");
         }
         else
         {
            outputText("[Themonster]");
            if(!get_monster().get_plural())
            {
               outputText("因破坏性的冲击而踉跄！");
            }
            else
            {
               outputText("因破坏性的冲击而踉跄！");
            }
         }
         if(currDamage > 0)
         {
            if(get_monster().get_short() == "anemone")
            {
               outputText("\n虽然你成功击中了海葵，但当你的挥击擦过她身体周围的几根触手时，它们释放出了毒液。");
               get_monster().applyVenom(1 + Utils.rand(2));
            }
         }
         currDamage = get_combat().doDamage(currDamage,true,true);
         outputText("[pg]");
         get_combat().startMonsterTurn();
      }
      
      public function isExhausted(param1:int) : Boolean
      {
         if(!get_player().hasPerk(PerkLib.BloodMage) && get_player().get_fatigue() + get_player().spellCost(param1) > get_player().maxFatigue())
         {
            outputText("你太累了，无法施展这个法术。");
            doNext(magicMenu);
            return true;
         }
         return false;
      }
      
      public function ironflesh() : void
      {
         outputText("sdfs");
         get_player().createStatusEffect(StatusEffects.Ironflesh,get_player().damagePercent(true) * 0.75,0,0,0);
         get_combat().startMonsterTurn();
      }
      
      public function infernoDisplay() : void
      {
         if(get_player().hasPerk(PerkLib.RagingInferno))
         {
            if(get_combat().combatRound - fireMagicLastTurn == 1)
            {
               outputText("[pg-]你之前使用的火魔法痕迹依然存在，你利用它们来强化你的法术！");
            }
            else if(fireMagicLastTurn > 0)
            {
               outputText("[pg-]不幸的是，你之前的火魔法痕迹太弱了，无法使用。");
            }
         }
      }
      
      public function immolationSpell() : void
      {
         clearOutput();
         get_combat().damageType = "MagicalR";
         outputText("你在护身符中聚集能量，并释放出其中包含的法术。一波燃烧的火焰聚集在[themonster]周围，慢慢地燃烧着[monster.him]。");
         currDamage = immolationDamageCalc();
         if(get_monster() is VolcanicGolem)
         {
            outputText("[pg-]魔像似乎并不在意这些火焰。");
            get_combat().startMonsterTurn();
            return;
         }
         if(get_monster() is ArchInquisitorVilkus && currDamage > 300 && get_monster().nextAction == 1)
         {
            outputText("[b:你的法术压制了审判官的法术]，其魔法能量被你的法术吸收，形成了一次极其有效的攻击！");
            get_monster().nextAction = 0;
            currDamage += Utils.rand(200);
         }
         doFireDamage(currDamage);
         get_monster().createStatusEffect(StatusEffects.OnFire,2 + Utils.rand(get_player().get_inte() / 25),0,0,0);
         get_game().arianScene.clearTalisman();
         get_combat().startMonsterTurn();
      }
      
      public function immolationDamageCalc(param1:Boolean = false, param2:Boolean = false) : Number
      {
         var _loc3_:Number = int(75 + (get_player().get_inte() / 2 + (param1 ? 0 : Utils.rand(get_player().get_inte())) + (param2 ? get_player().get_inte() : 0)) * get_player().spellMod());
         _loc3_ = calcInfernoMod(_loc3_);
         if(get_monster() is VolcanicGolem)
         {
            _loc3_ *= 0.2;
         }
         return get_combat().globalMod(_loc3_);
      }
      
      public function hellFire() : void
      {
         clearOutput();
         get_combat().damageType = "MagicalR";
         currDamage = firebreathCalc();
         if(get_monster() is LivingStatue)
         {
            outputText("火焰无害地掠过这头石头巨兽的皮肤，只在雕像表面留下更加光滑的痕迹。");
            get_combat().startMonsterTurn();
            return;
         }
         if(get_monster() is AkbalUnsealed)
         {
            outputText("你深吸一口气，从体内深处释放出一波堕落的红色火焰。阿克巴尔则以他的地狱之火作为回应，将你的猩红火焰完全吞没。");
            outputText("[pg-]阿克巴尔轻笑一声，[say: 你用这种比我低级的领主的火焰来侮辱我。]");
            get_combat().startMonsterTurn();
            return;
         }
         if(!get_player().hasStatusEffect(StatusEffects.GooArmorSilence))
         {
            outputText("你深吸一口气，从体内深处释放出一波堕落的红色火焰。");
         }
         if(get_player().hasStatusEffect(StatusEffects.WebSilence))
         {
            outputText("[b:火焰烧穿了封住你嘴巴的蛛网！]");
            get_player().removeStatusEffect(StatusEffects.WebSilence);
         }
         if(get_player().hasStatusEffect(StatusEffects.GooArmorSilence))
         {
            outputText("当你积蓄火焰时，一声低吼从你体内深处传出，你将火焰从胸腔逼出，注入黏液中。黏液在蒸发时冒出气泡并散发出蒸汽，这引起了你敌人的好奇，她停下了攻击，凑近观看。当嘴巴周围的紧绷感减轻，你的对手越来越忘乎所以时，你等待着时机。当你终于能活动下巴张开嘴时，你喷出了绝大部分的火焰，吹起了一个由火焰和蒸发的黏液组成的巨大气泡，气泡变薄并最终破裂，释放出一团超高温的云雾。那个穿戴盔甲的女孩被云雾吞没，尖叫着退缩，挥舞着她的手臂。");
            get_player().removeStatusEffect(StatusEffects.GooArmorSilence);
         }
         if(get_monster().get_short() == "Isabella" && !get_monster().hasStatusEffect(StatusEffects.Stunned))
         {
            outputText("伊莎贝拉用肩膀顶起盾牌，挡在猩红火焰的路径上。火焰在钢铁之墙上爆裂，绕过这不可穿透的障碍物，无害地向两侧散去。[pg]");
            if(get_game().isabellaFollowerScene.isabellaAccent())
            {
               outputText("[say: 你就这点本事吗？想打败伊莎贝拉，光靠花哨的魔术可不够！] 牛娘嘲讽道。[pg]");
            }
            else
            {
               outputText("[say: 你就这点本事吗？想打败伊莎贝拉，光靠花哨的魔术可不够！] 牛娘嘲讽道。[pg]");
            }
            get_combat().startMonsterTurn();
            return;
         }
         if(get_monster().get_short() == "Vala" && !get_monster().hasStatusEffect(StatusEffects.Stunned))
         {
            outputText("瓦拉以惊人的力量拍打翅膀，将火球吹回给你！");
            if(get_player().getEvasionChance() > Utils.rand(100))
            {
               outputText("你猛地扑向一旁，躲开了它！");
            }
            else
            {
               currDamage /= 6;
               outputText("你自己的火焰拍在你的脸上，让你欲火焚身！");
               dynStats(DynStat.Lust(currDamage));
            }
         }
         else if(get_monster().get_inte() < 10)
         {
            outputText("你的敌人发出一声尖叫，他们的身躯被炽热的火焰吞噬。");
            doFireDamage(currDamage);
         }
         else if(get_monster().lustVuln > 0)
         {
            outputText("你的敌人惊讶地大叫，随后发出一声性感的呻吟，你激情的火焰包围了他们，让他们的身体充满了异常的欲望。");
            doFireDamage(currDamage);
            get_monster().teased(get_monster().lustVuln * currDamage / 6);
         }
         else
         {
            outputText("堕落之火似乎对[themonster]没有效果！");
         }
         get_combat().startMonsterTurn();
      }
      
      public function healingSpell() : void
      {
         clearOutput();
         outputText("你在护身符中聚集能量，并释放出其中包含的法术。一道绿色的光环笼罩着你，你的伤口开始迅速愈合。当光环完全消退时，你感觉好多了。");
         var _loc1_:int = int((get_player().level * 5 + get_player().get_inte() / 1.5 + Utils.rand(get_player().get_inte())) * get_player().spellMod() * 1.5);
         get_player().HPChange(_loc1_,true);
         get_game().arianScene.clearTalisman();
         get_combat().startMonsterTurn();
      }
      
      public function healCalc(param1:Boolean = false, param2:Boolean = false) : Number
      {
         int((get_player().level + get_player().get_inte() / 1.5 + Utils.rand(get_player().get_inte())) * get_player().spellMod());
         if(param1)
         {
            if(param2)
            {
               return int((get_player().level + get_player().get_inte() / 1.5 + get_player().get_inte()) * get_player().spellMod());
            }
            return int((get_player().level + get_player().get_inte() / 1.5) * get_player().spellMod());
         }
         return int((get_player().level + get_player().get_inte() / 1.5 + Utils.rand(get_player().get_inte())) * get_player().spellMod());
      }
      
      public function grandThrustDamage(param1:Boolean = false, param2:Boolean = false) : Number
      {
         var _loc3_:Number = 1.3 * get_combat().calcWeaponDamage(false);
         if(param1)
         {
            return get_monster().reduceDamageMin(_loc3_,100,true);
         }
         if(param2)
         {
            return get_monster().reduceDamageMax(_loc3_,100,true);
         }
         return get_monster().reduceDamageCombat(_loc3_,100,true);
      }
      
      public function grandThrustChance() : Number
      {
         return get_monster().standardDodgeFunc(get_player(),15);
      }
      
      public function grandThrust() : void
      {
         outputText("你向后跳去，在落地前将[weapon]在手臂上旋转，你的身体准备好向前冲刺，长矛的尖端完美地指向[themonster]。\n你眯起眼睛，以惊人的力量和速度向你的敌人冲去！");
         if(Boolean(combatAvoidDamage(new AvoidDamageParameters(true,false,false,null,null,grandThrustChance(),null,null)).attackFailed))
         {
            outputText("[pg][Themonster]已经准备好了，[monster.he]及时扭动身体躲开了，挫败了你凶猛的攻击！");
            get_player().get_weapon().weaponXP(10 + Utils.rand(11));
         }
         else
         {
            outputText("[pg]你的攻击成功了，你的[weapon]残忍而迅速地刺穿了[themonster]的任何防御，造成了严重的伤口。你迅速收回武器并再次准备好！");
            get_combat().doDamage(grandThrustDamage(),true,true,true,true);
         }
         get_player().get_weapon().weaponXP(10 + Utils.rand(11));
         get_combat().startMonsterTurn();
      }
      
      public function grabChance() : int
      {
         if(get_monster().hasPerk(PerkLib.Juggernaut))
         {
            return 0;
         }
         var _loc1_:int = -30;
         return standardStatComparison(get_player().get_spe(),get_monster().get_speRescaled(),_loc1_);
      }
      
      public function goreChance() : Number
      {
         var _loc1_:int = -50;
         if(get_player().horns.value >= 12)
         {
            _loc1_ += 15;
         }
         if(get_player().horns.value >= 20)
         {
            _loc1_ += 15;
         }
         _loc1_ += Utils.boundInt(-20,int(40 * get_player().get_spe() / get_monster().get_speRescaled() - 40),20);
         if(get_player().hasPerk(PerkLib.NaturalWeapons))
         {
            _loc1_ += 20;
         }
         return standardDodge(_loc1_);
      }
      
      public function goreCalc(param1:Boolean = false, param2:Boolean = false) : Number
      {
         var _loc3_:Number = get_player().horns.value;
         if(get_player().horns.value > 40)
         {
            get_player().horns.value = 40;
         }
         var _loc4_:Number = 1 + (get_player().get_tallness() - 77) / 43;
         var _loc5_:Number = 0.5 + get_player().thickness / 100;
         var _loc6_:Number = int((get_player().get_str() + _loc3_ * 2) * _loc4_ * _loc5_);
         if(get_player().get_inRut() && get_monster().cockTotal() > 0)
         {
            _loc6_ += 5;
         }
         _loc6_ += get_player().level * 2;
         if(_loc6_ < 0)
         {
            _loc6_ = 5;
         }
         if(_loc6_ > get_player().level * 10 + 100)
         {
            _loc6_ = get_player().level * 10 + 100;
         }
         if(_loc6_ > 0)
         {
            _loc6_ *= get_player().physMod();
            _loc6_ = get_combat().bodyMod(_loc6_);
            _loc6_ = get_combat().globalMod(_loc6_);
         }
         if(param1)
         {
            return get_monster().reduceDamageMin(_loc6_);
         }
         if(param2)
         {
            return get_monster().reduceDamageMax(_loc6_);
         }
         return get_monster().reduceDamageCombat(_loc6_);
      }
      
      public function goreAttack() : void
      {
         clearOutput();
         if(get_monster().get_short() == "worms")
         {
            outputText("利用你新获得的天然武器，你迅速向这个畸形的怪物冲去。感觉到迫在眉睫的危险，这怪物主动散开了身体，导致这团蠕虫伴随着令人作呕的湿润“砰”声落到地上，让你的角只刺中了空气。[pg]");
            get_combat().startMonsterTurn();
            return;
         }
         get_combat().damageType = "PhysicalM";
         if(goreChance() > Utils.rand(100))
         {
            currDamage = goreCalc();
            if(Utils.rand(4) > 0)
            {
               outputText("你低下头冲锋，用你的一根牛角刺穿了[themonster]！");
            }
            else
            {
               currDamage *= 2;
               outputText("你低下头冲锋，撞向[themonster]并将你的两根角都埋入了[monster.him]的身体！[b:暴击！]");
            }
            if(get_player().get_inRut() && get_monster().cockTotal() > 0)
            {
               outputText("发情的狂怒赋予了你力量，增加了伤害！");
            }
            if(currDamage < 20)
            {
               outputText("你把自己拔了出来。");
            }
            if(currDamage >= 20 && currDamage < 40)
            {
               outputText("你挣扎着想把角拔出来。");
            }
            if(currDamage >= 40)
            {
               outputText("你费了九牛二虎之力才把角拔出来。");
            }
            currDamage = get_combat().doDamage(currDamage,true,true);
         }
         else if(get_monster().get_short() == "Vala")
         {
            outputText("你低下头向瓦拉冲去，但她只是飞得更高，在你靠近时抓住了你的角，并将她多汁、芳香的小穴蹭在你的鼻子上。那感官上的气味和她兴奋的呻吟让你愣了一下，让她得以继续把你当作自慰辅助工具，但她很快就厌倦了这样的前戏，眨了眨眼飞了回去。[pg]");
            dynStats(DynStat.Lust(5));
         }
         else
         {
            outputText("你低下头向[themonster]冲去，却在最后一刻被躲开了！");
         }
         outputText("[pg]");
         get_combat().startMonsterTurn();
      }
      
      public function getWhiteMagicLustCap() : Number
      {
         var _loc1_:Number = get_player().maxLust() * 0.75;
         if(get_player().hasPerk(PerkLib.Enlightened) && get_player().isPureEnough(10))
         {
            _loc1_ += get_player().maxLust() * 0.1;
         }
         if(get_player().hasPerk(PerkLib.FocusedMind))
         {
            _loc1_ += get_player().maxLust() * 0.1;
         }
         return _loc1_;
      }
      
      public function getUseCount(param1:String) : int
      {
         var _loc2_:Object = Reflect.field(saveContent.abilityUsage,param1);
         if(_loc2_ != null)
         {
            return _loc2_;
         }
         return 0;
      }
      
      public function getInfernoCount() : int
      {
         var _loc2_:int = 0;
         var _loc1_:int = 0;
         if(get_player().hasPerk(PerkLib.RagingInferno))
         {
            _loc2_ = get_combat().combatRound - fireMagicLastTurn;
            if(_loc2_ <= 1)
            {
               _loc1_ = fireMagicCumulated;
            }
         }
         return _loc1_;
      }
      
      public function getAbilityByID(param1:String) : CombatAbility
      {
         var _loc4_:* = null as CombatAbility;
         var _loc2_:int = 0;
         var _loc3_:Array = allAbilities;
         while(_loc2_ < int(_loc3_.length))
         {
            _loc4_ = _loc3_[_loc2_];
            _loc2_++;
            if(_loc4_.ID == param1)
            {
               return _loc4_;
            }
         }
         return null;
      }
      
      public function freezeTime() : void
      {
         outputText("你拨动盾牌上隐藏的控制杆，经过短暂的蓄力，周围的世界伴随着一声[i: clack]戛然而止。你只能听到内部发条装置发出微弱的滴答声，提醒着你在这个状态下的时间所剩无几。[pg]");
         get_player().createStatusEffect(StatusEffects.TimeFrozen,3);
         get_shields().CLKSHLD.saveContent.used = true;
         get_combat().startMonsterTurn();
      }
      
      public function foxFireCalc(param1:Boolean = false, param2:Boolean = false, param3:Boolean = false) : Number
      {
         var _loc6_:Boolean = false;
         var _loc7_:Boolean = false;
         var _loc8_:Boolean = false;
         var _loc9_:Number = NaN;
         var _loc4_:int = int(10 + (get_player().get_inte() / 3 + (param1 ? 0 : Utils.rand(get_player().get_inte() / 2)) + (param2 ? get_player().get_inte() / 2 : 0)) * get_player().spellMod());
         _loc4_ = calcInfernoMod(_loc4_);
         _loc4_ = int(get_combat().globalMod(_loc4_));
         var _loc5_:Number = get_monster().cor;
         if(_loc5_ <= 10 == true)
         {
            _loc9_ = 0.66;
         }
         else
         {
            _loc8_ = _loc5_ <= 25;
            if(_loc8_ == true)
            {
               _loc9_ = 0.8;
            }
            else
            {
               _loc7_ = _loc5_ <= 50;
               if(_loc7_ == true)
               {
                  _loc9_ = 1;
               }
               else
               {
                  _loc6_ = _loc5_ <= 66;
                  _loc9_ = _loc6_ == true ? 1.2 : 1.3;
               }
            }
         }
         _loc4_ = int(Math.round(_loc4_ * _loc9_));
         _loc4_ = int(Math.round(_loc4_ * get_monster().get_fireRes()));
         if(param3)
         {
            return _loc4_ * get_monster().get_lust() / get_monster().maxLust() * 0.6;
         }
         return _loc4_;
      }
      
      public function foxFire() : void
      {
         clearOutput();
         if(get_player().hasStatusEffect(StatusEffects.ThroatPunch) || get_player().hasStatusEffect(StatusEffects.WebSilence))
         {
            outputText("你现在呼吸困难，无法集中精力使用这个能力。");
            doNext(magicalSpecials);
            return;
         }
         get_combat().damageType = "MagicalR";
         outputText("你伸出手掌，召唤出空灵的蓝色火焰，在你的指尖跳跃。你猛烈地将它掷向[themonster]，它在撞击时爆发，将耀眼的蔚蓝色火花洒向四周。");
         currDamage = foxFireCalc();
         doFireDamage(currDamage);
         if(get_monster().get_lust() >= 1)
         {
            outputText("[pg-]法术对你目标的欲望产生了反应，让你精神焕发！");
            get_player().HPChange(Math.round(currDamage * get_monster().get_lust() / get_monster().maxLust() * 0.6),true);
         }
         statScreenRefresh();
         get_combat().startMonsterTurn();
      }
      
      public function fistFuriously() : void
      {
         var _loc3_:* = null as CombatAbility;
         menu();
         var _loc1_:int = 0;
         var _loc2_:Array = unarmedStances;
         while(_loc1_ < int(_loc2_.length))
         {
            _loc3_ = _loc2_[_loc1_];
            _loc1_++;
            _loc3_.createButton();
         }
         setExitButton("返回",physicalSpecials);
      }
      
      public function firebreathCalc(param1:Boolean = false, param2:Boolean = false, param3:Boolean = false) : Number
      {
         var _loc4_:Number = get_player().level * 8 + (param1 ? 0 : Utils.rand(10)) + (param2 ? 10 : 0) + get_player().get_inte() / 2 + get_player().cor / 5;
         _loc4_ = calcInfernoMod(_loc4_);
         if(get_monster() is LivingStatue)
         {
            _loc4_ *= 0;
         }
         if(get_player().hasStatusEffect(StatusEffects.GooArmorSilence))
         {
            _loc4_ += 25;
         }
         if(param3)
         {
            return _loc4_ * get_monster().lustVuln / 6;
         }
         return get_combat().globalMod(_loc4_);
      }
      
      public function fireballuuuuu() : void
      {
         clearOutput();
         get_combat().damageType = "PhysicalR";
         if(Boolean(combatAvoidDamage(new AvoidDamageParameters(null,false,false,null,null,fireballChance(),null,null)).attackFailed))
         {
            if(get_player().hasStatusEffect(StatusEffects.WebSilence))
            {
               outputText("你试图引导地狱之火，但当你准备释放出火焰洪流时，它却在你的喉咙里倒流，被封住你嘴巴的蛛网挡住了。突然爆发的炽热力量在你自己的喉咙里炸开，让你痛呼出声。");
            }
            else if(get_player().hasStatusEffect(StatusEffects.GooArmorSilence))
            {
               outputText("你试图引导地狱之火，但当你准备释放洪流时，它却提前爆发了，突然爆发的炽热力量在你自己的喉咙里炸开，让你痛呼出声。覆盖在你嘴上的黏液冒出气泡并破裂，在逃逸的火焰撕开的小裂口处沸腾蒸发。虽然效果没有你希望的那么好，但你至少现在可以说话了。");
               get_player().removeStatusEffect(StatusEffects.GooArmorSilence);
            }
            else
            {
               outputText("你试图引导地狱之火，但当你准备释放出火焰洪流时，体内的火焰却提前爆发了，突然爆发的炽热力量在你自己的喉咙里炸开，让你痛呼出声。");
            }
            get_player().changeFatigue(10);
            get_player().takeDamage(10 + Utils.rand(20),true);
            outputText("[pg]");
            get_combat().startMonsterTurn();
            return;
         }
         currDamage = fireballCalc();
         if(get_monster() is AkbalUnsealed)
         {
            outputText("你从胸腔深处召唤出火焰，将它们释放到大恶魔身上。他没有做出任何躲闪的努力，而是敞开胸膛承受了火焰的冲击。");
            outputText("[pg-][say: 你忘了是谁教你这招的吗？你不能用我自己的火焰杀死我，[name]。]");
            get_combat().startMonsterTurn();
            return;
         }
         if(get_monster() is LivingStatue)
         {
            outputText("火焰无害地掠过石质皮肤，只在雕像表面留下更加光滑的痕迹。");
            get_combat().startMonsterTurn();
            return;
         }
         if(get_monster() is VolcanicGolem)
         {
            outputText("[pg]魔像似乎并不在意这些火焰。[pg]");
            get_combat().startMonsterTurn();
            return;
         }
         if(get_monster() is Doppelganger)
         {
            get_monster().handleSpellResistance("fireball");
            return;
         }
         if(get_player().hasStatusEffect(StatusEffects.GooArmorSilence))
         {
            outputText("[b:当你积蓄地狱之火时，一声低吼从你体内深处传出，你将火焰从胸腔逼出，注入黏液中。黏液在蒸发时冒出气泡并散发出蒸汽，这引起了你敌人的好奇，她停下了攻击，凑近观看。当嘴巴周围的紧绷感减轻，你的对手越来越忘乎所以时，你等待着时机。当你终于能活动下巴张开嘴时，你喷出了绝大部分的火焰，吹起了一个由火焰和蒸发的黏液组成的巨大气泡，气泡变薄并最终破裂，释放出一团超高温的云雾。那个穿戴盔甲的女孩被云雾吞没，尖叫着退缩，挥舞着她的手臂。]");
            get_player().removeStatusEffect(StatusEffects.GooArmorSilence);
         }
         else
         {
            outputText("当你积蓄地狱之火时，一声低吼从你的胸腔深处传出。当你再也无法忍受时，你发出一声震耳欲聋的咆哮，向你的敌人投掷出一团巨大的绿色烈焰。");
         }
         if(get_monster().get_short() == "Isabella" && !get_monster().hasStatusEffect(StatusEffects.Stunned))
         {
            outputText("伊莎贝拉用肩膀顶起盾牌，挡在翠绿火焰的路径上。火焰在钢铁之墙上爆裂，绕过这不可穿透的障碍物，无害地向两侧散去。[pg]");
            if(get_game().isabellaFollowerScene.isabellaAccent())
            {
               outputText("[say: 这就是你的全部本事吗？想打败伊莎贝拉，光靠花哨的魔术可不够！]牛娘嘲讽道。");
            }
            else
            {
               outputText("[say: 这就是你的全部本事吗？想打败伊莎贝拉，光靠花哨的魔术可不够！]牛娘嘲讽道。");
            }
            get_combat().startMonsterTurn();
            return;
         }
         if(get_monster().get_short() == "Vala" && !get_monster().hasStatusEffect(StatusEffects.Stunned))
         {
            outputText("瓦拉以惊人的力量拍打翅膀，将火球吹回给你！");
            if(get_player().hasPerk(PerkLib.Evade) && Utils.rand(2) == 0)
            {
               outputText("你猛地扑向一旁，躲开了它！");
            }
            else if(get_player().hasPerk(PerkLib.Flexibility) && Utils.rand(4) == 0)
            {
               outputText("你利用自己的柔韧性，勉强将身体折叠起来躲开了！");
            }
            else if(get_combat().combatBlock(get_player(),get_player(),true))
            {
               outputText("你成功用你的[shield]挡住了你自己的火焰！");
            }
            else
            {
               outputText("你自己的火焰拍在了你的脸上！");
               get_player().takeDamage(currDamage,true);
            }
         }
         else
         {
            if(get_monster().hasStatusEffect(StatusEffects.Sandstorm))
            {
               outputText("[b:你的吐息被旋转的漩涡大幅度消散，导致其命中时的威力大减！]");
            }
            doFireDamage(currDamage);
         }
         get_combat().startMonsterTurn();
      }
      
      public function fireballChance() : Number
      {
         if(get_player().hasStatusEffect(StatusEffects.WebSilence))
         {
            return 0;
         }
         return standardDodge(-15);
      }
      
      public function fireballCalc(param1:Boolean = false, param2:Boolean = false) : Number
      {
         var _loc3_:Number = int(get_player().level * 10 + 45 + (param1 ? 0 : Utils.rand(10)) + (param2 ? 10 : 0));
         _loc3_ = calcInfernoMod(_loc3_);
         if(get_player().hasStatusEffect(StatusEffects.DragonBreathBoost))
         {
            _loc3_ *= 1.5;
         }
         _loc3_ = get_monster().get_fireRes() * _loc3_;
         if(get_monster().hasStatusEffect(StatusEffects.Sandstorm))
         {
            _loc3_ = Math.round(0.2 * _loc3_);
         }
         if(get_player().hasStatusEffect(StatusEffects.GooArmorSilence))
         {
            _loc3_ += 25;
         }
         return get_combat().globalMod(_loc3_);
      }
      
      public function fireBowChance() : Number
      {
         if(get_monster().get_short() == "worms" || get_player().hasStatusEffect(StatusEffects.Blind) || get_monster().get_short() == "Isabella" && !get_monster().hasStatusEffect(StatusEffects.Blind))
         {
            return 0;
         }
         if(get_monster().get_short() == "Vala" && !get_monster().hasStatusEffect(StatusEffects.Stunned))
         {
            return 30;
         }
         if(get_monster().get_short() == "pod")
         {
            return 100;
         }
         var _loc1_:Number = get_monster().standardDodgeFunc(get_player(),get_player().get_spe() / 10 + get_player().get_inte() / 10 + get_player().masteryLevel(MasteryLib.Bow) * 6 - 35);
         if(get_player().hasPerk(PerkLib.EagleEye))
         {
            _loc1_ *= 1.25;
         }
         return Math.round(Math.max(0,Math.min(100,_loc1_)));
      }
      
      public function fireBowCalc(param1:Boolean = false, param2:Boolean = false) : Object
      {
         var _loc7_:Number = NaN;
         var _loc3_:Number = 0;
         var _loc4_:Boolean = false;
         var _loc5_:Boolean = false;
         var _loc6_:Boolean = get_player().hasStatusEffect(StatusEffects.MonkStance) || get_player().hasStatusEffect(StatusEffects.BrawlerStance) || get_player().hasStatusEffect(StatusEffects.ClawStance);
         if(get_player().hasPerk(PerkLib.NoBaggage) && !_loc6_ && get_player().get_weapon().isUnarmed() && get_player().get_shield() == ShieldLib.NOTHING && (get_player().get_armorPerk() == "Light" || get_player().get_armorPerk() == "Medium" || get_player().get_armor().get_name() == "nothing"))
         {
            _loc3_ = 20 + get_player().get_str() / 1.6 + get_player().masteryLevel(MasteryLib.Bow) * 30 + get_player().get_spe() / 1.6;
         }
         else
         {
            _loc3_ = 20 + get_player().get_str() / 3 + get_player().masteryLevel(MasteryLib.Bow) * 25 + get_player().get_spe() / 3;
         }
         if(get_player().hasPerk(PerkLib.StrongDraw))
         {
            _loc3_ += get_player().get_str() / 2;
         }
         if(_loc3_ < 0)
         {
            _loc3_ = 0;
         }
         _loc3_ *= get_player().physMod();
         if(get_player().hasKeyItem("Kelt\'s Bow"))
         {
            _loc3_ *= 1.3;
         }
         if(get_monster().hasStatusEffect(StatusEffects.Stunned) && get_player().findPerk(PerkLib.KillerInstinct) > 0)
         {
            _loc4_ = true;
            _loc3_ *= 1.3;
         }
         if(get_player().hasPerk(PerkLib.KillerInstinct) && !param1)
         {
            _loc7_ = get_player().getBaseCritChance();
            if(get_player().hasPerk(PerkLib.VitalAim))
            {
               _loc7_ += 5;
            }
            if(Utils.randomChance(_loc7_))
            {
               _loc5_ = true;
               _loc3_ *= 1.5;
            }
         }
         _loc3_ = get_combat().globalMod(_loc3_);
         if(param1)
         {
            if(param2)
            {
               return {
                  "finalDamage":get_monster().reduceDamageMax(_loc3_),
                  "isCrit":_loc5_,
                  "isMiniCrit":false
               };
            }
            return {
               "finalDamage":get_monster().reduceDamageMin(_loc3_),
               "isCrit":_loc5_,
               "isMiniCrit":false
            };
         }
         return {
            "finalDamage":get_monster().reduceDamage(_loc3_,get_player(),0,false,false),
            "isCrit":_loc5_,
            "isMiniCrit":_loc4_
         };
      }
      
      public function fireBow() : void
      {
         var newRound:Boolean;
         var _g:Combat;
         clearOutput();
         if(get_player().hasStatusEffect(StatusEffects.BowDisabled))
         {
            outputText("你现在不能使用你的弓！");
            menu();
            _g = get_combat();
            newRound = false;
            addButton(0,"继续",function():void
            {
               _g.combatMenu(newRound);
            });
            return;
         }
         get_combat().damageType = "PhysicalR";
         switch(get_player().masteryLevel(MasteryLib.Bow))
         {
            case 0:
               outputText("你有些笨拙地搭上一支箭并射了出去！[pg-]");
               break;
            case 1:
               outputText("你抽出一支箭并向[themonster]射去！[pg-]");
               break;
            case 2:
               outputText("你以流畅的动作抽出、搭上并向你的对手射出致命的箭矢！[pg-]");
               break;
            case 3:
               outputText("眨眼间，你抽出弓并直接向[themonster]射击。[pg-]");
               break;
            case 4:
               outputText("你以高超的技巧随意地向[themonster]射出一支箭。[pg-]");
               break;
            case 5:
               outputText("你以几乎超自然的技巧向[themonster]射出一支箭。[pg-]");
               break;
            default:
               outputText("你的精通等级似乎出了点问题，但你决定忽略它，还是射出了你的弓。[pg-]");
         }
         shootArrow();
         get_player().masteryXP(MasteryLib.Bow,5 + Utils.rand(11));
         get_combat().startMonsterTurn();
      }
      
      public function fanShot() : void
      {
         var hitChance1:Number;
         var _g1:CombatAbilities;
         var newRound:Boolean;
         var _g:Combat;
         var _loc1_:int = 0;
         clearOutput();
         if(get_player().hasStatusEffect(StatusEffects.BowDisabled))
         {
            outputText("你现在不能使用你的弓！");
            menu();
            _g = get_combat();
            newRound = false;
            addButton(0,"继续",function():void
            {
               _g.combatMenu(newRound);
            });
            return;
         }
         get_combat().damageType = "PhysicalR";
         if(int(get_combat().getActiveEnemies().length) == 1)
         {
            outputText("你准备好并用极大的力量拉开六支箭，同时向[themonster]射出！[pg-]");
            _loc1_ = int(fireBowChance());
            if(!get_monster().get_plural())
            {
               _loc1_ /= 1.75;
            }
            shootArrow(_loc1_,true,true);
            shootArrow(_loc1_,true,false);
            shootArrow(_loc1_,true,false);
            shootArrow(_loc1_,true,false);
            shootArrow(_loc1_,true,false);
            shootArrow(_loc1_,true,false);
         }
         else
         {
            outputText("你准备好并用极大的力量拉开许多支箭，同时向你面前的许多敌人射出！[pg-]");
            _loc1_ = int(fireBowChance() / 1.3);
            if(!get_monster().get_plural())
            {
               _loc1_ /= 1.75;
            }
            _g1 = this;
            hitChance1 = _loc1_;
            allMonsters(function():void
            {
               _g1.tripleHit(hitChance1);
            });
         }
         get_player().masteryXP(MasteryLib.Bow,5 + Utils.rand(11));
         get_combat().startMonsterTurn();
      }
      
      public function execDistance() : void
      {
         var _gthis:CombatAbilities;
         var _loc3_:* = null as Monster;
         _gthis = this;
         var _loc1_:int = 0;
         var _loc2_:Array = get_monsterArray();
         while(_loc1_ < int(_loc2_.length))
         {
            _loc3_ = _loc2_[_loc1_];
            _loc1_++;
            if(!_loc3_.reactWrapper(ReactionContext.Distanced))
            {
               return;
            }
         }
         var _loc4_:Function = function():void
         {
            if(_gthis.get_monster().distance == CombatDistance.Distant)
            {
               return;
            }
            if(Utils.randomChance(_gthis.get_player().movementChance(_gthis.get_monster())) || !_gthis.get_monster().shouldMove(CombatDistance.Melee,true) || !_gthis.get_monster().canMove())
            {
               _gthis.outputText("[pg]你成功地拉开了与[themonster]的距离。");
               _gthis.get_combatRangeData().movePlayerDistant(_gthis.get_monster());
            }
            else
            {
               _gthis.outputText("[pg][Themonster]紧追不舍，立刻拉近了距离！");
               _gthis.tfScorchCheck();
            }
         };
         allMonsters(_loc4_);
      }
      
      public function endlessFlurry() : void
      {
         var _loc4_:int = 0;
         outputText("你熟练地挥舞着[weapon]做好准备，眯起眼睛，专注于你的目标。在一瞬间，你猛烈出击，连续快速攻击了多次！[pg-]");
         var _loc1_:int = flurryAmount;
         if(flurryAmount == 1 && canClawFist(5,FistStances.Claw))
         {
            _loc1_ = 2;
         }
         var _loc2_:int = 0;
         var _loc3_:int = _loc1_;
         while(_loc2_ < _loc3_)
         {
            _loc4_ = _loc2_++;
            get_combat().performAttack(get_combat().calcWeaponDamage(false) * 0.5,_loc4_);
            outputText("[pg-]");
         }
         if(flurryAmount < 5)
         {
            flurryAmount += 1;
         }
         get_combat().startMonsterTurn();
      }
      
      public function dragonBreathExec() : void
      {
         var _loc1_:* = null as Monster;
         currDamage = dragonBreathCalc();
         if(get_player().hasStatusEffect(StatusEffects.DragonBreathBoost))
         {
            get_player().removeStatusEffect(StatusEffects.DragonBreathBoost);
         }
         if(get_monster() is LivingStatue)
         {
            outputText("火焰无害地掠过石质皮肤，只在雕像表面留下更加光滑的痕迹。");
            return;
         }
         if(get_monster() is VolcanicGolem)
         {
            outputText("魔像似乎并不在意这些火焰。");
            if(get_monster().hasStatusEffect(StatusEffects.VolcanicFistProblem))
            {
               if(!get_monster().hasStatusEffect(StatusEffects.VolcanicFrenzy))
               {
                  outputText("[pg-]魔像无法掩护自己，被咆哮引起的巨大冲击波击中，陷入眩晕并倒地！");
                  outputText("[pg-]魔像的岩石外壳滑落，露出其熔融的内部。[b:这是你攻击的机会！]");
                  get_monster().createStatusEffect(StatusEffects.Stunned,1,0,0,0);
                  get_monster().set_armorDef(0);
               }
               else
               {
                  outputText("[pg-]在愤怒中，魔像硬生生扛过了你咆哮引起的巨大冲击波，虽然在这个过程中掉落了几块岩石外壳，但成功抵抗了眩晕！");
                  if(get_monster().hasStatusEffect(StatusEffects.VolcanicArmorRed))
                  {
                     get_monster().addStatusValue(StatusEffects.VolcanicArmorRed,1,3);
                     get_monster().addStatusValue(StatusEffects.VolcanicArmorRed,2,1);
                  }
                  else
                  {
                     get_monster().createStatusEffect(StatusEffects.VolcanicArmorRed,3,1,0,0);
                  }
                  _loc1_ = get_monster();
                  _loc1_.set_armorDef(_loc1_.get_armorDef() - -150);
                  if(get_monster().get_armorDef() < 0)
                  {
                     get_monster().set_armorDef(0);
                  }
               }
            }
            return;
         }
         outputText("[Themonster]尽[monster.his]最大努力试图躲避，但冲击波的速度实在太快了。");
         if(get_monster().hasStatusEffect(StatusEffects.Sandstorm))
         {
            outputText("[b:你的吐息被旋转的漩涡大幅度消散，导致其命中时的威力大减！]");
         }
         if(Boolean(combatAvoidDamage(new AvoidDamageParameters(true,false,false,null,null,dragonBreathChance(),null,null)).attackFailed))
         {
            outputText("尽管你的咆哮造成了沉重的冲击，[themonster]还是设法以一个角度承受了下来，并在[monster.his]脚上站稳，将注意力集中在你身上，准备继续战斗。");
         }
         else if(get_monster().get_short() == "Vala" && !get_monster().hasStatusEffect(StatusEffects.Stunned))
         {
            outputText("瓦拉以惊人的力量拍打翅膀，将火球吹回给你！");
            if(get_player().hasPerk(PerkLib.Evade) && Utils.rand(2) == 0)
            {
               outputText("你猛地扑向一旁，躲开了它！");
            }
            else if(get_player().hasPerk(PerkLib.Flexibility) && Utils.rand(4) == 0)
            {
               outputText("你利用自己的柔韧性，勉强将身体折叠起来躲开了！");
            }
            else if(get_combat().combatBlock(get_player(),get_player(),true))
            {
               outputText("你成功用你的[shield]挡住了你自己的火焰！");
            }
            else
            {
               outputText("你自己的火焰拍在了你的脸上！");
               currDamage = get_player().takeDamage(currDamage,true);
            }
         }
         else if(get_monster().stun(1,100))
         {
            outputText("[Themonster]在你那如同一吨重岩石般砸向[monster.him]的冲击波下踉跄后退！这股冲击力将[monster.him]击倒在地，晕头转向，无法还击。");
         }
         else
         {
            outputText("[Themonster]在你那如同一吨重岩石般砸向[monster.him]的冲击波下踉跄后退！这股冲击力让[monster.him]踉跄后退，但[bstart][monster.he]");
            if(!get_monster().get_plural())
            {
               outputText("是");
            }
            else
            {
               outputText("是");
            }
            outputText("太过坚定，没有被你的攻击击晕。[bend]");
         }
         doFireDamage(currDamage,false);
         outputText("[pg-]");
      }
      
      public function dragonBreathChance() : Number
      {
         return get_monster().standardDodgeFunc(get_player(),10);
      }
      
      public function dragonBreathCalc(param1:Boolean = false, param2:Boolean = false) : Number
      {
         var _loc3_:Number = int(get_player().level * 8 + 25 + (param1 ? 0 : Utils.rand(10)) + (param2 ? 10 : 0));
         _loc3_ = calcInfernoMod(_loc3_);
         if(get_player().hasStatusEffect(StatusEffects.DragonBreathBoost))
         {
            _loc3_ *= 1.5;
         }
         if(get_monster().hasStatusEffect(StatusEffects.Sandstorm))
         {
            _loc3_ = Math.round(0.2 * _loc3_);
         }
         _loc3_ = get_monster().get_fireRes() * _loc3_;
         return get_combat().globalMod(_loc3_);
      }
      
      public function dragonBreath() : void
      {
         clearOutput();
         get_player().createStatusEffect(StatusEffects.DragonBreathCooldown,0,0,0,0);
         get_combat().damageType = "MagicalR";
         outputText("你调动内心深处的力量，向敌人发出一声震耳欲聋的咆哮，其威力之大，甚至让[monster.him]周围的环境都开始崩塌！[pg-]");
         infernoDisplay();
         allMonsters(dragonBreathExec);
         boostInferno();
         get_combat().startMonsterTurn();
      }
      
      public function doFireDamage(param1:Number, param2:Boolean = true) : void
      {
         if(param2)
         {
            infernoDisplay();
         }
         if(get_monster().reactWrapper(ReactionContext.Burned))
         {
            currDamage = get_combat().doDamage(param1,true,true);
         }
         if(param2)
         {
            boostInferno();
         }
      }
      
      public function divineWindAmount(param1:Boolean = false, param2:Boolean = false) : Number
      {
         if(param1)
         {
            return get_player().maxHP() * 0.1 * get_player().spellMod() / 1.75;
         }
         if(param2)
         {
            return get_player().maxHP() * 0.25 * get_player().spellMod() / 1.75;
         }
         return get_player().maxHP() * (0.1 + Math.random() * 0.15) * get_player().spellMod() / 1.75;
      }
      
      public function divineWind() : void
      {
         outputText("你将[weapon]紧贴胸前，闭上眼睛，在体内凝聚奥术能量。\n片刻之后，你轻轻地张开双臂，魔法能量从你的指尖呈波浪状散开。很快，整个战场发出微弱的光芒，风本身被施了魔法，可以治愈所有的战士！");
         get_player().addStatusEffect(new DivineWindBuff(4));
         get_combat().startMonsterTurn();
      }
      
      public function distanceSelf() : void
      {
         if(canFist(5,FistStances.Monk) && get_monster().canMove() && get_combatRangeData().canReach(get_player(),get_monster(),get_monster().distance,CombatRange.Melee))
         {
            if(get_silly() && Utils.randomChance(1))
            {
               outputText("你虚晃一招，拳头在愚蠢的" + (get_monster().get_short().charAt(0) == "f" ? get_monster().get_short() : "敌人") + "面前停下。你迅速逃离，[monster.his]因被骗而感到沮丧。");
               get_combatRangeData().moveDistantSafe(get_monster());
            }
            else
            {
               outputText("你开始向[themonster]挥拳，但当[monster.he]反应过来时，你利用攻击的惯性扭转身体，迅速从[monster.him]身边跑开。");
               if(Utils.randomChance(50))
               {
                  outputText("[pg-][Themonster]被你的假动作成功分散了注意力，无法及时对你的动作做出反应。");
                  get_combatRangeData().moveDistantSafe(get_monster());
               }
               else
               {
                  outputText("[pg-][Themonster]没有上当。");
               }
            }
         }
         else
         {
            outputText("你准备好并迅速跑开，拉开了与敌人的距离！");
         }
         execDistance();
         get_combat().startMonsterTurn();
      }
      
      public function dispellingSpell() : void
      {
         var _loc1_:* = null as Monster;
         clearOutput();
         outputText("你在护身符中聚集能量，并释放出其中包含的法术。一道橙色的光芒出现，短暂闪烁后消失了。\n");
         if(get_player().hasStatusEffect(StatusEffects.ChargeWeapon))
         {
            outputText("\n随着你的法术被驱散，你的武器不再发光。");
            get_player().removeStatusEffect(StatusEffects.ChargeWeapon);
         }
         if(get_player().hasStatusEffect(StatusEffects.Leeching))
         {
            outputText("[b:环绕你[weapon]的咒语消散了。]\n");
            get_player().removeStatusEffect(StatusEffects.Leeching);
         }
         if(get_player().hasStatusEffect(StatusEffects.TFInflame))
         {
            outputText("\n环绕你和你的武器的火焰熄灭了。");
            get_player().removeStatusEffect(StatusEffects.TFInflame);
         }
         if(get_player().hasStatusEffect(StatusEffects.TFPlate))
         {
            outputText("\n你的土之护甲碎裂并掉落到地上。");
            get_player().removeStatusEffect(StatusEffects.TFPlate);
         }
         if(get_player().hasStatusEffect(StatusEffects.TFMoltenPlate))
         {
            outputText("\n你不再被熔岩覆盖。");
            get_player().removeStatusEffect(StatusEffects.TFMoltenPlate);
         }
         if(get_player().hasStatusEffect(StatusEffects.ParasiteQueen))
         {
            outputText("\n寄生虫不再提升你的能量。");
            showStatDown("str");
            showStatDown("tou");
            showStatDown("spe");
            statScreenRefresh();
            get_player().removeStatusEffect(StatusEffects.ParasiteQueen);
         }
         if(get_player().hasStatusEffect(StatusEffects.NephilaQueen))
         {
            outputText("\n寄生虫不再提升你的能量。");
            showStatDown("int");
            statScreenRefresh();
            get_player().removeStatusEffect(StatusEffects.NephilaQueen);
         }
         if(get_player().hasStatusEffect(StatusEffects.TrueWhispered))
         {
            outputText("\n你的脑海现在摆脱了可怕的" + (get_player().statusEffectv2(StatusEffects.TrueWhispered) > 0 ? "尖叫。" : "低语。"));
            get_player().removeStatusEffect(StatusEffects.TrueWhispered);
         }
         if(get_player().hasStatusEffect(StatusEffects.Marked))
         {
            outputText("\n你感觉到廷臣的妖术消退了——你不再被诅咒了！");
            get_player().removeStatusEffect(StatusEffects.Marked);
         }
         if(get_player().hasStatusEffect(StatusEffects.Nothingness))
         {
            outputText("\n护身符成功移除了该生物的法术，恢复了你的存在！");
            get_player().removeStatusEffect(StatusEffects.Nothingness);
         }
         if(get_player().hasStatusEffect(StatusEffects.Might))
         {
            outputText("\n随着增强力量的法术消退，你感觉虚弱了一些。");
            get_player().removeStatusEffect(StatusEffects.Might);
         }
         if(get_monster().hasStatusEffect(StatusEffects.ChargeWeapon))
         {
            outputText("\n[themonster]的" + get_monster().get_weaponName() + "周围的光芒完全消退了。");
            get_monster().removeStatusEffect(StatusEffects.ChargeWeapon);
         }
         if(get_monster().hasStatusEffect(StatusEffects.VolcanicUberHEAL))
         {
            outputText("\n魔像闪烁的护盾消散了——他可以再次被攻击了！");
            get_monster().removeStatusEffect(StatusEffects.VolcanicUberHEAL);
         }
         if(get_monster().hasStatusEffect(StatusEffects.Fear))
         {
            outputText("\n[themonster]周围的黑暗幻象终于消散，让[monster.him]不再恐惧，因为[monster.he]恢复了自信。");
            _loc1_ = get_monster();
            _loc1_.set_spe(_loc1_.get_spe() + get_monster().statusEffectv1(StatusEffects.Fear));
            get_monster().removeStatusEffect(StatusEffects.Fear);
         }
         if(get_monster().hasStatusEffect(StatusEffects.Illusion))
         {
            outputText("\n随着[monster.his]幻象法术的消退，[themonster]周围的现实终于恢复了原状。");
            _loc1_ = get_monster();
            _loc1_.set_spe(_loc1_.get_spe() + get_monster().statusEffectv1(StatusEffects.Illusion));
            get_monster().removeStatusEffect(StatusEffects.Illusion);
         }
         if(get_player().hasStatusEffect(StatusEffects.Might))
         {
            outputText("\n随着增强力量的法术消退，你感觉虚弱了一些。");
            get_player().removeStatusEffect(StatusEffects.Might);
         }
         if(get_monster().hasStatusEffect(StatusEffects.Shell))
         {
            outputText("\n[themonster]周围的魔法外壳碎裂了！");
            get_monster().removeStatusEffect(StatusEffects.Shell);
         }
         outputText("\n");
         get_game().arianScene.clearTalisman();
         get_combat().startMonsterTurn();
      }
      
      public function counterAbility() : void
      {
         clearOutput();
         get_player().createStatusEffect(StatusEffects.CounterAB,0,3,0,0);
         if(get_combatRangeData().canReach(get_player(),get_monster(),get_monster().distance,CombatRange.Melee))
         {
            get_combat().attack();
         }
         else
         {
            outputText("你摆出无头骑士教给你的姿势。你将无法有效地攻击，但你有机会反击敌人的攻击！\n");
            get_combat().startMonsterTurn();
         }
      }
      
      public function corruptedFoxFire() : void
      {
         clearOutput();
         if(get_player().hasStatusEffect(StatusEffects.ThroatPunch) || get_player().hasStatusEffect(StatusEffects.WebSilence))
         {
            outputText("你现在呼吸困难，无法集中精力使用这个能力。");
            doNext(magicalSpecials);
            return;
         }
         currDamage = corrFoxFireCalc();
         get_combat().damageType = "MagicalR";
         outputText("你伸出手掌，召唤出堕落的紫色火焰，在你的指尖跳跃。你猛烈地将它掷向[themonster]，它在撞击时爆发，将耀眼的淡紫色火花洒向四周。");
         doFireDamage(currDamage);
         statScreenRefresh();
         outputText("[pg]");
         get_combat().startMonsterTurn();
      }
      
      public function corrFoxFireCalc(param1:Boolean = false, param2:Boolean = false) : Number
      {
         var _loc3_:int = int(10 + (get_player().get_inte() / 3 + (param1 ? 0 : Utils.rand(get_player().get_inte() / 2)) + (param2 ? get_player().get_inte() / 2 : 0)) * get_player().spellMod());
         _loc3_ = calcInfernoMod(_loc3_);
         if(get_monster().cor >= 66)
         {
            _loc3_ = int(Math.round(_loc3_ * 0.66));
         }
         else if(get_monster().cor >= 50)
         {
            _loc3_ = int(Math.round(_loc3_ * 0.8));
         }
         else if(get_monster().cor >= 25)
         {
            _loc3_ = int(Math.round(_loc3_ * 1));
         }
         else if(get_monster().cor >= 10)
         {
            _loc3_ = int(Math.round(_loc3_ * 1.2));
         }
         else
         {
            _loc3_ = int(Math.round(_loc3_ * 1.3));
         }
         _loc3_ *= 1 + Math.round(get_monster().get_lust() / get_monster().maxLust() * 0.5);
         _loc3_ = int(Math.round(_loc3_ * get_monster().get_fireRes()));
         return get_combat().globalMod(_loc3_);
      }
      
      public function constrictChance() : int
      {
         if(get_monster().hasPerk(PerkLib.Juggernaut))
         {
            return 0;
         }
         var _loc1_:int = -30;
         if(get_player().hasPerk(PerkLib.NaturalWeapons))
         {
            _loc1_ += 20;
         }
         return standardStatComparison(get_player().get_spe(),get_monster().get_speRescaled(),_loc1_);
      }
      
      public function combatAvoidDamage(param1:AvoidDamageParameters) : Object
      {
         param1.attacker = get_player();
         param1.defender = get_monster();
         return get_combat().combatAvoidDamage(param1);
      }
      
      public function cleansingPalmCalc() : DamageRange
      {
         if(get_monster().cor <= 20)
         {
            return new DamageRange(null,null,null);
         }
         var _loc1_:Number = get_player().get_inte() / 4;
         var _loc2_:Number = get_player().get_inte() / 3;
         if(get_player().get_weapon().isUnarmed())
         {
            _loc2_ *= 1.5;
         }
         var _loc3_:Number = (get_monster().cor - 20) / 25;
         if(_loc3_ > 1.5)
         {
            _loc3_ = 1.5;
            _loc3_ += (get_monster().cor - 57.5) / 100;
         }
         _loc3_ *= get_player().spellMod();
         var _loc4_:int = int(Math.round(get_combat().globalMod(_loc1_ * _loc3_)));
         var _loc5_:int = int(Math.round(get_combat().globalMod((_loc1_ + _loc2_) * _loc3_)));
         return new DamageRange(_loc4_,_loc5_,Utils.randBetween(_loc4_,_loc5_));
      }
      
      public function clawStance() : void
      {
         outputText("你向前倾身，压低重心，活动着手指，感觉你的[skindesc]因期待而战栗。");
         stanceChange(FistStances.Claw);
         if(canFist(4))
         {
            outputText("[pg-]你按兵不动，[eyes]死死盯着猎物，等待出击的最佳时机。");
            get_player().createStatusEffect(StatusEffects.Lurk);
         }
         get_combat().startMonsterTurn();
      }
      
      public function chargeWeaponSilent() : void
      {
         get_player().createStatusEffect(StatusEffects.ChargeWeapon,chargeWeaponCalc());
         statScreenRefresh();
      }
      
      public function chargeWeaponCalc() : Number
      {
         return Math.round(10 * get_player().spellMod() * get_player().spellbladeBonus());
      }
      
      public function canUsePAtk() : Boolean
      {
         if(get_player().isCrippled)
         {
            return false;
         }
         if(get_player().hasStatusEffect(StatusEffects.SentinelPhysicalDisabled) || get_player().hasStatusEffect(StatusEffects.PhysicalDisabled))
         {
            return false;
         }
         return true;
      }
      
      public function canUseMagic() : Boolean
      {
         if(get_player().isSilenced)
         {
            return false;
         }
         if(get_player().hasStatusEffect(StatusEffects.ThroatPunch))
         {
            return false;
         }
         if(get_player().hasStatusEffect(StatusEffects.WebSilence))
         {
            return false;
         }
         if(get_player().hasStatusEffect(StatusEffects.GooArmorSilence))
         {
            return false;
         }
         if(get_player().hasStatusEffect(StatusEffects.SentinelOmniSilence))
         {
            return false;
         }
         if(get_player().hasStatusEffect(StatusEffects.WhipSilence))
         {
            return false;
         }
         return true;
      }
      
      public function canUseMAtk() : Boolean
      {
         if(get_player().isUnfocused)
         {
            return false;
         }
         if(get_player().hasStatusEffect(StatusEffects.SentinelOmniSilence))
         {
            return false;
         }
         return true;
      }
      
      public function canFist(param1:int = 1, param2:FistStances = undefined) : Boolean
      {
         var _loc3_:Boolean = false;
         if(param2 == null)
         {
            _loc3_ = true;
         }
         else
         {
            switch(param2.index)
            {
               case 0:
                  _loc3_ = get_player().hasStatusEffect(StatusEffects.MonkStance);
                  break;
               case 1:
                  _loc3_ = get_player().hasStatusEffect(StatusEffects.BrawlerStance);
                  break;
               case 2:
                  _loc3_ = get_player().hasStatusEffect(StatusEffects.ClawStance);
            }
         }
         if(_loc3_)
         {
            §§push(get_player().masteryLevel(MasteryLib.Fist));
            var _temp_1:* = param1;
            §§push(_temp_1);
            if(!(_temp_1 is Number))
            {
               throw "Class cast error";
            }
            return §§pop() >= int(§§pop());
         }
         return false;
      }
      
      public function canClawFist(param1:int = 1, param2:FistStances = undefined) : Boolean
      {
         var _loc3_:Boolean = false;
         if(param2 == null)
         {
            _loc3_ = true;
         }
         else
         {
            switch(param2.index)
            {
               case 0:
                  _loc3_ = get_player().hasStatusEffect(StatusEffects.MonkStance);
                  break;
               case 1:
                  _loc3_ = get_player().hasStatusEffect(StatusEffects.BrawlerStance);
                  break;
               case 2:
                  _loc3_ = get_player().hasStatusEffect(StatusEffects.ClawStance);
            }
         }
         if(_loc3_)
         {
            §§push(get_player().masteryLevel(MasteryLib.Claw));
            var _temp_1:* = param1;
            §§push(_temp_1);
            if(!(_temp_1 is Number))
            {
               throw "Class cast error";
            }
            return §§pop() >= int(§§pop());
         }
         return false;
      }
      
      public function calcInfernoMod(param1:Number) : int
      {
         var _loc2_:Number = NaN;
         if(get_player().hasPerk(PerkLib.RagingInferno))
         {
            _loc2_ = 1;
            if(get_combat().combatRound - fireMagicLastTurn == 1)
            {
               switch(fireMagicCumulated)
               {
                  case 0:
                  case 1:
                     _loc2_ = 1.2;
                     break;
                  case 2:
                     _loc2_ = 1.35;
                     break;
                  case 3:
                     _loc2_ = 1.45;
                     break;
                  default:
                     _loc2_ = 1.5 + (fireMagicCumulated - 5) * 0.05;
               }
               param1 = Math.round(param1 * _loc2_);
            }
         }
         return int(param1);
      }
      
      public function calcGrayMagicMod() : Number
      {
         var _loc1_:Number = -100 * (int(get_player().maxLust()) ^ 2);
         var _loc2_:Number = Math.pow(get_player().get_lust(),2) - get_player().maxLust() * get_player().get_lust();
         _loc2_ *= 1 / _loc1_;
         return 1 + int(_loc2_ * 100) / 100;
      }
      
      public function broodBiteCalc(param1:Boolean = false, param2:Boolean = false, param3:Boolean = false) : Number
      {
         var _loc4_:int = int(10 + (get_player().get_tou() / 3 + (param1 ? 0 : Utils.rand(get_player().get_inte() / 2)) + (param3 ? get_player().get_inte() / 2 : 0)) * get_player().spellMod());
         if(get_monster().get_spe() < 1 && !get_monster().get_plural())
         {
            _loc4_ = int(Math.round(_loc4_ * 5));
         }
         else if(get_monster().get_spe() < 1 && get_monster().get_plural())
         {
            _loc4_ = int(Math.round(_loc4_ * 2.5));
         }
         else
         {
            _loc4_ = int(Math.round(_loc4_ * 1));
         }
         if(_loc4_ > 0)
         {
            _loc4_ *= get_player().physMod();
            _loc4_ = int(get_combat().globalMod(_loc4_));
         }
         if(param2)
         {
            return get_monster().reduceDamageMin(_loc4_);
         }
         if(param3)
         {
            return get_monster().reduceDamageMax(_loc4_);
         }
         return get_monster().reduceDamageCombat(_loc4_);
      }
      
      public function brawlerStance() : void
      {
         outputText("你沉下肩膀，举起双手，准备好进行一场真正的[if (silly) {fisting|fistfight}]。");
         stanceChange(FistStances.Brawler);
         if(canFist(4))
         {
            outputText("你立刻冲向敌人，挥出一记右勾拳。[pg-]");
            get_combatRangeData().closeDistance(get_monster());
            get_combat().performAttack(get_combat().calcWeaponDamage() * 0.5);
         }
         get_combat().startMonsterTurn();
      }
      
      public function brawlerLustserk() : void
      {
         outputText("你发出一声野蛮的咆哮，欲望冲昏了头脑，让你放弃了所有心理防线。你高举双拳，准备摧毁挡在面前的一切。");
         stanceChange(FistStances.Brawler);
         if(canFist(4))
         {
            outputText("你立刻冲向敌人，将全身的重量都倾注在一记势大力沉的重拳上。[pg-]");
            get_player().createStatusEffect(StatusEffects.Lustserking);
            get_combatRangeData().closeDistance(get_monster());
            get_combat().performAttack(get_combat().calcWeaponDamage() * 1.5);
         }
         get_combat().startMonsterTurn();
      }
      
      public function brawlerBerserk() : void
      {
         outputText("你发出一声野蛮的咆哮，愤怒冲昏了头脑，让你放弃了所有防御。你高举双拳，准备摧毁挡在面前的一切。");
         stanceChange(FistStances.Brawler);
         if(canFist(4))
         {
            outputText("你立刻冲向敌人，将全身的重量都倾注在一记势大力沉的重拳上。[pg-]");
            get_player().createStatusEffect(StatusEffects.Berserking);
            get_combatRangeData().closeDistance(get_monster());
            get_combat().performAttack(get_combat().calcWeaponDamage() * 1.5);
         }
         get_combat().startMonsterTurn();
      }
      
      public function boostInferno() : void
      {
         if(get_player().hasPerk(PerkLib.RagingInferno))
         {
            if(get_combat().combatRound - fireMagicLastTurn == 1)
            {
               fireMagicCumulated += 1;
            }
            else
            {
               fireMagicCumulated = 1;
            }
            fireMagicLastTurn = get_combat().combatRound;
         }
      }
      
      public function blackfireDamage(param1:Boolean = false, param2:Boolean = false) : Number
      {
         var _loc3_:Number = int((30 + (get_player().get_inte() / 3 + (param1 ? 0 : Utils.rand(get_player().get_inte() / 2))) + (param2 ? get_player().get_inte() / 2 : 0)) * get_player().spellMod());
         _loc3_ = calcInfernoMod(_loc3_);
         _loc3_ = Math.round(_loc3_ * get_monster().get_fireRes());
         return get_combat().globalMod(_loc3_);
      }
      
      public function biteCalc(param1:Boolean = false, param2:Boolean = false) : Number
      {
         var _loc3_:Number = get_player().get_str() + 45;
         if(_loc3_ > 0)
         {
            _loc3_ *= get_player().physMod();
            _loc3_ = get_combat().bodyMod(_loc3_);
            _loc3_ = get_combat().globalMod(_loc3_);
         }
         if(param1)
         {
            return get_monster().reduceDamageMin(_loc3_);
         }
         if(param2)
         {
            return get_monster().reduceDamageMax(_loc3_);
         }
         return get_monster().reduceDamageCombat(_loc3_);
      }
      
      public function bite() : void
      {
         var newRound:Boolean;
         var _g:Combat;
         clearOutput();
         if(get_monster().get_short() == "worms")
         {
            outputText("那些东西绝对不可能靠近你的嘴巴！[pg]");
            menu();
            _g = get_combat();
            newRound = false;
            addButton(0,"继续",function():void
            {
               _g.combatMenu(newRound);
            });
            return;
         }
         if(get_monster().hasPerk(PerkLib.BiteImmune))
         {
            outputText("你向前猛扑，露出毒牙，用尽全力咬向[themonster]。当你咬中的那一刻，一阵刺痛直冲你的头骨，你的牙齿甚至无法在上面留下最轻微的凹痕。你还不如去咬一块石头！");
            get_player().takeDamage(5,true);
            get_combat().startMonsterTurn();
            return;
         }
         get_combat().damageType = "PhysicalM";
         outputText("你张大嘴巴，鲨鱼般的牙齿伸了出来。你饥肠辘辘地咆哮着，扑向你的对手，准备狠狠地咬上一口！");
         if(get_player().hasStatusEffect(StatusEffects.Blind))
         {
            outputText("事后看来，在失明的情况下试图咬人可能是一个糟糕的主意……");
         }
         currDamage = biteCalc();
         if(Boolean(combatAvoidDamage(new AvoidDamageParameters(true,false,false,null,null,null,null,null)).attackFailed))
         {
            if(get_monster().get_spe() - get_player().get_spe() < 8)
            {
               outputText("[Themonster]险之又险地避开了你的攻击！");
            }
            if(get_monster().get_spe() - get_player().get_spe() >= 8 && get_monster().get_spe() - get_player().get_spe() < 20)
            {
               outputText("[Themonster]以极快的速度躲开了你的攻击！");
            }
            if(get_monster().get_spe() - get_player().get_spe() >= 20)
            {
               outputText("[Themonster]灵巧地避开了你缓慢的攻击。");
            }
            outputText("[pg]");
            get_combat().startMonsterTurn();
            return;
         }
         if(currDamage <= 0)
         {
            currDamage = 0;
            outputText("你的啃咬被[themonster]弹开或挡住了。");
         }
         if(currDamage > 0 && currDamage < 10)
         {
            outputText("你的啃咬对[themonster]造成的伤害微乎其微！");
         }
         if(currDamage >= 10 && currDamage < 20)
         {
            outputText("你的啃咬严重地伤到了[themonster]！");
         }
         if(currDamage >= 20 && currDamage < 30)
         {
            outputText("你的啃咬让[themonster]踉跄了一下。");
         }
         if(currDamage >= 30)
         {
            outputText("你强力的啃咬[b:重创]了[themonster]！");
         }
         if(currDamage > 0)
         {
            if(get_monster().bleed(get_player()))
            {
               outputText("\n当你完成啃咬时，你锋利的锯齿状牙齿在[themonster]身上留下了难以愈合的伤口，导致[monster.him]流血不止！");
            }
         }
         currDamage = get_combat().doDamage(currDamage,true,true);
         outputText("[pg]");
         get_combat().startMonsterTurn();
      }
      
      public function berserk() : void
      {
         clearOutput();
         outputText("你咆哮着释放出你野蛮的狂怒，然后向前冲锋，为了摧毁你的敌人而忘记了防御！[pg]");
         get_player().createStatusEffect(StatusEffects.Berserking,0,0,0,0);
         get_combatRangeData().closeDistance(get_monster());
         get_combat().performAttack(get_combat().calcWeaponDamage());
         get_combat().startMonsterTurn();
      }
      
      public function bashCalc(param1:Boolean = false, param2:Boolean = false) : Number
      {
         var _loc3_:Number = 10 + get_player().get_str() / 1.5 + (param1 ? 0 : Utils.rand(get_player().get_str() / 2)) + (param2 ? get_player().get_str() / 2 : 0) + get_player().get_shieldBlock() * 2 * get_player().masteryLevel(MasteryLib.Shield);
         if(get_player().hasPerk(PerkLib.ShieldSlam))
         {
            _loc3_ *= 1.2;
         }
         if(_loc3_ < 0)
         {
            _loc3_ = 5;
         }
         if(_loc3_ > 0)
         {
            _loc3_ *= get_player().physMod();
            _loc3_ = get_combat().globalMod(_loc3_);
         }
         if(param1)
         {
            return get_monster().reduceDamageMin(_loc3_);
         }
         if(param2)
         {
            return get_monster().reduceDamageMax(_loc3_);
         }
         return get_monster().reduceDamageCombat(_loc3_);
      }
      
      public function backstabStart() : void
      {
         abilityTarget = get_monster();
         outputText("你挥舞着匕首，试图离开[themonster]的视线，潜入阴影中。\n");
         get_player().addStatusEffect(new BackstabBuff());
         get_combat().startMonsterTurn();
      }
      
      public function backstabExec() : void
      {
         var _loc1_:Monster = get_monster();
         set_monster(abilityTarget);
         outputText("[pg]你成功地绕过了" + abilityTarget.get_a() + abilityTarget.get_short() + "的视野。你从阴影中出现，将你的[weapon]刺入" + abilityTarget.get_a() + abilityTarget.get_short() + "的背部，造成了严重的伤害！");
         var _loc2_:int = int(backstabDamage());
         get_player().get_weapon().weaponXP(10 + Utils.rand(21));
         get_combat().doDamage(_loc2_,true,true,false,true);
         set_monster(_loc1_);
      }
      
      public function backstabDamage(param1:Boolean = false, param2:Boolean = false) : Number
      {
         var _loc3_:Number = 1.5 * get_combat().calcWeaponDamage(false);
         if(param1)
         {
            return get_monster().reduceDamageMin(_loc3_,40,true);
         }
         if(param2)
         {
            return get_monster().reduceDamageMax(_loc3_,40,true);
         }
         return get_monster().reduceDamageCombat(_loc3_,40,true);
      }
      
      public function arouseCalc(param1:Boolean = false, param2:Boolean = false) : Number
      {
         var _loc3_:int = int(get_player().get_inte() / 5 * get_player().spellMod());
         var _loc4_:int = int(Math.max(1,_loc3_ + (get_monster().lib + get_monster().cor - get_monster().get_inte() * 2) / 5));
         var _loc5_:int = Utils.randBetween(_loc3_,_loc4_);
         if(param1)
         {
            if(param2)
            {
               _loc5_ = int(Math.max(_loc3_,_loc4_));
            }
            else
            {
               _loc5_ = int(Math.min(_loc3_,_loc4_));
            }
         }
         return get_monster().lustVuln * _loc5_;
      }
      
      public function approach() : void
      {
         var footwork:Boolean;
         var _gthis:CombatAbilities;
         var _loc3_:* = null as Monster;
         _gthis = this;
         footwork = canFist(5,FistStances.Monk) && !get_player().isFlying;
         if(footwork)
         {
            outputText("你迅速向前冲去，冲向" + (get_monster().get_plural() || int(get_combat().getActiveEnemies().length) > 1 ? "敌群之中" : "你的对手") + "。");
         }
         else
         {
            outputText("你准备好并向前冲去，拉近了与敌人的距离！");
         }
         var _loc1_:int = 0;
         var _loc2_:Array = get_monsterArray();
         while(_loc1_ < int(_loc2_.length))
         {
            _loc3_ = _loc2_[_loc1_];
            _loc1_++;
            if(!_loc3_.reactWrapper(ReactionContext.Approached))
            {
               get_combat().startMonsterTurn();
               return;
            }
         }
         var _loc4_:Function = function():void
         {
            if(_gthis.get_monster().distance == CombatDistance.Melee)
            {
               return;
            }
            if(Utils.randomChance(_gthis.get_player().movementChance(_gthis.get_monster())) || !_gthis.get_monster().shouldMove(CombatDistance.Distant,true) || !_gthis.get_monster().canMove())
            {
               _gthis.outputText("[pg]你成功地拉近了与[themonster]的距离！");
               _gthis.get_combatRangeData().closeDistance(_gthis.get_monster());
               if(footwork && _gthis.get_monster().canMove() && !_gthis.get_monster().isFlying && Utils.randomChance(50))
               {
                  _gthis.outputText("[pg-]当你靠近[themonster]时，你用复杂且难以捉摸的动作破坏了[monster.his]的平衡。");
                  _gthis.get_monster().createStatusEffect(StatusEffects.Trip);
               }
            }
            else
            {
               _gthis.outputText("[pg][Themonster]成功向后退去，与你保持了距离！");
               _gthis.tfScorchCheck();
            }
         };
         allMonsters(_loc4_);
         get_combat().startMonsterTurn();
      }
      
      public function anemoneSting() : void
      {
         var _loc1_:Number = NaN;
         var _loc2_:* = null as Monster;
         clearOutput();
         if(Boolean(combatAvoidDamage(new AvoidDamageParameters(null,false,false,null,null,anemoneChance(),null,null)).attackFailed))
         {
            if(get_monster().get_plural())
            {
               outputText("你冲向[themonster]，甩动头发试图用触手抓住它们，但[monster.he]轻松躲开了。哎哟，你希望你刚才没有闪到自己的脖子。");
            }
            else
            {
               outputText("你冲向[themonster]，甩动头发试图用触手抓住它，但[monster.he]轻松躲开了。哎哟，你希望你刚才没有闪到自己的脖子。");
            }
         }
         else
         {
            outputText("你冲向[themonster]，像精灵一样甩动头发");
            outputText("，并成功用触手抽打了它几下。");
            if(get_monster().get_plural())
            {
               outputText("随着毒液渗入[monster.his]的身体，[monster.he]抽搐起来，动作开始变得迟缓，一半是因为麻痹，一半是因为发情。");
            }
            else
            {
               outputText("随着毒液渗入[monster.his]的身体，[monster.he]抽搐起来，动作开始变得迟缓，一半是因为麻痹，一半是因为发情。");
            }
            _loc1_ = anemoneCalc();
            _loc2_ = get_monster();
            _loc2_.set_spe(_loc2_.get_spe() - _loc1_ / 2);
            get_monster().teased(_loc1_);
         }
         get_combat().startMonsterTurn();
      }
      
      public function anemoneChance() : Number
      {
         return get_monster().standardDodgeFunc(get_player(),-20 + get_player().hair.length);
      }
      
      public function anemoneCalc(param1:Boolean = false, param2:Boolean = false, param3:Boolean = false) : Number
      {
         var _loc4_:Number = 0;
         var _loc5_:int = int(Math.min(Math.round(get_player().hair.length / 12),3));
         var _loc6_:Number = Math.round(_loc5_ + (param1 ? 0 : Utils.rand(Math.min(_loc5_ * 2,4))) + (param2 ? Math.min(_loc5_ * 2,4) : 0));
         _loc4_ += 5 * _loc6_ + (param1 ? 0 : Utils.rand(6 * _loc6_)) + (param2 ? 6 * _loc6_ : 0);
         _loc4_ += get_player().level * 1.5;
         if(param3)
         {
            _loc4_ /= 2;
         }
         else
         {
            if(get_player().hair.length >= 12)
            {
               _loc4_ += Utils.randBetween(1,2);
            }
            if(get_player().hair.length >= 24)
            {
               _loc4_ += Utils.randBetween(1,2);
            }
            if(get_player().hair.length >= 36)
            {
               _loc4_++;
            }
         }
         return get_monster().lustVuln * get_combat().bodyMod(_loc4_);
      }
      
      public function allMonsters(param1:Function) : void
      {
         var _loc5_:* = null as Monster;
         var _loc2_:Array = get_combat().getActiveEnemies();
         if(int(_loc2_.length) == 0)
         {
            return;
         }
         var _loc3_:Monster = get_monster();
         var _loc4_:int = 0;
         while(_loc4_ < int(_loc2_.length))
         {
            _loc5_ = _loc2_[_loc4_];
            _loc4_++;
            set_monster(_loc5_);
            param1();
         }
         set_monster(_loc3_);
      }
      
      public function aimedShotChance() : Number
      {
         return get_monster().standardDodgeFunc(get_player(),get_monster().distance == CombatDistance.Distant ? 25 : -50);
      }
      
      public function aimedShotCalc() : DamageRange
      {
         return new DamageRange(get_monster().reduceDamageMin(get_combat().calcWeaponDamage() * 1.5,10,true,true),get_monster().reduceDamageMax(get_combat().calcWeaponDamage() * 1.5,10,true,true),get_monster().reduceDamageCombat(get_combat().calcWeaponDamage() * 1.5,10,true,true));
      }
      
      public function aimedShot() : void
      {
         outputText("你深吸一口气，将周围的世界完全屏蔽，直到眼中只剩下你的目标和武器。你的手指轻轻抚摸着扳机。");
         if(Boolean(combatAvoidDamage(new AvoidDamageParameters(true,false,false,null,null,aimedShotChance(),null,null)).attackFailed))
         {
            if(get_monster().distance == CombatDistance.Distant)
            {
               outputText("然而，这一枪仅仅是擦肩而过，伴随着清晰的嗡嗡声呼啸而过，仁慈地免去了[themonster]遭受重创的命运。");
            }
            else
            {
               outputText("然而，你没有足够的空间来好好瞄准，导致你在试图拉开距离时打偏了。");
            }
         }
         else
         {
            outputText("伴随着致命的精准度，你的子弹命中了目标，撕裂了[themonster]并造成了巨大的伤害。[b:暴击！]");
            get_combat().doDamage(aimedShotCalc().combat,true,true);
            get_player().get_weapon().weaponXP(10 + Utils.rand(21));
         }
         get_combat().startMonsterTurn();
      }
      
      public function PCWebAttack() : void
      {
         var _loc2_:* = null as Monster;
         clearOutput();
         if(get_player().tail.venom < webbingCost())
         {
            outputText("你现在没有足够的蛛网来喷射！");
            doNext(physicalSpecials);
            return;
         }
         var _temp_1:* = get_player().tail;
         _temp_1.venom = _temp_1.venom - webbingCost();
         if(get_monster().get_short() == "lizan rogue")
         {
            outputText("当你的蛛网飞向他时，这个蜥蜴人向后翻滚，熟练地用手脚上的爪子砍断了粘稠的蛛丝。看来他很习惯应对这种战术。");
            get_combat().startMonsterTurn();
            return;
         }
         if(get_player().hasStatusEffect(StatusEffects.Blind))
         {
            outputText("你试图攻击，但你现在瞎了眼，你怀疑自己不会有太好的运气！");
         }
         else
         {
            outputText("你转过身，收紧了人类不该有的肌肉，向[themonster]喷射出一股粘稠的蛛网！");
         }
         var _loc1_:* = combatAvoidDamage(new AvoidDamageParameters(null,false,true,null,true,null,null,null));
         if(Boolean(_loc1_.attackFailed))
         {
            if(_loc1_.dodge != null)
            {
               outputText("你完全没有击中[themonster]——");
               if(get_monster().get_plural())
               {
                  outputText("他们");
               }
               else
               {
                  outputText(get_monster().mf("he","she") + "躲开了！[pg]");
               }
            }
            if(Boolean(_loc1_.block))
            {
               outputText("[Themonster]及时举起了[monster.his]盾牌，挡住了你粘稠的蛛丝！[pg]");
            }
            get_combat().startMonsterTurn();
            return;
         }
         if(get_monster().get_spe() < 1)
         {
            if(!get_monster().get_plural())
            {
               outputText("[Themonster]已经完全被蛛网覆盖了，但你还是再次向" + get_monster().mf("him","her") + "喷射了蛛网。");
            }
            else
            {
               outputText("[Themonster]已经完全被蛛网覆盖了，但你还是再次向他们喷射了蛛网。");
            }
         }
         else
         {
            if(!get_monster().get_plural())
            {
               outputText("这些粘性的丝线用束缚性的网覆盖了[themonster]，极大地减缓了" + get_monster().mf("他","她") + "的速度。");
            }
            else
            {
               outputText("这些粘性的丝线用束缚性的网覆盖了[themonster]，极大地减缓了" + get_monster().mf("他","她") + "的速度。");
            }
            _loc2_ = get_monster();
            _loc2_.set_spe(_loc2_.get_spe() - 45);
            if(get_monster().get_spe() < 0)
            {
               get_monster().set_spe(0);
            }
         }
         awardAchievement("怎么射出蛛网？",86);
         outputText("[pg]");
         get_combat().startMonsterTurn();
      }
   }
}

