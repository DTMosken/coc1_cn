package classes
{
   public interface SaveAwareInterface
   {
      
      function updateBeforeSave(param1:CoC) : void;
      
      function updateAfterLoad(param1:CoC) : void;
   }
}

