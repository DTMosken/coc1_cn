package classes.scenes.areas.lake
{
   import classes.CoC;
   import classes.CockTypesEnum;
   import classes.Monster;
   import classes.Player;
   import classes.internals.ChainedDrop;
   import classes.internals.MonsterAI;
   import classes.internals.Utils;
   import classes.items.ConsumableLib;
   import classes.items.UseableLib;
   import classes.items.WeaponLib;
   import classes.scenes.combat.CombatRange;
   import flash.Boot;
   
   public class GreenSlime extends Monster
   {
      
      public function GreenSlime()
      {
         if(Boot.skip_constructor)
         {
            return;
         }
         super();
         set_a("");
         set_short("green slime");
         imageName = "greenslime";
         set_long("这只绿色史莱姆的脸通常没有任何特征，长在宽阔的肩膀上，肩膀上长出粗壮的手臂。它的躯干逐渐变成一个模糊的圆柱体，融入地上的软泥怪中，作为一种临时的移动方式。");
         set_race("Slime");
         createCock(18,2,CockTypesEnum.HUMAN);
         cumMultiplier = 3;
         set_hoursSinceCum(20);
         pronoun1 = "它";
         pronoun2 = "它";
         pronoun3 = "它";
         createBreastRow(0);
         ass.analLooseness = 4;
         ass.analWetness = 5;
         set_tallness(Utils.rand(8) + 80);
         hips.rating = 6;
         butt.rating = 8;
         lowerBody.type = 8;
         skin.tone = "green";
         initStrTouSpeInte(25,20,10,5);
         initLibSensCor(50,60,20);
         set_weaponName("hands");
         set_weaponVerb("slap");
         set_armorName("gelatinous skin");
         bonusHP = 30;
         set_lust(30);
         temperment = 3;
         level = 2;
         set_gems(Utils.rand(5) + 1);
         set_drop(new ChainedDrop().add(get_weapons().PIPE,0.1).add(get_consumables().SLIMYCL,0.5).elseDrop(get_useables().GREENGL));
         checkMonster();
      }
      
      override public function won(param1:Boolean, param2:Boolean = false) : void
      {
         if(param2)
         {
            outputText("[pg]史莱姆似乎根本没有注意到。[pg]");
         }
         get_game().lake.greenSlimeScene.slimeLoss();
      }
      
      override public function performCombatAction() : void
      {
         var _loc1_:MonsterAI = new MonsterAI();
         _loc1_.add(eAttack,1,true,0,FATIGUE_NONE,CombatRange.Melee);
         _loc1_.add(lustAttack,1,true,5,FATIGUE_NONE,CombatRange.Ranged);
         _loc1_.add(lustReduction,1,get_lust() > 0,10,FATIGUE_NONE,CombatRange.Self);
         _loc1_.exec();
      }
      
      public function lustReduction() : void
      {
         outputText("这只生物向后倒去，它的凝聚力开始消散，脸上隐约浮现出眼睛和嘴巴的轮廓。它的胸膛起伏着，仿佛在喘息，它那笔直挺立的勃起肉棒也肉眼可见地颤抖跳动着，随后微微放松下来。");
         set_lust(Math.max(get_lust() - 13,0));
         doNext(get_game().playerMenu);
      }
      
      public function lustAttack() : void
      {
         outputText("这只生物缓慢地向前涌动并挥出一击，你轻松地躲开了。你注意到在它攻击时，有绿色的液体从它身上喷出，形成了一层薄雾，当你吸入时，你的皮肤会因为兴奋而感到刺痛。");
         get_player().takeLustDamage(get_player().lib / 10 + 8,true);
         doNext(get_game().playerMenu);
      }
      
      override public function defeated(param1:Boolean) : void
      {
         get_game().lake.greenSlimeScene.slimeVictory();
      }
   }
}

