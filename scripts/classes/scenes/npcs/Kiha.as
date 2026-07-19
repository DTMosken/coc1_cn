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
   import classes._FlagDict.FlagDict_Impl_;
   import classes.globalFlags.KFLAGS;
   import classes.internals.ChainedDrop;
   import classes.internals.MonsterAI;
   import classes.internals.Utils;
   import classes.items.UseableLib;
   import classes.scenes.combat.AvoidDamageParameters;
   import classes.scenes.combat.CombatRange;
   import flash.Boot;
   
   public class Kiha extends Monster
   {
      
      public function Kiha()
      {
         if(Boot.skip_constructor)
         {
            return;
         }
         super();
         set_a("");
         set_short("Kiha");
         imageName = "kiha";
         set_long("奇哈站在你对面，手里拿着一把几乎和她一样大的双刃斧。她身高六英尺，展开的皮革状翅膀跨度将近十二英尺。她的眼睛是纯红色的，除了中间有一条黑色的缝隙，一对粗壮的龙角从她的额头上长出来，在她的红宝石色的头发上划出一道弧线，指向她的身后。暗红色的鳞片覆盖了她的手臂、腿、背部和看起来很强壮的尾巴，为她身体的大部分区域提供了保护。少数暴露在外的皮肤是深色的，几乎是巧克力色，只有在她的胸部下方和颧骨上散落着几片鳞片。");
         if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,2191) > 0)
         {
            set_long(get_long() + ("无论她是否处于兴奋状态，她丝绸般的" + (FlagDict_Impl_.arrayReadInt(KFLAGS.flags,2191) == 1 ? "内裤" : "缠腰布") + "上都会形成一块湿斑。尽管她几乎全裸，但奇哈站立的姿势却展现出训练有素的战士的自信和沉着。"));
         }
         else
         {
            set_long(get_long() + "无论她是否处于兴奋状态，她的阴道总是闪烁着湿润的光泽。尽管她全裸，但奇哈站立的姿势却展现出训练有素的战士的自信和沉着。");
         }
         set_race("Dragon-Morph");
         createVagina(false,4,1);
         createStatusEffect(StatusEffects.BonusVCapacity,40,0,0,0);
         createBreastRow(Appearance.breastCupInverse("D"));
         ass.analLooseness = 3;
         ass.analWetness = 0;
         createStatusEffect(StatusEffects.BonusACapacity,40,0,0,0);
         set_tallness(73);
         hips.rating = 6;
         butt.rating = 5;
         lowerBody.type = 1;
         skin.tone = "dark";
         skin.type = 5;
         skin.desc = "skin and scales";
         hair.color = "red";
         hair.length = 3;
         initStrTouSpeInte(65,60,85,60);
         initLibSensCor(50,45,66);
         set_weaponName("double-bladed axe");
         set_weaponVerb("fiery cleave");
         set_weaponAttack(25);
         set_armorName("thick scales");
         set_armorDef(30);
         if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,2191) > 0)
         {
            set_armorDef(get_armorDef() + 2);
         }
         bonusHP = 430;
         additionalXP = 250;
         set_lust(10);
         lustVuln = 0.4;
         temperment = 1;
         level = 16;
         set_gems(Utils.rand(15) + 95);
         set_drop(new ChainedDrop().add(get_useables().D_SCALE,0.2));
         wings.type = 11;
         tail.type = 9;
         createPerk(PerkLib.BlindImmune,0,0,0,0);
         createPerk(PerkLib.Evade,0,0,0,0);
         checkMonster();
      }
      
      override public function won(param1:Boolean, param2:Boolean = false) : void
      {
         if(hasStatusEffect(StatusEffects.spiderfight))
         {
            get_game().kihaFollowerScene.loseKihaPreSpiderFight();
         }
         else if(hasStatusEffect(StatusEffects.Spar))
         {
            get_game().kihaFollowerScene.sparWithFriendlyKihaLose();
         }
         else if(param2)
         {
            outputText("[pg]奇哈似乎对你的感染感到明显的不安，以至于她转身离开了。");
            doNext(get_game().combat.endLustLoss);
         }
         else
         {
            get_game().kihaScene.kihaLossIntro();
         }
      }
      
      public function sillyModeKihaAttack() : void
      {
         var _loc1_:int = 0;
         outputText("还没等你停下来思考，龙女就后退了一步——把斧头抛向空中，然后开始向你冲刺。几秒钟内，她轻盈的身躯就逼近到离你只有一发之隔的地方，她的拳头向后收缩，时间似乎停止了，让你注意到她手臂上渗出的强大能量。");
         if(Boolean(combatAvoidDamage(new AvoidDamageParameters(true,false,false,null,null,null,null,null)).attackFailed))
         {
            outputText("你趁机走开，看着这慢动作的攻击在你面前展开；火焰从她的指关节喷涌而出，形状像一只展翅飞翔的鸟。");
            if(Utils.rand(2) == 0)
            {
               outputText("你在老家只拥有一台XJasun，所以你不太明白这个梗。");
            }
            else
            {
               outputText("你强忍住笑意，回忆起许多个和朋友们在SharkCube游戏机前度过的夜晚，在那些荒诞、风格化的格斗游戏中互相较量。");
            }
         }
         else
         {
            _loc1_ = get_player().reduceDamage(get_str() + get_weaponAttack(),this);
            _loc1_ += 5;
            outputText("当她向前猛推紧握的拳头时，一股热流从她的指尖喷涌而出，那团炽热的火焰扭动着，燃烧着人类未知的愤怒。伴随着猛烈的一击，她爱、愤怒和悲伤的结合力量将你向后推去，把你从沼泽中发射出去，撞进了玛布尔柔软的胸膛。[say:阿拉阿拉，]她刚开口，但你已经把自己从那乳白色的地狱牢笼中推开，跑回了");
            if(!get_game().kihaFollowerScene.followerKiha())
            {
               outputText("沼泽");
            }
            else
            {
               outputText("战斗");
            }
            outputText("。");
            get_game().combat.monsterDamageType = "Fire";
            get_player().takeDamage(_loc1_,true);
            outputText("\n");
            if(get_player().get_HP() >= 1)
            {
               outputText("你顺着远处传来的[say:八、八嘎！]的尖叫声，直到你到达几秒钟前你所在的确切位置，准备再次战斗。");
            }
         }
      }
      
      override public function react(param1:ReactionContext) : Boolean
      {
         if(param1.index == 5)
         {
            outputText("[pg][say:你以为失明会让我慢下来吗？这种攻击只对那些不懂得用其他感官去“看”的人有效！]奇哈挑衅地喊道。");
         }
         return true;
      }
      
      override public function postAttack(param1:int) : void
      {
         super.postAttack(param1);
         var _loc2_:int = int(level + Utils.rand(6));
         outputText("\n她的攻击后方拖曳着一道火焰余波，将你点燃！");
         get_player().takeDamage(_loc2_,true);
      }
      
      override public function performCombatAction() : void
      {
         var _loc1_:MonsterAI = new MonsterAI();
         _loc1_.add(eAttack,1,true,0,FATIGUE_NONE,CombatRange.FlyingMelee);
         _loc1_.add(get_game().get_silly() ? sillyModeKihaAttack : kihaFirePunch,1,true,10,FATIGUE_PHYSICAL,CombatRange.FlyingMelee);
         _loc1_.add(kihaFireBreath,1,true,10,FATIGUE_MAGICAL,CombatRange.Ranged);
         _loc1_.add(kihaTimeWaster,1,true,0,FATIGUE_NONE,CombatRange.Self);
         _loc1_.exec();
      }
      
      public function kihaTimeWaster() : void
      {
         outputText("她把斧头扛在肩上，扭了扭脖子，弓起背伸了个懒腰，无意中给你上演了一场好戏。");
         get_player().takeLustDamage(5,true);
      }
      
      public function kihaFirePunch() : void
      {
         var _loc3_:int = 0;
         var _loc1_:Array = ["[SPEED]你设法跳到一边，强烈的热气从你身边掠过，你险些被她击中。你转过身，发现她已经拿回了斧头，而且比以前更生气了。","[EVADE]奇哈试图抓住你，但她没算到你的闪避技巧。你设法在最后一秒躲开了她。\n","[MISDIRECTION]得益于你的误导技巧，你设法让奇哈以为你要向一个方向躲闪，然后向另一个方向迈步。你转过身，发现她手里拿着斧头，看起来相当生气。","[FLEXIBILITY]利用你猫一般的反应，你设法跳到一边，强烈的热气从你身边掠过，你险些被她击中。你转过身，发现她已经拿回了斧头，而且比以前更生气了。","[UNHANDLED]凭借你高超的技巧，你设法迅速跳到一边，躲开了她的攻击。"];
         outputText("龙族女孩将她那把可靠的武器掷入泥泞的地面，借着你分神的瞬间，在双拳上凝聚起火球。她朝你冲来，伴随着一阵狂风骤雨般的拳击扑向你。\n");
         var _loc2_:AvoidDamageParameters = new AvoidDamageParameters(true,false,true,null,false,null,null,null);
         if(!playerAvoidDamage(_loc2_,_loc1_))
         {
            get_game().combat.monsterDamageType = "Fire";
            _loc3_ = get_player().reduceDamage(get_str(),this,30);
            outputText("你还来不及反应，就被她强大的拳劲击中，每一拳落下都让你的胸口感到一阵剧痛。伴随着最后一击，你被向后推倒在地；母龙微笑着将斧头从地上拔出，她的指尖依然冒着热气。");
            get_player().takeDamage(_loc3_,true);
            outputText("\n");
         }
      }
      
      public function kihaFireBreath() : void
      {
         var _loc2_:Number = NaN;
         outputText("奇哈双臂向后一挥，发出一声咆哮，直接朝你喷出一股旋转的火焰龙卷风！\n");
         var _loc1_:Array = ["[SPEED]得益于你的速度，你设法在千钧一发之际躲开了火焰；这让母龙很不高兴。","[EVADE]得益于你的闪避天赋，你设法在千钧一发之际躲开了火焰；这让母龙很不高兴。","[MISDIRECTION]得益于你的误导天赋，你设法在千钧一发之际躲开了火焰；这让母龙很不高兴。","[FLEXIBILITY]利用你猫一般的柔韧性，你设法在千钧一发之际躲开了火焰；这让母龙很不高兴。","[UNHANDLED]你设法在千钧一发之际躲开了火焰；这让母龙很不高兴。"];
         outputText("龙族女孩将她那把可靠的武器掷入泥泞的地面，借着你分神的瞬间，在双拳上凝聚起火球。她朝你冲来，伴随着一阵狂风骤雨般的拳击扑向你。\n");
         if(!playerAvoidDamage(new AvoidDamageParameters(true,false,true,null,false,null,null,null),_loc1_))
         {
            _loc2_ = Math.round(90 + Utils.rand(10) + get_player().newGamePlusMod() * 30);
            outputText("你试图躲避火焰，但你的速度太慢了！烈火猛烈地撞击在你身上，将你点燃！你倒在地上翻滚，尽可能快地扑灭火焰。火焰一熄灭，你便爬了起来，身上散发着烟雾和烟灰的味道。");
            get_game().combat.monsterDamageType = "Fire";
            get_player().takeDamage(_loc2_,true);
            outputText("\n");
         }
      }
      
      override public function handleFear() : Boolean
      {
         removeStatusEffect(StatusEffects.Fear);
         outputText("奇哈颤抖了片刻，然后头脑清醒地看向你。[say: 恐惧是恶魔教我们克服的第一件事。你以为这就能阻止我的刀刃吗？]\n");
         return true;
      }
      
      override public function handleBlind() : Boolean
      {
         return true;
      }
      
      override public function defeated(param1:Boolean) : void
      {
         if(hasStatusEffect(StatusEffects.spiderfight))
         {
            get_game().kihaFollowerScene.playerBeatsUpKihaPreSpiderFight();
         }
         else if(hasStatusEffect(StatusEffects.Spar))
         {
            get_game().kihaFollowerScene.winSparWithKiha();
         }
         else
         {
            get_game().kihaScene.kihaVictoryIntroduction();
         }
      }
   }
}

