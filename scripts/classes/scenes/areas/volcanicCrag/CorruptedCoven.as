package classes.scenes.areas.volcanicCrag
{
   import classes.BaseContent;
   import classes.CoC;
   import classes.CockTypesEnum;
   import classes.DebugMenu;
   import classes.Output;
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
   import classes.items.JewelryLib;
   import classes.items.WeaponLib;
   import classes.saves.SelfSaver;
   import classes.saves.SelfSaving;
   import classes.scenes.Camp;
   import classes.scenes.Inventory;
   import classes.scenes.areas.volcanicCrag._CorruptedCoven.SaveContent;
   import coc.view.CoCButton;
   import flash.Boot;
   import haxe.IMap;
   import haxe.ds.IntMap;
   
   public class CorruptedCoven extends BaseContent implements TimeAwareInterface, SelfDebug, SelfSaving
   {
      
      public static var MET_CIRCE:int = 1;
      
      public static var TOLD_NAME:int = 2;
      
      public static var TALKED_MARAE_BLESS:int = 4;
      
      public static var TALKED_FERA_BLESS:int = 8;
      
      public static var TALKED_JEREMIAH_WEAPONS:int = 16;
      
      public static var TALKED_LAURENTIUS_INCIDENT:int = 32;
      
      public static var TALKED_MANOR_DULLAHAN:int = 64;
      
      public static var TALKED_CORRWITCH_HEX:int = 128;
      
      public static var TALKED_TELADRE_WIZARDS:int = 256;
      
      public static var TALKED_GARGOYLE:int = 512;
      
      public static var TALKED_SANDWITCH_BLESS:int = 1024;
      
      public static var TALKED_KITSUNE_ENLIGHTEMENT:int = 2048;
      
      public static var TALKED_DOMINIKA_SWORD:int = 4096;
      
      public static var TALKED_NAMELESS_HORROR:int = 8192;
      
      public static var CAUGHT_ALCHEMY:int = 16384;
      
      public static var GOT_RING_OF_ETHEREAL_TEARING:int = 32768;
      
      public static var GOT_MAJOR_RING_OF_ACCURACY:int = 65536;
      
      public static var GOT_SPECTRE_RING:int = 131072;
      
      public static var BROUGHT_JEREMIAH_BACK:int = 262144;
      
      public static var HAD_SEX_ONCE:int = 524288;
      
      public static var BROUGHT_DULLAHAN:int = 1048576;
      
      public static var RETURNED_DULLAHAN_POSTDREAM:int = 2097152;
      
      public static var TALKED_BEAUTIFUL_SWORD:int = 4194304;
      
      public static var BROUGHT_MANOR_BOOKS:int = 8388608;
      
      public var saveVersion:int;
      
      public var saveName:String;
      
      public var saveContent:SaveContent;
      
      public var globalSave:Boolean;
      
      public function CorruptedCoven()
      {
         if(Boot.skip_constructor)
         {
            return;
         }
         globalSave = false;
         saveVersion = 1;
         saveName = "circe";
         saveContent = new SaveContent(null,null);
         super();
         CoC.timeAwareClassAdd(this);
         SelfSaver.register(this);
         DebugMenu.register(this);
      }
      
      public function updateTopic(param1:int) : void
      {
         var _loc2_:* = null as IMap;
         if((FlagDict_Impl_.arrayReadInt(KFLAGS.flags,2675) & param1) == 0)
         {
            _loc2_ = KFLAGS.flags;
            FlagDict_Impl_.arrayWriteInt(_loc2_,2675,FlagDict_Impl_.arrayReadInt(_loc2_,2675) | param1);
            _loc2_ = KFLAGS.flags;
            FlagDict_Impl_.arrayWriteInt(_loc2_,2706,FlagDict_Impl_.arrayReadInt(_loc2_,2706) + 1);
            FlagDict_Impl_.arrayWriteInt(KFLAGS.flags,2708,48);
         }
      }
      
      public function topicTalkOptions() : void
      {
         var _g13:CorruptedCoven;
         var topic12:int;
         var _g12:CorruptedCoven;
         var topic11:int;
         var _g11:CorruptedCoven;
         var topic10:int;
         var _g10:CorruptedCoven;
         var topic9:int;
         var _g9:CorruptedCoven;
         var topic8:int;
         var _g8:CorruptedCoven;
         var topic7:int;
         var _g7:CorruptedCoven;
         var topic6:int;
         var _g6:CorruptedCoven;
         var topic5:int;
         var _g5:CorruptedCoven;
         var topic4:int;
         var _g4:CorruptedCoven;
         var topic3:int;
         var _g3:CorruptedCoven;
         var topic2:int;
         var _g2:CorruptedCoven;
         var topic1:int;
         var _g1:CorruptedCoven;
         var topic:int;
         var _g:CorruptedCoven;
         var _loc1_:* = null as Function;
         menu();
         if(get_player().hasMaraeBless())
         {
            _g = this;
            topic = CorruptedCoven.TALKED_MARAE_BLESS;
            addNextButton("玛莱",function():void
            {
               _g.talkAbout(topic);
            }).hint("谈论玛莱和她的祝福。");
         }
         if(get_player().hasFeraBoon())
         {
            _g1 = this;
            topic1 = CorruptedCoven.TALKED_FERA_BLESS;
            addNextButton("菲拉的恩赐",function():void
            {
               _g1.talkAbout(topic1);
            }).hint("谈论菲拉，以及她那可疑的“恩赐”。");
         }
         if((FlagDict_Impl_.arrayReadInt(KFLAGS.flags,2683) & 0x0200) != 0 && !get_player().hasKeyItem("Talisman of the Flame"))
         {
            _g2 = this;
            topic2 = CorruptedCoven.TALKED_JEREMIAH_WEAPONS;
            addNextButton("审判官",function():void
            {
               _g2.talkAbout(topic2);
            }).hint("谈论审判官，以及耶利米精湛的奥术锻造技艺。");
         }
         if((FlagDict_Impl_.arrayReadInt(KFLAGS.flags,2683) & 0x0800) != 0)
         {
            _g3 = this;
            topic3 = CorruptedCoven.TALKED_LAURENTIUS_INCIDENT;
            addNextButton("劳伦提斯",function():void
            {
               _g3.talkAbout(topic3);
            }).hint("谈论你与劳伦提斯的遭遇……或者说他剩下的部分。");
         }
         if((FlagDict_Impl_.arrayReadInt(KFLAGS.flags,2671) & 0x80) != 0)
         {
            _g4 = this;
            topic4 = CorruptedCoven.TALKED_MANOR_DULLAHAN;
            addNextButton("庄园",function():void
            {
               _g4.talkAbout(topic4);
            }).hint("谈论无头骑士、死灵法师，以及庄园里发生的可怕事件。");
         }
         if(get_player().hasPerk(PerkLib.Revelation))
         {
            _g5 = this;
            topic5 = CorruptedCoven.TALKED_NAMELESS_HORROR;
            addNextButton("恐怖",function():void
            {
               _g5.talkAbout(topic5);
            }).hint("谈论你在无限深渊最深处发现的不可名状的……<i>东西</i>。");
         }
         if(get_player().hasPerk(PerkLib.PotentPregnancy) || get_player().hasPerk(PerkLib.PotentProstate))
         {
            _g6 = this;
            topic6 = CorruptedCoven.TALKED_CORRWITCH_HEX;
            addNextButton("峭壁女巫",function():void
            {
               _g6.talkAbout(topic6);
            }).hint("谈论堕落女巫对你施加的诅咒，以及她们总体的困境。");
         }
         if(get_player().hasStatusEffect(StatusEffects.TelAdre))
         {
            _g7 = this;
            topic7 = CorruptedCoven.TALKED_TELADRE_WIZARDS;
            addNextButton("特尔阿德雷",function():void
            {
               _g7.talkAbout(topic7);
            }).hint("谈论特尔阿德雷以及巫师们在那里设置的屏障。");
         }
         if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,830) > 0)
         {
            _g8 = this;
            topic8 = CorruptedCoven.TALKED_GARGOYLE;
            addNextButton("石像鬼",function():void
            {
               _g8.talkAbout(topic8);
            }).hint("谈论你在大教堂发现的石像鬼。");
         }
         if(get_player().hasPerk(PerkLib.MagicalVirility) || get_player().hasPerk(PerkLib.MagicalFertility))
         {
            _g9 = this;
            topic9 = CorruptedCoven.TALKED_SANDWITCH_BLESS;
            addNextButton("沙漠女巫",function():void
            {
               _g9.talkAbout(topic9);
            }).hint("谈论沙漠女巫，以及她们其中一位精液女巫赐予的祝福。");
         }
         if(get_player().hasPerk(PerkLib.EnlightenedNinetails) || get_player().hasPerk(PerkLib.CorruptedNinetails))
         {
            _g10 = this;
            topic10 = CorruptedCoven.TALKED_KITSUNE_ENLIGHTEMENT;
            addNextButton("狐妖",function():void
            {
               _g10.talkAbout(topic10);
            }).hint("谈论你作为狐妖冥想后获得的知识。");
         }
         if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,416) == 1)
         {
            _g11 = this;
            topic11 = CorruptedCoven.TALKED_DOMINIKA_SWORD;
            addNextButton("多米妮卡",function():void
            {
               _g11.talkAbout(topic11);
            }).hint("谈谈多米妮卡，以及她赠予你的那把非凡之剑。");
         }
         if(get_player().hasItemIncludeEquipped(get_weapons().B_SWORD))
         {
            _g12 = this;
            topic12 = CorruptedCoven.TALKED_BEAUTIFUL_SWORD;
            _loc1_ = function():void
            {
               _g12.talkAbout(topic12);
            };
            addNextButton(get_weapons().B_SWORD.get_shortName(),_loc1_).hint("谈谈你在湖边找到的那把剑。");
         }
         _g13 = this;
         addButton(14,"返回",function():void
         {
            _g13.buildOptionsMenu();
         });
      }
      
      public function timeChangeLarge() : Boolean
      {
         return false;
      }
      
      public function timeChange() : Boolean
      {
         var _loc1_:IMap = KFLAGS.flags;
         FlagDict_Impl_.arrayWriteInt(_loc1_,2708,FlagDict_Impl_.arrayReadInt(_loc1_,2708) - 1);
         if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,2708) < 0)
         {
            FlagDict_Impl_.arrayWriteInt(KFLAGS.flags,2708,0);
         }
         return false;
      }
      
      public function tavernWench() : void
      {
         clearOutput();
         outputText("[say: 我明白了。那么，好吧。]");
      }
      
      public function talkAbout(param1:int) : void
      {
         var clearOutputText:Boolean;
         var _g:CorruptedCoven;
         clearOutput();
         var _loc2_:int = param1;
         if(_loc2_ == CorruptedCoven.TALKED_BEAUTIFUL_SWORD)
         {
            outputText("你告诉她，你有一件对任何研究腐化的人都绝对有吸引力的物品。她挑起一侧眉毛，好奇心油然而生。[say: 那么，这就是我们做这些的目的，对吧？是什么？][pg]你解下身上的绝美之剑，连着剑鞘展示给她看，并告诉她这是你在玛莱居住的湖边找到的。她伸出手想拿，但似乎有什么阻止了她，她颤抖了一下。你看着她的脸，发现她显得很困惑；她不明白是什么阻止了她。[pg][say: 你有没有过一种突然被恐惧笼罩的感觉？一种全方位的焦虑，就好像你突然意识到有人，或者有什么东西，正在某个未知的地方注视着你？][pg]你点点头。你想每个人在某个时刻都会有这种感觉。[pg][say: 看着这把剑……它就给了我那种感觉。它强烈地冲击着我。你到底给我带来了什么，[name]？][pg]你觉得没必要再拖延了。你有条不紊地拔出武器。随着剑身一寸寸露出，喀耳刻的目光越来越窄，明显的恶心感占据了她。当剑刃完全显露时，她几乎是在皱眉。她发出一声短促的呻吟，闭上眼睛，深呼吸，恢复了更平静、更熟悉的面容。[pg][say: 我能感觉到——那把剑里蕴含着对腐化的燃烧般的仇恨。我敢打赌，如果你不小心把它扔过房间，它也会想方设法找到我的喉咙。]");
            if(get_player().cor > 50)
            {
               outputText("[say: 你感觉不到吗？你自己也相当腐化了。我很难相信你竟然能把它带给我；我很确定我无法长时间握住它。][pg]你告诉她，尽管这把剑在你试图挥舞它时会反击你，但它并没有给你带来任何恶心或恐惧。她把一根手指放在下唇上，轻轻地来回摩擦，试图理解这种情况。[pg][say: 也许我对这种能量比你更敏感，要么是因为我接受了更多的腐化，要么是因为我只是对它研究得更多。对世界更深刻的洞察力让你能看到你以前看不到的恐怖，在你想不到的地方。]");
               outputText("[pg]你想了一会儿，点了点头。反正你们俩都不太可能详细检查这把剑以了解真相。");
            }
            else
            {
               outputText("[say: 尽管我说了关于腐化的话，但你自己没有被污染是件好事。我不希望任何我不认为是敌人的人有这种感觉。][pg]你告诉她，如果有的话，这把剑让你在挥舞它时感觉更英雄、更充满活力。她深深地咽了一口唾沫，似乎在试图压制恶心感。[pg][say: 好吧，我只希望你下次来这里时不要感觉自己是个英雄。] 她轻声笑了。");
            }
            outputText("[pg]她示意你再次把剑收回鞘中，带着一种绝望的气息。你照做了，尽管你花的时间可能比她希望的要长。她闭上眼睛，整理着被恶心感打散的思绪。最后深吸一口气，她再次睁开眼睛，准备进行理论推导。");
            outputText("[pg][say: 尽管我的身体感到厌恶，但那把武器确实是独一无二的。你说你在玛莱的岛边找到的？那不可能是巧合。]");
            outputText("[pg]你同意。也许这把剑是玛莱亲自打造的，或者是她赐福的？");
            outputText("[pg]她在脑海中盘算了一下这个想法，但很快摇了摇头。[say: 在我看来，不太可能。这种工具……我不确定玛莱在原则上是否会同意它，尽管绝望可能会改变她的想法。]");
            outputText("[pg]你告诉她，一把对抗腐化的武器听起来很像玛莱会赞同的东西。");
            outputText("[pg][say: 玛莱是生命女神，[name]。她有能力在那些羽翼未丰的巫师发现腐化并开始污染她的土地的那一刻就消灭他们。在过去，她的根系包裹着整个世界，通过它们，她可以知道她的领域里发生的大部分事情。她绝对知道第一批恶魔的存在，但她试图净化受影响的人，而不是简单地杀死他们。她做不到；她的神性阻止了她，正是这种神性赋予了她为玛瑞斯注入生命的力量。]");
            outputText("[pg]你再次低头看着入鞘的剑。如果玛莱不可能亲自打造或赐福这把剑，那会是谁呢？");
            outputText("[pg]喀耳刻的面容变得更加严肃。[say: 这把剑是出于愤怒而锻造的，[name]。愤怒和绝望，对抗一个无休止地杀戮、强奸和破坏的不可战胜的敌人。当恶魔大军从山上降临时，玛瑞斯每一个生物所遭受的痛苦是很难真正理解的。这种情绪很容易化为实体——或者赋予像那样的一把剑力量。]");
            outputText("[pg]你告诉她，很难相信有人能感受到足够的痛苦来赐福那样一把剑。");
            outputText("[pg][say: 诅咒它，更有可能。别搞错了，[name]。当你挥舞那把剑时，你正在成为一个对腐化有着难以想象的愤怒的存在的管道。那把剑宁愿看到玛瑞斯被烧成灰烬，带着腐化一起毁灭，也不愿让一个恶魔活下来。]");
            if(get_player().hasPerk(PerkLib.HistoryDEUSVULT))
            {
               outputText("[pg]如果将世界化为灰烬是摆脱腐化的唯一方法，那就这样吧。它不能存活。你看着喀耳刻，注意到她眼中有着深深的忧虑。尽管她这么说，但很明显她已经读懂了你的心思——哪怕只是短暂的。你用锐利的目光回应她忧虑的凝视，明确表示她不受欢迎窥探你的内心想法。");
               outputText("[pg][say: 对不起，[name]。只是——只是记住不要让自己被愤怒蒙蔽了双眼，就像恶魔被欲望蒙蔽一样。你可以做得更好。]");
               outputText("[pg]你欢迎她的大部分知识，但她可以把那一点留给自己，你心想。你再次看着她；确保她不再读你的心。");
            }
            else
            {
               outputText("[pg]你握住剑鞘，绷紧肌肉。似乎你走的每一条路都对你自己，以及对整个世界，有着自己的危险形式。你感谢她的谈话，她带着苦笑向你点了点头。[say: 随时欢迎，[name]]。");
            }
         }
         else if(_loc2_ == CorruptedCoven.TALKED_CORRWITCH_HEX)
         {
            outputText("你告诉她堕落魔女在你身上施加的咒语，以及她们那明显的不孕诅咒。");
            outputText("[pg][say: 是的，我见过她们在峭壁甚至更远的地方游荡，寻找治愈诅咒的方法，或是提高生育能力的手段。确实是一群奇怪的家伙。] 她保持沉默。[pg]你叹了口气，意识到她不会轻易就范。你问她本人现在或曾经是否也是个堕落魔女。[pg]她从容地面对你的问题，目光没有丝毫改变。[say: 不，我不是。如果我曾经是的话，嗯，她们的历史可以追溯到第一批抵达玛瑞斯的人类巫师。是的，我是那些人的后代。如果你去探索她们的家谱，我敢打赌你会在我和她们中的某个人之间找到共同的祖先。][pg]这个信息激起了你的兴趣。她是个纯粹的人类？你开始询问关于那些巫师的问题，他们的生活和命运，但你很快就被她打断了。[say: 你觉得我有多大岁数？我是他们的后代，是的，但也仅此而已。我可能要将我对魔法的一些亲和力归功于他们，但我对他们的生活方式知之甚少。如你所料，那些巫师有很多孩子。幸运的是，并非所有人都变成了恶魔。][pg]你继续追问。她是一个巫师的女儿吗？或许是孙女？[pg]她的声音变得更加尖锐和冰冷。[say: 不，[name]。我的家庭与你无关。如果你在想“交换故事”的话，我也不想听你的。]");
            outputText("[pg]在这件事上她绝对不会让步。");
         }
         else if(_loc2_ == CorruptedCoven.TALKED_DOMINIKA_SWORD)
         {
            outputText("你想起了多米妮卡，你在特尔阿德雷遇到的那位女巫，以及她为达目的同样务实的作风。你向喀耳刻讲述了她的事，还有她给你的那把奇特的剑。喀耳刻对你的故事表现出了浓厚的兴趣，尤其是多米妮卡那种与占星术绑定的奇特施法方式。");
            outputText("[pg][say: 真是不可思议。我经常推测隐藏在星辰与太阳中的奥术力量，但从未取得任何进展。也许这是一种更适合其他世界的魔法流派，那些没有像这个世界一样遭到蹂躏的世界。]");
            outputText("[pg]喀耳刻从椅子上站起来，走向一堆特别高的书和卷轴。她开始在杂乱中翻阅，用手挪动几册，又用念力移动其他几册。过了一会儿，她挑出了一卷特别破旧的卷轴，打开它，然后回到你身边。[say: 这是一幅星图，是莉希丝横扫天空之前由一群巫师绘制的。]");
            outputText("[pg][if (intelligence > 75) {卷轴里的信息很有趣，尽管可能太基础了。它仅仅描绘了几年间天空中一群星辰的运动轨迹，对于任何想要汲取它们的力量来施法的人来说，并没有什么特别的价值。|卷轴里的信息确实很有趣，尽管你并不真正了解它有多重要。}] 你把它还给喀耳刻，指出它有多么平平无奇。");
            outputText("[pg]她兴奋地笑了。[say: 在外行人看来，也许是这样。但你看——]她说着，将手指放在卷轴上，低声念了一句简短的咒语。卷轴突然从她手中飘起，绷得紧紧的，并发出光芒。伴随着一阵能量的脉动，整个房间暗了下来，卷轴上的图画和图表随之展开，变成了围绕着你和喀耳刻的三维图像。你对这奇观感到惊叹，脑海中不禁浮现出，这是你离开英格纳姆以来第一次看到星星——尽管它们可能是假的。");
            outputText("[pg][say: 那些巫师为他们的知识感到自豪，但他们也为自己能将知识隐藏在众目睽睽之下而自豪，]喀耳刻环顾着房间，和你一起惊叹道。[say: 但这绝不仅仅是一场灯光秀，你看。]喀耳刻指向房间的中央。一个由几个圆圈和线条组成的蓝色全息图——有些相交，有些不相交——漂浮着并缓慢旋转，几行漂浮的文字覆盖在其中几个圆圈上。大多数圆圈都有一条线最终通向一个中心圆圈，从那些古老语言的段落中可以辨认出一个特定的词：<b>玛瑞斯</b>。");
            outputText("[pg][say: 在世界和位面的宏大图谱上，]——喀耳刻插话道，将你的注意力从全息图上拉开——[say: 玛瑞斯位于正中心。所有的世界都通向它，但你看，]——她指着标有玛瑞斯的圆圈周围，以集中你的注意力——[say: 玛瑞斯不通向任何地方。它是道路的尽头。即使拥有令人难以置信的知识和力量，他们也没有找到出路。这仅仅是巧合，还是玛瑞斯的位置有着某种更伟大的目的？]");
            outputText("[pg]你听到了她的问题，焦虑很快袭来。如果真的没有办法回到英格纳姆怎么办？如果你完成了你的任务并击败了莉希丝，却永远无法回去向你的村庄、你的世界讲述你的成就呢？你挥去了这个想法；现在想这些毫无帮助。");
            outputText("[pg][say: 多米妮卡声称来自另一个世界，就像那些古老的巫师一样。他们穿越了无数的其他世界，最终来到了这里。我想知道，为什么？这仅仅是个意外，还是这里有他们想要的东西？有什么值得他们离开自己的世界？多米妮卡的人民是否也在这里寻找什么，或者他们只是新手，是这宏大星辰群岛中的新航海家？]她转向你，注意到了你的忧郁。她移开视线，挥了挥手，打破了卷轴创造的幻象。光线再次充满房间，你感觉到一只手搭在了你的肩膀上。");
            outputText("[pg][say: 你也不是玛瑞斯人，对吧？]她问道，语气中带着罕见的关切。你点点头，告诉了她关于你原本的世界和英格纳姆的事。她抿紧嘴唇，环顾四周，不知该说些什么。最后，她的表情放松下来，似乎在记忆中找到了什么。");
            outputText("[pg][say: 凡存在皆可知。]喀耳刻说着，把手从你的肩膀上移开。[say: 我以前在什么地方听到过这句话。我们也许注定无法知晓一切，但重点是……]喀耳刻停顿了一下，意识到她可能破坏了自己想表达的意思。[say: 重点是，即使是古代的巫师，也依然有他们不知道的事情。他们并非全知全能。如果他们是，他们就不会失败。我们不会失败，<b>你</b>也不会。]");
            outputText("[pg]你对她勉强笑了笑，她因为自己对你表现出反常的同情心而微微脸红。[say: 怎么？那就振作起来。无论你想做什么，自怨自艾是做不成的。而且我还需要你为我带来关于这个世界的知识。]");
            outputText("[pg]你再次点头，决心在你心中重新燃起。无论你是否能回到英格纳姆，你的使命都不会改变。");
         }
         else if(_loc2_ == CorruptedCoven.TALKED_FERA_BLESS)
         {
            outputText("你遇到玛莱的妹妹以及她随后赐予你的“恩惠”，这无疑是一件有趣的事。你把这一切都告诉了喀耳刻；南瓜、她的外貌、精神探测。起初，她的目光完全集中在你身上，但到最后，她已经走神了，望着远方，思考着什么。");
            outputText("[pg][say: 显然，玛莱未能以几种不同的形式阻止堕落的浪潮。这可不好，[name]。对这片土地来说，菲拉可能是一个比莉希丝更糟糕的敌人。]");
            outputText("[pg]你提到，考虑到她自己已经让多少堕落进入了她的灵魂，她对一个堕落的女神会有这样的保留态度，这很奇怪。当你完成你的句子时，她的目光飘回你的脸上，翠绿色的眼睛锐利而坚定。");
            outputText("[pg][say: 我害怕的不是菲拉的堕落，[name]。而是菲拉本身。堕落并不一定会改变一个存在的道德观，这一点我已经得出了结论。它只是促进和滋养……痴迷。] 她沉默了一会儿，让你吸收她的话。");
            outputText("[pg][say: 在很大程度上，它表现为不受限制的欲望。也许是因为繁殖是生物最基本的本能？对此，我不太确定。]");
            outputText("[pg]你问她为什么菲拉自己会如此痴迷于此，因为她不是繁殖女神，而是掠夺女神。喀耳刻低下头，思考着。[say: 神明塑造土地，往往也被土地所塑造。她的行动一直比她姐姐更隐秘，但她可能已经被扭曲，认为性只是她玩掠夺游戏的另一块棋盘。在性爱中一直存在着“支配”和“顺从”参与者的动态。对她来说，这很可能就是“捕食者”和“猎物”。她总是对自己的痴迷一心一意……随着过量的堕落流经她的身体，我怀疑她会更加专注。]");
            outputText("[pg]你告诉她你是意外唤醒她的；几乎是个陷阱。她挥了挥手，比喻性地把你的担忧抛在一边。[say: 你只是那个“幸运儿”。如果不是你，其他生物也会这么做的。这发生在一个不合时宜的时候，但这并不是你的错。这是玛莱的错。如果她那么看重纯洁，她本该在有机会的时候解决掉她妹妹。] 你问她犯下杀亲之罪是否真的是一种纯洁的行为。她笑了笑。[say: 也许不是。那么，这个案例证明了纯洁比堕落更弱。]");
         }
         else if(_loc2_ == CorruptedCoven.TALKED_GARGOYLE)
         {
            outputText("你讲述了你发现的那座大教堂，以及住在那里那只活生生的石像鬼的故事。她挑起眉毛，带着真正的担忧，从椅子上站起来，走到书架前。她拿起一本特别布满灰尘的大部头，有着厚厚的黑色皮革封面，边缘装饰着美丽的银色饰边。书名写着“第一质料与个体化原理的秘密”。她翻开书，发出一声令人满足的声响，简短地读了一段，然后递给你。[say: 给你，[name]。有了这本书，你就可以赋予你自己的石像鬼生命了。] 你转过头看着她，满脸难以置信，然后打开了书。[if (intelligence > 95) { 尽管你很聪明，但你还是看不太懂。书中描述的仪式和术语需要数年时间才能真正理解，更不用说掌握了。你沮丧地合上书。| 你尽了最大努力，但还是无法理解你选择阅读的段落中的任何一段。你完全是一头雾水。}] 你再次看向她，她理解地点了点头。[say: 由于莉希丝的猛攻，太多东西都失传了。巫师拥有这样的自动机并不罕见，但残存的知识碎片不足以理解它们的创造过程。那座大教堂可能就是最后几位灵魂大师之一的安息之地。] " + ((FlagDict_Impl_.arrayReadInt(KFLAGS.flags,2675) & CorruptedCoven.BROUGHT_JEREMIAH_BACK) != 0 ? "[say: 如果不是因为耶利米，我担心这些知识对我们来说就彻底失传了。]" : ""));
            outputText("[pg]你问她，现在她接受了体内的腐化，同时又感叹它对世界的影响，是否会感到一些认知失调。她猛地转过身来面对你，从你手中夺过书，用念力把它放回书架，显然很生气。");
            outputText("[pg][say:不要把我对腐化本质的好奇心误认为是同情恶魔。它们是祸害，如果不消灭它们，玛瑞斯就会灭亡。]她再次坐在椅子上，心不在焉地把玩着项链上的一颗珠宝。[say:他们熟练地运用腐化；这对他们来说是第二天性。如果我们不了解他们的方法，我们就没有任何希望击败他们。]她注意到了自己紧张的抽搐，停止了把玩珠宝，将手握成拳头。[say:我们必须尽快行动，除非我们想让我们自己的更多知识永远丢失。]");
            outputText("[pg]你点点头，但不确定自己是否同意她的看法。");
         }
         else if(_loc2_ == CorruptedCoven.TALKED_JEREMIAH_WEAPONS)
         {
            if((FlagDict_Impl_.arrayReadInt(KFLAGS.flags,2675) & CorruptedCoven.BROUGHT_JEREMIAH_BACK) != 0)
            {
               outputText("你问喀耳刻她是如何与耶利米相处的。");
               outputText("[pg][say: 哦，一旦你了解了这个老头，你会发现他其实挺讨人喜欢的。我都忘了和别人一直住在一起是什么感觉了，哪怕那个人是一尊复活的雕像。他传授给我的那些零星知识也是无价之宝；他很可能是审判官中最聪明的人。][pg]你问她最终期望从他那里得到什么。[pg][say: 他所知道的关于奥术锻造的一切，他所学到的关于魔像制造和灵魂转移的一切，甚至是他曾经居住的那座高塔的哪怕一丁点信息。我无法确定一个终点；他知道的太多了，而且都太罕见了，我甚至无法为我的盘问设定一个界限。][pg]你皱起眉头。他同意这么做吗？[pg]她挥手打消了你的顾虑。[say: 别担心。他是不朽的，也感觉不到痛苦。就算我试图用粗暴的方式从他那里榨取信息，我也绝不会成功。他的大脑是一个珍贵的密码箱，需要小心翼翼地撬开，而不是强行砸开。][pg]你听到耶利米所在的位置传来一声沉闷的[say: 我听到了！][pg][say: 你当然听到了，老头，]她叹了口气说道。");
               outputText("[pg]你笑了笑。这确实是一对奇妙的组合。");
            }
            else
            {
               outputText("你向她讲述了你与审判官残部的奇妙遭遇、你与维尔库斯的战斗，以及耶利米精湛的工艺。当你讲述你的故事时，她经历了从担忧到渴望的几种不同情绪；你可以看出，关于欺骗之塔的一些事情让她深感不安。然而，到最后，她设法恢复了更温和的举止，在得知你的冒险经历后只是点了点头。");
               outputText("[pg][say: 我记得他们。我是说审判官们。一团熊熊燃烧的火焰，要烧尽这片土地上所有的堕落。]她用手托着头，目光深邃。[say: 当初他们失败时，这为我的哲学提供了强有力的证据。不过，听到这些细节……还是让人很难受。我当时不在乎他们对抗堕落的圣战，现在也不在乎，但他们试图反击莉希丝那该死的影响力的尝试是英勇的，而它的失败让我深感沮丧。他们的知识和灵魂，都消失了。没有人能抵挡堕落。没有人。]与她平时冷漠但好奇的举止相反，她听起来真的很伤心。[pg]她突然恢复了更有活力的面容，转向你。[say: 但你说……建筑师，耶利米，他还活着？]你告诉她，对于他目前的状况来说，“活着”有点牵强，但确实如此。[say: 难以置信。那个人可能是最后一个活着掌握审判官奥术锻造知识的人了，此外还有其他知识的宝库。我会去拜访他，看看能学到什么。谢谢你，[name]。这正是我向你提出交易时所寻找的。]");
               outputText("[pg]她从椅子上站起来，来回踱步，制定着计划。看来你给了她一些思考的东西。一些让她充满热情的东西。");
            }
         }
         else
         {
            if(_loc2_ == CorruptedCoven.TALKED_KITSUNE_ENLIGHTEMENT)
            {
               outputText("你告诉喀耳刻你为了获得启迪而进行的仪式，以及你与妖狐和她们施法的经历，包括你自己的施法经历。");
               if(get_player().tail.type == 13 && get_player().tail.venom > 8)
               {
                  outputText("[say: 你身后有这么毛茸茸的尾巴，想隐瞒自己是妖狐的事实可不太容易。我本来还指望你迟早会主动告诉我呢。]");
               }
               else
               {
                  outputText("[say: 你能像妖狐那样施法？我还以为它们都应该有九条尾巴呢，]她难以置信地说。[pg]你告诉她，你从出生起就本能地知道这些，而且小时候还梦到过自己在森林里举行这种仪式。[pg][say: 有意思。妖狐的魔法本质上就是狡猾且难以理解的。也许它们在你小时候传授了你知识，只是为了欣赏你制造的那些恶作剧和混乱。][pg]你仔细琢磨了她的话，但估计永远也得不到一个确切的答案。");
               }
               outputText("[pg]她稍微伸展了一下身体，在椅子上换了个更舒服的姿势。[say: 作为一个追求知识的人，我过去也曾试图联系森林里的妖狐。只能说，它们对教我法术以外的东西更感兴趣，就说到这儿吧，]她说道，尽管极力保持镇定，脸上还是泛起了一丝红晕。[say: 它们教了我一些东西，我也希望自己教了它们一些。]她微笑着。");
               outputText("[pg][say: 不过，关于你能施展的法术，你还能告诉我些什么？你是借助什么来编织这些魔法的？欲望？清醒？还是完全不同的东西？]");
               outputText("[pg]你告诉她，这对你来说是本能；在施法时，你的大脑会自动专注于快乐的恶作剧，肌肉也会自行运动。你承认这没什么帮助，但这确实是实话。她撅起嘴，有些失望，但很快又恢复了兴高采烈的神情，她转过脸，托着下巴，脑海中正在酝酿一个想法。");
               outputText("[pg][say: 你的话也许比你想象的更有深意，或者那是你故意的，你只是想戏弄我。有几份记载提到，神明和半神会使用凡人的身体作为容器。他们这样做可能是为了隐藏自己，帮助他们的勇者，或者……只是为了好玩，]她转过身面对你说道。" + (FlagDict_Impl_.arrayReadFloat(KFLAGS.flags,711) == 1 ? " 回想起你与塔奥斯的相遇，你知道那是真的。" : "") + " [say: 也许有某种存在正在利用你的身体，以及妖狐的身体，来实现某种只有神明才能真正理解的目的。]");
               outputText("[pg]你告诉她，在施法时你并没有那种被“附身”的感觉" + (FlagDict_Impl_.arrayReadInt(KFLAGS.flags,353) > 0 ? "，特别是考虑到你以前确实被鬼魂附身过" : "") + "。[say: 好吧，我也不清楚。不过，神明的手段可能非常微妙。如果不是直接控制，他们可能只是在瞬间改变你的想法，对你的自我进行轻微的推拉和扭曲，刚好足以让你的潜意识完成剩下的事情，这是对你自由意志的一种小小嘲弄。]");
               outputText("[pg]突然，她停了下来，眉头紧锁，陷入了沉思。");
               outputText("[pg][say: [name]……如果腐化的原理也是一样的呢？]");
               outputText("[pg]你问她这话是什么意思。");
               outputText("[pg][say: 如果我们都是某种隐藏力量的傀儡，而腐化仅仅是它用来操纵我们的提线数量呢？]");
               outputText("[pg]这个想法让你脊背发凉，你也能看出喀耳刻同样如此，她被这个想法迷住了，脸色苍白。");
               outputText("[pg][say: 难道……？难道控制腐化只是一场闹剧？如果存在这样的力量，它是有意识的，还是仅仅是原始的，与时间本身一样古老？]");
               outputText("[pg]你试图回答，但很快发现她已经不再和你说话了。她完全沉浸在自己的思绪中。而且，很明显，她很矛盾。你离开了她，给她一些时间来处理她新发现的困境。");
               updateTopic(param1);
               doNext(leaveCirceChamber);
               return;
            }
            if(_loc2_ == CorruptedCoven.TALKED_LAURENTIUS_INCIDENT)
            {
               outputText("你整理了一下思绪，试图尽可能地解释你在击败维尔库斯几天后的经历。那超凡脱俗的飞升，与劳伦提斯的相遇，以及他在消失前对你说的话。");
               outputText("[pg]“劳伦提斯”这个词比任何其他词都更能引起她的兴趣。不过，她掩饰得很好。");
               outputText("[pg][say: 劳伦提斯……我知道他。嗯，所有古代的巫师都知道。在他们全部陨落、莉希丝接管之前，他当时是个名人。据说他极其强大，也极其野心勃勃。请注意，不是为了世俗的财产，而是为了纯粹的奥术力量。然而，关于他的记录很少。有一天他消失了，几年后，没有人再关心去继续寻找他。]");
               outputText("[pg]你点点头表示理解，但决定再深入探究一下；既然你遇到的其他人都不知道他，她怎么会对他了解这么多？");
               outputText("[pg][say: 你遇到的其他人都没有寻找过他。我找过。他与同时代的其他巫师不同，显然对腐化有着其他人都不了解的基础认知。没有人会凭空消失得无影无踪。你找到了他，我也找到了。区别在于你的遭遇要……私人得多。]");
               outputText("[pg]你注意到她左手上不知何时出现了一杯酒。她可能是在你没注意的时候端起来的。她小抿了一口，花了很长时间品味，然后咽了下去。[say: 他向你发起了决斗，是吗？然后声称你应该在玛瑞斯消亡时复兴它？] 她又抿了一口。[say: 难以置信。但是，我很遗憾地说，你交战的对象并不是劳伦提斯。]");
               outputText("[pg]你告诉她你的经历绝对是真实的。你不会撒谎，尤其是在这种如此离奇的事情上。[say: 劳伦提斯已经死了，[name]。他几十年前就死了，死于尝试一些其他巫师甚至连想都不敢想的事情。你所对抗的是一个幽灵，一个他在尝试失败时留下的哨兵。而他确实失败了。]");
               outputText("[pg]你问她怎么会对他了解这么多，考虑到他是如此神秘，关于他生平的记录又是如此稀少。她看起来有些惆怅。[say: 你说得对。我不知道。这只是一个受过教育的女人的合理猜测。] 她不再喝酒，转过身背对着你。[say: 如果你说的是真的，你身上就背负着沉重的负担，但我恐怕一点也帮不了你。]");
               outputText("[pg]你能看出来她正在努力保持镇定。[say: 让我一个人待会儿。我需要思考一下。]");
               updateTopic(param1);
               doNext(leaveCirceChamber);
               return;
            }
            if(_loc2_ == CorruptedCoven.TALKED_MANOR_DULLAHAN)
            {
               if((FlagDict_Impl_.arrayReadInt(KFLAGS.flags,2675) & CorruptedCoven.BROUGHT_DULLAHAN) != 0)
               {
                  outputText("你向喀耳刻询问关于伊芙琳的事，以及她亲自见到伊芙琳后的想法。");
                  outputText("[pg]她微笑着。[say: 你是个幸运的家伙，我想她能找到你也很幸运。没有多少人会像你这样冒这么大的风险。如果我可以说得大胆一点的话，你简直就是个英雄。][pg]你点点头，向她道谢。[pg][say: 在这片被恶魔和腐化蹂躏的土地上，很难找到一个没有遭受过某种可怕悲剧的人。在我看来，她找到了一种奇特的方式来处理她的悲剧。她接受了强加于她的改变，认为这是不可避免的，但同时也与之抗争，以获得她的独立和个性。确实非常鼓舞人心。][pg]你表示同意，并问她是否从她的状况中学到了什么有用的东西。[pg][say: 没有学到什么魔法知识，没有。但对生活有了很好的看法。][pg]你笑了。在话题结束之前，你想起了你和她做过的那个相当生动的共同梦境。那是她的主意吗？][pg]喀耳刻点点头。[say: 哦，是的，她从一开始就在脑海里计划好了这个小故事。在我看来，她经常想象和你过着“正常”的生活，甚至到了非常具体的细节。我自己从来没尝过梨，但她说它们很美味，在它们还存在的时候。][pg]你大声地想知道为什么她以前从来没有向你表白过她的爱。[pg]她嘲笑道。[say: 你真的需要别人说出“我”、“爱”、“你”这几个字，你才能明白暗示吗？拜托。]");
                  outputText("[pg]你挠了挠头，深深地思考着那个梦。它可能永远不会成真，但它活在伊芙琳的脑海里，现在也活在你的脑海里。在这片土地上，这已经比大多数人所能奢望的要多了。");
               }
               else
               {
                  outputText("你把关于无头骑士、她的诅咒、庄园、你在那里与之战斗的可怕生物、你找到的书，以及死灵法师本人的所有事情都告诉了她。显然，这些细节让她感到不安，但她的表情却出卖了她对死灵法师这个话题的好奇心。");
                  outputText("[pg][say:难以置信……我以为死灵法术只存在于理论中。给构造体注入生命作为哨兵，这还可以理解，但真的能让人起死回生？太不可思议了。]她注意到了自己的激动，试图纠正自己。[say:作为女巫的我感到惊叹，但作为人的我感到厌恶。你终结了那个死灵法师的勾当，做得很好，[name]。这种亵渎的魔法是这片土地无法承受的腐化。][pg]她再次陷入沉默，手指在嘴唇上划过，试图整理思绪。几秒钟后，她再次面对你。[say:那无头骑士呢？其他的亡灵都是没有心智的怪物，但你说她保留了意识？]");
                  if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,2661) == 1)
                  {
                     outputText("[pg]你告诉她确实如此，但在击败死灵法师后，你消灭了她，以确保他在玛瑞斯的所有杰作都消失殆尽。她显然对你的回答感到失望，甚至有些愤怒。[say:真是太遗憾了。那么多知识，就这么没了。你做的可能更安全，但从你的故事来看，尽管她做出了那些事，她似乎也是死灵法师愚蠢行为的受害者之一。好吧，我不会评判你。]");
                  }
                  else
                  {
                     outputText("[pg]你告诉她，她确实这么做了，而且她非常感谢你在结束死灵法师对她的控制中所起的作用。喀耳刻兴奋地容光焕发，这种姿态与她平时那种高贵、内敛、甚至有些冷漠的标准姿态大相径庭。[say: 你必须把她带到这里来！一个有意识、能言善辩的亡灵，在几十年后依然保存完好！我的赌注终于有了回报，[name]！这是一个非同寻常的机会！][pg]你告诉她你会考虑一下，但她是否愿意被一个素不相识的女巫分析，这仍然是她自己的决定。尤其是在她经历了其他巫师的那些可怕遭遇之后。你的话让她停下了脚步，她意识到自己刚才听起来有多么幼稚，于是又恢复了之前的姿态。[say: 你——你说得对。抱歉，我的好奇心占了上风。不过，还是请你向她转达这个邀请。知识就是力量，而面对死灵法术这种亵渎魔法的真正本质，我们依然严重缺乏力量。][pg]她示意你离开，从椅子上站起来，走向炼金台。她可能有很多仪式和测试要准备。非常多。");
                  }
               }
               updateTopic(param1);
               doNext(leaveCirceChamber);
               return;
            }
            if(_loc2_ == CorruptedCoven.TALKED_MARAE_BLESS)
            {
               if(!get_player().hasPerk(PerkLib.PurityBlessing))
               {
                  outputText("你在玛瑞斯最奇特的遭遇之一就是遇到了玛莱。你向喀耳刻讲述了她的事，以及你在工厂做出决定后她赐予你的“祝福”。你的故事讲得也许太过生动详细了，到最后你注意到她对你的窘境感到有些脸红。[pg][say: 这么说，玛莱已经受到了恶魔的影响，所以她决定赐予你一个对她祝福的嘲弄。人们本以为像她这样的女神应该明白，不该如此强烈地抵抗堕落。]");
               }
               else
               {
                  outputText("你在玛瑞斯最奇妙的遭遇之一就是遇到了玛莱。你向喀耳刻讲述了关于她的事，以及你在工厂做出决定后她赐予你的祝福。她对玛莱的珍珠的效果表现出真正的兴趣，点了点头。[say: 很有趣。尽管恶魔们在努力，玛莱仍在继续抵抗堕落。希望她有足够的时间明白她不应该完全抵抗这种污染。我们走着瞧吧。]");
               }
               outputText("[pg]你忍不住想在这个话题上追问她。她为什么要避免抵抗堕落？");
               outputText("[pg]喀耳刻摸了摸下巴，然后手滑下去轻轻拉扯着一缕头发，构思着回答。[say: 堕落无处不在，但它不一定具有侵略性。试图强烈地抵抗它，只会让一个人——或者女神——在失败时，腐朽得更加厉害。而且这种事总是会发生。想象一个人试图逆着强流游泳；他会疲倦，失去所有力量，然后淹死。但他可以顺流而游，并部分控制自己的方向。他可能不会到达他想要去的确切位置，但他还能活着。]");
               if(get_player().hasPerk(PerkLib.HistoryDEUSVULT))
               {
                  outputText("[pg]你告诉她这是极其异端的行为。无论如何，人都必须与堕落作斗争！她嗤之以鼻，翻了个白眼。[say: 是啊，这是一种死不悔改的学派。告诉我，你在玛瑞斯见过多少圣骑士？你可能是最后一个了。其他所有的要么是无脑的恶魔，要么只是一块莉希丝水晶。这不是一个令人舒服的意识形态，但它能保证你保住自己的灵魂，而不是把它射掉。]");
               }
               else
               {
                  outputText("[pg][if (corruption < 50) {你告诉她你还没有强烈地感觉到堕落的污染。你不打算“沉沦”。她点点头，但她的目光中充满了真正的担忧。[say: 看看玛瑞斯，[name]。玛莱很久以前就失去了对这片土地的控制，她试图通过强制推行“纯洁”来应对堕落。堕落是无法真正用剑或魔法来对抗的。即使是神圣的魔法也不行。没有人真正理解它是什么，所以他们用完全无效的方式来处理它。][pg]你问她是否理解。她皱起眉头。[say: 不。但我愿意去了解。]|你告诉她你确实感觉到堕落的污染在侵蚀你的灵魂。你想知道你的行为有多少真正属于你自己，你又失去了多少自我。[say: 记住这一点，]她直视着你的眼睛说道。[say: 留意你自己和你的行为。污染会扭曲你的心智，但只要你明白这些侵入性的想法不属于你，你就能继续做你自己，而不是成为它的奴隶。][pg]你思考着她的话，问她，既然她已经堕落了，是否还在与这些侵入性的想法作斗争。[pg][say: 一直在斗争，]她神情严肃地说。[say: 但我仍然是我自己。][pg]你不确定她对自己的话有多自信。}]");
               }
            }
            else
            {
               if(_loc2_ == CorruptedCoven.TALKED_NAMELESS_HORROR)
               {
                  outputText("你深吸一口气，决定告诉喀耳刻你与那个……<i>东西</i>之间那段挑战理智的遭遇。你告诉她关于黑曜石碎片的事，发现自己处于无限的边缘，深渊生物本身，以及它给你的启示。");
                  outputText("[pg]她皱起眉头，对你的故事半信半疑。[say: 这……真的很难让人相信，[name]。我带你来这里并不是为了简单地质疑你的每一句话，但是，为此，我需要更多的证据。][pg]你问她你到底能做什么来证明你所经历的是真实的。她伸出戴着珠宝的手指，向你靠近。[say: 如果你允许的话，我可以探测你的思想。当我触摸你的太阳穴时，你可以尝试回忆你与那个生物的遭遇，从你凝视碎片的那一刻开始。我会读取你的思想，并且不会超出你允许我看到的范围。][pg]你心里想，被探测思想的前景并不怎么受欢迎。然后你突然想到；她现在正在读取你的思想吗？你眯起眼睛，充满怀疑，尽管你渴望向这位潜在的读心者隐藏你的感受，但你的脸还是出卖了你。[pg][say: 啊，当然。你在想我以前是否探测过你的思想。我本可以这么做，是的。但我没有。我们都有秘密，我很久以前就学会了尊重它们。无论你不愿意通过语言传授给我什么知识，我都不愿意去了解。] 你思考了一秒钟。在你的脑海里，你对她破口大骂，试图从她那里得到一些反应。如果她现在正在读取你的思想，那她隐藏得很好。事实上，好到争论这个问题毫无意义。你点点头，仍然有些怀疑，轻轻地向她的手低头，以示接受。她笑了。[pg][say: 很好，那么，我们将看到语言无法描述的东西。] 她用两根手指分别触摸你太阳穴的两侧，闭上眼睛，深呼吸。[say: 想想那一刻。死灵法师的房间。碎片。里面的星星。带自己回到庄园。] 你闭上眼睛，尽力让记忆重现。");
                  updateTopic(param1);
                  doNext(rememberInfinity);
                  return;
               }
               if(_loc2_ == CorruptedCoven.TALKED_SANDWITCH_BLESS)
               {
                  outputText("你告诉喀耳刻关于沙漠女巫的事情，以及她们为了对抗恶魔的数量而做出的努力，她们祝福并改造自己和路人，以尽可能多地繁衍同类。");
                  outputText("[pg]喀耳刻叹了口气。[say: 我赞赏她们的努力，真的。当许多其他的魔法教派失败或正在失败时，比如特尔阿德雷的契约组织，或者这里悬崖上被腐化的女巫，她们设法坚持了下来，保护了自己和她们的文化。我的问题是：仅仅通过集结数量惊人的士兵，就有可能在恶魔最擅长的领域击败它们吗？][pg]这个问题从她嘴里说出来很奇怪。她不是也在试图掌控腐化吗？那不就是“它们的领域”吗？喀耳刻双手交叉，转动着手指上的一枚金蓝宝石戒指，构思着答案。[pg][say: 在某种程度上，是的，我的话里确实有些虚伪。然而，我从未声称我的目标是击败恶魔。我希望看到它们消失，但我对自己能完成这件事不抱任何希望。][pg]你问她为什么不干脆和其他派系联合起来。契约组织、沙漠女巫、被腐化的女巫，或者甚至是你自己。你肯定需要她的帮助。她轻笑了一声，摇了摇头表示拒绝。[pg][say: 不，[name]。我只想进行我的研究，学习并获取知识。我接受了这么多腐化，这无异于如履薄冰。如果我试图对抗莉希丝并倒下——失去灵魂，自己也变成恶魔——那么它们将获得一个极其强大的盟友。我不想冒这个险，无论几率有多低。][pg]你嗤之以鼻，问她如果恶魔占领了整个玛瑞斯，并来找她，她打算怎么办，哪怕她藏得再好。[pg][say: 那我会战斗，因为我别无选择。我只希望，到那时，我已经获得了我所寻求的理解。如果没有……][pg]她的声音渐渐弱了下去。[pg][say: 还有比死亡更糟糕的事情，[name]。我希望你明白这一点，如果你愚蠢到想要独自挑战莉希丝，我希望你记住这一点。]");
                  outputText("[pg]她保持沉默，让这些话在你的脑海中回荡。");
               }
               else if(_loc2_ == CorruptedCoven.TALKED_TELADRE_WIZARDS)
               {
                  outputText("你问喀耳刻是否知道特尔阿德雷。");
                  outputText("[pg][say:知道的不多。你看，我不被允许去那里。但那里也没剩下多少东西了，不是吗？]你带着忧虑点了点头，但提到契约组织已经设法控制住了腐化，与玛瑞斯的其他地方相比，这是一个英勇的成就。她嘲笑道。[pg][say:他们现在可能控制住了腐化，但它最终会变得足够强大，将他们粉碎。他们打算比恶魔活得更久吗？恶魔以荒谬的速度繁殖，并控制着世界上每一寸土地。特尔阿德雷是一座坟墓，莉希丝没有努力去寻找和摧毁它也就不足为奇了。这没有必要；仅仅因为后勤问题，他们就会自己倒下。][pg]你对她的断言轻声抱怨。在他们的情况下，他们的屏障难道不是一个伟大的壮举吗？她期望他们做什么？[pg][say:古代的巫师严重缺乏远见，这就是导致他们毁于自己欲望之手的原因。以不同的方式，契约组织——无论是否是他们的后裔——犯了同样的错误。阻止腐化：那是他们唯一的目标。研究它？理解它是如何运作的，它能做什么，不能做什么？无关紧要。没有恶魔能看到或进入特尔阿德雷，但那又怎样？玛瑞斯仍然被毒害了。他们一事无成。他们的塔里可能有大量关于腐化的古代知识，但他们不敢阅读，生怕腐化会从内部蔓延。][pg]你指出这绝对是有可能的。她真诚地笑了。[say:当然有可能。腐化是我们所有人的天性。而像他们那样对抗腐化，他们只是在对抗自己的本性。]");
               }
            }
         }
         updateTopic(param1);
         _g = this;
         clearOutputText = true;
         doNext(function():void
         {
            _g.buildOptionsMenu(clearOutputText);
         });
      }
      
      public function sipWineWithCirce() : void
      {
         var answer3:int;
         var _g3:CorruptedCoven;
         var answer2:int;
         var _g2:CorruptedCoven;
         var answer1:int;
         var _g1:CorruptedCoven;
         var answer:int;
         var _g:CorruptedCoven;
         outputText("你在大厅内现身，短暂地失去了方向感——至少比平时更严重。你意识到你被传送到了大厅的另一个地方；她那把显眼的木椅正对着你平时看到它的相反方向。");
         outputText("[pg][say:还没习惯传送吗？]你听到右边传来声音。令你惊讶的是，喀耳刻就在你旁边，正从一个你不知怎么从未见过的架子上拿出一瓶酒。更让你惊讶的是，她的另一只手还拿着[i:两只]杯子。她松开瓶子，瓶子悬浮在空中，被她的魔法托起，同时她把一只杯子移到空着的手上。");
         outputText("[pg][say:你喝酒吗？]她问道，还没等你回答，她就用念力拔开瓶塞，把里面的东西倒进杯子里。[say:好吧，没关系，你现在会喝的。我可不想浪费一滴这东西。][if (isunderage) {[say:我从没想过我会给小孩子提供饮料，但我想你可以破例一次，对吧？]她轻笑着说道。}]");
         outputText("[pg]你要喝这杯酒吗？");
         menu();
         _g = this;
         answer = 1;
         addNextButton("喝",function():void
         {
            _g.answerWine(answer);
         }).hint("当然，喝一杯吧。");
         _g1 = this;
         answer1 = 2;
         addNextButton("不喝",function():void
         {
            _g1.answerWine(answer1);
         }).hint("你不太喜欢喝酒。");
         _g2 = this;
         answer2 = 3;
         addNextButton("信仰",function():void
         {
            _g2.answerWine(answer2);
         }).hint("像你这样的人喝酒是不合适的。").hideIf(!get_player().isReligious());
         _g3 = this;
         answer3 = 4;
         addNextButton("未成年",function():void
         {
            _g3.answerWine(answer3);
         }).hint("你真的不该喝酒。").hideIf(!get_player().isChild());
      }
      
      public function saveToObject() : Object
      {
         return saveContent;
      }
      
      public function roomTalkAbout(param1:int) : void
      {
         var _g2:CorruptedCoven;
         var answer1:int;
         var _g1:CorruptedCoven;
         var answer:int;
         var _g:CorruptedCoven;
         clearOutput();
         switch(param1)
         {
            case 0:
               outputText("你在房间里慢慢踱步，分析着装饰喀耳刻房间的各种艺术品。巫师和术士的半身像、宏大施法的画作，以及描绘古老仪式的奢华挂毯，越来越淫秽和堕落。喀耳刻显然没有掩饰她对过去智慧的欣赏，你指出了这一点。她向你走来，显然因为找到一个能评论她装饰的人而感到兴奋。[say: 你知道，我不能仅仅保存过去原始的书面知识。像这样的作品赋予了它适当的背景，帮助我们不仅了解他们在做什么，还了解他们为什么这样做。][pg]你问她，对这个基本上变成了玛瑞斯有史以来最大敌人的群体保持如此崇敬是否安全。[pg][say: 我崇敬他们对技艺的极端奉献，但不崇敬他们堕入混沌。你不认为对他们历史的正确了解能帮助我们在未来避免这样的灾难吗？] 她问道，指着一幅画，画中一位衣着华丽的术士女王正受到平民、骑士和巫师的欢呼。[pg]莉希丝。[pg]你用反问的语气问喀耳刻，究竟是什么引发了这样的衰败。[say: 我们对他们的陨落知之甚少，它是如此迅速和猛烈。也许仅仅是对权力的渴望，又或者是由于越来越无法找到回家之路而产生的挫败感，导致他们跨越了不该跨越的界限]——她说着，你们两人走过一幅挂毯，上面描绘了一个女人在一个极其露骨的仪式中，将自己的灵魂结晶成魔晶。沉默暂时充满了房间。[pg][say: 这一切都是一个巨大的误会吗？他们只是迷失了目标吗？] 她转过身来直视你。[say: [name]，你相信这一切背后可能有原因吗？某种能为如此多的破坏辩护的宏大动机？] 她这次的问题听起来不再是反问，而是真诚的。[say: 如果有的话……他们能被原谅吗？]");
               menu();
               _g = this;
               answer = 0;
               addButton(0,"也许",function():void
               {
                  _g.answerDecorationTalk(answer);
               }).hint("如果有正当的理由……也许吧。");
               _g1 = this;
               answer1 = 1;
               addButton(1,"否",function():void
               {
                  _g1.answerDecorationTalk(answer1);
               }).hint("不。他们已经无可救药了。");
               return;
            case 1:
               outputText("你走向房间里的一个书架，开始翻阅喀耳刻的书。她的目光短暂地落在你身上，显然有些警惕，但她很快放松下来，让你继续浏览。");
               outputText("[pg]她的收藏确实令人惊叹，可能只有契约组织庞大的图书馆才能胜过它。这里什么都有；关于白魔法和黑魔法实践的简单书籍，关于玛瑞斯本土植物炼金特性的论文（其中大部分早已发生变异），以及更具异国情调的书籍，包括一本关于星星奥秘特性的书，还有一本关于魔像创造和维护的短篇合集。你可以在这里待上几个月，仍然有很多东西要学。");
               outputText("[pg]你被喀耳刻吓了一跳，她趁你翻书时走近了你。[say: 剩下的文学爱好者不多了，尤其是这种类型的。] 她微笑着，微微倾斜着头。你问她，考虑到这些书原来的主人，她究竟是如何获得这么多收藏的。她叹了口气，轻轻地用手抚摸着书本。[pg][say: 虽然我确实通过在高山废弃定居点的一些仔细探索增加了一些收藏，但这其中大部分是继承来的。我不想粉饰太平：我是强大巫师的后代。在我很小的时候，他们就以非常人类的方式迎来了终结。我设法避免了这样的命运，并确保他们汇编的知识不会丢失。][pg]你大声猜测莉希丝的图书馆该有多么惊人，它坐落在陨落的巫师文明的中心。喀耳刻沉思了片刻。[pg][say: 如果她失去了对巫术的热爱，我不会感到惊讶。大多数恶魔都沉迷于一件事，而那件事绝不是奥秘知识。在经历了数十年纯粹的堕落，而不去关心宇宙的神秘力量之后，她可能只有区区学徒的技能。][pg]你指出，如果这是真的，那么也许玛瑞斯并不像你想象的那么无可救药。她轻轻摇了摇头。[pg][say: 那只意味着莉希丝不会用白火来对抗篡位者，仅此而已。她仍然是莉希丝，而且她可能在作为恶魔的岁月里获得了其他技艺的经验。除此之外，她在巫术知识上的衰退意味着我们在腐化和恶魔化问题上失去了最伟大的头脑。这对整个玛瑞斯来说很难说是有益的。]");
               outputText("[pg]你微微皱眉盯着喀耳刻：她可真会扫兴。她得意地笑了笑，退回了房间中央。");
               break;
            case 2:
               outputText("你走向她那张储备丰富、设备齐全的炼金台。试剂、烧瓶和坩埚有些杂乱地散落各处，还有刻有符文的相互连接的小型魔法阵。一本书在桌子的另一端打开着。");
               if(get_player().hasPerk(PerkLib.HistoryAlchemist))
               {
                  outputText("你瞥了一眼那本书，对喀耳刻正在进行的实验类型感到好奇。然而，当你阅读步骤时，你感到相当惊讶——你很确定这只是一种调制某种附魔的、抗衰老化妆品的方法。");
                  outputText("[pg]你转向喀耳刻，漫不经心地问她应该多大了，完全清楚这个问题有多危险。她翠绿的眼睛以你从未感受过的强度刺穿了你。");
                  outputText("[pg][say: 没想到你还懂炼金术。如果我早知道，我就会把那本书藏起来。至于你的问题，第一：你不该问一个正经女人这个问题。第二：我会对你撒谎，所以回答也没有意义。][pg]跟你预料的差不多。你转过身继续阅读步骤，但她又开口了，阻止了你。[pg][say: 第三：我本来想比刚才更不客气的。记住这一点。]");
                  outputText("[pg]你觉得，这基本上就是她叫你滚蛋的方式。");
               }
               else
               {
                  outputText("你瞥了一眼那本书，对喀耳刻正在进行的实验类型感到好奇。然而，炼金术的行话对你来说有点太深奥了，你只能猜出它与消除衰老的影响有关。也许是长生不老药？");
                  outputText("[pg]你转向喀耳刻，问她是否真的在研究类似的东西。她起初似乎有些震惊，但很快恢复了镇定。");
                  outputText("[pg][say: 看来你读懂了那个，是吧？很好，这是真的。恶魔们显然已经设法创造出了类似的东西，我正在试图复制她们的成功。不朽的喀耳刻，这就是他们将记住我的名字。][pg]你指出她出奇地坦率。她轻笑起来。[pg][say: 我不能一直保持神秘，不是吗？只是别抄袭我的研究，那是我最珍贵的宝藏之一。][pg]你再次转向那本书，但还没等你读到下一个字，书就自己合上并锁紧了。你再次看向喀耳刻，捕捉到了她念动法术的最后动作。[say: 我是认真的。]——她用严肃的语气说道。");
                  outputText("[pg]好吧，长生不老将暂时离你而去。目前来说。");
               }
               break;
            case 3:
               outputText("你小心翼翼地走向喀耳刻的梳妆台。她瞪了你一会儿，但很快移开视线，转而看着地面。这不算什么，但她允许你继续。");
               outputText("[pg]喀耳刻的梳妆台正如你对一位女王的期望：几十件珠宝和不同类型的复杂化妆霜及粉末点缀在桌子上，比她房间的其他地方要井井有条得多。你能感觉到其中大部分散发着魔法力量，但并非全部；显然，喀耳刻在珠宝上的一些选择纯粹是为了装饰。");
               outputText("[pg]然而，有一件物品引起了你的注意：一条项链，上面的护身符几乎完全由未加工的魔晶制成。你触摸它，但没有感觉到其中有任何腐化影响。如果这里曾经有过某人灵魂的碎片，它也早已离开了它的容器。");
               outputText("[pg]你考虑着该如何向喀耳刻询问这条项链的事，想知道她是否真的使用过——或者甚至自己提取过——莱希石。然而，你的思绪被她的插话打断了。");
               outputText("[pg][say: 我可不傻，[name]。我知道你发现了什么。不，我没有从任何生物，无论是活的还是死的身上提取莱希石。那是一件传家宝，如果它曾经有过力量的话，也早就失去了。这只是我血统中一段痛苦的记忆，也是在提醒我不惜一切代价都要避免重蹈覆辙。][pg]你看着吊坠，转头面向喀耳刻。另一个问题在你心中燃烧，听到她的回答，你立刻问了出来。这块莱希石碎片最初包含的是谁的灵魂？[pg]她显然被这个问题震住了，但还是设法保持了镇定，只是在椅子上稍微挪动了一下，并短暂地卷起一缕头发。[say: 我不知道，[name]。一位祖先。是近亲还是远亲，我说不好。除了知道他们是巫师之外，我对我的家族知之甚少，而且他们也不例外，和所有其他巫师一样鲁莽和短视。]");
               outputText("[pg]她移开视线，显得很疏远，不愿再回答任何问题。");
         }
         _g2 = this;
         doNext(function():void
         {
            _g2.buildOptionsMenu();
         });
      }
      
      public function reset() : void
      {
         saveContent.metCirceAsGrossInsectPerson = false;
         saveContent.sippedWineWithCirce = false;
      }
      
      public function rememberInfinity2() : void
      {
         var _g:CorruptedCoven;
         clearOutput();
         outputText("你环顾四周，注意到喀耳刻的双手正悬停在你的太阳穴上方，她微微颤抖着收回双手，恢复了更为正式的姿态。她保持着优雅的仪态，但显然心神不宁。");
         outputText("[pg][say: [name]，你有没有想过，是否有些真相是我们完全无法理解的？你有没有想过，尽管我们对现实和奥秘的本质进行了所有的研究，但仍有一些事情是我们永远、永远无法真正理解的？][pg]你点点头。在遭遇了那无名的恐惧之后，是的，你确实这么想。[pg][say: 这很令人沮丧，不是吗？我们心智的局限性。从宇宙的角度来看，我们不过是被赋予了感知的游荡物质。我们终有一天会回归尘土，而那尘土，终有一天也会消亡，走向万物那深不可测的终结。][pg]你再次点头，并想知道众神是否知晓这些事情。[pg][say: 好问题。我想如果他们知道，也绝不会承认。我们造物的创造者，在正确的视角下，也不过是一粒毫无意义的尘埃。] 她发出一声孤寂的轻笑。[say: 保持正确的视角，[name]。你可以将自己视为数十亿世界中一个毫无意义的生命脉动，在虚空中漂浮，走向不可避免的灭亡；或者，你可以将自己视为一名勇敢的战士、一位睿智的巫师、一个伟大的英雄或残暴的恶棍；一个将改变世界，改变你所在世界的人。让整个宇宙的视角留给那些居住在这种尺度上的存在吧，如果真的有的话。否则，你可能会落得和以法莲一样的下场，不管他是谁；一个迷失在自己现实中的人，试图抓住另一个不属于他的现实。]");
         outputText("[pg]你将这些话铭记在心。也许这块碎片是以法莲复仇的尝试；让你看到他所看到的，让你像他一样迷失自我。");
         if(!!get_achievements().h[282] && get_game().get_silly() && FlagDict_Impl_.arrayReadInt(KFLAGS.flags,2709) == 1)
         {
            outputText("[pg]喀耳刻沉默了片刻，眼神空洞，显然对某事感到恐惧。她看着你，试图说些什么，但没有成功。她挠了挠头，手指在椅子边缘敲击着，然后紧紧抓住椅子，显然很焦虑。");
            outputText("[pg]她抬起一根手指，张开嘴，似乎终于组织好了一句完整的话。然而，她紧接着又放弃了。");
            outputText("[pg]你耸耸肩，好奇到底发生了什么。她沮丧地叹了口气。");
            outputText("[pg][say: 真的吗，[name]？你真的非得把你的老二插进<b>那个</b>里面吗？][pg]你告诉她，你只是知道你再也不会有这样的机会了，你必须尝试一下。[pg]喀耳刻捏了捏鼻梁，呻吟了一声。[say: 人类最古老、最强烈的情感是欲望，而最古老、最强烈的欲望是对未知的欲望。以玛莱的名义。]");
            outputText("[pg]这算是给她个教训，让她以后别再毫无节制地在你的记忆里乱翻。");
         }
         _g = this;
         doNext(function():void
         {
            _g.buildOptionsMenu();
         });
      }
      
      public function rememberInfinity() : void
      {
         clearOutput();
         outputText("你从包里拿出碎片，透过它看去。");
         outputText("[pg]你看到了无垠的星空。");
         outputText("[pg]你看到时间和空间弯曲，你的身体无处不在，又无处可寻。");
         outputText("[pg]你看到了那个存在，那个在无限边缘的无名恐惧。");
         outputText("[pg]你在绝望的战斗中打出了最后一击。");
         outputText("[pg]你看到了时间的起点。");
         outputText("[pg]你看到了你自己。");
         outputText("[pg]不知为何，你以前就见过这一幕。你自己，正透过你自己凝视着。");
         outputText("[pg]……你睁开了眼睛。");
         doNext(rememberInfinity2);
      }
      
      public function reencounterCirce() : void
      {
         clearOutput();
         outputText("在火山岩地漫游时，你看到了熟悉的景象。你以前发现过的那座奇特的、开裂的锯齿状山丘，以及它侧面的小洞穴。也许喀耳刻想再见你一面？");
         menu();
         addButton(0,"重新进入洞穴",encounterCirceRepeat).hint("再次进入洞穴与喀耳刻会面。");
         addButton(1,"折返",get_camp().returnToCampUseOneHour).hint("你现在没心情理她。");
      }
      
      public function postCirceSex() : void
      {
         var _g:CorruptedCoven;
         var _loc1_:* = null as IMap;
         clearOutput();
         if((FlagDict_Impl_.arrayReadInt(KFLAGS.flags,2675) & CorruptedCoven.HAD_SEX_ONCE) == 0)
         {
            outputText("你摇了摇头。你回到了喀耳刻的房间，躺在她的床上，感到有些困惑。作为" + get_player().mf("国王","女王") + "的生活记忆慢慢消散，被你真实的记忆所取代。[pg]喀耳刻就在你旁边，正在修剪指甲。[say: 你喜欢吗？]她带着一丝得意的语气问道，然后吹了吹指甲。[pg]你眯起眼睛，摇了摇头，告诉她你期望的是“真正的”做爱，而不是你刚才经历的。[pg][say: 对我来说感觉挺真实的。看你操我的样子，我敢说对你来说感觉也挺真实的。]她张开手指看着指甲，检查着自己的杰作。[pg]你点了点头，但还是觉得必须问一句：为什么不直接做爱呢？她抬起头，思考着。[say: 一来，这会把我的地方弄得一团糟。我不知道你是不是那种能射出一升精液的男人或女人，我也不想去测试。其次，尝试你的幻想不是很有趣吗？][pg]这很难反驳。你放弃了，决定她是对的。[say: 我当然是对的。继续，接着睡你的午觉吧。根据我的经验，之后做的梦会非常棒。][pg]你困意朦胧，发现这个提议很难拒绝。在你睡着之前，你向喀耳刻指出了你注意到的一件事：在她的幻象中，你的身体完全不同。[pg][say: 嗯，是的。你不是唯一一个活在幻想里的人。希望你不要介意。][pg]她俯身向你，在你的额头上吻了一下。[say: 感觉很好。谢谢你。]");
            outputText("[pg]伴随着这句话，你闭上了眼睛。");
            _loc1_ = KFLAGS.flags;
            FlagDict_Impl_.arrayWriteInt(_loc1_,2675,FlagDict_Impl_.arrayReadInt(_loc1_,2675) + CorruptedCoven.HAD_SEX_ONCE);
         }
         else
         {
            outputText("你发现自己又回到了喀耳刻的房间，经历了第一次之后，整个体验不再那么令人困惑了。像往常一样，喀耳刻也躺在你旁边的床上。当她注意到你醒了时，她向你露出了微笑，你也微笑着回应，然后转身准备睡觉。你心想，你可以习惯这样的生活。");
         }
         cheatTime(3);
         _g = this;
         doNext(function():void
         {
            _g.buildOptionsMenu();
         });
      }
      
      public function onAscend(param1:Boolean) : void
      {
         reset();
      }
      
      public function load(param1:int, param2:*) : void
      {
         Utils.extend(saveContent,param2);
      }
      
      public function leaveCirceChamber() : void
      {
         clearOutput();
         if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,2706) <= 2)
         {
            outputText("你告诉喀耳刻你得走了。她喝了一口酒才回答，显然有些冷淡。[say:很好，集中精神，用意念离开。不过，别忘了我的提议。这会对你大有好处的。]");
         }
         else if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,2706) < 4)
         {
            outputText("你告诉喀耳刻你得走了。她微微点头，显得有些冷淡。[say:很好。注意安全，有新东西再来找我。]");
         }
         else if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,2706) < 7)
         {
            outputText("你告诉喀耳刻你得走了。她优雅而克制地挥手告别，依然保持着端庄的姿态。[say:再见。你做得很好，[name]，但我敢说外面还有丰富的知识等着你去发掘。]");
         }
         else
         {
            outputText("你告诉喀耳刻你得走了。她随意却出奇热情地向你挥手告别，暂时放下了端庄的姿态。[say:我有预感你很快就会回来的。我本想叫你注意安全，但你似乎已经体验了玛瑞斯的大部分风土人情，而且还毫发无损。]");
            outputText("[pg]她停顿了片刻，轻轻抿了一口杯中的酒，叹了口气。[say: 在外面注意安全，[name]。]你忍不住笑了。");
         }
         outputText("[pg]你闭上眼睛，集中精神想要离开喀耳刻的房间。墙壁和地板上绘制的线条与符文闪烁起微弱的蓝光，伴随着一道闪光和清晰的内爆声，你发现自己又回到了峭壁中，身体被一层迅速消散的蓝色薄雾所笼罩。");
         doNext(get_camp().returnToCampUseOneHour);
      }
      
      public function ladysKnight() : void
      {
         clearOutput();
         outputText("[say: 我明白了。那么，好吧。]");
      }
      
      public function kingAndConcubine() : void
      {
         var _loc1_:Boolean = false;
         if(!get_player().hasCock())
         {
            get_player().createCock(7,1.5,CockTypesEnum.HUMAN);
            _loc1_ = true;
         }
         clearOutput();
         outputText("[say: 我明白了。那么，好吧。]");
         outputText("[pg]房间的墙壁和地板渐渐远去，黑暗吞噬了你所有的感官。你的记忆被扭曲和重塑，一个新的身份接管了你的身体。");
         outputText("[pg]你的视线逐渐清晰，看到两个穿着透明舞娘服的女人跪在你面前；左边是一个脏金发女人，右边是一个黑发女人。你坐在一张舒适的王座上，你十英寸长的阴茎勃起并跳动着，她们两人正在侍弄你的肉棒，带着狂热的欲望舔舐着每一寸，像品尝纯净的花蜜一样舔舐着渗出的先列腺液。随着听觉的恢复，女性的呻吟声充满了你的耳朵，你注意到你所在的房间里到处都是穿着类似服装的女人，她们都在互相满足，等待着轮到她们来取悦你。");
         outputText("[pg]左边的女孩试图抓住你的阴茎，但她的手立刻被拍开了。[say: 你不配。用那只手准备好自己，以便更好地服侍玛瑞斯的" + get_player().mf("国王","女王") + "。]");
         outputText("[pg]她顺从地点点头，将手伸向她那湿润、渴望的小穴，一边继续吮吸和舔舐你的肉棒，一边勉强地挑逗着自己。你顺着声音看去。是喀耳刻，你的首席妃子，正坐在你巨大王座的扶手上。她对你微笑着，半闭的眼睛里充满了欲望。");
         outputText("[pg]女孩们的侍弄很快让你无法忍受，你的阴茎抽动着，预示着高潮的到来。右边的女孩立刻注意到了，迅速将你整个肉棒吞入喉咙，双手背在身后。即使在深喉，她也继续舔舐并在你的肉棒上呻吟，试图从你的高潮中吸取尽可能多的精液。快感淹没了你，你终于达到了高潮，在她喉咙深处有力地跳动着。当你把一波又一波的精液射入她体内时，她依然闭着眼睛，在你的胯下纹丝不动。左边的女孩试图帮助她，一只手轻轻地将她的头向前推，另一只手挑逗着她的乳房。");
         outputText("[pg]然而，你的高潮强烈而持久；她无法承受。她开始窒息，精液从她的唇边漏出，她努力容纳你释放的巨大精量。她尽了最大努力，但很快就晕了过去，在还在吮吸你阴茎的时候高潮并昏厥。金发女孩轻轻地将她的同伴从你胯下移开，贪婪地取代了她的位置，吮吸并吞咽着你射精的最后几下跳动。");
         outputText("[pg]另外两个妃子把晕倒的女孩扶到了另一个房间。随着你高潮的结束，你的肉棒终于软了下来，剩下的女孩用一个长长而缓慢的吮吸完成了她的工作，慵懒地挑逗着你整个肉棒直到顶端，最后才松开。她舔了舔嘴唇，微笑着看着你。");
         outputText("[pg][say: 稍后到我的房间来接受惩罚和教育。你没有及时注意到[his]高潮。难道" + get_player().mf("国王","女王") + "的种子应该浪费在地板上吗？] 喀耳刻斥责着剩下的妃子。");
         outputText("[pg][say: 不，当然不！对不起，喀耳刻主母，对不起，我的" + get_player().mf("国王","女王") + "！]");
         outputText("[pg]你挥手让她离开，她没有多说什么就照做了，加入了大厅里永无休止的群交。[say: 找一个熟练的仆人太难了。这些人都不能满足玛瑞斯的英雄。她们都不感激你为这片土地所做的一切。]");
         outputText("[pg]你把手放在她的臀部，微笑着。有一个人。那个一直陪伴着你，多年来为你提供明智建议和性释放的人。");
         outputText("[pg][say: 噢，马屁精，] 她说着，从扶手上下来，站在你的座位上，她的裙子就在你眼前。[say: 当你说这些话的时候，你真的让我变成了这样，看？]");
         outputText("[pg]她把裙子拉到一边，露出她那小巧精致的黑色内裤，顶部隐约可见一点阴毛。内裤湿透了，紧贴着她的阴唇，完全展现了她骆驼趾的细节和阴蒂的凸起。细小的淫液顺着她的大腿滑落。你能感觉到她散发出的欲望的狂热。[say: 我花太多时间教导这些女孩了，我几乎没有时间留给自己。我求求你，我的" + get_player().mf("国王","女王") + "，你能把我从这折磨中解救出来吗？] 她诱人地扭动着臀部，呼唤你靠近她的小穴。");
         outputText("[pg]你顺从了，抓住她的臀部，将她的胯部拉到你的唇边。你隔着内裤吮吸她的阴蒂，引得她发出一声长长的呻吟。她轻轻地在你的舌头上摩擦，渴望更多的快感。你以从容的节奏舔舐着她的凸起和褶皱，享受着她愉悦的呻吟。很快，你的[cock]再次硬了起来，准备好进行下一轮的性爱。喀耳刻立刻注意到了，她俯下身子，目光很快与你交汇。");
         outputText("[pg]她抓住你的阴茎，挑逗着你的[cockhead]边缘，然后抚摸了几下肉棒，哄着它完全勃起。她用她的缝隙在你的肉棒上摩擦，用她的汁液涂抹它，为插入做准备，每一次挺动都伴随着她唇间发出缓慢、长长的愉悦叹息。当她起身接纳你的阴茎时，她丰满的乳房碰到了你的嘴唇，你轻轻地咬住并吮吸她的一侧乳头，用一只手揉捏着另一侧。她因突如其来的快感而弯下腰，把头靠在你的头上，她那散发着香气的火红头发披在你身上。她将你的肉棒对准她滴水的小穴，把内裤推到一边，让身体的重量压在上面，慢慢地撑开她的入口。");
         outputText("[pg]她慢慢呼气，更加用力地将自己压在你的[cock]上，刻意放慢速度，一寸一寸地接纳你。你最后用力吸吮了一下她的乳房和乳头，然后松开，惹得喀耳刻咯咯娇喘。");
         outputText("[pg]她终于将你完全吞没，扭动着臀部，品尝着你肉棒的全部长度。你们再次面对面，她面色潮红，翠绿的眼眸低垂，随后又抬起凝视着你，呼吸急促，充满了欲望。");
         outputText("[pg][say: 看看我，还没开始就快要失去理智了。这就是为什么我需要找个替代品。我已经配不上你——]");
         outputText("[pg]你用一个吻堵住了喀耳刻的嘴。她立刻紧紧夹住你的肉棒，双手颤抖着，不知所措，随后紧紧抱住你，将你的身体拉向她。你感受到喀耳刻丰满的乳房紧贴着你的身体，她的臀部抽动着，在你的胯部摩擦。");
         outputText("[pg]她慢慢抬起臀部，阴唇紧紧裹着你的肉棒，然后伴随着湿润的啪嗒声再次坐下。她结束了亲吻，把头靠在你的肩膀上，抱住你以支撑身体，同时加快了速度。每一次抽插都比上一次更快，每一次下压都伴随着一声娇喘，直直地吹进你的耳朵。你试图帮她，把手放在她宽阔的臀部上引导她的动作，但她立刻抓住你的双手，将它们按在王座的边缘。[say: 这是我的工作，不是你的，]她在你耳边低语，随后温柔地亲吻和舔舐你的脖子。");
         outputText("[pg]她继续在你的肉棒上起伏，试图在每一次动作中尽可能多地取悦你的肉棒。然而，越来越明显的是，她正被疲惫和欲望所压垮，她的动作变得不协调，肌肉也紧绷起来。她拼尽全力，但还是无法保持镇定，在你达到高潮之前，她伴随着一声响亮的娇喘喷出了淫液，然后瘫倒在地，依然被你的肉棒贯穿。");
         outputText("[pg][say: 抱歉，我的" + get_player().mf("国王","女王") + "，]她喘着粗气说道，几乎要睡着了。");
         outputText("[pg]然而，你知道她还能坚持。你挣脱她无力的双手，将它们放在她的臀部，把她从你身上推起，直到你的[cockhead]。然后你把她按下去，伴随着一声高潮的娇喘，将她从恍惚状态中唤醒。");
         outputText("[pg][say: 是的！随你心意使用我吧！]她尖叫着，四肢在紧张和放松之间交替，任由你用她来取悦自己。随着每一次抽插，她喷出更多的淫液，挺拔的双乳随着她的双腿撞击你而弹跳摩擦。过了一会儿，连你也快要承受不住了，你紧紧抱住她，感觉到体内射精的冲动正在沸腾。");
         outputText("[pg]你在她体内高潮，将几股浓稠的精液射入她的子宫。喀耳刻也迎来了另一次高潮，无法再次克制自己。当她试图容纳你全部的精液时，她的肚子肉眼可见地鼓了起来。她挣扎着，但还是坚持了下来，就在最后一股精液射入她体内时，她晕倒在你身上。");
         outputText("[pg]你的肉棒软了下来，一些精液从她仍在收缩的小穴中流出。两个妃子走过来想把她从你身边带走，但你叫她们停下。你站起身，把喀耳刻抱在怀里，转过身轻轻地把她放在你的王座上休息，并吩咐其他妃子离开，让喀耳刻安稳地睡觉。");
         outputText("[pg]在离开王座室之前，你温柔地梳理了她的头发，准备去处理一些其他不那么令人兴奋的国王事务。你心想，她为你做了很多，她理应得到一些休息。");
         get_player().orgasm("Dick",true,2);
         if(_loc1_)
         {
            get_player().removeCock(0,1);
         }
         doNext(postCirceSex);
      }
      
      public function itemNotTaken(param1:int) : void
      {
         var _loc2_:IMap = KFLAGS.flags;
         FlagDict_Impl_.arrayWriteInt(_loc2_,2675,FlagDict_Impl_.arrayReadInt(_loc2_,2675) ^ param1);
         circeRewards();
      }
      
      public function isSufficientlyBuggy() : Boolean
      {
         return get_player().beeScore() + get_player().spiderScore() > 4;
      }
      
      public function giveManorBooks() : void
      {
         var _g:CorruptedCoven;
         clearOutput();
         outputText("你不知道喀耳刻借助这些书卷究竟能做些什么，但她是个女巫，所以她对其中的知识感兴趣也是合情合理的。你拿出一本作为例子，开始解释它们的重要性。");
         outputText("[pg]你面前这位慵懒的女士除了挑起一侧眉毛外，没有表现出更多的兴趣，但她对你描述的关注表明，你已经完全吸引了她的注意力。");
         outputText("[pg][say:嗯……好吧，如果这些文本曾经都属于一个死灵法师，那么它们确实可能包含一些奥术知识……但它们也同样可能是他的休闲读物。我需要检查一下才能知道。]她的目光在房间里游移了一会儿，同时敲着下巴思考，然后突然将注意力转回你身上。[say:是的。把它们放在那里]——她用手指了指洞穴的一个角落——[say:我会确保它们得到妥善处理。]");
         var _loc1_:IMap = KFLAGS.flags;
         FlagDict_Impl_.arrayWriteInt(_loc1_,2675,FlagDict_Impl_.arrayReadInt(_loc1_,2675) | CorruptedCoven.BROUGHT_MANOR_BOOKS);
         get_player().removeKeyItem("Old Manor Books");
         _g = this;
         doNext(function():void
         {
            _g.buildOptionsMenu();
         });
      }
      
      public function get_debugName() : String
      {
         return "喀耳刻";
      }
      
      public function get_debugHint() : String
      {
         return "";
      }
      
      public function getRewards(param1:int) : void
      {
         var _g3:CorruptedCoven;
         var flag2:int;
         var _g2:CorruptedCoven;
         var flag1:int;
         var _g1:CorruptedCoven;
         var flag:int;
         var _g:CorruptedCoven;
         var _loc2_:* = null as IMap;
         var _loc3_:* = null as Function;
         clearOutput();
         switch(param1)
         {
            case 1:
               outputText("你告诉她你对召唤法术感兴趣。她点点头，走向一堆书，拿起一本看起来相对崭新的书。");
               outputText("[pg]她把它递给你，封面的细节比你以前见过的其他法术书要少得多。[say: 从没想过这些书会被其他人阅读，所以它们看起来很朴素。不过，内容才是最重要的。]");
               outputText("[pg]你接过书，向她道谢，然后开始阅读。它出人意料地容易理解，你很快就掌握了召唤能量剑的基础知识，让它获得短暂的生命，并确保它只为你而战。");
               outputText("[pg]你迫不及待地想试一试。");
               outputText("[pg]<b>学会法术：喀耳刻的召唤弯刀！</b>");
               get_player().createStatusEffect(StatusEffects.KnowsCSS,0,0,0,0);
               break;
            case 2:
               outputText("你告诉她你对死灵法术感兴趣。她点点头，走向一堆书，拿起一个最近制作的卷轴。");
               outputText("[pg]她把它递给你，仅仅是看着羊皮纸上刻着的怪异符文，你就感到相当不安。[say: 绝对不适合胆小的人。不要在友好的切磋中施放这个法术，[name]。我自己没有感受过它的效果，但我愿意相信它们是令人痛苦的。]");
               outputText("[pg]你接过卷轴，向她道谢，然后开始阅读。这种亵渎的魔法与你习惯的魔法不同，但喀耳刻的写作足够正式，让你能够掌握基础知识。理解本质上将目标的身体在几分钟内变成不死生物的概念让你脊背发凉，但它应该会证明是有用的。");
               outputText("[pg]<b>学会法术：枯萎之触！</b>");
               get_player().createStatusEffect(StatusEffects.KnowsWither,0,0,0,0);
               break;
            case 3:
               outputText("你告诉她你对治疗法术感兴趣。她点点头，走向一堆书，拿起一个最近制作的卷轴。");
               outputText("[pg]她把它递给你，从最初的观察中你可以看出，这是对白魔法概念的一种扭曲。[say: 理论上，白魔法不能改变自己的身体，无论是为了治疗还是为了提升身体技能。然而，我们关于女神玛莱的谈话给了我一个主意：如果我们“祝福”风，让它来治愈我们呢？它效果很好，但祝你好运，别让你的敌人也从中受益。]");
               outputText("[pg]你接过卷轴，向她道谢，然后开始阅读。至少，这证明了喀耳刻的思维相当开阔；你想象中她理论里的一些陷阱都被彻底解决了，简明的文字证明了这个法术绝对可行。你只能祈祷风会眷顾你。");
               outputText("[pg]<b>学会法术：神圣之风！</b>");
               get_player().createStatusEffect(StatusEffects.KnowsDivineWind,0,0,0,0);
               break;
            case 4:
               outputText("你告诉她你对虚空撕裂之戒很感兴趣。她走向梳妆台，打开一个首饰盒，从里面拿出一枚形状奇特、闪烁着深红色光芒的戒指。");
               outputText("[pg]她把它递给你，你立刻注意到打造它的金属很特别。[say:我对这件作品相当自豪。陨石很少坠落到玛瑞斯，而且大多数陨石都含有具有不可思议特性的矿物。我设法弄到了一块，里面的矿石让我打造出了一枚能增强你对敌人造成任何流血效果的戒指。]");
               outputText("[pg]你把戒指迎着光，分析着那美丽变幻的色彩。你心想，这绝对是一件独一无二的神器。[pg]");
               _loc2_ = KFLAGS.flags;
               FlagDict_Impl_.arrayWriteInt(_loc2_,2675,FlagDict_Impl_.arrayReadInt(_loc2_,2675) | CorruptedCoven.GOT_RING_OF_ETHEREAL_TEARING);
               _g = this;
               flag = CorruptedCoven.GOT_RING_OF_ETHEREAL_TEARING;
               _loc3_ = function():void
               {
                  _g.itemNotTaken(flag);
               };
               get_inventory().takeItem(get_jewelries().ETHRTRINNG,circeRewards,_loc3_);
               return;
            case 5:
               outputText("你告诉她你对精准之戒很感兴趣。她走向梳妆台，打开一个首饰盒，从里面拿出一枚银戒指，上面镶嵌着一颗被切割成三角形的缟玛瑙宝石，中心刻着一个小小的符文。");
               outputText("[pg]她把它递给你，你向她道谢。[say:不知为何，奥术铁匠们从未学会如何正确地为戒指附魔以提高战士的精准度。我很高兴地说，我想我已经掌握了其中的诀窍。]");
               outputText("[pg]你把戒指放进口袋，心里琢磨着那些奥术铁匠到底错过了什么，而喀耳刻却没有。[pg]");
               _loc2_ = KFLAGS.flags;
               FlagDict_Impl_.arrayWriteInt(_loc2_,2675,FlagDict_Impl_.arrayReadInt(_loc2_,2675) | CorruptedCoven.GOT_MAJOR_RING_OF_ACCURACY);
               _g1 = this;
               flag1 = CorruptedCoven.GOT_MAJOR_RING_OF_ACCURACY;
               _loc3_ = function():void
               {
                  _g1.itemNotTaken(flag1);
               };
               get_inventory().takeItem(get_jewelries().ACCRN3,circeRewards,_loc3_);
               return;
            case 6:
               outputText("你告诉她你对幽灵之戒很感兴趣。她走向梳妆台，打开一个首饰盒，从里面拿出一枚完全朴素的银戒指。");
               outputText("[pg]她把它递给你，你向她道谢。她注意到你对戒指的外观并不感冒，轻笑了一声。[say:信不信由你，并非所有的巫师都喜欢带着一整座巨龙宝库在身上招摇过市。有些人出奇地狡猾和谦逊，他们附魔的小玩意儿也反映了这一点。][pg]你难以置信地看着她。[say:你没听说过他们是有原因的。]");
               outputText("[pg]你把戒指放进口袋，希望里面的附魔比戒指本身要令人印象深刻得多。[pg]");
               _loc2_ = KFLAGS.flags;
               FlagDict_Impl_.arrayWriteInt(_loc2_,2675,FlagDict_Impl_.arrayReadInt(_loc2_,2675) | CorruptedCoven.GOT_SPECTRE_RING);
               _g2 = this;
               flag2 = CorruptedCoven.GOT_SPECTRE_RING;
               _loc3_ = function():void
               {
                  _g2.itemNotTaken(flag2);
               };
               get_inventory().takeItem(get_jewelries().RING_SPECTR,circeRewards,_loc3_);
               return;
         }
         _g3 = this;
         doNext(function():void
         {
            _g3.buildOptionsMenu();
         });
      }
      
      public function genericCirceIntros() : void
      {
         var _loc1_:Array = [];
         _loc1_.push("喀耳刻显然已经为你做好了准备，她盘腿坐在房间中央那把沉重的木椅上，打量着你。[say: 那么，[name]，你给我带什么来了？]");
         _loc1_.push("你一到就看到喀耳刻在书桌前，面前摊开着几十本书，还有一些在她周围漂浮着，在半空中缓缓上下浮动。她注意到了你的到来，一挥手，所有的书突然合上，整齐地叠放在她的桌子上。她一边整理头发，一边走到房间中央迎接你。[pg][say: 你好，[name]。你给我带什么来了？]");
         if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,2706) > 2 && FlagDict_Impl_.arrayReadInt(KFLAGS.flags,2706) < 5)
         {
            _loc1_.push("喀耳刻显然已经为你做好了准备，她盘腿坐在房间中央沉重的木椅上，打量着你。[say: 嗯，这比我预想的要好。前提是你给我带来了新东西。欢迎，[name]。]");
         }
         if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,2706) > 4)
         {
            _loc1_.push("你在房间里现身，发现喀耳刻不在她平时待的地方。不过没花多长时间就找到了她，她只是在房间边缘的架子上查看她收藏的一些神器。她挥了挥手，表示知道你来了，然后转过身面对你。[say: 你还挺可靠的，不是吗？来吧，坐下[if (!isbiped) {-好吧，如果你能坐的话-}]，让我看看你给我带来了什么。]");
            _loc1_.push("喀耳刻显然已经为你做好了准备，她盘腿坐在房间中央沉重的木椅上，打量着你。[say: 和你在一起从来不会无聊，对吧，[name]？最近有没有偶然发现什么有趣的东西？]");
         }
         if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,2706) > 6)
         {
            _loc1_.push("喀耳刻待在房间中央她平时待的地方，你注意到她脸上带着一丝若有若无的微笑，她漫不经心地摇晃着酒杯里的酒，看着你。[say: 我开始觉得这是个错误。我最近几乎没有独处的时间了。][pg]你脑海中闪过一丝念头，觉得她可能是认真的，但她闭上眼睛，轻轻摇了摇头，表示这确实是个玩笑。她对你的犹豫反应如此之快，以至于你脑海中又闪过一个念头：她可能在那一刻读懂了你的心思。[pg][say: 好了，你还在等什么？找个舒服的姿势，我们聊聊；我们似乎总是能进行发人深省的对话，] 她说道，脸上带着一种几乎无法掩饰的兴奋的真诚表情。[pg]看来她相信你会自己说出你的想法，你心想。");
         }
         if(saveContent.sippedWineWithCirce)
         {
            _loc1_.push("你在房间里现身，立刻发现眼前漂浮着什么东西。稍微集中注意力后，你发现那是另一杯酒；从香气来看，和喀耳刻之前给你的是同一种。你把它拿在手里，随着作用在它上面的念力消失，杯子变得更重了。[say: 别害羞，喝吧，] 喀耳刻轻柔地微笑着说。[say: 我自己已经先喝了一点。][pg]你微笑着抿了一口酒，花点时间品味它的味道，同时思考着你可以和她分享什么信息。现在的这些会面感觉随意多了。");
         }
         outputText(_loc1_[Utils.rand(int(_loc1_.length))]);
      }
      
      public function exploreChamber() : void
      {
         var _g4:CorruptedCoven;
         var topic3:int;
         var _g3:CorruptedCoven;
         var topic2:int;
         var _g2:CorruptedCoven;
         var topic1:int;
         var _g1:CorruptedCoven;
         var topic:int;
         var _g:CorruptedCoven;
         clearOutput();
         outputText("你和喀耳刻目前所站的宽敞明亮的石室里，装饰着各种典籍、书籍、神器以及地毯、雕塑和绘画等简单的装饰品。这里绝对有人居住的痕迹：你可以看到一些架子上不再存放它们原本应该存放的东西，书籍和瓶装试剂反而随意地散落在房间各处，放在它们最有用，或者曾经有用的地方旁边。");
         outputText("[pg]房间尽头放着一张堪比国王御用的床，帷幔遮挡住了除凌乱的羽绒被和枕头轮廓之外的所有东西。旁边是一个备货充足的梳妆台，上面摆满了各种面霜、粉饼和首饰。再旁边是一个同样豪华的衣柜。她的衣柜和梳妆台被一个相当华丽的木制和布制屏风挡住了。");
         outputText("[pg]一个豪华且相当大的浴缸放置在距离衣柜适当距离的地方，上面铺满了玫瑰花瓣，而且不知为何一直冒着热气。你看不到任何水源，这让你相信它是魔法性质的。");
         outputText("[pg]整个房间都被魔法光芒照亮，小光球在墙壁上静静地漂浮着，发出轻微的能量嗡嗡声。");
         menu();
         _g = this;
         topic = 0;
         addButton(0,"装饰",function():void
         {
            _g.roomTalkAbout(topic);
         }).hint("分析一下挂满墙壁、环绕房间的画作与雕塑。");
         _g1 = this;
         topic1 = 1;
         addButton(1,"书籍",function():void
         {
            _g1.roomTalkAbout(topic1);
         }).hint("谈论喀耳刻那些种类惊人的藏书。").disableIf(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,2706) < 6,"先和喀耳刻建立更多的信任。");
         _g2 = this;
         topic2 = 2;
         addButton(2,"炼金台",function():void
         {
            _g2.roomTalkAbout(topic2);
         }).hint("谈论喀耳刻对炼金的兴趣。").disableIf(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,2706) < 4,"先和喀耳刻建立更多的信任。");
         _g3 = this;
         topic3 = 3;
         addButton(3,"梳妆台",function():void
         {
            _g3.roomTalkAbout(topic3);
         }).hint("检查喀耳刻的梳妆台，并分析她的珠宝。").disableIf(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,2706) < 8,"先和喀耳刻建立更多的信任。");
         _g4 = this;
         addButton(14,"返回",function():void
         {
            _g4.buildOptionsMenu();
         });
      }
      
      public function encounterCirceRepeat() : void
      {
         clearOutput();
         outputText("你再次靠近那个洞穴，既然已经了解了它的本质，你也就没那么小心翼翼了。");
         outputText("[pg]你迈步走进去，准备好迎接传送带来的令人作呕的反应。进去几秒钟后，那种感觉袭来：你的身体仿佛被扭曲折叠，空间和方向感被彻底粉碎。你咬紧牙关忍受着这种异样的感觉，没过多久，你发现自己又回到了喀耳刻的房间。[pg]");
         doNext(circeIntros);
      }
      
      public function encounterCirceInsectProblem() : void
      {
         clearOutput();
         outputText("你再次感受到周围岩地的酷热，你用尽全身的意志力才忍住没有呕吐。你坐在地上平复胃部的不适，心里纳闷刚才到底发生了什么。");
         outputText("[pg]深呼吸了几次后，你觉得恢复得差不多了，可以继续走了。你回到营地，现在不太想去搜寻洞穴了。");
         saveContent.metCirceAsGrossInsectPerson = true;
         doNext(get_camp().returnToCampUseOneHour);
      }
      
      public function encounterCirceCave3() : void
      {
         var answer4:int;
         var _g4:CorruptedCoven;
         var answer3:int;
         var _g3:CorruptedCoven;
         var answer2:int;
         var _g2:CorruptedCoven;
         var answer1:int;
         var _g1:CorruptedCoven;
         var answer:int;
         var _g:CorruptedCoven;
         clearOutput();
         spriteSelect(SpriteDb.get_s_circe());
         outputText("你闻到了蒸汽、燃烧的煤炭和玫瑰的香味。你感到异常寒冷，这与火山岩地压倒性的炎热形成了鲜明的对比。你睁开眼睛，发现自己在一个光线充足、宽敞的房间里，但由于之前的闪光，你视野中心有一块蓝绿色的污迹，让你无法看清太多东西。");
         outputText("[pg]一个柔和但坚定的女性声音传到你的耳边。");
         if(isSufficientlyBuggy())
         {
            outputText("[pg][say: 抱歉。传送对——] 在你完全恢复视力之前，那个声音伴随着一声惊恐的尖叫逐渐消失，你再次被传送带来的令人眼花缭乱的感觉所淹没。当世界在不到一分钟的时间里第二次在你周围发生变化时，你所能做的只有呻吟。");
            doNext(encounterCirceInsectProblem);
            return;
         }
         outputText("[pg][say: 抱歉。对于没有心理准备的人来说，传送是很痛苦的，]你听到有人说，你的眼睛慢慢适应了突然涌入的光线。你摆好战斗姿势，用她的声音来引导你的方向。[say: 拜托，别傻了。如果我想打架，你会比仅仅失明感觉更糟。]你仍然有些怀疑，但这些话听起来很诚恳。你放下防备，你的眼睛终于适应了新的环境。");
         outputText("[pg]终于又能看清楚了，你评估了一下自己目前的位置。你身处一个装饰精美的五角形高大房间里，两端各有一个石拱门，所有拱门都在房间的中心相连。你注意到炼金台上摆满了奇怪的材料，高大的书架，以及随意堆放的凌乱书籍。细致的手绘符文覆盖了拱门并环绕着房间，让你相信整个房间就是一个巨大的魔法阵。你还注意到房间尽头有一张豪华的床和一个石制浴缸，那是玫瑰和蒸汽香味的来源。");
         outputText("[pg]你站直身子，短暂地回头看了一眼，以证实你的怀疑；这里没有明显的出口。");
         outputText("[pg]坐在你旁边一把笨重的木椅上的是一个女人，看起来三十多岁。灰白色的皮肤，火红的头发和锐利的绿眼睛。她穿着一件制作精良且暴露的裙子，主要是红色的，边缘有金色的装饰。裙子呈“Y”形，两端停在她的上臂中间，勉强遮住她丰满的乳房，两端在她的下腹部汇合，勉强遮住她的胯部，但完全露出了她的腿。她戴着许多珠宝；耳环、戒指、脚链，以及一条带有黑曜石护身符的金项链，短链将它连接到她裙子的肩膀上，为它提供额外的支撑。与她其他华丽的装饰形成有趣对比的是，她穿着简单的皮凉鞋。她双腿交叉，头靠在一只手臂上，打量着你，一只凉鞋的后跟有节奏地敲击着她的脚。你能感觉到她散发出强烈的腐化气息——她绝对被污染了。");
         outputText("[pg][say: 你确实很喜欢探索这片火山岩地，不是吗？我已经注意到你在这里鬼鬼祟祟好几次了，]她眯起眼睛打量着你，说道。[say: 你来这里的目的是什么？大多数玛瑞斯人都很聪明，会避开这个地方。]");
         outputText("[pg]她的话语中没有敌意；她似乎真的很好奇，尽管有些谨慎。你要怎么回答？");
         menu();
         _g = this;
         answer = 0;
         addButton(0,"探索",function():void
         {
            _g.encounterCirceAnswer(answer);
         }).hint("你只是喜欢探索。");
         _g1 = this;
         answer1 = 1;
         addButton(1,"性爱？",function():void
         {
            _g1.encounterCirceAnswer(answer1);
         }).hint("很明显，你想找点新乐子操一操。");
         if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,2646) > 0 && FlagDict_Impl_.arrayReadInt(KFLAGS.flags,2649) == 0)
         {
            _g2 = this;
            answer2 = 2;
            addButton(2,"魔像",function():void
            {
               _g2.encounterCirceAnswer(answer2);
            }).hint("你发现了那个该死的魔像，不把它干掉你绝不罢休。");
         }
         if(get_player().hasKeyItem("Poorly done map to volcanic crag"))
         {
            _g3 = this;
            answer3 = 3;
            addButton(3,"高塔",function():void
            {
               _g3.encounterCirceAnswer(answer3);
            }).hint("你有一张某种地牢的地图，你正在顺藤摸瓜。");
         }
         if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,1239) == 0)
         {
            _g4 = this;
            answer4 = 4;
            addButton(4,"莉希丝",function():void
            {
               _g4.encounterCirceAnswer(answer4);
            }).hint("你需要找到并击败莉希丝，而这里看起来是个邪恶女王定居的好地方。");
         }
      }
      
      public function encounterCirceCave2() : void
      {
         clearOutput();
         outputText("突然，你感觉到你的身体在移动，仿佛你正在以极快的速度移动，每一刻都被抛向不同的方向。你失去了平衡，差点摔倒在地，你的胃里翻江倒海，这种奇怪的感觉你只经历过一次；那就是你第一次进入通往玛瑞斯的传送门时。远处闪烁着耀眼的光芒，让你的眼睛不堪重负，让你头晕目眩。");
         doNext(encounterCirceCave3);
      }
      
      public function encounterCirceCave() : void
      {
         if((FlagDict_Impl_.arrayReadInt(KFLAGS.flags,2675) & CorruptedCoven.MET_CIRCE) != 0)
         {
            reencounterCirce();
            return;
         }
         clearOutput();
         outputText("当你在火山岩地那满目疮痍的景象中探索时，有什么东西引起了你的注意。那是一个小山洞，隐蔽地坐落在一座布满裂缝的大山丘一侧，它暴露在外的一面覆盖着发光的、锯齿状的超高温岩石纹路。");
         outputText("[pg]好奇心战胜了你，你决定去调查一下。你确信自己已经见过这座山丘几十次了，却从未注意到这个山洞。");
         outputText("[pg]走向山洞的过程平淡无奇，但你却有一种不祥的预感，因为你无法看清即将进入的黑暗内部的任何特征。你小心翼翼地向里面张望，但黑暗是压倒性的。阳光通常很难穿透火山岩地被火山灰覆盖的天空，但更贴切的说法是，光线正在被主动地从这个地方<i>抽离</i>。[if (intelligence > 80) { 毫无疑问，这是魔法的杰作|你想知道法师是否能制造出这样的幻象}]。你咬紧牙关，绷紧肌肉，走进山洞，在黑暗中摸索着岩壁前进。");
         outputText("[pg]进去仅仅三秒钟后，里面就黑得什么也看不见了。你转过身，发现入口已经消失了。");
         if(get_player().hasStatusEffect(StatusEffects.KnowsWhitefire))
         {
            outputText("你决定在地上施放法师之火来驱散这压倒性的黑暗，但你突然发现自己无法使用力量。这里肯定有某种类型的诅咒或结界。");
         }
         outputText("[pg]没过多久，你就失去了对周围环境的感知，崎岖的岩壁似乎从你的指尖逃离，小山洞感觉宽敞了许多，吹进山洞的热风也停滞了，变得凉爽起来。有一段时间，你只能听到自己的呼吸声。你尽可能地做好准备，以防受到某种攻击。");
         doNext(encounterCirceCave2);
      }
      
      public function encounterCirceAnswer(param1:int = 0) : void
      {
         clearOutput();
         switch(param1)
         {
            case 0:
               outputText("你告诉她你只是喜欢探索世界。她笑了，笑得有些困惑。[say: 你只是“喜欢探索”？你知道的，有更好的地方可以去散步。][pg]你说你几乎已经走遍了所有地方，而你刚刚找到她这一事实，就足以证明这里有有趣的东西可以发现。她抬起头，微微撅起嘴唇，然后迅速点头表示同意。[say: 我想也是。很有趣。]");
               break;
            case 1:
               outputText("你告诉她你正在寻找一些人——或者东西——来操。她叹了口气，一缕红发飘起，离开了她的嘴唇。[say: 我早该猜到的。好吧，我听说这附近有一些女孩到处游荡，她们就喜欢随便找个陌生人上床。][pg]你挑起眉毛，朝她点了点头。她立刻明白了你的意思。[say: 是的，我懂了。也许吧？走着瞧。你不觉得当性爱变得如此……廉价时，会有点无聊吗？]");
               break;
            case 2:
               outputText("你告诉她你在探索时发现了一种魔法构造体，现在你想干掉它。[say: 哦，我知道那个魔像。那可是件了不起的作品。别傻了，那东西是坚不可摧的。如果你只是因为无聊而变成地上的焦痕，那就太可惜了。][pg]你眯起眼睛告诉她，如果有东西可以打，你<i>必须</i>去打。[say: 好吧，随你喜欢，或者，在这种情况下，随你被蒸发。不过我的建议是？停手吧。]");
               break;
            case 3:
               outputText("你告诉她你有一张通往一座高塔的地图，据说那座塔就在火山岩地附近。她看起来明显很惊讶，但试图掩饰。[say: ……嗯。这很奇怪。依我看，你被骗了。我在这里住了几十年——我是说，差不多十年了，我什么都没看到。抱歉。][pg]你告诉她你只能自己去弄清楚了。[say: 好吧，我拦不住你。或者说，我懒得去拦。那么，祝你好运。]");
               break;
            case 4:
               outputText("你告诉她你有一个任务，要找到并击败莉希丝，并且[if (cor < 60) { 解除她对这片土地的恶魔控制|取代她对这片土地的统治}]。她轻笑了一声。[say: 呵，你真是个[if (cor < 60) {英雄|恶魔}]。好吧，那我就给你指个方向：她不在岩地。或者也许她在，只是我运气好，从来没碰见过她。]你告诉她你的任务不是开玩笑的。[say: 莉希丝绝对不是开玩笑的，但我恐怕一个在世界上随便乱逛的人对她构不成什么威胁。我可能错了，但感觉不像。]");
         }
         outputText("[pg]她把手从下巴上拿开，坐直了身子。她双手合十，陷入沉思。[say: 奇怪。非常奇怪。][pg]她保持沉默，好几秒钟你除了水流声和煤炭燃烧的声音什么也听不到。[pg]又过了好几秒钟。[pg]又过了好几好几秒钟。[pg]你终于厌倦了这种沉默，开始靠近她，这个女人似乎陷入了恍惚之中。就在你要碰到她之前，她迅速“醒”了过来。[say: 好吧。我叫喀耳刻。很高兴认识你，并进行了这次富有启发性的对话。]你试图告诉她你几乎没怎么和她说话，但她打断了你。[say: 祝你好运，万事顺遂。再见。]");
         outputText("[pg]你试图抓住她的手臂把她摇醒，但她打了个响指，你突然发现自己又回到了火山岩地的中央。");
         outputText("[pg]你环顾四周，试图再次找到那座开裂的山丘和洞穴，但除了平常荒芜、被炸毁的风景外，什么也没有。你呻吟了一声，决定返回营地，不知道是否还能再找到她。");
         var _loc2_:IMap = KFLAGS.flags;
         FlagDict_Impl_.arrayWriteInt(_loc2_,2675,FlagDict_Impl_.arrayReadInt(_loc2_,2675) + CorruptedCoven.MET_CIRCE);
         doNext(get_camp().returnToCampUseOneHour);
      }
      
      public function demonLord2() : void
      {
         clearOutput();
         outputText("战斗持续了几分钟，到最后，你整个王座室都被白焰烧焦了，几根柱子和拱门也碎裂了。你受了不小的伤，你的卫队成员仅仅因为附带伤害就丧命了。");
         outputText("[pg]而在你面前，喀耳刻跪倒在地，伤势过重，已无力再战。她失败了。你的胜利现在已经彻底完成。");
         outputText("[pg]当然，要宣告你绝对的胜利，还有最后一步。她必须屈服，亲自向你投降。");
         outputText("[pg]你一挥手，盔甲便消失不见，露出你那十二英寸长的恶魔肉棒。你撸动了几下，紫色的龟头上渗出了一滴污秽的先列腺液。她睁大了眼睛，意识到自己将要承受什么；那是许多人都未能抵抗的命运。");
         outputText("[pg][say:不……这不可能！我是光之战士！你不可能获胜！]她呻吟着，试图再次站起来，却失败了。");
         outputText("[pg]你让她闭嘴，同时强行抓住她，把你的肉棒拍在她的脸上，将你的先列腺液涂抹在她的鼻子和嘴唇上。效果立竿见影；她的眼神变得迷离，小穴也开始滴水，几乎瞬间就被欲望吞没。你笑了；没有哪个女人能抵挡你那堕落的精液。你继续在她脸上摩擦，她原本愤怒的脸庞变得柔和，每一次摩擦都让她更加沉沦于你的肉棒。很快，她开始心不在焉地跟着你的动作，用嘴唇追逐着你的肉棒。你停了下来，慢慢地把你的老二从她身边拉开。");
         outputText("[pg]她的嘴巴微张，舌头正伸向你那跳动的龟头，就在这时，她的眼神重新聚焦。她猛地退缩，站起身来，再次挥舞起她的剑。");
         outputText("[pg][say: 你还没征服我呢，恶魔！]喀耳刻大喊着，鼓起她所能聚集的所有决心。然而你注意到，尽管她嘴上这么说，她的目光却时不时地瞥向你的肉棒，她的臀部因欲望而颤抖。她已经完全被迷住了。");
         outputText("[pg]你耸了耸肩，承认她是对的。你告诉她，她已经证明了自己能够抵抗你的恶魔魅惑，她最终击败你只是时间问题。你问她是否允许你在投降并被她了结之前，最后再蹂躏一次你的奴隶。");
         outputText("[pg][say: 你……你……如果你打算投降，那我会大发慈悲，允许你最后再爽一次。去吧。]");
         outputText("[pg]你感谢她的仁慈，转过身去。就在你的肉棒离开她视线的那一刻，你听到她发出一声绝望的轻吟。");
         outputText("[pg]你再次坐上王座，邀请你最忠诚的奴隶之一来服侍你的肉棒。一个紫肤魅魔拼命地爬向你，一口吞下你的肉棒，不顾一切地吸吮呻吟着，每次完全吞下你的阴茎时，她的臀部都会颤抖，小穴也会喷出淫液。其他的奴隶则乞求能尝一口你的阴茎，完全渴望着只有你才能赐予她们的那种快感。");
         outputText("[pg]你把头靠在手臂上，看着她套弄你的肉棒。随着时间的推移，你注意到喀耳刻越来越恍惚，被你的存在所催眠。她慢慢地向你挪动，一开始还挥舞着剑，然后又放下了。她的决心只恢复了几秒钟就再次崩溃，你的催情光环对她那疲惫不堪的身体来说实在难以承受。");
         outputText("[pg]你告诉正在吞吐你肉棒的魅魔，已经够润滑了。她最后舔了一次你的肉棒，然后转过身，迅速地将自己插在你身上，吞下整整十二英寸的肉棒，迫不及待地骑乘起来。随着每一次抽插，她丰满的双乳上下弹跳，臀部颤抖，而剩下的魅魔则舔舐着她泥泞的小穴，挑逗着她的双乳，争抢着空间，用快感折磨这个幸运的荡妇，好让她早点为她们腾出位置。在这一切之中，你注意到喀耳刻正在向前移动，她想要结束你生命的渴望随着每一步而减弱。");
         outputText("[pg]骑在你肉棒上的魅魔迎来了第三次高潮，她声嘶力竭地尖叫着，这种高潮足以让任何人类立刻失去灵魂。你问她成为你的奴隶之前叫什么名字，以及她对前世还有什么记忆。");
         outputText("[pg][say: 嗯啊——帕西法尔，我的主人！我已经什么都不记得了！我满脑子想的都是您的肉棒！] 喀耳刻丢下了她的剑。她以为多年前在战斗中自杀的姐姐，竟然成了魔王最忠诚的奴隶之一。那个促使她踏上纯洁与复仇之旅的人，现在正骑在你的肉棒上尖叫高潮，为了放肆的欲望完全抛弃了她的誓言。");
         outputText("[pg]你感谢奴隶的回答。作为奖励，你抓住她的臀部，凶狠地挺进她体内，用你的恶魔巨根在她体内疯狂抽插，直到她完全失去对四肢的控制，变成了一个只会发狂呻吟的肉棒套子，随着每一次抽插喷出大量的淫水。这种快感即使是恶魔也难以承受，她失去了理智，语无伦次地胡言乱语，说着你和你的肉棒有多么美妙。你把她从你的肉棒上推开，她瘫倒在地，仍然沉浸在几十次高潮的余韵中。你站起身，你的巨根骄傲地勃起着，闪烁着恶魔的体液，强有力地跳动着，濒临高潮。你环顾四周，问你的荡妇们谁最想得到你的精液。她们全都尖叫起来，乞求这份荣誉，你告诉她们必须为此而战。最后站着的人将获得这份荣誉。");
         outputText("[pg]她们互相攀爬，开始了一场混战，大多数人都被欲望冲昏了头脑，根本无力抵抗。你只是看着并大笑，看着你的奴隶一个接一个地被击倒。最后，只剩下一个人。");
         outputText("[pg]一个神志不清、浑身湿透的喀耳刻，她翠绿色的眼睛死死盯着你肉棒的每一次跳动。");
         outputText("[pg]你祝贺她高超的战斗技巧，并说现在是时候让这片土地上最伟大的战士兼女巫获得她勇气的奖赏了。你把布满肉瘤的肉棒指向她，马眼张开，准备射出积蓄已久的精液。");
         outputText("[pg][say: 我的……我的奖赏……] 喀耳刻说着，慢慢地向你挪动，同时脱下她的内衣，那皮革和金属板制成的内裤已经被她的淫水完全浸透了。她四肢着地爬上讲台，一只手已经在挑逗自己。你告诉她把自己献给你，这样她就可以被封为骑士。她照做了。");
         outputText("[pg]你把恶魔般的龟头悬在她的阴唇上方，仅仅是触碰到你的阴茎，她的小穴就抽搐起来。你继续向里推进，喀耳刻呻吟着，因期待而颤抖。");
         outputText("[pg]你让她开口要你的肉棒。");
         outputText("[pg][say: 求您了，[name]大人。把您的肉棒给我。把我变成骑士，就像您对我姐姐做的那样！]");
         outputText("[pg]你大笑着，把肉棒插进她体内。一开始你遇到了一些阻力，但到了第三次抽插时，她的阴道已经完全接纳了你。她的肉壁收紧，按摩着你的阴茎，喀耳刻因为她努力争取来的快感而尖叫。你继续在她体内抽插，同时把她转过身来，她迷离的目光中绽放出笑容，她撕开自己的比基尼盔甲，把双乳挤在一起，进一步诱惑你。");
         outputText("[pg]你把她的双腿抬起搭在你的肩膀上，身体向她蜷缩，在战士女巫喀耳刻完全堕落之前，最后看她一眼。你告诉她准备好接受你的精液，并告诉她，她很快就会失去灵魂，变成一个恶魔，一个除了时刻渴望性爱之外什么都不做的生物。");
         outputText("[pg][say: 是的！是的！操我！转化我！] 她尖叫着，身体因为即将到来的高潮而紧绷。你满足了她，将自己深深埋入她体内，把你的恶魔之种释放到她欢迎的子宫里。每一股涂抹在她体内的精液都让她的身体因快感而扭曲，她的身体不受控制地颤抖着，还不习惯你所能提供的巨大快感。");
         outputText("[pg]她疯狂的尖叫很快变成了平缓、性感的叹息。她的皮肤变成了淡蓝色，巩膜漆黑一片，额头上长出了优雅的角。你把肉棒从她现在紧如老虎钳的小穴中拔出，你的肉棒上覆盖着液态的魂晶，那是喀耳刻的灵魂。");
         outputText("[pg]你心想，你现在的力量已经足够强大了。你将沾满魔晶的阴茎展示给喀耳刻，命令她吞下自己的灵魂和你的肉棒，作为她臣服于你的最终证明。她魅惑地笑了笑，性感地向你爬来，张大嘴巴，伴随着一声长长而慵懒的呻吟，将你的肉棒吞入口中。");
         outputText("[pg]她像真正的魅魔那样吮吸着，用尽舌头的每一寸来同时取悦你整整十二英寸的肉棒。她慢慢地抽出你的阴茎，吸干了上面的每一滴精液和魔晶。伴随着一声湿润的“啵”声，你的肉棒从她嘴里拔出，干干净净。");
         outputText("[pg]她叹了口气，享受着从自己灵魂中诞生的纯粹恶魔力量。你向她伸出手，邀请她与你一同统治这个恶魔帝国。她微笑着握住你的手站了起来。她舔了舔你的胸膛，用一条腿勾住你的腿，告诉你所有那些躲过了你军队的隐藏定居点。");
         outputText("[pg]你心想，他们躲不了多久了。");
         get_player().orgasm("Dick",true,2);
         doNext(postCirceSex);
      }
      
      public function demonLord() : void
      {
         clearOutput();
         outputText("[say: 我明白了。那么，很好。][pg]大厅的墙壁和地板渐渐远去，黑暗吞噬了你所有的感官。你的记忆被扭曲重塑，一个新的身份接管了你的身体。[pg]你的视线清晰起来，看到一个宏伟的大厅，几座巨大的华丽石拱门通向一扇巨大的门。你坐在一个浮夸的高台王座上，各种体态的女人环绕在台阶的每一级，有些挺着淫秽肿胀的孕肚。有些被违背意愿地锁住，而另一些则是自由的，她们的眼神浑浊，永远迷失在快感中。她们每个人的小穴里都渗出恶魔的精液。你的精液。[pg]你的私人卫队在高台前严阵以待，身穿重甲的梦魔和魅魔准备为你——魔王，玛瑞斯的征服者——战斗并赴死。许多人试图反抗你，但他们都失败了。除了一个人。在这个领域里还有最后的一股反抗力量，战士兼女巫喀耳刻。[pg]大厅尽头的大门在猛烈的撞击下摇晃。你的私人卫队就位，将长矛和戟指向大门。伴随着又一次撞击，大门猛烈地打开，伴随着巨大的砰砰声撞击在石墙上。光线刺穿了你的王座室，你看到了她的轮廓。喀耳刻接受了你的挑战，独自前来与你战斗。[pg][say: 魔王！我来应战了！如果你敢的话，就来和我单挑吧！] 喀耳刻一边说着，一边走进大厅，离开刺眼的光线，足以让你看清她的容貌。");
         outputText("[pg]她的板甲比基尼被擦拭得一尘不染，在保护她的同时，甚至能迷住最强大的恶魔。她火红的头发为她赢得了“纯洁之火”的称号，仅仅是提到这个名字，就能让任何理智的恶魔心生恐惧。她从剑鞘中拔出剑指向你，那庞大的纯洁气息让你不禁退缩。她的圣剑已经尝过数百只恶魔的鲜血，此刻正闪耀着光芒，那是她对抗你的希望与动力的灯塔。");
         outputText("[pg]你从王座上站起来，把一个被迷住的奴隶从你的恶魔肉棒上推开，同时挥手召唤回你的黑暗盔甲。你伸出手，召唤出你自己的刀刃，这是一把由纯粹的莉希丝矿石制成的锯齿状残忍武器。你命令你的卫队退后；你要独自对付她。你大笑着向她冲去，准备迎接自你亲自击败莉希丝以来最伟大的一场战斗。");
         doNext(demonLord2);
      }
      
      public function debugMenu(param1:Boolean = true) : void
      {
         get_game().debugMenu.debugCompEdit(saveContent,new SaveContent(null,null));
      }
      
      public function commentOnCasualLook(param1:int = 0) : void
      {
         clearOutput();
         switch(param1)
         {
            case 0:
               outputText("你告诉她你更喜欢她休闲的打扮，也许她应该一直保持这样。她翻了个白眼，嗤之以鼻。[say:谢谢，但我没问你对时尚的看法。我打扮不是为了取悦你，而是为了取悦我自己。]");
               outputText("[pg]随便吧，你心想。至少这事终于结束了。");
               break;
            case 1:
               outputText("你试图为自己被弄瞎并被难闻的气味熏晕而道歉。她看出了你明显的言不由衷，但还是接受了。[say:很好。很好。希望不会有下次了。]");
               outputText("[pg]随便吧，你心想。至少这事终于结束了。");
               break;
            case 2:
               outputText("你告诉她，她根本没理由那样弄瞎你，如果她还没准备好谈话，就应该把她的洞穴藏好。总有一天，你可能会做出和她一样激烈的反应。");
               outputText("[pg]你似乎戳到了她的痛处，但同时也说到了点子上。[say:好吧。你是对的。我那样的反应确实不妥。你吓到我了，但我本该保持形态，直接让你在外面等。不会有下次了，]她说着，微微低头道歉。");
               outputText("[pg]随便吧，你心想。至少这事终于结束了。");
         }
         var _loc2_:IMap = KFLAGS.flags;
         FlagDict_Impl_.arrayWriteInt(_loc2_,2675,FlagDict_Impl_.arrayReadInt(_loc2_,2675) + CorruptedCoven.CAUGHT_ALCHEMY);
         buildOptionsMenu();
      }
      
      public function circeUnlockable() : Boolean
      {
         if((FlagDict_Impl_.arrayReadInt(KFLAGS.flags,2675) & CorruptedCoven.MET_CIRCE) == 0 && !circeAversion())
         {
            if(get_player().level <= 12)
            {
               return get_time().days > 95;
            }
            return true;
         }
         return false;
      }
      
      public function circeSex() : void
      {
         var _g:CorruptedCoven;
         clearOutput();
         outputText("你问喀耳刻，把所有时间都花在这个房间里，她会不会觉得孤独。毕竟，你遇到的大多数女巫都相当好色……");
         if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,2706) < 4)
         {
            outputText("[pg]她翻了个白眼，打断了你的话。[say: 你就是为了这个来的？真的吗？外面有大把的男人、女人和怪物可以让你满足自己。我本以为大老远跑到这火山岩山来的人，脑子里偶尔会装点别的东西。][pg]你告诉她，那些堕落魔女就住在这里，而且她们会主动攻击任何不和她们做爱的人，所以她的说法有点讽刺。[pg][say: 那就去操她们其中一个吧。我相信她们会很乐意的。如果你来这里只是为了找个洞发泄，恐怕你要失望了。][pg]" + get_player().lowMedHighCor("最好还是尊重她的意愿。也许如果你向她证明你来这里不是为了做爱，她会改变主意的。","一个暴力的念头从你脑海中闪过，但你摇了摇头把它甩掉。也许如果你向她证明你来这里不是为了做爱，她会改变主意的。","你几乎无法抑制现在就攻击并强暴她的欲望，但她的咒术仍然生效着；在她的房间里和她战斗无异于自杀。也许如果你向她证明你脑子里不只有做爱，她会改变主意的。"));
            _g = this;
            doNext(function():void
            {
               _g.buildOptionsMenu();
            });
         }
         else
         {
            outputText("[pg]她用修剪完美的纤指轻轻摩挲着下巴。[say: 书本能很好地陪伴我。你到底在想什么，嗯？你想和我做什么？] ——她诱惑地笑着，挑逗着你。");
            outputText("[pg]你走近她，她交叠又松开双腿，让你隐约瞥见她那相当暴露的内衣。你暗示了一些可能性：你，她，一些酒和她的床。也许还有浴缸。也许两者都有。她笑着在椅子上转过身，把腿搭在扶手上，让你在她的姿势中一览无余地欣赏她的曲线。她那暴露的衣服领口开得更低了，你短暂地看到了她乳晕的轮廓。然而，她很快就把衣服拉过滑落的乳头，她双手的动作引导你再次看向她的脸。");
            outputText("[pg]你再次看着她的眼睛，完全被迷住了，她那翡翠般的眼睛像万花筒一样闪烁着，让你目眩神迷。");
            outputText("[pg][say: 不，[name]。在内心深处，你渴望什么？想象一下。在你的幻想中看到你自己……那是什么？][pg]房间变暗了。只有你，微笑着的喀耳刻，以及她的问题。你渴望什么？[pg][say: 你渴望什么？]");
            menu();
            addButton(0,get_player().mf("国王","女王") + "与妃子",kingAndConcubine).hint("你将自己视为一位强大的" + get_player().mf("国王","女王") + "。你拥有整个后宫，但总有一位妃子最让你着迷。");
            addButton(1,"魔王",demonLord).hint("你将自己视为一位魔王。经过漫长的战争，你和你的手下终于抓住了那个不断阻挠你计划的战士法师……");
            addButton(14,"返回",cancelSex).hint("仔细想想，还是算了。");
         }
      }
      
      public function circeRewards() : void
      {
         var _g6:CorruptedCoven;
         var reward5:int;
         var _g5:CorruptedCoven;
         var reward4:int;
         var _g4:CorruptedCoven;
         var reward3:int;
         var _g3:CorruptedCoven;
         var reward2:int;
         var _g2:CorruptedCoven;
         var reward1:int;
         var _g1:CorruptedCoven;
         var reward:int;
         var _g:CorruptedCoven;
         clearOutput();
         var _loc1_:int = FlagDict_Impl_.arrayReadInt(KFLAGS.flags,2706);
         if((FlagDict_Impl_.arrayReadInt(KFLAGS.flags,2675) & CorruptedCoven.BROUGHT_MANOR_BOOKS) != 0)
         {
            _loc1_++;
         }
         menu();
         outputText("你问喀耳刻，对于你带给她的信息，她有没有想好什么奖励。她把一根手指放在下巴上，思考着。[say: 很好，让我看看。]");
         if((FlagDict_Impl_.arrayReadInt(KFLAGS.flags,2675) & CorruptedCoven.TALKED_GARGOYLE) != 0 && !get_player().hasStatusEffect(StatusEffects.KnowsCSS))
         {
            outputText("[pg][say: 你关于石像鬼的信息特别有趣。我曾涉猎过赋予无生命物体生命的机制。我还没能创造出一个有感知能力的生物，但我确实自学了一个在战斗中召唤活体剑的法术。我相信你能用得上它。]");
            _g = this;
            reward = 1;
            addNextButton("召唤魔剑",function():void
            {
               _g.getRewards(reward);
            }).hint("学习一个能让你在战斗中召唤活体魔剑的法术。").disableIf(get_player().get_inte() < 70,"你的智力不足以学习这个法术。");
         }
         if((FlagDict_Impl_.arrayReadInt(KFLAGS.flags,2675) & CorruptedCoven.TALKED_MANOR_DULLAHAN) != 0 && !get_player().hasStatusEffect(StatusEffects.KnowsWither))
         {
            outputText("[pg][say: 你带给我的关于死灵法师和他的书的信息给了我一个启发。并非所有的死灵法术都必须严格地施展在死者身上。其中一些可以用于活人，产生相当不舒服的效果，比如受到普通治疗魔法的伤害。]");
            _g1 = this;
            reward1 = 2;
            addNextButton("枯萎术",function():void
            {
               _g1.getRewards(reward1);
            }).hint("学习一个能让敌人从内部腐烂的法术，使治疗效果反而造成伤害。").disableIf(get_player().get_inte() < 85,"你的智力不足以学习这个法术。");
         }
         if((FlagDict_Impl_.arrayReadInt(KFLAGS.flags,2675) & CorruptedCoven.TALKED_MARAE_BLESS) != 0 && !get_player().hasStatusEffect(StatusEffects.KnowsDivineWind))
         {
            outputText("[pg][say: 玛莱赐予你的祝福相当有趣。虽然我不敢奢望能与女神的恩赐相提并论，但它启发了我，让我创造出一种法术，能用净化之雾覆盖一片区域，治愈一切伤口。]");
            _g2 = this;
            reward2 = 3;
            addNextButton("神圣之风",function():void
            {
               _g2.getRewards(reward2);
            }).hint("学习一种法术，能在几个回合内治愈敌我双方。");
         }
         if(_loc1_ >= 6 && (FlagDict_Impl_.arrayReadInt(KFLAGS.flags,2675) & CorruptedCoven.TALKED_DOMINIKA_SWORD) != 0 && (FlagDict_Impl_.arrayReadInt(KFLAGS.flags,2675) & CorruptedCoven.GOT_RING_OF_ETHEREAL_TEARING) == 0)
         {
            outputText("[pg][say: 虽然我无法在这里练习或测试任何基于星辰影响的魔法，但这仍然是一笔宝贵的知识。作为奖励，我可以给你一枚用陨石矿制成的戒指。它具有相当奇特的属性。你可能会发现它们很有用。]");
            _g3 = this;
            reward3 = 4;
            addNextButton("戒指",function():void
            {
               _g3.getRewards(reward3);
            }).hint("获得虚空撕裂之戒，它能让你对免疫流血的敌人造成流血效果。");
         }
         if(_loc1_ >= 4 && (FlagDict_Impl_.arrayReadInt(KFLAGS.flags,2675) & CorruptedCoven.GOT_MAJOR_RING_OF_ACCURACY) == 0)
         {
            outputText("[pg][say: 你给我带来了足够的知识，我愿意割爱我收藏中的一枚戒指。在我看来，它的外观相当过时，但你可能会欣赏它为你带来的命中率提升。]");
            _g4 = this;
            reward4 = 5;
            addNextButton("戒指",function():void
            {
               _g4.getRewards(reward4);
            }).hint("获得一枚附魔的缟玛瑙戒指，它将极大地提高你的命中率。");
         }
         if(_loc1_ >= 8 && (FlagDict_Impl_.arrayReadInt(KFLAGS.flags,2675) & CorruptedCoven.GOT_SPECTRE_RING) == 0)
         {
            outputText("[pg][say: 为了感谢你的诸多贡献，我可以给你我收藏中最珍贵的戒指之一。有记录表明，过去的刺客曾使用魔法来隐藏自己，躲避攻击并以致命的精度进行打击。虽然它不会让你隐身，但这枚戒指绝对会在你进行更像盗贼的活动时为你提供帮助。不过请记住，这枚戒指似乎会从佩戴者自身的生命力中汲取部分力量。]");
            _g5 = this;
            reward5 = 6;
            addNextButton("戒指",function():void
            {
               _g5.getRewards(reward5);
            }).hint("获得幽灵之戒，它将增强你躲避和造成暴击的能力，代价是消耗你的一些生命力。");
         }
         if(get_output().menuIsEmpty())
         {
            outputText("[pg]<b>目前没有可用的奖励。它们将在更多对话后解锁。</b>");
         }
         _g6 = this;
         addButton(14,"返回",function():void
         {
            _g6.buildOptionsMenu();
         });
      }
      
      public function circeJeremiah() : void
      {
         var _g:CorruptedCoven;
         clearOutput();
         outputText("你看到耶利米在房间的另一端，离喀耳刻的床和浴缸尽可能远。一本书小心翼翼地放在他无法移动的手臂上，如果他想看的话就可以看。你走近他，他向你挥手，石头摩擦石头的声音瞬间充满了你的耳朵。");
         outputText("[pg][say:你好，[name]。来看那个老太婆了，是吧？不知为什么，你就是对老年人情有独钟。]");
         outputText("[pg]喀耳刻要么没听见，要么已经习惯了，在房间的另一头毫无反应。");
         outputText("[pg]你问他换了新环境感觉如何。");
         outputText("[pg][say: 我得说，这绝对是个进步！有那么多书可以读，有活物可以聊天，而且她经常忘记我在这里，特别是她出浴的时候！比看着烧焦的尸体好多了。]");
         outputText("[pg]你表示同意。你走近他，默默地询问他对喀耳刻本人的看法。他的目光变得严肃了一些。");
         outputText("[pg][say: 不管我瞒了她多少，[name]，你可以肯定她瞒着我和你的事情更多。也许这只是一种直觉，但我这辈子见过足够多的巫师，知道他们脑子里什么时候藏着可怕的秘密。]");
         outputText("[pg]你点点头，回味着他的话。那么，你不该信任她吗？");
         outputText("[pg]耶利米摇了摇头。[say: 我不是说喀耳刻不值得信任。我们都有秘密、知识和宁愿隐藏起来的糟糕记忆，从最底层的农民到最伟大的巫师都是如此。秘密的危险程度和规模各不相同，但本质是一样的。它们都源于怀疑和焦虑，这是非常人类的情感，我认为她紧紧抓住这些情感，是为了向自己证明她仍然是人类。]");
         outputText("[pg]你顺着他的话，问他怎么看她试图控制腐化，游走在变成恶魔的边缘这件事。");
         outputText("[pg][say: 嗯，作为一名审判官，我应该把她绑在火刑柱上烧死！不过，我并不急着这么做。这只是一种直觉，但我相信她的尝试只有一部分是为了追求知识。这其中有更私人的原因。]");
         outputText("[pg]你问他有没有想过那可能是什么原因。");
         outputText("[pg][say: 没有。问也没用。她不会说的。]");
         outputText("[pg]你点点头。你短暂地想了想还有什么可以问他的，但似乎没有什么特别重要的事情。");
         outputText("[pg]直到你想起耶利米对她的称呼。你问他为什么叫她“老太婆”，她看起来明明才三十多岁。他笑了起来。");
         outputText("[pg][say: 呵呵呵，你知道的，我曾经结过婚。女人年纪大了，就会想方设法掩饰自己的年龄。巫师能做的比大多数人都多，但我一眼就能看穿。如果她才三十多岁，那我就是个青少年！呃，不过别跟她提这个。你可不像我一样是不死之身。]");
         outputText("[pg]你面带微笑地思考着他的话。");
         outputText("[pg]耶利米突然沉默了，你感觉到身后有一股黑暗的气息。你慢慢转过身，看到远处的喀耳刻，她的脸上带着一丝怒意，但你知道那下面隐藏着一座即将爆发的愤怒火山。");
         outputText("[pg][say: 嗯，是啊。希望你今天学到了一些东西，[name]。回见！] 耶利米再次向你挥手。你决定听从他的建议，暂时把喀耳刻的年龄当作一个谜。");
         _g = this;
         doNext(function():void
         {
            _g.buildOptionsMenu();
         });
      }
      
      public function circeIntros() : void
      {
         var clearOutputText:Boolean;
         var _g:CorruptedCoven;
         var _loc1_:* = null as IMap;
         spriteSelect(SpriteDb.get_s_circe());
         clearOutput();
         if(isSufficientlyBuggy())
         {
            outputText("喀耳刻正坐在大厅尽头的一张桌子旁，一边研究着一本厚重的典籍，一边从一个华丽的高脚杯里啜饮着某种饮料。她把目光转向你，惊恐地睁大了眼睛，颤抖的手几乎握不住酒杯。");
            outputText("[pg][say:以玛莱的名义，你到底是什么——]喀耳刻松开她的典籍，用空着的手捂住脸，目光向下移以避开你。[say:我给你十秒钟时间自己离开。如果你能听懂我刚才说的话，我建议你照做。]");
            outputText("[pg]你又向前迈了一步，这让女巫吓得从椅子上跳了起来，摆出了你认为是战斗姿态的架势。她松开了酒杯，但它只是悬浮在半空中。你告诉她你能听懂她的话，但她的洞穴并没有真正的出口。");
            outputText("[pg]她的目光来回闪烁，只是偶尔与你对视，她妥协了。[say:是、是的，好吧，我会解决的。再见。]");
            outputText("[pg]你试图问她到底发生了什么事，但还没等你说完，你已经被传送出了她的房间。你重新出现在峭壁上，双手还保持着询问的姿势。");
            outputText("[pg]你垂下肩膀，对刚才发生的事情感到困惑。也许喀耳刻有歇斯底里症，你心想。");
            saveContent.metCirceAsGrossInsectPerson = true;
            doNext(get_camp().returnToCampUseOneHour);
            return;
         }
         if((FlagDict_Impl_.arrayReadInt(KFLAGS.flags,2675) & CorruptedCoven.TOLD_NAME) == 0)
         {
            outputText("喀耳刻正坐在大厅尽头的一张桌子旁，一边研究着一本厚重的典籍，一边从一个华丽的高脚杯里啜饮着某种饮料。她站起身向你走来。石头地板上清脆的咔哒声让你低下头，你注意到，她没有穿以前的木凉鞋，而是穿了一双更加华丽精致的木制高跟鞋。你没多想。");
            outputText("[pg][say:又见面了……]她的声音渐渐变小。[pg]你起初以为她只是在故弄玄虚，但很快你发现她其实不知道你的名字。你告诉了她你的名字打破了沉默，她为自己的失误真诚地笑了。[pg][say:我一直没问过你的名字，对吧？谢谢你帮我，[name]，过去几年我没多少机会练习我的社交技巧。][pg]");
            if(get_player().get_inte() >= 90)
            {
               outputText("你问她这就是她为你打破洞穴入口幻象的原因吗。她露出惊讶的微笑，一边喝着饮料，一边用深邃的分析目光盯着你。[say:你很敏锐，[name]。我喜欢。这只对了一部分。我确实打破了幻象，但我邀请你来这里不是为了简单的闲聊。让我给你解释一下。]");
            }
            else
            {
               outputText("你告诉她，你偶然发现她的洞穴真是一个幸运的巧合。她看向一旁，然后又看向你。[say:不是吗？这很方便，但考虑到你有多喜欢在峭壁周围闲逛，我想这迟早会发生。不过，我把你留在这里不是为了简单的闲聊。让我给你解释一下。]");
            }
            outputText("她伸出手，酒杯在念力的作用下移动，向上漂浮，然后飘向她刚才研究的桌子。她向你走来，臀部诱人地摇摆着，华丽的裙子勉强遮住她的乳房和胯部。玫瑰的香味扑鼻而来，她轻松的表情变得更加严肃，翠绿色的眼睛直勾勾地盯着你。");
            outputText("[pg][say:你在探索世界，对吧？我需要信息，魔法方面的信息。我需要知识，关于法术、诅咒、妖术和祝福的知识。][pg]你开始插话，问你能得到什么回报，但她打断了你。[say:作为回报，我会给你一些知识，或者魔法小饰品，如果你更喜欢的话。我们走着瞧。]她转过身，走向大厅中央，坐在你第一次见到她时她坐的那把椅子上。[pg]你问她为什么想要这么多魔法知识。[say:它本身就是一种奖励。此外，我需要一个不同的视角。顿悟的火花可能来自最不寻常的地方，]她说道，眼睛盯着远处的某个点，对你的注意力已经迅速消退。");
            outputText("[pg]你思考了一下，准备回答。然而，还没等你开口，她打了个响指，你又被传送到了峭壁上。");
            outputText("[pg]这绝对令人沮丧，你心想，但你毫不怀疑你会再次找到她。");
            outputText("[pg]你开始往营地走，这时你听到身后传来低沉、扭曲的声音，伴随着微小的闪光。你转过身，看到地上有一枚小小的玛瑙戒指，上面覆盖着正在消散的蓝色魔法雾气。这可能是喀耳刻传送给你的，你心想。[pg]");
            get_inventory().takeItem(get_jewelries().ACCRN1,get_camp().returnToCampUseOneHour,get_camp().returnToCampUseOneHour);
            _loc1_ = KFLAGS.flags;
            FlagDict_Impl_.arrayWriteInt(_loc1_,2675,FlagDict_Impl_.arrayReadInt(_loc1_,2675) + CorruptedCoven.TOLD_NAME);
         }
         else
         {
            switch(Utils.rand(2))
            {
               case 0:
                  genericCirceIntros();
                  break;
               case 1:
                  if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,2706) > 8 && Utils.rand(3) == 0)
                  {
                     sipWineWithCirce();
                     return;
                  }
                  if((FlagDict_Impl_.arrayReadInt(KFLAGS.flags,2675) & CorruptedCoven.CAUGHT_ALCHEMY) == 0)
                  {
                     catchCirceOnAlchemy();
                     return;
                  }
                  outputText("你又看到喀耳刻在她的炼金桌旁。不过，你吸取了教训。你在附近找了本书，翻开它，坐在椅子上，带着无聊的表情阅读，一边等她完成工作。你确保背对着她，以免她最终注意到你的存在时朝你扔火球。");
                  outputText("[pg]经过漫长得令人痛苦的等待，你用力合上书，发出足够大的声音吓了她一跳。[say:哦，[name]。你来了。等一下。]你暗自抱怨，但她没花多长时间就穿好了衣服。[pg][say:很好，你可以转过来了。你给我带来了什么？]当你转过椅子面对她时，她问道。她坐下时小心翼翼地戴上一只耳环，准备讨论一个话题。");
            }
            _g = this;
            clearOutputText = true;
            doNext(function():void
            {
               _g.buildOptionsMenu(clearOutputText);
            });
         }
      }
      
      public function circeEvelynEncounterEnd() : void
      {
         clearOutput();
         outputText("你在营地醒来，感到很困惑。");
         outputText("[pg]你起身环顾四周，但一切似乎都井然有序。在你的床边放着一张简短的便条，上面写着相当完美的书法。");
         outputText("[pg][say:谢谢你所做的一切。——伊芙琳]");
         outputText("[pg]就这么简单，你心想。毕竟，伊芙琳从来不是一个拐弯抹角的人。");
         var _loc1_:IMap = KFLAGS.flags;
         FlagDict_Impl_.arrayWriteInt(_loc1_,2675,FlagDict_Impl_.arrayReadInt(_loc1_,2675) + CorruptedCoven.BROUGHT_DULLAHAN);
         doNext(get_camp().returnToCampUseFourHours);
      }
      
      public function circeEvelynEncounter6() : void
      {
         clearOutput();
         get_player().orgasm("Dick");
         outputText("当你醒来时，太阳已经落山，天空中已经可以看到几颗星星。伊芙琳躺在你身边，也醒了。");
         outputText("[pg][say:你现在真的想回家吗？我想在这里过夜，在月光和星空下，]她看着天空说道。[pg]你告诉她，如果这是她想要的，你并不介意。[pg][say:当然。只有你，我，还有夜晚。这些对我来说才是唯一重要的。]");
         outputText("[pg]你暗自轻笑。你不确定她为什么这么喜欢夜晚，但你并不介意。");
         doNext(circeEvelynEncounterEnd);
      }
      
      public function circeEvelynEncounter5() : void
      {
         clearOutput();
         outputText("当你们到达湖岸时，伊芙琳没有浪费时间，她从马上跳下来，优雅地跑进蓝色的湖水中。你下了马，把马拴在附近的一棵树上，然后伸了一个长长的、慵懒的懒腰，身体的几个关节发出咔咔的响声。伊芙琳从水下浮出水面，她苍白湿润的皮肤在阳光下闪闪发光，衬衫紧紧地贴在她那适中的乳房上。");
         outputText("[pg]你跑进去加入她，拥抱她，双手向下滑动，感受她匀称的双腿。她用一条腿锁住你的腿，给了你一个短暂的吻和一个眨眼，然后挣脱你的拥抱，推开你，向湖心游去。毫无疑问，她想和你赛跑。你接受了挑战，跟在她后面。");
         outputText("[pg]你们俩筋疲力尽地到达了湖的另一端。由于她最初的优势，她先离开了湖，疲惫地宣布她战胜了你。");
         outputText("[pg][say:你变得……太胖了！哈哈！]她说着，坐下来看着你。你指出了她的优势，但她似乎并不在意，继续嘲笑你。");
         outputText("[pg]你也疲惫地离开了水面，并顺势倒在伊芙琳身上。她试图缓冲你的重量，惊呼一声，把你推到一边。你反过来把她拉向你，结果她倒在了你身上，大笑着。你心想，她的笑容真完美，金色的眼眸里充满了欢乐。");
         outputText("[pg]她的笑声渐渐平息，疲惫地瘫倒在你身上。你们俩就这样保持了一会儿。");
         if(get_player().hasCock() || get_player().get_gender() == 0)
         {
            outputText("[pg]伊芙琳身体贴着你的感觉很快让你无法抗拒。你把手放在她的大腿上，向上滑动，感受着她紧致的双腿和臀部的每一寸肌肤。她叹了口气，把手放在你的肩膀上轻轻抓挠，显然渴望更多。你继续揉捏她的臀部，欣赏着它的丰满，很快她的欲望就压倒了疲惫。她用另一只手抓住你的肉棒揉搓着，诱哄它完全勃起，隔着裤子顶着她的阴阜。");
            outputText("[pg]她慵懒地拉下你的裤子和内衣，你也同样脱下她的裙子。她抬起双腿，把裙子甩到一边，只剩下衬衫和那条朴素、湿透的内裤。她的臀部在你的肉棒上摩擦，在你耳边轻声呻吟。你用一只手逗弄她的嘴唇，一根手指轻轻地隔着内裤的布料戳刺。她摩擦的力度越来越大，淫液因为她的情欲变得粘稠。[say:别玩了，[name]……操我……]她在呻吟中说道。[pg]你抓住她的臀部把她拉起来，让她的入口对准你勃起的肉棒，她挺拔的双乳在你面前晃动。她把内裤拉到一边，把你的肉棒推入体内，性感地呻吟着。[pg]你慢慢地把她拉下来，她的臀部旋转着，挤压着你的阴茎，品尝着你的长度。你很快就完全插入了，她的小穴因为渴望而抽搐着。她温柔地亲吻和啃咬你的脖子，然后向上移动，在你的嘴唇上印下一个深吻，开始慢慢地骑乘你，她的乳房在你的胸膛上摩擦，乳头因欲望而挺立。[pg]你缓慢地操着她，太累了无法加快速度，但又充满欲望无法停止。她的呻吟声带着喘息，断断续续，她的双手探索着你的全身，感受着她爱人的每一寸肌肤。你拥抱着她，做着同样的事，手指从她的头部滑到背部，再到大腿。一直以来，你缓慢但坚定地操着她，释放的欲望在你体内慢慢沸腾。[pg]你和她纠缠了一会儿，然后她的呻吟声变得尖锐，身体开始颤抖。[say:[name]，我要高潮了，操，操——！]她低语道。");
            outputText("[pg]你双手捧住她的脸，让她的视线与你对齐，她半闭的金色眼眸看穿了你，充满了欲望。伴随着最后一次有力的冲刺，你射在了她体内，她也在你的肉棒上达到了高潮，紧紧地夹住它，同时喷出了淫水。你在射精时继续抽插，将一波又一波的精液注入她的子宫。你把她拉向你，深深地吻她，闭上眼睛，脑海中只剩下她身体的感觉和她的呻吟声。");
         }
         else
         {
            outputText("[pg]伊芙琳身体贴着你的感觉很快让你无法抗拒。你把手放在她的大腿上，向上滑动，感受着她紧致的双腿和臀部的每一寸肌肤。她叹了口气，把手放在你的肩膀上轻轻抓挠，显然渴望更多。你继续揉捏她的臀部，欣赏着它的丰满，很快她的欲望就压倒了疲惫。她舔了舔中指和无名指，然后把手伸进你的裤子里，迅速将手指滑入你体内，诱哄出更多你的女性淫液，将她的阴阜压在你的裤子上。");
            outputText("[pg]她用空闲的手慵懒地拉下你的裤子和内衣，你也同样脱下她的裙子。她抬起双腿，把裙子甩到一边，只剩下衬衫和那条朴素、湿透的内裤。她跨坐在你的臀部上，作为回应，你的手顺着她的大腿向上滑动，隔着内衣逗弄她的外阴，她则在你耳边轻声呻吟。你带着戏谑的坏笑，开始用一根手指隔着内裤的布料轻轻戳刺。她摩擦的力度越来越大，淫液因为她的情欲变得粘稠。[say:别玩了，[name]……操我……]她在呻吟中说道。[pg]你抓住她的臀部把她拉起来，把手放在她的胯下，她挺拔的双乳在你面前晃动。她把内裤拉到一边，把你的手指推入体内，性感地呻吟着。[pg]你慢慢地把她拉下来，用手在她温暖的小穴里缓慢地抽插，同时她也弯曲手指，在你体内抽插。你很快插入了第三根手指，开始加快抽插速度，她的小穴因为渴望而抽搐着。她温柔地亲吻和啃咬你的脖子，然后向上移动，在你的嘴唇上印下一个深吻，开始慢慢地骑乘你的手指，同时用她的手指操你，她的乳房在你的胸膛上摩擦，乳头因欲望而挺立。[pg]你缓慢地指奸着她，太累了无法加快速度，但又充满欲望无法停止。她的呻吟声带着喘息，断断续续，她空闲的手探索着你的全身，感受着她爱人的每一寸肌肤。你拥抱着她，用空闲的手做着同样的事，手指从她的头部滑到背部，再到大腿。一直以来，你们缓慢但坚定地在彼此体内抽插，释放的欲望在你们体内慢慢沸腾。[pg]你和她纠缠了一会儿，然后她的呻吟声变得尖锐，身体开始颤抖。[say:[name]，我要高潮了，操，操——！]她低语着，同时更快更用力地在你体内抽插。");
            outputText("[pg]你用空闲的手捧住她的脸，让她的视线与你对齐，她半闭的金色眼眸看穿了你，充满了欲望。伴随着越来越温柔但更有力的抽插，你感觉到她的阴道壁在高潮中收紧，紧紧地挤压着，同时将她的女性淫液喷洒在你身上。她继续抽插，小穴在高潮中痉挛，很快也让你达到了强烈的高潮，紧紧地夹住她体内的手指。你把她拉向你，深深地吻她，闭上眼睛，脑海中只剩下她身体的感觉和她的呻吟声。[pg]");
         }
         outputText("[pg]很快，她的高潮平息了，紧绷的身体放松下来。你们俩在湖岸边紧紧相拥，沉沉睡去。");
         doNext(circeEvelynEncounter6);
      }
      
      public function circeEvelynEncounter4() : void
      {
         clearOutput();
         spriteSelect(SpriteDb.get_s_evelyn());
         outputText("阳光透过你房间的窗户照射进来，你醒了，睡眼惺忪地坐起来揉了揉脸。你转头看向身旁，发现伊芙琳不在那里。难得一次，她竟然比你先醒了。");
         outputText("[pg]你循着挥剑的声音走向花园。不出所料，她正在那里练习剑姿。她那淡金色的头发像太阳一样闪耀，身体在稻草人之间迅速穿梭，姿势完美无瑕。她已经好几年没有战斗过了，但她始终确保自己的技能保持敏锐。");
         outputText("[pg]你冲她喊，让她休息一会儿。她停下来向你挥手，迅速丢下军刀跑回屋里。她扑向你，你抱住她，用一个漫长而热烈的吻迎接她。");
         outputText("[pg]你问她今天想做什么。她想了一会儿，俏皮地踮起一只脚尖。[say: 今天就简单点吧。骑马去湖边，在那里放松一下。不去镇上，不去市场。我什么都不想去。]");
         outputText("[pg]你笑着同意了她，轻轻地抚摸了一下她的头发，然后松开了拥抱。");
         outputText("[pg]你们俩走向马厩，里面有一匹孤零零的白马。你骑上马，伸出手想拉伊芙琳上来。她调皮地拍开你的手，一个利落的动作翻身上马，然后得意地盯着你。你笑了笑，策马向大路走去。");
         outputText("[pg]穿过林间小路时，你深吸了一口气，呼吸着清凉的晨风，闻着露水的味道。伊芙琳坐在你身后，双腿侧放在马背的一侧，只是凝视着穿透森林柔软树冠的光线。");
         outputText("[pg]突然，她拍了拍你的肩膀。[say: 等一下，[name]！我觉得那棵树结果了！]");
         outputText("[pg]你告诉她，严格来说，这些仍然是皇家树林；这些树结的任何果实都不属于她。她嗤之以鼻。[say: 如果国王想要，他可以弯下腰，用一种非常特别的方式得到这些水果之一。我才不在乎。来吧，停下。]");
         outputText("[pg]你笑着照做了，引导你的马停在一棵梨树旁。伊芙琳小心翼翼地站在马背上，踮起脚尖，设法拉下一根树枝，摘了几个梨。她松开树枝，树枝猛地弹了回去，这股力量导致另外两个梨直接掉在伊芙琳的头上，然后滚到了地上。她跌倒时可爱地叫了一声，一边揉着头一边递给你一个梨，马迅速地咀嚼着掉落的水果。你咬了一口；它们熟透了，鲜美多汁。你转过身，嘲笑伊芙琳的窘境，说国王的报复来得很快，但往往很小气。作为回报，你的肩膀挨了她调皮的一拳。[say: 闭嘴，吃你的梨，快带我们去湖边。]");
         outputText("[pg]你轻笑一声，策马向前。");
         doNext(circeEvelynEncounter5);
      }
      
      public function circeEvelynEncounter3() : void
      {
         clearOutput();
         outputText("几分钟过去了，你厌倦了和无头骑士的马的对话。你回到了洞穴。");
         outputText("[pg]你被传送进了喀耳刻的房间，却发现她的身体坐在喀耳刻的椅子上，不耐烦地跺着脚，头却不知去向。你想问问它自己的头在哪里，但你觉得它没有耳朵，什么也听不见。");
         outputText("[pg]然而，你的问题很快就得到了解答，因为你听到了从喀耳刻的梳妆台传来的她的笑声。你好奇地走了过去。");
         outputText("[pg]你探头越过屏风，看到她正靠在梳妆台上。喀耳刻坐在凳子上，微笑着。你注意到这个亡灵女孩戴着两只漂亮的黄金钻石耳钉，这与她假小子的举止形成了相当奇特的对比。");
         outputText("[pg]她注意到了你，把你叫了过去。[say: [name]！你回来得正好。看看她送了我什么！]她试图转过头展示她的新耳环，但没有脖子让她很难做到。不过，喀耳刻注意到了她的挣扎，轻轻地把她转过来展示给你看。[say: 它们不漂亮吗？]");
         outputText("[pg]你轻声笑了笑，表示同意。你问她们为什么她的身体没有……陪着她们。");
         outputText("[pg][say: 我把它禁足了，]喀耳刻说。[say: 它有时候真的很烦人。她不介意，反正她也需要一些时间单独和我谈谈。]");
         outputText("[pg]你看向女孩，寻求确认。她向你眨了眨眼，打消了你的疑虑。");
         outputText("[pg][say: 好吧，“无头骑士”，恐怕我的化妆品不太适合你这种肤色的人。你得原谅我，]喀耳刻说着，把头发拨到一边，重新整理了一下她形状奇特的刘海。");
         outputText("[pg][say: 哦，没关系，别放在心上，]她看着镜子里的自己说。[say: 不过，我想我该回到我的身体里了。我能感觉到它越来越紧张了。]");
         outputText("[pg]喀耳刻答应了，站起身来，带着那颗兴高采烈的头颅。你试图跟着她们走向房间中央，但她用手势阻止了你，让你等一会儿。你虽然困惑，但还是答应了。");
         outputText("[pg]过了一会儿，她回来了，没有带着你同伴的头颅。她严肃地看着你，但并没有生气。");
         outputText("[pg][say: 她证实了你说的话。她是个可爱的人，我很高兴我成功地消除了她对我的怀疑。谢谢你像那样帮助她，[name]。我学到了很多。不仅是关于诅咒，还有关于一个遭受了巨大痛苦的骄傲女人的事。很遗憾，找不到治愈她的方法。]");
         outputText("[pg]这已经回答了你的一个问题。你问她，她的状况难道连治愈的可能都没有吗。她摇了摇头。");
         outputText("[pg][say: 除非她死，否则没办法，抱歉。] 你低下头，仍然无法完全接受她的命运。");
         outputText("[pg]喀耳刻用纤细的手指抬起你的下巴。[say: 但她确实向我提出了一个我可以满足的请求。不过，我需要你的帮助。]");
         outputText("[pg]你毫不犹豫地接受了，并问需要做什么。她将手指举向你的太阳穴。");
         outputText("[pg][say: 只要敞开你的心扉。]");
         outputText("[pg]世界陷入了黑暗。");
         doNext(circeEvelynEncounter4);
      }
      
      public function circeEvelynEncounter2() : void
      {
         clearOutput();
         outputText("你睁开眼睛，勉强适应了传送的感觉。你看向无头骑士，看到她滑稽地蜷缩着身子，浑身发抖，双臂伸直捧着自己的头，干呕着。");
         outputText("[pg][say: 刚才那是什么鬼，[name]？我都记不清上次想吐是什么时候了，太难受了！][pg]你告诉她，传送显然就是这样的。她的身体晕乎乎地把头接了回去，脸上依然因为眩晕感而皱着眉头。[pg]还没等你再说什么，你注意到喀耳刻正朝你们走来，眼睛盯着你的同伴，打量着她。[pg][say: 欢迎回来，[name]。看来你带了位客人。我是喀耳刻。你是……？][pg]她不耐烦地回答。[say: 我是无头骑士。你想研究亡灵，[name]告诉我的。我知道我算不上什么客人，只是个供你分析的怪物。我们开始吧。][pg]喀耳刻看起来有些错愕，但还是保持了镇定。[say: 我确实对你的状况很好奇。但这并不意味着我把你当成怪物。我感兴趣的不仅是折磨你的诅咒，还有承受诅咒的人。][pg][say: 当然，]她回答道，显然心存疑虑。[say: 那从哪里开始呢？][pg][say: 嗯，这由你决定。[name]已经告诉我[his]那边的故事了。我很好奇你的。为了推进所有魔法知识的发展，你愿意分享的关于你自己和庄园的任何信息，我都非常欢迎。]");
         if((FlagDict_Impl_.arrayReadInt(KFLAGS.flags,2675) & CorruptedCoven.BROUGHT_JEREMIAH_BACK) != 0)
         {
            outputText("[pg]你注意到耶利米在房间的角落里，准确地预测并背诵了喀耳刻这句话的结尾。");
         }
         outputText("[pg][say: 那么，讲讲我这边的故事？好吧。只是……][pg]喀耳刻微微鞠躬。[say: 嗯？][pg]她犹豫了一下才回答。[say: [name]，你能让我们俩单独谈一会儿吗？][pg]你挠了挠头。她为什么要这样？[pg]她走近你，在你耳边低语。[say: 我现在真的很紧张。你在这里让我感到平静，我有点讨厌这样。我需要能单独和她谈谈，独自面对她可能抛给我的任何挑战。][pg]你看着她恳求的金色眼眸，决定如果这是她的愿望，你需要尊重它。她紧紧地抱住你，向你道谢。[pg][say: 这不会花很长时间的。我知道我说过我相信我的马不会跑掉，但那不是真的。你能帮我照看她几分钟吗？]");
         outputText("[pg]你有些不情愿，但还是答应了。你请喀耳刻把你传送出房间，她照做了。");
         outputText("[pg]你发现自己回到了峭壁，只有一匹令人毛骨悚然的亡灵马陪着你。");
         outputText("[pg]你坐下来开始和它聊天。一场非常单向的对话。");
         doNext(circeEvelynEncounter3);
      }
      
      public function circeEvelynEncounter() : void
      {
         clearOutput();
         outputText("前往峭壁的旅程相对平静，大多数生物都很明智，没有攻击你们俩。");
         if(get_player().isBiped() && get_player().get_spe() >= 100)
         {
            outputText("这段旅程对你们俩来说都有点太长了；你和她的坐骑在到达终点前很久就疲惫不堪，最终放弃了，接受了技术上的平局。");
         }
         outputText("[pg]地面因火山活动而震动，一小股过热的气体在离你几英尺远的地方冲破了地面。无头骑士的马吓得向后退缩，她被迫下马，步行引导它。");
         outputText("[pg][say: 真是个见鬼的居住地，是吧？] 她一边拉着坐骑向前走，一边问道。你表示同意，汗水已经从你的额头渗出。[pg]幸运的是，没过多久你们就找到了隐藏着喀耳刻房间的那个奇特洞穴。你指着它，你们俩便朝它走去。[pg]她被迫把马留在外面，你问她它会不会跑掉。她摇了摇头。[pg][say: 我骑了她几十年了，她从来没有尝试过逃跑。她是我大半辈子唯一的伴侣，我想她也是这么看我的。她不会离开的，虽然她可能会因为等我而感到烦躁。没什么大不了的，我习惯了。]");
         outputText("[pg]随她怎么说吧。你引导她进入洞穴，告诉她准备好迎接一种相当令人作呕的感觉。");
         outputText("[pg]进入洞穴片刻后，世界发生了扭曲。");
         doNext(circeEvelynEncounter2);
      }
      
      public function circeEnabled() : Boolean
      {
         if((FlagDict_Impl_.arrayReadInt(KFLAGS.flags,2675) & CorruptedCoven.MET_CIRCE) != 0)
         {
            return !circeAversion();
         }
         return false;
      }
      
      public function circeAversion() : Boolean
      {
         if(!(get_player().hasPerk(PerkLib.BimboBrains) || get_player().hasPerk(PerkLib.BroBrains) || get_player().hasPerk(PerkLib.FutaFaculties)))
         {
            if(saveContent.metCirceAsGrossInsectPerson)
            {
               return isSufficientlyBuggy();
            }
            return false;
         }
         return true;
      }
      
      public function circeAppearance() : void
      {
         var _g:CorruptedCoven;
         clearOutput();
         outputText("坐在你旁边一把笨重木椅上的是一个女人，看起来三十岁出头。她有着灰白色的皮肤，火红色的头发和锐利的绿色眼睛。她穿着一件做工精细、十分暴露的裙子，主要呈红色，边缘点缀着金色的装饰。裙子呈“Y”字形，两端分别搭在她上臂中间，勉强遮住她丰满的乳房，两端在她的下腹部汇合，勉强遮住她的胯部，却完全露出了她的双腿。她戴着许多首饰；耳环、戒指、脚链，还有一条带有黑曜石护身符的金色项链，短链将它与裙子的肩膀连接起来，为其提供额外的支撑。你怀疑其中一些，如果不是全部的话，都以某种方式被附魔了。");
         outputText("[pg]除了戴着一对金色脚链和穿着一双做工精细的黑色高跟鞋外，她的双腿几乎是赤裸的。你能感觉到她身上散发出强烈的腐化气息——她绝对被污染了。");
         _g = this;
         doNext(function():void
         {
            _g.buildOptionsMenu();
         });
      }
      
      public function catchCirceOnAlchemy() : void
      {
         var option2:int;
         var _g2:CorruptedCoven;
         var option1:int;
         var _g1:CorruptedCoven;
         var option:int;
         var _g:CorruptedCoven;
         clearOutput();
         outputText("你的到来比平时更加混乱，因为预期的玫瑰香气被强烈的硫磺味所取代，你忍不住吸了一大口。你厌恶地呻吟和咳嗽，声音大得让你自己都觉得不舒服。");
         outputText("[pg]你在房间里环顾四周寻找喀耳刻，脸上的表情仍然有些扭曲。不出所料，她正在她那设备齐全的炼金台上进行某种实验。她看起来比平时少了几分高贵；她的头发扎成马尾，平时那件暴露的红裙也不见了踪影，取而代之的是一套笨重的深色皮袍，将她的全身包裹得严严实实。");
         outputText("[pg]你叫了她一声，但她似乎完全专注于她的工作。你走近桌子，偷看她正在熬制什么，随着难闻的气味加剧，你的呼吸变得越来越急促。令你惊讶的是，她完全没有化妆，也没有佩戴任何首饰；虽然她依然美丽，但这绝对是一种更“居家”的风格，而不是她平时那种华丽的模样。");
         if(get_player().hasPerk(PerkLib.HistoryAlchemist))
         {
            outputText("[pg]你问她是否觉得她的混合物中黑化过程有些过头了。[say: 是的，但我想我可以在之后的凝结过程中把它去除——]");
         }
         else
         {
            outputText("[pg]你用一种随意而好奇的语气问她在做什么。[say: 如果这你都要问，那我也没法回——]");
         }
         outputText("[pg]她瞪大眼睛转向你，仿佛见鬼了一样。还没等你开口说[say: 你好，]你的眼睛就被一记极其强力的致盲法术所吞没，你能听到喀耳刻冲向房间的另一侧，嘴里一直嘟囔着什么。在惊讶中，你不小心深吸了一口桌子上正在熬制的有毒物质，导致你向前弯下腰，在失明中干呕和咳嗽。[pg]经过痛苦的片刻，硫磺的气味减弱了，取而代之的是熟悉的玫瑰香味。你直起身子，仍然感到头晕，并注意到失明感正在消退。你转过身，显然很生气，却看到衣着光鲜的喀耳刻坐在她常坐的椅子上，正在系高跟鞋的带子。[pg][say: 抱歉，但在我没穿好衣服的时候，你<b>不能</b>进入我的住所。如果你进来了，你要提醒我，如果我不听，你就赶紧滚出去，晚点再来。]");
         outputText("[pg]她完成了她奢华的装扮，吹开唇边的一缕头发，并用手将其完美地固定好。她现在似乎准备好交谈了。");
         menu();
         _g = this;
         option = 0;
         addButton(0,"喜欢",function():void
         {
            _g.commentOnCasualLook(option);
         }).hint("告诉她你很喜欢她更随意的打扮。");
         _g1 = this;
         option1 = 1;
         addButton(1,"道歉",function():void
         {
            _g1.commentOnCasualLook(option1);
         }).hint("尽你所能地道歉。");
         _g2 = this;
         option2 = 2;
         addButton(2,"抱怨",function():void
         {
            _g2.commentOnCasualLook(option2);
         }).hint("愤怒地指出她没必要那样弄瞎你。");
      }
      
      public function cancelSex() : void
      {
         clearOutput();
         outputText("你告诉喀耳刻你现在对做爱没什么兴趣。");
         outputText("[pg]房间突然再次亮了起来。[say: 只是想看看我愿不愿意，对吧？我明白了。][pg]她沉默了一会儿，意识到在你的拒绝面前，她的戏码有多么尴尬。[pg][say: 我明白了。]");
         buildOptionsMenu();
      }
      
      public function buildOptionsMenu(param1:Boolean = false) : void
      {
         menu();
         if(param1)
         {
            clearOutput();
            outputText("喀耳刻盯着你，无聊地偶尔抖动着交叉的双腿。她一直盯着附近桌子上的一瓶酒；你知道你一走她会干什么。");
         }
         addButton(0,"知识",topicTalkOptions).hint("按照她的要求，和喀耳刻讨论几个话题。").disableIf(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,2708) > 0,"给喀耳刻几天时间消化你们之前的讨论。");
         addButton(1,"探索",exploreChamber).hint("环顾喀耳刻的房间，并简要谈论一些更有趣的物品。");
         addButton(2,"外貌",circeAppearance).hint("打量一下喀耳刻。");
         addButton(3,"奖励",circeRewards).hint("获取你协助喀耳刻的奖励。");
         addButton(4,"性爱",circeSex).hint("测试一下除了知识以外的东西。");
         if((FlagDict_Impl_.arrayReadInt(KFLAGS.flags,2675) & CorruptedCoven.BROUGHT_JEREMIAH_BACK) != 0)
         {
            addRowButton(1,"耶利米",circeJeremiah).hint("看看耶利米过得怎么样。");
         }
         if(get_player().hasKeyItem("Old Manor Books"))
         {
            addRowButton(2,"给书",giveManorBooks).hint("把你在旧庄园找到的那些书交给她。");
         }
         addButton(14,"离开",leaveCirceChamber).hint("离开喀耳刻的房间。");
      }
      
      public function answerWine(param1:int) : void
      {
         clearOutput();
         switch(param1)
         {
            case 1:
               outputText("你接受了，她把酒递给你。香气确实诱人，你决定尝一尝。口感偏干，但一点也不难喝。你现在明白为什么喀耳刻总是喝这个了；这可能是你在玛瑞斯喝过的最浓郁的酒之一。你品尝完第一口后赞赏地点点头，喀耳刻微笑着，也浅尝了一口自己的酒。[say: 我就知道你会喜欢的。或者说，就算你不喜欢，你也会装作喜欢的。不出所料，这种酒现在已经很罕见了。]");
               break;
            case 2:
               outputText("你告诉她你不太喜欢酒的味道，即使是高品质的葡萄酒。她看起来很震惊，她根本没想过你会拒绝她的提议。过了几秒钟尴尬的时间，她才组织好语言回答。");
               outputText("[pg][say: 那好吧，我只好……晚点再喝这杯了，]她说着，看了一会儿被拒绝的酒杯，然后慢慢把它放在附近的桌子上，眼中流露出明显的失望，还夹杂着一丝愤怒。");
               outputText("[pg]她摇晃着酒杯里的液体，叹了口气。[say: 我想我不该指望每个人都有我这样成熟的品味。算了吧，]她说道，这种消极抵抗的语气让你吃了一惊。[say: 这种负担我还能承受。]");
               break;
            case 3:
               outputText("你向她道歉，说你的信仰不允许喝酒。这句话从你嘴里说出来，就像一把扳手砸进了发动机，狠狠地撞击着喀耳刻的大脑。");
               outputText("[pg][say: 你不能喝是因为——这是什么信仰？]喀耳刻说道，言语中明显夹杂着困惑和一丝愤怒。[say: 这是一个特殊的场合。你难道不能破例一次吗？]");
               outputText("[pg]你依然坚决，说你就是不能喝。宗教誓言不应该为了这种方便而打破。喀耳刻沮丧地叹了口气，她的表情从困惑变成了轻微的蔑视。[say: 当然。希望你不会因为这个把我烧死在火刑柱上，但我不得不说：无论你崇拜的是谁或什么东西，都是个相当无趣的家伙。]");
               outputText("[pg]她看着第二个杯子，又叹了口气。[say: ……随便吧]，她说着，然后一大口喝光了里面的东西，把空杯子放在附近的桌子上。");
               break;
            case 4:
               outputText("你转述了英格纳姆长辈们的教诲：在达到适当年龄之前，你不应该喝酒。她惊讶地挑起眉毛。[say: 他们是这么说的，是吗？你难道不想至少尝一口吗？]");
               outputText("[pg]你坚称等你长大了再喝。她轻声嘟囔着。[say: 哇哦。我年轻的时候可比你叛逆多了。我绝不会错过这种钻空子的机会。]");
               outputText("[pg]她沉默了几秒钟，然后开始发出一个音节，但在说出任何能听懂的话之前就停住了。女巫低下头，显然被什么事情困扰着。在又发出一声明显更加烦躁的嘟囔后，她决定把第二个杯子放在附近的桌子上，眼中流露出挫败感。");
               outputText("[pg][say: 玛莱啊，喀耳刻，你刚才想干什么？]她低声自语道。");
         }
         outputText("[pg]说完，她再次用念力塞上瓶塞，轻轻地把它滑到它原本所在的架子上。你忍不住注意到那个架子上摆满了葡萄酒；如果它们很罕见，那是因为喀耳刻把剩下的全包了。");
         outputText("[pg]她挥了挥手，架子就在你眼前消失了，完美地伪装成了房间的背景。她朝中心点了点头，示意你跟着她去她常待的地方。");
         outputText("[pg]她奇怪的举动勾起了你的好奇心，你问喀耳刻为什么要费心把那个架子藏起来，考虑到即使有人入侵她的房间，也有更有价值的东西可以偷。她沉默了一秒钟，然后喝了一口酒，叹了口气。[say: 嗯，[name]，我并不是真的在向访客或小偷隐藏那个架子。我是在向我自己隐藏它。][pg]你慢慢地点点头，恍然大悟，她轻声笑了起来。");
         if(param1 == 1)
         {
            outputText("[say: 不过，言归正传。希望你能给我讲个好故事，来换这杯酒。]");
         }
         else
         {
            outputText("[say: 不过，言归正传。你要知道，你拒绝那杯酒让我很受伤。希望你能讲个好故事来补偿我。]");
         }
         outputText("[pg]你很确定，她想让你留在身边，已经不仅仅是为了听故事了。");
         saveContent.sippedWineWithCirce = true;
         buildOptionsMenu();
      }
      
      public function answerDecorationTalk(param1:int) : void
      {
         var _g:CorruptedCoven;
         clearOutput();
         switch(param1)
         {
            case 0:
               outputText("你告诉她，如果他们的所作所为有充分的理由，那么他们都可以被审判，甚至其中一些人可以被原谅。她对你的回答有些惊讶，但她显然很喜欢。");
               outputText("[pg][say: 有意思，[name]。大多数人甚至不会考虑这种选择。好吧，除非我们能发现更多关于他们堕落的信息，否则这是一个毫无意义的问题，但这仍然是一个有趣的道德练习，不是吗？]");
               outputText("[pg]她让你独自沉思，你在离开前全神贯注地看着上方巨大的挂毯。");
               break;
            case 1:
               outputText("你告诉她，不，他们不能被原谅。无论他们的目标是什么，他们为了达到目标显然做得太过分了，而且显然无论如何都失败了。他们迷失了自我，为了玛瑞斯和英格纳姆的利益，他们必须全部被消灭。她移开视线，显然预料到了这样的回答，但还是被它震住了。");
               outputText("[pg][say: 你可能是对的，[name]。他们必须成为一个榜样，成为历史上任何好高骛远的未来巫师的又一个印记。好吧，除非我们能发现更多关于他们堕落的信息，否则这是一个毫无意义的问题，但这仍然是一个有趣的道德练习，不是吗？]");
               outputText("[pg]她让你独自沉思，你在离开前全神贯注地看着上方巨大的挂毯。");
         }
         _g = this;
         doNext(function():void
         {
            _g.buildOptionsMenu();
         });
      }
   }
}

