package classes
{
   import classes._BonusDerivedStats.BonusStat_Impl_;
   import flash.Boot;
   import haxe.IMap;
   import haxe.ds.StringMap;
   
   public class BonusDerivedStats
   {
      
      public static var init__:Boolean;
      
      public static var goodNegatives:Array;
      
      public static var percentageAdditions:Array;
      
      public var statArray:IMap;
      
      public var defaultSource:String;
      
      public function BonusDerivedStats(param1:String = undefined)
      {
         if(param1 == null)
         {
            param1 = "";
         }
         if(Boot.skip_constructor)
         {
            return;
         }
         defaultSource = "";
         statArray = new StringMap();
         defaultSource = param1;
      }
      
      public function boost(param1:String, param2:Function, param3:Boolean = false, param4:String = undefined) : BonusDerivedStats
      {
         if(param4 == null)
         {
            param4 = "";
         }
         if(param3)
         {
            param1 = BonusStat_Impl_.multiplicative(param1);
         }
         if(param4 == "")
         {
            param4 = defaultSource;
         }
         var _loc5_:IMap = statArray;
         var _loc6_:Bonus = new Bonus(param2,param4,true);
         var _loc7_:StringMap = _loc5_;
         var _loc8_:String = param1;
         if(_loc8_ in StringMap.reserved)
         {
            _loc7_.setReserved(_loc8_,_loc6_);
         }
         else
         {
            _loc7_.h[_loc8_] = _loc6_;
         }
         return this;
      }
   }
}

