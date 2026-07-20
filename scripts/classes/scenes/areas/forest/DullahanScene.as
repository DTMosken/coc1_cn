package classes.scenes.areas.forest
{
   import classes.BaseContent;
   import classes.CoC;
   import classes.Cock;
   import classes.CockTypesEnum;
   import classes.DebugMenu;
   import classes.DynStat;
   import classes.Monster;
   import classes.PerkLib;
   import classes.Player;
   import classes.SelfDebug;
   import classes.StatusEffects;
   import classes.Time;
   import classes.TimeAwareInterface;
   import classes._FlagDict.FlagDict_Impl_;
   import classes.display.SpriteDb;
   import classes.globalFlags.KFLAGS;
   import classes.internals.Utils;
   import classes.items.WeaponLib;
   import classes.saves.SelfSaver;
   import classes.saves.SelfSaving;
   import classes.scenes.Camp;
   import classes.scenes.Inventory;
   import classes.scenes.api.Encounter;
   import classes.scenes.api.Encounters;
   import classes.scenes.areas.forest._DullahanScene.SaveContent;
   import classes.scenes.areas.volcanicCrag.CorruptedCoven;
   import classes.scenes.combat.Combat;
   import classes.scenes.combat.CombatDistance;
   import coc.view.CoCButton;
   import flash.Boot;
   import haxe.IMap;
   
   public class DullahanScene extends BaseContent implements TimeAwareInterface, SelfDebug, SelfSaving, Encounter
   {
      
      public static var DATE_WOODS:int = 1;
      
      public var saveVersion:int;
      
      public var saveName:String;
      
      public var saveContent:SaveContent;
      
      public var lust:Number;
      
      public var globalSave:Boolean;
      
      public function DullahanScene()
      {
         if(Boot.skip_constructor)
         {
            return;
         }
         globalSave = false;
         saveVersion = 1;
         saveName = "dullahan";
         saveContent = new SaveContent(null,null,null,null);
         lust = Number(Math.NaN);
         super();
         SelfSaver.register(this);
         DebugMenu.register(this);
         CoC.timeAwareClassAdd(this);
      }
      
      public function waitoutDull() : void
      {
         spriteSelect(SpriteDb.get_dullsprite());
         clearOutput();
         outputText("你盯着那颗脱离了身体的头颅，看着它在快感中扭曲……");
         outputText("[pg][say: 我……我是……]她的声音逐渐变小，呻吟着。你坐在地上，看着她的脸越来越红，眼睛在快感中闪烁，羞涩地呻吟着。过了一会儿，她呜咽着闭上了眼睛，这意味着，在灌木丛的某个地方，她的身体达到了高潮。几秒钟后，她睁开眼睛，盯着你。[pg][say: 好吧，你打败我了！现在，你能帮我的身体找到我吗？]她撅着嘴问道。");
         outputText("[pg]你低头看向空地，发现她的身体已经站了起来，正试图寻找自己的头。你抓起无头骑士的头，把它交给了身体，让它兴奋地跳了起来。然后，它把头重新接回了躯干上。");
         outputText("[pg][say: 这样好多了。]她看着你，沉默了很长时间。[say: 谢谢。][pg]又是一阵沉默。[say: 我想我要走——]你打断了她，让她大吃一惊，你问她为什么莫名其妙地攻击你。");
         outputText("[pg][say: 呃，我本来只是想吓吓你，但当你真的开始反击时，我想我干脆就打到底好了。]骑士拍了拍身上的灰尘说道。[say: 当一个不死幽灵骑士哀嚎着冲向他们时，大多数小恶魔和地精只会拼命逃跑。虽然很有趣，但我已经很久没有痛快地打一场了。你确实让我见识到了！]");
         outputText("[pg]你得意地笑了笑，发出一声轻笑。是啊，呵，你确实做到了。过了一会儿，你才恍然大悟，问她是不是真的是不死生物");
         if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,353) >= 1)
         {
            outputText("，从某种意义上说，这也不是你第一次遇到不死生物了。");
         }
         else
         {
            outputText("，因为这是你第一次……遇到这种生物。");
         }
         outputText("[pg]她局促不安地扭动着，被你对她表现出的兴趣弄得有些慌乱。[say: 呃，我当然是。大概吧，我猜。我的意思是，我显然死不了，而且我已经几十年没吃没喝了，所以也许我已经死了？过了一段时间后，你就不再去想这些事了。]");
         if(get_game().shouldraFollower.followerShouldra())
         {
            outputText("[pg]舒尔德拉按捺不住，决定加入对话，从你的胸口探出头来。无头骑士挑了挑眉，但并没有表现出普通人会有的那种惊讶。");
            outputText("[say: 让我来确认一下，老板。]幽灵说着，离开你的身体，冲向无头骑士。她钻进那淡蓝色的身体里，然后迅速返回。骑士只是盯着看。[say: 死得透透的，我没法附身她。不过奇怪的是她自己竟然不知道。通常来说，死亡在一个人的一生中是一件相当难忘的事。]");
         }
         outputText("[pg]无头骑士似乎有些苦恼。[say: 好吧。很高兴认识你……][pg]她伸出手指向你，试图想起一个她根本就不知道的名字。沉默了片刻后，你结束了她的痛苦，正式介绍了自己，这让她松了一口气。[say: 对。我是一个无头骑士。我现在要走了。也许我们还会再见面的。]");
         outputText("[pg]还没等你抗议，骑士的不死战马就凭空出现了。她骑上马离开了。");
         outputText("[pg]今晚已经够折腾的了，你心想。是时候离开了。");
         get_combat().cleanupAfterCombat(get_camp().returnToCampUseTwoHours);
      }
      
      public function timeChangeLarge() : Boolean
      {
         return false;
      }
      
      public function timeChange() : Boolean
      {
         if(Utils.rand(10) == 1 && FlagDict_Impl_.arrayReadInt(KFLAGS.flags,2660) != 2 && FlagDict_Impl_.arrayReadInt(KFLAGS.flags,2668) >= 1 && get_camp().isGuard("Jojo") && get_time().hours == 7)
         {
            outputText("乔乔提到他昨晚看到了一些相当奇怪的东西，但他不确定那是什么；一个半人马或者骑在马背上的人，在营地外的黑暗中徘徊。他说在看清之前它就跑开了。");
            return true;
         }
         return false;
      }
      
      public function talkCirceOffer() : void
      {
         spriteSelect(SpriteDb.get_dullsprite());
         clearOutput();
         outputText("你记得喀耳刻要求亲自见伊芙琳，并决定向她提出这个建议。你思考了一会儿如何更好地表达这个问题，不确定这样的要求会有多大的侵入性。");
         outputText("[pg]不过，你花的时间有点长，她注意到了你相当迷茫的表情。[say: 怎么了，[name]？你看起来有点不对劲。来吧，如果你有什么要说的，就说出来！][pg]你觉得直接问可能就行了。你告诉她关于喀耳刻的事，以及在你告诉她庄园里发生的事情后她的要求。伊芙琳金色的眼睛看着天空，陷入了沉思。[pg][say: 所以你就到处跟别的女人八卦我？真丢人，[name]！如果每个人都知道我只是个普通女孩，我怎么保持我作为一个可怕幽灵的声誉？][pg]有一秒钟，你以为你真的惹怒了她，但没过多久你就注意到她只是在开玩笑。她说完后灿烂的笑容就是一个很好的指标。[pg][say: 现在，这很好奇。你必须明白，我并不急于被任何巫师分析。][pg]绝对——在她经历了那些之后。你同意。[pg][say: 是的。但同时，她对你并没有太大的敌意，所以她可能是值得信任的。][pg]你对此不太确定。你告诉她，即使她相对友好，她似乎也保守着很多秘密。[pg][say: 好吧，你还是引起了我的好奇心。我会去见她。我们会谈谈，如果我喜欢她的风格，我会让她检查是什么让我运转的。毕竟，我也不是对它不好奇。]");
         outputText("[pg]好吧，这比你预想的要顺利。伊芙琳走向她的马，翻身上马。");
         if(get_player().isBiped())
         {
            outputText("然后她向你伸出一只手，好让你也能爬上去。[say: 上来吧。我需要你指路。][pg]你握住她的手，跨上她的马，坐在她身后。[pg][say: 在后面别搞什么小动作，好吗？从马上摔下来可不是闹着玩的。]");
            outputText("[pg]你注意到，随着她双腿跨坐在马鞍上，她的白色裙子被撩得极高，几乎没有留下任何想象空间。这很难避免，但在旅途中你只能尽量不去摸她。");
            outputText("[pg]你告诉她不用担心。她咂了咂嘴，挥动缰绳，驱使她的亡灵坐骑向前飞奔。");
         }
         else
         {
            outputText("然后她向你伸出一只手，但很快就注意到你无法和她共乘一骑。");
            outputText("[pg][say: 哎呀，抱歉[name]，但如果你想和我一起骑马，事情会变得有点尴尬。][pg]不是两足动物确实经常会遇到尴尬的情况。你问她是否应该写下一些指示，让她以后照着做。[pg][say: 不，不。我总是搞砸书面指示。这样吧，我就保持慢跑，这样你就能跟上我了，怎么样？]");
            if(get_player().isTaur() && get_player().get_spe() >= 100)
            {
               outputText("[pg]你得意地笑了笑，告诉她你能跟上她坐骑的全速飞奔。她真正应该担心的是落后！[pg][say: 哦，所以这是一个挑战，对吧？准备好收回你的话，顺便吃点灰吧。指路，尽量别输得太难看！][pg]你接受了她的挑战。你们俩准备向火山岩飞奔而去。[pg]你大喊一声[say: 开始！]然后向前冲去，伊芙琳紧随其后挥动坐骑的缰绳。没过多久，你们俩就并驾齐驱，两对蹄子在树林中发出雷鸣般的声响。");
            }
            else
            {
               outputText("[pg]你告诉她这是一个很好的折中方案。你们一直很享受彼此的陪伴，所以这将是一次缓慢但有趣的旅程。[pg]你指明了方向，她咂了咂嘴，让她的坐骑开始慢跑。你跟在她身边，向火山岩走去。");
            }
         }
         doNext(get_game().volcanicCrag.coven.circeEvelynEncounter);
      }
      
      public function sparDull() : void
      {
         spriteSelect(SpriteDb.get_dullsprite());
         clearOutput();
         outputText("你邀请无头骑士进行一场切磋。");
         outputText("[pg][say: 啊，这真是个好主意！]她说道，显然很兴奋。你们俩来到森林里的一块空地，开始战斗！");
         startCombat(new Dullahan());
         get_monster().createStatusEffect(StatusEffects.Spar,0,0,0,0);
         get_monster().set_gems(0);
      }
      
      public function saveToObject() : Object
      {
         return saveContent;
      }
      
      public function reset() : void
      {
         saveContent.rimmingProgress = 0;
         saveContent.seenBody = false;
         saveContent.encounterDay = -1;
         saveContent.talkedAboutCurse = false;
      }
      
      public function onAscend(param1:Boolean) : void
      {
         reset();
      }
      
      public function manorIntro() : void
      {
         clearOutput();
         outputText("[say: 你会沿着一条破败的古道到达那里。通往庄园的小路沿着崎岖的山丘蜿蜒而上，那里的生命大多已经枯萎，逃离了渗入土壤的腐化。那是一幅可怕的景象，但这仅仅是即将发生的事情的序幕。][pg][say: 在那些俯瞰山谷的古老废墟下方，有一个噩梦成真的地方。他就住在那里，对生命和自然进行着不可名状的亵渎。必须阻止他。你必须阻止他。很抱歉向你提出这个要求，[name]，但必须有人勇敢地穿过这个令人憎恶的地方，一劳永逸地结束这一切。]");
         doNext(get_game().dungeons.manor.enterDungeon);
      }
      
      public function manorChoice(param1:int) : void
      {
         var _g2:DullahanScene;
         var _g1:DullahanScene;
         var _g:DullahanScene;
         spriteSelect(SpriteDb.get_dullsprite());
         clearOutput();
         if(param1 == 1)
         {
            outputText("你稍微考虑了一下这个问题，接受了她的请求。她露出了淡淡的微笑，很高兴，但仍然不确定自己是否做出了正确的决定。");
            outputText("[pg][say: 谢谢你，[name]。来，让我告诉你怎么找到那座庄园。]");
            FlagDict_Impl_.arrayWriteInt(KFLAGS.flags,2674,1);
            doNext(manorIntro);
         }
         if(param1 == 2)
         {
            outputText("你告诉她你现在还没准备好接受这样的任务。她低下头，有些失望，但很快又挤出一丝微笑，重新看向你。");
            outputText("[pg][say: 我明白，[name]。这不是一件可以草率对待的事。如果你改变主意了，我会在这里等你的。]");
            FlagDict_Impl_.arrayWriteInt(KFLAGS.flags,2674,2);
            _g = this;
            doNext(function():void
            {
               _g.dullMenu();
            });
         }
         if(param1 == 3)
         {
            outputText("你告诉她你已经进入了庄园，并在经历了一场苦战后杀死了那个死灵法师。她倒吸了一口凉气，惊讶地睁大了眼睛。你觉得你甚至可能看到她眼眶里泛起了泪光。");
            outputText("[pg][say: 真是难以置信。这么多年来，我一直生活在他的阴影下。作为侍卫，作为奴隶，作为逃亡者。而现在一切都结束了。我不知道该说什么。只是——] 她飞快地揉了揉一只眼睛。");
            outputText("[pg][say: 我不认为我已经自由了。无论是在生前还是死后，我都做过可怕的事情，但我无法用言语来表达我是多么感谢你卸下了我的重担并纠正了这一切。我，嗯——]");
            outputText("[pg]她扑向你，紧紧地抱住了你。你有些惊讶，但还是决定回抱她。");
            outputText("[pg]你们俩就这样静静地站了一会儿。庄园仍然被诅咒着，无辜的人也无法死而复生。但你给了她一丝希望，而这绝非毫无价值。[pg]");
            awardAchievement("一线生机",279);
            FlagDict_Impl_.arrayWriteInt(KFLAGS.flags,2674,3);
            _g1 = this;
            doNext(function():void
            {
               _g1.dullahanGift();
            });
         }
         if(param1 == 4)
         {
            outputText("你告诉她你终究还是不需要这把镰刀。[say: 噢——我明白了。好吧，这个提议依然有效。如果你改变主意了，随时可以来找我拿！]");
            FlagDict_Impl_.arrayWriteInt(KFLAGS.flags,2674,4);
            _g2 = this;
            doNext(function():void
            {
               _g2.dullMenu();
            });
         }
         if(param1 == 5)
         {
            FlagDict_Impl_.arrayWriteInt(KFLAGS.flags,2674,3);
            dullMenu(false);
         }
      }
      
      public function load(param1:int, param2:*) : void
      {
         Utils.extend(saveContent,param2);
      }
      
      public function listenToDull() : void
      {
         spriteSelect(SpriteDb.get_dullsprite());
         clearOutput();
         outputText("你盯着那颗身首异处的头颅，希望她能明白自己的处境。");
         outputText("[pg][say: 我……我是……]她的声音渐渐变小，沮丧地叹了口气。[say: 好吧。我们算平局。]你更加用力地盯着她，然后转过头去。[say: 好吧，好吧！你打败我了！现在，你能帮我的身体找到我吗？]她嘟着嘴问道。");
         outputText("[pg]你低头看向空地，发现她的身体已经站了起来，伤口完全愈合，正试图寻找自己的头。你抓起无头骑士的头颅，把它递给身体，身体兴奋地跳了起来。然后它把头重新接回了躯干上。");
         outputText("[pg][say: 这样好多了。]她看着你，沉默了很长时间。[say: 谢谢。][pg]又是一阵沉默。[say: 我想我要走——]你打断了她，让她大吃一惊，你问她为什么莫名其妙地攻击你。");
         outputText("[pg][say: 呃，我本来只是想吓吓你，但当你真的开始反击时，我想我干脆就打到底好了。]骑士拍了拍身上的灰尘说道。[say: 当一个不死幽灵骑士哀嚎着冲向他们时，大多数小恶魔和地精只会拼命逃跑。虽然很有趣，但我已经很久没有痛快地打一场了。你确实让我见识到了！]");
         outputText("[pg]你得意地笑了笑，发出一声轻笑。是啊，呵，你确实做到了。过了一会儿，你才恍然大悟，问她是不是真的是不死生物");
         if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,353) >= 1 || get_game().bog.marielle.saveContent.state != 0)
         {
            outputText("，这也不是你第一次遇到不死生物了。");
         }
         else
         {
            outputText("，因为这是你第一次……遇到这种生物。");
         }
         outputText("[pg]她局促不安地扭动着，被你对她表现出的兴趣弄得有些慌乱。[say: 呃，我当然是。大概吧，我猜。我的意思是，我显然死不了，而且我已经几十年没吃没喝了，所以也许我已经死了？过了一段时间后，你就不再去想这些事了。]");
         if(get_game().shouldraFollower.followerShouldra())
         {
            outputText("[pg]舒尔德拉按捺不住，决定加入对话，从你的胸口探出头来。无头骑士挑了挑眉，但并没有表现出普通人会有的那种惊讶。");
            outputText("[say: 让我来确认一下，老板。]幽灵说着，离开你的身体，冲向无头骑士。她钻进那淡蓝色的身体里，然后迅速返回。骑士只是盯着看。[say: 死得透透的，我没法附身她。不过奇怪的是她自己竟然不知道。通常来说，死亡在一个人的一生中是一件相当难忘的事。]");
         }
         outputText("[pg]无头骑士似乎有些苦恼。[say: 好吧。很高兴认识你……][pg]她伸出手指向你，试图想起一个她根本就不知道的名字。沉默了片刻后，你结束了她的痛苦，正式介绍了自己，这让她松了一口气。[say: 对。我是一个无头骑士。我现在要走了。也许我们还会再见面的。]");
         outputText("[pg]还没等你抗议，骑士的不死战马就凭空出现了。她骑上马离开了。");
         outputText("[pg]今晚已经够折腾的了，你心想。是时候离开了。");
         get_combat().cleanupAfterCombat(get_camp().returnToCampUseTwoHours);
      }
      
      public function learnSkill() : void
      {
         var _g:DullahanScene;
         spriteSelect(SpriteDb.get_dullsprite());
         clearOutput();
         outputText("你问她是在哪里学到她那相当独特的战斗姿势的。");
         outputText("[pg][say: 啊，我就知道你在我们决斗后会注意到。那是我小时候学的，当时人类在这片土地上还很常见。如你所见，我并不是最强壮的骑士，所以我尽力保持敏捷。让我的闪避和格挡尽可能贴近且快速，并在敌人过于专注于进攻而来不及防守时进行反击。]");
         outputText("[pg]你点了点头。");
         outputText("[pg]沉默。");
         outputText("[pg][say: 你想让我教你我的技巧，对吧？]是时候了。你说是的。[say: 好吧……你确实帮我找回了一些状态，毕竟周围没人陪我练习。]");
         if(get_player().get_spe() < 90)
         {
            outputText("[pg][say: 但你只是……我该怎么说呢？<b>太慢了</b>。你最好还是用标准的姿势，早点闪避，在别处寻找破绽。否则你只会在能做任何事之前被劈成两半。稍微练练你的速度，我会很乐意教你我的姿势。]");
            outputText("[pg]好吧，你不能强迫她教你任何东西。你的自尊心有点受挫，但你现在有努力的目标了。");
            _g = this;
            doNext(function():void
            {
               _g.dullMenu();
            });
         }
         else
         {
            get_player().changeFatigue(40);
            get_player().createPerk(PerkLib.CounterAB,0,0,0,0);
            outputText("[pg][say: 那应该行得通！我注意到你自己也相当快。我想你能很好地利用这个姿势。老实说，我很高兴有机会把这个教给别人。这现在几乎是一门失传的艺术了。]");
            outputText("她站起身，拔出军刀，示意你进行决斗。");
            outputText("[pg]接下来的两个小时，你尽力向她学习，而她也倾囊相授。你有几次差点被砍中，但你很快学会了如何在最后一秒用最微小的动作闪避，并在敌人看清发生什么之前以闪电般的速度发动攻击。");
            outputText("[pg]你筋疲力尽，但对学到的东西感到兴奋。这位无头骑士是你见过最开心的样子。[say: 你学得真快！距离我学这个已经过去太久了，我很惊讶我居然还记得基础知识。哈，我感觉自己充满了活力！][pg]你很纳闷，你们俩刚刚进行了两个小时的艰苦训练，她怎么还能有这样的体力。[say: 我现在还能再来一场决斗！可惜你看起来……像死了一样。等你休息好了再来找我，我们看看我是不是个好老师。]");
            outputText("[pg]现在休息听起来是个好主意。你向兴奋的亡灵女孩告别，然后回到了营地。");
            outputText("[pg]<b>获得特质：反击姿态！</b>");
            doNext(get_camp().returnToCampUseFourHours);
         }
      }
      
      public function kickTheHead() : void
      {
         spriteSelect(SpriteDb.get_dullsprite());
         clearOutput();
         outputText("厌倦了她孩子气的喋喋不休，你伸展双腿，向她跑去，用尽全力踢了她一脚。她被踢飞进了树木和灌木丛的黑暗中，你知道她的身体要找到她可得费一番功夫了。");
         outputText("[pg]今天的疯狂到此为止。是时候回营地了。");
         FlagDict_Impl_.arrayWriteInt(KFLAGS.flags,2660,1);
         get_combat().cleanupAfterCombat(get_camp().returnToCampUseTwoHours);
      }
      
      public function get_debugName() : String
      {
         return "无头骑士";
      }
      
      public function get_debugHint() : String
      {
         return "";
      }
      
      public function execEncounter() : void
      {
         saveContent.encounterDay = get_time().days;
         if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,2660) == 1)
         {
            dullahanIntroRude();
         }
         else if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,2659) == 0)
         {
            dullahanIntro();
         }
         else
         {
            dullahanIntro2();
         }
      }
      
      public function encounterName() : String
      {
         return "无头骑士";
      }
      
      public function encounterChance() : Number
      {
         if(get_time().hours >= 21 && FlagDict_Impl_.arrayReadInt(KFLAGS.flags,2660) != 2)
         {
            if(saveContent.encounterDay < get_time().days)
            {
               return Encounters.ALWAYS;
            }
            return 1;
         }
         return 0;
      }
      
      public function dullahanVictorypt3() : void
      {
         clearOutput();
         if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,2660) == 1)
         {
            outputText("你被收割了，你的灵魂被夺走，成为不可名状的邪恶仪式的资源。你的冒险结束了。");
            get_game().gameOver();
            return;
         }
         outputText("你醒了过来，疯狂地尖叫着，抓挠着地面，为自己的生命感到恐惧，但你还活着。你的伤口证明了你的战斗不是梦，但为什么它没有终结你？");
         outputText("[pg]你摇了摇头，把这些想法抛在脑后，向营地走去。真是个不眠之夜。");
         get_combat().cleanupAfterCombat();
         doNext(get_camp().returnToCampUseFourHours);
      }
      
      public function dullahanVictorypt2() : void
      {
         spriteSelect(SpriteDb.get_dullsprite());
         clearOutput();
         outputText("森林逼近了。一阵令人毛骨悚然的狂风吹过如白骨般的树枝和毫无生气的树叶，在你的脑海中低语着毁灭。你退缩了。英雄主义，究竟是为了什么？");
         if(get_player().get_inte() >= get_player().get_str())
         {
            outputText("[pg]你又哭又笑。你的心智，尽管受过训练，却在这个独眼巨人的重压下崩溃了。疯狂适合你——那是智慧的升华。");
         }
         else
         {
            outputText("[pg]你的力量，曾经是英格纳姆的骄傲，如今却化为乌有。在这个不可名状的邪恶面前，你是如此脆弱。你失败了。");
         }
         outputText("[pg]镰刀划破空气，直奔你的脖颈。你站在遗忘的悬崖边，即使是你现在扭曲的心智也无法想象你即将面临的难以承受的恐怖。镰刀亲吻着你的脖子，这个死亡的预兆嘲笑着人类可悲的反抗。这就是结局。");
         doNext(dullahanVictorypt3);
      }
      
      public function dullahanVictory() : void
      {
         spriteSelect(SpriteDb.get_dullsprite());
         clearOutput();
         outputText("你瘫倒在地，被你那超自然的对手彻底击溃了。");
         outputText("[pg]骑士挥舞着巨大的镰刀向你走来。[say: 闯入者！准备好接受你的审判吧！]");
         outputText("[pg]骑士化作一个可怕的黑色幽灵，缓缓举起镰刀，刀刃上不知为何滴着鲜血。她向你逼近，每一个动作都唤起死者撕裂灵魂的哀嚎，随着她那令人发狂的步伐，整个世界都在变暗。[pg]");
         doNext(dullahanVictorypt2);
      }
      
      public function dullahanStrapOn() : void
      {
         spriteSelect(SpriteDb.get_dullsprite());
         clearOutput();
         outputText("你告诉她，你有一个完美的工具来解决这个难题。当你翻找[inv]时，她好奇地微微歪着头。你拿出了瓦普拉的恶魔假阳具，展示给她看。她难以置信地挑起了眉毛。");
         outputText("[pg][say: 哇，这还挺有创意的，我想，] 她说着，接过了假阳具。她分析了一下它的形状、柔软度和质地，然后转过身来看着你。[say: 所以，我戴上这个，然后……] 她用臀部做了一个简短、胆怯的挺进动作。[say: 对吧？] 你点点头，对她的天真感到有些好笑。");
         if(!get_player().hasVagina())
         {
            outputText("[pg][say: 但是你没有……那个洞。你知道的。除非你想让我用你的——] 你点点头。[say: 哈！好吧，如果那能让你爽，当然可以。][pg]她花了一点时间弄清楚怎么戴上假阳具，而你" + get_player().clothedOrNakedLower("脱下你的[armor]","摆好姿势") + "。过了一会儿，她把它绑在臀部，伴随着一声愉悦的呻吟，她把假阳具属于她的那一端推了进去。");
            outputText("[pg]她开始呼吸急促，抚摸着她的假鸡巴，第一次探索拥有肉棒的感觉，被迷住了。你咳嗽了一声，把她拉回现实。[say: 对！得操你！弯下腰！] 想到要操别人，她看起来简直高兴坏了。你弯下腰，向她展示你的[asshole]。");
            outputText("[pg]她走到你身边，把她的阴茎对准你的屁眼。她慢慢地把龟头推了进去，不确定会遇到多大的阻力。");
            if(get_player().ass.analLooseness > 2)
            {
               outputText("令她惊讶的是，并没有多少阻力，龟头毫不费力地滑了进去，" + (get_player().ass.analWetness > 2 ? "在你的天然润滑液的帮助下，剩下的部分也顺利地滑了进去。" : "尽管由于缺乏润滑，剩下的部分遇到了一点阻力。"));
            }
            else
            {
               outputText("她注意到了一些阻力，犹豫了片刻。你告诉她没关系，她便更用力地推。当龟头终于滑进去时，你如释重负地叹了口气，" + (get_player().ass.analWetness > 2 ? "在你的天然润滑液的帮助下，剩下的部分也顺利地滑了进去。" : "尽管由于缺乏润滑，剩下的部分遇到了一点阻力。"));
            }
            outputText("[pg]过了一段时间，她已经把九英寸长的假阴茎全部滑进了你的体内");
            if(get_player().hasCock())
            {
               outputText("，假阳具的重量压在你的前列腺上，让你因欲望而颤抖，你的[cocks]渗出了几滴先列腺液。");
            }
            else
            {
               outputText("。");
            }
            outputText("她缓慢而笨拙地拔出又插回，还不习惯处于给予者的位置。你轻声的呻吟给了她动力，她加快了速度，脸上浮现出着迷的笑容。");
            outputText("[pg]她的笨拙也有好处；断断续续的抽插让快感充满惊喜，她偶尔还得停下来调整臀部，这使得假阳具上下移动，恰到好处地刺激着所有的敏感点。");
            outputText("[pg]她渐渐掌握了诀窍，几分钟后，她就保持了稳定的节奏。在激情的驱使下，她融入了新角色，一边操你，一边弯下腰抱住你的背。[say:你的屁股感觉真棒，[name]。你晚上在森林里游荡，就是为了找人狠狠地操你吗？]她结束了挑逗，轻轻咬了咬你的背，用指甲抓了抓你，这突如其来的刺激让你的[asshole]猛地夹紧了假阳具。");
            outputText("[pg]她继续更快更用力地操你，很快你就因为即将到来的高潮而颤抖起来" + (get_player().hasCock() ? " 你的[cocks]跳动着，脉动着，涌出精液" : "") + "。她注意到了你的颤抖，脸上露出了调皮的笑容。她突然停止了抽插，不出所料，她发现你正狂热而不知羞耻地往她的肉棒上撞。[say:真淫荡，[name]！既然你自己就能这么轻松地操自己，干嘛还要我穿这个？]说着，她轻轻拍了一下你的屁股，不太确定自己能有多粗暴。");
            outputText("[pg]这一巴掌虽然很轻，但还是让你停顿了一下，她趁机迅速地在你体内抽插。这让你达到了顶点，你迎来了强烈的高潮");
            if(get_player().hasCock())
            {
               if(get_player().cumQ() < 50)
               {
                  outputText("，在地上射出几缕精液，同时因快感而颤抖。");
               }
               if(get_player().cumQ() >= 50 && get_player().cumQ() < 300)
               {
                  outputText("，几股精液喷射在冰冷的地面上，你因快感而大声呻吟。");
               }
               if(get_player().cumQ() >= 300)
               {
                  outputText("，一股接一股的精液射在冰冷的地面上，形成了一小滩精液，你因快感而痉挛。");
               }
            }
            else
            {
               outputText("，因快感而颤抖和摇晃。");
            }
            outputText("无头骑士带着目瞪口呆的笑容看着你高潮，对她自己能把人操得这么爽的能力感到惊讶。");
            outputText("[pg]高潮的狂喜消退后，你因为塞在屁股里的东西而感到不适，痛苦地呻吟起来。她没有回应，所以你呻吟得更大声了。[say:哦！对，抱歉。]她慢慢地拔出假阳具，伴随着“啵”的一声，它离开了你的屁股。你如释重负地呼出一口气。[say:我觉得我挺擅长这个的！]她说道，一边把玩着她的肉棒，一边依然喜笑颜开。");
            outputText("你表示同意，疲惫地喘着粗气。你们俩休息了一会儿，然后起身收拾东西。一切都清点完毕后，你转向她，向她要回你的穿戴式假阳具。[say:啊，真遗憾。给你，]她解开背带，把假阳具从她的小穴里拔出来。它完全被她的淫液浸透了，她的大腿上也是。[say:我不介意再来一次！我想我能习惯操东西。]");
            outputText("[pg]你道了别，然后回到了营地。在路上，你注意到恶魔假阳具根本没有射精。也许它对，嗯，亡灵不起作用？");
         }
         else
         {
            outputText("[pg][say:我从来没有这样操过任何人，所以如果有些笨拙，请见谅。][pg]她花了一点时间弄清楚如何穿戴假阳具，而你" + get_player().clothedOrNakedLower("脱下你的[armor]","摆好姿势") + "。过了一会儿，她把它绑在了臀部，伴随着一声愉悦的呻吟，她把假阳具的一端推入了自己的体内。");
            outputText("[pg]她的呼吸开始变得急促，抚摸着她的假肉棒，第一次体验拥有肉棒的感觉，仿佛被催眠了。你咳嗽了一声，把她拉回现实。[say:对！得操你！弯下腰！]一想到要操人，她看起来就兴奋极了。你弯下腰，向她展示你的[vagina]。");
            outputText("[pg]她走到你面前，把她的阴茎对准你的阴唇。她慢慢地把龟头推入，不确定会遇到多大的阻力。");
            if(get_player().averageVaginalLooseness() > 2)
            {
               outputText("令她惊讶的是，并没有太大的阻力，龟头毫不费力地滑了进去，" + (get_player().averageVaginalWetness() > 2 ? "在天然润滑液的帮助下，剩下的部分也顺利地滑了进去。" : "不过由于缺乏润滑，剩下的部分遇到了一点阻力。"));
            }
            else
            {
               outputText("她注意到了一些阻力，犹豫了一下。你告诉她没关系，她便更加用力地推。当龟头终于滑进去时，你如释重负地叹了口气，" + (get_player().averageVaginalWetness() > 2 ? "在天然润滑液的帮助下，剩下的部分也顺利地滑了进去。" : "不过由于缺乏润滑，剩下的部分遇到了一点阻力。"));
            }
            outputText("[pg]过了一会儿，她已经把整整九英寸长的假阴茎滑入你体内，将你完全而美妙地撑开。");
            outputText("她缓慢而笨拙地拔出又插回，还不习惯处于给予者的位置。你轻声的呻吟给了她动力，她加快了速度，脸上浮现出着迷的笑容。");
            outputText("[pg]她的笨拙也有好处；断断续续的抽插让快感充满惊喜，她偶尔还得停下来调整臀部，这使得假阳具上下移动，恰到好处地刺激着所有的敏感点。");
            outputText("[pg]她渐渐掌握了诀窍，几分钟后便保持着稳定的节奏。在激情的驱使下，她融入了新的角色，俯身抱住你的背，一边操你一边说：[say:你的小穴感觉真棒，[name]。你晚上在森林里游荡，就是为了找人狠狠地操你吗？]她结束了挑逗，轻轻咬了咬你的背，用指甲抓了抓你，这突如其来的刺激让你的[vagina]猛地夹紧了假阳具。");
            outputText("[pg]她继续更快更用力地操你，很快你就因为即将到来的高潮而颤抖起来" + (get_player().hasCock() ? " 你的[cocks]跳动着，脉动着，涌出精液" : "") + "。她注意到了你的颤抖，脸上露出了调皮的笑容。她突然停止了抽插，不出所料，她发现你正狂热而不知羞耻地往她的肉棒上撞。[say:真淫荡，[name]！既然你自己就能这么轻松地操自己，干嘛还要我穿这个？]说着，她轻轻拍了一下你的屁股，不太确定自己能有多粗暴。");
            outputText("[pg]这一巴掌虽然很轻，但还是让你停顿了一下，她趁机迅速地在你体内抽插。这让你达到了顶点，你迎来了强烈的高潮");
            if(get_player().averageVaginalWetness() > 3)
            {
               outputText("，把你的淫液溅到了无头骑士的胯部");
            }
            if(get_player().hasCock())
            {
               if(get_player().cumQ() < 50)
               {
                  outputText("并且射出几道精液在地上，身体因快感而颤抖。");
               }
               if(get_player().cumQ() >= 50 && get_player().cumQ() < 300)
               {
                  outputText("并且射出几股精液，在冰冷的地面上画出痕迹，你因快感而大声呻吟。");
               }
               if(get_player().cumQ() >= 300)
               {
                  outputText("并且在冰冷的地面上射出一股又一股精液，形成了一小滩精液，你因快感而抽搐。");
               }
            }
            else
            {
               outputText("，因快感而颤抖和摇晃。");
            }
            outputText("无头骑士带着目瞪口呆的笑容看着你高潮，对她自己能把人操得这么爽的能力感到惊讶。");
            outputText("[pg]高潮的狂喜消退后，你因为塞在小穴里的东西而痛苦地呻吟。她没有回应，所以你呻吟得更大声了。[say:哦！对，抱歉。]她慢慢地拔出假阳具。你如释重负地呼出一口气。[say:我觉得我挺擅长这个的！]她说道，一边把玩着她的肉棒，一边仍然喜笑颜开。");
            outputText("你表示同意，疲惫地喘着粗气。你们俩休息了一会儿，然后起身收拾东西。一切都清点完毕后，你转向她，向她要回你的穿戴式假阳具。[say:啊，真遗憾。给你，]她解开背带，把假阳具从她的小穴里拔出来。它完全被她的淫液浸透了，她的大腿上也是。[say:我不介意再来一次！我想我能习惯操东西。]");
            outputText("[pg]你道了别，然后回到了营地。在路上，你注意到恶魔假阳具根本没有射精。也许它对，嗯，亡灵不起作用？");
         }
         doNext(get_camp().returnToCampUseTwoHours);
      }
      
      public function dullahanRimming() : void
      {
         clearOutput();
         spriteSelect(SpriteDb.get_dullsprite());
         outputText("你告诉你的亡灵爱人，你很乐意满足她的需求，但这次你想知道她今晚有没有什么想法。" + (saveContent.rimmingProgress < 2 ? "[say: 嗯，有一件事我很想尝试，我以前从来没有真正做过，甚至在我自己身上也没有。] 你看起来很感兴趣，问她想尝试什么。[say: 嗯……我有点想看看把我的口交技巧用在你的屁股上是什么感觉。] 听到这个承认，她的脸颊泛起了深紫色，你咯咯地笑着告诉她，你很乐意让她尝试一下。" : "[say: 我能想到一件事，不如你让我再给你的屁股一点关注？]") + " 你急于开始，迅速脱下你的[armor]并把它放在一边，然后走到伊芙琳身边，帮她脱下衣服。首先解开她紧身胸衣的蕾丝，你慢慢地把它滑下来，露出她非常大的蓝色乳房。把嘴移到她的胸前，你开始轻轻地舔吻她冰冷但坚硬的乳头之一。在你的嘴接触到她的乳房时，她颤抖着，抓住你的手，把它们分别放在她臀部的两侧。她的手放在你的手上，轻轻地引导你同时拉下她的裙子和内裤。把她的内衣和短裙滑到她粗壮的蓝色大腿上，你让它们掉在地上。当它们落地时，你的爱人抓住这个机会，引导你的身体也蹲下来。");
         outputText("[pg]当你坐下时，伊芙琳把她自己的头放在你下面，脸朝上。明白她想让你做什么，你把膝盖放在她头的两侧，轻轻地放低自己，直到你感觉到你的屁股瓣擦过她的脸。非常小心地，你把你的洞直接放在她的嘴上方，分开你的屁股瓣，放低自己，直到你感觉到她的舌头开始在你的入口处盘旋。就在她开始挑逗你的洞时，你看到她的身体站在你面前。她冰冷、湿透、肿胀的小穴就在你面前，你用舌头舔舐她的外阴，缓慢而有力地从下到上，品尝她美味而冰冷的湿润，每次你的舌头接触到她肿胀的阴蒂时，都给它一个快速的吻。在你的嘴和舌头的感觉下，她的身体脚趾卷曲，她的头发出淫荡而愉悦的呻吟。");
         outputText("[pg]现在她自己也得到了快感，她把冰冷的舌头直接戳在你的肛门上。起初很轻，她越来越用力地压在上面，直到它滑入你的体内。这是一种奇怪的感觉——你期望从舌头上得到的湿润和灵活性，但由于你爱人的亡灵状态而完全冰冷。习惯了无头骑士舌头在你屁股里那种有趣而独特的感觉，你用嘴唇锁住她的阴蒂，用舌头挑逗它。作为回应，她把她冰冷、湿润的器官伸得更深，并在你体内做出舔舐的动作。");
         outputText("[pg]喜欢她舌头在你后庭里的感觉，你忍不住被欲望淹没，一只手被吸引去淫荡地揉搓你跳动、肿胀的[clit]，而另一只手则滑入她的大腿之间，那里现在因为她流口水的小穴而变得光滑。现在做出吸吮的动作，用你的舌头直接用力摩擦她的阴蒂，你把中指和无名指滑入她完全滴水的小穴。她冰冷的女性体液涂满了你的手指，你把它们向上卷起，压在她的阴道壁上。听到你下面传来一声呻吟，感觉到她的舌头在你体内微微震动，你认为她很享受这个。她的舌头在你的屁股里有力地舔舐和抽插，你的嘴吸吮和舔舐她勃起的阴蒂，一只手的手指卷曲着在她体内来回滑动，另一只手快速地揉搓你自己的阴蒂——你全方位地忙碌着。");
         outputText("[pg]加快你手指在她体内的节奏，你更快更用力地抽插，深入并以更快的速度抽插。你的舔舐加快了，变得几乎疯狂。你非常想满足让你的亡灵爱人先高潮的愿望。几乎就像读懂了你的心思一样，没过多久，你加快的节奏就让她在你的屁股里用力呻吟，并迫使她的舌头尽可能深地伸入你体内，同时扭动着。她的身体颤抖着，抓住你的头，把它压在她的胯部，你感觉到她的小穴紧紧地包裹着你的手指。把这当作是给她一个好送行的信号，你抽插得越来越快，感觉到她冰冷湿润的淫液淹没了你的手和手腕。在这一刻的兴奋中，你感觉到自己越来越快地揉搓着你的阴蒂，而她的舌头比以前更深更用力地伸入，似乎在探索它能触及的你体内的每一个部位；你迷失在这一刻，不知不觉中，你感觉到你的身体在她的头上上下摇晃，小穴喷涌在她的下巴和脖子上。");
         outputText("[pg]喘着粗气，你把脸从她的胯部移开，以便恢复呼吸。尽管知道你已经高潮了，她的舌头仍在探索你的体内，似乎很享受吃你的后庭。");
         outputText("[pg]经过几分钟的高潮后刺激，她终于开始平静下来。她的舌头放慢了动作，然后滑出，她的身体迅速把她从你下面移开，并在你站起来时把她的头放在它所属的位置。" + (saveContent.rimmingProgress < 2 ? "你问她现在尝试过了，觉得怎么样。她热情地对你微笑，她的整张脸都泛起了深紫色。[say: 这……很有趣。那么温暖紧致。] 你咯咯地笑着问她，这就是她对它的全部赞美吗，毕竟她坚持了很长时间。即使在黑暗中，你也能看到她脸红得有多厉害。[say: 嗯……好吧，你赢了。我喜欢它。在我的舌头上那么温暖紧致，还有你坐在我脸上，我的舌头在你体内的样子。这绝对很性感。另外，你在取悦我方面肯定也做得不错。] 她强烈地微笑着，热情地亲吻你的嘴唇。你对这个吻微笑，告诉她爱上一个可爱的亡灵女孩绝对是你来到这个世界时最意想不到的事情之一。此时她的整张脸都变成了紫色，她微微把目光从你身上移开。[say: 爱上我？真的吗？] 你告诉她当然，你肯定为她经历了很多，也和她度过了足够的时间。你刚说完，就感觉到她的双臂拥抱着你，她的嘴唇再次与你相遇。回敬这个吻和拥抱，你在无头骑士的感情中沐浴了几分钟。" : "你问她这次是否和以前一样享受。[say: 绝对的，你知道如何给女孩一个美好的时光，你知道的。] 你的无头骑士爱人微笑着，深情地亲吻你。用双臂搂住她，你回敬这个吻，同时放下手紧紧地捏住她的屁股。"));
         outputText("[pg]不想走，但知道你现在需要上路了，你穿好衣服，告诉她你会尽快再来拜访。[say: 好的，我会记住你的话的，你知道的。] 当她为自己的话咯咯笑时，你告诉她你做梦也不会想到不和你肮脏邪恶的无头骑士荡妇共度时光。她重重地打了你的肩膀一拳，你们俩笑着开始回营地。");
         saveContent.rimmingProgress = 2;
         get_player().orgasm("Vaginal");
         doNext(get_camp().returnToCampUseOneHour);
      }
      
      public function dullahanPt2() : void
      {
         spriteSelect(SpriteDb.get_dullsprite());
         clearOutput();
         outputText("你对骑士发出了最后一击。它从你身边冲过，明显失去了平衡，因伤痛而痛苦不堪。[say: 你打不败我的！我是死亡的使者！]它尖叫着，看着你，高举着镰刀。");
         outputText("[pg]然而，它显然太忙于幸灾乐祸，没有注意自己要去哪里。当骑士转过头时，它撞上了一根粗壮的树枝。你看着骑士的头撞在树枝上，从肩膀上干脆利落地掉了下来，不禁倒吸一口凉气！马和骑士的身体继续向黑暗中疾驰，而头颅则掉在了地上。[pg]");
         outputText("[pg]你收起武器准备离开，仍然有些震惊。[say: 嘿！我们还没完呢！]一个不那么可怕的女性声音喊道。你慢慢转过身，听到脚步声正在靠近那颗掉落的头颅。当你看到骑士无头的身体——现在大部分斗篷已经脱落——举起自己的头并把它放在肩膀上时，你差点晕过去！");
         outputText("[pg]你惊得说不出话来，但你趁机仔细观察了你这位顽强的对手。从乳房、声音和飘逸的白色长发来看，这是个女人。她的皮肤是淡蓝色的，眼睛出奇地黑，瞳孔是金色的。[say: 你会为那样把我从马上打下来付出代价的！]她说着，拔出一把骑兵军刀，摆出击剑的姿势。<b>你面对的是一个无头骑士！</b>");
         startCombat(new Dullahan());
      }
      
      public function dullahanIntroRude() : void
      {
         spriteSelect(SpriteDb.get_dullsprite());
         clearOutput();
         outputText("在森林里走动时，你听到熟悉的马蹄在地上飞驰的声音。");
         outputText("[pg]你小心翼翼地走着，准备好你的[weapon]以防任何袭击者，但不久之后，声音停止了。");
         outputText("[pg]你听到身后树叶沙沙作响，转过身去，却惊讶地看到一匹巨大的黑马，上面骑着一个披着斗篷的骑士！是无头骑士！这次她没有费心去介绍或威胁，直接向你冲来！");
         var _loc1_:Monster = new DullahanHorse();
         startCombat(_loc1_);
         _loc1_.extraDistance = 2;
         _loc1_.distance = CombatDistance.Distant;
      }
      
      public function dullahanIntroPostDream() : void
      {
         var _gthis:DullahanScene = this;
         spriteSelect(SpriteDb.get_dullsprite());
         clearOutput();
         outputText("你在四处走动时，远远地看到了骑在马上的伊芙琳。你大声吹了声口哨，看到她发现你时，白色的头发在空中迅速飘动。她的坐骑转向了你。");
         outputText("[pg]在快要到达你面前时，伊芙琳在马还在奔跑时危险地下了马，但成功地双脚着地。下马的惯性带着她的身体撞向你，她用双臂环抱住你，而马最终在你身后几米处停下。你回抱了她，但没过多久你就注意到她的头奇怪地不见了。");
         outputText("[pg]然后你听到从别处传来一声痛苦的叫喊。");
         outputText("[pg]你低头一看，发现了她的头，尽管摔得很难看，但仍在微笑。她今晚似乎格外精神，你能想象到原因。");
         outputText("[pg]你捡起她的头，小心翼翼地放在她的脖子上，不确定到底是什么让这两部分“连接”起来。然而，她的身体帮助了你，轻轻地握住你的手，帮你把她对齐。她短暂地转动并伸展了她的头和脖子，确保它正确就位。");
         outputText("[pg]解决了这个问题后，你诚实地问她，你在喀耳刻的幻象中经历的，是否就是她真正想要的你们两人的未来。");
         outputText("[pg]她惊讶了片刻，但随后放松下来，害羞地点了点头。[say: 喀耳刻告诉你的，是吗？真是守不住秘密——不过是的，那是真的。] 她叹了口气，不知道该如何表达自己的感受。[say: 如果在很久以前，我还在世的时候，你就在我身边……] 她的声音渐渐变小。她的脸绷紧了，但慢慢放松下来，直到完全平静，仿佛她正在放下那个不可能的梦想。");
         outputText("[pg][say: ……我已经接受了我作为亡灵的命运，以及随之而来的一切。我没有沉湎于此；我只是日复一日地过着，不确定我何时会迎来终结，如果真的有的话，只是尽我所能履行我作为超自然幽灵的“职责”。这就是我应对的方式，] 她说着，转过身去避免面对你。");
         outputText("[pg]她仰望天空，深吸了一口气。[say: 当你出现时，我感觉我几十年来一直忽视的人性再次被点燃了。]");
         outputText("[pg]她转过身看着你。[say: 我讨厌这种感觉，[name]。因为它迫使我想起我做过的事，以及我失去的东西。我曾短暂地想过躲开你，这样我就可以回到我的伪装中，无视我的过去。]");
         outputText("[pg]她试图在眼泪流下之前，巧妙地擦去朦胧的泪眼。[say: 但你不断地回来，不断地提醒我曾经的生活。当很明显我再也无法忽视它时，我开始想象与我唯一认识的人度过一种不可能的生活。那就是你。]");
         outputText("[pg]她沉默了片刻，空气中只有树叶的沙沙声、湍急的水声和夜间觅食动物的声音。你也保持沉默，不知道该说什么。[say: 我想我以前告诉过你不要沉湎于过去。嗯，有那么一刻，我沉湎于现在，不确定我是否应该尝试再次成为人类。但我已经做出了决定。我不会扔掉命运赐予我的礼物。]");
         outputText("[pg]她吸了吸鼻子，短暂地移开视线，然后又看向你，扭曲着脸，试图忍住眼泪。[say: 没有遗憾。关于过去，关于我的人性，关于我的梦想，关于未来。你现在和我在一起，这就足够了！] 她看起来非常坚定，握紧拳头，用她朦胧的金色眼睛非常严肃地看着你。你真诚地对她微笑，欣赏她的决心。她也回以微笑。");
         outputText("[pg][say: 我知道你接受现在的我，尽管有种种限制，但我们至少可以拥有最接近那个梦想的东西。我想正式确立我们的关系。] 她从刀鞘中拔出一把短刃，走到一棵特别大的树后，在你等待的时候雕刻着什么。过了一会儿，她带着自豪的神情从她的作品前退开。你好奇地走上前去查看。[say: 尽管我不死，但我知道你最终会离世。我无法带走你的灵魂，但是……这样我每天都有可以回归的地方。]");
         outputText("[pg]在一个看起来相当有装饰性的框架里，雕刻上写着“我可能有一天会死去，但一个[if (ismale) {男人|女人}]再次将生命吻入我体内。我将永远珍惜[him]。~ [name] 和伊芙琳”。");
         outputText("[pg]你凝视着这相当出色的雕刻，惊讶于这个通常对爱情害羞的女孩能有多浪漫。伊芙琳紧紧抱住你。[say: 请尽可能活得久一点。为了我。]");
         outputText("[pg]她给了你一个充分的理由。");
         var _loc1_:IMap = KFLAGS.flags;
         FlagDict_Impl_.arrayWriteInt(_loc1_,2675,FlagDict_Impl_.arrayReadInt(_loc1_,2675) + CorruptedCoven.RETURNED_DULLAHAN_POSTDREAM);
         doNext(function():void
         {
            _gthis.clearOutput();
            _gthis.outputText("她吸了吸鼻子，擦去一滴不争气地从眼角滑落的泪水。她平静地对你微笑着，内心真正感到了安宁。");
            _gthis.dullMenu(false);
         });
      }
      
      public function dullahanIntro2() : void
      {
         var _g2:DullahanScene;
         var choice1:int;
         var _g1:DullahanScene;
         var choice:int;
         var _g:DullahanScene;
         spriteSelect(SpriteDb.get_dullsprite());
         clearOutput();
         lust = Utils.rand(100);
         if((FlagDict_Impl_.arrayReadInt(KFLAGS.flags,2675) & CorruptedCoven.BROUGHT_DULLAHAN) != 0 && (FlagDict_Impl_.arrayReadInt(KFLAGS.flags,2675) & CorruptedCoven.RETURNED_DULLAHAN_POSTDREAM) == 0)
         {
            dullahanIntroPostDream();
            return;
         }
         outputText("[Walking]在森林里，你听到熟悉的雷鸣般的马蹄声穿过大地。你转过身，果然，无头骑士凭空出现，试图再次吓唬你。");
         outputText("[pg][say: 闯入——] 无头骑士看到她在和谁说话时停了下来。她从马上下来，向你走来。[say: 很高兴见到你，[name]。我猜如果你不想见我，你就不会在晚上在树林里闲逛了。][pg]");
         if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,2668) < 3)
         {
            outputText("她现在看起来更愿意交谈了。她坐在附近的一块石头上，交叉着双腿，向后靠在手臂上，等着你说些什么。[pg]");
         }
         else if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,2674) == 0)
         {
            clearOutput();
            outputText("[Walking]在森林里，你注意到你靠近了你通常和无头骑士见面的空地。奇怪的是，这次没有雷鸣般的马蹄声。你到达空地，只看到一个沉默、沉思的亡灵女孩，坐在一块突出的石头上。看到你后，她的表情亮了起来，但绝对还是有点不安。[pg]");
            outputText("[say: 谢谢你来，[name]。我已经做出了决定。我们见过面，你已经打败了我足够多次，我相信你有机会纠正这一切。[pg]正如我告诉你的，我曾经是一个家臣。我在附近的一个庄园工作，保护它的领主。一开始他只是一个普通的、漠不关心的领主，但是，过了一段时间，他变了。变得更糟了。他对人们做了不可告人的事情，[name]。我逃跑了，因为我打不过他。]");
            outputText("[pg][say:我以为他只是老死了，但我仍然感觉到他的邪恶在影响着这片土地，影响着我。他可能变成了亡灵，在永恒中继续进行他邪恶的仪式。]");
            outputText("[pg][say: [name]，求你了，去那座庄园，清除这片土地上的邪恶。我知道恶魔是你的首要目标，但如果不加以控制，这……这可能比任何恶魔军团都要糟糕。]");
            outputText("[pg]这确实很突然，但看着她的脸，你能看出她对这种情况的焦虑是真实的。你现在同意帮助她吗？");
            menu();
            _g = this;
            choice = 1;
            addButton(0,"接受",function():void
            {
               _g.manorChoice(choice);
            }).hint("接受她的请求并前往庄园。你可以在完成前离开，但你<b>可能想在接受前先存个档。</b>");
            _g1 = this;
            choice1 = 2;
            addButton(1,"拒绝",function():void
            {
               _g1.manorChoice(choice1);
            }).hint("告诉她你现在还没准备好。");
            return;
         }
         _g2 = this;
         doNext(function():void
         {
            _g2.dullMenu();
         });
      }
      
      public function dullahanIntro() : void
      {
         spriteSelect(SpriteDb.get_dullsprite());
         clearOutput();
         outputText("在森林里走动时，你听到马蹄在地上飞驰的声音。");
         outputText("[pg]你小心翼翼地走着，准备好你的[weapon]以防任何袭击者，但不久之后，声音停止了。");
         outputText("[pg]你听到身后树叶沙沙作响，转过身去，却惊讶地看到一匹巨大的黑马，上面骑着一个披着斗篷的骑士！");
         outputText("[pg][say: 闯入者！] 骑士用一种可怕的恶魔般的声音说道。[say: 这片树林不欢迎你！准备面对……的力量吧！]");
         outputText("[pg]停顿的时间太长了，你忍不住想知道骑士是不是在边走边编。");
         outputText("[pg][say: 死亡的先驱！] 骑士举起巨大的镰刀，以产生戏剧性的冲击力。它注意到这并不是特别有效，于是嘲笑了一声。它抓住恶魔马的缰绳，从你身边疾驰而去。就在你以为它决定放过你的时候，它转过身来，开始向你冲锋！<b>你正在与一个披着斗篷的骑士战斗！</b>");
         var _loc1_:Monster = new DullahanHorse();
         startCombat(_loc1_);
         _loc1_.extraDistance = 2;
         _loc1_.distance = CombatDistance.Distant;
      }
      
      public function dullahanGift(param1:Boolean = false) : void
      {
         var choice:int;
         var _g1:DullahanScene;
         var _g:DullahanScene;
         spriteSelect(SpriteDb.get_dullsprite());
         clearOutput();
         if(!param1)
         {
            outputText("她松开拥抱，淡淡地笑着。[say: 我不能只用一个拥抱就让你走。我有一个更合适的奖励。] 她抓起她那把巨大的镰刀递给你。[pg][say: 这是他控制我的象征。现在他死了，我也不再需要它了。这是一把非常凶悍的好武器，[name]。我想你能好好利用它的。]");
         }
         if(param1)
         {
            FlagDict_Impl_.arrayWriteInt(KFLAGS.flags,2674,3);
         }
         _g = this;
         var _loc2_:Function = function():void
         {
            _g.dullMenu();
         };
         _g1 = this;
         choice = 4;
         var _loc3_:Function = function():void
         {
            _g1.manorChoice(choice);
         };
         get_inventory().takeItem(get_weapons().DULLSC,_loc2_,_loc3_);
      }
      
      public function dullahanFutureAnswer(param1:int = 0) : void
      {
         spriteSelect(SpriteDb.get_dullsprite());
         clearOutput();
         switch(param1)
         {
            case 0:
               outputText("你想了一会儿，然后回答说你可能会回到英格纳姆，庆祝一番，挂起你的武器，享受一个漫长而应得的休息，这才是伟大英雄的待遇。她笑了。");
               outputText("[pg][say: 简单的回答，但和其他回答一样好！用一周的酒精和相当程度的颓废来庆祝，然后你就可以伸展双腿，慢慢变老。你这辈子都不用工作一天，因为，嘿，你是英格纳姆的英雄！听起来不错，我喜欢。]");
               break;
            case 1:
               outputText("你想了一会儿，然后回答说你很可能只会留在玛瑞斯。你喜欢粗犷的生活、冒险、结识新的敌人和朋友。在经历了这一切之后，英格纳姆会显得非常小。");
               outputText("[pg][say: 保持冒险精神，是吧？听起来很有趣。谁知道外面有什么在等着你呢？玛瑞斯有许多隐藏的秘密，也许你就是那个发现它们的人。只要记住，这样的生活很可能是短暂的，无论好坏。燃烧得两倍亮的蜡烛，燃烧的时间只有一半，但如果你不在乎变老，我认为活得长也没有意义。]");
               break;
            case 2:
               outputText("你皱起眉头，眯起眼睛。你会完成你的任务，没错，但你打算就你在恶魔工厂发现的事情与英格纳姆的长老们对质。你不是第一个被这样牺牲的人，但你肯定会是最后一个。");
               outputText("[pg][say: 该死，那太惨了，[name]。我完全支持你报复，只要不牵扯无辜的人。不要在复仇上太疯狂，但如果他们真的做了你说的事，就给那些混蛋点颜色看看。]");
               break;
            case 3:
               outputText("你毫不费力地回答了。如果你打倒了莉希丝，你成为玛瑞斯的下一任统治者才公平！");
               outputText("[pg][say: 嗯，当然，我想，这说得通。不过，你真的想成为统治者吗？我理解荣耀的一面，但可能有很多无聊的责任、嫉妒的朝臣、阴谋、税收，以及其他我甚至不知道自己不喜欢的事情。我敢打赌，那个叫莉希丝的女孩遭受了相当多的背叛和起义，我甚至敢打赌她自己也是通过背叛才走到那一步的。政治世界是腐败的，[name]。如果你真的决定走那条路，只要记住这一点。]");
         }
         outputText("[pg]你把她的话记在心里。偶尔说出自己的想法是件好事。");
         dullTalkMenu(dullahanFuture);
      }
      
      public function dullahanFuture() : void
      {
         var answer3:int;
         var _g3:DullahanScene;
         var answer2:int;
         var _g2:DullahanScene;
         var answer1:int;
         var _g1:DullahanScene;
         var answer:int;
         var _g:DullahanScene;
         spriteSelect(SpriteDb.get_dullsprite());
         clearOutput();
         outputText("你问她现在自由了，对未来有什么计划。她交叉着双腿，看着天空，陷入沉思。[say: 我不知道，[name]。我作为不死怪物的“生命”比作为一个正常女人的时间还要长。很难记住拥有温暖的血液、口渴、饥饿，你知道的，那些通常的生活需求是什么感觉。]");
         outputText("[pg]她对那些自己怀念的简单事物苦笑了一下，然后转向你。[say: 就像我之前告诉你的，我已经放弃了正常的生活。沉湎于过去是没有意义的。我会留在这里，在吓唬地精和小恶魔中寻找乐趣，如果厌倦了，就在这片土地上骑马驰骋。而且，还有一个英雄总是跑到这里来找我聊天，[he]是个很棒的伴侣。] 说完，她露出一个真诚的微笑，轻松地晃动着翘起的腿，以示她的坦诚。");
         outputText("[pg]你也对她笑了笑。考虑到恶魔对一些人所做的事情，情况本来可能会更糟。在随后的沉默中，有一种淡淡的忧郁气氛，但并不让人感到完全不适。");
         outputText("[pg]她突然眯起黑金色的眼睛，好奇地向你倾身。[say: 那你呢，英雄？你的任务完成后，你打算做什么？在你打倒恶魔的国王或女王之后，有什么计划？] 像往常一样，只要你试探她，她就会反击。不过，这确实是个相关的问题。你挠了挠头，试图想出一个回答。");
         menu();
         _g = this;
         answer = 0;
         addButton(0,"回家",function():void
         {
            _g.dullahanFutureAnswer(answer);
         }).hint("你可能只会回到英格纳姆休息。");
         _g1 = this;
         answer1 = 1;
         addButton(1,"留在这里",function():void
         {
            _g1.dullahanFutureAnswer(answer1);
         }).hint("你已经喜欢上了玛瑞斯。你很可能会留下来继续冒险。");
         if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,2024) > 0)
         {
            _g2 = this;
            answer2 = 2;
            addButton(2,"复仇",function():void
            {
               _g2.dullahanFutureAnswer(answer2);
            }).hint("英格纳姆的一些长老应该为他们的谎言付出代价。");
         }
         else
         {
            addButtonDisabled(2,"???","也许继续你的任务会改变你对未来的计划。");
         }
         _g3 = this;
         answer3 = 3;
         addButton(3,"统治玛瑞斯",function():void
         {
            _g3.dullahanFutureAnswer(answer3);
         }).hint("多么愚蠢的问题。你将统治玛瑞斯！");
      }
      
      public function dullahanFinishesYouOff() : void
      {
         spriteSelect(SpriteDb.get_dullsprite());
         clearOutput();
         outputText("你倒下了，虚弱得无法继续战斗。");
         outputText("[pg]无头骑士一边将马刀入鞘，一边向你走来。[say: 我对你的期望更高，[name]。无论是在战斗还是在眼界上。你对“纯洁”的错误追求导致了这一切。]");
         outputText("[pg]你呻吟着，试图爬起来攻击她。[say: 我以为我几十年来第一次有了一个朋友。我想我必须继续寻找。我希望我能把你留在这里，但考虑到你为了和我战斗所付出的努力，我——]她再次拔出马刀，指着你。");
         outputText("[pg]她皱起眉头。[say: 如果我放过你，你会继续追杀我。对吧？试图清除世界上某种可怕的瘟疫，纠正自然界的一个巨大错误。我不能再像命运的囚徒一样生活。我不能——]刀刃在她虚弱的握力中摇晃。");
         outputText("[pg]她呜咽着，将马刀入鞘。[say: 我希望——我希望来世有地方能惩罚你，[name]。因为我做不到。你卸下了我生活中的一个重担，给了我一线希望，然后又摧毁了它，取而代之。我们不会再见面了。]");
         outputText("[pg]女人吹口哨叫来她的马，然后骑了上去。她骑进了森林，在她余下永恒的生命中，她会有意识地避开你。");
         get_combat().cleanupAfterCombat();
         doNext(get_camp().returnToCampUseTwoHours);
      }
      
      public function dullahanCurse() : void
      {
         spriteSelect(SpriteDb.get_dullsprite());
         clearOutput();
         saveContent.talkedAboutCurse = true;
         outputText("你告诉她，你从死灵法师的日记中知道了她的诅咒。她微微皱起眉头。[say: 所以你知道我做过的事。我杀过的人，甚至在我变成亡灵之前。]");
         outputText("[pg]她双臂交叉，显然很伤心，但很坚定。[say: 我想在这一点上，我唯一能问的就是你打算如何处理这些信息。你觉得没关系，还是觉得仅仅消灭死灵法师还不够？]");
         outputText("[pg]她的神情绝对是充满了担忧。");
         menu();
         addButton(0,"治疗",dullCurseCure).hint("告诉她你不在乎她的过去。你只想找到治疗方法。");
         addButton(1,"正义",dullCurseJustice).hint("她绝对不是完全无辜的。她必须为她的罪行付出代价。<b>准备好进行一场殊死搏斗。</b>");
      }
      
      public function dullahanCunnilingus2() : void
      {
         spriteSelect(SpriteDb.get_dullsprite());
         clearOutput();
         outputText("你告诉她不用担心那个，你很乐意为她口交。[say: 我的拿手好戏。希望你能跟上我的节奏！]她说着，已经开始脱衣服了。");
         if(get_player().lib > 50)
         {
            outputText("你非常确信你能打败她。");
         }
         outputText("[pg]她脱得精光，你将无头骑士赤裸的身体尽收眼底。她的身材虽然不像你遇到过的其他人和生物那样夸张，但比例很匀称，E罩杯的乳房与臀部宽度完美匹配，紧致的腰身纤细，呈现出沙漏般的身材。她长长的白发一直垂到臀部，为她淡蓝色的身体提供了绝佳的背景。作为点睛之笔，她那又宽又长的大腿在接触的地方仍然留有“缝隙”。非常适合把你的脸埋进去，你心想。");
         outputText(get_player().clothedOrNaked("你脱下了你的[armor]。","你赤身裸体地站着，为她做好了准备。") + " 她用一种你不知道她能展现出的掠食者般的眼神看着你。她正用那锐利的金色目光将你吞噬。她的下半身也很兴奋，已经肿胀并滴落着淫液。你舔了舔嘴唇，很快你自己也" + (get_player().averageVaginalWetness() > 3 ? "湿透了" : "湿润了") + "");
         outputText("[pg]你们紧紧拥抱在一起，带着肆无忌惮的欲望抚摸着彼此的身体。她亲吻你的嘴唇，然后是你的脖子和锁骨。你予以回敬，很快，你们俩都因渴望而喘息。她捏住你的乳头，让你发出一声愉悦的呻吟。你伸手搂住她的臀部，用手指挑逗她光滑冰冷的小穴，轻轻地抽插。她呻吟着，轻轻咬住你的脖子，几乎无法抑制自己的欲望。");
         outputText("[pg][say: [name]……我真的很需要这个。我们开始吧。] 你用一个湿吻轻轻地把她推倒在草地上。你一边转身，一边用手指描摹她的轮廓，面对她闪闪发光的小穴。你把嘴唇凑近她肿胀的阴蒂，轻轻舔舐。她喘着粗气，然后立刻向前伸出双臂，抓住并把你的臀部拉低到她嘴里。她抓起你的一大口下唇，没有在调情上浪费任何时间；她急切地舔舐你的阴唇，吸吮你的阴蒂，完全吞噬了你的女性特征。你短暂地停止了对她的挑逗，无法承受这突如其来的快感" + (get_player().averageVaginalWetness() > 3 ? "，甚至在她脸上喷了一点" : "") + "。以玛莱的名义，她太擅长这个了！");
         outputText("[pg]不过，你不能一直坐着享受她的服务，因为她的双腿突然在你的头上弹起并合拢，把你的嘴锁在她的阴部。她在你的脸上摩擦着臀部，帮助你取悦她。虽然很明显她的身体有自己的意志，但在这里变得很清楚；没有正常人能在进行如此精湛的口交时具备这样的灵活性。");
         outputText("[pg]在对你小穴的攻势持续进行时，你尽最大努力取悦她，这显然产生了效果，因为她在舔舐之间发出了诱人的呻吟。");
         outputText("[pg]然而，你无法抵挡她，你先高潮了，" + (get_player().averageVaginalWetness() > 3 ? "飞溅" : "涂抹") + "了她一脸的淫液。");
         if(get_player().hasCock())
         {
            outputText("你的肉棒紧紧地压在你和无头骑士之间，也达到了高潮，把你们俩都涂满了精液。");
         }
         outputText("[pg]然而，攻势并没有停止。她想要更多！你加倍努力让她也达到高潮，在荒谬的快感中挣扎，你整个身体都在小幅抽搐，让你失去了控制。随着你更加努力，她的小穴开始收缩，不久之后，你得到了一股冰冷的淫液。高潮对她来说太强烈了，她慢了下来。她的双腿松开了对你头部的锁定，瘫倒在地上。");
         outputText("[pg]尽管筋疲力尽，你们俩之间的欲望仍在涌动，你们留在草地上，互相取悦了几分钟，更加温柔地舔舐着对方，引发了更小、更甜蜜的高潮，让两人在极乐中沉浸了近半个小时。");
         outputText("[pg]过了一段时间，你们俩从一场当之无愧的性爱后小睡中醒来。[say: [name]，你真是太棒了。我期待着再次这样做，] 她一边说，一边穿上衣服。[say: 前提是你能说服我。我不想让这变得太容易。] 她呼唤她的马，几秒钟后她离开了空地。你看着夜空看了一会儿，然后起身回到营地。你今晚会睡得很香。");
         saveContent.seenBody = true;
         get_player().orgasm("Vaginal");
         get_combat().cleanupAfterCombat(get_camp().returnToCampUseFourHours);
      }
      
      public function dullahanCunnilingus() : void
      {
         spriteSelect(SpriteDb.get_dullsprite());
         clearOutput();
         outputText("你走近骑士那颗呻吟着的头颅。她看着你，只是象征性地装出生气的样子。");
         outputText("[pg]你向她展示了你" + (get_player().averageVaginalWetness() >= 4 ? "湿透的" : "湿润的") + "[vagina]，这让她的眼睛睁得大大的。当她移开视线时，她脸红得更厉害了，脸颊的红色与她苍白发蓝的脸形成了鲜明的对比。过了一会儿，她又看向了你。");
         outputText("[pg][say: ……是的]她说道，回答了一个根本不需要问的问题。");
         outputText("[pg]你抓住她的头，除了她那绯红的脸颊外，大部分地方都是冰冷的。你直视着她那黑金相间的眼睛，虽然不同寻常，但绝对很美。她看着你，挑了挑眉，等着你开始。");
         if(get_player().cor < 30)
         {
            outputText("这绝对是你这辈子做过的最奇怪的事情之一。如果你以后回到英格纳姆，这段故事你绝对会只字不提。");
         }
         if(get_player().cor >= 30 && get_player().cor < 60)
         {
            outputText("这片土地真的影响了你。你绝对很兴奋能这么做！");
         }
         if(get_player().cor >= 60)
         {
            outputText("你见识过也做过不少离奇的性行为，但这还是头一遭。你简直等不及了！");
         }
         outputText("[pg]你把她的头推入你的[vagina]，她开始舔舐。她的舌头异常冰冷，让你在最初的几下舔舐中退缩，但没过多久你就习惯了这种不寻常的感觉，并开始享受它。她在这方面非常熟练；她熟练地刺激你的阴唇，挑逗并吸吮你的[clit]，动作慢到足以让你享受她舌头的每一次抚摸，但又快到足以让刺激持续不断。你的呼吸迅速加快，下半身变得无力。很快，你倒在地上，呻吟着，而无头骑士继续对你的小穴进行攻势。");
         outputText("[pg]你难以置信。你思考了片刻；一条冰冷的舌头怎么会感觉这么好？在一次熟练的舔舐之后，你放弃了思考，只是尽可能紧地把无头骑士的头按在你的小穴上。她急切而嘈杂地吸吮着你的淫液，你闭上眼睛，眼球向上翻，沉浸在极乐之中。");
         outputText("[pg]你听到沙沙声，睁开眼睛。你惊讶地看到一双穿着长筒袜的腿和一个湿润的苍白发蓝的小穴出现在你的脸上。无头骑士的身体需要一些帮助！她蹲在你的脸上，你急切地伸出舌头，尽你所能地给予和接受一样多。她在你的嘴唇和鼻子上摩擦，而你则刺激着她异常冰冷的小穴。");
         outputText("[pg]你的舌交似乎产生了效果，因为头颅开始失去镇静，舔阴的动作变得越来越草率和快速。你增加了自己舔舐的强度，你们俩都越来越接近高潮。");
         outputText("[pg]最后，你们俩都达到了极限并喷潮，把女孩的精液弄得对方满脸都是。无头骑士的身体倒在你的身上，你松开了无头骑士的头，无法控制自己的肌肉。你们俩在那里站了一会儿，在冰冷的草地上一起享受高潮的阵痛。你很快就睡着了，感到非常满足。");
         get_player().orgasm("Vaginal");
         outputText("[pg]过了一段时间，你醒了过来，无头骑士已经不见了。你起身向营地走去。你心想：也许，到最后，她真的赢了？");
         saveContent.seenBody = true;
         get_combat().cleanupAfterCombat();
         doNext(get_camp().returnToCampUseFourHours);
      }
      
      public function dullahanBlowjob() : void
      {
         spriteSelect(SpriteDb.get_dullsprite());
         clearOutput();
         var _loc1_:int = get_player().shortestCockIndex();
         outputText("你走近骑士那颗呻吟着的头颅。她看着你，只是象征性地装出生气的样子。");
         outputText("[pg]你向她展示你那渐渐勃起的[cock]，让她睁大了眼睛。她移开视线，脸红得更厉害了，脸颊的绯红与她淡蓝色的脸庞形成了鲜明的对比。过了一会儿，她再次看向你。");
         outputText("[pg][say: ……是的]她说道，回答了一个根本不需要问的问题。");
         outputText("[pg]你抓住她的头，除了她那绯红的脸颊外，大部分地方都是冰冷的。你直视着她那黑金相间的眼睛，虽然不同寻常，但绝对很美。她看着你，挑了挑眉，等着你开始。");
         if(get_player().cor < 30)
         {
            outputText("这绝对是你这辈子做过的最奇怪的事情之一。如果你以后回到英格纳姆，这段故事你绝对会只字不提。");
         }
         if(get_player().cor >= 30 && get_player().cor < 60)
         {
            outputText("这片土地真的影响了你。你绝对很兴奋能这么做！");
         }
         if(get_player().cor >= 60)
         {
            outputText("你见识过也做过不少离奇的性行为，但这还是头一遭。你简直等不及了！");
         }
         outputText("[pg]你把她的头按向你的[cockHead]。她张开嘴，温柔而缓慢地舔舐着它，在你的龟头和她的嘴唇之间拉出一条唾液丝。她的舌头很冷，带来一种奇怪但愉悦的感觉。");
         if(get_player().shortestCockLength() < 9)
         {
            outputText("[pg]你把你的" + get_player().cockDescriptShort(_loc1_) + "推入她的嘴里。你设法让它直抵她的嘴唇，看起来她并没有什么呕吐反射。你前后移动她的头，她有些笨拙地舔舐着，金色的眼睛向上直直地看着你。每次你把肉棒从她嘴里抽出来，她都会舔舐你的龟头，涂抹上更多冰冷的唾液。[pg]你继续在她的嘴里抽插，你们俩都发出越来越强烈的呻吟。");
         }
         else
         {
            outputText("[pg]你把你的" + get_player().cockDescriptShort(_loc1_) + "推入她的嘴里。你确信在进入最初几英寸时就已经达到了极限，但奇怪的是，并没有遇到任何阻力。你继续深入，一种完全异样的感觉包裹住了你的肉棒。没有确切的词语可以形容它；" + (get_player().get_inte() > 60 ? " 诡异" : " 离奇") + "是你所能想到的最好的词。你让它直抵她的嘴唇，尽管你的长度惊人，但她似乎一点也不觉得困扰。你前后移动她的头，她有些笨拙地舔舐着，金色的眼睛向上直直地看着你。每次你把肉棒从她嘴里抽出来，她都会舔舐你的龟头，涂抹上更多冰冷的唾液。[pg]你继续在她的嘴里抽插，你们俩都发出越来越强烈的呻吟。");
         }
         outputText("[pg]你闭上眼睛，专注于这种感觉，抽插得更深，让她在你的肉棒上忙活。这感觉确实很棒，但还不够好。你觉得继续下去的动力正在流失，于是你逐渐放慢了速度。");
         outputText("[pg]就在这时，你感觉到有什么东西从背后抱住了你。一对坚挺的乳房贴在你的背上，手臂环绕着你的胸膛，湿透的双腿缠绕着你的腿。它在你身上推挤和移动了一下，然后松开了你。它绕到前面展示自己；那是无头骑士的身体！她风情万种地走向她那把巨大的镰刀，弯腰捡起它，露出了白色短裙下湿透的内裤。她性感地在镰刀上摩擦，把它压在被皮革包裹的乳房和淡蓝色、结实的大腿上，偶尔转过身弯下腰，刚好让你能瞥见她的内裤，淫液顺着她的腿流下来。");
         outputText("[pg]这充满情欲的展示重新点燃了你的动力。你更用力、更快地抽插，操着无头骑士的头。那具身体决定坐在一块石头上，开始隔着内裤自慰，时不时地让你快速瞥见她的屁股和小穴来挑逗你。");
         outputText("[pg]这一次，没过多久你就达到了极限。你尽可能深地把自己推入无头骑士的嘴里，然后释放出来。");
         if(get_player().cumQ() > 500)
         {
            outputText("尽管你平时的射精量巨大，但她似乎毫不费力地把它们全吞了下去。事实上，她似乎根本没注意到你射了。就好像她的嘴里是一个无底洞。");
         }
         else
         {
            outputText("她毫不费力地热切吞下了你的精液。");
         }
         outputText("[pg]随着高潮的余韵消退，你深吸了一口气。你看着无头骑士的脸。从她半闭的眼睛和愉悦的呻吟来看，她似乎也达到了自己的高潮。你把肉棒从她嘴里抽出来，浓稠的唾液和精液丝将它与她的嘴唇连在一起。你看着她的身体。很明显，它也在享受着高潮最后的悸动。");
         outputText("[pg]你懒洋洋地走到她的身体旁，把她的头重新接上。[say: 我会报仇的……]她低声说着，然后睡着了。");
         outputText("[pg]真是个美妙的夜晚。你心满意足地回到了营地。");
         get_player().orgasm("Dick");
         saveContent.seenBody = true;
         get_combat().cleanupAfterCombat(get_camp().returnToCampUseTwoHours);
      }
      
      public function dullThighjob() : void
      {
         spriteSelect(SpriteDb.get_dullsprite());
         clearOutput();
         outputText("你看着她那双穿着黑色过膝靴、被白色短裙遮盖的粗壮而结实的腿，提议说有个折中的办法。");
         outputText("[pg][say: 嗯？哦！好啊，听起来很有趣！]她说着，脱下了靴子。你告诉她把大腿袜留着。她调皮地看了你一眼，脸颊也变得更红了。");
         outputText("当她诱惑地向你走来时，你开始" + get_player().clothedOrNakedLower("脱下你的[armor]","抚摸你的[cock]") + "。她不常展示，但她拥有迷人的身材；她的资本虽然不像你见过的其他一些人和生物那样极端，但比例匀称，E罩杯的乳房与臀部的宽度完美匹配，紧致的腰部足够纤细，让她呈现出沙漏般的身材。作为点睛之笔，她那宽大修长的大腿在接触的地方仍然留有“缝隙”。");
         outputText("[pg]她突然拉近了你们之间的距离，双手环抱住你的臀部，将你紧紧拉向她。她的脸庞和黑金色的眼眸中流露出你从未见过的真诚欲望。感受到她完美的身体如此紧密地贴着你，[eachCock]立刻精神抖擞地挺立起来。" + (int(get_player().cocks.length) == 1 ? "它滑入" : "它们滑入") + "无头骑士的双腿之间，每一次兴奋的跳动都几乎要触碰到她湿润的阴唇。");
         outputText("[pg]你认真地考虑过无视她的限制，直接插进她体内，但当她紧紧夹住大腿，开始缓慢地前后移动时，这个念头就烟消云散了。由于缺乏润滑，起初的感觉有些粗糙，但在几次抽插之后，她冰冷的爱液和你自己的先列腺液浸湿了她的大腿，你开始顺畅地滑动，感受着她坚实完美的肌肤和大腿袜的质感挑逗着[eachCock]的每一寸。这种感觉既令人愉悦地柔软，又带着恰到好处的粗糙；混合在一起的触感简直不可思议。");
         outputText("[pg]她轻柔地亲吻着你的脖子，双手在你的背部和臀部游走，随着她抽插的速度越来越快，快感也随之不断攀升。");
         if(get_player().longestCockLength() >= 10)
         {
            outputText("[pg]抽插的速度加快了，但你注意到每次滑过她的大腿时，都会有一阵令人不悦的冷风吹过。深夜的森林空气确实很冷，冷得连平时体温偏低的无头骑士都显得格外温暖。仿佛看穿了你的心思，她开始微笑着点头。[pg]她松开抱住你的双手，将头从躯干上取下，然后把它举在身后。你起初不明白她为什么这么做，直到你再次深深地挺进。你没有感觉到冷风，而是感觉到了一张嘴的内部，以及一条湿滑的舌头在舔舐你的[cockHead]。这种感觉真是太美妙了。你绝对无法和任何正常的女人做到这一点！");
         }
         outputText("[pg]你用双臂紧紧抱住无头骑士，开始向上挺动，每一次动作都在挑逗她的阴蒂和阴唇，并亲吻着她的菊穴。她开始呻吟，双腿更加紧密地夹住你的肉棒，越来越多的爱液喷洒在你的[cocks]上。你开始更剧烈地跳动，抽插也变得毫无规律，完全无法承受这股强烈的快感。");
         outputText("[pg]快感最终淹没了你，你在她的大腿间滑动时射精了，");
         if(get_player().cumQ() <= 100)
         {
            outputText("你的精液弄脏了她的大腿袜和裙子");
         }
         if(get_player().cumQ() <= 500 && get_player().cumQ() > 100)
         {
            outputText("每一次抽插都将你大量的精液溅在她的衣服上");
         }
         if(get_player().cumQ() > 500)
         {
            outputText("你的精液完全浸透了她的衣服和双腿");
         }
         if(get_player().longestCockLength() >= 10)
         {
            outputText("甚至还有一些溅到了无头骑士的脸上");
         }
         outputText("。在几次无力的抽插后，你的高潮终于结束了。你从她身上抽离，你的[cocks]和她小穴里混合的汁液在你们之间拉出几道黏稠的丝线。");
         if(get_player().longestCockLength() >= 10)
         {
            outputText("她把头重新安回肩膀上。");
         }
         outputText("你注意到她并没有高潮，而且正大口喘着粗气。很明显，她比以往任何时候都要兴奋。");
         outputText("[pg]你问她是否需要你帮她解决，但她拒绝了。");
         outputText("[pg][say: 哦，相信我。我待会儿会用这个好好享受<b>一番</b>的，]她说着，从后面抚摸着自己滴着爱液的阴唇。[say: 刚才真是太爽了！我没想到光用大腿就能让人射出来。]");
         outputText("[pg][say: 好了，嗯——在我们刚做完那种事之后说这个有点傻——但我想要点私人空间。下次再来玩哦！]");
         outputText("[pg]她缓慢而尴尬地后退了几步，然后冲向她的坐骑。她跨上马背，向着更隐蔽的地方疾驰而去。好吧，你从这场切磋中得到了你想要的。");
         saveContent.seenBody = true;
         get_player().orgasm("Dick");
         get_combat().cleanupAfterCombat(get_camp().returnToCampUseTwoHours);
      }
      
      public function dullTentacleFun() : void
      {
         spriteSelect(SpriteDb.get_dullsprite());
         clearOutput();
         outputText("你问她是否愿意尝试一些非常不同的东西。她环顾四周，思考着。[say:你有什么想法？什么东西这么“非常”不同？]");
         outputText(get_player().clothedOrNakedLower("你脱下你的[armor]，向她展示你那束蠕动的触手状肉棒。","你指着你那束蠕动的触手状肉棒，就好像她没注意到一样。") + " 你摸了摸它们，它们就醒了过来，变成紫红色，表面布满水分，盲目地寻找可以摩擦的东西。");
         outputText("[pg][say:天哪，就在我以为我已经见识过世面的时候。除了那些触手怪，我从来没见过这些东西！]她有些惊恐地说。[say:我不确定这行不行得通，[name]。]");
         outputText("[pg]这位亡灵女子发出一声尖锐的“呀！”，因为她感觉到有什么东西滑到了她的裙子底下，在她的屁股周围摩擦，在她的脸颊上留下了一道先列腺液的痕迹。她转过身抓住它，把它从身下拽了出来。她把它拿到脸前，仔细地分析着[say:什么——这东西什么时候跑到那儿去的？你是怎么控制这些东西的？]她问道，用眼睛解剖着蘑菇状的龟头和球状、弯曲的肉棒。");
         outputText("[pg]你耸了耸肩。你就是能做到。");
         outputText("[pg]现在，你注意到她蓝色的脸颊明显发紫。她越来越饥渴地盯着变宽的龟头，呼吸加快，一滴先列腺液在尖端形成。[say:嗯。我，你知道的。这——]她停止了说话。");
         outputText("[pg]她咽了口唾沫做准备，然后轻轻舔了舔还在她手里挣扎的入侵肉棒。作为奖励，她的脸上瞬间喷出了一股先列腺液，但这只会激励她继续下去。她张开嘴，吞下了张开的龟头，引得你发出一声微弱的呻吟。");
         outputText("[pg]她开始急切地吸吮，随着情欲的逐渐高涨，她的动作也越来越快。她闭上了眼睛，而你看到了出手的绝佳时机。");
         outputText("[pg]她睁开眼睛，惊讶地抽搐了一下，因为一根触手正顺着她的一条腿向上滑行。她低下头，嘴里还含着一根肉棒，疑惑地看着你。你露出得意的笑容，另一根肉棒缠绕住她的腹部，将她举到半空中，惹得她发出一声闷叫。");
         outputText("[pg]她把第一根肉棒拔了出来，这根肉棒已经深入她那深不见底的喉咙好几英寸了。她在半空中挥舞着手臂，冲你大喊：[say:[name]！马上把我放下来！这可不是开——]她的话被一声充满情欲的呻吟打断了，她张开嘴，因为一根大胆的触手开始摩擦她的阴蒂。她手里的肉棒见机行事，迅速再次塞进了她的嘴里。");
         outputText("[pg]然而，你的努力奏效了，她的挣扎渐渐失去了力气，开始享受这场非自然的性爱。一根触手滑入她的紧身胸衣，向她的乳房推进并将其包裹。随着对乳头的挤压和轻柔摩擦，她终于开始尽情享受眼前的处境，伴随着喷出的淫水和一声响亮的呻吟，宣告了自己的败北。");
         outputText("[pg]她紧紧合拢有力的双腿，夹住那根在她下体唇瓣上作乱的触手，开始挺动腰肢，用小穴在龟头上摩擦，而触手也以同样的方式回应她。你拼尽全力才克制住自己没有深深插入她的体内，但你颤抖着，集中注意力，继续挑逗她的敏感点。与此同时，她勤奋地吸吮着你的第一根肉棒，偶尔将其从她那无底洞般的喉咙深处拔出，舔舐并亲吻龟头。");
         if(get_player().countCocksOfType(CockTypesEnum.TENTACLE) > 4)
         {
            outputText("[pg]一根较慢、更不情愿的肉棒终于向她靠近，羞涩地戳了戳她的脸颊，寻求关注。在情欲的笼罩下，她半眯着眼睛看向这根多出来的肉棒。她再次呻吟了一声，伸出空闲的手臂抓住了它。她再次把嘴里的肉棒拔出来，开始用嘴唇伺候这根新来的。为了保持公平，她在两根肉棒之间交替关注，每次抚摸其中一根时，都会得到大量先列腺液的奖励。");
         }
         if(get_player().hasVagina() && get_player().countCocksOfType(CockTypesEnum.TENTACLE) <= 5)
         {
            outputText("[pg]当你的众多肉棒在亡灵女孩身上施展魔力时，你将几根手指插入自己湿润、隐隐作痛的小穴。你真希望自己还有一根触手肉棒，这样你就可以一边看着这淫靡的景象，一边操自己了！");
         }
         if(get_player().hasVagina() && get_player().countCocksOfType(CockTypesEnum.TENTACLE) > 5)
         {
            outputText("[pg]你自己的小穴也因为渴望而刺痛，充血肿胀，被这淫靡的景象激起了强烈的欲望。看到你还有一根多余的肉棒可用，你把它移向自己的嘴唇，迅速开始操自己，沉浸在无头骑士身体和你自己小穴带来的快感中。");
         }
         outputText("[pg]她的身体现在覆盖着黏糊糊的先列腺液，你几乎站立不稳，一群肉棒品尝那具健美躯体所带来的快感，是任何生物都无法承受的。感觉到自己即将高潮，你努力将她轻轻放回地面。");
         outputText("[pg]当她沾满先列腺液的身体一接触到地面，你就把所有的肉棒都对准她，伴随着一声响亮的呻吟射精了。");
         if(get_player().cumQ() <= 100)
         {
            outputText("[pg]每根肉棒都在她的身体上射了几股精液。仍然沉浸在快感中的无头骑士用手将精液涂抹在身上，将其作为润滑剂，更轻松地挑逗自己的乳头和阴唇。");
         }
         if(get_player().cumQ() <= 500 && get_player().cumQ() > 100)
         {
            outputText("[pg]每根肉棒都在她健美的身体和衣服上射满了精液。仍然沉浸在快感中的无头骑士用手将精液涂抹在身上，将其作为润滑剂，更轻松地挑逗自己的乳头和阴唇。");
         }
         if(get_player().cumQ() > 500)
         {
            outputText("[pg]每根肉棒都用精液把她健美的身体完全浸透了。她快乐地在形成的黏液池中扭动，沉醉于快感之中，挺动着臀部，揉捏着坚挺的乳头。");
         }
         if(get_player().hasVagina() && get_player().countCocksOfType(CockTypesEnum.TENTACLE) > 5)
         {
            outputText("[pg]你体内的肉棒也高潮了，你的[vagina]快乐地榨干了它能提供的每一滴精液。");
         }
         outputText("[pg]你倒在地上，被如此多重高潮同时爆发的力量所淹没。无头骑士恢复了理智，慵懒地向你爬来。她抱住你，轻轻吻了你一下，然后睡着了。");
         if(get_player().lib + get_player().cor > 60)
         {
            outputText("你早就顾不上和一个从头到脚沾满精液的人依偎在一起了。");
         }
         else
         {
            outputText("和一个被精液彻底浸透的人依偎在一起有点麻烦，但你太累了，没过多久就睡着了。");
         }
         outputText("[pg]总的来说，这是一个不错的夜晚。");
         saveContent.seenBody = true;
         doNext(get_camp().returnToCampUseTwoHours);
      }
      
      public function dullTalkMenu(param1:Object = undefined) : void
      {
         var _g1:DullahanScene;
         var _g:DullahanScene;
         menu();
         _g = this;
         if(param1 == function():void
         {
            _g.dullMenu();
         })
         {
            clearOutput();
            outputText("这是你稍微探究一下这位骑士想法的机会。她似乎很乐意回答问题，甚至可能渴望被提问。");
         }
         addNextButton("关于惊吓",askAboutDullSpooks).hint("问她为什么试图吓唬她看到的每个人。").disableIf(param1 == askAboutDullSpooks);
         addNextButton("故事？",askAboutDullStory).hint("交换人生故事。").disableIf(param1 == askAboutDullStory);
         if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,2673) == 7 && FlagDict_Impl_.arrayReadInt(KFLAGS.flags,2674) == 3)
         {
            addNextButton("未来",dullahanFuture).hint("问问她既然死灵法师死了，她有什么计划。").disableIf(param1 == dullahanFuture);
            addNextButton("诅咒",dullahanCurse).hint("问问她关于诅咒的事，她是怎么被诅咒的，以及如何解除诅咒。").disableIf(param1 == dullahanCurse);
            addNextButton("马的名字",dullAskHorse).hint("拥有这样的坐骑，怎么能不给它起个名字呢？").disableIf(param1 == dullAskHorse);
         }
         if((FlagDict_Impl_.arrayReadInt(KFLAGS.flags,2675) & CorruptedCoven.TALKED_MANOR_DULLAHAN) != 0 && (FlagDict_Impl_.arrayReadInt(KFLAGS.flags,2675) & CorruptedCoven.BROUGHT_DULLAHAN) == 0)
         {
            addNextButton("喀耳刻",talkCirceOffer).hint("向她转达喀耳刻的邀请。");
         }
         if((FlagDict_Impl_.arrayReadInt(KFLAGS.flags,2675) & CorruptedCoven.RETURNED_DULLAHAN_POSTDREAM) != 0)
         {
            addNextButton("想我吗？",dullAskMiss).hint("问问她，你不在的时候她会不会想你。").disableIf(param1 == dullAskMiss);
         }
         _g1 = this;
         setExitButton("返回",function():void
         {
            _g1.dullMenu();
         });
      }
      
      public function dullStory1(param1:Boolean) : void
      {
         spriteSelect(SpriteDb.get_dullsprite());
         if(param1)
         {
            outputText("[pg]你深吸了一口气，回答说，事实上，你确实想念。你想念英格纳姆简单的生活。玛瑞斯并不全是坏事，但你梦想着过一种安静、平淡、正常的生活。");
            outputText("[pg]她点点头，腼腆地笑了。[say: 我懂。我也花了一段时间才接受我的新……生活。我只希望你能在这个新世界里找到你认为值得为之活下去的东西。你可能很想念你的家人、老朋友等等。但如果一直提醒自己想起他们，可能会太痛苦了。]");
         }
         else
         {
            outputText("[pg]你挑了挑眉，回答说，事实上，你并不想念。你很享受这种充满奇迹的感觉，这些新发现，这些新朋友和新敌人。你觉得在玛瑞斯这短暂的停留中，你经历的甚至比在英格纳姆度过的所有岁月还要丰富。");
            outputText("[pg]她点点头，腼腆地笑了。[say: 这就对了。有时候很难控制生活的走向，但几乎总有一些值得为之活下去的东西。我尽力忘记过去的生活，决定用全新的自己做点什么。这可能没什么建设性，但绝对很有趣。]");
         }
         outputText("[pg]她深吸了一口气。[say: 我的故事和你的有点像。我也曾经过着简单的生活，只是这片森林里一座庄园的侍卫。我被杀的时候才二十四岁。然后我就变成了……这样。我花了一段时间才接受我的新生活。我现在大概有一百岁了，但当你不再变老时，就很难确切知道了。真的就这些，我的故事简单得让人难以置信。]");
         outputText("[pg]你眯起眼睛，告诉她她还没说她到底是怎么死的，以及她一开始为什么会变成亡灵。见鬼，她甚至都没告诉你她的名字！");
         outputText("[pg][say: 这就是忘记过去生活的那部分。我不想谈论这个，抱歉。我是一个无头骑士，不是什么年轻的侍卫。你是英格纳姆的勇者，也不是英格纳姆随便哪个乡巴佬。]");
         outputText("[pg]你点了点头表示理解。看来你是无法从她嘴里撬出这些信息了。");
         dullTalkMenu(askAboutDullStory);
      }
      
      public function dullSexRefused() : void
      {
         spriteSelect(SpriteDb.get_dullsprite());
         clearOutput();
         outputText("在那段尴尬的对话之后，你决定回到营地。你们友好地分开了，尽管被拒绝让你有点受伤。");
         doNext(get_camp().returnToCampUseTwoHours);
      }
      
      public function dullOhYouFuckedUpPT2() : void
      {
         spriteSelect(SpriteDb.get_dullsprite());
         clearOutput();
         if(get_player().lib >= 80 && get_player().get_tou() >= 95 && get_player().get_HP() - 700 > 0)
         {
            outputText("你醒了过来，感觉好像有什么东西试图把你的灵魂从身体里撕裂出来。你身上的每一块肌肉都疼得厉害，甚至那些你不知道会疼的肌肉也是如此。你的[cock]尤其酸痛。");
            outputText("[pg]你呻吟着站起来，扫视了一下四周。无头骑士的身体——还有头——都不见了。你确认了所有的装备都在原位，并检查了周围的区域。尽管你们经历了如此狂暴的性爱，地上却没有留下任何你精液的痕迹。她不知怎么地把它们全都包揽了。");
            outputText("[pg]你回到了营地。在那次强暴之后，你确信<b>你再也不会遇到无头骑士了</b>。");
            dynStats(DynStat.Str(-15),DynStat.Tou(-15),DynStat.Spe(-15));
            get_player().takeDamage(700);
            FlagDict_Impl_.arrayWriteInt(KFLAGS.flags,2660,2);
            doNext(get_camp().returnToCampUseFourHours);
         }
         else
         {
            outputText("经过一个小时和数百次的射精，她终于停止了在你身上的磨蹭。现在，你的身体已经变成了一具干瘪、空洞的躯壳。在你们交媾的某个时刻，你把灵魂射成了原始的魔晶，随后，你剩余的生命力也被榨干了。");
            outputText("她站起身，穿上了内裤。没有一滴你的精液——或者你的魔晶——从她依然紧闭的蓝色阴唇中漏出。她在没有头颅指引的情况下走进了黑暗，仿佛被某个邪恶的傀儡师控制和引导着。");
            outputText("[pg]你的身体躺在冰冷的森林草地上，毫无生气且干瘪，你的灵魂被抽干，成为了某种不可名状仪式的资源。你剩下的部分很快就被灌木丛吞噬，你长满青苔的骨头成为了玛瑞斯唯一能想起英格纳姆勇者的东西。");
            get_game().gameOver();
         }
      }
      
      public function dullOhYouFuckedUp(param1:Boolean = false) : void
      {
         spriteSelect(SpriteDb.get_dullsprite());
         clearOutput();
         if(!param1)
         {
            outputText("你走近无头骑士，已经" + get_player().clothedOrNakedLower("脱下了你的[armor]","抚摸着你的[cock]") + "。她睁大了眼睛，试图向后退，但她的身体背叛了她，站了起来，向你款款走来。");
            outputText("[pg][say:[name]，这是个糟糕的主意。你不明白这有多愚蠢！我的身体会——]她的一只手捂住了自己的嘴，让她安静下来，很快她就从自己的身体上分离出来，被扔过了灌木丛，尖叫着。她现在不会打扰任何人了。");
            outputText("[pg]无头骑士的身体把你推倒在地上。她迅速脱下内裤，跨坐在你身上，她淡蓝色的小穴就停在离你阴茎几英寸的地方。看到一具无头尸体在你上面相当令人不安，但那坚挺的乳房和健美的双腿足以弥补这一点。");
            outputText("她将身体降下，完全吞没了你的[cock]，并在完全没入后扭动臀部，以充分品尝你的阴茎。她用一种你不知道阴道能有的紧致感挤压着它，那种冰冷感让这种感觉变得真正独特。然而，真正让这种感觉与众不同的是你阴茎前端正在发生的事情。那是某种超凡脱俗的东西，超出了人类的理解。你立刻向后仰起头，在做爱真正开始之前就被带到了高潮的边缘。");
         }
         outputText("[pg]你大声呻吟，这促使无头骑士的身体开始移动。她熟练而有力地在你的阴茎上摩擦和骑乘。由于她没有嘴，所以她没有呻吟，但她臀部的摩擦加上她丰富的淫液在你的胯部作用，创造出一种极其性感和色情的声音。");
         outputText("[pg]你开始抓挠地面，然后把手放在她被裙子覆盖的臀部上，被欲望淹没，更用力地挺动。她借此机会把手从你的胸膛上移开，隔着皮革紧身胸衣揉捏她的乳头，同时继续勤奋地榨取你的阴茎。");
         outputText("[pg]没过多久你就达到了高潮。你射在她体内，暂时得到了释放。然而，她并没有停止在你身上摩擦，你很快发现自己又射精了。");
         outputText("[pg]你微笑着，因为你的[cock]在她体内几乎瞬间就充血勃起了，让你充满了更多的欲望。对于一个不想被插入的女人来说，她被操起来真是太美味了！[pg]");
         outputText("你看到她坚挺的乳房在你的脸上弹跳晃动，你的嘴巴因渴望而流口水。你抓住她的手，把它们从她的乳房上拉开，向她传达了一个她立刻回应的信息。她向你弯下腰，让你的嘴可以轻松地接触到她的乳头。你轻轻地咬和舔，欣赏着她坚硬乳头的质感和硬度，她明显地颤抖了一下，更紧地夹住了你的阴茎。你敢打赌，如果她有嘴的话，现在一定会大声呻吟。");
         outputText("嘴里含着她的乳房，加上她那不可思议的小穴榨取着你的肉棒，这感觉实在太强烈了。你再次射精。这真是一次美妙的性爱！");
         outputText("[pg]但这一切并没有结束。她继续磨蹭着，你的肉棒再次勃起，就好像什么都没发生过一样。");
         if(get_player().lib < 30)
         {
            outputText("考虑到你平时的性欲，这绝对不寻常。");
         }
         else if(get_player().lib < 60)
         {
            outputText("你习惯了在做爱中不知疲倦，但这感觉很独特！");
         }
         else
         {
            outputText("这是你那疯狂性欲的结果吗？");
         }
         outputText("[pg]又来了。尽管你只想结束这一切好好休息，但你还是在无休止地高潮。在整个过程中，无头骑士的身体不断地磨蹭着，把她的乳房推到你的脸上，乞求更多的刺激。");
         outputText("[pg]尽管你已经经历了数十次连续的高潮，但你似乎每一次都能强有力地射精。快感不断增加，很快你的理智就彻底崩溃了。你的脑海中只剩下两种感觉：永远在逼近的下一次高潮，以及力量被彻底抽干的虚弱感。");
         outputText("[pg]你的视线变得模糊，失去了意识。在你昏迷的时候，无头骑士的身体继续磨蹭着，尽管它的主人已经失去了意识，你的[cock]依然坚挺。在你的梦里，除了虚无什么也看不见。");
         doNext(dullOhYouFuckedUpPT2);
      }
      
      public function dullNoDate() : void
      {
         var _g:DullahanScene;
         spriteSelect(SpriteDb.get_dullsprite());
         clearOutput();
         outputText("你告诉她你改变主意了，不想约会了。她试图掩饰，但显然很失望。");
         outputText("[pg][say: 看来还是你笑到了最后。真会捉弄人，[name]！]她双臂交叉着说道。");
         _g = this;
         doNext(function():void
         {
            _g.dullMenu();
         });
      }
      
      public function dullMenu(param1:Boolean = true) : void
      {
         var postponed:Boolean;
         var _g4:DullahanScene;
         var choice1:int;
         var _g3:DullahanScene;
         var choice:int;
         var _g2:DullahanScene;
         var lastFunc:Object;
         var _g1:DullahanScene;
         var _g:DullahanScene;
         if(param1)
         {
            clearOutput();
            spriteSelect(SpriteDb.get_dullsprite());
            switch(Utils.rand(4))
            {
               case 0:
                  outputText("她慵懒地用一只穿着铠甲的脚踩断了几根细树枝。除非你找点话题，否则她似乎不打算继续交谈。");
                  break;
               case 1:
                  outputText("她吹开挡在脸上的几缕头发。但它们又固执地飘回了原处。");
                  break;
               case 2:
                  outputText("[Dullhorse]凑了过来，走向这个亡灵女孩。她微笑着轻轻抚摸了它一会儿，直到它被其他东西吸引了注意力。");
                  break;
               case 3:
                  outputText("她坐着，松开双腿又重新交叠起来，让你瞥见了她的内裤。从她脸上的表情来看，这并没有什么特别的意思，但考虑到她那具自主行动的身体，也很难说得准。");
            }
         }
         menu();
         addButton(0,"外貌",dullAppearance).hint("看看她。");
         _g = this;
         _g1 = this;
         lastFunc = function():void
         {
            _g1.dullMenu();
         };
         addButton(1,"交谈",function():void
         {
            _g.dullTalkMenu(lastFunc);
         }).hint("和她聊聊天。");
         if(get_player().get_lust() >= 33)
         {
            addButton(2,"做爱？",askDullSex).hint("请求做爱。主动出击从来不会吃亏。");
         }
         else
         {
            addButtonDisabled(2,"做爱？","你现在不够兴奋，不想做爱。");
         }
         if(get_player().get_HP() > 1)
         {
            addButton(3,"切磋",sparDull).hint("问她有没有兴趣切磋一下。");
         }
         else
         {
            addButtonDisabled(3,"切磋","你现在的状态不适合和她战斗！");
         }
         if((FlagDict_Impl_.arrayReadInt(KFLAGS.flags,2675) & CorruptedCoven.RETURNED_DULLAHAN_POSTDREAM) != 0)
         {
            addButton(5,"约会",dullDates).hint("邀请她去约会。");
         }
         if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,2668) >= 3 && !get_player().hasPerk(PerkLib.CounterAB))
         {
            addButton(10,"她的技能",learnSkill).hint("问问她独特的战斗姿势。");
         }
         if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,2674) == 2)
         {
            _g2 = this;
            choice = 1;
            addRowButton(2,"庄园",function():void
            {
               _g2.manorChoice(choice);
            }).hint("接受她的请求，前往庄园。");
         }
         if((FlagDict_Impl_.arrayReadInt(KFLAGS.flags,2671) & 0x80) != 0 && FlagDict_Impl_.arrayReadInt(KFLAGS.flags,2674) != 3)
         {
            _g3 = this;
            choice1 = 3;
            addRowButton(2,"死灵法师",function():void
            {
               _g3.manorChoice(choice1);
            }).hint("告诉她你已经杀死了死灵法师。");
         }
         if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,2674) == 4)
         {
            _g4 = this;
            postponed = true;
            addRowButton(2,"镰刀",function():void
            {
               _g4.dullahanGift(postponed);
            }).hint("拿走无头骑士的镰刀。");
         }
         addButton(14,"离开",dullLeave).hint("道别并离开。");
      }
      
      public function dullLeave() : void
      {
         spriteSelect(SpriteDb.get_dullsprite());
         clearOutput();
         outputText("你看了看夜空，注意了一下月亮的位置，然后告诉无头骑士你该回营地了。");
         outputText("[say: 好的。祝你有个美好的夜晚，]她说着，已经准备上马了。");
         doNext(get_camp().returnToCampUseOneHour);
      }
      
      public function dullFinishForestDate(param1:Boolean) : void
      {
         spriteSelect(SpriteDb.get_dullsprite());
         clearOutput();
         cheatTime(6);
         outputText("你们俩躺在一起，沉默了几分钟。从那以后，一些蜡烛的火焰终于熄灭了，慢慢地使这个区域变暗。她平时的防备完全放下了，感觉这个战士的身体在你旁边完全没有防御能力。她的眼睛现在闭上了，她缓慢的呼吸抚摸着你的脖子和脸颊。看来她开始睡着了。你慢慢地按摩她赤裸的背部。她冰冷赤裸的身体压在你身上的感觉几乎让你想再来一回合，但现在最好还是放松一下。你的眼睛也开始闭上，留下[dullhorse]看着你们俩。[if (silly) { 你突然想到，当你和伊芙琳胡闹时，你从来没有注意到这匹马。对她来说，只是看着一定很尴尬。你把这个想法从脑海中甩掉。}] 在你入睡之前，伊芙琳突然开口说话，几乎没有醒来。[say: 嘿。喀耳刻的幻象……你喜欢吗？] 你回答了，但她没有听到，因为她只是进一步进入了梦乡。她的呼吸变得深沉而缓慢，你觉得这很平静。你的眼皮感觉很重。");
         outputText("[pg]你被什么东西抓住了而醒来。所有的蜡烛都熄灭了，只有月亮透过上面的树叶提供光线。当你注意到抓住你的是伊芙琳时，你平静下来，但她脸上带着痛苦的表情。然而，她还在睡觉，所以你认为她在做噩梦。你再次抚摸她的背。" + (param1 ? "她稍微平静了一点，但她似乎仍然很痛苦。" : "她脸上的表情融化了，她的身体松开了抓握；她回到了平静的睡眠状态。") + " 睡意再次袭来。[pg]阳光透过上面的树叶明亮地照耀着，唤醒了你。你也摇醒了伊芙琳。她稍微抵抗了一下，但最终还是起床了。你们俩重新穿好衣服，清理了营地。你挠了挠头，因为你现在才想到你甚至没有使用你带来的帐篷和床上用品。当伊芙琳找回[dullhorse]时，你向她道别。[say: 有空再来看我。这很棒。] 她用一个故意夸张的动作向你飞吻，当她骑马离开时，引起了你的笑声。你深吸了一口早晨的空气，然后返回营地。");
         var _loc2_:IMap = KFLAGS.flags;
         FlagDict_Impl_.arrayWriteInt(_loc2_,2711,FlagDict_Impl_.arrayReadInt(_loc2_,2711) + 1);
         doNext(get_camp().returnToCampUseOneHour);
      }
      
      public function dullDates() : void
      {
         spriteSelect(SpriteDb.get_dullsprite());
         clearOutput();
         outputText("你问她想不想出去走走。她把双手背在身后，身子向前倾了倾。");
         outputText("[pg][say: 就像……约会？和我？多浪漫啊，[name]！]她打趣地说着，随后轻笑起来。[say: 我得先和我父亲谈谈。等你给了他合适的聘礼和嫁妆，也许我们可以在他的注视下，在城堡的庭院里散步。如果他同意，我们甚至可以牵手。]她笑着，但你能看出她只是在开玩笑。看到她在你身边如此自在，甚至能开这样的玩笑，让你不禁感叹，自从第一次见到她以来，一切都变了太多。[pg]她的笑声停止了，你提醒她，她自己还没答应或拒绝呢。她愣了一下，有点像被逼到角落的小动物。[pg][say: 嗯……我想……好啊？]她思考着约会意味着什么，脸上交替出现不安、好奇和渴望的神情。");
         outputText("[pg]对你来说这就够了。那么去哪儿呢……？");
         menu();
         addButton(0,"树林",dullDateWoods).hint("森林是个不错的地方。").disableIf(get_player().get_gender() == 0,"你需要有生殖器才能体验这次约会。");
         addButton(14,"算了",dullNoDate).hint("转念一想，你现在没心情约会。");
      }
      
      public function dullDateWoods2Yes() : void
      {
         var answeredYes:Boolean;
         var _g:DullahanScene;
         clearOutput();
         outputText("你告诉她，无论他堕落的原因是什么，他犯下的恐怖罪行都不能被简单地原谅；他是邪恶的。");
         outputText("[pg]伊芙琳沉默了一会儿，思考着你说的话。[say: 我想你是对的。我不知道他死后灵魂会发生什么……但我希望他最终能从自己内心的折磨中找到平静。]");
         outputText("[pg]她脸上出现了一丝轻微的皱眉。你想起了她生前在他的命令下犯下的谋杀。");
         _g = this;
         answeredYes = true;
         doNext(function():void
         {
            _g.dullFinishForestDate(answeredYes);
         });
      }
      
      public function dullDateWoods2No() : void
      {
         var answeredYes:Boolean;
         var _g:DullahanScene;
         clearOutput();
         outputText("你告诉她，当你无法看到全貌时，很难做出判断。他必须被阻止，但他可能仍然没有错。");
         outputText("[pg]在仔细思考了你说的话后，伊芙琳似乎对你的回答很满意。[say: 谢谢你，[name]。对已经造成的损害抱有遗憾是没有用的。至少，阻止源头已经防止了进一步的麻烦发生。时间会证明伤口会被遗忘的。][pg]");
         _g = this;
         answeredYes = false;
         doNext(function():void
         {
            _g.dullFinishForestDate(answeredYes);
         });
      }
      
      public function dullDateWoods2() : void
      {
         spriteSelect(SpriteDb.get_dullsprite());
         get_player().orgasm();
         clearOutput();
         outputText("你把大部分肉都吃完了，暂时放到了一边。伊芙琳始终保持着沉默，大部分时间都在耐心地拨弄着自己的头发等待，但偶尔也会露出颇为撩人的神情。看到你吃完后，她问道，[say: 味道怎么样？]");
         outputText("[pg]你做出了回答，但她似乎没有在认真听。她凑近过来，你甚至能感受到她的呼吸。昏暗的烛光无法掩盖她那可爱的面容，尤其是那双金色的眼眸。看到她如此靠近，你脸上不禁一热。[say: 我想问你一件事，]她说道，脸上带着认真的表情。你点头示意她继续。[say: 你为什么喜欢我？为什么愿意为我付出这么多？]");
         outputText("[pg]你移开视线片刻，构思着一个合适的答案。当你列举你对她感兴趣的原因时，她专心地听着。你讲完后，她笑了。");
         outputText("[pg][say:我真的很高兴。]你问她为什么会突然问这种问题。她开始端详你的五官。[say:因为你找到了触动我心弦的理由。孤单了这么多年，有时候感觉就像做梦一样。]一只手抚上你的脸颊，仿佛在确认你是真实的。[say:然而你就在这里，无比真实。尽管我的本性如此邪恶，我却感到自己受到了祝福。]你表达了你的看法，这种感觉并不是单方面的，你很高兴能遇到她。她咧嘴笑了。[say:好了，多愁善感的话就说到这里吧，好吗？]");
         outputText("[pg]伊芙琳把头摘下来举到你耳边，同时身体前移跨坐到你的腿上，淡蓝色的胸脯轻轻贴着你。[say: 你知道吗……] 她低声说道，[say: ……我觉得这烛光还挺衬我的。] 她的另一只手绕到你脑后，执意让你更近距离地感受她身体的气息和触感。[say: 待在这种地方，其实挺无聊又寂寞的。] 她把耳语压得更轻。[say: 既然今夜我们拥有彼此，我想好好把握。] 她轻轻啃咬着你的耳朵，你则沉浸在她淡蓝色胴体的芬芳与魅惑中。她开始缓缓地用下体蹭着你的裆部，试图进一步挑起你的欲望。");
         outputText("[pg]你本能地开始亲吻她的胸部，同时解开她的紧身胸衣。在轻咬你的耳垂之间，她在你耳边发出一声微弱的呻吟。过了好几秒钟，她紧身胸衣上的蕾丝被解开，刚好足以缓解它的紧绷感。你的手开始探索她背部新暴露出来的皮肤。表面很柔软，但在下面你能感觉到她背部肌肉的僵硬。它们似乎有些紧张，所以你开始揉捏和按摩你发现的任何紧绷的地方。这样做让她稍微放松了一些，让她进一步陷进你的腿里。她停止了轻咬，在你耳边低语，[say:你不想和我玩吗？]");
         outputText("[pg]作为回应，你将手顺着她的背部向下移动到她的臀部，将她的裙摆推下，足以将她蓝色的臀部暴露在空气中。你用双手狠狠地拍了一下，然后抓了一把。紧紧地一捏，你手里就抓满了她紧实的屁股，上面只有一层薄薄的脂肪。你反复按摩并掰开她苍白的臀部，有时将她更用力地拉到你的胯部，以平息你[genitals]日益增长的欲望。每次你粗暴地在她身上摩擦时，她都会发出一声呻吟，盖过了上方摇曳的树冠的声音。她愉悦的叹息和她身体的触感让你几乎忘记了周围蜡烛之外还有一个世界。");
         outputText("[pg]经过好一会儿的抚摸和摩擦后，无头骑士重新安上了她的头，并松开了你的头。她暴露的臀部从你的腿上滑落后，轻轻地落在了布料上。她脱下衣服，只留下下半身的内衣。你也跟着脱下衣服，她侧躺下来，把头放在脖子附近。在和她躺在一起之前，你欣赏地看着面前这具在周围微弱火光照耀下的赤裸娇躯。这具身体是你今晚的战利品。[say:我想尽可能多地感受到你在我身上。]她紧紧地贴着你[if (hascock) {，让你的肉棒靠在她的双腿之间，只有一层薄薄的布料将你的肉棒顶部与她危险湿润的小穴隔开|[if (hasvagina) {，让你的小穴压在她湿润的胯部，只有一层薄薄的布料将你们渴望的性器官隔开。}]}]");
         outputText("[pg][say: 请把我放到你的唇边。]你应允了，抓住她的头，将她的双唇贴上你的。起初只是轻啄一下，接着她的舌头径直闯入你的口中，像对手一样向你的舌头发起猛攻。她用双唇夹住你的舌头，轻轻吮入口中，同时用自己的舌尖抚弄着捕获的猎物。她双眼半闭，并未聚焦在任何事物上，似乎全部的注意力都集中在了正在感受的触觉上。");
         if(get_player().hasCock())
         {
            outputText("[pg]她的小穴湿透了，温暖的体液滴透了她内裤浸湿的布料，润滑了你的阳具。你的肉棒对她近在咫尺的小穴做出了反应，抽动了一下，进一步将自己压在她渴望的性器官上，用它的宽度分开了阴唇。就在那里蹂躏她的想法涌上心头。它是如此之近，现在几乎就在她的体内了。你还记得在喀耳刻的幻境中她有多紧。你现在就可以让这种快乐成为你们俩的现实。你所要做的就是……");
            outputText("[pg]当你意识到她的身体似乎在迎合你的欲望时，一阵熟悉的寒意顺着你的脊背流下。她的手向下移动，将内裤的布料拉到一侧，向你的肉棒展示她那诱人的蓝色小穴。她身体那充满爱意的动作已经被冰冷的机械动作所取代。尽管发生了这样的变化，你还是感到极度兴奋。你能感觉到她的阴道有多么渴望被你的[cock]填满，就好像有一股超自然的力量在你的下半身耳语，乞求你投入那湿润的蓝色深渊。你意识到自己正处于某种操纵之下，因为你脑子里几乎只能想到，只要你屈服，她的身体现在就能给你带来强烈的快感。她的手指抓住你的龟头，开始推它，让顶端对准她小穴的入口……");
            outputText("[pg]...");
            outputText("[pg]<b>不</b>。那个怪物怎么敢再次出现。你粗暴地抓住她的身体，提醒它你是谁。那只手退缩了，你感觉到她体内的怪物在恐惧中萎缩。这件事留下的只有你感受到的强烈欲望，以及你的肉棒现在正夹在她暴露的下体阴唇之间。你对刚才差点发生的事情感到不寒而栗，冷汗直流，心跳加速。你不知道如果因为这么简单的事情让她失去你和她的控制，你怎么能原谅自己。然而，伊芙琳的脑袋现在完全专注于你，似乎根本没有注意到那短暂的失控。或者她知道你不会让这种事发生。");
            outputText("[pg]你再次放松下来，但强烈的欲望依然挥之不去。你中断亲吻，告诉伊芙琳你现在就需要释放。她空洞的双眼直直地看穿了你，只是简单地应了一声。她的双腿微微交叉，用大腿夹住你的肉棒。她柔软而有力的上腿布满了温热的淫液，这让她开始移动双腿和臀部时，能轻松地让受困的肉棒在之间滑动。这个动作也使得她蓝色的小穴在你的茎身上下来回蹭动，下唇因爱人的棒身近在咫尺而愉悦地颤抖着。");
            outputText("[pg]看着她的脸，她的舌头现在慵懒地垂在张大的嘴里，她那依然空洞的眼睛现在向上凝视着虚无。由于将小穴压在你完全勃起的[cock]上，她发出短促的呻吟和尖叫。她脸上充满情欲的表情，加上她用大腿和小穴摩擦你肉棒带来的快感，让你难以忍受，但她并没有就此止步。作为最后的点睛之笔，她的一只手伸到身后，托住你的龟头，手掌在几乎要爆裂的龟头上滚动。她手掌的柔软促使你移动臀部，试图将肉棒进一步压入她的手中。作为回应，她更用力地抓住你的龟头，并在手中快速旋转。[say: 射给我，我想要！]她大喊道。");
            outputText("[pg]你浑身颤抖，开始在强烈的高潮中挣扎，但她的大腿只是更紧地夹住你，绝不让你的肉棒滑走，这样她就可以继续用她苍白的大腿给你肉棒上的每一根神经带来快感。你把精液射进托住你龟头的手掌里，她握不住的多余精液流到了她的屁股和腿上。她的脑袋恢复了一些意识，看着你扭曲的脸。她看着这景象高兴地咕哝了一会儿，然后她也开始颤抖和扭动，在你的肉棒上方达到了高潮。她发出一声大叫，然后松开你，翻身仰面躺下。那只握着你精液的手顺势滑到她蓝色的裂口处，她开始把你的精液推入，并伴随着高潮的余韵。 [say: [name]的精液……在里面……嗯……] 伊芙琳已经完全迷失了自我。也许是因为蜡烛？不管怎样，你不常看到你的精液从她体内流出。你也不常看到她如此沉迷于情欲之中。你可以因为这种荡妇般的表现而取笑她，但你选择不这样做，因为你没有精力了，最好还是让她享受这一刻。她的另一只手伸向你的肉棒，在它疲软时充满爱意地抚摸它，偶尔会因为它的过度敏感而让你稍微挺动一下。");
         }
         else if(get_player().hasVagina())
         {
            outputText("你沉浸于身体紧贴的感觉，伊芙琳吮吸着你的舌头。没过多久，她就开始用臀部在你身上研磨，用自己的阴蒂轻轻压着你的。每当隔着内裤你们的女性爱液开始混合时，她就会隔着舌头发出呻吟。她不满足于仅仅透过湿透的内裤感受彼此，于是伸手将内裤拨到一边，让她裸露的蓝色小穴直接贴上你的。你的注意力完全集中在你们蓝色阴唇柔软肌肤的交融上，这撩拨得你想要更多。享受着这新的肌肤接触，她一只手移到你的[butt]上，轻轻一推，催促你也加入研磨。你们充满活力地相互挤压，渴望下体达到足够的接触，同时你们的双腿与她的交缠在一起，让磨镜更加舒适。");
            outputText("[pg]对当前刺激感到不满足的伊芙琳中断了亲吻，问你是否想要她帮你舔下面。然而，你心中有个更好的主意。你以反向女牛仔姿势跨骑在她身上，让她的头置于彼此双腿之间，将两人敏感的私处一同展现在烛光下，闪闪发亮。伊芙琳抬头望着你的脸，一副迫不及待想实行你计划的表情。你微笑着，把她的脸按回她自己小穴上。她将舌头挺进自己渴望的幽穴，身体立刻因数十年自我慰藉练出的技巧而开始扭动。在她为自己带来快感的同时，她的额头轻微移动，压上了你的小穴。不想置身事外，你缓缓摆动腰肢，淫靡地用私处磨蹭她的头部，让女性的爱液涂抹了她满脸。无头骑士察觉到了你的欲望，双手越过你的腿，来到你的蜜穴上轻柔抚摸。你停止了磨蹭，好让她尽情玩弄你。她的指尖之一开始缓缓探入你的阴道，轻抚内壁，另一只手则温柔地按摩着你的阴蒂。数十年来为满足自身欲望以免失控而练就的手指技巧极其娴熟。");
            outputText("[pg]在经过漫长而细致的爱抚后，她将中指和无名指并拢，开始在你体内反复深插。每一次抽插，她的手指都会快速旋转，仿佛想尽可能多地感受你的内壁。你因这感觉和她急切的动作而喘息，这进一步促使她的手加快了速度。她另一只手的食指和中指开始狂热地按压和揉搓你的阴蒂，与之前的温柔按摩截然不同。她紧贴着自己的小穴大声呻吟，似乎从取悦你中获得了与舔舐自己同等的快乐。照这个速度，你肯定很快就会在她的手指上高潮，因为你的小穴开始夹紧它们，进一步增加了抽插的快感。然而，当她感觉到你即将高潮时，她放慢了手上的动作，并设法开口说话。[say: 摸……摸我 *嗯*。让我来尝尝你的味道。] 你试图忽略她在你阴蒂上的动作并照做，同时你体内的手指不情愿地退了出来。她稍微坐起身子，这样她腾出的手就能抓住你的胸部，偶尔拉扯你的乳头。你把她的嘴拉到你的小穴前，她毫不犹豫地把舌头伸进去旋转。当她的舌头进入的那一刻，放在你阴蒂上的手加快了速度，试图让你在她的嘴里高潮。你把手指插进她冰冷的小穴，试图跟上她手指的韧劲。过了一会儿，她再次让你达到全速，然后对着你的小穴大喊。[say: 我想要，射在里面……*吸溜* 我的嘴里！] 这足以最终将你推向高潮。你猛烈地射在她入侵的舌头上，将你的淫液涂满她的口腔内外，但她并没有停下。她继续揉搓你的阴蒂，用她熟练的舌头探索你敏感的洞穴。你试图抵抗想要挣扎的冲动，但你的身体开始不受控制，沉醉在快感中。你弯下腰，这让她的手从你的胸部滑开，因为你开始把她的脸更用力地按进你的小穴。你感觉自己快要崩溃了，但伊芙琳的身体坐得更直了，用她空闲的手臂搂住你的肚子来稳定你，这样她就可以继续对你的私处发起攻势，让她的乳头戳进你的背部。不知怎么的，你并没有忘记继续用手指抠挖她。你集中剩下的注意力，用拇指指尖用力摩擦她的阴蒂，同时你的三根手指在冰冷的小穴里快速抽插，努力让她也达到高潮。她的小穴已经因为兴奋而颤抖，所以不需要太长时间。一声响亮而充满情欲的呻吟从你唇间溢出，因为她的口交服务让另一股快感流遍你的全身。伊芙琳的眼睛睁得大大的，因为她终于被推向了高潮。她的阴道紧紧夹住你的手指，她停下舌头上的动作，发出一声尖叫，她的体液涌过你的手指。她的上半身试图因为这种感觉而蜷缩起来，这进一步将她赤裸的乳房压在你的背上。一旦敏感度变得让她无法忍受，她就放开你，仰面躺下。紧接着你也从她身上瘫倒下来，双腿使不出一丝力气。");
         }
         outputText("[pg]一切都平静下来，你们俩都精疲力竭地并排躺着。[say: 和你做爱总是那么棒。] 你们俩花了一分钟时间放松，同时大口喘气。[if (hascock) {她看着上方的树冠。[say: 谢谢你。] 你问她为什么要谢你。[say: 我知道和我在一起不容易。] 所以她确实注意到了，但你指出，她的感谢是不必要的。她在激情的时刻没有引起注意，这一定意味着她从未怀疑过你。你向她表达了你的感受，并进一步向她保证，只要她觉得舒服，你就不介意。}] 她的身体翻转过来拥抱你，把头靠在你的脸颊上蹭了蹭。沉默了一会儿，她再次开口。[say: 关于我之前的问题。关于那个死灵法师。他造成的死亡会让他变得邪恶吗，即使他是被操纵的？] 出于某种原因，这个问题似乎一直困扰着她。");
         saveContent.seenBody = true;
         menu();
         addButton(0,"是",dullDateWoods2Yes).hint("那些曾经作恶的人应该被如此认知。");
         addButton(1,"否",dullDateWoods2No).hint("你甚至都不怎么了解他，但他并不完全有错。");
      }
      
      public function dullDateWoods() : void
      {
         spriteSelect(SpriteDb.get_dullsprite());
         clearOutput();
         outputText("真正的约会听起来不错。这片树林现在在你们彼此的心中都占据着特殊的位置，为什么不就待在这里呢？你也许可以在这里用上一些营地装备，比如帐篷和床铺。你向她提出了你的计划，她欣然接受了。[say: 听起来不错，我去生个火。我现在已经很习惯在树林里生活了。]");
         outputText("[pg]你回到营地收集了一些物资。当你回来时，伊芙琳正坐在熊熊燃烧的篝火旁。她双臂抱膝，凝视着火焰，她在森林中央孤单的身影唤起了你们共度第一晚的记忆。你迅速搭起帐篷，把被褥放进去，然后走到她身边。");
         outputText("[pg]当你坐下并把手臂搂在她的腰间时，她脸上露出了温暖的微笑。你们俩一起默默地盯着火堆看了几分钟，但一小堆蜡烛和一条包好的鱼引起了你的注意。看来你不在的时候，她自己也收集了一些东西。");
         outputText("[pg]你揉了揉她的腹部以引起她的注意，并询问那些蜡烛的事。她一开始有点害羞，但没过多久就回答了你的问题。");
         outputText("[pg][say: 我确实开玩笑说你是个浪漫的人，但有一件事我想体验一下，即使在我还是人类的时候也没有机会。你有兴趣和我一起尝试烛光晚餐吗？]");
         outputText("[pg]你当然不能就这么算了。你问她，如果你连聘礼都没给，她父亲会同意这种事吗？她只用一记轻快但相当有力的拳头打在你的肋骨上作为回答。你一边轻笑一边点头同意。");
         outputText("[pg]你拿了一根附近的树枝，把鱼串起来，放在火上烤，而伊芙琳则开始工作，从你的被褥上拿下一块布铺在地上。然后她把蜡烛插在布周围的地上并点燃。在外人看来，这可能像某种亡灵仪式的开始，只是缺少了符文、书籍和祭品。");
         outputText("[pg]你烤完了鱼，扑灭了篝火，这样唯一的光源就只有蜡烛和月亮了。她跪坐在布上，耐心地等着你，显然很兴奋，但对这严格意义上的第一次约会又有点焦虑。当你拿着烤鱼走向她时，伊芙琳那双闪烁着微弱金光的眼睛一直注视着你。你在她面前紧挨着坐下，在这个距离，即使是耳语也能盖过树冠的沙沙声和其他夜晚的喧嚣。烛光用橙色的光晕勾勒出她柔和的蓝色面容，这美丽的景象让你不禁短暂地惊呆了。");
         outputText("[pg]你递给她一块剥好的鱼肉。她犹豫了一下，但还是决定咬一口。[say: 我不确定我是否还记得上次吃东西是什么时候……但这是一个特殊的场合，]她一边咀嚼一边说，眼睛上下转动，锻炼着她长期被忽视的味觉。她咽了下去，赞赏地点了点头。[say: 对于篝火晚餐来说还不错。]你点点头，提到偶尔吃点肉挺好的。她轻笑起来。[say: 我猜英格纳姆有更多没有智慧的动物吧？]你表示同意，并告诉她，对你来说，这里的大多数生物都有感知能力，这很不寻常，尤其是那些和你世界里的牛很相似的生物。[say: 有意思。我想知道是什么导致这里这么多物种像它们那样发展出自己的思想。]你耸了耸肩。也许是某个神明的心血来潮吧。");
         outputText("[pg]过了一会儿，你注意到她的目光飘向了远方。片刻之后，她打破了沉默。");
         outputText("[pg][say:死灵法师……当我还是他的侍卫时，我就有一种感觉，他不太像他自己。我认识他有一段时间了，他是一个好奇的人，但就好像他也在按照另一个人的意志行事……就像他的思想不是他自己的一样。我无法证实。如果是这样的话……]她说着，把目光移回你的眼睛，[say:……如果他没有对自己的行为负全责，你能严厉地评判他吗？他真的是一个坏人，还是只是一个犯了错误并失去控制的人？]");
         outputText("[pg]这个问题来得相当突然，你现在注意到她朝你倾过身来，等待着你的回答。[if (silly) {你正要像往常那样从几个选项中选择一个回答，却被突然打断了。}]她意识到了什么，稍稍放松了些，又连忙说道。[say: 抱歉，我只是想起了那晚的事。我不需要你的答案。我们应该把一切都抛到脑后，好好享受才对。]她向后靠去，你们继续进餐。");
         doNext(dullDateWoods2);
      }
      
      public function dullCurseJustice() : void
      {
         spriteSelect(SpriteDb.get_dullsprite());
         clearOutput();
         outputText("你低头沉思了片刻，然后带着危险的意图盯着她。你告诉她，尽管她看起来很无辜，但她必须从这片土地上被清除。她杀死了太多无辜的人，不能就这样逃脱惩罚！你做好了战斗的准备。");
         outputText("[pg]她看起来有些悲伤，无力地举起一只手，似乎在请求你停下。那只手握成了紧紧的拳头。[say: 很好，[name]。我无法讨论你道德观的价值，无论它们多么令人震惊。但是，我可以保护自己。准备好！]");
         outputText("[pg]你正在与无头骑士战斗！");
         FlagDict_Impl_.arrayWriteInt(KFLAGS.flags,2660,2);
         startCombat(new Dullahan());
      }
      
      public function dullCurseCure() : void
      {
         var lastFunc:Object;
         var _g:DullahanScene;
         spriteSelect(SpriteDb.get_dullsprite());
         clearOutput();
         outputText("你让她放松。你只想知道她是否需要帮助，寻找某种治疗她状况的方法。女人深吸了一口气，因为你没有攻击她而松了一口气。");
         outputText("[pg][say: 谢谢你的好意，[name]，但是]——无头骑士短暂地摘下自己的头，然后又放了回去，以表明自己的观点——[saystart]这个诅咒是唯一让我“活着”的东西。即使在玛瑞斯有人深谙破除诅咒之道，或者某个自称神明的人能赐福于我，结果也只会是我死掉。真正的死掉，就像我几十年前本该死掉那样。");
         outputText("[pg]尽管发生了一切，我还是喜欢活着。当然会有悲伤的时刻，但我有无限的时间去结识伟大的人，发现新的土地，对随机的生物恶作剧。我不想解脱。[sayend]");
         outputText("[pg]她把一只手放在你的肩膀上。[say: 你不可能解决所有问题，[name]。]");
         outputText("[pg]她对你微笑，你也回以微笑，只是有些失望。你只能习惯这个事实了。");
         _g = this;
         lastFunc = dullahanCurse;
         doNext(function():void
         {
            _g.dullTalkMenu(lastFunc);
         });
      }
      
      public function dullBlowjobTease3() : void
      {
         spriteSelect(SpriteDb.get_dullsprite());
         clearOutput();
         outputText("前列腺传来一阵酥麻，预示着高潮即将来临，你将[cock]完全顶进她的嘴里，在快感中弓起了身子。");
         outputText("[pg]你在她嘴里射精了，而她在你每一次跳动时都在继续吸吮。你瞥了一眼她的身体，发现她的小穴几乎把手死死夹在里面，拼命地想要榨取它，仿佛那是一根肉棒。她再次含着你的阴茎呻吟，让你的快感更上一层楼。");
         if(get_player().cumQ() > 1500)
         {
            outputText("不知怎的，她竟然毫不费力地吞下了你那惊人的精液。");
         }
         outputText("[pg]几股精液射出后，你精疲力尽了。她继续吸吮着，但力度减弱了，她沉浸在自己的高潮中，甚至没注意到你已经射完了。在肉棒软下来后，她开始温柔地舔舐龟头周围。对于一个显然讨厌口交的女孩来说，这可真是充满了爱意。");
         outputText("[pg]你坐下来，把她的头从你的阴茎上移开。你看着几米外那具筋疲力尽、瘫倒在石头上的身体，又看了看你手里捧着的头颅。她显然已经睡熟了。把她的头放在你身边后，你仰起头闭上眼睛，打算也休息一下。");
         outputText("[pg][say: 嘿……[name]……]你慢慢睁开眼睛，低头看着那颗离体的头颅。[say: 把我放在你脸旁边。我想……你知道的。]");
         outputText("[pg]你笑了笑，拿起她的头，放在你的头旁边。她尽力在你的脖子上蹭了蹭，然后轻轻吻了一下。很快，你们俩都进入了甜美的梦乡。");
         get_player().orgasm("dick");
         saveContent.seenBody = true;
         doNext(get_camp().returnToCampUseTwoHours);
      }
      
      public function dullBlowjobTease2() : void
      {
         spriteSelect(SpriteDb.get_dullsprite());
         clearOutput();
         outputText("在这诡异的局面下，你的" + (get_player().cockTotal() > 1 ? "[cocks]" : "[cock]") + "已经勃起了，" + (get_player().hasVagina() ? "你的小穴也流出了不少淫水，" : "") + "而你现在可不打算放弃。她的身体似乎也很享受这一切。它坐了下来，张开双腿，短裙下隐约露出了内裤。她的身体还挺会挑逗的。她开始揉捏乳房，摩擦阴蒂，起初动作很慢，但很快就加快了节奏。[say: 啊……]头颅在呻吟间喃喃自语。随着节奏加快，她再也无法抑制自己的呻吟，很快就完全沉浸在这不由自主的自慰中。你看着怀里的头颅，现在几乎完全变成了紫色，布满了冷汗。尽管身首异处，但在情欲的笼罩下，依然显得无比诱人。你能看出来，她马上就要高潮了。");
         outputText("[pg]然后，身体停了下来。揉捏乳房的手颤抖着松开，湿透的手指也停止了摩擦阴蒂。你能感觉到头颅呼吸急促，她绝望地睁开眼睛。[say: 这……这混蛋。它在戏弄我？戏弄它自己？]身体慢慢把内裤拨到一边，完全露出了流着淫水的小穴。她伸出两根手指，准备就绪。[say: 我才不会因为这种事就去给你口交——]");
         outputText("[pg]身体将两根手指猛地插进小穴，向上勾起，快速抽插了一下，小穴立刻喷出了淫水。然后她抽出手指，准备用三根手指进行下一次抽插。头颅立刻停止了说话，一声响亮而愉悦的呻吟盖过了她原本想说的话。她又呻吟了几声才恢复理智。你举起那颗摇晃的头颅，凑近自己的脸。[say: 我觉得你的身体在试图告诉你什么。也许你做点特定的事，她就会让你高潮。]你用你能装出的最厚颜无耻的语气说道。[say: [name]，如果十秒钟内我的嘴里没有塞进一根肉棒，今晚结束前，被砍头的可就不止我一个了。]无头骑士说道，声音因快感和愤怒而颤抖。");
         outputText("[pg]这可是她要求的。你把她的头按向你的胯下，让她能清楚地看到你的[cock]。你把她的嘴唇对准你的[cockhead]。她看着它，显然充满了渴望，但依然表现出抗拒。");
         outputText("[pg]身体不知怎么察觉到了这一点，三根手指猛地插进了小穴。几乎在同一时间，无头骑士张开嘴，扑向了你勃起的肉棒，");
         if(get_player().cocks[0].cockThickness >= 4)
         {
            outputText("尽管她最多只能含住龟头。");
         }
         else if(get_player().cocks[0].cockThickness >= 3)
         {
            outputText("努力张大嘴巴，试图把它含进去。");
         }
         else
         {
            outputText("毫不费力地一口吞下了大半。");
         }
         outputText("刚才对小穴的猛烈攻势让她依然无法自拔，她只能含着你的肉棒呻吟，那震动让你浑身颤抖、脉搏贲张。她的嘴唇紧紧裹住你的阴茎，狂热地舔舐着龟头和根部，绝望地渴求着释放。");
         outputText("[pg]你喘着粗气，开始在她的嘴里抽插，享受着她嘴唇的触感、舌头的湿润和那不顾一切的舔舐。身体意识到所有的矜持都已荡然无存，便彻底恢复了自慰，用拇指摩擦阴蒂，用剩下的手指在小穴里抽插，扭动臀部在手掌上研磨，并用力揉捏着自己的乳房。你一会儿看着那颗半闭着眼睛疯狂吸吮你肉棒的头颅，一会儿看着那具丰满的身体疯狂地自慰。你都不知道哪个更色情了。");
         doNext(dullBlowjobTease3);
      }
      
      public function dullBlowjobTease() : void
      {
         spriteSelect(SpriteDb.get_dullsprite());
         clearOutput();
         outputText("来个老式的口交怎么样？你直截了当地问她，她皱起了眉头。[say:口交太无聊了。我能从中得到什么？我还得一边伺候你一边弄自己。我的意思是，我们可以69，但没人能在这方面比得上我，所以感觉不会那么好——]仿佛厌倦了自己的脑袋，无头骑士的身体举起双臂，将头从躯干上摘了下来。[say:笨蛋身体！快停下！这里我说了算！]身体显然很恼火，胸口做出了一个叹气的动作。她把那颗烦人的脑袋扔给你，你接住了它，让它无法看到自己的身体。");
         outputText("[pg]你看着那双锐利而狭长的黑金双眸，她也撅着嘴回瞪着你。[say:想都别想。]你看了看身体，它正冲你竖起大拇指，因为看不见而稍微有点歪。你现在收到的信号很混乱啊！");
         outputText("[pg]头颅嗤笑了一声。[say: 哼，你又不能逼我给你口交。你要是硬来，我就把它咬下来，那我们就在这僵持一辈子吧。]你看了看她的身体。它正把手放在宽阔的臀部上，显得有些不耐烦。突然，它抬起一只手，食指朝上，做了一个“有主意了”的手势。然后，她用那根手指快速地挑逗起自己的阴蒂，这突如其来的快感让头颅惊讶地深吸了一口气。");
         outputText("[pg][say: [name]，我的身体在干嘛？快让我看看我的身体在干嘛，立刻马上。]你当然没有照做，只是用得意的微笑回应她愤怒的要求。接着，身体隔着皮质束腰捏住了一侧乳头，扭转拉扯着，力道刚好在疼痛的边缘。头颅再次喘息起来，蓝色的脸颊上开始泛起紫晕。[say: 该死……[name]，我不喜欢被这样戏弄……]");
         doNext(dullBlowjobTease2);
      }
      
      public function dullAskMiss() : void
      {
         spriteSelect(SpriteDb.get_dullsprite());
         clearOutput();
         outputText("你问她，当你晚上离开或者几天不出现的时候，她有时会不会想你。");
         outputText("[pg]她似乎对这个问题感到惊讶。[say: 相当直白的问题，你不觉得吗？] 她说着，走向一棵熟悉的树。她向你点头示意你跟着她，你照做了。[pg]她转向树的背面，看着她在树皮上刻下的雕刻。她的脸变得柔和，叹了口气。[say: 现在还不明显吗？你可以忙着做勇者什么的，但我至少想知道你还没死。][pg]过了很长一段时间，她才再次开口。[say: 记住，我指望你了。至少和我待在一起足够长的时间，让我考虑一下你走后我会做什么。我不喜欢把这种负担推给你，但我希望你明白我为什么这么做。]");
         outputText("[pg]你从来没有真正想过你走后会发生什么。她会恢复她的本来面目，为了好玩而困扰生物，同时内心完全空虚吗？");
         outputText("[pg]你把这个想法从脑海中清除。不。她现在不同了。尽管如此，你还是向她保证你会尝试。你用一个受欢迎的拥抱强调了你的承诺，她高兴地回应了。");
         dullTalkMenu(dullAskMiss);
      }
      
      public function dullAskHorse() : void
      {
         spriteSelect(SpriteDb.get_dullsprite());
         clearOutput();
         outputText("你问她关于她骑的马的事。马在玛瑞斯通常很罕见，你想象一匹不死马真的是独一无二的。");
         outputText("[pg]她转向她那匹坚忍的骏马，扬起眉毛，组织着回答。[say: 我的马？她叫勒诺。又是死灵法师疯狂的另一个无辜受害者。她曾是他的一匹马。他知道在不死状态下，没有马能永远陪伴我，所以他也把诅咒施加在她身上。她不能说话，但是，] 她拍了拍勒诺的头，[say: 我觉得我们通过那场悲剧分享了一种纽带。在很长一段时间里，我们只有彼此作伴。] 勒诺发出一声轻柔的嘶鸣，似乎想表达同意。你走到马前，拍了拍它。它的眼皮放松了，耳朵微微向前倾斜，显示出它对你们俩的信任。伊芙琳向勒诺鞠躬，看着她的眼睛看了一会儿。[pg][say: 我想知道她对我们情况的看法。她对事物的反应确实像一匹正常的马，但她的思想也受到了死灵法师的影响吗？]");
         outputText("[pg]你耸了耸肩。你怀疑你是否有好运能理解一匹马的想法，更不用说一匹不死马了。伊芙琳轻笑了一声，最后一次抚摸她的骏马，然后转向你。");
         FlagDict_Impl_.arrayWriteInt(KFLAGS.flags,2710,1);
         dullTalkMenu(dullAskHorse);
      }
      
      public function dullAppearance() : void
      {
         clearOutput();
         outputText("站在你面前的是一个身高5英尺8英寸的无头骑士，除了淡蓝色的皮肤外，她有着正常人类的外貌。她有一头非常长的飘逸白发，一直垂到大腿，很好地衬托出她那张看起来像人类的脸，她有一个可爱的鼻子和一双带有金色瞳孔的黑眼睛。她穿着一件带有紧身皮革的装甲紧身胸衣，几乎包裹不住她的胸部。她的前臂、结实的腹部和小腿都覆盖着黑色的钢板，下半身穿着及大腿的靴子，还有一条几乎遮不住她匀称双腿的纯白短裙。在盔甲外面，她披着一件不必要地长的斗篷，像围巾一样缠绕在脖子上。她的身材比例很好，苍白的乳房与臀部的宽度完美匹配，结实的腰部足够纤细，使她呈现出沙漏般的身材。她修长的大腿在接触的地方形成了一道缝隙。");
         outputText("[pg]她有一对E罩杯的乳房，每个乳房上都有一个0.5英寸的乳头。");
         outputText("[pg]" + (saveContent.seenBody ? "在她结实的双腿之间，有一个冰冷、蓝色的阴户。你亲眼见过它能变得多湿，通常这违背了她的意愿。尽管如此，它还是能像老虎钳一样紧紧夹住，确保没有任何东西能逃脱。" : "你不确定她的内裤里藏着什么，或者她的背面是什么样子。"));
         if(saveContent.seenBody)
         {
            outputText("[pg]在她苍白、紧实的臀瓣之间，有一个紧致的屁眼，就在它该在的地方。");
         }
         addButtonDisabled(0,"外貌");
      }
      
      public function dontListenToDull() : void
      {
         spriteSelect(SpriteDb.get_dullsprite());
         clearOutput();
         outputText("你把那颗烦人的头留在那里任其喋喋不休。你有更好的事情要做。比如，睡觉。");
         get_combat().cleanupAfterCombat(get_camp().returnToCampUseTwoHours);
      }
      
      public function defeatedDullahanVictoryFriendly() : void
      {
         var _g:DullahanScene;
         spriteSelect(SpriteDb.get_dullsprite());
         clearOutput();
         outputText("你瘫倒在地，被你那超自然的对手彻底击溃了。");
         outputText("[pg]骑士挥舞着巨大的镰刀向你逼近。[say: [name]！准备好迎接你的<b>审判</b>吧！]");
         outputText("[pg]骑士化作一个可怕的黑色幽灵，缓缓举起镰刀，刀刃上不知为何滴着鲜血。她向你逼近，每一个动作都唤起死者撕裂灵魂的哀嚎，随着她那令人发狂的步伐，整个世界都在变暗。[pg]");
         outputText("正当你以为她真的要进行收割时，她几乎瞬间变回了原样，并伸出手拉你起来，眼中闪烁着胜利和恶作剧的喜悦。[say: 这次是我赢了，[name]！不过你表现得也不错。]你站起身，仍因刚才那令人发狂的景象而颤抖。你松了一口气，握住她的手，尽管你全身依然酸痛。");
         outputText("[pg]她绝对没有把决斗当儿戏，这是肯定的。");
         get_combat().cleanupAfterCombat();
         _g = this;
         doNext(function():void
         {
            _g.dullMenu();
         });
      }
      
      public function defeatedDullahanFriendly(param1:Boolean = false) : void
      {
         var _g2:DullahanScene;
         var _g1:DullahanScene;
         var _g:DullahanScene;
         spriteSelect(SpriteDb.get_dullsprite());
         get_combat().cleanupAfterCombat();
         clearOutput();
         var _loc2_:IMap = KFLAGS.flags;
         FlagDict_Impl_.arrayWriteInt(_loc2_,2668,FlagDict_Impl_.arrayReadInt(_loc2_,2668) + 1);
         if(param1)
         {
            outputText("你给了无头骑士最后一击。她踉跄着后退，倒在地上。[say:该死，干得好，[name]！你打架的时候可真不含糊，是吧？]你伸出手想拉她起来，她握住你的手，半开玩笑地嘲弄道。[say:别太得意忘形了。下次我会赢你的。]");
            outputText("[pg]你点点头，你们俩坐在附近的岩石上休息了一会儿。");
            if(get_player().get_spe() >= get_player().getMaxStats("spe"))
            {
               outputText("你觉得你已经达到了身体敏捷的极限，但试图突破无头骑士的防御进行攻击，确实是很好的练习。");
            }
            else
            {
               outputText("你没有立刻注意到，但试图突破无头骑士那敏捷得离谱的防御，已经<b>提高了你的速度</b>。");
            }
            if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,2668) == 4)
            {
               outputText("[pg]<b>在休息时，你注意到这个不死族女孩心事重重。她心里有事。也许下次你们见面时她会谈谈。</b>");
            }
            dynStats(DynStat.Spe(2));
            _g = this;
            doNext(function():void
            {
               _g.dullMenu();
            });
         }
         else
         {
            outputText("无头骑士原本苍蓝色的脸现在明显发紫，她很难集中注意力在你的动作上。然而，她的身体却诚实得多。她的双腿在发抖，似乎完全不在乎正在进行的战斗。违背她的意愿，无头骑士的手臂开始在自己身上摸索，寻找释放。");
            outputText("[pg][say:我……我觉得我们应该休息一下。我们可以算作平局。]她走出空地，每走一步都在与自己的身体抗争，在这个过程中丢下了她的骑兵马刀。这对你来说绝对是一场胜利，无论它多么不合常规。");
            outputText("她现在看起来对性爱的前提更加接受了。");
            menu();
            if(get_player().get_lust() > 33)
            {
               if(!get_player().isTaur())
               {
                  outputText("你跟了上去，有些讽刺地问她，既然她看起来病了，你有没有什么能为她做的。");
                  outputText("[pg][say:[name]，你能不能就走……]她深吸了一口气。" + (saveContent.talkedAboutCurse ? "[say:我知道你想要什么。而且很明显我也想要。只要记住克制一下你自己。]" : "[say:我知道你想要什么。而且很明显我也想要。只有一件事：不准插入。这是绝对禁止的。你不会想知道为什么的。]"));
                  if(!saveContent.talkedAboutCurse)
                  {
                     if(get_silly())
                     {
                        outputText("[pg]你想知道为什么。阴道长牙了？");
                     }
                     else if((FlagDict_Impl_.arrayReadInt(KFLAGS.flags,2673) & 2) != 0)
                     {
                        outputText("[pg]可悲的是，你知道为什么。");
                     }
                     else
                     {
                        outputText("[pg]你想知道为什么，但你决定最好还是不要打听。");
                     }
                  }
                  if(get_player().hasCock())
                  {
                     addButton(0,"大腿交",dullThighjob).hint("过膝袜和紧致的双腿。你能搞定的。");
                  }
                  if(get_player().hasVagina())
                  {
                     addButton(1,"舔阴",dullahanCunnilingus2).hint("这对你来说是个不必要的警告。");
                  }
                  if(get_player().hasKeyItem("Demonic Strap-On"))
                  {
                     addButton(2,"假阳具",dullahanStrapOn).hint("她不能承受，但也许她能给予？");
                  }
               }
               else
               {
                  outputText("你跟了上去，有些讽刺地问她，既然她看起来病了，你有没有什么能为她做的。");
                  outputText("[pg][say: [name]，你能不能直接走……] 她深吸了一口气。[say: 我知道你想要什么。而且很明显我也想要。但是……你知道，你是一匹——我在找什么词来着——一匹马！或者至少，部分是。我有一匹马！我已经骑了她几十年了！如果我和你的……下半身做爱，那么我以后在这个世界上骑马的时候都会非常尴尬。既然我是亡灵，这确实是很长的一段时间。对不起，我只是对那个不感兴趣。希望你能理解。]");
                  outputText("[pg]好吧，很少有人会这样直接拒绝和你做爱。");
                  if(get_player().cor + get_player().corruptionTolerance() > 60 && get_player().hasCock())
                  {
                     _g1 = this;
                     addButton(0,"强奸",function():void
                     {
                        _g1.dullOhYouFuckedUp();
                     }).hint("不来一发你是出不去的。");
                  }
                  addButton(1,"离开",dullSexRefused).hint("好吧，那该回营地了。");
               }
            }
            _g2 = this;
            addButton(2,"算了",function():void
            {
               _g2.dullMenu();
            }).hint("你现在就是懒得管。");
         }
      }
      
      public function defeatedDullahanFinishHerOff(param1:Boolean = false) : void
      {
         spriteSelect(SpriteDb.get_dullsprite());
         clearOutput();
         outputText("骑士倒下了，浑身是伤，任何人类都无法从中恢复。她翻过身，仰面朝天。她举起颤抖的双手，盯着它们，上面沾满了她冰冷、被诅咒的鲜血。");
         outputText("[pg][say: 你过着怎样的一生啊，伊芙琳。生了一次，死了两次。哈，我确实在自然界的脸上吐了口水，我确实——]她痛苦地呻吟着。");
         outputText("[pg]你走近她，准备给她致命一击。当你进入她的视线时，她不再盯着自己血淋淋的双手，而是将目光转向你，由于剧痛，她几乎无法移动头部。[say: 干得好，勇者。当你回到英格纳姆时，一定要讲讲这个故事。不过，省去我们一起欢笑、切磋和讲述彼此故事的那部分。那可能会破坏这一切的英雄主义。]");
         outputText("[pg]你举起你的[weapon]对准她的胸口，她没有做出任何抵抗。你深吸一口气，用尽全力进行了最后一次打击，击中了她的胸口。她的眼睛因为新的痛苦而睁大，然后随着冰冷的血液停止从伤口流出，她的眼睛失去了焦点。");
         outputText("[pg]<b>无头骑士死了。</b>");
         outputText("[pg]你四处寻找她的马，但它似乎已经消失了。这里没有什么可做的了。");
         FlagDict_Impl_.arrayWriteInt(KFLAGS.flags,2661,1);
         get_player().upgradeBeautifulSword();
         get_combat().cleanupAfterCombat();
         doNext(get_camp().returnToCampUseOneHour);
      }
      
      public function defeatedDullahan(param1:Boolean = false) : void
      {
         spriteSelect(SpriteDb.get_dullsprite());
         clearOutput();
         FlagDict_Impl_.arrayWriteInt(KFLAGS.flags,2659,1);
         if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,2660) == 1)
         {
            outputText("你对无头骑士发出了最后一击。它的身体倒在地上，伤得太重无法继续站立。");
            outputText("[pg]你靠近无头骑士，准备彻底击倒她。然而，在你动手之前，她站了起来，仿佛被木偶师控制着。她转过身面对你，变成了一个幽灵，向你扑来！");
            outputText("[pg]你保护自己，幽灵穿过了你，但你没有受到任何伤害。她消失了。");
            FlagDict_Impl_.arrayWriteInt(KFLAGS.flags,2660,2);
            get_combat().cleanupAfterCombat(get_camp().returnToCampUseOneHour);
            return;
         }
         if(param1)
         {
            outputText("你对无头骑士发出了最后一击。它的身体倒在地上，伤得太重无法继续站立。对你的第二次胜利感到满意，你[if (hasweapon) {收起武器，}]继续上路。");
            outputText("[pg][say: 你还没打败我呢！]你听到了无头骑士那极其熟悉的声音。你转过身，叹了口气，那颗头不知怎么地滚了过来，面对着你，眼神坚定。");
            outputText("[say: 我受过比这更重的伤！我是死亡的使者！无头者！可怕的无头骑士！那个——]");
            outputText("[pg]你可以让她继续说下去然后离开，或者留下来听她唠叨。");
            if(!get_player().hasTailInsteadOfLegs() && get_player().get_str() >= 60)
            {
               outputText("或者你可以把她的头踢进森林，这样你终于能找到一些安宁了。");
            }
            menu();
            addButton(0,"留下",listenToDull).hint("留下来听一会儿。","");
            addButton(14,"离开",dontListenToDull).hint("让她继续唠叨吧。","");
            if(!get_player().hasTailInsteadOfLegs() && get_player().get_str() >= 60)
            {
               addButton(10,"踢！",kickTheHead).hint("把她的头踢开！","");
            }
         }
         else
         {
            outputText("无头骑士继续直勾勾地盯着你，保持专注。然而，她的身体显然有别的“想法”，因为它烦躁不安，无法保持战斗姿态。最后，它放弃了，扔下了武器，间接宣布你是胜利者。");
            outputText("[pg][say: 不，停下！控制你自己，该死！]头颅对着自己的身体大喊。这种尴尬的冲突一直持续到身体决定强行把头从肩膀上拔下来，跑进灌木丛里寻求一点隐私。");
            outputText("[pg]头颅愤怒地盯着你看了片刻。过了一会儿，她开始脸红，呼吸急促。很快就变成了轻微的呻吟。");
            outputText("[pg][say: 等我……完事了……你就会尝到我的怒火！]她一边呻吟一边说道。");
            outputText("[pg]尽管情况很离奇，你还是忍不住感到兴奋。");
            menu();
            if(get_player().hasCock() && !get_player().isTaur() && get_player().get_lust() >= 33)
            {
               addButton(1,"口交？",dullahanBlowjob).hint("也许在这种状态下，她会愿意帮你解决勃起问题。");
            }
            if(get_player().hasVagina() && !get_player().isTaur() && get_player().get_lust() >= 33)
            {
               addButton(2,"舔阴？",dullahanCunnilingus).hint("也许在这种状态下，她会愿意帮你解决问题。");
            }
            addButton(0,"等待结束",waitoutDull).hint("等她完事。");
            addButton(14,"离开",dontListenToDull).hint("让她自己解决。","");
            if(!get_player().hasTailInsteadOfLegs() && get_player().get_str() >= 60)
            {
               addButton(10,"踢！",kickTheHead).hint("把她的头踢开！","");
            }
         }
      }
      
      public function debugMenu(param1:Boolean = true) : void
      {
         get_game().debugMenu.debugCompEdit(saveContent,new SaveContent(null,null,null,null));
      }
      
      public function cuddleStop() : void
      {
         spriteSelect(SpriteDb.get_dullsprite());
         clearOutput();
         outputText("你闭上眼睛，微微点了点头。她的身体站起来，把乳房塞回去后，重新系好紧身胸衣的带子。乳头似乎仍然坚硬如石。你叹了口气，把头重新躺下。她的身体回到了原来的位置，你把她的头拿回来，依偎在你的旁边。她悄悄地在你耳边低语：[say:谢谢你……]然后开始轻咬你的耳垂。感觉有点痒，但很舒服，你用一只手臂搂住她的身体，渐渐进入梦乡。[say:多美的夜晚啊，]你心想，就在闭上眼睛睡觉之前。");
         doNext(cuddleEnd);
      }
      
      public function cuddlePostSex() : void
      {
         spriteSelect(SpriteDb.get_dullsprite());
         clearOutput();
         get_player().orgasm();
         outputText("当你们俩平躺在背上，再次看着夜空时，伊芙琳重新接上了她的头。你开始笑了起来，所以她转过头来看着你。[say: 有什么好笑的？]");
         outputText("[pg]你转过头看着她的脸，回答说没什么，毕竟她是你的邪恶无头骑士荡妇。她皱起鼻子，撅起嘴唇，脸变成了紫色。[say: 你……！] 她咆哮着，发出一声怒哼。[say: 我得让你知道，我不是那种女孩。别那样耍我！现在这种说法可能很普遍，但我仍然有我的尊严。下不为例。]");
         outputText("[pg]哦？");
         outputText("[pg]你露出一丝苦笑，讽刺地问她是否愿意测试一下。无头骑士立刻给了你一个非常不悦的眼神。[say: 哈哈，[name]。别像个混蛋一样。]");
         outputText("[pg]你开玩笑地说，她不愿意再试一次，就等于承认她害怕历史重演。");
         outputText("[pg]她又脸红了，回答道，[say: 你这混——好吧！也许我有一点点喜欢……但是，现在，我们能享受这一刻吗？我们现在有很多事情要谈。]");
         outputText("[pg]她向你靠近，让你们的身体接触，她把接上的头靠在你的手臂上。你伸出她靠着的手臂，把手放在她另一只手臂上，然后拥抱她，把她的身体更紧地压在你的身上。你看到了她脸上你从未想过她会有的笑容。直到现在你才注意到，她笑的时候其实有小酒窝。这种可爱迫使你在她的脸颊上轻轻吻了一下，这让她笑得酒窝更加明显了。");
         outputText("[pg]你问她，在她还是人类的时候，有没有过爱人。她回答说没有。她致力于她的剑和工作，尽管有几个人对她献过殷勤。你告诉她这并不奇怪，考虑到她的美貌。她开玩笑地打了一下你的胸膛，力道大得几乎让你感觉到疼。[say: 别再取笑我了，该死！]");
         outputText("[pg]你的问题得到了解答，你意识到这是伊芙琳从未拥有过的东西，而且很可能在她“死”后就放弃了。你问伊芙琳，为什么她直到现在才对你表现出任何兴趣。");
         outputText("[pg]当她继续透过上方层层叠叠的树叶仰望星空时，她的脸变得严肃起来。[say: 很难想象当你没有头、被诅咒、犯过谋杀罪、偷过别人的灵魂，并且被一群只想操你的怪物包围时，还会被爱。]");
         outputText("[pg]她闭上眼睛继续说道，[say: 我别无选择，只能接受我无尽的生命将只有孤独和遗憾。我在吓唬别人这样的小事中寻找喘息的机会，只为了短暂的快乐……别误会，我喜欢扮演我的“角色”，但这仅仅是在一个巨大的伤口上贴上小小的创可贴……]");
         outputText("[pg]在讲述完她的绝望后，她睁开了眼睛。[say: 然后你出现了。在战斗中击败我之后，你不断地回来找我聊天。用对话打破我每晚的例行公事，和我切磋……" + (saveContent.seenBody ? " 有时还帮我的身体解决一些不光彩的需求……] 你对她挑了挑眉，她脸红了。[say: 是的，我想那也算是我的需求。]" : "]"));
         outputText("[pg][say: 这是很长很长一段时间以来，我第一次有了朋友。不，是我感觉自己有了一个朋友。当我向你隐瞒了这么多时，我算不上真正的朋友。我不想告诉你，因为我害怕你会攻击我，或者更糟，在提醒了我拥有朋友是什么感觉之后，又离我而去，让我独自在绝望中沉沦。]");
         outputText("[pg]你静静地躺了一会儿，消化着她的坦白。你觉得这是她几年来，几十年来，甚至更久以来一直想说的话。一阵微风吹过，树叶沙沙作响，这鼓励你再问一个问题。她为什么要让你去那座庄园？");
         outputText("[pg][say: 我不怀疑我的实力，[name]。也许我能在战斗中击败那个死灵法师。然而，我不知道他对我还有多少控制力，我无法忍受面对他并再次沦为奴隶的想法。] 她停顿了一下，对这个想法不寒而栗。[say: 几十年来，你是唯一一个在战斗中击败我的人。我觉得你有能力弥补我的过错……即使这意味着你要了解我的真相并回来杀了我，我至少可以带着我最大的遗憾死去。我承认让你冒这么大的风险很自私，但我怀疑他对这片土地的影响力不会仅限于庄园周围。必须有人去做。为了玛瑞斯的利益……] 她的声音越来越小，声音沙哑，最后消失了。");
         outputText("[pg]她翻过身侧躺着，用悲伤的眼睛看着你，现在眼里充满了泪水。她努力不让自己哭出来，嘴唇紧闭以防止抽泣。这很不像她，但你理解。她终于能够向很长一段时间以来她信任的第一个人展示她的脆弱。她的声音有些颤抖，[say: 但你回来了！你，那个陪伴我，减轻我最大负担，接受我甚至我的诅咒和暴力过去，并毫无理由地继续拜访我的人。]");
         outputText("[pg]一滴眼泪终于顺着她的脸颊流了下来。[say: 你很快就成了我生命中最重要的人，但我把我的感情藏在心里，因为我相信没有人会想和我在一起，尤其是知道我真相的人。一个吸人灵魂的无头女人，无法提供这个被遗弃的世界里其他人都能轻易提供的东西……][pg]她的防线终于崩溃，眼里的泪水开始顺着脸颊流下。[say: 我放弃了，[name]。我埋葬了那些愿望，直到你出现，它们一直被埋藏着。我不知道该如何去实现它们，因为几十年来，我已经决定忘记它，让它变得完全陌生。]");
         outputText("[pg]你把这个“怪物”拉进怀里，她的泪水现在浸湿了你的肩膀。你轻轻抚摸她的背，让她平静下来。她把头从你的肩膀上移开，用那双美丽的金色眼睛看着你，说道 [say: 非常感谢你。] 没必要感谢你，毕竟，你也是为了她才在这里的。" + (FlagDict_Impl_.arrayReadInt(KFLAGS.flags,2023) > 0 ? "两个被背叛、现在过着艰难生活的熟练战士，分享着一个温暖的时刻。" : "") + "你们双唇紧贴，又是一个充满激情的吻。");
         outputText("[pg]仿佛过了一个世纪，你们的吻结束了，她用双臂环抱着你。你闭上眼睛，你们俩都开始入睡，但在那之前，伊芙琳轻轻叹了口气，生气地低语道 [say: 这对“死亡先驱”来说不太合适，不是吗？]");
         outputText("[pg]在你回答之前，她自言自语道。[say: 也许这也不算太坏。]");
         doNext(cuddleEnd);
      }
      
      public function cuddleNoCock() : void
      {
         spriteSelect(SpriteDb.get_dullsprite());
         clearOutput();
         outputText("这具身体停了下来，弓起背，似乎在低头看你的双腿之间是否有什么可以插入的东西。看来在伊芙琳被欲望冲昏头脑的状态下，它忘记了那里什么都没有！你利用这种混乱攻击她手肘的关节，导致她的身体倒下，你迅速利用这一刻将你们俩翻滚过来，现在你跨坐在无头骑士身上。你试图把无头骑士按倒，她开始抵抗你的力量。");
         if(get_player().get_str() > 80)
         {
            outputText("伊芙琳可能拥有大多数人无法匹敌的速度和技巧，但在力量方面与你相比，还是有些不足。");
            outputText("你轻松地抓住她的手臂，把她从你身上举起，然后翻了个身。你现在在无头骑士的身体上方，用你强壮的手臂把她按倒。这具身体拼命挣扎和抵抗，但很明显她的抵抗无济于事。");
            outputText("[pg]伊芙琳的头，现在因为挣扎而侧放着，对你的胜利发出一声可爱的、短暂的如释重负的叹息。[say: 刚才我有点担心。我想我们今晚应该到此为止，在……之前] 你回头看着她的头，发出一声温柔的 [say: 嘘。] 她对被打断感到恼火，回答道，[say: 别对我“嘘”！你知道你在和谁说话吗！我是——的收割者] 她的声音越来越小，意识到你确实把她按倒了，所以她做不了什么。");
            outputText("[pg]你问她是否仍然信任你，她向你确认是的，她仍然信任你。尽管挣扎，她的脸表明她仍然很有兴致，你钦佩她为了不失去她现在唯一理智的朋友而压抑自己的欲望。你确信玛瑞斯大多数欲求不满的人只要能发泄出来就不会再在乎了，所以这一定是她成长的那个时代的真实写照。");
            outputText("[pg]然后你问她是否想继续。伊芙琳似乎对你问题的直接感到有些惊讶，而且考虑到你自己肯定也欲求不满，你竟然还会征求她的许可。尽管在初次见面时被她攻击，被她强加了一个危险的任务，知道她做了什么，也知道追求她的危险，你告诉她你仍然来这里见她并陪伴她，因为你关心她。即使你不能和她建立传统的关系，或者在不导致她死亡的情况下治愈她，你也不认为这意味着她应该感到不被爱、孤独和性挫折。");
            outputText("[pg]当你讲完时，伊芙琳的头已经变成了紫色，她金色的眼睛里满是震惊。她现在看起来就像一个长着白头发的萝卜。她张开嘴，几秒钟说不出话来，当她能说话时，嘴里吐出的全是胡言乱语。她自信的伪装完全粉碎了，变成了一个结结巴巴的头。对她来说，如果你处于她的位置，你可能也不知道该从哪里开始回应，尤其是在这么多年后可能已经放弃了这些感情。谁能想到，尽管发生了一切，你还是会爱上这个可爱的“死亡先驱”呢？");
            outputText("[pg]当伊芙琳的头还在背景中嘟囔着试图说出连贯的句子时，你把头转向了身体。你不知道当她失去控制时，是什么力量驱使着她的身体，它是否能听懂你的话，但你还是打算试一试。你告诉伊芙琳的身体，如果它想发泄，最好在你在场的时候让它的头来思考，否则你会毫不犹豫地再次亲自处理，并尽一切努力阻止它。你用一种冷酷严肃的语气和一种甚至能吓跑最大的牛头人的怒视结束了那个威胁。如果说在这片土地上生存让你变成了什么，那就是一个连超自然生物都应该害怕的具有威胁性的战士。一个通常随时准备做爱的战士。");
            outputText("[pg]身体停止了它正在进行的任何挣扎，似乎在仔细考虑你的威胁，不确定你到底会做什么。你相信未知会让威胁变得更可怕，不过，你也不完全确定你会做什么。突然，手臂开始烦躁不安，复制了那个紧张地喋喋不休但现在已经连贯的无头骑士的头，她似乎没有意识到发生了什么。你希望你现在能回应她，谈谈那些感受，但你低头看着伊芙琳暴露在外的美丽的浅蓝色乳房，你压抑的欲望像一袋砖头一样击中了你。");
            outputText("[pg]你向后伸手，仍然跨坐在她身上，将伊芙琳的头抬起来，与你的脸相对。你的手刚碰到她，她就安静下来，冷静下来，融化在你的手中。得知你的心意后，她毫不犹豫地用口型说出[say: 占有我吧...]，半睁的眼睛注视着你。");
            outputText("[pg]你将伊芙琳的脸凑近，你们的舌头带着新的激情再次交织在一起。你甚至不在乎她的脸因为侧躺在地上而沾满了泥土。你的心因情感而悸动，因为这个吻与之前的完全不同。似乎无头骑士也有同感，无需多言。你腾出另一只手向后伸去，掀起她的裙子，直奔她渴望的小穴。你跳过了前戏，将两根手指插入她冰冷的深处，同时拇指继续在她阴蒂上挑逗。她在你紧锁的唇间含糊地念着你的名字。你花了一点时间感受周围的一切，背后篝火的温度，身前寒冷的夜风，你的[vagina]滴下滚烫的液体落在她的肚子上，伊芙琳的舌头与你的舌头共舞，以及那具丰满的淡蓝色身体在你熟练的手指带来的快感下挺动。你决定，在满足自己的需求之前，不让这位死亡女王先高潮是不礼貌的。");
            outputText("[pg]你结束了亲吻，让伊芙琳喘口气，她裸露的胸部在你身下起伏，而你继续探索她冰冷小穴的内壁，并在她身后轻轻把玩她的阴蒂。是时候让这个无头荡妇达到高潮了。你将第三根手指插入她的小穴，这让她的眼睛瞬间睁大。她开始用尽全力将臀部在你的手上摩擦，但她的释放仍然完全取决于你的手指。你告诉她，你知道她想用她的淫液涂满你的手，但在她回答几个问题之前，你不会让她完全高潮。被欲望冲昏头脑的无头骑士回答道：[say:是！是-是的！]");
            outputText("[pg]第一个问题，现在谁是你的主人？她的脸看起来完全放松了，已经屈服于她的欲望。她犹豫着没有回答，所以你放慢了速度，作为回应，她脱口而出：[say:你！一直都是你！]你简直不敢相信伊芙琳居然真的让你这么做！你之后一定会拿这件事来取笑她。你加快了手的节奏，作为对她回答的奖励。从她唇间溢出的淫荡呻吟，在你的耳中听起来就像做爱一样。");
            outputText("[pg]下一个问题，谁会永远是你的荡妇无头骑士？她不想让你再次放慢速度，立刻回答道：[say:我-我！我是你的荡妇无头骑士！]你再次加快了节奏，并在她的阴蒂上施加了更多的压力。她盯着你的[genitals]，舌头从嘴里掉了出来。");
            outputText("[pg]最后一个问题，你其实很享受四处游荡，把每个人的灵魂都操出来的每一秒，对吧，荡妇？她的眼睛抬起来与你对视。虽然她淫荡的面部表情没有任何变化，但你感觉到沉默就是反抗。你突然停止了手上的动作。她喘着粗气尖叫道：[say:是的！我是！我就是个肮脏邪恶的荡妇！]你迅速将她的嘴唇拉向你，粗暴地在她的阴蒂上旋转拇指，同时尽可能快地在她体内抽插三根手指。她的金眸睁得大大的，舌头停止了与你的纠缠。她尽其所能地在你的嘴里尖叫，眼泪开始在她的眼眶里打转。她的小穴收缩并紧紧夹住你的手指，让你甚至无法移动它们，所以只剩下你的拇指继续工作。淫液开始从你的手指间涌出，浸湿了地面。你旋转的拇指仍在她超级敏感、充血的阴蒂上工作，这让她难以忍受，她的手开始试图把你的手指拉开，但事实已经证明你太强壮了，她无法抵抗。她的手从你的手臂上滑落，眼睛翻白。她终于放松下来，高潮已经过去，你从她湿透的小穴中抽出了手指。");
            outputText("[pg]你将她的头从你面前移开，你们的嘴唇之间挂着唾液的拉丝。她的眼神非常火热，似乎在暗示她现在愿意为你做任何事。很高兴她终于可以放手，不用担心她的身体会接管，因为你已经确保了这一点。");
            menu();
            if(get_player().hasVagina())
            {
               addButton(0,"小穴",cuddleFinishVagina).hint("让她取悦你的小穴。");
            }
         }
         else
         {
            outputText("伊芙琳的身体压倒了你试图束缚她的力量。她把你甩到一边站了起来，乳房微微晃动，肢体语言表明她有点生气。你看到伊芙琳的头，现在因为挣扎而侧躺着，松了一口气。她似乎重新控制了她那沮丧的身体，身体把她抱起来，擦去了她脸颊上的泥土。她沮丧地对你说：[say:对不起，但我相信你能处理好……当那种情况发生的时候。幸好没有以灾难告终。]");
            outputText("她悲伤地看着你，继续说道：[say:我需要一个人静静……但谢谢你来。]她迅速整理好紧身胸衣，收拾起地上的东西，然后迅速转过身背对你，她的斗篷也同样迅速地在空中飞舞，盖住了她的背。你对刚才发生的事情感到有些恐惧，熄灭了火焰，回到了营地。");
            doNext(get_camp().returnToCampUseTwoHours);
         }
      }
      
      public function cuddleInsist() : void
      {
         var _loc1_:* = null as Player;
         spriteSelect(SpriteDb.get_dullsprite());
         clearOutput();
         if(saveContent.rimmingProgress < 1)
         {
            saveContent.rimmingProgress = 1;
         }
         if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,2674) < 3)
         {
            outputText("你的手拉扯并扭弄着无头骑士那躁动不安的身体上暴露的乳头。一阵肉眼可见的颤栗顺着她的脊背蔓延，但她的手却将你拍开。[say:对不起，[name]，但请相信我，这是为了我们好。]");
            outputText("[pg]她的身体站了起来，捡起她的头。她继续说道，[say:如果你控制不住自己，那我就必须离开了。]她走向她的马。[say:……谢谢你陪我。]");
            outputText("[pg]无头骑士策马离去，只留你一人在营火旁。她为什么非得这么保守？你耸耸肩，扑灭了营火，回到了营地。");
            doNext(get_camp().returnToCampUseTwoHours);
            _loc1_ = get_player();
            _loc1_.set_lust(_loc1_.get_lust() + 10);
         }
         else
         {
            outputText("你把她的头从你的胸口抬起来，然后坐起身，她的身体也跟着坐了起来。你把她的头举到与视线齐平的位置，拨开她脸上的头发，告诉她你明白会发生什么。她看着你的眼睛，眼神放松下来，相信你会就此打住。她回答说，[say: 谢谢你——]但你打断了她的话。");
            outputText("[pg]你直呼伊芙琳的名字，温柔地请求她相信你，向她保证不会有真正的插入，而且如果情况不妙你会处理好的。毕竟你可是阻止了死灵法师的伟大英雄，你自豪地宣称。伊芙琳转头看向自己的身体，她那美丽的淡蓝色双乳现在完全暴露在火光之下。它们高高挺立，乳头因为极度兴奋而变得坚挺，几乎呈现出紫色。她的双手合十，似乎在恳求自己的头颅答应。她笑了笑，重新看向你的眼睛。");
            outputText("[pg][say: 好吧。我相信你，[name]，但要温柔点，]她说着移开了视线，脸颊泛起紫色的红晕。");
            outputText("[pg]你们俩没有浪费任何时间，立刻回到了正题。你释放出湿透的[genitalsdetail]，终于让它摆脱了束缚。刚才那番火热的拥抱绝对让下面变得又湿又黏。伊芙琳的一只手伸去把玩自己的乳房，另一只手则伸向你跳动的[genitals]，终于给了你之前一直渴望的第一次触碰。这让你的脊背一阵发麻，你闭上了眼睛。此时此刻，你的脑海中除了[genitals]里的每一根神经末梢被无头骑士的每一次套弄所满足之外，再无其他。");
            outputText("[pg]这感觉终于如同极乐，但你也不能忘了好好侍奉伊芙琳。你的一只手松开了她的头，盲目地摸索着她那紧致柔软的屁股。找到后，你用力地拍了一巴掌，半睁开眼睛，看到伊芙琳的脸上闪过一丝愤怒和震惊。但随着欲望压倒了愤怒，这种情绪很快就消退了。你抓着她的屁股把她的身体拉向你，然后松开那把丰臀，将手迅速探入她那形状完美的淡蓝色双腿之间。伊芙琳的眼睛完全睁大了，疯狂地看着那只靠近她下体的手。她在沉重的呼吸间咽了口唾沫，然后满怀期待地咬住了嘴唇。");
            outputText("[pg]你的手滑入她的短裙下，用一根手指勾住她的内裤边缘，灵巧地将其拉到一边，立刻将她那渴望的蓝色小穴的湿热暴露在你的手中。你想知道她上一次真正经历像今晚这样的事情是什么时候，或者她无论是在生前还是死后是否经历过。你慢慢地将中指探入她那危险的、吸人灵魂却又诱人的湿润小穴中。令人惊讶的是，里面很冷。一种超自然的冰冷。也许你感觉到的热量仅仅是血液流过她不死族血管时产生的？尽管这个想法很奇怪，但你并没有停下，一旦你的手指沾满了淫液，你就开始将她的淫液涂抹在她的阴唇和阴蒂上。当你滑过她的阴蒂时，她微微瑟缩了一下，放在你[genitals]上的手也随之一紧，导致你也跟着紧绷起来。");
            outputText("[pg]以玛莱和伊芙琳的名义，这个淡蓝色的小穴有多久没被人碰过了？一个戏谑的笑容浮现在你的脸上，你湿润的手指慢慢地在她肿胀的阴蒂周围画圈，偶尔在手指旋转时擦过它的边缘。每次你触碰它，她的手就会在你的下体上猛地收紧，接着加快套弄的速度，仿佛是为了弥补你失去的快感。不过你并不介意，因为这个无头骑士在你手中就像黄油一样柔软，这足以让你的[genitalsdetail]兴奋地颤抖。你看着被你另一只手捧着的无头骑士那充满情欲的脸，她显然完全没有意识到周围的环境。你把她的头放在你的大腿之间，她饥渴地开始用笨拙的舌头啃咬和舔舐你的[genitals]，同时她的手也在继续动作。");
            outputText("[pg]你终于决定在指法上直捣黄龙，手指螺旋状移动直到停在她的阴蒂上，并在上面画圈，同时你的另一根手指浅浅地插入她冰冷的小穴。她开始失去控制，无法承受这种感觉，迅速向高潮攀升。你对着这位所谓的“死亡使者”露出胜利的微笑，但突然一阵寒意流遍你的全身。伊芙琳的头在短暂的喘息中停了下来，她那依然迷离但主要充满恐惧的金色眼睛抬头看着你。你把手从她的小穴里抽了出来。该死……");
            outputText("[pg][say:我的身体……[name]，请现在就停下这一切！]");
            outputText("[pg]已经太迟了。她的身体停止了把玩你的[genitals]，你感觉到有手抓住并把你的双肩往下推，让你再次平躺在背上。伊芙琳的身体现在压在你的上面，她滴着水的小穴悬在你的生殖器上方……");
            if(get_player().hasCock())
            {
               doNext(cuddleCock);
            }
            else
            {
               doNext(cuddleNoCock);
            }
         }
      }
      
      public function cuddleFinishVagina() : void
      {
         spriteSelect(SpriteDb.get_dullsprite());
         clearOutput();
         outputText("你把她的头放在你的双腿之间，你湿润的小穴离她只有一厘米远" + (get_player().hasCock() ? "，你的[cock]被推到她头的侧面" : "") + "。你感觉到她气喘吁吁的热气覆盖了你的小穴。她用那双美丽的金色眼睛抬头看着你，开始舔舐，在保持眼神交流的同时，绝对决心要取悦她的新情人。她的舌技堪比她的剑术。你开始想她是不是经常在自己身上练习这个。她的舌头快速地在你的腔道里探索，偶尔停下来吸吮你的阴唇，在你身上轻轻呻吟，同时在每一顿新获得的“美餐”上挥舞着舌头。伊芙琳似乎是从下往上这样工作的，舔舐着你自拥抱以来就一直沾染着的滚烫汁液。她的眼睛仍然盯着你，观察着你的反应。");
         outputText("[pg]当伊芙琳还在往上舔的时候，她的一只手开始轻轻地挑逗和拉扯你的乳头，而另一只手则伸到你身后，紧紧地抓住你的屁股。她这样采取攻击性的主动行动是很不寻常的。你屁股上的一根手指爬向你的肛门，轻轻地插了进去。与这里大多数东西对你屁股做的事情相比，对你肛门缓慢而温和的刺激令人愉悦。你倒吸了一口凉气，因为无头骑士的嘴终于到达了顶部，你意识到她的最终目的地在哪里。她轻轻地吸吮着你敏感的阴蒂，舌头在周围游走，但还没有碰到它。她不再看着你，因为她闭上了眼睛，专注于她的任务。偶尔她会停下来轻轻地啃咬它，仿佛她想尽她嘴巴所能提供的一切。她的手停止了对你乳头的挑逗，把她的头用力地塞进你的小穴，把你小穴的湿润涂满了她的脸。她逐渐增加吸力，现在正直接用舌头舔舐你充血阴蒂的每一平方毫米。你屁股里的手指加快了抽插的速度。你再也无法坐直了，所以你向前倒去，双手直接落在她淡蓝色的乳房上，你开始揉捏那对乳房以示感激。");
         outputText("[pg]察觉到你的决心动摇了，伊芙琳开始对你的阴蒂和屁股发起猛烈的攻势。她用力吸吮着你的阴蒂，舌头在上面快速扫过。她的手指现在正疯狂地抽插着你那顺从的屁股……你高潮只是时间问题……你喘着粗气，然后用力咬紧牙关，从牙缝里挤出一声大喊：[say: 伊芙琳！] 感觉到你的高潮，无头骑士的头并没有停止她疯狂的动作，同时她又在你的屁股里加了一根手指，尽可能深地插进去并保持在那里。你对她毫不留情，她为什么要对你留情？你非常乐意让她“报复”。你猛烈地高潮了，喷了她一脸和她那结实的肚子，但她甚至没有退缩。她让你在她的脸上享受高潮直到结束。随着你的高潮平息，你倒在她的身体旁边，粗暴地抽出你屁股里的手指，开始大口喘气。");
         doNext(cuddlePostSex);
      }
      
      public function cuddleFinishCock() : void
      {
         spriteSelect(SpriteDb.get_dullsprite());
         clearOutput();
         outputText("你的肉棒已经硬了这么久，你简直准备好要操地了。谢天谢地，伊芙琳在你的身下，她淡蓝色的乳房在她的皮革紧身胸衣上方依然一览无余……她的紧身胸衣！当然！你把伊芙琳的脸放在你的肉棒末端，她毫不犹豫地张开了嘴。你的欲望让你立刻把那个无头骑士的头一直插到底。" + (get_player().longestCockLength() > 15 ? "你那巨大的尺寸让隐藏她脖子的布料上出现了一个明显的凸起" : "") + " 她轻松地承受着你的肉棒在她喉咙里的猛烈撞击，甚至在看着你的时候试图说些什么，[say: 我爱泥。] 你不知道她说了什么，但看到她为了说出这句话而把口水喷到你的" + (get_player().balls == 0 ? "胯部" : "蛋蛋") + "上，真是太性感了。");
         outputText("[pg]尽管你很想躺下来，让她的头在接下来的整个晚上都保持这个姿势，但你不想错过做爱后即将到来的拥抱。你把她的头从你的鸡巴上拉开，她咳出了口水和先列腺液，弄得自己满身都是。你低头看着你坚硬的肉棒，判断它现在已经足够润滑，可以继续你的计划了。你揉皱她的紧身胸衣，露出她结实但柔软的浅蓝色肚子。你把你的鸡巴平放在她的肚子上，把紧身胸衣向上拉起，足以把你沾满口水的肉棒推到下面。没错，你要操她的紧身胸衣。你松开紧身胸衣，它啪的一声贴在你的胯部，把你的一部分鸡巴包裹在里面。");
         outputText("[pg]伊芙琳对你的想法感到好笑。你完全向前挺进，你的一部分鸡巴穿过她皮革紧身胸衣的顶部，越过她的乳房。无头骑士用她的双手将她的乳房挤压在你暴露的鸡巴上。作为最后的点缀，她要求你把她的头移到她乳房的顶部，让她的嘴接纳你剩下的长度。你接受了这个安排，把她的头移到你的鸡巴尖端，把它向前拉，让她的嘴接纳龟头和未被覆盖的长度。现在有四种不同的质感作用在你的鸡巴上，她结实的躯干皮肤，她紧身胸衣光滑的皮革底面，她柔软的乳房，以及她嘴里温暖的湿润。你为这个想法拍了拍自己的背" + (get_silly() ? "，作者也是" : "") + "。");
         outputText("[pg]你把手放在她的头顶，穿过她柔滑的白发，稳住你自己和她的头。为了增加力度，你还把另一只手直接放在她的肩膀上，用你巨大的力量把它推向地面。你慢慢地在各种质感中来回抽插你的肉棒，并欣赏每一种感觉。她的舌头迅速地缠绕着塞进她脸里的任何长度，并在上面大声呻吟，以产生一种振动的感觉。她闭上眼睛专注于这个动作，因为她想尽可能地取悦她新交的爱人。你也闭上眼睛片刻，专注于感受每一寸来回滑动带来的快感。");
         outputText("[pg]你再也等不及了。你成倍地增加了抽插的速度。伴随着你的欲望，你的呼吸变得沉重而急促。没过多久，汗水开始在你的脸上凝结，你达到了你的臀部愿意移动的最快速度。伊芙琳睁开一只眼睛看了一秒钟你那疯狂享受的状态，然后闭上眼睛时脸红了。感觉她的嘴甚至更坚决地要把你的鸡巴榨干，因为她的吸力和舌头速度增加了一倍。你的鸡巴感觉到了变化，但你的大脑现在只是一片充满欲望的模糊，只等着达到清晰。你感觉到即将到来的高潮" + (get_player().balls == 0 ? "，因为你的肌肉在你的前列腺周围收缩" : "，因为你的蛋蛋开始收紧并抬起") + "。你强忍着，刚好够时间告诉伊芙琳");
         if(get_silly())
         {
            outputText("一些事情。[pg][say: 见证我！]");
         }
         else
         {
            outputText("看着你把她的嘴射满精液。");
         }
         outputText("[pg]她睁开眼睛，正如你所愿地直视着你。你尽可能用力地向前挺进，释放了对高潮的控制。你猛烈地高潮了，导致她肩膀上的手臂摇摇欲坠，几乎无法支撑你。你长时间的勃起状态导致你射出的精液比平时多" + (get_player().cumQ() > 1000 ? "，考虑到你平时那惊人的射精量，这真是一个了不起的成就" : "") + "。每次有一大团浓稠的精液喷进她的喉咙时，她的眼睛都会眯起来，但仍然致力于保持眼神交流。她拒绝浪费一滴，并且仍然继续用她的嘴刺激你的鸡巴。这种情况持续了几秒钟，直到刺激变得难以忍受，导致你的身体本能地向后退。当你这样做的时候，你留下了一道从她的嘴到她肚脐的精液痕迹，你倒在她的旁边，试图喘口气。");
         doNext(cuddlePostSex);
      }
      
      public function cuddleEnd() : void
      {
         spriteSelect(SpriteDb.get_dullsprite());
         clearOutput();
         outputText("你的梦很美好。你把魔王按在地上锁喉，而伊芙琳的身体则用手肘猛击他们。伊芙琳的头放在桌子上为你们俩加油。在用各种双打摔跤动作击败魔王后，你们互相击掌。捡起她的头后，你们俩骑上一匹肌肉发达的披甲种马，听着马蹄声在地上敲击，你们俩一起骑向夕阳。");
         outputText("[pg]你在营地里醒来，整齐地盖在你的[bed]里。你想知道你是怎么回到这里的，然后注意到你旁边放着一朵黑玫瑰。你把它拿起来仔细端详。它无可否认地已经枯萎死亡，但香气依然甜美。你笑了；毕竟，无头骑士对诗歌和浪漫并不陌生。");
         get_player().sleeping = true;
         doNext(get_camp().returnToCampUseEightHours);
      }
      
      public function cuddleDull2() : void
      {
         spriteSelect(SpriteDb.get_dullsprite());
         clearOutput();
         outputText("你收集了一些散落的石头和枯木，生起了一个简单的营火。火生得很顺利，无头骑士坐在附近" + (FlagDict_Impl_.arrayReadInt(KFLAGS.flags,2674) == 3 ? "" : "，她的镰刀就放在旁边") + "。你没有害羞，走过去坐在她旁边，把自己的装备放在她的装备附近。你们开始讨论对抗这片土地上各种敌人的战斗技巧，讨论日常生活，讨论你曾经认识的人，以及如果她想去拜访的话，你的营地在哪里。");
         outputText("[pg]当你看着无头骑士的脸时，你意识到由于这些夜间拜访的性质，你很少在充足的光线下看到她。她柔和、浅蓝色的女性面部特征现在被完全照亮，她有一张非常可爱的脸。当她意识到你一直在盯着她看时，她的脸颊上泛起了一丝紫晕。");
         outputText("[pg]你邀请她和你一起躺在森林的草地上。她点点头，加入你的行列，把头放在你旁边，直视上方树叶茂密的树冠，然后让她的身体侧躺在与头相反的一侧，环抱着你。她的乳房贴着你的侧身，双臂放松，一只放在你的胸前，另一只放在你的脖子下。如果她的头连在身体上，大概会在你肩膀附近。");
         outputText("[pg]你低头看着她脖子上的深渊，不禁想问她是如何吃喝的。然而，提问的诱惑很快就消失了，被你舒适的处境冲刷得一干二净。她那条肌肉匀称的浅蓝色大腿缠绕在你的腿上。你们俩透过上方的树冠看着星星。");
         outputText("[pg]有那么一瞬间，你感觉自己回到了英格纳姆，远离了恶魔，远离了危险，远离了邪恶。你闭上眼睛，深呼吸，微风吹拂着周围树木的枝叶。");
         outputText("[pg]无头骑士用空闲的手臂把头从身侧捞起，放在你的脸颊上蹭了蹭，用你脖子下的手臂固定住位置。你转头看着她，看到她脸上满足的表情。");
         outputText("[pg]你再次感到自在。只是一个" + get_player().mfn("男人","女人","阉人") + "在夜里享受着与[his]约会。你看着她。她的身体没有任何玛瑞斯常见的非人特征。你的手沿着她的脊背滑下，缓缓地左右移动，为她按摩，这让她脸上满足的神色更浓了。");
         outputText("[pg]被一个有着如此光滑身体的可爱无头骑士拥抱的感觉无疑棒极了。她那丰满柔软的乳房，形状优美的屁股，匀称的女性双腿，还有你很想掰开来照顾她那无人疼爱的阴——");
         outputText("[pg]无头骑士注意到了你脸上散发出的热量和你加深的呼吸。你看到这些变化也开始让她兴奋起来，因为原本放在你胸前的手臂现在正在挑逗你的一个乳头。你用放在她背上的手，开始解开她紧身胸衣的带子，让你幻想的那些柔软的乳房溢出到你身上。");
         outputText("[pg]在做这些的同时，你转头看向那颗羞红的头颅，她此刻的深呼吸正与你同步。你用另一只手臂将她的头拉向自己，在她的唇上印下轻柔的一吻，随后双舌交缠，探索彼此的口腔。她的身体开始慢慢在你的身侧摩擦着胯部，显然已被情欲冲昏了头脑。那只原本在挑逗你胸部的手现在慢慢向你的胯部滑去。这种缓慢的靠近，即将带来对你" + (get_player().hasCock() ? "坚挺[cock]" : "湿润[vagina] ") + "的第一次欢愉触碰，让你陷入了疯狂，使你对着空气挺动腰肢，仿佛在催促它快点到来。");
         outputText("[pg]你将她束腰的系带解得足够松，让她的一团柔软溢出到你的身体上，随着她不断的摩擦，那团柔软在你的躯干上拖拽。随着她乳房的移动，你感觉到她坚硬的乳头一遍又一遍地刮擦着你。真是个淫荡又欲求不满的小无头骑士！");
         outputText("[pg]突然，她的手停在你的[lowergarment]下摆一半的地方，让你不满地呻吟起来。无头骑士中断了亲吻，手也缩了回去。[say: 停……停下！]无头骑士的头颅在充满情欲的喘息中喊道，那气息喷洒在你湿润的嘴唇上。");
         outputText("[pg]她喘着气，你把她的头放在你的胸前，在你们的嘴唇之间拉出一条银丝。你抬起头，低头对上她半睁的金色眼眸，此刻她的瞳孔已经放大。她的身体仍然在你的身侧轻轻摩擦，但动作开始慢了下来。[say: 我们必须停下。我们不能这样做，]她坚定地说。");
         saveContent.seenBody = true;
         menu();
         addButton(0,"停下",cuddleStop).hint("她了解自己的身体。最好还是停下来。");
         addButton(1,"坚持",cuddleInsist).hint("向她保证如果事情失控你能应付。你足够强壮，对吧？");
      }
      
      public function cuddleDull() : void
      {
         spriteSelect(SpriteDb.get_dullsprite());
         clearOutput();
         outputText("你快速环顾了一下树林，以强调你接下来要问的问题。她一个人在这里不觉得孤独吗？问完后，你露出关切的神情。无头骑士茫然地看着你，似乎在思考你的问题，然后带着一丝惆怅的叹息将目光移向地面。[pg]");
         outputText("[say: 嗯，我想你会同意，这里没有多少交朋友的机会。而且我仍然是“死亡使者”，看起来可不怎么友好。]她微微退缩，双臂抱在胸前。[say: 你是我很长一段时间以来第一个真正陪伴我的人。所以……]");
         outputText("[pg]你开始靠近她，这让她有些不安地盯着你。你把手放在她柔软的肩膀上，她笑了。她松开手臂，抬起金色的眼睛直视你的目光。");
         outputText("[pg]你说如果她愿意，你会接受邀请和她共度良宵。你把手从她肩膀上拿开，等待她的回答。无头骑士对你挑了挑眉，看起来有些惊讶，说道：[say: 你离开营地来这里和我共度一晚？]她脸上的疑惑消失了，取而代之的是狡黠的表情，[say: 呵……如果你愿意和死亡本身躺在一起，那你一定很孤独。]你轻笑了一声。");
         if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,2001) > 30)
         {
            outputText("在玛瑞斯待了这么久，你可能和更糟的家伙躺过。");
         }
         outputText("[pg]她补充道：[say: 好的，[name]，我允许你和我共度良宵，]她说着，暂时进入了她的角色。");
         doNext(cuddleDull2);
      }
      
      public function cuddleCock() : void
      {
         var skipStart:Boolean;
         var _g:DullahanScene;
         spriteSelect(SpriteDb.get_dullsprite());
         clearOutput();
         outputText("尽管现在刺穿伊芙琳的小穴并震撼她那不死的世界会非常诱人，但你觉得你的任务不值得为了一个淡蓝色的屁股而冒险。此外，伊芙琳信任你能阻止这种情况发生。你鼓起力量，试图把她推到一边，然后翻身压在她身上。");
         if(get_player().get_str() > 80)
         {
            outputText("你轻松地抓住她的双臂，将她从你身上举起，然后翻身。你现在骑在无头骑士的身体上，用强壮的双臂将她死死按住。这具身体拼命挣扎反抗，但很明显，她的反抗无济于事。");
            outputText("[pg]伊芙琳的头在挣扎中侧倒在一旁，看到你获胜后，她可爱地松了一口气。[say:刚才真是吓死我了。我想我们今晚就到此为止吧，免得……]你回头看着她的头，轻轻地[say:嘘]了一声。她对被打断感到恼火，回答道：[say:别对我“嘘”！你知道你在跟谁说话吗！我可是——]她的声音渐渐小了下去，意识到你确实把她按得死死的，她也做不了什么。");
            outputText("[pg]你问她是否仍然信任你，她向你确认是的，她仍然信任你。尽管挣扎，她的脸表明她仍然很有兴致，你钦佩她为了不失去她现在唯一理智的朋友而压抑自己的欲望。你确信玛瑞斯大多数欲求不满的人只要能发泄出来就不会再在乎了，所以这一定是她成长的那个时代的真实写照。");
            outputText("[pg]然后你问她是否想继续。伊芙琳似乎对你问题的直接感到有些惊讶，而且考虑到你自己肯定也欲求不满，你竟然还会征求她的许可。尽管在初次见面时被她攻击，被她强加了一个危险的任务，知道她做了什么，也知道追求她的危险，你告诉她你仍然来这里见她并陪伴她，因为你关心她。即使你不能和她建立传统的关系，或者在不导致她死亡的情况下治愈她，你也不认为这意味着她应该感到不被爱、孤独和性挫折。");
            outputText("[pg]当你讲完时，伊芙琳的头已经变成了紫色，她金色的眼睛里满是震惊。她现在看起来就像一个长着白头发的萝卜。她张开嘴，几秒钟说不出话来，当她能说话时，嘴里吐出的全是胡言乱语。她自信的伪装完全粉碎了，变成了一个结结巴巴的头。对她来说，如果你处于她的位置，你可能也不知道该从哪里开始回应，尤其是在这么多年后可能已经放弃了这些感情。谁能想到，尽管发生了一切，你还是会爱上这个可爱的“死亡先驱”呢？");
            outputText("[pg]当伊芙琳的头还在背景中嘟囔着试图说出连贯的句子时，你把头转向了身体。你不知道当她失去控制时，是什么力量驱使着她的身体，它是否能听懂你的话，但你还是打算试一试。你告诉伊芙琳的身体，如果它想发泄，最好在你在场的时候让它的头来思考，否则你会毫不犹豫地再次亲自处理，并尽一切努力阻止它。你用一种冷酷严肃的语气和一种甚至能吓跑最大的牛头人的怒视结束了那个威胁。如果说在这片土地上生存让你变成了什么，那就是一个连超自然生物都应该害怕的具有威胁性的战士。一个通常随时准备做爱的战士。");
            outputText("[pg]身体停止了它正在进行的任何挣扎，似乎在仔细考虑你的威胁，不确定你到底会做什么。你相信未知会让威胁变得更可怕，不过，你也不完全确定你会做什么。突然，手臂开始烦躁不安，复制了那个紧张地喋喋不休但现在已经连贯的无头骑士的头，她似乎没有意识到发生了什么。你希望你现在能回应她，谈谈那些感受，但你低头看着伊芙琳暴露在外的美丽的浅蓝色乳房，你压抑的欲望像一袋砖头一样击中了你。");
            outputText("[pg]你向后伸手，仍然跨坐在她身上，将伊芙琳的头抬起来，与你的脸相对。你的手刚碰到她，她就安静下来，冷静下来，融化在你的手中。得知你的心意后，她毫不犹豫地用口型说出[say: 占有我吧...]，半睁的眼睛注视着你。");
            outputText("[pg]你把伊芙琳的脸拉近，你们的舌头带着新的激情重聚。你甚至不在乎她的脸因为侧躺而变得多脏。你的心因为情感而悸动，因为这个吻和之前的完全不同。似乎无头骑士也有同感，无需多言。你空出的手向后伸去，掀起她的裙子，径直探向她渴望的小穴。你跳过了前戏，将两根手指塞进她冰冷的深处，而你的拇指则继续之前在她阴蒂上的工作。她在你们紧锁的双唇间嘟囔着你的名字。你花了一点时间感受周围的一切，背后的火热，身前冰冷的夜风，你的[cock]滴下滚烫的液体落在她的肚子上，伊芙琳的舌头与你的共舞，以及那具丰满的淡蓝色身体在你熟练的手指带来的快感下挺动。你决定，在满足自己的需求之前，不让这位死亡女王先高潮是不礼貌的。");
            outputText("[pg]你结束了亲吻，让伊芙琳喘口气，她裸露的胸部在你身下起伏，而你继续探索她冰冷小穴的内壁，并在她身后轻轻把玩她的阴蒂。是时候让这个无头荡妇达到高潮了。你将第三根手指插入她的小穴，这让她的眼睛瞬间睁大。她开始用尽全力将臀部在你的手上摩擦，但她的释放仍然完全取决于你的手指。你告诉她，你知道她想用她的淫液涂满你的手，但在她回答几个问题之前，你不会让她完全高潮。被欲望冲昏头脑的无头骑士回答道：[say:是！是-是的！]");
            outputText("[pg]第一个问题，现在谁是你的主人？她的脸看起来完全放松了，已经屈服于她的欲望。她犹豫着没有回答，所以你放慢了速度，作为回应，她脱口而出：[say:你！一直都是你！]你简直不敢相信伊芙琳居然真的让你这么做！你之后一定会拿这件事来取笑她。你加快了手的节奏，作为对她回答的奖励。从她唇间溢出的淫荡呻吟，在你的耳中听起来就像做爱一样。");
            outputText("[pg]下一个问题，谁会永远是你的荡妇无头骑士？她不想让你再次放慢速度，立刻回答道：[say:我-我！我是你的荡妇无头骑士！]你再次加快了节奏，并在她的阴蒂上施加了更多的压力。她盯着你的[genitals]，舌头从嘴里掉了出来。");
            outputText("[pg]最后一个问题，你其实很享受四处游荡，把每个人的灵魂都操出来的每一秒，对吧，荡妇？她的眼睛抬起来与你对视。虽然她淫荡的面部表情没有任何变化，但你感觉到沉默就是反抗。你突然停止了手上的动作。她喘着粗气尖叫道：[say:是的！我是！我就是个肮脏邪恶的荡妇！]你迅速将她的嘴唇拉向你，粗暴地在她的阴蒂上旋转拇指，同时尽可能快地在她体内抽插三根手指。她的金眸睁得大大的，舌头停止了与你的纠缠。她尽其所能地在你的嘴里尖叫，眼泪开始在她的眼眶里打转。她的小穴收缩并紧紧夹住你的手指，让你甚至无法移动它们，所以只剩下你的拇指继续工作。淫液开始从你的手指间涌出，浸湿了地面。你旋转的拇指仍在她超级敏感、充血的阴蒂上工作，这让她难以忍受，她的手开始试图把你的手指拉开，但事实已经证明你太强壮了，她无法抵抗。她的手从你的手臂上滑落，眼睛翻白。她终于放松下来，高潮已经过去，你从她湿透的小穴中抽出了手指。");
            outputText("[pg]你将她的头从你面前移开，你们的嘴唇之间挂着唾液的拉丝。她的眼神非常火热，似乎在暗示她现在愿意为你做任何事。很高兴她终于可以放手，不用担心她的身体会接管，因为你已经确保了这一点。");
            menu();
            if(get_player().hasCock())
            {
               addButton(0,"肉棒",cuddleFinishCock).hint("让她取悦你的肉棒。");
            }
            if(get_player().hasVagina())
            {
               addButton(1,"小穴",cuddleFinishVagina).hint("让她取悦你的小穴。");
            }
         }
         else
         {
            outputText("[pg]唉，你没能推开她。你努力克制住恐慌。这下糟了，你马上就要被吸干了，无论是精液还是灵魂！伊芙琳对着她的身体尖叫道：[say:不！停下，求你了！[name]！]她的身体抬起一条腿，把她的头踢进了营火里，想让头停止发号施令。你听到伊芙琳的头在燃烧时发出了令人毛骨悚然的尖叫，这尖叫声将萦绕在你生命最后的时刻。然而现在，你发现自己欲火焚身，无法忽视接下来要发生的事情。]");
            outputText("[pg]一具无头尸体压在你身上，这景象相当令人不安，但那挺拔的双乳和紧致的双腿足以弥补这一点。她俯下身子压在你身上，完全吞没了你的[cock]，并在完全没入后扭动臀部，彻底品尝你的阴茎。她紧紧地夹住它，那紧致度是你不知道阴道能有的，而那种冰冷感让这种感觉变得独一无二。然而，真正让这种感觉与众不同的是你阴茎顶端正在发生的事情。那是一种超凡脱俗、超出人类理解范围的感觉。你立刻仰起头，在性爱真正开始之前就被带到了高潮的边缘。");
            _g = this;
            skipStart = true;
            doNext(function():void
            {
               _g.dullOhYouFuckedUp(skipStart);
            });
         }
      }
      
      public function askDullSex() : void
      {
         var _g2:DullahanScene;
         var _g1:DullahanScene;
         var _g:DullahanScene;
         spriteSelect(SpriteDb.get_dullsprite());
         clearOutput();
         if(lust >= 33 && get_player().get_lust() > 33 && FlagDict_Impl_.arrayReadInt(KFLAGS.flags,2674) == 3)
         {
            menu();
            if(!get_player().isTaur())
            {
               outputText("你问她是否愿意做爱。[say: 你知道吗？我今天醒来时就觉得有些心痒痒。我们可以玩玩，当然！不过，还是不能插入。" + (!saveContent.talkedAboutCurse ? " 这是绝对禁止的。你不会想知道为什么的。" : "") + "]");
               if(!saveContent.talkedAboutCurse)
               {
                  if(get_silly())
                  {
                     outputText("[pg]你想知道为什么。阴道长牙了？");
                  }
                  else if((FlagDict_Impl_.arrayReadInt(KFLAGS.flags,2673) & 2) != 0)
                  {
                     outputText("[pg]可悲的是，你知道为什么。");
                  }
                  else
                  {
                     outputText("[pg]你想知道为什么，但你决定最好还是不要打听。");
                  }
               }
               addButton(0,"腿交",dullThighjob).hint("过膝袜和紧致的双腿。你可以用这个来解决。").disableIf(!get_player().hasCock(),"这个场景需要你拥有阴茎。");
               addButton(1,"口交",dullBlowjobTease).hint("经典玩法绝不会出错。").disableIf(!get_player().hasCock(),"这个场景需要你拥有阴茎。");
               addButton(2,"舔阴",dullahanCunnilingus2).hint("这对你来说是个不必要的警告。").disableIf(!get_player().hasVagina(),"这个场景需要你拥有阴道。");
               if(get_player().hasKeyItem("Demonic Strap-On"))
               {
                  addButton(3,"假阳具",dullahanStrapOn).hint("她不能接受，但也许她能给予？");
               }
               if(get_player().countCocksOfType(CockTypesEnum.TENTACLE) >= 4)
               {
                  addButton(4,"触手之乐",dullTentacleFun).hint("和她一起享受触手的乐趣。");
               }
               if(get_player().get_gender() != 0)
               {
                  addButton(5,"拥抱",cuddleDull).hint("你可以选择简单的拥抱。");
               }
               if(get_player().hasVagina() && saveContent.rimmingProgress > 0)
               {
                  addButton(6,"舔肛",dullahanRimming).hint("让她关注一下你的另一个洞");
               }
               _g = this;
               setExitButton("返回",function():void
               {
                  _g.dullMenu();
               });
            }
            else
            {
               if(get_player().countCocksOfType(CockTypesEnum.TENTACLE) >= 4)
               {
                  addButton(0,"触手之乐",dullTentacleFun).hint("和她一起享受触手的乐趣。");
               }
               else
               {
                  outputText("你问她是否愿意做爱。[say: [name]，嗯……我知道你想要什么。我也想要。但是……你知道，你是一匹——我在找什么词来着——一匹马！或者至少，部分是。我有一匹马！我已经骑了她几十年了！如果我和你的……下半身做爱，那么我骑马时，我在这个世界上的剩余时间将会非常尴尬。既然我是不死族，这确实是很长的一段时间。对不起，我只是对那个不感兴趣。希望你能理解。]");
                  outputText("[pg]好吧，很少有人会这样直接拒绝和你做爱。");
               }
               if(get_player().cor + get_player().corruptionTolerance() > 60 && get_player().hasCock())
               {
                  _g1 = this;
                  addButton(1,"强奸",function():void
                  {
                     _g1.dullOhYouFuckedUp();
                  }).hint("如果不做爱，你是出不去的。");
               }
               addButton(2,"算了。",dullSexRefused).hint("好吧，是时候回营地了。");
            }
         }
         else
         {
            outputText("你问她是否对做爱感兴趣。她立刻嗤之以鼻，把头转过去，而她的身体却立刻兴奋地跳了起来，来回走动。她沮丧地叹了口气。很明显，她的身体和……她，在某些话题上有着不同的意见。");
            outputText("[pg][say: 嗯，不，我真的不感兴趣。]你提到她说话时身体正向前倾，双臂将乳房挤在一起。[say: 听着，我是个亡灵。我有点……性冷淡，这不是很合理吗？然而，我的身体似乎有点性冲动。既然是我在控制，我拒绝。]");
            outputText("[pg]听到这话，她的身体沮丧地瘫软下来。也许如果你把无头骑士挑逗得足够兴奋，她就会在冲动之下屈服。但现在，她冷得像块石头。");
            addButtonDisabled(2,"做爱？","看来这不是个选项。");
            if(get_player().hasCock() && get_player().cor + get_player().corruptionTolerance() > 60)
            {
               outputText("[pg]你可以直接强上。你敢打赌，一旦你开始，身体就会接管一切，而头颅除了看着什么也做不了！");
               _g2 = this;
               addNextButton("强暴",function():void
               {
                  _g2.dullOhYouFuckedUp();
               }).hint("强上她。<b>这是个坏主意。</b>");
            }
         }
      }
      
      public function askAboutDullStory() : void
      {
         var miss1:Boolean;
         var _g1:DullahanScene;
         var miss:Boolean;
         var _g:DullahanScene;
         var _loc2_:Boolean = false;
         var _loc3_:Boolean = false;
         var _loc4_:Boolean = false;
         spriteSelect(SpriteDb.get_dullsprite());
         clearOutput();
         outputText("你问起她的故事，并承诺也会分享你的故事。她移开视线，陷入了沉思。");
         outputText("[pg][say: 我……不确定该不该说。你先来吧；我得从头开始理一理这个故事。]");
         outputText("[pg]你告诉她你是如何被村子选中，作为一名高尚的英雄进入这个领域的。");
         menu();
         if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,2023) == 1)
         {
            outputText("然后你告诉她你的发现，也许你的村子只是把你当作献给恶魔的祭品。");
         }
         outputText("你告诉她你经历过的一些最值得注意的战斗，以及你在这");
         var _loc1_:int = get_time().days;
         if(_loc1_ < 30 == true)
         {
            outputText("花了些时间");
         }
         else
         {
            _loc4_ = _loc1_ < 50;
            if(_loc4_ == true)
            {
               outputText("一个月多");
            }
            else
            {
               _loc3_ = _loc1_ < 300;
               if(_loc3_ == true)
               {
                  outputText("好几个月");
               }
               else
               {
                  _loc2_ = _loc1_ < 600;
                  if(_loc2_ == true)
                  {
                     outputText("一年左右");
                  }
                  else
                  {
                     outputText("长达数年");
                  }
               }
            }
         }
         outputText("的冒险旅途中遇到的一些人。");
         outputText("[pg]她看着你，似乎更确定该怎么讲述她的故事了。[say: 呵，挺有趣的事，绝对独一无二。你的生活改变了很多，对吧？你想念你以前的生活吗？你知道的，就是在英格纳姆过着按部就班的日常，无忧无虑，不用每天为了生存而战，也没有迫在眉睫的威胁？]");
         outputText("[pg]这让你吃了一惊。你不确定自己是否曾停下来思考过这个问题。");
         _g = this;
         miss = true;
         addButton(0,"想念",function():void
         {
            _g.dullStory1(miss);
         }).hint("是的……你想念。");
         _g1 = this;
         miss1 = false;
         addButton(1,"不想念",function():void
         {
            _g1.dullStory1(miss1);
         }).hint("其实不想。");
      }
      
      public function askAboutDullSpooks() : void
      {
         spriteSelect(SpriteDb.get_dullsprite());
         clearOutput();
         outputText("你问她为什么总是试图吓唬她看到的每一个人。");
         outputText("[pg][say: 嗯，为什么不呢？这很有趣！我有这种……痒痒的感觉，你知道吗？当我看到一个可怜的家伙在森林里走来走去时，我就是忍不住要提醒他终有一死，把他的思想推向彻底的疯狂，把所有凡人不过是飞蛾，注定要永远受罚的念头埋进他的灵魂里……]");
         outputText("她原本轻盈匀称的身体开始变成一个无形的幽灵，她的声音也变成了一种更具诅咒意味的语调。这相当令人不安。然而，她注意到了这一点，并停了下来。");
         outputText("[pg][say: 是啊，这感觉棒极了。我还没遇到过我吓不跑的地精或小恶魔，但我猜像你这样心智坚定的人会比较难对付。不过，我迟早会得手的。]");
         outputText("[pg]你不确定自己是否喜欢被她攻破心防的想法，但她看起来还算天真无邪。");
         dullTalkMenu(askAboutDullSpooks);
      }
   }
}

