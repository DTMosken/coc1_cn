package classes.scenes.combat
{
   import classes.BaseContent;
   import classes.CoC;
   import classes.CoC_Settings;
   import classes.Creature;
   import classes.DynStat;
   import classes.ImageManager;
   import classes.ItemType;
   import classes.MainViewManager;
   import classes.MasteryLib;
   import classes.Monster;
   import classes.Output;
   import classes.PerkLib;
   import classes.Player;
   import classes.ReactionContext;
   import classes.StatusEffect;
   import classes.StatusEffectType;
   import classes.StatusEffects;
   import classes._FlagDict.FlagDict_Impl_;
   import classes.display.GameViewData;
   import classes.globalFlags.KFLAGS;
   import classes.internals.Utils;
   import classes.internals._OneOf.OneOf_Impl_;
   import classes.items.Armor;
   import classes.items.ArmorLib;
   import classes.items.Consumable;
   import classes.items.ConsumableLib;
   import classes.items.Jewelry;
   import classes.items.JewelryLib;
   import classes.items.ShieldLib;
   import classes.items.Weapon;
   import classes.items.armors.VineArmor;
   import classes.scenes.Camp;
   import classes.scenes.Inventory;
   import classes.scenes.areas.desert.Scorpion;
   import classes.scenes.areas.forest.Dullahan;
   import classes.scenes.areas.forest.Kitsune;
   import classes.scenes.areas.glacialRift.FrostGiant;
   import classes.scenes.areas.volcanicCrag.CorruptedWitch;
   import classes.scenes.areas.volcanicCrag.VolcanicGolem;
   import classes.scenes.camp.TrainingDummy;
   import classes.scenes.dungeons.helDungeon.HarpyMob;
   import classes.scenes.dungeons.helDungeon.HarpyQueen;
   import classes.scenes.dungeons.lethicesKeep.DriderIncubus;
   import classes.scenes.dungeons.lethicesKeep.Lethice;
   import classes.scenes.dungeons.manor.NamelessHorror;
   import classes.scenes.monsters.StareMonster;
   import classes.scenes.npcs.Ceraph;
   import classes.scenes.npcs.Clara;
   import classes.scenes.npcs.Ember;
   import classes.scenes.npcs.GooArmor;
   import classes.scenes.npcs.Hel;
   import classes.scenes.npcs.Holli;
   import classes.scenes.npcs.Isabella;
   import classes.scenes.npcs.Kiha;
   import classes.statusEffects.combat.BrutalBlowsDebuff;
   import classes.statusEffects.combat.ConstrictedDebuff;
   import classes.statusEffects.combat.LeechBuff;
   import classes.statusEffects.combat.SeverTendonsDebuff;
   import coc.view.CoCButton;
   import coc.view.MainView;
   import flash.Boot;
   import haxe.IMap;
   import haxe.Log;
   import haxe.ds.Either;
   import haxe.ds.IntMap;
   import haxe.ds.ObjectMap;
   
   public class Combat extends BaseContent
   {
      
      public static var DAMAGE_NO_ATTACK:String = "NoAttack";
      
      public static var DAMAGE_PHYSICAL_MELEE:String = "PhysicalM";
      
      public static var DAMAGE_PHYSICAL_RANGED:String = "PhysicalR";
      
      public static var DAMAGE_MAGICAL_MELEE:String = "MagicalM";
      
      public static var DAMAGE_MAGICAL_RANGED:String = "MagicalR";
      
      public static var DAMAGE_FIRE:String = "Fire";
      
      public static var DAMAGE_ICE:String = "Ice";
      
      public static var DAMAGE_LIGHTNING:String = "Lightning";
      
      public static var PHYSICAL:int = 0;
      
      public static var MAGICAL:int = 1;
      
      public static var UNTYPED:int = 2;
      
      public var plotFight:Boolean;
      
      public var playerTurn:Boolean;
      
      public var overrideEndOfRoundFunction:Function;
      
      public var monsterDamageType:String;
      
      public var maxMonsterIndex:int;
      
      public var lustvictoryFunc:Function;
      
      public var lustlossFunc:Function;
      
      public var lastAbilityUsed:CombatAbility;
      
      public var imageText:String;
      
      public var hpvictoryFunc:Function;
      
      public var hplossFunc:Function;
      
      public var description:String;
      
      public var damageType:String;
      
      public var damageTaken:Number;
      
      public var damage:Number;
      
      public var currTarget:int;
      
      public var currMonsterIndex:int;
      
      public var currEnemy:int;
      
      public var currAbilityUsed:CombatAbility;
      
      public var combatTeases:CombatTeases;
      
      public var combatRound:int;
      
      public var combatAbilities:CombatAbilities;
      
      public var blockTurn:Boolean;
      
      public function Combat()
      {
         if(Boot.skip_constructor)
         {
            return;
         }
         overrideEndOfRoundFunction = null;
         blockTurn = false;
         maxMonsterIndex = 0;
         currMonsterIndex = 0;
         imageText = "";
         monsterDamageType = "";
         damageType = "";
         description = "";
         lustlossFunc = null;
         lustvictoryFunc = null;
         hplossFunc = null;
         hpvictoryFunc = null;
         playerTurn = true;
         currTarget = 0;
         currEnemy = 0;
         damageTaken = 0;
         damage = 0;
         combatRound = 0;
         plotFight = false;
         combatTeases = new CombatTeases();
         combatAbilities = new CombatAbilities();
         super();
         GameViewData.selectMonster = setTarget;
      }
      
      public function weaponCritical(param1:Creature, param2:Creature) : Boolean
      {
         return combatCritical(param1,param2,true);
      }
      
      public function wait() : void
      {
         FlagDict_Impl_.arrayWriteInt(KFLAGS.flags,22,1);
         var _loc1_:int = 5;
         if(get_player().hasPerk(PerkLib.SpiderBedding))
         {
            _loc1_ += 3;
         }
         if(!get_monster().hasStatusEffect(StatusEffects.Level))
         {
            get_player().changeFatigue(-_loc1_);
         }
         if(get_player().hasStatusEffect(StatusEffects.Whispered))
         {
            clearOutput();
            outputText("你摆脱了精神上的强迫，准备战斗！[pg]");
            get_player().removeStatusEffect(StatusEffects.Whispered);
         }
         else if(get_player().hasStatusEffect(StatusEffects.Stunned))
         {
            clearOutput();
            outputText("你摇摇晃晃，愣了一会儿。摇了摇头后，你清除了眼前的金星，但那时你已经错失了行动的机会。[pg]");
            get_player().removeStatusEffect(StatusEffects.Stunned);
         }
         else if(get_player().hasStatusEffect(StatusEffects.Confusion))
         {
            clearOutput();
            outputText("你摇了摇头，把记忆封存在过去，它们属于那里。现在是战斗的时候了！[pg]");
            get_player().removeStatusEffect(StatusEffects.Confusion);
         }
         else if(get_monster().reactWrapper(ReactionContext.PlayerWaited))
         {
            clearOutput();
            if(combatAbilities.canClawFist(5,FistStances.Claw))
            {
               outputText("你控制住呼吸，仔细观察敌人，准备发动攻击。[pg]");
               get_player().createStatusEffect(StatusEffects.Lurk);
            }
            else
            {
               outputText("你决定这一回合不采取任何行动。[pg]");
            }
            get_player().createStatusEffect(StatusEffects.WaitReadiness,0,0,0,0);
         }
         startMonsterTurn();
      }
      
      public function totalStatBonus(param1:Boolean = false, param2:Boolean = false) : int
      {
         var _loc4_:int = 0;
         var _loc3_:Number = 1.3;
         if(param1)
         {
            _loc4_ = getWeaponAttributeBonus();
         }
         else
         {
            _loc4_ = getArbitraryStatMod("str",_loc3_);
         }
         if(param2)
         {
            _loc4_ = doubleAttackLimit(_loc4_);
         }
         return _loc4_;
      }
      
      public function totalHP() : Number
      {
         var _loc4_:* = null as Monster;
         if(int(get_monsterArray().length) == 1)
         {
            return get_monster().get_HP();
         }
         var _loc1_:Number = 0;
         var _loc2_:int = 0;
         var _loc3_:Array = get_monsterArray();
         while(_loc2_ < int(_loc3_.length))
         {
            _loc4_ = _loc3_[_loc2_];
            _loc2_++;
            if(!(_loc4_.get_lust() >= _loc4_.maxLust() && !_loc4_.ignoreLust))
            {
               _loc1_ += _loc4_.get_HP();
            }
         }
         return _loc1_;
      }
      
      public function takeDamage(param1:Number, param2:Boolean = false) : Number
      {
         return get_player().takeDamage(param1,param2);
      }
      
      public function struggle() : void
      {
         if(get_monster().hasStatusEffect(StatusEffects.PCTailTangle))
         {
            get_monster().kitsuneStruggle();
         }
         else if(get_player().hasStatusEffect(StatusEffects.HolliConstrict))
         {
            get_monster().struggleOutOfHolli();
         }
         else if(get_monster().hasStatusEffect(StatusEffects.QueenBind))
         {
            get_monster().ropeStruggles();
         }
         else if(get_player().hasStatusEffect(StatusEffects.HarpyBind))
         {
            get_monster().harpyHordeGangBangStruggle();
         }
         else if(get_player().hasStatusEffect(StatusEffects.GooArmorBind))
         {
            get_monster().struggleAtGooBind();
         }
         else if(get_player().hasStatusEffect(StatusEffects.GiantGrabbed))
         {
            get_monster().giantGrabStruggle();
         }
         else if(get_player().hasStatusEffect(StatusEffects.CorrWitchBind))
         {
            get_monster().corrWitchStruggle();
         }
         else if(get_player().hasStatusEffect(StatusEffects.ScorpGrabbed))
         {
            get_monster().scorpStruggle();
         }
         else
         {
            get_monster().struggle();
         }
         startMonsterTurn();
      }
      
      public function startMonsterTurn() : void
      {
         if(get_player().hasStatusEffect(StatusEffects.TimeFrozen))
         {
            get_player().addStatusValue(StatusEffects.TimeFrozen,1,-1);
            if(get_player().statusEffectv1(StatusEffects.TimeFrozen) > 0)
            {
               doNext(playerMenu);
               return;
            }
            get_player().removeStatusEffect(StatusEffects.TimeFrozen);
            outputText("[pg-]你的盾牌发出另一声[i: 咔哒]声，告诉你法术已经消退，声音和动作立刻恢复了。[pg]");
         }
         if(int(getActiveEnemies().length) > 0)
         {
            afterPlayerTurn();
         }
         outputText("[pg-]");
         playerTurn = false;
         maxMonsterIndex = int(get_monsterArray().length);
         currMonsterIndex = 0;
         execMonsterAI(currMonsterIndex);
      }
      
      public function standardReduceDamage(param1:Number, param2:Number = 0, param3:Boolean = false) : DamageRange
      {
         return new DamageRange(get_monster().reduceDamageMin(param1,param2,param3),get_monster().reduceDamageMax(param1,param2,param3),get_monster().reduceDamageCombat(param1,param2,param3));
      }
      
      public function showMonsterLust() : void
      {
         if(get_monster().hasStatusEffect(StatusEffects.Constricted))
         {
            outputText("[Themonster]目前正被你的" + (get_player().get_armor() is VineArmor ? "藤蔓" : "尾巴") + "紧紧缠绕着！");
         }
         if(get_monster().hasStatusEffect(StatusEffects.NagaVenom))
         {
            if(get_monster().get_plural())
            {
               if(get_monster().statusEffectv1(StatusEffects.NagaVenom) <= 1)
               {
                  outputText("你注意到[monster.he]开始显露出虚弱的迹象，但[monster.him]似乎还有很多余力。");
               }
               else
               {
                  outputText("你注意到[monster.he]明显受到了你毒液的影响，[monster.his]动作变得不确定，[monster.his]平衡感开始消失。汗水开始在[monster.his]皮肤上流淌。你打赌[monster.he]可能开始后悔激怒你了。");
               }
            }
            else if(get_monster().statusEffectv1(StatusEffects.NagaVenom) <= 1)
            {
               outputText("你注意到[monster.he]开始显露出虚弱的迹象，但[monster.him]似乎还有很多余力。");
            }
            else
            {
               outputText("你注意到[monster.he]明显受到了你毒液的影响，[monster.his]动作变得不确定，[monster.his]平衡感开始消失。汗水开始在[monster.his]皮肤上流淌。你打赌[monster.he]可能开始后悔激怒你了。");
            }
         }
         if(get_monster().get_short() == "harpy")
         {
            if(get_monster().get_lust100() >= 45 && get_monster().get_lust100() < 70)
            {
               outputText("鹰身女妖的动作变得越来越古怪，她用疯狂的眼神扫视着你的身体，胸部晃动着，显然是发情了。");
            }
            if(get_monster().get_lust100() >= 70 && get_monster().get_lust100() < 90)
            {
               outputText("她不再那么疯狂地拍打翅膀，而是轻轻地左右摇摆，向你展示她柔软、长满羽毛的身体，甚至旋转并扬起她的尾羽，让你瞥见她那毛茸茸的、闪烁着液体的阴部。");
            }
            if(get_monster().get_lust100() >= 90)
            {
               outputText("你可以看到她的大腿上涂满了透明的液体" + (get_noFur() ? "" : "，羽毛变得暗淡且粘稠") + "，她正努力克制自己的欲望。");
            }
         }
         else if(get_monster() is Clara)
         {
            if(get_monster().get_lust100() <= 65)
            {
               outputText("她动作中的愤怒正在减弱。");
            }
            else if(get_monster().get_lust100() <= 75)
            {
               outputText("克拉拉现在似乎变得更加兴奋而不是愤怒。");
            }
            else if(get_monster().get_lust100() <= 85)
            {
               outputText("克拉拉现在呼吸沉重，她发情的迹象现在变得非常明显。");
            }
            else
            {
               outputText("看起来克拉拉的愤怒即将被她的欲望所淹没。");
            }
         }
         else if(get_monster().get_short() == "Minerva")
         {
            if(get_monster().get_lust100() < 60)
            {
               outputText("米内瓦发出一声呻吟，摇了摇头，专注于眼前的战斗。她短裤上的凸起越来越大，但塞壬无视了她越来越硬的勃起，继续战斗。");
            }
            else if(get_monster().get_lust100() < 80)
            {
               outputText("触手从她短裤的胯部蠕动出来，随着悸动的凸起越来越大，变得越来越硬……米内瓦越来越难以忽视。在凸起的正下方形成了一个潮湿的斑点。");
            }
            else
            {
               outputText("她紧紧抓住武器作为支撑，脸涨得通红，痛苦不堪。她那极短的短裤痛苦地阻挡着她颤抖的凸起，使得布料的背面像丁字裤一样勒进她的屁股里，并与她的肉棒作斗争。她的肉棒触手向四面八方猛烈抽打。潮湿的面积扩大了，并顺着她的腿流下来。");
            }
         }
         else if(get_monster().get_short() == "Cum Witch")
         {
            if(get_monster().get_lust100() < 50)
            {
               outputText("她的乳头变硬了，在她那如山般巨大的乳房上披着的长袍上顶出了两个明显的帐篷。");
            }
            else if(get_monster().get_lust100() < 75)
            {
               outputText("危险地摇晃着，你可以看到她半硬的肉棒在移动时摩擦着布料，这是她日益增长的欲望的证据。");
            }
            if(get_monster().get_lust100() >= 75)
            {
               outputText("淫秽地肿胀着，精液女巫粗壮的肉棒坚挺而骄傲地凸显出来，她移动时，球状的龟头在布料的褶皱间摩擦，留下一道道深色的污迹。");
            }
            if(get_monster().get_lust100() >= 85)
            {
               outputText("她每走一步，那些深色的污迹似乎就会扩大一倍。");
            }
            if(get_monster().get_lust100() >= 93)
            {
               outputText("毫无疑问，精液女巫正滴着先列腺液，几乎快要屈服了。见鬼，她长袍的下半截正慢慢变成一团沾满精液的烂摊子。");
            }
            if(get_monster().get_lust100() >= 70)
            {
               outputText("只要一有空当，她就不停地舔着嘴唇，而且呼吸似乎变得非常急促。");
            }
         }
         else if(get_monster().get_short() == "Kelt")
         {
            if(get_monster().get_lust100() < 50)
            {
               outputText("在他悲惨的一生中，凯尔特似乎难得地失去了性趣。他的阳具相当疲软地下垂着。");
            }
            else if(get_monster().get_lust100() < 60)
            {
               outputText("凯尔特的胯下变得有些坚挺，但他似乎仍然专注于把你打倒。");
            }
            else if(get_monster().get_lust100() < 70)
            {
               outputText("凯尔特的阳具已经长到了最大尺寸，龟头边缘甚至微微膨胀。它随着他的每一个动作上下摆动，提醒着他你让他有多么兴奋。");
            }
            else if(get_monster().get_lust100() < 80)
            {
               outputText("此时的凯尔特毫不掩饰他的兴奋。他的皮肤泛红，阳具勃起，下面已经开始渗出一小滴先列腺液。");
            }
            else if(get_monster().get_lust100() < 90)
            {
               outputText("凯尔特似乎很难集中注意力。他不断停下来展示肌肉，把肉棒拍打在肚子上，当先列腺液涂抹在他马一样的下腹部时，他发出了呻吟。");
            }
            else
            {
               outputText("毫无疑问，你对凯尔特产生了很大的影响。他不停地烦躁扭动，到处滴落着先列腺液，同时试图维持着与你战斗的表象。他的阳具不断地抽搐和摆动，弄得一团糟。他离屈服只有一步之遥了……");
            }
         }
         else if(get_monster().get_short() == "green slime")
         {
            if(get_monster().get_lust100() >= 45 && get_monster().get_lust100() < 65)
            {
               outputText("在这个身影躯干的底部，也就是它的胯部，开始形成一个肿块。");
            }
            if(get_monster().get_lust100() >= 65 && get_monster().get_lust100() < 85)
            {
               outputText("史莱姆躯干底部有一个明显的肿块在跳动，仿佛这生物体内有什么东西试图逃出来。");
            }
            if(get_monster().get_lust100() >= 85 && get_monster().get_lust100() < 93)
            {
               outputText("一根像小手臂一样粗长的柱状物从史莱姆躯干底部突了出来。");
            }
            if(get_monster().get_lust100() >= 93)
            {
               outputText("一根像小手臂一样粗长的柱状物从史莱姆躯干底部突了出来。它的整个身体都在跳动，显然开始失去凝聚力。");
            }
         }
         else if(get_monster().get_short() == "Sirius, a naga hypnotist")
         {
            if(get_monster().get_lust100() >= 40)
            {
               outputText("你可以看到他爬虫类阳具的顶端从保护性的裂缝中探了出来。");
            }
            else if(get_monster().get_lust100() >= 60)
            {
               outputText("他的肉棒现在完全暴露出来，处于半勃起状态，但不知为何，他仍然盯着你的眼睛，脸上毫无表情。");
            }
            else
            {
               outputText("他的肉棒剧烈地跳动着，你觉得他很快就会射出来。然而他的脸依然面无表情……尽管额头上已经渗出了汗珠。");
            }
         }
         else if(get_monster().get_short() == "kitsune")
         {
            if(get_monster().get_lust100() > 30 && get_monster().get_lust100() < 50)
            {
               outputText("狐妖的脸微微泛红。她用手给自己扇风，紧紧地盯着你。");
            }
            else if(get_monster().get_lust100() > 30 && get_monster().get_lust100() < 75)
            {
               outputText("狐妖的脸颊呈现出明亮的粉红色，你可以看到她摩擦着双腿，因情欲而扭动着。");
            }
            else if(get_monster().get_lust100() > 30)
            {
               if(get_monster().hair.color == "red")
               {
                  outputText("狐妖毫不掩饰她的情欲，无法隐藏她长袍下明显的凸起，她似乎在努力克制自己不要在这里就直接抚摸它。");
               }
               else
               {
                  outputText("狐妖毫不掩饰她的情欲，频繁地舔着嘴唇，拼命想掩盖顺着腿流下的液体。");
               }
            }
         }
         else if(get_monster().get_short() == "demons")
         {
            if(get_monster().get_lust100() > 30 && get_monster().get_lust100() < 60)
            {
               outputText("恶魔们的攻击强度有所减弱，有些甚至在攻击你时打量着你的身体部位。");
            }
            if(get_monster().get_lust100() >= 60 && get_monster().get_lust100() < 80)
            {
               outputText("恶魔们显然在避免伤害你任何可以用来操的部位，而且每次攻击后，他们的手在你身上停留的时间开始变长。有些恶魔开始用另一只手快速地摸索，你可以闻到空气中弥漫着十几个身体散发出的恶魔情欲的味道。");
            }
            if(get_monster().get_lust100() >= 80)
            {
               outputText("恶魔们越来越不愿意打你，反而越来越愿意只是用手在你身上性感地抚摸。空气中弥漫着浓烈的恶魔情欲的味道，队伍中的一部分人只是站在那里公然地抚摸自己。");
            }
         }
         else if(get_monster().get_plural())
         {
            if(get_monster().get_lust100() > 50 && get_monster().get_lust100() < 60)
            {
               outputText("[Themonster]的皮肤依然泛着情欲初起的红晕。");
            }
            if(get_monster().get_lust100() >= 60 && get_monster().get_lust100() < 70)
            {
               outputText("[Themonster]的眼睛不断地扫过你最性感的部位，暴露了[monster.his]的欲望。");
            }
            if(int(get_monster().cocks.length) > 0)
            {
               if(get_monster().get_lust100() >= 70 && get_monster().get_lust100() < 85)
               {
                  outputText("[Themonster]因为[monster.his]腹股沟处坚硬的凸起而行动困难。");
               }
               if(get_monster().get_lust100() >= 85)
               {
                  outputText("[Themonster]喘着粗气，轻声呜咽着，每一个动作似乎都让[monster.his]的凸起更加明显。你觉得[monster.he]坚持不了多久了。");
               }
            }
            if(int(get_monster().vaginas.length) > 0)
            {
               if(get_monster().get_lust100() >= 70 && get_monster().get_lust100() < 85)
               {
                  outputText("[Themonster]显然被激起了性欲，你可以闻到空气中弥漫着[monster.his]情欲的味道。");
               }
               if(get_monster().get_lust100() >= 85)
               {
                  outputText("[Themonster]的" + get_monster().vaginaDescript() + "几乎被他们淫荡的分泌物浸透了。");
               }
            }
         }
         else
         {
            if(get_monster().get_lust100() > 50 && get_monster().get_lust100() < 60)
            {
               outputText("[Themonster]的皮肤依然泛着情欲初起的红晕。");
            }
            if(get_monster().get_lust100() >= 60 && get_monster().get_lust100() < 70)
            {
               outputText("[Themonster]的眼睛不断地扫过你最性感的部位，暴露了[monster.his]的欲望。");
            }
            if(int(get_monster().cocks.length) > 0)
            {
               if(get_monster().get_lust100() >= 70 && get_monster().get_lust100() < 85)
               {
                  outputText("[Themonster]因为[monster.his]腹股沟处坚硬的凸起而行动困难。");
               }
               if(get_monster().get_lust100() >= 85)
               {
                  outputText("[Themonster]喘着粗气，发出轻柔的呜咽声，[monster.his]每一次动作似乎都让[monster.his]隆起更加明显。你觉得[monster.he]坚持不了多久了。");
               }
            }
            if(int(get_monster().vaginas.length) > 0)
            {
               if(get_monster().get_lust100() >= 70 && get_monster().get_lust100() < 85)
               {
                  outputText("[Themonster]显然被激起了性欲，你能在空气中闻到[monster.his]发情的味道。");
               }
               if(get_monster().get_lust100() >= 85)
               {
                  outputText("[Themonster]的" + get_monster().vaginaDescript() + "几乎被她淫荡的分泌物浸透了。");
               }
            }
         }
      }
      
      public function set_inCombat(param1:Boolean) : Boolean
      {
         return get_game().set_inCombat(param1);
      }
      
      public function setUpCombatEnvironment(param1:Boolean = false, param2:Boolean = true) : void
      {
         var _loc3_:* = null as String;
         var _loc6_:* = null as Monster;
         combatRound = 0;
         plotFight = param1;
         get_mainView().hideMenuButton("data");
         get_mainView().hideMenuButton("appearance");
         get_mainView().hideMenuButton("level");
         get_mainView().hideMenuButton("perks");
         get_mainView().hideMenuButton("stats");
         showStats();
         set_inCombat(true);
         combatAbilities.fireMagicLastTurn = -100;
         combatAbilities.fireMagicCumulated = 0;
         combatAbilities.flurryAmount = 1;
         currMonsterIndex = 0;
         maxMonsterIndex = 0;
         currTarget = 0;
         get_combatRangeData().resetDistance();
         combatAbilities.setSpells();
         if(get_monsterArray()[0].imageName != "")
         {
            _loc3_ = "monster-" + get_monsterArray()[0].imageName;
            imageText = _loc3_;
         }
         else
         {
            imageText = "";
         }
         var _loc4_:int = 0;
         var _loc5_:Array = get_monsterArray();
         while(_loc4_ < int(_loc5_.length))
         {
            _loc6_ = _loc5_[_loc4_];
            _loc4_++;
            if(_loc6_.get_armorDef() <= 10)
            {
               _loc6_.set_armorDef(0);
            }
            else
            {
               _loc6_.set_armorDef(_loc6_.get_armorDef() - 10);
            }
            if(!get_player().isResetAscension())
            {
               _loc6_.set_str(_loc6_.get_str() + 25 * get_player().newGamePlusMod());
               _loc6_.set_tou(_loc6_.get_tou() + 25 * get_player().newGamePlusMod());
               _loc6_.set_spe(_loc6_.get_spe() + 25 * get_player().newGamePlusMod());
               _loc6_.set_inte(_loc6_.get_inte() + 25 * get_player().newGamePlusMod());
               _loc6_.level += 30 * get_player().newGamePlusMod();
               if(get_player().newGamePlusMod() == 1)
               {
                  _loc6_.lustVuln *= 0.8;
               }
               else if(get_player().newGamePlusMod() == 2)
               {
                  _loc6_.lustVuln *= 0.65;
               }
               else if(get_player().newGamePlusMod() == 3)
               {
                  _loc6_.lustVuln *= 0.5;
               }
               else if(get_player().newGamePlusMod() >= 4)
               {
                  _loc6_.lustVuln *= 0.4;
               }
            }
            _loc6_.set_HP(_loc6_.maxHP());
            _loc6_.XP = _loc6_.totalXP();
            if(get_player().hasPerk(PerkLib.Precision) && get_player().get_inte() >= 25)
            {
               if(_loc6_.get_armorDef() <= 10)
               {
                  _loc6_.set_armorDef(0);
               }
               else
               {
                  _loc6_.set_armorDef(_loc6_.get_armorDef() - 10);
               }
            }
         }
         if(get_player().hasPerk(PerkLib.WellspringOfLust) && get_player().get_lust() < 50)
         {
            get_player().set_lust(50);
         }
         if(get_player().hasPerk(PerkLib.Spellsword) && get_player().perkv1(PerkLib.Spellsword) == 0)
         {
            if(get_player().usingMagicBW() && get_player().get_lust100() < combatAbilities.getWhiteMagicLustCap() && get_player().hasStatusEffect(StatusEffects.KnowsCharge))
            {
               combatAbilities.chargeWeaponSilent();
            }
            if(get_player().usingMagicTF() && get_player().hasPerk(PerkLib.TerrestrialFire) && get_player().masteryLevel(MasteryLib.TerrestrialFire) >= 2)
            {
               combatAbilities.tfInflameApply();
            }
         }
         if(get_player().usingMagicBW() && get_player().hasPerk(PerkLib.Battlemage) && get_player().get_lust() >= 50 && get_player().perkv1(PerkLib.Battlemage) == 0)
         {
            combatAbilities.spellMightApply();
         }
         get_player().get_weapon().set_currentAmmo(get_player().get_weapon().get_ammoMax());
         if(param2)
         {
            doNext(playerMenu);
         }
         else
         {
            playerMenu();
         }
      }
      
      public function setTarget(param1:int) : void
      {
         if(int(get_monsterArray().length) > 1 && canTarget(param1) && playerTurn)
         {
            multiAttack(param1);
         }
      }
      
      public function runAway() : void
      {
         clearOutput();
         get_monster().get_onPcRunAttempt()();
      }
      
      public function removeMonster(param1:int, param2:int) : void
      {
         get_game().monsterArray[1].set_HP(0);
         get_game().monsterArray[2].set_HP(0);
         get_game().monsterArray[3].set_HP(0);
         currTarget = 0;
         maxMonsterIndex -= param2;
         get_game().monsterArray.splice(param1,param2);
      }
      
      public function removeDownedTempMonsters() : void
      {
         if(int(get_monsterArray().length) == 1)
         {
            return;
         }
         var _loc1_:int = 0;
         while(_loc1_ < int(get_monsterArray().length))
         {
            if((get_monsterArray()[_loc1_].get_HP() <= 0 || get_monsterArray()[_loc1_].get_lust() >= get_monsterArray()[_loc1_].maxLust() && !get_monsterArray()[_loc1_].ignoreLust) && get_monsterArray()[_loc1_].temporary)
            {
               get_monsterArray().splice(_loc1_,1);
               if(currTarget == _loc1_)
               {
                  currTarget = 0;
               }
            }
            _loc1_++;
         }
      }
      
      public function regeneration(param1:Boolean = true) : void
      {
         var _loc4_:* = null as Monster;
         get_player().regeneration(param1);
         var _loc2_:int = 0;
         var _loc3_:Array = get_monsterArray();
         while(_loc2_ < int(_loc3_.length))
         {
            _loc4_ = _loc3_[_loc2_];
            _loc2_++;
            get_monster().regeneration(param1,true);
         }
      }
      
      public function performRegularAttack(param1:int) : Boolean
      {
         var _loc2_:int = calcWeaponDamage(get_player().isDoubleAttacking());
         return performAttack(_loc2_,param1);
      }
      
      public function performAttack(param1:Number, param2:int = 0, param3:Boolean = false, param4:Number = 0, param5:Boolean = false) : Boolean
      {
         var _loc9_:Number = NaN;
         damage = param1;
         var _loc6_:Number = hitChance(!param5 ? param2 : 0);
         if(!get_player().get_weapon().preAttack())
         {
            return false;
         }
         if(!get_monster().reactWrapper(ReactionContext.BeforeAttacked))
         {
            return false;
         }
         get_player().get_weapon().weaponXP(2 + Utils.rand(7));
         var _loc7_:* = combatAvoidDamage(new AvoidDamageParameters(null,null,null,null,true,_loc6_,get_player(),get_monster()));
         if(_loc7_.dodge != null && get_player().statusEffectv1(StatusEffects.CounterAB) != 1)
         {
            if(get_monster().get_short() == "Akbal")
            {
               outputText("阿克巴尔动如闪电，在你狂怒的攻击中穿梭自如，展现出与他美洲豹身躯相称的速度和优雅。");
            }
            else if(get_monster().get_short() == "plain girl")
            {
               outputText("你耐心地等待对手露出破绽。她俯身打出一记右勾拳，你翻滚躲开，然后用你的[weapon]狠狠地击中她的侧腹。令人惊讶的是，攻击似乎直接穿透了她，没有对她造成丝毫影响。你低头看着你的[weapon]，仿佛被背叛了一样。");
            }
            else if(get_monster().get_short() == "kitsune")
            {
               outputText("你凶猛地挥舞着你的[weapon]，确信能造成致命一击。令你惊讶的是，当攻击直接穿过她时，你尴尬地踉跄了一下——那是幻影！当你听到身后传来咯咯的笑声时，你咒骂了一声，转身再次面对她。");
            }
            else
            {
               get_player().get_weapon().describeAttack({"attackResult":_loc7_});
               if(get_player().hasPerk(PerkLib.Scattering))
               {
                  outputText("你的[weapon]的散射攻击成功地对[themonster]造成了伤害！");
                  damage = doDamage(damage * get_player().perkv1(PerkLib.Scattering),true,true,true,param2 == 0);
               }
            }
            get_player().get_weapon().weaponXP(1 + Utils.rand(4));
            return true;
         }
         if(get_monster().hasStatusEffect(StatusEffects.Earthshield) && Utils.rand(4) == 0)
         {
            outputText("你的攻击被沙土和岩石组成的墙壁弹开了！该死！");
            return true;
         }
         if(Boolean(_loc7_.block) ? Boolean(_loc7_.block) : Boolean(_loc7_.parry))
         {
            get_player().get_weapon().describeAttack({"attackResult":_loc7_});
            return true;
         }
         if(get_player().get_weapon().isUnarmed() && get_player().hasPerk(PerkLib.WarDance))
         {
            damage *= 1.15;
         }
         var _loc8_:Boolean = false;
         _loc8_ = weaponCritical(get_player(),get_monster()) || param3;
         if(_loc8_ && get_inCombat())
         {
            _loc9_ = 1.75;
            _loc9_ *= get_player().getBonusStatMultiplicative("暴击伤害");
            damage *= _loc9_;
         }
         if(get_player().statusEffectv2(StatusEffects.CounterAB) == 3)
         {
            damage *= 0.75;
         }
         damage = Math.round(get_monster().reduceDamage(damage,get_player(),0,false,false,false,false,true));
         if(!get_monster().reactWrapper(ReactionContext.WhenAttacked))
         {
            return false;
         }
         if(damage <= 0)
         {
            damage = 0;
         }
         else
         {
            damage = doDamage(damage,true,false,true,param2 == 0);
         }
         get_player().get_weapon().describeAttack({
            "damage":int(damage),
            "crit":_loc8_,
            "target":get_monster()
         });
         if(get_player().hasPerk(PerkLib.BrutalBlows) && get_player().get_str() > 75 && !isWieldingRangedWeapon())
         {
            if(get_monster().get_armorDef() > 0)
            {
               outputText("\n你的攻击如此残暴，以至于你破坏了[themonster]的防御！");
            }
            get_monster().createOrFindStatusEffect(StatusEffects.BrutalBlows).applyEffect(1);
         }
         if(get_player().hasPerk(PerkLib.SeverTendons) && Utils.rand(100) <= 25)
         {
            outputText("\n你的精准攻击部分瘫痪了[themonster]，对[monster.his]力量和速度造成了永久伤害！");
            get_monster().createOrFindStatusEffect(StatusEffects.SeverTendons).applyEffect(5);
         }
         if(damage > 0)
         {
            get_player().get_weapon().execEffect();
            if(get_player().hasStatusEffect(StatusEffects.Leeching))
            {
               get_player().createOrFindStatusEffect(StatusEffects.Leeching).applyEffect(int(damage));
            }
         }
         if(get_player().get_weapon().isKatana() && get_monster().get_HP() <= 0 && get_player().statusEffectv1(StatusEffects.CounterAB) == 1)
         {
            awardAchievement("复仇反击",278);
         }
         if(!get_monster().reactWrapper(ReactionContext.AfterAttacked) || !get_monster().reactWrapper(ReactionContext.AfterDamaged))
         {
            return false;
         }
         return true;
      }
      
      public function packAttack() : void
      {
         var _loc2_:int = 0;
         var _loc1_:* = combatAvoidDamage(new AvoidDamageParameters(true,false,false,null,null,null,get_monster(),get_player()));
         if(_loc1_.dodge == get_player().EVASION_SPEED)
         {
            outputText("你闪转腾挪，躲避攻击。尽管恶魔群拼尽全力，却只打到了空气和彼此。");
         }
         else if(_loc1_.dodge == get_player().EVASION_EVADE)
         {
            outputText("利用你躲避攻击的技巧，你预判并侧步躲开了[themonster]的攻击。");
         }
         else if(_loc1_.dodge == get_player().EVASION_MISDIRECTION)
         {
            outputText("利用拉斐尔的教导，你预判并侧步躲开了[themonster]的攻击。");
         }
         else if(_loc1_.dodge == get_player().EVASION_FLEXIBILITY)
         {
            outputText("凭借你惊人的柔韧性，你挤出了[themonster]的攻击范围。");
         }
         else if(_loc1_.dodge != null)
         {
            outputText("你闪转腾挪，躲避攻击。尽管恶魔群拼尽全力，却只打到了空气和彼此。");
         }
         else
         {
            _loc2_ = get_player().reduceDamage(get_monster().get_str() + get_monster().get_weaponAttack(),get_monster());
            if(_loc2_ <= 0)
            {
               _loc2_ = 0;
               if(!get_monster().get_plural())
               {
                  outputText("你格挡并弹开了[themonster]向你发起的每一次" + Utils.cnName(get_monster().get_weaponVerb()) + "。");
               }
               else
               {
                  outputText("你弹开了[themonster]的" + Utils.cnName(get_monster().get_weaponVerb()) + "。");
               }
            }
            else
            {
               if(_loc2_ <= 5)
               {
                  outputText("你被[themonster]擦伤了！");
               }
               else if(_loc2_ <= 10)
               {
                  outputText("[Themonster]击伤了你！");
               }
               else if(_loc2_ <= 20)
               {
                  outputText("[Themonster]用[monster.his]" + Utils.cnName(get_monster().get_weaponVerb()) + "的力量使你踉跄！");
               }
               else
               {
                  outputText("[Themonster]用强有力的拳头和" + Utils.cnName(get_monster().get_weaponVerb()) + "<b>重创</b>了你！");
               }
               takeDamage(_loc2_,true);
            }
            statScreenRefresh();
            outputText("\n");
         }
      }
      
      public function normalAttack() : void
      {
         clearOutput();
         if(get_monster().distance == CombatDistance.Distant && combatAbilities.canFist(5,FistStances.Brawler))
         {
            get_player().changeStatusValue(StatusEffects.BrawlerStance,1,1);
         }
         if(get_player().hasStatusEffect(StatusEffects.Lurk))
         {
            get_player().changeStatusValue(StatusEffects.Lurk,1,1);
         }
         attack();
      }
      
      public function multiAttack(param1:int, param2:Boolean = true) : void
      {
         currTarget = param1;
         set_monster(get_monsterArray()[currTarget]);
         if(param2)
         {
            combatMenu(false);
         }
      }
      
      public function lustVictory() : Boolean
      {
         var _loc3_:* = null as Monster;
         if(int(get_monsterArray().length) == 1)
         {
            if(get_monster().get_lust() >= get_monster().maxLust())
            {
               return !get_monster().ignoreLust;
            }
            return false;
         }
         var _loc1_:int = 0;
         var _loc2_:Array = get_monsterArray();
         while(_loc1_ < int(_loc2_.length))
         {
            _loc3_ = _loc2_[_loc1_];
            _loc1_++;
            if(_loc3_.get_lust() < _loc3_.maxLust() || _loc3_.ignoreLust)
            {
               return false;
            }
         }
         return true;
      }
      
      public function lustAttack() : void
      {
         if(get_player().get_lust() < 35)
         {
            outputText("[monster.short]紧紧地贴着你，虽然它们没有击中你，但它们皮肤摩擦你皮肤的感觉非常色情。");
         }
         else if(get_player().get_lust() < 65)
         {
            outputText("[monster.short]那汗津津、充满诱惑的身体在你身上摩擦，这种感觉令人无比兴奋，你感觉到你的");
            if(int(get_player().cocks.length) > 0)
            {
               outputText("[cocks]变硬了");
            }
            else if(int(get_player().vaginas.length) > 0)
            {
               outputText(get_player().vaginaDescript(0) + "变得更湿了");
            }
            else
            {
               outputText("胯部微微发热，尽管那里什么都没有，");
            }
            outputText("以此来回应这些摩擦。");
         }
         else
         {
            outputText("当[monster.short]在你周围转悠时，它们的身体不断地在你身上摩擦，你越来越难以将注意力集中在战斗上，也难以忍住不去触摸那些滑过你身边的、润滑良好的阴茎或小穴。你下意识地将你的");
            if(get_player().get_gender() == 1)
            {
               outputText("[cocks]移向最近的、诱人的洞穴。");
            }
            if(get_player().get_gender() == 2)
            {
               outputText(get_player().vaginaDescript(0) + "移向最近的、摇晃的阴茎。");
            }
            if(get_player().get_gender() == 3)
            {
               outputText("发胀的阴茎和饥渴的小穴移向最近的、愿意操它的东西。");
            }
            if(get_player().get_gender() == 0)
            {
               outputText("腹股沟，然后你才想起那里没有任何可以抚摸的东西。");
            }
         }
         var _loc1_:int = int(10 + get_player().sens / 10);
         get_player().takeLustDamage(_loc1_,true);
      }
      
      public function isWieldingRangedWeapon() : Boolean
      {
         if(get_player().get_weapon().getAttackRange() == CombatRange.Ranged)
         {
            return true;
         }
         return false;
      }
      
      public function isPlayerStunned(param1:Boolean) : Boolean
      {
         var _loc2_:Boolean = false;
         if(!param1)
         {
            return false;
         }
         if(get_player().hasStatusEffect(StatusEffects.IsabellaStunned) || get_player().hasStatusEffect(StatusEffects.Stunned))
         {
            outputText("\n<b>你被击晕了，无法攻击！</b>你现在唯一能做的就是等待并尝试恢复！");
            _loc2_ = true;
         }
         if(get_player().hasStatusEffect(StatusEffects.Whispered))
         {
            outputText("\n<b>你的脑子太乱了，无法集中精力战斗！</b>你现在唯一能做的就是尝试恢复！");
            _loc2_ = true;
         }
         if(get_player().hasStatusEffect(StatusEffects.Confusion))
         {
            outputText("\n<b>你太困惑了</b>，甚至不知道自己是谁，根本无法尝试攻击！");
            _loc2_ = true;
         }
         if(get_player().hasStatusEffect(StatusEffects.Revelation))
         {
            if(get_player().statusEffectv1(StatusEffects.Resolve) == 8 || Utils.rand(3) == 0)
            {
               outputText("\n你的脑海中充斥着试图粉碎你理智的诡异启示，但你坚强地站着，继续战斗！");
            }
            else
            {
               outputText("\n传授给你的知识太多了，你无法承受！你无法行动！");
               _loc2_ = true;
            }
         }
         if(get_player().statusEffectv1(StatusEffects.Resolve) == 8 && Utils.rand(4) == 0)
         {
            outputText("\n绝望。这个任务完全没有希望！<b>你懒得攻击了！</b>");
            _loc2_ = true;
         }
         if(get_player().statusEffectv1(StatusEffects.Resolve) == 7 && _loc2_)
         {
            outputText("[pg]你摆脱了眩晕，将注意力集中在敌人身上。<b>你不会屈服于软弱！</b>");
            if(get_player().hasStatusEffect(StatusEffects.Confusion))
            {
               get_player().removeStatusEffect(StatusEffects.Confusion);
            }
            if(get_player().hasStatusEffect(StatusEffects.IsabellaStunned))
            {
               get_player().removeStatusEffect(StatusEffects.IsabellaStunned);
            }
            if(get_player().hasStatusEffect(StatusEffects.Stunned))
            {
               get_player().removeStatusEffect(StatusEffects.Stunned);
            }
            if(get_player().hasStatusEffect(StatusEffects.Whispered))
            {
               get_player().removeStatusEffect(StatusEffects.Whispered);
            }
         }
         return _loc2_;
      }
      
      public function isPlayerBound() : Boolean
      {
         var _loc7_:* = null as StatusEffectType;
         var _loc8_:* = null as String;
         var _loc9_:* = null as StatusEffectType;
         var _loc10_:* = null as StatusEffectType;
         var _loc11_:* = null as String;
         var _loc1_:IMap = new ObjectMap();
         _loc1_[StatusEffects.HarpyBind] = "";
         _loc1_[StatusEffects.GooBind] = "";
         _loc1_[StatusEffects.TentacleBind] = "";
         _loc1_[StatusEffects.NagaBind] = "";
         _loc1_[StatusEffects.HolliConstrict] = "";
         _loc1_[StatusEffects.GooArmorBind] = "";
         _loc1_[StatusEffects.MinotaurEntangled] = "\n<b>你被牛头怪领主的锁链绑住了！你现在唯一能做的就是努力挣脱！</b>";
         _loc1_[StatusEffects.YamataEntwine] = "你被八岐蛇一般的头发缠住了。你现在唯一能做的就是努力挣脱！[pg]";
         _loc1_[StatusEffects.UBERWEB] = "";
         _loc1_[StatusEffects.Bound] = "";
         _loc1_[StatusEffects.Chokeslam] = "";
         _loc1_[StatusEffects.Titsmother] = "";
         _loc1_[StatusEffects.GiantGrabbed] = "\n<b>你被困在巨人的手里了！你现在唯一能做的就是努力挣脱！</b>";
         _loc1_[StatusEffects.CorrWitchBind] = "\n<b>你被女巫的身体压制住了！你现在唯一能做的就是努力压倒她！</b>";
         _loc1_[StatusEffects.Tentagrappled] = "\n<b>恶魔的触手紧紧缠住了你的四肢！</b>";
         _loc1_[StatusEffects.ScorpGrabbed] = "";
         _loc1_[StatusEffects.Grappled] = "";
         var _loc2_:IMap = _loc1_;
         var _loc3_:Boolean = false;
         if(get_monster() is Lethice && get_player().statusEffectv3(StatusEffects.LethicesRapeTentacles) != 0)
         {
            outputText("\n<b>莉希丝的触手紧紧抓住了你的四肢！</b>");
            _loc3_ = true;
         }
         if(get_monster().hasStatusEffect(StatusEffects.QueenBind) || get_monster().hasStatusEffect(StatusEffects.PCTailTangle))
         {
            _loc3_ = true;
         }
         var _loc4_:IMap = _loc2_;
         var _loc5_:IMap = _loc4_;
         var _loc6_:* = _loc4_.keys();
         while(Boolean(_loc6_.hasNext()))
         {
            _loc7_ = _loc6_.next();
            _loc8_ = _loc5_.get(_loc7_);
            _loc9_ = _loc7_;
            _loc10_ = _loc9_;
            _loc11_ = _loc8_;
            if(get_player().hasStatusEffect(_loc10_))
            {
               outputText(_loc11_);
               _loc3_ = true;
            }
         }
         return _loc3_;
      }
      
      public function hitChance(param1:int = 0) : Number
      {
         var _loc2_:Number = get_monster().standardDodgeFunc(get_player());
         _loc2_ -= param1 * 20;
         _loc2_ += get_player().get_weapon().masteryLevel();
         if(get_player().get_weapon().isUnarmed())
         {
            _loc2_ += get_player().get_weapon().masteryLevel();
            if(get_player().hasPerk(PerkLib.WarDance))
            {
               _loc2_ += 20;
            }
         }
         return _loc2_;
      }
      
      public function globalMod(param1:Number) : Number
      {
         if(get_player().statusEffectv1(StatusEffects.Resolve) == 5)
         {
            param1 *= get_player().statusEffectv2(StatusEffects.Resolve);
         }
         if(get_player().statusEffectv1(StatusEffects.Resolve) == 6)
         {
            param1 *= get_player().statusEffectv2(StatusEffects.Resolve);
         }
         var _loc2_:StatusEffect = get_player().statusEffectByType(StatusEffects.UmasMassage);
         if(_loc2_ != null)
         {
            if(_loc2_.value1 == 4)
            {
               param1 *= _loc2_.value2;
            }
         }
         if(get_monster().hasPerk(PerkLib.Invincible))
         {
            param1 = 0;
         }
         if(get_player().hasStatusEffect(StatusEffects.Nothingness) && (damageType == "PhysicalM" || damageType == "PhysicalR"))
         {
            param1 = 0;
         }
         param1 *= get_player().getBonusStatMultiplicative("全局伤害");
         return Math.round(param1);
      }
      
      public function get_inCombat() : Boolean
      {
         return get_game().get_inCombat();
      }
      
      public function getWeaponAttributeBonus() : int
      {
         var _loc1_:int = 0;
         if(isWieldingRangedWeapon())
         {
            if(get_player().get_weapon().isChanneling())
            {
               damageType = "MagicalR";
               _loc1_ = int(Math.round(get_player().get_inte() + get_player().get_spe() * 0.1));
            }
            else
            {
               damageType = "PhysicalR";
               _loc1_ = int(Math.round(get_player().get_spe() + get_player().get_inte() * 0.2));
            }
         }
         else
         {
            damageType = "PhysicalM";
            _loc1_ = int(Math.round(get_player().get_str()));
            if(get_player().get_weapon().isLarge())
            {
               _loc1_ = int(Math.round(_loc1_ * 1.3));
            }
         }
         return _loc1_;
      }
      
      public function getNumAttacks() : int
      {
         if(get_player().isDoubleAttacking())
         {
            return 2;
         }
         return 1;
      }
      
      public function getLustText(param1:Number) : String
      {
         return " <b>(<font color=\"" + get_mainViewManager().colorLustPlus() + "\">" + int(Math.round(param1)) + "</font>)</b>";
      }
      
      public function getLowestLivingTarget() : Number
      {
         var _loc1_:int = 0;
         while(_loc1_ < int(get_monsterArray().length))
         {
            if(get_monsterArray()[_loc1_].get_HP() > 0 && !get_monsterArray()[_loc1_].hasStatusEffect(StatusEffects.GuardAB) && (get_monsterArray()[_loc1_].get_lust() < get_monsterArray()[_loc1_].maxLust() || get_monsterArray()[_loc1_].ignoreLust))
            {
               return _loc1_;
            }
            _loc1_++;
         }
         return _loc1_;
      }
      
      public function getHealText(param1:Number) : String
      {
         var _loc2_:String = get_mainViewManager().colorHpPlus();
         if(param1 == 0)
         {
            _loc2_ = get_mainViewManager().colorHpNeutral();
         }
         if(param1 < 0)
         {
            _loc2_ = get_mainViewManager().colorHpMinus();
         }
         return " <b>(<font color=\"" + _loc2_ + "\">" + int(Math.round(param1)) + "</font>)</b>";
      }
      
      public function getDamageText(param1:Number) : String
      {
         var _loc2_:String = null;
         if(param1 > 0)
         {
            _loc2_ = get_mainViewManager().colorHpMinus();
         }
         if(param1 == 0)
         {
            _loc2_ = get_mainViewManager().colorHpNeutral();
         }
         if(param1 < 0)
         {
            _loc2_ = get_mainViewManager().colorHpPlus();
         }
         return " <b>(<font color=\"" + _loc2_ + "\">" + int(Math.round(param1)) + "</font>)</b>";
      }
      
      public function getBonusItem() : ItemType
      {
         var _loc1_:ItemType = null;
         if(FlagDict_Impl_.arrayReadString(KFLAGS.flags,234) != "")
         {
            _loc1_ = ItemType.lookupItem(FlagDict_Impl_.arrayReadString(KFLAGS.flags,234));
            FlagDict_Impl_.arrayWriteString(KFLAGS.flags,234,"");
         }
         return _loc1_;
      }
      
      public function getAttackBlockReason() : String
      {
         if(!get_combatRangeData().canReach(get_player(),get_monster(),get_monster().distance,get_player().get_weapon().getAttackRange()))
         {
            return "你无法用普通攻击够到目标！";
         }
         if(get_player().isAtrophied)
         {
            return "你萎缩了，无法攻击！";
         }
         return "你无法攻击！";
      }
      
      public function getArbitraryStatMod(param1:String, param2:Number = 1) : int
      {
         var _loc3_:String = param1.toLowerCase();
         if(_loc3_ == "int")
         {
            return int(Math.round(get_player().get_inte() * param2));
         }
         if(_loc3_ == "spe")
         {
            return int(Math.round(get_player().get_spe() * param2));
         }
         if(_loc3_ == "str")
         {
            return int(Math.round(get_player().get_str() * param2));
         }
         if(_loc3_ == "tou")
         {
            return int(Math.round(get_player().get_tou() * param2));
         }
         return 0;
      }
      
      public function getActiveEnemies() : Array
      {
         var _loc3_:Boolean = false;
         var _loc4_:Boolean = false;
         var _loc1_:Array = [];
         var _loc2_:int = 0;
         while(_loc2_ < int(get_monsterArray().length))
         {
            _loc3_ = get_monsterArray()[_loc2_].get_HP() <= 0;
            _loc4_ = get_monsterArray()[_loc2_].get_lust() >= get_monsterArray()[_loc2_].maxLust() && !get_monsterArray()[_loc2_].ignoreLust;
            if(!_loc3_ && !_loc4_)
            {
               _loc1_.push(get_monsterArray()[_loc2_]);
            }
            _loc2_++;
         }
         return _loc1_;
      }
      
      public function generalDamageCalc(param1:Boolean = false, param2:int = 0, param3:Boolean = false, param4:int = 2, param5:int = 0, param6:Number = 1) : int
      {
         var _loc7_:Number = param2;
         var _loc8_:Number = totalStatBonus(param1,param3);
         _loc7_ += _loc8_;
         if(_loc7_ < 10)
         {
            _loc7_ = 10;
         }
         _loc7_ += param5;
         switch(param4)
         {
            case 0:
               _loc7_ *= get_player().physMod();
               break;
            case 1:
               if(!param1)
               {
                  _loc7_ *= get_player().spellMod();
               }
               break;
            default:
            case 2:
         }
         _loc7_ *= param6;
         _loc7_ = globalMod(_loc7_);
         _loc7_ = doDamage(_loc7_,false,false,false);
         return int(Math.round(_loc7_));
      }
      
      public function generalCleanup() : void
      {
         get_mainView().endCombatView();
         spriteSelect(null);
         imageSelect(null);
         combatAbilities.fireMagicLastTurn = -100;
         combatAbilities.fireMagicCumulated = 0;
         combatAbilities.flurryAmount = 1;
         currMonsterIndex = 0;
         maxMonsterIndex = 0;
         currTarget = 0;
         get_combatRangeData().resetDistance();
         if(get_player().get_weapon().isSummoned())
         {
            get_player().setUnarmed();
         }
         get_shields().CLKSHLD.saveContent.used = false;
      }
      
      public function finishCombat() : void
      {
         var _loc1_:Boolean = totalHP() < 1;
         if(_loc1_)
         {
            outputText("你击败了[themonster]。\n");
         }
         else
         {
            outputText("你微笑着看着[themonster]倒下并开始狂热地自慰。");
         }
         cleanupAfterCombat();
      }
      
      public function fatigueRecovery() : void
      {
         get_player().changeFatigue(-1);
         if(get_player().hasPerk(PerkLib.EnlightenedNinetails) || get_player().hasPerk(PerkLib.CorruptedNinetails))
         {
            get_player().changeFatigue(-(1 + Utils.rand(3)));
         }
      }
      
      public function fantasy() : void
      {
         var _g:Combat;
         var _loc1_:int = 0;
         _g = this;
         doNext(function():void
         {
            _g.combatMenu();
         });
         clearOutput();
         if(get_monster().get_short() == "frost giant" && get_player().hasStatusEffect(StatusEffects.GiantBoulder))
         {
            _loc1_ = 10 + Utils.rand(get_player().lib / 5 + get_player().cor / 8);
            get_player().takeLustDamage(_loc1_,true,false);
            get_monster().giantBoulderFantasize();
            startMonsterTurn();
            return;
         }
         if(get_monster().get_short() == "outsider")
         {
            outputText("关于这个生物的一些东西让你开始对它产生幻想。它的外表本身并没有什么色情之处，但仅仅是看着它，你就会开始感到燥热。");
            _loc1_ = 5 + Utils.rand(get_player().lib / 8 + get_player().cor / 8);
         }
         else if(get_player().get_armorName() == "goo armor")
         {
            outputText("当你沉浸在幻想中时，你感觉到瓦莱丽娅用她黏糊糊的身体在你敏感的肌肤上摩擦");
            if(get_player().get_gender() > 0)
            {
               outputText("和生殖器上");
            }
            outputText("，让你更加兴奋。\n");
            _loc1_ = 25 + Utils.rand(get_player().lib / 8 + get_player().cor / 8);
         }
         else
         {
            _loc1_ = 5 + Utils.rand(get_player().lib / 8 + get_player().cor / 8);
            get_monster().outputDefaultFantasy(_loc1_);
         }
         get_player().takeLustDamage(_loc1_,true,false);
         outputText("[pg]");
         if(get_player().get_lust() >= get_player().maxLust())
         {
            if(get_monster().get_short() != "pod")
            {
               doNext(endLustLoss);
               return;
            }
            outputText("<b>你几乎要高潮了，但对当前处境的恐惧再次占据了上风，压抑了你身体释放的渴望。如果你不尽快逃脱，你毫不怀疑自己会被操得神志不清，再也没有机会尝试逃跑了！</b>");
            get_player().set_lust(99);
            get_player().takeLustDamage(-25,true);
            outputText("[pg]");
         }
         startMonsterTurn();
      }
      
      public function fancifyLustRange(param1:Number, param2:Number = 0, param3:Object = undefined, param4:Array = undefined) : String
      {
         var _loc5_:DamageRange = new DamageRange(int(Math.round(param1)),int(Math.round(param2)),null);
         return _loc5_.fancifyLust(param3,param4);
      }
      
      public function fancifyHealRange(param1:Number, param2:Number = 0, param3:Object = undefined, param4:Array = undefined) : String
      {
         var _loc5_:DamageRange = new DamageRange(int(Math.round(param1)),int(Math.round(param2)),null);
         return _loc5_.fancifyHeal(param3,param4);
      }
      
      public function fancifyDamageRange(param1:Number, param2:Number = 0, param3:Object = undefined, param4:Array = undefined) : String
      {
         var _loc5_:DamageRange = new DamageRange(int(Math.round(param1)),int(Math.round(param2)),null);
         return _loc5_.fancify(param3,param4);
      }
      
      public function execMonsterAI(param1:int) : void
      {
         if(param1 >= maxMonsterIndex)
         {
            endMonsterTurn();
            return;
         }
         currMonsterIndex = param1;
         blockTurn = false;
         set_monster(get_monsterArray()[param1]);
         if(get_monster().neverAct)
         {
            get_monster().tookAction = true;
            execMonsterAI(param1 + 1);
            return;
         }
         outputText("[pg-]<font face=\"_typewriter\"><font size=\"10\">───────────────────────────────────────</font></font>[pg-]");
         if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,2681) == 1 && !get_inDungeon() && !(get_monster().hasStatusEffect(StatusEffects.Spar) || get_monster().hasStatusEffect(StatusEffects.Sparring)))
         {
            get_game().bog.anneMarieScene.mysteriousStranger();
         }
         if(get_monster().get_HP() < 0)
         {
            get_monster().set_HP(0);
         }
         if(get_monster().get_lust() > get_monster().maxLust())
         {
            get_monster().set_lust(get_monster().maxLust());
         }
         if(get_monster().get_HP() > 0 && (get_monster().get_lust() < get_monster().maxLust() || get_monster().ignoreLust) && !get_monster().tookAction)
         {
            get_monster().doAI();
         }
         else if(!get_monster().tookAction)
         {
            outputText("你已经打消了[themonster]的抵抗。");
         }
         FlagDict_Impl_.arrayWriteInt(KFLAGS.flags,2138,0);
         get_monster().tookAction = true;
         if(!blockTurn)
         {
            execMonsterAI(param1 + 1);
         }
      }
      
      public function endMonsterTurn() : void
      {
         var _loc4_:* = null as Monster;
         var _loc5_:* = null as Array;
         var _loc6_:int = 0;
         var _loc7_:* = null as StatusEffect;
         var _loc1_:Array = [];
         var _loc2_:int = 0;
         var _loc3_:Array = get_monsterArray();
         while(_loc2_ < int(_loc3_.length))
         {
            _loc4_ = _loc3_[_loc2_];
            _loc2_++;
            _loc1_.push(_loc4_.statusEffects.copy());
         }
         _loc3_ = _loc1_;
         _loc3_.unshift(get_player().statusEffects.copy());
         _loc2_ = 0;
         while(_loc2_ < int(_loc3_.length))
         {
            _loc5_ = _loc3_[_loc2_];
            _loc2_++;
            _loc6_ = 0;
            while(_loc6_ < int(_loc5_.length))
            {
               _loc7_ = _loc5_[_loc6_];
               _loc6_++;
               _loc7_.onTurnEnd();
            }
         }
         combatRoundOver(true);
      }
      
      public function endLustVictory() : void
      {
         generalCleanup();
         lustvictoryFunc();
      }
      
      public function endLustLoss() : void
      {
         generalCleanup();
         if(get_player().hasStatusEffect(StatusEffects.Infested) && FlagDict_Impl_.arrayReadInt(KFLAGS.flags,788) == 0)
         {
            FlagDict_Impl_.arrayWriteInt(KFLAGS.flags,788,1);
            get_game().mountain.wormsScene.infestOrgasm();
            lustlossFunc();
         }
         else if(int(get_monsterArray().length) == 1)
         {
            get_monster().won_(false,false);
         }
         else
         {
            lustlossFunc();
         }
      }
      
      public function endHpVictory() : void
      {
         generalCleanup();
         hpvictoryFunc();
      }
      
      public function endHpLoss() : void
      {
         generalCleanup();
         hplossFunc();
      }
      
      public function endFightCheck() : Boolean
      {
         var _loc3_:* = null as Monster;
         if(!get_inCombat())
         {
            return false;
         }
         if(totalHP() < 1)
         {
            if(get_player().statusEffectv2(StatusEffects.TFSupercharging) > 0 && get_monster().level >= get_player().level && !get_achievements().h[283])
            {
               awardAchievement("夜之阳",283,true,true);
            }
            doNext(endHpVictory);
            return true;
         }
         if(lustVictory())
         {
            doNext(endLustVictory);
            return true;
         }
         if(int(get_monsterArray().length) == 1)
         {
            get_monsterArray()[0] = get_monster();
         }
         var _loc1_:int = 0;
         var _loc2_:Array = get_monsterArray();
         while(_loc1_ < int(_loc2_.length))
         {
            _loc3_ = _loc2_[_loc1_];
            _loc1_++;
            if(_loc3_.playerWinCondition() != null)
            {
               doNext(_loc3_.playerWinCondition());
               return true;
            }
            if(_loc3_.playerLossCondition() != null)
            {
               doNext(_loc3_.playerLossCondition());
               return true;
            }
         }
         removeDownedTempMonsters();
         if(get_player().get_HP() < 1)
         {
            doNext(endHpLoss);
            return true;
         }
         if(get_player().get_lust() >= get_player().maxLust())
         {
            doNext(endLustLoss);
            return true;
         }
         return false;
      }
      
      public function dropItem(param1:Monster, param2:Object = undefined) : void
      {
         var _loc4_:* = null as Array;
         var _loc5_:* = null as IMap;
         if(param2 == null)
         {
            param2 = get_camp().returnToCampUseOneHour;
         }
         if(param1.hasStatusEffect(StatusEffects.NoLoot))
         {
            return;
         }
         var _loc3_:ItemType = param1.dropLoot();
         if(!plotFight && !(param1 is Ember) && !(param1 is Kiha) && !(param1 is Hel) && !(param1 is Isabella) && get_game().ceraphScene.hasExhibition() && Utils.rand(10) == 0 && !get_player().hasItem(get_armors().SEDUCTA,1) && !get_game().ceraphFollowerScene.ceraphIsFollower())
         {
            _loc3_ = get_armors().SEDUCTA;
         }
         if(_loc3_ == null && !plotFight && Utils.rand(get_player().hasPerk(PerkLib.HistoryThief) ? 150 : 200) == 0 && get_player().level >= 7)
         {
            _loc3_ = get_consumables().BROBREW;
         }
         if(_loc3_ == null && !plotFight && Utils.rand(get_player().hasPerk(PerkLib.HistoryThief) ? 150 : 200) == 0 && get_player().level >= 7)
         {
            _loc3_ = get_consumables().BIMBOLQ;
         }
         if(_loc3_ == null && !plotFight && Utils.rand(get_player().hasPerk(PerkLib.HistoryThief) ? 750 : 1000) == 0 && get_player().level >= 7)
         {
            _loc3_ = get_consumables().RAINDYE;
         }
         if(_loc3_ == null && !plotFight && Utils.rand(get_player().hasPerk(PerkLib.HistoryThief) ? 5 : 6) == 0 && isEaster())
         {
            _loc4_ = [get_consumables().BROWNEG,get_consumables().L_BRNEG,get_consumables().PURPLEG,get_consumables().L_PRPEG,get_consumables().BLUEEGG,get_consumables().L_BLUEG,get_consumables().PINKEGG,get_consumables().NPNKEGG,get_consumables().L_PNKEG,get_consumables().L_WHTEG,get_consumables().WHITEEG,get_consumables().BLACKEG,get_consumables().L_BLKEG];
            _loc3_ = _loc4_[Utils.rand(int(_loc4_.length))];
            _loc5_ = KFLAGS.flags;
            FlagDict_Impl_.arrayWriteInt(_loc5_,2271,FlagDict_Impl_.arrayReadInt(_loc5_,2271) + 1);
         }
         if(_loc3_ == null && !plotFight && Utils.rand(get_player().hasPerk(PerkLib.HistoryThief) ? 150 : 200) <= Math.min(6,Math.floor(param1.level / 10)))
         {
            _loc4_ = [];
            _loc4_.push(get_jewelries().SILVRNG);
            if(param1.level < 10)
            {
               _loc4_.push(get_jewelries().SILVRNG);
            }
            if(param1.level < 15 && Utils.rand(2) == 0)
            {
               _loc4_.push(get_jewelries().SILVRNG);
            }
            _loc4_.push(get_jewelries().GOLDRNG);
            if(param1.level < 20)
            {
               _loc4_.push(get_jewelries().GOLDRNG);
            }
            _loc4_.push(get_jewelries().PLATRNG);
            if(Utils.rand(2) == 0)
            {
               _loc4_.push(get_jewelries().DIAMRNG);
            }
            if(param1.level >= 15 && Utils.rand(4) == 0)
            {
               _loc4_.push(get_jewelries().LTHCRNG);
            }
            if(param1.level >= 25 && Utils.rand(3) == 0)
            {
               _loc4_.push(get_jewelries().LTHCRNG);
            }
            if(param1.level >= 1 && param1.level < 15)
            {
               _loc4_.push(get_jewelries().CRIMRN1);
               _loc4_.push(get_jewelries().FERTRN1);
               _loc4_.push(get_jewelries().ICE_RN1);
               _loc4_.push(get_jewelries().CRITRN1);
               _loc4_.push(get_jewelries().REGNRN1);
               _loc4_.push(get_jewelries().LIFERN1);
               _loc4_.push(get_jewelries().MYSTRN1);
               _loc4_.push(get_jewelries().POWRRN1);
            }
            if(param1.level >= 11 && param1.level < 25)
            {
               _loc4_.push(get_jewelries().CRIMRN2);
               _loc4_.push(get_jewelries().FERTRN2);
               _loc4_.push(get_jewelries().ICE_RN2);
               _loc4_.push(get_jewelries().CRITRN2);
               _loc4_.push(get_jewelries().REGNRN2);
               _loc4_.push(get_jewelries().LIFERN2);
               _loc4_.push(get_jewelries().MYSTRN2);
               _loc4_.push(get_jewelries().POWRRN2);
            }
            if(param1.level >= 21)
            {
               _loc4_.push(get_jewelries().CRIMRN3);
               _loc4_.push(get_jewelries().FERTRN3);
               _loc4_.push(get_jewelries().ICE_RN3);
               _loc4_.push(get_jewelries().CRITRN3);
               _loc4_.push(get_jewelries().REGNRN3);
               _loc4_.push(get_jewelries().LIFERN3);
               _loc4_.push(get_jewelries().MYSTRN3);
               _loc4_.push(get_jewelries().POWRRN3);
            }
            _loc3_ = _loc4_[Utils.rand(int(_loc4_.length))];
         }
         if(checkBonusItem())
         {
            _loc3_ = getBonusItem();
         }
         if(get_player().isDisarmed() && !get_player().rearm())
         {
            _loc3_ = get_player().getDisarmed();
         }
         param1.handleAwardItemText(_loc3_);
         if(_loc3_ != null)
         {
            if(get_inDungeon())
            {
               get_inventory().takeItem(_loc3_,playerMenu);
            }
            else
            {
               get_inventory().takeItem(_loc3_,param2);
            }
         }
      }
      
      public function doubleAttackLimit(param1:int) : int
      {
         var _loc2_:int = param1;
         var _loc3_:int = 60;
         if(!get_player().isResetAscension())
         {
            _loc3_ += get_player().newGamePlusMod() * 15;
         }
         return int(Math.round(Math.min(_loc2_,_loc3_)));
      }
      
      public function doRunAway() : void
      {
         if(get_monster() is VolcanicGolem)
         {
            FlagDict_Impl_.arrayWriteFloat(KFLAGS.flags,2647,get_monster().get_HP());
         }
         generalCleanup();
         get_monsterArray().resize(0);
         set_inCombat(false);
         clearStatuses();
         doNext(get_camp().returnToCampUseOneHour);
      }
      
      public function doDamage(param1:Number, param2:Boolean = true, param3:Boolean = false, param4:Boolean = true, param5:Boolean = true) : Number
      {
         var _loc6_:* = null as Monster;
         var _loc7_:int = 0;
         var _loc8_:Boolean = false;
         var _loc9_:* = null as CombatAbility;
         if(damageType == "NoAttack" && param2)
         {
            Log.trace("doDamage called with no damageType set. Defaulting to DAMAGE_PHYSICAL_MELEE",{
               "fileName":"src/classes/scenes/combat/Combat.hx",
               "lineNumber":1331,
               "className":"classes.scenes.combat.Combat",
               "methodName":"doDamage"
            });
            damageType = "PhysicalM";
         }
         if(param4)
         {
            param1 = get_monster().handleDamaged(param1,param2);
         }
         if(get_player().hasPerk(PerkLib.Sadist) && param2 && param5)
         {
            get_player().takeLustDamage(3,true);
         }
         param1 = Math.round(param1);
         if(param1 < 0)
         {
            param1 = 1;
         }
         if(param2)
         {
            _loc6_ = get_monster();
            _loc6_.set_HP(_loc6_.get_HP() - param1);
         }
         if(param3)
         {
            get_output().text(getDamageText(param1));
            if(param4)
            {
               get_monster().reactWrapper(ReactionContext.AfterDamaged);
            }
         }
         if(param2 && get_monster().get_short() == "Isabella" && !get_monster().hasStatusEffect(StatusEffects.Sparring))
         {
            _loc7_ = 368;
            FlagDict_Impl_.arrayWriteInt(KFLAGS.flags,_loc7_,FlagDict_Impl_.arrayReadInt(KFLAGS.flags,_loc7_) - 1);
            if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,368) < 0)
            {
               FlagDict_Impl_.arrayWriteInt(KFLAGS.flags,368,0);
            }
         }
         if(get_player().hasStatusEffect(StatusEffects.Leeching) && param2)
         {
            _loc9_ = get_combat().currAbilityUsed;
            _loc8_ = Boolean(_loc9_ != null ? _loc9_.isWeaponAbility : null);
         }
         else
         {
            _loc8_ = false;
         }
         if(_loc8_)
         {
            get_player().createOrFindStatusEffect(StatusEffects.Leeching).applyEffect(int(param1));
         }
         if(get_monster().get_HP() < 0)
         {
            get_monster().set_HP(0);
         }
         return param1;
      }
      
      public function displaySingle() : void
      {
         var _loc4_:int = 0;
         if(!get_monster().get_checkCalled())
         {
            outputText("<B>/!\\BUG! Monster.checkMonster() 未被调用！现在正在调用...</B>\n");
            get_monster().checkMonster();
         }
         if(get_monster().checkError != "")
         {
            outputText("<B>/!\\BUG! 怪物未正确初始化！</B>" + get_monster().checkError + "</u></b>\n");
         }
         var _loc1_:String = "";
         var _loc2_:String = "";
         var _loc3_:Number = get_monster().HPRatio();
         if(imageText != null && imageText != "")
         {
            get_images().showImage(imageText);
         }
         outputText("[pg]<b>回合：</b>" + (combatRound + 1) + "\n");
         outputText("<b>你正在与");
         outputText("[themonster]战斗：</b>\n");
         if(get_player().hasStatusEffect(StatusEffects.Blind))
         {
            outputText("什么都看不见！\n");
         }
         else
         {
            outputText(get_monster().get_long() + "[pg]");
            if(get_monster().hasStatusEffect(StatusEffects.Level))
            {
               _loc4_ = int(get_monster().statusEffectv1(StatusEffects.Level));
               if(_loc4_ == 4)
               {
                  outputText("你正处于它陷阱的边缘。只要你能在这里站稳脚跟，你就会安全。");
               }
               else if(_loc4_ == 3)
               {
                  outputText("脚下下沉的沙子已经把你带到了怪物陷阱的半中央。");
               }
               else
               {
                  outputText("沙丘高耸在你上方，沙子的嘶嘶声充满了你的耳朵。<b>那只面目可憎的沙地陷阱怪几乎就在你头顶上了！</b>");
               }
               outputText("你可以尝试用你的[weapon]攻击它，但这会把你直接带到谷底。或者，你可以尝试挑逗它或进行远程攻击，或者等待并保持站稳，直到你能爬得更高。");
               outputText("[pg]");
            }
            outputText("[pg]<b><u>" + Utils.cnName(Utils.capitalizeFirstLetter(get_monster().get_short())) + "的状态</u></b>\n");
            if(get_monster().get_plural())
            {
               if(_loc3_ >= 1)
               {
                  outputText("你注意到[monster.he]非常健康。");
               }
               else if(_loc3_ > 0.75)
               {
                  outputText("你注意到[monster.he]没受什么伤。");
               }
               else if(_loc3_ > 0.5)
               {
                  outputText("你注意到[monster.he]受了轻伤。");
               }
               else if(_loc3_ > 0.25)
               {
                  outputText("你注意到[monster.he]受了重伤。");
               }
               else
               {
                  outputText("你注意到[monster.he]摇摇欲坠，濒临死亡。");
               }
            }
            else if(_loc3_ >= 1)
            {
               outputText("你注意到[monster.he]非常健康。");
            }
            else if(_loc3_ > 0.75)
            {
               outputText("你注意到[monster.he]伤得不重。");
            }
            else if(_loc3_ > 0.5)
            {
               outputText("你注意到[monster.he]受了轻伤。");
            }
            else if(_loc3_ > 0.25)
            {
               outputText("你注意到[monster.he]受了重伤。");
            }
            else
            {
               outputText("你注意到[monster.he]摇摇欲坠，濒临死亡。");
            }
            showMonsterLust();
         }
         if(get_debug())
         {
            outputText("\n----------------------------\n");
            outputText(get_monster().generateDebugDescription());
         }
      }
      
      public function displayMulti() : void
      {
         var _loc3_:int = 0;
         if(int(get_monsterArray().length) != 0)
         {
            if(int(get_monsterArray().length) > 4)
            {
               outputText("<B>/!\\怪物数组过大！正在弹出直到修复。</B>");
               get_monsterArray().resize(4);
            }
         }
         var _loc1_:String = "\n";
         var _loc2_:String = "";
         if(imageText != null && imageText != "")
         {
            get_images().showImage(imageText);
         }
         outputText("<b>回合：</b>" + combatRound + "\n");
         outputText("<b>你正在与一群敌人战斗：</b>\n");
         outputText(description + "\n");
         if(get_player().hasStatusEffect(StatusEffects.Blind))
         {
            outputText("什么都看不见！\n");
         }
         else
         {
            _loc3_ = 0;
            while(_loc3_ < int(get_monsterArray().length))
            {
               outputText("<b><u>" + Utils.cnName(Utils.capitalizeFirstLetter(get_monsterArray()[_loc3_].get_short())) + "的状态</u></b>\n");
               if(get_monsterArray()[_loc3_].get_plural() && get_monsterArray()[_loc3_].unitHP > 0)
               {
                  outputText("单位数量：" + (get_monsterArray()[_loc3_].get_HP() > 0 ? get_monsterArray()[_loc3_].unitAmount : 0) + "\n");
               }
               if(get_monsterArray()[_loc3_].HPRatio() >= 1)
               {
                  outputText("你注意到" + get_monsterArray()[_loc3_].pronoun1 + (get_monsterArray()[_loc3_].get_plural() ? "" : "") + "非常健康。");
               }
               else if(get_monsterArray()[_loc3_].HPRatio() > 0.75)
               {
                  outputText("你注意到" + get_monsterArray()[_loc3_].pronoun1 + (get_monsterArray()[_loc3_].get_plural() ? "" : "") + "没有受什么重伤。");
               }
               else if(get_monsterArray()[_loc3_].HPRatio() > 0.5)
               {
                  outputText("你注意到" + get_monsterArray()[_loc3_].pronoun1 + (get_monsterArray()[_loc3_].get_plural() ? "" : "") + "受了轻伤。");
               }
               else if(get_monsterArray()[_loc3_].HPRatio() > 0.25)
               {
                  outputText("你注意到" + get_monsterArray()[_loc3_].pronoun1 + (get_monsterArray()[_loc3_].get_plural() ? "们" : "") + "受了重伤。");
               }
               else if(get_monsterArray()[_loc3_].HPRatio() > 0)
               {
                  outputText("你注意到" + get_monsterArray()[_loc3_].pronoun1 + (get_monsterArray()[_loc3_].get_plural() ? "" : "") + "摇摇欲坠，濒临死亡。");
               }
               else
               {
                  outputText("你注意到" + get_monsterArray()[_loc3_].pronoun1 + (get_monsterArray()[_loc3_].get_plural() ? "已经" : "已经") + "失去了意识。");
               }
               if(get_monsterArray()[_loc3_].get_lust() >= get_monsterArray()[_loc3_].maxLust() && !get_monsterArray()[_loc3_].ignoreLust)
               {
                  outputText("你注意到 " + get_monsterArray()[_loc3_].pronoun1 + (get_monsterArray()[_loc3_].get_plural() ? "都" : "") + " 被欲望冲昏了头脑，根本无心恋战。");
               }
               outputText("[pg]");
               _loc3_++;
            }
         }
         outputText("\n<b>点击敌人的属性框以更改当前目标。</b>");
      }
      
      public function displayAttackRange() : String
      {
         var _loc8_:int = 0;
         var _loc1_:int = calcWeaponDamage(get_player().isDoubleAttacking());
         var _loc2_:Number = get_monster().reduceDamageMin(_loc1_,0,true);
         var _loc3_:Number = get_monster().reduceDamageMax(_loc1_,0,true);
         var _loc4_:int = getNumAttacks();
         var _loc5_:Array = [];
         var _loc6_:int = 0;
         var _loc7_:int = getNumAttacks();
         while(_loc6_ < _loc7_)
         {
            _loc8_ = _loc6_++;
            _loc5_.push(hitChance(_loc8_));
         }
         var _loc9_:Array = _loc5_;
         return fancifyDamageRange(_loc2_,_loc3_,null,_loc9_);
      }
      
      public function display() : void
      {
         if(int(get_monsterArray().length) == 1)
         {
            displaySingle();
         }
         else
         {
            displayMulti();
         }
      }
      
      public function debugInspect() : void
      {
         var newRound:Boolean;
         var _g:Combat;
         outputText(get_monster().generateDebugDescription());
         _g = this;
         newRound = false;
         doNext(function():void
         {
            _g.combatMenu(newRound);
         });
      }
      
      public function combatStatusesUpdate() : void
      {
         var _loc1_:int = 0;
         var _loc2_:* = null as Array;
         var _loc3_:* = null as Monster;
         var _loc4_:* = null as IMap;
         var _loc5_:Number = NaN;
         var _loc6_:* = null as StatusEffect;
         var _loc8_:int = 0;
         hideUpDown();
         if(get_player().hasStatusEffect(StatusEffects.Sealed))
         {
            if(get_player().statusEffectv1(StatusEffects.Sealed) > 0)
            {
               get_player().addStatusValue(StatusEffects.Sealed,1,-1);
               if(get_player().statusEffectv1(StatusEffects.Sealed) <= 0)
               {
                  get_player().removeStatusEffect(StatusEffects.Sealed);
               }
               else
               {
                  outputText("<b>你的一项战斗技能目前被魔法封印了！</b>[pg]");
               }
            }
         }
         if(int(get_monsterArray().length) == 1)
         {
            get_monster().combatRoundUpdate();
         }
         else
         {
            _loc1_ = 0;
            _loc2_ = get_monsterArray();
            while(_loc1_ < int(_loc2_.length))
            {
               _loc3_ = _loc2_[_loc1_];
               _loc1_++;
               _loc3_.combatRoundUpdate();
            }
         }
         if(get_player().hasStatusEffect(StatusEffects.WaitReadiness))
         {
            get_player().removeStatusEffect(StatusEffects.WaitReadiness);
            if(get_player().hasPerk(PerkLib.Patience))
            {
               get_player().setPerkValue(PerkLib.Patience,0,20);
               get_player().setPerkValue(PerkLib.Patience,1,10);
               get_player().setPerkValue(PerkLib.Patience,2,10);
            }
         }
         else if(get_player().hasPerk(PerkLib.Patience))
         {
            get_player().setPerkValue(PerkLib.Patience,0,0);
            get_player().setPerkValue(PerkLib.Patience,1,0);
            get_player().setPerkValue(PerkLib.Patience,2,0);
         }
         if(get_player().hasStatusEffect(StatusEffects.CounterAB))
         {
            get_player().addStatusValue(StatusEffects.CounterAB,2,-1);
            if(get_player().statusEffectv2(StatusEffects.CounterAB) >= 0)
            {
               outputText("你仍处于反击姿态。[pg]");
            }
            else
            {
               outputText("<b>你退出了反击姿态！</b>[pg]");
               get_player().removeStatusEffect(StatusEffects.CounterAB);
            }
         }
         if(get_player().hasStatusEffect(StatusEffects.SentinelNoTease))
         {
            get_player().addStatusValue(StatusEffects.SentinelNoTease,1,-1);
            if(get_player().statusEffectv1(StatusEffects.SentinelNoTease) <= 0)
            {
               get_player().removeStatusEffect(StatusEffects.SentinelNoTease);
               outputText("<b>你恢复了挑逗的能力！</b>[pg]");
            }
            else
            {
               outputText("<b>你的挑逗能力仍然被封印着！</b>[pg]");
            }
         }
         if(get_player().hasStatusEffect(StatusEffects.SentinelOmniSilence))
         {
            get_player().addStatusValue(StatusEffects.SentinelOmniSilence,1,-1);
            if(get_player().statusEffectv1(StatusEffects.SentinelOmniSilence) <= 0)
            {
               get_player().removeStatusEffect(StatusEffects.SentinelOmniSilence);
               outputText("<b>你恢复了使用魔法的能力！</b>[pg]");
            }
            else
            {
               outputText("<b>你使用魔法的能力仍然被封印着！</b>[pg]");
            }
         }
         if(get_player().hasStatusEffect(StatusEffects.SentinelPhysicalDisabled))
         {
            get_player().addStatusValue(StatusEffects.SentinelPhysicalDisabled,1,-1);
            if(get_player().statusEffectv1(StatusEffects.SentinelPhysicalDisabled) <= 0)
            {
               get_player().removeStatusEffect(StatusEffects.SentinelPhysicalDisabled);
               outputText("<b>你恢复了使用物理攻击的能力！</b>[pg]");
            }
            else
            {
               outputText("<b>你使用物理攻击的能力仍然被封印着！</b>[pg]");
            }
         }
         if(get_player().hasStatusEffect(StatusEffects.ArmorRent))
         {
            if(get_player().hasPerk(PerkLib.Medicine) && Utils.rand(100) <= 14)
            {
               outputText("你凭借医学知识成功清除了破坏者的毒素！[pg]");
               get_player().removeStatusEffect(StatusEffects.ArmorRent);
            }
            else
            {
               outputText("破坏者的毒素使你受到的物理伤害增加了：" + Math.round(get_player().statusEffectv1(StatusEffects.ArmorRent)) + "%[pg]");
            }
         }
         if(get_player().hasStatusEffect(StatusEffects.Revelation))
         {
            get_player().addStatusValue(StatusEffects.Revelation,1,-1);
            if(get_player().statusEffectv1(StatusEffects.Revelation) >= 0)
            {
               outputText("你的大脑仍然被海量的诡异知识所占据！[pg]");
            }
            else
            {
               outputText("那足以让大脑炸裂的知识离开了你的脑海，你恢复了自我意识！[pg]");
               get_player().set_short(get_monster().originalName);
               get_player().removeStatusEffect(StatusEffects.Revelation);
            }
         }
         if(get_player().hasStatusEffect(StatusEffects.Nothingness))
         {
            get_player().addStatusValue(StatusEffects.Nothingness,1,-1);
            if(get_player().statusEffectv1(StatusEffects.Nothingness) >= 0)
            {
               outputText("解放你自己。拥抱虚无，化为永恒。[pg]");
            }
            else
            {
               outputText("那怪物的法术消散了——你再次恢复了实体！[pg]");
               get_player().removeStatusEffect(StatusEffects.Nothingness);
            }
         }
         if(get_player().hasStatusEffect(StatusEffects.Refashioned))
         {
            get_player().addStatusValue(StatusEffects.Refashioned,1,-1);
            if(get_player().statusEffectv1(StatusEffects.Refashioned) >= 0)
            {
               outputText("你仍然处于被无名恐怖重塑的状态。[pg]");
            }
            else
            {
               outputText("你注意到自己又变回了原来的样子！[pg]");
               get_player().removeStatusEffect(StatusEffects.Refashioned);
               get_player()._str = Number(get_monster().playerStats[0]);
               get_player()._tou = Number(get_monster().playerStats[1]);
               get_player()._inte = Number(get_monster().playerStats[2]);
               get_player()._spe = Number(get_monster().playerStats[3]);
            }
         }
         if(get_player().hasStatusEffect(StatusEffects.ThroatPunch))
         {
            get_player().addStatusValue(StatusEffects.ThroatPunch,1,-1);
            if(get_player().statusEffectv1(StatusEffects.ThroatPunch) >= 0)
            {
               outputText("拜伊莎贝拉那记击碎气管的重击所赐，你现在呼吸困难，<b>因此无法施放法术。</b>[pg]");
            }
            else
            {
               outputText("你的气管从伊莎贝拉的残暴打击中恢复了过来。你又能集中注意力施放法术了！[pg]");
               get_player().removeStatusEffect(StatusEffects.ThroatPunch);
            }
         }
         if(get_player().hasStatusEffect(StatusEffects.GooArmorSilence))
         {
            if(get_player().statusEffectv1(StatusEffects.GooArmorSilence) >= 2 || Utils.rand(20) + 1 + get_player().get_str() / 10 >= 15)
            {
               outputText("<b>覆盖在你嘴上的黏稠污泥被勉强扯下，这花费了比你预期更多的力气，但你总算把嘴巴解放出来，可以说话了！</b>[pg]");
               get_player().removeStatusEffect(StatusEffects.GooArmorSilence);
            }
            else
            {
               outputText("<b>你的嘴巴被黏稠的黏液堵住了！你被沉默了！</b>[pg]");
               get_player().addStatusValue(StatusEffects.GooArmorSilence,1,1);
            }
         }
         if(get_player().hasStatusEffect(StatusEffects.LustStones))
         {
            if(get_player().isGoo())
            {
               outputText("<b>石头再次开始震动，让你液态的身体因快感而泛起涟漪。女巫们对你现在的怪异模样窃笑不已。</b>");
            }
            else
            {
               outputText("<b>光滑的石头再次开始震动，一阵又一阵挑逗的快感传遍你的全身。当你试图抵挡她们的攻击时，女巫们在一旁窃笑。</b>");
            }
            get_player().takeLustDamage(get_player().statusEffectv1(StatusEffects.LustStones) + 4,true);
            outputText("[pg]");
         }
         if(get_player().hasStatusEffect(StatusEffects.WebSilence))
         {
            if(get_player().statusEffectv1(StatusEffects.WebSilence) >= 2 || Utils.rand(20) + 1 + get_player().get_str() / 10 >= 15)
            {
               outputText("你痛呼一声，撕下了捂住你嘴巴的蛛网，终于能正常呼吸了！现在你可以施法了！[pg]");
               get_player().removeStatusEffect(StatusEffects.WebSilence);
            }
            else
            {
               outputText("<b>你的口鼻被黏糊糊的蛛网堵住了，呼吸困难，也无法集中精力施法。你试图把它扯下来，但根本没用！</b>[pg]");
               get_player().addStatusValue(StatusEffects.WebSilence,1,1);
            }
         }
         if(get_player().hasStatusEffect(StatusEffects.HolliConstrict))
         {
            outputText("<b>你被霍莉翠绿的肢体缠住了！你唯一能做的就是努力挣脱……</b>[pg]");
         }
         if(get_player().hasStatusEffect(StatusEffects.UBERWEB))
         {
            outputText("<b>你被压在一堆蛛网下面！你最好赶紧挣脱出来，重新投入战斗！</b>[pg]");
         }
         if(get_player().hasStatusEffect(StatusEffects.Blind) && !get_monster().hasStatusEffect(StatusEffects.Sandstorm))
         {
            if(get_player().hasStatusEffect(StatusEffects.SheilaOil))
            {
               if(get_player().statusEffectv1(StatusEffects.Blind) <= 0)
               {
                  outputText("<b>你终于擦掉了眼睛上恶魔那污秽的油脂；虽然气味还在，但你至少能看见了。希拉似乎很高兴能再次出现在你的视线中。</b>[pg]");
                  get_player().removeStatusEffect(StatusEffects.Blind);
               }
               else
               {
                  outputText("<b>你用手背擦拭着那些油腻的分泌物，擦掉了一些，但剩下的却被抹得更薄更匀了。你能听到恶魔在嘲笑你的窘态。</b>[pg]");
                  get_player().addStatusValue(StatusEffects.Blind,1,-1);
               }
            }
            else if(get_player().statusEffectv1(StatusEffects.Blind) == 0)
            {
               get_player().removeStatusEffect(StatusEffects.Blind);
               if(!get_player().hasStatusEffect(StatusEffects.Blind))
               {
                  outputText("<b>你的眼睛恢复了清明，不再失明了！</b>[pg]");
               }
               else
               {
                  outputText("<b>你失明了，许多物理攻击会更容易落空。</b>[pg]");
               }
            }
            else
            {
               get_player().addStatusValue(StatusEffects.Blind,1,-1);
               outputText("<b>你失明了，许多物理攻击会更容易落空。</b>[pg]");
            }
         }
         if(get_player().hasStatusEffect(StatusEffects.BasiliskCompulsion))
         {
            StareMonster.speedReduce(get_player(),15);
            outputText("你仍然能感觉到那双灰色眼睛的魔力，让你的动作变得迟缓而艰难，记忆中的话语诱惑着你再次看向它的眼睛。<b>你必须在沉重的四肢允许的范围内，尽快结束这场战斗。</b>[pg]");
            _loc4_ = KFLAGS.flags;
            FlagDict_Impl_.arrayWriteInt(_loc4_,2208,FlagDict_Impl_.arrayReadInt(_loc4_,2208) + 1);
         }
         if(get_player().hasStatusEffect(StatusEffects.IzmaBleed))
         {
            get_player().updateBleed();
         }
         if(get_player().hasStatusEffect(StatusEffects.AcidSlap))
         {
            _loc5_ = Math.round(3 + get_player().maxHP() * 0.02);
            outputText("酸液不断灼烧着你，你的肌肉在痛苦中抽搐。<b>(<font color=\"" + get_mainViewManager().colorHpMinus() + "\">" + _loc5_ + "</font>)</b>[pg]");
         }
         if(get_player().hasPerk(PerkLib.ArousingAura) && get_monster().lustVuln > 0 && get_player().isCorruptEnough(70))
         {
            if(get_monster().get_lust100() < 50)
            {
               outputText("你的光环渗入了[themonster]的体内，但目前还没有任何明显的效果。");
            }
            else if(get_monster().get_lust100() < 60)
            {
               if(!get_monster().get_plural())
               {
                  outputText("[Themonster]因为你那邪恶的气息开始有些不安地扭动起来。");
               }
               else
               {
                  outputText("[Themonster]因为你那邪恶的气息开始有些不安地扭动起来。");
               }
            }
            else if(get_monster().get_lust100() < 75)
            {
               outputText("你的催情光环似乎对[themonster]产生了明显的影响，让[monster.him]不舒服地扭动着。");
            }
            else if(get_monster().get_lust100() < 85)
            {
               if(!get_monster().get_plural())
               {
                  outputText("[Themonster]的皮肤泛起红晕，因为[monster.he]不经意间沐浴在你的气息中。");
               }
               else
               {
                  outputText("[Themonster]的皮肤泛起红晕，因为[monster.he]不经意间沐浴在你的气息中。");
               }
            }
            else if(!get_monster().get_plural())
            {
               outputText("你的光环对[themonster]的影响非常明显，[monster.he]开始发抖，并偷偷瞥向你的身体。");
            }
            else
            {
               outputText("你的光环对[themonster]产生了明显的影响，[monster.he]开始发抖，并偷偷打量你的身体。");
            }
            if(get_monster().lustVuln > 0)
            {
               get_monster().teased(2 + Utils.rand(4));
            }
            outputText("[pg]");
         }
         if(get_player().hasStatusEffect(StatusEffects.Bound) && get_game().ceraphScene.hasBondage())
         {
            outputText("紧绷的皮革将你完全固定住的感觉让你越来越兴奋。就这样等着让她这样玩弄你，真的有那么糟糕吗？");
            get_player().takeLustDamage(3,true);
            outputText("[pg]");
         }
         if(get_monster() is Dullahan && get_monster().get_lust() >= 40)
         {
            outputText("无头骑士皱了皱眉，将注意力集中在你身上。看来她已经成功说服自己的身体<b>忽略掉一部分不断增长的欲望。</b>[pg]");
            _loc3_ = get_monster();
            _loc3_.set_lust(_loc3_.get_lust() - 10);
            if(get_monster().get_lust() < 0)
            {
               get_monster().set_lust(0);
            }
         }
         if(get_player().hasStatusEffect(StatusEffects.ParasiteSlugMusk))
         {
            if(get_player().statusEffectv1(StatusEffects.ParasiteSlugMusk) > 0)
            {
               outputText("寄生虫的麝香继续弥漫在战场上。[pg]");
               if(get_monster().get_lust() < 50)
               {
                  outputText("它似乎还没有对[themonster]产生太大影响。");
               }
               if(get_monster().get_lust() < 70 && get_monster().get_lust() >= 50)
               {
                  outputText("它似乎让[themonster]感到困扰，因为[monster.he]扭动了一下，呼吸变得沉重。");
               }
               if(get_monster().get_lust() >= 70)
               {
                  outputText("[Monster.he]明显发情了，并且只要有机会，[monster.he]就会心甘情愿地吸入这些麝香。");
               }
               if(get_player().get_lust() > 90)
               {
                  outputText("你也绝对受到了影响。你几乎无法克制住当场自慰的冲动！你必须尽快结束这一切。");
               }
               get_player().addStatusValue(StatusEffects.ParasiteSlugMusk,1,-1);
               get_monster().takeLustDamage(10 * get_monster().lustVuln);
               dynStats(DynStat.Lust(5));
               outputText("[pg]");
            }
            else
            {
               get_player().removeStatusEffect(StatusEffects.ParasiteSlugMusk);
               outputText("麝香消散了，你和敌人都再次恢复了顺畅的呼吸。");
            }
         }
         if(get_player().hasStatusEffect(StatusEffects.Marked))
         {
            if(get_player().statusEffectv1(StatusEffects.Marked) > 0)
            {
               outputText("你仍然处于被诅咒的状态。[pg]");
               get_player().addStatusValue(StatusEffects.Marked,1,-1);
            }
            else
            {
               outputText("你不再被诅咒了！[pg]");
               get_player().removeStatusEffect(StatusEffects.Marked);
            }
         }
         if(get_player().hasStatusEffect(StatusEffects.GooArmorBind))
         {
            if(get_game().ceraphScene.hasBondage())
            {
               outputText("被全方位包裹的黏液固定住无助身体的感觉让你越来越兴奋。也许你应该干脆等它完全把你固定住，任由它摆布。");
               get_player().takeLustDamage(3,true);
            }
            else
            {
               outputText("你被周围流动的黏液完全固定住了。你必须挣脱出来！");
            }
            outputText("[pg]");
         }
         if(get_player().hasStatusEffect(StatusEffects.HarpyBind))
         {
            if(get_game().ceraphScene.hasBondage())
            {
               outputText("鹰身女妖们把你按在地上并束缚住你，让你的挣扎变得更加甜美！");
               get_player().takeLustDamage(3,true);
               outputText("[pg]");
            }
            else
            {
               outputText("你被鹰身女妖们束缚住了，这样她们就可以肆无忌惮地殴打你。你需要挣扎着逃脱！[pg]");
            }
         }
         if(get_player().hasStatusEffect(StatusEffects.NagaBind) && get_game().ceraphScene.hasBondage())
         {
            outputText("被娜迦紧紧缠绕并完全固定住，多亏了你的束缚癖，你忍不住兴奋起来。");
            get_player().takeLustDamage(5,true);
            outputText("[pg]");
         }
         if(get_player().hasStatusEffect(StatusEffects.TentacleBind))
         {
            outputText("你被触手的缠绕死死困住了。<b>你唯一能尝试做的就是挣脱出来！</b>[pg]");
            if(get_game().ceraphScene.hasBondage())
            {
               outputText("被触手紧紧包裹着，你发现自己很难抗拒变得越来越兴奋……");
               get_player().takeLustDamage(3,true);
               outputText("[pg]");
            }
         }
         if(get_player().hasStatusEffect(StatusEffects.DriderKiss))
         {
            if(get_player().statusEffectv1(StatusEffects.DriderKiss) == 0)
            {
               outputText("当蛛化精灵赤裸、充满异国情调的身体压在你身上的画面袭来时，你的心跳加快了一些。如果她再吻你，情况只会变得更糟……");
               get_player().takeLustDamage(8,true);
               outputText("[pg]");
            }
            else if(get_player().statusEffectv1(StatusEffects.DriderKiss) == 1)
            {
               outputText("你颤抖着呻吟出声，几乎要抚摸自己，因为你的");
               if(get_player().get_gender() > 0)
               {
                  outputText("下体一阵酥麻并渗出淫液，渴望着蛛化精灵的每一次触碰。");
               }
               else
               {
                  outputText("后庭一阵酥麻抽搐，渴望着被填满。");
               }
               outputText("天哪，她的毒液让你欲火焚身。你必须尽快结束这一切！");
               get_player().takeLustDamage(15,true);
               outputText("[pg]");
            }
            else
            {
               outputText("你不得不把手从胯部移开——在这里当场自慰，乞求蛛化精灵给你更多湿吻的诱惑实在太大了。随着时间一秒秒流逝，你的性欲越来越高涨。如果你不快点结束这一切，你觉得你坚持不了多久了。你太兴奋了……太饥渴了……意志太薄弱了，无法再抵抗下去了……");
               get_player().takeLustDamage(25,true);
               outputText("[pg]");
            }
         }
         if(get_player().hasCock() && get_player().hasStatusEffect(StatusEffects.Luststick) && (get_monster().get_short() == "harpy" || get_monster().get_short() == "Sophie"))
         {
            if(get_player().hasPerk(PerkLib.Medicine) && Utils.rand(100) <= 14)
            {
               outputText("你凭借医学知识，成功地清除了体内的鹰身女妖唇彩！[pg]");
               get_player().removeStatusEffect(StatusEffects.Luststick);
            }
            else if(Utils.rand(5) == 0)
            {
               if(Utils.rand(2) == 0)
               {
                  outputText("一个幻想不知从何处涌现，占据了你片刻的思绪。在幻想中，你躺在一个柔软的巢穴里。镶着金边的嘴唇正吵闹地吸吮着你的[cock]，把她那乱七八糟的催情剂涂抹在上面，直到你完全被它覆盖。她心领神会地抬头看着你，因为你们俩准备好要交配一整夜了……[pg]");
               }
               else
               {
                  outputText("一个无聊的白日梦飘进你的脑海。在梦里，你正在操一个鹰身女妖的屁眼，紧紧抓住她宽阔的、长满羽毛的侧腹，她紧致的后庭环按摩着你的[cock]。她呻吟着转过身来亲吻你的嘴唇，确保你的硬度。没过多久，她狂热的欢愉呼噜声加剧了，你感觉到她正在产下的蛋透过她的内壁挤压着你……");
               }
               get_player().takeLustDamage(20,true);
               outputText("[pg]");
            }
         }
         if(get_player().hasStatusEffect(StatusEffects.StoneLust))
         {
            if(int(get_player().vaginas.length) > 0)
            {
               if(get_player().get_lust100() < 40)
               {
                  outputText("光滑的石球在你体内震动，让你扭动着身体。");
               }
               if(get_player().get_lust100() >= 40 && get_player().get_lust100() < 70)
               {
                  outputText("为了回应持续不断的色情震动，你不由自主地夹紧了小穴里的魔法石。");
               }
               if(get_player().get_lust100() >= 70 && get_player().get_lust100() < 85)
               {
                  outputText("你惊讶地踉跄了一下，因为你" + get_player().vaginaDescript(0) + "里那颗光滑的石球突然爆发出一阵特别令人愉悦的震动。");
               }
               if(get_player().get_lust100() >= 85)
               {
                  outputText("你体内的魔法球让你很难将注意力集中在战斗上，每一次新的动作都让白热的欲望充满你的身体。");
               }
            }
            else
            {
               outputText("圆球继续在你的屁股里震动，尽其所能地唤起你的性欲。");
            }
            get_player().takeLustDamage(7 + int(get_player().sens) / 10,true);
            outputText("[pg]");
         }
         if(get_player().hasStatusEffect(StatusEffects.KissOfDeath))
         {
            outputText("你的嘴唇因突如其来的灼热而燃烧。当一团灵质气体从你的嘴唇中逸出时，它们因邪恶的能量而刺痛和燃烧。那团气体一定是你灵魂的一部分！它在空中飞向魅魔，魅魔像吃美味零食一样把它吸了下去。你感到狂热和疲惫……");
            takeDamage(15,true);
            get_player().takeLustDamage(5,true);
            outputText("[pg]");
         }
         if(get_player().hasStatusEffect(StatusEffects.DemonSeed))
         {
            outputText("你感觉到体内有什么东西在移动，让你感到温暖。想要对抗这个……大块头的欲望越来越难了。");
            get_player().takeLustDamage(get_player().statusEffectv1(StatusEffects.DemonSeed) + int(get_player().sens / 30) + int(get_player().lib / 30) + int(get_player().cor / 30),true);
            outputText("[pg]");
         }
         if(get_player().get_inHeat() && int(get_player().vaginas.length) > 0 && get_monster().totalCocks() > 0)
         {
            outputText("你的" + get_player().vaginaDescript(0) + "因为本能地渴望被触摸和填满而收缩。");
            outputText("如果你不快点结束这一切，你就会屈服于你的发情期。");
            get_player().takeLustDamage(Utils.rand(get_player().lib / 5) + 3 + Utils.rand(5),true);
            outputText("[pg]");
         }
         if(get_player().get_inRut() && get_player().totalCocks() > 0 && get_monster().hasVagina())
         {
            if(get_player().totalCocks() > 1)
            {
               outputText("你的每一根");
            }
            else
            {
               outputText("你");
            }
            if(get_monster().get_plural())
            {
               outputText("[cocks]滴下先列腺液，你幻想着就在此时此地把[themonster]给办了，操[monster.his]" + get_monster().vaginaDescript() + "直到它们完全受精怀孕。");
            }
            else
            {
               outputText("的[cocks]滴下先列腺液，你幻想着就在此时此地把[themonster]给办了，操[monster.his]" + get_monster().vaginaDescript() + "直到它完全受精怀孕。");
            }
            get_player().takeLustDamage(Utils.rand(get_player().lib / 5) + 3 + Utils.rand(5),true);
            outputText("[pg]");
         }
         if(get_player().hasStatusEffect(StatusEffects.TemporaryHeat))
         {
            if(get_player().hasPerk(PerkLib.Medicine) && Utils.rand(100) <= 14)
            {
               outputText("你运用医学知识，成功清除了体内的发情药物！[pg]");
               get_player().removeStatusEffect(StatusEffects.TemporaryHeat);
            }
            else
            {
               if(get_player().hasVagina())
               {
                  outputText("你的" + get_player().vaginaDescript(0) + "紧缩着，本能地渴望被抚摸和填满。");
               }
               else if(get_player().totalCocks() > 0)
               {
                  outputText("你的[cock]跳动抽搐着，被繁殖的欲望所淹没。");
               }
               if(get_player().get_gender() == 0)
               {
                  outputText("你感到[asshole]一阵刺痛，想要抚摸和填满它的冲动几乎要将你淹没。");
               }
               outputText("如果你不快点结束这一切，你就会屈服于这种强效药物！");
               get_player().takeLustDamage(get_player().lib / 12 + 5 + Utils.rand(5) * get_player().statusEffectv2(StatusEffects.TemporaryHeat));
               outputText("[pg]");
            }
         }
         if(get_player().hasStatusEffect(StatusEffects.Poison))
         {
            if(get_player().hasPerk(PerkLib.Medicine) && Utils.rand(100) <= 14)
            {
               outputText("你运用医学知识，成功清除了体内的毒素！[pg]");
               get_player().removeStatusEffect(StatusEffects.Poison);
            }
            else
            {
               outputText("毒素继续在你的体内发作，让你痛苦不堪！");
               takeDamage(8 + Utils.rand(get_player().maxHP() / 20) * get_player().statusEffectv2(StatusEffects.Poison),true);
               outputText("[pg]");
            }
         }
         if(get_player().hasStatusEffect(StatusEffects.MosquitoNumb))
         {
            get_player().addStatusValue(StatusEffects.MosquitoNumb,1,get_player().hasPerk(PerkLib.Medicine) ? -2 : -1);
            if(get_player().statusEffectv1(StatusEffects.MosquitoNumb) > 0)
            {
               outputText("蚊子的麻醉剂继续在你的体内肆虐，削弱了你的战斗能力。[pg]");
            }
            else
            {
               outputText("蚊子的麻醉剂终于被完全排出体外了！");
            }
         }
         if(get_game().ceraphScene.hasBondage() && get_player().inBondageClothes())
         {
            outputText("[armor]紧紧贴着你的身体，同时又暴露了这么多肌肤，这种感觉让你更加兴奋了。");
            get_player().takeLustDamage(2,true);
            outputText("[pg]");
         }
         if(get_player().hasStatusEffect(StatusEffects.GiantBoulder))
         {
            outputText("<b>有一块巨石朝你滚来。如果你不及时躲避，可能会受到严重的伤害。</b>[pg]");
         }
         if(get_player().hasStatusEffect(StatusEffects.PurpleHaze))
         {
            get_player().addStatusValue(StatusEffects.PurpleHaze,1,-1);
            if(get_player().statusEffectv1(StatusEffects.PurpleHaze) <= 0)
            {
               get_player().removeStatusEffect(StatusEffects.PurpleHaze);
               get_player().removeStatusEffect(StatusEffects.Blind);
               outputText("曾经遮挡你视线的漩涡迷雾散去了，让你再次看清了你的敌人！[b:你不再失明了！]");
            }
            else
            {
               outputText("紫色的薄雾让你的视野中充满了露骨的情色画面，让你兴奋不已。");
               get_player().takeLustDamage(3,true);
            }
            outputText("[pg]");
         }
         if(get_player().hasStatusEffect(StatusEffects.TaintedMind))
         {
            get_player().addStatusValue(StatusEffects.TaintedMind,1,-1);
            if(get_player().statusEffectv1(StatusEffects.TaintedMind) <= 0)
            {
               get_player().removeStatusEffect(StatusEffects.TaintedMind);
               outputText("蛛化精灵的一些魔法消退了，你举起了你的[weapon]。再也不用像恶魔一样战斗了！");
            }
            outputText("[pg]");
         }
         if(get_player().hasStatusEffect(StatusEffects.MinotaurKingMusk))
         {
            outputText("<b>牛头怪信息素的气味非常浓烈，让你兴奋不已。你应该尽快解决他。</b>");
            get_player().takeLustDamage(2,true);
            outputText("[pg]");
         }
         if(get_player().hasStatusEffect(StatusEffects.MinotaurKingsTouch))
         {
            outputText("<b>牛头怪国王残留的精液继续让你兴奋。</b>");
            get_player().takeLustDamage(1,true);
            outputText("[pg]");
         }
         if(get_player().hasStatusEffect(StatusEffects.PigbysHands))
         {
            get_player().takeLustDamage(3,true);
         }
         if(get_player().hasStatusEffect(StatusEffects.WhipSilence))
         {
            if(get_player().statusEffectv1(StatusEffects.WhipSilence) > 0)
            {
               outputText("<b>缠绕在你脖子上的燃烧绳索让你无法发声。这很痛苦……但也让你兴奋。</b>");
               get_player().takeDamage(10 + Utils.rand(8),true);
               get_player().takeLustDamage(4,true);
               get_player().addStatusValue(StatusEffects.WhipSilence,1,-1);
               outputText("[pg]");
            }
            else
            {
               outputText("绳索终于松开了，从你的脖子上掉下来。它立刻消散了。你现在可以再次施法了！[pg]");
               get_player().removeStatusEffect(StatusEffects.WhipSilence);
            }
         }
         _loc2_ = get_player().statusEffects.slice(0);
         _loc1_ = 0;
         while(_loc1_ < int(_loc2_.length))
         {
            _loc6_ = _loc2_[_loc1_];
            _loc1_++;
            _loc6_.onCombatRound();
         }
         _loc1_ = 0;
         var _loc7_:Array = get_monsterArray();
         while(_loc1_ < int(_loc7_.length))
         {
            _loc3_ = _loc7_[_loc1_];
            _loc1_++;
            _loc2_ = _loc3_.statusEffects.slice(0);
            _loc8_ = 0;
            while(_loc8_ < int(_loc2_.length))
            {
               _loc6_ = _loc2_[_loc8_];
               _loc8_++;
               _loc6_.onCombatRound();
            }
         }
         regeneration(true);
         if(get_player().get_lust() >= get_player().maxLust())
         {
            doNext(endLustLoss);
         }
         if(get_player().get_HP() <= 0)
         {
            doNext(endHpLoss);
         }
      }
      
      public function combatRoundOver(param1:Boolean = false) : Boolean
      {
         blockTurn = false;
         currEnemy = 0;
         currAbilityUsed = null;
         damageTaken = 0;
         if(param1)
         {
            combatAbilities.updateCooldowns();
            combatRound += 1;
            get_inventory().usedItem = false;
            get_player().resetSeals();
         }
         statScreenRefresh();
         damageType = "NoAttack";
         monsterDamageType = "NoAttack";
         if(endFightCheck())
         {
            return true;
         }
         var _loc2_:Object = overrideEndOfRoundFunction;
         doNext(_loc2_ != null ? _loc2_ : playerMenu);
         return false;
      }
      
      public function combatMenu(param1:Boolean = true, param2:String = undefined) : void
      {
         var control:Boolean;
         var _g1:CombatAbilities;
         var _g:CombatAbilities;
         var _loc3_:int = 0;
         var _loc4_:* = null as ConstrictedDebuff;
         if(param2 == null)
         {
            param2 = "";
         }
         clearOutput();
         outputText(param2);
         get_mainView().monsterStatsView.show();
         overrideEndOfRoundFunction = null;
         if(param1)
         {
            playerTurn = true;
         }
         get_mainView().updateCombatView();
         if(int(get_monsterArray().length) != 0)
         {
            _loc3_ = 0;
            while(_loc3_ < int(get_monsterArray().length))
            {
               get_monsterArray()[_loc3_].tookAction = false;
               _loc3_++;
            }
            set_monster(get_monsterArray()[currTarget]);
         }
         else
         {
            get_monster().tookAction = false;
         }
         FlagDict_Impl_.arrayWriteInt(KFLAGS.flags,22,0);
         get_mainView().hideMenuButton("data");
         get_mainView().hideMenuButton("appearance");
         get_mainView().hideMenuButton("perks");
         hideUpDown();
         if(param1)
         {
            combatStatusesUpdate();
         }
         display();
         statScreenRefresh();
         if(combatRoundOver())
         {
            return;
         }
         menu();
         combatAbilities.attackAb.createButton(0);
         combatAbilities.teaseAb.createButton(1);
         if(combatAbilities.canUseMagic())
         {
            addButton(2,"法术",combatAbilities.magicMenu).hint("打开你的法术菜单，你可以在那里施放你学过的任何法术。注意，施放法术会增加你的疲劳，如果你精疲力竭，你将更容易被击败。");
         }
         addButton(3,"物品",get_inventory().inventoryMenu).hint("物品栏允许你使用物品。小心，在战斗中使用物品会让你容易受到反击。").disableIf(get_player().isClumsy,"你不能使用物品！");
         if(get_player().get_weaponName() != "Light Rail Avenger")
         {
            combatAbilities.run.createButton(4);
         }
         else
         {
            _g = combatAbilities;
            addButton(4,"复仇",function():void
            {
               _g.lightRailAvenger();
            }).hint("真正的武士道追随者从不逃跑。释放你独特的技巧，轻轨复仇者，惩戒这个蠢货！");
         }
         addButton(5,"物理特攻",combatAbilities.physicalSpecials).hint("物理特殊攻击菜单。","物理特殊攻击");
         addButton(6,"魔法特攻",combatAbilities.magicalSpecials).hint("精神与超自然特殊攻击菜单。","魔法特殊攻击");
         combatAbilities.waitAb.createButton(7);
         if(get_monster().hasStatusEffect(StatusEffects.Level))
         {
            addButton(7,"攀爬",wait).hint("爬上沙子，远离流沙陷阱。");
         }
         combatAbilities.fantasize.createButton(8);
         combatAbilities.distanceSelfAb.createButton(10);
         combatAbilities.approachSelf.createButton(11);
         if(CoC_Settings.debugBuild && !get_debug())
         {
            addButton(9,"检查",debugInspect).hint("使用你的调试能力来检查你的敌人。");
         }
         if(CoC_Settings.debugBuild || get_debug())
         {
            addButton(14,"属性",get_game().playerInfo.displayStats).hint("查看你的属性。");
         }
         if(get_player().hasStatusEffect(StatusEffects.Disarmed) && get_player().isUnarmed() && get_monster() is Dullahan)
         {
            addButton(7,"抓取武器",wait).hint("冲过去抓住你的武器！");
         }
         if(get_monster() is DriderIncubus && !get_monster().get_goblinFree())
         {
            addButton(12,"释放地精",get_monster().freeGoblin);
         }
         if(get_monster() is Lethice && get_player().hasStatusEffect(StatusEffects.LethicesRapeTentacles))
         {
            if(get_player().abilityAvailable(OneOf_Impl_.fromA("Whitefire"),{"inCombat":true}))
            {
               addButton(12,"驱散",get_monster().dispellRapetacles).hint("用火驱散触手。");
            }
         }
         if(get_player().hasStatusEffect(StatusEffects.TFTerraStar))
         {
            _g1 = combatAbilities;
            control = true;
            addButton(13,"控制星星",function():void
            {
               _g1.tfTerraStarAttack(control);
            }).hint("手动引导你的星星以提高准确度，并有机会获得额外效果。");
         }
         if(int(get_monsterArray().length) != 0)
         {
            if(get_monsterArray()[currTarget].get_HP() <= 0 || get_monsterArray()[currTarget].hasStatusEffect(StatusEffects.GuardAB) || get_monsterArray()[currTarget].get_lust() >= get_monsterArray()[currTarget].maxLust() && !get_monsterArray()[currTarget].ignoreLust)
            {
               multiAttack(int(getLowestLivingTarget()));
            }
            if(combatRound == 0 && param1)
            {
               multiAttack(0);
            }
         }
         if(get_monster().hasStatusEffect(StatusEffects.AttackDisabled))
         {
            outputText("\n<b>像你这样被锁链锁住，你无法进行任何真正的物理攻击！</b>");
            addButtonDisabled(0,"攻击","像你这样被锁链锁住，你无法进行任何物理攻击！");
         }
         if(!combatAbilities.canUsePAtk())
         {
            addButtonDisabled(5,"物理特攻","你无法使用物理攻击！");
         }
         if(!combatAbilities.canUseMagic() && get_player().spellCount() > 0)
         {
            addButtonDisabled(2,"法术","你无法使用法术！");
         }
         if(!combatAbilities.canUseMAtk())
         {
            addButtonDisabled(6,"魔法特攻","你无法使用魔法能力！");
         }
         if(get_player().hasStatusEffect(StatusEffects.SentinelPhysicalDisabled) || get_player().isAtrophied || !get_combatRangeData().canReach(get_player(),get_monster(),get_monster().distance,get_player().get_weapon().getAttackRange()))
         {
            addButtonDisabled(0,"攻击",getAttackBlockReason());
         }
         if(get_player().hasStatusEffect(StatusEffects.SentinelNoTease) || get_player().isPrude)
         {
            addButtonDisabled(1,"挑逗","你无法挑逗！");
         }
         if(isPlayerBound())
         {
            menu();
            addButton(0,"挣扎",struggle);
            addButton(1,"等待",combatAbilities.waitAb.execAbility);
            if(get_monster() is Lethice && get_player().statusEffectv3(StatusEffects.LethicesRapeTentacles) > 0)
            {
               addButton(1,"等待",get_monster().grappleWait);
               if(get_player().abilityAvailable(OneOf_Impl_.fromA("Whitefire"),{"inCombat":true}))
               {
                  addButton(2,"驱散",get_monster().dispellRapetacles).hint("用火焰驱散触手。");
               }
            }
         }
         if(isPlayerStunned(param1))
         {
            menu();
            addButton(0,"恢复",combatAbilities.waitAb.execAbility);
            combatAbilities.powerThroughAb.createButton(1);
         }
         else if(get_monster().hasStatusEffect(StatusEffects.Constricted))
         {
            menu();
            _loc4_ = get_monster().statusEffectByType(StatusEffects.Constricted);
            addNextButton("挤压",_loc4_.squeeze).hint("从对手身上挤出一些生命值！[pg]疲劳消耗: " + get_player().physicalCost(20) + "");
            combatAbilities.getAbilityByID("Naga Tease").createButton();
            combatAbilities.getAbilityByID("Naga Bite").createButton();
            addNextButton("释放",_loc4_.release);
         }
         if(get_player().hasStatusEffect(StatusEffects.TFSupercharging))
         {
            menu();
            addButton(0,"聚集能量",combatAbilities.tfSupercharge);
         }
      }
      
      public function combatCritical(param1:Creature, param2:Creature, param3:Boolean = false) : Boolean
      {
         var _loc4_:Number = param1.getBaseCritChance();
         if(param3)
         {
            _loc4_ += param1.getMeleeCritBonus();
         }
         if(param2 is VolcanicGolem && param2.hasStatusEffect(StatusEffects.Stunned))
         {
            _loc4_ += 40;
         }
         if(param1.hasPerk(PerkLib.Bloodhound) && param2.isBleeding())
         {
            _loc4_ += 10;
         }
         return Utils.rand(100) < _loc4_;
      }
      
      public function combatBlock(param1:Creature, param2:Creature, param3:Boolean = false) : Boolean
      {
         if(param2.hasStatusEffect(StatusEffects.Retribution))
         {
            return false;
         }
         if(param2.hasStatusEffect(StatusEffects.TFSupercharging))
         {
            return false;
         }
         var _loc4_:int = int(20 + param2.get_shieldBlock() + Math.floor((param2.get_str() - param1.get_str()) / 5));
         if(param2.hasPerk(PerkLib.ShieldMastery) && param2.get_tou() >= 50)
         {
            _loc4_ += int((param2.get_tou() - 50) / 5);
         }
         if(param2.masteryLevel(MasteryLib.Shield) >= 5)
         {
            _loc4_ += 5;
         }
         if(param2.statusEffectv1(StatusEffects.Resolve) == 2)
         {
            _loc4_ -= int(param2.statusEffectv3(StatusEffects.Resolve));
         }
         if(_loc4_ < 10)
         {
            _loc4_ = 10;
         }
         var _loc5_:int = int(param2.maxFatigue() - param2.physicalCost(10));
         if(_loc4_ >= Utils.rand(100) + 1 && param2.get_fatigue() <= _loc5_ && param2.get_shieldName() != "nothing" && param2.get_shieldName() != "")
         {
            if(param3)
            {
               param2.changeFatigue(10,2);
            }
            if(param2 is Player)
            {
               get_player().masteryXP(MasteryLib.Shield,5 + Utils.rand(31));
            }
            return true;
         }
         if(param2 is Player && param2.get_shieldName() != "nothing" && param2.get_shieldName() != "")
         {
            get_player().masteryXP(MasteryLib.Shield,5 + Utils.rand(11));
         }
         return false;
      }
      
      public function combatAvoidDamage(param1:AvoidDamageParameters) : Object
      {
         var _loc2_:Creature = param1.attacker != null ? param1.attacker : get_game().player;
         var _loc3_:Creature = param1.defender != null ? param1.defender : get_game().monster;
         var _loc4_:Number = !Boolean(Math.isNaN(param1.toHitChance)) ? param1.toHitChance : _loc3_.standardDodgeFunc(_loc2_);
         var _loc5_:* = {
            "dodge":null,
            "parry":false,
            "block":false,
            "counter":false,
            "attackHit":true,
            "attackFailed":false
         };
         if(get_player().hasStatusEffect(StatusEffects.TimeFrozen))
         {
            return _loc5_;
         }
         if(param1.doCounter)
         {
            _loc5_.counter = _loc2_.attackCountered(_loc3_);
         }
         if(param1.doDodge)
         {
            _loc5_.dodge = _loc3_.getEvasionReason(_loc2_,_loc4_);
            if(_loc2_.hasPerk(PerkLib.Frustration))
            {
               if(_loc5_.dodge != null)
               {
                  _loc2_.addPerkValue(PerkLib.Frustration,1,10);
               }
               else
               {
                  _loc2_.setPerkValue(PerkLib.Frustration,1,0);
               }
            }
         }
         if(_loc3_.hasStatusEffect(StatusEffects.Backstab) && (_loc5_.dodge == null || _loc5_.dodge == ""))
         {
            _loc3_.changeStatusValue(StatusEffects.Backstab,1,1);
         }
         if(_loc5_.dodge == null)
         {
            if(param1.doParry)
            {
               _loc5_.parry = _loc3_.combatParry();
            }
            if(Boolean(_loc5_.parry) == false && param1.doBlock)
            {
               _loc5_.block = combatBlock(_loc2_,_loc3_,param1.doFatigue);
            }
         }
         _loc5_.attackHit = !_loc5_.counter && !Boolean(_loc5_.parry) && !Boolean(_loc5_.block) && _loc5_.dodge == null;
         _loc5_.attackFailed = !Boolean(_loc5_.attackHit);
         return _loc5_;
      }
      
      public function colorText(param1:DamageColor, param2:String) : String
      {
         var _loc3_:* = null as String;
         switch(param1.index)
         {
            case 0:
               _loc3_ = get_mainViewManager().colorHpMinus();
               break;
            case 1:
               _loc3_ = get_mainViewManager().colorHpPlus();
               break;
            case 2:
               _loc3_ = get_mainViewManager().colorLustPlus();
         }
         return "<font color=\"" + _loc3_ + "\">" + param2 + "</font>";
      }
      
      public function clearStatuses() : void
      {
         get_player().clearStatuses();
         var _loc1_:Array = get_monster().statusEffects.slice(0);
         var _loc2_:int = int(_loc1_.length);
         var _loc3_:int = 0;
         while(_loc3_ < _loc2_)
         {
            _loc1_[_loc3_].onCombatEnd();
            _loc3_++;
         }
      }
      
      public function cleanupAfterCombatNewPage(param1:Object = undefined, param2:Boolean = true) : void
      {
         clearOutput();
         cleanupAfterCombat(param1,param2);
      }
      
      public function cleanupAfterCombat(param1:Object = undefined, param2:Object = undefined) : void
      {
         var timeUsed2:int;
         var _g2:Camp;
         var timeUsed1:int;
         var _g1:Camp;
         var timeUsed:int;
         var _g:Camp;
         var _loc3_:* = null as IMap;
         var _loc4_:int = 0;
         var _loc5_:int = 0;
         var _loc6_:* = null as Player;
         var _loc7_:* = null as ItemType;
         var _loc8_:* = null as Inventory;
         if(param2 == null)
         {
            param2 = true;
         }
         if(param2 == null)
         {
            param2 = true;
         }
         generalCleanup();
         if(param1 == null)
         {
            param1 = get_camp().returnToCampUseOneHour;
         }
         if(get_inDungeon() && get_game().dungeons.usingAlternative)
         {
            param1 = get_game().dungeons.currDungeon.runFunc;
         }
         if(get_inCombat())
         {
            clearStatuses();
            imageText = "";
            if(totalHP() < 1 || lustVictory())
            {
               if(totalHP() < 1)
               {
                  _loc3_ = KFLAGS.flags;
                  FlagDict_Impl_.arrayWriteInt(_loc3_,2373,FlagDict_Impl_.arrayReadInt(_loc3_,2373) + 1);
               }
               awardPlayer(param1,param2);
            }
            else
            {
               if(get_monster().statusEffectv1(StatusEffects.Sparring) == 2)
               {
                  outputText("牛娘在练习战中击败了你！");
                  outputText("[pg]你不得不靠在伊莎贝拉的肩膀上，两人一起跋涉回营地。很明显，她赢了。");
                  set_inCombat(false);
                  get_player().set_HP(1);
                  statScreenRefresh();
                  doNext(param1);
                  return;
               }
               if(!param2)
               {
                  set_inCombat(false);
                  if(get_player().get_HP() < 1)
                  {
                     get_player().set_HP(1);
                  }
                  statScreenRefresh();
                  doNext(param1);
                  return;
               }
               if(get_monster() is TrainingDummy && get_player().get_lust() <= get_player().minLust() && get_player().get_HP() > 0)
               {
                  set_inCombat(false);
                  if(get_player().get_HP() < 1)
                  {
                     get_player().set_HP(1);
                  }
                  statScreenRefresh();
                  doNext(param1);
                  return;
               }
               _loc4_ = int(Utils.rand(10) + 1 + Math.round(get_monster().level / 2));
               if(get_inDungeon())
               {
                  _loc4_ += int(20 + get_monster().level * 2);
               }
               _loc4_ *= 1 + get_player().newGamePlusMod() * 0.5;
               _loc4_ = int(Math.round(_loc4_));
               if(_loc4_ > get_player().get_gems())
               {
                  _loc4_ = get_player().get_gems();
               }
               _loc5_ = get_monster().handleCombatLossText(get_inDungeon(),_loc4_);
               _loc6_ = get_player();
               _loc6_.set_gems(_loc6_.get_gems() - _loc4_);
               set_inCombat(false);
               if(FlagDict_Impl_.arrayReadFloat(KFLAGS.flags,89) > 0)
               {
                  var _temp_1:* = get_player();
                  _temp_1.XP = _temp_1.XP + FlagDict_Impl_.arrayReadFloat(KFLAGS.flags,89);
                  outputText("不知怎么的，你从这次经历中获得了 " + FlagDict_Impl_.arrayReadFloat(KFLAGS.flags,89) + " 点经验值。");
                  FlagDict_Impl_.arrayWriteFloat(KFLAGS.flags,89,0);
               }
               if(get_player().isDisarmed() && !get_player().rearm())
               {
                  _loc7_ = get_player().getDisarmed();
                  outputText("你捡起了你的 " + Utils.cnName(_loc7_.get_longName()) + "。[pg]");
                  _loc8_ = get_inventory();
                  _g = get_camp();
                  timeUsed = _loc5_;
                  _loc8_.takeItem(_loc7_,function():void
                  {
                     _g.returnToCamp(timeUsed);
                  });
               }
               else if(checkBonusItem())
               {
                  _loc7_ = getBonusItem();
                  outputText("不知怎么的，你带着 " + Utils.cnName(_loc7_.get_longName()) + " 离开了这场遭遇战。[pg]");
                  _loc8_ = get_inventory();
                  _g1 = get_camp();
                  timeUsed1 = _loc5_;
                  _loc8_.takeItem(_loc7_,function():void
                  {
                     _g1.returnToCamp(timeUsed1);
                  });
               }
               else
               {
                  _g2 = get_camp();
                  timeUsed2 = _loc5_;
                  doNext(function():void
                  {
                     _g2.returnToCamp(timeUsed2);
                  });
               }
            }
         }
         else
         {
            doNext(param1);
         }
      }
      
      public function checkBonusItem() : Boolean
      {
         return FlagDict_Impl_.arrayReadString(KFLAGS.flags,234) != "";
      }
      
      public function checkAchievementDamage(param1:Number) : void
      {
         var _loc2_:IMap = KFLAGS.flags;
         FlagDict_Impl_.arrayWriteInt(_loc2_,2085,FlagDict_Impl_.arrayReadInt(_loc2_,2085) + int(param1));
         if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,2085) >= 50000)
         {
            get_game().awardAchievement("放血者",88);
         }
         if(param1 >= 50)
         {
            get_game().awardAchievement("痛击",82);
         }
         if(param1 >= 100)
         {
            get_game().awardAchievement("断肢",83);
         }
         if(param1 >= 250)
         {
            get_game().awardAchievement("碎骨",84);
         }
         if(param1 >= 500)
         {
            get_game().awardAchievement("过量击杀",85);
         }
      }
      
      public function canTarget(param1:int) : Boolean
      {
         if(get_monsterArray()[param1].get_HP() > 0 && (get_monsterArray()[param1].get_lust() < get_monsterArray()[param1].maxLust() || get_monsterArray()[param1].ignoreLust))
         {
            return !get_monsterArray()[param1].hasStatusEffect(StatusEffects.GuardAB);
         }
         return false;
      }
      
      public function calcWeaponDamage(param1:Boolean = false) : int
      {
         var _loc2_:int = int(Math.round(get_player().getBonusStat("攻击伤害")));
         var _loc3_:Number = get_player().getBonusStatMultiplicative("攻击伤害");
         if(get_player().get_weapon().isUnarmed())
         {
            _loc2_ += int(Math.round(get_player().getBonusStat("肉体伤害")));
            _loc3_ *= get_player().getBonusStatMultiplicative("肉体伤害");
         }
         var _loc4_:int = 0;
         if(get_player().get_weapon().isFirearm())
         {
            _loc4_ = 2;
         }
         if(get_player().get_weapon().isChanneling())
         {
            _loc4_ = 1;
         }
         return generalDamageCalc(true,int(Math.round(get_player().get_weaponAttack())),param1,_loc4_,_loc2_,_loc3_);
      }
      
      public function calcBodyDamage(param1:int = 0, param2:Boolean = false) : int
      {
         var _loc3_:int = int(Math.round(get_player().getBonusStat("肉体伤害")));
         var _loc4_:Number = get_player().getBonusStatMultiplicative("肉体伤害");
         return generalDamageCalc(false,param1,param2,0,_loc3_,_loc4_);
      }
      
      public function bodyMod(param1:Number) : Number
      {
         param1 += get_player().getBonusStat("肉体伤害");
         return param1 * get_player().getBonusStatMultiplicative("肉体伤害");
      }
      
      public function beginCombatMultiple(param1:Array, param2:Function, param3:Function, param4:Function, param5:Function, param6:String = undefined, param7:Boolean = false, param8:Boolean = true) : void
      {
         if(param6 == null)
         {
            param6 = "";
         }
         currTarget = 0;
         get_monsterArray().resize(0);
         set_monsterArray(param1.slice(0));
         hpvictoryFunc = param2;
         hplossFunc = param3;
         lustvictoryFunc = param4;
         lustlossFunc = param5;
         description = param6;
         set_monster(get_monsterArray()[0]);
         setUpCombatEnvironment(param7,param8);
      }
      
      public function beginCombat(param1:Monster, param2:Boolean = false, param3:Boolean = true) : void
      {
         var pcCameWorms1:Boolean;
         var hpVictory3:Boolean;
         var _g3:Monster;
         var hpVictory2:Boolean;
         var _g2:Monster;
         var pcCameWorms:Boolean;
         var hpVictory1:Boolean;
         var _g1:Monster;
         var hpVictory:Boolean;
         var _g:Monster;
         set_monsterArray([]);
         get_monsterArray().push(param1);
         _g = param1;
         hpVictory = true;
         hpvictoryFunc = function():void
         {
            _g.defeated_(hpVictory);
         };
         _g1 = param1;
         hpVictory1 = true;
         pcCameWorms = get_player().hasStatusEffect(StatusEffects.Infested);
         hplossFunc = function():void
         {
            _g1.won_(hpVictory1,pcCameWorms);
         };
         _g2 = param1;
         hpVictory2 = false;
         lustvictoryFunc = function():void
         {
            _g2.defeated_(hpVictory2);
         };
         _g3 = param1;
         hpVictory3 = false;
         pcCameWorms1 = get_player().hasStatusEffect(StatusEffects.Infested);
         lustlossFunc = function():void
         {
            _g3.won_(hpVictory3,pcCameWorms1);
         };
         set_monster(param1);
         setUpCombatEnvironment(param2,param3);
      }
      
      public function beforePlayerTurn() : Boolean
      {
         var _loc4_:* = null as Monster;
         var _loc1_:Boolean = true;
         var _loc2_:int = 0;
         var _loc3_:Array = get_monsterArray();
         while(_loc2_ < int(_loc3_.length))
         {
            _loc4_ = _loc3_[_loc2_];
            _loc2_++;
            statScreenRefresh();
            if(!_loc4_.reactWrapper(ReactionContext.TurnStart))
            {
               startMonsterTurn();
               _loc1_ = false;
            }
         }
         return _loc1_;
      }
      
      public function awardPlayer(param1:Object = undefined, param2:Boolean = true) : void
      {
         var _loc5_:int = 0;
         var _loc7_:* = null as Player;
         set_monster(get_monsterArray()[0]);
         if(param1 == null)
         {
            param1 = get_camp().returnToCampUseOneHour;
         }
         var _loc3_:Number = 0;
         var _loc4_:int = 0;
         while(_loc4_ < int(get_monsterArray().length))
         {
            _loc3_ += get_monsterArray()[_loc4_].get_gems();
            if(get_player().hasPerk(PerkLib.HistoryWhore))
            {
               _loc5_ = int(_loc3_ * 0.04 * get_player().masteryLevel(MasteryLib.Tease));
               if(get_monsterArray()[_loc4_].get_lust() >= get_monsterArray()[_loc4_].maxLust())
               {
                  _loc3_ += _loc5_;
               }
            }
            _loc4_++;
         }
         if(get_player().countCockSocks("gilded") > 0)
         {
            _loc5_ = int(_loc3_ * 0.15 + 5 * get_player().countCockSocks("gilded"));
            _loc3_ += _loc5_;
         }
         if(get_player().hasPerk(PerkLib.HistoryFortune))
         {
            _loc5_ = int(_loc3_ * 0.15);
            _loc3_ += _loc5_;
         }
         if(get_player().hasPerk(PerkLib.AscensionFortune))
         {
            _loc3_ *= 1 + get_player().perkv1(PerkLib.AscensionFortune) * 0.1;
         }
         if(get_player().batScore() >= 5)
         {
            _loc3_ *= 1.1;
         }
         _loc3_ = Math.round(_loc3_);
         var _loc6_:Number = 0;
         _loc4_ = 0;
         while(_loc4_ < int(get_monsterArray().length))
         {
            _loc6_ += get_monsterArray()[_loc4_].XP;
            _loc4_++;
         }
         _loc6_ += get_player().getBonusStatMultiplicative("经验获取");
         _loc6_ = Math.round(_loc6_);
         get_monster().set_gems(int(_loc3_));
         get_monster().XP = _loc6_;
         get_monster().handleAwardText();
         if(!get_inDungeon() && !get_inRoomedDungeon())
         {
            if(param1 != null)
            {
               doNext(param1);
            }
            else
            {
               doNext(playerMenu);
            }
         }
         else if(param1 != null)
         {
            doNext(param1);
         }
         else
         {
            doNext(playerMenu);
         }
         dropItem(get_monster(),param1);
         set_inCombat(false);
         if(param2)
         {
            _loc7_ = get_player();
            _loc7_.set_gems(_loc7_.get_gems() + int(_loc3_));
            var _temp_1:* = get_player();
            _temp_1.XP = _temp_1.XP + _loc6_;
            get_mainView().statsView.showStatUp("xp");
            dynStats(DynStat.Lust(0),DynStat.NoScale);
         }
      }
      
      public function attack() : void
      {
         var _loc4_:int = 0;
         var _loc5_:Boolean = false;
         var _loc1_:int = getNumAttacks();
         fatigueRecovery();
         if(get_player().get_weapon().masteryLevel() >= 5)
         {
            get_player().changeFatigue(-1 - Utils.rand(2));
         }
         if(get_player().hasStatusEffect(StatusEffects.Sealed) && get_player().statusEffectv2(StatusEffects.Sealed) == 0 && !isWieldingRangedWeapon())
         {
            outputText("你试图攻击，但在最后一刻你的身体猛地扭开，让你连碰都碰不到她！狐妖的封印让你无法进行普通攻击！也许你可以尝试点别的？[pg]");
            startMonsterTurn();
            return;
         }
         if(get_game().ceraphScene.hasPacifism() && (Utils.rand(3) > 0 || get_monster() is Ceraph) && !get_game().urtaQuest.isUrta() && !isWieldingRangedWeapon())
         {
            outputText("你试图攻击，但在最后一刻你的身体猛地扭开，让你连碰都碰不到她！塞拉芙的穿孔让你无法进行普通攻击！也许你可以尝试点别的？[pg]");
            startMonsterTurn();
            return;
         }
         if(get_player().statusEffectv2(StatusEffects.CounterAB) == 3)
         {
            outputText("你摆出了无头骑士教你的架势。你的攻击效果会降低，但你有机会反击敌人的攻击！\n");
         }
         if(get_player().hasStatusEffect(StatusEffects.Blind) && get_player().statusEffectv1(StatusEffects.CounterAB) != 1)
         {
            outputText("你试图攻击，但以你现在被致盲的状态，你怀疑自己不会有太好的运气！");
         }
         var _loc2_:int = 0;
         var _loc3_:int = _loc1_;
         while(_loc2_ < _loc3_)
         {
            _loc4_ = _loc2_++;
            _loc5_ = performRegularAttack(_loc4_);
            outputText("[pg-]");
            if(!_loc5_)
            {
               break;
            }
         }
         checkAchievementDamage(damage);
         startMonsterTurn();
      }
      
      public function afterPlayerTurn() : void
      {
         var _loc1_:Array = get_player().statusEffects.slice(0);
         var _loc2_:int = int(_loc1_.length);
         var _loc3_:int = 0;
         while(_loc3_ < _loc2_)
         {
            _loc1_[_loc3_].onPlayerTurnEnd();
            _loc3_++;
         }
      }
   }
}

