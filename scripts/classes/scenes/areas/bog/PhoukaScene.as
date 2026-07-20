package classes.scenes.areas.bog
{
   import classes.BaseContent;
   import classes.CoC;
   import classes.DynStat;
   import classes.ImageManager;
   import classes.Player;
   import classes.StatusEffects;
   import classes.TimeAwareInterface;
   import classes.Vagina;
   import classes._FlagDict.FlagDict_Impl_;
   import classes.globalFlags.KFLAGS;
   import classes.internals.Utils;
   import classes.items.ConsumableLib;
   import classes.scenes.Camp;
   import classes.scenes.PregnancyProgression;
   import classes.scenes.VaginalPregnancy;
   import classes.scenes.combat.Combat;
   import coc.view.CoCButton;
   import flash.Boot;
   import haxe.IMap;
   
   public class PhoukaScene extends BaseContent implements VaginalPregnancy, TimeAwareInterface
   {
      
      public static var phoukaForm:int = 0;
      
      public static var PHOUKA_FORM_FAERIE:int = 0;
      
      public static var PHOUKA_FORM_BUNNY:int = 1;
      
      public static var PHOUKA_FORM_GOAT:int = 2;
      
      public static var PHOUKA_FORM_HORSE:int = 3;
      
      public function PhoukaScene()
      {
         if(Boot.skip_constructor)
         {
            return;
         }
         super();
         CoC.timeAwareClassAdd(this);
         PregnancyProgression.registerVaginalPregnancyScene(25,24,this);
      }
      
      public function vaginalBirth() : void
      {
         var _loc1_:* = null as IMap;
         get_images().showImage("birth-phouka");
         outputText("\n<b>你感觉肚子里的什么东西破裂了……</b>[pg]");
         if(int(get_player().vaginas.length) == 0)
         {
            outputText("你的腹股沟传来一阵痛苦的压迫感……然后你几乎要晕过去，感觉你的胯部被撕开了。起初你以为是某种疝气，然后你意识到你又长出了一个阴道。[pg]");
            get_player().createVagina();
         }
         if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,1174) > 6)
         {
            outputText("你的肚子开始瘪下去，一股几乎是黑色的污泥从你的阴道里渗出来。你躺在地上等待着，想知道这次分娩会怎样。随着你的肚子越来越平，你开始想孩子在哪里。[pg]然后你感觉到了——有什么东西卡在你体内。你开始用力，意识到它不是卡住了——它是不想出来，而且它抓住了你的子宫颈！另一方面，你的身体确实想把它弄出来，并不断地收缩，以摆脱这个吃白食的小混蛋。黑色的糖蜜让你的产道变得粘稠，有助于把婴儿固定在原位。随着宫缩的不断到来，你很快就失去了时间感。几分钟后，当你感觉到阴蒂一阵刺痛时，你开始怀疑自己是否能摆脱这个孩子。");
            outputText("[pg]尽管很痛，或者也许正因为如此，你的身体正走向高潮！起初你试图抵抗，但你很快意识到这毫无意义。你仍然很痛，除了躺在那里等待，什么也做不了。最后你高潮了，你感觉到一股淫液从你张开的洞里滴下来。[if (hasCock) { 同时[eachCock]射出无数股精液，覆盖了你和你周围的地面。}]幸运的是，你产生的所有淫液也填满了你的小穴，并开始稀释你体内浓稠的黑色糖蜜。在经过更多次宫缩后，你感觉到婴儿在你体内移动，它终于弹了出来，落在你大腿之间的地上。[pg]这个" + phoukaName() + "出生时似乎已经完全长大了。他转过身来盯着你，好像他不得不离开你子宫的舒适是你的错。在你恢复到能做点什么之前，他展开翅膀，抖掉污泥，向沼泽飞去。[pg]你躺在地上，被这场折磨弄得筋疲力尽。你能感觉到小穴里有轻微的灼热感，子宫里有悸动感。你确信，带着那种看起来很恶心的黑色污泥在你体内，已经影响了你生育孩子的能力。");
            var _temp_1:* = get_player();
            _temp_1.fertility = _temp_1.fertility - 18;
            if(get_player().fertility < 5)
            {
               get_player().fertility = 5;
            }
            get_player().changeFatigue(75);
            _loc1_ = KFLAGS.flags;
            FlagDict_Impl_.arrayWriteInt(_loc1_,1170,FlagDict_Impl_.arrayReadInt(_loc1_,1170) + 1);
            get_player().orgasm("Vaginal");
         }
         else if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,1174) > 0)
         {
            outputText("你的肚子开始瘪下去，一股浓稠的灰色含糖污泥从你的阴道里滴下来。你躺在地上等待着，想知道这次分娩会怎样。随着你的肚子越来越平，你开始想孩子在哪里。");
            outputText("[pg]然后你感觉到了——有什么东西卡在你体内。你开始用力，意识到它不是卡住了——它是不想出来，而且它抓住了你的子宫颈！另一方面，你的身体确实想把它弄出来，并不断地收缩，以摆脱这个吃白食的小混蛋。几分钟后，你开始怀疑自己是否能摆脱这个孩子，这时它突然在你体内移动并弹了出来，落在你大腿之间的地上。");
            outputText("[pg]这个" + phoukaName() + "出生时似乎已经完全长大了。他转过身来盯着你，好像他不得不离开你子宫的舒适是你的错。在你恢复到能做点什么之前，他展开翅膀，抖掉污泥，向沼泽飞去。");
            outputText("[pg]你躺在地上，被这场折磨弄得筋疲力尽，想知道带着那种看起来很恶心的污泥在你体内是否影响了你生育孩子的能力。");
            var _temp_2:* = get_player();
            _temp_2.fertility = _temp_2.fertility - 8;
            if(get_player().fertility < 5)
            {
               get_player().fertility = 5;
            }
            get_player().changeFatigue(50);
            _loc1_ = KFLAGS.flags;
            FlagDict_Impl_.arrayWriteInt(_loc1_,1170,FlagDict_Impl_.arrayReadInt(_loc1_,1170) + 1);
         }
         else
         {
            outputText("你的肚子开始瘪下去，一股散发着甜味的糖水从你的阴道里涌出。你躺在地上等待着，希望这次分娩能相对无痛。你只需要轻轻推一下，你就能感觉到一个小小的形状沿着你的产道轻轻滑下。在你准备好之前，你把一个小妖精排到了你双腿之间的地上。");
            outputText("[pg]完全长大的妖精抬头看着你，微微一笑。她抖了抖粉色的小妖精翅膀直到它们变干，然后绕着你飞了一圈，打量着你。她飞到你面前，在你的脸颊上亲了一下，然后退开。");
            outputText("[pg]妖精女孩开始越飞越高，一边飞一边向你挥手。最后，她转过身，嗖地一下飞向森林，去见她的姐妹们了。");
            get_player().changeFatigue(5);
            _loc1_ = KFLAGS.flags;
            FlagDict_Impl_.arrayWriteInt(_loc1_,1171,FlagDict_Impl_.arrayReadInt(_loc1_,1171) + 1);
         }
      }
      
      public function updateVaginalPregnancy() : Boolean
      {
         if(get_player().get_pregnancyIncubation() == 170)
         {
            if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,1174) > 0)
            {
               outputText("你的肚子仍然感觉坚硬沉重。不管里面长的是什么，它都不想让你走动太多。你最好还是在营地里坐着，直到你把它生出来。[pg]");
            }
            else
            {
               outputText("你的肚子仍然感觉坚硬沉重，但不知为何你感到精力充沛，想要享受生活。你真的很想去森林里散散步。[pg]");
            }
            return true;
         }
         if(get_player().get_pregnancyIncubation() == 140)
         {
            if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,1174) > 0)
            {
               outputText("你的肚子现在感觉软了一些。每隔一段时间，你就会感觉到有什么小东西在撞击你的子宫内壁。[pg]");
            }
            else
            {
               outputText("你的肚子现在感觉软了一些。每隔一段时间，你就会感觉到子宫壁上有扑腾的感觉，简直就像有什么东西在里面飞来飞去。[pg]");
            }
            return true;
         }
         if(get_player().get_pregnancyIncubation() == 100)
         {
            outputText("你的肚子感觉像是充满了液体，更像是一次正常的怀孕。");
            if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,1174) > 0)
            {
               outputText("这部分让你感觉更舒服。可惜你觉得那液体是陈腐且被污染的。");
            }
            else
            {
               outputText("这对你来说舒服多了。每当你抚摸肚子时，你都会感到充满生机与活力。");
            }
            outputText("你注意到这次怀孕似乎并没有影响你的乳房。就好像你肚子里的孩子不需要你的乳汁一样。[pg]");
            return true;
         }
         if(get_player().get_pregnancyIncubation() == 60)
         {
            if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,1174) > 6)
            {
               outputText("不管你体内是什么不洁的孽种，它都没有长得很大。你的肚子里仍然充满了被污染的液体，你发现自己很难咽下食物。你不断地产生想喝酒的冲动，而且越烈越好。[pg]");
            }
            else if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,1174) > 0)
            {
               outputText("不管你体内是什么不洁的孽种，它都没有长得很大。你的肚子里仍然充满了液体，尽管不知为何感觉没那么饱满了，也许污染也少了一些。[pg]");
            }
            else
            {
               outputText("不管你体内是什么生命，它都没有长得很大。你的肚子里仍然充满了液体，尽管不知为何感觉没那么饱满了。[pg]");
            }
            return true;
         }
         if(get_player().get_pregnancyIncubation() == 36)
         {
            outputText("尽管你的肚子大小没有变，但你不知为何觉得你的孕期即将结束。");
            if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,1174) > 6)
            {
               outputText("尽管你的肚子很小，但你大部分时间都感到病得很重，你迫不及待地想把这东西弄出来。你能感觉到子宫和卵巢传来持续的隐痛，这可能是你体内被污染的液体造成的。只有喝酒才能让你的胃舒服点。[pg]");
            }
            else if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,1174) > 0)
            {
               outputText("尽管你的肚子相对较小，但你大部分时间都感到有些不适，你迫不及待地想把这东西弄出来。[pg]");
            }
            else
            {
               outputText("尽管怀孕了，你仍然没有感到任何限制或迟缓。就好像里面的小生命在与你和谐共处一样。[pg]");
            }
            return true;
         }
         return false;
      }
      
      public function timeChangeLarge() : Boolean
      {
         return false;
      }
      
      public function timeChange() : Boolean
      {
         if(get_player().statusEffectv1(StatusEffects.PhoukaWhiskeyAffect) > 0)
         {
            get_player().addStatusValue(StatusEffects.PhoukaWhiskeyAffect,1,-1);
            if(get_player().statusEffectv1(StatusEffects.PhoukaWhiskeyAffect) <= 0)
            {
               get_game().consumables.P_WHSKY.phoukaWhiskeyExpires(get_player());
               return true;
            }
         }
         return false;
      }
      
      public function phoukaTalk() : void
      {
         clearOutput();
         get_images().showImage("monster-phouka");
         outputText("你问那个" + phoukaName());
         if(get_player().level < 10)
         {
            outputText("问他是否有什么办法可以放你走。");
         }
         else
         {
            outputText("问他是不是真想尝尝你给他的苦头。");
         }
         if((get_player().corAdjustedUp() + Utils.rand(125) + (get_player().level - 10)) * 4 <= 110)
         {
            outputText("你张了张嘴，想对那个");
            if(get_player().cor < 34)
            {
               outputText("卑鄙的小怪物");
            }
            else if(get_player().cor < 67)
            {
               outputText("变态的" + phoukaName());
            }
            else
            {
               outputText("欠操的小" + phoukaName());
            }
            outputText("但他似乎不想听。他朝你脸上扔了一团黑泥，用黏糊糊的——[if (corruption <= 50) {呃|嗯}]——咸乎乎的淤泥封住了你的嘴。");
            startCombat(new Phouka(phoukaName()));
            get_player().createStatusEffect(StatusEffects.WebSilence,0,0,0,0);
         }
         else
         {
            outputText("[pg]" + phoukaName());
            switch(get_player().level < 10 ? Utils.rand(8) : Utils.rand(12))
            {
               case 0:
               case 1:
               case 2:
               case 3:
               case 4:
               case 5:
               case 6:
                  outputText("考虑了一会儿，然后说道，[say: 你现在没法从我身边逃开，为什么不享受一下呢？不然的话，也许我会叫几个朋友来，让我们一起上你。] 普卡的目光中透露出的自信表明他不是在虚张声势。他慢慢绕着你转圈，悬停在离你几步远的地方。他的眼睛似乎要把你身体的每一个细节都看在眼里，[if (corruption < 50) {让你一阵阵毛骨悚然}][if (corruption >= 50) {让你的心跳加速}]。[pg]普卡继续说道，");
                  if(get_player().hasVagina())
                  {
                     outputText("[saystart]也许你喜欢兔子，嗯？大兔娘，带着又硬又大的老二和强壮的双腿，我可以为你变成那个。把你那紧致的小穴里灌满我的精液！[pg]或者也许");
                  }
                  else
                  {
                     outputText("[saystart]");
                  }
                  outputText("我可以为你变成山羊。合你口味吗？让山羊在你的屁眼里射精是你长久以来的梦想吗？");
                  if(get_player().hasVagina())
                  {
                     outputText("[sayend]");
                     outputText("[pg][say:噢，还有一种你可能喜欢。骑过种马吗？有没有想过把马两腿间那玩意儿塞进你下面会是什么感觉？只要你开口，小姐，我立马变成大种马，把你操得裂开了花。]");
                  }
                  else
                  {
                     outputText("你要是不喜欢也没辙，因为我就想这么干。[sayend]");
                  }
                  menu();
                  phoukaSexAddStandardMenuChoices();
                  addNextButton("战斗",phoukaStartFight);
                  break;
               case 7:
               case 8:
                  outputText("久久地打量着你。最后他咧嘴一笑，对你说 [say: 知道吗？你不是我要找的类型。我们普卡妖精口味各不相同，懂吧。] 说完，这只普卡懒洋洋地飞走了，嘴里哼着古怪的小调。");
                  outputText("[pg]你扭动身子挣脱束缚，几分钟后便重获自由。你觉得今天的刺激已经够多了，于是返回营地。");
                  if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,1173) == 0)
                  {
                     FlagDict_Impl_.arrayWriteInt(KFLAGS.flags,1173,1);
                  }
                  unlockCodexEntry(2734,true,false);
                  doNext(get_camp().returnToCampUseOneHour);
                  break;
               default:
                  outputText("在空中绕了一个大圈，最后停在了一棵断树附近。他降落下来，伸手进一个树洞里，拉出了一个比他还大的玻璃瓶。");
                  outputText("[pg]这只" + phoukaName() + "在拔瓶塞时遇到了一些麻烦，似乎再次在你眼前融化了。他变大并变成了" + (get_noFur() ? "一个像兔子一样的人类，有着长长的耳朵和毛茸茸的四肢，将近四英尺高" : "一只巨大的、长着黑毛的兔子，将近四英尺高，有着非常像人类的脸和手") + "的形态。这只兔子用力拔出瓶塞，从同一个树洞里拿出一些皮制酒杯。最后，这只" + phoukaName() + "回头看着你，举起瓶子。[pg][say: 我当然能打败你。但这看起来可能是一场漫长的战斗，而在没有喝更多威士忌之前，我不想开始这样的战斗。]这只" + phoukaName() + "张开他那巨大的兔子脚，以便在仰头喝酒时给自己更多的支撑。他咳嗽了几声，但喝完酒后，他对你咧嘴笑了笑，色欲少了几分。[say: 好东西，这个。我们普卡就在这沼泽里酿造它。最好的水，最好的泥炭，最好的普卡威士忌原料。]");
                  if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,1173) == 0)
                  {
                     FlagDict_Impl_.arrayWriteInt(KFLAGS.flags,1173,1);
                  }
                  PhoukaScene.phoukaForm = 1;
                  if(get_player().get_pregnancyIncubation() == 0 && get_player().get_buttPregnancyIncubation() == 0)
                  {
                     outputText("他把一些清澈的琥珀色液体倒进另一个杯子里，递给你。");
                     unlockCodexEntry(2734,true,false);
                     menu();
                     addButton(0,"拒绝",phoukaDrinkRefuse);
                     addButton(1,"喝",phoukaDrinkAccept);
                  }
                  else
                  {
                     unlockCodexEntry(2734,true,false);
                     phoukaDrinkWhilePregnant(false);
                  }
            }
         }
      }
      
      public function phoukaStuckOfferWhiskey() : void
      {
         clearOutput();
         get_images().showImage("item-whiskey");
         outputText("你拿出瓶子，问那只" + phoukaName() + "是否有兴趣喝一杯。他看着瓶子说[say: 哈，我们都知道你是从哪儿弄来的，对吧？]然后他笑着补充道[say: 不过嘛，如果他让你打败了，那就是别的普卡的问题了。]");
         if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,1173) == 0)
         {
            FlagDict_Impl_.arrayWriteInt(KFLAGS.flags,1173,1);
         }
         unlockCodexEntry(2734,true,false);
         get_player().consumeItem(get_consumables().P_WHSKY,1);
         outputText("[pg]这只普卡飞快地跑到附近的树上，取来两个皮制酒杯，同时你拔掉了瓶塞。他回来时，身形变化成长，变成了一个兔娘形态。你猜测，在妖精形态下，这些普卡酒量都不怎么样——又或者它们只是没法喝下足够多的酒。他拿起瓶子，往杯子里倒了一些清澈的琥珀色液体，递了一杯给你。");
         PhoukaScene.phoukaForm = 1;
         if(get_player().get_pregnancyIncubation() == 0 && get_player().get_buttPregnancyIncubation() == 0)
         {
            menu();
            addButton(1,"喝",phoukaDrinkAccept);
         }
         else
         {
            phoukaDrinkWhilePregnant(true);
         }
      }
      
      public function phoukaStuck() : void
      {
         clearOutput();
         var _loc1_:Boolean = get_player().hasItem(get_consumables().P_WHSKY,1);
         get_images().showImage("monster-phouka");
         outputText("你沿着一些较坚实的地面，走进了一处枯树丛。这里沼泽寂静无声。前方你看见一棵枯树的树洞里有什么东西在闪光，但还没等你上前探查，脚下坚实的地面就突然液化，你开始下沉。");
         outputText("[pg]你试图跳到另一块露出水面的泥泞土块上，但还没等你落地，它也变软了。你很快就被泥巴包裹到了腰部。");
         outputText("[pg]就在这时，你感觉到有什么光滑温暖的东西在泥浆中从你身边掠过。无论它走到哪里，都会在身后拖着一张厚厚的网。你的");
         if(get_player().hasTailInsteadOfLegs())
         {
            outputText("尾巴被");
         }
         else
         {
            outputText("双腿被");
         }
         outputText("很快就缠在了一张由交织的根须组成的结实网中。一旦你被绑在原地，一条巨大的黑色鳗鱼就会从泥浆中挣脱出来，落入附近的水坑中。");
         outputText("[pg]你的攻击者似乎融化了，然后重组，变成了一个五英寸高的" + phoukaName() + "。他的皮肤和翅膀是乌黑的，眼睛像猫一样碧绿闪亮。他没穿任何衣服，胯下伸出一根几乎一英寸长的完全勃起的阴茎。除此之外，他也没有乳房，身体看起来相当女性化，很像森林里的妖精。[pg]这个" + phoukaName() + "不怀好意地打量着你，显然在盘算下一步要干什么。");
         if(_loc1_)
         {
            outputText("[pg]你觉得如果你把[inv]里的威士忌献给他，那个" + phoukaName() + "大概就不会想强奸你了。");
         }
         if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,1172) == 0)
         {
            FlagDict_Impl_.arrayWriteInt(KFLAGS.flags,1172,1);
         }
         if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,1173) > 0)
         {
            unlockCodexEntry(2734,true,true);
         }
         menu();
         if(_loc1_)
         {
            addButton(0,"献上酒",phoukaStuckOfferWhiskey);
         }
         else
         {
            addButtonDisabled(0,"献上酒","你没有威士忌可献上。");
         }
         addButton(1,"交谈",phoukaTalk);
         addButton(2,"战斗",phoukaStartFight);
      }
      
      public function phoukaStartFightSilenced() : void
      {
         get_player().createStatusEffect(StatusEffects.WebSilence,0,0,0,0);
         startCombatImmediate(new Phouka(phoukaName()));
      }
      
      public function phoukaStartFight() : void
      {
         outputText("[pg]你下半身无法动弹，但你转动了一下肩膀，狠狠地瞪着这个小怪物。他可不会不费吹灰之力就拿下你。");
         startCombat(new Phouka(phoukaName()));
      }
      
      public function phoukaSexPregnateEnd(param1:Boolean) : void
      {
         get_player().orgasm("Generic");
         dynStats(DynStat.Cor(Utils.rand(2) + (param1 && PhoukaScene.phoukaForm != 0 ? 1 : 3)));
         if(PhoukaScene.phoukaForm == 0)
         {
            outputText("[pg]你暂时心满意足地开始穿上衣服。也许那只" + phoukaName() + "会吸取教训，也许不会。");
            if(get_player().cor > 50)
            {
               outputText("但无论如何，你都打算回来给它们所有人上这一课。");
            }
            if(param1)
            {
               get_game().combat.clearStatuses();
               get_game().combat.awardPlayer();
            }
            else
            {
               doNext(get_camp().returnToCampUseOneHour);
            }
         }
         else
         {
            if(param1 && get_player().get_gems() > 0)
            {
               outputText("就在你恢复的时候，" + phoukaName() + "把手伸进你的宝石袋里抓了一把。");
            }
            outputText("[pg]既然已经完事了，" + phoukaName() + "又缩回成了一只黑色的小妖精，嗡嗡地飞向了沼泽的其他地方。");
            outputText("[pg]你");
            if(PhoukaScene.phoukaForm == 3 && !get_player().isTaur())
            {
               outputText("等待骨盆里那阵阵的抽痛消退。然后你");
            }
            if(param1)
            {
               outputText("把你的[if (tailLeg) {尾巴|双腿}]从冰凉的烂泥里拔出来，免得冻透了骨头。");
               get_combat().cleanupAfterCombat();
            }
            else
            {
               outputText("收拾好衣服，开始漫长的跋涉，离开沼泽。");
               doNext(get_camp().returnToCampUseOneHour);
            }
            if(get_player().cor <= 50)
            {
               outputText("当你步履蹒跚地走回营地时，你不仅在想——为什么你决定再次造访这片沼泽？");
            }
            else if(PhoukaScene.phoukaForm == 3 && get_player().isTaur())
            {
               outputText("这真是一次奇妙的体验，你发现自己竟然开始期待下一次的沼泽之旅了。");
            }
            else
            {
               outputText("虽然出乎意料，但至少你爽到了。");
            }
         }
      }
      
      public function phoukaSexPregnate(param1:Boolean) : void
      {
         var _loc2_:Boolean = false;
         if(get_player().isPregnant())
         {
            if(PhoukaScene.phoukaForm == 3)
            {
               outputText("[pg]你只感觉到紧闭的子宫颈承受着持续的压力。" + phoukaName() + "的蛋蛋丝毫没有减缓的迹象，压力还在不断增加。最后，你的阴道扩张到极限，让海量的精液从你体内喷涌而出。");
            }
            else
            {
               outputText("[pg]几加仑温热的精液猛烈冲击着你的子宫颈，然后从你的小穴里喷射出来。");
            }
            if(get_player().cor > 50)
            {
               outputText("那种精液流进体内又流出来的感觉，最终让你也迎来了高潮。[if (hasCock) { [EachCock]向你身下的沼泽水中射出一道道长长的精液。}]");
            }
            else
            {
               outputText("随着浓稠的灰色精液从你的小穴里漏出，你终于屈服了，让自己高潮。带着那种感觉，你根本不可能走回营地。");
            }
            if(PhoukaScene.phoukaForm == 0)
            {
               outputText("[pg]既然你已经满足了，你[if (isTaur) {从你的妖精情人身上拉开|从你的妖精情人身上滚下来}]。他缩回了正常大小，然后腾空而起。你太累了，无法阻止他飞进灌木丛，你很快就失去了他的踪迹。");
            }
            phoukaSexPregnateEnd(param1);
            return;
         }
         if(PhoukaScene.phoukaForm == 3)
         {
            outputText("[pg]你只觉得肚子里不断有压力在积聚。不一会儿，你看起来就像怀孕九个月了。一种令人作呕的甜腻感似乎渗透了你的全身。你的牙齿感觉像是从根部开始腐烂。那个" + phoukaName() + "没有丝毫减速的迹象，压力继续增加。终于，你的子宫再也装不下了，种马的精液从你被侵犯的子宫颈倒流出来。[pg]气喘吁吁的马人[if (isTaur) {把他的头侧面在你的鬃毛上蹭了蹭，问你，[say: 准备好做我的生育母马了吗？因为我往你的小穴里塞了足够生一打小马驹的精液。]|说道，[say: 好了，荡妇，希望你喜欢真正种马肉棒的感觉。] 然后他低语道，[say: 最大的问题是，你那宽敞的子宫到底有多肥沃？]}]");
         }
         else
         {
            outputText("[pg]几加仑温暖的精液冲破你的子宫颈，进入你的子宫。你开始觉得胃里不舒服，就像吃了太多糖果一样。你的肚子开始膨胀，你感觉到" + phoukaName() + "的手指划过紧绷的皮肤。当你的肚脐凸出来时，他笑着问你，[say: 你觉得我的机会有多大，荡妇？你那大子宫有多肥沃？]");
         }
         get_player().knockUp(24,200);
         if(PhoukaScene.phoukaForm == 0)
         {
            outputText("那个" + phoukaName() + "可能已经射了，但他的肉棒依然坚硬如石。你无视他的话，开始更快地摇摆臀部，决心从他身上获得更多的快感。[say: 是的，小妞，是的。就是这样——为我高潮，排出一两颗卵子吧。][pg]你能感觉到精液在你的子宫里晃荡，你能感觉到喉咙深处的甜味，但你需要更多！最后你闭上眼睛，全身颤抖着高潮了。[if (hasCock) { [EachCock]将长长的精液射入沼泽，喷了你的妖精伴侣一身。}][pg]你的[vagina]开始努力榨取" + phoukaName() + "的肉棒，你听到这个小怪物发出一声愉悦的呻吟。你感觉到子宫内积聚了更大的压力。你爱道的紧缩将他推向了边缘，" + phoukaName() + "再次射精了。你试图[if (isTaur) {从他身上拉开|从他身上抬起}]，但你的另一次高潮又袭来了。当一切结束时，你留下了一个鼓胀的肚子，就算放在一个正在分娩的女人身上也不会显得突兀。你翻了个身，变大的妖精从你的小穴里滑了出来。你希望大部分的脏东西都能漏出来。然而，你只看到几滴浓稠的灰色精液从你的小穴里渗出。");
         }
         if(!param1 || get_player().cor > 50)
         {
            if(PhoukaScene.phoukaForm == 3)
            {
               outputText("那个" + phoukaName() + "确实爽到了，但你依然欲火焚身。尽管很痛，你还是开始让身体在他的肉棒上前后套弄。你的神经已经麻木，所以你甚至感觉不到他大部分的肉棒。幸运的是，你的子宫颈依然紧致，所以你能在那里感觉到他。[pg]" + phoukaName() + "站着不动，开始大笑。[say: 没错，证明你是个像我这样的种马的荡妇。为我高潮吧，婊子。] 你的肚子随着你的动作淫秽地晃动，皮肤绷得紧紧的，肚脐在泥里摩擦。最后，你整个阴道，从阴唇到子宫颈，都紧紧地夹住了他那美妙的肉棒。你现在只想让这一刻继续下去，被这根超大号、能摧毁小穴的马屌完全填满。[if (hasCock) { 同时，[eachCock]释放了在你的[balls]里积聚的精液。你身下的泥土变得温暖而洁白。}]");
            }
            else
            {
               outputText("值得庆幸的是，" + phoukaName() + "开始用手指摩擦你的阴蒂。你的高潮导致你整个阴道都在起伏，因为你的身体试图将更多的精子吸入肚子里。[if (hasCock) {[EachCock]将长长的精液徒劳地射入沼泽中。}]");
               if(param1)
               {
                  outputText("那个混蛋" + phoukaName() + "在你高潮时大笑。[say: 没错，在我的种子生根发芽的时候，好好享受吧。你们这些小妞总是喜欢被配种。]");
               }
               else
               {
                  outputText("也许他是个体贴的情人，或者他只是想增加让你怀孕的机会。");
               }
            }
         }
         else
         {
            if(PhoukaScene.phoukaForm == 3)
            {
               outputText("你感觉到" + phoukaName() + "抬起他的一条前腿[if (tailLeg) {并把它放在你柔软的下腹部|放在你的大腿之间}]。你怀疑一匹真马的腿是否能那样弯曲，但这个被诅咒的变形者却轻松做到了。他开始用他那光滑的蹄子摩擦你的阴蒂，直到你再也受不了。你依然被他那肉乎乎的柱子刺穿，甚至无法反击。");
            }
            else
            {
               outputText("更气人的是，" + phoukaName() + "开始用手指摩擦你的阴蒂，强迫你违背自己的意愿高潮。");
            }
            outputText("当他让你高潮时，你那被蹂躏的小穴肌肉徒劳地试图将更多的精液吸入子宫。[if (hasCock) {[EachCock]将长长的精液射入沼泽，将你的种子浪费在死寂的水中。}]你努力忍住泪水，这泪水一半是痛苦，一半是被这个变态妖精完全支配的屈辱。");
         }
         if(PhoukaScene.phoukaForm == 0)
         {
            outputText("[pg]" + phoukaName() + "的整个身体和他的肉棒一起瘪了下去。你太累了，无法阻止他");
         }
         else if(PhoukaScene.phoukaForm == 3)
         {
            outputText("[pg]黑毛马后退一步，将他的阴茎从你那被摧残的小穴中拔出，然后变成了一个妖精。他");
         }
         else if(PhoukaScene.phoukaForm == 1)
         {
            outputText("[pg]黑" + (get_noFur() ? "皮" : "毛") + "兔娘从你体内拔出，变成了妖精的形态。他");
         }
         else
         {
            outputText("[pg]他");
         }
         if(param1)
         {
            outputText("在你的宝石袋里翻找了一番，然后");
         }
         outputText("腾空而起，在附近盘旋，似乎在等待什么。[pg]");
         if(get_player().isPregnant())
         {
            _loc2_ = FlagDict_Impl_.arrayReadInt(KFLAGS.flags,1170) == 0 && FlagDict_Impl_.arrayReadInt(KFLAGS.flags,1171) == 0;
            FlagDict_Impl_.arrayWriteInt(KFLAGS.flags,1174,2);
            get_images().showImage("phouka-adventure");
            outputText("你正要起身，却感觉到肚子里有一种" + (_loc2_ ? "不寻常的" : "熟悉的") + "感觉。所有的精液都在变硬！你能感觉到它凝固了，就像放在太阳底下的砂浆一样！你站起来，一些清澈的水流了出来，你的肚子缩小到了西瓜大小。你肚子里剩下的东西是固体的，就像你怀里揣着一个光滑的木球。[pg]你摸了摸肚子。谢天谢地，它并不比正常怀孕重，也一点都不痛。[pg][say: 太棒了！] " + phoukaName() + "大喊道。[saystart]我要当爸爸了！谢谢你让我填满你，女孩，里面有足够的空间给小家伙。我得告诉所有其他的普卡关于你的事");
            if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,1173) == 0)
            {
               FlagDict_Impl_.arrayWriteInt(KFLAGS.flags,1173,1);
            }
            if(!param1 || get_player().cor > 50)
            {
               outputText("，你真是个极品荡妇");
            }
            outputText(".[sayend] 普卡飞得更高了，向沼泽深处飞去，嘴里还高兴地吹着口哨。");
            unlockCodexEntry(2734,true,true);
            if(_loc2_)
            {
               outputText("你不仅好奇这次怀孕会持续多久。如果怀的是人类的孩子，别人肯定会认为你至少有四个月的身孕了。");
            }
            else
            {
               outputText("至少你现在知道这种形式的怀孕会带来什么了。");
            }
         }
         else
         {
            outputText("当你站起身来时，你的肚子开始瘪下去，把里面黏糊糊的灰色液体漏到了泥里。" + phoukaName() + "说道：[say: 哎，算了，总会有下次的，] 然后嗡嗡地飞向了沼泽的其他地方。");
         }
         phoukaSexPregnateEnd(param1);
      }
      
      public function phoukaSexHorseChoice() : void
      {
         phoukaSexHorse(false,false);
      }
      
      public function phoukaSexHorse(param1:Boolean, param2:Boolean) : void
      {
         clearOutput();
         if(param1)
         {
            outputText("当你瘫倒在地时，" + phoukaName());
            if(PhoukaScene.phoukaForm == 3)
            {
               outputText("迈着慢跑的步子绕着你转圈，他的上半身变成了半人马形态，最后停在了你正前方。");
            }
            else
            {
               outputText("开始在你面前变形。它不断变大，最终变成了一匹巨大的黑色半人马种马，胯下还挂着一根同样巨大的肉棒。");
            }
         }
         else if(get_player().cor <= 50)
         {
            outputText("也许这片土地终于开始影响你了。你告诉 " + phoukaName() + " 你想让他用一根巨大的马屌操你。" + phoukaName() + "的眼睛亮了起来。[say: 没问题，小姑娘] 他说着，身体拉长，变成了一匹巨大的、长着黑色皮毛的半人马种马。你希望他能对一个自愿的伴侣温柔一点。");
         }
         else
         {
            outputText("你越想越觉得你需要一场真正的操弄。你对着" + phoukaName() + "微笑，告诉他你想要他能变出的最大的肉棒。" + phoukaName() + "变成了你预想中的形态，一匹黑色的半人马种马，[if (tallness <= 96) {比你还要高大}][if (tallness > 96) {和你差不多高}]。也许他双腿间的那根树干能解你的渴。");
         }
         PhoukaScene.phoukaForm = 3;
         outputText("仔细一看，这只半人马有些与众不同。首先，他有一双闪亮的绿眼睛。他侧腹的部分看起来像是紧贴着身体的薄翼。他的鼻子稍短，脸庞比你预想的要像人类得多。他看到你在打量他，便说道：[say: [if (istaur) {我等这一刻很久了。一匹漂亮的大母马，正好让我操个痛快|你会后悔自己没生出四条腿，也没长个能塞进一条胳膊的小穴的，公主殿下}].][pg]");
         if(!param1 || param2)
         {
            outputText("考虑到你小穴里那团急需扑灭的欲火，你根本不在乎这匹马的肉棒有多大。你现在只需要有东西来填满你。");
         }
         else
         {
            outputText("你根本没有拒绝的余地。无论你做什么，这匹种马都会用那根肉棒狠狠地操你[if (corruption <= 50) {，所以你只能硬着头皮准备迎接即将到来的一切}][if (corruption > 50) {。一想到要被这么巨大的一根肉棒摧残，你的小穴就已经开始滴下淫水了。}]");
         }
         outputText("[pg]种马向你逼近，用鼻孔贪婪地吸吮着你的气味。他的肉棒已经在摩擦着他的下腹，先列腺液让他的毛发黏结在一起。你只能祈祷有足够的液体流过那扁平的龟头，好让你有机会吞下它。");
         if(get_player().isTaur())
         {
            outputText("他走到你身后，骑上了你。你感觉到他的前腿在你的侧腹摩擦，不得不承认这感觉很对。" + phoukaName() + "的马鸡巴生来就是为了强行进入母马体内的[if (vagCapacity < 40) {，但它在面对你紧致的阴唇时遇到了困难。这匹种马不得不又试了两次，才让他的鸡巴滑入你的阴唇之间}][if (vagCapacity >= 40) {，而它也确实做到了}]。");
         }
         else
         {
            if(get_player().hasTailInsteadOfLegs())
            {
               outputText("他走到你面前，转向你，然后直接跨过你，迫使你的上半身向后弯曲，越过你的尾巴。幸好你[if (isNaga) {像蛇一样|修长}]的脊椎意味着弯成“U”形并不会太难受。");
            }
            else
            {
               outputText("他走到你身后，然后直接从你身上跨过，他的胸膛将你撞倒在地。你发现自己四肢着地，一个巨大的龟头正在你的屁股上摩擦。");
            }
            outputText("你听到" + phoukaName() + "说[say: 现在把老子对准你的小穴，丫头，不然老子就趴你身上睡一觉。]不想被那种庞然大物压扁，你向[if (tailLeg) {上|后}]伸出手，抓住了他的阴茎。你把他的鸡巴放在你的[vagina]入口处，种马向前迈了一步。[if (vagCapacity < 50) {他的鸡巴弯曲了一下，然后从你的小穴里弹了出来，拍打在他的肚子上。[say: 再来！这次给老子弄好点！]他喊道。你再次对准它，用手按住它，让它无处可去，只能插进去。}]");
         }
         outputText("你确信自己会被这根怪物般的马鸡巴劈成两半。[pg]");
         get_images().showImage("phouka-sex-horse");
         if(get_player().hasVirginVagina())
         {
            outputText("当" + phoukaName() + "的肉棒撕裂你的处女膜时，你尖叫出声。他在抽插中途停了下来，问道：[say:处女？在这里？天哪，小姑娘，你早该告诉我的。]他压低声音补充道：[say:这样我就能更享受了。]随着" + phoukaName() + "巨大的马屌插进，你的整个小穴都在燃烧，每一处褶皱都被撑开拉宽。你觉得他一定很高兴能只用一次挺进就把一个女人的处女小穴肏得合不拢嘴。");
         }
         else if(param1 && get_player().vaginas[0].vaginalLooseness < 3)
         {
            outputText("随着" + phoukaName() + "的肉棒在你体内越插越深，你几乎痛得晕过去。这么宽的龟头硬挤进来，你确信这种扩张绝对是永久性的。");
         }
         else if(!param1 || get_player().cor > 50)
         {
            outputText("即使入侵者插得更深，你还是迎合着它顶了回去。[say:好女孩，你喜欢马屌，对吧？]" + phoukaName() + "低语道。");
         }
         get_player().cuntChange(80,true);
         outputText("[pg][if (isPregnant) {你感觉到龟头撞上了你的子宫颈，但由于你的子宫里已经有了孩子，它没法再深入了。这个马人压在你身上，徒劳地试图把更多的长度硬塞进去。|他的肉棒抵住了你的子宫颈，马人用他强壮的后腿向前猛推。你眼前一黑，不知道过了多久，但当你醒来时，你能感觉到他的龟头和几英寸长的粗壮肉棒正在你的子宫里跳动。每次他的心脏跳动，你都能顺着被侵犯的子宫颈挤压的血管感觉到。他停止了动作，叹了口气：[say:这正是我需要的，小姑娘。]}][pg]");
         if(get_player().get_lust100() > 80 || get_player().cor > 50)
         {
            outputText("你喘息着呻吟，等待着他那哈密瓜大小的蛋蛋里不可避免的洪流。仅仅是被填得这么满、被如此侵犯的感觉，就已经让你快要高潮了。");
         }
         else
         {
            outputText("你痛苦地呜咽着，希望" + phoukaName() + "能快点结束。");
            if(get_player().isTaur())
            {
               outputText("你感觉自己被撑得满满的。让你担心的是，痛苦正在让位于快感。你半人马身体的某种本能告诉你，作为一匹母马，你生来就是要被这样填满的。你的小穴就是为了这样的阴茎而生的，这样你就能怀上许多小半人马。");
            }
            else
            {
               outputText("你被撑得太厉害了，血液循环都被切断了，你已经感觉不到[if (tailLeg) {你的尾巴末端|你的腿}]了。");
            }
         }
         outputText("你感觉到那对充满精液的睾丸抽搐了一次，两次，三次。" + phoukaName() + "的前列腺里的压力一定在不断增加。他呻吟着[say: [if (isPregnant) {该喂宝宝了。|也许今天我会给你留个礼物。}]] 当他射精时，那不是一系列顺着尿道涌上的波纹，而是一股长长的、强劲的种马精液。");
         phoukaSexPregnate(param1);
      }
      
      public function phoukaSexGoatChoice() : void
      {
         phoukaSexGoat(false,false);
      }
      
      public function phoukaSexGoat(param1:Boolean, param2:Boolean) : void
      {
         clearOutput();
         if(param1)
         {
            if(param2)
            {
               outputText("你气喘吁吁地渴望着，开始脱下你的[armor]。" + phoukaName() + "带着邪恶的笑容看着这场表演。");
            }
            else
            {
               outputText("你的身体倒在地上，虚弱得无法再反抗" + phoukaName() + "了。");
            }
            if(PhoukaScene.phoukaForm != 2)
            {
               outputText("当你躺在那里时，" + phoukaName() + "的身体拉长并变形，直到它变成了一只巨大的、黑色的" + (get_noFur() ? "无毛" : "长毛") + "山羊形态。");
            }
         }
         else
         {
            outputText("你告诉" + phoukaName() + "你愿意让他在山羊形态下操你的屁股。他笑了笑，降落在你附近。他的身体扭曲成一只黑色的" + (get_noFur() ? "无毛" : "长毛") + "山羊形态。");
            if(get_player().cor <= 50)
            {
               outputText("你脱下[armor]，为即将到来的后庭猛干做好心理准备。");
            }
            else
            {
               outputText("然后你开始表演，一件一件地脱下衣服。你脱下最后一件内衣，弯下腰，向山羊眨了眨你的屁眼。");
            }
         }
         PhoukaScene.phoukaForm = 2;
         get_images().showImage("phouka-sex-goat");
         if(get_player().hasVagina())
         {
            outputText("[pg][say: 哎呀小姑娘，你干嘛这么残忍？你那性感的小穴正求着要根鸡巴呢，]山羊说着，用前腿环抱住你的[if (isTaur) {侧腹|上半身}]。当你盯着他看时，他大笑起来，补充道：[say: 如果你想要的话，我会好好干你的屁股的——别担心。我只是不知道你为什么不想让我进去。]在他开始办正事之前，他光滑的蹄子在你的缝隙上下滑动。[pg]");
         }
         else
         {
            outputText("[pg][say: 我等不及要掠夺你的[butt]了。]山羊说着，用前腿环抱住你的[if (isTaur) {侧腹|上半身}]。[pg]");
         }
         if(param1)
         {
            outputText("他立刻骑上你，不给你任何适应他入侵鸡巴的机会。山羊形态的第一次强力冲刺把你的脸按进了泥里，他试图把狭窄的龟头强行塞进你的屁股。");
         }
         else
         {
            outputText("山羊用龟头摩擦你的雏菊，在你的洞口涂上一层厚厚的先列腺液，然后慢慢地把鸡巴插进去。他最初的几次冲刺足够温柔，让你有机会张开屁股，适应这个入侵者。");
         }
         outputText("令人不安的是，你感觉到他的前“蹄”分裂成坚硬的小手指，环绕着你的[if (isTaur) {肚子|[chest]}]，把你抱得更紧。[pg]");
         if(param1)
         {
            outputText("" + phoukaName() + "对你没有任何兴趣，除了把你当作他精液的容器。在用臀部猛刺了你几次之后，你感觉到他整根鸡巴都插进了你的雏菊里。");
         }
         else
         {
            outputText("一旦你的[butt]适应了，山羊形态就开始更快地冲刺。当你感觉到他的蛋蛋拍打着你的[if (tailLeg) {尾巴|大腿内侧}]时，你感到很惊讶——他不可能已经插得那么深了吧？");
         }
         outputText("一旦山羊的鸡巴插进去，他就停止了动作并绷紧了身体。你感觉到他的鸡巴越来越大，直到你担心你那被虐待的肛门会被撑裂。");
         get_player().buttChange(45,true,true,false);
         outputText("[pg]随着他的鸡巴膨胀到最大尺寸并埋在你的体内，山羊开始前后摇晃。[say: 你觉得怎么样？]" + phoukaName() + "在你耳边咩咩叫着，试图把更多的鸡巴塞进你体内。[if (corruption <= 50) {你无法回答山羊，被撕裂的痛苦太大了}][if (corruption > 50) {你因为被这只肮脏的变形山羊支配而兴奋地喘息着}]。" + phoukaName() + "再次绷紧身体，这一次你感觉到一股浓稠的精液喷射进了你被侵犯的屁股里。");
         if(param1)
         {
            outputText("山羊形态只等了几秒钟，就毫不客气地把正在变软的鸡巴从你的屁股里拔了出来。");
         }
         else
         {
            outputText("意识到你还没有高潮，山羊形态继续在你的屁股里进进出出。空气中弥漫着山羊的精液被吸得更深或被挤出你屁股的吸吮和吧唧声。最后你达到了极限并高潮了[if (hasCock) {，你自己的鸡巴把你身下的泥巴染成了白色}]。");
         }
         dynStats(DynStat.Cor(Utils.rand(2) + (param1 ? 1 : 3)));
         get_player().orgasm("Anal");
         if(param1)
         {
            outputText("在你恢复的时候，山羊形态把手伸进你的宝石袋，抓了一把。");
         }
         outputText("[pg]山羊形态开始溶解并重组。很快你就看到一只小妖精在你面前嗡嗡飞舞。他说：[say: [if (hasVagina) {嗯，我很享受，看起来你也是。下次我抓到你，我真的想试试你的小穴。等不及想看你的肚子被我的精液撑得鼓鼓的了。|帮我们俩一个忙——下次来之前吃点蛋或者喝点奶。既然你这么喜欢做我的母狗，你最好有合适的零件。}]]说完，" + phoukaName() + "嗡嗡地飞进了树冠，消失在视线中。");
         if(param1)
         {
            outputText("[pg]你努力把你的[if (tailLeg) {尾巴|腿}]从冰冷的泥巴里拔出来，以免冻透骨髓。");
            get_combat().cleanupAfterCombat();
         }
         else
         {
            outputText("[pg]你收拾好衣服，连滚带爬地逃出沼泽，生怕再被什么东西盯上。");
            doNext(get_camp().returnToCampUseOneHour);
         }
      }
      
      public function phoukaSexFaeriePostCombat() : void
      {
         phoukaSexFaerie(true);
      }
      
      public function phoukaSexFaerieNonCombat() : void
      {
         phoukaSexFaerie(false);
      }
      
      public function phoukaSexFaerieFemalePostCombat() : void
      {
         phoukaSexFaerieFemale(true);
      }
      
      public function phoukaSexFaerieFemaleNonCombat() : void
      {
         phoukaSexFaerieFemale(false);
      }
      
      public function phoukaSexFaerieFemale(param1:Boolean) : void
      {
         clearOutput();
         outputText("这个妖精看起来没有任何拒绝你命令的余地。你抓住他尖尖的小耳朵来引起他的注意。" + phoukaName() + "看起来被吓了一跳。一个坚定、威严的声音应该就足以让你得到你想要的。你让他知道现在是你说了算，你要以其人之道还治其人之身。他看起来很困惑，然后意识到你打算操他。你问他是否能像森林里的妖精一样变成女人的形状。[pg][say:是啊，我想可以。我们普卡都不喜欢那样做，因为在这一带，如果你有个小穴，总会有人想操你。]");
         if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,1173) == 0)
         {
            FlagDict_Impl_.arrayWriteInt(KFLAGS.flags,1173,1);
         }
         unlockCodexEntry(2734,true,true);
         outputText("你向他指出，不管他有没有小穴，你都要操他。这只普卡试图后退，但意识到他无法从你手中逃脱。");
         outputText("[pg][say:好吧，好吧，给我一秒钟。]他集中注意力，你看到他一英寸长的肉棒开始缩小。很快，你就得到了一个黑皮肤、黑翅膀、黑头发的小妖精女孩，她在森林里看起来也不会太突兀。");
         outputText("[pg]“他”看起来有点不舒服，所以你问他怎么了。[say:咳咳——那个，我们变成女孩比变回来容易得多。我会保持这个样子好几个小时，得试着躲起来免得被强奸。]那可真是太糟糕了。[if (corruption <= 50) {也许当一段时间的女人会给他一个教训}][if (corruption > 50) {你希望这个小强奸犯被连续操上好几个小时。这是他罪有应得，而你当然也要尽你的一份力}]。");
         outputText("[pg]你告诉他你想要更多。你想要“他”能变成的最具女性魅力的妖精。这只普卡盯着你，但他知道自己已经败了。他闭上眼睛，很快他的乳房开始膨胀。虽然两个加起来连个顶针都填不满，但在这么小的身体上，你觉得它们足有B罩杯。");
         outputText("[pg]当普卡再次开口时，他粗犷的声音也变成了妖精那种高亢悦耳的嗓音。[say: 好了，就这样。]他倒吸了一口凉气，瞪大了眼睛。[say: 嘿！我没想改变我的声音。哦，糟糕……我成强奸诱饵了！]他说得对——现在任何人遇到这只普卡，都会把他看作一个非常迷人且诱惑的女性妖精。你对她的窘境[if (corruption <= 50) {强忍着笑意}][if (corruption > 50) {发出一声窃笑}]，开始用手指摩擦她的小穴。普卡向后仰起头，沉浸在这种感觉中。[say: 哦，求、求你了。我受不了了。求你了——变成女孩后我太敏感了。]你感觉到淫液淹没了她的小穴，你把这只妖精推到了高潮的边缘。然后你停了下来，分开她的双腿，看着她那双充满情欲的绿色眼睛。");
         outputText("[pg][say: 求求你让我高潮吧，求你了，大人！]你问她，她的小穴这么小，打算怎么容纳你的肉棒。这只妖精在你的怀里扭动着，拼命想把她的小穴在什么东西上摩擦以寻求释放。[say: 好吧。行！我……我希望这能管用。]她双眼翻白，身体开始膨胀。当她的大腿像气球一样鼓起来时，你松开了手，但普卡似乎太专注了，甚至没有注意到她短暂的自由。她的手臂、腿、头和躯干都在不同的时间拉伸又缩回。看着都觉得疼，但她并没有痛苦地叫喊。当她终于停止变化时，她看起来似乎安然无恙。");
         outputText("[pg]当一切结束时，她大约有四英尺半高，整体看起来很像人类。她的五官很精致");
         if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,119) == 1 || FlagDict_Impl_.arrayReadInt(KFLAGS.flags,126) > 0 || FlagDict_Impl_.arrayReadInt(KFLAGS.flags,123) > 0 || FlagDict_Impl_.arrayReadInt(KFLAGS.flags,124) > 0)
         {
            outputText("，让你想起了瓦拉，尽管瓦拉的胸部要大得多。[pg]");
         }
         else
         {
            outputText("，但她看起来仍然比你在玛瑞斯遇到的大多数人更像人类。[pg]");
         }
         get_images().showImage("phouka-sex-faerie");
         outputText("对你来说，现在最重要的是她那湿透的小穴，看起来非常诱人。趁她躺在那里恢复体力时，你将你的[cock biggest]抵在她的洞口。当你[if (isTaur) {对准你的种马肉棒并向前挺进时，她的眼睛忽闪着睁开了。她仰面在地上滑行，但令你惊讶的是，她用手抓住你的肉柱，将龟头压在她的阴阜上，帮助你刺穿她|用手环住她纤细的腰肢并向前挺进时，她的眼睛忽闪着睁开了}]。[say: 操——好大！]当你强行撑开她的小穴时，她呻吟着。她阴道的肉壁紧紧包裹着你的肉棒痉挛起来，你意识到她已经高潮了。你趁机将大部分体重压在肉棒上，又向里滑进了几英寸。[pg][if (isTaur) {令你惊讶的是，这个发情的妖精女孩的|这个发情的妖精将她抽搐的双腿缠在你的身上。令你惊讶的是，她的}]高潮似乎没有尽头。相反，她的整个身体，从内到外，都在不断地痉挛。你唯一能证明这是高潮而不是某种癫痫发作的证据是，她不停地呻吟和尖叫着[say: 还要！] [say: 对！]，有时还会喊[say: 填满我！][pg]她那富有弹性的小穴不断地挤压和吸吮，感觉就像魅魔能做到的一样棒，很快你就感觉到[balls]里传来一阵熟悉的温暖。\'填满我，\'她用疲惫的气声乞求你。你非常乐意满足这个妖精荡妇。");
         if(get_player().biggestCockLength() < 8)
         {
            outputText("你将你" + int(get_player().biggestCockLength()) + "英寸长的肉棒的最后一英寸推入这个呻吟的荡妇体内。");
         }
         else if(get_player().biggestCockLength() < 15)
         {
            outputText("你将你" + int(get_player().biggestCockLength()) + "英寸长的肉棒的最后一英寸送入她体内。你的龟头撞击着她的子宫颈，身下的荡妇乞求着更多。");
         }
         else
         {
            outputText("你尽可能深地将肉棒插进这个小妖精荡妇体内，但你的肉棒实在太大了，她根本吃不下。");
            if(get_player().cor <= 50)
            {
               outputText("感觉依然棒极了，你用龟头摩擦着她的子宫颈，给了她更多的快感。");
            }
            else
            {
               outputText("[pg]“还不够！”你心想，向后退去准备再次尝试。你把你巨大的勃起当成攻城锤，一次又一次地用龟头猛撞她的子宫颈。妖精尖叫起来，尽管你分不清那是出于快乐还是痛苦。终于，在第五次尝试时，你感觉到她子宫的门户被撞开了。你用尽全力[if (isTaur) {向前挺进，将她压入泥潭中。她浑身瘫软 |拉住她的腰。她在你怀里瘫软下来 }]，但你的肉棒还是强行挤进了她的子宫。");
            }
         }
         outputText("[pg]当你用一股又一股的精液填满她时，你想知道她是否有可能怀孕。[if (corruption > 50) {当然，那现在是她的问题了。}][if (cumNormal) {你感觉到你的精种在你的龟头周围汇聚。}][if (cumMedium) {你感觉到你的精种在你的龟头周围汇聚，并顺着她紧致的肉道流了回来。}][if (cumHigh) {你感觉到她的内脏被撑得更大了，以容纳你的精液。看到她的肚子从平坦变得微微隆起，你露出了微笑。}][if (cumVeryHigh) {不管怎样，清空你的[balls]真是一种解脱。每次你将精液注入她体内，这个妖精女孩就会膨胀一分。她曾经平坦的肚子现在像个圆顶，就像怀了孩子一样。}][if (cumExtreme) {不管怎样，清空你的[balls]真是一种解脱。每次你将精液注入她体内，这个妖精女孩就会膨胀一分。她的肚脐凸了出来，曾经平坦的肚子现在看起来像是怀了三胞胎。}][pg]普卡在你身下呜咽着，仍在经历那漫长而持续的高潮。当你拔出肉棒时，你想知道[if (corruption <= 50) {那会是什么感觉}][if (corruption > 50) {你要怎样才能亲自体验那种感觉}]。[if (cumVeryHigh) {如泉水般的精液从她的小穴中喷涌而出，染白了泥潭的水。}][if (cumExtreme) {如河流般的精液从她的阴道中喷涌而出，染白了泥潭的水。}]她的高潮终于结束了，普卡把一只手放在她的肚子上。[say: 噢噢，感觉太爽了。我都有点怀念当个娘们儿了。]她试图站起来，但惨遭失败。[say: 妈的——你甚至可能让我怀孕了。如果我怀上了，我得保持这副模样好几天！]她看向你。[say: 求求你帮帮我——其他人会强奸我直到我发疯的！][pg]");
         if(get_player().cor <= 33)
         {
            outputText("你当然不想让一个普卡知道你的营地在哪里。你把她扶进灌木丛，告诉她只需要躲几天就行了。");
         }
         else if(get_player().cor <= 66)
         {
            outputText("你大笑着提醒她，这正是她本来想对你做的事。");
         }
         else
         {
            outputText("为什么不让其他普卡也有机会享受她呢？趁她还没完全恢复，你抓起一些树枝和藤蔓。你把她按在地上，用这些东西把她绑得紧紧的。她的手脚被绑在一起，屁股高高翘起，简直是个诱人的靶子。");
         }
         outputText("满意之后，你大步走回营地。");
         dynStats(DynStat.Cor(Utils.rand(2) + 3));
         if(param1)
         {
            get_game().combat.clearStatuses();
            get_game().combat.awardPlayer();
         }
         else
         {
            doNext(get_camp().returnToCampUseOneHour);
         }
      }
      
      public function phoukaSexFaerie(param1:Boolean) : void
      {
         clearOutput();
         outputText("这个妖精看起来没有任何拒绝你命令的余地。你抓住他尖尖的小耳朵来引起他的注意。" + phoukaName() + "看起来很吃惊。一个坚定、威严的声音应该就足以让你得到你想要的。你让他知道现在是你说了算，你决定要感受他的阴茎插进你的[vagOrAss]。" + phoukaName() + "看起来既惊讶又担心。[say: 我……我不知道我现在能不能控制住，]他结结巴巴地说。他集中精神片刻，身形变得模糊，但随后又恢复了原状。你抚摸着他的阴茎，问他能不能只变一次。[say: 呃——也许吧？]当你抚摸他[if (metric) {微小|一英寸长}]的鸡巴时，他皱起眉头，果然你看到它开始变大。然后它像气球一样瘪了下去。[pg]他推开你的手。[say: 给我一秒钟，]他说，现在下定决心要让他的阴茎变大。你开始怀疑他额头上的青筋会不会爆开，突然他的阴茎膨胀到一英尺多长。同样突然地，它又缩小了，他的睾丸膨胀了。然后，它们缩小了，但他的臀部膨胀了。看着都觉得疼。[pg]又过了片刻，他所有的部位都稳定下来，你看到的是一个大得多的" + phoukaName() + "，大约四英尺半高，阴茎和睾丸都只比正常人类的稍大一点。[say: 呵，]他打量着自己说，[say: 这倒是新鲜。我都不知道我能做到这个。]他拉了拉自己的阴茎，抚摸着自己的睾丸，然后宣布，[say: 嗯，一切正常，]并对你笑了笑。[pg]");
         if(get_player().isTaur())
         {
            outputText("你知道你无法真正控制他。一旦他到了你的后腿后面，他就能为所欲为了。在他意识到这一点之前，你转过身，朝他甩了甩尾巴。他咧嘴一笑，手指滑过你的臀部。你让肚子贴在沼泽厚厚的泥潭上，你的伴侣温柔地将他的肉棒滑入你的体内。他一定对半人马略知一二，因为他能变成种马的形态。他的手指开始按摩你后大腿内侧的一些敏感区域。然后他开始用牙齿轻咬你的尾根。你忍不住呻吟起来，他把这当作加快速度的信号。很快，他人类大小的肉棒就开始在你的");
         }
         else
         {
            outputText("为了不让他觉得在这件事上他是平等的伴侣，你把他推倒仰面躺下，然后[if (tailLeg) {用尾巴盘住|跨坐在}]你那真人大小的妖精情人身上，同时脱下你最后一件盔甲。你能感觉到他那又热又硬的肉棒在你的[if (tailLeg) {鳞片|屁股}]上摩擦。也许他还没明白你的意思。算了，反正你已经准备好大干一场了。他已经流出了足够的先列腺液作为润滑，所以你引导他的老二进入你那饥渴的[vagOrAss]。[pg]这只" + phoukaName() + "向上挺动，试图从地上刺穿你。“别再这样了”你心想，把一只手按在他的肚子上。你慢慢地把自己降在这只超大号妖精的肉棒上，希望能比他得到更多的快感。既然你把他按住了，节奏就由你来定。你还控制着他肉棒的角度，确保它能顶到你");
         }
         if(get_player().hasVagina())
         {
            outputText("[vagina]里的所有敏感点。[pg]");
            get_player().cuntChange(20,true);
            get_images().showImage("phouka-sex");
            outputText("当你感觉到" + phoukaName() + "的肉棒在你体内抽动时，你离高潮越来越近了。这混蛋已经到了！");
            phoukaSexPregnate(true);
         }
         else
         {
            outputText("[butt]里的所有敏感点。[pg]");
            get_player().buttChange(20,true);
            get_images().showImage("phouka-sex-goat");
            outputText("你很享受这只妖精的肉棒在你屁眼里滑动的触感。事实上，你太享受了，以至于当他向上猛顶，你能感觉到他的肉棒在抽搐和跳动时，你感到有些惊讶。随着" + phoukaName() + "将一加仑又一加仑的精液泵入你那顺从的屁眼中，你的结肠开始被撑开。你的肚子微微隆起，让你看起来有点像怀孕了。");
            if(get_player().isTaur())
            {
               outputText("当" + phoukaName() + "从你的屁股里拔出，显然准备离开时，你沮丧地叹了口气。他注意到了你的状态，改变了主意。[say: 给我等一下。我会让你爽的，]他说。[say: 毕竟，我还想让你再来找我呢。][pg]他开始自己撸管，嘴里低声嘟囔着什么。当他的肉棒看起来又硬又挺时，他抓住你的侧腰，将整根肉棒再次插进你的体内。随着他在你的直肠里像活塞一样抽插，你感觉到那被压抑的高潮正在积聚，最后你终于高潮了。");
            }
            else
            {
               outputText("你还没满足，等这股精液洪流停止后，你开始真正地骑乘这只和你一样大的妖精。[pg]你根本不给他软下去的机会。当你终于高潮时，你的[if (tailLeg) {尾巴|双腿}]感觉像橡胶一样发软，肌肉也在燃烧。");
            }
            if(get_player().hasCock())
            {
               outputText("[EachCock]将几股精液射入[if (isTaur) {你身下的沼泽中|沼泽中，并喷了你的妖精伴侣一身}]。");
            }
            outputText("[pg]你的括约肌紧紧夹住这个入侵者，不知道是想把它挤出去还是吸得更深，连你自己也说不清。你叹了口气，把一只手放在你的肚子上，里面依然沉甸甸地装满了浓稠的精液。");
            outputText("[pg]你正准备[if (isTaur) {站起来，这时你的伴侣猛地向前挺动|从精疲力竭的伴侣身上滚下来，这时他猛地向上挺动}]他的臀部。猝不及防之下，你试图稳住身体，却感觉到他的双手[if (isTaur) {抓住了你的侧腹|环住了你的腰}]。" + phoukaName() + "第二次高潮了，将又一股精液深深射入你的肠道。你的腹肌根本无法抵挡这波精液的冲击，[if (isTaur) {你感觉沉重的肚子在泥潭里陷得更深了|你向前倒去}]，肚子里塞满了精液，任何人都会以为你怀了双胞胎。不仅如此，你能感觉到肠道里的单向瓣膜一个接一个地屈服，直到一股浓稠香甜的精液喷泉涌入你的胃里。如果" + phoukaName() + "再射一次，你可能就能尝到它的味道了。[pg]你的伴侣推了推你，[if (isTaur) {将他疲软的阴茎从你的直肠中拔出。|把你从他身上推开，气喘吁吁地说，[say:空气，给我空气！]}]他缩回了正常大小，恢复得比你快。离开前，他花时间拍了拍你的肚子。[say:真是太浪费了，小伙子。去吞个蛋吧，粉红色的那种。或者去吸点魅魔的奶。然后你再回到这里，我会给你办个真正的派对。]");
            dynStats(DynStat.Cor(Utils.rand(2) + 3));
            if(param1)
            {
               get_game().combat.clearStatuses();
               get_game().combat.awardPlayer();
            }
            else
            {
               doNext(get_camp().returnToCampUseOneHour);
            }
         }
         get_combat().cleanupAfterCombat();
      }
      
      public function phoukaSexBunnyChoice() : void
      {
         phoukaSexBunny(false,false);
      }
      
      public function phoukaSexBunny(param1:Boolean, param2:Boolean) : void
      {
         clearOutput();
         if(param1)
         {
            outputText("当你瘫倒在地时，" + phoukaName());
            if(PhoukaScene.phoukaForm == 1)
            {
               outputText("跳过来站在你面前");
            }
            else
            {
               outputText("开始在你面前变形。他变换了各种形态，打量着你，最后变成了一只黑色的" + (get_noFur() ? "无毛" : "有毛") + "兔娘");
            }
            outputText("。你看着兔子的勃起变硬，你的");
            if(param2)
            {
               outputText("大脑被欲望淹没，你无法");
            }
            else
            {
               outputText("身体伤痕累累，无法");
            }
            outputText("再做任何抵抗。");
         }
         else if(get_player().cor <= 50)
         {
            outputText("这可能不是最明智的举动，但你决定让" + phoukaName() + "对你为所欲为。你告诉他你更喜欢一点兔子的爱抚，" + phoukaName() + "咧嘴笑到了耳根。[say: 马上就来，]他说");
            if(PhoukaScene.phoukaForm != 1)
            {
               outputText("，然后变成了一只兔子");
            }
            outputText("。希望他能对一个心甘情愿的伴侣温柔一点。");
         }
         else
         {
            outputText("你想不出任何好理由拒绝和这个" + phoukaName() + "在干草堆（或泥潭）里滚混。你告诉他你想感受他那根大兔巴深深地插进你体内。当你开始诱人地脱下你的盔甲时，" + phoukaName() + "咧嘴笑了。");
            if(PhoukaScene.phoukaForm != 1)
            {
               outputText("他做了一系列简短的热身运动，然后变成了你想要的兔子。");
            }
         }
         PhoukaScene.phoukaForm = 1;
         get_images().showImage("phouka-sex-bunny");
         outputText("[pg]兔子向你逼近，说道：[say: 我等不及要把我的精华射进你那漂亮的小穴里了。] 他的爪子分成了手指，你确信这对一只真正的兔子来说绝对是极其痛苦的。兔子的手滑过你的肚子，同时他的鼻子在你的后颈处嗅探。[if (isPregnant) {[say: 他们说怀孕的女孩喜欢做爱。你准备好来点肉了吗？]|他的手指开始挑逗你的[clit]，同时问你，[say: 准备好来点肉了吗？]}]");
         if(get_player().get_lust100() > 80 || get_player().cor > 50)
         {
            outputText("你只能用呻吟来回应。一想到这只兔子要把你填满，你的[vagina]就已经开始流水了。");
         }
         else
         {
            outputText("当兔娘解开固定你[armor]的最后几根带子时，你无力阻止他。");
         }
         outputText("[pg]兔子的大脚踩在你[if (tailLeg) {tail|rump}]的两侧，你感觉到他阴茎的顶端擦过你的小穴。兔子低语道，[say: [if (isPregnant) {该喂宝宝了|也许今天我会给你留个礼物}]。][pg]" + phoukaName() + " [if (tailLeg) {把你向后弯曲，露出你的裂缝。他}][if (isTaur) {用爪子抚摸你的侧腹。接着他}]开始[if (tailLeg) {在你暴露的下腹部|在你的双腿之间}]摩擦他的阴茎，每次都滑过你的[clit]。" + (get_noFur() ? "" : "当他的毛发痒痒地扫过你的[if (tailLeg) {从尾巴根部到尖端的鳞片|腿、背、屁股和大腿}]时，你的脊背一阵发抖。") + "当兔娘准备好时，他对准目标，将他的肉棒塞进你湿润的小穴。");
         if(get_player().hasVirginVagina())
         {
            outputText("当" + phoukaName() + "的阴茎撕裂你的处女膜时，你尖叫起来。他停止了抽插，说道：[say: 处女？在这里？好女神，小姐，你早该告诉我的。] 他压低声音补充道：[say: 这样我就能更享受了。] 你的整个阴道都在燃烧，每一个褶皱都被兔子阴茎的进入撑开拉宽。");
         }
         else if(param1 && get_player().vaginas[0].vaginalLooseness < 2)
         {
            outputText("当" + phoukaName() + "的阴茎在你体内变长变粗时，你几乎痛得晕过去。");
         }
         else if(!param1 || get_player().cor > 50)
         {
            outputText("即使入侵者变得更长更粗，你还是迎合着它顶了回去。[say:好女孩。真是个好小骚货，]" + phoukaName() + "低语道");
         }
         get_player().cuntChange(50,true);
         outputText("[pg]兔子开始用他强壮的腿，以短促有力的动作一次又一次地插进你体内。你被压在泥泞中，沼泽里充满了你的身体拍打泥浆的声音。你不确定自己还能承受多少，直到兔子终于把他的阴茎深深地插进你体内，直达根部。你感觉到他那胀满的睾丸在拍打[if (tailLeg) {你的尾巴根部|你大腿内侧的肉}]时收紧了。");
         phoukaSexPregnate(param1);
      }
      
      public function phoukaSexAddStandardMenuChoices() : void
      {
         addNextButton("兔娘",phoukaSexBunnyChoice).hint("让他变成兔娘来操你。").sexButton(2,false);
         addNextButton("马",phoukaSexHorseChoice).hint("享受他的马屌。").sexButton(2,false);
         addNextButton("山羊",phoukaSexGoatChoice).hint("被山羊操屁股。");
      }
      
      public function phoukaPlayerWins(param1:Boolean) : void
      {
         var _g:PhoukaScene;
         clearOutput();
         if(param1)
         {
            outputText("受了重伤的" + phoukaName() + "向后踉跄，但在你再次攻击之前，它在半空中扭动拉伸，变成一条长长的黑色鳗鱼落到地上。你很确定你听到了鳗鱼在潜入泥沼消失不见时对你的咒骂。[pg]攻击者离开后，你挣扎着用力，试图从缠绕在[legs]周围的厚厚树根和淤泥中挣脱出来。你的下半身湿透了，你决定回家。");
            get_game().combat.clearStatuses();
            get_game().combat.awardPlayer();
         }
         else
         {
            outputText("" + phoukaName() + "瘫倒在地上，开始把他的鸡巴插进泥炭里。");
            if(PhoukaScene.phoukaForm != 0)
            {
               outputText("你正看着，缕缕黑烟开始从他身上升起，他的身体开始缩小。很快");
               if(PhoukaScene.phoukaForm == 1)
               {
                  outputText("兔娘");
               }
               else if(PhoukaScene.phoukaForm == 2)
               {
                  outputText("山羊形态");
               }
               else if(PhoukaScene.phoukaForm == 3)
               {
                  outputText("种马");
               }
               outputText("已经缩小回了" + phoukaNameText("普卡","妖精") + "的大小和形状。");
               PhoukaScene.phoukaForm = 0;
            }
            if(get_player().get_lust() < 33)
            {
               outputText("威胁解除后，你挖开泥土，终于把自己从泥潭中拔了出来。你的下半身湿透了，你渴望坐在营地的火堆前。你扛起补给，原路返回。");
               phoukaLeaveOnLustWin(false);
            }
            else
            {
               outputText("趁他忙着，你把自己从泥潭里拔了出来，一旦自由，你看着那个色欲熏心的" + phoukaName());
               if(get_player().cor < 34)
               {
                  outputText("。你可以满足一下自己，以确保在回家的路上不会分心。");
               }
               else if(get_player().cor < 67)
               {
                  outputText("。你可以利用这个情况来满足你的欲望。");
               }
               else
               {
                  outputText("。强暴这个变态妖精太容易了，你怎么能抗拒呢？");
               }
               menu();
               _g = this;
               addButton(0,"离开",function():void
               {
                  _g.phoukaLeaveOnLustWin();
               });
               addButton(1,"骑乘后庭",phoukaSexFaeriePostCombat);
               if(get_player().hasCock())
               {
                  addButton(2,"操妖精",phoukaSexFaerieFemalePostCombat);
               }
               if(get_player().hasMultiTails())
               {
                  addNextButton("强迫梳毛",get_game().forest.kitsuneScene.kitsuneGenericFluff).hint("让[themonster]给你梳理尾巴。").sexButton(-1);
               }
            }
         }
      }
      
      public function phoukaNameText(param1:String, param2:String) : String
      {
         if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,1173) == 0)
         {
            return param2;
         }
         return param1;
      }
      
      public function phoukaName() : String
      {
         return phoukaNameText("普卡","妖精生物");
      }
      
      public function phoukaMasturbating() : void
      {
         clearOutput();
         outputText("你正在沼泽中漫步，突然听到有人在没命地撸管，那声音错不了。你悄悄靠近那丛灌木，本以为会发现一只终于被自己欲望征服的小恶魔。然而，你看到的却是一只" + phoukaNameText("普卡","小黑妖精") + "正疯狂地自慰。他咕哝着、使劲，但似乎无法射出来。他恼怒地一头扎进灌木丛，从枝头摘下一些成熟的小浆果。这只" + phoukaName() + "把浆果往自己的鸡巴上揉搓，直到鸡巴上滴满了蓝色和黑色的果汁。他把残渣扔到地上，又重新开始手淫。[pg]又过了一分钟左右，他终于在半空中猛地挺动臀部，开始把一股股浓稠的灰色精液射满灌木丛。对于他这么个小东西来说，他射出的精液量实在太多了。他似乎有意把最后几股直接对准了那些浆果。等他完事儿，整个灌木丛看起来就像盖了一层灰白色的糖霜。[pg]那只" + phoukaName() + "满意地说了声[say: 哈！]然后就飞走了。你瞥了一眼灌木丛，决定不会再用沼泽里的浆果做蜜饯了，于是转身回营地去。");
         if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,1173) > 0)
         {
            unlockCodexEntry(2734,true,true);
         }
         doNext(get_camp().returnToCampUseOneHour);
      }
      
      public function phoukaLeaveOnLustWin(param1:Boolean = true) : void
      {
         if(param1)
         {
            clearOutput();
         }
         else
         {
            outputText("[pg]");
         }
         outputText("那个欲火焚身的" + phoukaName() + "继续把他的鸡巴往泥土里操，完全没有注意到你正准备离开。");
         get_game().combat.clearStatuses();
         get_game().combat.awardPlayer();
      }
      
      public function phoukaHalloweenTreacleEater() : void
      {
         clearOutput();
         get_images().showImage("phouka-adventure");
         outputText("你接过杯子，挤压泵。然后你把一点液体倒进嘴里，尝到了一种浓稠甘甜、还有点粘稠的物质。在嘴里转了一圈后，你咽了下去。[say: 看来[he]挺喜欢的。] 头领说。你又喝了一点。喝的时候，你注意到一种难以名状的微妙余味。在那么多的糖分掩盖下，很难分辨出来。[pg][say: 你还想要点吗？] 头领问。[say: 毕竟，和新人分享我们的糖露总是件乐事。] 你又试了一杯，希望能弄清楚那另一种味道是什么。你觉得你应该能想起来。咽下这口后，你注意到了周围普卡的坏笑。你终于恍然大悟——那另一种味道是普卡的精液。普卡们看到你脸上的表情，开始在地上打滚大笑起来。[pg][say: 采糖露！而且[he]还真信了！][pg][say: 哎哟，“抽糖露可是很累人的”。哦，老大你真是绝了！][pg][say: 老大，你又成功了，你真是放长线钓大鱼的大师，没人能反驳。][pg]没错，你被这些长翅膀的小混蛋狠狠地耍了。只有一点涂抹的泥巴掩盖了小桶上刻着的“精液罐”字样。当你气冲冲地走回营地时，你听到头领在后面喊道：[say: 如果你以后还想尝糖露，我这儿还有。只要说一声，我会把它射进你嘴里，而不是你的[if (hasVagina) {小穴|屁股}]里。或者如果你愿意，我们可以把它埋在另一个桶里，再给你盖上油纸。] 他们的笑声一直在你耳边回荡，直到你离开沼泽。");
         doNext(get_camp().returnToCampUseOneHour);
      }
      
      public function phoukaHalloweenLeave() : void
      {
         outputText("[pg]你觉得还是不知道为妙，于是找了个借口，告诉他们可以自己享用糖露。当你走开时，你刚好听到头领对其他人说：[say: 小心点那个家伙，[he]是个聪明人。]");
         doNext(get_camp().returnToCampUseOneHour);
      }
      
      public function phoukaHalloween() : void
      {
         FlagDict_Impl_.arrayWriteInt(KFLAGS.flags,1175,int(get_date().getFullYear()));
         clearOutput();
         outputText("你又一次发现自己正跋涉在沼泽冰冷潮湿的泥潭中。和往常一样，你时刻留意着沼泽里各种各样的居民，但这次却是耳朵先发现了它们。刮擦的声响，大到不可能是从远处传来的，而且节奏规律得不像自然形成的。你做好准备，脑海里想象着各种可能造成这声响的原因。在这个世界没人会费心埋尸体吧？或许是个女巫在刮她的坩埚内壁？等等，你怎么会往那方面想？大概是因为眼下时节吧。");
         outputText("[pg]你悄悄靠近声音的来源，那是从沼泽中突起的一大块坚实的土丘，几乎像个小岛。几棵扭曲的树仍在这里顽强地生存着。你发现的东西令人惊讶。在一小片空地上有半打普卡。其中一个以妖精的形态嗡嗡飞舞，戴着一顶小白帽。其他的则变成了山羊人的形态，正小心翼翼地从某个东西上清理泥土。那个妖精形态的普卡发现了你，站了起来，示意你过去。");
         outputText("[pg][say: 嘿，你好！你来得正是时候。我们正准备戳破糖露呢。看起来量很大，所以我们绝对装不满这些桶。] 你看过去，看到了两个小桶，每个大约只有你营地里水桶的一半大。既然这些普卡看起来很友好（而且现在似乎不想强暴你），你决定走近点看看。[pg]他们挖开了一小块泥土，大约两英尺见方。只挖下去一英尺，就有一层无缝的黑色薄膜。你以前从未见过这样的东西，所以你问他们在做什么。戴白帽的普卡回答道 [say: 你以前没见过开采糖露吗？你以为我们是怎么弄到这么多糖的？][pg]看你还是一脸困惑，他继续说道。[say: 糖露在地下积聚，从树根渗漏成这样的大泡泡。泡泡会形成一层坚硬的黑色糖露外壳，用来保护里面的白色糖露。] 他指了指土壤下的黑色物质。[pg]其中一个山羊人普卡站起来走了过来。[say: 好了，老大，都清理干净了。] 和你说话的普卡嗡嗡地飞到洞口检查了一番。[say: 不错，不错。干得好，一尘不染。泵准备好了吗？] 另一个山羊人点点头，举起一个带有两根软管的泵。[say: 完美！好，两桶糖露马上就来。][pg]他转过身对你补充道 [say: 抽糖露可是很累人的，所以如果你能搭把手，我们就让你吃点剩下的。如果我没猜错的话，下面有那么多，我们都能吃个饱。]");
         if(get_player().get_gender() == 2)
         {
            outputText("[pg]其中一个山羊人普卡转向戴白帽的普卡说道 [say: 女人不应该抽糖露。] 戴白帽的普卡低吼了一声，转过身用他的帽子拍打那个山羊人。[say: 我戴着帽子，我就是这里的老大！我说她能抽，她就能抽！] 老大把帽子重新戴上，山羊人迅速退了下去。");
         }
         outputText("[pg]戴白帽的普卡拔出一把极其锋利的小刀，用它在黑色薄膜上划开一条长长的口子。薄膜微微下陷，一种浓稠的灰白色糖浆开始从裂口处渗出。其中一个山羊人将管子塞进裂口，而拿着泵的那个则将另一根管子塞进其中一个桶里。普卡们开始抽吸，你听到糖露落入桶底时发出湿润的扑通声。空地上弥漫着甜腻的气味，你开始好奇糖露尝起来是什么味道。");
         outputText("[pg]泵在妖精们之间传递，最终传到了你的手中。");
         if(get_player().get_str() < 40)
         {
            outputText("你发现操作起来非常困难，不得不大腿夹紧它，但在把它传给下一个人之前，你还是成功地抽出了相当可观的量。");
         }
         else if(get_player().get_str() < 80)
         {
            outputText("你发现抽糖露确实如普卡所说的那样困难，但你坚持了下来。从你抽出的量来看，你的力气一定和他们一样大。");
         }
         else
         {
            outputText("你不知道他们为什么说这很难。你抽糖露完全没问题；事实上，他们不得不在中途叫停你，好换个桶。");
         }
         outputText("[pg]在大多数普卡轮流抽完之后，桶终于满了，其中一个山羊形态的普卡把软木塞敲进两个桶里。[say: 准备好尝尝糖露了吗？] 头领问道，把管子的一端和一个小杯子递给你。");
         if(get_player().get_inte() > 80)
         {
            outputText("[pg]你正要接受，却注意到后面几个普卡看你的眼神。你认得这种眼神，以前在英格纳姆停下来卖货的商人就是这么看人的。那是“每分钟都有一个傻瓜诞生”的眼神。你意识到这些普卡连一口糖露都没尝过，你开始怀疑这种含糖物质到底是什么。");
         }
         if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,1173) > 0)
         {
            unlockCodexEntry(2734,true,true);
         }
         menu();
         addButton(0,"品尝",phoukaHalloweenTreacleEater);
         if(get_player().get_inte() > 80)
         {
            addButton(1,"退后",phoukaHalloweenLeave);
         }
      }
      
      public function phoukaFaerieFireLeave() : void
      {
         if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,1172) == 0)
         {
            outputText("[pg]你决定最好别去招惹沼泽里那些奇怪的浮游光点，于是返回了营地。");
         }
         else
         {
            outputText("[pg]此刻你觉得自己没必要再去遇见那些" + phoukaNameText("普卡","生物") + "了。");
         }
         doNext(get_camp().returnToCampUseOneHour);
      }
      
      public function phoukaFaerieFire() : void
      {
         clearOutput();
         get_images().showImage("phouka-encounter");
         outputText("正当你跋涉在沼泽中时，远处一道闪烁的光芒吸引了你的视线。");
         if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,1172) != 0)
         {
            outputText("你回想起了上次在沼泽里遇到这种“灯笼”的情景。");
            outputText("[pg]也许最好还是别去管这妖精之火了。");
         }
         else
         {
            outputText("它似乎在沼泽中一处茂密的地方移动，那里的枯树冠和蔓生的藤蔓即使在正午也制造出如黄昏般深邃的阴影。[pg]你看不清是谁拿着光，但你决定跟上去。你心想，那可能是像你一样的人，或者是恶魔的某种代理人，这种想法驱使着你，你不断试图追上前面的光。这次沼泽之旅即将有所收获。");
            if(get_player().hasKeyItem("Traveler\'s Guide"))
            {
               outputText("[pg]突然，《旅行者指南》中的警告在你的脑海中闪现。指南上说，沼泽和泥沼中闪烁的灯光只是沼气，除非它们是更糟糕的东西。好心肠的旅行者如果跟着它们走，能毫发无伤地逃脱就算是幸运的了。");
               outputText("[pg]也许最好还是别去管这妖精之火了。");
            }
         }
         if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,1173) > 0)
         {
            unlockCodexEntry(2734,true,true);
         }
         menu();
         if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,1172) != 0 || get_player().hasKeyItem("Traveler\'s Guide"))
         {
            addButton(1,"后退",phoukaFaerieFireLeave);
         }
         addButton(0,"跟随",phoukaStuck);
      }
      
      public function phoukaEncounter() : void
      {
         PhoukaScene.phoukaForm = 0;
         var _loc1_:int = 0;
         if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,1172) == 0)
         {
            FlagDict_Impl_.arrayWriteInt(KFLAGS.flags,1175,int(get_date().getFullYear()) - 1);
            FlagDict_Impl_.arrayWriteInt(KFLAGS.flags,1170,0);
            FlagDict_Impl_.arrayWriteInt(KFLAGS.flags,1171,0);
         }
         else if(int(get_date().getMonth()) > 4 && int(get_date().getMonth()) < 11)
         {
            _loc1_ = Utils.rand(7);
         }
         else
         {
            _loc1_ = Utils.rand(6);
         }
         if(_loc1_ < 2)
         {
            phoukaFaerieFire();
         }
         else if(_loc1_ < 5)
         {
            phoukaStuck();
         }
         else
         {
            phoukaMasturbating();
         }
      }
      
      public function phoukaDrinkWhilePregnant(param1:Boolean) : void
      {
         if(get_player().get_pregnancyIncubation() <= 100 || get_player().get_buttPregnancyIncubation() <= 100)
         {
            outputText("[pg][say:给]他说，递给你满满一杯威士忌，[say:给那小宝宝它需要的。你想让它长得壮实，不是吗？]");
         }
         var _loc2_:int = get_consumables().P_WHSKY.phoukaWhiskeyAcceptable(get_player());
         if(_loc2_ < 0)
         {
            outputText("[pg]你想到你怀着的未出生的孩子" + (_loc2_ <= -3 ? "们" : "") + "。");
            if(_loc2_ == -4)
            {
               outputText("其中一个似乎渴望威士忌，但另一个是更正常的孩子。");
            }
            outputText("当然，村里的一些长者说过，啤酒或淡苹果酒对孕妇来说没问题，但你怀疑威士忌是否合适。你礼貌地拒绝了这杯酒，希望普卡不会生气。");
         }
         else
         {
            outputText("[pg]你一只手放在肚子上，准备拒绝这杯酒。然后你意识到，没错，这正是你的");
            if(_loc2_ <= 2)
            {
               outputText("宝宝需要的。来自你" + (_loc2_ == 2 ? "膨胀的结肠" : "子宫") + "里的轻轻踢动表明你的孩子知道");
            }
            else
            {
               outputText("宝宝们需要的。来自你子宫和膨胀结肠里的轻轻踢动表明你的孩子们知道");
            }
            outputText("有什么在等着。 [say: 来吧，快喝点吧。我尽量不独自喝酒。不然最后总是会被小恶魔或蛛化精灵什么的给操了。]");
         }
         menu();
         addButton(0,"拒绝",param1 ? phoukaDrinkRefuseAfterOffer : phoukaDrinkRefuse);
         if(_loc2_ != 0)
         {
            addButton(1,"喝",phoukaDrinkAccept);
         }
      }
      
      public function phoukaDrinkTalk(param1:Boolean) : void
      {
         var _loc2_:* = null as IMap;
         if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,1173) == 1)
         {
            _loc2_ = KFLAGS.flags;
            FlagDict_Impl_.arrayWriteInt(_loc2_,1173,FlagDict_Impl_.arrayReadInt(_loc2_,1173) + 1);
            outputText("[pg]从他讲述的故事中，你了解到普卡曾经非常清醒，并且会指导定居者如何在这片泥泞潮湿的土地上生存。人们甚至在路过时也会把他们视为吉兆。普卡在讲述这段历史时嗤之以鼻，评论道：[say:一群他妈的灵魂向导，把时间浪费在那些榆木脑袋的蠢货身上。]");
            outputText("[pg]如今，他们把大量时间花在操逼和尝试各种不同的药水和草药上，试图改进他们酿造各种酒精饮料的配方。最初他们喜欢的是兽人格洛格酒，但这只不过是为了让唯一能喝的沼泽水变得可以忍受而强行掺入朗姆酒的做法。随着他们自己进行实验，他们开始偏爱威士忌，尽管他们也酿造许多不同的混合饮料。");
            outputText("[pg]随着酒意渐浓，他开始跑题，把妖精们称为他的精液荡妇表亲，好几个故事都是关于一个或多个普卡把妖精灌得烂醉，然后占她们便宜。他说，可惜妖精们现在不再上“隐形酒”的当了。");
         }
         else if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,1173) == 2)
         {
            _loc2_ = KFLAGS.flags;
            FlagDict_Impl_.arrayWriteInt(_loc2_,1173,FlagDict_Impl_.arrayReadInt(_loc2_,1173) + 1);
            outputText("[pg]这只普卡似乎算个酿酒师，至少在不诱捕强奸受害者的时候是这样。他告诉你，他在沼泽里采集某种白色的蔬菜球茎，还总在留意黏土块和沼铁块，好用来做他们蒸馏器的零件。看来沼泽里的泥炭干透后烧得很旺，燃料根本不愁。");
            outputText("[pg]他说最难的是找木材做陈酿威士忌的酒桶。森林里那些“贱蝴蝶”们不乐意普卡砍树。");
         }
         else if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,1173) == 3)
         {
            _loc2_ = KFLAGS.flags;
            FlagDict_Impl_.arrayWriteInt(_loc2_,1173,FlagDict_Impl_.arrayReadInt(_loc2_,1173) + 1);
            outputText("[pg]尽管沼泽湿气重，等你渐渐感到暖和舒坦后，这只普卡开始更详细地讲起他那些妖精表亲。你早就知道普卡最爱做的事，就是一旦能单独逮着森林妖精就强奸她们，但这只讲得更细。");
            outputText("[pg]他告诉你，妖精本应该是在一场“充满魔法火花的他妈的仪式”之后，从特殊的花朵中诞生的。[say:当恶魔来的时候，他们不喜欢妖精如此纯洁无瑕，甚至不需要做爱就能生孩子。] 他说着，脸上绽放出灿烂的笑容，[say:他们不知道的是，妖精一直都有孕育婴儿的所有合适器官，只需要另一个妖精让她们怀孕就行了。]");
            outputText("[pg][say: 反正，发生过最棒的事，就是有个恶魔一度动了动脑子，没光顾着干炮。我不知道它想出了什么变态配方，反正它们用这配方造出了我们这几个真他妈精力旺盛的家伙。]他边讲边抓住自己的裤裆晃了晃，说道：[say: 我是说真他妈雄性激素爆棚，懂我意思吧，" + get_player().mf("女士","姑娘") + "。]你觉得自己算明白他的意思了。");
            outputText("[pg]普卡重新坐下，又灌了一大口威士忌，然后继续说道。[say: 我们试着和那些自命不凡的婊子分享大鸡巴的快乐，可她们满脑子想的都是怎么“治愈”我们。] 这只兔娘像骂人一样吐出最后一个词。[say: 治愈个屁啊？我们现在整天就是喝酒操逼，快活得像没有明天一样。总之，只要我们发现她们落单，就会把那些小巧玲珑的美人儿抓起来关进笼子里，然后灌她们威士忌，直到她们醉得不省人事。接着，我们给她们喂里扎根，直到她们膨胀得和我们一样大。最后，我们把精液射进她们体内，直到她们的肚子鼓得像个苹果。我跟你说，那场面可真是壮观。]");
         }
         else if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,1173) == 4)
         {
            outputText("[pg]你问普卡他们是怎么繁衍后代的。难道是一个普卡变形成女人，然后由她来怀孩子吗？");
            outputText("[pg]普卡笑了起来，但你感觉那笑声并不完全是开心的。[say: 那招不太管用，倒不是我们没试过。] 他往后靠了靠，又喝了一口酒才继续说。[say: 我们试过各种药水之类的东西。都没用。两个普卡就是生不出孩子。我们最接近成功的一次，是一个普卡花了三天时间拉出那些彩色的小蛋。虽然在某些方面挺方便的，但还是没孩子。不，我们制造更多普卡的唯一方法就是抓住并强奸妖精。这就是为什么我们这么擅长干这个！而且我觉得她们中有些人还挺享受的。就算我们让她们怀上了，她们也可能逃跑，在孩子生出来之前用妖精露水或者那种超甜的蜂蜜净化自己。] 他心不在焉地撸了几下自己的鸡巴，说道：[say: 也许我在树林里还有几个女儿呢。谁知道呢。]");
         }
         if(!param1 && get_player().get_tou() < 70)
         {
            outputText("[pg]当瓶子里的酒喝光后，兔娘站起身来，差点又摔倒，交叉着双眼看着你。[say:好吧，这就对了。这就跟旧时代的派对一样。你待在这儿，我去找点更多的酒，也许再叫上我的一些哥们儿。好酒，好派对。就该这样！]说完，兔娘融化开，" + (get_noFur() ? "" : "一团旋转的黑色皮毛") + "慢慢地收缩并重新变回一只小小的黑色妖精。他挥挥手，沿着一条看起来危险极了、歪歪扭扭的路线穿过树林飞走了。[pg]当威士忌带来的醉意开始消退，你意识到[if (corruption <= 66) {留下来恐怕不是个好主意}][if (corruption > 66) {如果你想走，是可以溜掉的}]。如果你这位新酒友当真带些朋友回来，你大概会体验到那种“派对”——会让你说话时下巴咯噔作响，满身各处酸痛一整个星期。");
            menu();
            addButton(0,"离开",phoukaDrinkLeave);
         }
         else
         {
            if(param1)
            {
               outputText("[pg]故事继续，这个普卡妖精越来越醉，最后他彻底醉倒了。");
            }
            else
            {
               outputText("[pg]当你又喝下一杯威士忌时，普卡妖精醉倒在地，彻底醉了。你已经感觉到酒劲上来了，但你的酒友已经不行了。");
            }
            outputText("他发出一声轻笑，然后开始缩小。缕缕黑烟从他这个兔娘的黑色" + (get_noFur() ? "皮肤" : "毛发") + "升起，同时他缩回到妖精的大小和形状。");
            PhoukaScene.phoukaForm = 0;
            if(get_player().get_lust() < 33)
            {
               outputText("看来他需要小睡一会儿，而你也把这当作离开的信号。");
            }
            else
            {
               outputText("[pg]你看着沉睡的普卡妖精");
               if(get_player().hasCock())
               {
                  outputText(", [eachCock]开始胀大" + (get_player().hasVagina() ? "，你的[vagina]也开始变得湿润" : "") + "。");
               }
               else if(get_player().hasVagina())
               {
                  outputText("，你的[vagina]开始变得湿润。");
               }
               else
               {
                  outputText("你感觉到括约肌一阵抽动，脑海中开始想象现在可以对这只普卡做些什么。");
               }
            }
            menu();
            setSexLeaveButton(phoukaDrinkLeave,"离开",0);
            if(get_player().get_lust() >= 33)
            {
               addButton(1,"骑乘妖精",phoukaSexFaerieNonCombat);
               if(get_player().hasCock())
               {
                  addButton(2,"操弄小妖精",phoukaSexFaerieFemaleNonCombat);
               }
            }
         }
      }
      
      public function phoukaDrinkRefusePregnantLeave() : void
      {
         clearOutput();
         outputText("[say:啊，操。你真是个扫兴的家伙。你不知道肚子里有货的时候才是挨操的最佳时机吗？][pg]黑兔娘不耐烦地挥手赶你走。[say:行吧，行吧，回家去吧。我希望那小杂种生出来的时候疼死你。我本来可以把你撑得舒舒服服的。]");
         doNext(get_camp().returnToCampUseOneHour);
      }
      
      public function phoukaDrinkRefuseLeave() : void
      {
         clearOutput();
         outputText("你在普卡改变主意之前，从泥泞中挣脱出来，离开了沼泽。");
         doNext(get_camp().returnToCampUseOneHour);
      }
      
      public function phoukaDrinkRefuseAfterOffer() : void
      {
         clearOutput();
         outputText("普卡看起来很失望，但他还是一饮而尽其中一杯，说道：[say:怎么怀孕的妞都这么死板？]他开始抿第二杯，看了你一眼，轻笑起来。[say:不过你倒是有个好借口——你确实陷在泥里了！]普卡继续喝着，没过多久就开始回忆往事。");
         phoukaDrinkTalk(true);
      }
      
      public function phoukaDrinkRefuse() : void
      {
         clearOutput();
         if(get_player().get_pregnancyIncubation() > 0 && get_player().get_pregnancyIncubation() <= 100)
         {
            outputText("这个兔兽人重重地坐在湿漉漉的地上，抿了一口酒。[say:不想操，也不想喝。怎么回事？放开点，让我好好玩玩你那怀孕的小穴。我会让你爽上天的，而且我又不可能让你再怀一次。当然，那样也会很有趣。]");
            menu();
            phoukaSexAddStandardMenuChoices();
            addButton(14,"离开",phoukaDrinkRefusePregnantLeave);
         }
         else
         {
            outputText("[say: 你这该死的假正经。够了！我才懒得坐在这儿听你废话。有人总说要我先对你好点，别上来就强奸。结果呢？我得到了什么，嗯？]");
            if(get_player().get_lust100() > 66 || get_player().cor > 50 && get_player().get_lust() > 33)
            {
               outputText("[pg]你开始从沼泽中挣脱出来。过程中你感觉到根藤交织的网在你身上摩擦。和这个变形者来上一小段床事，帮你解解闷或许正合你意。");
               menu();
               phoukaSexAddStandardMenuChoices();
            }
            else
            {
               menu();
            }
            addButton(14,"离开",phoukaDrinkRefuseLeave);
         }
      }
      
      public function phoukaDrinkLeave() : void
      {
         if(get_player().get_lust() < 33)
         {
            outputText("[pg]如果你再饥渴一点");
         }
         else
         {
            outputText("[pg]如果你想的话");
         }
         outputText("你完全可以趁这只小妖精处境尴尬时占点便宜，但现在你更想去检查一下那个传送门。多亏了威士忌，当你步履蹒跚地返回营地时，浸泡着你[legs]的冷水对你来说也没那么在意了。");
         doNext(get_camp().returnToCampUseOneHour);
      }
      
      public function phoukaDrinkAccept() : void
      {
         clearOutput();
         get_images().showImage("item-whiskey");
         outputText("你接过杯子，小心地闻了闻。谁知道普卡在这里面放了什么？这气味让你想起家乡老杂货铺里的某种味道。你尝了一口，发现这用沼泽水和泥炭酿出来的东西竟然异常顺滑。黑兔娘对你露出一个歪斜的笑容，在你身边坐下，又倒了些烈酒。");
         outputText("[pg]等到你和普卡喝掉半瓶酒的时候，你们俩都感觉好多了。");
         get_player().slimeFeed();
         switch(get_consumables().P_WHSKY.phoukaWhiskeyDrink(get_player()))
         {
            case 0:
               dynStats(DynStat.Lust(Utils.rand(5) + 1),DynStat.Cor(Utils.rand(2) + 1));
               break;
            case 1:
               outputText("你腹中涌起的一股暖流表明，你身体里的小乘客也饱餐了一顿。");
               break;
            case 2:
               outputText("起初，你感觉到腹中的宝宝在抗拒威士忌，但随后它似乎变得满足，享受了起来。");
               break;
            case 3:
               outputText("你感到恶心，想吐。腹部传来一阵疼痛，你意识到你怀着的宝宝一点儿也不喜欢这东西。");
         }
         var _loc1_:IMap = KFLAGS.flags;
         FlagDict_Impl_.arrayWriteInt(_loc1_,1174,FlagDict_Impl_.arrayReadInt(_loc1_,1174) + 1);
         get_consumables().P_WHSKY.phoukaWhiskeyAddStatus(get_player());
         if(get_player().get_tou() < 30)
         {
            outputText("[pg]你很快就喝醉了，开始漫无边际地讲述你的冒险故事。普卡是个很好的倾听者，不过每当你提到性或任何潜在的性行为时，他都会询问很多细节。你意识到自己遇到大麻烦了，你被激起了性欲，看着普卡抚摸着他的肉棒，尽管他喝了那么多酒，那东西依然坚挺。他注意到了你的兴趣，说道：[say:既然你已经放松下来了，那我们就进入正餐吧。我会确保你即使清醒了也会记得的。]");
            menu();
            phoukaSexAddStandardMenuChoices();
         }
         if(get_player().get_tou() < 70)
         {
            outputText("看起来普卡的酒量和你差不多。");
         }
         else
         {
            outputText("看来你的酒量比普卡好。");
         }
         outputText("很快，你们俩开始分享各自在玛瑞斯的冒险故事。");
         phoukaDrinkTalk(false);
      }
   }
}

