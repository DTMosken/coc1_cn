package classes
{
   public class CoC_Settings
   {
      
      public static var debugBuild:Boolean = false;
      
      public static var haltOnErrors:Boolean = false;
      
      public static var bufferSize:int = 50;
      
      public function CoC_Settings()
      {
      }
      
      public static function error(param1:String = undefined) : void
      {
         if(param1 == null)
         {
            param1 = "";
         }
      }
      
      public static function errorAMC(param1:String, param2:String, param3:String = undefined) : void
      {
         if(param3 == null)
         {
            param3 = "";
         }
         CoC_Settings.error("抽象方法调用：" + param1 + "." + param2 + "()。" + param3);
      }
   }
}

