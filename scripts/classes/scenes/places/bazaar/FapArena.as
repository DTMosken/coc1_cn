package classes.scenes.places.bazaar
{
   import classes.Appearance;
   import classes.Cock;
   import classes.CockTypesEnum;
   import classes.ItemType;
   import classes.Player;
   import classes.StatusEffects;
   import classes._FlagDict.FlagDict_Impl_;
   import classes.globalFlags.KFLAGS;
   import classes.internals.Utils;
   import classes.items.ConsumableLib;
   import classes.scenes.Camp;
   import classes.scenes.Inventory;
   import classes.scenes.places.Bazaar;
   import flash.Boot;
   import haxe.IMap;
   
   public class FapArena extends BazaarAbstractContent
   {
      
      public function FapArena()
      {
         if(Boot.skip_constructor)
         {
            return;
         }
         super();
      }
      
      public function tentacleFapSpecial(param1:Number) : void
      {
         var _loc2_:int = int(get_player().cocks.length);
         var _loc3_:int = get_player().longestCock();
         while(_loc2_ > 0)
         {
            _loc2_--;
            if(get_player().cocks[_loc3_].cockLength >= 40 && get_player().cocks[_loc3_].get_cockType() == CockTypesEnum.TENTACLE)
            {
               break;
            }
         }
         if(get_player().cocks[_loc3_].cockLength >= 40 && get_player().cocks[_loc3_].get_cockType() == CockTypesEnum.TENTACLE)
         {
            outputText("你突然想起你的" + Appearance.cockNoun(CockTypesEnum.TENTACLE) + "没有得到爱抚。这个可怜的蠕动的东西在兴奋中颤抖，你决定它也应该参加集体爆菊；你不在乎这是否作弊；毕竟，爆菊已经开始了。此外，裁判正忙着自慰，没有注意到任何事情。幸运的是，你的触手肉棒足够长，足够灵活，可以被引导到某个洞里去操；你继续让你的触手肉棒像蛇一样游动，寻找阴道。经过几秒钟不成功的寻找，用你的结节摸索肌肉发达的屁股，但没有找到已经被某个撞击的肉棒填满的洞，你绳索般的阴茎终于找到了一个张开的、滴着液体的阴道。你找到了一个扶他！她光滑的操洞因为她的菊花和肉棒已经得到的邪恶的肉体拥抱而渗出液体，在专家的指导下，你毫不费力地滑入了几英寸。这种残酷而出乎意料的二次入侵让她立刻呻吟起来。你欢迎这种新的快感爆发，开始在扶他的阴道里来回塞你的触手肉棒，同时");
            if(param1 <= 2)
            {
               outputText("操你伴侣的肛门");
            }
            if(param1 == 2)
            {
               outputText("并且");
            }
            if(param1 >= 2)
            {
               outputText("从后面被操");
            }
            outputText("。[pg]");
            if(param1 <= 2)
            {
               outputText("不用说，这种干扰在整个爆菊浪潮中造成了普遍的混乱。整列肉棒和菊花的列车开始不规则地移动，在最意想不到的时刻摩擦你的" + get_player().cockDescript(_loc3_) + "，而你从额外的触手肉棒中获得的快感也无济于事。每个人的屁股和肉棒都在一定程度上受到了影响；每个人的快感都因为你大胆的主动而增加，并且听到了响亮、不情愿的呻吟声。");
               if(param1 == 1)
               {
                  outputText("如此原始的力量，同时操两个人，而且其中一个还在那么远的地方……你基本上相当于把一整车的人操了两次。这种行为的荒谬感让你忍不住笑出声来，更加深了你因快感而产生的迷乱。");
               }
               else
               {
                  outputText("你的抵抗力在三重交媾和各种感觉交织而成的最丰富、最下流的高潮中迅速消退；但当你意识到你正在操的那个双性人女孩已经完全迷失时，你感到了一丝安慰。");
               }
               outputText("同时从两个洞里接受着肉棒和快感，这个长着鸡巴的女孩的身体在疯狂地左右扭动，摩擦着你那根触手肉棒，在狂喜中尖叫着，任由粗暴的快感冲击着她的理智。她那丰满的臀部从后面看去如此淫荡地摇晃着，还有那被蹂躏的子宫里不断溢出的女性体液带来的黏滑感，这些画面让你更深、更快地挺进她体内，仿佛是为了惩罚她——或者是奖励她？——因为她让你如此兴奋。她可能很快就要高潮了，你也是。[pg]");
            }
            else
            {
               outputText("这个姿势真是太尴尬了，你只能向后移动你的" + Appearance.cockNoun(CockTypesEnum.TENTACLE) + "，盲目地插入某个你看不见的双性人女孩体内。但至少这很公平；凭什么只有你一个人在挨操？你坚定地将你那光滑的入侵者塞进女孩的爱之隧道，并开始推挤，每当那辆后庭交媾列车撞击你的" + get_player().assDescript() + "时，你就更用力、更深地挺进，仿佛你想惩罚她参与了对你粗暴的插入，并把三十个人肉棒挺进带来的纯粹的后庭能量传递给她……你没有失望。当你的" + Appearance.cockNoun(CockTypesEnum.TENTACLE) + "开始在双性人湿润的小穴里进进出出时，她发出了一声巨大、淫荡的、像婊子一样的欢愉尖叫。她左右摇摆，加快了她被操屁股和填满小穴的节奏，无法控制自己的感觉。这扰乱了整个后庭交媾列车，每个人的屁股和肉棒都在某种程度上受到了影响；因为你大胆的循环反向交媾举动，每个人的快感都增加了，还能听到其他响亮、不情愿的呻吟声。你忍不住加入了这场邪恶的插洞狂欢。不过，双性人那断断续续、不规则的尖叫声盖过了其他人的声音，而从你们连接的生殖器中漏出的大量淫液和先列腺液，充分说明了你们俩的兴奋状态。用不了多久，你们俩都会高潮的。[pg]");
            }
         }
      }
      
      public function tentacleFapCum() : Boolean
      {
         var _loc1_:int = int(get_player().cocks.length);
         var _loc2_:int = get_player().longestCock();
         while(_loc1_ > 0)
         {
            _loc1_--;
            if(get_player().cocks[_loc2_].cockLength >= 40 && get_player().cocks[_loc2_].get_cockType() == CockTypesEnum.TENTACLE)
            {
               break;
            }
         }
         if(get_player().cocks[_loc2_].cockLength >= 40 && get_player().cocks[_loc2_].get_cockType() == CockTypesEnum.TENTACLE)
         {
            outputText("你的触手肉棒开始自行震动，很快它也在双性人的阴道内释放出大量的精液。她也达到了高潮；她的小穴用淫液浸透了你触手肉棒的末端。");
            return true;
         }
         return false;
      }
      
      public function fapResults(param1:Number = 3) : void
      {
         var _loc2_:int = 0;
         var _loc6_:* = null as Array;
         var _loc7_:* = null;
         var _loc8_:* = null as ItemType;
         var _loc9_:* = null as IMap;
         clearOutput();
         var _loc3_:int = get_player().longestCock();
         var _loc4_:Number = Utils.rand(50) + 5;
         var _loc5_:Boolean = false;
         if(param1 == 3)
         {
            outputText("你试图尽可能地将注意力集中在你的右臂和它握着的精液管上，但原始的感觉开始证明对你饥渴的" + get_player().cockDescript(_loc3_) + "来说太强烈了，你的手臂开始疲劳。你无助地感觉到你的" + get_player().cockDescript(_loc3_) + "随着尿道压力的增加而自行抽搐。你试图数到十来理清思绪，但握住你" + get_player().cockDescript(_loc3_) + "的手不让你有这样的闲暇。每次你试图保持连贯的思绪时，那只手就会粗暴地扭曲你的" + get_player().cockDescript(_loc3_) + "，将快感和痛苦的冲击传遍你的全身。天哪，这太强烈了。你的肉棒是……你将无法……就是这样，你能感觉到。太晚了。精液流正在你的睾丸中聚集，一开始很慢，但你知道你没有时间了。为了不输，你拼命地摩擦你手中的肉棒，越来越快，因为你感觉到你的种子开始顺着你的尿道向上流。不！这不可能！你如狼似虎地摩擦着那根肉棒，特别注意尖端，并尽可能多地将先列腺液泵出体外。有一瞬间，你以为你要赢了，因为阴茎的主人发出一声非常响亮的呻吟，开始发抖，成为你急切服侍的受害者。你几乎能感觉到液体种子流过阴茎的静脉；然后，在极度的收缩努力中，你右边的伙伴设法阻止了那股水流。他这次不会高潮了。你输了。[pg]");
            outputText("但现在这都不重要了。这一切都不重要了，因为你自己的" + get_player().cockDescript(_loc3_) + "即将释放出它自己的洪水。在经历了整个拒绝高潮的比赛后，你感觉你的骨头都在融化，你的身体正在升入天堂，当你达到顶峰时，你的" + get_player().cockDescript(_loc3_) + "开始射出一条");
            if(get_player().cumQ() > 1000)
            {
               outputText("邪恶的");
            }
            else if(get_player().cumQ() >= 500)
            {
               outputText("巨大的");
            }
            else
            {
               outputText("可观的");
            }
            outputText("你所产生过的最浓稠、最白的液体的绳索。");
            if(get_player().cockTotal() > 1)
            {
               outputText("几股更多的精液紧随其后，从你腹股沟处悬挂的未受刺激的阴茎肉中喷出。");
            }
            outputText("你的整个身体颤抖、收紧和放松了好几次，因为你完全失去了对肌肉的控制，你的大脑只关注位于你双腿之间的精液大炮。[pg]");
            outputText("你左边的伙伴非常专业。就在你的" + get_player().cockDescript(_loc3_) + "开始射出粘液的那一刻，你的阴茎榨乳器用雷鸣般的声音喊道：[say: " + (_loc4_ - 1) + " 号得分！]有一瞬间，你迷失在快感中，很少关注你" + get_player().cockDescript(_loc3_) + "之外的世界。然后你记起了游戏，用一种淫荡、充满快感的声音喊道：[say: " + _loc4_ + " 号高潮了！]");
            if(get_player().hasVagina())
            {
               outputText("你的大腿紧绷了几秒钟，然后你的" + get_player().vaginaDescript(0) + "也喷了，在地板上形成了一");
               if(get_player().wetness() >= 4)
               {
                  outputText("大滩");
               }
               else if(get_player().wetness() >= 2)
               {
                  outputText("滩");
               }
               else
               {
                  outputText("抹");
               }
               outputText("淫水。");
            }
            if(get_player().biggestLactation() > 1.5)
            {
               outputText("你的" + get_player().allBreastsDescript() + "也释放出乳白色的洪流，奶油般柔软的感觉挑逗着你的乳头，只让你的高潮更加持久。");
            }
            outputText("[pg]");
            outputText("可爱的裁判点头确认。她的眼中似乎充满了对你喷洒精液的[cocks]的渴望，你知道如果不是因为她的职业素养，她肯定会迫不及待地帮你解决。[pg]");
            if(Utils.rand(2) == 0)
            {
               outputText("当你的精液开始在空中飞舞时，你感觉到手中的压力释放了。被你的服侍弄得精疲力尽，而且现在他也不用再害怕输了，你右边的邻座也开始高潮，把他的精液射向裁判。她没能躲开这一击，但当你愤怒地大喊：[say: NUMBER " + _loc4_ + " SCORING!] 时，她点了点头，紧接着你邻座也喊道：[say: NUMBER " + (_loc4_ + 1) + " CUMMING!]。你对他利用你体力不支而在你之后高潮感到恼火，于是你狠狠地扭了一下他的老二作为报复。这让他痛苦又快乐地尖叫起来，精液也溢出得更加丰富了。[pg]");
            }
            else
            {
               outputText("你记起你还得让你右边的搭档高潮。既然你已经输了，你就不在乎被取消资格了，你狂暴地扭动着你搭档的鸡巴，爱抚、托起他的蛋蛋，偶尔还狠狠地捏一下作为报复。你搭档的鸡巴开始愤愤不平地抽搐，但很快就释放出了一股乳白色的精液洪流。你对自己缺乏耐力感到愤怒，大喊道，[say: NUMBER " + _loc4_ + " SCORING!] 紧接着是 [say: NUMBER " + (_loc4_ + 1) + " CUMMING!] 你一直扭动着那根肉棒，直到你绝对确定你已经把里面的每一滴精液都榨干了。你的手被淫液浸透了，但你不在乎。[pg]");
            }
            outputText("你左边的搭档非常满意，决定停止折磨自己；他肯定也经历了一场粗暴的手淫。你惊讶地看着他巨大的肉棒开始射出一团团粘稠的液体，以专家的精度瞄准裁判。他淫荡地咧嘴一笑，大喊道：[say: NUMBER " + (_loc4_ - 1) + " CUMMING!][pg]");
            outputText("很快，其他人也开始射精，喊出他们的号码。你听到十几个屈服于身体的人发出充满快感的呻吟，这只会让你更加兴奋，并增加你的精液流量。裁判记录下结果并写在一个小记事本上，但她很难保持记事本上没有白色的污渍，因为所有玩家似乎都把他们的精液瞄准了她。玩家们像荡妇一样呻吟着，声音比以往任何时候都大。整个房间似乎都在爆炸，几十具饥渴的身体在欲望的巅峰释放出他们强大的高潮。几分钟内，整个房间都充满了精液的痕迹，在经历了这种拒绝高潮的狂热之后，每个人都太渴望射精了。[pg]");
         }
         else if(param1 == 2)
         {
            _loc6_ = [{
               "he":"他",
               "him":"他",
               "his":"他的"
            },{
               "he":"她",
               "him":"她",
               "his":"她的"
            }];
            _loc7_ = _loc6_[Utils.rand(int(_loc6_.length))];
            outputText("在似乎长达几个小时的时间里，你试图坚持下去，抵抗着胯下难以忍受的快感一波又一波的冲击。然而，你感觉到你的体力在逐渐耗尽；每一次高潮都越来越难以拒绝。你知道你坚持不了多久了，但你鼓起勇气，在脑海中数到十。肯定有人会在你之前高潮……他们最好现在就做，因为你的精神即将崩溃，你将无法再控制你的身体。天哪，感觉太好了。那只抚摸、挑逗的手正在以一种美味的方式折磨你，但你一直在拒绝这种快感。你必须这样做。它是如此粗暴，如此……[pg]");
            if(get_player().cocks[_loc3_].get_cockType() == CockTypesEnum.ANEMONE)
            {
               outputText("突然，你感觉到抚摸你鸡巴的手失去了节奏，变得踉跄。出于好奇，你把目光投向你的鸡巴，恍然大悟地笑了。你那处于高潮边缘的海葵鸡巴，已经开始用它的催情毒液刺痛抚摸者的手了！你左边的邻座明显在呻吟和喘息，" + _loc7_.his + "鸡巴因中毒的欲望而淫秽地肿胀着。[pg]你的邻座试图再次恢复" + _loc7_.his + "有力的抚摸，但又一连串的刺痛让" + _loc7_.him + "不寒而栗，" + _loc7_.his + "鸡巴喷出了一团先列腺液，提醒着" + _loc7_.him + "这是多么愚蠢。被击败后，" + _loc7_.he + "决定只是缓慢而有条理地抚摸你那刺痛的肉棒。这感觉像是在作弊，但你很可能不会输掉这场比赛！[pg]");
            }
            outputText("你的思绪突然被打断了。[pg]");
            outputText("圈子里有人大喊，[say: NUMBER " + _loc4_ + " CUMMING!] 紧接着另一个声音更大地喊道，[say: NUMBER " + (_loc4_ - 1) + " SCORING!][pg]");
            outputText("确实，一个玩家的鸡巴放弃了耐力比赛，在滚烫的奶油洪流中四处喷洒精液。那真是一次强有力的射精，你钦佩地想。几乎紧随其后，几个玩家也放弃了，开始一边大喊一边射出自己的精液。[pg]");
            outputText("你右边的搭档突然用尖锐的声音喊道，[say: NUMBER " + (_loc4_ + 5) + " CUMMING!]；你立刻明白了，并大喊[say: NUMBER " + (_loc4_ + 4) + " SCORING!]作为回应。你能感觉到你手里握着的鸡巴释放了压力，液体被这个变态的泵四处喷洒。[pg]");
            outputText("你自己的" + get_player().cockDescript(_loc3_) + "被猛烈地拽了一下，提醒你你也需要满足自己生殖器的需求。不再受害怕失败的阻碍，你完全屈服于你的高潮，在释放出你有史以来最丰富的精液之一时，你发出了极其满足和如释重负的叹息。迷失在高潮中，你漫不经心地");
            if(get_player().cumQ() >= 1000)
            {
               outputText("浸透");
            }
            else if(get_player().cumQ() >= 500)
            {
               outputText("污染");
            }
            else
            {
               outputText("弄湿");
            }
            outputText("了地板，你用淫荡的声音大喊：[say: NUMBER " + (_loc4_ + 4) + " CUMMING!]；紧接着，你左边的邻居也宣布得分。你半眯着眼睛，注意到裁判点头确认，你把你的" + get_player().cockDescript(_loc3_) + "对准她，试图也把她弄湿。她勉强躲开，一些精液落在了她的手臂上，但她似乎没有注意到。");
            if(get_player().hasVagina())
            {
               outputText("你的大腿紧绷了几秒钟，然后你的" + get_player().vaginaDescript(0) + "也喷了，在地板上形成了一");
               if(get_player().wetness() >= 4)
               {
                  outputText("大滩");
               }
               else if(get_player().wetness() >= 2)
               {
                  outputText("滩");
               }
               else
               {
                  outputText("抹");
               }
               outputText("淫水。");
            }
            if(get_player().biggestLactation() > 1.5)
            {
               outputText("你的" + get_player().allBreastsDescript() + "也释放出乳白色的洪流，奶油般柔软的感觉挑逗着你的乳头，只让你的高潮更加持久。");
            }
            outputText("[pg]");
            outputText("非常满足，你左边的伴侣决定停止折磨自己；他一定也经历了一场粗暴的手淫。你惊讶地看着他的肉棒开始喷射出一团团粘稠的液体，以专家的精准度瞄准裁判。他淫荡地笑着大喊：[say: NUMBER " + (_loc4_ + 3) + " CUMMING!][pg]");
            outputText("很快，其他人也开始释放自己的精液，喊出他们的号码。你听到十几个人屈服于自己身体的充满快感的呻吟声，这只会让你更加兴奋，增加你的精液流量。裁判记录下结果，并把它们写在一个小记事本上，但她很难保持记事本上没有白色的污渍，因为所有的玩家似乎都把他们的精液瞄准了她。玩家们淫荡地呻吟着，声音比以往任何时候都大。整个房间似乎都在爆炸，几十个饥渴的身体在欲望的巅峰中释放出他们强大的高潮。几分钟后，整个房间里充满了精液的痕迹，每个人在经历了这种高潮剥夺的狂热之后，都太渴望射出他们的精液了。[pg]");
         }
         else
         {
            if(!get_player().hasStatusEffect(StatusEffects.ParasiteSlugReproduction))
            {
               outputText("似乎过了几个小时，你试图坚持下去，抵抗着胯部一波又一波难以忍受的快感。然而，你感觉到你的体力在逐渐耗尽；每一次高潮都越来越难以拒绝。你知道你坚持不了多久了，但你鼓起勇气，在心里数到十。你必须赢。所有这些努力不能白费。肯定有人会在你之前射精……还有其他人，还有其他人。他们最好快点。你不知道你还能控制自己的身体多久。天哪，感觉太好了。那只抚摸、挑逗的手正在以一种美妙的方式折磨着你，但你一直在拒绝这种快感。你必须这样做。它是如此粗暴，如此……[pg]");
            }
            else
            {
               outputText("抚摸和挑逗折磨着你，你渴望释放，一波又一波难以忍受的快感无休止地冲刷着你。通常情况下，你早就在几次抽插前高潮了，但繁殖寄生虫让你永远处于高潮的边缘，不管你喜不喜欢。即使你想输，尽管你付出了所有的努力，你就是不能。每一次抽插都感觉如此美妙，你一直期待着下一次能最终让你达到高潮，因为思想变得越来越难以形成，绝望在你内心翻腾。你真的想输，想让你的前列腺被周围所有的肉棒猛击和操弄，最终得到释放。你知道你不能，你只希望有人输了，这样你就能找到东西来操你的屁股了。[pg]");
            }
            outputText("你的思绪突然被打断了。[pg]");
            outputText("你右边的伴侣用高亢的声音大喊：[say: NUMBER " + (_loc4_ + 1) + " CUMMING!] 你立刻明白过来，并大喊[say: NUMBER " + _loc4_ + " SCORING!]作为回应。[pg]");
            outputText("确实，你能感觉到你手里握着的肉棒压力正在释放，液体在滚烫的奶油洪流中四处喷洒。你钦佩地想，那真是一次强有力的射精。几乎紧接着，几个玩家也放弃了，开始一边大喊一边射出自己的精液。[pg]");
            outputText("圈子里有人大喊[say: NUMBER " + (_loc4_ + 7) + " CUMMING!]，紧接着另一个声音更大地喊道[say: NUMBER " + (_loc4_ + 6) + " SCORING!][pg]");
            if(!get_player().hasStatusEffect(StatusEffects.ParasiteSlugReproduction))
            {
               outputText("对你自己的" + get_player().cockDescript(_loc3_) + "的猛烈拉扯提醒你，你也需要满足你生殖器的需求。在意志力的极大努力下，你抵抗住了。既然你有机会赢，你就不能允许自己现在放弃。你咬紧牙关，继续无视你的" + get_player().cockDescript(_loc3_) + "正在遭受的待遇。[pg]");
            }
            else
            {
               outputText("理性的思考早就离你而去了。你满脑子想的都是射精。射精。必须射精，需要射精。不能射精。你几乎无法克制自己不去帮你左边的伴侣帮你解决。他的手完全被先列腺液浸透了，很明显他不明白为什么你还没有射精，考虑到你的" + get_player().cockDescript(_loc3_) + "跳动得有多厉害。你流着口水，脸因悲伤、绝望和不屈的幸福交织在一起而扭曲。[pg]");
            }
            outputText("备受煎熬之下，你左边的搭档决定不再折磨自己了；他肯定也经历了一场粗暴的手淫。你惊讶地看着他的肉棒开始喷射出一团团粘稠的液体，以专家般的精准度瞄准了裁判。他淫荡地咧嘴一笑，大喊道：[say: 第 " + (_loc4_ - 1) + " 号射了！][pg]");
            outputText("很快，其他人也开始释放自己的欲望，并喊出自己的号码。你听到十几个人屈服于肉体时发出的充满快感的呻吟，这只会让你更加兴奋，并增加你的精液流量。裁判记录下结果并写在一个小记事本上，但她很难保持记事本上没有白色的污渍，因为所有玩家似乎都把精液瞄准了她。玩家们像荡妇一样呻吟着，声音比以往任何时候都大。整个房间似乎都在爆炸，几十具饥渴的肉体在欲望的巅峰释放出强烈的性高潮。几分钟后，整个房间都充满了精液的痕迹，在经历了这种性高潮剥夺的狂热之后，每个人都太渴望射精了。[pg]");
            if(!get_player().hasStatusEffect(StatusEffects.ParasiteSlugReproduction))
            {
               outputText("你在心里默默记下所有还在比赛的人。他们越来越少了。你只需要再坚持一会儿。四……三……二……就是这样。你做到了。呼，你赢得很及时，你的" + get_player().cockDescript(_loc3_) + "已经开始自己抽搐了。摆脱了失败的恐惧，你完全屈服于你的性高潮，在释放出你有史以来最丰富的精液之一时，你发出了极其满足和如释重负的叹息。沉浸在高潮中，你漫不经心地");
               if(get_player().cumQ() >= 1000)
               {
                  outputText("浸透");
               }
               else if(get_player().cumQ() >= 500)
               {
                  outputText("污染");
               }
               else
               {
                  outputText("弄湿");
               }
               outputText("了地板，用你淫荡的声音大喊：[say: 第 " + _loc4_ + " 号射了！] 你半眯着眼睛注意到裁判点头确认，你把你的" + get_player().cockDescript(_loc3_) + "指向她，试图也把她弄湿。她勉强躲开了，一些精液落在了她的手臂上，但她似乎没有注意到。");
               if(get_player().hasVagina())
               {
                  outputText("你的大腿紧绷了几秒钟，然后你的" + get_player().vaginaDescript(0) + "也喷了，在地板上形成了一");
                  if(get_player().wetness() >= 4)
                  {
                     outputText("大滩");
                  }
                  else if(get_player().wetness() >= 2)
                  {
                     outputText("滩");
                  }
                  else
                  {
                     outputText("抹");
                  }
                  outputText("淫水。");
               }
               if(get_player().biggestLactation() > 1.5)
               {
                  outputText("你的" + get_player().allBreastsDescript() + "也释放出乳白色的洪流，奶油般柔软的感觉挑逗着你的乳头，只会延长你的性高潮。[pg]");
               }
            }
            else
            {
               outputText("你在心里默默记下所有还在比赛的人。他们越来越少了。哦，你多么希望自己是那些幸运的失败者之一！现在就射精，然后被无休止地操。如果你现在就能射精，你会放弃你的任务，放弃英格纳姆，放弃你建立的一切。你害怕自己永远无法从这种极其愉悦和创伤性的经历中恢复过来。尽管你尽了最大努力，你还是赢了。[pg]");
            }
         }
         outputText("你喘着粗气，放松下来，筋疲力尽。你的右臂抽筋了，你的" + get_player().cockDescript(_loc3_) + "很酸痛。你周围的人看起来同样疲惫，正在慢慢从这场粗暴的集体手淫中恢复过来。有人轻轻拍了拍你的肩膀。是你左边的邻居：[say: 玩得好。我没想到你会这么……有抵抗力。很少有玩家能和我坚持那么久，因为他们的肉棒通常承受不住我的手淫。] 他接着和你握手；你们俩都沾满了先列腺液和各种鸡巴汁，但你不在乎。你微笑着感谢他带来了一场精彩的比赛和性高潮。每个人似乎都表现出了良好的体育精神，这让人感到有些欣慰。大家都在互相祝贺；你听到各种关于他们刚刚进行的比赛以及对手表现如何的评论。你右边的搭档站在你面前。[say: 哇，你真懂怎么打飞机！那太棒了，你知道吗？我不在乎我有没有赢！] 你告诉他，你很高兴他喜欢你的努力。现在每个人都在轻松地笑着聊天，仿佛他们仍然勃起的鸡巴没有滴着精液，几分钟前他们也没有在疯狂地手淫。");
         if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,339) == 1)
         {
            outputText("你站在那里，有点不知所措，想知道接下来会发生什么。");
         }
         else
         {
            outputText("你加入了他们，祝贺一些人手淫的力度，并评论了你们刚刚进行的打飞机游戏的各个方面。[pg]");
         }
         outputText("裁判之前一直在后面的房间里清理自己身上的精液，突然冲了出来，站在圆圈的中心，她赤裸的红色身体因兴奋而颤抖。[say: 好了，大家排成一排！是时候领取你们的肛交奖励了。][pg]");
         outputText("你惊讶地跳了起来，因为每个人都完全停止了交谈，用一种单一的、雷鸣般的、嗡嗡作响的声音大喊：[say: 操屁眼！操屁眼！操屁眼！操屁眼！] 似乎永远不会结束。[pg]");
         if(get_player().cor < 50)
         {
            outputText("你发现自己和他们一起大喊，对每个人在经历了这场粗暴的手淫之后仍然对被操屁眼充满热情和渴望感到震惊。你希望自己没有那么盲目地跟随别人，但他们太催眠了，他们坚硬闪亮的鸡巴指着天空，一遍又一遍地大喊：[say: 操屁眼！操屁眼！操屁眼！操屁眼！操屁眼！]");
         }
         else
         {
            outputText("你的身体紧绷，想到即将到来的集体肛交狂欢，[eachcock]都硬了起来。你像发情的牛头人一样在欲望中大吼，[say: 操屁股！操屁股！操屁股！操屁股！操屁股！] 和其他人一起喊着。");
         }
         outputText("随着他们有节奏的呼喊，他们开始排成一条直线，他们在队伍中的位置反映了他们的评分。[pg]");
         if(param1 <= 1)
         {
            if(!get_player().hasStatusEffect(StatusEffects.ParasiteSlugReproduction))
            {
               outputText("既然你是赢家，你走到肛交列车的尾部，享受你的奖品。");
            }
            else
            {
               outputText("既然你是赢家，你走到肛交列车的尾部，对不得不忍受更多拒绝的前景感到恐惧。");
            }
         }
         else if(param1 <= 2)
         {
            outputText("你把自己置于两具发情的身体之间。欲望和混乱蒙蔽了你的感官，你看到的只有一根坚硬如石的肉棒和一个大张的肛门，都在等着你来玩弄。");
         }
         else
         {
            outputText("你顺从地把自己放在肛交列车的末端，知道你将不得不忍受其他所有人的抽插。在你的羞耻和欲望中，你只能看到一根巨大的肉棒，在兴奋中颤抖，等着塞进你的屁股缝里。带着");
            if(get_player().cor < 50)
            {
               outputText("淫荡的笑容");
            }
            else
            {
               outputText("恐惧");
            }
            outputText("，你把自己放在那个有着大肉棒的生物面前。它不耐烦地在你的背上摩擦。");
         }
         outputText("当每个人都摆好合适的肛交姿势，肉棒对准肛门时，你做好了准备。[pg]");
         outputText("裁判大喊，[say: 让肛交列车开始吧！][pg]");
         if(param1 <= 1)
         {
            outputText("你简直不敢相信你将能操到一整列火车的肛门和肉棒。这似乎太不真实了……然而，紧张的气氛和精液的气味对你来说太强烈了，你屈服于你的欲望。");
            if(Utils.rand(2) == 0)
            {
               _loc2_ = 3;
               outputText("你急切地抓住面前那奢华、如果冻般柔软的臀部。你注意到在那美丽的屁股下面有一个小穴，正肆意地流出淫液。如果不是那强烈的命令在你的脑海深处回荡，你很容易就会迷失在这个双性人美妙的深处。然而，你的" + get_player().cockDescript(_loc3_) + "记住了它的工作，开始在这些柔软的球体之间挤出一条路，然后进入双性人紧致的肛门。[pg]");
            }
            else
            {
               outputText("你急切地抓住面前那紧实、肌肉发达的臀部，这大概属于某个精力充沛的男性。你将你的" + get_player().cockDescript(_loc3_) + "在他的背上摩擦，它自动开始分泌出先列腺液；当精液顺着他匀称的臀部流下时，你能感觉到他的身体紧绷起来，仿佛他的欲望达到了一个新的高度。尽管如此，你的" + get_player().cockDescript(_loc3_) + "还是记住了它的任务，开始在这些华丽的臀瓣之间挤出一条路，然后进入男人紧致的肛门。[pg]");
               _loc2_ = 1;
            }
            outputText("它在这里舒服地待了几秒钟，然后你记起你是发起肛交列车的人；所以你迅速进入状态，给你的肉棒一个全力的抽插。一旦你开始推，你的鸡奸伙伴就会抓住");
            if(_loc2_ == 1)
            {
               outputText("他");
            }
            else
            {
               outputText("她");
            }
            outputText("自己伴侣的屁股，在压力下也跟着抽插，而那个人又对后面的人做同样的事，以此类推。最后一个人实际上是被脸朝下推到地板上的，但她的屁股撞到了操她的精液管上，让肉棒的主人也跟着撞击，这一切都传回了你自己的肉棒上；当夹着你的" + get_player().cockDescript(_loc3_) + "的屁股撞到你的大腿上时，你舒服地喘着气，决定再抽插一次，再抽插一次，再抽插一次。这很艰难、费力且缓慢，但你的" + get_player().cockDescript(_loc3_) + "得到了超乎想象的回报：每次有屁股撞到别人的屁股时，感觉就像一阵轻柔的刺痛。这就像一股巨大的肛门波浪在人们的肉棒中来回穿梭，而你就是那个乘风破浪的人。很快，操逼列车里的人发出了淫荡的呻吟，经常在波浪击中他们时被打断，然后呻吟得更大声。");
            if(!get_player().hasStatusEffect(StatusEffects.ParasiteSlugReproduction))
            {
               outputText("虽然你的[asshole]没有像其他人一样被猛烈撞击，但你知道你无法长时间跟上这种疯狂的肛交节奏。你操的屁股几乎在自己动，每次抽插都前后抽动，几乎超出了你的控制。你知道你应该带领整个操逼列车，但这种原始的感觉太强烈了。每次你试图让自己以一种更舒服的方式操那个屁股时，它就会在你的大腿上摩擦，让你的" + get_player().cockDescript(_loc3_) + "发狂，粉碎任何连贯思考的企图。你决定放弃，让你的" + get_player().cockDescript(_loc3_) + "自己完成工作。当你无情地猛击这个屁股时，快感上升，让它的主人加入了呻吟的合唱。[pg]");
               tentacleFapSpecial(param1);
               outputText("你最终达到了最后的顶峰，开始卸下光荣的负荷，淹没了你伴侣的结肠。当精液从你的尿道中自由流出时，你发出了自己的高潮尖叫，凶猛地抓住你手中的丰满臀部，将手指深深地陷入柔软的皮肤中。你射了，射了，又射了，你的肉棒在伴侣的肛门里自己震动；与此同时，肛交列车里的其他人也开始高潮，每个人的身体都紧绷和收缩，仿佛他们想把每一盎司可用的种子都挤进他们的屁股里。");
               _loc5_ = tentacleFapCum();
               if(get_player().cockTotal() > 2 || !_loc5_ && get_player().cockTotal() > 1)
               {
                  if(get_player().cockTotal() > 3 || !_loc5_ && get_player().cockTotal() > 2)
                  {
                     outputText("你的其他肉棒也喷出了");
                  }
                  if(_loc5_ && get_player().cockTotal() == 3 || get_player().cockTotal() == 2 && !_loc5_)
                  {
                     outputText("你的另一根肉棒也喷出了");
                  }
                  outputText("一股");
                  if(get_player().cumQ() > 1000)
                  {
                     outputText("强力的");
                  }
                  else if(get_player().cumQ() > 500)
                  {
                     outputText("巨大的");
                  }
                  else
                  {
                     outputText("不错的");
                  }
                  outputText("喷射出");
                  if(get_player().cockTotal() > 3 || !_loc5_ && get_player().cockTotal() > 2)
                  {
                     outputText("它们的");
                  }
                  else
                  {
                     outputText("它的");
                  }
                  outputText("自己的，不受紧紧夹住你第一根" + get_player().cockDescript(_loc3_) + "的紧致肠道的阻碍。");
               }
               if(get_player().hasVagina())
               {
                  outputText("你的女性部位也喷出了一");
                  if(get_player().wetness() >= 5)
                  {
                     outputText("巨大的");
                  }
                  else if(get_player().wetness() >= 3)
                  {
                     outputText("大量的");
                  }
                  else
                  {
                     outputText("不错的");
                  }
                  outputText("股淫液，仿佛在与男性的对应物竞争。");
               }
               outputText("[pg]在痛苦与快感交织中，你皱起眉头，你的" + get_player().cockDescript(_loc3_) + "在深深埋入伴侣的屁股后，喷出最后一点浓浆，然后停歇下来。你倒了下去，像多米诺骨牌一样让整个队伍都停了下来。在这场狂热的肛交之后，这列爆菊火车已经耗尽了燃料。[pg]");
            }
            else
            {
               outputText("你像发情的野兽一样操着面前的屁股，无休止地抽插。每一次挺进都将先列腺液射入伴侣的肛门，很快大部分液体就溢了出来，被你狂暴的抽插带出。你内心深处有一丝微小的希望，如果足够努力，你就能达到高潮。你越来越卖力，伴侣的呻吟声也越来越高亢，毫无疑问，你给了他一生中最爽的性爱。你的伴侣高潮了，很快整列爆菊火车也开始高潮，他们的身体紧绷收缩，试图将每一滴精液都榨进他们的屁股里。所有人，除了你。[pg]");
               outputText("你看着爆菊火车在你面前倒下。当所有人都在休息时，一半是因为满足，一半是因为疼痛，而你却比以往任何时候都更加绝望和欲求不满。[pg]");
            }
         }
         else if(param1 == 2)
         {
            outputText("你几乎立刻感觉到有力的手臂在摸索你的[ass]，一根勃起的阴茎龟头在敲打你肠道的大门。它慢慢地按摩着你的直肠，当你感觉到一阵快感传遍全身时，你忍不住咯咯地笑了起来。[pg]");
            if(Utils.rand(2) == 0)
            {
               outputText("你急切地抓住面前那丰满、如果冻般柔软的臀瓣。你注意到那翘臀下有一个小穴，正肆意流淌着爱液。如果不是那强烈的命令在你脑海深处回荡，你很容易就会迷失在双性人那美妙的深处。尽管如此，你的" + get_player().cockDescript(_loc3_) + "还是记住了它的工作，开始在这些柔软的球体之间挤出一条路，然后进入双性人紧致的肛门。[pg]");
            }
            else
            {
               outputText("你急切地抓住面前那紧实、肌肉发达的臀部，这大概属于某个精力充沛的男性。你将你的" + get_player().cockDescript(_loc3_) + "在他的背上摩擦，它自动开始分泌出先列腺液；当精液顺着他匀称的臀部流下时，你能感觉到他的身体紧绷起来，仿佛他的欲望达到了一个新的高度。尽管如此，你的" + get_player().cockDescript(_loc3_) + "还是记住了它的任务，开始在这些华丽的臀瓣之间挤出一条路，然后进入男人紧致的肛门。[pg]");
            }
            outputText("你突然听到身后传来一声闷哼。大概是队伍后面有人被插了。你为即将到来的肛交做好了准备……它来了。那根肉棒全力冲进你的[ass]，然后一路深入你的结肠；你唯一的保护就是它的主人涂抹的大量先列腺液。");
            get_player().buttChange(5 + Utils.rand(15),true,true,false);
            outputText("出于本能，你伸手去抓那个等待着你的" + get_player().cockDescript(_loc3_) + "的屁股，拼命地推着。你注意到你的鸡奸伙伴也对他前面的屁股做着同样的事，以此类推。最终，最后一个人被面朝下推倒在地，但她的屁股撞到了操她的肉棒，让肉棒的主人也跟着撞了一下，这一切又传回了你自己的肉棒；当你的屁眼在身后那根肿胀的肉棒上进一步刺穿时，你舒服得倒吸了一口凉气。你有节奏地被推拉着，你跳动的肉棒和操你的那根肉棒在这缓慢的肛门快感浪潮中都充当了载体。你无法控制自己的抽插，放任自己的身体，享受着被双向推挤的感觉，每一次动作都会给你的胯下或你的[ass]带来一阵快感。你慢慢地被你操着的屁股那美妙的紧致感，以及猛击你自己的那块肥肉所淹没。这种原始的感觉最终证明对你饥渴的身体来说太过强烈，你猛地向后仰起头，像个荡妇一样呻吟着，等待着即将到来的高潮。[pg]");
            tentacleFapSpecial(param1);
            outputText("随着一股乳白色的精液洪流进入你的尿道，顺着你鸡奸伙伴的结肠流下，你的胯下压力骤增。几乎同时，你感觉到一股同样浓稠的精液喷射在你自己的[ass]里。在高潮的顶峰，你脑子里除了进出你身体的稳定精液流之外，什么也想不起来。");
            _loc5_ = tentacleFapCum();
            if(get_player().cockTotal() > 2 || !_loc5_ && get_player().cockTotal() > 1)
            {
               if(get_player().cockTotal() > 3 || !_loc5_ && get_player().cockTotal() > 2)
               {
                  outputText("你的其他肉棒也喷出了");
               }
               if(_loc5_ && get_player().cockTotal() == 3 || get_player().cockTotal() == 2 && !_loc5_)
               {
                  outputText("你的另一根肉棒也喷出了");
               }
               outputText("一股");
               if(get_player().cumQ() > 1000)
               {
                  outputText("强力的");
               }
               else if(get_player().cumQ() > 500)
               {
                  outputText("巨大的");
               }
               else
               {
                  outputText("不错的");
               }
               outputText("喷射出");
               if(get_player().cockTotal() > 3 || !_loc5_ && get_player().cockTotal() > 2)
               {
                  outputText("它们的");
               }
               else
               {
                  outputText("它的");
               }
               outputText("自己的，不受紧紧夹住你第一根" + get_player().cockDescript(_loc3_) + "的紧致肠道的阻碍。");
            }
            if(get_player().hasVagina())
            {
               outputText("你的女性部位也喷出了一");
               if(get_player().wetness() >= 5)
               {
                  outputText("巨大的");
               }
               else if(get_player().wetness() >= 3)
               {
                  outputText("大量的");
               }
               else
               {
                  outputText("不错的");
               }
               outputText("股淫液，仿佛在与男性的对应物竞争。");
            }
            outputText("[pg]最后，所有射精的强度都开始减弱，你那消退的高潮也是如此。在痛苦与快感交织中，你的" + get_player().cockDescript(_loc3_) + "在休息前喷出了最后一点粘液，深深地埋在伴侣的屁股里。你倒下了，像多米诺骨牌一样让后面的人也跟着倒下。当你慢慢打瞌睡时，你对那根仍然半勃起、插在你[ass]里的肉棒产生了一种特殊的想法。那辆装满屁股和肉棒的火车……感觉如此正确，如此强大，如此……紧密相连。[pg]");
         }
         else
         {
            outputText("你几乎立刻感觉到有力的双臂在摸索你的[ass]，一根勃起的肉棒顶端正在敲打你肠道的大门。它慢慢地按摩着你的直肠，当你感觉到一阵快感传遍全身时，你忍不住咯咯地笑了起来。你为这疯狂的爆菊列车做好了准备，而你就在这列车的末端。[pg]");
            outputText("你突然听到身后传来一声闷哼。可能有人在列车后部被插入了。你为即将到来的肛交做好了准备……它来了。那根肉棒全速冲进你的[ass]，然后一路深入你的肠道；你唯一的保护就是它的主人涂抹的大量先列腺液。");
            get_player().buttChange(5 + Utils.rand(10),true,true,false);
            outputText("你被脸朝下推倒在地，你的屁股撞在肛交伴侣的胯部，进一步刺穿在那根粗壮勃起的肉棒上。当这双手的主人给你另一次疯狂、不受控制的冲刺时，他的手粗暴地将手指插入你脸颊柔软的肉中，他是身后欲望列车的化身。也许三十个人爆菊的力量对他来说太难以承受了，所以他把它传递给了你。但与他不同的是，你没有一个屁眼可以够到并把你的" + get_player().cockDescript(_loc3_) + "埋进去，所以你一次又一次地被砸在地板上。这很痛，但感觉如此……充满力量，如此强壮。只有一根肉棒在捣你的" + get_player().assDescript() + "，但感觉就像你同时被三十个人爆菊一样。在三十次冲刺的力量推动下，巨大的肉棒在你可怜的[asshole]里撕裂出一条路，不用说，作为这条线的终点可能是你经历过的最艰难的爆菊。[pg]");
            tentacleFapSpecial(param1);
            outputText("你感觉到那根高耸的肉棒在你肠道粗糙的内壁上摩擦，这种摩擦带来了一种可耻的、令人惊叹的被侵犯感。那双大手轻松而狂热地抓握、捏弄和摸索着你的" + get_player().buttDescript() + "，你受虐的肉体感觉到了每一次刺痛、每一次刺痛，每一次都把你推向边缘。你知道你正在被那根肉棒凶猛地支配，但这种快感太好了，你根本不在乎。这种原始的感觉最终证明对你发情的身体来说太强烈了，你只是躺在灰尘中，等待着即将到来的高潮。最终，你感觉到大量的精液喷射在你的体内。几乎立刻，你开始以稳定的速度射出浓稠的精液。像一个毫无价值的荡妇一样在沾满性液的泥潭中打滚，你更用力地将你的[ass]在肉棒上摩擦，为了榨干它流出的每一滴精液。但你的肠道很快就达到了极限，精液开始小股地流出。");
            tentacleFapCum();
            if(get_player().hasVagina())
            {
               outputText("你的女性部位也喷出了一");
               if(get_player().wetness() >= 5)
               {
                  outputText("巨大的");
               }
               else if(get_player().wetness() >= 3)
               {
                  outputText("大量的");
               }
               else
               {
                  outputText("不错的");
               }
               outputText("股淫液，仿佛在与男性的对应物竞争。");
            }
            outputText("[pg]你倒下了，仍然感觉到那根精液管埋在你体内。");
            if(get_player().lib > 50)
            {
               outputText("也许输了也没那么糟？你觉得你还可以再输几次……");
            }
            outputText("[pg]");
         }
         if(param1 <= 1)
         {
            outputText("你迅速站起来开始穿衣服。在你走之前，可爱的小裁判递给你一个小盒子，她羞涩的笑容和赤裸的身体不知怎么的又唤醒了[eachcock]。天哪，没完没了。[say:这是给本场比赛获胜者的一点小礼物。希望你喜欢你的奖品。欢迎再来玩！]");
            _loc8_ = get_consumables().GROPLUS;
            switch(Utils.rand(3))
            {
               case 0:
                  _loc8_ = get_consumables().GROPLUS;
                  break;
               case 1:
                  _loc8_ = get_consumables().S_DREAM;
                  break;
               case 2:
                  _loc8_ = get_consumables().L_BLUEG;
                  break;
               default:
                  _loc8_ = get_consumables().GROPLUS;
            }
            _loc9_ = KFLAGS.flags;
            FlagDict_Impl_.arrayWriteInt(_loc9_,335,FlagDict_Impl_.arrayReadInt(_loc9_,335) + 1);
            if(!get_player().hasStatusEffect(StatusEffects.ParasiteSlugReproduction))
            {
               get_player().orgasm("Dick");
            }
            get_inventory().takeItem(_loc8_,get_camp().returnToCampUseOneHour);
         }
         else if(param1 == 2)
         {
            outputText("你尴尬地把肉棒从屁股里拔出来，开始穿衣服。在你走之前，可爱的小裁判向你挥手，她羞涩的笑容和赤裸的身体不知怎么的又唤醒了[eachcock]。天哪，没完没了。[say:希望你喜欢这场比赛。祝你下次好运……]");
            get_player().orgasm("Anal");
            doNext(get_camp().returnToCampUseOneHour);
         }
         else
         {
            outputText("你尴尬地把肉棒从屁股里拔出来，开始清理身上的污垢和精液，然后离开帐篷。在你走之前，赤裸的裁判走近你，轻轻地捏了捏你的" + get_player().cockDescript(_loc3_) + "；你仍然因为刚才的捣弄而退缩。[say:哦，看来你经历了一段艰难的时光，不是吗？嗯，有时候会发生这种事。希望你会在这方面做得更好。下场比赛见！]");
            get_player().orgasm("Anal");
            doNext(get_camp().returnToCampUseOneHour);
         }
      }
      
      public function fapArenaPageII() : void
      {
         var place2:Number;
         var _g2:FapArena;
         var place1:Number;
         var _g1:FapArena;
         var place:Number;
         var _g:FapArena;
         var _loc1_:IMap = KFLAGS.flags;
         FlagDict_Impl_.arrayWriteInt(_loc1_,334,FlagDict_Impl_.arrayReadInt(_loc1_,334) + 1);
         clearOutput();
         var _loc2_:int = get_player().longestCock();
         outputText("[say: 准备！][pg]");
         if(get_player().cor > 66)
         {
            outputText("你急切地抓住右边的肉棒；不耐烦地稍微捏了捏。一阵轻微的刺痛提醒你，你左边的邻居正用熟练的手法抓住[onecock]。你周围的每个人都迅速抓住了他们右边最近的阴茎。他们中的一些人因为压力和兴奋而颤抖着。[pg]");
         }
         else if(get_player().cor > 33)
         {
            outputText("你紧张地抓住右边的肉棒。在压力下，你忍不住轻轻捏了捏它。当你左边的邻居用熟练的手法抓住[onecock]时，你颤抖了一下。大多数人都和你一样紧张，他们赤裸的身体在压力下颤抖着。[pg]");
         }
         else
         {
            outputText("你犹豫地用笨拙的手抓起右边的肉棒。你差点松手，因为你太紧张了，而它的主人微笑着：显然你对阴茎没什么经验。");
            outputText("当你左边的邻居以一种令人不安的熟练手法抓住[onecock]时，你忍不住吃了一惊。其他玩家也很紧张，但没有一个像你这样。看到所有这些颤抖的阴茎让你不寒而栗。[pg]");
         }
         outputText("你稳稳地将你的[legs]踩在地上，准备迎接即将到来的手交，以及你将要给予的手交。你老练的战士本能开始发挥作用，你放松了右手握住的肉棒，开始让自己平静下来。当你准备好时——");
         outputText("[say: 开始！][pg]");
         outputText("当握住你" + get_player().cockDescript(_loc2_) + "的手开始充满活力地上下套弄时，你立刻退缩了一下。天哪，不管他是什么，他都很擅长这个。你突然想起你自己的手也有工作要做，于是你开始摩擦你右边的肉棒，一开始很慢，随着你越来越自信，速度越来越快。很快你就开始疯狂地抚摸它，试图在强度上跟上你左边伙伴的节奏。由于英格纳姆没有组织过任何手淫耐力比赛，你在这方面相当缺乏经验，并尽可能地模仿你左边的伙伴，用他施加给你的快感作为如何对待你自己的受害者的建议。你摩擦敏感点，你挠尿道，当你的手在它抚摸的巨大阴茎上慢慢上下移动时，用手掌轻轻挤压。然而，你最大的努力是忽略那只熟练地套弄你自己的" + get_player().cockDescript(_loc2_) + "的手，它恶毒地按摩着它，以便将精液泵入你的尿道。你的勃起变得更大了，如果这可能的话；但你设法忍住了即将到来的高潮。[pg]");
         outputText("你继续用力抚摸那根肉棒，同时试图忽略你自己的" + get_player().cockDescript(_loc2_) + "正在接受的手淫，你的努力得到了回报：很快，先列腺液开始从你正在手淫的工具的尖端滴落，你的手继续用它自己的汁液涂抹那根阴茎；你注意到它变得稍微大了一点。帐篷里一片死寂；你只听到阴茎皮肤被拉伸而产生的几声轻柔的砰砰声：啪啪啪啪啪啪啪啪……偶尔会有一个玩家打破沉默，因为他们的嘴唇发出响亮、充满快感的呻吟。[pg]");
         outputText("节奏越来越快；因为害怕输掉，每个人的手淫都变得越来越粗暴，每个玩家都希望他们能让右边的伙伴在自己屈服之前达到高潮。每个人看起来都非常专注，试图尽可能少地暴露他们当前的紧张情绪，当一声闷哼从他们的嘴唇中传出时，他们内心狂怒。你在这里多久了，处理一个陌生人的阴茎？你不知道，但比赛似乎即将结束：几乎每个人的肉棒现在都流淌着先列腺液，微弱的抽插声逐渐被吧唧声和滑腻声所取代。有");
         if(get_player().hasVagina())
         {
            outputText("其他");
         }
         outputText("房间里的扶他：可爱的脸蛋，摇晃的乳房，曲线优美的身体，柔软的臀部；如果不是那根巨大的、流着先列腺液的、突出的阴茎，她们看起来几乎就像正常的女性。她们似乎和其他人一样全神贯注，唯一的区别是她们的女性体液从湿润的小穴中自由流出，偶尔会有少女般的呻吟从她们的嘴唇中逸出。随着温度越来越高，男性生殖器温暖、麝香的气味开始弥漫整个房间，你发现自己更加兴奋了。你闭上眼睛，为了不再用火辣、饥渴、赤裸的身体的景象折磨自己。你不知道你是否还能坚持更长时间。[pg]");
         var _loc3_:Boolean = true;
         if(Utils.rand(100) <= 4)
         {
            _loc3_ = false;
         }
         var _loc4_:Number = get_player().sens;
         var _loc5_:Number = get_player().get_hoursSinceCum();
         var _loc6_:Number = 0;
         if(get_player().cocks[_loc2_].get_cockType() == CockTypesEnum.DEMON)
         {
            _loc6_ = 10;
         }
         else if(get_player().cocks[_loc2_].get_cockType() == CockTypesEnum.TENTACLE)
         {
            _loc6_ = 5;
         }
         else if(get_player().cocks[_loc2_].get_cockType() == CockTypesEnum.LIZARD)
         {
            _loc6_ = 3;
         }
         else if(get_player().cocks[_loc2_].get_cockType() == CockTypesEnum.HORSE)
         {
            _loc6_ = 2;
         }
         var _loc7_:Number = get_player().lustPercent() / 100;
         var _loc8_:Number = Utils.rand(100);
         var _loc9_:Number = _loc6_ + (_loc8_ - _loc4_ * _loc7_ - 4 * _loc5_) / (1.2 + _loc5_ / 10);
         if(get_player().hasStatusEffect(StatusEffects.ParasiteSlugReproduction))
         {
            _loc9_ = 31;
         }
         if(get_player().cocks[_loc2_].get_cockType() == CockTypesEnum.ANEMONE && _loc9_ <= 0)
         {
            _loc9_ = 1;
         }
         if(_loc9_ <= 0)
         {
            _g = this;
            place = 3;
            doNext(function():void
            {
               _g.fapResults(place);
            });
         }
         else if(_loc9_ < 29.5)
         {
            _g1 = this;
            place1 = 2;
            doNext(function():void
            {
               _g1.fapResults(place1);
            });
         }
         else
         {
            _g2 = this;
            place2 = 1;
            doNext(function():void
            {
               _g2.fapResults(place2);
            });
         }
      }
      
      public function fapArenaGOOOO() : void
      {
         var _loc2_:* = null as IMap;
         clearOutput();
         var _loc1_:int = get_player().longestCock();
         if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,339) == 0)
         {
            outputText("当你靠近帐篷时，你注意到这些人实际上是在排队，愉快地互相交谈着。那里有各种各样的物种，从可爱的小地精和长着啮齿动物般牙齿的鼠人，到高耸的半人马和牛头人，后者身上强烈的气味很容易被注意到。你偶尔会看到长着锋利牙齿的犬娘或鲨鱼种马，一些传统的梦魔，以及一些因为吃了腐化植物而变异的触手怪。甚至还有几个人类，满不在乎地站在队伍里聊天，仿佛其他人不是怪物一样。让你惊讶的是每个人都非常有礼貌。显然每个人都习惯了这个地方。[pg]");
         }
         outputText("队伍向前移动，你终于来到了帐篷入口处，守卫是一个出奇高大的地精。她用评估的眼神看着你，突然用左手抓住你的胯部，揉了一秒钟，然后说，");
         if(get_player().longestCockLength() < 8 && !get_lowStandards() || !get_player().hasCock())
         {
            outputText("[saystart]恐怕你的天赋不够，不能参加我们的集会。请在");
            if(!get_player().hasCock())
            {
               outputText("你长出鸡巴后再来。");
            }
            else
            {
               outputText("你的鸡巴足够长后再来。");
            }
            outputText("[sayend]");
            doNext(get_bazaar().enterTheBazaar);
            return;
         }
         if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,339) == 0)
         {
            _loc2_ = KFLAGS.flags;
            FlagDict_Impl_.arrayWriteInt(_loc2_,339,FlagDict_Impl_.arrayReadInt(_loc2_,339) + 1);
            outputText("[say: 你一定是新来的。去左边的里屋，脱掉衣服，和主房间里的其他人一起等；集会很快就会开始。][pg]");
            outputText("你温顺地跟着其他人走进后面的房间，开始脱下你的[armor]。你看着其他人，进来时衣冠楚楚，出去时一丝不挂。这些人随意地说笑着，勃起的阴茎高高翘起，这种格格不入的感觉一直困扰着你，然后你终于明白了：这里每个人都有鸡巴。即使是那些长着丰满乳房和宽大臀部、看起来很女性化的人，实际上也是扶他，他们巨大的勃起就是证明。[pg]");
            outputText("你有点困惑，决定跟着大家走。他们都聚集在圆形的中央大厅里，围成一个很大的圆圈。大约有30个人和他们的鸡巴光着身子站在这里，你也站进圈子里。等大家都站好后，谈话声渐渐停止，一个红皮肤、长着AV女优般巨乳的魅魔走了进来。她一丝不挂，如果说三十个光着身子、鸡巴像马一样长的裸体还不够让人兴奋的话，她那滴着淫液的小穴似乎像磁铁一样吸引着你的" + get_player().cockDescript(_loc1_) + "。等等……她没有鸡巴？[pg]");
            outputText("你尴尬地轻轻拍了拍右边邻居的肩膀，尽量不把注意力集中在他高耸的肉棒上，小声问道：[say: 为什么我们都有鸡巴，就她没有？][pg]");
            outputText("那生物用同样的语气回答道：[say: 她是裁判。她会向新人解释规则的，别担心。][pg]");
            outputText("迷人的恶魔走到圆圈中央，开始用响亮清晰的声音说道：[say: 欢迎来到这场新的自慰大会！因为我看到了一些生面孔，这里可能有些人是新来的；我将重申一下规则。请务必遵守，否则我们将不得不取消你们的资格。][pg]");
            outputText("[say: 当我说“准备”时，每个人都要抓住你右边人的鸡巴。你必须且只能抓住一根鸡巴。如果你的右边邻居碰巧有多根鸡巴，你必须抓住最长的那根。右手抓着一根以上鸡巴的玩家将被取消资格。][pg]");
            outputText("[say: 当我说“开始”时，每个人都要开始套弄手中的鸡巴，直到它射精。不要放开这根鸡巴。你可以用任何你喜欢的方式套弄它，但你必须只能使用右手。严禁使用其他手、触手、嘴、乳头或生殖器进行任何形式的辅助刺激。以违规方式刺激鸡巴的玩家将被取消资格。]你听到了一些压抑的轻笑声。显然，有些玩家并不反感进一步的“刺激”，即使以作弊为代价。[pg]");
            outputText("魅魔继续说道：[say: 你们必须坚守阵地。如果你觉得你的鸡巴被拉得太远，用你的左手抓住你左边的伙伴。否则，你不允许打断你左边邻居的套弄。阻止别人抚摸自己鸡巴的人将被取消资格。][pg]");
            outputText("[say: 当第一滴精液流出时，鸡巴就被认为是射精了。先列腺液不算。你们每个人都会被分配一个号码。每当有鸡巴射精时，你必须大喊你的号码，如果射精的是你右边邻居的鸡巴，接着喊“得分”；如果是你自己的鸡巴射精，接着喊“射了”。最后射精的玩家是赢家，最先射精的玩家是输家。高潮顺序将被记录下来，用于大会的第二部分。宣布假阳性结果的玩家将被取消资格。][pg]");
            outputText("[say: 一旦所有人都射精了，输家将站在圆圈中央，弯下腰，露出臀部。第二个射精的玩家将站在他正后方，摆出操弄的姿势，第三个射精的玩家将站在他后面，以此类推。赢家将站在所有人的最后面。他将进行第一次抽插，所有人都要跟上。赢家决定抽插的节奏。我强烈建议你们尊重操弄的节奏。你们这些种马明白了吗？][pg]");
            outputText("所有人都点头同意，双手和生殖器因兴奋而颤抖着。");
            if(get_player().cor > 66)
            {
               outputText("听起来很有趣！");
            }
            else
            {
               outputText("天哪，你在这里做什么？");
            }
            outputText("[pg]你要留下来吗？");
            doYesNo(fapArenaPageII,get_bazaar().enterTheBazaar);
         }
         else
         {
            outputText("[say: 欢迎回来。请在后面的房间脱下衣服，然后在主房间和其他人一起等候。][pg]");
            outputText("你照做了，迅速脱下你的[armor]，光着身子来到主房间，和其他人一起围成一圈等待。你和其他人愉快而随意地聊着天，试图认出一些面孔。你尽量把自己安排在还不认识的人中间，以便每次都能体验到不同的快感。几分钟后，看到这么多裸体，[eachcock]完全勃起，性感的裁判走了进来，像往常一样一丝不挂。[pg]");
            outputText("[say: 好了。欢迎大家；我在这里没有看到生面孔，所以我假设大家都知道规则，我们将直接进入自慰游戏，我相信你们都迫不及待地想玩了。记住：不允许使用其他刺激方法。你们这些种马明白了吗？][pg]");
            outputText("所有人都点头同意，双手和生殖器因兴奋而颤抖着。");
            if(get_player().cor > 66)
            {
               outputText("你期待着这场新的自慰大会。");
            }
            doNext(fapArenaPageII);
         }
      }
      
      public function fapAppearance(param1:Boolean = true) : void
      {
         if(param1)
         {
            if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,339) == 0)
            {
               outputText("[pg]空地上矗立着一个巨大的帐篷，周围聚集了一大群人。也许你可以去调查一下，看看里面在发生什么。");
            }
            else
            {
               outputText("[pg]一大群人正聚集在那个大帐篷周围，可能又要进行一次“集会”了。也许你可以加入他们？");
            }
         }
      }
   }
}

