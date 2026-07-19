package motion.actuators
{
   import flash.Boot;
   import flash.display.DisplayObject;
   import flash.geom.ColorTransform;
   import flash.geom.Transform;
   import flash.media.SoundTransform;
   
   public class TransformActuator extends SimpleActuator
   {
      
      public var tweenSoundTransform:SoundTransform;
      
      public var tweenColorTransform:ColorTransform;
      
      public var endSoundTransform:SoundTransform;
      
      public var endColorTransform:ColorTransform;
      
      public function TransformActuator(param1:Object = undefined, param2:Number = 0, param3:* = undefined)
      {
         if(Boot.skip_constructor)
         {
            return;
         }
         super(param1,param2,param3);
      }
      
      override public function update(param1:Number) : void
      {
         var _loc2_:* = null as Object;
         var _loc3_:* = null as Object;
         var _loc4_:* = null as Transform;
         var _loc5_:* = null;
         super.update(param1);
         if(endColorTransform != null)
         {
            _loc2_ = target;
            _loc3_ = null;
            if(Reflect.hasField(_loc2_,"transform"))
            {
               _loc3_ = _loc2_["transform"];
            }
            else
            {
               _loc3_ = Reflect.getProperty(_loc2_,"transform");
            }
            _loc4_ = _loc3_;
            _loc5_ = tweenColorTransform;
            if(Reflect.hasField(_loc4_,"colorTransform") && !_loc4_.hasOwnProperty("set_" + "colorTransform"))
            {
               _loc4_["colorTransform"] = _loc5_;
            }
            else
            {
               Reflect.setProperty(_loc4_,"colorTransform",_loc5_);
            }
         }
         if(endSoundTransform != null)
         {
            _loc2_ = target;
            _loc5_ = tweenSoundTransform;
            if(Reflect.hasField(_loc2_,"soundTransform") && !_loc2_.hasOwnProperty("set_" + "soundTransform"))
            {
               _loc2_["soundTransform"] = _loc5_;
            }
            else
            {
               Reflect.setProperty(_loc2_,"soundTransform",_loc5_);
            }
         }
      }
      
      public function initializeSound() : void
      {
         var _loc3_:* = null as Object;
         var _loc4_:* = null;
         var _loc1_:Object = target;
         var _loc2_:Object = null;
         if(Reflect.hasField(_loc1_,"soundTransform"))
         {
            _loc2_ = _loc1_["soundTransform"];
         }
         else
         {
            _loc2_ = Reflect.getProperty(_loc1_,"soundTransform");
         }
         if(_loc2_ == null)
         {
            _loc3_ = target;
            _loc4_ = new SoundTransform();
            if(Reflect.hasField(_loc3_,"soundTransform") && !_loc3_.hasOwnProperty("set_" + "soundTransform"))
            {
               _loc3_["soundTransform"] = _loc4_;
            }
            else
            {
               Reflect.setProperty(_loc3_,"soundTransform",_loc4_);
            }
         }
         _loc3_ = target;
         var _loc5_:Object = null;
         if(Reflect.hasField(_loc3_,"soundTransform"))
         {
            _loc5_ = _loc3_["soundTransform"];
         }
         else
         {
            _loc5_ = Reflect.getProperty(_loc3_,"soundTransform");
         }
         var _loc6_:SoundTransform = _loc5_;
         var _loc7_:Object = target;
         var _loc8_:Object = null;
         if(Reflect.hasField(_loc7_,"soundTransform"))
         {
            _loc8_ = _loc7_["soundTransform"];
         }
         else
         {
            _loc8_ = Reflect.getProperty(_loc7_,"soundTransform");
         }
         endSoundTransform = _loc8_;
         tweenSoundTransform = new SoundTransform();
         if(Reflect.hasField(properties,"soundVolume"))
         {
            endSoundTransform.volume = properties.soundVolume;
            propertyDetails.push(new PropertyDetails(tweenSoundTransform,"volume",_loc6_.volume,endSoundTransform.volume - _loc6_.volume));
         }
         if(Reflect.hasField(properties,"soundPan"))
         {
            endSoundTransform.pan = properties.soundPan;
            propertyDetails.push(new PropertyDetails(tweenSoundTransform,"pan",_loc6_.pan,endSoundTransform.pan - _loc6_.pan));
         }
      }
      
      public function initializeColor() : void
      {
         var _loc3_:Number = NaN;
         var _loc4_:Number = NaN;
         var _loc6_:* = null as Object;
         var _loc7_:* = null as Object;
         var _loc11_:* = null as PropertyDetails;
         var _loc13_:* = null as String;
         var _loc14_:* = null as Object;
         var _loc15_:* = null as ColorTransform;
         var _loc16_:* = null as ColorTransform;
         var _loc17_:* = null as Object;
         endColorTransform = new ColorTransform();
         var _loc1_:int = properties.colorValue;
         var _loc2_:Number = properties.colorStrength;
         if(_loc2_ < 1)
         {
            if(_loc2_ < 0.5)
            {
               _loc3_ = 1;
               _loc4_ = _loc2_ * 2;
            }
            else
            {
               _loc3_ = 1 - (_loc2_ - 0.5) * 2;
               _loc4_ = 1;
            }
            endColorTransform.redMultiplier = _loc3_;
            endColorTransform.greenMultiplier = _loc3_;
            endColorTransform.blueMultiplier = _loc3_;
            endColorTransform.redOffset = _loc4_ * (_loc1_ >> 16 & 0xFF);
            endColorTransform.greenOffset = _loc4_ * (_loc1_ >> 8 & 0xFF);
            endColorTransform.blueOffset = _loc4_ * (_loc1_ & 0xFF);
         }
         else
         {
            endColorTransform.redMultiplier = 0;
            endColorTransform.greenMultiplier = 0;
            endColorTransform.blueMultiplier = 0;
            endColorTransform.redOffset = _loc1_ >> 16 & 0xFF;
            endColorTransform.greenOffset = _loc1_ >> 8 & 0xFF;
            endColorTransform.blueOffset = _loc1_ & 0xFF;
         }
         var _loc5_:Array = ["redMultiplier","greenMultiplier","blueMultiplier","redOffset","greenOffset","blueOffset"];
         if(Reflect.hasField(properties,"colorAlpha"))
         {
            endColorTransform.alphaMultiplier = properties.colorAlpha;
            _loc5_.push("alphaMultiplier");
         }
         else
         {
            _loc6_ = target;
            _loc7_ = null;
            if(Reflect.hasField(_loc6_,"alpha"))
            {
               _loc7_ = _loc6_["alpha"];
            }
            else
            {
               _loc7_ = Reflect.getProperty(_loc6_,"alpha");
            }
            endColorTransform.alphaMultiplier = _loc7_;
         }
         _loc6_ = target;
         _loc7_ = null;
         if(Reflect.hasField(_loc6_,"transform"))
         {
            _loc7_ = _loc6_["transform"];
         }
         else
         {
            _loc7_ = Reflect.getProperty(_loc6_,"transform");
         }
         var _loc8_:Transform = _loc7_;
         var _loc9_:Object = null;
         if(Reflect.hasField(_loc8_,"colorTransform"))
         {
            _loc9_ = _loc8_["colorTransform"];
         }
         else
         {
            _loc9_ = Reflect.getProperty(_loc8_,"colorTransform");
         }
         var _loc10_:ColorTransform = _loc9_;
         tweenColorTransform = new ColorTransform();
         var _loc12_:int = 0;
         while(_loc12_ < int(_loc5_.length))
         {
            _loc13_ = _loc5_[_loc12_];
            _loc12_++;
            _loc14_ = null;
            if(Reflect.hasField(_loc10_,_loc13_))
            {
               _loc14_ = _loc10_[_loc13_];
            }
            else
            {
               _loc14_ = Reflect.getProperty(_loc10_,_loc13_);
            }
            _loc3_ = _loc14_;
            _loc15_ = tweenColorTransform;
            _loc16_ = endColorTransform;
            _loc17_ = null;
            if(Reflect.hasField(_loc16_,_loc13_))
            {
               _loc17_ = _loc16_[_loc13_];
            }
            else
            {
               _loc17_ = Reflect.getProperty(_loc16_,_loc13_);
            }
            _loc11_ = new PropertyDetails(_loc15_,_loc13_,_loc3_,_loc17_ - _loc3_);
            propertyDetails.push(_loc11_);
         }
      }
      
      override public function initialize() : void
      {
         if(Reflect.hasField(properties,"colorValue") && target is DisplayObject)
         {
            initializeColor();
         }
         if(Reflect.hasField(properties,"soundVolume") || Reflect.hasField(properties,"soundPan"))
         {
            initializeSound();
         }
         detailsLength = int(propertyDetails.length);
         initialized = true;
      }
      
      override public function apply() : void
      {
         var _loc1_:* = null as Object;
         var _loc2_:* = null as Object;
         var _loc3_:* = null as Transform;
         var _loc4_:* = null;
         initialize();
         if(endColorTransform != null)
         {
            _loc1_ = target;
            _loc2_ = null;
            if(Reflect.hasField(_loc1_,"transform"))
            {
               _loc2_ = _loc1_["transform"];
            }
            else
            {
               _loc2_ = Reflect.getProperty(_loc1_,"transform");
            }
            _loc3_ = _loc2_;
            _loc4_ = endColorTransform;
            if(Reflect.hasField(_loc3_,"colorTransform") && !_loc3_.hasOwnProperty("set_" + "colorTransform"))
            {
               _loc3_["colorTransform"] = _loc4_;
            }
            else
            {
               Reflect.setProperty(_loc3_,"colorTransform",_loc4_);
            }
         }
         if(endSoundTransform != null)
         {
            _loc1_ = target;
            _loc4_ = endSoundTransform;
            if(Reflect.hasField(_loc1_,"soundTransform") && !_loc1_.hasOwnProperty("set_" + "soundTransform"))
            {
               _loc1_["soundTransform"] = _loc4_;
            }
            else
            {
               Reflect.setProperty(_loc1_,"soundTransform",_loc4_);
            }
         }
      }
   }
}

