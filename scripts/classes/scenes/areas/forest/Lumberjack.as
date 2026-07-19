package classes.scenes.areas.forest
{
   import classes.CoC;
   import classes.CockTypesEnum;
   import classes.Monster;
   import classes.Player;
   import classes.StatusEffects;
   import classes.internals.MonsterAI;
   import classes.internals.Utils;
   import classes.internals.WeightedChoice;
   import classes.scenes.combat.CombatAttackBuilder;
   import classes.scenes.combat.CombatRange;
   import flash.Boot;
   
   public class Lumberjack extends Monster
   {
      
      public function Lumberjack()
      {
         if(Boot.skip_constructor)
         {
            return;
         }
         super();
         set_a("");
         set_short("incubus woodsman");
         imageName = "incubuswoodsman";
         set_long("这个体格魁梧的棕红色男魅魔身高[if (metric) {超过两米|将近七英尺}]，简直像座小山。他短短的棕色头发被长而邪恶的角分开，他有着同样深棕色的眼睛。他留着适度的胡须，更增添了他的男子气概。从他粗糙的衣服里伸出了一对巨大的恶魔翅膀，再往下，是一条长长的、箭头状的尾巴。" + (get_game().forest.lumberjackScene.saveContent.aggressive ? "他手里拿着劈柴斧，准备从劈柴转为劈肉" : "他手里拿着一把看起来很凶猛的伐木斧，设计用来砍树。你怀疑他用它砍人也不会有任何困难。"));
         set_race("Demon");
         createCock(12,1.75,CockTypesEnum.DEMON);
         balls = 2;
         ballSize = 2;
         cumMultiplier = 3;
         createBreastRow(0);
         ass.analLooseness = 1;
         ass.analWetness = 1;
         set_tallness(82);
         hips.rating = 6;
         butt.rating = 2;
         lowerBody.type = 6;
         skin.tone = "brownish-red";
         hair.color = "brown";
         hair.length = 3;
         initStrTouSpeInte(40,40,25,35);
         initLibSensCor(80,70,100);
         if(get_game().forest.lumberjackScene.saveContent.aggressive)
         {
            set_weaponName("axe");
            set_weaponAttack(3);
         }
         else
         {
            set_weaponName("felling axe");
            set_weaponAttack(11);
            createStatusEffect(StatusEffects.GenericRunDisabled,0,0,0,0);
         }
         set_weaponVerb("chop");
         set_armorName("rugged clothes");
         set_armorDef(0);
         bonusHP = 100;
         set_lust(50);
         lustVuln = 0.5;
         temperment = 3;
         level = 6;
         set_drop(new WeightedChoice());
         set_gems(Utils.rand(25) + 10);
         additionalXP = 50;
         tail.type = 3;
         wings.type = 13;
         checkMonster();
      }
      
      override public function won(param1:Boolean, param2:Boolean = false) : void
      {
         get_game().forest.lumberjackScene.won();
      }
      
      override public function performCombatAction() : void
      {
         var _loc1_:MonsterAI = new MonsterAI();
         _loc1_.add(chop,1,true,0,FATIGUE_NONE,CombatRange.Melee);
         _loc1_.add(arouse,get_player().LustRatio() + 0.25,true,10,FATIGUE_MAGICAL,CombatRange.Tease);
         _loc1_.exec();
      }
      
      override public function defeated(param1:Boolean) : void
      {
         get_game().forest.lumberjackScene.defeated(param1);
      }
      
      public function chop() : void
      {
         var _loc1_:int = Utils.rand(2);
         var _loc2_:CombatAttackBuilder = new CombatAttackBuilder().canBlock().canDodge();
         outputText(["一个巨大的弧线预示着毁灭性的一击，","他挥舞着斧头，"][_loc1_]);
         _loc2_.setCustomAvoid(["谢天谢地，因为挥舞的幅度太大而没有打中。","尽管空间狭小，但还是打偏了。"][_loc1_]);
         _loc2_.setCustomBlock(["不过谢天谢地，你没有受到任何伤害。","但没能穿透你的防御。"][_loc1_]);
         if(_loc2_.executeAttack().isSuccessfulHit())
         {
            outputText(["将他的[monster.weapon]的刀刃猛地砍进你的[armor]！","残忍地砍向你。"][_loc1_]);
            get_player().takeDamage(get_player().reduceDamage(get_str() + get_weaponAttack() + Utils.rand(6),this),true);
         }
      }
      
      public function arouse() : void
      {
         outputText("在他的左手中，不祥的阴影预示着一个法术正在编织。你能感觉到腹股沟的热量正在积聚。");
         get_player().takeLustDamage(10 + Utils.rand(6));
      }
   }
}

