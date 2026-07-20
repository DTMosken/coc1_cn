package classes.internals
{
   import coc.script.Eval;
   import coc.script.VType;
   import haxe.Exception;
   import haxe.IMap;
   import haxe.Serializer;
   import haxe.Unserializer;
   import haxe.ds.StringMap;
   import haxe.io.Bytes;
   
   public class Utils
   {
      
      public static var toRadix_BASE:String = "0123456789abcdefghijklmnopqrstuvwxyz";
      
      public static var MAX_INT:int = 2147483647;
      
      public static var MIN_INT:int = -2147483648;
      
      public static var MAX_FLOAT:Number = 1.79e+308;
      
      public static var MIN_FLOAT:Number = -1.79e+308;
      
      public function Utils()
      {
      }
      
      public static function formatStringArray(param1:Array) : String
      {
         var _loc2_:* = null as Function;
         var _loc3_:* = null as Array;
         var _loc4_:int = 0;
         var _loc5_:* = null as Array;
         var _loc6_:* = null as String;
         switch(int(param1.length))
         {
            case 0:
               return "";
            case 1:
               return Utils.cnName(param1[0]);
            case 2:
               return Utils.cnName(param1[0]) + "和" + Utils.cnName(param1[1]);
            default:
               _loc2_ = Utils.cnName;
               _loc3_ = [];
               _loc4_ = 0;
               _loc5_ = param1.slice(0,int(param1.length) - 1);
               while(_loc4_ < int(_loc5_.length))
               {
                  _loc6_ = _loc5_[_loc4_];
                  _loc4_++;
                  _loc3_.push(_loc2_(_loc6_));
               }
               _loc5_ = _loc3_;
               _loc6_ = Utils.cnName(param1[int(param1.length) - 1]);
               return _loc5_.join("，") + "，以及" + _loc6_;
         }
      }
      
      public static function toFixed(param1:Number, param2:int) : String
      {
         var _loc3_:Number = Math.pow(10,param2);
         var _loc4_:Number = Math.round(_loc3_ * param1) / _loc3_;
         return "" + _loc4_;
      }
      
      public static function toRadix(param1:Number, param2:int = 10) : String
      {
         var _loc3_:int = int(Math.round(param1));
         if(param2 < 2 || param2 > Utils.toRadix_BASE.length)
         {
            throw Exception.thrown("invalid base " + param2 + ", it must be between 2 and " + Utils.toRadix_BASE.length);
         }
         if(param2 == 10 || _loc3_ == 0)
         {
            return "" + _loc3_;
         }
         var _loc4_:String = "";
         var _loc5_:int = int(Math.round(Math.abs(_loc3_)));
         while(_loc5_ > 0)
         {
            _loc4_ = Utils.toRadix_BASE.charAt(int(_loc5_ % param2)) + _loc4_;
            _loc5_ /= param2;
         }
         return (_loc3_ < 0 ? "-" : "") + _loc4_;
      }
      
      public static function boundInt(param1:int, param2:int, param3:int) : int
      {
         if(param2 < param1)
         {
            return param1;
         }
         if(param2 > param3)
         {
            return param3;
         }
         return param2;
      }
      
      public static function maxInt(param1:int, param2:int) : int
      {
         if(param1 > param2)
         {
            return param1;
         }
         return param2;
      }
      
      public static function maxInts(param1:int, ... rest) : int
      {
         var _loc6_:int = 0;
         var _loc4_:int = 0;
         var _loc5_:Array = rest;
         while(_loc4_ < int(_loc5_.length))
         {
            _loc6_ = int(_loc5_[_loc4_++]);
            param1 = Utils.maxInt(param1,_loc6_);
         }
         return param1;
      }
      
      public static function minInt(param1:int, param2:int) : int
      {
         if(param1 < param2)
         {
            return param1;
         }
         return param2;
      }
      
      public static function minInts(param1:int, ... rest) : int
      {
         var _loc6_:int = 0;
         var _loc4_:int = 0;
         var _loc5_:Array = rest;
         while(_loc4_ < int(_loc5_.length))
         {
            _loc6_ = int(_loc5_[_loc4_++]);
            param1 = Utils.minInt(param1,_loc6_);
         }
         return param1;
      }
      
      public static function boundFloat(param1:Number, param2:Number, param3:Number) : Number
      {
         if(!Boolean(Math.isFinite(param2)))
         {
            return param1;
         }
         if(param2 < param1)
         {
            return param1;
         }
         if(param2 > param3)
         {
            return param3;
         }
         return param2;
      }
      
      public static function extend(param1:Object, param2:*) : Object
      {
         var _loc8_:* = null as String;
         var _loc9_:* = null;
         var _loc3_:Class = Type.getClass(param1);
         var _loc4_:Class = Type.getClass(param2);
         var _loc5_:Array = _loc3_ == null ? Reflect.fields(param1) : Type.getInstanceFields(_loc3_);
         var _loc6_:Array = _loc4_ == null ? Reflect.fields(param2) : Type.getInstanceFields(_loc4_);
         var _loc7_:int = 0;
         while(_loc7_ < int(_loc6_.length))
         {
            _loc8_ = _loc6_[_loc7_];
            _loc7_++;
            if(Boolean(_loc5_.contains(_loc8_)))
            {
               _loc9_ = Reflect.getProperty(param2,_loc8_);
               if(!Reflect.isFunction(_loc9_))
               {
                  Reflect.setProperty(param1,_loc8_,Reflect.getProperty(param2,_loc8_));
               }
            }
         }
         return param1;
      }
      
      public static function copy(param1:Object) : Object
      {
         return Unserializer.run(Serializer.run(param1));
      }
      
      public static function numToWordsInternal(param1:Number, param2:Boolean = false) : String
      {
         var _loc6_:* = null;
         var _loc7_:* = null as String;
         var _loc8_:int = 0;
         var _loc3_:Array = [{
            "value":1e+21,
            "str":"十垓",
            "ordinal":"十垓"
         },{
            "value":1000000000000000000,
            "str":"百京",
            "ordinal":"百京"
         },{
            "value":1000000000000000,
            "str":"千万亿",
            "ordinal":"千万亿"
         },{
            "value":1000000000000,
            "str":"万亿",
            "ordinal":"万亿"
         },{
            "value":1000000000,
            "str":"十亿",
            "ordinal":"第十亿"
         },{
            "value":1000000,
            "str":"百万",
            "ordinal":"百万"
         },{
            "value":1000,
            "str":"千",
            "ordinal":"千"
         },{
            "value":100,
            "str":"百",
            "ordinal":"百"
         },{
            "value":90,
            "str":"九十",
            "ordinal":"第九十"
         },{
            "value":80,
            "str":"八十",
            "ordinal":"第八十"
         },{
            "value":70,
            "str":"七十",
            "ordinal":"第七十"
         },{
            "value":60,
            "str":"六十",
            "ordinal":"第六十"
         },{
            "value":50,
            "str":"五十",
            "ordinal":"第五十"
         },{
            "value":40,
            "str":"四十",
            "ordinal":"第四十"
         },{
            "value":30,
            "str":"三十",
            "ordinal":"第三十"
         },{
            "value":20,
            "str":"二十",
            "ordinal":"第二十"
         },{
            "value":19,
            "str":"十九",
            "ordinal":"第十九"
         },{
            "value":18,
            "str":"十八",
            "ordinal":"第十八"
         },{
            "value":17,
            "str":"十七",
            "ordinal":"第十七"
         },{
            "value":16,
            "str":"十六",
            "ordinal":"第十六"
         },{
            "value":15,
            "str":"十五",
            "ordinal":"第十五"
         },{
            "value":14,
            "str":"十四",
            "ordinal":"第十四"
         },{
            "value":13,
            "str":"十三",
            "ordinal":"第十三"
         },{
            "value":12,
            "str":"十二",
            "ordinal":"第十二"
         },{
            "value":11,
            "str":"十一",
            "ordinal":"第十一"
         },{
            "value":10,
            "str":"十",
            "ordinal":"第十"
         },{
            "value":9,
            "str":"九",
            "ordinal":"第九"
         },{
            "value":8,
            "str":"八",
            "ordinal":"第八"
         },{
            "value":7,
            "str":"七",
            "ordinal":"第七"
         },{
            "value":6,
            "str":"六",
            "ordinal":"第六"
         },{
            "value":5,
            "str":"五",
            "ordinal":"第五"
         },{
            "value":4,
            "str":"四",
            "ordinal":"第四"
         },{
            "value":3,
            "str":"三",
            "ordinal":"第三"
         },{
            "value":2,
            "str":"两个",
            "ordinal":"第二"
         },{
            "value":1,
            "str":"一个",
            "ordinal":"第一"
         }];
         param1 = Math.floor(param1);
         if(param1 < 0)
         {
            return "负" + Utils.numToWordsInternal(-param1,param2);
         }
         if(param1 == 0)
         {
            if(param2)
            {
               return "第零";
            }
            return "零";
         }
         var _loc4_:String = "";
         var _loc5_:int = 0;
         while(_loc5_ < int(_loc3_.length))
         {
            _loc6_ = _loc3_[_loc5_];
            _loc5_++;
            if(param1 >= Number(_loc6_.value))
            {
               _loc7_ = param2 ? _loc6_.ordinal : _loc6_.str;
               if(param1 < 100)
               {
                  param1 -= Number(_loc6_.value);
                  if(param1 > 0)
                  {
                     _loc4_ += _loc6_.str + " ";
                  }
                  else
                  {
                     _loc4_ += _loc7_;
                  }
               }
               else
               {
                  _loc8_ = int(param1 / Number(_loc6_.value));
                  param1 -= Number(_loc6_.value) * _loc8_;
                  if(param1 > 0)
                  {
                     _loc4_ += Utils.numToWordsInternal(_loc8_) + " " + _loc6_.str;
                     _loc4_ += param1 < 100 ? "和" : "，";
                  }
                  else
                  {
                     _loc4_ += Utils.numToWordsInternal(_loc8_) + " " + _loc7_;
                  }
               }
            }
         }
         return _loc4_;
      }
      
      public static function num2Text(param1:Number) : String
      {
         return Utils.numToWordsInternal(param1,false);
      }
      
      public static function Num2Text(param1:Number) : String
      {
         return Utils.capitalizeFirstLetter(Utils.num2Text(param1));
      }
      
      public static function num2TextOrdinal(param1:Number) : String
      {
         return Utils.numToWordsInternal(param1,true);
      }
      
      public static function addComma(param1:int) : String
      {
         var _loc3_:uint = 0;
         var _loc2_:String = "";
         if(param1 <= 0)
         {
            return "0";
         }
         while(param1 > 0)
         {
            _loc3_ = uint(int(param1 % 1000));
            _loc2_ = (param1 > 999 ? "," + (_loc3_ < 100 ? (_loc3_ < 10 ? "00" : "0") : "") : "") + ("" + _loc3_) + _loc2_;
            param1 /= 1000;
         }
         return _loc2_;
      }
      
      public static function capitalizeFirstLetter(param1:String) : String
      {
         return param1.substr(0,1).toUpperCase() + param1.substr(1);
      }
      
      public static function lowercaseFirstLetter(param1:String) : String
      {
         return param1.substr(0,1).toLowerCase() + param1.substr(1);
      }
      
      public static function titleCase(param1:String) : String
      {
         return new EReg("(?:(?<=\\s)(?:(?:of|the|an?d?)\\b)|(?<=^|\\s)([a-z]))","g").map(param1,function(param1:EReg):String
         {
            if(param1.matched(1) != null)
            {
               return param1.matched(1).toUpperCase();
            }
            return param1.matched(0);
         });
      }
      
      public static function countSetBits(param1:int) : int
      {
         param1 -= param1 >> 1 & 0x55555555;
         param1 = (param1 & 0x33333333) + (param1 >> 2 & 0x33333333);
         return (param1 + (param1 >> 4) & 0x0F0F0F0F) * 16843009 >> 24;
      }
      
      public static function bits2Array(param1:int, param2:int) : Array
      {
         var _loc6_:int = 0;
         var _loc3_:Array = [];
         var _loc4_:int = 0;
         var _loc5_:int = param2;
         while(_loc4_ < _loc5_)
         {
            _loc6_ = _loc4_++;
            _loc3_.push((param1 & 1 << _loc6_) != 0);
         }
         return _loc3_;
      }
      
      public static function randomChoice(param1:Array) : Object
      {
         var _loc2_:Array = param1;
         return _loc2_[Utils.rand(int(_loc2_.length))];
      }
      
      public static function randChoice(... rest) : Object
      {
         return rest[Utils.rand(int(rest.length))];
      }
      
      public static function randChoices(param1:int, ... rest) : Array
      {
         if(param1 > int(rest.length))
         {
            throw new Error("randChoices 请求的数量大于提供的选项数量。");
         }
         if(param1 < 0)
         {
            throw new Error("randChoices 请求了负数数量");
         }
         var _loc4_:Array = rest.copy();
         var _loc5_:Array = [];
         if(param1 == int(_loc4_.length))
         {
            return _loc4_;
         }
         while(param1 > 0)
         {
            _loc5_.push(_loc4_.splice(Utils.rand(int(_loc4_.length)),1)[0]);
            param1--;
         }
         return _loc5_;
      }
      
      public static function isBetween(param1:Number, param2:Number, param3:Number) : Boolean
      {
         if(param3 > param1)
         {
            if(param2 >= param1)
            {
               return param2 <= param3;
            }
            return false;
         }
         if(param2 >= param3)
         {
            return param2 <= param1;
         }
         return false;
      }
      
      public static function loopInt(param1:int, param2:int, param3:int) : int
      {
         param2++;
         if(param2 > param3 || param2 < param1)
         {
            param2 = param1;
         }
         return param2;
      }
      
      public static function rand(param1:Number) : int
      {
         return int(Math.random() * param1);
      }
      
      public static function randFloat(param1:Number) : Number
      {
         return Math.random() * param1;
      }
      
      public static function randBetween(param1:Number, param2:Number) : int
      {
         var _loc3_:Number = Math.min(param1,param2);
         var _loc4_:Number = Math.max(param1,param2);
         return int(Math.random() * (_loc4_ - _loc3_ + 1) + _loc3_);
      }
      
      public static function trueOnceInN(param1:Number) : Boolean
      {
         return Math.random() * param1 < 1;
      }
      
      public static function randomChance(param1:Number) : Boolean
      {
         return Utils.randFloat(100) < param1;
      }
      
      public static function validateNonNegativeNumberFields(param1:*, param2:String, param3:Array) : String
      {
         var _loc7_:* = null as String;
         var _loc8_:* = null as VType;
         var _loc9_:Number = NaN;
         var _loc10_:int = 0;
         var _loc11_:* = null as Error;
         var _loc5_:String = "";
         var _loc6_:int = 0;
         while(_loc6_ < int(param3.length))
         {
            _loc7_ = param3[_loc6_];
            _loc6_++;
            try
            {
               _loc8_ = Eval.eval(param1,_loc7_);
               switch(_loc8_.index)
               {
                  case 0:
                     _loc9_ = Number(_loc8_.params[0]);
                     if(_loc9_ < 0)
                     {
                        _loc5_ += "\'" + _loc7_ + "\' 为负数。";
                     }
                     break;
                  case 1:
                     _loc10_ = int(_loc8_.params[0]);
                     if(_loc10_ < 0)
                     {
                        _loc5_ += "\'" + _loc7_ + "\' 为负数。";
                     }
                     break;
                  case 4:
                     _loc5_ += "空的 \'" + _loc7_ + "\'。";
                     break;
                  default:
                     _loc5_ += param2 + ".nnf 中拼写错误：\'" + _loc7_ + "\'。";
               }
            }
            catch(_loc_e_:Error)
            {
               _loc11_ = _loc_e_;
               _loc5_ += "在 \'" + param2 + "\' 上调用 eval 时出错: " + _loc11_.message + "。";
            }
         }
         return _loc5_;
      }
      
      public static function validateNonEmptyStringFields(param1:*, param2:String, param3:Array) : String
      {
         var _loc7_:* = null as String;
         var _loc8_:* = null as VType;
         var _loc9_:* = null as String;
         var _loc10_:* = null as Error;
         var _loc5_:String = "";
         var _loc6_:int = 0;
         while(_loc6_ < int(param3.length))
         {
            _loc7_ = param3[_loc6_];
            _loc6_++;
            try
            {
               _loc8_ = Eval.eval(param1,_loc7_);
               switch(_loc8_.index)
               {
                  case 3:
                     _loc9_ = _loc8_.params[0];
                     if(_loc9_ == "")
                     {
                        _loc5_ += "空的 \'" + _loc7_ + "\'。";
                     }
                     break;
                  case 4:
                     _loc5_ += "空的 \'" + _loc7_ + "\'。";
                     break;
                  default:
                     _loc5_ += "拼写错误，位于 " + param2 + ".nef: \'" + _loc7_ + "\'。";
               }
            }
            catch(_loc_e_:Error)
            {
               _loc10_ = _loc_e_;
               _loc5_ += "在 \'" + param2 + "\' 上调用 eval 时出错: " + _loc10_.message + "。";
            }
         }
         return _loc5_;
      }
      
      public static function numberOfThings(param1:int, param2:String, param3:String = undefined) : String
      {
         if(param3 == null)
         {
            param3 = param2 + "";
         }
         switch(param1)
         {
            case 0:
               return "0" + param3;
            case 1:
               return "1" + param2;
            default:
               return param1 + ("" + param3);
         }
      }
      
      public static function pluralize(param1:int, param2:String, param3:String = undefined) : String
      {
         if(param3 == null)
         {
            param3 = param2 + "";
         }
         if(param1 == 1)
         {
            return param2;
         }
         return param3;
      }
      
      public static function countMatches(param1:String, param2:String) : int
      {
         var _loc3_:int = 0;
         var _loc4_:int = -1;
         while(true)
         {
            _loc4_ = param2.indexOf(param1,_loc4_ + 1);
            if(_loc4_ < 0)
            {
               break;
            }
            _loc3_++;
         }
         return _loc3_;
      }
      
      public static function recursiveLoad(param1:*, param2:Object) : Object
      {
         var _loc9_:* = null as String;
         var _loc10_:* = null;
         if(param1 is String || param2 is String)
         {
            return param1;
         }
         var _loc3_:Class = Type.getClass(param2);
         var _loc4_:Class = Type.getClass(param1);
         var _loc5_:Array = _loc4_ == null ? Reflect.fields(param1) : Type.getInstanceFields(_loc4_);
         var _loc6_:Array = _loc3_ == null ? Reflect.fields(param2) : Type.getInstanceFields(_loc3_);
         var _loc7_:Boolean = false;
         var _loc8_:int = 0;
         while(_loc8_ < int(_loc6_.length))
         {
            _loc9_ = _loc6_[_loc8_];
            _loc8_++;
            if(Boolean(_loc5_.contains(_loc9_)))
            {
               _loc10_ = Reflect.getProperty(param2,_loc9_);
               if(!Reflect.isFunction(_loc10_))
               {
                  _loc7_ = true;
                  Reflect.setProperty(param2,_loc9_,Utils.recursiveLoad(Reflect.getProperty(param1,_loc9_),_loc10_));
               }
            }
         }
         if(_loc7_)
         {
            return param2;
         }
         return param1;
      }
      
      public static function cnName(param1:String) : String
      {
         /*
          * 反编译错误
          * 代码可能被混淆
          * 提示：您可以尝试在“设置”中启用“反混淆代码”选项。
          * 错误类型: ExecutionException (java.lang.StackOverflowError)
          */
         throw new flash.errors.IllegalOperationError("由于错误未进行反编译");
      }
      
      public static function cnName2(param1:String) : String
      {
         var _loc2_:String = param1.toLowerCase();
         var _loc3_:String = _loc2_;
         if(_loc3_ == "default")
         {
            return "默认";
         }
         if(_loc3_ == "marble")
         {
            return "大理石";
         }
         if(_loc3_ == "obsidian")
         {
            return "黑曜石";
         }
         if(_loc3_ == "parchment")
         {
            return "羊皮纸";
         }
         if(_loc3_ == "stone")
         {
            return "石头";
         }
         return param1;
      }
      
      public static function equals(param1:Object, param2:Object) : Boolean
      {
         var _loc4_:* = null as Class;
         var _loc5_:* = null as Array;
         var _loc6_:* = null as Array;
         var _loc7_:int = 0;
         var _loc8_:int = 0;
         var _loc9_:int = 0;
         var _loc10_:* = null as IMap;
         var _loc11_:* = null as IMap;
         var _loc12_:* = null;
         var _loc13_:* = null;
         var _loc14_:Boolean = false;
         var _loc15_:* = null;
         var _loc16_:Boolean = false;
         var _loc17_:* = null;
         var _loc18_:int = 0;
         var _loc19_:Boolean = false;
         var _loc20_:* = null as String;
         var _loc21_:* = null as String;
         var _loc22_:* = null as Array;
         var _loc23_:* = null as Array;
         var _loc24_:* = null as Object;
         var _loc25_:* = null as Object;
         if(param1 == param2)
         {
            return true;
         }
         var _loc3_:ValueType = Type.§typeof§(param1);
         switch(_loc3_.index)
         {
            case 0:
            case 1:
            case 3:
            case 8:
               return param1 == param2;
            case 2:
               if(Boolean(Math.isNaN(Number(param1))))
               {
                  return Boolean(Math.isNaN(Number(param2)));
               }
               return false;
               break;
            case 4:
               break;
            case 5:
               return Reflect.compareMethods(param1,param2);
            case 6:
               _loc4_ = _loc3_.params[0];
               if(param1 is String)
               {
                  return param1 == param2;
               }
               if(param1 is Array)
               {
                  _loc5_ = param1;
                  _loc6_ = param2;
                  if(int(_loc5_.length) != int(_loc6_.length))
                  {
                     return false;
                  }
                  _loc7_ = 0;
                  _loc8_ = int(_loc5_.length);
                  while(_loc7_ < _loc8_)
                  {
                     _loc9_ = _loc7_++;
                     if(!Utils.equals(_loc5_[_loc9_],_loc6_[_loc9_]))
                     {
                        return false;
                     }
                  }
                  return true;
               }
               if(param1 is IMap)
               {
                  _loc10_ = param1;
                  _loc11_ = param2;
                  _loc5_ = [];
                  _loc12_ = _loc10_.h;
                  _loc13_ = _loc10_.rh;
                  _loc7_ = 0;
                  _loc14_ = false;
                  _loc15_ = _loc12_;
                  _loc8_ = _loc7_;
                  _loc16_ = §§hasnext(_loc15_,_loc8_);
                  if(!_loc16_ && _loc13_ != null)
                  {
                     _loc12_ = _loc13_;
                     _loc15_ = _loc12_;
                     _loc7_ = 0;
                     _loc8_ = _loc7_;
                     _loc13_ = null;
                     _loc14_ = true;
                     _loc16_ = §§hasnext(_loc15_,_loc8_);
                  }
                  _loc9_ = _loc8_;
                  while(true)
                  {
                     _loc17_ = _loc12_;
                     _loc18_ = _loc7_;
                     _loc19_ = §§hasnext(_loc17_,_loc18_);
                     if(!_loc19_ && _loc13_ != null)
                     {
                        _loc12_ = _loc13_;
                        _loc17_ = _loc12_;
                        _loc7_ = 0;
                        _loc18_ = _loc7_;
                        _loc13_ = null;
                        _loc14_ = true;
                        _loc19_ = §§hasnext(_loc17_,_loc18_);
                     }
                     _loc9_ = _loc18_;
                     if(!_loc19_)
                     {
                        break;
                     }
                     _loc20_ = §§nextname(_loc9_,_loc12_);
                     _loc7_ = _loc9_;
                     if(_loc14_)
                     {
                        _loc20_ = _loc20_.substr(1);
                     }
                     _loc21_ = _loc20_;
                     _loc5_.push(_loc21_);
                  }
                  _loc6_ = _loc5_;
                  _loc22_ = [];
                  _loc12_ = _loc11_.h;
                  _loc13_ = _loc11_.rh;
                  _loc7_ = 0;
                  _loc14_ = false;
                  _loc15_ = _loc12_;
                  _loc8_ = _loc7_;
                  _loc16_ = §§hasnext(_loc15_,_loc8_);
                  if(!_loc16_ && _loc13_ != null)
                  {
                     _loc12_ = _loc13_;
                     _loc15_ = _loc12_;
                     _loc7_ = 0;
                     _loc8_ = _loc7_;
                     _loc13_ = null;
                     _loc14_ = true;
                     _loc16_ = §§hasnext(_loc15_,_loc8_);
                  }
                  _loc9_ = _loc8_;
                  while(true)
                  {
                     _loc17_ = _loc12_;
                     _loc18_ = _loc7_;
                     _loc19_ = §§hasnext(_loc17_,_loc18_);
                     if(!_loc19_ && _loc13_ != null)
                     {
                        _loc12_ = _loc13_;
                        _loc17_ = _loc12_;
                        _loc7_ = 0;
                        _loc18_ = _loc7_;
                        _loc13_ = null;
                        _loc14_ = true;
                        _loc19_ = §§hasnext(_loc17_,_loc18_);
                     }
                     _loc9_ = _loc18_;
                     if(!_loc19_)
                     {
                        break;
                     }
                     _loc20_ = §§nextname(_loc9_,_loc12_);
                     _loc7_ = _loc9_;
                     if(_loc14_)
                     {
                        _loc20_ = _loc20_.substr(1);
                     }
                     _loc21_ = _loc20_;
                     _loc22_.push(_loc21_);
                  }
                  _loc23_ = _loc22_;
                  if(!Utils.equals(_loc6_,_loc23_))
                  {
                     return false;
                  }
                  _loc7_ = 0;
                  while(_loc7_ < int(_loc6_.length))
                  {
                     _loc20_ = _loc6_[_loc7_];
                     _loc7_++;
                     if(!Utils.equals(_loc20_ in StringMap.reserved ? _loc10_.getReserved(_loc20_) : _loc10_.h[_loc20_],_loc20_ in StringMap.reserved ? _loc11_.getReserved(_loc20_) : _loc11_.h[_loc20_]))
                     {
                        return false;
                     }
                  }
                  return true;
               }
               if(param1 is Date)
               {
                  return param1.getTime() == param2.getTime();
               }
               if(param1 is Bytes)
               {
                  return Utils.equals(param1.b,param2.b);
               }
               _loc7_ = 0;
               _loc5_ = Type.getInstanceFields(_loc4_);
               while(_loc7_ < int(_loc5_.length))
               {
                  _loc20_ = _loc5_[_loc7_];
                  _loc7_++;
                  _loc24_ = Reflect.getProperty(param1,_loc20_);
                  _loc25_ = Reflect.getProperty(param2,_loc20_);
                  if(Reflect.isFunction(_loc24_))
                  {
                     if(_loc24_ == null != (_loc25_ == null))
                     {
                        return false;
                     }
                  }
                  else if(!Utils.equals(_loc24_,_loc25_))
                  {
                     return false;
                  }
               }
               return true;
               break;
            case 7:
               _loc4_ = _loc3_.params[0];
               if(int(param1.index) != int(param2.index))
               {
                  return false;
               }
               _loc5_ = Type.enumParameters(param1);
               _loc6_ = Type.enumParameters(param2);
               return Utils.equals(_loc5_,_loc6_);
         }
         _loc7_ = 0;
         _loc5_ = Reflect.fields(param1);
         while(_loc7_ < int(_loc5_.length))
         {
            _loc20_ = _loc5_[_loc7_];
            _loc7_++;
            _loc24_ = Reflect.field(param1,_loc20_);
            _loc25_ = Reflect.field(param2,_loc20_);
            if(Reflect.isFunction(_loc24_))
            {
               if(_loc24_ == null != (_loc25_ == null))
               {
                  return false;
               }
            }
            else if(!Utils.equals(_loc24_,_loc25_))
            {
               return false;
            }
         }
         return true;
      }
   }
}

