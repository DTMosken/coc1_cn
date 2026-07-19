package classes.parser
{
   import classes.StatusEffects;
   import classes.globalFlags.KGAMECLASS;
   import classes.internals.StringUtil;
   import classes.internals.Utils;
   import coc.script.Eval;
   import coc.script.VType;
   import coc.script._Eval.Value_Impl_;
   import flash.Boot;
   import haxe.IMap;
   import haxe.ds.Either;
   import haxe.ds.ObjectMap;
   import haxe.ds.StringMap;
   
   public class Parser
   {
      
      public static var init__:Boolean;
      
      public static var makeQuotesPrettah_emDashes:EReg;
      
      public static var makeQuotesPrettah_closeDoubles:EReg;
      
      public static var makeQuotesPrettah_openDoubles:EReg;
      
      public static var makeQuotesPrettah_special:EReg;
      
      public static var makeQuotesPrettah_apostrophes:EReg;
      
      public static var preparseFormats_fmtTag:EReg;
      
      public static var preparseFormats_sayTag:EReg;
      
      public static var convertConditionalArgumentFromStr_LA_OPERATOR:EReg;
      
      public static var handleFormatSwitch_formatExp:EReg;
      
      public static var handleIf_braceEReg:EReg;
      
      public static var handleIf_openBracket:EReg;
      
      public static var handleTag_ifStatement:EReg;
      
      public static var handleTag_pg:EReg;
      
      public static var handleTag_doubleWordTag:EReg;
      
      public static var handleTag_singleWordTag:EReg;
      
      public static var handleTag_parserSwitch:EReg;
      
      public static var parse_repeatedSpaces:EReg;
      
      public static var sillyType:int;
      
      public static var NOT_FOUND:int = -1;
      
      public var _parserTempLookup:IMap;
      
      public var _lastPGIndex:int;
      
      public var _lastPGCount:int;
      
      public var _inUnderline:Boolean;
      
      public var _inSpeech:Boolean;
      
      public var _inItalic:Boolean;
      
      public var _inBold:Boolean;
      
      public var _formatStack:Array;
      
      public function Parser()
      {
         if(Boot.skip_constructor)
         {
            return;
         }
         _formatStack = [];
         _inUnderline = false;
         _inBold = false;
         _inSpeech = false;
         _inItalic = false;
         _lastPGCount = 2147483647;
         _lastPGIndex = -1;
         _parserTempLookup = new StringMap();
      }
      
      public static function findCloseBracket(param1:String, param2:int, param3:String, param4:String) : int
      {
         var _loc7_:* = null as String;
         var _loc5_:int = 1;
         var _loc6_:int = param2 + 1;
         while(_loc6_ < param1.length)
         {
            if(param1.charAt(_loc6_ - 1) == "\\")
            {
               _loc6_++;
            }
            else
            {
               _loc7_ = param1.charAt(_loc6_);
               if(_loc7_ == param3)
               {
                  _loc5_++;
               }
               else if(_loc7_ == param4)
               {
                  _loc5_--;
               }
               if(_loc5_ == 0)
               {
                  return _loc6_;
               }
               _loc6_++;
            }
         }
         return -1;
      }
      
      public static function preparseFormats(param1:String) : String
      {
         param1 = Parser.expandTag(param1,Parser.preparseFormats_sayTag);
         return Parser.expandTag(param1,Parser.preparseFormats_fmtTag);
      }
      
      public static function expandTag(param1:String, param2:EReg) : String
      {
         var _loc3_:int = 0;
         var _loc4_:* = null as String;
         var _loc5_:* = null as String;
         var _loc6_:* = null as String;
         var _loc7_:* = null as String;
         var _loc8_:* = null as String;
         while(param2.match(param1))
         {
            _loc3_ = Parser.findCloseBracket(param1,int(param2.matchedPos().pos),"[","]");
            if(_loc3_ == -1)
            {
               return param1;
            }
            _loc4_ = param2.matchedLeft();
            _loc5_ = param1.substring(_loc3_ + 1);
            _loc6_ = param1.substring(int(param2.matchedPos().pos) + 1,_loc3_);
            _loc7_ = new EReg("^.+?: *","i").replace(_loc6_,"");
            _loc8_ = param2.matched(1);
            param1 = _loc4_ + "[" + _loc8_ + "start]" + _loc7_ + "[" + _loc8_ + "end]" + _loc5_;
         }
         return param1;
      }
      
      public static function handleSingleArg(param1:String) : String
      {
         var _loc2_:String = param1.toLowerCase();
         var _loc3_:StringMap = SingleArgLookups.CONVERTERS;
         var _loc4_:Object = _loc2_ in StringMap.reserved ? _loc3_.getReserved(_loc2_) : _loc3_.h[_loc2_];
         if(_loc4_ == null)
         {
            return "<b>！未知的标签 \"" + param1 + "\"！</b>";
         }
         return Parser.handleCapitalize(param1,_loc4_());
      }
      
      public static function handleDoubleArg(param1:String) : String
      {
         var _loc2_:Array = param1.split(" ");
         if(int(_loc2_.length) != 2)
         {
            return "<b>！实际上不是双词标签！\"" + param1 + "\"！</b>";
         }
         var _loc3_:String = _loc2_[0];
         var _loc4_:String = _loc2_[1];
         var _loc5_:String = _loc3_.toLowerCase();
         var _loc6_:String = _loc4_.toLowerCase();
         var _loc7_:Number = Std.parseFloat(_loc4_);
         var _loc8_:StringMap = DoubleArgLookups.twoWordNumericTagsLookup;
         var _loc9_:Object = _loc5_ in StringMap.reserved ? _loc8_.getReserved(_loc5_) : _loc8_.h[_loc5_];
         if(_loc9_ != null && !Boolean(Math.isNaN(_loc7_)))
         {
            return Parser.handleCapitalize(_loc4_,_loc9_(_loc7_));
         }
         var _loc10_:StringMap = DoubleArgLookups.twoWordTagsLookup;
         var _loc11_:IMap = _loc5_ in StringMap.reserved ? _loc10_.getReserved(_loc5_) : _loc10_.h[_loc5_];
         if(_loc11_ == null)
         {
            return "<b>！双词标签中未知的主体 \"" + param1 + "\"！主体 = \"" + _loc3_ + "，方面 = " + _loc4_ + "</b>";
         }
         var _loc12_:Object = _loc6_ in StringMap.reserved ? _loc11_.getReserved(_loc6_) : _loc11_.h[_loc6_];
         if(_loc12_ == null)
         {
            return "<b>!双词标签 \"" + param1 + "\" 中存在未知方面！ASCII 方面 = \"" + _loc6_ + "\"</b>";
         }
         return Parser.handleCapitalize(_loc4_,_loc12_());
      }
      
      public static function splitConditionalResult(param1:String) : Array
      {
         var _loc8_:int = 0;
         var _loc9_:* = null as String;
         var _loc2_:Array = ["",""];
         var _loc3_:int = 0;
         var _loc4_:int = 0;
         var _loc5_:int = 0;
         var _loc6_:int = 0;
         var _loc7_:int = param1.length;
         while(_loc6_ < _loc7_)
         {
            _loc8_ = _loc6_++;
            _loc9_ = param1.charAt(_loc8_);
            if(_loc9_ == "[")
            {
               _loc5_++;
            }
            else if(_loc9_ == "]")
            {
               _loc5_--;
            }
            else if(_loc9_ == "|")
            {
               if(_loc5_ == 0)
               {
                  if(_loc4_ >= 1)
                  {
                     return ["<b>错误！if 语句中的选项过多！</b>","<b>错误！if 语句中的选项过多！</b>"];
                  }
                  _loc2_[_loc4_] = param1.substring(_loc3_,_loc8_);
                  _loc3_ = _loc8_ + 1;
                  _loc4_++;
               }
            }
         }
         _loc2_[_loc4_] = param1.substring(_loc3_,param1.length);
         return _loc2_;
      }
      
      public static function makeQuotesPrettah(param1:String) : String
      {
         param1 = Parser.makeQuotesPrettah_apostrophes.replace(param1,"$1’$2");
         param1 = Parser.makeQuotesPrettah_special.replace(param1,"$1”$2");
         param1 = Parser.makeQuotesPrettah_openDoubles.replace(param1,"$1“$2");
         param1 = Parser.makeQuotesPrettah_closeDoubles.replace(param1,"$1”$2");
         return Parser.makeQuotesPrettah_emDashes.replace(param1,"—");
      }
      
      public static function isUpperCase(param1:String) : Boolean
      {
         if(param1 == param1.toUpperCase())
         {
            return param1 != param1.toLowerCase();
         }
         return false;
      }
      
      public static function capitalizeFirstWord(param1:String) : String
      {
         return param1.charAt(0).toUpperCase() + param1.substring(1);
      }
      
      public static function handleCapitalize(param1:String, param2:String) : String
      {
         if(Parser.isUpperCase(param1.charAt(0)))
         {
            return Parser.capitalizeFirstWord(param2);
         }
         return param2;
      }
      
      public static function tabsToSpaces(param1:EReg) : String
      {
         var _loc6_:int = 0;
         var _loc2_:int = param1.matched(0).length;
         var _loc3_:Array = [];
         var _loc4_:int = 0;
         var _loc5_:int = _loc2_;
         while(_loc4_ < _loc5_)
         {
            _loc6_ = _loc4_++;
            _loc3_.push("   ");
         }
         var _loc7_:String = _loc3_.join("");
         return "<font face=\"consolas\">" + _loc7_ + "</font>";
      }
      
      public static function weebify(param1:EReg) : String
      {
         if(Math.random() >= 0.9)
         {
            return param1.matched(1) + "连一句“我开动了”都没说，" + param1.matched(2).toLowerCase();
         }
         return param1.matched(0);
      }
      
      public static function fixTerminology(param1:String) : String
      {
         var _loc7_:* = null as EReg;
         var _loc8_:* = null as Function;
         var _loc9_:* = null as EReg;
         var _loc10_:* = null as EReg;
         var _loc11_:* = null as Function;
         var _loc2_:IMap = new ObjectMap();
         _loc2_[new EReg("\\b(cock|dick|dong|endowment|mast|member|pecker|penis|prick|shaft|tool|erection|manhood)\\b","g")] = Parser.dickWords;
         _loc2_[new EReg("\\b(vagina|pussy|cooter|twat|cunt|snatch|fuck-hole|muff|nether-?lips|slit)\\b","g")] = Parser.vaginaWords;
         _loc2_[new EReg("\\b(breast|tit|boob|jug|udder|love-pillow)(s?)\\b","g")] = Parser.titWords;
         _loc2_[new EReg("\\b(nipple|nub|nip|teat)(s?)\\b","g")] = Parser.nippleWords;
         _loc2_[new EReg("\\b(clit|clitty|button|pleasure-buzzer)\\b","g")] = Parser.clitWords;
         _loc2_[new EReg("\\b(pre-cum|pre|cum|semen|spooge|jizz|jism|jizm)\\b","g")] = Parser.cumWords;
         _loc2_[new EReg("\\b(butt(?!(-|\\s)?cheek)|ass(?!(-|\\s)?cheek)|rump|rear end|derriere)\\b","g")] = Parser.assWords;
         _loc2_[new EReg("\\b(anus|asshole|butthole|pucker)\\b","g")] = Parser.anusWords;
         var _loc3_:IMap = _loc2_;
         var _loc4_:IMap = _loc3_;
         var _loc5_:IMap = _loc4_;
         var _loc6_:* = _loc4_.keys();
         while(Boolean(_loc6_.hasNext()))
         {
            _loc7_ = _loc6_.next();
            _loc8_ = _loc5_.get(_loc7_);
            _loc9_ = _loc7_;
            _loc10_ = _loc9_;
            _loc11_ = _loc8_;
            if(_loc10_.match(param1))
            {
               return _loc10_.map(param1,_loc11_);
            }
         }
         return param1;
      }
      
      public static function dickWords(param1:EReg) : String
      {
         var _loc2_:* = null as Array;
         switch(Parser.sillyType)
         {
            case 0:
               return "玩意儿";
            case 1:
               return "东西";
            case 2:
               return "小鸡鸡";
            case 3:
               _loc2_ = ["小队长","誓约胜利之剑","威浮球棒","精液发射器","征服之棍","精液步枪","全牛肉温度计","子宫雪貂","超级武器","大屌"];
               return _loc2_[Utils.rand(int(_loc2_.length))];
            default:
               return param1.matched(0);
         }
      }
      
      public static function vaginaWords(param1:EReg) : String
      {
         var _loc2_:* = null as Array;
         switch(Parser.sillyType)
         {
            case 0:
               return "玩意儿";
            case 1:
               return "东西";
            case 2:
               return "小穴";
            case 3:
               _loc2_ = ["前臀","闪光盒","妖精洞穴","奇迹隧道","热口袋","肉钱包","下体小松饼","混沌愉悦之境"];
               return _loc2_[Utils.rand(int(_loc2_.length))];
            default:
               return param1.matched(0);
         }
      }
      
      public static function titWords(param1:EReg) : String
      {
         var _loc3_:* = null as Array;
         var _loc2_:Boolean = param1.matched(2).length > 0;
         switch(Parser.sillyType)
         {
            case 0:
               return "玩意儿";
            case 1:
               return "东西";
            case 2:
               if(_loc2_)
               {
                  return "咪咪";
               }
               return "咪咪";
               break;
            case 3:
               if(_loc2_)
               {
                  _loc3_ = ["胸部小狗","小白兔","双峰","胸部蛋蛋"];
                  return _loc3_[Utils.rand(int(_loc3_.length))];
               }
               _loc3_ = ["胸部小狗","小白兔","胸部蛋蛋"];
               return _loc3_[Utils.rand(int(_loc3_.length))];
               break;
            default:
               return param1.matched(0);
         }
      }
      
      public static function nippleWords(param1:EReg) : String
      {
         var _loc3_:* = null as Array;
         var _loc2_:String = param1.matched(2);
         switch(Parser.sillyType)
         {
            case 0:
               return "玩意儿";
            case 1:
               return "东西";
            case 3:
               _loc3_ = ["小土豆","小肉包","小奶球","蚊子包"];
               return _loc3_[Utils.rand(int(_loc3_.length))] + _loc2_;
            default:
               return param1.matched(0);
         }
      }
      
      public static function clitWords(param1:EReg) : String
      {
         var _loc2_:* = null as Array;
         switch(Parser.sillyType)
         {
            case 0:
               return "玩意儿";
            case 1:
               return "东西";
            case 2:
               return "小豆豆";
            case 3:
               _loc2_ = ["小门铃","快乐按钮","小凸起"];
               return _loc2_[Utils.rand(int(_loc2_.length))];
            default:
               return param1.matched(0);
         }
      }
      
      public static function cumWords(param1:EReg) : String
      {
         var _loc2_:* = null as Array;
         switch(Parser.sillyType)
         {
            case 0:
               return "玩意儿";
            case 1:
               return "东西";
            case 2:
               return "咸牛奶";
            case 3:
               _loc2_ = ["雪白精液","爱之蛋黄酱","鸡巴浓液","肉棒糖霜"];
               return _loc2_[Utils.rand(int(_loc2_.length))];
            default:
               return param1.matched(0);
         }
      }
      
      public static function assWords(param1:EReg) : String
      {
         var _loc2_:* = null as Array;
         switch(Parser.sillyType)
         {
            case 0:
               return "玩意儿";
            case 1:
               return "东西";
            case 2:
               return "屁股";
            case 3:
               _loc2_ = ["大尾巴","精液后备箱","屎盒子"];
               return _loc2_[Utils.rand(int(_loc2_.length))];
            default:
               return param1.matched(0);
         }
      }
      
      public static function anusWords(param1:EReg) : String
      {
         var _loc2_:* = null as Array;
         switch(Parser.sillyType)
         {
            case 0:
               return "玩意儿";
            case 1:
               return "东西";
            case 2:
               return "屁眼";
            case 3:
               _loc2_ = ["棕色小眼","排便滑道","后庭小穴","精液套套"];
               return _loc2_[Utils.rand(int(_loc2_.length))];
            default:
               return param1.matched(0);
         }
      }
      
      public function updateBreaks(param1:String) : void
      {
         if(new EReg("\\S","i").match(param1.substring(_lastPGIndex)))
         {
            resetBreaks();
         }
      }
      
      public function resetParser(param1:Boolean = false) : void
      {
         var _loc2_:* = null as StringMap;
         if(param1)
         {
            _loc2_ = _parserTempLookup;
            _loc2_.h = {};
            _loc2_.rh = null;
         }
         _inItalic = false;
         _inSpeech = false;
         _inBold = false;
         _inUnderline = false;
         _lastPGIndex = -1;
         _lastPGCount = 2147483647;
         if(int(_formatStack.length) > 0)
         {
            _formatStack = [];
         }
      }
      
      public function resetBreaks() : void
      {
         _lastPGCount = 0;
         _lastPGIndex = -1;
      }
      
      public function registerTag(param1:String, param2:Function) : void
      {
         var _loc3_:IMap = _parserTempLookup;
         var _loc4_:String = param1.toLowerCase();
         var _loc5_:StringMap = _loc3_;
         if(_loc4_ in StringMap.reserved)
         {
            _loc5_.setReserved(_loc4_,param2);
         }
         else
         {
            _loc5_.h[_loc4_] = param2;
         }
      }
      
      public function parseTags(param1:String) : String
      {
         var _loc4_:int = 0;
         var _loc5_:int = 0;
         var _loc6_:* = null as String;
         var _loc7_:* = null as String;
         var _loc2_:String = null;
         var _loc3_:EReg = new EReg("(?<!\\\\)\\[","");
         while(_loc3_.match(param1))
         {
            _loc4_ = int(_loc3_.matchedPos().pos);
            _loc5_ = Parser.findCloseBracket(param1,_loc4_,"[","]");
            if(_loc5_ == -1)
            {
               _loc6_ = new EReg("<","g").replace(param1.substring(_loc4_),"&lt;");
               param1 = param1.substring(0,_loc4_);
               return param1 + "<b>解析错误：括号未闭合 \'" + _loc6_ + "\'！</b>";
            }
            _loc6_ = param1.substring(0,_loc4_);
            _loc2_ = param1.substring(_loc5_ + 1);
            _loc7_ = param1.substring(_loc4_ + 1,_loc5_);
            updateBreaks(_loc6_);
            param1 = _loc6_ + handleTag(_loc7_,_loc6_,_loc4_) + _loc2_;
         }
         _lastPGIndex = -1;
         if(_loc2_ == null)
         {
            updateBreaks(param1);
         }
         else
         {
            updateBreaks(_loc2_);
         }
         return param1;
      }
      
      public function parse(param1:String) : String
      {
         var _loc3_:* = null as Array;
         var _loc4_:int = 0;
         var _loc5_:int = 0;
         var _loc6_:int = 0;
         if(param1 == null)
         {
            return "";
         }
         var _loc2_:String = new EReg("\r\n?|\\\\n","g").replace(param1,"\n");
         _loc2_ = Parser.preparseFormats(_loc2_);
         _loc2_ = parseTags(_loc2_);
         if(_loc2_.length > 0 && _loc2_.charAt(_loc2_.length - 1) != "\n")
         {
            resetBreaks();
         }
         _loc2_ = Parser.makeQuotesPrettah(_loc2_);
         _loc2_ = new EReg("\\\\([\\[\\]{}])","g").replace(_loc2_,"$1");
         if(KGAMECLASS.kGAMECLASS.seasons.isItAprilFools() && KGAMECLASS.kGAMECLASS.get_silly())
         {
            _loc2_ = Parser.fixTerminology(_loc2_);
            _loc2_ = new EReg("(^|\\. )(She|He|You)\\b","g").map(_loc2_,Parser.weebify);
            if(!KGAMECLASS.kGAMECLASS.get_noFur())
            {
               _loc2_ = new EReg("\\b[a-z]+-morph","g").replace(_loc2_,"furfag");
            }
         }
         if(KGAMECLASS.kGAMECLASS.player.hasStatusEffect(StatusEffects.kitsuneVision))
         {
            _loc3_ = _loc2_.split(" ");
            _loc4_ = 0;
            _loc5_ = int(_loc3_.length);
            while(_loc4_ < _loc5_)
            {
               _loc6_ = _loc4_++;
               _loc3_[_loc6_] = new EReg("[A-z]+(e)(d)|[A-z]+(ing)|[A-z]+(s)","g").replace(_loc3_[_loc6_],Math.random() >= 0.5 ? "kitsune$2$3$4" : "fluffy tail$1$2$3$4");
            }
            _loc2_ = _loc3_.join(" ");
         }
         _loc2_ = Parser.parse_repeatedSpaces.replace(_loc2_," ");
         return new EReg("^\t+","gm").map(_loc2_,Parser.tabsToSpaces);
      }
      
      public function handleTempTag(param1:String) : String
      {
         var _loc7_:* = null as String;
         var _loc8_:Boolean = false;
         var _loc9_:int = 0;
         var _loc10_:Number = NaN;
         var _loc2_:IMap = _parserTempLookup;
         var _loc3_:String = param1.toLowerCase();
         var _loc4_:StringMap = _loc2_;
         var _loc5_:Object = _loc3_ in StringMap.reserved ? _loc4_.getReserved(_loc3_) : _loc4_.h[_loc3_];
         if(_loc5_ == null)
         {
            return "未注册的标签。";
         }
         var _loc6_:TagVal = _loc5_();
         switch(_loc6_.index)
         {
            case 0:
               _loc7_ = _loc6_.params[0];
               return Parser.handleCapitalize(param1,_loc7_);
            case 1:
               _loc8_ = Boolean(_loc6_.params[0]);
               return "" + _loc8_;
            case 2:
               _loc9_ = int(_loc6_.params[0]);
               return "" + _loc9_;
            case 3:
               _loc10_ = Number(_loc6_.params[0]);
               return "" + _loc10_;
            default:
               return;
         }
      }
      
      public function handleTag(param1:String, param2:String, param3:int) : String
      {
         if(Parser.handleTag_parserSwitch.match(param1))
         {
            return handleFormatSwitch(param1);
         }
         if(Parser.handleTag_ifStatement.match(param1))
         {
            return handleIf(param1);
         }
         if(Parser.handleTag_pg.match(param1))
         {
            return handlePG(param1,param2,param3);
         }
         var _loc4_:IMap = _parserTempLookup;
         var _loc5_:String = param1.toLowerCase();
         var _loc6_:StringMap = _loc4_;
         if(_loc5_ in StringMap.reserved ? _loc6_.existsReserved(_loc5_) : _loc5_ in _loc6_.h)
         {
            return handleTempTag(param1);
         }
         if(Parser.handleTag_singleWordTag.match(param1))
         {
            return Parser.handleSingleArg(param1);
         }
         if(Parser.handleTag_doubleWordTag.match(param1))
         {
            return Parser.handleDoubleArg(param1);
         }
         return "<b>！未知的多词标签 \"" + param1 + "\"！</b>";
      }
      
      public function handlePG(param1:String, param2:String, param3:int) : String
      {
         var _loc7_:* = null as String;
         var _loc8_:* = null as String;
         var _loc4_:int = Utils.countMatches("+",param1) - Utils.countMatches("-",param1);
         var _loc5_:int = 2 + _loc4_ - _lastPGCount;
         if(_loc5_ <= 0)
         {
            return "";
         }
         _lastPGIndex = param3;
         _lastPGCount += _loc5_;
         var _loc6_:String = StringUtil.repeat("\n",_loc5_);
         if(_inSpeech)
         {
            _loc7_ = _inItalic ? "</i>" : "<i>";
            _loc8_ = _inItalic ? "<i>" : "</i>";
            _loc6_ += _loc7_ + "“" + _loc8_;
         }
         return _loc6_;
      }
      
      public function handleIf(param1:String) : String
      {
         var _loc2_:int = param1.indexOf("(");
         if(_loc2_ == -1)
         {
            return "<b>无效的 IF 语句：缺少左括号 \\[" + Parser.handleIf_openBracket.replace(param1,"&lt;") + "\\]</b>";
         }
         var _loc3_:int = Parser.findCloseBracket(param1,_loc2_,"(",")");
         if(_loc3_ == -1)
         {
            return "<b>无效的 IF 语句：条件括号不平衡 \\[" + Parser.handleIf_openBracket.replace(param1,"&lt;") + "\\]</b>";
         }
         var _loc4_:String = param1.substring(_loc2_ + 1,_loc3_);
         if(param1.charAt(_loc2_ - 1) == "!")
         {
            _loc4_ = "!(" + _loc4_ + ")";
         }
         var _loc5_:VType = evalConditionalStatementStr(_loc4_);
         if(_loc5_ == null)
         {
            return "<b>无效的 IF 条件 (" + Parser.handleIf_openBracket.replace(_loc4_,"&lt;") + ")</b>";
         }
         var _loc6_:int = -1;
         var _loc7_:int = -1;
         if(Parser.handleIf_braceEReg.match(param1))
         {
            _loc6_ = int(Parser.handleIf_braceEReg.matchedPos().pos);
            _loc7_ = Parser.findCloseBracket(param1,_loc6_,"{","}");
         }
         if(_loc6_ == -1 || _loc7_ == -1)
         {
            return "<b>无效的 IF 语法 \'" + Parser.handleIf_openBracket.replace(param1,"&lt;") + "\'</b>";
         }
         var _loc8_:Array = Parser.splitConditionalResult(param1.substring(_loc6_ + 1,_loc7_));
         if(Value_Impl_.toBool(_loc5_))
         {
            return _loc8_[0];
         }
         return _loc8_[1];
      }
      
      public function handleFormatSwitch(param1:String) : String
      {
         var _loc10_:* = null as String;
         var _loc11_:Boolean = false;
         var _loc12_:* = null as String;
         var _loc13_:Boolean = false;
         if(!Parser.handleFormatSwitch_formatExp.match(param1))
         {
            return param1;
         }
         var _loc2_:String = Parser.handleFormatSwitch_formatExp.matched(1).toLowerCase();
         var _loc3_:Boolean = _loc2_ == "say";
         var _loc4_:String = "";
         var _loc5_:Array = _loc3_ ? ["i"] : _loc2_.split("");
         var _loc6_:IMap = new StringMap();
         var _loc7_:int = 0;
         var _loc8_:Array = [];
         var _loc9_:int = 0;
         while(_loc9_ < int(_loc5_.length))
         {
            _loc10_ = _loc5_[_loc9_];
            _loc9_++;
            _loc12_ = _loc10_;
            if(_loc12_ == "b")
            {
               _loc11_ = _inBold = !_inBold;
            }
            else if(_loc12_ == "i")
            {
               _loc11_ = _inItalic = !_inItalic;
            }
            else if(_loc12_ == "u")
            {
               _loc11_ = _inUnderline = !_inUnderline;
            }
            else
            {
               _loc11_ = false;
            }
            if(_loc11_)
            {
               _loc4_ += "<" + _loc10_ + ">";
               _loc8_.push(_loc10_);
            }
            else
            {
               _loc12_ = "</" + _loc10_ + ">";
               if(_loc10_ in StringMap.reserved)
               {
                  _loc6_.setReserved(_loc10_,_loc12_);
               }
               else
               {
                  _loc6_.h[_loc10_] = _loc12_;
               }
               _loc7_++;
            }
         }
         _loc10_ = "";
         var _loc14_:Array = [];
         while(_loc7_ > 0)
         {
            if(int(_formatStack.length) <= 0)
            {
               return _loc10_;
            }
            _loc12_ = _formatStack.pop();
            if(_loc12_ in StringMap.reserved ? Boolean(_loc6_.existsReserved(_loc12_)) : _loc12_ in _loc6_.h)
            {
               _loc7_--;
               _loc10_ += _loc12_ in StringMap.reserved ? _loc6_.getReserved(_loc12_) : _loc6_.h[_loc12_];
            }
            else
            {
               _loc10_ += "</" + _loc12_ + ">";
               _loc14_.push(_loc12_);
            }
         }
         var _loc15_:Array = [];
         _loc9_ = 0;
         var _loc16_:Array = _loc14_;
         while(_loc9_ < int(_loc16_.length))
         {
            _loc12_ = _loc16_[_loc9_];
            _loc9_++;
            _loc15_.push("<" + _loc12_ + ">");
         }
         _loc10_ += _loc15_.join("");
         _formatStack = _formatStack.concat(_loc14_).concat(_loc8_);
         if(_loc3_)
         {
            _loc11_ = param1.indexOf("start") >= 0;
            _loc12_ = _loc11_ ? "“" : "”";
            if(_inSpeech)
            {
               _loc4_ += _loc12_;
            }
            else
            {
               _loc10_ = _loc12_ + _loc10_;
            }
            _inSpeech = !_inSpeech;
         }
         return _loc10_ + _loc4_;
      }
      
      public function evalConditionalStatementStr(param1:String) : VType
      {
         var _loc3_:* = null as String;
         var _loc4_:* = null as Error;
         try
         {
            _loc3_ = new EReg("[\\w.]+","g").map(param1,convertConditionalArgumentFromStr);
            return Eval.eval({},_loc3_);
         }
         catch(_loc_e_:Error)
         {
            _loc4_ = _loc_e_;
            return null;
         }
      }
      
      public function errorChecking(param1:String) : String
      {
         var _loc2_:int = 0;
         var _loc3_:int = 0;
         var _loc4_:String = "";
         var _loc5_:String = "i";
         var _loc6_:EReg = new EReg("<" + _loc5_ + ">","gi");
         var _loc7_:EReg = new EReg("<" + _loc5_ + ">","gi");
         _loc2_ = countMatches(_loc6_,param1);
         _loc3_ = countMatches(_loc7_,param1);
         if(_loc2_ != _loc3_)
         {
            _loc4_ += "前一次输出错误：HTML 标签不匹配 \'" + _loc5_ + "\'。\n";
         }
         else if(_loc5_ == "i" && _inItalic)
         {
            _loc4_ += "前一次输出错误：斜体标签匹配，但 persistentParsing.italic 为 true。\n";
         }
         _loc5_ = "b";
         _loc6_ = new EReg("<" + _loc5_ + ">","gi");
         _loc7_ = new EReg("<" + _loc5_ + ">","gi");
         _loc2_ = countMatches(_loc6_,param1);
         _loc3_ = countMatches(_loc7_,param1);
         if(_loc2_ != _loc3_)
         {
            _loc4_ += "前一次输出错误：HTML 标签不匹配 \'" + _loc5_ + "\'。\n";
         }
         else if(_loc5_ == "i" && _inItalic)
         {
            _loc4_ += "前一次输出错误：斜体标签匹配，但 persistentParsing.italic 为 true。\n";
         }
         _loc5_ = "u";
         _loc6_ = new EReg("<" + _loc5_ + ">","gi");
         _loc7_ = new EReg("<" + _loc5_ + ">","gi");
         _loc2_ = countMatches(_loc6_,param1);
         _loc3_ = countMatches(_loc7_,param1);
         if(_loc2_ != _loc3_)
         {
            _loc4_ += "前一次输出错误：HTML 标签不匹配 \'" + _loc5_ + "\'。\n";
         }
         else if(_loc5_ == "i" && _inItalic)
         {
            _loc4_ += "前一次输出错误：斜体标签匹配，但 persistentParsing.italic 为 true。\n";
         }
         return _loc4_;
      }
      
      public function countMatches(param1:EReg, param2:String) : int
      {
         var _loc3_:int = 0;
         while(param1.match(param2))
         {
            _loc3_++;
            param2 = param1.matchedRight();
         }
         return _loc3_;
      }
      
      public function convertConditionalArgumentFromStr(param1:EReg) : String
      {
         var _loc6_:* = null as TagVal;
         var _loc7_:* = null;
         var _loc8_:* = null as String;
         var _loc9_:Boolean = false;
         var _loc10_:int = 0;
         var _loc11_:Number = NaN;
         var _loc14_:* = null as Either;
         var _loc15_:* = null as Object;
         var _loc2_:String = param1.matched(0);
         var _loc3_:String = _loc2_.toLowerCase();
         if(!Boolean(Math.isNaN(Std.parseFloat(_loc2_))))
         {
            return _loc2_;
         }
         var _loc4_:StringMap = _parserTempLookup;
         var _loc5_:Object = _loc3_ in StringMap.reserved ? _loc4_.getReserved(_loc3_) : _loc4_.h[_loc3_];
         if(_loc5_ != null)
         {
            _loc6_ = _loc5_();
            switch(_loc6_.index)
            {
               case 0:
                  _loc8_ = _loc6_.params[0];
                  _loc7_ = Parser.handleCapitalize(_loc2_,_loc8_);
                  break;
               case 1:
                  _loc9_ = Boolean(_loc6_.params[0]);
                  _loc7_ = _loc9_;
                  break;
               case 2:
                  _loc10_ = int(_loc6_.params[0]);
                  _loc7_ = _loc10_;
                  break;
               case 3:
                  _loc11_ = Number(_loc6_.params[0]);
                  _loc7_ = _loc11_;
            }
            return Std.string(_loc7_);
         }
         var _loc12_:StringMap = ConditionalConverters.CONVERTERS;
         var _loc13_:Object = _loc3_ in StringMap.reserved ? _loc12_.getReserved(_loc3_) : _loc12_.h[_loc3_];
         if(_loc13_ != null)
         {
            _loc14_ = _loc13_();
            switch(_loc14_.index)
            {
               case 0:
                  _loc9_ = _loc14_.params[0];
                  _loc7_ = _loc9_;
                  break;
               case 1:
                  _loc15_ = _loc14_.params[0];
                  _loc7_ = _loc15_;
            }
            return Std.string(_loc7_);
         }
         if(Parser.convertConditionalArgumentFromStr_LA_OPERATOR.match(_loc2_))
         {
            return _loc2_;
         }
         throw new Error("Unknown conditional: " + _loc2_);
      }
   }
}

