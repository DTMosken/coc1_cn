package classes.items
{
   import classes.ItemType;
   
   public class ItemTypeSetup
   {
      
      public function ItemTypeSetup()
      {
      }
      
      public static function setHeader(param1:ItemType, param2:String) : ItemType
      {
         param1._headerName = param2;
         return param1;
      }
      
      public static function markPlural(param1:ItemType) : ItemType
      {
         param1._plural = true;
         return param1;
      }
      
      public static function singularForm(param1:ItemType, param2:String) : ItemType
      {
         param1._singular = param2;
         return param1;
      }
   }
}

