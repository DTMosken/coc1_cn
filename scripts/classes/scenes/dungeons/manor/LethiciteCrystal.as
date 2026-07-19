package classes.scenes.dungeons.manor
{
   import classes.Appearance;
   import classes.CoC;
   import classes.Monster;
   import classes.PerkLib;
   import classes.Player;
   import classes.StatusEffects;
   import classes.internals.Utils;
   import classes.internals.WeightedChoice;
   import classes.items.Weapon;
   import flash.Boot;
   
   public class LethiciteCrystal extends Monster
   {
      
      public function LethiciteCrystal(param1:Boolean = false)
      {
         if(Boot.skip_constructor)
         {
            return;
         }
         super();
         if(param1)
         {
            return;
         }
         set_a("");
         set_short("Lethicite Crystal");
         set_long("在你面前矗立着一座祭坛，上面装饰着一块巨大的莱希石水晶。它不断地脉动着，用性爱的念头冲刷着你。");
         set_initedGenitals(true);
         pronoun1 = "它";
         pronoun2 = "它";
         pronoun3 = "它的";
         createBreastRow(Appearance.breastCupInverse("flat"));
         ass.analLooseness = 1;
         ass.analWetness = 0;
         set_tallness(65);
         skin.tone = "dark green";
         hair.color = "purple";
         hair.length = 4;
         bonusHP = 100000;
         initStrTouSpeInte(12,0,35,42);
         initLibSensCor(45,45,100);
         set_weaponName("fists");
         set_weaponVerb("tiny punch");
         set_armorName("leather straps");
         set_lust(0);
         temperment = 2;
         set_drop(new WeightedChoice());
         set_armorDef(100);
         level = 20;
         set_gems(Utils.rand(5) + 5);
         lustVuln = 0.7;
         bonusLust = 200;
         createPerk(PerkLib.Immovable);
         checkMonster();
      }
      
      override public function won(param1:Boolean, param2:Boolean = false) : void
      {
         get_game().dungeons.manor.loseToCrystal();
      }
      
      override public function replacesDescribeAttacked(param1:Weapon, param2:int, param3:Boolean = false) : Boolean
      {
         var _loc4_:Boolean = false;
         var _loc5_:Boolean = false;
         var _loc6_:Boolean = false;
         if(!param1.isChanneling())
         {
            _loc4_ = param2 < 15 || param2 < maxHP() * 0.02;
            _loc5_ = param2 < 50 || param2 < maxHP() * 0.05;
            _loc6_ = param2 < 100 || param2 < maxHP() * 0.15;
            if(param2 <= 0)
            {
               outputText("你的" + param1.get_attackNoun() + "被" + get_themonster() + "弹开，没有造成任何伤害。");
            }
            else if(_loc4_)
            {
               outputText("你对" + get_themonster() + "造成了擦伤！");
            }
            else if(_loc5_)
            {
               outputText("你" + param1.get_attackVerb() + "了" + get_themonster() + "，把" + pronoun2 + "的碎片打飞了！");
            }
            else if(_loc6_)
            {
               outputText(get_Themonster() + "在你强力的" + param1.get_attackNoun() + "下裂开了！");
            }
            else
            {
               outputText("你用强大的" + param1.get_attackNoun() + "[b:粉碎]了" + get_themonster() + "！");
            }
            if(param3)
            {
               outputText("[b:暴击！]");
            }
            outputText(get_game().combat.getDamageText(param2));
            return true;
         }
         return false;
      }
      
      public function pulse() : void
      {
         outputText("水晶闪烁着，向外发出一道透明的粉色波纹。它击中了你，你的脑海中充满了不属于你的记忆！[pg]");
         switch(Utils.rand(3))
         {
            case 0:
               outputText("一个美丽的女孩正猛烈地骑乘着你。你们俩都在森林的空地上。满月照耀着她丰满的身体，尽管她有着奇怪的蓝色皮肤，但你无法否认她E罩杯的乳房、结实粗壮的大腿和锐利的金色眼眸所散发出的性感。");
               outputText("[pg]她用力地在你的肉棒上摩擦，大量的淫液覆盖了你的胯部和腹部，她紧紧地夹着你的阴茎，让你舒服得呻吟起来。你开始高潮，而且根本停不下来。你一次又一次地射精，她的肌肉吸干了你提供的每一滴精液。");
               outputText("[pg]你射得太猛，晕了过去。");
               break;
            case 1:
               outputText("你惊讶地看到一个女人骑着马在沙漠的沙丘上。夜晚的寒冷让穿越变得比白天更加困难，但你需要调查一下。她可能对你和你的姐妹们构成威胁。");
               outputText("[pg]几分钟后，她熟练地舔着你的两个小穴，而你则在下面舔她。你的姐妹们中没有一个人的舌头能像这个奇怪的女人一样熟练！你大叫着，猛烈地高潮，把你的快乐溅了她一脸。她没有停止舔舐。相反，她抓住你的乳头，开始挤奶，增强了你的快感。");
               outputText("[pg]你不知道这个女人是谁，但你觉得再享受一会儿也没什么不好。");
               break;
            case 2:
               outputText("你闻到洞穴外有什么东西入侵了你的领地。一个女人，虽然气味明显……更冷。你大步走出家门，看到月光下露出了一个蓝色的女人。她不是牛，但她的短裙和丰满的身体足以让你的肉棒充血，龟头冠状沟变宽，准备好好干一场。你准备攻击她，但当她只是弯下腰露出她闪闪发光的小穴时，你感到很惊讶。你期待地喘着粗气，扔掉了你的缠腰布。");
               outputText("[pg]你第五次射在她里面。这个女孩很娇小，但她能像你认识的大多数母牛一样吃下一根肉棒！你继续发情，当你注意到她的肚子一点也没有胀起来时，你有点恼火。这说不通。当你做爱时，她们的肚子在第二发时就胀起来了！在你分心的那一刻，女孩转过身，把你推倒在地上，开始骑你。她脸上带着邪恶的笑容。你抓住她的臀部，狠狠地干她。你也许可以永远留着这个！");
               break;
            case 3:
               outputText("你沮丧地离开了酒馆。整整一晚上都在努力寻找一个可爱的鼠娘带回家，但运气不好。也许你只是世界上最丑的老鼠？你跌跌撞撞，喝醉了，朝家走去。");
               outputText("[pg]突然，你发现你迷路了。你拐错了弯，最后来到了一个森林里。当你听到附近灌木丛的沙沙声时，你诅咒你今晚的坏运气。是个女人！不是鼠人，而是一个真正的人类女人！你跌跌撞撞地后退。人们告诉过你人类可能很危险，尤其是那些会施法的！");
               outputText("[pg]你开始转身，但那个蓝色的女人伸出双手，让你停下来。你照做了。同一只手然后放低到她的裙子上。她把它拉起来，然后隔着内裤轻轻地抚摸她的小穴。她呻吟着，你可以看到一小滴淫液从她的胯部拉出丝来。你咽了口唾沫，被欲望淹没了。也许你今晚终究不会孤单一人度过。");
         }
         outputText("[pg]你摇了摇头。你不知道那些是谁的记忆，但你无法否认体验它们对你产生的影响。");
         var _loc1_:Number = 20 + Utils.rand(20);
         get_player().takeLustDamage(_loc1_,true,true);
         get_player().takeLustDamage(5 + Utils.rand(3),true,false);
      }
      
      override public function performCombatAction() : void
      {
         pulse();
      }
      
      override public function outputDefaultTeaseReaction(param1:Number) : void
      {
         if(param1 == 0)
         {
            outputText("[pg]" + get_capitalA() + Utils.cnName(get_short()) + "似乎没有受到任何影响。");
         }
         else
         {
            outputText("[pg]" + get_capitalA() + Utils.cnName(get_short()) + "发出嗡嗡声和振动，与你的色情展示产生共鸣。");
         }
      }
      
      override public function handleStun() : Boolean
      {
         removeStatusEffect(StatusEffects.Stunned);
         return true;
      }
      
      override public function handleFear() : Boolean
      {
         removeStatusEffect(StatusEffects.Fear);
         return true;
      }
      
      override public function handleConstricted() : Boolean
      {
         removeStatusEffect(StatusEffects.Constricted);
         return true;
      }
      
      override public function defeated(param1:Boolean) : void
      {
         get_game().dungeons.manor.destroyCrystal();
      }
   }
}

