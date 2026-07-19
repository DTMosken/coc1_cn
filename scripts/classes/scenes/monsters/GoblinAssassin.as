package classes.scenes.monsters
{
   import classes.Appearance;
   import classes.CoC;
   import classes.Creature;
   import classes.Monster;
   import classes.PerkLib;
   import classes.Player;
   import classes.StatusEffects;
   import classes.internals.MonsterAI;
   import classes.internals.Utils;
   import classes.internals.WeightedChoice;
   import classes.items.ConsumableLib;
   import classes.items.Shield;
   import classes.scenes.combat.AvoidDamageParameters;
   import classes.scenes.combat.CombatRange;
   import flash.Boot;
   
   public class GoblinAssassin extends Monster
   {
      
      public function GoblinAssassin(param1:Boolean = false)
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
         set_short("goblin assassin");
         imageName = "goblinassassin";
         set_long("她的外貌和普通地精差不多，曲线丰满，淡绿色皮肤，可能比一般的地精稍高一点。她那波浪般狂野的头发是深蓝色的，遮住了打着耳洞的耳朵，刚好及肩。她柔软的曲线被她的穿着衬托得淋漓尽致：一条挂满各种针的腰带绑在她丰满的胸前，一双渔网袜一直穿到她粗壮的大腿上。她在原地蹦跳着，准备躲避你可能使出的任何招数，但你的目光似乎总是不由自主地游移到她赤裸的肉缝和摇晃的屁股上。尽管她显然精通战斗，但她终究是个地精——一根硬挺的鸡巴能解决很多问题。");
         set_race("Goblin");
         createVagina(false,4,1);
         createStatusEffect(StatusEffects.BonusVCapacity,90,0,0,0);
         createBreastRow(Appearance.breastCupInverse("E"));
         ass.analLooseness = 2;
         ass.analWetness = 0;
         createStatusEffect(StatusEffects.BonusACapacity,50,0,0,0);
         set_tallness(35 + Utils.rand(4));
         hips.rating = 8;
         butt.rating = 8;
         skin.tone = "dark green";
         hair.color = "blue";
         hair.length = 7;
         initStrTouSpeInte(45,55,110,95);
         initLibSensCor(65,35,60);
         set_weaponName("needles");
         set_weaponVerb("stabbing needles");
         set_armorName("leather straps");
         bonusHP = 70;
         set_lust(50);
         temperment = 2;
         level = 10;
         set_gems(Utils.rand(50) + 25);
         createPerk(PerkLib.Evade,0,0,0,0);
         additionalXP = 150;
         set_drop(new WeightedChoice().add(get_consumables().GOB_ALE,5).addMany(1,get_consumables().L_DRAFT,get_consumables().PINKDYE,get_consumables().BLUEDYE,get_consumables().ORANGDY,get_consumables().PURPDYE));
         checkMonster();
      }
      
      override public function won(param1:Boolean, param2:Boolean = false) : void
      {
         if(get_player().get_gender() == 0)
         {
            outputText("你倒在地精面前，伤得太重无法再战。她低吼一声，踢了你的头一脚，让你眼冒金星。随着视线模糊，你听到她嘟囔着：[say:真他妈的废物，连个鸡巴或小穴都不长。]");
            get_game().combat.cleanupAfterCombat();
         }
         else
         {
            get_game().goblinAssassinScene.gobboAssassinBeatYaUp();
         }
      }
      
      override public function performCombatAction() : void
      {
         var _loc1_:MonsterAI = new MonsterAI();
         _loc1_.add(eAttack,1,true,0,FATIGUE_NONE,CombatRange.Ranged);
         _loc1_.add(goblinDrugAttack,1,true,10,FATIGUE_PHYSICAL,CombatRange.Ranged);
         _loc1_.add(lustNeedle,1,true,5,FATIGUE_PHYSICAL,CombatRange.Ranged);
         _loc1_.add(dualShot,1,true,10,FATIGUE_PHYSICAL,CombatRange.Ranged);
         _loc1_.add(goblinExplosion,1,true,10,FATIGUE_PHYSICAL,CombatRange.Ranged);
         _loc1_.exec();
      }
      
      public function lustNeedle() : void
      {
         var _loc1_:int = 0;
         outputText("刺客脚步轻快，瞬间消失不见，她的动作太快，你根本看不清。你深吸了一口气，感觉到她丰满的大腿夹住了你的头，她湿润的小穴一览无余，你闻到了她的气味。");
         if(Boolean(combatAvoidDamage(new AvoidDamageParameters(true,false,false,null,null,null,null,null)).attackFailed))
         {
            outputText("\n但你早有准备，屏住呼吸，一把抓住地精的腰。你不受她攻势的影响，趁机向后退去，让地精失去平衡，只在你身上留下淡淡的淫水味。");
            _loc1_ = Utils.rand(get_player().lib / 10) + 4;
         }
         else
         {
            outputText("\n你太分心了，根本没注意到脖子后面被扎了一针。等她翻身回到原位时，你已经感觉到注射器里的东西开始起作用了。");
            _loc1_ = Utils.rand(get_player().lib / 4) + 20;
         }
         get_player().takeLustDamage(_loc1_,true);
      }
      
      public function goblinExplosion() : void
      {
         outputText("刺客毫不犹豫地从缠在胸前的腰带上抽出一根细针，在地上划了一下，针尖立刻燃起火焰。她旋转着向前，将针朝你掷来，针随后爆裂开来，向你喷洒出热浪。");
         outputText("\n你挡住了爆炸，但地精已经点燃了第二根针并扔到了你身后，爆炸的冲击力将你的身体向前推去。");
         get_game().combat.monsterDamageType = "Fire";
         var _loc1_:int = 25 + Utils.rand(75);
         get_player().takeDamage(_loc1_,true);
      }
      
      public function goblinDrugAttack() : void
      {
         var _loc1_:Number = Utils.rand(5);
         var _loc2_:String = "";
         if(_loc1_ == 0)
         {
            _loc2_ = "red";
         }
         if(_loc1_ == 1)
         {
            _loc2_ = "green";
         }
         if(_loc1_ == 2)
         {
            _loc2_ = "blue";
         }
         if(_loc1_ == 3)
         {
            _loc2_ = "white";
         }
         if(_loc1_ == 4)
         {
            _loc2_ = "black";
         }
         if(_loc2_ == "blue")
         {
            outputText(get_capitalA() + Utils.cnName(get_short()) + "掏出一个蓝色的药剂瓶，拔开瓶塞，迅速将里面的液体一饮而尽。");
            if(HPRatio() < 1)
            {
               outputText("看起来她恢复了一些伤势！\n");
               addHP(maxHP() / 4);
            }
            else
            {
               outputText("似乎没有任何效果。\n");
            }
         }
         else
         {
            outputText(get_capitalA() + Utils.cnName(get_short()) + "拔开一个装满" + Utils.cnName(_loc2_) + "液体的玻璃瓶的软木塞，挥动手臂，向你泼出一波液体。");
            if(get_player().hasPerk(PerkLib.Evade) && Utils.rand(10) <= 3 || Utils.rand(100) < get_player().get_spe() / 5)
            {
               outputText("\n你险险地避开了喷涌而出的炼金液体！\n");
               return;
            }
            if(get_player().get_shield() == get_game().shields.DRGNSHL && Utils.rand(2) == 0)
            {
               outputText("\n液体击中了你的护盾，被无害地吸收了。\n");
               return;
            }
            if(_loc2_ == "red")
            {
               outputText("\n红色的液体击中了你，瞬间渗入你的皮肤，消失不见。你的皮肤泛红，感觉浑身发热。哦，不……\n");
               if(!get_player().hasStatusEffect(StatusEffects.TemporaryHeat))
               {
                  get_player().createStatusEffect(StatusEffects.TemporaryHeat,0,1,0,0);
               }
            }
            if(_loc2_ == "green")
            {
               outputText("\n绿色的液体溅了你一身，让你感觉黏糊糊的，恶心极了。你立刻感到一阵恶心——你中毒了！\n");
               if(!get_player().hasStatusEffect(StatusEffects.Poison))
               {
                  get_player().createStatusEffect(StatusEffects.Poison,0,1,0,0);
               }
            }
            if(_loc2_ == "white")
            {
               outputText("\n你试图躲避，但它在你周围的地上溅满了非常粘稠的白色液体，让你很难跑动。你现在很难逃脱了！\n");
               if(!get_player().hasStatusEffect(StatusEffects.NoFlee))
               {
                  get_player().createStatusEffect(StatusEffects.NoFlee,0,0,0,0);
               }
            }
            if(_loc2_ == "black")
            {
               outputText("\n黑色的液体溅了你一身，几乎瞬间就渗入了你的皮肤。这让你感到疲倦和昏昏欲睡。\n");
               get_player().changeFatigue(10 + Utils.rand(25));
            }
         }
      }
      
      public function dualShot() : void
      {
         var _loc1_:int = 0;
         outputText("刺客将一个注射器扔在地上，注射器碎裂开来，散发出的烟雾让你分心了片刻，她趁机滑到你身下。她手腕一抖，两根针便出现在手中，不过你已经察觉到了她的动作。");
         if(Boolean(combatAvoidDamage(new AvoidDamageParameters(true,false,false,null,null,null,null,null)).attackFailed))
         {
            outputText("\n你向后跳去，刚好躲开她迅速向上的刺击，她还试图舔舐你刚才裆部所在的位置。意识到自己的处境后，她迅速从地上爬起，面对着你，比之前更加坚定。");
         }
         else
         {
            outputText("\n还没等你做出任何反应，她就抬起头，飞快地舔了一下你的裆部，让你发出一声轻哼，这也给了她足够的时间刺向你的膝弯。就在你拔出两根针扔回地上时，她已经滚到了一边。针里似乎没有什么东西，但疼痛足以让你踉跄。");
            _loc1_ = get_player().reduceDamage(get_str() + get_weaponAttack() + 40,this);
            get_player().takeDamage(_loc1_,true);
         }
      }
      
      override public function defeated(param1:Boolean) : void
      {
         get_game().goblinAssassinScene.gobboAssassinRapeIntro();
      }
   }
}

