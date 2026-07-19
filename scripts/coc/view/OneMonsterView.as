package coc.view
{
   import classes.CoC;
   import classes.Monster;
   import classes.globalFlags.KGAMECLASS;
   import classes.internals.Utils;
   import com.bit101.components.TextFieldVScroll;
   import flash.Boot;
   import flash.display.Bitmap;
   import flash.display.DisplayObject;
   import flash.events.MouseEvent;
   import flash.text.TextField;
   import flash.text.TextFormat;
   
   public class OneMonsterView extends Block
   {
      
      public var topRow:Block;
      
      public var toolTipText:String;
      
      public var toolTipHeader:String;
      
      public var sprite:BitmapDataSprite;
      
      public var sideBarBG:BitmapDataSprite;
      
      public var scrollBar:TextFieldVScroll;
      
      public var nameText:TextField;
      
      public var monsterIndex:Number;
      
      public var lustBar:StatBar;
      
      public var levelBar:StatBar;
      
      public var index:int;
      
      public var hpBar:StatBar;
      
      public var fatigueBar:StatBar;
      
      public var corBar:StatBar;
      
      public function OneMonsterView()
      {
         if(Boot.skip_constructor)
         {
            return;
         }
         index = -1;
         toolTipText = "sfssd";
         monsterIndex = Number(Math.NaN);
         super(new LayoutConfig(LayoutType.Flow(FlowDirection.Column,1),true,null,null,null,null,null,null),0,0,160,MainView.MONSTER_H);
         var _loc1_:DefaultTextFormatParameters = new DefaultTextFormatParameters("Alibaba PuHuiTi 3 85 Bold",12,null,true,null,null,null,null,null,null,null,null,null);
         StatBar.setDefaultOptions(new StatBarOptions(160,null,null,null,null,null,null,null,null,null,null,null,null,null,null,6291456,null,null));
         sideBarBG = addBitmapDataSprite(new BitmapDataSprite(null,SidebarEnemy,true,0,0,MainView.MONSTER_H,160,true,"",0,false,1,true),new LayoutHint(true,null,null,null,null,null,null));
         nameText = addTextField(new TextFieldParameters(null,null,null,null,null,null,null,null,_loc1_,null,null,null,null,null,null,null,null));
         addElement(levelBar = new StatBar(new StatBarOptions(null,23,null,null,null,"等级：",null,null,null,null,false,null,null,null,null,null,null,null)));
         addElement(hpBar = new StatBar(new StatBarOptions(null,23,null,null,null,"生命值：",true,null,null,null,null,true,null,null,null,11631966,11038290,null)));
         addElement(lustBar = new StatBar(new StatBarOptions(null,23,null,null,null,"欲望：",true,null,null,null,null,true,null,null,null,null,8913153,null)));
         addElement(fatigueBar = new StatBar(new StatBarOptions(null,23,null,null,null,"疲劳：",true,null,null,null,null,null,null,null,null,null,null,null)));
         addEventListener(MouseEvent.ROLL_OVER,hover);
         addEventListener(MouseEvent.ROLL_OUT,dim);
         addEventListener(MouseEvent.CLICK,selectMonster);
      }
      
      override public function unscaledResize(param1:Number, param2:Number) : void
      {
         if(sideBarBG != null)
         {
            sideBarBG.setSize(0,0);
         }
         super.unscaledResize(param1,param2);
         doLayout();
         if(sideBarBG != null)
         {
            sideBarBG.setSize(get_width(),get_height() + 4);
         }
      }
      
      public function show(param1:String = undefined, param2:String = undefined) : void
      {
         if(param1 == null)
         {
            param1 = "";
         }
         if(param2 == null)
         {
            param2 = "";
         }
         visible = true;
         alpha = 1;
         hint(param1,param2);
      }
      
      public function setTheme(param1:String, param2:uint, param3:Number) : void
      {
         var _loc4_:* = null as TextFormat;
         var _loc7_:* = null as DisplayObject;
         var _loc8_:* = null as StatBar;
         var _loc5_:int = 0;
         var _loc6_:int = get_numElements();
         while(_loc5_ < _loc6_)
         {
            _loc7_ = getElementAt(_loc5_);
            if(!(_loc7_ is StatBar) || _loc7_ == null)
            {
               _loc5_++;
            }
            else
            {
               _loc8_ = _loc7_;
               _loc4_ = _loc8_.valueLabel.defaultTextFormat;
               _loc4_.color = param2;
               _loc4_.font = param1;
               _loc8_.valueLabel.defaultTextFormat = _loc4_;
               _loc8_.valueLabel.setTextFormat(_loc4_);
               if(_loc8_.bar != null)
               {
                  _loc8_.bar.alpha = param3;
               }
               if(_loc8_.minBar != null)
               {
                  _loc8_.minBar.alpha = 1 - (1 - param3) / 2;
               }
               _loc5_++;
            }
         }
         var _loc9_:TextField = nameText;
         var _loc10_:TextField = _loc9_;
         _loc4_ = _loc10_.defaultTextFormat;
         _loc4_.color = param2;
         _loc10_.defaultTextFormat = _loc4_;
         _loc10_.setTextFormat(_loc4_);
      }
      
      public function setBitmap(param1:Bitmap) : void
      {
         sideBarBG.set_bitmap(param1);
      }
      
      public function setBackground(param1:Class) : void
      {
      }
      
      public function selectMonster(param1:MouseEvent) : void
      {
         var _loc2_:Object = param1.target;
         var _loc3_:int = (_loc2_ as OneMonsterView).index;
         if(int(KGAMECLASS.kGAMECLASS.monsterArray.length) > 1 && KGAMECLASS.kGAMECLASS.combat.canTarget(_loc3_) && KGAMECLASS.kGAMECLASS.combat.playerTurn)
         {
            KGAMECLASS.kGAMECLASS.combat.multiAttack(_loc3_);
            KGAMECLASS.kGAMECLASS.mainView.monsterStatsView.refreshStats(KGAMECLASS.kGAMECLASS);
         }
      }
      
      public function resetStats() : void
      {
         hpBar.set_value(0);
         hpBar.set_value(0);
         lustBar.set_value(0);
         lustBar.set_value(0);
         fatigueBar.set_value(0);
      }
      
      public function refreshStats(param1:CoC, param2:int = -1) : Object
      {
         index = param2;
         if(param2 != -1 && param1.monsterArray[param2] == null)
         {
            return null;
         }
         var _loc3_:Monster = param2 != -1 ? param1.monsterArray[param2] : param1.monster;
         if(int(param1.monsterArray.length) > 1 && param1.combat.currTarget == param2)
         {
            nameText.text = "[" + Utils.cnName(Utils.titleCase(_loc3_.get_short())) + "]";
         }
         else
         {
            nameText.text = Utils.cnName(Utils.titleCase(_loc3_.get_short()));
         }
         levelBar.set_value(_loc3_.level);
         hpBar.set_maxValue(_loc3_.maxHP());
         hpBar.set_minValue(_loc3_.get_HP());
         hpBar.animateChange(_loc3_.get_HP());
         lustBar.set_maxValue(_loc3_.maxLust());
         lustBar.set_minValue(_loc3_.minLust());
         lustBar.animateChange(_loc3_.get_lust());
         fatigueBar.set_minValue(0);
         fatigueBar.set_maxValue(_loc3_.maxFatigue());
         fatigueBar.animateChange(_loc3_.get_fatigue());
         toolTipHeader = "详细信息";
         toolTipText = _loc3_.generateTooltip();
         invalidateLayout();
         return {
            "index":param2,
            "name":nameText.text,
            "toolTipText":toolTipText,
            "toolTipHeader":toolTipHeader,
            "stats":[{
               "name":"等级：",
               "value":_loc3_.level,
               "min":0,
               "max":0,
               "showMax":false
            },{
               "name":"生命值：",
               "value":_loc3_.get_HP(),
               "min":_loc3_.get_HP(),
               "max":_loc3_.maxHP(),
               "showMax":true
            },{
               "name":"欲望：",
               "value":_loc3_.get_lust(),
               "min":_loc3_.minLust(),
               "max":_loc3_.maxLust(),
               "showMax":true
            },{
               "name":"疲劳：",
               "value":_loc3_.get_fatigue(),
               "min":0,
               "max":_loc3_.maxFatigue(),
               "showMax":true
            }]
         };
      }
      
      public function hover(param1:MouseEvent = undefined) : void
      {
         if(sideBarBG != null)
         {
            sideBarBG.alpha = 0.5;
         }
      }
      
      public function hint(param1:String = undefined, param2:String = undefined) : void
      {
         if(param1 == null)
         {
            param1 = "";
         }
         if(param2 == null)
         {
            param2 = "";
         }
         toolTipText = param1;
         toolTipHeader = param2;
      }
      
      public function hide() : void
      {
         visible = false;
      }
      
      public function dim(param1:MouseEvent = undefined) : void
      {
         if(sideBarBG != null)
         {
            sideBarBG.alpha = 1;
         }
      }
   }
}

