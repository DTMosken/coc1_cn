package com.bit101.components
{
   import flash.Boot;
   import flash.display.BitmapData;
   import flash.display.DisplayObject;
   import flash.display.DisplayObjectContainer;
   import flash.display.Graphics;
   import flash.display.Sprite;
   import flash.filters.DropShadowFilter;
   import openfl.display._internal.FlashGraphics;
   
   public class Panel extends Component
   {
      
      public var content:Sprite;
      
      public var _showGrid:Boolean;
      
      public var _shadow:Boolean;
      
      public var _mask:Sprite;
      
      public var _gridSize:int;
      
      public var _gridColor:uint;
      
      public var _color:int;
      
      public var _background:Sprite;
      
      public var _alpha:int;
      
      public function Panel(param1:DisplayObjectContainer = undefined, param2:Number = 0, param3:Number = 0)
      {
         if(Boot.skip_constructor)
         {
            return;
         }
         _gridColor = 13684944;
         _showGrid = false;
         _gridSize = 10;
         _shadow = true;
         _alpha = 100;
         _color = -1;
         super(param1,param2,param3);
      }
      
      public function set_showGrid(param1:Boolean) : Boolean
      {
         _showGrid = param1;
         setInvalidated();
         return param1;
      }
      
      public function set_shadow(param1:Boolean) : Boolean
      {
         _shadow = param1;
         if(_shadow)
         {
            filters = [getShadow(2,true)];
         }
         else
         {
            filters = [];
         }
         return param1;
      }
      
      public function set_gridSize(param1:int) : int
      {
         _gridSize = param1;
         setInvalidated();
         return param1;
      }
      
      public function set_gridColor(param1:uint) : uint
      {
         _gridColor = param1;
         setInvalidated();
         return param1;
      }
      
      public function set_color(param1:int) : int
      {
         _color = param1;
         setInvalidated();
         return param1;
      }
      
      override public function init() : void
      {
         super.init();
         setSize(100,100);
      }
      
      public function get_showGrid() : Boolean
      {
         return _showGrid;
      }
      
      public function get_shadow() : Boolean
      {
         return _shadow;
      }
      
      public function get_gridSize() : int
      {
         return _gridSize;
      }
      
      public function get_gridColor() : uint
      {
         return _gridColor;
      }
      
      public function get_color() : int
      {
         return _color;
      }
      
      public function drawGrid() : void
      {
         if(!_showGrid)
         {
            return;
         }
         _background.graphics.lineStyle(0,_gridColor);
         var _loc1_:int = 0;
         while(_loc1_ < _width)
         {
            _background.graphics.moveTo(_loc1_,0);
            _background.graphics.lineTo(_loc1_,_height);
            _loc1_ += _gridSize;
         }
         _loc1_ = 0;
         while(_loc1_ < _height)
         {
            _background.graphics.moveTo(0,_loc1_);
            _background.graphics.lineTo(_width,_loc1_);
            _loc1_ += _gridSize;
         }
      }
      
      override public function draw() : void
      {
         var _loc1_:* = null as Graphics;
         var _loc2_:uint = 0;
         var _loc3_:* = null as BitmapData;
         super.draw();
         _background.graphics.clear();
         _background.graphics.lineStyle(1,0,0.1);
         if(_color == -1)
         {
            _loc1_ = _background.graphics;
            _loc2_ = Style.get_PANEL();
            _loc3_ = null;
            FlashGraphics.bitmapFill[_loc1_] = _loc3_;
            _loc1_.beginFill(_loc2_,1);
         }
         else if(_alpha == 100)
         {
            _loc1_ = _background.graphics;
            _loc3_ = null;
            FlashGraphics.bitmapFill[_loc1_] = _loc3_;
            _loc1_.beginFill(uint(_color),1);
         }
         else
         {
            _loc1_ = _background.graphics;
            _loc3_ = null;
            FlashGraphics.bitmapFill[_loc1_] = _loc3_;
            _loc1_.beginFill(uint(_color),_alpha);
         }
         _background.graphics.drawRect(0,0,_width,_height);
         _loc1_ = _background.graphics;
         _loc3_ = null;
         FlashGraphics.bitmapFill[_loc1_] = _loc3_;
         _loc1_.endFill();
         drawGrid();
         _mask.graphics.clear();
         _loc1_ = _mask.graphics;
         _loc3_ = null;
         FlashGraphics.bitmapFill[_loc1_] = _loc3_;
         _loc1_.beginFill(16711680,1);
         _mask.graphics.drawRect(0,0,_width,_height);
         _loc1_ = _mask.graphics;
         _loc3_ = null;
         FlashGraphics.bitmapFill[_loc1_] = _loc3_;
         _loc1_.endFill();
      }
      
      public function addRawChild(param1:DisplayObject) : DisplayObject
      {
         super.addChild(param1);
         return param1;
      }
      
      override public function addChildren() : void
      {
         _background = new Sprite();
         super.addChild(_background);
         _mask = new Sprite();
         _mask.mouseEnabled = false;
         super.addChild(_mask);
         content = new Sprite();
         super.addChild(content);
         content.mask = _mask;
         set_shadow(false);
      }
      
      override public function addChild(param1:DisplayObject) : DisplayObject
      {
         content.addChild(param1);
         return param1;
      }
   }
}

