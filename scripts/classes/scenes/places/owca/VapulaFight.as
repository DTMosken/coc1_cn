package classes.scenes.places.owca
{
   import classes.CoC;
   import classes.Monster;
   import classes.StatusEffects;
   import classes.internals.Utils;
   import classes.scenes.combat.Combat;
   import flash.Boot;
   
   public class VapulaFight extends Monster
   {
      
      public function VapulaFight()
      {
         if(Boot.skip_constructor)
         {
            return;
         }
         super();
         set_a("");
         set_short("Vapula");
         imageName = "demonmob";
         set_long("你正面对着一群三十个各种各样的恶魔。各种大小和颜色的恶魔、梦魔和魅魔包围着你，尽力展示他们的生殖器或巨大的乳房，通常两者兼有。你可以看到数量惊人的高耸肉棒、流着淫液的小穴和抖动的乳房在他们移动时摇晃。大多数生殖器都是畸形的，与长着它们的恶魔的实际比例极不相称——更不用说小恶魔了！一些魅魔向你眨眼，在你的柱子周围跳舞时送出飞吻。在他们中间，你很容易就能发现这群恶魔中最高的女恶魔，瓦普拉；她完美的紫色皮肤、坚挺的大乳房、丰满的臀部、肉感的嘴唇和诱人的凝视像磁铁一样吸引着你的注意力。她长着一对华丽的翅膀，浓密的头发让她的脸看起来像狮子一样凶猛。当她的眼睛带着贪得无厌的饥渴蹂躏你时，她以一个成熟的施虐狂的自信下达命令。");
         pronoun1 = "she";
         pronoun2 = "她";
         pronoun3 = "她的";
         createVagina(false,3,2);
         createBreastRow(0);
         ass.analLooseness = 4;
         ass.analWetness = 5;
         set_tallness(Utils.rand(8) + 70);
         hips.rating = 8;
         butt.rating = 8;
         skin.tone = "red";
         hair.color = "black";
         hair.length = 15;
         initStrTouSpeInte(50,10,10,5);
         initLibSensCor(50,60,100);
         set_weaponName("claws");
         set_weaponVerb("claw");
         set_armorName("demonic skin");
         bonusHP = 500;
         set_lust(30);
         lustVuln = 0.3;
         temperment = 3;
         level = 14;
         set_gems(150 + Utils.rand(100));
         tail.type = 3;
         horns.type = 1;
         horns.value = 2;
         set_drop(NO_DROP);
         checkMonster();
      }
      
      override public function won(param1:Boolean, param2:Boolean = false) : void
      {
         if(param2)
         {
            outputText("[pg]恶魔们看着你的表演，相视一笑，然后逼近……");
            doNext(get_game().combat.endLustLoss);
         }
         else
         {
            get_game().owca.loseOrSubmitToVapula();
         }
      }
      
      override public function teased(param1:Number) : void
      {
         if(param1 > 0 && param1 < 5)
         {
            outputText("恶魔们的攻击强度有所减弱，有些甚至在攻击你时打量着你的资本。瓦普拉在下达命令时遇到了困难。");
         }
         if(param1 >= 5 && param1 < 10)
         {
            outputText("恶魔们显然在避免伤害任何你可能用来做爱的部位，并且在每次攻击后，他们的手在你身上停留的时间开始变长。有些在快速地揩油，你可以闻到空气中恶魔的欲望。瓦普拉开始感到沮丧，因为她的手下越来越不愿意攻击你，而是更喜欢互相抚摸。");
         }
         if(param1 >= 10)
         {
            outputText("恶魔们越来越不愿意打你，而是越来越愿意用手在你身上性感地抚摸。瓦普拉自己也无法控制地被唤起，甚至在她试图保持某种进攻姿态时也在发抖，但大多数恶魔明显感到不舒服，有些干脆躺在地上，被他们自己的欲望所驯服。");
         }
         applyTease(param1);
      }
      
      override public function runCheck() : void
      {
         var newRound:Boolean;
         var _g:Combat;
         if(hasStatusEffect(StatusEffects.RunDisabled))
         {
            outputText("你想跑，但有这么多恶魔的手把你往下拉，你无法攀爬坑壁！");
            _g = get_game().combat;
            newRound = false;
            doNext(function():void
            {
               _g.combatMenu(newRound);
            });
         }
         else
         {
            super.runCheck();
         }
      }
      
      override public function performCombatAction() : void
      {
         eAttack();
      }
      
      override public function defeated(param1:Boolean) : void
      {
         get_game().owca.defeetVapulasHorde();
      }
   }
}

