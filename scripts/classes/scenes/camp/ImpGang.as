package classes.scenes.camp
{
   import classes.CoC;
   import classes.Cock;
   import classes.CockTypesEnum;
   import classes.StatusEffects;
   import classes._FlagDict.FlagDict_Impl_;
   import classes.globalFlags.KFLAGS;
   import classes.internals.Utils;
   import classes.scenes.monsters.Imp;
   import flash.Boot;
   import haxe.IMap;
   
   public class ImpGang extends Imp
   {
      
      public function ImpGang()
      {
         if(Boot.skip_constructor)
         {
            return;
         }
         super();
         set_a("");
         set_short("mob of imps");
         imageName = "impMob";
         set_plural(true);
         removeStatuses(false);
         removePerks();
         removeCock(0,int(cocks.length));
         removeVagina(0,int(vaginas.length));
         removeBreastRow(0,int(breastRows.length));
         createBreastRow();
         createCock(12,1.5);
         createCock(25,2.5);
         createCock(25,2.5);
         cocks[2].set_cockType(CockTypesEnum.DOG);
         cocks[2].knotMultiplier = 2;
         balls = 2;
         ballSize = 3;
         set_tallness(36);
         tail.type = 3;
         wings.type = 5;
         skin.tone = "green";
         createStatusEffect(StatusEffects.GenericRunDisabled,0,0,0,0);
         set_long("这些小恶魔身高在两到四英尺之间，骨瘦如柴，长着小巧的恶魔翅膀。它们红色和橙色的皮肤很脏，黑色的头发看起来油腻腻的。有些是光着身子的，但大多数都穿着破烂的遮阴布，几乎遮不住它们的胯部。它们都长着一根像人类手臂一样又长又粗的" + cockDescript(0) + "，对它们的身体来说大得离谱。");
         pronoun1 = "它们";
         pronoun2 = "它们";
         pronoun3 = "their";
         initStrTouSpeInte(70,40,75,42);
         initLibSensCor(55,35,100);
         set_weaponName("claws");
         set_weaponVerb("claws");
         set_weaponAttack(10);
         set_armorName("leathery skin");
         set_armorDef(3);
         bonusHP = 300;
         unitHP = 100;
         unitAmount = 4;
         set_lust(30);
         lustVuln = 0.65;
         temperment = 1;
         level = 10;
         set_gems(Utils.rand(15) + 25);
         set_drop(NO_DROP);
         special1 = lustMagicAttack;
         checkMonster();
      }
      
      override public function won(param1:Boolean, param2:Boolean = false) : void
      {
         get_game().impScene.impGangabangaEXPLOSIONS(true);
      }
      
      override public function performCombatAction() : void
      {
         unitAmount = Math.ceil(get_HP() / 100);
         outputText("\n");
         var _loc1_:Number = 0;
         while(_loc1_ < unitAmount)
         {
            eAttack();
            _loc1_++;
         }
      }
      
      override public function maxHP() : Number
      {
         return unitAmount * 100;
      }
      
      override public function defeated(param1:Boolean) : void
      {
         var _loc2_:IMap = KFLAGS.flags;
         FlagDict_Impl_.arrayWriteInt(_loc2_,2075,FlagDict_Impl_.arrayReadInt(_loc2_,2075) + 1);
         get_game().impScene.impGangGetsWhooped();
      }
   }
}

