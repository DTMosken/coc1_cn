package classes.bodyParts
{
   import classes.Appearance;
   import classes.internals.Utils;
   import flash.Boot;
   
   public class Skin
   {
      
      public static var PLAIN:int = 0;
      
      public static var FUR:int = 1;
      
      public static var LIZARD_SCALES:int = 2;
      
      public static var GOO:int = 3;
      
      public static var UNDEFINED:int = 4;
      
      public static var DRAGON_SCALES:int = 5;
      
      public static var FISH_SCALES:int = 6;
      
      public static var WOOL:int = 7;
      
      public static var FEATHERED:int = 8;
      
      public static var STALK:int = 10;
      
      public static var WOODEN:int = 11;
      
      public var type:int;
      
      public var tone:String;
      
      public var furColor:String;
      
      public var desc:String;
      
      public var adj:String;
      
      public function Skin()
      {
         if(Boot.skip_constructor)
         {
            return;
         }
         furColor = "no";
         adj = "";
         desc = "skin";
         tone = "albino";
         type = 0;
      }
      
      public function toObject() : Object
      {
         return {
            "type":type,
            "tone":tone,
            "desc":desc,
            "adj":adj,
            "furColor":furColor
         };
      }
      
      public function skinFurScales() : String
      {
         var _loc1_:String = "";
         if(adj != "")
         {
            _loc1_ += Utils.cnName(adj) + "，";
         }
         _loc1_ += isFluffy() ? furColor : Utils.cnName(tone);
         return _loc1_ + "" + Utils.cnName(desc);
      }
      
      public function setType(param1:int) : void
      {
         desc = Appearance.DEFAULT_SKIN_DESCS.h[param1];
         type = param1;
      }
      
      public function setProps(param1:Object) : void
      {
         if(param1.type != null)
         {
            type = param1.type;
         }
         if(param1.tone != null)
         {
            tone = param1.tone;
         }
         if(param1.desc != null)
         {
            desc = param1.desc;
         }
         if(param1.adj != null)
         {
            adj = param1.adj;
         }
         if(param1.furColor != null)
         {
            furColor = param1.furColor;
         }
      }
      
      public function setAllProps(param1:Object, param2:Boolean = true) : void
      {
         restore(param2);
         setProps(param1);
      }
      
      public function restore(param1:Boolean = true) : void
      {
         type = 0;
         if(!param1)
         {
            tone = "albino";
         }
         desc = "skin";
         adj = "";
         furColor = "no";
      }
      
      public function isFurry() : Boolean
      {
         return [1,7].indexOf(type) != -1;
      }
      
      public function isFluffy() : Boolean
      {
         return [1,7,8].indexOf(type) != -1;
      }
      
      public function hasWool() : Boolean
      {
         return type == 7;
      }
      
      public function hasFur() : Boolean
      {
         return type == 1;
      }
      
      public function hasFeathers() : Boolean
      {
         return type == 8;
      }
      
      public function description(param1:Boolean = false, param2:Boolean = false) : String
      {
         var _loc3_:String = "";
         if(!param1 && adj != "" && !param2 && tone != "rough gray")
         {
            _loc3_ += Utils.cnName(adj) + "，";
         }
         if(!param2)
         {
            _loc3_ += Utils.cnName(tone) + "";
         }
         return _loc3_ + (isFluffy() ? "皮肤" : Utils.cnName(desc));
      }
   }
}

