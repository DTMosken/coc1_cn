package classes.scenes.areas.glacialRift
{
   import classes.CoC;
   import classes.CockTypesEnum;
   import classes.Creature;
   import classes.Monster;
   import classes.Player;
   import classes.StatusEffects;
   import classes.internals.MonsterAI;
   import classes.internals.Utils;
   import classes.internals.WeightedChoice;
   import classes.items.ConsumableLib;
   import classes.scenes.combat.AvoidDamageParameters;
   import classes.scenes.combat.CombatRange;
   import flash.Boot;
   
   public class Amarok extends Monster
   {
      
      public function Amarok()
      {
         if(Boot.skip_constructor)
         {
            return;
         }
         super();
         set_a("");
         set_short("amarok");
         imageName = "amarok";
         set_long("你正在与一只阿玛洛克战斗，这只巨大的狼似乎铁了心要猎杀你。狂风暴雪无法掩盖它厚实的黑色皮毛，甚至连吹乱它都很难做到。它那双金色的、充满饥饿感的眼睛注视着你的一举一动，锋利的牙齿足以咬碎骨头。它在身高和体型上都凌驾于你之上，肌肉线条分明，长长的腿和粗壮的爪子带着致命的利刃，更增添了它的威慑力。甚至它的尾巴看起来都能把你击倒。这是你在这里见过的最正常的动物类生物，尽管体型庞大，但它就是一只普通的狼，不过同样令人恐惧。你有一种感觉，这将是一场艰难的战斗，尤其是考虑到它不打算让你逃跑。");
         set_plural(false);
         createCock(8,1.5,CockTypesEnum.WOLF);
         balls = 2;
         ballSize = 2;
         pronoun1 = "它";
         pronoun2 = "它";
         pronoun3 = "它的";
         createBreastRow(2,1);
         createBreastRow(2,1);
         createBreastRow(2,1);
         createBreastRow(2,1);
         ass.analLooseness = 1;
         ass.analWetness = 0;
         set_tallness(96);
         hips.rating = 4;
         butt.rating = 4;
         lowerBody.type = 26;
         arms.set_type(6);
         skin.tone = "black";
         skin.setType(1);
         hair.color = "black";
         hair.length = 3;
         face.type = 24;
         ears.type = 18;
         eyes.type = 6;
         initStrTouSpeInte(90,110,75,85);
         initLibSensCor(0,10,10);
         set_weaponName("teeth");
         set_weaponVerb("bite");
         set_weaponAttack(20);
         normalAttackAvoid.doParry = false;
         normalAttackAvoid.doCounter = false;
         set_armorName("thick fur");
         set_armorDef(15);
         bonusHP = 400;
         set_lust(5 + Utils.rand(33));
         lustVuln = 0.4;
         temperment = 0;
         level = 22;
         set_gems(40 + Utils.rand(25));
         set_drop(new WeightedChoice(get_consumables().WOLF_PP,1));
         tail.type = 26;
         if(!get_player().canFly())
         {
            createStatusEffect(StatusEffects.GenericRunDisabled,0,0,0,0);
         }
         checkMonster();
      }
      
      override public function won(param1:Boolean, param2:Boolean = false) : void
      {
         if(param2)
         {
            outputText("[pg]阿玛洛克低头看着你射出的蠕虫，闻了闻，然后咆哮着走开了。它一定认为你是被污染的肉。");
            doNext(get_game().combat.endLustLoss);
         }
         else if(get_lust() >= 33)
         {
            if(get_game().get_watersportsEnabled() && Utils.rand(2) == 0)
            {
               get_game().glacialRift.amarokScene.amarokFacefuck();
            }
            else if(get_player().isChild())
            {
               if(get_player().get_gender() == 1 || get_player().get_gender() == 3)
               {
                  get_game().glacialRift.amarokScene.amarokLustDefeatMaleHermChild();
               }
               if(get_player().get_gender() == 2)
               {
                  get_game().glacialRift.amarokScene.amarokLustDefeatFemaleChild();
               }
               if(get_player().get_gender() == 0)
               {
                  get_game().glacialRift.amarokScene.amarokChowTime();
               }
            }
            else if(get_player().get_gender() == 1 || get_player().get_gender() == 3)
            {
               get_game().glacialRift.amarokScene.amarokLustDefeatMaleAdult();
            }
            else if(get_player().get_gender() == 2)
            {
               get_game().glacialRift.amarokScene.amarokLustDefeatFemaleAdult();
            }
            else
            {
               get_game().glacialRift.amarokScene.amarokChowTime();
            }
         }
         else
         {
            get_game().glacialRift.amarokScene.amarokChowTime();
         }
      }
      
      override public function performCombatAction() : void
      {
         var _loc1_:MonsterAI = new MonsterAI().add(eAttack,1,true,0,FATIGUE_NONE,CombatRange.Melee);
         _loc1_.add(amarokClaw,6,true,0,FATIGUE_NONE,CombatRange.Melee);
         _loc1_.add(amarokTail,4,true,15,FATIGUE_PHYSICAL,CombatRange.Melee);
         _loc1_.exec();
      }
      
      override public function defeated(param1:Boolean) : void
      {
         get_game().glacialRift.amarokScene.winAgainstAmarok(param1);
      }
      
      public function amarokTail() : void
      {
         var _loc1_:int = 0;
         outputText("阿玛洛克冲到你面前，立刻转身，试图用尾巴撞击你。");
         if(Boolean(combatAvoidDamage(new AvoidDamageParameters(true,false,false,null,null,null,null,null)).attackFailed))
         {
            outputText("在它击中之前，你躲开了。");
         }
         else
         {
            outputText("这一击让你踉跄后退");
            if(get_player().stun(0,33))
            {
               outputText("，让你晕眩");
            }
            outputText("。");
            _loc1_ = int(get_str() + 100 + Utils.rand(75));
            _loc1_ = get_player().reduceDamage(_loc1_,this);
            get_player().takeDamage(_loc1_,true);
         }
      }
      
      public function amarokClaw() : void
      {
         var _loc1_:int = 0;
         if(hasStatusEffect(StatusEffects.Blind))
         {
            outputText("阿玛洛克向你扑来，试图用它的一只爪子抓伤你，但由于失明，完全没有击中。");
            return;
         }
         if(Boolean(combatAvoidDamage(new AvoidDamageParameters(true,false,false,null,null,null,null,null)).attackFailed))
         {
            outputText("阿玛洛克向你扑来，试图用它的爪子抓伤你。幸运的是，你成功地躲开了。");
            return;
         }
         outputText("阿玛洛克向你扑来，用它的一只粗壮的爪子在你身上抓了一下。它的爪子划破了你的皮肤，鲜血直流。");
         _loc1_ = int(get_str() + 50 + Utils.rand(100));
         _loc1_ = get_player().reduceDamage(_loc1_,this);
         get_player().takeDamage(_loc1_,true);
      }
   }
}

