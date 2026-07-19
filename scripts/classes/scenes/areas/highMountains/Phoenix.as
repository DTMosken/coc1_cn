package classes.scenes.areas.highMountains
{
   import classes.Appearance;
   import classes.CoC;
   import classes.CockTypesEnum;
   import classes.Creature;
   import classes.Monster;
   import classes.Player;
   import classes.StatusEffects;
   import classes._FlagDict.FlagDict_Impl_;
   import classes.internals.ChainedDrop;
   import classes.internals.MonsterAI;
   import classes.internals.Utils;
   import classes.items.UseableLib;
   import classes.items.WeaponLib;
   import classes.scenes.combat.AvoidDamageParameters;
   import classes.scenes.combat.CombatRange;
   import flash.Boot;
   import haxe.IMap;
   
   public class Phoenix extends Monster
   {
      
      public function Phoenix()
      {
         if(Boot.skip_constructor)
         {
            return;
         }
         super();
         set_a("");
         set_short("phoenix");
         imageName = "phoenix";
         set_long("面前这个身影是火蜥蜴与鹰身女妖的危险混血——一只由自封为鹰身女妖\"蜂后\"所创造的不死鸟。她的外貌与普通的深红羽鹰身女妖相去不远，但有几处显眼的不同。她背后生出的翅膀比普通鹰身女妖更为宽大，大概是为了弥补那对寻常的臂翼退化成布满鳞片的前臂这一缺憾——这是她火蜥蜴血统的明显印记。她的下半身亦是如此：虽然胯部与大腿与普通鹰身女妖无异，但她还拥有一条火焰般的长尾，在她绕着你盘旋时来回甩动。\n\n她身高约六英尺半，丰满的双乳将胸前那件黯淡的金属背心撑得鼓鼓的，宽阔的胯部也几乎要撑破那条紧绷的缠腰布。一根半勃起的蜥蜴人阳具从布下探出，将布料推向一侧，让其下那湿润饱满的小穴一览无余。她手中的弯刀在空中划出大片弧线，在她穿梭腾跃之际，将你们所在的开阔空间发挥得淋漓尽致。");
         set_race("Phoenix");
         createCock(8,1.2,CockTypesEnum.LIZARD);
         createVagina(false,3,2);
         createStatusEffect(StatusEffects.BonusVCapacity,40,0,0,0);
         createBreastRow(Appearance.breastCupInverse("D"));
         ass.analLooseness = 1;
         ass.analWetness = 2;
         createStatusEffect(StatusEffects.BonusACapacity,20,0,0,0);
         set_tallness(78);
         tail.type = 9;
         hips.rating = 10;
         butt.rating = 10;
         lowerBody.type = 13;
         skin.tone = "light";
         skin.type = 2;
         skin.desc = "crimson";
         hair.color = "red";
         hair.length = 16;
         initStrTouSpeInte(100,70,100,65);
         initLibSensCor(50,30,45);
         set_weaponName("scimitar and shield");
         set_weaponVerb("slash");
         set_weaponAttack(30);
         set_armorName("chainmail and loincloth");
         set_armorDef(26);
         bonusHP = 750;
         set_lust(10);
         lustVuln = 0.7;
         temperment = 2;
         level = 23;
         set_gems(30 + Utils.rand(25));
         set_drop(new ChainedDrop().add(get_weapons().SCIMITR,0.05).add(get_useables().EBNFLWR,0.1));
         wings.type = 4;
         checkMonster();
      }
      
      override public function won(param1:Boolean, param2:Boolean = false) : void
      {
         if(param2)
         {
            outputText("[pg]你的敌人似乎并没有觉得恶心到要离开……");
            doNext(get_game().combat.endLustLoss);
         }
         else
         {
            get_game().highMountains.phoenixScene.loseToPhoenix();
         }
      }
      
      public function phoenixFireBreath() : void
      {
         var _loc1_:int = 0;
         if(!hasStatusEffect(StatusEffects.Uber))
         {
            outputText("突然，不死鸟与你拉开距离，在空中盘旋，发出一声响亮的啼鸣，然后开始向你俯冲。她显然在蓄力准备什么大招，所以如果你想有机会躲开，最好等她先出手！");
            createStatusEffect(StatusEffects.Uber,0,0,0,0);
         }
         else
         {
            if(FlagDict_Impl_.arrayReadInt(get_flags(),22) == 1)
            {
               outputText("就在不死鸟向你喷出一大团火焰时，你猛地扑倒在地。火焰在你的背上绽放，烧焦了你的[armor]，但并没有伤到你。当她低空掠过时，你看到不死鸟皱起眉头，看起来相当失望，但很明显她还没完！");
            }
            else
            {
               outputText("当她从你头顶飞过时，一大股火焰从不死鸟的嘴里喷涌而出！你赶紧躲开，但为时已晚。当你跳过火墙时，火墙从你身上滚过，与地狱之火的短暂接触严重烧伤了你和你的[armor]。");
               get_game().combat.monsterDamageType = "Fire";
               _loc1_ = int(get_str() + get_weaponAttack() + 300 + Utils.rand(250));
               _loc1_ = get_player().reduceDamage(_loc1_,this);
               get_player().takeDamage(_loc1_,true);
            }
            removeStatusEffect(StatusEffects.Uber);
         }
      }
      
      override public function performCombatAction() : void
      {
         if(hasStatusEffect(StatusEffects.Uber))
         {
            phoenixFireBreath();
            return;
         }
         var _loc1_:MonsterAI = new MonsterAI();
         _loc1_.add(eAttack,2,true,0,FATIGUE_NONE,CombatRange.FlyingMelee);
         _loc1_.add(doubleSlash,1,true,10,FATIGUE_PHYSICAL,CombatRange.Ranged);
         _loc1_.add(phoenixFireBreath,1,true,15,FATIGUE_MAGICAL,CombatRange.Ranged);
         _loc1_.add(lustBang,1,true,10,FATIGUE_PHYSICAL,CombatRange.Ranged);
         _loc1_.exec();
      }
      
      public function lustBang() : void
      {
         var _loc1_:Number = NaN;
         outputText("[say:接招！]不死鸟大喊着，向你扔了一个小圆罐，然后躲到了她坚固的盾牌后面。");
         if(Boolean(combatAvoidDamage(new AvoidDamageParameters(true,false,false,null,null,null,null,null)).attackFailed))
         {
            outputText("幸运的是，金属圆筒在崎岖的山地上弹开了，给了你足够的时间躲开，一大团粉红色的云雾在空中爆发。不死鸟从盾牌后瞥了一眼，看到你准备再次攻击，而不是在地上痛苦地扭动，变成一堆过度敏感的欲望，她的脸色变暗了。");
         }
         else
         {
            outputText("你咳嗽着，挥舞着手臂试图驱散雾气，但当云雾消散时，你感到头晕目眩，欲火焚身。你的");
            if(get_player().isGenderless())
            {
               outputText("尽管你没有生殖器，但胯下还是感到一阵奇怪的燥热");
            }
            if(get_player().hasCock())
            {
               outputText("肉棒在你的盔甲里迅速充血胀大，先列腺液已经顺着你的腿流了下来");
            }
            if(get_player().hasCock() && get_player().hasVagina())
            {
               outputText("同时你的");
            }
            if(get_player().hasVagina())
            {
               outputText("大腿突然被喷涌而出的淫液浸湿，这是你的身体对强效化学物质的反应");
            }
            outputText("。");
            _loc1_ = 30 + Utils.rand(30);
            get_player().takeLustDamage(_loc1_,true);
         }
      }
      
      public function doubleSlash() : void
      {
         var _loc1_:int = 0;
         outputText("当你的敌人向你冲来并疯狂挥舞时，你在如雨般的虚晃和刺击下连连后退。不死鸟对你发起的攻击数量多得惊人，迫使你不断后退，试图挡下这阵致命的连击。");
         if(Boolean(combatAvoidDamage(new AvoidDamageParameters(true,true,false,null,null,null,null,null)).attackFailed))
         {
            outputText("你用力格挡住了她的一击，将她击退，给自己争取到了一点喘息的空间。");
         }
         if(combatBlock(true))
         {
            outputText("你及时举起你的[shield]，挡住了不死鸟的攻击。");
         }
         else
         {
            outputText("不死鸟看准破绽，用两记快速而有力的攻击强行突破了你的防御。");
            _loc1_ = int(get_str() + get_weaponAttack() + Utils.rand(80));
            _loc1_ = get_player().reduceDamage(_loc1_,this);
            get_player().takeDamage(_loc1_,true);
            _loc1_ = int(get_str() + get_weaponAttack() + Utils.rand(80));
            _loc1_ = get_player().reduceDamage(_loc1_,this);
            get_player().takeDamage(_loc1_,true);
         }
      }
      
      override public function defeated(param1:Boolean) : void
      {
         get_game().highMountains.phoenixScene.winAgainstPhoenix();
      }
   }
}

