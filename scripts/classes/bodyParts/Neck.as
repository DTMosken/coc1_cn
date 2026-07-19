package classes.bodyParts
{
   import flash.Boot;
   
   public class Neck extends BaseBodyPart
   {
      
      public static var NORMAL:int = 0;
      
      public static var DRACONIC:int = 1;
      
      public static var COCKATRICE:int = 2;
      
      public var type:int;
      
      public var pos:Boolean;
      
      public var len:Number;
      
      public var color:String;
      
      public var _nlMax:Array;
      
      public function Neck()
      {
         if(Boot.skip_constructor)
         {
            return;
         }
         _nlMax = [];
         color = "no";
         pos = false;
         len = 2;
         type = 0;
         _nlMax[0] = 2;
         _nlMax[1] = 30;
      }
      
      public function toObject() : Object
      {
         return {
            "type":type,
            "len":len,
            "pos":pos,
            "color":color
         };
      }
      
      public function setProps(param1:Object) : void
      {
         if(param1.type != null)
         {
            type = param1.type;
         }
         if(param1.len != null)
         {
            len = param1.len;
         }
         if(param1.pos != null)
         {
            pos = param1.pos;
         }
         if(param1.color != null)
         {
            color = param1.color;
         }
      }
      
      public function setAllProps(param1:Object) : void
      {
         restore();
         setProps(param1);
      }
      
      public function restore() : void
      {
         type = 0;
         len = 2;
         pos = false;
         color = "no";
      }
      
      public function modify(param1:Number, param2:int = -1) : void
      {
         if(param2 != -1)
         {
            type = param2;
         }
         if(_nlMax[type] == null)
         {
            pos = false;
            len = 2;
            return;
         }
         len += param1;
         if(len < 2)
         {
            len = 2;
         }
         if(len > _nlMax[type])
         {
            len = _nlMax[type];
         }
      }
      
      public function isFullyGrown() : Boolean
      {
         return len >= _nlMax[type];
      }
      
      override public function hasDyeColor(param1:String) : Boolean
      {
         return color == param1;
      }
      
      public function get_nlMax() : Array
      {
         return _nlMax;
      }
      
      override public function canDye() : Boolean
      {
         return type == 2;
      }
      
      override public function applyDye(param1:String) : void
      {
         color = param1;
      }
   }
}

