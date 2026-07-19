package classes.scenes.dungeons.deepCave
{
   import classes.CoC;
   import classes.CockTypesEnum;
   import classes.Creature;
   import classes.Monster;
   import classes.Player;
   import classes.StatusEffects;
   import classes.internals.Utils;
   import classes.internals.WeightedChoice;
   import classes.items.ArmorLib;
   import classes.scenes.combat.AvoidDamageParameters;
   import flash.Boot;
   
   public class ImpHorde extends Monster
   {
      
      public var dungeon:String;
      
      public function ImpHorde(param1:String = undefined)
      {
         if(Boot.skip_constructor)
         {
            return;
         }
         dungeon = "DeepCave";
         super();
         dungeon = param1;
         set_a("");
         set_short("imp horde");
         imageName = "impmob";
         set_long("各种体型和大小的小恶魔挤满了你周围的房间，将你团团包围。你可以看到不少小恶魔顶着不成比例的勃起，甚至还有一些长着奇特的狗鸡巴、马鸡巴，以及奇怪的带刺猫鸡巴。逃跑是不可能的，你只能靠战斗或色诱来杀出一条血路！");
         set_race("Imp");
         set_plural(true);
         pronoun1 = "they";
         pronoun2 = "them";
         pronoun3 = "their";
         createCock(12,2,CockTypesEnum.DEMON);
         balls = 2;
         ballSize = 1;
         createBreastRow(0);
         ass.analLooseness = 1;
         ass.analWetness = 0;
         createStatusEffect(StatusEffects.BonusACapacity,10,0,0,0);
         set_tallness(36);
         hips.rating = 2;
         butt.rating = 2;
         skin.tone = "red";
         hair.color = "black";
         hair.length = 1;
         initStrTouSpeInte(20,10,25,12);
         initLibSensCor(45,45,100);
         set_weaponName("fists");
         set_weaponVerb("punches");
         set_armorName("skin");
         bonusHP = 450;
         set_lust(10);
         lustVuln = 0.5;
         temperment = 2;
         level = 10;
         set_gems(20 + Utils.rand(25));
         additionalXP = 50;
         set_drop(new WeightedChoice(get_armors().NURSECL,1));
         wings.type = 5;
         checkMonster();
      }
      
      override public function won(param1:Boolean, param2:Boolean = false) : void
      {
         if(param2)
         {
            outputText("[pg]你的敌人们似乎并没有被吓退……");
            doNext(get_game().combat.endLustLoss);
         }
         else
         {
            get_game().dungeons.deepcave.loseToImpMob();
         }
      }
      
      override public function performCombatAction() : void
      {
         impGangAI();
      }
      
      public function imtacularMultiHitzilla() : void
      {
         if(!hasStatusEffect(StatusEffects.Blind))
         {
            outputText("小恶魔们如潮水般向你涌来，用爪子撕扯着你！\n");
         }
         else
         {
            outputText("尽管它们看不见，但在它们兄弟的爪子的帮助下，它们中的大多数还是找到了你。\n");
         }
         var _loc1_:Number = Utils.rand(5) + 2;
         var _loc2_:Number = 0;
         while(_loc1_ > 0)
         {
            _loc2_ = 0;
            if(!playerAvoidDamage(new AvoidDamageParameters(null,null,null,null,null,null,null,null)))
            {
               if(_loc1_ == 6)
               {
                  outputText("你被一个小恶魔恶毒地抓伤了！");
               }
               if(_loc1_ == 5)
               {
                  outputText("一只小恶魔咬了你的脚踝！");
               }
               if(_loc1_ == 4)
               {
                  outputText("一只小恶魔用爪子抓伤了你的后背。");
               }
               if(_loc1_ == 3)
               {
                  outputText("其中一个小混蛋抓伤了你的腿！");
               }
               if(_loc1_ == 2)
               {
                  outputText("另一只小恶魔重重地给了你肚子一拳！");
               }
               if(_loc1_ == 1)
               {
                  outputText("你的手臂被抓得血肉模糊！");
               }
               _loc2_ = 20 - Utils.rand(get_player().get_tou() / 10);
               if(_loc2_ <= 0)
               {
                  _loc2_ = 1;
               }
               get_player().takeDamage(_loc2_,true);
               outputText("\n");
            }
            _loc1_--;
         }
      }
      
      public function impGangUber() : void
      {
         if(!hasStatusEffect(StatusEffects.ImpUber))
         {
            outputText("房间另一边的三只小恶魔闭上眼睛，开始低声念诵黑暗与力量的咒语。你睁大眼睛，认出了这个法术。除了那个什么都行！它们正在准备一个强大的催情法术！它们不停地嘟囔和比划，你意识到你只有一个回合的时间来阻止它们！\n");
            createStatusEffect(StatusEffects.ImpUber,0,0,0,0);
         }
         else
         {
            outputText("后面的小恶魔完成了施法，齐刷刷地指向你。一股纯粹的催情波动像货运列车一样撞击着你。你的装备摩擦着你突然变得极其敏感的[nipple]");
            if(get_player().biggestLactation() > 1)
            {
               outputText("，它们开始滴下乳汁");
            }
            outputText("。你下半身的衣物");
            if(get_player().cockTotal() > 0)
            {
               outputText("被你的" + get_player().multiCockDescript() + "撑得紧紧的，");
               if(get_player().totalCocks() > 1)
               {
                  outputText("每一根");
               }
               outputText("在顶端渗出一滴先列腺液");
               if(get_player().hasVagina())
               {
                  outputText("，此外，你腹股沟周围的衣服");
               }
            }
            if(get_player().hasVagina())
            {
               outputText("被女性的淫液弄脏了");
               if(get_player().getClitLength() > 3)
               {
                  outputText("，因为你的阴蒂肿胀起来，变得更加敏感，就像是在模仿阴茎一样");
               }
            }
            if(get_player().get_gender() == 0)
            {
               outputText("摩擦着你大腿和毫无特征的腹股沟上敏感的皮肤，让你希望自己能有某种性别特征");
            }
            outputText("。");
            get_player().takeLustDamage(50,true);
            removeStatusEffect(StatusEffects.ImpUber);
         }
      }
      
      public function impGangBukkake() : void
      {
         var _loc3_:* = null;
         outputText("许多小恶魔被你激起的欲望所征服。它们在你周围的半空中盘旋，抽插着它们各种各样的恶魔肉棒，让自己达到高潮。\n");
         var _loc1_:Number = Utils.rand(5) + 2;
         var _loc2_:Number = 0;
         while(_loc1_ > 0)
         {
            _loc3_ = combatAvoidDamage(new AvoidDamageParameters(true,false,false,null,null,null,null,null));
            _loc2_ = 0;
            if(_loc3_.dodge == EVASION_BLIND)
            {
               outputText(get_capitalA() + Utils.cnName(get_short()) + "的精液到处乱飞。有几股甚至都没落在你附近！\n");
            }
            else if(_loc3_.dodge != null)
            {
               _loc2_ = Utils.rand(4);
               if(_loc2_ == 0)
               {
                  outputText("你惊险地侧身躲开，一团精液溅到了地板上。\n");
               }
               else if(_loc2_ == 1)
               {
                  outputText("其中一个小恶魔射得太猛了，精液直接从你头顶飞过，把墙壁染成了白色。\n");
               }
               else if(_loc2_ == 2)
               {
                  outputText("你低头躲过了一团精液，它无害地从你身边飞过。你身后传来一声沉闷的厌恶的咕哝声。\n");
               }
               else if(_loc2_ == 3)
               {
                  outputText("你轻松地避开了一股白色的液体。\n");
               }
            }
            else
            {
               _loc2_ = Utils.rand(6);
               if(_loc2_ == 0)
               {
                  outputText("一股滚烫的恶魔精液溅到了你的脸上！");
               }
               if(_loc2_ == 1)
               {
                  outputText("你的" + get_player().allBreastsDescript() + "上沾满了浓稠的恶魔精液！");
               }
               if(_loc2_ == 2)
               {
                  outputText("一些液体溅到了你的腹部，流到了你的腰间，让你的[armor]变得黏糊糊的。");
               }
               if(_loc2_ == 3)
               {
                  outputText("精液落在了你的[hair]上，让你沾满了恶魔的体液。");
               }
               if(_loc2_ == 4)
               {
                  outputText("又是一股精液溅到了你的脸上，涂满了你的嘴唇，迫使你尝到了一点味道。");
               }
               if(_loc2_ == 5)
               {
                  outputText("最后一次喷发的精液浸透了你的大腿和[armor]的下半部分，把它变成了黏糊糊的白色。");
               }
               get_player().takeLustDamage(7 + (int(get_player().lib / 40 + get_player().cor / 40)),true);
            }
            set_lust(get_lust() - 5);
            _loc1_--;
         }
      }
      
      public function impGangAI() : void
      {
         var _loc1_:Number = NaN;
         if(hasStatusEffect(StatusEffects.ImpUber))
         {
            impGangUber();
         }
         else if(get_lust100() > 50 && Utils.rand(2) == 0)
         {
            impGangBukkake();
         }
         else
         {
            _loc1_ = Utils.rand(4);
            if(_loc1_ < 3 && !(dungeon == "Liddellium" && get_player().hasStatusEffect(StatusEffects.Grappled)))
            {
               imtacularMultiHitzilla();
            }
            else
            {
               impGangUber();
            }
         }
         if(Utils.rand(2) == 0)
         {
            outputText("\n其中一只小恶魔抱住你的一条[legs]，开始在上面耸动。你把这个小混蛋甩开，继续战斗！");
            get_player().takeLustDamage(1,true);
         }
      }
      
      override public function defeated(param1:Boolean) : void
      {
         if(dungeon == "DeepCave")
         {
            get_game().dungeons.deepcave.impGangVICTORY();
         }
         else if(dungeon == "Liddellium")
         {
            get_game().liddelliumEventDungeon.demonCampScene(true);
         }
      }
   }
}

