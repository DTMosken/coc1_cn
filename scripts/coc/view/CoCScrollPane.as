package coc.view
{
   import classes.internals.Utils;
   import com.bit101.components.ScrollPane;
   import com.bit101.components.VScrollBar;
   import flash.Boot;
   import flash.display.DisplayObjectContainer;
   import flash.events.MouseEvent;
   
   public class CoCScrollPane extends ScrollPane
   {
      
      public function CoCScrollPane(param1:DisplayObjectContainer = undefined, param2:Number = 0, param3:Number = 0)
      {
         if(Boot.skip_constructor)
         {
            return;
         }
         super(param1,param2,param3);
         _background.alpha = 0;
         addEventListener(MouseEvent.MOUSE_WHEEL,mouseWheelHandler);
      }
      
      public function resetScroll() : void
      {
         _vScrollbar.set_value(0);
         _hScrollbar.set_value(0);
         content.x = 0;
         content.y = 0;
      }
      
      public function mouseWheelHandler(param1:MouseEvent) : void
      {
         var _loc2_:VScrollBar = _vScrollbar;
         _loc2_.set_value(_loc2_.get_value() - Utils.boundInt(-16,param1.delta * 8,16));
         update();
      }
   }
}

