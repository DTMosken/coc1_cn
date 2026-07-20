package coc.view
{
   import classes.ItemType;
   import classes.globalFlags.KGAMECLASS;
   import classes.internals.Utils;
   import flash.Boot;
   import flash.display.Bitmap;
   import flash.events.Event;
   import flash.events.MouseEvent;
   import flash.filters.DropShadowFilter;
   import flash.text.Font;
   import flash.text.TextField;
   import flash.text.TextFormat;
   import openfl.utils.Assets;
   
   public class CoCButton extends Block implements ThemeObserver
   {
      
      public static var bUTTON_LABEL_FONT_NAME:String;
      
      public static var buttonKeyFontName:String;
      
      public static var ButtonKeyFontColor:int = 12311978;
      
      public static var ButtonKeyShadowColor:int = 4465254;
      
      public static var ButtonKeyFontSize:int = 10;
      
      public var toolTipText:String;
      
      public var toolTipHeader:String;
      
      public var preCallback:Function;
      
      public var position:int;
      
      public var enabled:Boolean;
      
      public var dummy:Boolean;
      
      public var callback:Function;
      
      public var _labelField:TextField;
      
      public var _key2label:TextField;
      
      public var _key1label:TextField;
      
      public var _cornerField:TextField;
      
      public var _backgroundGraphic:BitmapDataSprite;
      
      public function CoCButton(param1:String = undefined, param2:Object = undefined, param3:String = undefined, param4:String = undefined, param5:int = 0, param6:Boolean = false, param7:Boolean = true, param8:Boolean = true, param9:Number = 0, param10:Number = 0, param11:Number = 0)
      {
         if(param1 == null)
         {
            param1 = "";
         }
         if(param3 == null)
         {
            param3 = "";
         }
         if(param4 == null)
         {
            param4 = "";
         }
         if(Boot.skip_constructor)
         {
            return;
         }
         position = 0;
         dummy = false;
         preCallback = null;
         callback = null;
         enabled = true;
         _key2label = null;
         _key1label = null;
         super();
         if(CoCButton.bUTTON_LABEL_FONT_NAME == null)
         {
            CoCButton.bUTTON_LABEL_FONT_NAME = Assets.getFont("res/fonts/Shrewsbury-Titling Bold.ttf").fontName;
            CoCButton.buttonKeyFontName = CoCButton.bUTTON_LABEL_FONT_NAME;
         }
         initButton();
         mouseChildren = true;
         buttonMode = true;
         visible = param8;
         set_labelText(param1);
         callback = param2;
         toolTipText = Utils.cnName(param3);
         toolTipHeader = Utils.cnName(param4);
         position = param5;
         dummy = param6;
         set_enabled(param7);
         set_width(param9);
         x = param10;
         y = param11;
         if(param6)
         {
            return;
         }
         if(get_width() < 130)
         {
            _labelField.x = 0;
            _labelField.width = get_width();
            _labelField.scaleX = 150 / _labelField.width;
         }
         update("");
         addEventListener(MouseEvent.ROLL_OVER,hover);
         addEventListener(MouseEvent.ROLL_OUT,dim);
         addEventListener(MouseEvent.CLICK,click);
         addEventListener(Event.REMOVED_FROM_STAGE,removedFromStage);
      }
      
      public function update(param1:String) : void
      {
         resetBackground();
         _labelField.textColor = Theme.current.get_buttonTextColor();
      }
      
      public function text(param1:String, param2:String = undefined, param3:String = undefined, param4:Boolean = false) : CoCButton
      {
         if(param2 == null)
         {
            param2 = "";
         }
         if(param3 == null)
         {
            param3 = "";
         }
         set_labelText(param1);
         hint(param2,param3,param4);
         if(!param4)
         {
            pushData();
         }
         return this;
      }
      
      public function showDisabled(param1:String, param2:String = undefined, param3:String = undefined, param4:Boolean = false) : CoCButton
      {
         if(param2 == null)
         {
            param2 = "";
         }
         if(param3 == null)
         {
            param3 = "";
         }
         if(dummy)
         {
            return this;
         }
         set_labelText(param1);
         resetBackground();
         callback = null;
         hint(param2,param3,param4);
         visible = true;
         set_enabled(false);
         alpha = 1;
         if(!param4)
         {
            pushData();
         }
         return this;
      }
      
      public function show(param1:String, param2:Function, param3:String = undefined, param4:String = undefined, param5:Boolean = false) : CoCButton
      {
         if(param3 == null)
         {
            param3 = "";
         }
         if(param4 == null)
         {
            param4 = "";
         }
         if(dummy)
         {
            return this;
         }
         set_labelText(param1);
         resetBackground();
         callback = param2;
         hint(param3,param4,param5);
         visible = true;
         set_enabled(true);
         alpha = 1;
         if(!param5)
         {
            pushData();
         }
         return this;
      }
      
      public function sexButton(param1:int = 0, param2:Boolean = true, param3:Boolean = false) : CoCButton
      {
         var _loc5_:* = null as String;
         var _loc6_:* = null as String;
         var _loc4_:String = "";
         if(param1 > 0 && (param1 & KGAMECLASS.kGAMECLASS.player.get_gender()) != param1)
         {
            _loc5_ = ["ERROR","一根阴茎","一个阴道","成为双性人"][param1];
            _loc6_ = param1 == 3 ? "并且拥有" : "并且";
            _loc4_ = "这个场景需要拥有" + _loc5_ + (param2 ? "" + _loc6_ + "足够的欲望。" : ".");
         }
         else if(param1 < 0 && KGAMECLASS.kGAMECLASS.player.get_gender() == 0)
         {
            _loc4_ = "这个场景需要生殖器" + (param2 ? "以及足够的性欲。" : "。");
         }
         else if(param2 && KGAMECLASS.kGAMECLASS.player.get_lust() < 33)
         {
            _loc4_ = "你还不够兴奋，无法做爱。";
         }
         if(_loc4_ != "")
         {
            set_enabled(false);
            toolTipText = Utils.cnName(_loc4_);
         }
         if(!param3)
         {
            pushData();
         }
         return this;
      }
      
      public function set_labelText(param1:String) : String
      {
         var _loc2_:TextField = _labelField;
         var _loc3_:TextFormat = _loc2_.defaultTextFormat;
         _loc3_.size = 18;
         _loc2_.text = param1;
         _loc2_.setTextFormat(_loc3_);
         while(_loc2_.textWidth > _loc2_.width - 4)
         {
            _loc3_.size -= 1;
            _loc2_.setTextFormat(_loc3_);
         }
         var _loc4_:Number = (18 - _loc3_.size) / 2;
         _loc2_.y = 5 + _loc4_;
         _loc2_.height = 35 - _loc4_;
         return param1;
      }
      
      public function set_key2text(param1:String) : String
      {
         if(_key2label == null)
         {
            _key2label = addTextField(new TextFieldParameters(null,null,null,null,134,32,8,4,new DefaultTextFormatParameters(CoCButton.buttonKeyFontName,10,null,null,null,null,null,null,"left",null,null,null,null),12311978,null,null,null,null,null,null,null));
            _key2label.filters = _key1label.filters.slice(0);
         }
         return _key2label.text = param1;
      }
      
      public function set_key1text(param1:String) : String
      {
         if(_key1label == null)
         {
            _key1label = addTextField(new TextFieldParameters(null,null,null,null,134,32,8,4,new DefaultTextFormatParameters(CoCButton.buttonKeyFontName,10,null,null,null,null,null,null,"right",null,null,null,null),12311978,null,null,null,null,null,null,null));
            _key1label.filters = [new DropShadowFilter(0,0,4465254,1,4,4,10)];
         }
         return _key1label.text = param1;
      }
      
      public function set_enabled(param1:Boolean) : Boolean
      {
         enabled = param1;
         _labelField.alpha = param1 ? 1 : 0.4;
         _backgroundGraphic.alpha = param1 ? 1 : 0.4;
         return param1;
      }
      
      public function set_cornerText(param1:String) : String
      {
         if(param1 == null || param1 == "")
         {
            return param1;
         }
         _cornerField = addTextField(new TextFieldParameters(param1,null,null,true,140,32,67,1,new DefaultTextFormatParameters(CoCButton.bUTTON_LABEL_FONT_NAME,12,null,null,null,null,null,null,"center",null,null,null,null),null,null,null,null,null,null,null,null));
         return param1;
      }
      
      public function set_bitmapClass(param1:Class) : Class
      {
         return _backgroundGraphic.set_bitmapClass(param1);
      }
      
      public function set_bitmap(param1:Bitmap) : Bitmap
      {
         return _backgroundGraphic.set_bitmap(param1);
      }
      
      public function setCount(param1:ItemType, param2:int, param3:Boolean = false) : CoCButton
      {
         if(param1.getMaxStackSize() > 1)
         {
            set_labelText(set_labelText(get_labelText() + (" x" + param2)));
         }
         if(!param3)
         {
            pushData();
         }
         return this;
      }
      
      public function setCornerText(param1:String = undefined) : CoCButton
      {
         if(param1 == null)
         {
            param1 = "";
         }
         set_cornerText(param1);
         return this;
      }
      
      public function resetBackground() : CoCButton
      {
         var _loc1_:* = null as Bitmap;
         if(dummy)
         {
            return this;
         }
         if(!isNavButton())
         {
            if(isMedium())
            {
               set_bitmap(Theme.current.medButtonBackground(position));
            }
            else
            {
               set_bitmap(Theme.current.buttonBackground(position));
            }
            return this;
         }
         switch(position)
         {
            case 6:
               _loc1_ = Theme.current.get_navButtons().north;
               break;
            case 10:
               _loc1_ = Theme.current.get_navButtons().west;
               break;
            case 11:
               _loc1_ = Theme.current.get_navButtons().south;
               break;
            case 12:
               _loc1_ = Theme.current.get_navButtons().east;
               break;
            default:
               _loc1_ = Theme.current.buttonBackground(position);
         }
         set_bitmap(_loc1_);
         return this;
      }
      
      public function removedFromStage(param1:Event) : void
      {
         Theme.unsubscribe(this);
      }
      
      public function pushData() : void
      {
         if(dummy)
         {
            return;
         }
         var _loc1_:ButtonDataList = KGAMECLASS.kGAMECLASS.output.buttons;
         var _loc2_:Array = [_loc1_.prevName,_loc1_.nextName,_loc1_.exitName];
         if(!Boolean(_loc2_.contains(get_labelText())))
         {
            _loc1_.pushOrdered(position,buttonData());
         }
      }
      
      public function isNavButton() : Boolean
      {
         if(KGAMECLASS.kGAMECLASS.inDungeon || KGAMECLASS.kGAMECLASS.inRoomedDungeon)
         {
            return Boolean(["north","south","east","west","leave"].contains(get_labelText().toLowerCase()));
         }
         return false;
      }
      
      public function isMedium() : Boolean
      {
         return get_width() <= MainView.BTN_MW;
      }
      
      public function initButton() : void
      {
         _backgroundGraphic = addBitmapDataSprite(new BitmapDataSprite(null,null,true,0,0,40,150,false,"",0,false,1,true));
         _labelField = addTextField(new TextFieldParameters(null,null,null,true,140,32,4,5,new DefaultTextFormatParameters(CoCButton.bUTTON_LABEL_FONT_NAME,18,Theme.current.get_buttonTextColor(),null,null,null,null,null,"center",null,null,null,null),null,null,null,null,null,null,null,null),new LayoutHint(true,null,null,null,null,null,null));
      }
      
      public function hover(param1:MouseEvent = undefined) : void
      {
         if(_backgroundGraphic != null)
         {
            _backgroundGraphic.alpha = enabled ? 0.5 : 0.4;
         }
      }
      
      public function hint(param1:String = undefined, param2:String = undefined, param3:Boolean = false) : CoCButton
      {
         var _loc4_:* = null as String;
         if(param1 == null)
         {
            param1 = "";
         }
         if(param2 == null)
         {
            param2 = "";
         }
         toolTipText = param1 != null ? Utils.cnName(param1) : "";
         if(param2 != null && param2 != "")
         {
            toolTipHeader = Utils.cnName(param2);
         }
         else
         {
            _loc4_ = get_labelText();
            if(_loc4_.indexOf(" x") != -1)
            {
               _loc4_ = _loc4_.split(" x")[0];
            }
            toolTipHeader = Utils.cnName(_loc4_);
         }
         if(!param3)
         {
            pushData();
         }
         return this;
      }
      
      public function hideIf(param1:Boolean) : CoCButton
      {
         if(param1)
         {
            visible = false;
         }
         return this;
      }
      
      public function hide() : CoCButton
      {
         visible = false;
         return this;
      }
      
      public function get_labelText() : String
      {
         return _labelField.text;
      }
      
      public function get_key2text() : String
      {
         if(_key2label == null)
         {
            return "";
         }
         return _key2label.text;
      }
      
      public function get_key1text() : String
      {
         if(_key1label == null)
         {
            return "";
         }
         return _key1label.text;
      }
      
      public function get_cornerText() : String
      {
         return _cornerField.text;
      }
      
      public function enable(param1:String = undefined, param2:Boolean = false) : CoCButton
      {
         set_enabled(true);
         if(param1 != null)
         {
            toolTipText = Utils.cnName(param1);
         }
         if(!param2)
         {
            pushData();
         }
         return this;
      }
      
      public function disableIf(param1:Boolean, param2:String = undefined, param3:Boolean = false) : CoCButton
      {
         if(param1)
         {
            set_enabled(false);
            if(param2 != null)
            {
               toolTipText = Utils.cnName(param2);
            }
         }
         if(!param3)
         {
            pushData();
         }
         return this;
      }
      
      public function disableEnable(param1:Boolean, param2:String = undefined, param3:Boolean = false) : CoCButton
      {
         set_enabled(!param1);
         if(param2 != null)
         {
            toolTipText = param1 ? Utils.cnName(param2) : Utils.cnName(toolTipText);
         }
         if(!param3)
         {
            pushData();
         }
         return this;
      }
      
      public function disable(param1:String = undefined, param2:Boolean = false) : CoCButton
      {
         set_enabled(false);
         if(param1 != null)
         {
            toolTipText = Utils.cnName(param1);
         }
         if(!param2)
         {
            pushData();
         }
         return this;
      }
      
      public function dim(param1:MouseEvent = undefined) : void
      {
         if(_backgroundGraphic != null)
         {
            _backgroundGraphic.alpha = enabled ? 1 : 0.4;
         }
      }
      
      public function click(param1:MouseEvent = undefined) : void
      {
         if(!enabled)
         {
            return;
         }
         dispatchEvent(new MouseEvent(MouseEvent.ROLL_OUT));
         if(preCallback != null)
         {
            preCallback(this);
         }
         if(callback != null)
         {
            callback();
         }
      }
      
      public function buttonData() : ButtonData
      {
         return new ButtonData(get_labelText(),callback,toolTipText,toolTipHeader,enabled,visible);
      }
      
      override public function addedToStage(param1:Event) : void
      {
         update(null);
         Theme.subscribe(this);
      }
   }
}

