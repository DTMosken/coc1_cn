package classes.scenes.dungeons.manor
{
   import classes.Appearance;
   import classes.CoC;
   import classes.Creature;
   import classes.Monster;
   import classes.PerkLib;
   import classes.Player;
   import classes.StatusEffects;
   import classes.internals.MonsterAI;
   import classes.internals.Utils;
   import classes.internals.WeightedChoice;
   import classes.items.Weapon;
   import classes.scenes.combat.AvoidDamageParameters;
   import classes.scenes.combat.CombatRange;
   import flash.Boot;
   
   public class BoneJester extends Monster
   {
      
      public var prevHP:Number;
      
      public var hidden:Boolean;
      
      public function BoneJester(param1:Boolean = false)
      {
         if(Boot.skip_constructor)
         {
            return;
         }
         prevHP = 0;
         hidden = false;
         super();
         if(param1)
         {
            return;
         }
         set_a("");
         set_short("Bone Jester");
         imageName = "";
         set_long("站在你面前的是一具佝偻的骷髅，穿着破烂的小丑服。它挥舞着一对锯齿状的弯曲匕首，尽管磨损明显，但看起来依然锋利致命。这具骷髅快速地抽搐和颤抖着，无法静止站立。");
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
         set_weaponAttack(60);
         initStrTouSpeInte(60,40,100,42);
         initLibSensCor(45,45,100);
         bonusHP = 1000;
         set_armorDef(0);
         set_weaponName("jagged daggers");
         set_weaponVerb("slash");
         set_armorName("Jester\'s Garb");
         set_lust(0);
         temperment = 2;
         set_drop(new WeightedChoice());
         level = 20;
         set_gems(Utils.rand(5) + 100);
         lustVuln = 0;
         createPerk(PerkLib.BleedImmune,0,0,0,0);
         createPerk(PerkLib.PoisonImmune,0,0,0,0);
         checkMonster();
      }
      
      override public function won(param1:Boolean, param2:Boolean = false) : void
      {
         get_game().dungeons.manor.loseToJester();
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
               outputText("你的" + param1.get_attackNoun() + "无害地从" + get_themonster() + "身上弹开了。");
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
               outputText(get_Themonster() + "在你强力的" + param1.get_attackNoun() + "下裂开了！");
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
         if(prevHP > get_HP())
         {
            hidden = false;
         }
         prevHP = get_HP();
         if(hidden)
         {
            hideInShadows();
            return;
         }
         var _loc1_:MonsterAI = new MonsterAI();
         _loc1_.add(eAttack,2,true,0,FATIGUE_NONE,CombatRange.Melee);
         _loc1_.add(hideInShadows,1,true,0,FATIGUE_NONE,CombatRange.Self);
         _loc1_.add(harvest,1,true,12,FATIGUE_PHYSICAL,CombatRange.ChargingMelee);
         _loc1_.exec();
      }
      
      public function hideInShadows() : void
      {
         var _loc1_:int = 0;
         if(!hidden)
         {
            outputText("小丑开始移出你的视线，进入黑暗之中。");
            hidden = true;
         }
         else
         {
            outputText("小丑从阴影中跳出，出现在你身后，并给出了毁灭性的背刺！");
            hidden = false;
            _loc1_ = get_player().reduceDamage(250 + Utils.rand(100),this);
            get_player().takeDamage(_loc1_,true);
         }
      }
      
      public function harvest() : void
      {
         var _loc2_:int = 0;
         outputText("小丑以不可思议的速度向你扑来，试图将他那锯齿状的匕首深深刺入你的动脉！");
         var _loc1_:* = combatAvoidDamage(new AvoidDamageParameters(true,false,false,null,null,null,null,null));
         if(_loc1_.dodge == EVASION_EVADE)
         {
            outputText("你避开了刺击，骷髅跳回了安全距离。");
            return;
         }
         if(_loc1_.dodge == EVASION_FLEXIBILITY)
         {
            outputText("你扭动身体，险之又险地避开了刺击！骷髅迅速跳回安全距离。");
            return;
         }
         if(_loc1_.dodge == EVASION_MISDIRECTION)
         {
            outputText("然而，骷髅被你熟练的误导所欺骗，刺偏了！");
            return;
         }
         if(_loc1_.dodge == EVASION_SPEED || _loc1_.dodge != null)
         {
            outputText("你及时闪开，骷髅的刺击落空了！");
            return;
         }
         if(get_player().bleed(this))
         {
            outputText("你还没来得及反应，他的武器就刺入了你的要害！刀刃撕裂血肉，刺穿动脉，导致你血流如注！");
         }
         else
         {
            outputText("你还没来得及反应，他的武器就刺入了你的要害！谢天谢地，你对流血的免疫力防止了这次攻击对你造成太大的伤害。");
         }
         _loc2_ = get_player().reduceDamage(25 + Utils.rand(30),this);
         get_player().takeDamage(_loc2_,true);
      }
      
      override public function handleFear() : Boolean
      {
         outputText("骷髅似乎对你展示的幻象恐惧无动于衷。它像往常一样继续攻击！");
         removeStatusEffect(StatusEffects.Fear);
         return true;
      }
      
      override public function defeated(param1:Boolean) : void
      {
         get_game().dungeons.manor.defeatJester();
      }
   }
}

