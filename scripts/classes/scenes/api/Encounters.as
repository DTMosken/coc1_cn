package classes.scenes.api
{
   import haxe.ds.Either;
   import haxe.ds.Option;
   
   public class Encounters
   {
      
      public static var init__:Boolean;
      
      public static var fn:FnHelpers;
      
      public static var ALWAYS:Number = 1.79e+308;
      
      public function Encounters()
      {
      }
      
      public static function complex(param1:Function, param2:String, ... rest) : Encounter
      {
         return new ComplexEncounter(param2,param1,rest.copy());
      }
      
      public static function group(param1:String, ... rest) : Encounter
      {
         return new GroupEncounter(param1,rest.copy());
      }
      
      public static function wrapEncounter(param1:Encounter, param2:Array) : Encounter
      {
         var encounter:Encounter = param1;
         if(int(param2.length) == 0)
         {
            return encounter;
         }
         return new SimpleEncounter(encounter.encounterName(),Encounters.fn.product(param2.concat([function():Number
         {
            return encounter.encounterChance();
         }])),function():void
         {
            encounter.execEncounter();
         });
      }
      
      public static function build(param1:EncounterDef) : Encounter
      {
         var _loc4_:* = null as Function;
         var _loc5_:* = null as Encounter;
         var _loc2_:Array = [param1.chance,param1.when].concat(param1.mods);
         var _loc3_:Either = param1.call;
         switch(_loc3_.index)
         {
            case 0:
               _loc4_ = _loc3_.params[0];
               return new SimpleEncounter(param1.name,Encounters.fn.product(_loc2_),_loc4_);
            case 1:
               _loc5_ = _loc3_.params[0];
               return Encounters.wrapEncounter(_loc5_,_loc2_);
            default:
               return;
         }
      }
      
      public static function selectOrNull(param1:Array) : Option
      {
         var _loc5_:* = null as Encounter;
         var _loc6_:Number = NaN;
         var _loc8_:int = 0;
         var _loc2_:Array = [];
         var _loc3_:Number = 0;
         var _loc4_:int = 0;
         while(_loc4_ < int(param1.length))
         {
            _loc5_ = param1[_loc4_];
            _loc4_++;
            _loc6_ = _loc5_.encounterChance();
            if(_loc6_ >= Encounters.ALWAYS)
            {
               return Option.Some(_loc5_);
            }
            _loc3_ += _loc6_;
            _loc2_.push(_loc6_);
         }
         if(_loc3_ == 0)
         {
            return Option.None;
         }
         _loc6_ = Math.random() * _loc3_;
         _loc4_ = 0;
         var _loc7_:int = int(param1.length);
         while(_loc4_ < _loc7_)
         {
            _loc8_ = _loc4_++;
            _loc6_ -= Number(_loc2_[_loc8_]);
            if(_loc6_ <= 0)
            {
               return Option.Some(param1[_loc8_]);
            }
         }
         return Option.None;
      }
      
      public static function select(param1:Array) : Encounter
      {
         var _loc3_:* = null as Encounter;
         var _loc2_:Option = Encounters.selectOrNull(param1);
         switch(_loc2_.index)
         {
            case 0:
               return _loc2_.params[0];
            case 1:
               return param1[int(param1.length) - 1];
            default:
               return;
         }
      }
   }
}

