package classes.items.consumables
{
   import classes.PerkLib;
   import classes.Player;
   import classes.items.Consumable;
   import flash.Boot;
   
   public final class DeBimbo extends Consumable
   {
      
      public function DeBimbo()
      {
         if(Boot.skip_constructor)
         {
            return;
         }
         super("Debimbo","De-bimbo","a bottle marked as \'De-bimbo\'",250);
      }
      
      override public function useItem() : Boolean
      {
         if(get_player().hasPerk(PerkLib.BroBrains))
         {
            outputText("你捏住鼻子，皱着眉头吞下了这难闻的混合物。哦，这简直<i>太恶心了！</i>你扔掉药瓶，药瓶在地上摔得粉碎，你紧紧抱住头，一阵恶心感袭来。你跌跌撞撞地靠在一块石头上支撑身体，闭上了眼睛。一阵持续的、剧烈的疼痛在你的太阳穴后方跳动，你破天荒地发现自己说不出话来。痛苦的呻吟从你唇间滑落，思想和记忆如潮水般涌回。一个接一个，认知的思绪穿透了你那简单的兄弟大脑矩阵，将它们撕碎并取而代之。");
            outputText("[pg]你……你刚才竟然是个满脑子只有锻炼和操逼的肌肉男！随着理智的回归，你不禁打了个寒颤，头痛也随着时间的推移逐渐减轻。");
         }
         else
         {
            outputText("好吧，是时候看看这只臭烘烘的老耗子到底在搞什么鬼了！你捏住鼻子，皱着眉头吞下了这难闻的混合物。噢，这简直太<i>恶心了！</i>你扔掉药瓶，任由它在地上摔得粉碎，紧紧抱住脑袋，一阵恶心感席卷全身。你踉跄着退到一块岩石旁靠着，闭上了眼睛。太阳穴后方传来持续不断的剧烈跳痛，让你破天荒地一句话也说不出来。随着思绪和记忆如潮水般涌回，你痛苦地呻吟出声。一条又一条清醒的思维线索穿透了你那无脑荡妇般简单的心智矩阵，将它们撕碎并取而代之。");
            outputText("[pg]你……你刚才竟然是个脑子里空空如也的蠢货！一个除了渴望鸡巴和快感之外什么都不懂的白痴女孩！随着理智的回归，你不禁打了个寒颤，头痛也随着时间的推移逐渐减轻。");
         }
         if(get_player().hasPerk(PerkLib.BimboBrains))
         {
            outputText("[pg](<b>失去特质：无脑荡妇 - 你的智力和说话方式不再受限于无脑荡妇的状态。</b>)");
            get_player().removePerk(PerkLib.BimboBrains);
         }
         else if(get_player().hasPerk(PerkLib.FutaFaculties))
         {
            outputText("[pg](<b>失去特质：扶她思维 - 你的智力和说话方式不再受限于扶她荡妇的状态。</b>)");
            get_player().removePerk(PerkLib.FutaFaculties);
         }
         else if(get_player().hasPerk(PerkLib.BroBrains))
         {
            outputText("[pg](<b>移除特质：兄弟大脑 - 你的智力和说话方式不再局限于那些经常锻炼的男性。</b>)");
            get_player().removePerk(PerkLib.BroBrains);
         }
         return false;
      }
      
      override public function get_description() : String
      {
         if(get_player().hasPerk(PerkLib.BimboBrains) || get_player().hasPerk(PerkLib.FutaFaculties))
         {
            return "这应该能，呃，治好你的脑子之类的。你其实不觉得自己的脑子有什么问题——它一直感觉粉粉嫩嫩、轻飘飘的。";
         }
         return "这剂药水是用五份学者茶和天知道还有什么东西调制而成的。据说它能纠正无脑甜酒的降智效果。\n\n类型：消耗品";
      }
      
      override public function canUse() : Boolean
      {
         if(get_player().hasPerk(PerkLib.BimboBrains) || get_player().hasPerk(PerkLib.FutaFaculties) || get_player().hasPerk(PerkLib.BroBrains))
         {
            return true;
         }
         outputText("你现在不能用这个，而且它太贵了，不能浪费！[pg]");
         return false;
      }
   }
}

