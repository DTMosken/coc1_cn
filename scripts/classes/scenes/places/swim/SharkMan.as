package classes.scenes.places.swim
{
   import classes.Appearance;
   import classes.CoC;
   import classes.Monster;
   import classes.Player;
   import classes.StatusEffects;
   import classes._FlagDict.FlagDict_Impl_;
   import classes.internals.MonsterAI;
   import classes.internals.Utils;
   import classes.scenes.combat.CombatAttackBuilder;
   import classes.scenes.combat.CombatRange;
   import flash.Boot;
   import haxe.IMap;
   
   public class SharkMan extends Monster
   {
      
      public var isCharging:Boolean;
      
      public function SharkMan()
      {
         if(Boot.skip_constructor)
         {
            return;
         }
         isCharging = false;
         super();
         set_a("");
         set_short("shark man");
         imageName = "sharkman";
         set_long("你面前的鲨鱼人身形魁梧，充满力量，至少有[if (metric) {一百八十厘米|六英尺}]高。他全身覆盖着灰白相间的皮肤，顶着一头乱蓬蓬的银发。他健美的身躯上装饰着纹身和饰品，其中最奢华的护身符是套在他两根阴茎其中一根上的一枚镶嵌着红宝石的戒指。你可能会猜测他已经五十多岁了，但岁月几乎没有削弱他的力量。他装备着一条断裂的锁链。");
         set_race("Shark-Man");
         createCock(13,2);
         createCock(13,2);
         ass.analLooseness = 1;
         ass.analWetness = 0;
         set_tallness(72);
         createBreastRow(Appearance.breastCupInverse("flat"));
         hips.rating = 0;
         butt.rating = 2;
         skin.tone = "gray";
         hair.color = "silver";
         hair.length = 16;
         initStrTouSpeInte(75,85,80,40);
         initLibSensCor(75,25,40);
         set_weaponName("broken chain");
         set_weaponVerb("slash");
         set_weaponAttack(10);
         set_armorName("tough skin");
         set_armorDef(5);
         bonusHP = 300;
         set_lust(10);
         lustVuln = 0.3;
         temperment = 2;
         level = 15;
         set_gems(Utils.rand(15) + 5);
         set_drop(NO_DROP);
         checkMonster();
      }
      
      override public function won(param1:Boolean, param2:Boolean = false) : void
      {
         get_game().swim.sharkManScene.sharkManWonCombat(param1);
      }
      
      public function thrustGrab() : void
      {
         outputText("疯狂的鲨鱼气呼呼地试图扑倒你，在狂躁的状态下挺动着他的双根肉棒！");
         if(Utils.trueOnceInN(2) || Utils.randomChance(get_player().get_str() * 1.15))
         {
            outputText("[pg]不一会儿，你发现自己被压在湖底，他的肉棒在你的躯干上摩擦和戳刺，让你感到一阵阵的侵犯。");
            get_player().createStatusEffect(StatusEffects.Grappled,0,0);
         }
         else
         {
            outputText("在你躲避他的时候，他只捕捉到了你在水中残留的气味。");
         }
      }
      
      public function thrustFuck() : void
      {
         outputText("好色的鲨鱼继续在你俯卧的身体上耸动，他的肉棒所过之处留下了一道道滑腻的先列腺液。");
         get_player().takeLustDamage(Utils.rand(6) * ((get_player().sens + get_player().cor + get_player().lib) / 100),true);
      }
      
      override public function struggle() : void
      {
         if(!get_player().hasStatusEffect(StatusEffects.Grappled))
         {
            return;
         }
         clearOutput();
         if(Utils.trueOnceInN(3) || Utils.randomChance(get_player().get_str() * 1.25))
         {
            outputText("在扭动和挣扎中，你挣脱了束缚，从疯狂的鲨鱼身下游了出来！");
            get_player().removeStatusEffect(StatusEffects.Grappled);
            takeDamage(get_player().get_str() / 10 + Utils.rand(10));
         }
         else
         {
            outputText("你徒劳地挥舞着四肢，拼命挣扎。");
         }
      }
      
      override public function performCombatAction() : void
      {
         var _loc1_:MonsterAI = new MonsterAI();
         if(isCharging)
         {
            _loc1_.add(chargePt2,1,true,0,0,CombatRange.ChargingMelee);
         }
         else
         {
            _loc1_.add(eAttack,2,true,0,FATIGUE_NONE,CombatRange.Melee);
            if(get_player().hasStatusEffect(StatusEffects.Grappled))
            {
               _loc1_.add(thrustFuck,5,true,0,FATIGUE_NONE,CombatRange.Melee);
            }
            else
            {
               _loc1_.add(thrustGrab,2,true,0,FATIGUE_NONE,CombatRange.Melee);
               _loc1_.add(chargePt1,1,true,0,30,CombatRange.Ranged);
            }
         }
         _loc1_.exec();
      }
      
      override public function outputAttack(param1:int) : void
      {
         if(!isUnarmed())
         {
            outputText("鲨鱼人挥舞着链条向你打来。");
         }
         else
         {
            outputText("鲨鱼人疯狂地挥舞着拳头。");
         }
         if(FlagDict_Impl_.arrayReadInt(get_flags(),2138) > 0)
         {
            outputText("[b:暴击！]");
         }
         outputText(get_game().combat.getDamageText(param1));
      }
      
      override public function onPcRunSuccess() : void
      {
         get_game().swim.sharkManScene.saveContent.hasLost = true;
      }
      
      override public function defeated(param1:Boolean) : void
      {
         get_game().swim.sharkManScene.sharkManLostCombat(param1);
      }
      
      public function chargePt2() : void
      {
         var _loc1_:Boolean = !get_player().hasWaited() && new CombatAttackBuilder().canDodge().executeAttack(false).isSuccessfulHit();
         if(_loc1_)
         {
            outputText("你受到了[b:无情的重击]！");
            §§push(get_player());
            §§push(1);
            var _temp_1:* = 10 * (3 + Math.max(get_game().get_difficulty(),-1));
            §§push(_temp_1);
            if(!(_temp_1 is Number))
            {
               throw "Class cast error";
            }
            §§pop().stun(§§pop(),int(§§pop()));
            get_player().takeDamage(get_player().reduceDamage(20 + get_str() + get_spe() / 2,this),true);
         }
         else
         {
            outputText("你集中精力，在水中冲刺，躲开了鲨鱼人的路线——虽然在他身后的水流中稍微翻滚了一下，但很快就重新调整了方向。");
         }
         isCharging = false;
      }
      
      public function chargePt1() : void
      {
         outputText("鲨鱼咆哮着，呲牙咧嘴，开始越来越快地朝你游来！");
         isCharging = true;
      }
   }
}

