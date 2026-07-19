package classes.scenes.npcs
{
   import classes.BreastRow;
   import classes.CoC;
   import classes.Cock;
   import classes.CockTypesEnum;
   import classes.DynStat;
   import classes.DynStatOp;
   import classes.Monster;
   import classes.Player;
   import classes.StatusEffects;
   import classes.Vagina;
   import classes._FlagDict.FlagDict_Impl_;
   import classes.display.SpriteDb;
   import classes.globalFlags.KFLAGS;
   import classes.internals.Utils;
   import classes.items.Armor;
   import classes.items.ArmorLib;
   import classes.items.ConsumableLib;
   import classes.items.Weapon;
   import classes.items.armors.LustyMaidensArmor;
   import classes.items.armors.NaughtyNunsHabit;
   import classes.scenes.Camp;
   import classes.scenes.Inventory;
   import classes.scenes.combat.Combat;
   import coc.view.CoCButton;
   import flash.Boot;
   import haxe.IMap;
   
   public class CeraphScene extends NPCAwareContent
   {
      
      public function CeraphScene()
      {
         if(Boot.skip_constructor)
         {
            return;
         }
         super();
      }
      
      public function yesOHGODYESPIERCELEVEL3() : void
      {
         clearOutput();
         spriteSelect(SpriteDb.get_s_ceraph());
         outputText("你点点头，焦急地咬着嘴唇，解开护甲，让她更容易接触到你的身体。恶魔女拿出一个镶钻的穿孔环，向你逼近，她的肉棒坚硬，小穴湿润，臀部在前进时诱人地摇摆着。塞拉芙严肃地看着你，警告你：[say: 你知道你离成为我的宠物有多近吗？你只需要这个穿孔，再花点时间适应它。然后，如果你表现好，我会剥光你的衣服，把你绑起来，让你舔我。我们甚至可以让小恶魔们看着！][pg]");
         outputText("这个想法让你极度兴奋，你喘息着，因为");
         if(get_player().totalCocks() > 0)
         {
            outputText("先列腺液从");
            if(get_player().totalCocks() > 1)
            {
               outputText("你的每一根");
            }
            outputText("[cocks]中渗出。");
         }
         else if(get_player().hasVagina())
         {
            outputText("女性的爱液从你的阴唇间流出，你的[clit]变成了一个坚硬的肉核。");
         }
         else
         {
            outputText("你的身体渴望释放。");
         }
         outputText("[pg]塞拉芙带着被逗乐的笑容，一把扯下你的装备，并且");
         if(get_player().cockTotal() > 0)
         {
            outputText("抓住你的[cock]");
            if(get_player().cocks[0].get_isPierced())
            {
               outputText("，旧的穿孔饰品从你的肉里滑落，当啷一声掉在地上，");
            }
            outputText("并将镶钻的穿孔环扣入你敏感的肉体，让你痛得眼前发红。");
            get_player().cocks[0].pierced = 1;
            get_player().cocks[0].pShortDesc = "无缝钻石阴茎钉";
            get_player().cocks[0].pLongDesc = "无缝钻石阴茎钉";
         }
         else if(get_player().hasVagina())
         {
            outputText("拨开你的阴唇");
            if(get_player().vaginas[0].clitPierced > 0)
            {
               outputText("，旧的穿孔饰品从你的肉里滑落，当啷一声掉在地上，");
            }
            outputText("抓住了你[clit]根部周围的肉。她动作熟练地将穿孔环扣上，把钻石耳钉固定在你身上，疼痛让你的视线变得一片血红。");
            get_player().vaginas[0].clitPierced = 1;
            get_player().vaginas[0].clitPShort = "无缝钻石阴蒂钉";
            get_player().vaginas[0].clitPLong = "无缝钻石阴蒂钉";
         }
         else
         {
            outputText("有些不悦地看了你一眼，然后把钻石耳钉扣进你的眉毛里，穿透了它。");
            if(get_player().eyebrowPierced > 0)
            {
               outputText("她像丢垃圾一样把你的旧首饰扔掉。");
            }
            outputText("这比预想的还要疼，让你的视线变得一片血红。");
            get_player().eyebrowPierced = 1;
            get_player().eyebrowPShort = "无缝钻石眉钉";
            get_player().eyebrowPLong = "无缝钻石眉钉";
         }
         outputText("当她完成时，你感到很感激，她如此乐意用这些性感的首饰来装扮你，并教你如何享受这些美妙的新体验。你给了她一个湿吻，想知道她对你做了什么，但最终你并不在乎。不知为何，你知道这会让你感觉自己更像是一个发情、火辣、顺从的恶魔女主人的性感尤物。[pg]");
         outputText("[say: 那么，我猜你很喜欢它？你再也不能愤怒地举起手了。我想如果你想赢得战斗，你就得用那具诱人的身体挑逗你的敌人，让他们屈服。我想当你因为暴露自己而高潮，因为想到被绑起来而高潮时，这可能很难做到，]她笑着说。[pg]");
         outputText("当恶魔女离开时，你因几乎无法抑制的欲望而颤抖。你想追她，但在她的想法和向整个区域暴露你的胯部之间，你比世界上任何事情都更需要高潮。你匆匆赶回营地，发情得无法思考，而你的新穿孔隐隐作痛，足以让你无法忘记它。");
         giveFetish();
         doNext(get_camp().returnToCampUseOneHour);
      }
      
      public function winRapeChoices() : void
      {
         var _g3:NaughtyNunsHabit;
         var monster1:Monster;
         var player1:Player;
         var _g2:LustyMaidensArmor;
         var _g1:CeraphFollowerScene;
         var _g:Combat = get_combat();
         var _loc1_:Function = function():void
         {
            _g.cleanupAfterCombat();
         };
         if(!get_game().get_inCombat())
         {
            set_monster(new Ceraph());
            _g1 = get_ceraphFollowerScene();
            _loc1_ = function():void
            {
               _g1.ceraphFollowerAppearance();
            };
            get_monster().set_lust(100);
            get_monster().set_HP(2);
            if(get_player().get_lust() < 34)
            {
               get_player().set_lust(34);
            }
         }
         else if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,291) >= 4)
         {
            get_ceraphFollowerScene().submissiveCeraphOffer();
            return;
         }
         spriteSelect(SpriteDb.get_s_ceraph());
         clearOutput();
         if(get_monster().get_HP() < 1)
         {
            outputText("塞拉芙瘫倒在地，浑身是血，伤痕累累。");
         }
         else
         {
            outputText("塞拉芙徒劳地自慰着，被欲望驱使着无法战斗。");
         }
         menu();
         addButtonDisabled(0,"操她");
         addButtonDisabled(1,"骑她");
         addButtonDisabled(2,"操她屁股");
         if(get_player().get_lust() >= 33)
         {
            outputText("你要对她为所欲为吗？（如果是的话，你要用哪个身体部位？）");
            if(get_player().hasCock())
            {
               addButton(0,"操她",maleFuckCeraphsPussy);
               if(get_player().cockThatFits(get_monster().analCapacity()) != -1)
               {
                  addButton(2,"操她的屁股",buttRapeCeraph);
               }
               else
               {
                  addButtonDisabled(2,"操她的屁股","你不可能插进她的屁股里——你太大了。");
               }
            }
            if(get_player().hasVagina())
            {
               addButton(1,"骑她",rideCeraphsCockLikeaBAWSSexclamation11eleven);
               if(get_player().biggestTitSize() >= 4 && get_player().get_armorName() == "lusty maiden\'s armor")
               {
                  _g2 = get_player().get_armor();
                  player1 = get_player();
                  monster1 = get_monster();
                  addButton(3,"B.Titfuck",function():void
                  {
                     _g2.lustyMaidenPaizuri(player1,monster1);
                  });
               }
            }
         }
         if(get_player().get_armor() is NaughtyNunsHabit)
         {
            _g3 = get_player().get_armor();
            addButton(4,"崇拜肉棒",function():void
            {
               _g3.naughtyNunCockWorship();
            }).hint("通过对这个生物的肉棒的奉献来赞美你的主。");
         }
         if(!get_game().ceraphFollowerScene.ceraphIsFollower())
         {
            addButton(5,"够了！",killCeraph).hint("一劳永逸地杀死塞拉芙。");
         }
         setSexLeaveButton(_loc1_,"离开",14,3,10);
      }
      
      public function tradeCeraphSomething() : void
      {
         clearOutput();
         spriteSelect(SpriteDb.get_s_ceraph());
         outputText("塞拉芙上下打量着你，就像鉴定师在检查古董一样，她慵懒的自慰动作从未停止。你双手叉腰站在那里，等着她完事，同时尽量不盯着她渗出的先列腺液或滴落的淫液看太久。[pg]");
         menu();
         addButtonDisabled(0,"利口酒");
         addButtonDisabled(1,"天赋");
         addButtonDisabled(2,"护甲");
         if(get_player().hasItem(get_consumables().BIMBOLQ))
         {
            outputText("她完事后，笑得很开心。[saystart]那是傻妞利口酒吗？那东西太难找了，即使对我这样的恶魔来说也是如此。我跟你说，如果你把那东西交易给我，我就解除");
            if(hasBondage())
            {
               outputText("所有的性癖");
            }
            else
            {
               outputText("那个性癖");
            }
            outputText("我施加在你身上的。我的后宫里有个调皮的男孩，我已经开始厌倦他的机智了。");
            if(get_player().get_gender() > 0 || get_player().biggestTitSize() > 2)
            {
               outputText("或者如果你想留着它，我可以拿走你的一个天赋供我自己使用，并移除一个性癖。给我的旧宠物一个新的部位玩耍总是很有趣的。");
            }
            outputText("也许你只是需要一些更好的装备？我有一套性感的护甲，我很乐意借给你，宠物。[sayend][pg]");
            addButton(0,"利口酒",tradeCeraphBimboLiqueur);
            if(!get_player().isGenderless() || get_player().biggestTitSize() > 2)
            {
               addButton(1,"天赋",tradeCeraphCrotchityBits);
            }
         }
         else if(get_player().get_gender() > 0 || get_player().biggestTitSize() > 2)
         {
            outputText("她完事后精神一振，淫荡地看着你。[saystart]我跟你说。让我拿走你的一个天赋用在我的宠物身上，我就帮你摆脱");
            if(hasExhibition())
            {
               outputText("你的性癖。[sayend][pg]");
            }
            else
            {
               outputText("你的一个癖好。[sayend][pg]");
            }
            addButton(1,"天赋",tradeCeraphCrotchityBits);
         }
         else
         {
            outputText("她弄完后皱起了眉头。[saystart]我觉得你身上没有一件值得交易的东西。");
            if(!hasBondage())
            {
               addButton(2,"护甲",getCeraphsArmor);
               outputText("别发愁了，你这" + get_player().mf("漂亮的小脑袋","迷人的小脑袋") + "，塞拉芙女王对她的宠物可是再慷慨不过了。我可以给你一些漂亮的护甲来诱惑你的敌人，那不是很好吗？");
            }
            outputText("[sayend][pg]");
         }
         addButton(14,"离开",runFromCeraphsNiceDeal);
      }
      
      public function tradeCeraphCrotchityBits() : void
      {
         clearOutput();
         spriteSelect(SpriteDb.get_s_ceraph());
         if(get_player().statusEffectv1(StatusEffects.Exgartuan) == 1)
         {
            outputText("一个虚无缥缈的声音咆哮道，[say:去他妈的！你绝对不能把我交给那个疯婊子！]埃克斯加图安似乎不想冒被塞拉芙带走的风险，他完全控制了你的[legs]，让你以最快的速度逃跑。他嘲讽道，[say:你怎么不把你自己的小鸡鸡扯下来！反正你这干瘪的老母猪只留个小穴会更好看！][pg]");
            outputText("塞拉芙似乎有些不安，但并没有费心去追你。");
            dynStats(DynStat.Lust(-20));
            doNext(get_camp().returnToCampUseOneHour);
            return;
         }
         var _loc1_:Array = [];
         var _loc2_:int = 0;
         var _loc3_:int = 0;
         var _loc4_:int = get_player().totalCocks();
         while(_loc4_ > 0)
         {
            _loc4_--;
            _loc1_[int(_loc1_.length)] = 1;
         }
         if(get_player().hasVagina())
         {
            _loc1_[int(_loc1_.length)] = 2;
            if(Utils.rand(2) == 0)
            {
               _loc1_[int(_loc1_.length)] = 2;
            }
         }
         _loc4_ = int(get_player().breastRows.length);
         while(_loc4_ > 0)
         {
            _loc4_--;
            if(get_player().breastRows[_loc4_].breastRating > 2)
            {
               _loc1_[int(_loc1_.length)] = 3;
            }
         }
         outputText("塞拉芙淫荡地咧嘴一笑，把尾巴从她流着淫液的小穴里拔了出来。[say:真的吗？那这应该会很有趣。让我先想想我想要什么……]她的目光非常锐利。[pg]");
         _loc2_ = int(_loc1_[Utils.rand(int(_loc1_.length))]);
         if(_loc2_ == 0)
         {
            outputText("操，发生错误了，快去叫FENOXO！");
         }
         else if(_loc2_ == 1)
         {
            _loc3_ = Utils.rand(get_player().cockTotal());
            outputText("她开口说道，[saystart]");
            if(get_player().cocks[_loc3_].get_cockType() == CockTypesEnum.HORSE)
            {
               outputText("哦，那是一根马鸡巴吗？那可是好东西。我喜欢那种在体内膨胀的感觉，或者更好的是，把它深深地插进一个荡妇可怜的、被玩坏的屁眼里。");
            }
            else if(Boolean([CockTypesEnum.DOG,CockTypesEnum.WOLF,CockTypesEnum.FOX].contains(get_player().cocks[_loc3_].get_cockType())))
            {
               outputText("哦，那是一根狗鸡巴吗？那可是好东西。把上面的肉结强化一下，然后看着它们膨胀到足以撑大某个可怜奴隶的肠胃，那真是太有趣了。");
            }
            else if(get_player().cocks[_loc3_].get_cockType() == CockTypesEnum.DEMON)
            {
               outputText("哦，那是一根恶魔鸡巴吗？如你所见，我对它们非常熟悉，不过用它来替换我女孩的舌头可能会很有趣。");
            }
            else if(get_player().cocks[_loc3_].get_cockType() == CockTypesEnum.CAT)
            {
               outputText("哦，那是一根猫咪鸡巴吗？上面的倒刺在摩擦你的肉壁或刮擦你的前列腺时感觉太棒了。喵。");
            }
            else if(get_player().cocks[_loc3_].get_cockType() == CockTypesEnum.LIZARD)
            {
               outputText("哇哦，你长着蛇的阴茎？我有一阵子没见过这种东西了。我喜欢那种球状、类似肉结的质感。也许我会把它移植到椅子上，让我手下的某个男孩在上面坐上几天。");
            }
            else if(get_player().cocks[_loc3_].get_cockType() == CockTypesEnum.TENTACLE)
            {
               outputText("哦哦，一根触手肉棒？能在你身上找到这个真是太幸运了！我一直想再添一个可怜的触手奴隶。");
            }
            else if(get_player().cocks[_loc3_].get_cockType() == CockTypesEnum.ANEMONE)
            {
               outputText("哦哦，一根海葵肉棒？简直太棒了！我可能得把毒液的强度调高，然后自己用！");
            }
            else
            {
               outputText("哦哦，一根正常的、未被腐化的肉棒。真是太滑稽了！你可能会觉得这种东西很常见，但能碰上一根还真是难得。");
            }
            if(get_player().cockTotal() > 1)
            {
               outputText("当然，你身上带着的可不止这一根肉棒，嗯？也许我该拿走");
               if(get_player().cockTotal() == 2)
               {
                  outputText("另一根");
               }
               else
               {
                  outputText("其他的其中一根");
               }
            }
            outputText("。");
            outputText("[sayend][pg]");
         }
         else if(_loc2_ == 2)
         {
            outputText("恶魔的目光落在你的[legs]之间，她评论道，[saystart]");
            if(get_player().wetness() >= 5)
            {
               outputText("哎呀呀，你那里有个多么多汁的小穴啊。告诉我，一直泡在自己的淫液里不觉得烦吗？也许我会把它装在我的一个奴隶身上，然后把她挂在墙上。这样我就可以在好好教训其他宠物之前，直接滑进去润滑一下了。");
            }
            else if(get_player().wetness() >= 3)
            {
               outputText("哎呀呀，你那里有个多么漂亮湿润的小穴啊。我真的觉得你下面完美地融合了湿润和实用性。我可能得把那个小穴抢过来，给我的一个比较干的宠物用。");
            }
            else if(get_player().vaginalCapacity() >= 150)
            {
               outputText("哎呀呀，你那里有个多么惊人的大洞啊。牛头人在干你的时候还能感觉到什么吗？也许我在和谢南多厄玩的时候可以用上它。她喝了太多梦魔的药水，现在有点难对付。");
            }
            else
            {
               outputText("哎呀呀，这么漂亮的小穴。我敢打赌，把它换到我一个比较吵闹的宠物的嘴巴上一定会很有趣。她从来没学会不要咬人。");
            }
            outputText("[sayend][pg]");
         }
         else
         {
            outputText("塞拉芙的双手伸上来，托住你隆起的" + get_player().biggestBreastSizeDescript() + "，她问道，[saystart]");
            if(get_player().biggestTitSize() > 14)
            {
               outputText("哦哇……真是哇。你怎么走路的？有了这样的巨乳，你可以同时给三四个人乳交！绝对精致。");
            }
            else if(get_player().biggestTitSize() > 6)
            {
               outputText("告诉我亲爱的，它们是真的吗？我是说，它们一直都是这个尺寸，还是你做过一点手脚？");
            }
            else
            {
               outputText("嗯，这些有点小。你有没有考虑过尝试一些Gro+？我听说现在在莉希丝的走狗中很流行。");
            }
            outputText("[sayend][pg]");
         }
         outputText("过了漫长而沉默的一段时间，塞拉芙才下定决心。她指着你的");
         if(_loc2_ == 1)
         {
            outputText("命根子");
            if(get_player().cockTotal() > 1)
            {
               outputText("");
            }
            outputText("");
         }
         else if(_loc2_ == 2)
         {
            outputText("小穴");
         }
         else
         {
            outputText("乳房");
         }
         outputText("并宣布道，[saystart]我想我要");
         if(_loc2_ <= 2)
         {
            outputText("一个");
         }
         else
         {
            outputText("两个");
         }
         outputText("这样的。现在别动。[sayend][pg]");
         outputText("你要让她拿走吗？");
         FlagDict_Impl_.arrayWriteInt(KFLAGS.flags,217,_loc2_);
         doYesNo(giveUpYourBallsOrWhateverForLessFetishes,bailBeforeCeraphYoinksYourNads);
      }
      
      public function tradeCeraphBimboLiqueur() : void
      {
         clearOutput();
         spriteSelect(SpriteDb.get_s_ceraph());
         outputText("塞拉芙咧嘴笑得像柴郡猫一样，一边幸福地呻吟着，一边把她滴着淫液的尾巴从小穴里拔出来。她那充满情欲、污秽的小穴散发出的刺鼻气味在空气中弥漫，同时她的尾巴向你伸来，缠住酒瓶的顶部，把它从你的[inv]里拉了出来。塞拉芙非常小心地从她那沾满淫液的尾巴上取下酒瓶，并打开了瓶盖。她轻轻闻了一下酒，但还是被熏得往后退了一步。恶魔盖上瓶塞，开始咯咯地笑起来，脸上带着一丝呆滞的笑容。[say: 呜呼呼……呵呵呵呵……这东西真够劲！][pg]");
         outputText("你提到了交易，她恼火地瞪了你一眼。她美丽的脸庞因愤怒而扭曲，一只手不知从哪里伸出来，结结实实地扇在你的太阳穴上。[say:别打断我，宠物。]你耳鸣目眩，踉跄着后退，惊讶地捂住头。等你再瞪向她时，她已经走开了。你短暂地考虑过报复她，但你意识到你的头脑感觉更清晰、更正常了。那些人造的癖好消失了！当你在脑海中盘点那些淫秽的行为，并惊叹它们对你的影响如此之小时，塞拉芙已经成功逃脱了。");
         get_player().consumeItem(get_consumables().BIMBOLQ);
         get_player().takeDamage(4);
         resetFetish();
         dynStats(DynStat.Lust(-20));
         doNext(get_camp().returnToCampUseOneHour);
      }
      
      public function startAFightWithCeraph() : void
      {
         startCombatImmediate(new Ceraph());
         spriteSelect(SpriteDb.get_s_ceraph());
      }
      
      public function set_fetish(param1:int) : int
      {
         FlagDict_Impl_.arrayWriteInt(KFLAGS.flags,23,param1);
         return param1;
      }
      
      public function runFromCeraphsNiceDeal() : void
      {
         clearOutput();
         spriteSelect(SpriteDb.get_s_ceraph());
         outputText("你");
         if(get_player().cor > 66)
         {
            outputText("抓起你的装备，并且");
         }
         outputText("匆忙从这个恋物癖骗子身边撤退。她自慰的呻吟声追着你下山，一路回到营地，让你本就燃烧的欲望之火更加旺盛。");
         dynStats(DynStat.Lust(10 + get_fetish() * 10));
         doNext(get_camp().returnToCampUseOneHour);
      }
      
      public function rideCeraphsCockLikeaBAWSSexclamation11eleven() : void
      {
         var _loc1_:IMap = KFLAGS.flags;
         FlagDict_Impl_.arrayWriteInt(_loc1_,291,FlagDict_Impl_.arrayReadInt(_loc1_,291) + 1);
         get_player().slimeFeed();
         spriteSelect(SpriteDb.get_s_ceraph());
         clearOutput();
         if(get_monster().get_lust() >= get_monster().maxLust())
         {
            outputText("无视她愉悦的尖叫，你强迫塞拉芙仰面躺下，色眯眯地看着她挺拔的乳房、下流的肉棒和湿透的阴部。她饥渴地抬头看着你，你有一种感觉，在某种程度上，你仍然在给她她想要的东西。警惕恶魔的诡计，你把她的双手拉到一起，用一些破布条把它们绑起来。恶魔带着无助的欲望呻吟着，将她的胯部在你的[leg]上摩擦，将她的大腿分开成近乎劈叉的姿势，让你完美地看到她跳动的黑色恶魔肉棒。[pg]");
         }
         else
         {
            outputText("无视她痛苦的咕哝，你强迫塞拉芙仰面躺下，色眯眯地看着她挺拔的乳房、疲软的肉棒和无毛的阴部。她轻蔑地抬头看着你，从喉咙深处向你咆哮。考虑到恶魔的能力，你用一些破布条把她的双手绑起来。从她帐篷般的勃起和现在闪闪发光的裂口来看，她似乎很喜欢这样。这个荡妇甚至开始将她的胯部在你身上摩擦，随着她从被束缚中获得快感，她的大腿张得越来越开。你完美地看到了她跳动的黑色恶魔肉棒。[pg]");
         }
         outputText("塞拉芙舔了舔嘴唇，抬头凝视着你，用充满诱惑意图的声音乞求道，[say: 请不要强暴我！我发过贞洁誓言！][pg]");
         if(get_player().cor < 33)
         {
            outputText("她的话让你感到羞愧。你真的堕落到这种地步了吗？当你准备好在一个性爱恶魔的工具上发泄时，你想知道这个世界已经腐蚀了你多少。");
         }
         else if(get_player().cor < 66)
         {
            outputText("她的话让你感到困惑。你刚来这里的时候绝对不会这么做，但你现在欲火焚身，而且你知道恶魔其实并不介意。");
         }
         else
         {
            outputText("她不诚实的话激怒了你，你扇了她一巴掌。你们俩都知道她想要这个，几乎就像她想要强暴你一样，任何假装不喜欢这种行为的借口都是骗人的把戏。");
         }
         outputText("[pg]无论如何，她现在想动摇你已经太迟了。你脱下你的[armor]");
         if(hasExhibition())
         {
            outputText("享受着暴露的快感");
         }
         outputText("并开始抚摸你的" + get_player().vaginaDescript(0) + "，为接下来的事情做好准备。[pg]");
         outputText("你沉下身子，感觉自己被那根滚烫的恶魔肉棒撑开，当你滑下时，它冠状的肉瘤环摩擦着你的肉壁，肉棒上凹凸不平的纹理让你的[legs]发软。你顺着湿滑的肉棒一滑到底，");
         if(get_player().vaginalCapacity() < 12)
         {
            outputText("无法将整根精美的肉棒完全吞入体内。肉瘤蠕动扭曲着，几乎在震动并按摩着你的内部肌肉，你无法控制自己在她身上弹跳，一次又一次地将自己刺穿在那根粗壮的肉棒上。[pg]");
         }
         else
         {
            outputText("能够将整根精美的肉棒完全吞入体内。肉瘤蠕动扭曲着，几乎在震动并按摩着你的内部肌肉，你无法控制自己在她身上弹跳，一次又一次地将自己刺穿在那根粗壮的肉棒上。[pg]");
         }
         outputText("塞拉芙假装抗议地喊道，[say: 不，别让我在你里面射精！求你了，勇者，我发誓过不播撒我的种子，以免生下私生子！][pg]");
         outputText("她震动的肉瘤带来的快感确保你没有意志或力量从她身上拔出，你的[legs]仅剩的一点力量都用来在她身上继续弹跳和摩擦，空气中充满了湿润的吧唧声和滑溜的挤压声。你向前倒去，勉强在撞上这位性感的恶魔之前稳住自己。你的");
         if(get_player().biggestTitSize() < 1)
         {
            outputText("胸部");
         }
         else
         {
            outputText("乳房");
         }
         outputText("挤压在她的胸前，从她的乳头挤出一股乳汁。两对");
         if(get_player().biggestTitSize() < 1)
         {
            outputText("乳头");
         }
         else
         {
            outputText("晃动的肉团");
         }
         outputText("在你们之间挤压时感觉棒极了，随着你身体急促的摩擦而前后滑动。[pg]");
         outputText("在火热湿润的性爱攻势下，双性魅魔伪装的纯真面具掉落了。她的嘴张成了一个愉悦的“o”形，你感觉到她的肉棒变粗，开始将她狂喜的证明泵入你的体内。覆盖在塞拉芙恶魔勃起物上的肉瘤在她高潮时疯狂震动，将你推向边缘，陷入一阵全身颤抖的高潮中。恶魔的种子淹没了你的子宫，被你身体高潮的收缩挤压在里面。你和恶魔一起颤抖着，两人都开始平静下来。[pg]");
         outputText("她呻吟着，[saystart]哦哦……勇者，你为什么要让我玷污你的子宫？");
         if(get_player().get_pregnancyIncubation() == 0)
         {
            outputText("你只是在喂养那些正在玷污这片土地的小恶魔群。");
         }
         else
         {
            outputText("我敢肯定，无论你肚子里怀的是什么孩子，都不会喜欢被如此浸泡在腐化中。");
         }
         outputText("[sayend][pg]");
         if(get_player().cor < 33)
         {
            outputText("你呻吟着，只希望她能停止提醒你这场小幽会的后果。为了尽快摆脱这个恶魔，你穿好衣服，动身返回营地。[pg]");
         }
         else if(get_player().cor < 66)
         {
            outputText("你呻吟着，想知道她为什么就是不肯结束她的小把戏。虽然这不是你最好的主意，但也远没有她说的那么糟。你穿好衣服离开，迫不及待地想摆脱她。[pg]");
         }
         else
         {
            outputText("你弯下腰，揉了揉肚子，在她耳边低语道：[say:有其母必有其子。][pg]");
         }
         outputText("离开时，你懒得再看那个困惑的双性魅魔一眼；她不值得你浪费时间。[pg]");
         get_player().cuntChange(get_monster().cockArea(0),true);
         get_player().orgasm("Vaginal");
         dynStats(DynStat.Lib(3),DynStat.Sens(3),DynStat.Cor(1));
         get_player().knockUp(1,400,61);
         if(get_game().get_inCombat())
         {
            get_combat().cleanupAfterCombat();
         }
         else
         {
            doNext(get_camp().returnToCampUseOneHour);
         }
      }
      
      public function resetFetish() : void
      {
         set_fetish(get_fetish() - int(get_fetish() % 10));
      }
      
      public function removeFetish() : void
      {
         set_fetish(Utils.boundInt(10,set_fetish(get_fetish() - 1),13));
      }
      
      public function maleFuckCeraphsPussy() : void
      {
         var _loc1_:IMap = KFLAGS.flags;
         FlagDict_Impl_.arrayWriteInt(_loc1_,291,FlagDict_Impl_.arrayReadInt(_loc1_,291) + 1);
         spriteSelect(SpriteDb.get_s_ceraph());
         clearOutput();
         if(!get_player().isTaur() && get_player().biggestCockArea() > 500 && (get_player().statusEffectv1(StatusEffects.Exgartuan) == 1 || get_game().jojoScene.isJojoCorrupted()))
         {
            hugeCorruptionForceFuckCeraph();
            return;
         }
         if(get_player().cockArea(0) <= get_monster().vaginalCapacity())
         {
            if(get_monster().get_lust() >= get_monster().maxLust())
            {
               outputText("无视她愉悦的尖叫，你强迫塞拉芙仰面躺下，色眯眯地看着她挺拔的双乳、下流的肉棒和湿透的小穴。她饥渴地仰视着你，你感觉在某种程度上你仍然在给她她想要的东西。考虑到她恶魔般的诡计，你把她的双手拉到一起，用几根破布条把它们绑在她的头顶。恶魔带着无助的欲望呻吟着，将她的胯部在你的[leg]上摩擦，双腿几乎劈开，让你能完美地欣赏她多汁的紫色小穴。[pg]");
            }
            else
            {
               outputText("无视她痛苦的闷哼，你强迫塞拉芙仰面躺下，色眯眯地看着她挺拔的双乳、疲软的肉棒和无毛的小穴。她轻蔑地仰视着你，从喉咙深处向你低吼。警惕于恶魔的能力，你用几根破布条绑住了她的双手。从她高耸的勃起和现在闪闪发光的裂口来看，她似乎很喜欢这样。这个荡妇甚至开始将她的胯部在你身上摩擦，双腿张得越来越开，因为被束缚而获得了快感。你完美地欣赏到了她诱人的紫色小穴。[pg]");
            }
            outputText("塞拉芙舔了舔嘴唇，抬头凝视着你，用充满诱惑的声音乞求道：[say:请不要强暴我，勇者！不要把我绑起来，像对待无助的村姑一样强暴我！][pg]");
            if(get_player().cor < 33)
            {
               outputText("她的话让你感到羞愧。你真的堕落到这种地步了吗？当你准备强奸一个性爱恶魔时，你想知道这个世界到底已经腐蚀了你多少。");
            }
            else if(get_player().cor < 66)
            {
               outputText("她的话让你感到困惑。你刚来这里的时候绝对不会这么做，但你现在欲火焚身，而且你知道恶魔其实并不介意。");
            }
            else
            {
               outputText("她不诚实的话激怒了你，你扇了她一巴掌。你们俩都知道她想要这个，几乎就像她想要强暴你一样，任何假装不喜欢这种行为的借口都是骗人的把戏。");
            }
            outputText("反正她现在想动摇你也太晚了。你脱下你的[armor]");
            if(hasExhibition())
            {
               outputText("，感受到一种暴露狂的刺激，");
            }
            outputText("并开始抚摸");
            if(get_player().totalCocks() > 1)
            {
               outputText("你的每一根");
            }
            outputText("你坚挺的[cocks]，准备插入她。[pg]");
            outputText("当你把[cock]越来越靠近她的女性小穴时，塞拉芙在泥土中扭动着，她的肉棒像某种变态的、变异的阴蒂一样因为渴望而抽搐。她的臀部对着你抽搐，似乎渴望吞噬你的男性特征。你没有让她久等，");
            if(get_player().cockArea(0) < 40)
            {
               outputText("伴随着有力的冲刺，你将自己埋入恶魔邪恶的小穴中");
            }
            else
            {
               outputText("伴随着巨大的努力，你将你那过大的肉棒强行塞进她体内。有那么一瞬间，你只能敬畏地盯着它扭曲她的身体——这种事情竟然可能发生，这让你感到困惑");
            }
            outputText("。她的体内热得不像人类，布满了成千上万个湿滑的突起，每一个都在摩擦着你的肉棒。这种感觉的狂欢令人难以置信，随着高潮的渴望在你体内升起，你立刻开始操你被绑住的恶魔俘虏。[pg]");
            outputText("被击败的双性魅魔假装抗议地喵喵叫着，[say: 哦，不要射进我恶魔的小穴里，亲爱的勇者！如果你这样做了，你将永远不会想要其他的小穴了！][pg]");
            outputText("你咕哝着，比以前更用力、更快地捣着她，知道即使你想，你也无法从她那老虎钳般的快乐洞里拔出来。感觉太好了，无法坚持或抵抗，你俯下身，调整角度，强奸这个美丽的双性魅魔。你像动物一样咕哝着，尽可能快地操她，但她躺在你身下，带着一种平静而诱人的表情，似乎非常享受这种情况，等待着你的高潮。你粗暴地捏住她的乳头，被她高高在上的神态激怒了，但这只会让她扭动的小穴变得更湿。它紧紧地夹住你，在强烈的性高潮中把你的[cock]榨干。[pg]");
            outputText("塞拉芙高兴地尖叫着，她性感的面容碎裂成一种毫无顾忌的愉悦表情，她哭喊着，[say: 用你的种子填满我，勇者！用你强大的长矛征服恶魔！][pg]");
            outputText("她紫色的阴道在你周围痉挛，其质地奇特的内部随着你的射精而起伏和吸吮，喝下你的精液。塞拉芙高兴地扭动着，她的身体用她那令人难以置信的愉悦的洞吸收着你的精液。");
            if(get_player().cumQ() >= 500 && get_player().cumQ() < 1000)
            {
               outputText("她的肚子开始随着她吸收的精液量而隆起，你在一个轻微怀孕的恶魔身下完成了你的高潮。");
            }
            else if(get_player().cumQ() >= 1000)
            {
               outputText("随着你泵入她体内的精液体积，她的肚子迅速隆起，一直膨胀到看起来随时要分娩的程度，但她那紧绷的紫色身躯似乎相当能扛，只是肚脐随着一声突兀的\"噗\"声翻了出来。");
            }
            outputText("双性魅魔那粗短的肉棒高兴地抽搐着，喷出微小的恶魔精液，在性爱中被冷落得太多，无法达到真正令人愉快的高潮，但非常愿意漏出精液。[pg]");
            outputText("塞拉芙疲惫地呼出一口气，用手抚摸着她的肚子，咕哝着，[say: 所以，你真的把所有的精液都给我了。我想我必须用你的名字来命名我从中生出的第一个小恶魔，不是吗？][pg]");
            if(get_player().cor < 33)
            {
               outputText("你呻吟着，只希望她能停止提醒你这场小幽会的后果。为了尽快摆脱这个恶魔，你穿好衣服，动身返回营地。[pg]");
            }
            else if(get_player().cor < 66)
            {
               outputText("你呻吟着，想知道她为什么就是不肯结束她的小把戏。虽然这不是你最好的主意，但也远没有她说的那么糟。你穿好衣服离开，迫不及待地想摆脱她。[pg]");
            }
            else
            {
               outputText("你弯下腰，轻轻抚摸她的肚子，在她耳边低语：[say: 亲爱的，我一有机会就会把他串在我的肉棒上的。][pg]");
            }
            outputText("当你离开时，你懒得再看那个困惑的双性魅魔一眼。她不值得你浪费时间。");
         }
         else
         {
            if(get_monster().get_lust() >= get_monster().maxLust())
            {
               outputText("无视她愉悦的尖叫，你强迫塞拉芙仰面躺下，色眯眯地盯着她挺拔的乳房、下流的肉棒和湿透的阴部。她饥渴地仰视着你，你觉得在某种程度上，你仍然在满足她的欲望。警惕着恶魔的诡计，你把她的双手拉到一起，用几块碎布绑起来。恶魔在无助的欲望中呻吟着，把她的胯部在你的[leg]上摩擦，双腿几乎劈开，让你能完美地欣赏她多汁的紫色阴部。[pg]");
            }
            else
            {
               outputText("无视她痛苦的闷哼，你强迫塞拉芙仰面躺下，色眯眯地盯着她挺拔的乳房、疲软的肉棒和无毛的阴部。她轻蔑地仰视着你，从喉咙深处向你咆哮。警惕着恶魔的能力，你用几块破布绑住了她的双手。从她如帐篷般隆起的勃起和现在闪闪发光的裂口来看，她似乎很喜欢这样。这个荡妇甚至开始把她的胯部在你身上摩擦，双腿张得越来越开，因为被束缚而高潮。你完美地欣赏到了她诱人的紫色阴部。[pg]");
            }
            outputText("塞拉芙舔了舔嘴唇，凝视着你，用充满诱惑的声音乞求道：[say: 拜托，不要强奸我，勇者！不要把我绑起来，像个无助的村姑一样强奸我！][pg]");
            if(get_player().cor < 33)
            {
               outputText("她的话让你感到羞愧。你真的堕落到这种地步了吗？当你准备强奸一个性爱恶魔时，你想知道这个世界到底已经腐蚀了你多少。");
            }
            else if(get_player().cor < 66)
            {
               outputText("她的话让你感到困惑。你刚来这里的时候绝对不会这么做，但你现在欲火焚身，而且你知道恶魔其实并不介意。");
            }
            else
            {
               outputText("她不诚实的话激怒了你，你扇了她一巴掌。你们俩都知道她想要这个，几乎就像她想要强暴你一样，任何假装不喜欢这种行为的借口都是骗人的把戏。");
            }
            outputText("反正她现在想动摇你也太晚了。你脱下你的[armor]");
            if(hasExhibition())
            {
               outputText("享受着暴露的快感");
            }
            outputText("并开始抚摸");
            if(get_player().cockTotal() > 1)
            {
               outputText("你的每一根");
            }
            outputText("你坚挺的[cocks]，准备插入她。[pg]");
            outputText("你[cock]的" + get_player().cockHead() + "平压在她的阴部上，对于她巨大的恶魔阴部来说太大了，无法吞下。在受挫的欲望的驱使下，你抬起她的腿，把她沾满淫液的大腿缠在你的");
            if(get_player().cockTotal() > 1)
            {
               outputText("主");
            }
            outputText("[cock]上。塞拉芙光滑的皮肤和柔软的大腿肉形成了一个舒适紧致的自慰管。你开始慢慢地前后摇晃，将你巨大的肉棒在她的身体上摩擦。恶魔在你的[cock]下扭动着臀部，她湿滑的裂口和几乎被压碎的肉棒狂热地摩擦着你。虽然你没有真正侵犯她，但她的大腿和无瑕的皮肤足以让你达到高潮的边缘。[pg]");
            outputText("被击败的双性魅魔用手臂抱住你的[cock]，充满欲望地哀鸣：[say: 不，求求你！你会把精液弄得我满脸都是，弄脏我的脸！求求你不要把那种恶心的东西涂在我身上！][pg]");
            outputText("你咕哝了一声，抓住俘虏的脚踝，把她当成一次性性玩具一样使用。你的[hips]拍打她大腿的声音响亮地回荡着，几乎淹没了你每次猛烈摩擦她阴唇时[cock]发出的湿润的挤压声。");
            if(get_player().cocks[0].cockLength < 18)
            {
               outputText("你的" + get_player().cockHead() + "随着每一次抽插在她的乳房之间起伏，撞击着她的下巴。随着快感增强到高潮的程度，它变得越来越大。[pg]");
            }
            else if(get_player().cocks[0].cockLength < 24)
            {
               outputText("你的" + get_player().cockHead() + "随着每一次抽插滑过她的脸颊，在她的脸上留下一道先列腺液的痕迹。随着快感接近高潮的程度，闪闪发光的先列腺液污迹变得越来越大。[pg]");
            }
            else
            {
               outputText("你的[cock]随着每一次抽插滑过她的脸庞，在你拔出并在她脸上滴落之前，用你浓稠的先列腺液涂抹着恶魔的头发。这种行为带来的快感令人难以置信，随着感觉接近高潮，你感觉到自己变得更硬了。[pg]");
            }
            outputText("塞拉芙在高潮时尖叫着，语无伦次地哭喊了一会儿，最终勉强尖叫出声，[say: 是的，用精液溅满我！用你强大的精液惩罚这个低贱的恶魔。支配我吧~][pg]");
            outputText("在你巨大的勃起之下，你能感觉到塞拉芙较小的肉棒在扭动和蠕动，将她自己滚烫的液体卸在她汗湿的肚子上。她在你身下扭动和抽搐，她大腿的肌肉随着她喷射的节奏收紧和放松，将你推向极限。你看着你的[cock]紧绷并喷射，将你浓稠的精液倾泻在恶魔的");
            if(get_player().cocks[0].cockLength < 18)
            {
               outputText("乳房上");
            }
            else if(get_player().cocks[0].cockLength < 24)
            {
               outputText("脸上");
            }
            else
            {
               outputText("长发上");
            }
            outputText("。高潮中的恶魔继续在你身下喷射，用更多的精液浸透和涂抹自己，她的整个中段看起来像是涂上了一层厚厚的白色粘液。");
            if(get_player().cumQ() >= 1000)
            {
               outputText("你惊人的生育能力很快在她周围形成了一个水坑，让这个骗人的诱惑者几乎淹没在精液中。");
            }
            outputText("[pg]");
            outputText("你叹了口气，感到极大的解脱，将你变软的庞大身躯从她身上移开。塞拉芙疲惫地呼出一口气，将精液混合物涂抹在她的肚子上，咕哝着，[say: 所以你真的给了我一大股。我一定会把几批精液舀进我的子宫里，这样我们就可以一起生很多小恶魔了。][pg]");
            if(get_player().cor < 33)
            {
               outputText("你呻吟着，只希望她能停止提醒你这场小幽会的后果。为了尽快摆脱这个恶魔，你穿好衣服，动身返回营地。[pg]");
            }
            else if(get_player().cor < 66)
            {
               outputText("你呻吟着，想知道她为什么就是不肯结束她的小把戏。虽然这不是你最好的主意，但也远没有她说的那么糟。你穿好衣服离开，迫不及待地想摆脱她。[pg]");
            }
            else
            {
               outputText("你弯下腰，轻轻抚摸她的肚子，在她耳边低语，[say: 亲爱的，我一有机会就会把它们吐在我的肉棒上。][pg]");
            }
            outputText("当你离开时，你懒得看一眼困惑的双性魅魔；她不值得你花时间。");
         }
         get_player().orgasm("Dick");
         dynStats(DynStat.Lib(3),DynStat.Sens(3),DynStat.Cor(1));
         if(get_game().get_inCombat())
         {
            get_combat().cleanupAfterCombat();
         }
         else
         {
            doNext(get_camp().returnToCampUseOneHour);
         }
      }
      
      public function loseToCeraphAndGetPiercingsInEarsOrSomethingSomehow() : void
      {
         clearOutput();
         spriteSelect(SpriteDb.get_s_ceraph());
         outputText("塞拉芙向你");
         if(get_player().get_HP() < 1)
         {
            outputText("俯卧的");
         }
         else
         {
            outputText("被欲望吞噬的");
         }
         outputText("身体走来，她从一个小袋子里掏出一对闪闪发光的绿色穿环，平静地低语道：[say:哦，别担心，宝贝，你会非常喜欢这个的。这些穿环很特别，它们会帮你学会享受我将要教你的东西。][pg]");
         if(get_player().earsPierced > 0)
         {
            outputText("塞拉芙随意地挥了挥手，低声念诵着黑魔法的咒语，你耳朵上的穿环掉落到地上，留下光滑无损的肌肤。");
         }
         outputText("恶魔把手放在你的额头上，揉着你的太阳穴。随着她的每一次触摸，力量从你的身体里流失，直到你变得无助和瘫痪。她把一个耳环扣进你的左耳，一阵眩晕感席卷了你。片刻之后，她又穿透了另一边，伴随而来的那种现在已经熟悉的眩晕感似乎比以前来得快，去得也快。你希望她不要在你瘫痪的时候拿走你的[armor]，让你完全暴露在外面游荡。当你试图理解这个奇怪的想法时，困惑和一波波新的欲望在你的脑海中交战。[pg]");
         outputText("塞拉芙看着你的");
         if(get_player().cockTotal() > 0)
         {
            outputText("阴茎随着你扑通扑通的心跳而跳动");
         }
         else if(get_player().hasVagina())
         {
            outputText("阴道变得越来越湿润");
         }
         else
         {
            outputText("微张的嘴唇和困惑的表情");
         }
         outputText("，随着新的想法和欲望在你体内安顿下来。她轻轻拍了拍你，解释道：[say:没关系，宝贝，你现在是个暴露狂了。当我把那些被诅咒的耳环戴进你可爱的小耳朵里时，它们的魔法就深深地滑进了你的体内，教你如何做一个好[boy]，并因为暴露自己而兴奋起来。][pg]");
         outputText("从这个想法让你变得多么火热来看，塞拉芙是对的——<b>不管你喜不喜欢，你现在是个暴露狂了。</b>");
         get_player().earsPierced = 1;
         get_player().earsPShort = "绿宝石耳钉";
         giveFetish();
         dynStats(DynStat.Lust(25),DynStat.Cor(5));
         get_combat().cleanupAfterCombat();
      }
      
      public function loseToCeraphAnGetPierced2() : void
      {
         clearOutput();
         spriteSelect(SpriteDb.get_s_ceraph());
         outputText("塞拉芙咯咯地笑着，再次向你靠近。你无力反抗，只能躺在那里，任由她再次按摩你的太阳穴，用她的魔法麻痹你的身体。她非常乐意在掏出一对闪亮的黑色耳钉时制造悬念，[saystart]哦，你想知道这些会教你什么吗？那么，我把它们滑进你那");
         if(get_player().hasFuckableNipples())
         {
            outputText("荡妇般的");
         }
         else if(get_player().nippleLength < 1)
         {
            outputText("可爱的");
         }
         else
         {
            outputText("紧致的");
         }
         outputText("乳头里，然后你告诉我你所有的癖好，以及哪一个让你最兴奋，怎么样？好吗？[sayend][pg]");
         if(get_player().nipplesPierced > 0)
         {
            outputText("塞拉芙随意地挥了挥手，低声念诵着黑魔法的咒语，你乳头上的穿环便掉落到了地上，只留下光滑无痕的肌肤。");
         }
         outputText("恶魔没有给你回答的机会，而是专注于将穿环的尖端对准你敏感的乳头。你的右侧[nipple]被她利落地刺穿，疼得你几乎要尖叫出声。当她扣紧穿环时，你感到一阵鸡皮疙瘩如波浪般席卷全身。第二个穿环似乎没那么疼了，但那种起鸡皮疙瘩的感觉却更加明显。你的眼睛慌乱地四处张望，害怕塞拉芙又强加给你什么新的性癖。[pg]");
         outputText("她低头对你微笑着，戏谑道：[say:还没想明白吗？我给你个提示：被麻痹不就和被绑起来差不多吗？][pg]");
         outputText("你的身体突然试图挣脱她无形的束缚，瞬间涨得通红。真的是这样！当这种束缚感让你越来越兴奋时，你几乎要哭出来了。塞拉芙那被诅咒的穿环让你对束缚产生了性癖。一想到那些触手怪，你几乎要晕厥过去，你知道如果它们把你绑起来，你根本毫无抵抗的希望。<b>不知为何，你必须得习惯成为一个束缚癖了……</b>");
         dynStats(DynStat.Lust(25),DynStat.Cor(5));
         get_player().nipplesPierced = 1;
         get_player().nipplesPShort = "无缝黑色乳环";
         get_player().nipplesPLong = "无缝黑色乳环";
         giveFetish();
         get_combat().cleanupAfterCombat();
      }
      
      public function loseFUCKME() : void
      {
         FlagDict_Impl_.arrayWriteInt(KFLAGS.flags,291,0);
         spriteSelect(SpriteDb.get_s_ceraph());
         if(!hasExhibition())
         {
            loseToCeraphAndGetPiercingsInEarsOrSomethingSomehow();
         }
         else if(!hasBondage())
         {
            loseToCeraphAnGetPierced2();
         }
         else if(!hasPacifism())
         {
            getPiercedByCeraphLoss3();
         }
         else
         {
            ceraphRapesYouBADDAWGYODIGGITY();
         }
      }
      
      public function level3CeraphOfferNo() : void
      {
         clearOutput();
         spriteSelect(SpriteDb.get_s_ceraph());
         outputText("你告诉塞拉芙，你拒绝让她以这种方式侵犯你的身心。她若无其事地耸了耸肩，拉了拉马鞭，把它拉长成一条燃烧着火焰的鞭子。[pg]");
         outputText("[say: 凡人总是喜欢吃苦头，]她叹了口气。[pg]");
         outputText("<b>你有一场硬仗要打！</b>");
         startCombat(new Ceraph());
      }
      
      public function level3CeraphOffer() : void
      {
         clearOutput();
         spriteSelect(SpriteDb.get_s_ceraph());
         outputText("塞拉芙再次出现在你面前，舔着嘴唇，用马鞭不停地拍打着她的大腿。她问道：[say: 你是不是已经爱上了这种赤身裸体、被束缚的暴露感和无助感？你的身体是不是已经渴望我把你变成一只被束缚的爱宠了？我们可以继续沿着这条路走下去，我未来的小宠物，只要再穿一个孔，你就准备好了。][pg]");
         outputText("你让她给你穿孔吗？");
         doYesNo(yesOHGODYESPIERCELEVEL3,level3CeraphOfferNo);
      }
      
      public function killCeraph() : void
      {
         FlagDict_Impl_.arrayWriteInt(KFLAGS.flags,2657,1);
         spriteSelect(null);
         clearOutput();
         outputText("你受够了这个恶魔的诡计！你举起你的[weapon]走向她，眼中闪烁着杀意。");
         outputText("[pg]当塞拉芙意识到自己的处境时，她惊恐地睁大了眼睛。她做了最后一次起身的尝试，但却无法聚集起足够的力气。");
         if(get_player().get_weapon().isHolySword())
         {
            outputText("[pg]你高举美丽的剑，迅速挥下，异常轻松地斩下了恶魔的头颅。沾在剑刃上的血液很快在紫色的火焰中燃烧殆尽，这是剑的圣洁属性在发挥作用的标志。随着恶魔被击杀，你离开了群山，对这片土地又少了一个腐化生物感到满意。");
         }
         else if(get_player().get_weapon().isBladed())
         {
            outputText("[pg]你用力一挥，斜向下劈开了恶魔的肩膀和躯干。刀刃停在她的心脏处，你迅速而猛烈地将其拔出，鲜血喷洒在地上。塞拉芙死了。");
         }
         else if(get_player().get_weapon().isKnife())
         {
            outputText("[pg]你蹲下来，与惊慌失措的恶魔面对面，迅速将匕首刺入她的心脏。她痛苦地喘息着，但随着你扭动匕首，她的痛苦很快就结束了，你杀死了她。塞拉芙死了。");
         }
         else if(get_player().get_weapon().isRanged())
         {
            outputText("[pg]你用[weapon]瞄准她并开火，准确无误地击中了她的胸膛和心脏，将其贯穿。她倒在地上，失去了生命。塞拉芙死了。");
         }
         else if(get_player().get_weapon().isBlunt())
         {
            outputText("[pg]你用力挥向她的胸口，造成了巨大的打击，粉碎了恶魔的肋骨，使她的躯干变形，瞬间夺走了她的生命。塞拉芙死了。");
         }
         else if(get_player().get_weapon().isSpear())
         {
            outputText("[pg]你一个弓步突刺，迅速刺穿了恶魔的胸膛，将你的[weapon]刺入她的躯干。她只能发出一声短暂的呜咽作为回应。她看着刺穿自己的武器，瘫倒在地上。塞拉芙死了。");
         }
         else
         {
            outputText("[pg]你徒手抓住恶魔的头。她惊讶了片刻，但当你扭动它时，她明白了你的意图。她虚弱地试图抵抗，抓挠你的脸和手臂，但你深吸一口气，用力一推，完全扭断了她的脖子。塞拉芙死了。");
         }
         get_player().upgradeBeautifulSword();
         get_combat().cleanupAfterCombat();
         doNext(get_camp().returnToCampUseOneHour);
      }
      
      public function hugeCorruptionForceFuckCeraph() : void
      {
         var _g:Combat;
         var _loc1_:IMap = KFLAGS.flags;
         FlagDict_Impl_.arrayWriteInt(_loc1_,291,FlagDict_Impl_.arrayReadInt(_loc1_,291) + 2);
         clearOutput();
         spriteSelect(SpriteDb.get_s_ceraph());
         var _loc2_:int = get_player().biggestCockIndex();
         outputText("你嘲笑塞拉芙");
         if(get_monster().get_HP() < 1)
         {
            outputText("被打败、俯卧的");
         }
         else
         {
            outputText("俯卧、自慰的");
         }
         outputText("样子，[say: 你们这些该死的恶魔都一样。那种自鸣得意的优越感让你们忘记了，身为恶魔并不意味着无敌。][pg]");
         outputText("这个双性人施虐狂揉弄着她滴水的裂口，从你话语中的支配感中获得了快感，但她仍然设法挑衅地咆哮道，[say: 滚——开。只要……强奸我或者随便什么，赶紧结束吧。][pg]");
         outputText("她还真是个输不起的人！你把你的[armor]扔在地上，抚摸着你");
         if(get_player().cockTotal() > 1)
         {
            outputText("最大的");
         }
         outputText(get_player().cockDescript(_loc2_) + "，感觉血液泵入其中。粗壮的阴茎肉膨胀到你每次勃起时都会呈现的滑稽尺寸。当塞拉芙看到从你下体长出的庞然大物时，她的眼睛睁得像餐盘一样大，充满了震惊。她实际上试图在泥土中爬走，但她惨败了。");
         if(get_monster().get_HP() < 1)
         {
            outputText("她的双手正忙着撸动她那长满结节的恶魔肉棒，根本无暇顾及爬走。");
         }
         else
         {
            outputText("她的双手都在腹股沟处忙碌，无法帮助她逃脱。");
         }
         outputText("[pg]");
         outputText("你把肿胀的肉棒压在她身上，用你欲望的重量将她钉住。塞拉芙震惊而痛苦地喘息着，但她坚硬的乳头紧紧地压在你的 " + get_player().cockDescript(_loc2_) + " 的下方。这个荡妇很喜欢这样——难道她暗地里是个受虐狂？不管怎样，这都不重要了；这个恶魔要付出代价。你向后扭动，将那根大象般的肉棒拖过被击败的恶魔的身体，直到肿胀的顶端停留在她紫色的恶魔小穴上。她尖叫道，[say: 哦，操，不！那会杀了我！求你了，不要！][pg]");
         outputText("求求你了？她可是说了魔法词汇呢。");
         if(get_player().statusEffectv1(StatusEffects.Exgartuan) == 1)
         {
            outputText("你拍了拍你的" + get_player().cockDescript(_loc2_) + "，说道：[say: 帮个忙好吗，埃克斯加图安？]");
         }
         else
         {
            outputText("你闭上眼睛，将腐化力量集中在胯部。");
         }
         outputText("快感在你的中段绽放，蔓延至你硕大的肉棒，直到它开始从顶端滴下黑色的黏液。这种粘稠的深色物质溅入塞拉芙那恶魔般的小穴，瞬间渗入她湿润的洞口。她呻吟着，大概是因为这股邪恶魔法的涌入而高潮了。效果立竿见影，在重力的作用下，你的龟头毫不费力地滑入了她的体内。这只恶魔被腐化的小穴开始围绕着你扩张，而你甚至还没开始用力！[pg]");
         outputText("她大腿上完美无瑕的肌肤从你指间滑落，随后你才在膝盖下方抓住了她的双腿。塞拉芙交替着呻吟和哀求：[say: 你……你在对我做什么？停下……求求你……不要……插进来！哦，女王在上，好舒服……不该这么舒服的……][pg]");
         outputText("她似乎一点也不介意被插入。你向前推进，进入恶魔小穴紧致的内部，感受着她紧绷的肉壁紧紧夹住你，你因这美妙的触感而发出愉悦的呻吟。这位曾经的施虐狂的腹部明显扭曲，随着她的小穴扩张以容纳你，她的腹部呈现出你阴茎的形状。她曲线优美的臀部明显移动，随着塞拉芙的身体屈服于你的意志而分开。你的" + get_player().cockHead(_loc2_) + "遇到了一点象征性的阻力，但一股黑色的、具有转化能力的精液迅速喷出，扩张了她的子宫颈，让你得以通过。这条恶魔的爱之通道继续变宽，以接受你" + get_player().cockDescript(_loc2_) + "的恩赐，你毫不费力地将这股扭曲感推过她的肚脐，直到她那大而坚挺的乳房正下方。[pg]");
         outputText("即使有你的黑魔法扭曲她的身体，塞拉芙的身体似乎也无法承受更多了。她的精神更是绝对承受不住；她的眼睛几乎完全翻白，喘息着说着色情胡话：[say: 操……啊……小穴-鸡巴……哦……好……大……还要……精液套……]你有点失望这么快就把她玩坏了，但当你感觉到她的身体将你吸得更深时，这种失望很快就消失了。这可能是她与生俱来的魔法受到了你的影响，也可能是她破碎的人格决定协助你完全插入她。无论如何，她的双乳之间形成了一个圆柱形的凸起，透过她的皮肤，你" + get_player().cockDescript(_loc2_) + "上的每一根血管都清晰可见。[pg]");
         outputText("塞拉芙的喉咙像气球一样鼓起，以容纳你的粗壮，正好赶上她将你吸得更深。此时你甚至不需要向前推；她的整个身体感觉就像魅魔的小穴内部，完全专注于取悦男性的器官。她的胡言乱语变成了愉悦的咕噜声，然后完全消失。你不确定她是如何呼吸的，但她的下巴脱臼了，并以一种淫秽的方式拉伸。你甚至能看到你被污染的先列腺液从她的唇间溢出，顺着她的脸颊流下，然后你那沾满淫液的龟头开始品尝空气的味道。");
         if(get_player().cocks[_loc2_].cockLength < 68)
         {
            outputText("这不可能！你根本没那么长。她的身体一定是缩小到了一个更合适的长度……");
         }
         outputText("[pg]");
         outputText("当你被");
         if(get_player().cocks[_loc2_].cockLength < 68)
         {
            outputText(Utils.num2Text(int(get_player().cocks[_loc2_].cockLength / 12)));
         }
         else
         {
            outputText("六");
         }
         outputText("英尺长的爱之隧道挤压和按摩时，你努力控制着不让自己射出来。");
         if(get_player().cocks[_loc2_].cockLength > 84)
         {
            outputText("你还有很长一截鸡巴没插进去，于是你开始把剩下的部分推入她的体内，把她当成一个超大号的、有机的飞机杯来用。");
         }
         else
         {
            outputText("你满足地叹了口气，摩擦着你的");
            if(!get_player().hasSheath())
            {
               outputText("腹股沟");
            }
            else
            {
               outputText("包皮");
            }
            outputText("抵着她那湿滑、裂开的缝隙，然后你向后拉，开始像使用一个超大号的、有机的飞机杯一样操她。");
         }
         outputText("这位曾经令人畏惧的恶魔，每次你从她喉咙里拔出时，都会发出满足的叹息，而当你插入她的小穴时，那淫秽的“咕叽”声简直是听觉上的天堂。你拍打着她的乳房，看着它们晃动，但这荒谬的色情画面甚至压倒了你那变态的标准。塞拉芙滑落下来，将你吞没到底，同时她那遍布全身的小穴因高潮而痉挛。");
         if(get_player().cumQ() < 100)
         {
            outputText("你将精液射在泥土上，但有些顺着你尿道的下侧回流，挂在塞拉芙的上唇，并顺着她的脸颊滴入她凌乱的头发中。");
         }
         else if(get_player().cumQ() < 1000)
         {
            outputText("你到处喷射着大量的精液，溅在泥土上，白色的粘液滴在塞拉芙的脸上、额头和头发上。当你结束时，她身上已经覆盖了一层漂亮的白浊。");
         }
         else
         {
            outputText("你喷出了巨大的精液浪潮，只能用爆发来形容。它们溅在泥土上，形成厚厚的水坑，随着每一次成功的粘液飞溅而连接在一起。在喷射之间，一股稳定的水流从顶端漏出，沿着下面流下，挂在塞拉芙的嘴唇上。精液流在重力的作用下流过她的脸，进入她的头发。当你结束时，她被白浊覆盖，滴落成一个水坑。");
         }
         outputText("[pg]");
         outputText("你把用过的性玩具从你的[cock]上推开");
         if(get_player().cockTotal() == 2)
         {
            outputText("并惊叹于你另一根阴茎排入水坑的精液");
         }
         else if(get_player().cockTotal() > 2)
         {
            outputText("并惊叹于你其他阴茎排入水坑的精液");
         }
         outputText("。塞拉芙的小穴至少张开了" + Utils.num2Text(int(get_player().cocks[_loc2_].cockThickness + 1)) + "英寸宽，把她的臀部推得那么开，以至于很难走路。她颤抖着，流着口水、爱液和精液，她的嘴、脖子和胸部收紧了。她的下半身没有一丝改变；你的魔法仍然压制着她腰部以下的自然能力。被虐待的支配者又抽搐了几次，然后她的眼睛重新出现，她把舌头缩回嘴里。[pg]");
         outputText("塞拉芙喘息着，[say: 噢噢噢噢，好的。感觉真爽。] 她从她的空间里收集了一些你的精液，微笑着吞了下去，然后她提议，[saystart]你让我度过了一段美好的时光，凡人。");
         if(!get_game().get_inCombat())
         {
            outputText("[sayend]");
            get_player().orgasm("Generic");
            dynStats(DynStat.Lib(3),DynStat.Sens(3),DynStat.Cor(1));
            doNext(get_camp().returnToCampUseOneHour);
            return;
         }
         outputText("这比你想象的要罕见得多，所以我感觉有点慷慨。");
         if(hasExhibition())
         {
            outputText("如果你愿意，我会从你身上移除一些我的魔法，我甚至会让你保留穿孔。你想要那样吗？");
         }
         else
         {
            outputText("我愿意给你一些额外的宝石，让你有动力再做一次这样的事。我喜欢惊喜。怎么样？");
         }
         outputText("[sayend][pg]");
         if(get_player().statusEffectv1(StatusEffects.Exgartuan) == 1)
         {
            outputText("埃克斯加图安嘟囔着，[say: 是啊，我也爱我自己。现在，趁你们两个婊子亲吻和好，我要去睡个午觉了。][pg]");
            get_player().addStatusValue(StatusEffects.Exgartuan,2,5);
         }
         outputText("（你接受塞拉芙的提议吗？）");
         _g = get_combat();
         doYesNo(ceraphsNiceOffer,function():void
         {
            _g.cleanupAfterCombat();
         });
         get_player().orgasm("Generic");
         dynStats(DynStat.Lib(3),DynStat.Sens(3),DynStat.Cor(1));
      }
      
      public function hasPacifism() : Boolean
      {
         return int(get_fetish() % 10) >= 3;
      }
      
      public function hasExhibition() : Boolean
      {
         return int(get_fetish() % 10) >= 1;
      }
      
      public function hasBondage() : Boolean
      {
         return int(get_fetish() % 10) >= 2;
      }
      
      public function hadFetish() : Boolean
      {
         return get_fetish() >= 10;
      }
      
      public function giveUpYourBallsOrWhateverForLessFetishes() : void
      {
         var _loc2_:* = null as IMap;
         clearOutput();
         spriteSelect(SpriteDb.get_s_ceraph());
         var _loc1_:int = 0;
         outputText("你一动不动，虽然对这一刻感到恐惧，但你非常清楚，你必须放弃一些东西才能把她的抚摸从你的脑海中抹去。");
         if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,217) == 1)
         {
            _loc1_ = Utils.rand(get_player().cockTotal());
            outputText("塞拉芙的手指拂过你的" + get_player().cockDescript(_loc1_) + "时，感觉异常滚烫，仿佛她刚从热水浴缸里出来一样。你还没来得及细想这个小细节，她的手指就捏成了一个紧紧的圆环");
            if(get_player().cocks[_loc1_].cockThickness >= 4)
            {
               outputText("，紧紧勒住你粗大坚硬的肉棒");
            }
            outputText("，慢慢收紧。这本该很疼，但并没有，只是感觉越来越热，然后伴随着突然的“啵”的一声，塞拉芙手里正拿着你的" + get_player().cockDescript(_loc1_));
            if(get_player().balls > 0 && get_player().cockTotal() == 1)
            {
               outputText("和蛋蛋");
               get_player().balls = 0;
               get_player().ballSize = 1;
            }
            if(get_player().cockTotal() == 1)
            {
               get_player().removeStatusEffect(StatusEffects.Infested);
            }
            outputText("！断口处是光滑的血肉和一个奥术印记，不知怎的让这根离体的阴茎保持着活性，在她的抓握中跳动蠕动。而你腹股沟上的那个位置变得完全光滑平整，仿佛它从来没有存在过一样。[pg]");
            outputText("塞拉芙用手指在阴茎上上下滑动，在你的脑海中放起了烟花——你依然能感觉到！恶魔大笑着说，[say:别担心，一旦我把它连接到别处，你就不会一直感觉到这种感觉了，不过在你失去意识的时候可能会有一丝感觉。现在，享受这份快感吧！哦，我把那个美味的癖好塞进阴茎里留作后用了。再见，我的宠物！现在去给我找更多美味的阴茎吧！][pg]");
            outputText("她旋转着离开，几乎是在山间跳舞，同时抚摸和挑逗着你刚刚失去的阴茎。谢天谢地，她信守了诺言——你的头脑感觉清醒多了，至少在一条滚烫的恶魔舌头没有包裹住塞拉芙的新玩具时是这样。");
            get_player().removeCock(_loc1_,1);
            removeFetish();
            _loc2_ = KFLAGS.flags;
            FlagDict_Impl_.arrayWriteInt(_loc2_,218,FlagDict_Impl_.arrayReadInt(_loc2_,218) + 1);
            dynStats(DynStat.Lib(-2),DynStat.Sens(-2),DynStat.Cor(5));
         }
         else if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,217) == 2)
         {
            outputText("塞拉芙的指甲痛苦地刺入你的[skindesc]，在你的外阴周围做圆周运动。随着她的手指深入，像开瓶器一样穿透你的肉体，这种动作带来的痛苦逐渐消退，变成一种温和的、悸动的热量。一秒钟后她缩回手，一根包裹着皮肤、毫无特征的肉柱坐在她的手中，顶部是你的[vagina]。另一端盖着一个奇怪的奥术印记，似乎是纹在皮肤上的。你低头看去，以为你的腹股沟被毁了，但你的阴道曾经占据的地方被裸露的、没有标记的皮肤所取代。[pg]");
            outputText("恶魔将一根手指滑入她手中的小穴，你莫名其妙地呻吟起来，依然能完美清晰地感觉到每一个感觉。她又玩弄了几秒钟，手指发出轻柔的“噗嗤-噗嗤-噗嗤”声在山间的空气中回荡，然后她似乎厌倦了挑逗你。[pg]");
            outputText("[say:哦，别在意这些感觉，等我走远点，把它塞进另一个宠物身体里，它们就会消失的。我不知道你是否能完全与它隔离，但谁在乎呢？反正你可能只会在梦里感觉到它。哦，我差点忘了！我把一个癖好塞进了我的新飞机杯里。我可是个言出必行的淑女，你说呢？现在，我得走了。宠物，确保再弄一个这个，以防我还需要更多，好吗？]塞拉芙带着一种不可估量的权威感指示道。[pg]");
            outputText("你惊愕地张大嘴巴，试图想出回应或阻止她，但在你做出任何反应之前，她就把你那旧的" + get_player().vaginaDescript(0) + "压在了她那根跳动的恶魔肉棒上。这让你[legs]发软，你躺在那里呻吟，而塞拉芙则一边蹦蹦跳跳地离开，一边用你那脱离身体的小穴自慰。最终，你在恶魔精液喷射进体内的感觉中高潮了，但这是一种奇怪而空虚的高潮。");
            get_player().removeVagina(0,1);
            get_player().orgasm("Generic");
            dynStats(DynStat.Cor(5));
            removeFetish();
            _loc2_ = KFLAGS.flags;
            FlagDict_Impl_.arrayWriteInt(_loc2_,219,FlagDict_Impl_.arrayReadInt(_loc2_,219) + 1);
         }
         else
         {
            _loc1_ = get_player().biggestTitRow();
            if(get_player().breastRows[_loc1_].fuckable)
            {
               FlagDict_Impl_.arrayWriteInt(KFLAGS.flags,217,4);
            }
            else if(get_player().lactationQ() >= 100)
            {
               FlagDict_Impl_.arrayWriteInt(KFLAGS.flags,217,5);
            }
            else
            {
               FlagDict_Impl_.arrayWriteInt(KFLAGS.flags,217,3);
            }
            outputText("塞拉芙用手颠了颠你的" + get_player().breastDescript(_loc1_) + "，把玩了几秒钟后，她指甲掐进去用力一拉。你的乳房被拉伸了一会儿，紧绷着，而塞拉芙则残忍地咯咯笑着。你的胸腔内绽放出热量，从塞拉芙指尖传来的生动刺痛感深入你的体内。最后，这种感觉达到顶峰，伴随着一声低沉的“砰”，你的乳房肉从身体上分离了。你仔细观察着那离开的胸部——它曾经与你身体相连的地方，现在覆盖着健康的粉红色皮肤和复杂神秘的纹身。与此同时，");
            if(_loc1_ < int(get_player().breastRows.length) - 1 && int(get_player().breastRows.length) > 1)
            {
               if(_loc1_ >= int(get_player().breastRows.length) - 2)
               {
                  outputText("你的躯干发生了变化，你的" + get_player().breastDescript(int(_loc1_ + 1)) + "向上移动填补了空缺。");
               }
               else
               {
                  outputText("你的躯干发生了变化，你其他的乳房向上移动填补了空缺。");
               }
               get_player().removeBreastRow(_loc1_,1);
            }
            else if(_loc1_ == 0)
            {
               outputText("你现在平坦的胸部慢慢长出了两个四分之一英寸大的小乳头。");
               get_player().breastRows[0].breastRating = 0;
               get_player().nippleLength = 0.25;
               get_player().breastRows[0].breasts = 2;
               get_player().breastRows[0].nipplesPerBreast = 1;
               get_player().breastRows[0].fuckable = false;
               get_player().breastRows[0].lactationMultiplier = 0;
            }
            else
            {
               outputText("你的躯干留下了现在空荡荡的位置，变成了一片平坦、毫无特征的空白。");
               get_player().removeBreastRow(_loc1_,1);
            }
            if(int(get_player().breastRows.length) == 0)
            {
               outputText("<b>错误！错误！如果你不想让你的存档出问题，请联系Fenoxo并重新加载你的游戏。</b>");
            }
            outputText("[pg]");
            outputText("当塞拉芙");
            if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,217) == 3)
            {
               outputText("用手揉搓乳头时");
            }
            else if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,217) == 4)
            {
               outputText("将指尖推入漏水的乳头小穴时");
            }
            else
            {
               outputText("挤出一股乳汁时");
            }
            outputText("，你喘息着，膝盖有些发软。塞拉芙笑着将那对弹性的球体降到她的双腿之间，当她用你那脱离身体的乳房乳交时，你能感觉到她那堕落肉棒上的每一个小凸起和结节。[pg]");
            outputText("[say: 哎呀哎呀，是不是有人喜欢有一根硬邦邦的肉棒埋在她的奶子里？也许我应该把这些留在你身上，这样我在离开前就能充分享受了。也许下次吧。别介意你还能感觉到它们的事实——那会随着距离和时间而消退的。不过我听说你还能在梦里感觉到它们，所以也许如果你闭上眼睛足够用力，你就能感觉到我的肉棒在我的一只宠物身上操你的奶子，] 恶魔一边嘲弄着，一边继续用你以前的胸部乳交。[say: 别担心那个恋物癖，我把它和这些小宝贝打包在一起了。反正一开始把它弄到你身上也没那么难。][pg]");
            outputText("塞拉芙转过身，在岩石间蹦蹦跳跳地离开，每次你试图移动去追她时，她都会狠狠地捏你的乳头。没用的。她不久就消失了，留下你独自应对她的肉棒在你乳房中慢慢减弱的感觉。[pg]");
            dynStats(DynStat.Lust(20),DynStat.Cor(5));
            removeFetish();
            _loc2_ = KFLAGS.flags;
            FlagDict_Impl_.arrayWriteInt(_loc2_,220,FlagDict_Impl_.arrayReadInt(_loc2_,220) + 1);
         }
         doNext(get_camp().returnToCampUseOneHour);
      }
      
      public function giveFetish() : void
      {
         if(get_fetish() < 10)
         {
            set_fetish(get_fetish() + 10);
         }
         set_fetish(Utils.boundInt(10,set_fetish(get_fetish() + 1),13));
      }
      
      public function get_fetish() : int
      {
         var _loc1_:* = null as IMap;
         if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,23) < 10 && FlagDict_Impl_.arrayReadInt(KFLAGS.flags,23) > 0)
         {
            if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,23) == 3)
            {
               FlagDict_Impl_.arrayWriteInt(KFLAGS.flags,23,2);
            }
            if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,23) > 3)
            {
               FlagDict_Impl_.arrayWriteInt(KFLAGS.flags,23,3);
            }
            _loc1_ = KFLAGS.flags;
            FlagDict_Impl_.arrayWriteInt(_loc1_,23,FlagDict_Impl_.arrayReadInt(_loc1_,23) + 10);
         }
         return FlagDict_Impl_.arrayReadInt(KFLAGS.flags,23);
      }
      
      public function getPiercedByCeraphLoss3() : void
      {
         clearOutput();
         spriteSelect(SpriteDb.get_s_ceraph());
         outputText("恶魔女掏出一个镶钻的穿环向你逼近，她的肉棒硬挺着，小穴湿润，随着她的靠近，臀部诱人地摇曳着。塞拉芙认真地看着你，警告道：[say:你知道你离成为我的宠物有多近了吧？你只需要戴上这个穿环，再花点时间适应它。然后如果你表现好，我会把你扒光，绑起来，让你舔我。我们甚至可以让小恶魔们在旁边看着！][pg]");
         outputText("这个想法让你极度兴奋，你喘息着，因为");
         if(get_player().totalCocks() > 0)
         {
            outputText("先列腺液从");
            if(get_player().totalCocks() > 1)
            {
               outputText("你的每一根");
            }
            outputText("[cocks]中渗出。");
         }
         else if(get_player().hasVagina())
         {
            outputText("女性的爱液从你的阴唇间流出，你的[clit]变成了一个坚硬的肉核。");
         }
         else
         {
            outputText("你的身体渴望释放。");
         }
         outputText("塞拉芙带着被逗乐的笑容，一把扯下你的装备，并且");
         if(get_player().totalCocks() > 0)
         {
            outputText("抓住你的[cock]");
            if(get_player().cocks[0].get_isPierced())
            {
               outputText("，旧的穿环从你的肉体中滑落，掉在地上发出清脆的响声，");
            }
            outputText("然后将镶钻的穿环扣入你敏感的肉体，剧痛让你的视线变得一片血红。[pg]");
            get_player().cocks[0].pierced = 1;
            get_player().cocks[0].pShortDesc = "镶钻阴茎环";
            get_player().cocks[0].pLongDesc = "镶钻阴茎环";
         }
         else if(get_player().hasVagina())
         {
            outputText("拨开你的阴唇");
            if(get_player().vaginas[0].clitPierced > 0)
            {
               outputText("，旧的穿环从你的肉体中滑落，掉在地上发出清脆的响声，");
            }
            outputText("，抓住了你[clit]根部周围的肉。她熟练地将穿环扣上，把钻石耳钉戴在你身上，疼痛让你的视线变得一片血红。[pg]");
            get_player().vaginas[0].clitPierced = 1;
            get_player().vaginas[0].clitPShort = "钻石阴蒂钉";
            get_player().vaginas[0].clitPLong = "钻石阴蒂钉";
         }
         else
         {
            outputText("将钻石耳钉扣入你的眉毛，穿透了它");
            if(get_player().eyebrowPierced > 0)
            {
               outputText("并像扔垃圾一样丢弃了你旧的首饰");
            }
            outputText("。这比想象中还要疼，让你的视线变得一片血红。[pg]");
            get_player().eyebrowPierced = 1;
            get_player().eyebrowPShort = "钻石眉钉";
            get_player().eyebrowPLong = "钻石眉钉";
         }
         giveFetish();
         outputText("当她完成时，你意识到她甚至没有试图限制你！你感到一阵新的力量，在她利用你的新穿环之前挣脱了她的控制，并猛烈地挥出一拳。塞拉芙甚至没有试图躲避。恶魔平静地看着你的拳头越来越近，然后停下，拳头变成了一种温柔的抚摸。你惊恐地试图用[leg]踢她，但你所能做的只是在她的内侧大腿上摩擦。[pg]");
         outputText("[say: 那么，我猜你很喜欢它？你再也不能愤怒地举起手了。我想如果你想赢得战斗，你就得用那具诱人的身体挑逗你的敌人，让他们屈服。我想当你因为暴露自己而高潮，因为想到被绑起来而高潮时，这可能很难做到，]她笑着说。[pg]");
         outputText("当恶魔女郎轻快地走开时，你因为这种侵犯而在无能的愤怒中颤抖。你本想追她，但在她的想法和向整个区域暴露你的胯部之间，你现在最需要的是高潮。你匆忙跑回营地，发情得无法正常思考，尤其是当你新的穿环隐隐作痛，正好提醒你[b:你已经成为一个不情愿的和平主义者。]");
         dynStats(DynStat.Lust(25),DynStat.Cor(5));
         get_combat().cleanupAfterCombat();
      }
      
      public function getCeraphsArmor() : void
      {
         clearOutput();
         spriteSelect(SpriteDb.get_s_ceraph());
         outputText("塞拉芙对你的回答会心一笑。[say:你会发现这非常性感。只是穿的时候要小心。如果你穿得不合适，它会夹到你，]恶魔一边指导着，一边扔给你一套护甲。[pg]");
         get_inventory().takeItem(get_armors().SEDUCTA,get_camp().returnToCampUseOneHour);
      }
      
      public function friendlyNeighborhoodSpiderManCeraph() : void
      {
         clearOutput();
         spriteSelect(SpriteDb.get_s_ceraph());
         outputText("在探索时，一种想要脱光衣服的冲动突然传遍你的全身，");
         if(get_player().cor > 66)
         {
            outputText("你不假思索地脱下衣服，将你的[armor]扔到一边。它重重地落在干燥的山间尘土中。");
         }
         else if(get_player().cor > 33)
         {
            outputText("你在[armor]里扭动挣扎，衣服的材质让你的皮肤发痒。最终，你成功地抵制住了这种冲动。");
         }
         else
         {
            outputText("你对这个荒谬的想法忍俊不禁，无视了手指在装备下抓挠发痒处的动作。");
         }
         outputText("你的");
         if(Boolean([0,1].contains(get_player().skin.type)))
         {
            outputText("皮肤发烫");
         }
         else if(get_player().hasScales())
         {
            outputText("鳞片发烫");
         }
         else
         {
            outputText("[skindesc]发烫");
         }
         outputText("，因恋物癖放大的欲望和白日梦而变得炽热，但你摇了摇头，及时看到一双漆黑的眼眸从附近的一块巨石后升起。[pg]");
         outputText("你把目光从那双危险而奇异的眼睛上移开，向下看去，但这无济于事。映入眼帘的只有完美无瑕、被汗水浸湿的恶魔肌肤，高耸的紫色乳房，以及结合了两性最完美特征的胯部。是恶魔塞拉芙！[pg]");
         outputText("[saystart]哎呀，看来有人很喜欢自己看到的景象呢？");
         if(get_player().cor > 66)
         {
            outputText("我能看出我让你变得多饥渴，我很高兴你屈服了，为我脱光了衣服");
         }
         else
         {
            outputText("你的眼睛都离不开我了。真遗憾你没有脱衣服。难道没人告诉你这座山有穿衣规定吗？或者我应该说，脱衣规定");
         }
         outputText("，[sayend]她说道。[pg]");
         outputText("你准备好你的[weapon]，但塞拉芙只是仰起头，当着你的面大笑起来。[saystart]");
         if(get_player().cor > 66)
         {
            outputText("你打算光着身子和我打吗？如果你要那样做，那你还是先穿上衣服吧，我可不想不小心在不该留疤的地方留下伤疤。");
         }
         else
         {
            outputText("你打算和我打吗？如果你要那样做，我想我们也可以玩玩。你似乎确实需要练习一下如何放纵你的恋物癖。");
         }
         outputText("[sayend][pg]");
         outputText("恶魔将一只穿着高跟鞋的脚高高抬起踩在巨石上，向你眨了眨眼，让她的鞭子在她坚硬、布满结节的肉棒上下来回摩擦。她的尾巴在她完美、曼妙的双腿间慵懒地翘起，诱人地摩擦着她那闪闪发光、湿润的私处三角区。恶魔娇嗔道，[say: 噢，我确实喜欢为我未来的宠物们表演。告诉我，你真的是来这里打架的吗？我宁愿躺在阳光下，用手指抚摸我闪闪发光的肌肤，向所有人展示和我做爱会有多美妙。如果你想的话，你甚至可以走，或者也许你有什么值得和我交易的东西？]");
         dynStats(DynStat.Lust(5 + get_player().cor / 10 + get_player().lib / 20),DynStat.Cor(0));
         menu();
         addButton(0,"战斗",startAFightWithCeraph);
         addButton(1,"交易",tradeCeraphSomething);
         addButton(2,"逃跑",runFromCeraphsNiceDeal);
      }
      
      public function finalEncounterLevelCeraphPiercingButtholeNipples() : void
      {
         clearOutput();
         spriteSelect(SpriteDb.get_s_ceraph());
         outputText("塞拉芙从灌木丛中钻出来，手里拿着一套束缚带，毫不掩饰地打量着你的身体。她充满暗示地说：[say: 哎呀，你真是一个可爱的小准奴隶。你准备好穿上你的奴隶束缚带加入我的后宫了吗？我还有几个穿环，我觉得戴在你身上会很好看。也许我可以给你一个口欲期固着和恋足癖。那不是很好吗？或者也许我可以把你绑起来，在玛瑞斯到处游街。你知道我会确保你享受每一分钟的，宝贝，快来穿上这个。][pg]");
         outputText("承认这一点让你感到羞耻，但你绝望地想要赤身裸体并被束缚，被游街示众以挑逗和取悦塞拉芙的敌人。你知道这些欲望是她被诅咒的穿环强加给你的，但这并不能让你更容易否认它们在你身上引发的感情。性感的恶魔女王会很乐意向你灌输外来的欲望，并将它们煽动成熊熊烈火，烧毁你的疑虑和担忧。你屈服并成为她的束缚奴隶吗？[pg]");
         menu();
         addButton(0,"同意",agreeToBecomeCeraphsFuckpetBondageToyBitchSlut);
         addButton(1,"拒绝",finalCeraphEncounterChoiceNo);
         addButton(2,"战斗",finalCeraphEncounterStartFight);
      }
      
      public function finalCeraphEncounterStartFight() : void
      {
         clearOutput();
         spriteSelect(SpriteDb.get_s_ceraph());
         outputText("你拒绝了塞拉芙，并让她知道");
         if(get_player().cor <= 50)
         {
            outputText("你会阻止她邪恶的计划");
         }
         else
         {
            outputText("你会成为她的[master]");
         }
         outputText("。她咆哮着扔下挽具，准备自卫。看来你要打一架了！");
         startCombat(new Ceraph());
      }
      
      public function finalCeraphEncounterChoiceNo() : void
      {
         clearOutput();
         spriteSelect(SpriteDb.get_s_ceraph());
         outputText("你一遍又一遍地坚决拒绝塞拉芙。她对你冷笑一声，说：[say: 随便吧。这只是时间问题。你很快就会加入我的，宠物。][pg]");
         outputText("留下这句话后她就离开了，留下你感到困惑和发情。");
         doNext(get_camp().returnToCampUseOneHour);
      }
      
      public function encounterCeraph() : void
      {
         if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,24) == 0)
         {
            spriteSelect(SpriteDb.get_s_ceraph());
            ceraphFirstTime();
            return;
         }
         if(!hasExhibition())
         {
            spriteSelect(SpriteDb.get_s_ceraph());
            ceraphFirstTimeRepeat();
            return;
         }
         if(hasPacifism())
         {
            spriteSelect(SpriteDb.get_s_ceraph());
            finalEncounterLevelCeraphPiercingButtholeNipples();
            return;
         }
         if(hasBondage())
         {
            spriteSelect(SpriteDb.get_s_ceraph());
            level3CeraphOffer();
            return;
         }
         if(hasExhibition())
         {
            outputText("虽然你花了一个小时探索，但你没有发现任何值得注意的东西。");
            doNext(get_camp().returnToCampUseOneHour);
            return;
         }
      }
      
      public function ceraphsNiceOffer() : void
      {
         var _loc1_:* = null as Player;
         clearOutput();
         spriteSelect(SpriteDb.get_s_ceraph());
         if(hasExhibition())
         {
            outputText("塞拉芙触碰你的额头，感觉像是她的爪子正在翻耙你的大脑，犁过你思绪的表层。她松开手，留下你一阵头晕眼花。你眨了眨眼，在脑海中回顾自己的癖好——");
            if(hasPacifism())
            {
               outputText("你的和平主义消失了！");
            }
            else if(hasBondage())
            {
               outputText("你的束缚癖消失了！");
            }
            else
            {
               outputText("你的暴露癖消失了！");
            }
            removeFetish();
         }
         else
         {
            outputText("塞拉芙摇掉头发上的一些精液，把手伸进纠结的头发下面。她的手拿出一个装有宝石的小袋子，扔给了你。你打开它，惊讶地发现里面有10颗宝石。");
            _loc1_ = get_player();
            _loc1_.set_gems(_loc1_.get_gems() + 10);
         }
         outputText("[pg]被虐待的恶魔支配者笑着说，[say: 怎么？你以为我会骗你吗？不，我喜欢今天。很难找到一个能和我势均力敌，并且能找到不可思议的方法来虐待我身体的人。]");
         outputText("[pg]她向后躺下，放松下来，在激烈的性爱后沉沉睡去。");
         get_combat().cleanupAfterCombat();
      }
      
      public function ceraphRapesYouBADDAWGYODIGGITY() : void
      {
         get_player().slimeFeed();
         spriteSelect(SpriteDb.get_s_ceraph());
         clearOutput();
         if(!get_game().get_inCombat() && !hasPacifism())
         {
            outputText("恶魔女摸了摸你的额头，突然你的脑海中充满了各种性癖！从她那调皮的眼神来看，这只是暂时的，你也顺势配合着。");
         }
         outputText("塞拉芙仰起头大笑，当你");
         if(get_player().get_HP() < 1)
         {
            outputText("颓然倒下，承认失败");
         }
         else
         {
            outputText("放弃抵抗，开始自慰");
         }
         outputText("，[say: 真的吗？就这样？在我的魔法下待了这么久，你试图反抗却失败了，就像这样？！真可悲。][pg]");
         outputText("这个双性恶魔一只脚踩在你的胸口上");
         if(get_player().biggestTitSize() > 1)
         {
            outputText("，就在你的" + get_player().allBreastsDescript());
         }
         outputText("。她的脚像高跟鞋一样拱起，脚跟处长着一块骨头状的突起，痛苦地刺入你的胸膛。她低头看着你，带着困惑的表情，右手在她那肿胀的女性私处上无聊地画着圈。你忍不住享受着这种被性感的恶魔压在身下，被她的脚跟束缚的处境。塞拉芙得意地笑着嘲讽道：[say: 那么我该拿你怎么办呢？我希望你屈服于我的后宫，而不是成为一个被束缚的、不情愿的奴隶。][pg]");
         outputText("她伸手捏住你的一颗勃起的乳头，[say: 虽然我确信你会享受这种束缚和羞辱……我想我只能惩罚你的越轨行为，希望你吸取教训。现在，除非你让我高潮或者你窒息而死，否则我不会放你走，所以我希望你有一条灵巧的舌头！][pg]");
         outputText("在短暂的困惑中，你不知道她是什么意思，但随后你的双手和[legs]被她的鞭子迅速地绑在一起，像捆猪一样。塞拉芙的动作太快了，在你那发懵的脑子弄清楚情况之前，她就已经完成了。你完全无力抵抗这个恶魔的突发奇想，你能做的最好的抵抗就是侧身翻滚。这将是一个毫无希望的徒劳举动，你决定不露任何恐惧或悔意地面对即将到来的一切。[pg]");
         outputText("塞拉芙跨过你的头顶，她那曲线优美的身影遮住了天空，散发着甜美气味的恶魔体液滴落在你的脸上。她一寸一寸地降低身体，她的私处焦急地滴着水，粗大的恶魔肉棒火热地跳动着。那沾满体液的阴唇离你越来越近，从兴奋的恶魔女的通道里滴落出越来越多的水分到你的脖子上。她以猛烈的力量俯冲下来，将她饥渴的小穴猛地撞在你的[face]上，从下巴到鼻子都涂满了恶魔的汁液。[pg]");
         outputText("她那布满结节的恶魔肉棒在你的鼻子和额头上拍打着，上面已经滴满了浓稠的先列腺液，慢慢地向上滚向你的[hair]。塞拉芙修剪整齐的手握住它，抚摸着它，完全挡住了你的视线，而她的小穴继续阻挡着你的呼吸。你知道除了让她高潮之外别无选择，你在这种粗暴的束缚中挣扎着，自己也感到了兴奋。你张大嘴巴，将舌头伸进她的体内，品尝着她那甜美而又刺鼻的体液，感受着她通道内部奇特的质感。[pg]");
         outputText("塞拉芙呻吟着，[say: 噢噢，好棒的性玩具，快把主人的小穴吃干抹净！在屈服和芬芳的恶魔小穴中窒息的感觉如何？][pg]");
         outputText("她摇晃着臀部，在你身上摩擦，随着你开始喘不过气来，她的刺激感也随之增强。在疯狂的性需求和对氧气的渴望的交织下，你用舌头在她的体内疯狂地舔舐，微微倾斜头部，用鼻子摩擦她的阴蒂。你的努力得到了回报，恶魔的嘲弄变成了呻吟和喘息，如果你没有被滴着淫液的恶魔小穴闷住，你甚至会觉得这声音很可爱。[pg]");
         outputText("当你感觉到她将一股精液射在你的[hair]上时，你开始失去意识。虽然你已经神志不清，没有意识到这一点，但你的眼睛慢慢翻白，视线变黑。大量的恶魔体液充满了你的嘴，而塞拉芙则在骑着你的脸高潮。当你几乎要失去意识时，她终于从你身上爬了起来，撸动着她的肉棒，将几股浓稠的男性精液喷洒在你的胸膛和脖子上。你咳嗽着，吐出她的性液，努力恢复意识，感到无比的屈辱和难以言喻的兴奋。[pg]");
         if(get_player().totalCocks() > 0)
         {
            if(get_player().totalCocks() > 1)
            {
               outputText("你的每根");
            }
            else
            {
               outputText("你");
            }
            outputText("的 " + get_player().multiCockDescript() + " 都在抽搐，滴着先列腺液，处于高潮的边缘。");
         }
         if(get_player().hasVagina())
         {
            outputText("你的 " + get_player().vaginaDescript(0) + " 抽搐着，渴望被触摸或填满，你的臀部淫荡地扭动着，渴望着快感。");
         }
         outputText("这种变态的性欲让你充满了需求，但塞拉芙只是冷笑了一声，把脚踩在你的脸颊上，把你的脸按进充满性液的泥土里。她嘟囔着，[say: 看来你这次设法保住了一些脑细胞，荡妇。因为你太不听话了，所以你不能和我一起高潮。我想你可以躺在这里，渴望几个小时的性爱。][pg]");
         outputText("她的鞭子从你身上解开，但不知用了什么魔法，你无法分开四肢，也无法挣脱。塞拉芙窃笑着，用鞭子抽了一下你的屁股，然后漫不经心地走开了，留下你躺在那里，性挫败感越来越强。最终，你进入了半梦半醒的状态，梦见自己被支配，而恶魔的体液在你的脸上干涸。");
         dynStats(DynStat.Lust(200),DynStat.Cor(1));
         if(get_game().get_inCombat())
         {
            get_combat().cleanupAfterCombat();
         }
         else
         {
            doNext(get_camp().returnToCampUseOneHour);
         }
      }
      
      public function ceraphFirstTimeVolunteer() : void
      {
         clearOutput();
         spriteSelect(SpriteDb.get_s_ceraph());
         outputText("地精示意你弯下腰，你照做了。她把耳环举到你的耳朵上，对准位置。");
         if(get_player().earsPierced > 0)
         {
            outputText("奇迹般地，你旧的耳环直接掉了下来。");
         }
         outputText("耳环伴随着一声痛苦而清脆的*咔哒*声扣入到位，一阵强烈的眩晕感袭来，你差点摔倒。地精扶住了你，让你稳住身形，你眨了几下眼睛，适应了这种感觉。[pg]");
         outputText("当你感觉恢复平稳时，你抬起头，看到那个小地精已经变成了一个赤裸的、雌雄同体的恶魔！她心照不宣地笑着，抚摸着你的身体。你后退了一步，她说道，[say: 哎呀，别这么惊讶嘛，亲爱的。你刚刚迈出了成为我宠物的第一步！我是塞拉芙，我们以后会变得非常熟悉的。][pg]");
         outputText("她的主动让你脸红，也在你的下体点燃了一把火。不知为何，在她的面前赤身裸体的想法，比它应有的程度要诱人得多。你一直试图打消这个念头，但你满脑子想的都是你的裸体，以及它让你变得多么饥渴。[pg]");
         outputText("塞拉芙轻笑着打断了你的遐想，[say: 哦，宝贝，我看你已经开始明白了。让我给你解释一下。<b>那些耳环给了你暴露癖。</b>被暴露和羞辱会让你比发情的狗还要饥渴，即使你找到了摘下它们的方法，也太迟了——它们已经永远地将裸露和羞辱与你那简单小脑袋里的欲望和色欲联系在了一起。习惯吧，我会回来给你介绍另一个有趣的小性癖的。][pg]");
         outputText("这个放荡的恶魔扭动着性感的腰肢走开了，你对自己的处境感到既困惑又兴奋，以至于没有去追她。看来以后只要你在公共场合暴露，就得多忍受一点额外的兴奋了。[pg]");
         get_player().earsPierced = 1;
         get_player().earsPShort = "绿宝石耳钉";
         giveFetish();
         doNext(get_camp().returnToCampUseOneHour);
      }
      
      public function ceraphFirstTimeRepeat() : void
      {
         clearOutput();
         spriteSelect(SpriteDb.get_s_ceraph());
         outputText("塞拉芙从灌木丛中漫步而出，给了你一个不赞同的眼神，[say: 我试过好言相劝了。现在我们只能来硬的了。][pg]");
         outputText("她解开一条燃起火焰的鞭子，说道：[say: 该打屁股了！][pg]");
         startCombat(new Ceraph());
      }
      
      public function ceraphFirstTimeDecline() : void
      {
         clearOutput();
         spriteSelect(SpriteDb.get_s_ceraph());
         outputText("你拒绝了，告诉这个娇小的女孩你对她的耳环不感兴趣。她耸耸肩笑了，她的身形扭曲着变高，皮肤变浅，乳房隆起，额头的皮肤上长出了一对可爱的角。她把耳环放进口袋，伸了个懒腰，露出一个闪闪发光的恶魔小穴，在原本应该是阴蒂的地方长着一根大小适中的阴茎。[pg]");
         outputText("恶魔自我介绍道，[say: 好吧，如果你想来硬的，我没意见。反抗得越激烈的，最后都会变成最顺从的奴隶。记住，这是你作为公共汽车塞拉芙的奴隶[boy]生活的开始。][pg]");
         outputText("塞拉芙摆出一个诱惑的姿势，捏了捏她的乳头，显然她更想让你发情，而不是在肉体上伤害你。");
         startCombat(new Ceraph());
      }
      
      public function ceraphFirstTime() : void
      {
         clearOutput();
         spriteSelect(SpriteDb.get_s_ceraphGoblin());
         outputText("一个可爱的地精从灌木丛中走出来，举起一对绿色的耳环对着光。她礼貌地问，[say: 嘿，小可爱！我前几天做了一些多余的耳环。我想知道你想要吗？如你所见，我的耳朵已经戴满了，而我的女儿们都是一群忘恩负义的婊子。][pg]");
         outputText("地精的耳朵上戴满了各种各样令人眼花缭乱的穿孔。她的穿着远没有你见过的多数地精那么放荡。[pg]");
         outputText("你要让她把耳环戴在你的耳朵上吗？");
         FlagDict_Impl_.arrayWriteInt(KFLAGS.flags,24,1);
         doYesNo(ceraphFirstTimeVolunteer,ceraphFirstTimeDecline);
      }
      
      public function ceraphBodyPartDreams() : void
      {
         var _loc5_:* = null as Player;
         spriteSelect(SpriteDb.get_s_ceraph());
         var _loc1_:Array = [];
         var _loc2_:Number = 0;
         var _loc3_:Number = 0;
         var _loc4_:int = FlagDict_Impl_.arrayReadInt(KFLAGS.flags,218);
         while(_loc4_ > 0)
         {
            _loc4_--;
            _loc1_[int(_loc1_.length)] = 1;
         }
         _loc4_ = FlagDict_Impl_.arrayReadInt(KFLAGS.flags,219);
         while(_loc4_ > 0)
         {
            _loc4_--;
            _loc1_[int(_loc1_.length)] = 2;
         }
         _loc4_ = FlagDict_Impl_.arrayReadInt(KFLAGS.flags,220);
         while(_loc4_ > 0)
         {
            _loc4_--;
            _loc1_[int(_loc1_.length)] = 3;
         }
         _loc2_ = int(_loc1_[Utils.rand(int(_loc1_.length))]);
         outputText("[pg]<b>你睡觉时发生了一些奇怪的事情……</b>[pg]");
         if(_loc2_ == 2)
         {
            _loc3_ = Utils.rand(4);
            if(_loc3_ == 0)
            {
               outputText("在梦中，你能感觉到下体有一种奇怪的感觉，随着那种温暖、滑溜的感觉增强，你认出了那是什么——精液滴入你的小穴。");
               if(!get_player().hasVagina())
               {
                  outputText("你已经没有阴道了，不是吗？");
               }
               else
               {
                  outputText("不，那感觉不对——那不是你的阴道。");
               }
               outputText("那一定是塞拉芙从你那里偷走的性器官！你感到紧绷……不知怎么的被封闭了，但不断有体液滴入你被囚禁的下体，慢慢唤起了你自己的性欲。[pg]");
               outputText("合唱般的呻吟声伴随着不断累积、达到顶峰的快感，性爱黏液流入你张开的小穴的潮起潮落也在增加。你在睡梦中呻吟，感觉湿润，淫秽地湿润，因为你被用作某场大型群交的精液排放口。来自塞拉芙几十只宠物的精液流进你体内，用温暖、充满阳刚之气的黏液和滑溜的小穴分泌物填满了你。无助且被囚禁的你，除了因欲望而喘息之外什么也做不了，直到你的子宫完全塞满了精液，你那大张的逼里也溢满了精水。[pg]");
               outputText("你是个没用的精液垃圾桶，只能吸食塞拉芙那些更受宠的宠物留下的残羹剩饭，但这却让你欲火焚身。你在睡梦中喘息，无可救药地发情，却被逐渐消退的梦境剥夺了释放的机会。");
               dynStats(DynStat.Sens(4),DynStat.Lust(200));
            }
            else if(_loc3_ == 1)
            {
               outputText("一股持续的吸力拉扯着你的下唇，使它们充血肿胀。你扭动着身体，来回摆动臀部试图逃避这股拉力，甚至你的阴蒂也开始从包皮中探出头来。");
               if(!get_player().hasVagina())
               {
                  outputText("等等……你已经没有阴蒂了……塞拉芙把它夺走了。");
               }
               else
               {
                  outputText("等等……那不是你的[clit]……那是塞拉芙从你身上夺走的那个。");
               }
               outputText("一想到那个折磨你的恶魔，这种感觉就变得更加强烈，让你感觉到在你旧阴道顶部周围有一个光滑的圆形腔室。你眨了眨涂满睫毛膏的长眼睛，看到塞拉芙正在抽插她戴在你阴蒂上的装置，不断增加吸力。[pg]");
               outputText("她的宠物嘴里发出愉悦的喵喵声，而你则在打鼾时发出微弱的快感回音。虽然你的思绪感觉有些不协调，但胯部传来的抽插快感让你越来越认同这个幸福的性玩具的想法。塞拉芙挤压着连接在装置上的一个黑色气囊。它呼哧呼哧地喷出空气，随着你主人的手有节奏地收缩，越来越用力地吸吮着你肿胀的阴蒂。她问道，[say: 你的小豆豆够大吗？我们每隔几个晚上就会这样做一次，直到你的小爱豆又大又硬，足以操我甜美的阴户。之后我们可以再给它打气。我想知道我们能不能把它弄得大到让后宫里的男孩们嫉妒？那不是很好吗？][pg]");
               outputText("你（和她的宠物？）用力地点头，臀部抽动着，而你的女性私处则因为充血过多而肿胀。塞拉芙嘲笑你，但你可以看到，一看到你肿胀的女性私处，她肿胀的阴茎就变得有多硬。作为一个永远顺从的宠物，你用脚向下伸去抚摸你主人的肉棒，用她的玩具取悦你的方式来取悦她。恶魔女大笑道，[say: 你真是个急不可耐的婊子。很好，无论如何，我们需要让你的阴蒂像这样充血一段时间，以便药物发挥作用。用你的脚取悦我，也许我会让你用那个新阴户为我生一窝小恶魔。][pg]");
               outputText("在主人赞美的鼓舞下，你的脚趾弓起，环绕着塞拉芙充满欲望的长枪，上下套弄，而她柔软的结节则滑过你的脚底。她滚烫的先列腺液漏得你满脚都是，用她欲望的热度弄脏了它们，而你则不知羞耻地将恶魔的残留物涂抹在她的肉棒上。在吸乳器内，你湿漉漉的阴唇令人愉悦地相互摩擦，随着沾满精液的脚在恶魔阴茎上的每一次滑动而颤动。在下半身感觉的帮助下，你加快了速度，给了塞拉芙一次极其强烈的足交。[pg]");
               outputText("恶魔女王抓住你的脚踝，狠狠地操着你的脚，让你沉浸在快感中，就像你的阴户沉浸在汁液中一样。由于药物和不断的吸吮，你的外阴变得巨大而圆润，填满了透明的吸乳器，紧贴着腔壁。从它们之间探出的阴蒂看起来像个怪物，巨大且青筋暴起。它看起来更像是一根巨大、肿胀的狗阴茎，而不是人类的东西，但每次你的臀部摇晃并让它撞击管壁时，你都几乎要高潮了。[pg]");
               outputText("突如其来的温暖覆盖了你的双脚和脚踝，塞拉芙那非人般温暖的精液浸透了它们。她叹了口气，放松了对你脚踝的抓握，而你则继续抽插，尽职尽责地将每一滴恶魔汁液挤到你心甘情愿的脚底。[say: 好宠物……是的，好女孩，]这位依然沉浸在幸福中的施虐狂咕哝着，然后她突然毫无预兆地将吸乳器从你的腹股沟拔出。你可怜的阴户在痛苦和快感中颤动，高潮强烈到喷得你那阴茎般大小的阴蒂上到处都是。谢天谢地，你生殖器的肿胀立即消退了，让它们变得更大，但不再那么畸形。塞拉芙将她依然坚挺的阴茎压在你的嘴唇上，但随着她的动作，精神联系开始减弱，让你回到了正常的梦境中……");
               get_player().orgasm("Vaginal");
               dynStats(DynStat.Sens(-3));
            }
            else if(_loc3_ == 2)
            {
               outputText("阴道口突然传来的戳刺感几乎把你从睡梦中唤醒。");
               if(!get_player().hasVagina())
               {
                  outputText("等等……你已经没有阴户了。");
               }
               else
               {
                  outputText("等等……你的阴户感觉不是那样的！");
               }
               outputText("你一定是感受到了塞拉芙从你身上夺走的那个阴户的感觉！温暖的恶魔精液在你的入口处冒泡，用恶魔的污秽润滑着充血的外阴。你被它的热度弄得神魂颠倒，而恶魔女没有浪费时间，迅速将她的整个长度插入。[pg]");
               outputText("她身上布满的结节压迫着你的阴道壁，抚摸着你那久违的下体最深处的褶皱。不知怎么的，你看到了这一幕——塞拉芙躺在床上，手里抓着你的阴户肉，就像一个变态的性玩具。她开始在自己身上抽插它，把你身体的一部分当作一个简单的自慰工具。房间里空无一人，她毫不迟疑地发出了愉悦的声音，[say: 哦，操，你的阴户真不错，[name]。以莉希丝那淫荡的奶子起誓，我希望你能感觉到你的小穴在吞噬恶魔阴茎时有多爽。下次我们见面时，你应该……啊……啊……哦，嗯……屈服于……啊，啊！][pg]");
               outputText("在塞拉芙说话的过程中，她不断加快速度，像手提钻一样在你的阴户上上下抽插她那肿胀的阴茎。结节开始变大，在她的根部周围膨胀，然后像波浪一样向慢慢变粗的头部荡漾。一股滚烫的精液射入你的深处，用恶魔女那堕落的乳霜润滑着它们，但这感觉太好了……太好了。你的阴户紧紧夹住入侵者，将肿胀的结节印在它柔软的内壁上，你高潮得就像你自己骑在她身上一样。[pg]");
               outputText("幻象和感觉慢慢消退，让你从它们的掌控中解脱出来，只留下塞拉芙用舌头清理你的微弱残影。");
               get_player().orgasm("Vaginal");
               dynStats(DynStat.Sens(2),DynStat.Cor(1));
            }
            else
            {
               outputText("嗯嗯嗯，有什么东西填满了你，刚刚好——啊……对。你在毯子里换了个姿势，但这似乎并没有移动卡在你小穴里的那种持续的坚硬感。天哪，被填得这么满感觉真好。这就像同时有三四根硬邦邦的肉棒插在你体内，让你保持扩张和敞开，阴户的蜜汁滴向地板。它们唯一移动的时候，就是当一阵收缩的波浪穿过你的女性肉体，挤压着入侵者时。你慵懒地加快了肌肉的运动，想要感受更大的快感。你暗自希望不管那是什么，都能操你。");
               outputText("[pg]没有任何预兆，众多坚硬的入侵者动了起来，其中一根滑了出来。你那可怜的、被撑开的阴道肉慢慢地收紧，包裹住剩下的部分，但它不再像刚才那样紧致或令人愉悦。在被窝里，你的[hips]鼓励地来回摇摆，但这无济于事。另一根肉棒从你的阴道拥抱中消失，引发了阵阵快感的火花，随后是隐隐作痛的空虚。你是如此空虚，以至于你的嘴唇甚至无法闭合以包裹住剩下的粗大肉棒。它们只是张开着，触目惊心地张得更大，仿佛在乞求更多。");
               outputText("[pg]又一根粗大的肉棒被抽出了。只剩下一根了，你能感觉到它向下倾斜，由于重力和你自己的性兴奋，几乎要滑出来了。你可怜的阴户张得如此之大，以至于你能感觉到冷空气在它那洞穴般的深处循环，让你不寒而栗，当入侵者被带走时，你的嘴唇发出了一声痛苦的呻吟。你是彻底地、完全地、令人心碎地空虚。你在睡梦中呜咽和抽泣，但解脱却迟迟不来。");
               outputText("[pg][say: 哦，[name]，你的小穴真是个放我玩具的好地方。不过，它变得好湿。我得找点乐子，]一个看不见的女性声音沉思着，[say: 我很高兴我之前玩了一些gro+……]");
               outputText("[pg]天哪，她真他妈的大！你能感觉到那巨大的龟头滑了进来，把你那饱受蹂躏的入口撑得更大了。坚硬的小凸起在滑过时摩擦着你的外阴，它们在缓慢推进的肉棒系带后面排成一圈。随着它滑得更深，更多奇妙的小结节在整个茎干上显现出来，尽管它们不像顶部那一圈那样排列对称。这根肉棒插在你体内……就像有成百上千个微小的指尖在你的体内探测，而这根肉棒正慢慢地塞满你滚烫湿润的小穴。");
               outputText("[pg]不管那是什么，那根神奇的肉棒都很适合你，一旦它开始像活塞一样进进出出，用力、快速、漫不经心地操你，你就会开始呻吟。它毫不在乎你的感受地操你甚至都不重要了——那些完美的小肉棒凸起击中了你体内的每一个敏感点。你在床上辗转反侧，气喘吁吁，夜间的性高潮就在眼前。那个神秘的工具像手提钻一样在你的洞里钻着，操得越来越快，随着肉棒接近高潮，那些凸起也变得越来越大。");
               outputText("[pg]一个沾满淫液的胯部拍打在你的嘴唇上，温暖的爆炸开始在你深处引爆，液体热量的绽放给你带来了一场史诗般的小穴紧缩高潮。你的肌肉锁紧，你的[butt]从你休息的地方抬起，脸颊在紧绷的快感中紧握。当你高潮时，一声幸福的尖叫划破夜空。精液从你的入口处起泡，因为你被填满了，溢出来滚落到地上。感觉太好了，真他妈的好。你的哀号慢慢变成了呜咽，享受的余震导致你的身体在毯子下疯狂抽搐，直到那根喷射乳霜的肉棒最终从你那沾满精液的洞穴中拔出。");
               outputText("[pg][say: 我想我应该感谢[name]给了我这么好的一个性玩具，]那个神秘却又熟悉的声音评论道。等等……塞拉芙！");
               outputText("[pg]你猛地惊醒，大汗淋漓，浑身发抖。在某个地方，那个恶魔刚刚在你以前的小穴里射了一发。如果那次高潮不是那么他妈的令人满足，这个想法会让你彻夜难眠。");
               get_player().orgasm("Vaginal");
               dynStats(DynStat.Sens(2),DynStat.Cor(1));
            }
         }
         else if(_loc2_ == 3)
         {
            _loc3_ = Utils.rand(3);
            if(_loc3_ == 0)
            {
               outputText("你感觉到你的乳房在光滑的洞穴地板上拖拽……十几对按大小排列，从你尾巴尖上微薄的A罩杯开始，一直到你腰部下方不远处的DD罩杯。排列整齐的乳房在你的大腿上肿胀，在你的臀部达到了F罩杯。还有三排巨大的乳房挂在你的躯干上，它们淫秽的重量压迫着你可怜的背部。你想抓住它们，但你没有手臂，每一个动作都是一种痛苦的快感，拖拽着你下方的乳头、乳穴和奶头。汁液毫无阻碍地从你的泄殖腔流出，你那可怜的、被忽视的小穴无法应对这种色情的感觉。");
               outputText("[pg]在恐慌中，你扭动着你的乳房尾巴，在狭小房间的范围内推动自己。门像往常一样锁着，但你还是把你紧绷、坚硬的乳头压在上面。女主人把你关了这么久，困在这个小盒子里。你后悔一切！你再也不会怀疑她了！她是对的……乳头能感觉到如此美妙、精致的快感，但你再也受不了了。每一个动作，每一次蜿蜒的滑动，感觉都那么好。你只要走来走去就能高潮，但你知道你最终只会变成一团扭曲、卷曲的蠕动乳房肉，你的尾巴在试图把每一对乳房互相摩擦时打结了一半。你知道，因为你已经做过无数次了。");
               outputText("[pg]一阵痛苦的螺旋穿过你因快感而受伤的心理，你记起了自己，而不是那个被恶魔奴役的娜迦。尽管如此，由于你们的思想是相连的，你能够认出那些众多乳房中的一个曾经是你的。塞拉芙很好地利用了它。这个认识让你惊醒，你被迫带着你的乳房正在某处被用来打破一个娜迦的知识去睡觉。睡眠不容易恢复。");
               dynStats(DynStat.Lust(5 + get_player().lib / 5));
               get_player().orgasm("Tits",false);
            }
            else if(_loc3_ == 1)
            {
               outputText("你梦见了你的乳房。不是你现在的[chest]，而是塞拉芙拿走它们之前的那些。你什么也看不见。你什么也听不见。有什么东西在吸吮你的乳头——缓慢地、不断地拉扯。每一次拉扯，都会有温暖的湿润从你乳白色的乳房中流出。有一种微妙的解脱感混合着色情的快感，随着吸吮动作的重复，你逐渐意识到它是机械的。有什么东西在挤你的奶！它从不停止或减慢。挤奶只是在继续。");
               outputText("[pg]突然，不知从哪里，你在寂静中听到了一个声音，[say: 好吧，我怎么感谢[name]这些都不为过。这里不缺牛奶！]然后，有了光亮。光线的出现揭示了一个奇怪的、没有实体的景象，一个恶魔站在一个水箱旁边。是塞拉芙！她端着一杯咖啡，当她拉动控制杆时，奶油般的母乳流入摩卡色的饮料中，使其颜色明显变浅。你的乳房连接在某种奇怪的机器上，当透明的电缆将液体输入其中时，它们颤抖着、摇晃着。挤奶的速度加快了，几秒钟内就有几加仑的液体从你娇嫩的乳头中喷涌而出。液体流动的速度越来越快，简直就是乳酸奶油的瀑布。");
               outputText("[pg]随着挤奶速度越来越快，色情的能量在你的乳头中嘶嘶作响，快感难以忍受。可悲的是，就在你感觉处于高潮边缘时，机器关闭了，幻象也消失了。今晚你不会得到任何解脱。");
               dynStats(DynStat.Lust(5 + get_player().lib / 5));
               get_player().orgasm("Tits",false);
            }
            else
            {
               outputText("你看到塞拉芙，那个阴险的双性魅魔，站在一个朦胧的粉红色虚空中，穿着一件小巧的紫色比基尼。她微笑着，手里拿着一个肉质的球体。它看起来很柔软，摇摇晃晃……而且令人不安地熟悉。当你看到一个圆形的乳晕时，你意识到恶魔正拿着你以前的一个乳房！她沉思地把那个丰满的乳房抛了一会儿，然后把它举到嘴边……吹气？");
               outputText("[pg]当这个女诱惑者向乳头吹气时，乳房令人惊讶地、不可思议地开始像气球一样膨胀。她最终停下来，检查她超现实的杰作，你以前的乳房现在有沙滩排球那么大。当她把它拍到空中，它开始懒洋洋地飘回她的手中时，你意识到它的密度也和沙滩排球一样。");
               outputText("[pg]塞拉芙尖锐地吹了声口哨，两个肌肉发达的男魅魔从雾中走了出来；每个人都戴着一条黑曜石项圈和一条鼓鼓囊囊的丁字裤，尽管其中一个还戴着一副时尚的");
               if(get_silly())
               {
                  outputText("粉红火烈鸟");
               }
               outputText("太阳镜。当你凝视着这不自然的场景时，恶魔将你那超大的乳房抛向空中，并把它拍向其中一个男魅魔，他们很快就组织了一场沙滩排球比赛。在提示下，空灵的地面被闪闪发光的粉红色沙子所取代，紫色的海浪拍打着海岸。在远处，你听到了海鸥的声音，尽管声音有些扭曲。");
               outputText("[pg]当恶魔三人组继续他们的游戏，塞拉芙独自对抗男魅魔双打队伍时，你注意到，不，你<i>感觉</i>到你的乳头有反应并变硬，很快就勃起了。塞拉芙也注意到了，她咧嘴一笑，在你敏感的凸起上重重地拍了一下。她充满欲望的触摸引起的突然的激情爆发导致你的乳头抽搐，并在它在空中航行时释放出一道弧形的乳汁。那个时尚的男魅魔用同样有力的一击回击了她的投掷，从你现在疼痛的乳房中挤出了更多的奶油，白色的液体在梦境的粉红色和紫色阴霾中显得格外耀眼。");
               outputText("[pg]游戏继续进行，一次又一次的投掷，一道又一道珍珠白色的水流。你注意到牛奶不仅仅是浸入沙子中，而是被吸入两组之间整齐的纵横交错的网格中。随着网格随着母乳继续生长，两根巨大的跳动的");
               if(get_silly())
               {
                  outputText("马鸡巴");
               }
               else
               {
                  outputText("恶魔的肉棒");
               }
               outputText("从沙地中升起，变成了扭曲排球网的临时支柱。");
               outputText("[pg]尽管男魅魔在数量上占优，但塞拉芙却轻松地将他们打得落花流水，逼得他们不得不跳跃和俯冲来接球。那个戴着墨镜的男魅魔现在已经气喘吁吁，他愤怒地一把抓住你飞来的乳房，咬住你的乳晕，贪婪地吮吸起来。快感如潮水般涌来，他那技巧娴熟的舌头以专业的动作挑逗着你漏奶的乳头，而乳头则以一股浓稠的清爽乳汁作为回报。当他大口吞咽着这奶油般的美味时，你注意到你的乳房并没有缩小，但那个男魅魔却明显膨胀了；他的二头肌隆起，胸肌威风凛凛地凸出，他的体型变得像最强壮的肌肉猛男一样，简直是一座肌肉山。当他把颤抖的乳房从唇边移开时，他那肌肉虬结、充满力量的身体，冷酷地擦去了嘴边的奶渍。另一个男魅魔看起来有些沮丧。");
               outputText("[pg]那个庞大的恶魔随意地将你的乳房高高抛向空中，然后自己也跟着跳了起来，使出全力一记扣杀，将那个倒霉的球体径直打向塞拉芙惊愕的脸庞。撞击力惊人，毫无防备的双性魅魔被撞得向后倒去，同时一股巨大的乳汁从你的乳头喷涌而出，浸透了她那穿着比基尼的四仰八叉的身体。");
               outputText("[pg]伴随着塞拉芙的呻吟，男魅魔们互相击掌庆祝，而你那趴着的乳房则慢慢地将乳汁滴入沙中，梦境渐渐褪去，你醒了过来。你茫然地盯着前方看了一会儿，试图拼凑出刚才发生的事情");
               if(get_silly())
               {
                  outputText("以及它对你的心理健康可能产生的影响");
               }
               outputText("，直到你将其归咎于腐化并翻了个身，进入了平静无梦的睡眠。");
               dynStats(DynStat.Lust(5 + get_player().lib / 5));
               get_player().orgasm("Tits",false);
            }
         }
         else
         {
            _loc3_ = Utils.rand(10);
            if(_loc3_ <= 2)
            {
               outputText("滴落的、滚烫的疼痛感几乎将你从睡梦中惊醒。一开始只有几滴，溅在你给恶魔的那根肉棒表面，但你却不幸地感受到了。塞拉芙一定是在惩罚那根阴茎的主人，因为一些想象出来的怠慢！滴答，滴答，滴答……折磨一直持续到最先滴落的液体变硬，将你那被遗忘的阴茎大部分包裹在一个坚硬的蜡壳中。就在你以为恶魔已经结束的时候，她那长而尖的指甲在轻微烧伤的皮肤上划过，剥去了蜡壳。这几乎痛得让你哭出来，但不知为何，它同时又让你感到兴奋。[pg]");
               outputText("这个过程又重复了两次，每一次都比上一次更痛苦、更让人兴奋。就在你快要被逼醒的时候，一种清凉的药膏被涂抹在那个极其敏感的器官上，用令人幸福的清凉掩盖了疼痛。塞拉芙的指甲在新的物质中挑逗着，让你处于崩溃的边缘。虽然你已经准备好迎接爆炸性的高潮，但它却始终没有到来。那是你幻影肉棒那晚感觉到的最后一件事，你陷入了平静但充满欲望的沉睡。");
               dynStats(DynStat.Sens(-3),DynStat.Lust(200));
            }
            else if(_loc3_ < 5)
            {
               outputText("起初，一只温暖的手抚摸你疲软肉棒的感觉，只是你梦境深处一阵微弱而愉悦的嗡嗡声，但随着你膨胀的男子气概变硬，它来到了最前沿，主导了你的梦境。你可以看到塞拉芙，感觉到她抚摸着你被紧紧绑住的肉棒，直到它漏出的先列腺液沾满了她的手，并在她紧绷的皮鞭束缚下跳动。一个声音呻吟着，[say:主人……这是折磨……你答应过我可以射在里面的……][pg]");
               outputText("听到这话，塞拉芙收紧了皮鞭对你幻影生殖器的束缚。在你的脑海深处，你非常清楚这不是梦——你正在接收你牺牲掉的阴茎传来的感觉回声。她似乎也对自己很满意，抚摸着那根超级坚硬的肉棒，直到它在皮鞭的皮革拥抱下凸起，充血到了绝对的极限。你（她的宠物？）咕哝着哭泣，虚弱地试图挺动臀部以获得更多的摩擦，但由于你被绑在束缚床上，你无法获得任何借力点。[pg]");
               outputText("恶魔女大笑着，用她的尾巴拍打着你的脸说，[say:如果我的特别男孩想要他的奖励，他就会乖乖地躺着，直到主人准备好让他射精。]你回答说，[say:是的，主人，]用一个不属于你自己的声音，但你肉棒持续的坚硬让你保持在这一刻。被摇曳的施虐狂的身体所迷住，你完全静止地躺着，祈祷你那美丽的施虐狂向你展示承诺的奖励。[pg]");
               outputText("塞拉芙再次拍打你的脸，指示道，[say:躺好，宠物。如果你敢动一下肌肉，我就打你的蛋蛋，直到它们变红，然后用手把精液挤出来。你明白吗？]你用可怜但肯定的呜咽声表达了你的同意。施虐狂看着你，寻找着反抗的迹象，但她什么也没找到——你完全彻底地屈服于你那美丽的、双性人操逼女王。她点点头，爬上桌子，左右摇摆着臀部，进行着一场性感的表演。[pg]");
               outputText("你幸福地叹了口气，看着你那比例完美的 mistress 为你表演，而你的眼睛从未离开过她那柔软、雕塑般的身躯。塞拉芙手脚并用地趴下，她的小穴就在你肿胀的肉棒上方几英寸处。她那地狱般女性气质的热度，用湿润、充满欲望的空气沐浴着跳动的阴茎，虽然你认为这不可能，但你感觉到自己变得更硬了……硬得发痛。你的施虐狂上下弹跳、摩擦，让她的外阴时不时地亲吻你的龟头，而她那催眠般抖动的屁股则尽其所能地让你着迷。[pg]");
               outputText("那个肿胀、湿润的入口弹跳得更低了，但在你滑入之前，恶魔女拱起背，将她那眨眼的屁眼推向你的龟头，伴随着一声黏糊糊的吸溜声将其吞没。那种压倒性的紧致感对你那过度充血的肉棒来说既是痛苦也是狂喜，但这并没有阻止你像个婊子一样呻吟，[say:主……主人……不……不要那里……太紧了！你答应过我可以射在里面的……][pg]");
               outputText("恶魔尾巴那扁平的铲子拍打在你的脸颊上。[say:我说过你可以射在里面。我从来没说过你可以用哪个洞。现在我要你像个妓女一样呻吟，如果你做得够好，你就能赢得舔我的乐趣。]即使在这种情况下也很顺从，你像个放荡的妓女一样呻吟，哭喊着让塞拉芙用她那堕落的屁眼强暴你的肉棒——把你变成她顺从的、对肛交上瘾的玩具。她满足了你的要求，在你身上弹跳，几乎要在她那黑暗的隧道里压碎你的肉棒，但那天堂般、令人痛苦的紧致感除了让你无条件地将种子投降到它的深处之外，什么也不接受。[pg]");
               outputText("你努力保持静止，抵抗着身体的冲动，以便被允许享受用舌头清理主人身上精液的乐趣，虽然你在呻吟时不得不咬住嘴唇，但你成功了。在一阵倾盆大雨般的爆发中，你的肉棒感觉像是爆炸了，用它那高潮充血的纯粹力量解开了缠绕在它周围的皮鞭。一股精液喷射进你的主人体内，让她高兴地咕咕叫。[pg]");
               outputText("[say:好宠物。是的，你是我乖巧、特别的男孩，不是吗？为我呻吟吧，宠物。像你这样心甘情愿的妓女一样为你的主人呻吟。这样好多了……嗯……我告诉你。既然你这么出色地把你所有的精液都塞进了我体内，我会在你清理干净后让你再次把它塞满。如果你还是我乖巧的小妓女，我也会让你把它舔干净！][pg]");
               outputText("哦，天哪，她太完美了。你完全屈服了，将你下半身的每一盎司都清空到她那完美的紫色屁股里。完全筋疲力尽后，你的肉棒微弱地抽搐了几下，开始变软。塞拉芙微笑着站起身，精液从她那张开的屁眼里滴落，她顺着你的胸膛滑了上去。梦境在你看到更多之前就褪去了，随着你以前阴茎那枯萎的力量一起消散了。[pg]");
               outputText("随着感觉和场景的消退，你混乱的梦境在恢复更正常的流动之前发生了转变。毫无疑问，你明天早上会感到满足，但塞拉芙的宠物在你脑海中挥之不去的回声，希望你去向她屈服。");
               get_player().orgasm("Dick");
               dynStats(DynStat.Cor(1));
            }
            else if(_loc3_ < 7)
            {
               outputText("整整一夜，你都被羽毛在肿胀的阴茎上滑动的触感撩拨着，那柔软、均匀的抚摸不断刺激着你那坚挺的肉棒。速度始终没有加快，你被困在一种持续不断的感觉地狱中。这种感觉一直持续着，你肿胀的睾丸变得酸痛无比。你睁开眼睛，发现自己身处一个地牢里——塞拉芙的地牢——一个长着羽毛的鹰身女妖女孩就在几英寸外。她正缓慢地上下蹲伏，用柔软的尾羽在你的腹股沟上滑动，以此来挑逗你。[pg]");
               outputText("她的嘴里塞满了塞拉芙的肉棒，精液从她的嘴角溢出，而她的口红则将恶魔的阴茎染成了金色。这位恶魔女王正喘着粗气，因为体内充满了鹰身女妖的药物而脸颊绯红，但她丝毫没有减慢速度的迹象。[say:继续吸，你这大腿粗壮的火鸡。你要吞下我的精液，直到你的口红褪色，或者你的肚子撑得动不了为止。我们看看哪个先发生！还有，你敢停止挑逗你身后的那根肉棒试试！保持均匀的抚摸。一旦我们摧毁了[his]脆弱的小心灵，我有一个新的人格想赋予[him]。][pg]");
               outputText("场景渐渐淡去，但那种在你幻影般的阴茎上令人发狂的、羽毛般的炼狱感却从未消失。你一直保持着勃起，处于高潮的边缘，整整……一整夜……");
               dynStats(DynStat.Sens(3),DynStat.Lust(100,DynStatOp.Eq));
               _loc5_ = get_player();
               _loc5_.set_hoursSinceCum(_loc5_.get_hoursSinceCum() + 30);
            }
            else
            {
               outputText("你的阴茎感觉太爽了。简直爽翻了。就像两具紧绷、出汗的身体从两侧摩擦着它，滚烫湿润的裂口在龟头上涂抹。睁开眼睛，最奇怪的景象映入眼帘——两个涂满精油的魅魔，她们的手臂互相缠绕，胸贴着胸。这对恶魔双人组正忙着在糟糕的处境中寻找乐子，在彼此的嘴里呻吟，并无情地将她们扭动的身体压在对方肿胀的性感带上。四条腿缠绕在你的腰间，另一侧被乳胶或其他什么东西绑住，将你的阴茎牢牢地困在它该在的地方——两个光滑的恶魔蜜壶之间。");
               outputText("[pg]当其中一个达到高潮时，喷涌而出的女汁浸透了你的睾丸，她的体液在狂野、愉悦的释放中喷洒。当她剧烈扭动时，刺穿她坚硬阴蒂的饰钉撞击着你的龟头，你发现自己拼命地希望不要被她们的腿束缚得这么紧。要是你能好好地抽插，这些堕落的荡妇就会被你的精液浸透！相反，你所能做的最好的事情就是左右扭动一下，但这只会让塞拉芙赐予你的礼物变得更加坚硬。诅咒她从谁那里弄来这根阴茎！地狱般愉悦的感觉无情地累积，而你却无法释放。");
               outputText("[pg]你低头看着，欣赏着你那美妙的乳房的隆起。毕竟，这就是主人最初追求你的原因。你挺拔的乳头凸显出来，坚硬而骄傲，上面挂着镶嵌着宝石的粗大圆环。塞拉芙给你的第二排乳房也以同样的方式穿孔，尽管除了穿孔上闪闪发光的金属外，你什么也看不见。叹了口气，你把注意力转回那对紫色的双胞胎身上，她们扭动的身体在享受着这种被奇怪束缚的性爱，仿佛她们很享受在这种受限的情况下达到高潮的挑战。真是一群婊子。");
               outputText("[pg]啪！塞拉芙的手拍打着你挺翘的臀部，这刺痛提醒着你这里到底谁说了算。你伸长脖子看着你的主人，扭动着躯干，让她能清楚地看到你那众多的侧乳。也许如果你给她一些视觉上的享受，她会认为你值得被狠狠地操一顿。被主人选中做爱是如此罕见，但当被选中时，又是如此美妙。你回想起上一次，塞拉芙用她的魔法让你身上的每一个穿孔都在你身上轻轻震动，你不禁打了个寒颤。");
               outputText("[pg][say:玩得开心吗，宠物们？]主人问道。");
               outputText("[pg]恶魔们回答道，[say:是的，女神，谢谢你给我们这根又粗又硬的肉棒来挑逗！]声音里充满了喜悦。");
               outputText("[pg]一群骚货。");
               outputText("[pg]她们的身体在你身上扭动得更快了，塞拉芙在你耳边低语，[say:你也想高潮吗？……想把我给你的那根又硬又粗的肉棒，射在那些涂满精油的女性肉体上吗？]");
               outputText("[pg]你只能做你唯一能做的事。你点点头，呜咽着说，[say:是的，主人，是的，求你了，我一直对你这么好。]");
               outputText("[pg]塞拉芙捏着你的乳头，高兴地咕哝着。[say:好宠物。你可以高潮……明天。现在，保持又硬又挺。你才被边缘化了六天；再多一天也没什么大不了的，对吧？]");
               outputText("[pg]不！除了那个什么都行！你开始乞求，但一个口塞塞满了你的嘴。它尝起来很甜，像草莓和奶油，而夹在魅魔紧绷身体之间的那根滴着水的肉棒开始滴下更多的液体。她在这个口塞上放了什么？没办法问——塞拉芙的高跟鞋咔哒咔哒响了几声，她走开了，而下面那两个堕落的荡妇正忙着摩擦你的阴茎和亲热，没空回答你。一声幸福的呻吟穿过你的口塞，释放出更多美味的、让阴茎变粗的好东西。你的折磨者也听到了，她们放慢了旋转的速度，以确保你不会这么快高潮。毕竟，她们还可以再虐待你一天……");
               outputText("[pg]你醒来时心跳加速。那很火辣，但也很痛苦。现在很难再入睡了。");
               dynStats(DynStat.Lust(5 + get_player().lib / 5),DynStat.Cor(0.5));
               _loc5_ = get_player();
               _loc5_.set_hoursSinceCum(_loc5_.get_hoursSinceCum() + 100);
            }
         }
         doNext(playerMenu);
      }
      
      public function buttRapeCeraph() : void
      {
         var _loc1_:IMap = KFLAGS.flags;
         FlagDict_Impl_.arrayWriteInt(_loc1_,291,FlagDict_Impl_.arrayReadInt(_loc1_,291) + 1);
         spriteSelect(SpriteDb.get_s_ceraph());
         var _loc2_:int = get_player().cockThatFits(get_monster().analCapacity());
         if(_loc2_ < 0)
         {
            _loc2_ = 0;
         }
         clearOutput();
         outputText("傲慢的恶魔完全被击败了，她脸朝下趴在泥土里，");
         if(get_monster().get_HP() < 1)
         {
            outputText("她的尾巴无力地垂在两腿之间。她吐出一口带血的唾沫，说道，[say:怎么了？把一个女孩打得失去知觉，然后就失去勇气了？我以为你要强奸我。]");
         }
         else
         {
            outputText("她的臀部撅在半空中，而她的尾巴则一次又一次地猛烈插入她的阴户。她向你呻吟道，[say:怎么了？你紧张把它放进我身体里吗？来吧……快强奸我！用你神圣的肉棒惩罚我这湿透的阴户！]");
         }
         outputText("[pg]你伸出手，狠狠地拍了拍她的屁股，");
         if(get_player().get_str() < 75)
         {
            outputText("让她全身都跟着颤动");
         }
         else
         {
            outputText("让她浑身颤抖，在泥土中滑行了几英寸");
         }
         outputText("，并在你脱下[armor]时让她闭嘴。[pg]");
         outputText("现在你赤身裸体，毫不迟疑地抓住她结实的大腿，将她举起，把她的脸按在泥土里摩擦，同时好好欣赏她紧闭的后庭和");
         if(get_monster().get_HP() < 1)
         {
            outputText("湿润的");
         }
         else
         {
            outputText("湿得发痛的");
         }
         outputText("恶魔小穴。她的外阴张开，极度充血，像花朵一样绽放，简直是在乞求你插入那滴水的通道。[pg]");
         outputText("[say:不……别插进我的小穴！你会让我怀孕的！还是说这就是你的目的？你打算一直射在我的骚穴里，直到我怀得动不了为止吗？这就是你的计划吗，勇者？你打算让所有的恶魔都怀上你的孩子，让她们无法反抗你吗？看看你把我的小穴弄得多湿……我可是高级恶魔，你、你不能让我怀孕！不，]塞拉芙呻吟着，她的尾巴缠绕在你的" + get_player().cockDescript(_loc2_) + "上，显然是在试图诱惑你，但你为她准备了一个惊喜。[pg]");
         outputText("你将你的" + get_player().cockHead(_loc2_) + "在那恶魔的汁液喷泉上摩挲，让塞拉芙用堕落的润滑液涂满你，同时你撩拨着她那媚贱十足、随时待入的阴唇。几秒钟内你从龟头到胯部都湿透了，在塞拉芙骗你让她怀上一窝恶魔孩子之前，你将她压低，猛地推进[hips]。她的小穴虽然紧实，却在你的冲击下让步，逐渐扩张以容纳你的" + get_player().cockHead(_loc2_) + "和" + get_player().cockDescript(_loc2_) + "最前面的几英寸。");
         if(get_player().cockTotal() == 2)
         {
            outputText("另一根" + get_player().cockDescript(_loc2_) + "在她的臀瓣上摩擦，多亏了她分泌的大量汁液，轻松地滑了进去。");
         }
         else if(get_player().cockTotal() > 2)
         {
            outputText("你其余的男性生殖器滑入恶魔挺翘的臀瓣之间，沾满了淫液，挤成一大团。");
         }
         outputText("塞拉芙痛苦地尖叫着，完全出乎意料，而且破天荒地，完全没有了机智的反驳。[pg]");
         outputText("恶魔在你身下像受伤的动物一样咕哝着，她长长的恶魔舌头伸出来，在泥土里拍打，而你则将她半昏迷的身体摇晃着靠近你的胯部。在里面，你的" + get_player().cockHead(_loc2_) + "挤过她紧致的肛门括约肌，进入了恶魔最深处那异常温暖的地方。你越来越多的" + get_player().cockDescript(_loc2_) + "滑入这个奇妙紧致、火热的小洞，随着被击败的恶魔放松下来，接受了她作为不配怀上你孩子的精液垃圾桶的角色，插入变得越来越容易。");
         if(get_monster().get_HP() < 1)
         {
            outputText("淫水溅在你的[legs]上，塞拉芙现在精力充沛的尾巴插入她湿透的穴里，配合着她后庭被插入的节奏抽插着。");
         }
         else
         {
            outputText("淫水滴在你的[legs]上，塞拉芙的尾巴缓慢而有目的地在她的穴里耕耘，模仿着她后庭被插入的感觉。");
         }
         outputText("[pg]");
         outputText("塞拉芙呜咽着乞求，[say:不……你在强奸我的屁股……把、把它拔出来！你不是应该纯、纯洁的吗？未受污染的？你——呃——像个变态动物一样操恶魔的屁股！求你了……操、操我的小穴。我甚至不介意你不洗干净……只要把它插进我的阴道里就行。][pg]");
         outputText("见鬼去吧！你更用力地拉扯，掰开她的臀瓣，直到它们被挤压在你的身体上，她那被肉棒撑开的后庭");
         if(!get_player().hasSheath())
         {
            outputText("几乎碰不到你的腹股沟");
         }
         else
         {
            outputText("摩擦着你的包皮");
         }
         outputText("。恶魔的屁股温暖得让你觉得你就像烤箱里的冰柱一样快要融化了，这种幸福的感觉促使你把玩她柔软的臀瓣，同时享受着完全插入恶魔后门的快感。你用力拍打那些臀瓣，然后向后拉，享受着她那极其紧致的括约肌滑过你沾满淫液的" + get_player().cockDescript(_loc2_) + "的感觉。[pg]");
         outputText("你没有等待，猛地把它插回原处，埋入那闷热的后庭。塞拉芙咕哝着，她的尾巴与你保持着同步，显然给她带来了极大的快感。你花时间伸手下去把它拔出来——如果她要高潮，她就必须在感觉到你用浪费的精液填满她的肠道时高潮。她痛苦地哭喊着，[say:不……操你！求你了……至少让我从这个高潮。你操得我这么霸道……这么用力……以莉希丝的名义，这让我湿透了。求你了！让我高潮，让我高潮……让我高潮让我高潮让我高潮！][pg]");
         outputText("你没有松开她的尾巴。她总是试图把你变成某种被恋物癖束缚的婊子，她必须为此付出代价！你用力地抽插着她，你们汗流浃背的身体撞击的回声在山腰上回荡，很可能会吸引各种恶魔和野兽。你脑海深处的一个声音警告你要快点，以免被另一只怪物打个措手不及，作为回应，你加快了抽插的速度。在几次特别有力的、撞击臀部的抽插之后，塞拉芙停止了挣扎，一串先列腺液从她半软的肉棒上垂下来。每一次疯狂的肛交都会挤出更多的液体，但在她高潮之前，你感觉到自己的高潮来临了。[pg]");
         outputText("一串串精液飞溅到恶魔的直肠里，虽然这把她紧致的后门变成了一个流着口水的湿润肉洞，但实际上却把温度降低到了一个更理智的阈值。");
         if(get_player().cumQ() >= 500 && get_player().cumQ() < 1500)
         {
            outputText("她的肚子因为精液的沉积而微微隆起，更明显地标志着她是你的肉棒的精液桶。");
         }
         else if(get_player().cumQ() >= 1500)
         {
            outputText("她的肚子咕噜咕噜地肿胀起来，凸出得看起来简直像怀孕了，尽管你知道她是从另一端被填满的。");
         }
         outputText("你拔了出来，塞拉芙");
         if(get_player().cocks[_loc2_].cockThickness < 3)
         {
            outputText("微微张开的");
         }
         else if(get_player().cocks[_loc2_].cockThickness < 5)
         {
            outputText("张开的");
         }
         else
         {
            outputText("大张着的");
         }
         outputText("屁眼到处漏精。对她感到厌恶");
         if(get_player().cor < 33)
         {
            outputText("也对自己感到一点厌恶");
         }
         outputText("，你像丢弃破布一样把她扔下。她呻吟着开始自慰，因为粗暴的对待而半失去知觉。你无视了她，穿好衣服，在山上的野兽出现之前离开了那里。塞拉芙将度过一个狂野的夜晚！");
         get_player().orgasm("Dick");
         dynStats(DynStat.Lib(3),DynStat.Sens(3),DynStat.Cor(1));
         if(get_game().get_inCombat())
         {
            get_combat().cleanupAfterCombat();
         }
         else
         {
            doNext(get_camp().returnToCampUseOneHour);
         }
      }
      
      public function bailBeforeCeraphYoinksYourNads() : void
      {
         clearOutput();
         spriteSelect(SpriteDb.get_s_ceraph());
         outputText("你告诉她你改变主意了，并在塞拉芙试图拿走你心爱的身体部位之前逃跑了。你跑的时候听到她笑着嘲弄你，大喊道：[say:怎么，受不了一个双性魅魔碰你那好玩的地方吗？可怜的宝贝！][pg]");
         doNext(get_camp().returnToCampUseOneHour);
      }
      
      public function agreeToBecomeCeraphsFuckpetBondageToyBitchSlut() : void
      {
         clearOutput();
         spriteSelect(SpriteDb.get_s_ceraph());
         outputText("在这一点上，你知道她是对的。塞拉芙在你内心唤醒的欲望永远不会消失。尽管它们带来了麻烦，但你已经爱上了被这种屈辱的对待激起无法控制的性欲的感觉。");
         if(get_player().hasVagina())
         {
            outputText("你的" + get_player().vaginaDescript(0) + "感到一阵刺痛，你想知道她能在你的阴唇上穿多少个环，塞进多少个性癖。");
         }
         else if(get_player().cockTotal() > 0)
         {
            outputText("你的[cock]变得坚硬如石，你想知道她是否会给你一个充满新性癖和想法的雅各布天梯。");
         }
         else
         {
            outputText("你的身体因为性欲而嗡嗡作响，你想知道她是否会给你一个阴茎和阴道，把它们都穿上环，并让你充满新的性癖和性感的顺从想法。");
         }
         outputText("[pg]下定决心后，你郑重地向塞拉芙点了点头。恶魔会意地笑了笑，漫步走到你面前。她抓住你的头，死死地盯着你的眼睛，仿佛在寻找什么。时间一分一秒地过去，直到她突然松开你，拿起她的鞭子，粗暴地绑在你的脖子上。她拉着鞭子，强迫你趴在泥土上，命令道：[say:宠物要爬行。而且它们不穿衣服。][pg]");
         outputText("她花了一会儿时间脱掉你的衣服，然后在你的[ass]上拍了几下，把它打得通红。你对这种待遇感到恐惧，但比以往任何时候都更加兴奋，你忍受着屈辱，跟在你的女主人后面爬行，她用一条临时的皮带牵着你走向新的、性感的性奴生活。你忘记了时间，只专注于把一只手放在另一只手前面。好几次你从眼角余光瞥见恶魔和怪物，但它们似乎都不想接近你的女主人或她的新奴隶：你。每次你感觉到它们的目光落在你赤裸的[skindesc]上，你都会被性快感所震撼。[pg]");
         outputText("沉浸在自己的思绪中，你几乎没有注意到光线变暗，也没有注意到身后门关上的沉闷响声。快乐的呻吟声让你从茫然的状态中清醒过来。你已经到了塞拉芙的巢穴。恶魔几乎没有注意到你，她牵着你的皮带，走来走去，向她的其他宠物打招呼。她揉了揉一个小男孩的头发，他除了戴着狗耳朵和一个看起来很有创意的肛塞（让他看起来像长了尾巴）之外什么都没穿。塞拉芙挠了一个有着许多恶魔特征的女孩子的胯部。她被绑在墙上，两个按摩棒深深地绑在她被虐待的乳头小穴里。当塞拉芙抚摸她时，她原来的性器官流着口水，但完全没有被填满，她在带子里扭动着。[pg]");
         outputText("在塞拉芙的家里，还有许多像那两个一样的奴隶。有些只不过是家具，有些她像艺术品一样对待，还有一些她用来满足自己的性享受。她宣布：[say:宠物们，见见你们的新" + get_player().mf("brother","sister") + "。我想我就叫" + get_player().mf("him","her") + "“宠物”吧。[He]需要知道自己的位置，我们整个星期都要教导和给[him]穿环。][pg]");
         outputText("鞭子从你的脖子上解开，你抬起头，不知道该怎么办。塞拉芙柔声说道：[say:好宠物。就保持那样，为我撅起嘴。][pg]");
         outputText("你觉得这没什么坏处，而且想讨好你的女主人，于是你撅起了下唇。你的顺从换来的是一阵剧烈的刺痛。你试探性地舔了舔，感觉到一个光滑的环套在你嘴唇的中央。");
         if(get_player().lipPierced > 0)
         {
            outputText("之前的穿环消失了！");
         }
         outputText("女主人真好，给了你这么漂亮的穿环！你发现自己如此轻易地称呼她为女主人，这让你感到震惊，但她就是这样，不是吗？她是你的女主人和主人，而你是她的宠物。你发现她正期待地看着你，你意识到她在等什么。[pg]");
         outputText("你紧张地舔了舔你的新唇环，说道：[say:谢谢女主人，宠物很高兴再次被穿环！][pg]");
         outputText("搞什么鬼？你刚才称自己为宠物了吗？你内心挣扎着，心想：[say:宠物什么时候开始把自己当成宠物的？]一阵新的性欲刺痛传遍全身——女主人塞拉芙让你无法思考或称呼自己为宠物以外的任何东西！她还会对你做什么？[pg]");
         outputText("[say:哦，看着我的宠物和玩具真正学会它们的新名字真是太可爱了。现在过来，宠物，一个好宠物要戴项圈，这样大家就知道[he]属于谁了，]女主人说着，从墙上的挂钩上扯下一个厚厚的黑色项圈。你顺从地让她把它系在你的脖子上，摇晃着你的");
         if(get_player().tail.type == 0)
         {
            outputText("屁股");
         }
         else
         {
            outputText("尾巴");
         }
         outputText("摇来摇去，好让女主人知道你有多高兴。服从感慢慢占据了你的大脑，无情地碾过你其他的想法和顾虑。你的担忧、烦恼和困扰都烟消云散了，取而代之的是一种想要取悦她的强烈需求。");
         doNext(agreeToBeABitchPt2);
      }
      
      public function agreeToBeABitchPt2() : void
      {
         clearOutput();
         spriteSelect(SpriteDb.get_s_ceraph());
         outputText("几个月在纯粹的幸福中过去了。自从被收养进女主人塞拉芙的后宫以来，宠物获得了十几个穿孔和几乎两倍的性癖。宠物学会了喜欢打屁股，并培养了仅仅通过捏[his]乳头或被桨打就能高潮的能力。塞拉芙有一段时间很享受这个，但她最终还是厌倦了，宠物被赋予了性高潮控制的性癖");
         if(get_player().cockTotal() > 0)
         {
            outputText("以及一个神奇的阴茎环");
         }
         outputText("。两周由药物和束缚引起的边缘控制几乎让宠物精神崩溃，但女主人很仁慈，在宠物打了一个新穿孔并膜拜了她的脚几个小时后，允许[him]一次又一次地高潮。[pg]");
         outputText("那个很久以前离开英格纳姆的勇者，现在无论是身体还是灵魂都完全认不出来了。曾经燃烧着拯救村庄无辜者渴望的灵魂，已经被扭曲得无法修复。这个曾经的勇者现在只被称为“宠物”，甚至不配拥有一个真正的名字，[his]把所有的时间都花在对女主人塞拉芙的渴望上，参与她堕落的群交，并心甘情愿地屈服于任何呈现给[him]的性癖或放荡行为。宠物作为个体的生活和选择已经结束，剩下的只有快乐和痛苦。");
         get_game().gameOver();
      }
   }
}

