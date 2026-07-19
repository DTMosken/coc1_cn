package haxe.xml
{
   import _Xml.XmlType_Impl_;
   import flash.Boot;
   import haxe.Exception;
   import haxe.ds.StringMap;
   
   public class Parser
   {
      
      public static var init__:Boolean;
      
      public static var escapes:StringMap;
      
      public function Parser()
      {
      }
      
      public static function parse(param1:String, param2:Boolean = false) : Xml
      {
         var _loc3_:Xml = Xml.createDocument();
         Parser.doParse(param1,param2,0,_loc3_);
         return _loc3_;
      }
      
      public static function doParse(param1:String, param2:Boolean, param3:int = 0, param4:Xml = undefined) : int
      {
         var _loc15_:int = 0;
         var _loc16_:* = null as String;
         var _loc17_:* = null as Object;
         var _loc18_:* = null as Xml;
         var _loc19_:int = 0;
         var _loc20_:* = null as StringMap;
         var _loc21_:* = null as StringMap;
         var _loc22_:* = null as String;
         var _loc5_:Xml = null;
         var _loc6_:int = 1;
         var _loc7_:int = 1;
         var _loc8_:String = null;
         var _loc9_:int = 0;
         var _loc10_:int = 0;
         var _loc11_:int = 0;
         var _loc12_:StringBuf = new StringBuf();
         var _loc13_:int = 1;
         var _loc14_:int = -1;
         while(param3 < param1.length)
         {
            _loc15_ = int(param1.charCodeAt(param3));
            switch(_loc6_)
            {
               case 0:
                  switch(_loc15_)
                  {
                     case 9:
                     case 10:
                     case 13:
                     case 32:
                        break;
                     default:
                        _loc6_ = _loc7_;
                        continue;
                  }
                  break;
               case 1:
                  if(_loc15_ == 60)
                  {
                     _loc6_ = 0;
                     _loc7_ = 2;
                     break;
                  }
                  _loc9_ = param3;
                  _loc6_ = 13;
                  continue;
               case 2:
                  switch(_loc15_)
                  {
                     case 33:
                        if(int(param1.charCodeAt(param3 + 1)) == 91)
                        {
                           param3 += 2;
                           if(param1.substr(param3,6).toUpperCase() != "CDATA[")
                           {
                              throw Exception.thrown(new XmlParserException("Expected <![CDATA[",param1,param3));
                           }
                           param3 += 5;
                           _loc6_ = 17;
                           _loc9_ = param3 + 1;
                        }
                        else if(int(param1.charCodeAt(param3 + 1)) == 68 || int(param1.charCodeAt(param3 + 1)) == 100)
                        {
                           if(param1.substr(param3 + 2,6).toUpperCase() != "OCTYPE")
                           {
                              throw Exception.thrown(new XmlParserException("Expected <!DOCTYPE",param1,param3));
                           }
                           param3 += 8;
                           _loc6_ = 16;
                           _loc9_ = param3 + 1;
                        }
                        else
                        {
                           if(int(param1.charCodeAt(param3 + 1)) != 45 || int(param1.charCodeAt(param3 + 2)) != 45)
                           {
                              throw Exception.thrown(new XmlParserException("Expected <!--",param1,param3));
                           }
                           param3 += 2;
                           _loc6_ = 15;
                           _loc9_ = param3 + 1;
                        }
                        break;
                     case 47:
                        if(param4 == null)
                        {
                           throw Exception.thrown(new XmlParserException("Expected node name",param1,param3));
                        }
                        _loc9_ = param3 + 1;
                        _loc6_ = 0;
                        _loc7_ = 10;
                        break;
                     case 63:
                        _loc6_ = 14;
                        _loc9_ = param3;
                        break;
                     default:
                        _loc6_ = 3;
                        _loc9_ = param3;
                        continue;
                  }
                  break;
               case 3:
                  if(_loc15_ >= 97 && _loc15_ <= 122 || _loc15_ >= 65 && _loc15_ <= 90 || _loc15_ >= 48 && _loc15_ <= 57 || _loc15_ == 58 || _loc15_ == 46 || _loc15_ == 95 || _loc15_ == 45)
                  {
                     break;
                  }
                  if(param3 == _loc9_)
                  {
                     throw Exception.thrown(new XmlParserException("Expected node name",param1,param3));
                  }
                  _loc5_ = Xml.createElement(param1.substr(_loc9_,param3 - _loc9_));
                  param4.addChild(_loc5_);
                  _loc10_++;
                  _loc6_ = 0;
                  _loc7_ = 4;
                  continue;
               case 4:
                  switch(_loc15_)
                  {
                     case 47:
                        _loc6_ = 11;
                        break;
                     case 62:
                        _loc6_ = 9;
                        break;
                     default:
                        _loc6_ = 5;
                        _loc9_ = param3;
                        continue;
                  }
                  break;
               case 5:
                  if(_loc15_ >= 97 && _loc15_ <= 122 || _loc15_ >= 65 && _loc15_ <= 90 || _loc15_ >= 48 && _loc15_ <= 57 || _loc15_ == 58 || _loc15_ == 46 || _loc15_ == 95 || _loc15_ == 45)
                  {
                     break;
                  }
                  if(_loc9_ == param3)
                  {
                     throw Exception.thrown(new XmlParserException("Expected attribute name",param1,param3));
                  }
                  _loc16_ = param1.substr(_loc9_,param3 - _loc9_);
                  _loc8_ = _loc16_;
                  if(_loc5_.exists(_loc8_))
                  {
                     throw Exception.thrown(new XmlParserException("Duplicate attribute [" + _loc8_ + "]",param1,param3));
                  }
                  _loc6_ = 0;
                  _loc7_ = 6;
                  continue;
               case 6:
                  if(_loc15_ == 61)
                  {
                     _loc6_ = 0;
                     _loc7_ = 7;
                     break;
                  }
                  throw Exception.thrown(new XmlParserException("Expected =",param1,param3));
                  break;
               case 7:
                  switch(_loc15_)
                  {
                     case 34:
                     case 39:
                        _loc12_ = new StringBuf();
                        _loc6_ = 8;
                        _loc9_ = param3 + 1;
                        _loc14_ = _loc15_;
                        break;
                     default:
                        throw Exception.thrown(new XmlParserException("Expected \"",param1,param3));
                  }
                  break;
               case 8:
                  switch(_loc15_)
                  {
                     case 38:
                        _loc17_ = param3 - _loc9_;
                        _loc12_.b += _loc17_ == null ? param1.substr(_loc9_) : param1.substr(_loc9_,_loc17_);
                        _loc6_ = 18;
                        _loc13_ = 8;
                        _loc9_ = param3 + 1;
                        break;
                     case 60:
                     case 62:
                        if(param2)
                        {
                           throw Exception.thrown(new XmlParserException("Invalid unescaped " + (_loc15_ < 65536 ? String["fromCharCode"](_loc15_) : Boot.fromCodePoint(_loc15_)) + " in attribute value",param1,param3));
                        }
                        if(_loc15_ == _loc14_)
                        {
                           _loc17_ = param3 - _loc9_;
                           _loc12_.b += _loc17_ == null ? param1.substr(_loc9_) : param1.substr(_loc9_,_loc17_);
                           _loc16_ = _loc12_.b;
                           _loc12_ = new StringBuf();
                           _loc5_.set(_loc8_,_loc16_);
                           _loc6_ = 0;
                           _loc7_ = 4;
                        }
                        break;
                     default:
                        if(_loc15_ == _loc14_)
                        {
                           _loc17_ = param3 - _loc9_;
                           _loc12_.b += _loc17_ == null ? param1.substr(_loc9_) : param1.substr(_loc9_,_loc17_);
                           _loc16_ = _loc12_.b;
                           _loc12_ = new StringBuf();
                           _loc5_.set(_loc8_,_loc16_);
                           _loc6_ = 0;
                           _loc7_ = 4;
                        }
                  }
                  break;
               case 9:
                  param3 = Parser.doParse(param1,param2,param3,_loc5_);
                  _loc9_ = param3;
                  _loc6_ = 1;
                  break;
               case 10:
                  if(_loc15_ >= 97 && _loc15_ <= 122 || _loc15_ >= 65 && _loc15_ <= 90 || _loc15_ >= 48 && _loc15_ <= 57 || _loc15_ == 58 || _loc15_ == 46 || _loc15_ == 95 || _loc15_ == 45)
                  {
                     break;
                  }
                  if(_loc9_ == param3)
                  {
                     throw Exception.thrown(new XmlParserException("Expected node name",param1,param3));
                  }
                  _loc16_ = param1.substr(_loc9_,param3 - _loc9_);
                  if(param4 == null || param4.nodeType != 0)
                  {
                     throw Exception.thrown(new XmlParserException("Unexpected </" + _loc16_ + ">, tag is not open",param1,param3));
                  }
                  if(param4.nodeType != Xml.Element)
                  {
                     throw Exception.thrown("Bad node type, expected Element but found " + XmlType_Impl_.toString(param4.nodeType));
                  }
                  if(_loc16_ != param4.nodeName)
                  {
                     if(param4.nodeType != Xml.Element)
                     {
                        throw Exception.thrown("Bad node type, expected Element but found " + XmlType_Impl_.toString(param4.nodeType));
                     }
                     throw Exception.thrown(new XmlParserException("Expected </" + param4.nodeName + ">",param1,param3));
                  }
                  _loc6_ = 0;
                  _loc7_ = 12;
                  continue;
               case 11:
                  if(_loc15_ == 62)
                  {
                     _loc6_ = 1;
                     break;
                  }
                  throw Exception.thrown(new XmlParserException("Expected >",param1,param3));
                  break;
               case 12:
                  if(_loc15_ == 62)
                  {
                     if(_loc10_ == 0)
                     {
                        param4.addChild(Xml.createPCData(""));
                     }
                     return param3;
                  }
                  throw Exception.thrown(new XmlParserException("Expected >",param1,param3));
                  break;
               case 13:
                  if(_loc15_ == 60)
                  {
                     _loc17_ = param3 - _loc9_;
                     _loc12_.b += _loc17_ == null ? param1.substr(_loc9_) : param1.substr(_loc9_,_loc17_);
                     _loc18_ = Xml.createPCData(_loc12_.b);
                     _loc12_ = new StringBuf();
                     param4.addChild(_loc18_);
                     _loc10_++;
                     _loc6_ = 0;
                     _loc7_ = 2;
                  }
                  else if(_loc15_ == 38)
                  {
                     _loc17_ = param3 - _loc9_;
                     _loc12_.b += _loc17_ == null ? param1.substr(_loc9_) : param1.substr(_loc9_,_loc17_);
                     _loc6_ = 18;
                     _loc13_ = 13;
                     _loc9_ = param3 + 1;
                  }
                  break;
               case 14:
                  if(_loc15_ == 63 && int(param1.charCodeAt(param3 + 1)) == 62)
                  {
                     param3++;
                     _loc16_ = param1.substr(_loc9_ + 1,param3 - _loc9_ - 2);
                     param4.addChild(Xml.createProcessingInstruction(_loc16_));
                     _loc10_++;
                     _loc6_ = 1;
                  }
                  break;
               case 15:
                  if(_loc15_ == 45 && int(param1.charCodeAt(param3 + 1)) == 45 && int(param1.charCodeAt(param3 + 2)) == 62)
                  {
                     param4.addChild(Xml.createComment(param1.substr(_loc9_,param3 - _loc9_)));
                     _loc10_++;
                     param3 += 2;
                     _loc6_ = 1;
                  }
                  break;
               case 16:
                  if(_loc15_ == 91)
                  {
                     _loc11_++;
                  }
                  else if(_loc15_ == 93)
                  {
                     _loc11_--;
                  }
                  else if(_loc15_ == 62 && _loc11_ == 0)
                  {
                     param4.addChild(Xml.createDocType(param1.substr(_loc9_,param3 - _loc9_)));
                     _loc10_++;
                     _loc6_ = 1;
                  }
                  break;
               case 17:
                  if(_loc15_ == 93 && int(param1.charCodeAt(param3 + 1)) == 93 && int(param1.charCodeAt(param3 + 2)) == 62)
                  {
                     _loc18_ = Xml.createCData(param1.substr(_loc9_,param3 - _loc9_));
                     param4.addChild(_loc18_);
                     _loc10_++;
                     param3 += 2;
                     _loc6_ = 1;
                  }
                  break;
               case 18:
                  if(_loc15_ == 59)
                  {
                     _loc16_ = param1.substr(_loc9_,param3 - _loc9_);
                     if(int(_loc16_.charCodeAt(0)) == 35)
                     {
                        _loc17_ = int(_loc16_.charCodeAt(1)) == 120 ? Std.parseInt("0" + _loc16_.substr(1,_loc16_.length - 1)) : Std.parseInt(_loc16_.substr(1,_loc16_.length - 1));
                        _loc19_ = _loc17_;
                        _loc12_.b += _loc19_ < 65536 ? String["fromCharCode"](_loc19_) : Boot.fromCodePoint(_loc19_);
                     }
                     else
                     {
                        _loc20_ = Parser.escapes;
                        if(!(_loc16_ in StringMap.reserved ? _loc20_.existsReserved(_loc16_) : _loc16_ in _loc20_.h))
                        {
                           if(param2)
                           {
                              throw Exception.thrown(new XmlParserException("Undefined entity: " + _loc16_,param1,param3));
                           }
                           _loc12_.b += Std.string("&" + _loc16_ + ";");
                        }
                        else
                        {
                           _loc21_ = Parser.escapes;
                           _loc22_ = _loc16_ in StringMap.reserved ? _loc21_.getReserved(_loc16_) : _loc21_.h[_loc16_];
                           _loc12_.b += Std.string(_loc22_);
                        }
                     }
                     _loc9_ = param3 + 1;
                     _loc6_ = _loc13_;
                     break;
                  }
                  if(!(_loc15_ >= 97 && _loc15_ <= 122 || _loc15_ >= 65 && _loc15_ <= 90 || _loc15_ >= 48 && _loc15_ <= 57 || _loc15_ == 58 || _loc15_ == 46 || _loc15_ == 95 || _loc15_ == 45) && _loc15_ != 35)
                  {
                     if(param2)
                     {
                        throw Exception.thrown(new XmlParserException("Invalid character in entity: " + (_loc15_ < 65536 ? String["fromCharCode"](_loc15_) : Boot.fromCodePoint(_loc15_)),param1,param3));
                     }
                     _loc12_.b += String["fromCharCode"](38);
                     _loc17_ = param3 - _loc9_;
                     _loc12_.b += _loc17_ == null ? param1.substr(_loc9_) : param1.substr(_loc9_,_loc17_);
                     _loc9_ = --param3 + 1;
                     _loc6_ = _loc13_;
                  }
            }
            param3++;
         }
         if(_loc6_ == 1)
         {
            _loc9_ = param3;
            _loc6_ = 13;
         }
         if(_loc6_ == 13)
         {
            if(param4.nodeType == 0)
            {
               if(param4.nodeType != Xml.Element)
               {
                  throw Exception.thrown("Bad node type, expected Element but found " + XmlType_Impl_.toString(param4.nodeType));
               }
               throw Exception.thrown(new XmlParserException("Unclosed node <" + param4.nodeName + ">",param1,param3));
            }
            if(param3 != _loc9_ || _loc10_ == 0)
            {
               _loc17_ = param3 - _loc9_;
               _loc12_.b += _loc17_ == null ? param1.substr(_loc9_) : param1.substr(_loc9_,_loc17_);
               param4.addChild(Xml.createPCData(_loc12_.b));
               _loc10_++;
            }
            return param3;
         }
         if(!param2 && _loc6_ == 18 && _loc13_ == 13)
         {
            _loc12_.b += String["fromCharCode"](38);
            _loc17_ = param3 - _loc9_;
            _loc12_.b += _loc17_ == null ? param1.substr(_loc9_) : param1.substr(_loc9_,_loc17_);
            param4.addChild(Xml.createPCData(_loc12_.b));
            _loc10_++;
            return param3;
         }
         throw Exception.thrown(new XmlParserException("Unexpected end",param1,param3));
      }
   }
}

