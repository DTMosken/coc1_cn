package classes.scenes.dungeons.wizardTower
{
   import classes.CoC;
   import classes.Monster;
   import classes.PerkLib;
   import classes.StatusEffects;
   import classes.items.Weapon;
   import flash.Boot;
   
   public class IncubusStatue extends Monster
   {
      
      public function IncubusStatue()
      {
         if(Boot.skip_constructor)
         {
            return;
         }
         super();
         set_a("");
         set_short("Incubus Statue");
         imageName = "incStatue";
         set_long("");
         initStrTouSpeInte(100,100,50,50);
         initLibSensCor(60,60,0);
         lustVuln = 0.65;
         set_tallness(72);
         createBreastRow(0,1);
         initGenderless();
         set_drop(NO_DROP);
         ignoreLust = true;
         level = 22;
         bonusHP = 600;
         set_weaponName("scimitar");
         set_weaponVerb("slash");
         set_weaponAttack(70);
         set_armorName("cracked stone");
         set_armorDef(70);
         set_lust(30);
         bonusLust = 75;
         createPerk(PerkLib.PoisonImmune,0,0,0,0);
         createPerk(PerkLib.BleedImmune,0,0,0,0);
         createPerk(PerkLib.StunImmune,0,0,0,0);
         checkMonster();
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
               outputText("你的" + param1.get_attackNoun() + "被" + get_themonster() + "弹开，没有造成任何伤害。");
            }
            else if(_loc4_)
            {
               outputText("你对" + get_themonster() + "造成了擦伤！");
            }
            else if(_loc5_)
            {
               outputText("你" + param1.get_attackVerb() + "了" + get_themonster() + "，把" + pronoun2 + "打得碎片横飞！");
            }
            else if(_loc6_)
            {
               outputText(get_Themonster() + "在你强力的" + param1.get_attackNoun() + "下碎裂了！");
            }
            else
            {
               outputText("你用强力的" + param1.get_attackNoun() + "[b:粉碎]了" + get_themonster() + "！");
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
      
      public function rebuilding() : void
      {
         outputText("男魅魔雕像的碎片拼凑在一起，魔像慢慢地重组了自己。");
      }
      
      override public function performCombatAction() : void
      {
         var _loc3_:* = null as Monster;
         var _loc1_:int = 0;
         var _loc2_:Array = get_game().monsterArray;
         while(_loc1_ < int(_loc2_.length))
         {
            _loc3_ = _loc2_[_loc1_];
            _loc1_++;
            if(_loc3_ is ArchitectJeremiah)
            {
               if(_loc3_.get_HP() <= 0)
               {
                  set_HP(0);
                  outputText("失去了主人的控制，男魅魔雕像分崩离析，失去了活性。");
                  return;
               }
            }
         }
         if(get_lust() >= maxLust())
         {
            outputText("雕像停了下来，开始震动。瞬间，它裂开了，无法抑制自己的欲望。");
            outputText("<b>(<font color=\"" + get_game().mainViewManager.colorHpMinus() + "\">" + (get_HP() - maxHP() / 2) + "</font>)</b>");
            set_HP(maxHP() / 2);
            set_lust(0);
            return;
         }
         if(get_HP() == maxHP())
         {
            omnislash();
         }
         else
         {
            rebuilding();
         }
      }
      
      public function omnislash() : void
      {
         outputText("完全重组后，高大的男魅魔挥舞着两把弯刀。它摆出战斗姿态，大理石和岩石发出巨大的隆隆声。");
         outputText("\n[say:这总是很有趣，是的。]男魅魔以惊人的速度和力量向你冲来！\n");
         createStatusEffect(StatusEffects.Attacks,5,0,0,0);
         eAttack();
         outputText("\n[say:这些恶魔，可不只是用来做爱的！]");
         outputText("\n雕像在攻击后裂成了几块。");
         outputText("<b>(<font color=\"" + get_game().mainViewManager.colorHpMinus() + "\">" + (get_HP() - maxHP() / 2) + "</font>)</b>");
         set_HP(maxHP() / 2);
      }
      
      override public function handleFear() : Boolean
      {
         return true;
      }
   }
}

