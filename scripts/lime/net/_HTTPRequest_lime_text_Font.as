package lime.net
{
   import flash.Boot;
   import haxe.io.Bytes;
   import lime.text.Font;
   
   public class _HTTPRequest_lime_text_Font extends _HTTPRequest_Bytes
   {
      
      public function _HTTPRequest_lime_text_Font(param1:String = undefined)
      {
         if(Boot.skip_constructor)
         {
            return;
         }
         super(param1);
      }
      
      override public function fromBytes(param1:Bytes) : Object
      {
         return Font.fromBytes(param1);
      }
   }
}

