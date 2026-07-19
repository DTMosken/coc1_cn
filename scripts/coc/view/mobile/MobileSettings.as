package coc.view.mobile
{
   import classes.display.GameViewData;
   import classes.display.Setting;
   import classes.display.SettingParams;
   import classes.saves.SelfSaver;
   import classes.saves.SelfSaving;
   import coc.view.mobile._MobileSettings.SaveData;
   import flash.Boot;
   import flash.display.DisplayObject;
   import haxe.IMap;
   import haxe.ds.StringMap;
   
   public class MobileSettings implements SelfSaving
   {
      
      public static var _ui:DisplayObject;
      
      public static var _instance:MobileSettings;
      
      public var saveVersion:int;
      
      public var saveName:String;
      
      public var globalSave:Boolean;
      
      public var _data:SaveData;
      
      public function MobileSettings()
      {
         if(Boot.skip_constructor)
         {
            return;
         }
         globalSave = true;
         saveVersion = 0;
         saveName = "MobileSettings";
         _data = new SaveData();
         SelfSaver.register(this);
         MobileSettings._instance = this;
      }
      
      public static function set_mobileUI(param1:DisplayObject) : DisplayObject
      {
         MobileSettings._ui = param1;
         MobileSettings._instance.onSettingsChanged();
         return param1;
      }
      
      public function setOption(param1:String, param2:Boolean) : void
      {
         Reflect.setProperty(get_data(),param1,param2);
         onSettingsChanged();
         if(GameViewData.onSettingsUpdated != null)
         {
            GameViewData.onSettingsUpdated();
         }
      }
      
      public function saveToObject() : Object
      {
         return _data;
      }
      
      public function reset() : void
      {
         _data.reset();
      }
      
      public function onSettingsChanged() : void
      {
         var _loc1_:IMap = GameViewData.injectedDisplaySettings;
         var _loc2_:String = saveName;
         var _loc3_:Array = get_settingData();
         var _loc4_:StringMap = _loc1_;
         if(_loc2_ in StringMap.reserved)
         {
            _loc4_.setReserved(_loc2_,_loc3_);
         }
         else
         {
            _loc4_.h[_loc2_] = _loc3_;
         }
         if(MobileSettings._ui == null)
         {
            return;
         }
         if(get_data().useMobileUI)
         {
            MobileSettings._ui.visible = true;
            MobileSettings._ui.stage.align = "TL";
            MobileSettings._ui.stage.scaleMode = "noScale";
         }
         else
         {
            MobileSettings._ui.visible = false;
            MobileSettings._ui.stage.align = "";
            MobileSettings._ui.stage.scaleMode = "showAll";
         }
         if(get_data().fullscreen)
         {
            MobileSettings._ui.stage.displayState = "fullScreenInteractive";
         }
         else
         {
            MobileSettings._ui.stage.displayState = "normal";
         }
      }
      
      public function onAscend(param1:Boolean) : void
      {
      }
      
      public function load(param1:int, param2:*) : void
      {
         var _loc3_:* = param2;
         _data.load(param1,_loc3_);
         onSettingsChanged();
      }
      
      public function get_settingData() : Array
      {
         var _g:MobileSettings = this;
         var option:String = "useMobileUI";
         var value:Boolean = true;
         var _g1:MobileSettings = this;
         var option1:String = "useMobileUI";
         var value1:Boolean = false;
         var _g2:MobileSettings = this;
         var option2:String = "fullscreen";
         var value2:Boolean = true;
         var _g3:MobileSettings = this;
         var option3:String = "fullscreen";
         var value3:Boolean = false;
         var _g4:MobileSettings = this;
         var option4:String = "cutouts";
         var value4:Boolean = true;
         var _g5:MobileSettings = this;
         var option5:String = "cutouts";
         var value5:Boolean = false;
         return [new Setting("使用移动端UI",[new SettingParams("开启",function():void
         {
            _g.setOption(option,value);
         },"将使用自定义的移动端UI。新UI目前处于实验阶段，尚未完全完善。",get_data().useMobileUI,null),new SettingParams("关闭",function():void
         {
            _g1.setOption(option1,value1);
         },"将不使用自定义的移动端UI。新UI目前处于实验阶段，尚未完全完善。",!get_data().useMobileUI,null)]),new Setting("全屏",[new SettingParams("开启",function():void
         {
            _g2.setOption(option2,value2);
         },"全屏背景将渲染在刘海/挖孔区域内。",get_data().fullscreen,null),new SettingParams("关闭",function():void
         {
            _g3.setOption(option3,value3);
         },"全屏背景将避开刘海/挖孔区域。",!get_data().fullscreen,null)]),new Setting("在刘海/挖孔区域下绘制背景",[new SettingParams("开启",function():void
         {
            _g4.setOption(option4,value4);
         },"全屏背景将渲染在刘海/挖孔区域内。",get_data().cutouts,null),new SettingParams("关闭",function():void
         {
            _g5.setOption(option5,value5);
         },"全屏背景将避开刘海/挖孔区域。",!get_data().cutouts,null)])];
      }
      
      public function get_data() : SaveData
      {
         return _data;
      }
   }
}

