package coc.view.mobile
{
   import classes.display.GameViewData;
   import coc.view.Block;
   import coc.view.ButtonData;
   import coc.view.CoCButton;
   import coc.view.CoCScrollPane;
   import coc.view.FlowDirection;
   import coc.view.LayoutConfig;
   import coc.view.LayoutType;
   import coc.view.Theme;
   import flash.Boot;
   import flash.events.Event;
   import flash.text.TextField;
   
   public class StashView extends CoCScrollPane
   {
      
      public var _layoutBlock:Block;
      
      public var _buttonHook:Function;
      
      public function StashView(param1:Function = undefined)
      {
         if(Boot.skip_constructor)
         {
            return;
         }
         super();
         set_autoHideScrollBar(true);
         _buttonHook = param1;
      }
      
      override public function onResize(param1:Event) : void
      {
         super.onResize(param1);
         flush();
      }
      
      public function flush() : void
      {
         var _loc1_:int = 0;
         var _loc2_:* = null as Array;
         var _loc3_:* = null;
         _layoutBlock.removeElements();
         if(GameViewData.stashData != null)
         {
            _loc1_ = 0;
            _loc2_ = GameViewData.stashData;
            while(_loc1_ < int(_loc2_.length))
            {
               _loc3_ = _loc2_[_loc1_];
               _loc1_++;
               _layoutBlock.addElement(buildLabel(_loc3_.description));
               _layoutBlock.addElement(buildButtons(_loc3_.buttons));
            }
         }
         _layoutBlock.doLayout();
      }
      
      public function buildLabel(param1:String) : TextField
      {
         var _loc2_:TextField = new TextField();
         _loc2_.defaultTextFormat = MobileUI.defaultTextFormat;
         _loc2_.embedFonts = true;
         _loc2_.width = get_width() - 15 - 4;
         _loc2_.wordWrap = true;
         _loc2_.autoSize = "left";
         _loc2_.htmlText = param1;
         return _loc2_;
      }
      
      public function buildButtons(param1:Array) : Block
      {
         var _loc4_:* = null as ButtonData;
         var _loc5_:* = null as CoCButton;
         var _loc2_:Block = new Block(new LayoutConfig(LayoutType.Flow(FlowDirection.Row,null,true),null,null,null,null,null,null,null),0,0,get_width() - 15 - 3,0,"");
         var _loc3_:int = 0;
         while(_loc3_ < int(param1.length))
         {
            _loc4_ = param1[_loc3_];
            _loc3_++;
            _loc5_ = new CoCButton();
            _loc5_.position = Theme.current.nextButton();
            _loc4_.applyTo(_loc5_);
            _buttonHook(_loc5_);
            _loc2_.addElement(_loc5_);
         }
         _loc2_.doLayout();
         return _loc2_;
      }
      
      override public function addChildren() : void
      {
         super.addChildren();
         _layoutBlock = new Block(new LayoutConfig(LayoutType.Flow(FlowDirection.Column,5),null,null,null,null,null,null,null));
         addChild(_layoutBlock);
      }
   }
}

