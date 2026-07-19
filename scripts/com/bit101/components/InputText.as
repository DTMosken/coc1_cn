package com.bit101.components
{
   import flash.Boot;
   import flash.display.BitmapData;
   import flash.display.DisplayObjectContainer;
   import flash.display.Graphics;
   import flash.display.Sprite;
   import flash.events.Event;
   import flash.filters.DropShadowFilter;
   import flash.text.TextField;
   import flash.text.TextFormat;
   import openfl.display._internal.FlashGraphics;
   
   public class InputText extends Component
   {
      
      public var _tf:TextField;
      
      public var _text:String;
      
      public var _password:Boolean;
      
      public var _back:Sprite;
      
      public function InputText(param1:DisplayObjectContainer = undefined, param2:Number = 0, param3:Number = 0, param4:String = undefined, param5:Object = undefined)
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
         _password = false;
         set_text(param4);
         super(param1,param2,param3);
         if(param5 != null)
         {
            addEventListener(Event.CHANGE,param5);
         }
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
      
      public function set_restrict(param1:String) : String
      {
         return _tf.restrict = param1;
      }
      
      public function set_password(param1:Boolean) : Boolean
      {
         _password = param1;
         setInvalidated();
         return param1;
      }
      
      public function set_maxChars(param1:int) : int
      {
         return _tf.maxChars = param1;
      }
      
      override public function set_enabled(param1:Boolean) : Boolean
      {
         super.set_enabled(param1);
         return _tf.tabEnabled = param1;
      }
      
      public function onChange(param1:Event) : void
      {
         _text = _tf.text;
         param1.stopImmediatePropagation();
         dispatchEvent(param1);
      }
      
      override public function init() : void
      {
         super.init();
         setSize(100,16);
      }
      
      public function get_textField() : TextField
      {
         return _tf;
      }
      
      public function get_text() : String
      {
         return _text;
      }
      
      public function get_restrict() : String
      {
         return _tf.restrict;
      }
      
      public function get_password() : Boolean
      {
         return _password;
      }
      
      public function get_maxChars() : int
      {
         return _tf.maxChars;
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
         _tf.displayAsPassword = _password;
         if(_text != null)
         {
            _tf.text = _text;
         }
         else
         {
            _tf.text = "";
         }
         _tf.width = _width - 4;
         if(_tf.text == "")
         {
            _tf.text = "X";
            _tf.height = Math.min(_tf.textHeight + 4,_height);
            _tf.text = "";
         }
         else
         {
            _tf.height = Math.min(_tf.textHeight + 4,_height);
         }
         _tf.x = 2;
         _tf.y = Math.round(_height / 2 - _tf.height / 2);
      }
      
      override public function addChildren() : void
      {
         _back = new Sprite();
         _back.filters = [getShadow(2,true)];
         addChild(_back);
         _tf = new TextField();
         _tf.embedFonts = Style.get_embedFonts();
         _tf.selectable = true;
         _tf.type = "input";
         _tf.defaultTextFormat = new TextFormat(Style.get_fontName(),int(Style.get_fontSize()),Style.get_INPUT_TEXT());
         addChild(_tf);
         _tf.addEventListener(Event.CHANGE,onChange);
      }
   }
}

