package _Xml
{
   public final class XmlType_Impl_
   {
      
      public function XmlType_Impl_()
      {
      }
      
      public static function toString(param1:int) : String
      {
         switch(param1)
         {
            case 0:
               return "Element";
            case 1:
               return "PCData";
            case 2:
               return "CData";
            case 3:
               return "Comment";
            case 4:
               return "DocType";
            case 5:
               return "ProcessingInstruction";
            case 6:
               return "Document";
            default:
               return;
         }
      }
   }
}

