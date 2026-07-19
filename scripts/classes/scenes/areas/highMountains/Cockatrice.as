package classes.scenes.areas.highMountains
{
   import classes.CoC;
   import classes.CockTypesEnum;
   import classes.ItemType;
   import classes.Measurements;
   import classes.PerkLib;
   import classes.Player;
   import classes.StatusEffects;
   import classes._FlagDict.FlagDict_Impl_;
   import classes.internals.MonsterAI;
   import classes.internals.Utils;
   import classes.internals.WeightedChoice;
   import classes.items.ConsumableLib;
   import classes.scenes.combat.CombatRange;
   import classes.scenes.monsters.StareMonster;
   import flash.Boot;
   import haxe.IMap;
   
   public class Cockatrice extends StareMonster
   {
      
      public var spellCostTailSwipe:int;
      
      public var spellCostSandAttack:int;
      
      public var spellCostCompulsion:int;
      
      public function Cockatrice()
      {
         if(Boot.skip_constructor)
         {
            return;
         }
         spellCostSandAttack = 15;
         spellCostTailSwipe = 25;
         spellCostCompulsion = 20;
         super();
         set_a("");
         set_short("cockatrice");
         imageName = "cockatrice";
         set_long("你面前的这只鸡蛇大约有" + Measurements.briefHeight(74) + "高。这只鹰身女妖与蛇怪的混血儿在长着利爪的脚上跳来跳去，它那绿松石色的颈部羽毛蓬松着。从这只生物平坦的胸部和紧实的臀部来看，你猜测它应该是雄性。他注视着你，电蓝色的眼睛闪闪发光，午夜蓝色的尾巴在身后甩动。他时不时地向前猛扑" + (get_game().get_noFur() ? "" : "，张开喙") + "，然后才发现这只是个假动作。他挥舞着锋利的爪子作为武器，唯一的防护就是他那奇特的羽毛和" + (get_game().get_noFur() ? "长满鳞片的四肢" : "奶油色、长满鳞片的腹部") + "。" + (canFly() ? "他时不时地展开巨大的羽翼，试图恐吓你。" : "") + "他那蜥蜴般的脚偶尔会凿进高原的碎石中，在改变姿势时将碎石扬起。");
         set_race("Cockatrice");
         createCock(8,2,CockTypesEnum.LIZARD);
         balls = 2;
         ballSize = 2;
         cumMultiplier = 4;
         createBreastRow(0);
         ass.analLooseness = 1;
         ass.analWetness = 0;
         createStatusEffect(StatusEffects.BonusACapacity,30,0,0,0);
         set_tallness(74);
         hips.rating = 6;
         butt.rating = 2;
         lowerBody.type = 28;
         face.type = 25;
         tongue.type = 5;
         ears.type = 21;
         eyes.type = 8;
         hair.type = 1;
         skin.tone = "midnight blue";
         skin.setType(2);
         hair.color = "blue";
         hair.length = 2;
         initStrTouSpeInte(65,50,85,70);
         initLibSensCor(65,25,20);
         set_weaponName("talons");
         set_weaponVerb("claw");
         set_weaponAttack(30);
         set_armorName("scales and feathers");
         set_armorDef(10);
         set_armorPerk("");
         set_armorValue(70);
         bonusHP = 200;
         set_lust(30);
         lustVuln = 0.5;
         temperment = 2;
         level = 14;
         set_gems(Utils.rand(10) + 10);
         set_drop(new WeightedChoice().add(get_consumables().REPTLUM,35).add(get_consumables().GLDSEED,35).add(get_consumables().TOTRICE,20).add(null,10));
         tail.type = 29;
         tail.recharge = 0;
         createPerk(PerkLib.BasiliskResistance,0,0,0,0);
         checkMonster();
      }
      
      override public function won(param1:Boolean, param2:Boolean = false) : void
      {
         clearOutput();
         if(param1)
         {
            get_player().set_HP(1);
            outputText("你的伤势太重无法承受，失去了意识。");
         }
         if(param2)
         {
            outputText("[pg]鸡蛇得意地笑了笑，但还是等着你完成……");
            doNext(get_game().combat.endLustLoss);
         }
         else
         {
            get_game().highMountains.cockatriceScene.loseToCockatrice();
         }
      }
      
      public function tailSwipe() : void
      {
         if(get_fatigue() > 100 - spellCostTailSwipe)
         {
            eAttack();
            return;
         }
         outputText("鸡蛇突然向你甩出尾巴，把你的[feet]扫倒在地！你赶紧踉跄着站起来，确保把这生物的脚留在视线内。");
         var _loc1_:Number = int(get_str() + 20 - Math.random() * (get_player().get_tou() + get_player().get_armorDef()));
         get_player().takeDamage(_loc1_,true);
         if(_loc1_ == 0)
         {
            outputText("幸运的是，这一跤并没有对你造成任何伤害。");
         }
         set_fatigue(get_fatigue() + spellCostTailSwipe);
      }
      
      public function sandAttack() : void
      {
         if(get_fatigue() > 100 - spellCostSandAttack)
         {
            eAttack();
            return;
         }
         outputText("鸡蛇[if (monster.canFly) {展开双翼，用力拍打地面。他卷起一阵松散的泥土和岩石，在飞过你头顶时将它们扫向你。|用尾巴扫过地面，卷起一阵松散的泥土和小石块。接着他动作敏捷地向你挥击，将碎屑甩向你的方向。}]");
         if(get_player().get_spe() / 5 + Utils.rand(20) < 28 + get_player().newGamePlusMod() * 5)
         {
            if(Utils.rand(2) == 0)
            {
               outputText("泥土和岩石吞没了你，迫使你试图捂住眼睛。你没能及时躲开，泥土进了眼睛，让你泪流满面，暂时失明了。");
               get_player().createStatusEffect(StatusEffects.Blind,2 + Utils.rand(3),0,0,0);
            }
            else
            {
               outputText("泥土和岩石将你吞没，迫使你捂住眼睛。你及时捂住眼睛挡住了泥土，泥土在你身上倾泻了一会儿才重新平息下来。");
            }
         }
         else
         {
            outputText("谢天谢地，你成功地完全避开了攻击，那团灰尘和泥土从你身旁掠过。");
         }
         set_fatigue(get_fatigue() + spellCostSandAttack);
      }
      
      override public function performCombatAction() : void
      {
         var _loc1_:MonsterAI = new MonsterAI().add(sandAttack,40,true,spellCostSandAttack,FATIGUE_PHYSICAL,CombatRange.Ranged).add(cockaTease,40,true,0,FATIGUE_NONE,CombatRange.Tease).add(tailSwipe,30,true,spellCostTailSwipe,FATIGUE_PHYSICAL,CombatRange.Melee).add(eAttack,20,true,0,FATIGUE_NONE,CombatRange.Melee);
         if(!get_player().hasStatusEffect(StatusEffects.BasiliskCompulsion) && !hasStatusEffect(StatusEffects.Blind))
         {
            _loc1_.add(compulsion,40,true,spellCostCompulsion,FATIGUE_NONE,CombatRange.Ranged);
         }
         _loc1_.exec();
      }
      
      override public function defeated(param1:Boolean) : void
      {
         get_game().highMountains.cockatriceScene.defeatCockatrice();
      }
      
      public function compulsion() : void
      {
         var _loc1_:* = null as IMap;
         if(get_fatigue() > 100 - spellCostCompulsion)
         {
            eAttack();
            return;
         }
         outputText("鸡蛇张开它的" + (get_game().get_noFur() ? "嘴巴" : "喙") + "，盯着你，用它那悦耳的语言吐出词句。这歌声萦绕在你的脑海中，在你的意志边缘不断盘旋、钻营，暗示、强迫，然后命令你看着鸡蛇的眼睛。");
         if(get_player().get_inte() / 5 + Utils.rand(20) < 24 + get_player().newGamePlusMod() * 5)
         {
            if(get_player().hasPerk(PerkLib.BasiliskResistance) || get_player().canUseStare() || get_player().hasKeyItem("Laybans"))
            {
               outputText("你情不自禁……瞥见了鸡蛇那闪电般的蓝色眼睛。然而，无论你怎么盯着那双眼睛看，都没有发现任何异常。你所能看到的只有鸡蛇。当这只鸡蛇发现你免疫时，他咒骂了起来！");
            }
            else
            {
               outputText("你集中注意力，但还是忍不住看向那闪电般的蓝色眼球。你迅速移开视线，但脑海中却浮现出它们的画面，它们凝视着你的思想，让你感到迟钝，无法协调动作。这种无助感不知为何感觉如此美妙……你无法打消这种感觉，你真的想永远注视着鸡蛇的眼睛，让它完全控制你。");
               get_player().takeLustDamage(3,true);
               StareMonster.speedReduce(get_player(),20);
               get_player().createStatusEffect(StatusEffects.BasiliskCompulsion,0,0,0,0);
               _loc1_ = get_flags();
               FlagDict_Impl_.arrayWriteInt(_loc1_,2208,FlagDict_Impl_.arrayReadInt(_loc1_,2208) + 2);
            }
         }
         else
         {
            outputText("你集中注意力，凝聚心神，抵抗住了鸡蛇那如音乐般的强迫。");
         }
         set_fatigue(get_fatigue() + spellCostCompulsion);
      }
      
      public function cockaTease() : void
      {
         if(Utils.rand(2) == 0)
         {
            outputText("鸡蛇慢慢转过身，越过肩膀看着你，同时缓缓抬起尾巴，露出紧致的臀部。他用带爪的手指摩擦着他" + (get_game().get_noFur() ? "" : "长满羽毛的") + "紧绷臀肉，然后他的尾巴像鞭子一样抽打在一侧臀瓣上。面对他如此厚颜无耻的展示，你忍不住脸红了。");
         }
         else
         {
            outputText("鸡蛇漫不经心地靠在附近的一块岩石上，一根长满鳞片的手指顺着他柔软的腹部滑下，在生殖裂的边缘游走，目光则望向远方。当他那粗壮的紫色肉棒的顶端开始探出时，他用炽热的目光看向你，歪着头，仿佛在召唤你“来玩吧”。当你感到下身欲火焚身时，你认真地考虑了他的提议。");
         }
         get_player().takeLustDamage(12 + Utils.rand(get_player().lib / 8),true);
      }
   }
}

