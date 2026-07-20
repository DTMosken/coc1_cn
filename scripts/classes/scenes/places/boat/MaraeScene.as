package classes.scenes.places.boat
{
   import classes.Appearance;
   import classes.BaseContent;
   import classes.CoC;
   import classes.Cock;
   import classes.CockTypesEnum;
   import classes.DebugMenu;
   import classes.ImageManager;
   import classes.Monster;
   import classes.PerkLib;
   import classes.Player;
   import classes.SelfDebug;
   import classes.StatusEffects;
   import classes.Time;
   import classes.TimeAwareInterface;
   import classes.Vagina;
   import classes._FlagDict.FlagDict_Impl_;
   import classes.display.SpriteDb;
   import classes.globalFlags.KFLAGS;
   import classes.internals.Utils;
   import classes.internals._OneOf.OneOf_Impl_;
   import classes.items.ConsumableLib;
   import classes.items.Weapon;
   import classes.items.WeaponLib;
   import classes.saves.SelfSaver;
   import classes.saves.SelfSaving;
   import classes.scenes.Camp;
   import classes.scenes.Inventory;
   import classes.scenes.api.Encounter;
   import classes.scenes.api.EncounterDef;
   import classes.scenes.api.Encounters;
   import classes.scenes.api._Encounters.EncounterChance_Impl_;
   import classes.scenes.api._Encounters.EncounterOrDef_Impl_;
   import classes.scenes.combat.Combat;
   import classes.scenes.places.boat._MaraeScene.SaveContent;
   import coc.view.CoCButton;
   import flash.Boot;
   import haxe.IMap;
   import haxe.ds.Either;
   
   public class MaraeScene extends BaseContent implements TimeAwareInterface, SelfDebug, SelfSaving
   {
      
      public var saveVersion:int;
      
      public var saveName:String;
      
      public var saveContent:SaveContent;
      
      public var globalSave:Boolean;
      
      public var encounterObject:Encounter;
      
      public function MaraeScene()
      {
         if(Boot.skip_constructor)
         {
            return;
         }
         encounterObject = null;
         globalSave = false;
         saveVersion = 1;
         saveName = "marae";
         saveContent = new SaveContent(null);
         super();
         CoC.timeAwareClassAdd(this);
         SelfSaver.register(this);
         DebugMenu.register(this);
      }
      
      public function winAgainstMarae() : void
      {
         clearOutput();
         get_images().showImage("marae-defeated");
         if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,2024) == 2)
         {
            outputText("[say: 不！一个凡人怎么可能打败我？！这简直不可思议！]玛莱大喊。她现在不过是昔日真神扭曲的躯壳。虽然她的力量依然庞大，但你已经证明了自己有能力战胜她。");
            if(get_silly())
            {
               outputText("你打败了一个古老的触手神。[b: 吃屎去吧，洛夫克拉夫特！]");
            }
            if(get_player().get_weapon().isHolySword())
            {
               outputText("[pg]为了纠正你的错误，你将闪烁的刀刃深深刺入玛莱的胸膛。剑身颤抖，产生了明显的初始反应，但女神抗拒着死亡。你硬下心肠，将刀刃刺得更深，伤口处喷射出缕缕青烟。在刀刃的威力下，玛莱痛苦地尖叫，火焰最终从她的胸膛喷发而出。树皮发出爆裂声，她的触手开始萎缩死亡。堕落的女神不复存在了。");
            }
            else if(get_player().get_weapon() == get_weapons().L_WHIP)
            {
               outputText("[pg]用你的地狱长鞭抽打倒下的女神，你觉得这是一种非常适合解决她的方式。虽然莉希丝花了几十年时间密谋破坏玛莱，但你才是她真正应该害怕的人。现在，用莉希丝自己的武器，是你抽打并把这位植物女神烧成灰烬。虽然玛莱在如此野蛮的虐待下忍不住呻吟，但火焰确实开始蔓延。也许她喜欢这样死去。");
            }
            else if(get_player().hasStatusEffect(StatusEffects.KnowsWhitefire) || get_player().hasPerk(PerkLib.FireLord) || get_player().hasPerk(PerkLib.Hellfire))
            {
               outputText("[pg]召唤出你的火焰，你终结了玛莱，将这个被污染的神明从这个世界上抹去。火焰肆虐，女神尖叫着，她的触手在烈火中萎缩，树皮发出爆裂声。");
            }
            else if(get_player().get_weapon().isFist())
            {
               if(get_silly())
               {
                  outputText("[pg]你释放出一连串的拳打脚踢，对女神进行了几秒钟的狂轰滥炸。完成后，你指着她宣布她已经死了。");
                  outputText("[pg][say:什——什么！？]她惊呼道。片刻之后，曾经是玛莱的那整棵树爆炸成无数小碎片。");
               }
               else
               {
                  outputText("[pg]趁她如此虚弱，你现在是完成任务的最佳时机。你将你的[weapon]刺入女神的胸膛，用尽全力击碎她邪恶的核心。木头碎裂、剥落，直到你触及内部的柔软。感觉像果肉一样。玛莱因重伤而痛苦地退缩和摇晃。她的触手颤抖并枯萎，你花了相当长的时间试图在她没有反应时肢解她。你不完全确定这是否足够，所以你擦了擦额头，赶紧把破碎的女神点燃。生火对你这样的人来说算不了什么，而且为了确保这个恶魔必死无疑，这相当有必要。");
               }
            }
            else if(get_player().get_weapon().isAxe())
            {
               outputText("[pg]以英格纳姆市民准备过冬的质朴方式，你举起斧头开始砍树。当你的[weapon]第一击落下时，玛莱痛苦地尖叫，接着是第二击，第三击。试图砍倒一个神确实有点累人，但你不能说这真的让你感到惊讶。在劈开她的木头之后，你擦了擦额头，赶紧把她点燃。生火对你这样的人来说算不了什么，而且为了确保这个恶魔必死无疑，这相当有必要。");
            }
            else
            {
               outputText("[pg]由于玛莱现在非常虚弱，你开始收集你能找到的最干燥的植物材料，在女神周围生火。她试图对你咆哮抗议，但你用[weapon]迅速击中她的脸，让她安静下来。现在被压制了，她除了燃烧什么也做不了。这是你所知道的唯一能真正确保她毁灭的方法。你再多弄点引火物，很快，火就烧起来了。");
            }
            if(!get_player().hasKeyItem("Marae\'s Lethicite"))
            {
               outputText("[pg]在离残骸不远的地方，一块巨大的水晶吸引了你的目光。当意识到这是什么时，你的[eyes]睁大了。[b: 这是玛莱的莱希石！]");
               get_player().createKeyItem("Marae\'s Lethicite",3,0,0,0);
            }
            outputText("[pg]在对残骸进行了更长时间的检查后，你看到了一些奇怪的东西。有一堆完好无损的树皮碎片。它们看起来又大又厚，足以加工。你试探性地弯曲它，摆弄它以评估它的特性，发现它非常坚固。也许有人能把它做成盔甲？然而，上面还附着着触手，而且还活着。你不确定你是否想要里面有触手的盔甲。");
            outputText("[pg][b: (获得关键物品：触手树皮岩甲！)]");
            get_player().createKeyItem("Tentacled Bark Plates",0,0,0,0);
            outputText("[pg]随着阻挡你船只的触手消失，你上了船，驶回岸边，回到你的营地。");
            awardAchievement("弑神者",124,true,true);
            FlagDict_Impl_.arrayWriteInt(KFLAGS.flags,2002,1);
            get_player().upgradeBeautifulSword();
            get_combat().cleanupAfterCombat();
            doNext(get_camp().returnToCampUseOneHour);
         }
         else
         {
            if(get_monster().get_HP() <= 0)
            {
               outputText("玛莱因你对她造成的难以置信的伤害而退缩。");
            }
            else
            {
               outputText("玛莱明显表现出她极度发情的迹象，并向后退缩。");
            }
            outputText("[pg][say:你已经证明了自己是一位不可思议的战士，勇者，]玛莱说，[say:我必须承认，你配得上一个伟大的恩赐。]");
            outputText("[pg]这位神明脱落了一层树皮，一片接一片。[say:拿着这些，随你怎么用。我的树皮强大而神圣，只赐予那些我认为值得的人。在这样一场战斗之后，我需要长时间的休息。再见，]玛莱平静地微笑着说。");
            outputText("[pg]你捡起树皮并仔细检查。对于树皮来说，它异常坚固。你为此感谢玛莱，上了船，渡回岸边。");
            outputText("[pg][b: (获得关键物品：神圣树皮岩甲！)]");
            get_player().upgradeBeautifulSword();
            get_player().createKeyItem("Divine Bark Plates",0,0,0,0);
            awardAchievement("弑神者",124,true,true);
            FlagDict_Impl_.arrayWriteInt(KFLAGS.flags,2176,2);
            get_combat().cleanupAfterCombat();
         }
      }
      
      public function timeChangeLarge() : Boolean
      {
         return false;
      }
      
      public function timeChange() : Boolean
      {
         var _loc1_:* = null as IMap;
         if(get_game().time.hours > 23)
         {
            if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,100) > 0)
            {
               if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,598) == 0)
               {
                  if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,596) < 4 && FlagDict_Impl_.arrayReadInt(KFLAGS.flags,597) < 1000)
                  {
                     _loc1_ = KFLAGS.flags;
                     FlagDict_Impl_.arrayWriteInt(_loc1_,597,FlagDict_Impl_.arrayReadInt(_loc1_,597) + 1);
                  }
               }
            }
            if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,1108) == 1)
            {
               FlagDict_Impl_.arrayWriteInt(KFLAGS.flags,1108,0);
            }
         }
         return false;
      }
      
      public function talkToMaraeAboutMinervaPurification() : void
      {
         spriteSelect(SpriteDb.get_s_marae());
         outputText("当你踏上船，驶向湖泊深处时，你集中精力试图找到玛莱。她可能是治愈米内瓦的最好机会。谢天谢地，运气不错，你很快就发现自己停靠在自然女神居住的树木繁茂的岛屿上。为了回应你的出现，玛莱亲自从植被中现身，关切地看着你。");
         outputText("[pg][say: 你回到了我的岛上，勇者？什么风把你吹来了？有什么烦心事吗？]神明温柔地问你。");
         outputText("[pg]你做出了你觉得最合适的尊敬手势，向她解释了米内瓦和她的情况，并详细说明你来这里是想问玛莱是否能帮你治愈她。");
         outputText("[pg]听到这里，玛莱的表情沉了下来。[say: 对不起，勇者，但我无法满足你的要求。]当你追问原因时，她很快解释道。[say: 不是我不感激或不愿意，而是我无能为力。虽然你阻止了恶魔工厂对我的灵魂的攻击，但我的力量仍然比以前大大减弱。我怕我帮不了她……]玛莱突然停了下来，若有所思，然后给了你一个专注的表情。[say: 再给我解释一下，你说你的朋友一直住的那个废墟？]她要求道。");
         outputText("[pg]你满脸困惑地重复了一遍你的描述，看着玛莱的脸庞亮了起来，感到有些好笑。[say: 我都不敢奢望……一个枢纽！一个未被污染的枢纽，恶魔还没有发现它！是的，我可以帮助你的朋友，而且你们俩也能同时帮助我！]她高兴地宣布。[say: 你朋友的家是一个枢纽，一个神圣能量汇聚的地方。如果我能将自己与它连接，我就能增强自己的力量，并帮助治愈她。]她集中精神，双手微微分开，一道奇异的绿光开始在双掌间凝聚。光芒越来越强，直到你不得不移开视线，遮住眼睛。当光芒褪去，你终于可以直视而不被闪瞎时，你看到一颗散发着柔和光芒的种子静静地躺在她的手中。[say: 拿着这颗种子，勇者，把它种在你所说的那个泉水旁的肥沃土壤里。只要你这么做，我就能帮助你的朋友克服她的痛苦。]");
         outputText("[pg]你感谢玛莱的帮助，并小心翼翼地接过了那颗发光的种子。将它安全地收进你的随身物品后，你回到了船上，然后返回了营地。");
         get_player().createKeyItem("Marae\'s Seed",0,0,0,0);
         FlagDict_Impl_.arrayWriteInt(KFLAGS.flags,2087,3);
         FlagDict_Impl_.arrayWriteInt(KFLAGS.flags,2088,2);
         doNext(get_camp().returnToCampUseOneHour);
      }
      
      public function saveToObject() : Object
      {
         return saveContent;
      }
      
      public function runFromPervertedGoddess() : void
      {
         clearOutput();
         outputText("你转身跑向船，把堕落的女神抛在脑后。当你划船离开岛屿时，尖锐的笑声似乎在追赶你。");
         doNext(get_camp().returnToCampUseOneHour);
      }
      
      public function reset() : void
      {
         saveContent.feraMet = false;
      }
      
      public function promptFightMarae(param1:Function) : void
      {
         clearOutput();
         outputText("你确定要和玛莱战斗吗？她是玛瑞斯的生命女神。这将是一场极其艰难的战斗。");
         doYesNo(initiateFightMarae,param1);
      }
      
      public function onAscend(param1:Boolean) : void
      {
         reset();
      }
      
      public function maraeStealLethicite(param1:Boolean = false) : void
      {
         spriteSelect(SpriteDb.get_s_marae());
         clearOutput();
         if((get_player().get_spe() > 35 && Utils.rand(get_player().get_spe() / 3 + 30) > 20 || get_player().get_spe() > 35 && get_player().hasPerk(PerkLib.Evade) && Utils.rand(3) < 2) && !param1)
         {
            outputText("你向侧面猛冲，一个翻滚来到了树后。你避开了树枝上垂下的抓取触手的攻击，双手抓起那颗巨大的宝石，向海滩跑去。你没有听到追赶的声音，只听到一声失望的叹息。");
            get_player().createKeyItem("Marae\'s Lethicite",3,0,0,0);
            doNext(get_camp().returnToCampUseOneHour);
         }
         else
         {
            get_player().slimeFeed();
            get_player().orgasm("Generic");
            if(!param1)
            {
               outputText("你向侧面猛冲，顺势翻滚，来到了树后。你试图躲过那些抓取触手的攻击，但失败了，被绊倒并像落入蛛网的苍蝇一样被缠住。你被拉起并举到树的另一侧，重重地撞在树干上。触手将你的四肢拉开，让你完全暴露，并把你固定成大字型。当玛莱摆脱了树的束缚，大步走来时，你畏缩了。[pg]");
            }
            else
            {
               outputText("一个恶作剧的念头闪过，你决定捉弄一下这位堕落的女神。你向侧面猛冲，顺势翻滚，来到了树后，目标直指她的莱希石。你试图让你的抢劫企图看起来很逼真，并且成功了；也许太成功了。你被她真实的敌意反应打了个措手不及，像落入蛛网的苍蝇一样被几根触手缠住。你被拉起并举到树的另一侧，重重地撞在树干上。触手将你的四肢拉开，让你完全暴露，并把你固定成大字型。当玛莱摆脱了树的束缚，大步走来时，你畏缩了。这绝对是个坏主意。[pg]");
            }
            outputText("[say:啊，你真是个讨厌又狡猾的小[boy]。你把我变成了一个热辣性感的尤物，然后居然有胆量来这里，试图拿走我的莱希石，而且完全不操我？啧啧啧，]她责骂道，[say:我很欣赏你的野心，但我不能就这么让一个凡人骑到我头上。这个我收下了，]她说着，抓起水晶，把它拖到你身下的树旁。她深情地抚摸着木质表面，一个树结扩张开来，形成了一个足以容纳莱希石的洞。玛莱把它塞了进去，像抚摸宠物一样抚摸着木头，哼着歌，直到树皮闭合，将水晶完全隐藏起来。[pg]");
            outputText("[say:现在，这应该能保护它免受像你这样敏捷的小玩具的侵害了。你的尝试很大胆，我尊重这一点；主动性应该得到奖励。所以我就这么放你走，]她说着，打了个响指以示强调。[pg]");
            outputText("触手将你放到地上，但并没有松开它们紧紧的拥抱。[pg]");
            outputText("玛莱走近，手指在你的大腿上轻柔地游走，[say:不过，你离开时会带走一点额外的东西。来自新任丰饶女神的礼物……][pg]");
            if(get_player().get_gender() == 1 || get_player().get_gender() == 3 && Utils.rand(2) == 1)
            {
               outputText("她满怀期待地伸出一只手，全神贯注地看着一根触手从树上降落到她的掌心。她扭动着性感的臀部走上前，剥开触手的外层。它张开，露出一个湿润、黏糊糊的嘴。她咯咯笑着，将开口撞向你的");
               if(int(get_player().cocks.length) > 1)
               {
                  outputText("最大的");
               }
               outputText(get_player().cockDescript(0));
               outputText("的顶端。立刻，一股强大的吸力将你的[cock]吸入触手巨口中，将你一直埋到根部，让你在蠕动的快感中无法自拔。玛莱看着植物开始工作，挑逗地挤压着，直到你高潮。这根天赋异禀的触手只用了片刻就达到了目的。你的精液对这只植物野兽来说是一顿美味的款待，它吸了又吸，直到你的身体感到空虚和枯竭。[pg]");
               outputText("[say:哦，那可不行，]玛莱低语着，捧起你的");
               if(get_player().balls > 0)
               {
                  outputText(get_player().ballsDescriptLight());
               }
               else if(int(get_player().vaginas.length) > 0)
               {
                  outputText(get_player().vaginaDescript(0));
               }
               else
               {
                  outputText("胯部");
               }
               outputText("，[say:你会成为我最珍贵的种马。]她锋利的指甲尖压在你的会阴上，划破了皮肤。[say:只需要做一个小小的改变，]女神呼出一口气。当感觉她的指甲刺穿你，深入你肉体几英寸时，你的胯部根部爆发出一阵剧痛。当它触及你体内敏感的部位时，你在痛苦中挣扎。你因为疼痛和看着自己的血顺着她的手臂流下的震惊而晕了过去。[pg]");
               outputText("你感到温暖，被舒适和快感包围。这是天堂吗？不，你的头在抽痛，你的眼睛闭着……你睁开眼睛，发现自己仍然躺在树根处。那根贪婪的触手仍然锁在你的[cock]上，将它固定在高潮的阵痛中。你看着浓稠的精液团顺着触手泵出，这证明了你排出了真正海量的液体。它持续不断，你意识到这种快感应该会让你发疯。[pg]");
               outputText("玛莱走进你的视野，将触手拔出。你的[cock]可怜地抽搐着，在你的肚子上喷出几股巨大的精液，随着刺激的消失，你的高潮也随之萎缩消亡。[pg]");
               outputText("[say:抱歉让你受苦了，我必须调整你的身体，让你成为一个真正的种马。你现在可以走了，种马。我想那些怪物现在应该要担心你了，不然她们都会变成滴着淫液的骚穴和肿胀的肚子，]玛莱道歉说。她转过身去，回到她树木触手的怀抱中，沉溺于淫乱之中。你踉踉跄跄地上了船，划船离开，完全没有注意到你的" + get_player().multiCockDescript() + "滴下的先列腺液。");
               if(!get_player().hasPerk(PerkLib.MaraesGiftStud))
               {
                  outputText("[pg]<b>(获得新特权：玛莱的礼物——种马)</b>");
                  get_player().createPerk(PerkLib.MaraesGiftStud,0,0,0,0);
               }
               doNext(get_camp().returnToCampUseTwoHours);
            }
            else
            {
               outputText("她满怀期待地伸出一只手，全神贯注地看着一根触手从树上降落到她的掌心。她空出的手迅速一划，切开了你的[armor]，露出了你的");
               if(get_player().get_gender() == 0)
               {
                  outputText("无毛的胯部。她将触手向后拉了一会儿，举起空出的手。当她指向你的腹股沟时，它开始发光闪烁。你的胯部爆发出一阵温暖，一道蠕动的湿润裂口张开——<b>你的新阴道</b>。");
                  get_player().createVagina();
               }
               else
               {
                  outputText(get_player().vaginaDescript(0) + "。");
               }
               outputText("她引导着触手向前，让它刷过你的下体嘴唇。在没有女主人任何指导的情况下，球状的植物器官将自己埋入你的体内，轻松滑入，直到它用力顶住你的子宫。一股液体的喷射让你的肠道痉挛，迫使你的子宫颈扩张。它毫不耽搁，流入你毫无防备的子宫。一旦它到达你子宫的后部，浓稠的凸起开始顺着触手暴露的部分滑下。当它们穿过你的嘴唇并在你的通道中向上移动时，它将你撑得很大，几乎到了痛苦的地步。它们开始在你的小穴中爆炸，一个接一个，精液炸弹在你的子宫中爆裂，将你填满到边缘。你的肚子肿胀起来，让你看起来像个孕妇。完成了它肮脏的工作，植物肉棒拔出，留下你肿胀的阴唇微微张开。一小股浓稠的绿色物质慢慢滑出。");
               get_player().cuntChange(20,true,true,false);
               if(!get_player().hasPerk(PerkLib.MaraesGiftFertility))
               {
                  outputText("[pg]<b>(获得新特权：玛莱的礼物——丰饶)</b>");
                  get_player().createPerk(PerkLib.MaraesGiftFertility,0,0,0,0);
               }
               outputText("[pg]玛莱眨了眨眼，[say: 抱歉让你看起来像怀孕了一样，亲爱的，这是过程的一部分。所有那些晃荡的种子都会流入你娇嫩的凡人卵巢，并重塑它们。你会变得非常容易受孕，只要看一眼硬挺的鸡巴就能让你怀上！][pg]");
               outputText("她看着你惊恐的表情咯咯笑了起来，[say: 不，不是字面意思，但让你当妈妈也不需要费多大劲，而且你会发现孕期会……短得多。现在赶紧离开这里，趁我还没改变主意，让你在余生中都处于高潮状态。][pg]");
               outputText("你从树上掉了下来，别无选择，只能摇摇晃晃地走向你的船，尽力遮掩你那被侵犯过的" + get_player().vaginaDescript(0) + "。");
               doNext(get_camp().returnToCampUseOneHour);
            }
         }
      }
      
      public function maraeBadEnd() : void
      {
         var _loc1_:int = 0;
         spriteSelect(SpriteDb.get_s_marae());
         clearOutput();
         get_images().showImage("marae-bad-end");
         if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,2016) <= 0)
         {
            outputText("女神从树里流出，作为一个活生生的女人从树里走出来，曲线优美，一丝不挂。[pg]");
         }
         outputText("她向你走来，双乳如钟摆般晃动，滴落着树液。你被她摇曳的双峰迷住了，直到她给你一个巨大的拥抱，将你揉进她的胸膛。一只手顺着你的胸膛滑向你的腹股沟");
         if(get_player().get_gender() == 0)
         {
            outputText("，在那里它因一时的困惑而停顿了一下");
         }
         outputText("。她咯咯地笑着，把你的脸按在她那翠绿的乳头上。你张开嘴接纳那紫绿色的蓓蕾，舔舐吮吸着，鼓励她甜美的树液流入你饥渴的口中。她喷涌出汁液，将你紧紧拉向她的乳房，用柔软的肉体挤压着你。[pg]");
         outputText("你体内的树液让你的喉咙和肚子感到温暖的刺痛，就像喝了一杯烈酒。她的乳汁树液流得太快，你不得不大口吞咽才能跟上。当你努力吞下这被污染的美味时，偶尔会打几个小嗝。你感到快乐和安全，依偎在一位欲望女神的怀抱中。");
         if(get_game().marbleScene.get_knowAddiction() > 0)
         {
            outputText("任何喝玛布尔奶水的想法或需求都从你的身心消失了。");
         }
         outputText("一种朦胧的快感似乎飘入你的脑海，让你除了吸干眼前的乳头外，很难思考任何事情。你感觉到最后几滴溅在你的舌头上，然后一股不自然的力量打破了密封，将你拉开，并强行将一个滴着汁液的新乳房塞进你的嘴唇。[pg]");
         if(int(get_player().cocks.length) == 0)
         {
            outputText("你的腹股沟处产生了一种越来越强烈的压迫感，使你的胯部肌肉凸起。你没有理会它，而是专注于从女神的乳房中吸吮更多甜美的液体。你中段的温暖感觉就像是滴入了那个新的凸起，让它因敏感而刺痛。你没有理会它，而是用舌头舔过你嘴里滑溜溜的乳头，作为回报，你又得到了一股温暖的糖浆状汁液。你的脑海中充满了无法穿透的欲望迷雾，用夹杂着动物欲望的原始性爱思想克服了任何逻辑。你再次被那股邪恶的力量拉了回来，挣扎着想在那个乳头上舔最后一下。你的[legs]和[hips]因欲望而颤抖，被甜蜜的欲望逼疯了。玛莱伸手去捧你的腹股沟，用强烈的感官刺激让你眼花缭乱。她引导你的目光向下，看向从你饥渴的腹股沟处长出的一个新附肢——<b>一根触手阴茎</b>！它来回摇摆，盘绕在自己身上，像蛇一样品尝着空气。[pg]");
            get_player().createCock();
            get_player().cocks[0].cockLength = 36;
            get_player().cocks[0].cockThickness = 2;
            get_player().cocks[0].set_cockType(CockTypesEnum.TENTACLE);
         }
         else
         {
            outputText("你大口大口地喝着，用瞬间上瘾产生的力量吸吮着她浓稠的糖浆状乳汁。想要获得更多她的“乳汁”的欲望压倒了任何其他想法，像浓密的晨雾一样笼罩着它们。当你把它们美味的货物一点不剩地吸进你贪婪的食道时，光滑的乳头感觉就像在你的嘴里紧绷和蠕动。你的[hips]抽搐和蠕动，悸动和坚硬，让你的" + get_player().multiCockDescriptLight() + "在空中上下摆动。不顾你腹股沟不断的乞求，你像对待你的整个世界一样对待你嘴里的乳头，试图在吸吮的同时获得尽可能多的快感。你能感觉到你的[cocks]在空中蠕动，仿佛在向她伸出。等等，蠕动！？你被从她的乳头上拉开，并有机会低头看，在那里");
            if(get_player().countCocksOfType(CockTypesEnum.TENTACLE) < get_player().cockTotal())
            {
               if(int(get_player().cocks.length) == 1)
               {
                  get_player().cocks[0].set_cockType(CockTypesEnum.TENTACLE);
               }
               if(get_player().cockTotal() > 1)
               {
                  _loc1_ = int(get_player().cocks.length);
                  while(_loc1_ > 0)
                  {
                     _loc1_--;
                     get_player().cocks[_loc1_].set_cockType(CockTypesEnum.TENTACLE);
                  }
               }
            }
            outputText("<b>你看到你的[cocks]在四处挥舞，寻找附近的孔洞来操！</b>[pg]");
         }
         outputText("[say:美味，]玛莱低语道，把你扔到她的树上，自信地走上前，[say:没有什么比把蠕动的触手埋进某个又热又湿的婊子的小穴和屁眼感觉更好了。]她向你招手，开始向你走来。你的身体不由自主地靠近，仿佛她在你的腹股沟里埋了一个钩子，把你从树上拉开，拉向她饥渴的花朵。当她靠近几英尺时，你的" + get_player().multiCockDescript() + "分裂成十几个不同的附肢，每一个都在空中挥舞着淫荡的意图。在你反应过来之前，它们向前猛冲，紧紧地缠住她的手臂和腿，把她拉到两根中央触手上。几秒钟内，你的主触手阴茎就埋到了她的子宫颈，粗暴地压在她的内部开口上，同时它像一条被困在她小穴里的蛇一样蠕动。次要的阴茎藤蔓轻松地穿透了她的屁股，当润滑剂在粗暴的穿透周围飞溅时，它感到刺痛。[pg]");
         outputText("你已经完全搞不清状况了。你靠在一棵树上，而你的胯部正强行双管齐下，同时操弄着女神的两个洞。你浑身充满了温暖和情欲，根本无力反抗，只能瘫倒在地，享受这一切。玛莱像发情的母狗一样哭喊呻吟，显然很享受这两根蠕动的触手对她的蹂躏。树液从她的乳头渗出，几根闲置的触手立刻缠了上去，它们的尖端变成了扭曲的嘴唇。你可以用你的触手<b>尝到</b>那味道……你脑海中的迷雾越来越浓，你不假思索地又将一根触手挤进了她的屁股。又一根触手从你胯部的触手丛中爆发出来，吸附在女神的阴蒂上，让她陷入了近乎持续不断的高潮之中。她的高潮伴随着剧烈的肌肉收缩，榨取着你的肉棒，甚至成功地将埋在她体内的那根肉棒拉过了她的子宫颈，进入了她的子宫。这感觉太强烈了，你开始射精，在强烈的快感中失去了意识。[pg]");
         outputText("<b>一段时间过去了……</b>[pg]");
         outputText("你仍然在岛上，玛莱被你称之为肉棒的两根蠕动的怪物刺穿。你已经好几天没有拔出来了，但你为什么要拔出来呢？你们的身体简直是天作之合，一堆蠕动的肉块，上面的洞像沙漠吸水一样吸吮着你的精液，而你这个曾经的英雄，现在活着就是为了满足[his]那团沸腾的触手。你们俩就像同一块拼图的两半，锁在一起，进行着无休止的狂欢。你深情地回忆起，看着曾经是你灵魂的闪亮液体从她花瓣湿润的褶皱中滴落，结晶成一块比玛莱自己的小得多的石头。");
         if(get_game().marbleScene.marbleFollower())
         {
            outputText("[pg]在岸边，玛布尔望着湖面，想知道她所爱的人到底发生了什么事。");
         }
         get_game().gameOver();
      }
      
      public function loseAgainstMarae() : void
      {
         clearOutput();
         if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,2024) == 2)
         {
            if(get_player().get_HP() <= 0)
            {
               outputText("你倒下了，虚弱得无法继续战斗。你知道你的旅程即将结束。");
            }
            else
            {
               outputText("你继续战斗的欲望被压倒性的情欲所扼杀，你倒下了。你知道你的旅程即将结束。");
            }
            doNext(maraeBadEnd);
         }
         else
         {
            if(get_player().get_HP() <= 0)
            {
               outputText("你倒下了，虚弱得无法继续战斗。[say: 休息一下吧，勇者，]玛莱说道。你终于失去了意识。[pg]当你醒来时，你发现自己回到了营地。");
            }
            else
            {
               outputText("你继续战斗的欲望被压倒性的情欲所扼杀，你倒下了。[say: 控制你的冲动，休息一下吧，勇者，]玛莱说道。你终于在情欲中失去了意识。[pg]当你醒来时，你发现自己回到了营地。");
            }
            get_combat().cleanupAfterCombat();
         }
      }
      
      public function load(param1:int, param2:*) : void
      {
         Utils.extend(saveContent,param2);
      }
      
      public function level3MaraeEncounter() : void
      {
         var cancelFunction:Function;
         var _g:MaraeScene;
         clearOutput();
         outputText("你再次靠近堕落女神居住的岛屿，踏上了这座岛。[say: 还想再来点吗？]玛莱娇嗔道。");
         outputText("[pg](你是要和玛莱战斗，还是留下来放弃你的任务？或者如果你想的话也可以离开。)");
         menu();
         _g = this;
         cancelFunction = level3MaraeEncounter;
         addButton(0,"战斗",function():void
         {
            _g.promptFightMarae(cancelFunction);
         }).hint("与堕落女神玛莱战斗！");
         addButton(1,"留下来",maraeBadEnd).hint("留在玛莱身边，结束你的冒险？");
         setExitButton();
      }
      
      public function level2MaraeEncounter() : void
      {
         var cancelFunction1:Function;
         var _g1:MaraeScene;
         var cancelFunction:Function;
         var _g:MaraeScene;
         spriteSelect(SpriteDb.get_s_marae());
         FlagDict_Impl_.arrayWriteInt(KFLAGS.flags,100,1);
         clearOutput();
         get_images().showImage("marae-second-encounter");
         outputText("在湖上划船时");
         if(get_player().get_str() > 70)
         {
            outputText("轻松地");
         }
         outputText("，湖中心出现了一个熟悉的岛屿。岛上有一棵熟悉的树，尽管在天空映衬下扭动的触手轮廓残酷地提醒着你，这个岛屿将不再是曾经那个宁静的避风港。");
         if(get_player().cor < 33)
         {
            outputText("深知前方等待着怎样的恐怖");
         }
         else if(get_player().cor < 66)
         {
            outputText("深知前方潜伏着怎样的性爱冒险");
         }
         else
         {
            outputText("担心过度享受岛上的乐趣");
         }
         outputText("，你将船桨浸入水中，猛地调转船头。有什么东西“砰”地一声撞到了船底，让木头颤抖起来，促使你更加用力地划船。你疯狂地划动，搅动着湖水，但岛屿似乎并没有离你远去。由于毫无进展而感到沮丧，你恐惧地从旧船体边缘探出头去。[say: 好吧，这就解释得通了，]你嘀咕道。[pg]");
         outputText("蠕动的树根爬满了船底。它们钻进每一个缝隙和裂缝，将船只紧紧地固定在原地。正当你开始考虑游向岸边时，船身一晃，");
         if(get_player().get_spe() < 50)
         {
            outputText("让你一屁股摔在地上");
         }
         else
         {
            outputText("差点让你一屁股摔在地上，好在你稳住了身子坐了下来");
         }
         outputText("。这艘旧小艇以惊人的速度破水而行，在身后留下了高达一英尺的波浪。玛莱的岛屿随着时间的推移越来越大，似乎在嘲笑你无法逃脱。现在，像树根一样的藤蔓已经爬上了船舷，它们向你蠕动着，似乎在警告你。现在下水绝对不是个好主意。沙子摩擦木头的刺耳声音在你的耳边响起。你到了。逃避不可避免的事情是没有意义的。你整理好你的[armor]");
         if(!get_player().get_weapon().isUnarmed())
         {
            outputText("，调整好你的[weapon]，");
         }
         outputText("走出小船，踏上环绕岛屿的小沙滩。把你拖上岸的触手已经不见了，留下了这艘饱经风霜的船只，它完好无损，或者说尽可能地完好无损。抬头望去，你看到了从岛屿顶点长出的那棵巨大的恶魔之树。它没有叶子，只有一些像乳头一样的突起从一些“树枝”上长出来，实际上这些“树枝”更像是触手而不是植物。这团蠕动的性爱灌木丛不断地运动着，它们交织的触手偶尔会膨胀和弯曲，互相喷射出浓稠的、像精液一样的汁液。[pg]");
         outputText("你带着不情愿的决心走向那场扭曲的树木狂欢。玛莱希望你来这里，如果不和这位沉醉于性爱的女神打交道，就没有退路。她那悠长、慵懒的呻吟声让你很容易找到她。这位神志不清的神明的手臂缠绕在她的树根中，而一根带有绿色花纹的触手则潜入她那泥泞不堪的、布满花瓣的性器官入口。她听到你的脚步声，向后伸长脖子问道，");
         if(get_player().hasKeyItem("Marae\'s Lethicite"))
         {
            outputText("[say: 欢迎回来，小偷。什么样的" + get_player().mf("绅士","女士") + "在被提供性爱后还会洗劫神明的灵魂？说实话，那才是——哦，对，就是那里——真正的堕落。]");
         }
         else if(get_player().hasPerk(PerkLib.MaraesGiftStud) || get_player().hasPerk(PerkLib.MaraesGiftFertility))
         {
            outputText("[say: 嘿，[name]。我没想到这么快就能再次抓住你。你喜欢我的礼物吗？这里没有人和我玩，我一直觉得有点孤独。]");
         }
         else
         {
            outputText("[say: 哎呀，看看是谁回来了！我以为你太害怕享受美好时光，不敢来这里和可怜的玛莱做爱呢。如果你太害怕不敢来这里，我本来打算让你划走的。不，现在连回头看都别想，我已经改变主意了。]");
         }
         outputText("[pg]");
         outputText("女神那充满情欲的双眼中，毫无特征的白色虹膜正死死地盯着你。她命令道：[saystart]过来。是时候接受");
         if(get_player().hasPerk(PerkLib.MaraesGiftFertility) || get_player().hasPerk(PerkLib.MaraesGiftStud))
         {
            outputText("第二次");
         }
         outputText("玛莱温柔的爱抚了。[sayend][pg]");
         doNext(playerMenu);
         if(!get_player().canFly())
         {
            outputText("你无路可逃！如果你愿意，你可以尝试和她战斗，但你真的要这么做吗？");
            doNext(MaraeIIStageII);
            _g = this;
            cancelFunction = level2MaraeEncounter;
            addButton(3,"战斗！",function():void
            {
               _g.promptFightMarae(cancelFunction);
            });
         }
         else
         {
            outputText("你觉得她没有算到你有翅膀。如果你试着飞走，你可能很快就能逃出她触手的攻击范围。");
            menu();
            addButton(0,"留下",MaraeIIStageII);
            _g1 = this;
            cancelFunction1 = level2MaraeEncounter;
            addButton(3,"战斗！",function():void
            {
               _g1.promptFightMarae(cancelFunction1);
            });
            addButton(4,"飞走",MaraeIIFlyAway);
         }
      }
      
      public function initiateFightMarae() : void
      {
         clearOutput();
         if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,100) == 2)
         {
            outputText("你终于下定决心，她必须为强行塞给你她的“礼物”付出代价。[pg]");
         }
         if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,2024) == 2)
         {
            outputText("你准备好你的[weapon]并摆出战斗姿态！[say: 真遗憾。你面对的可是女神，]她娇嗔道。");
            outputText("[pg]触手伸上来固定住你的船，让你无法逃脱。");
         }
         else
         {
            outputText("玛莱微笑着看着你。[say: 准备好！我可不会手下留情！]");
         }
         outputText("[pg]战斗开始了！");
         startCombat(new Marae(),true);
      }
      
      public function grabHerBoob() : void
      {
         clearOutput();
         outputText("你伸手想去摸一把。女神的眼睛因愤怒而睁大，一根巨大的树枝挥下，击中了你的胸骨。它打得你很重，你落在了船上，向后漂了几英尺到了水里。除了离开，希望下次还有机会摸她的乳房，别无他法……");
         get_player().takeDamage(get_player().get_HP() - 1);
         doNext(get_camp().returnToCampUseOneHour);
      }
      
      public function get_encounterObject() : Encounter
      {
         var _gthis:MaraeScene = this;
         if(encounterObject != null)
         {
            return encounterObject;
         }
         encounterObject = Encounters.group("marae",EncounterOrDef_Impl_.fromDef(new EncounterDef("default",null,EncounterChance_Impl_.fromBoolFun(function():Boolean
         {
            if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,2018) <= 0)
            {
               return FlagDict_Impl_.arrayReadInt(KFLAGS.flags,2016) <= 0;
            }
            return false;
         }),OneOf_Impl_.fromA(encounterMarae),null)),EncounterOrDef_Impl_.fromDef(new EncounterDef("feraMeeting",null,EncounterChance_Impl_.fromBoolFun(function():Boolean
         {
            if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,2002) > 0 && (FlagDict_Impl_.arrayReadInt(KFLAGS.flags,2715) & _gthis.get_game().forest.akbalScene.AKBAL_QUEST_DONE) > 0)
            {
               return !_gthis.saveContent.feraMet;
            }
            return false;
         }),OneOf_Impl_.fromA(feraMeeting),null)),EncounterOrDef_Impl_.fromDef(new EncounterDef("aboutMinerva",null,EncounterChance_Impl_.fromBoolFun(function():Boolean
         {
            if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,2024) == 1 && FlagDict_Impl_.arrayReadInt(KFLAGS.flags,2018) >= 1)
            {
               return FlagDict_Impl_.arrayReadInt(KFLAGS.flags,2088) == 1;
            }
            return false;
         }),OneOf_Impl_.fromA(talkToMaraeAboutMinervaPurification),null)),EncounterOrDef_Impl_.fromDef(new EncounterDef("endgamePure",null,EncounterChance_Impl_.fromBoolFun(function():Boolean
         {
            if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,2024) == 1 && FlagDict_Impl_.arrayReadInt(KFLAGS.flags,2018) >= 1 && FlagDict_Impl_.arrayReadInt(KFLAGS.flags,2088) != 1 && FlagDict_Impl_.arrayReadInt(KFLAGS.flags,1272) > 0 && FlagDict_Impl_.arrayReadInt(KFLAGS.flags,2176) < 2)
            {
               return _gthis.softLevelMin(30);
            }
            return false;
         }),OneOf_Impl_.fromA(encounterPureMaraeEndgame),null)),EncounterOrDef_Impl_.fromDef(new EncounterDef("level2",null,EncounterChance_Impl_.fromBoolFun(function():Boolean
         {
            if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,100) == 0 && FlagDict_Impl_.arrayReadInt(KFLAGS.flags,2016) > 0 && _gthis.get_player().get_gender() > 0)
            {
               return FlagDict_Impl_.arrayReadInt(KFLAGS.flags,2002) <= 0;
            }
            return false;
         }),OneOf_Impl_.fromA(level2MaraeEncounter),null)),EncounterOrDef_Impl_.fromDef(new EncounterDef("level3",null,EncounterChance_Impl_.fromBoolFun(function():Boolean
         {
            if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,100) == 2 && FlagDict_Impl_.arrayReadInt(KFLAGS.flags,2016) > 0 && _gthis.get_player().get_gender() > 0)
            {
               return FlagDict_Impl_.arrayReadInt(KFLAGS.flags,2002) <= 0;
            }
            return false;
         }),OneOf_Impl_.fromA(level3MaraeEncounter),null)));
         return encounterObject;
      }
      
      public function get_debugName() : String
      {
         return "Marae";
      }
      
      public function get_debugHint() : String
      {
         return "";
      }
      
      public function feraMeetingTalk() : void
      {
         clearOutput();
         outputText("你向女神表达了哀悼之情，你知道这对她来说绝不是一个轻松的时刻。");
         outputText("[pg][say:这不能怪你，勇者，]菲拉叹了口气。[say:她已经被自己的所作所为扭曲得病态不堪了。就算你没来，她也迟早会屈服于那毒素。]");
         outputText("[pg]你走到女神身边，低头看着那棵树破裂敞开的树干。看来她不知用什么方法挖开了树心，一直向下钻到了底部的树根处。这种庄严肃穆的气氛与你平时和她相处时的感觉截然不同，让你觉得没什么好说的。");
         outputText("[pg]翠绿的藤蔓在菲拉的手臂上发芽，很快，一朵美丽的白色花朵从她手背的静脉中绽放出来。她将手悬在坟墓上方，紧握拳头，直到开始流血，红宝石般的鲜血滴入下方的洞中。");
         outputText("[pg]菲拉收回手，手上的花朵装饰像出现时一样迅速枯萎。[say:我不会让同样的命运降临在我的身上。]");
         outputText("[pg]女神转身离开，走向海岸准备离开这座岛屿。你短暂地逗留了一会儿，但也很快跟了上去。在玛莱的坟墓里，有一株白色的小芽，在" + (get_time().hours > 20 ? "月" : "日") + "光下闪闪发光。");
         doNext(get_camp().returnToCampUseOneHour);
      }
      
      public function feraMeetingLeave() : void
      {
         outputText("[pg]最好还是让女神一个人静一静。此刻，她不再是自然界残酷掠夺的化身，也许只是一个为失去妹妹而悲伤的女人。无论如何，你都不会去打扰她。菲拉也许能得到她的平静。");
         doNext(get_camp().returnToCampUseOneHour);
      }
      
      public function feraMeeting2() : void
      {
         clearOutput();
         outputText("你看到了玛莱之树被亵渎的躯壳。一个纯白色的女人站在它前面，赤身裸体，只被她长长的橙色头发遮掩。她已经察觉到了你的存在，转过头来，用她那锐利的红眼睛看着你。");
         outputText("[pg][say:勇者，]菲拉说道，[say:我允许你来这里，只是为了履行我不对你使用毒素的承诺。请你放尊重点。]");
         outputText("[pg]捕食女神再次转过身，盯着她姐姐的躯壳。岛上非常安静，只有微风轻轻吹过草地和花朵，现在更明显地看出这是菲拉的杰作，而不是玛莱的。");
         menu();
         addNextButton("交谈",feraMeetingTalk);
         addNextButton("离开",feraMeetingLeave);
      }
      
      public function feraMeeting() : void
      {
         clearOutput();
         outputText("再次划过水面，你发现了一些令人担忧的事情。在湖中心，在那位死去女神的岛屿上，出现了一片新生的植被。长长的波浪状草丛和鲜艳的橙色万寿菊蔓延开来，而你原本以为这里会变得和曾经居住在此的神明一样死寂。想到被腐化的玛莱可能回归，你的心跳不禁加速。如果她真的复活了，必须在她恢复足够的力量向你全面复仇之前，迅速采取行动。");
         outputText("[pg]从船上下来，再次踏上这座熟悉的岛屿，你观察着周围的情况。空气中弥漫着紧张的气氛，但似乎还伴随着其他东西。你闻到了一股气味，宁静却又邪恶，弥漫在整个岛屿上。你赶紧去调查玛莱的遗骸。");
         saveContent.feraMet = true;
         doNext(feraMeeting2);
      }
      
      public function encounterPureMaraeEndgame() : void
      {
         spriteSelect(SpriteDb.get_s_marae());
         clearOutput();
         outputText("当你踏上小船，驶向湖心深处时，你集中精神试图寻找玛莱。毕竟，你需要一个像样的挑战。幸运的是，好运眷顾了你，你很快就靠岸了，来到了这位自然女神居住的植被茂密的岛屿。感应到你的到来，玛莱本人从植被中现身，关切地看着你。");
         if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,2176) == 0)
         {
            outputText("[pg][say: 是什么风把你吹来了，勇者？]女神温柔地问你。");
            outputText("[pg]你告诉玛莱，你正在寻找挑战。");
            outputText("[pg][say: 很好，我认为你有资格与我一战。如果你能击败我，你将获得丰厚的奖励，]她说道。");
         }
         else
         {
            outputText("[pg][say: 你准备好迎接挑战了吗，勇者？]神明温柔地问你。");
         }
         FlagDict_Impl_.arrayWriteInt(KFLAGS.flags,2176,1);
         menu();
         addButton(0,"放马过来！",initiateFightMarae).hint("挑战玛莱。这将是一场极其艰难的Boss战！[pg]推荐等级：30+");
         addButton(1,"还没准备好！",get_camp().returnToCampUseOneHour);
      }
      
      public function encounterMarae() : void
      {
         var cancelFunction1:Function;
         var _g3:MaraeScene;
         var cancelFunction:Function;
         var _g2:MaraeScene;
         var deliberate:Boolean;
         var _g1:MaraeScene;
         var _g:MaraeScene;
         spriteSelect(SpriteDb.get_s_marae());
         get_images().showImage("marae-first-encounter");
         if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,2024) <= 0)
         {
            if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,2015) <= 0)
            {
               outputText("那就像一颗深藏不露的绿宝石——远处浮现出一座小岛的轮廓。你估摸着自己大概就在这片湖的中心附近。还真是够巧的。你划近了些，迫不及待想下船舒展一下你的[legs]。划艇搁浅在岛上潮湿的泥土里，彻底停了下来。你爬出船外，打量了一番——这小岛不过是个隆起的土草丘，顶端孤零零地立着一棵小树。");
               FlagDict_Impl_.arrayWriteInt(KFLAGS.flags,2015,1);
               outputText("你走近那棵树，发现它的树干光滑得不可思议。每一片叶子都透着异样的生命力，绿得鲜活，翠得逼人。你忍不住伸手抚上树皮，绕着它缓步走了一圈——树干上竟没有任何节疤，也没有一丝杂色。就在你绕完一整圈的时候，你惊讶地看到，一个女人的形影正从木质中缓缓浮出。她的脸从树干里分离出来，几缕绿色的短发被拖曳着甩在身后。当她睁开双眼——露出那双明晃晃的翡翠色虹膜时——你吓得猛地一颤。[pg]");
               if(get_player().isPureEnough(66))
               {
                  FlagDict_Impl_.arrayWriteInt(KFLAGS.flags,2017,1);
                  outputText("[say:你似乎对我感到很惊讶，勇者。我想这也是难免的。你并非来自我们的土地玛瑞斯，而我现在的样子也与过去大相径庭，]树说道。[pg]");
                  outputText("你后退了一步，惊讶于能发现这样一个显然未被腐化的生物。");
                  if(get_player().isCorruptEnough(80 - get_player().get_lib100()))
                  {
                     outputText("你的目光忍不住落在这位树女那形状优美的乳房上，你好奇它们摸起来是像奶子还是像木头。");
                  }
                  outputText("你感到有些困惑，或者只是出于好奇，你介绍了自己，并问她是谁。[pg]");
                  outputText("[say:我？]她回答道，[say:我是生命女神玛莱。我就是玛瑞斯，因为我的根系触及它的每一个角落。或者说，在<b>他们</b>到来之前，我是。][pg]");
                  outputText("如果让你猜的话，你觉得她指的是恶魔。[pg]");
                  outputText("她点了点头，继续说道，[say:那些恶魔，曾是一群受魔法赐福的人类，居于群山之中。他们拥有过世人梦寐以求的一切：安宁、爱，还有改写现实的力量。] 玛瑞忆起往事，轻轻叹了口气。[say:但人类这种东西，从来就不知道满足。他们渴望更多，便开始用魔法改造自己的身躯，妄图登峰造极。久而久之，便走火入魔了。我当时没有管束他们，以为这帮家伙犯蠢，顶多也就是祸害他们自己。][pg]");
                  outputText("然而，故事若是到此为止，你也就不会站在这儿了。[pg]女神阖上双眼，神色抑郁而凄然。[say:没错，是我错了。我那时一心只顾着消弭饥荒、维系其他种族之间的和平，却没能注意到，那些人类已经把自己扭曲成了别的东西——某种邪恶的、恶魔般的存在。他们抛弃了自己的灵魂，将其结晶，化为一种魔法能量源。当然，光是消耗自己灵魂的力量，他们怎么可能满足？他们还要更多。他们永远都要更多。][pg]");
                  outputText("你点了点头表示理解，全神贯注地聆听着这位树之女神讲述这个王国是如何一步步堕落到如此地步。[say:他们像潮水一样从山里涌出来，四处屠戮，蚕食村庄。我借给许多族群力量，但他们谁都没有独自抵抗的本事，却又因为彼此间的种族积怨，谁也不愿联手。于是，他们全都被吞噬，被奴役，或是被腐化。我的人民与我隔绝开来，要么是因为他们被污染后思想扭曲了，要么就是恶魔的阴谋诡计得逞了。我设法藏匿了几处地方，避开了敌人的眼线，但我不知道还能撑多久。][pg]");
                  outputText("她沉重地叹息着，你注意到她那树皮般的乳头硬挺了起来。她的眉头拧起一丝近似于忧虑的神色，继续说道，[say:他们知道我的存在。我的力量原本让他们远离湖岸，但他们现在想腐化我——让我变得跟他们一样。他们用魔法和工业遮暗了云层，污染了湖水，用他们那污秽的性液浇灌我的根系、淹没我的感知。到如今……都多少年了，我最远的那些枝干一直浸泡在他们肮脏的精液里。我的力量虽然强大，可我……我没办法永远抵抗下去。我能触及的范围，已经萎缩到只剩这片湖了。我的一部分身躯已经失守，周围的生命也随之消殒。我不知道自己还能坚持多久……就连眼下，那种想要放纵沉沦的欲望，也在噬咬着我的内心。][pg]");
                  outputText("玛瑞颤抖着，几乎是在乞求，[say:求你了，勇士，你一定要帮帮我。那些恶魔在山脚下建了一座工厂。用来侵蚀我的大部分污液，就是那里生产的。如果你能想办法把它毁掉，我……乃至整个玛瑞斯，或许还有一线生机。][pg]");
                  outputText("说到底，这本就是你被送到这里来的使命。尽管你起初并不知道玛瑞的苦境，但你的任务如今已与她自己的抗争重合在了一起。她肃然下令道，[say:现在，动身吧。你留在这里，什么也得不到。等你真的关掉了那个污秽之地，再回来见我。][pg]");
                  if(get_player().isCorruptEnough(80 - get_player().lib))
                  {
                     outputText("你可以离开，但抚摸她乳房的欲望却挥之不去。你该怎么做？");
                     menu();
                     addButton(0,"摸奶",grabHerBoob);
                     setExitButton();
                  }
                  else
                  {
                     doNext(get_camp().returnToCampUseOneHour);
                  }
                  return;
               }
               outputText("女人吼道，[say:滚开，恶魔。你正踏在诅咒的悬崖上。]树的眼睛闪烁着，你发现自己正在划回营地。强迫感及时消失了，让你想知道那个树女到底是什么！");
               doNext(get_camp().returnToCampUseOneHour);
            }
            else
            {
               outputText("你划着船穿过水面，开始靠近女神的岛屿。[if (" + Std.string(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,2024) == 2) + ") {当你凝视着这片土地时，一种不安的感觉流遍全身，但你发现自己已经被冲上了岸边|玛莱那赋予生命的宁静光环已经可以感受到，她岛屿的祥和吸引着你}]。你向着最高处走去。[pg]");
               outputText("女神从树皮中流淌而出，仿佛那是由液体构成的一般；和以前一样，她显现为一个女人的上半身，腰部以上赤裸，背部与树干融为一体。[pg]");
               if(!get_player().isPureEnough(66))
               {
                  outputText("她愤怒地咆哮着，[say:我告诉过你，滚开！]");
                  outputText("[pg]你转身逃回船上，知道自己无法直接与她的力量抗衡。");
                  doNext(get_camp().returnToCampUseOneHour);
               }
               else if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,2017) >= 1)
               {
                  outputText("[say:亲爱的孩子，你为什么回来？你必须摧毁那座恶魔工厂！]玛莱提醒你。[say:它位于山脚下。求求你，我不知道我还能抵抗多久。]");
                  doNext(get_camp().returnToCampUseOneHour);
               }
               else
               {
                  FlagDict_Impl_.arrayWriteInt(KFLAGS.flags,2017,1);
                  outputText("[say:你似乎对我感到很惊讶，勇者。我想这也是难免的。你并非来自我们的土地玛瑞斯，而我现在的样子也与过去大相径庭，]树说道。[pg]");
                  outputText("你后退了一步，惊讶于能发现这样一个显然未被腐化的生物。");
                  if(get_player().isCorruptEnough(80 - get_player().get_lib100()))
                  {
                     outputText("你的目光忍不住落在这位树女那形状优美的乳房上，你好奇它们摸起来是像奶子还是像木头。");
                  }
                  outputText("你感到有些困惑，或者只是出于好奇，你介绍了自己，并问她是谁。[pg]");
                  outputText("[say:我？]她回答道，[say:我是生命女神玛莱。我就是玛瑞斯，因为我的根系触及它的每一个角落。或者说，在<b>他们</b>到来之前，我是。][pg]");
                  outputText("如果让你猜的话，你觉得她指的是恶魔。[pg]");
                  outputText("她点了点头，继续说道，[say:那些恶魔，曾是一群受魔法赐福的人类，居于群山之中。他们拥有过世人梦寐以求的一切：安宁、爱，还有改写现实的力量。] 玛瑞忆起往事，轻轻叹了口气。[say:但人类这种东西，从来就不知道满足。他们渴望更多，便开始用魔法改造自己的身躯，妄图登峰造极。久而久之，便走火入魔了。我当时没有管束他们，以为这帮家伙犯蠢，顶多也就是祸害他们自己。][pg]");
                  outputText("然而，故事若是到此为止，你也就不会站在这儿了。[pg]女神阖上双眼，神色抑郁而凄然。[say:没错，是我错了。我那时一心只顾着消弭饥荒、维系其他种族之间的和平，却没能注意到，那些人类已经把自己扭曲成了别的东西——某种邪恶的、恶魔般的存在。他们抛弃了自己的灵魂，将其结晶，化为一种魔法能量源。当然，光是消耗自己灵魂的力量，他们怎么可能满足？他们还要更多。他们永远都要更多。][pg]");
                  outputText("你点了点头表示理解，全神贯注地聆听着这位树之女神讲述这个王国是如何一步步堕落到如此地步。[say:他们像潮水一样从山里涌出来，四处屠戮，蚕食村庄。我借给许多族群力量，但他们谁都没有独自抵抗的本事，却又因为彼此间的种族积怨，谁也不愿联手。于是，他们全都被吞噬，被奴役，或是被腐化。我的人民与我隔绝开来，要么是因为他们被污染后思想扭曲了，要么就是恶魔的阴谋诡计得逞了。我设法藏匿了几处地方，避开了敌人的眼线，但我不知道还能撑多久。][pg]");
                  outputText("她沉重地叹息着，你注意到她那树皮般的乳头硬挺了起来。她的眉头拧起一丝近似于忧虑的神色，继续说道，[say:他们知道我的存在。我的力量原本让他们远离湖岸，但他们现在想腐化我——让我变得跟他们一样。他们用魔法和工业遮暗了云层，污染了湖水，用他们那污秽的性液浇灌我的根系、淹没我的感知。到如今……都多少年了，我最远的那些枝干一直浸泡在他们肮脏的精液里。我的力量虽然强大，可我……我没办法永远抵抗下去。我能触及的范围，已经萎缩到只剩这片湖了。我的一部分身躯已经失守，周围的生命也随之消殒。我不知道自己还能坚持多久……就连眼下，那种想要放纵沉沦的欲望，也在噬咬着我的内心。][pg]");
                  outputText("玛瑞颤抖着，几乎是在乞求，[say:求你了，勇士，你一定要帮帮我。那些恶魔在山脚下建了一座工厂。用来侵蚀我的大部分污液，就是那里生产的。如果你能想办法把它毁掉，我……乃至整个玛瑞斯，或许还有一线生机。][pg]");
                  outputText("说到底，这本就是你被送到这里来的使命。尽管你起初并不知道玛瑞的苦境，但你的任务如今已与她自己的抗争重合在了一起。她肃然下令道，[say:现在，动身吧。你留在这里，什么也得不到。等你真的关掉了那个污秽之地，再回来见我。][pg]");
                  if(get_player().isCorruptEnough(80 - get_player().lib))
                  {
                     outputText("你可以离开，但抚摸她乳房的欲望却挥之不去。你该怎么做？");
                     menu();
                     addButton(0,"摸奶",grabHerBoob);
                     addButton(14,"离开",get_camp().returnToCampUseOneHour);
                  }
                  else
                  {
                     doNext(get_camp().returnToCampUseOneHour);
                  }
               }
            }
         }
         else if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,2024) == 1)
         {
            outputText("玛莱对你灿烂一笑，从树里走了出来。这位轻盈的植物女神给了你一个温暖的拥抱，并在你的脸颊上亲吻了一下。[pg]");
            outputText("[say:谢谢你，]她说着，松开拥抱，转身回到树前，[say:攻击已经减弱，我觉得自己恢复了许多。让我感谢你的英雄壮举。][pg]");
            outputText("她把手伸进树里，掏出一颗小珍珠。[say:这是来自湖底深处的珍珠，注入了我的纯洁。如果你吃下它，它将赐予你我的力量，帮助你抵抗这片土地上的欲望和腐化。][pg]");
            outputText("玛莱把珍珠塞进你的手里，温柔地合上你的手指。[say:现在去吧，还有很多事情要做。如果运气好的话，我们不会再需要彼此了，]女神命令道，然后滑回了她的树里。");
            get_inventory().takeItem(get_consumables().P_PEARL,get_camp().returnToCampUseOneHour);
            FlagDict_Impl_.arrayWriteInt(KFLAGS.flags,2018,1);
         }
         else
         {
            clearOutput();
            outputText("你走近玛莱的树，注意到树皮光滑闪亮，仿佛湿润了一般。女神的身躯已经暴露在外，她从树干里探出身子，向你飞吻。她的乳房看起来比你们第一次见面时丰满了许多，随着她的每一个动作诱人地摇晃着。[pg]");
            if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,2016) <= 0)
            {
               FlagDict_Impl_.arrayWriteInt(KFLAGS.flags,2016,1);
               outputText("她用性感的眼神看着你，示意你靠近。[say:你喜欢现在的我吗？我几乎无法理解我一开始为什么要抗拒这个，]堕落的女神沉思着。[say:你关闭了工厂。我能在地下感觉到它，我非常高兴——然后我意识到你是<b>如何</b>关闭工厂的，当巨大的洪流开始渗入我的根部时，我的感官超载了……]扭曲的女神紧张起来。[say:我非常害怕，感觉到那种腐化通过地面流入我体内。然后是愤怒。我向自己保证，如果你敢露面，我一定会杀了你。][pg]");
               outputText("她的身体放松下来。[say:但是后来那种温暖开始流入我体内，它融化了我的愤怒和决心，]她解释道，从树干里探出更多身子。你看着一朵小小的紫色花蕾在她的肚脐下方绽放，就在她与树的连接处上方。花瓣展开成一个非常熟悉的形状，看起来更像是一个阴道而不是一朵花。玛莱伸出手，用手指拂过它，发出愉悦的咕哝声。你抬头看着她的眼睛，她几乎在发光——她知道你在看哪里。[pg]");
               outputText("[say:我不介意，我希望你看着，]她说着，开始认真地自慰。花蜜从花朵上滴落，同时她谈论着自己的堕落。[say:我忍不住，就像欲望填满了我，直到没有空间容纳其他任何东西。我开始抚摸我的乳房，感觉到它们变得沉重，同时我挑逗和捏着我的乳头。我一定保持那个状态将近一个小时。然后，哦，我不得不给自己一个火热的小蜜穴。屈服的感觉太好了。我明白恶魔为什么要这么做了。这不是邪恶，他们只是想分享这种……这种快乐，与每个人和每件事。][pg]");
               outputText("你被迷住了，看着她把越来越多的手指塞进她饥渴的花穴里。[say:从那以后，我一直在吸收更多的腐化，等待有人来这里帮我填满。我玩弄我的花朵，感觉就像过了好几天。每次我高潮都越来越强烈。我越是放纵，感觉就越好。你知道我还做了什么吗？我让我的树枝长出触手，同时操我的嘴和阴户。我一次又一次地高潮，然后我让我的根系吸收所有能找到的精液来填满我的子宫。][pg]");
               outputText("你对她所经历的变化感到不寒而栗，你自己也变得有些兴奋。想到一个曾经贞洁的女神沦落为一个发情的荡妇，让你怀疑自己是否还有获胜的机会。玛莱继续她的表演。[say:太棒了。来加入我吧。我已经屈服于这种快乐了。如果你看我身后，你可以看到我灵魂的残骸。每次我高潮时，我都能感觉到它从我的小穴里滴出来一点点。过了一会儿，它流到一起，开始结晶。我想恶魔称之为莱希石，我只希望我能重新来过。来操我吧，我想看着你发疯，看着你射出你的灵魂。][pg]");
               outputText("这听起来是一个非常诱人的提议，但这将意味着完全放弃你来这里的理由。如果你跑的话，你可能会逃脱，她看起来并没有那么强大。或者，你可以冒险在逃跑前尝试偷走莱希石，但离得那么近，她很容易就能抓住你。");
               menu();
               addButton(0,"逃跑",runFromPervertedGoddess);
               _g = this;
               addButton(1,"莱希石",function():void
               {
                  _g.maraeStealLethicite();
               });
               addButton(2,"接受",maraeBadEnd);
               _g1 = this;
               deliberate = true;
               addButton(3,"恶作剧",function():void
               {
                  _g1.maraeStealLethicite(deliberate);
               }).hint("对堕落的女神搞个恶作剧，假装偷走她的莱希石。话说你为什么要这么做？","恶作剧");
               _g2 = this;
               cancelFunction = encounterMarae;
               addButton(4,"战斗！",function():void
               {
                  _g2.promptFightMarae(cancelFunction);
               });
            }
            else
            {
               outputText("玛莱微笑着向前倾身，双手托住乳房。令人惊讶的是，她从树中流出，作为一个自由的女人站在你面前。她揉捏着G罩杯的乳房，淫荡地眨着眼，捏着闪亮的紫红色乳头，挤出几滴蜂蜜色的树液。她向你飞吻，同时腹股沟处的花朵热情地绽放。她呻吟着，[say: 重新考虑一下我的提议吧，[name]？我不会强迫你，但你难道不想和一位活生生的女神在天堂共度永恒吗？]");
               doYesNo(maraeBadEnd,runFromPervertedGoddess);
               _g3 = this;
               cancelFunction1 = encounterMarae;
               addButton(3,"战斗！",function():void
               {
                  _g3.promptFightMarae(cancelFunction1);
               });
            }
         }
      }
      
      public function debugMenu(param1:Boolean = true) : void
      {
         get_game().debugMenu.debugCompEdit(saveContent,new SaveContent(null));
      }
      
      public function MaraePt2RoundIIIPrizes() : void
      {
         spriteSelect(SpriteDb.get_s_marae());
         clearOutput();
         if(get_player().get_gender() == 1)
         {
            outputText("你在一次强烈的高潮中醒来。精液从[eachcock]中沸腾而出，泵入紧致、吸吮的触手洞里。你睁大眼睛，头脑清醒过来，在极乐中摇晃着臀部。你被倒挂在触手树上！玛莱离你不远，她正忙着深喉你见过的最粗的触手，而另外两根触手正在抽插她的洞口。她转向你，意识到你醒了，并移除了口中的入侵者，尽管它还是不服气地在她脸上喷了一层精液。女神得意地笑了笑，拍了拍它，在说话前责骂了它一番，");
            if(get_player().hasPerk(PerkLib.MaraesGiftStud))
            {
               outputText("[say: 嗯，我看到我的礼物对你来说很管用，不是吗？太棒了。那是一个不完整的女神给的不完整的礼物，但现在我又抓到你了，我能把它修好。你积攒精液的速度会是以前的三倍，再也不用等上好几天才能为外面那些饥渴的女孩们积攒一大泡精液了！]");
            }
            else
            {
               outputText("[say: 你可能会觉得有点酸痛。我做了一些工作，确保你会成为我完美的种马。你不会再射出一点点精液了！你会喷出足够让任何人怀孕的量，我甚至还改良了你的精液，让它能穿透大多数避孕措施。我是不是最棒的？]");
            }
            outputText("她的话语被停顿打断，因为她要舔掉粘液并吞下去，但依然完全可以听懂。在她说话的整个过程中，你都被困在高潮中，被她的树以不假思索的强度榨取着。[pg]");
            outputText("你气喘吁吁，向玛莱点头致谢，她的触手将你放回你的装备旁。它们把你放在颤抖的[feet]上，然后缓慢地松开，在离开时抚摸着你的身体。它们一定很喜欢你。你匆忙穿好衣服，但玛莱和那棵树都不再理会你了。船就在不远处，当你爬上船时，女神向你道别，[say: 感谢你的拜访，并给我的树提供了这么多的精液！等它的果实成熟了，我可能会去你的营地种一棵！再见，别忘了让所有最漂亮的女孩怀孕！][pg]");
            if(get_player().hasPerk(PerkLib.MaraesGiftStud) && !get_player().hasPerk(PerkLib.MaraesGiftProfractory))
            {
               outputText("[pg]<b>(获得新特权：玛莱的礼物——直肠工厂)</b>");
               get_player().createPerk(PerkLib.MaraesGiftProfractory,0,0,0,0);
            }
            else if(!get_player().hasPerk(PerkLib.MaraesGiftStud))
            {
               outputText("[pg]<b>(获得新特权：玛莱的礼物——种马)</b>");
               get_player().createPerk(PerkLib.MaraesGiftStud,0,0,0,0);
            }
         }
         else if(get_player().get_gender() == 2)
         {
            outputText("你在强烈的性高潮中醒来。精液正泵入你紧缩的产道，你能感觉到它正蠕动着进入你过度充盈的子宫。随着快感让你完全清醒，你的眼睛睁得更大了。你被倒挂在触手树上！玛莱离你不远，她正忙着深喉你见过的最粗的触手，而另一对触手正在操弄她的其他小穴。她转向你，意识到你醒了，便移除了口中的入侵者，尽管它还是不甘示弱地在她脸上喷了一层精液。女神得意地笑了笑，拍了拍它，责骂了它几句，然后开口说道，");
            if(get_player().hasPerk(PerkLib.MaraesGiftFertility))
            {
               outputText("[say: 怎么样，喜欢做我的王牌繁育者吗？你的子宫真是一件艺术品。相信我，我重塑了它。我本来还不知道该怎么改进它，所以我决定看看你的另一个洞。它有点干，我不想让那些长着多根鸡巴的家伙去操这么干涩、不舒服的屁眼。所以现在它又湿又润，正适合他们！][pg]");
               outputText("你震惊地睁大了眼睛。你喘息着说，[say: 你做了什么！？][pg]");
               outputText("[say: 我只是让你的屁眼对所有要操你的男孩们更友好一点。我的意思是，一旦你的小穴被填满，他们就需要找个别的地方插进去，对吧？如果说有什么的话，蜂女们应该会感激这个。我知道她们很变态，喜欢用那边，]玛莱确认道。");
            }
            else
            {
               outputText("[say: 你可能会觉得有点酸痛。我给你的小子宫做了个改造，以确保你能为外面的所有男孩们保持良好的生育能力。你会很好地为我服务的。有那么多人死于对抗恶魔的战斗，而你将从每一个靠近你小产道的鸡巴那里生下孩子。]");
            }
            outputText("在她说话的整个过程中，你都陷入了高潮，被她的树以一种不假思索的强度操弄着。[pg]");
            outputText("你气喘吁吁，困惑地向玛莱点了点头，她的触手将你放回你的装备旁。它们把你放在颤抖的[feet]上，然后缓慢地松开，在离开时抚摸着你的身体。它们一定很喜欢你。你匆忙穿好衣服，但玛莱和那棵树都不再理会你了。船就在不远处，当你爬上船时，女神向你道别，[say: 感谢你的拜访，并让我的小盆友尝试你的小穴！等我让它开花，我可能会去你的营地为你种一棵！再见，别忘了生很多宝宝！][pg]");
            if(get_player().hasPerk(PerkLib.MaraesGiftFertility) && !get_player().hasPerk(PerkLib.MaraesGiftButtslut))
            {
               outputText("[pg]<b>(获得新特权：玛莱的礼物——屁眼荡妇)</b>");
               get_player().createPerk(PerkLib.MaraesGiftButtslut,0,0,0,0);
               get_player().ass.analWetness = 2;
            }
            else if(!get_player().hasPerk(PerkLib.MaraesGiftFertility))
            {
               outputText("[pg]<b>(获得新特权：玛莱的礼物——丰饶)</b>");
               get_player().createPerk(PerkLib.MaraesGiftFertility,0,0,0,0);
            }
         }
         else
         {
            outputText("你在强烈的性高潮中醒来。精液从[eachcock]中喷涌而出，泵入紧致、吮吸的触手洞中。植物的汁液正泵入你紧缩的产道，你能感觉到它正蠕动着进入你过度充盈的子宫。你的眼睛睁得更大了，当你沉浸在极乐中摇摆臀部时，你的头脑也清醒了过来。你被倒挂在触手树上！玛莱离你不远，她正忙着深喉你见过的最粗的触手，而另一对触手正在操弄她的其他小穴。她转向你，意识到你醒了，便移除了口中的入侵者，尽管它还是不甘示弱地在她脸上喷了一层精液。女神得意地笑了笑，拍了拍它，责骂了它几句，然后开口说道，");
            if(!get_player().hasPerk(PerkLib.MaraesGiftFertility) && !get_player().hasPerk(PerkLib.MaraesGiftStud))
            {
               if(Utils.rand(2) == 0 && !get_player().hasPerk(PerkLib.MaraesGiftFertility))
               {
                  outputText("[say: 你可能会觉得有点酸痛。我给你的小子宫做了个改造，以确保你能为外面的所有男孩们保持良好的生育能力。你会很好地为我服务的。有那么多人死于对抗恶魔的战斗，而你将从每一个靠近你小产道的鸡巴那里生下孩子。]");
                  get_player().createPerk(PerkLib.MaraesGiftFertility,0,0,0,0);
               }
               else if(!get_player().hasPerk(PerkLib.MaraesGiftStud))
               {
                  outputText("[say: 你可能会觉得有点酸痛。我做了一些工作，以确保你能成为我完美的种马。你不会再有少量的射精了！你会喷出足够让任何人怀孕的量，我甚至修饰了你的种子，让它能穿透大多数避孕药具。我是不是最好了？]");
                  get_player().createPerk(PerkLib.MaraesGiftStud,0,0,0,0);
               }
               outputText("在她说话的整个过程中，你一直被困在高潮中，被她的树以一种不假思索的强度榨取着。[pg]");
               outputText("你气喘吁吁，向玛莱点头致谢，她的触手将你放回你的装备旁。它们把你放在颤抖的[feet]上，慢慢地松开，在离开时抚摸着你的身体。它们一定很喜欢你。你匆忙穿上衣服，但玛莱和那棵树都不再理会你了。船离得不远，当你爬上船时，女神大声向你道别：[say: 感谢你的拜访，并给了我的树这么多精液！等它的果实成熟了，我可能会去你的营地种一棵！再见，别忘了多做爱！][pg]");
               if(get_player().hasPerk(PerkLib.MaraesGiftFertility))
               {
                  outputText("[pg]<b>(获得新特权：玛莱的礼物——丰饶)</b>");
               }
               else if(get_player().hasPerk(PerkLib.MaraesGiftStud))
               {
                  outputText("[pg]<b>(获得新特权：玛莱的礼物——种马)</b>");
               }
            }
            else if(get_player().hasPerk(PerkLib.MaraesGiftFertility) && get_player().hasPerk(PerkLib.MaraesGiftStud))
            {
               if(get_player().hasPerk(PerkLib.MaraesGiftStud) && !get_player().hasPerk(PerkLib.MaraesGiftProfractory))
               {
                  outputText("[pg]<b>(获得新特权：玛莱的礼物——直肠工厂)</b>");
                  get_player().createPerk(PerkLib.MaraesGiftProfractory,0,0,0,0);
               }
               else if(get_player().hasPerk(PerkLib.MaraesGiftFertility) && !get_player().hasPerk(PerkLib.MaraesGiftButtslut))
               {
                  outputText("[pg]<b>(获得新特权：玛莱的礼物——屁眼荡妇)</b>");
                  get_player().createPerk(PerkLib.MaraesGiftButtslut,0,0,0,0);
               }
            }
            else if(get_player().hasPerk(PerkLib.MaraesGiftFertility))
            {
               outputText("[say: 真不敢相信我上次居然没想到这么做！我是说，我花了那么多时间把你变成一个超棒的生育机器，却没想过把你变成一匹种马！不过这次我补上了——你会喷出巨量的精液，保证能让外面那些漂亮女孩怀孕。它甚至能冲破大多数避孕草药的药效。我是不是很贴心？]");
               outputText("在她说话的整个过程中，你一直被困在高潮中，被她的树以一种不假思索的强度榨取着。[pg]");
               outputText("你气喘吁吁，向玛莱点头致谢，她的触手将你放回你的装备旁。它们把你放在颤抖的[feet]上，慢慢地松开，在离开时抚摸着你的身体。它们一定很喜欢你。你匆忙穿上衣服，但玛莱和那棵树都不再理会你了。船离得不远，当你爬上船时，女神大声向你道别：[say: 感谢你的拜访，并给了我的树这么多精液！等它的果实成熟了，我可能会去你的营地种一棵！再见，别忘了多做爱！][pg]");
               if(!get_player().hasPerk(PerkLib.MaraesGiftStud))
               {
                  get_player().createPerk(PerkLib.MaraesGiftStud,0,0,0,0);
                  outputText("[pg]<b>(获得新特权：玛莱的礼物——种马)</b>");
               }
            }
            else if(get_player().hasPerk(PerkLib.MaraesGiftStud))
            {
               outputText("[say: 真不敢相信我上次居然没想到这个！我把你变成了一匹这么棒的种马，却没想过让你在生孩子方面也一样出色！好吧，趁你睡觉的时候，我顺便把这个也补上了。你的子宫现在非常肥沃，你生孩子的速度会比以前快得多。我们很快就能让玛瑞斯重新繁荣起来！只要确保让女孩们怀孕，让男孩们操你的小穴，好吗？]");
               outputText("在她说话的整个过程中，你一直被困在高潮中，被她的树以一种不假思索的强度榨取着。[pg]");
               outputText("你气喘吁吁，向玛莱点头致谢，她的触手将你放回你的装备旁。它们把你放在颤抖的[feet]上，慢慢地松开，在离开时抚摸着你的身体。它们一定很喜欢你。你匆忙穿上衣服，但玛莱和那棵树都不再理会你了。船离得不远，当你爬上船时，女神大声向你道别：[say: 感谢你的拜访，并给了我的树这么多精液！等它的果实成熟了，我可能会去你的营地种一棵！再见，别忘了多做爱！][pg]");
               if(!get_player().hasPerk(PerkLib.MaraesGiftFertility))
               {
                  get_player().createPerk(PerkLib.MaraesGiftFertility,0,0,0,0);
                  outputText("[pg]<b>(获得新特权：玛莱的礼物——丰饶)</b>");
               }
            }
         }
         get_player().orgasm("All");
         doNext(get_camp().returnToCampUseTwoHours);
      }
      
      public function MaraeIIStageII() : void
      {
         spriteSelect(SpriteDb.get_s_marae());
         clearOutput();
         get_images().showImage("marae-second-encounter-pt-two");
         FlagDict_Impl_.arrayWriteInt(KFLAGS.flags,100,2);
         if(get_player().get_gender() == 2)
         {
            outputText("玛莱愉悦地咕哝着，让一根沾满花蜜的触手从她的花朵中滑出。她那甜美而堕落的气味在空气中弥漫，就像春风中夹杂的花粉。女神的手指勾勒着她那含苞待放的阴蒂的轮廓，你着迷地看着它肿胀并变成紫色。在顶端下方形成了一道清晰的隆起，勾勒出新长出的阴茎头部的下侧。玛莱眨着睫毛，抚摸着新长出的肉棒，看着它变得丰满，长度超过了任何凡人。冠部呈现出闪亮、几乎光滑的紫色，沿着茎状的肉棒越往下，颜色就越绿。她站起身来，指甲勾勒着她肉棒上新形成的尿道隆起，向你滑行过来。[pg]");
            outputText("你被");
            if(get_player().get_lust100() > 80)
            {
               outputText("欲望");
            }
            else if(get_player().cor > 50)
            {
               outputText("犹豫");
            }
            else
            {
               outputText("担忧");
            }
            outputText("麻痹了，你甚至没能后退一步，那温暖的隆起就已经在摩擦");
            if(get_player().get_tallness() > 48)
            {
               outputText("你的胯部");
            }
            else
            {
               outputText("你的肚子");
            }
            outputText("，她那滴着汁液的乳头紧紧地压在你身上。你的[nipples]在[armor]下不由自主地变硬了。玛莱心领神会地低头看了一眼，开始解开你的装备，带着几乎是无聊的轻蔑将它们扔到一边。她锋利的指甲划过你的腹部，在你的肚脐周围画圈，然后滑向两边抚摸你的[hips]。这突如其来的变化让你喘息着，紧贴着她摇晃，试图让她的指尖进入你的[legs]之间。女神笑着低语道：[say: 不，亲爱的，那是肉棒的工作。][pg]");
            outputText("你的心脏在胸腔里狂跳，女神的存在和完美、了然的触摸让你的[skindesc]泛起红晕。在这一点上，你根本无法抗拒她，即使你想抗拒。她光滑无瑕的手抓住你的肩膀，以一种温柔但坚定的压力向下压，不容任何抵抗。在玛莱的引导下，你的[legs]弯曲，让你摆出一个合适的、崇拜的姿势。一个困惑的、半成形的想法从你大脑中游荡的兴奋中挣扎出来，但你烦躁地摇了摇头，开始舔嘴唇，同时呆呆地看着玛莱骄傲的新肉棒。[pg]");
            outputText("玛莱用她纤细的手指穿过你的[hair]，把你的[face]拉得越来越近，直到你闻到她花蜜的香味，看清她那完美光滑的阴茎的每一个细节。女神命令道：[say: 像崇拜我一样崇拜它。]你点点头，当你倾身向前把她含在嘴里时，你感到异常顺从。一滴液体从顶端滚落，当你张开嘴包裹住这位突然变成双性人的女神的肉棒时，涂抹在你的下唇上。她的先列腺液很甜，虽然这并不让你感到惊讶，因为它来自花朵的一部分。它让你想起了一点蜂蜜，虽然还有一种你无法完全确定的暗流。[pg]");
            outputText("你前后晃动着脑袋，以一种不假思索、完美无瑕的精准度开始为这位丰饶女神口交。玛莱的手继续把玩着你的[hair]，当你一不小心用牙齿磕到她时，她猛地一扯，疼得你倒吸一口凉气。你顺从地呜咽着，更加卖力地吞吐，而你的女神则用一根触手探向你的下体作为奖励。圆润的尖端隔着你的[armor]蹭了蹭，但很快就调整角度滑了进去。它缠绕着你的身体，在你身上涂满滑腻的液体，一路向后摸索着你的" + get_player().vaginaDescript(0) + "。[pg]");
            outputText("触手在你的外阴上喷射出一些滑腻温暖的液体，然后向上拱起，进入你的体内。你喉咙里发出一声含糊不清的愉悦呻吟，震动着玛莱植物般的肉棒。她咕哝了一声，在你嘴里留下了一大滴花蜜，女神的阴道分泌物开始顺着她的大腿内侧流下。玛莱的臀部开始配合着那根正在钻入你" + get_player().vaginaDescript(0) + "的触手，有节奏地抽插着。");
            get_player().cuntChange(12,true,true,false);
            outputText("两者都湿漉漉的，喷射出微小的甜蜜快感，在麻痹你神经的同时，也加深了你对这位充满性欲的神明的崇拜。[pg]");
            outputText("玛莱闷哼一声，拉扯着");
            if(get_player().horns.value > 0)
            {
               outputText("你的角");
            }
            else
            {
               outputText("你的[hair]");
            }
            outputText("，将她粗大的阴蒂肉棒深深地塞进你的喉咙。你条件反射般地吞下那根胀大的肉棒，并");
            if(get_player().cor < 33)
            {
               outputText("挣扎着");
            }
            else if(get_player().cor < 66)
            {
               outputText("努力");
            }
            else
            {
               outputText("轻松地");
            }
            outputText("压抑着作呕的反射，因为她的肉棒在你嘴里变得越来越粗，开始将精液倾泻进你那放荡的喉咙里。在玛莱高潮时，那根滑腻的触手也开始超负荷运转，以一种极其狂热的姿态在你的" + get_player().vaginaDescript(0) + "里抽插。你的肚子咕噜作响，因为里面塞满了女神的精液，而你的小穴则紧紧夹住入侵者，同时将自己糖浆般的液体喷射进你的子宫。在欲望的冲击下，你因这双重的侵犯而高潮，在玛莱的肉棒上扭动着，任由她用花蜜将你填满。");
            outputText("[pg]女神发出一声满足的叹息，向后退去，将她的肉棒从你的喉咙里抽了出来，你那火热的口腔紧紧包裹着她抽搐的肉棒，让她不禁打了个寒颤。你用充满爱慕的眼神抬头看着她，感觉你的肠胃因为她注入的量而翻江倒海。玛莱揉了揉你的头发，突然抽回了触手，让你感到一阵空虚。你觉得有些困倦，闭上了眼睛，而你的女神则在一旁注视着你。一切都是那么完美……");
         }
         else if(get_player().get_gender() == 1)
         {
            outputText("玛莱发出愉悦的娇喘，任由一根沾满花蜜的触手从她的花朵中滑出。她那甜美而堕落的气息在空气中弥漫，就像春风中夹杂的花粉。你敬畏地看着这位曲线优美的女神向你走来，双手各捧着一根蠕动的树木触手。她右手里的那根抽搐着喷射出汁液，滴落在她的手上，这出人意料的虚弱表现似乎反而让这位充满欲望、被污染的神明更加兴奋。[pg]");
            outputText("你呆呆地站着，被");
            if(get_player().get_lust100() > 80)
            {
               outputText("欲望");
            }
            else if(get_player().cor > 50)
            {
               outputText("犹豫");
            }
            else
            {
               outputText("担忧");
            }
            outputText("麻痹了。在你的眼中，玛莱的靠近就像是一场不可阻挡的行军，还没等你反应过来，她就已经紧紧地抱住了你。她的舌头钻进你的嘴里，纠缠着你的舌头，用一种压倒性的、充满欲望的攻势瓦解了你的抵抗。当她松开你并向后退去时，你的视线模糊了片刻。面对这位向你招手的丰满裸体生育女神，你很难集中注意力。这让[eachcock]都努力地想要触碰她，但她却带着会意的微笑向后退去，说道，[say: 还没到时候，我急不可耐的小臣民。让我先帮你脱掉衣服，然后你就可以尽情崇拜我了。][pg]");
            outputText("藤蔓呼啸而出，滑入你的[armor]下，解开搭扣，将其褪去，直到你赤身裸体地暴露在玛莱面前。她得意地笑了笑，冲你勾了勾手指，做了一个“过来”的手势。你踉跄着向前走去，仿佛被一根无形的线牵引着，直到你站在离她只有几英寸远的地方，你的[cock]摩擦着她的肚子");
            if(get_player().cockTotal() == 2)
            {
               outputText("而你的另一根肉棒则在她的腿上晃荡");
            }
            else if(get_player().cockTotal() > 2)
            {
               outputText("而你的其他阴茎则垂在她的双腿之间");
            }
            outputText("。女神对你露出了一个残忍的微笑，仿佛她知道一些你不知道的事情，她命令道，[say: 用你的精液来崇拜我，勇者。屈服于你的女神，为她献出你那肥沃的种子。][pg]");
            outputText("玛莱伸出双臂，两条触手像蛇一样向前爬行，顺着她的附肢蠕动。你向前挺起胯部，将它展示给女神，你只在脑海中闪过一丝疑惑，随后便将这烦人、无用的念头抛之脑后。除了取悦眼前的活女神，还有什么重要的呢？她那堕落的气息在空气中飘荡，让你充满了屈服于女王并服从她每一个心愿的渴望。" + get_player().SMultiCockDesc() + " 抽搐着，开始滴下先列腺液，渴望满足你神明的欲望。[pg]");
            outputText("她右臂上的触手抽搐了一下，然后沿着四个关节裂开。顶端折叠打开，露出粉红色、蠕动着的内部，承诺着凡人无法理解的快感。与此同时，当你被这渴望的植物洞穴分散注意力时，另一条触手滑到你身后，爬上你的[leg]，在身后留下一道粘液的痕迹。它滑入你的臀沟，戳弄着你的[asshole]。你惊讶地向前猛地一缩，但玛莱将你的[hips]推了回去，让它能够钻进去。");
            get_player().buttChange(12,true,true,false);
            outputText("那个张开的植物洞穴趁你分心时扑向你的腹股沟，击中你的[cock]，并贪婪地“吸溜”一声将其吞没。");
            if(get_player().cockTotal() == 2)
            {
               outputText("另一根几乎与前者一模一样的藤蔓也从女神双腿之间蜿蜒而出，扑向你的" + get_player().cockDescript(1) + "。");
            }
            else if(get_player().cockTotal() > 2)
            {
               outputText("更多“张开”的藤蔓从玛莱的双腿间扭动着出来，跳到你的 " + Appearance.cockNoun(CockTypesEnum.HUMAN) + " 上。");
            }
            outputText("你咕哝着，挺动着臀部，不知羞耻地屈服于那紧绷、有质感的触手");
            if(get_player().cockTotal() > 1)
            {
               outputText("");
            }
            outputText("。精液从你的");
            if(get_player().balls == 0)
            {
               outputText("身体");
            }
            else
            {
               outputText("睾丸");
            }
            outputText("中沸腾而出，但很快就被玛莱那树木般的触手怪无声地吞噬了。");
            if(get_player().cumQ() > 500)
            {
               outputText("浓稠的精液甚至让藤蔓变形");
               if(get_player().cockTotal() > 1)
               {
                  outputText("");
               }
               outputText("，让你透过过度拉伸的触手管隐约看到一丝白色");
               if(get_player().cockTotal() > 1)
               {
                  outputText("");
               }
               outputText("。");
            }
            outputText("一股火热、湿滑的压力触碰到了你[asshole]里的某个东西，让你喷射得更加猛烈。玛莱的爪牙找到了你的前列腺！你咕哝着、呻吟着，但高潮似乎并没有停止。女神戏弄道，[say: 怎么？你不会真的以为我会让你射在我身上吧？][pg]");
            outputText("没关系，你正在给她她想要的。你一直射精，直到你的[legs]发软，你四仰八叉地躺在背上，[eachcock]都被那吸溜作响的阴道触手榨取着种子。每次你开始平息下来，你后门里的那个就会恰到好处地摩擦你，逼出另一发。玛莱跨过你的[face]蹲下，让你在射精的同时舔舐从她那敏感、花朵般的褶皱中滴落的花蜜。它甜美、浓烈，令人精神焕发。它让你很容易继续射精，但很难保持清醒，随着你因快感超载而昏过去，你的眼睛翻白了。");
         }
         else
         {
            outputText("玛莱发出愉悦的咕哝声，让一条沾满花蜜的触手从她的花朵中滑出。她那甜美、堕落的气味在空气中弥漫，就像春风中携带的花粉。你看着，屏住呼吸凝视着她走近，用一根手指以挑逗的方式在她的植物小穴入口处划过。琥珀色的液体顺着她的大腿流下，向你展示了她对性爱有多么渴望。你胯部的粘稠感加上[eachcock]的紧绷感让你很难集中注意力。你的身体对玛莱的反应让你很难集中注意力或思考，虽然你知道她自从堕落以来就极其危险，但你很难去在意。[pg]");
            outputText("女神以刻意缓慢、摇曳生姿的步伐靠近，这让你的[cock]颤抖，毫无疑问她就是生育女神。玛莱咯咯笑着，双臂环抱住你，在解开你的[armor]时，在你的嘴唇上印下了一个坚定、湿润的吻。你的装备伴随着沉闷的砰砰声落地，然后她紧绷的绿色乳头压在你的乳头上");
            if(get_player().hasFuckableNipples())
            {
               outputText("，轻松地滑入你那阴道般的乳头中。你因这意想不到的插入而在她耳边呻吟，并因[breasts]中刺痛的快感而颤抖。");
            }
            else
            {
               outputText("。");
            }
            outputText("你的心脏在胸腔里狂跳，当你的[cock]成功滑入玛莱的双腿之间时，你的心跳快得足以让全身泛红。它并没有插入，只是被夹在她那被体液润滑的大腿之间");
            if(get_player().cockTotal() == 2)
            {
               outputText("而你的另一根肉棒则在她的体表摩擦");
            }
            else if(get_player().cockTotal() > 2)
            {
               outputText("而你的其他肉棒则在她的体表摩擦");
            }
            outputText("。[pg]");
            outputText("你感到一阵眩晕，脑海中嗡嗡作响，渴望得到这位嗡嗡作响的女神更多的拥抱。想要跪在她面前膜拜她小穴的冲动震撼着你的内心，击碎了你最后一点微弱的抵抗。但在你这么做之前，玛莱抓住了你的下巴，命令道：[say: 不，我的孩子。你可以通过繁衍来更好地侍奉我。] 她的手指拨开她那如花般的小穴花瓣，继续说道：[say: 来吧，把它放进去。我会教你如何践行玛莱的新信仰。][pg]");
            outputText("你很容易就把她推倒在岛上柔软的草地上，她双腿分开，让你更容易进入。你的[cock]不需要任何指示，它滑入她那等待着的湿润之中，仿佛它就是为她而生的。");
            if(get_player().cocks[0].cockThickness > 5 || get_player().cockArea(0) > 100)
            {
               outputText("以你的尺寸，根本不可能插得进去，但她的身体甚至没有因为你的粗大而变形。也许她改变了你以适应她？你拔出来看了看，你的粗细似乎并没有改变。你摇了摇头，把这些不受欢迎的想法抛诸脑后，再次用力撞入她的体内。操她才是最重要的。");
            }
            else
            {
               outputText("她的感觉完美极了。一个火热、湿滑的丝绒老虎钳紧紧地夹住了你的[cock]。感觉就像它真的在抓着你，把你的肉棒包裹在她那涂满神酒的蜜穴里。");
            }
            if(get_player().cockTotal() > 1)
            {
               if(get_player().cockTotal() > 2)
               {
                  outputText("另一根");
               }
               else
               {
                  outputText("你的另一根");
               }
               outputText(Appearance.cockNoun(CockTypesEnum.HUMAN) + " 戳弄着她紧致的后庭，稍微调整了一下，你就对准了。好湿！一寸又一寸，以令人难以置信的轻松滑入，侵犯着她湿滑的屁眼，直到你完全双管齐下地插入了她。");
            }
            outputText("[pg]");
            if(get_player().vaginas[0].vaginalWetness < 2)
            {
               outputText("黏糊糊的湿润在你的大腿间闪烁");
            }
            else if(get_player().vaginas[0].vaginalWetness < 4)
            {
               outputText("女性动情的汁液顺着你的大腿流下");
            }
            else
            {
               outputText("粘稠的女性体液从你的" + get_player().vaginaDescript(0) + "中流出");
            }
            outputText("，提醒着你那未被使用的女性器官。玛莱在你身下发出咕哝声，起初你以为是因为插入，但两个类似肉棒的突起戳弄着你充满欲望的洞口，纠正了你错误的假设。你向后退去，开始认真地操她，随着每一次长长的后撤，你可以看到她的屁股下面长出了触手，就像两条可以抓握的尾巴。它们向前推进并刺穿了你，阻止了你的动作，而你则试图应对两个孔洞突然被撑开的感觉。温暖从这两个入侵者身上散发出来，伴随着一种湿滑的饱满感。它们正在向你体内泵入某种东西，让你感到刺痛，并让[eachcock]跳动滴液。");
            get_player().cuntChange(12,true,true,false);
            get_player().buttChange(12,true,true,false);
            outputText("[pg]");
            outputText("玛莱笑着调侃道：[say: 如果你就是这样操的，难怪我还没见过你的孩子。如果你要成为我的信徒，你需要狠狠地操你的伴侣，直到用精液把她们填满。然后你需要再来一次。或者，你应该在她们的肉棒上弹跳，用你的" + get_player().vaginaDescript(0) + "榨干它，直到你的子宫被塞得满满的，连路都走不动。现在让我看看你会怎么做，否则我可能会把你留在这里，直到你被训练好为止！][pg]");
            outputText("你高兴地向前挺动，将你的[cock]狠狠地撞入她的小穴，力量之大，以至于湿润的拍打声在湖面上回荡，她的体液溅到了你的腹部。");
            if(get_player().cockTotal() > 1)
            {
               outputText("她的屁眼被你的" + get_player().cockDescript(1) + "操得吧唧作响，滴着水，实际上因为这猛烈的操弄，喷出的润滑液比她的小穴还要多！");
            }
            outputText("尽管[eachcock]获得了难以置信的快感，你还是专注于服从你的女神，你收缩" + get_player().vaginaDescript(0) + "和[asshole]的肌肉来取悦她的触手。沉闷的晃动声和喷涌声传入你的耳朵，你意识到你的努力是多么成功。玛莱捏着自己的乳头，弓起背，片刻之后，一阵快感如锤击般猛烈地击中了你的大脑。[pg]");
            outputText("精液从你的");
            if(get_player().balls > 0)
            {
               outputText("快速收缩的睾丸中沸腾而出");
            }
            else
            {
               outputText("被触手挤压的前列腺中沸腾而出");
            }
            outputText("并喷发进玛莱的子宫里。你的臀部向前挺动，用你的[cockhead]摩擦着她的子宫颈，以便更好地填满她的子宫。");
            if(get_player().cockTotal() > 1)
            {
               outputText("插在她屁股里的" + get_player().cockDescript(1) + "痉挛着，和它的兄弟一起爆发，用一层糖浆般的精液覆盖了她湿滑的结肠。");
            }
            if(get_player().cockTotal() > 2)
            {
               outputText("虽然被冷落但依然高潮了，");
               if(get_player().cockTotal() > 3)
               {
                  outputText("剩下的");
               }
               outputText("你的");
               if(get_player().cockTotal() > 3)
               {
                  outputText(get_player().multiCockDescriptLight());
               }
               else
               {
                  outputText(get_player().cockDescript(2));
               }
               outputText("尽力用白浊涂满玛莱的大腿。");
            }
            outputText("你体内的粘液似乎永远也流不完，你把玛莱的肚子灌得鼓鼓的，直到她看起来有点像怀孕了。");
            if(get_player().cumQ() < 500)
            {
               outputText("这次高潮比平时要猛烈得多，你怀疑是不是她的魔法增强了它。");
            }
            if(get_player().cumQ() > 1000)
            {
               outputText("当你不断地向她体内喷射更多的精液时，她实际上感到很惊讶。她的乳头开始喷出多余的精液，但你一直在射精，直到她喷出的精液足以让她全身浸透你的精液。");
            }
            outputText("在这整个过程中，女神的触手从未松懈，你的肚子也变得和玛莱的一模一样。[pg]");
            outputText("你滑了出来，瘫倒在地，这场配种让你筋疲力尽。女神把她的触手从你饱受蹂躏的洞口拔出，惊叹于植物精液的流出，而你则放松下来，昏了过去。你感觉到她把你的双手交叠在肚子上，抱着那怀孕般的凸起，然后你心满意足地打起了呼噜。[pg]");
         }
         doNext(MaraePt2RoundIIIPrizes);
      }
      
      public function MaraeIIFlyAway() : void
      {
         spriteSelect(SpriteDb.get_s_marae());
         clearOutput();
         outputText("你腾空而起，拍打着翅膀，飞向天空。触手树向你猛抽过来，但没打中。你逃脱了！一个巨大的东西呼啸而过，你抬头一看，发现你的船从你身边飞过。一定是她把它扔向你的！它扑通一声落在系泊处附近，不知怎么地在撞击中幸存了下来。你俯冲下去，把它拖回码头，然后返回营地。好险！");
         doNext(get_camp().returnToCampUseOneHour);
      }
   }
}

