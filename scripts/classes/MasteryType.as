package classes
{
   import classes.internals.Utils;
   import flash.Boot;
   import haxe.IMap;
   import haxe.ds.StringMap;
   
   public class MasteryType extends BaseContent implements BonusStatsInterface
   {
      
      public static var init__:Boolean;
      
      public static var MASTERY_LIBRARY:IMap;
      
      public var host:Creature;
      
      public var bonusStats:BonusDerivedStats;
      
      public var _xpCurve:Number;
      
      public var _permable:Boolean;
      
      public var _name:String;
      
      public var _maxLevel:int;
      
      public var _id:String;
      
      public var _desc:String;
      
      public var _category:String;
      
      public function MasteryType(param1:String = undefined, param2:String = undefined, param3:String = undefined, param4:String = undefined, param5:Number = 1.5, param6:int = 5, param7:Boolean = true)
      {
         if(param3 == null)
         {
            param3 = "General";
         }
         if(param4 == null)
         {
            param4 = "";
         }
         if(Boot.skip_constructor)
         {
            return;
         }
         bonusStats = new BonusDerivedStats();
         _permable = false;
         _maxLevel = 0;
         _xpCurve = Number(Math.NaN);
         super();
         _id = param1;
         _name = param2;
         _category = param3;
         _desc = param4;
         _xpCurve = param5;
         _maxLevel = param6;
         _permable = param7;
         var _loc8_:StringMap = MasteryType.MASTERY_LIBRARY;
         if(param1 in StringMap.reserved)
         {
            _loc8_.setReserved(param1,this);
         }
         else
         {
            _loc8_.h[param1] = this;
         }
      }
      
      public static function lookupMastery(param1:String) : MasteryType
      {
         var _loc2_:StringMap = MasteryType.MASTERY_LIBRARY;
         if(param1 in StringMap.reserved)
         {
            return _loc2_.getReserved(param1);
         }
         return _loc2_.h[param1];
      }
      
      public static function getMasteryLibrary() : IMap
      {
         return MasteryType.MASTERY_LIBRARY;
      }
      
      public function sourceString() : String
      {
         return get_name();
      }
      
      public function onLevel(param1:int, param2:Boolean = true) : void
      {
         if(param2)
         {
            outputText("[pg-]<b>" + Utils.cnName(_name) + "精通现在达到了" + param1 + "级</b>[pg-]");
         }
      }
      
      public function onAttach(param1:Boolean = true) : void
      {
         if(param1)
         {
            outputText("[pg-]<b>你已开始训练" + Utils.cnName(_name) + "精通。</b>[pg-]");
         }
      }
      
      public function get_xpCurve() : Number
      {
         return _xpCurve;
      }
      
      public function get_permable() : Boolean
      {
         return _permable;
      }
      
      public function get_name() : String
      {
         return _name;
      }
      
      public function get_maxLevel() : int
      {
         return _maxLevel;
      }
      
      public function get_id() : String
      {
         return _id;
      }
      
      public function get_desc() : String
      {
         return _desc;
      }
      
      public function get_category() : String
      {
         return _category;
      }
      
      public function boost(param1:String, param2:Function, param3:Boolean = false) : void
      {
         bonusStats.boost(param1,param2,param3,sourceString());
      }
   }
}

