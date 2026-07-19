package classes.scenes.areas.mountain
{
   import classes.CoC;
   import classes.CockTypesEnum;
   import classes.Monster;
   import classes.PerkLib;
   import classes.Player;
   import classes.StatusEffects;
   import classes.internals.MonsterAI;
   import classes.internals.Utils;
   import classes.internals.WeightedChoice;
   import classes.items.ConsumableLib;
   import classes.scenes.combat.Combat;
   import classes.scenes.combat.CombatRange;
   import coc.view.CoCButton;
   import flash.Boot;
   
   public class HellHound extends Monster
   {
      
      public function HellHound(param1:Boolean = false)
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
         set_short("hellhound");
         imageName = "hellhound";
         set_long("这是一只庞大的野兽，看起来就像一只非常大的疯狗，两个狗头并排长着。它的眼睛和嘴里充满了火焰，肌肉发达的腿上长着带有长而锋利爪子的爪垫。它从头到脚都覆盖着厚厚的黑毛，像黑夜一样黑，就像某种天然的盔甲。它的两双眼睛都死死地盯着你，带着野性的欲望，凶狠地注视着你的一举一动，同时慢慢地绕着你转圈。");
         set_race("Hellhound");
         createCock(8,2,CockTypesEnum.DOG);
         createCock(8,2,CockTypesEnum.DOG);
         balls = 2;
         ballSize = 4;
         cumMultiplier = 5;
         createBreastRow();
         createBreastRow();
         createBreastRow();
         ass.analLooseness = 2;
         ass.analWetness = 1;
         set_tallness(47);
         hips.rating = 4;
         butt.rating = 5;
         lowerBody.type = 2;
         skin.tone = "black";
         skin.setType(1);
         hair.color = "red";
         hair.length = 3;
         initStrTouSpeInte(55,60,40,1);
         initLibSensCor(95,20,100);
         set_weaponName("claws");
         set_weaponVerb("claw");
         set_weaponAttack(10);
         set_armorName("thick fur");
         set_lust(25);
         temperment = 3;
         level = 5;
         set_gems(10 + Utils.rand(10));
         set_drop(new WeightedChoice().add(get_consumables().CANINEP,6).add(get_consumables().WOLF_PP,1).addMany(2,get_consumables().BULBYPP,get_consumables().KNOTTYP,get_consumables().BLACKPP,get_consumables().DBLPEPP,get_consumables().LARGEPP));
         tail.type = 2;
         checkMonster();
      }
      
      override public function won(param1:Boolean, param2:Boolean = false) : void
      {
         var _g:Combat;
         if(param2)
         {
            outputText("[pg]地狱犬喷了下响鼻，丢下你自生自灭。");
            _g = get_game().combat;
            doNext(function():void
            {
               _g.cleanupAfterCombat();
            });
         }
         else
         {
            get_game().mountain.hellHoundScene.hellhoundRapesPlayer();
         }
      }
      
      override public function performCombatAction() : void
      {
         var _loc1_:MonsterAI = new MonsterAI();
         _loc1_.add(eAttack,1,true,0,FATIGUE_NONE,CombatRange.Melee);
         _loc1_.add(hellhoundFire,1,true,15,FATIGUE_MAGICAL,CombatRange.Ranged);
         _loc1_.add(hellhoundScent,1,true,10,FATIGUE_NONE,CombatRange.Self);
         _loc1_.exec();
      }
      
      override public function outputDefaultTeaseReaction(param1:Number) : void
      {
         if(param1 == 0)
         {
            outputText("\n" + get_capitalA() + Utils.cnName(get_short()) + "似乎不为所动。");
         }
         else if(param1 < 4)
         {
            outputText("\n" + get_capitalA() + Utils.cnName(get_short()) + "似乎对" + pronoun1 + "看到的东西很感兴趣。");
         }
         else if(param1 < 10)
         {
            outputText("\n" + get_capitalA() + Utils.cnName(get_short()) + "显然很享受这场表演。");
         }
         else if(param1 < 20)
         {
            outputText("\n" + get_capitalA() + Utils.cnName(get_short()) + "充满欲望地低吼着，" + pronoun3 + "眼中充满了渴望。");
         }
         else
         {
            outputText("\n" + get_capitalA() + Utils.cnName(get_short()) + "满怀期待地舔了舔" + pronoun3 + "嘴唇，" + pronoun3 + "两根肉棒从包皮里高高挺立出来。");
         }
      }
      
      public function hellhoundScent() : void
      {
         if(get_player().hasStatusEffect(StatusEffects.NoFlee))
         {
            if(get_spe() == 100)
            {
               hellhoundFire();
               return;
            }
            outputText("地狱犬再次嗅了嗅你的气味，随着它绕着你转得越来越快，似乎获得了越来越多的能量。");
            set_spe(100);
         }
         else
         {
            set_spe(get_spe() + 40);
            outputText("地狱犬的四只眼睛死死盯着你，同时嗅着你刚才所在位置的地面。它抬起头，对你露出一个火热的笑容——它似乎已经记住了你的气味！现在想逃跑可就难了……");
            get_player().createStatusEffect(StatusEffects.NoFlee,0,0,0,0);
         }
      }
      
      public function hellhoundFire() : void
      {
         var _loc1_:Number = NaN;
         if(hasStatusEffect(StatusEffects.Blind))
         {
            outputText(get_capitalA() + Utils.cnName(get_short()) + "释放的暗影烈焰完全没有击中你！感谢众神，它瞎了！");
            return;
         }
         if(get_player().hasPerk(PerkLib.Evade) && get_player().get_spe() >= 35 && Utils.rand(3) != 0)
         {
            outputText("地狱犬的两个头都深深地吸了一口气，然后向你喷出一波黑色的火焰。你轻松地避开了这波攻击，向侧面扑去，充分发挥了你闪避的天赋。");
         }
         else if(get_player().hasPerk(PerkLib.Misdirection) && Utils.rand(100) < 20 && get_player().get_armorName() == "red, high-society bodysuit")
         {
            outputText("利用拉斐尔的教导和紧身衣提供的活动能力，你预判并侧步躲开了" + get_a() + Utils.cnName(get_short()) + "的火焰。\n");
         }
         else if(get_player().hasPerk(PerkLib.Flexibility) && get_player().get_spe() > 30 && Utils.rand(10) != 0)
         {
            outputText("地狱犬的两个头都深深地吸了一口气，然后向你喷出一波黑色的火焰。你以令人难以置信的柔韧性扭曲并倒下，看着火焰无害地从头顶吹过。");
         }
         else
         {
            _loc1_ = 15 + Utils.rand(10);
            outputText("地狱犬的两个头都深深地吸了一口气，然后向你喷出一波黑色的火焰。虽然火焰并没有燃烧太多，但不自然的灼热让你的身体充满了性欲。");
            get_game().combat.monsterDamageType = "Fire";
            get_player().takeDamage(_loc1_,true);
            get_player().takeLustDamage(20 + get_player().sens / 10,true);
            statScreenRefresh();
            if(get_player().get_HP() <= 0)
            {
               doNext(get_game().combat.endHpLoss);
               return;
            }
            if(get_player().get_lust() >= get_player().maxLust())
            {
               doNext(get_game().combat.endLustLoss);
               return;
            }
         }
         doNext(get_game().playerMenu);
      }
      
      override public function defeated(param1:Boolean) : void
      {
         clearOutput();
         if(param1)
         {
            outputText("地狱犬身上的火焰黯淡下来，两颗头颅发出一声哀鸣，随后这只生物瘫倒在地，被击败且几乎失去了意识。");
         }
         else
         {
            outputText("地狱犬不忍心再伤害你，它停止了攻击，身上的火焰也随之黯淡。两颗头颅看着你，发出哀怨的呜咽声。地狱犬慢慢走到你身边，用鼻子蹭了蹭你的胯部。它似乎想让你舒服一下。[pg]");
         }
         get_game().output.menu();
         get_game().output.addButtonDisabled(0,"操它","骑上它的双根肉棒。这个场景需要你有阴道和足够的性奋度。这个场景不适合腿少于两条的人。");
         get_game().output.addButtonDisabled(1,"舔舐","让它用舌头。这个场景需要你有生殖器和足够的性奋度。这个场景需要欲望胜利。");
         if(get_player().get_lust() >= 33 && !get_player().isGenderless())
         {
            if(get_player().hasVagina() && !get_player().hasTailInsteadOfLegs())
            {
               get_game().output.addButton(0,"操它",get_game().mountain.hellHoundScene.hellHoundPropahRape).hint("骑上它的双根肉棒。");
            }
            if(!param1)
            {
               get_game().output.addButton(1,"舔舐",get_game().mountain.hellHoundScene.hellHoundGetsRaped).hint("让它用舌头。");
            }
         }
         get_game().setSexLeaveButton();
      }
   }
}

