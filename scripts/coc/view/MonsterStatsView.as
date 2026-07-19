package coc.view
{
   import classes.CoC;
   import classes.Monster;
   import classes.display.GameViewData;
   import flash.Boot;
   import flash.display.Bitmap;
   import flash.text.TextField;
   
   public class MonsterStatsView extends Block
   {
      
      public var sprite:BitmapDataSprite;
      
      public var sideBarBG:BitmapDataSprite;
      
      public var nameText:TextField;
      
      public var moved:Boolean;
      
      public var monsterViews:Array;
      
      public var lustBar:StatBar;
      
      public var levelBar:StatBar;
      
      public var hpBar:StatBar;
      
      public var fatigueBar:StatBar;
      
      public var corBar:StatBar;
      
      public function MonsterStatsView(param1:MainView = undefined)
      {
         if(Boot.skip_constructor)
         {
            return;
         }
         moved = false;
         monsterViews = [];
         super(new LayoutConfig(LayoutType.Flow(FlowDirection.Column),true,null,null,null,null,null,null),MainView.MONSTER_X,MainView.MONSTER_Y,160,MainView.MONSTER_H);
         StatBar.setDefaultOptions(new StatBarOptions(get_innerWidth(),null,null,null,null,null,null,null,null,null,null,null,null,null,null,6291456,null,null));
         var _loc2_:OneMonsterView = new OneMonsterView();
         _loc2_.hide();
         addElement(_loc2_);
         monsterViews.push(_loc2_);
         _loc2_ = new OneMonsterView();
         _loc2_.hide();
         addElement(_loc2_);
         monsterViews.push(_loc2_);
         _loc2_ = new OneMonsterView();
         _loc2_.hide();
         addElement(_loc2_);
         monsterViews.push(_loc2_);
         _loc2_ = new OneMonsterView();
         _loc2_.hide();
         addElement(_loc2_);
         monsterViews.push(_loc2_);
      }
      
      public function show() : void
      {
         visible = true;
         GameViewData.showMonsterStats = true;
      }
      
      public function setTheme(param1:String, param2:uint, param3:Number) : void
      {
         monsterViews[0].setTheme(param1,param2,param3);
         monsterViews[1].setTheme(param1,param2,param3);
         monsterViews[2].setTheme(param1,param2,param3);
         monsterViews[3].setTheme(param1,param2,param3);
      }
      
      public function setBackgroundBitmap(param1:Bitmap) : void
      {
         monsterViews[0].setBitmap(param1);
         monsterViews[1].setBitmap(param1);
         monsterViews[2].setBitmap(param1);
         monsterViews[3].setBitmap(param1);
      }
      
      public function setBackground(param1:Class) : void
      {
         monsterViews[0].setBackground(param1);
         monsterViews[1].setBackground(param1);
         monsterViews[2].setBackground(param1);
         monsterViews[3].setBackground(param1);
      }
      
      public function resetStats(param1:CoC) : void
      {
         var _loc4_:* = null as OneMonsterView;
         var _loc2_:int = 0;
         var _loc3_:Array = monsterViews;
         while(_loc2_ < int(_loc3_.length))
         {
            _loc4_ = _loc3_[_loc2_];
            _loc2_++;
            _loc4_.resetStats();
         }
      }
      
      public function refreshStats(param1:CoC) : void
      {
         var _loc3_:* = null;
         var _loc2_:int = 0;
         GameViewData.monsterStatData = [];
         while(_loc2_ < int(param1.monsterArray.length))
         {
            if(param1.monsterArray[_loc2_] != null)
            {
               _loc3_ = monsterViews[_loc2_].refreshStats(param1,_loc2_);
               monsterViews[_loc2_].show(param1.monsterArray[_loc2_].generateTooltip(),"详情");
               GameViewData.monsterStatData.push(_loc3_);
            }
            else
            {
               monsterViews[_loc2_].hide();
            }
            _loc2_++;
         }
         if(_loc2_ < int(monsterViews.length))
         {
            while(_loc2_ < int(monsterViews.length))
            {
               monsterViews[_loc2_].hide();
               _loc2_++;
            }
         }
         invalidateLayout();
      }
      
      public function hide() : void
      {
         monsterViews[0].hide();
         monsterViews[1].hide();
         monsterViews[2].hide();
         monsterViews[3].hide();
         visible = false;
         GameViewData.showMonsterStats = false;
      }
   }
}

