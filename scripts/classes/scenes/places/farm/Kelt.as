package classes.scenes.places.farm
{
   import classes.Appearance;
   import classes.CoC;
   import classes.CockTypesEnum;
   import classes.Creature;
   import classes.Monster;
   import classes.Player;
   import classes.StatusEffects;
   import classes._FlagDict.FlagDict_Impl_;
   import classes.globalFlags.KFLAGS;
   import classes.internals.MonsterAI;
   import classes.internals.Utils;
   import classes.scenes.combat.AvoidDamageParameters;
   import classes.scenes.combat.CombatRange;
   import flash.Boot;
   import haxe.IMap;
   
   public class Kelt extends Monster
   {
      
      public var bowCooldown:int;
      
      public function Kelt()
      {
         if(Boot.skip_constructor)
         {
            return;
         }
         bowCooldown = 0;
         super();
         var _loc1_:Boolean = FlagDict_Impl_.arrayReadInt(KFLAGS.flags,725) == 2;
         set_a("");
         set_short("Kelt");
         imageName = "kelt";
         set_long("自从你们第一次见面以来，凯尔特的情况变得更糟了。他那肌肉发达的桶状胸膛不见了。取而代之的是一个更柔软的身躯，上面长着小巧的乳房——这是你上次调教的残留物。他的下巴相当方正且轮廓分明（尽管不如以前）。腰部以下，他有着马的身体，配有一对相当大的睾丸和一根尺寸可观的肉棒。然而，两者都比以前小了。他已经把弓上好弦拿在手里，显然是打算保护自己免受你那不怎么温柔的触摸。" + (_loc1_ ? "凯尔特看起来越来越不像以前那个魁梧的半人马，而越来越像个女人。比起你把他变成的美丽女人，他现在看起来更像是一个奇怪的雌雄同体混合物。他目前长着大约B罩杯的乳房和一根偏小的迷你马鸡巴。除了长长的鬃毛，他的人类身体上几乎没有毛发。每一次调教似乎都比上一次更有效，你迫不及待地想看看这次驯服他之后会发生什么。" : ""));
         set_race("Centaur");
         createCock(_loc1_ ? 12 : 24,3.5,CockTypesEnum.HORSE);
         balls = 2;
         ballSize = 2 + Utils.rand(13);
         cumMultiplier = 1.5;
         set_hoursSinceCum(get_player().ballSize * 10);
         createBreastRow(Appearance.breastCupInverse(_loc1_ ? "B" : "A"));
         ass.analLooseness = 2;
         ass.analWetness = 0;
         createStatusEffect(StatusEffects.BonusACapacity,50,0,0,0);
         set_tallness(84);
         hips.rating = 4;
         butt.rating = 5;
         lowerBody.type = 1;
         lowerBody.legCount = 4;
         skin.tone = "tan";
         var _loc2_:Array = ["black","brown"];
         var _loc3_:String = _loc2_[Utils.rand(int(_loc2_.length))];
         hair.color = _loc3_;
         hair.length = 3;
         initStrTouSpeInte(60,70,40,20);
         initLibSensCor(40,25,55);
         set_weaponName("fist");
         set_weaponVerb("punch");
         set_weaponAttack(10);
         set_armorName("tough skin");
         set_armorDef(4);
         bonusHP = 200;
         set_lust(40);
         lustVuln = 0.83;
         temperment = 1;
         level = 6;
         set_gems(Utils.rand(5) + 5);
         tail.type = 1;
         set_drop(NO_DROP);
         checkMonster();
      }
      
      override public function won(param1:Boolean, param2:Boolean = false) : void
      {
         if(param2)
         {
            outputText("[pg]凯尔特退缩了片刻，然后摆出一副高高在上的神情……");
            doNext(get_game().combat.endLustLoss);
         }
         else
         {
            get_game().farm.kelly.keltFucksShitUp();
         }
      }
      
      override public function performCombatAction() : void
      {
         var _loc1_:MonsterAI = new MonsterAI();
         if(bowCooldown > 0)
         {
            bowCooldown -= 1;
         }
         _loc1_.add(keltShootBow,2,bowCooldown == 0,0,FATIGUE_NONE,CombatRange.Ranged);
         _loc1_.add(dayDreamKelly,1,FlagDict_Impl_.arrayReadInt(get_flags(),725) >= 2,0,FATIGUE_NONE,CombatRange.Self);
         _loc1_.add(eAttack,2,true,0,FATIGUE_NONE,CombatRange.Melee);
         _loc1_.add(KellyuraAttack,1.5,true,0,FATIGUE_NONE,CombatRange.Tease);
         _loc1_.add(keltTramplesJoo,1.5,true,10,FATIGUE_PHYSICAL,CombatRange.ChargingMelee);
         _loc1_.exec();
      }
      
      public function keltTramplesJoo() : void
      {
         outputText("还没等你弄清楚怎么回事，凯尔特就向你飞奔而来，身后扬起一阵尘土。他想踩踏你！");
         if(Boolean(combatAvoidDamage(new AvoidDamageParameters(true,false,false,null,null,null,null,null)).attackFailed))
         {
            outputText("你在最后一刻滚开，避开了他危险的蹄子。");
            return;
         }
         var _loc1_:int = get_player().reduceDamage(get_str() + get_weaponAttack(),this);
         if(_loc1_ <= 0)
         {
            outputText("令人难以置信的是，你稳住身形，双[feet]紧紧抓地。凯尔特撞向你，但你硬生生把他的冲力减半。他的嘴巴不解地张合了一会儿，然后后退，因为离你太近而涨红了脸。");
            set_lust(get_lust() + 5);
         }
         else
         {
            outputText("你没能及时躲开，被撞倒了！凯尔特从你身上踩了过去！");
         }
         if(_loc1_ > 0)
         {
            get_player().takeDamage(_loc1_,true);
         }
      }
      
      public function keltShootBow() : void
      {
         bowCooldown = 3;
         outputText("凯尔特搭箭射击的速度几乎快到你无法看清。即使经历了你对他所做的一切，他在弓箭上的天赋也丝毫未减。");
         if(Boolean(combatAvoidDamage(new AvoidDamageParameters(true,false,false,null,null,null,null,null)).attackFailed))
         {
            outputText("你险之又险地避开了飞箭！");
            return;
         }
         var _loc1_:Number = 0;
         _loc1_ = get_player().reduceDamage(20 + get_str() / 3 + 100 + get_spe() / 3,this);
         if(_loc1_ < 0)
         {
            _loc1_ = 0;
         }
         if(_loc1_ == 0)
         {
            outputText("你挡开了攻击，没有受到伤害。");
            return;
         }
         outputText("你还没来得及反应，箭就射中了你。");
         get_player().takeDamage(_loc1_,true);
      }
      
      override public function defeated(param1:Boolean) : void
      {
         if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,2029) == 1)
         {
            if(param1)
            {
               get_game().farm.keltScene.fightToBeatKeltVictoryHP();
            }
            else
            {
               get_game().farm.keltScene.fightToBeatKeltVictoryLust();
            }
         }
         else if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,725) == 1)
         {
            get_game().farm.kelly.defeatKellyNDBREAKHIM();
         }
         else
         {
            get_game().farm.kelly.breakingKeltNumeroThree();
         }
      }
      
      public function dayDreamKelly() : void
      {
         if(Utils.rand(2) == 0)
         {
            outputText("凯尔特在拉弓到一半时停了下来，上下打量着你。他舔了舔嘴唇，过了一会儿才摇摇头，将自己从情欲的恍惚中唤醒。他一定很想念你精液的味道。");
         }
         else
         {
            outputText("凯尔特张大“他”的鼻孔，深深地吸了一口气，眼睑颤动着闭上，发出一声相当淑女的呻吟。他的双手在自己坚挺的乳头上游走，轻轻捏了捏，然后才恢复过来。");
         }
         set_lust(get_lust() + 5);
      }
      
      public function KellyuraAttack() : void
      {
         var _loc1_:int = Utils.rand(3);
         if(_loc1_ == 0)
         {
            outputText("凯尔特露出他最傲慢的笑容，向下指了指。[say: 你忘了你为什么在这里吗，荡妇？偷袭我一次并不能改变你是个婊子的事实。]");
         }
         else if(_loc1_ == 2)
         {
            outputText("凯尔特咧嘴笑着跑过，在你身后留下一团他的麝香和信息素。你不得不承认，这让你有点欲火焚身……");
         }
         else
         {
            outputText("凯尔特咆哮道，[say: 你怎么不像你这个荡妇一样自慰，直到我过去惩罚你？]");
            if(get_player().get_lust100() >= 80)
            {
               outputText("你的手似乎不受控制地伸向你的腹股沟。");
            }
            else
            {
               outputText("你的手抽搐着伸向腹股沟，但你制止了它们。尽管如此，这个想法似乎在你的脑海深处嗡嗡作响，让你兴奋不已。");
            }
         }
         get_player().takeLustDamage(get_player().lib / 5 + Utils.rand(10),true);
      }
   }
}

