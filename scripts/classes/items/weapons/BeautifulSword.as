package classes.items.weapons
{
   import classes._FlagDict.FlagDict_Impl_;
   import classes.globalFlags.KFLAGS;
   import classes.items.Weapon;
   import flash.Boot;
   
   public class BeautifulSword extends Weapon
   {
      
      public function BeautifulSword()
      {
         if(Boot.skip_constructor)
         {
            return;
         }
         super("B.Sword","Beautiful Sword","beautiful sword","a beautiful sword",["slash"],7,400,"This sword, although rusted, is exquisitely beautiful. That it can cut anything at all in this state shows the flawless craftsmanship of its blade. The pommel and guard are heavily decorated in gold and brass. Some craftsman clearly poured his heart and soul into this blade.",["holySword","1H Sword"]);
      }
      
      override public function get_description() : String
      {
         if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,2662) >= 2 && FlagDict_Impl_.arrayReadInt(KFLAGS.flags,2662) < 4)
         {
            _description = "这把美丽的剑褪去了一些铁锈，并找回了它的一些神圣力量。它在阳光下发出微弱的光芒。剑柄和护手都用黄金和黄铜进行了大量装饰。显然，有位工匠在这把剑上倾注了心血。\n";
         }
         else if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,2662) >= 4 && FlagDict_Impl_.arrayReadInt(KFLAGS.flags,2662) < 6)
         {
            _description = "这把美丽的剑看起来完好如初，已经恢复了它以前的大部分力量。它在阳光下闪耀着明亮的光芒，仅仅是握着它就能让你充满希望。剑柄和护手都用黄金和黄铜进行了大量装饰。显然，有位工匠在这把剑上倾注了心血。\n";
         }
         else if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,2662) >= 6)
         {
            _description = "这把美丽的剑闪耀着生命的光芒，是玛瑞斯人民希望和纯洁的闪亮灯塔。握着它让你充满使命感，并让你专注于你的目标。剑柄和护手都用黄金和黄铜进行了大量装饰。显然，有位工匠在这把剑上倾注了心血。\n";
         }
         else
         {
            _description = "这把剑虽然生锈了，但却异常美丽。在这种状态下它还能切开任何东西，这足以证明其刀刃的完美工艺。剑柄和护手都用黄金和黄铜进行了大量装饰。显然，有位工匠在这把剑上倾注了心血。\n";
         }
         var _loc1_:String = super.get_description();
         return _loc1_ + ("\n特殊：伤害随着击杀独特的腐化敌人而增加<b>(" + (get_attack() - 7) + ")</b>");
      }
      
      override public function get_attack() : Number
      {
         var _loc1_:int = 7 + FlagDict_Impl_.arrayReadInt(KFLAGS.flags,2662) * 2;
         if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,2078) >= 50)
         {
            _loc1_ += 2;
         }
         if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,2078) >= 100)
         {
            _loc1_ += 2;
         }
         return _loc1_;
      }
      
      override public function canUse() : Boolean
      {
         if(get_player().isPureEnough(35))
         {
            return true;
         }
         get_game().beautifulSwordScene.rebellingBeautifulSword(true);
         return false;
      }
   }
}

