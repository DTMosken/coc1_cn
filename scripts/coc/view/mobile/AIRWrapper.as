package coc.view.mobile
{
   import flash.display.Stage;
   import flash.geom.Rectangle;
   
   public class AIRWrapper
   {
      
      public static var DEFAULT:String = "default";
      
      public static var ROTATED_RIGHT:String = "rotatedRight";
      
      public static var ROTATED_LEFT:String = "rotatedLeft";
      
      public static var UPSIDE_DOWN:String = "upsideDown";
      
      public static var UNKNOWN:String = "unknown";
      
      public function AIRWrapper()
      {
      }
      
      public static function removeOrientationEventListener(param1:Stage) : void
      {
      }
      
      public static function getKeyboardY() : Number
      {
         return 0;
      }
      
      public static function setCutouts(param1:Boolean) : void
      {
      }
      
      public static function get_displayCutoutRects() : Array
      {
         return [];
      }
      
      public static function getOrientation(param1:Stage) : String
      {
         if(param1.stageWidth >= param1.stageHeight)
         {
            return "rotatedRight";
         }
         return "default";
      }
      
      public static function getVisibleBounds(param1:Stage) : Rectangle
      {
         return new Rectangle(param1.x,param1.y,param1.width,param1.height);
      }
   }
}

