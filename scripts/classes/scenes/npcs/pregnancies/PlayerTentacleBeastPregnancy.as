package classes.scenes.npcs.pregnancies
{
   import classes.Player;
   import classes.globalFlags.KGAMECLASS;
   import classes.internals.GuiOutput;
   import classes.internals.PregnancyUtils;
   import classes.internals.Utils;
   import classes.scenes.PregnancyProgression;
   import classes.scenes.VaginalPregnancy;
   import flash.Boot;
   
   public class PlayerTentacleBeastPregnancy implements VaginalPregnancy
   {
      
      public var output:GuiOutput;
      
      public function PlayerTentacleBeastPregnancy(param1:GuiOutput = undefined)
      {
         if(Boot.skip_constructor)
         {
            return;
         }
         output = param1;
         PregnancyProgression.registerVaginalPregnancyScene(25,39,this);
      }
      
      public function vaginalBirth() : void
      {
         var _loc1_:Player = KGAMECLASS.kGAMECLASS.player;
         PregnancyUtils.createVaginaIfMissing(output,_loc1_);
         KGAMECLASS.kGAMECLASS.forest.tentacleBeastScene.pumpkinBirth();
         if(_loc1_.hips.rating < 10)
         {
            _temp_1.rating += 1;
            output.text("[pg]分娩后你的" + Utils.cnName(_loc1_.get_armorName()) + "穿在你的" + _loc1_.hipDescript() + "上显得更紧身了。");
         }
         output.text("[pg]");
      }
      
      public function updateVaginalPregnancy() : Boolean
      {
         var _loc1_:Player = KGAMECLASS.kGAMECLASS.player;
         var _loc2_:Boolean = false;
         if(_loc1_.get_pregnancyIncubation() == 120)
         {
            output.text("<b>你感觉到肚子里有一个坚硬的小肿块。这让你有些不舒服。</b>[pg]");
            _loc2_ = true;
         }
         if(_loc1_.get_pregnancyIncubation() == 90)
         {
            output.text("<b>肿块变大了，在你的腹部已经有些明显。你的肚子感觉有点酸痛，四处走动也变得不舒服。</b>[pg]");
            _loc2_ = true;
         }
         if(_loc1_.get_pregnancyIncubation() == 60)
         {
            output.text("<b>你的体液有一种明显的……青草味。此外，你肚子里的肿块已经长得大到令人疼痛的地步。很明显你怀上了什么东西，尽管它似乎并没有在你的子宫里活动。</b>[pg]");
            _loc2_ = true;
         }
         if(_loc1_.get_pregnancyIncubation() == 30)
         {
            output.text("<b>你的嘴和唾液尝起来有很明显的南瓜味。这并不完全令人讨厌，但很难忽视。肿块已经停止生长，所以用不了多久，你体内的东西就准备好出生了。</b>[pg]");
            _loc2_ = true;
         }
         return _loc2_;
      }
   }
}

