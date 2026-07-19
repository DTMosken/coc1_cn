package classes.scenes.npcs
{
   import classes.Appearance;
   import classes.CoC;
   import classes.CockTypesEnum;
   import classes.Monster;
   import classes.Player;
   import classes.ReactionContext;
   import classes.StatusEffect;
   import classes.StatusEffects;
   import classes.internals.MonsterAI;
   import classes.internals.Utils;
   import classes.internals.WeightedChoice;
   import classes.items.ConsumableLib;
   import classes.scenes.combat.CombatAttackBuilder;
   import classes.scenes.combat.CombatRange;
   import classes.statusEffects.combat.AnemoneVenomDebuff;
   import flash.Boot;
   
   public class Anemone extends Monster
   {
      
      public function Anemone()
      {
         if(Boot.skip_constructor)
         {
            return;
         }
         super();
         set_a("");
         set_short("anemone");
         imageName = "anemone";
         set_long("这只海葵是一个蓝色的双性人，中等身高，身材苗条，头上长着五颜六色的触手，代替了头发。她女性化的脸上长着两只纯色的眼睛，比她的皮肤颜色浅。两片羽毛状的鳃从她胸部中间长出，沿着脊柱线，在锁骨下方，垂在她那对小巧的B罩杯乳房上。虽然你不会用丰满来形容她的曲线，但她来回摇摆着少女般的臀部，与她纤细的腰肢形成了迷人的对比。从她腹股沟突出的是一根蓝色的肉棒，龟头周围长着微小的触手，在它下面是一个深蓝色的阴部，周围环绕着小触须。再往下是一双腿，末端是扁平粘稠的脚；这是她水生血统的证明。她从深邃的眼睛里看着你，露出灿烂而天真的笑容。");
         set_race("Anemone");
         createCock(7,1,CockTypesEnum.ANEMONE);
         createVagina(false,3,2);
         createStatusEffect(StatusEffects.BonusVCapacity,5,0,0,0);
         createBreastRow(Appearance.breastCupInverse("B"));
         ass.analLooseness = 2;
         ass.analWetness = 0;
         createStatusEffect(StatusEffects.BonusACapacity,10,0,0,0);
         set_tallness(65);
         hips.rating = 10;
         butt.rating = 6;
         skin.tone = "purple";
         hair.color = "purplish-black";
         hair.length = 20;
         hair.type = 4;
         initStrTouSpeInte(40,20,40,50);
         initLibSensCor(55,35,50);
         set_weaponName("tendrils");
         set_weaponVerb("tentacle");
         set_weaponAttack(5);
         normalAttackAvoid.doParry = false;
         normalAttackAvoid.doCounter = false;
         set_armorName("clammy skin");
         bonusHP = 120;
         set_lust(30);
         lustVuln = 0.9;
         temperment = 2;
         level = 4;
         set_gems(Utils.rand(5) + 1);
         set_drop(new WeightedChoice(get_consumables().DRYTENT,1));
         checkMonster();
      }
      
      override public function won(param1:Boolean, param2:Boolean = false) : void
      {
         if(param2)
         {
            outputText("[pg]你的敌人似乎一点也不介意……");
            doNext(get_game().combat.endLustLoss);
         }
         else
         {
            get_game().anemoneScene.loseToAnemone();
         }
      }
      
      override public function runSuccess() : void
      {
         outputText("你整理了一下思绪，对这个奇怪的女孩皱了皱眉，转身[if (isSwimming) {游向|走向}]海滩。向内陆走了二十步后，你回头再次看着她。海葵显然对你的离去感到沮丧，她沉入水面下时，重重地撅起了嘴。");
         get_game().combat.doRunAway();
      }
      
      override public function runFail() : void
      {
         outputText("你试图摆脱迷雾并[if (isSwimming) {逃跑|奔跑}]，但海葵溜到你身边，她的触手缠绕在你的腰上。[say: 留下来？]她问道，将她的小乳房压向你，同时一根触手滑入你的[armor]并向下伸向你的下体。摩擦和刺痛的毒液带来的双重刺激让你[if (!singleleg) {的膝盖}]发软，削弱了你的决心，结束了你的逃跑尝试。");
         applyVenom(4 + get_player().sens / 20);
         get_game().combat.startMonsterTurn();
      }
      
      override public function runCheck() : void
      {
         if(get_player().get_lust100() < 60)
         {
            runSuccess();
         }
         else
         {
            super.runCheck();
         }
      }
      
      override public function react(param1:ReactionContext) : Boolean
      {
         switch(param1.index)
         {
            case 1:
               if(!get_game().combat.isWieldingRangedWeapon() && get_player().statusEffectv1(StatusEffects.CounterAB) != 1)
               {
                  if(Utils.rand(10) <= 2)
                  {
                     outputText("看到你举起[weapon]，海葵低头看着水面，眼睛向上斜视着你，并撅起颤抖的嘴唇。");
                     if(get_player().cor < 75)
                     {
                        outputText("你盯着她那可怜巴巴的表情，失去了你为攻击而聚集的大部分杀气，在离她还有几英尺的地方停了下来。[pg]");
                        get_game().combat.damage = 0;
                        if(get_HP() > 0 && get_lust() < maxLust())
                        {
                           if(get_player().hasStatusEffect(StatusEffects.FirstAttack))
                           {
                              get_game().combat.attack();
                              return false;
                           }
                        }
                        return false;
                     }
                     outputText("虽然你因为她的表现而失去了一些动力，但对支配的渴望仍然驱使你完成你的挥击。");
                  }
               }
               break;
            case 2:
               if(get_game().combat.damage > 0 && !get_game().combat.isWieldingRangedWeapon())
               {
                  outputText("\n虽然你成功击中了海葵，但当你的挥击擦过她身体周围的几根触手时，它们释放出了毒液。");
                  applyVenom(1 + Utils.rand(2));
               }
         }
         return true;
      }
      
      override public function performCombatAction() : void
      {
         var _loc1_:MonsterAI = new MonsterAI();
         _loc1_.add(eAttack,1,true,0,FATIGUE_NONE,CombatRange.FlyingMelee);
         _loc1_.exec();
      }
      
      override public function eAttack() : void
      {
         var _loc1_:CombatAttackBuilder = new CombatAttackBuilder().canBlock().canDodge().canCounter().canParry();
         outputText("海葵调皮地咯咯笑着，向你发射了几根触手。大多数都瞄准了你的胯部，但也有几根试图抚摸你的胸部和脸颊。\n");
         if(_loc1_.executeAttack().isSuccessfulHit())
         {
            outputText("你勇敢地闪躲腾挪，但触手数量太多，而且来自四面八方。有几根突破了你的防守，抚摸着你的皮肤，留下一种刺痛、温暖的感觉，进一步唤起了你的欲望。");
            get_player().takeDamage(1,true);
            applyVenom(Utils.rand(4 + get_player().sens / 20) + 1);
         }
      }
      
      override public function defeated(param1:Boolean) : void
      {
         get_game().anemoneScene.defeatAnemone();
      }
      
      public function applyVenom(param1:Number = 1) : void
      {
         var _loc2_:AnemoneVenomDebuff = get_player().createOrFindStatusEffect(StatusEffects.AnemoneVenom);
         _loc2_.applyEffect(param1);
      }
   }
}

