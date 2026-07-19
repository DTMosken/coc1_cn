package classes.bodyParts
{
   import flash.Boot;
   
   public class Udder
   {
      
      public var refill:Number;
      
      public var hasUdder:Boolean;
      
      public var fullness:Number;
      
      public function Udder()
      {
         if(Boot.skip_constructor)
         {
            return;
         }
         refill = 5;
         fullness = 0;
         hasUdder = false;
      }
      
      public function toObject() : Object
      {
         return {
            "hasUdder":hasUdder,
            "fullness":fullness,
            "refill":refill
         };
      }
      
      public function setProps(param1:Object) : void
      {
         if(param1.hasUdder != null)
         {
            hasUdder = param1.hasUdder;
         }
         if(param1.fullness != null)
         {
            fullness = param1.fullness;
         }
         if(param1.refill != null)
         {
            refill = param1.refill;
         }
      }
      
      public function setAllProps(param1:Object) : void
      {
         restore();
         setProps(param1);
      }
      
      public function restore() : void
      {
         hasUdder = false;
         fullness = 0;
         refill = 5;
      }
   }
}

