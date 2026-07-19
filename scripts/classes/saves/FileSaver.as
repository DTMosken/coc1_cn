package classes.saves
{
   import flash.utils.ByteArray;
   
   public interface FileSaver
   {
      
      function save(param1:ByteArray, param2:Function) : Boolean;
      
      function load(param1:Function, param2:Function) : void;
   }
}

