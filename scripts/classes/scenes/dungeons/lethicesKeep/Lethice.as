package classes.scenes.dungeons.lethicesKeep
{
   import classes.CoC;
   import classes.Creature;
   import classes.DynStat;
   import classes.ImageManager;
   import classes.MasteryLib;
   import classes.Monster;
   import classes.PerkLib;
   import classes.Player;
   import classes.StatusEffects;
   import classes._FlagDict.FlagDict_Impl_;
   import classes.internals.MonsterAI;
   import classes.internals.Utils;
   import classes.items.Weapon;
   import classes.scenes.combat.AvoidDamageParameters;
   import classes.scenes.combat.CombatRange;
   import flash.Boot;
   import haxe.IMap;
   
   public class Lethice extends Monster
   {
      
      public var _wingsDestroyed:Boolean;
      
      public var _roundCount:int;
      
      public var _lustLastTurn:int;
      
      public var _hpLastTurn:int;
      
      public var _fightPhase:int;
      
      public var _defMode:int;
      
      public function Lethice()
      {
         if(Boot.skip_constructor)
         {
            return;
         }
         _lustLastTurn = 0;
         _hpLastTurn = 0;
         _defMode = 0;
         _wingsDestroyed = false;
         _fightPhase = 1;
         _roundCount = 0;
         super();
         set_a("");
         set_short("Lethice");
         imageName = "lethice";
         set_long("");
         set_race("Demon");
         set_tallness(108);
         createVagina(false,3,3);
         createBreastRow(3);
         hips.rating = 2;
         butt.rating = 2;
         initStrTouSpeInte(110,110,110,110);
         initLibSensCor(100,40,100);
         set_weaponName("whip");
         set_weaponAttack(35);
         set_weaponVerb("whip");
         normalAttackAvoid.doParry = false;
         normalAttackAvoid.doCounter = false;
         set_armorName("wraps");
         set_armorDef(15);
         if(get_player().newGamePlusMod() >= 3)
         {
            set_armorDef(get_armorDef() + 30);
         }
         bonusHP = 650;
         bonusLust = 80;
         additionalXP = 1000;
         set_gems(500 + Utils.rand(50));
         level = 25;
         lustVuln = 0.15;
         set_drop(NO_DROP);
         createPerk(PerkLib.Tank,0,0,0,0);
         createPerk(PerkLib.Tank2,0,0,0,0);
         createPerk(PerkLib.ImprovedSelfControl,0,0,0,0);
         createPerk(PerkLib.SpellcastingAffinity,30,0,0,0);
         wings.type = 11;
         checkMonster();
      }
      
      override public function won(param1:Boolean, param2:Boolean = false) : void
      {
         get_game().lethicesKeep.lethice.won(param1,param2);
      }
      
      public function wingbuffet() : void
      {
         outputText("莉希丝飞向一个燃烧的火盆，拍打着翅膀，让火焰燃烧得更旺，浓烟滚滚地越过聚集的恶魔，直扑向你！");
         if(Boolean(combatAvoidDamage(new AvoidDamageParameters(true,false,false,null,null,null,null,null)).attackFailed))
         {
            outputText("你设法从烟雾的波浪下溜了过去。");
         }
         else
         {
            outputText("令人窒息的烟雾钻进了你的眼睛和嘴巴，让你咳嗽和喷溅。最糟糕的是，你什么都看不见了！");
            get_player().createStatusEffect(StatusEffects.Blind,2,0,0,0);
            get_player().takeDamage(1,true);
         }
      }
      
      public function whiptrip() : void
      {
         var _loc1_:Number = 0;
         outputText("莉希丝挥舞着鞭子，划出一道宽阔而低矮的弧线。");
         var _loc2_:Boolean = false;
         var _loc3_:* = combatAvoidDamage(new AvoidDamageParameters(true,false,false,null,null,null,null,null));
         if(_loc3_.dodge == EVASION_SPEED || _loc3_.dodge == EVASION_UNHINDERED)
         {
            outputText("你在最后一秒跳了过去，热浪灼烧着你的[feet]。");
            _loc2_ = true;
         }
         else if(_loc3_.dodge == EVASION_EVADE || _loc3_.dodge == EVASION_BLIND)
         {
            outputText("你躲过了她的绊腿，但鞭子散发出的热量烧焦了你的[feet]。");
            _loc2_ = true;
         }
         else
         {
            outputText("你试图躲避，但燃烧的武器缠住了你的[leg]，在烧焦你血肉的同时，试图让你失去平衡。");
            if(get_player().stun(1,25,int(get_player().get_tou())))
            {
               outputText("地面飞快地向你扑来。莉希丝绊倒了你，<b>让你陷入了昏迷！</b>");
            }
            else
            {
               outputText("如果莉希丝想绊倒你，她需要用更大的力气。");
            }
         }
         if(_loc2_)
         {
            _loc1_ = (25 + get_weaponAttack() - Utils.rand(get_player().get_tou())) * (1 + get_player().newGamePlusMod() * 0.3);
         }
         else
         {
            _loc1_ = (100 + get_weaponAttack() + get_str() - Utils.rand(get_player().get_tou())) * (1 + get_player().newGamePlusMod() * 0.3);
         }
         get_player().takeDamage(_loc1_,true);
      }
      
      public function whipchoke() : void
      {
         var _loc1_:Number = 0;
         outputText("[say: 闭上你那喋喋不休的嘴，杂种。] 莉希丝挥舞着鞭子，瞄准了你的脖子！");
         var _loc2_:* = combatAvoidDamage(new AvoidDamageParameters(true,false,false,null,null,null,null,null));
         if(_loc2_.dodge == EVASION_SPEED || _loc2_.dodge == EVASION_UNHINDERED)
         {
            outputText("你勉强躲过了。");
         }
         else if(_loc2_.dodge == EVASION_EVADE || _loc2_.dodge == EVASION_BLIND)
         {
            outputText("你躲过了这有针对性的一击。");
         }
         else if(_loc2_.dodge == EVASION_FLEXIBILITY)
         {
            outputText("你在最后一刻扭身躲开。");
         }
         else if(_loc2_.dodge == EVASION_MISDIRECTION)
         {
            outputText("拉斐尔教得很好。莉希丝没有料到你那具有误导性的动作，挥空了。");
         }
         else
         {
            outputText("[pg]当燃烧的绳索缠绕住你的喉咙时，你倒吸了一口凉气，无法说话，也无法分辨为什么舔舐的火焰没有烧焦你脸上的肉。女王大笑着，像折断一根腐烂的绳子一样折断了她那端的鞭子，轻蔑地将燃烧的那段扔在地上。未连接的一端一次又一次地缠绕在你的脖子上，紧紧地绑住。与此同时，紧握的把手中涌出新的火焰，露出了一条蜿蜒滑行的痛苦工具，完好无损。");
            outputText("[pg]<b>你被有效地沉默了！</b>");
            _loc1_ = get_weaponAttack() + 25 - Utils.rand(get_player().get_tou());
            get_player().takeDamage(_loc1_,true);
            get_player().createStatusEffect(StatusEffects.WhipSilence,3,0,0,0);
         }
      }
      
      public function triplestroke() : void
      {
         var _loc1_:Number = 1;
         outputText("莉希丝的手臂模糊地画着8字形，从四面八方向你抽打鞭子。你很难躲避这么多的攻击！");
         if(attackSucceeded())
         {
            _loc1_ = eOneAttack();
            outputAttack(int(_loc1_));
            postAttack(int(_loc1_));
            get_game().output.statScreenRefresh();
            outputText("\n");
         }
         else
         {
            outputText("你闪转腾挪，勉强躲过了鞭子刺痛的抽打！\n");
         }
         if(attackSucceeded())
         {
            _loc1_ = eOneAttack();
            outputAttack(int(_loc1_));
            postAttack(int(_loc1_));
            get_game().output.statScreenRefresh();
            outputText("\n");
         }
         else
         {
            outputText("你闪转腾挪，勉强躲过了鞭子刺痛的抽打！\n");
         }
         if(attackSucceeded())
         {
            _loc1_ = eOneAttack();
            outputAttack(int(_loc1_));
            postAttack(int(_loc1_));
            get_game().output.statScreenRefresh();
            outputText("\n");
         }
         else
         {
            outputText("你闪转腾挪，勉强躲过了鞭子刺痛的抽打！\n");
         }
      }
      
      override public function struggle() : void
      {
         clearOutput();
         outputText("你用尽全力想挣脱那些紧抓不放的触手，但无济于事；它们抓得实在太紧了！");
         get_game().combat.startMonsterTurn();
      }
      
      public function sonicwhip() : void
      {
         outputText("莉希丝将她那发出嘶嘶声、喷吐着火焰的鞭子高高举过头顶，然后在一瞬间将手臂伸出又收回，猛烈地抽打鞭子，产生了一股由火焰和震耳欲聋的雷声组成的冲击波。你无法躲避这铺天盖地的能量波。甚至没有时间做好准备。它猛烈地撞击着你，震得你骨头作响，烧焦了你的血肉。");
         var _loc1_:Number = (75 + get_weaponAttack() + get_str()) * (1 + get_player().newGamePlusMod() * 0.3);
         get_player().takeDamage(_loc1_,true);
      }
      
      public function rideCock() : void
      {
         clearOutput();
         outputText("考虑到恶魔们似乎执意要让你和她们被打败的同伴翻云覆雨，你觉得不如好好利用这个时刻。毕竟，莉希丝似乎并不急于恢复你们的战斗！");
         outputText("[pg]你让那个丰满的双性恶魔一屁股坐下，让她把头靠在另一个正忙着给双屌男魅魔口交的牛娘恶魔的大腿上，然后爬上她那匀称的红色身体。[say: 哦哦，]当她那根跳动的红色火箭压在你们的身体之间时，双性魅魔娇喘道。[say: 要来骑一骑吗，勇者？]");
         outputText("[pg]那是当然。你抓住她的乳房，手指陷入柔软的深红色乳房中，跨坐在她的臀部上，用你的[vagOrAss]摩擦恶魔肿胀的阴茎。她的尺寸像种马一样大，坚硬如石，甚至在你靠近她尖尖的龟头之前就已经准备好冲刺了。你感觉到她的手抓住你的[hips]，引导你向下，直到你的[vagOrAss]沉入她粗壮的肉棒上。你的肚子因为滑入你体内的肉棒的长度而鼓起，你的大脑因为压倒性的快感而一片空白。");
         if(get_player().hasVagina())
         {
            get_images().showImage("lethice-phase-female-ride");
         }
         else
         {
            get_images().showImage("lethice-phase-male-ride");
         }
         outputText("[pg]你花了一点时间才从最初的震惊中恢复过来，但当你恢复过来时，你开始疯狂地运动，以越来越快的速度在恶魔的狗屌上弹跳。它的主人在你身下呻吟扭动，因为你们的战斗而太虚弱，除了顺从你的骑乘之外什么也做不了。尽管如此，她那又大又黑的乳头在你手中坚硬如石，她的小穴在不断高涨的兴奋中浸湿了你的双腿。");
         outputText("[pg]突然，你的整个身体紧绷起来，因为新的感觉而颤抖。你回头看去，正好看到另一个魅魔从你身后爬上来，");
         if(get_player().hasVagina())
         {
            outputText("舔舐你的[cunt]");
         }
         else
         {
            outputText("伸手去拉扯你未使用的[cocks]}。另一个女恶魔依偎在你身后，将一对沉甸甸的乳房压在你的背上，喃喃地说她想看到你被你身下的那个双性种马配种。");
         }
         outputText("[pg]随着越来越多的恶魔爬到你身上，敦促你在她们的同伴身上巩固你的胜利，或者用嘴和堕落的舌头增加你的快感，没过多久，你就屈服于身体的肉欲需求。你用力而快速地在女恶魔不匹配的胯部摩擦你的臀部，喜欢她那翻滚的黑色睾丸骑在你的屁股里的感觉，喜欢她拳头粗的肉结敲打你的[vagOrAss]的感觉。有这么多感觉冲击着你的身体，你根本无法忍住。你尖叫着你的狂喜，让整个大厅都能听到，你高潮了，身体颤抖着，紧紧地夹住那根将你撑开的粗壮恶魔肉棒。");
         outputText("[pg]女恶魔也不甘落后。她用力抓住你的臀部，指甲划破了你的肉，你感觉到一股粘稠、湿润的热流涌入你的");
         if(get_player().hasVagina())
         {
            outputText("子宫");
         }
         else
         {
            outputText("肠道");
         }
         outputText("。你只是勉强保持理智，在她把肉结强行塞进你体内之前把她推倒，尽管你得到了真正的白色精液瀑布，从你被充分配种的洞里倾泻而出。");
         outputText("[pg][say: 我明白为什么他们叫你“勇者”了，]恶魔咕噜着，她那涂满精液的红色肉棒拍打着她的肚子。[say: 也许在我们的蜂后打败你之后，我会去调教槽看你……我总是需要另一只渴望的小母马。]");
         outputText("[pg]你推开女恶魔，突然想起了她的本性。至少现在，你满足了。你对自己的状态充满信心，向莉希丝走去。");
         get_player().orgasm("VaginalAnal");
         beginPhase3(true);
      }
      
      public function rapetacles() : void
      {
         outputText("莉希丝指着脚下的地面。一股黑色的雾气脉冲向四面八方翻滚出几十英尺。围观的恶魔人群恐惧地后退，除了一些愚蠢的奴隶，他们漫不经心地走进了魔法阵。一秒钟后，数百条油腻的黑色触手从地板上冒出来，从它们被召唤出来的可怕维度中展开。它们立即攻击每一个触手可及的生物，缠绕在手腕和脚踝上，侵犯阴道和屁眼。它们从四面八方向你袭来！");
         if(get_player().canFly())
         {
            outputText("[pg]你笑着飞出它们的触及范围，免疫了它们的触摸。");
            get_player().createStatusEffect(StatusEffects.LethicesRapeTentacles,4 + Utils.rand(2),0,0,0);
         }
         else if(Boolean(combatAvoidDamage(new AvoidDamageParameters(true,false,false,null,null,null,null,null)).attackFailed))
         {
            outputText("[pg]你轻松地避开了抓握的触手。");
            get_player().createStatusEffect(StatusEffects.LethicesRapeTentacles,4 + Utils.rand(2),0,0,0);
         }
         else
         {
            outputText("[pg]你不够快，无法避开它们。它们猛拉你的手臂和[legs]，使之绷紧。有些钻到了你的[armor]下，向你最敏感、最禁忌的地方爬去。");
            get_player().createStatusEffect(StatusEffects.LethicesRapeTentacles,4 + Utils.rand(2),0,1,0);
         }
      }
      
      public function rapetacleTurn() : void
      {
         var _loc1_:Number = NaN;
         var _loc2_:Number = NaN;
         get_player().addStatusValue(StatusEffects.LethicesRapeTentacles,1,-1);
         if(get_player().statusEffectv3(StatusEffects.LethicesRapeTentacles) != 0)
         {
            get_player().addStatusValue(StatusEffects.LethicesRapeTentacles,2,1);
            _loc1_ = get_player().statusEffectv2(StatusEffects.LethicesRapeTentacles);
            _loc2_ = _loc1_;
            if(_loc2_ == 1)
            {
               outputText("趁着你无助的状态，触手缠绕得[if (isnaked) {更紧了|更深地钻进你的[armor]}]，抚摸着你的[nipples]，并在你的[butt]上涂满滑腻的粘液。甚至有一根触手寻找着你的胯部，毫不温柔地在周围探寻着弱点。");
               dynStats(DynStat.Lust(5));
            }
            else if(_loc2_ == 2)
            {
               outputText("既然它们已经安顿下来，触手们便开始在你的身体上大肆作乱，粗暴地猥亵着它们能找到的每一个敏感部位。");
               if(get_player().hasCock())
               {
                  outputText(" 它们在你的[cocks]周围旋转扭动。");
               }
               if(get_player().hasVagina())
               {
                  outputText(" 一根触手在你的下唇间穿梭，用滑腻的凸起疯狂地摩擦着你的[clit]。");
               }
               outputText("" + Utils.num2Text(get_player().totalNipples()) + " 根触须环绕着你的[nipples]");
               if(get_player().hasFuckableNipples())
               {
                  outputText("，威胁着随时要滑进去");
               }
               else
               {
                  outputText("，捏着并拉扯着它们");
                  if(get_player().isLactating())
                  {
                     outputText("，挤出小股的乳汁");
                  }
               }
               outputText("。最糟糕的是在你的臀瓣间滑行的那根触手。它不断停下来在你的[asshole]边缘摩擦。你真的应该挣脱出来……");
               dynStats(DynStat.Lust(5));
            }
            else if(_loc2_ == 3)
            {
               outputText("另一根墨黑色的长条从地板上升起，拍打在你的脸上，笨拙地试图将自己插入你的嘴里。你对它的鲁莽感到愤慨，坚定地闭紧嘴唇，把头转开。然而，驱动这个法术的腐化魔法不会让你这么轻易脱身。其他的触手加倍努力，用令人发狂的快感淹没你。你忍不住喘息呻吟，给了那根涂满油的触角进入你嘴里的所有机会。");
               dynStats(DynStat.Lust(5));
            }
            else if(_loc2_ == 4)
            {
               outputText("如果你觉得嘴里有一根触手已经很糟糕了，那么漂浮在你面前的两根触手可能会让你感到恐惧。不幸的是，它们只是用来分散注意力的。那根在你臀部游走的触须向后退去，然后猛地刺入，撑开了你的括约肌");
               if(get_player().hasVagina())
               {
                  outputText("与此同时，它的兄弟也刺穿了你娇嫩的褶皱，贪婪地对你进行双重插入");
                  if(get_player().hasVirginVagina())
                  {
                     outputText(" [b:你一路走来，竟然把童贞丢给了这些东西！]");
                  }
                  get_player().cuntChange(10,false);
               }
               outputText("。");
               if(get_player().hasFuckableNipples())
               {
                  outputText(" 你的[nipples]也同样被进入了。");
               }
               if(get_player().hasCock())
               {
                  outputText(" 并且[eachCock]突然被涂上了滑腻的异界油脂，并被快速、坚定地套弄着。");
               }
               outputText("太多了。如果你不挣脱出来，你最终会输给一个简单的法术！");
               dynStats(DynStat.Lust(10));
            }
            else
            {
               outputText("你现在真的搞砸了。整个王座室的恶魔都在看着一堆召唤出来的触手强奸你的每一个洞，用它们抽插的力量让你的身体前后摇晃，不断地将它们腐化的载荷注入你接纳的洞穴中。最糟糕的是");
               if(get_player().cor >= 50)
               {
                  outputText(" 这让你看起来像个多大的婊子……而且做莉希丝的婊子感觉有多好。");
               }
               else
               {
                  outputText(" 这让你感觉有多下贱……而且下贱的感觉有多好。");
               }
               dynStats(DynStat.Lust(10),DynStat.Cor(1));
            }
         }
         else
         {
            outputText("触手再次抓向你！");
            if(get_player().canFly())
            {
               outputText(" 无论它们怎么努力，都够不到你。");
            }
            else if(Boolean(combatAvoidDamage(new AvoidDamageParameters(true,false,false,null,null,null,null,null)).attackFailed))
            {
               outputText(" 你暂时扭动着挣脱了它们那滑溜溜、异常性感的抓握。");
            }
            else
            {
               outputText("该死，它们抓住你了！它们把你的手臂和[legs]拉得紧紧的，让你无助地悬在半空中，任由它们的兄弟进一步侵犯。你已经能感觉到几根油腻的触须[if (isnaked) {滑过你裸露的皮肤|钻进你的[armor]下}]。");
               get_player().changeStatusValue(StatusEffects.LethicesRapeTentacles,3,1);
               dynStats(DynStat.Lust(5));
            }
         }
         if(get_player().statusEffectv1(StatusEffects.LethicesRapeTentacles) <= 0)
         {
            if(get_player().statusEffectv3(StatusEffects.LethicesRapeTentacles) != 0)
            {
               outputText("[pg]你面前的触手突然像黑烟气球一样爆裂，留下了一阵油腻的薄雾。不知从哪里吹来的一阵微风驱散了这些贪婪触须的残骸，它们的魔力已经耗尽。");
            }
            else
            {
               outputText("[pg]抓住你的触手突然松开，把你扔到了地上。你爬起来，惊恐地环顾四周，但触须已经化作一缕缕黑烟消散了。不知从哪里吹来的一阵微风将它们吹散，它们的魔力已经耗尽。");
            }
            get_player().removeStatusEffect(StatusEffects.LethicesRapeTentacles);
         }
         outputText("[pg]");
      }
      
      public function phase3() : void
      {
         var _loc3_:* = null as MonsterAI;
         var _loc1_:int = int(_hpLastTurn - get_hp100());
         var _loc2_:int = int(get_lust100() - _lustLastTurn);
         if(_loc2_ > _loc1_)
         {
            _defMode = 2;
         }
         else
         {
            _defMode = 1;
         }
         _hpLastTurn = int(get_hp100());
         _lustLastTurn = int(get_lust100());
         if(_defMode == 1)
         {
            outputText("莉希丝轻轻擦拭着伤口，然后舔了舔手指，露出性感的微笑。她看起来既兴奋又充满活力。鳞片出现在她的皮肤上，她那铲状的尾巴来回甩动，快得让人看不清。[pg]");
            set_spe(400);
            set_armorDef(400);
            if(get_armorName() == "lethicite armor")
            {
               set_armorDef(get_armorDef() + 30);
            }
            lustVuln = 1.125;
         }
         else
         {
            outputText("恶魔女王浑身一颤，强作镇定。她那曼妙的曲线明显变得柔和起来，似乎在为进一步的挑逗做准备，放弃了物理防御。[pg]");
            set_spe(80);
            set_armorDef(14);
            if(get_armorName() == "lethicite armor")
            {
               set_armorDef(get_armorDef() + 30);
            }
            lustVuln = 0;
         }
         if(_roundCount == 5)
         {
            gropehands();
         }
         else
         {
            _loc3_ = new MonsterAI();
            _loc3_.add(parasiteThrowingStars,1,true,0,FATIGUE_NONE,CombatRange.Ranged);
            _loc3_.add(whiptrip,1,true,0,FATIGUE_NONE,CombatRange.Ranged);
            _loc3_.add(sonicwhip,1,true,0,FATIGUE_NONE,CombatRange.Ranged);
            _loc3_.add(whipchoke,1,!get_player().hasStatusEffect(StatusEffects.WhipSilence),0,FATIGUE_NONE,CombatRange.Ranged);
            _loc3_.exec();
         }
      }
      
      public function phase2Ends(param1:Boolean) : void
      {
         var hpVictory1:Boolean;
         var _g:Lethice;
         var _loc2_:* = null as Function;
         clearOutput();
         if(param1)
         {
            outputText("最后一只恶魔倒在你的[weapon]下，在你面前瘫软成一团失去意识的肉块。几只恶魔正无助地爬开，退回看台与它们的同伴会合——那些根本不敢参战的家伙。");
         }
         else
         {
            outputText("莉希丝的爪牙们几乎已经变成了一场狂欢，完全忘记了它们最初的意图，无论它们的龙族女王如何尖叫着命令它们攻击。");
         }
         outputText("[pg]趁着恶魔们倒下，而莉希丝还在从你们的第一次交锋中恢复，你获得了一个急需的喘息时刻，可以缓解你体内开始滋生的紧张感。或者，你也可以继续进攻，直接向女王发起挑战。");
         get_game().output.menu();
         if(get_player().hasCock() || get_player().hasVagina())
         {
            _g = this;
            hpVictory1 = param1;
            _loc2_ = function():void
            {
               _g.p2DemonFuck(hpVictory1);
            };
            get_game().output.addButton(0,"操恶魔",_loc2_);
         }
         if(get_player().hasStatusEffect(StatusEffects.KnowsHeal))
         {
            get_game().output.addButton(1,"治疗",p2Heal);
         }
         get_game().output.addButton(2,"继续",p2Next);
      }
      
      public function phase2() : void
      {
         var _loc1_:MonsterAI = new MonsterAI();
         _loc1_.add(demonLustMagic,1,true,0,FATIGUE_NONE,CombatRange.Omni);
         _loc1_.add(dirtyDancing,1,true,0,FATIGUE_NONE,CombatRange.Omni);
         _loc1_.add(crushingBodies,1,true,0,FATIGUE_NONE,CombatRange.Omni);
         _loc1_.add(hornyPoke,1,true,0,FATIGUE_NONE,CombatRange.Omni);
         _loc1_.add(bukkakeTime,1,Utils.rand(10) == 0 && !get_player().hasStatusEffect(StatusEffects.Blind),0,FATIGUE_NONE,CombatRange.Omni);
         _loc1_.exec();
      }
      
      public function phase1Ends(param1:Boolean) : void
      {
         var _loc2_:* = null as String;
         var _loc3_:Boolean = false;
         var _loc4_:Boolean = false;
         var _loc5_:Boolean = false;
         var _loc6_:Boolean = false;
         var _loc7_:Boolean = false;
         var _loc8_:Boolean = false;
         clearOutput();
         if(param1)
         {
            if(get_player().canFly())
            {
               outputText("即使被她那宽大的龙翼托在半空，莉希丝也无法躲避你正义的怒火。");
               outputText("你也展翅高飞，猛地撞向那个女恶魔，给了她最后一击，让她摔向地面。她尖叫着盘旋下坠，重重地砸在她王座前坚硬的石地板上。");
            }
            else
            {
               if(get_game().combat.lastAbilityUsed.isMagic() == true)
               {
                  _loc2_ = "Magic";
               }
               else
               {
                  _loc8_ = get_game().combat.lastAbilityUsed.isBow;
                  if(_loc8_ == true)
                  {
                     _loc2_ = "Bow";
                  }
                  else
                  {
                     _loc7_ = get_player().get_weapon().isMagicStaff();
                     if(_loc7_ == true)
                     {
                        _loc2_ = "Magic";
                     }
                     else
                     {
                        _loc6_ = get_player().get_weapon().isFirearm();
                        if(_loc6_ == true)
                        {
                           _loc2_ = "Firearm";
                        }
                        else
                        {
                           _loc5_ = get_player().get_weapon().isBow();
                           if(_loc5_ == true)
                           {
                              _loc2_ = "Bow";
                           }
                           else
                           {
                              _loc4_ = get_player().get_weapon().isCrossbow();
                              if(_loc4_ == true)
                              {
                                 _loc2_ = "Bow";
                              }
                              else
                              {
                                 _loc3_ = get_player().get_weapon().isRanged();
                                 _loc2_ = _loc3_ == true ? "Ranged" : "Other";
                              }
                           }
                        }
                     }
                  }
               }
               outputText("即使被她那宽大的龙翼托在半空，莉希丝也无法躲避你正义的怒火。你");
               if(_loc2_ == "Other")
               {
                  outputText("看着她体力不支，这位蜂后笨拙地降落，然后踉跄了几步，跌坐在她那华丽的王座上。");
               }
               else
               {
                  if(_loc2_ == "Magic")
                  {
                     if(get_player().usingMagicTF())
                     {
                        outputText("挥舞着你的[weapon]，伴随着强大的翡翠色地狱火，掷出一大团熔岩和火焰");
                     }
                     else
                     {
                        outputText("用一阵狂暴的魔法为你的[weapon]充能，向战场上释放出一道闪电");
                     }
                  }
                  else
                  {
                     if(_loc2_ == "Bow")
                     {
                        outputText("拉开弓弦，射出最后一箭");
                     }
                     else if(_loc2_ == "Firearm")
                     {
                        outputText("瞄准目标，再次开火");
                     }
                     else
                     {
                        outputText("发动最后一次攻击");
                     }
                     outputText("，让飞弹在空中呼啸而过");
                  }
                  outputText("——正中莉希丝的翅膀！恶魔女王发出一声刺耳的惨叫，翅膀无力地耷拉在身侧，直直地坠向地面！");
               }
               outputText("她倒下了！");
            }
         }
         else
         {
            outputText("无法抵挡你感官上的攻势，莉希丝发出一声沮丧的嚎叫，猛地俯冲回地面，再次坐上了她的王座。");
         }
         outputText("[pg][say: 我厌倦了这[if (ischild) {小孩子的}]游戏！]她大喊着，紧紧抓住高耸王座的扶手。突然，她的目光从你身上移开，转向看台上喧闹的恶魔大军。[say: 你们还在等什么，蠢货！？给我抓住[him]！[if (ischild) { 别被一个不知天高地厚的小[boy]给吓倒了！}]]");
         outputText("[pg][if (silly) {哦，操。}]你抬头一看，只见一群恶魔肉体从高处俯冲而下，身体几乎是互相翻滚着朝你扑来。这群恶魔有着你能想象到的各种形态：高大笨重的粗暴雄性，曲线夸张到非人的魅魔，以及两者的反面——更不用说偏男性或偏女性的双性人了——而且所有这些都伴随着各种各样的变异。野兽般的生物，像龙一样的怪物，还有皮肤颜色如彩虹般绚丽的女人，以及更多更多，像一场永不停歇的肉体与堕落的弹幕，倾泻在王座大厅里。他们不会停下，直到把你拖倒在地，操到你屈服为止！");
         set_HP(maxHP());
         set_lust(10);
         _fightPhase = 2;
         set_a("the ");
         set_short("demons");
         set_plural(true);
         pronoun1 = "they";
         pronoun2 = "them";
         pronoun3 = "their";
         if(hasStatusEffect(StatusEffects.PhysicalDisabled))
         {
            removeStatusEffect(StatusEffects.PhysicalDisabled);
         }
         if(hasStatusEffect(StatusEffects.AttackDisabled))
         {
            removeStatusEffect(StatusEffects.AttackDisabled);
         }
         removeStatusEffect(StatusEffects.PermaFlyStatus);
         tookAction = true;
         get_game().combat.startMonsterTurn();
      }
      
      public function phase1() : void
      {
         var _loc1_:MonsterAI = new MonsterAI();
         _loc1_.add(demonicArouse,1,true,15,FATIGUE_MAGICAL,CombatRange.Ranged);
         _loc1_.add(demonfire,1,true,15,FATIGUE_MAGICAL,CombatRange.Ranged);
         _loc1_.add(rapetacles,1,int(_roundCount % 10) == 3,10,FATIGUE_MAGICAL,CombatRange.Ranged);
         _loc1_.add(wingbuffet,1,!get_player().hasStatusEffect(StatusEffects.Blind),10,FATIGUE_PHYSICAL,CombatRange.Ranged);
         _loc1_.add(claw,1,true,10,FATIGUE_PHYSICAL,CombatRange.FlyingMelee);
         _loc1_.exec();
      }
      
      override public function performCombatAction() : void
      {
         _roundCount += 1;
         if(get_player().hasStatusEffect(StatusEffects.LethicesRapeTentacles))
         {
            rapetacleTurn();
         }
         switch(_fightPhase)
         {
            case 1:
               phase1();
               break;
            case 2:
               phase2();
               break;
            case 3:
               phase3();
               break;
            default:
               phase1();
         }
      }
      
      public function parasiteThrowingStars() : void
      {
         var _loc1_:Number = 0;
         var _loc2_:Number = 0;
         var _loc3_:* = combatAvoidDamage(new AvoidDamageParameters(true,false,false,null,null,null,null,null));
         outputText("莉希丝从衣服下面掏出三只蠕动的星形生物，朝你扔了过来。就在它们离开她手的瞬间，边缘爆射出尖刺！");
         if(_loc3_.dodge == EVASION_SPEED || _loc3_.dodge == EVASION_UNHINDERED || _loc3_.dodge == EVASION_BLIND)
         {
            outputText("活生生的飞镖从你身边呼啸而过，险些击中你。");
         }
         else if(_loc3_.dodge == EVASION_EVADE)
         {
            outputText("你勉强躲过了活生生的飞镖。");
         }
         else if(_loc3_.dodge == EVASION_MISDIRECTION)
         {
            outputText("你那迷惑性的动作让你躲过了活生生的飞镖。");
         }
         else if(_loc3_.dodge == EVASION_FLEXIBILITY)
         {
            outputText("你向后弯腰，躲过了活生生的飞镖。");
         }
         else
         {
            _loc1_ = get_player().lib / 10 + get_player().cor / 10 + 10;
            if(get_player().hasStatusEffect(StatusEffects.MinotaurKingsTouch))
            {
               _loc1_ *= 1.25;
            }
            get_player().takeLustDamage(_loc1_,true);
            _loc2_ = get_str() + get_weaponAttack() - Utils.rand(get_player().get_tou());
            outputText("你无法全部躲开！其中一个在飞过时擦伤了你，撕裂了你的[skin]，让你感到……浑身发热。");
            if(get_player().hasCock() && Utils.rand(get_player().get_tou() + 50) < 25)
            {
               outputText("你的[armor]裆部突然变得拥挤起来，摩擦得你心烦意乱，增加的重量也让你行动迟缓。<b>[EachCock]变大了！</b>");
               get_player().increaseEachCock(1);
            }
            else if(get_player().biggestTitSize() <= 0 && Utils.rand(get_player().get_tou() + 50) < 25)
            {
               outputText("你的[armor]内部突然压迫着你的[nipples]。<b>你长出了乳房！</b>那个婊子");
               get_player().growTits(3,int(get_player().breastRows.length),false,2);
            }
            else if(Utils.rand(get_player().get_tou() + 50) < 25)
            {
               outputText("你的[armor]胸部突然变得拥挤不堪。你的[chest]正在膨胀，晃动得让人分心，增加的重量也让你慢了下来！");
               get_player().growTits(2,int(get_player().breastRows.length),false,2);
            }
            get_player().takeDamage(_loc2_,true);
         }
      }
      
      public function p2Next() : void
      {
         clearOutput();
         outputText("[say: 没用的废物，]莉希丝咆哮着，重新站起来，展开她的");
         if(_wingsDestroyed)
         {
            outputText("破烂的");
         }
         outputText("的龙翼，让它们展现出全部的威严。她从腰间抽出一根鞭子，猛地一甩，鞭子在你头顶上方发出清脆的响声。黑色的火焰在鞭子上翻腾，燃烧着堕落的魔法，让她周围的空气中弥漫着性爱和欲望的恶臭。");
         outputText("[pg][say:很好，勇者，]她咆哮着，把装满莉希丝水晶的酒杯扔到一边。酒杯在石板上摔得粉碎，水晶散落一地，就在这一瞬间，甚至连那些被击败的恶魔都在争抢这些宝石，让你战斗的地面变成了一个疯狂的地狱。[say:看来我得亲自解决你了！让我们看看你到底有什么本事……在我把你的灵魂从你的身体里强暴出来之前！]");
         beginPhase3(false);
      }
      
      public function p2Heal() : void
      {
         clearOutput();
         outputText("得益于你的魔法，你趁机治疗了你的伤口。在战斗的短暂间歇中，没有敌人敢挑战你，这让你能够保持完美的注意力。随着你的肉体重新愈合，准备好战斗，你看向莉希丝。");
         var _loc1_:int = int((get_player().level + get_player().get_inte() / 1.5 + Utils.rand(get_player().get_inte())) * get_player().spellMod()) * 2;
         if(get_player().get_armorName() == "skimpy nurse\'s outfit")
         {
            _loc1_ *= 1.2;
         }
         get_player().HPChange(_loc1_,false);
         beginPhase3(true);
      }
      
      public function p2DemonFuck(param1:Boolean) : void
      {
         clearOutput();
         get_images().showImage("monster-demonmob");
         outputText("你没有向莉希丝推进，而是将注意力转向了那堆恶魔");
         if(param1)
         {
            outputText("它们正躺在地上，昏迷不醒，毫无还手之力");
         }
         else
         {
            outputText("它们已经陷入了疯狂的群交中");
         }
         outputText("在地板上。其中一只特别引起了你的注意：一个紫皮肤的荡妇双性魅魔，穿着骨质高跟鞋，拥有丰满的乳房和臀部，双腿间还晃荡着一根跳动的犬类肉棒，下面是一对大得惊人的睾丸，更像是半人马肉棒下才会有的尺寸。你弯下腰，抓住她卷曲的角，把她从另一只恶魔的胯部拉开，并拉开你的[armor]，露出你自己的");
         if(get_player().hasCock())
         {
            outputText("肉棒。");
         }
         else
         {
            outputText("小穴。");
         }
         outputText("[pg][say: 噢——天哪！] 她发出满足的呼噜声，黑色的眼睛对着你眨巴着，因为你已经明确表达了你的意图。[say: 我还以为你是留给女王的呢。]");
         outputText("[pg]你低吼着让她开始，促使她滑出分叉的舌头去");
         if(get_player().hasCock())
         {
            outputText("缠绕你的[cock]");
         }
         else
         {
            outputText("舔舐你的[cunt]唇");
         }
         outputText("。快感的颤栗几乎立刻开始席卷你的全身，对女恶魔娴熟的抚摸做出反应。她的舌头技巧确实很高超，用充满活力的决心弹拨、舔舐和爱抚着你的性器。起初，你通过她的恶魔角引导她的动作，但很快发现自己忙于喘息和呻吟，根本无暇控制她——当她这么擅长");
         if(!get_player().hasCock())
         {
            outputText("舔穴时，这毫无意义。");
         }
         else
         {
            outputText("吹箫时，这毫无意义。");
         }
         outputText("[pg]在你周围，受到你用脸操双性魅魔的刺激，被击败的恶魔宫廷在狂欢的快感中起伏，它们兴高采烈地互相口交，插入它们能找到的任何洞穴，或者干脆在地上打滚，紧紧拥抱在一起。那些没有参战的恶魔在看台上大声呼喊，鼓励你像对待一个急切的荡妇一样操那个双性魅魔。至于她，这个发情的恶魔只是在对你的性器进行漫长而充满爱意的舔舐之间，对你露出得意的笑容。");
         get_game().output.menu();
         get_game().output.addButton(0,"口交高潮",oralFinish);
         if(get_player().hasCock())
         {
            get_game().output.addButton(1,"操恶魔",fuckDemon);
         }
         get_game().output.addButton(2,"骑乘肉棒",rideCock);
      }
      
      public function oralFinish() : void
      {
         clearOutput();
         if(get_player().hasCock())
         {
            get_images().showImage("lethice-oral-male");
            outputText("你无视了恶魔大军的嘲笑，在双性魅魔的脸上摩擦着你的臀部，直到你感觉到高潮的来临。她的喉咙吞咽着你的[cock]，你把咸咸的精液灌进她的食道，直到你拔出来，为了保险起见，又在她的脸上喷洒了一番。");
            outputText("[pg]满足之后，你把这个被玩坏的双性魅魔推回恶魔堆里，准备好你的[weapon]。你对自己的准备充满信心，向莉希丝走去。");
         }
         else
         {
            get_images().showImage("lethice-oral-female");
            outputText("你无视了恶魔们的要求，专注于在双性魅魔的脸上摩擦你的臀部，用滑腻的女性兴奋液涂满她的下巴和脸颊。她感激地呻吟着，用手握住她那巨大的狗鸡巴，以她舌头探索你[cunt]的相同节奏疯狂地套弄着。在如此专一的意图下，这个恶魔荡妇没花多长时间就让你达到了应得的高潮——她自己也是，在你[feet]上喷射出浓稠、充满麝香味的精液，而你则用高潮的汁液涂满了她的脸。");
            outputText("[pg]满足之后，你把这个被玩坏的双性魅魔推回恶魔堆里，准备好你的[weapon]。你对自己的准备充满信心，向莉希丝走去。");
         }
         get_player().orgasm("Generic");
         beginPhase3(true);
      }
      
      public function hornyPoke() : void
      {
         outputText("离你最近的几个恶魔长出了巨大的卷曲尖角。当他们无法对你进行性挑逗或向你投掷魔法时，他们非常乐意给你一个老式的撞击！");
         var _loc1_:Number = 0;
         var _loc2_:* = combatAvoidDamage(new AvoidDamageParameters(true,false,false,null,null,null,null,null));
         if(_loc2_.dodge == EVASION_SPEED || _loc2_.dodge == EVASION_UNHINDERED || _loc2_.dodge == EVASION_BLIND)
         {
            outputText("你灵巧地躲开了！");
         }
         else if(_loc2_.dodge == EVASION_MISDIRECTION)
         {
            outputText("至少，他们尝试过！对他们来说太糟糕了，你已经在人群中的其他地方了，远离了伤害！");
         }
         else if(_loc2_.dodge == EVASION_FLEXIBILITY)
         {
            outputText("你以人类永远无法做到的方式扭曲和弯曲，轻松地在恶魔刺向你的所有角之间扭动。当他们完成时，你坐在一个恶魔的头上，在他的鹿角上保持平衡，直到他发出一声愤怒的嚎叫，把你扔回了恶魔的海洋中。");
         }
         else if(_loc2_.dodge == EVASION_EVADE)
         {
            outputText("你设法蹲下以避开最糟糕的角刺，你的[armor]偏转了其余的！");
         }
         else
         {
            _loc1_ = (70 - Utils.rand(get_player().get_tou())) * (1 + get_player().newGamePlusMod() * 0.3);
            outputText("几个粗壮的大角猛烈地撞击你，由于恶魔的汹涌波浪将他们向前推，给了他们更大的力量。当他们划破你的肉体时，你痛苦地叫喊！");
            get_player().takeDamage(_loc1_,true);
         }
      }
      
      public function gropehands() : void
      {
         get_images().showImage("badend-masti");
         outputText("[say: 让我们看看你在被摸索时是如何战斗的，好吗？可惜皮格比不在，看不到我如何改进他的双手，] 莉希丝喃喃自语。这位堕落的女王将双手窝成一个滑稽的色鬼抓握姿势，一边挤压一边吟唱。立刻，你感觉到幻影般的手遍布全身，穿过你的盔甲抚摸你裸露的[skinFurScales]。手指滑入你的[butt]。指尖拂过你的[nipples]。温暖的手掌顺着你颤抖的腹部滑向你脆弱的下体。");
         outputText("[pg]你恶狠狠地瞪着莉希丝，但她只是大笑。[say: 真遗憾，我一直没能说服他，他的手如果这样用会有效得多。]");
         get_player().takeLustDamage(5);
         get_player().createStatusEffect(StatusEffects.PigbysHands,0,0,0,0);
      }
      
      public function grappleWait() : void
      {
         clearOutput();
         outputText("你无法让自己对莉希丝的触手衍生物进行反击。那缠绕在你四肢上性感而盘旋的触感，它们那柔软而探索的尖端在你的[armor]里四处游走……你在它们的束缚中放松了一会儿，被它们的动作诱惑得暂时不想挣扎。");
         get_game().combat.startMonsterTurn();
      }
      
      override public function get_long() : String
      {
         var _loc1_:String = "";
         if(_fightPhase == 1)
         {
            _loc1_ += "莉希丝是所有恶魔事物的缩影。从她那交织着黑玫瑰的奢华紫发，到她粉红色的皮肤和山羊般的角，她是感官、诱人堕落的完美形象。高高的骨质高跟鞋与她暴露的黑色衣服相得益彰。它们看起来几乎像修女的习惯，但被削减到了近乎恋物癖的极端。她苗条的乳房为半透明的织物提供了一丝形状，这是女性乐趣的承诺，而不是她衣服展示的俗丽的肉体。巨大的翅膀，就像龙的翅膀一样，支撑着莉希丝在她的王座室里飞来飞去，聚集着她堕落的魔法。她黑框眼睛里奇怪的狭长瞳孔似乎从未离开过你。";
         }
         else if(_fightPhase == 2)
         {
            _loc1_ += "你完全被恶魔包围了！莉希丝堕落宫廷的成员像堕落肉体的海洋一样淹没了王座大厅，用向你投掷的纯粹的身体重量压垮你。男魅魔、女魅魔，以及介于两者之间并结合了它们所有特征的形态，都在抓挠和推搡你，试图用对它们非人身体的渴望和只有恶魔才能掌握的不可名状的快乐来压倒你。";
            if(hasStatusEffect(StatusEffects.Blind))
            {
               _loc1_ += " 恶魔们稍微缓和了一些，由于你强大的法术，它们捂着眼睛，在沮丧和恐慌中尖叫！";
            }
            else if(hasStatusEffect(StatusEffects.OnFire))
            {
               _loc1_ += " 宫廷里有不止几个恶魔在恐惧中尖叫，在地上打滚，拼命试图扑灭你沐浴在它们身上的火焰！事实证明，玛瑞斯的恶魔对火并不是那么免疫！";
            }
         }
         else
         {
            _loc1_ += "莉希丝是所有恶魔事物的缩影。从她那交织着黑玫瑰的奢华紫发，到她粉红色的皮肤和山羊般的角，她是感官、诱人堕落的完美形象。高高的骨质高跟鞋与她暴露的黑色衣服相得益彰。它们看起来几乎像修女的习惯，但被削减到了近乎恋物癖的极端。她苗条的乳房为半透明的织物提供了一丝形状，这是女性乐趣的承诺，而不是她衣服展示的俗丽的肉体。站在她的王座上";
            if(_wingsDestroyed)
            {
               _loc1_ += "，她的翅膀破烂不堪";
            }
            _loc1_ += "，莉希丝咆哮着，挥舞着她燃烧的鞭子看着你。她黄黑相间的眼睛里充满了愤怒，牙齿尖尖的尖端在咆哮中露出来。被莉希丝石填满的愤怒的恶魔女王决心要解决你。她的耐力不可能再坚持太久了。你能打败她！";
            if(_fightPhase == 3 && _defMode != 0)
            {
               if(_defMode == 1)
               {
                  _loc1_ += "\n莉希丝准备好迎接你的下一次攻击，准备好防御任何打击。也许你可以用别的东西给她一个惊喜？";
               }
               else if(_defMode == 2)
               {
                  _loc1_ += "\n莉希丝得意地笑着，自信满满，准备抵御任何形式的性挑逗，但她的姿势却不适合防御攻击。";
               }
            }
         }
         if(get_player().hasStatusEffect(StatusEffects.LethicesRapeTentacles))
         {
            _loc1_ += "[pg]<b>一片黑色的触手森林从地板上长出，困住了任何不幸靠近的恶魔——或者任何不幸处于中心位置的勇者。</b>";
            if(get_player().statusEffectv3(StatusEffects.LethicesRapeTentacles) != 0)
            {
               _loc1_ += " 不幸的是，它们抓住了你。你必须挣脱才能做任何事！";
            }
            else if(get_player().hasStatusEffect(StatusEffects.KnowsWhitefire))
            {
               _loc1_ += " 一阵火焰爆发也许能驱散它们，或者你可以依靠你的";
               if(get_player().canFly())
               {
                  _loc1_ += " 飞行";
               }
               else
               {
                  _loc1_ += " 敏捷";
               }
               _loc1_ += " 来保持安全。无论如何，你现在自由了。";
            }
         }
         if(get_game().monster.hasStatusEffect(StatusEffects.Shell))
         {
            _loc1_ += "[pg]<b>莉希丝被一层闪烁的魔法能量穹顶包围。法术和远程攻击将无效！</b>";
         }
         if(get_player().hasStatusEffect(StatusEffects.PigbysHands))
         {
            _loc1_ += "[pg]无形的手在你的身体上游走，以只有情人才会有的方式抚摸着你。它们不会停止，也不会减慢。你必须努力无视它们令人兴奋的爱抚。";
         }
         return _loc1_;
      }
      
      public function get_fightPhase() : int
      {
         return _fightPhase;
      }
      
      public function fuckDemon() : void
      {
         clearOutput();
         get_images().showImage("lethice-plow-her-pussy");
         outputText("恶魔们的催促摧毁了你的自制力，伴随着一声充满努力和欲望的咕哝，你把双性魅魔推倒仰面躺下。她惊讶地叫了一声，但她的摔倒被身后一个由牛娘变成的恶魔那巨大的、乳白色的奶子缓冲了，那个恶魔正忙着吸吮一对恶魔的肉棒。你的双性魅魔在心跳间从惊讶中恢复过来，把它变成了一个奢华的伸展动作，在她那像马一样的沉重睾丸的翻滚重量下，张开了她的阴唇。");
         outputText("[pg]当你看到那朱红色的裂口张开时，你立刻扑向她，将你的[cock]深深地插入那湿滑的小穴中，让双性魅魔发出愉悦的呻吟。她的犬科肉棒完全勃起，戳着你的[chest]");
         if(get_player().hasFuckableNipples())
         {
            outputText("直到你给了她一个邪恶的笑容，引导着龟头进入你的[nipple]");
         }
         else
         {
            outputText("并用先列腺液涂抹你的[skinFurScales]");
         }
         outputText("。你抓住她那甜瓜大小的奶子，尽可能用力地挤压它们，同时你向前猛烈地撞击你的[hips]，利用她小穴那如丝般湿滑的紧致感，将自己榨取至高潮。对你来说，她简直就是一个飞机杯，在你猛烈抽插时只能扭动和呻吟。");
         outputText("[pg]突然，你的整个身体紧绷起来，因新的感觉而颤抖。你回头看去，正好看到另一个魅魔从你身后爬上来，用她的舌头舔过你的股沟");
         if(get_player().balls > 0)
         {
            outputText("并绕着你的睾丸");
         }
         else
         {
            outputText("一直到你肉棒的根部");
         }
         outputText("。另一个女恶魔依偎在你身后，将一对沉重的乳房压在你的背上，喃喃地说她想看你在身下那个双性恋精液荡妇体内播种。");
         outputText("[pg]随着越来越多的恶魔爬到你身上，催促你在她们的同伴身上巩固你的胜利，或者用嘴和堕落的舌头增加你的快感，没过多久，你就屈服于身体的肉欲需求。你最后一次猛烈地插入双性魅魔的小穴，随着精液在你的肉棒中膨胀，溢出并涂抹在女恶魔的子宫里，你因涌起的快感而发出咕哝声。她大叫起来，用臀部顶着你，很快也跟着你射出了一股精液");
         if(!get_player().hasFuckableNipples())
         {
            outputText("溅满了你的胸膛");
         }
         else
         {
            outputText("直接射进你的乳房");
         }
         outputText("！你给了她一个责备的眼神，在高潮的余震过去时，仍然摩擦着你的臀部。");
         outputText("[pg][say: 我可不觉得抱歉，]她咯咯笑着，用手指在涂满精液的小穴周围画圈，在你拔出时把每一滴多余的精液都推了回去。[say: 嗯，这能生出一窝可爱的小恶魔，</i>勇者<i>！]");
         outputText("[pg]一想到这个你就浑身发抖，你抓起装备，踉踉跄跄地站起来走开，留下恶魔们互相解决。你对自己的状态充满信心，向莉希丝走去。");
         get_player().orgasm("Generic");
         beginPhase3(true);
      }
      
      public function dispellRapetacles() : void
      {
         clearOutput();
         if(get_player().statusEffectv3(StatusEffects.LethicesRapeTentacles) == 0)
         {
            outputText("你抬起手臂，并且");
         }
         else
         {
            outputText("你挣扎着，设法在触手的紧紧抓握下抬起手臂，成功地");
         }
         outputText("喷射出一股白色的火焰洪流，在你纯粹、集中的火焰光芒中将这些暗影构造物燃烧殆尽。几秒钟内，莉希丝的法术就消失了。");
         get_player().removeStatusEffect(StatusEffects.LethicesRapeTentacles);
         get_player().changeFatigue(30,1);
         var _loc1_:IMap = get_flags();
         FlagDict_Impl_.arrayWriteInt(_loc1_,868,FlagDict_Impl_.arrayReadInt(_loc1_,868) + 1);
         get_player().masteryXP(MasteryLib.Casting,2 + Utils.rand(7));
         get_game().combat.startMonsterTurn();
      }
      
      public function dirtyDancing() : void
      {
         var _loc1_:Number = 0;
         outputText("离你最近的恶魔基本上被夹在你的身体和他们身后的恶魔之间，全都向前涌来想要抓住你——而他们中有一半的人正被落后的人操着或挑逗着，阴茎和超大的阴蒂疯狂地抽插着。尽管如此，最近的恶魔和其他恶魔一样决心让你成为他们的，即使他们的选择非常有限。所以他们尽其所能：他们跳舞、摩擦、向你挺动，在向你展示丰满柔软的肉体和坚硬的肌肉之间，用乳汁、女性的淫液和麝香般咸咸的先列腺液涂抹你的[armor]。");
         if(Utils.rand(100) >= get_player().lib / 2)
         {
            outputText("[pg]你拼尽全力向后推，把那些试图吸引你注意力的放荡身体推开。几个魅魔向你抱怨呻吟，撅着嘴说她们淫荡的舞蹈没有让你满意——就像你在个人层面上侮辱了她们一样。不过，其他人很快就取代了她们，瞬间填补了你在汹涌的人潮中留下的空隙。");
         }
         else
         {
            if(get_player().get_lust100() <= 33)
            {
               outputText("[pg]你试图反击，无视周围那些淫荡的身体和骇人的表演，但它们对你的影响是不可否认的——热量像野火一样蔓延穿过你的[skinFurScales]，你的[armor]突然感觉不那么舒服了。");
            }
            else if(get_player().get_lust100() <= 66)
            {
               outputText("[pg]尽管你努力抵抗，恶魔们还是对你产生了影响！你全身都因不请自来的性欲而发红，对压迫着你的恶魔荡妇燃烧着欲望。这些诱惑者几乎足以让你想放下武器，把其中一个弯成两半，好好地、狠狠地操一顿！");
            }
            else
            {
               outputText("[pg]哦，天哪！她们身体起伏、爱抚和高潮的方式，当她们从后面被操时呻吟着并将所有这些能量传递给你，让你的身体燃烧着欲望。这几乎让人无法忍受！");
            }
            _loc1_ = get_player().lib / 10 + get_player().cor / 10 + 10;
            if(get_player().hasStatusEffect(StatusEffects.MinotaurKingsTouch))
            {
               _loc1_ *= 1.25;
            }
            get_player().takeLustDamage(_loc1_,true);
         }
      }
      
      public function demonicArouse() : void
      {
         outputText("莉希丝的手模糊成一套熟悉的奥术动作，类似于你从小恶魔那里见过的魔法手势。但她的手势要复杂一千倍。她纤细的手指像大师的画笔一样精准地移动，被黑色的能量火花环绕着。");
         var _loc1_:Number = get_player().lib / 10 + get_player().cor / 10 + 25;
         if(get_player().hasStatusEffect(StatusEffects.MinotaurKingsTouch))
         {
            _loc1_ *= 1.25;
         }
         get_player().takeLustDamage(_loc1_,true);
         if(get_player().get_lust100() <= 30)
         {
            outputText("[pg]你感到一种奇怪的温暖。");
         }
         else if(get_player().get_lust100() <= 60)
         {
            outputText("[pg]随着一阵性欲的涌动，血液冲向你的腹股沟，让你的膝盖发软。");
         }
         else if(get_player().get_lust100() <= 75)
         {
            outputText("[pg]尽管情况危急，你的脑海里却不断浮现出莉希丝完全赤裸的画面，她的身体就在几英寸之外。你忍不住想要她。");
         }
         else if(get_player().get_lust100() <= 90)
         {
            outputText("[pg]黑暗的力量将想法强行塞进你的脑海，让你想象自己跪在地上，双手被铐在身后，而你女主人的完美、漂亮的小穴就在你面前，等待着你的舌头。你勉强才摆脱了这种想法。");
         }
         else if(get_player().get_lust100() < 100)
         {
            outputText("[pg]你的脑海里充满了可爱的小穴、完美的乳房的幻象，以及一种压倒一切的情绪——屈服。她让你想要放弃并沉溺于她堕落的诡计中，最糟糕的是……你很难想出一个不这样做的理由。你勉强从她光滑多汁的小穴的吞噬性画面中抽身，惊奇地摇了摇头。你到底怎么可能打败她？");
         }
         else
         {
            outputText("你将自己交给了入侵你脑海的异样画面，沉迷于十几个相互冲突的幻想中。在一个幻想中，你被一根皮带拴在莉希丝的阴蒂环上，舔舐着地上她溢出的淫液。在另一个幻想中，你乞求她让你舔她的屁眼。每一个都比上一个更变态，它们融合在一起，形成了一幅无尽的屈服画面。");
         }
      }
      
      public function demonfire() : void
      {
         outputText("莉希丝眯起眼睛，带着致命的意图集中精神。她打了个响指，一团黑色的、扭曲的火焰吞噬了你！");
         get_game().combat.monsterDamageType = "Fire";
         var _loc1_:Number = get_inte() + Utils.rand(25) * (1 + get_player().newGamePlusMod() * 0.3);
         get_player().takeDamage(_loc1_,true);
      }
      
      public function demonLustMagic() : void
      {
         var _loc1_:Number = 0;
         outputText("虽然前排的恶魔被同伴挤得紧紧贴着你，动弹不得，但第二排和第三排的恶魔却有足够的空间挥舞手臂，在空中画出神秘的符文。你知道你可以抵抗区区一个恶魔的情欲魔法，但这么多恶魔同时施法……");
         if(Utils.rand(100) >= get_player().lib / 2)
         {
            outputText("[pg]你闭上眼睛，将全部意志集中在内心。虽然一阵情欲的灼热刺痛了你的肉体，但你保持了足够长时间的专注，抵挡住了恶魔魔法的冲击。深吸一口气，你发出一声愤怒的战吼，将这群恶魔推开，惩罚了那些胆敢试图迷惑你的人。");
         }
         else if(get_player().get_lust100() <= 33)
         {
            outputText("[pg]你拼尽全力想要把开始渗透进你脑海的淫荡、顺从的念头推开，但在这么多集中的意志面前……就连你也无法抵挡。当第一丝情欲在你体内蔓延，在你的下体燃烧时，你呻吟出声。你现在多想被狠狠地操一顿啊！");
            _loc1_ = get_player().lib / 10 + get_player().cor / 10 + 10;
            if(get_player().hasStatusEffect(StatusEffects.MinotaurKingsTouch))
            {
               _loc1_ *= 1.25;
            }
            get_player().takeLustDamage(_loc1_,true);
         }
         else if(get_player().get_lust100() <= 66)
         {
            outputText("[pg]起初，你试图想点别的……但在你现在的状态下，那最终只会变成性：在肉海中火热、肮脏、汗流浃背地做爱。你喘着粗气，意识到自己已经向恶魔敞开了心扉，而他们非常乐意用顺从和肆意放荡的画面淹没你的大脑，试图诱骗你让他们占有你！");
            _loc1_ = get_player().lib / 10 + get_player().cor / 10 + 10;
            if(get_player().hasStatusEffect(StatusEffects.MinotaurKingsTouch))
            {
               _loc1_ *= 1.25;
            }
            get_player().takeLustDamage(_loc1_,true);
         }
         else
         {
            outputText("[pg]你甚至不再试图抵抗了——你的脑海里已经充满了淫荡的念头，混合着在你血管中燃烧、在下体膨胀的欲望，几乎摧毁了你抵抗的能力。恶魔们只会火上浇油，用享乐主义的顺从画面，用如果你给他们机会，他们能对你做的所有奇妙事情的画面，来助长你肆意的想象。这真的很难拒绝。");
            _loc1_ = get_player().lib / 10 + get_player().cor / 10 + 10;
            if(get_player().hasStatusEffect(StatusEffects.MinotaurKingsTouch))
            {
               _loc1_ *= 1.25;
            }
            get_player().takeLustDamage(_loc1_,true);
         }
      }
      
      override public function defeated(param1:Boolean) : void
      {
         if(_fightPhase == 1)
         {
            phase1Ends(param1);
            return;
         }
         if(_fightPhase == 2)
         {
            phase2Ends(param1);
            return;
         }
         get_game().lethicesKeep.lethice.defeated(param1);
      }
      
      public function crushingBodies() : void
      {
         var _loc1_:Number = 0;
         outputText("一百个恶魔身体压在你身上的绝对重量足以让你因不适而大叫，然后是痛苦。他们只是想把你压死吗！？");
         var _loc2_:* = combatAvoidDamage(new AvoidDamageParameters(true,false,false,null,null,null,null,null));
         if(_loc2_.dodge == EVASION_EVADE)
         {
            outputText("[pg]你倒在地上，在他们的几条腿之间蠕动，直到你到达一个可以再次站立的地方——这次没有折断你的肋骨。挫败和愤怒的嚎叫在大厅里回荡，部落再次向你冲来！");
         }
         else
         {
            _loc1_ = (70 - Utils.rand(get_player().get_tou())) * (1 + get_player().newGamePlusMod() * 0.3);
            if(_loc1_ < 5)
            {
               _loc1_ = 10;
            }
            outputText("你从他们压倒性的拥抱中挣脱出来，试图在地上爬走，但如果他们不能把你挤下去，恶魔们似乎很乐意践踏你！当几十只脚、蹄子、爪子和其他附肢压在你身上时，你惊恐和痛苦地尖叫！");
            get_player().takeDamage(_loc1_,true);
         }
      }
      
      public function claw() : void
      {
         outputText("恶魔女王低飞俯冲，用突然变长到六英寸、像剃刀一样锋利的爪子向你挥击！");
         var _loc1_:Number = get_player().reduceDamage(eBaseDamage(),this,30);
         var _loc2_:* = combatAvoidDamage(new AvoidDamageParameters(true,true,true,null,null,null,null,null));
         if(_loc2_.dodge == EVASION_SPEED || _loc2_.dodge == EVASION_UNHINDERED || _loc2_.dodge == EVASION_BLIND)
         {
            outputText("你设法躲开了她的挥砍！");
         }
         else if(_loc2_.dodge == EVASION_MISDIRECTION)
         {
            outputText("你用动作误导了她，避开了挥击。");
         }
         else if(_loc2_.dodge == EVASION_FLEXIBILITY)
         {
            outputText("凭借猫科动物般的柔韧性，你弯下腰避开了挥击。");
         }
         else if(_loc2_.dodge == EVASION_EVADE)
         {
            outputText("你一个快速翻滚躲开了她的挥砍。");
         }
         else if(Boolean(_loc2_.attackFailed))
         {
            outputText("你及时挡住了她的挥砍。");
         }
         else if(_loc1_ <= 5)
         {
            outputText("她勉强擦伤了你。她需要更强大的武器才能击倒你。");
            get_player().takeDamage(_loc1_,true);
         }
         else
         {
            outputText("该死，真疼！");
            get_player().takeDamage(_loc1_,true);
            if(get_player().bleed(this))
            {
               outputText("[pg-]她锋利的爪子深深刺入，留下了难以愈合的伤口；你[b:流血]了！");
            }
         }
      }
      
      public function bukkakeTime() : void
      {
         outputText("考虑到一半的恶魔大军只是被身后的人操着，这只是一个在精液开始流动之前他们能坚持多久的问题。答案恰好是现在！当空气中突然充满强效、阳刚的精液的恶臭，粗大的白色精液绳索开始在空中飞舞时，你喘息着作呕。这现在与其说是一群暴徒，不如说是一场狂欢！");
         var _loc1_:* = combatAvoidDamage(new AvoidDamageParameters(true,false,false,null,null,null,null,null));
         if(_loc1_.dodge == EVASION_SPEED || _loc1_.dodge == EVASION_UNHINDERED)
         {
            outputText("你抓住你能找到的最大的男魅魔，把他推到空中颜射的路上，让他粗壮的背部承受恶魔们的大部分负荷。他不满地咕哝着，粗暴地把你推回恶魔的轮奸中。[say: 无处可逃！]");
         }
         else if(_loc1_.dodge == EVASION_MISDIRECTION)
         {
            outputText("你躲在最近的一群魅魔下面，高兴地让恶魔荡妇们被飞舞的精液波浪涂满。她们似乎也很享受，很快你周围就少了恶魔的战斗，多了很多很多地狱般的吸精。看来她们饿了！");
         }
         else if(_loc1_.dodge == EVASION_FLEXIBILITY)
         {
            outputText("你优雅地向后翻滚躲开，确保是一群渴望的魅魔被精液涂成白色，而不是你！");
         }
         else if(_loc1_.dodge == EVASION_EVADE)
         {
            outputText("至少在精液波浪击中你之前，你设法闭上了眼睛，溅满了你的[armor]。");
            get_player().takeLustDamage(5,true);
         }
         else
         {
            outputText("你的眼睛直接被一大团肥厚、麝香的精液击中！你惊恐地叫喊，试图擦掉咸咸的、燃烧的恶魔精液，但它实在太稠了！恶心！");
            get_player().takeLustDamage(5,true);
            get_player().createStatusEffect(StatusEffects.Blind,2 + Utils.rand(2),0,0,0);
         }
      }
      
      public function beginPhase3(param1:Boolean) : void
      {
         _fightPhase = 3;
         set_HP(maxHP());
         set_lust(10);
         _defMode = 1;
         _hpLastTurn = int(get_hp100());
         _lustLastTurn = int(get_lust100());
         set_a("");
         set_short("Lethice");
         set_plural(false);
         pronoun1 = "她";
         pronoun2 = "她";
         pronoun3 = "她的";
         if(get_player().newGamePlusMod() >= 1 && get_armorName() != "lethicite armor")
         {
            set_armorName("lethicite armor");
            set_armorDef(get_armorDef() + 30);
         }
         get_game().output.menu();
         if(param1)
         {
            get_game().output.addButton(0,"继续",p2Next);
         }
         else
         {
            tookAction = true;
            get_game().combat.startMonsterTurn();
         }
      }
   }
}

