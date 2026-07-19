package classes
{
   import classes.globalFlags.KGAMECLASS;
   import flash.net.SharedObject;
   
   public class Bindings
   {
      
      public function Bindings()
      {
      }
      
      public function get_game() : CoC
      {
         return KGAMECLASS.kGAMECLASS;
      }
      
      public function execQuickSave(param1:int) : void
      {
         var slotX:String;
         var _gthis:Bindings;
         var _loc2_:* = null as Function;
         _gthis = this;
         if(get_game().mainView.menuButtonIsVisible("data") && get_game().player.loaded)
         {
            slotX = "CoC_" + param1;
            if(get_game().get_hardcore())
            {
               slotX = get_game().get_hardcoreSlot();
            }
            _loc2_ = function():void
            {
               _gthis.get_game().saves.saveGame(slotX);
               _gthis.get_game().clearOutput();
               _gthis.get_game().outputText("游戏已保存至" + slotX + "！");
               _gthis.get_game().output.doNext(_gthis.get_game().playerMenu);
            };
            if(!get_game().get_gameplaySettings().quicksaveConfirm)
            {
               _loc2_();
               return;
            }
            get_game().clearOutput();
            get_game().outputText("你即将把当前游戏快速保存至<b>" + slotX + "</b>[pg]确定吗？");
            get_game().output.doYesNo(_loc2_,get_game().playerMenu);
         }
      }
      
      public function execQuickLoad(param1:uint) : void
      {
         var slot:uint = param1;
         var _gthis:Bindings = this;
         if(!get_game().player.loaded || !(get_game().mainView.menuButtonIsVisible("data") || get_game().get_gameplaySettings().quickloadAnywhere))
         {
            return;
         }
         var _loc2_:SharedObject = SharedObject.getLocal("CoC_" + ("" + slot),"/");
         if(!_loc2_.data.exists)
         {
            return;
         }
         var _loc3_:Function = function():void
         {
            if(_gthis.get_game().saves.loadGame("CoC_" + ("" + slot)))
            {
               _gthis.get_game().output.showStats();
               _gthis.get_game().output.statScreenRefresh();
               _gthis.get_game().clearOutput();
               _gthis.get_game().outputText("存档位 " + ("" + slot) + " 已加载！");
               _gthis.get_game().output.doNext(_gthis.get_game().playerMenu);
            }
         };
         if(!get_game().player.loaded || !get_game().get_gameplaySettings().quickloadConfirm)
         {
            _loc3_();
            return;
         }
         get_game().clearOutput();
         get_game().outputText("你即将从存档位 <b>" + ("" + slot) + "</b> 快速读取当前游戏。[pg]你确定吗？");
         get_game().output.menu();
         get_game().output.addButton(0,"取消",get_game().playerMenu);
         get_game().output.addButton(1,"确定",_loc3_);
      }
   }
}

