package classes.scenes.places.boat
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
   import classes.internals.MonsterAI;
   import classes.internals.Utils;
   import classes.scenes.combat.AvoidDamageParameters;
   import classes.scenes.combat.CombatRange;
   import flash.Boot;
   
   public class Marae extends Monster
   {
      
      public function Marae()
      {
         if(Boot.skip_constructor)
         {
            return;
         }
         super();
         set_a("");
         set_short("Marae");
         imageName = "marae";
         if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,2024) == 2)
         {
            set_long("这个存在是玛瑞斯的女神。她因工厂阀门被炸毁后的余波而遭到腐化。她通体雪白，皮肤带有树皮般的纹理。肚脐以下的那朵\"花\"看起来与其说像花，不如说更像一处阴户。她的G罩杯双乳随着每一个动作轻轻颤动。");
            createVagina(false,4,1);
            createBreastRow(Appearance.breastCupInverse("G"));
         }
         else
         {
            set_long("这个存在被称为玛瑞斯女神。多亏了你在工厂的行动，她不再被腐化。她全身雪白，有着树皮般的纹理。她的乳房大小适中。");
            createVagina(false,2,1);
            createBreastRow(Appearance.breastCupInverse("DD"));
         }
         set_race("Deity");
         ass.analLooseness = 1;
         ass.analWetness = 1;
         set_tallness(120);
         hips.rating = 10;
         butt.rating = 8;
         skin.tone = "white";
         skin.setType(0);
         hair.color = "green";
         hair.length = 36;
         if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,2024) == 2)
         {
            initStrTouSpeInte(150,150,70,110);
            initLibSensCor(60,25,100);
            set_weaponName("tentacles");
            set_weaponVerb("slap");
            set_weaponAttack(40);
            normalAttackAvoid.doParry = false;
            normalAttackAvoid.doCounter = false;
         }
         else
         {
            initStrTouSpeInte(200,150,100,150);
            initLibSensCor(25,25,0);
            set_weaponName("fists");
            set_weaponVerb("wrathful punch");
            set_weaponAttack(50);
         }
         set_weaponPerk([]);
         set_weaponValue(25);
         set_armorName("bark");
         set_armorDef(30);
         bonusHP = 4750;
         bonusLust = 80;
         if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,2024) == 1)
         {
            bonusHP += 2700;
            if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,2093) > 0)
            {
               bonusHP += 1000;
            }
         }
         set_lust(30);
         lustVuln = 0.07;
         temperment = 2;
         level = 99;
         additionalXP = 2500;
         if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,2024) == 1)
         {
            additionalXP += 500;
         }
         set_drop(NO_DROP);
         set_gems(1000);
         if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,2024) == 1)
         {
            special1 = smite;
         }
         if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,2024) == 2)
         {
            special1 = tentacleAttack;
            special2 = tentacleRape;
         }
         createPerk(PerkLib.Tank,0,0,0,0);
         createPerk(PerkLib.Tank2,0,0,0,0);
         createPerk(PerkLib.ImprovedSelfControl,0,0,0,0);
         checkMonster();
      }
      
      override public function won(param1:Boolean, param2:Boolean = false) : void
      {
         get_game().boat.marae.loseAgainstMarae();
      }
      
      public function tentacleRape() : void
      {
         var _loc2_:int = 0;
         outputText("你发现铺天盖地的触手朝你袭来！触手直奔你而来，目标是你的下体！");
         var _loc1_:* = combatAvoidDamage(new AvoidDamageParameters(true,false,false,null,null,null,null,null));
         if(_loc1_.dodge == EVASION_SPEED)
         {
            outputText("你成功地从她的触手下逃脱了！");
         }
         else if(_loc1_.dodge != null)
         {
            outputText("多亏了你卓越的闪避能力，你成功避开了她的触手！");
         }
         else
         {
            outputText("你试图拍开触手，但太迟了！触手挠着你的下体，你能感觉到你的[ass]正在被戏弄！[say: 你知道你想要我！]玛莱咯咯地笑着。");
            _loc2_ = int(20 + Utils.rand(get_player().cor / 10) + Utils.rand(get_player().sens / 5) + Utils.rand(get_player().lib / 10) + Utils.rand(10));
            get_player().takeLustDamage(_loc2_,true);
         }
      }
      
      public function tentacleAttack() : void
      {
         var _loc2_:int = 0;
         outputText("你发现一阵触手弹幕朝你袭来！你试图闪避开来");
         var _loc1_:* = combatAvoidDamage(new AvoidDamageParameters(true,false,false,null,null,null,null,null));
         if(_loc1_.dodge == EVASION_SPEED)
         {
            outputText("并且成功躲开了她的触手！");
         }
         else if(_loc1_.dodge != null)
         {
            outputText("多亏了你出色的闪避能力，你成功躲开了她的触手！");
         }
         else
         {
            outputText("但你失败了，反而被击中了！触手的触感让你的腹股沟感到一丝温热。");
            _loc2_ = int(get_str() + 100 + Utils.rand(50));
            _loc2_ = get_player().reduceDamage(_loc2_,this);
            get_player().takeDamage(_loc2_,true);
            get_player().takeLustDamage(Utils.rand(5) + 5,true);
         }
      }
      
      public function smiteHit() : void
      {
         var _loc1_:int = 0;
         if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,22) == 1)
         {
            outputText("你抬头看向天空，看到闪电正在逼近！多亏了你的防备，你在闪电击中你之前成功跳开了！");
         }
         else
         {
            outputText("毫无预兆地，闪电击中了你！电流痛苦地穿过你的身体。");
            if(get_player().cor >= 50)
            {
               outputText("这种剧痛令人难以忍受。");
            }
            _loc1_ = int(100 + get_str() + get_player().corAdjustedDown() * 5);
            _loc1_ = get_player().reduceDamage(_loc1_,this);
            get_player().takeDamage(_loc1_,true);
         }
         if(hasStatusEffect(StatusEffects.Uber))
         {
            removeStatusEffect(StatusEffects.Uber);
         }
      }
      
      public function smite() : void
      {
         outputText("玛莱嘴里念着咒语。乌云密布，天色迅速变暗。<b>看起来闪电可能会劈中你！</b>");
         createStatusEffect(StatusEffects.Uber,1,0,0,0);
      }
      
      override public function runCheck() : void
      {
         outputText("你的船被触手挡住了！");
         if(!get_player().canFly())
         {
            outputText("你可能游得不够快。");
         }
         else
         {
            outputText("你咬紧牙关努力试图飞走，但触手突然抓住了你的[legs]并把你拉了下来。");
         }
         outputText("看来你无法逃脱了。");
         get_game().combat.startMonsterTurn();
      }
      
      override public function performCombatAction() : void
      {
         if(hasStatusEffect(StatusEffects.Uber))
         {
            smiteHit();
            return;
         }
         var _loc1_:MonsterAI = new MonsterAI();
         _loc1_.add(eAttack,3,true,0,FATIGUE_NONE,FlagDict_Impl_.arrayReadInt(KFLAGS.flags,2024) == 2 ? CombatRange.FlyingMelee : CombatRange.Melee);
         _loc1_.add(smite,3,FlagDict_Impl_.arrayReadInt(KFLAGS.flags,2024) == 1,15,FATIGUE_NONE,CombatRange.Self);
         _loc1_.add(tentacleAttack,3,FlagDict_Impl_.arrayReadInt(KFLAGS.flags,2024) == 2,10,FATIGUE_PHYSICAL,CombatRange.FlyingMelee);
         _loc1_.add(tentacleRape,3,FlagDict_Impl_.arrayReadInt(KFLAGS.flags,2024) == 2,10,FATIGUE_PHYSICAL,CombatRange.FlyingMelee);
         _loc1_.exec();
      }
      
      override public function handleFear() : Boolean
      {
         get_game().outputText("[say: 你以为我会怕什么吗？愚蠢的凡人。]玛莱咆哮道。[pg]");
         removeStatusEffect(StatusEffects.Fear);
         return true;
      }
      
      override public function defeated(param1:Boolean) : void
      {
         get_game().boat.marae.winAgainstMarae();
      }
   }
}

