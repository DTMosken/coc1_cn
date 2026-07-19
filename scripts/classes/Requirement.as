package classes
{
   import flash.Boot;
   
   public class Requirement
   {
      
      public var type:RequirementType;
      
      public var text:String;
      
      public var fn:Function;
      
      public function Requirement(param1:Function = undefined, param2:String = undefined, param3:RequirementType = undefined)
      {
         if(Boot.skip_constructor)
         {
            return;
         }
         fn = param1;
         text = param2;
         type = param3;
      }
   }
}

