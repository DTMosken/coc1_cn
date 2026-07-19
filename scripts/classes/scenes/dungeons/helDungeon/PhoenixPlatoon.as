package classes.scenes.dungeons.helDungeon
{
   import classes.Appearance;
   import classes.CoC;
   import classes.Monster;
   import classes.Player;
   import classes.StatusEffects;
   import classes.internals.Utils;
   import flash.Boot;
   
   public class PhoenixPlatoon extends Monster
   {
      
      public var platoonStage:int;
      
      public function PhoenixPlatoon()
      {
         if(Boot.skip_constructor)
         {
            return;
         }
         platoonStage = 0;
         super();
         set_a("");
         set_short("phoenix platoon");
         imageName = "phoenixmob";
         set_long("你面对的是一个重步兵小队，她们全副武装，穿着锁子甲，拿着盾牌。她们看起来像是火蜥蜴和鹰身女妖的杂交体，除了深红色的翅膀、长满鳞片的脚和长长的火红色尾巴外，都是人形。她们站成紧密的盾墙，每只不死鸟都用塔盾保护着自己和身旁的战士。当她们慢慢向你逼近时，她们的长矛在房间里划出巨大的弧线。");
         set_plural(true);
         pronoun1 = "她们";
         pronoun2 = "她们";
         pronoun3 = "她们的";
         createCock();
         balls = 2;
         ballSize = 1;
         cumMultiplier = 3;
         createVagina(false,5,2);
         createBreastRow(Appearance.breastCupInverse("D"));
         ass.analLooseness = 4;
         ass.analWetness = 0;
         set_tallness(Utils.rand(8) + 70);
         hips.rating = 8;
         butt.rating = 8;
         lowerBody.type = 10;
         skin.tone = "red";
         hair.color = "black";
         hair.length = 15;
         initStrTouSpeInte(60,60,120,40);
         initLibSensCor(40,45,50);
         set_weaponName("spears");
         set_weaponVerb("stab");
         set_weaponAttack(20);
         set_armorName("armor");
         set_armorDef(50);
         bonusHP = 400;
         set_lust(20);
         lustVuln = 0.15;
         temperment = 3;
         level = 20;
         set_gems(Utils.rand(25) + 160);
         additionalXP = 50;
         horns.type = 3;
         horns.value = 2;
         tail.type = 11;
         wings.type = 9;
         set_drop(NO_DROP);
         checkMonster();
      }
      
      override public function won(param1:Boolean, param2:Boolean = false) : void
      {
         get_game().dungeons.heltower.phoenixPlatoonMurdersPC();
      }
      
      public function phoenixPlatoonRush() : void
      {
         outputText("你在弯刀的猛烈攻击下节节败退。不死鸟的数量之多已经够糟糕了，但她们的攻击配合得天衣无缝，几乎没有留下任何逃跑或躲避的空间，让你无法不被击中！\n");
         createStatusEffect(StatusEffects.Attacks,2 + Utils.rand(3),0,0,0);
         eAttack();
      }
      
      public function phoenixPlatoonLustbang() : void
      {
         outputText("[say: 催情弹，扔！] 最后面的一只不死鸟大喊道，导致所有其他战士都蹲在盾牌后面。哦，该死！一个大玻璃球从盾墙里滚了出来，立刻爆炸成一大团粉红色的云雾。你咳嗽着挥舞手臂，但当云雾散去时，你感到头晕目眩，欲火焚身，几乎无法抗拒扑向不死鸟们，乞求她们的肉棒和小穴的冲动。");
         get_player().takeLustDamage(40,true);
      }
      
      public function phoenixPlatoonFireBreath() : void
      {
         outputText("突然，盾墙分开了，露出了小队中的一名成员，一个肌肉特别发达的女孩，正勃起着。还没等你弄明白发生了什么，她就向后仰起头，对着你呼气。令你恐惧的是，一大股火焰从她嘴里喷发出来，向你滚滚而来。你赶紧扑倒，但还是被部分卷入了火海。");
         var _loc1_:Number = 100 + Utils.rand(50);
         get_player().takeDamage(_loc1_,true);
      }
      
      public function phoenixPlatoonAI() : void
      {
         switch(platoonStage)
         {
            case 0:
               phoenixPlatoonRush();
               break;
            case 1:
               phoenixPlatoonFireBreath();
               break;
            default:
               phoenixPlatoonLustbang();
         }
         platoonStage = int((platoonStage + 1) % 3);
      }
      
      override public function performCombatAction() : void
      {
         phoenixPlatoonAI();
      }
      
      override public function defeated(param1:Boolean) : void
      {
         get_game().dungeons.heltower.phoenixPlatoonLosesToPC();
      }
   }
}

