package classes.scenes.places.telAdre
{
   import classes.CoC;
   import classes.DynStat;
   import classes.PerkLib;
   import classes.Player;
   import classes.StatusEffects;
   import classes._FlagDict.FlagDict_Impl_;
   import classes.globalFlags.KFLAGS;
   import classes.internals.Utils;
   import classes.items.Weapon;
   import classes.items.WeaponLib;
   import classes.scenes.Camp;
   import classes.scenes.places.TelAdre;
   import coc.view.CoCButton;
   import flash.Boot;
   import haxe.IMap;
   
   public class Library extends TelAdreAbstractContent
   {
      
      public function Library()
      {
         if(Boot.skip_constructor)
         {
            return;
         }
         super();
      }
      
      public function youOkayBuddy() : void
      {
         clearOutput();
         outputText("你对奎恩的神情和明显的疲惫感到有些不安，忍不住询问他的身体状况。");
         outputText("[pg][say: 那些挤满这个小镇的马屁精们觉得在图书馆里疯狂而迅速地苟合会很有趣，完全不顾他们的污秽会落在哪里，也不管在这个过程中会损坏什么。所以，不，我感觉并不怎么好。]他回答这个问题时，声音里带着一丝你觉得毫无必要的讽刺。[say: 要把每一本书都检查一遍，列出损坏情况和细节，这得花上几个月的时间。更新索引，在现有的损坏之间进行交叉比对，重新评估将其放在书架上的合理性……这足以让人累垮。]奎恩回头看了看身后的图书馆，失望地摇了摇头。");
         outputText("[pg]你澄清说，你更多指的是他脸色苍白得吓人。");
         outputText("[pg]奎恩回以嘲笑，用手捋了捋头发（结果只是让头发更乱了）。[say: 作为契约组织的一员，我的职责——不，是特权——就是照看这座城市，保护它免受外部世界的伤害。然而，与我的许多同事不同，我选择在管理这个小镇——以及这个图书馆——方面承担实际责任。这就使得躲在高塔的一个房间里，整天冥想以维持小镇的防御……变得站不住脚。]这位疲惫的男人拍了拍马甲前面的灰尘，带着不小的骄傲。[say: 因此，我获得了一件小物品，它能让我的法师同僚们吸取我的魔法能力，并将其用于如此高尚的目的。如果我需要发挥我的全部能力，我只需将这件物品从身上取下，我引以为傲的活力和精力就会恢复，让我重新焕发青春。]他轻轻地笑了笑，揉了揉颧骨。[say: 在那之前，我很自豪能戴着我这个职位的所谓伤疤。要是每个人都有这样的无私精神就好了。]");
         outputText("[pg]终于得到了你想要的解释（甚至更多），你感谢他提供的信息，并决定以后尽量少和他说话。");
         doNext(get_telAdre().telAdreMenu);
      }
      
      public function visitZeMagesTower() : void
      {
         if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,861) == 0)
         {
            firstTowerVisit();
         }
         else
         {
            towerFollowUpVisits();
         }
         menu();
         if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,861) == 0 || get_game().time.hours <= 17)
         {
            addButton(1,"你还好吗？",youOkayBuddy);
            if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,175) > 0)
            {
               addButton(2,"玛丽",talkToMali);
            }
         }
         if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,860) > 0)
         {
            addButton(2,"玛丽",talkToMali);
         }
         addButton(0,"学习",studyInTA);
         if(get_game().time.hours <= 17)
         {
            addNextButton("帮助",libraryHelp);
         }
         if(get_player().hasKeyItem("Old Manor Books"))
         {
            addNextButton("给书",giveManorBooks).hint("把你在旧庄园找到的那些书交给她。");
         }
         var _loc1_:IMap = KFLAGS.flags;
         FlagDict_Impl_.arrayWriteInt(_loc1_,861,FlagDict_Impl_.arrayReadInt(_loc1_,861) + 1);
         addButton(14,"返回",get_telAdre().telAdreMenu);
      }
      
      public function towerFollowUpVisits() : void
      {
         clearOutput();
         if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,861) == -1)
         {
            if(get_game().time.hours <= 17)
            {
               outputText("你回到了法师塔。进入主房间，你惊讶地看到一个男人正小心翼翼地翻阅着其中一本大部头");
               commonQuinnTroduction();
            }
            else
            {
               outputText("和以前一样，这里没有人。至少这里不缺阅读材料。上下楼梯看了看，发现有两扇锁着的门，所以除了在这里学习，你不太可能做其他事情。");
               FlagDict_Impl_.arrayWriteInt(KFLAGS.flags,861,-2);
            }
            return;
         }
         if(get_game().time.hours <= 17)
         {
            outputText("你回到了法师塔。进入主房间，奎恩正在仔细检查一本书的书页。房间看起来比你上次看到时稍微整洁了一些，但看起来奎恩还需要花些时间来整理。");
            outputText("[pg]他注意到你来了，挑了挑眉毛。[say:有事吗？]他疲惫地问道，[say:有什么我可以帮你的吗？]");
         }
         else
         {
            outputText("你回到了法师塔。进入主房间，奎恩不见踪影。房间看起来比你上次看到时稍微干净了一些，但按照他的进度，似乎还需要一段时间才能整理完。");
            outputText("[pg]如果你想的话，你大概可以阅读这里的一些书，反正奎恩不在，没人会阻止你。上下楼梯看了看，发现有两扇锁着的门，所以你不太可能在这里做其他事情。");
         }
      }
      
      public function talkToMali() : void
      {
         clearOutput();
         if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,860) == 0)
         {
            outputText("你向奎恩提到你想和马里谈谈。[say: 啊，阿萨·马里，我们自己的阿丽森·德尔·阿丽亚娜。]奎恩轻笑了一声，揉了揉下巴。你觉得你们说的是同一个人。[say: 真神秘，她这样的人居然会有访客。我是在安排一场禁忌的幽会吗？一次秘密的约会？或者，考虑到她的工作性质，一些更……不祥的事情。]他好奇地凑近，但你清了清嗓子，问她是否在。他失望地叹了口气，指了指楼梯。[say: 是的，我们的森林女巫可不是什么交际花。]");
            outputText("[pg]他转过身，走上楼梯，打开了一扇通往二楼的隐蔽、看起来很安全的门，示意你跟上。楼梯环绕着高塔的墙壁，你在往上走的过程中经过了许多紧闭的门。不止几扇门里传出奇怪而陌生的声音，但奎恩似乎完全无视了它们。显然，这些在高塔里是司空见惯的。最后，在爬得比镇上任何其他建筑都要高（但还有很长一段路要走）之后，他转过身，在一扇木门上重重地敲了几下。");
            outputText("[pg]过了一会儿才有人回应，但最终门把手转动，门开了。门后站着一位疲惫但面带微笑的马里，她好奇地扬起眉毛。[say: 怎么了？]她问道，[say: 什么事，奎恩？]");
            outputText("[pg][say: 你有访客了，亲爱的，]奎恩指着你说道。[say: 请记住你晚些时候还有班，把自己累坏可不明智。]");
            outputText("[pg]马里闭上眼睛深吸了一口气，但当她睁开眼睛时，依然面带微笑。[say: 我会的，奎恩，谢谢你。]她转向你，走出门口。[say: 那么，请进。]你一让开，她就关上了门，快步走回办公桌前。马里的房间里堆满了你不知道是什么的物品，它们的设计和意图都很奇特。它们看起来充满了魔法，如果你仔细想想，考虑到她的工作，这完全说得通。[say: 是[name]，对吧？]她微笑着说。[say: 我们有一阵子没说话了，很高兴看到你来了。]这位女巫调整了一下胸前的苔藓围巾，坐直身子，双手交叠。[say: 让我正式介绍一下自己。我是审判官阿萨·马里，特尔阿德雷的安全官员。我与城市卫队密切合作，并在决定对城市犯罪的惩罚时担任仲裁者。此外，我还亲自出面解决城市卫队因任何原因无法正常发挥作用的突发情况。]");
            outputText("[pg]她向后靠了靠，揉了揉干裂的嘴唇，陷入了沉思。[say: 我之前找你就是为了这样一种情况，]她继续说道。[say: 秘术师多米妮卡。通常我不会投入市民的帮助来解决这件事，但恐怕我最初误判了这个案件所需的东西。这个女巫……]马里移开视线，思考着措辞。她的手漫不经心地移到桌子上的一把钥匙上，在手指间转动着。[say: 很聪明，]她最终确定了这个词，[say: 至少比我最初认为的要聪明。我不太确定她的意图，但我不认为它们会对这座城市有好处。]");
            outputText("[pg]哦，就这些吗？你知道她的意图。你张开嘴想解释，却发现自己无法清晰地表达这个想法。脑海深处隐约浮现出那张带着得意笑容的嘴唇。你沮丧地揉了揉额头，试图用语言描述你的经历，但失败了。[say: 是的，正是如此，]马里打断了你，[say: 根据你的症状，我已经能够清楚地指出谁遇到过她。问题是，复述这些症状毫无结果。可以这么说，这个多米妮卡已经有效地将自己隐藏起来，躲避了寻找或暴露她的企图。]");
            outputText("[pg]马里站起身，走到办公桌前坐下。尽管描述了她面临的问题，但她脸上依然带着自信的微笑。[say: 但我以前遇到过这种魔法，]她解释道。[say: 我知道怎么阻止它。]");
            outputText("[pg]这位调查员走上前，双手搭在你的肩膀上，微笑着。[say: 非常感谢你来找我。这已经比大多数人能做的要多了。]她的眼睛与你的目光相遇。她的眼睛奇特而异样，大而明亮，但并不令人反感。[say: 如果你以前见过她，她会愿意再见你的。我需要你继续去拜访她。去赢得她的信任。我需要的是一件她注入了力量的物品，]她解释道，[say: 一件被她的魔法激发过的东西。如果你能讨得她的欢心，我确信她迟早会把这样一件物品交给你的。]她捏了捏你的肩膀，然后拍了拍手。");
            outputText("[pg][say: 啊！]她惊呼道，[say: 但我真是个糟糕的女主人。让我给你倒杯茶吧。]");
            outputText("[pg]在接下来的拜访中，马里没有再谈论公事，而是和你一起喝茶，闲聊在特尔阿德雷的生活。这既礼貌又愉快，而且非常放松。最后你找了个借口离开，因为你需要回到营地。顺着长长的楼梯往下走时，你吓跑了一只停在高塔窗台上的乌鸦。");
            doNext(get_camp().returnToCampUseOneHour);
         }
         else if((get_player().get_weaponName() == "inscribed spellblade" || get_player().hasItem(get_weapons().S_BLADE)) && FlagDict_Impl_.arrayReadInt(KFLAGS.flags,862) == 0)
         {
            outputText("你告诉奎恩你是来见马里的。他对你带着的包裹着的剑似乎很感兴趣，但没有问任何问题。像往常一样打开二楼的门后，他护送你到了马里的住处。");
            outputText("[pg][say: 那是什么？]当你拿出那把刻有符文的魔剑时，马里好奇地问道。你把它放在桌子上，解释说你是从……从……马里看到你费力地无法解释，眼睛亮了起来。[say: 是的！]她兴奋地说，越过桌子抓住你的脸颊。她为了表示感谢，在你的嘴唇上快速而热情地亲吻了一下，然后低头看着那把剑，用手在上面抚摸着。");
            outputText("[pg][say: 是的，是的，]她一边检查一边说，[say: 这绝对是……是的，既然我知道了，我就能感觉到她。我能感觉到她倾注在里面的魔法。啊！]她兴奋得无法自拔，忍不住握紧双手，微微颤抖着，从一只脚跳到另一只脚。[say: 是的，我们能做到！我们能保护这座城市！]马里迅速绕过桌子，给了你一个大大的拥抱，她的乳房挤压着你的胸膛。[say: 太感谢你了，]她微笑着，[say: 你做了别人做不到的事。我知道这可能看起来没什么，但大多数人都忘了我甚至问过她。你不仅记得，你还……]她又拥抱了你一次，然后兴奋地跑回桌子后面，举起剑，仔细端详着。");
            outputText("[pg][say: 我要用这个来追踪她，]她解释道，[say: 然后召集一些卫兵，查明她到底在干什么。你应该好好休息，为致命的危险做好准备，然后再回来。]她脸上的笑容似乎怎么也抹不去。[say: 我现在无法想象如果没有你的帮助该怎么做。]");
            outputText("[pg][say: 请快点回来。]");
            outputText("[pg](<b>结局尚未完成……</b>)");
            if(get_player().get_weapon() == get_weapons().S_BLADE)
            {
               get_player().setUnarmed();
            }
            else
            {
               get_player().consumeItem(get_weapons().S_BLADE);
            }
            FlagDict_Impl_.arrayWriteInt(KFLAGS.flags,862,1);
            doNext(get_camp().returnToCampUseOneHour);
         }
         else
         {
            outputText("你告诉奎恩你是来找玛丽的。他翻了个白眼，但什么也没说，打开了二楼的门，再次带你上去。");
            outputText("[pg][say: 啊，你最近怎么样？] 玛丽看到你来，微笑着把一本厚书放在一边。你还没有任何能帮她找到多米妮卡的东西，但有人陪伴总是好的。她泡了些茶，你们俩闲聊起来。玛丽的笑声很清脆，当你逗她笑时，发出悦耳的叮当声。终于到了该离开的时候了。她感谢你的来访。");
            outputText("[pg][say: 记住，] 她在送你出门时说，[say: 任何你能从多米妮卡那里得到的，带有她力量气息的东西都会有帮助。]");
            doNext(get_camp().returnToCampUseOneHour);
         }
         var _loc1_:IMap = KFLAGS.flags;
         FlagDict_Impl_.arrayWriteInt(_loc1_,860,FlagDict_Impl_.arrayReadInt(_loc1_,860) + 1);
      }
      
      public function studyInTA() : void
      {
         clearOutput();
         if(get_game().time.hours <= 17)
         {
            outputText("你问奎恩是否可以使用图书馆来学习。");
            outputText("[pg][say: 恐怕我刚才没说清楚，图书馆目前不开放，] 奎恩叹了口气，揉了揉额头。[say: 意思是它关门了，也就是开放的反义词。在这种状态下，它的服务不对公众开放。而在这个特定的情况下，公众正是导致它必须关闭的直接原因，这也导致了契约组织在加速开放这件事上更加犹豫。你的兴趣我们已经记录、归档并考虑了，但这只会被视为一个数据点，而不是所谓的“人民的声音”。]");
            outputText("[pg]奎恩停顿了一会儿，若有所思地看着你的眼睛，然后补充道：[say: 意思是“不行”，以防你没听懂。]");
            menu();
            addButton(14,"返回",get_telAdre().telAdreMenu);
         }
         else
         {
            if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,861) == -1)
            {
               outputText("环顾四周，你决定花点时间阅读");
            }
            else
            {
               outputText("没有奎恩来烦你，也没有人要求你离开，你终于有时间阅读");
            }
            outputText("契约组织收集的一些文献了。");
            if(Utils.rand(3) == 0)
            {
               outputText("[pg]你从桌上的一堆杂物中随手拿起一本书，惊喜地发现这是一本关于魔法的典籍。虽然起初使用的语言很古老，但你慢慢发现自己掌握了它，并理解了文本中记载的更多理论。你发现自己开始思考如何将读到的内容应用到自己的能力上，并弄清楚如何更好地利用魔法。简而言之，你体验了被称为\"学习\"的现象，并因此感觉自己变聪明了。");
               dynStats(DynStat.Inte(3 + Utils.rand(4)));
               if(get_player().get_inte() >= 25 && !get_player().hasStatusEffect(StatusEffects.KnowsArouse))
               {
                  outputText("[pg]你惊讶地眨了眨眼，脑海中涌入了一个<b>新法术的知识：唤情。</b>");
                  get_player().createStatusEffect(StatusEffects.KnowsArouse,0,0,0,0);
               }
               else if(get_player().get_inte() >= 30 && !get_player().hasStatusEffect(StatusEffects.KnowsHeal))
               {
                  outputText("[pg]你惊讶地眨了眨眼，脑海中涌入了一个<b>新法术的知识：治疗。</b>");
                  get_player().createStatusEffect(StatusEffects.KnowsHeal,0,0,0,0);
               }
               else if(get_player().get_inte() >= 40 && !get_player().hasStatusEffect(StatusEffects.KnowsMight))
               {
                  outputText("[pg]你惊讶地眨了眨眼，脑海中涌入了一个<b>新法术的知识：强力。</b>");
                  get_player().createStatusEffect(StatusEffects.KnowsMight,0,0,0,0);
               }
               else if(get_player().get_inte() >= 25 && !get_player().hasStatusEffect(StatusEffects.KnowsCharge))
               {
                  outputText("[pg]你惊讶地眨了眨眼，脑海中涌入了一个<b>新法术的知识：充能武器。</b>");
                  get_player().createStatusEffect(StatusEffects.KnowsCharge,0,0,0,0);
               }
               else if(get_player().get_inte() >= 30 && !get_player().hasStatusEffect(StatusEffects.KnowsBlind))
               {
                  outputText("[pg]你惊讶地眨了眨眼，脑海中突然涌入了一个<b>新法术：致盲。</b>");
                  get_player().createStatusEffect(StatusEffects.KnowsBlind,0,0,0,0);
               }
               else if(get_player().get_inte() >= 40 && !get_player().hasStatusEffect(StatusEffects.KnowsWhitefire))
               {
                  outputText("[pg]你惊讶地眨了眨眼，脑海中突然涌入了一个<b>新法术：白火。</b>");
                  get_player().createStatusEffect(StatusEffects.KnowsWhitefire,0,0,0,0);
               }
            }
            else if((get_player().lib > 75 || !get_player().isPureEnough(75) || get_player().hasPerk(PerkLib.BimboBrains) || get_player().hasPerk(PerkLib.FutaFaculties) || get_player().hasPerk(PerkLib.BroBrains)) && Utils.rand(2) == 0)
            {
               outputText("[pg]你随手从桌上拿起一本书翻开。令你无比失望的是，你很快发现里面根本没有人们做爱的图片。读书真没劲。你最终把书扔到一边，决定去做点更有趣的事情。");
            }
            else
            {
               outputText("[pg]你从散落的典籍中随手拿起一本书，发现这是一本记录玛瑞斯生活的历史文献。它极其枯燥，尽管你尽力去学习，但这干巴巴的内容还是让你昏昏欲睡。最终你合上书，接受了今晚什么也学不到的事实。");
            }
            menu();
            addButton(0,"下一步",get_camp().returnToCampUseOneHour);
         }
      }
      
      public function libraryHelp() : void
      {
         clearOutput();
         outputText("这项工作显然相当繁琐，你很容易就看出来了，但奎恩会愿意接受一些帮助吗？");
         outputText("[pg]" + (get_player().hasFur() ? "[say: 你们这些该死的家伙，竟然有脸装作在帮我收拾你们自己惹的烂摊子！] 他恼火地喊道。[say: 不，我不需要帮助，尤其是你们这种人的帮助。]" : "[say: 真是可笑，你连现有的系统都不了解，就想提供服务。要向你解释这些问题是如何记录和索引的，它们是如何组织的，还要确保你不会把事情弄得更糟，这所花费的时间和精力，绝对比我自己继续做下去要多得多，] 他一口气恼火地说完。[say: 简而言之，不需要。]"));
         outputText("[pg]虽然你并不指望他会承认——甚至意识到这一点——但奎恩似乎并不是一个有团队精神的人。");
         doNext(get_telAdre().telAdreMenu);
      }
      
      public function giveManorBooks() : void
      {
         clearOutput();
         outputText("图书馆作为一个可能想要保存这些书的地方是合理的，特别是考虑到它们明显的年代感，所以你提议让奎恩收下它们。这位脾气暴躁的图书管理员扬起了眉毛，尽管他脸上的表情表明他仍然有些怀疑。");
         outputText("[pg][say: 哦？真的吗？[if (hasfur) {你们这种人|市民}]中竟然有人想给我的收藏[i:增加]点东西，而不是毁了它？真是个奇迹。]");
         outputText("[pg]尽管他语带讥讽，但很明显他还是想要这些书的，不过在听到这样的回答后，你倒想听他亲口说出来。");
         outputText("[pg][say: 嗯……我想……谢谢你？这话从我嘴里说出来感觉真奇怪，] 他补充道，语气只比平时稍微没那么干巴巴。[say: 如果你把它们放在那张桌子上，我就开始对这些藏品进行编目。考虑到它们的年代，我需要去拿一些工具来妥善保存它们，所以如果你不介意的话……]");
         outputText("[pg]他话没说完就溜进了图书馆的里屋，把你一个人留在这安静的大厅里。你把书卸在他指的桌子上，在离开前最后看了一眼，希望它们在这里的新生活中能对某些人有所价值。");
         get_player().removeKeyItem("Old Manor Books");
         doNext(get_telAdre().telAdreMenu);
      }
      
      public function firstTowerVisit() : void
      {
         clearOutput();
         outputText("你走向这座城市最大的建筑，也就是中心那座令人印象深刻的高塔。那巨大的尖塔轻轻松松就能容纳你认识的所有人十倍之多，而且还有剩余空间。对于特尔阿德雷这样人口规模的城市来说，它实在是太大了——不过，你转念一想，特尔阿德雷本身也是如此。");
         outputText("[pg]正门似乎守卫森严，入口处的两名精英守卫将你拦下，指引你前往另一个入口——一个公共图书馆。顺着指引，你很快来到了高塔的另一面。你可能以为会看到一扇比你高十倍的史诗级双开大门，在你推开时伴随着戏剧性的嘎吱声勉强打开。然而，你看到的却是一个礼貌的小入口，铰链保养得极好，闪闪发光。没有皱着眉头的石像鬼门环，只有一个小把手和一个钥匙孔，仿佛这是某人的公寓。");
         outputText("[pg]一楼的整个空间只有一个房间。在两端可以看到上下楼的楼梯，但房间的大部分区域都摆放着简单的座椅和桌子。卷轴和书籍散落在桌面上，很可能是从弯曲楼梯下的一排书架上拿下来的。这个图书馆似乎与高塔的实际核心区域并没有连接。");
         if(get_game().time.hours <= 17)
         {
            outputText("一个男人正小心翼翼地翻阅着一本书的书页");
            commonQuinnTroduction();
         }
         else
         {
            outputText("[pg]这里似乎没有其他人，所以没有什么能阻止你阅读桌上留下的书籍和卷轴。上下楼梯看了看，发现有两扇锁着的门，所以你不太可能在这里做其他事情。");
            FlagDict_Impl_.arrayWriteInt(KFLAGS.flags,861,-2);
         }
      }
      
      public function commonQuinnTroduction() : void
      {
         outputText("，虽然他似乎并没有在读。他旁边堆着一摞摞的书。当你关上门时，他抬头看了你一眼。");
         outputText("[pg][say:很抱歉，]他用一种极其疲惫的声音说道，你甚至惊讶他没有因为说话费力而一头栽倒，[say:由于遭到破坏和……图书馆目前不对外开放。]他停顿了一下，看着旁边一本覆盖着灰白色硬壳的书。[say:恶意破坏。]他的眼睛看起来比他的声音还要疲惫两倍，黑眼圈深得几乎像是淤青。苍白——不，是惨白——而且瘦得你觉得都能看到他的颧骨。你很怀疑这个男人是否健康。[say:恐怕目前无法估计我们何时能重新开放，因为不幸的是，契约组织目前没有其他成员能抽出时间来检查和记录损坏的程度。]");
         outputText("[pg]他的穿着似乎与他的容貌格格不入。无论是出于虚荣还是骄傲，他都穿着一套量身定制的西装。外套搭在他身后的椅子上，但马甲的扣子扣得严严实实，还能看到怀表的链子。尽管他如此注重细节，但他那头短发——一种奇怪的、毫无生气的冰冷蓝色——却凌乱不堪，很可能从来没用过梳子。[say:我想你不是来这里进行社交拜访的，]他继续说道，绕过桌子向你走来，[say:鉴于我们这些日子与民众的互动非常有限。天哪，我怀疑你甚至不知道我是谁。走在街上不再被认出，我不知疲倦的工作也得不到感谢。]他摇了摇头，越过你的肩膀看向小镇，双臂交叉。[say:太阳升起又落下，每一次他们都会忘记更多那些为了保护他们安全而拼命工作的人。]你不太确定是什么引发了这段独白，但他又转过身来面对你。[say:你知道吗，我可能在你还是个婴儿的时候就见过你。我主动承担起记录每一个公民名字的责任，为了在他们离世时留下他们曾经存在过的印记。但你可能不会对我表现出这样的礼貌。真遗憾。奎恩，]他继续说道，尽管你从未问过，他还是报出了自己的名字，[say:萨迪斯·奎恩，骸骨巨石。啊，但我已经很久没有被人用这个头衔称呼过了。巴罗的城墙现在只存在于记忆和典籍中了。]");
         if(get_player().isAdult())
         {
            outputText("[pg]他看起来并不比你大多少。");
         }
         if(get_player().isChild())
         {
            outputText("[pg]他或许没有你年轻，但看起来也绝不显老。");
         }
         if(get_player().isTeen())
         {
            outputText("[pg]据你所见，这老家伙甚至还没到中年。");
         }
         if(get_player().isElder())
         {
            outputText("[pg]尽管他表情冷漠，但他看起来比你年轻得多。");
         }
         outputText("你不知道该如何看待他不断缅怀过去的行为。");
         outputText("[pg][say: 但现在这些都不重要了，] 奎恩双手交叠，总结道。[say: 如果你找我或契约组织的任何成员没有正事，我只能请你离开了。我们这里可不是什么免费开放的塔楼。]");
      }
   }
}

