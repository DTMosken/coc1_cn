package classes.menus
{
   import classes.BreastRow;
   import classes.Player;
   import classes.internals.GuiInput;
   import classes.internals.GuiOutput;
   import coc.view.CoCButton;
   import flash.Boot;
   
   public class GenderDebug implements Menu
   {
      
      public static var BUTTON_NAME:String = "性别";
      
      public static var BUTTON_HINT:String = "添加和移除与性别相关的部位";
      
      public var player:Player;
      
      public var output:GuiOutput;
      
      public var onMenuExit:Function;
      
      public var gui:GuiInput;
      
      public function GenderDebug(param1:GuiInput = undefined, param2:GuiOutput = undefined, param3:Player = undefined, param4:Function = undefined)
      {
         if(Boot.skip_constructor)
         {
            return;
         }
         player = param3;
         gui = param1;
         output = param2;
         onMenuExit = param4;
      }
      
      public function removeVaginas() : void
      {
         while(player.hasVagina())
         {
            player.removeVagina();
         }
         refreshMenuText();
      }
      
      public function removeCocks() : void
      {
         while(player.hasCock())
         {
            player.removeCock(0,1);
         }
         refreshMenuText();
      }
      
      public function removeBreasts() : void
      {
         while(int(player.breastRows.length) > 1)
         {
            player.removeBreastRow(0,1);
         }
         if(player.hasBreasts())
         {
            player.breastRows[0].breastRating = 0;
         }
         refreshMenuText();
      }
      
      public function removeBalls() : void
      {
         _temp_1.balls -= 2;
         if(player.balls < 0)
         {
            player.balls = 0;
         }
         refreshMenuText();
      }
      
      public function refreshMenuText() : void
      {
         printMenuHeader();
         printGenderStats();
         output.flush();
      }
      
      public function printMenuHeader() : void
      {
         output.clear();
         output.header("性别调试菜单");
         output.text("<b>风险自负！</b>\n");
         output.text("此菜单允许你创建在正常游戏过程中不可能出现的游戏状态，你可能需要创建一个备份存档以防万一。\n\n");
      }
      
      public function printGenderStats() : void
      {
         output.text("当前身体状态：\n\n");
         output.text("你有" + int(player.vaginas.length) + "个小穴\n");
         output.text("你有" + int(player.cocks.length) + "根肉棒\n");
         output.text("你有" + player.balls + "个卵蛋\n");
         output.text("你有" + int(player.breastRows.length) + "个乳房\n");
      }
      
      public function getButtonText() : String
      {
         return "性别";
      }
      
      public function getButtonHint() : String
      {
         return "添加和移除与性别相关的部位";
      }
      
      public function enter() : void
      {
         refreshMenuText();
         gui.menu();
         gui.addButton(0,"移除阴道",removeVaginas).hint("移除所有阴道");
         gui.addButton(1,"移除阴茎",removeCocks).hint("移除所有阴茎");
         gui.addButton(2,"移除睾丸",removeBalls).hint("移除2个睾丸");
         gui.addButton(3,"移除乳房",removeBreasts).hint("移除所有乳房");
         gui.addButton(5,"添加阴道",addVagina);
         gui.addButton(6,"添加阴茎",addCock);
         gui.addButton(7,"添加睾丸",addBalls).hint("添加2个睾丸");
         gui.addButton(8,"添加乳房",addBreasts).hint("添加一排乳房");
         gui.addButton(14,"返回",onMenuExit);
      }
      
      public function addVagina() : void
      {
         player.createVagina();
         refreshMenuText();
      }
      
      public function addCock() : void
      {
         player.createCock();
         refreshMenuText();
      }
      
      public function addBreasts() : void
      {
         player.createBreastRow(1);
         refreshMenuText();
      }
      
      public function addBalls() : void
      {
         _temp_1.balls += 2;
         refreshMenuText();
      }
   }
}

