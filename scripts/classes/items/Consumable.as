package classes.items
{
   import classes.Player;
   import classes.StatusEffects;
   import classes.internals.Utils;
   import flash.Boot;
   
   public class Consumable extends Useable
   {
      
      public var itemTags:Array;
      
      public function Consumable(param1:String = undefined, param2:String = undefined, param3:String = undefined, param4:Number = 0, param5:String = undefined)
      {
         if(Boot.skip_constructor)
         {
            return;
         }
         itemTags = [];
         super(param1,param2,param3,param4,param5);
      }
      
      public function tfChance(param1:int, param2:int) : Boolean
      {
         return get_mutations().tfChance(param1,param2);
      }
      
      public function set_changes(param1:int) : int
      {
         return get_mutations().changes = param1;
      }
      
      public function set_changeLimit(param1:int) : int
      {
         return get_mutations().changeLimit = param1;
      }
      
      override public function onUse() : void
      {
         if(hasAllTags("Alcohol") && get_player().hasStatusEffect(StatusEffects.Frostbite))
         {
            outputText("[pg]酒精让你浑身发热，暂时驱散了寒意。[pg]");
            get_player().removeStatusEffect(StatusEffects.Frostbite);
         }
      }
      
      public function hasAnyTags(... rest) : Boolean
      {
         var _loc5_:* = null as String;
         var _loc3_:int = 0;
         var _loc4_:Array = rest.copy();
         while(_loc3_ < int(_loc4_.length))
         {
            _loc5_ = _loc4_[_loc3_];
            _loc3_++;
            if(Boolean(itemTags.contains(_loc5_)))
            {
               return true;
            }
         }
         return false;
      }
      
      public function hasAllTags(... rest) : Boolean
      {
         var _loc5_:* = null as String;
         var _loc3_:int = 0;
         var _loc4_:Array = rest.copy();
         while(_loc3_ < int(_loc4_.length))
         {
            _loc5_ = _loc4_[_loc3_];
            _loc3_++;
            if(!Boolean(itemTags.contains(_loc5_)))
            {
               return false;
            }
         }
         return true;
      }
      
      override public function get_description() : String
      {
         var _loc1_:String = Utils.cnName(_description);
         _loc1_ += "\n\n类型：消耗品 ";
         if(get_shortName() == "S.Hummus")
         {
            _loc1_ += "(作弊物品)";
         }
         if(hasAllTags("Thrown"))
         {
            _loc1_ += "(投掷物)";
         }
         if(hasAllTags("Rare"))
         {
            _loc1_ += "(稀有物品)";
         }
         if(hasAllTags("Dye"))
         {
            _loc1_ += "(染料)";
         }
         if(hasAllTags("Egg"))
         {
            _loc1_ += "(蛋)";
         }
         if(hasAllTags("Book"))
         {
            _loc1_ += "(书籍)";
         }
         return _loc1_ + ("\n基础价值：" + Std.string(get_value()));
      }
      
      public function get_changes() : int
      {
         return get_mutations().changes;
      }
      
      public function get_changeLimit() : int
      {
         return get_mutations().changeLimit;
      }
      
      override public function getMaxStackSize() : int
      {
         return 10;
      }
      
      public function addTags(... rest) : Consumable
      {
         var _loc5_:* = null as String;
         var _loc3_:int = 0;
         var _loc4_:Array = rest.copy();
         while(_loc3_ < int(_loc4_.length))
         {
            _loc5_ = _loc4_[_loc3_];
            _loc3_++;
            itemTags.push(_loc5_);
         }
         return this;
      }
   }
}

