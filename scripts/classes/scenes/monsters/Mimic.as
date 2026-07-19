package classes.scenes.monsters
{
   import classes.CoC;
   import classes.CockTypesEnum;
   import classes.Creature;
   import classes.Monster;
   import classes.PerkLib;
   import classes.Player;
   import classes.internals.MonsterAI;
   import classes.internals.Utils;
   import classes.internals.WeightedChoice;
   import classes.items.ConsumableLib;
   import classes.scenes.combat.AvoidDamageParameters;
   import classes.scenes.combat.CombatDistance;
   import classes.scenes.combat.CombatRange;
   import flash.Boot;
   
   public class Mimic extends Monster
   {
      
      public static var APPEARANCE_ROCK:int = 0;
      
      public static var APPEARANCE_BOOB:int = 1;
      
      public static var APPEARANCE_DICK:int = 2;
      
      public static var APPEARANCE_CHEST:int = 3;
      
      public function Mimic(param1:int = 0)
      {
         if(Boot.skip_constructor)
         {
            return;
         }
         super();
         set_a("");
         set_short("mimic");
         switch(param1)
         {
            case 0:
               imageName = "mimic-stone";
               set_long("这个奇怪的怪物最初伪装成一块巨大的灰色石头，上面覆盖着奇异的符文和符号。它的表面看起来是灰色的，由石头构成。它有一张血盆大口，里面长着数百颗牙齿，还有一条巨大的舌头在四处甩动。");
               break;
            case 1:
               imageName = "mimic-boob";
               set_long("这个奇怪的怪物最初伪装成一个巨大的乳房。它的表面看起来很苍白，让人联想到皮肤。在它本该是乳头的地方，有一张血盆大口，里面长着数百颗牙齿，还有一条细小的鞭状舌头在四处甩动。乳白色的唾液似乎正从它那噩梦般的嘴里漏出来。");
               break;
            case 2:
               imageName = "mimic-cock";
               set_long("这个奇怪的怪物最初伪装成一根巨大的阴茎。它的表面看起来很苍白，让人联想到皮肤。在它本该是尿道的地方，有一张血盆大口，里面长着数百颗牙齿，还有一条细小的鞭状舌头在四处甩动。它的柱体上长出了几十根触手。");
               break;
            default:
               imageName = "mimic-chest";
               set_long("这个奇怪的怪物最初伪装成一个木箱。它的表面看起来是棕色的，由木头构成。在箱体和盖子相接的地方，有一张血盆大口，里面长着数百颗牙齿，还有一条巨大的舌头在四处甩动。");
         }
         set_race("Mimic");
         if(param1 == 2)
         {
            createCock(80,16,CockTypesEnum.HUMAN);
         }
         else
         {
            set_initedGenitals(true);
         }
         balls = 0;
         ballSize = 0;
         if(param1 == 1)
         {
            createBreastRow(199);
         }
         else
         {
            createBreastRow(0);
         }
         ass.analLooseness = 1;
         ass.analWetness = 0;
         set_tallness(Utils.rand(24) + 25);
         hips.rating = 0;
         butt.rating = 2;
         if(param1 == 0)
         {
            skin.tone = "gray";
         }
         if(param1 == 1 || param1 == 2)
         {
            skin.tone = "light";
         }
         else
         {
            skin.tone = "brown";
         }
         hair.color = "none";
         hair.length = 0;
         pronoun1 = "它";
         pronoun2 = "它";
         pronoun3 = "它";
         initStrTouSpeInte(30,45,15,5);
         initLibSensCor(45,45,100);
         set_weaponName("mouth");
         set_weaponVerb("bite");
         set_weaponAttack(20 + get_player().level);
         if(param1 == 0)
         {
            set_armorName("stone surface");
            set_armorDef(70);
         }
         if(param1 == 2 || param1 == 1)
         {
            set_armorName("flesh");
            set_armorDef(0);
         }
         else
         {
            set_armorName("wooden surface");
            set_armorDef(20);
         }
         set_lust(10);
         lustVuln = 0;
         temperment = 1;
         level = 6;
         set_gems(Utils.rand(30) + 11);
         set_drop(new WeightedChoice().add(get_consumables().PPHILTR,4).add(get_consumables().NUMBOIL,4).add(get_consumables().HUMMUS_,3).add(get_consumables().INCUBID,1).add(get_consumables().SUCMILK,1).add(get_consumables().REDUCTO,1));
         special1 = mimicBite;
         createPerk(PerkLib.Immovable);
         checkMonster();
      }
      
      override public function won(param1:Boolean, param2:Boolean = false) : void
      {
         get_game().mimicScene.mimicTentacle2();
      }
      
      override public function performCombatAction() : void
      {
         var _loc1_:MonsterAI = new MonsterAI();
         if(distance == CombatDistance.Distant)
         {
            outputText("怪物原地不动，因为它够不到你。");
            return;
         }
         _loc1_.add(eAttack,1,true,0,FATIGUE_NONE,CombatRange.Melee);
         _loc1_.add(mimicBite,1,true,0,FATIGUE_NONE,CombatRange.Melee);
         _loc1_.exec();
      }
      
      public function mimicBite() : void
      {
         var _loc1_:int = 0;
         outputText("怪物向你猛扑过来，试图咬你！");
         if(Boolean(combatAvoidDamage(new AvoidDamageParameters(true,false,false,null,null,null,null,null)).attackFailed))
         {
            outputText("幸好你躲得够快，避开了它那血盆大口！");
         }
         else
         {
            outputText("哎哟！那张嘴撕裂了你的手臂，疼得要命！");
            _loc1_ = int((10 + get_str() / 2 + Utils.rand(get_str() / 3)) * (1 + get_player().newGamePlusMod() * 0.3));
            _loc1_ = get_player().reduceDamage(_loc1_,this);
            if(_loc1_ < 10)
            {
               _loc1_ = 10;
            }
            get_player().takeDamage(_loc1_,true);
         }
      }
      
      override public function defeated(param1:Boolean) : void
      {
         get_game().mimicScene.killTheMimic();
      }
   }
}

