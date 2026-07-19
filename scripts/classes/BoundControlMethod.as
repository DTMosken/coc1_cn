package classes
{
   import classes.display.BindingPane;
   import coc.view.CoCButton;
   import flash.Boot;
   
   public class BoundControlMethod
   {
      
      public var showHotkeys:Boolean;
      
      public var secondaryKey:int;
      
      public var primaryKey:int;
      
      public var name:String;
      
      public var index:int;
      
      public var func:Object;
      
      public var description:String;
      
      public var button:CoCButton;
      
      public function BoundControlMethod(param1:Object = undefined, param2:String = undefined, param3:String = undefined, param4:int = 0, param5:int = -1, param6:int = -1)
      {
         if(Boot.skip_constructor)
         {
            return;
         }
         showHotkeys = false;
         secondaryKey = 0;
         primaryKey = 0;
         button = null;
         func = param1;
         index = param4;
         name = param2;
         description = param3;
         set_primaryKey(param5);
         set_secondaryKey(param6);
      }
      
      public function updateHotkeys() : void
      {
         if(button != null)
         {
            button.set_key1text(showHotkeys ? BindingPane.keyName(primaryKey,"") : "");
            button.set_key2text(showHotkeys ? BindingPane.keyName(secondaryKey,"") : "");
         }
      }
      
      public function set_showHotkeys(param1:Boolean) : Boolean
      {
         showHotkeys = param1;
         updateHotkeys();
         return param1;
      }
      
      public function set_secondaryKey(param1:int) : int
      {
         secondaryKey = param1;
         updateHotkeys();
         return param1;
      }
      
      public function set_primaryKey(param1:int) : int
      {
         primaryKey = param1;
         updateHotkeys();
         return param1;
      }
      
      public function set_button(param1:CoCButton) : CoCButton
      {
         if(button != null)
         {
            button.set_key1text("");
            button.set_key2text("");
         }
         button = param1;
         updateHotkeys();
         return param1;
      }
   }
}

