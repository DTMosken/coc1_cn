package classes.items.armors
{
   import classes.PerkLib;
   import flash.Boot;
   
   public final class InquisitorsRobes extends ArmorWithPerk
   {
      
      public function InquisitorsRobes()
      {
         if(Boot.skip_constructor)
         {
            return;
         }
         super("I.Robes","InquisitorRobes","inquisitor\'s robes","inquisitor\'s robes",8,2000,"These foreboding red and gold robes are embroidered with the symbols of a lost kingdom. Wearing them will cause spells to tax your health instead of exhausting you.","Light",PerkLib.BloodMage);
      }
      
      override public function useText() : void
      {
         outputText("你展开从沼泽密室里得到的长袍，仔细检查。它们和你上次看到时一样，没有任何变化——也许信中承诺的变形魔法已经耗尽了。看着这套衣服的两个独立部分，很明显，斗篷是由更厚的布料制成的，旨在作为这套衣服的主要防护——至少是长袍所能提供的防护。内衣是由更轻薄的材料制成的，你敢说它本身就可以成为一件非常优雅的衣服。你脱光衣服，然后穿上长袍。[pg]");
         outputText("它合身的程度令人有些惊讶。找不到更好的词来形容，它似乎是完美的。布料不会紧贴着你，而是让你有充分的活动空间。高领上有一个搭扣，展示着一把金色的剑。虽然你的手臂是裸露的，但手臂伸出的洞很舒服，并且有着和领口一样的金色镶边。沿着长袍的中间，镶边聚集在腰部，分成两条线沿着裙摆向下延伸。当它到达底部时，它变成了围绕背部的精致刺绣，图案基于神圣的符号和图像，这些符号和图像在恶魔出现之前很久可能意味着什么。在两条金线之间展示着一把剑，类似于领口搭扣上的那把。你做了几个夸张的动作来看看它的反应，发现你仍然可以自由活动。[pg]");
         outputText("你拿起那件较重的外套，将手伸进袖子里，并将腰带牢牢地系在腰间。你起初担心袖口会太敞开，但在用手做了几个快速的动作后，你觉得布料并没有碍事。镶金边兜帽的重量让你有些惊讶，但你很快就习惯了。在试图将兜帽拉下后，你发现这样做非常困难；它通过巧妙的缝合和金属丝设计，保持竖立和笔挺。你觉得除非你热得受不了，否则没有真正的必要去调整它。外套盖住了内衣的腰部装饰，将它们完全隐藏在腰带后面。现在熟悉的剑形图案沿着你的脊椎在你的背上延伸。腰带的环扣交汇了两次——一次在你的背后，一次在搭扣下面。[pg]");
         outputText("为了完成整个装扮，你拿起那两只无指炼金手套，将它们套在手上。手套的手背上用金线绣着似乎是祈祷文的图案。[pg]");
         outputText("你感到虔诚。");
         outputText("[pg](<b>获得特质：血法师</b>：法术消耗生命值（最低5点）而不是疲劳值！)[pg]");
      }
   }
}

