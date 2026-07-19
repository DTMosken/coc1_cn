package coc.view.selfDebug
{
   import com.bit101.components.HBox;
   import com.bit101.components.VBox;
   import flash.Boot;
   import flash.display.DisplayObject;
   
   public class BitflagComponent implements Component
   {
      
      public var vbox:VBox;
      
      public var value:int;
      
      public var usedBits:int;
      
      public var onChange:Function;
      
      public function BitflagComponent(param1:int = 0, param2:Function = undefined, ... rest)
      {
         var _loc10_:int = 0;
         var _loc11_:int = 0;
         var _loc12_:Boolean = false;
         var _loc13_:* = null as Function;
         var _loc14_:* = null as DebugComp;
         var _loc15_:* = null as HBox;
         if(Boot.skip_constructor)
         {
            return;
         }
         value = 0;
         vbox = new VBox();
         value = param1;
         onChange = param2;
         var _loc5_:int = 0;
         var _loc6_:Number = 0;
         var _loc7_:Array = [];
         var _loc8_:int = 0;
         var _loc9_:int = int(rest.length);
         while(_loc8_ < _loc9_)
         {
            _loc10_ = _loc8_++;
            _loc11_ = 1 << _loc10_;
            _loc12_ = (param1 & _loc11_) != 0;
            _loc13_ = (function(param1:Array, param2:Array):Function
            {
               var _g:Array = param1;
               var mask:Array = param2;
               return function(param1:Boolean):Boolean
               {
                  return _g[0].setBit(int(mask[0]),param1);
               };
            })([this],[_loc11_]);
            _loc14_ = new DebugComp(rest[_loc10_],"",new BoolComponent(_loc12_,_loc13_));
            _loc15_ = _loc14_.displayObject();
            _loc15_.removeChild(_loc14_.hintLabel);
            vbox.addChild(_loc15_);
            _loc7_.push(_loc14_);
            _loc6_ = Math.max(_loc6_,_loc14_.nameLabel.width);
            _loc5_ |= _loc11_;
         }
         _loc8_ = 0;
         while(_loc8_ < int(_loc7_.length))
         {
            _loc14_ = _loc7_[_loc8_];
            _loc8_++;
            _loc14_.nameLabel.autoSize = "none";
            _loc14_.nameLabel.width = _loc6_;
         }
         usedBits = _loc5_;
      }
      
      public function setBit(param1:int, param2:Boolean) : Boolean
      {
         if(param2)
         {
            value |= param1;
         }
         else
         {
            value &= ~param1;
         }
         value = int(onChange(value & usedBits));
         return (value & param1) != 0;
      }
      
      public function displayObject() : DisplayObject
      {
         return vbox;
      }
   }
}

