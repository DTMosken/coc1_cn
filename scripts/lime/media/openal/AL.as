package lime.media.openal
{
   import lime.utils.ArrayBufferView;
   
   public class AL
   {
      
      public static var NONE:int = 0;
      
      public static var FALSE:int = 0;
      
      public static var TRUE:int = 1;
      
      public static var SOURCE_RELATIVE:int = 514;
      
      public static var CONE_INNER_ANGLE:int = 4097;
      
      public static var CONE_OUTER_ANGLE:int = 4098;
      
      public static var PITCH:int = 4099;
      
      public static var POSITION:int = 4100;
      
      public static var DIRECTION:int = 4101;
      
      public static var VELOCITY:int = 4102;
      
      public static var LOOPING:int = 4103;
      
      public static var BUFFER:int = 4105;
      
      public static var GAIN:int = 4106;
      
      public static var MIN_GAIN:int = 4109;
      
      public static var MAX_GAIN:int = 4110;
      
      public static var ORIENTATION:int = 4111;
      
      public static var SOURCE_STATE:int = 4112;
      
      public static var INITIAL:int = 4113;
      
      public static var PLAYING:int = 4114;
      
      public static var PAUSED:int = 4115;
      
      public static var STOPPED:int = 4116;
      
      public static var BUFFERS_QUEUED:int = 4117;
      
      public static var BUFFERS_PROCESSED:int = 4118;
      
      public static var REFERENCE_DISTANCE:int = 4128;
      
      public static var ROLLOFF_FACTOR:int = 4129;
      
      public static var CONE_OUTER_GAIN:int = 4130;
      
      public static var MAX_DISTANCE:int = 4131;
      
      public static var SEC_OFFSET:int = 4132;
      
      public static var SAMPLE_OFFSET:int = 4133;
      
      public static var BYTE_OFFSET:int = 4134;
      
      public static var SOURCE_TYPE:int = 4135;
      
      public static var STATIC:int = 4136;
      
      public static var STREAMING:int = 4137;
      
      public static var UNDETERMINED:int = 4144;
      
      public static var FORMAT_MONO8:int = 4352;
      
      public static var FORMAT_MONO16:int = 4353;
      
      public static var FORMAT_STEREO8:int = 4354;
      
      public static var FORMAT_STEREO16:int = 4355;
      
      public static var FREQUENCY:int = 8193;
      
      public static var BITS:int = 8194;
      
      public static var CHANNELS:int = 8195;
      
      public static var SIZE:int = 8196;
      
      public static var NO_ERROR:int = 0;
      
      public static var INVALID_NAME:int = 40961;
      
      public static var INVALID_ENUM:int = 40962;
      
      public static var INVALID_VALUE:int = 40963;
      
      public static var INVALID_OPERATION:int = 40964;
      
      public static var OUT_OF_MEMORY:int = 40965;
      
      public static var VENDOR:int = 45057;
      
      public static var VERSION:int = 45058;
      
      public static var RENDERER:int = 45059;
      
      public static var EXTENSIONS:int = 45060;
      
      public static var DOPPLER_FACTOR:int = 49152;
      
      public static var SPEED_OF_SOUND:int = 49155;
      
      public static var DOPPLER_VELOCITY:int = 49153;
      
      public static var DISTANCE_MODEL:int = 53248;
      
      public static var INVERSE_DISTANCE:int = 53249;
      
      public static var INVERSE_DISTANCE_CLAMPED:int = 53250;
      
      public static var LINEAR_DISTANCE:int = 53251;
      
      public static var LINEAR_DISTANCE_CLAMPED:int = 53252;
      
      public static var EXPONENT_DISTANCE:int = 53253;
      
      public static var EXPONENT_DISTANCE_CLAMPED:int = 53254;
      
      public static var METERS_PER_UNIT:int = 131076;
      
      public static var DIRECT_FILTER:int = 131077;
      
      public static var AUXILIARY_SEND_FILTER:int = 131078;
      
      public static var AIR_ABSORPTION_FACTOR:int = 131079;
      
      public static var ROOM_ROLLOFF_FACTOR:int = 131080;
      
      public static var CONE_OUTER_GAINHF:int = 131081;
      
      public static var DIRECT_FILTER_GAINHF_AUTO:int = 131082;
      
      public static var AUXILIARY_SEND_FILTER_GAIN_AUTO:int = 131083;
      
      public static var AUXILIARY_SEND_FILTER_GAINHF_AUTO:int = 131084;
      
      public static var REVERB_DENSITY:int = 1;
      
      public static var REVERB_DIFFUSION:int = 2;
      
      public static var REVERB_GAIN:int = 3;
      
      public static var REVERB_GAINHF:int = 4;
      
      public static var REVERB_DECAY_TIME:int = 5;
      
      public static var REVERB_DECAY_HFRATIO:int = 6;
      
      public static var REVERB_REFLECTIONS_GAIN:int = 7;
      
      public static var REVERB_REFLECTIONS_DELAY:int = 8;
      
      public static var REVERB_LATE_REVERB_GAIN:int = 9;
      
      public static var REVERB_LATE_REVERB_DELAY:int = 10;
      
      public static var REVERB_AIR_ABSORPTION_GAINHF:int = 11;
      
      public static var REVERB_ROOM_ROLLOFF_FACTOR:int = 12;
      
      public static var REVERB_DECAY_HFLIMIT:int = 13;
      
      public static var EAXREVERB_DENSITY:int = 1;
      
      public static var EAXREVERB_DIFFUSION:int = 2;
      
      public static var EAXREVERB_GAIN:int = 3;
      
      public static var EAXREVERB_GAINHF:int = 4;
      
      public static var EAXREVERB_GAINLF:int = 5;
      
      public static var EAXREVERB_DECAY_TIME:int = 6;
      
      public static var EAXREVERB_DECAY_HFRATIO:int = 7;
      
      public static var EAXREVERB_DECAY_LFRATIO:int = 8;
      
      public static var EAXREVERB_REFLECTIONS_GAIN:int = 9;
      
      public static var EAXREVERB_REFLECTIONS_DELAY:int = 10;
      
      public static var EAXREVERB_REFLECTIONS_PAN:int = 11;
      
      public static var EAXREVERB_LATE_REVERB_GAIN:int = 12;
      
      public static var EAXREVERB_LATE_REVERB_DELAY:int = 13;
      
      public static var EAXREVERB_LATE_REVERB_PAN:int = 14;
      
      public static var EAXREVERB_ECHO_TIME:int = 15;
      
      public static var EAXREVERB_ECHO_DEPTH:int = 16;
      
      public static var EAXREVERB_MODULATION_TIME:int = 17;
      
      public static var EAXREVERB_MODULATION_DEPTH:int = 18;
      
      public static var EAXREVERB_AIR_ABSORPTION_GAINHF:int = 19;
      
      public static var EAXREVERB_HFREFERENCE:int = 20;
      
      public static var EAXREVERB_LFREFERENCE:int = 21;
      
      public static var EAXREVERB_ROOM_ROLLOFF_FACTOR:int = 22;
      
      public static var EAXREVERB_DECAY_HFLIMIT:int = 23;
      
      public static var CHORUS_WAVEFORM:int = 1;
      
      public static var CHORUS_PHASE:int = 2;
      
      public static var CHORUS_RATE:int = 3;
      
      public static var CHORUS_DEPTH:int = 4;
      
      public static var CHORUS_FEEDBACK:int = 5;
      
      public static var CHORUS_DELAY:int = 6;
      
      public static var DISTORTION_EDGE:int = 1;
      
      public static var DISTORTION_GAIN:int = 2;
      
      public static var DISTORTION_LOWPASS_CUTOFF:int = 3;
      
      public static var DISTORTION_EQCENTER:int = 4;
      
      public static var DISTORTION_EQBANDWIDTH:int = 5;
      
      public static var ECHO_DELAY:int = 1;
      
      public static var ECHO_LRDELAY:int = 2;
      
      public static var ECHO_DAMPING:int = 3;
      
      public static var ECHO_FEEDBACK:int = 4;
      
      public static var ECHO_SPREAD:int = 5;
      
      public static var FLANGER_WAVEFORM:int = 1;
      
      public static var FLANGER_PHASE:int = 2;
      
      public static var FLANGER_RATE:int = 3;
      
      public static var FLANGER_DEPTH:int = 4;
      
      public static var FLANGER_FEEDBACK:int = 5;
      
      public static var FLANGER_DELAY:int = 6;
      
      public static var FREQUENCY_SHIFTER_FREQUENCY:int = 1;
      
      public static var FREQUENCY_SHIFTER_LEFT_DIRECTION:int = 2;
      
      public static var FREQUENCY_SHIFTER_RIGHT_DIRECTION:int = 3;
      
      public static var VOCAL_MORPHER_PHONEMEA:int = 1;
      
      public static var VOCAL_MORPHER_PHONEMEA_COARSE_TUNING:int = 2;
      
      public static var VOCAL_MORPHER_PHONEMEB:int = 3;
      
      public static var VOCAL_MORPHER_PHONEMEB_COARSE_TUNING:int = 4;
      
      public static var VOCAL_MORPHER_WAVEFORM:int = 5;
      
      public static var VOCAL_MORPHER_RATE:int = 6;
      
      public static var PITCH_SHIFTER_COARSE_TUNE:int = 1;
      
      public static var PITCH_SHIFTER_FINE_TUNE:int = 2;
      
      public static var RING_MODULATOR_FREQUENCY:int = 1;
      
      public static var RING_MODULATOR_HIGHPASS_CUTOFF:int = 2;
      
      public static var RING_MODULATOR_WAVEFORM:int = 3;
      
      public static var AUTOWAH_ATTACK_TIME:int = 1;
      
      public static var AUTOWAH_RELEASE_TIME:int = 2;
      
      public static var AUTOWAH_RESONANCE:int = 3;
      
      public static var AUTOWAH_PEAK_GAIN:int = 4;
      
      public static var COMPRESSOR_ONOFF:int = 1;
      
      public static var EQUALIZER_LOW_GAIN:int = 1;
      
      public static var EQUALIZER_LOW_CUTOFF:int = 2;
      
      public static var EQUALIZER_MID1_GAIN:int = 3;
      
      public static var EQUALIZER_MID1_CENTER:int = 4;
      
      public static var EQUALIZER_MID1_WIDTH:int = 5;
      
      public static var EQUALIZER_MID2_GAIN:int = 6;
      
      public static var EQUALIZER_MID2_CENTER:int = 7;
      
      public static var EQUALIZER_MID2_WIDTH:int = 8;
      
      public static var EQUALIZER_HIGH_GAIN:int = 9;
      
      public static var EQUALIZER_HIGH_CUTOFF:int = 10;
      
      public static var EFFECT_FIRST_PARAMETER:int = 0;
      
      public static var EFFECT_LAST_PARAMETER:int = 32768;
      
      public static var EFFECT_TYPE:int = 32769;
      
      public static var EFFECT_NULL:int = 0;
      
      public static var EFFECT_EAXREVERB:int = 32768;
      
      public static var EFFECT_REVERB:int = 1;
      
      public static var EFFECT_CHORUS:int = 2;
      
      public static var EFFECT_DISTORTION:int = 3;
      
      public static var EFFECT_ECHO:int = 4;
      
      public static var EFFECT_FLANGER:int = 5;
      
      public static var EFFECT_FREQUENCY_SHIFTER:int = 6;
      
      public static var EFFECT_VOCAL_MORPHER:int = 7;
      
      public static var EFFECT_PITCH_SHIFTER:int = 8;
      
      public static var EFFECT_RING_MODULATOR:int = 9;
      
      public static var FFECT_AUTOWAH:int = 10;
      
      public static var EFFECT_AUTOWAH:int = 10;
      
      public static var EFFECT_COMPRESSOR:int = 11;
      
      public static var EFFECT_EQUALIZER:int = 12;
      
      public static var EFFECTSLOT_EFFECT:int = 1;
      
      public static var EFFECTSLOT_GAIN:int = 2;
      
      public static var EFFECTSLOT_AUXILIARY_SEND_AUTO:int = 3;
      
      public static var LOWPASS_GAIN:int = 1;
      
      public static var LOWPASS_GAINHF:int = 2;
      
      public static var HIGHPASS_GAIN:int = 1;
      
      public static var HIGHPASS_GAINLF:int = 2;
      
      public static var BANDPASS_GAIN:int = 1;
      
      public static var BANDPASS_GAINLF:int = 2;
      
      public static var BANDPASS_GAINHF:int = 3;
      
      public static var FILTER_FIRST_PARAMETER:int = 0;
      
      public static var FILTER_LAST_PARAMETER:int = 32768;
      
      public static var FILTER_TYPE:int = 32769;
      
      public static var FILTER_NULL:int = 0;
      
      public static var FILTER_LOWPASS:int = 1;
      
      public static var FILTER_HIGHPASS:int = 2;
      
      public static var FILTER_BANDPASS:int = 3;
      
      public function AL()
      {
      }
      
      public static function removeDirectFilter(param1:*) : void
      {
      }
      
      public static function removeSend(param1:*, param2:int) : void
      {
      }
      
      public static function auxf(param1:*, param2:int, param3:Number) : void
      {
      }
      
      public static function auxfv(param1:*, param2:int, param3:Array) : void
      {
      }
      
      public static function auxi(param1:*, param2:int, param3:*) : void
      {
      }
      
      public static function auxiv(param1:*, param2:int, param3:Array) : void
      {
      }
      
      public static function bufferData(param1:*, param2:int, param3:ArrayBufferView, param4:int, param5:int) : void
      {
      }
      
      public static function buffer3f(param1:*, param2:int, param3:Number, param4:Number, param5:Number) : void
      {
      }
      
      public static function buffer3i(param1:*, param2:int, param3:int, param4:int, param5:int) : void
      {
      }
      
      public static function bufferf(param1:*, param2:int, param3:Number) : void
      {
      }
      
      public static function bufferfv(param1:*, param2:int, param3:Array) : void
      {
      }
      
      public static function bufferi(param1:*, param2:int, param3:int) : void
      {
      }
      
      public static function bufferiv(param1:*, param2:int, param3:Array) : void
      {
      }
      
      public static function createAux() : *
      {
         return null;
      }
      
      public static function createBuffer() : *
      {
         return null;
      }
      
      public static function createEffect() : *
      {
         return null;
      }
      
      public static function createFilter() : *
      {
         return null;
      }
      
      public static function createSource() : *
      {
         return null;
      }
      
      public static function deleteBuffer(param1:*) : void
      {
      }
      
      public static function deleteBuffers(param1:Array) : void
      {
      }
      
      public static function deleteSource(param1:*) : void
      {
      }
      
      public static function deleteSources(param1:Array) : void
      {
      }
      
      public static function disable(param1:int) : void
      {
      }
      
      public static function distanceModel(param1:int) : void
      {
      }
      
      public static function dopplerFactor(param1:Number) : void
      {
      }
      
      public static function dopplerVelocity(param1:Number) : void
      {
      }
      
      public static function effectf(param1:*, param2:int, param3:Number) : void
      {
      }
      
      public static function effectfv(param1:*, param2:int, param3:Array) : void
      {
      }
      
      public static function effecti(param1:*, param2:int, param3:int) : void
      {
      }
      
      public static function effectiv(param1:*, param2:int, param3:Array) : void
      {
      }
      
      public static function enable(param1:int) : void
      {
      }
      
      public static function genSource() : *
      {
         return null;
      }
      
      public static function genSources(param1:int) : Array
      {
         return null;
      }
      
      public static function genBuffer() : *
      {
         return null;
      }
      
      public static function genBuffers(param1:int) : Array
      {
         return null;
      }
      
      public static function getBoolean(param1:int) : Boolean
      {
         return false;
      }
      
      public static function getBooleanv(param1:int, param2:int = 1) : Array
      {
         return null;
      }
      
      public static function getBuffer3f(param1:*, param2:int) : Array
      {
         return null;
      }
      
      public static function getBuffer3i(param1:*, param2:int) : Array
      {
         return null;
      }
      
      public static function getBufferf(param1:*, param2:int) : Number
      {
         return 0;
      }
      
      public static function getBufferfv(param1:*, param2:int, param3:int = 1) : Array
      {
         return null;
      }
      
      public static function getBufferi(param1:*, param2:int) : int
      {
         return 0;
      }
      
      public static function getBufferiv(param1:*, param2:int, param3:int = 1) : Array
      {
         return null;
      }
      
      public static function getDouble(param1:int) : Number
      {
         return 0;
      }
      
      public static function getDoublev(param1:int, param2:int = 1) : Array
      {
         return null;
      }
      
      public static function getEnumValue(param1:String) : int
      {
         return 0;
      }
      
      public static function getError() : int
      {
         return 0;
      }
      
      public static function getErrorString() : String
      {
         var _loc1_:int = AL.getError();
         if(_loc1_ == 40961)
         {
            return "INVALID_NAME: Invalid parameter name";
         }
         if(_loc1_ == 40962)
         {
            return "INVALID_ENUM: Invalid enum value";
         }
         if(_loc1_ == 40963)
         {
            return "INVALID_VALUE: Invalid parameter value";
         }
         if(_loc1_ == 40964)
         {
            return "INVALID_OPERATION: Illegal operation or call";
         }
         if(_loc1_ == 40965)
         {
            return "OUT_OF_MEMORY: OpenAL has run out of memory";
         }
         return "";
      }
      
      public static function getFilteri(param1:*, param2:int) : int
      {
         return 0;
      }
      
      public static function getFloat(param1:int) : Number
      {
         return 0;
      }
      
      public static function getFloatv(param1:int, param2:int = 1) : Array
      {
         return null;
      }
      
      public static function getInteger(param1:int) : int
      {
         return 0;
      }
      
      public static function getIntegerv(param1:int, param2:int = 1) : Array
      {
         return null;
      }
      
      public static function getListener3f(param1:int) : Array
      {
         return null;
      }
      
      public static function getListener3i(param1:int) : Array
      {
         return null;
      }
      
      public static function getListenerf(param1:int) : Number
      {
         return 0;
      }
      
      public static function getListenerfv(param1:int, param2:int = 1) : Array
      {
         return null;
      }
      
      public static function getListeneri(param1:int) : int
      {
         return 0;
      }
      
      public static function getListeneriv(param1:int, param2:int = 1) : Array
      {
         return null;
      }
      
      public static function getParameter(param1:int) : *
      {
         return null;
      }
      
      public static function getProcAddress(param1:String) : *
      {
         return null;
      }
      
      public static function getSource3f(param1:*, param2:int) : Array
      {
         return null;
      }
      
      public static function getSourcef(param1:*, param2:int) : Number
      {
         return 0;
      }
      
      public static function getSource3i(param1:*, param2:int) : Array
      {
         return null;
      }
      
      public static function getSourcefv(param1:*, param2:int, param3:int = 1) : Array
      {
         return null;
      }
      
      public static function getSourcei(param1:*, param2:int) : *
      {
         return 0;
      }
      
      public static function getSourceiv(param1:*, param2:int, param3:int = 1) : Array
      {
         return null;
      }
      
      public static function getString(param1:int) : String
      {
         return null;
      }
      
      public static function isBuffer(param1:*) : Boolean
      {
         return false;
      }
      
      public static function isEnabled(param1:int) : Boolean
      {
         return false;
      }
      
      public static function isExtensionPresent(param1:String) : Boolean
      {
         return false;
      }
      
      public static function isAux(param1:*) : Boolean
      {
         return false;
      }
      
      public static function isEffect(param1:*) : Boolean
      {
         return false;
      }
      
      public static function isFilter(param1:*) : Boolean
      {
         return false;
      }
      
      public static function isSource(param1:*) : Boolean
      {
         return false;
      }
      
      public static function listener3f(param1:int, param2:Number, param3:Number, param4:Number) : void
      {
      }
      
      public static function listener3i(param1:int, param2:int, param3:int, param4:int) : void
      {
      }
      
      public static function listenerf(param1:int, param2:Number) : void
      {
      }
      
      public static function listenerfv(param1:int, param2:Array) : void
      {
      }
      
      public static function listeneri(param1:int, param2:int) : void
      {
      }
      
      public static function listeneriv(param1:int, param2:Array) : void
      {
      }
      
      public static function source3f(param1:*, param2:int, param3:Number, param4:Number, param5:Number) : void
      {
      }
      
      public static function source3i(param1:*, param2:int, param3:*, param4:int, param5:int) : void
      {
      }
      
      public static function sourcef(param1:*, param2:int, param3:Number) : void
      {
      }
      
      public static function sourcefv(param1:*, param2:int, param3:Array) : void
      {
      }
      
      public static function sourcei(param1:*, param2:int, param3:*) : void
      {
      }
      
      public static function filteri(param1:*, param2:int, param3:*) : void
      {
      }
      
      public static function filterf(param1:*, param2:int, param3:Number) : void
      {
      }
      
      public static function sourceiv(param1:*, param2:int, param3:Array) : void
      {
      }
      
      public static function sourcePlay(param1:*) : void
      {
      }
      
      public static function sourcePlayv(param1:Array) : void
      {
      }
      
      public static function sourceStop(param1:*) : void
      {
      }
      
      public static function sourceStopv(param1:Array) : void
      {
      }
      
      public static function sourceRewind(param1:*) : void
      {
      }
      
      public static function sourceRewindv(param1:Array) : void
      {
      }
      
      public static function sourcePause(param1:*) : void
      {
      }
      
      public static function sourcePausev(param1:Array) : void
      {
      }
      
      public static function sourceQueueBuffer(param1:*, param2:*) : void
      {
      }
      
      public static function sourceQueueBuffers(param1:*, param2:int, param3:Array) : void
      {
      }
      
      public static function sourceUnqueueBuffer(param1:*) : *
      {
         return 0;
      }
      
      public static function sourceUnqueueBuffers(param1:*, param2:int) : Array
      {
         return null;
      }
      
      public static function speedOfSound(param1:Number) : void
      {
      }
   }
}

