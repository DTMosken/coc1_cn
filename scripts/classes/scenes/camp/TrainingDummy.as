package classes.scenes.camp
{
   import classes.Appearance;
   import classes.CoC;
   import classes.Monster;
   import classes.PerkLib;
   import classes.ReactionContext;
   import classes.StatusEffects;
   import classes.internals.MonsterAI;
   import classes.internals.Utils;
   import classes.internals.WeightedChoice;
   import classes.scenes.combat.CombatRange;
   import flash.Boot;
   
   public class TrainingDummy extends Monster
   {
      
      public var dummyGender:int;
      
      public function TrainingDummy()
      {
         if(Boot.skip_constructor)
         {
            return;
         }
         dummyGender = 0;
         super();
         dummyGender = get_game().camp.saveContent.dummyGender;
         set_a("");
         set_short(get_game().camp.saveContent.dummyName);
         set_long("[dummyname]是一个用木头和钉子做成的简单训练假人，是你为了找个练习对象而自己建造的。" + (dummyGender == 0 ? "它是一个普通的假人，" : (dummyGender == 2 ? "你选择给它装上一对漂亮的乳房，尽管它们呈金字塔形且棱角分明。它" : (dummyGender == 1 ? "你选择在它的胯部装上一个假阳具，让这个假人看起来像是处于永久勃起状态。它" : "除了躯干上突出的那对棱角分明的金字塔形乳房外，你还在它下面装了一个假阳具，让它看起来像个双性人。它"))) + "大致呈人形，用木棍做手臂，末端是一对旧煎锅，胸部、肩部和头部都有一些木板，你还在头部雕刻了一张粗糙的脸。尽管它看起来破破烂烂，但非常坚固，能够承受大多数攻击和法术，希望能让你用上一段好长的时间。[pg]作为一个假人，它自然不会还击，也不会试图躲避你的攻击。");
         set_race("wood");
         createBreastRow(dummyGender >= 2 ? Appearance.breastCupInverse("D") : 0);
         if(int(dummyGender % 2) == 1)
         {
            createCock();
         }
         ass.analLooseness = 0;
         ass.analWetness = 0;
         set_tallness(64);
         hips.rating = 0;
         butt.rating = 0;
         set_initedGenitals(true);
         pronoun1 = "它";
         pronoun2 = "它";
         pronoun3 = "它的";
         skin.tone = "wood";
         hair.length = 0;
         initStrTouSpeInte(0,0,0,1);
         initLibSensCor(0,0,0);
         set_weaponName("rusty frying pans");
         set_weaponVerb("smack");
         set_weaponAttack(0);
         set_armorName("a few planks of wood");
         set_armorDef(0);
         bonusHP = 98449;
         temperment = 2;
         level = 100;
         set_gems(0);
         set_drop(new WeightedChoice());
         createPerk(PerkLib.Immovable);
         createStatusEffect(StatusEffects.NoLoot);
         checkMonster();
      }
      
      override public function won(param1:Boolean, param2:Boolean = false) : void
      {
         get_game().camp.trainingDummyScene.dummyWon(param1);
      }
      
      override public function runCheck() : void
      {
         outputText("你从[dummyname]身边退开，觉得现在已经练够了，然后走回了你的营地。");
         get_game().combat.doRunAway();
      }
      
      override public function react(param1:ReactionContext) : Boolean
      {
         if(param1.index == 9)
         {
            if(get_lust() < maxLust())
            {
               set_lust(0);
            }
            if(get_HP() > 0)
            {
               set_HP(maxHP());
            }
         }
         return true;
      }
      
      override public function performCombatAction() : void
      {
         var _loc1_:MonsterAI = new MonsterAI();
         _loc1_.add(dummyWait,1,true,0,FATIGUE_NONE,CombatRange.Self);
         _loc1_.exec();
      }
      
      override public function outputDefaultTeaseReaction(param1:Number) : void
      {
         outputText("[pg]");
         switch(Utils.rand(10))
         {
            case 0:
               outputText("面对你的性挑逗，[Dummyname]的木制面容保持不变。");
               break;
            case 1:
               outputText("你的魅力似乎对死木头没有任何效果。");
               break;
            case 2:
               outputText("当你试图勾引这个无生命的假人时，你开始怀疑自己的理智。");
               break;
            case 3:
               outputText("你想知道这样做到底有没有意义。");
               break;
            case 4:
               outputText("[Dummyname]对你的色情表演毫无反应。");
               break;
            case 5:
               outputText("[Dummyname]似乎无动于衷。");
               break;
            case 6:
               outputText("[Dummyname]保持静止。就好像它没有生命一样。");
               break;
            case 7:
               outputText("虽然[dummyname]是木头做的，但它[i:has]没有木头（勃起）。" + (int(dummyGender % 2) == 1 ? " 好吧，差不多，但这不算。" : ""));
               break;
            case 8:
               outputText(int(dummyGender % 2) == 1 ? "[dummyname]之所以硬邦邦的，唯一的原因是它别无选择。" : "[dummyname]身上唯一硬邦邦的东西就是它的主干。");
               break;
            case 9:
               outputText("你的假人见到你并不高兴。它无法表现出高兴。或者任何情绪，真的。");
         }
         tookAction = true;
      }
      
      public function dummyWait() : void
      {
         switch(Utils.rand(16))
         {
            case 0:
               outputText("假人站得很稳。");
               break;
            case 1:
               outputText("训练假人毫无反应。");
               break;
            case 2:
               outputText("假人享受着微风。");
               break;
            case 3:
               outputText("[Dummyname]看着你，它那不变的、手工雕刻的脸似乎在嘲笑你。");
               break;
            case 4:
               outputText("[Dummyname]什么也没做。它只是个假人。");
               break;
            case 5:
               outputText("假人依然无动于衷。");
               break;
            case 6:
               outputText("木头发出轻微的嘎吱声。");
               break;
            case 7:
               outputText("[Dummyname]以木头般的冷漠注视着你。");
               break;
            case 8:
               outputText("训练假人一动不动。");
               break;
            case 9:
               outputText("假人的姿势没有任何改变。");
               break;
            case 10:
               outputText("[Dummyname]无法移动。也许因为它是个木制假人。");
               break;
            case 11:
               outputText("木头纹丝不动。");
               break;
            case 12:
               outputText("假人什么也没做。");
               break;
            case 13:
               outputText("[Dummyname]似乎毫无知觉。");
               break;
            case 14:
               outputText("训练假人依然像木头一样僵硬。");
               break;
            case 15:
               outputText("假人笔直地站着，漠不关心。");
         }
      }
      
      override public function defeated(param1:Boolean) : void
      {
         get_game().camp.trainingDummyScene.dummyLost();
      }
   }
}

