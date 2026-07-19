package classes.items
{
   import classes.internals.Utils;
   import flash.Boot;
   
   public class Equippable extends Useable
   {
      
      public function Equippable(param1:String = undefined, param2:String = undefined, param3:String = undefined, param4:Number = 0, param5:String = undefined)
      {
         if(Boot.skip_constructor)
         {
            return;
         }
         super(param1,param2,param3,param4,param5);
      }
      
      override public function useText() : void
      {
         outputText("你装备了" + Utils.cnName(get_longName()) + "。");
      }
      
      public function removeText() : void
      {
      }
      
      public function playerRemove() : Equippable
      {
         return this;
      }
      
      public function playerEquip() : Equippable
      {
         return this;
      }
   }
}

