package classes.display
{
   import classes.globalFlags.KGAMECLASS;
   
   public class SpriteDb
   {
      
      public function SpriteDb()
      {
      }
      
      public static function get_is8bit() : Boolean
      {
         return KGAMECLASS.kGAMECLASS.get_oldSprites();
      }
      
      public static function get_s_akky() : Class
      {
         return S_akky16;
      }
      
      public static function get_s_akbal() : Class
      {
         if(SpriteDb.get_is8bit())
         {
            return S_akbal_8bit;
         }
         return S_akbal_16bit;
      }
      
      public static function get_s_alice() : Class
      {
         if(SpriteDb.get_is8bit())
         {
            return null;
         }
         return S_alice_16bit;
      }
      
      public static function get_s_alice_demon() : Class
      {
         if(SpriteDb.get_is8bit())
         {
            return null;
         }
         return S_alice_demon_16bit;
      }
      
      public static function get_s_alice_demon_nude() : Class
      {
         if(SpriteDb.get_is8bit())
         {
            return null;
         }
         return S_alice_demon_nude_16bit;
      }
      
      public static function get_s_alraune() : Class
      {
         if(SpriteDb.get_is8bit())
         {
            return S_alraune_8bit;
         }
         return S_alraune_16bit;
      }
      
      public static function get_s_amarok() : Class
      {
         if(SpriteDb.get_is8bit())
         {
            return S_amarok_8bit;
         }
         return S_amarok_16bit;
      }
      
      public static function get_s_amily() : Class
      {
         if(SpriteDb.get_is8bit())
         {
            return S_amily_8bit;
         }
         return S_amily_16bit;
      }
      
      public static function get_s_amily_nude() : Class
      {
         if(SpriteDb.get_is8bit())
         {
            return S_amily_8bit;
         }
         return S_amily_nude_16bit;
      }
      
      public static function get_s_amily_defurred() : Class
      {
         if(SpriteDb.get_is8bit())
         {
            return S_amily_defurr_8bit;
         }
         return S_amily_defurr_16bit;
      }
      
      public static function get_s_amily_defurr_nude() : Class
      {
         if(SpriteDb.get_is8bit())
         {
            return S_amily_defurr_8bit;
         }
         return S_amily_defurr_nude_16bit;
      }
      
      public static function get_s_anemone() : Class
      {
         if(SpriteDb.get_is8bit())
         {
            return S_anemone_8bit;
         }
         return S_anemone_16bit;
      }
      
      public static function get_s_antguards() : Class
      {
         if(SpriteDb.get_is8bit())
         {
            return null;
         }
         return S_antguards_16bit;
      }
      
      public static function get_s_arian() : Class
      {
         if(SpriteDb.get_is8bit())
         {
            return S_arian_8bit;
         }
         return S_arian_16bit;
      }
      
      public static function get_s_arianFemale() : Class
      {
         if(SpriteDb.get_is8bit())
         {
            return null;
         }
         return S_arianFemale_16bit;
      }
      
      public static function get_s_arianFemaleNofur() : Class
      {
         if(SpriteDb.get_is8bit())
         {
            return null;
         }
         return S_arianFemaleNofur_16bit;
      }
      
      public static function get_s_arianNofur() : Class
      {
         if(SpriteDb.get_is8bit())
         {
            return null;
         }
         return S_arianNofur_16bit;
      }
      
      public static function get_s_auntNancy() : Class
      {
         if(SpriteDb.get_is8bit())
         {
            return null;
         }
         return S_auntNancy_16bit;
      }
      
      public static function get_s_basilisk() : Class
      {
         if(SpriteDb.get_is8bit())
         {
            return S_basilisk_8bit;
         }
         return S_basilisk_16bit;
      }
      
      public static function get_s_bee_girl() : Class
      {
         if(SpriteDb.get_is8bit())
         {
            return S_bee_girl_8bit;
         }
         return S_bee_girl_16bit;
      }
      
      public static function get_s_benoit() : Class
      {
         if(SpriteDb.get_is8bit())
         {
            return null;
         }
         return S_benoit_16bit;
      }
      
      public static function get_s_benoitSilly() : Class
      {
         if(SpriteDb.get_is8bit())
         {
            return null;
         }
         return S_benoitSilly_16bit;
      }
      
      public static function get_s_brooke() : Class
      {
         if(SpriteDb.get_is8bit())
         {
            return null;
         }
         return S_brooke_16bit;
      }
      
      public static function get_s_brigid() : Class
      {
         if(SpriteDb.get_is8bit())
         {
            return null;
         }
         return S_brigid_16;
      }
      
      public static function get_s_brooke_nude() : Class
      {
         if(SpriteDb.get_is8bit())
         {
            return null;
         }
         return S_brooke_nude_16bit;
      }
      
      public static function get_s_callu() : Class
      {
         if(SpriteDb.get_is8bit())
         {
            return null;
         }
         return S_callu_16bit;
      }
      
      public static function get_s_calluNofur() : Class
      {
         if(SpriteDb.get_is8bit())
         {
            return null;
         }
         return S_calluNofur_16bit;
      }
      
      public static function get_s_carpenter() : Class
      {
         if(SpriteDb.get_is8bit())
         {
            return null;
         }
         return S_carpenter_16bit;
      }
      
      public static function get_s_ceraph() : Class
      {
         if(SpriteDb.get_is8bit())
         {
            return S_ceraph_8bit;
         }
         return S_ceraph_16bit;
      }
      
      public static function get_s_ceraphClothed() : Class
      {
         if(SpriteDb.get_is8bit())
         {
            return S_ceraph_8bit;
         }
         return S_ceraphClothed_16bit;
      }
      
      public static function get_s_ceraphGoblin() : Class
      {
         if(SpriteDb.get_is8bit())
         {
            return S_goblin_8bit;
         }
         return S_ceraphGoblin_16bit;
      }
      
      public static function get_s_ceraphNudeFemale() : Class
      {
         if(SpriteDb.get_is8bit())
         {
            return null;
         }
         return S_ceraphNudeFemale_16bit;
      }
      
      public static function get_s_cerulean_succubus() : Class
      {
         if(SpriteDb.get_is8bit())
         {
            return S_cerulean_succubus_8bit;
         }
         return S_cerulean_succubus_16bit;
      }
      
      public static function get_s_chameleon() : Class
      {
         if(SpriteDb.get_is8bit())
         {
            return null;
         }
         return S_chameleon_16bit;
      }
      
      public static function get_s_chickenHarpy() : Class
      {
         if(SpriteDb.get_is8bit())
         {
            return null;
         }
         return S_chickenHarpy_16bit;
      }
      
      public static function get_s_chillySmith() : Class
      {
         if(SpriteDb.get_is8bit())
         {
            return S_chillySmith_8bit;
         }
         return S_chillySmith_16bit;
      }
      
      public static function get_s_christmas_elf() : Class
      {
         if(SpriteDb.get_is8bit())
         {
            return S_christmas_elf_8bit;
         }
         return S_christmas_elf_16bit;
      }
      
      public static function get_s_cinnabar() : Class
      {
         if(SpriteDb.get_is8bit())
         {
            return null;
         }
         return S_cinnabar_16bit;
      }
      
      public static function get_s_circe() : Class
      {
         if(SpriteDb.get_is8bit())
         {
            return null;
         }
         return S_circe_16;
      }
      
      public static function get_s_clara() : Class
      {
         if(SpriteDb.get_is8bit())
         {
            return null;
         }
         return S_clara_16bit;
      }
      
      public static function get_s_cloaked_dominika() : Class
      {
         if(SpriteDb.get_is8bit())
         {
            return S_cloaked_dominika_8bit;
         }
         return S_cloaked_dominika_16bit;
      }
      
      public static function get_s_club_gnoll() : Class
      {
         if(SpriteDb.get_is8bit())
         {
            return S_club_gnoll_8bit;
         }
         return S_club_gnoll_16bit;
      }
      
      public static function get_s_corruptedGlade() : Class
      {
         if(SpriteDb.get_is8bit())
         {
            return null;
         }
         return S_corruptedGlade_16bit;
      }
      
      public static function get_corrwitchsprite() : Class
      {
         if(SpriteDb.get_is8bit())
         {
            return null;
         }
         return S_corrwitchsprite_16bit;
      }
      
      public static function get_s_cotton() : Class
      {
         if(SpriteDb.get_is8bit())
         {
            return S_cotton_8bit;
         }
         return S_cotton_16bit;
      }
      
      public static function get_s_cumWitch() : Class
      {
         if(SpriteDb.get_is8bit())
         {
            return S_cumwitch_8bit;
         }
         return S_cumwitch_16bit;
      }
      
      public static function get_s_dickworms() : Class
      {
         if(SpriteDb.get_is8bit())
         {
            return S_dickworms_8bit;
         }
         return S_dickworms_16bit;
      }
      
      public static function get_s_drider() : Class
      {
         if(SpriteDb.get_is8bit())
         {
            return S_drider_8bit;
         }
         return S_drider_16bit;
      }
      
      public static function get_dullsprite() : Class
      {
         if(SpriteDb.get_is8bit())
         {
            return null;
         }
         return S_dullsprite_16bit;
      }
      
      public static function get_s_easter_bunneh() : Class
      {
         if(SpriteDb.get_is8bit())
         {
            return S_easter_bunneh_8bit;
         }
         return S_easter_bunneh_16bit;
      }
      
      public static function get_s_edryn() : Class
      {
         if(SpriteDb.get_is8bit())
         {
            return S_edryn_8bit;
         }
         return S_edryn_16bit;
      }
      
      public static function get_s_edryn_preg() : Class
      {
         if(SpriteDb.get_is8bit())
         {
            return S_edryn_8bit;
         }
         return S_edryn_preg_16bit;
      }
      
      public static function get_s_ember() : Class
      {
         if(SpriteDb.get_is8bit())
         {
            return S_ember_8bit;
         }
         return S_ember_16bit;
      }
      
      public static function get_s_essrayle() : Class
      {
         if(SpriteDb.get_is8bit())
         {
            return null;
         }
         return S_essrayle_16;
      }
      
      public static function get_s_evelyn() : Class
      {
         if(SpriteDb.get_is8bit())
         {
            return null;
         }
         return S_evelyn_16;
      }
      
      public static function get_s_exgartuan() : Class
      {
         if(SpriteDb.get_is8bit())
         {
            return S_exgartuan_8bit;
         }
         return S_exgartuan_16bit;
      }
      
      public static function get_s_factory_omnibus() : Class
      {
         if(SpriteDb.get_is8bit())
         {
            return S_factory_omnibus_8bit;
         }
         return S_factory_omnibus_16bit;
      }
      
      public static function get_s_faerie() : Class
      {
         if(SpriteDb.get_is8bit())
         {
            return S_faerie_8bit;
         }
         return S_faerie_16bit;
      }
      
      public static function get_s_fenimp() : Class
      {
         if(SpriteDb.get_is8bit())
         {
            return S_fenimp_8bit;
         }
         return S_fenimp_16bit;
      }
      
      public static function get_s_fetish_cultist() : Class
      {
         if(SpriteDb.get_is8bit())
         {
            return S_fetish_cultist_8bit;
         }
         return S_fetish_cultist_16bit;
      }
      
      public static function get_s_fetish_zealot() : Class
      {
         if(SpriteDb.get_is8bit())
         {
            return S_fetish_zealot_8bit;
         }
         return S_fetish_zealot_16bit;
      }
      
      public static function get_s_ghostGirl() : Class
      {
         return S_ghostGirl_8bit;
      }
      
      public static function get_s_ghostGirl2() : Class
      {
         return S_ghostGirl2_8bit;
      }
      
      public static function get_s_gargoyle() : Class
      {
         if(SpriteDb.get_is8bit())
         {
            return null;
         }
         return S_gargoyle_16bit;
      }
      
      public static function get_s_gargoyleLoli() : Class
      {
         if(SpriteDb.get_is8bit())
         {
            return null;
         }
         return S_gargoyleLoli_16bit;
      }
      
      public static function get_s_ghoul() : Class
      {
         if(SpriteDb.get_is8bit())
         {
            return null;
         }
         return S_ghoul_16bit;
      }
      
      public static function get_s_giacomo() : Class
      {
         if(SpriteDb.get_is8bit())
         {
            return S_giacomo_8bit;
         }
         return S_giacomo_16bit;
      }
      
      public static function get_s_goblin() : Class
      {
         if(SpriteDb.get_is8bit())
         {
            return S_goblin_8bit;
         }
         return S_goblin_16bit;
      }
      
      public static function get_goblinSharpshooter() : Class
      {
         if(SpriteDb.get_is8bit())
         {
            return null;
         }
         return S_goblinSharp_16bit;
      }
      
      public static function get_s_greta() : Class
      {
         if(SpriteDb.get_is8bit())
         {
            return null;
         }
         return S_greta_16;
      }
      
      public static function get_s_priscilla() : Class
      {
         if(SpriteDb.get_is8bit())
         {
            return S_priscilla_8bit;
         }
         return S_priscilla_16bit;
      }
      
      public static function get_s_goblinShaman() : Class
      {
         if(SpriteDb.get_is8bit())
         {
            return S_goblinShaman_8bit;
         }
         return S_goblinShaman_16bit;
      }
      
      public static function get_s_goblinWarrior() : Class
      {
         if(SpriteDb.get_is8bit())
         {
            return S_goblinWarrior_8bit;
         }
         return S_goblinWarrior_16bit;
      }
      
      public static function get_s_googirlsprite() : Class
      {
         if(SpriteDb.get_is8bit())
         {
            return S_googirlsprite_8bit;
         }
         return S_googirlsprite_16bit;
      }
      
      public static function get_s_green_slime() : Class
      {
         if(SpriteDb.get_is8bit())
         {
            return S_green_slime_8bit;
         }
         return S_green_slime_16bit;
      }
      
      public static function get_s_harpy() : Class
      {
         if(SpriteDb.get_is8bit())
         {
            return S_harpy_8bit;
         }
         return S_harpy_16bit;
      }
      
      public static function get_s_harpyhorde() : Class
      {
         if(SpriteDb.get_is8bit())
         {
            return null;
         }
         return S_harpy_horde;
      }
      
      public static function get_s_heckel() : Class
      {
         if(SpriteDb.get_is8bit())
         {
            return S_club_gnoll_8bit;
         }
         return S_heckel_16bit;
      }
      
      public static function get_s_heckel_nude() : Class
      {
         if(SpriteDb.get_is8bit())
         {
            return S_club_gnoll_8bit;
         }
         return S_heckel_nude_16bit;
      }
      
      public static function get_s_hel_sprite() : Class
      {
         if(SpriteDb.get_is8bit())
         {
            return S_hel_sprite_8bit;
         }
         return S_hel_sprite_16bit;
      }
      
      public static function get_s_hel_sprite_BB() : Class
      {
         if(SpriteDb.get_is8bit())
         {
            return S_hel_sprite_BB_8bit;
         }
         return S_hel_sprite_BB_16bit;
      }
      
      public static function get_s_hel_sprite_PF() : Class
      {
         if(SpriteDb.get_is8bit())
         {
            return S_hel_sprite_PF_8bit;
         }
         return S_hel_sprite_PF_16bit;
      }
      
      public static function get_s_hel_sprite_BB_PF() : Class
      {
         if(SpriteDb.get_is8bit())
         {
            return S_hel_sprite_BB_PF_8bit;
         }
         return S_hel_sprite_BB_PF_16bit;
      }
      
      public static function get_s_hellhound() : Class
      {
         if(SpriteDb.get_is8bit())
         {
            return S_hellhound_8bit;
         }
         return S_hellhound_16bit;
      }
      
      public static function get_s_hellmouth() : Class
      {
         if(SpriteDb.get_is8bit())
         {
            return S_hellmouth_8bit;
         }
         return S_hellmouth_16bit;
      }
      
      public static function get_s_holli() : Class
      {
         if(SpriteDb.get_is8bit())
         {
            return null;
         }
         return S_holli_16bit;
      }
      
      public static function get_s_holliSapling() : Class
      {
         if(SpriteDb.get_is8bit())
         {
            return null;
         }
         return S_holliSapling_16bit;
      }
      
      public static function get_s_holliFlower() : Class
      {
         if(SpriteDb.get_is8bit())
         {
            return null;
         }
         return S_holliFlower_16bit;
      }
      
      public static function get_s_holliTree() : Class
      {
         if(SpriteDb.get_is8bit())
         {
            return null;
         }
         return S_holliTree_16bit;
      }
      
      public static function get_s_ifris() : Class
      {
         if(SpriteDb.get_is8bit())
         {
            return S_ifris_8bit;
         }
         return S_ifris_16bit;
      }
      
      public static function get_s_imp() : Class
      {
         if(SpriteDb.get_is8bit())
         {
            return S_imp_8bit;
         }
         return S_imp_16bit;
      }
      
      public static function get_s_impMob() : Class
      {
         if(SpriteDb.get_is8bit())
         {
            return S_imp_8bit;
         }
         return S_impMob_16bit;
      }
      
      public static function get_s_impOverlord() : Class
      {
         if(SpriteDb.get_is8bit())
         {
            return S_impOverlord_8bit;
         }
         return S_impOverlord_16bit;
      }
      
      public static function get_s_impWarlord() : Class
      {
         if(SpriteDb.get_is8bit())
         {
            return S_impWarlord_8bit;
         }
         return S_impWarlord_16bit;
      }
      
      public static function get_s_incubus_mechanic() : Class
      {
         if(SpriteDb.get_is8bit())
         {
            return S_incubus_mechanic_8bit;
         }
         return S_incubus_mechanic_16bit;
      }
      
      public static function get_s_isabella() : Class
      {
         if(SpriteDb.get_is8bit())
         {
            return S_isabella_8bit;
         }
         return S_isabella_16bit;
      }
      
      public static function get_s_ivory_succubus() : Class
      {
         if(SpriteDb.get_is8bit())
         {
            return null;
         }
         return S_ivory_succubus_16bit;
      }
      
      public static function get_s_izma() : Class
      {
         if(SpriteDb.get_is8bit())
         {
            return S_izma_8bit;
         }
         return S_izma_16bit;
      }
      
      public static function get_s_izumi() : Class
      {
         if(SpriteDb.get_is8bit())
         {
            return null;
         }
         return S_izumi_16bit;
      }
      
      public static function get_s_izumiNude() : Class
      {
         if(SpriteDb.get_is8bit())
         {
            return null;
         }
         return S_izumiNude_16bit;
      }
      
      public static function get_s_jasun() : Class
      {
         if(SpriteDb.get_is8bit())
         {
            return S_jasun_8bit;
         }
         return S_jasun_16bit;
      }
      
      public static function get_s_jojo() : Class
      {
         if(SpriteDb.get_is8bit())
         {
            return S_jojo_8bit;
         }
         return S_jojo_16bit;
      }
      
      public static function get_s_jojoTentacle() : Class
      {
         if(SpriteDb.get_is8bit())
         {
            return S_jojo_8bit;
         }
         return S_jojoTentacle_16bit;
      }
      
      public static function get_s_joy() : Class
      {
         if(SpriteDb.get_is8bit())
         {
            return S_jojo_8bit;
         }
         return S_joy_16bit;
      }
      
      public static function get_s_katherine_vagrant() : Class
      {
         if(SpriteDb.get_is8bit())
         {
            return null;
         }
         return S_katherine_vagrant_16bit;
      }
      
      public static function get_s_kelly() : Class
      {
         if(SpriteDb.get_is8bit())
         {
            return S_edryn_8bit;
         }
         return S_kelly_16bit;
      }
      
      public static function get_s_kelly_brst() : Class
      {
         if(SpriteDb.get_is8bit())
         {
            return S_edryn_8bit;
         }
         return S_kelly_brst_16bit;
      }
      
      public static function get_s_kelly_brst_preg() : Class
      {
         if(SpriteDb.get_is8bit())
         {
            return S_edryn_8bit;
         }
         return S_kelly_brst_preg_16bit;
      }
      
      public static function get_s_kelly_preg() : Class
      {
         if(SpriteDb.get_is8bit())
         {
            return S_edryn_8bit;
         }
         return S_kelly_preg_16bit;
      }
      
      public static function get_s_kelt() : Class
      {
         if(SpriteDb.get_is8bit())
         {
            return S_kelt_8bit;
         }
         return S_kelt_16bit;
      }
      
      public static function get_s_kida() : Class
      {
         if(SpriteDb.get_is8bit())
         {
            return S_kida_8bit;
         }
         return null;
      }
      
      public static function get_s_kiha() : Class
      {
         if(SpriteDb.get_is8bit())
         {
            return S_kiha_8bit;
         }
         return S_kiha_16bit;
      }
      
      public static function get_s_kiha_nude() : Class
      {
         if(SpriteDb.get_is8bit())
         {
            return S_kiha_8bit;
         }
         return S_kiha_nude_16bit;
      }
      
      public static function get_s_kiha_nude_preg() : Class
      {
         if(SpriteDb.get_is8bit())
         {
            return S_kiha_8bit;
         }
         return S_kiha_nude_preg_16bit;
      }
      
      public static function get_s_kiha_preg() : Class
      {
         if(SpriteDb.get_is8bit())
         {
            return S_kiha_8bit;
         }
         return S_kiha_preg_16bit;
      }
      
      public static function get_s_kitsune_black() : Class
      {
         if(SpriteDb.get_is8bit())
         {
            return S_kitsune_black_8bit;
         }
         return S_kitsune_black_16bit;
      }
      
      public static function get_s_kitsune_blonde() : Class
      {
         if(SpriteDb.get_is8bit())
         {
            return S_kitsune_blonde_8bit;
         }
         return S_kitsune_blonde_16bit;
      }
      
      public static function get_s_kitsune_red() : Class
      {
         if(SpriteDb.get_is8bit())
         {
            return S_kitsune_red_8bit;
         }
         return S_kitsune_red_16bit;
      }
      
      public static function get_s_latexgoogirl() : Class
      {
         if(SpriteDb.get_is8bit())
         {
            return null;
         }
         return S_latexgoogirl_16bit;
      }
      
      public static function get_s_lilium() : Class
      {
         if(SpriteDb.get_is8bit())
         {
            return null;
         }
         return S_lilium_16bit;
      }
      
      public static function get_s_lottie() : Class
      {
         if(SpriteDb.get_is8bit())
         {
            return S_lottie_8bit;
         }
         return S_lottie_16bit;
      }
      
      public static function get_s_loppe() : Class
      {
         if(SpriteDb.get_is8bit())
         {
            return null;
         }
         return S_loppe_16;
      }
      
      public static function get_s_lumi() : Class
      {
         if(SpriteDb.get_is8bit())
         {
            return S_lumi_8bit;
         }
         return S_lumi_16bit;
      }
      
      public static function get_s_lynette() : Class
      {
         if(SpriteDb.get_is8bit())
         {
            return S_lynette_8bit;
         }
         return S_lynette_16bit;
      }
      
      public static function get_s_maddie() : Class
      {
         if(SpriteDb.get_is8bit())
         {
            return S_maddie_8bit;
         }
         return S_maddie_16bit;
      }
      
      public static function get_s_marae() : Class
      {
         if(SpriteDb.get_is8bit())
         {
            return S_marae_8bit;
         }
         return S_marae_16bit;
      }
      
      public static function get_s_marble() : Class
      {
         if(SpriteDb.get_is8bit())
         {
            return S_marble_8bit;
         }
         return S_marble_16bit;
      }
      
      public static function get_s_marble_cow() : Class
      {
         if(SpriteDb.get_is8bit())
         {
            return S_marble_8bit;
         }
         return S_marble_cow_16bit;
      }
      
      public static function get_s_markus_and_lucia() : Class
      {
         if(SpriteDb.get_is8bit())
         {
            return S_markus_and_lucia_8bit;
         }
         return S_markus_and_lucia_16bit;
      }
      
      public static function get_s_melinda() : Class
      {
         return S_melinda_8bit;
      }
      
      public static function get_s_milkgirl() : Class
      {
         if(SpriteDb.get_is8bit())
         {
            return null;
         }
         return S_milkgirl_16bit;
      }
      
      public static function get_s_minerva() : Class
      {
         if(SpriteDb.get_is8bit())
         {
            return S_minerva_8bit;
         }
         return S_minerva_16bit;
      }
      
      public static function get_s_minerva_corrupt() : Class
      {
         if(SpriteDb.get_is8bit())
         {
            return S_minerva_corrupt_8bit;
         }
         return S_minerva_corrupt_16bit;
      }
      
      public static function get_s_minerva_pure() : Class
      {
         if(SpriteDb.get_is8bit())
         {
            return S_minerva_pure_8bit;
         }
         return S_minerva_pure_16bit;
      }
      
      public static function get_s_minotaur() : Class
      {
         if(SpriteDb.get_is8bit())
         {
            return S_minotaur_8bit;
         }
         return S_minotaur_16bit;
      }
      
      public static function get_s_minotaurSons() : Class
      {
         if(SpriteDb.get_is8bit())
         {
            return S_minotaur_8bit;
         }
         return S_minotaurSons_16bit;
      }
      
      public static function get_s_mrsCoffee() : Class
      {
         if(SpriteDb.get_is8bit())
         {
            return null;
         }
         return S_mrsCoffee_16bit;
      }
      
      public static function get_s_naga() : Class
      {
         if(SpriteDb.get_is8bit())
         {
            return S_naga_8bit;
         }
         return S_naga_16bit;
      }
      
      public static function get_s_niamh() : Class
      {
         if(SpriteDb.get_is8bit())
         {
            return null;
         }
         return S_niamh_16bit;
      }
      
      public static function get_s_niamhFull() : Class
      {
         if(SpriteDb.get_is8bit())
         {
            return null;
         }
         return S_niamhFull_16bit;
      }
      
      public static function get_s_oasis_demons() : Class
      {
         if(SpriteDb.get_is8bit())
         {
            return S_oasis_demons_8bit;
         }
         return S_oasis_demons_16bit;
      }
      
      public static function get_s_oswald() : Class
      {
         if(SpriteDb.get_is8bit())
         {
            return S_oswald_8bit;
         }
         return S_oswald_16bit;
      }
      
      public static function get_s_pablo() : Class
      {
         if(SpriteDb.get_is8bit())
         {
            return S_imp_8bit;
         }
         return S_pablo_16bit;
      }
      
      public static function get_s_pablo_nude() : Class
      {
         if(SpriteDb.get_is8bit())
         {
            return S_imp_8bit;
         }
         return S_pablo_nude_16bit;
      }
      
      public static function get_s_phoenix() : Class
      {
         if(SpriteDb.get_is8bit())
         {
            return null;
         }
         return S_phoenix_16bit;
      }
      
      public static function get_s_phoenix_horde() : Class
      {
         if(SpriteDb.get_is8bit())
         {
            return null;
         }
         return S_phoenixHorde_16bit;
      }
      
      public static function get_s_phoenix_nude() : Class
      {
         if(SpriteDb.get_is8bit())
         {
            return null;
         }
         return S_phoenix_nude_16bit;
      }
      
      public static function get_s_phylla() : Class
      {
         if(SpriteDb.get_is8bit())
         {
            return S_phylla_8bit;
         }
         return S_phylla_16bit;
      }
      
      public static function get_s_phylla_nude() : Class
      {
         if(SpriteDb.get_is8bit())
         {
            return S_phylla_8bit;
         }
         return S_phylla_nude_16bit;
      }
      
      public static function get_s_phylla_preg() : Class
      {
         if(SpriteDb.get_is8bit())
         {
            return S_phylla_8bit;
         }
         return S_phylla_preg_16bit;
      }
      
      public static function get_s_queenCalais() : Class
      {
         if(SpriteDb.get_is8bit())
         {
            return null;
         }
         return S_queenCalais16;
      }
      
      public static function get_s_poisontail() : Class
      {
         if(SpriteDb.get_is8bit())
         {
            return S_poisontail_8bit;
         }
         return S_poisontail_16bit;
      }
      
      public static function get_s_raphael() : Class
      {
         if(SpriteDb.get_is8bit())
         {
            return S_raphael_8bit;
         }
         return S_raphael_16bit;
      }
      
      public static function get_s_rathazul() : Class
      {
         if(SpriteDb.get_is8bit())
         {
            return S_rathazul_8bit;
         }
         return S_rathazul_16bit;
      }
      
      public static function get_s_rebecc() : Class
      {
         if(SpriteDb.get_is8bit())
         {
            return null;
         }
         return S_rebecc_16bit;
      }
      
      public static function get_s_rogar() : Class
      {
         if(SpriteDb.get_is8bit())
         {
            return null;
         }
         return S_rogar_16bit;
      }
      
      public static function get_s_rubi_hornless() : Class
      {
         if(SpriteDb.get_is8bit())
         {
            return null;
         }
         return S_rubi_hornless_16bit;
      }
      
      public static function get_s_rubi_horns() : Class
      {
         if(SpriteDb.get_is8bit())
         {
            return null;
         }
         return S_rubi_horns_16bit;
      }
      
      public static function get_s_sandtrap() : Class
      {
         if(SpriteDb.get_is8bit())
         {
            return null;
         }
         return S_sandtrap_16bit;
      }
      
      public static function get_s_sandwich() : Class
      {
         if(SpriteDb.get_is8bit())
         {
            return S_sandwich_8bit;
         }
         return S_sandwich_16bit;
      }
      
      public static function get_s_witchmob() : Class
      {
         if(SpriteDb.get_is8bit())
         {
            return null;
         }
         return S_witchmob_16;
      }
      
      public static function get_s_satyr() : Class
      {
         if(SpriteDb.get_is8bit())
         {
            return null;
         }
         return S_satyr_16bit;
      }
      
      public static function get_s_scylla() : Class
      {
         if(SpriteDb.get_is8bit())
         {
            return S_scylla_8bit;
         }
         return S_scylla_16bit;
      }
      
      public static function get_s_scyllaAndBear() : Class
      {
         if(SpriteDb.get_is8bit())
         {
            return null;
         }
         return S_scyllaAndBear_16bit;
      }
      
      public static function get_s_sean() : Class
      {
         if(SpriteDb.get_is8bit())
         {
            return S_sean_8bit;
         }
         return S_sean_16bit;
      }
      
      public static function get_s_sharkgirl() : Class
      {
         if(SpriteDb.get_is8bit())
         {
            return S_sharkgirl_8bit;
         }
         return S_sharkgirl_16bit;
      }
      
      public static function get_s_sheila() : Class
      {
         if(SpriteDb.get_is8bit())
         {
            return null;
         }
         return S_sheila_16bit;
      }
      
      public static function get_s_sophie() : Class
      {
         if(SpriteDb.get_is8bit())
         {
            return S_sophie_8bit;
         }
         return S_sophie_16bit;
      }
      
      public static function get_s_sophieBimbo() : Class
      {
         if(SpriteDb.get_is8bit())
         {
            return S_sophieBimbo_8bit;
         }
         return S_sophieBimbo_16bit;
      }
      
      public static function get_s_spear_gnoll() : Class
      {
         if(SpriteDb.get_is8bit())
         {
            return S_spear_gnoll_8bit;
         }
         return S_spear_gnoll_16bit;
      }
      
      public static function get_s_spidergirl() : Class
      {
         if(SpriteDb.get_is8bit())
         {
            return S_spidergirl_8bit;
         }
         return S_spidergirl_16bit;
      }
      
      public static function get_s_spiderguy() : Class
      {
         if(SpriteDb.get_is8bit())
         {
            return S_spiderguy_8bit;
         }
         return S_spiderguy_16bit;
      }
      
      public static function get_s_stuckSatyr() : Class
      {
         if(SpriteDb.get_is8bit())
         {
            return null;
         }
         return S_stuckSatyr_16bit;
      }
      
      public static function get_s_succubus_secretary() : Class
      {
         if(SpriteDb.get_is8bit())
         {
            return S_succubus_secretary_8bit;
         }
         return S_succubus_secretary_16bit;
      }
      
      public static function get_s_tamani_s_daughters() : Class
      {
         if(SpriteDb.get_is8bit())
         {
            return S_tamani_s_daughters_8bit;
         }
         return S_tamani_s_daughters_16bit;
      }
      
      public static function get_s_tamani() : Class
      {
         if(SpriteDb.get_is8bit())
         {
            return S_tamani_8bit;
         }
         return S_tamani_16bit;
      }
      
      public static function get_s_tentacleMonster() : Class
      {
         if(SpriteDb.get_is8bit())
         {
            return null;
         }
         return S_tentacleMonster_16bit;
      }
      
      public static function get_s_uncloaked_dominika() : Class
      {
         if(SpriteDb.get_is8bit())
         {
            return S_uncloaked_dominika_8bit;
         }
         return S_uncloaked_dominika_16bit;
      }
      
      public static function get_s_urta() : Class
      {
         if(SpriteDb.get_is8bit())
         {
            return S_urta_8bit;
         }
         return S_urta_16bit;
      }
      
      public static function get_s_urtaDrunk() : Class
      {
         if(SpriteDb.get_is8bit())
         {
            return S_urtaDrunk_8bit;
         }
         return S_urtaDrunk_16bit;
      }
      
      public static function get_s_vagrant_cats() : Class
      {
         if(SpriteDb.get_is8bit())
         {
            return S_vagrant_cats_8bit;
         }
         return S_vagrant_cats_16bit;
      }
      
      public static function get_s_vala() : Class
      {
         if(SpriteDb.get_is8bit())
         {
            return S_vala_8bit;
         }
         return S_vala_16bit;
      }
      
      public static function get_s_valaSlave() : Class
      {
         if(SpriteDb.get_is8bit())
         {
            return S_valaSlave_8bit;
         }
         return S_valaSlave_16bit;
      }
      
      public static function get_s_valeria() : Class
      {
         if(SpriteDb.get_is8bit())
         {
            return S_valeria_8bit;
         }
         return S_valeria_16bit;
      }
      
      public static function get_s_vapula() : Class
      {
         if(SpriteDb.get_is8bit())
         {
            return null;
         }
         return S_vapula_16bit;
      }
      
      public static function get_s_venus() : Class
      {
         if(SpriteDb.get_is8bit())
         {
            return null;
         }
         return S_venus_16bit;
      }
      
      public static function get_s_venus_herm() : Class
      {
         if(SpriteDb.get_is8bit())
         {
            return null;
         }
         return S_venus_herm_16bit;
      }
      
      public static function get_s_victoria() : Class
      {
         if(SpriteDb.get_is8bit())
         {
            return S_victoria_8bit;
         }
         return S_victoria_16bit;
      }
      
      public static function get_s_vilkus() : Class
      {
         return S_vilkusSprt;
      }
      
      public static function get_s_vilkus_sleep() : Class
      {
         return S_vilkussleepSptr;
      }
      
      public static function get_s_vilkus_tf() : Class
      {
         return S_vilkustfsptr;
      }
      
      public static function get_s_whitney() : Class
      {
         if(SpriteDb.get_is8bit())
         {
            return S_whitney_8bit;
         }
         return S_whitney_16bit;
      }
      
      public static function get_s_weaponsmith() : Class
      {
         if(SpriteDb.get_is8bit())
         {
            return S_weaponsmith_8bit;
         }
         return S_weaponsmith_16bit;
      }
      
      public static function get_s_yara() : Class
      {
         if(SpriteDb.get_is8bit())
         {
            return S_yara_8bit;
         }
         return S_yara_16bit;
      }
      
      public static function get_s_yvonne() : Class
      {
         if(SpriteDb.get_is8bit())
         {
            return S_yvonne_8bit;
         }
         return S_yvonne_16bit;
      }
      
      public static function get_s_zetaz_imp() : Class
      {
         if(SpriteDb.get_is8bit())
         {
            return S_imp_8bit;
         }
         return S_zetaz_imp_16bit;
      }
      
      public static function get_s_zetaz() : Class
      {
         if(SpriteDb.get_is8bit())
         {
            return S_impOverlord_8bit;
         }
         return S_zetaz_16bit;
      }
      
      public static function get_s_aiko() : Class
      {
         if(SpriteDb.get_is8bit())
         {
            return S_kitsune_blonde_8bit;
         }
         return S_aiko_16bit;
      }
      
      public static function get_s_yamata() : Class
      {
         if(SpriteDb.get_is8bit())
         {
            return S_kitsune_black_8bit;
         }
         return S_yamata_16bit;
      }
   }
}

