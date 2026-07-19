package classes.scenes.dungeons.wizardTower
{
   import classes.Appearance;
   import classes.CoC;
   import classes.CockTypesEnum;
   import classes.Creature;
   import classes.DynStat;
   import classes.Monster;
   import classes.PerkLib;
   import classes.Player;
   import classes.ReactionContext;
   import classes.StatusEffects;
   import classes._FlagDict.FlagDict_Impl_;
   import classes.display.SpriteDb;
   import classes.internals.MonsterAI;
   import classes.internals.Utils;
   import classes.items.Shield;
   import classes.scenes.combat.AvoidDamageParameters;
   import classes.scenes.combat.CombatRange;
   import flash.Boot;
   import haxe.IMap;
   
   public class ArchInquisitorVilkus extends Monster
   {
      
      public static var SPELL_WHITEFIRE:uint = 1;
      
      public static var SPELL_BLIND:uint = 2;
      
      public static var SPELL_AROUSE:uint = 3;
      
      public static var SPELL_HEAL:uint = 4;
      
      public var secondPhase:Boolean;
      
      public var nextAction:uint;
      
      public function ArchInquisitorVilkus()
      {
         if(Boot.skip_constructor)
         {
            return;
         }
         secondPhase = false;
         nextAction = 0;
         super();
         set_a("");
         set_short("Arch Inquisitor Vilkus");
         imageName = "archinqvilk";
         set_long("站在你面前的是一个人类，身上披着破烂的红金相间的长袍，上面错综复杂地编织着一个现已失落的王国的纹章。长袍上撕裂了几个洞，都沾满了干涸的血迹。他半弓着身子，深呼吸着，用他的刺剑支撑着身体。他似乎很痛苦，但一个长长的生锈的银色面具遮住了他的脸，让你无法准确判断他的状态。");
         balls = 0;
         ballSize = 0;
         cumMultiplier = 3;
         set_hoursSinceCum(20);
         createCock(6,1.5,CockTypesEnum.HUMAN);
         balls = 2;
         ballSize = 3;
         cumMultiplier = 25;
         createBreastRow(Appearance.breastCupInverse("flat"));
         ass.analLooseness = 1;
         ass.analWetness = 1;
         set_tallness(54);
         skin.tone = "ashen";
         hair.color = "black";
         hair.length = 15;
         initStrTouSpeInte(100,100,80,120);
         initLibSensCor(55,40,0);
         set_weaponName("estoc");
         set_weaponVerb("stab");
         set_weaponAttack(20);
         set_armorName("Inquisitor\'s Robes");
         set_armorDef(60);
         ignoreLust = true;
         bonusHP = 1000;
         set_lust(30);
         bonusLust = 100;
         lustVuln = 0.5;
         temperment = 2;
         level = 27;
         set_gems(500 + Utils.rand(250));
         set_drop(NO_DROP);
         additionalXP = 2500;
         createPerk(PerkLib.ChargingSwings,0,0,0,0);
         checkMonster();
      }
      
      override public function won(param1:Boolean, param2:Boolean = false) : void
      {
         get_game().dungeons.wizardTower.defeatedByVilkus();
      }
      
      public function whitefire() : void
      {
         outputText("[say: 玛莱，永恒之主。将你的力量降临在那些转瞬即逝的邪恶之上。将它们化为灰烬，让它们软弱的证明永存。]");
         outputText("[pg]一个火球在审判官的手中成型。他将它掷向你，火球膨胀到了可怕的大小！");
         var _loc1_:* = combatAvoidDamage(new AvoidDamageParameters(true,false,false,null,null,null,null,null));
         if(_loc1_.dodge != null)
         {
            outputText("[pg]你及时跳开，躲过了魔法攻击。");
         }
         else if(get_player().get_shield() == get_game().shields.DRGNSHL && Utils.rand(2) == 0)
         {
            outputText("[pg]你被攻击击中，但幸好及时举起了盾牌。法术被吸收并无效化了！");
         }
         else
         {
            outputText("[pg]你被法术完全击中，被魔法火焰狠狠地烧伤了！");
            get_game().combat.monsterDamageType = "Fire";
            get_player().takeDamage((100 + Utils.rand(50)) * (1 + get_player().cor * 0.01),true);
         }
         outputText("\n通过使用自身的精华来施放法术，审判官伤害了自己。");
         set_HP(get_HP() - 75);
         outputText("<b>(<font color=\"" + get_game().mainViewManager.colorHpMinus() + "\">" + 75 + "</font>)</b>");
      }
      
      public function sacrifice() : void
      {
         outputText("[say: 不。我不会堕落。我不会被诱惑！]\n你的对手咆哮着，制造出一股冲击波将你击退了片刻。然后他拿起剑，迅速刺入自己的腹部。在剑完全刺穿后，他扭动剑刃并迅速拔出，场面十分惨烈。");
         outputText("[pg]他举起剑刃，颤抖着盯着滴落的鲜血。[say: 这痛苦……我还是我自己。我依然虔诚。谢谢你，玛莱。]\n你不确定他是怎么活下来的，但他似乎已经克服了不断增长的欲望！");
         set_lust(0);
         var _loc1_:Number = 300 + Utils.rand(50);
         set_HP(get_HP() - _loc1_);
         outputText("<b>(<font color=\"" + get_game().mainViewManager.colorHpMinus() + "\">" + _loc1_ + "</font>)</b>");
         nextAction = 0;
      }
      
      override public function react(param1:ReactionContext) : Boolean
      {
         if(param1.index == 5)
         {
            if(Utils.rand(get_player().get_inte()) > Utils.rand(get_inte()) && nextAction == 2)
            {
               outputText("\n<b>你的法术压制了审判官的法术</b>，并吸收了它的魔法能量，造成了极其有效的攻击！");
               nextAction = 0;
               createStatusEffect(StatusEffects.Blind,5 * get_player().spellMod() + 2,0,0,0);
               return false;
            }
         }
         return true;
      }
      
      override public function performCombatAction() : void
      {
         inquisitorAI();
         if(HPRatio() <= 0.2 && !secondPhase)
         {
            nextAction = 4;
            return;
         }
         outputText("\n");
         if(get_player().get_lust() / get_player().maxLust() >= 0.5 && Utils.rand(3) == 0)
         {
            outputText("\n[say: 我能感觉到它在你体内。欲望。腐化的种子。我会把它从你体内撕裂出来，向神圣的大地揭示你的邪恶！]");
            nextAction = 3;
            return;
         }
         if(get_HP() >= 200 && Utils.rand(2) == 0)
         {
            outputText("\n[say: 我将焚烧你。我将把你化为灰烬，让风带着它们飘过大地，以此警告所有邪恶之徒，让他们明白自己的愚蠢与软弱。]");
            nextAction = 1;
            return;
         }
         if(!get_player().hasStatusEffect(StatusEffects.Blind) && Utils.rand(4) == 0)
         {
            outputText("\n[say: 我将向你展现玛莱的光辉。通过她的祝福，你将被净化。]");
            nextAction = 2;
            return;
         }
      }
      
      override public function outputDefaultTeaseReaction(param1:Number) : void
      {
         if(param1 == 0)
         {
            outputText("[pg]" + get_capitalA() + Utils.cnName(get_short()) + "似乎没有受到任何影响。");
         }
         outputText("[pg]" + get_capitalA() + Utils.cnName(get_short()) + "没有表现出任何情绪，但你敢发誓，他不由自主地感到了诱惑。");
      }
      
      public function inquisitorAI() : void
      {
         if(secondPhase && !hasStatusEffect(StatusEffects.Attacks))
         {
            createStatusEffect(StatusEffects.Attacks,2,0,0,0);
         }
         if(get_lust() >= 100)
         {
            sacrifice();
            return;
         }
         var _loc1_:MonsterAI = new MonsterAI();
         switch(int(nextAction))
         {
            case 1:
               _loc1_.add(whitefire,99,true,0,FATIGUE_MAGICAL,CombatRange.Ranged);
               break;
            case 2:
               _loc1_.add(blind,99,true,0,FATIGUE_MAGICAL,CombatRange.Ranged);
               break;
            case 3:
               _loc1_.add(arouse,99,true,0,FATIGUE_MAGICAL,CombatRange.Ranged);
               break;
            case 4:
               _loc1_.add(heal,1,true,10,FATIGUE_MAGICAL_HEAL,CombatRange.Self);
               break;
            default:
               _loc1_.add(heal,1,HPRatio() < 0.6 && !secondPhase,10,FATIGUE_MAGICAL_HEAL,CombatRange.Self);
               _loc1_.add(heal,2,HPRatio() < 0.3 && !secondPhase,10,FATIGUE_MAGICAL_HEAL,CombatRange.Self);
               _loc1_.add(chargeWeapon,1,!hasStatusEffect(StatusEffects.ChargeWeapon),0,FATIGUE_MAGICAL,CombatRange.Self);
               _loc1_.add(eAttack,2,true,0,FATIGUE_NONE,CombatRange.ChargingMelee);
               _loc1_.add(energyWave,2,secondPhase,0,FATIGUE_NONE,CombatRange.Ranged);
         }
         nextAction = 0;
         _loc1_.exec();
      }
      
      public function heal() : void
      {
         outputText("[say: 你无法阻止我。只要腐化尚存，我就会屹立不倒，将其净化，化为灰烬。] 你的对手将剑柄抵在胸前，吟唱着神圣的经文。奇迹般地，他的伤口开始愈合！");
         var _loc1_:Number = Math.round(maxHP() * (1 + Utils.rand(2)) * 0.1);
         addHP(_loc1_);
         outputText("<b>(<font color=\"" + get_game().mainViewManager.colorHpPlus() + "\">" + _loc1_ + "</font>)</b>");
      }
      
      override public function handleFear() : Boolean
      {
         outputText("[say: 我绝不颤抖或恐惧，因为我与玛莱同在，与她同在的人将受到永恒的祝福！]");
         eAttack();
         removeStatusEffect(StatusEffects.Fear);
         return true;
      }
      
      public function energyWave() : void
      {
         outputText("维尔库斯高举他的剑。剑刃跳动着力量，他劈开空气，向你发出一道能量波！");
         var _loc1_:* = combatAvoidDamage(new AvoidDamageParameters(true,false,false,null,null,null,null,null));
         if(_loc1_.dodge != null)
         {
            outputText("[pg]你及时跳开，成功躲避了能量波。");
         }
         else if(get_player().get_shield() == get_game().shields.DRGNSHL && Utils.rand(2) == 0)
         {
            outputText("[pg]你被攻击击中了，但幸好及时举起了盾牌。能量波被吸收并抵消了！");
         }
         else
         {
            outputText("[pg]你被能量波击中，它直接穿透了你的[armor]。腐化力量从内部灼烧着你，让你痛苦地皱起眉头！");
            if(int([DynStat.Cor(-5)].length) == 0)
            {
               get_game().player.dynStats();
            }
            else if(int([DynStat.Cor(-5)].length) == 1)
            {
               get_game().player.dynStats([DynStat.Cor(-5)][0]);
            }
            else if(int([DynStat.Cor(-5)].length) == 2)
            {
               get_game().player.dynStats([DynStat.Cor(-5)][0],[DynStat.Cor(-5)][1]);
            }
            else if(int([DynStat.Cor(-5)].length) == 3)
            {
               get_game().player.dynStats([DynStat.Cor(-5)][0],[DynStat.Cor(-5)][1],[DynStat.Cor(-5)][2]);
            }
            else if(int([DynStat.Cor(-5)].length) == 4)
            {
               get_game().player.dynStats([DynStat.Cor(-5)][0],[DynStat.Cor(-5)][1],[DynStat.Cor(-5)][2],[DynStat.Cor(-5)][3]);
            }
            else if(int([DynStat.Cor(-5)].length) == 5)
            {
               get_game().player.dynStats([DynStat.Cor(-5)][0],[DynStat.Cor(-5)][1],[DynStat.Cor(-5)][2],[DynStat.Cor(-5)][3],[DynStat.Cor(-5)][4]);
            }
            else if(int([DynStat.Cor(-5)].length) == 6)
            {
               get_game().player.dynStats([DynStat.Cor(-5)][0],[DynStat.Cor(-5)][1],[DynStat.Cor(-5)][2],[DynStat.Cor(-5)][3],[DynStat.Cor(-5)][4],[DynStat.Cor(-5)][5]);
            }
            else if(int([DynStat.Cor(-5)].length) == 7)
            {
               get_game().player.dynStats([DynStat.Cor(-5)][0],[DynStat.Cor(-5)][1],[DynStat.Cor(-5)][2],[DynStat.Cor(-5)][3],[DynStat.Cor(-5)][4],[DynStat.Cor(-5)][5],[DynStat.Cor(-5)][6]);
            }
            else if(int([DynStat.Cor(-5)].length) == 8)
            {
               get_game().player.dynStats([DynStat.Cor(-5)][0],[DynStat.Cor(-5)][1],[DynStat.Cor(-5)][2],[DynStat.Cor(-5)][3],[DynStat.Cor(-5)][4],[DynStat.Cor(-5)][5],[DynStat.Cor(-5)][6],[DynStat.Cor(-5)][7]);
            }
            else if(int([DynStat.Cor(-5)].length) == 9)
            {
               get_game().player.dynStats([DynStat.Cor(-5)][0],[DynStat.Cor(-5)][1],[DynStat.Cor(-5)][2],[DynStat.Cor(-5)][3],[DynStat.Cor(-5)][4],[DynStat.Cor(-5)][5],[DynStat.Cor(-5)][6],[DynStat.Cor(-5)][7],[DynStat.Cor(-5)][8]);
            }
            else if(int([DynStat.Cor(-5)].length) == 10)
            {
               get_game().player.dynStats([DynStat.Cor(-5)][0],[DynStat.Cor(-5)][1],[DynStat.Cor(-5)][2],[DynStat.Cor(-5)][3],[DynStat.Cor(-5)][4],[DynStat.Cor(-5)][5],[DynStat.Cor(-5)][6],[DynStat.Cor(-5)][7],[DynStat.Cor(-5)][8],[DynStat.Cor(-5)][9]);
            }
            else if(int([DynStat.Cor(-5)].length) == 11)
            {
               get_game().player.dynStats([DynStat.Cor(-5)][0],[DynStat.Cor(-5)][1],[DynStat.Cor(-5)][2],[DynStat.Cor(-5)][3],[DynStat.Cor(-5)][4],[DynStat.Cor(-5)][5],[DynStat.Cor(-5)][6],[DynStat.Cor(-5)][7],[DynStat.Cor(-5)][8],[DynStat.Cor(-5)][9],[DynStat.Cor(-5)][10]);
            }
            else if(int([DynStat.Cor(-5)].length) == 12)
            {
               get_game().player.dynStats([DynStat.Cor(-5)][0],[DynStat.Cor(-5)][1],[DynStat.Cor(-5)][2],[DynStat.Cor(-5)][3],[DynStat.Cor(-5)][4],[DynStat.Cor(-5)][5],[DynStat.Cor(-5)][6],[DynStat.Cor(-5)][7],[DynStat.Cor(-5)][8],[DynStat.Cor(-5)][9],[DynStat.Cor(-5)][10],[DynStat.Cor(-5)][11]);
            }
            else if(int([DynStat.Cor(-5)].length) == 13)
            {
               get_game().player.dynStats([DynStat.Cor(-5)][0],[DynStat.Cor(-5)][1],[DynStat.Cor(-5)][2],[DynStat.Cor(-5)][3],[DynStat.Cor(-5)][4],[DynStat.Cor(-5)][5],[DynStat.Cor(-5)][6],[DynStat.Cor(-5)][7],[DynStat.Cor(-5)][8],[DynStat.Cor(-5)][9],[DynStat.Cor(-5)][10],[DynStat.Cor(-5)][11],[DynStat.Cor(-5)][12]);
            }
            else if(int([DynStat.Cor(-5)].length) == 14)
            {
               get_game().player.dynStats([DynStat.Cor(-5)][0],[DynStat.Cor(-5)][1],[DynStat.Cor(-5)][2],[DynStat.Cor(-5)][3],[DynStat.Cor(-5)][4],[DynStat.Cor(-5)][5],[DynStat.Cor(-5)][6],[DynStat.Cor(-5)][7],[DynStat.Cor(-5)][8],[DynStat.Cor(-5)][9],[DynStat.Cor(-5)][10],[DynStat.Cor(-5)][11],[DynStat.Cor(-5)][12],[DynStat.Cor(-5)][13]);
            }
            else if(int([DynStat.Cor(-5)].length) == 15)
            {
               get_game().player.dynStats([DynStat.Cor(-5)][0],[DynStat.Cor(-5)][1],[DynStat.Cor(-5)][2],[DynStat.Cor(-5)][3],[DynStat.Cor(-5)][4],[DynStat.Cor(-5)][5],[DynStat.Cor(-5)][6],[DynStat.Cor(-5)][7],[DynStat.Cor(-5)][8],[DynStat.Cor(-5)][9],[DynStat.Cor(-5)][10],[DynStat.Cor(-5)][11],[DynStat.Cor(-5)][12],[DynStat.Cor(-5)][13],[DynStat.Cor(-5)][14]);
            }
            else if(int([DynStat.Cor(-5)].length) == 16)
            {
               get_game().player.dynStats([DynStat.Cor(-5)][0],[DynStat.Cor(-5)][1],[DynStat.Cor(-5)][2],[DynStat.Cor(-5)][3],[DynStat.Cor(-5)][4],[DynStat.Cor(-5)][5],[DynStat.Cor(-5)][6],[DynStat.Cor(-5)][7],[DynStat.Cor(-5)][8],[DynStat.Cor(-5)][9],[DynStat.Cor(-5)][10],[DynStat.Cor(-5)][11],[DynStat.Cor(-5)][12],[DynStat.Cor(-5)][13],[DynStat.Cor(-5)][14],[DynStat.Cor(-5)][15]);
            }
            else if(int([DynStat.Cor(-5)].length) == 17)
            {
               get_game().player.dynStats([DynStat.Cor(-5)][0],[DynStat.Cor(-5)][1],[DynStat.Cor(-5)][2],[DynStat.Cor(-5)][3],[DynStat.Cor(-5)][4],[DynStat.Cor(-5)][5],[DynStat.Cor(-5)][6],[DynStat.Cor(-5)][7],[DynStat.Cor(-5)][8],[DynStat.Cor(-5)][9],[DynStat.Cor(-5)][10],[DynStat.Cor(-5)][11],[DynStat.Cor(-5)][12],[DynStat.Cor(-5)][13],[DynStat.Cor(-5)][14],[DynStat.Cor(-5)][15],[DynStat.Cor(-5)][16]);
            }
            else if(int([DynStat.Cor(-5)].length) == 18)
            {
               get_game().player.dynStats([DynStat.Cor(-5)][0],[DynStat.Cor(-5)][1],[DynStat.Cor(-5)][2],[DynStat.Cor(-5)][3],[DynStat.Cor(-5)][4],[DynStat.Cor(-5)][5],[DynStat.Cor(-5)][6],[DynStat.Cor(-5)][7],[DynStat.Cor(-5)][8],[DynStat.Cor(-5)][9],[DynStat.Cor(-5)][10],[DynStat.Cor(-5)][11],[DynStat.Cor(-5)][12],[DynStat.Cor(-5)][13],[DynStat.Cor(-5)][14],[DynStat.Cor(-5)][15],[DynStat.Cor(-5)][16],[DynStat.Cor(-5)][17]);
            }
            else if(int([DynStat.Cor(-5)].length) == 19)
            {
               get_game().player.dynStats([DynStat.Cor(-5)][0],[DynStat.Cor(-5)][1],[DynStat.Cor(-5)][2],[DynStat.Cor(-5)][3],[DynStat.Cor(-5)][4],[DynStat.Cor(-5)][5],[DynStat.Cor(-5)][6],[DynStat.Cor(-5)][7],[DynStat.Cor(-5)][8],[DynStat.Cor(-5)][9],[DynStat.Cor(-5)][10],[DynStat.Cor(-5)][11],[DynStat.Cor(-5)][12],[DynStat.Cor(-5)][13],[DynStat.Cor(-5)][14],[DynStat.Cor(-5)][15],[DynStat.Cor(-5)][16],[DynStat.Cor(-5)][17],[DynStat.Cor(-5)][18]);
            }
            else
            {
               if(int([DynStat.Cor(-5)].length) != 20)
               {
                  throw "Too many rest arguments";
               }
               get_game().player.dynStats([DynStat.Cor(-5)][0],[DynStat.Cor(-5)][1],[DynStat.Cor(-5)][2],[DynStat.Cor(-5)][3],[DynStat.Cor(-5)][4],[DynStat.Cor(-5)][5],[DynStat.Cor(-5)][6],[DynStat.Cor(-5)][7],[DynStat.Cor(-5)][8],[DynStat.Cor(-5)][9],[DynStat.Cor(-5)][10],[DynStat.Cor(-5)][11],[DynStat.Cor(-5)][12],[DynStat.Cor(-5)][13],[DynStat.Cor(-5)][14],[DynStat.Cor(-5)][15],[DynStat.Cor(-5)][16],[DynStat.Cor(-5)][17],[DynStat.Cor(-5)][18],[DynStat.Cor(-5)][19]);
            }
            get_player().takeDamage(Math.round(75 + Utils.rand(30) + get_player().cor / 3),true);
            if(get_player().bleed(this,4,2))
            {
               outputText("\n能量波撕裂了你的血肉，导致你大量出血。");
            }
         }
         outputText("\n通过使用自身的精华来施放法术，审判官伤害了自己。");
         set_HP(get_HP() - 100);
         outputText("<b>(<font color=\"" + get_game().mainViewManager.colorHpMinus() + "\">" + 100 + "</font>)</b>");
      }
      
      override public function eAttack() : void
      {
         if(secondPhase)
         {
            switch(Utils.rand(2))
            {
               case 0:
                  outputText("维尔库斯跳了起来，以一种不自然的力量将自己弹射到空中，然后向你扑来！\n");
                  break;
               case 1:
                  outputText("维尔库斯向后一仰，然后以不可思议的速度向前冲刺，将他的刺剑刺向你！\n");
                  break;
               case 2:
                  outputText("维尔库斯向你滚来，然后跳起一个旋转劈砍，展现出无与伦比的敏捷！\n");
            }
         }
         super.eAttack();
      }
      
      override public function defeated(param1:Boolean) : void
      {
         clearOutput();
         if(secondPhase)
         {
            get_game().dungeons.wizardTower.defeatVilkus();
            return;
         }
         outputText("审判官踉跄后退，跌倒在地，伤痕累累，鲜血直流。");
         outputText("[pg][say: 玛莱……你为何如此考验我？我所说的每一句话都离不开你的祝福，我的手只知道你的指引，那么为什么……为什么我们会堕落？]");
         outputText("\n审判官痛苦地喘息着。[say: 玛莱……我对你的爱是永恒的。即使我的灵魂离开了我，我的呼吸离开了我的肺腑，我也会侍奉你。]");
         outputText("\n他看着自己沾满鲜血的双手，新旧血迹交织，那是上千次鞭笞的纪念。[say: 我明白了……我仍然可以侍奉你。如果我不能烧尽所有的腐化，那么我将把它揽在自己身上，我的灵魂将把它烧成灰烬。]");
         outputText("[pg]审判官站起身来，双膝跪地，双手握住他的剑。剑开始发出明亮的光芒，照亮了整个房间。");
         outputText("他站起身来，房间周围的忘川水晶发出光芒。能量的轨迹从水晶中飘出，进入剑刃。");
         outputText("[pg]片刻之后，水晶失去了光芒，变成了不透明的灰色。\n[say: 我将燃烧……吞噬一切。在一个没有生命的世界里，就不会有腐化。]");
         outputText("\n伴随着一个果断的动作，审判官再次刺伤了自己。紫色的能量包裹着他，他尖叫着，颤抖着，他的声音慢慢变得更加低沉，更加不似人类。");
         outputText("\n他把剑从腹部拔出，剑刃上的血是漆黑的，深紫色的光环包裹着整个武器。[say: 是的。即使是现在，我也可以侍奉你，玛莱。]");
         outputText("[pg]他用剑指着你。你又要面临一场战斗了！");
         bonusHP = 2400;
         set_HP(maxHP());
         removeStatusEffect(StatusEffects.ChargeWeapon);
         cor = 100;
         set_armorDef(60);
         set_short("Vilkus, the Last Flame");
         set_long("维尔库斯笔直地站着，骄傲而坚定。腐化的光环包围着他的整个身体，连空气都因为他的存在而闪烁。他不再用武器支撑身体，武器的刀刃随着腐化的能量剧烈地跳动着。");
         level = 35;
         set_lust(0);
         lustVuln = 0.7;
         set_weaponAttack(40);
         secondPhase = true;
         tookAction = true;
         get_game().spriteSelect(SpriteDb.get_s_vilkus_tf());
         get_game().combat.startMonsterTurn();
         nextAction = 0;
         set_a("");
      }
      
      public function chargeWeapon() : void
      {
         outputText("审判官双手举剑，虔诚地注视着它。[say: 当我承载你的话语并祝福你的光辉时，请让我承载你的力量并净化你的敌人。]\n他抬起一只手，轻轻地在剑刃上滑动，剑开始发光，并发出魔法能量的噼啪声。");
         outputText("\n看来他现在的近战攻击会造成更多伤害了！");
         outputText("\n通过使用自身的精华来施放法术，审判官伤害了自己。");
         set_HP(get_HP() - 50);
         outputText("<b>(<font color=\"" + get_game().mainViewManager.colorHpMinus() + "\">" + 50 + "</font>)</b>");
         createStatusEffect(StatusEffects.ChargeWeapon,25,0,0,0);
      }
      
      public function blind() : void
      {
         outputText("[say: 黑暗不解光明，仁慈的玛莱。向他们揭示他们自己的邪恶，无知被你神圣的存在撕裂，让他们迷失在你的光辉中。]\n审判官高举他的剑，剑上闪耀出明亮的魔法光芒！");
         if(Utils.rand(get_player().get_inte() / 6) <= 4)
         {
            outputText("<b>你失明了！</b>");
            get_player().createStatusEffect(StatusEffects.Blind,1 + Utils.rand(3),0,0,0);
         }
         else
         {
            outputText("\n你及时眨眼，躲过了致盲攻击。");
         }
         outputText("\n通过消耗自身的精华来施放法术，审判官伤害了自己。");
         set_HP(get_HP() - 25);
         outputText("<b>(<font color=\"" + get_game().mainViewManager.colorHpMinus() + "\">" + 25 + "</font>)</b>");
      }
      
      public function arouse() : void
      {
         outputText("[say: 你的决心很脆弱。欲望，正在表面翻腾。让它喷涌而出吧，这样它才能被净化。] 你的对手举起一只手臂，伴随着神秘的吟唱，向你释放出一波黑魔法！");
         var _loc1_:* = combatAvoidDamage(new AvoidDamageParameters(true,false,false,null,null,null,null,null));
         if(_loc1_.dodge != null)
         {
            outputText("[pg]你及时跳开，躲过了魔法攻击。");
         }
         else if(get_player().get_shield() == get_game().shields.DRGNSHL && Utils.rand(2) == 0)
         {
            outputText("[pg]你被攻击击中，但幸好及时举起了盾牌。法术被吸收并无效化了！");
         }
         else
         {
            outputText("[pg]你被法术击中，立刻感到浑身发热。");
            if(FlagDict_Impl_.arrayReadInt(get_flags(),2001) > 0)
            {
               outputText("过去性经历的记忆冲击着你，你发现很难集中精力应对当前的战斗！");
               get_player().takeLustDamage(35 + lib / 5 + Utils.rand(cor / 5),true);
            }
            else
            {
               outputText("然而，这种效果是短暂的，你并没有感觉更糟！\n[say: 你可能没有被欲望玷污，但我会揭露你的其他罪行。在我的净化面前，没有人能保持纯洁。]");
            }
         }
         outputText("\n通过使用自身的精华来施放法术，审判官伤害了自己。");
         set_HP(get_HP() - 50);
         outputText("<b>(<font color=\"" + get_game().mainViewManager.colorHpMinus() + "\">" + 50 + "</font>)</b>");
      }
   }
}

