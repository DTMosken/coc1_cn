package coc.view
{
   import flash.Boot;
   
   public class TextFieldParameters
   {
      
      public var y:Number;
      
      public var x:Number;
      
      public var wordWrap:Boolean;
      
      public var width:Number;
      
      public var visible:Boolean;
      
      public var type:String;
      
      public var textColor:int;
      
      public var text:String;
      
      public var multiline:Boolean;
      
      public var mouseEnabled:Boolean;
      
      public var htmlText:String;
      
      public var height:Number;
      
      public var embedFonts:Boolean;
      
      public var defaultTextFormat:DefaultTextFormatParameters;
      
      public var border:Boolean;
      
      public var backgroundColor:int;
      
      public var background:Boolean;
      
      public function TextFieldParameters(param1:String = undefined, param2:String = undefined, param3:String = undefined, param4:Object = undefined, param5:Object = undefined, param6:Object = undefined, param7:Object = undefined, param8:Object = undefined, param9:DefaultTextFormatParameters = undefined, param10:Object = undefined, param11:Object = undefined, param12:Object = undefined, param13:Object = undefined, param14:Object = undefined, param15:Object = undefined, param16:Object = undefined, param17:Object = undefined)
      {
         if(Boot.skip_constructor)
         {
            return;
         }
         visible = true;
         border = false;
         backgroundColor = 0;
         background = false;
         mouseEnabled = false;
         multiline = false;
         wordWrap = false;
         textColor = 0;
         defaultTextFormat = null;
         y = 0;
         x = 0;
         height = 0;
         width = 0;
         embedFonts = false;
         type = "dynamic";
         htmlText = "";
         text = "";
         if(param1 != null)
         {
            text = param1;
         }
         if(param2 != null)
         {
            htmlText = param2;
         }
         if(param3 != null)
         {
            type = param3;
         }
         if(param4 != null)
         {
            embedFonts = param4;
         }
         if(param5 != null)
         {
            width = param5;
         }
         if(param6 != null)
         {
            height = param6;
         }
         if(param7 != null)
         {
            x = param7;
         }
         if(param8 != null)
         {
            y = param8;
         }
         if(param9 != null)
         {
            defaultTextFormat = param9;
         }
         if(param10 != null)
         {
            textColor = param10;
         }
         if(param11 != null)
         {
            wordWrap = param11;
         }
         if(param12 != null)
         {
            multiline = param12;
         }
         if(param13 != null)
         {
            mouseEnabled = param13;
         }
         if(param14 != null)
         {
            background = param14;
         }
         if(param15 != null)
         {
            backgroundColor = param15;
         }
         if(param16 != null)
         {
            border = param16;
         }
         if(param17 != null)
         {
            visible = param17;
         }
      }
   }
}

