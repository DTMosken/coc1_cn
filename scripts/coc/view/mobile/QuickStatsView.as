package coc.view.mobile
{
   import classes.display.GameViewData;
   import coc.view.Block;
   import coc.view.LayoutConfig;
   import coc.view.LayoutType;
   import coc.view.StatBar;
   import coc.view.StatBarOptions;
   import flash.Boot;
   
   public class QuickStatsView extends Block
   {
      
      public var barTime:StatBar;
      
      public var barLust:StatBar;
      
      public var barHP:StatBar;
      
      public var barFatigue:StatBar;
      
      public function QuickStatsView()
      {
         if(Boot.skip_constructor)
         {
            return;
         }
         super(new LayoutConfig(LayoutType.Grid(0,3),true,null,null,null,null,null,null));
         addElement(barHP = new StatBar(new StatBarOptions(null,null,null,null,null,"生命值：",true,null,null,null,null,true,null,null,null,11631966,11038290,null)));
         addElement(barLust = new StatBar(new StatBarOptions(null,null,null,null,null,"欲望：",true,null,null,null,null,true,null,null,null,null,8913153,null)));
         addElement(barTime = new StatBar(new StatBarOptions(null,null,null,null,null,"天数：",null,null,null,null,false,null,null,null,null,null,null,null)));
         addElement(barFatigue = new StatBar(new StatBarOptions(null,null,null,null,null,"疲劳：",true,null,null,null,null,null,null,null,null,null,null,null)));
         barFatigue.visible = false;
         doLayout();
      }
      
      public function setBarData(param1:StatBar) : void
      {
         var _loc5_:* = null;
         var _loc2_:Array = [];
         var _loc3_:int = 0;
         var _loc4_:Array = GameViewData.playerStatData.stats;
         while(_loc3_ < int(_loc4_.length))
         {
            _loc5_ = _loc4_[_loc3_];
            _loc3_++;
            if(_loc5_.name == param1.get_statName())
            {
               _loc2_.push(_loc5_);
            }
         }
         _loc5_ = _loc2_[0];
         if(param1 != barFatigue)
         {
            param1.set_minValue(Number(_loc5_.min));
         }
         param1.set_maxValue(Number(_loc5_.max));
         param1.set_value(Number(_loc5_.value));
         param1.set_isUp(Boolean(_loc5_.isUp));
         param1.set_isDown(Boolean(_loc5_.isDown));
      }
      
      public function refreshStats() : void
      {
         var _loc2_:* = null;
         var _loc1_:* = GameViewData.playerStatData;
         if((_loc1_ != null ? _loc1_.stats : null) == null)
         {
            visible = false;
            return;
         }
         visible = true;
         setBarData(barHP);
         setBarData(barLust);
         if(GameViewData.showMonsterStats)
         {
            setBarData(barFatigue);
            barFatigue.visible = true;
            barTime.visible = false;
         }
         else
         {
            _loc2_ = GameViewData.playerStatData.time;
            barTime.set_statName("天数: " + ("" + int(_loc2_.day)));
            barTime.set_valueText(_loc2_.hour + ":" + _loc2_.minutes + _loc2_.ampm);
            barFatigue.visible = false;
            barTime.visible = true;
         }
         barTime.x = 0;
         barTime.y = 0;
         barFatigue.x = 0;
         barFatigue.y = 0;
         doLayout();
      }
   }
}

