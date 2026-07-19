package lime.media
{
   import flash.Boot;
   import lime.media.openal.AL;
   import lime.media.openal.ALC;
   import lime.utils.ArrayBufferView;
   
   public class OpenALAudioContext
   {
      
      public var VERSION:int;
      
      public var VENDOR:int;
      
      public var VELOCITY:int;
      
      public var UNDETERMINED:int;
      
      public var TRUE:int;
      
      public var SYNC:int;
      
      public var STREAMING:int;
      
      public var STOPPED:int;
      
      public var STEREO_SOURCES:int;
      
      public var STATIC:int;
      
      public var SPEED_OF_SOUND:int;
      
      public var SOURCE_TYPE:int;
      
      public var SOURCE_STATE:int;
      
      public var SOURCE_RELATIVE:int;
      
      public var SIZE:int;
      
      public var SEC_OFFSET:int;
      
      public var SAMPLE_OFFSET:int;
      
      public var ROLLOFF_FACTOR:int;
      
      public var RENDERER:int;
      
      public var REFRESH:int;
      
      public var REFERENCE_DISTANCE:int;
      
      public var POSITION:int;
      
      public var PLAYING:int;
      
      public var PITCH:int;
      
      public var PAUSED:int;
      
      public var OUT_OF_MEMORY:int;
      
      public var ORIENTATION:int;
      
      public var NO_ERROR:int;
      
      public var NONE:int;
      
      public var MONO_SOURCES:int;
      
      public var MIN_GAIN:int;
      
      public var MAX_GAIN:int;
      
      public var MAX_DISTANCE:int;
      
      public var LOOPING:int;
      
      public var LINEAR_DISTANCE_CLAMPED:int;
      
      public var LINEAR_DISTANCE:int;
      
      public var INVERSE_DISTANCE_CLAMPED:int;
      
      public var INVERSE_DISTANCE:int;
      
      public var INVALID_VALUE:int;
      
      public var INVALID_OPERATION:int;
      
      public var INVALID_NAME:int;
      
      public var INVALID_ENUM:int;
      
      public var INVALID_DEVICE:int;
      
      public var INVALID_CONTEXT:int;
      
      public var INITIAL:int;
      
      public var GAIN:int;
      
      public var FREQUENCY:int;
      
      public var FORMAT_STEREO8:int;
      
      public var FORMAT_STEREO16:int;
      
      public var FORMAT_MONO8:int;
      
      public var FORMAT_MONO16:int;
      
      public var FALSE:int;
      
      public var EXTENSIONS:int;
      
      public var EXPONENT_DISTANCE_CLAMPED:int;
      
      public var EXPONENT_DISTANCE:int;
      
      public var ENUMERATE_ALL_EXT:int;
      
      public var DOPPLER_VELOCITY:int;
      
      public var DOPPLER_FACTOR:int;
      
      public var DISTANCE_MODEL:int;
      
      public var DIRECTION:int;
      
      public var DEVICE_SPECIFIER:int;
      
      public var DEFAULT_DEVICE_SPECIFIER:int;
      
      public var DEFAULT_ALL_DEVICES_SPECIFIER:int;
      
      public var CONE_OUTER_GAIN:int;
      
      public var CONE_OUTER_ANGLE:int;
      
      public var CONE_INNER_ANGLE:int;
      
      public var CHANNELS:int;
      
      public var BYTE_OFFSET:int;
      
      public var BUFFERS_QUEUED:int;
      
      public var BUFFERS_PROCESSED:int;
      
      public var BUFFER:int;
      
      public var BITS:int;
      
      public var ATTRIBUTES_SIZE:int;
      
      public var ALL_DEVICES_SPECIFIER:int;
      
      public var ALL_ATTRIBUTES:int;
      
      public function OpenALAudioContext()
      {
         if(Boot.skip_constructor)
         {
            return;
         }
         ALL_DEVICES_SPECIFIER = 4115;
         DEFAULT_ALL_DEVICES_SPECIFIER = 4114;
         ENUMERATE_ALL_EXT = 1;
         DEVICE_SPECIFIER = 4101;
         DEFAULT_DEVICE_SPECIFIER = 4100;
         ALL_ATTRIBUTES = 4099;
         ATTRIBUTES_SIZE = 4098;
         INVALID_CONTEXT = 40962;
         INVALID_DEVICE = 40961;
         STEREO_SOURCES = 4113;
         MONO_SOURCES = 4112;
         SYNC = 4105;
         REFRESH = 4104;
         EXPONENT_DISTANCE_CLAMPED = 53254;
         EXPONENT_DISTANCE = 53253;
         LINEAR_DISTANCE_CLAMPED = 53252;
         LINEAR_DISTANCE = 53251;
         INVERSE_DISTANCE_CLAMPED = 53250;
         INVERSE_DISTANCE = 53249;
         DISTANCE_MODEL = 53248;
         DOPPLER_VELOCITY = 49153;
         SPEED_OF_SOUND = 49155;
         DOPPLER_FACTOR = 49152;
         EXTENSIONS = 45060;
         RENDERER = 45059;
         VERSION = 45058;
         VENDOR = 45057;
         OUT_OF_MEMORY = 40965;
         INVALID_OPERATION = 40964;
         INVALID_VALUE = 40963;
         INVALID_ENUM = 40962;
         INVALID_NAME = 40961;
         NO_ERROR = 0;
         SIZE = 8196;
         CHANNELS = 8195;
         BITS = 8194;
         FREQUENCY = 8193;
         FORMAT_STEREO16 = 4355;
         FORMAT_STEREO8 = 4354;
         FORMAT_MONO16 = 4353;
         FORMAT_MONO8 = 4352;
         UNDETERMINED = 4144;
         STREAMING = 4137;
         STATIC = 4136;
         SOURCE_TYPE = 4135;
         BYTE_OFFSET = 4134;
         SAMPLE_OFFSET = 4133;
         SEC_OFFSET = 4132;
         MAX_DISTANCE = 4131;
         CONE_OUTER_GAIN = 4130;
         ROLLOFF_FACTOR = 4129;
         REFERENCE_DISTANCE = 4128;
         BUFFERS_PROCESSED = 4118;
         BUFFERS_QUEUED = 4117;
         STOPPED = 4116;
         PAUSED = 4115;
         PLAYING = 4114;
         INITIAL = 4113;
         SOURCE_STATE = 4112;
         ORIENTATION = 4111;
         MAX_GAIN = 4110;
         MIN_GAIN = 4109;
         GAIN = 4106;
         BUFFER = 4105;
         LOOPING = 4103;
         VELOCITY = 4102;
         DIRECTION = 4101;
         POSITION = 4100;
         PITCH = 4099;
         CONE_OUTER_ANGLE = 4098;
         CONE_INNER_ANGLE = 4097;
         SOURCE_RELATIVE = 514;
         TRUE = 1;
         FALSE = 0;
         NONE = 0;
      }
      
      public function suspendContext(param1:*) : void
      {
         ALC.suspendContext(param1);
      }
      
      public function speedOfSound(param1:Number) : void
      {
         AL.speedOfSound(param1);
      }
      
      public function sourceiv(param1:*, param2:int, param3:Array) : void
      {
         AL.sourceiv(param1,param2,param3);
      }
      
      public function sourcei(param1:*, param2:int, param3:*) : void
      {
         AL.sourcei(param1,param2,param3);
      }
      
      public function sourcefv(param1:*, param2:int, param3:Array) : void
      {
         AL.sourcefv(param1,param2,param3);
      }
      
      public function sourcef(param1:*, param2:int, param3:Number) : void
      {
         AL.sourcef(param1,param2,param3);
      }
      
      public function sourceUnqueueBuffers(param1:*, param2:int) : Array
      {
         return AL.sourceUnqueueBuffers(param1,param2);
      }
      
      public function sourceUnqueueBuffer(param1:*) : *
      {
         return AL.sourceUnqueueBuffer(param1);
      }
      
      public function sourceStopv(param1:Array) : void
      {
         AL.sourceStopv(param1);
      }
      
      public function sourceStop(param1:*) : void
      {
         AL.sourceStop(param1);
      }
      
      public function sourceRewindv(param1:Array) : void
      {
         AL.sourceRewindv(param1);
      }
      
      public function sourceRewind(param1:*) : void
      {
         AL.sourceRewind(param1);
      }
      
      public function sourceQueueBuffers(param1:*, param2:int, param3:Array) : void
      {
         AL.sourceQueueBuffers(param1,param2,param3);
      }
      
      public function sourceQueueBuffer(param1:*, param2:*) : void
      {
         AL.sourceQueueBuffer(param1,param2);
      }
      
      public function sourcePlayv(param1:Array) : void
      {
         AL.sourcePlayv(param1);
      }
      
      public function sourcePlay(param1:*) : void
      {
         AL.sourcePlay(param1);
      }
      
      public function sourcePausev(param1:Array) : void
      {
         AL.sourcePausev(param1);
      }
      
      public function sourcePause(param1:*) : void
      {
         AL.sourcePause(param1);
      }
      
      public function source3i(param1:*, param2:int, param3:int, param4:int, param5:int) : void
      {
         AL.source3i(param1,param2,param3,param4,param5);
      }
      
      public function source3f(param1:*, param2:int, param3:Number, param4:Number, param5:Number) : void
      {
         AL.source3f(param1,param2,param3,param4,param5);
      }
      
      public function resumeDevice(param1:*) : void
      {
         ALC.resumeDevice(param1);
      }
      
      public function processContext(param1:*) : void
      {
         ALC.processContext(param1);
      }
      
      public function pauseDevice(param1:*) : void
      {
         ALC.pauseDevice(param1);
      }
      
      public function openDevice(param1:String = undefined) : *
      {
         return ALC.openDevice(param1);
      }
      
      public function makeContextCurrent(param1:*) : Boolean
      {
         return ALC.makeContextCurrent(param1);
      }
      
      public function listeneriv(param1:int, param2:Array) : void
      {
         AL.listeneriv(param1,param2);
      }
      
      public function listeneri(param1:int, param2:int) : void
      {
         AL.listeneri(param1,param2);
      }
      
      public function listenerfv(param1:int, param2:Array) : void
      {
         AL.listenerfv(param1,param2);
      }
      
      public function listenerf(param1:int, param2:Number) : void
      {
         AL.listenerf(param1,param2);
      }
      
      public function listener3i(param1:int, param2:int, param3:int, param4:int) : void
      {
         AL.listener3i(param1,param2,param3,param4);
      }
      
      public function listener3f(param1:int, param2:Number, param3:Number, param4:Number) : void
      {
         AL.listener3f(param1,param2,param3,param4);
      }
      
      public function isSource(param1:*) : Boolean
      {
         return AL.isSource(param1);
      }
      
      public function isExtensionPresent(param1:String) : Boolean
      {
         return AL.isExtensionPresent(param1);
      }
      
      public function isEnabled(param1:int) : Boolean
      {
         return AL.isEnabled(param1);
      }
      
      public function isBuffer(param1:*) : Boolean
      {
         return AL.isBuffer(param1);
      }
      
      public function getString(param1:int, param2:* = undefined) : String
      {
         if(param2 == null)
         {
            return AL.getString(param1);
         }
         return ALC.getString(param2,param1);
      }
      
      public function getSourceiv(param1:*, param2:int, param3:int = 1) : Array
      {
         return AL.getSourceiv(param1,param2,param3);
      }
      
      public function getSourcei(param1:*, param2:int) : *
      {
         return AL.getSourcei(param1,param2);
      }
      
      public function getSourcefv(param1:*, param2:int, param3:int = 1) : Array
      {
         return AL.getSourcefv(param1,param2);
      }
      
      public function getSourcef(param1:*, param2:int) : Number
      {
         return AL.getSourcef(param1,param2);
      }
      
      public function getSource3i(param1:*, param2:int) : Array
      {
         return AL.getSource3i(param1,param2);
      }
      
      public function getSource3f(param1:*, param2:int) : Array
      {
         return AL.getSource3f(param1,param2);
      }
      
      public function getProcAddress(param1:String) : *
      {
         return AL.getProcAddress(param1);
      }
      
      public function getListeneriv(param1:int, param2:int = 1) : Array
      {
         return AL.getListeneriv(param1,param2);
      }
      
      public function getListeneri(param1:int) : int
      {
         return AL.getListeneri(param1);
      }
      
      public function getListenerfv(param1:int, param2:int = 1) : Array
      {
         return AL.getListenerfv(param1,param2);
      }
      
      public function getListenerf(param1:int) : Number
      {
         return AL.getListenerf(param1);
      }
      
      public function getListener3i(param1:int) : Array
      {
         return AL.getListener3i(param1);
      }
      
      public function getListener3f(param1:int) : Array
      {
         return AL.getListener3f(param1);
      }
      
      public function getIntegerv(param1:int, param2:int = 1, param3:* = undefined) : Array
      {
         if(param3 == null)
         {
            return AL.getIntegerv(param1,param2);
         }
         return ALC.getIntegerv(param3,param1,param2);
      }
      
      public function getInteger(param1:int) : int
      {
         return AL.getInteger(param1);
      }
      
      public function getFloatv(param1:int, param2:int = 1) : Array
      {
         return AL.getFloatv(param1,param2);
      }
      
      public function getFloat(param1:int) : Number
      {
         return AL.getFloat(param1);
      }
      
      public function getErrorString(param1:* = undefined) : String
      {
         if(param1 == null)
         {
            return AL.getErrorString();
         }
         return ALC.getErrorString(param1);
      }
      
      public function getError(param1:* = undefined) : int
      {
         if(param1 == null)
         {
            return AL.getError();
         }
         return ALC.getError(param1);
      }
      
      public function getEnumValue(param1:String) : int
      {
         return AL.getEnumValue(param1);
      }
      
      public function getDoublev(param1:int, param2:int = 1) : Array
      {
         return AL.getDoublev(param1,param2);
      }
      
      public function getDouble(param1:int) : Number
      {
         return AL.getDouble(param1);
      }
      
      public function getCurrentContext() : *
      {
         return ALC.getCurrentContext();
      }
      
      public function getContextsDevice(param1:*) : *
      {
         if(param1 == null)
         {
            return null;
         }
         return ALC.getContextsDevice(param1);
      }
      
      public function getBufferiv(param1:*, param2:int, param3:int = 1) : Array
      {
         return AL.getBufferiv(param1,param2,param3);
      }
      
      public function getBufferi(param1:*, param2:int) : int
      {
         return AL.getBufferi(param1,param2);
      }
      
      public function getBufferfv(param1:*, param2:int, param3:int = 1) : Array
      {
         return AL.getBufferfv(param1,param2,param3);
      }
      
      public function getBufferf(param1:*, param2:int) : Number
      {
         return AL.getBufferf(param1,param2);
      }
      
      public function getBuffer3i(param1:*, param2:int) : Array
      {
         return AL.getBuffer3i(param1,param2);
      }
      
      public function getBuffer3f(param1:*, param2:int) : Array
      {
         return AL.getBuffer3f(param1,param2);
      }
      
      public function getBooleanv(param1:int, param2:int = 1) : Array
      {
         return AL.getBooleanv(param1,param2);
      }
      
      public function getBoolean(param1:int) : Boolean
      {
         return AL.getBoolean(param1);
      }
      
      public function genSources(param1:int) : Array
      {
         return AL.genSources(param1);
      }
      
      public function genSource() : *
      {
         return createSource();
      }
      
      public function genBuffers(param1:int) : Array
      {
         return AL.genBuffers(param1);
      }
      
      public function genBuffer() : *
      {
         return createBuffer();
      }
      
      public function enable(param1:int) : void
      {
         AL.enable(param1);
      }
      
      public function dopplerVelocity(param1:Number) : void
      {
         AL.dopplerVelocity(param1);
      }
      
      public function dopplerFactor(param1:Number) : void
      {
         AL.dopplerFactor(param1);
      }
      
      public function distanceModel(param1:int) : void
      {
         AL.distanceModel(param1);
      }
      
      public function disable(param1:int) : void
      {
         AL.disable(param1);
      }
      
      public function destroyContext(param1:*) : void
      {
         if(param1 == null)
         {
            return;
         }
         ALC.destroyContext(param1);
      }
      
      public function deleteSources(param1:Array) : void
      {
         AL.deleteSources(param1);
      }
      
      public function deleteSource(param1:*) : void
      {
         AL.deleteSource(param1);
      }
      
      public function deleteBuffers(param1:Array) : void
      {
         AL.deleteBuffers(param1);
      }
      
      public function deleteBuffer(param1:*) : void
      {
         AL.deleteBuffer(param1);
      }
      
      public function createSource() : *
      {
         return AL.createSource();
      }
      
      public function createContext(param1:*, param2:Array = undefined) : *
      {
         return ALC.createContext(param1,param2);
      }
      
      public function createBuffer() : *
      {
         return AL.createBuffer();
      }
      
      public function closeDevice(param1:*) : Boolean
      {
         return ALC.closeDevice(param1);
      }
      
      public function bufferiv(param1:*, param2:int, param3:Array) : void
      {
         AL.bufferiv(param1,param2,param3);
      }
      
      public function bufferi(param1:*, param2:int, param3:int) : void
      {
         AL.bufferi(param1,param2,param3);
      }
      
      public function bufferfv(param1:*, param2:int, param3:Array) : void
      {
         AL.bufferfv(param1,param2,param3);
      }
      
      public function bufferf(param1:*, param2:int, param3:Number) : void
      {
         AL.bufferf(param1,param2,param3);
      }
      
      public function bufferData(param1:*, param2:int, param3:ArrayBufferView, param4:int, param5:int) : void
      {
         AL.bufferData(param1,param2,param3,param4,param5);
      }
      
      public function buffer3i(param1:*, param2:int, param3:int, param4:int, param5:int) : void
      {
         AL.buffer3i(param1,param2,param3,param4,param5);
      }
      
      public function buffer3f(param1:*, param2:int, param3:Number, param4:Number, param5:Number) : void
      {
         AL.buffer3f(param1,param2,param3,param4,param5);
      }
   }
}

