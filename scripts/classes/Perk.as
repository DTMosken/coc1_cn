package classes
{
   import flash.Boot;
   
   public class Perk
   {
      
      public var value4:Number;
      
      public var value3:Number;
      
      public var value2:Number;
      
      public var value1:Number;
      
      public var _ptype:PerkType;
      
      public function Perk(param1:PerkType = undefined, param2:Number = 0, param3:Number = 0, param4:Number = 0, param5:Number = 0)
      {
         if(Boot.skip_constructor)
         {
            return;
         }
         value4 = Number(Math.NaN);
         value3 = Number(Math.NaN);
         value2 = Number(Math.NaN);
         value1 = Number(Math.NaN);
         _ptype = param1;
         value1 = param2;
         value2 = param3;
         value3 = param4;
         value4 = param5;
      }
      
      public function get_ptype() : PerkType
      {
         return _ptype;
      }
      
      public function get_perkName() : String
      {
         return _ptype.get_name();
      }
      
      public function get_perkLongDesc() : String
      {
         return _ptype.get_longDesc();
      }
      
      public function get_perkDesc() : String
      {
         return _ptype.desc(this);
      }
   }
}

