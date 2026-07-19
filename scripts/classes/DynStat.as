package classes
{
   import flash.Boot;
   
   public final class DynStat
   {
      
      public static const __isenum:Boolean = true;
      
      public static var IgnoreMax:DynStat = new DynStat("IgnoreMax",9,null);
      
      public static var NoScale:DynStat = new DynStat("NoScale",8,null);
      
      public static var __constructs__:Array = ["Str","Tou","Spe","Inte","Lib","Sens","Lust","Cor","NoScale","IgnoreMax"];
      
      public var tag:String;
      
      public var index:int;
      
      public var params:Array;
      
      public const __enum__:Boolean = true;
      
      public function DynStat(param1:String, param2:int, param3:Array)
      {
         tag = param1;
         index = param2;
         params = param3;
      }
      
      public static function Cor(param1:Number, param2:DynStatOp = undefined) : DynStat
      {
         return new DynStat("Cor",7,[param1,param2]);
      }
      
      public static function Inte(param1:Number, param2:DynStatOp = undefined) : DynStat
      {
         return new DynStat("Inte",3,[param1,param2]);
      }
      
      public static function Lib(param1:Number, param2:DynStatOp = undefined) : DynStat
      {
         return new DynStat("Lib",4,[param1,param2]);
      }
      
      public static function Lust(param1:Number, param2:DynStatOp = undefined) : DynStat
      {
         return new DynStat("Lust",6,[param1,param2]);
      }
      
      public static function Sens(param1:Number, param2:DynStatOp = undefined) : DynStat
      {
         return new DynStat("Sens",5,[param1,param2]);
      }
      
      public static function Spe(param1:Number, param2:DynStatOp = undefined) : DynStat
      {
         return new DynStat("Spe",2,[param1,param2]);
      }
      
      public static function Str(param1:Number, param2:DynStatOp = undefined) : DynStat
      {
         return new DynStat("Str",0,[param1,param2]);
      }
      
      public static function Tou(param1:Number, param2:DynStatOp = undefined) : DynStat
      {
         return new DynStat("Tou",1,[param1,param2]);
      }
      
      final public function toString() : String
      {
         return Boot.enum_to_string(this);
      }
   }
}

