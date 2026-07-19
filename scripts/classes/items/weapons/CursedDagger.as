package classes.items.weapons
{
   import classes.internals._ValueFunc.NumberFunc_Impl_;
   import classes.items.Weapon;
   import flash.Boot;
   
   public class CursedDagger extends Weapon
   {
      
      public function CursedDagger()
      {
         if(Boot.skip_constructor)
         {
            return;
         }
         super("Cursed Dagger ","Cursed Dagger","cursed dagger","a cursed dagger",["stab"],10,2500,"A thin, dark blade, rather long for a dagger. It is one solid piece of metal, with small intricate runic carvings along the flat of the blade and others on the hilt to make it easier to grip. It is unusually cold to the touch. ",["Cunning","Knife"],1);
         boost("暴击伤害",NumberFunc_Impl_.fromFloat(1.2),true);
         boost("武器暴击率",NumberFunc_Impl_.fromInt(25),false);
         boost("最大生命值",NumberFunc_Impl_.fromFloat(0.8),true);
      }
      
      override public function useText() : void
      {
         outputText("你挥舞着匕首，立刻感到一阵恶心和虚弱。过了一会儿，最糟糕的感觉消失了，但你确信，只要装备着它，你的<b>生命值就会降低！</b>");
      }
      
      override public function removeText() : void
      {
         outputText("当你停止装备匕首时，你感觉你的体质恢复了。");
      }
   }
}

