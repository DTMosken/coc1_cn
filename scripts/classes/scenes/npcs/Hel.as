package classes.scenes.npcs
{
   import classes.Appearance;
   import classes.CoC;
   import classes.Creature;
   import classes.Monster;
   import classes.PerkLib;
   import classes.Player;
   import classes.StatusEffects;
   import classes._FlagDict.FlagDict_Impl_;
   import classes.globalFlags.KFLAGS;
   import classes.internals.ChainedDrop;
   import classes.internals.MonsterAI;
   import classes.internals.Utils;
   import classes.items.ArmorLib;
   import classes.items.ConsumableLib;
   import classes.items.WeaponLib;
   import classes.scenes.combat.AvoidDamageParameters;
   import classes.scenes.combat.CombatRange;
   import flash.Boot;
   
   public class Hel extends Monster
   {
      
      public function Hel()
      {
         if(Boot.skip_constructor)
         {
            return;
         }
         super();
         if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,391) == 1)
         {
            set_a("");
            set_short("Hel");
         }
         else
         {
            set_a("");
            set_short("salamander");
         }
         imageName = "hel";
         set_long("你正在与一个（字面意义上）火辣的火蜥蜴战斗——一个七英尺高的女人，深红色的鳞片覆盖着她的腿、背和前臂，一条尾巴在她身后威胁地挥舞着，燃烧着炽热的火焰。她的红发在她纤细的肩膀周围狂野地飞舞，偶尔掠过她丰满的E罩杯乳房，这些乳房勉强被一件覆盖着鳞片的比基尼上衣遮住。明亮的红眼睛从一张几乎像人类的脸上注视着你，她绕着你转，准备靠近进行致命一击。她那把残忍的弯剑举在身侧，在真正的攻击之间向你佯攻。");
         set_race("Salamander");
         createVagina(true,1,1);
         createStatusEffect(StatusEffects.BonusVCapacity,85,0,0,0);
         createBreastRow(Appearance.breastCupInverse("E+"));
         ass.analLooseness = 1;
         ass.analWetness = 0;
         createStatusEffect(StatusEffects.BonusACapacity,85,0,0,0);
         set_tallness(84);
         hips.rating = 12;
         butt.rating = 9;
         skin.tone = "dusky";
         hair.color = "red";
         hair.length = 13;
         tail.type = 25;
         tail.recharge = 0;
         initStrTouSpeInte(80,70,75,60);
         initLibSensCor(65,25,30);
         set_weaponName("sword");
         set_weaponVerb("slashing blade");
         set_weaponAttack(20);
         set_armorName("scales");
         set_armorDef(14);
         set_armorPerk("");
         set_armorValue(50);
         bonusHP = 275;
         set_lust(30);
         lustVuln = 0.35;
         additionalXP = 400;
         createPerk(PerkLib.Parry,0,0,0,0);
         createPerk(PerkLib.Evade,0,0,0,0);
         temperment = 2;
         level = 16;
         set_gems(10 + Utils.rand(5));
         set_drop(new ChainedDrop().add(get_armors().CHBIKNI,0.05).add(get_weapons().SCIMITR,0.05).add(get_consumables().SALAMFW,0.7));
         if(get_game().helScene.heliaSparIntensity() < 100)
         {
            bonusHP += get_game().helScene.heliaSparIntensity() * 15;
            bonusLust += get_game().helScene.heliaSparIntensity() * 2;
            set_weaponAttack(get_weaponAttack() + get_game().helScene.heliaSparIntensity() * 2);
            if(get_game().helScene.heliaSparIntensity() < 50)
            {
               level += Math.floor(get_game().helScene.heliaSparIntensity() / 5);
            }
            else
            {
               level += 10 + Math.floor((get_game().helScene.heliaSparIntensity() - 50) / 10);
            }
         }
         else
         {
            bonusHP += 1500;
            bonusLust += 200;
            set_weaponAttack(get_weaponAttack() + 200);
            level += 15;
         }
         checkMonster();
      }
      
      override public function won(param1:Boolean, param2:Boolean = false) : void
      {
         if(param2)
         {
            outputText("[pg]赫莉娅在坚忍的沉默中等待着……");
            doNext(get_game().combat.endLustLoss);
         }
         else if(hasStatusEffect(StatusEffects.Sparring))
         {
            get_game().helFollower.loseToSparringHeliaLikeAButtRapedChump();
         }
         else
         {
            get_game().helScene.loseToSalamander();
         }
      }
      
      override public function performCombatAction() : void
      {
         var _loc1_:MonsterAI = new MonsterAI();
         _loc1_.add(helAttack,1,true,0,FATIGUE_NONE,CombatRange.ChargingMelee);
         _loc1_.add(helAttack2,1,true,0,FATIGUE_NONE,CombatRange.ChargingMelee);
         _loc1_.add(helCleavage,1,true,0,FATIGUE_NONE,CombatRange.Tease);
         _loc1_.exec();
      }
      
      public function helCleavage() : void
      {
         var _loc1_:Number = NaN;
         if(Boolean(combatAvoidDamage(new AvoidDamageParameters(true,false,false,null,null,null,null,null)).attackFailed))
         {
            outputText("令你惊讶的是，火蜥蜴突然拉起上衣，让她那丰满的双乳暴露在空气中；她那粉红色的小乳头因为兴奋或温度而迅速变硬。还没等你把目光从她那傲人的双峰上移开，她就向你扑了过来。她的一只长满鳞片的手臂搂住你的腰，另一只手伸向你的头，但你翻滚着挣脱了她的抓握，把她推开了。她踉跄了一下，但很快就瞪着你，把那件叮当作响的比基尼上衣拉了下来。\n");
         }
         else
         {
            outputText("令你惊讶的是，火蜥蜴突然拉起上衣，让她那丰满的双乳暴露在空气中；她那粉红色的小乳头因为兴奋或温度而迅速变硬。还没等你把目光从她那傲人的双峰上移开，她就向你扑了过来。她的一只长满鳞片的手臂搂住你的腰，另一只手用力把你的脸按进她的乳沟里。她把乳房在你的脸上晃动了一会儿，你才挣脱出来，尽管你能感觉到下半身明显升起了一股热流。双乳刚一露出来，就又被遮住了，你的对手准备好继续战斗了！");
            _loc1_ = 20 + Utils.rand(10) + get_player().sens / 10 + Utils.rand(get_game().helScene.heliaSparIntensity() / 10) + Utils.rand(get_player().lib / 20) * (1 + get_player().newGamePlusMod() * 0.2);
            get_player().takeLustDamage(_loc1_,true);
         }
      }
      
      public function helAttack2() : void
      {
         var _loc1_:Number = NaN;
         var _loc2_:Array = ["[SPEED]火蜥蜴向你冲来，打断了你的防御佯攻，试图拉近你们之间的距离。她用尾巴猛击你的脚，你勉强躲过了这次突袭。"];
         var _loc3_:AvoidDamageParameters = new AvoidDamageParameters(true,false,true,null,false,get_player().standardDodgeFunc(this,25),null,null);
         if(!playerAvoidDamage(_loc3_,_loc2_))
         {
            _loc1_ = get_player().reduceDamage(get_str() + get_game().helScene.heliaSparIntensity(),this);
            if(_loc1_ <= 0)
            {
               _loc1_ = 0;
               if(Utils.rand(get_player().get_armorDef() + get_player().get_tou()) < get_player().get_armorDef())
               {
                  outputText("火蜥蜴的尾击在你的护甲上无害地弹开了！");
               }
               else
               {
                  outputText("火蜥蜴的尾击击中了你，但未能撼动你或造成伤害。");
               }
            }
            else
            {
               outputText("火蜥蜴冲向你，击退了你的防御佯攻，滑入了你的防线。她用尾巴猛击你的双脚，在你倒向现在正冒着烟的草地时，你能感觉到那条燃烧着的尾巴留下的炽热尾迹。");
            }
            if(_loc1_ > 0)
            {
               get_player().takeDamage(_loc1_,true);
            }
         }
         statScreenRefresh();
         outputText("\n");
      }
      
      public function helAttack() : void
      {
         var _loc1_:Number = get_player().reduceDamage(get_str() + get_weaponAttack(),this,15);
         var _loc2_:Array = ["[SPEED]你敏捷地躲开了火蜥蜴巨大的剑刺！"];
         var _loc3_:AvoidDamageParameters = new AvoidDamageParameters(true,true,true,null,false,null,null,null);
         if(!playerAvoidDamage(_loc3_,_loc2_))
         {
            if(_loc1_ <= 0)
            {
               _loc1_ = 0;
               if(Utils.rand(get_player().get_armorDef() + get_player().get_tou()) < get_player().get_armorDef())
               {
                  outputText("你用你的[armor]吸收并弹开了每一次" + Utils.cnName(get_weaponVerb()) + "。");
               }
               else
               {
                  outputText("你偏转并格挡了" + get_a() + Utils.cnName(get_short()) + "向你发起的每一次" + Utils.cnName(get_weaponVerb()) + "。");
               }
            }
            else
            {
               outputText("火蜥蜴向你猛扑过来，剑在空中划出一道高高而野蛮的弧线。你试图躲避她的攻击，但她突然在挥击中途旋转身体，将剑带向一条完全不同的轨迹。剑刃深深地咬入你的血肉，让你踉跄后退。");
            }
            if(_loc1_ > 0)
            {
               get_player().takeDamage(_loc1_,true);
            }
         }
         statScreenRefresh();
         outputText("\n");
      }
      
      override public function defeated(param1:Boolean) : void
      {
         if(hasStatusEffect(StatusEffects.Sparring))
         {
            get_game().helFollower.PCBeatsUpSalamanderSparring();
         }
         else
         {
            get_game().helScene.beatUpHel();
         }
      }
   }
}

