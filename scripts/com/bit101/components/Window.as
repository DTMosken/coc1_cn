package com.bit101.components
{
   import flash.Boot;
   import flash.display.BitmapData;
   import flash.display.DisplayObject;
   import flash.display.DisplayObjectContainer;
   import flash.display.Graphics;
   import flash.display.Shape;
   import flash.display.Sprite;
   import flash.events.Event;
   import flash.events.MouseEvent;
   import flash.filters.DropShadowFilter;
   import openfl.display._internal.FlashGraphics;
   
   [Event(name="select",type="flash.events.Event")]
   [Event(name="close",type="flash.events.Event")]
   [Event(name="resize",type="flash.events.Event")]
   public class Window extends Component
   {
      
      public var _titleLabel:Label;
      
      public var _titleBar:Panel;
      
      public var _title:String;
      
      public var _shadow:Boolean;
      
      public var _panel:Panel;
      
      public var _minimized:Boolean;
      
      public var _minimizeButton:Sprite;
      
      public var _hasMinimizeButton:Boolean;
      
      public var _hasCloseButton:Boolean;
      
      public var _grips:Shape;
      
      public var _draggable:Boolean;
      
      public var _color:int;
      
      public var _closeButton:PushButton;
      
      public function Window(param1:DisplayObjectContainer = undefined, param2:Number = 0, param3:Number = 0, param4:String = undefined)
      {
         if(param4 == null)
         {
            param4 = "Window";
         }
         if(Boot.skip_constructor)
         {
            return;
         }
         _hasCloseButton = false;
         _minimized = false;
         _hasMinimizeButton = false;
         _draggable = true;
         _shadow = true;
         _color = -1;
         _title = param4;
         super(param1,param2,param3);
      }
      
      public function set_titleBar(param1:Panel) : Panel
      {
         return _titleBar = param1;
      }
      
      public function set_title(param1:String) : String
      {
         _title = param1;
         _titleLabel.set_text(_title);
         return param1;
      }
      
      public function set_shadow(param1:Boolean) : Boolean
      {
         _shadow = param1;
         if(_shadow)
         {
            filters = [getShadow(4,false)];
         }
         else
         {
            filters = [];
         }
         return param1;
      }
      
      public function set_minimized(param1:Boolean) : Boolean
      {
         _minimized = param1;
         if(_minimized)
         {
            if(contains(_panel))
            {
               removeChild(_panel);
            }
            _minimizeButton.rotation = -90;
         }
         else
         {
            if(!contains(_panel))
            {
               super.addChild(_panel);
            }
            _minimizeButton.rotation = 0;
         }
         dispatchEvent(new Event(Event.RESIZE));
         return param1;
      }
      
      public function set_hasMinimizeButton(param1:Boolean) : Boolean
      {
         _hasMinimizeButton = param1;
         if(_hasMinimizeButton)
         {
            super.addChild(_minimizeButton);
         }
         else if(contains(_minimizeButton))
         {
            removeChild(_minimizeButton);
         }
         setInvalidated();
         return param1;
      }
      
      public function set_hasCloseButton(param1:Boolean) : Boolean
      {
         _hasCloseButton = param1;
         if(_hasCloseButton)
         {
            _titleBar.content.addChild(_closeButton);
         }
         else if(_titleBar.content.contains(_closeButton))
         {
            _titleBar.content.removeChild(_closeButton);
         }
         setInvalidated();
         return param1;
      }
      
      public function set_draggable(param1:Boolean) : Boolean
      {
         _draggable = param1;
         _titleBar.buttonMode = _draggable;
         _titleBar.useHandCursor = _draggable;
         return param1;
      }
      
      public function set_color(param1:int) : int
      {
         _color = param1;
         setInvalidated();
         return param1;
      }
      
      public function onMouseGoUp(param1:MouseEvent) : void
      {
         stopDrag();
         stage.removeEventListener(MouseEvent.MOUSE_UP,onMouseGoUp);
      }
      
      public function onMouseGoDown(param1:MouseEvent) : void
      {
         if(_draggable)
         {
            startDrag();
            stage.addEventListener(MouseEvent.MOUSE_UP,onMouseGoUp);
            parent.addChild(this);
         }
         dispatchEvent(new Event(Event.SELECT));
      }
      
      public function onMinimize(param1:MouseEvent) : void
      {
         set_minimized(!get_minimized());
      }
      
      public function onClose(param1:MouseEvent) : void
      {
         dispatchEvent(new Event(Event.CLOSE));
      }
      
      override public function init() : void
      {
         super.init();
         setSize(100,100);
      }
      
      public function get_titleBar() : Panel
      {
         return _titleBar;
      }
      
      public function get_title() : String
      {
         return _title;
      }
      
      public function get_shadow() : Boolean
      {
         return _shadow;
      }
      
      public function get_minimized() : Boolean
      {
         return _minimized;
      }
      
      override public function get_height() : Number
      {
         if(contains(_panel))
         {
            return Number(super.get_height());
         }
         return 20;
      }
      
      public function get_hasMinimizeButton() : Boolean
      {
         return _hasMinimizeButton;
      }
      
      public function get_hasCloseButton() : Boolean
      {
         return _hasCloseButton;
      }
      
      public function get_grips() : Shape
      {
         return _grips;
      }
      
      public function get_draggable() : Boolean
      {
         return _draggable;
      }
      
      public function get_content() : DisplayObjectContainer
      {
         return _panel.content;
      }
      
      public function get_color() : int
      {
         return _color;
      }
      
      override public function draw() : void
      {
         super.draw();
         _titleBar.set_color(_color);
         _panel.set_color(_color);
         _titleBar.set_width(get_width());
         _titleBar.draw();
         _titleLabel.set_x(_hasMinimizeButton ? 20 : 5);
         _closeButton.set_x(_width - 14);
         _grips.x = _titleLabel.x + _titleLabel.get_width();
         if(_hasCloseButton)
         {
            _grips.width = _closeButton.x - _grips.x - 2;
         }
         else
         {
            _grips.width = _width - _grips.x - 2;
         }
         _panel.setSize(_width,_height - 20);
         _panel.draw();
      }
      
      public function addRawChild(param1:DisplayObject) : DisplayObject
      {
         super.addChild(param1);
         return param1;
      }
      
      override public function addChildren() : void
      {
         _titleBar = new Panel();
         _titleBar.filters = [];
         _titleBar.buttonMode = true;
         _titleBar.useHandCursor = true;
         _titleBar.addEventListener(MouseEvent.MOUSE_DOWN,onMouseGoDown);
         _titleBar.set_height(20);
         super.addChild(_titleBar);
         _titleLabel = new Label(_titleBar.content,5,1,_title);
         _grips = new Shape();
         _grips.graphics.lineStyle(1,16777215,0.55);
         _grips.graphics.moveTo(0,3);
         _grips.graphics.lineTo(100,3);
         _grips.graphics.lineStyle(1,0,0.125);
         _grips.graphics.moveTo(0,4);
         _grips.graphics.lineTo(100,4);
         _grips.graphics.lineStyle(1,16777215,0.55);
         _grips.graphics.moveTo(0,7);
         _grips.graphics.lineTo(100,7);
         _grips.graphics.lineStyle(1,0,0.125);
         _grips.graphics.moveTo(0,8);
         _grips.graphics.lineTo(100,8);
         _grips.graphics.lineStyle(1,16777215,0.55);
         _grips.graphics.moveTo(0,11);
         _grips.graphics.lineTo(100,11);
         _grips.graphics.lineStyle(1,0,0.125);
         _grips.graphics.moveTo(0,12);
         _grips.graphics.lineTo(100,12);
         _grips.graphics.lineStyle(1,16777215,0.55);
         _grips.graphics.moveTo(0,15);
         _grips.graphics.lineTo(100,15);
         _grips.graphics.lineStyle(1,0,0.125);
         _grips.graphics.moveTo(0,16);
         _grips.graphics.lineTo(100,16);
         _titleBar.content.addChild(_grips);
         _grips.visible = false;
         _panel = new Panel(null,0,20);
         _panel.visible = !_minimized;
         super.addChild(_panel);
         _minimizeButton = new Sprite();
         var _loc1_:Graphics = _minimizeButton.graphics;
         var _loc2_:BitmapData = null;
         FlashGraphics.bitmapFill[_loc1_] = _loc2_;
         _loc1_.beginFill(0,0);
         _minimizeButton.graphics.drawRect(-10,-10,20,20);
         _loc1_ = _minimizeButton.graphics;
         _loc2_ = null;
         FlashGraphics.bitmapFill[_loc1_] = _loc2_;
         _loc1_.endFill();
         _loc1_ = _minimizeButton.graphics;
         _loc2_ = null;
         FlashGraphics.bitmapFill[_loc1_] = _loc2_;
         _loc1_.beginFill(0,0.35);
         _minimizeButton.graphics.moveTo(-5,-3);
         _minimizeButton.graphics.lineTo(5,-3);
         _minimizeButton.graphics.lineTo(0,4);
         _minimizeButton.graphics.lineTo(-5,-3);
         _loc1_ = _minimizeButton.graphics;
         _loc2_ = null;
         FlashGraphics.bitmapFill[_loc1_] = _loc2_;
         _loc1_.endFill();
         _minimizeButton.x = 10;
         _minimizeButton.y = 10;
         _minimizeButton.useHandCursor = true;
         _minimizeButton.buttonMode = true;
         _minimizeButton.addEventListener(MouseEvent.CLICK,onMinimize);
         _closeButton = new PushButton(null,86,6,"",onClose);
         _closeButton.setSize(8,8);
         filters = [getShadow(4,false)];
      }
      
      override public function addChild(param1:DisplayObject) : DisplayObject
      {
         get_content().addChild(param1);
         return param1;
      }
   }
}

