package classes.scenes.areas.desert
{
   import classes.Appearance;
   import classes.CoC;
   import classes.ItemType;
   import classes.Monster;
   import classes.PerkLib;
   import classes.Player;
   import classes.ReactionContext;
   import classes.StatusEffect;
   import classes.StatusEffects;
   import classes.internals.MonsterAI;
   import classes.internals.Utils;
   import classes.internals.WeightedChoice;
   import classes.items.ConsumableLib;
   import classes.scenes.combat.Combat;
   import classes.scenes.combat.CombatRange;
   import classes.statusEffects.combat.NagaVenomDebuff;
   import flash.Boot;
   
   public class Naga extends Monster
   {
      
      public function Naga(param1:Boolean = false)
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
         set_short("naga");
         imageName = "naga";
         set_long("你正在与一只娜迦战斗。她腰部以上看起来像一个美丽苗条的女人，深色的头发垂到脖子。她的上半身晒成了深褐色，而下半身则覆盖着闪亮的鳞片，鳞片上的条纹图案让人联想到周围的沙丘。她的臀部没有分叉成双腿，而是延伸成蛇的身体，在身后远远地伸展着，在沙地上留下一条长长弯曲的痕迹。她一丝不挂，圆润的C罩杯乳房一览无余。在她的嘴里，你可以看到一对锋利的毒牙和一条长长的分叉舌头，当她向你发出嘶嘶声时，舌头在快速地吞吐着。");
         set_race("Naga");
         createVagina(false,5,1);
         createStatusEffect(StatusEffects.BonusVCapacity,40,0,0,0);
         createBreastRow(Appearance.breastCupInverse("C"));
         ass.analLooseness = 1;
         ass.analWetness = 0;
         createStatusEffect(StatusEffects.BonusACapacity,10,0,0,0);
         set_tallness(70);
         hips.rating = 8;
         butt.rating = 8;
         lowerBody.type = 3;
         skin.tone = "mediterranean-toned";
         hair.color = "brown";
         hair.length = 16;
         initStrTouSpeInte(28,20,35,42);
         initLibSensCor(55,55,40);
         set_weaponName("fist");
         set_weaponVerb("punch");
         set_weaponAttack(3);
         set_armorName("scales");
         set_armorDef(5);
         set_lust(30);
         temperment = 2;
         level = 2;
         set_gems(Utils.rand(5) + 8);
         set_drop(new WeightedChoice().add(null,1).add(get_consumables().REPTLUM,5).add(get_consumables().SNAKOIL,4));
         checkMonster();
      }
      
      override public function won(param1:Boolean, param2:Boolean = false) : void
      {
         var _g:Combat;
         if(param2)
         {
            outputText("[pg]娜迦睁大了眼睛，转身离开，对你不再感兴趣了。");
            get_player().orgasm("Generic");
            _g = get_game().combat;
            doNext(function():void
            {
               _g.cleanupAfterCombat();
            });
         }
         else
         {
            get_game().desert.nagaScene.nagaFUCKSJOOOOOO();
         }
      }
      
      override public function struggle() : void
      {
         var _loc1_:int = 0;
         if(get_player().hasStatusEffect(StatusEffects.NagaBind))
         {
            clearOutput();
            if(Utils.rand(3) == 0 || Utils.rand(80) < get_player().get_str() / 1.5)
            {
               outputText("你剧烈地扭动挣扎，硬是从娜迦的缠绕中挣脱了出来。");
               get_player().removeStatusEffect(StatusEffects.NagaBind);
            }
            else
            {
               outputText("当你试图从那令人兴奋的压迫感中挣脱时，娜迦对你的缠绕变得更紧了。");
               _loc1_ = int(get_player().sens / 10 + 2);
               get_player().takeLustDamage(_loc1_,true);
               get_game().combat.takeDamage(7 + Utils.rand(5));
            }
            tookAction = true;
         }
      }
      
      override public function react(param1:ReactionContext) : Boolean
      {
         if(param1.index == 3)
         {
            if(get_player().hasStatusEffect(StatusEffects.NagaBind))
            {
               clearOutput();
               outputText("当你放松下来享受这刺激的压迫感时，娜迦对你的缠绕变得更紧了。");
               get_player().takeLustDamage(get_player().sens / 5 + 5,true);
               get_game().combat.takeDamage(5 + Utils.rand(5));
               tookAction = true;
               return false;
            }
         }
         return true;
      }
      
      override public function performCombatAction() : void
      {
         var _loc1_:MonsterAI = new MonsterAI();
         _loc1_.add(nagaPoisonBiteAttack,1,true,5,FATIGUE_PHYSICAL,CombatRange.Melee);
         _loc1_.add(nagaConstrict,1,true,10,FATIGUE_PHYSICAL,CombatRange.Melee);
         _loc1_.add(nagaTailWhip,1,true,5,FATIGUE_PHYSICAL,CombatRange.Ranged);
         _loc1_.add(eAttack,2,true,0,FATIGUE_NONE,CombatRange.Melee);
         _loc1_.exec();
      }
      
      public function nagaTailWhip() : void
      {
         var _loc1_:Number = NaN;
         outputText("娜迦绷紧身体，用力扭动着。");
         if(get_player().hasPerk(PerkLib.Evade) && Utils.rand(6) == 0)
         {
            outputText("你看到她的尾巴朝你甩来，在最后一秒惊险避开。你迅速翻滚，重新站稳脚跟。");
         }
         else if(get_player().hasPerk(PerkLib.Misdirection) && Utils.rand(100) < 10 && get_player().get_armorName() == "red, high-society bodysuit")
         {
            outputText("利用拉斐尔的教导以及紧身衣赋予你的灵活性，你预判并侧身躲开了" + get_a() + get_short() + "的尾鞭。");
         }
         else if(get_player().get_spe() > Utils.rand(300))
         {
            outputText("你看到她的尾巴朝你甩来，在最后一秒跳开。你迅速翻滚，重新站稳脚跟。");
         }
         else
         {
            outputText("你还没来得及反应，就感到腰部一阵剧痛，娜迦的尾巴狠狠地抽中了你，将你击倒在沙地上。你爬了起来，捂着疼痛的腰部倒吸了一口凉气。");
            _loc1_ = 10;
            if(get_player().get_armorDef() < 10)
            {
               _loc1_ += 10 - get_player().get_armorDef();
            }
            _loc1_ += Utils.rand(3);
            get_player().takeDamage(_loc1_,true);
         }
      }
      
      public function nagaPoisonBiteAttack() : void
      {
         outputText("娜迦以眼镜蛇般的速度发动攻击，将毒牙深深刺入你的血肉之中！");
         var _loc1_:NagaVenomDebuff = get_player().statusEffectByType(StatusEffects.NagaVenom);
         if(_loc1_ == null)
         {
            outputText("毒液的效果几乎是瞬间发作的；你的视线开始模糊，站立也变得越来越困难。");
            get_player().addStatusEffect(new NagaVenomDebuff());
         }
         else
         {
            outputText("毒液的效果加剧了，你的视线开始模糊，站立也变得越来越困难。");
            _loc1_.increase();
         }
      }
      
      public function nagaConstrict() : void
      {
         outputText("娜迦靠近你，突然将你缠绕起来，把你紧紧束缚在原地！感受着她的鳞片摩擦着你的身体，你忍不住感到一阵莫名的兴奋。当她开始越缠越紧时，你所能做的只有挣扎！");
         get_player().createStatusEffect(StatusEffects.NagaBind,0,0,0,0);
         if(!get_player().hasPerk(PerkLib.Juggernaut) && get_armorPerk() != "Heavy")
         {
            get_player().takeDamage(2 + Utils.rand(4));
         }
      }
      
      override public function defeated(param1:Boolean) : void
      {
         get_game().desert.nagaScene.nagaRapeChoice();
      }
   }
}

