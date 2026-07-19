package classes.display
{
   import coc.view.Block;
   import coc.view.CoCButton;
   import coc.view.DefaultTextFormatParameters;
   import coc.view.FlowDirection;
   import coc.view.LayoutConfig;
   import coc.view.LayoutType;
   import coc.view.MainView;
   import coc.view.TextFieldParameters;
   import coc.view.Theme;
   import flash.Boot;
   import flash.text.Font;
   import flash.text.TextField;
   import openfl.utils.Assets;
   
   public class BindDisplay extends Block
   {
      
      public var label:TextField;
      
      public var buttons:Array;
      
      public var _minHeight:int;
      
      public function BindDisplay(param1:int = 0, param2:int = 40, param3:int = 2, param4:Boolean = false)
      {
         var _loc7_:int = 0;
         var _loc8_:* = null as CoCButton;
         if(Boot.skip_constructor)
         {
            return;
         }
         _minHeight = 0;
         buttons = [];
         super();
         set_layoutConfig(new LayoutConfig(LayoutType.Flow(FlowDirection.Row,4,param4),null,null,null,null,null,null,null));
         set_width(param1);
         set_height(param2);
         label = addTextField(new TextFieldParameters("这是一种疯狂的标签",null,null,null,param1 - (param4 ? 0 : 304),null,null,null,new DefaultTextFormatParameters(Assets.getFont("res/fonts/NotoSerif-Regular.ttf").fontName,20,null,null,null,null,null,null,"left",null,null,null,null),null,null,null,null,null,null,null,null));
         var _loc5_:int = 0;
         var _loc6_:int = param3;
         while(_loc5_ < _loc6_)
         {
            _loc7_ = _loc5_++;
            _loc8_ = new CoCButton("Unbound",null,"","",_loc7_,false,true,true,param3 <= 2 ? 150 : MainView.BTN_MW,0,0);
            buttons.push(_loc8_);
            addElement(_loc8_);
         }
      }
      
      public function set_htmlText(param1:String) : String
      {
         return label.htmlText = param1;
      }
      
      public function get_htmlText() : String
      {
         return label.htmlText;
      }
      
      public function addButton(param1:String, param2:Function) : CoCButton
      {
         var _loc3_:CoCButton = new CoCButton(param1,param2,"","",Theme.current.nextButton(),false,true,true,0,0,0);
         buttons.push(_loc3_);
         addElement(_loc3_);
         return _loc3_;
      }
   }
}

