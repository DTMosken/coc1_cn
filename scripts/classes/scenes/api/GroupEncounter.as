package classes.scenes.api
{
   import flash.Boot;
   
   public class GroupEncounter implements Encounter
   {
      
      public var name:String;
      
      public var components:Array;
      
      public function GroupEncounter(param1:String = undefined, param2:Array = undefined)
      {
         if(Boot.skip_constructor)
         {
            return;
         }
         name = param1;
         components = param2;
      }
      
      public function execEncounter() : void
      {
         Encounters.select(components).execEncounter();
      }
      
      public function encounterName() : String
      {
         return name;
      }
      
      public function encounterChance() : Number
      {
         var _loc4_:* = null as Encounter;
         var _loc1_:Number = 0;
         var _loc2_:int = 0;
         var _loc3_:Array = components;
         while(_loc2_ < int(_loc3_.length))
         {
            _loc4_ = _loc3_[_loc2_];
            _loc2_++;
            _loc1_ += _loc4_.encounterChance();
         }
         return _loc1_;
      }
      
      public function add(... rest) : GroupEncounter
      {
         var _loc5_:* = null as Encounter;
         var _loc3_:int = 0;
         var _loc4_:Array = rest;
         while(_loc3_ < int(_loc4_.length))
         {
            _loc5_ = _loc4_[_loc3_++];
            components.push(_loc5_);
         }
         return this;
      }
   }
}

