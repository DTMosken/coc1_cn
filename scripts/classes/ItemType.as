package classes
{
   import classes.internals.Utils;
   import coc.view.ButtonData;
   import flash.Boot;
   import haxe.IMap;
   import haxe.ds.StringMap;
   
   public class ItemType extends BaseContent implements BonusStatsInterface
   {
      
      public static var init__:Boolean;
      
      public static var ITEM_LIBRARY:IMap;
      
      public static var NOTHING:ItemType;
      
      public var isAltered:Boolean;
      
      public var host:Creature;
      
      public var bonusStats:BonusDerivedStats;
      
      public var _value:Number;
      
      public var _singular:String;
      
      public var _shortName:String;
      
      public var _plural:Boolean;
      
      public var _longName:String;
      
      public var _id:String;
      
      public var _headerName:String;
      
      public var _durability:Number;
      
      public var _description:String;
      
      public var _degradable:Boolean;
      
      public var _breaksInto:ItemType;
      
      public function ItemType(param1:String = undefined, param2:String = undefined, param3:String = undefined, param4:Number = 0, param5:String = undefined)
      {
         var _loc7_:* = null as StringMap;
         if(param1 == null)
         {
            param1 = "";
         }
         if(param2 == null)
         {
            param2 = "";
         }
         if(param3 == null)
         {
            param3 = "";
         }
         if(param5 == null)
         {
            param5 = "";
         }
         if(Boot.skip_constructor)
         {
            return;
         }
         bonusStats = new BonusDerivedStats();
         isAltered = false;
         _breaksInto = null;
         _durability = 0;
         _degradable = false;
         _singular = "";
         _plural = false;
         _headerName = "";
         _value = Number(Math.NaN);
         super();
         _id = param1;
         _shortName = param2 != null && param2 != "" ? param2 : param1;
         _longName = param3 != null && param3 != "" ? param3 : get_shortName();
         _description = param5 != null && param5 != "" ? param5 : get_longName();
         _value = param4;
         var _loc6_:StringMap = ItemType.ITEM_LIBRARY;
         if((param1 in StringMap.reserved ? _loc6_.getReserved(param1) : _loc6_.h[param1]) != null)
         {
            _loc7_ = ItemType.ITEM_LIBRARY;
            CoC_Settings.error("重复的物品ID " + param1 + "，旧物品是 " + (param1 in StringMap.reserved ? _loc7_.getReserved(param1) : _loc7_.h[param1]).get_longName());
         }
         _loc7_ = ItemType.ITEM_LIBRARY;
         if(param1 in StringMap.reserved)
         {
            _loc7_.setReserved(param1,this);
         }
         else
         {
            _loc7_.h[param1] = this;
         }
      }
      
      public static function lookupItem(param1:String) : ItemType
      {
         var _loc2_:StringMap = ItemType.ITEM_LIBRARY;
         if(param1 in StringMap.reserved)
         {
            return _loc2_.getReserved(param1);
         }
         return _loc2_.h[param1];
      }
      
      public static function getItemLibrary() : IMap
      {
         return ItemType.ITEM_LIBRARY;
      }
      
      public function toString() : String
      {
         return "\"" + _id + "\"";
      }
      
      public function sourceString() : String
      {
         return get_longName();
      }
      
      public function set_value(param1:Number) : Number
      {
         return _value = param1;
      }
      
      public function set_shortName(param1:String) : String
      {
         return _shortName = param1;
      }
      
      public function set_name(param1:String) : String
      {
         return set_longName(param1);
      }
      
      public function set_longName(param1:String) : String
      {
         return _longName = param1;
      }
      
      public function set_id(param1:String) : String
      {
         return _id = param1;
      }
      
      public function set_durability(param1:int) : int
      {
         if(param1 > 0)
         {
            _degradable = true;
         }
         _durability = param1;
         return param1;
      }
      
      public function set_description(param1:String) : String
      {
         return _description = param1;
      }
      
      public function set_degradesInto(param1:ItemType) : ItemType
      {
         return _breaksInto = param1;
      }
      
      public function set_degradable(param1:Boolean) : Boolean
      {
         return _degradable = param1;
      }
      
      public function isDegradable() : Boolean
      {
         return _degradable;
      }
      
      public function get_value() : Number
      {
         return _value;
      }
      
      public function get_tooltipText() : String
      {
         return get_description();
      }
      
      public function get_tooltipHeader() : String
      {
         return Utils.cnName(Utils.titleCase(get_headerName()));
      }
      
      public function get_singularName() : String
      {
         if(_singular != "")
         {
            return _singular;
         }
         return get_name();
      }
      
      public function get_shortName() : String
      {
         return _shortName;
      }
      
      public function get_plural() : Boolean
      {
         return _plural;
      }
      
      public function get_name() : String
      {
         return get_longName();
      }
      
      public function get_longName() : String
      {
         return _longName;
      }
      
      public function get_id() : String
      {
         return _id;
      }
      
      public function get_headerName() : String
      {
         if(_headerName != "")
         {
            return _headerName;
         }
         return get_shortName();
      }
      
      public function get_durability() : int
      {
         return int(_durability);
      }
      
      public function get_description() : String
      {
         return _description;
      }
      
      public function get_degradesInto() : ItemType
      {
         return _breaksInto;
      }
      
      public function getMaxStackSize() : int
      {
         return 5;
      }
      
      public function buttonData(param1:Function, param2:Boolean = true) : ButtonData
      {
         return new ButtonData(get_shortName(),param1,get_tooltipText(),get_tooltipHeader(),param2);
      }
      
      public function boost(param1:String, param2:Function, param3:Boolean = false) : void
      {
         bonusStats.boost(param1,param2,param3,sourceString());
      }
      
      public function appendStatsDifference(param1:int) : String
      {
         if(param1 > 0)
         {
            return " (<font color=\"#007f00\">+" + Std.string(Math.abs(param1)) + "</font>)";
         }
         if(param1 < 0)
         {
            return " (<font color=\"#7f0000\">-" + Std.string(Math.abs(param1)) + "</font>)";
         }
         return "";
      }
   }
}

