package classes.scenes.areas.forest
{
   import classes.Appearance;
   import classes.CoC;
   import classes.ItemType;
   import classes.Player;
   import classes.StatusEffects;
   import classes._FlagDict.FlagDict_Impl_;
   import classes.globalFlags.KFLAGS;
   import classes.internals.MonsterAI;
   import classes.internals.Utils;
   import classes.internals.WeightedChoice;
   import classes.items.ConsumableLib;
   import classes.scenes.combat.CombatRange;
   import classes.scenes.monsters.Goblin;
   import flash.Boot;
   import haxe.IMap;
   
   public class Tamani extends Goblin
   {
      
      public function Tamani()
      {
         if(Boot.skip_constructor)
         {
            return;
         }
         super(false);
         set_a("");
         set_short("Tamani");
         imageName = "tamani";
         set_long("她双臂交叉抱在" + get_game().forest.tamaniScene.tamaniChest() + "前，怒视着你。这个小家伙只有大约四英尺高，染着粉黑相间的头发，剪成了一个可爱的小发型。她胸部灰绿色的皮肤在双臂周围隆起，几根皮带支撑着，让她的乳沟更加明显。她的阴唇上打了好几个洞，红肿着，微微张开。她身上真的没有任何衣服可以遮挡它们，只有更多无处不在的皮带缠绕在她的腿上。");
         set_race("Goblin");
         createVagina(false,4,1);
         createStatusEffect(StatusEffects.BonusVCapacity,55,0,0,0);
         createBreastRow(Appearance.breastCupInverse("E"));
         ass.analLooseness = 1;
         ass.analWetness = 0;
         createStatusEffect(StatusEffects.BonusACapacity,40,0,0,0);
         set_tallness(40);
         hips.rating = 8;
         butt.rating = 8;
         skin.tone = "greenish gray";
         hair.color = "pink and black";
         hair.length = 16;
         initStrTouSpeInte(32,43,55,62);
         initLibSensCor(65,65,50);
         set_weaponName("fists");
         set_weaponVerb("tiny punch");
         set_armorName("leather straps");
         bonusHP = 40;
         set_lust(40);
         lustVuln = 0.9;
         temperment = 2;
         level = 4;
         set_gems(Utils.rand(25) + 5);
         set_drop(new WeightedChoice().add(get_consumables().GOB_ALE,4).addMany(1,get_consumables().L_DRAFT,get_consumables().PINKDYE,get_consumables().BLUEDYE,get_consumables().ORANGDY,get_consumables().PURPDYE,get_consumables().INCUBID,get_consumables().REDUCTO,get_consumables().L_BLUEG,null));
         checkMonster();
      }
      
      override public function won(param1:Boolean, param2:Boolean = false) : void
      {
         clearOutput();
         if(param1)
         {
            if(get_player().totalCocks() > 0)
            {
               if(Utils.rand(2) == 0)
               {
                  get_game().forest.tamaniScene.tamaniSexLost();
               }
               else
               {
                  get_game().forest.tamaniScene.tamaniSexLetHer();
               }
            }
            else
            {
               outputText("当你开始失去意识时，塔玛尼叹了口气，[say:你这笨蛋，干嘛把好玩的部分弄没啦？]");
               get_game().combat.cleanupAfterCombat();
            }
         }
         else if(get_player().totalCocks() > 0)
         {
            if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,56) > 19 && Utils.rand(2) == 0)
            {
               get_game().forest.tamaniScene.getRapedByTamaniYouHypnoSlut();
            }
            else if(Utils.rand(2) == 0)
            {
               get_game().forest.tamaniScene.tamaniSexLost();
            }
            else
            {
               get_game().forest.tamaniScene.tamaniSexLetHer();
            }
         }
         else
         {
            outputText("你屈服于自己的欲望开始自慰，但塔玛尼似乎并不在意。她一遍又一遍地对你拳打脚踢，尖叫着，[say:你这笨蛋，干嘛把好玩的部分弄没啦？]");
            get_game().player.takeDamage(9999);
            get_game().combat.cleanupAfterCombat();
         }
      }
      
      public function tamaniHypnoTease() : void
      {
         var _loc1_:Number = Utils.rand(3);
         if(_loc1_ == 0)
         {
            outputText("塔玛尼微笑着，移动着她的皮带，将其中一根拉进她那肿胀的阴道裂口中。她大声呻吟着，将镶有饰钉的皮带滑入她的外阴唇，并在她的阴蒂上摩擦。当她把皮带拔出来时，她全身都泛起了红晕，她用指尖顺着现在湿润的皮带向上滑动，[say:嗯，你难道看不出我的小穴有多需要一个男人在里面吗？做个好丈夫，把塔玛尼操满吧！你知道你想的。][pg]");
         }
         if(_loc1_ == 1)
         {
            outputText("塔玛尼漫步走到你面前，将手指滑到她小穴的两侧并将其撑开。你的目光被她那蜜汁四溢的通道所吸引，无法移开视线，她靠得更近了。她低语道，[say:你的肉棒知道它需要什么。只要做个好丈夫，听从你鸡巴的指挥，它知道你有多需要女主人的小穴。][pg]");
         }
         if(_loc1_ == 2)
         {
            outputText("塔玛尼转过身弯下腰，双手按在泥土上，双腿踢开。你张口结舌地盯着她那弹性十足的屁股，以及她那诱人湿润的裂口。她得意地笑了笑，提议道，[say:你已经在里面射了那么多次了，既然今天可以屈服并再次感受那种快乐，为什么要反抗呢？来吧，丈夫，别让塔玛尼求你……][pg]");
         }
         if(FlagDict_Impl_.arrayReadInt(get_flags(),56) < 5)
         {
            _loc1_ = Utils.rand(3);
            if(_loc1_ == 0)
            {
               outputText("你勉强将目光从她双腿间那天堂般的入口移开。你有一种冲动，想走到她身边，一次又一次地插入她体内，但你打消了这个念头。");
            }
            if(_loc1_ == 1)
            {
               outputText("你发现很难将目光从她那诱人的小穴上移开，但你做到了。你摇了摇头，清除了让妻子受孕的想法。她的花言巧语一定影响到你了。");
            }
            if(_loc1_ == 2)
            {
               outputText("无论如何，她的举动让你相当一部分的血液流向了腹股沟。");
            }
         }
         else if(FlagDict_Impl_.arrayReadInt(get_flags(),56) < 10)
         {
            _loc1_ = Utils.rand(2);
            if(_loc1_ == 0)
            {
               outputText("你费力地将目光从塔玛尼阴道那诱人的褶皱上移开。");
               if(get_player().totalCocks() > 1)
               {
                  outputText("你的每一根");
               }
               else
               {
                  outputText("你");
               }
               outputText("的[cocks]");
               if(get_player().get_lust100() > 80)
               {
                  outputText("滴下了先列腺液");
               }
               else if(get_player().get_lust100() > 40)
               {
                  outputText("变得更硬了");
               }
               else
               {
                  outputText("变硬了");
               }
               outputText("因为这性感的景象，你感到一种冲动，想冲向你的妻子，当场占有她。显然她并不是你真正的妻子，但在操了这么多次之后，把她当成妻子似乎也说得通。");
               if(get_player().get_lust100() < 70)
               {
                  outputText("不过，你现在还不想操她！");
               }
            }
            else
            {
               outputText("你挣扎着收回目光，强迫自己不再盯着塔玛尼那迷人的小穴。你浑身一颤，感觉到");
               if(get_player().totalCocks() > 1)
               {
                  outputText("每一根");
               }
               outputText("你的[cocks]");
               if(get_player().get_lust100() <= 41)
               {
                  outputText("明显变粗了");
               }
               else if(get_player().get_lust100() <= 81)
               {
                  outputText("急不可耐地抽动着");
               }
               else
               {
                  outputText("滴下先列腺液");
               }
               outputText("，对这个过于性感的地精身体做出了反应。你开始向她走去，但又停了下来，意识到自己差点就要抱起你的妻子就地正法。你知道她并不是你真正的妻子，但你很难把她当成别的什么人，或许除了你的情妇。");
               if(get_player().get_lust100() < 70)
               {
                  outputText("不管怎样，你下定决心现在绝不操她！");
               }
            }
         }
         else
         {
            _loc1_ = Utils.rand(2);
            if(_loc1_ == 0)
            {
               outputText("你勉强控制住自己，没有扑上前去将脸埋进你情妇的双腿之间。你双腿间的硬物颤抖着，");
               if(get_player().totalCocks() > 1)
               {
                  outputText("每一根");
               }
               outputText("你的[cocks]都因渴望而隐隐作痛。你努力抗拒着那种想要跪在你那娇小丰满的情妇面前，履行你作为她种马丈夫职责的冲动。");
            }
            else
            {
               outputText("你艰难地将目光从眼前那多汁的肉丘上移开。向你的妻子屈服并就地操她的欲望在你体内肆虐，将你的抵抗力融化成液态的欲望，汇聚在你的腹股沟处。");
               if(get_player().totalCocks() > 1)
               {
                  outputText("你的每一根");
               }
               else
               {
                  outputText("你");
               }
               outputText("的[cocks]都在跳动并滴下先列腺液，渴望履行它的职责，将一发又一发的精液射进塔玛尼完美的小穴里。");
            }
         }
         var _loc2_:int = Utils.rand(get_player().lib / 5) + 3 + FlagDict_Impl_.arrayReadInt(get_flags(),56);
         get_player().takeLustDamage(_loc2_,true);
      }
      
      override public function performCombatAction() : void
      {
         var _loc1_:MonsterAI = new MonsterAI().add(eAttack);
         _loc1_.add(goblinDrugAttack,1,true,0,FATIGUE_NONE,CombatRange.Ranged);
         _loc1_.add(goblinTeaseAttack,1,true,0,FATIGUE_NONE,CombatRange.Tease);
         _loc1_.exec();
      }
      
      override public function goblinTeaseAttack() : void
      {
         if(FlagDict_Impl_.arrayReadInt(get_flags(),56) > 0)
         {
            tamaniHypnoTease();
            return;
         }
         super.goblinTeaseAttack();
      }
      
      override public function defeated(param1:Boolean) : void
      {
         clearOutput();
         if(param1)
         {
            outputText("塔玛尼被击败了！");
         }
         else
         {
            outputText("塔玛尼放弃了击败你，开始自慰起来！");
         }
         get_game().forest.tamaniScene.tamaniVictoryMenu();
      }
   }
}

