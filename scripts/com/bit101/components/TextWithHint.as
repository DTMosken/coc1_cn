package com.bit101.components
{
   import flash.Boot;
   import flash.display.DisplayObjectContainer;
   import flash.events.Event;
   import flash.text.TextField;
   import flash.text.TextFormat;
   
   public class TextWithHint extends Text
   {
      
      public var _hintText:String;
      
      public var _hintHTML:Boolean;
      
      public var _hintFormat:TextFormat;
      
      public var _hint:TextField;
      
      public function TextWithHint(param1:DisplayObjectContainer = undefined, param2:Number = 0, param3:Number = 0, param4:String = undefined, param5:String = undefined)
      {
         if(param4 == null)
         {
            param4 = "";
         }
         if(param5 == null)
         {
            param5 = "";
         }
         if(Boot.skip_constructor)
         {
            return;
         }
         _hintHTML = false;
         _hintText = "";
         super(param1,param2,param3,param4);
         _hintText = param5;
      }
      
      public function set_hinthtml(param1:Boolean) : Boolean
      {
         _hintHTML = param1;
         setInvalidated();
         return param1;
      }
      
      public function set_hintFormat(param1:TextFormat) : TextFormat
      {
         return _hintFormat = param1;
      }
      
      public function set_hint(param1:String) : String
      {
         _hintText = param1;
         if(_hintText == null)
         {
            _hintText = "";
         }
         setInvalidated();
         return param1;
      }
      
      override public function onChange(param1:Event) : void
      {
         super.onChange(param1);
         _hint.visible = _text == "";
      }
      
      public function get_hinthtml() : Boolean
      {
         return _hintHTML;
      }
      
      public function get_hintFormat() : TextFormat
      {
         return _hintFormat;
      }
      
      public function get_hintField() : TextField
      {
         return _hint;
      }
      
      public function get_hint() : String
      {
         return _hintText;
      }
      
      override public function draw() : void
      {
         super.draw();
         _hint.x = _tf.x;
         _hint.y = _tf.y;
         _hint.width = _tf.width;
         _hint.height = _tf.height;
         if(_hintHTML)
         {
            _hint.htmlText = _hintText;
         }
         else
         {
            _hint.text = _hintText;
         }
         _hint.setTextFormat(_hintFormat);
         _hint.visible = _text == "";
      }
      
      override public function addChildren() : void
      {
         super.addChildren();
         _hint = new TextField();
         _hint.x = 2;
         _hint.y = 2;
         _hint.height = _height;
         _hint.embedFonts = Style.get_embedFonts();
         _hint.multiline = true;
         _hint.wordWrap = true;
         _hint.selectable = false;
         _hint.type = "dynamic";
         _hint.defaultTextFormat = _format;
         _hint.visible = false;
         addChildAt(_hint,getChildIndex(_tf));
      }
   }
}

