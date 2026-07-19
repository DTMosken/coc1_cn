package coc.view.selfDebug._DebugComp
{
   import coc.view.selfDebug.ArrayComponent_Int;
   import coc.view.selfDebug.BoolComponent;
   import coc.view.selfDebug.Component;
   import coc.view.selfDebug.FloatComponent;
   import coc.view.selfDebug.IntComponent;
   import coc.view.selfDebug.StringComponent;
   
   public final class ActualComponent_Impl_
   {
      
      public function ActualComponent_Impl_()
      {
      }
      
      public static function toBool(param1:Component, param2:Boolean, param3:Function) : BoolComponent
      {
         return new BoolComponent(param2,param3);
      }
      
      public static function toString(param1:Component, param2:String, param3:Function) : StringComponent
      {
         return new StringComponent(param2,param3);
      }
      
      public static function toInt(param1:Component, param2:int, param3:Function) : IntComponent
      {
         return new IntComponent(param2,param3);
      }
      
      public static function toFloat(param1:Component, param2:Number, param3:Function) : FloatComponent
      {
         return new FloatComponent(param2,param3);
      }
      
      public static function toIntArray(param1:Component, param2:Array, param3:Function) : ArrayComponent_Int
      {
         return new ArrayComponent_Int(param2,param3);
      }
   }
}

