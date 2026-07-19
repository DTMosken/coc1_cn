package classes.saves
{
   public interface SelfSaving
   {
      
      function saveToObject() : Object;
      
      function reset() : void;
      
      function onAscend(param1:Boolean) : void;
      
      function load(param1:int, param2:*) : void;
   }
}

