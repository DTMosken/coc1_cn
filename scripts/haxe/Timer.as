package haxe
{
   import flash.Boot;
   import flash.utils.clearInterval;
   import flash.utils.getTimer;
   import flash.utils.setInterval;
   
   public class Timer
   {
      
      public var run:Function;
      
      public var id:Object;
      
      public function Timer(param1:int = 0)
      {
         var me:Timer;
         if(Boot.skip_constructor)
         {
            return;
         }
         if(!run)
         {
            run = function():void
            {
            };
         }
         me = this;
         id = setInterval(function():void
         {
            me.run();
         },param1);
      }
      
      public static function delay(param1:Function, param2:int) : Timer
      {
         var f:Function = param1;
         var t:Timer = new Timer(param2);
         t.run = function():void
         {
            t.stop();
            f();
         };
         return t;
      }
      
      public static function measure(param1:Function, param2:Object = undefined) : Object
      {
         var _loc3_:Number = getTimer() / 1000;
         var _loc4_:Object = param1();
         Log.trace(getTimer() / 1000 - _loc3_ + "s",param2);
         return _loc4_;
      }
      
      public static function stamp() : Number
      {
         return getTimer() / 1000;
      }
      
      public function stop() : void
      {
         if(id == null)
         {
            return;
         }
         clearInterval(id);
         id = null;
      }
   }
}

