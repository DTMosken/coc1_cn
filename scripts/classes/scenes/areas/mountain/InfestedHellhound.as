package classes.scenes.areas.mountain
{
   import classes.CoC;
   import classes.CoC_Settings;
   import classes.DynStat;
   import classes.Player;
   import classes.StatusEffects;
   import classes.internals.MonsterAI;
   import classes.internals.Utils;
   import classes.internals.WeightedChoice;
   import classes.items.ConsumableLib;
   import classes.scenes.combat.CombatRange;
   import coc.view.CoCButton;
   import flash.Boot;
   
   public class InfestedHellhound extends HellHound
   {
      
      public function InfestedHellhound()
      {
         if(Boot.skip_constructor)
         {
            return;
         }
         super(true);
         set_a("");
         set_short("infested hellhound");
         imageName = "infestedhellhound";
         set_long("它看起来像一只巨大的四足恶魔，两颗脑袋并排长着。它的眼睛和嘴里充满了火焰，每只爪子上都覆盖着巨大而令人生畏的利爪。一层厚厚的黑色皮毛像盔甲一样覆盖着它的全身。当地狱犬绕着你转圈时，两颗脑袋都饥渴地盯着你。一对黑色的、略微尖锐的阴茎暴露在外，滴落着精液和蠕虫。你有一种感觉，和这只野兽讲道理是不可能的。");
         set_race("Hellhound");
         createCock(9,2);
         createCock(9,2);
         balls = 2;
         ballSize = 5;
         cumMultiplier = 8;
         createBreastRow();
         createBreastRow();
         createBreastRow();
         ass.analLooseness = 2;
         ass.analWetness = 1;
         set_tallness(47);
         hips.rating = 4;
         butt.rating = 5;
         skin.tone = "black";
         skin.setType(1);
         hair.color = "red";
         hair.length = 3;
         initStrTouSpeInte(65,60,50,1);
         initLibSensCor(95,20,100);
         set_weaponName("claws");
         set_weaponVerb("claw");
         set_weaponAttack(5);
         set_armorName("thick fur");
         set_lust(50);
         lustVuln = 0.87;
         temperment = 3;
         level = 5;
         set_gems(10 + Utils.rand(10));
         set_drop(new WeightedChoice().add(get_consumables().CANINEP,6).add(get_consumables().WOLF_PP,1).addMany(2,get_consumables().BULBYPP,get_consumables().KNOTTYP,get_consumables().BLACKPP,get_consumables().DBLPEPP,get_consumables().LARGEPP));
         tail.type = 2;
         checkMonster();
      }
      
      override public function won(param1:Boolean, param2:Boolean = false) : void
      {
         if(param2)
         {
            outputText("[pg]被寄生的地狱犬的两颗脑袋都开心地咧着嘴，向你逼近……");
            doNext(get_game().mountain.infestedHellhoundScene.infestedHellhoundLossRape);
         }
         else if(param1)
         {
            get_game().mountain.infestedHellhoundScene.infestedHellhoundLossRape();
         }
         else
         {
            get_game().mountain.infestedHellhoundScene.infestedHellhoundLossRape();
         }
      }
      
      override public function performCombatAction() : void
      {
         var _loc1_:MonsterAI = new MonsterAI();
         _loc1_.add(eAttack,1,true,0,FATIGUE_NONE,CombatRange.Melee);
         _loc1_.add(hellhoundFire,1,true,15,FATIGUE_MAGICAL);
         _loc1_.add(hellhoundScent,1,true,10,FATIGUE_NONE,CombatRange.Self);
         _loc1_.add(hellHoundWormCannon,1,true,10,FATIGUE_PHYSICAL,CombatRange.Ranged);
         _loc1_.exec();
      }
      
      override public function outputDefaultTeaseReaction(param1:Number) : void
      {
         if(param1 == 0)
         {
            outputText("\n" + get_capitalA() + Utils.cnName(get_short()) + "似乎无动于衷。");
         }
         else if(param1 < 4)
         {
            outputText("\n" + get_capitalA() + Utils.cnName(get_short()) + "看起来对" + pronoun1 + "看到的东西很感兴趣。");
         }
         else if(param1 < 10)
         {
            outputText("\n" + get_capitalA() + Utils.cnName(get_short()) + "显然很享受这场表演。");
         }
         else if(param1 < 20)
         {
            outputText("\n" + get_capitalA() + Utils.cnName(get_short()) + "带着情欲轻声低吼，" + pronoun3 + "眼中充满了渴望。");
         }
         else
         {
            outputText("\n" + get_capitalA() + Utils.cnName(get_short()) + "满怀期待地舔了舔" + pronoun3 + "嘴唇，" + pronoun3 + "两根阴茎从包皮里高高翘起。");
         }
      }
      
      public function hellHoundWormCannon() : void
      {
         var _loc1_:* = null as CoC;
         var _loc2_:* = null as Array;
         outputText("那怪物用后腿站立起来。它猛地向前扑去，粗壮的肉棒抽搐着膨胀，向你喷射出一股充满蠕虫的犬类精液。");
         outputText("\n");
         if(Utils.rand(2) == 0)
         {
            _loc1_ = get_game();
            _loc2_ = [DynStat.Lust(5 + get_player().lib / 20)];
            if(int(_loc2_.length) == 0)
            {
               _loc1_.player.dynStats();
            }
            else if(int(_loc2_.length) == 1)
            {
               _loc1_.player.dynStats(_loc2_[0]);
            }
            else if(int(_loc2_.length) == 2)
            {
               _loc1_.player.dynStats(_loc2_[0],_loc2_[1]);
            }
            else if(int(_loc2_.length) == 3)
            {
               _loc1_.player.dynStats(_loc2_[0],_loc2_[1],_loc2_[2]);
            }
            else if(int(_loc2_.length) == 4)
            {
               _loc1_.player.dynStats(_loc2_[0],_loc2_[1],_loc2_[2],_loc2_[3]);
            }
            else if(int(_loc2_.length) == 5)
            {
               _loc1_.player.dynStats(_loc2_[0],_loc2_[1],_loc2_[2],_loc2_[3],_loc2_[4]);
            }
            else if(int(_loc2_.length) == 6)
            {
               _loc1_.player.dynStats(_loc2_[0],_loc2_[1],_loc2_[2],_loc2_[3],_loc2_[4],_loc2_[5]);
            }
            else if(int(_loc2_.length) == 7)
            {
               _loc1_.player.dynStats(_loc2_[0],_loc2_[1],_loc2_[2],_loc2_[3],_loc2_[4],_loc2_[5],_loc2_[6]);
            }
            else if(int(_loc2_.length) == 8)
            {
               _loc1_.player.dynStats(_loc2_[0],_loc2_[1],_loc2_[2],_loc2_[3],_loc2_[4],_loc2_[5],_loc2_[6],_loc2_[7]);
            }
            else if(int(_loc2_.length) == 9)
            {
               _loc1_.player.dynStats(_loc2_[0],_loc2_[1],_loc2_[2],_loc2_[3],_loc2_[4],_loc2_[5],_loc2_[6],_loc2_[7],_loc2_[8]);
            }
            else if(int(_loc2_.length) == 10)
            {
               _loc1_.player.dynStats(_loc2_[0],_loc2_[1],_loc2_[2],_loc2_[3],_loc2_[4],_loc2_[5],_loc2_[6],_loc2_[7],_loc2_[8],_loc2_[9]);
            }
            else if(int(_loc2_.length) == 11)
            {
               _loc1_.player.dynStats(_loc2_[0],_loc2_[1],_loc2_[2],_loc2_[3],_loc2_[4],_loc2_[5],_loc2_[6],_loc2_[7],_loc2_[8],_loc2_[9],_loc2_[10]);
            }
            else if(int(_loc2_.length) == 12)
            {
               _loc1_.player.dynStats(_loc2_[0],_loc2_[1],_loc2_[2],_loc2_[3],_loc2_[4],_loc2_[5],_loc2_[6],_loc2_[7],_loc2_[8],_loc2_[9],_loc2_[10],_loc2_[11]);
            }
            else if(int(_loc2_.length) == 13)
            {
               _loc1_.player.dynStats(_loc2_[0],_loc2_[1],_loc2_[2],_loc2_[3],_loc2_[4],_loc2_[5],_loc2_[6],_loc2_[7],_loc2_[8],_loc2_[9],_loc2_[10],_loc2_[11],_loc2_[12]);
            }
            else if(int(_loc2_.length) == 14)
            {
               _loc1_.player.dynStats(_loc2_[0],_loc2_[1],_loc2_[2],_loc2_[3],_loc2_[4],_loc2_[5],_loc2_[6],_loc2_[7],_loc2_[8],_loc2_[9],_loc2_[10],_loc2_[11],_loc2_[12],_loc2_[13]);
            }
            else if(int(_loc2_.length) == 15)
            {
               _loc1_.player.dynStats(_loc2_[0],_loc2_[1],_loc2_[2],_loc2_[3],_loc2_[4],_loc2_[5],_loc2_[6],_loc2_[7],_loc2_[8],_loc2_[9],_loc2_[10],_loc2_[11],_loc2_[12],_loc2_[13],_loc2_[14]);
            }
            else if(int(_loc2_.length) == 16)
            {
               _loc1_.player.dynStats(_loc2_[0],_loc2_[1],_loc2_[2],_loc2_[3],_loc2_[4],_loc2_[5],_loc2_[6],_loc2_[7],_loc2_[8],_loc2_[9],_loc2_[10],_loc2_[11],_loc2_[12],_loc2_[13],_loc2_[14],_loc2_[15]);
            }
            else if(int(_loc2_.length) == 17)
            {
               _loc1_.player.dynStats(_loc2_[0],_loc2_[1],_loc2_[2],_loc2_[3],_loc2_[4],_loc2_[5],_loc2_[6],_loc2_[7],_loc2_[8],_loc2_[9],_loc2_[10],_loc2_[11],_loc2_[12],_loc2_[13],_loc2_[14],_loc2_[15],_loc2_[16]);
            }
            else if(int(_loc2_.length) == 18)
            {
               _loc1_.player.dynStats(_loc2_[0],_loc2_[1],_loc2_[2],_loc2_[3],_loc2_[4],_loc2_[5],_loc2_[6],_loc2_[7],_loc2_[8],_loc2_[9],_loc2_[10],_loc2_[11],_loc2_[12],_loc2_[13],_loc2_[14],_loc2_[15],_loc2_[16],_loc2_[17]);
            }
            else if(int(_loc2_.length) == 19)
            {
               _loc1_.player.dynStats(_loc2_[0],_loc2_[1],_loc2_[2],_loc2_[3],_loc2_[4],_loc2_[5],_loc2_[6],_loc2_[7],_loc2_[8],_loc2_[9],_loc2_[10],_loc2_[11],_loc2_[12],_loc2_[13],_loc2_[14],_loc2_[15],_loc2_[16],_loc2_[17],_loc2_[18]);
            }
            else
            {
               if(int(_loc2_.length) != 20)
               {
                  throw "Too many rest arguments";
               }
               _loc1_.player.dynStats(_loc2_[0],_loc2_[1],_loc2_[2],_loc2_[3],_loc2_[4],_loc2_[5],_loc2_[6],_loc2_[7],_loc2_[8],_loc2_[9],_loc2_[10],_loc2_[11],_loc2_[12],_loc2_[13],_loc2_[14],_loc2_[15],_loc2_[16],_loc2_[17],_loc2_[18],_loc2_[19]);
            }
            outputText("你被这突如其来的性展示弄得措手不及，没能躲开，满是蠕虫的精液溅了你一身，从胸口一直流到下面。");
            if(get_player().hasStatusEffect(StatusEffects.Infested) && get_player().totalCocks() > 0)
            {
               outputText("你体内的蠕虫开始移动和蠕动。几只浸透精液的寄生虫从你颤抖的" + get_player().multiCockDescriptLight() + "中爬出来，似乎试图迎接新来的同伴。你拼命想把它们刷掉，但胯部的快感太强烈了，你无法抗拒，你发现自己停下了手，任由每一只新来的蠕虫钻进你的[cocks]里。");
               if(get_player().balls > 0)
               {
                  outputText("你的[balls]变得更重了，因为蠕虫在它们的新家安顿下来，让你兴奋得无以复加。");
               }
               else
               {
                  outputText("你能感觉到它们在你体内变移，适应它们的新家，让你兴奋得无以复加。");
               }
               get_player().takeLustDamage(10,true);
            }
            else if(get_player().totalCocks() > 0)
            {
               outputText("蠕虫在你身上扭动和蠕动，向你的腹股沟爬去。这感觉很痒，但你在它们钻进你体内之前把它们刷掉了。被变成一个喷射蠕虫的精液喷泉的想法很可怕，但这让你勃起了。");
               get_player().takeLustDamage(5 + Math.round(get_player().cor / 20),true);
            }
            else if(get_player().hasVagina())
            {
               outputText("值得庆幸的是，这些蠕虫似乎不想和你扯上任何关系，迅速掉到了地上。");
            }
         }
         else
         {
            outputText("你侧身躲过了那股充满蠕虫的液体，让它溅在你身后的岩石上。");
            if(get_player().hasStatusEffect(StatusEffects.Infested) && get_player().hasCock())
            {
               if(get_player().hasCock())
               {
                  outputText("尽管躲过了那股受感染的精液，你自己的充满蠕虫的");
                  if(get_player().balls > 0)
                  {
                     outputText(get_player().ballsDescriptLight());
                  }
                  else
                  {
                     outputText(get_player().multiCockDescriptLight());
                  }
                  outputText("蠕动");
                  if(get_player().balls == 0 && get_player().cockTotal() == 1)
                  {
                     outputText("");
                  }
                  outputText("灼热地，作为回应排出了一些你自己的蠕虫，以及一滴浓稠的先列腺液。你想知道让他的蠕虫爬进你体内会是什么感觉……");
                  get_player().takeLustDamage(10,true);
               }
               else
               {
                  CoC_Settings.error("被寄生了但没有阴茎！");
                  outputText("被这野兽受感染的精液覆盖的想法让你有些兴奋，但你猛地摇了摇头，清除了这个不受欢迎的想法。");
                  get_player().takeLustDamage(5,true);
               }
            }
            else if(get_game().get_parasitesHigh())
            {
               get_player().takeLustDamage(5,true);
               outputText("被这野兽受感染的精液覆盖的想法让你有些兴奋，但你猛地摇了摇头，清除了这个不受欢迎的想法。");
            }
         }
         set_lust(get_lust() - 25);
         if(get_lust() < 40)
         {
            set_lust(40);
         }
      }
      
      override public function defeated(param1:Boolean) : void
      {
         clearOutput();
         if(param1)
         {
            outputText("地狱犬的火焰变暗，两个头发出呜咽声，然后这生物瘫倒在地，被打败了，失去了知觉，但仍在流着蠕虫。");
         }
         else
         {
            outputText("无法忍受其不自然的兴奋，受感染的地狱犬的火焰变暗，停止了攻击。两个头看着你，哀怨地呜咽着。地狱犬慢慢地走到你身边，用鼻子蹭你的胯部。它似乎想取悦你。[pg]");
         }
         get_game().output.menu();
         get_game().output.addButtonDisabled(0,"舔舐","让他使用他的舌头。这个场景需要你有生殖器并且有足够的性奋度。这个场景需要欲望胜利。");
         if(get_player().get_lust() >= 33 && !get_player().isGenderless())
         {
            if(!param1)
            {
               get_game().output.addButton(0,"舔舐",get_game().mountain.hellHoundScene.hellHoundGetsRaped).hint("让他使用他的舌头。");
            }
         }
         get_game().setSexLeaveButton();
      }
   }
}

