package openfl.utils
{
   import flash.display.BitmapData;
   import flash.media.Sound;
   import flash.text.Font;
   
   public interface IAssetCache
   {
      
      function set_enabled(param1:Boolean) : Boolean;
      
      function setSound(param1:String, param2:Sound) : void;
      
      function setFont(param1:String, param2:Font) : void;
      
      function setBitmapData(param1:String, param2:BitmapData) : void;
      
      function removeSound(param1:String) : Boolean;
      
      function removeFont(param1:String) : Boolean;
      
      function removeBitmapData(param1:String) : Boolean;
      
      function hasSound(param1:String) : Boolean;
      
      function hasFont(param1:String) : Boolean;
      
      function hasBitmapData(param1:String) : Boolean;
      
      function get_enabled() : Boolean;
      
      function getSound(param1:String) : Sound;
      
      function getFont(param1:String) : Font;
      
      function getBitmapData(param1:String) : BitmapData;
      
      function clear(param1:String = undefined) : void;
   }
}

