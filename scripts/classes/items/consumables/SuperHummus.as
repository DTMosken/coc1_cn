package classes.items.consumables
{
   import classes.BreastRow;
   import classes.Cock;
   import classes.Player;
   import classes.StatusEffects;
   import classes.Vagina;
   import classes.items.Consumable;
   import classes.items.ConsumableLib;
   import classes.items.Mutations;
   import flash.Boot;
   
   public class SuperHummus extends Consumable
   {
      
      public function SuperHummus()
      {
         if(Boot.skip_constructor)
         {
            return;
         }
         super("Hummus2","S. Hummus","a blob of cheesy-looking super hummus",6,"This pile of hummus doesn\'t look that clean, and you really don\'t remember where you got it from. It looks bland. So bland that you feel blander just by looking at it.");
         _headerName = "Super Hummus";
      }
      
      override public function useItem() : Boolean
      {
         var _loc2_:* = null as ConsumableLib;
         var _loc1_:String = "superHummus";
         if(get_debug())
         {
            outputText("你正准备吃鹰嘴豆泥，却发现里面有虫子。你不想吃有虫子的鹰嘴豆泥，也不想去挑虫子，于是你把它扔进了传送门，去找别的东西吃。");
            _loc2_ = get_consumables();
            get_player().destroyItems(_loc2_.HUMMUS2,1);
            return false;
         }
         outputText("你把这东西塞进嘴里，不知道自己为什么吃它，但一旦开始，你就停不下来。它的味道极其平淡，带着一丝奶酪的味道。");
         get_player().refillHunger(100);
         get_player().set_str(30);
         get_player().set_spe(30);
         get_player().set_tou(30);
         get_player().set_inte(30);
         get_player().sens = 20;
         get_player().lib = 25;
         get_player().cor = 5;
         get_player().set_lust(10);
         get_player().hair.type = 0;
         if(get_player().humanScore() > 4)
         {
            outputText("[pg]你眨了眨眼，周围的世界扭曲了。你感觉自己比以前更像自己了，但具体是怎么回事还不太明显。也许你应该看看自己？");
         }
         else
         {
            outputText("[pg]当世界在你周围旋转时，你大叫起来。你意识到你的整个身体都在滑动、改变和变形，但在感觉的海洋中，你完全不知道到底发生了什么变化。你差点晕过去，然后一切就结束了。也许你最好看看自己，看看发生了什么变化？");
         }
         get_player().arms.restore();
         get_player().eyes.type = 0;
         get_player().eyes.count = 2;
         get_player().antennae.type = 0;
         get_player().face.type = 0;
         get_player().lowerBody.type = 0;
         get_player().lowerBody.legCount = 2;
         get_player().wings.type = 0;
         get_player().tail.type = 0;
         get_player().tongue.type = 0;
         get_player().tail.recharge = 0;
         get_player().horns.value = 0;
         get_player().horns.type = 0;
         get_player().ears.type = 0;
         get_player().skin.type = 0;
         get_player().skin.desc = "skin";
         get_player().skin.adj = "";
         get_player().underBody.restore();
         get_player().neck.restore();
         get_player().rearBody.restore();
         get_player().tongue.type = 0;
         if(get_player().fertility > 15)
         {
            get_player().fertility = 15;
         }
         if(get_player().cumMultiplier > 50)
         {
            get_player().cumMultiplier = 50;
         }
         var _loc3_:Boolean = false;
         while(int(get_player().cocks.length) > 0)
         {
            get_player().removeCock(0,1);
         }
         if(get_player().get_gender() == 1 || get_player().get_gender() == 3)
         {
            get_player().createCock();
            get_player().cocks[0].cockLength = 6;
            get_player().cocks[0].cockThickness = 1;
            get_player().ballSize = 2;
            if(get_player().balls > 2)
            {
               get_player().balls = 2;
            }
         }
         else
         {
            get_player().balls = 0;
            get_player().ballSize = 2;
         }
         while(int(get_player().vaginas.length) > 0)
         {
            _loc3_ = get_player().vaginas[0].virgin;
            get_player().removeVagina(0,1);
         }
         if(get_player().get_gender() >= 2)
         {
            get_player().createVagina();
            get_player().vaginas[0].virgin = _loc3_;
         }
         get_player().setClitLength(0.25);
         get_player().butt.rating = 2;
         get_player().hips.rating = 2;
         if(get_player().ass.analLooseness > 1)
         {
            get_player().ass.analLooseness = 1;
         }
         if(get_player().ass.analWetness > 1)
         {
            get_player().ass.analWetness = 1;
         }
         get_player().breastRows.resize(0);
         get_player().createBreastRow();
         get_player().nippleLength = 0.25;
         if(get_player().get_gender() > 2)
         {
            get_player().breastRows[0].breastRating = 2;
         }
         else
         {
            get_player().breastRows[0].breastRating = 0;
         }
         get_player().gills.type = 0;
         get_player().removeStatusEffect(StatusEffects.Uniball);
         get_player().removeStatusEffect(StatusEffects.BlackNipples);
         get_player().vaginaType(0);
         get_mutations().updateOvipositionPerk(_loc1_);
         return false;
      }
   }
}

