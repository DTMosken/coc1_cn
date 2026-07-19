package com.bit101.components
{
   import flash.Boot;
   import flash.display.DisplayObjectContainer;
   import flash.events.Event;
   import flash.events.KeyboardEvent;
   import flash.text.TextField;
   import flash.text.TextFormat;
   
   public class SearchBar extends TextWithHint
   {
      
      public static var init__:Boolean;
      
      public static var TEXT_FORMAT:TextFormat;
      
      public static var HINT_FORMAT:TextFormat;
      
      public var _search:Function;
      
      public function SearchBar(param1:DisplayObjectContainer = undefined, param2:Number = 693, param3:Number = 28, param4:String = undefined, param5:String = undefined)
      {
         if(param4 == null)
         {
            param4 = "";
         }
         if(param5 == null)
         {
            param5 = "搜索";
         }
         if(Boot.skip_constructor)
         {
            return;
         }
         super(param1,param2,param3,param4,param5);
         setSize(270,24);
      }
      
      public function set_searchFunction(param1:Function) : Function
      {
         return _search = param1;
      }
      
      override public function onChange(param1:Event) : void
      {
         super.onChange(param1);
         if(_search != null)
         {
            _search(param1);
         }
      }
      
      override public function addChildren() : void
      {
         super.addChildren();
         _format = SearchBar.TEXT_FORMAT;
         _hintFormat = SearchBar.HINT_FORMAT;
         _tf.defaultTextFormat = _format;
         _hint.defaultTextFormat = _hintFormat;
         _tf.embedFonts = false;
         _hint.embedFonts = false;
         _tf.multiline = false;
         _hint.multiline = false;
         get_textField().addEventListener(KeyboardEvent.KEY_DOWN,function(param1:KeyboardEvent):void
         {
            param1.stopPropagation();
         },false,1);
      }
   }
}

