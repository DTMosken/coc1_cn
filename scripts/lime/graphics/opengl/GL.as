package lime.graphics.opengl
{
   import haxe._Int64.___Int64;
   
   public class GL
   {
      
      public static var context:*;
      
      public static var type:String;
      
      public static var version:Number;
      
      public static var DEPTH_BUFFER_BIT:int = 256;
      
      public static var STENCIL_BUFFER_BIT:int = 1024;
      
      public static var COLOR_BUFFER_BIT:int = 16384;
      
      public static var POINTS:int = 0;
      
      public static var LINES:int = 1;
      
      public static var LINE_LOOP:int = 2;
      
      public static var LINE_STRIP:int = 3;
      
      public static var TRIANGLES:int = 4;
      
      public static var TRIANGLE_STRIP:int = 5;
      
      public static var TRIANGLE_FAN:int = 6;
      
      public static var ZERO:int = 0;
      
      public static var ONE:int = 1;
      
      public static var SRC_COLOR:int = 768;
      
      public static var ONE_MINUS_SRC_COLOR:int = 769;
      
      public static var SRC_ALPHA:int = 770;
      
      public static var ONE_MINUS_SRC_ALPHA:int = 771;
      
      public static var DST_ALPHA:int = 772;
      
      public static var ONE_MINUS_DST_ALPHA:int = 773;
      
      public static var DST_COLOR:int = 774;
      
      public static var ONE_MINUS_DST_COLOR:int = 775;
      
      public static var SRC_ALPHA_SATURATE:int = 776;
      
      public static var FUNC_ADD:int = 32774;
      
      public static var BLEND_EQUATION:int = 32777;
      
      public static var BLEND_EQUATION_RGB:int = 32777;
      
      public static var BLEND_EQUATION_ALPHA:int = 34877;
      
      public static var FUNC_SUBTRACT:int = 32778;
      
      public static var FUNC_REVERSE_SUBTRACT:int = 32779;
      
      public static var BLEND_DST_RGB:int = 32968;
      
      public static var BLEND_SRC_RGB:int = 32969;
      
      public static var BLEND_DST_ALPHA:int = 32970;
      
      public static var BLEND_SRC_ALPHA:int = 32971;
      
      public static var CONSTANT_COLOR:int = 32769;
      
      public static var ONE_MINUS_CONSTANT_COLOR:int = 32770;
      
      public static var CONSTANT_ALPHA:int = 32771;
      
      public static var ONE_MINUS_CONSTANT_ALPHA:int = 32772;
      
      public static var BLEND_COLOR:int = 32773;
      
      public static var ARRAY_BUFFER:int = 34962;
      
      public static var ELEMENT_ARRAY_BUFFER:int = 34963;
      
      public static var ARRAY_BUFFER_BINDING:int = 34964;
      
      public static var ELEMENT_ARRAY_BUFFER_BINDING:int = 34965;
      
      public static var STREAM_DRAW:int = 35040;
      
      public static var STATIC_DRAW:int = 35044;
      
      public static var DYNAMIC_DRAW:int = 35048;
      
      public static var BUFFER_SIZE:int = 34660;
      
      public static var BUFFER_USAGE:int = 34661;
      
      public static var CURRENT_VERTEX_ATTRIB:int = 34342;
      
      public static var FRONT:int = 1028;
      
      public static var BACK:int = 1029;
      
      public static var FRONT_AND_BACK:int = 1032;
      
      public static var CULL_FACE:int = 2884;
      
      public static var BLEND:int = 3042;
      
      public static var DITHER:int = 3024;
      
      public static var STENCIL_TEST:int = 2960;
      
      public static var DEPTH_TEST:int = 2929;
      
      public static var SCISSOR_TEST:int = 3089;
      
      public static var POLYGON_OFFSET_FILL:int = 32823;
      
      public static var SAMPLE_ALPHA_TO_COVERAGE:int = 32926;
      
      public static var SAMPLE_COVERAGE:int = 32928;
      
      public static var NO_ERROR:int = 0;
      
      public static var INVALID_ENUM:int = 1280;
      
      public static var INVALID_VALUE:int = 1281;
      
      public static var INVALID_OPERATION:int = 1282;
      
      public static var OUT_OF_MEMORY:int = 1285;
      
      public static var CW:int = 2304;
      
      public static var CCW:int = 2305;
      
      public static var LINE_WIDTH:int = 2849;
      
      public static var ALIASED_POINT_SIZE_RANGE:int = 33901;
      
      public static var ALIASED_LINE_WIDTH_RANGE:int = 33902;
      
      public static var CULL_FACE_MODE:int = 2885;
      
      public static var FRONT_FACE:int = 2886;
      
      public static var DEPTH_RANGE:int = 2928;
      
      public static var DEPTH_WRITEMASK:int = 2930;
      
      public static var DEPTH_CLEAR_VALUE:int = 2931;
      
      public static var DEPTH_FUNC:int = 2932;
      
      public static var STENCIL_CLEAR_VALUE:int = 2961;
      
      public static var STENCIL_FUNC:int = 2962;
      
      public static var STENCIL_FAIL:int = 2964;
      
      public static var STENCIL_PASS_DEPTH_FAIL:int = 2965;
      
      public static var STENCIL_PASS_DEPTH_PASS:int = 2966;
      
      public static var STENCIL_REF:int = 2967;
      
      public static var STENCIL_VALUE_MASK:int = 2963;
      
      public static var STENCIL_WRITEMASK:int = 2968;
      
      public static var STENCIL_BACK_FUNC:int = 34816;
      
      public static var STENCIL_BACK_FAIL:int = 34817;
      
      public static var STENCIL_BACK_PASS_DEPTH_FAIL:int = 34818;
      
      public static var STENCIL_BACK_PASS_DEPTH_PASS:int = 34819;
      
      public static var STENCIL_BACK_REF:int = 36003;
      
      public static var STENCIL_BACK_VALUE_MASK:int = 36004;
      
      public static var STENCIL_BACK_WRITEMASK:int = 36005;
      
      public static var VIEWPORT:int = 2978;
      
      public static var SCISSOR_BOX:int = 3088;
      
      public static var COLOR_CLEAR_VALUE:int = 3106;
      
      public static var COLOR_WRITEMASK:int = 3107;
      
      public static var UNPACK_ALIGNMENT:int = 3317;
      
      public static var PACK_ALIGNMENT:int = 3333;
      
      public static var MAX_TEXTURE_SIZE:int = 3379;
      
      public static var MAX_VIEWPORT_DIMS:int = 3386;
      
      public static var SUBPIXEL_BITS:int = 3408;
      
      public static var RED_BITS:int = 3410;
      
      public static var GREEN_BITS:int = 3411;
      
      public static var BLUE_BITS:int = 3412;
      
      public static var ALPHA_BITS:int = 3413;
      
      public static var DEPTH_BITS:int = 3414;
      
      public static var STENCIL_BITS:int = 3415;
      
      public static var POLYGON_OFFSET_UNITS:int = 10752;
      
      public static var POLYGON_OFFSET_FACTOR:int = 32824;
      
      public static var TEXTURE_BINDING_2D:int = 32873;
      
      public static var SAMPLE_BUFFERS:int = 32936;
      
      public static var SAMPLES:int = 32937;
      
      public static var SAMPLE_COVERAGE_VALUE:int = 32938;
      
      public static var SAMPLE_COVERAGE_INVERT:int = 32939;
      
      public static var NUM_COMPRESSED_TEXTURE_FORMATS:int = 34466;
      
      public static var COMPRESSED_TEXTURE_FORMATS:int = 34467;
      
      public static var DONT_CARE:int = 4352;
      
      public static var FASTEST:int = 4353;
      
      public static var NICEST:int = 4354;
      
      public static var GENERATE_MIPMAP_HINT:int = 33170;
      
      public static var BYTE:int = 5120;
      
      public static var UNSIGNED_BYTE:int = 5121;
      
      public static var SHORT:int = 5122;
      
      public static var UNSIGNED_SHORT:int = 5123;
      
      public static var INT:int = 5124;
      
      public static var UNSIGNED_INT:int = 5125;
      
      public static var FLOAT:int = 5126;
      
      public static var DEPTH_COMPONENT:int = 6402;
      
      public static var ALPHA:int = 6406;
      
      public static var RGB:int = 6407;
      
      public static var RGBA:int = 6408;
      
      public static var LUMINANCE:int = 6409;
      
      public static var LUMINANCE_ALPHA:int = 6410;
      
      public static var UNSIGNED_SHORT_4_4_4_4:int = 32819;
      
      public static var UNSIGNED_SHORT_5_5_5_1:int = 32820;
      
      public static var UNSIGNED_SHORT_5_6_5:int = 33635;
      
      public static var FRAGMENT_SHADER:int = 35632;
      
      public static var VERTEX_SHADER:int = 35633;
      
      public static var MAX_VERTEX_ATTRIBS:int = 34921;
      
      public static var MAX_VERTEX_UNIFORM_VECTORS:int = 36347;
      
      public static var MAX_VARYING_VECTORS:int = 36348;
      
      public static var MAX_COMBINED_TEXTURE_IMAGE_UNITS:int = 35661;
      
      public static var MAX_VERTEX_TEXTURE_IMAGE_UNITS:int = 35660;
      
      public static var MAX_TEXTURE_IMAGE_UNITS:int = 34930;
      
      public static var MAX_FRAGMENT_UNIFORM_VECTORS:int = 36349;
      
      public static var SHADER_TYPE:int = 35663;
      
      public static var DELETE_STATUS:int = 35712;
      
      public static var LINK_STATUS:int = 35714;
      
      public static var VALIDATE_STATUS:int = 35715;
      
      public static var ATTACHED_SHADERS:int = 35717;
      
      public static var ACTIVE_UNIFORMS:int = 35718;
      
      public static var ACTIVE_ATTRIBUTES:int = 35721;
      
      public static var SHADING_LANGUAGE_VERSION:int = 35724;
      
      public static var CURRENT_PROGRAM:int = 35725;
      
      public static var NEVER:int = 512;
      
      public static var LESS:int = 513;
      
      public static var EQUAL:int = 514;
      
      public static var LEQUAL:int = 515;
      
      public static var GREATER:int = 516;
      
      public static var NOTEQUAL:int = 517;
      
      public static var GEQUAL:int = 518;
      
      public static var ALWAYS:int = 519;
      
      public static var KEEP:int = 7680;
      
      public static var REPLACE:int = 7681;
      
      public static var INCR:int = 7682;
      
      public static var DECR:int = 7683;
      
      public static var INVERT:int = 5386;
      
      public static var INCR_WRAP:int = 34055;
      
      public static var DECR_WRAP:int = 34056;
      
      public static var VENDOR:int = 7936;
      
      public static var RENDERER:int = 7937;
      
      public static var VERSION:int = 7938;
      
      public static var EXTENSIONS:int = 7939;
      
      public static var NEAREST:int = 9728;
      
      public static var LINEAR:int = 9729;
      
      public static var NEAREST_MIPMAP_NEAREST:int = 9984;
      
      public static var LINEAR_MIPMAP_NEAREST:int = 9985;
      
      public static var NEAREST_MIPMAP_LINEAR:int = 9986;
      
      public static var LINEAR_MIPMAP_LINEAR:int = 9987;
      
      public static var TEXTURE_MAG_FILTER:int = 10240;
      
      public static var TEXTURE_MIN_FILTER:int = 10241;
      
      public static var TEXTURE_WRAP_S:int = 10242;
      
      public static var TEXTURE_WRAP_T:int = 10243;
      
      public static var TEXTURE_2D:int = 3553;
      
      public static var TEXTURE:int = 5890;
      
      public static var TEXTURE_CUBE_MAP:int = 34067;
      
      public static var TEXTURE_BINDING_CUBE_MAP:int = 34068;
      
      public static var TEXTURE_CUBE_MAP_POSITIVE_X:int = 34069;
      
      public static var TEXTURE_CUBE_MAP_NEGATIVE_X:int = 34070;
      
      public static var TEXTURE_CUBE_MAP_POSITIVE_Y:int = 34071;
      
      public static var TEXTURE_CUBE_MAP_NEGATIVE_Y:int = 34072;
      
      public static var TEXTURE_CUBE_MAP_POSITIVE_Z:int = 34073;
      
      public static var TEXTURE_CUBE_MAP_NEGATIVE_Z:int = 34074;
      
      public static var MAX_CUBE_MAP_TEXTURE_SIZE:int = 34076;
      
      public static var TEXTURE0:int = 33984;
      
      public static var TEXTURE1:int = 33985;
      
      public static var TEXTURE2:int = 33986;
      
      public static var TEXTURE3:int = 33987;
      
      public static var TEXTURE4:int = 33988;
      
      public static var TEXTURE5:int = 33989;
      
      public static var TEXTURE6:int = 33990;
      
      public static var TEXTURE7:int = 33991;
      
      public static var TEXTURE8:int = 33992;
      
      public static var TEXTURE9:int = 33993;
      
      public static var TEXTURE10:int = 33994;
      
      public static var TEXTURE11:int = 33995;
      
      public static var TEXTURE12:int = 33996;
      
      public static var TEXTURE13:int = 33997;
      
      public static var TEXTURE14:int = 33998;
      
      public static var TEXTURE15:int = 33999;
      
      public static var TEXTURE16:int = 34000;
      
      public static var TEXTURE17:int = 34001;
      
      public static var TEXTURE18:int = 34002;
      
      public static var TEXTURE19:int = 34003;
      
      public static var TEXTURE20:int = 34004;
      
      public static var TEXTURE21:int = 34005;
      
      public static var TEXTURE22:int = 34006;
      
      public static var TEXTURE23:int = 34007;
      
      public static var TEXTURE24:int = 34008;
      
      public static var TEXTURE25:int = 34009;
      
      public static var TEXTURE26:int = 34010;
      
      public static var TEXTURE27:int = 34011;
      
      public static var TEXTURE28:int = 34012;
      
      public static var TEXTURE29:int = 34013;
      
      public static var TEXTURE30:int = 34014;
      
      public static var TEXTURE31:int = 34015;
      
      public static var ACTIVE_TEXTURE:int = 34016;
      
      public static var REPEAT:int = 10497;
      
      public static var CLAMP_TO_EDGE:int = 33071;
      
      public static var MIRRORED_REPEAT:int = 33648;
      
      public static var FLOAT_VEC2:int = 35664;
      
      public static var FLOAT_VEC3:int = 35665;
      
      public static var FLOAT_VEC4:int = 35666;
      
      public static var INT_VEC2:int = 35667;
      
      public static var INT_VEC3:int = 35668;
      
      public static var INT_VEC4:int = 35669;
      
      public static var BOOL:int = 35670;
      
      public static var BOOL_VEC2:int = 35671;
      
      public static var BOOL_VEC3:int = 35672;
      
      public static var BOOL_VEC4:int = 35673;
      
      public static var FLOAT_MAT2:int = 35674;
      
      public static var FLOAT_MAT3:int = 35675;
      
      public static var FLOAT_MAT4:int = 35676;
      
      public static var SAMPLER_2D:int = 35678;
      
      public static var SAMPLER_CUBE:int = 35680;
      
      public static var VERTEX_ATTRIB_ARRAY_ENABLED:int = 34338;
      
      public static var VERTEX_ATTRIB_ARRAY_SIZE:int = 34339;
      
      public static var VERTEX_ATTRIB_ARRAY_STRIDE:int = 34340;
      
      public static var VERTEX_ATTRIB_ARRAY_TYPE:int = 34341;
      
      public static var VERTEX_ATTRIB_ARRAY_NORMALIZED:int = 34922;
      
      public static var VERTEX_ATTRIB_ARRAY_POINTER:int = 34373;
      
      public static var VERTEX_ATTRIB_ARRAY_BUFFER_BINDING:int = 34975;
      
      public static var IMPLEMENTATION_COLOR_READ_TYPE:int = 35738;
      
      public static var IMPLEMENTATION_COLOR_READ_FORMAT:int = 35739;
      
      public static var VERTEX_PROGRAM_POINT_SIZE:int = 34370;
      
      public static var POINT_SPRITE:int = 34913;
      
      public static var COMPILE_STATUS:int = 35713;
      
      public static var LOW_FLOAT:int = 36336;
      
      public static var MEDIUM_FLOAT:int = 36337;
      
      public static var HIGH_FLOAT:int = 36338;
      
      public static var LOW_INT:int = 36339;
      
      public static var MEDIUM_INT:int = 36340;
      
      public static var HIGH_INT:int = 36341;
      
      public static var FRAMEBUFFER:int = 36160;
      
      public static var RENDERBUFFER:int = 36161;
      
      public static var RGBA4:int = 32854;
      
      public static var RGB5_A1:int = 32855;
      
      public static var RGB565:int = 36194;
      
      public static var DEPTH_COMPONENT16:int = 33189;
      
      public static var STENCIL_INDEX:int = 6401;
      
      public static var STENCIL_INDEX8:int = 36168;
      
      public static var DEPTH_STENCIL:int = 34041;
      
      public static var RENDERBUFFER_WIDTH:int = 36162;
      
      public static var RENDERBUFFER_HEIGHT:int = 36163;
      
      public static var RENDERBUFFER_INTERNAL_FORMAT:int = 36164;
      
      public static var RENDERBUFFER_RED_SIZE:int = 36176;
      
      public static var RENDERBUFFER_GREEN_SIZE:int = 36177;
      
      public static var RENDERBUFFER_BLUE_SIZE:int = 36178;
      
      public static var RENDERBUFFER_ALPHA_SIZE:int = 36179;
      
      public static var RENDERBUFFER_DEPTH_SIZE:int = 36180;
      
      public static var RENDERBUFFER_STENCIL_SIZE:int = 36181;
      
      public static var FRAMEBUFFER_ATTACHMENT_OBJECT_TYPE:int = 36048;
      
      public static var FRAMEBUFFER_ATTACHMENT_OBJECT_NAME:int = 36049;
      
      public static var FRAMEBUFFER_ATTACHMENT_TEXTURE_LEVEL:int = 36050;
      
      public static var FRAMEBUFFER_ATTACHMENT_TEXTURE_CUBE_MAP_FACE:int = 36051;
      
      public static var COLOR_ATTACHMENT0:int = 36064;
      
      public static var DEPTH_ATTACHMENT:int = 36096;
      
      public static var STENCIL_ATTACHMENT:int = 36128;
      
      public static var DEPTH_STENCIL_ATTACHMENT:int = 33306;
      
      public static var NONE:int = 0;
      
      public static var FRAMEBUFFER_COMPLETE:int = 36053;
      
      public static var FRAMEBUFFER_INCOMPLETE_ATTACHMENT:int = 36054;
      
      public static var FRAMEBUFFER_INCOMPLETE_MISSING_ATTACHMENT:int = 36055;
      
      public static var FRAMEBUFFER_INCOMPLETE_DIMENSIONS:int = 36057;
      
      public static var FRAMEBUFFER_UNSUPPORTED:int = 36061;
      
      public static var FRAMEBUFFER_BINDING:int = 36006;
      
      public static var RENDERBUFFER_BINDING:int = 36007;
      
      public static var MAX_RENDERBUFFER_SIZE:int = 34024;
      
      public static var INVALID_FRAMEBUFFER_OPERATION:int = 1286;
      
      public static var UNPACK_FLIP_Y_WEBGL:int = 37440;
      
      public static var UNPACK_PREMULTIPLY_ALPHA_WEBGL:int = 37441;
      
      public static var CONTEXT_LOST_WEBGL:int = 37442;
      
      public static var UNPACK_COLORSPACE_CONVERSION_WEBGL:int = 37443;
      
      public static var BROWSER_DEFAULT_WEBGL:int = 37444;
      
      public static var READ_BUFFER:int = 3074;
      
      public static var UNPACK_ROW_LENGTH:int = 3314;
      
      public static var UNPACK_SKIP_ROWS:int = 3315;
      
      public static var UNPACK_SKIP_PIXELS:int = 3316;
      
      public static var PACK_ROW_LENGTH:int = 3330;
      
      public static var PACK_SKIP_ROWS:int = 3331;
      
      public static var PACK_SKIP_PIXELS:int = 3332;
      
      public static var TEXTURE_BINDING_3D:int = 32874;
      
      public static var UNPACK_SKIP_IMAGES:int = 32877;
      
      public static var UNPACK_IMAGE_HEIGHT:int = 32878;
      
      public static var MAX_3D_TEXTURE_SIZE:int = 32883;
      
      public static var MAX_ELEMENTS_VERTICES:int = 33000;
      
      public static var MAX_ELEMENTS_INDICES:int = 33001;
      
      public static var MAX_TEXTURE_LOD_BIAS:int = 34045;
      
      public static var MAX_FRAGMENT_UNIFORM_COMPONENTS:int = 35657;
      
      public static var MAX_VERTEX_UNIFORM_COMPONENTS:int = 35658;
      
      public static var MAX_ARRAY_TEXTURE_LAYERS:int = 35071;
      
      public static var MIN_PROGRAM_TEXEL_OFFSET:int = 35076;
      
      public static var MAX_PROGRAM_TEXEL_OFFSET:int = 35077;
      
      public static var MAX_VARYING_COMPONENTS:int = 35659;
      
      public static var FRAGMENT_SHADER_DERIVATIVE_HINT:int = 35723;
      
      public static var RASTERIZER_DISCARD:int = 35977;
      
      public static var VERTEX_ARRAY_BINDING:int = 34229;
      
      public static var MAX_VERTEX_OUTPUT_COMPONENTS:int = 37154;
      
      public static var MAX_FRAGMENT_INPUT_COMPONENTS:int = 37157;
      
      public static var MAX_SERVER_WAIT_TIMEOUT:int = 37137;
      
      public static var MAX_ELEMENT_INDEX:int = 36203;
      
      public static var RED:int = 6403;
      
      public static var RGB8:int = 32849;
      
      public static var RGBA8:int = 32856;
      
      public static var RGB10_A2:int = 32857;
      
      public static var TEXTURE_3D:int = 32879;
      
      public static var TEXTURE_WRAP_R:int = 32882;
      
      public static var TEXTURE_MIN_LOD:int = 33082;
      
      public static var TEXTURE_MAX_LOD:int = 33083;
      
      public static var TEXTURE_BASE_LEVEL:int = 33084;
      
      public static var TEXTURE_MAX_LEVEL:int = 33085;
      
      public static var TEXTURE_COMPARE_MODE:int = 34892;
      
      public static var TEXTURE_COMPARE_FUNC:int = 34893;
      
      public static var SRGB:int = 35904;
      
      public static var SRGB8:int = 35905;
      
      public static var SRGB8_ALPHA8:int = 35907;
      
      public static var COMPARE_REF_TO_TEXTURE:int = 34894;
      
      public static var RGBA32F:int = 34836;
      
      public static var RGB32F:int = 34837;
      
      public static var RGBA16F:int = 34842;
      
      public static var RGB16F:int = 34843;
      
      public static var TEXTURE_2D_ARRAY:int = 35866;
      
      public static var TEXTURE_BINDING_2D_ARRAY:int = 35869;
      
      public static var R11F_G11F_B10F:int = 35898;
      
      public static var RGB9_E5:int = 35901;
      
      public static var RGBA32UI:int = 36208;
      
      public static var RGB32UI:int = 36209;
      
      public static var RGBA16UI:int = 36214;
      
      public static var RGB16UI:int = 36215;
      
      public static var RGBA8UI:int = 36220;
      
      public static var RGB8UI:int = 36221;
      
      public static var RGBA32I:int = 36226;
      
      public static var RGB32I:int = 36227;
      
      public static var RGBA16I:int = 36232;
      
      public static var RGB16I:int = 36233;
      
      public static var RGBA8I:int = 36238;
      
      public static var RGB8I:int = 36239;
      
      public static var RED_INTEGER:int = 36244;
      
      public static var RGB_INTEGER:int = 36248;
      
      public static var RGBA_INTEGER:int = 36249;
      
      public static var R8:int = 33321;
      
      public static var RG8:int = 33323;
      
      public static var R16F:int = 33325;
      
      public static var R32F:int = 33326;
      
      public static var RG16F:int = 33327;
      
      public static var RG32F:int = 33328;
      
      public static var R8I:int = 33329;
      
      public static var R8UI:int = 33330;
      
      public static var R16I:int = 33331;
      
      public static var R16UI:int = 33332;
      
      public static var R32I:int = 33333;
      
      public static var R32UI:int = 33334;
      
      public static var RG8I:int = 33335;
      
      public static var RG8UI:int = 33336;
      
      public static var RG16I:int = 33337;
      
      public static var RG16UI:int = 33338;
      
      public static var RG32I:int = 33339;
      
      public static var RG32UI:int = 33340;
      
      public static var R8_SNORM:int = 36756;
      
      public static var RG8_SNORM:int = 36757;
      
      public static var RGB8_SNORM:int = 36758;
      
      public static var RGBA8_SNORM:int = 36759;
      
      public static var RGB10_A2UI:int = 36975;
      
      public static var TEXTURE_IMMUTABLE_FORMAT:int = 37167;
      
      public static var TEXTURE_IMMUTABLE_LEVELS:int = 33503;
      
      public static var UNSIGNED_INT_2_10_10_10_REV:int = 33640;
      
      public static var UNSIGNED_INT_10F_11F_11F_REV:int = 35899;
      
      public static var UNSIGNED_INT_5_9_9_9_REV:int = 35902;
      
      public static var FLOAT_32_UNSIGNED_INT_24_8_REV:int = 36269;
      
      public static var UNSIGNED_INT_24_8:int = 34042;
      
      public static var HALF_FLOAT:int = 5131;
      
      public static var RG:int = 33319;
      
      public static var RG_INTEGER:int = 33320;
      
      public static var INT_2_10_10_10_REV:int = 36255;
      
      public static var CURRENT_QUERY:int = 34917;
      
      public static var QUERY_RESULT:int = 34918;
      
      public static var QUERY_RESULT_AVAILABLE:int = 34919;
      
      public static var ANY_SAMPLES_PASSED:int = 35887;
      
      public static var ANY_SAMPLES_PASSED_CONSERVATIVE:int = 36202;
      
      public static var MAX_DRAW_BUFFERS:int = 34852;
      
      public static var DRAW_BUFFER0:int = 34853;
      
      public static var DRAW_BUFFER1:int = 34854;
      
      public static var DRAW_BUFFER2:int = 34855;
      
      public static var DRAW_BUFFER3:int = 34856;
      
      public static var DRAW_BUFFER4:int = 34857;
      
      public static var DRAW_BUFFER5:int = 34858;
      
      public static var DRAW_BUFFER6:int = 34859;
      
      public static var DRAW_BUFFER7:int = 34860;
      
      public static var DRAW_BUFFER8:int = 34861;
      
      public static var DRAW_BUFFER9:int = 34862;
      
      public static var DRAW_BUFFER10:int = 34863;
      
      public static var DRAW_BUFFER11:int = 34864;
      
      public static var DRAW_BUFFER12:int = 34865;
      
      public static var DRAW_BUFFER13:int = 34866;
      
      public static var DRAW_BUFFER14:int = 34867;
      
      public static var DRAW_BUFFER15:int = 34868;
      
      public static var MAX_COLOR_ATTACHMENTS:int = 36063;
      
      public static var COLOR_ATTACHMENT1:int = 36065;
      
      public static var COLOR_ATTACHMENT2:int = 36066;
      
      public static var COLOR_ATTACHMENT3:int = 36067;
      
      public static var COLOR_ATTACHMENT4:int = 36068;
      
      public static var COLOR_ATTACHMENT5:int = 36069;
      
      public static var COLOR_ATTACHMENT6:int = 36070;
      
      public static var COLOR_ATTACHMENT7:int = 36071;
      
      public static var COLOR_ATTACHMENT8:int = 36072;
      
      public static var COLOR_ATTACHMENT9:int = 36073;
      
      public static var COLOR_ATTACHMENT10:int = 36074;
      
      public static var COLOR_ATTACHMENT11:int = 36075;
      
      public static var COLOR_ATTACHMENT12:int = 36076;
      
      public static var COLOR_ATTACHMENT13:int = 36077;
      
      public static var COLOR_ATTACHMENT14:int = 36078;
      
      public static var COLOR_ATTACHMENT15:int = 36079;
      
      public static var SAMPLER_3D:int = 35679;
      
      public static var SAMPLER_2D_SHADOW:int = 35682;
      
      public static var SAMPLER_2D_ARRAY:int = 36289;
      
      public static var SAMPLER_2D_ARRAY_SHADOW:int = 36292;
      
      public static var SAMPLER_CUBE_SHADOW:int = 36293;
      
      public static var INT_SAMPLER_2D:int = 36298;
      
      public static var INT_SAMPLER_3D:int = 36299;
      
      public static var INT_SAMPLER_CUBE:int = 36300;
      
      public static var INT_SAMPLER_2D_ARRAY:int = 36303;
      
      public static var UNSIGNED_INT_SAMPLER_2D:int = 36306;
      
      public static var UNSIGNED_INT_SAMPLER_3D:int = 36307;
      
      public static var UNSIGNED_INT_SAMPLER_CUBE:int = 36308;
      
      public static var UNSIGNED_INT_SAMPLER_2D_ARRAY:int = 36311;
      
      public static var MAX_SAMPLES:int = 36183;
      
      public static var SAMPLER_BINDING:int = 35097;
      
      public static var PIXEL_PACK_BUFFER:int = 35051;
      
      public static var PIXEL_UNPACK_BUFFER:int = 35052;
      
      public static var PIXEL_PACK_BUFFER_BINDING:int = 35053;
      
      public static var PIXEL_UNPACK_BUFFER_BINDING:int = 35055;
      
      public static var COPY_READ_BUFFER:int = 36662;
      
      public static var COPY_WRITE_BUFFER:int = 36663;
      
      public static var COPY_READ_BUFFER_BINDING:int = 36662;
      
      public static var COPY_WRITE_BUFFER_BINDING:int = 36663;
      
      public static var FLOAT_MAT2x3:int = 35685;
      
      public static var FLOAT_MAT2x4:int = 35686;
      
      public static var FLOAT_MAT3x2:int = 35687;
      
      public static var FLOAT_MAT3x4:int = 35688;
      
      public static var FLOAT_MAT4x2:int = 35689;
      
      public static var FLOAT_MAT4x3:int = 35690;
      
      public static var UNSIGNED_INT_VEC2:int = 36294;
      
      public static var UNSIGNED_INT_VEC3:int = 36295;
      
      public static var UNSIGNED_INT_VEC4:int = 36296;
      
      public static var UNSIGNED_NORMALIZED:int = 35863;
      
      public static var SIGNED_NORMALIZED:int = 36764;
      
      public static var VERTEX_ATTRIB_ARRAY_INTEGER:int = 35069;
      
      public static var VERTEX_ATTRIB_ARRAY_DIVISOR:int = 35070;
      
      public static var TRANSFORM_FEEDBACK_BUFFER_MODE:int = 35967;
      
      public static var MAX_TRANSFORM_FEEDBACK_SEPARATE_COMPONENTS:int = 35968;
      
      public static var TRANSFORM_FEEDBACK_VARYINGS:int = 35971;
      
      public static var TRANSFORM_FEEDBACK_BUFFER_START:int = 35972;
      
      public static var TRANSFORM_FEEDBACK_BUFFER_SIZE:int = 35973;
      
      public static var TRANSFORM_FEEDBACK_PRIMITIVES_WRITTEN:int = 35976;
      
      public static var MAX_TRANSFORM_FEEDBACK_INTERLEAVED_COMPONENTS:int = 35978;
      
      public static var MAX_TRANSFORM_FEEDBACK_SEPARATE_ATTRIBS:int = 35979;
      
      public static var INTERLEAVED_ATTRIBS:int = 35980;
      
      public static var SEPARATE_ATTRIBS:int = 35981;
      
      public static var TRANSFORM_FEEDBACK_BUFFER:int = 35982;
      
      public static var TRANSFORM_FEEDBACK_BUFFER_BINDING:int = 35983;
      
      public static var TRANSFORM_FEEDBACK:int = 36386;
      
      public static var TRANSFORM_FEEDBACK_PAUSED:int = 36387;
      
      public static var TRANSFORM_FEEDBACK_ACTIVE:int = 36388;
      
      public static var TRANSFORM_FEEDBACK_BINDING:int = 36389;
      
      public static var FRAMEBUFFER_ATTACHMENT_COLOR_ENCODING:int = 33296;
      
      public static var FRAMEBUFFER_ATTACHMENT_COMPONENT_TYPE:int = 33297;
      
      public static var FRAMEBUFFER_ATTACHMENT_RED_SIZE:int = 33298;
      
      public static var FRAMEBUFFER_ATTACHMENT_GREEN_SIZE:int = 33299;
      
      public static var FRAMEBUFFER_ATTACHMENT_BLUE_SIZE:int = 33300;
      
      public static var FRAMEBUFFER_ATTACHMENT_ALPHA_SIZE:int = 33301;
      
      public static var FRAMEBUFFER_ATTACHMENT_DEPTH_SIZE:int = 33302;
      
      public static var FRAMEBUFFER_ATTACHMENT_STENCIL_SIZE:int = 33303;
      
      public static var FRAMEBUFFER_DEFAULT:int = 33304;
      
      public static var DEPTH24_STENCIL8:int = 35056;
      
      public static var DRAW_FRAMEBUFFER_BINDING:int = 36006;
      
      public static var READ_FRAMEBUFFER:int = 36008;
      
      public static var DRAW_FRAMEBUFFER:int = 36009;
      
      public static var READ_FRAMEBUFFER_BINDING:int = 36010;
      
      public static var RENDERBUFFER_SAMPLES:int = 36011;
      
      public static var FRAMEBUFFER_ATTACHMENT_TEXTURE_LAYER:int = 36052;
      
      public static var FRAMEBUFFER_INCOMPLETE_MULTISAMPLE:int = 36182;
      
      public static var UNIFORM_BUFFER:int = 35345;
      
      public static var UNIFORM_BUFFER_BINDING:int = 35368;
      
      public static var UNIFORM_BUFFER_START:int = 35369;
      
      public static var UNIFORM_BUFFER_SIZE:int = 35370;
      
      public static var MAX_VERTEX_UNIFORM_BLOCKS:int = 35371;
      
      public static var MAX_FRAGMENT_UNIFORM_BLOCKS:int = 35373;
      
      public static var MAX_COMBINED_UNIFORM_BLOCKS:int = 35374;
      
      public static var MAX_UNIFORM_BUFFER_BINDINGS:int = 35375;
      
      public static var MAX_UNIFORM_BLOCK_SIZE:int = 35376;
      
      public static var MAX_COMBINED_VERTEX_UNIFORM_COMPONENTS:int = 35377;
      
      public static var MAX_COMBINED_FRAGMENT_UNIFORM_COMPONENTS:int = 35379;
      
      public static var UNIFORM_BUFFER_OFFSET_ALIGNMENT:int = 35380;
      
      public static var ACTIVE_UNIFORM_BLOCKS:int = 35382;
      
      public static var UNIFORM_TYPE:int = 35383;
      
      public static var UNIFORM_SIZE:int = 35384;
      
      public static var UNIFORM_BLOCK_INDEX:int = 35386;
      
      public static var UNIFORM_OFFSET:int = 35387;
      
      public static var UNIFORM_ARRAY_STRIDE:int = 35388;
      
      public static var UNIFORM_MATRIX_STRIDE:int = 35389;
      
      public static var UNIFORM_IS_ROW_MAJOR:int = 35390;
      
      public static var UNIFORM_BLOCK_BINDING:int = 35391;
      
      public static var UNIFORM_BLOCK_DATA_SIZE:int = 35392;
      
      public static var UNIFORM_BLOCK_ACTIVE_UNIFORMS:int = 35394;
      
      public static var UNIFORM_BLOCK_ACTIVE_UNIFORM_INDICES:int = 35395;
      
      public static var UNIFORM_BLOCK_REFERENCED_BY_VERTEX_SHADER:int = 35396;
      
      public static var UNIFORM_BLOCK_REFERENCED_BY_FRAGMENT_SHADER:int = 35398;
      
      public static var OBJECT_TYPE:int = 37138;
      
      public static var SYNC_CONDITION:int = 37139;
      
      public static var SYNC_STATUS:int = 37140;
      
      public static var SYNC_FLAGS:int = 37141;
      
      public static var SYNC_FENCE:int = 37142;
      
      public static var SYNC_GPU_COMMANDS_COMPLETE:int = 37143;
      
      public static var UNSIGNALED:int = 37144;
      
      public static var SIGNALED:int = 37145;
      
      public static var ALREADY_SIGNALED:int = 37146;
      
      public static var TIMEOUT_EXPIRED:int = 37147;
      
      public static var CONDITION_SATISFIED:int = 37148;
      
      public static var WAIT_FAILED:int = 37149;
      
      public static var SYNC_FLUSH_COMMANDS_BIT:int = 1;
      
      public static var COLOR:int = 6144;
      
      public static var DEPTH:int = 6145;
      
      public static var STENCIL:int = 6146;
      
      public static var MIN:int = 32775;
      
      public static var MAX:int = 32776;
      
      public static var DEPTH_COMPONENT24:int = 33190;
      
      public static var STREAM_READ:int = 35041;
      
      public static var STREAM_COPY:int = 35042;
      
      public static var STATIC_READ:int = 35045;
      
      public static var STATIC_COPY:int = 35046;
      
      public static var DYNAMIC_READ:int = 35049;
      
      public static var DYNAMIC_COPY:int = 35050;
      
      public static var DEPTH_COMPONENT32F:int = 36012;
      
      public static var DEPTH32F_STENCIL8:int = 36013;
      
      public static var INVALID_INDEX:int = -1;
      
      public static var TIMEOUT_IGNORED:int = -1;
      
      public static var MAX_CLIENT_WAIT_TIMEOUT_WEBGL:int = 37447;
      
      public function GL()
      {
      }
      
      public static function activeTexture(param1:int) : void
      {
         GL.context.activeTexture(param1);
      }
      
      public static function attachShader(param1:GLObject, param2:GLObject) : void
      {
         GL.context.attachShader(param1,param2);
      }
      
      public static function beginQuery(param1:int, param2:*) : void
      {
         GL.context.beginQuery(param1,param2);
      }
      
      public static function beginTransformFeedback(param1:int) : void
      {
         GL.context.beginTransformFeedback(param1);
      }
      
      public static function bindAttribLocation(param1:GLObject, param2:int, param3:String) : void
      {
         GL.context.bindAttribLocation(param1,param2,param3);
      }
      
      public static function bindBuffer(param1:int, param2:*) : void
      {
         GL.context.bindBuffer(param1,param2);
      }
      
      public static function bindBufferBase(param1:int, param2:int, param3:*) : void
      {
         GL.context.bindBufferBase(param1,param2,param3);
      }
      
      public static function bindBufferRange(param1:int, param2:int, param3:*, param4:int, param5:int) : void
      {
         GL.context.bindBufferRange(param1,param2,param3,param4,param5);
      }
      
      public static function bindFramebuffer(param1:int, param2:*) : void
      {
         GL.context.bindFramebuffer(param1,param2);
      }
      
      public static function bindRenderbuffer(param1:int, param2:*) : void
      {
         GL.context.bindRenderbuffer(param1,param2);
      }
      
      public static function bindSampler(param1:int, param2:*) : void
      {
         GL.context.bindSampler(param1,param2);
      }
      
      public static function bindTexture(param1:int, param2:*) : void
      {
         GL.context.bindTexture(param1,param2);
      }
      
      public static function bindTransformFeedback(param1:int, param2:*) : void
      {
         GL.context.bindTransformFeedback(param1,param2);
      }
      
      public static function bindVertexArray(param1:*) : void
      {
         GL.context.bindVertexArray(param1);
      }
      
      public static function blitFramebuffer(param1:int, param2:int, param3:int, param4:int, param5:int, param6:int, param7:int, param8:int, param9:int, param10:int) : void
      {
         GL.context.blitFramebuffer(param1,param2,param3,param4,param5,param6,param7,param8,param9,param10);
      }
      
      public static function blendColor(param1:Number, param2:Number, param3:Number, param4:Number) : void
      {
         GL.context.blendColor(param1,param2,param3,param4);
      }
      
      public static function blendEquation(param1:int) : void
      {
         GL.context.blendEquation(param1);
      }
      
      public static function blendEquationSeparate(param1:int, param2:int) : void
      {
         GL.context.blendEquationSeparate(param1,param2);
      }
      
      public static function blendFunc(param1:int, param2:int) : void
      {
         GL.context.blendFunc(param1,param2);
      }
      
      public static function blendFuncSeparate(param1:int, param2:int, param3:int, param4:int) : void
      {
         GL.context.blendFuncSeparate(param1,param2,param3,param4);
      }
      
      public static function checkFramebufferStatus(param1:int) : int
      {
         return GL.context.checkFramebufferStatus(param1);
      }
      
      public static function clear(param1:int) : void
      {
         GL.context.clear(param1);
      }
      
      public static function clearBufferfi(param1:int, param2:int, param3:Number, param4:int) : void
      {
         GL.context.clearBufferfi(param1,param2,param3,param4);
      }
      
      public static function clearColor(param1:Number, param2:Number, param3:Number, param4:Number) : void
      {
         GL.context.clearColor(param1,param2,param3,param4);
      }
      
      public static function clearStencil(param1:int) : void
      {
         GL.context.clearStencil(param1);
      }
      
      public static function clientWaitSync(param1:*, param2:int, param3:___Int64) : int
      {
         return GL.context.clientWaitSync(param1,param2,param3);
      }
      
      public static function colorMask(param1:Boolean, param2:Boolean, param3:Boolean, param4:Boolean) : void
      {
         GL.context.colorMask(param1,param2,param3,param4);
      }
      
      public static function compileShader(param1:GLObject) : void
      {
         GL.context.compileShader(param1);
      }
      
      public static function copyTexImage2D(param1:int, param2:int, param3:int, param4:int, param5:int, param6:int, param7:int, param8:int) : void
      {
         GL.context.copyTexImage2D(param1,param2,param3,param4,param5,param6,param7,param8);
      }
      
      public static function copyTexSubImage2D(param1:int, param2:int, param3:int, param4:int, param5:int, param6:int, param7:int, param8:int) : void
      {
         GL.context.copyTexSubImage2D(param1,param2,param3,param4,param5,param6,param7,param8);
      }
      
      public static function copyTexSubImage3D(param1:int, param2:int, param3:int, param4:int, param5:int, param6:int, param7:int, param8:int, param9:int) : void
      {
         GL.context.copyTexSubImage3D(param1,param2,param3,param4,param5,param6,param7,param8,param9);
      }
      
      public static function createBuffer() : *
      {
         return GL.context.createBuffer();
      }
      
      public static function createFramebuffer() : *
      {
         return GL.context.createFramebuffer();
      }
      
      public static function createProgram() : GLObject
      {
         return GL.context.createProgram();
      }
      
      public static function createQuery() : *
      {
         return GL.context.createQuery();
      }
      
      public static function createRenderbuffer() : *
      {
         return GL.context.createRenderbuffer();
      }
      
      public static function createSampler() : *
      {
         return GL.context.createSampler();
      }
      
      public static function createShader(param1:int) : GLObject
      {
         return GL.context.createShader(param1);
      }
      
      public static function createTexture() : *
      {
         return GL.context.createTexture();
      }
      
      public static function createTransformFeedback() : *
      {
         return GL.context.createTransformFeedback();
      }
      
      public static function createVertexArray() : *
      {
         return GL.context.createVertexArray();
      }
      
      public static function cullFace(param1:int) : void
      {
         GL.context.cullFace(param1);
      }
      
      public static function deleteBuffer(param1:*) : void
      {
         GL.context.deleteBuffer(param1);
      }
      
      public static function deleteFramebuffer(param1:*) : void
      {
         GL.context.deleteFramebuffer(param1);
      }
      
      public static function deleteProgram(param1:GLObject) : void
      {
         GL.context.deleteProgram(param1);
      }
      
      public static function deleteQuery(param1:*) : void
      {
         GL.context.deleteQuery(param1);
      }
      
      public static function deleteRenderbuffer(param1:*) : void
      {
         GL.context.deleteRenderbuffer(param1);
      }
      
      public static function deleteSampler(param1:*) : void
      {
         GL.context.deleteSampler(param1);
      }
      
      public static function deleteShader(param1:GLObject) : void
      {
         GL.context.deleteShader(param1);
      }
      
      public static function deleteSync(param1:*) : void
      {
         GL.context.deleteSync(param1);
      }
      
      public static function deleteTexture(param1:*) : void
      {
         GL.context.deleteTexture(param1);
      }
      
      public static function deleteTransformFeedback(param1:*) : void
      {
         GL.context.deleteTransformFeedback(param1);
      }
      
      public static function deleteVertexArray(param1:*) : void
      {
         GL.context.deleteVertexArray(param1);
      }
      
      public static function depthFunc(param1:int) : void
      {
         GL.context.depthFunc(param1);
      }
      
      public static function depthMask(param1:Boolean) : void
      {
         GL.context.depthMask(param1);
      }
      
      public static function detachShader(param1:GLObject, param2:GLObject) : void
      {
         GL.context.detachShader(param1,param2);
      }
      
      public static function disable(param1:int) : void
      {
         GL.context.disable(param1);
      }
      
      public static function disableVertexAttribArray(param1:int) : void
      {
         GL.context.disableVertexAttribArray(param1);
      }
      
      public static function drawArrays(param1:int, param2:int, param3:int) : void
      {
         GL.context.drawArrays(param1,param2,param3);
      }
      
      public static function drawArraysInstanced(param1:int, param2:int, param3:int, param4:int) : void
      {
         GL.context.drawArraysInstanced(param1,param2,param3,param4);
      }
      
      public static function drawBuffers(param1:Array) : void
      {
         GL.context.drawBuffers(param1);
      }
      
      public static function drawElements(param1:int, param2:int, param3:int, param4:int) : void
      {
         GL.context.drawElements(param1,param2,param3,param4);
      }
      
      public static function drawElementsInstanced(param1:int, param2:int, param3:int, param4:int, param5:int) : void
      {
         GL.context.drawElementsInstanced(param1,param2,param3,param4,param5);
      }
      
      public static function drawRangeElements(param1:int, param2:int, param3:int, param4:int, param5:int, param6:int) : void
      {
         GL.context.drawRangeElements(param1,param2,param3,param4,param5,param6);
      }
      
      public static function enable(param1:int) : void
      {
         GL.context.enable(param1);
      }
      
      public static function enableVertexAttribArray(param1:int) : void
      {
         GL.context.enableVertexAttribArray(param1);
      }
      
      public static function endQuery(param1:int) : void
      {
         GL.context.endQuery(param1);
      }
      
      public static function endTransformFeedback() : void
      {
         GL.context.endTransformFeedback();
      }
      
      public static function fenceSync(param1:int, param2:int) : *
      {
         return GL.context.fenceSync(param1,param2);
      }
      
      public static function finish() : void
      {
         GL.context.finish();
      }
      
      public static function flush() : void
      {
         GL.context.flush();
      }
      
      public static function framebufferRenderbuffer(param1:int, param2:int, param3:int, param4:*) : void
      {
         GL.context.framebufferRenderbuffer(param1,param2,param3,param4);
      }
      
      public static function framebufferTexture2D(param1:int, param2:int, param3:int, param4:*, param5:int) : void
      {
         GL.context.framebufferTexture2D(param1,param2,param3,param4,param5);
      }
      
      public static function framebufferTextureLayer(param1:int, param2:int, param3:*, param4:int, param5:int) : void
      {
         GL.context.framebufferTextureLayer(param1,param2,param3,param4,param5);
      }
      
      public static function frontFace(param1:int) : void
      {
         GL.context.frontFace(param1);
      }
      
      public static function generateMipmap(param1:int) : void
      {
         GL.context.generateMipmap(param1);
      }
      
      public static function getActiveAttrib(param1:GLObject, param2:int) : Object
      {
         return GL.context.getActiveAttrib(param1,param2);
      }
      
      public static function getActiveUniform(param1:GLObject, param2:int) : Object
      {
         return GL.context.getActiveUniform(param1,param2);
      }
      
      public static function getActiveUniformBlockName(param1:GLObject, param2:int) : String
      {
         return GL.context.getActiveUniformBlockName(param1,param2);
      }
      
      public static function getActiveUniformBlockParameter(param1:GLObject, param2:int, param3:int) : *
      {
         return GL.context.getActiveUniformBlockParameter(param1,param2,param3);
      }
      
      public static function getActiveUniforms(param1:GLObject, param2:Array, param3:int) : *
      {
         return GL.context.getActiveUniforms(param1,param2,param3);
      }
      
      public static function getAttachedShaders(param1:GLObject) : Array
      {
         return GL.context.getAttachedShaders(param1);
      }
      
      public static function getAttribLocation(param1:GLObject, param2:String) : int
      {
         return GL.context.getAttribLocation(param1,param2);
      }
      
      public static function getBufferParameter(param1:int, param2:int) : *
      {
         return GL.context.getBufferParameter(param1,param2);
      }
      
      public static function getContextAttributes() : Object
      {
         return GL.context.getContextAttributes();
      }
      
      public static function getError() : int
      {
         return GL.context.getError();
      }
      
      public static function getExtension(param1:String) : *
      {
         return GL.context.getExtension(param1);
      }
      
      public static function getFragDataLocation(param1:GLObject, param2:String) : int
      {
         return GL.context.getFragDataLocation(param1,param2);
      }
      
      public static function getFramebufferAttachmentParameter(param1:int, param2:int, param3:int) : *
      {
         return GL.context.getFramebufferAttachmentParameter(param1,param2,param3);
      }
      
      public static function getIndexedParameter(param1:int, param2:int) : *
      {
         return GL.context.getIndexedParameter(param1,param2);
      }
      
      public static function getInternalformatParameter(param1:int, param2:int, param3:int) : *
      {
         return GL.context.getInternalformatParameter(param1,param2,param3);
      }
      
      public static function getParameter(param1:int) : *
      {
         return GL.context.getParameter(param1);
      }
      
      public static function getProgramInfoLog(param1:GLObject) : String
      {
         return GL.context.getProgramInfoLog(param1);
      }
      
      public static function getProgramParameter(param1:GLObject, param2:int) : *
      {
         return GL.context.getProgramParameter(param1,param2);
      }
      
      public static function getQuery(param1:int, param2:int) : *
      {
         return GL.context.getQuery(param1,param2);
      }
      
      public static function getQueryParameter(param1:*, param2:int) : *
      {
         return GL.context.getQueryParameter(param1,param2);
      }
      
      public static function getRenderbufferParameter(param1:int, param2:int) : *
      {
         return GL.context.getRenderbufferParameter(param1,param2);
      }
      
      public static function getSamplerParameter(param1:*, param2:int) : *
      {
         return GL.context.getSamplerParameter(param1,param2);
      }
      
      public static function getShaderInfoLog(param1:GLObject) : String
      {
         return GL.context.getShaderInfoLog(param1);
      }
      
      public static function getShaderParameter(param1:GLObject, param2:int) : *
      {
         return GL.context.getShaderParameter(param1,param2);
      }
      
      public static function getShaderPrecisionFormat(param1:int, param2:int) : Object
      {
         return GL.context.getShaderPrecisionFormat(param1,param2);
      }
      
      public static function getShaderSource(param1:GLObject) : String
      {
         return GL.context.getShaderSource(param1);
      }
      
      public static function getSupportedExtensions() : Array
      {
         return GL.context.getSupportedExtensions();
      }
      
      public static function getSyncParameter(param1:*, param2:int) : *
      {
         return GL.context.getSyncParameter(param1,param2);
      }
      
      public static function getTexParameter(param1:int, param2:int) : *
      {
         return GL.context.getTexParameter(param1,param2);
      }
      
      public static function getTransformFeedbackVarying(param1:GLObject, param2:int) : Object
      {
         return GL.context.getTransformFeedbackVarying(param1,param2);
      }
      
      public static function getUniform(param1:GLObject, param2:int) : *
      {
         return GL.context.getUniform(param1,param2);
      }
      
      public static function getUniformBlockIndex(param1:GLObject, param2:String) : int
      {
         return GL.context.getUniformBlockIndex(param1,param2);
      }
      
      public static function getUniformIndices(param1:GLObject, param2:Array) : Array
      {
         return GL.context.getUniformIndices(param1,param2);
      }
      
      public static function getUniformLocation(param1:GLObject, param2:String) : int
      {
         return GL.context.getUniformLocation(param1,param2);
      }
      
      public static function getVertexAttrib(param1:int, param2:int) : *
      {
         return GL.context.getVertexAttrib(param1,param2);
      }
      
      public static function hint(param1:int, param2:int) : void
      {
         GL.context.hint(param1,param2);
      }
      
      public static function invalidateFramebuffer(param1:int, param2:Array) : void
      {
         GL.context.invalidateFramebuffer(param1,param2);
      }
      
      public static function invalidateSubFramebuffer(param1:int, param2:Array, param3:int, param4:int, param5:int, param6:int) : void
      {
         GL.context.invalidateSubFramebuffer(param1,param2,param3,param4,param5,param6);
      }
      
      public static function isBuffer(param1:*) : Boolean
      {
         return GL.context.isBuffer(param1);
      }
      
      public static function isContextLost() : Boolean
      {
         return GL.context.isContextLost();
      }
      
      public static function isEnabled(param1:int) : Boolean
      {
         return GL.context.isEnabled(param1);
      }
      
      public static function isFramebuffer(param1:*) : Boolean
      {
         return GL.context.isFramebuffer(param1);
      }
      
      public static function isProgram(param1:GLObject) : Boolean
      {
         return GL.context.isProgram(param1);
      }
      
      public static function isQuery(param1:*) : Boolean
      {
         return GL.context.isQuery(param1);
      }
      
      public static function isRenderbuffer(param1:*) : Boolean
      {
         return GL.context.isRenderbuffer(param1);
      }
      
      public static function isSampler(param1:*) : Boolean
      {
         return GL.context.isSampler(param1);
      }
      
      public static function isShader(param1:GLObject) : Boolean
      {
         return GL.context.isShader(param1);
      }
      
      public static function isSync(param1:*) : Boolean
      {
         return GL.context.isSync(param1);
      }
      
      public static function isTexture(param1:*) : Boolean
      {
         return GL.context.isTexture(param1);
      }
      
      public static function isTransformFeedback(param1:*) : Boolean
      {
         return GL.context.isTransformFeedback(param1);
      }
      
      public static function isVertexArray(param1:*) : Boolean
      {
         return GL.context.isVertexArray(param1);
      }
      
      public static function lineWidth(param1:Number) : void
      {
         GL.context.lineWidth(param1);
      }
      
      public static function linkProgram(param1:GLObject) : void
      {
         GL.context.linkProgram(param1);
      }
      
      public static function pauseTransformFeedback() : void
      {
         GL.context.pauseTransformFeedback();
      }
      
      public static function pixelStorei(param1:int, param2:int) : void
      {
         GL.context.pixelStorei(param1,param2);
      }
      
      public static function polygonOffset(param1:Number, param2:Number) : void
      {
         GL.context.polygonOffset(param1,param2);
      }
      
      public static function readBuffer(param1:int) : void
      {
         GL.context.readBuffer(param1);
      }
      
      public static function renderbufferStorage(param1:int, param2:int, param3:int, param4:int) : void
      {
         GL.context.renderbufferStorage(param1,param2,param3,param4);
      }
      
      public static function renderbufferStorageMultisample(param1:int, param2:int, param3:int, param4:int, param5:int) : void
      {
         GL.context.renderbufferStorageMultisample(param1,param2,param3,param4,param5);
      }
      
      public static function resumeTransformFeedback() : void
      {
         GL.context.resumeTransformFeedback();
      }
      
      public static function sampleCoverage(param1:Number, param2:Boolean) : void
      {
         GL.context.sampleCoverage(param1,param2);
      }
      
      public static function samplerParameterf(param1:*, param2:int, param3:Number) : void
      {
         GL.context.samplerParameterf(param1,param2,param3);
      }
      
      public static function samplerParameteri(param1:*, param2:int, param3:int) : void
      {
         GL.context.samplerParameteri(param1,param2,param3);
      }
      
      public static function scissor(param1:int, param2:int, param3:int, param4:int) : void
      {
         GL.context.scissor(param1,param2,param3,param4);
      }
      
      public static function shaderSource(param1:GLObject, param2:String) : void
      {
         GL.context.shaderSource(param1,param2);
      }
      
      public static function stencilFunc(param1:int, param2:int, param3:int) : void
      {
         GL.context.stencilFunc(param1,param2,param3);
      }
      
      public static function stencilFuncSeparate(param1:int, param2:int, param3:int, param4:int) : void
      {
         GL.context.stencilFuncSeparate(param1,param2,param3,param4);
      }
      
      public static function stencilMask(param1:int) : void
      {
         GL.context.stencilMask(param1);
      }
      
      public static function stencilMaskSeparate(param1:int, param2:int) : void
      {
         GL.context.stencilMaskSeparate(param1,param2);
      }
      
      public static function stencilOp(param1:int, param2:int, param3:int) : void
      {
         GL.context.stencilOp(param1,param2,param3);
      }
      
      public static function stencilOpSeparate(param1:int, param2:int, param3:int, param4:int) : void
      {
         GL.context.stencilOpSeparate(param1,param2,param3,param4);
      }
      
      public static function texStorage2D(param1:int, param2:int, param3:int, param4:int, param5:int) : void
      {
         GL.context.texStorage2D(param1,param2,param3,param4,param5);
      }
      
      public static function texStorage3D(param1:int, param2:int, param3:int, param4:int, param5:int, param6:int) : void
      {
         GL.context.texStorage3D(param1,param2,param3,param4,param5,param6);
      }
      
      public static function texParameterf(param1:int, param2:int, param3:Number) : void
      {
         GL.context.texParameterf(param1,param2,param3);
      }
      
      public static function texParameteri(param1:int, param2:int, param3:int) : void
      {
         GL.context.texParameteri(param1,param2,param3);
      }
      
      public static function transformFeedbackVaryings(param1:GLObject, param2:Array, param3:int) : void
      {
         GL.context.transformFeedbackVaryings(param1,param2,param3);
      }
      
      public static function uniform1f(param1:int, param2:Number) : void
      {
         GL.context.uniform1f(param1,param2);
      }
      
      public static function uniform1i(param1:int, param2:int) : void
      {
         GL.context.uniform1i(param1,param2);
      }
      
      public static function uniform1ui(param1:int, param2:int) : void
      {
         GL.context.uniform1ui(param1,param2);
      }
      
      public static function uniform2f(param1:int, param2:Number, param3:Number) : void
      {
         GL.context.uniform2f(param1,param2,param3);
      }
      
      public static function uniform2i(param1:int, param2:int, param3:int) : void
      {
         GL.context.uniform2i(param1,param2,param3);
      }
      
      public static function uniform2ui(param1:int, param2:int, param3:int) : void
      {
         GL.context.uniform2ui(param1,param2,param3);
      }
      
      public static function uniform3f(param1:int, param2:Number, param3:Number, param4:Number) : void
      {
         GL.context.uniform3f(param1,param2,param3,param4);
      }
      
      public static function uniform3i(param1:int, param2:int, param3:int, param4:int) : void
      {
         GL.context.uniform3i(param1,param2,param3,param4);
      }
      
      public static function uniform3ui(param1:int, param2:int, param3:int, param4:int) : void
      {
         GL.context.uniform3ui(param1,param2,param3,param4);
      }
      
      public static function uniform4f(param1:int, param2:Number, param3:Number, param4:Number, param5:Number) : void
      {
         GL.context.uniform4f(param1,param2,param3,param4,param5);
      }
      
      public static function uniform4i(param1:int, param2:int, param3:int, param4:int, param5:int) : void
      {
         GL.context.uniform4i(param1,param2,param3,param4,param5);
      }
      
      public static function uniform4ui(param1:int, param2:int, param3:int, param4:int, param5:int) : void
      {
         GL.context.uniform4ui(param1,param2,param3,param4,param5);
      }
      
      public static function uniformBlockBinding(param1:GLObject, param2:int, param3:int) : void
      {
         GL.context.uniformBlockBinding(param1,param2,param3);
      }
      
      public static function useProgram(param1:GLObject) : void
      {
         GL.context.useProgram(param1);
      }
      
      public static function validateProgram(param1:GLObject) : void
      {
         GL.context.validateProgram(param1);
      }
      
      public static function vertexAttrib1f(param1:int, param2:Number) : void
      {
         GL.context.vertexAttrib1f(param1,param2);
      }
      
      public static function vertexAttrib1fv(param1:int, param2:int) : void
      {
         GL.context.vertexAttrib1fv(param1,param2);
      }
      
      public static function vertexAttrib2f(param1:int, param2:Number, param3:Number) : void
      {
         GL.context.vertexAttrib2f(param1,param2,param3);
      }
      
      public static function vertexAttrib2fv(param1:int, param2:int) : void
      {
         GL.context.vertexAttrib2fv(param1,param2);
      }
      
      public static function vertexAttrib3f(param1:int, param2:Number, param3:Number, param4:Number) : void
      {
         GL.context.vertexAttrib3f(param1,param2,param3,param4);
      }
      
      public static function vertexAttrib3fv(param1:int, param2:int) : void
      {
         GL.context.vertexAttrib3fv(param1,param2);
      }
      
      public static function vertexAttrib4f(param1:int, param2:Number, param3:Number, param4:Number, param5:Number) : void
      {
         GL.context.vertexAttrib4f(param1,param2,param3,param4,param5);
      }
      
      public static function vertexAttrib4fv(param1:int, param2:int) : void
      {
         GL.context.vertexAttrib4fv(param1,param2);
      }
      
      public static function vertexAttribDivisor(param1:int, param2:int) : void
      {
         GL.context.vertexAttribDivisor(param1,param2);
      }
      
      public static function vertexAttribI4i(param1:int, param2:int, param3:int, param4:int, param5:int) : void
      {
         GL.context.vertexAttribI4i(param1,param2,param3,param4,param5);
      }
      
      public static function vertexAttribI4iv(param1:int, param2:int) : void
      {
         GL.context.vertexAttribI4iv(param1,param2);
      }
      
      public static function vertexAttribI4ui(param1:int, param2:int, param3:int, param4:int, param5:int) : void
      {
         GL.context.vertexAttribI4ui(param1,param2,param3,param4,param5);
      }
      
      public static function vertexAttribI4uiv(param1:int, param2:int) : void
      {
         GL.context.vertexAttribI4uiv(param1,param2);
      }
      
      public static function vertexAttribIPointer(param1:int, param2:int, param3:int, param4:int, param5:int) : void
      {
         GL.context.vertexAttribIPointer(param1,param2,param3,param4,param5);
      }
      
      public static function vertexAttribPointer(param1:int, param2:int, param3:int, param4:Boolean, param5:int, param6:int) : void
      {
         GL.context.vertexAttribPointer(param1,param2,param3,param4,param5,param6);
      }
      
      public static function viewport(param1:int, param2:int, param3:int, param4:int) : void
      {
         GL.context.viewport(param1,param2,param3,param4);
      }
      
      public static function waitSync(param1:*, param2:int, param3:___Int64) : void
      {
         GL.context.waitSync(param1,param2,param3);
      }
      
      public static function __getObjectID(param1:GLObject) : int
      {
         if(param1 == null)
         {
            return 0;
         }
         return param1.id;
      }
   }
}

