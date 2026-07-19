package coc.view
{
   import flash.Boot;
   import flash.display.BitmapData;
   import flash.display.DisplayObject;
   import flash.display.Graphics;
   import flash.display.Sprite;
   import flash.events.Event;
   import flash.filters.DropShadowFilter;
   import flash.text.TextField;
   import haxe.IMap;
   import haxe.Timer;
   import haxe.ds.ObjectMap;
   import openfl.display._internal.FlashGraphics;
   
   public class Block extends Sprite
   {
      
      public static var ON_LAYOUT:String = "coc&layout";
      
      public var explicitWidth:Number;
      
      public var explicitHeight:Number;
      
      public var _layoutHints:IMap;
      
      public var _layoutConfig:LayoutConfig;
      
      public var _dirty:Boolean;
      
      public var _container:Sprite;
      
      public function Block(param1:LayoutConfig = undefined, param2:Number = 0, param3:Number = 0, param4:Number = 0, param5:Number = 0, param6:String = undefined)
      {
         if(param6 == null)
         {
            param6 = "";
         }
         if(Boot.skip_constructor)
         {
            return;
         }
         explicitHeight = 0;
         explicitWidth = 0;
         _dirty = false;
         _layoutHints = new ObjectMap();
         super();
         if(param1 == null)
         {
            _layoutConfig = new LayoutConfig(null,null,null,null,null,null,null,null);
         }
         else
         {
            _layoutConfig = param1;
         }
         x = param2;
         y = param3;
         set_width(param4);
         set_height(param5);
         if(param6 != "")
         {
            name = param6;
         }
         _container = new Sprite();
         addChild(_container);
         addEventListener(Event.ADDED_TO_STAGE,addedToStage);
         invalidateLayout();
      }
      
      public function unscaledResize(param1:Number, param2:Number) : void
      {
         super.width = param1;
         super.height = param2;
         explicitWidth = param1;
         explicitHeight = param2;
         scaleX = 1;
         scaleY = 1;
         resize();
         scaleX = 1;
         scaleY = 1;
      }
      
      public function set_width(param1:Number) : Number
      {
         if(get_width() != param1)
         {
            explicitWidth = param1;
            resize();
         }
         return param1;
      }
      
      override public function set width(param1:Number) : void
      {
         set_width(param1);
      }
      
      public function set_layoutConfig(param1:LayoutConfig) : LayoutConfig
      {
         _layoutConfig = param1;
         invalidateLayout();
         return param1;
      }
      
      public function set_height(param1:Number) : Number
      {
         if(get_height() != param1)
         {
            explicitHeight = param1;
            resize();
         }
         return param1;
      }
      
      override public function set height(param1:Number) : void
      {
         set_height(param1);
      }
      
      public function resize() : void
      {
         var _loc1_:* = null as Graphics;
         var _loc2_:* = null as BitmapData;
         if(get_width() > 0 || get_height() > 0)
         {
            graphics.clear();
            _loc1_ = graphics;
            _loc2_ = null;
            FlashGraphics.bitmapFill[_loc1_] = _loc2_;
            _loc1_.beginFill(0,0);
            graphics.drawRect(0,0,get_width(),get_height());
            _loc1_ = graphics;
            _loc2_ = null;
            FlashGraphics.bitmapFill[_loc1_] = _loc2_;
            _loc1_.endFill();
         }
         if(get_width() > 0 && get_height() > 0)
         {
            super.width = get_width() + Math.max(0,-get_xmin());
            super.height = get_height() + Math.max(0,-get_ymin());
         }
      }
      
      public function removeElements() : void
      {
         _container.removeChildren();
      }
      
      public function removeElement(param1:DisplayObject) : void
      {
         _container.removeChild(param1);
         if(_layoutHints[param1] != null)
         {
            _layoutHints.remove(param1);
         }
         invalidateLayout();
      }
      
      public function maybeDoLayout() : void
      {
         if(_dirty)
         {
            doLayout();
         }
      }
      
      public function layElement(param1:DisplayObject, param2:LayoutHint) : Block
      {
         _layoutHints[param1] = param2;
         invalidateLayout();
         return this;
      }
      
      public function invalidateLayout() : void
      {
         if(!_dirty)
         {
            _dirty = true;
            Timer.delay(maybeDoLayout,1);
         }
      }
      
      public function get_ymin() : Number
      {
         var _loc2_:int = 0;
         var _loc3_:int = 0;
         var _loc1_:Number = 0;
         if(_container != null)
         {
            _loc2_ = 0;
            _loc3_ = get_numElements();
            while(_loc2_ < _loc3_)
            {
               _loc1_ = Math.min(_loc1_,getElementAt(_loc2_).y);
               _loc2_++;
            }
         }
         return _loc1_;
      }
      
      public function get_xmin() : Number
      {
         var _loc2_:int = 0;
         var _loc3_:int = 0;
         var _loc1_:Number = 0;
         if(_container != null)
         {
            _loc2_ = 0;
            _loc3_ = get_numElements();
            while(_loc2_ < _loc3_)
            {
               _loc1_ = Math.min(_loc1_,getElementAt(_loc2_).x);
               _loc2_++;
            }
         }
         return _loc1_;
      }
      
      public function get_width() : Number
      {
         if(explicitWidth > 0)
         {
            return explicitWidth;
         }
         return super.width - get_xmin();
      }
      
      override public function get width() : Number
      {
         return get_width();
      }
      
      public function get_paddingTop() : Number
      {
         if(_layoutConfig.paddingTop == null)
         {
            return _layoutConfig.padding;
         }
         return _layoutConfig.paddingTop;
      }
      
      public function get_paddingRight() : Number
      {
         if(_layoutConfig.paddingRight == null)
         {
            return _layoutConfig.padding;
         }
         return _layoutConfig.paddingRight;
      }
      
      public function get_paddingLeft() : Number
      {
         if(_layoutConfig.paddingLeft == null)
         {
            return _layoutConfig.padding;
         }
         return _layoutConfig.paddingLeft;
      }
      
      public function get_paddingCenter() : Number
      {
         if(_layoutConfig.paddingCenter == null)
         {
            return 0;
         }
         return _layoutConfig.paddingCenter;
      }
      
      public function get_paddingBottom() : Number
      {
         if(_layoutConfig.paddingBottom == null)
         {
            return _layoutConfig.padding;
         }
         return _layoutConfig.paddingBottom;
      }
      
      public function get_numElements() : int
      {
         return _container.numChildren;
      }
      
      public function get_layoutConfig() : LayoutConfig
      {
         return _layoutConfig;
      }
      
      public function get_innerWidth() : Number
      {
         return Math.max(0,(get_width() > 0 ? get_width() : explicitWidth) - get_paddingLeft() - get_paddingRight());
      }
      
      public function get_innerHeight() : Number
      {
         return Math.max(0,(get_height() > 0 ? get_height() : explicitHeight) - get_paddingTop() - get_paddingBottom());
      }
      
      public function get_height() : Number
      {
         if(explicitHeight > 0)
         {
            return explicitHeight;
         }
         return super.height - get_ymin();
      }
      
      override public function get height() : Number
      {
         return get_height();
      }
      
      public function getElementIndex(param1:DisplayObject) : int
      {
         return _container.getChildIndex(param1);
      }
      
      public function getElementByName(param1:String) : DisplayObject
      {
         return _container.getChildByName(param1);
      }
      
      public function getElementAt(param1:int) : DisplayObject
      {
         return _container.getChildAt(param1);
      }
      
      public function doLayout() : void
      {
         var _loc2_:* = null as FlowDirection;
         var _loc3_:* = null as Object;
         var _loc4_:* = null as Object;
         var _loc5_:int = 0;
         var _loc6_:int = 0;
         _dirty = false;
         var _loc1_:LayoutType = _layoutConfig.type;
         switch(_loc1_.index)
         {
            case 1:
               _loc2_ = _loc1_.params[0];
               _loc3_ = _loc1_.params[1];
               _loc4_ = _loc1_.params[2];
               applyFlowLayout(_loc2_,_loc3_,_loc4_);
               break;
            case 2:
               _loc5_ = int(_loc1_.params[0]);
               _loc6_ = int(_loc1_.params[1]);
               _loc3_ = _loc1_.params[2];
               _loc4_ = _loc1_.params[3];
               applyGridLayout(_loc5_,_loc6_,_loc3_,_loc4_);
         }
         dispatchEvent(new Event("coc&layout",true,true));
      }
      
      public function applyShadow() : void
      {
         if(int(filters.length) > 0)
         {
            return;
         }
         var _loc1_:DropShadowFilter = new DropShadowFilter();
         _container.filters.push(_loc1_);
      }
      
      public function applyGridLayout(param1:int, param2:int, param3:Boolean = false, param4:Boolean = false) : void
      {
         var _loc17_:int = 0;
         var _loc18_:* = null as DisplayObject;
         var _loc19_:* = null as LayoutHint;
         var _loc20_:* = null as Object;
         var _loc21_:* = null as Object;
         var _loc5_:LayoutConfig = _layoutConfig;
         var _loc6_:Object = _loc5_.ignoreHidden != null && Boolean(_loc5_.ignoreHidden);
         var _loc7_:Number = get_innerWidth();
         var _loc8_:Number = get_innerHeight();
         var _loc9_:Number = (_loc7_ - get_paddingCenter() * (param2 - 1)) / param2;
         var _loc10_:Number = (_loc8_ - get_paddingCenter() * (param1 - 1)) / param1;
         var _loc11_:Boolean = param3;
         var _loc12_:Boolean = param4;
         var _loc13_:int = 0;
         var _loc14_:int = 0;
         var _loc15_:int = 0;
         var _loc16_:int = _container.numChildren;
         while(_loc15_ < _loc16_)
         {
            _loc17_ = _loc15_++;
            _loc18_ = _container.getChildAt(_loc17_);
            _loc19_ = _layoutHints[_loc18_];
            if(_loc19_ == null)
            {
               _loc19_ = new LayoutHint(null,null,null,null,null,null,null);
            }
            if(!(_loc19_.ignore || !_loc18_.visible && Boolean(_loc6_)))
            {
               _loc20_ = _loc19_.setWidth != null ? _loc19_.setWidth : _loc11_;
               _loc21_ = _loc19_.setHeight != null ? _loc19_.setHeight : _loc12_;
               if(_loc19_.row != null && _loc19_.col != null)
               {
                  _loc13_ = int(_loc19_.row);
                  _loc14_ = int(_loc19_.col);
               }
               _loc18_.x = get_paddingLeft() + _loc14_ * (get_paddingCenter() + _loc9_);
               _loc18_.y = get_paddingTop() + _loc13_ * (get_paddingCenter() + _loc10_);
               if(_loc20_)
               {
                  _loc18_.width = _loc9_;
               }
               if(_loc21_)
               {
                  _loc18_.height = _loc10_;
               }
               if(++_loc14_ >= param2)
               {
                  _loc14_ = 0;
                  _loc13_++;
               }
            }
         }
      }
      
      public function applyFlowLayout(param1:FlowDirection = undefined, param2:int = 2, param3:Boolean = false) : void
      {
         var _loc12_:int = 0;
         var _loc13_:* = null as DisplayObject;
         var _loc14_:* = null as LayoutHint;
         var _loc15_:int = 0;
         var _loc16_:int = 0;
         if(param1 == null)
         {
            param1 = FlowDirection.Row;
         }
         var _loc4_:LayoutConfig = _layoutConfig;
         var _loc5_:Object = _loc4_.ignoreHidden != null ? _loc4_.ignoreHidden : true;
         var _loc6_:int = 0;
         var _loc7_:FlowDirection = param1;
         var _loc8_:Number = get_paddingLeft();
         var _loc9_:Number = get_paddingTop();
         var _loc10_:int = 0;
         var _loc11_:int = _container.numChildren;
         while(_loc10_ < _loc11_)
         {
            _loc12_ = _loc10_++;
            _loc13_ = _container.getChildAt(_loc12_);
            _loc14_ = _layoutHints[_loc13_];
            if(_loc14_ == null)
            {
               _loc14_ = new LayoutHint(null,null,null,null,null,null,null);
            }
            if(_loc14_.ignore || !_loc13_.visible && Boolean(_loc5_))
            {
               continue;
            }
            _loc15_ = _loc14_.before;
            _loc16_ = _loc14_.after;
            switch(_loc7_.index)
            {
               case 0:
                  _loc8_ += _loc15_;
                  if(param3)
                  {
                     _loc6_ = int(Math.max(_loc13_.height,_loc6_));
                     if(_loc8_ + _loc13_.width > explicitWidth)
                     {
                        _loc9_ += _loc6_ + param2;
                        _loc8_ = _loc15_ + get_paddingLeft();
                        _loc6_ = 0;
                     }
                  }
                  _loc13_.x = _loc8_;
                  _loc13_.y = _loc9_;
                  _loc8_ += _loc13_.width + _loc16_ + param2;
                  break;
               case 1:
                  _loc9_ += _loc15_;
                  if(param3)
                  {
                     _loc6_ = int(Math.max(_loc13_.width,_loc6_));
                     if(_loc9_ + _loc13_.height > explicitHeight)
                     {
                        _loc8_ += _loc6_ + param2;
                        _loc9_ = _loc15_ + get_paddingTop();
                        _loc6_ = 0;
                     }
                  }
                  _loc13_.x = _loc8_;
                  _loc13_.y = _loc9_;
                  _loc9_ += _loc13_.height + _loc16_ + param2;
            }
         }
      }
      
      public function addedToStage(param1:Event) : void
      {
      }
      
      public function addTextField(param1:TextFieldParameters, param2:LayoutHint = undefined) : TextField
      {
         var _loc3_:TextField = new TextField();
         _loc3_.antiAliasType = "advanced";
         if(param1.defaultTextFormat != null)
         {
            _loc3_.defaultTextFormat = param1.defaultTextFormat;
         }
         if(param1.width == 0 && param1.height == 0)
         {
            _loc3_.autoSize = "left";
         }
         else
         {
            if(param1.width > 0)
            {
               _loc3_.width = param1.width;
            }
            if(param1.height > 0)
            {
               _loc3_.height = param1.height;
            }
         }
         if(param1.text != "")
         {
            _loc3_.text = param1.text;
         }
         else if(param1.htmlText != "")
         {
            _loc3_.htmlText = param1.htmlText;
         }
         _loc3_.type = param1.type;
         _loc3_.embedFonts = param1.embedFonts;
         _loc3_.x = param1.x;
         _loc3_.y = param1.y;
         _loc3_.textColor = param1.textColor;
         _loc3_.wordWrap = param1.wordWrap;
         _loc3_.multiline = param1.multiline;
         _loc3_.mouseEnabled = param1.mouseEnabled || param1.type == "input";
         _loc3_.backgroundColor = param1.backgroundColor;
         _loc3_.background = param1.background;
         _loc3_.border = param1.border;
         _loc3_.visible = param1.visible;
         addElement(_loc3_,param2);
         return _loc3_;
      }
      
      public function addElementAt(param1:DisplayObject, param2:int, param3:LayoutHint = undefined) : DisplayObject
      {
         _container.addChildAt(param1,param2);
         layElement(param1,param3);
         return param1;
      }
      
      public function addElement(param1:DisplayObject, param2:LayoutHint = undefined) : DisplayObject
      {
         _container.addChild(param1);
         layElement(param1,param2);
         return param1;
      }
      
      public function addBitmapDataSprite(param1:BitmapDataSprite, param2:LayoutHint = undefined) : BitmapDataSprite
      {
         addElement(param1,param2);
         return param1;
      }
   }
}

