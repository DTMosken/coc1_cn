package lime.graphics.opengl._GLShader
{
   import lime.graphics.opengl.GLObject;
   import lime.utils.Log;
   
   public final class GLShader_Impl_
   {
      
      public function GLShader_Impl_()
      {
      }
      
      public static function fromInt(param1:int) : GLObject
      {
         return GLObject.fromInt(2,param1);
      }
      
      public static function fromSource(param1:*, param2:String, param3:int) : GLObject
      {
         var _loc7_:* = null as String;
         var _loc4_:GLObject = param1.createShader(param3);
         param1.shaderSource(_loc4_,param2);
         param1.compileShader(_loc4_);
         var _loc5_:String = param1.getShaderInfoLog(_loc4_);
         var _loc6_:int = param1.getShaderParameter(_loc4_,int(param1.COMPILE_STATUS));
         if(_loc5_ != null || _loc6_ == 0)
         {
            if(_loc6_ == 0)
            {
               _loc7_ = "Error ";
            }
            else
            {
               _loc7_ = "Info ";
            }
            if(param3 == int(param1.VERTEX_SHADER))
            {
               _loc7_ = "compiling vertex shader";
            }
            else if(param3 == int(param1.FRAGMENT_SHADER))
            {
               _loc7_ = "compiling fragment shader";
            }
            else
            {
               _loc7_ = "compiling unknown shader type";
            }
            _loc7_ += "\n" + _loc5_;
            if(_loc6_ == 0)
            {
               Log.error(_loc7_,{
                  "fileName":"lime/graphics/opengl/GLShader.hx",
                  "lineNumber":47,
                  "className":"lime.graphics.opengl._GLShader.GLShader_Impl_",
                  "methodName":"fromSource"
               });
            }
            else if(_loc5_ != null)
            {
               Log.debug(_loc7_,{
                  "fileName":"lime/graphics/opengl/GLShader.hx",
                  "lineNumber":48,
                  "className":"lime.graphics.opengl._GLShader.GLShader_Impl_",
                  "methodName":"fromSource"
               });
            }
         }
         return _loc4_;
      }
   }
}

