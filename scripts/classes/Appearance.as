package classes
{
   import classes.globalFlags.KGAMECLASS;
   import classes.internals.Utils;
   import flash.Boot;
   import haxe.IMap;
   import haxe.ds.IntMap;
   import haxe.ds.StringMap;
   
   public class Appearance extends BaseContent
   {
      
      public static var init__:Boolean;
      
      public static var NAGA_LOWER_BODY_COLORS:IMap;
      
      public static var RED_PANDA_TAIL_COLORS:IMap;
      
      public static var DEFAULT_GENDER_NAMES:IMap;
      
      public static var DEFAULT_SKIN_NAMES:IMap;
      
      public static var DEFAULT_SKIN_DESCS:IMap;
      
      public static var DEFAULT_HAIR_NAMES:IMap;
      
      public static var DEFAULT_BEARD_NAMES:IMap;
      
      public static var DEFAULT_FACE_NAMES:IMap;
      
      public static var DEFAULT_TONGUE_NAMES:IMap;
      
      public static var DEFAULT_EYES_NAMES:IMap;
      
      public static var DEFAULT_EARS_NAMES:IMap;
      
      public static var DEFAULT_HORN_NAMES:IMap;
      
      public static var DEFAULT_ANTENNAE_NAMES:IMap;
      
      public static var DEFAULT_ARM_NAMES:IMap;
      
      public static var DEFAULT_TAIL_NAMES:IMap;
      
      public static var DEFAULT_REAR_BODY_NAMES:IMap;
      
      public static var DEFAULT_NECK_NAMES:IMap;
      
      public static var DEFAULT_WING_NAMES:IMap;
      
      public static var DEFAULT_WING_DESCS:IMap;
      
      public static var DEFAULT_LOWER_BODY_NAMES:IMap;
      
      public static var DEFAULT_PIERCING_NAMES:IMap;
      
      public static var DEFAULT_VAGINA_TYPE_NAMES:IMap;
      
      public static var BREAST_CUP_NAMES:Array = ["平胸","A罩杯","B罩杯","C罩杯","D罩杯","DD罩杯","大DD罩杯","E罩杯","大E罩杯","EE罩杯","大EE罩杯","F罩杯","大F罩杯","FF罩杯","大FF罩杯","G罩杯","大G罩杯","GG罩杯","大GG罩杯","H罩杯","大H罩杯","HH罩杯","大HH罩杯","HHH罩杯","I罩杯","大I罩杯","II罩杯","大II罩杯","J罩杯","大J罩杯","JJ罩杯","大JJ罩杯","K罩杯","大K罩杯","KK罩杯","大KK罩杯","L罩杯","大L罩杯","LL罩杯","大LL罩杯","M罩杯","大M罩杯","MM罩杯","大MM罩杯","MMM罩杯","巨MMM罩杯","N罩杯","巨N罩杯","NN罩杯","巨NN罩杯","O罩杯","巨O罩杯","OO罩杯","巨OO罩杯","P罩杯","巨P罩杯","PP罩杯","巨PP罩杯","Q罩杯","巨Q罩杯","QQ罩杯","巨QQ罩杯","R罩杯","巨R罩杯","RR罩杯","巨RR罩杯","S罩杯","巨S罩杯","SS罩杯","巨SS罩杯","T罩杯","巨T罩杯","TT罩杯","巨TT罩杯","U罩杯","巨U罩杯","UU罩杯","巨UU罩杯","V罩杯","巨V罩杯","VV罩杯","巨VV罩杯","W罩杯","巨W罩杯","WW罩杯","巨WW罩杯","X罩杯","巨X罩杯","XX罩杯","巨XX罩杯","Y罩杯","巨Y罩杯","YY罩杯","巨YY罩杯","Z罩杯","巨Z罩杯","ZZ罩杯","巨ZZ罩杯","ZZZ罩杯","巨ZZZ罩杯","超A罩杯","超B罩杯","超C罩杯","超D罩杯","超DD罩杯","超大DD罩杯","超E罩杯","超大E罩杯","超EE罩杯","超大EE罩杯","超F罩杯","超大F罩杯","超FF罩杯","超大FF罩杯","超G罩杯","超大G罩杯","超GG罩杯","超大GG罩杯","超H罩杯","超大H罩杯","超HH罩杯","超大HH罩杯","超HHH罩杯","超I罩杯","超大I罩杯","超II罩杯","超大II罩杯","超J罩杯","超大J罩杯","超JJ罩杯","超大JJ罩杯","超K罩杯","超大K罩杯"
      ,"超KK罩杯","超大KK罩杯","超L罩杯","超大L罩杯","超LL罩杯","超大LL罩杯","超M罩杯","超大M罩杯","超MM罩杯","超大MM罩杯","超MMM罩杯","超巨MMM罩杯","超N罩杯","超巨N罩杯","超NN罩杯","超巨NN罩杯","超O罩杯","超巨O罩杯","超OO罩杯","超巨OO罩杯","超P罩杯","超巨P罩杯","超PP罩杯","超巨PP罩杯","超Q罩杯","超巨Q罩杯","超QQ罩杯","超巨QQ罩杯","超R罩杯","超巨R罩杯","超RR罩杯","超巨RR罩杯","超S罩杯","超巨S罩杯","超SS罩杯","超巨SS罩杯","超T罩杯","超巨T罩杯","超TT罩杯","超巨TT罩杯","超U罩杯","超巨U罩杯","超UU罩杯","超巨UU罩杯","超V罩杯","超巨V罩杯","超VV罩杯","超巨VV罩杯","超W罩杯","超巨W罩杯","超WW罩杯","超巨WW罩杯","超X罩杯","超巨X罩杯","超XX罩杯","超巨XX罩杯","超Y罩杯","超巨Y罩杯","超YY罩杯","超巨YY罩杯","超Z罩杯","超巨Z罩杯","超ZZ罩杯","超巨ZZ罩杯","超ZZZ罩杯","超巨ZZZ罩杯","jacques00罩杯"];
      
      public static var DEFAULT_VAGINA_WETNESS_SCALES:Array = [{
         "val":0,
         "descript":"dry"
      },{
         "val":1,
         "descript":"normal"
      },{
         "val":2,
         "descript":"wet"
      },{
         "val":3,
         "descript":"slick"
      },{
         "val":4,
         "descript":"drooling"
      },{
         "val":5,
         "descript":"slavering"
      }];
      
      public static var DEFAULT_VAGINA_LOOSENESS_SCALES:Array = [{
         "val":0,
         "descript":"tight"
      },{
         "val":1,
         "descript":"normal"
      },{
         "val":2,
         "descript":"loose"
      },{
         "val":3,
         "descript":"gaping"
      },{
         "val":4,
         "descript":"gaping wide"
      },{
         "val":5,
         "descript":"clown-car level"
      }];
      
      public static var DEFAULT_ANAL_WETNESS_SCALES:Array = [{
         "val":0,
         "descript":"dry"
      },{
         "val":1,
         "descript":"normal"
      },{
         "val":2,
         "descript":"moist"
      },{
         "val":3,
         "descript":"slimy"
      },{
         "val":4,
         "descript":"drooling"
      },{
         "val":5,
         "descript":"slime-drooling"
      }];
      
      public static var DEFAULT_ANAL_LOOSENESS_SCALES:Array = [{
         "val":0,
         "descript":"virgin"
      },{
         "val":1,
         "descript":"tight"
      },{
         "val":2,
         "descript":"normal"
      },{
         "val":3,
         "descript":"loose"
      },{
         "val":4,
         "descript":"stretched"
      },{
         "val":5,
         "descript":"gaping"
      }];
      
      public static var DEFAULT_HIPS_RATING_SCALES:Array = [{
         "val":0,
         "descript":"boyish"
      },{
         "val":2,
         "descript":"slender"
      },{
         "val":4,
         "descript":"average"
      },{
         "val":6,
         "descript":"ample"
      },{
         "val":10,
         "descript":"curvy"
      },{
         "val":15,
         "descript":"fertile"
      },{
         "val":20,
         "descript":"inhumanly wide"
      }];
      
      public static var DEFAULT_BUTT_RATING_SCALES:Array = [{
         "val":0,
         "descript":"buttless"
      },{
         "val":2,
         "descript":"tight"
      },{
         "val":4,
         "descript":"average"
      },{
         "val":6,
         "descript":"noticeable"
      },{
         "val":8,
         "descript":"large"
      },{
         "val":10,
         "descript":"jiggly"
      },{
         "val":13,
         "descript":"expansive"
      },{
         "val":16,
         "descript":"huge"
      },{
         "val":20,
         "descript":"inconceivably big"
      }];
      
      public function Appearance()
      {
         if(Boot.skip_constructor)
         {
            return;
         }
         super();
      }
      
      public static function hairOrFur(param1:Creature) : String
      {
         if(param1.hasFur())
         {
            return "皮毛";
         }
         return "头发";
      }
      
      public static function hairOrFurColor(param1:Creature) : String
      {
         if(param1.isFluffy())
         {
            return param1.skin.furColor;
         }
         return param1.hair.color;
      }
      
      public static function hairDescription(param1:Creature) : String
      {
         var _loc3_:* = null as Array;
         var _loc5_:* = null as Array;
         var _loc7_:Boolean = false;
         var _loc8_:Boolean = false;
         var _loc9_:Boolean = false;
         var _loc10_:Boolean = false;
         var _loc11_:Boolean = false;
         var _loc12_:Boolean = false;
         var _loc13_:* = null as String;
         var _loc14_:* = null as String;
         var _loc2_:String = "";
         var _loc4_:String = param1.hair.color;
         if(param1.hair.length == 0)
         {
            _loc5_ = ["剃光的","秃秃的","光滑的","无毛的","平滑的"];
            return _loc5_[Utils.rand(int(_loc5_.length))] + "脑袋";
         }
         var _loc6_:Number = param1.hair.length;
         if(_loc6_ < 1 == true)
         {
            _loc5_ = ["剪短的","修剪过的","非常短的"];
            _loc13_ = _loc5_[Utils.rand(int(_loc5_.length))];
         }
         else
         {
            _loc12_ = _loc6_ < 3;
            if(_loc12_ == true)
            {
               _loc13_ = "短的";
            }
            else
            {
               _loc11_ = _loc6_ < 6;
               if(_loc11_ == true)
               {
                  _loc13_ = "蓬松的";
               }
               else
               {
                  _loc10_ = _loc6_ < 10;
                  if(_loc10_ == true)
                  {
                     _loc13_ = "中等长度的";
                  }
                  else
                  {
                     _loc9_ = _loc6_ < 16;
                     if(_loc9_ == true)
                     {
                        _loc5_ = ["长长的","及肩的"];
                        _loc13_ = _loc5_[Utils.rand(int(_loc5_.length))];
                     }
                     else
                     {
                        _loc8_ = _loc6_ < 26;
                        if(_loc8_ == true)
                        {
                           _loc5_ = ["非常长的","飘逸的"];
                           _loc13_ = _loc5_[Utils.rand(int(_loc5_.length))];
                        }
                        else
                        {
                           _loc7_ = _loc6_ < 40;
                           if(_loc7_ == true)
                           {
                              _loc13_ = "及臀的";
                           }
                           else
                           {
                              _loc5_ = ["及地的","拖到地上的"];
                              _loc13_ = _loc5_[Utils.rand(int(_loc5_.length))];
                           }
                        }
                     }
                  }
               }
            }
         }
         _loc2_ += _loc13_;
         switch(param1.hair.type)
         {
            case 6:
               _loc5_ = ["橡胶般的" + _loc4_ + "棘刺","" + _loc4_ + "棘刺冠","" + _loc4_ + "蛇怪棘刺","" + _loc4_ + "爬虫棘刺"];
               return _loc2_ + _loc5_[Utils.rand(int(_loc5_.length))];
            case 7:
               _loc5_ = ["" + _loc4_ + "羽毛头发","蓬松的" + _loc4_ + "羽冠","" + _loc4_ + "蛇怪羽冠","一丛" + _loc4_ + "羽毛"];
               return _loc2_ + _loc5_[Utils.rand(int(_loc5_.length))];
            case 8:
               _loc5_ = ["" + _loc4_ + "羊毛般的头发","" + _loc4_ + "蓬松的头发","柔软的" + _loc4_ + "羊毛","难以驯服的" + _loc4_ + "羊毛头发"];
               return _loc2_ + _loc5_[Utils.rand(int(_loc5_.length))];
            case 10:
               _loc3_ = ["" + _loc4_ + " vines","flourishing " + _loc4_ + " vine-hair"];
               if(param1.hair.hasFlowers())
               {
                  _loc3_.push("flowery " + _loc4_ + " hair");
                  _loc3_.push(param1.hair.flowerColor + "花朵");
                  _loc3_.push(param1.hair.flowerColor + "花朵");
               }
               else if(param1.hair.adj == "leafy")
               {
                  _loc3_.push("leafy " + _loc4_ + " vine-hair");
                  _loc3_.push(_loc4_ + "叶子");
               }
               _loc5_ = _loc3_;
               return _loc2_ + _loc5_[Utils.rand(int(_loc5_.length))];
            default:
               _loc2_ += Utils.cnName(_loc4_) + "";
               switch(param1.hair.type)
               {
                  case 1:
                     _loc14_ = "羽毛";
                     break;
                  case 2:
                     _loc14_ = "透明的";
                     break;
                  case 3:
                     _loc14_ = "粘液";
                     break;
                  case 4:
                     _loc14_ = "触手";
                     break;
                  case 5:
                     _loc14_ = "刺";
                     break;
                  default:
                     _loc14_ = "";
               }
               _loc2_ += _loc14_;
               if(param1.hasFur() && param1.hair.length > 3 && Utils.randomChance(25))
               {
                  return _loc2_ + "鬃毛";
               }
               if(param1.hair.length != 0)
               {
                  return _loc2_ + "头发";
               }
               return _loc2_ + "";
         }
      }
      
      public static function hairShort(param1:Creature) : String
      {
         switch(param1.hair.type)
         {
            case 1:
            case 7:
               return "羽毛";
            case 4:
               return "触手发";
            case 5:
               return "刺毛发";
            case 6:
               return "棘刺";
            case 8:
               return "羊毛";
            case 10:
               return "藤蔓发";
            default:
               return "头发";
         }
      }
      
      public static function beardDescription(param1:Creature) : String
      {
         var _loc4_:Boolean = false;
         var _loc5_:Boolean = false;
         var _loc6_:Boolean = false;
         var _loc7_:Boolean = false;
         var _loc8_:Boolean = false;
         var _loc9_:* = null as Array;
         var _loc10_:* = null as String;
         var _loc11_:* = null as String;
         var _loc12_:* = null as String;
         var _loc2_:String = "";
         var _loc3_:Number = param1.beard.length;
         if(_loc3_ == 0)
         {
            _loc9_ = ["剃光的","光秃秃的","光滑的","无毛的","平滑的"];
            return _loc9_[Utils.rand(int(_loc9_.length))] + "下巴和脸颊";
         }
         _loc8_ = _loc3_ < 0.2;
         if(_loc8_ == true)
         {
            _loc9_ = ["剪得很短的","修剪整齐的","非常短的"];
            _loc2_ += _loc9_[Utils.rand(int(_loc9_.length))];
         }
         else
         {
            _loc7_ = _loc3_ < 0.5;
            if(_loc7_ == true)
            {
               _loc2_ += "短的";
            }
            else
            {
               _loc6_ = _loc3_ < 1.5;
               if(_loc6_ == true)
               {
                  _loc2_ += "中等长度的";
               }
               else
               {
                  _loc5_ = _loc3_ < 3;
                  if(_loc5_ == true)
                  {
                     _loc2_ += "中长的";
                  }
                  else
                  {
                     _loc4_ = _loc3_ < 6;
                     if(_loc4_ == true)
                     {
                        _loc9_ = ["长的","及颈的"];
                        _loc2_ += _loc9_[Utils.rand(int(_loc9_.length))];
                     }
                     else
                     {
                        _loc9_ = ["非常长的",""];
                        _loc2_ += _loc9_[Utils.rand(int(_loc9_.length))] + "及胸";
                     }
                  }
               }
            }
         }
         _loc11_ = param1.hair.color;
         if(_loc11_ == "auburn")
         {
            _loc10_ = "赤褐色";
         }
         else if(_loc11_ == "black")
         {
            _loc10_ = "黑色";
         }
         else if(_loc11_ == "blonde")
         {
            _loc10_ = "金色";
         }
         else if(_loc11_ == "brown")
         {
            _loc10_ = "棕色";
         }
         else if(_loc11_ == "gray")
         {
            _loc10_ = "灰色";
         }
         else if(_loc11_ == "red")
         {
            _loc10_ = "红色";
         }
         else if(_loc11_ == "white")
         {
            _loc10_ = "白色";
         }
         else
         {
            _loc10_ = param1.hair.color;
         }
         _loc2_ += _loc10_ + "";
         switch(param1.hair.type)
         {
            case 2:
               _loc11_ = "透明的";
               break;
            case 3:
               _loc11_ = "黏糊糊的";
               break;
            case 4:
               _loc11_ = "触手状的";
               break;
            default:
               _loc11_ = "";
         }
         _loc2_ += _loc11_;
         switch(param1.beard.style)
         {
            case 0:
               _loc12_ = "胡须";
               break;
            case 1:
               _loc12_ = "山羊胡";
               break;
            case 2:
               _loc12_ = "整齐胡须";
               break;
            case 3:
               _loc12_ = "络腮胡";
               break;
            default:
               _loc12_ = "";
         }
         return _loc2_ + _loc12_;
      }
      
      public static function tongueDescription(param1:Character) : String
      {
         var _loc2_:Boolean = false;
         var _loc3_:int = 0;
         if(param1.tongue.type != 0)
         {
            _loc3_ = param1.tongue.type;
            _loc2_ = !(_loc3_ in Appearance.DEFAULT_TONGUE_NAMES.h);
         }
         else
         {
            _loc2_ = true;
         }
         if(_loc2_)
         {
            return "舌头";
         }
         return Appearance.DEFAULT_TONGUE_NAMES.h[param1.tongue.type] + "舌头";
      }
      
      public static function nippleDescription(param1:Creature, param2:Number) : String
      {
         var _loc5_:Number = NaN;
         var _loc6_:Boolean = false;
         var _loc7_:Boolean = false;
         var _loc8_:Boolean = false;
         var _loc9_:Boolean = false;
         var _loc10_:* = null as String;
         var _loc11_:* = null as Array;
         if(param2 > int(param1.breastRows.length) - 1)
         {
            CoC_Settings.error("<B>错误：传递给nippleDescription()的breastRows(" + param2 + ")无效</b>");
            return "<B>错误：传递给nippleDescription()的breastRows(" + param2 + ")无效</b>";
         }
         if(param2 < 0)
         {
            CoC_Settings.error("<B>错误：传递给nippleDescription()的breastRows(" + param2 + ")无效</b>");
            return "<B>错误：传递给nippleDescription()的breastRows(" + param2 + ")无效</b>";
         }
         var _loc3_:Boolean = false;
         var _loc4_:String = "";
         if(Utils.randomChance(25))
         {
            _loc5_ = param1.nippleLength;
            if(_loc5_ < 0.25 == true)
            {
               _loc11_ = ["微小的","极小的","小巧的","娇小的"];
               _loc10_ = _loc11_[Utils.rand(int(_loc11_.length))];
            }
            else
            {
               _loc9_ = _loc5_ < 0.4;
               if(_loc9_ == true)
               {
                  _loc10_ = "";
               }
               else
               {
                  _loc8_ = _loc5_ < 1;
                  if(_loc8_ == true)
                  {
                     _loc11_ = ["突出的","橡皮擦大小的","引人注目的","明显的","惹眼的"];
                     _loc10_ = _loc11_[Utils.rand(int(_loc11_.length))];
                  }
                  else
                  {
                     _loc7_ = _loc5_ < 2;
                     if(_loc7_ == true)
                     {
                        _loc11_ = ["向前突出的","过大的","肉感的","巨大突出的"];
                        _loc10_ = _loc11_[Utils.rand(int(_loc11_.length))];
                     }
                     else
                     {
                        _loc6_ = _loc5_ < 3.2;
                        if(_loc6_ == true)
                        {
                           _loc11_ = ["细长的","巨大的","笨拙的","丰满的","沉甸甸的"];
                           _loc10_ = _loc11_[Utils.rand(int(_loc11_.length))];
                        }
                        else
                        {
                           _loc11_ = ["粗大的","沉重的","拇指般大小的","鸡巴般大小的","母牛般的"];
                           _loc10_ = _loc11_[Utils.rand(int(_loc11_.length))];
                        }
                     }
                  }
               }
            }
            _loc4_ += _loc10_;
            _loc3_ = true;
         }
         if(!_loc3_ && Utils.randomChance(33))
         {
            if(param1.hasFuckableNipples())
            {
               if(param1.biggestLactation() > 1)
               {
                  _loc11_ = ["被乳汁润滑的","泌乳的","泌乳的","沾满乳汁的","乳汁丰富的"];
                  _loc4_ += _loc11_[Utils.rand(int(_loc11_.length))];
               }
               else
               {
                  _loc11_ = ["湿润的","变异的","黏糊糊的","潮湿的","湿漉漉的","滑溜溜的","流着汁的","湿滑的","水润的"];
                  _loc4_ += _loc11_[Utils.rand(int(_loc11_.length))];
               }
               _loc3_ = true;
            }
            else if(param1.biggestLactation() > 0)
            {
               _loc5_ = param1.biggestLactation();
               if(_loc5_ <= 1 == true)
               {
                  _loc11_ = ["被乳汁润湿的","微微泌乳的","被奶水沾湿的"];
                  _loc10_ = _loc11_[Utils.rand(int(_loc11_.length))];
               }
               else
               {
                  _loc6_ = _loc5_ <= 2;
                  if(_loc6_ == true)
                  {
                     _loc11_ = ["泌乳的","乳汁丰富的","渗着奶水的"];
                     _loc10_ = _loc11_[Utils.rand(int(_loc11_.length))];
                  }
                  else
                  {
                     _loc11_ = ["滴着奶水的","渗着奶水的","漏着奶水的","流着奶水的"];
                     _loc10_ = _loc11_[Utils.rand(int(_loc11_.length))];
                  }
               }
               _loc4_ += _loc10_;
               _loc3_ = true;
            }
         }
         else if(!_loc3_ && Utils.randomChance(33))
         {
            if(param1.get_lust100() >= 75)
            {
               _loc11_ = ["跳动着的","颤抖着的","饥渴的","跳动着的"];
               _loc4_ += _loc11_[Utils.rand(int(_loc11_.length))];
               _loc3_ = true;
            }
            else if(param1.get_lust100() > 50)
            {
               _loc11_ = ["挺立的","翘挺的","挺立的","坚挺的","娇嫩的"];
               _loc4_ += _loc11_[Utils.rand(int(_loc11_.length))];
               _loc3_ = true;
            }
         }
         if(!_loc3_ && Utils.randomChance(50) && param1.nipplesPierced > 0 && param2 == 0)
         {
            _loc4_ += param1.nipplesPierced == 5 ? "戴着乳链的" : "穿了乳环的";
            _loc3_ = true;
         }
         if(!_loc3_ && param1.hasGooSkin())
         {
            _loc11_ = ["满是黏液的","黏糊糊的","湿滑的"];
            _loc4_ += _loc11_[Utils.rand(int(_loc11_.length))];
         }
         if(!_loc3_ && param1.hasStatusEffect(StatusEffects.BlackNipples))
         {
            _loc11_ = ["黑色的","乌黑的","暗黑的"];
            _loc4_ += _loc11_[Utils.rand(int(_loc11_.length))];
         }
         _loc6_ = param1.hasFuckableNipples();
         _loc5_ = param1.nippleLength;
         _loc10_ = param1.biggestLactation() >= 1 && _loc5_ >= 1 ? "奶头" : "乳头";
         _loc11_ = ["乳头",_loc5_ < 0.5 ? "挺立的乳头" : "樱桃般的肉突",_loc6_ ? "可操的乳头" : _loc10_,_loc6_ ? "乳头洞" : _loc10_,_loc6_ ? "乳头穴" : "乳头"];
         var _loc12_:Array = _loc11_;
         return _loc4_ + _loc12_[Utils.rand(int(_loc12_.length))];
      }
      
      public static function hipDescription(param1:Character) : String
      {
         var _loc5_:Boolean = false;
         var _loc6_:Boolean = false;
         var _loc7_:Boolean = false;
         var _loc8_:Boolean = false;
         var _loc9_:Boolean = false;
         var _loc10_:* = null as Array;
         var _loc2_:String = "";
         var _loc3_:Boolean = param1.thickness < 30 && !param1.isChild() && (param1.get_gender() != 1 || param1.get_femininity() > 55);
         var _loc4_:Number = param1.hips.rating;
         if(_loc4_ >= 20 == true)
         {
            if(param1.thickness < 40)
            {
               _loc10_ = ["外扩的，","极其纤细的，"];
               _loc2_ = _loc10_[Utils.rand(int(_loc10_.length))];
            }
            _loc10_ = ["育母般大小的","母牛般的","非人般宽阔的"];
            _loc2_ += _loc10_[Utils.rand(int(_loc10_.length))];
         }
         else
         {
            _loc9_ = _loc4_ >= 15;
            if(_loc9_ == true)
            {
               if(param1.thickness < 40)
               {
                  _loc10_ = ["外扩的，","纤细的，"];
                  _loc2_ = _loc10_[Utils.rand(int(_loc10_.length))];
               }
               _loc10_ = ["好生养的","适合生育的","肉感的"];
               _loc2_ += _loc10_[Utils.rand(int(_loc10_.length))];
            }
            else
            {
               _loc8_ = _loc4_ >= 10;
               if(_loc8_ == true)
               {
                  if(param1.thickness < 30)
                  {
                     _loc10_ = ["外扩的","蜂腰型的"];
                     _loc2_ = _loc10_[Utils.rand(int(_loc10_.length))];
                  }
                  else
                  {
                     _loc10_ = ["外扩的","曲线优美的","宽大的"];
                     _loc2_ = _loc10_[Utils.rand(int(_loc10_.length))];
                  }
               }
               else
               {
                  _loc7_ = _loc4_ >= 6;
                  if(_loc7_ == true)
                  {
                     if(_loc3_)
                     {
                        _loc10_ = ["外扩的","蜂腰型的"];
                        _loc2_ = _loc10_[Utils.rand(int(_loc10_.length))];
                     }
                     else
                     {
                        _loc10_ = ["丰满的","显眼的","少女般的"];
                        _loc2_ = _loc10_[Utils.rand(int(_loc10_.length))];
                     }
                  }
                  else
                  {
                     _loc6_ = _loc4_ >= 4;
                     if(_loc6_ == true)
                     {
                        if(_loc3_)
                        {
                           _loc10_ = ["外扩的","曲线优美的"];
                           _loc2_ = _loc10_[Utils.rand(int(_loc10_.length))];
                        }
                        else
                        {
                           _loc10_ = ["匀称的","好看的"];
                           _loc2_ = _loc10_[Utils.rand(int(_loc10_.length))];
                        }
                     }
                     else
                     {
                        _loc5_ = _loc4_ >= 2;
                        if(_loc5_ == true)
                        {
                           if(_loc3_)
                           {
                              _loc10_ = ["微扩的","带弧度的"];
                              _loc2_ = _loc10_[Utils.rand(int(_loc10_.length))];
                           }
                           else
                           {
                              _loc10_ = ["纤细的","窄小的","单薄的"];
                              _loc2_ = _loc10_[Utils.rand(int(_loc10_.length))];
                           }
                        }
                        else
                        {
                           _loc10_ = ["微小的","狭窄的","男孩子气的"];
                           _loc2_ = _loc10_[Utils.rand(int(_loc10_.length))];
                        }
                     }
                  }
               }
            }
         }
         if(param1.isTaur() && Utils.randomChance(33))
         {
            _loc2_ += "侧腹";
         }
         else if(param1.hasTailInsteadOfLegs() && Utils.randomChance(33))
         {
            _loc2_ += "侧面";
         }
         else
         {
            _loc10_ = ["臀部","大腿"];
            _loc2_ += _loc10_[Utils.rand(int(_loc10_.length))];
         }
         return _loc2_;
      }
      
      public static function knotWord(param1:Creature, param2:int = 0) : String
      {
         var _loc4_:* = null as Array;
         var _loc3_:Cock = param1.cocks[param2];
         if(_loc3_ == null)
         {
            return "<b>错误：调用了肉结描述，但没有阴茎</b>";
         }
         if(!_loc3_.hasKnot())
         {
            return "根部";
         }
         if(KGAMECLASS.kGAMECLASS.get_silly())
         {
            _loc4_ = ["小穴塞","撑穴器","封精塞","播种球","扩穴器","锁穴结","阴茎锁","堵洞结","肏穴扣","填婊塞","破婊器","挡精塞"];
            return _loc4_[Utils.rand(int(_loc4_.length))];
         }
         var _loc5_:CockTypesEnum = _loc3_.get_cockType();
         if(_loc5_ != CockTypesEnum.DRAGON)
         {
            if(_loc5_ != CockTypesEnum.LIZARD)
            {
               if(_loc5_ != CockTypesEnum.DOG)
               {
                  if(_loc5_ != CockTypesEnum.FOX)
                  {
                     if(_loc5_ != CockTypesEnum.WOLF)
                     {
                        return "肉结";
                     }
                  }
               }
               return "肉结";
            }
         }
         return "肉球";
      }
      
      public static function cockAnimalityAdj(param1:Creature, param2:int = 0) : String
      {
         var _loc5_:* = null as Array;
         var _loc3_:Cock = param1.cocks[param2];
         if(_loc3_ == null)
         {
            return "<b>错误：调用了cockAnimalityAdj，但没有阴茎存在</b>";
         }
         var _loc4_:CockTypesEnum = _loc3_.get_cockType();
         if(_loc4_ == CockTypesEnum.ANEMONE)
         {
            _loc5_ = ["水生的","有毒的","蓝色的"];
            return _loc5_[Utils.rand(int(_loc5_.length))];
         }
         if(_loc4_ == CockTypesEnum.AVIAN)
         {
            _loc5_ = ["鸟类的","鸟的"];
            return _loc5_[Utils.rand(int(_loc5_.length))];
         }
         if(_loc4_ == CockTypesEnum.BEE)
         {
            _loc5_ = ["蜜蜂的","昆虫的"];
            return _loc5_[Utils.rand(int(_loc5_.length))];
         }
         if(_loc4_ == CockTypesEnum.CAT)
         {
            _loc5_ = ["猫科的","猫的","兽性的"];
            return _loc5_[Utils.rand(int(_loc5_.length))];
         }
         if(_loc4_ == CockTypesEnum.DEMON)
         {
            _loc5_ = ["恶魔般的","腐化的","不洁的","邪恶的","受诅咒的","堕落的"];
            return _loc5_[Utils.rand(int(_loc5_.length))];
         }
         if(_loc4_ == CockTypesEnum.DISPLACER)
         {
            _loc5_ = ["异类的","野兽般的","怪异的"];
            return _loc5_[Utils.rand(int(_loc5_.length))];
         }
         if(_loc4_ == CockTypesEnum.DOG)
         {
            _loc5_ = ["犬类的","犬科的","野兽的","野兽般的","动物般的"];
            return _loc5_[Utils.rand(int(_loc5_.length))];
         }
         if(_loc4_ == CockTypesEnum.DRAGON)
         {
            _loc5_ = ["龙类的","神话的","野蛮的","爬行类的"];
            return _loc5_[Utils.rand(int(_loc5_.length))];
         }
         if(_loc4_ == CockTypesEnum.ECHIDNA)
         {
            _loc5_ = ["奇特的","不寻常的","哺乳类的"];
            return _loc5_[Utils.rand(int(_loc5_.length))];
         }
         if(_loc4_ == CockTypesEnum.FOX)
         {
            _loc5_ = ["狐狸的","野兽的","动物的","狐媚的"];
            return _loc5_[Utils.rand(int(_loc5_.length))];
         }
         if(_loc4_ == CockTypesEnum.GNOLL)
         {
            _loc5_ = ["动物的","野兽的","野蛮的"];
            return _loc5_[Utils.rand(int(_loc5_.length))];
         }
         if(_loc4_ == CockTypesEnum.HORSE)
         {
            _loc5_ = ["马的","种马的","野兽的","动物的"];
            return _loc5_[Utils.rand(int(_loc5_.length))];
         }
         if(_loc4_ == CockTypesEnum.KANGAROO)
         {
            _loc5_ = ["有袋动物的","哺乳动物的","袋鼠的"];
            return _loc5_[Utils.rand(int(_loc5_.length))];
         }
         if(_loc4_ == CockTypesEnum.LIZARD)
         {
            _loc5_ = ["爬行动物的","蛇的","蜥蜴的"];
            return _loc5_[Utils.rand(int(_loc5_.length))];
         }
         if(_loc4_ == CockTypesEnum.PIG)
         {
            _loc5_ = ["猪的","像猪的","兽性的"];
            return _loc5_[Utils.rand(int(_loc5_.length))];
         }
         if(_loc4_ == CockTypesEnum.RHINO)
         {
            _loc5_ = ["哺乳动物的","野兽的","兽性的"];
            return _loc5_[Utils.rand(int(_loc5_.length))];
         }
         if(_loc4_ == CockTypesEnum.TENTACLE)
         {
            _loc5_ = ["植物般的","腐化的","奇特的"];
            return _loc5_[Utils.rand(int(_loc5_.length))];
         }
         if(_loc4_ == CockTypesEnum.WOLF)
         {
            _loc5_ = ["野兽的","野蛮的","原始的","犬科的","狼的"];
            return _loc5_[Utils.rand(int(_loc5_.length))];
         }
         return "";
      }
      
      public static function cockDescript(param1:Creature, param2:int = 0) : String
      {
         if(int(param1.cocks.length) == 0)
         {
            return "<b>错误：调用了 cockDescript 但不存在阴茎</b>";
         }
         var _loc3_:CockTypesEnum = CockTypesEnum.HUMAN;
         if(param2 != 99)
         {
            if(int(param1.cocks.length) <= param2)
            {
               return "<b>错误：调用 cockDescript 时索引为 " + param2 + " - 越界</b>";
            }
            _loc3_ = param1.cocks[param2].get_cockType();
         }
         var _loc4_:Boolean = int(param1.cocks.length) == 1 && param1.cocks[param2].get_isPierced();
         var _loc5_:Boolean = int(param1.cocks.length) == 1 && param1.cocks[param2].sock != "";
         var _loc6_:Boolean = param1.skin.type == 3;
         var _loc7_:Boolean = param1.hasCockNotOfType(CockTypesEnum.HUMAN);
         return Appearance.cockDescription(_loc3_,param1.cocks[param2].cockLength,param1.cocks[param2].cockThickness,int(param1.get_lust()),param1.cumQ(),_loc4_,_loc5_,_loc6_,_loc7_);
      }
      
      public static function cockDescription(param1:CockTypesEnum, param2:Number, param3:Number, param4:int = 50, param5:Number = 10, param6:Boolean = false, param7:Boolean = false, param8:Boolean = false, param9:Boolean = true) : String
      {
         if(Utils.randomChance(50))
         {
            if(param1 == CockTypesEnum.HUMAN)
            {
               return Appearance.cockAdjective(param1,param2,param3,param4,param5,param6,param7,param8) + "" + Appearance.cockNoun(param1,param9);
            }
            return Appearance.cockAdjective(param1,param2,param3,param4,param5,param6,param7,param8) + "，" + Appearance.cockNoun(param1,param9);
         }
         return Appearance.cockNoun(param1,param9);
      }
      
      public static function cockNoun(param1:CockTypesEnum, param2:Boolean = true) : String
      {
         var _loc5_:* = null as Array;
         var _loc6_:* = null as Array;
         var _loc3_:String = "";
         var _loc4_:CockTypesEnum = param1;
         if(_loc4_ == CockTypesEnum.ANEMONE)
         {
            _loc5_ = ["海葵","触手环绕的","蓝色的","布满毒刺的","脉动的","海葵","覆盖毒刺的","蓝色的","触手环绕的","近乎透明的","蠕动的"];
            _loc3_ += _loc5_[Utils.rand(int(_loc5_.length))];
         }
         else if(_loc4_ == CockTypesEnum.AVIAN)
         {
            _loc5_ = ["鸟类的","禽类的","锥形的"];
            _loc3_ += _loc5_[Utils.rand(int(_loc5_.length))];
         }
         else if(_loc4_ == CockTypesEnum.BEE)
         {
            _loc5_ = ["蜜蜂的","昆虫的","毛茸茸的"];
            _loc3_ += _loc5_[Utils.rand(int(_loc5_.length))];
         }
         else if(_loc4_ == CockTypesEnum.CAT)
         {
            if(Utils.randomChance(66))
            {
               _loc5_ = ["粉红色的","野兽般的","多刺的","长满刺的","质地奇特的","带倒刺的","布满凸起的"];
               _loc3_ += _loc5_[Utils.rand(int(_loc5_.length))];
            }
            _loc5_ = ["猫科的","猫的","小猫的","幼猫的"];
            _loc3_ += _loc5_[Utils.rand(int(_loc5_.length))];
         }
         else if(_loc4_ == CockTypesEnum.DEMON)
         {
            _loc5_ = ["堕落的","布满凸起的","有凸起的","变态的","凹凸不平的","被诅咒的","地狱的","不洁的","被污染的"];
            _loc3_ += _loc5_[Utils.rand(int(_loc5_.length))];
            if(Utils.randomChance(50))
            {
               _loc6_ = ["恶魔的","恶魔般的"];
               _loc3_ += _loc6_[Utils.rand(int(_loc6_.length))];
            }
         }
         else if(_loc4_ == CockTypesEnum.DISPLACER)
         {
            _loc5_ = ["顶端带触手的","顶端如海星的","奇异的","野兽般的","顶端呈星形的","带肉结的"];
            _loc3_ += _loc5_[Utils.rand(int(_loc5_.length))];
            if(Utils.randomChance(66))
            {
               _loc6_ = ["长须豹的","异形的","近乎犬科的","动物的","移位兽的"];
               _loc3_ += _loc6_[Utils.rand(int(_loc6_.length))];
            }
         }
         else if(_loc4_ == CockTypesEnum.DOG)
         {
            if(Utils.randomChance(50))
            {
               _loc5_ = ["尖锐的","多结的","带肉结的","野兽般的","动物般的"];
               _loc3_ += _loc5_[Utils.rand(int(_loc5_.length))];
            }
            _loc5_ = ["狗的","犬科的","小狗的"];
            _loc3_ += _loc5_[Utils.rand(int(_loc5_.length))];
         }
         else if(_loc4_ == CockTypesEnum.DRAGON)
         {
            if(Utils.randomChance(50))
            {
               _loc5_ = ["分节的","尖锐的","带肉结的","神话般的","锥形的","不寻常的","有鳞的"];
               _loc3_ += _loc5_[Utils.rand(int(_loc5_.length))];
            }
            _loc5_ = ["像龙的","龙的","龙族的"];
            _loc3_ += _loc5_[Utils.rand(int(_loc5_.length))];
         }
         else if(_loc4_ == CockTypesEnum.ECHIDNA)
         {
            if(Utils.randomChance(50))
            {
               _loc5_ = ["奇怪的","四个头的","异国情调的","不寻常的"];
               _loc3_ += _loc5_[Utils.rand(int(_loc5_.length))];
            }
            if(Utils.randomChance(75))
            {
               _loc3_ += "针鼹般的 ";
            }
         }
         else if(_loc4_ == CockTypesEnum.FOX)
         {
            if(Utils.randomChance(50))
            {
               _loc5_ = ["尖锐的","多结的","带肉结的","野兽般的","动物般的"];
               _loc3_ += _loc5_[Utils.rand(int(_loc5_.length))];
            }
            _loc5_ = ["狐狸的","狐狸般的"];
            _loc3_ += _loc5_[Utils.rand(int(_loc5_.length))];
         }
         else if(_loc4_ == CockTypesEnum.GNOLL)
         {
            if(Utils.randomChance(66))
            {
               _loc5_ = ["尖锐的","有肉结的","野兽般的","有肉结的"];
               _loc3_ += _loc5_[Utils.rand(int(_loc5_.length))];
            }
            _loc5_ = ["豺狼人的","鬣狗的","野兽般的","",""];
            _loc3_ += _loc5_[Utils.rand(int(_loc5_.length))];
         }
         else if(_loc4_ == CockTypesEnum.HORSE)
         {
            if(Utils.randomChance(66))
            {
               _loc5_ = ["喇叭状的","野兽般的","平头的","蘑菇头的",""];
               _loc3_ += _loc5_[Utils.rand(int(_loc5_.length))];
            }
            _loc5_ = ["马的","马一般的","种马的","野兽般的"];
            _loc3_ += _loc5_[Utils.rand(int(_loc5_.length))];
         }
         else if(_loc4_ == CockTypesEnum.HUMAN)
         {
            if(param2 && Utils.randomChance(50))
            {
               _loc5_ = ["人类的","类人的","看起来很普通的"];
               _loc3_ += _loc5_[Utils.rand(int(_loc5_.length))];
            }
         }
         else if(_loc4_ == CockTypesEnum.KANGAROO)
         {
            if(Utils.randomChance(50))
            {
               _loc5_ = ["尖锐的","锥形的","弯曲的","蠕动的"];
               _loc3_ += _loc5_[Utils.rand(int(_loc5_.length))];
            }
            if(Utils.randomChance(75))
            {
               _loc5_ = ["像袋鼠的","有袋动物的"];
               _loc3_ += _loc5_[Utils.rand(int(_loc5_.length))];
            }
         }
         else if(_loc4_ == CockTypesEnum.LIZARD)
         {
            if(Utils.randomChance(50))
            {
               _loc5_ = ["紫色的","球状的","鼓胀的"];
               _loc3_ += _loc5_[Utils.rand(int(_loc5_.length))];
            }
            _loc5_ = ["爬行动物的","非人的","蛇形的","蛇的","蛇的"];
            _loc3_ += _loc5_[Utils.rand(int(_loc5_.length))];
         }
         else if(_loc4_ == CockTypesEnum.PIG)
         {
            _loc5_ = ["猪的","野猪的","类猪的","螺旋尖端的","猪一般的","粉红猪-","粉红的"];
            _loc3_ += _loc5_[Utils.rand(int(_loc5_.length))];
         }
         else if(_loc4_ == CockTypesEnum.RHINO)
         {
            _loc5_ = ["椭圆形的","犀牛的","凸起的犀牛"];
            _loc3_ += _loc5_[Utils.rand(int(_loc5_.length))];
         }
         else if(_loc4_ == CockTypesEnum.TENTACLE)
         {
            if(Utils.randomChance(50))
            {
               _loc5_ = ["扭曲的","蠕动的","翻腾的","蜿蜒的","扭动的","起伏的","滑动的"];
               _loc3_ += _loc5_[Utils.rand(int(_loc5_.length))];
            }
            _loc5_ = ["触手-","植物-","触手-","植物-","植物的","光滑的","藤蔓-","藤蔓状的","",""];
            _loc3_ += _loc5_[Utils.rand(int(_loc5_.length))];
         }
         else if(_loc4_ == CockTypesEnum.WOLF)
         {
            if(Utils.randomChance(66))
            {
               _loc5_ = ["带肉结的","多肉结的","动物般的","尖头的","野兽般的"];
               _loc3_ += _loc5_[Utils.rand(int(_loc5_.length))];
            }
            _loc5_ = ["狼的","狼的","狼的","犬科的","",""];
            _loc3_ += _loc5_[Utils.rand(int(_loc5_.length))];
         }
         else
         {
            _loc3_ += "";
         }
         _loc5_ = ["鸡巴","老二","大屌","命根","肉柱","阴茎","鸡鸡","阴茎","肉棒","肉杆","屌"];
         return _loc3_ + _loc5_[Utils.rand(int(_loc5_.length))];
      }
      
      public static function cockAdjective(param1:CockTypesEnum, param2:Number, param3:Number, param4:int = 50, param5:Number = 10, param6:Boolean = false, param7:Boolean = false, param8:Boolean = false) : String
      {
         var _loc9_:* = null as Array;
         var _loc10_:Boolean = false;
         var _loc11_:Boolean = false;
         var _loc12_:Boolean = false;
         var _loc13_:Boolean = false;
         var _loc14_:Boolean = false;
         var _loc15_:Boolean = false;
         if(param6 && Utils.randomChance(20))
         {
            return "穿孔的";
         }
         if(param7 && Utils.randomChance(20))
         {
            _loc9_ = ["套着袜子的","裹着衣物的","穿戴整齐的","布料遮蔽的","织物包裹的","覆盖着的"];
            return _loc9_[Utils.rand(int(_loc9_.length))];
         }
         if(param8 && Utils.randomChance(25))
         {
            _loc9_ = ["黏糊糊的","黏软的","黏滑的"];
            return _loc9_[Utils.rand(int(_loc9_.length))];
         }
         if(Utils.randomChance(33))
         {
            if(param2 < 3 == true)
            {
               _loc9_ = ["小巧的","玩具大小的","迷你的","初长的","微小的"];
               return _loc9_[Utils.rand(int(_loc9_.length))];
            }
            _loc15_ = param2 < 5;
            if(_loc15_ == true)
            {
               _loc9_ = ["短小的","小的"];
               return _loc9_[Utils.rand(int(_loc9_.length))];
            }
            _loc14_ = param2 < 7;
            if(_loc14_ == true)
            {
               _loc9_ = ["大小适中的","不错的"];
               return _loc9_[Utils.rand(int(_loc9_.length))];
            }
            _loc13_ = param2 < 9;
            if(_loc13_ == true)
            {
               if(param1 == CockTypesEnum.HORSE)
               {
                  _loc9_ = ["相当大的","小马尺寸的","小马驹般的"];
                  return _loc9_[Utils.rand(int(_loc9_.length))];
               }
               _loc9_ = ["相当大的","长的","长长的"];
               return _loc9_[Utils.rand(int(_loc9_.length))];
            }
            _loc12_ = param2 < 13;
            if(_loc12_ == true)
            {
               if(param1 == CockTypesEnum.DOG)
               {
                  _loc9_ = ["巨大的","一英尺长的","獒犬般的"];
                  return _loc9_[Utils.rand(int(_loc9_.length))];
               }
               _loc9_ = ["巨大的","一英尺长的","黄瓜长度的"];
               return _loc9_[Utils.rand(int(_loc9_.length))];
            }
            _loc11_ = param2 < 18;
            if(_loc11_ == true)
            {
               _loc9_ = ["粗大的","及膝的","前臂长的"];
               return _loc9_[Utils.rand(int(_loc9_.length))];
            }
            _loc10_ = param2 < 30;
            if(_loc10_ == true)
            {
               _loc9_ = ["巨大的","庞大的","手臂般粗的"];
               return _loc9_[Utils.rand(int(_loc9_.length))];
            }
            if(param1 == CockTypesEnum.TENTACLE && Utils.randomChance(50))
            {
               return "盘绕的";
            }
            _loc9_ = ["高耸的","怪异的","怪物般的","粗大的"];
            return _loc9_[Utils.rand(int(_loc9_.length))];
         }
         if(param4 > 75 && Utils.randomChance(50))
         {
            if(param4 > 90)
            {
               if(param5 < 50)
               {
                  _loc9_ = ["跳动的","脉动的"];
                  return _loc9_[Utils.rand(int(_loc9_.length))];
               }
               if(param5 < 200)
               {
                  _loc9_ = ["滴着液的","渗着液的","流着液的"];
                  return _loc9_[Utils.rand(int(_loc9_.length))];
               }
               _loc9_ = ["滴滴答答","喷涌前夕","冒着精泡","满是淫水","流着淫水"];
               return _loc9_[Utils.rand(int(_loc9_.length))];
            }
            if(param5 < 50)
            {
               _loc9_ = ["肿胀","充血","坚硬如石","僵硬","急不可耐"];
               return _loc9_[Utils.rand(int(_loc9_.length))];
            }
            if(param5 < 200)
            {
               _loc9_ = ["肿胀","充血","坚硬如石","僵硬","急不可耐","挂着水珠","缓缓渗液"];
               return _loc9_[Utils.rand(int(_loc9_.length))];
            }
            _loc9_ = ["滴滴答答","流着淫水","渗着体液","漏着淫水"];
            return _loc9_[Utils.rand(int(_loc9_.length))];
         }
         if(param3 <= 0.75 == true)
         {
            _loc9_ = ["细长","苗条","狭窄"];
            return _loc9_[Utils.rand(int(_loc9_.length))];
         }
         _loc13_ = param3 <= 1.2;
         if(_loc13_ == true)
         {
            return "粗壮";
         }
         _loc12_ = param3 <= 1.4;
         if(_loc12_ == true)
         {
            _loc9_ = ["粗壮","大"];
            return _loc9_[Utils.rand(int(_loc9_.length))];
         }
         _loc11_ = param3 <= 2;
         if(_loc11_ == true)
         {
            _loc9_ = ["宽大","肉感","粗硕"];
            return _loc9_[Utils.rand(int(_loc9_.length))];
         }
         _loc10_ = param3 <= 3.5;
         if(_loc10_ == true)
         {
            _loc9_ = ["肥大","肿胀","宽阔"];
            return _loc9_[Utils.rand(int(_loc9_.length))];
         }
         _loc9_ = ["非人般肿胀","怪物般粗大","臃肿"];
         return _loc9_[Utils.rand(int(_loc9_.length))];
      }
      
      public static function cockAdjectives(param1:Number, param2:Number, param3:CockTypesEnum, param4:Creature) : String
      {
         var _loc6_:Boolean = false;
         var _loc7_:Boolean = false;
         var _loc8_:Boolean = false;
         var _loc9_:Boolean = false;
         var _loc10_:Boolean = false;
         var _loc11_:Boolean = false;
         var _loc12_:* = null as Array;
         var _loc5_:String = "";
         if(Utils.randomChance(25))
         {
            if(param1 < 3 == true)
            {
               _loc12_ = ["小巧的","玩具大小的","微小的"];
               _loc5_ = _loc12_[Utils.rand(int(_loc12_.length))];
            }
            else
            {
               _loc11_ = param1 < 5;
               if(_loc11_ == true)
               {
                  _loc12_ = ["短小的","小巧的"];
                  _loc5_ = _loc12_[Utils.rand(int(_loc12_.length))];
               }
               else
               {
                  _loc10_ = param1 < 7;
                  if(_loc10_ == true)
                  {
                     _loc12_ = ["尺寸不错的","漂亮的"];
                     _loc5_ = _loc12_[Utils.rand(int(_loc12_.length))];
                  }
                  else
                  {
                     _loc9_ = param1 < 9;
                     if(_loc9_ == true)
                     {
                        _loc12_ = ["长长的","挺长的","相当大的"];
                        _loc5_ = _loc12_[Utils.rand(int(_loc12_.length))];
                     }
                     else
                     {
                        _loc8_ = param1 < 13;
                        if(_loc8_ == true)
                        {
                           _loc12_ = ["巨大的","一英尺长的"];
                           _loc5_ = _loc12_[Utils.rand(int(_loc12_.length))];
                        }
                        else
                        {
                           _loc7_ = param1 < 18;
                           if(_loc7_ == true)
                           {
                              _loc12_ = ["巨大","巨大"];
                              _loc5_ = _loc12_[Utils.rand(int(_loc12_.length))];
                           }
                           else
                           {
                              _loc6_ = param1 < 30;
                              if(_loc6_ == true)
                              {
                                 _loc12_ = ["硕大","怪兽级"];
                                 _loc5_ = _loc12_[Utils.rand(int(_loc12_.length))];
                              }
                              else
                              {
                                 _loc12_ = ["擎天","畸形","巨大"];
                                 _loc5_ = _loc12_[Utils.rand(int(_loc12_.length))];
                              }
                           }
                        }
                     }
                  }
               }
            }
         }
         else if(Utils.randomChance(25))
         {
            if(param2 <= 0.75 == true)
            {
               _loc5_ = "较细";
            }
            else
            {
               _loc9_ = param2 <= 1.1;
               if(_loc9_ == true)
               {
                  _loc5_ = "不错";
               }
               else
               {
                  _loc8_ = param2 <= 1.4;
                  if(_loc8_ == true)
                  {
                     _loc12_ = ["粗壮","大"];
                     _loc5_ = _loc12_[Utils.rand(int(_loc12_.length))];
                  }
                  else
                  {
                     _loc7_ = param2 <= 2;
                     if(_loc7_ == true)
                     {
                        _loc12_ = ["宽阔的","粗壮的"];
                        _loc5_ = _loc12_[Utils.rand(int(_loc12_.length))];
                     }
                     else
                     {
                        _loc6_ = param2 <= 3.5;
                        if(_loc6_ == true)
                        {
                           _loc12_ = ["肥大的","膨胀的"];
                           _loc5_ = _loc12_[Utils.rand(int(_loc12_.length))];
                        }
                        else
                        {
                           _loc12_ = ["非人般膨胀的","怪物般粗壮的"];
                           _loc5_ = _loc12_[Utils.rand(int(_loc12_.length))];
                        }
                     }
                  }
               }
            }
         }
         else if(param4.get_lust100() > 90)
         {
            if(param4.cumQ() >= 200 && Utils.randomChance(50))
            {
               _loc5_ += param3.get_Group() == "animal" ? "滴着兽精的" : "流着精液的";
            }
            else if(param4.cumQ() > 50 && param4.cumQ() < 200 && Utils.randomChance(50))
            {
               _loc5_ += param3.get_Group() == "animal" ? "渗出兽类前列腺液的" : "被前列腺液润滑的";
            }
            else
            {
               _loc12_ = ["抽动的","脉动的"];
               _loc5_ += _loc12_[Utils.rand(int(_loc12_.length))];
            }
         }
         else if(param4.get_lust100() > 75)
         {
            if(param4.cumQ() > 50 && param4.cumQ() < 200 && Utils.randomChance(50))
            {
               _loc5_ += "渗出前列腺液的";
            }
            else if(param4.cumQ() >= 200 && Utils.randomChance(50))
            {
               _loc5_ += "滴着前列腺液的";
            }
            else
            {
               _loc12_ = ["坚硬如铁的","饥渴的"];
               _loc5_ += _loc12_[Utils.rand(int(_loc12_.length))];
            }
         }
         else if(param4.get_lust100() > 50)
         {
            _loc5_ += "坚硬的";
         }
         else
         {
            _loc5_ += "准备好的";
         }
         return _loc5_;
      }
      
      public static function cockMultiNoun(param1:CockTypesEnum, param2:Creature = undefined) : String
      {
         var _loc6_:* = null as Array;
         var _loc3_:Array = [];
         var _loc4_:String = "";
         var _loc5_:CockTypesEnum = param1;
         if(_loc5_ == CockTypesEnum.ANEMONE)
         {
            _loc3_ = ["海葵"];
         }
         else if(_loc5_ == CockTypesEnum.AVIAN)
         {
            _loc3_ = ["bird","avian"];
         }
         else if(_loc5_ == CockTypesEnum.BEE)
         {
            _loc3_ = ["蜜蜂","昆虫","虫族"];
         }
         else if(_loc5_ == CockTypesEnum.CAT)
         {
            _loc3_ = ["猫科动物","猫","小猫"];
            if(param2 != null && param2.isChild())
            {
               _loc3_.push("小猫咪");
            }
         }
         else if(_loc5_ == CockTypesEnum.DEMON)
         {
            _loc3_ = ["恶魔","恶魔的","腐化的"];
         }
         else if(_loc5_ == CockTypesEnum.DISPLACER)
         {
            _loc3_ = ["移位兽","长须豹","异星"];
         }
         else if(_loc5_ == CockTypesEnum.DOG)
         {
            _loc3_ = ["狗","小狗","犬类"];
            if(param2 != null && param2.isChild())
            {
               _loc3_.push("幼犬");
            }
         }
         else if(_loc5_ == CockTypesEnum.DRAGON)
         {
            _loc3_ = ["龙","龙族"];
         }
         else if(_loc5_ == CockTypesEnum.ECHIDNA)
         {
            _loc3_ = ["echidna"];
         }
         else if(_loc5_ == CockTypesEnum.FERRET)
         {
            _loc3_ = ["雪貂"];
         }
         else if(_loc5_ == CockTypesEnum.FOX)
         {
            _loc3_ = ["fox","vulpine"];
         }
         else if(_loc5_ == CockTypesEnum.GNOLL)
         {
            _loc3_ = ["豺狼人","鬣狗"];
         }
         else if(_loc5_ == CockTypesEnum.HORSE)
         {
            _loc3_ = ["马","马的"];
            if(param2 != null)
            {
               _loc3_.push(param2.mf("公马","母马"));
               if(param2.isChild())
               {
                  _loc3_.push("马驹");
               }
            }
         }
         else if(_loc5_ == CockTypesEnum.KANGAROO)
         {
            _loc3_ = ["袋鼠","小袋鼠"];
         }
         else if(_loc5_ == CockTypesEnum.LIZARD)
         {
            _loc3_ = ["爬行动物","爬行类","蜥蜴","蛇","毒蛇"];
         }
         else if(_loc5_ == CockTypesEnum.PIG)
         {
            _loc3_ = ["pig","piggy"];
         }
         else if(_loc5_ == CockTypesEnum.RED_PANDA)
         {
            _loc3_ = ["red panda"];
         }
         else if(_loc5_ == CockTypesEnum.RHINO)
         {
            _loc3_ = ["犀牛"];
         }
         else if(_loc5_ == CockTypesEnum.TENTACLE)
         {
            _loc3_ = ["触手","植物","藤蔓"];
         }
         else if(_loc5_ == CockTypesEnum.WOLF)
         {
            _loc3_ = ["狼","犬科动物"];
            if(param2 != null && param2.isChild())
            {
               _loc3_.push("幼犬");
            }
         }
         if(int(_loc3_.length) > 0)
         {
            _loc6_ = _loc3_;
            _loc4_ += _loc6_[Utils.rand(int(_loc6_.length))] + "";
         }
         _loc6_ = ["鸡巴","鸡巴","鸡巴","鸡巴","鸡巴","肉棒","肉棒","老二","肉茎","肉茎","肉茎"];
         return _loc4_ + _loc6_[Utils.rand(int(_loc6_.length))];
      }
      
      public static function ballsDescription(param1:Boolean, param2:Boolean, param3:Creature, param4:Boolean = false) : String
      {
         var description:String;
         var _loc6_:* = null as String;
         var _loc7_:* = null as Array;
         var _loc8_:Number = NaN;
         var _loc9_:Boolean = false;
         var _loc10_:Boolean = false;
         var _loc11_:Boolean = false;
         var _loc12_:Boolean = false;
         var _loc13_:Boolean = false;
         var _loc14_:Boolean = false;
         var _loc15_:Boolean = false;
         var _loc16_:Boolean = false;
         var _loc17_:Boolean = false;
         var _loc18_:Boolean = false;
         if(param3.balls == 0)
         {
            return "前列腺";
         }
         description = "";
         var _loc5_:Function = function():void
         {
            if(description.length > 0)
            {
               description += "";
            }
         };
         if(param2 && !param3.hasStatusEffect(StatusEffects.Uniball))
         {
            _loc6_ = description;
            _loc8_ = param3.balls;
            if(_loc8_ == 1)
            {
               _loc7_ = param4 ? ["单个","单独一个","孤单一个","一个个体"] : ["单个","单独","孤立","个别"];
            }
            else if(_loc8_ == 2)
            {
               _loc7_ = param4 ? ["一对","两个","双重"] : ["一对","两个","双重"];
            }
            else if(_loc8_ == 3)
            {
               _loc7_ = param4 ? ["三个","三倍","三人组"] : ["三个","三倍","三人组"];
            }
            else if(_loc8_ == 4)
            {
               _loc7_ = param4 ? ["四个","四重","一组四个"] : ["四个","四重","一组四个"];
            }
            else
            {
               _loc7_ = param4 ? ["大量","许多","一大把"] : ["大量","许多","一大把"];
            }
            description = _loc6_ + _loc7_[Utils.rand(int(_loc7_.length))];
         }
         if(param1 || Utils.randomChance(66))
         {
            _loc5_();
            _loc8_ = param3.ballSize;
            if(_loc8_ >= 18 == true)
            {
               _loc6_ = "肿胀得可怕且大得离谱";
            }
            else
            {
               _loc18_ = _loc8_ >= 15;
               if(_loc18_ == true)
               {
                  _loc6_ = "沙滩排球大小的";
               }
               else
               {
                  _loc17_ = _loc8_ >= 12;
                  if(_loc17_ == true)
                  {
                     _loc6_ = "西瓜大小的";
                  }
                  else
                  {
                     _loc16_ = _loc8_ >= 9;
                     if(_loc16_ == true)
                     {
                        _loc6_ = "篮球大小的";
                     }
                     else
                     {
                        _loc15_ = _loc8_ >= 7;
                        if(_loc15_ == true)
                        {
                           _loc6_ = "足球大小的";
                        }
                        else
                        {
                           _loc14_ = _loc8_ >= 5;
                           if(_loc14_ == true)
                           {
                              _loc6_ = "哈密瓜大小的";
                           }
                           else
                           {
                              _loc13_ = _loc8_ >= 4;
                              if(_loc13_ == true)
                              {
                                 _loc6_ = "西柚大小";
                              }
                              else
                              {
                                 _loc12_ = _loc8_ >= 3;
                                 if(_loc12_ == true)
                                 {
                                    _loc6_ = "苹果大小";
                                 }
                                 else
                                 {
                                    _loc11_ = _loc8_ >= 2;
                                    if(_loc11_ == true)
                                    {
                                       _loc6_ = "棒球大小";
                                    }
                                    else
                                    {
                                       _loc10_ = _loc8_ > 1;
                                       if(_loc10_ == true)
                                       {
                                          _loc6_ = "大";
                                       }
                                       else if(_loc8_ == 1)
                                       {
                                          _loc6_ = "";
                                       }
                                       else
                                       {
                                          _loc9_ = _loc8_ >= 0.5;
                                          _loc6_ = _loc9_ == true ? "小" : "微小";
                                       }
                                    }
                                 }
                              }
                           }
                        }
                     }
                  }
               }
            }
            description += _loc6_;
         }
         if(param3.hasStatusEffect(StatusEffects.Uniball))
         {
            _loc5_();
            _loc7_ = ["紧紧压缩的","紧致的","可爱的","被愉快地挤压的","挤在一起的"];
            description += _loc7_[Utils.rand(int(_loc7_.length))];
         }
         if(param3.get_hoursSinceCum() >= 48 && Utils.randomChance(50) && !param1)
         {
            _loc5_();
            _loc7_ = ["满溢的","肿胀的","充满精液的"];
            description += _loc7_[Utils.rand(int(_loc7_.length))];
         }
         if(description.length == 0 && param3.get_lust100() > 90 && Utils.randomChance(50) && !param1)
         {
            _loc7_ = ["渴望的","饱满的","饥渴的","绝望的","跳动的","发热的","颤抖的","发抖的","震颤的"];
            description += _loc7_[Utils.rand(int(_loc7_.length))];
         }
         if(param3.hasGooSkin())
         {
            _loc5_();
            _loc7_ = ["黏糊糊的","胶状的","黏滑的"];
            description += _loc7_[Utils.rand(int(_loc7_.length))];
         }
         _loc5_();
         _loc7_ = ["卵蛋","性腺","睾丸","睾丸","睾丸","蛋蛋","蛋蛋","蛋蛋"];
         description += _loc7_[Utils.rand(int(_loc7_.length))];
         if(param2)
         {
            description += "";
         }
         return description;
      }
      
      public static function sackDescript(param1:Creature) : String
      {
         var _loc2_:* = null as Array;
         if(param1.balls == 0)
         {
            return "前列腺";
         }
         _loc2_ = ["阴囊","囊袋","蛋袋","阴囊袋","卵袋","肉囊"];
         return _loc2_[Utils.rand(int(_loc2_.length))];
      }
      
      public static function vaginaDescript(param1:Creature, param2:int = 0, param3:Boolean = false) : String
      {
         var description:String;
         var _loc6_:int = 0;
         var _loc7_:* = null as String;
         var _loc8_:Number = NaN;
         var _loc9_:Boolean = false;
         var _loc10_:* = null as String;
         var _loc11_:* = null as Array;
         if(param2 > int(param1.vaginas.length) - 1)
         {
            CoC_Settings.error("<B>错误：传递给 vaginaDescript() 的阴道编号 (" + param2 + ") 无效</b>");
            return "<B>错误：传递给 vaginaDescript() 的阴道编号 (" + param2 + ") 无效</b>";
         }
         if(param2 < 0)
         {
            CoC_Settings.error("<B>错误：传递给 vaginaDescript() 的 vaginaNum (" + param2 + ") 无效</b>");
            return "<B>错误：传递给 vaginaDescript() 的 vaginaNum (" + param2 + ") 无效</b>";
         }
         if(int(param1.vaginas.length) <= 0)
         {
            CoC_Settings.error("错误：在没有阴道的情况下调用了 vaginaDescription");
            return "错误：在没有阴道的情况下调用了 vaginaDescription";
         }
         var _loc4_:Vagina = param1.vaginas[param2];
         description = "";
         var _loc5_:Function = function():void
         {
            if(description.length > 0)
            {
               description += "，";
            }
         };
         switch(_loc4_.vaginalLooseness)
         {
            case 0:
               _loc6_ = 61;
               break;
            case 4:
            case 5:
               _loc6_ = 10;
               break;
            default:
               _loc6_ = 0;
         }
         if(param3 || Utils.randomChance(40 + _loc6_))
         {
            switch(_loc4_.vaginalLooseness)
            {
               case 0:
                  _loc7_ = _loc4_.virgin ? "处女的" : "紧致的";
                  break;
               case 1:
                  _loc7_ = "";
                  break;
               case 2:
                  _loc7_ = "松弛的";
                  break;
               case 3:
                  _loc7_ = "非常松弛的";
                  break;
               case 4:
                  _loc7_ = "合不拢的";
                  break;
               case 5:
                  _loc7_ = "大张着的";
                  break;
               default:
                  _loc7_ = "";
            }
            description += _loc7_;
         }
         if(param3 || Utils.randomChance(30 + _loc6_))
         {
            _loc5_();
            if(param1.hasStatusEffect(StatusEffects.ParasiteEel))
            {
               _loc7_ = description;
               _loc8_ = param1.statusEffectv1(StatusEffects.ParasiteEel);
               if(_loc8_ == 1)
               {
                  _loc10_ = "渗出滴落的";
               }
               else
               {
                  _loc9_ = _loc8_ <= 4;
                  _loc10_ = _loc9_ == true ? "流着粘液的" : "胀满粘液的";
               }
               description = _loc7_ + _loc10_;
            }
            else
            {
               description += Appearance.wetnessDescript(param1,param2);
            }
         }
         if(_loc4_.labiaPierced > 0 && (param3 || Utils.randomChance(33)))
         {
            _loc5_();
            description += "穿孔的";
         }
         if(description.length == 0 && param1.hasGooSkin())
         {
            _loc11_ = ["黏糊糊的","滑溜溜的"];
            description += _loc11_[Utils.rand(int(_loc11_.length))];
         }
         if(_loc4_.type == 5 && (param3 || Utils.randomChance(50)))
         {
            _loc5_();
            _loc11_ = ["黑色的","玛瑙黑的","乌黑的","暗色的","黑貂色的","黑曜石色的","午夜色的","漆黑的"];
            description += _loc11_[Utils.rand(int(_loc11_.length))];
         }
         if(description.length > 0)
         {
            description += "";
         }
         _loc11_ = ["阴道","屄","阴道","屄","小穴","小穴","性交孔","阴道"];
         description += _loc11_[Utils.rand(int(_loc11_.length))];
         return description;
      }
      
      public static function clitDescription(param1:Creature) : String
      {
         var _loc3_:Number = NaN;
         var _loc4_:Boolean = false;
         var _loc5_:Boolean = false;
         var _loc6_:* = null as String;
         var _loc7_:* = null as Array;
         if(!param1.hasVagina())
         {
            CoC_Settings.error("错误：没有阴蒂却调用了阴蒂描述");
            return "错误：没有阴蒂却调用了阴蒂描述";
         }
         var _loc2_:String = "";
         if(Utils.randomChance(50))
         {
            _loc3_ = param1.getClitLength();
            if(_loc3_ >= 4 == true)
            {
               _loc7_ = ["怪物般的","极大的","巨大的","庞大的","粗壮的"];
               _loc6_ = _loc7_[Utils.rand(int(_loc7_.length))];
            }
            else
            {
               _loc5_ = _loc3_ >= 1.5;
               if(_loc5_ == true)
               {
                  _loc7_ = ["大的","大的","可观的","可观的","相当大的"];
                  _loc6_ = _loc7_[Utils.rand(int(_loc7_.length))];
               }
               else
               {
                  _loc4_ = _loc3_ >= 0.3;
                  if(_loc4_ == true)
                  {
                     _loc6_ = "";
                  }
                  else
                  {
                     _loc7_ = ["微小的","小巧的","娇小的","极小的","迷你的"];
                     _loc6_ = _loc7_[Utils.rand(int(_loc7_.length))];
                  }
               }
            }
            _loc2_ += _loc6_;
         }
         if(Utils.randomChance(50) && param1.vaginas[0].clitPierced > 0)
         {
            _loc2_ += "穿环的 ";
         }
         else if(param1.hasFur() && Utils.randomChance(50))
         {
            _loc2_ += "母狗-";
         }
         else if(param1.get_lust100() > 70 && Utils.randomChance(75))
         {
            _loc7_ = ["跳动的","脉动的","坚硬的"];
            _loc2_ += _loc7_[Utils.rand(int(_loc7_.length))];
         }
         else if(param1.get_lib100() > 50 && Utils.randomChance(50))
         {
            _loc7_ = ["欲求不满的","贪婪的","渴求的","贪得无厌的"];
            _loc2_ += _loc7_[Utils.rand(int(_loc7_.length))];
         }
         _loc7_ = ["阴蒂","小阴蒂","豆豆","快乐开关","阴蒂","小阴蒂","豆豆","阴蒂","阴蒂","豆豆"];
         return _loc2_ + _loc7_[Utils.rand(int(_loc7_.length))];
      }
      
      public static function wetnessDescript(param1:Creature, param2:int = 0) : String
      {
         if(param2 > int(param1.vaginas.length) - 1)
         {
            CoC_Settings.error("<B>错误：传递给 wetnessDescript() 的阴道编号 (" + param2 + ") 无效</b>");
            return "<B>错误：传递给 wetnessDescript() 的阴道编号 (" + param2 + ") 无效</b>";
         }
         if(param2 < 0)
         {
            CoC_Settings.error("<B>错误：传递给 wetnessDescript() 的 vaginaNum (" + param2 + ") 无效</b>");
            return "<B>错误：传递给 wetnessDescript() 的 vaginaNum (" + param2 + ") 无效</b>";
         }
         if(int(param1.vaginas.length) <= 0)
         {
            CoC_Settings.error("错误：在没有阴道的情况下调用了 wetnessDescript");
            return "错误：在没有阴道的情况下调用了 wetnessDescript";
         }
         var _loc3_:Number = param1.vaginas[param2].vaginalWetness;
         if(_loc3_ == 0)
         {
            return "干涩的";
         }
         if(_loc3_ == 1)
         {
            return "湿润的";
         }
         if(_loc3_ == 2)
         {
            return "潮湿的";
         }
         if(_loc3_ == 3)
         {
            return "湿滑的";
         }
         if(_loc3_ == 4)
         {
            return "滴水的";
         }
         if(_loc3_ == 5)
         {
            return "泛滥的";
         }
         return "";
      }
      
      public static function buttDescription(param1:Character) : String
      {
         var _loc7_:Boolean = false;
         var _loc8_:Boolean = false;
         var _loc9_:Boolean = false;
         var _loc10_:Boolean = false;
         var _loc11_:Boolean = false;
         var _loc12_:Boolean = false;
         var _loc13_:Boolean = false;
         var _loc14_:* = null as Array;
         var _loc2_:Boolean = param1.tone >= 65;
         var _loc3_:Boolean = param1.tone >= 30;
         var _loc4_:int = _loc2_ ? 2 : (_loc3_ ? 1 : 0);
         var _loc5_:String = "";
         var _loc6_:Number = param1.butt.rating;
         if(_loc6_ >= 20 == true)
         {
            switch(_loc4_)
            {
               case 0:
                  _loc14_ = ["巨大且晃动的","丰满且巨大的","撑破接缝的","惊人且圆润的","弹挺且庞大的","吞没丁字裤的","惊人且肉感十足的","巨大且好拍的","庞大且波浪般晃动的","庞大的","巨大的","庞大的","惊人的"];
                  _loc5_ = _loc14_[Utils.rand(int(_loc14_.length))];
                  break;
               case 1:
                  _loc14_ = ["庞大的","巨大的","极大的","硕大的"];
                  _loc5_ = _loc14_[Utils.rand(int(_loc14_.length))];
                  break;
               case 2:
                  _loc14_ = ["巨大的肌肉臀","庞大且肌肉发达的","巨大但紧致的","强壮且极其巨大的","极大且肌肉发达的","庞大且紧致的","巨大且线条分明的"];
                  _loc5_ = _loc14_[Utils.rand(int(_loc14_.length))];
            }
         }
         else
         {
            _loc13_ = _loc6_ >= 16;
            if(_loc13_ == true)
            {
               switch(_loc4_)
               {
                  case 0:
                     _loc14_ = ["宽广且柔软的","巨大且丰满的","宽广且晃动的","巨大且柔软的","巨大且好拍的","撑破接缝的","丰满且宽广的","庞大且好拍的","庞大的","巨大的","肿胀且像枕头般的"];
                     _loc5_ = _loc14_[Utils.rand(int(_loc14_.length))];
                     break;
                  case 1:
                     _loc14_ = ["晃动的宽广臀部","丰厚的臀肉","巨大的","宽广的","庞大的"];
                     _loc5_ = _loc14_[Utils.rand(int(_loc14_.length))];
                     break;
                  case 2:
                     _loc14_ = ["巨大且结实的","宽广且肌肉发达的","宽广且健壮的","巨大且肌肉发达的","强壮且巨大的","肌肉虬结的"];
                     _loc5_ = _loc14_[Utils.rand(int(_loc14_.length))];
               }
            }
            else
            {
               _loc12_ = _loc6_ >= 13;
               if(_loc12_ == true)
               {
                  switch(_loc4_)
                  {
                     case 0:
                        _loc14_ = ["枕头般的","丰厚软和的","宽大柔软的","柔软丰满的","宽大好捏的","好拍的","厚实的","宽大弹动的","宽大的","硕大的","柔软厚实的"];
                        _loc5_ = _loc14_[Utils.rand(int(_loc14_.length))];
                        break;
                     case 1:
                        _loc14_ = ["宽大的","丰满的","硕大的","宽阔的"];
                        _loc5_ = _loc14_[Utils.rand(int(_loc14_.length))];
                        break;
                     case 2:
                        _loc14_ = ["宽广且肌肉发达的","丰满且波浪般晃动的","丰厚且强有力的","大且魁梧的","健壮且丰满的","强有力的","肌肉发达的","强有力且宽广的"];
                        _loc5_ = _loc14_[Utils.rand(int(_loc14_.length))];
                  }
               }
               else
               {
                  _loc11_ = _loc6_ >= 10;
                  if(_loc11_ == true)
                  {
                     switch(_loc4_)
                     {
                        case 0:
                           _loc14_ = ["超软弹动的","宽大软和的","柔软撑衣的","好捏超大的","宽大的","厚重软和的","好拍厚实的","晃荡的","宽大的","柔软丰满的"];
                           _loc5_ = _loc14_[Utils.rand(int(_loc14_.length))];
                           break;
                        case 1:
                           _loc14_ = ["晃荡的","宽大的","沉甸甸的","撑满衣服的"];
                           _loc5_ = _loc14_[Utils.rand(int(_loc14_.length))];
                           break;
                        case 2:
                           _loc14_ = ["厚实健壮的","大而结实的","厚重有力的","宽大健壮的","紧实撑衣的","厚实的","厚实强壮的"];
                           _loc5_ = _loc14_[Utils.rand(int(_loc14_.length))];
                     }
                  }
                  else
                  {
                     _loc10_ = _loc6_ >= 8;
                     if(_loc10_ == true)
                     {
                        switch(_loc4_)
                        {
                           case 0:
                              _loc14_ = ["硕大弹软的","柔软吸睛的","大而好拍的","柔软好捏的","硕大肉感的","好捏的","软绵绵的","肉感的","丰满讨喜的"];
                              _loc5_ = _loc14_[Utils.rand(int(_loc14_.length))];
                              break;
                           case 1:
                              _loc14_ = ["好捏的","硕大的","结实的"];
                              _loc5_ = _loc14_[Utils.rand(int(_loc14_.length))];
                              break;
                           case 2:
                              _loc14_ = ["硕大肌肉发达的","结实健美的","大而紧致的","好捏健美的","硕大强壮的","大而匀称的","强壮好捏的","硕大的"];
                              _loc5_ = _loc14_[Utils.rand(int(_loc14_.length))];
                        }
                     }
                     else
                     {
                        _loc9_ = _loc6_ >= 6;
                        if(_loc9_ == true)
                        {
                           switch(_loc4_)
                           {
                              case 0:
                                 _loc14_ = ["柔软盈握的屁股","微微晃动的","柔软盈握的","软弹丰满的","肉感匀称的","丰满的","柔软匀称的","圆润软弹的"];
                                 _loc5_ = _loc14_[Utils.rand(int(_loc14_.length))];
                                 break;
                              case 1:
                                 _loc14_ = ["一手难以掌握的","饱满的","匀称的","填满手心的"];
                                 _loc5_ = _loc14_[Utils.rand(int(_loc14_.length))];
                                 break;
                              case 2:
                                 _loc14_ = ["饱满健美的","肌肉结实一手难以掌握的","匀称健美的","肌肉结实填满手心的","匀称轮廓分明的","饱满的","轮廓分明的"];
                                 _loc5_ = _loc14_[Utils.rand(int(_loc14_.length))];
                           }
                        }
                        else
                        {
                           _loc8_ = _loc6_ >= 4;
                           if(_loc8_ == true)
                           {
                              switch(_loc4_)
                              {
                                 case 0:
                                    _loc14_ = ["优美软弹的","柔软的","圆润的心形的","肉感的","柔软好捏的"];
                                    _loc5_ = _loc14_[Utils.rand(int(_loc14_.length))];
                                    break;
                                 case 1:
                                    _loc14_ = ["好看的","尚可的"];
                                    _loc5_ = _loc14_[Utils.rand(int(_loc14_.length))];
                                    break;
                                 case 2:
                                    _loc14_ = ["肌肉线条优美的","紧致优美的","肌肉发达的","线条优美的","紧致的","不错的"];
                                    _loc5_ = _loc14_[Utils.rand(int(_loc14_.length))];
                              }
                           }
                           else
                           {
                              _loc7_ = _loc6_ >= 2;
                              if(_loc7_ == true)
                              {
                                 switch(_loc4_)
                                 {
                                    case 0:
                                       _loc14_ = ["心形的小","柔软小巧的","柔软的心形","小巧柔软的","小的","娇小的","紧凑的"];
                                       _loc5_ = _loc14_[Utils.rand(int(_loc14_.length))];
                                       break;
                                    case 1:
                                       _loc14_ = ["紧致的","结实的","小巧的","娇小的"];
                                       _loc5_ = _loc14_[Utils.rand(int(_loc14_.length))];
                                       break;
                                    case 2:
                                       _loc14_ = ["挺翘结实的","紧致有型的","小巧结实的","紧致的","结实有型的"];
                                       _loc5_ = _loc14_[Utils.rand(int(_loc14_.length))];
                                 }
                              }
                              else if(param1.tone >= 60)
                              {
                                 _loc5_ += "极其紧致、挺翘的";
                              }
                              else
                              {
                                 _loc14_ = ["极小的","非常小的","娇小的"];
                                 _loc5_ = _loc14_[Utils.rand(int(_loc14_.length))];
                                 if(param1.tone <= 30 && Utils.randomChance(33))
                                 {
                                    _loc5_ += "却又柔软的";
                                 }
                              }
                           }
                        }
                     }
                  }
               }
            }
         }
         if(_loc5_.charAt(_loc5_.length - 1) == "的")
         {
            _loc14_ = ["屁股","屁股","屁股","屁股","屁股","屁股","屁股","屁股","后臀","后臀","臀部","臀部","屁股"];
            _loc5_ += _loc14_[Utils.rand(int(_loc14_.length))];
         }
         return _loc5_;
      }
      
      public static function buttDescriptionShort(param1:Creature) : String
      {
         var _loc2_:* = null as String;
         var _loc4_:Boolean = false;
         var _loc5_:Boolean = false;
         var _loc6_:Boolean = false;
         var _loc7_:Boolean = false;
         var _loc8_:Boolean = false;
         var _loc9_:Boolean = false;
         var _loc10_:Boolean = false;
         var _loc11_:* = null as Array;
         var _loc3_:Number = param1.butt.rating;
         if(_loc3_ < 2 == true)
         {
            _loc11_ = ["微不足道的","非常小的"];
            _loc2_ = _loc11_[Utils.rand(int(_loc11_.length))];
         }
         else
         {
            _loc10_ = _loc3_ < 4;
            if(_loc10_ == true)
            {
               _loc11_ = ["紧致的","结实的","小巧的"];
               _loc2_ = _loc11_[Utils.rand(int(_loc11_.length))];
            }
            else
            {
               _loc9_ = _loc3_ < 6;
               if(_loc9_ == true)
               {
                  _loc11_ = ["普通的","不起眼的"];
                  _loc2_ = _loc11_[Utils.rand(int(_loc11_.length))];
               }
               else
               {
                  _loc8_ = _loc3_ < 8;
                  if(_loc8_ == true)
                  {
                     _loc11_ = ["丰满的","匀称的","盈盈一握的"];
                     _loc2_ = _loc11_[Utils.rand(int(_loc11_.length))];
                  }
                  else
                  {
                     _loc7_ = _loc3_ < 10;
                     if(_loc7_ == true)
                     {
                        _loc11_ = ["好捏的","宽大的","分量十足的"];
                        _loc2_ = _loc11_[Utils.rand(int(_loc11_.length))];
                     }
                     else
                     {
                        _loc6_ = _loc3_ < 13;
                        if(_loc6_ == true)
                        {
                           _loc11_ = ["晃荡的","宽阔的","沉甸甸的"];
                           _loc2_ = _loc11_[Utils.rand(int(_loc11_.length))];
                        }
                        else
                        {
                           _loc5_ = _loc3_ < 16;
                           if(_loc5_ == true)
                           {
                              _loc11_ = ["宽广的","硕大的","分量惊人的屁股"];
                              _loc2_ = _loc11_[Utils.rand(int(_loc11_.length))];
                           }
                           else
                           {
                              _loc4_ = _loc3_ < 20;
                              if(_loc4_ == true)
                              {
                                 _loc11_ = ["巨大的","庞大的","肉波荡漾的巨臀"];
                                 _loc2_ = _loc11_[Utils.rand(int(_loc11_.length))];
                              }
                              else
                              {
                                 _loc11_ = ["超大的","巨型的","惊人的"];
                                 _loc2_ = _loc11_[Utils.rand(int(_loc11_.length))];
                              }
                           }
                        }
                     }
                  }
               }
            }
         }
         if(_loc2_.charAt(_loc2_.length - 1) == "的")
         {
            _loc11_ = ["屁股 ","臀部 "];
            _loc2_ += _loc11_[Utils.rand(int(_loc11_.length))];
            if(Utils.randomChance(50))
            {
               _loc2_ += "脸颊";
            }
         }
         return _loc2_;
      }
      
      public static function assholeDescript(param1:Creature, param2:Boolean = false) : String
      {
         var _loc3_:IMap = new IntMap();
         _loc3_.h[0] = "";
         _loc3_.h[1] = "";
         _loc3_.h[2] = "湿润的";
         _loc3_.h[3] = "黏糊糊的";
         _loc3_.h[4] = "流着水的";
         _loc3_.h[5] = "流着黏液的";
         var _loc4_:IMap = _loc3_;
         var _loc5_:IMap = new IntMap();
         _loc5_.h[0] = "未开发的";
         _loc5_.h[1] = "紧致的";
         _loc5_.h[2] = "松弛的";
         _loc5_.h[3] = "宽敞的";
         _loc5_.h[4] = "被撑开的";
         _loc5_.h[5] = "合不拢的";
         var _loc6_:IMap = _loc5_;
         var _loc7_:String = "";
         if(param2 || Utils.randomChance(66))
         {
            _loc7_ += _loc4_.h[param1.ass.analWetness];
         }
         if(param2 || param1.ass.analLooseness == 0 || Utils.randomChance(25) || param1.ass.analLooseness <= 1 && Utils.randomChance(75))
         {
            _loc7_ += _loc6_.h[param1.ass.analLooseness];
         }
         var _loc8_:Array = ["屁股","肛门","后庭","后门","屁眼","菊花"];
         return _loc7_ + _loc8_[Utils.rand(int(_loc8_.length))];
      }
      
      public static function skinnyText(param1:Creature, param2:Boolean = false) : String
      {
         switch(param1.skin.type)
         {
            case 1:
               return "毛茸茸的";
            case 2:
            case 5:
            case 6:
               return "长满鳞片的";
            case 3:
               return "黏糊糊的";
            case 7:
               return "绒毛的";
            case 8:
               return "羽毛的";
            case 10:
               return "植物般的";
            case 11:
               return "木质的";
            default:
               if(param2)
               {
                  return "骨瘦如柴的";
               }
               return "";
         }
      }
      
      public static function handsDescriptShort(param1:Creature, param2:Boolean = true) : String
      {
         var _loc3_:String = "";
         switch(param1.arms.type)
         {
            case 4:
               if(param1.arms.claws.type == 9)
               {
                  _loc3_ = "猛禽爪";
               }
               else
               {
                  _loc3_ = "爪子";
               }
               break;
            case 5:
            case 13:
            case 14:
               _loc3_ = "爪子";
               break;
            case 6:
            case 8:
            case 9:
            case 10:
            case 11:
            case 12:
            case 15:
               _loc3_ = "爪子";
               break;
            case 7:
               _loc3_ = "猛禽爪";
               break;
            default:
               _loc3_ = "手";
         }
         return _loc3_ + (param2 ? "" : "");
      }
      
      public static function handsDescript(param1:Creature, param2:Boolean = true) : String
      {
         var _loc3_:String = "";
         var _loc4_:String = "";
         switch(param1.arms.type)
         {
            case 2:
            case 3:
               _loc3_ += "长有甲壳的";
               break;
            case 4:
               _loc3_ += Appearance.skinnyText(param1);
               if(_loc3_ != "")
               {
                  _loc4_ = ", ";
               }
               switch(param1.arms.claws.type)
               {
                  case 0:
                     break;
                  case 7:
                     _loc3_ += _loc4_ + "长有镰刀的";
                     break;
                  case 9:
                     _loc3_ += _loc4_ + "长有利爪的";
                     break;
                  default:
                     _loc3_ += _loc4_ + "长有爪子的";
               }
               break;
            case 5:
            case 13:
            case 14:
               _loc3_ += "长有鳞片和爪子的";
               break;
            case 6:
            case 8:
               _loc3_ += "毛茸茸的、长有爪子的、像爪子一样的";
               break;
            case 7:
               _loc3_ += "长有鳞片和利爪的";
               break;
            default:
               _loc3_ += Appearance.skinnyText(param1);
         }
         if(_loc3_ != "")
         {
            _loc3_ += " ";
         }
         return _loc3_ + (param2 ? "手" : "手");
      }
      
      public static function rearBodyDescript(param1:Creature) : String
      {
         return Appearance.DEFAULT_REAR_BODY_NAMES.h[param1.rearBody.type];
      }
      
      public static function neckDescript(param1:Creature) : String
      {
         return Appearance.DEFAULT_NECK_NAMES.h[param1.neck.type] + "脖子";
      }
      
      public static function wingsDescript(param1:Creature) : String
      {
         return Appearance.DEFAULT_WING_NAMES.h[param1.wings.type] + "翅膀";
      }
      
      public static function eyesDescript(param1:Creature) : String
      {
         if(param1.eyes.type == 0)
         {
            return "眼睛";
         }
         return Appearance.DEFAULT_EYES_NAMES.h[param1.eyes.type] + "眼睛";
      }
      
      public static function extraEyesDescript(param1:Creature) : String
      {
         return Utils.num2Text(param1.eyes.count - 2) + (param1.eyes.type == 0 ? "" : "" + Appearance.DEFAULT_EYES_NAMES.h[param1.eyes.type]) + (param1.eyes.count == 3 ? "只眼睛" : "只眼睛");
      }
      
      public static function extraEyesDescriptShort(param1:Creature) : String
      {
         return Utils.num2Text(param1.eyes.count - 2) + (param1.eyes.count == 3 ? " 只眼睛" : " 只眼睛");
      }
      
      public static function nagaLowerBodyColor2(param1:Creature) : String
      {
         var _loc4_:* = null as String;
         var _loc5_:* = null as StringMap;
         var _loc2_:String = param1.underBody.skin.tone;
         var _loc3_:StringMap = Appearance.NAGA_LOWER_BODY_COLORS;
         if(_loc2_ in StringMap.reserved ? _loc3_.existsReserved(_loc2_) : _loc2_ in _loc3_.h)
         {
            _loc4_ = param1.underBody.skin.tone;
            _loc5_ = Appearance.NAGA_LOWER_BODY_COLORS;
            if(_loc4_ in StringMap.reserved)
            {
               return _loc5_.getReserved(_loc4_);
            }
            return _loc5_.h[_loc4_];
         }
         return param1.underBody.skin.tone;
      }
      
      public static function redPandaTailColor2(param1:Creature) : String
      {
         var _loc4_:* = null as String;
         var _loc5_:* = null as StringMap;
         var _loc2_:String = param1.skin.furColor;
         var _loc3_:StringMap = Appearance.RED_PANDA_TAIL_COLORS;
         if(_loc2_ in StringMap.reserved ? _loc3_.existsReserved(_loc2_) : _loc2_ in _loc3_.h)
         {
            _loc4_ = param1.skin.furColor;
            _loc5_ = Appearance.RED_PANDA_TAIL_COLORS;
            if(_loc4_ in StringMap.reserved)
            {
               return _loc5_.getReserved(_loc4_);
            }
            return _loc5_.h[_loc4_];
         }
         return "深灰色";
      }
      
      public static function breastCup(param1:Number) : String
      {
         return Appearance.BREAST_CUP_NAMES[int(Math.min(Math.floor(param1),int(Appearance.BREAST_CUP_NAMES.length) - 1))];
      }
      
      public static function breastCupInverse(param1:String, param2:Number = 0) : Number
      {
         var _loc6_:int = 0;
         if(param1.length == 0)
         {
            return param2;
         }
         if(param1 == "平胸" || param1 == "flat")
         {
            return 0;
         }
         var _loc3_:Boolean = param1.charAt(param1.length - 1) == "+";
         if(_loc3_)
         {
            param1 = param1.substr(0,param1.length - 1);
         }
         var _loc4_:int = 0;
         var _loc5_:int = int(Appearance.BREAST_CUP_NAMES.length);
         while(_loc4_ < _loc5_)
         {
            _loc6_ = _loc4_++;
            if(param1 == Appearance.BREAST_CUP_NAMES[_loc6_])
            {
               return _loc6_;
            }
            if(Appearance.BREAST_CUP_NAMES[_loc6_].indexOf(param1) == 0)
            {
               return _loc6_ + (_loc3_ ? 1 : 0);
            }
         }
         return param2;
      }
      
      public static function describeByScale(param1:Number, param2:Array, param3:String = undefined, param4:String = undefined) : String
      {
         var _loc7_:int = 0;
         if(param3 == null)
         {
            param3 = "少于";
         }
         if(param4 == null)
         {
            param4 = "多于";
         }
         if(int(param2.length) == 0)
         {
            return "难以描述";
         }
         if(int(param2.length) == 1)
         {
            return "大约" + param2[0].descript;
         }
         if(param1 < int(param2[0].val))
         {
            return param3 + " " + int(param2[0].val);
         }
         if(param1 == int(param2[0].val))
         {
            return param2[0].descript;
         }
         var _loc5_:int = 1;
         var _loc6_:int = int(param2.length);
         while(_loc5_ < _loc6_)
         {
            _loc7_ = _loc5_++;
            if(param1 < int(param2[_loc7_].val))
            {
               return "介于" + param2[_loc7_ - 1].descript + "和" + param2[_loc7_].descript + "之间";
            }
            if(param1 == int(param2[_loc7_].val))
            {
               return param2[_loc7_].descript;
            }
         }
         return param4 + " " + param2[int(param2.length) - 1].descript;
      }
      
      public static function numberOfThings(param1:int, param2:String, param3:String = undefined) : String
      {
         if(param3 == null)
         {
            param3 = param2 + "";
         }
         if(param1 == 0)
         {
            return "0" + param3;
         }
         if(param1 == 1)
         {
            return "1" + param2;
         }
         return param1 + "" + param3;
      }
      
      public static function feetsAndInches(param1:Number) : String
      {
         var _loc2_:int = int(Math.floor(param1 / 12));
         var _loc3_:Number = param1 - _loc2_ * 12;
         if(_loc2_ > 0)
         {
            return _loc2_ + "\'" + _loc3_ + "\"";
         }
         return _loc3_ + "\"";
      }
      
      public static function inchesAndFeetsAndInches(param1:Number) : String
      {
         if(param1 < 12)
         {
            return param1 + "\"";
         }
         return param1 + "\" (" + Appearance.feetsAndInches(param1) + ")";
      }
      
      public static function allBreastsDescript(param1:Creature) : String
      {
         var _loc3_:* = null as Array;
         var _loc2_:String = "";
         switch(int(param1.breastRows.length))
         {
            case 0:
               return "平平无奇的胸肌 ";
            case 2:
               _loc2_ += "两排";
               break;
            case 3:
               _loc3_ = ["三排","多层"];
               _loc2_ += _loc3_[Utils.rand(int(_loc3_.length))];
               break;
            case 4:
               _loc3_ = ["四排","四层"];
               _loc2_ += _loc3_[Utils.rand(int(_loc3_.length))];
               break;
            case 5:
               _loc3_ = ["五排","五层"];
               _loc2_ += _loc3_[Utils.rand(int(_loc3_.length))];
         }
         return _loc2_ + Appearance.biggestBreastSizeDescript(param1);
      }
      
      public static function tailDescript(param1:Creature) : String
      {
         var _loc2_:* = null as String;
         var _loc3_:Number = NaN;
         if(param1.tail.type == 0)
         {
            return "<b>!该生物没有可描述的尾巴！</b>";
         }
         if(param1.tail.type == 13 && param1.tail.venom >= 1)
         {
            _loc2_ = "条狐妖尾巴";
            _loc3_ = param1.tail.venom;
            if(_loc3_ == 1)
            {
               return "狐妖尾巴";
            }
            if(_loc3_ == 2)
            {
               return "两" + _loc2_;
            }
            if(_loc3_ == 3)
            {
               return "三" + _loc2_;
            }
            if(_loc3_ == 4)
            {
               return "四" + _loc2_;
            }
            if(_loc3_ == 5)
            {
               return "五" + _loc2_;
            }
            return "数" + _loc2_;
         }
         return Appearance.DEFAULT_TAIL_NAMES.h[param1.tail.type] + "尾巴";
      }
      
      public static function oneTailDescript(param1:Creature) : String
      {
         if(param1.tail.type == 0)
         {
            return "<b>!该生物没有可描述的尾巴！</b>";
         }
         if(param1.tail.type == 13 && param1.tail.venom >= 1)
         {
            if(param1.tail.venom == 1)
            {
               return "你的狐狸尾巴";
            }
            return "你的一条狐狸尾巴";
         }
         return "你的" + Appearance.DEFAULT_TAIL_NAMES.h[param1.tail.type] + "尾巴";
      }
      
      public static function biggestBreastSizeDescript(param1:Creature) : String
      {
         var _loc5_:* = null as String;
         var _loc6_:Number = NaN;
         var _loc7_:Boolean = false;
         var _loc2_:String = "";
         var _loc3_:int = param1.biggestTitRow();
         if(int(param1.breastRows.length) - 1 < _loc3_)
         {
            CoC_Settings.error("");
            return "<b>错误，biggestBreastSizeDescript()处理了无效的breastRow</b>";
         }
         if(_loc3_ < 0)
         {
            CoC_Settings.error("");
            return "错误，糟糕！BIGGESTBREASTSIZEDESCRIPT传入了负数！";
         }
         var _loc4_:BreastRow = param1.breastRows[_loc3_];
         if(_loc4_.breastRating < 1)
         {
            return "平坦的乳房";
         }
         if(Utils.randomChance(50))
         {
            _loc2_ += Appearance.breastSize(_loc4_.breastRating);
         }
         switch(Utils.rand(10))
         {
            case 0:
               _loc5_ = "乳房";
               break;
            case 1:
               _loc5_ = _loc4_.lactationMultiplier > 2 ? "奶牛乳房" : "乳房";
               break;
            case 2:
               _loc5_ = (_loc4_.lactationMultiplier > 1.5 ? "乳汁充盈的" : "") + (_loc4_.breastRating > 4 ? "奶子" : "乳房");
               break;
            case 3:
               _loc5_ = "乳房";
               break;
            case 4:
            case 5:
            case 6:
               _loc5_ = "奶子";
               break;
            case 7:
               _loc6_ = _loc4_.lactationMultiplier;
               if(_loc6_ < 1 == true)
               {
                  _loc5_ = "双峰";
               }
               else
               {
                  _loc7_ = _loc6_ < 2.5;
                  _loc5_ = _loc7_ == true ? "奶罐" : "乳房";
               }
               break;
            case 8:
               _loc5_ = _loc4_.breastRating > 6 ? "爱之枕" : "奶子";
               break;
            case 9:
               _loc5_ = _loc4_.breastRating > 6 ? "咪咪" : "胸部";
               break;
            default:
               _loc5_ = "";
         }
         return _loc2_ + _loc5_;
      }
      
      public static function breastSize(param1:Number) : String
      {
         var _loc2_:Boolean = false;
         var _loc3_:Boolean = false;
         var _loc4_:Boolean = false;
         var _loc5_:Boolean = false;
         var _loc6_:Boolean = false;
         var _loc7_:Boolean = false;
         var _loc8_:Boolean = false;
         var _loc9_:* = null as Array;
         if(param1 >= 100 == true)
         {
            _loc9_ = ["大得离谱的","大得吓人的","大得荒谬的","压断背的","庞大的","巨大的"];
            return _loc9_[Utils.rand(int(_loc9_.length))];
         }
         _loc8_ = param1 >= 35;
         if(_loc8_ == true)
         {
            _loc9_ = ["如山般的","极其巨大的","压断背的","瑜伽球大小的","巨大的"];
            return _loc9_[Utils.rand(int(_loc9_.length))];
         }
         _loc7_ = param1 >= 24;
         if(_loc7_ == true)
         {
            _loc9_ = ["硕大充满母性的","丰满诱人的","令人窒息的","惊人的"];
            return _loc9_[Utils.rand(int(_loc9_.length))];
         }
         _loc6_ = param1 >= 15;
         if(_loc6_ == true)
         {
            _loc9_ = ["篮球般大小的","淫荡的","软垫般的","摇晃的"];
            return _loc9_[Utils.rand(int(_loc9_.length))];
         }
         _loc5_ = param1 >= 11;
         if(_loc5_ == true)
         {
            _loc9_ = ["足球般大小的","一手难以掌握的","丰满的","抖动的"];
            return _loc9_[Utils.rand(int(_loc9_.length))];
         }
         _loc4_ = param1 >= 5;
         if(_loc4_ == true)
         {
            _loc9_ = ["大的","巨大的","枕头般的","弹动的","排球般大小的"];
            return _loc9_[Utils.rand(int(_loc9_.length))];
         }
         _loc3_ = param1 >= 3;
         if(_loc3_ == true)
         {
            _loc9_ = ["漂亮的","盈盈一握的","圆润的","柔软的","垒球般大小的"];
            return _loc9_[Utils.rand(int(_loc9_.length))];
         }
         _loc2_ = param1 >= 1;
         if(_loc2_ == true)
         {
            _loc9_ = ["一手可握的","紧致的","挺拔的","棒球般大小的"];
            return _loc9_[Utils.rand(int(_loc9_.length))];
         }
         return "充满男子气概的 ";
      }
      
      public static function assholeOrPussy(param1:Creature) : String
      {
         if(param1.hasVagina())
         {
            return Appearance.vaginaDescript(param1,0);
         }
         return Appearance.assholeDescript(param1);
      }
      
      public static function multiCockDescriptLight(param1:Creature, param2:int = -1) : String
      {
         var separator:String;
         var sameType:CockTypesEnum;
         var creature:Creature;
         var _loc7_:* = null as Cock;
         creature = param1;
         var _loc3_:int = int(creature.cocks.length);
         if(_loc3_ < 1)
         {
            CoC_Settings.error("");
            return "<B>错误：在没有阴茎的情况下调用了multiCockDescriptLight()。</B>";
         }
         if(_loc3_ == 1 || _loc3_ == 2 && param2 >= 0 && param2 < _loc3_)
         {
            return creature.cockDescript(0);
         }
         var _loc4_:Array = [];
         var _loc5_:int = 0;
         var _loc6_:Array = creature.cocks;
         while(_loc5_ < int(_loc6_.length))
         {
            _loc7_ = _loc6_[_loc5_];
            _loc5_++;
            if(!(param2 >= 0 && _loc7_ == creature.cocks[param2]))
            {
               if(!Boolean(_loc4_.contains(_loc7_.get_cockType())))
               {
                  _loc4_.push(_loc7_.get_cockType());
               }
            }
         }
         var _loc8_:Boolean = int(_loc4_.length) == 1;
         sameType = _loc4_[0];
         separator = sameType == CockTypesEnum.HUMAN ? " " : ", ";
         var _loc9_:Function = function(... rest):String
         {
            var _loc3_:String = rest[Utils.rand(int(rest.length))] + creature.cockAdjective() + separator + Appearance.cockNoun(sameType);
            if(_loc3_.indexOf("penis") >= 0)
            {
               _loc3_ += "";
            }
            return _loc3_ + "";
         };
         var _loc10_:Function = function(... rest):String
         {
            var _loc3_:Array = ["变异的阴茎","变异的肉棒","混合的阴茎","不匹配的肉棒"];
            return rest[Utils.rand(int(rest.length))] + creature.cockAdjective() + "，" + _loc3_[Utils.rand(int(_loc3_.length))];
         };
         switch(_loc3_)
         {
            case 2:
               if(_loc8_)
               {
                  return _loc9_("一对","两根","一双","匹配的","孪生的");
               }
               return _loc10_("一对","两个","一双");
               break;
            case 3:
               if(_loc8_)
               {
                  return _loc9_("三个","一组","<i>三人行</i>的","三位一体的","三巨头般的");
               }
               return _loc10_("三个","一组");
               break;
            default:
               if(_loc8_)
               {
                  return _loc9_("一捆","淫乱的一群","一簇","蠕动的一团");
               }
               return _loc10_("一捆","淫乱的一群","一簇","蠕动的一团");
         }
      }
      
      public static function multiCockDescript(param1:Creature) : String
      {
         var adjectives:String;
         var separator:String;
         var firstType:CockTypesEnum;
         var _loc8_:* = null as Cock;
         var _loc2_:Number = int(param1.cocks.length);
         if(int(param1.cocks.length) < 1)
         {
            CoC_Settings.error("");
            return "<B>错误：调用 multiCockDescript() 时没有阴茎存在。</B>";
         }
         firstType = param1.cocks[0].get_cockType();
         if(_loc2_ == 1)
         {
            if(Boolean([CockTypesEnum.DOG,CockTypesEnum.WOLF,CockTypesEnum.HORSE].contains(firstType)))
            {
               return Appearance.cockNoun(firstType);
            }
            return Appearance.cockDescript(param1,0);
         }
         var _loc3_:Number = 0;
         var _loc4_:Number = 0;
         var _loc5_:Array = [];
         var _loc6_:int = 0;
         var _loc7_:Array = param1.cocks;
         while(_loc6_ < int(_loc7_.length))
         {
            _loc8_ = _loc7_[_loc6_];
            _loc6_++;
            _loc3_ += _loc8_.cockLength;
            _loc4_ += _loc8_.cockThickness;
            if(!Boolean(_loc5_.contains(_loc8_.get_cockType())))
            {
               _loc5_.push(_loc8_.get_cockType());
            }
         }
         var _loc9_:Boolean = int(_loc5_.length) == 1;
         separator = firstType == CockTypesEnum.HUMAN ? " " : ", ";
         _loc3_ /= _loc2_;
         _loc4_ /= _loc2_;
         adjectives = Appearance.cockAdjectives(_loc3_,_loc4_,firstType,param1);
         var _loc10_:Function = function(... rest):String
         {
            var _loc3_:String = rest[Utils.rand(int(rest.length))] + adjectives + separator + Appearance.cockNoun(firstType);
            if(_loc3_.indexOf("penis") >= 0)
            {
               _loc3_ += "";
            }
            return _loc3_ + "";
         };
         var _loc11_:Function = function(... rest):String
         {
            var _loc3_:Array = ["变异的鸡巴","变异的肉棒","混合的鸡巴","不匹配的肉棒"];
            return rest[Utils.rand(int(rest.length))] + adjectives + ", " + _loc3_[Utils.rand(int(_loc3_.length))];
         };
         var _loc12_:Number = _loc2_;
         if(_loc12_ == 2)
         {
            if(_loc9_)
            {
               return _loc10_("一对","两根","一双","相配的","成对的");
            }
            return _loc11_("一对","两根","一双");
         }
         if(_loc12_ == 3)
         {
            if(_loc9_)
            {
               return _loc10_("三个","一群","一个<i>三人行</i>的","一个三合会的","一个三巨头的");
            }
            return _loc11_("三个","一群");
         }
         if(_loc9_)
         {
            return _loc10_("一捆","一群淫秽的","一簇","一群蠕动的");
         }
         return _loc11_("一捆","一群淫秽的","一簇","一群蠕动的");
      }
      
      public static function earDescript(param1:Creature, param2:Boolean = true) : String
      {
         var _loc3_:String = "";
         switch(param1.ears.type)
         {
            case 1:
            case 2:
            case 3:
            case 5:
            case 7:
            case 8:
            case 9:
            case 11:
            case 12:
            case 13:
            case 14:
            case 17:
            case 18:
            case 19:
            case 22:
               _loc3_ = "毛茸茸的耳朵";
               break;
            case 4:
            case 20:
               _loc3_ = KGAMECLASS.kGAMECLASS.get_silly() && Utils.randomChance(10) ? "操逼把手" : "精灵耳";
               break;
            case 6:
            case 16:
            case 21:
               _loc3_ = "耳洞";
               break;
            case 10:
               _loc3_ = "骨鳍";
               break;
            case 15:
               _loc3_ = "犀牛耳";
               break;
            default:
               _loc3_ = "耳朵";
         }
         if(param2)
         {
            _loc3_ += "";
         }
         return _loc3_;
      }
   }
}

