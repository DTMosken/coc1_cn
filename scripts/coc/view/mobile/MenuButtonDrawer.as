package coc.view.mobile
{
   import classes.display.GameViewData;
   import coc.view.BitmapDataSprite;
   import coc.view.Block;
   import coc.view.ButtonData;
   import coc.view.CoCButton;
   import coc.view.FlowDirection;
   import coc.view.LayoutConfig;
   import coc.view.LayoutType;
   import coc.view.Theme;
   import coc.view.ThemeObserver;
   import com.bit101.components.Component;
   import flash.Boot;
   import flash.display.Bitmap;
   import flash.events.Event;
   import flash.text.TextField;
   import flash.text.TextFormat;
   
   public class MenuButtonDrawer extends Component implements ThemeObserver
   {
      
      public var _label:TextField;
      
      public var _buttons:Array;
      
      public var _buttonContainer:Block;
      
      public var _background:BitmapDataSprite;
      
      public function MenuButtonDrawer()
      {
         if(Boot.skip_constructor)
         {
            return;
         }
         _label = new TextField();
         _background = new BitmapDataSprite(null,null,true,0,0,0,0,true,"",0,false,1,true);
         _buttons = [];
         _buttonContainer = new Block(new LayoutConfig(LayoutType.Flow(FlowDirection.Column,15),null,null,null,null,null,null,null));
         super();
         addEventListener(Event.RESIZE,handleResize);
         Theme.subscribe(this);
      }
      
      public function update(param1:String) : void
      {
         _background.set_bitmap(Theme.current.get_sidebarBg());
         _label.textColor = Theme.current.get_sideTextColor();
      }
      
      public function handleResize(param1:Event) : void
      {
         _background.setSize(get_width(),get_height());
         _label.width = get_width();
         _label.y = 5;
         _label.height = _label.y + _label.textHeight + 8;
         _buttonContainer.y = _label.height + 15;
         _buttonContainer.x = get_width() / 2 - _buttonContainer.get_width() / 2;
      }
      
      public function get_buttons() : Array
      {
         return _buttons;
      }
      
      public function flush() : void
      {
         var _loc4_:* = null as ButtonData;
         var _loc1_:int = 0;
         var _loc2_:int = 0;
         var _loc3_:Array = GameViewData.menuButtons;
         while(_loc2_ < int(_loc3_.length))
         {
            _loc4_ = _loc3_[_loc2_];
            _loc2_++;
            _loc4_.applyTo(_buttons[_loc1_]);
            _loc1_++;
         }
      }
      
      override public function addChildren() : void
      {
         var _loc5_:* = null as CoCButton;
         _background.set_bitmap(Theme.current.get_sidebarBg());
         var _loc1_:TextFormat = new TextFormat();
         _loc1_.size = 30;
         _loc1_.align = "center";
         _label.defaultTextFormat = _loc1_;
         _label.text = "设置";
         var _loc2_:Array = [];
         _loc2_.push(new CoCButton("",null,"","",0,false,true,true,0,0,0));
         _loc2_.push(new CoCButton("",null,"","",1,false,true,true,0,0,0));
         _loc2_.push(new CoCButton("",null,"","",2,false,true,true,0,0,0));
         _loc2_.push(new CoCButton("",null,"","",3,false,true,true,0,0,0));
         _loc2_.push(new CoCButton("",null,"","",4,false,true,true,0,0,0));
         _loc2_.push(new CoCButton("",null,"","",5,false,true,true,0,0,0));
         _buttons = _loc2_;
         var _loc3_:int = 0;
         var _loc4_:Array = _buttons;
         while(_loc3_ < int(_loc4_.length))
         {
            _loc5_ = _loc4_[_loc3_];
            _loc3_++;
            _buttonContainer.addElement(_loc5_);
         }
         _buttonContainer.doLayout();
         _buttonContainer.scaleX = 1.25;
         _buttonContainer.scaleY = 1.25;
         addChild(_background);
         addChild(_label);
         addChild(_buttonContainer);
      }
   }
}

