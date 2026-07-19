package classes.scenes.dungeons.lethicesKeep
{
   import classes.CoC;
   import classes.CockTypesEnum;
   import classes.Creature;
   import classes.PerkLib;
   import classes.Player;
   import classes.ReactionContext;
   import classes.StatusEffects;
   import classes.internals.Utils;
   import classes.scenes.areas.swamp.AbstractSpiderMorph;
   import classes.scenes.combat.AvoidDamageParameters;
   import flash.Boot;
   
   public class DriderIncubus extends AbstractSpiderMorph
   {
      
      public var _seenResolute:Boolean;
      
      public var _hpGains:int;
      
      public var _goblinWebChain:Boolean;
      
      public var _goblinOiled:Boolean;
      
      public var _goblinFree:Boolean;
      
      public var _combatRound:int;
      
      public function DriderIncubus()
      {
         if(Boot.skip_constructor)
         {
            return;
         }
         _goblinOiled = false;
         _goblinWebChain = false;
         _seenResolute = false;
         _hpGains = 0;
         _combatRound = 0;
         _goblinFree = false;
         super();
         set_a("");
         set_short("drider incubus");
         set_long("这个蛛化精灵男魅魔是恶魔扭曲非人血肉的奇迹。他闪闪发光的深色皮肤就像一块坚硬的煤炭。扭曲的黑曜石角从他的额头上盘旋而上，就像一对畸形的长矛。甚至他的眼睛也是一个令人毛骨悚然的奇迹，不再是灵魂的窗户，只是无尽饥饿的深渊。他邪恶的面容与他腰部以下那巨大的蜘蛛形态相比，简直相形见绌。他每走一步，八条咔嗒作响的腿就在地板上掠过。一个球状的腹部悬挂在它们后面，上面覆盖着抽搐的吐丝器，里面装满了蛛丝，以至于半成形的蛛丝团悬挂在他身后。\n\n一个地精被悬挂在制作精良的挽具上，这是你面前这个没有灵魂的怪物身上唯一的一抹亮色。她被安置在体型较大的雄性腹部，这样她赤裸的胯部就被刺穿在他肿胀、蠕动的恶魔肉棒上，从她疯狂扭动的样子来看，她正在尽最大努力逃跑。也许你可以释放她？");
         set_race("Demon");
         set_tallness(108);
         createCock(24,5,CockTypesEnum.DEMON);
         createBreastRow(0);
         balls = 2;
         ballSize = 4;
         set_hoursSinceCum(9999);
         hips.rating = 2;
         butt.rating = 2;
         initStrTouSpeInte(65,80,90,70);
         initLibSensCor(66,40,100);
         set_weaponName("spear");
         set_weaponAttack(19);
         set_weaponVerb("lunge");
         set_armorName("chitin");
         set_armorDef(40);
         bonusHP = 500;
         set_gems(75 + Utils.rand(50));
         level = 22;
         additionalXP = 200;
         lustVuln = 0.45;
         set_drop(NO_DROP);
         checkMonster();
      }
      
      override public function won(param1:Boolean, param2:Boolean = false) : void
      {
         get_game().lethicesKeep.driderIncubus.spooderbuttGetsANewCockSleeve(param1,param2);
      }
      
      public function webNipplechain() : void
      {
         outputText("每次她试图抓住恶魔蛛化精灵的工具时，他都会躲到一边，你们战斗的起伏让她无法达到目的。她气呼呼地抓住一根悬挂的蛛丝，把粘性的一端粘在她的一个乳头上。然后，她挤压了一下吐丝器，但在此之前，她把另一个摇晃的乳房压在上面。");
         if(_goblinWebChain == false)
         {
            outputText("[pg]她离开时带着一条有机的乳头链，当她为了主人的愉悦而摇晃着娇小的身体时，她因渴望而呻吟着。他尽力无视她，但即使是恶魔也无法无视几英尺外摇晃的一对涂满白色液体的乳房。");
            _goblinWebChain = true;
         }
         else
         {
            outputText("[pg]地精女奴再次扭动摇摆，她的双臂从两侧挤压着乳房，让那对涂满蛛网的肉团跳动起来。她的眼中燃烧着欲望，放荡的笑容向她的主人承诺着数小时无尽的淫乱。看到这一幕，他忍不住多看了一眼。");
         }
         set_lust(get_lust() + 5);
      }
      
      public function taintedMindAttackAttempt() : void
      {
         outputText("你准备好攻击，却发现自己的双手在摸索自己的身体。不知何故，恶魔的魔法让你无法攻击他，把不该交叉的线路交叉在了一起。你皱着眉头，看着自己更加兴奋的身体，决心不再上第二次当。");
         get_player().takeLustDamage(15,true);
      }
      
      public function taintedMind() : void
      {
         outputText("[say:对于一个凡人来说，你打得不错……但你能像恶魔一样战斗吗？]他拍了拍手，让周围的区域沐浴在一股能量波中。附近的一些奴隶惊恐地叫喊起来，然后变成了一团咯咯笑、咕咕叫的混乱。你似乎并没有受到什么影响，尽管握着你的[weapon]感觉有些不对劲。");
         if(get_player().cor <= 33)
         {
            outputText("他说像恶魔一样战斗是什么意思？");
         }
         get_player().createStatusEffect(StatusEffects.TaintedMind,4,0,0,0);
      }
      
      public function stunningSpear() : void
      {
         outputText("蛛化精灵旋转着他的武器，直到它看起来像一个模糊的圆盘，然后他转过身，将长柄扫向你的头部！");
         var _loc1_:Number = 0;
         var _loc2_:* = combatAvoidDamage(new AvoidDamageParameters(true,false,false,null,null,null,null,null));
         if(_loc2_.dodge == EVASION_SPEED || _loc2_.dodge == EVASION_FLEXIBILITY || _loc2_.dodge == EVASION_UNHINDERED)
         {
            outputText("你在千钧一发之际低头躲开了。");
         }
         else if(_loc2_.dodge == EVASION_MISDIRECTION)
         {
            outputText("你已经改变了方向。你在心里默默感谢拉斐尔的训练。");
         }
         else if(_loc2_.dodge == EVASION_EVADE)
         {
            outputText("你顺着挥击的方向倾斜身体，让重力把你拉低，躲开了这令人眩晕的一击。");
         }
         else
         {
            _loc1_ = (get_str() + get_weaponAttack() - 25 - Utils.rand(get_player().get_tou())) * (1 + get_player().newGamePlusMod() * 0.3);
            if(_loc1_ > 0)
            {
               outputText("你没有感觉到冲击，但你确实听到了木头击中");
               outputText("骨头的断裂声");
               outputText("。");
               if(get_player().stun(0,100))
               {
                  outputText("<b>你被这一击打晕了！</b>你需要一点时间才能恢复理智。");
               }
               get_player().takeDamage(_loc1_,true);
            }
            outputText("你听到了木头击中");
            outputText("骨头的断裂声");
            outputText("，但你成功卸掉了大部分力量！");
         }
      }
      
      public function spearStrike() : void
      {
         outputText("蛛化精灵向后仰起，用长矛刺出。");
         var _loc1_:Number = (get_str() + get_weaponAttack()) * 0.4 * (1 + get_player().newGamePlusMod() * 0.3);
         var _loc2_:* = combatAvoidDamage(new AvoidDamageParameters(true,true,false,null,null,null,null,null));
         if(_loc1_ <= 0 || _loc2_.dodge == EVASION_SPEED || _loc2_.dodge == EVASION_FLEXIBILITY || _loc2_.dodge == EVASION_UNHINDERED)
         {
            outputText("你勉强滑步躲开。");
         }
         else if(_loc2_.dodge == EVASION_EVADE)
         {
            outputText("你避开了攻击。");
         }
         else if(_loc2_.dodge == EVASION_MISDIRECTION)
         {
            outputText("得益于你的误导技巧，你避开了攻击。");
         }
         else if(Boolean(_loc2_.parry))
         {
            outputText("你灵巧地格挡开了这一刺。");
         }
         else
         {
            outputText("武器深深地刺入了你的身体。");
            get_player().takeDamage(_loc1_,true);
         }
      }
      
      public function set_goblinFree(param1:Boolean) : Boolean
      {
         if(param1 != _goblinFree)
         {
            set_long("这个蛛化精灵男魅魔是恶魔扭曲非人血肉的奇迹。他闪闪发光的深色皮肤就像一块坚硬的煤炭。扭曲的黑曜石角从他的额头上盘旋而上，就像一对畸形的长矛。甚至他的眼睛也是一个令人毛骨悚然的奇迹，不再是灵魂的窗户，只是无尽饥饿的深渊。他邪恶的面容与他腰部以下那巨大的蜘蛛形态相比，简直相形见绌。他每走一步，八条咔嗒作响的腿就在地板上掠过。一个球状的腹部悬挂在它们后面，上面覆盖着抽搐的吐丝器，里面装满了蛛丝，以至于半成形的蛛丝团悬挂在他身后。");
            if(!param1)
            {
               set_long(get_long() + "一个地精被悬挂在制作精良的挽具上，这是你面前这个没有灵魂的怪物身上唯一的一抹亮色。她被安置在体型较大的雄性腹部，这样她赤裸的胯部就被刺穿在他肿胀、蠕动的恶魔肉棒上，从她疯狂扭动的样子来看，她正在尽最大努力逃跑。也许你可以释放她？");
            }
            else
            {
               set_long(get_long() + "你释放的地精不顾一切地在房间里追逐她恶魔般的主人，尽她所能地想让他的肉棒射出来。她似乎几乎没有意识到正在发生的冲突；蛛化精灵还没有踩到她，这真是一个奇迹。");
            }
         }
         _goblinFree = param1;
         return param1;
      }
      
      override public function react(param1:ReactionContext) : Boolean
      {
         if(param1.index == 0)
         {
            if(get_player().hasStatusEffect(StatusEffects.TaintedMind))
            {
               taintedMindAttackAttempt();
               return false;
            }
         }
         return true;
      }
      
      public function purpleHaze() : void
      {
         outputText("[say:试试这个！]蛛化精灵朝你的方向做手势，将他的意志凝聚成一股有形的力量。它像一条盘绕的蛇一样压在你的脑海中，从四面八方挤压着你。");
         if(get_player().hasPerk(PerkLib.Resolute) || Utils.randomChance(66))
         {
            if(get_player().hasPerk(PerkLib.Resolute))
            {
               _seenResolute = true;
            }
            outputText("你发挥出强大的意志力，感觉到那股集中的精神污垢脱落了。不管他的攻击是什么，都失败了！");
         }
         else
         {
            outputText("你集中注意力试图摆脱它，但他压倒了你的心理防线。粉红色的漩涡云充满了你的视野，里面充满了毫不掩饰的色情剪影，有效地让你失明了！");
            get_player().takeLustDamage(25,true);
            get_player().createStatusEffect(StatusEffects.PurpleHaze,2 + Utils.rand(2),0,0,0);
            get_player().createStatusEffect(StatusEffects.Blind,get_player().statusEffectv1(StatusEffects.PurpleHaze),0,0,0);
         }
      }
      
      public function performPhysicalAttack() : void
      {
         var _loc1_:* = null as Array;
         if(_combatRound >= 3 && (int(_combatRound % 6) == 0 || _combatRound == 3))
         {
            stunningSpear();
         }
         else
         {
            _loc1_ = [spiderMorphWebAttack,kick,kick,doubleStrike,doubleStrike];
            if(get_fatigue100() < 100)
            {
               _loc1_.push(bite);
            }
            _loc1_[Utils.rand(int(_loc1_.length))]();
         }
      }
      
      public function performLustAttack() : void
      {
         var _loc1_:* = null as Array;
         if(_combatRound >= 3 && (int(_combatRound % 6) == 0 || _combatRound == 3))
         {
            constrictingThoughts();
         }
         else
         {
            _loc1_ = [arouseSpell,arouseSpell];
            if(!get_player().hasStatusEffect(StatusEffects.TaintedMind) && !_seenResolute)
            {
               _loc1_.push(taintedMind);
            }
            if(!_seenResolute)
            {
               _loc1_.push(purpleHaze);
            }
            _loc1_[Utils.rand(int(_loc1_.length))]();
         }
      }
      
      override public function performCombatAction() : void
      {
         _combatRound += 1;
         if(get_lust100() < 65 && get_hp100() < 33)
         {
            gainHpAndLust();
         }
         else if(get_lust100() >= 65 && get_hp100() >= 33)
         {
            dropHpAndLust();
         }
         if(Utils.rand(100) > get_lust() + 10)
         {
            spearStrike();
            outputText("[pg]");
            performPhysicalAttack();
         }
         else
         {
            performLustAttack();
         }
         if(_goblinFree)
         {
            outputText("[pg]");
            goblinAI();
         }
      }
      
      public function kick() : void
      {
         var _loc2_:Number = NaN;
         outputText("当你正忙着应付他的长矛时，他漫不经心地朝你踢了一脚！");
         var _loc1_:* = combatAvoidDamage(new AvoidDamageParameters(true,false,false,null,null,null,null,null));
         if(_loc1_.dodge == EVASION_MISDIRECTION)
         {
            outputText("多亏了你的误导技巧，你在最后一刻扭身躲开了。");
         }
         else if(_loc1_.dodge != null)
         {
            outputText("你在最后一刻扭身躲开，轻松地闪避了过去。");
         }
         else
         {
            _loc2_ = (get_str() + get_weaponAttack() + 25 - Utils.rand(get_player().get_tou())) * (1 + get_player().newGamePlusMod() * 0.3);
            if(_loc2_ > 0)
            {
               outputText("你倒飞出去，撞在了一对涂满精油的女奴身上。当你挣扎着回到战斗中时，她们惊讶地喘息着。她们试图抚摸你，但为时已晚，只勉强碰到了你的[leg]，你就已经重新投入了战斗。");
               get_player().takeDamage(_loc2_,true);
            }
            else
            {
               outputText("你成功地挡下了这一脚！");
            }
         }
      }
      
      public function goblinTongueGrapple() : void
      {
         outputText("坚定的地精爱奴张大嘴巴，以极高的精确度向她主人的阴茎发射了一条至少三英尺长的舌头。它伴随着一声湿润的“啪”声接触，并在你或蛛化精灵做出反应之前缠绕在渗出液体的恶魔肉棒上。他的动作因为这种关注而变慢，他几乎绊倒了，这给了地精缩短距离的时间，用层层火热的粉红色快感将他的阴茎包裹起来。");
         set_lust(get_lust() + 5);
         if(get_lust100() <= 100)
         {
            outputText("[pg]蛛化精灵向后退去，这个动作让地精跪倒在地。她的舌头绷紧了很长一段时间，然后从他的肉棒上滑落，猛地缩回她的嘴里，力度大得让她退缩。双方都对结果感到失望，尤其是地精。对她来说幸运的是，她还有机会——蛛化精灵再次把注意力集中在你身上。");
         }
         else
         {
            outputText("[pg]蛛化精灵试图向后退去，但他的腿抖得太厉害，无法正常移动。他渴望地看着他的爱奴，暂时忘记了你。");
         }
      }
      
      public function goblinHandjob() : void
      {
         outputText("不知怎么的，地精设法用她的两只手抓住了蛛化精灵一直勃起的阴茎。她脸上露出高兴的表情，开始抽动，崇拜地一次又一次地拉扯着她主人的肉棒，她兴奋地张开嘴，好像他随时都会射精一样。");
         outputText("[pg]对她来说不幸的是，恶魔蛛化精灵的动作让他远离了她贪婪的手指。他伴随着一声湿润的“啵”声从她的掌控中滑落，她只能撅起嘴，再次追赶他。");
      }
      
      public function goblinAI() : void
      {
         var _loc1_:Array = [goblinHandjob,goblinTongueGrapple,bootyTwerking,webNipplechain];
         if(!_goblinOiled)
         {
            _loc1_.push(babyOilMeUp);
         }
         _loc1_[Utils.rand(int(_loc1_.length))]();
      }
      
      public function get_goblinOiled() : Boolean
      {
         return _goblinOiled;
      }
      
      public function get_goblinFree() : Boolean
      {
         return _goblinFree;
      }
      
      public function gainHpAndLust() : void
      {
         addHP(maxHP() * 0.1);
         set_lust(get_lust() + 8);
         if(_hpGains == 0)
         {
            outputText("[say:你不会这么轻易打败我的！]");
         }
         else if(_hpGains == 1)
         {
            outputText("[say:我能坚持得比你久，凡人！]");
         }
         else if(_hpGains == 2)
         {
            outputText("[say:真固执！让莉希丝带走你吧！]");
         }
         else
         {
            outputText("[say:你为什么不屈服？！]");
         }
         _hpGains += 1;
         outputText("恶魔狂乱地挥舞着手臂，在自己的胸口画了一个符文。它闪耀着血红色的光芒并跳动着。在魔法的驱动下，你敌人的伤口慢慢愈合。当发光的符号褪去时，蛛化精灵喘着粗气，他黑色的皮肤在某些地方泛着紫色。");
         if(get_lust100() > 65)
         {
            if(_goblinFree)
            {
               outputText("他的阴茎僵硬地弹跳着，硬得看起来随时都会射出来。");
            }
            else
            {
               outputText("他的蛋蛋在地精身下紧绷着，他不停地低声呻吟。");
            }
            outputText("你怀疑他是否能继续利用他的欲望来治愈自己而不把自己推向高潮！");
         }
         outputText("[pg]");
      }
      
      public function freeGoblin() : void
      {
         clearOutput();
         set_goblinFree(true);
         outputText("你猛地低身扑去，双手勾住那个扭动的绿皮生物的腋下，用力拉扯。在她的体重和你用力的拉扯下，蛛网像纱布一样断裂。她惊恐地瞪大了眼睛。当你把她拉出来时，她尖叫起来，露出一根湿透得不似人类的肉棒和一对肿胀得厉害的阴唇。这个可怜的小东西如果不把它们挤在一起，就根本无法走路。");
         outputText("[pg]当愤怒的蛛化精灵准备反击时，你被迫放下了她。令人惊讶的是，她双脚平稳落地。");
         outputText("[pg][say: 哦，原谅我，主人！我还是会让你爽的——我保证！] 那个绿皮荡妇扭动着离开你，试图靠近她主人的下体。");
         outputText("[pg]好吧……也许她根本不想自由。至少她能很好地分散注意力。");
         get_game().combat.startMonsterTurn();
      }
      
      public function dropHpAndLust() : void
      {
         set_HP(get_HP() - maxHP() * 0.08);
         set_lust(get_lust() - 10);
         outputText("恶魔咆哮着收回长矛，将矛尖朝下抵在手臂上。他恶意地咧嘴笑着，将锋利的边缘沿着皮肤滑动，在受伤的肉体上留下一道闪闪发光的红宝石痕迹。[say:痛苦能带来头脑的清醒——这是你无法理解的。]他笑得更灿烂了，控制住了自己更低级的冲动。[say:让我来教教你。][pg]");
      }
      
      public function doubleStrike() : void
      {
         outputText("他迅速向前爬行并继续攻击，再次用长矛刺出。");
         var _loc1_:Number = get_str() + get_weaponAttack() + 10 - Utils.rand(get_player().get_tou());
         var _loc2_:* = combatAvoidDamage(new AvoidDamageParameters(true,true,false,null,null,null,null,null));
         if(_loc1_ <= 0 || _loc2_.dodge == EVASION_SPEED || _loc2_.dodge == EVASION_FLEXIBILITY || _loc2_.dodge == EVASION_UNHINDERED)
         {
            outputText("你勉强滑步躲开。");
         }
         else if(_loc2_.dodge == EVASION_EVADE)
         {
            outputText("你避开了攻击。");
         }
         else if(_loc2_.dodge == EVASION_MISDIRECTION)
         {
            outputText("得益于你的误导技巧，你避开了攻击。");
         }
         else if(Boolean(_loc2_.parry))
         {
            outputText("你格挡了攻击。");
         }
         else
         {
            outputText("武器深深地刺入了你的身体。");
            get_player().takeDamage(_loc1_,true);
         }
      }
      
      override public function defeated(param1:Boolean) : void
      {
         get_game().lethicesKeep.driderIncubus.beatTheSpooderbutt(param1);
      }
      
      public function constrictingThoughts() : void
      {
         outputText("[say:试试这个！]堕落的蛛化精灵喊道，朝你的方向挥了挥手。");
         outputText("[pg]杂乱无章的色情念头撕扯着你的心理防线，从它们找到的裂缝中钻进去，用各种形状和大小的感官幻想取代了你自己的想象。");
         if(!get_player().stun(0,100))
         {
            _seenResolute = true;
            outputText("你集中精神，抛弃了那些错误的念头。");
         }
         else
         {
            outputText("这种强烈的刺激压倒了你的行动能力，让你兴奋不已，头晕目眩。");
            get_player().takeLustDamage(get_player().lib / 15 + get_player().cor / 15 + 15,true);
         }
      }
      
      public function bootyTwerking() : void
      {
         outputText("地精暂时放弃了她徒劳的追逐。她没有试图把手放在她珍贵的权杖上，而是转过身，把她看起来很柔软的屁股翘到半空中。她扭动着身体，让她丰满的屁股蛋独立地弹跳着。有时它们会发出清脆的拍打声。几个聚集在一起的恶魔奴隶为她的表演鼓掌，蛛化精灵也忍不住向她投去几道饥渴的目光。");
         set_lust(get_lust() + 5);
      }
      
      public function bite() : void
      {
         set_fatigue(get_fatigue() + 20);
         var _loc1_:Number = 0;
         var _loc2_:* = combatAvoidDamage(new AvoidDamageParameters(true,false,false,null,null,null,null,null));
         if(get_player().hasStatusEffect(StatusEffects.Stunned) || get_player().get_spe() <= 1 && get_player().statusEffectv1(StatusEffects.Web) >= 2)
         {
            get_player().createOrFindStatusEffect(StatusEffects.DriderIncubusVenom);
            outputText("蛛形恶魔不慌不忙地露出毒牙，轻易地深深咬入你的身体。当他将毒液注入你体内时，他的舌头色情地在伤口周围滑动，品尝着你的恐惧与绝望。毒液夺走了你的力量，让你痛苦地皱起眉头。");
            if(get_player().get_str() <= 25)
            {
               outputText("你连站稳都变得越来越困难了。");
            }
            else if(get_player().get_str() <= 1)
            {
               outputText("你觉得你已经站不住了，更别提反抗了。");
            }
            outputText("[pg]当他拔出时，他面带微笑，脸色微红。");
            if(get_player().get_str() > 25)
            {
               outputText("[say:这样应该就行了。]");
            }
            else
            {
               outputText("[say:很快你就会连反抗的力气都没有了。]");
            }
         }
         else
         {
            outputText("蛛形恶魔扭过身子，露出毒牙，试图咬你！");
            if(_loc2_.dodge == EVASION_MISDIRECTION)
            {
               outputText("你误导了他带毒的攻击！");
            }
            else if(_loc2_.dodge == EVASION_EVADE)
            {
               outputText("你闪避了他带毒的攻击！");
            }
            else if(_loc2_.dodge == EVASION_SPEED || _loc2_.dodge == EVASION_FLEXIBILITY || _loc2_.dodge == EVASION_UNHINDERED)
            {
               outputText("你躲开了他带毒的攻击！");
            }
            else
            {
               outputText("那些针一样的犬齿刺入你的身体，注入了致命的毒液！你已经感到虚弱，肌肉的反应也不再那么灵敏了。");
               outputText("[say:我真喜欢看你挣扎的样子。]他露出了一个扭曲的微笑。");
               get_player().createOrFindStatusEffect(StatusEffects.DriderIncubusVenom);
            }
         }
      }
      
      public function babyOilMeUp() : void
      {
         outputText("地精冲进人群，带回了一个形状和设计都很奇特的瓶子。她拔掉软木塞，将其倒在她娇小却极其丰满的身体上，用一只手将液体涂抹在她那过于丰满的乳房上，让它们在摇曳的烛光下闪闪发光。她的眼睛明亮而调皮，同时将液体涂抹在身体的其他部位，让她的整个身体变得光滑，准备好迎接爱欲。");
         outputText("[pg]她跳着舞，向一侧旋转，娇嗔道：[say: 宝贝，你不再想要我了吗？看我已经准备得多好了] 她的乳头紧绷挺立，大腿之间的交界处已经完全湿透了。你和你的敌人都忍不住向她投去充满欲望的目光。");
         set_lust(get_lust() + 7);
         get_player().takeLustDamage(7,true);
      }
      
      public function arouseSpell() : void
      {
         outputText("恶魔蛛化精灵嘟囔着一些令人费解的词语，在你的脑海深处回荡。亵渎的音节一个接一个地叠加，直到他的嘴似乎被这腐败的杂音压得喘不过气来。他的污秽之语达到了高潮，然后带着自信、傲慢的目光，他将这股力量指向了你。");
         outputText("[pg]一股无形的力量降临在你身上，将欲望注入你身体最敏感的部位，让你的[nipples]因渴望而苏醒");
         if(int(get_player().cocks.length) > 0 || int(get_player().vaginas.length) > 0)
         {
            outputText("，让你的");
            if(int(get_player().cocks.length) > 0)
            {
               outputText("[cocks]");
            }
            else
            {
               outputText("[vagina]");
            }
            outputText("渴望被触碰");
         }
         outputText("。");
         get_player().takeLustDamage(get_player().lib / 10 + get_player().cor / 10 + 15,true);
         outputText("你的身体在邪恶的影响下背叛了你");
         if(get_player().get_lust100() < 100)
         {
            outputText("，但谢天谢地，这种效果转瞬即逝。你试图忽略残留的刺痛感。在离目标这么近的地方，你可不能输！");
         }
         else
         {
            outputText("。");
         }
      }
   }
}

