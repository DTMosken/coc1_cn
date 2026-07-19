package openfl.display
{
   import flash.Boot;
   import flash.display.IGraphicsData;
   import flash.display.IGraphicsPath;
   
   public final class GraphicsQuadPath implements IGraphicsPath, IGraphicsData
   {
      
      public var transforms:Vector.<Number>;
      
      public var rects:Vector.<Number>;
      
      public var indices:Vector.<int>;
      
      public function GraphicsQuadPath(param1:Vector.<Number> = undefined, param2:Vector.<int> = undefined, param3:Vector.<Number> = undefined)
      {
         if(Boot.skip_constructor)
         {
            return;
         }
         rects = param1;
         indices = param2;
         transforms = param3;
      }
   }
}

