package coc.view.selfDebug
{
   import com.bit101.components.HBox;
   import com.bit101.components.PushButton;
   import com.bit101.components.VBox;
   import flash.display.DisplayObject;
   import flash.display.DisplayObjectContainer;
   import flash.events.Event;
   
   public class ArrayComponent_Int implements Component
   {
      
      public var vbox:VBox = new VBox();
      
      public var value:Array;
      
      public function ArrayComponent_Int(param1:Array = undefined, param2:Function = undefined)
      {
         value = param1;
         draw();
      }
      
      public function setValue(param1:int, param2:int) : int
      {
         return value[param1] = param2;
      }
      
      public function draw() : void
      {
         var index:int;
         var _g:ArrayComponent_Int;
         var _loc3_:int = 0;
         var _loc4_:* = null as HBox;
         var _loc5_:* = null as Component;
         vbox.removeChildren();
         vbox.set_padding(2);
         _g = this;
         index = 0;
         vbox.addChild(button("+",function(param1:Event):void
         {
            _g.doAdd(index,param1);
         }));
         var _loc1_:int = 0;
         var _loc2_:int = int(value.length);
         while(_loc1_ < _loc2_)
         {
            _loc3_ = _loc1_++;
            _loc4_ = new HBox();
            _loc4_.set_alignment("middle");
            _loc4_.addChild(button("+",(function(param1:Array, param2:Array):Function
            {
               var index:Array = param1;
               var _g:Array = param2;
               return function(param1:Event):void
               {
                  _g[0].doAdd(int(index[0]),param1);
               };
            })([_loc3_ + 1],[this])));
            _loc4_.addChild(button("-",(function(param1:Array, param2:Array):Function
            {
               var index:Array = param1;
               var _g:Array = param2;
               return function(param1:Event):void
               {
                  _g[0].doRemove(int(index[0]),param1);
               };
            })([_loc3_],[this])));
            _loc5_ = new IntComponent(int(value[_loc3_]),(function(param1:Array, param2:Array):Function
            {
               var index:Array = param1;
               var _g:Array = param2;
               return function(param1:int):int
               {
                  return _g[0].setValue(int(index[0]),param1);
               };
            })([_loc3_],[this]));
            _loc4_.addChild(_loc5_.displayObject());
            vbox.addChild(_loc4_);
         }
         vbox.draw();
      }
      
      public function doRemove(param1:int, param2:Event) : void
      {
         value.splice(param1,1);
         draw();
         vbox.dispatchEvent(new Event(DebugComp.UPDATED));
      }
      
      public function doAdd(param1:int, param2:Event) : void
      {
         value.insert(param1,int(value[param1 - 1]));
         draw();
         vbox.dispatchEvent(new Event(DebugComp.UPDATED));
      }
      
      public function displayObject() : DisplayObject
      {
         return vbox;
      }
      
      public function button(param1:String, param2:Function) : PushButton
      {
         var _loc3_:PushButton = new PushButton(null,0,0,param1,param2);
         _loc3_.set_width(25);
         _loc3_.draw();
         return _loc3_;
      }
   }
}

