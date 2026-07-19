package classes.items.consumables
{
   import classes.Player;
   import classes._FlagDict.FlagDict_Impl_;
   import classes.globalFlags.KFLAGS;
   import classes.items.Consumable;
   import flash.Boot;
   import haxe.IMap;
   
   public final class HairExtensionSerum extends Consumable
   {
      
      public function HairExtensionSerum()
      {
         if(Boot.skip_constructor)
         {
            return;
         }
         super("ExtSerm","Hair Serum","a bottle of hair extension serum",6,"A bottle of foamy pink liquid, purported by the label to increase the speed at which the user\'s hair grows.");
      }
      
      override public function useItem() : Boolean
      {
         var _loc1_:* = null as IMap;
         outputText("你打开生发精华的瓶子，仔细按照说明操作，将其按摩到头皮上，并小心避免沾到其他皮肤上。为了保险起见，你用湖水洗了洗手。");
         if(get_player().hair.type == 6)
         {
            outputText("[pg]你等了一会儿，期待着头上会有酥麻感，但什么也没发生。你叹了口气，意识到你" + get_player().hair.color + "的蛇怪棘刺对这种精华液免疫……");
            return false;
         }
         if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,25) <= 0)
         {
            outputText("[pg]头上的酥麻感让你知道它起作用了！");
            FlagDict_Impl_.arrayWriteInt(KFLAGS.flags,25,7);
            FlagDict_Impl_.arrayWriteInt(KFLAGS.flags,26,1);
         }
         else if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,26) == 1)
         {
            outputText("[pg]酥麻感加剧了，几乎让你觉得有看不见的小仙女在按摩你的头皮。");
            _loc1_ = KFLAGS.flags;
            FlagDict_Impl_.arrayWriteInt(_loc1_,26,FlagDict_Impl_.arrayReadInt(_loc1_,26) + 1);
         }
         else if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,26) == 2)
         {
            outputText("[pg]头皮上的酥麻感简直无法忍受！感觉你的头上爬满了一群愤怒的蚂蚁，不过你敢发誓，你的头发长得太快了，你都能感觉到它越来越重！");
            _loc1_ = KFLAGS.flags;
            FlagDict_Impl_.arrayWriteInt(_loc1_,26,FlagDict_Impl_.arrayReadInt(_loc1_,26) + 1);
         }
         if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,66) > 0 && get_player().hair.type != 4)
         {
            FlagDict_Impl_.arrayWriteInt(KFLAGS.flags,66,0);
            outputText("[pg]<b>不知怎么的，你知道你的[hair]又在生长了。</b>");
         }
         if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,25) < 7)
         {
            FlagDict_Impl_.arrayWriteInt(KFLAGS.flags,25,7);
         }
         return false;
      }
      
      override public function canUse() : Boolean
      {
         if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,26) <= 2)
         {
            return true;
         }
         outputText("<b>没门！</b> 用完剩下的这些后，你的头痒得要命，你绝对不会再用一瓶了。\r\n");
         return false;
      }
   }
}

