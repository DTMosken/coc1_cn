package coc.view
{
   import classes.CoC;
   import classes.Player;
   import classes.SettingsGlobalDisplay;
   import classes.display.GameViewData;
   import classes.globalFlags.KGAMECLASS;
   import classes.internals.Utils;
   import flash.Boot;
   import flash.display.Bitmap;
   import flash.filters.DropShadowFilter;
   import flash.text.Font;
   import flash.text.TextField;
   import flash.text.TextFormat;
   import openfl.utils.Assets;
   
   public class StatsView extends Block implements ThemeObserver
   {
      
      public static var ValueFontOld:String = "Lucida Sans Typewriter";
      
      public static var ValueFont:String = "Alibaba PuHuiTi 3 85 Bold";
      
      public var xpBar:StatBar;
      
      public var touBar:StatBar;
      
      public var timeText:TextField;
      
      public var strBar:StatBar;
      
      public var speBar:StatBar;
      
      public var sideBarBG:BitmapDataSprite;
      
      public var senBar:StatBar;
      
      public var prevName:String;
      
      public var nameText:TextField;
      
      public var lustBar:StatBar;
      
      public var libBar:StatBar;
      
      public var levelBar:StatBar;
      
      public var intBar:StatBar;
      
      public var hungerBar:StatBar;
      
      public var hpBar:StatBar;
      
      public var gemsBar:StatBar;
      
      public var fatigueBar:StatBar;
      
      public var coreStatsText:TextField;
      
      public var corBar:StatBar;
      
      public var combatStatsText:TextField;
      
      public var allStats:Array;
      
      public var advancementText:TextField;
      
      public function StatsView(param1:MainView = undefined)
      {
         if(Boot.skip_constructor)
         {
            return;
         }
         super(new LayoutConfig(LayoutType.Flow(FlowDirection.Column,1),true,4,null,null,null,null,null));
         set_width(205);
         set_height(602);
         var _loc2_:DefaultTextFormatParameters = new DefaultTextFormatParameters(Assets.getFont("res/fonts/pala.ttf").fontName,22,null,true,null,null,null,null,null,null,null,null,null);
         var _loc3_:DefaultTextFormatParameters = new DefaultTextFormatParameters(Assets.getFont("res/fonts/lucida sans typewriter.ttf").fontName,18,null,null,null,null,null,null,null,null,null,null,null);
         StatBar.setDefaultOptions(new StatBarOptions(get_innerWidth(),null,null,null,null,null,null,null,null,null,null,null,null,null,null,6291456,null,null));
         sideBarBG = addBitmapDataSprite(new BitmapDataSprite(null,null,true,0,0,602,205,false,"",0,false,1,true),new LayoutHint(true,null,null,null,null,null,null));
         nameText = addTextField(new TextFieldParameters(null,null,null,null,null,null,null,null,_loc2_,null,null,null,null,null,null,null,null));
         coreStatsText = addTextField(new TextFieldParameters("核心属性：",null,null,null,null,null,null,null,_loc2_,null,null,null,null,null,null,null,null),new LayoutHint(null,null,null,null,null,1,null));
         addElement(strBar = new StatBar(new StatBarOptions(null,null,null,null,null,"力量：",null,null,null,null,null,null,null,null,null,null,null,null)));
         addElement(touBar = new StatBar(new StatBarOptions(null,null,null,null,null,"体质：",null,null,null,null,null,null,null,null,null,null,null,null)));
         addElement(speBar = new StatBar(new StatBarOptions(null,null,null,null,null,"速度：",null,null,null,null,null,null,null,null,null,null,null,null)));
         addElement(intBar = new StatBar(new StatBarOptions(null,null,null,null,null,"智力：",null,null,null,null,null,null,null,null,null,null,null,null)));
         addElement(libBar = new StatBar(new StatBarOptions(null,null,null,100,null,"性欲：",null,null,null,null,null,null,null,null,null,null,null,null)));
         addElement(senBar = new StatBar(new StatBarOptions(null,null,null,100,null,"敏感度：",null,null,null,null,null,null,null,null,null,null,null,null)));
         addElement(corBar = new StatBar(new StatBarOptions(null,null,null,100,null,"腐化：",null,null,null,null,null,null,null,null,null,null,null,null)));
         combatStatsText = addTextField(new TextFieldParameters("战斗属性：",null,null,null,null,null,null,null,_loc2_,null,null,null,null,null,null,null,null),new LayoutHint(null,null,null,null,null,1,null));
         addElement(hpBar = new StatBar(new StatBarOptions(null,null,null,null,null,"生命值：",true,null,null,null,null,true,null,null,null,11631966,11038290,null)));
         addElement(lustBar = new StatBar(new StatBarOptions(null,null,null,null,null,"欲望：",true,null,null,null,null,true,null,null,null,null,8913153,null)));
         addElement(fatigueBar = new StatBar(new StatBarOptions(null,null,null,null,null,"疲劳：",true,null,null,null,null,null,null,null,null,null,null,null)));
         addElement(hungerBar = new StatBar(new StatBarOptions(null,null,null,null,null,"饱足：",true,null,null,null,null,null,null,null,null,null,null,null)));
         advancementText = addTextField(new TextFieldParameters("成长：",null,null,null,null,null,null,null,_loc2_,null,null,null,null,null,null,null,null),new LayoutHint(null,null,null,null,null,1,null));
         addElement(levelBar = new StatBar(new StatBarOptions(null,null,null,null,null,"等级：",null,null,null,null,false,null,null,null,null,null,null,null)));
         addElement(xpBar = new StatBar(new StatBarOptions(null,null,null,null,null,"经验：",true,null,null,null,null,null,null,null,null,null,null,null)));
         addElement(gemsBar = new StatBar(new StatBarOptions(null,null,null,null,null,"宝石：",null,null,null,null,false,null,null,null,null,null,null,null)));
         timeText = addTextField(new TextFieldParameters(null,"<u>Day#: 0</u>\nTime: 00:00",null,null,null,null,null,null,_loc3_,null,null,null,null,null,null,null,null),new LayoutHint(null,null,null,null,null,1,null));
         timeText.multiline = true;
         allStats = [strBar,touBar,speBar,intBar,libBar,senBar,corBar,hpBar,lustBar,fatigueBar,hungerBar,levelBar,xpBar,gemsBar];
         Theme.subscribe(this);
      }
      
      public function update(param1:String) : void
      {
         sideBarBG.set_bitmap(Theme.current.get_sidebarBg());
      }
      
      public function toggleHungerBar(param1:Boolean) : void
      {
         hungerBar.visible = param1;
         invalidateLayout();
      }
      
      public function statByName(param1:String) : StatBar
      {
         var _loc2_:String = param1.toLowerCase();
         if(_loc2_ == "cor")
         {
            return corBar;
         }
         if(_loc2_ == "fatigue")
         {
            return fatigueBar;
         }
         if(_loc2_ == "gems")
         {
            return gemsBar;
         }
         if(_loc2_ == "hp")
         {
            return hpBar;
         }
         if(_loc2_ == "hunger")
         {
            return hungerBar;
         }
         if(_loc2_ != "int")
         {
            if(_loc2_ != "inte")
            {
               if(_loc2_ == "level")
               {
                  return levelBar;
               }
               if(_loc2_ == "lib")
               {
                  return libBar;
               }
               if(_loc2_ == "lust")
               {
                  return lustBar;
               }
               if(_loc2_ != "sen")
               {
                  if(_loc2_ != "sens")
                  {
                     if(_loc2_ == "spe")
                     {
                        return speBar;
                     }
                     if(_loc2_ == "str")
                     {
                        return strBar;
                     }
                     if(_loc2_ == "tou")
                     {
                        return touBar;
                     }
                     if(_loc2_ == "xp")
                     {
                        return xpBar;
                     }
                     return null;
                  }
               }
               return senBar;
            }
         }
         return intBar;
      }
      
      public function showStatUp(param1:String) : void
      {
         var _loc2_:StatBar = statByName(param1);
         if(_loc2_ != null)
         {
            _loc2_.set_isUp(true);
         }
      }
      
      public function showStatDown(param1:String) : void
      {
         var _loc2_:StatBar = statByName(param1);
         if(_loc2_ != null)
         {
            _loc2_.set_isDown(true);
         }
      }
      
      public function showLevelUp() : void
      {
         levelBar.set_isUp(true);
      }
      
      public function show() : void
      {
         visible = true;
      }
      
      public function setTheme(param1:String, param2:uint, param3:Number) : void
      {
         var _loc4_:* = null as TextFormat;
         var _loc8_:* = null as StatBar;
         var _loc5_:DropShadowFilter = new DropShadowFilter();
         var _loc6_:int = 0;
         var _loc7_:Array = allStats;
         while(_loc6_ < int(_loc7_.length))
         {
            _loc8_ = _loc7_[_loc6_];
            _loc6_++;
            _loc4_ = _loc8_.valueLabel.defaultTextFormat;
            _loc4_.color = param2;
            _loc4_.font = param1;
            _loc8_.valueLabel.defaultTextFormat = _loc4_;
            _loc8_.valueLabel.setTextFormat(_loc4_);
            _loc4_ = _loc8_.nameLabel.defaultTextFormat;
            _loc4_.color = param2;
            _loc8_.nameLabel.defaultTextFormat = _loc4_;
            _loc8_.nameLabel.setTextFormat(_loc4_);
            if(_loc8_.bar != null)
            {
               _loc8_.bar.alpha = param3;
               if(int(_loc8_.bar.filters.length) < 1)
               {
                  _loc8_.bar.filters = [_loc5_];
               }
            }
            if(_loc8_.minBar != null)
            {
               _loc8_.minBar.alpha = 1 - (1 - param3) / 2;
            }
            _loc8_.update("StatsView");
         }
         var _loc9_:TextField = nameText;
         _loc4_ = _loc9_.defaultTextFormat;
         _loc4_.color = param2;
         _loc9_.defaultTextFormat = _loc4_;
         _loc9_.textColor = param2;
         _loc9_.htmlText = _loc9_.htmlText;
         _loc9_ = coreStatsText;
         _loc4_ = _loc9_.defaultTextFormat;
         _loc4_.color = param2;
         _loc9_.defaultTextFormat = _loc4_;
         _loc9_.textColor = param2;
         _loc9_.htmlText = _loc9_.htmlText;
         _loc9_ = combatStatsText;
         _loc4_ = _loc9_.defaultTextFormat;
         _loc4_.color = param2;
         _loc9_.defaultTextFormat = _loc4_;
         _loc9_.textColor = param2;
         _loc9_.htmlText = _loc9_.htmlText;
         _loc9_ = advancementText;
         _loc4_ = _loc9_.defaultTextFormat;
         _loc4_.color = param2;
         _loc9_.defaultTextFormat = _loc4_;
         _loc9_.textColor = param2;
         _loc9_.htmlText = _loc9_.htmlText;
         _loc9_ = timeText;
         _loc4_ = _loc9_.defaultTextFormat;
         _loc4_.color = param2;
         _loc9_.defaultTextFormat = _loc4_;
         _loc9_.textColor = param2;
         _loc9_.htmlText = _loc9_.htmlText;
         update("setTheme");
      }
      
      public function setNameText(param1:Player, param2:Boolean = false) : void
      {
         var _loc4_:int = 0;
         var _loc5_:* = null as TextFormat;
         var _loc3_:String = param1.get_short();
         if(_loc3_ != prevName)
         {
            nameText.text = (param2 ? "" : "") + _loc3_;
            _loc4_ = int(nameText.textWidth);
            _loc5_ = nameText.getTextFormat();
            while(nameText.textWidth > get_width() - 5)
            {
               _loc5_.size -= 1;
               nameText.setTextFormat(_loc5_);
            }
            if(_loc5_.size < 18 && !param2)
            {
               setNameText(param1,true);
            }
            else
            {
               prevName = _loc3_;
            }
         }
      }
      
      public function setBackground(param1:Class) : void
      {
         sideBarBG.set_bitmapClass(param1);
      }
      
      public function refreshStats(param1:CoC) : void
      {
         var _loc10_:* = null as String;
         var _loc11_:* = null as String;
         var _loc15_:* = null as StatBar;
         var _loc2_:Player = param1.player;
         var _loc3_:* = _loc2_.getAllMaxStats();
         setNameText(_loc2_);
         strBar.set_maxValue(int(_loc3_.str));
         strBar.set_value(_loc2_.get_str());
         touBar.set_maxValue(int(_loc3_.tou));
         touBar.set_value(_loc2_.get_tou());
         speBar.set_maxValue(int(_loc3_.spe));
         speBar.set_value(_loc2_.get_spe());
         intBar.set_maxValue(int(_loc3_.inte));
         intBar.set_value(_loc2_.get_inte());
         libBar.set_value(_loc2_.lib);
         senBar.set_value(_loc2_.sens);
         corBar.set_value(_loc2_.cor);
         hpBar.set_maxValue(_loc2_.maxHP());
         hpBar.set_minValue(_loc2_.get_HP());
         lustBar.set_maxValue(_loc2_.maxLust());
         lustBar.set_minValue(_loc2_.minLust());
         fatigueBar.set_maxValue(_loc2_.maxFatigue());
         hungerBar.set_maxValue(_loc2_.maxHunger());
         hungerBar.set_value(_loc2_.hunger);
         levelBar.visible = true;
         xpBar.visible = true;
         gemsBar.visible = true;
         advancementText.htmlText = "<b>成长</b>";
         levelBar.set_value(_loc2_.level);
         var _loc4_:Number = lustBar.value;
         var _loc5_:Number = fatigueBar.value;
         var _loc6_:Number = hpBar.value;
         var _loc7_:Number = xpBar.value;
         lustBar.set_value(_loc2_.get_lust());
         xpBar.set_value(_loc2_.XP);
         hpBar.set_value(_loc2_.get_HP());
         fatigueBar.set_value(_loc2_.get_fatigue());
         if(_loc2_.level < KGAMECLASS.kGAMECLASS.levelCap)
         {
            xpBar.set_maxValue(_loc2_.requiredXP());
         }
         else
         {
            xpBar.set_maxValue(_loc2_.XP);
            xpBar.set_valueText("MAX");
         }
         gemsBar.set_valueText(Utils.addComma(int(Math.floor(_loc2_.get_gems()))));
         var _loc8_:String = "" + param1.time.minutes;
         if(_loc8_.length == 1)
         {
            _loc8_ = "0" + _loc8_;
         }
         var _loc9_:int = param1.time.hours;
         if(param1.get_displaySettings().time12Hour)
         {
            _loc10_ = int(_loc9_ % 12) == 0 ? "12" : "" + int(_loc9_ % 12);
            _loc11_ = _loc9_ < 12 ? "上午" : "下午";
         }
         else
         {
            _loc10_ = "" + _loc9_;
            _loc11_ = "";
         }
         timeText.htmlText = "<u>日期：" + param1.time.days + "</u>\n时间：" + _loc10_ + ":" + _loc8_ + _loc11_;
         invalidateLayout();
         var _loc12_:Array = [];
         var _loc13_:int = 0;
         var _loc14_:Array = allStats;
         while(_loc13_ < int(_loc14_.length))
         {
            _loc15_ = _loc14_[_loc13_];
            _loc13_++;
            _loc12_.push({
               "name":_loc15_.get_statName(),
               "min":_loc15_.minValue,
               "max":_loc15_.maxValue,
               "value":_loc15_.value,
               "showMax":_loc15_.showMax,
               "hasBar":_loc15_.bar != null,
               "isUp":_loc15_.get_isUp(),
               "isDown":_loc15_.get_isDown(),
               "valueText":_loc15_.get_valueText()
            });
         }
         GameViewData.playerStatData = {
            "stats":_loc12_,
            "name":_loc2_.get_short(),
            "time":{
               "day":param1.time.days,
               "hour":_loc10_,
               "minutes":_loc8_,
               "ampm":_loc11_
            }
         };
         hpBar.set_value(_loc6_);
         fatigueBar.set_value(_loc5_);
         lustBar.set_value(_loc4_);
         hpBar.animateChange(_loc2_.get_HP());
         fatigueBar.animateChange(_loc2_.get_fatigue());
         lustBar.animateChange(_loc2_.get_lust());
         if(_loc2_.level < KGAMECLASS.kGAMECLASS.levelCap)
         {
            xpBar.set_value(_loc7_);
            xpBar.animateChange(_loc2_.XP);
         }
      }
      
      public function hideUpDown() : void
      {
         var _loc3_:* = null as StatBar;
         var _loc1_:int = 0;
         var _loc2_:Array = allStats;
         while(_loc1_ < int(_loc2_.length))
         {
            _loc3_ = _loc2_[_loc1_];
            _loc1_++;
            _loc3_.set_isUp(false);
            _loc3_.set_isDown(false);
         }
      }
      
      public function hideLevelUp() : void
      {
         levelBar.set_isUp(false);
      }
      
      public function hide() : void
      {
         visible = false;
      }
   }
}

