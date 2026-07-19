package classes.scenes.places.telAdre
{
   import classes.BreastStore;
   import classes.CoC;
   import classes.DynStat;
   import classes.Player;
   import classes.StatusEffects;
   import classes._FlagDict.FlagDict_Impl_;
   import classes.globalFlags.KFLAGS;
   import classes.internals.Utils;
   import classes.scenes.Camp;
   import classes.scenes.npcs.UrtaScene;
   import classes.scenes.places.TelAdre;
   import flash.Boot;
   import haxe.IMap;
   
   public class KatherineThreesome extends TelAdreAbstractContent
   {
      
      public function KatherineThreesome()
      {
         if(Boot.skip_constructor)
         {
            return;
         }
         super();
      }
      
      public function watchNoIntro(param1:Boolean) : void
      {
         clearOutput();
         watchMainBody(param1);
      }
      
      public function watchMainBody(param1:Boolean) : void
      {
         outputText("你们三个很快就占用了后面的一间屋子。乌尔塔" + (param1 ? "有点站不稳" : "相当饥渴") + "，所以她坐在角落里的一把空椅子上，扯下了自己的衣服。你亲吻了凯丝，专心致志地脱她的衣服，给乌尔塔表演了一场好戏，你" + get_katherine().clothesChoice("先脱下她的衬衫，然后滑下她的裙子","从她轻盈的身躯上剥下那件透明的紧身衣","解开她的连衣裙，从她性感的身体上滑落","解开她的长袍，从她的肩膀上拉下来","把抹胸从她头上拉下来，然后" + get_katherine().clothesLowerChoice("剥下她紧身的短裤","滑下她的裙子","","",""),"解开她紧身衬衫的扣子，滑下她的裙子，最后摘下她头上那顶可爱的白帽子") + "。乌尔塔的兴趣显而易见，她喘着粗气，马鸡巴也在跳动。[pg]");
         outputText("凯丝向乌尔塔摆了个姿势，问道：[say: 喜欢你看到的吗？][pg]");
         outputText("乌尔塔抚摸着她的肉棒，将一些先列腺液涂抹在柱身上，说道：[say: 过来看看就知道了！] 看起来乌尔塔有心情表演一番，于是你轻轻推了凯丝一把，让她走向那只狐狸。凯丝一进入手臂可及的范围，乌尔塔就抓住她，把凯瑟琳拉到了自己的腿上。[pg]");
         outputText("经过一场短暂且一边倒的扭打，乌尔塔将凯丝的手臂锁在身后。她把凯丝转过来面对你，然后把这只猫" + get_katherine().catGirl("娘","兽人") + "向后、向下按到她的腿上。乌尔塔的肉棒现在从凯丝的双腿间伸出，摩擦着");
         if(get_katherine().hasCock())
         {
            outputText("凯丝自己的" + get_katherine().cockMultiple("","下半截") + "肉棒的底部。[pg]");
         }
         else
         {
            outputText("凯丝滴着淫液的裂口。[pg]");
         }
         outputText("凯丝有些惊讶，但她很快恢复过来，向你喊道：[say: 请救救我，[mister]，这只疯狂的狐狸想对我图谋不轨。] 你决定“帮忙”，轻轻捏了捏凯丝的乳头。你笑着在另一张椅子上坐下，觉得这看起来会很有趣。[pg]");
         outputText("乌尔塔呻吟着，将凯丝抬高，让自己的龟头抵住凯丝的小穴。[say: 我们上一班的时候你就在求这个了，]她在凯丝耳边低吼。乌尔塔粗暴地再次将凯丝向后猛拉，这一次直接用她巨大的肉棒刺穿了凯丝。乌尔塔闭上眼睛，一边将凯丝的臀部抬起又放下，一边自言自语。[say: 总是对我甩着你那细长的黑尾巴，]她说，[say: 交文件的时候还给我那个露齿的大大微笑" + (FlagDict_Impl_.arrayReadInt(KFLAGS.flags,1232) > 20 ? "，然后说“酒吧见”，还有那个可爱的小挥手告别" : "") + "。承认吧——你一直渴望着一根又粗又大的肉棒。][pg]");
         outputText("凯丝只是咬着嘴唇，乌尔塔像打桩机一样的抽插迫使她的小穴张得越来越大。终于，她脸上的痛苦表情缓和了下来，她对你咧嘴一笑，然后说道，[say: 也许吧。][pg]");
         outputText("[say: 不是也许！]乌尔塔咆哮道。[say: 你是守卫队里最性感的小猫咪，你整天都在挑逗我。别给我说也许。][pg]");
         outputText("凯丝开始反击，她把乌尔塔的手从自己的臀部拉开。凭借猫一般的柔韧性，她设法转过身来面对乌尔塔，同时仍然在她的肉棒上研磨。[say: 好吧，]她戏谑地说，[say: 也许是非常想。]她拉起乌尔塔的手，将它们放在" + (get_katherine().get_breasts().get_cupSize() > 5 ? "她" : "") + get_katherine().get_breasts().adj() + "乳房" + (get_katherine().get_breasts().get_cupSize() > 5 ? "的两侧" : "") + "。[pg]");
         outputText("乌尔塔看起来快要射了。她喘着粗气说：[say: 那让你兴奋吗？把你的队长弄得欲火焚身？][pg]");
         outputText("凯丝把手伸到双腿之间，你意识到她正在用手指揉捏乌尔塔的睾丸。[say: 也许吧，]她再次回答，这激怒了乌尔塔，她咬了凯丝的后颈。又深插了几下，乌尔塔的双手抓住了凯丝的肩膀，这样她就可以再次把凯丝的整个身体拉下来。她的头向后仰，撞到了墙上。与此同时，凯丝把一只手放在肚子上，当你看着它因为乌尔塔大量的精液而鼓起时，她发出了满足的呼噜声。[pg]");
         outputText("乌尔塔射完后，凯丝戳了戳乌尔塔说，[say: 你不打算帮我吗？你知道的，我还没高潮呢。][pg]");
         outputText("乌尔塔抬起头，冲着凯丝咧嘴一笑，用嘲弄的语气说道：[say: 也许吧。][pg]");
         if(get_katherine().hasCock())
         {
            outputText("凯丝看向你，揉了揉" + get_katherine().cockMultiple("她坚挺的肉棒","她其中一根坚挺的肉棒") + "，但你指出乌尔塔刚刚主动提出要帮忙。凯瑟琳不需要更多的鼓励。她站起身，在乌尔塔的腿上留下了一条精液汇成的河流。乌尔塔太累了，无力反抗，于是凯瑟琳把她抱起来，让她趴在椅子上。[pg]");
            outputText("乌尔塔抬头看着你，正好感觉到凯丝将她的" + get_katherine().cockType() + "肉棒" + get_katherine().cockMultiple("滑进她的小穴","滑进她的小穴和直肠") + "。[pg]");
         }
         else
         {
            outputText("凯丝看向你，用手指抚摸着自己的乳房，但你指出乌尔塔刚刚主动提出要帮忙。凯瑟琳不需要更多的鼓励。她站稳脚跟，开始扭动臀部，将阴蒂在乌尔塔依然坚挺的马屌上摩擦。[pg]");
            outputText("乌尔塔的头再次向前垂下，她揉了揉凯瑟琳鼓胀的肚子。[say: 别白费力气了，小猫咪，]她嘲弄地说。[pg]");
         }
         outputText("凯丝已经快要高潮了，但她试图放慢速度来忍住。她低语道：[saystart]你也想要的。我知道，因为每次我对你微笑或者扭屁股，你都会对我笑");
         if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,1232) > 20)
         {
            outputText("而且你的尾巴尖会微微摆动，你以为没人注意到。一旦你知道我会在酒吧，你就会匆匆忙忙地处理完所有的文书工作，因为你喜欢盯着我的身体看" + (FlagDict_Impl_.arrayReadInt(KFLAGS.flags,1233) == 0 ? "，而且你疯狂地希望[name]能在这里，这样我们就可以干个通宵" : ""));
         }
         outputText("。[sayend]");
         outputText("[pg]乌尔塔对你坏笑了一下，再次说道：[say: 也许吧。]凯丝不喜欢被以其人之道还治其人之身，所以她抓住");
         if(get_katherine().hasCock())
         {
            outputText("椅子用力推。当凯丝的" + get_katherine().cockMultiple("肉结强行挤进去","双重肉结强行挤进去") + "时，乌尔塔发出一声惊讶的[say: 啊！]。然后凯丝推着椅子，将" + get_katherine().cockMultiple("它","它们") + "猛地拔出来。没过多久，肉结的抽插就把凯丝推向了高潮，她最后一次狠狠地撞了进去。乌尔塔的身体从椅子上抬起，她的肚子因为凯丝泵入她" + (get_urta().pregnancy.get_isPregnant() ? "小穴" : "子宫") + get_katherine().cockMultiple("","和肠道") + "的沉重负荷而撑大。[pg]");
         }
         else
         {
            outputText("乌尔塔的蛋蛋，用她锋利的" + get_katherine().catGirl("指甲","爪子") + "轻轻抚摸着它们。[say: 你不明白，小狐狸——我还没完，所以你也还没完。让一个女孩欲求不满是不礼貌的。所以你想想那些我对着你扭屁股或者“不小心”让毛巾滑落的时候。你现在就在这里，所以没有借口，没有阳痿。我来这里就是为了被操的。][pg]");
            outputText("乌尔塔呻吟着，但你能看出凯丝的话和她紧缩的小穴起到了神奇的作用。乌尔塔用颤抖的双手向上伸去，摸索着凯丝的乳房，将这只被填满的小猫咪拉向自己。[pg]");
            outputText("[say: 这才像话！]凯丝叫道。[say: 现在让我为做个小妖精付出代价吧！][pg]");
            outputText("乌尔塔颤抖着，她的手移回凯丝的臀部。[say: 哦，操！你这之后肯定走不动路了。][pg]");
            outputText("[say: 保证，保证，]凯丝用梦幻般的声音说道。她捧着自己已经填满的肚子，让乌尔塔完成大部分的工作。然后凯瑟琳的双腿发软，完全任由乌尔塔摆布，狐狸像打桩机一样猛干她的小穴。你看着凯丝连续高潮了半打次，她的身体仅仅靠着她肚子里那根坚如磐石的旗杆支撑着。伴随着最后一次能量的爆发，乌尔塔狠狠地撞了进去，你看到她的蛋蛋收缩并向上拉起，将最后一滴精液都注入了凯丝塞满精液的肚子里。[pg]");
         }
         outputText("你" + (get_player().get_gender() == 0 ? "不高兴地揉了揉自己毫无特征的腹股沟，希望自己也能参与其中。然后你" : "") + "给了你疲惫的爱人们每人一个吻，告诉她们要互相照顾。这换来了乌尔塔内疚的眼神，她说道：[say: 下次我们可以做任何你想做的爱，[name]——或者也许你想留下来尽情享受？][pg]");
         outputText("虽然你很想，但你必须再次检查传送门，所以你只是告诉她们你会接受这个提议，而且很可能很快就会。");
         get_katherine().orgasm();
         get_katherine().katherineAndUrtaHadSex(true);
         var _loc2_:IMap = KFLAGS.flags;
         FlagDict_Impl_.arrayWriteInt(_loc2_,12,FlagDict_Impl_.arrayReadInt(_loc2_,12) + 1);
         FlagDict_Impl_.arrayWriteInt(KFLAGS.flags,13,2 + Utils.rand(2));
         dynStats(DynStat.Lust(20 + get_player().lib / 20));
         if(get_game().time.hours >= 13)
         {
            FlagDict_Impl_.arrayWriteInt(KFLAGS.flags,1225,2);
         }
         doNext(get_camp().returnToCampUseOneHour);
      }
      
      public function watch(param1:Boolean) : void
      {
         clearOutput();
         outputText("当你走到乌尔塔的桌子旁时，她已经喝完了最后一口饮料。她站起身来，给了你们俩一个大大的拥抱。你感觉到她的马鸡巴在你身上摩擦，你看到凯丝在被乌尔塔拥抱后显得有些不自在。[pg]");
         watchMainBody(param1);
      }
      
      public function valaCommonStart() : void
      {
         clearOutput();
         outputText("你伸出双臂搂住她们俩，顺势摸了一把。凯丝发出了愉悦的呼噜声，瓦拉则满足地叹了口气。你告诉她们你有个主意，然后把她们带到了酒吧后面。[pg]");
         outputText("一锁上门，你就决定把注意力集中在瓦拉身上。捏她的乳头，深深地吻她，让她很快就进入了状态。看来她不仅是无聊，而且还很饥渴。[pg]");
         outputText("你转过身，心想" + (FlagDict_Impl_.arrayReadInt(KFLAGS.flags,1235) > 5 ? "凯丝应该已经准备好了。果然" : "还得说服凯丝配合你。然而") + "你发现她已经脱了一半衣服了。");
         if(get_katherine().hasCock())
         {
            outputText("她的阴茎" + get_katherine().cockMultiple("硬得","硬得") + "水平地挺立着。");
         }
         outputText("[pg]");
      }
      
      public function valaCommonPostSex(param1:Boolean) : void
      {
         if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,1237) == 0)
         {
            outputText("她回头看着凯丝说，[say: 哦——顺便说一句，我是瓦拉。][pg]");
            outputText("凯丝惊讶得张大了嘴巴，结结巴巴地说，[say: 嗨，我是凯丝，凯瑟琳。对不起，我通常不干这种事。][pg]");
            if(param1)
            {
               outputText("瓦拉咯咯地笑着，把凯丝的手放在她的肚子上，然后回答说，[say: 你是说像这样，连一个女孩的名字都不知道，就和她结扎，用你的精液填满她的肚子吗？][pg]");
               outputText("凯丝看起来尴尬极了，直到瓦拉伸手揉了揉凯丝肉结的根部" + get_katherine().cockMultiple("","s") + "。");
            }
            outputText("她给了凯丝一个吻，说，[say: 我也不干这种事。我们就把这当成我们的小秘密吧，好吗？]");
         }
         else
         {
            outputText("她依次吻了你和凯丝，" + (param1 ? "然后拍了拍她巨大的肚子说" : "并说") + "，[say: 这很有趣，我希望这不是一次性的。" + (param1 ? " 我喜欢这种被填满的感觉。" : "") + "]");
         }
         outputText("[pg]凯丝叹了口气，揉了揉瓦拉的" + (param1 ? "肚子" : "胸口") + "。她看起来放松极了，简直像半睡半醒一样。[say: 嗯——" + get_katherine().playerText() + (param1 ? "……我想我们还要在这里待上一会儿。也许" : "……也许") + "你该走了，去检查一下你的那个传送门。我们会处理好这里的烂摊子的。][pg]");
      }
      
      public function threeSixtyNine() : void
      {
         var _loc2_:Boolean = false;
         clearOutput();
         get_katherine().katherineSprite(true);
         if(get_katherine().isAt(4) || get_katherine().isAt(5))
         {
            outputText("你把这" + (get_katherine().hasCock() ? "急切的扶他" : "充满情欲的两人") + "拖进了一间里屋。乌尔塔锁上了门");
         }
         else
         {
            outputText("乌尔塔从背后抱住凯丝");
         }
         outputText("并开始动手脱掉凯丝的衣服，让她的每一寸肌肤都暴露在空气中。你则稍微表演了一下脱衣服的过程，凯丝和乌尔塔都很欣赏你的表演。[pg]");
         outputText("当你们三人都赤身裸体时，凯丝跪倒在地，将乌尔塔的肉棒含入嘴中。乌尔塔拍了拍她的头，开始挠凯丝的耳朵，这让凯丝开始用她粗糙的舌头挑逗龟头——如果乌尔塔的反应能说明什么的话。[pg]");
         outputText("乌尔塔顺势躺在地上，随着她的下降，凯丝将她的肉棒含得越来越深。你走近并问乌尔塔是否打算“感谢”凯丝。她给了你一个狼一般的笑容，扭转身子直到她躺在相反的方向。她抓住");
         if(get_katherine().hasCock())
         {
            outputText(get_katherine().cockMultiple("凯瑟琳的肉棒","凯瑟琳下面那根肉棒") + "并用舌头在龟头上打转。[pg]");
         }
         else
         {
            outputText("凯瑟琳的臀部，将舌头埋入那湿润的小穴中。[pg]");
         }
         outputText("凯丝呻吟着，试图向前挺动臀部，但乌尔塔拉住了她。" + (get_katherine().hasCock() ? "当她继续把玩凯丝的肉棒时，乌尔塔用另一只手将几根手指滑入凯丝的小穴。不甘示弱的凯丝也回敬了她" : "当她的舌头探索凯丝爱之隧道的深处时，乌尔塔用鼻子摩擦凯丝的阴蒂。不甘示弱的凯丝将手指插入乌尔塔湿滑的小穴") + "。没过多久，她们就像在战斗一样——每个人都试图迫使对方失去控制" + (get_katherine().hasCock() ? "；试图将她们的肉棒深深推入对方的喉咙" : "") + "。[pg]");
         outputText("当然，如果你不提供一些“鼓励”，那就太失礼了。你走到凯瑟琳身后，向乌尔塔示意，让她知道你要做什么。她咧嘴一笑");
         if(get_katherine().hasCock())
         {
            outputText(get_katherine().cockMultiple("并吸吮凯丝的肉棒","，换到凯丝的另一根肉棒并吸吮它"));
         }
         else
         {
            outputText("并用拇指夹住凯丝的阴蒂，迫使它骄傲地挺立，这样她就可以吸吮它");
         }
         outputText("就像吃棒棒糖一样。趁凯丝分心时，你从后面过来，将你的肉棒强行插入她的大腿之间。乌尔塔" + (get_katherine().hasCock() ? "用手引导" : "在最后一秒抽出舌头，引导") + "你进入凯丝的小穴，你感觉到这只猫" + get_katherine().catGirl("娘","人") + "僵硬了一下。[pg]");
         outputText("你开始享受填满凯丝的感觉，同时看着她吸吮乌尔塔的肉棒。凯丝对乌尔塔肉棒根部的握力开始减弱，随着每一次挺动，她的嘴唇越来越往下，直到她能够舔到乌尔塔的睾丸。[pg]");
         outputText("越过凯丝的肩膀，你可以看到乌尔塔已经仰起头呻吟起来。考虑到凯瑟琳为她做的事情，这有点不体贴。你拔出来，换到另一边，在乌尔塔意识到发生了什么之前，你将肉棒推入她的大腿之间，深深地插入她的体内。乌尔塔发出一声小小的[say:啊！]，然后继续舔凯丝的" + (get_katherine().hasCock() ? "龟头" : "小穴") + "。[pg]");
         outputText("随着你的肉棒在乌尔塔体内，你可以看着并感觉到欲望克服了她。你的肉棒和凯丝令人愉悦的舌头结合在一起，很快就将乌尔塔推向了高潮，她");
         if(get_katherine().hasCock())
         {
            outputText(get_katherine().cockMultiple("在一个流畅的动作中吸下了凯丝的整根肉棒","出人意料地吞下了凯丝的两根肉棒") + "。[pg]");
         }
         else
         {
            outputText("开始像渴死了一样吸吮和舔舐凯丝的小穴。[pg]");
         }
         outputText("在所有的刺激下，乌尔塔是第一个高潮的，她的肉棒在凯丝的喉咙里爆发。凯丝将它深深地含在里面，你看到她的肚子因为乌尔塔的精液而肿胀起来。");
         if(get_katherine().pregSize() > 0)
         {
            outputText("甚至她的怀孕也被乌尔塔泵出的精液量所掩盖。");
         }
         outputText("[pg]被填满的感觉一定足以将她推向高潮，因为凯丝");
         if(get_katherine().hasCock())
         {
            outputText("向前挺进，几乎把她的肉结" + get_katherine().cockMultiple("顶过了乌尔塔的嘴唇。它","顶过了乌尔塔的嘴唇。有两根肉棒承载着负荷，它") + "没过多久，乌尔塔的肚子也开始变圆了。这两个扶他开始看起来像一个阴阳符号，但是");
         }
         else
         {
            outputText("双腿紧紧锁住乌尔塔的头。凯丝的脸上浮现出空洞而愉悦的神情，她用舌头舔舐着乌尔塔的睾丸，诱哄出最后一滴精液。现在");
         }
         outputText("在看到那样的表演后，你迫不及待地想要贡献自己的一份力量。[pg]");
         var _loc1_:Boolean = FlagDict_Impl_.arrayReadInt(KFLAGS.flags,723) == 1 && !get_urta().pregnancy.get_isPregnant();
         if(get_katherine().get_fertile() && get_katherine().pregSize() == 0)
         {
            if(_loc1_)
            {
               _loc2_ = Utils.rand(2) == 0;
            }
            else
            {
               _loc2_ = true;
            }
         }
         else if(_loc1_)
         {
            _loc2_ = false;
         }
         else
         {
            _loc2_ = Utils.rand(2) == 0;
         }
         if(_loc2_)
         {
            outputText("你拔出来，换回凯丝。她如此放松，如此湿润，你的肉棒轻松地滑回了里面。你只需要抽插几下，就能感觉到她的通道在收缩，凯瑟琳开始了第二次高潮。");
         }
         outputText("你将自己深深埋入，把所有的精华都给了" + (_loc2_ ? "凯丝" : "乌尔塔") + "，用你的种子填满了她。");
         if(get_player().cumQ() < 1500)
         {
            if(!_loc2_ && !get_katherine().hasCock())
            {
               outputText("乌尔塔平坦的肚子肿胀得和凯丝一样。你的女孩们看起来就像一个太极图，但你的精液射在了关键的地方。");
            }
            else
            {
               outputText("与" + (_loc2_ ? "乌尔塔" : "凯丝") + "注入她肚子里的量相比，这几乎微不足道，但你的精液射在了关键的地方。");
            }
         }
         else
         {
            outputText("你那强大的" + (get_player().balls > 0 ? "睾丸" : "前列腺") + "喷射出一股又一股滚烫的精液。");
         }
         if(_loc2_ || get_katherine().hasCock())
         {
            outputText("你感觉到了一点阻力——毕竟" + (_loc2_ ? "凯瑟琳" : "乌尔塔") + "的肚子已经没有多少膨胀的空间了。");
         }
         outputText("你大部分的精液最终都从" + (_loc2_ ? "凯丝" : "乌尔塔") + "的小穴里射了出来，在你、她和地板上覆盖了一大滩精液。");
         outputText("你轻轻拍了拍" + (_loc2_ ? "凯丝" : "乌尔塔") + "的肚子，她感激地呻吟了一声。[pg]");
         outputText("你拔出来，滚到一边。并不是你想这样，而是你还有事情要处理。" + (get_katherine().hasCock() ? "两个扶他" : "凯丝和乌尔塔") + "分开，筋疲力尽地躺在地板上。当你经过她们走向门口时，你注意到她们正牵着手。这其实是一个相当浪漫的场景。");
         if(!_loc2_)
         {
            get_urta().knockUpUrtaChance();
         }
         get_player().orgasm("Generic");
         get_katherine().orgasm();
         get_katherine().katherineAndUrtaHadSex(false);
         var _loc3_:IMap = KFLAGS.flags;
         FlagDict_Impl_.arrayWriteInt(_loc3_,12,FlagDict_Impl_.arrayReadInt(_loc3_,12) + 1);
         FlagDict_Impl_.arrayWriteInt(KFLAGS.flags,13,2 + Utils.rand(2));
         get_urta().urtaLove(1);
         if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,398) != 3)
         {
            if(get_game().time.hours >= 13)
            {
               FlagDict_Impl_.arrayWriteInt(KFLAGS.flags,1225,2);
            }
         }
         doNext(get_camp().returnToCampUseOneHour);
      }
      
      public function spitroastKath() : void
      {
         clearOutput();
         get_katherine().katherineSprite(true);
         var _loc1_:Boolean = get_katherine().isAt(4) || get_katherine().isAt(5);
         if(_loc1_)
         {
            outputText("你带领着这" + (get_katherine().hasCock() ? "两个发情的扶他" : "对充满欲望的伴侣") + "走向酒吧的一间后屋。你走进去，锁上门，当你转过身时，你看到乌尔塔从后面抓住了凯丝，以确保她不会扑向你。");
         }
         else
         {
            outputText("乌尔塔从背后抱住凯丝，锁住她的双臂，让她无法向你靠近。");
         }
         outputText("你可不是那种对送上门的好事挑三拣四的人，你开始" + get_katherine().clothesChoice("隔着她的" + (_loc1_ ? "衬衫" : "制服"),"隔着紧身衣的薄布料","隔着她的上衣","隔着她的丝绸长袍","把手伸进她的抹胸里","把手伸进那件性感的护士服里") + "玩弄凯丝的乳头。凯丝的" + (get_katherine().get_breasts().lactating() ? "乳头开始渗出乳汁，她的" : "") + "膝盖很快就软了，乌尔塔不得不从拉住她变成扶住她。[pg]");
         outputText("尽管你只是在玩弄凯瑟琳的乳头，但你听到你的两个女孩都开始呻吟起来。看来凯丝那漂亮的屁股正在摩擦乌尔塔的马屌。你的狐狸多半已经开始流水了。当你开始脱凯丝的衣服时，乌尔塔很乐意帮忙，你们俩以创纪录的速度把这个" + get_katherine().catGirl("猫娘","猫科动物") + "剥了个精光。[pg]");
         outputText("你让凯丝回到之前的姿势，乌尔塔");
         if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,1232) <= 15)
         {
            outputText("看起来很不自在，试图不让自己的阴茎摩擦到凯丝的屁股或小穴。你对她笑了笑，把她的肉棒抵在凯丝的穴口。凯丝发出一声非常开心的呼噜声，并试图调整她小穴的角度以便更好地进入。乌尔塔屈服了，闭上眼睛，任由凯丝顺着她的肉棒沉下去");
         }
         else if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,1232) <= 31)
         {
            outputText("任由她的阴茎在凯丝的阴唇上滑动。在你的鼓励下，乌尔塔将它滑了进去，凯丝在她的怀里扭动着，试图把自己压在乌尔塔巨大的肉棒上");
         }
         else
         {
            outputText("给了你一个大大的微笑，同时把凯丝拉到她的肉棒上，刺穿了她。凯丝转过身给了乌尔塔一个吻，然后期待地看着你。如今，夹在她双腿间的一根巨大的马屌对凯丝来说已经不够了——她想要你们俩");
         }
         outputText("。");
         outputText("[pg]既然凯丝哪儿也去不了，乌尔塔就抓住她" + get_katherine().catGirl("光滑的","毛茸茸的") + "臀部，控制着节奏。凯丝开始玩弄自己的乳头，给你表演。作为回报，你慢慢脱下装备来挑逗她们俩。当你完全赤裸时，你开始揉捏凯丝的耳朵，用它们轻轻地把她的头拉得越来越低，直到");
         if(get_player().isTaur())
         {
            outputText("她的背呈水平状态。你小心翼翼地跨过她，拉近与乌尔塔的距离，直到你感觉到你顺从的小猫" + (get_player().hasCock() ? "吞下了你阴茎的顶端" : "像印鱼一样吸附在你的小穴上") + "。你拉过乌尔塔亲吻她，心想这才是半人马做爱的方式");
         }
         else
         {
            outputText("她的嘴对准了你的" + (get_player().hasCock() ? "阴茎" : "小穴") + "。你顺从的小猫不需要任何指示就能" + (get_player().hasCock() ? "吞下你阴茎的顶端" : "把舌头伸进你小穴的深处"));
         }
         outputText("。");
         outputText("[pg]乌尔塔挺动着，带动凯瑟琳的");
         if(get_player().hasCock())
         {
            outputText("双唇顺着你的肉棒滑下。" + (get_player().longestCock() >= 12 ? " 尽管你的尺寸惊人" : ""));
         }
         else
         {
            outputText("脸埋进你的胯间。");
         }
         outputText("凯丝毫无怨言地接受了，她粗糙的舌头让你的心情和" + (get_player().hasCock() ? "阴茎" : "湿润的小穴") + "都爽翻了。[pg]");
         outputText("乌尔塔完全沉浸其中——她把你的手放在她的乳房上，开始像拼命一样操着凯丝。" + (get_player().isTaur() ? "你已经不习惯有爱人在你面前了，这额外的刺激" : "伴随着凯瑟琳急切的舌头带来的摇晃感") + "让你比想象中更快地达到了高潮。[pg]");
         if(!get_player().hasCock())
         {
            outputText("凯丝舔舐着你的小穴，以你分泌淫液的速度喝下它们。每次你以为高潮已经结束时，她都会用整个舌头舔过你的阴蒂，让你再次高潮。直到你双腿发软，瘫倒在地她才停下" + (get_player().isTaur() ? "，为了避免压到她，你倒向了一边" : "，压在了她身上"));
         }
         else
         {
            outputText("你把乌尔塔拉向你，这样凯丝就能吞下你的整根肉棒。");
            if(get_player().cumQ() < 500)
            {
               outputText("在喷射了几次之后，你觉得你需要睡一觉来恢复体力。凯丝用她灵巧的舌头缠住你肉棒的一半，舔干净每一滴精液来感谢你");
            }
            else if(get_player().cumQ() < 1500)
            {
               outputText("你将一波又一波滚烫的精液射进凯丝的喉咙里。她像只乖巧的小猫一样喝下每一滴，你真希望你能看到她用那灵巧的舌头清理你肉棒时的表情");
            }
            else if(get_player().cumQ() < 3000)
            {
               outputText("你射进凯丝喉咙里的精液像消防水龙带一样，对任何普通人来说都太多了，根本吞不下。好在你的龟头离她的胃比离她的嘴唇更近。你感觉到了一股反压力，但凯丝的胃根本不是你那被魔法强化的" + (get_player().ballSize > 0 ? "蛋蛋" : "前列腺") + "的对手。当一切结束时，凯丝不得不咽下不少涌回她喉咙的精液");
            }
            else
            {
               outputText("你射进凯丝喉咙里的精液洪流如此猛烈，以至于你感觉到身下传来了惊恐的挣扎。太迟了，精液只能进不能出。你" + (get_player().isTaur() ? "感觉到凯丝的屁股和背部紧贴着你的肚子，你意识到" : "看着她的肚子不断膨胀，直到") + "她被填得满满的，肚子都贴到了地板上。当一切结束时，凯丝不得不咽下不少涌回她喉咙的精液");
            }
         }
         outputText("。");
         outputText("[pg]当你恢复过来时，你感激地揉了揉凯丝的大腿，但你的举动只会让乌尔塔操她操得更狠。在你们之间，凯丝的尾巴来回甩动，所以你抓住它，开始在根部附近按摩。凯丝向后推着乌尔塔，你看到乌尔塔翻起了白眼。");
         if(get_katherine().hasCock())
         {
            outputText("一股滚烫的精液喷射在你的" + (get_player().isTaur() ? "后" : "") + (get_player().hasTailInsteadOfLegs() ? "尾巴" : "脚") + "上及周围。");
         }
         outputText("凯丝刚刚高潮了，如果你没猜错的话，她紧缩的小穴把乌尔塔也送上了顶峰。[pg]");
         if(!get_player().hasCock() || get_player().cumQ() < 3000)
         {
            outputText("果然，你" + (get_player().isTaur() ? "感觉到凯丝的屁股和背部紧贴着你的肚子，你意识到" : "看着她的肚子不断膨胀，直到") + "她被填得满满的，肚子都贴到了地板上");
         }
         else
         {
            outputText("对凯丝来说，承受乌尔塔的精液已经够困难的了，但她的肚子里已经装了好几桶你的精液。无处可逃，你" + (get_player().isTaur() ? "感觉" : "看到") + "她的肚子膨胀得更大了。乌尔塔用力拉扯着凯丝的臀部，甚至留下了印记，她被一种想要在凯瑟琳天鹅绒般的小穴里播种的强烈冲动驱使着。当她力气耗尽时，乌尔塔向后倒去，一股浓稠的精液从凯丝的小穴里喷涌而出");
         }
         outputText("。");
         outputText("[pg]乌尔塔喘着粗气，就像刚跑完马拉松一样，而凯丝" + (get_player().hasCock() ? "，她的嘴还含着你的肉棒，" : "") + "只是满足地呻吟着。你自己也挺高兴的，和她们坐在一起休息了一会儿。[pg]");
         outputText("乌尔塔什么也没说，只是和你十指紧扣，把你们交织的手放在凯丝鼓胀的肚子上。凯丝用手臂搂住你们俩，很快你就听到了你疲惫的朋友打呼噜的声音。乌尔塔主动提出留下来陪凯丝并清理现场，所以你就把这事交给她了。你很想留下来，但责任在召唤。");
         get_player().orgasm("Generic");
         get_katherine().orgasm();
         get_katherine().katherineAndUrtaHadSex(false);
         var _loc2_:IMap = KFLAGS.flags;
         FlagDict_Impl_.arrayWriteInt(_loc2_,12,FlagDict_Impl_.arrayReadInt(_loc2_,12) + 1);
         FlagDict_Impl_.arrayWriteInt(KFLAGS.flags,13,2 + Utils.rand(2));
         get_urta().urtaLove(1);
         if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,398) != 3)
         {
            if(get_game().time.hours >= 13)
            {
               FlagDict_Impl_.arrayWriteInt(KFLAGS.flags,1225,2);
            }
         }
         doNext(get_camp().returnToCampUseOneHour);
      }
      
      public function sandwichMaleCentaurLicked() : void
      {
         outputText("[pg]你按摩着乌尔塔的肩膀，问她能不能帮帮你。她一开始没明白你的意思，直到你稍微施加了一点压力。一旦她领会了，乌尔塔立刻四肢着地趴下。你给了她一个大大的微笑，小心翼翼地跨过她。[pg]");
         outputText("你发现自己处于一个不寻常但非常愉快的境地。在你身下，乌尔塔正贪婪地吸吮着你的阴茎。凯瑟琳则插在乌尔塔的");
         if(get_katherine().get_cockNumber() > 1)
         {
            outputText("屁眼和小穴里");
         }
         else
         {
            outputText(get_urta().pregnancy.get_isPregnant() ? "屁眼" : "小穴");
         }
         outputText("，位置刚好能给你一个吻。既然你的双手空闲，你便拥抱了她，享受着她的乳房摩擦你的感觉，同时你的另一个伴侣正在取悦你的肉棒。[pg]");
         outputText("凯丝挣脱出来，对你眨了眨眼。然后她猛地向前推，让乌尔塔措手不及，把你的阴茎直接顶进了乌尔塔的喉咙深处。当乌尔塔向后退时，凯丝抓住她的臀部，把这只狐狸拉回自己的阴茎" + get_katherine().cockMultiple("","s") + "上。乌尔塔还没来得及吸一口气，这只醉醺醺的小猫又把她推回了你的肉棒上。[pg]");
         outputText("你知道乌尔塔其实并没有那么难受——如果她低下头，当凯丝把她往前推时，她就不必把你吞下去了。再加上那条在你双腿间摇摆的狐狸尾巴，告诉你，你最爱的狐狸扶他已经屈服于被当作活体性玩具的命运了。[pg]");
         outputText("凯丝真的开始喘气了，她的臀部像打桩机一样撞击着乌尔塔。低头看去，你得到了一个前排座位，看着凯丝将她的肉结" + get_katherine().cockMultiple("","s") + "在乌尔塔被蹂躏的洞" + get_katherine().cockMultiple("","s") + "里进进出出。然后肉结卡住了，凯丝的上半身似乎在你怀里融化了，脸上带着狂喜的表情。乌尔塔依然被你们俩夹在中间，发出一声快乐的咕噜声，她的肚子被凯瑟琳的精液填满，你听到喷洒和飞溅的声音，她那根马屌把精液射了一地。[pg]");
         outputText("既然凯丝和乌尔塔现在紧紧连在一起，你抓住这只筋疲力尽的猫" + get_katherine().catGirl("娘","形态") + "的臀部，让她前后移动。你发现很容易就能把乌尔塔拖来拖去。大概是因为她那鼓胀的肚子正滑过地板上一层厚厚的精液。[pg]");
         outputText("乌尔塔的舌头在嘴里滑动，尽力帮你高潮。至于凯丝，她双手环抱在你的脑后，无力地把你的脸拉进她的乳房。终于，你感觉到" + (get_player().balls > 0 ? "阴囊" : "前列腺") + "里那种熟悉的紧绷感，你尽可能地向前挺进。乌尔塔的舌头伸出嘴外，刚好能舔到" + (get_player().balls > 0 ? "你的蛋蛋" : "你的阴茎根部") + "。[pg]");
         outputText("你的四肢发软，身体将所有的能量都倾注在填满这位狐狸女郎上。");
         if(get_player().cumQ() < 500)
         {
            outputText("你将一小股滚烫的浓浆射入乌尔塔的喉咙。这浓稠温暖的精液一定正中要害，因为当最后几股精液滴入她的胃里时，乌尔塔满足地哼了一声。");
         }
         else if(get_player().cumQ() < 1500)
         {
            outputText("你一发接一发地射进乌尔塔的喉咙。随着每一次喷射，你都能感觉到她的内脏被撑得越来越大。当你的" + (get_player().balls > 0 ? "蛋蛋" : "前列腺") + "空了的时候，她的喉咙里有一种明显的温暖和湿润感。谢天谢地，她没有呕吐反射。");
         }
         else if(get_player().cumQ() < 3000)
         {
            outputText("当你将如泉水般的精液射入她的胃里时，乌尔塔浑身紧绷。[pg]");
            outputText("没过多久，你就感觉到她的肚子在压力下膨胀起来，让她看起来像怀孕三个月、四个月、五个月！有严重的背压，因为她另一个洞" + get_katherine().cockMultiple("","s") + "里的精液无处可去。像火鸡一样被填满的乌尔塔除了等待别无他法，只能任由你将她的胃和肚子撑大到超出正常极限。");
         }
         else
         {
            outputText("当你释放精液时，你的阴茎在压力下变粗。当你在她喉咙里爆发时，你把乌尔塔的呼吸都打断了。一股长长的精液直接喷入她的胃里" + (get_katherine().get_cockNumber() > 1 || get_urta().pregnancy.get_isPregnant() ? "，似乎在竞相与凯丝留在乌尔塔肠道里的存货汇合" : "") + "。乌尔塔的手脚在地板上乱抓，试图寻找逃脱的方法。凯丝的存货" + get_katherine().cockMultiple("已经","已经") + "无处可去，所以当乌尔塔的身体最终达到极限时，只能是你的阴茎让步了。[pg]");
            outputText("乌尔塔体内如潮水般的精液迫使你后退一步，你的阴茎尽管很硬，但在乌尔塔体内的压力下还是弯曲了。疼痛，加上你肉棒内外的压力，迫使你再后退一步，你的阴茎从乌尔塔的嘴里弹了出来。当她咳出你贡献的最后一部分时，你的阴茎继续喷发，巨大的精液间歇泉覆盖了你的肚子、乌尔塔，甚至凯丝的胸前。");
         }
         sandwichCommonEnd();
      }
      
      public function sandwichGetLicked() : void
      {
         outputText("[pg]你按摩着乌尔塔的肩膀，问她能不能帮你一下。她不确定你的意思，直到你稍微施加一点压力，轻轻地把她的头转向你的" + (get_player().hasCock() ? "阴茎" : "小穴") + "。一旦她明白了你的意思，乌尔塔很快就四肢着地。当乌尔塔" + (get_player().hasCock() ? "舔着你的阴茎并吸出一些先列腺液" : "埋头苦干") + "时，你忍不住暗自微笑。她把手放在你的臀部上，这样凯瑟琳的抽插就不会" + (get_player().hasCock() ? "把她刺穿" : "把她的脸强行按进你的小穴里") + "。[pg]");
         outputText("很难就这么站着。在你面前，凯丝沉浸在快感中，醉醺醺地将");
         if(get_katherine().get_cockNumber() > 1)
         {
            outputText("她的两根阴茎猛烈地插入乌尔塔心甘情愿的洞穴中");
         }
         else
         {
            outputText("她的肉棒插入乌尔塔饥渴的" + (get_urta().pregnancy.get_isPregnant() ? "屁股" : "小穴"));
         }
         outputText("。每次她抽插时，她的胸部都会令人愉悦地晃动。与此同时，乌尔塔熟练的舌头正" + (get_player().hasCock() ? "在你的龟头周围滑动" : "忙着挑逗你的阴唇") + "，把你推向高潮。[pg]");
         outputText("伴随着一次有力的抽插，凯丝设法将她部分膨胀的肉结" + get_katherine().cockMultiple("","s") + "强行塞进乌尔塔体内。乌尔塔喘息着，但更重要的是，她也松开了抓着你臀部的手。凯丝太沉浸在快感中了，她甚至没有注意到。她向后拉，你听到她的肉结" + get_katherine().cockMultiple("","s") + "弹出来的声音。然后她又把" + get_katherine().cockMultiple("它","它们") + "猛插进去。乌尔塔被向前推，" + (get_player().hasCock() ? "结果她一口气把你的整根阴茎吞进了喉咙" : "她的脸被死死地按进了你的小穴") + "。[pg]");
         outputText("乌尔塔那恳求的眼神让你彻底沦陷。再加上" + (get_player().hasCock() ? "她整个喉咙紧紧夹住你肉棒的感觉" : "她的鼻子在你的阴蒂上摩擦，同时舌头在你的深处探索。你猛烈地高潮了，淫水喷了她一脸") + "。[pg]");
         if(get_player().hasCock())
         {
            if(get_player().cumQ() < 500)
            {
               outputText("你将一股滚烫的浓精射入乌尔塔的喉咙。这浓稠温暖的精液一定让她很受用，因为当最后几股精液流入她的胃里时，她满足地哼哼着。[pg]");
               outputText("乌尔塔根本没有喘息的机会");
            }
            else if(get_player().cumQ() < 1500)
            {
               outputText("你一发接一发地将精液射入乌尔塔的喉咙。随着你的每一次喷射，你都能感觉到她的内脏被撑得越来越大。当你的" + (get_player().balls > 0 ? "蛋蛋" : "前列腺") + "被榨干时，她的喉咙里传来明显的温暖和湿润。谢天谢地，她没有呕吐反射。[pg]");
               outputText("乌尔塔根本没有喘息的机会");
            }
            else if(get_player().cumQ() < 3000)
            {
               outputText("当你将如泉水般的精液射入她的胃里时，乌尔塔浑身紧绷。[pg]");
               outputText("没过多久，你就能感觉到她的肚子在压力下膨胀起来，让她看起来像怀孕三个月，四个月，五个月！像一只被填满的火鸡，乌尔塔只能等待着你将她的胃和肚子撑到极限。[pg]");
               outputText("乌尔塔还没来得及适应你射入她体内的巨大精量");
            }
            else
            {
               outputText("当你释放精液时，你的肉棒在压力下变得更粗。当你在她喉咙里爆发时，你把乌尔塔撞得喘不过气来。一股长长的精液直接喷入她的胃里。[pg]");
               outputText("乌尔塔体内如潮水般的精液迫使你后退一步，尽管你的肉棒很硬，但在乌尔塔体内的压力下还是弯曲了。疼痛，加上来自你肉棒内部和外部的压力，迫使你又后退了一步，你的肉棒从乌尔塔的嘴里弹了出来。当她咳出你最后一部分的贡献时，你的肉棒继续喷发，巨大的精液喷泉覆盖了乌尔塔，甚至溅到了凯丝的前胸。[pg]");
               outputText("乌尔塔还没来得及适应你射入她体内的巨大精量");
            }
         }
         outputText("凯丝再次猛烈地向前冲刺，并用肉结锁住了她。你看到凯丝的尾巴变得僵硬，你知道乌尔塔即将接受另一份贡献。你坐在前排，看着凯丝那过度活跃的" + (get_katherine().hasBalls() ? "蛋蛋开始" : "前列腺开始") + "填满这只狐妖双性人。[pg]");
         if(get_urta().pregnancy.get_isPregnant())
         {
            if(get_katherine().get_cockNumber() > 1)
            {
               outputText("你看着乌尔塔的肚子下面鼓起一个包。她的子宫颈一定挡住了凯丝的精液，所以精液聚集在乌尔塔产道的顶部，压力大到足以在乌尔塔的皮肤上留下妊娠纹。当婴儿出生时，这可能会对乌尔塔有好处，但现在她只是默默地抓着那个鼓包，浅浅地呼吸着。[pg]");
            }
            outputText("凯瑟琳插在乌尔塔屁股里的肉棒" + get_katherine().cockMultiple("一定在喷射着如洪流般的精液","则没有这种限制") + "。乌尔塔的肚子变得越来越大，因为她的子宫和器官被结肠里冒泡的精液挤压向前。[pg]");
            if(get_katherine().get_cockNumber() > 1)
            {
               outputText("突然，凯丝发出一声惊讶的[say:啊！]，乌尔塔肉棒上方坚硬的鼓包迅速缩小，而她的肚子变得更圆了。[say:哦，哦，它倒流了。]凯丝说道，她的眼神变得迷离。[pg]");
            }
            outputText("凯丝瘫倒在地，她的" + (get_katherine().hasBalls() ? "蛋蛋将它们" : "前列腺将它") + "最后的几股精液注入乌尔塔的屁股。" + get_katherine().cockMultiple("","乌尔塔从抓着鼓包变成了揉着自己的两侧。") + " 结束时，凯瑟琳");
         }
         else
         {
            outputText(get_katherine().cockMultiple("果然，凯瑟琳的肉棒开始在乌尔塔体内释放出如洪流般的精液，她的","果然，插在乌尔塔体内的两根肉棒释放出如洪流般的精液，她的") + "肚子随着每一次喷射变得越来越大。看着她们脸上的表情，你忍不住笑了——每次凯丝的" + (get_katherine().hasBalls() ? "蛋蛋收缩" : "前列腺紧绷") + "时，她都全神贯注，片刻之后，乌尔塔的眼睛睁得大大的，因为她的肚子变得更圆了。[pg]");
            outputText("最后，凯丝被榨干了，向后瘫倒。她");
         }
         outputText("把一只手放在乌尔塔的肚子上，来回拨弄着她的肚脐，就像在玩弄乳头一样。[pg]");
         outputText("乌尔塔喘着粗气，仍然没有高潮。凯丝注意到了，并向你眨了眨眼。你开始用手指揉捏乌尔塔的乳头，同时凯瑟琳将一只手移到乌尔塔的肉棒上，另一只手移到乌尔塔的阴蒂上。刺激、饱腹感，某种东西让乌尔塔崩溃了，你那狐妖情人爆发了。她无法动弹，但你看着她的蛋蛋几乎完全缩回体内，她射出的精液喷到了对面的墙上。");
         sandwichCommonEnd();
      }
      
      public function sandwichGetFucked() : void
      {
         outputText("[pg]你低头看着乌尔塔的马屌。它随着凯瑟琳的每一个动作而弹跳——简直就像是想催眠你一样。乌尔塔呻吟着，[say: 哦，求你了！]你觉得没有理由拒绝她。你");
         if(get_player().isTaur())
         {
            outputText("转过身，向她甩了甩尾巴");
         }
         else
         {
            outputText(get_player().hasTailInsteadOfLegs() ? "滑过地板，绷紧尾巴，让你的[vagOrAss]与她膨胀的肉棒齐平" : "转过身弯下腰，撅起你的屁股");
         }
         outputText("。乌尔塔在凯丝的服侍下早已饥渴难耐，她没有浪费时间。[pg]");
         outputText("你感觉到她的双手抓住了你的" + (get_player().isTaur() ? "侧腹" : "臀部") + "，她肉感十足的阴茎压在了你的[vagOrAss]上。你呻吟着，试图为这个入侵者敞开自己，但乌尔塔很着急。她的手指掐进你的腰侧，把你拉向她，毫不留情地将她的肉棒一寸寸地送入你的体内。当她插到底时，你听到了一声深沉的叹息。同时被完全填满并完全填满别人的感觉一定很奇妙。[pg]");
         outputText("凯丝没有等你或乌尔塔调整姿势。" + (get_katherine().get_cockLength() > 14 ? " 每次凯丝在乌尔塔体内抽插时，你甚至能感觉到乌尔塔阴茎上方有一个小小的凸起。" : "") + " 她加快了速度，猛烈地操着乌尔塔，你知道凯瑟琳很快就会结扎了。[pg]");
         outputText("乌尔塔一定也知道凯丝快到了，因为她开始在你的[vagOrAss]上发力，但她不够快。你听到凯丝发出一声压抑的“喵呜”声，你感觉到乌尔塔的肚子");
         if(get_katherine().cumQ() <= 1500)
         {
            outputText("变得温暖，因为它被凯瑟琳的精液填满了。乌尔塔停顿了片刻，满足地叹了口气，然后她再次抓住了你的" + (get_player().isTaur() ? "侧腹" : "臀部"));
         }
         else
         {
            outputText("在" + (get_player().isTaur() ? "你的臀部" : "你的后腰") + "上膨胀。空气从乌尔塔的肺里被挤出，当你的两个爱人都瘫倒在你身上时，你被推倒在地。[pg]你暗自微笑，收缩" + (get_player().hasVagina() ? "你小穴的肌肉" : "你的括约肌") + "，榨取乌尔塔的肉棒。她可能装满了凯丝的精液，但乌尔塔还是乌尔塔。她再次抓住你的" + (get_player().isTaur() ? "侧腹" : "臀部") + "作为回应");
         }
         outputText("。");
         outputText("[pg]尽管她的肚子被精液塞得满满的，她还是以惊人的速度开始操你，决心像她被填满那样填满你。这种感觉美妙极了，当你" + (get_player().hasTailInsteadOfLegs() ? "向下" : "向后") + "看时，你看到凯丝已经把乌尔塔的睾丸握在手里。她对你咧嘴一笑，开始按摩它们，同时在乌尔塔耳边低语鼓励。[pg]");
         outputText("终于，你感觉到了体内那令人愉悦的精液喷发。乌尔塔把你的身体拉向她，用她滚烫粘稠的汁液淹没了你。你的腹部肌肉松弛下来，无法容纳乌尔塔泵入你体内的精液。她跳动的阴茎给你带来了释放，你高潮了，与你的情人们一起沉浸在狂喜中。" + (get_player().hasCock() ? " 你自己的阴茎也来凑热闹，把白费的精液喷洒在地板上。" : ""));
         sandwichCommonEnd();
      }
      
      public function sandwichCommonEnd() : void
      {
         outputText("[pg]你从交媾的恋人中挣脱出来，欣赏着眼前的景象。这两个扶他正开心地喘着气。乌尔塔被塞得像怀孕九个月一样，凯丝的尾巴在两边甩来甩去。偶尔它会落在一滩精液里，把一团精液甩到房间的另一边。清理起来要花点时间，但你还有人要见，有地方要去。[pg]");
         outputText("为了“弥补”你逃避打扫卫生的行为，你决定给她们一点小奖励。" + (FlagDict_Impl_.arrayReadInt(KFLAGS.flags,723) == 1 && !get_urta().pregnancy.get_isPregnant() ? "首先你拍了拍乌尔塔的肚子，问她是不是想让自己怀孕。她只是含糊不清地嘟囔了些什么。然后你" : "你") + "走到凯丝身后，揉了揉这只醉猫的尾巴根部。她感激地发出咕噜声。你继续往下摸，开始把玩");
         if(get_katherine().get_ballSize() > 0)
         {
            outputText("她刚刚被榨干的蛋蛋");
         }
         else
         {
            outputText("她" + get_katherine().cockMultiple("","下方的") + "阴茎根部");
         }
         outputText("。[pg]");
         outputText("[say:你得向船长展示一下你的耐力，]你对她说。[pg]");
         outputText("凯丝呻吟着说：[say:我只是——我的肉结还卡着呢。我不行了。][pg]");
         outputText("你给了她一个吻，说：[say:别半途而废。][pg]");
         outputText("乌尔塔抬起头，意识到你想做什么。[say:不，不！我还满着呢。我不行了。][pg]");
         outputText("你一只手继续抚摸凯丝，另一只手去挑逗乌尔塔的阴蒂。你告诉乌尔塔，她内心深处知道自己能承受得住。她试图反抗，但由于肚子被填满，而且凯丝的肉结已经锁住，她根本无法逃脱。[pg]");
         outputText("你再次亲吻凯丝，问她：[say:难道你不想看看你能把她弄得多大吗？]尽管刚刚高潮过，你还是看到凯丝眼中重新燃起了醉醺醺的欲望。她把爪子抠进乌尔塔的臀部，开始轻轻地抽插她的肉棒。[pg]");
         outputText("乌尔塔捂着肚子呻吟道：[say:哦，不，]但你觉得她开始进入状态了。在你变得太兴奋之前，你把你的爱人们留在了那里。" + (FlagDict_Impl_.arrayReadInt(KFLAGS.flags,1232) >= 31 ? " 她们真的需要更多时间在一起，你确信这算得上是一次“增进感情的经历”。" : ""));
         get_player().orgasm("Generic");
         get_katherine().orgasm();
         get_katherine().katherineAndUrtaHadSex(true);
         var _loc1_:IMap = KFLAGS.flags;
         FlagDict_Impl_.arrayWriteInt(_loc1_,12,FlagDict_Impl_.arrayReadInt(_loc1_,12) + 1);
         FlagDict_Impl_.arrayWriteInt(KFLAGS.flags,13,2 + Utils.rand(2));
         get_urta().urtaLove(1);
         if(get_game().time.hours >= 13)
         {
            FlagDict_Impl_.arrayWriteInt(KFLAGS.flags,1225,2);
         }
         doNext(get_camp().returnToCampUseOneHour);
      }
      
      public function sandwich() : void
      {
         clearOutput();
         outputText("乌尔塔挠了挠凯丝的耳后，建议溜进后面的一个房间。你一关上身后的门，凯丝就跳进乌尔塔的怀里，给了她一个长长的吻。[pg]");
         outputText("当她们浮出水面换气时，乌尔塔用俏皮的语气说道：[say: 等一下，凯丝，让我准备一下，]试图把凯丝推开足够长的时间来脱掉衣服。凯丝再次与乌尔塔唇齿相依，同时她的手指在解乌尔塔衣服的带子。[pg]");
         outputText("当乌尔塔几乎全裸时，凯丝绕到她身后，把她的肉棒" + get_katherine().cockMultiple("","s") + "放在乌尔塔的大腿之间。乌尔塔吃了一惊，合拢了双腿。凯丝抓住乌尔塔的臀部，在她耳边发出呼噜声，开始抽插她的阴茎" + get_katherine().cockMultiple("","s") + "。你看到它们开始闪烁着乌尔塔的汁液，当凯丝下一次退后时，她对你眨了眨眼。她的" + get_katherine().cockMultiple("","上面的肉棒压在乌尔塔的屁股上，而她下面的") + "肉棒" + (get_katherine().get_cockNumber() == 1 && get_urta().pregnancy.get_isPregnant() ? "压在乌尔塔的屁股上" : "滑入乌尔塔滴水的阴户的褶皱之间") + "。乌尔塔的下巴颤抖着，她屏住呼吸，等待着她的操干开始。[pg]");
         outputText("你把手放在乌尔塔的肩膀上，把她推向凯瑟琳。当凯丝把她的肉棒" + get_katherine().cockMultiple("","s") + "插入乌尔塔体内时，你评论说她们真的相处得很好。你很高兴看到她们之间没有太多的摩擦。[pg]");
         outputText("[say: 当她高潮如潮水般涌出时，怎么会有摩擦呢？]凯丝问道，她的肉棒" + get_katherine().cockMultiple("","s") + "在乌尔塔体内探底。[say: 现在你给她找点事做怎么样？]");
         menu();
         addButton(0,"骑乘乌尔塔",sandwichGetFucked);
         if(get_player().hasCock())
         {
            addButton(1,"被舔",get_player().isTaur() ? sandwichMaleCentaurLicked : sandwichGetLicked);
         }
         else
         {
            addButtonDisabled(1,"被舔","这个场景需要你有阴茎。");
         }
      }
      
      public function roastYou() : void
      {
         clearOutput();
         get_katherine().katherineSprite(true);
         if(get_katherine().isAt(4) || get_katherine().isAt(5))
         {
            outputText("你带领着发情的扶他走向酒吧的一个后方房间。你进去后锁上了门，但当你转过身时，乌尔塔从后面扑向你，扭住你的手臂，把你拉倒在地。凯丝笑着开始帮乌尔塔脱你的衣服。[pg][say: 你今天太慢了，[name]。我发情得厉害，而且我能从她的气味中闻出凯瑟琳也渴望一场痛快的性爱。放松点，我们会好好照顾你的。]");
         }
         else
         {
            outputText("你开始向门口移动。并不是你不想帮凯丝，而是你真的应该回营地了。你觉得乌尔塔还在被凯丝分心，凯丝现在正用手指诱惑地抚摸着她的身体两侧。[pg]");
            outputText("乌尔塔看到你向门口移动，决定向你们俩展示一下权威的声音。[say: 凯瑟琳，[name]！停在那里！]她喊道，让你和凯丝都停了下来。然后乌尔塔向你扑来。你设法躲开了，但乌尔塔重重地撞在门上，挡住了它。她笑得像一只刚在鸡舍里醒来的狐狸。[pg]");
            outputText("[say: 好了，凯丝——制服肇事者。]你刚环顾四周，就被凯丝扑倒了。她也发情了，而且没有手下留情。[say: 哈哈，是啊，她现在真的很擅长捕捉猎物，]乌尔塔站在你们俩上方说道。[pg]");
            outputText("乌尔塔抓住你的手臂，而凯丝则开始脱你的衣服。你离得如此之近，以至于能看到先列腺液从乌尔塔的肉棒尖端渗出，弄湿了她衬衫的下半部分。乌尔塔低语道：[say: 你进来这里，把我们俩都弄热了，然后你想溜走？][pg]");
            outputText("凯瑟琳插话道：[say: 是啊，怎么回事？]乌尔塔看着你的眼睛说：[saystart]现在轮到我们了。我要把这个怪物喂给你，而凯丝要操");
            if(!get_player().hasVagina())
            {
               outputText("你的屁股");
            }
            else
            {
               outputText(get_katherine().cockMultiple("你的小穴","你的小穴和屁股"));
            }
            outputText("。愿玛莱保佑你的内脏。[sayend]");
         }
         outputText("[pg]你没有反驳的余地。一旦你脱光衣服，乌尔塔就坐在你身上，并且");
         if(get_player().biggestTitRow() > 5)
         {
            outputText("揉捏着你乳房的两侧");
         }
         else if(get_player().balls > 0)
         {
            outputText("揉捏着你的阴囊");
         }
         else if(get_player().hasVagina())
         {
            outputText("用手指在你的阴缝上下滑动");
         }
         else
         {
            outputText("玩弄着你的屁眼");
         }
         outputText("，让你热起身来。很快，你看到凯丝最后一件衣服被扔到了你面前的墙上，她那");
         if(get_katherine().get_cockNumber() > 1)
         {
            outputText("几根肉棒的龟头紧紧抵住了" + (get_player().hasVagina() ? "你的两个小穴" : "你的屁股"));
         }
         else
         {
            outputText("肉棒的龟头紧紧抵住了你的" + (get_player().hasVagina() ? "小穴" : "屁股"));
         }
         outputText("。");
         outputText("[pg]凯丝用膝盖顶开你的双腿，开始强行将");
         if(get_katherine().get_cockNumber() == 1)
         {
            outputText("她那" + get_katherine().get_cockLength() + "英寸长的" + get_katherine().cockType("狗鸡巴","猫鸡巴") + "塞进你的" + (get_player().hasVagina() ? "小穴" : "直肠"));
         }
         else if(get_player().hasVagina())
         {
            outputText("她那对" + get_katherine().cockType() + "肉棒塞进你的身体");
         }
         else
         {
            outputText("她那对" + get_katherine().cockType() + "肉棒塞进你的身体，丝毫不顾你的屁股根本承受不住她那对" + get_katherine().get_cockLength() + "英寸长的粗大肉棒");
         }
         outputText("。凯丝紧紧抓住你的臀部，开始轻轻摇晃，慢慢地将你撑开。从她的呼噜声中，你知道她很享受这一刻的每一秒。[pg]");
         outputText("既然凯丝已经把你控制住了，乌尔塔便站起身来开始脱衣服，在暴露自己的同时挑逗着你和凯丝。即使全裸了，她也没有停下，一手抚摸着自己的肉棒，另一手将蛋蛋托起，好让你和凯瑟琳能清楚地看到她那湿透了的小穴。[pg]");
         outputText("凯丝又往里顶深了一点，然后把你从地板上拉起来，让你四肢着地趴着。[say:别光顾着挑逗了，乌尔塔，让[him]见识见识你的厉害！]乌尔塔冲你咧嘴一笑，紧紧握住肉棒根部，手指慢慢顺着肉棒向上滑动，挤出了一大股先列腺液。她在你面前跪下，将先列腺液涂抹在肉棒上。[pg]");
         outputText("她凑近了一些，指着她那根闪闪发光的马鸡巴。[say:这咸度合你胃口吗？]她问道。此时凯丝的" + get_katherine().cockMultiple("肉棒已经做好了准备","双根肉棒已经做好了准备") + "，而你已经饥渴得无法抗拒了。你用嘴含住乌尔塔的精液炮，像舔一块热腾腾的肉盐砖一样吮吸起来。[pg]");
         outputText("[say:哦，对，真是个好[boy]！]乌尔塔大声喊道，声音大到足以让" + (get_katherine().isAt(4) || get_katherine().isAt(5) ? "酒吧里的任何人" : "街上的人") + "听到。这两个扶他开始协同作战——当乌尔塔把肉棒插得更深时，凯丝就往外抽；然后乌尔塔往后退，让你能用舌头舔到她肉棒的龟头，而凯丝则深深地插进去，直到她的肉结" + get_katherine().cockMultiple("","") + "没入你的体内。[pg]");
         outputText("她们保持着这个节奏，直到你决定反击一下乌尔塔。你盲目地向上伸手，摸到了她的蛋蛋，开始揉捏她那装满精液的阴囊。乌尔塔浑身一颤，改变了节奏，和凯丝同时向前猛挺。突然间，你喉咙里塞进了一英尺长的马鸡巴，而凯瑟琳的" + get_katherine().cockType() + get_katherine().cockMultiple("巨根","肉棒") + "则连着肉结深深埋进了");
         if(!get_player().hasVagina())
         {
            outputText("你的屁股里");
         }
         else if(get_katherine().get_cockNumber() > 1)
         {
            outputText("你的另外两个洞");
         }
         else
         {
            outputText("你的小穴里");
         }
         outputText("。");
         outputText("[pg]接下来就是狂野的冲刺了。凯丝和乌尔塔开始疯狂地抽插，全神贯注地想要高潮。你被当作一个活生生的飞机杯，而你也很享受这种感觉。乌尔塔那巨大的肉棒太粗了，抽插的速度又太快，完全压制了你的呕吐反射，你的喉咙甚至觉得塞满肉棒是件很正常的事。在下面，凯丝的");
         var _loc1_:Boolean = false;
         if(get_katherine().get_cockNumber() > 1)
         {
            if(get_player().hasVagina())
            {
               _loc1_ = get_player().buttChange(get_katherine().cockArea(),false);
               outputText("肉结同时卡在你的小穴和屁股里");
            }
            else
            {
               _loc1_ = get_player().buttChange(2 * get_katherine().cockArea(),false);
               outputText("两个肉结在你的括约肌上不断撞击。终于，它屈服了，完全敞开，让它们一个接一个地进入。它们膨胀到最大尺寸，撑开你那饱受折磨的屁股" + (_loc1_ ? "变得更宽" : "到了极限"));
            }
            outputText("，把你堵得严严实实");
         }
         else if(get_player().hasVagina())
         {
            outputText("肉结滑进你的小穴，并如自然规律般膨胀到最大尺寸，把你的小穴堵得严严实实");
         }
         else
         {
            _loc1_ = get_player().buttChange(get_katherine().cockArea(),false);
            outputText("肉结挤过你的括约肌，滑进你的直肠。它迅速膨胀到最大尺寸，把你的肠道堵得严严实实");
         }
         outputText("准备迎接她即将到来的喷发" + (get_player().hasVagina() && !get_player().isPregnant() ? " 并确保你的子宫会被她的精液淹没" : "") + "。[pg]");
         if(get_player().hasVagina())
         {
            if(get_player().cuntChange(get_katherine().cockArea(),true))
            {
               outputText("[pg]");
            }
         }
         if(_loc1_)
         {
            get_player().buttChangeDisplay();
            outputText("[pg]");
         }
         outputText("乌尔塔的蛋蛋微微抽搐了一下，告诉你她准备好发射了。作为鼓励，你凭感觉找到她的小穴，用手指揉捏她的阴蒂。乌尔塔双手抓住你的头，用力一拉，把你的" + (get_urta().pregnancy.get_isPregnant() ? "额头压在她肿胀的肚子上" : "脸压在她的腹股沟上") + "。第一股精液在乌尔塔的肉棒里鼓起一个大包，甚至强行把你的下巴撑得更开。由于她的肉棒深入你的喉咙，她所有的精液都直接射进了你的胃里，把你撑得" + (get_player().isPregnant() ? "看起来比实际月份还要大几个月" : "像怀孕好几个月一样") + "。[pg]");
         outputText("乌尔塔向后倒在地板上，让你咳出一些精液，喘几口气。[say: 呼！]她擦了擦额头说，[say: 太棒了。看来我们真的把你填满了。]然后她抬起眼睛说：[say: 哦。我想我确实把你填满了。凯丝还没高潮呢。][pg]");
         outputText("凯丝前后摇晃着她的肉结" + get_katherine().cockMultiple("","s") + "，发出呜咽声。乌尔塔像狼一样咧嘴一笑，说：[say: 你能行的，凯丝。[name]自己要求的，现在给[him]吧。]乌尔塔摇摇晃晃地站起来，走出了你的视线。你依然被填得满满的，喘不过气来，即使你想阻止她也无能为力。[pg]");
         outputText("你听到凯瑟琳惊讶地[say: 哦]了一声。然后是乌尔塔低沉性感的声音，[saystart]");
         if(get_katherine().get_ballSize() > 0)
         {
            outputText("你这蛋蛋又大又饱满");
         }
         else
         {
            outputText("嗯，你的前列腺又热又肿");
         }
         outputText("。这么多精液，你不想全射出来吗？[sayend][pg]");
         outputText("凯丝小声说：[say: 请帮帮我，]声音小得你几乎听不见。[pg]");
         switch(get_player().get_gender())
         {
            case 0:
               outputText("[say: 当然，我会帮你的，]乌尔塔说。你不知道她在后面做什么，但你能听到凯瑟琳的呼吸越来越急促。[say: 凯丝，我会一直挤压你的前列腺，直到你把每一滴精液都射进[name]的屁股里，让[him]记住生殖器有多好玩。][pg]");
               outputText("凯丝的" + get_katherine().catGirl("指甲","爪子") + "掐进你的臀部，你感觉到一股又一股的精液填满了你的肠道。加上乌尔塔注入你肚子里的精液，你胀得感觉都要吐了。但与此同时，埋在你屁股里跳动的肉棒" + get_katherine().cockMultiple("","们") + "终于让你得到了释放，你不断地高潮，你平坦的胯部因快感而刺痛。");
               break;
            case 2:
               outputText("你感觉到乌尔塔的手在你的双腿之间。她抓住了你的阴蒂，就像你对她做的那样。[say:是的，我当然会帮你，]乌尔塔说着，用手指轻轻揉搓着你的阴蒂。[say:你只需要一点点东西——比如[name]美妙的小穴" + get_katherine().cockMultiple("紧紧夹住你的肉棒","和紧致的小屁股紧紧夹住你的肉棒") + "，当她高潮的时候。][pg]");
               outputText("乌尔塔顽皮的手指很快就让你高潮了，正如乌尔塔预测的那样，你的高潮引发了凯丝的高潮。" + (get_player().hasCock() ? "你自己的肉棒徒劳地把精液喷在地板上，而凯瑟琳" : "伴随着最后一次用力的挺进，她") + "把她的肉棒" + get_katherine().cockMultiple("","们") + "埋得更深了一点。然后洪水开始了。你的肚子已经被乌尔塔的精液塞满了，现在膨胀得更大了。你的" + (get_player().isPregnant() ? "产道" : "子宫") + get_katherine().cockMultiple("抽动着","和肠道抽动着") + "，痛苦地抗议着，但由于凯丝的肉结" + get_katherine().cockMultiple("","们") + "无情地堵住了出口，它" + get_katherine().cockMultiple("","们") + "别无选择，只能接纳每一滴精液。");
               break;
            default:
               outputText("乌尔塔的手指包裹住你的肉棒。一直被忽视的它在受到关注时跳动了一下。[say:是的，我当然会帮你，]乌尔塔说着，轻柔地抚摸着你的阴茎。[say:你只需要一点点东西——比如[name]紧致的小屁股紧紧夹住你的肉棒" + get_katherine().cockMultiple("","们") + "，当他高潮的时候。][pg]");
               outputText("乌尔塔顽皮的手指在你的肉棒上下滑动。你本来就处于边缘，增加的快感很快导致你的" + (get_player().ballSize > 0 ? "蛋蛋" : "前列腺") + "收紧，徒劳地将你的精液喷洒在地板上。正如乌尔塔预测的那样，你的高潮引发了凯丝的高潮。伴随着最后一次用力的挺进，她把她的肉棒" + get_katherine().cockMultiple("","们") + "埋得更深了一点。然后洪水开始了。你的肚子已经被乌尔塔的精液塞满了，现在膨胀得更大了。你的肠道痛苦地抽动着，但由于凯丝的肉结" + get_katherine().cockMultiple("","们") + "无情地堵住了出口，它别无选择，只能接纳每一滴精液。");
         }
         outputText("[pg]凯丝筋疲力尽地瘫倒在你身上。乌尔塔把你转过来，给了你和凯丝一人一个吻。[say:谢谢你[name]，这正是我需要的。][pg]");
         outputText("[say:我也是，]凯丝发出呼噜声，依偎在你的背上小睡。你留下来，直到" + get_katherine().cockMultiple("凯瑟琳的肉结","凯丝的肉结") + "滑出来，然后你就上路了——留下凯丝和乌尔塔互相照顾。");
         get_player().orgasm("VaginalAnal");
         get_katherine().orgasm();
         get_katherine().katherineAndUrtaHadSex(false);
         var _loc2_:IMap = KFLAGS.flags;
         FlagDict_Impl_.arrayWriteInt(_loc2_,12,FlagDict_Impl_.arrayReadInt(_loc2_,12) + 1);
         FlagDict_Impl_.arrayWriteInt(KFLAGS.flags,13,2 + Utils.rand(2));
         get_urta().urtaLove(1);
         if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,398) != 3)
         {
            if(get_game().time.hours >= 13)
            {
               FlagDict_Impl_.arrayWriteInt(KFLAGS.flags,1225,2);
            }
         }
         doNext(get_camp().returnToCampUseOneHour);
      }
      
      public function pinAndFuckStuffKath() : void
      {
         clearOutput();
         outputText("当凯丝趴在乌尔塔身上时，她的双腿分开，让你清楚地看到了" + (int(get_player().cocks.length) > 1 ? "三" : "两") + "样东西。她" + get_katherine().cockMultiple(""," 下面的") + "肉结又热又硬，埋在乌尔塔的小穴里" + get_katherine().cockMultiple(" 还有她滴着淫液的肉缝","，她滴着淫液的肉缝和她柔软的括约肌，都") + "在等待着你的肉棒。" + (int(get_player().cocks.length) > 1 ? "它们看起来" : "它看起来") + "那么湿润，那么空虚。凯瑟琳和乌尔塔都没有注意到你" + (get_player().hasTailInsteadOfLegs() ? "滑行" : "走") + "到她们周围，在凯丝身后站定，对准你的肉棒" + (int(get_player().cocks.length) > 1 ? "并把它们送进" : "并把它送进") + "凯丝的身体里。[pg]");
         outputText("凯丝可能累了，但她依然兴致勃勃。她收紧小穴" + (int(get_player().cocks.length) > 1 ? "和屁股，紧紧包裹住你的肉棒" : "紧紧包裹住你的肉棒") + "，发出一声低沉的呻吟。你");
         if(get_player().cor < 25)
         {
            outputText("让你的肉棒" + (int(get_player().cocks.length) > 1 ? "" : "") + "静止片刻，让凯丝调整臀部，好让她处于一个更舒服的姿势。你按摩着她尾巴的根部，这引得凯丝发出更多愉悦的呻吟。当你终于再次开始抽插时，凯丝无力地试图将臀部向你推去，她的小穴" + (int(get_player().cocks.length) > 1 ? "和屁股尽其" : "尽其") + "所能地把你拉得更深。");
         }
         else if(get_player().cor < 75)
         {
            outputText("开始缓慢而温柔地操她，但随着你的本能接管，很快就变成了猛烈而快速的抽插。这对凯丝来说似乎并不重要，只要你的肉棒" + (int(get_player().cocks.length) > 1 ? "填满了她的洞，她就会高兴地呻吟和发出呼噜声。" : "填满了她的小穴，她就会高兴地呻吟和发出呼噜声。"));
         }
         else
         {
            outputText("只是开始猛烈地进出。凯丝往往喜欢粗暴一点，而现在你并不真的在乎她是否享受。");
         }
         outputText("[pg]在你们俩身下，乌尔塔试图回头看看为什么凯丝的肉棒" + get_katherine().cockMultiple(" 在"," 在") + "她那被塞得满满的肚子里前后摇晃。凯丝给了她一个吻，说道 [say: 你喜欢通过我感受到[name]吗？] 乌尔塔翻了个白眼，她意识到自己被困住了，而且正在经历一场间接的性爱。[pg]");
         outputText("刚刚看着你的女朋友们做爱，你坚持不了多久也就不足为奇了。你的" + (get_player().balls > 0 ? "蛋蛋渴望将它们的" : "前列腺渴望将它的") + "贡献加入凯瑟琳火热的小穴" + (int(get_player().cocks.length) > 1 ? " 和诱人的屁股" : "") + "中。你抓住凯丝的腰，将自己埋入其中，那种现在已经熟悉的感觉得从你的" + (get_player().balls > 0 ? "蛋蛋，穿过你的" : "") + "前列腺，沿着你的肉棒奔涌而出。[pg]");
         outputText("你的肉棒" + (int(get_player().cocks.length) > 1 ? "在凯丝体内爆发" : "在凯丝体内爆发"));
         if(get_player().cumQ() < 500)
         {
            outputText("，你的精液浸透了她" + (int(get_player().cocks.length) > 1 ? "的小穴和屁股" : "等待着的小穴") + "。凯瑟琳只是发出呼噜声，微微滚动身体，以便能亲吻你。");
         }
         else if(get_player().cumQ() < 1500)
         {
            outputText("你感觉到" + (int(get_player().cocks.length) > 1 ? "精液在你的肉棒尖端周围形成了一个个小湖泊" : "精液在你的肉棒尖端周围形成了一个小湖泊") + "。她的肚子微微隆起，凯丝把手放在上面，嘴角挂着微笑。");
         }
         else if(get_player().cumQ() < 3000)
         {
            outputText("由于你注入的精液量太大，她的身体被推离了乌尔塔。凯丝喘着粗气，一只手用来稳住自己，另一只手紧紧抓住她膨胀的肚子。");
            if(get_katherine().pregSize() > 0)
            {
               outputText("这一定特别痛苦，因为她的子宫已经停止运作了。");
            }
            else
            {
               outputText("随着她的子宫" + (int(get_player().cocks.length) > 1 ? " 和结肠" : "") + "充满你的精液，她看起来有点像怀孕了。");
            }
         }
         else
         {
            outputText("力量如此之大，以至于她被打得喘不过气来。");
            if(get_katherine().pregSize() == 0)
            {
               outputText("即使从她身后，你也能看到她的子宫在膨胀，充盈得仿佛她怀孕八个月了一样。");
            }
            if(get_katherine().pregSize() > 0)
            {
               outputText("如果没有空虚的子宫来承受来自");
               if(int(get_player().cocks.length) > 1)
               {
                  outputText("你下半截肉棒的精液，凯丝的阴道很快就达到了极限，你感觉到所有的精液顺着你的另一根肉棒流下" + (int(get_player().cocks.length) > 2 ? "，喷射得满屋子都是。" : "，用精液塞满了她的结肠。"));
               }
               else
               {
                  outputText("你那超负荷的" + (get_player().balls > 0 ? "蛋蛋" : "前列腺") + "让你迅速将她的小穴填满到极限，剩下的精液喷溅回你的腹股沟。");
               }
            }
            outputText("凯丝肚子上的凸起大到足以把她从乌尔塔身上抬起来，虽然还不足以释放凯瑟琳的肉结" + get_katherine().cockMultiple("","") + "。现在凯丝几乎是直立地坐在乌尔塔上方，她转过身来吻了你。");
         }
         outputText("[pg]在人堆的最下面，你听到乌尔塔说：[say: 哦——" + get_katherine().cockMultiple("它","它们") + "又变大了！][pg]");
         outputText("你用手指快速检查了一下，发现她是对的，凯丝的肉结" + get_katherine().cockMultiple("已经","已经") + "恢复了全部力量，把这两个扶他绑在了一起。[pg]");
         outputText("你从凯丝体内抽出，拍了拍她的背。你告诉乌尔塔，有两种方法可以让" + get_katherine().cockMultiple("那个肉结","那些肉结") + "缩小，由她们自己决定用哪种。凯丝看起来很累，但她的尾巴来回摇摆着。乌尔塔只是呻吟着说，[say: 我不行了，我太饱了。][pg]");
         outputText("你出门时锁上了门，" + (FlagDict_Impl_.arrayReadInt(KFLAGS.flags,1232) >= 31 ? "知道这两个人最终肯定会选择做爱。" : "希望你那两个得到满足的女友能借此增进感情。"));
         FlagDict_Impl_.arrayWriteInt(KFLAGS.flags,13,2 + Utils.rand(2));
         if(get_game().time.hours >= 13)
         {
            FlagDict_Impl_.arrayWriteInt(KFLAGS.flags,1225,2);
         }
         doNext(get_camp().returnToCampUseOneHour);
      }
      
      public function pinAndFuckMountUrta() : void
      {
         clearOutput();
         outputText("你把凯丝和乌尔塔翻转过来，这样你就能接触到乌尔塔的马阴茎了。它有点软，但在它那沾满精液的长度上撸动几下后，情况就开始改变了。乌尔塔睁开眼睛，试图把注意力集中在你身上，但你已经" + (get_player().hasVagina() ? "把你的小穴贴在她的肉棒上滑动" : "把她的马阴茎在你的肛门上摩擦") + "。在你们俩下面，凯丝发出一声快乐的[say:哦！]你猜乌尔塔的肌肉正紧紧夹住凯丝的阴茎" + get_katherine().cockMultiple("","s") + "。[pg]");
         outputText("当你沉入乌尔塔的阴茎时");
         if(!get_player().hasVagina())
         {
            outputText("你享受着你的结肠被撑开、拉直，以容纳乌尔塔巨大的粗细和长度的感觉。你感觉到一股滚烫的先列腺液浸透了你的最深处。");
         }
         else
         {
            outputText("当它在你的子宫颈上摩擦时，你");
            if(get_player().isPregnant())
            {
               if(get_player().get_pregnancyType() == 32)
               {
                  outputText("抚摸着你那塞满黏液的肚子，希望你的乘客喜欢这趟旅程。");
               }
               else if(get_player().get_pregnancyType() == 21)
               {
                  outputText("把手放在你的肚子上，想着她已经在你肚子里种下的孩子。");
               }
               else if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,723) > 0)
               {
                  outputText("想着你肚子里的宝宝。等它出生后，你真的需要再来一次，这样乌尔塔就能让你怀孕了。");
               }
               else
               {
                  outputText("想着你肚子里的宝宝，希望有什么办法能让她成为它的父亲。");
               }
            }
            else if(get_player().hasStatusEffect(StatusEffects.Contraceptives))
            {
               outputText("想着你空荡荡的子宫。如果乌尔塔的精液能像自然规律那样让你怀孕，那感觉不是很好吗？");
            }
            else if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,723) > 0)
            {
               outputText("开始幻想。乌尔塔产生的大量精液很有可能让你受孕。");
            }
            else
            {
               outputText("迷失在这种感觉中。你希望她的大鸡巴能填满你小穴的每一个缝隙。");
            }
            outputText("你停下来，在你的小穴上方摸了摸，乌尔塔的粗细把你的肉撑成了一个凸起。");
         }
         outputText("乌尔塔开始呻吟；现在她那过度敏感的鸡巴埋在你的" + (get_player().hasVagina() ? "小穴" : "直肠") + "里，她真的进入状态了。你收缩你" + (get_player().hasVagina() ? "阴道" : "屁股") + "的肌肉，以更好地取悦她。凯丝也来帮忙，她绕过乌尔塔，玩弄着她的乳头，而你则按摩着她的睾丸，告诉她你想被填满。[pg]");
         outputText("乌尔塔的双腿锁住你，她试图把她的马阴茎插得更深。你感觉到一个凸起沿着底部移动，当滚烫的精液在你体内喷发时");
         if(!get_player().hasVagina())
         {
            outputText("，像气球一样填满你的结肠，");
         }
         else if(get_player().get_pregnancyType() == 32)
         {
            outputText("它强行进入你的子宫。你希望你体内的黏液喜欢这个澡。随着乌尔塔更多的精液填满你的小穴");
         }
         else if(get_player().isPregnant())
         {
            outputText("，溅在你的子宫颈上，");
         }
         else
         {
            outputText("它强行进入你的子宫。这种感觉非常美妙，你的肚子向外膨胀成一个看起来像怀孕的圆顶。随着乌尔塔更多的精液填满你的小穴");
         }
         outputText("你吻了她，屈服于你期待已久的高潮。");
         outputText("[pg]乌尔塔把一只手放在你被撑大的肚子上，并把你的手放在她自己肿胀的肚子上。她只是满足地微笑着，她的阴茎埋在你的小穴里，而凯瑟琳的阴茎" + get_katherine().cockMultiple(" 结在她的阴道里","s 结在她的阴道和屁股里") + "。她似乎无忧无虑。然后凯丝摇晃着她的臀部。乌尔塔回头看了一眼，你们俩都看到凯丝眼中闪烁着坚定的光芒。[pg]");
         outputText("[say: 还来？] 乌尔塔说道，[say: 不行，不行，我不能再来了！我已经高潮两次了。][pg]");
         outputText("凯丝笑了起来，继续温柔地操着乌尔塔。你从乌尔塔的肉棒上拔出来，等她那巨大的精液从你的" + (get_player().hasVagina() ? "小穴" : "屁股") + "里喷涌完毕，然后穿上衣服。离开前，你给了乌尔塔一个吻，并轻轻捏了捏她的肚子。她只以呻吟作为回应。你嘱咐凯丝好好照顾乌尔塔，然后便离开了。你知道，如果再待下去，她们的表演会让你兴奋得整个下午都留在这里，但不幸的是，你还有事情要做。[pg]");
         get_player().orgasm("Vaginal");
         var _loc1_:IMap = KFLAGS.flags;
         FlagDict_Impl_.arrayWriteInt(_loc1_,12,FlagDict_Impl_.arrayReadInt(_loc1_,12) + 1);
         FlagDict_Impl_.arrayWriteInt(KFLAGS.flags,13,8 + Utils.rand(2));
         if(get_game().time.hours >= 13)
         {
            FlagDict_Impl_.arrayWriteInt(KFLAGS.flags,1225,2);
         }
         doNext(get_camp().returnToCampUseOneHour);
      }
      
      public function pinAndFuck() : void
      {
         clearOutput();
         outputText("当你走到乌尔塔的桌子旁时，她把你们俩拉过来抱了一下，并趁机把头埋在凯瑟琳的乳房之间" + (get_player().hasBreasts() ? "，然后又埋在你的乳房之间" : "") + "。你不想在桌子上操你的扶他，于是你扯了扯乌尔塔的耳朵引起她的注意，并指了指其中一个空着的里屋。喝醉的狐狸扶他站起身，摇摇晃晃地走向门口，双臂搂着你们俩。这不是为了支撑，而是为了能摸遍你们身上所有她最喜欢的部位。在乌尔塔的另一边，你可以看到凯丝在乌尔塔按摩她尾巴根部时露出了微笑。[pg]");
         outputText("你们三个一进房间，乌尔塔就变得主动起来。她把你和凯丝都推到墙上，开始试图扒掉你们的衣服。当她专注于" + get_katherine().clothesChoice("解开凯丝的衬衫扣子","把手伸进凯丝的紧身衣里","解开凯丝裙子的系带","把长袍从凯丝的肩膀上扯下来","把有弹性的抹胸从凯丝头上脱下来","把手伸进护士服里摸凯丝的乳房") + "时，你决定今天不能让乌尔塔掌握节奏。[pg]");
         outputText("你扫堂腿绊倒她，她侧身倒在你的怀里。你把她转过来，将乌尔塔面朝下按在地板上，并且");
         if(get_player().isTaur())
         {
            outputText("把你的肚子压在");
         }
         else
         {
            outputText(get_player().hasTailInsteadOfLegs() ? "迅速用尾巴缠住" : "跪在");
         }
         outputText("她俯卧的身体上。她调皮地低吼着，扭动着身体，试图从你的擒拿中挣脱出来。你回头一看，发现凯丝已经迅速脱掉了衣服。她那跳动的肉棒" + get_katherine().cockMultiple("骄傲地挺立","骄傲地挺立") + "在凉爽的空气中。[pg]");
         outputText("你掀起乌尔塔的裙子，告诉凯丝她的队长需要一些帮助。当你拉开乌尔塔的内裤时，她高兴地拍着手。乌尔塔在下面喊道：[say: 不！轮到我了。把小穴露出来，该死的。]当凯丝的龟头" + get_katherine().cockMultiple("擦过她的小穴时，她浑身发抖，那里","擦过她的阴道口和紧致的括约肌时，她浑身发抖。凯丝把手伸到乌尔塔身下，从她滴着水的马鸡巴尖上舀了一点先列腺液，抹在乌尔塔的屁眼上。乌尔塔的小穴不需要这样的关照，它") + "已经闪闪发光了。[pg]");
         outputText("凯丝温柔地转过你的头，给了你一个吻，然后将自己插入了她的队长体内。当她的身体被凯丝的" + get_katherine().cockMultiple(get_katherine().cockType("犬科","不寻常的猫科") + "肉棒","，不止一次而是两次") + "侵入时，乌尔塔呻吟着。你捏了捏凯瑟琳的乳头，告诉她乌尔塔需要粗暴的对待。乌尔塔喘着粗气抬起头，但她没有反对。凯丝的手指环绕着乌尔塔的腰，开始像一匹野马一样操她。有些冲刺的力度很大，以至于乌尔塔在地板上移动。[pg]");
         outputText("在凯丝高潮之前，乌尔塔闷哼了一声，身体紧绷，一阵喷涌的声音告诉你，她刚刚在内裤里射了大量精液。看来你开出的一剂猛烈操干的处方是对的，乌尔塔一定很需要这个。高潮过后，她无法动弹，更不用说逃跑了，所以你站起来鼓励凯丝，告诉她填满这个狐狸荡妇");
         if(get_urta().pregnancy.get_isPregnant() && get_urta().pregnancy.get_type() != 26 && get_urta().pregnancy.get_type() != 15)
         {
            outputText("。她那大肚子里已经怀着一个孩子了，所以凯丝一定知道乌尔塔有多喜欢精液。乌尔塔拍了拍她的肚子，说道：[saystart]也许还能再装一个");
         }
         else
         {
            outputText("——她需要一个装满种子的子宫。乌尔塔笑着说：[saystart]" + (FlagDict_Impl_.arrayReadInt(KFLAGS.flags,723) > 0 ? "是啊，填满我吧，也许你能当爸爸呢" : "哦，求你了，填满我吧。太舒服了"));
         }
         outputText("。[sayend]凯瑟琳没花多长时间就给了乌尔塔她想要的。凯丝的肉结" + get_katherine().cockMultiple("肿胀起来，伴随着最后一次用力的冲刺，她把它强行塞进了乌尔塔被蹂躏的小穴里","肿胀起来，伴随着最后一次用力的冲刺，她把它们强行塞进了乌尔塔被撑开的洞里") + "。[pg]");
         outputText("这看起来真他妈的棒，乌尔塔的肚子变得" + (get_urta().pregnancy.get_isPregnant() ? "比以前更大了，她的怀孕被" : "越来越大，试图容纳") + "她体内那海洋般的精液。乌尔塔的整个下半身和她的裙子都被她自己的精液浸透了，现在同样大量的精液正在她体内晃荡。她的" + (get_katherine().hasBalls() ? "蛋蛋被榨干了" : "前列腺空了") + "，凯丝瘫倒在乌尔塔身上，给了她一个拥抱。[pg]");
         outputText("你的手指上下抚摸着");
         if(get_player().hasCock())
         {
            outputText("你的肉棒");
         }
         else if(get_player().hasVagina())
         {
            outputText("你的小穴");
         }
         else
         {
            outputText("你双腿间光秃秃的肉");
         }
         outputText("，看着你的伴侣们。凯瑟琳钻探乌尔塔的景象让你欲火焚身" + (get_player().hasCock() && get_player().hasVagina() ? "，你只需要弄清楚你要怎么做。你的两个爱人都精疲力尽且心满意足，所以该由谁来接受你的关照，这还是个未知数。" : "，现在是你尽情享受的时候了。"));
         get_katherine().katherineAndUrtaHadSex(true);
         get_katherine().orgasm();
         get_urta().urtaLove(1);
         menu();
         if(get_player().hasCock())
         {
            addButton(0,"填满凯丝",pinAndFuckStuffKath);
         }
         else
         {
            addButtonDisabled(0,"填满凯丝","这个场景需要你有一根肉棒。");
         }
         addButton(1,"骑乘乌尔塔",pinAndFuckMountUrta);
      }
      
      public function orgy() : void
      {
         clearOutput();
         outputText("你试图把她们拉到后面的一个房间里，但为时已晚。乌尔塔亲吻了凯丝，凯丝则解开了乌尔塔的腰带作为回应。她那巨大的肉棒在重获自由的过程中拍打到了桌子底部。那声低沉的木头“咚”声让酒吧里的大部分人都安静了下来，所有人都看向你们这边，想看看发生了什么事。[pg]");
         outputText("乌尔塔醉得太厉害了，根本不在乎她的肉棒正勃起着在空气中自由挥舞。凯丝更不在乎别人怎么想，她慢慢地把手顺着乌尔塔的肉棒滑下，从龟头一直摸到根部。乌尔塔在她的抚摸下颤抖着，迅速解开了" + get_katherine().clothesLowerChoice("凯丝的衬衫","凯丝的衬衫","凯丝紧身衣的上半部分","凯丝裙子上的系带","凯丝长袍的前襟") + "，释放出她" + get_katherine().get_breasts().adj() + "的乳房。[pg]");
         outputText("乌尔塔的下一步动作是抓住你的手，扭转你的手臂，把你拉到她和凯丝共用的座位旁边。至于凯丝，她脱下了剩下的衣服，然后开始急切地摸索你的");
         if(get_player().hasCock())
         {
            outputText("胯部");
         }
         else
         {
            outputText(get_player().hasBreasts() ? "乳房" : "屁股");
         }
         outputText("。");
         outputText("[pg]乌尔塔再次拉住你的手，把它放在她湿润的阴道上，低吼道：[say:我想要你——我想要你们俩，]然后用力吸吮凯丝的一个乳头。[pg]");
         outputText("凯丝叹了口气，用尾巴缠住你的腿。[say:是啊，让我们给他们点谈资吧。][pg]");
         outputText("乌尔塔抬起头，环顾四周，意识到有多少人正盯着这场正在发展的三人行。有那么一瞬间，她看起来像是要逃跑，但随后凯丝发出一声诱惑的低吼，再次开始抚摸乌尔塔的肉棒。乌尔塔闭上眼睛，屈服于这种公开的欲望和醉意展示。[pg]");
         outputText("在你们周围，到处都是解开带扣、解开系带以及布料从肉体、皮毛和鳞片上滑落的声音。这件事开始时周围有相当多的顾客，除了少数几个人外，所有人都很想看——至少是这样。[pg]");
         var _loc1_:Boolean = FlagDict_Impl_.arrayReadInt(KFLAGS.flags,119) > 0 && get_game().time.hours >= 12 && get_game().time.hours <= 21;
         if(_loc1_)
         {
            outputText("你发现了瓦拉，她还端着这件事开始前的一盘饮料。通常她跑得够快，能避开这种事，但当她看到你、凯丝和乌尔塔在一起时，她惊得下巴都掉下来了。有人撞了她一下，她飞得更近了，把托盘放在桌子上。");
            if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,1237) > 0)
            {
               outputText("你笑了笑，知道瓦拉对群交这种无害的事情并不反感。[pg]");
            }
            else
            {
               outputText("你勉强笑了笑，正想着该怎么解释这一切，但瓦拉只是放下托盘，凑了过来。[pg]");
               outputText("[say: 嗨，[name]，]她欢快地说，[say: 我看到你带了个朋友来。你也是救了她吗？][pg]");
               outputText("凯丝停下和乌尔塔的亲吻，说道：[say: 呃……算是吧，]然后乌尔塔又把她拉回了吻中。[pg]");
               outputText("[say: 听起来真像我的英雄，]瓦拉咧嘴笑着说。[say: 哦，我是瓦拉，]她补充道，伸出一只手。凯丝惊讶地握了握她的手。[pg]");
               outputText("你告诉瓦拉这是凯瑟琳。你听到两个" + (get_katherine().hasCock() ? "扶他" : "爱人") + "紧贴的嘴唇间传来一声含糊的[say: 嗨]。[pg]");
            }
         }
         outputText("之后事情就一发不可收拾了。你忘记了时间，也分不清谁是谁。当然，你、凯瑟琳" + (_loc1_ ? "、乌尔塔和瓦拉" : "和乌尔塔") + "往往是全场的焦点，但还有一大群其他人也参与其中。你确信有些额外的参与者是从街上进来的。一个多小时后，你发现自己躺在一滩慢慢变凉的精液中。[pg]");
         if(get_player().hasVagina())
         {
            outputText("你、凯丝" + (_loc1_ ? "、乌尔塔和瓦拉" : "和乌尔塔") + "都");
         }
         else
         {
            outputText("凯丝" + (_loc1_ ? "、乌尔塔和瓦拉都" : "和乌尔塔都"));
         }
         outputText("挺着塞满精液的巨大肚子——还有很多人也是如此。[pg]");
         outputText("你累得动弹不得，脑海中回放着一些精彩瞬间：一个被绑带束缚的巨大牛头人正急切地吸吮着一个兔兽人的阴茎，吞下了她所有的精液");
         if(_loc1_)
         {
            outputText("……瓦拉让凯丝大吃一惊，她" + (get_katherine().hasCock() ? "坐到她" + get_katherine().cockAdj() + "肉棒上，然后把整根肉棒连同肉结一起吞进了她娇小的身体里" : "钻到她双腿之间，吸吮着凯丝的阴蒂，同时把整只手塞进凯丝滴水的阴道里"));
         }
         outputText("……一个大腹便便的怀孕蛛化精灵正用拳头操着一个半人马，同时把她的卵强行塞进一个看起来很急切的犬兽人体内……一个只有4英尺4英寸高的小蜘蛛女孩，连续接纳了三个巨大的马" + (get_noFur() ? "人" : "兽人") + "，她的甲壳嘎吱作响，肚子膨胀得远超正常极限……一个看起来像恶魔的女人，沉浸在狂喜中，吸吮着两根狗阴茎，把精液撸到自己身上，同时骑在乌尔塔巨大的肉棒上……当然，还有凯瑟琳");
         if(get_player().hasCock())
         {
            outputText("深喉你的肉棒");
         }
         else
         {
            outputText(get_player().hasVagina() ? "舔你的小穴" : "用拳头操你的屁股");
         }
         outputText("的时候，她正趴在桌子上，被乌尔塔从后面操着。[pg]");
         if(_loc1_)
         {
            outputText("瓦拉设法把自己从黏糊糊的地板上拔了出来。她的翅膀湿漉漉地拍打着，把精液溅得吧台到处都是。她给了你一个吻，然后转身去查看凯瑟琳和乌尔塔。[say: 你可真知道怎么开派对，]她说着，按压着自己的肚子，挤出一些精液。[pg]");
            outputText("她环顾酒吧里倒下的人群，说道：[say: 这要花很长时间才能清理干净，不过天哪，这绝对值得。]她给了你们每个人一个吻，然后摇摇晃晃地走向放清洁用品的柜子。[pg]");
            outputText("凯丝对着地板嘟囔着：[say: 值得，]然后似乎晕了过去。[pg]");
            get_katherine().katherineAndValaHadSex();
         }
         outputText("乌尔塔扶着房间里的一根柱子站直身子，打量着现场的惨状。[say: 我得把这事处理好。哦，是的，这很值得，但现在我得把这一切都掩盖过去。哎呀。][pg]");
         outputText("她把一件沾着精液的衣服扔给你，说道：[say:你应该离开这里，[name]。别担心，我会处理好的。]她用脚戳了戳凯瑟琳，补充道：[say:再说，凯丝还需要再学习一下守卫队的文书工作。][pg]");
         outputText("[say:啊——不要文书工作，]当你挥手告别并逃出门外时，凯丝呻吟道。");
         get_player().orgasm("Generic");
         get_katherine().orgasm();
         get_katherine().katherineAndUrtaHadSex(true);
         var _loc2_:IMap = KFLAGS.flags;
         FlagDict_Impl_.arrayWriteInt(_loc2_,12,FlagDict_Impl_.arrayReadInt(_loc2_,12) + 1);
         FlagDict_Impl_.arrayWriteInt(KFLAGS.flags,13,10 + Utils.rand(2));
         get_urta().urtaLove(1);
         if(get_game().time.hours >= 13)
         {
            FlagDict_Impl_.arrayWriteInt(KFLAGS.flags,1225,2);
         }
         doNext(get_camp().returnToCampUseTwoHours);
      }
      
      public function knothole() : void
      {
         clearOutput();
         outputText("乌尔塔挠了挠凯丝的耳后，提议溜进后面的一个房间。你们刚进去，凯丝就脱掉衣服扑向乌尔塔。乌尔塔毫无防备，但她丰富的战斗经验足以应付喝醉的凯丝。乌尔塔笑着，轻松制服了这只发情的" + get_katherine().catGirl("猫娘","猫科动物") + "。凯瑟琳开始挣扎，于是乌尔塔扫倒她的双腿，将她按在地板上，问她会不会乖乖听话。[pg]");
         outputText("凯丝嘟囔着：[say: 会，]但还是试图挣脱。[pg]");
         outputText("乌尔塔叹了口气，抬头看着你，那表情仿佛在问“她什么时候才能学乖？”她把凯丝的手臂扭到背后，但这依然没能阻止她挣扎。接着，乌尔塔暗自窃笑。她把凯丝拖向地板上的一个大节孔。[say: 打算配合了吗？]她问这只挣扎的猫" + get_katherine().catGirl("娘","形态") + "。[pg]");
         outputText("[say: 不！我要操你，]凯丝说。[pg]");
         outputText("乌尔塔把她往前推了一点，腾出一只手，调整凯瑟琳的" + get_katherine().cockMultiple("","下方的") + "肉棒对准那个孔。凯丝对" + get_katherine().cockMultiple("她的肉棒","她的一根肉棒") + "周围突然出现一个开口感到非常惊讶，以至于她停止了挣扎。乌尔塔趁机分开凯丝的双腿，将她剩下的长度全部塞进孔里。[pg]");
         outputText("[say: 不公平，]凯丝嘟囔着，试图爬起来却失败了。[pg]");
         outputText("[say: 你该开始守规矩了，]乌尔塔说。她坐在凯丝的屁股上，导致她的尾巴拂过凯丝的尾巴。凯丝扭动着，但你可以看到她双腿之间，那个肉结开始肿胀起来。[pg]");
         outputText("凯丝睁大眼睛。[say: 你不会的！][pg]");
         outputText("[say: 不会什么？]乌尔塔用最无辜的语气问道。[pg]");
         outputText("[say: 求你别让我结扎！]凯丝说，试图用力挣扎把这只狐狸甩下去。[pg]");
         outputText("乌尔塔伸手揉捏" + (get_katherine().hasBalls() ? "凯丝的蛋蛋" : "凯丝肉棒的根部") + "。[say: 我觉得你现在问我这个有点晚了，]乌尔塔回答。凯丝呻吟着，用拳头捶打地面。困住这只猫" + get_katherine().catGirl("娘","形态") + "后，乌尔塔站起身牵起你的手。她把你带到门对面的角落，在那里凯丝可以看着你们俩。[pg]");
         outputText("乌尔塔对着被俘虏的小猫邪恶地笑了笑，然后开始缓慢而诱惑地脱下自己和你的衣服。当她的手指滑过你赤裸的背部时，她低声说：[say: 我们分享怎么样？这里有足够的小穴供我们俩享用。][pg]");
         outputText("她转过身，沉重的马屌在空气中自由地左右摇晃。她走到凯丝身后，将几根手指插入凯丝的小穴。凯丝叹了口气，尾巴左右甩动。过了一会儿，乌尔塔抽出手指舔了舔。[say: 嗯，你尝起来确实准备好了。那么你今天想高潮吗？][pg]");
         outputText("[say: 要。要，拜托了，]凯丝乞求着，双腿张得比除了猫" + get_katherine().catGirl("娘","形态") + "以外的任何人都开。乌尔塔撸了几下她的马屌，积攒了一层厚厚的先列腺液，然后把它压在凯丝滴水的阴户上。她慢慢地把它推入，每次只推入一英寸，让凯丝欲仙欲死。[pg]");
         outputText("你可以看到乌尔塔眼中逐渐升起的欲望。凯丝紧致的通道带来的感觉会让她很快高潮，所以你决定是时候加入进去了。你所要做的就是");
         if(get_player().isTaur())
         {
            outputText("站在");
         }
         else
         {
            outputText(get_player().hasTailInsteadOfLegs() ? "滑行到" : "跪在");
         }
         outputText("凯丝面前，并展示");
         if(int(get_player().cocks.length) > 0)
         {
            outputText((int(get_player().cocks.length) > 1 ? "你的一根肉棒" : "你的肉棒") + "。凯丝急切地吸吮着顶端，");
         }
         else
         {
            outputText("你的小穴。凯丝把脸贴在你的胯部，");
         }
         outputText("她粗糙的舌头爱抚着你。[pg]");
         outputText("你开始挠凯丝敏感的耳朵，她变得狂野起来。她抓住你的臀部，把自己拉得更近，" + (int(get_player().cocks.length) > 0 ? "她的牙齿锁住你肉棒的根部" : "好像她的舌头试图够到你的子宫颈") + "。[pg]");
         outputText("乌尔塔喘着粗气，加快了抽插的速度。每次她把自己埋进凯瑟琳的小穴里，" + (int(get_player().cocks.length) > 0 ? "你的肉棒就会在凯丝的喉咙里更深一点" : "你体内的舌头就会下降得更深一点") + "。然后乌尔塔的臀部停了下来，她向后仰起头，在她的伴侣体内深处高潮了。你不得不直起身子，因为凯丝的身体被她膨胀的肚子抬离了地板。[pg]");
         outputText("乌尔塔瘫倒在凯丝的背上，虚弱地抱着她，手指捏着凯丝的乳头。凯丝饥渴的舌头只停顿了片刻。她的肌肉紧绷，你怀疑下面的地窖里正在覆盖上一层厚厚的凯丝的精液。然后这只醉醺醺的猫娘加倍努力地让你高潮。[pg]");
         outputText("多亏了你面前的场景，你已经快到了，所以你只是稍微用力地揉了揉凯丝的耳朵，顺其自然。凯丝对你高潮的量并不感到惊讶" + (int(get_player().cocks.length) > 0 ? "，尽管她的肚子肿胀，但还是急切地把它全部吞下" : "并急切地舔舐你的小穴，吸干每一滴") + "。当你结束后，她退后一步，抬头看着你，咧嘴笑着。[pg]");
         outputText("你们都纠缠在一起躺在那里，精疲力尽而又快乐。乌尔塔是第一个恢复过来的，她轻轻地转过凯瑟琳的头，给了她一个长长的吻。她对你笑了笑，说道：[say: 再次感谢你介绍我们俩认识，[name]。现在你回你的营地去，我来照顾这只被困住的小猫，怎么样？][pg]");
         outputText("你穿好衣服，看着这两个扶他依偎在一起。看着乌尔塔那样抚摸凯丝沉甸甸的肚子，你不得不怀疑你那发情的狐狸是不是已经在考虑第二回合了。如果是的话，你知道凯瑟琳是不会抱怨的。[pg]");
         get_player().orgasm("Generic");
         get_katherine().orgasm();
         get_katherine().katherineAndUrtaHadSex(true);
         var _loc1_:IMap = KFLAGS.flags;
         FlagDict_Impl_.arrayWriteInt(_loc1_,12,FlagDict_Impl_.arrayReadInt(_loc1_,12) + 1);
         FlagDict_Impl_.arrayWriteInt(KFLAGS.flags,13,2 + Utils.rand(2));
         get_urta().urtaLove(1);
         if(get_game().time.hours >= 13)
         {
            FlagDict_Impl_.arrayWriteInt(KFLAGS.flags,1225,2);
         }
         doNext(get_camp().returnToCampUseOneHour);
      }
      
      public function kathLicksOutUrta() : void
      {
         clearOutput();
         outputText("当乌尔塔玩弄凯丝的耳朵时，凯丝开始抽搐和喘息，这导致她开始抚摸乌尔塔的尾巴。很快，桌子底下传来一声低沉的“砰”声，让你知道乌尔塔有多么欣赏这种关注。没有必要介入，所以你对乌尔塔笑了笑，向后靠去。你以后可以和她们中的任何一个玩得开心，而现在你很满足于看着，看看随着" + (get_katherine().hasCock() ? "扶她们" : "女孩们") + "越来越兴奋，事情会如何发展。[pg]");
         outputText("当乌尔塔松开手，在座位上挪动身体时，好戏开场了。显然，她的肉棒变得足够坚硬，让她的姿势变得不舒服。凯丝从略微茫然的状态中眨了眨眼，给了你一个邪恶的笑容。在乌尔塔注意到或做出反应之前，凯丝钻到了桌子底下，乌尔塔的眼睛睁得大大的。她的手猛地抓住椅子，稳住自己，因为你听到下面传来湿润的布料滑动的声音。[pg]");
         outputText("[say: 哦——哦，是的——真是只乖猫咪，你想照顾我的肉棒吗？]乌尔塔呻吟着，向后仰起头。[pg]");
         outputText("你听到桌子底下传来凯丝的回答：[say: 嗯……才不要！]接着是一阵窃笑。一条细长的黑色尾巴在你面前来回甩动，拂过你的腰际。乌尔塔紧紧抓住椅子边缘，咬住嘴唇。不管凯丝在做什么，显然让乌尔塔感觉很爽。[pg]");
         outputText("你弯下腰想看个究竟。凯丝完全无视了乌尔塔的肉棒。她拉下乌尔塔的内裤，把脸埋在乌尔塔的小穴里。乌尔塔的马屌依然被遮盖着，紧紧顶在桌子下面。你坐直身子，迎上乌尔塔充满情欲的目光，无辜地问她高潮时精液会喷到哪里。[pg]");
         outputText("乌尔塔摇摇头，试图驱散情欲的迷雾，好采取点措施。她手忙脚乱地摸出一个避孕套，但凯丝做了些调皮的举动，让她把包装掉在了地上。乌尔塔尴尬地低声说：[say: 只要……只要给我戴上套子就好。求你了，凯丝。我会喷得到处都是的。][pg]");
         outputText("桌子底下唯一的回答是一声长长低沉的[say: 嗯……]乌尔塔猛地闭上嘴，眼神迷离。她放弃了阻止凯丝的念头，双手移到大腿上，显然是把这只性感小猫的头按向自己的胯部。[pg]");
         outputText("乌尔塔坚持的时间比你预想的要长，但她无法永远抵挡凯丝灵巧的舌头。她喘息着，你听到桌子底下传来湿润的飞溅声。随着乌尔塔的蛋蛋释放出积蓄已久的精液，这声音持续不断。酒吧里的大部分人都在看她，但乌尔塔毫无察觉。随着凯丝的舌头试图探得更深，她一次又一次地痉挛。终于，一切结束了，伴随着精液滴落在地板上的声音，乌尔塔嘟囔着：[say: 真棒。][pg]");
         outputText("凯丝从桌子底下钻出来，满头都是精液。她迅速用舌头和餐巾纸清理干净自己，然后看着乌尔塔。[say: 哎呀，我觉得我把她玩坏了，]她醉醺醺地咯咯笑着。嘿，" + get_katherine().playerText() + "，趁这个“一发男”恢复的时候，你想不想找点乐子？[pg]");
         outputText("[say: 不公平，]乌尔塔虚弱地嘟囔着。[pg]");
         dynStats(DynStat.Lust(20 + get_player().lib / 20));
         get_katherine().katherineAndUrtaHadSex(true);
         var _loc1_:IMap = KFLAGS.flags;
         FlagDict_Impl_.arrayWriteInt(_loc1_,12,FlagDict_Impl_.arrayReadInt(_loc1_,12) + 1);
         FlagDict_Impl_.arrayWriteInt(KFLAGS.flags,13,2 + Utils.rand(2));
         get_urta().drainedByKath = true;
         doNext(get_katherine().katherineSex);
      }
      
      public function get_urta() : UrtaScene
      {
         return get_game().urta;
      }
      
      public function get_katherine() : Katherine
      {
         return get_telAdre().katherine;
      }
      
      public function get_edryn() : Edryn
      {
         return get_telAdre().edryn;
      }
      
      public function fistKathAndVala() : void
      {
         valaCommonStart();
         outputText("你让瓦拉坐下，给你一点时间。她拉出一张看起来饱经风霜的凳子坐下，双腿张得大大的，手指放在乳头上，让淫液不断流出。[pg]");
         outputText("接下来你来对付这只发情的小猫。你走到凯丝身后，用双臂环住她赤裸的身体，挑逗她的乳头，上演了一场好戏。瓦拉发出一声赞赏的[say:嗯，是的，]看着你把凯丝的欲望推向顶点。当凯丝融化在你的怀里，放弃了任何控制的希望时，你把她拖到另一把破旧的椅子上，让她坐下。[pg]");
         outputText("你抓住瓦拉的座位，把座位和轻盈的妖精都拉近，这样她和凯丝就并排坐着了。在她们的状态下，靠近就足够了；两个女孩靠在一起，双唇紧锁。你等她们被彼此交锋的舌头分散注意力，然后同时将手指滑入她们火热湿润的阴唇之间。慢慢地，轻轻地，你每只手滑入越来越多的手指，在她们的头分开之前，除了大拇指，你把所有的手指都塞了进去。[pg]");
         outputText("[say:[name]？]瓦拉问，[say:你难道不打算……打算……哦！]你永远不会知道她想说什么。你灵巧的手指让她忙个不停，直到凯丝决定她不想再等了。她抓住瓦拉的头，把她拉过来又是一个吻。[pg]");
         outputText("瓦拉回去继续接吻，但她的手却摸到了凯瑟琳的尾巴。它一直在来回甩动，有时还会缠绕在瓦拉的腰上，但现在这个妖精开始用她纤细的手指挑逗尾尖。凯丝呻吟了一声，" + (get_katherine().hasCock() ? "她那被冷落的阴茎随着心跳颤动着" : "她的整个身体因为这突如其来的刺激而颤抖") + "。[pg]");
         outputText("既然瓦拉不按规矩出牌，凯丝便将手滑过妖精敏感的乳头，然后绕到瓦拉身后，开始按摩她翅膀根部附近的肌肉。[pg]");
         outputText("两个女孩都在尽其所能地让对方发狂，她们的小穴已经完全湿透了。你觉得她们已经足够松弛了，于是你弯曲手指和拇指，将手掌推入她们每个人的体内。她们的肉体刚好退让，当女孩们再次停止接吻时，她们低头看到你的手已经没入到了手腕处。[pg]");
         outputText("[say: 轻点，] 凯丝乞求道，但你根本不听。你知道这些女孩喜欢什么，你在她们体内来回扭动拳头，指关节滑过她们敏感的神经。她们停止了争论，仰起头。只有凯丝死死抱住瓦拉，才没让她们俩从椅子上掉下来。[pg]");
         outputText("瓦拉松开了凯丝的尾巴，回抱住她，沉浸在狂喜之中。凯丝和瓦拉互相玩弄着对方的身体，让你大饱眼福，但你把大部分注意力都集中在塞进她们体内的手指所传来的感觉上。[pg]");
         outputText("你摸索出她们最喜欢的位置，然后等待，直到你确信她们都处于高潮的边缘。然后你接连不断地刺激所有敏感点，作为回报，两个小穴紧紧夹住了你的拳头。女孩们抽搐着、颤抖着，一次又一次的高潮席卷了她们的身体。");
         if(get_katherine().hasCock())
         {
            outputText("凯丝的阴茎" + get_katherine().cockMultiple("","s") + "，你一直没管它，" + get_katherine().cockMultiple("突然勃起，喷射出","突然勃起，喷射出") + "一大股精液，溅了你和周围一身。");
         }
         outputText("[pg]在喘息和娇喘之后，两个女孩都恢复了说话的能力，并对你刚才带给她们的体验连连道谢。");
         outputText("瓦拉的眼中闪过一丝狡黠的光芒。");
         valaCommonPostSex(false);
         outputText("在你抽出手并清理干净后，你注意到凯丝把瓦拉拉到了她的腿上，只是抱着她。瓦拉对你微笑，仿佛世界上的一切都很美好，你在离开前分别给了她们一个吻。");
         dynStats(DynStat.Lust(10 + get_player().lib / 20));
         get_katherine().orgasm();
         get_katherine().katherineAndValaHadSex();
         var _loc1_:IMap = KFLAGS.flags;
         FlagDict_Impl_.arrayWriteInt(_loc1_,1215,FlagDict_Impl_.arrayReadInt(_loc1_,1215) + 1);
         doNext(get_camp().returnToCampUseOneHour);
      }
      
      public function eatOutVala() : void
      {
         valaCommonStart();
         outputText("你把瓦拉拉进怀里，然后拉着她后退，走向凯丝。瓦拉没有注意到你在做什么，凯丝退到了墙边。你继续移动，把瓦拉压在凯丝身上。她们俩都无处可去，你感觉到凯丝的肉棒尖端" + get_katherine().cockMultiple("","s") + "从瓦拉的双腿间探了出来。[pg]");
         outputText("完美！你分别给了她们一个吻，然后用双手抓住瓦拉的屁股，把她从地上举起来，尽可能地掰开她的臀瓣。你告诉凯丝把她的" + get_katherine().cockMultiple("","双") + get_katherine().cockType() + "肉棒" + get_katherine().cockMultiple("","s") + "对准瓦拉的屁股，但瓦拉最先做出了反应。以你所期望的妖精的速度和敏捷，她握住凯丝的肉棒" + get_katherine().cockMultiple("，在柱身上涂抹了一些先列腺液，并将其","s，在柱身上涂抹了一些先列腺液，并将它们") + "对准了她的屁股。[pg]");
         outputText("你把她放下来，当凯丝的肉棒" + get_katherine().cockMultiple("猛插","猛插") + "进去时，瓦拉叹了口气。你握住凯瑟琳的手，把它们放在瓦拉纤细的腰上，告诉凯丝狠狠地操她，瓦拉受得了。[pg]");
         outputText("瓦拉扭动着身体，把双腿锁在凯丝身后。她开始乞求，[say:是的，填满我，使用我！把你的全部都给我！]你等她们找到了节奏，然后弯下腰，把舌头伸进瓦拉空虚的小穴里。当你舔舐她甜美的花蜜时，她大声叫了出来。[pg]");
         outputText("当瓦拉开始高潮时，你退后了，让她的身体在高潮的影响下扭动翻滚。你站起来，抓住凯瑟琳的肩膀，把她引向一张桌子。她正全神贯注地操着瓦拉，以至于你想要什么她都顺从。[pg]");
         outputText("她们到了桌边，你把她们推上前。如果你不知道瓦拉有多坚韧，你会担心凯丝会把她压碎。相反，你听到猫" + get_katherine().catGirl("娘","人") + "身下传来呻吟声，瓦拉继续高潮着。[pg]");
         outputText("但你感兴趣的不是瓦拉。相反，你把舌头伸进了凯丝的小穴里，直到现在它都被忽视了。你发现它已经成熟，她的淫液滴落下来，顺着大腿流下。凯丝已经准备好被采摘了，你很乐意效劳。[pg]");
         outputText("当你的舌头滑过她的阴蒂时，你感觉到你头顶上方的肉结" + get_katherine().cockMultiple("","s") + "涌起一股热流。凯丝猛地撞进瓦拉体内，她的" + (get_katherine().hasBalls() ? "睾丸" : "前列腺") + "开始工作，将咸咸的馅料注入瓦拉的屁股里。随着瓦拉的肚子越来越大，她们俩都被抬离了桌子。[pg]");
         outputText("最先恢复过来的是瓦拉，她说，[say:感觉太好了。]她把手放在摇晃的肚子上，揉着凸起的肚脐。");
         valaCommonPostSex(get_katherine().hasCock());
         outputText("凯丝翻了个身，仰面躺着，瓦拉直挺挺地坐在她身上。瓦拉对你笑了笑，用口型说了句[say:谢谢，]然后自己也瘫倒了，引得凯瑟琳发出一声[say:哎哟]。你留下你的情人们，走到酒吧里，直到最后一秒才想起擦掉下巴上的体液。");
         dynStats(DynStat.Lust(10 + get_player().lib / 20));
         get_katherine().orgasm();
         get_katherine().katherineAndValaHadSex();
         var _loc1_:IMap = KFLAGS.flags;
         FlagDict_Impl_.arrayWriteInt(_loc1_,1215,FlagDict_Impl_.arrayReadInt(_loc1_,1215) + 1);
         doNext(get_camp().returnToCampUseOneHour);
      }
      
      public function doubleStuffVala() : void
      {
         valaCommonStart();
         outputText("当凯瑟琳终于扯下她的胸罩时，你把她推倒在角落里的一张旧桌子上。还没等她反应过来，你就把瓦拉转过身，让她跨坐在凯丝的大腿上，她的小穴离得足够近，能感受到凯丝肉棒" + get_katherine().cockMultiple("","s") + "散发出的热量。她们俩看着对方" + (FlagDict_Impl_.arrayReadInt(KFLAGS.flags,1235) >= 8 ? "，眼中充满情欲，并试图靠得更近以便交配" : "，有些不确定——但已经欲火焚身，无法回头了") + "。[pg]");
         outputText("你拨开瓦拉的阴唇，给她带来快感，也让凯丝看个清楚。你的另一只手抚摸着凯丝的" + get_katherine().cockType() + "肉棒" + get_katherine().cockMultiple("","s") + "，感觉到瓦拉扭动着臀部，试图把自己插进去。这正是你想要的，所以你紧紧握住凯丝的肉棒" + get_katherine().cockMultiple("并引导它","，强迫龟头并拢，并引导它们") + "进入瓦拉的通道。当龟头" + get_katherine().cockMultiple("没入","没入") + "时，两个女孩都呻吟起来。然后你把手放在瓦拉的屁股上，把她向前推。凭经验你知道她的弹性有多好，果然" + get_katherine().cockMultiple("凯丝的肉棒","凯丝的两根肉棒都") + "齐根没入。[pg]");
         outputText("瓦拉的头向后仰去，你又给了她一个吻，同时双手掰开她的臀瓣。你当然不打算错过这个机会。你把你的");
         if(int(get_player().cocks.length) == 1)
         {
            outputText("肉棒抵在瓦拉的括约肌上，慢慢地插了进去。");
         }
         else if(int(get_player().cocks.length) == 2)
         {
            outputText("两根肉棒抵在瓦拉的屁股上。她训练有素的括约肌完全放松，你把两根都插了进去。");
         }
         else if(int(get_player().cocks.length) == 3)
         {
            outputText("三根肉棒抵在瓦拉的屁股上。她训练有素的括约肌完全放松，你成功地把它们都插了进去。");
         }
         else
         {
            outputText("最大的三根肉棒抵在瓦拉的屁股上。她训练有素的括约肌完全放松，你成功地把这三根都插了进去。");
         }
         outputText("感觉棒极了，尤其是你能透过瓦拉薄薄的内壁感觉到" + get_katherine().cockMultiple("凯丝的肉棒","凯丝的两根肉棒") + "。[pg]");
         outputText("尽管欲火焚身，凯瑟琳一直忍耐着，等你把肉棒" + (int(get_player().cocks.length) > 1 ? "s" : "") + "就位。现在她开始疯狂地攻击瓦拉的小穴。瓦拉天鹅绒般的内壁以一种奇妙的方式拉扯挤压着你的肉棒" + (int(get_player().cocks.length) > 1 ? "s" : "") + "，让你也开始抽插起来。[pg]");
         outputText("在你和凯丝的夹击下，瓦拉变成了一个破布娃娃。她狂喜的尖叫是她和你们一样享受这一切的唯一证明。事实上，她先高潮了。她的屁股开始榨取你的肉棒" + (int(get_player().cocks.length) > 1 ? "s" : "") + "，从凯丝脸上幸福的表情可以看出，瓦拉的小穴也给了她同样的享受。[pg]");
         outputText("你抓住瓦拉纤细的臀部，把她猛地拉下，套弄你的肉棒" + (int(get_player().cocks.length) > 1 ? "s" : "") + "。凯丝的手拍在你的手上，她也做了完全相同的事情。在里面，你感觉到凯丝的肉结" + get_katherine().cockMultiple("","s") + "膨胀到最大尺寸，就在第一股精液喷射出你的肉棒" + (int(get_player().cocks.length) > 1 ? "s" : "") + "时。[pg]");
         if(get_player().cumQ() < 1500)
         {
            outputText("你的" + (get_player().balls > 0 ? "睾丸" : "前列腺") + "必须比平时更加努力，才能将你的精液挤过凯瑟琳肿胀的肉结" + get_katherine().cockMultiple("","s") + "。这有点痛，但过了一会儿，你能感觉到一小滩精液在瓦拉的肠道里形成。[pg]");
            outputText("她的肚子被撑大了" + (get_katherine().cumQ() > get_player().cumQ() ? "——凯丝的贡献比你的多。" : "——") + "瓦拉能装下这么多东西真是不可思议。即使是正常的女人，这样的肚子也会让人觉得她怀孕了，但在瓦拉身上，它显得非常巨大。[pg]");
         }
         else
         {
            outputText("尽管凯瑟琳的肉结" + get_katherine().cockMultiple("","s") + "肿胀着，你的" + (get_player().balls > 0 ? "睾丸" : "前列腺") + "还是足以完成填满瓦拉后庭的任务。你必须对抗回流的压力，因为凯丝的" + (get_katherine().hasBalls() ? "睾丸" : "前列腺") + "在和你争夺填满这个妖精服务员的权利。[pg]");
            outputText("可以说你们俩都赢了，而瓦拉输了。她的肚子被撑得比你想象的还要大。到最后，她看起来就像怀了一只半人马小马驹。[pg]");
         }
         outputText("[say:哦，是的，]瓦拉虚弱地说，[say:感觉太好了。]她把手放在摇晃的肚子上，揉着凸起的肚脐。[say:我觉得和你们俩好亲近，]她说着，如梦似幻地越过肩膀看着你们。[pg]");
         valaCommonPostSex(get_katherine().hasCock());
         outputText("当然，她是对的。你穿好衣服，在离开前只停顿了一下，在脑海中拍下瓦拉依偎在凯瑟琳怀里的画面，她的肚子仍然肿胀着，你的精液从她的屁股里滴下来。");
         get_player().orgasm("Generic");
         get_katherine().orgasm();
         get_katherine().katherineAndValaHadSex();
         var _loc1_:IMap = KFLAGS.flags;
         FlagDict_Impl_.arrayWriteInt(_loc1_,1215,FlagDict_Impl_.arrayReadInt(_loc1_,1215) + 1);
         doNext(get_camp().returnToCampUseOneHour);
      }
      
      public function doubleStuffKath() : void
      {
         clearOutput();
         get_katherine().katherineSprite(true);
         outputText("你问你的两个" + (get_katherine().hasCock() ? "扶他" : "情人") + "是否想去个更私密的地方。[pg]");
         var _loc1_:Boolean = get_player().hasKeyItem("Spare Key to Urta\'s House");
         outputText("乌尔塔" + get_katherine().clothesLowerChoice("把手顺着凯丝的大腿往上摸","把手滑进凯丝的裙底","揉捏着凯丝紧身衣裆部" + (get_katherine().hasCock() ? get_katherine().cockAdj() + "的凸起" : ""),"把手滑进凯丝的裙底","把手滑进凯丝长袍的褶皱间") + "，说道：[say:好主意。我" + (_loc1_ ? "以前的" : "") + "公寓离这儿挺近的。][pg]");
         FlagDict_Impl_.arrayWriteInt(KFLAGS.flags,1225,2);
         var _loc2_:String = get_katherine().hasCock() ? "扶他" : "女孩";
         outputText("这一路走得很有意思。乌尔塔和凯丝都需要你的搀扶，而且两人都欲火焚身。她们不断地抚摸、亲吻你，或者互相亲热。当你们到达乌尔塔" + (_loc1_ ? "以前的" : "") + "公寓时，这两个" + _loc2_ + "甚至都没走到床边。她们倒在地板上，开始撕扯对方的衣服，而你则关上了门。[pg]");
         outputText("[say:你想看我们做爱？是这样吗？]凯丝问道。[pg]");
         outputText("乌尔塔抚摸着凯瑟琳的" + (get_katherine().hasCock() ? "肉棒" : "尾巴") + "，说道：[say:是啊，[he]最喜欢" + (get_katherine().hasCock() ? "扶他了" : "看我们做爱了") + "，让我们给[him]表演一下吧！][pg]");
         outputText("乌尔塔抬起凯丝的腿，将她平坦的肉棒贴在凯丝滴着淫液的小穴上。凯丝揉捏着乌尔塔的乳房来分散她的注意力，然后" + (get_katherine().hasCock() ? "将自己的肉棒贴在" : "用手指滑过") + "乌尔塔的私处。[pg]");
         outputText("你刚脱下衣服，你的两只狐狸精就将她们的臀部狠狠地撞在了一起。那声音就像一声小小的雷鸣" + (get_katherine().hasCock() ? "。她们俩都低头看着各自的肉棒没入对方的身体" : "，她们俩似乎对这个结果都很满意") + "。[pg]");
         outputText("凯丝笑了起来。[say:" + (get_katherine().hasCock() ? "没你的位置了" : "太慢了，" + get_player().get_short()) + "，]她说道，[say:但我打赌我们还是能让你爽的。][pg]");
         outputText("乌尔塔舔了舔嘴唇，说道：[say:哦，是的，我们会让你爽翻天的。]她伸出手拉住你的手，把你拉近。她含糊不清地说道：[say:如果我在操你女人的小穴，这至少是我能做的。]她的舌头舔过" + (get_player().hasCock() ? "你的龟头，然后把它含进嘴里" : "你的小穴，然后吸吮着你的阴蒂") + "。[pg]");
         outputText("乌尔塔喝的酒一定让她放开了。她" + (get_player().hasCock() ? "把你的肉棒直接吸进喉咙，几乎没有作呕" : "像个着魔的女人一样，用舌头在你的阴蒂上滚动吸吮") + "。凯丝看起来" + (get_player().hasCock() ? "对乌尔塔深喉你的样子印象深刻" : "有些嫉妒，尽管填满她的是一根马鸡巴") + "。当乌尔塔终于退开喘口气时，凯丝高兴地喊道：[say:轮到我了！]然后" + (get_player().hasCock() ? "一口吞下了你的整根肉棒" : "扑了上去，她粗糙的舌头攻击着你的阴蒂，试图胜过她的队长") + "。[pg]");
         outputText("[say:爱显摆，]乌尔塔说道。她捏了捏凯瑟琳的乳头，引起一声低沉的呻吟，这呻吟声以一种令人愉悦的方式震动着" + (get_player().hasCock() ? "你的肉棒" : "你的小穴") + "。很快，凯丝" + (get_player().hasCock() ? "不得不松开" : "不得不松开") + "你，咳嗽着吸进一口新鲜空气。[pg]");
         outputText("在她再次" + (get_player().hasCock() ? "吞下你的肉棒" : "为你口交") + "之前，乌尔塔抓住了你的" + (get_player().hasCock() ? "肉棒，把它引向自己的嘴唇" : "臀部，把脸贴在你的腹股沟上") + "。[say:嘿！我还没完呢，]凯丝说道。她开始" + (get_katherine().hasCock() ? "将她的" + get_katherine().cockType() + "肉棒挺进乌尔塔的洞里" : "摇晃着臀部，用手指滚动着乌尔塔的蛋蛋") + "。乌尔塔闭上眼睛，任由凯丝" + (get_katherine().hasCock() ? "的抽插摇晃着" : "随心所欲地摆弄") + "她的身体，" + (get_player().hasCock() ? "她的喉咙在你的肉棒上滑动" : "她的舌头深深地钻进你的体内") + "。[pg]");
         outputText("在这两个欲求不满的" + (get_katherine().hasCock() ? "扶他" : "荡妇") + "开始争夺你的" + (get_player().hasCock() ? "肉棒" : "小穴") + "之前，你就已经欲火焚身了，这种感觉让你跪倒在地。当乌尔塔松开时，凯丝已经准备好了。只一下，她的鼻子就开始在你的肚子上摩擦，你低下头，看到她微微的笑容和饥渴的目光，她粗糙的舌头开始" + (get_player().hasCock() ? "对你的肉棒" : "在你的私处深处") + "做着不可描述的事情。与此同时，乌尔塔" + (get_katherine().hasCock() ? "提供着和凯丝一样的“服务”，" : "") + "把她的肉棒像讨债一样狠狠地砸进凯丝的小穴里。[pg]");
         if(get_katherine().hasCock())
         {
            outputText("你听到乌尔塔发出一声[say:哦！]，长长的抽插变成了短促的冲刺。看来凯丝在兴奋之中，让你的狐狸朋友结扎了。凯丝咯咯笑着说：[say:我<b>真的</b>很抱歉。]听起来一点也不真诚。乌尔塔只是咕哝了一声，试图把她那马一样的肉棒更多地塞进凯丝体内。她们俩都高潮了，你可以看着她们的肚子被填满。这两个扶他被她们的凸起强行分开，不得不花点时间从高潮中恢复过来。她们俩都揉着肚子，显然对现在的情况很满意。[pg]");
         }
         else
         {
            outputText("你听到乌尔塔发出一声[say:哦！]，她把那马一样的肉棒尽可能深地插进凯丝的小穴里。凯丝的眼神变得迷离，乌尔塔咕哝着，把凯丝按在原地，任由她的精液流淌，填满凯瑟琳的肚子，直到它变成一个" + get_katherine().catGirl("","毛茸茸的") + "西瓜的形状。这两个女孩被凯丝新鼓起的肚子强行分开，不得不花点时间从高潮中恢复过来。[pg]");
         }
         outputText("凯丝最先恢复了力气，用手肘撑起身体。她对你笑了笑，只是张开了嘴。你也回以微笑，" + (get_player().hasCock() ? "把你的肉棒喂给她" : "把你的胯部贴在她的脸上") + "，然后放松下来，享受着这缓慢的节奏" + (get_player().hasCock() ? "，凯丝舌头的触感和她喉咙的内部" : "以及凯丝舌头的触感") + "。[pg]");
         outputText("你的两个情人来回交换着你" + (get_player().hasCock() ? "的肉棒" : "") + "几次，直到你感觉自己快要高潮了。");
         if(!get_player().hasCock())
         {
            outputText("没有理由抗拒，你释放了自己，淫液顺着" + (get_player().hasTailInsteadOfLegs() ? "你尾巴的鳞片" : "你的双腿") + "滴落，冲刷着凯丝和乌尔塔。你的肌肉失去了力量，你瘫倒在地板上，躺在你气喘吁吁、大汗淋漓的爱人旁边。");
         }
         else if(get_player().cockTotal() > 1)
         {
            outputText("你把手放在她们脑后，将两人拉向你的胯部。凯丝和乌尔塔饥渴地吞吐着你的肉棒，直到她们的脸颊贴在一起。就在这时，你释放了。她们都感觉到第一股热流击中喉咙，看着两双眼睛仰望着你，你确信自己能给她们两人都提供一份分量十足的“大餐”。[pg]");
            if(get_player().cumQ() < 500)
            {
               outputText("她们都轻松地吞下了你额外贡献的精液。" + (get_katherine().hasCock() ? "与她们射进彼此小穴里的量相比，这根本不算什么。" : ""));
               if(get_player().cockTotal() > 2)
               {
                  outputText("你的另一根肉棒" + (get_player().cockTotal() > 3 ? "们" : "") + "也喷射出几股精液，溅满了凯丝和乌尔塔的身体。");
               }
               outputText("当你拔出时，她们疲惫地拥抱在一起，醉醺醺地咯咯笑着，" + (get_katherine().hasCock() ? "比较着彼此肿胀的肚子" : "乌尔塔自豪地抚摸着凯丝肿胀的肚子") + "。");
            }
            else if(get_player().cumQ() < 1500)
            {
               if(get_katherine().hasCock())
               {
                  outputText("你的两个情人都有些艰难地吞下你的精液。多亏了对方的努力，她们的肚子都已经饱饱的了。她们把精液全部吞下，但之后都捧着圆滚滚的肚子，揉着腰侧，试图缓解压力。");
               }
               else
               {
                  outputText("乌尔塔轻松地吞下了你的精液；而凯丝的肚子因为乌尔塔的努力已经满满当当，吞咽起来就困难多了。她们把精液全部吞下，但之后凯丝捧着她撑得过饱的肚子，乌尔塔则按摩着她的腰侧，试图缓解压力。");
               }
               if(get_player().cockTotal() > 2)
               {
                  outputText("你意识到你空闲的肉棒" + (get_player().cockTotal() > 3 ? "们" : "") + "把精液喷得满屋子都是，给乌尔塔之后要清理的烂摊子又添了一笔。");
               }
               outputText("乌尔塔看看你，又看看凯丝，再看看你，只是对自己的欲望所导致的局面一笑置之。");
            }
            else
            {
               if(get_katherine().hasCock())
               {
                  outputText("在你的精液带来的额外压力下，乌尔塔的肚子开始膨胀。凯丝的肚子也是，但因为没有肉结堵着，乌尔塔的精液开始大量漏出。乌尔塔发出一声担忧的[say: 唔唔]声，但你正忙着填满她们，停不下来。她向后仰去，肚子大得甚至长出了一些妊娠纹。");
               }
               else
               {
                  outputText("乌尔塔的肚子开始膨胀，你的精液很快就让她的肚子变得和凯丝一样圆润。凯丝的肚子也微微隆起，但在额外的压力下，乌尔塔的精液开始大量漏出。");
               }
               if(get_player().cockTotal() > 2)
               {
                  outputText("你的另一根肉棒" + (get_player().cockTotal() > 3 ? "们" : "") + "释放出如洪流般的精液，溅满了凯丝、乌尔塔、地板和几面墙壁。虽然弄得很脏，但你确信你的两个情人都很高兴至少你的一部分精子没有射进她们体内。");
               }
               outputText("[pg]结束后，你拔出肉棒，凯丝看着乌尔塔假孕的样子咯咯直笑。[say: 太撑了，]乌尔塔沙哑地说。" + (get_katherine().hasCock() ? " 凯丝揉了揉乌尔塔更大的肚子，然后用手指弹了一下，看着波纹在乌尔塔的皮肤上荡漾" : "[pg]凯丝惊讶地张大嘴巴，指着自己更大的肚子。[say: 你<b>没资格</b>抱怨，]她说着，毫不客气地把手按在乌尔塔的肚子上") + "。[say: 噢——不公平！]乌尔塔大喊，捂着她撑得过饱的肚子。");
            }
         }
         else if(Utils.rand(2) == 0)
         {
            outputText("乌尔塔刚刚又把你吞了下去，滑入她喉咙的感觉让你达到了顶点。你抓住她的后脑勺，你的" + (get_player().balls > 0 ? "蛋蛋开始" : "前列腺开始") + "抽动。她睁大了眼睛，但还是接受了命运，试图以你分泌的速度尽快吞下你的精液。[pg]");
            outputText("凯丝意识到了发生了什么" + (get_player().balls > 0 ? "，揉捏着你的蛋蛋" : "，迅速将手指插入你的屁眼，开始挤奶你的前列腺") + "，试图从中诱导出更多的精液。");
            if(get_player().cumQ() < 500)
            {
               outputText("乌尔塔轻松地把精液全部吞下。你的贡献并没有让" + (get_katherine().hasCock() ? "她膨胀的" : "她的") + "腹部" + (get_katherine().hasCock() ? "" : "膨胀") + "，但她抚摸着你的腿，满足地微笑着。");
            }
            else if(get_player().cumQ() < 1500)
            {
               outputText("乌尔塔有些艰难地吞下你的精液" + (get_katherine().hasCock() ? "，因为她的肚子已经被凯丝的精液填满了" : "") + "。她把精液全部吞下，但之后揉着腰侧，试图缓解压力。");
            }
            else
            {
               outputText("在你的精液带来的" + (get_katherine().hasCock() ? "额外" : "") + "压力下，乌尔塔的肚子开始膨胀。她发出一声担忧的[say: 唔唔]声，但你现在正忙着。她向后仰去，肚子大得甚至长出了一些妊娠纹。");
               outputText("结束后，你拔出肉棒，凯丝看着乌尔塔假孕的样子咯咯直笑。[say: 太撑了，]乌尔塔沙哑地说。凯丝揉了揉乌尔塔" + (get_katherine().hasCock() ? "更大的" : "") + "肚子，然后用手指弹了一下，看着波纹在乌尔塔的皮肤上荡漾。[say: 噢——不公平！]乌尔塔大喊，捂着她撑得过饱的肚子。");
            }
         }
         else
         {
            outputText("凯丝的舔舐和哼哼声让你达到了顶点，所以你抓住了她的后脑勺。你的" + (get_player().balls > 0 ? "蛋蛋开始" : "前列腺开始") + "抽动。她睁大了眼睛，但还是接受了命运，试图以你分泌的速度尽快吞下你的精液。[pg]");
            outputText("乌尔塔意识到了发生了什么" + (get_player().balls > 0 ? "，揉捏着你的蛋蛋" : "，迅速将手指插入你的屁眼，开始挤奶你的前列腺") + "，试图从中诱导出更多的精液。");
            if(get_player().cumQ() < 500)
            {
               outputText("凯丝轻松地吞下了所有的精液。你的贡献并没有让她的肚子变得更大，但她揉了揉你的腿，满足地笑了。");
            }
            else if(get_player().cumQ() < 1500)
            {
               outputText("凯丝吞下你的精液有点困难，因为她的肚子已经被乌尔塔的精液填满了。她把精液全都吞了下去，然后揉了揉自己的腰，试图减轻压力。");
            }
            else
            {
               outputText("在你的精液的额外压力下，凯丝的肚子开始膨胀。她发出了担忧的[say: 唔唔]声，但你现在正忙着。她向后靠去，肚子胀得足以长出一些妊娠纹。你开始看到乌尔塔的精液被挤出来，尽管乌尔塔巨大的阴茎还没有开始缩小。");
               outputText("结束后，你拔出阴茎，乌尔塔开始揉搓凯瑟琳" + (get_katherine().hasCock() ? "变大的" : "") + "肚子。凯丝躺在地板上呻吟着，尾巴慵懒地左右摇摆。");
            }
         }
         if(get_katherine().hasCock())
         {
            outputText("[pg]你现在已经精疲力尽了，但看到这两个被精液填满、肉结锁在一起的扶他，你产生了一个想法。你伸出手，开始揉搓凯丝肿胀的肉结后端。[say: 嘿。不不不——求你了！如果你那样做，我会——哦！——我们会连在一起好几个小时的。]你笑了笑，告诉她这就是你的计划。[pg]");
            outputText("乌尔塔扭动着身体，试图从凯丝身边拉开，但你的动作太快了。你感觉到凯丝的肉结再次充血，将凯丝和她的伴侣紧紧锁在一起。你给了她们每人一个吻，告诉她们是时候让她们更好地了解彼此了。然后你穿上衣服，回到营地，感觉今天已经完成了很多事情。[pg]");
         }
         else
         {
            outputText("[pg]你现在已经精疲力尽了，不幸的是你必须回到营地。你给了凯丝和乌尔塔一个吻，然后把凯丝的手臂环绕在乌尔塔身上，把乌尔塔的手臂环绕在凯丝身上。女孩们叹了口气，依偎在一起");
            if(get_player().cor < 33)
            {
               outputText("，让你心底涌起一股暖流。");
            }
            else
            {
               outputText(get_player().cor < 66 ? "。尽管刚刚高潮，你还是感觉到你的阴茎抽动了一下。" : "。这甜得发腻，但只要她们继续那样做爱，谁在乎呢。");
            }
         }
         get_player().orgasm("Generic");
         get_katherine().orgasm();
         get_katherine().katherineAndUrtaHadSex(true);
         var _loc3_:IMap = KFLAGS.flags;
         FlagDict_Impl_.arrayWriteInt(_loc3_,12,FlagDict_Impl_.arrayReadInt(_loc3_,12) + 1);
         FlagDict_Impl_.arrayWriteInt(KFLAGS.flags,13,2 + Utils.rand(2));
         get_urta().urtaLove(1);
         doNext(get_camp().returnToCampUseOneHour);
      }
      
      public function doublePenetrateKath() : void
      {
         clearOutput();
         get_katherine().katherineSprite(true);
         outputText("你问你的两个" + (get_katherine().hasCock() ? "扶他" : "荡妇") + "，是不是该征用一间后面的房间了。[pg]");
         outputText("乌尔塔" + get_katherine().clothesLowerChoice("把手伸上凯丝的大腿","把手滑进凯丝的裙底","揉搓着凯丝紧身衣裤裆处" + (get_katherine().hasCock() ? get_katherine().cockAdj() + "的凸起" : ""),"把手滑进凯丝的裙底","把手滑进凯丝长袍的褶皱之间") + "，给了你一个如狼似虎的微笑。[pg]");
         outputText("你不得不扶着她们俩去后面的一间房间，你能感觉到酒吧里许多顾客的目光落在你的背上。门一关上并锁好，乌尔塔就把凯丝按在墙上，开始和她舌吻。[pg]");
         outputText("你看着这场表演，你的阴茎开始在衣服的束缚下紧绷" + (get_player().hasVagina() ? "，而你的小穴也开始把衣服弄湿" : "") + "。凯瑟琳开始拉扯乌尔塔的衣服，尽管她喝醉了，但她脱衣服的动作还是很利索。[pg]");
         outputText("乌尔塔扯下自己最后几件衣服，然后开始脱凯丝的衣服。她看着你，说道：[say: 最好快点，[name]。我想你不想被排除在外吧。]就在她说出最后一个字的时候，她扯下了凯丝最后一件衣服，双手捧住凯丝" + get_katherine().get_breasts().adj() + "的乳房。[pg]");
         outputText("凯丝发出一声幸福的呻吟，因为她的");
         if(get_katherine().hasCock())
         {
            outputText(get_katherine().cockMultiple("阴茎现在暴露在空气中，勃起直到它","双茎现在暴露在空气中，勃起直到它们") + "戳到了乌尔塔的肚子。[pg]");
         }
         else
         {
            outputText("乳房被粗暴地揉捏着。你看着" + (get_katherine().get_breasts().lactating() ? "乳汁顺着她的胸前流下，" : "一些") + "淫液顺着她的大腿滴落。[pg]");
         }
         if(get_katherine().hasCock())
         {
            outputText("乌尔塔把" + get_katherine().cockMultiple("它","它们") + "扭到一边，让凯丝发出一声小小的尖叫。她对凯丝说：[say: 哦，今天不行，小可爱。今天我要用这个。]乌尔塔把她巨大的马鸡巴抵在凯丝的阴蒂上。凯丝低头看了看自己的乳房之间，然后又看了看你。[pg]");
         }
         else
         {
            outputText("乌尔塔把她巨大的马鸡巴抵在凯丝的阴蒂上，对她说：[say: 今天不逗你了，小猫咪。今天我要用这个怪物操你。]凯丝低头看了看自己的乳房之间，然后又看了看你。[pg]");
         }
         outputText("现在你已经脱光了衣服，看着乌尔塔粗暴地对待你漂亮的小猫咪，你硬了起来。看着她巨大的马鸡巴埋在凯瑟琳紧致的小穴里，那一定很壮观。你决定给她们“帮把手”，趁乌尔塔不注意的时候，在她的屁股上狠狠地拍了一巴掌。[pg]");
         outputText("乌尔塔惊讶地向前猛冲，然后两人都发出了一声短促的尖叫。凯丝踮起脚尖，嘴巴张得大大的。乌尔塔回头看着你，似乎正要抱怨，但随后她的大脑终于意识到她的肉棒刚刚陷入了那条火热、紧致的通道。她脸上的怒气消失了，把手放在了凯瑟琳的肩膀上。[pg]");
         outputText("[say: 我好撑，] 凯丝只能说出这句话。[pg]");
         outputText("[say: 还没呢，] 乌尔塔回答道。她按下凯丝的肩膀，又强行塞进去了几英寸。[pg]");
         outputText("随着凯瑟琳的小穴被撑得更宽，她的舌头从嘴里伸了出来。当乌尔塔开始往回抽时，凯丝充满欲望地看着你，问道：[say: 那你呢，" + get_katherine().playerText() + "？][pg]");
         outputText("你把这对连在一起的" + (get_katherine().hasCock() ? "扶他" : "恋人") + "从墙边拉开，告诉凯丝你是来给她提供支持的。她看起来有点困惑，于是你走到她身后，用双手掰开她的臀瓣。[pg]");
         outputText("[say: 哦，我明白了，] 她喘息着说。[pg]");
         outputText("当乌尔塔再次向前挺进时，你将你的肉棒抵在凯丝的肛门上。你稳住双腿，当乌尔塔从前面填满凯丝时，你的肉棒开始从后面填满她。凯丝抱住乌尔塔，发出了一声深沉、悠长的满足的呼噜声。[pg]");
         outputText("在她的体内，透过你的肉棒，你能感觉到那个巨大而火热的入侵物，那只能是乌尔塔的马鞭。你又插深了一点。乌尔塔的肉棒和你的肉棒之间紧绷的薄膜让你能感觉到她肉棒上凸起的血管。当你们俩都停下来时，你能感觉到乌尔塔的脉搏。[pg]");
         outputText("当你和乌尔塔一起建立起节奏时，凯丝只能随波逐流。有时她会在你进入时退出，有时你们俩会同时把肉棒插进去——一直插到根部。当你们俩都拔出时，你能感觉到凯瑟琳的肚子因为突然的吸力而向内收缩。[pg]");
         outputText("湿润的挤压声、拍打声、滴水声、呼噜声和呻吟声，听起来就像你把凯丝当成了一个淫秽的管弦乐队，一件为两个人打造的乐器。她显然不在乎。体内插着两根肉棒，她很快就高潮了，她的");
         if(get_katherine().hasCock())
         {
            outputText("肉棒" + get_katherine().cockMultiple("","s") + "弄脏了乌尔塔" + (get_noFur() ? "" : "毛茸茸") + "的肚子，并在你们脚下的地板上涂了一层。[pg]");
         }
         else
         {
            outputText("小穴释放出大量的淫液，" + get_katherine().catGirl("弄湿了她的皮肤","弄脏了她的毛发") + "，一直流到她的脚上，浸透了你们脚下的地板。[pg]");
         }
         outputText("当你快要高潮时，你感觉到凯瑟琳的括约肌开始第二次夹紧你的肉棒。凯丝的臀部被困住了，但它们仍然试图移动，");
         if(get_katherine().hasCock())
         {
            outputText("徒劳地抽插着，她的肉棒" + get_katherine().cockMultiple("喷射","s喷射") + "出精液，再次喷在乌尔塔身上。[pg]");
         }
         else
         {
            outputText("虚弱地在乌尔塔的肉棒上摩擦，她的身体乞求着更多。[pg]");
         }
         outputText("现在轮到你了。你收紧了对凯丝臀部的抓握，把你的肉棒完全插了进去。你听到凯丝呜咽着说了一声[say: 是的]，然后你的" + (get_player().balls > 0 ? "睾丸开始清空它们的" : "前列腺开始清空它的") + "内容物。");
         if(get_player().cumQ() < 500)
         {
            outputText("你向凯丝的结肠里快速射了几发。浓稠、温暖的精液润滑了她的内脏。凯丝的尾巴摇摆着，既向你展示了她的快乐，又按摩了你肉棒的根部。");
         }
         else if(get_player().cumQ() < 1500)
         {
            outputText("你向凯丝的直肠里射了几股精液。你射出的每一发，都能感觉到她的内脏被撑得越来越大。当你的" + (get_player().balls > 0 ? "睾丸" : "前列腺") + "空了的时候，你已经感觉不到她结肠的内部了，只能感觉到一片你精液的内海。");
            outputText("越过她的肩膀，你可以看到凯丝的肚子微微鼓起。凯丝回头看着你，笑了。");
         }
         else if(get_player().cumQ() < 3000)
         {
            outputText("当你向凯丝的肠道里释放出喷泉般的精液时，她喘息着。[pg]");
            outputText("没过多久，你就能感觉到她的肚子在压力下膨胀起来，让她看起来像怀孕三个月、四个月、五个月！当你的最后一股精液将她的腰围又撑大了一英寸，并把她的肚脐眼顶成凸起时，她发出了一声低沉而满足的呻吟。");
         }
         else
         {
            outputText("当你的肉棒在凯丝的肛门里爆发时，你把她撞得喘不过气来。这可不是什么少量的精液，只是刚好够繁殖用的。不，这是一股由魔力驱动的精液狂潮，除了射进去，它无处可去。凯丝的双手试图把你的手从她的臀部掰开，但你的整个身体都锁死了，为了挤出如此不自然的大量精液而紧绷着。[pg]");
            outputText("她的手变得越来越无力，你能感觉到她臀部的皮肤被拉伸，因为她的身体试图为她的肚子提供更多的空间。当你的最后一滴精液被强行射入她体内时，她看起来完全像是怀孕了。");
            if(get_player().cor < 25)
            {
               outputText("你希望这么大的射精量不会造成任何永久性的伤害。");
            }
            else if(get_player().cor < 75)
            {
               outputText("你希望凯丝能像你一样享受这一切。");
            }
            else
            {
               outputText("你在暗地里试图从你的" + (get_player().balls > 0 ? "沉甸甸的蛋蛋" : "巨大的前列腺") + "中挤出更多的精子。你想看看你到底能把你的猫" + get_katherine().catGirl("娘","形态") + "的肚子撑到多大。更重要的是，你想看看你能不能让她对这种被过度填满的感觉上瘾。");
            }
            outputText("[pg]凯丝因为被完全填满而呜咽着，但她的尾巴却在摇晃。你很确定她很享受——如果不是的话，反正她也无能为力。");
         }
         outputText("[pg]乌尔塔停顿了一下，用手托起凯瑟琳的下巴。[say: 我看[name]已经射了。你喜欢[he]射在你里面吗？] 她把一只手放在凯丝的肚子上揉了揉。[say: 你喜欢所有那些温暖的精液在你里面吗？][pg]");
         outputText("凯丝慢慢地点了点头。她简直就像是被乌尔塔施了魔法一样。[pg]");
         outputText("[say: 别担心，小可爱。我马上就要给你一份我自己的大礼了。] 乌尔塔没有等任何回应。她只是抓住凯丝的臀部，开始比以前更深、更用力、更快地猛撞。在凯丝体内，你能感觉到你的精液在晃动，可能还在起泡，因为乌尔塔为了射精不择手段。[pg]");
         outputText("凯丝已经高潮了两次，并且被填满了一次。你必须扶住她的肩膀，防止她摔倒。乌尔塔只是继续操着，就像凯丝是一个大型猫科动物飞机杯一样。你可以从乌尔塔的眼睛里看出来——她太饥渴、太醉了，现在除了射精什么都不重要。[pg]");
         outputText("最后，乌尔塔把她的肉棒尽可能深地插了进去。你确信龟头一定" + (get_katherine().pregSize() > 0 ? "抵住了凯丝的子宫颈" : "在凯丝的子宫里") + "。乌尔塔仰起头大叫起来。你能感觉到她蛋蛋散发出的热量，而在凯丝体内，你的肉棒能感觉到越来越大的压力。[pg]");
         outputText("对凯丝来说幸运的是，乌尔塔失去了平衡。她向后倒向地板，她那像老虎钳一样紧紧抓住凯丝臀部的手把她和乌尔塔一起拖了下去。你的肉棒被拔了出来，你的精液开始从凯瑟琳的屁股里溢出，与此同时，乌尔塔开始注入她自己的精液。[pg]");
         if(get_player().cumQ() < 500)
         {
            outputText("你看到你的精子顺着凯丝的腿滴下来，而乌尔塔那大得多的精液则强行挤进凯丝的小穴。没过多久，" + (get_katherine().pregSize() > 0 ? "她们下面那滩精液就开始变大" : "凯丝看起来就像怀了孩子一样") + "。[pg]");
         }
         else if(get_player().cumQ() < 1500)
         {
            outputText("随着乌尔塔蛋蛋的每一次收缩，一股你的精液就会从凯丝张开的屁眼喷涌而出。你强行射进去的所有东西现在都被强行挤了出来，因为乌尔塔的精液填满了凯瑟琳的" + (get_katherine().pregSize() > 0 ? "阴道，然后开始喷射到下面的地上" : "子宫，把她的肚子撑得比你撑的还要大一点，让她看起来像是准备要生了") + "。[pg]");
         }
         else if(get_player().cumQ() < 3000)
         {
            outputText("一股精液从凯丝张开的屁眼喷涌而出。你强行射进去的所有东西现在都被强行挤了出来，因为乌尔塔的精液填满了凯瑟琳的" + (get_katherine().pregSize() > 0 ? "阴道，然后开始喷射到下面的地上。很快，整个地板都涂满了精液。有些是你的，有些是凯丝的，有些是乌尔塔的，全都滑溜溜的" : "子宫，让她看起来像是准备要生双胞胎了") + "。[pg]");
         }
         else
         {
            outputText("你的精液像间歇泉一样从凯瑟琳的屁股里喷发出来。你有点自豪，既为你产生的精液量，也为你最喜欢的小猫设法容纳了所有这些精液。但乌尔塔的蛋蛋可等不及了。它们将自己的贡献泵入凯丝的小穴深处，让她的肚子完全膨胀起来。[pg]");
            outputText((get_katherine().pregSize() > 0 ? "精液很快" : "当她的肚子大到足以容纳一匹半人马小母马时，精液") + "开始漏出来，把整个地板都涂满了精液。有些是你的，有些是凯丝的，有些是乌尔塔的，全都滑溜溜的。[pg]");
         }
         get_katherine().katherineAndUrtaHadSex(true);
         outputText("乌尔塔和凯丝都开始咯咯地笑起来，乌尔塔开始拍打凯丝的肚子。当她看到你还站着时，乌尔塔用她的腿夹住你的脚，把你拉倒在那堆黏糊糊的东西里。[pg]");
         if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,1232) == 1)
         {
            outputText("[say: 哇！] 她们俩异口同声地说。然后她们看着对方，像疯了一样大笑起来。[pg]");
            outputText("乌尔塔亲了你一下，说道：[say: 我不知道我该不该……但那真的很有趣。][pg]");
            outputText("[say: 有趣又充实，]凯丝说着，两人又是一阵醉醺醺的傻笑。你轮流揉着她们的耳朵，凯丝的肚子也渐渐瘪了下去。你凑近她们耳边，轻声说以后有机会还想再来一次。两个女孩都太累了，根本无力反驳。");
         }
         else if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,1232) < 11)
         {
            outputText("乌尔塔给了你一个湿漉漉的深吻，说道：[say: 你一定很喜欢看我把你的朋友填满。" + (FlagDict_Impl_.arrayReadInt(KFLAGS.flags,723) == 1 ? " 最好小心点，我可能会让她怀孕的。" : "") + "][pg]");
            outputText("你没有回答她，只是在她们俩的耳后轻轻挠了挠，然后收拾好自己的衣服。你把你的情人们留在她们自己喷出的精液坑里，告诉她们要“好好深入了解一下彼此”。");
         }
         else if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,1232) < 32)
         {
            outputText("凯丝抱了抱乌尔塔，然后又抱了抱你。她说：[say: 别担心。等我们感觉好点，我们会把这里清理干净的。哦，再次感谢你让我操你那狐狸精女友。][pg]");
            outputText("[say: 嗯……是的。我随时准备好射进你这样火辣的小猫咪体内，]乌尔塔说。[say: 你知道吗，[name]，你<b>没必要</b>把我们灌醉。凯丝和我随时都愿意做爱。][pg]");
            outputText("凯丝迷迷糊糊地应了一声[say: 嗯]，然后蜷缩在乌尔塔的怀里睡着了。");
         }
         else
         {
            outputText("乌尔塔把你们俩紧紧抱在怀里，轮流亲吻了你们。[say: 你们两个……如果没有你们，我该怎么办？我还记得以前我只能坐在酒吧里喝酒的日子。现在我可是被宠坏了。][pg]");
            outputText("凯丝吸了吸鼻子，说道：[say: 是啊，在你找到我之前，我从来没有得到过任何爱。现在我不得不休息一下，因为我的小穴都疼了。]她依偎在你和乌尔塔身边，你很确定她马上就睡着了，在爱人的怀抱中感到无比安全。");
         }
         get_player().orgasm("Dick");
         get_katherine().orgasm();
         get_katherine().katherineAndUrtaHadSex(true);
         var _loc1_:IMap = KFLAGS.flags;
         FlagDict_Impl_.arrayWriteInt(_loc1_,12,FlagDict_Impl_.arrayReadInt(_loc1_,12) + 1);
         FlagDict_Impl_.arrayWriteInt(KFLAGS.flags,13,2 + Utils.rand(2));
         get_urta().urtaLove(1);
         if(get_game().time.hours >= 13)
         {
            FlagDict_Impl_.arrayWriteInt(KFLAGS.flags,1225,2);
         }
         doNext(get_camp().returnToCampUseOneHour);
      }
      
      public function circlejerk() : void
      {
         clearOutput();
         get_katherine().katherineSprite(true);
         outputText("没有理由不和她们俩一起找点乐子……而且你觉得你无法抗拒加入你最喜欢的两个女孩的亲密互动的诱惑。脱下你的[armor]，你走到两个女孩身后，将乌尔塔拥入怀中，双手在她的身体上游走，解开她盔甲的带子。[pg]");
         outputText("乌尔塔似乎被你的触碰吓了一跳。[say: " + get_player().get_short() + "？你在干什么，你这个调皮的[boy]？]她咯咯地笑着。凯丝看着你，坏笑道：[say: 忍不住想加入进来，是吧，[name]？好吧，为什么不呢？毕竟，严格来说我们是</i>三人行</i>，不是吗？][pg]");
         outputText("你给了两个女孩一个迷人的微笑，告诉她们你很快就会加入她们的乐趣，但首先你必须解决一个问题……乌尔塔穿得有点太多了……仔细想想，凯丝也是。[pg]");
         outputText("猫女坏笑着开始脱掉她的衬衫，把它扯下来扔到一边。[say: 只是互相打手枪，我们能弄出多大的动静？][pg]");
         outputText("[say: 小猫咪，你根本不知道你在和谁说话，对吧？]乌尔塔说着，松开猫女的肉棒，帮你脱掉她的衣服和盔甲。[pg]");
         outputText("乌尔塔的上衣一脱下来，你的手就移过去抚摸她柔软的双球，捏着并扭动她的乳头，然后把她的头拉向你的" + (get_player().hasBreasts() ? get_player().breastDescript(0) : "胸膛") + "，最后轻轻咬了咬她挺立的狐狸耳朵");
         var _loc1_:String = get_player().get_race();
         var _loc2_:String = _loc1_.substr(0,3);
         var _loc3_:String = _loc1_.substr(0,6);
         if(_loc2_ == "cat" || _loc2_ == "dog" || _loc2_ == "fox" || _loc3_ == "dragon" || _loc3_ == "drider" || _loc3_ == "ferret" || _loc3_ == "spider" || _loc1_ == "naga" || _loc1_ == "kitsune" || _loc1_ == "demon-morph" || _loc1_ == "shark-morph" || _loc1_.indexOf("lizan") > -1)
         {
            outputText("，小心不要用你锋利的牙齿弄伤她");
         }
         outputText("。");
         outputText("[pg]乌尔塔咯咯地笑着。[say: 活泼的[boy]……嗯，你总是知道怎么让我准备好，不是吗？]她问道，尾巴在她身后轻轻摇摆，用它柔软蓬松的毛团间接地拍打着你。在这一切过程中，她的手始终紧紧握着凯丝的肉棒，她开始轻轻地上下滑动，抚摸的动作轻松自如，就像一个在自己肉棒上练习过很多次的人一样。[pg]");
         outputText("乌尔塔蓬松的尾巴拍打着你，足以让你进入状态");
         if(get_player().hasCock())
         {
            outputText("；[eachCock]勃起，准备好迎接即将到来的事情");
         }
         else if(get_player().hasVagina())
         {
            outputText("；你的小穴被你的淫液浸透了，有些滴在了乌尔塔的尾巴上");
         }
         outputText("。");
         outputText("觉得是时候加入她们了，你绕到前面坐在她们面前。你对着两个女孩微笑，轻轻伸出手，将乌尔塔的肉棒握在手中，确保性感地抚摸她的整个长度，并将她的先列腺液涂抹在她膨胀的龟头上。你看着凯丝，诱惑地微笑着，用眼神挑逗她。[pg]");
         outputText("[say: 这是一个挑战吗，[name]？你觉得你能在这只小狐狸让我高潮之前让她高潮，嗯？]凯丝问道，咧嘴笑着，露出针状的牙齿。[say: 好吧，既然你这么配合地为我们脱光了衣服，我要让这变得更有挑战性一点……]她伸出手，她的手指");
         if(get_player().hasCock())
         {
            outputText("包裹住你的肉棒" + (get_player().hasVagina() ? " 和 " : ""));
         }
         if(get_player().hasVagina())
         {
            outputText("轻轻地在你的小穴周围挑逗");
         }
         outputText("。[say: 谁最后高潮谁就是赢家？]她开玩笑说。[pg]");
         outputText("[say: 听起来不错，小猫咪，]乌尔塔说道，她的呼吸已经因为充满欲望的期待而变得急促。你也加入了这场游戏，说这对你来说没问题……然后问女孩们，如果你赢了，你会得到什么？[pg]");
         outputText("[say: 你想要什么？]这句话同时从两个女孩的嘴里蹦出来，两人的嘴唇都卷起了一抹半是欲望、半是戏谑的独特微笑。她们惊讶地看着对方，因为她们竟然异口同声地说话，然后勉强给了对方一个微小但友好的微笑。嗯……你可以要求的东西太多了……但现在你告诉她们，你只希望她们能和睦相处，也许以后……可以来个双人服务？[pg]");
         outputText("[say: 首先，你得赢，]凯丝咧嘴一笑，乌尔塔点头表示同意。[say: 如果我们赢了……嗯……你会怎么做，小狐狸？][pg]");
         outputText("[say: 我不知道……我从来没想过，]乌尔塔承认道。[pg]");
         outputText("[say: 好吧，我知道我想对[him]做什么……]凯丝笑着，色眯眯地看着你，但她没有继续说下去；显然，她想让你的大脑自己填补空白，以此来让你感到不安。好吧，如果你只专注于赢，你就不必担心这个了！考虑到这一点，你加倍努力，尽你所能地抚摸乌尔塔，自从你开始和她胡闹以来，你已经了解了她所有敏感的地方。[pg]");
         outputText("这只母狐狸震惊地叫了一声，随后变成了一声低沉的愉悦呻吟，但她摇了摇头，同样渴望获胜。她的手迅速开始在凯瑟琳的肉棒上滑动，但她对" + get_katherine().cockType("犬科动物的形状，尤其是根部肿胀的肉结，","猫科动物的形状和肿胀的肉结") + "缺乏了解，这意味着效果可能不如预期。尽管如此，她还是令人钦佩地挣扎着，手指弯曲并抚摸着，即使她的手掌上下滑动，抚摸和挑逗着" + get_katherine().cockType("这只有着犬科肉棒的猫","凯丝的肉棒和肉结") + "。[pg]");
         outputText("当凯丝开始在快感的迷雾中挣扎时，你自己也呻吟起来，不愿不战而败。");
         if(get_player().hasCock())
         {
            outputText("她的手用指尖柔软的肉垫挑逗着你的[cock]；每隔一会儿，她就会伸手收集一团先列腺液，涂抹在你的肉棒上，让她更容易挑逗你，直到你认输。");
         }
         if(get_player().hasVagina())
         {
            outputText("她的" + (get_player().hasCock() ? "另一只" : "") + "手轻轻地在你的阴唇上画圈，" + (get_noFur() ? "轻柔的触碰" : "皮毛") + "如此美妙地挠着你的入口，你忍不住迎合她游移的手指，试图将它捕获在你湿润的肉壁中。");
         }
         outputText("[pg]你们三个人在呻吟、咆哮、嚎叫和挺动中交织成一首合唱，毫无疑问地表明了守卫队安全屋里正在发生什么。有那么一瞬间，你让此刻的快感淹没了你……你在这里，取悦着两个性感的扶他，也被她们取悦着……她们看起来如此美丽，在你们相互的服侍下发出愉悦的呻吟，赤裸地暴露着，她们的差异在你眼前展露无遗……还有她们的相似之处……但现在的沉思已经足够了；你还有一场比赛要赢。[pg]");
         outputText("你伸手去抚摸乌尔塔的睾丸，在手掌中揉搓和爱抚着那沉重的球体，然后带着一丝坏笑，你伸出中指……突然插进了乌尔塔的入口。这只狐狸发出一声非常像狼的嚎叫，对你大胆的举动感到震惊和愉悦，她的肉壁急切地夹紧了入侵的手指，试图把你吸得更深。[say: 这-这是作弊，[name]！]她呜咽着。[pg]");
         outputText("你微笑着反驳说，如果只抚摸她的肉棒，那就不公平了，因为她明明有一个甜美紧致的蜜壶，正渴望着一些关注。说完，你扭动着插在她体内的手指，感觉她的肉壁收缩并抓住你入侵的手指。她在座位上扭动着，淫液现在开始渗出，加入了已经从她睾丸周围蔓延开来的先列腺液水洼中，她调整姿势以更好地面对凯瑟琳，她空闲的手穿过她们之间的空间，湿漉漉地滑进了小猫咪的小穴。这只猫在愉悦的震惊中嚎叫起来，不假思索地把手从你的" + get_player().genderText("肉棒","小穴","肉棒和小穴") + "上移开，显然是为了能更轻松地在地板上支撑自己。[pg]");
         outputText("不再被凯丝压制，一个邪恶的计划在你的脑海中形成，你迅速将其付诸行动。松开乌尔塔的肉棒，把手指从她的小穴里拔出来，你迅速" + (get_katherine().hasBalls() ? "伸手去抚摸凯丝的睾丸，" : "将湿滑的手指滑进凯瑟琳的屁股，摩擦她的前列腺") + "同时你沾满淫液的手抓住乌尔塔的肉棒，捏了捏并抽动了一下。两个女孩都喘着粗气，你准备迎接即将到来的猛攻。[pg]");
         outputText("凯丝先高潮了；是因为乌尔塔太厉害了，还是因为她太缺乏被手淫的经验，你不好说。她弓起背，发出一声非常像猫的狂喜尖叫，她的身体颤抖着，女性的高潮倾泻在她身下的地板上，用她的性分泌物弄湿了她的屁股，同时精液从她" + get_katherine().cockMultiple("","双根") + get_katherine().cockType("尖头","带刺") + "的肉棒" + get_katherine().cockMultiple("","") + "中喷涌而出。[pg]");
         outputText("与此同时，乌尔塔设法多坚持了一会儿，但即使凯丝小猫精液的最初几滴溅在她黑色乳头的乳房上，这只狐狸扶他也发动了自己的攻击，大团的精液从她的龟头喷出，直接喷在凯丝的脸和乳房上，并渗下来涂抹在她的肚子上。与此同时，凯丝");
         var _loc4_:int = int(get_katherine().cumQ());
         if(_loc4_ < 500)
         {
            outputText("用她乳白色的银色精液弄脏了乌尔塔双色的乳房");
         }
         else if(_loc4_ < 1500)
         {
            outputText("用她惊人的高潮把乌尔塔从腰部以上都浸透了");
         }
         else
         {
            outputText("用她大规模喷发的精液把她从头到脚完全覆盖了");
         }
         outputText("，在愉悦中嚎叫着，完全不在乎她把乌尔塔咸咸的精液弄到了嘴里。纯属巧合，她们大部分的高潮都落在了对方身上，而不是你身上。[pg]");
         outputText("你笑着，对面前沾满精液的美女们咧嘴一笑，庆幸自己在这场小表演中毫发无损。你幸灾乐祸地挺起胸膛，自豪地宣布自己是这场小比赛的赢家。[pg]");
         outputText("[say:你作弊，[name]！]乌尔塔抱怨道。[pg]");
         outputText("[say:就是，她说的没错！]凯丝附和道。[pg]");
         outputText("作弊！？你假装受伤，告诉她们你绝不会做那种事！尤其是在这关乎一份特别奖品的时候，比如她们全神贯注地盯着你的高潮……说到这个……如果她们不介意的话，你现在就要拿走你的奖品了。你站起身，走向乌尔塔和凯丝，挑起一侧眉毛，仿佛在问她们打算什么时候开始。[pg]");
         outputText("她们对视一眼，看看你，又对视一眼，然后咧嘴笑了。[say:好吧……既然你坚持……]她们说道，语气中带着明显的虚假无辜，随后突然四肢着地，向你爬来。哦，不……你还没来得及转身逃跑，就看到两道模糊的身影，一个是" + get_katherine().catGirl("苍白的肌肤和" + get_katherine().get_hairColor() + "的头发","黑色的") + "，另一个是" + get_katherine().catGirl("灰色的","灰色的皮毛") + "，直扑向你；伴随着一声尖叫，你被拖倒在地，陷入了一片沾满精液的肢体狂潮中，被触摸、抚摸、亲吻。当两片嘴唇覆上你的嘴唇时，你发出一声呻吟，你被这突如其来的攻势弄得不知所措，直到一条犬类的舌头侵入你的口腔，你才分辨出是谁。你放纵地回吻乌尔塔；片刻之后，她结束了亲吻，取而代之的是凯丝的嘴唇，她一边亲吻你，一边在你身上摩擦。[pg]你感觉到她们身上浸透的精液蹭到了你身上，她们的乳房按摩着你的" + (get_player().hasBreasts() ? get_player().breastDescript(0) : "胸部") + "。有那么一瞬间，你感到了极致的幸福，然后");
         if(get_player().hasCock() && get_player().hasVagina())
         {
            outputText("你被彻底征服了。你的小穴和臀部紧绷，随着乌尔塔和凯丝的努力得到了回报，你流出了淫液。你感觉到滚烫的液体从你的" + (get_player().balls > 0 ? "蛋蛋" : "前列腺") + "涌上，然后是一阵爆发……[pg]");
         }
         else if(get_player().hasVagina())
         {
            outputText("你被彻底征服了。你的小穴和臀部紧绷，随着乌尔塔和凯丝的努力得到了回报，你流出了淫液。[pg]");
         }
         else
         {
            outputText("一阵爆发……[pg]");
         }
         if(get_player().hasCock())
         {
            if(get_player().cumQ() < 500)
            {
               outputText("一股股滚烫、白色的精液从你的[cocks]喷发而出，在空中划出一道弧线，落回到你们三人身上。为你们交缠的身体又增添了一层薄薄的白色。乌尔塔和凯丝都用淫荡的眼神看着你，你知道这还没完……");
            }
            else if(get_player().cumQ() < 1500)
            {
               outputText("精液如喷泉般喷向空中，如雨点般落在你和你的情人们身上。你的[cocks]在两位可爱的女士身上抽搐，在你们全身摩擦。伴随着一声呻吟，你从肉棒中挤出最后一点精液。你看到白色的精液划出一道弧线落下，朝着你的脸飞去，却被凯丝的头挡住了，她再次吻了你；精液溅在她的后脑勺上，却被乌尔塔舔掉了，她依然饥渴地盯着你……");
            }
            else
            {
               outputText("一场名副其实的喷发从你的[cocks]中涌出，喷得如此之高，你甚至担心会把天花板染成白色；连绵不断的白色精液落在你和你的情人们身上，让场面变得更加混乱，用你自己的高潮冲刷着她们的身体。你忍不住在幸福中仰起头，呻吟着，女孩们轮流舔舐你的身体和脸庞，直到最后，最后一股精液落在你的下巴上，却被两根舌头舔掉，她们为了这最后一点精液在亲吻中争斗，每个人都想胜过对方，接住最后一滴精液。你不知道谁赢了……但片刻之后，她们用饥渴的眼神看着你……即使经历了这一切，她们依然没有满足……");
            }
         }
         outputText("这两个" + (get_noFur() ? "" : "兽人") + "扶他发出充满情欲的呻吟和低吼，急切地将她们坚挺、大小不一的肉棒在你的肚子、你的" + (get_player().hasBreasts() ? get_player().breastDescript(0) : "胸部") + "、你的[hips]上摩擦");
         if(get_player().hasCock())
         {
            outputText("尤其是紧贴着你的" + get_player().cockDescript());
         }
         outputText("；像她们这样紧贴着你，你能感觉到她们的肉棒在跳动，她们的蛋蛋在肿胀……[pg]");
         outputText("乌尔塔先高潮了，她发出一声充满情欲的嚎叫，用她浓稠、湿滑的狐狸精液将你染成白色，她苹果大小的蛋蛋缩进胯下，尽力在你身上挤出一大股湿润的高潮。凯丝也紧随其后，发出一声野性的嚎叫，仰起头，");
         if(_loc4_ < 500)
         {
            outputText("她的贡献在乌尔塔如瀑布般的狐狸精液中显得微不足道");
         }
         else if(_loc4_ < 1500)
         {
            outputText("她的射精量和乌尔塔一样大，确保你完全被这两个长着怪异肉棒的扶他的精液浸透");
         }
         else
         {
            outputText("她巨大的蛋蛋挤出如此巨大的精液，直接把乌尔塔的精液从你身上冲刷掉了");
         }
         outputText("。伴随着疲惫而释然的呻吟，两个女孩毫不温柔地倒在你沾满精液的身体上，精液四溅，她们本能地依偎着你，把脸埋在你脖子的两侧。[pg]");
         outputText("你紧紧抱住女孩们，享受着你们共同的余韵。你喘着粗气，努力保持清醒。低头看去，你看到了乌尔塔和凯丝熟睡的脸庞，她们紧紧地依偎着你，你笑了。好吧……看来你哪儿也去不了了……所以不如放松下来，加入她们吧……");
         get_player().orgasm("Generic");
         get_katherine().orgasm();
         get_katherine().katherineAndUrtaHadSex(false);
         FlagDict_Impl_.arrayWriteInt(KFLAGS.flags,13,2 + Utils.rand(2));
         var _loc5_:IMap = KFLAGS.flags;
         FlagDict_Impl_.arrayWriteInt(_loc5_,12,FlagDict_Impl_.arrayReadInt(_loc5_,12) + 2);
         get_urta().urtaLove(1);
         if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,398) != 3)
         {
            if(get_game().time.hours >= 13)
            {
               FlagDict_Impl_.arrayWriteInt(KFLAGS.flags,1225,2);
            }
            doNext(get_camp().returnToCampUseOneHour);
         }
      }
   }
}

