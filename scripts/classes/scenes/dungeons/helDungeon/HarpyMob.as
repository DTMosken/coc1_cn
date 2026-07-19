package classes.scenes.dungeons.helDungeon
{
   import classes.Appearance;
   import classes.CoC;
   import classes.Monster;
   import classes.PerkLib;
   import classes.Player;
   import classes.ReactionContext;
   import classes.StatusEffects;
   import classes.internals.MonsterAI;
   import classes.internals.Utils;
   import classes.scenes.combat.CombatRange;
   import flash.Boot;
   
   public class HarpyMob extends Monster
   {
      
      public function HarpyMob()
      {
         if(Boot.skip_constructor)
         {
            return;
         }
         super();
         set_a("");
         set_short("harpy horde");
         imageName = "harpymob";
         set_long("你被一群特别高大强壮的鹰身女妖包围了，总共大概有十几只。她们都穿着简单的棕色罩衫，在山里能起到很好的伪装作用，并用她们那如猛禽般的利爪作为武器对付你。虽然单打独斗对你这样实力的勇者来说算不上什么大威胁，但一整群加起来……那可就完全是另一回事了。");
         set_race("Harpies");
         set_plural(true);
         pronoun1 = "她们";
         pronoun2 = "她们";
         pronoun3 = "她们的";
         createVagina(false,5,4);
         createBreastRow(Appearance.breastCupInverse("B"));
         ass.analLooseness = 4;
         ass.analWetness = 5;
         set_tallness(Utils.rand(8) + 70);
         hips.rating = 12;
         butt.rating = 8;
         lowerBody.type = 13;
         skin.tone = "red";
         skin.type = 0;
         skin.desc = "feathers";
         hair.color = "black";
         hair.length = 15;
         initStrTouSpeInte(50,50,120,40);
         initLibSensCor(60,45,50);
         set_weaponName("claw");
         set_weaponVerb("claw");
         set_weaponAttack(10);
         set_armorName("armor");
         set_armorDef(20);
         bonusHP = 1000;
         set_lust(20);
         lustVuln = 0.2;
         temperment = 3;
         level = 18;
         set_gems(Utils.rand(25) + 140);
         additionalXP = 50;
         tail.type = 11;
         set_drop(NO_DROP);
         checkMonster();
      }
      
      override public function won(param1:Boolean, param2:Boolean = false) : void
      {
         get_game().dungeons.heltower.pcLosesToHarpyHorde();
      }
      
      override public function react(param1:ReactionContext) : Boolean
      {
         var _loc2_:Number = NaN;
         if(param1.index == 3)
         {
            if(get_player().hasStatusEffect(StatusEffects.HarpyBind))
            {
               clearOutput();
               outputText("这群鹰身女妖继续对毫无防备的你进行猛烈攻击。");
               _loc2_ = 80 + Utils.rand(40);
               _loc2_ = get_game().combat.takeDamage(_loc2_,true);
               tookAction = true;
               return false;
            }
         }
         return true;
      }
      
      override public function performCombatAction() : void
      {
         harpyHordeAI();
      }
      
      public function harpyHordeLustAttack() : void
      {
         var _loc1_:int = 10;
         outputText("鹰身女妖们退后了片刻，给了你喘息的空间——却开始了一场迷你脱衣舞，扯下部分衣物，露出她们丰满的臀部和胯部，或是展现她们小巧挺拔的乳房。她们抚摸着自己和彼此，发出淫荡的呻吟。被这场滑稽戏分心的你，直到为时已晚才注意到一只涂着口红的鹰身女妖靠近！她直接在你的嘴唇上印下一个吻，");
         if(get_player().hasPerk(PerkLib.LuststickAdapted))
         {
            outputText("多亏了你的适应能力，这几乎没有造成什么影响");
         }
         else
         {
            outputText("让一阵阵情欲的战栗顺着你的脊背蔓延");
            _loc1_ += 5;
            if(get_player().hasCock())
            {
               _loc1_ += 15;
            }
         }
         outputText("。");
         get_player().takeLustDamage(_loc1_,true);
      }
      
      public function harpyHordeGangBangStruggle(param1:Boolean = true) : void
      {
         var _loc2_:Number = NaN;
         if(param1)
         {
            clearOutput();
         }
         if(Utils.rand(10) > 0 && get_player().get_str() / 5 + Utils.rand(20) < 23)
         {
            _loc2_ = 80 + Utils.rand(40);
            outputText("你在鹰身女妖的抓握中挣扎，但无法完全挣脱。这群鹰身女妖继续对毫无防备的你进行猛烈攻击。");
            get_player().takeDamage(_loc2_,true);
         }
         else
         {
            get_player().removeStatusEffect(StatusEffects.HarpyBind);
            outputText("伴随着一声震耳欲聋的咆哮，你甩开了抓住你的鹰身女妖，重新投入战斗！");
         }
         tookAction = true;
      }
      
      public function harpyHordeGangBangAttack() : void
      {
         outputText("突然，两只鹰身女妖从背后抓住你，按住你的手臂让你无法反击！趁你门户大开，其他鹰身女妖扑向你，用拳脚猛击你的胸膛——只有一只没有参与这场群殴。[pg]");
         get_player().createStatusEffect(StatusEffects.HarpyBind,0,0,0,0);
         harpyHordeGangBangStruggle(false);
      }
      
      public function harpyHordeClawFlurry() : void
      {
         outputText("鹰身女妖们向你扑来，爪子如暴风雨般落在你周围。你踉跄后退，拼命试图挡开一些攻击，但数量实在太多，根本无法全部挡下！似乎只有一只鹰身女妖在保留实力……\n");
         createStatusEffect(StatusEffects.Attacks,3 + Utils.rand(3),0,0,0);
         eAttack();
      }
      
      public function harpyHordeAI() : void
      {
         var _loc1_:MonsterAI = new MonsterAI();
         _loc1_.add(harpyHordeLustAttack,0.25,true,0,0,CombatRange.Omni);
         _loc1_.add(harpyHordeGangBangAttack,0.25,true,0,0,CombatRange.Omni);
         _loc1_.add(harpyHordeClawFlurry,0.5,true,0,0,CombatRange.Omni);
         _loc1_.exec();
      }
      
      override public function defeated(param1:Boolean) : void
      {
         get_game().dungeons.heltower.pcDefeatsHarpyHorde();
      }
   }
}

