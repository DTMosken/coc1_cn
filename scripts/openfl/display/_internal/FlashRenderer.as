package openfl.display._internal
{
   import flash.display.MovieClip;
   import flash.events.Event;
   import flash.utils.Dictionary;
   import openfl.Lib;
   import openfl.utils._Dictionary.Dictionary_Impl_;
   
   public class FlashRenderer
   {
      
      public static var instances:Dictionary;
      
      public static var __meta__:* = {"obj":{"SuppressWarnings":["checkstyle:FieldDocComment"]}};
      
      public function FlashRenderer()
      {
      }
      
      public static function register(param1:IDisplayObject) : void
      {
         if(FlashRenderer.instances == null)
         {
            FlashRenderer.instances = Dictionary_Impl_._new(true);
            Lib.get_current().stage.addEventListener(Event.ENTER_FRAME,FlashRenderer.render,false,-2147483648);
         }
         FlashRenderer.instances[param1] = true;
      }
      
      public static function render(param1:*) : void
      {
         var _loc7_:* = null as IDisplayObject;
         var _loc2_:Dictionary = FlashRenderer.instances;
         var _loc5_:* = 0;
         var _loc4_:Array = [];
         var _loc6_:* = _loc2_;
         for(_loc5_ in _loc6_)
         {
            _loc4_.push(_loc5_);
         }
         var _loc3_:* = _loc4_.iterator();
         while(Boolean(_loc3_.hasNext()))
         {
            _loc7_ = _loc3_.next();
            _loc7_.__renderFlash();
         }
      }
   }
}

