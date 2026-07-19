package classes.scenes.areas.forest
{
   import classes.CoC;
   import classes.Creature;
   import classes.ItemType;
   import classes.Monster;
   import classes.Output;
   import classes.Player;
   import classes.ReactionContext;
   import classes.StatusEffects;
   import classes._FlagDict.FlagDict_Impl_;
   import classes.internals.MonsterAI;
   import classes.internals.Utils;
   import classes.internals.WeightedChoice;
   import classes.items.ConsumableLib;
   import classes.scenes.combat.AvoidDamageParameters;
   import classes.scenes.combat.Combat;
   import classes.scenes.combat.CombatDistance;
   import classes.scenes.combat.CombatRange;
   import flash.Boot;
   import haxe.IMap;
   
   public class TentacleBeast extends Monster
   {
      
      public function TentacleBeast()
      {
         if(Boot.skip_constructor)
         {
            return;
         }
         super();
         set_a("");
         set_short("tentacle beast");
         imageName = "tentaclebeast";
         set_long("你看到面前那庞大、蹒跚的触手怪。它看起来像一株巨大的灌木，挪动着球状的身躯，露出一堆长满刺的卷须和类似头足类动物的肢体。");
         set_race("Abomination");
         createCock(40,1.5);
         createCock(60,1.5);
         createCock(50,1.5);
         createCock(20,1.5);
         balls = 0;
         ballSize = 0;
         cumMultiplier = 3;
         pronoun1 = "它";
         pronoun2 = "它";
         pronoun3 = "它的";
         createBreastRow(0,0);
         ass.analLooseness = 1;
         ass.analWetness = 5;
         set_tallness(Utils.rand(9) + 70);
         hips.rating = 0;
         butt.rating = 0;
         skin.tone = "green";
         skin.type = 0;
         skin.desc = "bark";
         hair.color = "green";
         hair.length = 1;
         initStrTouSpeInte(58,25,35,45);
         initLibSensCor(90,20,100);
         set_weaponName("whip-tendril");
         set_weaponVerb("thorny tendril");
         set_weaponAttack(1);
         normalAttackAvoid.doParry = false;
         normalAttackAvoid.doCounter = false;
         set_armorName("rubbery skin");
         set_armorDef(1);
         bonusHP = 250;
         set_lust(10);
         lustVuln = 0.8;
         set_fireRes(1.2);
         temperment = 3;
         level = 6;
         set_gems(Utils.rand(15) + 5);
         set_drop(new WeightedChoice(get_consumables().P_SEED,1).add(null,2));
         tail.type = 3;
         checkMonster();
      }
      
      override public function won(param1:Boolean, param2:Boolean = false) : void
      {
         if(param1)
         {
            outputText("由于伤势过重，你转身试图做最后一次绝望的逃跑……[pg]");
            get_game().forest.tentacleBeastScene.tentacleLossRape();
         }
         else
         {
            outputText("你放弃了战斗，强烈的欲望让你无法再抵抗。你耸了耸肩，走进了那团蠕动的触手中……[pg]");
            doNext(get_game().forest.tentacleBeastScene.tentacleLossRape);
         }
      }
      
      public function tentaclePhysicalAttack() : void
      {
         outputText("这个蹒跚的怪物带着致命的力量向你挥舞着触手。\n");
         var _loc1_:int = get_player().reduceDamage(get_str() + get_weaponAttack(),this);
         if(_loc1_ < 0)
         {
            _loc1_ = 0;
         }
         if(_loc1_ == 0 || combatAvoidDamage(new AvoidDamageParameters(true,false,false,null,null,null,null,null)).dodge != null)
         {
            outputText("然而，你迅速躲开了这个怪物笨拙的攻击。");
         }
         else
         {
            outputText("触手无情地砸在你的身上。");
            get_player().takeDamage(_loc1_,true);
         }
      }
      
      public function tentacleEntwine() : void
      {
         var _loc1_:int = 0;
         outputText("怪物从四面八方向你猛扑过来，试图将你固定住。\n");
         if(!get_player().hasStatusEffect(StatusEffects.TentacleBind))
         {
            if(combatAvoidDamage(new AvoidDamageParameters(true,false,false,null,null,null,null,null)).dodge != null)
            {
               outputText("你展示了令人印象深刻的体操技巧，闪避、下蹲、下潜、俯冲，并翻滚着躲开了试图抓住你的手臂雨。你的直觉告诉你，这是一件好事。\n");
            }
            else
            {
               outputText("当你试图躲避伪足的猛攻时，其中一条抓住了你的[foot]，将你拖倒在地。你试图伸手去拉开它，却被所有其他的触手抓住了身体的各个部位，将你固定在半空中。你被困住了，无能为力！[pg]");
               if(get_player().hasCock())
               {
                  outputText("怪物将你固定住后，用一根长长的触须缠绕在你的阴茎上。当怪物开始像奶牛场的女仆一样抚摸你的肉棒，试图引起你的反应时，你颤抖了。无法抗拒，你的[cock]轻易地勃起了，向怪物发出信号，表明你对更强烈的刺激有反应。");
               }
               else if(get_player().hasVagina())
               {
                  outputText("怪物迅速将一根带有一个吸盘的长触手放在你的阴蒂上。你感觉到吸盘的吸力，你的身体迅速变热。你的阴蒂充血，促使怪物将吸盘吸附在你的[clit]上。");
               }
               else
               {
                  outputText("怪物迅速将一根长触手抵在你的[asshole]上。它用缓慢而精致的抚摸在你的后庭周围打圈，给你的身体带来了意想不到的温暖。");
               }
               _loc1_ = int(8 + get_player().sens / 20);
               get_player().takeLustDamage(_loc1_,true);
               get_player().createStatusEffect(StatusEffects.TentacleBind,0,0,0,0);
            }
         }
      }
      
      override public function struggle() : void
      {
         if(get_player().hasStatusEffect(StatusEffects.TentacleBind))
         {
            clearOutput();
            outputText("你拼尽全力挣扎，试图在怪物满足它对你那邪恶的欲望之前，从触手中挣脱出来。\n");
            if(Utils.rand(3) == 0 || Utils.rand(80) < get_player().get_str() / 2)
            {
               outputText("当怪物试图调整它抓着你的姿势时，你挣脱了一条[legs]，并踢中了怪物的喙，导致它发出一声非人的惨叫，将你重重地摔在地上。[pg]");
               get_player().removeStatusEffect(StatusEffects.TentacleBind);
               createStatusEffect(StatusEffects.TentacleCoolDown,3,0,0,0);
            }
            else
            {
               outputText("尽管你试图逃跑，但怪物只是收紧了它的抓握，让你难以呼吸。");
               get_game().combat.takeDamage(5);
               if(int(get_player().cocks.length) > 0)
               {
                  outputText("[pg]怪物继续在你的肉棒上盘旋，让你的身体上下颤抖。你必须逃跑，否则这只怪物会让你彻底沦陷！");
               }
               else if(get_player().hasVagina())
               {
                  outputText("[pg]怪物继续吸吮着你的阴蒂，现在又在你的乳头上吸附了两个吸盘，放大了你不断增长的欲望。你必须逃跑，否则你将成为这个东西的玩物！");
               }
               else
               {
                  outputText("[pg]怪物继续试探着你的屁眼，现在又在你的乳头上吸附了 " + Utils.num2Text(get_player().totalNipples()) + " 个吸盘，放大了你不断增长的欲望。你必须逃跑，否则你将成为这个东西的玩物！");
               }
               get_player().takeLustDamage(3 + get_player().sens / 10 + get_player().lib / 20,true);
               tookAction = true;
            }
         }
      }
      
      override public function shouldMove(param1:CombatDistance, param2:Boolean = false) : Boolean
      {
         return false;
      }
      
      override public function react(param1:ReactionContext) : Boolean
      {
         if(param1.index == 3)
         {
            if(get_player().hasStatusEffect(StatusEffects.TentacleBind))
            {
               clearOutput();
               if(int(get_player().cocks.length) > 0)
               {
                  outputText("这生物继续在你的肉棒上盘旋，让你全身一阵阵发抖。你必须逃跑，否则这生物会让你无法招架！");
               }
               else if(get_player().hasVagina())
               {
                  outputText("这生物继续吸吮你的阴蒂，现在又用两个吸盘吸住了你的乳头，放大了你不断增长的欲望。你必须逃跑，否则你会成为这东西的玩物！");
               }
               else
               {
                  outputText("这生物继续在你的屁眼处探索，现在又用" + Utils.num2Text(get_player().totalNipples()) + "个吸盘吸住了你的乳头，放大了你不断增长的欲望。你必须逃跑，否则你会成为这东西的玩物！");
               }
               get_player().takeLustDamage(8 + get_player().sens / 10,true);
               tookAction = true;
               return false;
            }
         }
         return true;
      }
      
      override public function performCombatAction() : void
      {
         var _loc1_:MonsterAI = new MonsterAI().add(tentaclePhysicalAttack,2,true,0,FATIGUE_NONE,CombatRange.Ranged);
         _loc1_.add(tentacleEntwine,1,!hasStatusEffect(StatusEffects.TentacleCoolDown),15,FATIGUE_PHYSICAL,CombatRange.Ranged);
         _loc1_.exec();
      }
      
      override public function defeated(param1:Boolean) : void
      {
         var _g:Combat;
         var _loc2_:* = null as IMap;
         var _loc3_:* = null as Output;
         var _loc4_:* = null as TentacleBeastScene;
         clearOutput();
         if(param1)
         {
            outputText("怪物发出一声刺耳的尖叫，然后瘫倒在地。随着生命的流逝，它的绿色迅速褪成棕色，留下你作为胜利者。");
            get_game().awardAchievement("触手怪杀手",144,true,true);
            _loc2_ = get_flags();
            FlagDict_Impl_.arrayWriteInt(_loc2_,2374,FlagDict_Impl_.arrayReadInt(_loc2_,2374) + 1);
         }
         else
         {
            outputText("触手怪的身体开始颤抖和叹息，触手相互缠绕，狂热地互相抚摸。看来这只野兽已经放弃了战斗。");
         }
         if(!param1 && get_player().get_gender() > 0)
         {
            outputText("也许你可以用它来满足自己？");
            _loc3_ = get_game().output;
            _loc4_ = get_game().forest.tentacleBeastScene;
            _g = get_game().combat;
            _loc3_.doYesNo(_loc4_.tentacleVictoryRape,function():void
            {
               _g.cleanupAfterCombat();
            });
         }
         else
         {
            get_game().combat.cleanupAfterCombat();
         }
      }
   }
}

