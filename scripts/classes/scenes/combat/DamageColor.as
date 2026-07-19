package classes.scenes.combat
{
   import flash.Boot;
   
   public final class DamageColor
   {
      
      public static const __isenum:Boolean = true;
      
      public static var Damage:DamageColor = new DamageColor("Damage",0,null);
      
      public static var Heal:DamageColor = new DamageColor("Heal",1,null);
      
      public static var Lust:DamageColor = new DamageColor("Lust",2,null);
      
      public static var __constructs__:Array = ["Damage","Heal","Lust"];
      
      public var tag:String;
      
      public var index:int;
      
      public var params:Array;
      
      public const __enum__:Boolean = true;
      
      public function DamageColor(param1:String, param2:int, param3:Array)
      {
         tag = param1;
         index = param2;
         params = param3;
      }
      
      final public function toString() : String
      {
         return Boot.enum_to_string(this);
      }
   }
}

