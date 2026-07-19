package classes.statusEffects
{
   import classes.StatusEffectType;
   import classes.internals._ValueFunc.NumberFunc_Impl_;
   import flash.Boot;
   
   public class TranquilBlessing extends TimedStatusEffectReal
   {
      
      public static var init__:Boolean;
      
      public static var TYPE:StatusEffectType;
      
      public var id:String;
      
      public function TranquilBlessing(param1:int = 24, param2:int = 1)
      {
         if(Boot.skip_constructor)
         {
            return;
         }
         id = "TranquilBlessing";
         super(TranquilBlessing.TYPE,"");
         setDuration(param1);
         boost("生命恢复 (%)",NumberFunc_Impl_.fromInt(param2),false);
      }
   }
}

