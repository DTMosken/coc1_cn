package com.bit101.components
{
   import flash.Boot;
   import flash.display.DisplayObjectContainer;
   import flash.events.Event;
   import flash.text.TextField;
   import flash.text.TextFormat;
   
   [Event(name="change",type="flash.events.Event")]
   public class Text extends Component
   {
      
      public var _tf:TextField;
      
      public var _text:String;
      
      public var _selectable:Boolean;
      
      public var _panel:Panel;
      
      public var _html:Boolean;
      
      public var _format:TextFormat;
      
      public var _editable:Boolean;
      
      public function Text(param1:DisplayObjectContainer = undefined, param2:Number = 0, param3:Number = 0, param4:String = undefined)
      {
         if(param4 == null)
         {
            param4 = "";
         }
         if(Boot.skip_constructor)
         {
            return;
         }
         _html = false;
         _selectable = true;
         _editable = true;
         _text = "";
         set_text(param4);
         super(param1,param2,param3);
         setSize(200,100);
      }
      
      public function set_textFormat(param1:TextFormat) : TextFormat
      {
         return _format = param1;
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
      
      public function set_selectable(param1:Boolean) : Boolean
      {
         _selectable = param1;
         setInvalidated();
         return param1;
      }
      
      public function set_html(param1:Boolean) : Boolean
      {
         _html = param1;
         setInvalidated();
         return param1;
      }
      
      override public function set_enabled(param1:Boolean) : Boolean
      {
         super.set_enabled(param1);
         return _tf.tabEnabled = param1;
      }
      
      public function set_editable(param1:Boolean) : Boolean
      {
         _editable = param1;
         setInvalidated();
         return param1;
      }
      
      public function onChange(param1:Event) : void
      {
         _text = _tf.text;
         dispatchEvent(param1);
      }
      
      override public function init() : void
      {
         super.init();
      }
      
      public function get_textFormat() : TextFormat
      {
         return _format;
      }
      
      public function get_textField() : TextField
      {
         return _tf;
      }
      
      public function get_text() : String
      {
         return _text;
      }
      
      public function get_selectable() : Boolean
      {
         return _selectable;
      }
      
      public function get_html() : Boolean
      {
         return _html;
      }
      
      public function get_editable() : Boolean
      {
         return _editable;
      }
      
      override public function draw() : void
      {
         super.draw();
         _panel.setSize(_width,_height);
         _panel.draw();
         _tf.width = _width - 4;
         _tf.height = _height - 4;
         if(_html)
         {
            _tf.htmlText = _text;
         }
         else
         {
            _tf.text = _text;
         }
         if(_editable)
         {
            _tf.mouseEnabled = true;
            _tf.selectable = true;
            _tf.type = "input";
         }
         else
         {
            _tf.mouseEnabled = _selectable;
            _tf.selectable = _selectable;
            _tf.type = "dynamic";
         }
         _tf.setTextFormat(_format);
      }
      
      override public function addChildren() : void
      {
         _panel = new Panel(this);
         _panel.set_color(Style.get_TEXT_BACKGROUND());
         _format = new TextFormat(Style.get_fontName(),Style.get_fontSize(),Style.get_LABEL_TEXT());
         _tf = new TextField();
         _tf.x = 2;
         _tf.y = 2;
         _tf.height = _height;
         _tf.embedFonts = Style.get_embedFonts();
         _tf.multiline = true;
         _tf.wordWrap = true;
         _tf.selectable = true;
         _tf.type = "input";
         _tf.defaultTextFormat = _format;
         _tf.addEventListener(Event.CHANGE,onChange);
         addChild(_tf);
      }
   }
}

