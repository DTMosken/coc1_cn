package classes.scenes.monsters
{
   import classes.BaseContent;
   import classes.CoC;
   import classes.DebugMenu;
   import classes.Player;
   import classes.SelfDebug;
   import classes.TimeAwareInterface;
   import classes.display.SpriteDb;
   import classes.internals.Utils;
   import classes.saves.SelfSaver;
   import classes.saves.SelfSaving;
   import classes.scenes.combat.Combat;
   import classes.scenes.monsters._GoblinSharpshooterScene.SaveContent;
   import flash.Boot;
   
   public class GoblinSharpshooterScene extends BaseContent implements TimeAwareInterface, SelfDebug, SelfSaving
   {
      
      public var saveVersion:int;
      
      public var saveName:String;
      
      public var saveContent:SaveContent;
      
      public var globalSave:Boolean;
      
      public function GoblinSharpshooterScene()
      {
         if(Boot.skip_constructor)
         {
            return;
         }
         globalSave = false;
         saveVersion = 1;
         saveName = "goblinSharpshooter";
         saveContent = new SaveContent(null,null,null);
         super();
         SelfSaver.register(this);
         DebugMenu.register(this);
         CoC.timeAwareClassAdd(this);
      }
      
      public function timeChangeLarge() : Boolean
      {
         return false;
      }
      
      public function timeChange() : Boolean
      {
         var _loc1_:int = int(Math.max(saveContent.encounterCooldown - 1,0));
         saveContent.encounterCooldown = _loc1_;
         return false;
      }
      
      public function saveToObject() : Object
      {
         return saveContent;
      }
      
      public function reset() : void
      {
         saveContent.timesEncountered = 0;
         saveContent.sawSmokeGrenade = false;
         saveContent.encounterCooldown = 0;
      }
      
      public function onAscend(param1:Boolean) : void
      {
         reset();
      }
      
      public function meetGoblinSharpshooter() : void
      {
         var _loc1_:* = null as String;
         saveContent.encounterCooldown = 48;
         clearOutput();
         spriteSelect(SpriteDb.get_goblinSharpshooter());
         if(saveContent.timesEncountered == 0)
         {
            outputText("习惯了在这些土地上探索的你，已经培养出了一种直觉，当你走进伏击圈时，它会警告你。虽然它并没有像它应该的那样频繁地发作，但你现在确实感觉到了；有什么东西在盯着你。");
            _loc1_ = get_player().location;
            if(_loc1_ == "沙漠")
            {
               outputText("附近沙丘上滑落的大量沙子，几乎证实了你的怀疑。你转过身去面对它，准备好迎接任何可能突然跳出来的东西。");
               outputText("[pg]令你惊讶的是，几秒钟都没有任何动静。你朝它移动了一米，没有任何进一步的反应，开始认为它可能只是一只随机的小动物，而不是敌人。");
               outputText("[pg]你又朝它移动了一米，听到你的[foot]下传来一声脆响：一根断裂的树枝。树枝，在这里？[pg][say: 抓到你了。]");
               outputText("[pg]一切都发生在一瞬间；一声巨响，沙丘中传来一阵爆炸，你仰面摔倒，感到剧烈、灼热的疼痛。你中枪了！");
               outputText("[pg]你听到沙丘里传来一个女声。[say: 你还挺小心的，不是吗？我都有点不耐烦了。] 你还在呻吟，转头看向声音的来源，看到了一只地精！她脱下一件沙色的斗篷，拍掉身上多余的沙子。清理干净后，她把武器指向你：一把火枪！");
            }
            else
            {
               while(true)
               {
                  if(_loc1_ != "密林")
                  {
                     if(_loc1_ != "森林")
                     {
                        if(_loc1_ != "沼泽")
                        {
                           break;
                        }
                     }
                  }
                  outputText("附近灌木丛的沙沙声几乎证实了你的怀疑。你转过身去面对它，准备好迎接任何可能突然跳出来的东西。");
                  outputText("[pg]令你惊讶的是，几秒钟都没有任何动静。你朝它移动了一米，没有任何进一步的反应，开始认为它可能只是一只随机的小动物，而不是敌人。");
                  outputText("[pg]你又朝它移动了一米，听到你的[foot]下传来一声脆响：一根断裂的树枝。[pg][say: 抓到你了。]");
                  outputText("[pg]一切都发生在一瞬间；一声巨响，灌木丛中传来一阵爆炸，你仰面摔倒，感到剧烈、灼热的疼痛。你中枪了！");
                  outputText("[pg]你听到灌木丛中传来一个女人的声音。[say: 你还挺小心的，不是吗？我都有点不耐烦了。]你还在呻吟，转头看向声音的来源，看到一个拿着火枪的地精！");
                  break;
               }
            }
            outputText("[pg][say: 别担心，我没瞄准你的头。现在乖乖站好，让我把你的精液榨干！]她带着狡黠的笑容说道。[say: 顺便再抢点你的东西。总得混口饭吃嘛。]");
            outputText("你把手放在胸口，发现那里并没有受伤或流血，不过你的左臂就没那么幸运了。你从地上爬起来，吓得地精赶紧退到了安全距离。你还没输呢。");
            get_player().takeDamage(50 + Utils.rand(25),true);
            outputText("[pg][say: 见鬼，早知道就瞄准腿了！]她一边给火枪装弹一边说道。战斗开始了！");
         }
         else
         {
            outputText("你听到身后传来熟悉的火枪击锤扳动的声音。这是你得到的唯一警告，你赶紧跳开并翻滚躲避，一阵铅弹从你身边呼啸而过。你转过身，再次看到了那个拿着火枪的地精。战斗开始了！");
         }
         _temp_1.timesEncountered += 1;
         unlockCodexEntry(2040);
         startCombat(new GoblinSharpshooter());
      }
      
      public function load(param1:int, param2:*) : void
      {
         Utils.extend(saveContent,param2);
      }
      
      public function goblinEscapes() : void
      {
         clearOutput();
         outputText("当你的视线恢复清晰，烟雾散去时，地精已经不见了踪影。该死！真是浪费时间。");
         saveContent.sawSmokeGrenade = true;
         get_combat().cleanupAfterCombat();
      }
      
      public function get_debugName() : String
      {
         return "GobSharpshooter";
      }
      
      public function get_debugHint() : String
      {
         return "";
      }
      
      public function encounterWhen() : Boolean
      {
         if(get_player().hasCock() && saveContent.encounterCooldown == 0)
         {
            return softLevelMin(14);
         }
         return false;
      }
      
      public function encounterChance() : Number
      {
         return 0.1 + get_player().get_hoursSinceCum() / 48;
      }
      
      public function defeatSharpshooter() : void
      {
         clearOutput();
         outputText("地精倒在地上，被打败了。[say: 见鬼去吧！猎人可不会变成猎物！]她说着，伸手去拿她的装备。[pg]你走近她，她试图从一个袋子里抓出什么东西，但你迅速把它拍开，让她够不着。这个地精现在完全任你摆布了。[pg][say: 好了，放轻松，好吗？我只是更习惯在上面。]");
         outputText("[pg]那么，你打算怎么处理这个绿色的小猎人呢？");
         get_game().goblinScene.generateGobboSexMenu(SpriteDb.get_goblinSharpshooter());
      }
      
      public function debugMenu(param1:Boolean = true) : void
      {
         get_game().debugMenu.debugCompEdit(saveContent,new SaveContent(null,null,null));
      }
   }
}

