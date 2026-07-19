package classes.scenes.areas.glacialRift
{
   import classes.Appearance;
   import classes.CoC;
   import classes.Creature;
   import classes.ItemType;
   import classes.Monster;
   import classes.Player;
   import classes.internals.MonsterAI;
   import classes.internals.Utils;
   import classes.internals.WeightedChoice;
   import classes.items.Armor;
   import classes.items.ConsumableLib;
   import classes.items.ShieldLib;
   import classes.items.WeaponLib;
   import classes.scenes.combat.AvoidDamageParameters;
   import classes.scenes.combat.CombatRange;
   import flash.Boot;
   
   public class Valkyrie extends Monster
   {
      
      public function Valkyrie()
      {
         if(Boot.skip_constructor)
         {
            return;
         }
         super();
         set_a("");
         set_short("valkyrie");
         imageName = "valkyrie";
         set_long("她是一个高挑、皮肤苍白的女人，金色的长发从青铜头盔下倾泻而出。如果不是她背上长出的巨大而有力的翅膀，展开可能有十几英尺宽，她看起来几乎和人类一样。她穿着一件沉重的青铜胸甲，完美地包裹着她挺拔的C罩杯，并挥舞着长矛和盾牌作为武器。她摆出了训练有素、经验丰富的战士的姿态，几乎没有给你留下任何可以利用的破绽。");
         set_race("Valkyrie");
         createVagina(false,1,1);
         createBreastRow(Appearance.breastCupInverse("C"));
         ass.analLooseness = 1;
         ass.analWetness = 1;
         set_tallness(84);
         hips.rating = 2;
         butt.rating = 2;
         skin.tone = "light";
         skin.setType(0);
         hair.color = "white";
         hair.length = 12;
         initStrTouSpeInte(85,70,80,60);
         initLibSensCor(40,50,15);
         set_weaponName("spear and shield");
         set_weaponVerb("pummel");
         set_weaponAttack(14);
         set_armorName("bronze plates");
         set_armorDef(17);
         bonusHP = 380;
         set_lust(25 + Utils.rand(15));
         lustVuln = 0.46;
         temperment = 1;
         level = 18;
         set_gems(30);
         set_drop(new WeightedChoice().add(get_weapons().SPEAR,1).add(get_shields().GREATSH,2).add(get_consumables().W__BOOK,4).add(null,18));
         wings.type = 9;
         checkMonster();
      }
      
      override public function won(param1:Boolean, param2:Boolean = false) : void
      {
         get_game().glacialRift.valkyrieScene.loseToValkyrie();
      }
      
      public function spearAttack() : void
      {
         var _loc2_:int = 0;
         var _loc3_:int = 0;
         outputText("女武神向你扑来，用她的长矛刺向你。你轻松躲过了第一次攻击，");
         var _loc1_:* = combatAvoidDamage(new AvoidDamageParameters(true,true,false,null,null,null,null,null));
         if(_loc1_.dodge == EVASION_EVADE)
         {
            outputText("并且你预判了接下来的长矛攻击，凭借你惊人的闪避能力躲开了她的攻击！");
            return;
         }
         if(_loc1_.dodge == EVASION_FLEXIBILITY)
         {
            outputText("并且你利用你惊人的柔韧性勉强折叠身体，躲开了她的攻击！");
            return;
         }
         if(_loc1_.dodge == EVASION_MISDIRECTION)
         {
            outputText("并且你使用了从拉斐尔那里学来的技巧，侧步完全躲开了她的一连串攻击！");
            return;
         }
         if(_loc1_.dodge == EVASION_BLIND)
         {
            outputText("并退后一步，看着女武神盲目的攻击只打中了空气。");
            return;
         }
         if(_loc1_.dodge == EVASION_SPEED || _loc1_.dodge != null)
         {
            outputText("并且你成功躲开了她的一连串长矛攻击！");
            return;
         }
         if(Boolean(_loc1_.parry))
         {
            outputText("并且你成功格挡了她的一连串长矛攻击！");
            return;
         }
         outputText("但她紧接着又是一连串快速的长矛攻击，撕裂了你的" + (get_player().get_armor().get_name() == "nothing" ? "" : "[armorName]和下面的") + "血肉。");
         _loc2_ = 1 + Utils.rand(3);
         _loc3_ = 0;
         while(_loc2_ > 0)
         {
            _loc3_ += int(get_str() + Utils.rand(50));
            _loc3_ = get_player().reduceDamage(_loc3_,this);
            _loc2_--;
         }
         get_player().takeDamage(_loc3_,true);
      }
      
      public function shieldBash() : void
      {
         var _loc2_:int = 0;
         outputText("女武神用她的长矛向你佯攻；你躲过了这一击，");
         var _loc1_:* = combatAvoidDamage(new AvoidDamageParameters(true,false,false,null,null,null,null,null));
         if(_loc1_.dodge == EVASION_EVADE)
         {
            outputText("并且你预判了接下来的盾击，凭借你惊人的闪避能力躲开了她！");
            return;
         }
         if(_loc1_.dodge == EVASION_FLEXIBILITY)
         {
            outputText("你利用惊人的柔韧性勉强折叠身体，避开了她的盾击！");
            return;
         }
         if(_loc1_.dodge == EVASION_MISDIRECTION)
         {
            outputText("你运用拉斐尔的技巧侧步闪避，躲开了她的盾击！");
            return;
         }
         if(_loc1_.dodge == EVASION_BLIND)
         {
            outputText("你向后退去，看着女武神盲目的盾击只打中了空气。");
            return;
         }
         if(_loc1_.dodge == EVASION_SPEED || _loc1_.dodge != null)
         {
            outputText("你成功躲开了她的盾击！");
            return;
         }
         outputText("但你露出了破绽，她转过身来，用沉重的盾牌猛击你，将你击退");
         if(get_player().stun(0,33))
         {
            outputText("失去平衡。");
         }
         else
         {
            outputText("向后。");
         }
         _loc2_ = int(get_str() + 50 + Utils.rand(50));
         _loc2_ = get_player().reduceDamage(_loc2_,this);
         get_player().takeDamage(_loc2_,true);
      }
      
      override public function performCombatAction() : void
      {
         var _loc1_:MonsterAI = new MonsterAI().add(eAttack,1,true,0,FATIGUE_NONE,CombatRange.Ranged);
         _loc1_.add(shieldBash,1,true,10,FATIGUE_PHYSICAL,CombatRange.Ranged);
         _loc1_.add(aerialRave,1,true,10,FATIGUE_PHYSICAL,CombatRange.Ranged);
         _loc1_.add(spearAttack,1,true,10,FATIGUE_PHYSICAL,CombatRange.Ranged);
         _loc1_.exec();
      }
      
      override public function defeated(param1:Boolean) : void
      {
         get_game().glacialRift.valkyrieScene.winAgainstValkyrie(param1);
      }
      
      public function aerialRave() : void
      {
         var _loc2_:int = 0;
         if(Utils.rand(2) == 0 || get_player().canFly())
         {
            spearAttack();
            return;
         }
         outputText("女武神径直向你冲来！你设法躲开了她的长矛突刺，但她优雅地旋转身体，一把抓住了你的腰。");
         var _loc1_:* = combatAvoidDamage(new AvoidDamageParameters(true,false,false,null,null,null,null,null));
         if(_loc1_.dodge == EVASION_EVADE)
         {
            outputText("多亏了你的闪避能力，你设法甩开了她的手。");
            return;
         }
         if(_loc1_.dodge == EVASION_FLEXIBILITY)
         {
            outputText("多亏了你惊人的柔韧性，她的手从你的手腕上滑落。");
            return;
         }
         if(_loc1_.dodge == EVASION_MISDIRECTION)
         {
            outputText("运用拉斐尔的技巧，你轻松地从她的抓握中挣脱。");
            return;
         }
         if(_loc1_.dodge == EVASION_SPEED || _loc1_.dodge != null)
         {
            outputText("你突然猛地抽回手臂，挣脱了她的抓握。");
            return;
         }
         outputText("在你反应过来之前，她腾空而起，用强壮的翅膀带着你们俩飞向高空。你拼命挣扎，但无济于事——直到她松开手。你惊恐地尖叫着坠回地面，痛苦地砸进了一个恰到好处的雪堆里，而你的对手则优雅地降落在几英尺外。");
         _loc2_ = int(get_str() + 200 + Utils.rand(100));
         _loc2_ = get_player().reduceDamage(_loc2_,this);
         get_player().takeDamage(_loc2_,true);
      }
   }
}

