package coc.view
{
   import classes.globalFlags.KGAMECLASS;
   import com.bit101.components.TextFieldVScroll;
   import flash.Boot;
   import flash.display.Bitmap;
   import flash.display.BitmapData;
   import flash.display.Graphics;
   import flash.display.Shape;
   import flash.text.TextField;
   import flash.text.TextFormat;
   import openfl.display._internal.FlashGraphics;
   
   public class MinimapView extends Block implements ThemeObserver
   {
      
      public static var scale:Number = 0.8;
      
      public var sideBarBG:BitmapDataSprite;
      
      public var scrollBarMap:TextFieldVScroll;
      
      public var scrollBar:TextFieldVScroll;
      
      public var minidungeonMap:Block;
      
      public var mapView:TextField;
      
      public function MinimapView(param1:MainView = undefined)
      {
         if(Boot.skip_constructor)
         {
            return;
         }
         super(new LayoutConfig(LayoutType.Flow(FlowDirection.Column,1),true,4,null,null,null,null,null));
         x = 0;
         y = 653;
         set_width(205);
         set_height(175);
         sideBarBG = addBitmapDataSprite(new BitmapDataSprite(null,MinimapBG,true,0,0,147,205,false,"",0,false,1,true),new LayoutHint(true,null,null,null,null,null,null));
         mapView = addTextField(new TextFieldParameters(null,null,null,null,205,150,100,625,new DefaultTextFormatParameters(null,15,null,null,null,null,null,null,null,null,null,null,null),null,true,true,true,null,null,null,null));
         scrollBarMap = new TextFieldVScroll(mapView);
         scrollBarMap.name = "scrollBarMap";
         scrollBarMap.set_x(mapView.x + mapView.width);
         scrollBarMap.set_y(mapView.y);
         scrollBarMap.set_height(mapView.height);
         scrollBarMap.set_width(5);
         addElement(scrollBarMap);
         minidungeonMap = new Block(new LayoutConfig(null,null,4,null,null,null,null,null),0,25,205,125,"");
         minidungeonMap.scaleX = 0.8;
         minidungeonMap.scaleY = 0.8;
         addElement(minidungeonMap);
         var _loc2_:Shape = new Shape();
         _loc2_.graphics.lineStyle(1,0);
         var _loc3_:Graphics = _loc2_.graphics;
         var _loc4_:BitmapData = null;
         FlashGraphics.bitmapFill[_loc3_] = _loc4_;
         _loc3_.beginFill(16711680,1);
         _loc2_.graphics.drawRect(25,25,155,120);
         _loc3_ = _loc2_.graphics;
         _loc4_ = null;
         FlashGraphics.bitmapFill[_loc3_] = _loc4_;
         _loc3_.endFill();
         addChild(_loc2_);
         minidungeonMap.mask = _loc2_;
         Theme.subscribe(this);
      }
      
      public function update(param1:String) : void
      {
         setTheme();
      }
      
      public function show() : void
      {
         visible = true;
         alpha = 1;
      }
      
      public function setTheme() : void
      {
         mapView.textColor = Theme.current.get_minimapTextColor();
         sideBarBG.set_bitmap(Theme.current.get_minimapBg());
      }
      
      public function refreshIconMinimap() : void
      {
         KGAMECLASS.kGAMECLASS.dungeons.map.redraw(minidungeonMap);
         mapView.htmlText = KGAMECLASS.kGAMECLASS.dungeons.map.chooseRoomToDisplay();
         minidungeonMap.visible = true;
         minidungeonMap.x = get_width() / 2 - 16 - KGAMECLASS.kGAMECLASS.dungeons.map.px * 0.8;
         minidungeonMap.y = get_height() / 2 - 16 - KGAMECLASS.kGAMECLASS.dungeons.map.py * 0.8;
         minidungeonMap.scaleX = minidungeonMap.scaleY = 0.8;
      }
      
      public function refreshHtmlText() : void
      {
         var _loc1_:TextFormat = mapView.getTextFormat();
         while(mapView.width < mapView.textWidth)
         {
            _loc1_.size = mapView.getTextFormat().size - 1;
            mapView.setTextFormat(_loc1_);
         }
         if(mapView.width > mapView.textWidth)
         {
            mapView.x = (mapView.width - mapView.textWidth) / 2;
         }
         scrollBarMap.draw();
      }
      
      public function hide() : void
      {
         visible = false;
      }
   }
}

