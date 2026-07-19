package classes.bodyParts
{
   import classes.Creature;
   import classes.internals.Utils;
   import flash.Boot;
   
   public class Arms
   {
      
      public static var HUMAN:int = 0;
      
      public static var HARPY:int = 1;
      
      public static var SPIDER:int = 2;
      
      public static var BEE:int = 3;
      
      public static var PREDATOR:int = 4;
      
      public static var SALAMANDER:int = 5;
      
      public static var WOLF:int = 6;
      
      public static var COCKATRICE:int = 7;
      
      public static var RED_PANDA:int = 8;
      
      public static var FERRET:int = 9;
      
      public static var CAT:int = 10;
      
      public static var DOG:int = 11;
      
      public static var FOX:int = 12;
      
      public static var DRAGON:int = 13;
      
      public static var LIZARD:int = 14;
      
      public static var GNOLL:int = 15;
      
      public var type:int;
      
      public var claws:Claws;
      
      public var _creature:Creature;
      
      public function Arms(param1:Creature = undefined)
      {
         if(Boot.skip_constructor)
         {
            return;
         }
         claws = new Claws();
         type = 0;
         _creature = param1;
         claws.setCreature(param1);
      }
      
      public function updateClaws(param1:int = 0) : String
      {
         var _loc4_:* = null as String;
         var _loc2_:String = "";
         var _loc3_:String = claws.tone;
         switch(param1)
         {
            case 1:
               _loc4_ = _creature.skin.tone;
               if(_loc4_ == "black")
               {
                  _loc2_ = "深灰色";
               }
               else if(_loc4_ == "blue")
               {
                  _loc2_ = "偏蓝的";
               }
               else if(_loc4_ == "desert-camo")
               {
                  _loc2_ = "浅黄色的";
               }
               else if(_loc4_ == "gray-camo")
               {
                  _loc2_ = "灰色";
               }
               else if(_loc4_ == "green")
               {
                  _loc2_ = "偏绿的";
               }
               else if(_loc4_ == "orange")
               {
                  _loc2_ = "橙色";
               }
               else if(_loc4_ == "pink")
               {
                  _loc2_ = "粉色";
               }
               else if(_loc4_ == "purple")
               {
                  _loc2_ = "微紫色";
               }
               else if(_loc4_ == "red")
               {
                  _loc2_ = "微红色";
               }
               else if(_loc4_ == "silver")
               {
                  _loc2_ = "银色";
               }
               else if(_loc4_ == "white")
               {
                  _loc2_ = "浅灰色的";
               }
               else if(_loc4_ == "yellow")
               {
                  _loc2_ = "微黄色的";
               }
               else
               {
                  _loc2_ = "灰色";
               }
               break;
            case 2:
               _loc2_ = "钢灰色";
               break;
            case 3:
               _loc2_ = "火红色";
               break;
            case 8:
               if(_creature != null)
               {
                  _loc2_ = _creature.skin.tone;
               }
               break;
            default:
               _loc2_ = "";
         }
         claws.set_type(param1);
         claws.tone = _loc2_;
         return _loc3_;
      }
      
      public function set_type(param1:int) : int
      {
         type = param1;
         if(_creature != null)
         {
            _creature.updateUnarmed();
         }
         return param1;
      }
      
      public function setType(param1:int, param2:int = 0) : void
      {
         set_type(param1);
         switch(param1)
         {
            case 4:
               updateClaws(param2);
               break;
            case 5:
               updateClaws(3);
               break;
            case 6:
               updateClaws(12);
               break;
            case 7:
               updateClaws(9);
               break;
            case 8:
               updateClaws(10);
               break;
            case 9:
               updateClaws(11);
               break;
            case 10:
               updateClaws(4);
               break;
            case 11:
               updateClaws(5);
               break;
            case 12:
               updateClaws(6);
               break;
            case 13:
               updateClaws(2);
               break;
            case 14:
               updateClaws(1);
               break;
            default:
               updateClaws(param2);
         }
      }
      
      public function restore() : void
      {
         set_type(0);
         claws.restore();
      }
      
      public function phrase() : String
      {
         var _loc1_:String = "手臂";
         var _loc2_:String = adj();
         if(_loc2_ != "")
         {
            _loc1_ = _loc2_ + " " + _loc1_;
         }
         return _loc1_;
      }
      
      public function adj() : String
      {
         var _loc2_:* = null as Array;
         var _loc1_:String = "";
         switch(type)
         {
            case 1:
               _loc2_ = ["长满羽毛的","羽毛状的"];
               _loc1_ = _loc2_[Utils.rand(int(_loc2_.length))];
               break;
            case 2:
               _loc1_ = "甲壳状的";
               break;
            case 3:
               _loc1_ = "甲壳状的";
               break;
            case 5:
               _loc2_ = ["长满鳞片的","有鳞的"];
               _loc1_ = _loc2_[Utils.rand(int(_loc2_.length))];
               break;
            case 6:
               _loc1_ = "毛茸茸的";
               break;
            case 7:
               _loc1_ = "长着鳞片和羽毛的";
               break;
            case 8:
               _loc1_ = "蓬松的";
               break;
            case 9:
               _loc2_ = ["蓬松的","毛茸茸的"];
               _loc1_ = _loc2_[Utils.rand(int(_loc2_.length))];
               break;
            case 10:
               _loc1_ = "毛茸茸的";
               break;
            case 11:
               _loc1_ = "毛茸茸的";
               break;
            case 12:
               _loc1_ = "毛茸茸的";
               break;
            case 13:
               _loc2_ = ["长满鳞片的","有鳞的"];
               _loc1_ = _loc2_[Utils.rand(int(_loc2_.length))];
               break;
            case 14:
               _loc2_ = ["长满鳞片的","有鳞的"];
               _loc1_ = _loc2_[Utils.rand(int(_loc2_.length))];
         }
         return _loc1_;
      }
   }
}

