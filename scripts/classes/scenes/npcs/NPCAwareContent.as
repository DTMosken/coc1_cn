package classes.scenes.npcs
{
   import classes.BaseContent;
   import classes.CoC;
   import classes.items.Mutations;
   import classes.scenes.FollowerInteractions;
   import classes.scenes.npcs.pets.Akky;
   import classes.scenes.places.TelAdre;
   import classes.scenes.seasonal.Nieve;
   import flash.Boot;
   
   public class NPCAwareContent extends BaseContent
   {
      
      public function NPCAwareContent()
      {
         if(Boot.skip_constructor)
         {
            return;
         }
         super();
      }
      
      public function vapulaSlave() : Boolean
      {
         return get_game().vapula.vapulaSlave();
      }
      
      public function urtaLove(param1:Number = 0) : Boolean
      {
         return get_game().urta.urtaLove(param1);
      }
      
      public function sophieFollower() : Boolean
      {
         return get_game().sophieFollowerScene.sophieFollower();
      }
      
      public function set_changes(param1:int) : int
      {
         return get_mutations().changes = param1;
      }
      
      public function set_changeLimit(param1:int) : int
      {
         return get_mutations().changeLimit = param1;
      }
      
      public function raphaelLikes() : Boolean
      {
         return get_game().raphael.raphaelLikes();
      }
      
      public function nieveFollower() : Boolean
      {
         return get_nieve().nieveFollower();
      }
      
      public function nephilaCovenIsFollower() : Boolean
      {
         return get_game().nephilaCovenFollowerScene.nephilaCovenIsFollower();
      }
      
      public function milkSlave() : Boolean
      {
         return get_game().milkWaifu.milkSlave();
      }
      
      public function marbleFollower() : Boolean
      {
         return get_game().marbleScene.marbleFollower();
      }
      
      public function latexGooFollower() : Boolean
      {
         return get_game().latexGirl.latexGooFollower();
      }
      
      public function jojoFollower() : Boolean
      {
         return get_game().jojoScene.jojoFollower();
      }
      
      public function izmaFollower() : Boolean
      {
         return get_game().izmaScene.izmaFollower();
      }
      
      public function isabellaFollower() : Boolean
      {
         return get_game().isabellaFollowerScene.isabellaFollower();
      }
      
      public function isabellaAccent() : Boolean
      {
         return get_game().isabellaFollowerScene.isabellaAccent();
      }
      
      public function helspawnFollower() : Boolean
      {
         return get_game().helSpawnScene.helspawnFollower();
      }
      
      public function helPregnant() : Boolean
      {
         return get_game().helSpawnScene.helPregnant();
      }
      
      public function get_vapula() : Vapula
      {
         return get_game().vapula;
      }
      
      public function get_valeria() : Valeria
      {
         return get_game().valeria;
      }
      
      public function get_urtaPregs() : UrtaPregs
      {
         return get_game().urtaPregs;
      }
      
      public function get_urtaHeatRut() : UrtaHeatRut
      {
         return get_game().urtaHeatRut;
      }
      
      public function get_urta() : UrtaScene
      {
         return get_game().urta;
      }
      
      public function get_telAdre() : TelAdre
      {
         return get_game().telAdre;
      }
      
      public function get_sylviaScene() : SylviaScene
      {
         return get_game().sylviaScene;
      }
      
      public function get_sophieScene() : SophieScene
      {
         return get_game().sophieScene;
      }
      
      public function get_sophieFollowerScene() : SophieFollowerScene
      {
         return get_game().sophieFollowerScene;
      }
      
      public function get_sophieBimbo() : SophieBimbo
      {
         return get_game().sophieBimbo;
      }
      
      public function get_shouldraScene() : ShouldraScene
      {
         return get_game().shouldraScene;
      }
      
      public function get_shouldraFollower() : ShouldraFollower
      {
         return get_game().shouldraFollower;
      }
      
      public function get_sheilaScene() : SheilaScene
      {
         return get_game().sheilaScene;
      }
      
      public function get_rathazul() : Rathazul
      {
         return get_game().rathazul;
      }
      
      public function get_raphael() : Raphael
      {
         return get_game().raphael;
      }
      
      public function get_nieve() : Nieve
      {
         return get_game().xmas.nieve;
      }
      
      public function get_nephilaCovenScene() : NephilaCovenScene
      {
         return get_game().nephilaCovenScene;
      }
      
      public function get_nephilaCovenFollowerScene() : NephilaCovenFollowerScene
      {
         return get_game().nephilaCovenFollowerScene;
      }
      
      public function get_milkWaifu() : MilkWaifu
      {
         return get_game().milkWaifu;
      }
      
      public function get_marbleScene() : MarbleScene
      {
         return get_game().marbleScene;
      }
      
      public function get_marblePurification() : MarblePurification
      {
         return get_game().marblePurification;
      }
      
      public function get_latexGirl() : LatexGirl
      {
         return get_game().latexGirl;
      }
      
      public function get_kihaScene() : KihaScene
      {
         return get_game().kihaScene;
      }
      
      public function get_kihaFollowerScene() : KihaFollowerScene
      {
         return get_game().kihaFollowerScene;
      }
      
      public function get_jojoScene() : JojoScene
      {
         return get_game().jojoScene;
      }
      
      public function get_izmaScene() : IzmaScene
      {
         return get_game().izmaScene;
      }
      
      public function get_isabellaScene() : IsabellaScene
      {
         return get_game().isabellaScene;
      }
      
      public function get_isabellaFollowerScene() : IsabellaFollowerScene
      {
         return get_game().isabellaFollowerScene;
      }
      
      public function get_holliScene() : HolliScene
      {
         return get_game().holliScene;
      }
      
      public function get_helSpawnScene() : HelSpawnScene
      {
         return get_game().helSpawnScene;
      }
      
      public function get_helScene() : HelScene
      {
         return get_game().helScene;
      }
      
      public function get_helFollower() : HelFollower
      {
         return get_game().helFollower;
      }
      
      public function get_finter() : FollowerInteractions
      {
         return get_game().followerInteractions;
      }
      
      public function get_exgartuan() : Exgartuan
      {
         return get_game().exgartuan;
      }
      
      public function get_emberScene() : EmberScene
      {
         return get_game().emberScene;
      }
      
      public function get_changes() : int
      {
         return get_mutations().changes;
      }
      
      public function get_changeLimit() : int
      {
         return get_mutations().changeLimit;
      }
      
      public function get_ceraphScene() : CeraphScene
      {
         return get_game().ceraphScene;
      }
      
      public function get_ceraphFollowerScene() : CeraphFollowerScene
      {
         return get_game().ceraphFollowerScene;
      }
      
      public function get_arianScene() : ArianScene
      {
         return get_game().arianScene;
      }
      
      public function get_anemoneScene() : AnemoneScene
      {
         return get_game().anemoneScene;
      }
      
      public function get_amilyScene() : AmilyScene
      {
         return get_game().amilyScene;
      }
      
      public function get_akky() : Akky
      {
         return get_game().akky;
      }
      
      public function followerShouldra() : Boolean
      {
         return get_game().shouldraFollower.followerShouldra();
      }
      
      public function followerRathazul() : Boolean
      {
         return get_game().rathazul.followerRathazul();
      }
      
      public function followerKiha() : Boolean
      {
         return get_game().kihaFollowerScene.followerKiha();
      }
      
      public function followerHel() : Boolean
      {
         return get_game().helScene.followerHel();
      }
      
      public function followerEmber() : Boolean
      {
         return get_game().emberScene.followerEmber();
      }
      
      public function emberMF(param1:String, param2:String) : String
      {
         return get_game().emberScene.emberMF(param1,param2);
      }
      
      public function ceraphIsFollower() : Boolean
      {
         return get_game().ceraphFollowerScene.ceraphIsFollower();
      }
      
      public function campCorruptJojo() : Boolean
      {
         return get_game().jojoScene.campCorruptJojo();
      }
      
      public function bimboSophie() : Boolean
      {
         return get_game().sophieBimbo.bimboSophie();
      }
      
      public function arianFollower() : Boolean
      {
         return get_game().arianScene.arianFollower();
      }
      
      public function anemoneFollower() : Boolean
      {
         return get_game().anemoneScene.anemoneFollower();
      }
      
      public function amilyFollower() : Boolean
      {
         return get_game().amilyScene.amilyFollower();
      }
      
      public function amilyCorrupt() : Boolean
      {
         return get_game().amilyScene.amilyCorrupt();
      }
      
      public function akkyOwned() : Boolean
      {
         return get_game().akky.get_akky().isOwned();
      }
   }
}

