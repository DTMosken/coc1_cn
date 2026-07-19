package classes.scenes.explore
{
   import classes.BaseContent;
   import classes.CoC;
   import classes.Monster;
   import classes.Player;
   import classes.scenes.areas.bog.ChameleonGirl;
   import classes.scenes.areas.desert.CumWitch;
   import classes.scenes.areas.desert.DemonPack;
   import classes.scenes.areas.desert.Ghoul;
   import classes.scenes.areas.desert.Naga;
   import classes.scenes.areas.desert.SandTrap;
   import classes.scenes.areas.desert.SandWitch;
   import classes.scenes.areas.forest.Aiko;
   import classes.scenes.areas.forest.Akbal;
   import classes.scenes.areas.forest.BeeGirl;
   import classes.scenes.areas.forest.Kitsune;
   import classes.scenes.areas.forest.Tamani;
   import classes.scenes.areas.forest.TamanisDaughters;
   import classes.scenes.areas.forest.TentacleBeast;
   import classes.scenes.areas.forest.Yamata;
   import classes.scenes.areas.glacialRift.FrostGiant;
   import classes.scenes.areas.glacialRift.Valkyrie;
   import classes.scenes.areas.glacialRift.Yeti;
   import classes.scenes.areas.highMountains.Basilisk;
   import classes.scenes.areas.highMountains.Harpy;
   import classes.scenes.areas.highMountains.Izumi;
   import classes.scenes.areas.highMountains.Minerva;
   import classes.scenes.areas.highMountains.MinotaurMob;
   import classes.scenes.areas.lake.FetishCultist;
   import classes.scenes.areas.lake.FetishZealot;
   import classes.scenes.areas.lake.GooGirl;
   import classes.scenes.areas.lake.GreenSlime;
   import classes.scenes.areas.mountain.HellHound;
   import classes.scenes.areas.mountain.InfestedHellhound;
   import classes.scenes.areas.mountain.Minotaur;
   import classes.scenes.areas.mountain.WormMass;
   import classes.scenes.areas.plains.Gnoll;
   import classes.scenes.areas.plains.GnollSpearThrower;
   import classes.scenes.areas.plains.Satyr;
   import classes.scenes.areas.swamp.CorruptedDrider;
   import classes.scenes.areas.swamp.FemaleSpiderMorph;
   import classes.scenes.areas.swamp.MaleSpiderMorph;
   import classes.scenes.areas.swamp.SpiderMorphMob;
   import classes.scenes.dungeons.deepCave.EncapsulationPod;
   import classes.scenes.dungeons.deepCave.ImpHorde;
   import classes.scenes.dungeons.deepCave.Vala;
   import classes.scenes.dungeons.deepCave.Zetaz;
   import classes.scenes.dungeons.desertCave.SandMother;
   import classes.scenes.dungeons.desertCave.SandWitchMob;
   import classes.scenes.dungeons.factory.IncubusMechanic;
   import classes.scenes.dungeons.factory.OmnibusOverseer;
   import classes.scenes.dungeons.factory.SecretarialSuccubus;
   import classes.scenes.dungeons.helDungeon.Brigid;
   import classes.scenes.dungeons.helDungeon.HarpyMob;
   import classes.scenes.dungeons.helDungeon.HarpyQueen;
   import classes.scenes.dungeons.helDungeon.PhoenixPlatoon;
   import classes.scenes.dungeons.lethicesKeep.Lethice;
   import classes.scenes.monsters.Goblin;
   import classes.scenes.monsters.GoblinAssassin;
   import classes.scenes.monsters.Imp;
   import classes.scenes.monsters.RandomSuccubus;
   import classes.scenes.npcs.Amily;
   import classes.scenes.npcs.Anemone;
   import classes.scenes.npcs.Ceraph;
   import classes.scenes.npcs.Ember;
   import classes.scenes.npcs.GooArmor;
   import classes.scenes.npcs.Hel;
   import classes.scenes.npcs.Helspawn;
   import classes.scenes.npcs.Holli;
   import classes.scenes.npcs.Isabella;
   import classes.scenes.npcs.Izma;
   import classes.scenes.npcs.Jojo;
   import classes.scenes.npcs.Kiha;
   import classes.scenes.npcs.Marble;
   import classes.scenes.npcs.Sheila;
   import classes.scenes.npcs.Shouldra;
   import classes.scenes.npcs.Sophie;
   import classes.scenes.places.boat.Marae;
   import classes.scenes.places.boat.SharkGirl;
   import classes.scenes.places.farm.Kelt;
   import classes.scenes.places.owca.Farmers;
   import classes.scenes.places.owca.LustyDemons;
   import classes.scenes.quests.urtaQuest.GoblinBroodmother;
   import classes.scenes.quests.urtaQuest.MilkySuccubus;
   import classes.scenes.quests.urtaQuest.MinotaurLord;
   import classes.scenes.quests.urtaQuest.Sirius;
   import flash.Boot;
   
   public class ExploreDebug extends BaseContent
   {
      
      public var allMonsters:Array;
      
      public function ExploreDebug()
      {
         if(Boot.skip_constructor)
         {
            return;
         }
         allMonsters = [function():Monster
         {
            return new Anemone();
         },function():Monster
         {
            return new Basilisk();
         },function():Monster
         {
            return new BeeGirl();
         },function():Monster
         {
            return new ChameleonGirl();
         },function():Monster
         {
            return new CorruptedDrider();
         },function():Monster
         {
            return new CumWitch();
         },function():Monster
         {
            return new DemonPack();
         },function():Monster
         {
            return new FemaleSpiderMorph();
         },function():Monster
         {
            return new FetishCultist();
         },function():Monster
         {
            return new FetishZealot();
         },function():Monster
         {
            return new FrostGiant();
         },function():Monster
         {
            return new Ghoul();
         },function():Monster
         {
            return new Gnoll();
         },function():Monster
         {
            return new GnollSpearThrower();
         },function():Monster
         {
            return new Goblin();
         },function():Monster
         {
            return new GoblinAssassin();
         },function():Monster
         {
            return new GooGirl();
         },function():Monster
         {
            return new GreenSlime();
         },function():Monster
         {
            return new Harpy();
         },function():Monster
         {
            return new HellHound();
         },function():Monster
         {
            return new Imp();
         },function():Monster
         {
            return new ImpHorde("DeepCave");
         },function():Monster
         {
            return new InfestedHellhound();
         },function():Monster
         {
            return new Kitsune("black");
         },function():Monster
         {
            return new Kitsune("blonde");
         },function():Monster
         {
            return new Kitsune("red");
         },function():Monster
         {
            return new MaleSpiderMorph();
         },function():Monster
         {
            return new Minotaur(true);
         },function():Monster
         {
            return new Minotaur(false);
         },function():Monster
         {
            return new MinotaurMob();
         },function():Monster
         {
            return new Naga();
         },function():Monster
         {
            return new RandomSuccubus();
         },function():Monster
         {
            return new SandTrap();
         },function():Monster
         {
            return new SandWitch();
         },function():Monster
         {
            return new Satyr();
         },function():Monster
         {
            return new SharkGirl();
         },function():Monster
         {
            return new TentacleBeast();
         },function():Monster
         {
            return new Valkyrie();
         },function():Monster
         {
            return new WormMass();
         },function():Monster
         {
            return new Yeti();
         },function():Monster
         {
            return new Ghoul();
         },function():Monster
         {
            return new Akbal();
         },function():Monster
         {
            return new Amily();
         },function():Monster
         {
            return new Brigid();
         },function():Monster
         {
            return new Ceraph();
         },function():Monster
         {
            return new GooArmor();
         },function():Monster
         {
            return new Farmers();
         },function():Monster
         {
            return new GoblinBroodmother();
         },function():Monster
         {
            return new HarpyMob();
         },function():Monster
         {
            return new HarpyQueen();
         },function():Monster
         {
            return new Hel();
         },function():Monster
         {
            return new IncubusMechanic();
         },function():Monster
         {
            return new Isabella();
         },function():Monster
         {
            return new Izma();
         },function():Monster
         {
            return new Izumi();
         },function():Monster
         {
            return new Jojo();
         },function():Monster
         {
            return new Kelt();
         },function():Monster
         {
            return new Kiha();
         },function():Monster
         {
            return new Lethice();
         },function():Monster
         {
            return new LustyDemons();
         },function():Monster
         {
            return new Marble();
         },function():Monster
         {
            return new MilkySuccubus();
         },function():Monster
         {
            return new Minerva();
         },function():Monster
         {
            return new MinotaurLord();
         },function():Monster
         {
            return new OmnibusOverseer();
         },function():Monster
         {
            return new PhoenixPlatoon();
         },function():Monster
         {
            return new SandMother();
         },function():Monster
         {
            return new SandWitchMob();
         },function():Monster
         {
            return new SecretarialSuccubus();
         },function():Monster
         {
            return new Shouldra();
         },function():Monster
         {
            return new Sirius();
         },function():Monster
         {
            return new Sophie();
         },function():Monster
         {
            return new SpiderMorphMob();
         },function():Monster
         {
            return new Tamani();
         },function():Monster
         {
            return new TamanisDaughters();
         },function():Monster
         {
            return new Vala();
         },function():Monster
         {
            return new Zetaz();
         },function():Monster
         {
            return new Aiko();
         },function():Monster
         {
            return new Yamata();
         },function():Monster
         {
            return new EncapsulationPod();
         },function():Monster
         {
            return new Sheila();
         },function():Monster
         {
            return new Holli();
         },function():Monster
         {
            return new Helspawn();
         },function():Monster
         {
            return new Marae();
         },function():Monster
         {
            return new Ember();
         }];
         super();
      }
      
      public function exploreDebugMonsters(param1:int = 0) : void
      {
         var monsterIdx2:int;
         var _g2:ExploreDebug;
         var monsterIdx1:int;
         var _g1:ExploreDebug;
         var m1:Monster;
         var _g:ExploreDebug;
         var _gthis:ExploreDebug;
         var monsterIdx:int;
         var _loc2_:* = null as Monster;
         monsterIdx = param1;
         _gthis = this;
         clearOutput();
         menu();
         if(monsterIdx == 0)
         {
            outputText("<b>警告。</b> 你将要与（可能）所有的怪物战斗。战败不会受到惩罚，胜利也不会获得奖励。尽管怪物的胜利和战败事件已被移除，但通过这个调试场景与某些任务怪物/NPC战斗可能会使他们的场景陷入不一致的状态。[pg]");
         }
         if(monsterIdx >= int(allMonsters.length))
         {
            outputText("你已经和所有怪物战斗过了。");
         }
         else
         {
            _loc2_ = allMonsters[monsterIdx]();
            _loc2_.onDefeated = function(param1:Boolean):void
            {
               _gthis.get_game().set_inCombat(false);
               _gthis.get_game().combat.clearStatuses();
               _gthis.statScreenRefresh();
               _gthis.exploreDebugMonsters(monsterIdx + 1);
            };
            _loc2_.onWon = function(param1:Boolean, param2:Boolean = false):void
            {
               _gthis.get_game().set_inCombat(false);
               _gthis.get_game().combat.clearStatuses();
               _gthis.statScreenRefresh();
               _gthis.exploreDebugMonsters(monsterIdx + 1);
            };
            _loc2_.onPcRunAttempt = function():void
            {
               _gthis.get_game().set_inCombat(false);
               _gthis.get_game().combat.clearStatuses();
               _gthis.statScreenRefresh();
               _gthis.exploreDebugMonsters(monsterIdx + 1);
            };
            outputText("你将要与" + _loc2_.get_a() + " " + _loc2_.get_short() + "战斗。");
            _g = this;
            m1 = _loc2_;
            addButton(0,"战斗",function():void
            {
               _g.doFight(m1);
            });
            _g1 = this;
            monsterIdx1 = monsterIdx + 1;
            addButton(1,"跳过",function():void
            {
               _g1.exploreDebugMonsters(monsterIdx1);
            });
            addButton(2,"治疗",doHeal);
         }
         if(monsterIdx > 1)
         {
            _g2 = this;
            monsterIdx2 = monsterIdx - 1;
            addButton(6,"返回",function():void
            {
               _g2.exploreDebugMonsters(monsterIdx2);
            });
         }
         addButton(9,"足够了",playerMenu);
      }
      
      public function doHeal() : void
      {
         get_player().set_HP(get_player().maxHP());
         get_player().set_lust(0);
         statScreenRefresh();
      }
      
      public function doFight(param1:Monster) : void
      {
         outputText("[pg]开始战斗……");
         startCombat(param1);
      }
      
      public function doExploreDebug() : void
      {
         var _g:ExploreDebug;
         clearOutput();
         menu();
         outputText("<b>怪物</b> &nbsp; 与每种怪物战斗。[pg]");
         _g = this;
         addButton(0,"怪物",function():void
         {
            _g.exploreDebugMonsters();
         });
      }
   }
}

