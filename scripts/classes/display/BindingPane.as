package classes.display
{
   import classes.BoundControlMethod;
   import classes.InputManager;
   import classes.globalFlags.KGAMECLASS;
   import classes.internals.Utils;
   import coc.view.Block;
   import coc.view.CoCButton;
   import coc.view.FlowDirection;
   import coc.view.LayoutConfig;
   import coc.view.LayoutType;
   import coc.view.Theme;
   import com.bit101.components.ScrollPane;
   import com.bit101.components.VScrollBar;
   import flash.Boot;
   import flash.display.DisplayObject;
   import flash.display.Sprite;
   import flash.display.Stage;
   import flash.events.Event;
   import flash.events.MouseEvent;
   import flash.text.TextField;
   import flash.text.TextFormat;
   import haxe.IMap;
   
   public class BindingPane extends ScrollPane
   {
      
      public static var init__:Boolean;
      
      public static var _keyDict:IMap;
      
      public var functions:Array;
      
      public var _stage:Stage;
      
      public var _inputManager:InputManager;
      
      public var _contentChildren:int;
      
      public var _content:Block;
      
      public function BindingPane(param1:InputManager = undefined, param2:int = 0, param3:int = 0, param4:int = 0, param5:int = 0)
      {
         var _gthis:BindingPane;
         if(Boot.skip_constructor)
         {
            return;
         }
         _contentChildren = 0;
         _gthis = this;
         super();
         _inputManager = param1;
         _background.alpha = 0;
         move(param2,param3);
         setSize(param4,param5);
         _content = new Block(new LayoutConfig(LayoutType.Flow(FlowDirection.Column,4),null,null,null,null,null,null,null));
         _content.name = "controlContent";
         _content.addEventListener("coc&layout",function(param1:Event):void
         {
            if(_gthis.content != null)
            {
               _gthis.update();
            }
         });
         _contentChildren = 0;
         addEventListener(Event.ADDED_TO_STAGE,AddedToStage);
      }
      
      public static function keyName(param1:int, param2:String) : String
      {
         var _loc3_:String = BindingPane._keyDict.h[param1];
         if(_loc3_ != null)
         {
            return _loc3_;
         }
         return param2;
      }
      
      public function listenForBind(param1:String, param2:InputManager, param3:Boolean) : void
      {
         param2.ListenForNewBind(param1,param3);
         _stage.focus = _stage;
      }
      
      public function UpdateContentObjects() : void
      {
         var _loc3_:* = null as BoundControlMethod;
         var _loc4_:* = null as BindDisplay;
         var _loc5_:* = null as String;
         var _loc6_:* = null as String;
         var _loc1_:int = 0;
         var _loc2_:Array = functions;
         while(_loc1_ < int(_loc2_.length))
         {
            _loc3_ = _loc2_[_loc1_];
            _loc1_++;
            _loc4_ = _content.getElementByName(_loc3_.name);
            _loc4_.label.textColor = Theme.current.get_textColor();
            _loc5_ = BindingPane.keyName(_loc3_.primaryKey,"未绑定");
            _loc4_.buttons[0].set_labelText(_loc5_);
            _loc6_ = BindingPane.keyName(_loc3_.secondaryKey,"未绑定");
            _loc4_.buttons[1].set_labelText(_loc6_);
         }
      }
      
      public function RemovedFromStage(param1:Event) : void
      {
         removeEventListener(Event.REMOVED_FROM_STAGE,RemovedFromStage);
         addEventListener(Event.ADDED_TO_STAGE,AddedToStage);
         _stage.removeEventListener(MouseEvent.MOUSE_WHEEL,MouseScrollEvent);
      }
      
      public function MouseScrollEvent(param1:MouseEvent) : void
      {
         var _loc2_:VScrollBar = _vScrollbar;
         _loc2_.set_value(_loc2_.get_value() - Utils.boundInt(-16,param1.delta * 8,16));
         update();
      }
      
      public function ListBindingOptions() : void
      {
         if(_contentChildren == 0)
         {
            InitContentObjects();
         }
         else
         {
            UpdateContentObjects();
         }
         content.addChild(_content);
         update();
      }
      
      public function InitContentObjects() : void
      {
         var _loc5_:* = null as BoundControlMethod;
         var _loc6_:* = null as BindDisplay;
         var _loc7_:* = null as String;
         var _loc8_:* = null as String;
         var _loc9_:* = null as Function;
         var _loc10_:* = null as Function;
         var _loc1_:TextFormat = new TextFormat();
         _loc1_.color = Theme.current.get_textColor();
         _loc1_.size = 20;
         var _loc2_:TextField = new TextField();
         _loc2_.name = "helpLabel";
         _loc2_.x = 10;
         _loc2_.width = get_width() - 40;
         _loc2_.defaultTextFormat = _loc1_;
         _loc2_.multiline = true;
         _loc2_.wordWrap = true;
         _loc2_.autoSize = "left";
         _loc2_.htmlText = KGAMECLASS.kGAMECLASS.formatHeader("键盘按键绑定");
         _loc2_.htmlText += "点击你想绑定新按键的操作旁边的按钮，然后按下你想绑定到该操作的按键。\n\n";
         _loc2_.htmlText += "自定义绑定会保存在你的全局设置中。\n";
         _loc2_.htmlText += "重复的按键会自动从它们旧的控制操作中解绑。\n";
         _loc2_.htmlText += "<b>重置按键</b>会将所有的控制绑定重置为默认值。\n";
         _loc2_.htmlText += "<b>清除控制</b>将移除所有当前的控制绑定，使所有操作都处于未绑定状态。\n\n";
         _content.addElement(_loc2_);
         var _loc3_:int = 0;
         var _loc4_:Array = functions;
         while(_loc3_ < int(_loc4_.length))
         {
            _loc5_ = _loc4_[_loc3_];
            _loc3_++;
            _loc6_ = new BindDisplay(int(get_width() - 20));
            _loc6_.name = _loc5_.name;
            _loc6_.label.defaultTextFormat = _loc1_;
            _loc6_.set_htmlText("<b>" + _loc5_.name + "：</b>");
            _loc7_ = BindingPane.keyName(_loc5_.primaryKey,"未绑定");
            _loc6_.buttons[0].set_labelText(_loc7_);
            _loc8_ = BindingPane.keyName(_loc5_.secondaryKey,"未绑定");
            _loc6_.buttons[1].set_labelText(_loc8_);
            _loc9_ = (function(param1:Array, param2:Array, param3:Array, param4:Array):Function
            {
               var _g:Array = param1;
               var primary:Array = param2;
               var inputManager:Array = param3;
               var funcName:Array = param4;
               return function():void
               {
                  _g[0].listenForBind(funcName[0],inputManager[0],Boolean(primary[0]));
               };
            })([this],[true],[_inputManager],[_loc5_.name]);
            _loc6_.buttons[0].callback = _loc9_;
            _loc10_ = (function(param1:Array, param2:Array, param3:Array, param4:Array):Function
            {
               var _g:Array = param1;
               var primary:Array = param2;
               var inputManager:Array = param3;
               var funcName:Array = param4;
               return function():void
               {
                  _g[0].listenForBind(funcName[0],inputManager[0],Boolean(primary[0]));
               };
            })([this],[false],[_inputManager],[_loc5_.name]);
            _loc6_.buttons[1].callback = _loc10_;
            _content.addElement(_loc6_);
         }
         _contentChildren = 1 + int(functions.length);
      }
      
      public function AddedToStage(param1:Event) : void
      {
         removeEventListener(Event.ADDED_TO_STAGE,AddedToStage);
         addEventListener(Event.REMOVED_FROM_STAGE,RemovedFromStage);
         _stage = stage;
         _stage.addEventListener(MouseEvent.MOUSE_WHEEL,MouseScrollEvent);
      }
   }
}

