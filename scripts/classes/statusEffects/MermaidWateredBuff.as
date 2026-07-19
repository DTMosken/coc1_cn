package classes.statusEffects
{
   import classes.DynStat;
   import classes.StatusEffectType;
   import flash.Boot;
   
   public class MermaidWateredBuff extends TemporaryBuff
   {
      
      public static var init__:Boolean;
      
      public static var TYPE:StatusEffectType;
      
      public function MermaidWateredBuff()
      {
         if(Boot.skip_constructor)
         {
            return;
         }
         super(MermaidWateredBuff.TYPE,"spe");
      }
      
      override public function apply(param1:Boolean) : void
      {
         var _loc2_:Number = NaN;
         if(param1)
         {
            buffHost(DynStat.Spe(30),DynStat.NoScale,DynStat.IgnoreMax);
         }
         else
         {
            _loc2_ = buffValue("spe");
            if(_loc2_ < 40)
            {
               buffHost(DynStat.Spe(40 - _loc2_),DynStat.NoScale,DynStat.IgnoreMax);
            }
         }
      }
   }
}

