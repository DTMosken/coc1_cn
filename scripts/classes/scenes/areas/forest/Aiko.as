package classes.scenes.areas.forest
{
   import classes.Appearance;
   import classes.CoC;
   import classes.Creature;
   import classes.PerkLib;
   import classes.Player;
   import classes.StatusEffects;
   import classes._FlagDict.FlagDict_Impl_;
   import classes.internals.MonsterAI;
   import classes.internals.Utils;
   import classes.internals.WeightedChoice;
   import classes.items.ConsumableLib;
   import classes.scenes.combat.AvoidDamageParameters;
   import classes.scenes.combat.CombatAttackBuilder;
   import classes.scenes.combat.CombatRange;
   import flash.Boot;
   import haxe.IMap;
   
   public class Aiko extends BaseKitsune
   {
      
      public var hyperAttacks:Boolean;
      
      public var castIllusion:int;
      
      public var arcaneArcherActive:Boolean;
      
      public function Aiko()
      {
         if(Boot.skip_constructor)
         {
            return;
         }
         hyperAttacks = false;
         arcaneArcherActive = false;
         castIllusion = 0;
         super();
         init();
      }
      
      override public function won(param1:Boolean, param2:Boolean = false) : void
      {
         if(get_player().hasStatusEffect(StatusEffects.Spar))
         {
            get_game().forest.aikoScene.sparWithAikoLose(int(get_lust100()));
         }
         else
         {
            get_game().forest.aikoScene.aikoWinsIntro();
         }
      }
      
      public function splinterLightningArrow() : void
      {
         outputText("爱子将魔法召唤到她的弓里，向你射出一支闪电箭，分裂成许多危险的火花！它们太多了，而且运动轨迹太不规则，你无法躲避！你被击中了！");
         outputText("[pg]你倒在地上，最初的震惊消退后，你的双腿瘫软了。");
         get_player().addCombatBuff("str",-10);
         get_player().addCombatBuff("spe",-10);
         get_player().takeDamage(45 + 25 / (Utils.rand(3) + 1),true);
         if(!get_player().hasStatusEffect(StatusEffects.AikoLightningArrow))
         {
            get_player().createStatusEffect(StatusEffects.AikoLightningArrow,4,0,0,0);
         }
         else
         {
            get_player().addStatusValue(StatusEffects.AikoLightningArrow,1,3);
         }
      }
      
      public function resistIllusion() : void
      {
         var _loc1_:int = calculateAttackResist();
         if(Utils.rand(100) < _loc1_)
         {
            outputText("当周围的世界开始扭曲时，你用你的思想击退了她幻觉的影响！她发出一声痛苦的轻呼，捂着额头，当她意识到你抵抗了她的魔法时，她大声咒骂。[pg]");
            if(get_player().hasStatusEffect(StatusEffects.Illusion))
            {
               get_player().removeStatusEffect(StatusEffects.Illusion);
               addCombatBuff("spe",-3);
            }
         }
         else if(get_player().hasStatusEffect(StatusEffects.Illusion))
         {
            get_player().addCombatBuff("spe",-1);
         }
         else
         {
            get_player().createStatusEffect(StatusEffects.Illusion,0,0,0,0);
            get_player().addCombatBuff("spe",-7);
         }
      }
      
      override public function performCombatAction() : void
      {
         --castIllusion;
         if(get_player().hasStatusEffect(StatusEffects.lustvenom))
         {
            get_player().takeLustDamage(5 + get_player().sens / 5);
            outputText("你感觉自己因为毒箭而变得更加潮红了。[pg]");
         }
         if(get_player().hasStatusEffect(StatusEffects.Illusion))
         {
            resistIllusion();
         }
         if(hyperAttacks)
         {
            hyperAttack2();
            return;
         }
         if(Utils.rand(12) == 0)
         {
            if(!arcaneArcherActive)
            {
               arcaneArcherActivate();
               return;
            }
         }
         var _loc1_:MonsterAI = new MonsterAI().add(eAttack,1,true,0,FATIGUE_NONE,isPure() ? CombatRange.Ranged : CombatRange.Melee);
         _loc1_.add(splinterLightningArrow,1,arcaneArcherActive,10,FATIGUE_MAGICAL,CombatRange.Ranged);
         _loc1_.add(lightArrowCage,1,arcaneArcherActive && isPure(),10,FATIGUE_MAGICAL,CombatRange.Ranged);
         _loc1_.add(iceArrow,1,arcaneArcherActive,10,FATIGUE_MAGICAL,CombatRange.Ranged);
         _loc1_.add(arrowRain,1,arcaneArcherActive,10,FATIGUE_PHYSICAL,CombatRange.Ranged);
         _loc1_.add(arrowBarrage,1,arcaneArcherActive,10,FATIGUE_PHYSICAL,CombatRange.Ranged);
         _loc1_.add(kitsuneSealPhysical,1,arcaneArcherActive,10,FATIGUE_MAGICAL,CombatRange.Ranged);
         _loc1_.add(kitsuneSealMagic,1,get_player().hasStatusEffect(StatusEffects.Illusion) && isPure(),10,FATIGUE_MAGICAL,CombatRange.Ranged);
         _loc1_.add(aikoBasic,1,isPure(),0,FATIGUE_NONE,CombatRange.Ranged);
         _loc1_.add(aikoCorruptBasic,1,!isPure(),0,FATIGUE_NONE,CombatRange.Ranged);
         _loc1_.add(aikoDarkFoxfire,1,!isPure(),10,FATIGUE_MAGICAL,CombatRange.Ranged);
         _loc1_.add(aikoTerrorize,1,!isPure(),10,FATIGUE_MAGICAL,CombatRange.Ranged);
         _loc1_.add(aikoTomahawk,1,!isPure(),10,FATIGUE_MAGICAL,CombatRange.Ranged);
         _loc1_.add(aikoIllusionLust,1,get_player().hasStatusEffect(StatusEffects.Illusion) && !isPure(),10,FATIGUE_MAGICAL,CombatRange.Ranged);
         _loc1_.add(aikoTease,1,!isPure(),10,FATIGUE_MAGICAL,CombatRange.Tease);
         _loc1_.add(hyperAttack1,0.1,arcaneArcherActive,10,FATIGUE_MAGICAL,CombatRange.Ranged);
         _loc1_.exec();
      }
      
      public function lightArrowCage() : void
      {
         outputText("爱子紧闭双唇，吃力地呻吟着，召唤出数量惊人的纯光之箭！箭矢多得让你咬紧牙关，你发现自己完全被一个准备将你射穿的箭笼包围了！\n它们同时发动攻击，向位于中心的你汇聚！");
         if(get_player().isCorruptEnough(40))
         {
            outputText("[pg]由于你的腐化程度很高，光芒灼烧着你的皮肤，带来难以置信的痛苦。");
            get_player().takeDamage(2 * (80 + get_player().cor),true);
         }
         else
         {
            get_player().takeDamage(1.2 * (80 + get_player().cor),true);
         }
         arcaneArcherActive = false;
      }
      
      public function kitsuneSealPhysical() : void
      {
         sealTypes = [0,1,3,4,5];
         kitsuneSealAttack();
      }
      
      public function kitsuneSealMagic() : void
      {
         sealTypes = [2,4,6];
         kitsuneSealAttack();
      }
      
      public function isPure() : Boolean
      {
         return get_game().forest.aikoScene.get_aikoCorruption() < 50;
      }
      
      public function init() : void
      {
         set_a("");
         set_short("Aiko");
         imageName = "aiko";
         if(isPure())
         {
            set_long("爱子站在你面前，身高略超五英尺四英寸。她留着一头短短的银白金发，发梢垂至肩上方，被两只蓬松的大狐狸耳朵从中分开。" + (FlagDict_Impl_.arrayReadInt(get_flags(),2370) > 0 ? "八" : "七") + "条华美的狐狸尾巴在她身后轻摆，丝滑的皮毛随之闪烁光泽。她身着一套若隐若现的蓝白色长袍，熨烫平整，用心地挂在身上，D罩杯的双乳被一条略显过紧的布制胸带束缚着。她的脸庞与身体上点缀着数处红色\"纹身\"，其中最为显眼的是掌心与臀部的螺旋纹样，以及腰间的莲花式图案。她手持一把几乎与自身等高的长弓，只需弹指即可召出或收回，那双闪烁着湛蓝光芒的眼睛正穿过坚毅的火焰紧盯着你。");
         }
         else
         {
            set_long("爱子站在你面前，身高略超五英尺四英寸。她留着一头蓬乱的短银白金发，发梢垂至肩上方，被两只大狐狸耳朵从中分开。" + (FlagDict_Impl_.arrayReadInt(get_flags(),2370) > 0 ? "八" : "七") + "条狐狸尾巴在她身后摇摆，毛发凌乱纠结。她身着一套破烂的、沾满血迹的长袍，大片肌肤裸露在外，D罩杯的双乳随意地以一圈急需更换的绷带束起，即便隔着距离你也能闻到她身上混杂着性爱与暴力的气息。她的脸庞与身体上点缀着数处红色\"纹身\"，其中最为显眼的是掌心与臀部的螺旋纹样，以及腰间的莲花式图案。她手持一把超大号的钩镰斧，只需弹指即可召出或收回，那双疯狂的蓝色眼睛正穿过癫狂的火焰紧盯着你。");
         }
         set_race("Kitsune");
         createVagina(false,1,0);
         createStatusEffect(StatusEffects.BonusVCapacity,200,0,0,0);
         createBreastRow(Appearance.breastCupInverse("D"));
         ass.analLooseness = 0;
         ass.analWetness = 0;
         createStatusEffect(StatusEffects.BonusACapacity,40,0,0,0);
         set_tallness(64);
         hips.rating = 6;
         butt.rating = 5;
         skin.tone = "light tan";
         hair.color = "silver-blonde";
         hair.length = 10;
         initStrTouSpeInte(25,30,90,100);
         initLibSensCor(40,65,get_game().forest.aikoScene.get_aikoCorruption());
         set_weaponName(!isPure() ? "钩嘴斧" : "长弓");
         set_weaponVerb(!isPure() ? "slash" : "shot");
         if(isPure())
         {
            normalAttackAvoid.doParry = false;
            normalAttackAvoid.doCounter = false;
         }
         set_armorName(!isPure() ? "ragged, bloodied robes" : "revealing blue and white robes");
         set_armorDef(16);
         bonusHP = 350;
         set_lust(25);
         lustVuln = 0.4;
         temperment = !isPure() ? 3 : 1;
         if(FlagDict_Impl_.arrayReadInt(get_flags(),2370) > 0)
         {
            level = 28;
            tail.venom = 8;
         }
         else
         {
            level = 18;
            tail.venom = 7;
         }
         set_gems(Utils.rand(10) + 30);
         set_drop(new WeightedChoice(get_consumables().FOXJEWL,1));
         tail.type = 13;
         ears.type = 9;
         createPerk(PerkLib.SpellcastingAffinity,25);
         checkMonster();
      }
      
      public function iceArrow() : void
      {
         outputText("爱子迅速在身前呈弧形射出一阵箭雨，它们由纯冰构成，在身后留下一条巨大的冰迹，因此危险程度翻倍！[pg]");
         if(Boolean(get_game().combat.combatAvoidDamage(new AvoidDamageParameters(true,false,false,null,null,null,null,null)).attackFailed))
         {
            outputText("你险险避开箭雨，看着最后一支箭呼啸而过，伴随着巨大的“砰”声，深深扎进空地另一端的一棵树里，瞬间将半棵树冻结。");
         }
         else
         {
            outputText("你被其中一支冰箭击中，冰霜迅速在箭矢周围的皮肤上蔓延[if (hasarmor){ ，并冻结了你的护甲}]。");
            get_player().addCombatBuff("spe",-15);
            get_player().takeDamage(get_str() * 2 + Utils.rand(40),true);
         }
      }
      
      public function hyperAttack2() : void
      {
         outputText("你看到爱子聚集了巨大的能量，她拉开弓弦，随着她金色的光环向外延伸，她的纹身开始发出诡异的光芒。当她瞄准你时，她显然在酝酿极其危险的攻击。你可以听到她慢慢将弓拉到极限时微弱的低语，[say: 以箭为心之焦点，我抛却一切凡尘杂念，手握这道光芒……] 一支你见过的最纯粹的光之箭成型了，搭在弦上，蓄势待发！[pg]");
         if(FlagDict_Impl_.arrayReadInt(get_flags(),22) == 1)
         {
            outputText("[say: 我要惩罚这个世界上的每一个恶魔！] 随着她完成咒语，她松开弓弦，释放出一道巨大的金白色光束，直奔你而来！退后一步看看情况是个明智的选择！当你看到身后的森林被完全摧毁时，你通过翻滚险险避开了攻击。爱子站在你面前，一言不发，她显然没料到你能躲开她的攻击。");
         }
         else
         {
            outputText("[say: 我要惩罚这个世界上的每一个恶魔！] 随着她完成咒语，她松开弓弦，释放出一道巨大的金白色光束，直奔你而来！哦，该死！你几乎没有时间睁大眼睛，就被巨大的能量团轰飞了，当你重重地摔在地上时，它似乎要将你彻底抹杀，你全身都在冒烟。");
            get_player().addCombatBuff("spe",-20);
            get_player().addCombatBuff("str",-15);
            if(get_player().isPureEnough(20))
            {
               get_player().takeDamage(250,true);
            }
            else
            {
               get_player().takeDamage(350,true);
            }
            if(get_player().get_HP() > 0)
            {
               outputText("你勉强在爆炸中幸存下来，发现爱子正目瞪口呆地看着你。[pg][say: 你是怎么……这不可能！][pg]" + (get_player().isPureEnough(20) ? "[say: 除非你真的内心纯洁，否则那应该已经把你轰成渣了！]" : ""));
            }
         }
         arcaneArcherActive = false;
         hyperAttacks = false;
      }
      
      public function hyperAttack1() : void
      {
         outputText("你注意到爱子没有攻击，似乎在准备什么大招！她低头看着弓，低声念诵着咒语，此刻完全无视了你。");
         hyperAttacks = true;
      }
      
      override public function handleFear() : Boolean
      {
         if(!isPure())
         {
            removeStatusEffect(StatusEffects.Fear);
            outputText("爱子高兴地颤抖了一下，然后头脑清醒地看向你。[say: 我喜欢那样！你应该多做几次！]\n");
            return true;
         }
         if(Utils.rand(3) == 0)
         {
            removeStatusEffect(StatusEffects.Fear);
            outputText("爱子颤抖了一下，然后头脑清醒地皱着眉头看向你。[say: 我现在真庆幸我接受过训练……那真是太可怕了！]\n");
            return true;
         }
         return false;
      }
      
      override public function handleBlind() : Boolean
      {
         outputText("[say: 你的花招对我没用，勇者，我一眼就看穿了。] 你的致盲攻击在她的魔法面前直接消散了。");
         return true;
      }
      
      override public function defeated(param1:Boolean) : void
      {
         if(get_player().hasStatusEffect(StatusEffects.Spar))
         {
            get_game().forest.aikoScene.sparWithAikoWin();
         }
         else
         {
            get_game().forest.aikoScene.aikoLosesIntro();
         }
      }
      
      public function arrowRain() : void
      {
         var _loc4_:int = 0;
         var _loc1_:int = Utils.rand(4) + 2;
         outputText("爱子搭上一连串由纯光构成的箭矢，将它们射向空中！冰雹般的箭雨倾泻而下，将你刺穿了 " + _loc1_ + " 次！幸运的是，这些箭纯粹是魔法构成的，很快就消失了。");
         var _loc2_:int = 0;
         var _loc3_:int = _loc1_;
         while(_loc2_ < _loc3_)
         {
            _loc4_ = _loc2_++;
            get_player().takeDamage(get_str() + Utils.rand(15),true);
         }
      }
      
      public function arrowBarrage() : void
      {
         var _loc4_:int = 0;
         var _loc1_:int = Utils.rand(3) + 3;
         outputText("爱子释放出一阵箭雨，它们以机枪般的速度击中你！你几乎没有时间反应，该死，她太快了！");
         var _loc2_:int = 0;
         var _loc3_:int = _loc1_;
         while(_loc2_ < _loc3_)
         {
            _loc4_ = _loc2_++;
            if(Boolean(get_game().combat.combatAvoidDamage(new AvoidDamageParameters(true,false,false,null,null,null,null,null)).attackHit))
            {
               get_player().takeDamage(get_str() + Utils.rand(10),true);
               get_player().addCombatBuff("spe",-2);
               get_player().bleed(this);
            }
         }
      }
      
      public function arcaneArcherActivate() : void
      {
         outputText("[say: 我会向你展示我作为守护者的训练……你能承受我的魔法和弓箭吗？让我们拭目以待，] 她说。你几乎把她的话当成了玩笑，但你能清楚地看到她的决心，而且她有实力支撑她的态度！");
         outputText("[pg]你看到她的身体被金色的光环包围，不时有黄白色的火花从她身上迸发出来，她看起来有点吓人！[pg]");
         arcaneArcherActive = true;
         addCombatBuff("str",10);
         addCombatBuff("spe",10);
      }
      
      public function aikoTomahawk() : void
      {
         if(Boolean(combatAvoidDamage(new AvoidDamageParameters(true,false,false,null,null,null,null,null)).attackFailed))
         {
            outputText("爱子向后退去，用尽全力将武器向你掷来！谢天谢地，这一击打偏了，刀刃最终插在树干上，而不是你的胸膛上。[say: 别他妈跟我玩欲擒故纵！]她愤怒地大喊，打了个响指，将武器召唤回手中，仍然愤怒地跺着脚。");
         }
         else
         {
            outputText("爱子向后退去，用尽全力将武器向你掷来！那把看起来很邪恶的刀刃在空中划过，巨大的冲击力让你踉跄了一下！她看着你痛苦地挣扎着想要拔出它，发出施虐般的笑声，随着她打了个响指，它在一阵烟雾中消失了，再次出现在她的手中。");
            get_player().takeDamage(int(get_str()) + Utils.rand(15),true);
         }
      }
      
      public function aikoTerrorize() : void
      {
         outputText("爱子停顿了一下，咕哝着一句咒语，朝你的方向打了个响指。你视野的边缘变黑了，你突然发现自己被无数无法形容的异界恐怖所包围！虽然你的眼睛看不见它们，但你的大脑不知何故能感觉到那些可怕的怪物正挤在你周围，威胁要吞噬你的本质……");
         var _loc1_:int = 0;
         if(get_player().get_inte() < 50 + get_player().level)
         {
            _loc1_ = int(Math.round(get_player().get_inte() / 55 * 30));
         }
         else
         {
            _loc1_ = 25;
         }
         if(get_player().hasPerk(PerkLib.Whispered))
         {
            _loc1_ += 35;
         }
         else
         {
            outputText("你内心深处的一小部分知道这不可能是真的，但你现在太害怕了，不敢采取行动！");
         }
         if(get_player().isReligious() && get_player().isPureEnough(20))
         {
            _loc1_ += int(15 - get_player().corAdjustedDown());
         }
         if(Utils.rand(100) < _loc1_)
         {
            outputText("[pg]爱子低声念着咒语，但当黑暗开始向你逼近时，你用你的意志力击退了她幻觉的影响！她发出一声痛苦的尖叫，捂住额头，但随后又疯狂地笑了起来。[say: 觉得你很聪明，是吗？]");
            if(get_player().hasStatusEffect(StatusEffects.Fear))
            {
               get_player().removeStatusEffect(StatusEffects.Fear);
            }
         }
         else if(get_player().hasStatusEffect(StatusEffects.Fear))
         {
            get_player().addCombatBuff("spe",-4);
         }
         else
         {
            get_player().createStatusEffect(StatusEffects.Fear,0,0,0,0);
            get_player().addCombatBuff("spe",-10);
         }
      }
      
      public function aikoTease() : void
      {
         var _loc1_:int = Utils.rand(4);
         switch(_loc1_)
         {
            case 0:
               outputText("爱子转过身，把尾巴拨到一边，露出丰满的臀部，展示着她那诱人脸颊上的螺旋状纹身和下背部的莲花纹身。她的展示让血液涌向你的腹股沟，让你急切地舔了舔嘴唇。");
               break;
            case 1:
               outputText("爱子停顿了片刻，将一只手放在她紧绷的腹肌上，手指慢慢向下滑动，羞涩地凝视着你的眼睛。她的尾巴在她周围散开，诱惑地缠绕在她的四肢上，当她看着你的身体因欲望而颤抖时，她给了你一个轻浮的眼神。");
               break;
            case 2:
               outputText("爱子花了一点时间伸展她柔软的身体，双臂伸向天空，挺起胸膛。她像个小女孩一样转了一圈，给了你一个勾引的眼神，然后向前鞠躬，让你能清楚地看到她那被过小的裹胸紧紧包裹的乳沟。");
               break;
            case 3:
               outputText("[say: 你知道，我们不必战斗……你难道不想来摸摸我超级毛茸茸的尾巴吗？]爱子戏弄道，一只手顺着她的尾巴抚摸，让它们诱惑地在她周围散开。你发现自己在想阻止自己之前就已经在点头了——是的，你<i>确实</i>想要毛茸茸的尾巴！");
         }
         var _loc2_:int = 8 + int(get_player().sens / 5);
         get_player().takeLustDamage(_loc2_);
      }
      
      public function aikoIllusionLust() : void
      {
         var _loc1_:int = Utils.rand(6);
         var _loc2_:int = 11 + int(get_player().sens / 5);
         if(get_player().hasStatusEffect(StatusEffects.Illusion))
         {
            outputText("爱子的一系列幻影包围了你！你试图找到真正的那个，但你太慢了！一支箭从侧面射来，刺穿了你！");
            get_player().takeDamage(int(get_str() / 2) + Utils.rand(15),true);
            switch(_loc1_)
            {
               case 0:
                  outputText("[pg]你攻击爱子，但她的身影只是一个幻觉！她出现在你身后，迅速射出一箭，她射中你了！但是……她做了什么？！你感觉到腹股沟一阵刺痛，那支箭上涂抹了某种催情毒液！");
                  if(!get_player().hasStatusEffect(StatusEffects.lustvenom))
                  {
                     get_player().createStatusEffect(StatusEffects.lustvenom,0,0,0,0);
                  }
                  break;
               case 1:
                  outputText("[pg][say: 这是我的领域……在我的领域里……你会感觉很舒服的……] 她奇怪的话语诱惑着你，你睁大了眼睛，试图攻击她，但似乎总是打不中。她露出调皮的笑容，你感觉到有什么东西在摩擦你的胯部，是她的一条尾巴！哦，该死，感觉太爽了！");
                  get_player().takeLustDamage(_loc2_);
                  if(get_player().hasStatusEffect(StatusEffects.Illusion))
                  {
                     get_player().addCombatBuff("spe",-3);
                     break;
                  }
                  get_player().createStatusEffect(StatusEffects.Illusion,0,0,0,0);
                  get_player().addCombatBuff("spe",-7);
                  castIllusion += 2;
            }
         }
         else if(_loc1_ == 3)
         {
            outputText("爱子转过身，把尾巴拨到一边，露出丰满的臀部，展示着她那诱人脸颊上的螺旋状纹身和下背部的莲花纹身。她的展示让血液涌向你的腹股沟，让你急切地舔了舔嘴唇。");
            outputText("[pg]爱子停顿了一下，把手放在紧绷的腹肌上，手指慢慢向下滑动，羞涩地深情凝视着你的眼睛。她的尾巴在周围散开，诱惑地缠绕在她的四肢上，看着你因欲望而颤抖的身体，她向你抛了个媚眼。");
            get_player().takeLustDamage(_loc2_ * 2);
         }
         else if(_loc1_ == 4)
         {
            outputText("爱子邪恶地看着你，你发现自己被许多个爱子包围了！[say: 你想要反向轮奸吗，大男孩？] 所有的爱子都诱惑地抓住被束缚的乳房，褪下裤子，她们耻骨丘上的纹身将你的注意力吸引到她们最私密的部位。");
            outputText("[pg]在你分心的时候，你没有注意到爱子对你施放了幻术！");
            get_player().takeLustDamage(_loc2_ * 2);
            if(get_player().hasStatusEffect(StatusEffects.Illusion))
            {
               get_player().addCombatBuff("spe",-3);
            }
            else
            {
               get_player().createStatusEffect(StatusEffects.Illusion,0,0,0,0);
               get_player().addCombatBuff("spe",-7);
            }
         }
         else
         {
            outputText("爱子花了一点时间伸展她柔软的身体，双臂伸向天空，挺起胸膛。她像个小女孩一样转了一圈，给了你一个勾引的眼神，然后向前鞠躬，让你能清楚地看到她那被过小的裹胸紧紧包裹的乳沟。");
            outputText("[pg][say: 你知道，我们不必战斗……你难道不想来摸摸我超级毛茸茸的尾巴吗？] 爱子戏弄道，用手抚摸着她的尾巴，让它们在周围诱惑地散开。你发现自己在想停下来之前就已经在点头了——是的，你确实想要毛茸茸的尾巴！");
         }
         get_player().takeLustDamage(_loc2_);
      }
      
      public function aikoIllusion() : void
      {
         if(castIllusion < 1)
         {
            outputText("爱子用一种奇怪的语言低语着咒语，现实似乎在她周围扭曲和变形。这会让你更难击中她！[pg]");
            castIllusion += 2;
         }
         else
         {
            outputText("爱子再次低语她的咒语，你对周围环境本已扭曲的感知更加严重。加上重力的突然变化，她的幻觉魔法让你像喝醉了一样跌跌撞撞，努力让爱子保持在你的视线中。像这样几乎不可能击中她！[pg]");
            castIllusion += 2;
         }
         if(get_player().hasStatusEffect(StatusEffects.Illusion))
         {
            get_player().addCombatBuff("spe",-3);
         }
         resistIllusion();
      }
      
      public function aikoFoxfire() : void
      {
         outputText("爱子的手指在空中画圈，召唤出一团淡蓝色的火焰。随着她手掌向前推，它像导弹一样射向你，在撞击时爆炸！火焰吞噬你时剧烈燃烧，同时让你的身体充满了令人瘫痪的快感，让你的皮肤泛红。");
         get_game().combat.monsterDamageType = "Fire";
         var _loc1_:int = int(2 * (get_str() + Utils.rand(30)));
         get_player().takeDamage(_loc1_,true);
         get_player().takeLustDamage(15 + get_player().sens / 5,true);
      }
      
      public function aikoFireArrow() : void
      {
         outputText("爱子在弓上搭上一支箭，瞄准目标，集中注意力时咬着舌尖。当她射出箭时，箭头火花四溅，然后燃起火焰！");
         if(!playerAvoidDamage(new AvoidDamageParameters(true,false,false,null,false,null,null,null)))
         {
            outputText("燃烧的黑曜石箭头像热刀切黄油一样刺穿你的[armor]，陷入你的肉里，迫使你的喉咙发出一声痛苦的叫喊。");
            get_game().combat.monsterDamageType = "Fire";
            get_player().takeDamage((arcaneArcherActive ? 2 * (get_str() + Utils.rand(40)) : get_str() + Utils.rand(40)) + 30,true);
            get_player().addCombatBuff("spe",-5);
         }
      }
      
      public function aikoDarkFoxfire() : void
      {
         outputText("爱子的手指在空中画圈，召唤出一团腐败的紫色火焰。她将上半身扭曲成击球手的姿势，凶猛地向你击打，让火球像导弹一样射向你，在撞击时爆炸！火焰吞噬你时剧烈燃烧，但它燃烧得越厉害，你就越开始喜欢它。");
         get_game().combat.monsterDamageType = "Fire";
         get_player().takeDamage(int(get_str() / 2) + Utils.rand(15),true);
         if(get_player().hasPerk(PerkLib.Masochist))
         {
            get_player().takeLustDamage(15 + get_player().sens / 5);
         }
         else
         {
            get_player().takeLustDamage((10 + get_player().sens / 5) * 2);
         }
      }
      
      public function aikoCorruptBasic() : void
      {
         var _loc2_:int = 0;
         outputText("[say: 砍！劈！残废！杀！这不是最他妈棒的吗？！] 爱子发出一阵精神病般的笑声，不顾一切地向你发起攻击。[pg][say: 撕裂！开膛！肢解！] 爱子在每一次鲁莽的挥击中吟唱着。[say: 有没有注意到所有最好的词都以 -ate 结尾？！][pg][say: 你知道我会为你流血！] 她大喊着，疯狂地笑着，用她的钩镰枪砍你。[say: 现在你也会做同样的事！]");
         var _loc1_:CombatAttackBuilder = new CombatAttackBuilder().canBlock().canParry().canDodge();
         _loc1_.setCustomBlock("[pg][say: 乖乖别动，我保证会让你痛得很爽的！] 当你用[shield]挡下爱子凶猛的攻击时，她大喊道。");
         _loc1_.setCustomParry("[pg][say: 乖乖别动，我保证会让你痛得很爽的！] 当你用[weapon]招架爱子的攻击时，她大喊道。");
         _loc1_.setCustomAvoid("[pg][say: 乖乖别动，我保证会让你痛得很爽的！] 当你凭借高超的战斗技巧躲开爱子凶猛的攻击时，她大喊道。");
         if(_loc1_.executeAttack().isSuccessfulHit())
         {
            _loc2_ = int(get_str()) + Utils.rand(15);
            get_player().takeDamage(_loc2_,true);
            get_player().addCombatBuff("spe",-4);
            get_player().bleed(this);
         }
      }
      
      public function aikoBasic() : void
      {
         var _loc1_:int = int(get_str()) + Utils.rand(15);
         outputText("爱子搭上一支箭，射了出去");
         var _loc2_:Array = ["[BLIND]，它消失在了树林中。","[SPEED]，它消失在了树林中。","[EVADE]，它消失在了树林中。","[MISDIRECTION]，它消失在了树林中。","[FLEXIBILITY]，它消失在了树林中。","[UNHANDLED]，它消失在了树林中。","[BLOCK]，你及时举起盾牌挡开了它！"];
         if(Utils.rand(5) == 0)
         {
            outputText("，紧接着又射出一支！");
            get_player().takeDamage(_loc1_ - Utils.rand(10),true);
            get_player().takeDamage(_loc1_ - Utils.rand(9),true);
            get_player().addCombatBuff("spe",-4);
            get_player().bleed(this);
         }
         else if(!playerAvoidDamage(new AvoidDamageParameters(true,false,true,null,false,null,null,null),_loc2_))
         {
            if(get_player().get_armorDef() > 4 && Utils.rand(3) == 0)
            {
               outputText("！你躲避着即将到来的冲击，但它以一个角度击中，从你的[armor]上擦过，滚进了树林。");
               get_player().takeDamage(_loc1_ - get_player().get_armorDef() * 2,true);
            }
            else
            {
               outputText("带着致命的精准！它痛苦地从你的身体里凸出来，让你很难四处走动。");
               get_player().takeDamage(_loc1_,true);
               get_player().addCombatBuff("spe",-4);
               get_player().bleed(this);
            }
         }
      }
   }
}

