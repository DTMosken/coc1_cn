package classes
{
   import classes.internals.Serializable;
   import classes.internals.Utils;
   import flash.Boot;
   
   public final class Cock implements Serializable
   {
      
      public static var MAX_LENGTH:Number = 9999.9;
      
      public static var MAX_THICKNESS:Number = 999.9;
      
      public static var KNOTMULTIPLIER_NO_KNOT:Number = 1;
      
      public var sock:String;
      
      public var pierced:Number;
      
      public var pShortDesc:String;
      
      public var pLongDesc:String;
      
      public var knotMultiplier:Number;
      
      public var cockThickness:Number;
      
      public var cockLength:Number;
      
      public var _cockType:CockTypesEnum;
      
      public function Cock(param1:Number = 5.5, param2:Number = 1, param3:CockTypesEnum = undefined)
      {
         if(Boot.skip_constructor)
         {
            return;
         }
         if(param3 == null)
         {
            param3 = CockTypesEnum.HUMAN;
         }
         cockLength = param1;
         cockThickness = param2;
         _cockType = param3;
         pierced = 0;
         knotMultiplier = 1;
         pShortDesc = "";
         pLongDesc = "";
         sock = "";
      }
      
      public static function supportsKnot(param1:CockTypesEnum) : Boolean
      {
         return Boolean([CockTypesEnum.DOG,CockTypesEnum.FOX,CockTypesEnum.WOLF,CockTypesEnum.DRAGON,CockTypesEnum.DISPLACER].contains(param1));
      }
      
      public function validate() : String
      {
         var _loc1_:String = "";
         _loc1_ += Utils.validateNonNegativeNumberFields(this,"Cock.validate",["cockLength","cockThickness","knotMultiplier","pierced"]);
         if(!get_isPierced())
         {
            if(pShortDesc.length > 0)
            {
               _loc1_ += "未穿孔但 _pShortDesc = " + pShortDesc + "。";
            }
            if(pLongDesc.length > 0)
            {
               _loc1_ += "未穿孔但 pLong = " + pLongDesc + "。";
            }
         }
         else
         {
            if(pShortDesc.length == 0)
            {
               _loc1_ += "已穿孔但没有 _pShortDesc。";
            }
            if(pLongDesc.length == 0)
            {
               _loc1_ += "有穿孔但没有 pLong。";
            }
         }
         return _loc1_;
      }
      
      public function thickenCock(param1:Number, param2:Boolean = false) : Number
      {
         var _loc3_:Number = 0;
         var _loc4_:Number = 0;
         if(param1 > 0)
         {
            while(param1 > 0)
            {
               if(param1 < 1)
               {
                  _loc4_ = param1;
               }
               else
               {
                  _loc4_ = 1;
               }
               if(!param2)
               {
                  if(cockThickness > 1 && cockLength < 12)
                  {
                     _loc4_ /= 4;
                  }
                  if(cockThickness > 1.5 && cockLength < 18)
                  {
                     _loc4_ /= 5;
                  }
                  if(cockThickness > 2 && cockLength < 24)
                  {
                     _loc4_ /= 5;
                  }
                  if(cockThickness > 3 && cockLength < 30)
                  {
                     _loc4_ /= 5;
                  }
                  if(cockThickness > cockLength * 0.15)
                  {
                     _loc4_ /= 3;
                  }
                  if(cockThickness > cockLength * 0.2)
                  {
                     _loc4_ /= 3;
                  }
                  if(cockThickness > cockLength * 0.3)
                  {
                     _loc4_ /= 5;
                  }
                  if(cockThickness > 4)
                  {
                     _loc4_ /= 2;
                  }
                  if(cockThickness > 5)
                  {
                     _loc4_ /= 2;
                  }
                  if(cockThickness > 6)
                  {
                     _loc4_ /= 2;
                  }
                  if(cockThickness > 7)
                  {
                     _loc4_ /= 2;
                  }
               }
               _loc3_ += _loc4_;
               cockThickness += _loc4_;
               _loc4_ = 0;
               param1--;
            }
            param1 = 0;
         }
         else if(param1 < 0)
         {
            while(param1 < 0)
            {
               _loc4_ = -1;
               if(!param2)
               {
                  if(cockThickness <= 1)
                  {
                     _loc4_ /= 2;
                  }
                  if(cockThickness < 2 && cockLength < 10)
                  {
                     _loc4_ /= 2;
                  }
                  if(cockThickness < 3 && cockLength < 18)
                  {
                     _loc4_ /= 2;
                  }
                  if(cockThickness < 4 && cockLength < 24)
                  {
                     _loc4_ /= 2;
                  }
                  if(cockThickness <= 0.5)
                  {
                     _loc4_ = 0;
                  }
               }
               _loc3_ += _loc4_;
               cockThickness += _loc4_;
               _loc4_ = 0;
               param1++;
            }
         }
         return _loc3_;
      }
      
      public function set_cockType(param1:CockTypesEnum) : CockTypesEnum
      {
         _cockType = param1;
         if(!Cock.supportsKnot(param1) && knotMultiplier != 1)
         {
            knotMultiplier = 1;
         }
         return param1;
      }
      
      public function serialize(param1:*) : void
      {
         param1.cockThickness = cockThickness;
         param1.cockLength = cockLength;
         param1.cockType = get_cockType().get_Index();
         param1.knotMultiplier = knotMultiplier;
         param1.pierced = pierced;
         param1.pShortDesc = pShortDesc;
         param1.pLongDesc = pLongDesc;
         param1.sock = sock;
      }
      
      public function hasSheath() : Boolean
      {
         return [CockTypesEnum.CAT,CockTypesEnum.DISPLACER,CockTypesEnum.DOG,CockTypesEnum.WOLF,CockTypesEnum.FOX,CockTypesEnum.HORSE,CockTypesEnum.KANGAROO,CockTypesEnum.AVIAN,CockTypesEnum.ECHIDNA,CockTypesEnum.RED_PANDA,CockTypesEnum.FERRET].indexOf(get_cockType()) != -1;
      }
      
      public function hasKnot() : Boolean
      {
         return knotMultiplier > 1;
      }
      
      public function growCock(param1:Number, param2:Boolean) : Number
      {
         if(param1 == 0)
         {
            return param1;
         }
         var _loc3_:int = 0;
         if(param1 > 0)
         {
            _loc3_ = 24;
            if(param2)
            {
               param1 *= 1.5;
               _loc3_ += 12;
            }
            if(get_cockType() != CockTypesEnum.HUMAN)
            {
               _loc3_ *= 2;
            }
            if(sock == "scarlet")
            {
               param1 *= 1.5;
            }
            else if(sock == "cobalt")
            {
               param1 *= 0.5;
            }
            if(cockLength > _loc3_)
            {
               param1 /= 4;
            }
            else if(cockLength > _loc3_ / 2)
            {
               param1 /= 2;
            }
         }
         else
         {
            _loc3_ = 0;
            if(param2)
            {
               param1 *= 0.5;
               _loc3_ += 12;
            }
            if(get_cockType() != CockTypesEnum.HUMAN)
            {
               _loc3_ += 12;
            }
            if(sock == "scarlet")
            {
               param1 *= 0.5;
            }
            else if(sock == "cobalt")
            {
               param1 *= 1.5;
            }
            if(cockLength < _loc3_)
            {
               param1 /= 3;
            }
            else if(cockLength < _loc3_ / 2)
            {
               param1 /= 2;
            }
         }
         cockLength += param1;
         if(cockLength < 1)
         {
            cockLength = 1;
         }
         if(cockThickness > cockLength * 0.33)
         {
            cockThickness = cockLength * 0.33;
         }
         return param1;
      }
      
      public function get_knotThickness() : Number
      {
         return cockThickness * knotMultiplier;
      }
      
      public function get_isPierced() : Boolean
      {
         return pierced > 0;
      }
      
      public function get_cockType() : CockTypesEnum
      {
         return _cockType;
      }
      
      public function deserialize(param1:*) : void
      {
         cockThickness = param1.cockThickness;
         cockLength = param1.cockLength;
         set_cockType(CockTypesEnum.ParseConstantByIndex(param1.cockType));
         knotMultiplier = param1.knotMultiplier;
         sock = param1.sock;
         pierced = param1.pierced;
         pShortDesc = param1.pShortDesc;
         pLongDesc = param1.pLongDesc;
         if(cockLength > 9999.9)
         {
            cockLength = 9999.9;
         }
         if(cockThickness > 999.9)
         {
            cockThickness = 999.9;
         }
      }
      
      public function cArea() : Number
      {
         return cockThickness * cockLength;
      }
   }
}

