package classes.scenes.areas.desert
{
   import classes.BaseContent;
   import classes.DynStat;
   import classes.ImageManager;
   import classes.Player;
   import classes._FlagDict.FlagDict_Impl_;
   import classes.globalFlags.KFLAGS;
   import classes.scenes.Camp;
   import classes.scenes.combat.Combat;
   import flash.Boot;
   
   public class GhoulScene extends BaseContent
   {
      
      public function GhoulScene()
      {
         if(Boot.skip_constructor)
         {
            return;
         }
         super();
      }
      
      public function ghoulWon() : void
      {
         get_combat().cleanupAfterCombat();
         clearOutput();
         get_images().showImage("monster-ghoul");
         if(get_player().get_HP() <= 0)
         {
            outputText("你倒在沙地上，伤势过重。");
         }
         else
         {
            outputText("你倒在沙地上，欲望过于强烈。");
         }
         outputText("食尸鬼毫不迟疑地向你扑来。在你昏迷前看到的最后一幕，是食尸鬼张开的大嘴。");
         outputText("[pg]你醒来时不知道是什么时间。咬痕和其他伤口布满你的身体，你每一次呼吸都伴随着剧痛。沙子被你的鲜血染红，金属般的气味让你胃里翻江倒海，但至少，你似乎不再流血了。你费了九牛二虎之力才爬起来，踉踉跄跄地走回营地。");
         dynStats(DynStat.Str(-2));
         dynStats(DynStat.Tou(-3));
         dynStats(DynStat.Sens(3));
         doNext(get_camp().returnToCampUseFourHours);
      }
      
      public function ghoulEncounter() : void
      {
         clearOutput();
         get_images().showImage("event-hyena");
         outputText("当你在沙漠中漫步时，你的眼睛捕捉到了什么在移动。你朝那个方向看去。那是一只鬣狗。不是鬣狗兽人，而是一只真正的鬣狗。如果这还不够奇怪的话，你很确定任何鬣狗都应该在");
         if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,131) > 0)
         {
            outputText("平原上被发现。");
         }
         else
         {
            outputText("其他地方被发现。");
         }
         outputText("但这无关紧要。鬣狗已经发现了你，并向你冲来，打断了你进一步的思考。你只好准备迎战。");
         startCombat(new Ghoul());
      }
   }
}

