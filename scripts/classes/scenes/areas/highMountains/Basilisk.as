package classes.scenes.areas.highMountains
{
   import classes.CoC;
   import classes.DynStat;
   import classes.PerkLib;
   import classes.Player;
   import classes.ReactionContext;
   import classes.StatusEffects;
   import classes._FlagDict.FlagDict_Impl_;
   import classes.internals.ChainedAction;
   import classes.internals.ChainedDrop;
   import classes.internals.Utils;
   import classes.items.ConsumableLib;
   import classes.items.UseableLib;
   import classes.scenes.monsters.StareMonster;
   import flash.Boot;
   import haxe.IMap;
   
   public class Basilisk extends StareMonster
   {
      
      public function Basilisk()
      {
         if(Boot.skip_constructor)
         {
            return;
         }
         super();
         set_a("");
         set_short("basilisk");
         imageName = "basilisk";
         set_long("");
         set_race("Basilisk");
         createCock(6,2);
         balls = 2;
         ballSize = 2;
         createBreastRow(0);
         ass.analLooseness = 1;
         ass.analWetness = 0;
         createStatusEffect(StatusEffects.BonusACapacity,30,0,0,0);
         set_tallness(74);
         hips.rating = 3;
         butt.rating = 4;
         lowerBody.type = 10;
         var _loc1_:int = get_game().get_noFur() ? 0 : 7;
         face.type = _loc1_;
         ears.type = 6;
         eyes.type = 5;
         hair.type = 6;
         skin.tone = "gray-green";
         skin.setType(2);
         hair.color = "gray-green";
         hair.length = 2;
         initStrTouSpeInte(85,70,35,70);
         initLibSensCor(50,35,60);
         set_weaponName("claws");
         set_weaponVerb("claw");
         set_weaponAttack(30);
         set_armorName("scales");
         set_armorDef(10);
         set_armorPerk("");
         set_armorValue(70);
         bonusHP = 200;
         set_lust(30);
         lustVuln = 0.5;
         temperment = 2;
         level = 12;
         set_gems(Utils.rand(10) + 10);
         set_drop(new ChainedDrop().add(get_consumables().REPTLUM,0.9).elseDrop(get_useables().EBNFLWR));
         tail.type = 9;
         tail.recharge = 0;
         createPerk(PerkLib.BasiliskResistance,0,0,0,0);
         checkMonster();
      }
      
      override public function won(param1:Boolean, param2:Boolean = false) : void
      {
         if(param2)
         {
            outputText("[pg]蛇怪得意地笑了笑，但还是等着你完成……");
            doNext(get_game().combat.endLustLoss);
         }
         else
         {
            get_game().highMountains.basiliskScene.loseToBasilisk();
         }
      }
      
      override public function react(param1:ReactionContext) : Boolean
      {
         var _loc2_:* = null as IMap;
         if(param1.index == 0)
         {
            if(!get_player().hasPerk(PerkLib.BasiliskResistance) && !get_game().combat.isWieldingRangedWeapon() && get_player().statusEffectv1(StatusEffects.CounterAB) != 1)
            {
               if(hasStatusEffect(StatusEffects.Blind))
               {
                  outputText("失明的蛇怪无法使用它的眼睛，所以你实际上可以瞄准你的攻击！");
               }
               else
               {
                  if(get_player().get_inte() / 5 + Utils.rand(20) < 25)
                  {
                     outputText("你将蛇怪保持在余光中，向前冲锋准备攻击。在撞击的瞬间之前，这只爬行动物改变了姿势，巧妙地随着你的动作向后躲闪流动，试图与你进行眼神交流。你发现自己正盯着蛇怪的脸！你迅速闭上眼睛向后退缩，疯狂地向蜥蜴人挥舞武器迫使它后退，但伤害已经造成；你能在闭着的眼睑后看到那可怕的灰色眼睛，你感到骨头上一阵沉重，移动变得更加困难。");
                     StareMonster.speedReduce(get_player(),20);
                     get_player().removeStatusEffect(StatusEffects.FirstAttack);
                     _loc2_ = get_flags();
                     FlagDict_Impl_.arrayWriteInt(_loc2_,2208,FlagDict_Impl_.arrayReadInt(_loc2_,2208) + 2);
                     return false;
                  }
                  outputText("你将蛇怪保持在余光中，向前冲锋准备攻击。在撞击的瞬间之前，这只爬行动物改变了姿势，巧妙地随着你的动作向后躲闪流动，试图与你进行眼神交流。你出人意料地扭动身体，以一个倾斜的角度举起你的[weapon]；蛇怪没有预料到这种攻击！");
               }
            }
         }
         return true;
      }
      
      override public function playerLossCondition() : Object
      {
         if(get_player().get_spe() <= 1)
         {
            return get_game().combat.endHpLoss;
         }
         return null;
      }
      
      override public function performCombatAction() : void
      {
         var _loc1_:ChainedAction = new ChainedAction(eAttack);
         if(!get_player().hasStatusEffect(StatusEffects.BasiliskCompulsion) && !hasStatusEffect(StatusEffects.Blind))
         {
            _loc1_.add(compulsion,0.3333333333333333);
         }
         _loc1_.add(basiliskTailSwipe,0.3333333333333333);
         _loc1_.exec();
      }
      
      override public function get_long() : String
      {
         if(get_player().hasPerk(PerkLib.BasiliskResistance) || get_player().canUseStare() || get_player().hasKeyItem("Laybans"))
         {
            return "你正在与一只蛇怪战斗！这只蛇怪是一个雄性" + (get_game().get_noFur() ? "长满鳞片的人形生物" : "两足爬行动物") + "，身高略微超过6英尺。他身材瘦削但肌肉结实，他那紧绷着肌肉的黄色" + (get_game().get_noFur() ? "腹部" : "下腹部") + "是他身体上唯一没有被那些具有欺骗性、伪装性的灰绿色鳞片覆盖的部分。一条长长的、像鞭子一样的尾巴在他瘦长的腿后面的泥土里不安地甩动着，每只手和脚上都装饰着锋利的镰刀状食指爪。他的" + (get_game().get_noFur() ? "脸是人类的，有着残忍的下巴" : "脸有着残忍的下巴，一个钝的蜥蜴鼻子") + "和一顶暗淡的刺冠。";
         }
         return "你正在与一只蛇怪战斗！从你不直视它时所能分辨出的情况来看，这只蛇怪是一个雄性" + (get_game().get_noFur() ? "长满鳞片的人形生物" : "两足爬行动物") + "，身高略微超过6英尺。他身材瘦削但肌肉结实，他那紧绷着肌肉的黄色" + (get_game().get_noFur() ? "腹部" : "下腹部") + "是他身体上唯一没有被那些具有欺骗性、伪装性的灰绿色鳞片覆盖的部分。一条长长的、像鞭子一样的尾巴在他瘦长的腿后面的泥土里不安地甩动着，每只手和脚上都装饰着锋利的镰刀状食指爪。你不敢看他的脸，但你有一种印象，他有着" + (get_game().get_noFur() ? "一张有着残忍下巴的人类脸庞" : "残忍的下巴，一个钝的蜥蜴鼻子") + "和一顶暗淡的刺冠。";
      }
      
      override public function defeated(param1:Boolean) : void
      {
         get_game().highMountains.basiliskScene.defeatBasilisk();
      }
      
      public function compulsion() : void
      {
         var _loc1_:* = null as IMap;
         outputText("蛇怪张开嘴，盯着你，用它那奇怪、干燥、嘶嘶作响的语言说出一些词语。这些声音钻进你的脑海，在你的意志边缘盘旋、嗡嗡作响，暗示、强迫，然后要求你看着蛇怪的眼睛。");
         if(get_player().get_inte() / 5 + Utils.rand(20) < 24 + get_player().newGamePlusMod() * 5)
         {
            if(get_player().hasPerk(PerkLib.BasiliskResistance) || get_player().canUseStare() || get_player().hasKeyItem("Laybans"))
            {
               outputText("你情不自禁……你瞥见了这只爬行动物灰色的、狭长的眼睛。然而，无论你怎么看它的眼睛，你都没有发现任何异常。你只能看到蛇怪。蛇怪发现你免疫后，咒骂了一声！");
            }
            else
            {
               outputText("你情不自禁……你瞥见了这只爬行动物灰色的、狭长的眼睛。你迅速移开视线，但你能在脑海中想象出它们，盯着你的思想，让你感到迟钝，无法协调。这种无助感不知为何感觉如此美妙……你无法驱散这种感觉，你真的想永远看着蛇怪的眼睛，让它完全控制你。");
               if(int([DynStat.Lust(3)].length) == 0)
               {
                  get_game().player.dynStats();
               }
               else if(int([DynStat.Lust(3)].length) == 1)
               {
                  get_game().player.dynStats([DynStat.Lust(3)][0]);
               }
               else if(int([DynStat.Lust(3)].length) == 2)
               {
                  get_game().player.dynStats([DynStat.Lust(3)][0],[DynStat.Lust(3)][1]);
               }
               else if(int([DynStat.Lust(3)].length) == 3)
               {
                  get_game().player.dynStats([DynStat.Lust(3)][0],[DynStat.Lust(3)][1],[DynStat.Lust(3)][2]);
               }
               else if(int([DynStat.Lust(3)].length) == 4)
               {
                  get_game().player.dynStats([DynStat.Lust(3)][0],[DynStat.Lust(3)][1],[DynStat.Lust(3)][2],[DynStat.Lust(3)][3]);
               }
               else if(int([DynStat.Lust(3)].length) == 5)
               {
                  get_game().player.dynStats([DynStat.Lust(3)][0],[DynStat.Lust(3)][1],[DynStat.Lust(3)][2],[DynStat.Lust(3)][3],[DynStat.Lust(3)][4]);
               }
               else if(int([DynStat.Lust(3)].length) == 6)
               {
                  get_game().player.dynStats([DynStat.Lust(3)][0],[DynStat.Lust(3)][1],[DynStat.Lust(3)][2],[DynStat.Lust(3)][3],[DynStat.Lust(3)][4],[DynStat.Lust(3)][5]);
               }
               else if(int([DynStat.Lust(3)].length) == 7)
               {
                  get_game().player.dynStats([DynStat.Lust(3)][0],[DynStat.Lust(3)][1],[DynStat.Lust(3)][2],[DynStat.Lust(3)][3],[DynStat.Lust(3)][4],[DynStat.Lust(3)][5],[DynStat.Lust(3)][6]);
               }
               else if(int([DynStat.Lust(3)].length) == 8)
               {
                  get_game().player.dynStats([DynStat.Lust(3)][0],[DynStat.Lust(3)][1],[DynStat.Lust(3)][2],[DynStat.Lust(3)][3],[DynStat.Lust(3)][4],[DynStat.Lust(3)][5],[DynStat.Lust(3)][6],[DynStat.Lust(3)][7]);
               }
               else if(int([DynStat.Lust(3)].length) == 9)
               {
                  get_game().player.dynStats([DynStat.Lust(3)][0],[DynStat.Lust(3)][1],[DynStat.Lust(3)][2],[DynStat.Lust(3)][3],[DynStat.Lust(3)][4],[DynStat.Lust(3)][5],[DynStat.Lust(3)][6],[DynStat.Lust(3)][7],[DynStat.Lust(3)][8]);
               }
               else if(int([DynStat.Lust(3)].length) == 10)
               {
                  get_game().player.dynStats([DynStat.Lust(3)][0],[DynStat.Lust(3)][1],[DynStat.Lust(3)][2],[DynStat.Lust(3)][3],[DynStat.Lust(3)][4],[DynStat.Lust(3)][5],[DynStat.Lust(3)][6],[DynStat.Lust(3)][7],[DynStat.Lust(3)][8],[DynStat.Lust(3)][9]);
               }
               else if(int([DynStat.Lust(3)].length) == 11)
               {
                  get_game().player.dynStats([DynStat.Lust(3)][0],[DynStat.Lust(3)][1],[DynStat.Lust(3)][2],[DynStat.Lust(3)][3],[DynStat.Lust(3)][4],[DynStat.Lust(3)][5],[DynStat.Lust(3)][6],[DynStat.Lust(3)][7],[DynStat.Lust(3)][8],[DynStat.Lust(3)][9],[DynStat.Lust(3)][10]);
               }
               else if(int([DynStat.Lust(3)].length) == 12)
               {
                  get_game().player.dynStats([DynStat.Lust(3)][0],[DynStat.Lust(3)][1],[DynStat.Lust(3)][2],[DynStat.Lust(3)][3],[DynStat.Lust(3)][4],[DynStat.Lust(3)][5],[DynStat.Lust(3)][6],[DynStat.Lust(3)][7],[DynStat.Lust(3)][8],[DynStat.Lust(3)][9],[DynStat.Lust(3)][10],[DynStat.Lust(3)][11]);
               }
               else if(int([DynStat.Lust(3)].length) == 13)
               {
                  get_game().player.dynStats([DynStat.Lust(3)][0],[DynStat.Lust(3)][1],[DynStat.Lust(3)][2],[DynStat.Lust(3)][3],[DynStat.Lust(3)][4],[DynStat.Lust(3)][5],[DynStat.Lust(3)][6],[DynStat.Lust(3)][7],[DynStat.Lust(3)][8],[DynStat.Lust(3)][9],[DynStat.Lust(3)][10],[DynStat.Lust(3)][11],[DynStat.Lust(3)][12]);
               }
               else if(int([DynStat.Lust(3)].length) == 14)
               {
                  get_game().player.dynStats([DynStat.Lust(3)][0],[DynStat.Lust(3)][1],[DynStat.Lust(3)][2],[DynStat.Lust(3)][3],[DynStat.Lust(3)][4],[DynStat.Lust(3)][5],[DynStat.Lust(3)][6],[DynStat.Lust(3)][7],[DynStat.Lust(3)][8],[DynStat.Lust(3)][9],[DynStat.Lust(3)][10],[DynStat.Lust(3)][11],[DynStat.Lust(3)][12],[DynStat.Lust(3)][13]);
               }
               else if(int([DynStat.Lust(3)].length) == 15)
               {
                  get_game().player.dynStats([DynStat.Lust(3)][0],[DynStat.Lust(3)][1],[DynStat.Lust(3)][2],[DynStat.Lust(3)][3],[DynStat.Lust(3)][4],[DynStat.Lust(3)][5],[DynStat.Lust(3)][6],[DynStat.Lust(3)][7],[DynStat.Lust(3)][8],[DynStat.Lust(3)][9],[DynStat.Lust(3)][10],[DynStat.Lust(3)][11],[DynStat.Lust(3)][12],[DynStat.Lust(3)][13],[DynStat.Lust(3)][14]);
               }
               else if(int([DynStat.Lust(3)].length) == 16)
               {
                  get_game().player.dynStats([DynStat.Lust(3)][0],[DynStat.Lust(3)][1],[DynStat.Lust(3)][2],[DynStat.Lust(3)][3],[DynStat.Lust(3)][4],[DynStat.Lust(3)][5],[DynStat.Lust(3)][6],[DynStat.Lust(3)][7],[DynStat.Lust(3)][8],[DynStat.Lust(3)][9],[DynStat.Lust(3)][10],[DynStat.Lust(3)][11],[DynStat.Lust(3)][12],[DynStat.Lust(3)][13],[DynStat.Lust(3)][14],[DynStat.Lust(3)][15]);
               }
               else if(int([DynStat.Lust(3)].length) == 17)
               {
                  get_game().player.dynStats([DynStat.Lust(3)][0],[DynStat.Lust(3)][1],[DynStat.Lust(3)][2],[DynStat.Lust(3)][3],[DynStat.Lust(3)][4],[DynStat.Lust(3)][5],[DynStat.Lust(3)][6],[DynStat.Lust(3)][7],[DynStat.Lust(3)][8],[DynStat.Lust(3)][9],[DynStat.Lust(3)][10],[DynStat.Lust(3)][11],[DynStat.Lust(3)][12],[DynStat.Lust(3)][13],[DynStat.Lust(3)][14],[DynStat.Lust(3)][15],[DynStat.Lust(3)][16]);
               }
               else if(int([DynStat.Lust(3)].length) == 18)
               {
                  get_game().player.dynStats([DynStat.Lust(3)][0],[DynStat.Lust(3)][1],[DynStat.Lust(3)][2],[DynStat.Lust(3)][3],[DynStat.Lust(3)][4],[DynStat.Lust(3)][5],[DynStat.Lust(3)][6],[DynStat.Lust(3)][7],[DynStat.Lust(3)][8],[DynStat.Lust(3)][9],[DynStat.Lust(3)][10],[DynStat.Lust(3)][11],[DynStat.Lust(3)][12],[DynStat.Lust(3)][13],[DynStat.Lust(3)][14],[DynStat.Lust(3)][15],[DynStat.Lust(3)][16],[DynStat.Lust(3)][17]);
               }
               else if(int([DynStat.Lust(3)].length) == 19)
               {
                  get_game().player.dynStats([DynStat.Lust(3)][0],[DynStat.Lust(3)][1],[DynStat.Lust(3)][2],[DynStat.Lust(3)][3],[DynStat.Lust(3)][4],[DynStat.Lust(3)][5],[DynStat.Lust(3)][6],[DynStat.Lust(3)][7],[DynStat.Lust(3)][8],[DynStat.Lust(3)][9],[DynStat.Lust(3)][10],[DynStat.Lust(3)][11],[DynStat.Lust(3)][12],[DynStat.Lust(3)][13],[DynStat.Lust(3)][14],[DynStat.Lust(3)][15],[DynStat.Lust(3)][16],[DynStat.Lust(3)][17],[DynStat.Lust(3)][18]);
               }
               else
               {
                  if(int([DynStat.Lust(3)].length) != 20)
                  {
                     throw "Too many rest arguments";
                  }
                  get_game().player.dynStats([DynStat.Lust(3)][0],[DynStat.Lust(3)][1],[DynStat.Lust(3)][2],[DynStat.Lust(3)][3],[DynStat.Lust(3)][4],[DynStat.Lust(3)][5],[DynStat.Lust(3)][6],[DynStat.Lust(3)][7],[DynStat.Lust(3)][8],[DynStat.Lust(3)][9],[DynStat.Lust(3)][10],[DynStat.Lust(3)][11],[DynStat.Lust(3)][12],[DynStat.Lust(3)][13],[DynStat.Lust(3)][14],[DynStat.Lust(3)][15],[DynStat.Lust(3)][16],[DynStat.Lust(3)][17],[DynStat.Lust(3)][18],[DynStat.Lust(3)][19]);
               }
               StareMonster.speedReduce(get_player(),20);
               get_player().createStatusEffect(StatusEffects.BasiliskCompulsion,0,0,0,0);
               _loc1_ = get_flags();
               FlagDict_Impl_.arrayWriteInt(_loc1_,2208,FlagDict_Impl_.arrayReadInt(_loc1_,2208) + 2);
            }
         }
         else
         {
            outputText("你集中注意力，凝聚心神，抵抗了蛇怪的精神强迫。");
         }
      }
      
      public function basiliskTailSwipe() : void
      {
         outputText("蛇怪突然向你甩出尾巴，将你的[feet]扫倒！你迅速踉跄着站起来，确保把这生物的脚留在你的视线中。");
         var _loc1_:Number = int(get_str() + 20 - Math.random() * (get_player().get_tou() + get_player().get_armorDef()));
         if(_loc1_ == 0)
         {
            outputText("幸运的是，摔倒并没有对你造成任何伤害。");
         }
         get_player().takeDamage(_loc1_,true);
      }
   }
}

