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
   
   public class BoneCourtier extends Monster
   {
      
      public function BoneCourtier(param1:Boolean = false)
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
         set_short("Bone Sorcerer");
         set_long("站在你面前的是一具人类骷髅，穿着破烂的贵族服饰，戴着一顶华丽的帽子。虽然它已经饱受岁月的摧残，但你可以猜到这个人类在活着的时候是相当受人尊敬的。它拿着一个变黑的铜高脚杯和一卷写满难以辨认的符文的卷轴。");
         set_initedGenitals(true);
         pronoun1 = "它";
         pronoun2 = "它";
         pronoun3 = "它的";
         createBreastRow(Appearance.breastCupInverse("E"));
         ass.analLooseness = 1;
         ass.analWetness = 0;
         set_tallness(65);
         hips.rating = 8;
         butt.rating = 8;
         skin.tone = "dark green";
         hair.color = "purple";
         hair.length = 4;
         bonusHP = 1000;
         initStrTouSpeInte(12,0,35,42);
         initLibSensCor(45,45,100);
         set_weaponName("fists");
         set_weaponVerb("tiny punch");
         set_armorName("leather straps");
         set_lust(0);
         temperment = 2;
         set_drop(new WeightedChoice());
         level = 17;
         set_gems(Utils.rand(5) + 5);
         lustVuln = 0;
         createPerk(PerkLib.BleedImmune,0,0,0,0);
         createPerk(PerkLib.PoisonImmune,0,0,0,0);
         checkMonster();
      }
      
      override public function won(param1:Boolean, param2:Boolean = false) : void
      {
         get_game().dungeons.manor.loseToCourtier();
      }
      
      public function temptingGoblet() : void
      {
         var _loc2_:Number = NaN;
         outputText("白骨巫师将拿着高脚杯的手臂向后一缩，然后猛地向前一挥，将里面的一些未知液体泼向你！");
         var _loc1_:* = combatAvoidDamage(new AvoidDamageParameters(true,false,false,null,null,null,null,null));
         if(_loc1_.dodge == EVASION_EVADE)
         {
            outputText("\n你及时翻滚，躲开了那团物质。");
         }
         else if(_loc1_.dodge == EVASION_MISDIRECTION)
         {
            outputText("\n你设法用快速的移动将廷臣的投掷引离了你的真实位置。");
         }
         else if(_loc1_.dodge == EVASION_FLEXIBILITY)
         {
            outputText("\n你扭身躲开，充分利用你猫一般的反应速度避开了那奇怪的物质。");
         }
         else if(_loc1_.dodge == EVASION_SPEED || _loc1_.dodge != null)
         {
            outputText("\n你的速度足够快，拉开了与液体的距离，避开了攻击。");
         }
         else
         {
            outputText("\n液体击中了你，腐蚀了你的皮肤，引起了巨大的疼痛。在最初的打击之后，尽管你的处境严峻，你却感到身体发热并兴奋起来。为什么一个复活的骷髅会喝这种东西？");
            _loc2_ = 20 + Utils.rand(50);
            _loc2_ = get_player().reduceDamage(_loc2_,this);
            get_player().takeDamage(_loc2_,true);
            _loc2_ = 20 + get_player().lib / 10;
            get_player().takeLustDamage(_loc2_);
         }
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
               outputText("你擦过" + get_themonster() + "打出了一击！");
            }
            else if(_loc5_)
            {
               outputText("你" + param1.get_attackVerb() + "" + get_themonster() + "，打得" + pronoun2 + "碎片横飞！");
            }
            else if(_loc6_)
            {
               outputText(get_Themonster() + "在你强力的" + param1.get_attackNoun() + "下碎裂了！");
            }
            else
            {
               outputText("你用你强大的" + param1.get_attackNoun() + "[b:粉碎]了" + get_themonster() + "！");
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
         _loc1_.add(temptingGoblet,3,true,0,FATIGUE_NONE,CombatRange.Ranged);
         _loc1_.add(heal,1,true,15,FATIGUE_MAGICAL_HEAL,CombatRange.Self);
         _loc1_.add(mark,1,!get_player().hasStatusEffect(StatusEffects.Marked),10,FATIGUE_MAGICAL,CombatRange.Ranged);
         _loc1_.exec();
      }
      
      public function mark() : void
      {
         outputText("白骨巫师读着他破烂的羊皮纸，然后指着你！你很难理解，但你感到自己运气不佳，仿佛你的敌人能轻易找到你盔甲上的破绽。你被<b>施加了妖术</b>！");
         get_player().createStatusEffect(StatusEffects.Marked,2,0,0,0);
      }
      
      public function heal() : void
      {
         var _loc1_:Number = 0.25;
         outputText("白骨巫师用一种未知的语言说着什么，编织着一个奥术法术！");
         var _loc2_:Array = [];
         if(int(get_game().monsterArray.length) == 1)
         {
            _loc1_ *= get_HP();
            addHP(_loc1_);
            outputText("\n白骨巫师被治愈了！<b>(<font color=\"" + get_game().mainViewManager.colorHpPlus() + "\">" + Math.round(_loc1_) + "</font>)</b>");
            return;
         }
         var _loc3_:int = 0;
         while(_loc3_ < int(get_game().monsterArray.length))
         {
            if(get_game().monsterArray[_loc3_] is Necromancer && get_game().monsterArray[_loc3_].get_HP() > 0)
            {
               _loc1_ *= get_game().monsterArray[_loc3_].get_HP();
               get_game().monsterArray[_loc3_].addHP(_loc1_);
               outputText("\n" + get_game().monsterArray[_loc3_].get_capitalA() + Utils.cnName(get_game().monsterArray[_loc3_].get_short()) + "被治愈了！<b>(<font color=\"" + get_game().mainViewManager.colorHpPlus() + "\">" + Math.round(_loc1_) + "</font>)</b>");
               return;
            }
            if(get_game().monsterArray[_loc3_].get_HP() > 0)
            {
               _loc2_.push(_loc3_);
            }
            _loc3_++;
         }
         var _loc4_:Array = _loc2_;
         var _loc5_:int = int(_loc4_[Utils.rand(int(_loc4_.length))]);
         _loc1_ *= get_game().monsterArray[_loc5_].get_HP();
         get_game().monsterArray[_loc5_].addHP(_loc1_);
         outputText("\n" + get_game().monsterArray[_loc5_].get_capitalA() + get_game().monsterArray[_loc5_].get_short() + "被治愈了！<b>(<font color=\"" + get_game().mainViewManager.colorHpPlus() + "\">" + Math.round(_loc1_) + "</font>)</b>");
      }
      
      override public function handleFear() : Boolean
      {
         outputText("骷髅似乎对你展示的幻象恐惧无动于衷。它像往常一样继续攻击！[pg]");
         removeStatusEffect(StatusEffects.Fear);
         return true;
      }
      
      override public function defeated(param1:Boolean) : void
      {
         get_game().dungeons.manor.defeatCourtier();
      }
   }
}

