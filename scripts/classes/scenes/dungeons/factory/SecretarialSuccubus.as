package classes.scenes.dungeons.factory
{
   import classes.Appearance;
   import classes.CoC;
   import classes.Player;
   import classes.StatusEffects;
   import classes.internals.MonsterAI;
   import classes.internals.Utils;
   import classes.internals.WeightedChoice;
   import classes.items.ConsumableLib;
   import classes.scenes.combat.CombatRange;
   import classes.scenes.dungeons.Factory;
   import classes.scenes.monsters.AbstractSuccubus;
   import coc.view.CoCButton;
   import flash.Boot;
   
   public class SecretarialSuccubus extends AbstractSuccubus
   {
      
      public var factory:Factory;
      
      public function SecretarialSuccubus()
      {
         if(Boot.skip_constructor)
         {
            return;
         }
         factory = new Factory();
         super();
         set_a("");
         set_short("secretarial succubus");
         imageName = "secretarialsuccubus";
         set_long("你对面的魅魔优雅地踩着细高跟鞋保持平衡，旋转着，动作变幻莫测。性感的黑色长袜紧贴着她完美身躯的每一道曲线，直到没入她那小巧的迷你裙中。尽管紧绷的马甲勉强包裹着，她那傲人的双乳在移动时依然令人愉悦地晃动着。在她那原本完美的脸庞和额头上，一对可爱的小角探了出来，周围环绕着光泽的金色长发。她周围的空气中弥漫着一种无法辨认的香味，让你感到一阵酥麻和战栗。");
         set_race("Demon");
         createVagina(false,5,1);
         createStatusEffect(StatusEffects.BonusVCapacity,30,0,0,0);
         createBreastRow(Appearance.breastCupInverse("DD"));
         ass.analLooseness = 4;
         ass.analWetness = 5;
         set_tallness(Utils.rand(9) + 60);
         hips.rating = 10;
         butt.rating = 9;
         lowerBody.type = 5;
         skin.tone = "blue";
         hair.color = "blond";
         hair.length = 13;
         initStrTouSpeInte(50,40,75,35);
         initLibSensCor(80,70,100);
         set_weaponName("claws");
         set_weaponVerb("slap");
         set_weaponAttack(10);
         set_weaponPerk([]);
         set_weaponValue(150);
         set_armorName("demonic skin");
         set_armorDef(4);
         bonusHP = 100;
         set_lust(30);
         temperment = 3;
         level = 7;
         set_gems(Utils.rand(25) + 10);
         additionalXP = 50;
         set_drop(new WeightedChoice(get_consumables().LACTAID,1));
         wings.type = 6;
         tail.type = 3;
         checkMonster();
      }
      
      override public function won(param1:Boolean, param2:Boolean = false) : void
      {
         if(param2)
         {
            outputText("[pg]你的敌人似乎并不在乎……");
            doNext(get_game().combat.endLustLoss);
         }
         else
         {
            doNext(factory.secretarialSuccubus.doLossSuccubus);
         }
      }
      
      override public function performCombatAction() : void
      {
         var _loc1_:MonsterAI = new MonsterAI();
         _loc1_.add(kissAttack,1,true,10,FATIGUE_NONE,CombatRange.Tease);
         _loc1_.add(seduceAttack,1,true,10,FATIGUE_PHYSICAL,CombatRange.Tease);
         _loc1_.add(whipAttack,1,true,10,FATIGUE_PHYSICAL,CombatRange.Ranged);
         _loc1_.add(eAttack,1,true,0,FATIGUE_NONE,CombatRange.Melee);
         _loc1_.exec();
      }
      
      override public function defeated(param1:Boolean) : void
      {
         clearOutput();
         if(param1)
         {
            outputText("你满意地微笑着，看着" + Utils.cnName(get_short()) + "倒下，无法继续战斗。现在正是品尝她那准备好交配的身体的完美时机……");
            outputText("[pg]你要强暴她吗？");
         }
         else
         {
            outputText("你满意地微笑着，看着" + Utils.cnName(get_short()) + "放弃了与你的战斗，开始自慰，乞求你操她。现在正是品尝她那准备好交配的身体的完美时机……");
            outputText("[pg]你要操她吗？");
         }
         get_player().takeLustDamage(1,true);
         get_game().output.menu();
         get_game().output.addButton(0,"是",factory.secretarialSuccubus.doRapeSuccubus).sexButton(-1,false);
         get_game().output.addButton(1,"否",factory.secretarialSuccubus.doLeaveSuccubus);
         if(get_player().hasKeyItem("Deluxe Dildo"))
         {
            get_game().output.addButton(2,"假阳具强暴",factory.secretarialSuccubus.dildoSuccubus);
         }
      }
   }
}

