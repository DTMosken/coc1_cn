package classes.scenes.areas.lake
{
   import classes.DynStat;
   import classes.ImageManager;
   import classes.Player;
   import classes.StatusEffects;
   import classes._FlagDict.FlagDict_Impl_;
   import classes.globalFlags.KFLAGS;
   import classes.items.WeaponLib;
   import classes.scenes.Camp;
   import classes.scenes.Inventory;
   import classes.scenes.api.Encounter;
   import flash.Boot;
   
   public class SwordInStone extends AbstractLakeContent implements Encounter
   {
      
      public function SwordInStone()
      {
         if(Boot.skip_constructor)
         {
            return;
         }
         super();
      }
      
      public function tryToTakeSwordInStone() : void
      {
         clearOutput();
         get_images().showImage("item-bSword");
         if(!get_player().isPureEnough(25))
         {
            outputText("你双手紧握手柄，然后");
            if(get_player().get_str() > 70)
            {
               outputText("用力拉扯，使树木因受力而发出沉重的呻吟，");
            }
            if(get_player().get_str() <= 70 && get_player().get_str() >= 40)
            {
               outputText("用力拉扯，感觉肌肉因紧绷而酸痛，");
            }
            if(get_player().get_str() < 40)
            {
               outputText("用尽全力拉扯，");
            }
            outputText("但剑依然顽固地卡在它的树木之家中。你沮丧地放弃了，决定以后再试。");
            doNext(get_camp().returnToCampUseOneHour);
         }
         else
         {
            outputText("你双手紧握手柄，然后");
            if(get_player().get_str() > 70)
            {
               outputText("用力一拔，剑滑脱而出，你一屁股摔在地上。剑尖埋在你头部几英寸外的地方。你暗自庆幸，站了起来。");
            }
            if(get_player().get_str() <= 70 && get_player().get_str() >= 40)
            {
               outputText("猛地一拔，剑轻松地从树中滑出，你差点摔倒。");
            }
            if(get_player().get_str() < 40)
            {
               outputText("轻松地拔出剑，你惊讶于拔出它竟然如此容易。");
            }
            outputText("令人惊讶的是，树干竟然完好无损。正当你对这一新情况感到惊奇时，一片树叶拂过你的肩膀。你抬起头，看着每一片树叶从健康的绿色变成鲜艳的橙色，最后变成棕色。树叶如雨般落在你周围，用枯死的植物物质覆盖了地面，只留下你和一棵枯死树木的骨架。这景象让你感到悲伤，尽管你无法理解为什么。[pg]");
            outputText("剑刃本身是三英尺半长的纯钢，虽然生锈了。不过，它确实是一把美丽的剑。[pg]");
            dynStats(DynStat.Lib(-(get_player().lib / 3)),DynStat.Lust(-15));
            get_inventory().takeItem(get_weapons().B_SWORD,get_camp().returnToCampUseOneHour);
            get_player().createStatusEffect(StatusEffects.TookBlessedSword,0,0,0,0);
         }
      }
      
      public function takeBrokenSword() : void
      {
         clearOutput();
         get_images().showImage("item-brokenSword");
         outputText("你决定仔细检查这把断剑的碎片。有趣的是，它只断成了两截，并且如你所料覆盖着铁锈，但当你凑近看时，你注意到剑柄和护手的设计非常精细，仿佛这把剑是由一位大师级工匠精心打造的。[pg]");
         outputText("虽然这把剑可能还有些用处，但它不会是一把非常有效的武器。也许有人能将这把剑恢复到它昔日的辉煌，甚至将其扭曲成一把有用但腐化的武器？");
         get_inventory().takeItem(get_weapons().B_SWORD,get_camp().returnToCampUseOneHour);
      }
      
      public function execEncounter() : void
      {
         get_images().showImage("event-lake-bSword");
         if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,2024) < 2)
         {
            outputText("沿着湖边散步时，金属的闪光吸引了你的目光。你摆出战斗姿态，准备好你的[weapon]迎接战斗。你的眼睛四处扫视，寻找光源。当你找到反光的来源时，你觉得自己很傻。它来自一把剑，剑柄深深地插在一棵树的树干里。你稍微放松了一些，走近这个奇怪的景象，想看个究竟。[pg]");
            outputText("这棵树足够粗，可以包裹住整个刀刃。另一侧完全没有任何东西突出。另一个奇怪的地方是，在包围着剑的完好无损的树皮周围没有任何树液泄漏。剑柄本身似乎是由青铜制成的，护手外侧镶嵌着黄金。仔细观察，你意识到它们描绘了一个风格化的人物与一群恶魔战斗的场景。剑柄上紧紧地包裹着坚固的皮革，尽管这把剑在这里待了很长时间，以至于树木都把它包裹得如此彻底，但皮革看起来仍然像新的一样。[pg]");
            outputText("你觉得你可以试着把它拔出来，要试试吗？");
            doYesNo(tryToTakeSwordInStone,get_camp().returnToCampUseOneHour);
         }
         else
         {
            outputText("沿着湖边散步时，一棵巨大的树引起了你的注意。你小心翼翼地绕过一些灌木丛，警惕着靠近时可能发生的伏击。随着距离的拉近，你清楚地看到这棵树已经严重腐化。它从咬牙切齿的嘴巴和紧缩扭曲的肉穴中流出黑色的汁液。树的正中心有一个巨大的树结，仿佛那里曾经受过重伤。考虑到它那些嘴巴看起来饥肠辘辘，你决定避开它，但在离开之前，你发现树干周围散落着一把断剑的碎片，上面完全覆盖着铁锈。");
            outputText("你觉得你可以把这些碎片收集起来，要试试吗？");
            doYesNo(takeBrokenSword,get_camp().returnToCampUseOneHour);
            get_player().createStatusEffect(StatusEffects.BSwordBroken,0,0,0,0);
         }
      }
      
      public function encounterName() : String
      {
         return "剑";
      }
      
      public function encounterChance() : Number
      {
         if(!get_player().hasStatusEffect(StatusEffects.TookBlessedSword) && !get_player().hasStatusEffect(StatusEffects.BSwordBroken))
         {
            return 1;
         }
         return 0;
      }
   }
}

