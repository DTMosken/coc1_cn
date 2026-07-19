package classes.statusEffects
{
   import classes.Creature;
   import classes.DynStat;
   import classes.StatusEffectType;
   import flash.Boot;
   
   public class IzumiPipeSmoke extends TimedStatusEffectReal
   {
      
      public static var init__:Boolean;
      
      public static var TYPE:StatusEffectType;
      
      public function IzumiPipeSmoke(param1:int = 24)
      {
         if(Boot.skip_constructor)
         {
            return;
         }
         super(IzumiPipeSmoke.TYPE,"spe","sens","lib");
         setDuration(param1);
         setRemoveString("[b:你轻声呻吟，思绪清晰起来。看来和泉的烟斗烟雾效果已经消退了。]");
      }
      
      override public function apply(param1:Boolean) : void
      {
         var _loc2_:int = int(1 + value4);
         var _loc3_:int = int(get_host().get_spe() * 0.1 * _loc2_);
         var _loc4_:int = int(get_host().sens * 0.1 * _loc2_);
         var _loc5_:int = int(get_host().lib * 0.1 * _loc2_);
         buffHost(DynStat.Spe(-_loc3_),DynStat.Sens(_loc4_),DynStat.Lib(_loc5_),DynStat.NoScale);
      }
   }
}

