package com.bit101.components
{
   import flash.Boot;
   import flash.display.BitmapData;
   import flash.display.DisplayObjectContainer;
   import flash.display.Graphics;
   import flash.display.Shape;
   import flash.events.Event;
   import flash.events.MouseEvent;
   import flash.geom.Rectangle;
   import openfl.display._internal.FlashGraphics;
   
   public class ScrollPane extends Panel
   {
      
      public static var SCROLL_SIZE:int = 15;
      
      public var _vScrollbar:VScrollBar;
      
      public var _hScrollbar:HScrollBar;
      
      public var _dragContent:Boolean;
      
      public var _corner:Shape;
      
      public function ScrollPane(param1:DisplayObjectContainer = undefined, param2:Number = 0, param3:Number = 0)
      {
         if(Boot.skip_constructor)
         {
            return;
         }
         _dragContent = true;
         super(param1,param2,param3);
      }
      
      public function update() : void
      {
         setInvalidated();
      }
      
      public function set_dragContent(param1:Boolean) : Boolean
      {
         _dragContent = param1;
         if(_dragContent)
         {
            content.addEventListener(MouseEvent.MOUSE_DOWN,onMouseGoDown);
            _background.addEventListener(MouseEvent.MOUSE_DOWN,onMouseGoDown);
            _background.useHandCursor = true;
            _background.buttonMode = true;
         }
         else
         {
            content.removeEventListener(MouseEvent.MOUSE_DOWN,onMouseGoDown);
            _background.removeEventListener(MouseEvent.MOUSE_DOWN,onMouseGoDown);
            _background.useHandCursor = false;
            _background.buttonMode = false;
         }
         return param1;
      }
      
      public function set_autoHideScrollBar(param1:Boolean) : Boolean
      {
         _vScrollbar.set_autoHide(param1);
         return _hScrollbar.set_autoHide(param1);
      }
      
      public function onScroll(param1:Event) : void
      {
         content.x = -_hScrollbar.get_value();
         content.y = -_vScrollbar.get_value();
      }
      
      public function onResize(param1:Event) : void
      {
         setInvalidated();
      }
      
      public function onMouseMove(param1:MouseEvent) : void
      {
         _hScrollbar.set_value(-content.x);
         _vScrollbar.set_value(-content.y);
      }
      
      public function onMouseGoUp(param1:MouseEvent) : void
      {
         content.stopDrag();
         stage.removeEventListener(MouseEvent.MOUSE_MOVE,onMouseMove);
         stage.removeEventListener(MouseEvent.MOUSE_UP,onMouseGoUp);
      }
      
      public function onMouseGoDown(param1:MouseEvent) : void
      {
         content.startDrag(false,new Rectangle(0,0,Math.min(0,_width - content.width - 15),Math.min(0,_height - content.height - 15 - 1)));
         stage.addEventListener(MouseEvent.MOUSE_MOVE,onMouseMove);
         stage.addEventListener(MouseEvent.MOUSE_UP,onMouseGoUp);
      }
      
      override public function init() : void
      {
         super.init();
         addEventListener(Event.RESIZE,onResize);
         content.addEventListener(MouseEvent.MOUSE_DOWN,onMouseGoDown);
         _background.addEventListener(MouseEvent.MOUSE_DOWN,onMouseGoDown);
         _background.useHandCursor = true;
         _background.buttonMode = true;
         setSize(100,100);
      }
      
      public function get_dragContent() : Boolean
      {
         return _dragContent;
      }
      
      public function get_autoHideScrollBar() : Boolean
      {
         return _vScrollbar.get_autoHide();
      }
      
      override public function draw() : void
      {
         super.draw();
         var _loc1_:Number = _height - 15;
         var _loc2_:Number = _width - 15;
         var _loc3_:Number = _loc1_ / content.height;
         var _loc4_:Number = _loc2_ / content.width;
         _vScrollbar.set_x(_loc2_);
         _hScrollbar.set_y(_loc1_);
         if(_loc4_ >= 1)
         {
            _vScrollbar.set_height(get_height());
            _mask.height = get_height();
         }
         else
         {
            _vScrollbar.set_height(_loc1_);
            _mask.height = _loc1_;
         }
         if(_loc3_ >= 1 && _vScrollbar.get_autoHide())
         {
            _hScrollbar.set_width(get_width());
            _mask.width = get_width();
         }
         else
         {
            _hScrollbar.set_width(_loc2_);
            _mask.width = _loc2_;
         }
         _vScrollbar.setThumbPercent(_loc3_);
         _vScrollbar.set_maximum(Math.max(0,content.height - _loc1_));
         _vScrollbar.set_pageSize(int(_loc1_));
         _hScrollbar.setThumbPercent(_loc4_);
         _hScrollbar.set_maximum(Math.max(0,content.width - _loc2_));
         _hScrollbar.set_pageSize(int(_loc2_));
         _corner.x = _loc2_;
         _corner.y = _loc1_;
         _corner.visible = _loc4_ < 1 && (_loc3_ < 1 || !_vScrollbar.get_autoHide());
         content.x = -_hScrollbar.get_value();
         content.y = -_vScrollbar.get_value();
      }
      
      override public function addChildren() : void
      {
         super.addChildren();
         _vScrollbar = new VScrollBar(null,get_width() - 15,0,onScroll);
         _hScrollbar = new HScrollBar(null,0,get_height() - 15,onScroll);
         _vScrollbar.setSliderParams(0,100,0);
         _hScrollbar.setSliderParams(0,100,0);
         addRawChild(_vScrollbar);
         addRawChild(_hScrollbar);
         _corner = new Shape();
         var _loc1_:Graphics = _corner.graphics;
         var _loc2_:uint = Style.get_BUTTON_FACE();
         var _loc3_:BitmapData = null;
         FlashGraphics.bitmapFill[_loc1_] = _loc3_;
         _loc1_.beginFill(_loc2_,1);
         _corner.graphics.drawRect(0,0,15,15);
         _loc1_ = _corner.graphics;
         _loc3_ = null;
         FlashGraphics.bitmapFill[_loc1_] = _loc3_;
         _loc1_.endFill();
         addRawChild(_corner);
         _hScrollbar.set_autoHide(true);
      }
   }
}

