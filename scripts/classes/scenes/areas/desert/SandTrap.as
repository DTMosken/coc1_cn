package classes.scenes.areas.desert
{
   import classes.CoC;
   import classes.CockTypesEnum;
   import classes.Creature;
   import classes.Monster;
   import classes.Player;
   import classes.ReactionContext;
   import classes.StatusEffects;
   import classes.display.SpriteDb;
   import classes.internals.ChainedDrop;
   import classes.internals.Utils;
   import classes.items.ConsumableLib;
   import classes.scenes.combat.AvoidDamageParameters;
   import classes.scenes.combat.Combat;
   import flash.Boot;
   
   public class SandTrap extends Monster
   {
      
      public var playerClimbed:Boolean;
      
      public function SandTrap()
      {
         if(Boot.skip_constructor)
         {
            return;
         }
         playerClimbed = false;
         super();
         if(Utils.rand(3) == 0)
         {
            createStatusEffect(StatusEffects.Fertilized,0,0,0,0);
         }
         set_a("");
         if(get_game().get_silly())
         {
            set_short("sand tarp");
         }
         else
         {
            set_short("sandtrap");
         }
         imageName = "sandtrap";
         set_long("你正在与沙地陷阱怪战斗。它半埋在巨大的圆锥形坑底，只露出精瘦的人类躯干，六只同样漆黑的眼睛从齐肩的黑发下色眯眯地盯着你。你无法判断它那长着尖下巴的柔软长脸是漂亮还是英俊——每次这怪物的脸部移动时，它的性别似乎都在发生变化。它那柔软、棕色、平坦的胸部支撑着四只手臂，修长的手指把玩着周围的细沙。在它的腹部下方，你偶尔能瞥见它昆虫般的一半：一个巨大的沙色腹部将它固定在沙漠中，谁知道那是什么样的身体结构。");
         set_race("Sand Trap");
         createCock(10,2,CockTypesEnum.HUMAN);
         balls = 2;
         ballSize = 4;
         cumMultiplier = 3;
         createBreastRow(0,0);
         ass.analLooseness = 2;
         ass.analWetness = 0;
         set_tallness(Utils.rand(8) + 150);
         hips.rating = 8;
         butt.rating = 8;
         skin.tone = "fair";
         hair.color = "black";
         hair.length = 15;
         initStrTouSpeInte(55,10,45,55);
         initLibSensCor(60,45,50);
         set_weaponName("claws");
         set_weaponVerb("claw");
         set_weaponAttack(10);
         set_armorName("chitin");
         set_armorDef(20);
         bonusHP = 100;
         set_lust(20);
         lustVuln = 0.55;
         temperment = 3;
         level = 4;
         set_gems(2 + Utils.rand(5));
         set_drop(new ChainedDrop(get_consumables().TRAPOIL).add(get_consumables().OVIELIX,0.3333333333333333));
         tail.type = 3;
         createStatusEffect(StatusEffects.Level,4,0,0,0);
         checkMonster();
      }
      
      override public function won(param1:Boolean, param2:Boolean = false) : void
      {
         if(param2)
         {
            outputText("[pg]沙地陷阱怪似乎对你体内寄宿的昆虫感到困惑……");
            doNext(get_game().combat.endLustLoss);
         }
         else
         {
            get_game().desert.sandTrapScene.sandtrapmentLoss(true);
         }
      }
      
      public function trapLevel(param1:Number = 0) : Number
      {
         if(!hasStatusEffect(StatusEffects.Level))
         {
            createStatusEffect(StatusEffects.Level,4,0,0,0);
         }
         if(param1 != 0)
         {
            addStatusValue(StatusEffects.Level,1,param1);
            if(statusEffectv1(StatusEffects.Level) < 1)
            {
               changeStatusValue(StatusEffects.Level,1,1);
            }
            if(statusEffectv1(StatusEffects.Level) > 4)
            {
               changeStatusValue(StatusEffects.Level,1,4);
            }
         }
         return statusEffectv1(StatusEffects.Level);
      }
      
      public function sandTrapWait() : void
      {
         clearOutput();
         get_game().spriteSelect(SpriteDb.get_s_sandtrap());
         playerClimbed = true;
         outputText("你没有攻击，而是转身背对怪物，顽强地试图爬回坑里，在对抗沙流的攀爬中，你把所有的四肢都挖进了柔软的粉末中。");
         if(trapLevel() == 4)
         {
            outputText("[pg]你看着上方的地面。坑的边缘太陡峭了，地面太不稳定了……虽然看起来你可以对抗把你带向更深处的沙流，但在怪物法术控制的沙子下，获得自由似乎是不可能的。");
         }
         else if(get_player().get_str() / 10 + Utils.rand(20) > 10)
         {
            outputText("[pg]汗水从你的额头上滴落——试图爬出这个坑就像在你能想象到的最柔软的跑步机上跑步一样。尽管如此，通过相当大的努力，你发现你已经成功地进一步摆脱了沙地陷阱怪的控制。[say: 看着你那样扭动让我欲火焚身，]它向你喊道。转过身，你看到那个生物正一边看着你挣扎，一边用手在它瘦削的身体上摩擦。[say: 这么充满活力的求偶舞，只为我而跳……嗯，这样做的猎物总是最棒的！]");
            trapLevel(2);
         }
         else
         {
            outputText("[pg]汗珠布满你的额头——试图爬出这个坑就像在你能想象到的最柔软的跑步机上跑步一样。你感觉自己快要累炸了，最终选择了放弃，疲惫地发现自己根本没有前进半步。[say: 看着你那样扭动，让我欲火焚身，]沙地陷阱怪对你喊道。转过身，你看到这只怪物一边看着你挣扎，一边用双手在它那纤细的身体上抚摸着。[say: 这么充满活力的小小求偶舞，只为我而跳……嗯，这样做的猎物总是最棒的！]");
            trapLevel(1);
         }
         outputText("[pg]");
      }
      
      public function sandTrapPheromones() : void
      {
         var _loc1_:Number = NaN;
         get_game().spriteSelect(SpriteDb.get_s_sandtrap());
         outputText("沙地陷阱怪撅起嘴唇。有那么疯狂的一瞬间，你以为它要给你飞吻……但它却向你吐出了一口透明的液体！你拼命试图躲避，尽管你的下半身已经深陷在沙子里。");
         if(get_player().get_spe() / 10 + Utils.rand(20) > 10 || Boolean(combatAvoidDamage(new AvoidDamageParameters(true,false,false,null,null,null,null,null)).attackFailed))
         {
            outputText("你巧妙地顺着沙流移动而不是逆流而上，成功避开了陷阱怪的液体，那些液体无害地溅落在了沙丘上。");
         }
         else
         {
            _loc1_ = 10 + get_player().lib / 10;
            outputText("尽管你尽最大努力躲避喷射的液体，但还是无法避免一些东西溅到你的手臂和脸上。这种物质感觉异常温暖且油腻，虽然你迅速试图将其擦掉，但它却顽固地粘在你的皮肤上，气味也扑鼻而来。随着温暖从中散发出来，你的心跳开始加快；你感到慵懒、头晕目眩且充满情欲，渴望被触摸，被牵着手带到沙床上……你摇了摇头，试图压抑这些外来信息素带给你的感觉。");
            get_player().takeLustDamage(_loc1_,true);
         }
      }
      
      override public function runCheck() : void
      {
         var newRound:Boolean;
         var _g:Combat;
         if(hasStatusEffect(StatusEffects.Level) && statusEffectv1(StatusEffects.Level) < 4)
         {
            if(get_player().canFly())
            {
               outputText("你收缩背部的肌肉，抖落身上的沙子，腾空而起！你毫不迟疑地飞离了沙地陷阱怪和它那危险的陷阱。[say: 总有一天你的翅膀会掉下来的，小蚂蚁，]当你逃跑时，那个受挫的雌雄同体怪物咆哮的声音传到了你的耳中。[say: 等到那时候，我会等着你的！]");
               get_game().combat.doRunAway();
            }
            else
            {
               outputText("你陷得太深了，无法逃脱！你必须先<b>攀爬</b>一段距离！");
               _g = get_game().combat;
               newRound = false;
               doNext(function():void
               {
                  _g.combatMenu(newRound);
               });
            }
         }
         else
         {
            runSuccess();
         }
      }
      
      override public function react(param1:ReactionContext) : Boolean
      {
         var _loc2_:Number = NaN;
         switch(param1.index)
         {
            case 0:
               if(hasStatusEffect(StatusEffects.Level) && !get_player().hasStatusEffect(StatusEffects.FirstAttack) && !get_game().combat.isWieldingRangedWeapon())
               {
                  outputText("孤注一掷了！伴随着一声怒吼，你冲下危险的斜坡，用尽全力猛击沙地陷阱怪！");
                  trapLevel(-4);
               }
               break;
            case 1:
               if(hasStatusEffect(StatusEffects.Level))
               {
                  _loc2_ = get_game().combat.damage * 1.75;
                  get_game().combat.damage = Math.round(_loc2_);
               }
               break;
            case 3:
               if(hasStatusEffect(StatusEffects.Level))
               {
                  sandTrapWait();
                  tookAction = true;
                  return false;
               }
         }
         return true;
      }
      
      override public function playerLossCondition() : Object
      {
         var _g:SandTrapScene;
         if(trapLevel() <= 1)
         {
            _g = get_game().desert.sandTrapScene;
            return function():void
            {
               _g.sandtrapmentLoss();
            };
         }
         return null;
      }
      
      override public function performCombatAction() : void
      {
         if(hasStatusEffect(StatusEffects.Level))
         {
            if(trapLevel() == 4 && !playerClimbed)
            {
               nestleQuikSandAttack();
            }
            else
            {
               sandTrapPheromones();
            }
            if(!playerClimbed)
            {
               outputText("[pg]细小的沙流从你身边流过，你继续向坑底和沙子深处陷去。");
               trapLevel(-1);
            }
            playerClimbed = false;
         }
         else
         {
            super.performCombatAction();
         }
      }
      
      public function nestleQuikSandAttack() : void
      {
         get_game().spriteSelect(SpriteDb.get_s_sandtrap());
         outputText("沙地陷阱怪迷人地对你微笑着，同时将双手插入流动的沙粒中。你脚下的沙子突然似乎失去了更多的密度；你已经下陷到大腿了！");
         if(get_player().get_spe() / 10 + Utils.rand(20) > 10 || Boolean(combatAvoidDamage(new AvoidDamageParameters(true,false,false,null,null,null,null,null)).attackFailed))
         {
            outputText("你行动敏捷，成功将自己从沙地陷阱怪法术影响的区域中拉了出来，并重新站稳了脚跟。");
         }
         else
         {
            outputText("你没能及时挣脱，在恐慌中你意识到自己现在几乎是在沙子里跋涉。现在想要爬出去将会非常困难。");
            if(get_player().canFly())
            {
               outputText("你试图通过拍打翅膀来挣脱，但这是徒劳的。你已经被彻彻底底地困住了。");
            }
            trapLevel(-1);
            playerClimbed = true;
         }
      }
      
      override public function defeated(param1:Boolean) : void
      {
         get_game().desert.sandTrapScene.pcBeatsATrap();
      }
   }
}

