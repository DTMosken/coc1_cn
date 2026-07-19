package lime.graphics.opengl._GLProgram
{
   import lime.graphics.opengl.GL;
   import lime.graphics.opengl.GLObject;
   import lime.graphics.opengl._GLShader.GLShader_Impl_;
   import lime.utils.Log;
   
   public final class GLProgram_Impl_
   {
      
      public function GLProgram_Impl_()
      {
      }
      
      public static function fromInt(param1:int) : GLObject
      {
         return GLObject.fromInt(1,param1);
      }
      
      public static function fromSources(param1:*, param2:String, param3:String) : GLObject
      {
         var _loc7_:* = null as String;
         var _loc4_:GLObject = GLShader_Impl_.fromSource(param1,param2,int(param1.VERTEX_SHADER));
         var _loc5_:GLObject = GLShader_Impl_.fromSource(param1,param3,int(param1.FRAGMENT_SHADER));
         var _loc6_:GLObject = param1.createProgram();
         param1.attachShader(_loc6_,_loc4_);
         param1.attachShader(_loc6_,_loc5_);
         param1.linkProgram(_loc6_);
         if(param1.getProgramParameter(_loc6_,35714) == 0)
         {
            _loc7_ = "Unable to initialize the shader program";
            _loc7_ += "\n" + GL.context.getProgramInfoLog(_loc6_);
            Log.error(_loc7_,{
               "fileName":"lime/graphics/opengl/GLProgram.hx",
               "lineNumber":39,
               "className":"lime.graphics.opengl._GLProgram.GLProgram_Impl_",
               "methodName":"fromSources"
            });
         }
         return _loc6_;
      }
   }
}

