package classes.scenes.npcs.pets
{
   import classes.Time;
   import classes.internals.Utils;
   import classes.scenes.npcs.NPCAwareContent;
   import coc.view.CoCButton;
   import flash.Boot;
   import haxe.IMap;
   import haxe.ds.StringMap;
   
   public class AbstractPet extends NPCAwareContent
   {
      
      public static var NONE:int = -1;
      
      public var statics:IMap;
      
      public var location:String;
      
      public var actions:IMap;
      
      public var actionSeen:int;
      
      public var _name:String;
      
      public function AbstractPet()
      {
         if(Boot.skip_constructor)
         {
            return;
         }
         statics = new StringMap();
         actions = new StringMap();
         _name = "Pet";
         actionSeen = -1;
         location = "营地";
         super();
      }
      
      public function set_name(param1:String) : String
      {
         return _name = param1;
      }
      
      public function petMenu(param1:Function, param2:Boolean = false) : void
      {
      }
      
      public function menuButton(param1:Function, param2:int = 0, param3:String = undefined) : void
      {
         var returnFunc1:Function;
         var _g:AbstractPet;
         if(param3 == null)
         {
            param3 = "营地";
         }
         _g = this;
         returnFunc1 = param1;
         var _loc4_:Function = function():void
         {
            _g.petMenu(returnFunc1);
         };
         addButton(param2,get_name(),_loc4_).disableIf(!isVisible(param3),get_name() + " 现在不在这里。");
      }
      
      public function locationShort() : String
      {
         var _loc1_:String = location;
         var _loc2_:StringMap = statics;
         var _loc3_:PetLocation = _loc1_ in StringMap.reserved ? _loc2_.getReserved(_loc1_) : _loc2_.h[_loc1_];
         return _loc3_ != null ? _loc3_.descript : "某处";
      }
      
      public function locationDesc(param1:String, param2:Boolean = false, param3:Boolean = true) : void
      {
         var _loc15_:* = null as String;
         var _loc16_:* = null as Array;
         var _loc17_:int = 0;
         if(!isOwned())
         {
            return;
         }
         var _loc4_:String = "";
         var _loc5_:String = location;
         var _loc6_:StringMap = actions;
         var _loc7_:PetLocation = _loc5_ in StringMap.reserved ? _loc6_.getReserved(_loc5_) : _loc6_.h[_loc5_];
         var _loc8_:String = location;
         var _loc9_:StringMap = statics;
         var _loc10_:PetLocation = _loc8_ in StringMap.reserved ? _loc9_.getReserved(_loc8_) : _loc9_.h[_loc8_];
         var _loc11_:Object = _loc7_ != null ? Boolean(_loc7_.visibleFrom.contains(param1)) : null;
         var _loc12_:Boolean = _loc11_ != null && Boolean(_loc11_);
         var _loc13_:Object = _loc10_ != null ? Boolean(_loc10_.visibleFrom.contains(param1)) : null;
         var _loc14_:Boolean = _loc13_ != null && Boolean(_loc13_);
         if(actionSeen != -1)
         {
            _loc15_ = _loc10_ != null ? _loc10_.texts[actionSeen] : null;
            _loc4_ = _loc15_ != null ? _loc15_ : "";
         }
         else if(_loc12_)
         {
            _loc16_ = _loc7_.texts;
            _loc4_ = _loc16_[Utils.rand(int(_loc16_.length))];
            actionSeen = Utils.rand(int(_loc10_.texts.length));
         }
         else if(_loc14_ && _loc7_ != null)
         {
            _loc17_ = int((get_time().days + get_time().hours) % int(_loc10_.texts.length));
            _loc4_ = _loc10_.texts[_loc17_];
         }
         else if(_loc14_)
         {
            actionSeen = Utils.rand(int(_loc10_.texts.length));
            _loc4_ = _loc10_.texts[actionSeen];
         }
         if(_loc4_.length > 0)
         {
            outputText((param2 ? "[pg]" : "") + _loc4_ + (param3 ? "[pg]" : ""));
         }
      }
      
      public function isVisible(param1:String = undefined) : Boolean
      {
         if(param1 == null)
         {
            param1 = "营地";
         }
         var _loc2_:String = location;
         var _loc3_:StringMap = statics;
         var _loc4_:PetLocation = _loc2_ in StringMap.reserved ? _loc3_.getReserved(_loc2_) : _loc3_.h[_loc2_];
         var _loc5_:Object = _loc4_ != null ? Boolean(_loc4_.visibleFrom.contains(param1)) : null;
         if(_loc5_ != null)
         {
            return _loc5_;
         }
         return false;
      }
      
      public function isOwned() : Boolean
      {
         return false;
      }
      
      public function get_name() : String
      {
         return _name;
      }
   }
}

