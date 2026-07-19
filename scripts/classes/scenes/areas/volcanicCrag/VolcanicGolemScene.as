package classes.scenes.areas.volcanicCrag
{
   import classes.BaseContent;
   import classes.CoC;
   import classes.Player;
   import classes._FlagDict.FlagDict_Impl_;
   import classes.globalFlags.KFLAGS;
   import classes.scenes.Camp;
   import classes.scenes.combat.Combat;
   import coc.view.CoCButton;
   import flash.Boot;
   import haxe.IMap;
   
   public class VolcanicGolemScene extends BaseContent
   {
      
      public function VolcanicGolemScene()
      {
         if(Boot.skip_constructor)
         {
            return;
         }
         super();
      }
      
      public function winAgainstGolem() : void
      {
         clearOutput();
         outputText("魔像跪倒在地，其核心内的岩浆冷却下来，变得漆黑，将这个构造体变成了一座冒着黑烟的雕像。你保持战斗姿态片刻，但过了一会儿，看来你终于打败了这个怪物。");
         outputText("[pg]当你靠近现在瘫痪的魔像时，它再次亮了起来！<i>无法运作。自毁程序启动</i>。等等，自毁？你以最快的速度逃离这个构造体，随着魔像在震耳欲聋的岩石和熔岩爆发中引爆，你被掀翻在地。");
         outputText("[pg]谢天谢地你完好无损，当你望向爆炸的中心时，你看到了一颗巨大、闪耀的红宝石。金色的缕缕光芒在宝石内移动变幻，赋予它一种超凡脱俗的外观。嗯，这也许值点钱！");
         get_player().createKeyItem("Golem\'s Heart",0,0,0,0);
         FlagDict_Impl_.arrayWriteInt(KFLAGS.flags,2649,1);
         get_combat().cleanupAfterCombat();
      }
      
      public function volcanicGolemMenu() : void
      {
         menu();
         addButton(0,"战斗",startFight).hint("挑战巨像。");
         addButton(1,"逃跑！",get_camp().returnToCampUseOneHour).hint("留得青山在，不怕没柴烧。");
      }
      
      public function volcanicGolemIntro() : void
      {
         clearOutput();
         if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,2646) <= 0)
         {
            FlagDict_Impl_.arrayWriteFloat(KFLAGS.flags,2647,10000);
            outputText("在穿越火山岩地荒凉而闷热的风景时，你感觉到脚下的土地在震动，你差点摔倒在地。恢复平衡后，你望向地平线，注意到一块刚才还不在那里的巨大巨石。");
            outputText("[pg]你决定去调查一下。当你靠近时，你注意到那根本不是一块巨石，而是一座雕像。你纳闷自己怎么会错过这件奇特的艺术品，而在另一次震动之后，你的问题得到了解答。这个怪物被熔岩点亮，转过身来，直勾勾地看着你！");
            outputText("[pg][say: 入侵者，]魔像用低沉的声音，以一种冷漠的语气咕哝着。[say: 抹杀。]");
            outputText("[pg]看来你有一场硬仗要打了！");
            FlagDict_Impl_.arrayWriteInt(KFLAGS.flags,2646,1);
            startCombat(new VolcanicGolem());
         }
         else
         {
            outputText("你[feet]下的地面在震动，你知道魔像就在附近。望向地平线，你看到那个笨重的庞然大物，它每迈出沉重的一步，大地都会随之开裂。你可以试着解决它，但也许躲开它会更好。");
            volcanicGolemMenu();
         }
      }
      
      public function volcanicGolemDead() : void
      {
         get_game().gameOver();
      }
      
      public function startFight() : void
      {
         clearOutput();
         var _loc1_:IMap = KFLAGS.flags;
         FlagDict_Impl_.arrayWriteFloat(_loc1_,2647,FlagDict_Impl_.arrayReadFloat(_loc1_,2647) + 1000);
         if(FlagDict_Impl_.arrayReadFloat(KFLAGS.flags,2647) > 10000)
         {
            FlagDict_Impl_.arrayWriteFloat(KFLAGS.flags,2647,10000);
         }
         outputText("不能让如此危险的怪物四处游荡！你准备好你的[weapon]，向这个巨大的敌人冲去。");
         startCombat(new VolcanicGolem());
      }
      
      public function loseToGolem() : void
      {
         clearOutput();
         outputText("你跪倒在地，看着地面，虚弱得无法继续。你心里有一部分希望这个构造体能对你大发慈悲，但现实很快逼近。你感觉到它靠近时散发的热量在增加。在魔像用强大无情的一脚将你踩碎之前，你咽下了最后一口气。你死了。");
         get_game().gameOver();
      }
   }
}

