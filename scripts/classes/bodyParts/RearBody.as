package classes.bodyParts
{
   import flash.Boot;
   
   public class RearBody extends BaseBodyPart
   {
      
      public static var NONE:int = 0;
      
      public static var DRACONIC_MANE:int = 1;
      
      public static var DRACONIC_SPIKES:int = 2;
      
      public static var SHARK_FIN:int = 3;
      
      public static var BARK:int = 4;
      
      public var type:int;
      
      public var color:String;
      
      public function RearBody()
      {
         if(Boot.skip_constructor)
         {
            return;
         }
         color = "no";
         type = 0;
      }
      
      public function toObject() : Object
      {
         return {
            "type":type,
            "color":color
         };
      }
      
      public function setProps(param1:Object) : void
      {
         if(param1.type != null)
         {
            type = param1.type;
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
         color = "no";
      }
      
      override public function hasDyeColor(param1:String) : Boolean
      {
         return color == param1;
      }
      
      override public function canDye() : Boolean
      {
         return type == 1;
      }
      
      override public function applyDye(param1:String) : void
      {
         color = param1;
      }
   }
}

