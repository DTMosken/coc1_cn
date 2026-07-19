package coc.view.mobile
{
   import classes.display.GameView;
   import classes.display.GameViewData;
   import coc.view.Block;
   import coc.view.DefaultTextFormatParameters;
   import coc.view.LayoutConfig;
   import coc.view.LayoutHint;
   import coc.view.LayoutType;
   import coc.view.SidebarEnemy;
   import coc.view.StatBar;
   import coc.view.StatBarOptions;
   import coc.view.TextFieldParameters;
   import coc.view.Theme;
   import coc.view.ThemeObserver;
   import flash.Boot;
   import flash.display.Bitmap;
   import flash.display.BitmapData;
   import flash.display.Graphics;
   import flash.display.Sprite;
   import flash.events.MouseEvent;
   import flash.geom.Matrix;
   import flash.geom.Rectangle;
   import flash.text.Font;
   import flash.text.TextField;
   import openfl.display._internal.FlashGraphics;
   import openfl.utils.Assets;
   
   public class MonsterStatView extends Block implements GameView, ThemeObserver
   {
      
      public var _toolTipText:String;
      
      public var _toolTipHeader:String;
      
      public var _nameText:TextField;
      
      public var _index:int;
      
      public var _bitmap:Bitmap;
      
      public var _bars:Array;
      
      public var _background:Sprite;
      
      public function MonsterStatView(param1:int = 0)
      {
         var _loc4_:* = null as StatBarOptions;
         var _loc5_:* = null as StatBar;
         if(Boot.skip_constructor)
         {
            return;
         }
         _index = 0;
         _bars = [];
         super(new LayoutConfig(LayoutType.Grid(2,3),null,4,null,null,null,null,null));
         _index = param1;
         _background = new Sprite();
         _bitmap = new Bitmap(new SidebarEnemy(0,0));
         drawBackground();
         addElement(_background,new LayoutHint(true,null,null,null,null,null,null));
         _nameText = addTextField(new TextFieldParameters(null,null,null,true,null,null,null,null,new DefaultTextFormatParameters(Assets.getFont("res/fonts/pala.ttf").fontName,12,null,true,null,null,null,null,null,null,null,null,null),null,null,null,null,null,null,null,null));
         addElement(new Sprite());
         var _loc2_:Array = [new StatBarOptions(null,23,null,null,null,"等级：",null,null,null,null,false,null,null,null,null,null,null,null),new StatBarOptions(null,23,null,null,null,"生命值：",true,null,null,null,null,true,null,null,null,11631966,11038290,null),new StatBarOptions(null,23,null,null,null,"欲望：",true,null,null,null,null,true,null,null,null,null,8913153,null),new StatBarOptions(null,23,null,null,null,"疲劳：",true,null,null,null,null,null,null,null,null,null,null,null)];
         var _loc3_:int = 0;
         while(_loc3_ < int(_loc2_.length))
         {
            _loc4_ = _loc2_[_loc3_];
            _loc3_++;
            _loc5_ = new StatBar(_loc4_);
            addElement(_loc5_);
            _bars.push(_loc5_);
         }
         addEventListener(MouseEvent.CLICK,selectMonster);
         Theme.subscribe(this);
      }
      
      public function update(param1:String) : void
      {
         _bitmap = Theme.current.get_monsterBg();
         var _loc2_:int = int(get_width());
         var _loc3_:int = int(get_height());
         drawBackground();
         setSize(_loc2_,_loc3_);
      }
      
      public function setSize(param1:int, param2:int) : void
      {
         graphics.clear();
         _background.width = 1;
         _background.height = 1;
         unscaledResize(param1,param2);
         doLayout();
         _background.width = get_width();
         _background.height = get_height() + 4;
      }
      
      public function selectMonster(param1:MouseEvent) : void
      {
         if(GameViewData.selectMonster == null || GameViewData.monsterStatData == null)
         {
            return;
         }
         GameViewData.selectMonster(int(GameViewData.monsterStatData[_index].index));
      }
      
      public function get_toolTipText() : String
      {
         return _toolTipText;
      }
      
      public function get_toolTipHeader() : String
      {
         return _toolTipHeader;
      }
      
      public function flush() : void
      {
         var _loc3_:* = null as StatBar;
         var _loc4_:* = null;
         if(GameViewData.monsterStatData == null || int(GameViewData.monsterStatData.length) <= _index)
         {
            visible = false;
            return;
         }
         visible = true;
         var _loc1_:* = GameViewData.monsterStatData[_index];
         _nameText.htmlText = _loc1_.name;
         _toolTipHeader = _loc1_.toolTipHeader;
         _toolTipText = _loc1_.toolTipText;
         var _loc2_:int = 0;
         while(_loc2_ < int(_loc1_.stats.length) && _loc2_ < int(_bars.length))
         {
            _loc3_ = _bars[_loc2_];
            _loc4_ = _loc1_.stats[_loc2_];
            _loc3_.name = _loc4_.name;
            if(_loc3_.name == "Level:")
            {
               _loc3_.set_value(Number(_loc4_.value));
            }
            else
            {
               _loc3_.animateChange(Number(_loc4_.value));
            }
            _loc3_.set_maxValue(Number(_loc4_.max));
            _loc3_.set_minValue(Number(_loc4_.min));
            _loc3_.set_showMax(Boolean(_loc4_.showMax));
            _loc2_++;
         }
         visible = GameViewData.showMonsterStats;
      }
      
      public function drawBackground() : void
      {
         _background.graphics.clear();
         if(_bitmap == null)
         {
            return;
         }
         _background.scaleY = 1;
         _background.scaleX = 1;
         var _loc1_:Graphics = _background.graphics;
         var _loc2_:BitmapData = _bitmap.bitmapData;
         var _loc3_:Matrix = null;
         FlashGraphics.bitmapFill[_loc1_] = _loc2_;
         _loc1_.beginBitmapFill(_loc2_,_loc3_,false,true);
         var _loc4_:Rectangle = new Rectangle(2,2,_bitmap.width - 4,_bitmap.height - 4);
         var _loc5_:Number = _loc4_.left;
         var _loc6_:Number = _loc4_.right;
         var _loc7_:Number = _bitmap.bitmapData.width;
         var _loc8_:Number = _loc4_.top;
         var _loc9_:Number = _loc4_.bottom;
         var _loc10_:Number = _bitmap.bitmapData.height;
         var _loc11_:Number = 0;
         var _loc12_:Number = 0;
         _loc1_ = _background.graphics;
         _loc2_ = _bitmap.bitmapData;
         _loc3_ = null;
         FlashGraphics.bitmapFill[_loc1_] = _loc2_;
         _loc1_.beginBitmapFill(_loc2_,_loc3_,true,false);
         _background.graphics.drawRect(_loc11_,_loc12_,_loc5_ - _loc11_,_loc8_ - _loc12_);
         _loc1_ = _background.graphics;
         _loc2_ = null;
         FlashGraphics.bitmapFill[_loc1_] = _loc2_;
         _loc1_.endFill();
         _loc12_ = _loc8_;
         _loc1_ = _background.graphics;
         _loc2_ = _bitmap.bitmapData;
         _loc3_ = null;
         FlashGraphics.bitmapFill[_loc1_] = _loc2_;
         _loc1_.beginBitmapFill(_loc2_,_loc3_,true,false);
         _background.graphics.drawRect(_loc11_,_loc12_,_loc5_ - _loc11_,_loc9_ - _loc12_);
         _loc1_ = _background.graphics;
         _loc2_ = null;
         FlashGraphics.bitmapFill[_loc1_] = _loc2_;
         _loc1_.endFill();
         _loc12_ = _loc9_;
         _loc1_ = _background.graphics;
         _loc2_ = _bitmap.bitmapData;
         _loc3_ = null;
         FlashGraphics.bitmapFill[_loc1_] = _loc2_;
         _loc1_.beginBitmapFill(_loc2_,_loc3_,true,false);
         _background.graphics.drawRect(_loc11_,_loc12_,_loc5_ - _loc11_,_loc10_ - _loc12_);
         _loc1_ = _background.graphics;
         _loc2_ = null;
         FlashGraphics.bitmapFill[_loc1_] = _loc2_;
         _loc1_.endFill();
         _loc12_ = _loc10_;
         _loc11_ = _loc5_;
         _loc12_ = 0;
         _loc1_ = _background.graphics;
         _loc2_ = _bitmap.bitmapData;
         _loc3_ = null;
         FlashGraphics.bitmapFill[_loc1_] = _loc2_;
         _loc1_.beginBitmapFill(_loc2_,_loc3_,true,false);
         _background.graphics.drawRect(_loc11_,_loc12_,_loc6_ - _loc11_,_loc8_ - _loc12_);
         _loc1_ = _background.graphics;
         _loc2_ = null;
         FlashGraphics.bitmapFill[_loc1_] = _loc2_;
         _loc1_.endFill();
         _loc12_ = _loc8_;
         _loc1_ = _background.graphics;
         _loc2_ = _bitmap.bitmapData;
         _loc3_ = null;
         FlashGraphics.bitmapFill[_loc1_] = _loc2_;
         _loc1_.beginBitmapFill(_loc2_,_loc3_,true,false);
         _background.graphics.drawRect(_loc11_,_loc12_,_loc6_ - _loc11_,_loc9_ - _loc12_);
         _loc1_ = _background.graphics;
         _loc2_ = null;
         FlashGraphics.bitmapFill[_loc1_] = _loc2_;
         _loc1_.endFill();
         _loc12_ = _loc9_;
         _loc1_ = _background.graphics;
         _loc2_ = _bitmap.bitmapData;
         _loc3_ = null;
         FlashGraphics.bitmapFill[_loc1_] = _loc2_;
         _loc1_.beginBitmapFill(_loc2_,_loc3_,true,false);
         _background.graphics.drawRect(_loc11_,_loc12_,_loc6_ - _loc11_,_loc10_ - _loc12_);
         _loc1_ = _background.graphics;
         _loc2_ = null;
         FlashGraphics.bitmapFill[_loc1_] = _loc2_;
         _loc1_.endFill();
         _loc12_ = _loc10_;
         _loc11_ = _loc6_;
         _loc12_ = 0;
         _loc1_ = _background.graphics;
         _loc2_ = _bitmap.bitmapData;
         _loc3_ = null;
         FlashGraphics.bitmapFill[_loc1_] = _loc2_;
         _loc1_.beginBitmapFill(_loc2_,_loc3_,true,false);
         _background.graphics.drawRect(_loc11_,_loc12_,_loc7_ - _loc11_,_loc8_ - _loc12_);
         _loc1_ = _background.graphics;
         _loc2_ = null;
         FlashGraphics.bitmapFill[_loc1_] = _loc2_;
         _loc1_.endFill();
         _loc12_ = _loc8_;
         _loc1_ = _background.graphics;
         _loc2_ = _bitmap.bitmapData;
         _loc3_ = null;
         FlashGraphics.bitmapFill[_loc1_] = _loc2_;
         _loc1_.beginBitmapFill(_loc2_,_loc3_,true,false);
         _background.graphics.drawRect(_loc11_,_loc12_,_loc7_ - _loc11_,_loc9_ - _loc12_);
         _loc1_ = _background.graphics;
         _loc2_ = null;
         FlashGraphics.bitmapFill[_loc1_] = _loc2_;
         _loc1_.endFill();
         _loc12_ = _loc9_;
         _loc1_ = _background.graphics;
         _loc2_ = _bitmap.bitmapData;
         _loc3_ = null;
         FlashGraphics.bitmapFill[_loc1_] = _loc2_;
         _loc1_.beginBitmapFill(_loc2_,_loc3_,true,false);
         _background.graphics.drawRect(_loc11_,_loc12_,_loc7_ - _loc11_,_loc10_ - _loc12_);
         _loc1_ = _background.graphics;
         _loc2_ = null;
         FlashGraphics.bitmapFill[_loc1_] = _loc2_;
         _loc1_.endFill();
         _loc12_ = _loc10_;
         _loc11_ = _loc7_;
         _background.scale9Grid = _loc4_;
      }
      
      public function clear() : void
      {
      }
   }
}

