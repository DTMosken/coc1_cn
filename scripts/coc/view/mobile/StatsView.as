package coc.view.mobile
{
   import classes.display.GameViewData;
   import coc.view.BitmapDataSprite;
   import coc.view.Block;
   import coc.view.FlowDirection;
   import coc.view.LayoutConfig;
   import coc.view.LayoutHint;
   import coc.view.LayoutType;
   import coc.view.StatBar;
   import coc.view.StatBarOptions;
   import coc.view.Theme;
   import flash.Boot;
   import flash.display.Bitmap;
   import haxe.IMap;
   
   public class StatsView extends Block
   {
      
      public static var init__:Boolean;
      
      public static var BAR_INFO:Array;
      
      public var bars:Array;
      
      public var background:BitmapDataSprite;
      
      public var _onlyUpdates:Boolean;
      
      public var _dateBar:StatBar;
      
      public function StatsView(param1:Boolean = false)
      {
         var _loc4_:* = null as BarDefinition;
         var _loc5_:* = null as StatBar;
         if(Boot.skip_constructor)
         {
            return;
         }
         _onlyUpdates = false;
         bars = [];
         super(new LayoutConfig(LayoutType.Flow(FlowDirection.Row,5,true),true,null,10,null,15,null,null));
         if(param1)
         {
            get_layoutConfig().paddingTop = 0;
            get_layoutConfig().paddingLeft = 5;
         }
         else
         {
            background = new BitmapDataSprite(null,null,true,0,0,0,0,true,"",0,false,1,true);
            addElement(background,new LayoutHint(true,null,null,null,null,null,null));
         }
         var _loc2_:int = 0;
         var _loc3_:Array = StatsView.BAR_INFO;
         while(_loc2_ < int(_loc3_.length))
         {
            _loc4_ = _loc3_[_loc2_];
            _loc2_++;
            _loc5_ = new StatBar(_loc4_.base);
            addElement(_loc5_);
            bars.push(_loc5_);
         }
         _dateBar = new StatBar(new StatBarOptions(null,null,null,null,null,"天数：",null,null,null,null,false,null,null,null,null,null,null,null));
         addElement(_dateBar);
         _dateBar.visible = !param1;
         _onlyUpdates = param1;
      }
      
      public function setBarData(param1:StatBar, param2:IMap) : void
      {
         var _loc7_:* = null as String;
         var _loc8_:* = null as String;
         var _loc9_:* = null as String;
         var _loc10_:* = null as String;
         var _loc11_:* = null as String;
         var _loc3_:* = getBarGameData(param1.get_statName());
         if(_loc3_ == null)
         {
            return;
         }
         var _loc4_:IMap = param2;
         var _loc5_:IMap = _loc4_;
         var _loc6_:* = _loc4_.keys();
         while(Boolean(_loc6_.hasNext()))
         {
            _loc7_ = _loc6_.next();
            _loc8_ = _loc5_.get(_loc7_);
            _loc9_ = _loc7_;
            _loc10_ = _loc9_;
            _loc11_ = _loc8_;
            Reflect.setProperty(param1,_loc10_,Reflect.getProperty(_loc3_,_loc11_));
         }
         param1.visible = !_onlyUpdates || (param1.get_isUp() || param1.get_isDown()) && Boolean(["HP:","Lust:","Fatigue:"].contains(param1.get_statName()));
         if(!param1.visible)
         {
            param1.x = 0;
            param1.y = 0;
         }
      }
      
      public function refreshStats() : void
      {
         var _loc4_:int = 0;
         var _loc5_:* = null;
         var _loc1_:* = GameViewData.playerStatData;
         if((_loc1_ != null ? _loc1_.stats : null) == null)
         {
            visible = false;
            return;
         }
         visible = true;
         var _loc2_:int = 0;
         var _loc3_:int = int(StatsView.BAR_INFO.length);
         while(_loc2_ < _loc3_)
         {
            _loc4_ = _loc2_++;
            setBarData(bars[_loc4_],StatsView.BAR_INFO[_loc4_].values);
         }
         if(!_onlyUpdates)
         {
            _loc5_ = GameViewData.playerStatData.time;
            _dateBar.set_statName("天数: " + int(_loc5_.day));
            _dateBar.set_valueText(_loc5_.hour + ":" + _loc5_.minutes + _loc5_.ampm);
         }
         doLayout();
      }
      
      public function getBarGameData(param1:String) : Object
      {
         var _loc5_:* = null;
         var _loc2_:Array = [];
         var _loc3_:int = 0;
         var _loc4_:Array = GameViewData.playerStatData.stats;
         while(_loc3_ < int(_loc4_.length))
         {
            _loc5_ = _loc4_[_loc3_];
            _loc3_++;
            if(_loc5_.name == param1)
            {
               _loc2_.push(_loc5_);
            }
         }
         _loc4_ = _loc2_;
         if(int(_loc4_.length) > 0)
         {
            return _loc4_[0];
         }
         return null;
      }
      
      override public function doLayout() : void
      {
         super.doLayout();
         scaleY = 1;
         scaleX = 1;
         if(background != null)
         {
            background.set_bitmap(Theme.current.get_sidebarBg());
            background.setSize(get_width(),get_height());
         }
      }
   }
}

