package classes.statusEffects
{
   import classes.DynStat;
   import classes.StatusEffectType;
   import flash.Boot;
   
   public class MermaidWateredDebuff extends TemporaryBuff
   {
      
      public static var init__:Boolean;
      
      public static var TYPE:StatusEffectType;
      
      public function MermaidWateredDebuff()
      {
         if(Boot.skip_constructor)
         {
            return;
         }
         super(MermaidWateredDebuff.TYPE,"spe");
      }
      
      override public function apply(param1:Boolean) : void
      {
         var _loc2_:Number = NaN;
         if(param1)
         {
            buffHost(DynStat.Spe(-10),DynStat.NoScale,DynStat.IgnoreMax);
         }
         else
         {
            _loc2_ = buffValue("spe");
            if(_loc2_ > -20)
            {
               buffHost(DynStat.Spe(-20 - _loc2_),DynStat.NoScale,DynStat.IgnoreMax);
            }
         }
      }
   }
}

