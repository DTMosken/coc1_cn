package classes.internals
{
   public interface GuiOutput
   {
      
      function text(param1:String) : GuiOutput;
      
      function header(param1:String) : GuiOutput;
      
      function flush() : void;
      
      function clear(param1:Boolean = undefined) : GuiOutput;
   }
}

