package classes.scenes.places.mothCave
{
   import classes.CoC;
   import classes.Monster;
   import classes.PerkLib;
   import classes.Player;
   import classes.ReactionContext;
   import classes.StatusEffects;
   import classes._FlagDict.FlagDict_Impl_;
   import classes.internals.WeightedChoice;
   import classes.items.Weapon;
   import classes.scenes.combat.CombatAbility;
   import classes.scenes.combat.CombatRange;
   import flash.Boot;
   import haxe.IMap;
   
   public class Outsider extends Monster
   {
      
      public var turnsPassed:int;
      
      public var timesWaited:int;
      
      public var dmg:int;
      
      public var attacked:Boolean;
      
      public function Outsider()
      {
         if(Boot.skip_constructor)
         {
            return;
         }
         dmg = 0;
         attacked = false;
         turnsPassed = 0;
         timesWaited = 0;
         super();
         set_a("");
         set_short("outsider");
         pronoun2 = "it";
         imageName = "outsider";
         set_long("你正面对着……某种东西。它是一个无定形的团块，静止时直径大约" + (get_game().get_metric() ? "一米半" : "5英尺") + "，尽管它经常移动并变形成无数种形状。你无法用任何特定的颜色来形容它，因为它更像是光都无法触及它，甚至盯着它看太久都会让你的头开始疼。即使是现在，它也在微微移动，周围的世界似乎都在随着它波动，现实的法则在它的存在下扭曲。");
         createBreastRow(0);
         ass.analLooseness = 1;
         ass.analWetness = 1;
         set_tallness(60);
         hips.rating = 2;
         butt.rating = 4;
         set_initedGenitals(true);
         initStrTouSpeInte(999,999,999,999);
         initLibSensCor(0,0,0);
         set_weaponName("strange tendril");
         set_weaponVerb("strikes");
         set_fatigue(0);
         set_weaponAttack(0);
         normalAttackAvoid.doParry = false;
         normalAttackAvoid.doCounter = false;
         set_armorName("inky mist");
         set_armorDef(99);
         bonusHP = 996466;
         set_lust(0);
         lustVuln = 0.01;
         temperment = 1;
         level = 99;
         createPerk(PerkLib.BleedImmune,0,0,0,0);
         createStatusEffect(StatusEffects.GenericRunDisabled,0,0,0,0);
         additionalXP = 0;
         set_drop(new WeightedChoice());
         checkMonster();
      }
      
      override public function won(param1:Boolean, param2:Boolean = false) : void
      {
         get_game().mothCave.doloresScene.doloresSummoningLose();
      }
      
      override public function react(param1:ReactionContext) : Boolean
      {
         var _loc2_:int = 0;
         switch(param1.index)
         {
            case 0:
               if(attacked)
               {
                  outputText("这一次，在你的攻击还没落下之前，你面前突然出现了一根漆黑的触须，你只能拼尽全力躲开它。然而，即使只是靠近它，也会让你感到[i: 灼烧]，仿佛你的皮肤正被从肉上剥离。你翻滚着躲开，疼痛很快消退为隐隐作痛，但你的肩膀已经失去了大部分知觉。触须缩了回去，但你现在对这个东西能造成的伤害充满了警惕。");
                  get_player().takeDamage(dmg);
               }
               else
               {
                  outputText("你将[weapon]砸向圆球，却震惊地发现你的攻击没有遇到任何阻力。然而，当你的" + (get_game().player.get_weapon().isUnarmed() ? "手" : "武器") + "几乎完全穿过这个存在时，它被锁在了原地，就像被固定在石头里一样。无论你怎么努力，似乎都无法把它拔出来，但突然，你感觉到末端传来一阵轻柔的压力。慢慢地，你的[weaponsingular]被沿直线推了出来，就像一根被拔出的刺。当它最终弹出来时，你踉跄着后退，气喘吁吁。");
                  dmg = int(get_player().get_HP() * 0.55);
                  attacked = true;
               }
               return false;
            case 9:
               tookAction = true;
               turnsPassed += 1;
               if(turnsPassed == 3 && get_game().player.get_HP() > 0)
               {
                  set_HP(0);
               }
               if(FlagDict_Impl_.arrayReadInt(get_flags(),22) == 1)
               {
                  switch(timesWaited = int(timesWaited + 1))
                  {
                     case 1:
                        outputText("你什么也没做，那个生物也没有。");
                        break;
                     case 2:
                        outputText("你花了一点时间盯着它看。在某种程度上，它那纯粹的不可理解性，它的超凡脱俗几乎是美丽的。也许……也许这就是多洛雷斯的意思。但在你有太多时间思考这个问题之前，一阵涟漪掠过它的表面，打破了魔咒，提醒了你的处境。你咬紧牙关，举起你的[weapon]。");
                        break;
                     case 3:
                        outputText("当你看着那个存在时，它似乎也在看着你，用你观察它的方式观察你。难道这个东西和你一样困惑吗？考虑到它是如此的异类，这倒是说得通。");
                  }
                  return false;
               }
               if(get_game().combat.currAbilityUsed == null)
               {
                  return true;
               }
               if(get_game().combat.currAbilityUsed.isSelf || get_game().combat.currAbilityUsed.get_range() == CombatRange.Self)
               {
                  return true;
               }
               if(get_player().hasStatusEffect(StatusEffects.CounterAB))
               {
                  return true;
               }
               if(attacked)
               {
                  outputText("这一次，在你的攻击还没落下之前，你面前突然出现了一根漆黑的触须，你只能拼尽全力躲开它。然而，即使只是靠近它，也会让你感到[i: 灼烧]，仿佛你的皮肤正被从肉上剥离。你翻滚着躲开，疼痛很快消退为隐隐作痛，但你的肩膀已经失去了大部分知觉。触须缩了回去，但你现在对这个东西能造成的伤害充满了警惕。");
                  get_player().takeDamage(dmg);
               }
               else
               {
                  if(get_game().combat.currAbilityUsed.isMagic())
                  {
                     outputText("当你施放法术时，魔法并没有产生预期的效果，而是似乎被吸向了圆球，在它周围汇聚，但始终没有接触到表面。它们就像油和水一样互不相溶。片刻之后，这个存在的表面开了一个小洞，能量被吸了进去。它隆隆作响了一会儿，然后静止不动，显然已经吸收了你的法术。");
                  }
                  else if(get_game().combat.currAbilityUsed.get_range() == CombatRange.Ranged)
                  {
                     outputText("你的投掷物径直穿过了圆球，当它没有表现出任何受损的迹象时，你开始感到绝望。然而，过了一会儿，它开始微微颤抖，其内部一个大致呈隧道状的部分在里面凸起。似乎即使只是穿过这个存在也引起了某种效果，但裂口很快就闭合了，所以你不知道你是否真的造成了什么伤害。");
                  }
                  else
                  {
                     if(get_game().combat.currAbilityUsed.get_abilityType() != 2)
                     {
                        return true;
                     }
                     outputText("当你靠近准备攻击时，圆球突然向你移近，你本能地挥动你的[weapon]，惊讶地发现这个东西烟雾般的身体毫无阻力。然而，当你的" + (get_game().player.get_weapon().isUnarmed() ? "手" : "武器") + "几乎完全穿过这个存在时，它被锁在了原地，就像被固定在石头里一样。无论你怎么努力，似乎都无法把它拔出来，但突然，你感觉到末端传来一阵轻柔的压力。慢慢地，你的[weaponsingular]被沿直线推了出来，就像一根被拔出的刺。当它最终弹出来时，你踉跄着后退，气喘吁吁。");
                  }
                  dmg = int(get_player().get_HP() * 0.55);
                  attacked = true;
               }
               return false;
               break;
            default:
               return true;
         }
      }
      
      override public function defeated(param1:Boolean) : void
      {
         get_game().mothCave.doloresScene.doloresSummoningWin();
      }
   }
}

