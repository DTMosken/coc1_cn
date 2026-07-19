package haxe.ds
{
   import haxe.IMap;
   import haxe.iterators.ArrayIterator;
   
   public class BalancedTree implements IMap
   {
      
      public var root:TreeNode;
      
      public function BalancedTree()
      {
      }
      
      public function setLoop(param1:Object, param2:Object, param3:TreeNode) : TreeNode
      {
         var _loc5_:* = null as TreeNode;
         if(param3 == null)
         {
            return new TreeNode(null,param1,param2,null);
         }
         var _loc4_:int = compare(param1,param3.key);
         if(_loc4_ == 0)
         {
            return new TreeNode(param3.left,param1,param2,param3.right,param3 == null ? 0 : param3._height);
         }
         if(_loc4_ < 0)
         {
            _loc5_ = setLoop(param1,param2,param3.left);
            return balance(_loc5_,param3.key,param3.value,param3.right);
         }
         _loc5_ = setLoop(param1,param2,param3.right);
         return balance(param3.left,param3.key,param3.value,_loc5_);
      }
      
      public function set(param1:Object, param2:Object) : void
      {
         root = setLoop(param1,param2,root);
      }
      
      public function keysLoop(param1:TreeNode, param2:Array) : void
      {
         if(param1 != null)
         {
            keysLoop(param1.left,param2);
            param2.push(param1.key);
            keysLoop(param1.right,param2);
         }
      }
      
      public function keys() : Object
      {
         var _loc1_:Array = [];
         keysLoop(root,_loc1_);
         return new ArrayIterator(_loc1_);
      }
      
      public function get(param1:Object) : Object
      {
         var _loc3_:int = 0;
         var _loc2_:TreeNode = root;
         while(_loc2_ != null)
         {
            _loc3_ = compare(param1,_loc2_.key);
            if(_loc3_ == 0)
            {
               return _loc2_.value;
            }
            if(_loc3_ < 0)
            {
               _loc2_ = _loc2_.left;
            }
            else
            {
               _loc2_ = _loc2_.right;
            }
         }
         return null;
      }
      
      public function compare(param1:Object, param2:Object) : int
      {
         return Reflect.compare(param1,param2);
      }
      
      public function balance(param1:TreeNode, param2:Object, param3:Object, param4:TreeNode) : TreeNode
      {
         var _loc7_:* = null as TreeNode;
         var _loc8_:* = null as TreeNode;
         var _loc5_:int = param1 == null ? 0 : param1._height;
         var _loc6_:int = param4 == null ? 0 : param4._height;
         if(_loc5_ > _loc6_ + 2)
         {
            _loc7_ = param1.left;
            _loc8_ = param1.right;
            if((_loc7_ == null ? 0 : _loc7_._height) >= (_loc8_ == null ? 0 : _loc8_._height))
            {
               return new TreeNode(param1.left,param1.key,param1.value,new TreeNode(param1.right,param2,param3,param4));
            }
            return new TreeNode(new TreeNode(param1.left,param1.key,param1.value,param1.right.left),param1.right.key,param1.right.value,new TreeNode(param1.right.right,param2,param3,param4));
         }
         if(_loc6_ > _loc5_ + 2)
         {
            _loc7_ = param4.right;
            _loc8_ = param4.left;
            if((_loc7_ == null ? 0 : _loc7_._height) > (_loc8_ == null ? 0 : _loc8_._height))
            {
               return new TreeNode(new TreeNode(param1,param2,param3,param4.left),param4.key,param4.value,param4.right);
            }
            return new TreeNode(new TreeNode(param1,param2,param3,param4.left.left),param4.left.key,param4.left.value,new TreeNode(param4.left.right,param4.key,param4.value,param4.right));
         }
         return new TreeNode(param1,param2,param3,param4,(_loc5_ > _loc6_ ? _loc5_ : _loc6_) + 1);
      }
   }
}

