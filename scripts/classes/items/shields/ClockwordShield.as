package classes.items.shields
{
   import classes.CoC;
   import classes.DebugMenu;
   import classes.SelfDebug;
   import classes.internals.Utils;
   import classes.internals._ValueFunc.NumberFunc_Impl_;
   import classes.items.Shield;
   import classes.items.shields._ClockwordShield.SaveContent;
   import classes.saves.SelfSaver;
   import classes.saves.SelfSaving;
   import flash.Boot;
   
   public class ClockwordShield extends Shield implements SelfDebug, SelfSaving
   {
      
      public var saveVersion:int;
      
      public var saveName:String;
      
      public var saveContent:SaveContent;
      
      public var globalSave:Boolean;
      
      public function ClockwordShield()
      {
         if(Boot.skip_constructor)
         {
            return;
         }
         globalSave = false;
         saveVersion = 1;
         saveName = "clockworkshield";
         saveContent = new SaveContent(null);
         super("ClShield","ClockworkShield","clockwork shield","a clockwork shield",6,1003,"A strange metal disc to be strapped to your arm like a small shield. The hollow interior is taken up by a clock-like mechanism. Activating this magical apparatus freezes every foe around you for a short time. Also comes with a small storage compartment.");
         boost("闪避几率",NumberFunc_Impl_.fromInt(4),false);
         _headerName = "Clockwork Shield";
         SelfSaver.register(this);
         DebugMenu.register(this);
      }
      
      public function saveToObject() : Object
      {
         return saveContent;
      }
      
      public function reset() : void
      {
         saveContent.used = false;
      }
      
      public function onAscend(param1:Boolean) : void
      {
         reset();
      }
      
      public function load(param1:int, param2:*) : void
      {
         Utils.extend(saveContent,param2);
      }
      
      override public function get_description() : String
      {
         var _loc1_:String = super.get_description();
         _loc1_ += "\n[b: 特殊：] 赋予冻结时间的能力。";
         return _loc1_ + "\n提供两个额外的物品栏槽位。";
      }
      
      public function get_debugName() : String
      {
         return "ClockworkShield";
      }
      
      public function get_debugHint() : String
      {
         return "";
      }
      
      public function debugMenu(param1:Boolean = true) : void
      {
         get_game().debugMenu.debugCompEdit(saveContent,new SaveContent(null));
      }
   }
}

