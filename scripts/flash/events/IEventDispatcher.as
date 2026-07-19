package flash.events
{
   public interface IEventDispatcher
   {
      
      function willTrigger(param1:String) : Boolean;
      
      function removeEventListener(param1:String, param2:Function, param3:Boolean = undefined) : void;
      
      function hasEventListener(param1:String) : Boolean;
      
      function dispatchEvent(param1:Event) : Boolean;
      
      function addEventListener(param1:String, param2:Function, param3:Boolean = undefined, param4:int = undefined, param5:Boolean = undefined) : void;
   }
}

