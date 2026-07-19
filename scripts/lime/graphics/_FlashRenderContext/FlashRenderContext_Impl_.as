package lime.graphics._FlashRenderContext
{
   import flash.display.Sprite;
   import lime.graphics.RenderContext;
   
   public final class FlashRenderContext_Impl_
   {
      
      public function FlashRenderContext_Impl_()
      {
      }
      
      public static function fromRenderContext(param1:RenderContext) : Sprite
      {
         return param1.flash;
      }
   }
}

