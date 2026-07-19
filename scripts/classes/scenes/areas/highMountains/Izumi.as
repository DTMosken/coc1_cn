package classes.scenes.areas.highMountains
{
   import classes.Appearance;
   import classes.CoC;
   import classes.Creature;
   import classes.Monster;
   import classes.Player;
   import classes.ReactionContext;
   import classes.StatusEffects;
   import classes._FlagDict.FlagDict_Impl_;
   import classes.internals.MonsterAI;
   import classes.internals.Utils;
   import classes.scenes.combat.AvoidDamageParameters;
   import classes.scenes.combat.CombatRange;
   import flash.Boot;
   import haxe.IMap;
   import haxe.Log;
   
   public class Izumi extends Monster
   {
      
      public var combatDebug:Boolean;
      
      public function Izumi()
      {
         if(Boot.skip_constructor)
         {
            return;
         }
         combatDebug = true;
         super();
         set_a("");
         set_short("Izumi");
         imageName = "izumi";
         set_long("你正在与巨大的鬼族和泉战斗。她身高约9英尺，几乎只用拳头作为武器，是力量与威力的化身。她穿着一件暴露的蓝白相间的和服，这件衣服将你的目光吸引到她巨大的双乳和完美雕塑般的大腿上。一根奇特的角从她的头上突出，其纹理几乎与洞穴内部的岩石融为一体。\n\n她脸上挂着明显的傲慢笑容，全神贯注地盯着你。");
         set_race("Oni");
         createVagina(false,3,1);
         createBreastRow(Appearance.breastCupInverse("FF"));
         ass.analLooseness = 1;
         ass.analWetness = 0;
         set_tallness(108);
         hips.rating = 4;
         butt.rating = 2;
         skin.tone = "creamy-white";
         hair.color = "golden";
         hair.length = 25;
         initStrTouSpeInte(110,90,90,80);
         initLibSensCor(30,25,15);
         set_weaponName("fist");
         set_weaponVerb("punch");
         set_armorName("silken kimono");
         bonusHP = 660;
         set_lust(10);
         lustVuln = 0.33;
         temperment = 3;
         level = 22;
         set_gems(25 + Utils.rand(25));
         additionalXP = 75;
         set_drop(NO_DROP);
         checkMonster();
      }
      
      override public function won(param1:Boolean, param2:Boolean = false) : void
      {
         var _loc3_:IMap = get_flags();
         FlagDict_Impl_.arrayWriteInt(_loc3_,1040,FlagDict_Impl_.arrayReadInt(_loc3_,1040) + 1);
         if(get_player().hasStatusEffect(StatusEffects.Titsmother))
         {
            cleanup();
            get_game().highMountains.izumiScenes.deathBySnuSnuIMeanGiantOniTits();
            return;
         }
         cleanup();
         get_game().highMountains.izumiScenes.fuckedUpByAFuckhugeOni();
      }
      
      public function titSmotherStruggle() : void
      {
         var _loc1_:Boolean = false;
         if(Utils.rand(get_player().get_str()) > get_str() / 4)
         {
            _loc1_ = true;
         }
         if(_loc1_)
         {
            titSmotherEscape();
         }
         else
         {
            if(Utils.rand(2) == 0)
            {
               clearOutput();
               outputText("[say: 哈！说晚安吧，因为我要把你打到窒息！] 她兴奋地喊道，强行将你的脸按进她的胸膛。看来她是想掐死你，但只有一只手让这事变得很困难。你呼吸完全没问题，但脸被迫埋在眼前不断晃动的肉团里，至少可以说非常让人分心。[pg]");
               outputText("你拼命地在和泉的钳制下挣扎，努力不去想你的手放在了哪里，或者身下的肉有多么柔软顺从，又或者其他许多让人心烦意乱的小细节——但都无济于事。和泉的力气大得惊人。你被挂在那里一会儿，试图喘口气再试一次，而和泉则从四面八方挤压、推搡着你。");
            }
            else
            {
               clearOutput();
               if(get_player().hasCock())
               {
                  outputText("被紧贴着如此温暖肉体的感觉所冲击，你已经能感觉到[eachCock]开始不受控制地变硬。你那逐渐坚挺的勃起");
                  if(get_player().totalCocks() > 1)
                  {
                     outputText("");
                  }
                  outputText("只会让事情变得更加难以忍受，因为当");
                  if(get_player().totalCocks() > 1)
                  {
                     outputText("它们变得");
                  }
                  else
                  {
                     outputText("它变得");
                  }
                  outputText("越硬，你的");
                  if(get_player().totalCocks() > 1)
                  {
                     outputText("勃起就越是跳动");
                  }
                  else
                  {
                     outputText("勃起就越是跳动");
                  }
                  outputText("，紧紧贴在和泉的腹肌上。当她努力将你固定在她的掌控中时，她的肌肉起伏波动，腹肌收缩、碰撞、环绕着你坚挺的勃起");
                  if(get_player().totalCocks() > 1)
                  {
                     outputText("");
                  }
                  outputText("，进一步刺激着你。你在恐慌中意识到，如果你不尽快摆脱这种局面，你可能真的会……");
               }
               else
               {
                  outputText("和泉的胸部从四面八方包围着你，让你感觉自己像是被困在某种乳房石棺里。柔软肉体散发出的热量，与和泉之前抽的某种奇怪药物的气味混合在一起，现在像某种令人陶醉的香水一样萦绕在她周围。");
               }
            }
            get_player().takeLustDamage(get_player().lib / 15 + 5 + Utils.rand(5),true);
         }
         tookAction = true;
      }
      
      public function titSmotherEscape() : void
      {
         clearOutput();
         if(get_player().get_str() < 90)
         {
            outputText("你用尽全力挣扎，仍然无法挣脱和泉的束缚，但你确实设法从她胸部的沟壑中向上滑行。和泉的脸庞映入眼帘，这个巨大的女人咬紧牙关，试图粉碎你的反抗。在绝望中，你向后仰起，然后像刀子一样向前猛烈地头槌。[pg]");
            outputText("[say: 呃！] 你的额头撞上了她的下巴，从你额头传来的灼痛感来看，这次碰撞对你的伤害可能和她一样大。与此同时，和泉踉跄着后退，揉着下巴。[say: 哎哟。好痛啊，小鬼！] 她责备地说。你们俩花了一点时间摇晃着脑袋，试图清醒过来，然后再次摆出战斗姿态，这次稍微警惕了一些。[pg]");
         }
         else
         {
            outputText("你将双臂锁在和泉的肩膀上，用尽全力对抗这个肌肉发达的鬼族女孩的锁喉。你能感觉到她的手臂在努力抓住你，挣扎着抵抗，逐渐退让……");
            if(get_player().isBiped())
            {
               outputText("一有机会，你就抬起双腿，将脚牢牢地踩在和泉的肚子上，用腿部肌肉增加力量。");
            }
            outputText("和泉咬紧牙关，咆哮着，用尽全力拉扯，试图迫使你的四肢屈服，但无济于事——随着最后一次推力，和泉发出一声惊呼，你把她的手臂推开并跳开了。和泉转了转手臂，揉了揉肩膀，若有所思地看着你。然后她伸出一只手在脸前扇了扇，露出那种充满暗示的笑容。[pg]");
         }
         outputText("[say: 哦天哪，] 她淫荡地发出咕噜声。[say: 你还真是令人印象深刻呢？继续这样给我惊喜，我可能就会忘记这个让步了……]");
         cleanupTitsmother();
         var _loc1_:Number = 15 + Utils.rand(get_player().get_str());
         set_HP(get_HP() - _loc1_);
         outputText("<b>(<font color=\"" + get_game().mainViewManager.colorHpMinus() + "\">" + _loc1_ + "</font>)</b>");
         tookAction = true;
      }
      
      public function titSmother() : void
      {
         outputText("鬼族女人突然爆发出一阵速度，像公牛一样向你冲来，一巴掌拍开了你仓促的防御。你做好了迎接猛烈撞击的准备，但她并没有打你，而是将手臂径直从你头侧穿过。你困惑地转过头去顺着她的拳头看去，刚好看到她弯起手肘，用力将你拉向她。突如其来的拉扯让你双脚离地，你重重地撞");
         if(get_player().hasMuzzle())
         {
            outputText("嘴巴-");
         }
         else
         {
            outputText("脸-");
         }
         outputText("直直地撞进了和泉的怀里——准确地说，是撞进了她的胸膛。脸突然被塞进和泉那柔软如枕的胸部，你震惊地想要后退，却又被和泉的手臂狠狠地按回了那片高耸的峰峦之中。");
         get_player().createStatusEffect(StatusEffects.Titsmother,0,0,0,0);
         get_player().takeLustDamage(get_player().lib / 15 + 5 + Utils.rand(5),true);
      }
      
      override public function struggle() : void
      {
         if(get_player().hasStatusEffect(StatusEffects.Chokeslam))
         {
            chokeslamStruggle();
            return;
         }
         if(get_player().hasStatusEffect(StatusEffects.Titsmother))
         {
            titSmotherStruggle();
         }
      }
      
      public function straightJab() : void
      {
         outputText("和泉闪电般地伸出空着的手，直取你的头部。");
         var _loc1_:int = get_player().reduceDamage(get_str() + 175,this);
         if(Boolean(combatAvoidDamage(new AvoidDamageParameters(true,true,false,null,null,null,null,null)).attackFailed))
         {
            outputText("你灵巧地躲过了这快如闪电的一拳。");
         }
         else if(_loc1_ <= 0)
         {
            outputText("你猛地反击，在她的拳头打中你之前将其格挡开来。");
         }
         else
         {
            outputText("她的拳头结结实实地砸在你的下巴上，发出一声脆响，将你击飞到洞穴的另一端。和泉得意地看着你");
            if(get_player().hasTailInsteadOfLegs())
            {
               outputText("重新站稳你的[legs]");
            }
            else
            {
               outputText("站起身来");
            }
            outputText("并拍了拍身上的灰尘。");
            get_player().takeDamage(_loc1_,true);
         }
      }
      
      public function roundhouseKick() : void
      {
         outputText("和泉单脚向后跃起，在空中旋转，踢出一记雷霆万钧的回旋踢。幸运的是，你及时低头，躲过了这原本会是毁灭性的一击。不幸的是，当和泉的腿从你头顶呼啸而过时，你的目光自然而然地顺着她大腿肌肉的线条看去，直到你直勾勾地盯着和泉那越来越不实用的和服下飘动的褶皱。[pg]");
         if(get_player().cor >= 50 || get_player().lib >= 50 || get_player().sens >= 50)
         {
            outputText("你向后倒去，踉跄着退开，已经感觉到脸颊泛起一阵红晕，努力把思绪拉回战斗，远离……其他事情。");
            get_player().takeLustDamage(10 + get_player().lib / 10,true);
         }
         else
         {
            outputText("你对鬼族这毫无效果的攻击皱起了眉头，不太确定她到底是想伤害你还是想挑逗你。不过她的大腿看起来确实相当诱人……");
            get_player().takeLustDamage(5 + get_player().lib / 20,true);
         }
      }
      
      override public function react(param1:ReactionContext) : Boolean
      {
         if(param1.index == 3)
         {
            if(get_player().hasStatusEffect(StatusEffects.Chokeslam))
            {
               clearOutput();
               outputText("和泉把你举在半空中，你的双脚在空中无力地晃荡。为什么要反抗呢？她实在是太<i>强壮</i>了，她的手指把你的脖子完全包裹住了……");
               if(get_game().ceraphScene.hasBondage())
               {
                  outputText("老实说，这种被紧紧抓住的感觉也并非完全不愉快。要是和泉别再玩弄你，直接<i>占有你</i>就好了。");
                  get_player().takeDamage(75 + Utils.rand(15),true);
                  get_player().takeLustDamage(5,true);
               }
               else
               {
                  get_player().takeDamage(75 + Utils.rand(15),true);
               }
               tookAction = true;
               return false;
            }
            if(get_player().hasStatusEffect(StatusEffects.Titsmother))
            {
               clearOutput();
               if(combatDebug)
               {
                  Log.trace("Waiting during TitSmother",{
                     "fileName":"src/classes/scenes/areas/highMountains/Izumi.hx",
                     "lineNumber":221,
                     "className":"classes.scenes.areas.highMountains.Izumi",
                     "methodName":"react"
                  });
               }
               outputText("你的脸被挤压在鬼族的乳沟里，你忍不住想：为什么要反抗呢？她实在是太<i>强壮</i>了，而且她的乳房贴在你的[face]上感觉如此丰满……");
               get_player().takeLustDamage(get_player().lib / 10 + 5 + Utils.rand(5),true);
               if(get_game().ceraphScene.hasBondage())
               {
                  outputText("老实说，她抓着你的感觉也并不完全令人讨厌。要是和泉别再玩闹，直接<i>上了你</i>就好了。");
                  get_player().takeLustDamage(5,true);
               }
               else
               {
                  outputText("。");
               }
               tookAction = true;
               return false;
            }
         }
         return true;
      }
      
      override public function performCombatAction() : void
      {
         var _loc1_:* = null as MonsterAI;
         if(get_player().hasStatusEffect(StatusEffects.Chokeslam))
         {
            get_player().addStatusValue(StatusEffects.Chokeslam,1,-1);
            if(get_player().statusEffectv1(StatusEffects.Chokeslam) <= 0)
            {
               chokeSlamDamage();
               cleanupChokeslam();
            }
            return;
         }
         if(get_player().hasStatusEffect(StatusEffects.Titsmother))
         {
            return;
         }
         if(HPRatio() <= 0.25 && !hasStatusEffect(StatusEffects.UsedTitsmother))
         {
            titSmother();
            createStatusEffect(StatusEffects.UsedTitsmother,0,0,0,0);
            return;
         }
         _loc1_ = new MonsterAI();
         _loc1_.add(straightJab,3,true,0,FATIGUE_NONE,CombatRange.Melee);
         _loc1_.add(roundhouseKick,3,true,10,FATIGUE_PHYSICAL,CombatRange.Melee);
         _loc1_.add(chokeSlam,1,true,10,FATIGUE_PHYSICAL,CombatRange.Melee);
         _loc1_.add(groundPound,2,!get_player().hasStatusEffect(StatusEffects.Groundpound),10,FATIGUE_PHYSICAL,CombatRange.Ranged);
         _loc1_.exec();
      }
      
      public function groundPound() : void
      {
         outputText("和泉抬起一只粗壮的脚，伴随着胜利的呐喊，狠狠地跺在地上。你脚下的地面竟然真的震动起来，险些让你失去平衡。[pg]");
         if(Boolean(combatAvoidDamage(new AvoidDamageParameters(true,false,false,null,null,null,null,null)).attackFailed))
         {
            outputText("你向侧面跃出，设法靠在墙上稳住身形，保持住了平衡。");
         }
         else
         {
            outputText("这阵震动竟然让你站立不稳，摔倒在地，还磕到了头。震动平息后，你挣扎着站起身，但在经历了这阵令人眩晕的冲击后，你觉得自己的[feet]有些发软。");
            get_player().createStatusEffect(StatusEffects.Groundpound,0,0,0,0);
         }
      }
      
      override public function defeated(param1:Boolean) : void
      {
         cleanup();
         get_game().highMountains.izumiScenes.touchThatFluffyHorn();
      }
      
      public function cleanupTitsmother() : void
      {
         if(get_player().hasStatusEffect(StatusEffects.Titsmother))
         {
            get_player().removeStatusEffect(StatusEffects.Titsmother);
         }
      }
      
      public function cleanupChokeslam() : void
      {
         get_player().removeStatusEffect(StatusEffects.Chokeslam);
      }
      
      public function cleanup() : void
      {
         cleanupChokeslam();
         cleanupTitsmother();
      }
      
      public function chokeslamStruggle() : void
      {
         clearOutput();
         var _loc1_:Boolean = false;
         if(Utils.rand(get_player().get_str()) > get_str() / 2)
         {
            _loc1_ = true;
         }
         if(_loc1_)
         {
            chokeSlamEscape();
         }
         else
         {
            outputText("和泉把你举在半空中，掐住你喉咙的手继续挤压着你肺里的空气。你的手指也紧紧抓住鬼族的手腕，试图对抗她");
            if(get_player().get_str() < 90)
            {
               outputText("巨大的");
            }
            else
            {
               outputText("惊人的");
            }
            outputText("力量，试图从她那粉碎性的拥抱中挣脱出来，但无济于事。");
            get_player().takeDamage(75 + Utils.rand(15),true);
         }
         tookAction = true;
      }
      
      public function chokeSlamEscape() : void
      {
         var _loc1_:Number = 50 + Utils.rand(get_player().get_str());
         outputText("你拼命地抓挠着她的手腕，眯起眼睛看着这个鬼族女人那高高在上的表情，");
         if(get_player().isBiped())
         {
            outputText("抬起一条[leg]，狠狠地踢了她一脚");
         }
         else if(get_player().hasTailInsteadOfLegs())
         {
            outputText("扬起你的尾巴，结结实实地抽了她一下");
         }
         else
         {
            outputText("并且结结实实地扇了她一巴掌");
         }
         outputText("打在脸上。和泉松开了你，惊讶地踉跄后退。[say: 哎哟！] 她居然叫出了声，用双手捂住了脸。[pg]");
         outputText("你落到地上，翻滚着躲开，以为她会报复。和泉从手后瞪了你一会儿，然后窃笑起来。慢慢地，她又摆出了战斗姿态，示意你们的较量继续。");
         outputText("<b>(<font color=\"" + get_game().mainViewManager.colorHpMinus() + "\">" + _loc1_ + "</font>)</b>");
         cleanupChokeslam();
         set_HP(get_HP() - _loc1_);
      }
      
      public function chokeSlamDamage() : void
      {
         outputText("伴随着一声用力的闷哼，和泉将你抛向空中，她那铁钳般紧锁你喉咙的手成了完美的锚点，将你狠狠砸向地面。你还没来得及反应，这只鬼族就将你重重地摔在了洞穴坚硬的石地上。[pg]");
         outputText("这一击极其猛烈，让你在地上瘫倒了一会儿，头晕目眩。几秒钟后，当你完全恢复意识时，洞穴里仍然回荡着撞击的声响，这证明了这只鬼族的力量——以及你的韧性。");
         var _loc1_:int = get_player().reduceDamage(get_str() + 225,this);
         get_player().takeDamage(_loc1_,true);
      }
      
      public function chokeSlam() : void
      {
         if(Boolean(combatAvoidDamage(new AvoidDamageParameters(true,false,false,null,null,null,null,null)).attackFailed))
         {
            outputText("和泉向你猛冲过来，眨眼间就拉近了你们之间的距离。你险险地避开了她那粉碎性的抓取，在最后一刻扭身躲开了她的手。巨大的鬼族发出了一声低沉而满足的笑声。");
         }
         else
         {
            outputText("和泉向你猛冲过来，眨眼间就击溃了你的防守，一把掐住了你的喉咙。她将你举过头顶，你只能艰难地呼吸，而这个巨大的鬼族则像看着某种战利品一样对你咧嘴笑着。");
            get_player().createStatusEffect(StatusEffects.Chokeslam,3,0,0,0);
         }
      }
   }
}

