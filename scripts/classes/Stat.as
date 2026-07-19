package classes
{
   import flash.Boot;
   
   public class Stat
   {
      
      public var title:String;
      
      public var display:String;
      
      public var count:Number;
      
      public var condition:Boolean;
      
      public function Stat(param1:String = undefined, param2:Object = undefined, param3:Object = undefined, param4:String = undefined)
      {
         if(Boot.skip_constructor)
         {
            return;
         }
         display = "";
         condition = false;
         count = 0;
         title = param1;
         if(param2 != null)
         {
            count = param2;
         }
         if(param3 != null)
         {
            condition = param3;
         }
         if(param4 != null)
         {
            display = param4;
         }
      }
      
      public function get_display() : String
      {
         if(display.length == 0)
         {
            return "" + count;
         }
         return display;
      }
      
      public function get_condition() : Boolean
      {
         if(!condition)
         {
            return count > 0;
         }
         return true;
      }
   }
}

