package haxe.exceptions
{
   import flash.Boot;
   import haxe.Exception;
   
   public class PosException extends Exception
   {
      
      public var posInfos:Object;
      
      public function PosException(param1:String = undefined, param2:Exception = undefined, param3:Object = undefined)
      {
         if(Boot.skip_constructor)
         {
            return;
         }
         super(param1,param2);
         if(param3 == null)
         {
            posInfos = {
               "fileName":"(unknown)",
               "lineNumber":0,
               "className":"(unknown)",
               "methodName":"(unknown)"
            };
         }
         else
         {
            posInfos = param3;
         }
         ++__skipStack;
      }
      
      override public function toString() : String
      {
         return "" + super.toString() + " in " + posInfos.className + "." + posInfos.methodName + " at " + posInfos.fileName + ":" + int(posInfos.lineNumber);
      }
   }
}

