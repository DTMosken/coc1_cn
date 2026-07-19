package classes.scenes.npcs
{
   import classes.Appearance;
   import classes.CoC;
   import classes.CockTypesEnum;
   import classes.Creature;
   import classes.Monster;
   import classes.PerkLib;
   import classes.Player;
   import classes.ReactionContext;
   import classes.StatusEffects;
   import classes.internals.MonsterAI;
   import classes.internals.Utils;
   import classes.scenes.combat.AvoidDamageParameters;
   import classes.scenes.combat.CombatRange;
   import flash.Boot;
   
   public class Holli extends Monster
   {
      
      public var jojoPyre:int;
      
      public var isBurning:Boolean;
      
      public function Holli()
      {
         if(Boot.skip_constructor)
         {
            return;
         }
         jojoPyre = 0;
         isBurning = false;
         super();
         set_a("");
         set_short("Holli");
         imageName = "holli";
         set_long("玛莱的分支，霍莉扎根在你面前。她那双有着金色瞳孔的纯黑眼睛死死地盯着你。她平时赤裸的身体隐藏在树干里，不过偶尔她也会向你露出施虐狂般恶魔般的笑容，树皮也会裂开，露出一块苍白、颤动的肉体。她的额头上长出了一对粗糙的橡木角；随着她脸上情绪的扭曲，树叶和花朵在角上交替绽放和枯萎。");
         set_race("Dryad");
         createCock(12,2,CockTypesEnum.HUMAN);
         balls = 0;
         ballSize = 0;
         cumMultiplier = 3;
         set_hoursSinceCum(20);
         createVagina(false,2,2);
         createStatusEffect(StatusEffects.BonusVCapacity,20,0,0,0);
         createBreastRow(Appearance.breastCupInverse("E"));
         ass.analLooseness = 1;
         ass.analWetness = 1;
         set_tallness(Utils.rand(12) + 55);
         hips.rating = 10;
         butt.rating = 8;
         skin.tone = "black";
         hair.color = "sandy-blonde";
         hair.length = 15;
         initStrTouSpeInte(150,80,80,85);
         initLibSensCor(75,40,80);
         set_weaponName("branches");
         set_weaponVerb("branchy thwack");
         set_armorName("bark");
         set_armorDef(40);
         bonusHP = 1000;
         set_lust(20);
         lustVuln = 0.2;
         temperment = 2;
         level = 20;
         set_gems(0);
         set_drop(NO_DROP);
         checkMonster();
      }
      
      override public function won(param1:Boolean, param2:Boolean = false) : void
      {
         get_game().holliScene.enjoyYourBadEndBIYAAAATCH();
      }
      
      public function waitForHolliConstrict(param1:Boolean = true) : void
      {
         if(param1)
         {
            clearOutput();
         }
         outputText("那根不祥的玫瑰色茎干在你上方盘旋，它的主人淫荡地抚摸着根部，呻吟着。[say:哦，要……高潮了！]她尖叫道。随着一声低沉的呻吟从她口中逸出，茎干膨胀起来，开始将乳白色的树液注入你的嘴里！你被僵硬地固定着，最终为了呼吸不得不咽下去；树液滑入你的胃里，温暖辐射到你的腹部和腹股沟，让你感到面红耳赤、浑身发热。霍莉满意地叹了口气，显然在高潮后放松了许多。");
         set_lust(get_lust() - 20);
         if(get_lust() < 20)
         {
            set_lust(20);
         }
         get_player().takeLustDamage(15 + get_player().sens / 5,true);
      }
      
      override public function teased(param1:Number) : void
      {
         if(isBurning)
         {
            outputText("霍莉似乎根本没有注意到，她太专注于在越来越旺的篝火给她带来更多痛苦之前击败你。");
            param1 = 0;
         }
         applyTease(param1);
      }
      
      public function struggleOutOfHolli() : void
      {
         clearOutput();
         get_player().addStatusValue(StatusEffects.HolliConstrict,1,9);
         if(get_player().tongue.type > 0)
         {
            outputText("你无法移动手臂或[leg]来拍开那朵花……但她实际上正撑开你的嘴。你长长的舌头卷了出来，抓住并撕下了她茎端上的几片花瓣！霍莉尖叫起来，她的根须松弛了，让你得以挣脱出来。");
            get_player().removeStatusEffect(StatusEffects.HolliConstrict);
         }
         else
         {
            if(get_player().get_str() / 10 + Utils.rand(20) + 1 + get_player().statusEffectv1(StatusEffects.HolliConstrict) <= 30)
            {
               outputText("你试图逃脱缠绕的根须，但无法挣脱它们的抓握！");
               waitForHolliConstrict(false);
               return;
            }
            outputText("当分心的霍莉开始抚摸她的植物茎干时，你设法强行撑开了根须，就在一滴树液渗出并落在你站立的地方时，你挣脱了束缚。你自由了！");
            get_player().removeStatusEffect(StatusEffects.HolliConstrict);
         }
         tookAction = true;
      }
      
      override public function runFail() : void
      {
         var _loc1_:int = 0;
         clearOutput();
         outputText("你");
         if(get_player().canFly())
         {
            outputText("拍打着翅膀");
         }
         outputText("试图逃跑，但" + Utils.cnName(get_short()) + "用她那扭动的树根缠住了你的[leg]，将你猛地摔在地上，并用更多的树根将你捆绑起来！[say: 你以为你能去哪儿，我的小鲜肉？]她嘶嘶地说着。她的树皮裂开，露出了她的身体，一根绿色的肉棒从她的胯下蜿蜒而出，上面长满了刺，顶端绽放出一朵玫瑰。她用树根强行掰开你的嘴，将那朵流着口水的花朵悬在你的[face]上方！");
         if(!get_player().hasPerk(PerkLib.Juggernaut) && get_armorPerk() != "Heavy")
         {
            _loc1_ = 15;
            get_player().takeDamage(_loc1_,true);
         }
         outputText("[pg]");
         get_player().createStatusEffect(StatusEffects.HolliConstrict,0,0,0,0);
         get_game().combat.startMonsterTurn();
      }
      
      override public function react(param1:ReactionContext) : Boolean
      {
         switch(param1.index)
         {
            case 3:
               if(get_player().hasStatusEffect(StatusEffects.HolliConstrict))
               {
                  waitForHolliConstrict(true);
                  tookAction = true;
                  return false;
               }
               break;
            case 6:
               if(!isBurning)
               {
                  lightHolliOnFireMagically();
               }
               return true;
         }
         return true;
      }
      
      override public function performCombatAction() : void
      {
         var _loc1_:MonsterAI = new MonsterAI();
         _loc1_.add(healHolli,0.5,get_hp100() < 50,0,FATIGUE_NONE,CombatRange.Self);
         _loc1_.add(holliConstrictAttack,1,!get_player().hasStatusEffect(StatusEffects.HolliConstrict),10,FATIGUE_PHYSICAL,CombatRange.FlyingMelee);
         _loc1_.add(fuckinJamanjiFlowerDarts,1,true,10,FATIGUE_PHYSICAL,CombatRange.Ranged);
         _loc1_.add(eAttack,1,true,0,FATIGUE_NONE,CombatRange.FlyingMelee);
         _loc1_.exec();
         holliBonusHealing();
      }
      
      public function lightHolliOnFireMagically() : void
      {
         if(get_game().holliScene.jojoAssisting)
         {
            if(!isBurning)
            {
               outputText("魔法火焰有效地引燃了乔乔的一大片引火物，恶魔愤怒地嚎叫着。看到这一幕，乔乔扔下手中的火把，转身向森林走去，去拿更多的引火物。[pg]");
               isBurning = true;
            }
         }
      }
      
      public function holliConstrictAttack() : void
      {
         var _loc1_:int = 0;
         outputText("一片粗壮的根须森林从地下爆裂而出，几根根须向你的[legs]抽打过来，试图缠住你！");
         if(hasStatusEffect(StatusEffects.Blind) && Utils.rand(6) == 0)
         {
            outputText("幸运的是，恶魔的失明让你很容易躲开那些抓取过来的根须，尽管有几次险些被擦伤。");
         }
         if(Boolean(combatAvoidDamage(new AvoidDamageParameters(true,false,false,null,null,null,null,null)).attackFailed))
         {
            outputText("真是千钧一发，但你设法避开了根须——其中一根差点抓住你，但你闪身躲开，让它只抓到了旁边的同伴。");
         }
         else
         {
            outputText("她伴随着痛苦的拍打声缠住了你，更多的根须触手加入了第一根；当她把你拉近时，她的树皮裂开，一根长长的、阴茎状的茎从她的胯部伸出，上面缠绕着荆棘，开着一朵玫瑰！它抚摸着你的脸，然后把花朵悬挂在你的嘴上方，滴下她的汁液。几根根须撬开你的下巴，强迫你喝下从她那假阳具里流出的被污染的液体！[say:你觉得我的小树液玫瑰怎么样？]");
            _loc1_ = 10 + Utils.rand(5);
            get_player().takeDamage(_loc1_,true);
            get_player().takeLustDamage(15,true);
            get_player().createStatusEffect(StatusEffects.HolliConstrict,0,0,0,0);
         }
      }
      
      public function holliBonusHealing() : void
      {
         if(!isBurning)
         {
            if(HPRatio() < 1 && get_HP() > 1)
            {
               outputText("[pg]你对树妖造成的伤口溢出了汁液，并开始愈合！你只能无助地看着她恢复，她将受损的树皮打结，直到看起来和以前一样坚不可摧。");
               addHP(25);
            }
            if(get_lust() > 20 && get_lust100() <= 99)
            {
               outputText("[pg]树妖那盔甲般的表面上出现了一道裂缝；你甚至能看到里面的恶魔正在抚摸自己的小穴，她高潮时翻着白眼！看来，如果你不能分散她在壳里自慰的注意力，挑逗她就不会有什么效果。");
               set_lust(get_lust() - 10);
            }
         }
         if(get_game().holliScene.jojoAssisting)
         {
            if(isBurning)
            {
               outputText("[pg]乔乔继续搬运木柴来添火；火焰舔舐着霍莉，她的脸因愤怒而扭曲。汁液从她的烧伤处流出，但大部分在起作用之前就沸腾蒸发了，她那坚如钢铁的树皮在某些地方正在剥落。");
               if(get_armorDef() > 20)
               {
                  set_armorDef(20);
               }
               if(get_tou() > 50)
               {
                  set_tou(50);
               }
               addHP(5);
               set_lust(get_lust() - 2);
               if(get_lust() < 20)
               {
                  set_lust(20);
               }
            }
            else
            {
               switch(jojoPyre)
               {
                  case 0:
                     outputText("[pg]乔乔又抓起一把干树叶和树枝扔在恶魔根部越来越大的柴堆上，然后向你挥手呼喊。[say: [name]！我在她的根部放了足够的干柴，我要试着点燃它！再坚持一会儿；解脱马上就来！]");
                     jojoPyre += 1;
                     break;
                  case 1:
                     outputText("[pg]乔乔拿着点燃的火把向柴堆跑去，但恶魔上方的一根树枝上睁开了一只眼睛，她用一根树根抓住了他，让他摔了个跟头。有那么一瞬间，你失去了希望，但这位勇敢的武僧在她再次鞭打之前滚到了一边，然后站了起来。");
                     jojoPyre += 1;
                     break;
                  case 2:
                     outputText("[pg]由于警惕着上方不断的监视，乔乔以极快的速度向树妖蜿蜒前进，嘴里叼着一根燃烧的棍子，躲避着树根和树枝。就在他靠近到足以投掷的时候，一根树根低低地扫过，让他摔倒在自己的火把上，点燃了他的一些" + (get_game().get_noFur() ? "衣服" : "毛发") + "！他毫不犹豫地向引火物堆滚去，将一只燃烧的手伸进落叶中。当那圈易燃物被点燃，恶魔发出沮丧的尖叫时，他撤退到树林里，用沾满泥土的袍子拍打手臂来灭火。");
                     isBurning = true;
               }
            }
         }
      }
      
      public function healHolli() : void
      {
         clearOutput();
         outputText("树皮裂开了一部分，女人的嘴突然爆发出色彩，她的嘴唇向外翻折，变成了一朵看起来相当像女阴的兰花。大量的白色树液从花朵中渗出，覆盖在她的树皮上，治愈了损伤。花瓣沙沙作响，她湿漉漉地通过它说话。[say:你的努力都是徒劳的！向我求饶吧；做我的奴隶，听从我的吩咐！]");
         addHP(200);
      }
      
      public function fuckinJamanjiFlowerDarts() : void
      {
         var _loc1_:Number = NaN;
         outputText("树的高枝上绽放出一朵花，露出一只被恶毒尖刺包围的邪恶眼睛。伴随着一个手势，" + Utils.cnName(get_short()) + "向你发射了几根尖刺！");
         if(hasStatusEffect(StatusEffects.Blind))
         {
            outputText("尽管恶魔本身失明了，但花上那只新鲜的眼睛似乎完全有能力为她瞄准！");
         }
         if(Boolean(combatAvoidDamage(new AvoidDamageParameters(true,false,false,null,null,null,null,null)).attackFailed))
         {
            outputText("你敏捷地闪到一边，让飞镖呼啸而过。");
         }
         else
         {
            outputText("飞镖刺入了血肉，你感到自己的速度急剧下降；当植物女人的毒素侵入你的身体时，你只想做爱和睡觉。[say:放弃吧，]霍莉柔声说道。[saystart]想想投入我的怀抱会有多好，然后");
            if(get_player().hasCock())
            {
               outputText("射在我的里面");
            }
            else
            {
               outputText("让我在你的里面");
            }
            outputText("，永远……[sayend]");
            _loc1_ = 20 + Utils.rand(10);
            get_player().takeDamage(_loc1_,true);
            get_player().changeFatigue(10);
            get_player().takeLustDamage(25,true);
         }
      }
      
      override public function defeated(param1:Boolean) : void
      {
         get_game().holliScene.defeatHolli();
      }
   }
}

