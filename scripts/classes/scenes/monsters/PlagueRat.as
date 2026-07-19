package classes.scenes.monsters
{
   import classes.CoC;
   import classes.CockTypesEnum;
   import classes.Creature;
   import classes.Monster;
   import classes.Player;
   import classes.StatusEffects;
   import classes.internals.MonsterAI;
   import classes.internals.Utils;
   import classes.internals.WeightedChoice;
   import classes.items.ConsumableLib;
   import classes.items.Shield;
   import classes.items.shields.DragonShellShield;
   import classes.scenes.combat.AvoidDamageParameters;
   import classes.scenes.combat.CombatRange;
   import flash.Boot;
   
   public class PlagueRat extends Monster
   {
      
      public function PlagueRat()
      {
         if(Boot.skip_constructor)
         {
            return;
         }
         super();
         set_a("");
         set_short("plague rat");
         imageName = "plaguerat";
         set_long("这只被腐化的啮齿动物站起来大约有微不足道的[if (metric) {150厘米|5英尺}]高[if (tallness < 60) {，尽管与你相比，他仍然足够大，让你保持警惕}]。他穿着破烂肮脏的碎布，皮肤粗糙，看起来长满了疣，就像鳄鱼的鳞状皮。他的肉体上零星地，背部密集地长着一簇簇酒红色的皮毛。他的头骨上突出两根象牙色的角，他那主要像老鼠一样的尾巴末端呈缺口的箭头形状。虽然他那沾满污渍的爪子值得注意，但他那腐败且充满细菌的嘴里长着的厚实牙齿构成了更大的危险。");
         set_race("rat-demon");
         createCock(Utils.rand(2) + 5,1.5,CockTypesEnum.DEMON);
         balls = 2;
         ballSize = 1;
         cumMultiplier = 3;
         set_hoursSinceCum(20);
         createBreastRow(0);
         pronoun1 = "他";
         pronoun2 = "他";
         pronoun3 = "他的";
         ass.analLooseness = 4;
         ass.analWetness = 1;
         set_tallness(Utils.rand(6) + 57);
         hips.rating = 0;
         butt.rating = 2;
         horns.type = 1;
         horns.value = 2;
         face.type = 16;
         skin.type = 1;
         skin.adj = "patchy";
         skin.furColor = "酒红色的";
         skin.desc = "fur";
         skin.tone = "red";
         initStrTouSpeInte(65,30,80,20);
         initLibSensCor(55,35,100);
         set_weaponName("claw");
         set_weaponVerb("swipe");
         set_weaponAttack(10);
         set_armorName("leathery skin");
         set_armorDef(5);
         bonusHP = 100;
         set_lust(30);
         lustVuln = 0.65;
         temperment = 1;
         level = 7;
         set_gems(Utils.rand(15) + 25);
         set_drop(new WeightedChoice().add(get_consumables().MOUSECO,3).add(get_consumables().INCUBID,1));
         checkMonster();
      }
      
      override public function won(param1:Boolean, param2:Boolean = false) : void
      {
         get_game().plagueRatScene.plagueVictory();
      }
      
      public function swipeAttack() : void
      {
         var _loc1_:Number = get_player().reduceDamage(get_str() + get_weaponAttack() + 10,this);
         var _loc2_:Boolean = false;
         switch(Utils.rand(3))
         {
            case 0:
               outputText("老鼠向你扑来，");
               if(Boolean(combatAvoidDamage(new AvoidDamageParameters(true,true,true,null,null,null,null,null)).attackHit))
               {
                  outputText("用它的爪子撕裂了接触到的一切。");
                  _loc2_ = true;
               }
               else
               {
                  outputText("它那毫无章法的挥击险些击中你。");
               }
               break;
            case 1:
               outputText("这个鼠头鼠脑的白痴向你所在的位置扑来，你侧身躲开，它却用尾巴尖甩向你的脸。");
               if(Boolean(combatAvoidDamage(new AvoidDamageParameters(true,true,true,null,null,null,null,null)).attackHit))
               {
                  outputText("带刺的鞭子抽打在你身上，带来一阵极其剧烈的刺痛。");
                  _loc2_ = true;
               }
               else
               {
                  outputText("幸运的是，你的反应足够快，即使面对它的诡计也能应付自如。");
               }
               break;
            case 2:
               outputText("老鼠挥舞着爪子向前冲去，试图用凶猛的攻势压倒你。");
               if(Boolean(combatAvoidDamage(new AvoidDamageParameters(true,true,true,null,null,null,null,null)).attackHit))
               {
                  outputText("尽管它很笨拙，但这种攻击性足以让它击中几次。");
                  _loc2_ = true;
                  break;
               }
               outputText("尽管它很笨拙，但你能够毫不费力地应对这种攻击性。");
         }
         if(_loc2_)
         {
            get_player().takeDamage(_loc1_,true);
         }
      }
      
      public function spit() : void
      {
         outputText("伴随着嘶嘶声和作呕声，这只腐化的害兽向你吐出了一团腐臭的液体，");
         if(Boolean(combatAvoidDamage(new AvoidDamageParameters(true,false,false,null,null,null,null,null)).attackHit))
         {
            if(get_player().get_shield() is DragonShellShield && Utils.rand(2) == 0)
            {
               outputText("但你举起了龙壳盾，让那团粘液打在上面。没过多久，这有毒的物质就被完全吸收了。");
            }
            else
            {
               outputText("一接触到你的[skinshort]，就引起了一阵狂乱的刺痛。");
               if(!get_player().hasStatusEffect(StatusEffects.Poison))
               {
                  get_player().createStatusEffect(StatusEffects.Poison,0,1,0,0);
               }
            }
         }
         else
         {
            outputText("谢天谢地，它落在了离你很远的地方。");
         }
      }
      
      override public function performCombatAction() : void
      {
         var _loc1_:MonsterAI = new MonsterAI();
         _loc1_.add(swipeAttack,3,true,0,FATIGUE_NONE,CombatRange.Melee);
         _loc1_.add(spit,1,!get_player().hasStatusEffect(StatusEffects.Poison),10,FATIGUE_PHYSICAL,CombatRange.Ranged);
         _loc1_.add(gnash,1,true,25,FATIGUE_PHYSICAL,CombatRange.Melee);
         _loc1_.exec();
      }
      
      public function gnash() : void
      {
         var _loc1_:Number = NaN;
         outputText("你的对手尖叫着，四肢着地向你冲来，");
         if(Boolean(combatAvoidDamage(new AvoidDamageParameters(true,true,true,null,null,null,null,null)).attackHit))
         {
            outputText("他来回呈之字形移动，直到扑到你身上！他的牙齿不断地啃咬着你的身体，每一次攻击都带来灼烧和瘙痒感！");
            _loc1_ = get_player().reduceDamage(get_str() + get_weaponAttack() * 1.5,this);
            get_player().takeDamage(_loc1_,true);
            if(!get_player().hasStatusEffect(StatusEffects.Poison))
            {
               get_player().createStatusEffect(StatusEffects.Poison,0,1,0,0);
            }
            get_player().bleed(this);
         }
         else
         {
            outputText("你保持警惕，吸引着他的注意力。他向你扑来，但你反应迅速，让他没能咬中。");
         }
      }
      
      override public function defeated(param1:Boolean) : void
      {
         get_game().plagueRatScene.plagueDefeat(param1);
      }
   }
}

