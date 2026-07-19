package classes.scenes.npcs
{
   import classes.Appearance;
   import classes.CoC;
   import classes.Creature;
   import classes.Player;
   import classes.ReactionContext;
   import classes.StatusEffects;
   import classes._FlagDict.FlagDict_Impl_;
   import classes.internals.MonsterAI;
   import classes.internals.Utils;
   import classes.scenes.areas.lake.GooGirl;
   import classes.scenes.combat.AvoidDamageParameters;
   import classes.scenes.combat.CombatRange;
   import flash.Boot;
   import haxe.IMap;
   
   public class GooArmor extends GooGirl
   {
      
      public function GooArmor()
      {
         if(Boot.skip_constructor)
         {
            return;
         }
         super(true);
         set_a("");
         set_short("Goo Armor");
         if(FlagDict_Impl_.arrayReadInt(get_flags(),484) > 0)
         {
            set_a("");
            set_short("Valeria");
         }
         imageName = "gooarmor";
         set_long("站在你面前的是一套装满亮蓝色黏液的板甲，大约有六英尺高。她有一张美丽而充满女性魅力的脸庞，站在你面前时皱着眉头的样子甚至有些可爱。她用自己的黏液凝聚成了一把巨大的双手剑，并摆出了训练有素的战士姿态。");
         set_race("Goo-Girl");
         createVagina(false,5,4);
         createBreastRow(Appearance.breastCupInverse("C"));
         ass.analLooseness = 4;
         ass.analWetness = 5;
         set_tallness(Utils.rand(8) + 70);
         hips.rating = 8;
         butt.rating = 8;
         skin.tone = "blue";
         skin.setType(3);
         skin.adj = "goopey";
         hair.color = "black";
         hair.length = 15;
         hair.type = 3;
         initStrTouSpeInte(60,50,50,40);
         initLibSensCor(60,35,50);
         set_weaponName("goo sword");
         set_weaponVerb("slash");
         set_weaponAttack(60);
         set_armorName("armor");
         set_armorDef(50);
         bonusHP = 500;
         lustVuln = 0.35;
         temperment = 3;
         level = 16;
         set_gems(Utils.rand(25) + 40);
         set_drop(NO_DROP);
         checkMonster();
      }
      
      override public function won(param1:Boolean, param2:Boolean = false) : void
      {
         if(param2)
         {
            outputText("[pg]穿装甲的黏液女孩叹了口气，而你却筋疲力尽……");
            doNext(get_game().combat.endLustLoss);
         }
         else if(hasStatusEffect(StatusEffects.Spar))
         {
            get_game().valeria.pcWinsValeriaSparDefeat();
         }
         else
         {
            get_game().dungeons.heltower.gooArmorBeatsUpPC();
         }
      }
      
      public function struggleAtGooBind() : void
      {
         clearOutput();
         if(Utils.rand(10) > 0 && get_player().get_str() / 5 + Utils.rand(20) < 23)
         {
            outputText("你试图挣脱黏液的抓取，但你每扯下一点黏液，似乎就会被两倍的黏液所取代！");
            get_player().addStatusValue(StatusEffects.GooArmorBind,1,1);
            if(get_player().statusEffectv1(StatusEffects.GooArmorBind) >= 5)
            {
               if(hasStatusEffect(StatusEffects.Spar))
               {
                  get_game().valeria.pcWinsValeriaSparDefeat();
               }
               else
               {
                  get_game().dungeons.heltower.gooArmorBeatsUpPC();
               }
               return;
            }
         }
         else
         {
            outputText("你终于把黏液从你身上扯下来，并在黏液女孩重新附着在你身上之前潜出了她的触及范围。她撅着嘴，重新填满了她的盔甲，并重新摆出了战斗姿态。");
            get_player().removeStatusEffect(StatusEffects.GooArmorBind);
         }
         tookAction = true;
      }
      
      override public function react(param1:ReactionContext) : Boolean
      {
         if(param1.index == 3)
         {
            if(get_player().hasStatusEffect(StatusEffects.GooArmorBind))
            {
               clearOutput();
               outputText("突然，黏液女孩从她厚重的装甲中漏出了一半，向你扑来。你试图躲避她的攻击，但她并没有试图打你——相反，她缠住了你，把你的手臂固定在胸前。越来越多的黏液附着在你身上——你必须战斗才能摆脱这个。");
               get_player().addStatusValue(StatusEffects.GooArmorBind,1,1);
               if(get_player().statusEffectv1(StatusEffects.GooArmorBind) >= 5)
               {
                  get_player().set_lust(get_player().maxLust());
                  if(hasStatusEffect(StatusEffects.Spar))
                  {
                     get_game().valeria.pcWinsValeriaSparDefeat();
                  }
                  else
                  {
                     get_game().dungeons.heltower.gooArmorBeatsUpPC();
                  }
               }
               tookAction = true;
               return false;
            }
         }
         return true;
      }
      
      override public function performCombatAction() : void
      {
         gooArmorAI();
      }
      
      public function gooSilenceAttack() : void
      {
         outputText("黏液女孩把一只手从她的大剑上拿开，把她的左手腕射向你。你退缩了，因为一点黏液拍在你的嘴上，阻止你说话——看来在你把它扯下来之前，你被沉默了！");
         get_player().createStatusEffect(StatusEffects.GooArmorSilence,0,0,0,0);
      }
      
      public function gooArmorAttackTwoGooConsume() : void
      {
         outputText("突然，黏液女孩从她厚重的装甲中漏出了一半，向你扑来。你试图躲避她的攻击，但她并没有试图打你——相反，她缠住了你，把你的手臂固定在胸前。越来越多的黏液附着在你身上——你必须战斗才能摆脱这个。");
         get_player().createStatusEffect(StatusEffects.GooArmorBind,0,0,0,0);
      }
      
      public function gooArmorAttackPhysical() : void
      {
         var _loc2_:Number = NaN;
         var _loc1_:* = combatAvoidDamage(new AvoidDamageParameters(true,true,false,null,null,null,null,null));
         if(_loc1_.dodge == EVASION_EVADE)
         {
            outputText("史莱姆装甲向前冲去，挥舞着她的剑划出一道巨大的弧线，但你躲开了攻击！");
         }
         else if(_loc1_.dodge == EVASION_FLEXIBILITY)
         {
            outputText("史莱姆装甲向你挥舞着一把大剑，划出一道巨大的弧线，但你猫娘般的灵活性让你轻松地扭身躲开。");
         }
         else if(_loc1_.dodge == EVASION_MISDIRECTION)
         {
            outputText("史莱姆装甲向你挥舞着一把剑，划出一道巨大的弧线，但你与拉斐尔的训练让你误导她打偏了！");
         }
         else if(_loc1_.dodge == EVASION_SPEED || _loc1_.dodge != null)
         {
            outputText("史莱姆装甲向前冲去，挥舞着她的剑划出一道巨大的弧线，但你躲开了！");
         }
         else if(Boolean(_loc1_.parry))
         {
            outputText("史莱姆装甲向前冲去，挥舞着她的剑划出一道巨大的弧线，但你格挡住了！");
         }
         else
         {
            outputText("史莱姆装甲向前冲去，挥舞着她的剑划出一道巨大的弧线。你不够快，无法躲避她的攻击，黏糊糊的剑猛地击中你，把你击退，留下了一道难看的伤痕。");
            _loc2_ = get_player().reduceDamage(get_str() + get_weaponAttack(),this);
            if(_loc2_ <= 0)
            {
               _loc2_ = 1;
            }
            get_player().takeDamage(_loc2_,true);
         }
      }
      
      public function gooArmorAI() : void
      {
         var _loc1_:MonsterAI = new MonsterAI();
         _loc1_.add(gooSilenceAttack,0.5,!get_player().hasStatusEffect(StatusEffects.GooArmorSilence),10,FATIGUE_PHYSICAL,CombatRange.Ranged);
         _loc1_.add(gooArmorAttackPhysical,1,true,0,FATIGUE_NONE,CombatRange.Melee);
         _loc1_.add(gooArmorAttackTwoGooConsume,0.75,true,10,FATIGUE_PHYSICAL,CombatRange.ChargingMelee);
         _loc1_.exec();
      }
      
      override public function defeated(param1:Boolean) : void
      {
         if(hasStatusEffect(StatusEffects.Spar))
         {
            get_game().valeria.pcWinsValeriaSpar();
         }
         else
         {
            get_game().dungeons.heltower.beatUpGooArmor();
         }
      }
   }
}

