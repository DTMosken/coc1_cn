package classes.internals
{
   import coc.view.CoCButton;
   
   public interface GuiInput
   {
      
      function menu(param1:Boolean = undefined) : void;
      
      function addButton(param1:int, param2:String = undefined, param3:Function = undefined) : CoCButton;
   }
}

