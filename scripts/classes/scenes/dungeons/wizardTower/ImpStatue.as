package classes.scenes.dungeons.wizardTower
{
   import classes.CoC;
   import classes.Creature;
   import classes.Monster;
   import classes.PerkLib;
   import classes.Player;
   import classes.StatusEffects;
   import classes.internals.Utils;
   import classes.items.Shield;
   import classes.items.Weapon;
   import classes.scenes.combat.AvoidDamageParameters;
   import flash.Boot;
   
   public class ImpStatue extends Monster
   {
      
      public function ImpStatue()
      {
         if(Boot.skip_constructor)
         {
            return;
         }
         super();
         set_a("");
         set_short("Imp Statue");
         imageName = "incStatue";
         set_long("");
         initStrTouSpeInte(40,50,80,50);
         initLibSensCor(60,60,0);
         lustVuln = 0.9;
         set_tallness(72);
         createBreastRow(0,1);
         initGenderless();
         set_drop(NO_DROP);
         ignoreLust = true;
         level = 22;
         bonusHP = 400;
         set_weaponName("nothing");
         set_weaponVerb("spell casting");
         set_weaponAttack(20);
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
               outputText("你的" + param1.get_attackNoun() + "被" + get_themonster() + "毫发无伤地弹开了。");
            }
            else if(_loc4_)
            {
               outputText("你擦伤了" + get_themonster() + "！");
            }
            else if(_loc5_)
            {
               outputText("你" + param1.get_attackVerb() + "了" + get_themonster() + "，打得" + pronoun2 + "碎片横飞！");
            }
            else if(_loc6_)
            {
               outputText(get_Themonster() + "在你强力的" + param1.get_attackNoun() + "下破裂开来！");
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
         outputText("小恶魔雕像的碎片聚拢在一起，魔像正在慢慢重组。");
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
                  outputText("失去了主控，小恶魔雕像分崩离析，失去了活性。");
                  return;
               }
            }
         }
         if(get_lust() >= maxLust())
         {
            outputText("雕像停了下来，开始震动。刹那间，它裂开了，无法抑制自身的欲望。");
            outputText("<b>(<font color=\"" + get_game().mainViewManager.colorHpMinus() + "\">" + (get_HP() - maxHP() / 2) + "</font>)</b>");
            set_HP(maxHP() / 2);
            set_lust(0);
            return;
         }
         if(get_HP() == maxHP())
         {
            debilitate();
         }
         else
         {
            rebuilding();
         }
      }
      
      override public function handleFear() : Boolean
      {
         return true;
      }
      
      public function debilitate() : void
      {
         outputText("完全重组后，小恶魔雕像一边跳跃着，一边编织着某种法术。");
         outputText("\n[say:这个小家伙真让我开心。总是这么欢快地动来动去。总是施展这么强大的魔法。]小恶魔雕像双手向你一挥，对你施放了一个隐形的法术！\n");
         var _loc1_:AvoidDamageParameters = new AvoidDamageParameters(true,true,false,null,false,null,null,null);
         if(!playerAvoidDamage(_loc1_))
         {
            if(get_player().get_shield() == get_game().shields.DRGNSHL && Utils.rand(3) == 0)
            {
               outputText("[pg]你被法术击中了，但幸好你及时举起了盾牌。黑魔法被吸收并无效化了！");
            }
            else
            {
               outputText("\n你被这个虚弱法术完全击中了！");
               if(get_player().stun())
               {
                  outputText("你被<b>击晕</b>了！");
               }
               if(Utils.rand(3) != 0 && !get_player().hasStatusEffect(StatusEffects.Blind))
               {
                  outputText("你被<b>致盲</b>了！");
                  get_player().createStatusEffect(StatusEffects.Blind,3,0,0,0);
               }
               if(!get_player().hasStatusEffect(StatusEffects.Marked))
               {
                  outputText("你被<b>施咒</b>了！");
                  get_player().createStatusEffect(StatusEffects.Marked,2,0,0,0);
               }
            }
         }
         outputText("\n[say: 真的，我都不知道它还能做这些。]");
         outputText("\n雕像在攻击后碎裂成了几块。");
         outputText("<b>(<font color=\"" + get_game().mainViewManager.colorHpMinus() + "\">" + (get_HP() - maxHP() / 2) + "</font>)</b>");
         set_HP(maxHP() / 2);
      }
   }
}

