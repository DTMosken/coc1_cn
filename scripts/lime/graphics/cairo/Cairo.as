package lime.graphics.cairo
{
   import flash.Boot;
   import lime.math.Vector2;
   import lime.utils.ArrayBufferView;
   
   public class Cairo
   {
      
      public static var version:int;
      
      public static var versionString:String;
      
      public var userData:*;
      
      public var target:*;
      
      public var handle:*;
      
      public function Cairo(param1:* = undefined)
      {
         if(Boot.skip_constructor)
         {
            return;
         }
         var _loc2_:Boolean = param1 != null;
      }
      
      public static function get_version() : int
      {
         return 0;
      }
      
      public static function get_versionString() : String
      {
         return "";
      }
      
      public function translate(param1:Number, param2:Number) : void
      {
      }
      
      public function transform(param1:ArrayBufferView) : void
      {
      }
      
      public function textPath(param1:String) : void
      {
      }
      
      public function strokePreserve() : void
      {
      }
      
      public function strokeExtents(param1:Number, param2:Number, param3:Number, param4:Number) : void
      {
      }
      
      public function stroke() : void
      {
      }
      
      public function status() : int
      {
         return 0;
      }
      
      public function showText(param1:String) : void
      {
      }
      
      public function showPage() : void
      {
      }
      
      public function showGlyphs(param1:Array) : void
      {
      }
      
      public function set_tolerance(param1:Number) : Number
      {
         return param1;
      }
      
      public function set_source(param1:*) : *
      {
         return param1;
      }
      
      public function set_miterLimit(param1:Number) : Number
      {
         return param1;
      }
      
      public function set_matrix(param1:ArrayBufferView) : ArrayBufferView
      {
         return param1;
      }
      
      public function set_lineWidth(param1:Number) : Number
      {
         return param1;
      }
      
      public function set_lineJoin(param1:int) : int
      {
         return param1;
      }
      
      public function set_lineCap(param1:int) : int
      {
         return param1;
      }
      
      public function set_fontOptions(param1:*) : *
      {
         return param1;
      }
      
      public function set_fontFace(param1:*) : *
      {
         return param1;
      }
      
      public function set_fillRule(param1:int) : int
      {
         return param1;
      }
      
      public function set_dash(param1:Array) : Array
      {
         return param1;
      }
      
      public function set_antialias(param1:int) : int
      {
         return param1;
      }
      
      public function setSourceSurface(param1:*, param2:Number, param3:Number) : void
      {
      }
      
      public function setSourceRGBA(param1:Number, param2:Number, param3:Number, param4:Number) : void
      {
      }
      
      public function setSourceRGB(param1:Number, param2:Number, param3:Number) : void
      {
      }
      
      public function setOperator(param1:int) : int
      {
         return param1;
      }
      
      public function setFontSize(param1:Number) : void
      {
      }
      
      public function scale(param1:Number, param2:Number) : void
      {
      }
      
      public function save() : void
      {
      }
      
      public function rotate(param1:Number) : void
      {
      }
      
      public function restore() : void
      {
      }
      
      public function resetClip() : void
      {
      }
      
      public function relMoveTo(param1:Number, param2:Number) : void
      {
      }
      
      public function relLineTo(param1:Number, param2:Number) : void
      {
      }
      
      public function relCurveTo(param1:Number, param2:Number, param3:Number, param4:Number, param5:Number, param6:Number) : void
      {
      }
      
      public function rectangle(param1:Number, param2:Number, param3:Number, param4:Number) : void
      {
      }
      
      public function recreate(param1:*) : void
      {
      }
      
      public function pushGroupWithContent(param1:int) : void
      {
      }
      
      public function pushGroup() : void
      {
      }
      
      public function popGroupToSource() : void
      {
      }
      
      public function popGroup() : *
      {
         return null;
      }
      
      public function paintWithAlpha(param1:Number) : void
      {
      }
      
      public function paint() : void
      {
      }
      
      public function newPath() : void
      {
      }
      
      public function moveTo(param1:Number, param2:Number) : void
      {
      }
      
      public function maskSurface(param1:*, param2:Number, param3:Number) : void
      {
      }
      
      public function mask(param1:*) : void
      {
      }
      
      public function lineTo(param1:Number, param2:Number) : void
      {
      }
      
      public function inStroke(param1:Number, param2:Number) : Boolean
      {
         return false;
      }
      
      public function inFill(param1:Number, param2:Number) : Boolean
      {
         return false;
      }
      
      public function inClip(param1:Number, param2:Number) : Boolean
      {
         return false;
      }
      
      public function identityMatrix() : void
      {
      }
      
      public function get_tolerance() : Number
      {
         return 0;
      }
      
      public function get_target() : *
      {
         return 0;
      }
      
      public function get_source() : *
      {
         return 0;
      }
      
      public function get_miterLimit() : Number
      {
         return 0;
      }
      
      public function get_matrix() : ArrayBufferView
      {
         return null;
      }
      
      public function get_lineWidth() : Number
      {
         return 0;
      }
      
      public function get_lineJoin() : int
      {
         return 0;
      }
      
      public function get_lineCap() : int
      {
         return 0;
      }
      
      public function get_hasCurrentPoint() : Boolean
      {
         return false;
      }
      
      public function get_groupTarget() : *
      {
         return 0;
      }
      
      public function get_fontOptions() : *
      {
         return null;
      }
      
      public function get_fontFace() : *
      {
         return 0;
      }
      
      public function get_fillRule() : int
      {
         return 0;
      }
      
      public function get_dashCount() : int
      {
         return 0;
      }
      
      public function get_dash() : Array
      {
         return [];
      }
      
      public function get_currentPoint() : Vector2
      {
         return null;
      }
      
      public function get_antialias() : int
      {
         return 0;
      }
      
      public function getOperator() : int
      {
         return 0;
      }
      
      public function fillPreserve() : void
      {
      }
      
      public function fillExtents(param1:Number, param2:Number, param3:Number, param4:Number) : void
      {
      }
      
      public function fill() : void
      {
      }
      
      public function curveTo(param1:Number, param2:Number, param3:Number, param4:Number, param5:Number, param6:Number) : void
      {
      }
      
      public function copyPage() : void
      {
      }
      
      public function closePath() : void
      {
      }
      
      public function clipPreserve() : void
      {
      }
      
      public function clipExtents(param1:Number, param2:Number, param3:Number, param4:Number) : void
      {
      }
      
      public function clip() : void
      {
      }
      
      public function arcNegative(param1:Number, param2:Number, param3:Number, param4:Number, param5:Number) : void
      {
      }
      
      public function arc(param1:Number, param2:Number, param3:Number, param4:Number, param5:Number) : void
      {
      }
   }
}

