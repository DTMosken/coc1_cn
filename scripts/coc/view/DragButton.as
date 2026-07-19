package coc.view
{
   import classes.ItemSlot;
   import classes.ItemType;
   import classes.globalFlags.KGAMECLASS;
   import flash.Boot;
   import flash.display.DisplayObject;
   import flash.display.DisplayObjectContainer;
   import flash.display.Stage;
   import flash.events.MouseEvent;
   import flash.geom.Point;
   import flash.geom.Rectangle;
   import flash.utils.Timer;
   import haxe.IMap;
   import haxe.Log;
   import motion.Actuate;
   import motion.actuators.GenericActuator;
   import motion.easing.Elastic;
   import motion.easing.Expo;
   
   public class DragButton
   {
      
      public static var init__:Boolean;
      
      public static var buttonMap:IMap;
      
      public static var _toolTip:ToolTipView;
      
      public static var _container:DisplayObjectContainer;
      
      public var _tweening:Boolean;
      
      public var _timer:Timer;
      
      public var _store:Array;
      
      public var _stage:Stage;
      
      public var _selected:Boolean;
      
      public var _parent:DisplayObjectContainer;
      
      public var _origin:Point;
      
      public var _location:int;
      
      public var _global:Point;
      
      public var _emptyText:String;
      
      public var _dragging:Boolean;
      
      public var _button:CoCButton;
      
      public var _acceptable:Function;
      
      public function DragButton(param1:Array = undefined, param2:int = 0, param3:CoCButton = undefined, param4:Function = undefined, param5:String = undefined)
      {
         var _loc6_:* = null as DragButton;
         if(Boot.skip_constructor)
         {
            return;
         }
         _tweening = false;
         _dragging = false;
         _selected = false;
         _timer = new Timer(50);
         _location = 0;
         _store = param1;
         _emptyText = param5;
         _location = param2;
         _acceptable = param4;
         _button = param3;
         _button.addEventListener(MouseEvent.MOUSE_DOWN,dragHandler);
         if(DragButton.buttonMap[param3] != null)
         {
            _loc6_ = DragButton.buttonMap[param3];
            if(_loc6_ != null)
            {
               _loc6_.dispose();
            }
            Log.trace("Two DragButtons created for the same button. Previous disposed",{
               "fileName":"src/coc/view/DragButton.hx",
               "lineNumber":53,
               "className":"coc.view.DragButton",
               "methodName":"new"
            });
         }
         DragButton.buttonMap[param3] = this;
      }
      
      public static function cleanUp() : void
      {
         var _loc2_:* = null as DragButton;
         var _loc1_:* = DragButton.buttonMap.iterator();
         while(Boolean(_loc1_.hasNext()))
         {
            _loc2_ = _loc1_.next();
            _loc2_.dispose();
         }
         DragButton.buttonMap.clear();
      }
      
      public static function setup(param1:DisplayObjectContainer, param2:ToolTipView) : void
      {
         DragButton._container = param1;
         DragButton._toolTip = param2;
      }
      
      public function swapWith(param1:DragButton) : Boolean
      {
         if(!Boolean(param1._acceptable(get_itemSlot().itype)))
         {
            return false;
         }
         if(!_acceptable(param1.get_itemSlot().itype) && param1.get_itemSlot().quantity > 0)
         {
            return false;
         }
         var _loc2_:String = param1._button.get_labelText();
         var _loc3_:String = param1._button.toolTipText;
         var _loc4_:String = param1._button.toolTipHeader;
         var _loc5_:Boolean = param1._button.enabled;
         param1._button.set_labelText(_button.get_labelText());
         param1._button.toolTipHeader = _button.toolTipHeader;
         param1._button.enable(_button.toolTipText);
         _button.set_labelText(_loc2_);
         _button.toolTipHeader = _loc4_;
         _button.toolTipText = _loc3_;
         _button.enable();
         _button.disableIf(!_loc5_);
         var _loc6_:ItemSlot = param1.get_itemSlot();
         param1.set_itemSlot(get_itemSlot());
         set_itemSlot(_loc6_);
         return true;
      }
      
      public function swap() : Boolean
      {
         var _loc1_:DisplayObject = _button.dropTarget;
         while(_loc1_ != null && !(_loc1_ is CoCButton))
         {
            _loc1_ = _loc1_.parent;
         }
         var _loc2_:CoCButton = _loc1_ as CoCButton;
         if(_loc1_ == null)
         {
            return false;
         }
         var _loc3_:DragButton = DragButton.buttonMap[_loc2_];
         if(_loc3_ != null)
         {
            return swapWith(_loc3_);
         }
         return false;
      }
      
      public function set_itemSlot(param1:ItemSlot) : ItemSlot
      {
         var _loc2_:* = null as ItemType;
         var _loc3_:int = 0;
         if(!param1.unlocked)
         {
            _loc2_ = param1.itype;
            _loc3_ = param1.quantity;
            param1.set_unlocked(true);
            param1.setItemAndQty(_loc2_,_loc3_);
         }
         _store[_location] = param1;
         if(param1.quantity <= 0)
         {
            _button.set_labelText(_emptyText);
         }
         return param1;
      }
      
      public function resetPosition() : void
      {
         _tweening = false;
         _dragging = false;
         _selected = false;
         _parent.addChild(_button);
         _button.stopDrag();
         _button.x = _origin.x;
         _button.y = _origin.y;
         _button.removeEventListener(MouseEvent.ROLL_OVER,hoverHandler);
         _button.removeEventListener(MouseEvent.ROLL_OUT,hoverHandler);
         _timer.reset();
         DragButton._container.addChild(DragButton._toolTip);
      }
      
      public function moveHandler(param1:MouseEvent) : void
      {
         param1.stopImmediatePropagation();
         if(_dragging)
         {
            if(!param1.buttonDown)
            {
               dropHandler(param1);
            }
            return;
         }
         if(!_timer.running)
         {
            _timer.start();
            return;
         }
         if(_timer.currentCount < 1)
         {
            return;
         }
         _timer.reset();
         _button.dim(param1);
         DragButton._toolTip.hide();
         _dragging = true;
         _button.addEventListener(MouseEvent.CLICK,clickHandler,false,999);
         _button.addEventListener(MouseEvent.ROLL_OVER,hoverHandler,false,999);
         _button.addEventListener(MouseEvent.ROLL_OUT,hoverHandler,false,999);
      }
      
      public function hoverHandler(param1:MouseEvent) : void
      {
         param1.stopImmediatePropagation();
      }
      
      public function get_itemSlot() : ItemSlot
      {
         return _store[_location];
      }
      
      public function dropHandler(param1:MouseEvent) : void
      {
         _dragging = false;
         _tweening = true;
         _stage.removeEventListener(MouseEvent.MOUSE_MOVE,moveHandler);
         _stage.removeEventListener(MouseEvent.MOUSE_UP,dropHandler);
         _button.stopDrag();
         if(swap())
         {
            resetPosition();
         }
         else if(KGAMECLASS.kGAMECLASS.get_silly())
         {
            Actuate.tween(_button,0.75,{
               "x":_global.x,
               "y":_global.y
            }).ease(Elastic.easeOut).onComplete(resetPosition);
         }
         else
         {
            Actuate.tween(_button,0.3,{
               "x":_global.x,
               "y":_global.y
            }).ease(Expo.easeOut).onComplete(resetPosition);
         }
         DragButton._container.addChild(DragButton._toolTip);
      }
      
      public function dragHandler(param1:MouseEvent) : void
      {
         if(!_button.enabled || _dragging || _selected)
         {
            return;
         }
         if(_tweening)
         {
            resetPosition();
         }
         param1.stopImmediatePropagation();
         _selected = true;
         _parent = _button.parent;
         _origin = new Point(_button.x,_button.y);
         _global = DragButton._container.globalToLocal(_parent.localToGlobal(_origin));
         _stage = _parent.stage;
         DragButton._container.addChild(_button);
         _button.x = _global.x;
         _button.y = _global.y;
         _button.startDrag(false,new Rectangle(0,0,DragButton._container.width,DragButton._container.height));
         _stage.addEventListener(MouseEvent.MOUSE_MOVE,moveHandler);
         _stage.addEventListener(MouseEvent.MOUSE_UP,dropHandler);
      }
      
      public function dispose() : void
      {
         _button.removeEventListener(MouseEvent.MOUSE_DOWN,dragHandler);
         _button.removeEventListener(MouseEvent.CLICK,clickHandler);
         if(_stage != null)
         {
            _stage.removeEventListener(MouseEvent.MOUSE_MOVE,moveHandler);
            _stage.removeEventListener(MouseEvent.MOUSE_UP,dropHandler);
         }
         if(_origin != null)
         {
            _parent = _parent != null ? _parent : _button.parent;
            resetPosition();
         }
      }
      
      public function clickHandler(param1:MouseEvent) : void
      {
         param1.stopImmediatePropagation();
         _button.removeEventListener(MouseEvent.CLICK,clickHandler);
      }
   }
}

