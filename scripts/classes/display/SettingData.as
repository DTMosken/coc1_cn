package classes.display
{
   import classes.display._SettingData.OptionData;
   import flash.Boot;
   
   public class SettingData
   {
      
      public var name:String;
      
      public var labelOverridden:Boolean;
      
      public var currentValue:String;
      
      public var _options:Array;
      
      public var _label:String;
      
      public var _defaultLabel:String;
      
      public function SettingData(param1:String = undefined, param2:Array = undefined)
      {
         var _loc4_:* = null as SettingParams;
         var _loc5_:* = null as OptionData;
         if(Boot.skip_constructor)
         {
            return;
         }
         _defaultLabel = "";
         labelOverridden = false;
         name = param1;
         _options = [];
         var _loc3_:int = 0;
         while(_loc3_ < int(param2.length))
         {
            _loc4_ = param2[_loc3_];
            _loc3_++;
            _loc5_ = new OptionData(_loc4_);
            _options.push(_loc5_);
            if(_loc5_.isSet)
            {
               _label = _loc5_.description;
               currentValue = _loc5_.name;
            }
            if(_loc4_.overridesLabel)
            {
               _defaultLabel = _loc5_.description;
               labelOverridden = true;
            }
         }
      }
      
      public function get_label() : String
      {
         if(_label == null)
         {
            return _defaultLabel;
         }
         return _label;
      }
      
      public function get_buttons() : Array
      {
         var _loc4_:* = null as OptionData;
         var _loc1_:Array = [];
         var _loc2_:int = 0;
         var _loc3_:Array = _options;
         while(_loc2_ < int(_loc3_.length))
         {
            _loc4_ = _loc3_[_loc2_];
            _loc2_++;
            _loc1_.push(_loc4_.buttonData);
         }
         return _loc1_;
      }
   }
}

