package classes.scenes.areas.forest
{
   import classes.Appearance;
   import classes.CoC;
   import classes.Player;
   import classes.StatusEffects;
   import classes._FlagDict.FlagDict_Impl_;
   import classes.internals.MonsterAI;
   import classes.internals.Utils;
   import classes.internals.WeightedChoice;
   import classes.items.ConsumableLib;
   import classes.scenes.combat.CombatRange;
   import classes.scenes.monsters.Goblin;
   import flash.Boot;
   import haxe.IMap;
   
   public class TamanisDaughters extends Goblin
   {
      
      public function TamanisDaughters()
      {
         if(Boot.skip_constructor)
         {
            return;
         }
         super(true);
         set_a("一群");
         set_short("Tamani\'s daughters");
         imageName = "tamanisdaughters";
         set_long("一大群地精女孩聚集在你周围，把你团团围住。大多数人的皮肤都有不同深浅的绿色，不过也有少数人的皮肤呈现淡黄色或浅蓝色。她们几乎衣不蔽体，尽可能多地暴露自己的肉体，以激发潜在配偶的性欲。她们的发型和她们的衣服、肤色一样多种多样，她们似乎唯一的共同点就是可爱的脸蛋和丰满的身材。看起来她们想从你这里得到些什么。");
         set_race("Goblins");
         set_plural(true);
         pronoun1 = "她们";
         pronoun2 = "她们";
         pronoun3 = "她们的";
         createVagina(false,4,0);
         createStatusEffect(StatusEffects.BonusVCapacity,40,0,0,0);
         createBreastRow(Appearance.breastCupInverse("D"));
         ass.analLooseness = 1;
         ass.analWetness = 0;
         createStatusEffect(StatusEffects.BonusACapacity,25,0,0,0);
         set_tallness(40);
         hips.rating = 7;
         butt.rating = 7;
         skin.tone = "greenish gray";
         hair.color = "pink";
         hair.length = 16;
         initStrTouSpeInte(55,30,45,50);
         initLibSensCor(70,70,50);
         set_weaponName("fists");
         set_weaponVerb("tiny punches");
         set_armorName("leather straps");
         bonusHP = 50 + int(FlagDict_Impl_.arrayReadInt(get_flags(),1204) / 2) * 15;
         if(bonusHP > 3350)
         {
            bonusHP = 3350;
         }
         set_lust(30);
         lustVuln = 0.65;
         temperment = 2;
         level = 8 + Math.floor(FlagDict_Impl_.arrayReadInt(get_flags(),1204) / 20);
         if(level > 30)
         {
            level = 30;
         }
         set_gems(Utils.rand(15) + 5);
         set_drop(new WeightedChoice().add(get_consumables().GOB_ALE,5).addMany(1,get_consumables().L_DRAFT,get_consumables().PINKDYE,get_consumables().BLUEDYE,get_consumables().ORANGDY,get_consumables().PURPDYE));
         checkMonster();
      }
      
      override public function won(param1:Boolean, param2:Boolean = false) : void
      {
         if(param2)
         {
            outputText("[pg]你的敌人们看起来明显很恶心，他们离开了，并告诉你，[say: 别他妈这么恶心了……]");
            get_game().combat.cleanupAfterCombat();
         }
         else
         {
            get_game().forest.tamaniScene.tamaniDaughtersScene.loseToDaughters();
         }
      }
      
      public function tamaniShowsUp() : void
      {
         if(TamanisDaughtersScene.tamaniPresent)
         {
            if(Utils.rand(4) == 0)
            {
               goblinDrugAttack();
            }
         }
         else if(Utils.rand(6) == 0)
         {
            TamanisDaughtersScene.tamaniPresent = true;
            outputText("一个尖锐却熟悉的声音大喊道：[say: <b>原来你们这些小婊砸跑到这里来了——等等。你们是想抢塔玛尼的男人吗！？</b>][pg]");
            outputText("你可以看到塔玛尼在地精群的后方徘徊，明显在训斥她的女儿们。一方面听起来她可能会帮你，但了解地精的你清楚，她很可能会忘记愤怒，帮她们一起制服你，以获取更多的精液……[pg]");
            set_str(get_str() + 5);
            set_tou(get_tou() + 5);
            set_HP(get_HP() + 10);
            set_lust(get_lust() - 20);
            set_long(get_long() + " <b>塔玛尼潜伏在人群的后方，她的曲线比她的子嗣更加丰满，正带着混合着好笑和烦躁的表情注视着。她用手梳理了一下粉黑相间的头发，等待着介入的机会……</b>");
         }
      }
      
      override public function performCombatAction() : void
      {
         midRoundMadness();
         tamaniShowsUp();
         createStatusEffect(StatusEffects.Attacks,int(FlagDict_Impl_.arrayReadInt(get_flags(),1204) / 20),0,0,0);
         if(statusEffectv1(StatusEffects.Attacks) > 20)
         {
            addStatusValue(StatusEffects.Attacks,1,-(statusEffectv1(StatusEffects.Attacks) - 20));
         }
         var _loc1_:MonsterAI = new MonsterAI().add(eAttack);
         _loc1_.add(goblinTeaseAttack,1,true,0,FATIGUE_NONE,CombatRange.Tease);
         _loc1_.add(goblinDrugAttack,1,true,0,FATIGUE_NONE,CombatRange.Ranged);
         _loc1_.exec();
      }
      
      public function midRoundMadness() : void
      {
         var _loc1_:Number = Utils.rand(4);
         if(_loc1_ == 0)
         {
            outputText("一只纤细的手伸进你的[armor]里，轻轻捏了捏你的");
            if(get_player().balls > 0)
            {
               if(Utils.rand(2) == 0)
               {
                  outputText(get_player().multiCockDescriptLight());
               }
               else
               {
                  outputText(get_player().ballsDescriptLight());
               }
            }
            else
            {
               outputText(get_player().multiCockDescriptLight());
            }
            outputText("。你扭身躲开，但呼吸却变得有些沉重。");
         }
         else if(_loc1_ == 1)
         {
            outputText("一个女孩抱住你的[legs]，开始充满爱意地抚摸你的身体，开心地哼着歌。你迅速把她甩开，但这种关注让你脸红得更厉害了。");
         }
         else if(_loc1_ == 2)
         {
            outputText("你的一个女儿跳到你的背上，将她那坚硬、穿了环的乳头压在你的脖子上。她在你耳边低语：[say: 爸爸，捏我的乳头！][pg]");
            outputText("你伸手向后把她甩开，但她那变态的挑逗还是让你感到有些燥热。");
         }
         else
         {
            outputText("一个女儿躺在你面前，当场开始自慰。你根本无法不低头看她，也无法不听到她愉悦的呻吟。你退后一步试图避开这个干扰，但这绝对让你的[armor]里感到有些不适。");
         }
         var _loc2_:int = int(1 + get_player().lib / 15 + Utils.rand(get_player().cor / 30));
         get_player().takeLustDamage(_loc2_,true);
         outputText("[pg]");
      }
      
      override public function defeated(param1:Boolean) : void
      {
         get_game().forest.tamaniScene.tamaniDaughtersScene.combatWinAgainstDaughters();
      }
   }
}

