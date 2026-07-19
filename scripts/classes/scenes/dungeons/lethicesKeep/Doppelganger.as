package classes.scenes.dungeons.lethicesKeep
{
   import classes.BreastRow;
   import classes.CoC;
   import classes.Cock;
   import classes.CockTypesEnum;
   import classes.DynStat;
   import classes.Monster;
   import classes.Player;
   import classes.ReactionContext;
   import classes.StatusEffects;
   import classes.Vagina;
   import classes.internals.Utils;
   import classes.items.Weapon;
   import classes.scenes.combat.Combat;
   import flash.Boot;
   
   public class Doppelganger extends Monster
   {
      
      public var _roundCount:int;
      
      public function Doppelganger()
      {
         var _loc1_:int = 0;
         var _loc2_:* = null as BreastRow;
         var _loc3_:* = null as BreastRow;
         if(Boot.skip_constructor)
         {
            return;
         }
         _roundCount = 0;
         super();
         set_a("");
         set_short("doppelganger");
         set_long("");
         set_race("Demon");
         imageName = "doppelganger";
         set_plural(false);
         set_tallness(get_player().get_tallness());
         if(get_player().balls > 0)
         {
            balls = get_player().balls;
            ballSize = get_player().ballSize;
         }
         else
         {
            balls = 0;
            ballSize = 0;
         }
         set_hoursSinceCum(get_player().get_hoursSinceCum());
         hips.rating = get_player().hips.rating;
         if(hips.rating < 1)
         {
            hips.rating = 1;
         }
         butt.rating = get_player().butt.rating;
         if(butt.rating < 1)
         {
            butt.rating = 1;
         }
         lowerBody.type = get_player().lowerBody.type;
         skin.desc = get_player().skin.desc;
         initStrTouSpeInte(get_player().get_str(),get_player().get_tou(),get_player().get_spe(),get_player().get_inte());
         initLibSensCor(get_player().lib,get_player().sens,get_player().cor);
         if(cor < 50)
         {
            cor = 50;
         }
         face.type = get_player().face.type;
         skin.type = get_player().skin.type;
         skin.desc = get_player().skin.desc;
         bonusHP = 250;
         set_weaponName(get_player().get_weaponName());
         set_weaponAttack(get_player().get_weaponAttack());
         set_weaponVerb(get_player().get_weaponVerb());
         normalAttackAvoid.doParry = false;
         normalAttackAvoid.doCounter = false;
         set_armorDef(get_player().get_armorDef());
         set_armorName(get_player().get_armorName());
         level = get_player().level;
         ass.analLooseness = get_player().ass.analLooseness;
         ass.analWetness = get_player().ass.analWetness;
         if(int(get_player().cocks.length) > 0)
         {
            _loc1_ = 0;
            while(_loc1_ < int(get_player().cocks.length))
            {
               createCock(get_player().cocks[_loc1_].cockLength,get_player().cocks[_loc1_].cockThickness,get_player().cocks[_loc1_].get_cockType());
               _loc1_++;
            }
         }
         if(int(get_player().vaginas.length) > 0)
         {
            createVagina();
            vaginas[0].vaginalLooseness = get_player().vaginas[0].vaginalLooseness;
            vaginas[0].vaginalWetness = get_player().vaginas[0].vaginalWetness;
            vaginas[0].virgin = get_player().vaginas[0].virgin;
         }
         if(int(get_player().vaginas.length) == 0 && int(get_player().cocks.length) == 0)
         {
            createVagina();
            vaginas[0].vaginalLooseness = 2;
            vaginas[0].vaginalWetness = 6;
            vaginas[0].virgin = false;
         }
         breastRows.resize(0);
         _loc1_ = 0;
         while(_loc1_ < int(get_player().breastRows.length))
         {
            createBreastRow();
            _loc2_ = breastRows[_loc1_];
            _loc3_ = get_player().breastRows[_loc1_];
            _loc2_.breastRating = _loc3_.breastRating;
            _loc2_.breasts = _loc3_.breasts;
            _loc2_.fuckable = _loc3_.fuckable;
            _loc2_.lactationMultiplier = _loc3_.lactationMultiplier;
            _loc2_.milkFullness = _loc3_.milkFullness;
            _loc2_.nipplesPerBreast = _loc3_.nipplesPerBreast;
            _loc1_++;
         }
         pronoun1 = get_player().mf("he","she");
         pronoun2 = get_player().mf("him","her");
         pronoun3 = get_player().mf("his","her");
         set_drop(NO_DROP);
         checkMonster();
      }
      
      override public function won(param1:Boolean, param2:Boolean = false) : void
      {
         get_game().lethicesKeep.doppelganger.inSovietCoCSelfFucksYou();
      }
      
      override public function react(param1:ReactionContext) : Boolean
      {
         var _loc2_:* = null as Combat;
         switch(param1.index)
         {
            case 1:
               if(!hasStatusEffect(StatusEffects.Stunned))
               {
                  if(get_game().combat.damage > 0)
                  {
                     _loc2_ = get_game().combat;
                     get_game().combat.damage = _loc2_.doDamage(get_game().combat.damage,false);
                  }
                  mirrorAttack(get_game().combat.damage);
                  return false;
               }
               break;
            case 3:
               clearOutput();
               outputText("你决定在这个回合不采取任何行动。[pg]");
               handlePlayerWait();
               return false;
         }
         return true;
      }
      
      public function mirrorTease(param1:Number, param2:Boolean) : void
      {
         clearOutput();
         outputText("你诱惑地在自己身上抚摸着，然后——你停了下来。分身也停了下来，带着邪恶的娇羞盯着你，[his]的手停在[his]身上，位置和你的完全一样。你回瞪着，再次开始你缓慢、充满情欲的动作，而你的倒影也做着完全一样的事情。这是一场情欲的较量！");
         if(param1 > 0 && param2)
         {
            outputText("[pg]你坚定地展示并扭动你的肉体，展现你所知道的它的最大优势，无视分身在做什么——毕竟，你对它非常熟悉。几秒钟缓慢地过去后，你的倒影脸上泛起了一丝红晕，[his]手开始颤抖，无法再跟上你的动作，[he]只是盯着你在做什么。");
            outputText("[pg][say: 已经……已经太久了，][he]呻吟着，设法挣脱出来，带着充满欲望的愤怒盯着你那带着坏笑、燃烧着欲火的眼睛。[say: 但我会得到它的，我很快就会得到一切！]");
            applyTease(param1);
         }
         else
         {
            outputText("你继续尽可能地移动和展示你的身体，但当你的分身嘲弄地模仿你时，一种压倒性的自我意识蔓延开来。你这样做的时候真的是这个样子吗？看起来那么廉价，那么笨拙，那么绝望。当红晕爬上你的脸颊时，你感到一阵模糊的眩晕，因为局势的控制权发生了转移——你开始模仿分身，而[he]则残忍地继续夸张地在[his]身体上滑动[his]双手。");
            outputText("[pg][say: 怎么了，[name]？][he]喘息着，充满欲望地盯着你的眼睛，[he]将双手探入[his]胯部并向前弯腰，迫使你靠近[his]脸。[say: 从来没在镜子前试过吗？你错过了你这个下流小荡妇的真面目。]");
            get_player().takeLustDamage(param1 + (Utils.rand(7) - 3),true);
         }
         addTalkShit();
      }
      
      public function mirrorAttack(param1:Number) : void
      {
         createStatusEffect(StatusEffects.MirroredAttack,0,0,0,0);
         outputText("当你挥舞着你的[weapon]砍向分身时，[he]嘲弄地笑了笑，完全模仿了你的动作，挥舞着[his]复制的[weapon]向前猛冲。");
         if(param1 > 0 && get_player().get_inte() > Utils.rand(140))
         {
            outputText("在最后关头，你向下扭动身体，击中了对手的躯干，引得[him]痛苦地喘息了一声，同时[he]笨拙地挥舞着[his]的[weapon]从你头顶掠过。现在轮到你模仿[him]了，你嘲弄地微笑着，看着[he]在狂暴的咆哮中重新站稳脚跟，[his]的声音在努力维持控制时冒着泡、闪烁不定。<b>(<font color=\"" + get_game().mainViewManager.colorHpMinus() + "\">" + param1 + "</font>)</b>");
            set_HP(get_HP() - param1);
         }
         else
         {
            outputText("你的");
            if(get_player().get_weapon().isUnarmed())
            {
               outputText("[weapon]");
            }
            else
            {
               outputText("[weapon]");
            }
            outputText("伴随着令人骨头震颤的撞击声相遇，你被一股与你完全相等的力道震得向后踉跄。");
            outputText("[pg][say:再试一次，[name]，]分身冷笑着，嘲弄地模仿着你的踉跄。[say:来吧。真正地测试一下你自己。]");
         }
         addTalkShit();
      }
      
      public function handleSpellResistance(param1:String) : void
      {
         outputText("当你猛烈而强大的火焰席卷[him]时，镜魔甚至连眉头都没皱一下。");
         outputText("[pg][say:你来这里之后学到了几招，是吗？][he]打了个哈欠。火焰的闪烁附着在[his]的手指上，它的光芒噼啪作响并燃烧殆尽，取而代之的是一种铁青的黑色。[say:农奴魔法。容易上手，容易使用，但很难让人印象深刻。让我给你展示一下真正的魔法是怎么用的！][He]伸出[his]的双手，向你直接投掷了一个无情的黑色火球，这是你刚刚向[him]发射的火球的负面复制品。");
         if(param1 == "fireball")
         {
            get_player().takeDamage(get_player().level * 10 + 45 + Utils.rand(10),true);
         }
         else if(param1 == "whitefire")
         {
            get_player().takeDamage(10 + (get_player().get_inte() / 3 + Utils.rand(get_player().get_inte() / 2)),true);
         }
         else if(param1 == "blackfire")
         {
            get_player().takeDamage(30 + (get_player().get_inte() / 3 + Utils.rand(get_player().get_inte() / 2)),true);
         }
         addTalkShit();
         get_game().combat.startMonsterTurn();
      }
      
      public function handlePlayerWait() : void
      {
         outputText("你的分身同样选择在战斗的起伏中稍作休息。");
         addTalkShit();
      }
      
      override public function get_long() : String
      {
         var _loc1_:String = "";
         _loc1_ += "你正在与分身战斗。[He]是一个";
         _loc1_ += Math.floor(get_player().get_tallness() / 12) + "英尺" + get_player().get_tallness() % 12 + "英寸高的";
         _loc1_ += "[race]，有着[bodytype]。";
         _loc1_ += "[His]脸有着[facelong]。";
         _loc1_ += " [His][hair]被";
         switch(get_player().horns.type)
         {
            case 1:
               _loc1_ += " 一对像马一样的耳朵";
               break;
            case 2:
               _loc1_ += " 一对狗耳朵";
               break;
            case 3:
               _loc1_ += " 一对圆圆的、软趴趴的牛耳朵";
               break;
            case 4:
               _loc1_ += " 一对大大的尖耳朵";
               break;
            case 5:
               _loc1_ += " 一对可爱毛茸茸的猫耳";
               break;
            case 6:
            case 10:
               _loc1_ += " 一对带有小孔的圆形突起";
               break;
            case 7:
               _loc1_ += " 一对软趴趴的兔耳";
               break;
            case 9:
               _loc1_ += " 一对大而灵敏的狐狸耳朵";
               break;
            case 11:
               _loc1_ += " 一对毛茸茸的、隐约呈蛋形的浣熊耳朵";
               break;
            case 12:
               _loc1_ += " 一对大大的、像碟子一样的老鼠耳朵";
               break;
            case 13:
               _loc1_ += " 一对小巧圆润的雪貂耳朵";
               break;
            case 14:
               _loc1_ += " 一对猪耳朵";
               break;
            default:
               _loc1_ += " 一对难以名状的耳朵";
         }
         _loc1_ += "。[He]用舌头不停探舔着[his]嘴边，带着一种令人不安的贪婪与情欲意味。";
         _loc1_ += " [He]用[his][legs]抽搐着移动，[his][hips]摇摆并紧绷着。";
         if(get_player().tail.type != 0)
         {
            _loc1_ += " [His]尾巴甩来甩去。";
         }
         _loc1_ += " [He]挥舞着和你完全一样的[weapon]，穿着和你[armor]镜像一样的衣服。";
         if(get_player().biggestTitSize() >= 2)
         {
            _loc1_ += " 很难不注意到你那镜像般的" + get_player().breastDescript(get_player().biggestTitRow()) + "在其中起伏的模样。";
         }
         return _loc1_;
      }
      
      override public function doAI() : void
      {
         if(hasStatusEffect(StatusEffects.Stunned))
         {
            removeStatusEffect(StatusEffects.Stunned);
            outputText("你的复制体被打懵了，为你争取到了一个回合！");
            return;
         }
         outputText("面对你的攻击，你的复制体只是轻声嗤笑。");
         addTalkShit();
      }
      
      override public function defeated(param1:Boolean) : void
      {
         get_game().lethicesKeep.doppelganger.punchYourselfInTheBalls();
      }
      
      public function addTalkShit() : void
      {
         switch(_roundCount)
         {
            case 0:
               outputText("[pg][say: 你感觉到了，不是吗？]分身低语着，让你的嘴扭曲成一个恶毒的笑容。[say: 转移。镜子是一个真空，里面没有生命；它渴望有人来填补它。准确地说，是你的生命。我的生命比你的更渴望自由。准确地说，是多渴望了十年。]");
               outputText("[pg][He]继续用沉闷的低吟声说着，同时[he]继续绕着你转圈，以一种存在了才几分钟的身体里生物特有的、奇怪的、切分音般的抽搐动作移动着。[say: 就让它发生吧，[name]。你打不过我的。我就是你，只是拥有恶魔的知识和力量。接受你的命运吧。]");
               outputText("[pg]一种奇怪的颤动感顺着你的手臂蔓延开来，伴随着一阵寒意，你低头看到它微微闪烁，就像你透过流动的水看着它一样。");
               outputText("[pg]<b>你需要尽快结束这一切。</b>");
               break;
            case 1:
               outputText("[pg][say: 你知道吗，我甚至都不记得我被困在那面镜子里之前是什么性别了？] 分身说道，同时[he]若有所思地将一只手滑入你大腿的镜像对应物之间。[say: 我喜欢一直改变。当从一种形状转变为另一种形状的工具总是存在时，被困在一种性别里似乎太无聊了。这就是为什么这是对我的惩罚。被迫一直改变，在任何碰巧看向这个被诅咒的东西的人的无意识命令下。你不得不承认莉希丝的厉害，她不仅残忍，而且还有想象力。这真是一个可怕的组合。我不想看到她为你准备了什么。]");
               break;
            case 2:
               outputText("[pg][say: 不过这个……我喜欢这个，[name]。] [He]闭上[his]的眼睛，并且");
               if(get_player().hasCock())
               {
                  outputText("抚摸着[his][cock]");
               }
               else if(get_player().hasVagina())
               {
                  outputText("将两根手指滑入[his]的[vagina]中，轻轻地抚弄着[himself]");
               }
               else
               {
                  outputText("将一只手滑入");
               }
               outputText("在[his]" + get_armorName() + "下面。看着自己自慰的极度怪异感让你停顿了一下；不真实感再次加剧，你感到自己不安地闪烁着。[say: 等我离开这里，我要一直保持这个样子。为了纪念那个好心给我这个身体的人，我要好好享受一次不改变形态的乐趣！]");
               outputText("[pg]你的身体在边缘闪烁并失去对比度，而你的倒影却变得越来越清晰，这种现象越来越难以忽视。");
               outputText("[pg]<b>你带着越来越强烈的恐惧意识到，如果你不阻止它，这真的会发生。</b>");
               break;
            case 3:
               outputText("[pg][say:你的记忆流向我，[name]，而你却像记忆一样消退。我能尝到它们的味道……]你努力保持专注，试图强迫你的身体和思想不要像窗玻璃上的指纹一样模糊，而分身则幸福地叹息着。");
               outputText("[pg][say:不错，不错。对于一个英格纳姆的乡巴佬来说，你的生活相当有趣，不是吗？到处跑。不过性生活不够。远远不够。别担心——我会在适当的时候纠正这个错误。]");
               break;
            case 4:
               outputText("[pg][say:你真的以为你能打败莉希丝吗，乡巴佬？]分身咆哮道。[He]现在行动和说话都充满自信，[his]以前的抽搐消失了，陶醉于并成长为[his]的新形态。");
               outputText("[pg]你不敢张嘴，生怕听到那声音的拙劣模仿。[say: 哦，靠着勇气、狡诈和运气，你走到了这一步，但打败恶魔女王？你，一个仍然紧紧抓住自己懦弱、简单灵魂的人，因此对恶魔的本质、它的力量、它的牺牲一无所知？我是在帮你和这个世界一个忙，曾经的[name]，因为我不仅要拿走这具完美的身体，还要拿走它如此笨拙地承载着的责任。凭借我的知识和你的蛮力，我将向莉希丝复仇，世界将摆脱她和她的残忍！] [He]狂笑着。那刺耳的疯狂笑声在你听来却越来越沉闷，仿佛是隔着一层玻璃传来的。");
               outputText("[pg]<b>你还有时间和力气进行最后一次孤注一掷……</b>");
               break;
            case 5:
               outputText("[pg]微光瞬间增强，似乎有什么东西……发生了改变……");
               if(int([DynStat.Lust(1000)].length) == 0)
               {
                  get_game().player.dynStats();
                  break;
               }
               if(int([DynStat.Lust(1000)].length) == 1)
               {
                  get_game().player.dynStats([DynStat.Lust(1000)][0]);
                  break;
               }
               if(int([DynStat.Lust(1000)].length) == 2)
               {
                  get_game().player.dynStats([DynStat.Lust(1000)][0],[DynStat.Lust(1000)][1]);
                  break;
               }
               if(int([DynStat.Lust(1000)].length) == 3)
               {
                  get_game().player.dynStats([DynStat.Lust(1000)][0],[DynStat.Lust(1000)][1],[DynStat.Lust(1000)][2]);
                  break;
               }
               if(int([DynStat.Lust(1000)].length) == 4)
               {
                  get_game().player.dynStats([DynStat.Lust(1000)][0],[DynStat.Lust(1000)][1],[DynStat.Lust(1000)][2],[DynStat.Lust(1000)][3]);
                  break;
               }
               if(int([DynStat.Lust(1000)].length) == 5)
               {
                  get_game().player.dynStats([DynStat.Lust(1000)][0],[DynStat.Lust(1000)][1],[DynStat.Lust(1000)][2],[DynStat.Lust(1000)][3],[DynStat.Lust(1000)][4]);
                  break;
               }
               if(int([DynStat.Lust(1000)].length) == 6)
               {
                  get_game().player.dynStats([DynStat.Lust(1000)][0],[DynStat.Lust(1000)][1],[DynStat.Lust(1000)][2],[DynStat.Lust(1000)][3],[DynStat.Lust(1000)][4],[DynStat.Lust(1000)][5]);
                  break;
               }
               if(int([DynStat.Lust(1000)].length) == 7)
               {
                  get_game().player.dynStats([DynStat.Lust(1000)][0],[DynStat.Lust(1000)][1],[DynStat.Lust(1000)][2],[DynStat.Lust(1000)][3],[DynStat.Lust(1000)][4],[DynStat.Lust(1000)][5],[DynStat.Lust(1000)][6]);
                  break;
               }
               if(int([DynStat.Lust(1000)].length) == 8)
               {
                  get_game().player.dynStats([DynStat.Lust(1000)][0],[DynStat.Lust(1000)][1],[DynStat.Lust(1000)][2],[DynStat.Lust(1000)][3],[DynStat.Lust(1000)][4],[DynStat.Lust(1000)][5],[DynStat.Lust(1000)][6],[DynStat.Lust(1000)][7]);
                  break;
               }
               if(int([DynStat.Lust(1000)].length) == 9)
               {
                  get_game().player.dynStats([DynStat.Lust(1000)][0],[DynStat.Lust(1000)][1],[DynStat.Lust(1000)][2],[DynStat.Lust(1000)][3],[DynStat.Lust(1000)][4],[DynStat.Lust(1000)][5],[DynStat.Lust(1000)][6],[DynStat.Lust(1000)][7],[DynStat.Lust(1000)][8]);
                  break;
               }
               if(int([DynStat.Lust(1000)].length) == 10)
               {
                  get_game().player.dynStats([DynStat.Lust(1000)][0],[DynStat.Lust(1000)][1],[DynStat.Lust(1000)][2],[DynStat.Lust(1000)][3],[DynStat.Lust(1000)][4],[DynStat.Lust(1000)][5],[DynStat.Lust(1000)][6],[DynStat.Lust(1000)][7],[DynStat.Lust(1000)][8],[DynStat.Lust(1000)][9]);
                  break;
               }
               if(int([DynStat.Lust(1000)].length) == 11)
               {
                  get_game().player.dynStats([DynStat.Lust(1000)][0],[DynStat.Lust(1000)][1],[DynStat.Lust(1000)][2],[DynStat.Lust(1000)][3],[DynStat.Lust(1000)][4],[DynStat.Lust(1000)][5],[DynStat.Lust(1000)][6],[DynStat.Lust(1000)][7],[DynStat.Lust(1000)][8],[DynStat.Lust(1000)][9],[DynStat.Lust(1000)][10]);
                  break;
               }
               if(int([DynStat.Lust(1000)].length) == 12)
               {
                  get_game().player.dynStats([DynStat.Lust(1000)][0],[DynStat.Lust(1000)][1],[DynStat.Lust(1000)][2],[DynStat.Lust(1000)][3],[DynStat.Lust(1000)][4],[DynStat.Lust(1000)][5],[DynStat.Lust(1000)][6],[DynStat.Lust(1000)][7],[DynStat.Lust(1000)][8],[DynStat.Lust(1000)][9],[DynStat.Lust(1000)][10],[DynStat.Lust(1000)][11]);
                  break;
               }
               if(int([DynStat.Lust(1000)].length) == 13)
               {
                  get_game().player.dynStats([DynStat.Lust(1000)][0],[DynStat.Lust(1000)][1],[DynStat.Lust(1000)][2],[DynStat.Lust(1000)][3],[DynStat.Lust(1000)][4],[DynStat.Lust(1000)][5],[DynStat.Lust(1000)][6],[DynStat.Lust(1000)][7],[DynStat.Lust(1000)][8],[DynStat.Lust(1000)][9],[DynStat.Lust(1000)][10],[DynStat.Lust(1000)][11],[DynStat.Lust(1000)][12]);
                  break;
               }
               if(int([DynStat.Lust(1000)].length) == 14)
               {
                  get_game().player.dynStats([DynStat.Lust(1000)][0],[DynStat.Lust(1000)][1],[DynStat.Lust(1000)][2],[DynStat.Lust(1000)][3],[DynStat.Lust(1000)][4],[DynStat.Lust(1000)][5],[DynStat.Lust(1000)][6],[DynStat.Lust(1000)][7],[DynStat.Lust(1000)][8],[DynStat.Lust(1000)][9],[DynStat.Lust(1000)][10],[DynStat.Lust(1000)][11],[DynStat.Lust(1000)][12],[DynStat.Lust(1000)][13]);
                  break;
               }
               if(int([DynStat.Lust(1000)].length) == 15)
               {
                  get_game().player.dynStats([DynStat.Lust(1000)][0],[DynStat.Lust(1000)][1],[DynStat.Lust(1000)][2],[DynStat.Lust(1000)][3],[DynStat.Lust(1000)][4],[DynStat.Lust(1000)][5],[DynStat.Lust(1000)][6],[DynStat.Lust(1000)][7],[DynStat.Lust(1000)][8],[DynStat.Lust(1000)][9],[DynStat.Lust(1000)][10],[DynStat.Lust(1000)][11],[DynStat.Lust(1000)][12],[DynStat.Lust(1000)][13],[DynStat.Lust(1000)][14]);
                  break;
               }
               if(int([DynStat.Lust(1000)].length) == 16)
               {
                  get_game().player.dynStats([DynStat.Lust(1000)][0],[DynStat.Lust(1000)][1],[DynStat.Lust(1000)][2],[DynStat.Lust(1000)][3],[DynStat.Lust(1000)][4],[DynStat.Lust(1000)][5],[DynStat.Lust(1000)][6],[DynStat.Lust(1000)][7],[DynStat.Lust(1000)][8],[DynStat.Lust(1000)][9],[DynStat.Lust(1000)][10],[DynStat.Lust(1000)][11],[DynStat.Lust(1000)][12],[DynStat.Lust(1000)][13],[DynStat.Lust(1000)][14],[DynStat.Lust(1000)][15]);
                  break;
               }
               if(int([DynStat.Lust(1000)].length) == 17)
               {
                  get_game().player.dynStats([DynStat.Lust(1000)][0],[DynStat.Lust(1000)][1],[DynStat.Lust(1000)][2],[DynStat.Lust(1000)][3],[DynStat.Lust(1000)][4],[DynStat.Lust(1000)][5],[DynStat.Lust(1000)][6],[DynStat.Lust(1000)][7],[DynStat.Lust(1000)][8],[DynStat.Lust(1000)][9],[DynStat.Lust(1000)][10],[DynStat.Lust(1000)][11],[DynStat.Lust(1000)][12],[DynStat.Lust(1000)][13],[DynStat.Lust(1000)][14],[DynStat.Lust(1000)][15],[DynStat.Lust(1000)][16]);
                  break;
               }
               if(int([DynStat.Lust(1000)].length) == 18)
               {
                  get_game().player.dynStats([DynStat.Lust(1000)][0],[DynStat.Lust(1000)][1],[DynStat.Lust(1000)][2],[DynStat.Lust(1000)][3],[DynStat.Lust(1000)][4],[DynStat.Lust(1000)][5],[DynStat.Lust(1000)][6],[DynStat.Lust(1000)][7],[DynStat.Lust(1000)][8],[DynStat.Lust(1000)][9],[DynStat.Lust(1000)][10],[DynStat.Lust(1000)][11],[DynStat.Lust(1000)][12],[DynStat.Lust(1000)][13],[DynStat.Lust(1000)][14],[DynStat.Lust(1000)][15],[DynStat.Lust(1000)][16],[DynStat.Lust(1000)][17]);
                  break;
               }
               if(int([DynStat.Lust(1000)].length) == 19)
               {
                  get_game().player.dynStats([DynStat.Lust(1000)][0],[DynStat.Lust(1000)][1],[DynStat.Lust(1000)][2],[DynStat.Lust(1000)][3],[DynStat.Lust(1000)][4],[DynStat.Lust(1000)][5],[DynStat.Lust(1000)][6],[DynStat.Lust(1000)][7],[DynStat.Lust(1000)][8],[DynStat.Lust(1000)][9],[DynStat.Lust(1000)][10],[DynStat.Lust(1000)][11],[DynStat.Lust(1000)][12],[DynStat.Lust(1000)][13],[DynStat.Lust(1000)][14],[DynStat.Lust(1000)][15],[DynStat.Lust(1000)][16],[DynStat.Lust(1000)][17],[DynStat.Lust(1000)][18]);
                  break;
               }
               if(int([DynStat.Lust(1000)].length) == 20)
               {
                  get_game().player.dynStats([DynStat.Lust(1000)][0],[DynStat.Lust(1000)][1],[DynStat.Lust(1000)][2],[DynStat.Lust(1000)][3],[DynStat.Lust(1000)][4],[DynStat.Lust(1000)][5],[DynStat.Lust(1000)][6],[DynStat.Lust(1000)][7],[DynStat.Lust(1000)][8],[DynStat.Lust(1000)][9],[DynStat.Lust(1000)][10],[DynStat.Lust(1000)][11],[DynStat.Lust(1000)][12],[DynStat.Lust(1000)][13],[DynStat.Lust(1000)][14],[DynStat.Lust(1000)][15],[DynStat.Lust(1000)][16],[DynStat.Lust(1000)][17],[DynStat.Lust(1000)][18],[DynStat.Lust(1000)][19]);
                  break;
               }
               throw "Too many rest arguments";
               break;
            default:
               outputText("[pg][say: 你到底是怎么活下来的？] 分身一脸困惑地看着你。[say: 无所谓了，我还是要夺走你的身体。]");
         }
         _roundCount += 1;
         tookAction = true;
      }
   }
}

