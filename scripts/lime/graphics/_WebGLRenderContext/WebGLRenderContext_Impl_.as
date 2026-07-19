package lime.graphics._WebGLRenderContext
{
   import haxe.io.Bytes;
   import lime.graphics.RenderContext;
   import lime.graphics._WebGL2RenderContext.WebGL2RenderContext_Impl_;
   import lime.graphics.opengl.GL;
   import lime.utils.ArrayBufferView;
   import lime.utils._BytePointer.BytePointer_Impl_;
   
   public final class WebGLRenderContext_Impl_
   {
      
      public function WebGLRenderContext_Impl_()
      {
      }
      
      public static function bufferData(param1:*, param2:int, param3:ArrayBufferView, param4:int) : void
      {
         WebGL2RenderContext_Impl_.bufferData(param1,param2,param3,param4);
      }
      
      public static function bufferSubData(param1:*, param2:int, param3:int, param4:ArrayBufferView) : void
      {
         var _loc5_:Object = null;
         var _loc6_:Object = _loc5_ != null ? _loc5_ : (param4 != null ? param4.byteLength : 0);
         BytePointer_Impl_.set(WebGL2RenderContext_Impl_.__tempPointer,null,param4,null,0);
         param1.bufferSubData(param2,param3,_loc6_,WebGL2RenderContext_Impl_.__tempPointer);
      }
      
      public static function compressedTexImage2D(param1:*, param2:int, param3:int, param4:int, param5:int, param6:int, param7:int, param8:ArrayBufferView) : void
      {
         WebGL2RenderContext_Impl_.compressedTexImage2D(param1,param2,param3,param4,param5,param6,param7,param8);
      }
      
      public static function compressedTexSubImage2D(param1:*, param2:int, param3:int, param4:int, param5:int, param6:int, param7:int, param8:int, param9:ArrayBufferView) : void
      {
         var _loc10_:Object = null;
         var _loc11_:Object = _loc10_ != null ? _loc10_ : (param9 != null ? param9.byteLength : 0);
         BytePointer_Impl_.set(WebGL2RenderContext_Impl_.__tempPointer,null,param9,null,0);
         param1.compressedTexSubImage2D(param2,param3,param4,param5,param6,param7,param8,_loc11_,WebGL2RenderContext_Impl_.__tempPointer);
      }
      
      public static function readPixels(param1:*, param2:int, param3:int, param4:int, param5:int, param6:int, param7:int, param8:ArrayBufferView) : void
      {
         BytePointer_Impl_.set(WebGL2RenderContext_Impl_.__tempPointer,null,param8,null,0);
         param1.readPixels(param2,param3,param4,param5,param6,param7,WebGL2RenderContext_Impl_.__tempPointer);
      }
      
      public static function texImage2D(param1:*, param2:int, param3:int, param4:int, param5:int, param6:int, param7:int, param8:int, param9:int, param10:ArrayBufferView) : void
      {
         BytePointer_Impl_.set(WebGL2RenderContext_Impl_.__tempPointer,null,param10,null,0);
         param1.texImage2D(param2,param3,param4,param5,param6,param7,param8,param9,WebGL2RenderContext_Impl_.__tempPointer);
      }
      
      public static function texSubImage2D(param1:*, param2:int, param3:int, param4:int, param5:int, param6:int, param7:int, param8:int, param9:int, param10:ArrayBufferView, param11:int = 0) : void
      {
         BytePointer_Impl_.set(WebGL2RenderContext_Impl_.__tempPointer,null,param10,null,param11);
         param1.texSubImage2D(param2,param3,param4,param5,param6,param7,param8,param9,WebGL2RenderContext_Impl_.__tempPointer);
      }
      
      public static function uniformMatrix2fv(param1:*, param2:int, param3:Boolean, param4:ArrayBufferView) : void
      {
         WebGL2RenderContext_Impl_.uniformMatrix2fv(param1,param2,param3,param4);
      }
      
      public static function uniformMatrix3fv(param1:*, param2:int, param3:Boolean, param4:ArrayBufferView) : void
      {
         WebGL2RenderContext_Impl_.uniformMatrix3fv(param1,param2,param3,param4);
      }
      
      public static function uniformMatrix4fv(param1:*, param2:int, param3:Boolean, param4:ArrayBufferView) : void
      {
         WebGL2RenderContext_Impl_.uniformMatrix4fv(param1,param2,param3,param4);
      }
      
      public static function fromWebGL2RenderContext(param1:*) : *
      {
         return param1;
      }
      
      public static function fromRenderContext(param1:RenderContext) : *
      {
         return param1.webgl;
      }
      
      public static function fromGL(param1:Class) : *
      {
         return GL.context;
      }
   }
}

