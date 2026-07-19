package lime.utils._Assets
{
   import flash.Boot;
   import lime.utils.AssetLibrary;
   import lime.utils.Assets;
   
   public class LibrarySymbol
   {
      
      public var symbolName:String;
      
      public var libraryName:String;
      
      public var library:AssetLibrary;
      
      public function LibrarySymbol(param1:String = undefined)
      {
         if(Boot.skip_constructor)
         {
            return;
         }
         var _loc2_:int = param1.indexOf(":");
         libraryName = param1.substring(0,_loc2_);
         symbolName = param1.substring(_loc2_ + 1);
         library = Assets.getLibrary(libraryName);
      }
      
      public function isLocal(param1:String = undefined) : Boolean
      {
         return library.isLocal(symbolName,param1);
      }
      
      public function exists(param1:String = undefined) : Boolean
      {
         return library.exists(symbolName,param1);
      }
   }
}

