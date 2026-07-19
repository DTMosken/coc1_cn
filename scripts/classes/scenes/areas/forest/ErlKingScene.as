package classes.scenes.areas.forest
{
   import classes.BaseContent;
   import classes.CoC;
   import classes.Cock;
   import classes.CockTypesEnum;
   import classes.DynStat;
   import classes.DynStatOp;
   import classes.ImageManager;
   import classes.PerkLib;
   import classes.Player;
   import classes.Vagina;
   import classes._FlagDict.FlagDict_Impl_;
   import classes.globalFlags.KFLAGS;
   import classes.internals.Utils;
   import classes.items.Armor;
   import classes.items.ArmorLib;
   import classes.items.ConsumableLib;
   import classes.items.Mutations;
   import classes.items.WeaponLib;
   import classes.scenes.Camp;
   import classes.scenes.Inventory;
   import classes.scenes.api.Encounter;
   import coc.view.CoCButton;
   import flash.Boot;
   import haxe.IMap;
   
   public class ErlKingScene extends BaseContent implements Encounter
   {
      
      public function ErlKingScene()
      {
         if(Boot.skip_constructor)
         {
            return;
         }
         super();
      }
      
      public function whatsMyPrize() : void
      {
         clearOutput();
         get_images().showImage("item-gems");
         outputText("你站起身，拍了拍身上的灰尘，无视了魔王那根显眼的肉棒，声明你想要一些补偿来弥补这些麻烦。[pg]");
         outputText("[say:当然，当然！]魔王大笑着，把手伸进他的一个马鞍袋里，拿出一个小包裹。他把它扔给了你。[say:祝你下次狩猎好运！][pg]");
         outputText("[say:下次狩猎？]你刚开口，但还没等你说完，魔王就已经骑上了他的马，在树林中轰鸣远去。[pg]");
         var _loc1_:int = 10 + Utils.rand(15);
         outputText("<b>你找到了" + _loc1_ + "颗宝石。</b>[pg]");
         var _loc2_:Player = get_player();
         _loc2_.set_gems(_loc2_.get_gems() + _loc1_);
         var _loc3_:int = Utils.rand(4);
         if(_loc3_ == 0)
         {
            doNext(takeCaninePepper);
         }
         if(_loc3_ == 1)
         {
            doNext(takeFoxBerry);
         }
         if(_loc3_ == 2)
         {
            doNext(takeNeonPinkEgg);
         }
         if(_loc3_ == 3)
         {
            doNext(takeGoldenRing);
         }
      }
      
      public function takeNeonPinkEgg() : void
      {
         clearOutput();
         get_images().showImage("item-egg-neon");
         get_inventory().takeItem(get_consumables().NPNKEGG,get_camp().returnToCampUseOneHour);
      }
      
      public function takeGoldenRing() : void
      {
         clearOutput();
         get_images().showImage("item-gRing");
         get_inventory().takeItem(get_consumables().GLDRIND,get_camp().returnToCampUseOneHour);
      }
      
      public function takeGoldenAntlers() : void
      {
         get_player().createKeyItem("Golden Antlers",0,0,0,0);
         if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,2223) == 0)
         {
            outputText("[pg]过了一会儿，你发现一根黑色的、明显不自然的棍子从灌木丛中探出头来。你把它捡起来查看，意识到这一定是魔王的手杖，在你的攻击中被打落了。" + (get_player().lowerBody.legCount != 2 ? "虽然你怀疑它对你这样的人会有多大用处，但反正他现在也不需要它了。" : "也许有一天它会派上用场——反正他现在也不需要它了。") + "");
            get_images().showImage("item-cane");
            get_inventory().takeItem(get_weapons().HNTCANE,get_camp().returnToCampUseOneHour);
            FlagDict_Impl_.arrayWriteInt(KFLAGS.flags,2223,1);
         }
         else
         {
            doNext(get_camp().returnToCampUseOneHour);
         }
      }
      
      public function takeFoxBerry() : void
      {
         clearOutput();
         get_images().showImage("item-fBerry");
         get_inventory().takeItem(get_consumables().FOXBERY,get_camp().returnToCampUseOneHour);
      }
      
      public function takeCaninePepper() : void
      {
         clearOutput();
         get_images().showImage("item-cPepper");
         get_inventory().takeItem(get_consumables().CANINEP,get_camp().returnToCampUseOneHour);
      }
      
      public function surrenderToTheHoundsIII() : void
      {
         clearOutput();
         get_images().showImage("badend-wildhunt");
         outputText("<b>主人吹响了他的号角，你的耳朵竖了起来。他骑在马上，向雾气缭绕的树林中疾驰而去，就像其他猎犬一样，你紧随其后。</b>[pg]");
         get_game().gameOver();
      }
      
      public function surrenderToTheHoundsII() : void
      {
         clearOutput();
         outputText("黑色的皮毛覆盖了你的");
         if(get_player().balls == 0)
         {
            outputText("新的");
         }
         outputText("蛋蛋，并向上延伸到你闪亮的红色阴茎的一半，形成了一个包皮。");
         if(get_player().wings.type != 0)
         {
            outputText("你呜咽着，在地上打滚，突然意识到，当你被你的阴茎分散注意力时，你的翅膀一定已经脱落了。");
         }
         outputText("你张开嘴，露出一个狗一样的笑容，感觉到跳动的睾丸里精液在温暖地翻腾。你渴望释放，只想抚摸自己。你举起长着黑色爪子的爪子，伸向你的阴茎，但突然停住了，意识到它们不再适合这项任务。[pg]");
         get_images().showImage("wildhunt-surrender-II");
         outputText("相反，你蜷缩起肚子，试图用嘴够到你的阴茎。");
         if(get_player().face.type != 2)
         {
            outputText("当你的脸向前突出时，世界以惊人的方式扭曲了，在你曾经的脸的位置长出了一个长满黑毛的口鼻。");
         }
         outputText("你呜咽着，直直地盯着你尖尖的狗阴茎，以及从顶端流下的一丝先列腺液，但你本能地知道自慰是被禁止的。");
         outputText("[pg]魔王……主人，你的大脑纠正了自己。主人对你轻声低语。[say:耐心点，猎犬，]他命令道，用戴着手套的强壮的手按住你的肚子，把你按在地上。你一动不动，顺从地躺在主人身边，他跪在你仰卧的身体旁边。他的另一只手慢慢地抓住了你的阴茎，你的大脑融化了。[pg]");
         outputText("当主人把你按倒，抚摸你的阴茎时，你简直置身于绝对的天堂。他戴着手套的手指以优雅的效率在你的肉棒上动作，顺着你的长度滑下，并以美妙的节奏挤压。他放在你胸口的手很稳，但在你的皮毛中穿梭，抚摸着你宽阔、肌肉发达的腹部。[pg]");
         outputText("你的眼睛翻白，舌头伸出，主人挤压着你阴茎的根部。你的");
         if(!get_player().hasKnot())
         {
            outputText("新的");
         }
         outputText("肉结肿胀起来，他那只坚定的手放在上面感觉太棒了。在某个时候，另外两只猎犬出现了，你能感觉到，而不是看到，它们就在附近。");
         outputText("[pg]你在绝对的幸福中呜咽和呻吟，并开始不由自主地挺动。你想为主人保持静止和顺从，但你的身体有其他的想法。你呜咽着，在主人的手下扭动和挣扎。他咕哝着，手移动得越来越快，越来越紧地挤压着你的狗阴茎。[pg]");
         outputText("伴随着一声震动树林的嚎叫，你高潮了，精液喷洒在你的肚子上。你的四肢变得摇摇晃晃，你的眼睛交叉，几乎看不清主人在你面前沾满精液的手。你知道他想要什么，你顺从地用舌头清理他的手套，从他的手指上吸食你自己的精液。[pg]");
         outputText("主人站了起来，当你摇摇晃晃地站起来时，另外两只猎犬走上前来，它们宽大的舌头舔着你的肚子和阴茎，清理你皮毛上的精液。[pg]");
         doNext(surrenderToTheHoundsIII);
      }
      
      public function surrenderToTheHounds() : void
      {
         clearOutput();
         outputText("你坐在那里，浑身发抖，无法摆脱浓雾的影响，极度恐惧地抬头看着那个追捕了你这么久的猎人。[pg]");
         outputText("你用颤抖的声音低下头，请求他彻底将你作为他的猎物。[pg]");
         outputText("[say:我可怜的母鹿，]他嘟囔着。你感觉到他戴着手套的手放在你的头上，穿过你的[hair]，你的肩膀也随之垮了下来。[say:也许我把你逼得太紧了，]他喃喃地说，捧着你的脸颊。[pg]");
         outputText("你在他的触碰下发抖，彻底崩溃了。[pg]");
         get_images().showImage("wildhunt-surrender-I");
         outputText("[say:看着我，]他命令道。你完全服从猎人的话，抬起头，迎上他那如红炭般的眼睛。[say:我会做出补偿的，]他轻声说道。[pg]");
         outputText("他的话语在你体内回荡，你感到胃里升起一股暖流。你的手臂和腿感觉有些……不对劲……但你的目光无法从魔王的眼睛上移开，即使当痛苦刺穿你的身体，你的肌肉膨胀，你的[armor]撕裂并脱落时也是如此。魔王松开了对你的控制，你立刻低头看着自己的身体。[pg]");
         if(get_player().hasFur())
         {
            outputText("你的皮毛变成了乌黑色。");
         }
         else
         {
            outputText("黑色的皮毛像涨潮一样顺着你的身体蔓延。");
         }
         outputText("你的肌肉在午夜般的皮毛下隆起膨胀。");
         if(get_player().hasBreasts())
         {
            outputText("你的胸部先是变得平坦，然后膨胀起来，因为");
         }
         else
         {
            outputText("紧");
         }
         outputText("紧绷的肌肉填满了你的整个身躯。");
         if(get_player().lowerBody.type == 2)
         {
            outputText("你的狗爪感到一阵刺痛，肌肉在那里生长，将它们重塑为粗壮、健美的猎犬腿。");
         }
         else
         {
            outputText("你的[legs]弯曲并发出断裂声，让你痛得嚎叫起来，它们重塑成了带有玛瑙色爪子的犬科爪子。");
         }
         outputText("[pg]在你野兽般的双腿之间，你的生殖器正在重组。");
         if(get_player().hasVagina() && !get_player().hasCock())
         {
            outputText("你的阴蒂肿胀到惊人的尺寸，跳动着暗红色，紫色的静脉贯穿其中。你大口喘着粗气，舌头伸出嘴外，你阴道的其余部分闭合了，仿佛从未存在过一样，片刻之后，取而代之的是两颗巨大睾丸的肿胀。");
         }
         else if(get_player().hasCock() && !get_player().hasVagina())
         {
            if(get_player().totalCocks() > 1)
            {
               outputText("你的胃一阵翻腾，你的阴茎拍打在一起，开始融合为一个肿胀的形态。它脉动着，根部肿胀，尖端变尖，变成了一根单一的狗鸡巴。");
            }
            else if(get_player().cocks[0].get_cockType() != CockTypesEnum.DOG)
            {
               outputText("你的阴茎开始像粘土一样变形和塑造，隐隐作痛，呈现暗红色，静脉变暗成紫色，尖端拔出，形成一根跳动的新狗鸡巴。");
            }
            else
            {
               outputText("你的犬科阴茎痛苦地跳动着，让你喘息和呜咽。");
            }
         }
         else if(get_player().hasVagina() && get_player().hasCock())
         {
            if(get_player().totalCocks() > 1)
            {
               outputText("你大口喘着粗气，舌头伸出嘴外，你的阴道闭合了，仿佛从未存在过一样，片刻之后，取而代之的是你肿胀的巨大睾丸的曲线。你的胃一阵翻腾，你的阴茎拍打在一起，开始融合为一个肿胀的形态。它脉动着，根部肿胀，尖端变尖，变成了一根单一的狗鸡巴。");
            }
            else
            {
               outputText("你大口喘着粗气，舌头伸出嘴外，你的阴道闭合了，仿佛从未存在过一样，片刻之后，取而代之的是你肿胀的巨大睾丸的曲线。");
               if(get_player().cocks[0].get_cockType() != CockTypesEnum.DOG)
               {
                  outputText("你的阴茎开始像粘土一样变形和塑造，隐隐作痛，呈现暗红色，静脉变暗成紫色，尖端拔出，形成一根跳动的新狗鸡巴。");
               }
               else
               {
                  outputText("你的犬科阴茎痛苦地跳动着，让你喘息和呜咽。");
               }
            }
         }
         else if(!get_player().hasVagina() && !get_player().hasCock())
         {
            outputText("你胯部平滑的曲线泛起涟漪并隆起，一个樱桃红色的尖端从你的皮毛中推出。你周围的风变大了，吹过你新长出的、光滑的狗鸡巴。这种压倒性的感觉让你不寒而栗，你仰起头嚎叫起来。");
         }
         doNext(surrenderToTheHoundsII);
      }
      
      public function stopTheMadness() : void
      {
         FlagDict_Impl_.arrayWriteInt(KFLAGS.flags,1067,1);
         clearOutput();
         get_images().showImage("wildhunt-escaped");
         outputText("你受够了这个疯子和他那疯狂的狩猎。你极度恼火地告诉他停止追捕你。[pg]");
         outputText("[say:停止？]他问道，眼中的红光黯淡下来。[pg]");
         outputText("你眯起眼睛，开始告诉他你到底有多受够了这场永无止境的狩猎。[pg]");
         outputText("[say:如你所愿，]魔王说道。浓雾再次滚滚而来，吞没了魔王和他的坐骑。片刻后雾气散去，留下你独自一人在森林里。[pg]");
         outputText("你有一种感觉，你再也见不到他了。");
         menu();
         doNext(get_camp().returnToCampUseOneHour);
      }
      
      public function set_changes(param1:int) : int
      {
         return get_mutations().changes = param1;
      }
      
      public function set_changeLimit(param1:int) : int
      {
         return get_mutations().changeLimit = param1;
      }
      
      public function repeatWildHuntWait() : void
      {
         var _loc1_:* = null as Player;
         clearOutput();
         get_images().showImage("wildhunt-encounter");
         outputText("大雾如潮水般涌来，包围了你，模糊了周围的森林。你听到雷鸣般的马蹄声正在逼近，紧接着是猎犬的吠叫声。[pg]");
         outputText("你不为所动，双臂交叉，站稳脚跟，死死盯着那充满威胁的浓雾。[pg]");
         outputText("狩猎的声音越来越大，直到树木本身似乎都在随着逼近的狩猎声而颤抖。你昂首挺胸，拒绝参与猎手那扭曲的游戏。[pg]");
         outputText("震耳欲聋的狩猎声戛然而止。就像退潮一样，你周围的雾气散去，让森林恢复了清晰与平静。慢慢地，鸟鸣和虫鸣声又回到了你周围的树林中。[pg]");
         outputText("看来魔王对追逐不逃跑的猎物没有兴趣。[pg]");
         if(get_player().get_inte100() < 80)
         {
            _loc1_ = get_player();
            _loc1_.set_inte(_loc1_.get_inte() + 1);
         }
         menu();
         doNext(get_camp().returnToCampUseOneHour);
      }
      
      public function repeatWildHuntGivenToTheHoundsII() : void
      {
         clearOutput();
         outputText("你颤抖着，雾气带来的恐惧依然控制着你的身体。你感到一阵奇怪的感激——猎犬们不想吃你，它们只是想满足另一种饥渴。而在你体内那令人神志不清的雾气作用下，你拼命地想要满足它们。你顺从的大脑甚至希望，如果你能做得很好，它们就会免除对你进一步的支配。如果你不是那么害怕它们的话，你一定会对被两只猎犬操到精疲力竭的想法感到反感。你脑海深处闪过一个念头，希望这雾气的效果只是暂时的。[pg]");
         outputText("你回头看了一眼，想确保这只猎犬能毫无困难地进入你，");
         if(get_player().isTaur())
         {
            outputText("意识到你太高了，你把双腿折叠在身下，完全趴到地上，");
         }
         outputText("这时另一只猎犬粗暴地推着你的");
         if(get_player().get_femininity() < 30)
         {
            outputText("强健的下巴");
         }
         else if(get_player().get_femininity() > 70)
         {
            outputText("娇柔的下巴");
         }
         else
         {
            outputText("下巴");
         }
         outputText("，把它转向它那巨大、黏滑的狗鸡巴。在龟头被强行塞进你嘴唇之间前，你瞥见了一滴晶莹剔透的先列腺液。[pg]");
         if(get_player().hasVagina())
         {
            if(get_player().tail.type == 26 || get_player().tail.type == 2 || get_player().tail.type == 13)
            {
               get_images().showImage("wildhunt-catched-female-canine");
            }
            else if(get_player().isGoo())
            {
               get_images().showImage("wildhunt-catched-female-goo");
            }
            else if(get_player().tail.type == 14)
            {
               get_images().showImage("wildhunt-catched-female-dragon");
            }
            else if(get_player().tail.type == 7)
            {
               get_images().showImage("wildhunt-catched-female-shark");
            }
            else if(get_player().tail.type == 1)
            {
               get_images().showImage("wildhunt-catched-female-horse");
            }
            else if(get_player().tail.type == 8)
            {
               get_images().showImage("wildhunt-catched-female-feline");
            }
            else
            {
               get_images().showImage("wildhunt-catched-female");
            }
         }
         else if(get_player().tail.type == 26 || get_player().tail.type == 2 || get_player().tail.type == 13)
         {
            get_images().showImage("wildhunt-catched-male-canine");
         }
         else if(get_player().tail.type == 14)
         {
            get_images().showImage("wildhunt-catched-male-dragon");
         }
         else if(get_player().tail.type == 7)
         {
            get_images().showImage("wildhunt-catched-male-shark");
         }
         else if(get_player().tail.type == 1)
         {
            get_images().showImage("wildhunt-catched-male-horse");
         }
         else if(get_player().tail.type == 8)
         {
            get_images().showImage("wildhunt-catched-male-feline");
         }
         else
         {
            get_images().showImage("wildhunt-catched-male");
         }
         outputText("猎犬开始粗暴地操你的脸，在你的舌头上留下咸咸的先列腺液，它的鸡巴在你的双唇间跳动。你很感激猎犬只是选择操你，你现在只想尽你所能为猎犬做到最好。[pg]");
         outputText("当你感觉到[asshole]传来一阵压力时，你含着猎犬的鸡巴呻吟起来。这只野兽站在你上方，用它的身体覆盖住你的身体，同时将它[if (metric) {thirty-centimeter|foot}]长的狗鸡巴塞进你的后庭。");
         get_player().buttChange(36,true,false,false);
         outputText("你惊叫出声，意识到接下来会发生什么，试图扭动着逃跑，但被两只猎犬夹在中间，根本无处可逃。猎犬们齐声低吼，你僵住了，被这两只想要对你这具受惊、脆弱的身体为所欲为的强壮雄性吓破了胆。[pg]");
         outputText("毕竟，你那被迷雾搅得昏昏沉沉的脑海中闪过一个念头，它们已经赢得了对猎物为所欲为的权利。[pg]");
         outputText("这两只狗没花多长时间。它们前后摇晃，将粗壮的肉棒在你顺从、无助的身体里进进出出。前面那只更用力地压着你，把你的[face]埋进它的胯下，深到你的舌头都能舔到它那跳动肿胀的肉结，你的鼻子埋在它阴茎上方浓密的毛发里。");
         outputText("后面的猎犬一边一次又一次地挺进你的身体，一边用爪子抓着你的身体两侧。");
         outputText("你颤抖着，完全被这两只强壮的雄性支配，沦为供它们发泄兽欲的猎物母狗。[pg]");
         outputText("它们几乎同时高潮，前面那只将它巨大的肉结塞进你的嘴里，让你的下巴酸痛不已。当它的肉棒将滚烫的精液射进你的喉咙时，你发出抗议的呻吟。你几乎要被这根犬科动物的阴茎噎住了，除了吞下猎犬的精液，你什么也做不了。当你咕噜咕噜地咽下精液时，你感觉到身后的猎犬痛苦地将它粗大的肉结塞进你的屁股。你试图尖叫，但满嘴都是肉棒和精液，你只能像猎物一样承受。你的身体颤抖着，肚子因为两端都被精液填满而肿胀起来，让你感到温暖、饱胀，以及一种奇怪的满足感。[pg]");
         outputText("你打着寒颤，呼吸着冰冷、能改变心智的迷雾，顺从地等待着两只猎犬对你失去兴趣。奇怪的是，在射精之后，它们变得异常温存，你发现你的背部、脸部和屁股都被这些野兽温暖、慵懒地舔舐着。最终，它们的肉结缩小了，两只猎犬从你体内退出，让你瘫倒在地上，而它们则迈着步子走进了树林。[pg]");
         outputText("随着迷雾退去，你的理智迅速恢复。你眨了眨眼，摇摇晃晃地站起[feet]，擦去嘴唇上的精液，在空地上收集散落的装备，然后准备返回营地。你在空地上发现了一个闪亮的红辣椒，但似乎在你逃离狩猎失败时掉落了一些宝石。[pg]");
         var _loc1_:int = 10 + Utils.rand(15);
         if(get_player().get_gems() < _loc1_)
         {
            _loc1_ = get_player().get_gems();
         }
         var _loc2_:Player = get_player();
         _loc2_.set_gems(_loc2_.get_gems() - _loc1_);
         outputText("<b>你失去了" + _loc1_ + "颗宝石。</b>[pg]");
         dynStats(DynStat.Sens(-2),DynStat.Lib(2),DynStat.Cor(1),DynStat.Lust(0,DynStatOp.Eq));
         get_player().changeFatigue(10);
         get_player().orgasm("Generic");
         get_player().slimeFeed();
         doNext(takeCaninePepper);
      }
      
      public function repeatWildHuntGivenToTheHounds() : void
      {
         clearOutput();
         outputText("[say: 真令人失望，]魔王那优雅的声音滴落下来。当他在你下方走动时，他的" + (get_noFur() ? "脚步" : "马蹄") + "轻轻地落在地上。他身边的手杖每走一步就在森林的地面上敲击出声。当你的手指紧紧抓住网时，你勉强还有足够的理智来理解他的话。[pg]");
         outputText("[say: 这不过是几分钟的消遣。我本希望能有更多的挑战，]他说道，眼中的红光黯淡下来。[say: 你不太擅长这个，对吧？]他叹了口气说道。他那长长的脸庞看起来几乎有些惆怅。[pg]");
         outputText("[say: 也许下次吧，]他叹息道。他转过身，深色的斗篷飘扬起来。是你的错觉，还是他金色的鹿角似乎变得暗淡了一些？[pg]");
         outputText("当他把注意力从你身上移开时，你让自己稍微松了一口气。[pg]");
         if(get_player().hasVagina())
         {
            get_images().showImage("wildhunt-chased-female");
         }
         else
         {
            get_images().showImage("wildhunt-chased-male");
         }
         outputText("[say: 但是，如果不奖励我的猎犬们出色的工作，那就不对了。] 他的手杖闪烁着金光，猛地砍向支撑网的绳索。[pg]");
         outputText("当你摔到地上时，浓雾吞噬了魔王。撞击在长满青苔的森林地面上并没有让你受伤，但<b>确实</b>让你喘不过气来。当你挣扎着恢复呼吸时，你吸入了冰冷的雾气，一阵恐惧……以及某种其他的东西……流遍了你的全身。[pg]");
         outputText("随着两只猎犬毫不迟疑地行动，这种恐惧加倍了。它们在眨眼间就扑到了你身上，撕开你周围的网，一只强有力的爪子按住你的头，将你死死压住，同时发出咆哮和吠叫。它们红色、闪亮的狗鸡巴从厚重的包皮中滑出，上面跳动着细细的紫色静脉。这雾气绝对对你做了什么，因为看到这一幕，你忍不住舔了舔嘴唇。[pg]");
         outputText("第一只猎犬咆哮着咬下并撕扯掉你的[armor]，抬起一只巨大的爪子放在你的下背部，巨大的爪尖充满威胁地压在你的肉上。当一个湿润的鼻子贴上你的[ass]时，你感到一阵温暖，");
         if(get_player().hasVagina())
         {
            outputText("长长的舌头触碰着你[vagina]的下边缘");
         }
         else if(get_player().balls > 0)
         {
            outputText("长长的舌头舔舐着你睾丸的根部");
         }
         else if(get_player().hasCock())
         {
            outputText("长长的舌头舔舐着你鸡巴的根部");
         }
         else
         {
            outputText("长长的舌头温暖地拍打着你的会阴");
         }
         outputText("然后一路向上舔到你的[asshole]。[pg]");
         doNext(repeatWildHuntGivenToTheHoundsII);
      }
      
      public function repeatWildHuntEscaped() : void
      {
         clearOutput();
         get_images().showImage("wildhunt-escaped");
         outputText("魔王或许是狩猎之主，但你绝不是任何人的猎物。你立刻开始奔跑，像风一样穿过幽深森林，心脏在胸腔里怦怦直跳。");
         if(get_player().isGoo())
         {
            outputText("你像水银一样在森林的地面上移动，你黏滑的下半身流过所有的障碍物，让你渗流得越来越快，不断向前。");
         }
         else if(get_player().isBiped())
         {
            outputText("你的[legs]重重地踩在长满青苔的地面上，灵巧地穿过森林。");
         }
         else if(get_player().hasTailInsteadOfLegs())
         {
            outputText("你像风一样掠过长满青苔的地面，你的蛇躯推动着你穿过森林。");
         }
         else if(get_player().isDrider())
         {
            outputText("你那众多的腿在森林地面上飞奔，以极快的速度推动你在树木间穿梭。");
         }
         else if(get_player().isTaur())
         {
            outputText("你的蹄子让你在森林中如火箭般飞驰，在树木间躲闪，在树枝下低头穿行。");
         }
         outputText("尽管雾气像蛇一样在灌木丛中穿梭，紧跟在你的脚后跟，但它始终没能包围你，你听到狩猎的声音越来越远，直到完全消失。[pg]");
         outputText("看来你安全了……暂时如此。[pg]");
         get_player().changeFatigue(10);
         if(Utils.rand(5) == 0)
         {
            if(Utils.rand(2) == 0)
            {
               dynStats(DynStat.Tou(1));
            }
            else
            {
               dynStats(DynStat.Spe(1));
            }
         }
         menu();
         doNext(get_camp().returnToCampUseOneHour);
      }
      
      public function repeatWildHuntEncounter() : void
      {
         var pScore1:int;
         var _g1:ErlKingScene;
         var pScore:int;
         var _g:ErlKingScene;
         clearOutput();
         get_images().showImage("wildhunt-encounter");
         outputText("当你在幽深森林中漫步时，一阵熟悉的寒冷雾气开始在你的[feet]周围聚集，在远处，你听到了狩猎号角的声音和猎犬的吠叫声。[pg]");
         outputText("魔王冲你来了！[pg]");
         if(get_player().wings.type != 0)
         {
            outputText("你迅速环顾四周，意识到这里的树木长得太密了，你无法展开你的[wings]。[pg]");
         }
         outputText("你是要逃跑还是坚守阵地？[pg]");
         menu();
         addButton(0,"逃跑",repeatWildHuntChase);
         addButton(1,"等待",repeatWildHuntWait);
         if(playerHuntScore() >= 200)
         {
            outputText("既然你绝对能够逃脱，你可以故意放慢速度，让这场追逐保持趣味。");
            _g = this;
            pScore = 110;
            addButton(5,"逃跑(被抓)",function():void
            {
               _g.repeatWildHuntCaught(pScore);
            });
            _g1 = this;
            pScore1 = 90;
            addButton(10,"逃跑(失败)",function():void
            {
               _g1.repeatWildHuntCaught(pScore1);
            });
         }
      }
      
      public function repeatWildHuntChase() : void
      {
         var _loc1_:int = playerHuntScore();
         if(_loc1_ > 150)
         {
            repeatWildHuntEscaped();
         }
         else
         {
            repeatWildHuntCaught(_loc1_);
         }
      }
      
      public function repeatWildHuntCaught(param1:int) : void
      {
         clearOutput();
         get_images().showImage("wildhunt-chase");
         outputText("你在树林中奔跑，心跳得如此厉害，你觉得它都要从嗓子眼里跳出来了。尽管你拼尽全力，雾气依然在逼近。随之而来的是猎犬的声音，它们在你身旁奔跑，隐藏在浓浓的雾霾中。[pg]");
         outputText("猎犬在你的右边，你向左躲闪，差点撞到一棵树上，但你踉跄着躲了过去，却又听到猎犬在你的左边。你向右转，继续奔跑，无法摆脱被驱赶的感觉，但你太惊慌了，想不出逃脱的办法。[pg]");
         outputText("当你全速奔跑时，你的肺在燃烧，猎犬把你赶来赶去。当你吸入雾气时，发生了一些事情——你变得越来越难以思考。你只需要跑，从追捕你的捕食者手中<b>逃跑</b>。[pg]");
         outputText("当你跳过一丛低矮的灌木时，树叶在你周围炸开，世界天旋地转。是个陷阱！网在你周围收拢，把你拉到半空中，让你在[if (metric) {五米|十五英尺}]高的地方旋转。猎犬从雾中冲出，在你下方的地面上狂吠咆哮。就在你手臂够不到的地方，有一根粗绳，从地面一直延伸到支撑你的树枝上。[pg]");
         outputText("绳子比你的手腕还粗，如果给你时间，你也许能解开它们，但网的旋转，加上雾气带来的令人抓狂的恐惧，让你根本没有思考的余地。猎犬在咆哮，世界在旋转，你是猎物，而且你被抓住了。[pg]");
         if(get_player().bunnyScore() >= 4 || get_player().kitsuneScore() >= 4 || get_player().harpyScore() >= 4 || param1 > 100)
         {
            doNext(repeatWildHuntAWinnerIsYou);
         }
         else
         {
            doNext(repeatWildHuntGivenToTheHounds);
         }
      }
      
      public function repeatWildHuntAWinnerIsYou() : void
      {
         clearOutput();
         get_images().showImage("wildhunt-huntsman");
         outputText("树林里响起了热烈的掌声。猎犬们安静下来，顺从地蹲坐着，魔王走进了空地，下马抬头看着你。[pg]");
         outputText("[say:真是一场精彩的追逐，]他说道，戴着黑手套的双手仍在冰冷的空气中拍出清脆的断音。[say:我好久没这么开心过了。]空地沐浴在一层昏暗的光芒中——似乎魔王金色的鹿角正闪烁着内在的火光。[pg]");
         outputText("[say:那么，我的雌鹿，我的猎物，你有一个选择，]他说道，优雅的语调在空气中回荡。透过网，你可以看到迷雾正从森林地面上退去。你试探性地深吸了几口气，感觉头脑开始清醒。[pg]");
         outputText("他抓住吊着你的绳子，以他那纤细身躯令人惊讶的力量，将你放到了森林的地面上。[say:感谢你带来了一场盛大的狩猎，]他一边交替着双手将你放回地面，一边说道。[pg]");
         outputText("当你接触到苔藓时，网从你身上脱落，魔王向你伸出一只手拉你起来。[say:我想给你点东西。][pg]");
         outputText("你抬起头，看到魔王那纤细、优雅的身姿正低头看着你。在他的狩猎装备下，你可以看到一根粗壮的马形肉棒的轮廓，上面还有三圈包皮环，正紧紧地撑着黑色的皮革。[pg]");
         outputText("经历了这么多麻烦，一份奖励绝对是受欢迎的，尽管你会很感激一份礼物，但你甚至更欢迎在狩猎的疲劳之后能有机会放松一下。[pg]");
         outputText("你停顿了片刻，思考着他的话，意识到他可能在向你提供更多东西。如果你觉得自己够勇敢，你可以要求他彻底停止这场狩猎。或者，如果这场狩猎最终击垮了你的意志，你也许会选择永远屈服于这位猎手。[pg]");
         outputText("即使有这么多想法挤在你的脑海里，仍然有一丝微小的怨恨在燃烧。你可以冲向他，给这个傲慢的混蛋点颜色看看。[pg]");
         get_player().changeFatigue(10);
         menu();
         addButton(0,"性爱",predatoryPrey).sexButton(-1);
         addButton(1,"奖品？",whatsMyPrize);
         addButton(2,"停止",stopTheMadness);
         addButton(3,"投降",surrenderToTheHounds);
         addButton(4,"复仇",howDareYou);
      }
      
      public function predatoryPrey() : void
      {
         clearOutput();
         outputText("你站着，无法将视线从魔王苗条的身体和勃起的阴茎上移开。[pg]");
         outputText("你诱惑地微笑着，问魔王他到底在提供什么。[pg]");
         outputText("[say:正是你所想的，]魔王隆隆地说。你感觉到声音通过你的手臂震动。也许是雾气的残留影响，但你需要猎人进入你的身体，他的手臂环绕着你，当他的一只手臂环绕在你的后腰，另一只手臂放在你的脑后，手指与你的[hair]交织在一起时，你融化在他的拥抱中。[pg]");
         outputText("他温暖的嘴唇压在你的脖子上，他的手指解开你的[armor]，让它掉落在森林的地面上。他的触摸让你感到温暖的颤栗，当他让你向后退，将你紧紧地压在一棵树上时，你呻吟起来。[pg]");
         if(!get_player().isTaur())
         {
            if(get_player().hasVagina() && !get_player().hasCock())
            {
               outputText("你背靠着树，他引导着你的");
               if(get_player().isBiped() || get_player().isDrider() || get_player().isGoo())
               {
                  outputText("[legs]抬起，让它们缠绕在他的背上。");
               }
               else if(get_player().hasTailInsteadOfLegs())
               {
                  outputText("尾巴抬起，让你的蛇身缠绕在他的背上。");
               }
               outputText("他的一只手紧紧托住你的[ass]，将你抱起，另一只手则在你的胸前轻柔地游走，依次揉捏抚摸着你的[chest]。他逐一捻弄着你的乳头，让一阵阵快感如电流般传遍你的全身。[pg]");
               outputText("[say:占有我吧，猎手，]你娇喘道。他的肉棒已经蓄势待发，那根马屌滑入你的[vagina]，深深地挺进你的体内。");
               if(get_player().tail.type == 2 || get_player().tail.type == 26 || get_player().tail.type == 13)
               {
                  get_images().showImage("wildhunt-prey-female-canine");
               }
               else if(get_player().tail.type == 24)
               {
                  get_images().showImage("wildhunt-prey-female-cervine");
               }
               else if(get_player().tail.type == 8)
               {
                  get_images().showImage("wildhunt-prey-female-feline");
               }
               else
               {
                  get_images().showImage("wildhunt-prey-female");
               }
               get_player().cuntChange(36,true,true,false);
               outputText("[pg]你喘息着，在他开始抽插时因愉悦而颤抖。他改变了手的位置，托住你的腋下，将你抵在树干上操弄。当他深深刺入你体内时，粗糙的树皮刮擦着你的后背。你能感觉到他包皮上的三重肉环在摩擦着你的内壁。[pg]");
               outputText("他的速度越来越快，强壮的双臂将你举起，让你在他的肉棒上起伏，利用你自身的重量一次又一次地将你套弄在他的阴茎上。你呻吟着，高潮时身体不住地颤抖，他的肉棒深深地研磨着你的子宫。在保持了稳定节奏几分钟后，他闷哼一声，将你压下，片刻之后，他在你体内达到了高潮，将滚烫浓稠的精液泵入你的体内。当他一股接一股地将浓稠的精液灌满你时，你颤抖不已。[pg]");
               outputText("你双臂环抱着他，紧紧依偎着他，他变换了姿势，在你因快感的余韵而颤抖时支撑着你。他的一只手臂托着你，让你紧贴着他肌肉发达的胸膛，另一只戴着手套的手抚摸着你的[hair]，此时雾气开始弥漫。[pg]");
               outputText("随着冰冷的雾气变浓，你感到昏昏欲睡，尽管魔王的身体让你保持温暖。尽管你努力保持清醒，但还是在他的怀抱中渐渐睡去。[pg]");
               outputText("一个小时后你醒了过来，头晕目眩，感觉因为所有的……运动而变得稍微强壮了一些。[pg]");
            }
            else if(get_player().hasCock())
            {
               outputText("你背靠着树，他引导着你的");
               if(get_player().isBiped())
               {
                  outputText("[legs]抬起，让它们缠绕在他的背上。");
               }
               else if(get_player().hasTailInsteadOfLegs())
               {
                  outputText("尾巴抬起，让你的蛇身缠绕在他的背上。");
               }
               outputText("他的一只手紧紧抓住你的[ass]，将你托起，另一只手则在你的胸前轻柔地抚摸，捏了捏你的乳头，然后顺着你的肚子往下，抓住了[oneCock][pg]");
               outputText("[say:占有我，猎手，]你呻吟道。他的肉棒已经抵在了你的[ass]上。他那马一样的阴茎顶进你的[asshole]，深深地插入你的体内。");
               if(get_player().tail.type == 2 || get_player().tail.type == 26 || get_player().tail.type == 13)
               {
                  get_images().showImage("wildhunt-prey-male-canine");
               }
               else if(get_player().tail.type == 24)
               {
                  get_images().showImage("wildhunt-prey-male-cervine");
               }
               else if(get_player().tail.type == 10)
               {
                  get_images().showImage("wildhunt-prey-male-bunny");
               }
               else if(get_player().tail.type == 8)
               {
                  get_images().showImage("wildhunt-prey-male-feline");
               }
               else
               {
                  get_images().showImage("wildhunt-prey-male");
               }
               get_player().buttChange(36,true,true,false);
               outputText("[pg]你喘息着，在他开始在你体内抽插时，你因愉悦而颤抖。他的手改变了位置，一只手放在你的后腰，稳住你，把你按在树上操。另一只手紧紧握住你的阴茎，给你手淫，戴着手套的手配合着他抽插的节奏粗暴地套弄着你。粗糙的树皮刮擦着你的背部，你能感觉到他包皮上的三重环摩擦着你[asshole]的内壁。[pg]");
               outputText("你呻吟着，高潮时身体颤抖，精液喷洒在他的胸膛和你自己的身上，他的肉棒在你体内深深地研磨。他把你按倒，片刻之后，他在你体内高潮，将滚烫浓稠的精液注入你的体内。他一股接一股地将浓稠的精液射进你的肠道，你的肚子因为精液的量而微微向外隆起。[pg]");
               outputText("你双臂环抱着他，紧紧地贴着他，他改变了抓握的姿势，在你因快感的余韵而颤抖时将你托起。他的一只手臂托着你，让你贴近他现在黏糊糊的肌肉发达的胸膛，另一只戴着手套的手仍在慢慢地抚摸着你的阴茎，此时雾气开始弥漫。[pg]");
               outputText("随着冰冷的雾气变浓，你感到昏昏欲睡，尽管魔王的身体让你保持温暖。尽管你努力保持清醒，但还是在他的怀抱中渐渐睡去。[pg]");
               outputText("一个小时后你醒了过来，头晕目眩，感觉因为所有的……运动而变得稍微强壮了一些。[pg]");
            }
         }
         else
         {
            outputText("魔王微笑着看着你，抚摸着你的脸颊。[say:我以保持一个合适的马厩而自豪，]他说道，动作轻柔地走到你身后。他强壮的双手放在你的侧腹，引导你面向一棵树。[pg]");
            if(get_player().hasVagina() && !get_player().hasCock())
            {
               get_images().showImage("wildhunt-prey-taur-female");
               outputText("你的[chest]贴在粗糙的树皮上，他抬起你的[tail]，将你的[pussy]暴露在他马巴龟头肿胀的前端。伴随着轻柔的声音，他挤进你的阴唇之间，让你感觉到每一个包皮环挤入你体内的感觉。");
               get_player().cuntChange(36,true,true,false);
               outputText("[pg]你双臂环抱树干，他的双手紧紧抓住你的侧腹。他" + (get_noFur() ? "开始抽插" : "自己的马腿开始将他推向") + "你，他那带有棱纹的阴茎在你的[pussy]里进进出出，马一样的肉棒上的隆起从内部按摩着你。他操你的力量让你的[chest]在树干上摩擦。");
               if(get_player().biggestLactation() > 0)
               {
                  outputText("摩擦开始挤压你的乳房，让你的乳汁顺着树干流下。");
               }
               outputText("擦伤的轻微疼痛与他用力抽插的快感交织在一起，你感觉到高潮即将来临。[pg]");
               outputText("伴随着一声呻吟，你高潮了，用尽全力抱住树干，后半身向后迎合着他的抽插。魔王保持着绅士风度，继续在你体内抽插着他粗壮的肉棒，直到你的高潮消退。然后他也射了，滚烫的精液灌满了你的体内。[pg]");
               outputText("他让你喘息片刻，然后拔了出来。你听到他的肉棒湿漉漉地拍打在大腿上的声音。一只强有力的手牵起你的手，引导你穿过空地，来到一根倒下的圆木旁。你晕乎乎地跟着他，他坐了下来，引导你也坐在他旁边。[pg]");
               outputText("他把手伸进腰带上的小袋里，拿出一小瓶药膏。他一只手抚摸着你的头发，另一只手开始把药膏涂抹在你被划伤的[chest]上。药膏清凉舒缓，魔王非常体贴。你很快就睡着了，头靠在他的胸膛上。[pg]");
               outputText("一小时后，你在空地上醒来，魔王已经不见了，你的胸口也完好无损。你睡眼惺忪地眨了眨眼，依然能感觉到魔王的手臂环绕着你，你摇摇晃晃地站起来，往营地走去。[pg]");
            }
            else if(get_player().hasCock())
            {
               get_images().showImage("wildhunt-prey-taur-male");
               outputText("你的[chest]贴着粗糙的树皮，他蹲在你身边，戴着手套的手握住你已经硬挺的[oneCock]。从这个角度，你与其说是看到，不如说是感觉到他在你的[cock]上涂抹药膏，让你完全勃起。他一只手安抚地抚摸着你的侧腹，另一只手紧紧握住你的[cock]套弄着。[pg]");
               outputText("你喘着粗气，指尖紧紧抓住树皮，任由他为你手淫。你吐出舌头，他戴着手套的手紧紧握住你，上下套弄的速度越来越快。无论他用了什么润滑剂，效果都不可思议，每一次上下套弄都让你感到一阵酥麻。[pg]");
               outputText("你对这种感觉欲罢不能——被魔王榨取。他甚至似乎在低声哼唱，一边抚摸着你的侧腹，一边用灵巧的手指套弄着你。就好像他在安抚一匹发情的种马！你的腿条件反射地跺着，你的[tail]甩动着，你的身体宣告着你想要射精的意图。[pg]");
               outputText("魔王加快了套弄的速度作为回应，他的手握得更紧了，增加了药膏带来的酥麻快感。你呻吟着，紧紧抓住树干，用胸部摩擦着树干以获得额外的刺激，粗糙的树皮狠狠地刮擦着你的[nipples]。[pg]");
               outputText("魔王最后紧紧捏了一下，指尖按在你的龟头上。你呻吟着，射在了他的手里，你的精液喷射在他的指尖上，像水管一样喷洒在长满青苔的森林地面上。[pg]");
               outputText("你精疲力竭地喘着粗气，感觉到一块湿布贴在你疲软的肉棒上。他说照顾他的坐骑可不是开玩笑的——魔王正在为你清理。他把你的肉棒擦干净，甚至接住了溅到你下腹部的散落水滴。这位猎人非常细致，你轻柔地打了个哈欠，在他细心的照料下打起了瞌睡。[pg]");
               outputText("你睡眼惺忪，只有一半的意识，他引导你来到一片草地上，你很快就在那里睡着了。一小时后，你在空地上醒来。魔王已经不见了，但当你回想起他的抚摸时，你的肉棒抽动了一下。你摇摇晃晃地站起来，往营地走去。[pg]");
            }
         }
         if(get_player().get_tou() < get_player().get_str())
         {
            dynStats(DynStat.Tou(1),DynStat.Lust(0,DynStatOp.Eq));
         }
         else
         {
            dynStats(DynStat.Str(1),DynStat.Lust(0,DynStatOp.Eq));
         }
         get_player().orgasm("Generic");
         get_player().slimeFeed();
         menu();
         doNext(get_camp().returnToCampUseOneHour);
      }
      
      public function playerHuntScore() : int
      {
         var _loc1_:int = int(get_player().get_inte() + get_player().get_spe() - (get_player().get_fatigue() - get_player().maxFatigue() + 100) * 2);
         if(get_player().hasPerk(PerkLib.Evade))
         {
            _loc1_ += 20;
         }
         if(get_player().hasPerk(PerkLib.Runner))
         {
            _loc1_ += 20;
         }
         if(get_player().hasPerk(PerkLib.Unhindered) && (get_player().get_armor() == ArmorLib.NOTHING || get_player().get_armor().get_perk() == "Adornment"))
         {
            _loc1_ += 20;
         }
         if(get_player().isDrider())
         {
            _loc1_ += 20;
         }
         if(get_player().hasPerk(PerkLib.CorruptedNinetails))
         {
            _loc1_ += 30;
         }
         if(get_player().hasPerk(PerkLib.EnlightenedNinetails))
         {
            _loc1_ += 30;
         }
         if(get_player().hasPerk(PerkLib.FireLord))
         {
            _loc1_ += 10;
         }
         if(get_player().hasPerk(PerkLib.Whispered))
         {
            _loc1_ += 10;
         }
         if(get_player().hasPerk(PerkLib.Fast))
         {
            _loc1_ += 10;
         }
         if(get_player().hasPerk(PerkLib.Incorporeality))
         {
            _loc1_ += 10;
         }
         if(get_player().canFly())
         {
            _loc1_ += 10;
         }
         if(get_player().kitsuneScore() > 0)
         {
            _loc1_ -= int(get_player().kitsuneScore() * 20);
         }
         if(get_player().bunnyScore() > 0)
         {
            _loc1_ -= int(get_player().bunnyScore() * 20);
         }
         if(get_player().harpyScore() > 0)
         {
            _loc1_ -= int(get_player().harpyScore() * 20);
         }
         if(get_player().gooScore() > 0)
         {
            _loc1_ -= int(get_player().gooScore() * 10);
         }
         if(get_player().isTaur())
         {
            _loc1_ -= 10;
         }
         if(_loc1_ < 0)
         {
            _loc1_ = 0;
         }
         return _loc1_;
      }
      
      public function howDareYouLeave() : void
      {
         clearOutput();
         outputText("你不需要这个卑躬屈膝的猎人，当你把他拖到一边时，他的喘息和乞求变得更加疯狂。这可能是光线造成的错觉，但你发誓他的" + (get_noFur() ? "皮肤" : "皮毛") + "变得更浅了。当他在地上滑行时，他的臀部扭动着，让人注意到它们实际上是多么纤细和少女。");
         outputText("[pg]当你[if (str < 30) {费力地}]拉着他时，传来一声清脆的断裂声，他金色的鹿角在你的手中松脱了。");
         outputText("[pg]你向后[if (singleleg) {退去|退了一步}]，低头看着这位颜面扫地的森林领主。他躺在那里，喘着粗气，泥土蹭进了他的" + (get_noFur() ? "衣服" : "皮毛") + "里，鹿角也断了。从他皮衣和臀部上的湿润污迹来看，他似乎在某个时刻高潮了，现在正慢慢地从他的衣服里渗出来" + (get_noFur() ? "" : "，使他的皮毛纠结在一起") + "。不知怎么的，他的" + (get_noFur() ? "头发" : "皮毛") + "似乎带有一种奇怪的色调——有点粉红？你耸了耸肩，把这当成是光线的错觉，收拾好自己准备离开。");
         outputText("[pg]当你转身离开时，低矮的雾气滚滚而来，吞没了趴在地上的猎人。你知道他绝对不会再来烦你了。");
         takeGoldenAntlers();
      }
      
      public function howDareYouII() : void
      {
         clearOutput();
         if(get_player().hasVagina() && !get_player().hasCock())
         {
            outputText("你抓住他的角，将他向后推倒。他似乎越来越虚弱了，甚至几乎无法从地上爬起来。你轻蔑地俯视着这个趴在地上的猎人，大步走到他的头前，你的[feet]跨立在他头的两侧。[pg]");
            outputText("[say: 你在干什——]他试图发问，但你蹲下身，将他的" + (get_noFur() ? "脸" : "鹿嘴") + "埋进你的阴部。你抓住他鹿角向前的分叉，引导他的嘴贴上你湿润的阴道。[pg]");
            outputText("你没有回答他，只是用力拉扯他的鹿角，让他的" + (get_noFur() ? "深色嘴唇" : "深色口鼻") + "紧紧贴在你的小穴上。你低吼着，感觉到他怯生生的舌头在你的阴唇上推挤。[pg]");
            outputText("你紧紧抱住他的头，感觉到他的舌头在你湿润的阴道里探索得更深，你引导他" + (get_noFur() ? "" : "湿润的鹿") + "鼻子摩擦你的阴蒂。[pg]");
            get_images().showImage("wildhunt-revenge-female");
            outputText("曾经高贵的国王现在什么都不是了，当他发现自己人生的新位置时，他的舌头埋在你的阴唇之间。他更像是你的公主——你那淫荡的小公主。你看到一阵颤抖顺着他的胸膛和前身蔓延，他的肉棒紧紧绷在紧身皮衣上。你微微张开嘴唇，向他下达了作为你新公主的第一个命令。[pg]");
            outputText("他呻吟着，顺从而颤抖，将扁平的舌头推入你的小穴。这可能是光线造成的错觉，但你发誓他的" + (get_noFur() ? "皮肤" : "皮毛") + "刚刚变浅了一点。他的臀部扭动着，让人注意到它们实际上是多么纤细和少女。显然，他对这种虐待反应非常好。[pg]");
            outputText("你满意地叹了口气，坐在他的脸上，紧紧抓住他的鹿角，引导他舔舐的舌头。你骑在魔王的脸上将近半个小时。最终你高潮了，在狂喜中呻吟，用你的淫液覆盖了猎人的脸。你用力在他的脸上摩擦，用力向上拉扯他的角。伴随着一声脆响，他金色的鹿角在你的手中松脱了。[pg]");
            outputText("你站起身，俯视着这位声名狼藉的森林之主。他躺在那里，喘着粗气，身上涂满了你的淫液，泥土磨进了他的" + (get_noFur() ? "衣服" : "皮毛") + "里，他的鹿角也断了。从弄脏他皮衣和臀部的湿润痕迹来看，他似乎在某个时刻射了，现在正慢慢从他的衣服里渗出来" + (get_noFur() ? "" : "，使他的皮毛缠结在一起") + "。" + (get_noFur() ? "不知为何，他的头发看起来" : "也许是因为精液，但他的皮毛看起来") + "有一种奇怪的色调——微微发粉？当你收拾好自己准备离开时，你耸耸肩，认为这只是光线造成的错觉。[pg]");
            outputText("当你转身离开时，雾气低低地卷了进来，吞没了趴在地上的猎人。你知道他绝对不会再来烦你了。[pg]");
         }
         else if(get_player().hasCock())
         {
            outputText("你解开你的[armor]，释放出你的[cock]。你眯起眼睛看着倒下的猎人，抓住他的鹿角，把你的肉棒塞进他的脸。[pg]");
            outputText("奇怪的是，魔王几乎不需要鼓励，几乎是急切地将你的[cock]含入他的" + (get_noFur() ? "嘴里" : "长长的牡鹿口鼻中") + "，他滚烫的舌头在你的肉棒下方上下舔舐。难道那根手杖在强化他身体的同时，也在强化他的心智吗？当你抓住他的鹿角，将自己深深地插入他的嘴里时，他舒服地呻吟着。[pg]");
            outputText("魔王在技巧上的不足，用热情弥补了，他大声地舔舐和吸吮着你的肉棒。当猎人充分润滑了你的肉棒后，你向后推他的鹿角，把他的嘴从你的[cock]上推开。撞击的力量折断了他金色的角，它们在你的手中松脱了。魔王失去了角，呜咽着抬头看着你，伸手去抓你的肉棒。[pg]");
            outputText("你想让他四肢着地，所以你把猎人推回去，把他的角扔到一边，他跌跌撞撞地倒在长满青苔的地上，没有了手杖，他明显变弱了。不知为何，你觉得让他变得如此顺从的不仅仅是失去了手杖。现在没有了角，他看起来更像一个" + (get_noFur() ? "小女孩" : "母鹿") + "。[pg]");
            outputText("魔王翻过身，四肢着地，他的斗篷向上卷过肩膀。在他紧绷的臀部上方是一条簇状的鹿尾。你得意地笑了笑，一只手抓住毛茸茸的尾巴，把他的皮裤推到膝盖处。他回头越过肩膀看着你。他眼中的红光已经消失，取而代之的是一双睁得大大的、母鹿般的棕色眼睛。当你分开他" + (get_noFur() ? "骨瘦如柴的" : "长着白毛的") + "臀部时，浓密的睫毛满怀希望地向你眨着。[pg]");
            get_images().showImage("wildhunt-revenge-male");
            outputText("曾经高贵的国王现在什么都不是了，当他发现自己人生的新位置时，他赤裸着身体，准备迎接你的肉棒。他更像是你的公主——你那淫荡的小公主。你看到一阵颤抖顺着他的后背蔓延，他柔软毛茸茸的尾巴在你的手中抽动。但这还不够。你想听他亲口说出来。[pg]");
            outputText("[say: 我……我是一个公主，]他嘟囔着，声音明显变高了。你微笑着，想知道失去手杖还会对这位公主产生什么影响。[pg]");
            outputText("这正是你想听到的，当你的[cock]压在他的后庭上作为奖励时，他颤抖了。新公主呻吟着，像你一样颤抖着，将他的屁股向后推向你。[pg]");
            outputText("你挺入他的身体，他仰头发出一声娇吟。那里面紧致得离谱，却又饥渴难耐。随着你开始抽送，他的呻吟声愈发尖细，比起之前雷鸣般的低吼，现在更多了几分少女般的娇媚。一下又一下，你顶入他那柔软的翘臀。随着最后几缕雾气消散，也不知是不是光线造成的错觉，他身上的" + (get_noFur() ? "皮肤" : "毛发") + "似乎变淡了几分。[pg]");
            outputText("他在你身下颤抖着，紧绷着身体，随着你每一次的抽插，他的臀部都迎合着向后顶弄。他扭动着身体，发出阵阵呻吟，你听到他身下传来水花飞溅的声音。从那滩不断扩大的黏稠白色液体来看，这个荡妇射得非常猛烈。[pg]");
            outputText("看到他完全臣服的样子，你兴奋得浑身发抖，深深地射在他的屁股里，用你滚烫黏稠的精液填满了他。你紧紧抓住他的屁股，喘着粗气，尽可能深地插进去，将他永远标记为你的母狗。[pg]");
            outputText("他呻吟着，瘫软下来，脸颊贴在地上，你弯下腰，把他的脸按在地上摩擦。[pg]");
            outputText("看来你这个肮脏的小荡妇很喜欢这样，但你需要亲耳听他说出来。[pg]");
            outputText("[say: 是……是的……] 曾经的领主发出满足的呼噜声。[say: 我……我很喜欢……] 他再次颤抖起来，你注意到那变浅的" + (get_noFur() ? "皮肤并不是错觉。你新收的母鹿公主不再是深棕色，而是白皙的皮肤，并且还在慢慢变浅。" : "皮毛并不是错觉。你新收的母鹿公主不再是午夜般的黑色，而是沙褐色，并且还在慢慢变浅。") + "[pg]");
            outputText("从他体内退出来，你抚摸着他的[if (nofur) {皮肤|皮毛}]，问他以后还会不会再来烦你。你站起身，看着他的" + (get_noFur() ? "头发" : "皮毛") + "染上了一种奇特的粉红色。[pg]");
            outputText("[say: 不会了，我的[lord]，] 她柔声说道，跪起身来，舔舐着你的老二。等她清理干净后，她帮你穿好[armor]。你向她点头道别，开始往前走，看着她挥手告别时，精液顺着她紧绷的脸颊和双腿流下，你忍不住觉得好笑地撇了撇嘴。[pg]");
         }
         awardAchievement("猎人反成猎物",179,true,true,false);
         get_player().orgasm("Generic");
         menu();
         takeGoldenAntlers();
      }
      
      public function howDareYou() : void
      {
         clearOutput();
         get_images().showImage("wildhunt-revenge");
         outputText("你已经受够了魔王和他那疯狂的狩猎。你站起[feet]，拍开他伸出的手。他皱起眉头，但还没等他反应过来，你已经冲上前去，打掉了他手里的黑木手杖。手杖旋转着飞进灌木丛，消失在视线中。他眼中的光芒黯淡下来，鹿角上的光芒也随之消失。[pg]");
         outputText("他向后踉跄了一下，痛苦得好像你直接打中了他一样。他那" + (get_noFur() ? "" : "可笑的鹿") + "脸上闪过一丝困惑。[say:等等，我的手杖！它能让我抵御这片土地的严酷……]他喘息着，突然摇晃起来。[pg]");
         outputText("你冷笑一声，大步向前，又在肩膀上狠狠推了一把，把他推倒在地。他呻吟着跪倒在地。在空地边缘，猎犬们静静地坐着，等待着这场冲突的结果。[pg]");
         outputText("[say:求求你……我的手杖……]他恳求道。他跪在地上，颤抖的双臂支撑着身体。他似乎说的是实话——没有了手杖，他就像新生儿一样虚弱。[pg]");
         outputText("你已经忍受了他无休止的狩猎。你听过他的嘲弄和讥讽伴随着猎犬的吠叫在森林中回荡。你甚至被俘虏过，无助地悬挂在他饥饿的狗上方，很清楚他会对你做什么，然而这位前猎人一有机会就乞求怜悯。[pg]");
         outputText("对他来说不幸的是，你心里有自己的教训，当你靠近时，他浑身发抖。[pg]");
         outputText("[say: 你——]魔王开口问道，抬起头看着你。你一巴掌扇在他脸上，打断了他未说完的问题。[pg]");
         menu();
         addNextButton("强暴",howDareYouII);
         addNextButton("否",howDareYouLeave);
      }
      
      public function gwynnSucksDicks() : void
      {
         clearOutput();
         var _loc1_:int = 0;
         if(get_player().cocks[_loc1_].get_cockType() == CockTypesEnum.HORSE)
         {
            get_images().showImage("wildhunt-princess-orally-horse");
         }
         else if(get_player().cocks[_loc1_].get_cockType() == CockTypesEnum.WOLF || get_player().cocks[_loc1_].get_cockType() == CockTypesEnum.DOG || get_player().cocks[_loc1_].get_cockType() == CockTypesEnum.FOX)
         {
            get_images().showImage("wildhunt-princess-orally-canine");
         }
         else if(get_player().cocks[_loc1_].get_cockType() == CockTypesEnum.DRAGON)
         {
            get_images().showImage("wildhunt-princess-orally-dragon");
         }
         else if(get_player().lowerBody.type == 21)
         {
            get_images().showImage("wildhunt-princess-orally-deer");
         }
         else if(get_player().lowerBody.type == 1)
         {
            get_images().showImage("wildhunt-princess-orally-bovine");
         }
         else
         {
            get_images().showImage("wildhunt-princess-orally");
         }
         outputText("[say: 是的，当然，主[lord]！]格温高兴地嘟囔着，跪了下来。一瞬间，你的[cock]就进入了她湿润的嘴里。她在森林里的时间锻炼了她的技巧，她含着你的[cock]呻吟，湿漉漉地吸吮着。[pg]");
         outputText("她纤细的舌头摩擦着你肉棒的下侧，随着她头部的上下摆动按摩着它。她的食指和拇指在你阴茎的根部形成一个纤细的O形，与她头部的摆动反向抽插，在她哼唱时给你持续的刺激。[pg]");
         outputText("她一边工作一边哼唱，听起来像是世界上最快乐的小荡妇。她熟练地服侍着你的肉棒，用她湿润饥渴的嘴抚摸和抽插着你的肉棒，随着她吸吮的声音越来越大、越来越急切，你感到自己呼吸沉重。[pg]");
         outputText("她欢快声音的震动和嘴唇包裹你肉棒的压力很快将你推向了边缘，伴随着一阵放松的颤抖，你射在了她的嘴里。她把第一股精液咽下喉咙，然后发出一声满足的喘息，把嘴从你的阴茎上移开，让下一股精液射在她的脸上。[pg]");
         outputText("[say: 哦哦哦哦……]她呻吟着，在喜悦中颤抖，她的舌头舔舐着滴落的精液，她的手指小心翼翼地从脸颊上擦去浓稠的精液，然后放进嘴里。你注意到，当她吸吮着你溢出的精液时，她把两根纤细的手指插进了她可爱、翘挺的屁股里。[pg]");
         outputText("你满意地拍了拍她的头，揉乱了她粉红色的短发，让她开心地微笑着。[pg]");
         outputText("[say: 谢谢您，主[lord]！]当你走开时，她喊道。[pg]");
         dynStats(DynStat.Lib(2),DynStat.Lust(0,DynStatOp.Eq));
         get_player().orgasm("Dick");
         menu();
         doNext(get_camp().returnToCampUseOneHour);
      }
      
      public function gwynnNomsDaCunts() : void
      {
         clearOutput();
         if(get_player().vaginas[0].vaginalLooseness == 5 && get_player().tail.type == 14)
         {
            get_images().showImage("wildhunt-princess-lickgina-dragon");
         }
         else if(get_player().vaginas[0].type == 1)
         {
            get_images().showImage("wildhunt-princess-lickgina-equine");
         }
         else
         {
            get_images().showImage("wildhunt-princess-lickgina");
         }
         outputText("[say: 是的，夫人，]她舔着嘴唇说。她指着附近的一个树桩，示意你坐在柔软的苔藓上。当你坐下时，她毫不犹豫地把她粉红色的" + (get_noFur() ? "嘴唇" : "口鼻") + "凑到你的小穴上。[pg]");
         outputText("她的舌头急切地探入你的肉缝，沿着阴户上下舔舐。每次她的" + (get_noFur() ? "脸" : "嘴筒") + "抬起时，她" + (get_noFur() ? "" : "糖果粉色的") + "鼻子就会蹭到你的阴蒂，她发出咕噜声，闭起眼睛，用鼻子爱抚着那里。她缓缓地舔着你的缝隙，逐渐加快速度。[pg]");
         outputText("你幸福地叹了口气，用双臂支撑着身体向后仰。格温公主大声地吸吮着你的阴阜，舌头移动得越来越快。你喘息着，快感在全身蔓延，她把舌头从你的小穴里抽出来，用嘴唇包裹住你的阴蒂。[pg]");
         outputText("当她吸吮你的阴蒂时，两根修长的手指滑入你的小穴。她的舌头在你的阴蒂上轻弹按摩，手指在你湿润的阴道里抽插。她哼唱着，让嘴唇的震动传导并萦绕在你的阴蒂周围。就在你颤抖着，处于高潮边缘时，她轻轻地用牙齿咬住你的阴蒂，哼唱着，在敏感的肉核上震动。你大叫一声，淫液喷涌而出，顺着她的下巴和胸膛流下。她继续舔舐，在第一次高潮之后又引发了另一次颤抖的高潮。[pg]");
         outputText("你瘫倒在树桩上，浑身颤抖。你低头看去");
         if(get_player().hasBreasts())
         {
            outputText("在你的双乳之间");
         }
         outputText("看到她微笑着，优雅地舔干净她修长的手指。当她开始舔舐你的小穴，有条不紊地清理你时，你打了个寒颤。");
         outputText("当你终于能再次动弹时，公主顺从地跪在你身边。她闭上眼睛，微笑着，你拍了拍她的头，揉乱了她粉红色的头发。当你站起来时，她起身帮你穿好衣服，在你离开森林时给了你一个飞吻。[pg]");
         dynStats(DynStat.Sens(-2),DynStat.Lib(2),DynStat.Lust(0));
         get_player().orgasm("Vaginal");
         menu();
         doNext(get_camp().returnToCampUseOneHour);
      }
      
      public function gwynnMurder() : void
      {
         clearOutput();
         outputText("你受够了魔王和她那粉嫩公主的新形态，你断定这个性欲过剩的受虐狂还是死了比较好。格温公主担忧地看着你叹气并揉着太阳穴。[say: 主……主[lord]？我渴望尽我所能取悦您！][pg]");
         outputText("你告诉格温，她现在能做的最好的事就是走过来为你跪下。不出所料，她高兴地答应了。你趁机紧紧抓住她的头和下巴，用力一扭。她的身体在震惊中抽搐了一下，然后就软绵绵地倒下了。[pg]");
         outputText("你的生活中少了一个变态的婊子男孩。");
         FlagDict_Impl_.arrayWriteInt(KFLAGS.flags,1067,1);
         menu();
         doNext(get_camp().returnToCampUseOneHour);
      }
      
      public function gwynnGibsGifts() : void
      {
         clearOutput();
         get_images().showImage("item-lube");
         outputText("[say: 你有什么礼物要给你的主人吗？]你漫不经心地问。[pg]");
         outputText("格温公主拍着手，一只脚跳着，然后换另一只脚。[say: 是的，我有，我的[lord]！是的，我有！]她停止跳跃，在钱包里翻找，拿出一个粉红色的小瓶子。[pg]");
         outputText("[say: 这是我的润滑油！]她微笑着说。[say: 嗯，我把它当润滑油用。但你也可以喝它来帮助控制自己，当你不想被欲望冲昏头脑时，]她喋喋不休地说。她欢快的声音和新的、更加活泼的态度让你对这种说法感到不确定。你看了她一眼，她睁大眼睛对你眨了眨眼。[say: 很好吃的，]她点着头向你保证。[pg]");
         outputText("她迈着小碎步走到你面前，把瓶子放在你手里，并在你的脸颊上亲了一下。[say: 我身上只有一个，但如果我的[lord]给我一点时间，我可以做更多，]她发出咕噜声，温柔地吻着你的嘴唇，轻轻咬着你的下唇，同时将她平坦的胸部和肉棒紧贴着你摩擦。[pg]");
         outputText("[say: 我马上就开始做！]她突然说道。她从你身边退开，认真地点了点头，然后蹦蹦跳跳地跑进了树林。[pg]");
         outputText("还没等你阻止她，她就不见了，你把小瓶子装进口袋留着以后用。[pg]");
         if(Utils.rand(4) > 0)
         {
            get_inventory().takeItem(get_consumables().PRNPKR,get_camp().returnToCampUseOneHour);
         }
         else
         {
            get_inventory().takeItem(get_consumables().PRNPKR,goldenRindBonus);
         }
      }
      
      public function gwynnGetsDickmilked() : void
      {
         clearOutput();
         outputText("[say: 我的[lord]，您确定吗？]她歪着头说道。[pg]");
         outputText("你向她保证这就是你想要的，并命令她仰卧在柔软长满青苔的地上。她的一只手臂搭在头上，另一只手臂交叉在胸前，咬着嘴唇，紧张地抬头看着你。[pg]");
         outputText("她的肉棒已经硬了，[if (metric) {三十厘米|一英尺}]长，呈现出粉白相间的斑驳色彩，就像黎明时的云彩。你跪在她身边，慢慢地抓住它，你的手指顺着她三层包皮环找到了自然的握处。[pg]");
         outputText("[say: 主人，我的包里有润滑油……如果您想用的话，]她害羞地说，把手伸进钱包，递给你一个小粉红色的瓶子。你意识到这个钱包曾经是她的鞍袋之一。当你拔开瓶塞，把大量的润滑油倒在她那根巨大的、平头的马形肉棒上时，你漫不经心地想，她以前作为魔王时是否也随身携带润滑油。[pg]");
         outputText("你开始抚摸她粗壮的肉棒，感觉它在你的手指下跳动。你粗暴地捏住它，格温公主咬着下唇，发出一声尖叫。她不知道手该放在哪里，只好用手穿过自己的头发，半眯着眼睛看着树冠。她长长的睫毛闪动着，浅浅地喘息着。[pg]");
         outputText("你抽插得越来越快，直到她呼吸急促，身体在射精的边缘颤抖。你立刻产生了一个邪恶的想法，用空着的手拉起她的尾巴，把她的屁股抬到半空中。她痛得尖叫起来，但你还没完。你把她的整个下半身卷起来，把她沉重的肉棒对准她的脸。[pg]");
         get_images().showImage("wildhunt-princess-milking");
         outputText("[say: 哦，不——不……]她喘息着，膝盖现在放在头的两侧。[pg]");
         outputText("[say: 哦，是的，]你邪恶地哄着，把这只轻盈母鹿的肉棒塞进她自己的嘴里。她发出含糊不清的抗议，然后你又猛拉了一下她毛茸茸的尾巴，引出了她的高潮……[pg]");
         outputText("她的肉棒喷射进自己的嘴里，立刻把她的脸颊撑得鼓鼓的。她翻着白眼，嘴里含着肉棒发出咕噜声。略带粉红色、散发着覆盆子香味的精液从她撅起的嘴唇中溢出，她咳嗽着，差点被自己的精液呛到。[pg]");
         outputText("你松开她的尾巴，让它砰的一声掉在地上，她的" + (get_noFur() ? "脚趾" : "蹄子") + "在泥土里刨出细小的沟壑，她的肉棒在平坦的胸前划出一条浓稠精液的痕迹。她呻吟着，粉红色的精液从嘴里流出来。你看着她，既觉得好笑又感到惊讶，因为她恢复理智后的第一个动作就是开始舀起自己的精液，并把它从手指上舔掉。[pg]");
         outputText("你满意地站起来，留下这只荡妇母鹿自己清理。[pg]");
         dynStats(DynStat.Lust(20),DynStat.Lib(2));
         menu();
         doNext(get_camp().returnToCampUseOneHour);
      }
      
      public function gwynnGetsButtfuxed() : void
      {
         clearOutput();
         var _loc1_:int = 0;
         outputText("[say: 马上，主[lord]！]她兴奋地拍着手说。她在空中跳跃，然后低低地跳到地上，从钱包里拿出一个小瓶子，在你的肉棒上倒了大量的覆盆子香味的润滑油。她把它涂抹开来，她纤细的手指按摩着你的肉棒，直到它完全勃起，然后她跳来跳去。[pg]");
         outputText("[say: 格温公主总是准备就绪！]她开心地叽叽喳喳地说。[pg]");
         outputText("她把肩膀伏在地上，把白色的臀部翘在空中，她粉红色的簇状尾巴兴奋地抽动着。[say: 您的公主为您准备好了，主[lord]！][pg]");
         outputText("你咧嘴一笑，抓住她的屁股，把你滑溜溜的肉棒推入她粉红色的花蕾。她比以前松多了，你很容易就滑了进去。当你沉入其中时，她发出咕噜声，[if (metric) {一厘米接一厘米|一英寸接一英寸}]，你的手紧紧抓住她柔软的小屁股。看来她和森林里的怪物待在一起的时间把她撑大了不少。你只希望她不会太松。[pg]");
         if(get_player().cocks[_loc1_].get_cockType() == CockTypesEnum.TENTACLE)
         {
            get_images().showImage("wildhunt-princess-anally-tentacle");
         }
         else if(get_player().cocks[_loc1_].get_cockType() == CockTypesEnum.LIZARD)
         {
            get_images().showImage("wildhunt-princess-anally-lizard");
         }
         else if(get_player().cocks[_loc1_].get_cockType() == CockTypesEnum.DRAGON)
         {
            get_images().showImage("wildhunt-princess-anally-dragon");
         }
         else if(get_player().tail.type == 24)
         {
            get_images().showImage("wildhunt-princess-anally-cervine");
         }
         else if(get_player().cocks[_loc1_].get_cockType() == CockTypesEnum.HORSE)
         {
            get_images().showImage("wildhunt-princess-anally-horse");
         }
         else if(get_player().cocks[_loc1_].get_cockType() == CockTypesEnum.HUMAN)
         {
            get_images().showImage("wildhunt-princess-anally-human");
         }
         else if(get_player().cocks[_loc1_].get_cockType() == CockTypesEnum.RHINO)
         {
            get_images().showImage("wildhunt-princess-anally-rhino");
         }
         else if(get_player().cocks[_loc1_].get_cockType() == CockTypesEnum.CAT)
         {
            get_images().showImage("wildhunt-princess-anally-feline");
         }
         else if(get_player().cocks[_loc1_].get_cockType() == CockTypesEnum.DOG)
         {
            get_images().showImage("wildhunt-princess-anally-canine");
         }
         else if(get_player().cocks[_loc1_].get_cockType() == CockTypesEnum.WOLF)
         {
            if(get_player().hasVagina())
            {
               get_images().showImage("wildhunt-princess-anally-wolf-herm");
            }
            else
            {
               get_images().showImage("wildhunt-princess-anally-wolf-male");
            }
         }
         else
         {
            get_images().showImage("wildhunt-princess-anally");
         }
         outputText("[say: 哦，主人，是的！操我可爱的小穴！]当你把自己埋在她体内时，她呻吟着。她的小穴抽动并收紧，你意识到你没必要担心。当你开始在她体内抽插时，她的小穴开始越来越紧地挤压你的肉棒。当你深深地插入她体内并拔出时，她的屁股榨取着你的阴茎。[pg]");
         outputText("她呻吟着，发出咕噜声，翻着白眼，吐出舌头，任由你摆布。当你终于射精时，她粉白相间的肉棒也射出了她自己的精液，奇怪的是，精液带着覆盆子的香味，洒在森林的地面上。她的小穴并没有停止挤压你，继续榨取你，直到你完全精疲力竭。[pg]");
         outputText("你从她体内抽出，她坐了起来，咯咯地笑着，跪着转过身来吸吮你的肉棒，把你清理干净。就像你第一次转化她时一样，她把你完全清理干净，然后帮你穿好衣服，当你亲吻她的脸颊告别时，她开心地咯咯笑着。[pg]");
         dynStats(DynStat.Sens(-2),DynStat.Lust(0,DynStatOp.Eq));
         get_player().orgasm("Dick");
         menu();
         doNext(get_camp().returnToCampUseOneHour);
      }
      
      public function goldenRindBonus() : void
      {
         clearOutput();
         get_images().showImage("wildhunt-princess");
         outputText("[say: 哦，这也是我酿造“酸爽”时剩下的，]她说着，从你身后的灌木丛中跳了出来。你惊讶地叫了一声。她刚才还在你面前消失在森林里。她怎么移动得这么快？[say: 给你！]她尖声说道，把一个小东西放在你手里，然后又消失在树林里。如果她能在树林里移动得如此迅速和安静，那么她成为森林捕食者的猎物很可能完全是自愿的。[pg]");
         doNext(takeGoldenRing);
      }
      
      public function get_changes() : int
      {
         return get_mutations().changes;
      }
      
      public function get_changeLimit() : int
      {
         return get_mutations().changeLimit;
      }
      
      public function firstWildHuntEncounter() : void
      {
         var waited1:Boolean;
         var _g1:ErlKingScene;
         var waited:Boolean;
         var _g:ErlKingScene;
         clearOutput();
         get_images().showImage("wildhunt-encounter");
         outputText("当你在高大古老的树木间探索时，你注意到浓雾开始从树木间涌出，漫过长满青苔的地面。当雾气涌出并流过你的[feet]时，你注意到周围的森林变得明显更暗、更冷了。[pg]");
         outputText("一股不寻常的恐惧感顺着你的脊背蔓延开来，就在这时，远处传来了狩猎号角的声音。你倒吸一口凉气，呼出的气息化作一团细密的白雾。就在号角的余音渐渐消散时，一阵犬吠声划破了");
         if(get_game().time.hours >= 0 && get_game().time.hours <= 10)
         {
            outputText("寒冷的清晨");
         }
         else if(get_game().time.hours >= 11 && get_game().time.hours <= 13)
         {
            outputText("异常寒冷的白天");
         }
         else if(get_game().time.hours >= 14 && get_game().time.hours <= 17)
         {
            outputText("凛冽的下午");
         }
         else if(get_game().time.hours >= 18 && get_game().time.hours <= 24)
         {
            outputText("冰冷的夜晚");
         }
         outputText("的空气。听到森林中传来的阵阵马蹄声，你的眼皮跳动，双耳嗡嗡作响。[pg]");
         outputText("号角、猎犬和马蹄交织成邪恶的合唱，震动着你周围的树林，雾气升腾至齐肩高。你的心怦怦直跳——你不确定自己[i:为什么]会感到害怕，只知道你[i:确实]在害怕。黑暗中有什么东西，正冲着你来！你是逃跑，还是坚守阵地？[pg]");
         menu();
         _g = this;
         waited = true;
         addButton(0,"等待",function():void
         {
            _g.firstWildHuntChase(waited);
         });
         _g1 = this;
         waited1 = false;
         addButton(1,"逃跑",function():void
         {
            _g1.firstWildHuntChase(waited1);
         });
      }
      
      public function firstWildHuntChaseII(param1:Boolean = false) : void
      {
         clearOutput();
         outputText("但在猎犬行动之前，雾幕散开，一个骑在马背上的身影映入眼帘。猎犬们安静了下来，那个高大的身影拉下兜帽，注视着你。[pg]");
         outputText("他很高，足有[if (metric) {两米多|七英尺}]，头部两侧向上拱起的巨大金色鹿角让他显得更加威严。他" + (get_noFur() ? "大部分特征像人类，唯一的动物特征是他的鹿角和长长的、像鹿一样的耳朵，当他用和猎犬一样锐利的红眼睛注视着你时，耳朵随着你的心跳节奏抽动着。" : "显然不是人类，更像是一只直立的黑鹿，用和猎犬一样锐利的红眼睛注视着你。他那短而黑的皮毛在无风的环境中沙沙作响，耳朵随着你的心跳节奏抽动着。") + "[pg]");
         get_images().showImage("wildhunt-huntsman");
         outputText("他身体的大部分被华丽的衣物覆盖。一件深绿色的斗篷，装饰着复杂的金色图案，披在黑色皮革制成的狩猎装上。他的一只手臂握着坐骑的缰绳，另一只戴着厚重皮革狩猎手套的手则紧握着一根闪亮的黑色粗木手杖。他的双腿" + (get_noFur() ? "末端是纤细优雅的双脚" : "向下逐渐变细，变成了纤细优雅的蹄子") + "，当他下马时，无声地落在长满青苔的地面上。[pg]");
         outputText("[say:我是魔王，狂猎之主，]他用低沉空洞的声音说道。[say:而你……你是一个非常不寻常的[race]。我的猎犬能从你身上闻出来。]他指了指周围一动不动的猎犬。[pg]");
         outputText("他的目光上下打量着你的身体，尽管你努力克制，但在他的注视下还是忍不住打了个寒颤。[pg]");
         if(param1)
         {
            outputText("[say:你很勇敢，不是吗？面对狂猎还能坚守阵地？我赞赏你的胆识。我会很享受狩猎你的过程……][pg]");
         }
         else
         {
            outputText("[say:如果你希望将来能逃脱我的追捕，恐怕你得学会跑得更快些。我真希望你不会让我感到无聊。][pg]");
         }
         outputText("你还没来得及再说一句话，大雾就逼近了，只剩下魔王和他的猎犬眼中闪烁的红光。他们一个接一个地消失了，魔王是最后一个，只留你独自在黑暗、迷雾和寒冷中。[pg]");
         outputText("没过多久，风刮了起来，吹散了雾气，神秘的猎手没有留下任何痕迹，除了地上的一个小包裹。你急忙捡起它，无法摆脱那种被监视的怪异感觉。[pg]");
         get_player().changeFatigue(10);
         if(param1)
         {
            doNext(takeCaninePepper);
         }
         else
         {
            doNext(takeFoxBerry);
         }
      }
      
      public function firstWildHuntChase(param1:Boolean = false) : void
      {
         var waited1:Boolean;
         var _g:ErlKingScene;
         clearOutput();
         if(param1 == false)
         {
            outputText("你在树林中跌跌撞撞地前行，但无论转向哪个方向，迎面而来的都是刺骨的浓雾。很快，四面八方都传来了犬类的低吼声。你被包围了。");
         }
         else
         {
            outputText("猎犬的狂吠声充斥着空气，树林中回荡着远处如雷鸣般的马蹄声，第一只怪物冲破了浓雾。这只狗粗壮结实，看起来像是一只巨大的寻血猎犬，长满利齿的嘴巴大张着喘气。它红黑相间的舌头随着呼吸耷拉着，下巴升腾起阵阵热气。猎犬的皮毛是午夜般的漆黑，覆盖着它肌肉发达的身躯。它粗壮有力的腿末端长着黑色的利爪，在双腿之间，你瞥见了一根手臂粗的包皮和后面沉甸甸的囊袋。一条长长的尾巴在它身后高高翘起，缓慢而充满威胁地摆动着");
            outputText("。");
            outputText("[pg]它那凶恶的红眼睛从黑色的眉毛下死死盯着你。猎犬深吸了一口气，鼻孔扩张，然后仰起头嚎叫起来。震耳欲聋的叫声立刻得到了回应，伴随着灌木丛被撞碎的声音，另一只野兽从矮树丛中跃出。当它从你身后跃出，与它的同伴一左一右包抄你时，雾气被撕成了碎片");
            outputText("。");
            outputText("[pg]令你惊恐的是，你看到红光闪烁，它们光滑的肉棒滑了出来，空气中弥漫着沉重、急促的喘息声。");
            if(get_player().cor >= 40)
            {
               if(get_player().hasCock() && !get_player().hasVagina())
               {
                  outputText("看到它们如此急不可耐，你也不禁浑身僵硬。");
               }
               else if(get_player().hasVagina() && !get_player().hasCock())
               {
                  outputText("随着空气中弥漫着它们浓烈的麝香味，尽管你极力克制，你的小穴还是湿润了。");
               }
               else if(get_player().hasVagina() && get_player().hasCock())
               {
                  outputText("你感觉到你的肉棒抽动了一下");
                  if(int(get_player().cocks.length) > 1)
                  {
                     outputText("");
                  }
                  outputText("当你想象着那些犬类肉棒被派上用场时，你的小穴也随之颤抖起来。");
               }
               else
               {
                  outputText("你的屁眼也随之抽动，渴望被填满。");
               }
            }
         }
         menu();
         _g = this;
         waited1 = param1;
         addButton(0,"继续",function():void
         {
            _g.firstWildHuntChaseII(waited1);
         });
      }
      
      public function execEncounter() : void
      {
         if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,1066) == 0)
         {
            firstWildHuntEncounter();
         }
         else if(!get_player().hasKeyItem("Golden Antlers"))
         {
            repeatWildHuntEncounter();
         }
         else if(get_player().hasKeyItem("Golden Antlers"))
         {
            encounterPrincessGwynn();
         }
         var _loc1_:IMap = KFLAGS.flags;
         FlagDict_Impl_.arrayWriteInt(_loc1_,1066,FlagDict_Impl_.arrayReadInt(_loc1_,1066) + 1);
      }
      
      public function encounterPrincessGwynn() : void
      {
         clearOutput();
         get_images().showImage("wildhunt-princess");
         outputText("当你在幽深森林中漫步时，你听到灌木丛中传来沙沙声。你转过头，看到树木间闪过一抹粉红色。一个苗条优雅的身影从树后走出来，穿着深绿色的斗篷，背着一个小皮包。你花了一点时间才认出这位公主，曾经的魔王。她那" + (get_noFur() ? "可爱、女性化" : "像鹿一样") + "的脸庞和水汪汪的大眼睛怯生生地看着你。[pg]");
         outputText("[say: 大、大[lord]？] 她轻声问道。当她向你走近时，她柔软的手臂推开低矮的树枝和树木。她胆小且神经质，与她曾经作为可怕而强大的猎人时截然不同。片刻之后，你明白了原因。[pg]");
         switch(Utils.rand(6))
         {
            case 0:
               outputText("公主粉红色的" + (get_noFur() ? "头发" : "皮毛") + "上涂满了树液和汁液的污迹，身上布满了愤怒的红色蜇伤。很明显，她成了在森林中游荡的触手怪物的猎物。[pg]");
               break;
            case 1:
               if((FlagDict_Impl_.arrayReadInt(KFLAGS.flags,2715) & get_game().forest.akbalScene.AKBAL_QUEST_DONE) == 0)
               {
                  outputText("当低矮的树枝划过她的屁股时，公主痛苦地皱起了眉头，你可以看到她挺翘的屁股上纵横交错着愤怒的红色抓痕。看来她惹上了幽深森林的猫科领主阿克巴尔。[pg]");
               }
               else
               {
                  outputText("公主咳嗽着，一丝精液顺着她的嘴唇和下巴流下。你看到她的喉咙和下巴上有瘀伤，身上布满了细小的抓痕。看起来她被一群游荡的小恶魔抓住了。[pg]");
               }
               break;
            case 2:
               outputText("公主咳嗽着，一丝精液顺着她的嘴唇和下巴流下。你看到她的喉咙和下巴上有瘀伤，身上布满了细小的抓痕。看起来她被一群游荡的小恶魔抓住了。[pg]");
               break;
            case 3:
               outputText("公主粉色的" + (get_noFur() ? "头发" : "皮毛") + "上沾染着五颜六色的污渍，她微微摇晃着，显然有些头晕目眩。地精的袭击能让人在很长一段时间内都保持这种状态。[pg]");
               break;
            case 4:
               outputText("公主的脖子和手腕上带着瘀伤，仿佛有人曾粗暴地反复捆绑过她。[pg]");
               break;
            case 5:
               outputText("当她转身从两棵树之间挤过去时，你看到公主的背上布满了大大小小的爪痕。看起来，自从她变形之后，她的猎犬们就背叛了她。[pg]");
         }
         outputText("尽管如此，她看到你还是显得非常高兴。自从你上次见到她以来，她变得更加女性化了。她的头发被梳成玫瑰色的精灵短发，脖颈处扎着两个俏皮的双马尾。她的胸部依然平坦，但肌肉量减少了，使她显得高挑、纤细且中性。她的黑色皮衣不见了，她的" + (get_noFur() ? "皮肤是光滑的乳白色" : "皮毛主要是棉花糖般的粉色，胸部、腹部和大腿则是白色的") + "。她的肉棒随着每一次小心翼翼的动作而摇摆，呈现出斑驳的白粉相间" + (get_noFur() ? "" : "，与她的皮毛相配") + "，上面有三个包皮环。她走上前，她那修长的" + (get_noFur() ? "" : "鹿") + "腿让她在小心翼翼地向你碎步走来时，臀部不经意地摇曳着。[pg]");
         outputText("[say: 主人！能再次见到您真是太好了！]她娇嗔着，双臂搂住你的肩膀，用粉嫩嘟起的嘴唇亲吻你。[say: 作为公主，我玩得太</i>开心<i>了！真不敢相信我现在有多快乐！</i>太<i>感谢您了！]她的声音听起来有些含糊不清，仿佛在幽深森林里到处发情已经影响了她的心智。[pg]");
         if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,1065) == 0)
         {
            outputText("[say: 我很高兴您帮我摆脱了那根讨厌的旧手杖，]她说着，向森林的方向漫不经心地挥舞着一条" + (get_noFur() ? "苍白" : "长满粉色毛发") + "的手臂。[say: 它也许能抵御腐化，但却给了我一种[i: 奇怪]的乐趣，]她滔滔不绝地说着。[say: 我再也不去打猎了——绝不，长官！][pg]");
            outputText("她用白皙的手指抚摸着自己的胸口，端庄地发出呼噜声，[say: 您现在可以叫我格温了。但我依然是您的公主！][pg]");
         }
         var _loc1_:IMap = KFLAGS.flags;
         FlagDict_Impl_.arrayWriteInt(_loc1_,1065,FlagDict_Impl_.arrayReadInt(_loc1_,1065) + 1);
         outputText("[say: 我该怎么报答您呢？]格温可爱地叽叽喳喳说着，亲吻了你的脸颊。[saystart]");
         if(get_player().hasCock())
         {
            outputText("我可以吸您的肉棒，或者您可以操我的公主小穴，或者");
         }
         else if(get_player().hasVagina())
         {
            outputText("我可以吃您的小穴，或者");
         }
         outputText("我可以和您分享一些我的特殊药水，[sayend]她" + (!get_player().isGenderless() ? "用纤细的手指掰着数着选项，" : "") + "说道。[pg]");
         outputText("你在脑海中过了一遍这些选项，甚至短暂地考虑过要不要按自己的方式“弄点她的药水”。[pg]");
         menu();
         addButtonDisabled(0,"给我口");
         addButtonDisabled(1,"操屁眼");
         addButtonDisabled(2,"舔我");
         if(get_player().hasCock())
         {
            addButton(0,"给我口",gwynnSucksDicks);
            addButton(1,"操屁眼",gwynnGetsButtfuxed);
         }
         if(get_player().hasVagina())
         {
            addButton(2,"舔我",gwynnNomsDaCunts);
         }
         addButton(3,"榨精",gwynnGetsDickmilked);
         addButton(4,"礼物",gwynnGibsGifts);
         addButton(10,"杀死",gwynnMurder);
         setExitButton();
      }
      
      public function encounterName() : String
      {
         return "erlking";
      }
      
      public function encounterChance() : Number
      {
         if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,1067) == 0)
         {
            return 2;
         }
         return 0;
      }
   }
}

