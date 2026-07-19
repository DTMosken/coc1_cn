package classes.bodyParts
{
   import flash.Boot;
   
   public class UnderBody
   {
      
      public static var NONE:int = 0;
      
      public static var REPTILE:int = 1;
      
      public static var DRAGON:int = 2;
      
      public static var FURRY:int = 3;
      
      public static var NAGA:int = 4;
      
      public static var WOOL:int = 5;
      
      public static var COCKATRICE:int = 6;
      
      public static var MERMAID:int = 7;
      
      public var type:int;
      
      public var skin:Skin;
      
      public function UnderBody()
      {
         if(Boot.skip_constructor)
         {
            return;
         }
         skin = new Skin();
         type = 0;
      }
      
      public function toObject() : Object
      {
         return {
            "type":type,
            "skin":skin.toObject()
         };
      }
      
      public function skinFurScales() : String
      {
         return skin.skinFurScales();
      }
      
      public function skinDescription() : String
      {
         return skin.description();
      }
      
      public function setProps(param1:Object) : void
      {
         if(param1.type != null)
         {
            type = param1.type;
         }
         if(param1.skin != null)
         {
            skin.setProps(param1.skin);
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
         skin.restore(param1);
      }
   }
}

