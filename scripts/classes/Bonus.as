package classes
{
   import flash.Boot;
   
   public class Bonus
   {
      
      public var visible:Boolean;
      
      public var value:Function;
      
      public var key:String;
      
      public function Bonus(param1:Function = undefined, param2:String = undefined, param3:Boolean = false)
      {
         if(Boot.skip_constructor)
         {
            return;
         }
         value = param1;
         key = param2;
         visible = param3;
      }
   }
}

