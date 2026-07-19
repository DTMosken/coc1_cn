package classes._MainMenu
{
   import classes.Contribution;
   
   public final class Cont_Impl_
   {
      
      public function Cont_Impl_()
      {
      }
      
      public static function _new(param1:Contribution) : Contribution
      {
         return param1;
      }
      
      public static function fromString(param1:String) : Contribution
      {
         return Contribution.Standalone(param1);
      }
      
      public static function fromStringArr(param1:Array) : Contribution
      {
         var _loc2_:String = param1.shift();
         if(_loc2_ == null)
         {
            return Contribution.Grouped("",param1);
         }
         return Contribution.Grouped(_loc2_,param1);
      }
   }
}

