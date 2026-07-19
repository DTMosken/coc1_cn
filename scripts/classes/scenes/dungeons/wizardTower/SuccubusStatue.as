package classes.scenes.dungeons.wizardTower
{
   import classes.CoC;
   import classes.Creature;
   import classes.Monster;
   import classes.PerkLib;
   import classes.Player;
   import classes.internals.Utils;
   import classes.items.Shield;
   import classes.items.Weapon;
   import classes.scenes.combat.AvoidDamageParameters;
   import flash.Boot;
   
   public class SuccubusStatue extends Monster
   {
      
      public function SuccubusStatue()
      {
         if(Boot.skip_constructor)
         {
            return;
         }
         super();
         set_a("");
         set_short("Succubus Statue");
         imageName = "incStatue";
         set_long("");
         initStrTouSpeInte(40,100,80,100);
         initLibSensCor(60,60,0);
         lustVuln = 0.65;
         set_tallness(72);
         createBreastRow(0,1);
         initGenderless();
         set_drop(NO_DROP);
         ignoreLust = true;
         level = 22;
         bonusHP = 600;
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
               outputText("你的" + param1.get_attackNoun() + "被" + get_themonster() + "弹开了，没有造成任何伤害。");
            }
            else if(_loc4_)
            {
               outputText("你对" + get_themonster() + "造成了擦伤！");
            }
            else if(_loc5_)
            {
               outputText("你" + param1.get_attackVerb() + "了" + get_themonster() + "，" + pronoun2 + "的碎片四处飞溅！");
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
         outputText("魅魔雕像的碎片聚拢在一起，魔像正在慢慢重组。");
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
                  outputText("失去了主人的控制，魅魔雕像分崩离析，化为一堆死物。");
                  return;
               }
            }
         }
         if(get_lust() >= maxLust())
         {
            outputText("雕像停了下来，开始震动。瞬间，它裂开了，无法抑制自身的欲望。");
            outputText("<b>(<font color=\"" + get_game().mainViewManager.colorHpMinus() + "\">" + (get_HP() - maxHP() / 2) + "</font>)</b>");
            set_HP(maxHP() / 2);
            set_lust(0);
            return;
         }
         if(get_HP() == maxHP())
         {
            lustpocalypse();
         }
         else
         {
            rebuilding();
         }
      }
      
      public function lustpocalypse() : void
      {
         outputText("完全重组后，魅魔雕像挑逗地炫耀着自己的身体，这件作品完美无瑕的工艺制造出了一个真实血肉之躯的诱惑者的完美幻象。当她抚摸着自己完美的乳房和乳头，宽阔的臀部和完美的小穴时，你的心漏跳了一拍……");
         outputText("\n[say: 奇妙，而且如此罪恶！禁忌！禁忌！] 雕像的双手闪烁着黑魔法的光芒，察觉到你注意力不集中，她向你发射了一个法术！\n");
         var _loc1_:AvoidDamageParameters = new AvoidDamageParameters(true,true,false,null,false,null,null,null);
         if(!playerAvoidDamage(_loc1_))
         {
            if(get_player().get_shield() == get_game().shields.DRGNSHL && Utils.rand(3) == 0)
            {
               outputText("[pg]你被法术击中了，但幸好及时举起了盾牌。黑魔法被吸收并无效化了！");
            }
            else
            {
               outputText("\n你被催情法术完全击中，突然注入的欲望让你喘不过气来。");
               if(get_player().hasCock())
               {
                  outputText("你的[cock]几乎立刻硬了起来，因为渴望而跳动着。");
               }
               if(get_player().hasVagina())
               {
                  outputText("你的[vagina]肿胀湿润，乞求着有什么东西来填满它。");
               }
               outputText("天哪，你现在急需操点什么！");
               get_player().takeLustDamage(60 + get_player().lib / 10 + get_player().sens / 10,true);
            }
         }
         outputText("\n[say: 噢，放弃抵抗，好好享受自己吧。大家都是凡人，偶尔来一次也没什么大不了的！好吧，我不是。我是吗？]");
         outputText("\n雕像在攻击后碎成了几块。");
         outputText("<b>(<font color=\"" + get_game().mainViewManager.colorHpMinus() + "\">" + (get_HP() - maxHP() / 2) + "</font>)</b>");
         set_HP(maxHP() / 2);
      }
      
      override public function handleFear() : Boolean
      {
         return true;
      }
   }
}

