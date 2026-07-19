package haxe.xml
{
   import _Xml.XmlType_Impl_;
   import flash.Boot;
   import haxe.Exception;
   
   public class Printer
   {
      
      public var pretty:Boolean;
      
      public var output:StringBuf;
      
      public function Printer(param1:Boolean = false)
      {
         if(Boot.skip_constructor)
         {
            return;
         }
         output = new StringBuf();
         pretty = param1;
      }
      
      public static function print(param1:Xml, param2:Object = undefined) : String
      {
         if(param2 == null)
         {
            param2 = false;
         }
         var _loc3_:Printer = new Printer(param2);
         _loc3_.writeNode(param1,"");
         return _loc3_.output.b;
      }
      
      public function writeNode(param1:Xml, param2:String) : void
      {
         var _loc3_:* = null;
         var _loc4_:* = null as String;
         var _loc5_:* = null as String;
         var _loc6_:int = 0;
         var _loc7_:* = null as Array;
         var _loc8_:* = null as Xml;
         switch(param1.nodeType)
         {
            case 0:
               _temp_1.b += Std.string(param2 + "<");
               if(param1.nodeType != Xml.Element)
               {
                  throw Exception.thrown("Bad node type, expected Element but found " + XmlType_Impl_.toString(param1.nodeType));
               }
               _temp_2.b += Std.string(param1.nodeName);
               _loc3_ = param1.attributes();
               while(Boolean(_loc3_.hasNext()))
               {
                  _loc4_ = _loc3_.next();
                  _temp_3.b += Std.string(" " + _loc4_ + "=\"");
                  _loc5_ = StringTools.htmlEscape(param1.get(_loc4_),true);
                  _temp_4.b += Std.string(_loc5_);
                  _temp_5.b += "\"";
               }
               if(hasChildren(param1))
               {
                  _temp_6.b += ">";
                  if(pretty)
                  {
                     _temp_7.b += "\n";
                  }
                  if(param1.nodeType != Xml.Document && param1.nodeType != Xml.Element)
                  {
                     throw Exception.thrown("Bad node type, expected Element or Document but found " + XmlType_Impl_.toString(param1.nodeType));
                  }
                  _loc6_ = 0;
                  _loc7_ = param1.children;
                  while(_loc6_ < int(_loc7_.length))
                  {
                     _loc8_ = _loc7_[_loc6_++];
                     writeNode(_loc8_,pretty ? param2 + "\t" : param2);
                  }
                  _temp_8.b += Std.string(param2 + "</");
                  if(param1.nodeType != Xml.Element)
                  {
                     throw Exception.thrown("Bad node type, expected Element but found " + XmlType_Impl_.toString(param1.nodeType));
                  }
                  _temp_9.b += Std.string(param1.nodeName);
                  _temp_10.b += ">";
                  if(pretty)
                  {
                     _temp_11.b += "\n";
                  }
               }
               else
               {
                  _temp_12.b += "/>";
                  if(pretty)
                  {
                     _temp_13.b += "\n";
                  }
               }
               break;
            case 1:
               if(param1.nodeType == Xml.Document || param1.nodeType == Xml.Element)
               {
                  throw Exception.thrown("Bad node type, unexpected " + XmlType_Impl_.toString(param1.nodeType));
               }
               _loc4_ = param1.nodeValue;
               if(_loc4_.length != 0)
               {
                  _loc5_ = param2 + StringTools.htmlEscape(_loc4_);
                  _temp_14.b += Std.string(_loc5_);
                  if(pretty)
                  {
                     _temp_15.b += "\n";
                  }
               }
               break;
            case 2:
               _temp_16.b += Std.string(param2 + "<![CDATA[");
               if(param1.nodeType == Xml.Document || param1.nodeType == Xml.Element)
               {
                  throw Exception.thrown("Bad node type, unexpected " + XmlType_Impl_.toString(param1.nodeType));
               }
               _temp_17.b += Std.string(param1.nodeValue);
               _temp_18.b += "]]>";
               if(pretty)
               {
                  _temp_19.b += "\n";
               }
               break;
            case 3:
               if(param1.nodeType == Xml.Document || param1.nodeType == Xml.Element)
               {
                  throw Exception.thrown("Bad node type, unexpected " + XmlType_Impl_.toString(param1.nodeType));
               }
               _loc4_ = param1.nodeValue;
               _loc4_ = new EReg("[\n\r\t]+","g").replace(_loc4_,"");
               _loc4_ = "<!--" + _loc4_ + "-->";
               _temp_20.b += Std.string(param2);
               _loc5_ = StringTools.trim(_loc4_);
               _temp_21.b += Std.string(_loc5_);
               if(pretty)
               {
                  _temp_22.b += "\n";
               }
               break;
            case 4:
               if(param1.nodeType == Xml.Document || param1.nodeType == Xml.Element)
               {
                  throw Exception.thrown("Bad node type, unexpected " + XmlType_Impl_.toString(param1.nodeType));
               }
               _temp_23.b += Std.string("<!DOCTYPE " + param1.nodeValue + ">");
               if(pretty)
               {
                  _temp_24.b += "\n";
               }
               break;
            case 5:
               if(param1.nodeType == Xml.Document || param1.nodeType == Xml.Element)
               {
                  throw Exception.thrown("Bad node type, unexpected " + XmlType_Impl_.toString(param1.nodeType));
               }
               _temp_25.b += Std.string("<?" + param1.nodeValue + "?>");
               if(pretty)
               {
                  _temp_26.b += "\n";
               }
               break;
            case 6:
               if(param1.nodeType != Xml.Document && param1.nodeType != Xml.Element)
               {
                  throw Exception.thrown("Bad node type, expected Element or Document but found " + XmlType_Impl_.toString(param1.nodeType));
               }
               _loc6_ = 0;
               _loc7_ = param1.children;
               while(_loc6_ < int(_loc7_.length))
               {
                  _loc8_ = _loc7_[_loc6_++];
                  writeNode(_loc8_,param2);
               }
         }
      }
      
      public function hasChildren(param1:Xml) : Boolean
      {
         var _loc4_:* = null as Xml;
         if(param1.nodeType != Xml.Document && param1.nodeType != Xml.Element)
         {
            throw Exception.thrown("Bad node type, expected Element or Document but found " + XmlType_Impl_.toString(param1.nodeType));
         }
         var _loc2_:int = 0;
         var _loc3_:Array = param1.children;
         while(_loc2_ < int(_loc3_.length))
         {
            _loc4_ = _loc3_[_loc2_++];
            switch(_loc4_.nodeType)
            {
               case 0:
               case 1:
                  return true;
               case 2:
               case 3:
                  if(_loc4_.nodeType == Xml.Document || _loc4_.nodeType == Xml.Element)
                  {
                     throw Exception.thrown("Bad node type, unexpected " + XmlType_Impl_.toString(_loc4_.nodeType));
                  }
                  if(StringTools.ltrim(_loc4_.nodeValue).length != 0)
                  {
                     return true;
                  }
            }
         }
         return false;
      }
   }
}

