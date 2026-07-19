package com.bit101.components
{
   import flash.Boot;
   import flash.display.DisplayObject;
   import flash.display.DisplayObjectContainer;
   import flash.events.Event;
   
   [Event(name="resize",type="flash.events.Event")]
   public class VBox extends Component
   {
      
      public static var LEFT:String = "left";
      
      public static var RIGHT:String = "right";
      
      public static var CENTER:String = "center";
      
      public static var NONE:String = "none";
      
      public var _spacing:Number;
      
      public var _padding:Number;
      
      public var _alignment:String;
      
      public function VBox(param1:DisplayObjectContainer = undefined, param2:Number = 0, param3:Number = 0)
      {
         if(Boot.skip_constructor)
         {
            return;
         }
         _alignment = "none";
         _padding = 0;
         _spacing = 5;
         super(param1,param2,param3);
      }
      
      public function set_spacing(param1:Number) : Number
      {
         _spacing = param1;
         setInvalidated();
         return param1;
      }
      
      public function set_padding(param1:int) : int
      {
         _padding = param1;
         setInvalidated();
         return param1;
      }
      
      public function set_alignment(param1:String) : String
      {
         _alignment = param1;
         setInvalidated();
         return param1;
      }
      
      override public function removeChildAt(param1:int) : DisplayObject
      {
         var _loc2_:DisplayObject = super.removeChildAt(param1);
         _loc2_.removeEventListener(Event.RESIZE,onResize);
         draw();
         return _loc2_;
      }
      
      override public function removeChild(param1:DisplayObject) : DisplayObject
      {
         super.removeChild(param1);
         param1.removeEventListener(Event.RESIZE,onResize);
         draw();
         return param1;
      }
      
      public function onResize(param1:Event) : void
      {
         setInvalidated();
         draw();
      }
      
      public function get_spacing() : Number
      {
         return _spacing;
      }
      
      public function get_padding() : int
      {
         return int(_padding);
      }
      
      public function get_alignment() : String
      {
         return _alignment;
      }
      
      override public function draw() : void
      {
         var _loc3_:* = null as DisplayObject;
         _width = 0;
         _height = 0;
         var _loc1_:Number = _padding;
         var _loc2_:int = 0;
         while(_loc2_ < numChildren)
         {
            _loc3_ = getChildAt(_loc2_);
            _loc3_.y = _loc1_;
            _loc1_ += _loc3_.height;
            _loc1_ += _spacing;
            _height += _loc3_.height;
            _width = Math.max(_width,_loc3_.width);
            _loc2_++;
         }
         doAlignment();
         _height += _spacing * (numChildren - 1);
         _height += _padding * 2;
         forceSize();
         dispatchEvent(new Event(Event.RESIZE));
      }
      
      public function doAlignment() : void
      {
         var _loc1_:int = 0;
         var _loc2_:* = null as DisplayObject;
         if(_alignment != "none")
         {
            _loc1_ = 0;
            while(_loc1_ < numChildren)
            {
               _loc2_ = getChildAt(_loc1_);
               if(_alignment == "left")
               {
                  _loc2_.x = 0;
               }
               else if(_alignment == "right")
               {
                  _loc2_.x = _width - _loc2_.width;
               }
               else if(_alignment == "center")
               {
                  _loc2_.x = (_width - _loc2_.width) / 2;
               }
               _loc1_++;
            }
         }
      }
      
      override public function addChildAt(param1:DisplayObject, param2:int) : DisplayObject
      {
         super.addChildAt(param1,param2);
         param1.addEventListener(Event.RESIZE,onResize);
         draw();
         return param1;
      }
      
      override public function addChild(param1:DisplayObject) : DisplayObject
      {
         super.addChild(param1);
         param1.addEventListener(Event.RESIZE,onResize);
         draw();
         return param1;
      }
   }
}

