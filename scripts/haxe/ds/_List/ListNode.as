package haxe.ds._List
{
   import flash.Boot;
   
   public class ListNode
   {
      
      public var next:ListNode;
      
      public var item:Object;
      
      public function ListNode(param1:Object = undefined, param2:ListNode = undefined)
      {
         if(Boot.skip_constructor)
         {
            return;
         }
         item = param1;
         next = param2;
      }
   }
}

