package com.bit101.components
{
   import flash.Boot;
   import flash.display.DisplayObjectContainer;
   import flash.events.Event;
   import flash.events.MouseEvent;
   import flash.text.TextField;
   
   public class TextFieldVScroll extends VScrollBar
   {
      
      public var scrollTarget:TextField;
      
      public function TextFieldVScroll(param1:TextField = undefined, param2:DisplayObjectContainer = undefined, param3:Number = 0, param4:Number = 0)
      {
         if(Boot.skip_constructor)
         {
            return;
         }
         scrollTarget = param1;
         super(param2,param3,param4,onScrollbarScroll);
         set_autoHide(true);
      }
      
      public function updateScrollbar() : void
      {
         var _loc1_:int = scrollTarget.numLines - scrollTarget.maxScrollV + 1;
         var _loc2_:Number = _loc1_ / scrollTarget.numLines;
         var _loc3_:Number = get_value();
         var _loc4_:Number = scrollTarget.scrollV;
         if(Math.round(_loc3_) == _loc4_)
         {
            _loc4_ = _loc3_;
         }
         setSliderParams(1,scrollTarget.maxScrollV,_loc4_);
         _scrollSlider.setThumbPercent(_loc2_);
         _scrollSlider.set_pageSize(_loc1_);
      }
      
      override public function set_enabled(param1:Boolean) : Boolean
      {
         super.set_enabled(param1);
         return scrollTarget.tabEnabled = param1;
      }
      
      public function onTextScroll(param1:Event) : void
      {
         set_value(scrollTarget.scrollV);
      }
      
      public function onScrollbarScroll(param1:Event) : void
      {
         scrollTarget.scrollV = int(Math.round(get_value()));
      }
      
      public function onMouseWheel(param1:MouseEvent) : void
      {
         set_value(get_value() - param1.delta);
         scrollTarget.scrollV = int(Math.round(get_value()));
      }
      
      override public function init() : void
      {
         super.init();
         addEventListener(MouseEvent.MOUSE_WHEEL,onMouseWheel);
         scrollTarget.addEventListener(Event.SCROLL,onTextScroll);
         var _loc1_:TextField = scrollTarget;
         _loc1_.width -= get_width();
         set_height(scrollTarget.height);
      }
      
      override public function draw() : void
      {
         updateScrollbar();
         super.draw();
         set_x(scrollTarget.x + scrollTarget.width + 10);
      }
   }
}

