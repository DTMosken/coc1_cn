package classes.scenes.camp
{
   import classes.BaseContent;
   import classes.CoC;
   import classes.Player;
   import classes._FlagDict.FlagDict_Impl_;
   import classes.globalFlags.KFLAGS;
   import classes.items.ConsumableLib;
   import classes.items.Weapon;
   import classes.items.WeaponLib;
   import classes.scenes.Camp;
   import classes.scenes.Inventory;
   import classes.scenes.combat.Combat;
   import flash.Boot;
   import haxe.IMap;
   
   public class BeautifulSwordScene extends BaseContent
   {
      
      public function BeautifulSwordScene()
      {
         if(Boot.skip_constructor)
         {
            return;
         }
         super();
      }
      
      public function takeShard() : void
      {
         var _loc1_:IMap = KFLAGS.flags;
         FlagDict_Impl_.arrayWriteInt(_loc1_,2665,FlagDict_Impl_.arrayReadInt(_loc1_,2665) + 1);
         get_inventory().takeItem(get_consumables().B_SHARD,destroyBeautifulSword);
      }
      
      public function rebellingBeautifulSword(param1:Boolean = false) : void
      {
         var _loc2_:int = 0;
         if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,2705) != 1)
         {
            if(get_game().player.cor < 55 + get_game().player.corruptionTolerance())
            {
               if(!param1)
               {
                  outputText("<b>你携带的美丽的剑开始闪烁着淡蓝色的火焰，灼烧并伤害着你。无论你试图握住哪里，痛苦都难以忍受。看来在你如此腐化的情况下，你无法挥舞它。</b>[pg]");
               }
               else
               {
                  outputText("你一试图挥舞这把剑，它就燃起火焰，灼烧着你。你赶紧把它放回[pouch]里，以免它伤害你。");
               }
               if(!param1)
               {
                  _loc2_ = 20;
                  _loc2_ -= int(get_player().get_armorDef());
                  if(_loc2_ < 1)
                  {
                     _loc2_ = 1;
                  }
                  get_player().HPChange(-_loc2_,false);
                  get_player().setUnarmed();
                  get_inventory().takeItem(get_game().weapons.B_SWORD,playerMenu);
               }
               else
               {
                  doNext(playerMenu);
               }
            }
            else
            {
               if(get_player().get_weapon() == get_weapons().B_SWORD)
               {
                  get_player().setUnarmed();
               }
               outputText("<b>你携带的美丽的剑开始闪烁着淡蓝色的火焰，灼烧并伤害着你。无论你试图握住哪里，痛苦都难以忍受。看来在你如此腐化的情况下，你无法挥舞它。</b>[pg]");
               outputText("剑从你的手中挣脱，开始在空中漂浮。它的剑刃转向你。看来你有一场硬仗要打了！");
               get_player().destroyItems(get_weapons().B_SWORD,1);
               startCombat(new BeautifulSwordFight());
            }
         }
         else
         {
            outputText("不知道你是怎么到这儿的，因为在摧毁了一把美丽的剑之后，你不应该再有一把。不过，继续你的旅程吧，然后向 OtherCoCAnon（模组作者） 抱怨这件事。");
            doNext(get_camp().returnToCampUseOneHour);
         }
      }
      
      public function destroyBeautifulSword() : void
      {
         var _g:Combat;
         FlagDict_Impl_.arrayWriteInt(KFLAGS.flags,2705,1);
         menu();
         if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,2665) < 5)
         {
            addButton(0,"拿走碎片",takeShard);
         }
         _g = get_combat();
         addButton(14,"离开",function():void
         {
            _g.cleanupAfterCombat();
         });
      }
      
      public function defeatedBySword() : void
      {
         clearOutput();
         outputText("你踉跄后退，伤势重得难以忍受。你深吸一口气，试图在剑将你终结之前稳住阵脚。");
         outputText("[pg]你再次看向那把剑。它已经水平横放，剑尖直指着你。还没等你反应过来，它就以难以置信的速度向你射来！");
         outputText("[pg]你被剑刃刺穿了，但这还没完。它继续向前移动，将你带离地面，带着你一起飞驰。");
         outputText("[pg]剑在空中飞速穿梭，然后深深地扎进了附近的一棵树里。你被钉住了，胸口被刺穿。你象征性地尝试逃脱，但无济于事。你很快放弃了，接受了即将到来的死亡。");
         outputText("[pg]就在死亡开始带走你时，剑闪烁着蓝色的火焰，给你带来更多的痛苦。一股新的能量涌入你的体内，这是对抗这种灼烧感的最后一点求生本能。你抓挠着剑，试图把它拔出来，但每次你碰到它，你身体的更多部分就会燃烧殆尽，化为灰烬，被风吹走。");
         outputText("[pg]仅仅几秒钟，你就完全解体了。剑仍然插在树上。它恢复了生锈的状态，在试图清除这片土地上的腐化——也就是你——的过程中，它的能量被完全耗尽了。");
         get_game().gameOver();
      }
   }
}

