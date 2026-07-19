package classes.scenes.dungeons.lethicesKeep
{
   import classes.CoC;
   import classes.CockTypesEnum;
   import classes.Monster;
   import classes.PerkLib;
   import classes.Player;
   import classes.ReactionContext;
   import classes.StatusEffects;
   import classes.internals.MonsterAI;
   import classes.internals.Utils;
   import classes.items.Armor;
   import classes.items.ArmorLib;
   import classes.scenes.combat.CombatDistance;
   import classes.scenes.combat.CombatRange;
   import flash.Boot;
   
   public class JeanClaude extends Monster
   {
      
      public function JeanClaude()
      {
         if(Boot.skip_constructor)
         {
            return;
         }
         super();
         set_a("");
         set_short("Jean-Claude");
         imageName = "jeanclaude";
         set_long("你正在与让-克洛德战斗。他身高超过七英尺，体格完美，肌肉坚实分明，但脚步却丝毫不显沉重；他绕着你打转，大腿肌肉紧绷又放松，强壮的尾巴来回甩动，随时准备在出现破绽的瞬间扑上前来。这一切让你大脑深处的原始本能感到恐慌，警告你正在与一只正值壮年的顶级掠食者战斗。他穿着皮质束腰外衣、青铜胸甲，戴着百夫长头盔，这些装备加上他厚实的紫绿斑驳皮肤，为他提供了极强的防护。他的双眼闪烁着深邃的黄光，不断捕捉你的视线，诱惑你更深入地注视它们。他挥舞着一把看起来满是污渍的弯刀，随着他的移动，弯刀在他身侧带着嘲弄般的随意感摆动着；这动作模仿着他那两根肿胀发紫的肉棒，在束腰外衣下晃动，带着粗俗的暗示。");
         set_race("Basilisk");
         set_plural(false);
         createCock(12,2,CockTypesEnum.LIZARD);
         balls = 2;
         ballSize = 6;
         set_hoursSinceCum(9999);
         createBreastRow(0);
         set_tallness(86);
         ass.analLooseness = 0;
         ass.analWetness = 0;
         hips.rating = 4;
         butt.rating = 4;
         lowerBody.type = 10;
         tail.type = 9;
         skin.desc = "green-purple mottled hide";
         initStrTouSpeInte(80,100,80,60);
         initLibSensCor(40,40,80);
         var _loc1_:int = get_game().get_noFur() ? 0 : 7;
         face.type = _loc1_;
         ears.type = 6;
         eyes.type = 5;
         set_weaponName("cutlass");
         set_weaponVerb("slash");
         set_weaponAttack(20);
         bonusHP = 400;
         set_armorName("皮质束腰外衣");
         lustVuln = 0.6;
         set_armorDef(20);
         set_lust(5);
         level = 20;
         set_gems(300 + Utils.rand(55));
         set_drop(NO_DROP);
         createPerk(PerkLib.BasiliskResistance,0,0,0,0);
         createPerk(PerkLib.BlindImmune);
         checkMonster();
      }
      
      override public function won(param1:Boolean, param2:Boolean = false) : void
      {
         get_game().lethicesKeep.jeanClaude.fuckhugeBasiliskFuckedYouUp(param1);
      }
      
      override public function shouldMove(param1:CombatDistance, param2:Boolean = false) : Boolean
      {
         return false;
      }
      
      override public function react(param1:ReactionContext) : Boolean
      {
         switch(param1.index)
         {
            case 2:
               if(!get_player().hasStatusEffect(StatusEffects.FirstAttack) && get_player().statusEffectv1(StatusEffects.CounterAB) != 1)
               {
                  if(get_HP() < 1 || get_lust() >= maxLust())
                  {
                     return true;
                  }
                  if(get_player().get_lust() <= 30)
                  {
                     outputText("[pg]当你挥舞着[weapon]冲向让-克洛德时，他甚至连动都没动一下。");
                     outputText("[pg][say: 奴隶，你为什么要攻击我？]他说道。这位蛇怪之王听起来真的很困惑。他的眼睛闪烁着炽热的黄色光芒，当他张开双臂时，那光芒仿佛穿透了你，他环顾四周，似乎在乞求观众给个解释。[say: 你似乎迷失了，无法理解现状，竟然对照顾你的人大打出手。你不知道自己是谁吗？不知道自己在哪吗？]他眼中的那种强迫感，那种永无止境的炽热，正在……正在改变一切。你需要尽快结束这场战斗。");
                  }
                  else if(get_player().get_lust() <= 50)
                  {
                     outputText("[pg]你的[weapon]再次重重地击中让-克洛德。但感觉又不对劲了。它再次让你浑身泛起一阵痛苦的共鸣，仿佛你在做一件违背本性的事情。");
                     outputText("[pg][say: 奴隶，你为什么要和你的主人战斗？]他说道。他比以前更大了。或者说，你变得更小了。[say: 你很困惑。放下你的武器——你不是战士，你这样胡乱挥舞只会伤到自己。你已经忘记了你受过的训练。放下它，让我来帮你。]他是对的。确实很痛。你的身体在低语，如果能完全敞开心扉，沐浴在那金色的眼眸中，任由它摆布和穿透，感觉会好得多。你咬紧牙关，更紧地握住你的[weapon]，但你无法阻止那催眠般的强迫感在你体内建立起的温暖。");
                  }
                  else if(get_player().get_lust() <= 80)
                  {
                     outputText("[pg][say: 你觉得我会生你的气吗？]让-克洛德低声咆哮道。你的感官变得更加敏锐，他那狂野的麝香味充斥着你的鼻腔。你很难集中注意力……或者说，你很难不把注意力集中在他那坚实、轮廓分明的身躯上流淌的汗水，他那粗壮凸起的肉棒，他那强有力的双腿和尾巴自信的动作，以及那光芒，那诱人的金色光芒，它吸引着你，把那么多美妙的想法和感觉推入你的脑海……[say: 我没有生气。你必须受到惩罚，是的，但你知道那是理所当然的，最终你会接受并享受被纠正的过程。来吧，奴隶。你这种愚蠢的行为只会加重你的惩罚。]");
                  }
                  else
                  {
                     outputText("[pg]你不能……你不断向你的主人举起武器是有原因的，但那是什么原因呢？不可能是因为你认为自己能打败像他这样强大、如神一般的阿尔法雄性。如果能在光芒前屈膝，永远迷失在其中，用你那发情的荡妇身体侍奉它，那感觉会好得多，这也是像你这样低贱无助的人唯一能提供给他的东西。主人的嘴在动，但你已经分不清他的声音在哪里结束，你脑海中的声音又在哪里开始……只是你紧紧抓住一个理由，就像你紧紧抓住你的[weapon]一样，不管那是什么，不管它现在看起来多么愚蠢和遥远，那是一个继续战斗的理由……");
                  }
                  get_player().takeLustDamage(25,true);
                  return true;
               }
               break;
            case 5:
               outputText("让-克洛德嚎叫着，向后踉跄了几步，然后转过身来面对你，愤怒扭曲了他那张龙一般的脸，让他的双眼燃烧起来。你的法术似乎给他造成了肉体上的痛苦，但并没有使他那没有眼睑的视线致盲。");
               outputText("[pg][say: 你以为你的乡野魔法对我有用吗，入侵者？]他咆哮道。[say: 来——让我给你看看真正的魔法是怎么用的。]他眼中愤怒的光芒变得更加强烈，燃烧着刺眼的白光，强迫你直视它……");
               if(Utils.rand(get_player().get_spe()) >= 50 || Utils.rand(get_player().get_inte()) >= 50)
               {
                  outputText("[pg]那光芒刺痛了你的眼睛，但凭借着有意识的努力和克制，你在它将你催眠之前，在让-克洛德将你致盲之前，摆脱了那催眠般的吸引力。");
                  outputText("[pg][say:你玩阴的，]怪物厉声说道。他听起来是真的被激怒了。[say:我听说入侵者是个危险的战士，而不是一个接受了荣誉决斗，然后往对手眼睛里撒沙子的小[boy]。看着我的眼睛，小[boy]。这很公平。]");
                  get_game().combat.doDamage(int(10 + (get_player().get_inte() / 3 + Utils.rand(get_player().get_inte() / 2)) * get_player().spellMod()),true,true);
               }
               else
               {
                  outputText("[pg]当你盯着它看时，那光芒刺痛了你的眼睛和大脑。它是如此强大，如此无限，如此令人痛苦，以至于你想知道为什么你还会想看其他任何东西，任何——你费了九牛二虎之力，才挣脱了它，大口喘着粗气。你所能看到的只有残影，在你的视野中闪烁着刺眼的白色和黄色。当你听到让-克洛德大笑时，你盲目地在周围挥舞，试图与怪物保持距离。");
                  outputText("[pg][say: 尝尝你自己的药，感觉不太好，是吧？迟早我会让你看到更美好的东西，入侵者，别担心。一旦你认清了自己的位置。]");
                  get_player().createStatusEffect(StatusEffects.Blind,Utils.rand(4) + 1,0,0,0);
               }
               return false;
         }
         return true;
      }
      
      override public function performCombatAction() : void
      {
         var _loc1_:MonsterAI = new MonsterAI();
         _loc1_.add(doubleAttack,1,true,10,FATIGUE_PHYSICAL,CombatRange.ChargingMelee);
         _loc1_.exec();
      }
      
      public function handleTease(param1:Number, param2:Boolean) : void
      {
         if(!get_player().hasStatusEffect(StatusEffects.RemovedArmor) && get_player().get_armor() != ArmorLib.NOTHING)
         {
            outputText("[pg]让-克洛德停止了绕着你转圈，当你试图用身体引诱他时，他看起来有些惊讶。");
            outputText("[pg][say: 这就是传说中的英格纳姆勇者？]他沙哑地说。[say: 像莉希丝手下最业余的脱衣舞娘一样炫耀自己？]他的眼睛闪烁着橙色的光芒。[say: 如果这从一开始就是你的意图，闯入者，你不应该做得这么敷衍。你应该脱掉你所有的衣服，拥抱你真正的样子，让我看看你到底是由什么组成的。]催眠的强迫感压迫着你，命令你举起双手去解开你[armor]的搭扣……");
            if(!param2)
            {
               outputText("[pg]你咬紧牙关，抵抗着，把手从衣服上扯开。让-克洛德轻蔑地哼了一声，重新握紧了他的弯刀。");
            }
            else
            {
               outputText("[pg]你的意图是唤起这个生物的欲望。毫无疑问，你现在能做的最能唤起欲望的事情就是脱掉你所有的衣服。你对他微笑，半闭着眼睛，性感地慢慢滑出你的[armor]，撅起你的[butt]，吮吸着一根手指，先解开上半部分，然后是下半部分，让它一件一件地滑落。蛇怪站在后面看着，咧嘴笑着，他的眼睛里燃烧着欲望的篝火，握着他粗壮的阴茎之一慢慢自慰，而你则把内衣踢开，向他抛媚眼，拱起背展示你的[chest]。");
               outputText("[pg][say: 非常好，闯入者，]让-克洛德喘息着。他宽阔的笑容变得丑陋。[say: 期待每天晚上都能看到这个。我希望这里对你来说不会太冷。]包围你的蛇怪们窃笑着，你眨了眨眼，当你意识到你刚刚做了什么时，眼前的鳞片脱落了。没有时间把衣服穿回去了：让-克洛德扑向你，迫使你后退，你将不得不在赤身裸体的情况下完成剩下的战斗！");
               get_player().createStatusEffect(StatusEffects.RemovedArmor,0,0,0,0);
               if(!hasStatusEffect(StatusEffects.JCLustLevel))
               {
                  createStatusEffect(StatusEffects.JCLustLevel,1,0,0,0);
                  lustVuln += 0.1;
               }
               else
               {
                  addStatusValue(StatusEffects.JCLustLevel,1,1);
               }
               applyTease(param1);
               get_player().takeLustDamage(20,true);
            }
         }
         else
         {
            outputText("[pg][say: 即使被当成傻瓜，你仍然尝试，你仍然认为你可以用我已经看过一千次的东西来引诱我，]让-克洛德叹了口气。[say: 为什么不放弃呢，闯入者？你做这些事情是因为它们唤起了你的欲望，而不是因为你希望它们能唤起我的欲望。放弃吧，拥抱你生来就该过的生活。]尽管说了这些话，他饥渴的目光仍然停留在你的身体上。也许他控制不住自己。你只能希望如此……");
            if(param2)
            {
               applyTease(param1);
            }
            get_player().takeLustDamage(20,true);
         }
      }
      
      public function doubleAttack() : void
      {
         outputText("这只巨大的蛇怪突然向前扑来，一言不发地咆哮着，向你挥舞了两次弯刀，这攻击既野蛮又像是一位剑术大师。[pg]");
         createStatusEffect(StatusEffects.Attacks,2,0,0,0);
         eAttack();
      }
      
      override public function defeated(param1:Boolean) : void
      {
         get_game().lethicesKeep.jeanClaude.beatDaFuckhugeBasilisk(param1);
      }
   }
}

