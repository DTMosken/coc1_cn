package classes.scenes.combat
{
   import classes.globalFlags.KGAMECLASS;
   import classes.internals.Utils;
   import flash.Boot;
   
   public class DamageRange
   {
      
      public var minimum:int;
      
      public var maximum:int;
      
      public var combat:int;
      
      public function DamageRange(param1:Object = undefined, param2:Object = undefined, param3:Object = undefined)
      {
         if(Boot.skip_constructor)
         {
            return;
         }
         combat = 0;
         maximum = 0;
         minimum = 0;
         if(param1 != null)
         {
            minimum = param1;
         }
         if(param2 != null)
         {
            maximum = param2;
         }
         if(param3 != null)
         {
            combat = param3;
         }
      }
      
      public function fancifyLust(param1:Object = undefined, param2:Array = undefined) : String
      {
         return buildFancyString(KGAMECLASS.kGAMECLASS.mainViewManager.colorLustPlus(),param1,param2);
      }
      
      public function fancifyHeal(param1:Object = undefined, param2:Array = undefined) : String
      {
         return buildFancyString(KGAMECLASS.kGAMECLASS.mainViewManager.colorHpPlus(),param1,param2);
      }
      
      public function fancify(param1:Object = undefined, param2:Array = undefined) : String
      {
         return buildFancyString(KGAMECLASS.kGAMECLASS.mainViewManager.colorHpMinus(),param1,param2);
      }
      
      public function buildFancyString(param1:String, param2:Object = undefined, param3:Array = undefined) : String
      {
         var _loc5_:* = null as Array;
         var _loc6_:int = 0;
         var _loc7_:Number = NaN;
         var _loc4_:String = "[b:(<font color=\"" + param1 + "\">" + minimum + (maximum == 0 || maximum == minimum ? "" : "-" + maximum) + "</font>)]";
         if(param3 != null)
         {
            _loc4_ += " (";
            _loc5_ = [];
            _loc6_ = 0;
            while(_loc6_ < int(param3.length))
            {
               _loc7_ = Number(param3[_loc6_]);
               _loc6_++;
               _loc5_.push(Utils.boundInt(0,int(Math.round(_loc7_)),100));
            }
            param3 = _loc5_;
            _loc4_ += param3.join("/");
            _loc4_ += "%)";
         }
         else if(param2 != null)
         {
            _loc4_ += " (" + Utils.boundInt(0,int(Math.round(param2)),100) + "%)";
         }
         return _loc4_;
      }
   }
}

