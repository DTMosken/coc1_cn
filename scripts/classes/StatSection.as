package classes
{
   import classes.globalFlags.KGAMECLASS;
   import classes.internals.Utils;
   import flash.Boot;
   
   public class StatSection
   {
      
      public var stats:Array;
      
      public var header:String;
      
      public function StatSection(param1:String = undefined)
      {
         if(Boot.skip_constructor)
         {
            return;
         }
         stats = [];
         header = param1;
      }
      
      public function display() : void
      {
         var _loc3_:* = null as Stat;
         if(int(stats.length) == 0)
         {
            return;
         }
         KGAMECLASS.kGAMECLASS.outputText("[pg-][bu:" + header + "]");
         var _loc1_:int = 0;
         var _loc2_:Array = stats;
         while(_loc1_ < int(_loc2_.length))
         {
            _loc3_ = _loc2_[_loc1_];
            _loc1_++;
            KGAMECLASS.kGAMECLASS.outputText("[pg-][b:" + _loc3_.title + ":] " + _loc3_.get_display());
         }
         KGAMECLASS.kGAMECLASS.outputText("[pg]");
      }
      
      public function addStat(param1:String, param2:*, param3:Boolean = true) : void
      {
         var _loc4_:Stat = new Stat(Utils.cnName(param1),null,param3,"" + (param2 == null ? "null" : Std.string(param2)));
         add(_loc4_);
      }
      
      public function add(param1:Stat) : void
      {
         if(param1.get_condition())
         {
            stats.push(param1);
         }
      }
   }
}

