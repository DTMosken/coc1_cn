package com.bit101.components
{
   import flash.Boot;
   import flash.display.DisplayObjectContainer;
   import flash.events.Event;
   import flash.text.TextField;
   import flash.text.TextFormat;
   
   [Event(name="resize",type="flash.events.Event")]
   public class Label extends Component
   {
      
      public var _tf:TextField;
      
      public var _text:String;
      
      public var _autoSize:Boolean;
      
      public function Label(param1:DisplayObjectContainer = undefined, param2:Number = 0, param3:Number = 0, param4:String = undefined)
      {
         if(param4 == null)
         {
            param4 = "";
         }
         if(Boot.skip_constructor)
         {
            return;
         }
         _text = "";
         _autoSize = true;
         set_text(param4);
         super(param1,param2,param3);
      }
      
      public function set_text(param1:String) : String
      {
         _text = param1;
         if(_text == null)
         {
            _text = "";
         }
         setInvalidated();
         return param1;
      }
      
      public function set_autoSize(param1:Boolean) : Boolean
      {
         return _autoSize = param1;
      }
      
      override public function init() : void
      {
         super.init();
         mouseEnabled = false;
         mouseChildren = false;
      }
      
      public function get_textField() : TextField
      {
         return _tf;
      }
      
      public function get_text() : String
      {
         return _text;
      }
      
      public function get_autoSize() : Boolean
      {
         return _autoSize;
      }
      
      override public function draw() : void
      {
         super.draw();
         _tf.text = _text;
         if(_autoSize)
         {
            _tf.autoSize = "left";
            _width = _tf.width;
            dispatchEvent(new Event(Event.RESIZE));
         }
         else
         {
            _tf.autoSize = "none";
            _tf.width = _width;
         }
         _height = _tf.height = 18;
      }
      
      override public function addChildren() : void
      {
         _height = 18;
         _tf = new TextField();
         _tf.height = _height;
         _tf.embedFonts = Style.get_embedFonts();
         _tf.selectable = false;
         _tf.mouseEnabled = false;
         _tf.defaultTextFormat = new TextFormat(Style.get_fontName(),Style.get_fontSize(),Style.get_LABEL_TEXT());
         _tf.text = _text;
         addChild(_tf);
         draw();
      }
   }
}

