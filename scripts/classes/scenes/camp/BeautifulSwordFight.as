package classes.scenes.camp
{
   import classes.CoC;
   import classes.Creature;
   import classes.DynStat;
   import classes.Monster;
   import classes.Player;
   import classes.StatusEffects;
   import classes._FlagDict.FlagDict_Impl_;
   import classes.internals.MonsterAI;
   import classes.internals.Utils;
   import classes.internals.WeightedChoice;
   import classes.items.Weapon;
   import classes.scenes.combat.AvoidDamageParameters;
   import classes.scenes.combat.CombatRange;
   import flash.Boot;
   import haxe.IMap;
   
   public class BeautifulSwordFight extends Monster
   {
      
      public function BeautifulSwordFight()
      {
         if(Boot.skip_constructor)
         {
            return;
         }
         super();
         set_a("");
         set_short("beautiful sword");
         set_plural(false);
         createBreastRow();
         set_initedGenitals(true);
         balls = 0;
         ballSize = 0;
         set_tallness(36);
         skin.tone = "metallic";
         set_long("这把美丽的剑反叛了它的主人！它漂浮在空中，剑刃始终指向你，仿佛在追踪你那堕落的灵魂。");
         pronoun1 = "它";
         pronoun2 = "它";
         pronoun3 = "它的";
         initStrTouSpeInte(80,100,75,50);
         initLibSensCor(0,0,0);
         set_weaponName("blessed blade");
         set_weaponVerb("slash");
         set_weaponAttack(20 + FlagDict_Impl_.arrayReadInt(get_flags(),2662) * 5);
         set_armorName("holy steel");
         set_armorDef(15 + FlagDict_Impl_.arrayReadInt(get_flags(),2662));
         bonusHP = 400;
         set_lust(0);
         lustVuln = 0;
         temperment = 1;
         level = 17 + FlagDict_Impl_.arrayReadInt(get_flags(),2662) * 2;
         set_gems(0);
         set_drop(new WeightedChoice());
         checkMonster();
      }
      
      override public function won(param1:Boolean, param2:Boolean = false) : void
      {
         get_game().beautifulSwordScene.defeatedBySword();
      }
      
      override public function replacesDescribeAttacked(param1:Weapon, param2:int, param3:Boolean = false) : Boolean
      {
         var _loc4_:Boolean = false;
         var _loc5_:Boolean = false;
         var _loc6_:Boolean = false;
         if(!param1.isChanneling())
         {
            _loc4_ = param2 < 15 || param2 < maxHP() * 0.05;
            _loc5_ = param2 < 50 || param2 < maxHP() * 0.2;
            _loc6_ = param2 < 100 || param2 < maxHP() * 0.33;
            if(param2 <= 0)
            {
               outputText("你的" + param1.get_attackNoun() + "击中了，但并没有伤害到" + get_themonster() + "。");
            }
            else if(_loc4_)
            {
               outputText("你擦伤了" + get_themonster() + "！");
            }
            else if(_loc5_)
            {
               outputText("你" + param1.get_attackVerb() + "了" + get_themonster() + "，在它身上留下了凹痕！");
            }
            else if(_loc6_)
            {
               outputText("你用" + param1.get_attackNoun() + "的威力打得" + get_themonster() + "踉跄后退！");
            }
            else
            {
               outputText("你用强力的" + param1.get_attackNoun() + "重击了" + get_themonster() + "！");
            }
            if(param3)
            {
               outputText("[b:暴击！]");
            }
            outputText(get_game().combat.getDamageText(param2));
            return true;
         }
         return false;
      }
      
      public function purge() : void
      {
         var _loc2_:int = 0;
         outputText("剑摆出仿佛被收入鞘中的姿势。不久之后，一个身穿盔甲的骑士形状的蓝色幽灵从剑旁的以太中出现，并挥舞着刀刃！");
         outputText("[pg]他高举长剑，剑身闪耀着刺眼的光芒，随后向你刺来，释放出一道纯净的光束！");
         var _loc1_:* = combatAvoidDamage(new AvoidDamageParameters(true,false,false,null,null,null,null,null));
         if(_loc1_.dodge == null)
         {
            outputText("\n光束穿透了你，以难以想象的强度灼烧着你。");
            _loc2_ = int(100 + Utils.rand(3) * (get_player().cor / 100));
            _loc2_ = get_player().reduceDamage(_loc2_,this);
            get_player().takeDamage(_loc2_,true);
            outputText("\n随着光束不断穿透你的身体，你感觉到你的腐化和欲望正在被燃烧殆尽。");
            if(int([DynStat.Cor(-4)].length) == 0)
            {
               get_game().player.dynStats();
            }
            else if(int([DynStat.Cor(-4)].length) == 1)
            {
               get_game().player.dynStats([DynStat.Cor(-4)][0]);
            }
            else if(int([DynStat.Cor(-4)].length) == 2)
            {
               get_game().player.dynStats([DynStat.Cor(-4)][0],[DynStat.Cor(-4)][1]);
            }
            else if(int([DynStat.Cor(-4)].length) == 3)
            {
               get_game().player.dynStats([DynStat.Cor(-4)][0],[DynStat.Cor(-4)][1],[DynStat.Cor(-4)][2]);
            }
            else if(int([DynStat.Cor(-4)].length) == 4)
            {
               get_game().player.dynStats([DynStat.Cor(-4)][0],[DynStat.Cor(-4)][1],[DynStat.Cor(-4)][2],[DynStat.Cor(-4)][3]);
            }
            else if(int([DynStat.Cor(-4)].length) == 5)
            {
               get_game().player.dynStats([DynStat.Cor(-4)][0],[DynStat.Cor(-4)][1],[DynStat.Cor(-4)][2],[DynStat.Cor(-4)][3],[DynStat.Cor(-4)][4]);
            }
            else if(int([DynStat.Cor(-4)].length) == 6)
            {
               get_game().player.dynStats([DynStat.Cor(-4)][0],[DynStat.Cor(-4)][1],[DynStat.Cor(-4)][2],[DynStat.Cor(-4)][3],[DynStat.Cor(-4)][4],[DynStat.Cor(-4)][5]);
            }
            else if(int([DynStat.Cor(-4)].length) == 7)
            {
               get_game().player.dynStats([DynStat.Cor(-4)][0],[DynStat.Cor(-4)][1],[DynStat.Cor(-4)][2],[DynStat.Cor(-4)][3],[DynStat.Cor(-4)][4],[DynStat.Cor(-4)][5],[DynStat.Cor(-4)][6]);
            }
            else if(int([DynStat.Cor(-4)].length) == 8)
            {
               get_game().player.dynStats([DynStat.Cor(-4)][0],[DynStat.Cor(-4)][1],[DynStat.Cor(-4)][2],[DynStat.Cor(-4)][3],[DynStat.Cor(-4)][4],[DynStat.Cor(-4)][5],[DynStat.Cor(-4)][6],[DynStat.Cor(-4)][7]);
            }
            else if(int([DynStat.Cor(-4)].length) == 9)
            {
               get_game().player.dynStats([DynStat.Cor(-4)][0],[DynStat.Cor(-4)][1],[DynStat.Cor(-4)][2],[DynStat.Cor(-4)][3],[DynStat.Cor(-4)][4],[DynStat.Cor(-4)][5],[DynStat.Cor(-4)][6],[DynStat.Cor(-4)][7],[DynStat.Cor(-4)][8]);
            }
            else if(int([DynStat.Cor(-4)].length) == 10)
            {
               get_game().player.dynStats([DynStat.Cor(-4)][0],[DynStat.Cor(-4)][1],[DynStat.Cor(-4)][2],[DynStat.Cor(-4)][3],[DynStat.Cor(-4)][4],[DynStat.Cor(-4)][5],[DynStat.Cor(-4)][6],[DynStat.Cor(-4)][7],[DynStat.Cor(-4)][8],[DynStat.Cor(-4)][9]);
            }
            else if(int([DynStat.Cor(-4)].length) == 11)
            {
               get_game().player.dynStats([DynStat.Cor(-4)][0],[DynStat.Cor(-4)][1],[DynStat.Cor(-4)][2],[DynStat.Cor(-4)][3],[DynStat.Cor(-4)][4],[DynStat.Cor(-4)][5],[DynStat.Cor(-4)][6],[DynStat.Cor(-4)][7],[DynStat.Cor(-4)][8],[DynStat.Cor(-4)][9],[DynStat.Cor(-4)][10]);
            }
            else if(int([DynStat.Cor(-4)].length) == 12)
            {
               get_game().player.dynStats([DynStat.Cor(-4)][0],[DynStat.Cor(-4)][1],[DynStat.Cor(-4)][2],[DynStat.Cor(-4)][3],[DynStat.Cor(-4)][4],[DynStat.Cor(-4)][5],[DynStat.Cor(-4)][6],[DynStat.Cor(-4)][7],[DynStat.Cor(-4)][8],[DynStat.Cor(-4)][9],[DynStat.Cor(-4)][10],[DynStat.Cor(-4)][11]);
            }
            else if(int([DynStat.Cor(-4)].length) == 13)
            {
               get_game().player.dynStats([DynStat.Cor(-4)][0],[DynStat.Cor(-4)][1],[DynStat.Cor(-4)][2],[DynStat.Cor(-4)][3],[DynStat.Cor(-4)][4],[DynStat.Cor(-4)][5],[DynStat.Cor(-4)][6],[DynStat.Cor(-4)][7],[DynStat.Cor(-4)][8],[DynStat.Cor(-4)][9],[DynStat.Cor(-4)][10],[DynStat.Cor(-4)][11],[DynStat.Cor(-4)][12]);
            }
            else if(int([DynStat.Cor(-4)].length) == 14)
            {
               get_game().player.dynStats([DynStat.Cor(-4)][0],[DynStat.Cor(-4)][1],[DynStat.Cor(-4)][2],[DynStat.Cor(-4)][3],[DynStat.Cor(-4)][4],[DynStat.Cor(-4)][5],[DynStat.Cor(-4)][6],[DynStat.Cor(-4)][7],[DynStat.Cor(-4)][8],[DynStat.Cor(-4)][9],[DynStat.Cor(-4)][10],[DynStat.Cor(-4)][11],[DynStat.Cor(-4)][12],[DynStat.Cor(-4)][13]);
            }
            else if(int([DynStat.Cor(-4)].length) == 15)
            {
               get_game().player.dynStats([DynStat.Cor(-4)][0],[DynStat.Cor(-4)][1],[DynStat.Cor(-4)][2],[DynStat.Cor(-4)][3],[DynStat.Cor(-4)][4],[DynStat.Cor(-4)][5],[DynStat.Cor(-4)][6],[DynStat.Cor(-4)][7],[DynStat.Cor(-4)][8],[DynStat.Cor(-4)][9],[DynStat.Cor(-4)][10],[DynStat.Cor(-4)][11],[DynStat.Cor(-4)][12],[DynStat.Cor(-4)][13],[DynStat.Cor(-4)][14]);
            }
            else if(int([DynStat.Cor(-4)].length) == 16)
            {
               get_game().player.dynStats([DynStat.Cor(-4)][0],[DynStat.Cor(-4)][1],[DynStat.Cor(-4)][2],[DynStat.Cor(-4)][3],[DynStat.Cor(-4)][4],[DynStat.Cor(-4)][5],[DynStat.Cor(-4)][6],[DynStat.Cor(-4)][7],[DynStat.Cor(-4)][8],[DynStat.Cor(-4)][9],[DynStat.Cor(-4)][10],[DynStat.Cor(-4)][11],[DynStat.Cor(-4)][12],[DynStat.Cor(-4)][13],[DynStat.Cor(-4)][14],[DynStat.Cor(-4)][15]);
            }
            else if(int([DynStat.Cor(-4)].length) == 17)
            {
               get_game().player.dynStats([DynStat.Cor(-4)][0],[DynStat.Cor(-4)][1],[DynStat.Cor(-4)][2],[DynStat.Cor(-4)][3],[DynStat.Cor(-4)][4],[DynStat.Cor(-4)][5],[DynStat.Cor(-4)][6],[DynStat.Cor(-4)][7],[DynStat.Cor(-4)][8],[DynStat.Cor(-4)][9],[DynStat.Cor(-4)][10],[DynStat.Cor(-4)][11],[DynStat.Cor(-4)][12],[DynStat.Cor(-4)][13],[DynStat.Cor(-4)][14],[DynStat.Cor(-4)][15],[DynStat.Cor(-4)][16]);
            }
            else if(int([DynStat.Cor(-4)].length) == 18)
            {
               get_game().player.dynStats([DynStat.Cor(-4)][0],[DynStat.Cor(-4)][1],[DynStat.Cor(-4)][2],[DynStat.Cor(-4)][3],[DynStat.Cor(-4)][4],[DynStat.Cor(-4)][5],[DynStat.Cor(-4)][6],[DynStat.Cor(-4)][7],[DynStat.Cor(-4)][8],[DynStat.Cor(-4)][9],[DynStat.Cor(-4)][10],[DynStat.Cor(-4)][11],[DynStat.Cor(-4)][12],[DynStat.Cor(-4)][13],[DynStat.Cor(-4)][14],[DynStat.Cor(-4)][15],[DynStat.Cor(-4)][16],[DynStat.Cor(-4)][17]);
            }
            else if(int([DynStat.Cor(-4)].length) == 19)
            {
               get_game().player.dynStats([DynStat.Cor(-4)][0],[DynStat.Cor(-4)][1],[DynStat.Cor(-4)][2],[DynStat.Cor(-4)][3],[DynStat.Cor(-4)][4],[DynStat.Cor(-4)][5],[DynStat.Cor(-4)][6],[DynStat.Cor(-4)][7],[DynStat.Cor(-4)][8],[DynStat.Cor(-4)][9],[DynStat.Cor(-4)][10],[DynStat.Cor(-4)][11],[DynStat.Cor(-4)][12],[DynStat.Cor(-4)][13],[DynStat.Cor(-4)][14],[DynStat.Cor(-4)][15],[DynStat.Cor(-4)][16],[DynStat.Cor(-4)][17],[DynStat.Cor(-4)][18]);
            }
            else
            {
               if(int([DynStat.Cor(-4)].length) != 20)
               {
                  throw "Too many rest arguments";
               }
               get_game().player.dynStats([DynStat.Cor(-4)][0],[DynStat.Cor(-4)][1],[DynStat.Cor(-4)][2],[DynStat.Cor(-4)][3],[DynStat.Cor(-4)][4],[DynStat.Cor(-4)][5],[DynStat.Cor(-4)][6],[DynStat.Cor(-4)][7],[DynStat.Cor(-4)][8],[DynStat.Cor(-4)][9],[DynStat.Cor(-4)][10],[DynStat.Cor(-4)][11],[DynStat.Cor(-4)][12],[DynStat.Cor(-4)][13],[DynStat.Cor(-4)][14],[DynStat.Cor(-4)][15],[DynStat.Cor(-4)][16],[DynStat.Cor(-4)][17],[DynStat.Cor(-4)][18],[DynStat.Cor(-4)][19]);
            }
            if(int([DynStat.Lust(-20)].length) == 0)
            {
               get_game().player.dynStats();
            }
            else if(int([DynStat.Lust(-20)].length) == 1)
            {
               get_game().player.dynStats([DynStat.Lust(-20)][0]);
            }
            else if(int([DynStat.Lust(-20)].length) == 2)
            {
               get_game().player.dynStats([DynStat.Lust(-20)][0],[DynStat.Lust(-20)][1]);
            }
            else if(int([DynStat.Lust(-20)].length) == 3)
            {
               get_game().player.dynStats([DynStat.Lust(-20)][0],[DynStat.Lust(-20)][1],[DynStat.Lust(-20)][2]);
            }
            else if(int([DynStat.Lust(-20)].length) == 4)
            {
               get_game().player.dynStats([DynStat.Lust(-20)][0],[DynStat.Lust(-20)][1],[DynStat.Lust(-20)][2],[DynStat.Lust(-20)][3]);
            }
            else if(int([DynStat.Lust(-20)].length) == 5)
            {
               get_game().player.dynStats([DynStat.Lust(-20)][0],[DynStat.Lust(-20)][1],[DynStat.Lust(-20)][2],[DynStat.Lust(-20)][3],[DynStat.Lust(-20)][4]);
            }
            else if(int([DynStat.Lust(-20)].length) == 6)
            {
               get_game().player.dynStats([DynStat.Lust(-20)][0],[DynStat.Lust(-20)][1],[DynStat.Lust(-20)][2],[DynStat.Lust(-20)][3],[DynStat.Lust(-20)][4],[DynStat.Lust(-20)][5]);
            }
            else if(int([DynStat.Lust(-20)].length) == 7)
            {
               get_game().player.dynStats([DynStat.Lust(-20)][0],[DynStat.Lust(-20)][1],[DynStat.Lust(-20)][2],[DynStat.Lust(-20)][3],[DynStat.Lust(-20)][4],[DynStat.Lust(-20)][5],[DynStat.Lust(-20)][6]);
            }
            else if(int([DynStat.Lust(-20)].length) == 8)
            {
               get_game().player.dynStats([DynStat.Lust(-20)][0],[DynStat.Lust(-20)][1],[DynStat.Lust(-20)][2],[DynStat.Lust(-20)][3],[DynStat.Lust(-20)][4],[DynStat.Lust(-20)][5],[DynStat.Lust(-20)][6],[DynStat.Lust(-20)][7]);
            }
            else if(int([DynStat.Lust(-20)].length) == 9)
            {
               get_game().player.dynStats([DynStat.Lust(-20)][0],[DynStat.Lust(-20)][1],[DynStat.Lust(-20)][2],[DynStat.Lust(-20)][3],[DynStat.Lust(-20)][4],[DynStat.Lust(-20)][5],[DynStat.Lust(-20)][6],[DynStat.Lust(-20)][7],[DynStat.Lust(-20)][8]);
            }
            else if(int([DynStat.Lust(-20)].length) == 10)
            {
               get_game().player.dynStats([DynStat.Lust(-20)][0],[DynStat.Lust(-20)][1],[DynStat.Lust(-20)][2],[DynStat.Lust(-20)][3],[DynStat.Lust(-20)][4],[DynStat.Lust(-20)][5],[DynStat.Lust(-20)][6],[DynStat.Lust(-20)][7],[DynStat.Lust(-20)][8],[DynStat.Lust(-20)][9]);
            }
            else if(int([DynStat.Lust(-20)].length) == 11)
            {
               get_game().player.dynStats([DynStat.Lust(-20)][0],[DynStat.Lust(-20)][1],[DynStat.Lust(-20)][2],[DynStat.Lust(-20)][3],[DynStat.Lust(-20)][4],[DynStat.Lust(-20)][5],[DynStat.Lust(-20)][6],[DynStat.Lust(-20)][7],[DynStat.Lust(-20)][8],[DynStat.Lust(-20)][9],[DynStat.Lust(-20)][10]);
            }
            else if(int([DynStat.Lust(-20)].length) == 12)
            {
               get_game().player.dynStats([DynStat.Lust(-20)][0],[DynStat.Lust(-20)][1],[DynStat.Lust(-20)][2],[DynStat.Lust(-20)][3],[DynStat.Lust(-20)][4],[DynStat.Lust(-20)][5],[DynStat.Lust(-20)][6],[DynStat.Lust(-20)][7],[DynStat.Lust(-20)][8],[DynStat.Lust(-20)][9],[DynStat.Lust(-20)][10],[DynStat.Lust(-20)][11]);
            }
            else if(int([DynStat.Lust(-20)].length) == 13)
            {
               get_game().player.dynStats([DynStat.Lust(-20)][0],[DynStat.Lust(-20)][1],[DynStat.Lust(-20)][2],[DynStat.Lust(-20)][3],[DynStat.Lust(-20)][4],[DynStat.Lust(-20)][5],[DynStat.Lust(-20)][6],[DynStat.Lust(-20)][7],[DynStat.Lust(-20)][8],[DynStat.Lust(-20)][9],[DynStat.Lust(-20)][10],[DynStat.Lust(-20)][11],[DynStat.Lust(-20)][12]);
            }
            else if(int([DynStat.Lust(-20)].length) == 14)
            {
               get_game().player.dynStats([DynStat.Lust(-20)][0],[DynStat.Lust(-20)][1],[DynStat.Lust(-20)][2],[DynStat.Lust(-20)][3],[DynStat.Lust(-20)][4],[DynStat.Lust(-20)][5],[DynStat.Lust(-20)][6],[DynStat.Lust(-20)][7],[DynStat.Lust(-20)][8],[DynStat.Lust(-20)][9],[DynStat.Lust(-20)][10],[DynStat.Lust(-20)][11],[DynStat.Lust(-20)][12],[DynStat.Lust(-20)][13]);
            }
            else if(int([DynStat.Lust(-20)].length) == 15)
            {
               get_game().player.dynStats([DynStat.Lust(-20)][0],[DynStat.Lust(-20)][1],[DynStat.Lust(-20)][2],[DynStat.Lust(-20)][3],[DynStat.Lust(-20)][4],[DynStat.Lust(-20)][5],[DynStat.Lust(-20)][6],[DynStat.Lust(-20)][7],[DynStat.Lust(-20)][8],[DynStat.Lust(-20)][9],[DynStat.Lust(-20)][10],[DynStat.Lust(-20)][11],[DynStat.Lust(-20)][12],[DynStat.Lust(-20)][13],[DynStat.Lust(-20)][14]);
            }
            else if(int([DynStat.Lust(-20)].length) == 16)
            {
               get_game().player.dynStats([DynStat.Lust(-20)][0],[DynStat.Lust(-20)][1],[DynStat.Lust(-20)][2],[DynStat.Lust(-20)][3],[DynStat.Lust(-20)][4],[DynStat.Lust(-20)][5],[DynStat.Lust(-20)][6],[DynStat.Lust(-20)][7],[DynStat.Lust(-20)][8],[DynStat.Lust(-20)][9],[DynStat.Lust(-20)][10],[DynStat.Lust(-20)][11],[DynStat.Lust(-20)][12],[DynStat.Lust(-20)][13],[DynStat.Lust(-20)][14],[DynStat.Lust(-20)][15]);
            }
            else if(int([DynStat.Lust(-20)].length) == 17)
            {
               get_game().player.dynStats([DynStat.Lust(-20)][0],[DynStat.Lust(-20)][1],[DynStat.Lust(-20)][2],[DynStat.Lust(-20)][3],[DynStat.Lust(-20)][4],[DynStat.Lust(-20)][5],[DynStat.Lust(-20)][6],[DynStat.Lust(-20)][7],[DynStat.Lust(-20)][8],[DynStat.Lust(-20)][9],[DynStat.Lust(-20)][10],[DynStat.Lust(-20)][11],[DynStat.Lust(-20)][12],[DynStat.Lust(-20)][13],[DynStat.Lust(-20)][14],[DynStat.Lust(-20)][15],[DynStat.Lust(-20)][16]);
            }
            else if(int([DynStat.Lust(-20)].length) == 18)
            {
               get_game().player.dynStats([DynStat.Lust(-20)][0],[DynStat.Lust(-20)][1],[DynStat.Lust(-20)][2],[DynStat.Lust(-20)][3],[DynStat.Lust(-20)][4],[DynStat.Lust(-20)][5],[DynStat.Lust(-20)][6],[DynStat.Lust(-20)][7],[DynStat.Lust(-20)][8],[DynStat.Lust(-20)][9],[DynStat.Lust(-20)][10],[DynStat.Lust(-20)][11],[DynStat.Lust(-20)][12],[DynStat.Lust(-20)][13],[DynStat.Lust(-20)][14],[DynStat.Lust(-20)][15],[DynStat.Lust(-20)][16],[DynStat.Lust(-20)][17]);
            }
            else if(int([DynStat.Lust(-20)].length) == 19)
            {
               get_game().player.dynStats([DynStat.Lust(-20)][0],[DynStat.Lust(-20)][1],[DynStat.Lust(-20)][2],[DynStat.Lust(-20)][3],[DynStat.Lust(-20)][4],[DynStat.Lust(-20)][5],[DynStat.Lust(-20)][6],[DynStat.Lust(-20)][7],[DynStat.Lust(-20)][8],[DynStat.Lust(-20)][9],[DynStat.Lust(-20)][10],[DynStat.Lust(-20)][11],[DynStat.Lust(-20)][12],[DynStat.Lust(-20)][13],[DynStat.Lust(-20)][14],[DynStat.Lust(-20)][15],[DynStat.Lust(-20)][16],[DynStat.Lust(-20)][17],[DynStat.Lust(-20)][18]);
            }
            else
            {
               if(int([DynStat.Lust(-20)].length) != 20)
               {
                  throw "Too many rest arguments";
               }
               get_game().player.dynStats([DynStat.Lust(-20)][0],[DynStat.Lust(-20)][1],[DynStat.Lust(-20)][2],[DynStat.Lust(-20)][3],[DynStat.Lust(-20)][4],[DynStat.Lust(-20)][5],[DynStat.Lust(-20)][6],[DynStat.Lust(-20)][7],[DynStat.Lust(-20)][8],[DynStat.Lust(-20)][9],[DynStat.Lust(-20)][10],[DynStat.Lust(-20)][11],[DynStat.Lust(-20)][12],[DynStat.Lust(-20)][13],[DynStat.Lust(-20)][14],[DynStat.Lust(-20)][15],[DynStat.Lust(-20)][16],[DynStat.Lust(-20)][17],[DynStat.Lust(-20)][18],[DynStat.Lust(-20)][19]);
            }
         }
         else
         {
            outputText("\n你勉强躲过了这道光束。");
         }
      }
      
      override public function performCombatAction() : void
      {
         var _loc1_:MonsterAI = new MonsterAI();
         _loc1_.add(eAttack,2,true,0,FATIGUE_NONE,CombatRange.Ranged);
         _loc1_.add(eviscerate,1,FlagDict_Impl_.arrayReadInt(get_flags(),2662) >= 2,0,FATIGUE_PHYSICAL,CombatRange.Ranged);
         _loc1_.add(holyLight,1,FlagDict_Impl_.arrayReadInt(get_flags(),2662) >= 3,0,FATIGUE_MAGICAL,CombatRange.Ranged);
         _loc1_.add(purge,1,HPRatio() < 0.6,0,FATIGUE_MAGICAL,CombatRange.Ranged);
         _loc1_.exec();
      }
      
      public function holyLight() : void
      {
         var _loc1_:int = 0;
         outputText("剑从你身边飞走，直冲云霄。你抬头看去，它开始发出耀眼的光芒。在你移开视线之前，它爆发出强烈的闪光，仿佛它本身变成了太阳！");
         if(Utils.rand(2) == 0)
         {
            outputText("你没能及时闭上眼睛；你被<b>致盲</b>了！");
            get_player().createStatusEffect(StatusEffects.Blind,2,0,0,0);
         }
         else
         {
            outputText("你及时眨了眨眼，只感到轻微的眩晕。");
         }
         if(FlagDict_Impl_.arrayReadInt(get_flags(),2662) >= 4)
         {
            outputText("[pg]它散发出的光芒灼烧着你的皮肤，这是它恢复的力量在对抗你的腐化！");
            _loc1_ = int(Utils.rand(50) + get_player().cor / 100);
            _loc1_ = get_player().reduceDamage(_loc1_,this);
            get_player().takeDamage(_loc1_,true);
         }
      }
      
      public function eviscerate() : void
      {
         var _loc2_:int = 0;
         outputText("剑发出淡蓝色的光芒，变得虚幻起来，并向你袭来！");
         var _loc1_:* = combatAvoidDamage(new AvoidDamageParameters(true,false,false,null,null,null,null,null));
         if(_loc1_.dodge == null)
         {
            outputText("这一击痛苦地砍中了你，完全穿透了你的防御！");
            _loc2_ = int(Utils.rand(50) + get_weaponAttack() + get_player().cor / 20);
            get_player().takeDamage(_loc2_,true);
            if(FlagDict_Impl_.arrayReadInt(get_flags(),2662) >= 5)
            {
               if(get_player().bleed(this))
               {
                  outputText("\n紧接着，被幻影剑击中的地方裂开了一道巨大的伤口。你流血了！");
               }
            }
         }
         else
         {
            outputText("你在千钧一发之际躲过了剑的强化攻击。");
         }
      }
      
      override public function defeated(param1:Boolean) : void
      {
         clearOutput();
         outputText("随着最后一击，剑碎成了五块。你走近圣剑的残骸，注意到碎片发出明显的嗡嗡声。看来它们仍然拥有一定程度的力量。");
         get_game().beautifulSwordScene.destroyBeautifulSword();
      }
   }
}

