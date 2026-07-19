package coc.view
{
   import flash.Boot;
   import flash.display.Bitmap;
   import flash.display.BitmapData;
   import flash.display.Graphics;
   import flash.display.Sprite;
   import flash.geom.Matrix;
   import openfl.display._internal.FlashGraphics;
   
   public class BitmapDataSprite extends Sprite
   {
      
      public var _width:Number;
      
      public var _stretch:Boolean;
      
      public var _smooth:Boolean;
      
      public var _repeat:Boolean;
      
      public var _height:Number;
      
      public var _fillColor:uint;
      
      public var _bitmap:Bitmap;
      
      public function BitmapDataSprite(param1:Bitmap = undefined, param2:Class = undefined, param3:Boolean = false, param4:Number = 0, param5:Number = 0, param6:Number = 0, param7:Number = 0, param8:Boolean = false, param9:String = undefined, param10:int = 0, param11:Boolean = false, param12:Number = 1, param13:Boolean = true)
      {
         if(param9 == null)
         {
            param9 = "";
         }
         if(Boot.skip_constructor)
         {
            return;
         }
         _smooth = false;
         _repeat = false;
         _stretch = false;
         _height = 0;
         _width = 0;
         _fillColor = 0;
         _bitmap = null;
         super();
         if(param1 != null)
         {
            set_bitmap(param1);
         }
         else
         {
            set_bitmapClass(param2);
         }
         set_stretch(param3);
         x = param4;
         y = param5;
         if(param7 > 0 || param6 > 0)
         {
            setSize(param7,param6);
         }
         set_smooth(param8);
         name = param9;
         set_fillColor(param10);
         set_repeat(param11);
         alpha = param12;
         visible = param13;
      }
      
      public function set_width(param1:Number) : Number
      {
         setSize(param1,_height);
         return param1;
      }
      
      override public function set width(param1:Number) : void
      {
         set_width(param1);
      }
      
      public function set_stretch(param1:Boolean) : Boolean
      {
         if(_stretch == param1)
         {
            return param1;
         }
         _stretch = param1;
         redraw();
         return param1;
      }
      
      public function set_smooth(param1:Boolean) : Boolean
      {
         if(_smooth == param1)
         {
            return param1;
         }
         _smooth = param1;
         redraw();
         return param1;
      }
      
      public function set_repeat(param1:Boolean) : Boolean
      {
         if(_repeat == param1)
         {
            return param1;
         }
         _repeat = param1;
         redraw();
         return param1;
      }
      
      public function set_height(param1:Number) : Number
      {
         setSize(_width,param1);
         return param1;
      }
      
      override public function set height(param1:Number) : void
      {
         set_height(param1);
      }
      
      public function set_fillColor(param1:uint) : uint
      {
         if(_fillColor == param1)
         {
            return param1;
         }
         _fillColor = param1;
         redraw();
         return param1;
      }
      
      public function set_bitmapClass(param1:Class) : Class
      {
         if(param1 != null)
         {
            set_bitmap(new Bitmap(Type.createInstance(param1,[0,0])));
         }
         else
         {
            set_bitmap(null);
         }
         return param1;
      }
      
      public function set_bitmap(param1:Bitmap) : Bitmap
      {
         if(_bitmap == param1)
         {
            return param1;
         }
         _bitmap = param1;
         if(param1 != null)
         {
            if(_width == 0 || !get_stretch() && !get_repeat())
            {
               _width = param1.width;
            }
            if(_height == 0 || !get_stretch() && !get_repeat())
            {
               _height = param1.height;
            }
         }
         redraw();
         return param1;
      }
      
      public function setSize(param1:Number, param2:Number) : void
      {
         _width = param1;
         _height = param2;
         redraw();
         super.width = param1;
         super.height = param2;
      }
      
      public function redraw() : void
      {
         var _loc1_:* = null as BitmapData;
         var _loc2_:* = null as Matrix;
         var _loc3_:* = null as Graphics;
         var _loc4_:Boolean = false;
         var _loc5_:Boolean = false;
         var _loc6_:* = null as BitmapData;
         graphics.clear();
         if(get_bitmap() != null)
         {
            _loc1_ = get_bitmap().bitmapData;
            if(get_stretch())
            {
               _loc2_ = new Matrix();
               _loc2_.scale(_width / get_bitmap().width,_height / get_bitmap().height);
               _loc3_ = graphics;
               _loc4_ = get_smooth();
               FlashGraphics.bitmapFill[_loc3_] = _loc1_;
               _loc3_.beginBitmapFill(_loc1_,_loc2_,false,_loc4_);
            }
            else
            {
               _loc3_ = graphics;
               _loc2_ = null;
               _loc4_ = get_repeat();
               _loc5_ = get_smooth();
               FlashGraphics.bitmapFill[_loc3_] = _loc1_;
               _loc3_.beginBitmapFill(_loc1_,_loc2_,_loc4_,_loc5_);
            }
            graphics.drawRect(0,0,_width,_height);
            _loc3_ = graphics;
            _loc6_ = null;
            FlashGraphics.bitmapFill[_loc3_] = _loc6_;
            _loc3_.endFill();
         }
         else
         {
            _loc3_ = graphics;
            _loc1_ = null;
            FlashGraphics.bitmapFill[_loc3_] = _loc1_;
            _loc3_.beginFill(_fillColor,1);
            graphics.drawRect(0,0,_width,_height);
            _loc3_ = graphics;
            _loc1_ = null;
            FlashGraphics.bitmapFill[_loc3_] = _loc1_;
            _loc3_.endFill();
         }
      }
      
      public function get_stretch() : Boolean
      {
         return _stretch;
      }
      
      public function get_smooth() : Boolean
      {
         return _smooth;
      }
      
      public function get_repeat() : Boolean
      {
         return _repeat;
      }
      
      public function get_fillColor() : uint
      {
         return _fillColor;
      }
      
      public function get_bitmapClass() : Class
      {
         return null;
      }
      
      public function get_bitmap() : Bitmap
      {
         return _bitmap;
      }
   }
}

