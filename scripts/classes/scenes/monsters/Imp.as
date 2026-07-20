package classes.scenes.monsters
{
   import classes.CoC;
   import classes.CockTypesEnum;
   import classes.Monster;
   import classes.Player;
   import classes.StatusEffects;
   import classes.Vagina;
   import classes._FlagDict.FlagDict_Impl_;
   import classes.globalFlags.KFLAGS;
   import classes.internals.MonsterAI;
   import classes.internals.Utils;
   import classes.internals.WeightedChoice;
   import classes.items.ConsumableLib;
   import classes.items.ShieldLib;
   import classes.scenes.combat.CombatRange;
   import flash.Boot;
   import haxe.IMap;
   
   public class Imp extends Monster
   {
      
      public function Imp(param1:Boolean = false, param2:int = 1)
      {
         if(Boot.skip_constructor)
         {
            return;
         }
         super();
         if(param1)
         {
            return;
         }
         set_a("");
         set_short("imp");
         imageName = "imp";
         set_long("[Themonster]个子很矮，只有[if (metric) {差不多一米|几英尺}]高。一头蓬乱的黑色长发从他头上垂下，被两根弯曲的短角分开。他的眼睛是纯黑色的，只有微小的红色虹膜闪烁着邪恶的意图。他的皮肤是鲜红色的，除了腰带上的一小块遮阴布外，没有穿任何衣服或盔甲。他的脚上穿着小木凉鞋，手上长着锋利的爪子。一对微小但实用的翅膀偶尔在他的背上拍打着。");
         set_race("Imp");
         createCock(Utils.rand(2) + 11,2.5,CockTypesEnum.DEMON);
         balls = 2;
         ballSize = 1;
         createBreastRow(0);
         ass.analLooseness = 4;
         ass.analWetness = 1;
         set_tallness(Utils.rand(24) + 25);
         hips.rating = 0;
         butt.rating = 2;
         skin.tone = "red";
         hair.color = "black";
         hair.length = 5;
         initStrTouSpeInte(20,10,25,12);
         initLibSensCor(45,45,100);
         set_weaponName("claws");
         set_weaponVerb("claw-slash");
         set_armorName("leathery skin");
         set_lust(40);
         temperment = 1;
         level = param2;
         set_gems(Utils.rand(5) + 5);
         set_drop(new WeightedChoice().add(get_consumables().SUCMILK,3).add(get_consumables().INCUBID,3).add(get_consumables().IMPFOOD,4).add(get_shields().WOODSHL,1));
         wings.type = 5;
         checkMonster();
      }
      
      override public function won(param1:Boolean, param2:Boolean = false) : void
      {
         var hpVictory1:Boolean;
         var _g:ImpScene;
         if(hasStatusEffect(StatusEffects.KitsuneFight))
         {
            get_game().forest.kitsuneScene.loseKitsuneImpFight();
         }
         else if(get_player().isChild() && get_player().hasVirginVagina() && !get_player().isTaur())
         {
            get_game().impScene.loliVirginRape();
         }
         else if(param2)
         {
            outputText("[pg]小恶魔看着你已经堕落的状态，咧嘴笑了起来……");
            _g = get_game().impScene;
            hpVictory1 = false;
            doNext(function():void
            {
               _g.impRapesYou(hpVictory1);
            });
         }
         else
         {
            get_game().impScene.impRapesYou(param1);
         }
      }
      
      override public function performCombatAction() : void
      {
         var _loc1_:MonsterAI = new MonsterAI();
         _loc1_.add(lustMagicAttack,1,true,10,FATIGUE_MAGICAL,CombatRange.Ranged);
         _loc1_.add(eAttack,1,true,0,FATIGUE_NONE,CombatRange.Melee);
         _loc1_.exec();
      }
      
      public function lustMagicAttack() : void
      {
         var _loc2_:Number = NaN;
         outputText("你看到" + get_a() + Utils.cnName(get_short()) + "突然对你做出神秘的手势！[pg]");
         var _loc1_:int = int(get_player().lib / 10 + get_player().cor / 10 + 10);
         if(get_player().get_lust100() < 30)
         {
            outputText("你感到一阵奇怪的燥热。");
         }
         else if(get_player().get_lust100() < 60)
         {
            outputText("血液涌向你的下体，一阵强烈的性奋感袭来，让你的双腿发软。");
         }
         else
         {
            outputText("你给小恶魔口交和与它做爱的画面不断冲击着你的脑海，让你产生了不正常的性奋。");
         }
         if(int(get_player().cocks.length) > 0)
         {
            if(get_player().get_lust100() >= 60)
            {
               outputText("你感觉到你的[cocks]滴下了先列腺液。");
            }
            else if(get_player().get_lust100() >= 30 && int(get_player().cocks.length) == 1)
            {
               outputText("你的[cock]硬了起来，让你更加分心。");
            }
            else if(get_player().get_lust100() >= 30 && int(get_player().cocks.length) > 1)
            {
               outputText("你的[cocks]硬得让你很不舒服。");
            }
         }
         if(get_player().get_lust100() >= 60 && get_player().hasVagina())
         {
            _loc2_ = get_player().vaginas[0].vaginalWetness;
            if(_loc2_ == 1)
            {
               outputText("你的" + get_player().allVaginaDescript() + "明显湿润了。");
            }
            else if(_loc2_ == 2)
            {
               outputText("你的胯部因为雌性的欲望变得黏糊糊的。");
            }
            else if(_loc2_ == 3)
            {
               outputText("你的" + get_player().allVaginaDescript() + "变得泥泞湿滑。");
            }
            else if(_loc2_ == 4)
            {
               outputText("浓稠的淫液顺着你的大腿内侧流了下来。");
            }
            else if(_loc2_ == 5)
            {
               outputText("你的" + get_player().allVaginaDescript() + "立刻浸湿了" + (int(get_player().vaginas.length) > 1 ? "" : "") + "你的腹股沟。");
            }
         }
         get_player().takeLustDamage(_loc1_,true);
      }
      
      override public function defeated(param1:Boolean) : void
      {
         var _loc2_:IMap = KFLAGS.flags;
         FlagDict_Impl_.arrayWriteInt(_loc2_,2075,FlagDict_Impl_.arrayReadInt(_loc2_,2075) + 1);
         if(hasStatusEffect(StatusEffects.KitsuneFight))
         {
            get_game().forest.kitsuneScene.winKitsuneImpFight();
         }
         else
         {
            get_game().impScene.impVictory();
         }
      }
   }
}

