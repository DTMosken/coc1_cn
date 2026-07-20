package coc.view.mobile
{
   import coc.view.BitmapDataSprite;
   import coc.view.Block;
   import coc.view.ButtonData;
   import coc.view.CoCButton;
   import coc.view.FlowDirection;
   import coc.view.LayoutConfig;
   import coc.view.LayoutHint;
   import coc.view.LayoutType;
   import coc.view.Theme;
   import coc.view.ThemeObserver;
   import com.bit101.components.Component;
   import flash.Boot;
   import flash.display.Bitmap;
   import flash.events.Event;
   import flash.text.TextField;
   import flash.text.TextFormat;
   
   public class MainMenu extends Component implements ThemeObserver
   {
      
      public static var PADDING:int = 15;
      
      public static var BUTTONS_WIDTH_PORTRAIT:int = 305;
      
      public static var BUTTONS_HEIGHT_PORTRAIT:int = 175;
      
      public var _version:TextField;
      
      public var _miniCredit:TextField;
      
      public var _logo:BitmapDataSprite;
      
      public var _disclaimerText:TextField;
      
      public var _disclaimerIcon:BitmapDataSprite;
      
      public var _disclaimerBackground:BitmapDataSprite;
      
      public var _disclaimer:Block;
      
      public var _buttons:Array;
      
      public var _buttonContainer:Block;
      
      public function MainMenu()
      {
         if(Boot.skip_constructor)
         {
            return;
         }
         _buttons = [];
         super();
         Theme.subscribe(this);
         update(null);
      }
      
      public function update(param1:String) : void
      {
         _logo.set_bitmap(Theme.current.get_CoCLogo());
         _disclaimerBackground.set_bitmap(Theme.current.get_disclaimerBg());
         _disclaimerIcon.set_bitmap(Theme.current.get_warningImage());
         _miniCredit.textColor = Theme.current.get_menuTextColor();
      }
      
      public function staticLayout(param1:Number) : void
      {
         _logo.setSize(param1,param1 / _logo.width * _logo.height);
         _miniCredit.x = (param1 + 30) / 2 - _miniCredit.width / 2;
         _miniCredit.y = _logo.y + _logo.height + 15;
         _disclaimer.set_height(param1 / _disclaimer.get_width() * _disclaimer.get_height());
         _disclaimer.set_width(param1);
         _disclaimer.x = 15;
         _disclaimer.y = _miniCredit.y + _miniCredit.height + 15;
      }
      
      public function show(param1:Array, param2:Number, param3:Number) : void
      {
         var _loc6_:int = 0;
         var _loc4_:int = 0;
         var _loc5_:int = int(_buttons.length);
         while(_loc4_ < _loc5_)
         {
            _loc6_ = _loc4_++;
            param1[_loc6_].applyTo(_buttons[_loc6_]);
         }
         setSize(param2,param3);
         visible = true;
      }
      
      public function onResize(param1:Event) : void
      {
         var _loc2_:String = ScreenScaling.get_orientation();
         if(_loc2_ == "rotatedLeft")
         {
            layoutLandscape();
         }
         else if(_loc2_ == "rotatedRight")
         {
            layoutLandscape();
         }
         else
         {
            layoutPortrait();
         }
      }
      
      public function layoutPortrait() : void
      {
         var _loc1_:Number = _width - 30;
         var _loc2_:Number = _height - 30;
         staticLayout(_loc1_);
         _buttonContainer.unscaledResize(MainMenu.BUTTONS_WIDTH_PORTRAIT,MainMenu.BUTTONS_HEIGHT_PORTRAIT);
         _buttonContainer.doLayout();
         var _loc3_:Number = _loc1_ / _buttonContainer.get_width() * _buttonContainer.get_height();
         _buttonContainer.scaleX = _loc1_ / _buttonContainer.get_width();
         _buttonContainer.scaleY = _loc3_ / _buttonContainer.get_height();
         _buttonContainer.x = 15;
         _buttonContainer.y = _disclaimer.y + _disclaimer.get_height() + 15;
         var _loc4_:int = int(_loc2_ - (_buttonContainer.y + _buttonContainer.get_height()));
         if(_loc4_ > 0)
         {
            set_y(_loc4_ / 3);
         }
      }
      
      public function layoutLandscape() : void
      {
         var _loc1_:Number = _height - 30;
         staticLayout(_loc1_);
         var _loc2_:int = int(get_width() - _logo.width - 30);
         _buttonContainer.unscaledResize(MainMenu.BUTTONS_WIDTH_PORTRAIT,MainMenu.BUTTONS_HEIGHT_PORTRAIT);
         _buttonContainer.doLayout();
         _buttonContainer.x = _logo.width + 30;
         var _loc3_:Number = _loc2_ / _buttonContainer.get_width();
         _buttonContainer.scaleX = _loc3_;
         _buttonContainer.scaleY = _loc3_;
         _buttonContainer.y = get_height() / 2 - _buttonContainer.get_height() * _loc3_ / 2;
         set_y(0);
      }
      
      override public function addChildren() : void
      {
         var _loc4_:* = null as CoCButton;
         _buttonContainer = new Block(new LayoutConfig(LayoutType.Grid(4,2),null,null,null,null,null,null,5));
         _buttonContainer.set_width(305);
         _buttonContainer.set_height(175);
         var _loc1_:Array = [];
         _loc1_.push(new CoCButton("",null,"","",0,false,true,true,0,0,0));
         _loc1_.push(new CoCButton("",null,"","",1,false,true,true,0,0,0));
         _loc1_.push(new CoCButton("",null,"","",2,false,true,true,0,0,0));
         _loc1_.push(new CoCButton("",null,"","",3,false,true,true,0,0,0));
         _loc1_.push(new CoCButton("",null,"","",4,false,true,true,0,0,0));
         _loc1_.push(new CoCButton("",null,"","",5,false,true,true,0,0,0));
         _loc1_.push(new CoCButton("",null,"","",6,false,true,true,0,0,0));
         _loc1_.push(new CoCButton("",null,"","",7,false,true,true,0,0,0));
         _buttons = _loc1_;
         var _loc2_:int = 0;
         var _loc3_:Array = _buttons;
         while(_loc2_ < int(_loc3_.length))
         {
            _loc4_ = _loc3_[_loc2_];
            _loc2_++;
            _buttonContainer.addElement(_loc4_);
         }
         _buttonContainer.doLayout();
         _disclaimer = new Block(new LayoutConfig(LayoutType.Flow(FlowDirection.Row),null,null,10,null,8,null,null));
         _disclaimerBackground = new BitmapDataSprite(null,null,true,0,0,0,0,true,"",0,false,1,true);
         _disclaimerIcon = new BitmapDataSprite(null,null,true,0,0,0,0,true,"",0,false,1,true);
         _disclaimerText = new TextField();
         _disclaimerText.autoSize = "left";
         _disclaimerText.multiline = true;
         _disclaimerText.wordWrap = true;
         _disclaimerText.width = 490;
         _disclaimerText.defaultTextFormat = new TextFormat("Alibaba PuHuiTi 3 85 Bold, serif",16,Theme.current.get_textColor(),null,null,null,null,null,"left",null,null,null,-2);
         _disclaimerText.htmlText = "<font face=\'Alibaba PuHuiTi 3 85 Bold\'>这是一款成人游戏，只适合成年人游玩。\n" + "如果你未满18岁或厌恶非常规的恋物癖，请不要游玩。如果你是在某处花钱得到这个免费游戏，说明你上当了。\n" + "<b>提醒过你了的说！</b>";
         _disclaimer.addElement(_disclaimerBackground,new LayoutHint(true,null,null,null,null,null,null));
         _disclaimer.addElement(_disclaimerIcon);
         _disclaimer.addElement(_disclaimerText);
         _miniCredit = new TextField();
         _miniCredit.multiline = true;
         _miniCredit.autoSize = "center";
         _miniCredit.defaultTextFormat = new TextFormat("Alibaba PuHuiTi 3 85 Bold, serif",16,Theme.current.get_menuTextColor(),null,null,null,null,null,"center",null,null,null,-2);
         _miniCredit.htmlText = "<font face=\'Alibaba PuHuiTi 3 85 Bold\'><b>代码编写：</b>OtherCoCAnon，Koraeli，Mothman，Anonymous\n" + "<b>贡献者：</b> Satan，Chronicler，Anonymous";
         _logo = new BitmapDataSprite(null,null,true,0,0,0,0,true,"",0,false,1,true);
         _logo.x = 15;
         _logo.y = 15;
         addChild(_logo);
         addChild(_miniCredit);
         addChild(_disclaimer);
         addChild(_buttonContainer);
         addEventListener(Event.RESIZE,onResize);
      }
   }
}

