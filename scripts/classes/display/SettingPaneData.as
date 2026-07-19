package classes.display
{
   import flash.Boot;
   import haxe.IMap;
   
   public class SettingPaneData
   {
      
      public var title:String;
      
      public var settings:Array;
      
      public var name:String;
      
      public var description:String;
      
      public var buttonName:String;
      
      public function SettingPaneData(param1:Array = undefined, param2:IMap = undefined)
      {
         var _loc11_:* = null;
         var _loc12_:int = 0;
         var _loc13_:Boolean = false;
         var _loc14_:* = null as Setting;
         var _loc15_:* = null as Setting;
         if(Boot.skip_constructor)
         {
            return;
         }
         name = param1[0];
         buttonName = param1[1];
         title = param1[2];
         description = param1[3];
         var _loc3_:Array = [];
         var _loc4_:* = param2.h;
         var _loc5_:* = param2.rh;
         var _loc6_:int = 0;
         var _loc7_:* = _loc4_;
         var _loc8_:int = _loc6_;
         var _loc9_:Boolean = §§hasnext(_loc7_,_loc8_);
         if(!_loc9_ && _loc5_ != null)
         {
            _loc4_ = _loc5_;
            _loc7_ = _loc4_;
            _loc6_ = 0;
            _loc8_ = _loc6_;
            _loc5_ = null;
            _loc9_ = §§hasnext(_loc7_,_loc8_);
         }
         var _loc10_:int = _loc8_;
         while(true)
         {
            _loc11_ = _loc4_;
            _loc12_ = _loc6_;
            _loc13_ = §§hasnext(_loc11_,_loc12_);
            if(!_loc13_ && _loc5_ != null)
            {
               _loc4_ = _loc5_;
               _loc11_ = _loc4_;
               _loc6_ = 0;
               _loc12_ = _loc6_;
               _loc5_ = null;
               _loc13_ = §§hasnext(_loc11_,_loc12_);
            }
            _loc10_ = _loc12_;
            if(!_loc13_)
            {
               break;
            }
            _loc14_ = §§nextvalue(_loc10_,_loc4_);
            _loc6_ = _loc10_;
            _loc15_ = _loc14_;
            _loc3_.push(new SettingData(_loc15_.label,_loc15_.options));
         }
         settings = _loc3_;
      }
   }
}

