package classes.scenes.quests.urtaQuest
{
   import classes.Appearance;
   import classes.CoC;
   import classes.StatusEffects;
   import classes.internals.MonsterAI;
   import classes.internals.Utils;
   import classes.internals.WeightedChoice;
   import classes.items.ConsumableLib;
   import classes.scenes.combat.CombatRange;
   import classes.scenes.monsters.Goblin;
   import flash.Boot;
   
   public class GoblinBroodmother extends Goblin
   {
      
      public function GoblinBroodmother()
      {
         if(Boot.skip_constructor)
         {
            return;
         }
         super(true);
         set_a("");
         set_short("goblin broodmother");
         imageName = "goblin";
         set_long("由于她们的腐化，几乎不可能通过外表来辨别地精的年龄，但很明显，这只地精绝不是那种寻找她最初十几个种马的发情小荡妇。站在你面前的是一个显而易见的资深繁育者，一个骄傲的母狗，毫无疑问，在不太远的地方，她有一个规模庞大的荡妇女儿部落。她大约三英尺半高，有着鲜艳的黄色皮肤——这对地精来说是一种罕见的颜色——以及一头狂野的、色彩鲜艳的霓虹粉和霓虹蓝相间的条纹头发，披散在她的背上，她长长的尖耳朵在头发中若隐若现。她的多次怀孕使她变得荒谬地丰满。I罩杯的乳房在她面前荒唐地晃动着，它们摇晃的面积如此之大，以至于她能摸到她那显眼的、像奶嘴一样的紫色乳头简直是个奇迹。育母的臀部从她的腰部向外扩张，使她每走一步都左右摇摆。一个极其圆润甜美的蜜桃臀，如果长在某人的胸前，大到足以成为DD罩杯的乳房，随着每一个动作诱人地摇晃着。淫荡的皮带努力想要束缚住她夸张的胸部和屁股，但与其说是为了保护她的端庄，不如说是为了装那些叮当作响的袋子和瓶子。她的嘴唇、鼻子、眉毛、耳朵、乳头和阴蒂上都钉着穿环，当她诱惑地向你舔嘴唇时，她那火红的眼睛里燃烧着欲火。\n\n你那背叛的马屌渴望埋入这个成熟、准备就绪的荡妇体内，但你必须坚强——你相当怀疑她是否会让你只操一次就走，即使你无法给她她渴望的婴儿……");
         set_race("Goblin");
         createVagina(false,4,1);
         createStatusEffect(StatusEffects.BonusVCapacity,40,0,0,0);
         createBreastRow(Appearance.breastCupInverse("E"));
         ass.analLooseness = 1;
         ass.analWetness = 0;
         createStatusEffect(StatusEffects.BonusACapacity,30,0,0,0);
         set_tallness(35 + Utils.rand(4));
         hips.rating = 8;
         butt.rating = 8;
         skin.tone = "dark green";
         hair.color = "purple";
         hair.length = 4;
         initStrTouSpeInte(50,30,35,100);
         initLibSensCor(70,20,70);
         set_weaponName("fists");
         set_weaponVerb("tiny punch");
         set_weaponAttack(20);
         set_armorName("leather straps");
         bonusHP = 300;
         set_lust(50);
         lustVuln = 0.5;
         temperment = 2;
         level = 10;
         set_gems(Utils.rand(5) + 5);
         set_drop(new WeightedChoice().add(get_consumables().GOB_ALE,5).addMany(1,get_consumables().L_DRAFT,get_consumables().PINKDYE,get_consumables().BLUEDYE,get_consumables().ORANGDY,get_consumables().PURPDYE));
         checkMonster();
      }
      
      override public function won(param1:Boolean, param2:Boolean = false) : void
      {
         get_game().urtaQuest.urtaLosesToGoblin();
      }
      
      override public function performCombatAction() : void
      {
         var _loc1_:MonsterAI = new MonsterAI();
         _loc1_.add(goblinDrugAttack,1,true,10,FATIGUE_PHYSICAL,CombatRange.Ranged);
         _loc1_.add(goblinTeaseAttack,1,true,0,FATIGUE_NONE,CombatRange.Tease);
         _loc1_.add(eAttack,1,true,0,FATIGUE_NONE,CombatRange.Melee);
         _loc1_.exec();
      }
      
      override public function defeated(param1:Boolean) : void
      {
         get_game().clearOutput();
         outputText("地精育母被打败了！你在她身上发现了一瓶魅魔乳。这东西在特尔阿德雷是违禁品——而且理由很充分，但它可能会派上用场。你暂时把这恶心的液体塞进了口袋。");
         outputText("在继续前进之前，你可以利用她来一场快速、自愿的性爱，以满足你的欲望。你要这么做吗？");
         get_game().output.menu();
         get_game().output.addButton(0,"操",get_game().urtaQuest.winFuckAGoblinBroodmotherAsUrta);
         get_game().output.addButton(14,"离开",get_game().urtaQuest.nagaPleaseNagaStoleMyDick);
      }
   }
}

