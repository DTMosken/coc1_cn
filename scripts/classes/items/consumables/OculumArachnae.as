package classes.items.consumables
{
   import classes.Player;
   import classes._FlagDict.FlagDict_Impl_;
   import classes.globalFlags.KFLAGS;
   import classes.internals.Utils;
   import classes.items.Consumable;
   import classes.items.Mutations;
   import flash.Boot;
   import haxe.IMap;
   
   public class OculumArachnae extends Consumable
   {
      
      public function OculumArachnae()
      {
         if(Boot.skip_constructor)
         {
            return;
         }
         super("Oculum","Oc. Arachnae","a jar of Oculum Arachnae",6,"A small glass jar containing a viscous light-orange fluid with a small label that reads, \"Oculum Arachnae\". It is likely this potion is tied to arachnids in some way.");
      }
      
      override public function useItem() : Boolean
      {
         var _loc1_:* = null as IMap;
         get_mutations().initTransformation([3]);
         get_player().slimeFeed();
         outputText("你吃掉了液体，并舔干净了手指上残留的部分。它的味道有点像烤奶酪配蓝莓果酱。");
         if(get_changeLimit() > 0 && Utils.rand(3) == 0 && get_player().eyes.count < 4)
         {
            outputText("[pg]你突然出现了最奇怪的复视症状；你踉踉跄跄地眨着眼睛，捂着脸，但当你戳到自己的眼睛时，你把手缩了回来。等等，那些手指在你的额头上！你试探性地用指尖划过额头，不太相信自己的感觉。<b>现在你的额头上有一双眼睛，就在你正常的眼睛正上方！</b>这需要一些时间来适应！");
            get_player().eyes.count = 4;
            _loc1_ = KFLAGS.flags;
            FlagDict_Impl_.arrayWriteInt(_loc1_,2077,FlagDict_Impl_.arrayReadInt(_loc1_,2077) + 1);
            return false;
         }
         outputText("[pg]奶酪般的甜味让你充满活力，感觉神清气爽。");
         get_player().changeFatigue(-33);
         return false;
      }
   }
}

