package com.bit101.components
{
   public class Style
   {
      
      public static var _textBackground:uint = 16777215;
      
      public static var _background:uint = 13421772;
      
      public static var _buttonFace:uint = 16777215;
      
      public static var _buttonDown:uint = 15658734;
      
      public static var _inputText:uint = 3355443;
      
      public static var _labelText:uint = 6710886;
      
      public static var _dropShadow:uint = 0;
      
      public static var _panel:uint = 15987699;
      
      public static var _progressBar:uint = 16777215;
      
      public static var _listDefault:uint = 16777215;
      
      public static var _listAlternate:uint = 15987699;
      
      public static var _listSelected:uint = 13421772;
      
      public static var _listRollover:uint = 14540253;
      
      public static var _embedFonts:Boolean = true;
      
      public static var _fontName:String = "PF Ronda Seven, serif";
      
      public static var _fontSize:Number = 10;
      
      public static var DARK:String = "dark";
      
      public static var LIGHT:String = "light";
      
      public function Style()
      {
      }
      
      public static function set_TEXT_BACKGROUND(param1:uint) : uint
      {
         return Style._textBackground = param1;
      }
      
      public static function get_TEXT_BACKGROUND() : uint
      {
         return Style._textBackground;
      }
      
      public static function set_BACKGROUND(param1:uint) : uint
      {
         return Style._background = param1;
      }
      
      public static function get_BACKGROUND() : uint
      {
         return Style._background;
      }
      
      public static function set_BUTTON_FACE(param1:uint) : uint
      {
         return Style._buttonFace = param1;
      }
      
      public static function get_BUTTON_FACE() : uint
      {
         return Style._buttonFace;
      }
      
      public static function set_BUTTON_DOWN(param1:uint) : uint
      {
         return Style._buttonDown = param1;
      }
      
      public static function get_BUTTON_DOWN() : uint
      {
         return Style._buttonDown;
      }
      
      public static function set_INPUT_TEXT(param1:uint) : uint
      {
         return Style._inputText = param1;
      }
      
      public static function get_INPUT_TEXT() : uint
      {
         return Style._inputText;
      }
      
      public static function set_LABEL_TEXT(param1:uint) : uint
      {
         return Style._labelText = param1;
      }
      
      public static function get_LABEL_TEXT() : uint
      {
         return Style._labelText;
      }
      
      public static function set_DROPSHADOW(param1:uint) : uint
      {
         return Style._dropShadow = param1;
      }
      
      public static function get_DROPSHADOW() : uint
      {
         return Style._dropShadow;
      }
      
      public static function set_PANEL(param1:uint) : uint
      {
         return Style._panel = param1;
      }
      
      public static function get_PANEL() : uint
      {
         return Style._panel;
      }
      
      public static function set_PROGRESS_BAR(param1:uint) : uint
      {
         return Style._progressBar = param1;
      }
      
      public static function get_PROGRESS_BAR() : uint
      {
         return Style._progressBar;
      }
      
      public static function set_LIST_DEFAULT(param1:uint) : uint
      {
         return Style._listDefault = param1;
      }
      
      public static function get_LIST_DEFAULT() : uint
      {
         return Style._listDefault;
      }
      
      public static function set_LIST_ALTERNATE(param1:uint) : uint
      {
         return Style._listAlternate = param1;
      }
      
      public static function get_LIST_ALTERNATE() : uint
      {
         return Style._listAlternate;
      }
      
      public static function set_LIST_SELECTED(param1:uint) : uint
      {
         return Style._listSelected = param1;
      }
      
      public static function get_LIST_SELECTED() : uint
      {
         return Style._listSelected;
      }
      
      public static function set_LIST_ROLLOVER(param1:uint) : uint
      {
         return Style._listRollover = param1;
      }
      
      public static function get_LIST_ROLLOVER() : uint
      {
         return Style._listRollover;
      }
      
      public static function set_embedFonts(param1:Boolean) : Boolean
      {
         return Style._embedFonts = param1;
      }
      
      public static function get_embedFonts() : Boolean
      {
         return Style._embedFonts;
      }
      
      public static function set_fontName(param1:String) : String
      {
         return Style._fontName = param1;
      }
      
      public static function get_fontName() : String
      {
         return Style._fontName;
      }
      
      public static function set_fontSize(param1:Number) : Number
      {
         return Style._fontSize = param1;
      }
      
      public static function get_fontSize() : Number
      {
         return Style._fontSize;
      }
      
      public static function setStyle(param1:String) : void
      {
         if(param1 == "dark")
         {
            Style.set_BACKGROUND(4473924);
            Style.set_BUTTON_FACE(6710886);
            Style.set_BUTTON_DOWN(2236962);
            Style.set_INPUT_TEXT(12303291);
            Style.set_LABEL_TEXT(13421772);
            Style.set_PANEL(6710886);
            Style.set_PROGRESS_BAR(6710886);
            Style.set_TEXT_BACKGROUND(5592405);
            Style.set_LIST_DEFAULT(4473924);
            Style.set_LIST_ALTERNATE(3750201);
            Style.set_LIST_SELECTED(6710886);
            Style.set_LIST_ROLLOVER(7829367);
         }
         else
         {
            Style.set_BACKGROUND(13421772);
            Style.set_BUTTON_FACE(16777215);
            Style.set_BUTTON_DOWN(15658734);
            Style.set_INPUT_TEXT(3355443);
            Style.set_LABEL_TEXT(6710886);
            Style.set_PANEL(15987699);
            Style.set_PROGRESS_BAR(16777215);
            Style.set_TEXT_BACKGROUND(16777215);
            Style.set_LIST_DEFAULT(16777215);
            Style.set_LIST_ALTERNATE(15987699);
            Style.set_LIST_SELECTED(13421772);
            Style.set_LIST_ROLLOVER(14540253);
         }
      }
   }
}

