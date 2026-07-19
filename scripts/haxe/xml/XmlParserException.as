package haxe.xml
{
   import flash.Boot;
   
   public class XmlParserException
   {
      
      public var xml:String;
      
      public var positionAtLine:int;
      
      public var position:int;
      
      public var message:String;
      
      public var lineNumber:int;
      
      public function XmlParserException(param1:String = undefined, param2:String = undefined, param3:int = 0)
      {
         var _loc6_:int = 0;
         var _loc7_:int = 0;
         if(Boot.skip_constructor)
         {
            return;
         }
         xml = param2;
         message = param1;
         position = param3;
         lineNumber = 1;
         positionAtLine = 0;
         var _loc4_:int = 0;
         var _loc5_:int = param3;
         while(_loc4_ < _loc5_)
         {
            _loc6_ = _loc4_++;
            _loc7_ = int(param2.charCodeAt(_loc6_));
            if(_loc7_ == 10)
            {
               ++lineNumber;
               positionAtLine = 0;
            }
            else if(_loc7_ != 13)
            {
               ++positionAtLine;
            }
         }
      }
      
      public function toString() : String
      {
         return Type.getClassName(Type.getClass(this)) + ": " + message + " at line " + lineNumber + " char " + positionAtLine;
      }
   }
}

