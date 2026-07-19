package classes.scenes.dungeons.factory
{
   import classes.CoC;
   import classes.CockTypesEnum;
   import classes.DynStat;
   import classes.Monster;
   import classes.Output;
   import classes.Player;
   import classes.StatusEffects;
   import classes._FlagDict.FlagDict_Impl_;
   import classes.internals.MonsterAI;
   import classes.internals.Utils;
   import classes.internals.WeightedChoice;
   import classes.items.Armor;
   import classes.items.ArmorLib;
   import classes.items.ConsumableLib;
   import classes.items.Shield;
   import classes.items.armors.LustyMaidensArmor;
   import classes.items.armors.NaughtyNunsHabit;
   import classes.items.shields.DragonShellShield;
   import classes.scenes.combat.Combat;
   import classes.scenes.combat.CombatRange;
   import coc.view.CoCButton;
   import flash.Boot;
   import haxe.IMap;
   
   public class IncubusMechanic extends Monster
   {
      
      public function IncubusMechanic()
      {
         if(Boot.skip_constructor)
         {
            return;
         }
         super();
         set_a("");
         set_short("incubus mechanic");
         imageName = "incubusmechanic";
         set_long("你面前的恶魔只穿着被剪短的牛仔背带裤。上面沾满了油渍和其他奇怪液体的污渍，看起来破烂不堪。裤裆处破了一个大洞，让恶魔那长达一英尺的阴茎可以自由地悬挂在外面。他的皮肤是浅紫色的，完美无瑕，与他邋遢的衣着形成了鲜明的对比。他的脸庞粗犷而英俊，头上扎着简单的黑色马尾辫，额头上长着两根像扭曲的树干一样的大角。他的下巴上留着一撮窄窄的山羊胡，被巧妙地编成了辫子。他总是带着一种傲慢的微笑，给人一种极度自信的感觉。");
         set_race("Demon");
         createCock(12,1.75,CockTypesEnum.DEMON);
         balls = 2;
         ballSize = 2;
         cumMultiplier = 3;
         createBreastRow(0);
         ass.analLooseness = 4;
         ass.analWetness = 5;
         set_tallness(Utils.rand(9) + 70);
         hips.rating = 6;
         butt.rating = 2;
         lowerBody.type = 6;
         skin.tone = "light purple";
         hair.color = "black";
         hair.length = 12;
         initStrTouSpeInte(65,40,45,85);
         initLibSensCor(80,70,100);
         set_weaponName("claws");
         set_weaponVerb("claw");
         set_weaponAttack(10);
         set_weaponPerk([]);
         set_weaponValue(150);
         set_armorName("demonic skin");
         set_armorDef(10);
         bonusHP = 150;
         set_lust(50);
         lustVuln = 0.5;
         temperment = 3;
         level = 8;
         set_drop(new WeightedChoice(get_consumables().GROPLUS,1));
         set_gems(Utils.rand(25) + 10);
         additionalXP = 50;
         if(FlagDict_Impl_.arrayReadInt(get_flags(),1239) > 0)
         {
            set_gems(get_gems() + (Utils.rand(25) + 50));
            additionalXP += 50;
            level += 13;
            bonusHP += 225;
            set_str(get_str() + 25);
            set_tou(get_tou() + 20);
            set_spe(get_spe() + 15);
            set_inte(get_inte() + 20);
            set_weaponAttack(get_weaponAttack() + 5);
            set_HP(maxHP());
         }
         tail.type = 3;
         wings.type = 6;
         checkMonster();
      }
      
      public function wonInDungeon3(param1:Boolean, param2:Boolean = false) : void
      {
         if(FlagDict_Impl_.arrayReadInt(get_flags(),1272) > 0)
         {
            get_game().lethicesKeep.incubusMechanic.doLossIncubus();
         }
         else
         {
            get_game().lethicesKeep.incubusMechanic.mechanicFuckedYouUp(param1,param2);
         }
      }
      
      public function wonInDungeon1(param1:Boolean, param2:Boolean = false) : void
      {
         if(param2)
         {
            outputText("[pg]你的敌人似乎并不在乎……");
            doNext(get_game().combat.endLustLoss);
         }
         else
         {
            get_game().lethicesKeep.incubusMechanic.doLossIncubus();
         }
      }
      
      override public function won(param1:Boolean, param2:Boolean = false) : void
      {
         if(FlagDict_Impl_.arrayReadInt(get_flags(),1239) == 0)
         {
            wonInDungeon1(param1,param2);
         }
         else
         {
            wonInDungeon3(param1,param2);
         }
      }
      
      public function spoogeAttack() : void
      {
         if(hasStatusEffect(StatusEffects.Blind))
         {
            outputText(get_capitalA() + Utils.cnName(get_short()) + "淫荡地挺动着臀部，然后朝你的方向猛烈地射精！谢天谢地，由于他目前处于失明状态，他的瞄准偏了。");
            return;
         }
         outputText("你的恶魔敌人把手放在脑后，淫荡地向你挺动着臀部。你睁大了眼睛，只见一团精液从恶魔的肉棒中喷发而出，直直地朝你飞来。");
         if(get_player().get_shield() is DragonShellShield && Utils.rand(2) == 0)
         {
            outputText("你的盾牌成功吸收了这次攻击！");
            return;
         }
         outputText("你尽力躲闪，但还是有一些落在了你的");
         switch(Utils.rand(3))
         {
            case 0:
               outputText("脸上。黏糊糊的恶魔之种在你身上蠕动滑行，仿佛有自己的意识一般，强行钻进你的嘴巴和鼻子里！你能感觉到它在你体内游走，尽力为你主人的到来做准备。");
               if(int([DynStat.Lust(3)].length) == 0)
               {
                  get_game().player.dynStats();
               }
               else if(int([DynStat.Lust(3)].length) == 1)
               {
                  get_game().player.dynStats([DynStat.Lust(3)][0]);
               }
               else if(int([DynStat.Lust(3)].length) == 2)
               {
                  get_game().player.dynStats([DynStat.Lust(3)][0],[DynStat.Lust(3)][1]);
               }
               else if(int([DynStat.Lust(3)].length) == 3)
               {
                  get_game().player.dynStats([DynStat.Lust(3)][0],[DynStat.Lust(3)][1],[DynStat.Lust(3)][2]);
               }
               else if(int([DynStat.Lust(3)].length) == 4)
               {
                  get_game().player.dynStats([DynStat.Lust(3)][0],[DynStat.Lust(3)][1],[DynStat.Lust(3)][2],[DynStat.Lust(3)][3]);
               }
               else if(int([DynStat.Lust(3)].length) == 5)
               {
                  get_game().player.dynStats([DynStat.Lust(3)][0],[DynStat.Lust(3)][1],[DynStat.Lust(3)][2],[DynStat.Lust(3)][3],[DynStat.Lust(3)][4]);
               }
               else if(int([DynStat.Lust(3)].length) == 6)
               {
                  get_game().player.dynStats([DynStat.Lust(3)][0],[DynStat.Lust(3)][1],[DynStat.Lust(3)][2],[DynStat.Lust(3)][3],[DynStat.Lust(3)][4],[DynStat.Lust(3)][5]);
               }
               else if(int([DynStat.Lust(3)].length) == 7)
               {
                  get_game().player.dynStats([DynStat.Lust(3)][0],[DynStat.Lust(3)][1],[DynStat.Lust(3)][2],[DynStat.Lust(3)][3],[DynStat.Lust(3)][4],[DynStat.Lust(3)][5],[DynStat.Lust(3)][6]);
               }
               else if(int([DynStat.Lust(3)].length) == 8)
               {
                  get_game().player.dynStats([DynStat.Lust(3)][0],[DynStat.Lust(3)][1],[DynStat.Lust(3)][2],[DynStat.Lust(3)][3],[DynStat.Lust(3)][4],[DynStat.Lust(3)][5],[DynStat.Lust(3)][6],[DynStat.Lust(3)][7]);
               }
               else if(int([DynStat.Lust(3)].length) == 9)
               {
                  get_game().player.dynStats([DynStat.Lust(3)][0],[DynStat.Lust(3)][1],[DynStat.Lust(3)][2],[DynStat.Lust(3)][3],[DynStat.Lust(3)][4],[DynStat.Lust(3)][5],[DynStat.Lust(3)][6],[DynStat.Lust(3)][7],[DynStat.Lust(3)][8]);
               }
               else if(int([DynStat.Lust(3)].length) == 10)
               {
                  get_game().player.dynStats([DynStat.Lust(3)][0],[DynStat.Lust(3)][1],[DynStat.Lust(3)][2],[DynStat.Lust(3)][3],[DynStat.Lust(3)][4],[DynStat.Lust(3)][5],[DynStat.Lust(3)][6],[DynStat.Lust(3)][7],[DynStat.Lust(3)][8],[DynStat.Lust(3)][9]);
               }
               else if(int([DynStat.Lust(3)].length) == 11)
               {
                  get_game().player.dynStats([DynStat.Lust(3)][0],[DynStat.Lust(3)][1],[DynStat.Lust(3)][2],[DynStat.Lust(3)][3],[DynStat.Lust(3)][4],[DynStat.Lust(3)][5],[DynStat.Lust(3)][6],[DynStat.Lust(3)][7],[DynStat.Lust(3)][8],[DynStat.Lust(3)][9],[DynStat.Lust(3)][10]);
               }
               else if(int([DynStat.Lust(3)].length) == 12)
               {
                  get_game().player.dynStats([DynStat.Lust(3)][0],[DynStat.Lust(3)][1],[DynStat.Lust(3)][2],[DynStat.Lust(3)][3],[DynStat.Lust(3)][4],[DynStat.Lust(3)][5],[DynStat.Lust(3)][6],[DynStat.Lust(3)][7],[DynStat.Lust(3)][8],[DynStat.Lust(3)][9],[DynStat.Lust(3)][10],[DynStat.Lust(3)][11]);
               }
               else if(int([DynStat.Lust(3)].length) == 13)
               {
                  get_game().player.dynStats([DynStat.Lust(3)][0],[DynStat.Lust(3)][1],[DynStat.Lust(3)][2],[DynStat.Lust(3)][3],[DynStat.Lust(3)][4],[DynStat.Lust(3)][5],[DynStat.Lust(3)][6],[DynStat.Lust(3)][7],[DynStat.Lust(3)][8],[DynStat.Lust(3)][9],[DynStat.Lust(3)][10],[DynStat.Lust(3)][11],[DynStat.Lust(3)][12]);
               }
               else if(int([DynStat.Lust(3)].length) == 14)
               {
                  get_game().player.dynStats([DynStat.Lust(3)][0],[DynStat.Lust(3)][1],[DynStat.Lust(3)][2],[DynStat.Lust(3)][3],[DynStat.Lust(3)][4],[DynStat.Lust(3)][5],[DynStat.Lust(3)][6],[DynStat.Lust(3)][7],[DynStat.Lust(3)][8],[DynStat.Lust(3)][9],[DynStat.Lust(3)][10],[DynStat.Lust(3)][11],[DynStat.Lust(3)][12],[DynStat.Lust(3)][13]);
               }
               else if(int([DynStat.Lust(3)].length) == 15)
               {
                  get_game().player.dynStats([DynStat.Lust(3)][0],[DynStat.Lust(3)][1],[DynStat.Lust(3)][2],[DynStat.Lust(3)][3],[DynStat.Lust(3)][4],[DynStat.Lust(3)][5],[DynStat.Lust(3)][6],[DynStat.Lust(3)][7],[DynStat.Lust(3)][8],[DynStat.Lust(3)][9],[DynStat.Lust(3)][10],[DynStat.Lust(3)][11],[DynStat.Lust(3)][12],[DynStat.Lust(3)][13],[DynStat.Lust(3)][14]);
               }
               else if(int([DynStat.Lust(3)].length) == 16)
               {
                  get_game().player.dynStats([DynStat.Lust(3)][0],[DynStat.Lust(3)][1],[DynStat.Lust(3)][2],[DynStat.Lust(3)][3],[DynStat.Lust(3)][4],[DynStat.Lust(3)][5],[DynStat.Lust(3)][6],[DynStat.Lust(3)][7],[DynStat.Lust(3)][8],[DynStat.Lust(3)][9],[DynStat.Lust(3)][10],[DynStat.Lust(3)][11],[DynStat.Lust(3)][12],[DynStat.Lust(3)][13],[DynStat.Lust(3)][14],[DynStat.Lust(3)][15]);
               }
               else if(int([DynStat.Lust(3)].length) == 17)
               {
                  get_game().player.dynStats([DynStat.Lust(3)][0],[DynStat.Lust(3)][1],[DynStat.Lust(3)][2],[DynStat.Lust(3)][3],[DynStat.Lust(3)][4],[DynStat.Lust(3)][5],[DynStat.Lust(3)][6],[DynStat.Lust(3)][7],[DynStat.Lust(3)][8],[DynStat.Lust(3)][9],[DynStat.Lust(3)][10],[DynStat.Lust(3)][11],[DynStat.Lust(3)][12],[DynStat.Lust(3)][13],[DynStat.Lust(3)][14],[DynStat.Lust(3)][15],[DynStat.Lust(3)][16]);
               }
               else if(int([DynStat.Lust(3)].length) == 18)
               {
                  get_game().player.dynStats([DynStat.Lust(3)][0],[DynStat.Lust(3)][1],[DynStat.Lust(3)][2],[DynStat.Lust(3)][3],[DynStat.Lust(3)][4],[DynStat.Lust(3)][5],[DynStat.Lust(3)][6],[DynStat.Lust(3)][7],[DynStat.Lust(3)][8],[DynStat.Lust(3)][9],[DynStat.Lust(3)][10],[DynStat.Lust(3)][11],[DynStat.Lust(3)][12],[DynStat.Lust(3)][13],[DynStat.Lust(3)][14],[DynStat.Lust(3)][15],[DynStat.Lust(3)][16],[DynStat.Lust(3)][17]);
               }
               else if(int([DynStat.Lust(3)].length) == 19)
               {
                  get_game().player.dynStats([DynStat.Lust(3)][0],[DynStat.Lust(3)][1],[DynStat.Lust(3)][2],[DynStat.Lust(3)][3],[DynStat.Lust(3)][4],[DynStat.Lust(3)][5],[DynStat.Lust(3)][6],[DynStat.Lust(3)][7],[DynStat.Lust(3)][8],[DynStat.Lust(3)][9],[DynStat.Lust(3)][10],[DynStat.Lust(3)][11],[DynStat.Lust(3)][12],[DynStat.Lust(3)][13],[DynStat.Lust(3)][14],[DynStat.Lust(3)][15],[DynStat.Lust(3)][16],[DynStat.Lust(3)][17],[DynStat.Lust(3)][18]);
               }
               else
               {
                  if(int([DynStat.Lust(3)].length) != 20)
                  {
                     throw "Too many rest arguments";
                  }
                  get_game().player.dynStats([DynStat.Lust(3)][0],[DynStat.Lust(3)][1],[DynStat.Lust(3)][2],[DynStat.Lust(3)][3],[DynStat.Lust(3)][4],[DynStat.Lust(3)][5],[DynStat.Lust(3)][6],[DynStat.Lust(3)][7],[DynStat.Lust(3)][8],[DynStat.Lust(3)][9],[DynStat.Lust(3)][10],[DynStat.Lust(3)][11],[DynStat.Lust(3)][12],[DynStat.Lust(3)][13],[DynStat.Lust(3)][14],[DynStat.Lust(3)][15],[DynStat.Lust(3)][16],[DynStat.Lust(3)][17],[DynStat.Lust(3)][18],[DynStat.Lust(3)][19]);
               }
               if(!get_player().hasStatusEffect(StatusEffects.DemonSeed))
               {
                  get_player().createStatusEffect(StatusEffects.DemonSeed,5,0,0,0);
               }
               else
               {
                  get_player().addStatusValue(StatusEffects.DemonSeed,1,7);
               }
               get_player().slimeFeed();
               break;
            case 1:
               if(get_player().hasFuckableNipples())
               {
                  outputText(allBreastsDescript() + "上。黏糊糊的恶魔之种在你身上蠕动滑行，仿佛有自己的意识一般，强行钻进你张开的乳头里。你能感觉到它在你体内游走，尽力为你主人的到来做准备。");
                  if(int([DynStat.Lust(3)].length) == 0)
                  {
                     get_game().player.dynStats();
                  }
                  else if(int([DynStat.Lust(3)].length) == 1)
                  {
                     get_game().player.dynStats([DynStat.Lust(3)][0]);
                  }
                  else if(int([DynStat.Lust(3)].length) == 2)
                  {
                     get_game().player.dynStats([DynStat.Lust(3)][0],[DynStat.Lust(3)][1]);
                  }
                  else if(int([DynStat.Lust(3)].length) == 3)
                  {
                     get_game().player.dynStats([DynStat.Lust(3)][0],[DynStat.Lust(3)][1],[DynStat.Lust(3)][2]);
                  }
                  else if(int([DynStat.Lust(3)].length) == 4)
                  {
                     get_game().player.dynStats([DynStat.Lust(3)][0],[DynStat.Lust(3)][1],[DynStat.Lust(3)][2],[DynStat.Lust(3)][3]);
                  }
                  else if(int([DynStat.Lust(3)].length) == 5)
                  {
                     get_game().player.dynStats([DynStat.Lust(3)][0],[DynStat.Lust(3)][1],[DynStat.Lust(3)][2],[DynStat.Lust(3)][3],[DynStat.Lust(3)][4]);
                  }
                  else if(int([DynStat.Lust(3)].length) == 6)
                  {
                     get_game().player.dynStats([DynStat.Lust(3)][0],[DynStat.Lust(3)][1],[DynStat.Lust(3)][2],[DynStat.Lust(3)][3],[DynStat.Lust(3)][4],[DynStat.Lust(3)][5]);
                  }
                  else if(int([DynStat.Lust(3)].length) == 7)
                  {
                     get_game().player.dynStats([DynStat.Lust(3)][0],[DynStat.Lust(3)][1],[DynStat.Lust(3)][2],[DynStat.Lust(3)][3],[DynStat.Lust(3)][4],[DynStat.Lust(3)][5],[DynStat.Lust(3)][6]);
                  }
                  else if(int([DynStat.Lust(3)].length) == 8)
                  {
                     get_game().player.dynStats([DynStat.Lust(3)][0],[DynStat.Lust(3)][1],[DynStat.Lust(3)][2],[DynStat.Lust(3)][3],[DynStat.Lust(3)][4],[DynStat.Lust(3)][5],[DynStat.Lust(3)][6],[DynStat.Lust(3)][7]);
                  }
                  else if(int([DynStat.Lust(3)].length) == 9)
                  {
                     get_game().player.dynStats([DynStat.Lust(3)][0],[DynStat.Lust(3)][1],[DynStat.Lust(3)][2],[DynStat.Lust(3)][3],[DynStat.Lust(3)][4],[DynStat.Lust(3)][5],[DynStat.Lust(3)][6],[DynStat.Lust(3)][7],[DynStat.Lust(3)][8]);
                  }
                  else if(int([DynStat.Lust(3)].length) == 10)
                  {
                     get_game().player.dynStats([DynStat.Lust(3)][0],[DynStat.Lust(3)][1],[DynStat.Lust(3)][2],[DynStat.Lust(3)][3],[DynStat.Lust(3)][4],[DynStat.Lust(3)][5],[DynStat.Lust(3)][6],[DynStat.Lust(3)][7],[DynStat.Lust(3)][8],[DynStat.Lust(3)][9]);
                  }
                  else if(int([DynStat.Lust(3)].length) == 11)
                  {
                     get_game().player.dynStats([DynStat.Lust(3)][0],[DynStat.Lust(3)][1],[DynStat.Lust(3)][2],[DynStat.Lust(3)][3],[DynStat.Lust(3)][4],[DynStat.Lust(3)][5],[DynStat.Lust(3)][6],[DynStat.Lust(3)][7],[DynStat.Lust(3)][8],[DynStat.Lust(3)][9],[DynStat.Lust(3)][10]);
                  }
                  else if(int([DynStat.Lust(3)].length) == 12)
                  {
                     get_game().player.dynStats([DynStat.Lust(3)][0],[DynStat.Lust(3)][1],[DynStat.Lust(3)][2],[DynStat.Lust(3)][3],[DynStat.Lust(3)][4],[DynStat.Lust(3)][5],[DynStat.Lust(3)][6],[DynStat.Lust(3)][7],[DynStat.Lust(3)][8],[DynStat.Lust(3)][9],[DynStat.Lust(3)][10],[DynStat.Lust(3)][11]);
                  }
                  else if(int([DynStat.Lust(3)].length) == 13)
                  {
                     get_game().player.dynStats([DynStat.Lust(3)][0],[DynStat.Lust(3)][1],[DynStat.Lust(3)][2],[DynStat.Lust(3)][3],[DynStat.Lust(3)][4],[DynStat.Lust(3)][5],[DynStat.Lust(3)][6],[DynStat.Lust(3)][7],[DynStat.Lust(3)][8],[DynStat.Lust(3)][9],[DynStat.Lust(3)][10],[DynStat.Lust(3)][11],[DynStat.Lust(3)][12]);
                  }
                  else if(int([DynStat.Lust(3)].length) == 14)
                  {
                     get_game().player.dynStats([DynStat.Lust(3)][0],[DynStat.Lust(3)][1],[DynStat.Lust(3)][2],[DynStat.Lust(3)][3],[DynStat.Lust(3)][4],[DynStat.Lust(3)][5],[DynStat.Lust(3)][6],[DynStat.Lust(3)][7],[DynStat.Lust(3)][8],[DynStat.Lust(3)][9],[DynStat.Lust(3)][10],[DynStat.Lust(3)][11],[DynStat.Lust(3)][12],[DynStat.Lust(3)][13]);
                  }
                  else if(int([DynStat.Lust(3)].length) == 15)
                  {
                     get_game().player.dynStats([DynStat.Lust(3)][0],[DynStat.Lust(3)][1],[DynStat.Lust(3)][2],[DynStat.Lust(3)][3],[DynStat.Lust(3)][4],[DynStat.Lust(3)][5],[DynStat.Lust(3)][6],[DynStat.Lust(3)][7],[DynStat.Lust(3)][8],[DynStat.Lust(3)][9],[DynStat.Lust(3)][10],[DynStat.Lust(3)][11],[DynStat.Lust(3)][12],[DynStat.Lust(3)][13],[DynStat.Lust(3)][14]);
                  }
                  else if(int([DynStat.Lust(3)].length) == 16)
                  {
                     get_game().player.dynStats([DynStat.Lust(3)][0],[DynStat.Lust(3)][1],[DynStat.Lust(3)][2],[DynStat.Lust(3)][3],[DynStat.Lust(3)][4],[DynStat.Lust(3)][5],[DynStat.Lust(3)][6],[DynStat.Lust(3)][7],[DynStat.Lust(3)][8],[DynStat.Lust(3)][9],[DynStat.Lust(3)][10],[DynStat.Lust(3)][11],[DynStat.Lust(3)][12],[DynStat.Lust(3)][13],[DynStat.Lust(3)][14],[DynStat.Lust(3)][15]);
                  }
                  else if(int([DynStat.Lust(3)].length) == 17)
                  {
                     get_game().player.dynStats([DynStat.Lust(3)][0],[DynStat.Lust(3)][1],[DynStat.Lust(3)][2],[DynStat.Lust(3)][3],[DynStat.Lust(3)][4],[DynStat.Lust(3)][5],[DynStat.Lust(3)][6],[DynStat.Lust(3)][7],[DynStat.Lust(3)][8],[DynStat.Lust(3)][9],[DynStat.Lust(3)][10],[DynStat.Lust(3)][11],[DynStat.Lust(3)][12],[DynStat.Lust(3)][13],[DynStat.Lust(3)][14],[DynStat.Lust(3)][15],[DynStat.Lust(3)][16]);
                  }
                  else if(int([DynStat.Lust(3)].length) == 18)
                  {
                     get_game().player.dynStats([DynStat.Lust(3)][0],[DynStat.Lust(3)][1],[DynStat.Lust(3)][2],[DynStat.Lust(3)][3],[DynStat.Lust(3)][4],[DynStat.Lust(3)][5],[DynStat.Lust(3)][6],[DynStat.Lust(3)][7],[DynStat.Lust(3)][8],[DynStat.Lust(3)][9],[DynStat.Lust(3)][10],[DynStat.Lust(3)][11],[DynStat.Lust(3)][12],[DynStat.Lust(3)][13],[DynStat.Lust(3)][14],[DynStat.Lust(3)][15],[DynStat.Lust(3)][16],[DynStat.Lust(3)][17]);
                  }
                  else if(int([DynStat.Lust(3)].length) == 19)
                  {
                     get_game().player.dynStats([DynStat.Lust(3)][0],[DynStat.Lust(3)][1],[DynStat.Lust(3)][2],[DynStat.Lust(3)][3],[DynStat.Lust(3)][4],[DynStat.Lust(3)][5],[DynStat.Lust(3)][6],[DynStat.Lust(3)][7],[DynStat.Lust(3)][8],[DynStat.Lust(3)][9],[DynStat.Lust(3)][10],[DynStat.Lust(3)][11],[DynStat.Lust(3)][12],[DynStat.Lust(3)][13],[DynStat.Lust(3)][14],[DynStat.Lust(3)][15],[DynStat.Lust(3)][16],[DynStat.Lust(3)][17],[DynStat.Lust(3)][18]);
                  }
                  else
                  {
                     if(int([DynStat.Lust(3)].length) != 20)
                     {
                        throw "Too many rest arguments";
                     }
                     get_game().player.dynStats([DynStat.Lust(3)][0],[DynStat.Lust(3)][1],[DynStat.Lust(3)][2],[DynStat.Lust(3)][3],[DynStat.Lust(3)][4],[DynStat.Lust(3)][5],[DynStat.Lust(3)][6],[DynStat.Lust(3)][7],[DynStat.Lust(3)][8],[DynStat.Lust(3)][9],[DynStat.Lust(3)][10],[DynStat.Lust(3)][11],[DynStat.Lust(3)][12],[DynStat.Lust(3)][13],[DynStat.Lust(3)][14],[DynStat.Lust(3)][15],[DynStat.Lust(3)][16],[DynStat.Lust(3)][17],[DynStat.Lust(3)][18],[DynStat.Lust(3)][19]);
                  }
                  if(!get_player().hasStatusEffect(StatusEffects.DemonSeed))
                  {
                     get_player().createStatusEffect(StatusEffects.DemonSeed,5,0,0,0);
                  }
                  else
                  {
                     get_player().addStatusValue(StatusEffects.DemonSeed,1,8);
                  }
                  get_player().slimeFeed();
                  break;
               }
               outputText(allBreastsDescript() + "上。谢天谢地，它似乎没有产生太大的影响。");
               break;
            default:
               if(int(get_player().vaginas.length) > 0)
               {
                  outputText("胯部。黏糊糊的恶魔之种在你身上蠕动滑行，仿佛有自己的意识一般，强行穿过你的[armor]，钻进你的" + get_player().vaginaDescript(0) + "里。你能感觉到它在你体内游走，尽力为你主人的到来做准备。");
                  if(int([DynStat.Lust(3)].length) == 0)
                  {
                     get_game().player.dynStats();
                  }
                  else if(int([DynStat.Lust(3)].length) == 1)
                  {
                     get_game().player.dynStats([DynStat.Lust(3)][0]);
                  }
                  else if(int([DynStat.Lust(3)].length) == 2)
                  {
                     get_game().player.dynStats([DynStat.Lust(3)][0],[DynStat.Lust(3)][1]);
                  }
                  else if(int([DynStat.Lust(3)].length) == 3)
                  {
                     get_game().player.dynStats([DynStat.Lust(3)][0],[DynStat.Lust(3)][1],[DynStat.Lust(3)][2]);
                  }
                  else if(int([DynStat.Lust(3)].length) == 4)
                  {
                     get_game().player.dynStats([DynStat.Lust(3)][0],[DynStat.Lust(3)][1],[DynStat.Lust(3)][2],[DynStat.Lust(3)][3]);
                  }
                  else if(int([DynStat.Lust(3)].length) == 5)
                  {
                     get_game().player.dynStats([DynStat.Lust(3)][0],[DynStat.Lust(3)][1],[DynStat.Lust(3)][2],[DynStat.Lust(3)][3],[DynStat.Lust(3)][4]);
                  }
                  else if(int([DynStat.Lust(3)].length) == 6)
                  {
                     get_game().player.dynStats([DynStat.Lust(3)][0],[DynStat.Lust(3)][1],[DynStat.Lust(3)][2],[DynStat.Lust(3)][3],[DynStat.Lust(3)][4],[DynStat.Lust(3)][5]);
                  }
                  else if(int([DynStat.Lust(3)].length) == 7)
                  {
                     get_game().player.dynStats([DynStat.Lust(3)][0],[DynStat.Lust(3)][1],[DynStat.Lust(3)][2],[DynStat.Lust(3)][3],[DynStat.Lust(3)][4],[DynStat.Lust(3)][5],[DynStat.Lust(3)][6]);
                  }
                  else if(int([DynStat.Lust(3)].length) == 8)
                  {
                     get_game().player.dynStats([DynStat.Lust(3)][0],[DynStat.Lust(3)][1],[DynStat.Lust(3)][2],[DynStat.Lust(3)][3],[DynStat.Lust(3)][4],[DynStat.Lust(3)][5],[DynStat.Lust(3)][6],[DynStat.Lust(3)][7]);
                  }
                  else if(int([DynStat.Lust(3)].length) == 9)
                  {
                     get_game().player.dynStats([DynStat.Lust(3)][0],[DynStat.Lust(3)][1],[DynStat.Lust(3)][2],[DynStat.Lust(3)][3],[DynStat.Lust(3)][4],[DynStat.Lust(3)][5],[DynStat.Lust(3)][6],[DynStat.Lust(3)][7],[DynStat.Lust(3)][8]);
                  }
                  else if(int([DynStat.Lust(3)].length) == 10)
                  {
                     get_game().player.dynStats([DynStat.Lust(3)][0],[DynStat.Lust(3)][1],[DynStat.Lust(3)][2],[DynStat.Lust(3)][3],[DynStat.Lust(3)][4],[DynStat.Lust(3)][5],[DynStat.Lust(3)][6],[DynStat.Lust(3)][7],[DynStat.Lust(3)][8],[DynStat.Lust(3)][9]);
                  }
                  else if(int([DynStat.Lust(3)].length) == 11)
                  {
                     get_game().player.dynStats([DynStat.Lust(3)][0],[DynStat.Lust(3)][1],[DynStat.Lust(3)][2],[DynStat.Lust(3)][3],[DynStat.Lust(3)][4],[DynStat.Lust(3)][5],[DynStat.Lust(3)][6],[DynStat.Lust(3)][7],[DynStat.Lust(3)][8],[DynStat.Lust(3)][9],[DynStat.Lust(3)][10]);
                  }
                  else if(int([DynStat.Lust(3)].length) == 12)
                  {
                     get_game().player.dynStats([DynStat.Lust(3)][0],[DynStat.Lust(3)][1],[DynStat.Lust(3)][2],[DynStat.Lust(3)][3],[DynStat.Lust(3)][4],[DynStat.Lust(3)][5],[DynStat.Lust(3)][6],[DynStat.Lust(3)][7],[DynStat.Lust(3)][8],[DynStat.Lust(3)][9],[DynStat.Lust(3)][10],[DynStat.Lust(3)][11]);
                  }
                  else if(int([DynStat.Lust(3)].length) == 13)
                  {
                     get_game().player.dynStats([DynStat.Lust(3)][0],[DynStat.Lust(3)][1],[DynStat.Lust(3)][2],[DynStat.Lust(3)][3],[DynStat.Lust(3)][4],[DynStat.Lust(3)][5],[DynStat.Lust(3)][6],[DynStat.Lust(3)][7],[DynStat.Lust(3)][8],[DynStat.Lust(3)][9],[DynStat.Lust(3)][10],[DynStat.Lust(3)][11],[DynStat.Lust(3)][12]);
                  }
                  else if(int([DynStat.Lust(3)].length) == 14)
                  {
                     get_game().player.dynStats([DynStat.Lust(3)][0],[DynStat.Lust(3)][1],[DynStat.Lust(3)][2],[DynStat.Lust(3)][3],[DynStat.Lust(3)][4],[DynStat.Lust(3)][5],[DynStat.Lust(3)][6],[DynStat.Lust(3)][7],[DynStat.Lust(3)][8],[DynStat.Lust(3)][9],[DynStat.Lust(3)][10],[DynStat.Lust(3)][11],[DynStat.Lust(3)][12],[DynStat.Lust(3)][13]);
                  }
                  else if(int([DynStat.Lust(3)].length) == 15)
                  {
                     get_game().player.dynStats([DynStat.Lust(3)][0],[DynStat.Lust(3)][1],[DynStat.Lust(3)][2],[DynStat.Lust(3)][3],[DynStat.Lust(3)][4],[DynStat.Lust(3)][5],[DynStat.Lust(3)][6],[DynStat.Lust(3)][7],[DynStat.Lust(3)][8],[DynStat.Lust(3)][9],[DynStat.Lust(3)][10],[DynStat.Lust(3)][11],[DynStat.Lust(3)][12],[DynStat.Lust(3)][13],[DynStat.Lust(3)][14]);
                  }
                  else if(int([DynStat.Lust(3)].length) == 16)
                  {
                     get_game().player.dynStats([DynStat.Lust(3)][0],[DynStat.Lust(3)][1],[DynStat.Lust(3)][2],[DynStat.Lust(3)][3],[DynStat.Lust(3)][4],[DynStat.Lust(3)][5],[DynStat.Lust(3)][6],[DynStat.Lust(3)][7],[DynStat.Lust(3)][8],[DynStat.Lust(3)][9],[DynStat.Lust(3)][10],[DynStat.Lust(3)][11],[DynStat.Lust(3)][12],[DynStat.Lust(3)][13],[DynStat.Lust(3)][14],[DynStat.Lust(3)][15]);
                  }
                  else if(int([DynStat.Lust(3)].length) == 17)
                  {
                     get_game().player.dynStats([DynStat.Lust(3)][0],[DynStat.Lust(3)][1],[DynStat.Lust(3)][2],[DynStat.Lust(3)][3],[DynStat.Lust(3)][4],[DynStat.Lust(3)][5],[DynStat.Lust(3)][6],[DynStat.Lust(3)][7],[DynStat.Lust(3)][8],[DynStat.Lust(3)][9],[DynStat.Lust(3)][10],[DynStat.Lust(3)][11],[DynStat.Lust(3)][12],[DynStat.Lust(3)][13],[DynStat.Lust(3)][14],[DynStat.Lust(3)][15],[DynStat.Lust(3)][16]);
                  }
                  else if(int([DynStat.Lust(3)].length) == 18)
                  {
                     get_game().player.dynStats([DynStat.Lust(3)][0],[DynStat.Lust(3)][1],[DynStat.Lust(3)][2],[DynStat.Lust(3)][3],[DynStat.Lust(3)][4],[DynStat.Lust(3)][5],[DynStat.Lust(3)][6],[DynStat.Lust(3)][7],[DynStat.Lust(3)][8],[DynStat.Lust(3)][9],[DynStat.Lust(3)][10],[DynStat.Lust(3)][11],[DynStat.Lust(3)][12],[DynStat.Lust(3)][13],[DynStat.Lust(3)][14],[DynStat.Lust(3)][15],[DynStat.Lust(3)][16],[DynStat.Lust(3)][17]);
                  }
                  else if(int([DynStat.Lust(3)].length) == 19)
                  {
                     get_game().player.dynStats([DynStat.Lust(3)][0],[DynStat.Lust(3)][1],[DynStat.Lust(3)][2],[DynStat.Lust(3)][3],[DynStat.Lust(3)][4],[DynStat.Lust(3)][5],[DynStat.Lust(3)][6],[DynStat.Lust(3)][7],[DynStat.Lust(3)][8],[DynStat.Lust(3)][9],[DynStat.Lust(3)][10],[DynStat.Lust(3)][11],[DynStat.Lust(3)][12],[DynStat.Lust(3)][13],[DynStat.Lust(3)][14],[DynStat.Lust(3)][15],[DynStat.Lust(3)][16],[DynStat.Lust(3)][17],[DynStat.Lust(3)][18]);
                  }
                  else
                  {
                     if(int([DynStat.Lust(3)].length) != 20)
                     {
                        throw "Too many rest arguments";
                     }
                     get_game().player.dynStats([DynStat.Lust(3)][0],[DynStat.Lust(3)][1],[DynStat.Lust(3)][2],[DynStat.Lust(3)][3],[DynStat.Lust(3)][4],[DynStat.Lust(3)][5],[DynStat.Lust(3)][6],[DynStat.Lust(3)][7],[DynStat.Lust(3)][8],[DynStat.Lust(3)][9],[DynStat.Lust(3)][10],[DynStat.Lust(3)][11],[DynStat.Lust(3)][12],[DynStat.Lust(3)][13],[DynStat.Lust(3)][14],[DynStat.Lust(3)][15],[DynStat.Lust(3)][16],[DynStat.Lust(3)][17],[DynStat.Lust(3)][18],[DynStat.Lust(3)][19]);
                  }
                  if(!get_player().hasStatusEffect(StatusEffects.DemonSeed))
                  {
                     get_player().createStatusEffect(StatusEffects.DemonSeed,5,0,0,0);
                  }
                  else
                  {
                     get_player().addStatusValue(StatusEffects.DemonSeed,1,8);
                  }
                  get_player().slimeFeed();
               }
               else
               {
                  outputText("胯部。谢天谢地，它似乎没有产生太大的影响。");
               }
         }
         set_lust(get_lust() - 10);
         if(get_lust() < 0)
         {
            set_lust(10);
         }
      }
      
      override public function performCombatAction() : void
      {
         var _loc1_:MonsterAI = new MonsterAI();
         _loc1_.add(cockTripAttack,1,true,10,FATIGUE_MAGICAL,CombatRange.Melee);
         _loc1_.add(spoogeAttack,1,true,10,FATIGUE_PHYSICAL,CombatRange.Ranged);
         _loc1_.add(eAttack,1,true,0,FATIGUE_NONE,CombatRange.Melee);
         _loc1_.exec();
      }
      
      public function defeatedInDungeon3(param1:Boolean) : void
      {
         get_game().lethicesKeep.incubusMechanic.beatDaMechanic(param1);
      }
      
      public function defeatedInDungeon1(param1:Boolean) : void
      {
         var _g2:Combat;
         var _g1:NaughtyNunsHabit;
         var monster:Monster;
         var player1:Player;
         var _g:LustyMaidensArmor;
         var _loc2_:* = null as Output;
         clearOutput();
         get_game().output.menu();
         if(param1)
         {
            outputText("看着" + Utils.cnName(get_short()) + "倒下，无力继续战斗，你满意地笑了。");
         }
         else
         {
            outputText("看着" + Utils.cnName(get_short()) + "倒下，开心地自慰着，你满意地笑了。");
         }
         outputText("现在正是利用他那根东西的绝佳机会……");
         outputText("[pg]你要做什么？");
         if(FlagDict_Impl_.arrayReadInt(get_flags(),2979) >= 2 && FlagDict_Impl_.arrayReadInt(get_flags(),2025) == 0)
         {
            outputText("[pg]<b>你发誓你听到了西边传来的咔哒声。</b>");
         }
         if(FlagDict_Impl_.arrayReadInt(get_flags(),2025) > 0)
         {
            get_player().createKeyItem("Hentai Comic",0,0,0,0);
         }
         if(!get_player().isGenderless())
         {
            get_game().output.addButton(0,"强暴",get_game().lethicesKeep.incubusMechanic.doRapeIncubus).hint(get_player().hasCock() ? "操他的屁股。" : "用小穴骑乘他。");
         }
         else
         {
            get_game().output.addButtonDisabled(0,"强暴","这个场景需要你有生殖器。");
         }
         get_game().output.addButton(1,"服侍他",get_game().lethicesKeep.incubusMechanic.doOralIncubus).hint("用嘴服侍男魅魔。");
         get_game().output.addButton(2,"肛门骑乘",get_game().lethicesKeep.incubusMechanic.doRideIncubusAnally).hint("用肛门骑乘他。");
         if(get_player().hasVagina() && get_player().biggestTitSize() >= 4 && get_player().get_armor() == get_armors().LMARMOR)
         {
            _loc2_ = get_game().output;
            _g = get_player().get_armor();
            player1 = get_player();
            monster = this;
            _loc2_.addButton(3,"B.Titfuck",function():void
            {
               _g.lustyMaidenPaizuri(player1,monster);
            });
         }
         if(get_player().get_armor() is NaughtyNunsHabit)
         {
            _loc2_ = get_game().output;
            _g1 = get_player().get_armor();
            _loc2_.addButton(4,"肉棒崇拜",function():void
            {
               _g1.naughtyNunCockWorship();
            }).hint("通过对这只生物的肉棒的奉献来赞美你的主。");
         }
         _loc2_ = get_game().output;
         _g2 = get_game().combat;
         _loc2_.addButton(14,"离开",function():void
         {
            _g2.cleanupAfterCombat();
         });
      }
      
      override public function defeated(param1:Boolean) : void
      {
         if(FlagDict_Impl_.arrayReadInt(get_flags(),1239) == 0)
         {
            defeatedInDungeon1(param1);
         }
         else
         {
            defeatedInDungeon3(param1);
         }
      }
      
      public function cockTripAttack() : void
      {
         if(hasStatusEffect(StatusEffects.Blind))
         {
            outputText(get_capitalA() + Utils.cnName(get_short()) + "突然将他的肉棒伸长到猥亵的长度，并试图用它绊倒你。幸好他瞎得厉害，根本没瞄准你！");
            return;
         }
         outputText("男魅魔笨拙地向前扑来，你刚开始侧步躲避，却感觉有什么东西抓住了你的[ass]后面，把你的[legs]从身下扯了出去。");
         if(get_player().get_spe() - 30 > Utils.rand(60))
         {
            outputText("你在倒下时旋转身体，扭动着挣脱了你的[legs]，毫发无伤地重新站稳了[feet]。");
         }
         else
         {
            outputText("你重重地摔在屁股上，一时有些发懵，恶魔般的肉棒触手卷住了你的[legs]，在上面涂抹着渗出的恶魔体液。");
            if(get_player().get_lust100() >= 80 || get_player().cor >= 80)
            {
               outputText("你充满欲望地呻吟着，舔了舔嘴唇，将沾满润滑液的[legs]滑了出来。你收集了一团精液，诱惑地舔了舔，向男魅魔抛了个媚眼，希望能让他屈服于自己的欲望。");
               get_player().takeLustDamage(13,true);
               if(int([DynStat.Cor(1)].length) == 0)
               {
                  get_game().player.dynStats();
               }
               else if(int([DynStat.Cor(1)].length) == 1)
               {
                  get_game().player.dynStats([DynStat.Cor(1)][0]);
               }
               else if(int([DynStat.Cor(1)].length) == 2)
               {
                  get_game().player.dynStats([DynStat.Cor(1)][0],[DynStat.Cor(1)][1]);
               }
               else if(int([DynStat.Cor(1)].length) == 3)
               {
                  get_game().player.dynStats([DynStat.Cor(1)][0],[DynStat.Cor(1)][1],[DynStat.Cor(1)][2]);
               }
               else if(int([DynStat.Cor(1)].length) == 4)
               {
                  get_game().player.dynStats([DynStat.Cor(1)][0],[DynStat.Cor(1)][1],[DynStat.Cor(1)][2],[DynStat.Cor(1)][3]);
               }
               else if(int([DynStat.Cor(1)].length) == 5)
               {
                  get_game().player.dynStats([DynStat.Cor(1)][0],[DynStat.Cor(1)][1],[DynStat.Cor(1)][2],[DynStat.Cor(1)][3],[DynStat.Cor(1)][4]);
               }
               else if(int([DynStat.Cor(1)].length) == 6)
               {
                  get_game().player.dynStats([DynStat.Cor(1)][0],[DynStat.Cor(1)][1],[DynStat.Cor(1)][2],[DynStat.Cor(1)][3],[DynStat.Cor(1)][4],[DynStat.Cor(1)][5]);
               }
               else if(int([DynStat.Cor(1)].length) == 7)
               {
                  get_game().player.dynStats([DynStat.Cor(1)][0],[DynStat.Cor(1)][1],[DynStat.Cor(1)][2],[DynStat.Cor(1)][3],[DynStat.Cor(1)][4],[DynStat.Cor(1)][5],[DynStat.Cor(1)][6]);
               }
               else if(int([DynStat.Cor(1)].length) == 8)
               {
                  get_game().player.dynStats([DynStat.Cor(1)][0],[DynStat.Cor(1)][1],[DynStat.Cor(1)][2],[DynStat.Cor(1)][3],[DynStat.Cor(1)][4],[DynStat.Cor(1)][5],[DynStat.Cor(1)][6],[DynStat.Cor(1)][7]);
               }
               else if(int([DynStat.Cor(1)].length) == 9)
               {
                  get_game().player.dynStats([DynStat.Cor(1)][0],[DynStat.Cor(1)][1],[DynStat.Cor(1)][2],[DynStat.Cor(1)][3],[DynStat.Cor(1)][4],[DynStat.Cor(1)][5],[DynStat.Cor(1)][6],[DynStat.Cor(1)][7],[DynStat.Cor(1)][8]);
               }
               else if(int([DynStat.Cor(1)].length) == 10)
               {
                  get_game().player.dynStats([DynStat.Cor(1)][0],[DynStat.Cor(1)][1],[DynStat.Cor(1)][2],[DynStat.Cor(1)][3],[DynStat.Cor(1)][4],[DynStat.Cor(1)][5],[DynStat.Cor(1)][6],[DynStat.Cor(1)][7],[DynStat.Cor(1)][8],[DynStat.Cor(1)][9]);
               }
               else if(int([DynStat.Cor(1)].length) == 11)
               {
                  get_game().player.dynStats([DynStat.Cor(1)][0],[DynStat.Cor(1)][1],[DynStat.Cor(1)][2],[DynStat.Cor(1)][3],[DynStat.Cor(1)][4],[DynStat.Cor(1)][5],[DynStat.Cor(1)][6],[DynStat.Cor(1)][7],[DynStat.Cor(1)][8],[DynStat.Cor(1)][9],[DynStat.Cor(1)][10]);
               }
               else if(int([DynStat.Cor(1)].length) == 12)
               {
                  get_game().player.dynStats([DynStat.Cor(1)][0],[DynStat.Cor(1)][1],[DynStat.Cor(1)][2],[DynStat.Cor(1)][3],[DynStat.Cor(1)][4],[DynStat.Cor(1)][5],[DynStat.Cor(1)][6],[DynStat.Cor(1)][7],[DynStat.Cor(1)][8],[DynStat.Cor(1)][9],[DynStat.Cor(1)][10],[DynStat.Cor(1)][11]);
               }
               else if(int([DynStat.Cor(1)].length) == 13)
               {
                  get_game().player.dynStats([DynStat.Cor(1)][0],[DynStat.Cor(1)][1],[DynStat.Cor(1)][2],[DynStat.Cor(1)][3],[DynStat.Cor(1)][4],[DynStat.Cor(1)][5],[DynStat.Cor(1)][6],[DynStat.Cor(1)][7],[DynStat.Cor(1)][8],[DynStat.Cor(1)][9],[DynStat.Cor(1)][10],[DynStat.Cor(1)][11],[DynStat.Cor(1)][12]);
               }
               else if(int([DynStat.Cor(1)].length) == 14)
               {
                  get_game().player.dynStats([DynStat.Cor(1)][0],[DynStat.Cor(1)][1],[DynStat.Cor(1)][2],[DynStat.Cor(1)][3],[DynStat.Cor(1)][4],[DynStat.Cor(1)][5],[DynStat.Cor(1)][6],[DynStat.Cor(1)][7],[DynStat.Cor(1)][8],[DynStat.Cor(1)][9],[DynStat.Cor(1)][10],[DynStat.Cor(1)][11],[DynStat.Cor(1)][12],[DynStat.Cor(1)][13]);
               }
               else if(int([DynStat.Cor(1)].length) == 15)
               {
                  get_game().player.dynStats([DynStat.Cor(1)][0],[DynStat.Cor(1)][1],[DynStat.Cor(1)][2],[DynStat.Cor(1)][3],[DynStat.Cor(1)][4],[DynStat.Cor(1)][5],[DynStat.Cor(1)][6],[DynStat.Cor(1)][7],[DynStat.Cor(1)][8],[DynStat.Cor(1)][9],[DynStat.Cor(1)][10],[DynStat.Cor(1)][11],[DynStat.Cor(1)][12],[DynStat.Cor(1)][13],[DynStat.Cor(1)][14]);
               }
               else if(int([DynStat.Cor(1)].length) == 16)
               {
                  get_game().player.dynStats([DynStat.Cor(1)][0],[DynStat.Cor(1)][1],[DynStat.Cor(1)][2],[DynStat.Cor(1)][3],[DynStat.Cor(1)][4],[DynStat.Cor(1)][5],[DynStat.Cor(1)][6],[DynStat.Cor(1)][7],[DynStat.Cor(1)][8],[DynStat.Cor(1)][9],[DynStat.Cor(1)][10],[DynStat.Cor(1)][11],[DynStat.Cor(1)][12],[DynStat.Cor(1)][13],[DynStat.Cor(1)][14],[DynStat.Cor(1)][15]);
               }
               else if(int([DynStat.Cor(1)].length) == 17)
               {
                  get_game().player.dynStats([DynStat.Cor(1)][0],[DynStat.Cor(1)][1],[DynStat.Cor(1)][2],[DynStat.Cor(1)][3],[DynStat.Cor(1)][4],[DynStat.Cor(1)][5],[DynStat.Cor(1)][6],[DynStat.Cor(1)][7],[DynStat.Cor(1)][8],[DynStat.Cor(1)][9],[DynStat.Cor(1)][10],[DynStat.Cor(1)][11],[DynStat.Cor(1)][12],[DynStat.Cor(1)][13],[DynStat.Cor(1)][14],[DynStat.Cor(1)][15],[DynStat.Cor(1)][16]);
               }
               else if(int([DynStat.Cor(1)].length) == 18)
               {
                  get_game().player.dynStats([DynStat.Cor(1)][0],[DynStat.Cor(1)][1],[DynStat.Cor(1)][2],[DynStat.Cor(1)][3],[DynStat.Cor(1)][4],[DynStat.Cor(1)][5],[DynStat.Cor(1)][6],[DynStat.Cor(1)][7],[DynStat.Cor(1)][8],[DynStat.Cor(1)][9],[DynStat.Cor(1)][10],[DynStat.Cor(1)][11],[DynStat.Cor(1)][12],[DynStat.Cor(1)][13],[DynStat.Cor(1)][14],[DynStat.Cor(1)][15],[DynStat.Cor(1)][16],[DynStat.Cor(1)][17]);
               }
               else if(int([DynStat.Cor(1)].length) == 19)
               {
                  get_game().player.dynStats([DynStat.Cor(1)][0],[DynStat.Cor(1)][1],[DynStat.Cor(1)][2],[DynStat.Cor(1)][3],[DynStat.Cor(1)][4],[DynStat.Cor(1)][5],[DynStat.Cor(1)][6],[DynStat.Cor(1)][7],[DynStat.Cor(1)][8],[DynStat.Cor(1)][9],[DynStat.Cor(1)][10],[DynStat.Cor(1)][11],[DynStat.Cor(1)][12],[DynStat.Cor(1)][13],[DynStat.Cor(1)][14],[DynStat.Cor(1)][15],[DynStat.Cor(1)][16],[DynStat.Cor(1)][17],[DynStat.Cor(1)][18]);
               }
               else
               {
                  if(int([DynStat.Cor(1)].length) != 20)
                  {
                     throw "Too many rest arguments";
                  }
                  get_game().player.dynStats([DynStat.Cor(1)][0],[DynStat.Cor(1)][1],[DynStat.Cor(1)][2],[DynStat.Cor(1)][3],[DynStat.Cor(1)][4],[DynStat.Cor(1)][5],[DynStat.Cor(1)][6],[DynStat.Cor(1)][7],[DynStat.Cor(1)][8],[DynStat.Cor(1)][9],[DynStat.Cor(1)][10],[DynStat.Cor(1)][11],[DynStat.Cor(1)][12],[DynStat.Cor(1)][13],[DynStat.Cor(1)][14],[DynStat.Cor(1)][15],[DynStat.Cor(1)][16],[DynStat.Cor(1)][17],[DynStat.Cor(1)][18],[DynStat.Cor(1)][19]);
               }
            }
            else if(get_player().get_lust100() >= 50 || get_player().cor >= 50)
            {
               outputText("闻着[legs]上精液的气味，感受着它的触感，你红着脸扭动着挣脱出来。你发现自己开始好奇这个恶魔的肉棒尝起来会是什么味道。");
               get_player().takeLustDamage(8 + get_player().cor / 20,true);
            }
            else
            {
               outputText("你厌恶地从那紫色的怪物身上抽离，因为你的[legs]上沾满了黏液，这让你更容易脱身。");
               get_player().takeLustDamage(5 + get_player().cor / 20,true);
            }
            get_player().takeDamage(5);
         }
         outputText("\n男魅魔自信地笑了笑，他的阴茎从你身上缩回，恢复了正常大小。");
      }
   }
}

