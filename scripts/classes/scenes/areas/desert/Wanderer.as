package classes.scenes.areas.desert
{
   import classes.BaseContent;
   import classes.DynStat;
   import classes.Player;
   import classes.StatusEffect;
   import classes.StatusEffects;
   import classes.display.SpriteDb;
   import classes.internals.Utils;
   import classes.items.ConsumableLib;
   import classes.scenes.Camp;
   import classes.scenes.Inventory;
   import flash.Boot;
   
   public class Wanderer extends BaseContent
   {
      
      public function Wanderer()
      {
         if(Boot.skip_constructor)
         {
            return;
         }
         super();
      }
      
      public function wandererStayHuman() : void
      {
         spriteSelect(SpriteDb.get_s_markus_and_lucia());
         clearOutput();
         outputText("[say: 你这个愚蠢的凡人！]露西娅尖叫着，然后转向她的人类情人，[say: 别听这个愚蠢的凡人的，亲爱的；想想我们在一起能有多开心！][pg]");
         outputText("马库斯悲伤地摇了摇头，[say: [He]说得对，我的灵魂是不朽的，不能这么轻易地牺牲。我们为什么不再坚持我们最初的协议十年，然后再仔细考虑一下呢？][pg]");
         outputText("露西娅撅起嘴，几乎要哭出来了，[say: 好吧！但别指望我会高兴。]她粗暴地拍了拍他肿胀的睾丸，低头对他假笑，[say: 在我吃下一顿饭之前，我要让它们肿得紧紧的！]");
         outputText("马库斯叹了口气，虽然你觉得你看到了他嘴唇上的一丝微笑，[say: 如你所愿……感谢你的指引，旅行者，愿你能在这片陌生的土地上找到你想要的东西。]");
         outputText("[pg]当他们转身离开时，露西娅回头怒视着你……");
         dynStats(DynStat.Lib(-1),DynStat.Lust(1),DynStat.Cor(-5));
         get_player().createStatusEffect(StatusEffects.WandererHuman,0,0,0,0);
         doNext(get_camp().returnToCampUseOneHour);
      }
      
      public function wandererRouter() : void
      {
         spriteSelect(SpriteDb.get_s_markus_and_lucia());
         if(!get_player().hasStatusEffect(StatusEffects.MeetWanderer))
         {
            wandererFirstMeeting();
            get_player().createStatusEffect(StatusEffects.MeetWanderer,0,0,0,0);
         }
         else
         {
            if(get_player().hasStatusEffect(StatusEffects.WandererDemon))
            {
               wandererDemonEpilogue();
               return;
            }
            if(get_player().hasStatusEffect(StatusEffects.WandererHuman))
            {
               wandererEpilogueHuman();
               return;
            }
            wandererRepeatMeeting();
         }
      }
      
      public function wandererRepeatMeeting() : void
      {
         spriteSelect(SpriteDb.get_s_markus_and_lucia());
         clearOutput();
         outputText("马库斯爬上附近的一个沙丘时向你挥手，大声打着招呼。[say: 嘿，旅行者！你有时间帮一个人解答一个关于神学和道德规范的问题吗？]");
         outputText("[pg]他的魅魔同伙露西娅不屑地哼了一声。");
         menu();
         addButton(0,"是的",wandererHelpHim);
         addButton(14,"离开",wandererLeave);
      }
      
      public function wandererLeave() : void
      {
         spriteSelect(SpriteDb.get_s_markus_and_lucia());
         clearOutput();
         outputText("马库斯看起来很失望，叹了口气，举起他的手推车，摇摇晃晃地走了。露西娅在他身后蹦蹦跳跳，看起来就像偷吃到奶油的猫。你想知道这到底是怎么回事。真是一个奇怪的地方。");
         doNext(get_camp().returnToCampUseOneHour);
      }
      
      public function wandererHelpHim() : void
      {
         spriteSelect(SpriteDb.get_s_markus_and_lucia());
         clearOutput();
         outputText("[say: 哦，太好了！]他惊呼道，开始详细说明。[say: 我亲爱的魅魔对我们的安排越来越厌倦了，她想让我放弃最后的人性，变成像她一样的恶魔。我不太确定我是否想失去我的灵魂，但同时，我对他们这一类了解得足够多，知道我真的会很享受成为一个男魅魔，如果你明白我的意思的话。在我做出决定之前，我想听听第二个意见——你怎么看？]");
         outputText("[pg]他回头看了一眼，眼神中几乎带着一丝恐惧。");
         menu();
         addButton(0,"变成恶魔",wandererGoDemon);
         addButton(1,"保持人类",wandererStayHuman);
      }
      
      public function wandererGoDemon() : void
      {
         spriteSelect(SpriteDb.get_s_markus_and_lucia());
         clearOutput();
         outputText("当你建议接受她的提议时，露西娅露出了调皮的微笑。她扭动着身躯向你走来，一路上肉体诱人地晃动着。她靠得很近，用一根纤细的手指顺着你胸口的中央滑下。[say: 谢谢你。如果我们再次相遇，我保证给你的奖励会让一个妓女晕倒。][pg]");
         outputText("马库斯对这番交流挑了挑眉，但当他的恶魔情人回到他身边时，他笑了。露西娅又眨了眨眼，巨大的翅膀从她的背上猛然展开。她抓住惊呼出声的马库斯，腾空而起，带着她的战利品飞回了她的巢穴。");
         dynStats(DynStat.Lust(5),DynStat.Cor(1));
         get_player().createStatusEffect(StatusEffects.WandererDemon,0,0,0,0);
         doNext(get_camp().returnToCampUseOneHour);
      }
      
      public function wandererFirstMeeting() : void
      {
         clearOutput();
         outputText("远处升起一小股沙尘，暴露了在沙丘中移动的某个东西的位置。随着它靠近你的位置，沙尘变得越来越大，隐约可见云雾中潜伏着一个庞大扭曲的身影。你小心翼翼地靠近，准备面对某种新的恶魔怪物。当沙尘散去，模糊的身影变成了两个清晰的轮廓。[pg]");
         outputText("左边是一个推着装满重物的手推车的男人，他在沙质的沙漠土壤中挣扎着不让自己绊倒。在男人右后方稍微靠后的位置，是一个身材姣好的女人，任何注意到她头上尖刺的人都能清楚地看出她的恶魔血统。当他们靠近时，男人注意到了你的存在并大声喊道：[say: 嘿，旅行者！天气真不错，不是吗？][pg]");
         outputText("这对奇怪的组合拉近了距离，让你能更清楚地看清他们的身形。不出所料，这个魅魔是个十足的美人，该丰满的地方都长着曲线优美的肉。男人一边挣扎着推着重物，一边自我介绍。[say: 我是马库斯，曾经游历过非凡之地的旅行者，也是禁忌知识的探索者！不过那都是很久以前的事了；你看，我已经退休了。我和我的新伴侣露西娅定居下来了。]马库斯指了指陪伴着他的那个看起来很无聊的魅魔。[pg]");
         outputText("你刚想和他们打招呼，却差点惊得晕过去——马库斯的手推车里装的不是货物。那是唯一能防止他那硕大的睾丸拖在沙地上的东西！他看着你的反应笑了笑，下流地眨了眨眼，[say: 你以为我为什么要留着一个魅魔在身边？如果我不每隔一两个小时清空一下这些小家伙，我简直要爆炸了！]马库斯若有所思地想了一会儿，点了点头，问道：[say: 不知道你有没有时间帮我解决一个我一直以来的困惑？]");
         menu();
         addButton(0,"帮助他",wandererHelpHim);
         addButton(14,"离开",wandererLeave);
      }
      
      public function wandererEpilogueHuman() : void
      {
         spriteSelect(SpriteDb.get_s_markus_and_lucia());
         if(get_player().hasStatusEffect(StatusEffects.WandererHuman))
         {
            if(get_player().statusEffectv1(StatusEffects.WandererHuman) == 0)
            {
               clearOutput();
               outputText("当你在沙漠中旅行时，你在远处看到了马库斯和他的恶魔同伴露西娅的双重身影。从露西娅在马库斯腿间疯狂上下点头的动作来看，她正准备饱餐一顿。拉近距离，你好奇地看着她的喉咙淫秽地鼓起，以跟上巨大的精液量。过了一会儿，她向后倒去，随着马库斯高潮的结束，几大团精液像爆裂的水气球一样在她的身体上炸开，让她变成了一个沾满精液的残骸。[pg]");
               if(get_player().cor < 33)
               {
                  outputText("你躲回沙丘后面，脸红得厉害。");
               }
               else if(get_player().cor < 66)
               {
                  outputText("你发誓你看到露西娅直视着你并眨了眨眼，你的脸涨得通红。");
               }
               else
               {
                  outputText("你公然地色眯眯地看着这粗俗的展示，对着这对幸福的夫妇吹着下流的口哨。马库斯抬起头，露出了一个傲慢的微笑，而露西娅舔了舔嘴唇，给了你一个掠食者般的笑容。");
               }
               dynStats(DynStat.Lust(10));
               get_player().statusEffectByType(StatusEffects.WandererHuman).value1 = 1;
               doNext(get_camp().returnToCampUseOneHour);
            }
            else if(get_player().statusEffectv1(StatusEffects.WandererHuman) == 1)
            {
               clearOutput();
               outputText("在探索沙漠时，你发现了一个半埋在沙子里的奇怪瓶子。上面绑着一张小纸条：");
               outputText("[pg][say: 我就知道你会找到这个的。多试几次，我想你可能会改变对马库斯处境的看法。\n -可爱的露西娅][pg]");
               get_inventory().takeItem(get_consumables().SDELITE,get_camp().returnToCampUseOneHour);
            }
         }
      }
      
      public function wandererDemonEpilogue() : void
      {
         spriteSelect(SpriteDb.get_s_markus_and_lucia());
         if(get_player().hasStatusEffect(StatusEffects.WandererDemon))
         {
            if(get_player().statusEffectv1(StatusEffects.WandererDemon) == 0)
            {
               clearOutput();
               outputText("一个长着翅膀的黑影闪过。你抬起头，但在灼热的沙漠阳光下找不到它的来源。在你得到任何警告之前，有人在你的肩膀上拍了一下，然后一个曲线优美的身体紧贴着你，以各种恰到好处的方式抚摸和触碰你。[pg]");
               outputText("[say: 我顺道过来，想为这件事谢谢你，]露西娅发出满足的呼噜声，在指关节上平衡着一块紫色的水晶。她说话时，水晶在阳光下闪烁着光芒，[say: 你看，当一个人类或其他凡人生物最终开始渴望堕落和快乐胜过一切时，他们就会变成恶魔。这个过程会留下一块单一的莱希石水晶——就是这块水晶。这是一种你无法理解的能量源，我要感谢你把它给了我。][pg]");
               outputText("露西娅把一个小瓶子放在你的手里。[say: 所以谢谢你，收下这个礼物吧。也许你以后可以为我们创造一些莱希石……哦，在我忘记之前，马库斯很喜欢他的新生活。][pg]");
               outputText("她退后一步，在翅膀展开时送了一个飞吻。伴随着一次有力的向下拍击，她把沙子撒得到处都是，迫使你用手臂挡在眼前。当沙尘落定，她已经不见了。[pg]");
               dynStats(DynStat.Lust(5));
               get_inventory().takeItem(get_consumables().SDELITE,get_camp().returnToCampUseOneHour);
               get_player().statusEffectByType(StatusEffects.WandererDemon).value1 = 1;
            }
            else if(get_player().statusEffectv1(StatusEffects.WandererDemon) == 1)
            {
               clearOutput();
               outputText("露西娅从头顶飞过，张开双腿，公然地揉弄着她湿润无毛的缝隙，并发出充满欲望的呻吟。过了一会儿，她高潮了，将她的汁液滴在沙丘上。她舔了舔手指，挥了挥手，从腰带上解下一个物品，扔向你。[pg]");
               if(50 < get_player().get_spe() + Utils.rand(60))
               {
                  outputText("你顺手接住了一个小药水瓶。当你抬起头时，她已经不见了。[pg]");
                  get_inventory().takeItem(get_consumables().SDELITE,get_camp().returnToCampUseOneHour);
               }
               else
               {
                  outputText("你扑向掉落的瓶子，但没接住，它在沙子里摔碎了，液体几乎瞬间就被吸干了。");
                  doNext(get_camp().returnToCampUseOneHour);
               }
            }
         }
      }
   }
}

