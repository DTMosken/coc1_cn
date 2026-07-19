package classes.scenes.monsters.pregnancies
{
   import classes.Player;
   import classes.globalFlags.KGAMECLASS;
   import classes.internals.GuiOutput;
   import classes.scenes.AnalPregnancy;
   import classes.scenes.PregnancyProgression;
   import flash.Boot;
   
   public class PlayerSandTrapPregnancy implements AnalPregnancy
   {
      
      public var output:GuiOutput;
      
      public function PlayerSandTrapPregnancy(param1:GuiOutput = undefined)
      {
         if(Boot.skip_constructor)
         {
            return;
         }
         output = param1;
         PregnancyProgression.registerAnalPregnancyScene(25,28,this);
      }
      
      public function updateAnalPregnancy() : Boolean
      {
         var _loc1_:Player = KGAMECLASS.kGAMECLASS.player;
         var _loc2_:Boolean = false;
         if(_loc1_.get_buttPregnancyIncubation() == 36)
         {
            output.text("<b>\n你的肠道发出奇怪的咕噜声，不安地蠕动着。你感到越来越空虚，仿佛你体内的一些阻塞物正在被分解。</b>[pg]");
            _loc1_.buttKnockUpForce();
            _loc2_ = true;
         }
         return _loc2_;
      }
      
      public function analBirth() : void
      {
      }
   }
}

