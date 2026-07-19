package com.bit101.components
{
   import flash.Boot;
   import flash.display.BitmapData;
   import flash.display.DisplayObjectContainer;
   import flash.display.Graphics;
   import flash.display.Sprite;
   import flash.events.MouseEvent;
   import flash.filters.DropShadowFilter;
   import openfl.display._internal.FlashGraphics;
   
   public class PushButton extends Component
   {
      
      public var _toggle:Boolean;
      
      public var _selected:Boolean;
      
      public var _over:Boolean;
      
      public var _labelText:String;
      
      public var _label:Label;
      
      public var _face:Sprite;
      
      public var _down:Boolean;
      
      public var _back:Sprite;
      
      public function PushButton(param1:DisplayObjectContainer = undefined, param2:Number = 0, param3:Number = 0, param4:String = undefined, param5:Object = undefined)
      {
         if(param4 == null)
         {
            param4 = "";
         }
         if(Boot.skip_constructor)
         {
            return;
         }
         _toggle = false;
         _selected = false;
         _down = false;
         _over = false;
         _labelText = "";
         super(param1,param2,param3);
         if(param5 != null)
         {
            addEventListener(MouseEvent.CLICK,param5);
         }
         set_label(param4);
      }
      
      public function set_toggle(param1:Boolean) : Boolean
      {
         return _toggle = param1;
      }
      
      public function set_selected(param1:Boolean) : Boolean
      {
         if(!_toggle)
         {
            param1 = false;
         }
         _selected = param1;
         _down = _selected;
         _face.filters = [getShadow(1,_selected)];
         drawFace();
         return param1;
      }
      
      public function set_label(param1:String) : String
      {
         _labelText = param1;
         draw();
         return param1;
      }
      
      public function onMouseOver(param1:MouseEvent) : void
      {
         _over = true;
         addEventListener(MouseEvent.ROLL_OUT,onMouseOut);
      }
      
      public function onMouseOut(param1:MouseEvent) : void
      {
         _over = false;
         if(!_down)
         {
            _face.filters = [getShadow(1)];
         }
         removeEventListener(MouseEvent.ROLL_OUT,onMouseOut);
      }
      
      public function onMouseGoUp(param1:MouseEvent) : void
      {
         if(_toggle && _over)
         {
            _selected = !_selected;
         }
         _down = _selected;
         drawFace();
         _face.filters = [getShadow(1,_selected)];
         stage.removeEventListener(MouseEvent.MOUSE_UP,onMouseGoUp);
      }
      
      public function onMouseGoDown(param1:MouseEvent) : void
      {
         _down = true;
         drawFace();
         _face.filters = [getShadow(1,true)];
         stage.addEventListener(MouseEvent.MOUSE_UP,onMouseGoUp);
      }
      
      override public function init() : void
      {
         super.init();
         buttonMode = true;
         useHandCursor = true;
         setSize(100,20);
      }
      
      public function get_toggle() : Boolean
      {
         return _toggle;
      }
      
      public function get_selected() : Boolean
      {
         return _selected;
      }
      
      public function get_label() : String
      {
         return _labelText;
      }
      
      public function drawFace() : void
      {
         var _loc1_:* = null as Graphics;
         var _loc2_:uint = 0;
         var _loc3_:* = null as BitmapData;
         _face.graphics.clear();
         if(_down)
         {
            _loc1_ = _face.graphics;
            _loc2_ = Style.get_BUTTON_DOWN();
            _loc3_ = null;
            FlashGraphics.bitmapFill[_loc1_] = _loc3_;
            _loc1_.beginFill(_loc2_,1);
         }
         else
         {
            _loc1_ = _face.graphics;
            _loc2_ = Style.get_BUTTON_FACE();
            _loc3_ = null;
            FlashGraphics.bitmapFill[_loc1_] = _loc3_;
            _loc1_.beginFill(_loc2_,1);
         }
         _face.graphics.drawRect(0,0,_width - 2,_height - 2);
         _loc1_ = _face.graphics;
         _loc3_ = null;
         FlashGraphics.bitmapFill[_loc1_] = _loc3_;
         _loc1_.endFill();
      }
      
      override public function draw() : void
      {
         super.draw();
         _back.graphics.clear();
         var _loc1_:Graphics = _back.graphics;
         var _loc2_:uint = Style.get_BACKGROUND();
         var _loc3_:BitmapData = null;
         FlashGraphics.bitmapFill[_loc1_] = _loc3_;
         _loc1_.beginFill(_loc2_,1);
         _back.graphics.drawRect(0,0,_width,_height);
         _loc1_ = _back.graphics;
         _loc3_ = null;
         FlashGraphics.bitmapFill[_loc1_] = _loc3_;
         _loc1_.endFill();
         drawFace();
         _label.set_text(_labelText);
         _label.set_autoSize(true);
         _label.draw();
         if(_label.get_width() > _width - 4)
         {
            _label.set_autoSize(false);
            _label.set_width(_width - 4);
         }
         else
         {
            _label.set_autoSize(true);
         }
         _label.draw();
         _label.move(_width / 2 - _label.get_width() / 2,_height / 2 - _label.get_height() / 2);
      }
      
      override public function addChildren() : void
      {
         _back = new Sprite();
         _back.filters = [getShadow(2,true)];
         _back.mouseEnabled = false;
         addChild(_back);
         _face = new Sprite();
         _face.mouseEnabled = false;
         _face.filters = [getShadow(1)];
         _face.x = 1;
         _face.y = 1;
         addChild(_face);
         _label = new Label();
         addChild(_label);
         addEventListener(MouseEvent.MOUSE_DOWN,onMouseGoDown);
         addEventListener(MouseEvent.ROLL_OVER,onMouseOver);
      }
   }
}

