package
{
   import _Xml.XmlType_Impl_;
   import flash.Boot;
   import haxe.Exception;
   import haxe.IMap;
   import haxe.ds.StringMap;
   import haxe.ds._StringMap.StringMapKeysIterator;
   import haxe.iterators.ArrayIterator;
   import haxe.xml.Parser;
   import haxe.xml.Printer;
   
   public class Xml
   {
      
      public static var init__:Boolean;
      
      public static var Element:int;
      
      public static var PCData:int;
      
      public static var CData:int;
      
      public static var Comment:int;
      
      public static var DocType:int;
      
      public static var ProcessingInstruction:int;
      
      public static var Document:int;
      
      public var parent:Xml;
      
      public var nodeValue:String;
      
      public var nodeType:int;
      
      public var nodeName:String;
      
      public var children:Array;
      
      public var attributeMap:IMap;
      
      public function Xml(param1:int = 0)
      {
         if(Boot.skip_constructor)
         {
            return;
         }
         nodeType = param1;
         children = [];
         attributeMap = new StringMap();
      }
      
      public static function parse(param1:String) : Xml
      {
         return Parser.parse(param1);
      }
      
      public static function createElement(param1:String) : Xml
      {
         var _loc2_:Xml = new Xml(Xml.Element);
         if(_loc2_.nodeType != Xml.Element)
         {
            throw Exception.thrown("Bad node type, expected Element but found " + XmlType_Impl_.toString(_loc2_.nodeType));
         }
         _loc2_.nodeName = param1;
         return _loc2_;
      }
      
      public static function createPCData(param1:String) : Xml
      {
         var _loc2_:Xml = new Xml(Xml.PCData);
         if(_loc2_.nodeType == Xml.Document || _loc2_.nodeType == Xml.Element)
         {
            throw Exception.thrown("Bad node type, unexpected " + XmlType_Impl_.toString(_loc2_.nodeType));
         }
         _loc2_.nodeValue = param1;
         return _loc2_;
      }
      
      public static function createCData(param1:String) : Xml
      {
         var _loc2_:Xml = new Xml(Xml.CData);
         if(_loc2_.nodeType == Xml.Document || _loc2_.nodeType == Xml.Element)
         {
            throw Exception.thrown("Bad node type, unexpected " + XmlType_Impl_.toString(_loc2_.nodeType));
         }
         _loc2_.nodeValue = param1;
         return _loc2_;
      }
      
      public static function createComment(param1:String) : Xml
      {
         var _loc2_:Xml = new Xml(Xml.Comment);
         if(_loc2_.nodeType == Xml.Document || _loc2_.nodeType == Xml.Element)
         {
            throw Exception.thrown("Bad node type, unexpected " + XmlType_Impl_.toString(_loc2_.nodeType));
         }
         _loc2_.nodeValue = param1;
         return _loc2_;
      }
      
      public static function createDocType(param1:String) : Xml
      {
         var _loc2_:Xml = new Xml(Xml.DocType);
         if(_loc2_.nodeType == Xml.Document || _loc2_.nodeType == Xml.Element)
         {
            throw Exception.thrown("Bad node type, unexpected " + XmlType_Impl_.toString(_loc2_.nodeType));
         }
         _loc2_.nodeValue = param1;
         return _loc2_;
      }
      
      public static function createProcessingInstruction(param1:String) : Xml
      {
         var _loc2_:Xml = new Xml(Xml.ProcessingInstruction);
         if(_loc2_.nodeType == Xml.Document || _loc2_.nodeType == Xml.Element)
         {
            throw Exception.thrown("Bad node type, unexpected " + XmlType_Impl_.toString(_loc2_.nodeType));
         }
         _loc2_.nodeValue = param1;
         return _loc2_;
      }
      
      public static function createDocument() : Xml
      {
         return new Xml(Xml.Document);
      }
      
      public function toString() : String
      {
         return Printer.print(this);
      }
      
      public function set(param1:String, param2:String) : void
      {
         if(nodeType != Xml.Element)
         {
            throw Exception.thrown("Bad node type, expected Element but found " + XmlType_Impl_.toString(nodeType));
         }
         var _loc3_:StringMap = attributeMap;
         if(param1 in StringMap.reserved)
         {
            _loc3_.setReserved(param1,param2);
         }
         else
         {
            _loc3_.h[param1] = param2;
         }
      }
      
      public function removeChild(param1:Xml) : Boolean
      {
         if(nodeType != Xml.Document && nodeType != Xml.Element)
         {
            throw Exception.thrown("Bad node type, expected Element or Document but found " + XmlType_Impl_.toString(nodeType));
         }
         if(Boolean(children.remove(param1)))
         {
            param1.parent = null;
            return true;
         }
         return false;
      }
      
      public function get(param1:String) : String
      {
         if(nodeType != Xml.Element)
         {
            throw Exception.thrown("Bad node type, expected Element but found " + XmlType_Impl_.toString(nodeType));
         }
         var _loc2_:StringMap = attributeMap;
         if(param1 in StringMap.reserved)
         {
            return _loc2_.getReserved(param1);
         }
         return _loc2_.h[param1];
      }
      
      public function exists(param1:String) : Boolean
      {
         if(nodeType != Xml.Element)
         {
            throw Exception.thrown("Bad node type, expected Element but found " + XmlType_Impl_.toString(nodeType));
         }
         var _loc2_:StringMap = attributeMap;
         if(param1 in StringMap.reserved)
         {
            return _loc2_.existsReserved(param1);
         }
         return param1 in _loc2_.h;
      }
      
      public function elementsNamed(param1:String) : Object
      {
         var _loc5_:* = null as Xml;
         var _loc6_:Boolean = false;
         if(nodeType != Xml.Document && nodeType != Xml.Element)
         {
            throw Exception.thrown("Bad node type, expected Element or Document but found " + XmlType_Impl_.toString(nodeType));
         }
         var _loc2_:Array = [];
         var _loc3_:int = 0;
         var _loc4_:Array = children;
         while(_loc3_ < int(_loc4_.length))
         {
            _loc5_ = _loc4_[_loc3_];
            _loc3_++;
            if(_loc5_.nodeType == Xml.Element)
            {
               if(_loc5_.nodeType != Xml.Element)
               {
                  throw Exception.thrown("Bad node type, expected Element but found " + XmlType_Impl_.toString(_loc5_.nodeType));
               }
               _loc6_ = _loc5_.nodeName == param1;
            }
            else
            {
               _loc6_ = false;
            }
            if(_loc6_)
            {
               _loc2_.push(_loc5_);
            }
         }
         _loc4_ = _loc2_;
         return new ArrayIterator(_loc4_);
      }
      
      public function attributes() : Object
      {
         if(nodeType != Xml.Element)
         {
            throw Exception.thrown("Bad node type, expected Element but found " + XmlType_Impl_.toString(nodeType));
         }
         var _loc1_:StringMap = attributeMap;
         return new StringMapKeysIterator(_loc1_.h,_loc1_.rh);
      }
      
      public function addChild(param1:Xml) : void
      {
         if(nodeType != Xml.Document && nodeType != Xml.Element)
         {
            throw Exception.thrown("Bad node type, expected Element or Document but found " + XmlType_Impl_.toString(nodeType));
         }
         if(param1.parent != null)
         {
            param1.parent.removeChild(param1);
         }
         children.push(param1);
         param1.parent = this;
      }
   }
}

