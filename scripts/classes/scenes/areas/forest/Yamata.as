package classes.scenes.areas.forest
{
   import classes.Appearance;
   import classes.CoC;
   import classes.Creature;
   import classes.DynStat;
   import classes.PerkLib;
   import classes.Player;
   import classes.ReactionContext;
   import classes.StatusEffects;
   import classes._FlagDict.FlagDict_Impl_;
   import classes.internals.MonsterAI;
   import classes.internals.Utils;
   import classes.internals.WeightedChoice;
   import classes.items.ConsumableLib;
   import classes.scenes.combat.AvoidDamageParameters;
   import classes.scenes.combat.CombatRange;
   import flash.Boot;
   import haxe.IMap;
   
   public class Yamata extends BaseKitsune
   {
      
      public var cannonPrimed:Boolean;
      
      public function Yamata()
      {
         if(Boot.skip_constructor)
         {
            return;
         }
         cannonPrimed = false;
         super();
         init();
      }
      
      public function yamataSadomasochistApply(param1:int) : void
      {
         outputText("[pg]八岐对造成的痛苦感到愉悦……");
         takeLustDamage(int(param1 / 2),true);
         dynStats(DynStat.Str(param1 / 25),DynStat.Spe(-param1 / 30));
      }
      
      public function yamataNightmare() : void
      {
         outputText("你能听到一个低语声在你的脑海边缘萦绕，随着黑暗开始向你逼近，你开始退缩。当吞噬一切的黑暗填满你的视野时，你被四面八方难以想象的、无法用语言描述的恐怖所包围！你感觉自己正坠入绝望的深渊，越来越深，但不知为何，你知道只要你向八岐屈服，就能结束所有的痛苦……");
         var _loc1_:int = 0;
         _loc1_ = int(get_player().get_inte() < 80 ? int(Math.round(get_player().get_inte() / 70 * 25)) : 25);
         if(get_player().hasPerk(PerkLib.Whispered))
         {
            _loc1_ += 30;
         }
         else
         {
            outputText("你内心深处有一小部分知道这不可能是真的，但你现在太害怕了，根本无法行动！");
         }
         if(get_player().isReligious() && get_player().isPureEnough(20))
         {
            _loc1_ += int(15 - get_player().corAdjustedDown());
         }
         if(Utils.rand(100) < _loc1_)
         {
            outputText("[pg]你鼓起最后一丝勇气，用你的意志力击退了幻象！八岐踉跄了一下，痛苦地捂住额头，但只是对你咧嘴一笑。[say: 英雄，你就这点本事吗？]");
            if(get_player().hasStatusEffect(StatusEffects.Fear))
            {
               get_player().removeStatusEffect(StatusEffects.Fear);
            }
         }
         else
         {
            outputText("你知道这一切都不可能是真的，但你这回合太害怕了，根本无法行动！");
            if(get_player().hasStatusEffect(StatusEffects.Fear))
            {
               get_player().addCombatBuff("spe",-12);
            }
            else
            {
               get_player().createStatusEffect(StatusEffects.Fear,0,0,0,0);
               get_player().addCombatBuff("spe",-18);
            }
         }
      }
      
      public function yamataMiss() : void
      {
         outputText("你利落地躲过了八岐的狂野攻击，后退并举起你的[weapon]进行防御。[say: 哈哈！我喜欢我的猎物有点反抗精神！]");
      }
      
      public function yamataLustAttack() : void
      {
         outputText("在你眼前，八岐扑向地面，她的头发变长，以光滑的蛇形缠绕在她的下半身。她像一道黑色的闪电般直起身子，像一条疯狂的蛇一样盘绕着你。当她缠绕你的身体时，她用指甲划过你的血肉，在从你身边弹开时，用舌头舔舐着新鲜的抓痕。你微微发抖，既感到不安，又感到兴奋。");
         outputText("[pg]构成八岐头发的八条蛇突然撞向你，用毒牙咬住你，将你举到半空中。当你在它们的抓握中挣扎时，其中一条钻进了你的[armor]，你惊恐地感觉到它" + (get_player().hasCock() ? "整个吞噬了你的[cock]，将毒牙刺入根部，让你的腹股沟充满了堕落的火焰！" + (get_player().hasVagina() ? " 她的另一条蛇刺穿了你的[vagina]，让你的子宫充满了堕落的火焰！" : "") : "刺穿了你的[vagina]，让你的子宫充满了堕落的火焰！"));
         outputText("[pg]她粗暴地将你扔到地上，看着你挣扎着站起来，下体燃烧着欲望，她得意地笑了。");
         var _loc1_:int = int(15 + get_player().sens / 3 + get_player().lib / 5);
         get_player().takeDamage(15 + Utils.rand(26),true);
         get_player().takeLustDamage(_loc1_,true);
         if(get_player().hasCock())
         {
            get_player().dynStats(DynStat.Cor(1));
         }
         if(get_player().hasVagina())
         {
            get_player().dynStats(DynStat.Cor(1));
         }
         yamataSadomasochistApply(_loc1_ + 5);
         var _loc2_:IMap = get_flags();
         FlagDict_Impl_.arrayWriteInt(_loc2_,2372,FlagDict_Impl_.arrayReadInt(_loc2_,2372) + 1);
      }
      
      public function yamataIllusionLust() : void
      {
         var _loc2_:* = null as IMap;
         var _loc1_:int = int(10 + get_player().sens / 5);
         outputText("八岐分化出一连串的幻影，迅速将你包围！你试图找出真身，但你的动作太慢了！一团火球从侧面袭来，用灼热的堕落之火轰击着你！");
         get_player().takeDamage(int(get_str() / 2) + Utils.rand(15),true);
         if(get_player().hasStatusEffect(StatusEffects.Fear))
         {
            switch(Utils.rand(3))
            {
               case 0:
                  outputText("[pg]你攻击了八岐，但她的身影只是一个幻影！她出现在你身后，头发迅速变长，其中一条蛇发猛地窜出，咬住了你的脚踝，将一股堕落之火直接注入你的体内！");
                  _loc1_ += 4;
                  get_player().dynStats(DynStat.Cor(1));
                  _loc2_ = get_flags();
                  FlagDict_Impl_.arrayWriteInt(_loc2_,2372,FlagDict_Impl_.arrayReadInt(_loc2_,2372) + 1);
                  break;
               case 1:
                  outputText("[pg][say: 这是我的领域……在我的领域里……你会感觉很舒服的……] 她奇怪的话语引诱着你，你睁大眼睛，试图击中她，但似乎总是打偏。当感觉到有什么东西在摩擦你的胯部时，她的身影露出了恶作剧般的笑容，是她的一条尾巴！哦，该死，感觉太爽了！");
                  get_player().takeLustDamage(_loc1_);
                  break;
               case 2:
                  outputText("[pg]八岐转过身，将尾巴扫到一边，露出丰满的臀部，炫耀着她那看起来多汁的臀肉。她的展示让血液涌向你的腹股沟，让你急切地舔了舔嘴唇。");
                  outputText("[pg]八岐停顿了一下，将一只手放在紧绷的腹肌上，手指慢慢向下滑动，深深地凝视着你的眼睛。她的尾巴在她周围散开，诱惑地卷曲在她的四肢上，当她看着你的身体因欲望而颤抖时，她给了你一个轻浮的媚眼。");
                  get_player().takeLustDamage(_loc1_ * 2);
            }
         }
         outputText("[pg]八岐花了一点时间伸展她柔软的身体，当她向天空伸展双臂时，挺出了她被束缚的胸部。她转过身，头微微倾斜，然后向前鞠躬，让你能清楚地看到她紧紧包裹在裹胸布里的乳沟，同时脸上带着病态的笑容。");
         outputText("[pg][say: 你为什么不干脆投降呢？我们可以在我的刑具里玩得很开心，感觉会很棒的！如果你叫得够好听，我们甚至可以顺便找点乐子，呵呵呵。] 八岐风骚地低语着，一只手顺着她的尾巴抚摸，让它们诱惑地在她周围散开。");
         if(FlagDict_Impl_.arrayReadInt(get_flags(),2372) > 60)
         {
            outputText("[pg]你发现自己想了一会儿，然后才把自己拉回现实。她对你做了什么？！");
            _loc1_ += 5;
         }
         if(FlagDict_Impl_.arrayReadInt(get_flags(),2372) > 80)
         {
            outputText("不过仔细想想，她的提议似乎也不错……");
            _loc1_ += 3;
            _loc2_ = get_flags();
            FlagDict_Impl_.arrayWriteInt(_loc2_,2372,FlagDict_Impl_.arrayReadInt(_loc2_,2372) + 1);
         }
         get_player().takeLustDamage(_loc1_,true);
      }
      
      public function yamataEntwine() : void
      {
         outputText("八岐的头发以惊人的速度向你抽打过来，每条蛇都把毒牙咬进你身体的不同部位，把你举到半空中。[say: 你是我的！] 她大喊着，把你拉近，她的头发开始在你周围收紧。你能感觉到咬伤开始刺痛，并惊恐地看到每条蛇都在将她堕落的紫色火焰直接注入你的身体！如果你不能尽快逃脱，你很快就会变成一个语无伦次的受虐狂！");
         outputText("[pg]你被八岐蛇一样的头发束缚住了。你唯一能做的就是努力挣脱！");
         outputText("[pg]随着有毒的火焰在你的系统中流淌，你开始越来越被被虐待和贬低的念头所激发……");
         get_player().dynStats(DynStat.Cor(2));
         get_player().addCombatBuff("str",-10);
         get_player().addCombatBuff("spe",-10);
         var _loc1_:int = int(40 + 25 / (Utils.rand(3) + 1));
         get_player().takeLustDamage(Utils.rand(6) + 10,true);
         get_player().takeDamage(_loc1_,true);
         yamataSadomasochistApply(_loc1_);
         get_player().createStatusEffect(StatusEffects.YamataEntwine,0,0,0,0);
      }
      
      public function yamataDarkFoxfire() : void
      {
         outputText("八岐的手指在空中画圈，召唤出一团紫色的堕落火焰。她扭动上半身，摆出击球手的姿势，用刀背猛击火球，让它像导弹一样向你飞来，在撞击时爆炸！火焰吞噬了你，剧烈地燃烧着，但烧得越旺，你反而越开始喜欢这种感觉。");
         get_game().combat.monsterDamageType = "Fire";
         get_player().takeDamage(int(get_str() / 2) + Utils.rand(15),true);
         if(get_player().hasPerk(PerkLib.Masochist))
         {
            get_player().takeLustDamage(15 + get_player().sens / 10);
         }
         else
         {
            get_player().takeLustDamage((10 + get_player().sens / 10) * 2);
         }
         var _loc1_:IMap = get_flags();
         FlagDict_Impl_.arrayWriteInt(_loc1_,2372,FlagDict_Impl_.arrayReadInt(_loc1_,2372) + 1);
      }
      
      public function yamataBasic() : void
      {
         var _loc2_:int = 0;
         var _loc3_:* = null as IMap;
         var _loc1_:int = Utils.rand(4);
         if(_loc1_ == 0)
         {
            outputText("八岐向你冲来，她压低身子，然后跃起挥出一记大范围的斩击。看到她的刀尖划过你的皮肤，你本能地退缩了一下，但她在最后一刻轻巧地跳开了，只留下一道火辣辣的红色伤口。虽然疼得要命，但远不致命。[say: 噢，对，为我尖叫吧，宝贝！] 意识到她只是在戏弄你，这简直让人火大！");
            _loc2_ = int(get_str() / 2) + Utils.rand(15);
         }
         else if(_loc1_ == 1)
         {
            outputText("八岐转守为攻，你一边后退，一边拼尽全力躲避她的攻击。她的刀尖几次擦过你的身体，留下的浅浅伤口却疼得离谱。她将刀刃举到唇边，轻轻舔舐，对你露出报复性的狞笑。你现在确信，八岐只是想在解决你之前，尽可能多地施加痛苦。");
            _loc2_ = int(get_str() / 2) + Utils.rand(35);
         }
         else if(_loc1_ == 2)
         {
            outputText("八岐脚跟猛地蹬地，用一个粗俗的手势挑衅你。她那蛇形的头发突然向前猛抽，在你眼前化作无数利刃！谢天谢地，她似乎故意避开了要害，但那些擦伤依然疼得要命。[say: 啊哈哈哈！这难道不让你硬起来吗？！]");
            _loc2_ = int(get_str()) - Utils.rand(25);
            get_player().takeLustDamage(7);
            _loc3_ = get_flags();
            FlagDict_Impl_.arrayWriteInt(_loc3_,2372,FlagDict_Impl_.arrayReadInt(_loc3_,2372) + 1);
         }
         else
         {
            outputText("伴随着快速的抽打动作，八岐那蛇形的头发向你袭来，分裂成数千根细丝，鞭打着你的血肉。只要它们触碰到哪里，哪里就会传来一阵刺痛，但这强烈的刺痛感却不由自主地让你的下体气血翻涌。");
            _loc2_ = int(get_str() / 2) + Utils.rand(50);
            get_player().takeLustDamage(12);
            _loc3_ = get_flags();
            FlagDict_Impl_.arrayWriteInt(_loc3_,2372,FlagDict_Impl_.arrayReadInt(_loc3_,2372) + 1);
         }
         get_player().takeDamage(_loc2_,true);
         yamataSadomasochistApply(_loc2_);
         get_player().bleed(this);
      }
      
      override public function won(param1:Boolean, param2:Boolean = false) : void
      {
         get_game().forest.aikoScene.yamataWins();
      }
      
      override public function struggle() : void
      {
         var _loc2_:int = 0;
         clearOutput();
         outputText("你用尽全身力气挣脱八岐的束缚，拼命想让自己重获自由。[pg]");
         var _loc1_:Boolean = false;
         if(Utils.rand(get_player().get_str()) > get_str() / 4 * 3 || Utils.rand(5) == 0)
         {
            _loc1_ = true;
         }
         if(_loc1_)
         {
            entwineEscape();
         }
         else
         {
            outputText("你徒劳地挣扎着，你的挣扎只会让你更加被她蛇一样的头发缠住。八岐邪恶地咯咯笑着，伸出手用指甲划过你的胸膛，低声哼唱着当你是她忠实的奴隶时，她会让你遭受的无数折磨。你仍在与她");
            if(get_player().get_str() < 90)
            {
               outputText("巨大的");
            }
            else
            {
               outputText("惊人的");
            }
            outputText("力量抗争，试图从她堕落的拥抱中挣脱出来，但没有成功。");
            _loc2_ = 25 + Utils.rand(15);
            get_player().takeDamage(_loc2_,true);
            yamataSadomasochistApply(_loc2_);
            get_player().takeLustDamage(Utils.rand(6) + 10,true);
            get_player().dynStats(DynStat.Cor(1));
         }
         tookAction = true;
      }
      
      override public function react(param1:ReactionContext) : Boolean
      {
         if(param1.index == 3)
         {
            if(get_player().hasStatusEffect(StatusEffects.YamataEntwine))
            {
               entwineWait();
               return false;
            }
         }
         return true;
      }
      
      override public function performCombatAction() : void
      {
         var _g:Yamata;
         var _loc1_:MonsterAI = new MonsterAI().add(eAttack,1,true,0,FATIGUE_NONE,CombatRange.Melee);
         _loc1_.add(yamataBasic,2,true,0,FATIGUE_NONE,CombatRange.Melee);
         _loc1_.add(yamataDarkFoxfire,1,true,10,FATIGUE_MAGICAL,CombatRange.Ranged);
         _loc1_.add(yamataNightmare,1,true,10,FATIGUE_MAGICAL,CombatRange.Ranged);
         _loc1_.add(yamataIllusionLust,1,true,10,FATIGUE_MAGICAL,CombatRange.Ranged);
         _loc1_.add(yamataLustAttack,1,true,0,FATIGUE_NONE,CombatRange.Tease);
         _g = this;
         _loc1_.add(function():void
         {
            _g.kitsuneSealAttack();
         },1,true,10,FATIGUE_MAGICAL,CombatRange.Ranged);
         _loc1_.add(foxfireCannon2,100,cannonPrimed,10,FATIGUE_MAGICAL,CombatRange.Ranged);
         _loc1_.add(foxfireCannon1,0.25,true,10,FATIGUE_MAGICAL,CombatRange.Ranged);
         _loc1_.add(yamataEntwine,0.3,!hasStatusEffect(StatusEffects.YamataEntwine),0,FATIGUE_NONE,CombatRange.Ranged);
         _loc1_.add(yamataMiss,1,Boolean(combatAvoidDamage(new AvoidDamageParameters(true,false,false,null,null,null,null,null)).attackFailed),0,FATIGUE_NONE,CombatRange.Omni);
         _loc1_.exec();
      }
      
      public function init() : void
      {
         set_a("");
         set_short("Yamata");
         imageName = "yamata";
         set_long("八岐站在你面前，精神病般地咧嘴笑着，她的九条狐狸尾巴在她身后展开。她乌黑的头发在空中扭曲翻腾，形成了八个蛇形的头，向任何靠近的东西猛咬。一对恶魔般的角在她的耳朵前面弯曲向上，她挥舞着一把被诅咒的黑剑，这把剑像一把巨大的柴刀，沐浴在恶魔的力量中。只要盯着她看太久，你的脑海中就会涌现出奇怪的想法，敦促你屈服于她，成为她忠诚的受虐宠物。你必须保持清醒，否则你可能会开始享受这种痛苦！");
         set_race("Kitsune");
         createVagina(false,2,2);
         createStatusEffect(StatusEffects.BonusVCapacity,8000,0,0,0);
         createBreastRow(Appearance.breastCupInverse("E"));
         ass.analLooseness = 2;
         ass.analWetness = 2;
         createStatusEffect(StatusEffects.BonusACapacity,200,0,0,0);
         set_tallness(69);
         hips.rating = 6;
         butt.rating = 5;
         skin.tone = "light tan";
         hair.color = "black";
         hair.length = 22;
         initStrTouSpeInte(60,70,90,100);
         initLibSensCor(60,65,100);
         set_weaponName("Muramasa");
         set_weaponVerb("slash");
         set_armorName("tight chest wrap and baggy pants");
         set_armorDef(16);
         bonusHP = 2400;
         set_lust(25);
         bonusLust = 150;
         lustVuln = 0.35;
         temperment = 1;
         level = 30;
         set_gems(Utils.rand(20) + 30);
         set_drop(new WeightedChoice(get_consumables().MYSTJWL,1));
         tail.type = 13;
         tail.venom = 9;
         createPerk(PerkLib.EnlightenedNinetails);
         createPerk(PerkLib.SpellcastingAffinity,25);
         checkMonster();
      }
      
      override public function handleFear() : Boolean
      {
         removeStatusEffect(StatusEffects.Fear);
         outputText("八岐高兴地颤抖了一下，然后清醒地看着你。[say: 我喜欢那个！你应该多做几次！]\n");
         return true;
      }
      
      override public function handleBlind() : Boolean
      {
         outputText("[say: 你的花招对我没用，勇者，我一眼就看穿了。] 你的致盲攻击在她的魔法面前直接消散了。");
         return true;
      }
      
      public function foxfireCannon2() : void
      {
         var _loc2_:int = 0;
         var _loc3_:int = 0;
         var _loc4_:int = 0;
         var _loc5_:int = 0;
         var _loc6_:int = 0;
         var _loc1_:int = 0;
         if(FlagDict_Impl_.arrayReadInt(get_flags(),22) == 1)
         {
            outputText("空气中突然充满了腐化的火焰飞弹，八个蛇头各自向你发射了一枚！幸好你早有准备，轻松地闪转腾挪，躲过了所有的火焰飞弹，毫发无伤地逃脱了。");
         }
         else
         {
            _loc2_ = Utils.rand(9);
            outputText("空气中突然充满了腐化的火焰飞弹，八个蛇头各自向你发射了一枚！你尽力格挡或躲避它们，但你这回合之前的行动让你处于轻微的劣势。[pg]");
            if(_loc2_ == 0)
            {
               outputText("你不知怎么地毫发无伤地逃脱了，但躲避或弹开它们的努力让你的肌肉承受了压力！");
               get_player().changeFatigue(10);
            }
            else
            {
               outputText(_loc2_ + (_loc2_ > 1 ? " 颗火球" : " 颗火球") + " 以致命的力量撞向你！当腐化的火焰席卷你时，你开始享受这种痛苦，在受虐的快感中紧紧抱住自己！");
               _loc3_ = 0;
               _loc4_ = _loc2_;
               while(_loc3_ < _loc4_)
               {
                  _loc5_ = _loc3_++;
                  _loc6_ = Utils.rand(10) + 5;
                  get_player().dynStats(DynStat.Cor(1));
                  get_game().combat.monsterDamageType = "Fire";
                  get_player().takeDamage(_loc6_ * 2,true);
                  get_player().takeLustDamage(_loc6_ / 2,true);
                  _loc1_ += _loc6_ * 2;
               }
            }
         }
         if(_loc1_ > 0)
         {
            yamataSadomasochistApply(_loc1_);
         }
         cannonPrimed = false;
      }
      
      public function foxfireCannon1() : void
      {
         outputText("八岐的蛇发开始散开，张开大嘴向你卷来。它们似乎在吸收能量，每个嘴里都开始聚集起明亮的紫色火球。看来八岐正在为某个大招蓄力！");
         cannonPrimed = true;
      }
      
      public function entwineWait() : void
      {
         clearOutput();
         outputText("你觉得与如此强大的敌人抗争没有意义，让八岐尽情玩乐吧。缠绕着你的蛇继续将它们邪恶的火焰注入你的体内，仅仅是看着它们这样做就让你兴奋不已！你承受的时间越长，痛苦就越令人愉悦！");
         get_player().dynStats(DynStat.Cor(1));
         var _loc1_:IMap = get_flags();
         FlagDict_Impl_.arrayWriteInt(_loc1_,2372,FlagDict_Impl_.arrayReadInt(_loc1_,2372) + 2);
      }
      
      public function entwineEscape() : void
      {
         outputText("你爆发出你不知道自己拥有的力量，从她身边挣脱出来，当你滚开时，身上还粘着几根散落的头发。当你退回到防御姿态时，八岐难以置信地看着你从她身上挣脱出来的那团磨损的头发，然后大喊道：[say: 你他妈的干的好事！我要把你切成碎片！] 尽管她发出了威胁，但她的头发似乎在自我修复，很容易就长回了可怕的蛇形。[pg]");
         get_player().removeStatusEffect(StatusEffects.YamataEntwine);
         outputText("<b>当八岐的蛇终于松开它们的束缚时，你感到如释重负，尽管你仍然能感觉到它们的堕落之火在你的血管中跳动。</b>[pg]");
      }
      
      override public function defeated(param1:Boolean) : void
      {
         get_game().forest.aikoScene.yamataLoses();
      }
   }
}

