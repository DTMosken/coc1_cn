package classes.scenes.areas.desert
{
   import classes.CoC;
   import classes.CockTypesEnum;
   import classes.Monster;
   import classes.PerkLib;
   import classes.Player;
   import classes.StatusEffects;
   import classes._FlagDict.FlagDict_Impl_;
   import classes.internals.MonsterAI;
   import classes.internals.Utils;
   import classes.scenes.combat.CombatRange;
   import flash.Boot;
   import haxe.IMap;
   
   public class OasisShaman extends Monster
   {
      
      public var heardChant:Boolean;
      
      public function OasisShaman()
      {
         if(Boot.skip_constructor)
         {
            return;
         }
         heardChant = false;
         super();
         set_a("");
         set_short("oasis shaman");
         imageName = "oasisshaman";
         set_long("在你面前踩水的是一个灰褐色的恶魔，身材苗条而结实。他看起来[if (metric) {将近两米|六英尺多一点}]高，有着海绿色的头发和灰色的眼睛。除了锋利的指甲，他没有任何武器，也没有任何遮蔽物。[if (cor + lib > 66) {诱人的是|不幸的是}]，这让他那根跳动的肉棒漂浮在水面上，让你一览无余。");
         set_race("Demon");
         createCock(8,2,CockTypesEnum.DEMON);
         balls = 2;
         ballSize = 4;
         cumMultiplier = 5;
         createBreastRow();
         ass.analLooseness = 1;
         ass.analWetness = 1;
         set_tallness(72);
         hips.rating = 10;
         butt.rating = 8;
         skin.tone = "greyish-tan";
         hair.color = "sandy-blonde";
         hair.length = 15;
         initStrTouSpeInte(40,40,30,60);
         initLibSensCor(55,40,100);
         set_weaponName("claws");
         set_weaponVerb("claws");
         set_weaponAttack(10);
         set_armorName("skin");
         bonusHP = 120;
         bonusLust = 100;
         set_lust(30);
         temperment = 1;
         level = 6;
         set_gems(Utils.rand(15) + 25);
         set_drop(NO_DROP);
         checkMonster();
      }
      
      override public function won(param1:Boolean, param2:Boolean = false) : void
      {
         get_game().desert.oasisShamanScene.lostToOasisShaman();
      }
      
      override public function performCombatAction() : void
      {
         if(hasStatusEffect(StatusEffects.Chanted) && get_spe() <= 1)
         {
            outputText("恶魔漂浮在水中，晕头转向。");
            return;
         }
         if(!heardChant && hasStatusEffect(StatusEffects.Chanted))
         {
            outputText("这个效果似乎让他大吃一惊；这个萨满恶魔在水中扭动着，脸上带着奇怪的表情。");
            outputText("[pg][say: 你的声音……你是怎么做到的？]");
            heardChant = true;
            return;
         }
         if(hasStatusEffect(StatusEffects.Chanted))
         {
            outputText("[say: 你的美丽……如此接近，却又……][pg]");
         }
         var _loc1_:MonsterAI = new MonsterAI();
         _loc1_.add(eAttack,2,true,0,FATIGUE_NONE,CombatRange.Melee);
         _loc1_.add(eTease,1,true,0,FATIGUE_MAGICAL,CombatRange.Tease);
         _loc1_.add(eArouse,1,true,20,FATIGUE_MAGICAL,CombatRange.Tease);
         _loc1_.exec();
      }
      
      override public function outputAttack(param1:int) : void
      {
         outputText("他在水中滑行，靠近你，用他的爪子刺向你。");
         if(FlagDict_Impl_.arrayReadInt(get_flags(),2138) > 0)
         {
            outputText("[b:暴击！]");
         }
         outputText(get_game().combat.getDamageText(param1));
      }
      
      public function eTease() : void
      {
         var _loc1_:Number = 10;
         outputText("[say: 来吧，我的[lord]，享受我能提供的一切，]他说。这个恶魔抚摸着自己的身体，突显出他的肌肉和身形，并将你的目光吸引到他的肉棒上。");
         get_player().takeLustDamage(_loc1_ + get_player().lib / 20 + Utils.rand(get_player().cor / 20),true);
      }
      
      public function eArouse() : void
      {
         outputText("他用手比划着，形成闪烁的光芒，" + (get_player().hasPerk(PerkLib.LoliliciousBody) ? "对你那充满抗性的肉体几乎不起作用" : "温暖了你的内脏") + "。");
         get_player().takeLustDamage(get_inte() / 10 + get_player().lib / 10 + get_player().sens / 5,true);
      }
      
      override public function defeated(param1:Boolean) : void
      {
         get_game().desert.oasisShamanScene.winCombatOasisShaman(param1);
      }
   }
}

