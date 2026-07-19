package coc.view
{
   import classes.Output;
   import classes.globalFlags.KGAMECLASS;
   import classes.internals.Utils;
   import flash.Boot;
   
   public class ButtonDataList
   {
      
      public var sorted:Boolean;
      
      public var prevPosition:int;
      
      public var prevName:String;
      
      public var page:int;
      
      public var nextPosition:int;
      
      public var nextName:String;
      
      public var list:Array;
      
      public var exitPosition:int;
      
      public var exitName:String;
      
      public function ButtonDataList()
      {
         if(Boot.skip_constructor)
         {
            return;
         }
         sorted = false;
         page = 0;
         exitPosition = 14;
         nextPosition = 9;
         prevPosition = 4;
         exitName = "返回";
         nextName = "下一页";
         prevName = "上一页";
         list = [];
      }
      
      public function toString() : String
      {
         var _loc4_:* = null as ButtonData;
         var _loc1_:Array = [];
         var _loc2_:int = 0;
         var _loc3_:Array = list;
         while(_loc2_ < int(_loc3_.length))
         {
            _loc4_ = _loc3_[_loc2_];
            _loc2_++;
            _loc1_.push(_loc4_ != null ? _loc4_.text : "Null");
         }
         return Std.string(_loc1_);
      }
      
      public function submenuReturn(param1:int = -1) : void
      {
         if(param1 < 0)
         {
            param1 = page;
         }
         submenu(null,sorted,param1);
      }
      
      public function submenu(param1:Object = undefined, param2:Boolean = false, param3:int = 0) : void
      {
         var page2:int;
         var sort2:Boolean;
         var back2:Object;
         var _g1:ButtonDataList;
         var page1:int;
         var sort1:Boolean;
         var back1:Object;
         var _g:ButtonDataList;
         var _loc8_:* = null as ButtonData;
         var _loc14_:* = null as CoCButton;
         var _loc15_:* = null as Function;
         var _loc16_:* = null as Function;
         page = param3;
         sorted = param2;
         var _loc4_:Output = KGAMECLASS.kGAMECLASS.output;
         var _loc5_:Array = [];
         var _loc6_:int = 0;
         var _loc7_:Array = list;
         while(_loc6_ < int(_loc7_.length))
         {
            _loc8_ = _loc7_[_loc6_];
            _loc6_++;
            if(_loc8_ != null && _loc8_.visible)
            {
               _loc5_.push(_loc8_);
            }
         }
         _loc7_ = _loc5_;
         if(param2)
         {
            _loc7_.sort(function(param1:ButtonData, param2:ButtonData):int
            {
               return Reflect.compare(param1.text,param2.text);
            });
         }
         _loc6_ = int(_loc7_.length);
         var _loc9_:Boolean = _loc6_ <= 14;
         var _loc10_:int = _loc9_ ? 14 : 12;
         var _loc11_:int = int(Math.min(_loc6_,(param3 + 1) * _loc10_));
         var _loc12_:int = param3 * _loc10_;
         var _loc13_:int = 0;
         _loc4_.menu(false);
         while(_loc12_ < _loc11_)
         {
            _loc14_ = _loc4_.button(_loc13_);
            _loc7_[_loc12_].applyTo(_loc14_);
            _loc12_++;
            if(_loc9_)
            {
               _loc13_++;
            }
            else
            {
               do
               {
                  _loc13_ = Utils.boundInt(0,int((_loc13_ + 1) % 15),14);
               }
               while(Boolean([prevPosition,nextPosition,exitPosition].contains(_loc13_)));
            }
         }
         if(param3 != 0 || _loc6_ > _loc10_)
         {
            _g = this;
            back1 = param1;
            sort1 = param2;
            page1 = param3 - 1;
            _loc15_ = function():void
            {
               _g.submenu(back1,sort1,page1);
            };
            _loc4_.button(prevPosition).show(prevName,_loc15_,"","",true).disableIf(param3 == 0,null,true);
            _g1 = this;
            back2 = param1;
            sort2 = param2;
            page2 = param3 + 1;
            _loc16_ = function():void
            {
               _g1.submenu(back2,sort2,page2);
            };
            _loc4_.button(nextPosition).show(nextName,_loc16_,"","",true).disableIf(_loc11_ >= _loc6_,null,true);
         }
         if(param1 != null)
         {
            _loc4_.button(exitPosition).show(exitName,param1,"","",true);
         }
         _loc4_.flush();
      }
      
      public function pushOrdered(param1:int, param2:ButtonData) : ButtonData
      {
         list[param1] = param2;
         return param2;
      }
      
      public function push(param1:ButtonData) : ButtonData
      {
         list.push(param1);
         return param1;
      }
      
      public function get_lengthFiltered() : int
      {
         var _loc4_:* = null as ButtonData;
         var _loc1_:Array = [];
         var _loc2_:int = 0;
         var _loc3_:Array = list;
         while(_loc2_ < int(_loc3_.length))
         {
            _loc4_ = _loc3_[_loc2_];
            _loc2_++;
            if(_loc4_ != null && _loc4_.visible)
            {
               _loc1_.push(_loc4_);
            }
         }
         return int(_loc1_.length);
      }
      
      public function get_length() : int
      {
         return int(list.length);
      }
      
      public function clear() : void
      {
         list.resize(0);
         page = 0;
         prevName = "上一页";
         nextName = "下一页";
         exitName = "返回";
         prevPosition = 4;
         nextPosition = 9;
         exitPosition = 14;
      }
      
      public function addOrdered(param1:int, param2:String, param3:Object = undefined, param4:String = undefined, param5:String = undefined, param6:Boolean = true) : ButtonData
      {
         if(param4 == null)
         {
            param4 = "";
         }
         if(param5 == null)
         {
            param5 = "";
         }
         var _loc7_:ButtonData = new ButtonData(param2,param3,param4,param5,param6);
         list[param1] = _loc7_;
         return _loc7_;
      }
      
      public function add(param1:String, param2:Object = undefined, param3:String = undefined, param4:String = undefined, param5:Boolean = true) : ButtonData
      {
         if(param3 == null)
         {
            param3 = "";
         }
         if(param4 == null)
         {
            param4 = "";
         }
         var _loc6_:ButtonData = new ButtonData(param1,param2,param3,param4,param5);
         list.push(_loc6_);
         return _loc6_;
      }
   }
}

