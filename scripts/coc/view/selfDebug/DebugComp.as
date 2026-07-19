package coc.view.selfDebug
{
   import com.bit101.components.HBox;
   import flash.Boot;
   import flash.display.BitmapData;
   import flash.display.DisplayObject;
   import flash.display.Graphics;
   import flash.events.Event;
   import flash.text.TextField;
   import openfl.display._internal.FlashGraphics;
   
   public class DebugComp
   {
      
      public static var init__:Boolean;
      
      public static var UPDATED:String;
      
      public var nameLabel:TextField;
      
      public var name:String;
      
      public var hintLabel:TextField;
      
      public var hint:String;
      
      public var hbox:HBox;
      
      public var comp:Component;
      
      public function DebugComp(param1:String = undefined, param2:String = undefined, param3:Component = undefined)
      {
         if(Boot.skip_constructor)
         {
            return;
         }
         name = param1;
         var _loc4_:String = param2;
         hint = _loc4_ != null ? _loc4_ : "";
         comp = param3;
         hbox = new HBox();
         hbox.set_padding(4);
         nameLabel = new TextField();
         nameLabel.autoSize = "left";
         nameLabel.text = name;
         hintLabel = new TextField();
         hintLabel.autoSize = "left";
         hintLabel.text = hint;
         hintLabel.wordWrap = true;
         hbox.addChild(nameLabel);
         hbox.addChild(param3.displayObject());
         hbox.addChild(hintLabel);
         hbox.addEventListener(Event.RESIZE,draw);
      }
      
      public function draw(param1:Event) : void
      {
         hbox.graphics.clear();
         var _loc2_:Graphics = hbox.graphics;
         var _loc3_:BitmapData = null;
         FlashGraphics.bitmapFill[_loc2_] = _loc3_;
         _loc2_.beginFill(7557418,0.25);
         hbox.graphics.drawRoundRect(2,0,hbox.get_width() - 4,hbox.get_height(),6,6);
         _loc2_ = hbox.graphics;
         _loc3_ = null;
         FlashGraphics.bitmapFill[_loc2_] = _loc3_;
         _loc2_.endFill();
      }
      
      public function displayObject() : HBox
      {
         return hbox;
      }
   }
}

