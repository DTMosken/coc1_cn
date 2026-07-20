package classes.scenes.areas.highMountains
{
   import classes.CoC;
   import classes.CockTypesEnum;
   import classes.Monster;
   import classes.Player;
   import classes.StatusEffects;
   import classes._FlagDict.FlagDict_Impl_;
   import classes.display.SpriteDb;
   import classes.globalFlags.KFLAGS;
   import classes.internals.MonsterAI;
   import classes.internals.Utils;
   import classes.scenes.combat.Combat;
   import classes.scenes.combat.CombatRange;
   import flash.Boot;
   import haxe.IMap;
   
   public class MinotaurMob extends Monster
   {
      
      public function MinotaurMob()
      {
         if(Boot.skip_constructor)
         {
            return;
         }
         super();
         set_a("");
         if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,326) < 20)
         {
            set_short("minotaur gang");
         }
         else
         {
            set_short("minotaur tribe");
         }
         imageName = "minomob";
         set_long(Utils.Num2Text(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,326)) + "个毛茸茸的兽人松散地围成一圈站在你周围。他们的姿势并不算有威胁性。如果说有什么的话，他们似乎是在保护性地站在你周围，仿佛他们的存在能以某种方式庇护你免受山上其他东西的伤害。他们所有的特征都有着兄弟般的相似之处，尽管你的牛头人儿子们之间仍然有相当多的差异。其中一个比其他的都要高出一个头，是一个巨大的肌肉块，大到似乎让其他的都相形见绌。形成鲜明对比的是，一个女性化的迷你牛头人在后面保持着距离。" + (FlagDict_Impl_.arrayReadInt(KFLAGS.flags,326) >= 20 ? " 部落不断地发出嘘声和口哨声，满心期待着很快就能操你。" : ""));
         set_race("Minotaurs");
         set_plural(true);
         pronoun1 = "他们";
         pronoun2 = "他们";
         pronoun3 = "他们的";
         createCock(Utils.rand(13) + 24,2 + Utils.rand(3),CockTypesEnum.HORSE);
         balls = 2;
         ballSize = 2 + Utils.rand(13);
         cumMultiplier = 1.5;
         set_hoursSinceCum(ballSize * 10);
         createBreastRow(0);
         ass.analLooseness = 4;
         ass.analWetness = 1;
         createStatusEffect(StatusEffects.BonusACapacity,30,0,0,0);
         set_tallness(Utils.rand(37) + 84);
         hips.rating = 4;
         butt.rating = 5;
         lowerBody.type = 1;
         skin.tone = "red";
         skin.type = 1;
         skin.desc = "shaggy fur";
         var _loc1_:Array = ["black","brown"];
         var _loc2_:String = _loc1_[Utils.rand(int(_loc1_.length))];
         hair.color = _loc2_;
         hair.length = 3;
         face.type = 3;
         initStrTouSpeInte(65,60,30,20);
         initLibSensCor(40,15,35);
         set_weaponName("fists");
         set_weaponVerb("punches");
         set_armorName("thick fur");
         var _loc3_:Number = 340 + 50 * (FlagDict_Impl_.arrayReadInt(KFLAGS.flags,326) - 3);
         var _loc4_:Number = 0.45;
         if((FlagDict_Impl_.arrayReadInt(KFLAGS.flags,326) - 3) * 2 > 13)
         {
            _loc4_ = 0.3;
         }
         else
         {
            _loc4_ -= (FlagDict_Impl_.arrayReadInt(KFLAGS.flags,326) - 3) * 0.02;
         }
         bonusHP = _loc3_;
         set_lust(30);
         lustVuln = _loc4_;
         temperment = 1;
         var _loc5_:int = int(11 + Math.round((FlagDict_Impl_.arrayReadInt(KFLAGS.flags,326) - 3) / 2));
         if(_loc5_ > 14)
         {
            _loc5_ = 14;
         }
         level = _loc5_;
         set_gems(Utils.rand(15) + 45);
         tail.type = 4;
         set_drop(NO_DROP);
         checkMonster();
      }
      
      override public function won(param1:Boolean, param2:Boolean = false) : void
      {
         if(param2)
         {
            outputText("[pg]在你高潮时，迷你牛头人们哄堂大笑，但他们那跳动的勃起却没有丝毫减退。");
            doNext(get_game().combat.endLustLoss);
         }
         else
         {
            get_game().highMountains.minotaurMobScene.minotaurDeFeet();
         }
      }
      
      override public function runCheck() : void
      {
         var newRound:Boolean;
         var _g:Combat;
         if(FlagDict_Impl_.arrayReadInt(get_flags(),329) == 1)
         {
            FlagDict_Impl_.arrayWriteInt(get_flags(),329,0);
            outputText("趁着这群野兽还在争吵，你溜走了。等他们吵完，肯定会大失所望的！");
            get_game().combat.doRunAway();
         }
         else if(HPRatio() >= 0.75)
         {
            outputText("包围你的牛头人太多了，根本跑不掉！");
            _g = get_game().combat;
            newRound = false;
            doNext(function():void
            {
               _g.combatMenu(newRound);
            });
         }
         else
         {
            super.runCheck();
         }
      }
      
      public function precumTease() : void
      {
         var _loc1_:Boolean = false;
         var _loc2_:Number = 0;
         var _loc3_:Number = get_player().get_lust();
         get_game().spriteSelect(SpriteDb.get_s_minotaurSons());
         if(Utils.rand(2) == 0)
         {
            _loc1_ = true;
            if(Utils.rand(5) > 0)
            {
               outputText("体型最大的那个掀起他的缠腰布，让你完美地看到他青筋暴起的坚挺。先列腺液明显从他膨大的龟头冠状沟处冒出，湿漉漉地溅在岩石上，空气中弥漫着他野兽般的麝香。他说，[say: 看到我有多需要你了吗？]");
               get_player().takeLustDamage(7 + get_player().lib / 20);
            }
            else
            {
               outputText("人群中最大的一头公牛掀起他那浸满精液的缠腰布，用一只巨大的、肌肉发达的手握住他那惊人的勃起。他前后摇晃着它，将冒泡的先列腺液弹向你的方向，让它在你周围的岩石上发出嘈杂的溅射声。几滴甚至落在了你的皮肤上，让空气中弥漫着牛头人的信息素。");
               get_player().takeLustDamage(13 + get_player().lib / 20);
            }
         }
         if(Utils.rand(2) == 0)
         {
            _loc1_ = true;
            if(Utils.rand(5) > 0)
            {
               outputText("[pg-][say: 嘿，荡妇，看这个！] 其中一个兽人嘲弄道。他淫荡地摇晃着臀部，将他粗大的马巴在宽阔的圆圈中旋转，并将他强效的先列腺液抛向空中。水滴在你周围像雨点般落下，空气中弥漫着更多那种美味的气味。");
               get_player().takeLustDamage(3 + get_player().lib / 30);
            }
            else
            {
               outputText("[pg-][say: 妈妈，你现在不妨张开大腿，我给你准备了点好东西！] 一个体格健壮的牛头人宣布道。他挪开遮蔽物，在他肿胀的肉棒上抽插，在坚如磐石的勃起上用力拉扯，足以向你的方向喷射出巨大的先列腺液团。");
               if(get_player().get_spe() / 5 + Utils.rand(20) > 20)
               {
                  outputText("你避开了大部分，这些液体溅在山上，但还是有一点溅到了你身上。无论如何，空气中弥漫着他们浓重精液的臭味。");
                  get_player().takeLustDamage(6 + get_player().lib / 20);
               }
               else
               {
                  outputText("你试图避开它们，但其中一滴击中了你的脸，有一点进入了你的嘴里。你条件反射地咽了下去，并分泌出更多的唾液，你的眼睛飞快地看着周围被弄脏的岩石。你真的在考虑把它从地上舔干净吗？");
                  get_player().takeLustDamage(15 + get_player().lib / 20);
               }
            }
         }
         if(!_loc1_ || Utils.rand(3) == 0)
         {
            outputText("[pg-]兽人中体型最小的迷你牛头人呻吟着乞求道：[say:求你了，妈妈，我们能操你吗？我……我太需要了。]他掀起缠腰布的边缘，向你展示他到底在说什么。他的肉棒虽然疲软，但却在不断滴液。真正吸引你眼球的是那根滴水的肉棒后面的东西——一对看起来肿胀不堪、憋得难以置信的睾丸。他的生殖器和缠腰布之间挂着一张由他的分泌物粘成的网，向你展示了他一想到要操你，就流了多少水。他扇动着湿透的布料，不经意间将一股信息素吹向了你。");
            get_player().takeLustDamage(9 + get_player().lib / 20);
         }
         get_player().takeLustDamage(_loc2_);
         _loc2_ = get_player().get_lust() - _loc3_;
         outputText("[pg-]");
         if(_loc2_ <= 8)
         {
            outputText("虽然这些发情的野兽给你表演的节目让你的身体感到一阵酥麻，但它对你的影响并没有想象中那么大。");
            if(get_player().get_lust() >= get_player().maxLust())
            {
               outputText("尽管如此，你还是太饥渴了，无法再战斗下去了。");
            }
         }
         else if(_loc2_ <= 14)
         {
            outputText("弥漫在你周围空气中强烈的信息素和气味让你的身体燥热发红。你的[nipples]变得更硬了");
            if(get_player().get_lust100() > 70)
            {
               outputText("，尽管你觉得这根本不可能");
            }
            else
            {
               outputText("，感觉就像两颗子弹在你的[armor]内侧摩擦");
            }
            outputText("，但……情况本来可能会更糟。当你的脑海中闪过让他们把液体滴满你全身的幻想时，你浑身一颤。");
            if(get_player().get_lust() >= get_player().maxLust())
            {
               outputText("去他的，他们闻起来太棒了。你想要，不，你需要更多。");
            }
            else
            {
               outputText("你内心越来越渴望体验那种感觉。");
            }
         }
         else
         {
            outputText("所有那些强效的先列腺液让你的小穴");
            if(get_player().wetness() <= 1)
            {
               outputText("变得湿润");
            }
            else if(get_player().wetness() <= 2)
            {
               outputText("滴下淫水");
            }
            else if(get_player().wetness() <= 3)
            {
               outputText("流出淫水");
            }
            else
            {
               outputText("汁水四溢");
            }
            outputText("，渴望得到满足。");
            if(get_player().minotaurNeed())
            {
               outputText("你太需要解解渴了！");
               get_player().takeLustDamage(5,true);
            }
            else
            {
               outputText("你亲身体会到了那种液体有多么强效和令人上瘾……");
            }
            if(get_player().hasCock())
            {
               outputText("" + get_player().SMultiCockDesc() + " 抽搐着，滴下了自己的先列腺液，但闻起来远没有那么好！");
            }
            outputText("你颤抖着呻吟，身体被不断增长的性欲所折磨。爬到兽人们湿透的双腿下，舔舐他们流着液体的勃起肉棒的幻想充斥着你的脑海，你的身体也随之颤抖摇晃。");
            if(get_player().get_lust100() <= 99)
            {
               outputText("你猛地从悬崖边缘退了回来。想用这点带药的先列腺液打倒你，还差得远呢！");
            }
            else
            {
               outputText("你叹了口气，任由舌头伸出来。这应该不会太糟，对吧？");
            }
         }
      }
      
      override public function performCombatAction() : void
      {
         get_game().spriteSelect(SpriteDb.get_s_minotaurSons());
         FlagDict_Impl_.arrayWriteInt(get_flags(),329,0);
         var _loc1_:MonsterAI = new MonsterAI();
         _loc1_.add(precumTease,2,true,0,FATIGUE_NONE,CombatRange.Tease);
         _loc1_.add(minotaurGangGropeAttack,2,true,0,FATIGUE_NONE,CombatRange.Melee);
         _loc1_.add(minotaurGangGangGropeAttack,1,true,0,FATIGUE_NONE,CombatRange.Melee);
         _loc1_.add(get_game().mountain.minotaurScene.minoPheromones,1,true,0,FATIGUE_NONE,CombatRange.Ranged);
         _loc1_.add(minotaurGangWaste,1,true,0,FATIGUE_NONE,CombatRange.Melee);
         _loc1_.exec();
      }
      
      public function minotaurGangWaste() : void
      {
         FlagDict_Impl_.arrayWriteInt(get_flags(),329,1);
         get_game().spriteSelect(SpriteDb.get_s_minotaurSons());
         outputText("[say: 噢伙计，我等不及要在那小穴里插到没柄了……我要把[him]干翻，]一头公牛向他的兄弟保证道。另一个则大笑并哼着气，告诉他只能吃自己的剩饭了。争吵迅速升级，很快，每一个兽人都在嘲弄其他人，争论着他们将如何以及何时能得到你。趁他们浪费时间的时候，正是你行动的好机会！");
      }
      
      public function minotaurGangGropeAttack() : void
      {
         get_game().spriteSelect(SpriteDb.get_s_minotaurSons());
         outputText("一双强有力的大手从背后伸来，滑入你的装备下，揉捏着你的[chest]。粗暴的手指立刻找到了你的[nipples]并捏住，你胸部敏感的肌肤瞬间被痛苦与快感点燃。你惊讶地弓起背，被这种对身体的侵犯完全惊呆了。片刻后你回过神来，扭身挣脱，但伤害已经造成。你现在的呼吸变得有些急促了");
         if(get_player().get_lust100() >= 80)
         {
            outputText("，而且你的小穴已经完全湿透了");
         }
         outputText("。");
         get_player().takeLustDamage(5 + get_player().sens / 10,true);
      }
      
      public function minotaurGangGangGropeAttack() : void
      {
         get_game().spriteSelect(SpriteDb.get_s_minotaurSons());
         outputText("还没等你反应过来，几双手从各个角度伸出，抓住了你的身体。一双手捏住你的[ass]，强有力的抓握充满爱意地按摩着你的臀瓣。另一双手在你的肚子上滑动，向下伸去，却又没有完全触碰到下方多汁的三角区。手掌环绕着你的[chest]并抚摸着，尽管抓住你的手很粗暴，但揉捏的动作却很温柔。你在众多牛头人的集体抓握中扭动挣扎了一会儿，被这种对待弄得越来越兴奋。最后，你终于挣脱了他们的束缚，重获自由，因为用力过度和欲望而大口喘息着。");
         get_player().takeLustDamage(15 + get_player().sens / 10,true);
      }
      
      override public function defeated(param1:Boolean) : void
      {
         get_game().highMountains.minotaurMobScene.victoryMinotaurGang();
      }
   }
}

