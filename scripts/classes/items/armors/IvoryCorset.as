package classes.items.armors
{
   import classes.PerkLib;
   import classes.PerkType;
   import classes.internals._ValueFunc.NumberFunc_Impl_;
   import flash.Boot;
   
   public class IvoryCorset extends ArmorWithPerk
   {
      
      public function IvoryCorset()
      {
         if(Boot.skip_constructor)
         {
            return;
         }
         super("IvCorset","Ivory Corset","silvery corset with sheer skirt","a silvery corset with a sheer skirt",0,1000,"A light gray lace corset with a sheer white skirt, and stockings that leave the nails and soles exposed. The set exposes the breasts of the wearer, as well as coming with crotchless panties to ensure anything can be shown off with ease.","Light",PerkLib.IvoryMagic,1.2,0,0,0,"Increases the magnitude of Leech and Charge Weapon.",null,0,0,0,0,"",false,false);
         boost("挑逗几率",NumberFunc_Impl_.fromInt(6),false);
         boost("挑逗伤害",NumberFunc_Impl_.fromInt(6),false);
         boost("闪避几率",NumberFunc_Impl_.fromInt(10),false);
         boost("法术消耗",NumberFunc_Impl_.fromInt(-10),false);
      }
   }
}

