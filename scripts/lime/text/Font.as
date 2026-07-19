package lime.text
{
   import flash.Boot;
   import haxe.IMap;
   import haxe.io.Bytes;
   import lime.app.Future;
   import lime.app.Promise_lime_text_Font;
   import lime.graphics.Image;
   import lime.net._HTTPRequest_lime_text_Font;
   import lime.utils.Assets;
   
   public class Font
   {
      
      public var unitsPerEM:int;
      
      public var underlineThickness:int;
      
      public var underlinePosition:int;
      
      public var strikethroughThickness:int;
      
      public var strikethroughPosition:int;
      
      public var src:*;
      
      public var numGlyphs:int;
      
      public var name:String;
      
      public var height:int;
      
      public var descender:int;
      
      public var ascender:int;
      
      public var __init:Boolean;
      
      public var __fontPath:String;
      
      public var __fontID:String;
      
      public function Font(param1:String = undefined)
      {
         if(Boot.skip_constructor)
         {
            return;
         }
         if(param1 != null)
         {
            name = param1;
         }
         if(!__init)
         {
            ascender = 0;
            descender = 0;
            height = 0;
            numGlyphs = 0;
            underlinePosition = 0;
            underlineThickness = 0;
            unitsPerEM = 0;
            if(__fontID != null)
            {
               if(Assets.isLocal(__fontID))
               {
                  __fromBytes(Assets.getBytes(__fontID));
               }
            }
            else if(__fontPath != null)
            {
               __fromFile(__fontPath);
            }
         }
      }
      
      public static function fromBytes(param1:Bytes) : Font
      {
         if(param1 == null)
         {
            return null;
         }
         var _loc2_:Font = new Font();
         _loc2_.__fromBytes(param1);
         return _loc2_;
      }
      
      public static function fromFile(param1:String) : Font
      {
         if(param1 == null)
         {
            return null;
         }
         var _loc2_:Font = new Font();
         _loc2_.__fromFile(param1);
         return _loc2_;
      }
      
      public static function loadFromBytes(param1:Bytes) : Future
      {
         return Future.withValue(Font.fromBytes(param1));
      }
      
      public static function loadFromFile(param1:String) : Future
      {
         var _loc2_:_HTTPRequest_lime_text_Font = new _HTTPRequest_lime_text_Font();
         return _loc2_.load(param1).then(function(param1:Font):Future
         {
            if(param1 != null)
            {
               return Future.withValue(param1);
            }
            return Future.withError("");
         });
      }
      
      public static function loadFromName(param1:String) : Future
      {
         return Future.withError("");
      }
      
      public function renderGlyphs(param1:Array, param2:int) : IMap
      {
         return null;
      }
      
      public function renderGlyph(param1:int, param2:int) : Image
      {
         return null;
      }
      
      public function getGlyphs(param1:String = undefined) : Array
      {
         if(param1 == null)
         {
            param1 = "abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789!@#$%^`\'\"/\\&*()[]{}<>|:;_-+=?,. ";
         }
         return null;
      }
      
      public function getGlyphMetrics(param1:int) : GlyphMetrics
      {
         return null;
      }
      
      public function getGlyph(param1:String) : int
      {
         return -1;
      }
      
      public function decompose() : Object
      {
         return null;
      }
      
      public function __setSize(param1:int, param2:int = 72) : void
      {
      }
      
      public function __loadFromName(param1:String) : Future
      {
         var _loc2_:Promise_lime_text_Font = new Promise_lime_text_Font();
         _loc2_.error("");
         return _loc2_.future;
      }
      
      public function __initializeSource() : void
      {
         __init = true;
      }
      
      public function __fromFile(param1:String) : void
      {
         __fontPath = param1;
      }
      
      public function __fromBytes(param1:Bytes) : void
      {
         __fontPath = null;
      }
      
      public function __copyFrom(param1:Font) : void
      {
         if(param1 != null)
         {
            ascender = param1.ascender;
            descender = param1.descender;
            height = param1.height;
            name = param1.name;
            numGlyphs = param1.numGlyphs;
            src = param1.src;
            underlinePosition = param1.underlinePosition;
            underlineThickness = param1.underlineThickness;
            unitsPerEM = param1.unitsPerEM;
            __fontID = param1.__fontID;
            __fontPath = param1.__fontPath;
            __init = true;
         }
      }
   }
}

