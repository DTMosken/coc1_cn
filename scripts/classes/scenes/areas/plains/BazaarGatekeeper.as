package classes.scenes.areas.plains
{
   import classes.Appearance;
   import classes.CoC;
   import classes.CockTypesEnum;
   import classes.Creature;
   import classes.Monster;
   import classes.Player;
   import classes.StatusEffects;
   import classes._FlagDict.FlagDict_Impl_;
   import classes.internals.MonsterAI;
   import classes.internals.Utils;
   import classes.internals.WeightedChoice;
   import classes.items.WeaponLib;
   import classes.scenes.combat.AvoidDamageParameters;
   import classes.scenes.combat.Combat;
   import classes.scenes.combat.CombatRange;
   import flash.Boot;
   import haxe.IMap;
   
   public class BazaarGatekeeper extends Monster
   {
      
      public function BazaarGatekeeper()
      {
         if(Boot.skip_constructor)
         {
            return;
         }
         super();
         set_a("");
         set_short("guard");
         imageName = "bazaarguard";
         set_long("这个守卫着奇特集市入口的深红色皮肤恶魔变形者有十英尺高。他有着红色的皮肤，头上戴着几乎是天蓝色的头巾。他的眼睛是纯黑色的。他穿着一件简单的束腰外衣和宽松的裤子。他挥舞着一对弯刀。");
         set_race("Demon-Morph");
         createCock(8,1.5,CockTypesEnum.DEMON);
         createBreastRow(Appearance.breastCupInverse("flat"));
         ass.analLooseness = 1;
         ass.analWetness = 0;
         set_tallness(120);
         hips.rating = 2;
         butt.rating = 0;
         skin.tone = "crimson";
         skin.setType(0);
         hair.color = "black";
         hair.length = 8;
         initStrTouSpeInte(100,100,80,70);
         initLibSensCor(15,10,55);
         set_weaponName("dual scimitars");
         set_weaponVerb("slash");
         set_weaponAttack(16);
         set_weaponPerk([]);
         set_weaponValue(25);
         set_armorName("tunic and pants");
         set_armorDef(0);
         bonusHP = 1750;
         set_lust(0);
         lustVuln = 0.15;
         temperment = 2;
         level = 30;
         additionalXP = 300;
         set_drop(new WeightedChoice().add(get_weapons().SCIMITR,1));
         set_gems(250);
         checkMonster();
      }
      
      override public function won(param1:Boolean, param2:Boolean = false) : void
      {
         var _g:Combat;
         clearOutput();
         if(param1)
         {
            outputText("你倒下了，虚弱得无法继续战斗。你浑身是伤。世界陷入了黑暗。当你醒来时，你发现自己身处平原上的一个随机地点。你只好动身返回营地。");
         }
         else
         {
            outputText("你因无法抑制的欲望而倒下，失去了意识。当你醒来时，你发现自己身处平原上的一个随机地点。你只好动身返回营地。");
         }
         _g = get_game().combat;
         doNext(function():void
         {
            _g.cleanupAfterCombat();
         });
      }
      
      public function scimitarSpecial() : void
      {
         if(Utils.rand(3) == 0)
         {
            scimitarCrossAttack();
         }
         else
         {
            scimitarAttack();
         }
      }
      
      public function scimitarCrossAttack() : void
      {
         var _loc1_:int = 0;
         if(!hasStatusEffect(StatusEffects.Uber))
         {
            outputText("守门人举起了他的弯刀！从他握刀的姿势来看，<b>他要对你进行十字斩！</b>");
            createStatusEffect(StatusEffects.Uber,0,0,0,0);
            return;
         }
         if(FlagDict_Impl_.arrayReadInt(get_flags(),22) > 0)
         {
            outputText("守门人挥舞弯刀向你砍来！多亏你早有准备，在千钧一发之际躲开了他的攻击。");
         }
         else if(hasStatusEffect(StatusEffects.Blind) && Utils.rand(3) > 0)
         {
            outputText("失明的守门人胡乱挥舞着弯刀，完全没有砍中你！");
         }
         else
         {
            outputText("守门人向你冲来，残忍地砍向你，在你的肉体上刻下了一道巨大的“X”形伤口。你痛苦地呻吟着，向后倒去，踉跄不稳！");
            _loc1_ = int(get_str() + get_weaponAttack() + 250);
            _loc1_ = get_player().reduceDamage(_loc1_,this);
            get_player().takeDamage(_loc1_,true);
         }
         removeStatusEffect(StatusEffects.Uber);
      }
      
      public function scimitarAttack() : void
      {
         var _loc2_:int = 0;
         outputText("守门人举起他的弯刀");
         if(hasStatusEffect(StatusEffects.Blind) && Utils.rand(3) > 0)
         {
            outputText("盲目地挥舞着弯刀，完全没有砍中你！");
            return;
         }
         outputText("向你砍来。你试图闪避");
         var _loc1_:* = combatAvoidDamage(new AvoidDamageParameters(true,true,false,null,null,null,null,null));
         if(_loc1_.dodge == EVASION_EVADE || _loc1_.dodge == EVASION_MISDIRECTION)
         {
            outputText("凭借你卓越的闪避能力，你成功躲开了他的弯刀！");
         }
         else if(_loc1_.dodge == EVASION_FLEXIBILITY)
         {
            outputText("你利用惊人的柔韧性勉强折叠身体，避开了他的攻击！");
         }
         else if(_loc1_.dodge == EVASION_SPEED || _loc1_.dodge != null)
         {
            outputText("你成功躲开了他的弯刀！");
         }
         else if(Boolean(_loc1_.parry))
         {
            outputText("你成功格挡了他的弯刀！");
         }
         else
         {
            outputText("但你还是被击中了！");
            _loc2_ = int(get_str() + get_weaponAttack() + 100);
            _loc2_ = get_player().reduceDamage(_loc2_,this);
            get_player().takeDamage(_loc2_,true);
         }
      }
      
      override public function performCombatAction() : void
      {
         if(hasStatusEffect(StatusEffects.Uber))
         {
            scimitarCrossAttack();
            return;
         }
         var _loc1_:MonsterAI = new MonsterAI();
         _loc1_.add(eAttack,1,true,0,FATIGUE_NONE,CombatRange.Melee);
         _loc1_.add(scimitarSpecial,1,true,15,FATIGUE_NONE,CombatRange.Omni);
         _loc1_.exec();
      }
      
      override public function defeated(param1:Boolean) : void
      {
         get_game().bazaar.winAgainstGuard();
      }
   }
}

