package classes.scenes.areas.desert
{
   import classes.CoC;
   import classes.Monster;
   import classes.PerkLib;
   import classes.Player;
   import classes.ReactionContext;
   import classes.StatusEffects;
   import classes.internals.MonsterAI;
   import classes.internals.Utils;
   import classes.internals.WeightedChoice;
   import classes.items.Weapon;
   import classes.scenes.combat.CombatAbility;
   import classes.scenes.combat.CombatAttackBuilder;
   import classes.scenes.combat.CombatDistance;
   import classes.scenes.combat.CombatRange;
   import flash.Boot;
   
   public class Scorpion extends Monster
   {
      
      public var turnsWaited:int;
      
      public function Scorpion()
      {
         if(Boot.skip_constructor)
         {
            return;
         }
         turnsWaited = 0;
         super();
         turnsWaited = 0;
         set_a("");
         set_short("onyx scorpion");
         pronoun1 = "它";
         pronoun2 = "它";
         pronoun3 = "它";
         imageName = "scorpion";
         set_long("你正在与一只巨大的蝎子战斗，它披着乌黑的几丁质甲壳，像一座黑暗的山峰一样耸立在你面前。它铲状的爪子大概是用来粉碎和挖掘岩石与沙子的，但毫无疑问，它们也足以粉碎你——以及玛瑞斯的大多数其他生物。八条末端尖锐的粗壮腿部赋予了这只生物极佳的平衡性和机动性，而一条长长的、分节的尾巴高高地弯曲在它厚重、装甲般的身体上方，构成了另一个致命的威胁，毒刺已经准备就绪，随时准备将毒液注入任何不幸或迟钝的猎物体内。[pg]这个沙坑底部的竞技场相当宽敞，但对手庞大的体型和速度让你感到幽闭恐惧。更糟糕的是，你脚下变移的沙子只能提供不可靠的支撑，减缓了你的移动速度。");
         createBreastRow(0);
         ass.analLooseness = 1;
         ass.analWetness = 1;
         set_tallness(228);
         hips.rating = 2;
         butt.rating = 4;
         set_initedGenitals(true);
         initStrTouSpeInte(95,120,100,35);
         initLibSensCor(0,0,35);
         set_weaponName("giant chelae");
         set_weaponVerb("strikes");
         set_fatigue(0);
         set_weaponAttack(35);
         set_armorName("onyx cephalothorax");
         set_armorDef(35);
         bonusHP = 5260;
         set_lust(0);
         lustVuln = 0;
         temperment = 1;
         level = 30;
         set_drop(new WeightedChoice());
         createPerk(PerkLib.BiteImmune);
         checkMonster();
      }
      
      override public function won(param1:Boolean, param2:Boolean = false) : void
      {
         get_game().desert.scorpion.badEnd(param1);
      }
      
      public function trample() : void
      {
         outputText("这只巨大的蛛形纲动物将双钳在身前交叠，宛如一面坚不可摧的盾牌，带着排山倒海之势向你冲来。你既没有时间也没有空间躲避，");
         var _loc1_:CombatAttackBuilder = new CombatAttackBuilder().canDodge();
         _loc1_.setCustomAvoid("但你还是设法躲到了它的双钳下，紧紧地趴在地上。");
         if(_loc1_.executeAttack().isSuccessfulHit())
         {
            outputText("它的双钳正中你，将你重重地砸在地上。");
            get_player().takeDamage(get_player().reduceDamage((get_str() + get_weaponAttack()) / 2 + Utils.rand(5),this),true);
         }
         _loc1_.setCustomAvoid("[pg-]你翻滚着躲开了它第一条腿的踩踏。");
         if(_loc1_.executeAttack().isSuccessfulHit())
         {
            outputText("[pg-]它的第一条腿直接踩在了你身上，将你肺里的空气挤压殆尽。");
            get_player().takeDamage(get_player().reduceDamage(get_str() + get_weaponAttack() + Utils.rand(25),this),true);
         }
         _loc1_.setCustomAvoid("[pg-]在你的手臂被另一条腿弄残之前，你猛地将其抽离了危险区域。");
         if(_loc1_.executeAttack().isSuccessfulHit())
         {
            outputText("[pg-]它的第二条腿死死压住你的肩膀，巨大的重量刺入你的身体，让你痛苦不堪。");
            get_player().takeDamage(get_player().reduceDamage(get_str() + get_weaponAttack() + Utils.rand(25),this),true);
         }
         _loc1_.setCustomAvoid("[pg-]你纯靠运气躲过了第三条腿，免于骨盆被压碎的下场。");
         if(_loc1_.executeAttack().isSuccessfulHit())
         {
            outputText("[pg-]当它的第三条腿刺入你的骨盆并险些将其压碎时，你发出了一声痛苦的惨叫。");
            get_player().takeDamage(get_player().reduceDamage(get_str() + get_weaponAttack() + Utils.rand(25),this),true);
         }
         _loc1_.setCustomAvoid("[pg-]你预判了第四条腿的落点，待在原地安然无恙。");
         if(_loc1_.executeAttack().isSuccessfulHit())
         {
            outputText("[pg-]当你试图逃跑时，第四条腿刺穿了你的肠子，以一种不该有的方式挤压着你的器官。");
            get_player().takeDamage(get_player().reduceDamage(get_str() + get_weaponAttack() + Utils.rand(25),this),true);
         }
         _loc1_.setCustomAvoid("[pg-]你成功地用盾牌挡住了它那拖在身后的巨大尾巴，并多等了一会儿，直到它完全从你身上过去，你才再次站起来，拍了拍身上的沙子，面对这只野兽。");
         if(_loc1_.executeAttack().isSuccessfulHit())
         {
            outputText("[pg-]它那拖在身后的巨大尾巴在你上方扫过时，重重地击中了你的头部，把你重新压回沙子里。在经历了这令人屈辱的几秒钟后，你才得以重新站起来，面对这只野兽。");
            get_player().takeDamage(get_player().reduceDamage((get_str() + get_weaponAttack()) / 2 + Utils.rand(5),this),true);
         }
         outputText("[pg-]它半挂在远处的方尖碑上，一边观察你，一边咔哒咔哒地敲击着它的钳子。");
         get_game().combatRangeData.moveDistantSafe(this);
      }
      
      public function sting() : void
      {
         outputText("伴随着一次猛扑，这只如山般的蛛形巨兽压在了你的身上，它用一次迅速的攻击打破了你的平衡，将你死死按在地上，它的尾巴在你上方高高举起。你只有几分之一秒的时间挣脱并滚开，否则那刺下的毒针就会");
         var _loc1_:CombatAttackBuilder = new CombatAttackBuilder().canBlock().canDodge();
         _loc1_.setCustomBlock("撞击在你千钧一发之际举起的[shield]上。又一次带毒的攻击狠狠砸在你的防御上，但你坚持住了，并安全地退出了尾巴的有效穿刺范围。");
         _loc1_.setCustomAvoid("刺入了地面。你在千钧一发之际逃脱了，但第二击紧随其后，不给你哪怕一次心跳的喘息时间，直到你逃出这头野兽的有效穿刺范围。");
         if(_loc1_.executeAttack().isSuccessfulHit())
         {
            outputText("抓住了你，在你试图尽可能拉开距离时撕裂了你的血肉。每一次动作都伴随着剧痛，一种下沉、虚弱的感觉伴随着温热的鲜血流下你的身体，你的心智和视野迅速陷入一片混乱。[b:你肯定中毒了！]");
            get_player().takeDamage(get_player().reduceDamage((get_str() + get_weaponAttack()) / 2 + Utils.rand(5),this),true);
            get_player().createStatusEffect(StatusEffects.ScorpVenom);
         }
      }
      
      public function specialChance() : int
      {
         return int(Math.round((100 - get_hp100()) / 15));
      }
      
      public function slam() : void
      {
         outputText("这头野兽爬上墙壁，它巨大的身体在钳子固定时微微转动，这是你得到的唯一警告，随后它整个尾巴像黑曜石般呼啸着以弧线抽打下来。");
         var _loc1_:CombatAttackBuilder = new CombatAttackBuilder().canBlock().canDodge();
         _loc1_.setCustomBlock("重击打在你的[shield]上，其巨大的动量迫使你不得不离开那里，否则就会被不知道多少吨重的甲壳压残。谢天谢地，在蝎子像蛇一样收回它的附肢时，你获得了片刻时间来处理你刺痛的眼睛和肌肉。然后它在远处绕着你转圈，注视着你。");
         _loc1_.setCustomAvoid("重击撕裂了地面，沙子像火山一样喷涌而出，但你毫发无损。谢天谢地，它没打中，蝎子很快意识到了这一点，像蛇一样收回了附肢，同时发出缓慢、清脆的咔哒声。然后它在远处绕着你转圈，眼睛紧盯着你。");
         if(_loc1_.executeAttack().isSuccessfulHit())
         {
            outputText("它狠狠地砸向你，巨大的力量将你死死压在地上，甚至连你身下的地面都被撕裂了，让你身受重伤。谢天谢地，不知是什么原因驱使这只蝎子像蛇一样缩回了它的附肢，给了你重新振作的时间。它只是在远处绕着你转圈，注视着你。");
            get_player().takeDamage(get_player().reduceDamage(get_str() + get_weaponAttack() * 2 + Utils.rand(25),this),true);
         }
         get_game().combatRangeData.moveDistantSafe(this);
      }
      
      override public function shouldWait() : Boolean
      {
         return false;
      }
      
      override public function shouldMove(param1:CombatDistance, param2:Boolean = false) : Boolean
      {
         return false;
      }
      
      public function scuttle() : void
      {
         outputText("蝎子恼怒地对你发出嘎嘎声，它向后退去，顺着洞穴的高墙爬行了一段，拉开了你们之间的距离，举着双钳在竞技场边缘绕圈。");
         get_game().combatRangeData.moveDistantSafe(this);
      }
      
      public function scorpStruggle() : void
      {
         if(Utils.randomChance(get_player().get_str() / 4) || Utils.randomChance(10))
         {
            escape();
         }
         else
         {
            constrict();
         }
      }
      
      public function sand() : void
      {
         outputText("这座高耸的庞然大物将钳子猛地扎进地下，挖出一大铲沙子，然后朝你掷来。");
         var _loc1_:CombatAttackBuilder = new CombatAttackBuilder().canBlock();
         _loc1_.setCustomBlock("你用[shield]掩护自己，感觉到一大块什么东西猛烈地撞击了你，在撞击时粉碎了，但你毫发无损。");
         if(_loc1_.executeAttack().isSuccessfulHit())
         {
            outputText("翻滚的沙浪吞没了你，刺痛了你的眼睛，钻进了[if (!isnaked) {你的[armor]|它绝对不该去的地方}]，让你失去了方向感，但你确实设法躲过了最致命的攻击：一大块更像是巨石的东西轰隆隆地滚过，撞在一根砂岩柱上粉碎了。");
            get_player().createStatusEffect(StatusEffects.ScorpBlind);
            _loc1_.canDodge();
            _loc1_.setCustomAvoid("翻滚的沙浪吞没了你，但在你甚至还没来得及遮挡眼睛之前，一大块巨石般的东西就将你撞倒，直接把你击倒[if (singleleg) {在地|摔倒在地}]。它在撞击中粉碎，将你埋在碎石和令人窒息的沙子下面。你挣扎着脱身，连连咳嗽，几乎什么也看不清。");
            if(_loc1_.executeAttack().isSuccessfulHit())
            {
               get_player().takeDamage(get_player().reduceDamage(get_str() / 2 + Utils.rand(25),this),true);
            }
         }
      }
      
      override public function runCheck() : void
      {
         if(get_player().canFly())
         {
            outputText("你拍打着翅膀，试图起飞逃离这个蝎子坑，但翅膀酸痛无比，还沾满了沉重的沙子。还没等你飞到足够的高度，这只巨大的生物就猛地甩动尾巴砸向你，像拍打一只烦人的[if (silly) {moth|fly}]一样把你从半空中拍了下来。你重重地摔在地上，滑行了好几步，直到撞上一座砂岩方尖碑才停下来。");
         }
         else
         {
            outputText("你试图拉开与巨蝎的距离，急忙想要爬上坑壁，双手拼命寻找可以抓握的地方。然而，还没等你爬多远，这只巨大的生物就扑到了你身上。它用一只钳子划过沙地，把你夹起来扔向一座方尖碑。你痛苦地瘫倒在地，暗骂自己做出的决定。");
         }
         outputText("[pg]也许你不该尝试那么做的。");
         get_player().takeDamage(get_player().reduceDamage(50,this),true);
         get_game().combat.startMonsterTurn();
      }
      
      override public function react(param1:ReactionContext) : Boolean
      {
         var _loc2_:* = null as Array;
         switch(param1.index)
         {
            case 0:
               if(get_player().get_weapon().isFirearm() && Utils.randomChance(5))
               {
                  _loc2_ = ["你的子弹擦过蝎子厚实的甲壳，射入了沙地中。","你差一点就打中了它柔软的部位，子弹从这只黑色蛛形纲动物的天然装甲上弹开。它发出嘶嘶声，但并未受伤。","这只巨大的蝎子突然向下猛冲，用它的装甲对着你，你的子弹从它的背部甲壳上弹开。只留下了一道污迹。","这只蛛形纲动物以惊人的速度举起一只钳子挡在脸前，刚好挡住了你的子弹。一阵烦躁的咔哒声表明它绝对感觉到了冲击。","这只巨大的野兽试图向侧面躲闪，但你的子弹仍然击中了一块圆形的黑曜石甲板，呼啸着飞向未知的地方。蝎子似乎很焦躁，但并未受伤。"];
                  outputText("[pg-]" + _loc2_[Utils.rand(int(_loc2_.length))]);
                  return false;
               }
               if(!get_player().get_weapon().isChanneling() && Utils.randomChance(10))
               {
                  _loc2_ = ["你的攻击击中了几乎坚不可摧的缟玛瑙装甲，从厚重的甲板上滑开，没有造成任何伤害。","你的攻击稍微偏了一点，击中了这头巨兽的甲壳，只在厚重的几丁质上留下了一道划痕。","当你向前猛扑时，这只巨兽用前腿扬起了一阵沙尘，让你的瞄准出现了偏差，导致你错失目标，从它厚重的几丁质装甲上滑开。","这只巨大的怪物向后退去，匆忙举起双爪格挡。它那可怕的巨钳实在太厚，无法被破坏，你的攻击被它的防御弹开了。","这头野兽突然猛击你面前的地面，用一只巨大的钳子挡在你的路上，打断了你的攻击，破坏了你的平衡和气势。"];
                  outputText("[pg-]" + _loc2_[Utils.rand(int(_loc2_.length))]);
                  return false;
               }
               return true;
               break;
            case 10:
               if(Utils.randomChance(90))
               {
                  _loc2_ = ["箭矢击中野兽的甲壳，发出一声可怜的木头撞击声后被弹开了。","你的射击击中了蛛形怪物巨大的黑曜石甲壳，直接从它的天然装甲上弹开了。","你击中了一块装甲板，你的射击被弹开，没有造成哪怕最轻微的伤害。","巨蝎举起巨大的钳子，迅速挡住了你的箭，让你的射击无功而返。","巨蝎以一种令人胆寒、近乎未卜先知般的反射神经猛地闪向一旁。你的箭深深扎进了它身后的沙子里。"];
                  outputText("[pg-]" + _loc2_[Utils.rand(int(_loc2_.length))]);
                  return false;
               }
               return true;
               break;
            default:
               return true;
         }
      }
      
      override public function performCombatAction() : void
      {
         if(get_game().combat.currAbilityUsed != null)
         {
            if(get_game().combat.currAbilityUsed.get_abilityType() == 7)
            {
               turnsWaited += 1;
            }
            else
            {
               turnsWaited = 0;
            }
         }
         if(turnsWaited >= (get_player().hasTailInsteadOfLegs() ? 5 : 8) - (get_game().desert.scorpion.saveContent.talked ? 2 : 0))
         {
            get_game().combat.overrideEndOfRoundFunction = get_game().desert.scorpion.special;
            return;
         }
         if(get_player().hasStatusEffect(StatusEffects.ScorpGrabbed))
         {
            grapple();
            return;
         }
         var _loc1_:MonsterAI = new MonsterAI();
         _loc1_.add(attack,5,true,0,FATIGUE_NONE,CombatRange.ChargingMelee);
         _loc1_.add(grab,1,get_game().combat.currAbilityUsed != get_game().combat.combatAbilities.waitAb,10,FATIGUE_PHYSICAL,CombatRange.Melee);
         _loc1_.add(sting,specialChance(),!get_player().hasStatusEffect(StatusEffects.ScorpVenom),15,FATIGUE_PHYSICAL,CombatRange.Melee);
         _loc1_.add(slam,specialChance(),true,10,FATIGUE_PHYSICAL,CombatRange.Melee);
         _loc1_.add(sand,specialChance(),true,10,FATIGUE_PHYSICAL,CombatRange.Ranged);
         _loc1_.add(trample,specialChance(),true,20,FATIGUE_PHYSICAL,CombatRange.ChargingMelee);
         _loc1_.add(hammer,specialChance(),!get_player().hasStatusEffect(StatusEffects.Stunned),15,FATIGUE_PHYSICAL,CombatRange.Melee);
         _loc1_.add(scuttle,2,get_hp100() < 33,0,FATIGUE_NONE,CombatRange.Self);
         _loc1_.add(idle,get_game().combat.currAbilityUsed == get_game().combat.combatAbilities.waitAb ? 15 : 1,true,0,FATIGUE_NONE,CombatRange.Self);
         _loc1_.exec();
      }
      
      override public function outputDefaultTeaseReaction(param1:Number) : void
      {
         var _loc2_:Array = ["这只巨大的蝎子似乎完全不受你表演的影响。","这只高耸的蛛形纲动物对你的性挑逗毫无兴趣。","看来你对这只强大的黑玛瑙巨兽没有任何影响。","你的挑逗似乎无效，蝎子对此没有任何反应。","这只蛛形纲动物用它那黑色的小眼睛注视着你，但没有任何迹象表明你对它产生了丝毫影响。","你没有观察到你的挑逗产生了任何可见的效果。","看样子，这只蝎子甚至都不明白你想干什么。"];
         outputText(_loc2_[Utils.rand(int(_loc2_.length))]);
      }
      
      override public function outputDefaultFantasy(param1:Number) : void
      {
         var _loc2_:Array = ["你想象着这只巨大的漆黑野兽为你仰面躺下，张开它那分节的腿，发出充满情欲的邀请。","你试图想象出所有能用那条又长又粗的尾巴来满足你欲望的方法。选择实在太多了。","看着那对巨大的漆黑双螯，你真的欲火焚身，你的双手和下体都渴望着能好好感受它们。","你在某处听说过蝎子在交配时会互相“跳舞”。一想到你将成为这只巨大的黑曜石野兽的舞伴，你就感到一阵温柔的暖意，并渴望得到更多。","你试着想象和蝎子共度新婚之夜会是什么样子。你想出的那些变态的可能性和姿势，甚至会让魅魔都脸红" + (get_player().isFeminine() && get_player().demonScore() >= 4 ? "，而这正是现在发生的事情" : "") + ".","那厚实的墨黑色甲壳对你那肮脏的思想来说实在太诱人了——你忍不住想象自己赤身裸体地在上面蹭来蹭去，活脱脱一个恋蛛癖荡妇。"];
         outputText(_loc2_[Utils.rand(int(_loc2_.length))]);
      }
      
      public function idle() : void
      {
         var _loc1_:Array = ["这只生物决定只是注视着你，它那小小的眼睛紧盯着你，同时在两边来回爬动。","这只巨大的野兽慢慢地侧向绕圈，它的钳子和尾部一直指着你，但并没有发动攻击。","这只黑曜石巨兽在原地挪动着，咔哒咔哒地敲击着它的爪子以示警告，但仅此而已。","巨大的钳子张得大大的，你[if (hasshield) {举起了盾牌|准备躲闪}]，但它们只是保持着那个姿势，显然是在对你发出威胁。","这只巨兽的许多只脚在地上摩擦，当蝎子绕着柱子爬行时，扬起了一小团沙尘。","巨型蜘蛛突然一阵猛烈的移动，让你瞬间警觉起来。它在坑壁上快速爬行，几乎绕着你转了一整圈，然后再次停下，继续盯着你。","黑暗巨像一动不动地坐着，似乎满足于不发动攻击，只是单纯地盯着你。","巨大的黑曜石泰坦在刚好超出你攻击范围的地方挥舞着爪子，在地上划过，不知为何聚起了一堆沙子。","蝎子用巨大的钳子有节奏地敲击着地面，露出大颚向你咔哒作响，但并没有进一步的动作。"];
         outputText(_loc1_[Utils.rand(int(_loc1_.length))]);
         changeFatigue(-25);
      }
      
      override public function handleDamaged(param1:Number, param2:Boolean = true) : Number
      {
         if(get_game().combat.damageType == "MagicalR" || get_game().combat.damageType == "MagicalM")
         {
            param1 *= 0.5;
         }
         if(get_player().get_weapon().isFirearm() && get_game().combat.currAbilityUsed == get_game().combat.combatAbilities.attackAb)
         {
            param1 *= 1.5;
         }
         return Number(super.handleDamaged(param1,param2));
      }
      
      public function hammer() : void
      {
         outputText("一阵低沉的嘎嘎声紧接着是快速的两次钳击地面，这打乱了你的[if (singleleg) {平衡|脚步}]，并卷起一阵沙尘。有一瞬间，你什么也看不见。");
         var _loc1_:CombatAttackBuilder = new CombatAttackBuilder().canBlock().canDodge();
         _loc1_.setCustomBlock("你闷哼一声，透过沙尘，一只巨爪猛地砸向你高举的[shield]，那如泰山压顶般、震动大地的冲击力让你双腿发软。但你依然稳稳地站住了。");
         _loc1_.setCustomAvoid("你本能地闪向一旁，幸好如此。透过沙尘，一只巨爪如泰坦的巨锤般猛砸下来，将你刚才站立的地方砸得粉碎。");
         if(_loc1_.executeAttack().isSuccessfulHit())
         {
            outputText("当你终于看清时，已经太迟了；那只黑玛瑙般的巨爪如泰坦的巨锤般砸在你身上。其威力也确实如此。你被打得头晕目眩，浑身无力，只能祈祷自己没断什么重要的骨头，你挣扎着想要站起来，更别提[if (!hasweapon) {举起|去抓}]你的[weapon]了。");
            get_player().takeDamage(get_player().reduceDamage(get_str() + get_weaponAttack() * 1.5 + Utils.rand(25),this,15),true);
            get_player().stun(1,100,100,false);
         }
      }
      
      public function grapple() : void
      {
         var _loc1_:Array = ["那螯钳死死地收紧，将你牢牢钳在原地动弹不得，而蝎子则朝你发出咔嗒咔嗒的响声。","感觉就像被一个巨大的台钳碾压一样，漆黑的巨钳以无情的力道深深嵌入你的血肉之中。","这只巨大的蝎子将你死死压住，让你在剧痛中惨叫出声。它要把你碾碎了！","这头巨兽抓着你猛烈摇晃，在压迫的剧痛中又添了一阵令人作呕的眩晕感。","这头黑曜石般的巨兽突然将你狠狠砸向地面，拖着你在沙地上摩擦，无数沙粒刮擦着你的身体，让你无助地惨叫、连连呛咳。","蝎子突然决定带着你在坑壁上转一圈，像甩玩具一样把你扫来扫去。你感到五脏六腑都在翻江倒海地抗议。","你被高高举起，远离这只凶猛的野兽，它紧紧地挤压着你，用那双黑色、不眨眼的眼睛注视着你。"];
         outputText(_loc1_[Utils.rand(int(_loc1_.length))]);
         get_player().takeDamage(get_player().reduceDamage(get_str() + get_weaponAttack(),this),true);
      }
      
      public function grab() : void
      {
         outputText("巨蝎发出一阵令人不安的咔哒声，它飞快地爬行了几步，然后用张开的巨钳以闪电般的速度向你挥来，");
         var _loc1_:CombatAttackBuilder = new CombatAttackBuilder().canDodge();
         _loc1_.setCustomAvoid("但你早已向侧面跃开，身后扬起了一大片沙尘。巨大的野兽扑了个空，只能将钳子收回，愤怒地冲你咔哒作响。");
         if(_loc1_.executeAttack().isSuccessfulHit())
         {
            outputText("巨钳猛地合拢，将你的身体高高举起。你没能逃脱，世界仿佛颠倒了——这头巨大的野兽将你左右摇晃，它那甲壳状的钳子就像一个巨大且不断收紧的台钳一样死死夹住你。你必须尽快挣脱！");
            get_player().takeDamage(get_player().reduceDamage((get_str() + get_weaponAttack()) / 2 + Utils.rand(5),this),true);
            get_player().createStatusEffect(StatusEffects.ScorpGrabbed);
         }
      }
      
      public function escape() : void
      {
         clearOutput();
         outputText("当你用尽全力与这巨大的钳子搏斗时，突然感觉有什么东西松动了。你抓住机会，拼尽全力推挤扭动，最终获得了足够的杠杆力，猛地一挣，将自己解救出来。然而，你还没来得及享受沙子重新回到你[if (singleleg) {[legs]|[feet]}]下的感觉，一声尖锐的咔哒声宣告了另一次抓取，你以毫厘之差躲过，然后从这头被激怒的野兽身边爬开。你再次转身，准备好你的[weapon]。");
         get_player().removeStatusEffect(StatusEffects.ScorpGrabbed);
         tookAction = true;
      }
      
      override public function defeated(param1:Boolean) : void
      {
         get_game().desert.scorpion.defeated();
      }
      
      public function constrict() : void
      {
         clearOutput();
         var _loc1_:Array = ["你在蝎子的抓握中扭动挣扎，但你所做的一切只是让钳子的边缘更深地刺入你的肉里。","你剧烈地挣扎，试图逃脱，但你无法撼动这只巨大的爪子。","你试图掰开蝎子那老虎钳般的巨爪挣脱出来，但在它压倒性的力量面前，你的尝试似乎毫无作用。","当你拼命挣扎反抗时，这只巨兽的力量似乎令人绝望地难以逾越，你根本无法挣脱。","你对着困住你的巨爪拳打脚踢，但它依然将你死死钳住。"];
         outputText(_loc1_[Utils.rand(int(_loc1_.length))]);
      }
      
      public function attack() : void
      {
         var _loc1_:int = Utils.rand(5);
         outputText(["蝎子向前猛扑，","蝎子挥舞着钳子，以一个快速、宽广的弧线向你发起攻击，","","蝎子将钳子猛砸进沙子里，向你冲来，","蝎子向侧面快速移动，并向你刺来，"][_loc1_]);
         var _loc2_:CombatAttackBuilder = new CombatAttackBuilder().canBlock().canDodge();
         _loc2_.setCustomBlock(["但你及时举起[shield]，挡住了一只原本会让你受重伤的巨螯。","你紧握[shield]承受了巨大的冲击力，虽然被击退在沙地上滑行，但你依然屹立不倒。","蝎子猛扑过来，你迅速将[shield]举过头顶，弹开了一次让周围沙地都为之震颤的攻击。","当它向你猛撞过来时，你架起[shield]准备迎接风暴，但没有什么能击破你钢铁般的防御。","但你用[shield]接下了这次攻击并将其弹开，让你毫发无损。"][_loc1_]);
         _loc2_.setCustomAvoid(["你险之又险地避开了一记直指你胸口的刺击，那巨大的钳子在被再次拔出之前，在坚硬的沙地上犁出了一道深沟。","但你的距离刚好够你猛地向后一跃来躲开它。你同样避开了它紧随其后的猛扑，并闪身躲开了它那咔哒作响的钳子。","蝎子猛扑过来，向你挥出钳子，但你的反应让你免受了被砸到地上的痛苦，这一击只震动了大地。","但你反应迅速，向旁边冲刺，躲开了这只披甲野兽试图将你掩埋的攻击。","但你敏捷地向侧面[if (singleleg) {滑开|迈步}]，攻击的余波带来一阵狂风。"][_loc1_]);
         if(_loc2_.executeAttack().isSuccessfulHit())
         {
            outputText(["用它那巨大的螯钳从正面猛戳中了你，瞬间让你喘不过气来。","像抓苍蝇一样将你擒住。你被猛地铲起，又狠狠甩飞出去，在粗糙的沙地上痛苦地滑行。","蝎子骤然冲来，一击突刺打得你猝不及防，你痛呼出声，那头巨型蛛形怪物用它黑玛瑙般的巨爪将你狠狠砸倒在地。","将你扫起抛向空中，紧接着一记迅猛的拍击又将你重重砸回地面。","被击中的瞬间，感觉就像一整堵砖墙轰然撞在你身上。"][_loc1_]);
            get_player().takeDamage(get_player().reduceDamage(get_str() + get_weaponAttack() + Utils.rand(10),this),true);
         }
      }
   }
}

