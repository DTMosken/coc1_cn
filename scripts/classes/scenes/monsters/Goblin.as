package classes.scenes.monsters
{
   import classes.Appearance;
   import classes.CoC;
   import classes.Monster;
   import classes.PerkLib;
   import classes.Player;
   import classes.StatusEffects;
   import classes.internals.MonsterAI;
   import classes.internals.Utils;
   import classes.internals.WeightedChoice;
   import classes.items.ConsumableLib;
   import classes.items.Shield;
   import classes.scenes.combat.Combat;
   import classes.scenes.combat.CombatRange;
   import flash.Boot;
   
   public class Goblin extends Monster
   {
      
      public function Goblin(param1:Boolean = false)
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
         set_short("goblin");
         imageName = "goblin";
         set_long("你面前的这只地精是她这个物种的典型代表，有着深绿色的皮肤、尖尖的耳朵，以及一头在朋克摇滚歌手头上会显得更搭的紫发。她只有大约三英尺高，但她那曲线优美的身体弥补了这一点，如果她是正常体型，她那丰满的臀部和乳房足以诱惑你们村里的任何男人。她身上一丝不挂，只有淫荡的皮带和几个叮当作响的袋子。她身上确实有很多穿孔——最引人注目的是她紫色乳头上挂着的大乳钉。她的眼睛火红，几乎闪烁着情欲的光芒。如果不让她对你为所欲为，这家伙是不会满足的。制服这么个小生物应该不会太难，对吧？");
         set_race("Goblin");
         createVagina(false,4,1);
         createStatusEffect(StatusEffects.BonusVCapacity,40,0,0,0);
         createBreastRow(Appearance.breastCupInverse("E"));
         ass.analLooseness = 1;
         ass.analWetness = 0;
         createStatusEffect(StatusEffects.BonusACapacity,30,0,0,0);
         set_tallness(35 + Utils.rand(4));
         hips.rating = 8;
         butt.rating = 8;
         skin.tone = "dark green";
         hair.color = "purple";
         hair.length = 4;
         initStrTouSpeInte(12,13,35,42);
         initLibSensCor(45,45,60);
         set_weaponName("fists");
         set_weaponVerb("tiny punch");
         set_armorName("leather straps");
         set_lust(50);
         temperment = 2;
         level = 1;
         set_gems(Utils.rand(5) + 5);
         set_drop(new WeightedChoice().add(get_consumables().GOB_ALE,5).addMany(1,get_consumables().L_DRAFT,get_consumables().PINKDYE,get_consumables().BLUEDYE,get_consumables().ORANGDY,get_consumables().PURPDYE));
         checkMonster();
      }
      
      override public function won(param1:Boolean, param2:Boolean = false) : void
      {
         var _g:Combat;
         if(get_player().get_gender() == 0)
         {
            outputText("你倒在地精面前，伤得太重无法战斗。她咯咯地笑着，拿出一管口红，放荡地涂在你的脸上。你立刻失去了知觉。那口红里一定下了药。");
            get_game().combat.cleanupAfterCombat();
         }
         else if(param2)
         {
            outputText("[pg]地精睁大了眼睛，转身离开，对你不再感兴趣。");
            get_player().orgasm("Generic");
            _g = get_game().combat;
            doNext(function():void
            {
               _g.cleanupAfterCombat();
            });
         }
         else
         {
            get_game().goblinScene.goblinRapesPlayer();
         }
      }
      
      override public function runCheck() : void
      {
         if(get_player().hasStatusEffect(StatusEffects.NoFlee))
         {
            outputText("你试图逃跑，但被周围粘稠的白色粘液困住了。[pg]");
            get_game().combat.startMonsterTurn();
         }
         else
         {
            super.runCheck();
         }
      }
      
      override public function performCombatAction() : void
      {
         var _loc1_:MonsterAI = new MonsterAI();
         _loc1_.add(goblinDrugAttack,1,true,10,FATIGUE_PHYSICAL,CombatRange.Ranged);
         _loc1_.add(goblinTeaseAttack,1,true,0,FATIGUE_NONE,CombatRange.Tease);
         _loc1_.add(eAttack,1,true,0,FATIGUE_NONE,CombatRange.Melee);
         _loc1_.exec();
      }
      
      public function goblinTeaseAttack() : void
      {
         var _loc1_:Number = Utils.rand(3);
         if(get_short() == "goblin" || get_short() == "goblin assassin" || get_short() == "Tamani")
         {
            if(_loc1_ == 0)
            {
               outputText(get_capitalA() + Utils.cnName(get_short()) + "双手抚摸着她那穿着皮衣的身体，并向你飞吻。[say:为什么不体验一下狂野的一面呢？]她问道。");
            }
            if(_loc1_ == 1)
            {
               outputText(get_capitalA() + Utils.cnName(get_short()) + "抓住她的脚跟，将其举过头顶，展示出惊人的柔韧性。她抚摸着自己的私处，向你抛了个媚眼。");
            }
            if(_loc1_ == 2)
            {
               outputText(get_capitalA() + Utils.cnName(get_short()) + "弯下腰，向你展示并摇晃着她那心形的屁股。她回头看着你，吸吮着手指，眨着睫毛。");
            }
         }
         else if(get_short() == "goblin warrior")
         {
            if(_loc1_ == 0)
            {
               outputText(get_capitalA() + Utils.cnName(get_short()) + "双手抚摸着她那穿着金属盔甲的身体，并向你飞吻。[say:为什么不体验一下狂野的一面呢？]她问道。");
            }
            if(_loc1_ == 1)
            {
               outputText("尽管穿着盔甲，" + get_capitalA() + Utils.cnName(get_short()) + "还是抓住她的脚跟，将其举过头顶，展示出惊人的柔韧性。她抚摸着自己的私处，向你抛了个媚眼。");
            }
            if(_loc1_ == 2)
            {
               outputText(get_capitalA() + Utils.cnName(get_short()) + "弯下腰，向你展示并摇晃着她那心形的屁股。她回头看着你，吸吮着手指，眨着睫毛。");
            }
         }
         else if(get_short() == "goblin shaman")
         {
            if(_loc1_ == 0)
            {
               outputText(get_capitalA() + Utils.cnName(get_short()) + "双手抚摸着她那穿着皮衣的身体，并向你飞吻。[say:为什么不体验一下狂野的一面呢？]她问道。");
            }
            if(_loc1_ == 1)
            {
               outputText(get_capitalA() + Utils.cnName(get_short()) + "抓住她的脚跟，将其举过头顶，展示出惊人的柔韧性。她掀起缠腰布，抚摸着自己的私处，向你抛了个媚眼。");
            }
            if(_loc1_ == 2)
            {
               outputText(get_capitalA() + Utils.cnName(get_short()) + "弯下腰，向你展示并摇晃着她那心形的屁股。她回头看着你，吸吮着手指，眨着睫毛。");
            }
         }
         else if(get_short() == "goblin elder")
         {
            if(_loc1_ == 0)
            {
               outputText(get_capitalA() + Utils.cnName(get_short()) + "双手抚摸着她那穿着骨甲的身体，并向你飞吻。[say:为什么不体验一下狂野的一面呢？]她问道。");
            }
            if(_loc1_ == 1)
            {
               outputText(get_capitalA() + Utils.cnName(get_short()) + "抓住她的脚跟，将其举过头顶，展示出惊人的柔韧性。她掀起缠腰布，抚摸着自己的私处，向你抛了个媚眼。");
            }
            if(_loc1_ == 2)
            {
               outputText(get_capitalA() + Utils.cnName(get_short()) + "弯下腰，向你展示并摇晃着她那心形的屁股。她回头看着你，吸吮着手指，眨着睫毛。");
            }
         }
         var _loc2_:int = Utils.rand(get_player().lib / 10) + 8;
         if(get_short() == "goblin assassin")
         {
            _loc2_ *= 1.4;
         }
         if(get_short() == "goblin warrior")
         {
            _loc2_ *= 1.6;
         }
         if(get_short() == "goblin shaman" || get_short() == "Tamani")
         {
            _loc2_ *= 1.6;
         }
         if(get_short() == "goblin elder")
         {
            _loc2_ *= 2;
         }
         outputText("这一幕让你分心了足够长的时间，以至于你没能利用她尴尬的姿势，让你感到有些脸红。");
         get_player().takeLustDamage(_loc2_,true);
         outputText("[pg]");
      }
      
      public function goblinDrugAttack() : void
      {
         var _loc1_:Number = Utils.rand(2);
         var _loc2_:Number = 1;
         if(get_short() == "goblin assassin")
         {
            _loc2_ += 0.2;
         }
         if(get_short() == "goblin shaman")
         {
            _loc2_ += 0.4;
         }
         if(get_short() == "goblin warrior")
         {
            _loc2_ += 0.5;
         }
         if(get_short() == "goblin elder")
         {
            _loc2_++;
         }
         _loc2_ += get_player().newGamePlusMod() * 0.5;
         if(get_short() == "Tamani")
         {
            _loc1_ = Utils.rand(5);
         }
         if(get_short() == "Tamani\'s daughters")
         {
            _loc1_ = Utils.rand(5);
         }
         var _loc3_:String = "";
         if(_loc1_ == 0)
         {
            _loc3_ = "red";
         }
         if(_loc1_ == 1)
         {
            _loc3_ = "green";
         }
         if(_loc1_ == 2)
         {
            _loc3_ = "blue";
         }
         if(_loc1_ == 3)
         {
            _loc3_ = "white";
         }
         if(_loc1_ == 4)
         {
            _loc3_ = "black";
         }
         if(_loc3_ != "blue")
         {
            if(get_short() == "Tamani\'s daughters")
            {
               outputText("塔玛尼拔出一个装满" + Utils.cnName(_loc3_) + "液体的玻璃瓶的塞子，挥动手臂，向你泼来一波液体。");
            }
            else
            {
               outputText(get_capitalA() + Utils.cnName(get_short()) + "拔开一个装满" + Utils.cnName(_loc3_) + "液体的玻璃瓶塞，挥动手臂，向你泼来一波液体。");
            }
            if(get_player().hasPerk(PerkLib.Evade) && Utils.rand(10) <= 3 || Utils.rand(100) < get_player().get_spe() / 5)
            {
               outputText("\n你险之又险地躲过了喷涌而来的炼金液体！\n");
            }
            else if(get_player().get_shield() == get_game().shields.DRGNSHL && Utils.rand(2) == 0)
            {
               outputText("\n液体击中了你的护盾，被无害地吸收了。\n");
            }
            else if(_loc3_ == "red")
            {
               outputText("\n红色的液体击中了你，瞬间渗入你的皮肤消失不见。你的皮肤泛起红晕，感觉浑身发热。糟了……\n");
               if(!get_player().hasStatusEffect(StatusEffects.TemporaryHeat))
               {
                  get_player().createStatusEffect(StatusEffects.TemporaryHeat,0,_loc2_,0,0);
               }
            }
            else if(_loc3_ == "green")
            {
               outputText("\n绿色的液体溅了你一身，让你感觉黏糊糊的，十分恶心。强烈的恶心感立刻袭来——你中毒了！\n");
               if(!get_player().hasStatusEffect(StatusEffects.Poison))
               {
                  get_player().createStatusEffect(StatusEffects.Poison,0,_loc2_,0,0);
               }
            }
            else if(_loc3_ == "white")
            {
               outputText("\n你试图躲避，但它在你周围的地上溅满了非常粘稠的白色液体，让你难以跑动。你现在很难逃脱了！\n");
               if(!get_player().hasStatusEffect(StatusEffects.NoFlee))
               {
                  get_player().createStatusEffect(StatusEffects.NoFlee,0,0,0,0);
               }
            }
            else if(_loc3_ == "black")
            {
               outputText("\n黑色的液体溅了你一身，几乎瞬间就渗入了你的皮肤。它让你感到疲倦和昏昏欲睡。\n");
               get_player().changeFatigue(10 + Utils.rand(25) * _loc2_);
            }
            outputText("\n");
            return;
         }
         if(get_short() == "Tamani\'s daughters")
         {
            outputText("塔玛尼拿出一个蓝色的药瓶并打开盖子，然后将里面的东西泼在怪物群身上。");
            if(HPRatio() < 1)
            {
               outputText("尽管不如直接喝下去有效，但这药水似乎还是帮助地精们恢复了伤势！\n");
               addHP(80 * _loc2_);
            }
            else
            {
               outputText("似乎没有任何效果。\n");
            }
            outputText("\n");
         }
         else
         {
            outputText(get_capitalA() + Utils.cnName(get_short()) + "掏出一个蓝色的小瓶并拔开瓶盖，迅速将里面的东西一饮而尽。");
            if(HPRatio() < 1)
            {
               outputText("她看起来已经从一些伤势中恢复过来了！\n");
               addHP(maxHP() / 4 * _loc2_);
               if(get_short() == "Tamani")
               {
                  addHP(maxHP() / 4 * _loc2_);
               }
            }
            else
            {
               outputText("似乎没有任何效果。\n");
            }
         }
      }
      
      override public function defeated(param1:Boolean) : void
      {
         get_game().goblinScene.gobboRapeIntro();
      }
   }
}

