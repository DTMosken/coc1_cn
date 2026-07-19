package coc.view
{
   import coc.view.mobile.ScreenScaling;
   import flash.Boot;
   import flash.display.Bitmap;
   import flash.display.DisplayObject;
   import flash.display.Sprite;
   import flash.geom.Point;
   import flash.geom.Rectangle;
   import flash.text.TextField;
   
   public class ToolTipView extends Block implements ThemeObserver
   {
      
      public static var MIN_HEIGHT:Number = 239;
      
      public static var WIDTH:Number = 350;
      
      public var tf:TextField;
      
      public var mainView:Sprite;
      
      public var ln:Sprite;
      
      public var hd:TextField;
      
      public var bg:BitmapDataSprite;
      
      public function ToolTipView(param1:Sprite = undefined)
      {
         if(Boot.skip_constructor)
         {
            return;
         }
         super();
         mainView = param1;
         bg = addBitmapDataSprite(new BitmapDataSprite(null,TooltipBg,true,0,0,240,350,false,"",0,false,1,true));
         ln = addBitmapDataSprite(new BitmapDataSprite(null,null,false,15,40,1,320,false,"",0,false,1,true));
         hd = addTextField(new TextFieldParameters(null,null,null,true,316,25.35,15,15,new DefaultTextFormatParameters(CoCButton.bUTTON_LABEL_FONT_NAME,18,Theme.current.get_tooltipTextColor(),null,null,null,null,null,null,null,null,null,null),null,false,true,null,null,null,null,null));
         tf = addTextField(new TextFieldParameters(null,null,null,null,316,null,15,40,new DefaultTextFormatParameters("Alibaba PuHuiTi 3 95 ExtraBold",15,Theme.current.get_tooltipTextColor(),null,null,null,null,null,null,null,null,null,null),null,true,true,null,null,null,null,null));
         tf.autoSize = "left";
         Theme.subscribe(this);
      }
      
      public function update(param1:String) : void
      {
         bg.set_bitmap(Theme.current.get_tooltipBg());
         hd.textColor = Theme.current.get_tooltipTextColor();
         tf.textColor = Theme.current.get_tooltipTextColor();
      }
      
      public function showInBounds(param1:Rectangle, param2:DisplayObject) : void
      {
         var _loc3_:Point = param2.parent.localToGlobal(new Point(param2.x,param2.y));
         var _loc4_:Point = parent.globalToLocal(_loc3_);
         bg.set_height(Math.max(tf.height + 63,239));
         var _loc5_:String = ScreenScaling.get_orientation();
         while(true)
         {
            if(_loc5_ != "rotatedLeft")
            {
               if(_loc5_ != "rotatedRight")
               {
                  x = Math.max(_loc4_.x,param1.x);
                  x = Math.min(x,param1.width - get_width());
                  if(_loc4_.y + param2.height < param1.height / 2)
                  {
                     y = _loc4_.y + param2.height;
                     break;
                  }
                  y = _loc4_.y - get_height();
                  break;
               }
            }
            y = Math.max(_loc4_.y,param1.y);
            y = Math.min(y,param1.height - get_height());
            if(_loc4_.x + param2.width < param1.width / 2)
            {
               x = _loc4_.x + param2.width;
            }
            else
            {
               x = _loc4_.x - get_width();
            }
            break;
         }
         visible = true;
      }
      
      public function showForMonster(param1:DisplayObject) : void
      {
         var _loc2_:Number = param1.x;
         var _loc3_:Number = param1.y;
         x = _loc2_ + 450;
         y = _loc3_ + 50;
         visible = true;
      }
      
      public function showForElement(param1:DisplayObject, param2:int = 0, param3:int = 0) : void
      {
         var _loc4_:Point = param1.getRect(parent).topLeft;
         show(_loc4_.x + param2,_loc4_.y + param3,param1.width,param1.height);
      }
      
      public function show(param1:Number, param2:Number, param3:Number, param4:Number) : void
      {
         x = param1;
         if(x < 0)
         {
            x = 0;
         }
         else if(x + get_width() > mainView.width)
         {
            x = mainView.width - get_width();
         }
         bg.set_height(Math.max(tf.height + 63,239));
         if(param2 + param4 < mainView.height / 2)
         {
            y = param2 + param4 + 1;
         }
         else
         {
            y = param2 - get_height();
         }
         visible = true;
      }
      
      public function set_text(param1:String) : String
      {
         tf.htmlText = param1 != null ? param1 : "";
         bg.set_height(239);
         tf.height = 176;
         return param1;
      }
      
      public function set_header(param1:String) : String
      {
         hd.htmlText = param1 != null ? param1 : "";
         return param1;
      }
      
      public function hide() : void
      {
         visible = false;
      }
      
      public function get_text() : String
      {
         return tf.htmlText;
      }
      
      public function get_header() : String
      {
         return hd.htmlText;
      }
   }
}

