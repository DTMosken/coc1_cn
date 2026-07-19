package classes.scenes.dungeons.wizardTower
{
   import classes.CoC;
   import classes.Monster;
   import classes.PerkLib;
   import classes.Player;
   import classes.StatusEffects;
   import classes.internals.MonsterAI;
   import classes.internals.Utils;
   import classes.items.Weapon;
   import classes.scenes.combat.CombatRange;
   import flash.Boot;
   
   public class SentinelOfHeresy extends Monster
   {
      
      public var sealedRound:int;
      
      public function SentinelOfHeresy()
      {
         if(Boot.skip_constructor)
         {
            return;
         }
         sealedRound = 0;
         super();
         set_a("");
         set_short("Sentinel of Heresy");
         imageName = "heresysent";
         set_long("");
         initStrTouSpeInte(40,120,60,50);
         initLibSensCor(60,60,0);
         lustVuln = 0.7;
         set_tallness(72);
         createBreastRow(0,1);
         initGenderless();
         set_drop(NO_DROP);
         ignoreLust = true;
         level = 22;
         bonusHP = 1100;
         canBlock = true;
         set_shieldBlock(30);
         set_shieldName("巨石盾");
         set_weaponName("shield");
         set_weaponVerb("bash");
         set_weaponAttack(20);
         set_armorName("cracked stone");
         set_armorDef(70);
         set_lust(30);
         bonusLust = 20;
         additionalXP = 500;
         createPerk(PerkLib.PoisonImmune,0,0,0,0);
         createPerk(PerkLib.BleedImmune,0,0,0,0);
         checkMonster();
      }
      
      public function sealTease() : void
      {
         outputText("裸体守卫以一种虔诚的姿势将盾牌举向天空，它的四肢以非人的精度锁定在原位，关节处升起小团灰尘。一道微弱的光波从活体雕像向外扩散，准确无误地向你游荡而来。");
         outputText("\n光芒击中了你，它的效果抽象但立竿见影；你为自己的变态感到羞愧和内疚。<b>你的挑逗能力被封印了！</b>");
         get_player().createStatusEffect(StatusEffects.SentinelNoTease,3,0,0,0);
         sealedRound = get_game().combat.combatRound;
         set_fatigue(get_fatigue() + 15);
      }
      
      override public function replacesDescribeAttacked(param1:Weapon, param2:int, param3:Boolean = false) : Boolean
      {
         var _loc4_:Boolean = false;
         var _loc5_:Boolean = false;
         var _loc6_:Boolean = false;
         if(!param1.isChanneling())
         {
            _loc4_ = param2 < 15 || param2 < maxHP() * 0.05;
            _loc5_ = param2 < 50 || param2 < maxHP() * 0.2;
            _loc6_ = param2 < 100 || param2 < maxHP() * 0.33;
            if(param2 <= 0)
            {
               outputText("你的" + param1.get_attackNoun() + "被" + get_themonster() + "毫发无伤地弹开了。");
            }
            else if(_loc4_)
            {
               outputText("你对" + get_themonster() + "造成了擦伤！");
            }
            else if(_loc5_)
            {
               outputText("你" + param1.get_attackVerb() + "了" + get_themonster() + "，把" + pronoun2 + "的碎片打得四处飞溅！");
            }
            else if(_loc6_)
            {
               outputText(get_Themonster() + "在你强力的" + param1.get_attackNoun() + "下碎裂了！");
            }
            else
            {
               outputText("你用强大的" + param1.get_attackNoun() + "[b:粉碎]了" + get_themonster() + "！");
            }
            if(param3)
            {
               outputText("[b:暴击！]");
            }
            outputText(get_game().combat.getDamageText(param2));
            return true;
         }
         return false;
      }
      
      override public function performCombatAction() : void
      {
         var _loc4_:* = null as Monster;
         if(Utils.rand(get_lust() - 35) > Utils.rand(100))
         {
            humanity();
            return;
         }
         var _loc1_:MonsterAI = new MonsterAI();
         _loc1_.add(eAttack,2,true,0,FATIGUE_NONE,CombatRange.Melee);
         _loc1_.add(sealTease,1,!get_player().hasStatusEffect(StatusEffects.SentinelNoTease) && get_game().combat.combatRound >= sealedRound + 2,15,FATIGUE_MAGICAL,CombatRange.Omni);
         var _loc2_:int = 0;
         var _loc3_:Array = get_game().monsterArray;
         while(_loc2_ < int(_loc3_.length))
         {
            _loc4_ = _loc3_[_loc2_];
            _loc2_++;
            if(!(_loc4_ is SentinelOfHeresy) && _loc4_.get_HP() > 0 && _loc4_.HPRatio() < 0.6)
            {
               _loc1_.add(martyrdom,2,true,0,FATIGUE_NONE,CombatRange.Self);
               break;
            }
         }
         _loc1_.exec();
      }
      
      override public function outputDefaultTeaseReaction(param1:Number) : void
      {
         if(param1 == 0)
         {
            outputText("[pg]" + get_capitalA() + Utils.cnName(get_short()) + "似乎没有受到任何影响。");
         }
         outputText("[pg]" + get_capitalA() + Utils.cnName(get_short()) + "没有表现出任何情绪，但你敢发誓，你的展示让它停顿了一下……哪怕只有一瞬间。");
      }
      
      public function martyrdom() : void
      {
         var _loc3_:* = null as Monster;
         var _loc4_:Number = NaN;
         outputText("裸体守卫用盾牌掩护自己，盾牌开始发光，上面印着的宗教纹章闪烁着魔法能量。一股柔和的能量波向外扩散，涌向它的盟友。");
         var _loc1_:int = 0;
         var _loc2_:Array = get_game().monsterArray;
         while(_loc1_ < int(_loc2_.length))
         {
            _loc3_ = _loc2_[_loc1_];
            _loc1_++;
            if(!(_loc3_ is SentinelOfHeresy) && _loc3_.get_HP() > 0)
            {
               _loc4_ = Math.round(maxHP() * (1 + Utils.rand(2)) * 0.1);
               _loc3_.addHP(_loc4_);
               outputText("\n[Themonster]被治愈了！<b>(<font color=\"" + get_game().mainViewManager.colorHpPlus() + "\">" + Math.round(_loc4_) + "</font>)</b>");
            }
         }
         _loc4_ = 40 + Utils.rand(40);
         outputText("\n施法后，活体雕像的碎片破裂并掉落。这一定对魔像的体质造成了负担。");
         set_HP(get_HP() - _loc4_);
         outputText("<b>(<font color=\"" + get_game().mainViewManager.colorHpMinus() + "\">" + _loc4_ + "</font>)</b>");
      }
      
      public function humanity() : void
      {
         outputText("裸体守卫在施法中途突然停止了攻击。它向后退去，看着自己石质的双手，颤抖着，仿佛突然得到了某种启示。");
         outputText("\n然后它跪了下来，将盾牌砸在地上，表示认输。它很快就会恢复，但你刚才做的事情显然对它产生了影响！");
         set_lust(get_lust() - 15);
         set_fatigue(get_fatigue() - 5);
      }
   }
}

