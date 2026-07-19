package classes.scenes.areas.swamp
{
   import classes.CoC;
   import classes.ItemType;
   import classes.StatusEffects;
   import classes.internals.Utils;
   import classes.internals.WeightedChoice;
   import classes.items.ConsumableLib;
   import classes.items.UseableLib;
   import flash.Boot;
   
   public class MaleSpiderMorph extends AbstractSpiderMorph
   {
      
      public function MaleSpiderMorph()
      {
         if(Boot.skip_constructor)
         {
            return;
         }
         super();
         set_a("");
         set_short("male spider-morph");
         imageName = "malespidermorph";
         set_long("这个雄性蜘蛛人全身赤裸，除了他那及大腿的长袜和及前臂的手套，仔细一看，这些似乎实际上是他身体的一部分——他的外骨骼。他暴露在外的皮肤像满月一样苍白，除了他那暗色的乳头和一片覆盖在他腹股沟上的乌黑斑块，使这个雄性带有包皮的阴茎和悬垂的阴囊闪烁着乌黑的光泽。他的屁股很小但很圆润，上面悬挂着一个沉重的蜘蛛腹部。这个蜘蛛人目前正用一种奇怪的表情看着你，并露出了他的毒牙。");
         set_race("Spider-Morph");
         createCock(6,2);
         balls = 2;
         ballSize = 2;
         createBreastRow(0);
         ass.analLooseness = 1;
         ass.analWetness = 0;
         createStatusEffect(StatusEffects.BonusACapacity,40,0,0,0);
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
         set_armorValue(70);
         bonusHP = 200;
         set_lust(20);
         lustVuln = 0.6;
         temperment = 2;
         level = 13;
         set_gems(Utils.rand(10) + 10);
         set_drop(new WeightedChoice().add(get_consumables().S_GOSSR,5).add(get_useables().T_SSILK,1).add(null,4));
         tail.type = 5;
         tail.recharge = 0;
         checkMonster();
      }
      
      override public function won(param1:Boolean, param2:Boolean = false) : void
      {
         if(param2)
         {
            outputText("[pg]蜘蛛女在等待时露出了掠食者般的笑容……");
            doNext(get_game().combat.endLustLoss);
         }
         else
         {
            get_game().swamp.maleSpiderMorphScene.loseToMaleSpiderMorph();
         }
      }
      
      override public function defeated(param1:Boolean) : void
      {
         get_game().swamp.maleSpiderMorphScene.defeatSpiderBoy();
      }
   }
}

