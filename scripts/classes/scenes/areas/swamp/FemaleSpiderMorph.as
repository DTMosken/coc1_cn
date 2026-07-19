package classes.scenes.areas.swamp
{
   import classes.Appearance;
   import classes.CoC;
   import classes.ItemType;
   import classes.StatusEffects;
   import classes.internals.Utils;
   import classes.internals.WeightedChoice;
   import classes.items.ConsumableLib;
   import classes.items.UseableLib;
   import flash.Boot;
   
   public class FemaleSpiderMorph extends AbstractSpiderMorph
   {
      
      public function FemaleSpiderMorph()
      {
         if(Boot.skip_constructor)
         {
            return;
         }
         super();
         set_a("");
         set_short("female spider-morph");
         imageName = "femalespidermorph";
         set_long("这个雌性蜘蛛人除了大腿高的长袜和前臂长的手套外，全身赤裸。仔细观察，这些似乎实际上是她身体的一部分——她的外骨骼。她暴露的皮肤像满月一样苍白，除了她乳头的暗色皮肤和她性器官的黑色三角区。她的乳房和屁股都很丰满圆润，在她的屁股上方有一个球状的蜘蛛腹部。这个蜘蛛女目前正用一种奇怪的表情看着你，并露出了她的獠牙。");
         set_race("Spider-Morph");
         createVagina(false,4,2);
         createStatusEffect(StatusEffects.BonusVCapacity,40,0,0,0);
         createBreastRow(Appearance.breastCupInverse("E+"));
         ass.analLooseness = 0;
         ass.analWetness = 0;
         createStatusEffect(StatusEffects.BonusACapacity,30,0,0,0);
         set_tallness(90);
         hips.rating = 12;
         butt.rating = 9;
         lowerBody.type = 15;
         skin.tone = "dusky";
         hair.color = "red";
         hair.length = 13;
         initStrTouSpeInte(60,50,99,99);
         initLibSensCor(35,35,20);
         set_weaponName("dagger");
         set_weaponVerb("stab");
         set_weaponAttack(15);
         set_armorName("exoskeleton");
         set_armorDef(14);
         set_armorPerk("");
         set_armorValue(50);
         bonusHP = 200;
         set_lust(20);
         lustVuln = 0.6;
         temperment = 2;
         level = 13;
         set_gems(Utils.rand(10) + 10);
         set_drop(new WeightedChoice().add(get_consumables().S_GOSSR,5).add(get_useables().T_SSILK,1).add(null,4));
         tail.type = 5;
         checkMonster();
      }
      
      override public function won(param1:Boolean, param2:Boolean = false) : void
      {
         if(param2)
         {
            outputText("[pg]蜘蛛露出了掠食者般的笑容，同时她等待着...");
            doNext(get_game().combat.endLustLoss);
         }
         else
         {
            get_game().swamp.femaleSpiderMorphScene.loseToFemaleSpiderMorph();
         }
      }
      
      override public function defeated(param1:Boolean) : void
      {
         get_game().swamp.femaleSpiderMorphScene.defeatASpiderBitch();
      }
   }
}

