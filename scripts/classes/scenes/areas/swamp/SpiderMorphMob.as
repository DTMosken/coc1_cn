package classes.scenes.areas.swamp
{
   import classes.CoC;
   import classes.CockTypesEnum;
   import classes.Creature;
   import classes.Monster;
   import classes.Player;
   import classes.StatusEffects;
   import classes.display.SpriteDb;
   import classes.internals.Utils;
   import classes.items.Armor;
   import classes.scenes.combat.AvoidDamageParameters;
   import flash.Boot;
   
   public class SpiderMorphMob extends Monster
   {
      
      public var missFirstRound:Boolean;
      
      public function SpiderMorphMob()
      {
         if(Boot.skip_constructor)
         {
            return;
         }
         missFirstRound = false;
         super();
         set_a("");
         set_short("mob of spiders-morphs");
         imageName = "spidermorphmob";
         set_long("你正在与一群蜘蛛人战斗！大约两打蜘蛛和蛛化精灵向你逼近，全都龇牙咧嘴。两只巨大强壮的蛛化精灵带领着队伍，它们堕落、充满欲望的凝视让你脊背发凉。虽然" + (get_player().level <= 13 ? "你绝不会独自面对这么庞大的怪物群" : "你也许能独自对付它们") + "，但在这场战斗中你有一个强大的盟友——母龙奇哈！");
         set_race("Spider-Morphs & Driders");
         set_plural(true);
         pronoun1 = "它们";
         pronoun2 = "它们";
         pronoun3 = "他们";
         createCock(9,2,CockTypesEnum.HUMAN);
         balls = 2;
         ballSize = 1;
         cumMultiplier = 3;
         createVagina(false,3,2);
         createBreastRow(0);
         ass.analLooseness = 4;
         ass.analWetness = 5;
         set_tallness(Utils.rand(8) + 70);
         hips.rating = 8;
         butt.rating = 8;
         skin.tone = "red";
         hair.color = "black";
         hair.length = 15;
         initStrTouSpeInte(60,50,99,99);
         initLibSensCor(35,35,20);
         set_weaponName("claws");
         set_weaponVerb("claws");
         set_armorName("chitin");
         bonusHP = 1200;
         lustVuln = 0.2;
         temperment = 3;
         level = 18;
         set_gems(Utils.rand(25) + 40);
         special1 = get_game().combat.packAttack;
         special2 = get_game().combat.lustAttack;
         tail.type = 5;
         set_drop(NO_DROP);
         checkMonster();
      }
      
      override public function won(param1:Boolean, param2:Boolean = false) : void
      {
         if(param2)
         {
            outputText("[pg]蜘蛛们看着你的表现，相视一笑，然后逼近了你……");
            doNext(get_game().combat.endLustLoss);
         }
         else
         {
            get_game().kihaFollowerScene.loseToSpiderMob();
         }
      }
      
      override public function struggle() : void
      {
         if(get_player().hasStatusEffect(StatusEffects.UBERWEB))
         {
            clearOutput();
            outputText("你拼命从蛛网中挣脱出来，而奇哈则尽全力独自应付那些蜘蛛！[pg]");
            get_player().removeStatusEffect(StatusEffects.UBERWEB);
         }
      }
      
      public function spoidahHordeWebLaunchahs() : void
      {
         if(missFirstRound || Boolean(combatAvoidDamage(new AvoidDamageParameters(true,false,false,null,null,null,null,null)).attackFailed))
         {
            outputText("其中一只蛛化精灵向你喷射了一大团蛛网！幸运的是，奇哈及时喷出一团火焰，在半空中将其烧成了灰烬！");
         }
         else
         {
            outputText("一些蜘蛛和蛛化精灵向你喷射了一大团湿漉漉的蛛网，正中你的躯干！你试图挣脱，但无济于事；你暂时被困住了。不过令人欣慰的是，蛛化精灵们毫无防备的姿态和沾沾自喜，让奇哈得以用猛烈的火焰从侧面轰击它们！");
            get_player().createStatusEffect(StatusEffects.UBERWEB,0,0,0,0);
            set_HP(get_HP() - 250);
         }
      }
      
      public function spiderStandardAttack() : void
      {
         var _loc1_:int = 0;
         if(missFirstRound || Boolean(combatAvoidDamage(new AvoidDamageParameters(true,true,false,null,null,null,null,null)).attackFailed))
         {
            missFirstRound = false;
            outputText("一群蜘蛛向你冲来，试图抓咬你。不过，在奇哈名副其实的火力掩护下，你成功地将它们全部击退了。");
         }
         else
         {
            outputText("一群蜘蛛向你冲来，试图抓咬你。你成功地击退了大部分，但还是有几次狠毒的攻击穿透了你的[armorName]。");
            _loc1_ = get_player().reduceDamage(get_str() + get_weaponAttack(),this) + 20;
            if(_loc1_ <= 0)
            {
               _loc1_ = 0;
               if(Utils.rand(get_player().get_armorDef() + get_player().get_tou()) < get_player().get_armorDef())
               {
                  outputText("你用你的[armor]吸收并偏转了每一次" + Utils.cnName(get_weaponVerb()) + "。");
               }
               else
               {
                  outputText("你偏转并格挡了" + get_a() + Utils.cnName(get_short()) + "向你发起的每一次" + Utils.cnName(get_weaponVerb()) + "。");
               }
            }
            else if(_loc1_ < 6)
            {
               outputText("你被" + get_a() + Utils.cnName(get_short()) + "擦伤了！");
            }
            else if(_loc1_ < 11)
            {
               outputText(get_capitalA() + Utils.cnName(get_short()) + "击伤了你！");
            }
            else if(_loc1_ < 21)
            {
               outputText(get_capitalA() + Utils.cnName(get_short()) + "用" + pronoun3 + "的" + Utils.cnName(get_weaponVerb()) + "将你打得踉跄！");
            }
            else if(_loc1_ > 20)
            {
               outputText(get_capitalA() + Utils.cnName(get_short()) + "用" + pronoun3 + "强力的" + Utils.cnName(get_weaponVerb()) + "<b>将你重创</b>！");
            }
            if(_loc1_ > 0)
            {
               get_player().takeDamage(_loc1_,true);
               if(lustVuln > 0 && get_player().get_armor() == get_game().armors.BONSTRP)
               {
                  if(!get_plural())
                  {
                     outputText("\n" + get_capitalA() + Utils.cnName(get_short()) + "擦过了你裸露的肌肤，惊讶地猛然后退，看到你暴露了这么多，脸上泛起了一丝红晕。");
                  }
                  else
                  {
                     outputText("\n" + get_capitalA() + Utils.cnName(get_short()) + "擦过了你裸露的肌肤，惊讶地猛然后退，看到你暴露了这么多，脸上泛起了一丝红晕。");
                  }
                  set_lust(get_lust() + 10 * lustVuln);
               }
            }
            statScreenRefresh();
         }
         kihaSPOIDAHAI();
      }
      
      override public function performCombatAction() : void
      {
         get_game().spriteSelect(SpriteDb.get_s_kiha());
         if(Utils.rand(2) == 0 || get_player().hasStatusEffect(StatusEffects.UBERWEB))
         {
            spiderStandardAttack();
         }
         else
         {
            spoidahHordeWebLaunchahs();
         }
      }
      
      public function kihaSPOIDAHAI() : void
      {
         outputText("[pg]");
         get_game().spriteSelect(SpriteDb.get_s_kiha());
         outputText("然而，趁着它们和你纠缠不清的时候，奇哈抓住机会用她的斧头浅浅地挥砍了几下，伴随着几丁质碎裂的嘎吱声。");
         set_HP(get_HP() - 50);
      }
      
      override public function defeated(param1:Boolean) : void
      {
         get_game().kihaFollowerScene.beatSpiderMob();
      }
   }
}

