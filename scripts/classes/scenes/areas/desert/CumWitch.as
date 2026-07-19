package classes.scenes.areas.desert
{
   import classes.Appearance;
   import classes.CoC;
   import classes.CockTypesEnum;
   import classes.Creature;
   import classes.ItemType;
   import classes.Monster;
   import classes.PerkLib;
   import classes.Player;
   import classes.StatusEffects;
   import classes.internals.MonsterAI;
   import classes.internals.Utils;
   import classes.internals.WeightedChoice;
   import classes.items.ConsumableLib;
   import classes.items.Shield;
   import classes.scenes.combat.AvoidDamageParameters;
   import classes.scenes.combat.CombatRange;
   import flash.Boot;
   
   public class CumWitch extends Monster
   {
      
      public function CumWitch()
      {
         if(Boot.skip_constructor)
         {
            return;
         }
         super();
         set_a("");
         set_short("Cum Witch");
         imageName = "cumwitch";
         set_long("精液女巫是一个中等身材的女人，身高将近六英尺。她乌黑的皮肤几乎像沥青一样黑，尽管上面闪烁着她最近的性活动和战斗留下的汗水。她有丰满的嘴唇和长而光滑的金发，尽管大部分都被一顶尖顶宽边帽遮住了。她的长袍比她还要黑，但她挥舞着一根雪花石膏法杖，散发着魔法的威力。当然，她的衣服并不能掩盖她巨大的乳房。虽然只有两个，但它们大到足以让大多数沙漠女巫的四个乳房相形见绌。");
         set_race("Human?");
         createCock(12,2,CockTypesEnum.HUMAN);
         balls = 0;
         ballSize = 0;
         cumMultiplier = 3;
         set_hoursSinceCum(20);
         createVagina(false,2,2);
         createStatusEffect(StatusEffects.BonusVCapacity,20,0,0,0);
         createBreastRow(Appearance.breastCupInverse("E"));
         ass.analLooseness = 1;
         ass.analWetness = 1;
         set_tallness(Utils.rand(12) + 55);
         hips.rating = 10;
         butt.rating = 8;
         skin.tone = "black";
         hair.color = "sandy-blonde";
         hair.length = 15;
         initStrTouSpeInte(35,35,35,85);
         initLibSensCor(55,40,30);
         set_weaponName("fists");
         set_weaponVerb("punches");
         set_armorName("robes");
         bonusHP = 100;
         set_lust(30);
         lustVuln = 0.8;
         temperment = 2;
         level = 6;
         set_gems(Utils.rand(15) + 5);
         set_drop(new WeightedChoice().addMany(1,get_consumables().TSCROLL,get_consumables().OVIELIX,get_consumables().LACTAID,get_consumables().LABOVA_,get_consumables().W__BOOK,get_consumables().B__BOOK,null));
         createPerk(PerkLib.SpellcastingAffinity,75,0,0,0);
         createPerk(PerkLib.SpeedyRecovery,0,0,0,0);
         checkMonster();
      }
      
      override public function won(param1:Boolean, param2:Boolean = false) : void
      {
         get_game().dungeons.desertcave.defeatedByCumWitch();
      }
      
      public function shellDefense() : void
      {
         changeFatigue(20,FATIGUE_MAGICAL);
         outputText("精液女巫双手握住法杖，在空中画着圈，嘴里不停地念着咒语。她的声音越来越高，越来越急促，直到她喊出一些毫无意义的力量之语。伴随着最后一声大喊，她将法杖重重地砸在地上，扬起一阵沙尘。沙尘很快散去，但精液女巫的周围现在多了一层闪闪发光的反光护盾！");
         createStatusEffect(StatusEffects.Shell,3,0,0,0);
      }
      
      public function sandWitchCuntHeals() : void
      {
         outputText("女巫对你得意地笑了笑，把她空着的手伸进长袍下面。当她把它拉出来时，你意识到她收集了一把自己的精液。她把它举起来，在上面呼气，空气吹过她微张的嘴唇，发出轻微的口哨声。然后，这位乌木般的黑皮肤女巫将黏液涂抹在她的伤口上，伤口似乎喝下了精液，在你的眼前消失了。她责骂道，[say: 物理伤害？太没技术含量了。]");
         addHP(maxHP() * 0.33);
         changeFatigue(10,FATIGUE_MAGICAL);
      }
      
      override public function performCombatAction() : void
      {
         var _loc1_:MonsterAI = new MonsterAI().add(cumMagicAttack,1,get_player().hasCock(),10,FATIGUE_MAGICAL,CombatRange.Ranged);
         _loc1_.add(bukkakeAttack,1,true,10,FATIGUE_PHYSICAL,CombatRange.Ranged);
         _loc1_.add(cocknosisAttack,1,true,10,FATIGUE_MAGICAL,CombatRange.Ranged);
         _loc1_.add(shellDefense,3,!hasStatusEffect(StatusEffects.Shell),10,FATIGUE_MAGICAL,CombatRange.Self);
         _loc1_.add(genderConfusionAttack,1,get_player().get_gender() == 3,10,FATIGUE_MAGICAL,CombatRange.Ranged);
         _loc1_.add(cumHungerAttack,1,get_player().hasVagina(),10,FATIGUE_MAGICAL,CombatRange.Tease);
         _loc1_.add(sandWitchCuntHeals,99,HPRatio() < 0.6,10,FATIGUE_MAGICAL_HEAL,CombatRange.Tease);
         _loc1_.exec();
      }
      
      public function genderConfusionAttack() : void
      {
         changeFatigue(10,FATIGUE_MAGICAL);
         outputText("精液女巫将她雪白的法杖触碰她的额头，就在她帽檐的下方，她做了一个简短的咒语，并用她的目光锁定你。她的眼睛闪烁着耀眼的白光，然后你感觉到她在你体内，翻阅你的记忆，挖掘你童年的记忆，你的过去，并将它们用来对付你。");
         if(get_player().get_inte() / 5 + Utils.rand(20) + get_player().level / 2 < 18)
         {
            outputText("她用关于你性别的相互冲突的记忆猛击你的意识，让你完全头晕目眩。当你几乎不知道自己是谁时，你还怎么战斗？");
            get_player().createStatusEffect(StatusEffects.Confusion,0,0,0,0);
         }
         else
         {
            outputText("你集中精神解析了这股信息洪流，并凭借你庞大的智慧将入侵者从你的脑海中驱逐出去。");
         }
      }
      
      override public function defeated(param1:Boolean) : void
      {
         get_game().dungeons.desertcave.cumWitchDefeated();
      }
      
      public function cumMagicAttack() : void
      {
         changeFatigue(10,FATIGUE_MAGICAL);
         outputText("精液女巫用她空闲的手比划着，说出无法发音的词语，然后紧紧握紧拳头。就在那一刻，你感觉到你的[balls]开始发热，一种蔓延的热量让你因不断增长的欲望而颤抖。一秒钟后，[eachCock]都在跳动，一股精液从[cockHead]流出，这是你暂时增强的男子气概的暗示。");
         get_player().takeLustDamage(5 + get_player().lib / 12,true);
         var _loc1_:Player = get_player();
         _loc1_.set_hoursSinceCum(_loc1_.get_hoursSinceCum() + 100);
      }
      
      public function cumHungerAttack() : void
      {
         changeFatigue(10,FATIGUE_MAGICAL);
         outputText("精液女巫淫荡地呻吟着，转动她的法杖，张开手，张开手指。与此同时，你感觉到她的魔法猛击你的腹部，钻进你的子宫。");
         if(get_player().get_pregnancyIncubation() > 0)
         {
            outputText("然而，无论她试图做什么都失败了，因为她那超凡脱俗的魔法一接触到你就瓦解了。");
            return;
         }
         outputText("它在你的子宫周围蠕动，轻轻地给它挠痒痒，然后轻轻地揉捏你的卵巢。当你的子宫跳动，渴望有东西填满它时，你的[legs]变软了。当魔法消退时，一股湿润的液体从你的[vagina]喷出，随着你的欲望上升，你扭动着身体。要是有什么东西能让你怀孕就好了！你的眼睛不由自主地扫向女巫的腹股沟，然后你才把它们移开。");
         get_player().takeLustDamage(5 + get_player().lib / 12,true);
      }
      
      public function cocknosisAttack() : void
      {
         changeFatigue(10,FATIGUE_MAGICAL);
         outputText("精液女巫诱人地撩起长袍，露出了她");
         if(get_lust100() < 50)
         {
            outputText("半硬的");
         }
         else if(get_lust100() < 70)
         {
            outputText("坚硬的");
         }
         else if(get_lust100() < 85)
         {
            outputText("跳动着的");
         }
         else
         {
            outputText("坚硬且滴着液体的");
         }
         outputText("肉棒。她开始轻轻地扭动臀部，以近乎机械的精准度前后摇摆，她那轻轻晃动的肉棒像节拍器一样精准地吸引着你的目光。她开始轻声说话，每一个字都配合着她动作的节奏和旋律。");
         outputText("[pg][say: 看到我的肉棒了吗？看到它闪闪发光的粗壮了吗？看着它为你摇摆晃动，动作是如此流畅优雅。你能感觉到你的眼睛在跟着它，锁定它，再也不想移开吗？][pg]");
         if(get_player().get_inte() / 20 + Utils.rand(20) >= 13)
         {
            outputText("你对她试图用她的阴茎催眠你的粗劣尝试嗤之以鼻。她恼怒地跺了跺脚，把长袍放回原处。");
         }
         else
         {
            outputText("女巫得意地笑了，虽然你太专注于她的肉棒而没有看到，她继续说道，[say: 好[boy]。看着它摇摆。你现在如此专注于我的肉棒，以至于周围的世界都在消失，沉入虚无，只留下那根美妙的肉棒供你观看。既然它占据了你的视线，你也能感觉到它占据了你的大脑，不是吗？]");
            outputText("[pg]你点点头，你的视线死死地盯着她同样坚硬的工具，你完全彻底地盯着她的阴茎，欣赏它的曲线，它的粗壮，以及当你以恰当的角度看着它时，它似乎为你快乐地跳动的方式。女巫还在说话，但重要的是她的肉棒。当你的[skin]发红，身体发热时，你开始流口水。天哪，她的肉棒太漂亮了。你伸手往下，不假思索地开始自慰。你不知道为什么，但感觉这就是该做的事。");
            get_player().takeLustDamage(20);
            if(get_player().get_lust100() <= 99)
            {
               outputText("[pg]你撞到了什么东西，在完全陷入肉棒催眠之前惊醒了自己。尽管如此，每次你闭上眼睛，你还是会看到她的肉棒，而且你的身体因为你刚才抚摸自己的方式而变得非常兴奋。");
            }
            else
            {
               outputText("[pg]你玩弄着自己，直到你处于高潮的边缘。就在那一刻，一声响亮的*啪*声将你惊醒，当你低头看着几英寸外晃动的肉棒时，你意识到这毫无希望。你无法抗拒。");
            }
            outputText("[pg]女巫会意地笑了。");
         }
      }
      
      public function bukkakeAttack() : void
      {
         var _loc4_:* = null;
         var _loc5_:Number = NaN;
         changeFatigue(10,FATIGUE_PHYSICAL);
         outputText("精液女巫呻吟着，优雅地将长袍从她肿胀的肉棒上剥开。当她的睾丸突然肿胀时，一滴先列腺液从她的尿道中湿漉漉地爆开，溅在地板上。你及时抬起头，看到了她法杖周围标志性的魔法光芒，但紧接着她就向你挺动臀部，淫荡地操着空气，同时向你喷射出一股又一股浓稠的精液！\n");
         var _loc1_:int = 2 + Utils.rand(5);
         var _loc2_:int = 0;
         var _loc3_:int = 0;
         while(_loc1_ > 0)
         {
            _loc4_ = combatAvoidDamage(new AvoidDamageParameters(true,false,false,null,null,null,null,null));
            if(_loc4_.dodge == EVASION_EVADE)
            {
               outputText("\n你从双性人的精液中滚开，轻松地避开了它。");
            }
            else if(_loc4_.dodge == EVASION_MISDIRECTION)
            {
               outputText("\n你向一个方向佯攻，然后向另一个方向移动，像个专家一样误导，避开了一些性爱炮火。");
            }
            else if(_loc4_.dodge == EVASION_FLEXIBILITY)
            {
               outputText("\n你扭身躲开，充分利用你猫一样的反应能力避开了一些东西。");
            }
            else if(_loc4_.dodge == EVASION_SPEED || _loc4_.dodge != null)
            {
               if(Utils.rand(3) == 0)
               {
                  outputText("\n一团她的粘液偏离了目标，越过了你的肩膀！");
               }
               else if(Utils.rand(2) == 0)
               {
                  outputText("\n一波白色的液体没有击中，溅在了你的[feet]上。");
               }
               else
               {
                  outputText("\n精液女巫的一些精液差点打中你，但你设法躲开了。");
               }
            }
            else if(get_player().get_shield() == get_game().shields.DRGNSHL && Utils.rand(2) == 0)
            {
               outputText("\n你准备好你的龙壳盾，让扶他的精液打在上面。在很短的时间内，精液被完全吸收了。");
            }
            else
            {
               _loc5_ = Utils.rand(5);
               if(_loc5_ == 0)
               {
                  outputText("\n一大团精液溅在你的[hair]上，用浓稠、咸咸的粘液浸透了它。");
               }
               else if(_loc5_ == 1)
               {
                  outputText("\n在你反应过来之前，一股浓稠的女巫精液击中了你的[chest]。当你试图战斗时，你能感觉到它进入了你的[armor]，在你的[nipples]上挤压滑动。");
               }
               else if(_loc5_ == 2)
               {
                  outputText("\n一些东西从你的手臂上溅开，浸透了你的手，把它变成了一团黏糊糊的烂摊子。");
               }
               else if(_loc5_ == 3)
               {
                  outputText("\n一场乳白色的洪水击中了你的[legs]，但它似乎并没有流下来，而是向上涌，流入你的[armor]，湿漉漉地挤压过你敏感的腹股沟。");
               }
               else
               {
                  outputText("\n当精液女巫充满活力的体液喷到你脸上时，精液几乎让你失明。你吐出了一些，那东西的气味让你头晕目眩。");
                  _loc2_ = 6;
               }
               _loc3_ += 4;
            }
            _loc1_--;
         }
         get_player().takeLustDamage(_loc3_ + _loc2_,true);
      }
   }
}

