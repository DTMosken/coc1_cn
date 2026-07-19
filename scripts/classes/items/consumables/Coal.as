package classes.items.consumables
{
   import classes.Player;
   import classes.StatusEffects;
   import classes.items.Consumable;
   import flash.Boot;
   
   public class Coal extends Consumable
   {
      
      public function Coal()
      {
         if(Boot.skip_constructor)
         {
            return;
         }
         super("Coal   ","Coal","the lumps of coal",6,"These black lumps of coal look quite ordinary, but the sparse amount of soot they give off makes you feel hot when inhaled.");
      }
      
      override public function useItem() : Boolean
      {
         set_changes(0);
         outputText("当你在手中翻看了几下煤块后，它开始碎裂成一团粉尘！你吸入的下一口气让黑色的粉尘充满了你的肺部，让你连咳带喘。在经历了大约一分钟剧烈的咳嗽后，你恢复了过来，并意识到煤块已经没有留下任何痕迹，甚至你的手上都没有煤烟的污迹……");
         if(get_player().goIntoHeat(true,2))
         {
            set_changes(get_changes() + 1);
         }
         else if(get_player().goIntoRut(true))
         {
            set_changes(get_changes() + 1);
         }
         else if(get_player().statusEffectv1(StatusEffects.BonusACapacity) < 80)
         {
            if(!get_player().hasStatusEffect(StatusEffects.BonusACapacity))
            {
               get_player().createStatusEffect(StatusEffects.BonusACapacity,0,0,0,0);
            }
            get_player().addStatusValue(StatusEffects.BonusACapacity,1,5);
            outputText("[pg]你感觉……不知怎么的变得更能容纳了。你的[asshole]微微发麻，虽然它似乎并没有变松，但变得更有弹性了。");
            set_changes(get_changes() + 1);
         }
         else
         {
            outputText("[pg]你的全身刺痛了一会儿，但很快就过去了。看来这块煤现在对你起不了什么作用了。");
         }
         return false;
      }
   }
}

