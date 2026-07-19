package classes.statusEffects
{
   import classes.Creature;
   import classes.DynStat;
   import classes.StatusEffect;
   import classes.StatusEffectType;
   import flash.Boot;
   import lime.utils.Log;
   
   public class TemporaryBuff extends StatusEffect
   {
      
      public var stat4:String;
      
      public var stat3:String;
      
      public var stat2:String;
      
      public var stat1:String;
      
      public function TemporaryBuff(param1:StatusEffectType = undefined, param2:String = undefined, param3:String = undefined, param4:String = undefined, param5:String = undefined)
      {
         if(param3 == null)
         {
            param3 = "";
         }
         if(param4 == null)
         {
            param4 = "";
         }
         if(param5 == null)
         {
            param5 = "";
         }
         if(Boot.skip_constructor)
         {
            return;
         }
         super(param1);
         stat1 = param2;
         stat2 = param3;
         stat3 = param4;
         stat4 = param5;
      }
      
      public function restore() : void
      {
         var _loc5_:* = null as DynStat;
         var _loc1_:Array = [DynStat.NoScale];
         if(stat1 != "")
         {
            _loc1_.push(makeDynStat(stat1,-value1));
         }
         if(stat2 != "")
         {
            _loc1_.push(makeDynStat(stat2,-value2));
         }
         if(stat3 != "")
         {
            _loc1_.push(makeDynStat(stat3,-value3));
         }
         if(stat4 != "")
         {
            _loc1_.push(makeDynStat(stat4,-value4));
         }
         var _loc2_:Array = [];
         var _loc3_:int = 0;
         var _loc4_:Array = _loc1_;
         while(_loc3_ < int(_loc4_.length))
         {
            _loc5_ = _loc4_[_loc3_];
            _loc3_++;
            if(_loc5_ != null)
            {
               _loc2_.push(_loc5_);
            }
         }
         _loc1_ = _loc2_;
         if(int(_loc1_.length) == 0)
         {
            get_host().dynStats(); //unpopped
         }
         else if(int(_loc1_.length) == 1)
         {
            get_host().dynStats(_loc1_[0]); //unpopped
         }
         else if(int(_loc1_.length) == 2)
         {
            get_host().dynStats(_loc1_[0],_loc1_[1]); //unpopped
         }
         else if(int(_loc1_.length) == 3)
         {
            get_host().dynStats(_loc1_[0],_loc1_[1],_loc1_[2]); //unpopped
         }
         else if(int(_loc1_.length) == 4)
         {
            get_host().dynStats(_loc1_[0],_loc1_[1],_loc1_[2],_loc1_[3]); //unpopped
         }
         else if(int(_loc1_.length) == 5)
         {
            get_host().dynStats(_loc1_[0],_loc1_[1],_loc1_[2],_loc1_[3],_loc1_[4]); //unpopped
         }
         else if(int(_loc1_.length) == 6)
         {
            get_host().dynStats(_loc1_[0],_loc1_[1],_loc1_[2],_loc1_[3],_loc1_[4],_loc1_[5]); //unpopped
         }
         else if(int(_loc1_.length) == 7)
         {
            get_host().dynStats(_loc1_[0],_loc1_[1],_loc1_[2],_loc1_[3],_loc1_[4],_loc1_[5],_loc1_[6]); //unpopped
         }
         else if(int(_loc1_.length) == 8)
         {
            get_host().dynStats(_loc1_[0],_loc1_[1],_loc1_[2],_loc1_[3],_loc1_[4],_loc1_[5],_loc1_[6],_loc1_[7]); //unpopped
         }
         else if(int(_loc1_.length) == 9)
         {
            get_host().dynStats(_loc1_[0],_loc1_[1],_loc1_[2],_loc1_[3],_loc1_[4],_loc1_[5],_loc1_[6],_loc1_[7],_loc1_[8]); //unpopped
         }
         else if(int(_loc1_.length) == 10)
         {
            get_host().dynStats(_loc1_[0],_loc1_[1],_loc1_[2],_loc1_[3],_loc1_[4],_loc1_[5],_loc1_[6],_loc1_[7],_loc1_[8],_loc1_[9]); //unpopped
         }
         else if(int(_loc1_.length) == 11)
         {
            get_host().dynStats(_loc1_[0],_loc1_[1],_loc1_[2],_loc1_[3],_loc1_[4],_loc1_[5],_loc1_[6],_loc1_[7],_loc1_[8],_loc1_[9],_loc1_[10]); //unpopped
         }
         else if(int(_loc1_.length) == 12)
         {
            get_host().dynStats(_loc1_[0],_loc1_[1],_loc1_[2],_loc1_[3],_loc1_[4],_loc1_[5],_loc1_[6],_loc1_[7],_loc1_[8],_loc1_[9],_loc1_[10],_loc1_[11]); //unpopped
         }
         else if(int(_loc1_.length) == 13)
         {
            get_host().dynStats(_loc1_[0],_loc1_[1],_loc1_[2],_loc1_[3],_loc1_[4],_loc1_[5],_loc1_[6],_loc1_[7],_loc1_[8],_loc1_[9],_loc1_[10],_loc1_[11],_loc1_[12]); //unpopped
         }
         else if(int(_loc1_.length) == 14)
         {
            get_host().dynStats(_loc1_[0],_loc1_[1],_loc1_[2],_loc1_[3],_loc1_[4],_loc1_[5],_loc1_[6],_loc1_[7],_loc1_[8],_loc1_[9],_loc1_[10],_loc1_[11],_loc1_[12],_loc1_[13]); //unpopped
         }
         else if(int(_loc1_.length) == 15)
         {
            get_host().dynStats(_loc1_[0],_loc1_[1],_loc1_[2],_loc1_[3],_loc1_[4],_loc1_[5],_loc1_[6],_loc1_[7],_loc1_[8],_loc1_[9],_loc1_[10],_loc1_[11],_loc1_[12],_loc1_[13],_loc1_[14]); //unpopped
         }
         else if(int(_loc1_.length) == 16)
         {
            get_host().dynStats(_loc1_[0],_loc1_[1],_loc1_[2],_loc1_[3],_loc1_[4],_loc1_[5],_loc1_[6],_loc1_[7],_loc1_[8],_loc1_[9],_loc1_[10],_loc1_[11],_loc1_[12],_loc1_[13],_loc1_[14],_loc1_[15]); //unpopped
         }
         else if(int(_loc1_.length) == 17)
         {
            get_host().dynStats(_loc1_[0],_loc1_[1],_loc1_[2],_loc1_[3],_loc1_[4],_loc1_[5],_loc1_[6],_loc1_[7],_loc1_[8],_loc1_[9],_loc1_[10],_loc1_[11],_loc1_[12],_loc1_[13],_loc1_[14],_loc1_[15],_loc1_[16]); //unpopped
         }
         else if(int(_loc1_.length) == 18)
         {
            get_host().dynStats(_loc1_[0],_loc1_[1],_loc1_[2],_loc1_[3],_loc1_[4],_loc1_[5],_loc1_[6],_loc1_[7],_loc1_[8],_loc1_[9],_loc1_[10],_loc1_[11],_loc1_[12],_loc1_[13],_loc1_[14],_loc1_[15],_loc1_[16],_loc1_[17]); //unpopped
         }
         else if(int(_loc1_.length) == 19)
         {
            get_host().dynStats(_loc1_[0],_loc1_[1],_loc1_[2],_loc1_[3],_loc1_[4],_loc1_[5],_loc1_[6],_loc1_[7],_loc1_[8],_loc1_[9],_loc1_[10],_loc1_[11],_loc1_[12],_loc1_[13],_loc1_[14],_loc1_[15],_loc1_[16],_loc1_[17],_loc1_[18]); //unpopped
         }
         else
         {
            if(int(_loc1_.length) != 20)
            {
               throw "Too many rest arguments";
            }
            get_host().dynStats(_loc1_[0],_loc1_[1],_loc1_[2],_loc1_[3],_loc1_[4],_loc1_[5],_loc1_[6],_loc1_[7],_loc1_[8],_loc1_[9],_loc1_[10],_loc1_[11],_loc1_[12],_loc1_[13],_loc1_[14],_loc1_[15],_loc1_[16],_loc1_[17],_loc1_[18],_loc1_[19]); //unpopped
         }
         var _loc6_:* = §§pop();
         if(stat1 != "")
         {
            value1 += Reflect.getProperty(_loc6_,stat1);
         }
         if(stat2 != "")
         {
            value2 += Reflect.getProperty(_loc6_,stat2);
         }
         if(stat3 != "")
         {
            value3 += Reflect.getProperty(_loc6_,stat3);
         }
         if(stat4 != "")
         {
            value4 += Reflect.getProperty(_loc6_,stat4);
         }
      }
      
      override public function remove() : void
      {
         super.remove();
      }
      
      override public function onRemove() : void
      {
         super.onRemove();
         restore();
      }
      
      override public function onAttach() : void
      {
         super.onAttach();
         apply(true);
      }
      
      public function makeDynStat(param1:String, param2:Number) : DynStat
      {
         var _loc3_:String = param1;
         if(_loc3_ == "cor")
         {
            return DynStat.Cor(param2);
         }
         if(_loc3_ == "inte")
         {
            return DynStat.Inte(param2);
         }
         if(_loc3_ == "lib")
         {
            return DynStat.Lib(param2);
         }
         if(_loc3_ == "lust")
         {
            return DynStat.Lust(param2);
         }
         if(_loc3_ == "sens")
         {
            return DynStat.Sens(param2);
         }
         if(_loc3_ == "spe")
         {
            return DynStat.Spe(param2);
         }
         if(_loc3_ == "str")
         {
            return DynStat.Str(param2);
         }
         if(_loc3_ == "tou")
         {
            return DynStat.Tou(param2);
         }
         Log.warn("在TemporaryBuff中使用了不正确的statName：" + param1,{
            "fileName":"src/classes/statusEffects/TemporaryBuff.hx",
            "lineNumber":68,
            "className":"classes.statusEffects.TemporaryBuff",
            "methodName":"makeDynStat"
         });
         return null;
      }
      
      public function increase() : void
      {
         if(get_host() == null)
         {
            return;
         }
         apply(false);
      }
      
      public function buffValue(param1:String) : Number
      {
         var _loc2_:Boolean = false;
         var _loc3_:Boolean = false;
         var _loc4_:Boolean = false;
         if(param1 == stat1 == true)
         {
            return value1;
         }
         _loc4_ = param1 == stat2;
         if(_loc4_ == true)
         {
            return value2;
         }
         _loc3_ = param1 == stat3;
         if(_loc3_ == true)
         {
            return value3;
         }
         _loc2_ = param1 == stat4;
         if(_loc2_ == true)
         {
            return value4;
         }
         return 0;
      }
      
      public function buffHost(... rest) : Object
      {
         if(int(rest.length) == 0)
         {
            get_host().dynStats(); //unpopped
         }
         else if(int(rest.length) == 1)
         {
            get_host().dynStats(rest[0]); //unpopped
         }
         else if(int(rest.length) == 2)
         {
            get_host().dynStats(rest[0],rest[1]); //unpopped
         }
         else if(int(rest.length) == 3)
         {
            get_host().dynStats(rest[0],rest[1],rest[2]); //unpopped
         }
         else if(int(rest.length) == 4)
         {
            get_host().dynStats(rest[0],rest[1],rest[2],rest[3]); //unpopped
         }
         else if(int(rest.length) == 5)
         {
            get_host().dynStats(rest[0],rest[1],rest[2],rest[3],rest[4]); //unpopped
         }
         else if(int(rest.length) == 6)
         {
            get_host().dynStats(rest[0],rest[1],rest[2],rest[3],rest[4],rest[5]); //unpopped
         }
         else if(int(rest.length) == 7)
         {
            get_host().dynStats(rest[0],rest[1],rest[2],rest[3],rest[4],rest[5],rest[6]); //unpopped
         }
         else if(int(rest.length) == 8)
         {
            get_host().dynStats(rest[0],rest[1],rest[2],rest[3],rest[4],rest[5],rest[6],rest[7]); //unpopped
         }
         else if(int(rest.length) == 9)
         {
            get_host().dynStats(rest[0],rest[1],rest[2],rest[3],rest[4],rest[5],rest[6],rest[7],rest[8]); //unpopped
         }
         else if(int(rest.length) == 10)
         {
            get_host().dynStats(rest[0],rest[1],rest[2],rest[3],rest[4],rest[5],rest[6],rest[7],rest[8],rest[9]); //unpopped
         }
         else if(int(rest.length) == 11)
         {
            get_host().dynStats(rest[0],rest[1],rest[2],rest[3],rest[4],rest[5],rest[6],rest[7],rest[8],rest[9],rest[10]); //unpopped
         }
         else if(int(rest.length) == 12)
         {
            get_host().dynStats(rest[0],rest[1],rest[2],rest[3],rest[4],rest[5],rest[6],rest[7],rest[8],rest[9],rest[10],rest[11]); //unpopped
         }
         else if(int(rest.length) == 13)
         {
            get_host().dynStats(rest[0],rest[1],rest[2],rest[3],rest[4],rest[5],rest[6],rest[7],rest[8],rest[9],rest[10],rest[11],rest[12]); //unpopped
         }
         else if(int(rest.length) == 14)
         {
            get_host().dynStats(rest[0],rest[1],rest[2],rest[3],rest[4],rest[5],rest[6],rest[7],rest[8],rest[9],rest[10],rest[11],rest[12],rest[13]); //unpopped
         }
         else if(int(rest.length) == 15)
         {
            get_host().dynStats(rest[0],rest[1],rest[2],rest[3],rest[4],rest[5],rest[6],rest[7],rest[8],rest[9],rest[10],rest[11],rest[12],rest[13],rest[14]); //unpopped
         }
         else if(int(rest.length) == 16)
         {
            get_host().dynStats(rest[0],rest[1],rest[2],rest[3],rest[4],rest[5],rest[6],rest[7],rest[8],rest[9],rest[10],rest[11],rest[12],rest[13],rest[14],rest[15]); //unpopped
         }
         else if(int(rest.length) == 17)
         {
            get_host().dynStats(rest[0],rest[1],rest[2],rest[3],rest[4],rest[5],rest[6],rest[7],rest[8],rest[9],rest[10],rest[11],rest[12],rest[13],rest[14],rest[15],rest[16]); //unpopped
         }
         else if(int(rest.length) == 18)
         {
            get_host().dynStats(rest[0],rest[1],rest[2],rest[3],rest[4],rest[5],rest[6],rest[7],rest[8],rest[9],rest[10],rest[11],rest[12],rest[13],rest[14],rest[15],rest[16],rest[17]); //unpopped
         }
         else if(int(rest.length) == 19)
         {
            get_host().dynStats(rest[0],rest[1],rest[2],rest[3],rest[4],rest[5],rest[6],rest[7],rest[8],rest[9],rest[10],rest[11],rest[12],rest[13],rest[14],rest[15],rest[16],rest[17],rest[18]); //unpopped
         }
         else
         {
            if(int(rest.length) != 20)
            {
               throw "Too many rest arguments";
            }
            get_host().dynStats(rest[0],rest[1],rest[2],rest[3],rest[4],rest[5],rest[6],rest[7],rest[8],rest[9],rest[10],rest[11],rest[12],rest[13],rest[14],rest[15],rest[16],rest[17],rest[18],rest[19]); //unpopped
         }
         var _loc3_:* = §§pop();
         if(stat1 != "")
         {
            value1 += Reflect.getProperty(_loc3_,stat1);
         }
         if(stat2 != "")
         {
            value2 += Reflect.getProperty(_loc3_,stat2);
         }
         if(stat3 != "")
         {
            value3 += Reflect.getProperty(_loc3_,stat3);
         }
         if(stat4 != "")
         {
            value4 += Reflect.getProperty(_loc3_,stat4);
         }
         return _loc3_;
      }
      
      public function apply(param1:Boolean) : void
      {
      }
   }
}

