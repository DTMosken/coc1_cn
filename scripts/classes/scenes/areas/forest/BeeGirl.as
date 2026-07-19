package classes.scenes.areas.forest
{
   import classes.Appearance;
   import classes.CoC;
   import classes.Creature;
   import classes.Monster;
   import classes.Player;
   import classes.StatusEffect;
   import classes.StatusEffects;
   import classes.internals.ChainedDrop;
   import classes.internals.MonsterAI;
   import classes.internals.Utils;
   import classes.items.ConsumableLib;
   import classes.items.UseableLib;
   import classes.scenes.combat.AvoidDamageParameters;
   import classes.scenes.combat.CombatRange;
   import classes.statusEffects.combat.ParalyzeVenomDebuff;
   import flash.Boot;
   
   public class BeeGirl extends Monster
   {
      
      public function BeeGirl()
      {
         if(Boot.skip_constructor)
         {
            return;
         }
         super();
         set_a("");
         set_short("bee-girl");
         imageName = "beegirl";
         set_long("一个蜂女在你周围嗡嗡作响，空气中弥漫着令人陶醉的甜美气味，嗡嗡声钻进你的脑海。她长着一张带有一对小触角的人类面孔，手臂和腿上覆盖着黑色的几丁质，看起来像闪亮的黑色手套和靴子，胸部丰满，肿胀的腹部末端长着一根闪闪发光的毒刺。");
         set_race("Bee-Morph");
         createVagina(false,5,3);
         createBreastRow(Appearance.breastCupInverse("DD"));
         ass.analLooseness = 4;
         ass.analWetness = 1;
         set_tallness(Utils.rand(14) + 59);
         hips.rating = 13;
         butt.rating = 13;
         lowerBody.type = 7;
         skin.tone = "yellow";
         var _loc1_:Array = ["black","black and yellow"];
         var _loc2_:String = _loc1_[Utils.rand(int(_loc1_.length))];
         hair.color = _loc2_;
         hair.length = 6;
         initStrTouSpeInte(30,30,30,20);
         initLibSensCor(60,55,0);
         set_weaponName("chitin-plated fist");
         set_weaponVerb("armored punch");
         set_armorName("chitin");
         set_armorDef(18);
         set_lust(20 + Utils.rand(40));
         lustVuln = 0.9;
         temperment = 3;
         level = 4;
         set_gems(Utils.rand(15) + 1);
         set_drop(new ChainedDrop().add(get_consumables().OVIELIX,0.1).add(get_consumables().W__BOOK,0.1).add(get_consumables().BEEHONY,0.5).elseDrop(get_useables().B_CHITN));
         antennae.type = 2;
         wings.type = 1;
         tail.type = 6;
         tail.venom = 100;
         checkMonster();
      }
      
      override public function won(param1:Boolean, param2:Boolean = false) : void
      {
         if(param2)
         {
            outputText("[pg]蜂女脸色苍白，带着厌恶的表情后退。[pg]");
            get_game().combat.cleanupAfterCombat();
         }
         else
         {
            get_game().forest.beeGirlScene.beeRapesYou();
         }
      }
      
      override public function performCombatAction() : void
      {
         var _loc1_:MonsterAI = new MonsterAI();
         _loc1_.add(eAttack,1,true,0,FATIGUE_NONE,CombatRange.Ranged);
         _loc1_.add(beeStingAttack,1,true,0,FATIGUE_PHYSICAL,CombatRange.Ranged);
         _loc1_.exec();
      }
      
      override public function defeated(param1:Boolean) : void
      {
         get_game().forest.beeGirlScene.beeGirlPCVictory(param1);
      }
      
      public function beeStingAttack() : void
      {
         var _loc2_:* = null as Array;
         var _loc3_:int = 0;
         var _loc4_:* = null as ParalyzeVenomDebuff;
         var _loc1_:* = combatAvoidDamage(new AvoidDamageParameters(true,false,false,null,null,null,null,null));
         if(_loc1_.dodge != null)
         {
            _loc2_ = ["你险险地避开了" + get_a() + Utils.cnName(get_short()) + "的毒刺！","你以极快的速度躲开了" + get_a() + Utils.cnName(get_short()) + "的毒刺！","你灵巧地避开了" + get_a() + Utils.cnName(get_short()) + "缓慢的刺击。"];
            outputText(_loc2_[Utils.rand(int(_loc2_.length))]);
            return;
         }
         if(Boolean(_loc1_.block))
         {
            outputText("你及时举起盾牌，挡住了" + get_a() + Utils.cnName(get_short()) + "的毒刺！");
            return;
         }
         if(get_player().get_armorDef() >= 10 && Utils.rand(4) > 0)
         {
            outputText("尽管她尽了最大努力，" + get_a() + Utils.cnName(get_short()) + "的毒刺攻击还是无法穿透你的盔甲。");
            return;
         }
         if(Utils.rand(2) == 0)
         {
            outputText("当" + get_a() + Utils.cnName(get_short()) + "成功刺中你时，一阵灼痛刺穿了你！你踉跄着后退了一步，差点绊倒，脸涨得通红。");
            outputText("哦，不！你被注射了某种催情剂。你必须保持专注，你不能去想……做爱……");
            if(get_player().get_gender() == 1)
            {
               outputText("或者滴着蜂蜜的湿润小穴在向你招手。");
            }
            if(get_player().get_gender() == 2)
            {
               outputText("把发胀的性器压在她的脸上，同时舔舐她甜蜜的蜜罐。");
            }
            if(get_player().get_gender() == 3)
            {
               outputText("或者肉棒、乳房和肿胀的乳头。");
            }
            _loc3_ = 25;
            get_player().takeLustDamage(_loc3_,true);
            if(get_player().get_lust100() > 60)
            {
               outputText("你摇摇头，努力保持专注，");
               if(get_player().get_gender() == 1 || get_player().get_gender() == 3)
               {
                  outputText("但胯下敏感的凸起让这变得很困难。");
               }
               if(get_player().get_gender() == 2)
               {
                  outputText("但无法忽视胯下湿透的感觉。");
               }
               if(get_player().get_sens100() > 50)
               {
                  outputText("你敏感的乳头在你的[armor]下紧紧摩擦。");
               }
            }
            else
            {
               outputText("你摇了摇头，把那些杂念甩出脑海，将注意力集中在眼前的任务上。");
            }
            if(!get_player().hasStatusEffect(StatusEffects.lustvenom))
            {
               get_player().createStatusEffect(StatusEffects.lustvenom,0,0,0,0);
            }
         }
         else
         {
            outputText("当" + get_a() + Utils.cnName(get_short()) + "成功刺中你时，一阵灼痛感贯穿了你的全身！你踉跄着后退了一步，险些绊倒，发现自己很难移动。");
            _loc4_ = get_player().statusEffectByType(StatusEffects.ParalyzeVenom);
            if(_loc4_ != null)
            {
               outputText("移动变得越来越困难了，你不确定自己还能承受多少次这样的刺击！");
            }
            else
            {
               _loc4_ = new ParalyzeVenomDebuff();
               get_player().addStatusEffect(_loc4_);
               outputText("你中了麻痹毒液！最好速战速决！");
            }
            _loc4_.increase();
         }
         if(get_player().get_lust() >= get_player().maxLust())
         {
            doNext(get_game().combat.endLustLoss);
         }
         else
         {
            doNext(get_game().playerMenu);
         }
      }
   }
}

