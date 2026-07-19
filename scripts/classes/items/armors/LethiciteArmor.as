package classes.items.armors
{
   import classes.Player;
   import classes.items.Armor;
   import classes.items.Undergarment;
   import classes.items.UndergarmentLib;
   import flash.Boot;
   
   public class LethiciteArmor extends Armor
   {
      
      public function LethiciteArmor()
      {
         if(Boot.skip_constructor)
         {
            return;
         }
         super("LthcArm","Lethicite Armor","lethicite armor","a suit of glowing purple lethicite armor",28,3000,"A suit of armor. It has a stylized \"L\" in the middle, but it looks like someone carved \"oser\" into the armor to follow it up. You should probably remove this piece of junk from your presence.","Heavy");
      }
      
      override public function useText() : void
      {
         outputText("你" + get_player().clothedOrNaked("把自己脱光，然后") + "开始穿上这件奇怪的紫色水晶护甲。");
         if(get_player().cor < 33)
         {
            outputText("你对这件护甲会暴露你的腹股沟感到犹豫，但你还是把它穿上了。");
         }
         if(get_player().cor >= 33 && get_player().cor < 66)
         {
            outputText("你对这件暴露胯部的盔甲感到有些迟疑。");
         }
         if(get_player().cor >= 66)
         {
            outputText("一旦穿戴整齐，你就迫不及待地想要炫耀一番。");
         }
         outputText("[pg]首先，你费力地穿上胸甲。它有着气势逼人的带刺肩甲来保护你的肩膀。胸甲自动调整以适应你的[chest]，当你低头看时，你的[nipples]暴露在外。");
         if(get_player().biggestLactation() >= 4)
         {
            outputText("一点乳汁慢慢流过了你的胸甲。");
         }
         if(get_player().isBiped())
         {
            outputText("[pg]接着，你穿上腿甲。当你把腿甲完全调整好时，你才意识到那个设计精巧的开口直接露出了你的胯部！");
            if(get_player().hasCock() && get_player().get_lowerGarment() == UndergarmentLib.NOTHING)
            {
               outputText("你的[cocks]自由地悬垂着。");
            }
            if(get_player().cor < 33)
            {
               if(get_player().get_lowerGarment() != UndergarmentLib.NOTHING)
               {
                  outputText("幸好你穿着" + Std.string(get_player().get_lowerGarment()) + "！");
               }
               else
               {
                  outputText("你尴尬地红了脸。");
               }
            }
            else if(get_player().cor >= 33 && get_player().cor < 66)
            {
               if(get_player().get_lowerGarment() != UndergarmentLib.NOTHING)
               {
                  outputText("你不确定是否应该继续穿着" + Std.string(get_player().get_lowerGarment()) + "。");
               }
               else
               {
                  outputText("你不确定自己对胯部暴露在外的感觉如何。");
               }
            }
            else if(get_player().cor >= 66)
            {
               if(get_player().get_lowerGarment() != UndergarmentLib.NOTHING)
               {
                  outputText("你思索着要不要脱掉内衣。");
               }
               else
               {
                  outputText("你很享受将下体暴露在外的感觉。");
               }
            }
            outputText("接着，你把脚塞进“靴子”里；它们甚至都盖不住你的脚。考虑到恶魔要么穿高跟鞋，要么长着爪子，你猜测这些靴子最初是为恶魔设计的。");
         }
         else
         {
            outputText("[pg]这条护腿是为两条腿的人设计的，所以你把它留在了[inv]里。");
         }
         outputText("[pg]最后，你戴上护腕来保护双臂。你的手指仍然露在外面，所以你依然能抓牢东西。");
         outputText("[pg]你准备好踏上冒险之旅了！[pg]");
      }
      
      override public function get_def() : Number
      {
         return 20 + int(get_player().cor / 10);
      }
   }
}

