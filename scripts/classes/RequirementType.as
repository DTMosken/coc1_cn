package classes
{
   import flash.Boot;
   
   public final class RequirementType
   {
      
      public static const __isenum:Boolean = true;
      
      public static var __constructs__:Array = ["Perk","Anyperk","Status","Other"];
      
      public var tag:String;
      
      public var index:int;
      
      public var params:Array;
      
      public const __enum__:Boolean = true;
      
      public function RequirementType(param1:String, param2:int, param3:Array)
      {
         tag = param1;
         index = param2;
         params = param3;
      }
      
      public static function Anyperk(param1:Array) : RequirementType
      {
         return new RequirementType("Anyperk",1,[param1]);
      }
      
      public static function Other(param1:String) : RequirementType
      {
         return new RequirementType("Other",3,[param1]);
      }
      
      public static function Perk(param1:PerkType) : RequirementType
      {
         return new RequirementType("Perk",0,[param1]);
      }
      
      public static function Status(param1:StatusEffectType) : RequirementType
      {
         return new RequirementType("Status",2,[param1]);
      }
      
      final public function toString() : String
      {
         return Boot.enum_to_string(this);
      }
   }
}

