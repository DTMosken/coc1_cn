package haxe.ds
{
   import flash.Boot;
   import haxe.ds._List.ListNode;
   
   public class List
   {
      
      public var q:ListNode;
      
      public var length:int;
      
      public var h:ListNode;
      
      public function List()
      {
         if(Boot.skip_constructor)
         {
            return;
         }
         length = 0;
      }
      
      public function push(param1:Object) : void
      {
         var _loc2_:ListNode = new ListNode(param1,h);
         h = _loc2_;
         if(q == null)
         {
            q = _loc2_;
         }
         ++length;
      }
      
      public function pop() : Object
      {
         if(h == null)
         {
            return null;
         }
         var _loc1_:Object = h.item;
         h = h.next;
         if(h == null)
         {
            q = null;
         }
         --length;
         return _loc1_;
      }
      
      public function add(param1:Object) : void
      {
         var _loc2_:ListNode = null;
         var _loc3_:ListNode = new ListNode(param1,_loc2_);
         if(h == null)
         {
            h = _loc3_;
         }
         else
         {
            q.next = _loc3_;
         }
         q = _loc3_;
         ++length;
      }
   }
}

