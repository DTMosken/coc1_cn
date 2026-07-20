package classes.scenes.dungeons.lethicesKeep
{
   import classes.CoC;
   import classes.CockTypesEnum;
   import classes.Creature;
   import classes.Monster;
   import classes.PerkLib;
   import classes.Player;
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
   
   public class MinotaurKing extends Monster
   {
      
      public var excelliaHP:int;
      
      public var _orgasms:int;
      
      public var _milkDrinks:int;
      
      public var _lastSpellCastCount:int;
      
      public var _lastRoundStun:Boolean;
      
      public function MinotaurKing()
      {
         if(Boot.skip_constructor)
         {
            return;
         }
         _lastSpellCastCount = 0;
         _lastRoundStun = false;
         _orgasms = 0;
         _milkDrinks = 0;
         super();
         excelliaHP = 700 + get_player().newGamePlusMod() * 500;
         set_a("");
         set_short("minotaur king");
         set_long("");
         set_race("Minotaur");
         set_tallness(168);
         createCock(24,5,CockTypesEnum.HORSE);
         createBreastRow(0);
         balls = 2;
         ballSize = 4;
         set_hoursSinceCum(9999);
         hips.rating = 2;
         butt.rating = 2;
         initStrTouSpeInte(100,100,50,60);
         initLibSensCor(66,10,100);
         set_weaponName("axe");
         set_weaponAttack(50);
         set_weaponVerb("swing");
         set_armorName("rags");
         set_armorDef(60);
         bonusHP = 850;
         set_gems(75 + Utils.rand(50));
         level = 22;
         lustVuln = 0.05;
         additionalXP = 200;
         set_drop(NO_DROP);
         set_drop(new WeightedChoice(get_consumables().PROMEAD,1));
         checkMonster();
         _lastSpellCastCount = FlagDict_Impl_.arrayReadInt(get_flags(),868);
      }
      
      override public function won(param1:Boolean, param2:Boolean = false) : void
      {
         get_game().lethicesKeep.minotaurKing.hailToTheKingBaby(param1,param2);
      }
      
      override public function performCombatAction() : void
      {
         var _loc1_:MonsterAI = new MonsterAI();
         if(_lastRoundStun)
         {
            _lastRoundStun = false;
            if(get_player().hasStatusEffect(StatusEffects.Stunned))
            {
               _loc1_.add(dickslap,1,true,0,FATIGUE_NONE,CombatRange.Melee);
            }
         }
         else if(_lastSpellCastCount != FlagDict_Impl_.arrayReadInt(get_flags(),868))
         {
            _lastSpellCastCount = FlagDict_Impl_.arrayReadInt(get_flags(),868);
            _loc1_.add(headbutt,1,true,0,FATIGUE_NONE,CombatRange.ChargingMelee);
         }
         else
         {
            _loc1_.add(backhand,1,true,0,FATIGUE_NONE,CombatRange.Melee);
            _loc1_.add(battleaxe,1,true,0,FATIGUE_NONE,CombatRange.Melee);
            _loc1_.add(minoPheromones,1,true,0,FATIGUE_NONE,CombatRange.Tease);
         }
         _loc1_.exec();
      }
      
      public function minoPheromones() : void
      {
         outputText("牛头人对你笑了笑，掀起他的缠腰布，向你弹了一下。粗壮的先列腺液在空中飞舞，");
         if(Utils.rand(3) == 0)
         {
            outputText("在你反应过来之前就拍在了你的脸上！你把那滑溜溜的像鼻涕一样的东西从眼睛和鼻子上抹掉，");
            if(get_player().get_lust100() > 75)
            {
               outputText("不假思索地吞进了嘴里。");
               get_player().takeLustDamage(15 + get_player().lib / 10,true);
            }
            else
            {
               outputText("当你用舌头舔去嘴唇上的残留物时，你感到心脏因欲望而狂跳。");
               get_player().takeLustDamage(7.5 + get_player().lib / 20,true);
            }
         }
         else
         {
            outputText("直接从你头顶飞过。");
         }
         outputText("那野兽般的气味似乎钻进了你的体内，麝香般的香气化作一股灼热的液流，直冲你的下体。");
         get_player().takeLustDamage(15 + get_player().lib / 20,true);
         if(get_player().hasPerk(PerkLib.MinotaurCumAddict) || FlagDict_Impl_.arrayReadInt(get_flags(),20) >= 2)
         {
            if(Utils.rand(2) == 0)
            {
               outputText("\n<b>你因渴望而颤抖，现在你只想把脸埋在那块遮阴布下，吸干每一滴浓稠的精华。</b>");
            }
            else
            {
               outputText("\n<b>你呻吟着，一遍又一遍地舔着嘴唇，渴望着嘴里能尝到他的味道。</b>");
            }
            get_player().takeLustDamage(5 + Utils.rand(5),true);
         }
      }
      
      public function lustDump() : void
      {
         _orgasms += 1;
         outputText("这只极度发情的牛头人踉跄了一下，然后低头看着双腿间那根肿胀的肉柱。它在抽动，随着他心脏的每一次跳动在空中弹跳。硬成那样一定很疼，它充满了欲望，看起来随时都会爆发。他的一只手伸向它，然后单膝跪地。你成功了吗？你彻底击败这个野兽了吗？");
         outputText("[pg]一只巨大的手抓住了艾克塞莉亚的躯干，将她举到半空中。这个曲线丰满的母牛荡妇在这种情况做出了她唯一能做的事——她发出哞哞的叫声，张开双腿，兴奋的脸上挂着欢快的笑容。牛头人国王一秒钟也没耽搁，当场将她贯穿，将那根看起来有三英尺长的粗壮肉棒深深地插进了他最爱的荡妇体内。当他完全插进去时，他的睾丸拍打着她鼓胀的肚子，沾满了一层淫液。");
         outputText("[pg]这头野兽随意地操着她，把她当成一个超大号的性玩具。每一次连根没入的抽插，臀部拍打的声响都让这个年轻的奴隶浑身颤抖。淫液和先列腺液的混合物在她大张的阴道口周围泛起泡沫，飞溅的液滴弄湿了下方的地板。这是一场野兽般的交配，双方的脸上都没有任何言语的余地。这种交配让牛娘在难以名状的狂喜中颤抖、摇晃，甚至连简单的呻吟都做不到。");
         outputText("[pg]一秒钟后，艾克塞莉亚的主人也和她一起达到了高潮。他粗重的喘息声几乎没有什么变化。如果不是她的肚子突然像气球一样鼓起来，以及双腿间如瀑布般倾泻而出的精液，给主人的双腿镀上了一层充满情欲的白色，你甚至都不会察觉。精液的量绝对令人咋舌。你敬畏地看着艾克塞莉亚原本紧致的肚子被撑成了一个怀孕般的圆顶。她看起来随时都会分娩，但她的子宫里除了几加仑被污染的牛头人精液外，什么都没有。");
         if(get_player().hasPerk(PerkLib.MinotaurCumAddict))
         {
            outputText("你很嫉妒。那么多精液感觉一定很美妙！");
         }
         outputText("[pg]无论这场强力的交配施加了什么魔法，都在艾克塞莉亚从她主人依然坚挺的肉棒上滑落的那一刻被打破了。你闭上嘴，握紧你的[weapon]，而牛头人国王直起身子，大口喘着粗气。他看起来因为刚才的努力有些头晕，但依然能继续战斗。也许如果你能让他再次达到高潮，他就会彻底倒下？");
         set_lust(0);
      }
      
      public function hpRestore() : void
      {
         set_HP(maxHP());
         lustVuln += 0.15;
         set_lust(get_lust() + 2);
         _milkDrinks += 1;
         outputText("国王踉跄着后退，毫不迟疑地抓起他那顺从的奴隶，把她举到脸前，就像举起一杯刚酿好的啤酒一样轻松。她那巨大的乳房轻松地贴在巨大的牛头人的嘴唇上，你看到他大声地吞咽着，快速地喝下这乳白色的提神饮料。等他喝完时，他的伤口正在愈合，但他的肉棒却在抽搐，像筛子漏水一样漏出先列腺液。");
         outputText("[pg]<b>他看起来更容易被激起性欲了。无论她的奶水里有什么，虽然能治愈他的伤口，但也让他更容易受到兽性需求的影响。</b>");
         if(_milkDrinks >= 10)
         {
            outputText("[pg]<b>看起来国王的肚子已经完全肿胀了，太饱了，喝不下更多的奶了。</b>");
         }
      }
      
      public function headbutt() : void
      {
         outputText("[say: 老实点，]这头野兽咆哮着，随后试图用他的额头猛撞你的额头。");
         var _loc1_:Number = get_player().reduceDamage(eBaseDamage() / 2,this);
         var _loc2_:* = combatAvoidDamage(new AvoidDamageParameters(true,false,false,null,null,null,null,null));
         if(_loc1_ <= 0 || _loc2_.dodge == EVASION_SPEED || _loc2_.dodge == EVASION_FLEXIBILITY || _loc2_.dodge == EVASION_UNHINDERED || _loc2_.dodge == EVASION_BLIND)
         {
            outputText("幸运的是，你闪向一旁躲开了。");
         }
         else if(_loc2_.dodge == EVASION_EVADE)
         {
            outputText("幸运的是，你避开了。");
         }
         else if(_loc2_.dodge == EVASION_MISDIRECTION)
         {
            outputText("幸运的是，你误导了他的攻击。");
         }
         else
         {
            _lastRoundStun = true;
            outputText("他以惊人的力量撞击，让你晕头转向！");
            get_player().takeDamage(_loc1_,true);
            if(get_player().stun(0,100))
            {
               outputText("<b>你被这一击的力量震晕了！</b>");
            }
         }
      }
      
      override public function handleStun() : Boolean
      {
         outputText("这位肌肉发达的君主只花了一会儿就从眩晕中恢复过来。看起来他太像一个势不可挡的庞然大物了，这种程度的攻击根本无法阻止他。");
         removeStatusEffect(StatusEffects.Stunned);
         return true;
      }
      
      public function get_orgasms() : int
      {
         return _orgasms;
      }
      
      override public function get_long() : String
      {
         if(_orgasms == 0)
         {
            return "站在你和恶魔女王之间的是一个体型和身材都无与伦比的对手——牛头人国王。他是一头无法估量的野兽，身上覆盖着蓬松的毛发和几块碎皮革，这些根本无法掩盖他双腿间那根龟头膨大的肉棒。他手里拿着一把巨大的斧头，尽管他似乎不愿意使用它，而是更喜欢依靠双腿间散发出的情色气味。他闻起来充满男子气概、强壮，而且比你想象的更诱人。你最好小心点，不要沉迷其中。";
         }
         var _loc1_:String = "牛头人国王依然站在你和恶魔女王之间，大口喘着粗气。他的肉棒上涂满了自己强烈高潮后的残留物。他那高达14英尺的巨大身躯微微弯曲，死死盯着你，一只手仍然紧紧抓着他的斧头。再次将他逼向高潮无疑会超出他那惊人的忍耐力。唯一的问题是围绕着他的那种诱人的<i>香气</i>，空气中弥漫着汗水交织的床笫之欢和炽热快感的气息。你最好快点解决他。";
         if(get_lust100() < 40)
         {
            _loc1_ += "\n\n在他双腿下方是他最宠爱的荡妇，名叫艾克塞莉亚。她乖巧地待在不妨碍他的地方，展示着她曲线优美的身姿和成熟的性感，偶尔用手指划过她肚子上的一个奇怪纹身。你最好把注意力集中在眼前的战斗上。";
         }
         else if(get_lust100() < 80)
         {
            _loc1_ += "\n\n在他双腿下方是他最宠爱的荡妇艾克塞莉亚倒下的身影。他小心翼翼地绕过失去知觉的牛娘，但从不让她离开自己一臂之遥，他的目光时不时地扫向她湿润的私处。";
         }
         else
         {
            _loc1_ += "\n\n在他双腿下方是他最宠爱的荡妇艾克塞莉亚被内射后的身影。乳白色的精液在她张开的双腿间积成一滩，只有她那淫荡挺立的乳头溢出的乳汁光泽能与之相提并论。她的主人从不让她倒下的身体离开自己一臂之遥，以防他需要喝一杯。";
         }
         if(_milkDrinks != 0)
         {
            if(_milkDrinks == 1)
            {
               _loc1_ += "\n\n<b>自从国王从他的奴隶荡妇的乳头喝了一口奶后，他就一直用欣赏的目光看着你。也许他更容易受到低级欲望的影响……</b>";
            }
            else if(_milkDrinks < 10)
            {
               _loc1_ += "\n\n<b>国王盯着你时，鼻孔微微扩张。很明显，他每从他的奴隶荡妇的乳头上喝一口奶，就变得更容易接受你的挑逗。</b>";
            }
            else
            {
               _loc1_ += "\n\n<b>国王的肚子看起来鼓鼓的，显然装满了他的荡妇的奶水。看起来他再也喝不下任何奶了。</b>";
            }
         }
         if(excelliaHP <= 0)
         {
            _loc1_ += "\n\n<b>艾克塞莉亚似乎因为你对她造成的伤害而失去了知觉。</b>";
         }
         return _loc1_;
      }
      
      public function dickslap() : void
      {
         outputText("在你完全恢复理智之前，这个野兽就扑向了你，他一只手轻松地抓住你的手，同时毫不温柔地把他的肉棒拍在你的脸上，拖着他那散发着麝香的阴茎在你的脸颊上蹭来蹭去，最后才离开。");
         if(_orgasms > 0)
         {
            outputText("几缕他的");
            if(get_player().hasPerk(PerkLib.MinotaurCumAddict))
            {
               outputText("神级");
            }
            outputText("精液挂在你的鼻子上，直到你的舌头伸出来把它们舔干净。");
            if(get_player().hasPerk(PerkLib.MinotaurCumAddict))
            {
               outputText("真美味。");
            }
            else
            {
               outputText("你为什么这么做？为什么感觉这么好？");
            }
         }
         get_player().takeLustDamage(15 + get_player().lib / 20,true);
      }
      
      override public function defeated(param1:Boolean) : void
      {
         if(_orgasms == 0 && !param1)
         {
            lustDump();
            tookAction = true;
            get_game().combat.startMonsterTurn();
            return;
         }
         if(param1 && _milkDrinks < 10)
         {
            hpRestore();
            tookAction = true;
            get_game().combat.startMonsterTurn();
            return;
         }
         get_game().lethicesKeep.minotaurKing.theKingIsDeadLongLiveTheKing(param1);
      }
      
      public function cowslutTeaseCocks() : void
      {
         var _loc1_:int = 0;
         if(get_player().hasCock())
         {
            _loc1_ = Utils.rand(3);
            if(_loc1_ == 0)
            {
               outputText("当你被她的主人分散注意力时，艾克塞莉亚爬到你身边，双臂环抱住你的腰，将她胀满乳汁的乳房压在你的胯部。你可以透过你的[armor]感受到它们的温暖，在它们的拥抱中承诺着无尽的幸福。当你推开她时，你才意识到她把成河的乳汁倒在了你的");
               if(get_player().hasTailInsteadOfLegs())
               {
                  outputText("[leg]上");
               }
               else
               {
                  outputText("[legs]上");
               }
               outputText("，这提醒着你这个女人有着疯狂的性吸引力。");
            }
            else if(_loc1_ == 1)
            {
               outputText("转过身，这个母牛奴隶把她那饱满的屁股对准你，翘起尾巴，露出她那滴着水的三角区和紧缩的菊花。她回头看着你，性感地用舌头舔过她那金色的嘴唇，当她的嘴唇变得足够闪亮时，她向你抛了一个撅嘴的飞吻。如果她是想分散你的注意力，那她至少部分成功了。");
            }
            else
            {
               outputText("艾克塞莉亚跪起身子，弓起背，展示她那巨大的乳房，让它们巧克力色的乳头挑衅地指向你。她的手指游走到乳头上，挤出细细的乳汁，她把乳汁收集起来，依次涂抹在每个乳房上，像高级按摩油一样揉进皮肤里。当她完成时，她的乳房闪闪发光，而你则感到有些口干舌燥。");
            }
            get_player().takeLustDamage(5,true);
         }
      }
      
      public function battleaxe() : void
      {
         outputText("牛头人国王拿着他的斧头，仿佛它轻如鸿毛，他随意地挥舞着，你几乎没有注意到他的挥击");
         var _loc1_:Number = get_player().reduceDamage(eBaseDamage(),this,20);
         if(_loc1_ <= 0 || Boolean(combatAvoidDamage(new AvoidDamageParameters(true,false,false,null,null,null,null,null)).attackFailed))
         {
            outputText("及时躲开了。");
         }
         else
         {
            outputText("。等你注意到的时候，已经太晚了。");
            get_player().takeDamage(_loc1_,true);
         }
      }
      
      public function backhand() : void
      {
         outputText("牛头人国王用斧头虚晃一枪，朝你的方向猛地挥出一记强有力的反手击打。");
         var _loc1_:Number = get_player().reduceDamage(eBaseDamage(),this);
         var _loc2_:* = combatAvoidDamage(new AvoidDamageParameters(true,false,false,null,null,null,null,null));
         if(_loc1_ <= 0 || _loc2_.dodge == EVASION_SPEED || _loc2_.dodge == EVASION_FLEXIBILITY || _loc2_.dodge == EVASION_UNHINDERED)
         {
            outputText("幸运的是，你闪向一旁躲开了。");
         }
         else if(_loc2_.dodge == EVASION_EVADE)
         {
            outputText("幸运的是，你避开了。");
         }
         else if(_loc2_.dodge == EVASION_MISDIRECTION)
         {
            outputText("幸运的是，你误导了他的攻击。");
         }
         else
         {
            outputText("妈的，真疼！");
            get_player().takeDamage(_loc1_,true);
         }
      }
   }
}

