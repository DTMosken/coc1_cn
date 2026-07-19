package classes.scenes.monsters.pregnancies
{
   import classes.Player;
   import classes.globalFlags.KGAMECLASS;
   import classes.internals.GuiOutput;
   import classes.scenes.AnalPregnancy;
   import classes.scenes.PregnancyProgression;
   import classes.scenes.VaginalPregnancy;
   import flash.Boot;
   
   public class PlayerSatyrPregnancy implements AnalPregnancy, VaginalPregnancy
   {
      
      public var output:GuiOutput;
      
      public function PlayerSatyrPregnancy(param1:GuiOutput = undefined)
      {
         if(Boot.skip_constructor)
         {
            return;
         }
         output = param1;
         PregnancyProgression.registerVaginalPregnancyScene(25,19,this);
         PregnancyProgression.registerAnalPregnancyScene(25,19,this);
      }
      
      public function vaginalBirth() : void
      {
         KGAMECLASS.kGAMECLASS.plains.satyrScene.satyrBirth(true);
      }
      
      public function updateVaginalPregnancy() : Boolean
      {
         var _loc1_:Player = KGAMECLASS.kGAMECLASS.player;
         var _loc2_:Boolean = false;
         if(_loc1_.get_pregnancyIncubation() == 150)
         {
            output.text("<b>你发现自己最近感觉相当迟钝；你就是没有以前那么有活力了。你的体重也在增加。</b>[pg]");
            _loc2_ = true;
         }
         if(_loc1_.get_pregnancyIncubation() == 125)
         {
            output.text("<b>你的肚子越来越大了。也许你最近的冲动就是罪魁祸首？</b>[pg]");
            _loc2_ = true;
         }
         if(_loc1_.get_pregnancyIncubation() == 100)
         {
            output.text("<b>你能感觉到隆起的肚子里有种奇怪的扑腾感；一定是怀孕了。你应该多吃点，多喝点酒，这样你的宝宝才能健康成长。等等，酒……？</b>[pg]");
            _loc2_ = true;
         }
         if(_loc1_.get_pregnancyIncubation() == 75)
         {
            output.text("<b>有时你会感觉到怀孕的肚子里有动静。你想知道是不是你的宝宝在抱怨你走来走去。</b>[pg]");
            _loc2_ = true;
         }
         if(_loc1_.get_pregnancyIncubation() == 50)
         {
            output.text("<b>随着肚子越来越大，你越来越不想做任何有意义的运动；你总是感到饥渴和饥饿……</b>[pg]");
            _loc2_ = true;
         }
         if(_loc1_.get_pregnancyIncubation() == 30)
         {
            output.text("<b>你怀着的宝宝不断地踢你的肚子，要求食物和酒，你感到迟钝和饥渴。你迫不及待地想生下这个小家伙，这样你终于可以休息一会儿了。</b>[pg]");
            _loc2_ = true;
         }
         return _loc2_;
      }
      
      public function updateAnalPregnancy() : Boolean
      {
         var _loc1_:Player = KGAMECLASS.kGAMECLASS.player;
         var _loc2_:Boolean = false;
         if(_loc1_.get_buttPregnancyIncubation() == 150)
         {
            output.text("<b>你发现自己最近感觉相当迟钝；你就是没有以前那么有活力了。你的体重也在增加。</b>[pg]");
            _loc2_ = true;
         }
         if(_loc1_.get_buttPregnancyIncubation() == 125)
         {
            output.text("<b>你的肚子越来越大了。也许你最近的冲动就是罪魁祸首？</b>[pg]");
            _loc2_ = true;
         }
         if(_loc1_.get_buttPregnancyIncubation() == 100)
         {
            output.text("<b>你能感觉到隆起的肚子里有种奇怪的扑腾感；一定是怀孕了。你应该多吃点，多喝点酒，这样你的宝宝才能健康成长。等等，酒……？</b>[pg]");
            _loc2_ = true;
         }
         if(_loc1_.get_buttPregnancyIncubation() == 75)
         {
            output.text("<b>有时你会感觉到怀孕的肚子里有动静。你想知道是不是你的宝宝在抱怨你走来走去。</b>[pg]");
            _loc2_ = true;
         }
         if(_loc1_.get_buttPregnancyIncubation() == 50)
         {
            output.text("<b>随着肚子越来越大，你越来越不想做任何有意义的运动；你总是感到饥渴和饥饿……</b>[pg]");
            _loc2_ = true;
         }
         if(_loc1_.get_buttPregnancyIncubation() == 30)
         {
            output.text("<b>你怀着的宝宝不断地踢你的肚子，要求食物和酒，你感到迟钝和饥渴。你迫不及待地想生下这个小家伙，这样你终于可以休息一会儿了。</b>[pg]");
            _loc2_ = true;
         }
         return _loc2_;
      }
      
      public function analBirth() : void
      {
         KGAMECLASS.kGAMECLASS.plains.satyrScene.satyrBirth(false);
      }
   }
}

