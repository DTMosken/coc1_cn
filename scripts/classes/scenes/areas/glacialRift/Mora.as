package classes.scenes.areas.glacialRift
{
   import classes.Appearance;
   import classes.CoC;
   import classes.ItemType;
   import classes.Monster;
   import classes.PerkLib;
   import classes.Player;
   import classes.ReactionContext;
   import classes.StatusEffect;
   import classes.StatusEffectType;
   import classes.StatusEffects;
   import classes._FlagDict.FlagDict_Impl_;
   import classes.internals.MonsterAI;
   import classes.internals.Utils;
   import classes.internals.WeightedChoice;
   import classes.internals._ValueFunc.NumberFunc_Impl_;
   import classes.items.Armor;
   import classes.items.ArmorLib;
   import classes.items.ConsumableLib;
   import classes.items.Weapon;
   import classes.scenes.combat.CombatDistance;
   import classes.scenes.combat.CombatRange;
   import classes.statusEffects.combat.FrostbiteDebuff;
   import flash.Boot;
   import haxe.IMap;
   
   public class Mora extends Monster
   {
      
      public var shrouded:int;
      
      public function Mora()
      {
         if(Boot.skip_constructor)
         {
            return;
         }
         shrouded = 0;
         super();
         set_a("");
         set_short("mora");
         imageName = "mora";
         set_long("这是一只形销骨立的恶魔，皮肤呈斑驳的灰白色，[if (nofur) {眼窝深陷，一副可怜相|眉骨沿鼻梁向下延伸，隐约呈羚羊角的轮廓}]，黑色的头发被两只末端相互扭绞在一起的角从中分开。她的\"翅膀\"如枯柳枝般破败地耷拉在骨架上，只能勉强衬托出她那羸弱的身形，而她的尾巴则像一根大羽毛，轻轻拂去身后留下的足迹。深陷的眼睛正悲戚地凝视着你，但她那染了污迹的爪子提醒着你不可掉以轻心。她身上穿着一件简陋的亚麻裙，遮住的地方寥寥无几。");
         set_race("Demon");
         createVagina(false,1,0);
         ass.analLooseness = 0;
         ass.analWetness = 0;
         createBreastRow(Appearance.breastCupInverse("flat"));
         ass.analLooseness = 1;
         ass.analWetness = 1;
         set_tallness(36);
         hips.rating = 0;
         butt.rating = 2;
         skin.tone = "ashen";
         skin.setType(0);
         hair.color = "dark";
         hair.length = 16;
         horns.type = 13;
         horns.value = 2;
         initStrTouSpeInte(95,80,30,30);
         initLibSensCor(40,20,100);
         set_weaponName("claws");
         set_weaponVerb("swipe");
         set_weaponAttack(8);
         set_armorName("linen dress");
         set_armorDef(3);
         bonusHP = 400;
         set_lust(5);
         lustVuln = 0.1;
         temperment = 1;
         level = 20;
         set_gems(35 + Utils.rand(25));
         set_drop(new WeightedChoice().add(get_consumables().AMENT_,2).add(get_consumables().ICICLE_,1).add(null,3));
         createPerk(PerkLib.BleedImmune,0,0,0,0);
         shrouded = 0;
         checkMonster();
      }
      
      override public function won(param1:Boolean, param2:Boolean = false) : void
      {
         get_game().glacialRift.moraScene.moraLose();
      }
      
      override public function shouldMove(param1:CombatDistance, param2:Boolean = false) : Boolean
      {
         if(param1 == CombatDistance.Distant)
         {
            return false;
         }
         return Boolean(super.shouldMove(param1,param2));
      }
      
      override public function react(param1:ReactionContext) : Boolean
      {
         var _loc2_:* = null as StatusEffectType;
         switch(param1.index)
         {
            case 0:
               if(!get_game().combat.isWieldingRangedWeapon())
               {
                  return true;
               }
               if(shrouded != 0 && Utils.randomChance(60))
               {
                  if(param1 == ReactionContext.BowHit)
                  {
                     outputText("箭矢完全没有射中[themonster]。");
                  }
                  else
                  {
                     get_player().get_weapon().describeAttack({"hit":false});
                  }
                  return false;
               }
               return true;
               break;
            case 9:
               if(shrouded > 0)
               {
                  --shrouded;
               }
               return true;
            case 10:
               if(shrouded != 0 && Utils.randomChance(60))
               {
                  if(param1 == ReactionContext.BowHit)
                  {
                     outputText("箭矢完全没有射中[themonster]。");
                  }
                  else
                  {
                     get_player().get_weapon().describeAttack({"hit":false});
                  }
                  return false;
               }
               return true;
               break;
            case 11:
               _loc2_ = param1.params[0];
               if(_loc2_ == StatusEffects.Fear)
               {
                  removeStatusEffect(StatusEffects.Fear);
                  outputText("莫拉尖叫了一声，但还是继续攻击。" + get_game().combat.getDamageText(takeDamage(20 * get_player().spellMod())));
               }
               return true;
            default:
               return true;
         }
      }
      
      override public function performCombatAction() : void
      {
         var _loc1_:MonsterAI = new MonsterAI().add(eAttack,1,true,0,FATIGUE_NONE,CombatRange.Melee).add(moraMistAttack,1,true,5,FATIGUE_PHYSICAL,CombatRange.Melee).add(moraSurgeAttack,1,true,5,FATIGUE_PHYSICAL,CombatRange.Ranged).add(moraShroudAttack,1,distance == CombatDistance.Distant,10,FATIGUE_PHYSICAL,CombatRange.Self).add(moraDespairAttack,1,!get_player().canFly(),10,FATIGUE_PHYSICAL,CombatRange.Ranged);
         _loc1_.exec();
      }
      
      override public function outputAttack(param1:int) : void
      {
         if(param1 <= 0)
         {
            super.outputAttack(param1);
            return;
         }
         outputText("莫拉向你挥舞着她的爪子！");
         if(FlagDict_Impl_.arrayReadInt(get_flags(),2138) > 0)
         {
            outputText("[b:暴击！]");
         }
         outputText(get_game().combat.getDamageText(param1));
      }
      
      public function moraSurgeAttack() : void
      {
         var _loc1_:FrostbiteDebuff = afflictFrostbite();
         outputText("你脚下的冰面震动起来，莫拉四肢着地。她发出一声尖叫，随后你周围的雪猛烈地卷起，如同无数细小的尖刺！");
         get_player().takeDamage(20 + 10 * _loc1_.stacks,true);
      }
      
      public function moraShroudAttack() : void
      {
         outputText("她转过身，用羽毛般的尾巴扫过雪面，卷起一阵遮蔽你视线的雪堆！你近处还能看清，但远程攻击可就没那么容易了。");
         shrouded += Utils.maxInt(get_game().get_difficulty() + 1,0) + 1;
      }
      
      public function moraMistAttack() : void
      {
         var _loc1_:FrostbiteDebuff = afflictFrostbite();
         outputText("莫拉收拢双臂，扬起柳叶般的翅膀，用力扇动，释放出一团刺骨的冰霜。");
         get_player().takeDamage(20 + 10 * _loc1_.stacks,true);
      }
      
      public function moraDespairAttack() : void
      {
         var _loc2_:* = null as String;
         var _loc1_:Boolean = false;
         if(get_player().get_lust() < 100)
         {
            _loc2_ = "str";
            debuffStat(_loc2_);
            _loc2_ = "spe";
            debuffStat(_loc2_);
            _loc2_ = "tou";
            debuffStat(_loc2_);
            _loc2_ = "inte";
            debuffStat(_loc2_);
         }
         if(Boolean([get_armors().DBARMOR,get_armors().GOOARMR,get_armors().TBARMOR,get_armors().VINARMR].contains(get_player().get_armor())))
         {
            get_player().addCombatBonusStat("护甲",NumberFunc_Impl_.fromInt(-5));
            _loc1_ = true;
         }
         outputText("莫拉向后仰起身子哀嚎起来！地面震动，冰霜侵袭你的身体，像毒牙一样咬进你的肉里。虚弱感袭来，");
         if(_loc1_)
         {
            outputText("并且 " + (get_player().get_armor() == get_armors().GOOARMR ? "瓦莱丽娅" : "你的[armor]") + " 痛苦地颤抖着，");
         }
         outputText("但你恢复了镇定，继续战斗。");
      }
      
      override public function handleCombatLossText(param1:Boolean, param2:int) : int
      {
         if(param1)
         {
            return int(super.handleCombatLossText(param1,param2));
         }
         outputText("[pg]八小时后你在剧痛中醒来。莫拉已经不见踪影。你爬起来，匆匆赶回家");
         if(get_player().get_gems() > 1)
         {
            outputText("，丢失了 " + param2 + " 颗宝石。");
         }
         else if(get_player().get_gems() == 1)
         {
            outputText("，丢失了你唯一的一颗宝石。");
         }
         else
         {
            outputText("。");
         }
         return 8;
      }
      
      override public function getEvasionChance() : Number
      {
         if(get_lust() >= 50)
         {
            return 0;
         }
         return Number(super.getEvasionChance());
      }
      
      override public function eOneAttack() : int
      {
         var _loc1_:int = int(super.eOneAttack());
         if(_loc1_ > 0)
         {
            if(Utils.trueOnceInN(2))
            {
               get_player().bleed(this,Utils.randBetween(1,4),Utils.randBetween(1,2));
            }
            afflictFrostbite();
         }
         return _loc1_;
      }
      
      override public function defeated(param1:Boolean) : void
      {
         get_game().glacialRift.moraScene.moraWinChoices(param1);
      }
      
      public function debuffStat(param1:String) : void
      {
         var _loc2_:int = get_player().getStatByString(param1) - getStatByString(param1);
         var _loc3_:Number = (100 - get_player().get_lust()) / 100;
         var _loc4_:int = int(Math.floor(_loc2_ * _loc3_));
         if(_loc4_ > 0)
         {
            get_player().addCombatBuff(param1,-_loc4_);
         }
      }
      
      public function afflictFrostbite() : FrostbiteDebuff
      {
         var _loc1_:FrostbiteDebuff = get_player().createOrFindStatusEffect(StatusEffects.Frostbite);
         if(Utils.randomChance(50))
         {
            _loc1_.increase();
         }
         return _loc1_;
      }
   }
}

