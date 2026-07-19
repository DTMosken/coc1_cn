package classes.scenes.npcs
{
   import classes.Appearance;
   import classes.CoC;
   import classes.Creature;
   import classes.Player;
   import classes.StatusEffects;
   import classes.internals.ChainedDrop;
   import classes.internals.MonsterAI;
   import classes.internals.Utils;
   import classes.items.ArmorLib;
   import classes.items.ConsumableLib;
   import classes.scenes.areas.highMountains.Harpy;
   import classes.scenes.combat.AvoidDamageParameters;
   import classes.scenes.combat.CombatRange;
   import flash.Boot;
   
   public class Sophie extends Harpy
   {
      
      public var bimboBrawl:Boolean;
      
      public function Sophie()
      {
         if(Boot.skip_constructor)
         {
            return;
         }
         bimboBrawl = false;
         super(true);
         set_a("");
         set_short("Sophie");
         imageName = "sophie";
         set_long("如果不算背上长出的巨大羽翼，索菲的体型大约和普通人类女性差不多。她的面容十分美丽，有着圆润的大眼睛，丰润诱人的双唇上涂着闪亮的琥珀色唇彩。尽管她容貌姣好，但从她嘴边隐约可见的笑纹来看，她显然已经活了足够长的时间，甚至可能已经有了好几个孩子。她的羽毛是浅粉色的，不过构成她“头发”的绒羽比其他地方更亮一些。尽管胸前挂着一对硕大且摇晃的乳房，她的动作依然优雅娴熟。从她自信的举止来看，她是个经验丰富的战士。");
         set_race("Harpy");
         createVagina(false,4,4);
         createStatusEffect(StatusEffects.BonusVCapacity,40,0,0,0);
         createBreastRow(Appearance.breastCupInverse("DD"));
         ass.analLooseness = 1;
         ass.analWetness = 0;
         createStatusEffect(StatusEffects.BonusACapacity,10,0,0,0);
         set_tallness(65);
         hips.rating = 20;
         butt.rating = 13;
         skin.tone = "pink";
         skin.type = 0;
         skin.desc = "feathers";
         hair.color = "pink";
         hair.length = 16;
         initStrTouSpeInte(55,40,110,60);
         initLibSensCor(60,50,60);
         set_weaponName("talons");
         set_weaponVerb("slashing talons");
         set_weaponAttack(20);
         set_armorName("feathers");
         set_armorDef(5);
         bonusHP = 250;
         set_lust(10);
         lustVuln = 0.3;
         temperment = 2;
         level = 11;
         set_gems(20 + Utils.rand(25));
         set_drop(new ChainedDrop().add(get_armors().W_ROBES,0.1).elseDrop(get_consumables().GLDSEED));
         wings.type = 9;
         checkMonster();
      }
      
      override public function won(param1:Boolean, param2:Boolean = false) : void
      {
         if(param2)
         {
            outputText("[pg]你的敌人似乎对这副景象感到厌恶，丢下你独自恢复……");
            get_game().combat.cleanupAfterCombat();
         }
         else
         {
            get_game().sophieScene.sophieWonCombat();
         }
      }
      
      public function talonsSophie() : void
      {
         var _loc3_:Number = NaN;
         var _loc1_:Array = ["[BLIND]多亏了" + get_capitalA() + Utils.cnName(get_short()) + "是个瞎子，她的利爪很容易就能躲开！\n","[SPEED]" + get_a() + Utils.cnName(get_short()) + "撕裂空气扑来，但你勉强躲开了。\n","[EVADE]利用你躲避攻击的技巧，你注视着" + get_a() + Utils.cnName(get_short()) + "并灵巧地侧身躲开了她残暴的利爪。\n","[MISDIRECTION]利用拉斐尔的教导和紧身衣提供的灵活性，你预判并侧身躲开了" + get_a() + Utils.cnName(get_short()) + "的攻击。\n"];
         outputText("索菲抬起腿，危险地翘起大腿。小心！");
         get_game().sophieBimbo.sophieSprite();
         var _loc2_:AvoidDamageParameters = new AvoidDamageParameters(true,true,false,null,false,get_player().standardDodgeFunc(this,-15),null,null);
         if(!playerAvoidDamage(_loc2_,_loc1_))
         {
            outputText("她的腿如闪电般向前踢出，用她剃刀般锋利的爪子在你的[skindesc]上撕开了一道道血淋淋的口子！");
            _loc3_ = int((get_str() + get_weaponAttack()) * get_player().damagePercent() * 0.01025);
            if(_loc3_ < 0)
            {
               _loc3_ = 0;
            }
            _loc3_ += 40;
            get_player().takeDamage(_loc3_,true);
         }
      }
      
      public function sophieKissAttack() : void
      {
         get_game().sophieBimbo.sophieSprite();
         outputText("索菲闪转腾挪，瞬间拉近了你们之间的距离。");
         var _loc1_:Array = ["[BLIND]" + get_capitalA() + Utils.cnName(get_short()) + "看起来像是想吻你，但要避开这只瞎眼的鹰身女妖简直轻而易举！\n","[SPEED]利用你躲避攻击的技巧，你预判并侧身躲开了" + get_a() + Utils.cnName(get_short()) + "的攻击。\n"];
         var _loc2_:AvoidDamageParameters = new AvoidDamageParameters(true,false,false,null,false,null,null,null);
         if(!playerAvoidDamage(_loc2_,_loc1_))
         {
            outputText("还没等你反应过来，她就在你唇上轻轻一吻。这只鹰身女妖带着风骚的微笑退开，满怀期待地看着你。");
            if(get_player().hasStatusEffect(StatusEffects.Luststick))
            {
               outputText("血液涌向[eachcock]，你勃起得太快太硬，甚至感到有些疼痛。");
               get_game().sophieScene.luststickApplication(2);
               get_player().takeLustDamage(12 + get_player().lib / 10,true);
               if(get_player().get_lust100() < 70)
               {
                  outputText("涂了春药的唇彩开始对你起作用了！\n");
               }
               else if(get_player().get_lust100() < 80)
               {
                  outputText("她曲线优美的大腿看起来如此诱人。你差点就控制不住自己爬到她双腿之间了！\n");
               }
               else if(get_player().get_lust100() < 90)
               {
                  outputText("一丝先列腺液从[eachcock]中漏出。索菲娇嗔道，[say:你为什么不屈服，让索菲妈妈把你那多汁的精液都榨干呢？]\n");
               }
               else if(get_player().get_lust100() < 100)
               {
                  outputText(get_player().SMultiCockDesc() + "随着你的心跳抽动弹跳着，简直要把你拉向索菲那大张着、粉嫩的肉缝。\n");
               }
               else
               {
                  outputText("太饥渴了。你需要交配——不，是做爱——就在现在。你的手摸向你的[cock]，你感到一阵眩晕，顺从地淫荡地挺动着臀部。\n");
               }
            }
            else
            {
               outputText("你的嘴唇因某种不自然的感觉而刺痛，全身泛起红晕。她的嘴唇上涂了春药！随着情欲开始在你的血管中流淌，你全身都涨红了。");
               get_game().sophieScene.luststickApplication(2);
               get_player().takeLustDamage(8 + get_player().lib / 10,true);
               if(get_player().get_lust100() < 70)
               {
                  outputText("涂了春药的唇彩开始对你起作用了！\n");
               }
               else if(get_player().get_lust100() < 80)
               {
                  outputText("她曲线优美的大腿看起来如此诱人。你差点就控制不住自己爬到她双腿之间了！\n");
               }
               else if(get_player().get_lust100() < 90)
               {
                  outputText("一丝先列腺液从[eachcock]中漏出。索菲娇嗔道，[say:你为什么不屈服，让索菲妈妈把你那多汁的精液都榨干呢？]\n");
               }
               else if(get_player().get_lust100() < 100)
               {
                  outputText(get_player().SMultiCockDesc() + "随着你的心跳抽动弹跳着，简直要把你拉向索菲那大张着、粉嫩的肉缝。\n");
               }
               else
               {
                  outputText("太饥渴了。你需要交配——不，是做爱——就在现在。你的手摸向你的[cock]，你感到一阵眩晕，顺从地淫荡地挺动着臀部。\n");
               }
            }
         }
      }
      
      public function sophieHarpyBoatsPC() : void
      {
         var _loc1_:Array = ["[BLIND]多亏了" + get_capitalA() + Utils.cnName(get_short()) + "是个瞎子，她的利爪很容易就能躲开！\n","[SPEED]" + get_a() + Utils.cnName(get_short()) + "的动作快得不可思议，但你还是设法侧身躲开了。\n","[EVADE]利用你躲避攻击的技巧，你判断出" + get_a() + Utils.cnName(get_short()) + "瞄准的是你的上半身，于是滑步躲过了攻击。\n","[MISDIRECTION]利用拉斐尔的教导和紧身衣提供的灵活性，你预判并侧身躲开了" + get_a() + Utils.cnName(get_short()) + "的攻击。\n"];
         get_game().sophieBimbo.sophieSprite();
         var _loc2_:AvoidDamageParameters = new AvoidDamageParameters(true,false,false,null,false,get_player().standardDodgeFunc(this,-15),null,null);
         outputText(get_capitalA() + Utils.cnName(get_short()) + "拍打着翅膀，举起利爪向前猛扑过来。");
         if(!playerAvoidDamage(_loc2_,_loc1_))
         {
            outputText("她重重地撞向你，几乎把你撞翻。谢天谢地，她的利爪从你躯干两侧擦过。它们在你的背后锁紧，你的脸被紧紧地按进索菲那令人窒息的巨大双峰中！");
            if(Utils.rand(2) == 0)
            {
               outputText("她愉悦地用它们在你周围晃动，娇嗔道，[say:别反抗了，宝贝。让你的身体顺其自然吧。]");
            }
            else
            {
               outputText("她用长长的指甲穿过你的头发，低语道，[say:为什么要反抗呢？我会让你感觉很舒服的。放松点，玩玩索菲妈妈的奶子吧。]");
            }
            get_player().takeLustDamage(13 + get_player().sens / 10,true);
         }
      }
      
      public function sophieCompulsionAttack() : void
      {
         get_game().sophieBimbo.sophieSprite();
         outputText("索菲张开粗壮的大腿，将四根手指滑入她湿滑的下体。她命令道，[say:为了我摸摸你自己。做个乖宠物，为我自慰吧。]");
         if(get_player().get_inte() < 40 || get_player().get_inte() < 80 && Utils.rand(40) > get_player().get_inte() - 40)
         {
            outputText("当你的手臂不受控制地动起来时，你大声呻吟起来。它们伸进你的[armor]里，抚摸着[eachcock]，爱抚着龟头，并继续揉捏了你一会儿。");
            outputText("即使在重新控制了四肢之后，你也被这番折磨弄得更加欲火焚身。");
            get_player().takeLustDamage(15 + get_player().cor / 20 + get_player().lib / 20,true);
         }
         else
         {
            outputText("你能感觉到她的话语背后带着魔法强迫的力量，但你集中意志力克服了它。");
         }
      }
      
      override public function performCombatAction() : void
      {
         var _loc1_:MonsterAI = new MonsterAI();
         get_game().sophieBimbo.sophieSprite();
         var _loc2_:Boolean = get_player().hasCock() && !bimboBrawl;
         _loc1_.add(talonsSophie,1,!_loc2_,0,FATIGUE_NONE,CombatRange.FlyingMelee);
         _loc1_.add(batterAttackSophie,1,!_loc2_,10,FATIGUE_PHYSICAL,CombatRange.FlyingMelee);
         _loc1_.add(sophieKissAttack,1,!_loc2_,5,FATIGUE_NONE,CombatRange.FlyingMelee);
         _loc1_.add(sophieHarpyBoatsPC,1,_loc2_,0,FATIGUE_NONE,CombatRange.FlyingMelee);
         _loc1_.add(sophieCompulsionAttack,1,_loc2_,10,FATIGUE_MAGICAL,CombatRange.Tease);
         _loc1_.add(eAttack,1,true,0,FATIGUE_NONE,CombatRange.FlyingMelee);
         _loc1_.exec();
      }
      
      override public function defeated(param1:Boolean) : void
      {
         get_game().sophieScene.sophieLostCombat();
      }
      
      public function batterAttackSophie() : void
      {
         get_game().sophieBimbo.sophieSprite();
         var _loc1_:Number = 0;
         outputText("索菲拍打着翅膀向你扑来！根本无法躲避这狂风骤雨般的攻击！");
         outputText("[pg-]她左侧的主翼猛击你的头部！");
         _loc1_ = get_player().reduceDamage(get_str(),this);
         if(_loc1_ < 0)
         {
            _loc1_ = 0;
         }
         get_player().takeDamage(_loc1_,true);
         outputText("[pg-]她右侧那如翅膀般的手臂拍打你的躯干！");
         _loc1_ = get_player().reduceDamage(get_str(),this);
         if(_loc1_ < 0)
         {
            _loc1_ = 0;
         }
         get_player().takeDamage(_loc1_,true);
         outputText("[pg-]她另一只长满羽毛的手臂重拳击中你的肩膀！");
         _loc1_ = get_player().reduceDamage(get_str(),this);
         if(_loc1_ < 0)
         {
            _loc1_ = 0;
         }
         get_player().takeDamage(_loc1_,true);
         outputText("[pg-]她的右翼猛地扇在你的另一侧头部！");
         _loc1_ = get_player().reduceDamage(get_str(),this);
         if(_loc1_ < 0)
         {
            _loc1_ = 0;
         }
         get_player().takeDamage(_loc1_,true);
      }
   }
}

