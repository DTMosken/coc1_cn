package classes.items.consumables
{
   import classes.BreastRow;
   import classes.CoC;
   import classes.DynStat;
   import classes.Player;
   import classes.display.SpriteDb;
   import classes.items.Consumable;
   import classes.scenes.Camp;
   import flash.Boot;
   
   public class TatteredScroll extends Consumable
   {
      
      public function TatteredScroll()
      {
         if(Boot.skip_constructor)
         {
            return;
         }
         super("TScroll","TatteredScroll","a tattered scroll",6,"A tattered scroll written with strange symbols. You have the uncanny feeling that if you tried to, you could somehow decipher it.");
      }
      
      override public function useItem() : Boolean
      {
         var _loc1_:int = 0;
         outputText("你摇摇晃晃的[legs]支撑不住你的身体，你的意志力似乎蒸发了，你的嘴用一种倒放的歌唱般的声音读着卷轴上的字。[pg]");
         if(get_player().hair.color == "sandy blonde")
         {
            outputText("你的嘴不受控制地露出微笑，读道：[say: Tresed eht retaw llahs klim ruoy.][pg]");
            if(int(get_player().breastRows.length) == 0 || get_player().biggestTitSize() == 0)
            {
               outputText("你长出了一对完美的C罩杯乳房！");
               if(int(get_player().breastRows.length) == 0)
               {
                  get_player().createBreastRow();
               }
               get_player().breastRows[0].breasts = 2;
               get_player().breastRows[0].breastRating = 3;
               if(get_player().breastRows[0].nipplesPerBreast < 1)
               {
                  get_player().breastRows[0].nipplesPerBreast = 1;
               }
               dynStats(DynStat.Sens(2),DynStat.Lust(1));
            }
            if(get_player().biggestTitSize() >= 1 && get_player().biggestTitSize() < 3)
            {
               outputText("你的乳房突然向外膨胀，直到变成完美的C罩杯才停下来。");
               get_player().breastRows[0].breastRating = 3;
               dynStats(DynStat.Sens(1),DynStat.Lust(1));
            }
            if(get_player().averageNipplesPerBreast() < 1)
            {
               outputText("每个乳房上都出现了一个黑点，迅速形成了一个敏感的乳头。");
               _loc1_ = int(get_player().breastRows.length);
               while(_loc1_ > 0)
               {
                  _loc1_--;
                  if(get_player().breastRows[_loc1_].nipplesPerBreast < 1)
                  {
                     get_player().nippleLength = 0.2;
                  }
                  get_player().breastRows[_loc1_].nipplesPerBreast = 1;
               }
               dynStats(DynStat.Sens(2),DynStat.Lust(1));
            }
            if(get_player().biggestLactation() > 0)
            {
               outputText("你的胸口产生了一股强烈的压力，痛得厉害。你猛地拉下上衣，因为");
               if(get_player().biggestLactation() < 2)
               {
                  outputText("强劲的乳汁从你的乳头喷射而出，在地上喷出粗壮的水流。你在这感觉中呻吟着，挤压着你的乳房，用你的乳汁浇灌着这片被污染的土地。乳汁停止喷射后，你红了脸，对自己产奶量的增加感到非常尴尬。");
               }
               if(get_player().biggestLactation() >= 2 && get_player().biggestLactation() <= 2.6)
               {
                  outputText("乳汁从你的乳头喷涌而出，到处喷洒着粗壮的水流。这种液体不断涌出的感觉非常色情，你觉得自己越来越兴奋。随着水流减弱，你开始挤压乳房，渴望继续这种快感，但美好的事物终究会结束。");
               }
               if(get_player().biggestLactation() > 2.6 && get_player().biggestLactation() < 3)
               {
                  outputText("粗壮的乳汁从你酸痛的乳头喷涌而出，在地上汇成水坑。你微笑着看着自己如何喂养大地，你的乳汁覆盖地面的速度比它被吸收的速度还要快。持续的泌乳令人愉悦……以一种高度色情的方式，你发现自己呻吟着，拉扯着乳头，双手完全失去了控制。过了一会儿，你意识到乳汁已经停止了，甚至有时间渗入泥土。你对自己的奇怪想法感到惊讶，把手从敏感的乳头上拿开。");
               }
               if(get_player().biggestLactation() >= 3)
               {
                  outputText("你跪倒在地，抓住自己的乳头。伴随着一声极具性暗示的呻吟，你开始给自己挤奶，喷出大量的乳汁。你喘息着，咕哝着，尽可能多地奉献你的乳汁。它像小溪一样顺着山坡流下，你忍不住因为自豪……和欲望而脸红。当你尽最大努力用所有的乳汁喂养大地时，色情的快感不断累积。你在高潮的边缘徘徊了仿佛一个世纪，到处都是乳汁。当你回过神来时，你意识到自己正跪在那里，拉扯着干瘪的乳头。你尴尬地停了下来，但你的性唤起依然存在。");
               }
               if(get_player().biggestLactation() < 3)
               {
                  get_player().boostLactation(0.7);
                  outputText("你的乳房感觉更饱满了……更成熟了……好像你下一次挤奶会更多。");
               }
               dynStats(DynStat.Lib(1),DynStat.Sens(4),DynStat.Lust(15));
            }
            if(get_player().biggestLactation() == 0)
            {
               outputText("一种令人愉悦的释放突然从你的乳头喷发！两股乳汁从你的乳房喷射而出，立刻渗入地下。它停得太快了，尽管你脑海中的一个声音向你保证，你现在可以经常泌乳了。");
               get_player().boostLactation(1);
               dynStats(DynStat.Lib(0.5),DynStat.Sens(1),DynStat.Lust(10));
            }
            outputText("[pg]你的嘴角勾起一抹病态的微笑，用一种不属于你的声音说道：[say: 我总是能得到我想要的，亲爱的……]");
            doNext(get_camp().returnToCampUseOneHour);
         }
         else
         {
            outputText("你的嘴不受控制地露出微笑，读道：[say: 漠中赤日灼如沙，沙发缠梦乐无涯——]");
            outputText("[pg]你感到头皮一阵刺痛，意识到你的头发变成了沙金色！");
            get_player().hair.color = "sandy blonde";
            outputText("[pg]你的嘴角勾起一抹病态的微笑，用一种不属于你的声音说道：[say: 我总是能得到我想要的，亲爱的……]");
            doNext(get_camp().returnToCampUseOneHour);
         }
         if(!get_game().get_inCombat())
         {
            spriteSelect(SpriteDb.get_s_sandwich());
            outputText("[pg]你听到身后传来衣服落地的轻柔声音，转头一看，沙漠女巫已经找到了你！你忍不住偷看这位不速之客，映入眼帘的是一位曲线优美的黑皮肤美人，她那四个正在分泌乳汁的乳房占据了你的视线。在你被欲望蒙蔽的脑海中，你隐约察觉到上面那对大约是DD罩杯，下面那对则是C罩杯。她微笑着俯身，猛地将你推倒在地。");
            outputText("[pg]她转过身，一屁股坐下，将她那湿润的蜜壶紧紧贴在你的嘴上。她的气味浓烈，带着压倒性的强度。你的舌头探出想要品尝，却发现了一个充满粘稠甜味的宝库。你本能地用舌头操她，贪婪地吞咽着她的淫液，尽可能深地把舌头伸进去，同时吸吮着她的阴蒂。你隐约感觉到乳汁溅落在你身上，又从你身上溅落到干裂的土地上。乳汁触及的每一处都感觉如丝般光滑敏感，你的双手开始抚摸自己的身体，随着女巫喷出越来越多的乳汁，你不断地揉搓着。你失去了时间的概念，高潮了无数次，浑身沾满了粘稠的性液。");
            get_player().orgasm("Generic");
            dynStats(DynStat.Lib(1),DynStat.Sens(5));
            get_player().slimeFeed();
         }
         return false;
      }
   }
}

