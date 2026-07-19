package coc.view.mobile
{
   import com.bit101.components.Component;
   import flash.Boot;
   import flash.display.BitmapData;
   import flash.display.Graphics;
   import flash.display.Sprite;
   import flash.events.MouseEvent;
   import flash.geom.Point;
   import flash.geom.Rectangle;
   import openfl.display._internal.FlashGraphics;
   
   public class Drawers extends Component
   {
      
      public static var LEFT:String = "LEFT";
      
      public static var UP:String = "UP";
      
      public static var RIGHT:String = "RIGHT";
      
      public static var CONTENT:String = "CONTENT";
      
      public var _touched:Sprite;
      
      public var _topDrawerContent:Sprite;
      
      public var _topDrawer:Component;
      
      public var _rightDrawerContent:Sprite;
      
      public var _rightDrawer:Component;
      
      public var _overlay:Sprite;
      
      public var _leftDrawerContent:Sprite;
      
      public var _leftDrawer:Component;
      
      public var _drawerOpen:Boolean;
      
      public var _content:Component;
      
      public function Drawers()
      {
         if(Boot.skip_constructor)
         {
            return;
         }
         _drawerOpen = false;
         super();
         addEventListener(MouseEvent.MOUSE_DOWN,onTouch);
         addEventListener(MouseEvent.MOUSE_MOVE,onTouchMove);
         addEventListener(MouseEvent.MOUSE_UP,onTouchEnd);
      }
      
      public function tryOpenTop() : Boolean
      {
         if(_topDrawer.y >= -(_topDrawer.get_height() / 2))
         {
            _topDrawer.set_y(0);
            return true;
         }
         _topDrawer.set_y(-_topDrawer.get_height());
         return false;
      }
      
      public function tryOpenRight() : Boolean
      {
         if(_rightDrawer.x <= get_width() - _rightDrawer.get_width() / 2)
         {
            _rightDrawer.set_x(get_width() - _rightDrawer.get_width());
            return true;
         }
         _rightDrawer.set_x(get_width());
         return false;
      }
      
      public function tryOpenLeft() : Boolean
      {
         if(_leftDrawer.x >= -(_leftDrawer.get_width() / 2))
         {
            _leftDrawer.set_x(0);
            return true;
         }
         _leftDrawer.set_x(-_leftDrawer.get_width());
         return false;
      }
      
      override public function setSize(param1:Number, param2:Number) : void
      {
         super.setSize(param1,param2);
         resizeLeft();
         resizeTop();
         resizeRight();
         resizeContent();
         closeDrawers();
         resizeOverlay();
      }
      
      public function resizeTop() : void
      {
         if(_topDrawerContent != null)
         {
            _topDrawerContent.height = 200;
            _topDrawer.setSize(MobileUI.BUTTONS_WIDTH_PORTRAIT - 30,_topDrawerContent.height);
            _topDrawerContent.width = _topDrawer.get_width();
         }
         _topDrawer.move(get_width() / 2 - _topDrawer.get_width() / 2,-_topDrawer.get_height());
      }
      
      public function resizeRight() : void
      {
         _rightDrawer.setSize(MobileUI.BUTTONS_WIDTH_PORTRAIT * 0.7,get_height());
         _rightDrawer.move(get_width(),0);
         if(_rightDrawerContent != null)
         {
            _rightDrawerContent.width = _rightDrawer.get_width();
            _rightDrawerContent.height = _rightDrawer.get_height();
         }
      }
      
      public function resizeOverlay() : void
      {
         var _loc1_:int = int(-ScreenScaling.safeBounds().x);
         var _loc2_:int = int(-ScreenScaling.safeBounds().y);
         _overlay.x = _loc1_;
         _overlay.y = _loc2_;
      }
      
      public function resizeLeft() : void
      {
         _leftDrawer.setSize(MobileUI.BUTTONS_WIDTH_PORTRAIT * 0.7,get_height());
         _leftDrawer.move(-_leftDrawer.get_width(),0);
         if(_leftDrawerContent != null)
         {
            _leftDrawerContent.width = _leftDrawer.get_width();
            _leftDrawerContent.height = _leftDrawer.get_height();
         }
      }
      
      public function resizeContent() : void
      {
         _content.setSize(get_width(),get_height());
         _content.move(0,0);
      }
      
      public function openTop(param1:MouseEvent = undefined) : void
      {
         _topDrawer.set_y(0);
         _touched = _topDrawer;
         onTouchEnd(param1);
      }
      
      public function openRight(param1:MouseEvent = undefined) : void
      {
         _rightDrawer.set_x(get_width() - _rightDrawer.get_width());
         _touched = _rightDrawer;
         onTouchEnd(param1);
      }
      
      public function onTouchMove(param1:MouseEvent) : void
      {
         var _loc2_:Number = NaN;
         if(_touched != null)
         {
            _overlay.graphics.clear();
            _loc2_ = 0;
            if(_touched == _leftDrawer)
            {
               _loc2_ = (_touched.x + _touched.width) / _touched.width * 0.5;
            }
            else if(_touched == _topDrawer)
            {
               _loc2_ = (_touched.y + _touched.height) / _touched.height * 0.5;
            }
            else if(_touched == _rightDrawer)
            {
               _loc2_ = -(_touched.x - get_width()) / _touched.width * 0.5;
            }
            drawOverlay(_loc2_);
         }
      }
      
      public function onTouchEnd(param1:MouseEvent) : void
      {
         if(_touched == null)
         {
            return;
         }
         _touched.stopDrag();
         _overlay.graphics.clear();
         _drawerOpen = _touched == _leftDrawer ? tryOpenLeft() : (_touched == _topDrawer ? tryOpenTop() : _touched == _rightDrawer && tryOpenRight());
         _overlay.visible = _drawerOpen;
         _touched.visible = _drawerOpen;
         if(_drawerOpen)
         {
            drawOverlay(0.5);
         }
         _touched = null;
      }
      
      public function onTouch(param1:MouseEvent) : void
      {
         if(_drawerOpen)
         {
            return;
         }
         var _loc2_:Point = new Point(param1.stageX / scaleX,param1.stageY / scaleY);
         if(_loc2_.x <= get_width() * 0.1 && _leftDrawerContent != null && _leftDrawerContent.visible)
         {
            _touched = _leftDrawer;
         }
         else if(_loc2_.y <= get_height() * 0.1 && _topDrawerContent != null && _topDrawerContent.visible)
         {
            _touched = _topDrawer;
         }
         else if(_loc2_.x >= get_width() * 0.9 && _rightDrawerContent != null && _rightDrawerContent.visible)
         {
            _touched = _rightDrawer;
         }
         if(_touched != null)
         {
            beginDrag();
            _touched.visible = true;
            _overlay.visible = true;
         }
      }
      
      public function onDrawerTouch(param1:MouseEvent) : void
      {
         if(!_drawerOpen)
         {
            return;
         }
         var _loc2_:Object = param1.currentTarget;
         _touched = _loc2_ as Sprite;
         beginDrag();
      }
      
      public function drawOverlay(param1:Number) : void
      {
         var _loc2_:Graphics = _overlay.graphics;
         var _loc3_:BitmapData = null;
         FlashGraphics.bitmapFill[_loc2_] = _loc3_;
         _loc2_.beginFill(0,param1);
         _overlay.graphics.drawRect(0,0,ScreenScaling.get_screenWidth() / scaleX - _overlay.x,ScreenScaling.get_screenHeight() / scaleY - _overlay.y);
         _loc2_ = _overlay.graphics;
         _loc3_ = null;
         FlashGraphics.bitmapFill[_loc2_] = _loc3_;
         _loc2_.endFill();
      }
      
      public function closeDrawers(param1:MouseEvent = undefined) : void
      {
         _leftDrawer.set_x(-_leftDrawer.get_width());
         _topDrawer.set_y(-_topDrawer.get_height());
         _rightDrawer.set_x(get_width());
         _drawerOpen = false;
         _overlay.graphics.clear();
         _overlay.visible = false;
         _leftDrawer.visible = false;
         _rightDrawer.visible = false;
         _topDrawer.visible = false;
      }
      
      public function beginDrag() : void
      {
         if(_touched == _leftDrawer)
         {
            _touched.startDrag(false,new Rectangle(-_touched.width,0,_touched.width,0));
         }
         else if(_touched == _topDrawer)
         {
            _touched.startDrag(false,new Rectangle(_touched.x,-_touched.height,0,_touched.height));
         }
         else if(_touched == _rightDrawer)
         {
            _touched.startDrag(false,new Rectangle(get_width() - _touched.width,0,_touched.width,0));
         }
      }
      
      public function addElement(param1:Sprite, param2:String) : void
      {
         var _loc3_:String = param2;
         if(_loc3_ == "CONTENT")
         {
            _content.removeChildren();
            _content.addChild(param1);
            resizeContent();
         }
         else if(_loc3_ == "LEFT")
         {
            _leftDrawer.removeChildren();
            _leftDrawer.addChild(param1);
            _leftDrawerContent = param1;
            resizeLeft();
         }
         else if(_loc3_ == "RIGHT")
         {
            _rightDrawer.removeChildren();
            _rightDrawer.addChild(param1);
            _rightDrawerContent = param1;
            resizeRight();
         }
         else if(_loc3_ == "UP")
         {
            _topDrawer.removeChildren();
            _topDrawer.addChild(param1);
            _topDrawerContent = param1;
            resizeTop();
         }
      }
      
      override public function addChildren() : void
      {
         _content = new Component(this);
         _overlay = new Sprite();
         addChild(_overlay);
         _leftDrawer = new Component(this);
         _topDrawer = new Component(this);
         _rightDrawer = new Component(this);
         _leftDrawer.addEventListener(MouseEvent.MOUSE_DOWN,onDrawerTouch);
         _topDrawer.addEventListener(MouseEvent.MOUSE_DOWN,onDrawerTouch);
         _rightDrawer.addEventListener(MouseEvent.MOUSE_DOWN,onDrawerTouch);
         _overlay.addEventListener(MouseEvent.CLICK,closeDrawers);
      }
   }
}

