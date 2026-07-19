package com.bit101.components
{
   import flash.Boot;
   import flash.display.BitmapData;
   import flash.display.DisplayObjectContainer;
   import flash.display.Graphics;
   import flash.display.Sprite;
   import flash.display.Stage;
   import flash.events.Event;
   import flash.filters.DropShadowFilter;
   import flash.text.Font;
   import openfl.display._internal.FlashGraphics;
   import openfl.utils.Assets;
   
   [Event(name="resize",type="flash.events.Event")]
   [Event(name="draw",type="flash.events.Event")]
   public class Component extends Sprite
   {
      
      public static var DRAW:String = "draw";
      
      public static var _fontRegistered:Boolean = false;
      
      public var _width:Number;
      
      public var _tag:int;
      
      public var _height:Number;
      
      public var _enabled:Boolean;
      
      public function Component(param1:DisplayObjectContainer = undefined, param2:Number = 0, param3:Number = 0)
      {
         var _loc5_:* = null as Font;
         var _loc6_:* = null;
         var _loc7_:* = null;
         if(Boot.skip_constructor)
         {
            return;
         }
         _enabled = true;
         _tag = -1;
         _height = 0;
         _width = 0;
         if(!Component._fontRegistered)
         {
            _loc5_ = Assets.getFont("res/fonts/pf_ronda_seven.ttf");
            _loc6_ = _loc5_;
            try
            {
               if(Std.isOfType(_loc6_,Class))
               {
                  Font.registerFont(_loc6_);
               }
               else
               {
                  Font.registerFont(Type.getClass(_loc6_));
               }
            }
            catch(_loc_e_:*)
            {
               Component._fontRegistered = true;
               Style.set_fontName(_loc5_.fontName);
            }
         }
         super();
         move(param2,param3);
         init();
         if(param1 != null)
         {
            param1.addChild(this);
         }
      }
      
      public static function initStage(param1:Stage) : void
      {
         param1.align = "TL";
         param1.scaleMode = "noScale";
      }
      
      public function set_y(param1:Number) : Number
      {
         super.y = Math.round(param1);
         return param1;
      }
      
      override public function set y(param1:Number) : void
      {
         set_y(param1);
      }
      
      public function set_x(param1:Number) : Number
      {
         super.x = Math.round(param1);
         return param1;
      }
      
      override public function set x(param1:Number) : void
      {
         set_x(param1);
      }
      
      public function set_width(param1:Number) : Number
      {
         _width = param1;
         setInvalidated();
         dispatchEvent(new Event(Event.RESIZE));
         return param1;
      }
      
      override public function set width(param1:Number) : void
      {
         set_width(param1);
      }
      
      public function set_tag(param1:int) : int
      {
         return _tag = param1;
      }
      
      public function set_height(param1:Number) : Number
      {
         _height = param1;
         setInvalidated();
         dispatchEvent(new Event(Event.RESIZE));
         return param1;
      }
      
      override public function set height(param1:Number) : void
      {
         set_height(param1);
      }
      
      public function set_enabled(param1:Boolean) : Boolean
      {
         _enabled = param1;
         mouseEnabled = mouseChildren = _enabled;
         tabEnabled = param1;
         alpha = _enabled ? 1 : 0.5;
         return param1;
      }
      
      public function setSize(param1:Number, param2:Number) : void
      {
         _width = param1;
         _height = param2;
         dispatchEvent(new Event(Event.RESIZE));
         setInvalidated();
      }
      
      public function setInvalidated() : void
      {
         addEventListener(Event.ENTER_FRAME,onInvalidate);
      }
      
      public function onInvalidate(param1:Event) : void
      {
         removeEventListener(Event.ENTER_FRAME,onInvalidate);
         graphics.clear();
         draw();
         forceSize();
      }
      
      public function move(param1:Number, param2:Number) : void
      {
         set_x(Math.round(param1));
         set_y(Math.round(param2));
      }
      
      public function init() : void
      {
         addChildren();
         setInvalidated();
      }
      
      public function get_width() : Number
      {
         return _width;
      }
      
      override public function get width() : Number
      {
         return get_width();
      }
      
      public function get_tag() : int
      {
         return _tag;
      }
      
      public function get_height() : Number
      {
         return _height;
      }
      
      override public function get height() : Number
      {
         return get_height();
      }
      
      public function get_enabled() : Boolean
      {
         return _enabled;
      }
      
      public function getShadow(param1:Number, param2:Boolean = false) : DropShadowFilter
      {
         return new DropShadowFilter(param1,45,Style.get_DROPSHADOW(),1,param1,param1,0.3,1,param2);
      }
      
      public function forceSize() : void
      {
         var _loc1_:Graphics = graphics;
         var _loc2_:BitmapData = null;
         FlashGraphics.bitmapFill[_loc1_] = _loc2_;
         _loc1_.beginFill(0,0);
         graphics.drawRect(0,0,get_width(),get_height());
      }
      
      public function draw() : void
      {
         dispatchEvent(new Event("draw"));
      }
      
      public function addChildren() : void
      {
      }
   }
}

