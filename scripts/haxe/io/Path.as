package haxe.io
{
   import flash.Boot;
   
   public class Path
   {
      
      public var file:String;
      
      public var ext:String;
      
      public var dir:String;
      
      public var backslash:Boolean;
      
      public function Path(param1:String = undefined)
      {
         if(Boot.skip_constructor)
         {
            return;
         }
         var _loc2_:String = param1;
         if(_loc2_ != ".")
         {
            if(_loc2_ != "..")
            {
               var _loc3_:int = param1.lastIndexOf("/");
               var _loc4_:int = param1.lastIndexOf("\\");
               if(_loc3_ < _loc4_)
               {
                  dir = param1.substr(0,_loc4_);
                  param1 = param1.substr(_loc4_ + 1);
                  backslash = true;
               }
               else if(_loc4_ < _loc3_)
               {
                  dir = param1.substr(0,_loc3_);
                  param1 = param1.substr(_loc3_ + 1);
               }
               else
               {
                  dir = null;
               }
               var _loc5_:int = param1.lastIndexOf(".");
               if(_loc5_ != -1)
               {
                  ext = param1.substr(_loc5_ + 1);
                  file = param1.substr(0,_loc5_);
               }
               else
               {
                  ext = null;
                  file = param1;
               }
               return;
            }
         }
         dir = param1;
         file = "";
      }
      
      public static function directory(param1:String) : String
      {
         var _loc2_:Path = new Path(param1);
         if(_loc2_.dir == null)
         {
            return "";
         }
         return _loc2_.dir;
      }
      
      public static function extension(param1:String) : String
      {
         var _loc2_:Path = new Path(param1);
         if(_loc2_.ext == null)
         {
            return "";
         }
         return _loc2_.ext;
      }
   }
}

