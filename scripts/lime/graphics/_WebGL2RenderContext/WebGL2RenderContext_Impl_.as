package lime.graphics._WebGL2RenderContext
{
   import haxe._Int64.___Int64;
   import haxe.io.Bytes;
   import lime.graphics.RenderContext;
   import lime.graphics.opengl.GL;
   import lime.graphics.opengl.GLObject;
   import lime.utils.ArrayBufferView;
   import lime.utils.BytePointerData;
   import lime.utils._BytePointer.BytePointer_Impl_;
   import lime.utils._DataPointer.DataPointer_Impl_;
   
   public final class WebGL2RenderContext_Impl_
   {
      
      public static var init__:Boolean;
      
      public static var __tempPointer:BytePointerData;
      
      public function WebGL2RenderContext_Impl_()
      {
      }
      
      public static function get_DEPTH_BUFFER_BIT(param1:*) : int
      {
         return param1.DEPTH_BUFFER_BIT;
      }
      
      public static function get_STENCIL_BUFFER_BIT(param1:*) : int
      {
         return param1.STENCIL_BUFFER_BIT;
      }
      
      public static function get_COLOR_BUFFER_BIT(param1:*) : int
      {
         return param1.COLOR_BUFFER_BIT;
      }
      
      public static function get_POINTS(param1:*) : int
      {
         return param1.POINTS;
      }
      
      public static function get_LINES(param1:*) : int
      {
         return param1.LINES;
      }
      
      public static function get_LINE_LOOP(param1:*) : int
      {
         return param1.LINE_LOOP;
      }
      
      public static function get_LINE_STRIP(param1:*) : int
      {
         return param1.LINE_STRIP;
      }
      
      public static function get_TRIANGLES(param1:*) : int
      {
         return param1.TRIANGLES;
      }
      
      public static function get_TRIANGLE_STRIP(param1:*) : int
      {
         return param1.TRIANGLE_STRIP;
      }
      
      public static function get_TRIANGLE_FAN(param1:*) : int
      {
         return param1.TRIANGLE_FAN;
      }
      
      public static function get_ZERO(param1:*) : int
      {
         return param1.ZERO;
      }
      
      public static function get_ONE(param1:*) : int
      {
         return param1.ONE;
      }
      
      public static function get_SRC_COLOR(param1:*) : int
      {
         return param1.SRC_COLOR;
      }
      
      public static function get_ONE_MINUS_SRC_COLOR(param1:*) : int
      {
         return param1.ONE_MINUS_SRC_COLOR;
      }
      
      public static function get_SRC_ALPHA(param1:*) : int
      {
         return param1.SRC_ALPHA;
      }
      
      public static function get_ONE_MINUS_SRC_ALPHA(param1:*) : int
      {
         return param1.ONE_MINUS_SRC_ALPHA;
      }
      
      public static function get_DST_ALPHA(param1:*) : int
      {
         return param1.DST_ALPHA;
      }
      
      public static function get_ONE_MINUS_DST_ALPHA(param1:*) : int
      {
         return param1.ONE_MINUS_DST_ALPHA;
      }
      
      public static function get_DST_COLOR(param1:*) : int
      {
         return param1.DST_COLOR;
      }
      
      public static function get_ONE_MINUS_DST_COLOR(param1:*) : int
      {
         return param1.ONE_MINUS_DST_COLOR;
      }
      
      public static function get_SRC_ALPHA_SATURATE(param1:*) : int
      {
         return param1.SRC_ALPHA_SATURATE;
      }
      
      public static function get_FUNC_ADD(param1:*) : int
      {
         return param1.FUNC_ADD;
      }
      
      public static function get_BLEND_EQUATION(param1:*) : int
      {
         return param1.BLEND_EQUATION;
      }
      
      public static function get_BLEND_EQUATION_RGB(param1:*) : int
      {
         return param1.BLEND_EQUATION_RGB;
      }
      
      public static function get_BLEND_EQUATION_ALPHA(param1:*) : int
      {
         return param1.BLEND_EQUATION_ALPHA;
      }
      
      public static function get_FUNC_SUBTRACT(param1:*) : int
      {
         return param1.FUNC_SUBTRACT;
      }
      
      public static function get_FUNC_REVERSE_SUBTRACT(param1:*) : int
      {
         return param1.FUNC_REVERSE_SUBTRACT;
      }
      
      public static function get_BLEND_DST_RGB(param1:*) : int
      {
         return param1.BLEND_DST_RGB;
      }
      
      public static function get_BLEND_SRC_RGB(param1:*) : int
      {
         return param1.BLEND_SRC_RGB;
      }
      
      public static function get_BLEND_DST_ALPHA(param1:*) : int
      {
         return param1.BLEND_DST_ALPHA;
      }
      
      public static function get_BLEND_SRC_ALPHA(param1:*) : int
      {
         return param1.BLEND_SRC_ALPHA;
      }
      
      public static function get_CONSTANT_COLOR(param1:*) : int
      {
         return param1.CONSTANT_COLOR;
      }
      
      public static function get_ONE_MINUS_CONSTANT_COLOR(param1:*) : int
      {
         return param1.ONE_MINUS_CONSTANT_COLOR;
      }
      
      public static function get_CONSTANT_ALPHA(param1:*) : int
      {
         return param1.CONSTANT_ALPHA;
      }
      
      public static function get_ONE_MINUS_CONSTANT_ALPHA(param1:*) : int
      {
         return param1.ONE_MINUS_CONSTANT_ALPHA;
      }
      
      public static function get_BLEND_COLOR(param1:*) : int
      {
         return param1.BLEND_COLOR;
      }
      
      public static function get_ARRAY_BUFFER(param1:*) : int
      {
         return param1.ARRAY_BUFFER;
      }
      
      public static function get_ELEMENT_ARRAY_BUFFER(param1:*) : int
      {
         return param1.ELEMENT_ARRAY_BUFFER;
      }
      
      public static function get_ARRAY_BUFFER_BINDING(param1:*) : int
      {
         return param1.ARRAY_BUFFER_BINDING;
      }
      
      public static function get_ELEMENT_ARRAY_BUFFER_BINDING(param1:*) : int
      {
         return param1.ELEMENT_ARRAY_BUFFER_BINDING;
      }
      
      public static function get_STREAM_DRAW(param1:*) : int
      {
         return param1.STREAM_DRAW;
      }
      
      public static function get_STATIC_DRAW(param1:*) : int
      {
         return param1.STATIC_DRAW;
      }
      
      public static function get_DYNAMIC_DRAW(param1:*) : int
      {
         return param1.DYNAMIC_DRAW;
      }
      
      public static function get_BUFFER_SIZE(param1:*) : int
      {
         return param1.BUFFER_SIZE;
      }
      
      public static function get_BUFFER_USAGE(param1:*) : int
      {
         return param1.BUFFER_USAGE;
      }
      
      public static function get_CURRENT_VERTEX_ATTRIB(param1:*) : int
      {
         return param1.CURRENT_VERTEX_ATTRIB;
      }
      
      public static function get_FRONT(param1:*) : int
      {
         return param1.FRONT;
      }
      
      public static function get_BACK(param1:*) : int
      {
         return param1.BACK;
      }
      
      public static function get_FRONT_AND_BACK(param1:*) : int
      {
         return param1.FRONT_AND_BACK;
      }
      
      public static function get_CULL_FACE(param1:*) : int
      {
         return param1.CULL_FACE;
      }
      
      public static function get_BLEND(param1:*) : int
      {
         return param1.BLEND;
      }
      
      public static function get_DITHER(param1:*) : int
      {
         return param1.DITHER;
      }
      
      public static function get_STENCIL_TEST(param1:*) : int
      {
         return param1.STENCIL_TEST;
      }
      
      public static function get_DEPTH_TEST(param1:*) : int
      {
         return param1.DEPTH_TEST;
      }
      
      public static function get_SCISSOR_TEST(param1:*) : int
      {
         return param1.SCISSOR_TEST;
      }
      
      public static function get_POLYGON_OFFSET_FILL(param1:*) : int
      {
         return param1.POLYGON_OFFSET_FILL;
      }
      
      public static function get_SAMPLE_ALPHA_TO_COVERAGE(param1:*) : int
      {
         return param1.SAMPLE_ALPHA_TO_COVERAGE;
      }
      
      public static function get_SAMPLE_COVERAGE(param1:*) : int
      {
         return param1.SAMPLE_COVERAGE;
      }
      
      public static function get_NO_ERROR(param1:*) : int
      {
         return param1.NO_ERROR;
      }
      
      public static function get_INVALID_ENUM(param1:*) : int
      {
         return param1.INVALID_ENUM;
      }
      
      public static function get_INVALID_VALUE(param1:*) : int
      {
         return param1.INVALID_VALUE;
      }
      
      public static function get_INVALID_OPERATION(param1:*) : int
      {
         return param1.INVALID_OPERATION;
      }
      
      public static function get_OUT_OF_MEMORY(param1:*) : int
      {
         return param1.OUT_OF_MEMORY;
      }
      
      public static function get_CW(param1:*) : int
      {
         return param1.CW;
      }
      
      public static function get_CCW(param1:*) : int
      {
         return param1.CCW;
      }
      
      public static function get_LINE_WIDTH(param1:*) : int
      {
         return param1.LINE_WIDTH;
      }
      
      public static function get_ALIASED_POINT_SIZE_RANGE(param1:*) : int
      {
         return param1.ALIASED_POINT_SIZE_RANGE;
      }
      
      public static function get_ALIASED_LINE_WIDTH_RANGE(param1:*) : int
      {
         return param1.ALIASED_LINE_WIDTH_RANGE;
      }
      
      public static function get_CULL_FACE_MODE(param1:*) : int
      {
         return param1.CULL_FACE_MODE;
      }
      
      public static function get_FRONT_FACE(param1:*) : int
      {
         return param1.FRONT_FACE;
      }
      
      public static function get_DEPTH_RANGE(param1:*) : int
      {
         return param1.DEPTH_RANGE;
      }
      
      public static function get_DEPTH_WRITEMASK(param1:*) : int
      {
         return param1.DEPTH_WRITEMASK;
      }
      
      public static function get_DEPTH_CLEAR_VALUE(param1:*) : int
      {
         return param1.DEPTH_CLEAR_VALUE;
      }
      
      public static function get_DEPTH_FUNC(param1:*) : int
      {
         return param1.DEPTH_FUNC;
      }
      
      public static function get_STENCIL_CLEAR_VALUE(param1:*) : int
      {
         return param1.STENCIL_CLEAR_VALUE;
      }
      
      public static function get_STENCIL_FUNC(param1:*) : int
      {
         return param1.STENCIL_FUNC;
      }
      
      public static function get_STENCIL_FAIL(param1:*) : int
      {
         return param1.STENCIL_FAIL;
      }
      
      public static function get_STENCIL_PASS_DEPTH_FAIL(param1:*) : int
      {
         return param1.STENCIL_PASS_DEPTH_FAIL;
      }
      
      public static function get_STENCIL_PASS_DEPTH_PASS(param1:*) : int
      {
         return param1.STENCIL_PASS_DEPTH_PASS;
      }
      
      public static function get_STENCIL_REF(param1:*) : int
      {
         return param1.STENCIL_REF;
      }
      
      public static function get_STENCIL_VALUE_MASK(param1:*) : int
      {
         return param1.STENCIL_VALUE_MASK;
      }
      
      public static function get_STENCIL_WRITEMASK(param1:*) : int
      {
         return param1.STENCIL_WRITEMASK;
      }
      
      public static function get_STENCIL_BACK_FUNC(param1:*) : int
      {
         return param1.STENCIL_BACK_FUNC;
      }
      
      public static function get_STENCIL_BACK_FAIL(param1:*) : int
      {
         return param1.STENCIL_BACK_FAIL;
      }
      
      public static function get_STENCIL_BACK_PASS_DEPTH_FAIL(param1:*) : int
      {
         return param1.STENCIL_BACK_PASS_DEPTH_FAIL;
      }
      
      public static function get_STENCIL_BACK_PASS_DEPTH_PASS(param1:*) : int
      {
         return param1.STENCIL_BACK_PASS_DEPTH_PASS;
      }
      
      public static function get_STENCIL_BACK_REF(param1:*) : int
      {
         return param1.STENCIL_BACK_REF;
      }
      
      public static function get_STENCIL_BACK_VALUE_MASK(param1:*) : int
      {
         return param1.STENCIL_BACK_VALUE_MASK;
      }
      
      public static function get_STENCIL_BACK_WRITEMASK(param1:*) : int
      {
         return param1.STENCIL_BACK_WRITEMASK;
      }
      
      public static function get_VIEWPORT(param1:*) : int
      {
         return param1.VIEWPORT;
      }
      
      public static function get_SCISSOR_BOX(param1:*) : int
      {
         return param1.SCISSOR_BOX;
      }
      
      public static function get_COLOR_CLEAR_VALUE(param1:*) : int
      {
         return param1.COLOR_CLEAR_VALUE;
      }
      
      public static function get_COLOR_WRITEMASK(param1:*) : int
      {
         return param1.COLOR_WRITEMASK;
      }
      
      public static function get_UNPACK_ALIGNMENT(param1:*) : int
      {
         return param1.UNPACK_ALIGNMENT;
      }
      
      public static function get_PACK_ALIGNMENT(param1:*) : int
      {
         return param1.PACK_ALIGNMENT;
      }
      
      public static function get_MAX_TEXTURE_SIZE(param1:*) : int
      {
         return param1.MAX_TEXTURE_SIZE;
      }
      
      public static function get_MAX_VIEWPORT_DIMS(param1:*) : int
      {
         return param1.MAX_VIEWPORT_DIMS;
      }
      
      public static function get_SUBPIXEL_BITS(param1:*) : int
      {
         return param1.SUBPIXEL_BITS;
      }
      
      public static function get_RED_BITS(param1:*) : int
      {
         return param1.RED_BITS;
      }
      
      public static function get_GREEN_BITS(param1:*) : int
      {
         return param1.GREEN_BITS;
      }
      
      public static function get_BLUE_BITS(param1:*) : int
      {
         return param1.BLUE_BITS;
      }
      
      public static function get_ALPHA_BITS(param1:*) : int
      {
         return param1.ALPHA_BITS;
      }
      
      public static function get_DEPTH_BITS(param1:*) : int
      {
         return param1.DEPTH_BITS;
      }
      
      public static function get_STENCIL_BITS(param1:*) : int
      {
         return param1.STENCIL_BITS;
      }
      
      public static function get_POLYGON_OFFSET_UNITS(param1:*) : int
      {
         return param1.POLYGON_OFFSET_UNITS;
      }
      
      public static function get_POLYGON_OFFSET_FACTOR(param1:*) : int
      {
         return param1.POLYGON_OFFSET_FACTOR;
      }
      
      public static function get_TEXTURE_BINDING_2D(param1:*) : int
      {
         return param1.TEXTURE_BINDING_2D;
      }
      
      public static function get_SAMPLE_BUFFERS(param1:*) : int
      {
         return param1.SAMPLE_BUFFERS;
      }
      
      public static function get_SAMPLES(param1:*) : int
      {
         return param1.SAMPLES;
      }
      
      public static function get_SAMPLE_COVERAGE_VALUE(param1:*) : int
      {
         return param1.SAMPLE_COVERAGE_VALUE;
      }
      
      public static function get_SAMPLE_COVERAGE_INVERT(param1:*) : int
      {
         return param1.SAMPLE_COVERAGE_INVERT;
      }
      
      public static function get_COMPRESSED_TEXTURE_FORMATS(param1:*) : int
      {
         return param1.COMPRESSED_TEXTURE_FORMATS;
      }
      
      public static function get_DONT_CARE(param1:*) : int
      {
         return param1.DONT_CARE;
      }
      
      public static function get_FASTEST(param1:*) : int
      {
         return param1.FASTEST;
      }
      
      public static function get_NICEST(param1:*) : int
      {
         return param1.NICEST;
      }
      
      public static function get_GENERATE_MIPMAP_HINT(param1:*) : int
      {
         return param1.GENERATE_MIPMAP_HINT;
      }
      
      public static function get_BYTE(param1:*) : int
      {
         return param1.BYTE;
      }
      
      public static function get_UNSIGNED_BYTE(param1:*) : int
      {
         return param1.UNSIGNED_BYTE;
      }
      
      public static function get_SHORT(param1:*) : int
      {
         return param1.SHORT;
      }
      
      public static function get_UNSIGNED_SHORT(param1:*) : int
      {
         return param1.UNSIGNED_SHORT;
      }
      
      public static function get_INT(param1:*) : int
      {
         return param1.INT;
      }
      
      public static function get_UNSIGNED_INT(param1:*) : int
      {
         return param1.UNSIGNED_INT;
      }
      
      public static function get_FLOAT(param1:*) : int
      {
         return param1.FLOAT;
      }
      
      public static function get_DEPTH_COMPONENT(param1:*) : int
      {
         return param1.DEPTH_COMPONENT;
      }
      
      public static function get_ALPHA(param1:*) : int
      {
         return param1.ALPHA;
      }
      
      public static function get_RGB(param1:*) : int
      {
         return param1.RGB;
      }
      
      public static function get_RGBA(param1:*) : int
      {
         return param1.RGBA;
      }
      
      public static function get_LUMINANCE(param1:*) : int
      {
         return param1.LUMINANCE;
      }
      
      public static function get_LUMINANCE_ALPHA(param1:*) : int
      {
         return param1.LUMINANCE_ALPHA;
      }
      
      public static function get_UNSIGNED_SHORT_4_4_4_4(param1:*) : int
      {
         return param1.UNSIGNED_SHORT_4_4_4_4;
      }
      
      public static function get_UNSIGNED_SHORT_5_5_5_1(param1:*) : int
      {
         return param1.UNSIGNED_SHORT_5_5_5_1;
      }
      
      public static function get_UNSIGNED_SHORT_5_6_5(param1:*) : int
      {
         return param1.UNSIGNED_SHORT_5_6_5;
      }
      
      public static function get_FRAGMENT_SHADER(param1:*) : int
      {
         return param1.FRAGMENT_SHADER;
      }
      
      public static function get_VERTEX_SHADER(param1:*) : int
      {
         return param1.VERTEX_SHADER;
      }
      
      public static function get_MAX_VERTEX_ATTRIBS(param1:*) : int
      {
         return param1.MAX_VERTEX_ATTRIBS;
      }
      
      public static function get_MAX_VERTEX_UNIFORM_VECTORS(param1:*) : int
      {
         return param1.MAX_VERTEX_UNIFORM_VECTORS;
      }
      
      public static function get_MAX_VARYING_VECTORS(param1:*) : int
      {
         return param1.MAX_VARYING_VECTORS;
      }
      
      public static function get_MAX_COMBINED_TEXTURE_IMAGE_UNITS(param1:*) : int
      {
         return param1.MAX_COMBINED_TEXTURE_IMAGE_UNITS;
      }
      
      public static function get_MAX_VERTEX_TEXTURE_IMAGE_UNITS(param1:*) : int
      {
         return param1.MAX_VERTEX_TEXTURE_IMAGE_UNITS;
      }
      
      public static function get_MAX_TEXTURE_IMAGE_UNITS(param1:*) : int
      {
         return param1.MAX_TEXTURE_IMAGE_UNITS;
      }
      
      public static function get_MAX_FRAGMENT_UNIFORM_VECTORS(param1:*) : int
      {
         return param1.MAX_FRAGMENT_UNIFORM_VECTORS;
      }
      
      public static function get_SHADER_TYPE(param1:*) : int
      {
         return param1.SHADER_TYPE;
      }
      
      public static function get_DELETE_STATUS(param1:*) : int
      {
         return param1.DELETE_STATUS;
      }
      
      public static function get_LINK_STATUS(param1:*) : int
      {
         return param1.LINK_STATUS;
      }
      
      public static function get_VALIDATE_STATUS(param1:*) : int
      {
         return param1.VALIDATE_STATUS;
      }
      
      public static function get_ATTACHED_SHADERS(param1:*) : int
      {
         return param1.ATTACHED_SHADERS;
      }
      
      public static function get_ACTIVE_UNIFORMS(param1:*) : int
      {
         return param1.ACTIVE_UNIFORMS;
      }
      
      public static function get_ACTIVE_ATTRIBUTES(param1:*) : int
      {
         return param1.ACTIVE_ATTRIBUTES;
      }
      
      public static function get_SHADING_LANGUAGE_VERSION(param1:*) : int
      {
         return param1.SHADING_LANGUAGE_VERSION;
      }
      
      public static function get_CURRENT_PROGRAM(param1:*) : int
      {
         return param1.CURRENT_PROGRAM;
      }
      
      public static function get_NEVER(param1:*) : int
      {
         return param1.NEVER;
      }
      
      public static function get_LESS(param1:*) : int
      {
         return param1.LESS;
      }
      
      public static function get_EQUAL(param1:*) : int
      {
         return param1.EQUAL;
      }
      
      public static function get_LEQUAL(param1:*) : int
      {
         return param1.LEQUAL;
      }
      
      public static function get_GREATER(param1:*) : int
      {
         return param1.GREATER;
      }
      
      public static function get_NOTEQUAL(param1:*) : int
      {
         return param1.NOTEQUAL;
      }
      
      public static function get_GEQUAL(param1:*) : int
      {
         return param1.GEQUAL;
      }
      
      public static function get_ALWAYS(param1:*) : int
      {
         return param1.ALWAYS;
      }
      
      public static function get_KEEP(param1:*) : int
      {
         return param1.KEEP;
      }
      
      public static function get_REPLACE(param1:*) : int
      {
         return param1.REPLACE;
      }
      
      public static function get_INCR(param1:*) : int
      {
         return param1.INCR;
      }
      
      public static function get_DECR(param1:*) : int
      {
         return param1.DECR;
      }
      
      public static function get_INVERT(param1:*) : int
      {
         return param1.INVERT;
      }
      
      public static function get_INCR_WRAP(param1:*) : int
      {
         return param1.INCR_WRAP;
      }
      
      public static function get_DECR_WRAP(param1:*) : int
      {
         return param1.DECR_WRAP;
      }
      
      public static function get_VENDOR(param1:*) : int
      {
         return param1.VENDOR;
      }
      
      public static function get_RENDERER(param1:*) : int
      {
         return param1.RENDERER;
      }
      
      public static function get_VERSION(param1:*) : int
      {
         return param1.VERSION;
      }
      
      public static function get_NEAREST(param1:*) : int
      {
         return param1.NEAREST;
      }
      
      public static function get_LINEAR(param1:*) : int
      {
         return param1.LINEAR;
      }
      
      public static function get_NEAREST_MIPMAP_NEAREST(param1:*) : int
      {
         return param1.NEAREST_MIPMAP_NEAREST;
      }
      
      public static function get_LINEAR_MIPMAP_NEAREST(param1:*) : int
      {
         return param1.LINEAR_MIPMAP_NEAREST;
      }
      
      public static function get_NEAREST_MIPMAP_LINEAR(param1:*) : int
      {
         return param1.NEAREST_MIPMAP_LINEAR;
      }
      
      public static function get_LINEAR_MIPMAP_LINEAR(param1:*) : int
      {
         return param1.LINEAR_MIPMAP_LINEAR;
      }
      
      public static function get_TEXTURE_MAG_FILTER(param1:*) : int
      {
         return param1.TEXTURE_MAG_FILTER;
      }
      
      public static function get_TEXTURE_MIN_FILTER(param1:*) : int
      {
         return param1.TEXTURE_MIN_FILTER;
      }
      
      public static function get_TEXTURE_WRAP_S(param1:*) : int
      {
         return param1.TEXTURE_WRAP_S;
      }
      
      public static function get_TEXTURE_WRAP_T(param1:*) : int
      {
         return param1.TEXTURE_WRAP_T;
      }
      
      public static function get_TEXTURE_2D(param1:*) : int
      {
         return param1.TEXTURE_2D;
      }
      
      public static function get_TEXTURE(param1:*) : int
      {
         return param1.TEXTURE;
      }
      
      public static function get_TEXTURE_CUBE_MAP(param1:*) : int
      {
         return param1.TEXTURE_CUBE_MAP;
      }
      
      public static function get_TEXTURE_BINDING_CUBE_MAP(param1:*) : int
      {
         return param1.TEXTURE_BINDING_CUBE_MAP;
      }
      
      public static function get_TEXTURE_CUBE_MAP_POSITIVE_X(param1:*) : int
      {
         return param1.TEXTURE_CUBE_MAP_POSITIVE_X;
      }
      
      public static function get_TEXTURE_CUBE_MAP_NEGATIVE_X(param1:*) : int
      {
         return param1.TEXTURE_CUBE_MAP_NEGATIVE_X;
      }
      
      public static function get_TEXTURE_CUBE_MAP_POSITIVE_Y(param1:*) : int
      {
         return param1.TEXTURE_CUBE_MAP_POSITIVE_Y;
      }
      
      public static function get_TEXTURE_CUBE_MAP_NEGATIVE_Y(param1:*) : int
      {
         return param1.TEXTURE_CUBE_MAP_NEGATIVE_Y;
      }
      
      public static function get_TEXTURE_CUBE_MAP_POSITIVE_Z(param1:*) : int
      {
         return param1.TEXTURE_CUBE_MAP_POSITIVE_Z;
      }
      
      public static function get_TEXTURE_CUBE_MAP_NEGATIVE_Z(param1:*) : int
      {
         return param1.TEXTURE_CUBE_MAP_NEGATIVE_Z;
      }
      
      public static function get_MAX_CUBE_MAP_TEXTURE_SIZE(param1:*) : int
      {
         return param1.MAX_CUBE_MAP_TEXTURE_SIZE;
      }
      
      public static function get_TEXTURE0(param1:*) : int
      {
         return param1.TEXTURE0;
      }
      
      public static function get_TEXTURE1(param1:*) : int
      {
         return param1.TEXTURE1;
      }
      
      public static function get_TEXTURE2(param1:*) : int
      {
         return param1.TEXTURE2;
      }
      
      public static function get_TEXTURE3(param1:*) : int
      {
         return param1.TEXTURE3;
      }
      
      public static function get_TEXTURE4(param1:*) : int
      {
         return param1.TEXTURE4;
      }
      
      public static function get_TEXTURE5(param1:*) : int
      {
         return param1.TEXTURE5;
      }
      
      public static function get_TEXTURE6(param1:*) : int
      {
         return param1.TEXTURE6;
      }
      
      public static function get_TEXTURE7(param1:*) : int
      {
         return param1.TEXTURE7;
      }
      
      public static function get_TEXTURE8(param1:*) : int
      {
         return param1.TEXTURE8;
      }
      
      public static function get_TEXTURE9(param1:*) : int
      {
         return param1.TEXTURE9;
      }
      
      public static function get_TEXTURE10(param1:*) : int
      {
         return param1.TEXTURE10;
      }
      
      public static function get_TEXTURE11(param1:*) : int
      {
         return param1.TEXTURE11;
      }
      
      public static function get_TEXTURE12(param1:*) : int
      {
         return param1.TEXTURE12;
      }
      
      public static function get_TEXTURE13(param1:*) : int
      {
         return param1.TEXTURE13;
      }
      
      public static function get_TEXTURE14(param1:*) : int
      {
         return param1.TEXTURE14;
      }
      
      public static function get_TEXTURE15(param1:*) : int
      {
         return param1.TEXTURE15;
      }
      
      public static function get_TEXTURE16(param1:*) : int
      {
         return param1.TEXTURE16;
      }
      
      public static function get_TEXTURE17(param1:*) : int
      {
         return param1.TEXTURE17;
      }
      
      public static function get_TEXTURE18(param1:*) : int
      {
         return param1.TEXTURE18;
      }
      
      public static function get_TEXTURE19(param1:*) : int
      {
         return param1.TEXTURE19;
      }
      
      public static function get_TEXTURE20(param1:*) : int
      {
         return param1.TEXTURE20;
      }
      
      public static function get_TEXTURE21(param1:*) : int
      {
         return param1.TEXTURE21;
      }
      
      public static function get_TEXTURE22(param1:*) : int
      {
         return param1.TEXTURE22;
      }
      
      public static function get_TEXTURE23(param1:*) : int
      {
         return param1.TEXTURE23;
      }
      
      public static function get_TEXTURE24(param1:*) : int
      {
         return param1.TEXTURE24;
      }
      
      public static function get_TEXTURE25(param1:*) : int
      {
         return param1.TEXTURE25;
      }
      
      public static function get_TEXTURE26(param1:*) : int
      {
         return param1.TEXTURE26;
      }
      
      public static function get_TEXTURE27(param1:*) : int
      {
         return param1.TEXTURE27;
      }
      
      public static function get_TEXTURE28(param1:*) : int
      {
         return param1.TEXTURE28;
      }
      
      public static function get_TEXTURE29(param1:*) : int
      {
         return param1.TEXTURE29;
      }
      
      public static function get_TEXTURE30(param1:*) : int
      {
         return param1.TEXTURE30;
      }
      
      public static function get_TEXTURE31(param1:*) : int
      {
         return param1.TEXTURE31;
      }
      
      public static function get_ACTIVE_TEXTURE(param1:*) : int
      {
         return param1.ACTIVE_TEXTURE;
      }
      
      public static function get_REPEAT(param1:*) : int
      {
         return param1.REPEAT;
      }
      
      public static function get_CLAMP_TO_EDGE(param1:*) : int
      {
         return param1.CLAMP_TO_EDGE;
      }
      
      public static function get_MIRRORED_REPEAT(param1:*) : int
      {
         return param1.MIRRORED_REPEAT;
      }
      
      public static function get_FLOAT_VEC2(param1:*) : int
      {
         return param1.FLOAT_VEC2;
      }
      
      public static function get_FLOAT_VEC3(param1:*) : int
      {
         return param1.FLOAT_VEC3;
      }
      
      public static function get_FLOAT_VEC4(param1:*) : int
      {
         return param1.FLOAT_VEC4;
      }
      
      public static function get_INT_VEC2(param1:*) : int
      {
         return param1.INT_VEC2;
      }
      
      public static function get_INT_VEC3(param1:*) : int
      {
         return param1.INT_VEC3;
      }
      
      public static function get_INT_VEC4(param1:*) : int
      {
         return param1.INT_VEC4;
      }
      
      public static function get_BOOL(param1:*) : int
      {
         return param1.BOOL;
      }
      
      public static function get_BOOL_VEC2(param1:*) : int
      {
         return param1.BOOL_VEC2;
      }
      
      public static function get_BOOL_VEC3(param1:*) : int
      {
         return param1.BOOL_VEC3;
      }
      
      public static function get_BOOL_VEC4(param1:*) : int
      {
         return param1.BOOL_VEC4;
      }
      
      public static function get_FLOAT_MAT2(param1:*) : int
      {
         return param1.FLOAT_MAT2;
      }
      
      public static function get_FLOAT_MAT3(param1:*) : int
      {
         return param1.FLOAT_MAT3;
      }
      
      public static function get_FLOAT_MAT4(param1:*) : int
      {
         return param1.FLOAT_MAT4;
      }
      
      public static function get_SAMPLER_2D(param1:*) : int
      {
         return param1.SAMPLER_2D;
      }
      
      public static function get_SAMPLER_CUBE(param1:*) : int
      {
         return param1.SAMPLER_CUBE;
      }
      
      public static function get_VERTEX_ATTRIB_ARRAY_ENABLED(param1:*) : int
      {
         return param1.VERTEX_ATTRIB_ARRAY_ENABLED;
      }
      
      public static function get_VERTEX_ATTRIB_ARRAY_SIZE(param1:*) : int
      {
         return param1.VERTEX_ATTRIB_ARRAY_SIZE;
      }
      
      public static function get_VERTEX_ATTRIB_ARRAY_STRIDE(param1:*) : int
      {
         return param1.VERTEX_ATTRIB_ARRAY_STRIDE;
      }
      
      public static function get_VERTEX_ATTRIB_ARRAY_TYPE(param1:*) : int
      {
         return param1.VERTEX_ATTRIB_ARRAY_TYPE;
      }
      
      public static function get_VERTEX_ATTRIB_ARRAY_NORMALIZED(param1:*) : int
      {
         return param1.VERTEX_ATTRIB_ARRAY_NORMALIZED;
      }
      
      public static function get_VERTEX_ATTRIB_ARRAY_POINTER(param1:*) : int
      {
         return param1.VERTEX_ATTRIB_ARRAY_POINTER;
      }
      
      public static function get_VERTEX_ATTRIB_ARRAY_BUFFER_BINDING(param1:*) : int
      {
         return param1.VERTEX_ATTRIB_ARRAY_BUFFER_BINDING;
      }
      
      public static function get_COMPILE_STATUS(param1:*) : int
      {
         return param1.COMPILE_STATUS;
      }
      
      public static function get_LOW_FLOAT(param1:*) : int
      {
         return param1.LOW_FLOAT;
      }
      
      public static function get_MEDIUM_FLOAT(param1:*) : int
      {
         return param1.MEDIUM_FLOAT;
      }
      
      public static function get_HIGH_FLOAT(param1:*) : int
      {
         return param1.HIGH_FLOAT;
      }
      
      public static function get_LOW_INT(param1:*) : int
      {
         return param1.LOW_INT;
      }
      
      public static function get_MEDIUM_INT(param1:*) : int
      {
         return param1.MEDIUM_INT;
      }
      
      public static function get_HIGH_INT(param1:*) : int
      {
         return param1.HIGH_INT;
      }
      
      public static function get_FRAMEBUFFER(param1:*) : int
      {
         return param1.FRAMEBUFFER;
      }
      
      public static function get_RENDERBUFFER(param1:*) : int
      {
         return param1.RENDERBUFFER;
      }
      
      public static function get_RGBA4(param1:*) : int
      {
         return param1.RGBA4;
      }
      
      public static function get_RGB5_A1(param1:*) : int
      {
         return param1.RGB5_A1;
      }
      
      public static function get_RGB565(param1:*) : int
      {
         return param1.RGB565;
      }
      
      public static function get_DEPTH_COMPONENT16(param1:*) : int
      {
         return param1.DEPTH_COMPONENT16;
      }
      
      public static function get_STENCIL_INDEX(param1:*) : int
      {
         return param1.STENCIL_INDEX;
      }
      
      public static function get_STENCIL_INDEX8(param1:*) : int
      {
         return param1.STENCIL_INDEX8;
      }
      
      public static function get_DEPTH_STENCIL(param1:*) : int
      {
         return param1.DEPTH_STENCIL;
      }
      
      public static function get_RENDERBUFFER_WIDTH(param1:*) : int
      {
         return param1.RENDERBUFFER_WIDTH;
      }
      
      public static function get_RENDERBUFFER_HEIGHT(param1:*) : int
      {
         return param1.RENDERBUFFER_HEIGHT;
      }
      
      public static function get_RENDERBUFFER_INTERNAL_FORMAT(param1:*) : int
      {
         return param1.RENDERBUFFER_INTERNAL_FORMAT;
      }
      
      public static function get_RENDERBUFFER_RED_SIZE(param1:*) : int
      {
         return param1.RENDERBUFFER_RED_SIZE;
      }
      
      public static function get_RENDERBUFFER_GREEN_SIZE(param1:*) : int
      {
         return param1.RENDERBUFFER_GREEN_SIZE;
      }
      
      public static function get_RENDERBUFFER_BLUE_SIZE(param1:*) : int
      {
         return param1.RENDERBUFFER_BLUE_SIZE;
      }
      
      public static function get_RENDERBUFFER_ALPHA_SIZE(param1:*) : int
      {
         return param1.RENDERBUFFER_ALPHA_SIZE;
      }
      
      public static function get_RENDERBUFFER_DEPTH_SIZE(param1:*) : int
      {
         return param1.RENDERBUFFER_DEPTH_SIZE;
      }
      
      public static function get_RENDERBUFFER_STENCIL_SIZE(param1:*) : int
      {
         return param1.RENDERBUFFER_STENCIL_SIZE;
      }
      
      public static function get_FRAMEBUFFER_ATTACHMENT_OBJECT_TYPE(param1:*) : int
      {
         return param1.FRAMEBUFFER_ATTACHMENT_OBJECT_TYPE;
      }
      
      public static function get_FRAMEBUFFER_ATTACHMENT_OBJECT_NAME(param1:*) : int
      {
         return param1.FRAMEBUFFER_ATTACHMENT_OBJECT_NAME;
      }
      
      public static function get_FRAMEBUFFER_ATTACHMENT_TEXTURE_LEVEL(param1:*) : int
      {
         return param1.FRAMEBUFFER_ATTACHMENT_TEXTURE_LEVEL;
      }
      
      public static function get_FRAMEBUFFER_ATTACHMENT_TEXTURE_CUBE_MAP_FACE(param1:*) : int
      {
         return param1.FRAMEBUFFER_ATTACHMENT_TEXTURE_CUBE_MAP_FACE;
      }
      
      public static function get_COLOR_ATTACHMENT0(param1:*) : int
      {
         return param1.COLOR_ATTACHMENT0;
      }
      
      public static function get_DEPTH_ATTACHMENT(param1:*) : int
      {
         return param1.DEPTH_ATTACHMENT;
      }
      
      public static function get_STENCIL_ATTACHMENT(param1:*) : int
      {
         return param1.STENCIL_ATTACHMENT;
      }
      
      public static function get_DEPTH_STENCIL_ATTACHMENT(param1:*) : int
      {
         return param1.DEPTH_STENCIL_ATTACHMENT;
      }
      
      public static function get_NONE(param1:*) : int
      {
         return param1.NONE;
      }
      
      public static function get_FRAMEBUFFER_COMPLETE(param1:*) : int
      {
         return param1.FRAMEBUFFER_COMPLETE;
      }
      
      public static function get_FRAMEBUFFER_INCOMPLETE_ATTACHMENT(param1:*) : int
      {
         return param1.FRAMEBUFFER_INCOMPLETE_ATTACHMENT;
      }
      
      public static function get_FRAMEBUFFER_INCOMPLETE_MISSING_ATTACHMENT(param1:*) : int
      {
         return param1.FRAMEBUFFER_INCOMPLETE_MISSING_ATTACHMENT;
      }
      
      public static function get_FRAMEBUFFER_INCOMPLETE_DIMENSIONS(param1:*) : int
      {
         return param1.FRAMEBUFFER_INCOMPLETE_DIMENSIONS;
      }
      
      public static function get_FRAMEBUFFER_UNSUPPORTED(param1:*) : int
      {
         return param1.FRAMEBUFFER_UNSUPPORTED;
      }
      
      public static function get_FRAMEBUFFER_BINDING(param1:*) : int
      {
         return param1.FRAMEBUFFER_BINDING;
      }
      
      public static function get_RENDERBUFFER_BINDING(param1:*) : int
      {
         return param1.RENDERBUFFER_BINDING;
      }
      
      public static function get_MAX_RENDERBUFFER_SIZE(param1:*) : int
      {
         return param1.MAX_RENDERBUFFER_SIZE;
      }
      
      public static function get_INVALID_FRAMEBUFFER_OPERATION(param1:*) : int
      {
         return param1.INVALID_FRAMEBUFFER_OPERATION;
      }
      
      public static function get_UNPACK_FLIP_Y_WEBGL(param1:*) : int
      {
         return param1.UNPACK_FLIP_Y_WEBGL;
      }
      
      public static function get_UNPACK_PREMULTIPLY_ALPHA_WEBGL(param1:*) : int
      {
         return param1.UNPACK_PREMULTIPLY_ALPHA_WEBGL;
      }
      
      public static function get_CONTEXT_LOST_WEBGL(param1:*) : int
      {
         return param1.CONTEXT_LOST_WEBGL;
      }
      
      public static function get_UNPACK_COLORSPACE_CONVERSION_WEBGL(param1:*) : int
      {
         return param1.UNPACK_COLORSPACE_CONVERSION_WEBGL;
      }
      
      public static function get_BROWSER_DEFAULT_WEBGL(param1:*) : int
      {
         return param1.BROWSER_DEFAULT_WEBGL;
      }
      
      public static function get_READ_BUFFER(param1:*) : int
      {
         return param1.READ_BUFFER;
      }
      
      public static function get_UNPACK_ROW_LENGTH(param1:*) : int
      {
         return param1.UNPACK_ROW_LENGTH;
      }
      
      public static function get_UNPACK_SKIP_ROWS(param1:*) : int
      {
         return param1.UNPACK_SKIP_ROWS;
      }
      
      public static function get_UNPACK_SKIP_PIXELS(param1:*) : int
      {
         return param1.UNPACK_SKIP_PIXELS;
      }
      
      public static function get_PACK_ROW_LENGTH(param1:*) : int
      {
         return param1.PACK_ROW_LENGTH;
      }
      
      public static function get_PACK_SKIP_ROWS(param1:*) : int
      {
         return param1.PACK_SKIP_ROWS;
      }
      
      public static function get_PACK_SKIP_PIXELS(param1:*) : int
      {
         return param1.PACK_SKIP_PIXELS;
      }
      
      public static function get_TEXTURE_BINDING_3D(param1:*) : int
      {
         return param1.TEXTURE_BINDING_3D;
      }
      
      public static function get_UNPACK_SKIP_IMAGES(param1:*) : int
      {
         return param1.UNPACK_SKIP_IMAGES;
      }
      
      public static function get_UNPACK_IMAGE_HEIGHT(param1:*) : int
      {
         return param1.UNPACK_IMAGE_HEIGHT;
      }
      
      public static function get_MAX_3D_TEXTURE_SIZE(param1:*) : int
      {
         return param1.MAX_3D_TEXTURE_SIZE;
      }
      
      public static function get_MAX_ELEMENTS_VERTICES(param1:*) : int
      {
         return param1.MAX_ELEMENTS_VERTICES;
      }
      
      public static function get_MAX_ELEMENTS_INDICES(param1:*) : int
      {
         return param1.MAX_ELEMENTS_INDICES;
      }
      
      public static function get_MAX_TEXTURE_LOD_BIAS(param1:*) : int
      {
         return param1.MAX_TEXTURE_LOD_BIAS;
      }
      
      public static function get_MAX_FRAGMENT_UNIFORM_COMPONENTS(param1:*) : int
      {
         return param1.MAX_FRAGMENT_UNIFORM_COMPONENTS;
      }
      
      public static function get_MAX_VERTEX_UNIFORM_COMPONENTS(param1:*) : int
      {
         return param1.MAX_VERTEX_UNIFORM_COMPONENTS;
      }
      
      public static function get_MAX_ARRAY_TEXTURE_LAYERS(param1:*) : int
      {
         return param1.MAX_ARRAY_TEXTURE_LAYERS;
      }
      
      public static function get_MIN_PROGRAM_TEXEL_OFFSET(param1:*) : int
      {
         return param1.MIN_PROGRAM_TEXEL_OFFSET;
      }
      
      public static function get_MAX_PROGRAM_TEXEL_OFFSET(param1:*) : int
      {
         return param1.MAX_PROGRAM_TEXEL_OFFSET;
      }
      
      public static function get_MAX_VARYING_COMPONENTS(param1:*) : int
      {
         return param1.MAX_VARYING_COMPONENTS;
      }
      
      public static function get_FRAGMENT_SHADER_DERIVATIVE_HINT(param1:*) : int
      {
         return param1.FRAGMENT_SHADER_DERIVATIVE_HINT;
      }
      
      public static function get_RASTERIZER_DISCARD(param1:*) : int
      {
         return param1.RASTERIZER_DISCARD;
      }
      
      public static function get_VERTEX_ARRAY_BINDING(param1:*) : int
      {
         return param1.VERTEX_ARRAY_BINDING;
      }
      
      public static function get_MAX_VERTEX_OUTPUT_COMPONENTS(param1:*) : int
      {
         return param1.MAX_VERTEX_OUTPUT_COMPONENTS;
      }
      
      public static function get_MAX_FRAGMENT_INPUT_COMPONENTS(param1:*) : int
      {
         return param1.MAX_FRAGMENT_INPUT_COMPONENTS;
      }
      
      public static function get_MAX_SERVER_WAIT_TIMEOUT(param1:*) : int
      {
         return param1.MAX_SERVER_WAIT_TIMEOUT;
      }
      
      public static function get_MAX_ELEMENT_INDEX(param1:*) : int
      {
         return param1.MAX_ELEMENT_INDEX;
      }
      
      public static function get_RED(param1:*) : int
      {
         return param1.RED;
      }
      
      public static function get_RGB8(param1:*) : int
      {
         return param1.RGB8;
      }
      
      public static function get_RGBA8(param1:*) : int
      {
         return param1.RGBA8;
      }
      
      public static function get_RGB10_A2(param1:*) : int
      {
         return param1.RGB10_A2;
      }
      
      public static function get_TEXTURE_3D(param1:*) : int
      {
         return param1.TEXTURE_3D;
      }
      
      public static function get_TEXTURE_WRAP_R(param1:*) : int
      {
         return param1.TEXTURE_WRAP_R;
      }
      
      public static function get_TEXTURE_MIN_LOD(param1:*) : int
      {
         return param1.TEXTURE_MIN_LOD;
      }
      
      public static function get_TEXTURE_MAX_LOD(param1:*) : int
      {
         return param1.TEXTURE_MAX_LOD;
      }
      
      public static function get_TEXTURE_BASE_LEVEL(param1:*) : int
      {
         return param1.TEXTURE_BASE_LEVEL;
      }
      
      public static function get_TEXTURE_MAX_LEVEL(param1:*) : int
      {
         return param1.TEXTURE_MAX_LEVEL;
      }
      
      public static function get_TEXTURE_COMPARE_MODE(param1:*) : int
      {
         return param1.TEXTURE_COMPARE_MODE;
      }
      
      public static function get_TEXTURE_COMPARE_FUNC(param1:*) : int
      {
         return param1.TEXTURE_COMPARE_FUNC;
      }
      
      public static function get_SRGB(param1:*) : int
      {
         return param1.SRGB;
      }
      
      public static function get_SRGB8(param1:*) : int
      {
         return param1.SRGB8;
      }
      
      public static function get_SRGB8_ALPHA8(param1:*) : int
      {
         return param1.SRGB8_ALPHA8;
      }
      
      public static function get_COMPARE_REF_TO_TEXTURE(param1:*) : int
      {
         return param1.COMPARE_REF_TO_TEXTURE;
      }
      
      public static function get_RGBA32F(param1:*) : int
      {
         return param1.RGBA32F;
      }
      
      public static function get_RGB32F(param1:*) : int
      {
         return param1.RGB32F;
      }
      
      public static function get_RGBA16F(param1:*) : int
      {
         return param1.RGBA16F;
      }
      
      public static function get_RGB16F(param1:*) : int
      {
         return param1.RGB16F;
      }
      
      public static function get_TEXTURE_2D_ARRAY(param1:*) : int
      {
         return param1.TEXTURE_2D_ARRAY;
      }
      
      public static function get_TEXTURE_BINDING_2D_ARRAY(param1:*) : int
      {
         return param1.TEXTURE_BINDING_2D_ARRAY;
      }
      
      public static function get_R11F_G11F_B10F(param1:*) : int
      {
         return param1.R11F_G11F_B10F;
      }
      
      public static function get_RGB9_E5(param1:*) : int
      {
         return param1.RGB9_E5;
      }
      
      public static function get_RGBA32UI(param1:*) : int
      {
         return param1.RGBA32UI;
      }
      
      public static function get_RGB32UI(param1:*) : int
      {
         return param1.RGB32UI;
      }
      
      public static function get_RGBA16UI(param1:*) : int
      {
         return param1.RGBA16UI;
      }
      
      public static function get_RGB16UI(param1:*) : int
      {
         return param1.RGB16UI;
      }
      
      public static function get_RGBA8UI(param1:*) : int
      {
         return param1.RGBA8UI;
      }
      
      public static function get_RGB8UI(param1:*) : int
      {
         return param1.RGB8UI;
      }
      
      public static function get_RGBA32I(param1:*) : int
      {
         return param1.RGBA32I;
      }
      
      public static function get_RGB32I(param1:*) : int
      {
         return param1.RGB32I;
      }
      
      public static function get_RGBA16I(param1:*) : int
      {
         return param1.RGBA16I;
      }
      
      public static function get_RGB16I(param1:*) : int
      {
         return param1.RGB16I;
      }
      
      public static function get_RGBA8I(param1:*) : int
      {
         return param1.RGBA8I;
      }
      
      public static function get_RGB8I(param1:*) : int
      {
         return param1.RGB8I;
      }
      
      public static function get_RED_INTEGER(param1:*) : int
      {
         return param1.RED_INTEGER;
      }
      
      public static function get_RGB_INTEGER(param1:*) : int
      {
         return param1.RGB_INTEGER;
      }
      
      public static function get_RGBA_INTEGER(param1:*) : int
      {
         return param1.RGBA_INTEGER;
      }
      
      public static function get_R8(param1:*) : int
      {
         return param1.R8;
      }
      
      public static function get_RG8(param1:*) : int
      {
         return param1.RG8;
      }
      
      public static function get_R16F(param1:*) : int
      {
         return param1.R16F;
      }
      
      public static function get_R32F(param1:*) : int
      {
         return param1.R32F;
      }
      
      public static function get_RG16F(param1:*) : int
      {
         return param1.RG16F;
      }
      
      public static function get_RG32F(param1:*) : int
      {
         return param1.RG32F;
      }
      
      public static function get_R8I(param1:*) : int
      {
         return param1.R8I;
      }
      
      public static function get_R8UI(param1:*) : int
      {
         return param1.R8UI;
      }
      
      public static function get_R16I(param1:*) : int
      {
         return param1.R16I;
      }
      
      public static function get_R16UI(param1:*) : int
      {
         return param1.R16UI;
      }
      
      public static function get_R32I(param1:*) : int
      {
         return param1.R32I;
      }
      
      public static function get_R32UI(param1:*) : int
      {
         return param1.R32UI;
      }
      
      public static function get_RG8I(param1:*) : int
      {
         return param1.RG8I;
      }
      
      public static function get_RG8UI(param1:*) : int
      {
         return param1.RG8UI;
      }
      
      public static function get_RG16I(param1:*) : int
      {
         return param1.RG16I;
      }
      
      public static function get_RG16UI(param1:*) : int
      {
         return param1.RG16UI;
      }
      
      public static function get_RG32I(param1:*) : int
      {
         return param1.RG32I;
      }
      
      public static function get_RG32UI(param1:*) : int
      {
         return param1.RG32UI;
      }
      
      public static function get_R8_SNORM(param1:*) : int
      {
         return param1.R8_SNORM;
      }
      
      public static function get_RG8_SNORM(param1:*) : int
      {
         return param1.RG8_SNORM;
      }
      
      public static function get_RGB8_SNORM(param1:*) : int
      {
         return param1.RGB8_SNORM;
      }
      
      public static function get_RGBA8_SNORM(param1:*) : int
      {
         return param1.RGBA8_SNORM;
      }
      
      public static function get_RGB10_A2UI(param1:*) : int
      {
         return param1.RGB10_A2UI;
      }
      
      public static function get_TEXTURE_IMMUTABLE_FORMAT(param1:*) : int
      {
         return param1.TEXTURE_IMMUTABLE_FORMAT;
      }
      
      public static function get_TEXTURE_IMMUTABLE_LEVELS(param1:*) : int
      {
         return param1.TEXTURE_IMMUTABLE_LEVELS;
      }
      
      public static function get_UNSIGNED_INT_2_10_10_10_REV(param1:*) : int
      {
         return param1.UNSIGNED_INT_2_10_10_10_REV;
      }
      
      public static function get_UNSIGNED_INT_10F_11F_11F_REV(param1:*) : int
      {
         return param1.UNSIGNED_INT_10F_11F_11F_REV;
      }
      
      public static function get_UNSIGNED_INT_5_9_9_9_REV(param1:*) : int
      {
         return param1.UNSIGNED_INT_5_9_9_9_REV;
      }
      
      public static function get_FLOAT_32_UNSIGNED_INT_24_8_REV(param1:*) : int
      {
         return param1.FLOAT_32_UNSIGNED_INT_24_8_REV;
      }
      
      public static function get_UNSIGNED_INT_24_8(param1:*) : int
      {
         return param1.UNSIGNED_INT_24_8;
      }
      
      public static function get_HALF_FLOAT(param1:*) : int
      {
         return param1.HALF_FLOAT;
      }
      
      public static function get_RG(param1:*) : int
      {
         return param1.RG;
      }
      
      public static function get_RG_INTEGER(param1:*) : int
      {
         return param1.RG_INTEGER;
      }
      
      public static function get_INT_2_10_10_10_REV(param1:*) : int
      {
         return param1.INT_2_10_10_10_REV;
      }
      
      public static function get_CURRENT_QUERY(param1:*) : int
      {
         return param1.CURRENT_QUERY;
      }
      
      public static function get_QUERY_RESULT(param1:*) : int
      {
         return param1.QUERY_RESULT;
      }
      
      public static function get_QUERY_RESULT_AVAILABLE(param1:*) : int
      {
         return param1.QUERY_RESULT_AVAILABLE;
      }
      
      public static function get_ANY_SAMPLES_PASSED(param1:*) : int
      {
         return param1.ANY_SAMPLES_PASSED;
      }
      
      public static function get_ANY_SAMPLES_PASSED_CONSERVATIVE(param1:*) : int
      {
         return param1.ANY_SAMPLES_PASSED_CONSERVATIVE;
      }
      
      public static function get_MAX_DRAW_BUFFERS(param1:*) : int
      {
         return param1.MAX_DRAW_BUFFERS;
      }
      
      public static function get_DRAW_BUFFER0(param1:*) : int
      {
         return param1.DRAW_BUFFER0;
      }
      
      public static function get_DRAW_BUFFER1(param1:*) : int
      {
         return param1.DRAW_BUFFER1;
      }
      
      public static function get_DRAW_BUFFER2(param1:*) : int
      {
         return param1.DRAW_BUFFER2;
      }
      
      public static function get_DRAW_BUFFER3(param1:*) : int
      {
         return param1.DRAW_BUFFER3;
      }
      
      public static function get_DRAW_BUFFER4(param1:*) : int
      {
         return param1.DRAW_BUFFER4;
      }
      
      public static function get_DRAW_BUFFER5(param1:*) : int
      {
         return param1.DRAW_BUFFER5;
      }
      
      public static function get_DRAW_BUFFER6(param1:*) : int
      {
         return param1.DRAW_BUFFER6;
      }
      
      public static function get_DRAW_BUFFER7(param1:*) : int
      {
         return param1.DRAW_BUFFER7;
      }
      
      public static function get_DRAW_BUFFER8(param1:*) : int
      {
         return param1.DRAW_BUFFER8;
      }
      
      public static function get_DRAW_BUFFER9(param1:*) : int
      {
         return param1.DRAW_BUFFER9;
      }
      
      public static function get_DRAW_BUFFER10(param1:*) : int
      {
         return param1.DRAW_BUFFER10;
      }
      
      public static function get_DRAW_BUFFER11(param1:*) : int
      {
         return param1.DRAW_BUFFER11;
      }
      
      public static function get_DRAW_BUFFER12(param1:*) : int
      {
         return param1.DRAW_BUFFER12;
      }
      
      public static function get_DRAW_BUFFER13(param1:*) : int
      {
         return param1.DRAW_BUFFER13;
      }
      
      public static function get_DRAW_BUFFER14(param1:*) : int
      {
         return param1.DRAW_BUFFER14;
      }
      
      public static function get_DRAW_BUFFER15(param1:*) : int
      {
         return param1.DRAW_BUFFER15;
      }
      
      public static function get_MAX_COLOR_ATTACHMENTS(param1:*) : int
      {
         return param1.MAX_COLOR_ATTACHMENTS;
      }
      
      public static function get_COLOR_ATTACHMENT1(param1:*) : int
      {
         return param1.COLOR_ATTACHMENT1;
      }
      
      public static function get_COLOR_ATTACHMENT2(param1:*) : int
      {
         return param1.COLOR_ATTACHMENT2;
      }
      
      public static function get_COLOR_ATTACHMENT3(param1:*) : int
      {
         return param1.COLOR_ATTACHMENT3;
      }
      
      public static function get_COLOR_ATTACHMENT4(param1:*) : int
      {
         return param1.COLOR_ATTACHMENT4;
      }
      
      public static function get_COLOR_ATTACHMENT5(param1:*) : int
      {
         return param1.COLOR_ATTACHMENT5;
      }
      
      public static function get_COLOR_ATTACHMENT6(param1:*) : int
      {
         return param1.COLOR_ATTACHMENT6;
      }
      
      public static function get_COLOR_ATTACHMENT7(param1:*) : int
      {
         return param1.COLOR_ATTACHMENT7;
      }
      
      public static function get_COLOR_ATTACHMENT8(param1:*) : int
      {
         return param1.COLOR_ATTACHMENT8;
      }
      
      public static function get_COLOR_ATTACHMENT9(param1:*) : int
      {
         return param1.COLOR_ATTACHMENT9;
      }
      
      public static function get_COLOR_ATTACHMENT10(param1:*) : int
      {
         return param1.COLOR_ATTACHMENT10;
      }
      
      public static function get_COLOR_ATTACHMENT11(param1:*) : int
      {
         return param1.COLOR_ATTACHMENT11;
      }
      
      public static function get_COLOR_ATTACHMENT12(param1:*) : int
      {
         return param1.COLOR_ATTACHMENT12;
      }
      
      public static function get_COLOR_ATTACHMENT13(param1:*) : int
      {
         return param1.COLOR_ATTACHMENT13;
      }
      
      public static function get_COLOR_ATTACHMENT14(param1:*) : int
      {
         return param1.COLOR_ATTACHMENT14;
      }
      
      public static function get_COLOR_ATTACHMENT15(param1:*) : int
      {
         return param1.COLOR_ATTACHMENT15;
      }
      
      public static function get_SAMPLER_3D(param1:*) : int
      {
         return param1.SAMPLER_3D;
      }
      
      public static function get_SAMPLER_2D_SHADOW(param1:*) : int
      {
         return param1.SAMPLER_2D_SHADOW;
      }
      
      public static function get_SAMPLER_2D_ARRAY(param1:*) : int
      {
         return param1.SAMPLER_2D_ARRAY;
      }
      
      public static function get_SAMPLER_2D_ARRAY_SHADOW(param1:*) : int
      {
         return param1.SAMPLER_2D_ARRAY_SHADOW;
      }
      
      public static function get_SAMPLER_CUBE_SHADOW(param1:*) : int
      {
         return param1.SAMPLER_CUBE_SHADOW;
      }
      
      public static function get_INT_SAMPLER_2D(param1:*) : int
      {
         return param1.INT_SAMPLER_2D;
      }
      
      public static function get_INT_SAMPLER_3D(param1:*) : int
      {
         return param1.INT_SAMPLER_3D;
      }
      
      public static function get_INT_SAMPLER_CUBE(param1:*) : int
      {
         return param1.INT_SAMPLER_CUBE;
      }
      
      public static function get_INT_SAMPLER_2D_ARRAY(param1:*) : int
      {
         return param1.INT_SAMPLER_2D_ARRAY;
      }
      
      public static function get_UNSIGNED_INT_SAMPLER_2D(param1:*) : int
      {
         return param1.UNSIGNED_INT_SAMPLER_2D;
      }
      
      public static function get_UNSIGNED_INT_SAMPLER_3D(param1:*) : int
      {
         return param1.UNSIGNED_INT_SAMPLER_3D;
      }
      
      public static function get_UNSIGNED_INT_SAMPLER_CUBE(param1:*) : int
      {
         return param1.UNSIGNED_INT_SAMPLER_CUBE;
      }
      
      public static function get_UNSIGNED_INT_SAMPLER_2D_ARRAY(param1:*) : int
      {
         return param1.UNSIGNED_INT_SAMPLER_2D_ARRAY;
      }
      
      public static function get_MAX_SAMPLES(param1:*) : int
      {
         return param1.MAX_SAMPLES;
      }
      
      public static function get_SAMPLER_BINDING(param1:*) : int
      {
         return param1.SAMPLER_BINDING;
      }
      
      public static function get_PIXEL_PACK_BUFFER(param1:*) : int
      {
         return param1.PIXEL_PACK_BUFFER;
      }
      
      public static function get_PIXEL_UNPACK_BUFFER(param1:*) : int
      {
         return param1.PIXEL_UNPACK_BUFFER;
      }
      
      public static function get_PIXEL_PACK_BUFFER_BINDING(param1:*) : int
      {
         return param1.PIXEL_PACK_BUFFER_BINDING;
      }
      
      public static function get_PIXEL_UNPACK_BUFFER_BINDING(param1:*) : int
      {
         return param1.PIXEL_UNPACK_BUFFER_BINDING;
      }
      
      public static function get_COPY_READ_BUFFER(param1:*) : int
      {
         return param1.COPY_READ_BUFFER;
      }
      
      public static function get_COPY_WRITE_BUFFER(param1:*) : int
      {
         return param1.COPY_WRITE_BUFFER;
      }
      
      public static function get_COPY_READ_BUFFER_BINDING(param1:*) : int
      {
         return param1.COPY_READ_BUFFER_BINDING;
      }
      
      public static function get_COPY_WRITE_BUFFER_BINDING(param1:*) : int
      {
         return param1.COPY_WRITE_BUFFER_BINDING;
      }
      
      public static function get_FLOAT_MAT2x3(param1:*) : int
      {
         return param1.FLOAT_MAT2x3;
      }
      
      public static function get_FLOAT_MAT2x4(param1:*) : int
      {
         return param1.FLOAT_MAT2x4;
      }
      
      public static function get_FLOAT_MAT3x2(param1:*) : int
      {
         return param1.FLOAT_MAT3x2;
      }
      
      public static function get_FLOAT_MAT3x4(param1:*) : int
      {
         return param1.FLOAT_MAT3x4;
      }
      
      public static function get_FLOAT_MAT4x2(param1:*) : int
      {
         return param1.FLOAT_MAT4x2;
      }
      
      public static function get_FLOAT_MAT4x3(param1:*) : int
      {
         return param1.FLOAT_MAT4x3;
      }
      
      public static function get_UNSIGNED_INT_VEC2(param1:*) : int
      {
         return param1.UNSIGNED_INT_VEC2;
      }
      
      public static function get_UNSIGNED_INT_VEC3(param1:*) : int
      {
         return param1.UNSIGNED_INT_VEC3;
      }
      
      public static function get_UNSIGNED_INT_VEC4(param1:*) : int
      {
         return param1.UNSIGNED_INT_VEC4;
      }
      
      public static function get_UNSIGNED_NORMALIZED(param1:*) : int
      {
         return param1.UNSIGNED_NORMALIZED;
      }
      
      public static function get_SIGNED_NORMALIZED(param1:*) : int
      {
         return param1.SIGNED_NORMALIZED;
      }
      
      public static function get_VERTEX_ATTRIB_ARRAY_INTEGER(param1:*) : int
      {
         return param1.VERTEX_ATTRIB_ARRAY_INTEGER;
      }
      
      public static function get_VERTEX_ATTRIB_ARRAY_DIVISOR(param1:*) : int
      {
         return param1.VERTEX_ATTRIB_ARRAY_DIVISOR;
      }
      
      public static function get_TRANSFORM_FEEDBACK_BUFFER_MODE(param1:*) : int
      {
         return param1.TRANSFORM_FEEDBACK_BUFFER_MODE;
      }
      
      public static function get_MAX_TRANSFORM_FEEDBACK_SEPARATE_COMPONENTS(param1:*) : int
      {
         return param1.MAX_TRANSFORM_FEEDBACK_SEPARATE_COMPONENTS;
      }
      
      public static function get_TRANSFORM_FEEDBACK_VARYINGS(param1:*) : int
      {
         return param1.TRANSFORM_FEEDBACK_VARYINGS;
      }
      
      public static function get_TRANSFORM_FEEDBACK_BUFFER_START(param1:*) : int
      {
         return param1.TRANSFORM_FEEDBACK_BUFFER_START;
      }
      
      public static function get_TRANSFORM_FEEDBACK_BUFFER_SIZE(param1:*) : int
      {
         return param1.TRANSFORM_FEEDBACK_BUFFER_SIZE;
      }
      
      public static function get_TRANSFORM_FEEDBACK_PRIMITIVES_WRITTEN(param1:*) : int
      {
         return param1.TRANSFORM_FEEDBACK_PRIMITIVES_WRITTEN;
      }
      
      public static function get_MAX_TRANSFORM_FEEDBACK_INTERLEAVED_COMPONENTS(param1:*) : int
      {
         return param1.MAX_TRANSFORM_FEEDBACK_INTERLEAVED_COMPONENTS;
      }
      
      public static function get_MAX_TRANSFORM_FEEDBACK_SEPARATE_ATTRIBS(param1:*) : int
      {
         return param1.MAX_TRANSFORM_FEEDBACK_SEPARATE_ATTRIBS;
      }
      
      public static function get_INTERLEAVED_ATTRIBS(param1:*) : int
      {
         return param1.INTERLEAVED_ATTRIBS;
      }
      
      public static function get_SEPARATE_ATTRIBS(param1:*) : int
      {
         return param1.SEPARATE_ATTRIBS;
      }
      
      public static function get_TRANSFORM_FEEDBACK_BUFFER(param1:*) : int
      {
         return param1.TRANSFORM_FEEDBACK_BUFFER;
      }
      
      public static function get_TRANSFORM_FEEDBACK_BUFFER_BINDING(param1:*) : int
      {
         return param1.TRANSFORM_FEEDBACK_BUFFER_BINDING;
      }
      
      public static function get_TRANSFORM_FEEDBACK(param1:*) : int
      {
         return param1.TRANSFORM_FEEDBACK;
      }
      
      public static function get_TRANSFORM_FEEDBACK_PAUSED(param1:*) : int
      {
         return param1.TRANSFORM_FEEDBACK_PAUSED;
      }
      
      public static function get_TRANSFORM_FEEDBACK_ACTIVE(param1:*) : int
      {
         return param1.TRANSFORM_FEEDBACK_ACTIVE;
      }
      
      public static function get_TRANSFORM_FEEDBACK_BINDING(param1:*) : int
      {
         return param1.TRANSFORM_FEEDBACK_BINDING;
      }
      
      public static function get_FRAMEBUFFER_ATTACHMENT_COLOR_ENCODING(param1:*) : int
      {
         return param1.FRAMEBUFFER_ATTACHMENT_COLOR_ENCODING;
      }
      
      public static function get_FRAMEBUFFER_ATTACHMENT_COMPONENT_TYPE(param1:*) : int
      {
         return param1.FRAMEBUFFER_ATTACHMENT_COMPONENT_TYPE;
      }
      
      public static function get_FRAMEBUFFER_ATTACHMENT_RED_SIZE(param1:*) : int
      {
         return param1.FRAMEBUFFER_ATTACHMENT_RED_SIZE;
      }
      
      public static function get_FRAMEBUFFER_ATTACHMENT_GREEN_SIZE(param1:*) : int
      {
         return param1.FRAMEBUFFER_ATTACHMENT_GREEN_SIZE;
      }
      
      public static function get_FRAMEBUFFER_ATTACHMENT_BLUE_SIZE(param1:*) : int
      {
         return param1.FRAMEBUFFER_ATTACHMENT_BLUE_SIZE;
      }
      
      public static function get_FRAMEBUFFER_ATTACHMENT_ALPHA_SIZE(param1:*) : int
      {
         return param1.FRAMEBUFFER_ATTACHMENT_ALPHA_SIZE;
      }
      
      public static function get_FRAMEBUFFER_ATTACHMENT_DEPTH_SIZE(param1:*) : int
      {
         return param1.FRAMEBUFFER_ATTACHMENT_DEPTH_SIZE;
      }
      
      public static function get_FRAMEBUFFER_ATTACHMENT_STENCIL_SIZE(param1:*) : int
      {
         return param1.FRAMEBUFFER_ATTACHMENT_STENCIL_SIZE;
      }
      
      public static function get_FRAMEBUFFER_DEFAULT(param1:*) : int
      {
         return param1.FRAMEBUFFER_DEFAULT;
      }
      
      public static function get_DEPTH24_STENCIL8(param1:*) : int
      {
         return param1.DEPTH24_STENCIL8;
      }
      
      public static function get_DRAW_FRAMEBUFFER_BINDING(param1:*) : int
      {
         return param1.DRAW_FRAMEBUFFER_BINDING;
      }
      
      public static function get_READ_FRAMEBUFFER(param1:*) : int
      {
         return param1.READ_FRAMEBUFFER;
      }
      
      public static function get_DRAW_FRAMEBUFFER(param1:*) : int
      {
         return param1.DRAW_FRAMEBUFFER;
      }
      
      public static function get_READ_FRAMEBUFFER_BINDING(param1:*) : int
      {
         return param1.READ_FRAMEBUFFER_BINDING;
      }
      
      public static function get_RENDERBUFFER_SAMPLES(param1:*) : int
      {
         return param1.RENDERBUFFER_SAMPLES;
      }
      
      public static function get_FRAMEBUFFER_ATTACHMENT_TEXTURE_LAYER(param1:*) : int
      {
         return param1.FRAMEBUFFER_ATTACHMENT_TEXTURE_LAYER;
      }
      
      public static function get_FRAMEBUFFER_INCOMPLETE_MULTISAMPLE(param1:*) : int
      {
         return param1.FRAMEBUFFER_INCOMPLETE_MULTISAMPLE;
      }
      
      public static function get_UNIFORM_BUFFER(param1:*) : int
      {
         return param1.UNIFORM_BUFFER;
      }
      
      public static function get_UNIFORM_BUFFER_BINDING(param1:*) : int
      {
         return param1.UNIFORM_BUFFER_BINDING;
      }
      
      public static function get_UNIFORM_BUFFER_START(param1:*) : int
      {
         return param1.UNIFORM_BUFFER_START;
      }
      
      public static function get_UNIFORM_BUFFER_SIZE(param1:*) : int
      {
         return param1.UNIFORM_BUFFER_SIZE;
      }
      
      public static function get_MAX_VERTEX_UNIFORM_BLOCKS(param1:*) : int
      {
         return param1.MAX_VERTEX_UNIFORM_BLOCKS;
      }
      
      public static function get_MAX_FRAGMENT_UNIFORM_BLOCKS(param1:*) : int
      {
         return param1.MAX_FRAGMENT_UNIFORM_BLOCKS;
      }
      
      public static function get_MAX_COMBINED_UNIFORM_BLOCKS(param1:*) : int
      {
         return param1.MAX_COMBINED_UNIFORM_BLOCKS;
      }
      
      public static function get_MAX_UNIFORM_BUFFER_BINDINGS(param1:*) : int
      {
         return param1.MAX_UNIFORM_BUFFER_BINDINGS;
      }
      
      public static function get_MAX_UNIFORM_BLOCK_SIZE(param1:*) : int
      {
         return param1.MAX_UNIFORM_BLOCK_SIZE;
      }
      
      public static function get_MAX_COMBINED_VERTEX_UNIFORM_COMPONENTS(param1:*) : int
      {
         return param1.MAX_COMBINED_VERTEX_UNIFORM_COMPONENTS;
      }
      
      public static function get_MAX_COMBINED_FRAGMENT_UNIFORM_COMPONENTS(param1:*) : int
      {
         return param1.MAX_COMBINED_FRAGMENT_UNIFORM_COMPONENTS;
      }
      
      public static function get_UNIFORM_BUFFER_OFFSET_ALIGNMENT(param1:*) : int
      {
         return param1.UNIFORM_BUFFER_OFFSET_ALIGNMENT;
      }
      
      public static function get_ACTIVE_UNIFORM_BLOCKS(param1:*) : int
      {
         return param1.ACTIVE_UNIFORM_BLOCKS;
      }
      
      public static function get_UNIFORM_TYPE(param1:*) : int
      {
         return param1.UNIFORM_TYPE;
      }
      
      public static function get_UNIFORM_SIZE(param1:*) : int
      {
         return param1.UNIFORM_SIZE;
      }
      
      public static function get_UNIFORM_BLOCK_INDEX(param1:*) : int
      {
         return param1.UNIFORM_BLOCK_INDEX;
      }
      
      public static function get_UNIFORM_OFFSET(param1:*) : int
      {
         return param1.UNIFORM_OFFSET;
      }
      
      public static function get_UNIFORM_ARRAY_STRIDE(param1:*) : int
      {
         return param1.UNIFORM_ARRAY_STRIDE;
      }
      
      public static function get_UNIFORM_MATRIX_STRIDE(param1:*) : int
      {
         return param1.UNIFORM_MATRIX_STRIDE;
      }
      
      public static function get_UNIFORM_IS_ROW_MAJOR(param1:*) : int
      {
         return param1.UNIFORM_IS_ROW_MAJOR;
      }
      
      public static function get_UNIFORM_BLOCK_BINDING(param1:*) : int
      {
         return param1.UNIFORM_BLOCK_BINDING;
      }
      
      public static function get_UNIFORM_BLOCK_DATA_SIZE(param1:*) : int
      {
         return param1.UNIFORM_BLOCK_DATA_SIZE;
      }
      
      public static function get_UNIFORM_BLOCK_ACTIVE_UNIFORMS(param1:*) : int
      {
         return param1.UNIFORM_BLOCK_ACTIVE_UNIFORMS;
      }
      
      public static function get_UNIFORM_BLOCK_ACTIVE_UNIFORM_INDICES(param1:*) : int
      {
         return param1.UNIFORM_BLOCK_ACTIVE_UNIFORM_INDICES;
      }
      
      public static function get_UNIFORM_BLOCK_REFERENCED_BY_VERTEX_SHADER(param1:*) : int
      {
         return param1.UNIFORM_BLOCK_REFERENCED_BY_VERTEX_SHADER;
      }
      
      public static function get_UNIFORM_BLOCK_REFERENCED_BY_FRAGMENT_SHADER(param1:*) : int
      {
         return param1.UNIFORM_BLOCK_REFERENCED_BY_FRAGMENT_SHADER;
      }
      
      public static function get_OBJECT_TYPE(param1:*) : int
      {
         return param1.OBJECT_TYPE;
      }
      
      public static function get_SYNC_CONDITION(param1:*) : int
      {
         return param1.SYNC_CONDITION;
      }
      
      public static function get_SYNC_STATUS(param1:*) : int
      {
         return param1.SYNC_STATUS;
      }
      
      public static function get_SYNC_FLAGS(param1:*) : int
      {
         return param1.SYNC_FLAGS;
      }
      
      public static function get_SYNC_FENCE(param1:*) : int
      {
         return param1.SYNC_FENCE;
      }
      
      public static function get_SYNC_GPU_COMMANDS_COMPLETE(param1:*) : int
      {
         return param1.SYNC_GPU_COMMANDS_COMPLETE;
      }
      
      public static function get_UNSIGNALED(param1:*) : int
      {
         return param1.UNSIGNALED;
      }
      
      public static function get_SIGNALED(param1:*) : int
      {
         return param1.SIGNALED;
      }
      
      public static function get_ALREADY_SIGNALED(param1:*) : int
      {
         return param1.ALREADY_SIGNALED;
      }
      
      public static function get_TIMEOUT_EXPIRED(param1:*) : int
      {
         return param1.TIMEOUT_EXPIRED;
      }
      
      public static function get_CONDITION_SATISFIED(param1:*) : int
      {
         return param1.CONDITION_SATISFIED;
      }
      
      public static function get_WAIT_FAILED(param1:*) : int
      {
         return param1.WAIT_FAILED;
      }
      
      public static function get_SYNC_FLUSH_COMMANDS_BIT(param1:*) : int
      {
         return param1.SYNC_FLUSH_COMMANDS_BIT;
      }
      
      public static function get_COLOR(param1:*) : int
      {
         return param1.COLOR;
      }
      
      public static function get_DEPTH(param1:*) : int
      {
         return param1.DEPTH;
      }
      
      public static function get_STENCIL(param1:*) : int
      {
         return param1.STENCIL;
      }
      
      public static function get_MIN(param1:*) : int
      {
         return param1.MIN;
      }
      
      public static function get_MAX(param1:*) : int
      {
         return param1.MAX;
      }
      
      public static function get_DEPTH_COMPONENT24(param1:*) : int
      {
         return param1.DEPTH_COMPONENT24;
      }
      
      public static function get_STREAM_READ(param1:*) : int
      {
         return param1.STREAM_READ;
      }
      
      public static function get_STREAM_COPY(param1:*) : int
      {
         return param1.STREAM_COPY;
      }
      
      public static function get_STATIC_READ(param1:*) : int
      {
         return param1.STATIC_READ;
      }
      
      public static function get_STATIC_COPY(param1:*) : int
      {
         return param1.STATIC_COPY;
      }
      
      public static function get_DYNAMIC_READ(param1:*) : int
      {
         return param1.DYNAMIC_READ;
      }
      
      public static function get_DYNAMIC_COPY(param1:*) : int
      {
         return param1.DYNAMIC_COPY;
      }
      
      public static function get_DEPTH_COMPONENT32F(param1:*) : int
      {
         return param1.DEPTH_COMPONENT32F;
      }
      
      public static function get_DEPTH32F_STENCIL8(param1:*) : int
      {
         return param1.DEPTH32F_STENCIL8;
      }
      
      public static function get_INVALID_INDEX(param1:*) : int
      {
         return param1.INVALID_INDEX;
      }
      
      public static function get_TIMEOUT_IGNORED(param1:*) : int
      {
         return param1.TIMEOUT_IGNORED;
      }
      
      public static function get_MAX_CLIENT_WAIT_TIMEOUT_WEBGL(param1:*) : int
      {
         return param1.MAX_CLIENT_WAIT_TIMEOUT_WEBGL;
      }
      
      public static function activeTexture(param1:*, param2:int) : void
      {
         param1.activeTexture(param2);
      }
      
      public static function attachShader(param1:*, param2:GLObject, param3:GLObject) : void
      {
         param1.attachShader(param2,param3);
      }
      
      public static function beginQuery(param1:*, param2:int, param3:*) : void
      {
         param1.beginQuery(param2,param3);
      }
      
      public static function beginTransformFeedback(param1:*, param2:int) : void
      {
         param1.beginTransformFeedback(param2);
      }
      
      public static function bindAttribLocation(param1:*, param2:GLObject, param3:int, param4:String) : void
      {
         param1.bindAttribLocation(param2,param3,param4);
      }
      
      public static function bindBuffer(param1:*, param2:int, param3:*) : void
      {
         param1.bindBuffer(param2,param3);
      }
      
      public static function bindBufferBase(param1:*, param2:int, param3:int, param4:*) : void
      {
         param1.bindBufferBase(param2,param3,param4);
      }
      
      public static function bindBufferRange(param1:*, param2:int, param3:int, param4:*, param5:int, param6:int) : void
      {
         param1.bindBufferRange(param2,param3,param4,param5,param6);
      }
      
      public static function bindFramebuffer(param1:*, param2:int, param3:*) : void
      {
         param1.bindFramebuffer(param2,param3);
      }
      
      public static function bindRenderbuffer(param1:*, param2:int, param3:*) : void
      {
         param1.bindRenderbuffer(param2,param3);
      }
      
      public static function bindSampler(param1:*, param2:int, param3:*) : void
      {
         param1.bindSampler(param2,param3);
      }
      
      public static function bindTexture(param1:*, param2:int, param3:*) : void
      {
         param1.bindTexture(param2,param3);
      }
      
      public static function bindTransformFeedback(param1:*, param2:int, param3:*) : void
      {
         param1.bindTransformFeedback(param2,param3);
      }
      
      public static function bindVertexArray(param1:*, param2:*) : void
      {
         param1.bindVertexArray(param2);
      }
      
      public static function blendColor(param1:*, param2:Number, param3:Number, param4:Number, param5:Number) : void
      {
         param1.blendColor(param2,param3,param4,param5);
      }
      
      public static function blendEquation(param1:*, param2:int) : void
      {
         param1.blendEquation(param2);
      }
      
      public static function blendEquationSeparate(param1:*, param2:int, param3:int) : void
      {
         param1.blendEquationSeparate(param2,param3);
      }
      
      public static function blendFunc(param1:*, param2:int, param3:int) : void
      {
         param1.blendFunc(param2,param3);
      }
      
      public static function blendFuncSeparate(param1:*, param2:int, param3:int, param4:int, param5:int) : void
      {
         param1.blendFuncSeparate(param2,param3,param4,param5);
      }
      
      public static function blitFramebuffer(param1:*, param2:int, param3:int, param4:int, param5:int, param6:int, param7:int, param8:int, param9:int, param10:int, param11:int) : void
      {
         param1.blitFramebuffer(param2,param3,param4,param5,param6,param7,param8,param9,param10,param11);
      }
      
      public static function bufferData(param1:*, param2:int, param3:ArrayBufferView, param4:int, param5:int = 0, param6:int = 0) : void
      {
         var _loc7_:int = param3 != null ? param3.byteLength : 0;
         BytePointer_Impl_.set(WebGL2RenderContext_Impl_.__tempPointer,null,param3,null,param5);
         param1.bufferData(param2,_loc7_,WebGL2RenderContext_Impl_.__tempPointer,param4);
      }
      
      public static function bufferSubData(param1:*, param2:int, param3:int, param4:ArrayBufferView, param5:int = 0, param6:Object = undefined) : void
      {
         var _loc7_:Object = param6 != null ? param6 : (param4 != null ? param4.byteLength : 0);
         BytePointer_Impl_.set(WebGL2RenderContext_Impl_.__tempPointer,null,param4,null,param5);
         param1.bufferSubData(param2,param3,_loc7_,WebGL2RenderContext_Impl_.__tempPointer);
      }
      
      public static function checkFramebufferStatus(param1:*, param2:int) : int
      {
         return param1.checkFramebufferStatus(param2);
      }
      
      public static function clear(param1:*, param2:int) : void
      {
         param1.clear(param2);
      }
      
      public static function clearBufferfi(param1:*, param2:int, param3:int, param4:Number, param5:int) : void
      {
         param1.clearBufferfi(param2,param3,param4,param5);
      }
      
      public static function clearBufferfv(param1:*, param2:int, param3:int, param4:ArrayBufferView, param5:int = 0) : void
      {
         BytePointer_Impl_.set(WebGL2RenderContext_Impl_.__tempPointer,null,param4,null,param5);
         param1.clearBufferfv(param2,param3,WebGL2RenderContext_Impl_.__tempPointer);
      }
      
      public static function clearBufferiv(param1:*, param2:int, param3:int, param4:ArrayBufferView, param5:Object = undefined) : void
      {
         BytePointer_Impl_.set(WebGL2RenderContext_Impl_.__tempPointer,null,param4,null,param5);
         param1.clearBufferiv(param2,param3,WebGL2RenderContext_Impl_.__tempPointer);
      }
      
      public static function clearBufferuiv(param1:*, param2:int, param3:int, param4:ArrayBufferView, param5:Object = undefined) : void
      {
         BytePointer_Impl_.set(WebGL2RenderContext_Impl_.__tempPointer,null,param4,null,param5);
         param1.clearBufferuiv(param2,param3,WebGL2RenderContext_Impl_.__tempPointer);
      }
      
      public static function clearColor(param1:*, param2:Number, param3:Number, param4:Number, param5:Number) : void
      {
         param1.clearColor(param2,param3,param4,param5);
      }
      
      public static function clearDepth(param1:*, param2:Number) : void
      {
         param1.clearDepthf(param2);
      }
      
      public static function clearStencil(param1:*, param2:int) : void
      {
         param1.clearStencil(param2);
      }
      
      public static function clientWaitSync(param1:*, param2:*, param3:int, param4:___Int64) : int
      {
         return param1.clientWaitSync(param2,param3,param4);
      }
      
      public static function colorMask(param1:*, param2:Boolean, param3:Boolean, param4:Boolean, param5:Boolean) : void
      {
         param1.colorMask(param2,param3,param4,param5);
      }
      
      public static function compileShader(param1:*, param2:GLObject) : void
      {
         param1.compileShader(param2);
      }
      
      public static function compressedTexImage2D(param1:*, param2:int, param3:int, param4:int, param5:int, param6:int, param7:int, param8:ArrayBufferView, param9:int = 0, param10:Object = undefined) : void
      {
         var _loc11_:Object = param10 != null ? param10 : (param8 != null ? param8.byteLength : 0);
         BytePointer_Impl_.set(WebGL2RenderContext_Impl_.__tempPointer,null,param8,null,param9);
         param1.compressedTexImage2D(param2,param3,param4,param5,param6,param7,_loc11_,WebGL2RenderContext_Impl_.__tempPointer);
      }
      
      public static function compressedTexImage3D(param1:*, param2:int, param3:int, param4:int, param5:int, param6:int, param7:int, param8:int, param9:ArrayBufferView, param10:int = 0, param11:Object = undefined) : void
      {
         var _loc12_:Object = param11 != null ? param11 : (param9 != null ? param9.byteLength : 0);
         BytePointer_Impl_.set(WebGL2RenderContext_Impl_.__tempPointer,null,param9,null,param10);
         param1.compressedTexImage3D(param2,param3,param4,param5,param6,param7,param8,_loc12_,WebGL2RenderContext_Impl_.__tempPointer);
      }
      
      public static function compressedTexSubImage2D(param1:*, param2:int, param3:int, param4:int, param5:int, param6:int, param7:int, param8:int, param9:ArrayBufferView, param10:int = 0, param11:Object = undefined) : void
      {
         var _loc12_:Object = param11 != null ? param11 : (param9 != null ? param9.byteLength : 0);
         BytePointer_Impl_.set(WebGL2RenderContext_Impl_.__tempPointer,null,param9,null,param10);
         param1.compressedTexSubImage2D(param2,param3,param4,param5,param6,param7,param8,_loc12_,WebGL2RenderContext_Impl_.__tempPointer);
      }
      
      public static function compressedTexSubImage3D(param1:*, param2:int, param3:int, param4:int, param5:int, param6:int, param7:int, param8:int, param9:int, param10:int, param11:ArrayBufferView, param12:int = 0, param13:Object = undefined) : void
      {
         var _loc14_:Object = param13 != null ? param13 : (param11 != null ? param11.byteLength : 0);
         BytePointer_Impl_.set(WebGL2RenderContext_Impl_.__tempPointer,null,param11,null,param12);
         param1.compressedTexSubImage3D(param2,param3,param4,param5,param6,param7,param8,param9,param10,_loc14_,WebGL2RenderContext_Impl_.__tempPointer);
      }
      
      public static function copyBufferSubData(param1:*, param2:int, param3:int, param4:int, param5:int, param6:int) : void
      {
         param1.copyBufferSubData(param2,param3,param4,param5,param6);
      }
      
      public static function copyTexImage2D(param1:*, param2:int, param3:int, param4:int, param5:int, param6:int, param7:int, param8:int, param9:int) : void
      {
         param1.copyTexImage2D(param2,param3,param4,param5,param6,param7,param8,param9);
      }
      
      public static function copyTexSubImage2D(param1:*, param2:int, param3:int, param4:int, param5:int, param6:int, param7:int, param8:int, param9:int) : void
      {
         param1.copyTexSubImage2D(param2,param3,param4,param5,param6,param7,param8,param9);
      }
      
      public static function copyTexSubImage3D(param1:*, param2:int, param3:int, param4:int, param5:int, param6:int, param7:int, param8:int, param9:int, param10:int) : void
      {
         param1.copyTexSubImage3D(param2,param3,param4,param5,param6,param7,param8,param9,param10);
      }
      
      public static function createBuffer(param1:*) : *
      {
         return param1.createBuffer();
      }
      
      public static function createFramebuffer(param1:*) : *
      {
         return param1.createFramebuffer();
      }
      
      public static function createProgram(param1:*) : GLObject
      {
         return param1.createProgram();
      }
      
      public static function createQuery(param1:*) : *
      {
         return param1.createQuery();
      }
      
      public static function createRenderbuffer(param1:*) : *
      {
         return param1.createRenderbuffer();
      }
      
      public static function createSampler(param1:*) : *
      {
         return param1.createSampler();
      }
      
      public static function createShader(param1:*, param2:int) : GLObject
      {
         return param1.createShader(param2);
      }
      
      public static function createTexture(param1:*) : *
      {
         return param1.createTexture();
      }
      
      public static function createTransformFeedback(param1:*) : *
      {
         return param1.createTransformFeedback();
      }
      
      public static function createVertexArray(param1:*) : *
      {
         return param1.createVertexArray();
      }
      
      public static function cullFace(param1:*, param2:int) : void
      {
         param1.cullFace(param2);
      }
      
      public static function deleteBuffer(param1:*, param2:*) : void
      {
         param1.deleteBuffer(param2);
      }
      
      public static function deleteFramebuffer(param1:*, param2:*) : void
      {
         param1.deleteFramebuffer(param2);
      }
      
      public static function deleteProgram(param1:*, param2:GLObject) : void
      {
         param1.deleteProgram(param2);
      }
      
      public static function deleteQuery(param1:*, param2:*) : void
      {
         param1.deleteQuery(param2);
      }
      
      public static function deleteRenderbuffer(param1:*, param2:*) : void
      {
         param1.deleteRenderbuffer(param2);
      }
      
      public static function deleteSampler(param1:*, param2:*) : void
      {
         param1.deleteSampler(param2);
      }
      
      public static function deleteShader(param1:*, param2:GLObject) : void
      {
         param1.deleteShader(param2);
      }
      
      public static function deleteSync(param1:*, param2:*) : void
      {
         param1.deleteSync(param2);
      }
      
      public static function deleteTexture(param1:*, param2:*) : void
      {
         param1.deleteTexture(param2);
      }
      
      public static function deleteTransformFeedback(param1:*, param2:*) : void
      {
         param1.deleteTransformFeedback(param2);
      }
      
      public static function deleteVertexArray(param1:*, param2:*) : void
      {
         param1.deleteVertexArray(param2);
      }
      
      public static function depthFunc(param1:*, param2:int) : void
      {
         param1.depthFunc(param2);
      }
      
      public static function depthMask(param1:*, param2:Boolean) : void
      {
         param1.depthMask(param2);
      }
      
      public static function depthRange(param1:*, param2:Number, param3:Number) : void
      {
         param1.depthRangef(param2,param3);
      }
      
      public static function detachShader(param1:*, param2:GLObject, param3:GLObject) : void
      {
         param1.detachShader(param2,param3);
      }
      
      public static function disable(param1:*, param2:int) : void
      {
         param1.disable(param2);
      }
      
      public static function disableVertexAttribArray(param1:*, param2:int) : void
      {
         param1.disableVertexAttribArray(param2);
      }
      
      public static function drawArrays(param1:*, param2:int, param3:int, param4:int) : void
      {
         param1.drawArrays(param2,param3,param4);
      }
      
      public static function drawArraysInstanced(param1:*, param2:int, param3:int, param4:int, param5:int) : void
      {
         param1.drawArraysInstanced(param2,param3,param4,param5);
      }
      
      public static function drawBuffers(param1:*, param2:Array) : void
      {
         param1.drawBuffers(param2);
      }
      
      public static function drawElements(param1:*, param2:int, param3:int, param4:int, param5:int) : void
      {
         param1.drawElements(param2,param3,param4,param5);
      }
      
      public static function drawElementsInstanced(param1:*, param2:int, param3:int, param4:int, param5:int, param6:int) : void
      {
         param1.drawElementsInstanced(param2,param3,param4,param5,param6);
      }
      
      public static function drawRangeElements(param1:*, param2:int, param3:int, param4:int, param5:int, param6:int, param7:int) : void
      {
         param1.drawRangeElements(param2,param3,param4,param5,param6,param7);
      }
      
      public static function enable(param1:*, param2:int) : void
      {
         param1.enable(param2);
      }
      
      public static function enableVertexAttribArray(param1:*, param2:int) : void
      {
         param1.enableVertexAttribArray(param2);
      }
      
      public static function endQuery(param1:*, param2:int) : void
      {
         param1.endQuery(param2);
      }
      
      public static function endTransformFeedback(param1:*) : void
      {
         param1.endTransformFeedback();
      }
      
      public static function fenceSync(param1:*, param2:int, param3:int) : *
      {
         return param1.fenceSync(param2,param3);
      }
      
      public static function finish(param1:*) : void
      {
         param1.finish();
      }
      
      public static function flush(param1:*) : void
      {
         param1.flush();
      }
      
      public static function framebufferRenderbuffer(param1:*, param2:int, param3:int, param4:int, param5:*) : void
      {
         param1.framebufferRenderbuffer(param2,param3,param4,param5);
      }
      
      public static function framebufferTexture2D(param1:*, param2:int, param3:int, param4:int, param5:*, param6:int) : void
      {
         param1.framebufferTexture2D(param2,param3,param4,param5,param6);
      }
      
      public static function framebufferTextureLayer(param1:*, param2:int, param3:int, param4:*, param5:int, param6:int) : void
      {
         param1.framebufferTextureLayer(param2,param3,param4,param5,param6);
      }
      
      public static function frontFace(param1:*, param2:int) : void
      {
         param1.frontFace(param2);
      }
      
      public static function generateMipmap(param1:*, param2:int) : void
      {
         param1.generateMipmap(param2);
      }
      
      public static function getActiveAttrib(param1:*, param2:GLObject, param3:int) : Object
      {
         return param1.getActiveAttrib(param2,param3);
      }
      
      public static function getActiveUniform(param1:*, param2:GLObject, param3:int) : Object
      {
         return param1.getActiveUniform(param2,param3);
      }
      
      public static function getActiveUniformBlockName(param1:*, param2:GLObject, param3:int) : String
      {
         return param1.getActiveUniformBlockName(param2,param3);
      }
      
      public static function getActiveUniformBlockParameter(param1:*, param2:GLObject, param3:int, param4:int) : *
      {
         return param1.getActiveUniformBlockParameter(param2,param3,param4);
      }
      
      public static function getActiveUniforms(param1:*, param2:GLObject, param3:Array, param4:int) : *
      {
         return param1.getActiveUniforms(param2,param3,param4);
      }
      
      public static function getAttachedShaders(param1:*, param2:GLObject) : Array
      {
         return param1.getAttachedShaders(param2);
      }
      
      public static function getAttribLocation(param1:*, param2:GLObject, param3:String) : int
      {
         return param1.getAttribLocation(param2,param3);
      }
      
      public static function getBufferParameter(param1:*, param2:int, param3:int) : *
      {
         return param1.getBufferParameter(param2,param3);
      }
      
      public static function getBufferSubData(param1:*, param2:int, param3:int, param4:Bytes, param5:int = 0, param6:Object = undefined) : void
      {
         var _loc7_:Object = param6 != null ? param6 : (param4 != null ? param4.length : 0);
         param1.getBufferSubData(param2,DataPointer_Impl_.__withOffset(param3,param5),_loc7_,param4);
      }
      
      public static function getContextAttributes(param1:*) : Object
      {
         return param1.getContextAttributes();
      }
      
      public static function getError(param1:*) : int
      {
         return param1.getError();
      }
      
      public static function getExtension(param1:*, param2:String) : *
      {
         return param1.getExtension(param2);
      }
      
      public static function getFragDataLocation(param1:*, param2:GLObject, param3:String) : int
      {
         return param1.getFragDataLocation(param2,param3);
      }
      
      public static function getFramebufferAttachmentParameter(param1:*, param2:int, param3:int, param4:int) : *
      {
         return param1.getFramebufferAttachmentParameter(param2,param3,param4);
      }
      
      public static function getIndexedParameter(param1:*, param2:int, param3:int) : *
      {
         return param1.getIndexedParameter(param2,param3);
      }
      
      public static function getInternalformatParameter(param1:*, param2:int, param3:int, param4:int) : *
      {
         return param1.getInternalformatParameter(param2,param3,param4);
      }
      
      public static function getParameter(param1:*, param2:int) : *
      {
         return param1.getParameter(param2);
      }
      
      public static function getProgramInfoLog(param1:*, param2:GLObject) : String
      {
         return param1.getProgramInfoLog(param2);
      }
      
      public static function getProgramParameter(param1:*, param2:GLObject, param3:int) : *
      {
         return param1.getProgramParameter(param2,param3);
      }
      
      public static function getQuery(param1:*, param2:int, param3:int) : *
      {
         return param1.getQuery(param2,param3);
      }
      
      public static function getQueryParameter(param1:*, param2:*, param3:int) : *
      {
         return param1.getQueryParameter(param2,param3);
      }
      
      public static function getRenderbufferParameter(param1:*, param2:int, param3:int) : *
      {
         return param1.getRenderbufferParameter(param2,param3);
      }
      
      public static function getSamplerParameter(param1:*, param2:*, param3:int) : *
      {
         return param1.getSamplerParameter(param2,param3);
      }
      
      public static function getShaderInfoLog(param1:*, param2:GLObject) : String
      {
         return param1.getShaderInfoLog(param2);
      }
      
      public static function getShaderParameter(param1:*, param2:GLObject, param3:int) : *
      {
         return param1.getShaderParameter(param2,param3);
      }
      
      public static function getShaderPrecisionFormat(param1:*, param2:int, param3:int) : Object
      {
         return param1.getShaderPrecisionFormat(param2,param3);
      }
      
      public static function getShaderSource(param1:*, param2:GLObject) : String
      {
         return param1.getShaderSource(param2);
      }
      
      public static function getSupportedExtensions(param1:*) : Array
      {
         return param1.getSupportedExtensions();
      }
      
      public static function getSyncParameter(param1:*, param2:*, param3:int) : *
      {
         return param1.getSyncParameter(param2,param3);
      }
      
      public static function getTexParameter(param1:*, param2:int, param3:int) : *
      {
         return param1.getTexParameter(param2,param3);
      }
      
      public static function getTransformFeedbackVarying(param1:*, param2:GLObject, param3:int) : Object
      {
         return param1.getTransformFeedbackVarying(param2,param3);
      }
      
      public static function getUniform(param1:*, param2:GLObject, param3:int) : *
      {
         return param1.getUniform(param2,param3);
      }
      
      public static function getUniformBlockIndex(param1:*, param2:GLObject, param3:String) : int
      {
         return param1.getUniformBlockIndex(param2,param3);
      }
      
      public static function getUniformIndices(param1:*, param2:GLObject, param3:Array) : Array
      {
         return param1.getUniformIndices(param2,param3);
      }
      
      public static function getUniformLocation(param1:*, param2:GLObject, param3:String) : int
      {
         return param1.getUniformLocation(param2,param3);
      }
      
      public static function getVertexAttrib(param1:*, param2:int, param3:int) : *
      {
         return param1.getVertexAttrib(param2,param3);
      }
      
      public static function getVertexAttribOffset(param1:*, param2:int, param3:int) : int
      {
         return param1.getVertexAttribPointerv(param2,param3);
      }
      
      public static function hint(param1:*, param2:int, param3:int) : void
      {
         param1.hint(param2,param3);
      }
      
      public static function invalidateFramebuffer(param1:*, param2:int, param3:Array) : void
      {
         param1.invalidateFramebuffer(param2,param3);
      }
      
      public static function invalidateSubFramebuffer(param1:*, param2:int, param3:Array, param4:int, param5:int, param6:int, param7:int) : void
      {
         param1.invalidateSubFramebuffer(param2,param3,param4,param5,param6,param7);
      }
      
      public static function isBuffer(param1:*, param2:*) : Boolean
      {
         return param1.isBuffer(param2);
      }
      
      public static function isContextLost(param1:*) : Boolean
      {
         return param1.isContextLost();
      }
      
      public static function isEnabled(param1:*, param2:int) : Boolean
      {
         return param1.isEnabled(param2);
      }
      
      public static function isFramebuffer(param1:*, param2:*) : Boolean
      {
         return param1.isFramebuffer(param2);
      }
      
      public static function isProgram(param1:*, param2:GLObject) : Boolean
      {
         return param1.isProgram(param2);
      }
      
      public static function isQuery(param1:*, param2:*) : Boolean
      {
         return param1.isQuery(param2);
      }
      
      public static function isRenderbuffer(param1:*, param2:*) : Boolean
      {
         return param1.isRenderbuffer(param2);
      }
      
      public static function isSampler(param1:*, param2:*) : Boolean
      {
         return param1.isSampler(param2);
      }
      
      public static function isShader(param1:*, param2:GLObject) : Boolean
      {
         return param1.isShader(param2);
      }
      
      public static function isSync(param1:*, param2:*) : Boolean
      {
         return param1.isSync(param2);
      }
      
      public static function isTexture(param1:*, param2:*) : Boolean
      {
         return param1.isTexture(param2);
      }
      
      public static function isTransformFeedback(param1:*, param2:*) : Boolean
      {
         return param1.isTransformFeedback(param2);
      }
      
      public static function isVertexArray(param1:*, param2:*) : Boolean
      {
         return param1.isVertexArray(param2);
      }
      
      public static function lineWidth(param1:*, param2:Number) : void
      {
         param1.lineWidth(param2);
      }
      
      public static function linkProgram(param1:*, param2:GLObject) : void
      {
         param1.linkProgram(param2);
      }
      
      public static function pauseTransformFeedback(param1:*) : void
      {
         param1.pauseTransformFeedback();
      }
      
      public static function pixelStorei(param1:*, param2:int, param3:int) : void
      {
         param1.pixelStorei(param2,param3);
      }
      
      public static function polygonOffset(param1:*, param2:Number, param3:Number) : void
      {
         param1.polygonOffset(param2,param3);
      }
      
      public static function readBuffer(param1:*, param2:int) : void
      {
         param1.readBuffer(param2);
      }
      
      public static function readPixels(param1:*, param2:int, param3:int, param4:int, param5:int, param6:int, param7:int, param8:ArrayBufferView, param9:int = 0) : void
      {
         BytePointer_Impl_.set(WebGL2RenderContext_Impl_.__tempPointer,null,param8,null,param9);
         param1.readPixels(param2,param3,param4,param5,param6,param7,WebGL2RenderContext_Impl_.__tempPointer);
      }
      
      public static function renderbufferStorage(param1:*, param2:int, param3:int, param4:int, param5:int) : void
      {
         param1.renderbufferStorage(param2,param3,param4,param5);
      }
      
      public static function renderbufferStorageMultisample(param1:*, param2:int, param3:int, param4:int, param5:int, param6:int) : void
      {
         param1.renderbufferStorageMultisample(param2,param3,param4,param5,param6);
      }
      
      public static function resumeTransformFeedback(param1:*) : void
      {
         param1.resumeTransformFeedback();
      }
      
      public static function sampleCoverage(param1:*, param2:Number, param3:Boolean) : void
      {
         param1.sampleCoverage(param2,param3);
      }
      
      public static function samplerParameterf(param1:*, param2:*, param3:int, param4:Number) : void
      {
         param1.samplerParameterf(param2,param3,param4);
      }
      
      public static function samplerParameteri(param1:*, param2:*, param3:int, param4:int) : void
      {
         param1.samplerParameteri(param2,param3,param4);
      }
      
      public static function scissor(param1:*, param2:int, param3:int, param4:int, param5:int) : void
      {
         param1.scissor(param2,param3,param4,param5);
      }
      
      public static function shaderSource(param1:*, param2:GLObject, param3:String) : void
      {
         param1.shaderSource(param2,param3);
      }
      
      public static function stencilFunc(param1:*, param2:int, param3:int, param4:int) : void
      {
         param1.stencilFunc(param2,param3,param4);
      }
      
      public static function stencilFuncSeparate(param1:*, param2:int, param3:int, param4:int, param5:int) : void
      {
         param1.stencilFuncSeparate(param2,param3,param4,param5);
      }
      
      public static function stencilMask(param1:*, param2:int) : void
      {
         param1.stencilMask(param2);
      }
      
      public static function stencilMaskSeparate(param1:*, param2:int, param3:int) : void
      {
         param1.stencilMaskSeparate(param2,param3);
      }
      
      public static function stencilOp(param1:*, param2:int, param3:int, param4:int) : void
      {
         param1.stencilOp(param2,param3,param4);
      }
      
      public static function stencilOpSeparate(param1:*, param2:int, param3:int, param4:int, param5:int) : void
      {
         param1.stencilOpSeparate(param2,param3,param4,param5);
      }
      
      public static function texImage2D(param1:*, param2:int, param3:int, param4:int, param5:int, param6:int, param7:int, param8:int, param9:int, param10:ArrayBufferView, param11:int = 0) : void
      {
         BytePointer_Impl_.set(WebGL2RenderContext_Impl_.__tempPointer,null,param10,null,param11);
         param1.texImage2D(param2,param3,param4,param5,param6,param7,param8,param9,WebGL2RenderContext_Impl_.__tempPointer);
      }
      
      public static function texImage3D(param1:*, param2:int, param3:int, param4:int, param5:int, param6:int, param7:int, param8:int, param9:int, param10:int, param11:ArrayBufferView, param12:int = 0) : void
      {
         BytePointer_Impl_.set(WebGL2RenderContext_Impl_.__tempPointer,null,param11,null,param12);
         param1.texImage3D(param2,param3,param4,param5,param6,param7,param8,param9,param10,WebGL2RenderContext_Impl_.__tempPointer);
      }
      
      public static function texStorage2D(param1:*, param2:int, param3:int, param4:int, param5:int, param6:int) : void
      {
         param1.texStorage2D(param2,param3,param4,param5,param6);
      }
      
      public static function texStorage3D(param1:*, param2:int, param3:int, param4:int, param5:int, param6:int, param7:int) : void
      {
         param1.texStorage3D(param2,param3,param4,param5,param6,param7);
      }
      
      public static function texParameterf(param1:*, param2:int, param3:int, param4:Number) : void
      {
         param1.texParameterf(param2,param3,param4);
      }
      
      public static function texParameteri(param1:*, param2:int, param3:int, param4:int) : void
      {
         param1.texParameteri(param2,param3,param4);
      }
      
      public static function texSubImage2D(param1:*, param2:int, param3:int, param4:int, param5:int, param6:int, param7:int, param8:int, param9:int, param10:ArrayBufferView, param11:int = 0) : void
      {
         BytePointer_Impl_.set(WebGL2RenderContext_Impl_.__tempPointer,null,param10,null,param11);
         param1.texSubImage2D(param2,param3,param4,param5,param6,param7,param8,param9,WebGL2RenderContext_Impl_.__tempPointer);
      }
      
      public static function texSubImage3D(param1:*, param2:int, param3:int, param4:int, param5:int, param6:int, param7:int, param8:int, param9:int, param10:int, param11:int, param12:ArrayBufferView, param13:int = 0) : void
      {
         BytePointer_Impl_.set(WebGL2RenderContext_Impl_.__tempPointer,null,param12,null,param13);
         param1.texSubImage3D(param2,param3,param4,param5,param6,param7,param8,param9,param10,param11,WebGL2RenderContext_Impl_.__tempPointer);
      }
      
      public static function transformFeedbackVaryings(param1:*, param2:GLObject, param3:Array, param4:int) : void
      {
         param1.transformFeedbackVaryings(param2,param3,param4);
      }
      
      public static function uniform1f(param1:*, param2:int, param3:Number) : void
      {
         param1.uniform1f(param2,param3);
      }
      
      public static function uniform1fv(param1:*, param2:int, param3:ArrayBufferView, param4:Object = undefined, param5:Object = undefined) : void
      {
         param1.uniform1fv(param2,param3 != null ? param3.length : 0,param3);
      }
      
      public static function uniform1i(param1:*, param2:int, param3:int) : void
      {
         param1.uniform1i(param2,param3);
      }
      
      public static function uniform1iv(param1:*, param2:int, param3:ArrayBufferView, param4:Object = undefined, param5:Object = undefined) : void
      {
         param1.uniform1iv(param2,param3 != null ? param3.length : 0,param3);
      }
      
      public static function uniform1ui(param1:*, param2:int, param3:int) : void
      {
         param1.uniform1ui(param2,param3);
      }
      
      public static function uniform1uiv(param1:*, param2:int, param3:ArrayBufferView, param4:Object = undefined, param5:Object = undefined) : void
      {
         param1.uniform1uiv(param2,param3 != null ? param3.length : 0,param3);
      }
      
      public static function uniform2f(param1:*, param2:int, param3:Number, param4:Number) : void
      {
         param1.uniform2f(param2,param3,param4);
      }
      
      public static function uniform2fv(param1:*, param2:int, param3:ArrayBufferView, param4:Object = undefined, param5:Object = undefined) : void
      {
         param1.uniform2fv(param2,param3 != null ? param3.length >> 1 : 0,param3);
      }
      
      public static function uniform2i(param1:*, param2:int, param3:int, param4:int) : void
      {
         param1.uniform2i(param2,param3,param4);
      }
      
      public static function uniform2iv(param1:*, param2:int, param3:ArrayBufferView, param4:Object = undefined, param5:Object = undefined) : void
      {
         param1.uniform2iv(param2,param3 != null ? param3.length >> 1 : 0,param3);
      }
      
      public static function uniform2ui(param1:*, param2:int, param3:int, param4:int) : void
      {
         param1.uniform2ui(param2,param3,param4);
      }
      
      public static function uniform2uiv(param1:*, param2:int, param3:ArrayBufferView, param4:Object = undefined, param5:Object = undefined) : void
      {
         param1.uniform2uiv(param2,param3 != null ? param3.length >> 1 : 0,param3);
      }
      
      public static function uniform3f(param1:*, param2:int, param3:Number, param4:Number, param5:Number) : void
      {
         param1.uniform3f(param2,param3,param4,param5);
      }
      
      public static function uniform3fv(param1:*, param2:int, param3:ArrayBufferView, param4:Object = undefined, param5:Object = undefined) : void
      {
         param1.uniform3fv(param2,param3 != null ? int(param3.length / 3) : 0,param3);
      }
      
      public static function uniform3i(param1:*, param2:int, param3:int, param4:int, param5:int) : void
      {
         param1.uniform3i(param2,param3,param4,param5);
      }
      
      public static function uniform3iv(param1:*, param2:int, param3:ArrayBufferView, param4:Object = undefined, param5:Object = undefined) : void
      {
         param1.uniform3iv(param2,param3 != null ? int(param3.length / 3) : 0,param3);
      }
      
      public static function uniform3ui(param1:*, param2:int, param3:int, param4:int, param5:int) : void
      {
         param1.uniform3ui(param2,param3,param4,param5);
      }
      
      public static function uniform3uiv(param1:*, param2:int, param3:ArrayBufferView, param4:Object = undefined, param5:Object = undefined) : void
      {
         param1.uniform3uiv(param2,param3 != null ? int(param3.length / 3) : 0,param3);
      }
      
      public static function uniform4f(param1:*, param2:int, param3:Number, param4:Number, param5:Number, param6:Number) : void
      {
         param1.uniform4f(param2,param3,param4,param5,param6);
      }
      
      public static function uniform4fv(param1:*, param2:int, param3:ArrayBufferView, param4:Object = undefined, param5:Object = undefined) : void
      {
         param1.uniform4fv(param2,param3 != null ? param3.length >> 2 : 0,param3);
      }
      
      public static function uniform4i(param1:*, param2:int, param3:int, param4:int, param5:int, param6:int) : void
      {
         param1.uniform4i(param2,param3,param4,param5,param6);
      }
      
      public static function uniform4iv(param1:*, param2:int, param3:ArrayBufferView, param4:Object = undefined, param5:Object = undefined) : void
      {
         param1.uniform4iv(param2,param3 != null ? param3.length >> 2 : 0,param3);
      }
      
      public static function uniform4ui(param1:*, param2:int, param3:int, param4:int, param5:int, param6:int) : void
      {
         param1.uniform4ui(param2,param3,param4,param5,param6);
      }
      
      public static function uniform4uiv(param1:*, param2:int, param3:ArrayBufferView, param4:Object = undefined, param5:Object = undefined) : void
      {
         param1.uniform4uiv(param2,param3 != null ? param3.length >> 2 : 0,param3);
      }
      
      public static function uniformBlockBinding(param1:*, param2:GLObject, param3:int, param4:int) : void
      {
         param1.uniformBlockBinding(param2,param3,param4);
      }
      
      public static function uniformMatrix2fv(param1:*, param2:int, param3:Boolean, param4:ArrayBufferView, param5:int = 0, param6:Object = undefined) : void
      {
         var _loc7_:int = 0;
         if(param6 != null)
         {
            _loc7_ = int(param6);
         }
         else if(param4 != null)
         {
            _loc7_ = param4.length >> 2;
         }
         BytePointer_Impl_.set(WebGL2RenderContext_Impl_.__tempPointer,null,param4,null,param5);
         param1.uniformMatrix2fv(param2,_loc7_,param3,WebGL2RenderContext_Impl_.__tempPointer);
      }
      
      public static function uniformMatrix2x3fv(param1:*, param2:int, param3:Boolean, param4:ArrayBufferView, param5:int = 0, param6:Object = undefined) : void
      {
         var _loc7_:int = 0;
         if(param6 != null)
         {
            _loc7_ = int(param6);
         }
         else if(param4 != null)
         {
            _loc7_ = int(param4.length / 6);
         }
         BytePointer_Impl_.set(WebGL2RenderContext_Impl_.__tempPointer,null,param4,null,param5);
         param1.uniformMatrix2x3fv(param2,_loc7_,param3,WebGL2RenderContext_Impl_.__tempPointer);
      }
      
      public static function uniformMatrix2x4fv(param1:*, param2:int, param3:Boolean, param4:ArrayBufferView, param5:int = 0, param6:Object = undefined) : void
      {
         var _loc7_:int = 0;
         if(param6 != null)
         {
            _loc7_ = int(param6);
         }
         else if(param4 != null)
         {
            _loc7_ = int(param4.length / 8);
         }
         BytePointer_Impl_.set(WebGL2RenderContext_Impl_.__tempPointer,null,param4,null,param5);
         param1.uniformMatrix2x4fv(param2,_loc7_,param3,WebGL2RenderContext_Impl_.__tempPointer);
      }
      
      public static function uniformMatrix3fv(param1:*, param2:int, param3:Boolean, param4:ArrayBufferView, param5:int = 0, param6:Object = undefined) : void
      {
         var _loc7_:int = 0;
         if(param6 != null)
         {
            _loc7_ = int(param6);
         }
         else if(param4 != null)
         {
            _loc7_ = int(param4.length / 9);
         }
         BytePointer_Impl_.set(WebGL2RenderContext_Impl_.__tempPointer,null,param4,null,param5);
         param1.uniformMatrix3fv(param2,_loc7_,param3,WebGL2RenderContext_Impl_.__tempPointer);
      }
      
      public static function uniformMatrix3x2fv(param1:*, param2:int, param3:Boolean, param4:ArrayBufferView, param5:int = 0, param6:Object = undefined) : void
      {
         var _loc7_:int = 0;
         if(param6 != null)
         {
            _loc7_ = int(param6);
         }
         else if(param4 != null)
         {
            _loc7_ = int(param4.length / 6);
         }
         BytePointer_Impl_.set(WebGL2RenderContext_Impl_.__tempPointer,null,param4,null,param5);
         param1.uniformMatrix3x2fv(param2,_loc7_,param3,WebGL2RenderContext_Impl_.__tempPointer);
      }
      
      public static function uniformMatrix3x4fv(param1:*, param2:int, param3:Boolean, param4:ArrayBufferView, param5:int = 0, param6:Object = undefined) : void
      {
         var _loc7_:int = 0;
         if(param6 != null)
         {
            _loc7_ = int(param6);
         }
         else if(param4 != null)
         {
            _loc7_ = int(param4.length / 12);
         }
         BytePointer_Impl_.set(WebGL2RenderContext_Impl_.__tempPointer,null,param4,null,param5);
         param1.uniformMatrix3x4fv(param2,_loc7_,param3,WebGL2RenderContext_Impl_.__tempPointer);
      }
      
      public static function uniformMatrix4fv(param1:*, param2:int, param3:Boolean, param4:ArrayBufferView, param5:int = 0, param6:Object = undefined) : void
      {
         var _loc7_:int = 0;
         if(param6 != null)
         {
            _loc7_ = int(param6);
         }
         else if(param4 != null)
         {
            _loc7_ = param4.length >> 4;
         }
         BytePointer_Impl_.set(WebGL2RenderContext_Impl_.__tempPointer,null,param4,null,param5);
         param1.uniformMatrix4fv(param2,_loc7_,param3,WebGL2RenderContext_Impl_.__tempPointer);
      }
      
      public static function uniformMatrix4x2fv(param1:*, param2:int, param3:Boolean, param4:ArrayBufferView, param5:int = 0, param6:Object = undefined) : void
      {
         var _loc7_:int = 0;
         if(param6 != null)
         {
            _loc7_ = int(param6);
         }
         else if(param4 != null)
         {
            _loc7_ = int(param4.length / 8);
         }
         BytePointer_Impl_.set(WebGL2RenderContext_Impl_.__tempPointer,null,param4,null,param5);
         param1.uniformMatrix4x2fv(param2,_loc7_,param3,WebGL2RenderContext_Impl_.__tempPointer);
      }
      
      public static function uniformMatrix4x3fv(param1:*, param2:int, param3:Boolean, param4:ArrayBufferView, param5:int = 0, param6:Object = undefined) : void
      {
         var _loc7_:int = 0;
         if(param6 != null)
         {
            _loc7_ = int(param6);
         }
         else if(param4 != null)
         {
            _loc7_ = int(param4.length / 12);
         }
         BytePointer_Impl_.set(WebGL2RenderContext_Impl_.__tempPointer,null,param4,null,param5);
         param1.uniformMatrix4x3fv(param2,_loc7_,param3,WebGL2RenderContext_Impl_.__tempPointer);
      }
      
      public static function useProgram(param1:*, param2:GLObject) : void
      {
         param1.useProgram(param2);
      }
      
      public static function validateProgram(param1:*, param2:GLObject) : void
      {
         param1.validateProgram(param2);
      }
      
      public static function vertexAttrib1f(param1:*, param2:int, param3:Number) : void
      {
         param1.vertexAttrib1f(param2,param3);
      }
      
      public static function vertexAttrib1fv(param1:*, param2:int, param3:int) : void
      {
         param1.vertexAttrib1fv(param2,param3);
      }
      
      public static function vertexAttrib2f(param1:*, param2:int, param3:Number, param4:Number) : void
      {
         param1.vertexAttrib2f(param2,param3,param4);
      }
      
      public static function vertexAttrib2fv(param1:*, param2:int, param3:int) : void
      {
         param1.vertexAttrib2fv(param2,param3);
      }
      
      public static function vertexAttrib3f(param1:*, param2:int, param3:Number, param4:Number, param5:Number) : void
      {
         param1.vertexAttrib3f(param2,param3,param4,param5);
      }
      
      public static function vertexAttrib3fv(param1:*, param2:int, param3:int) : void
      {
         param1.vertexAttrib3fv(param2,param3);
      }
      
      public static function vertexAttrib4f(param1:*, param2:int, param3:Number, param4:Number, param5:Number, param6:Number) : void
      {
         param1.vertexAttrib4f(param2,param3,param4,param5,param6);
      }
      
      public static function vertexAttrib4fv(param1:*, param2:int, param3:int) : void
      {
         param1.vertexAttrib4fv(param2,param3);
      }
      
      public static function vertexAttribDivisor(param1:*, param2:int, param3:int) : void
      {
         param1.vertexAttribDivisor(param2,param3);
      }
      
      public static function vertexAttribI4i(param1:*, param2:int, param3:int, param4:int, param5:int, param6:int) : void
      {
         param1.vertexAttribI4i(param2,param3,param4,param5,param6);
      }
      
      public static function vertexAttribI4iv(param1:*, param2:int, param3:int) : void
      {
         param1.vertexAttribI4iv(param2,param3);
      }
      
      public static function vertexAttribI4ui(param1:*, param2:int, param3:int, param4:int, param5:int, param6:int) : void
      {
         param1.vertexAttribI4ui(param2,param3,param4,param5,param6);
      }
      
      public static function vertexAttribI4uiv(param1:*, param2:int, param3:int) : void
      {
         param1.vertexAttribI4uiv(param2,param3);
      }
      
      public static function vertexAttribIPointer(param1:*, param2:int, param3:int, param4:int, param5:int, param6:int) : void
      {
         param1.vertexAttribIPointer(param2,param3,param4,param5,param6);
      }
      
      public static function vertexAttribPointer(param1:*, param2:int, param3:int, param4:int, param5:Boolean, param6:int, param7:int) : void
      {
         param1.vertexAttribPointer(param2,param3,param4,param5,param6,param7);
      }
      
      public static function viewport(param1:*, param2:int, param3:int, param4:int, param5:int) : void
      {
         param1.viewport(param2,param3,param4,param5);
      }
      
      public static function waitSync(param1:*, param2:*, param3:int, param4:___Int64) : void
      {
         param1.waitSync(param2,param3,param4);
      }
      
      public static function fromRenderContext(param1:RenderContext) : *
      {
         return param1.webgl2;
      }
      
      public static function fromGL(param1:Class) : *
      {
         return GL.context;
      }
   }
}

