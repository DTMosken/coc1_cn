package classes.display
{
   import classes.globalFlags.KGAMECLASS;
   import classes.internals.StringUtil;
   import classes.internals.Utils;
   import coc.view.Block;
   import coc.view.CoCButton;
   import coc.view.FlowDirection;
   import coc.view.LayoutConfig;
   import coc.view.LayoutType;
   import coc.view.Theme;
   import com.bit101.components.ScrollPane;
   import com.bit101.components.SearchBar;
   import com.bit101.components.VScrollBar;
   import flash.Boot;
   import flash.display.DisplayObject;
   import flash.display.Sprite;
   import flash.display.Stage;
   import flash.events.Event;
   import flash.events.MouseEvent;
   import flash.text.Font;
   import flash.text.TextField;
   import flash.text.TextFormat;
   import haxe.IMap;
   import haxe.ds.StringMap;
   import openfl.utils.Assets;
   
   public class SettingPane extends ScrollPane
   {
      
      public var settingData:IMap;
      
      public var mobile:Boolean;
      
      public var _stage:Stage;
      
      public var _settingHeight:int;
      
      public var _searchBar:SearchBar;
      
      public var _initialized:Boolean;
      
      public var _content:Block;
      
      public var _bindDisplays:IMap;
      
      public function SettingPane(param1:int = 0, param2:int = 0, param3:int = 0, param4:int = 0, param5:int = 55)
      {
         var _gthis:SettingPane;
         if(Boot.skip_constructor)
         {
            return;
         }
         _bindDisplays = new StringMap();
         settingData = new StringMap();
         _initialized = false;
         _settingHeight = 55;
         mobile = false;
         _gthis = this;
         super();
         move(param1,param2);
         setSize(param3,param4);
         _settingHeight = param5;
         _background.alpha = 0;
         _content = new Block(new LayoutConfig(LayoutType.Flow(FlowDirection.Column,4),null,null,null,null,null,null,null));
         _content.name = "controlContent";
         _content.addEventListener("coc&layout",function(param1:Event):void
         {
            if(_gthis.content != null)
            {
               _gthis.update();
            }
         });
         _searchBar = new SearchBar();
         _searchBar.set_searchFunction(search);
         addEventListener(Event.ADDED_TO_STAGE,addedToStage);
         content.addChild(_content);
      }
      
      public function themeColors() : void
      {
         var _loc4_:int = 0;
         var _loc5_:* = null as DisplayObject;
         var _loc1_:uint = Theme.current.get_textColor();
         var _loc2_:int = 0;
         var _loc3_:int = _content.get_numElements();
         while(_loc2_ < _loc3_)
         {
            _loc4_ = _loc2_++;
            _loc5_ = _content.getElementAt(_loc4_);
            if(_loc5_ != _searchBar)
            {
               if(_loc5_ is TextField)
               {
                  _loc5_.textColor = _loc1_;
               }
               else if(_loc5_ is BindDisplay)
               {
                  _loc5_.label.textColor = _loc1_;
               }
            }
         }
      }
      
      public function set_initialized(param1:Boolean) : Boolean
      {
         return _initialized = param1;
      }
      
      public function search(param1:Event) : void
      {
         var _loc7_:* = null as String;
         var _loc9_:int = 0;
         var _loc10_:* = null as DisplayObject;
         var _loc11_:* = null as BindDisplay;
         var _loc12_:* = null as Array;
         var _loc13_:int = 0;
         var _loc14_:* = null as Array;
         var _loc15_:* = null as String;
         var _loc2_:String = _searchBar.get_text().toLowerCase();
         var _loc3_:String = StringUtil.trim(_loc2_);
         var _loc4_:Array = [];
         var _loc5_:int = 0;
         var _loc6_:Array = new EReg("\\W","g").split(_loc3_);
         while(_loc5_ < int(_loc6_.length))
         {
            _loc7_ = _loc6_[_loc5_];
            _loc5_++;
            if(_loc7_.length > 0)
            {
               _loc4_.push(_loc7_);
            }
         }
         _loc6_ = _loc4_;
         if(int(_loc6_.length) == 0)
         {
            _loc6_ = [""];
         }
         _loc5_ = 0;
         var _loc8_:int = _content.get_numElements();
         while(_loc5_ < _loc8_)
         {
            _loc9_ = _loc5_++;
            _loc10_ = _content.getElementAt(_loc9_);
            if(_loc10_ is BindDisplay)
            {
               _loc11_ = _loc10_;
               _loc7_ = _loc11_.label.text.toLowerCase();
               _loc12_ = [];
               _loc13_ = 0;
               _loc14_ = _loc6_;
               while(_loc13_ < int(_loc14_.length))
               {
                  _loc15_ = _loc14_[_loc13_];
                  _loc13_++;
                  if(_loc7_.indexOf(_loc15_) > -1)
                  {
                     _loc12_.push(_loc15_);
                  }
               }
               _loc11_.visible = int(_loc12_.length) > 0;
            }
         }
         _content.doLayout();
      }
      
      public function removedFromStage(param1:Event) : void
      {
         removeEventListener(Event.REMOVED_FROM_STAGE,removedFromStage);
         addEventListener(Event.ADDED_TO_STAGE,addedToStage);
         _stage.removeEventListener(MouseEvent.MOUSE_WHEEL,mouseScrollEvent);
         KGAMECLASS.kGAMECLASS.mainView.removeElement(_searchBar);
         _searchBar.set_text("");
         search(null);
      }
      
      public function newSetting(param1:String, param2:Array) : BindDisplay
      {
         var _loc3_:TextFormat = new TextFormat();
         _loc3_.color = Theme.current.get_textColor();
         _loc3_.size = 20;
         var _loc4_:BindDisplay = new BindDisplay(int(get_width() - 20),_settingHeight,int(param2.length),mobile);
         _loc4_.name = param1;
         _loc4_.label.multiline = true;
         _loc4_.label.wordWrap = true;
         _loc4_.label.autoSize = "left";
         _loc4_.label.defaultTextFormat = _loc3_;
         _loc4_.set_htmlText("<b>" + param1 + "：</b>\n");
         _content.addElement(_loc4_);
         var _loc5_:StringMap = _bindDisplays;
         if(param1 in StringMap.reserved)
         {
            _loc5_.setReserved(param1,_loc4_);
         }
         else
         {
            _loc5_.h[param1] = _loc4_;
         }
         return existingSetting(param1,param2,_loc4_);
      }
      
      public function mouseScrollEvent(param1:MouseEvent) : void
      {
         var _loc2_:VScrollBar = _vScrollbar;
         _loc2_.set_value(_loc2_.get_value() - Utils.boundInt(-16,param1.delta * 8,16));
         update();
      }
      
      public function hideSearch() : void
      {
         _searchBar.visible = false;
      }
      
      public function get_initialized() : Boolean
      {
         return _initialized;
      }
      
      public function existingSetting(param1:String, param2:Array, param3:BindDisplay) : BindDisplay
      {
         var _loc6_:int = 0;
         var _loc7_:* = null as SettingParams;
         var _loc8_:* = null as CoCButton;
         param3.label.textColor = Theme.current.get_textColor();
         var _loc4_:int = 0;
         var _loc5_:int = int(param2.length);
         while(_loc4_ < _loc5_)
         {
            _loc6_ = _loc4_++;
            _loc7_ = param2[_loc6_];
            _loc8_ = param3.buttons[_loc6_];
            _loc8_.set_labelText(_loc7_.name);
            _loc8_.callback = _loc7_.fun;
            param3.buttons[_loc6_].disableEnable(_loc7_.current);
            if(_loc7_.overridesLabel)
            {
               param3.set_htmlText(_loc7_.desc);
            }
            else if(_loc7_.current)
            {
               param3.set_htmlText("<b>" + param1 + ": " + colorifyText(_loc7_.name) + "</b>\n<font size=\"14\">" + _loc7_.desc + "</font>");
            }
         }
         return param3;
      }
      
      public function colorifyText(param1:String) : String
      {
         var _loc2_:String = param1.toLowerCase();
         var _loc3_:String = _loc2_;
         if(_loc3_ != "disabled")
         {
            if(_loc3_ != "off")
            {
               if(_loc3_ != "off ")
               {
                  if(_loc3_ != "choose")
                  {
                     if(_loc3_ != "enable")
                     {
                        if(_loc3_ != "enabled")
                        {
                           if(_loc3_ != "new")
                           {
                              if(_loc3_ != "old")
                              {
                                 if(_loc3_ != "on")
                                 {
                                    return param1;
                                 }
                              }
                           }
                        }
                        return "<font color=\"#008000\">" + param1 + "</font>";
                     }
                  }
                  return "";
               }
            }
         }
         return "<font color=\"#800000\">" + param1 + "</font>";
      }
      
      public function addedToStage(param1:Event) : void
      {
         removeEventListener(Event.ADDED_TO_STAGE,addedToStage);
         addEventListener(Event.REMOVED_FROM_STAGE,removedFromStage);
         _stage = stage;
         _stage.addEventListener(MouseEvent.MOUSE_WHEEL,mouseScrollEvent);
         KGAMECLASS.kGAMECLASS.mainView.addElement(_searchBar);
      }
      
      public function addOrUpdateToggleSettings(param1:String, param2:Array) : BindDisplay
      {
         var _loc3_:IMap = settingData;
         var _loc4_:Setting = new Setting(param1,param2);
         var _loc5_:StringMap = _loc3_;
         if(param1 in StringMap.reserved)
         {
            _loc5_.setReserved(param1,_loc4_);
         }
         else
         {
            _loc5_.h[param1] = _loc4_;
         }
         _loc5_ = _bindDisplays;
         var _loc6_:BindDisplay = param1 in StringMap.reserved ? _loc5_.getReserved(param1) : _loc5_.h[param1];
         return _loc6_ == null ? newSetting(param1,param2) : existingSetting(param1,param2,_loc6_);
      }
      
      public function addHelpLabel() : TextField
      {
         var _loc1_:TextFormat = new TextFormat();
         _loc1_.size = 20;
         _loc1_.color = Theme.current.get_textColor();
         _loc1_.font = Assets.getFont("res/fonts/NotoSerif-Regular.ttf").fontName;
         var _loc2_:TextField = new TextField();
         _loc2_.name = "helpLabel";
         _loc2_.x = 10;
         _loc2_.width = get_width() - 40;
         _loc2_.defaultTextFormat = _loc1_;
         _loc2_.multiline = true;
         _loc2_.wordWrap = true;
         _loc2_.autoSize = "left";
         _content.addElementAt(_loc2_,0);
         return _loc2_;
      }
   }
}

