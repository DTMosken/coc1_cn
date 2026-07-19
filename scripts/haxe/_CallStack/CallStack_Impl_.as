package haxe._CallStack
{
   import haxe.StackItem;
   
   public final class CallStack_Impl_
   {
      
      public function CallStack_Impl_()
      {
      }
      
      public static function toString(param1:Array) : String
      {
         var _loc5_:* = null as StackItem;
         var _loc2_:StringBuf = new StringBuf();
         var _loc3_:int = 0;
         var _loc4_:Array = param1;
         while(_loc3_ < int(_loc4_.length))
         {
            _loc5_ = _loc4_[_loc3_];
            _loc3_++;
            _loc2_.b += "\nCalled from ";
            CallStack_Impl_.itemToString(_loc2_,_loc5_);
         }
         return _loc2_.b;
      }
      
      public static function subtract(param1:Array, param2:Array) : Array
      {
         var _loc5_:int = 0;
         var _loc6_:int = 0;
         var _loc7_:int = 0;
         var _loc3_:int = -1;
         var _loc4_:int = -1;
         while(++_loc4_ < int(param1.length))
         {
            _loc5_ = 0;
            _loc6_ = int(param2.length);
            while(_loc5_ < _loc6_)
            {
               _loc7_ = _loc5_++;
               if(CallStack_Impl_.equalItems(param1[_loc4_],param2[_loc7_]))
               {
                  if(_loc3_ < 0)
                  {
                     _loc3_ = _loc4_;
                  }
                  if(++_loc4_ >= int(param1.length))
                  {
                     break;
                  }
               }
               else
               {
                  _loc3_ = -1;
               }
            }
            if(_loc3_ >= 0)
            {
               break;
            }
         }
         if(_loc3_ >= 0)
         {
            return param1.slice(0,_loc3_);
         }
         return param1;
      }
      
      public static function equalItems(param1:StackItem, param2:StackItem) : Boolean
      {
         var _loc3_:* = null as String;
         var _loc4_:* = null as String;
         var _loc5_:* = null as StackItem;
         var _loc6_:int = 0;
         var _loc7_:* = null as Object;
         var _loc8_:* = null as Object;
         var _loc9_:int = 0;
         var _loc10_:* = null as StackItem;
         var _loc11_:* = null as String;
         var _loc12_:* = null as String;
         if(param1 == null)
         {
            if(param2 == null)
            {
               return true;
            }
            return false;
         }
         switch(param1.index)
         {
            case 0:
               if(param2 == null)
               {
                  return false;
               }
               if(param2.index == 0)
               {
                  return true;
               }
               return false;
               break;
            case 1:
               if(param2 == null)
               {
                  return false;
               }
               if(param2.index == 1)
               {
                  _loc3_ = param2.params[0];
                  _loc4_ = param1.params[0];
                  return _loc4_ == _loc3_;
               }
               return false;
               break;
            case 2:
               if(param2 == null)
               {
                  return false;
               }
               if(param2.index == 2)
               {
                  _loc5_ = param2.params[0];
                  _loc3_ = param2.params[1];
                  _loc6_ = int(param2.params[2]);
                  _loc7_ = param2.params[3];
                  _loc8_ = param1.params[3];
                  _loc9_ = int(param1.params[2]);
                  _loc4_ = param1.params[1];
                  _loc10_ = param1.params[0];
                  if(_loc4_ == _loc3_ && _loc9_ == _loc6_ && _loc8_ == _loc7_)
                  {
                     return CallStack_Impl_.equalItems(_loc10_,_loc5_);
                  }
                  return false;
               }
               return false;
               break;
            case 3:
               if(param2 == null)
               {
                  return false;
               }
               if(param2.index == 3)
               {
                  _loc3_ = param2.params[0];
                  _loc4_ = param2.params[1];
                  _loc11_ = param1.params[1];
                  _loc12_ = param1.params[0];
                  if(_loc12_ == _loc3_)
                  {
                     return _loc11_ == _loc4_;
                  }
                  return false;
               }
               return false;
               break;
            case 4:
               if(param2 == null)
               {
                  return false;
               }
               if(param2.index == 4)
               {
                  _loc7_ = param2.params[0];
                  _loc8_ = param1.params[0];
                  return _loc8_ == _loc7_;
               }
               return false;
               break;
            default:
               return;
         }
      }
      
      public static function itemToString(param1:StringBuf, param2:StackItem) : void
      {
         var _loc3_:* = null as String;
         var _loc4_:* = null as StackItem;
         var _loc5_:int = 0;
         var _loc6_:* = null as Object;
         var _loc7_:* = null as String;
         switch(param2.index)
         {
            case 0:
               param1.b += "a C function";
               break;
            case 1:
               _loc3_ = param2.params[0];
               param1.b += "module ";
               param1.b += Std.string(_loc3_);
               break;
            case 2:
               _loc4_ = param2.params[0];
               _loc3_ = param2.params[1];
               _loc5_ = int(param2.params[2]);
               _loc6_ = param2.params[3];
               if(_loc4_ != null)
               {
                  CallStack_Impl_.itemToString(param1,_loc4_);
                  param1.b += " (";
               }
               param1.b += Std.string(_loc3_);
               param1.b += " line ";
               param1.b += Std.string(_loc5_);
               if(_loc6_ != null)
               {
                  param1.b += " column ";
                  param1.b += Std.string(_loc6_);
               }
               if(_loc4_ != null)
               {
                  param1.b += ")";
               }
               break;
            case 3:
               _loc3_ = param2.params[0];
               _loc7_ = param2.params[1];
               param1.b += Std.string(_loc3_ == null ? "<unknown>" : _loc3_);
               param1.b += ".";
               param1.b += Std.string(_loc7_);
               break;
            case 4:
               _loc6_ = param2.params[0];
               param1.b += "local function #";
               param1.b += Std.string(_loc6_);
         }
      }
   }
}

