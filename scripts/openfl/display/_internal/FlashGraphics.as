package openfl.display._internal
{
   import flash.display.BitmapData;
   import flash.display.Graphics;
   import flash.display.GraphicsBitmapFill;
   import flash.display.GraphicsEndFill;
   import flash.display.GraphicsGradientFill;
   import flash.display.GraphicsPath;
   import flash.display.GraphicsShaderFill;
   import flash.display.GraphicsSolidFill;
   import flash.display.GraphicsStroke;
   import flash.display.GraphicsTrianglePath;
   import flash.display.IGraphicsData;
   import flash.display.IGraphicsFill;
   import flash.geom.Matrix;
   import flash.geom.Rectangle;
   import flash.utils.Dictionary;
   import openfl._Vector.VectorDataIterator;
   import openfl.display.GraphicsQuadPath;
   
   public class FlashGraphics
   {
      
      public static var init__:Boolean;
      
      public static var bitmapFill:Dictionary;
      
      public static var tileRect:Rectangle;
      
      public static var tileTransform:Matrix;
      
      public static var __meta__:* = {"obj":{"SuppressWarnings":["checkstyle:FieldDocComment"]}};
      
      public function FlashGraphics()
      {
      }
      
      public static function drawGraphicsData(param1:Graphics, param2:Vector.<IGraphicsData>) : void
      {
         var _loc4_:* = null;
         var _loc5_:* = null as IGraphicsData;
         var _loc6_:* = null as GraphicsSolidFill;
         var _loc7_:* = null as GraphicsBitmapFill;
         var _loc8_:* = null as GraphicsGradientFill;
         var _loc9_:* = null as GraphicsShaderFill;
         var _loc10_:* = null as GraphicsStroke;
         var _loc11_:* = null as GraphicsPath;
         var _loc12_:* = null as GraphicsTrianglePath;
         var _loc13_:* = null as GraphicsQuadPath;
         var _loc14_:* = null as BitmapData;
         var _loc15_:* = null as String;
         var _loc16_:* = null as Array;
         var _loc17_:* = null as Array;
         var _loc18_:* = null as Array;
         var _loc19_:* = null as Matrix;
         var _loc20_:* = null as String;
         var _loc21_:* = null as String;
         var _loc22_:* = null as Object;
         var _loc3_:Boolean = false;
         if(param2 != null)
         {
            _loc4_ = new VectorDataIterator(param2);
            while(Boolean(_loc4_.hasNext()))
            {
               _loc5_ = _loc4_.next();
               if(_loc5_ is GraphicsQuadPath)
               {
                  _loc3_ = true;
                  break;
               }
            }
         }
         if(_loc3_)
         {
            _loc4_ = new VectorDataIterator(param2);
            while(Boolean(_loc4_.hasNext()))
            {
               _loc5_ = _loc4_.next();
               if(_loc5_ is GraphicsSolidFill)
               {
                  _loc6_ = _loc5_;
                  _loc14_ = null;
                  FlashGraphics.bitmapFill[param1] = _loc14_;
                  param1.beginFill(_loc6_.color,_loc6_.alpha);
               }
               else if(_loc5_ is GraphicsBitmapFill)
               {
                  _loc7_ = _loc5_;
                  _loc14_ = _loc7_.bitmapData;
                  FlashGraphics.bitmapFill[param1] = _loc14_;
                  param1.beginBitmapFill(_loc14_,_loc7_.matrix,_loc7_.repeat,_loc7_.smooth);
               }
               else if(_loc5_ is GraphicsGradientFill)
               {
                  _loc8_ = _loc5_;
                  _loc15_ = _loc8_.type;
                  _loc16_ = _loc8_.colors;
                  _loc17_ = _loc8_.alphas;
                  _loc18_ = _loc8_.ratios;
                  _loc19_ = _loc8_.matrix;
                  _loc20_ = _loc8_.spreadMethod;
                  _loc21_ = _loc8_.interpolationMethod;
                  _loc14_ = null;
                  FlashGraphics.bitmapFill[param1] = _loc14_;
                  param1.beginGradientFill(_loc15_,_loc16_,_loc17_,_loc18_,_loc19_,_loc20_,_loc21_,_loc8_.focalPointRatio);
               }
               else if(_loc5_ is GraphicsShaderFill)
               {
                  _loc9_ = _loc5_;
                  _loc14_ = null;
                  FlashGraphics.bitmapFill[param1] = _loc14_;
                  param1.beginShaderFill(_loc9_.shader,_loc9_.matrix);
               }
               else if(_loc5_ is GraphicsStroke)
               {
                  _loc10_ = _loc5_;
                  if(_loc10_.fill != null)
                  {
                     _loc22_ = _loc10_.thickness;
                     if(Boolean(Math.isNaN(_loc22_)))
                     {
                        _loc22_ = null;
                     }
                     if(_loc10_.fill is GraphicsSolidFill)
                     {
                        _loc6_ = _loc10_.fill;
                        param1.lineStyle(_loc22_,_loc6_.color,_loc6_.alpha,_loc10_.pixelHinting,_loc10_.scaleMode,_loc10_.caps,_loc10_.joints,_loc10_.miterLimit);
                     }
                     else if(_loc10_.fill is GraphicsBitmapFill)
                     {
                        _loc7_ = _loc10_.fill;
                        param1.lineStyle(_loc22_,0,1,_loc10_.pixelHinting,_loc10_.scaleMode,_loc10_.caps,_loc10_.joints,_loc10_.miterLimit);
                        param1.lineBitmapStyle(_loc7_.bitmapData,_loc7_.matrix,_loc7_.repeat,_loc7_.smooth);
                     }
                     else if(_loc10_.fill is GraphicsGradientFill)
                     {
                        _loc8_ = _loc10_.fill;
                        param1.lineStyle(_loc22_,0,1,_loc10_.pixelHinting,_loc10_.scaleMode,_loc10_.caps,_loc10_.joints,_loc10_.miterLimit);
                        param1.lineGradientStyle(_loc8_.type,_loc8_.colors,_loc8_.alphas,_loc8_.ratios,_loc8_.matrix,_loc8_.spreadMethod,_loc8_.interpolationMethod,_loc8_.focalPointRatio);
                     }
                     else if(_loc10_.fill is GraphicsShaderFill)
                     {
                        _loc9_ = _loc10_.fill;
                        param1.lineStyle(_loc22_,0,1,_loc10_.pixelHinting,_loc10_.scaleMode,_loc10_.caps,_loc10_.joints,_loc10_.miterLimit);
                        param1.lineShaderStyle(_loc9_.shader,_loc9_.matrix);
                     }
                  }
                  else
                  {
                     param1.lineStyle();
                  }
               }
               else if(_loc5_ is GraphicsPath)
               {
                  _loc11_ = _loc5_;
                  param1.drawPath(_loc11_.commands,_loc11_.data,_loc11_.winding);
               }
               else if(_loc5_ is GraphicsTrianglePath)
               {
                  _loc12_ = _loc5_;
                  param1.drawTriangles(_loc12_.vertices,_loc12_.indices,_loc12_.uvtData,_loc12_.culling);
               }
               else if(_loc5_ is GraphicsEndFill)
               {
                  _loc14_ = null;
                  FlashGraphics.bitmapFill[param1] = _loc14_;
                  param1.endFill();
               }
               else if(_loc5_ is GraphicsQuadPath)
               {
                  _loc13_ = _loc5_;
                  FlashGraphics.drawQuads(param1,_loc13_.rects,_loc13_.indices,_loc13_.transforms);
               }
            }
         }
         else
         {
            param1.drawGraphicsData(param2);
         }
      }
      
      public static function drawQuads(param1:Graphics, param2:Vector.<Number>, param3:Vector.<int>, param4:Vector.<Number>) : void
      {
         var _loc11_:int = 0;
         var _loc12_:int = 0;
         var _loc16_:* = null as Vector.<Number>;
         var _loc17_:* = null as Vector.<Number>;
         var _loc18_:* = null as Vector.<Number>;
         var _loc19_:int = 0;
         var _loc20_:int = 0;
         var _loc21_:int = 0;
         var _loc25_:* = null as Vector.<int>;
         var _loc26_:* = null as Vector.<int>;
         var _loc27_:* = null as Vector.<int>;
         var _loc31_:* = null as Vector.<Number>;
         var _loc32_:* = null as Vector.<Number>;
         var _loc33_:Number = NaN;
         var _loc34_:Number = NaN;
         var _loc35_:Number = NaN;
         var _loc36_:Number = NaN;
         var _loc37_:Number = NaN;
         var _loc38_:Number = NaN;
         var _loc39_:Number = NaN;
         var _loc40_:Number = NaN;
         var _loc47_:int = 0;
         var _loc48_:int = 0;
         var _loc49_:Number = NaN;
         var _loc5_:BitmapData = FlashGraphics.bitmapFill[param1];
         if(param2 == null || int(param2.length) == 0)
         {
            return;
         }
         var _loc6_:Rectangle = _loc5_ != null ? _loc5_.rect : null;
         var _loc7_:Boolean = param3 != null;
         var _loc8_:Boolean = false;
         var _loc9_:Boolean = false;
         var _loc10_:int = _loc7_ ? int(param3.length) : int(Math.floor(int(param2.length) / 4));
         if(_loc10_ == 0)
         {
            return;
         }
         if(param4 != null)
         {
            if(int(param4.length) >= _loc10_ * 6)
            {
               _loc8_ = true;
               _loc9_ = true;
            }
            else if(int(param4.length) >= _loc10_ * 4)
            {
               _loc8_ = true;
            }
            else if(int(param4.length) >= _loc10_ * 2)
            {
               _loc9_ = true;
            }
         }
         var _loc13_:Object = _loc10_ * 8;
         var _loc14_:Object = null;
         var _loc15_:Array = null;
         if(_loc15_ != null)
         {
            if(_loc15_ == null)
            {
               _loc17_ = null;
            }
            else
            {
               _loc18_ = new Vector.<Number>();
               _loc19_ = 0;
               _loc20_ = int(_loc15_.length);
               while(_loc19_ < _loc20_)
               {
                  _loc21_ = _loc19_++;
                  _loc18_[_loc21_] = Number(_loc15_[_loc21_]);
               }
               _loc17_ = _loc18_;
            }
            _loc16_ = _loc17_;
         }
         else
         {
            if(_loc13_ == null)
            {
               _loc13_ = 0;
            }
            if(_loc14_ == null)
            {
               _loc14_ = false;
            }
            _loc16_ = new Vector.<Number>(_loc13_,_loc14_);
         }
         _loc17_ = _loc16_;
         var _loc22_:Object = _loc10_ * 6;
         var _loc23_:Object = null;
         var _loc24_:Array = null;
         if(_loc24_ != null)
         {
            if(_loc24_ == null)
            {
               _loc26_ = null;
            }
            else
            {
               _loc27_ = new Vector.<int>();
               _loc19_ = 0;
               _loc20_ = int(_loc24_.length);
               while(_loc19_ < _loc20_)
               {
                  _loc21_ = _loc19_++;
                  _loc27_[_loc21_] = int(_loc24_[_loc21_]);
               }
               _loc26_ = _loc27_;
            }
            _loc25_ = _loc26_;
         }
         else
         {
            if(_loc22_ == null)
            {
               _loc22_ = 0;
            }
            if(_loc23_ == null)
            {
               _loc23_ = false;
            }
            _loc25_ = new Vector.<int>(_loc22_,_loc23_);
         }
         _loc26_ = _loc25_;
         var _loc28_:Object = _loc10_ * 8;
         var _loc29_:Object = null;
         var _loc30_:Array = null;
         if(_loc30_ != null)
         {
            if(_loc30_ == null)
            {
               _loc31_ = null;
            }
            else
            {
               _loc32_ = new Vector.<Number>();
               _loc19_ = 0;
               _loc20_ = int(_loc30_.length);
               while(_loc19_ < _loc20_)
               {
                  _loc21_ = _loc19_++;
                  _loc32_[_loc21_] = Number(_loc30_[_loc21_]);
               }
               _loc31_ = _loc32_;
            }
            _loc18_ = _loc31_;
         }
         else
         {
            if(_loc28_ == null)
            {
               _loc28_ = 0;
            }
            if(_loc29_ == null)
            {
               _loc29_ = false;
            }
            _loc18_ = new Vector.<Number>(_loc28_,_loc29_);
         }
         _loc31_ = _loc18_;
         _loc19_ = 0;
         _loc20_ = 0;
         _loc21_ = 0;
         var _loc41_:Number = 0;
         var _loc42_:Number = 0;
         var _loc43_:Number = 1;
         var _loc44_:Number = 1;
         var _loc45_:int = 0;
         var _loc46_:int = _loc10_;
         while(_loc45_ < _loc46_)
         {
            _loc47_ = _loc45_++;
            _loc11_ = _loc7_ ? param3[_loc47_] * 4 : _loc47_ * 4;
            if(_loc11_ >= 0)
            {
               FlashGraphics.tileRect.setTo(param2[_loc11_],param2[_loc11_ + 1],param2[_loc11_ + 2],param2[_loc11_ + 3]);
               if(!(FlashGraphics.tileRect.width <= 0 || FlashGraphics.tileRect.height <= 0))
               {
                  if(_loc8_ && _loc9_)
                  {
                     _loc12_ = _loc47_ * 6;
                     FlashGraphics.tileTransform.setTo(param4[_loc12_],param4[_loc12_ + 1],param4[_loc12_ + 2],param4[_loc12_ + 3],param4[_loc12_ + 4],param4[_loc12_ + 5]);
                  }
                  else if(_loc8_)
                  {
                     _loc12_ = _loc47_ * 4;
                     FlashGraphics.tileTransform.setTo(param4[_loc12_],param4[_loc12_ + 1],param4[_loc12_ + 2],param4[_loc12_ + 3],FlashGraphics.tileRect.x,FlashGraphics.tileRect.y);
                  }
                  else if(_loc9_)
                  {
                     _loc12_ = _loc47_ * 2;
                     FlashGraphics.tileTransform.tx = param4[_loc12_];
                     FlashGraphics.tileTransform.ty = param4[_loc12_ + 1];
                  }
                  else
                  {
                     FlashGraphics.tileTransform.tx = FlashGraphics.tileRect.x;
                     FlashGraphics.tileTransform.ty = FlashGraphics.tileRect.y;
                  }
                  _loc35_ = FlashGraphics.tileRect.width;
                  _loc36_ = FlashGraphics.tileRect.height;
                  _loc37_ = FlashGraphics.tileTransform.a;
                  _loc38_ = FlashGraphics.tileTransform.b;
                  _loc39_ = FlashGraphics.tileTransform.c;
                  _loc40_ = FlashGraphics.tileTransform.d;
                  _loc33_ = FlashGraphics.tileTransform.tx;
                  _loc34_ = FlashGraphics.tileTransform.ty;
                  _loc17_[_loc21_] = _loc33_;
                  _loc17_[_loc21_ + 1] = _loc34_;
                  _loc17_[_loc21_ + 2] = _loc33_ + _loc35_ * _loc37_;
                  _loc17_[_loc21_ + 3] = _loc34_ + _loc35_ * _loc38_;
                  _loc17_[_loc21_ + 4] = _loc33_ + _loc36_ * _loc39_;
                  _loc17_[_loc21_ + 5] = _loc34_ + _loc36_ * _loc40_;
                  _loc17_[_loc21_ + 6] = _loc33_ + _loc35_ * _loc37_ + _loc36_ * _loc39_;
                  _loc17_[_loc21_ + 7] = _loc34_ + _loc35_ * _loc38_ + _loc36_ * _loc40_;
                  _loc26_[_loc20_] = _loc19_;
                  _loc26_[_loc20_ + 1] = _loc26_[_loc20_ + 3] = 1 + _loc19_;
                  _loc26_[_loc20_ + 2] = _loc26_[_loc20_ + 5] = 2 + _loc19_;
                  _loc26_[_loc20_ + 4] = 3 + _loc19_;
                  if(_loc6_ != null)
                  {
                     _loc41_ = FlashGraphics.tileRect.x / _loc6_.width;
                     _loc42_ = FlashGraphics.tileRect.y / _loc6_.height;
                     _loc43_ = FlashGraphics.tileRect.right / _loc6_.width;
                     _loc44_ = FlashGraphics.tileRect.bottom / _loc6_.height;
                     _loc31_[_loc21_] = _loc31_[_loc21_ + 4] = _loc41_;
                     _loc31_[_loc21_ + 1] = _loc31_[_loc21_ + 3] = _loc42_;
                     _loc31_[_loc21_ + 2] = _loc31_[_loc21_ + 6] = _loc43_;
                     _loc31_[_loc21_ + 5] = _loc31_[_loc21_ + 7] = _loc44_;
                  }
                  _loc19_ += 4;
                  _loc20_ += 6;
                  _loc21_ += 8;
               }
            }
         }
         if(_loc6_ != null)
         {
            param1.drawTriangles(_loc17_,_loc26_,_loc31_);
         }
         else
         {
            param1.drawTriangles(_loc17_,_loc26_);
         }
      }
   }
}

