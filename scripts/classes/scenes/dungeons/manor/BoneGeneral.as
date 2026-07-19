package classes.scenes.dungeons.manor
{
   import classes.Appearance;
   import classes.CoC;
   import classes.Monster;
   import classes.PerkLib;
   import classes.Player;
   import classes.StatusEffects;
   import classes.internals.MonsterAI;
   import classes.internals.Utils;
   import classes.internals.WeightedChoice;
   import classes.items.Weapon;
   import classes.scenes.combat.CombatRange;
   import flash.Boot;
   
   public class BoneGeneral extends Monster
   {
      
      public function BoneGeneral(param1:Boolean = false)
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
         set_short("Bone Guardian");
         imageName = "";
         set_long("站在你面前的是一个巨大的骷髅巨人，身穿厚重的板甲，挥舞着一把巨大的生锈狼牙棒。无论他生前是谁，他一定是一个可怕的存在。");
         set_initedGenitals(true);
         pronoun1 = "它";
         pronoun2 = "它";
         pronoun3 = "它的";
         createBreastRow(Appearance.breastCupInverse("E"));
         ass.analLooseness = 1;
         ass.analWetness = 0;
         set_tallness(80);
         hips.rating = 8;
         butt.rating = 8;
         skin.tone = "dark green";
         hair.color = "purple";
         hair.length = 4;
         set_armorDef(60);
         set_armorPerk("重型");
         initStrTouSpeInte(90,100,10,42);
         initLibSensCor(45,45,100);
         bonusHP = 2000;
         set_weaponName("spiked mace");
         set_weaponVerb("crush");
         set_armorName("rusted plate armor");
         set_lust(0);
         temperment = 2;
         set_drop(new WeightedChoice());
         level = 20;
         set_gems(Utils.rand(5) + 100);
         lustVuln = 0;
         createPerk(PerkLib.BleedImmune,0,0,0,0);
         createPerk(PerkLib.PoisonImmune,0,0,0,0);
         createPerk(PerkLib.Juggernaut,0,0,0,0);
         createPerk(PerkLib.ChargingSwings,0,0,0,0);
         checkMonster();
      }
      
      override public function won(param1:Boolean, param2:Boolean = false) : void
      {
         get_game().dungeons.manor.loseToGeneral();
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
               outputText("你的攻击擦过了" + get_themonster() + "！");
            }
            else if(_loc5_)
            {
               outputText("你" + param1.get_attackVerb() + "了" + get_themonster() + "，把" + pronoun2 + "打得碎片横飞！");
            }
            else if(_loc6_)
            {
               outputText(get_Themonster() + "在你强大的" + param1.get_attackNoun() + "下裂开了！");
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
      
      override public function performCombatAction() : void
      {
         var _loc1_:MonsterAI = new MonsterAI();
         _loc1_.add(eAttack,2,true,0,FATIGUE_NONE,CombatRange.ChargingMelee);
         _loc1_.add(crushingBlow,1,!get_player().hasStatusEffect(StatusEffects.Stunned),10,FATIGUE_PHYSICAL,CombatRange.ChargingMelee);
         _loc1_.add(guardAlly,1,canGuard(),0,FATIGUE_NONE,CombatRange.Self);
         _loc1_.exec();
      }
      
      override public function handleStun() : Boolean
      {
         var _loc1_:int = 0;
         outputText("你的敌人被你刚才那一击打得晕头转向，无法还击！");
         if(int(get_game().monsterArray.length) > 1)
         {
            _loc1_ = 0;
            while(_loc1_ < int(get_game().monsterArray.length))
            {
               get_game().monsterArray[_loc1_].removeStatusEffect(StatusEffects.GuardAB);
               _loc1_++;
            }
         }
         if(statusEffectv1(StatusEffects.Stunned) <= 0)
         {
            removeStatusEffect(StatusEffects.Stunned);
         }
         else
         {
            addStatusValue(StatusEffects.Stunned,1,-1);
         }
         return false;
      }
      
      override public function handleFear() : Boolean
      {
         outputText("这具骷髅似乎对你展现出的幻象恐惧无动于衷。它像往常一样继续攻击！[pg]");
         removeStatusEffect(StatusEffects.Fear);
         return true;
      }
      
      public function guardAlly() : void
      {
         outputText("骸骨守卫向后退去，调整位置以保护一名盟友。");
         var _loc1_:Array = [];
         var _loc2_:int = 0;
         while(_loc2_ < int(get_game().monsterArray.length))
         {
            if(get_game().monsterArray[_loc2_] is Necromancer && get_game().monsterArray[_loc2_].get_HP() > 0)
            {
               outputText("\n死灵法师受到了骸骨守卫的保护！现在想要攻击他是不可能的了！");
               get_game().monsterArray[_loc2_].createStatusEffect(StatusEffects.GuardAB,2,0,0,0);
               return;
            }
            if(!(get_game().monsterArray[_loc2_] is BoneGeneral) && get_game().monsterArray[_loc2_].get_HP() > 0)
            {
               _loc1_.push(_loc2_);
            }
            _loc2_++;
         }
         var _loc3_:Array = _loc1_;
         var _loc4_:int = int(_loc3_[Utils.rand(int(_loc3_.length))]);
         outputText("\n" + get_game().monsterArray[_loc4_].get_capitalA() + get_game().monsterArray[_loc4_].get_short() + "受到了骸骨守卫的保护！现在不可能对" + get_game().monsterArray[_loc4_].pronoun2 + "进行攻击！");
         get_game().monsterArray[_loc4_].createStatusEffect(StatusEffects.GuardAB,2,0,0,0);
      }
      
      override public function defeated(param1:Boolean) : void
      {
         get_game().dungeons.manor.defeatGeneral();
      }
      
      public function crushingBlow() : void
      {
         outputText("骸骨守卫高举起它那巨大的钉头锤，然后狠狠地砸在你旁边的地上，伴随着一次巨大而令人站立不稳的重击粉碎了地面！");
         if(!get_player().stun(Utils.rand(2),25))
         {
            outputText("你设法保持了平衡，避免了被冲击波震晕。");
         }
         else
         {
            outputText("你失去了平衡摔倒在地，在这个过程中被<b>震晕</b>了！");
         }
         var _loc1_:int = get_player().reduceDamage(40 + Utils.rand(20),this);
         get_player().takeDamage(_loc1_,true);
      }
      
      public function canGuard() : Boolean
      {
         var _loc1_:int = 0;
         if(int(get_game().monsterArray.length) > 1)
         {
            _loc1_ = 0;
            while(_loc1_ < int(get_game().monsterArray.length))
            {
               if(get_game().monsterArray[_loc1_].hasStatusEffect(StatusEffects.GuardAB))
               {
                  return false;
               }
               _loc1_++;
            }
            _loc1_ = 0;
            while(_loc1_ < int(get_game().monsterArray.length))
            {
               if(get_game().monsterArray[_loc1_].get_HP() > 0 && !(get_game().monsterArray[_loc1_] is BoneGeneral))
               {
                  return true;
               }
               _loc1_++;
            }
         }
         return false;
      }
   }
}

