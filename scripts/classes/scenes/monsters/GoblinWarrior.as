package classes.scenes.monsters
{
   import classes.Appearance;
   import classes.CoC;
   import classes.Creature;
   import classes.Player;
   import classes.StatusEffects;
   import classes.internals.MonsterAI;
   import classes.internals.Utils;
   import classes.internals.WeightedChoice;
   import classes.items.ConsumableLib;
   import classes.scenes.combat.AvoidDamageParameters;
   import classes.scenes.combat.CombatRange;
   import flash.Boot;
   
   public class GoblinWarrior extends Goblin
   {
      
      public function GoblinWarrior()
      {
         if(Boot.skip_constructor)
         {
            return;
         }
         super(true);
         set_a("");
         set_short("goblin warrior");
         imageName = "goblinwarrior";
         set_long("你面前的这只地精比大多数地精都要高一点，头发是深红色的。她有着墨绿色的皮肤，耳朵上打了好几个耳洞。与你见过的大多数地精不同，这只地精装备精良。她穿着一件覆盖躯干的金属胸甲，为她提供了更多的防御。她腿上绑着的皮带也比一般的地精多。她右手挥舞着一把短剑，左手拿着一面木盾。尽管她装备精良，但她的乳头和小穴却暴露在外。");
         set_race("Goblin");
         if(get_player().hasCock())
         {
            set_long(get_long() + " 她显然是想把你揍一顿，好强迫你让她怀孕。");
         }
         createVagina(false,4,1);
         createStatusEffect(StatusEffects.BonusVCapacity,40,0,0,0);
         createBreastRow(Appearance.breastCupInverse("E"));
         ass.analLooseness = 1;
         ass.analWetness = 0;
         createStatusEffect(StatusEffects.BonusACapacity,30,0,0,0);
         set_tallness(44 + Utils.rand(7));
         hips.rating = 8;
         butt.rating = 8;
         skin.tone = "dark green";
         hair.color = "red";
         hair.length = 4;
         initStrTouSpeInte(75,50,70,72);
         initLibSensCor(45,45,60);
         set_weaponName("sword and shield");
         set_weaponVerb("slash");
         set_weaponAttack(14);
         set_armorName("platemail");
         set_armorDef(30);
         bonusHP = 400;
         set_lust(50);
         set_shieldBlock(10);
         set_shieldName("小木盾");
         lustVuln = 0.44;
         temperment = 2;
         level = 16;
         set_gems(Utils.rand(15) + 15);
         set_drop(new WeightedChoice().add(get_consumables().GOB_ALE,5).addMany(1,get_consumables().L_DRAFT,get_consumables().PINKDYE,get_consumables().BLUEDYE,get_consumables().ORANGDY,get_consumables().GREEN_D,get_consumables().PURPDYE));
         checkMonster();
      }
      
      override public function won(param1:Boolean, param2:Boolean = false) : void
      {
         if(get_player().get_gender() == 0)
         {
            outputText("你倒在地精面前，伤得太重无法战斗。她咆哮着踢了你的头，让你眼冒金星。随着你的视线模糊，你听到她嘟囔着：[say:他妈的连根鸡巴或小穴都懒得长。]");
            get_game().combat.cleanupAfterCombat();
         }
         else
         {
            get_game().goblinWarriorScene.gobboWarriorBeatYaUp();
         }
      }
      
      public function warriorSpecial() : void
      {
         if(Utils.rand(2) == 0)
         {
            slash();
         }
         else
         {
            shieldBash();
         }
      }
      
      public function slash() : void
      {
         var _loc1_:int = 0;
         outputText("地精挥舞着剑向你冲来！她一靠近你，就挥出了剑！");
         if(Boolean(combatAvoidDamage(new AvoidDamageParameters(true,true,false,null,null,null,null,null)).attackFailed))
         {
            outputText("你躲开了她的斩击！");
         }
         else
         {
            outputText("你没能躲开，被击中了。");
            _loc1_ = int(get_str() + get_weaponAttack() + Utils.rand(40));
            _loc1_ = get_player().reduceDamage(_loc1_,this);
            get_player().takeDamage(_loc1_,true);
         }
      }
      
      public function shieldBash() : void
      {
         var _loc1_:int = 0;
         outputText("地精举着盾牌向你冲来！");
         if(Boolean(combatAvoidDamage(new AvoidDamageParameters(true,false,false,null,null,null,null,null)).attackFailed))
         {
            outputText("你躲开了她的盾击！");
         }
         else
         {
            outputText("她的盾牌击中了你！");
            if(get_player().stun(1,40))
            {
               outputText("盾牌的冲击力让你脑震荡了。<b>你被击晕了。</b>");
            }
            _loc1_ = int(get_str() + Utils.rand(10));
            _loc1_ = get_player().reduceDamage(_loc1_,this);
            get_player().takeDamage(_loc1_,true);
         }
      }
      
      override public function performCombatAction() : void
      {
         var _loc1_:MonsterAI = new MonsterAI();
         _loc1_.add(goblinDrugAttack,1,true,10,FATIGUE_PHYSICAL,CombatRange.Ranged);
         _loc1_.add(goblinTeaseAttack,1,true,0,FATIGUE_NONE,CombatRange.Tease);
         _loc1_.add(warriorSpecial,1,true,15,FATIGUE_PHYSICAL,CombatRange.ChargingMelee);
         _loc1_.add(eAttack,1,true,0,FATIGUE_NONE,CombatRange.Melee);
         _loc1_.exec();
      }
      
      override public function defeated(param1:Boolean) : void
      {
         get_game().goblinWarriorScene.goblinWarriorRapeIntro();
      }
   }
}

