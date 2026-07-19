package classes.items.consumables
{
   import classes.CoC;
   import classes.MainViewManager;
   import classes.Monster;
   import classes.StatusEffects;
   import classes.internals.Utils;
   import classes.items.Consumable;
   import flash.Boot;
   
   public final class BeautifulSwordShard extends Consumable
   {
      
      public function BeautifulSwordShard()
      {
         if(Boot.skip_constructor)
         {
            return;
         }
         super("S. Shard","Sword Shard","a beautiful sword shard",200,"A shard of the once mighty beautiful sword. The craftsmanship required to rebuild it has been lost; however, some of its holy power remains, and may be used in combat.");
      }
      
      override public function useItem() : Boolean
      {
         var _loc1_:Number = NaN;
         var _loc2_:* = null as Monster;
         outputText("你握着美丽之剑的碎片，将其指向敌人。碎片发出耀眼的光芒，一道光束从中射出，直奔[themonster]而去！\n");
         if(get_monster().get_spe() - 80 > Utils.rand(100) + 1)
         {
            outputText("不知怎么的，[themonster]的");
            if(!get_monster().get_plural())
            {
               outputText("");
            }
            outputText("惊人速度让[monster.him]躲过了光束！碎片完全生锈并化为尘土。");
         }
         else
         {
            _loc1_ = Math.round((70 + Utils.rand(61)) * (1 + get_monster().cor / 100));
            outputText("[Themonster]被光束击中了！随着光束的引导，碎片完全生锈并化为灰烬，烧伤并致盲了[monster.him]。<b>(<font color=\"" + get_mainViewManager().colorHpMinus() + "\">" + _loc1_ + "</font>)</b>");
            get_monster().createStatusEffect(StatusEffects.Blind,2,0,0,0);
            _loc2_ = get_monster();
            _loc2_.set_HP(_loc2_.get_HP() - _loc1_);
            if(get_monster().get_HP() < 0)
            {
               get_monster().set_HP(0);
            }
         }
         return false;
      }
      
      override public function canUse() : Boolean
      {
         if(get_game().get_inCombat())
         {
            return true;
         }
         outputText("没有可以使用的对象！");
         return false;
      }
   }
}

