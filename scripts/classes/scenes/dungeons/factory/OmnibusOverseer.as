package classes.scenes.dungeons.factory
{
   import classes.Appearance;
   import classes.CoC;
   import classes.DynStat;
   import classes.ItemType;
   import classes.Monster;
   import classes.PerkLib;
   import classes.Player;
   import classes.StatusEffects;
   import classes.internals.MonsterAI;
   import classes.internals.Utils;
   import classes.internals.WeightedChoice;
   import classes.scenes.combat.CombatRange;
   import classes.scenes.dungeons.Factory;
   import flash.Boot;
   
   public class OmnibusOverseer extends Monster
   {
      
      public var temp:Number;
      
      public var factory:Factory;
      
      public function OmnibusOverseer()
      {
         if(Boot.skip_constructor)
         {
            return;
         }
         temp = 0;
         factory = new Factory();
         super();
         set_a("");
         set_short("Omnibus Overseer");
         imageName = "omnibusoverseer";
         set_long("你面前的这个“女人”只穿着一条裹住她丰满胸部的布条。她有着引人注目的红色眼睛，与她蓝色的皮肤和深色的妆容形成鲜明对比。闪亮的黑色唇彩包裹着她那诱人的黑色丰唇。她最引人注目的特征是她的胯部，看起来既不像男性也不像女性。她有一个肿胀湿润的阴户，但在阴蒂的位置却长出了一个阴茎状的突起。");
         set_race("Demon");
         createCock(10,1.5);
         balls = 0;
         ballSize = 0;
         cumMultiplier = 3;
         createVagina(false,4,1);
         createBreastRow(Appearance.breastCupInverse("DD"));
         ass.analLooseness = 1;
         ass.analWetness = 5;
         set_tallness(Utils.rand(9) + 70);
         hips.rating = 8;
         butt.rating = 2;
         lowerBody.type = 5;
         skin.tone = "light purple";
         hair.color = "purple";
         hair.length = 42;
         initStrTouSpeInte(65,45,45,85);
         initLibSensCor(80,70,100);
         set_weaponName("claws");
         set_weaponVerb("claw");
         set_weaponAttack(10);
         set_weaponPerk([]);
         set_weaponValue(150);
         set_armorName("demonic skin");
         set_armorDef(15);
         bonusHP = 200;
         set_lust(20);
         lustVuln = 0.75;
         temperment = 3;
         level = 8;
         set_gems(Utils.rand(25) + 10);
         additionalXP = 75;
         set_drop(new WeightedChoice(null,1));
         wings.type = 6;
         tail.type = 3;
         createPerk(PerkLib.ImprovedSelfControl,0,0,0,0);
         checkMonster();
      }
      
      override public function won(param1:Boolean, param2:Boolean = false) : void
      {
         if(param2)
         {
            outputText("[pg]你的敌人似乎并不在意……");
            doNext(get_game().combat.endLustLoss);
         }
         else
         {
            factory.omnibusOverseer.doLossOmnibus();
         }
      }
      
      override public function performCombatAction() : void
      {
         var _loc1_:MonsterAI = new MonsterAI();
         _loc1_.add(lustAura,1,true,10,FATIGUE_MAGICAL,CombatRange.Ranged);
         _loc1_.add(milkAttack,1,true,10,FATIGUE_PHYSICAL,CombatRange.Ranged);
         _loc1_.add(eAttack,1,true,0,FATIGUE_NONE,CombatRange.Melee);
         _loc1_.exec();
      }
      
      public function milkAttack() : void
      {
         if(Utils.rand(2) == 0)
         {
            outputText("女恶魔抓住她那丰满的双乳，用力挤压，将乳汁喷向你。\n");
         }
         else
         {
            outputText("你的敌人蜷缩起身子，捏住自己的乳头用力拉扯，向你喷射出乳汁。\n");
         }
         if(get_player().get_spe() > 50 && Utils.rand(4) == 0 || get_player().hasPerk(PerkLib.Evade) && Utils.rand(3) == 0 || get_player().hasPerk(PerkLib.Misdirection) && Utils.rand(4) == 0 && get_player().get_armorName() == "red, high-society bodysuit")
         {
            outputText("你侧身躲开了喷涌而来的液体。");
         }
         else
         {
            if(Utils.rand(2) == 0)
            {
               outputText("乳汁溅在你的脸上和胸前，恶魔的乳霜将你浸透。有些甚至流进了你的嘴里，你不假思索地咽了下去。这让你感到一阵温暖的酥麻。");
            }
            else
            {
               outputText("乳汁溅到了你的[armor]里，把你彻底浸透了。");
               if(int(get_player().cocks.length) > 0)
               {
                  outputText("在乳汁的润滑和刺激下，你的[cock]变硬了。");
                  if(int([DynStat.Lust(5)].length) == 0)
                  {
                     get_game().player.dynStats();
                  }
                  else if(int([DynStat.Lust(5)].length) == 1)
                  {
                     get_game().player.dynStats([DynStat.Lust(5)][0]);
                  }
                  else if(int([DynStat.Lust(5)].length) == 2)
                  {
                     get_game().player.dynStats([DynStat.Lust(5)][0],[DynStat.Lust(5)][1]);
                  }
                  else if(int([DynStat.Lust(5)].length) == 3)
                  {
                     get_game().player.dynStats([DynStat.Lust(5)][0],[DynStat.Lust(5)][1],[DynStat.Lust(5)][2]);
                  }
                  else if(int([DynStat.Lust(5)].length) == 4)
                  {
                     get_game().player.dynStats([DynStat.Lust(5)][0],[DynStat.Lust(5)][1],[DynStat.Lust(5)][2],[DynStat.Lust(5)][3]);
                  }
                  else if(int([DynStat.Lust(5)].length) == 5)
                  {
                     get_game().player.dynStats([DynStat.Lust(5)][0],[DynStat.Lust(5)][1],[DynStat.Lust(5)][2],[DynStat.Lust(5)][3],[DynStat.Lust(5)][4]);
                  }
                  else if(int([DynStat.Lust(5)].length) == 6)
                  {
                     get_game().player.dynStats([DynStat.Lust(5)][0],[DynStat.Lust(5)][1],[DynStat.Lust(5)][2],[DynStat.Lust(5)][3],[DynStat.Lust(5)][4],[DynStat.Lust(5)][5]);
                  }
                  else if(int([DynStat.Lust(5)].length) == 7)
                  {
                     get_game().player.dynStats([DynStat.Lust(5)][0],[DynStat.Lust(5)][1],[DynStat.Lust(5)][2],[DynStat.Lust(5)][3],[DynStat.Lust(5)][4],[DynStat.Lust(5)][5],[DynStat.Lust(5)][6]);
                  }
                  else if(int([DynStat.Lust(5)].length) == 8)
                  {
                     get_game().player.dynStats([DynStat.Lust(5)][0],[DynStat.Lust(5)][1],[DynStat.Lust(5)][2],[DynStat.Lust(5)][3],[DynStat.Lust(5)][4],[DynStat.Lust(5)][5],[DynStat.Lust(5)][6],[DynStat.Lust(5)][7]);
                  }
                  else if(int([DynStat.Lust(5)].length) == 9)
                  {
                     get_game().player.dynStats([DynStat.Lust(5)][0],[DynStat.Lust(5)][1],[DynStat.Lust(5)][2],[DynStat.Lust(5)][3],[DynStat.Lust(5)][4],[DynStat.Lust(5)][5],[DynStat.Lust(5)][6],[DynStat.Lust(5)][7],[DynStat.Lust(5)][8]);
                  }
                  else if(int([DynStat.Lust(5)].length) == 10)
                  {
                     get_game().player.dynStats([DynStat.Lust(5)][0],[DynStat.Lust(5)][1],[DynStat.Lust(5)][2],[DynStat.Lust(5)][3],[DynStat.Lust(5)][4],[DynStat.Lust(5)][5],[DynStat.Lust(5)][6],[DynStat.Lust(5)][7],[DynStat.Lust(5)][8],[DynStat.Lust(5)][9]);
                  }
                  else if(int([DynStat.Lust(5)].length) == 11)
                  {
                     get_game().player.dynStats([DynStat.Lust(5)][0],[DynStat.Lust(5)][1],[DynStat.Lust(5)][2],[DynStat.Lust(5)][3],[DynStat.Lust(5)][4],[DynStat.Lust(5)][5],[DynStat.Lust(5)][6],[DynStat.Lust(5)][7],[DynStat.Lust(5)][8],[DynStat.Lust(5)][9],[DynStat.Lust(5)][10]);
                  }
                  else if(int([DynStat.Lust(5)].length) == 12)
                  {
                     get_game().player.dynStats([DynStat.Lust(5)][0],[DynStat.Lust(5)][1],[DynStat.Lust(5)][2],[DynStat.Lust(5)][3],[DynStat.Lust(5)][4],[DynStat.Lust(5)][5],[DynStat.Lust(5)][6],[DynStat.Lust(5)][7],[DynStat.Lust(5)][8],[DynStat.Lust(5)][9],[DynStat.Lust(5)][10],[DynStat.Lust(5)][11]);
                  }
                  else if(int([DynStat.Lust(5)].length) == 13)
                  {
                     get_game().player.dynStats([DynStat.Lust(5)][0],[DynStat.Lust(5)][1],[DynStat.Lust(5)][2],[DynStat.Lust(5)][3],[DynStat.Lust(5)][4],[DynStat.Lust(5)][5],[DynStat.Lust(5)][6],[DynStat.Lust(5)][7],[DynStat.Lust(5)][8],[DynStat.Lust(5)][9],[DynStat.Lust(5)][10],[DynStat.Lust(5)][11],[DynStat.Lust(5)][12]);
                  }
                  else if(int([DynStat.Lust(5)].length) == 14)
                  {
                     get_game().player.dynStats([DynStat.Lust(5)][0],[DynStat.Lust(5)][1],[DynStat.Lust(5)][2],[DynStat.Lust(5)][3],[DynStat.Lust(5)][4],[DynStat.Lust(5)][5],[DynStat.Lust(5)][6],[DynStat.Lust(5)][7],[DynStat.Lust(5)][8],[DynStat.Lust(5)][9],[DynStat.Lust(5)][10],[DynStat.Lust(5)][11],[DynStat.Lust(5)][12],[DynStat.Lust(5)][13]);
                  }
                  else if(int([DynStat.Lust(5)].length) == 15)
                  {
                     get_game().player.dynStats([DynStat.Lust(5)][0],[DynStat.Lust(5)][1],[DynStat.Lust(5)][2],[DynStat.Lust(5)][3],[DynStat.Lust(5)][4],[DynStat.Lust(5)][5],[DynStat.Lust(5)][6],[DynStat.Lust(5)][7],[DynStat.Lust(5)][8],[DynStat.Lust(5)][9],[DynStat.Lust(5)][10],[DynStat.Lust(5)][11],[DynStat.Lust(5)][12],[DynStat.Lust(5)][13],[DynStat.Lust(5)][14]);
                  }
                  else if(int([DynStat.Lust(5)].length) == 16)
                  {
                     get_game().player.dynStats([DynStat.Lust(5)][0],[DynStat.Lust(5)][1],[DynStat.Lust(5)][2],[DynStat.Lust(5)][3],[DynStat.Lust(5)][4],[DynStat.Lust(5)][5],[DynStat.Lust(5)][6],[DynStat.Lust(5)][7],[DynStat.Lust(5)][8],[DynStat.Lust(5)][9],[DynStat.Lust(5)][10],[DynStat.Lust(5)][11],[DynStat.Lust(5)][12],[DynStat.Lust(5)][13],[DynStat.Lust(5)][14],[DynStat.Lust(5)][15]);
                  }
                  else if(int([DynStat.Lust(5)].length) == 17)
                  {
                     get_game().player.dynStats([DynStat.Lust(5)][0],[DynStat.Lust(5)][1],[DynStat.Lust(5)][2],[DynStat.Lust(5)][3],[DynStat.Lust(5)][4],[DynStat.Lust(5)][5],[DynStat.Lust(5)][6],[DynStat.Lust(5)][7],[DynStat.Lust(5)][8],[DynStat.Lust(5)][9],[DynStat.Lust(5)][10],[DynStat.Lust(5)][11],[DynStat.Lust(5)][12],[DynStat.Lust(5)][13],[DynStat.Lust(5)][14],[DynStat.Lust(5)][15],[DynStat.Lust(5)][16]);
                  }
                  else if(int([DynStat.Lust(5)].length) == 18)
                  {
                     get_game().player.dynStats([DynStat.Lust(5)][0],[DynStat.Lust(5)][1],[DynStat.Lust(5)][2],[DynStat.Lust(5)][3],[DynStat.Lust(5)][4],[DynStat.Lust(5)][5],[DynStat.Lust(5)][6],[DynStat.Lust(5)][7],[DynStat.Lust(5)][8],[DynStat.Lust(5)][9],[DynStat.Lust(5)][10],[DynStat.Lust(5)][11],[DynStat.Lust(5)][12],[DynStat.Lust(5)][13],[DynStat.Lust(5)][14],[DynStat.Lust(5)][15],[DynStat.Lust(5)][16],[DynStat.Lust(5)][17]);
                  }
                  else if(int([DynStat.Lust(5)].length) == 19)
                  {
                     get_game().player.dynStats([DynStat.Lust(5)][0],[DynStat.Lust(5)][1],[DynStat.Lust(5)][2],[DynStat.Lust(5)][3],[DynStat.Lust(5)][4],[DynStat.Lust(5)][5],[DynStat.Lust(5)][6],[DynStat.Lust(5)][7],[DynStat.Lust(5)][8],[DynStat.Lust(5)][9],[DynStat.Lust(5)][10],[DynStat.Lust(5)][11],[DynStat.Lust(5)][12],[DynStat.Lust(5)][13],[DynStat.Lust(5)][14],[DynStat.Lust(5)][15],[DynStat.Lust(5)][16],[DynStat.Lust(5)][17],[DynStat.Lust(5)][18]);
                  }
                  else
                  {
                     if(int([DynStat.Lust(5)].length) != 20)
                     {
                        throw "Too many rest arguments";
                     }
                     get_game().player.dynStats([DynStat.Lust(5)][0],[DynStat.Lust(5)][1],[DynStat.Lust(5)][2],[DynStat.Lust(5)][3],[DynStat.Lust(5)][4],[DynStat.Lust(5)][5],[DynStat.Lust(5)][6],[DynStat.Lust(5)][7],[DynStat.Lust(5)][8],[DynStat.Lust(5)][9],[DynStat.Lust(5)][10],[DynStat.Lust(5)][11],[DynStat.Lust(5)][12],[DynStat.Lust(5)][13],[DynStat.Lust(5)][14],[DynStat.Lust(5)][15],[DynStat.Lust(5)][16],[DynStat.Lust(5)][17],[DynStat.Lust(5)][18],[DynStat.Lust(5)][19]);
                  }
               }
               if(int(get_player().vaginas.length) > 0)
               {
                  outputText("当乳汁滑入你的阴唇之间时，你摩擦着双腿，这给你带来了远超预期的刺激。");
                  if(int([DynStat.Lust(5)].length) == 0)
                  {
                     get_game().player.dynStats();
                  }
                  else if(int([DynStat.Lust(5)].length) == 1)
                  {
                     get_game().player.dynStats([DynStat.Lust(5)][0]);
                  }
                  else if(int([DynStat.Lust(5)].length) == 2)
                  {
                     get_game().player.dynStats([DynStat.Lust(5)][0],[DynStat.Lust(5)][1]);
                  }
                  else if(int([DynStat.Lust(5)].length) == 3)
                  {
                     get_game().player.dynStats([DynStat.Lust(5)][0],[DynStat.Lust(5)][1],[DynStat.Lust(5)][2]);
                  }
                  else if(int([DynStat.Lust(5)].length) == 4)
                  {
                     get_game().player.dynStats([DynStat.Lust(5)][0],[DynStat.Lust(5)][1],[DynStat.Lust(5)][2],[DynStat.Lust(5)][3]);
                  }
                  else if(int([DynStat.Lust(5)].length) == 5)
                  {
                     get_game().player.dynStats([DynStat.Lust(5)][0],[DynStat.Lust(5)][1],[DynStat.Lust(5)][2],[DynStat.Lust(5)][3],[DynStat.Lust(5)][4]);
                  }
                  else if(int([DynStat.Lust(5)].length) == 6)
                  {
                     get_game().player.dynStats([DynStat.Lust(5)][0],[DynStat.Lust(5)][1],[DynStat.Lust(5)][2],[DynStat.Lust(5)][3],[DynStat.Lust(5)][4],[DynStat.Lust(5)][5]);
                  }
                  else if(int([DynStat.Lust(5)].length) == 7)
                  {
                     get_game().player.dynStats([DynStat.Lust(5)][0],[DynStat.Lust(5)][1],[DynStat.Lust(5)][2],[DynStat.Lust(5)][3],[DynStat.Lust(5)][4],[DynStat.Lust(5)][5],[DynStat.Lust(5)][6]);
                  }
                  else if(int([DynStat.Lust(5)].length) == 8)
                  {
                     get_game().player.dynStats([DynStat.Lust(5)][0],[DynStat.Lust(5)][1],[DynStat.Lust(5)][2],[DynStat.Lust(5)][3],[DynStat.Lust(5)][4],[DynStat.Lust(5)][5],[DynStat.Lust(5)][6],[DynStat.Lust(5)][7]);
                  }
                  else if(int([DynStat.Lust(5)].length) == 9)
                  {
                     get_game().player.dynStats([DynStat.Lust(5)][0],[DynStat.Lust(5)][1],[DynStat.Lust(5)][2],[DynStat.Lust(5)][3],[DynStat.Lust(5)][4],[DynStat.Lust(5)][5],[DynStat.Lust(5)][6],[DynStat.Lust(5)][7],[DynStat.Lust(5)][8]);
                  }
                  else if(int([DynStat.Lust(5)].length) == 10)
                  {
                     get_game().player.dynStats([DynStat.Lust(5)][0],[DynStat.Lust(5)][1],[DynStat.Lust(5)][2],[DynStat.Lust(5)][3],[DynStat.Lust(5)][4],[DynStat.Lust(5)][5],[DynStat.Lust(5)][6],[DynStat.Lust(5)][7],[DynStat.Lust(5)][8],[DynStat.Lust(5)][9]);
                  }
                  else if(int([DynStat.Lust(5)].length) == 11)
                  {
                     get_game().player.dynStats([DynStat.Lust(5)][0],[DynStat.Lust(5)][1],[DynStat.Lust(5)][2],[DynStat.Lust(5)][3],[DynStat.Lust(5)][4],[DynStat.Lust(5)][5],[DynStat.Lust(5)][6],[DynStat.Lust(5)][7],[DynStat.Lust(5)][8],[DynStat.Lust(5)][9],[DynStat.Lust(5)][10]);
                  }
                  else if(int([DynStat.Lust(5)].length) == 12)
                  {
                     get_game().player.dynStats([DynStat.Lust(5)][0],[DynStat.Lust(5)][1],[DynStat.Lust(5)][2],[DynStat.Lust(5)][3],[DynStat.Lust(5)][4],[DynStat.Lust(5)][5],[DynStat.Lust(5)][6],[DynStat.Lust(5)][7],[DynStat.Lust(5)][8],[DynStat.Lust(5)][9],[DynStat.Lust(5)][10],[DynStat.Lust(5)][11]);
                  }
                  else if(int([DynStat.Lust(5)].length) == 13)
                  {
                     get_game().player.dynStats([DynStat.Lust(5)][0],[DynStat.Lust(5)][1],[DynStat.Lust(5)][2],[DynStat.Lust(5)][3],[DynStat.Lust(5)][4],[DynStat.Lust(5)][5],[DynStat.Lust(5)][6],[DynStat.Lust(5)][7],[DynStat.Lust(5)][8],[DynStat.Lust(5)][9],[DynStat.Lust(5)][10],[DynStat.Lust(5)][11],[DynStat.Lust(5)][12]);
                  }
                  else if(int([DynStat.Lust(5)].length) == 14)
                  {
                     get_game().player.dynStats([DynStat.Lust(5)][0],[DynStat.Lust(5)][1],[DynStat.Lust(5)][2],[DynStat.Lust(5)][3],[DynStat.Lust(5)][4],[DynStat.Lust(5)][5],[DynStat.Lust(5)][6],[DynStat.Lust(5)][7],[DynStat.Lust(5)][8],[DynStat.Lust(5)][9],[DynStat.Lust(5)][10],[DynStat.Lust(5)][11],[DynStat.Lust(5)][12],[DynStat.Lust(5)][13]);
                  }
                  else if(int([DynStat.Lust(5)].length) == 15)
                  {
                     get_game().player.dynStats([DynStat.Lust(5)][0],[DynStat.Lust(5)][1],[DynStat.Lust(5)][2],[DynStat.Lust(5)][3],[DynStat.Lust(5)][4],[DynStat.Lust(5)][5],[DynStat.Lust(5)][6],[DynStat.Lust(5)][7],[DynStat.Lust(5)][8],[DynStat.Lust(5)][9],[DynStat.Lust(5)][10],[DynStat.Lust(5)][11],[DynStat.Lust(5)][12],[DynStat.Lust(5)][13],[DynStat.Lust(5)][14]);
                  }
                  else if(int([DynStat.Lust(5)].length) == 16)
                  {
                     get_game().player.dynStats([DynStat.Lust(5)][0],[DynStat.Lust(5)][1],[DynStat.Lust(5)][2],[DynStat.Lust(5)][3],[DynStat.Lust(5)][4],[DynStat.Lust(5)][5],[DynStat.Lust(5)][6],[DynStat.Lust(5)][7],[DynStat.Lust(5)][8],[DynStat.Lust(5)][9],[DynStat.Lust(5)][10],[DynStat.Lust(5)][11],[DynStat.Lust(5)][12],[DynStat.Lust(5)][13],[DynStat.Lust(5)][14],[DynStat.Lust(5)][15]);
                  }
                  else if(int([DynStat.Lust(5)].length) == 17)
                  {
                     get_game().player.dynStats([DynStat.Lust(5)][0],[DynStat.Lust(5)][1],[DynStat.Lust(5)][2],[DynStat.Lust(5)][3],[DynStat.Lust(5)][4],[DynStat.Lust(5)][5],[DynStat.Lust(5)][6],[DynStat.Lust(5)][7],[DynStat.Lust(5)][8],[DynStat.Lust(5)][9],[DynStat.Lust(5)][10],[DynStat.Lust(5)][11],[DynStat.Lust(5)][12],[DynStat.Lust(5)][13],[DynStat.Lust(5)][14],[DynStat.Lust(5)][15],[DynStat.Lust(5)][16]);
                  }
                  else if(int([DynStat.Lust(5)].length) == 18)
                  {
                     get_game().player.dynStats([DynStat.Lust(5)][0],[DynStat.Lust(5)][1],[DynStat.Lust(5)][2],[DynStat.Lust(5)][3],[DynStat.Lust(5)][4],[DynStat.Lust(5)][5],[DynStat.Lust(5)][6],[DynStat.Lust(5)][7],[DynStat.Lust(5)][8],[DynStat.Lust(5)][9],[DynStat.Lust(5)][10],[DynStat.Lust(5)][11],[DynStat.Lust(5)][12],[DynStat.Lust(5)][13],[DynStat.Lust(5)][14],[DynStat.Lust(5)][15],[DynStat.Lust(5)][16],[DynStat.Lust(5)][17]);
                  }
                  else if(int([DynStat.Lust(5)].length) == 19)
                  {
                     get_game().player.dynStats([DynStat.Lust(5)][0],[DynStat.Lust(5)][1],[DynStat.Lust(5)][2],[DynStat.Lust(5)][3],[DynStat.Lust(5)][4],[DynStat.Lust(5)][5],[DynStat.Lust(5)][6],[DynStat.Lust(5)][7],[DynStat.Lust(5)][8],[DynStat.Lust(5)][9],[DynStat.Lust(5)][10],[DynStat.Lust(5)][11],[DynStat.Lust(5)][12],[DynStat.Lust(5)][13],[DynStat.Lust(5)][14],[DynStat.Lust(5)][15],[DynStat.Lust(5)][16],[DynStat.Lust(5)][17],[DynStat.Lust(5)][18]);
                  }
                  else
                  {
                     if(int([DynStat.Lust(5)].length) != 20)
                     {
                        throw "Too many rest arguments";
                     }
                     get_game().player.dynStats([DynStat.Lust(5)][0],[DynStat.Lust(5)][1],[DynStat.Lust(5)][2],[DynStat.Lust(5)][3],[DynStat.Lust(5)][4],[DynStat.Lust(5)][5],[DynStat.Lust(5)][6],[DynStat.Lust(5)][7],[DynStat.Lust(5)][8],[DynStat.Lust(5)][9],[DynStat.Lust(5)][10],[DynStat.Lust(5)][11],[DynStat.Lust(5)][12],[DynStat.Lust(5)][13],[DynStat.Lust(5)][14],[DynStat.Lust(5)][15],[DynStat.Lust(5)][16],[DynStat.Lust(5)][17],[DynStat.Lust(5)][18],[DynStat.Lust(5)][19]);
                  }
               }
            }
            get_player().takeLustDamage(7 + get_player().sens / 20,true);
            if(get_player().biggestLactation() > 1)
            {
               outputText("你的" + get_player().allBreastsDescript() + "也产生了共鸣，滴下了乳汁。");
            }
         }
      }
      
      public function lustAura() : void
      {
         var _loc1_:* = null as CoC;
         var _loc2_:* = null as Array;
         outputText("女恶魔闭上眼睛，皱起眉头，似乎在集中精神。随后，她那红色的眼眸猛地睁开，嘴角勾起一抹微笑，伸出舌头舔了舔嘴唇。她周围的空气变得越来越温暖，也越来越充满麝香的气息，仿佛她的存在让空气中都弥漫着情欲的味道。");
         if(hasStatusEffect(StatusEffects.LustAura))
         {
            outputText("随着空气中欲望的味道钻进你的身体，你的双眼因为突如其来的感觉而变得迷离。那强烈的气息很快消退，但它已经达到了目的。");
            _loc1_ = get_game();
            _loc2_ = [DynStat.Lust(8 + (int(get_player().lib / 20 + get_player().cor / 25)))];
            if(int(_loc2_.length) == 0)
            {
               _loc1_.player.dynStats();
            }
            else if(int(_loc2_.length) == 1)
            {
               _loc1_.player.dynStats(_loc2_[0]);
            }
            else if(int(_loc2_.length) == 2)
            {
               _loc1_.player.dynStats(_loc2_[0],_loc2_[1]);
            }
            else if(int(_loc2_.length) == 3)
            {
               _loc1_.player.dynStats(_loc2_[0],_loc2_[1],_loc2_[2]);
            }
            else if(int(_loc2_.length) == 4)
            {
               _loc1_.player.dynStats(_loc2_[0],_loc2_[1],_loc2_[2],_loc2_[3]);
            }
            else if(int(_loc2_.length) == 5)
            {
               _loc1_.player.dynStats(_loc2_[0],_loc2_[1],_loc2_[2],_loc2_[3],_loc2_[4]);
            }
            else if(int(_loc2_.length) == 6)
            {
               _loc1_.player.dynStats(_loc2_[0],_loc2_[1],_loc2_[2],_loc2_[3],_loc2_[4],_loc2_[5]);
            }
            else if(int(_loc2_.length) == 7)
            {
               _loc1_.player.dynStats(_loc2_[0],_loc2_[1],_loc2_[2],_loc2_[3],_loc2_[4],_loc2_[5],_loc2_[6]);
            }
            else if(int(_loc2_.length) == 8)
            {
               _loc1_.player.dynStats(_loc2_[0],_loc2_[1],_loc2_[2],_loc2_[3],_loc2_[4],_loc2_[5],_loc2_[6],_loc2_[7]);
            }
            else if(int(_loc2_.length) == 9)
            {
               _loc1_.player.dynStats(_loc2_[0],_loc2_[1],_loc2_[2],_loc2_[3],_loc2_[4],_loc2_[5],_loc2_[6],_loc2_[7],_loc2_[8]);
            }
            else if(int(_loc2_.length) == 10)
            {
               _loc1_.player.dynStats(_loc2_[0],_loc2_[1],_loc2_[2],_loc2_[3],_loc2_[4],_loc2_[5],_loc2_[6],_loc2_[7],_loc2_[8],_loc2_[9]);
            }
            else if(int(_loc2_.length) == 11)
            {
               _loc1_.player.dynStats(_loc2_[0],_loc2_[1],_loc2_[2],_loc2_[3],_loc2_[4],_loc2_[5],_loc2_[6],_loc2_[7],_loc2_[8],_loc2_[9],_loc2_[10]);
            }
            else if(int(_loc2_.length) == 12)
            {
               _loc1_.player.dynStats(_loc2_[0],_loc2_[1],_loc2_[2],_loc2_[3],_loc2_[4],_loc2_[5],_loc2_[6],_loc2_[7],_loc2_[8],_loc2_[9],_loc2_[10],_loc2_[11]);
            }
            else if(int(_loc2_.length) == 13)
            {
               _loc1_.player.dynStats(_loc2_[0],_loc2_[1],_loc2_[2],_loc2_[3],_loc2_[4],_loc2_[5],_loc2_[6],_loc2_[7],_loc2_[8],_loc2_[9],_loc2_[10],_loc2_[11],_loc2_[12]);
            }
            else if(int(_loc2_.length) == 14)
            {
               _loc1_.player.dynStats(_loc2_[0],_loc2_[1],_loc2_[2],_loc2_[3],_loc2_[4],_loc2_[5],_loc2_[6],_loc2_[7],_loc2_[8],_loc2_[9],_loc2_[10],_loc2_[11],_loc2_[12],_loc2_[13]);
            }
            else if(int(_loc2_.length) == 15)
            {
               _loc1_.player.dynStats(_loc2_[0],_loc2_[1],_loc2_[2],_loc2_[3],_loc2_[4],_loc2_[5],_loc2_[6],_loc2_[7],_loc2_[8],_loc2_[9],_loc2_[10],_loc2_[11],_loc2_[12],_loc2_[13],_loc2_[14]);
            }
            else if(int(_loc2_.length) == 16)
            {
               _loc1_.player.dynStats(_loc2_[0],_loc2_[1],_loc2_[2],_loc2_[3],_loc2_[4],_loc2_[5],_loc2_[6],_loc2_[7],_loc2_[8],_loc2_[9],_loc2_[10],_loc2_[11],_loc2_[12],_loc2_[13],_loc2_[14],_loc2_[15]);
            }
            else if(int(_loc2_.length) == 17)
            {
               _loc1_.player.dynStats(_loc2_[0],_loc2_[1],_loc2_[2],_loc2_[3],_loc2_[4],_loc2_[5],_loc2_[6],_loc2_[7],_loc2_[8],_loc2_[9],_loc2_[10],_loc2_[11],_loc2_[12],_loc2_[13],_loc2_[14],_loc2_[15],_loc2_[16]);
            }
            else if(int(_loc2_.length) == 18)
            {
               _loc1_.player.dynStats(_loc2_[0],_loc2_[1],_loc2_[2],_loc2_[3],_loc2_[4],_loc2_[5],_loc2_[6],_loc2_[7],_loc2_[8],_loc2_[9],_loc2_[10],_loc2_[11],_loc2_[12],_loc2_[13],_loc2_[14],_loc2_[15],_loc2_[16],_loc2_[17]);
            }
            else if(int(_loc2_.length) == 19)
            {
               _loc1_.player.dynStats(_loc2_[0],_loc2_[1],_loc2_[2],_loc2_[3],_loc2_[4],_loc2_[5],_loc2_[6],_loc2_[7],_loc2_[8],_loc2_[9],_loc2_[10],_loc2_[11],_loc2_[12],_loc2_[13],_loc2_[14],_loc2_[15],_loc2_[16],_loc2_[17],_loc2_[18]);
            }
            else
            {
               if(int(_loc2_.length) != 20)
               {
                  throw "Too many rest arguments";
               }
               _loc1_.player.dynStats(_loc2_[0],_loc2_[1],_loc2_[2],_loc2_[3],_loc2_[4],_loc2_[5],_loc2_[6],_loc2_[7],_loc2_[8],_loc2_[9],_loc2_[10],_loc2_[11],_loc2_[12],_loc2_[13],_loc2_[14],_loc2_[15],_loc2_[16],_loc2_[17],_loc2_[18],_loc2_[19]);
            }
         }
         else
         {
            createStatusEffect(StatusEffects.LustAura,0,0,0,0);
         }
      }
      
      override public function defeated(param1:Boolean) : void
      {
         factory.omnibusOverseer.winAgainstOmnibus();
      }
   }
}

