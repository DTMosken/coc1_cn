package classes.scenes.dungeons.deepCave
{
   import classes.Appearance;
   import classes.CoC;
   import classes.Monster;
   import classes.PerkLib;
   import classes.Player;
   import classes.ReactionContext;
   import classes.StatusEffects;
   import classes._FlagDict.FlagDict_Impl_;
   import classes.globalFlags.KFLAGS;
   import classes.internals.MonsterAI;
   import classes.internals.Utils;
   import classes.internals.WeightedChoice;
   import classes.items.ConsumableLib;
   import classes.scenes.combat.CombatRange;
   import flash.Boot;
   import haxe.IMap;
   
   public class Vala extends Monster
   {
      
      public function Vala()
      {
         if(Boot.skip_constructor)
         {
            return;
         }
         super();
         set_a("");
         set_short("Vala");
         imageName = "vala";
         set_long("虽然这个妖精女孩瘦得像根竹竿，但她的乳房却大得不成比例。在正常人类身上，它们至少有DD罩杯，但以她的身高和体型来看，它们几乎和她的头一样大。它们随着她缓慢、不均匀的呼吸而晃动，每一次心跳都有微小的乳汁从她的乳头溢出。她似乎执意要和你交配，并且不接受拒绝。");
         set_race("Faerie");
         createVagina(false,3,4);
         createStatusEffect(StatusEffects.BonusVCapacity,25,0,0,0);
         createBreastRow(Appearance.breastCupInverse("E"));
         ass.analLooseness = 4;
         ass.analWetness = 0;
         createStatusEffect(StatusEffects.BonusACapacity,10,0,0,0);
         set_tallness(48);
         hips.rating = 10;
         butt.rating = 8;
         skin.tone = "fair";
         hair.color = "purple";
         hair.length = 22;
         initStrTouSpeInte(40,50,50,60);
         initLibSensCor(55,35,50);
         set_weaponName("fists");
         set_weaponVerb("caresses");
         set_armorName("skin");
         lustVuln = 0.5;
         if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,126) > 0)
         {
            lustVuln += 0.25;
         }
         if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,126) > 2)
         {
            lustVuln += 0.5;
         }
         set_lust(Math.min(80,30 + FlagDict_Impl_.arrayReadInt(KFLAGS.flags,126) * 10));
         bonusHP = 350;
         temperment = 2;
         level = 11;
         set_gems(1);
         additionalXP = 50;
         if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,126) > 0)
         {
            XP = 5;
         }
         if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,126) > 2)
         {
            XP = 1;
         }
         createPerk(PerkLib.Evade,0,0,0,0);
         if(FlagDict_Impl_.arrayReadInt(get_flags(),126) == 0)
         {
            set_drop(new WeightedChoice(get_consumables().NUMBROX));
         }
         else
         {
            set_drop(NO_DROP);
         }
         wings.type = 15;
         checkMonster();
      }
      
      override public function won(param1:Boolean, param2:Boolean = false) : void
      {
         if(param2)
         {
            outputText("[pg]你的敌人似乎并没有被吓退...");
            doNext(get_game().combat.endLustLoss);
         }
         else
         {
            get_game().dungeons.deepcave.loseToVala();
         }
      }
      
      public function valaSpecial2() : void
      {
         outputText("瓦拉脸上带着狂喜的神情，仰起头，双手挤压着她柔软的胸部，从她那硕大的乳房中喷射出大股浓稠的妖精乳汁！你试图躲闪，但她喷得太多了，根本不可能全部躲开，没过多久，你身上就沾满了一层厚厚的瓦拉的乳汁。");
         outputText("她松开乳房，为了让你看个够而前后摇晃着它们，并拍打着翅膀，向你吹出闪亮的、像亮片一样的粉末。它们粘在你皮肤上的乳汁上，让你浑身涂满了乳汁和妖精粉尘。");
         outputText("\n瓦拉说，[say: 现在你可以像瓦拉一样性感了！]\n");
         if(hasStatusEffect(StatusEffects.Milk))
         {
            addStatusValue(StatusEffects.Milk,1,5);
            outputText("你的[skindesc]传来一阵愉悦的刺痛感，让你感到性感又暴露。哦，不！似乎每一层乳汁和闪粉都比上一层更强效！");
         }
         else
         {
            createStatusEffect(StatusEffects.Milk,5,0,0,0);
            outputText("你不确定是她的乳汁、粉尘里有什么东西，还是仅仅看着她为你喷乳和摇晃身体，但这确实让你兴奋起来了。");
         }
         get_player().takeLustDamage(statusEffectv1(StatusEffects.Milk) + get_player().lib / 20,true);
      }
      
      public function valaSpecial1() : void
      {
         outputText("瓦拉轻抚着自己的一处伤口，神魂颠倒。她难道真的在从伤口中获得快感吗？妈的，她真是个变态！瓦拉舔去手指上的鲜血，眨了眨眼，从嘴里吹出一股粉色的雾气。");
         if(HPRatio() > 0.7)
         {
            outputText("散发着甜味的云雾迅速弥漫了整个房间，但雾气量还算少，你并没有吸入太多。不过，它确实让你的脉搏以一种极其愉悦的方式加快了……");
            get_player().takeLustDamage(5 + get_player().lib / 20,true);
         }
         else if(HPRatio() > 0.4)
         {
            outputText("玫瑰色的蒸汽在房间里蔓延，迫使你要么吸入它，要么因缺氧而昏厥。它的气味很甜，让你的头脑中充满了肉欲的幻想，胯下也因欲望而刺痛。意识到自己被下药了，你惊慌失措地喘着粗气，但这只会将更多迅速消散的云雾吸入肺中，进一步点燃你的情欲。");
            get_player().takeLustDamage(10 + get_player().lib / 20,true);
         }
         else
         {
            outputText("浓稠的粉色云雾从她口中喷涌而出，让整个房间弥漫着泡泡糖般的甜腻气息。哪怕只是最浅、最试探性的一口呼吸，也让你的心脏狂跳，胯下因兴奋而悸动。你又猛吸了一口气，身体前后摇晃，已经处于向这只妖精屈服的边缘。");
            get_player().takeLustDamage(30 + get_player().lib / 10,true);
         }
      }
      
      public function valaMasturbate() : void
      {
         outputText("这只被洗脑的妖精张开她雪白的大腿，将一根手指探入双腿间闪闪发光的缝隙中，进进出出，只在绕着阴蒂打圈时才停顿一下。她明目张胆地自慰着，上演了一场精彩的表演。瓦拉又将两根手指滑入体内，用力地抠挖着自己，淫荡地呻吟喘息着。然后她抽出手指，问道，[say: 你喜欢吗？你现在要操瓦拉了吗？]");
         get_player().takeLustDamage(4 + get_player().cor / 10,true);
      }
      
      public function valaCombatDialogue() : void
      {
         if(!hasStatusEffect(StatusEffects.Vala))
         {
            outputText("[say: 荡妇需要服侍主人们！] 妖精高高飞起，哀嚎着。[say: 如果他们不高兴，母狗就吃不到精液了！]");
            createStatusEffect(StatusEffects.Vala,0,0,0,0);
         }
         else
         {
            addStatusValue(StatusEffects.Vala,1,1);
            if(statusEffectv1(StatusEffects.Vala) == 1)
            {
               outputText("[say: 如果你不操母狗，那你肯定不是主人，] 她恍然大悟，战斗让她那被欲望麻痹的大脑恢复了活力。[say: 你也要成为主人们的宠物！]");
            }
            else if(statusEffectv1(StatusEffects.Vala) == 2)
            {
               outputText("[say: 如果主人们喜欢你，也许他们会让母狗把你留给自己！你不喜欢那样吗？]");
            }
            else if(statusEffectv1(StatusEffects.Vala) == 3)
            {
               outputText("[say: 我们服从主人们。他们喂养母狗，直到她长得足够大，可以取悦他们。主人们非常爱他们的宠物，你会看到的。]");
            }
            else if(statusEffectv1(StatusEffects.Vala) == 4)
            {
               outputText("[say: 思考太难了。做一个玩具荡妇要容易得多。你不喜欢做玩具吗？把所有那些讨厌的记忆都从你脑子里操出去。]");
            }
            else if(statusEffectv1(StatusEffects.Vala) == 5)
            {
               outputText("[say: 母狗生下了许多主人们的孩子。她会教你如何取悦主人们。也许你能为我们生下更多的主人来操？]");
            }
            else
            {
               outputText("[say: 母狗喜欢她的孩子们像他们的父亲一样使用她。荡妇属于他们。荡妇爱他们。你也会爱他们的！]");
            }
         }
      }
      
      override public function react(param1:ReactionContext) : Boolean
      {
         if(param1.index == 10)
         {
            if(Utils.randomChance(70) && !hasStatusEffect(StatusEffects.Stunned))
            {
               outputText("瓦拉拍打着翅膀，扭动着身体。在突如其来的阵风和她位置的变移共同作用下，箭矢射偏了。[pg-]");
               return false;
            }
         }
         return true;
      }
      
      override public function performCombatAction() : void
      {
         valaCombatDialogue();
         outputText("[pg]");
         var _loc1_:MonsterAI = new MonsterAI();
         _loc1_.add(valaSpecial1,25,HPRatio() < 0.85,0,FATIGUE_NONE,CombatRange.Self);
         _loc1_.add(valaSpecial2,20,true,10,FATIGUE_NONE,CombatRange.Ranged);
         _loc1_.add(valaMasturbate,55,true,10,FATIGUE_NONE,CombatRange.Self);
         _loc1_.exec();
      }
      
      override public function defeated(param1:Boolean) : void
      {
         get_game().dungeons.deepcave.fightValaVictory();
      }
   }
}

