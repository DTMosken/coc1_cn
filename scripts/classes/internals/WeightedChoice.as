package classes.internals
{
   import flash.Boot;
   
   public class WeightedChoice implements RandomChoice
   {
      
      public var sum:Number;
      
      public var choices:Array;
      
      public function WeightedChoice(param1:Object = undefined, param2:Number = 0)
      {
         if(Boot.skip_constructor)
         {
            return;
         }
         sum = 0;
         choices = [];
         if(param1 != null)
         {
            choices.push({
               "value":param1,
               "weight":param2
            });
            sum += param2;
         }
      }
      
      public function clone() : WeightedChoice
      {
         var _loc1_:WeightedChoice = new WeightedChoice();
         _loc1_.choices = choices.slice(0);
         _loc1_.sum = sum;
         return _loc1_;
      }
      
      public function choose() : Object
      {
         if(int(choices.length) == 0)
         {
            return null;
         }
         var _loc1_:Number = Math.random() * sum;
         var _loc2_:* = choices[0];
         var _loc3_:int = 0;
         while(_loc3_ < int(choices.length) && _loc1_ > 0)
         {
            _loc2_ = choices[_loc3_];
            _loc1_ -= Number(_loc2_.weight);
            _loc3_++;
         }
         return _loc2_.value;
      }
      
      public function addMany(param1:Number, ... rest) : WeightedChoice
      {
         var _loc6_:* = null as Object;
         var _loc4_:int = 0;
         var _loc5_:Array = rest;
         while(_loc4_ < int(_loc5_.length))
         {
            _loc6_ = _loc5_[_loc4_++];
            choices.push({
               "value":_loc6_,
               "weight":param1
            });
            sum += param1;
         }
         return this;
      }
      
      public function add(param1:Object, param2:Number = 1) : WeightedChoice
      {
         choices.push({
            "value":param1,
            "weight":param2
         });
         sum += param2;
         return this;
      }
   }
}

