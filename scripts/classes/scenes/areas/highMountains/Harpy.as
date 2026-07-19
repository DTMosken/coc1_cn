package classes.scenes.areas.highMountains
{
   import classes.Appearance;
   import classes.CoC;
   import classes.Monster;
   import classes.PerkLib;
   import classes.Player;
   import classes.StatusEffects;
   import classes._FlagDict.FlagDict_Impl_;
   import classes.internals.ChainedDrop;
   import classes.internals.MonsterAI;
   import classes.internals.Utils;
   import classes.items.ArmorLib;
   import classes.items.ConsumableLib;
   import classes.scenes.combat.CombatRange;
   import flash.Boot;
   import haxe.IMap;
   
   public class Harpy extends Monster
   {
      
      public function Harpy(param1:Boolean = false)
      {
         if(Boot.skip_constructor)
         {
            return;
         }
         super();
         if(param1)
         {
            return;
         }
         set_a("");
         set_short("harpy");
         imageName = "harpy";
         set_long("你正在和一只高大、疯狂的鹰身女妖战斗。她看起来非常像人类，大约六英尺六英寸高，但覆盖着一层细细的粉蓝色绒毛。她的手臂结实有力，有一层长长的蹼将它们与她丰满的臀部连接起来" + (get_game().get_noFur() ? "" : "，上面覆盖着细长的蓝色羽毛以帮助她飞行") + "。一对更大的粉蓝色翅膀也从她的肩胛骨伸出，漫不经心地拍打着。当她绕着你转，不规律地靠近和后退时，她显得相当疯狂。她的脸非常漂亮，精致的淡紫色妆容装饰着一个美丽女人的五官，她的嘴唇涂着浓郁的金色口红。当她绕着你转，疯狂地尖叫并试图恐吓你时，你的目光被她纤细的躯干和小巧挺拔的乳房所吸引，每个乳房都有一个小水果那么大" + (get_game().get_noFur() ? "" : "，上面覆盖着一层最柔软的羽毛，随着她翅膀的阵风起伏移动") + "。尽管她的乳房令人惊叹，但她那适合产卵的臀部更令人印象深刻。它们的宽度是她躯干的两倍，有着巨大、抖动的臀部，她那巨大、多肉的大腿向上与它们相接。她的腿以三叉状的爪子结束；它们阴暗的黑色曲线在光线下邪恶地闪烁着。");
         set_race("Harpy");
         createVagina(false,3,4);
         createStatusEffect(StatusEffects.BonusVCapacity,40,0,0,0);
         createBreastRow(Appearance.breastCupInverse("B"));
         ass.analLooseness = 1;
         ass.analWetness = 0;
         createStatusEffect(StatusEffects.BonusACapacity,20,0,0,0);
         set_tallness(78);
         hips.rating = 20;
         butt.rating = 13;
         lowerBody.type = 13;
         skin.tone = "pink";
         skin.type = 0;
         skin.desc = "feathers";
         hair.color = "blue";
         hair.length = 16;
         initStrTouSpeInte(60,40,90,40);
         initLibSensCor(70,30,80);
         set_weaponName("talons");
         set_weaponVerb("slashing talons");
         set_weaponAttack(15);
         set_armorName("feathers");
         set_armorDef(5);
         bonusHP = 150;
         set_lust(10);
         lustVuln = 0.7;
         temperment = 2;
         level = 10;
         set_gems(10 + Utils.rand(4));
         set_drop(new ChainedDrop().add(get_armors().W_ROBES,1 / (get_player().hasPerk(PerkLib.HistoryThief) ? 9 : 10)).add(get_consumables().LUSTSTK,get_player().hasPerk(PerkLib.LuststickAdapted) ? 0.3333333333333333 : 0).elseDrop(get_consumables().GLDSEED));
         wings.type = 4;
         checkMonster();
      }
      
      override public function won(param1:Boolean, param2:Boolean = false) : void
      {
         if(param2)
         {
            outputText("[pg]你的敌人似乎还没有恶心到要离开的地步……");
            doNext(get_game().combat.endLustLoss);
         }
         else
         {
            get_game().highMountains.harpyScene.harpyLossU();
         }
      }
      
      override public function performCombatAction() : void
      {
         if(hasStatusEffect(StatusEffects.Uber))
         {
            harpyUberCharge();
            return;
         }
         var _loc1_:MonsterAI = new MonsterAI().add(eAttack,1,true,0,FATIGUE_NONE,CombatRange.FlyingMelee);
         _loc1_.add(harpyUberCharge,1,true,15,FATIGUE_NONE,CombatRange.Omni);
         _loc1_.add(harpyTease,1,true,0,FATIGUE_NONE,CombatRange.Tease);
         _loc1_.exec();
      }
      
      override public function outputPlayerDodged(param1:int) : void
      {
         outputText("伴随着另一声疯狂的尖叫，鹰身女妖向你俯冲，像芭蕾舞演员一样优雅地在空中挥舞着她锋利如剃刀的爪子。你敏捷的反应让你躲过了她对你发动的每一次恶毒的挥砍。\n");
      }
      
      override public function outputAttack(param1:int) : void
      {
         if(param1 <= 0)
         {
            outputText("鹰身女妖用她的脚爪向你俯冲，但你挡开了攻击，抓住她的腿，把她在空中抡了一圈，在她有机会调整姿势之前把她扔了出去。");
         }
         else
         {
            outputText("鹰身女妖向前猛冲，将她锋利如剃刀的爪子挥向你，撕裂她能触及的所有暴露的血肉！<b>(<font color=\"" + get_game().mainViewManager.colorHpMinus() + "\">" + param1 + "</font>)</b>");
         }
      }
      
      public function harpyUberCharge() : void
      {
         var _loc1_:Number = NaN;
         if(!hasStatusEffect(StatusEffects.Uber))
         {
            createStatusEffect(StatusEffects.Uber,0,0,0,0);
            outputText("她疯狂地拍打着翅膀，飞离你并拉高高度，悬停在你面前的光芒中。她发出一声尖锐而可怕的叫声，眯起眼睛死死盯住你！");
         }
         else if(FlagDict_Impl_.arrayReadInt(get_flags(),22) == 0)
         {
            outputText("鹰身女妖发出一声可怕的尖叫并俯冲下来，以几乎不可能的速度向你冲去。她的眼睛像真正的猛禽一样眯起。你正忙于自己的攻击，根本无法躲避！她的爪子猛扑下来，像纸一样刺穿了你的[armor]，深深地刺入下面的肉体，让你痛得大叫。鹰身女妖把你摔在地上，你的伤口血流如注。");
            _loc1_ = (160 + Utils.rand(20)) * (1 + get_player().newGamePlusMod() / 2);
            get_player().takeDamage(_loc1_,true);
            removeStatusEffect(StatusEffects.Uber);
         }
         else
         {
            outputText("当疯狂的鹰身女妖在你上方盘旋时，你站稳脚跟，做好准备。她发出一声震耳欲聋的尖叫，伸出爪子向你俯冲，在平飞之前达到了惊人的速度。鹰身女妖直奔你而来！多亏了你准备好的姿势，你设法在鹰身女妖到达你身边时向旁边扑去。她稍微擦到了你，让你在扑向地面时旋转起来。你重重地摔在地上，但及时抬起头，看到她粗暴、毫无优雅地着陆。她的身体在地上翻滚，直到停下来。被激怒的鹰身女妖挣扎着爬起来，再次起飞！");
            get_player().takeDamage(10 + Utils.rand(10),true);
            removeStatusEffect(StatusEffects.Uber);
            set_HP(get_HP() - 20);
         }
      }
      
      public function harpyTease() : void
      {
         outputText("鹰身女妖不顾一切地向你冲来，她的身体带着她那充满母性光辉的臀部的全部重量撞击你。你们俩一起向后摔倒在地上。你和她沉甸甸的屁股扭打在一起，尽力不去想那些下流的念头，但她疯狂地拍打着翅膀，扭动着曲线优美的身体在你身上摩擦，这让你根本无法控制！在地上短暂地摸索扭打之后，她推开你，再次起飞。");
         get_player().takeLustDamage(12 + Utils.rand(get_player().sens / 5),true);
      }
      
      override public function defeated(param1:Boolean) : void
      {
         get_game().highMountains.harpyScene.harpyVictoryuuuuu();
      }
   }
}

