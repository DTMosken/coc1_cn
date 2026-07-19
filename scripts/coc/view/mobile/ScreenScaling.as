package coc.view.mobile
{
   import flash.display.Stage;
   import flash.geom.Rectangle;
   
   public class ScreenScaling
   {
      
      public static var _stage:Stage;
      
      public static var _debug_localEmu:Boolean = false;
      
      public function ScreenScaling()
      {
      }
      
      public static function init(param1:Stage) : void
      {
         ScreenScaling._stage = param1;
         ScreenScaling._debug_localEmu = true;
      }
      
      public static function get_screenWidth() : Number
      {
         if(ScreenScaling._debug_localEmu)
         {
            return ScreenScaling._stage.stageWidth;
         }
         return AIRWrapper.getVisibleBounds(ScreenScaling._stage).width;
      }
      
      public static function get_screenHeight() : Number
      {
         if(ScreenScaling._debug_localEmu)
         {
            return ScreenScaling._stage.stageHeight;
         }
         return AIRWrapper.getVisibleBounds(ScreenScaling._stage).height;
      }
      
      public static function get_fullScreenHeight() : Number
      {
         if(ScreenScaling._debug_localEmu)
         {
            return ScreenScaling._stage.stageHeight;
         }
         return ScreenScaling._stage.fullScreenHeight;
      }
      
      public static function get_fullScreenWidth() : Number
      {
         if(ScreenScaling._debug_localEmu)
         {
            return ScreenScaling._stage.fullScreenWidth;
         }
         return ScreenScaling._stage.fullScreenWidth;
      }
      
      public static function safeBounds() : Rectangle
      {
         var _loc7_:* = null as Rectangle;
         if(AIRWrapper.getVisibleBounds(ScreenScaling._stage).x > 0 || AIRWrapper.getVisibleBounds(ScreenScaling._stage).y > 0)
         {
            return new Rectangle(0,0,ScreenScaling.get_screenWidth(),ScreenScaling.get_screenHeight());
         }
         var _loc1_:Array = AIRWrapper.get_displayCutoutRects();
         var _loc2_:int = 0;
         var _loc3_:int = 0;
         var _loc4_:int = int(ScreenScaling.get_screenWidth());
         var _loc5_:int = int(ScreenScaling.get_screenHeight());
         var _loc6_:int = 0;
         while(_loc6_ < int(_loc1_.length))
         {
            _loc7_ = _loc1_[_loc6_];
            _loc6_++;
            if(ScreenScaling.get_orientation() == "default" || ScreenScaling.get_orientation() == "upsideDown")
            {
               if(_loc7_.height >= ScreenScaling.get_screenHeight())
               {
                  if(_loc7_.x == 0)
                  {
                     _loc2_ = int(Math.max(_loc2_,_loc7_.width));
                  }
                  if(_loc7_.x + _loc7_.width >= ScreenScaling.get_screenWidth())
                  {
                     _loc4_ = int(Math.min(_loc4_,_loc7_.x));
                  }
               }
               else
               {
                  if(_loc7_.y == 0)
                  {
                     _loc3_ = int(Math.max(_loc3_,_loc7_.height));
                  }
                  if(_loc7_.y + _loc7_.height >= ScreenScaling.get_screenHeight())
                  {
                     _loc5_ = int(Math.min(_loc5_,_loc7_.y));
                  }
               }
            }
            else if(_loc7_.width >= ScreenScaling.get_screenWidth())
            {
               if(_loc7_.y == 0)
               {
                  _loc3_ = int(Math.max(_loc3_,_loc7_.height));
               }
               if(_loc7_.y + _loc7_.height >= ScreenScaling.get_screenHeight())
               {
                  _loc5_ = int(Math.min(_loc5_,_loc7_.y));
               }
            }
            else
            {
               if(_loc7_.x == 0)
               {
                  _loc2_ = int(Math.max(_loc2_,_loc7_.width));
               }
               if(_loc7_.x + _loc7_.width >= ScreenScaling.get_screenWidth())
               {
                  _loc4_ = int(Math.min(_loc4_,_loc7_.x));
               }
            }
         }
         return new Rectangle(_loc2_,_loc3_,_loc4_ - _loc2_,_loc5_ - _loc3_);
      }
      
      public static function get_orientation() : String
      {
         return AIRWrapper.getOrientation(ScreenScaling._stage);
      }
   }
}

