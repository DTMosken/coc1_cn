package classes.scenes.areas.swamp
{
   import classes.Appearance;
   import classes.CoC;
   import classes.Creature;
   import classes.DynStat;
   import classes.ItemType;
   import classes.Monster;
   import classes.PerkLib;
   import classes.Player;
   import classes.ReactionContext;
   import classes.StatusEffect;
   import classes.StatusEffects;
   import classes.internals.MonsterAI;
   import classes.internals.Utils;
   import classes.internals.WeightedChoice;
   import classes.items.ConsumableLib;
   import classes.scenes.combat.AvoidDamageParameters;
   import classes.scenes.combat.CombatRange;
   import classes.statusEffects.combat.StimulatingAuraDebuff;
   import classes.statusEffects.combat.VineTangled;
   import flash.Boot;
   
   public class Alraune extends Monster
   {
      
      public var rooted:Boolean;
      
      public var didTrip:Boolean;
      
      public function Alraune()
      {
         if(Boot.skip_constructor)
         {
            return;
         }
         didTrip = false;
         rooted = true;
         super();
         set_a("");
         set_short("black velvet alraune");
         imageName = "alraune";
         updateDesc();
         set_race("alraune");
         createVagina(false,2,1);
         createBreastRow(Appearance.breastCupInverse("B"));
         ass.analLooseness = 1;
         ass.analWetness = 0;
         set_tallness(64);
         hips.rating = 4;
         butt.rating = 2;
         skin.tone = "pale";
         hair.color = "deep purple";
         hair.length = 4;
         initStrTouSpeInte(55,70,10,60);
         initLibSensCor(50,30,60);
         set_weaponName("vines");
         set_weaponVerb("whip");
         set_weaponAttack(25);
         normalAttackAvoid.doParry = false;
         normalAttackAvoid.doCounter = false;
         set_armorName("skin");
         set_armorDef(15);
         canBlock = true;
         set_shieldName("藤蔓");
         set_shieldBlock(20);
         set_fatigue(0);
         bonusHP = 200;
         set_lust(0);
         lustVuln = 0.4;
         level = 12;
         set_gems(Utils.rand(15) + 25);
         set_drop(new WeightedChoice().add(get_consumables().COAL___,1).add(get_consumables().P_WHSKY,1).add(get_consumables().P_SEED,1).add(null,1));
         createPerk(PerkLib.PoisonImmune);
         createPerk(PerkLib.BleedImmune);
         set_fireRes(1.5);
         isImmobilized = true;
         checkMonster();
      }
      
      override public function won(param1:Boolean, param2:Boolean = false) : void
      {
         get_game().swamp.alrauneScene.alrauneWon();
      }
      
      public function whip() : void
      {
         var _loc2_:Number = NaN;
         var _loc1_:Number = didTrip ? 100 : get_player().standardDodgeFunc(this);
         var _loc3_:Array = ["[SPEED]差点打中你。","[EVADE]差点打中你。","[MISDIRECTION]差点打中你。","[UNHANDLED]差点打中你。","[FLEXIBILITY]差点打中你。","[BLIND]差点打中你。","[PARRY]但你设法用你的[weapon]将它们挡开。"];
         var _loc4_:AvoidDamageParameters = new AvoidDamageParameters(true,true,false,null,null,_loc1_,null,null);
         outputText("你附近的黑色藤蔓向你的位置扫去，");
         if(!playerAvoidDamage(_loc4_,_loc3_))
         {
            outputText("直接撞向你的身体。");
            _loc2_ = get_player().reduceDamage(get_str() + get_weaponAttack(),this);
            get_player().takeDamage(_loc2_,true);
            if(didTrip || Utils.rand(5) == 0)
            {
               get_player().bleed(this);
            }
         }
      }
      
      public function vineTrip() : Boolean
      {
         var _loc1_:Boolean = Boolean(combatAvoidDamage(new AvoidDamageParameters(true,false,false,null,null,null,null,null)).attackFailed);
         outputText("[pg]当你试图快速移动时，隐藏在草丛和泥巴里的藤蔓突然行动起来，" + (_loc1_ ? "差点缠住你的[legs]！爱娜温看起来很不高兴。" : "缠住了你的[legs]！由于你之前的冲力，你立刻重重地摔在地上，而爱娜温则在一旁嘲笑你。"));
         didTrip = !_loc1_;
         return _loc1_;
      }
      
      public function uproot(param1:Boolean = false) : void
      {
         if(rooted)
         {
            rooted = false;
            isImmobilized = false;
            if(!param1)
            {
               outputText("由于爱娜温已经厌倦了固定位置的战斗，一阵吧唧和断裂的声音标志着她将自己连根拔起。她那有些湿润的下半身似乎是盘绕的根须，急剧弯曲成了腿的形状。她手臂上的藤蔓向手部靠拢，形成了长满荆棘的巨大爪子。");
            }
            updateDesc();
            dynStats(DynStat.Spe(40));
            set_weaponName("claws");
            set_weaponVerb("swipe");
            normalAttackAvoid.doParry = true;
            normalAttackAvoid.doCounter = true;
            set_armorDef(get_armorDef() - 10);
            if(get_armorDef() < 0)
            {
               set_armorDef(0);
            }
            set_shieldBlock(get_shieldBlock() - 15);
            if(get_shieldBlock() < 0)
            {
               set_shieldBlock(0);
            }
            lustVuln += 0.4;
            createPerk(PerkLib.ExtraDodge,20,0,0,0);
         }
      }
      
      public function updateDesc() : void
      {
         set_long("你面前这位迷人的植物娘，如果她是人类的话，身高几乎和普通女性差不多，尽管她身上蜿蜒盘旋的许多黑色藤蔓向你保证，她和其他怪物一样可怕。她嘴唇、眼睛和头发上深邃暗沉的紫色和靛蓝色，与她苍白得几乎毫无生气的皮肤形成了鲜明的对比。" + (rooted ? "她身体的底部，腰部以下，是一朵由黑色、紫色和红色组成的巨大花朵，从她的藤蔓和头发上长出的许多小花也有着同样的颜色。" : "她大腿以下是粗壮的炭黑色根须，急剧弯曲成趾行腿的形状，末端是长长的爪子。") + " 她的手看起来温柔柔软，但盘绕并延伸出手的，是她可以当作鞭子使用的长满荆棘的藤蔓。");
      }
      
      public function tease() : void
      {
         var _loc2_:* = null as String;
         var _loc3_:* = null as Array;
         var _loc1_:Array = [];
         _loc1_.push("爱娜温扭动着臀部，将几根长着玫瑰的藤蔓拉近，勾勒出她充满女性魅力的身姿。");
         _loc1_.push("[say: 来尝尝大自然的甘露吧，]她说着，将腹股沟周围的花瓣放低，几乎要露出她的小穴。");
         _loc1_.push("爱娜温伸了个懒腰，露出她柔软而大小适中的乳房，顶端点缀着粉色的乳头。");
         if(get_player().isMale())
         {
            _loc1_.push("爱娜温以诱惑的姿态勾了勾手指，说道：[say: 请在这片肥沃的土地上播下你的种子吧。]");
         }
         if(get_player().dryadScore() >= 3 && get_player().hasGenitals())
         {
            if(get_player().hasCock())
            {
               _loc3_ = ["你不想让你的雌蕊和我的雄蕊碰一碰吗？","过来给我授粉吧，"];
               _loc2_ = _loc3_[Utils.rand(int(_loc3_.length))];
            }
            else
            {
               _loc2_ = "你不好奇我们的花朵亲吻起来是什么感觉吗？";
            }
            _loc1_.push("[say: " + _loc2_ + "]她眨着眼睛说道。");
         }
         var _loc4_:Number = Utils.rand(10) + Utils.rand(10) + Utils.rand(10);
         _loc3_ = _loc1_;
         outputText(_loc3_[Utils.rand(int(_loc3_.length))]);
         get_player().takeLustDamage(_loc4_,true);
      }
      
      public function rootPassives() : void
      {
         if(get_player().hasStatusEffect(StatusEffects.StimulatingAura))
         {
            get_player().statusEffectByType(StatusEffects.StimulatingAura).increase();
         }
         else
         {
            get_player().createStatusEffect(StatusEffects.StimulatingAura);
         }
         changeFatigue(-5);
      }
      
      public function root(param1:Boolean = false) : void
      {
         if(!rooted)
         {
            rooted = true;
            isImmobilized = true;
            if(!param1)
            {
               outputText("在经历了高速的肉搏战后，精疲力竭的爱娜温退回了她的花巢中。");
            }
            updateDesc();
            dynStats(DynStat.Spe(-40));
            set_weaponName("vines");
            set_weaponVerb("whip");
            normalAttackAvoid.doParry = false;
            normalAttackAvoid.doCounter = false;
            set_armorDef(get_armorDef() + 10);
            set_shieldBlock(get_shieldBlock() + 15);
            lustVuln -= 0.4;
            removePerk(PerkLib.ExtraDodge);
            addHP(maxHP() * 0.05);
         }
      }
      
      override public function react(param1:ReactionContext) : Boolean
      {
         switch(param1.index)
         {
            case 7:
            case 8:
               return vineTrip();
            default:
               return true;
         }
      }
      
      override public function performCombatAction() : void
      {
         var _g1:Alraune;
         var _g:Alraune;
         var _loc1_:MonsterAI = new MonsterAI();
         _loc1_.add(entangle,2,rooted && get_player().canMove(),5,FATIGUE_PHYSICAL,CombatRange.Ranged);
         _loc1_.add(whip,2,rooted,5,FATIGUE_PHYSICAL,CombatRange.Ranged);
         _loc1_.add(tease,2,rooted,0,FATIGUE_NONE,CombatRange.Tease);
         _g = this;
         _loc1_.add(function():void
         {
            _g.uproot();
         },1,rooted,0,FATIGUE_NONE,CombatRange.Self);
         _loc1_.add(charge,3,!rooted,15,FATIGUE_PHYSICAL,CombatRange.ChargingMelee);
         _loc1_.add(lash,3,!rooted,10,FATIGUE_PHYSICAL,CombatRange.Melee);
         _g1 = this;
         _loc1_.add(function():void
         {
            _g1.root();
         },1,!rooted,0,FATIGUE_NONE,CombatRange.Self);
         _loc1_.exec();
      }
      
      public function lash() : void
      {
         var _loc2_:Number = NaN;
         var _loc1_:Number = didTrip ? 100 : get_player().standardDodgeFunc(this);
         var _loc3_:Array = ["[SPEED]你避开了，虽然只是勉强躲过。","[EVADE]你避开了，虽然只是勉强躲过。","[MISDIRECTION]你避开了，虽然只是勉强躲过。","[UNHANDLED]你避开了，虽然只是勉强躲过。","[FLEXIBILITY]你避开了，虽然只是勉强躲过。","[BLIND]你避开了，虽然只是勉强躲过。","[BLOCK]你用[shield]挡下了这一击。","[PARRY]你勉强用[weapon]将她的爪子从你身边格挡开。"];
         var _loc4_:AvoidDamageParameters = new AvoidDamageParameters(true,true,true,null,null,_loc1_,null,null);
         outputText("这只行动敏捷的爱娜温发出威胁的笑声，挥舞着她的藤蔓利爪，在身前不远处猛地一挥。");
         if(!playerAvoidDamage(_loc4_,_loc3_))
         {
            outputText("攻击范围的突然增加，即使只有一点点，也让人难以防备，她的爪子深深地刺入了你的身体。");
            _loc2_ = get_str() + get_weaponAttack();
            _loc2_ = get_player().reduceDamage(Utils.randBetween(_loc2_,1.5 * _loc2_),this);
            get_player().takeDamage(_loc2_,true);
            if(didTrip || Utils.rand(4) > 0)
            {
               get_player().bleed(this,didTrip ? 3 : 4,didTrip ? 1 : 1 + Utils.rand(2));
            }
         }
      }
      
      override public function handleAwardItemText(param1:ItemType) : void
      {
         var _loc2_:Boolean = false;
         var _loc3_:Boolean = false;
         if(param1 == get_consumables().COAL___ == true)
         {
            outputText("\n在苦战之后，你搜查了她的残骸，发现了几小块煤炭！也许是用来画眼影的？");
         }
         else
         {
            _loc3_ = param1 == get_consumables().P_WHSKY;
            if(_loc3_ == true)
            {
               outputText("\n你有些震惊地发现，她背部那个巨大的破洞里竟然有一瓶威士忌。");
            }
            else
            {
               _loc2_ = param1 == get_consumables().P_SEED;
               if(_loc2_ == true)
               {
                  outputText("\n你在她的花瓣中发现了一颗巨大的南瓜籽。至少，你觉得那是一颗南瓜籽。反正你营地周围的土地也不太可能种得出一只爱娜温。");
               }
               else if(Utils.randomChance(10) && get_game().get_silly())
               {
                  outputText("\n在翻找她的物品时，你发现了一件由草和树枝做成的破旧土色长袍。它看起来相当廉价，显然设计得很糟糕。你认出这就是一堆垃圾，于是把它扔了。");
               }
            }
         }
      }
      
      override public function getEvasionChance() : Number
      {
         if(rooted)
         {
            return 0;
         }
         return Number(super.getEvasionChance());
      }
      
      override public function getBaseCritChance() : Number
      {
         var _loc1_:Number = 5;
         if(!rooted)
         {
            _loc1_ += 10;
         }
         return _loc1_;
      }
      
      public function entangle() : void
      {
         var _loc1_:Number = didTrip ? 100 : get_player().standardDodgeFunc(this) / 2;
         outputText("隐蔽的黑色藤蔓向你的[legs]甩去，");
         if(get_player().isGoo())
         {
            outputText("撞向你黏糊糊的身体，但在你滑出时没能抓住你。");
         }
         else if(Boolean(combatAvoidDamage(new AvoidDamageParameters(true,false,false,null,null,_loc1_,null,null)).attackFailed))
         {
            outputText("在你跳开时远远地打偏了。");
         }
         else
         {
            outputText("在你周围旋转，直到将你紧紧地束缚在原地。");
            get_player().addStatusEffect(new VineTangled(3));
         }
      }
      
      override public function defeated(param1:Boolean) : void
      {
         get_game().swamp.alrauneScene.alrauneDefeated(rooted);
      }
      
      override public function combatRoundUpdate() : void
      {
         didTrip = false;
         if(rooted)
         {
            rootPassives();
         }
         super.combatRoundUpdate();
      }
      
      public function charge() : void
      {
         var _loc2_:Number = NaN;
         var _loc1_:Number = didTrip ? 100 : get_player().standardDodgeFunc(this);
         var _loc3_:Array = ["[SPEED]凭借着不可思议的好运，你反应迅速，躲开了她危险的挥击。","[EVADE]凭借着不可思议的好运，你反应迅速，躲开了她危险的挥击。","[MISDIRECTION]凭借着不可思议的好运，你反应迅速，躲开了她危险的挥击。","[UNHANDLED]凭借着不可思议的好运，你反应迅速，躲开了她危险的挥击。","[FLEXIBILITY]凭借着不可思议的好运，你反应迅速，躲开了她危险的挥击。","[BLIND]凭借着不可思议的好运，你反应迅速，躲开了她危险的挥击。","[BLOCK]凭借着不可思议的好运，你反应迅速，及时举起了你的[shield]。"];
         var _loc4_:AvoidDamageParameters = new AvoidDamageParameters(true,false,true,null,true,_loc1_,null,null);
         outputText("她粗壮根须弯曲的声音是唯一的短暂警告，随后这只爱娜温突然向你冲来，利爪已经准备就绪！");
         if(!playerAvoidDamage(_loc4_,_loc3_))
         {
            outputText("她猛地撞向你，在被你击退之前，尽可能深地将爪子刺入你的身体。");
            _loc2_ = get_player().reduceDamage((get_str() + get_weaponAttack()) * 1.5,this);
            get_player().takeDamage(_loc2_,true);
            get_player().bleed(this,3 + Utils.rand(4),3);
         }
      }
   }
}

