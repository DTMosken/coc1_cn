package classes
{
   import classes.display.BindingPane;
   import coc.view.CoCButton;
   import coc.view.MainView;
   import flash.Boot;
   import flash.display.Stage;
   import flash.events.KeyboardEvent;
   import flash.text.TextField;
   import flash.utils.Dictionary;
   import haxe.IMap;
   import haxe.ds.IntMap;
   import haxe.ds.StringMap;
   
   public class InputManager
   {
      
      public static var PRIMARYKEY:Boolean = true;
      
      public static var SECONDARYKEY:Boolean = false;
      
      public static var UNBOUNDKEY:int = -1;
      
      public var _stage:Stage;
      
      public var _mainView:MainView;
      
      public var _mainText:TextField;
      
      public var _keysToControlMethods:IMap;
      
      public var _defaultKeysToControlMethods:IMap;
      
      public var _defaultControlMethods:IMap;
      
      public var _defaultAvailableControlMethods:int;
      
      public var _controlMethods:IMap;
      
      public var _cheatControlMethods:Array;
      
      public var _bindingSlot:Boolean;
      
      public var _bindingPane:BindingPane;
      
      public var _bindingMode:Boolean;
      
      public var _bindingFunc:String;
      
      public var _availableControlMethods:int;
      
      public var _availableCheatControlMethods:int;
      
      public function InputManager(param1:Stage = undefined, param2:MainView = undefined)
      {
         if(Boot.skip_constructor)
         {
            return;
         }
         _bindingSlot = false;
         _bindingFunc = "";
         _bindingMode = false;
         _keysToControlMethods = new IntMap();
         _availableCheatControlMethods = 0;
         _cheatControlMethods = [];
         _availableControlMethods = 0;
         _controlMethods = new StringMap();
         _defaultAvailableControlMethods = 0;
         _defaultKeysToControlMethods = new IntMap();
         _defaultControlMethods = new StringMap();
         _bindingMode = false;
         _stage = param1;
         _mainView = param2;
         _availableControlMethods = 0;
         _availableCheatControlMethods = 0;
         _mainText = param2.mainText;
         _bindingPane = new BindingPane(this,int(_mainText.x),int(_mainText.y),int(_mainText.width + 16),int(_mainText.height));
         _stage.addEventListener(KeyboardEvent.KEY_DOWN,KeyHandler);
      }
      
      public function showHotkeys(param1:Boolean) : void
      {
         var _loc10_:* = null;
         var _loc11_:int = 0;
         var _loc12_:Boolean = false;
         var _loc13_:* = null as BoundControlMethod;
         var _loc14_:* = null as BoundControlMethod;
         var _loc2_:StringMap = _controlMethods;
         var _loc3_:* = _loc2_.h;
         var _loc4_:* = _loc2_.rh;
         var _loc5_:int = 0;
         var _loc6_:* = _loc3_;
         var _loc7_:int = _loc5_;
         var _loc8_:Boolean = §§hasnext(_loc6_,_loc7_);
         if(!_loc8_ && _loc4_ != null)
         {
            _loc3_ = _loc4_;
            _loc6_ = _loc3_;
            _loc5_ = 0;
            _loc7_ = _loc5_;
            _loc4_ = null;
            _loc8_ = §§hasnext(_loc6_,_loc7_);
         }
         var _loc9_:int = _loc7_;
         while(true)
         {
            _loc10_ = _loc3_;
            _loc11_ = _loc5_;
            _loc12_ = §§hasnext(_loc10_,_loc11_);
            if(!_loc12_ && _loc4_ != null)
            {
               _loc3_ = _loc4_;
               _loc10_ = _loc3_;
               _loc5_ = 0;
               _loc11_ = _loc5_;
               _loc4_ = null;
               _loc12_ = §§hasnext(_loc10_,_loc11_);
            }
            _loc9_ = _loc11_;
            if(!_loc12_)
            {
               break;
            }
            _loc13_ = §§nextvalue(_loc9_,_loc3_);
            _loc5_ = _loc9_;
            _loc14_ = _loc13_;
            _loc14_.set_showHotkeys(param1);
         }
      }
      
      public function addCheatControl(param1:String, param2:String, param3:Function, param4:CoCButton = undefined) : void
      {
         var _temp_5:* = §§findproperty(BoundControlMethod);
         var _temp_4:* = param3;
         var _temp_3:* = param1;
         var _temp_2:* = param2;
         var _loc6_:int;
         _availableCheatControlMethods = (_loc6_ = _availableCheatControlMethods) + 1;
         var _loc5_:BoundControlMethod = new BoundControlMethod(_temp_4,_temp_3,_temp_2,_loc6_);
         _cheatControlMethods.push(_loc5_);
         if(param4 != null)
         {
            _loc5_.set_button(param4);
         }
      }
      
      public function StopListenForNewBind() : void
      {
         _bindingMode = false;
         _mainView.showCurrentBottomButtons();
         DisplayBindingPane();
      }
      
      public function SaveBindsToObj() : *
      {
         var _loc5_:* = null as String;
         var _loc6_:* = null as BoundControlMethod;
         var _loc7_:* = null as String;
         var _loc8_:* = null as String;
         var _loc9_:* = null as BoundControlMethod;
         var _loc1_:* = {};
         var _loc2_:IMap = _controlMethods;
         var _loc3_:IMap = _loc2_;
         var _loc4_:* = _loc2_.keys();
         while(Boolean(_loc4_.hasNext()))
         {
            _loc5_ = _loc4_.next();
            _loc6_ = _loc3_.get(_loc5_);
            _loc7_ = _loc5_;
            _loc8_ = _loc7_;
            _loc9_ = _loc6_;
            _loc1_[_loc8_] = {
               "primaryKey":_loc9_.primaryKey,
               "secondaryKey":_loc9_.secondaryKey
            };
         }
         return _loc1_;
      }
      
      public function ResetToDefaults() : void
      {
         var _loc4_:* = null as String;
         var _loc5_:* = null as BoundControlMethod;
         var _loc6_:* = null as String;
         var _loc7_:* = null as String;
         var _loc8_:* = null as BoundControlMethod;
         var _loc9_:* = null as IMap;
         var _loc10_:* = null as BoundControlMethod;
         var _loc11_:* = null as StringMap;
         var _loc12_:int = 0;
         var _loc13_:int = 0;
         var _loc14_:int = 0;
         var _loc1_:IMap = _defaultControlMethods;
         var _loc2_:IMap = _loc1_;
         var _loc3_:* = _loc1_.keys();
         while(Boolean(_loc3_.hasNext()))
         {
            _loc4_ = _loc3_.next();
            _loc5_ = _loc2_.get(_loc4_);
            _loc6_ = _loc4_;
            _loc7_ = _loc6_;
            _loc8_ = _loc5_;
            _loc9_ = _controlMethods;
            _loc10_ = new BoundControlMethod(_loc8_.func,_loc8_.name,_loc8_.description,_loc8_.index,_loc8_.primaryKey,_loc8_.secondaryKey);
            _loc11_ = _loc9_;
            if(_loc7_ in StringMap.reserved)
            {
               _loc11_.setReserved(_loc7_,_loc10_);
            }
            else
            {
               _loc11_.h[_loc7_] = _loc10_;
            }
         }
         _keysToControlMethods.h = new Dictionary();
         _loc1_ = _defaultKeysToControlMethods;
         _loc2_ = _loc1_;
         _loc3_ = _loc1_.keys();
         while(Boolean(_loc3_.hasNext()))
         {
            _loc12_ = int(_loc3_.next());
            _loc4_ = _loc2_.get(_loc12_);
            _loc13_ = _loc12_;
            _loc14_ = _loc13_;
            _loc6_ = _loc4_;
            _keysToControlMethods.h[_loc14_] = _loc6_;
         }
      }
      
      public function RemoveExistingKeyBind(param1:int) : void
      {
         var _loc2_:String = _keysToControlMethods.h[param1];
         if(_loc2_ == null)
         {
            return;
         }
         var _loc3_:StringMap = _controlMethods;
         var _loc4_:BoundControlMethod = _loc2_ in StringMap.reserved ? _loc3_.getReserved(_loc2_) : _loc3_.h[_loc2_];
         if(_loc4_ == null)
         {
            return;
         }
         if(_loc4_.primaryKey == param1)
         {
            _loc4_.set_primaryKey(_loc4_.secondaryKey);
         }
         _loc4_.set_secondaryKey(-1);
      }
      
      public function RegisterDefaults() : void
      {
         var _loc4_:* = null as String;
         var _loc5_:* = null as BoundControlMethod;
         var _loc6_:* = null as String;
         var _loc7_:* = null as String;
         var _loc8_:* = null as BoundControlMethod;
         var _loc9_:* = null as IMap;
         var _loc10_:* = null as BoundControlMethod;
         var _loc11_:* = null as StringMap;
         var _loc12_:int = 0;
         var _loc13_:int = 0;
         var _loc14_:int = 0;
         var _loc1_:IMap = _controlMethods;
         var _loc2_:IMap = _loc1_;
         var _loc3_:* = _loc1_.keys();
         while(Boolean(_loc3_.hasNext()))
         {
            _loc4_ = _loc3_.next();
            _loc5_ = _loc2_.get(_loc4_);
            _loc6_ = _loc4_;
            _loc7_ = _loc6_;
            _loc8_ = _loc5_;
            _loc9_ = _defaultControlMethods;
            _loc10_ = new BoundControlMethod(_loc8_.func,_loc8_.name,_loc8_.description,_loc8_.index,_loc8_.primaryKey,_loc8_.secondaryKey);
            _loc11_ = _loc9_;
            if(_loc7_ in StringMap.reserved)
            {
               _loc11_.setReserved(_loc7_,_loc10_);
            }
            else
            {
               _loc11_.h[_loc7_] = _loc10_;
            }
         }
         _defaultKeysToControlMethods.h = new Dictionary();
         _loc1_ = _keysToControlMethods;
         _loc2_ = _loc1_;
         _loc3_ = _loc1_.keys();
         while(Boolean(_loc3_.hasNext()))
         {
            _loc12_ = int(_loc3_.next());
            _loc4_ = _loc2_.get(_loc12_);
            _loc13_ = _loc12_;
            _loc14_ = _loc13_;
            _loc6_ = _loc4_;
            _defaultKeysToControlMethods.h[_loc14_] = _loc6_;
         }
      }
      
      public function LoadBindsFromObj(param1:*) : void
      {
         var _loc6_:* = null as String;
         var _loc7_:* = null;
         var _loc8_:* = null as String;
         var _loc9_:* = null as String;
         var _loc10_:* = null;
         ClearAllBinds();
         var _loc2_:* = param1;
         var _loc3_:* = _loc2_;
         var _loc4_:Array = Reflect.fields(_loc2_);
         var _loc5_:int = 0;
         while(_loc5_ < int(_loc4_.length))
         {
            _loc6_ = _loc4_[_loc5_++];
            _loc7_ = Reflect.field(_loc3_,_loc6_);
            _loc8_ = _loc6_;
            _loc9_ = _loc8_;
            _loc10_ = _loc7_;
            if(_loc10_.primaryKey != -1)
            {
               BindKeyToControl(_loc10_.primaryKey,_loc9_,true);
            }
            if(_loc10_.secondaryKey != -1)
            {
               BindKeyToControl(_loc10_.secondaryKey,_loc9_,false);
            }
         }
      }
      
      public function ListenForNewBind(param1:String, param2:Boolean = true) : void
      {
         _bindingMode = true;
         _bindingFunc = param1;
         _bindingSlot = param2;
         _mainText.htmlText = "<b>按下你想绑定到 " + param1 + " 的按键！</b>";
         _mainView.hideCurrentBottomButtons();
         HideBindingPane();
      }
      
      public function KeyHandler(param1:KeyboardEvent) : void
      {
         if(_mainView.eventTestInput.x == 207.5)
         {
            return;
         }
         if(_mainView.nameBox.visible && _stage.focus == _mainView.nameBox)
         {
            return;
         }
         if(_bindingMode)
         {
            BindKeyToControl(param1.keyCode,_bindingFunc,_bindingSlot);
            StopListenForNewBind();
            return;
         }
         ExecuteKeyCode(param1.keyCode);
      }
      
      public function HideBindingPane() : void
      {
         _mainText.visible = true;
         _bindingPane.parent.removeChild(_bindingPane);
      }
      
      public function GetControlMethods() : Array
      {
         var _loc8_:* = null as Dictionary;
         var _loc9_:int = 0;
         var _loc10_:Boolean = false;
         var _loc11_:int = 0;
         var _loc12_:int = 0;
         var _loc1_:Array = [];
         var _loc2_:Dictionary = _keysToControlMethods.h;
         var _loc3_:int = 0;
         var _loc4_:Dictionary = _loc2_;
         var _loc5_:int = _loc3_;
         var _loc6_:Boolean = §§hasnext(_loc4_,_loc5_);
         var _loc7_:int = _loc5_;
         while(true)
         {
            _loc8_ = _loc2_;
            _loc9_ = _loc3_;
            _loc10_ = §§hasnext(_loc8_,_loc9_);
            _loc7_ = _loc9_;
            if(!_loc10_)
            {
               break;
            }
            _loc11_ = §§nextname(_loc7_,_loc2_);
            _loc3_ = _loc7_;
            _loc12_ = _loc11_;
            _loc1_.push(_loc12_);
         }
         return _loc1_;
      }
      
      public function GetAvailableFunctions() : Array
      {
         var _loc5_:* = null as String;
         var _loc6_:* = null as BoundControlMethod;
         var _loc7_:* = null as String;
         var _loc8_:* = null as String;
         var _loc9_:* = null as BoundControlMethod;
         var _loc1_:Array = [];
         var _loc2_:IMap = _controlMethods;
         var _loc3_:IMap = _loc2_;
         var _loc4_:* = _loc2_.keys();
         while(Boolean(_loc4_.hasNext()))
         {
            _loc5_ = _loc4_.next();
            _loc6_ = _loc3_.get(_loc5_);
            _loc7_ = _loc5_;
            _loc8_ = _loc7_;
            _loc9_ = _loc6_;
            _loc1_.push(_loc9_);
         }
         var _loc10_:Array = _loc1_;
         _loc10_.sort(function(param1:BoundControlMethod, param2:BoundControlMethod):int
         {
            return param1.index - param2.index;
         });
         return _loc10_;
      }
      
      public function ExecuteKeyCode(param1:int) : void
      {
         var _loc3_:* = null as StringMap;
         var _loc4_:* = null as BoundControlMethod;
         var _loc2_:String = _keysToControlMethods.h[param1];
         if(_loc2_ != null)
         {
            _loc3_ = _controlMethods;
            _loc4_ = _loc2_ in StringMap.reserved ? _loc3_.getReserved(_loc2_) : _loc3_.h[_loc2_];
            if(_loc4_ != null)
            {
               _loc4_.func();
            }
         }
         var _loc5_:int = 0;
         var _loc6_:Array = _cheatControlMethods;
         while(_loc5_ < int(_loc6_.length))
         {
            _loc4_ = _loc6_[_loc5_];
            _loc5_++;
            _loc4_.func(param1);
         }
      }
      
      public function DisplayBindingPane() : void
      {
         _mainText.visible = false;
         _bindingPane.functions = GetAvailableFunctions();
         _bindingPane.ListBindingOptions();
         _mainView.setMainFocus(_bindingPane,false,true);
         _bindingPane.update();
      }
      
      public function ClearAllBinds() : void
      {
         var _loc9_:* = null;
         var _loc10_:int = 0;
         var _loc11_:Boolean = false;
         var _loc12_:* = null as BoundControlMethod;
         var _loc13_:* = null as BoundControlMethod;
         var _loc1_:StringMap = _controlMethods;
         var _loc2_:* = _loc1_.h;
         var _loc3_:* = _loc1_.rh;
         var _loc4_:int = 0;
         var _loc5_:* = _loc2_;
         var _loc6_:int = _loc4_;
         var _loc7_:Boolean = §§hasnext(_loc5_,_loc6_);
         if(!_loc7_ && _loc3_ != null)
         {
            _loc2_ = _loc3_;
            _loc5_ = _loc2_;
            _loc4_ = 0;
            _loc6_ = _loc4_;
            _loc3_ = null;
            _loc7_ = §§hasnext(_loc5_,_loc6_);
         }
         var _loc8_:int = _loc6_;
         while(true)
         {
            _loc9_ = _loc2_;
            _loc10_ = _loc4_;
            _loc11_ = §§hasnext(_loc9_,_loc10_);
            if(!_loc11_ && _loc3_ != null)
            {
               _loc2_ = _loc3_;
               _loc9_ = _loc2_;
               _loc4_ = 0;
               _loc10_ = _loc4_;
               _loc3_ = null;
               _loc11_ = §§hasnext(_loc9_,_loc10_);
            }
            _loc8_ = _loc10_;
            if(!_loc11_)
            {
               break;
            }
            _loc12_ = §§nextvalue(_loc8_,_loc2_);
            _loc4_ = _loc8_;
            _loc13_ = _loc12_;
            _loc13_.set_primaryKey(-1);
            _loc13_.set_secondaryKey(-1);
         }
         _keysToControlMethods.h = new Dictionary();
      }
      
      public function BindKeyToControl(param1:int, param2:String, param3:Boolean = true) : void
      {
         var _loc6_:int = 0;
         var _loc4_:StringMap = _controlMethods;
         var _loc5_:BoundControlMethod = param2 in StringMap.reserved ? _loc4_.getReserved(param2) : _loc4_.h[param2];
         if(_loc5_ == null)
         {
            return;
         }
         RemoveExistingKeyBind(param1);
         if(param3)
         {
            _loc6_ = _loc5_.primaryKey;
            _loc5_.set_primaryKey(param1);
         }
         else
         {
            _loc6_ = _loc5_.secondaryKey;
            _loc5_.set_secondaryKey(param1);
         }
         if(_loc6_ != -1)
         {
            _keysToControlMethods.remove(_loc6_);
         }
         _keysToControlMethods.h[param1] = param2;
      }
      
      public function AddBindableControl(param1:String, param2:String, param3:Function, param4:CoCButton = undefined) : void
      {
         var _temp_5:* = §§findproperty(BoundControlMethod);
         var _temp_4:* = param3;
         var _temp_3:* = param1;
         var _temp_2:* = param2;
         var _loc6_:int;
         _availableControlMethods = (_loc6_ = _availableControlMethods) + 1;
         var _loc5_:BoundControlMethod = new BoundControlMethod(_temp_4,_temp_3,_temp_2,_loc6_);
         var _loc7_:StringMap = _controlMethods;
         var _loc8_:BoundControlMethod = _loc5_;
         if(param1 in StringMap.reserved)
         {
            _loc7_.setReserved(param1,_loc8_);
         }
         else
         {
            _loc7_.h[param1] = _loc8_;
         }
         if(param4 != null)
         {
            _loc5_.set_button(param4);
         }
      }
   }
}

