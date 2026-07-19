package lime.graphics._CairoRenderContext
{
   import lime.graphics.RenderContext;
   import lime.graphics.cairo.Cairo;
   
   public final class CairoRenderContext_Impl_
   {
      
      public function CairoRenderContext_Impl_()
      {
      }
      
      public static function fromRenderContext(param1:RenderContext) : Cairo
      {
         return param1.cairo;
      }
   }
}

