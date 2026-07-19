package classes.scenes.areas.glacialRift
{
   import classes.Appearance;
   import classes.CoC;
   import classes.CockTypesEnum;
   import classes.Creature;
   import classes.DynStat;
   import classes.ItemType;
   import classes.Monster;
   import classes.PerkLib;
   import classes.Player;
   import classes.ReactionContext;
   import classes.StatusEffect;
   import classes.StatusEffects;
   import classes.internals.MonsterAI;
   import classes.internals.Utils;
   import classes.internals.WeightedChoice;
   import classes.items.ConsumableLib;
   import classes.scenes.combat.AvoidDamageParameters;
   import classes.scenes.combat.CombatRange;
   import classes.statusEffects.combat.GiantStrLossDebuff;
   import flash.Boot;
   
   public class FrostGiant extends Monster
   {
      
      public function FrostGiant()
      {
         if(Boot.skip_constructor)
         {
            return;
         }
         super();
         set_a("");
         set_short("frost giant");
         imageName = "frost-giant";
         set_long("这个巨人让你想起了小时候在英格纳姆听过的故事，他至少有二十英尺高，宽度比你的身高还要宽。巨人的皮肤是深邃的冰蓝色，身上覆盖着冰霜，代替了盔甲。对你来说幸运的是，他没有武器。不幸的是，像房子一样大的体型有一个额外的好处，那就是巨石、树木和成把的冻土都可以成为现成的武器，而这些在这个地区都很丰富。而且那双手可能像捏死一只虫子一样捏碎你。你的战斗本能绝对会受到考验。");
         set_race("Giant");
         createCock(36,4,CockTypesEnum.HUMAN);
         balls = 2;
         ballSize = 2;
         cumMultiplier = 2;
         createBreastRow(Appearance.breastCupInverse("flat"));
         ass.analLooseness = 1;
         ass.analWetness = 1;
         set_tallness(240);
         hips.rating = 0;
         butt.rating = 2;
         skin.tone = "deep blue";
         skin.setType(1);
         hair.color = "white";
         hair.length = 8;
         initStrTouSpeInte(120,100,60,75);
         initLibSensCor(20,15,35);
         set_weaponName("fists");
         set_weaponVerb("punch");
         set_weaponAttack(27);
         set_armorName("ice");
         set_armorDef(30);
         bonusHP = 600;
         set_lust(10);
         lustVuln = 0.4;
         temperment = 1;
         level = 22;
         set_gems(45 + Utils.rand(25));
         set_drop(new WeightedChoice().add(get_consumables().ICICLE_,1).add(null,3));
         createPerk(PerkLib.Tank,0,0,0,0);
         createPerk(PerkLib.Tank2,0,0,0,0);
         checkMonster();
      }
      
      override public function won(param1:Boolean, param2:Boolean = false) : void
      {
         get_game().combat.cleanupAfterCombat();
      }
      
      override public function react(param1:ReactionContext) : Boolean
      {
         switch(param1.index)
         {
            case 0:
               if(get_player().hasStatusEffect(StatusEffects.GiantBoulder))
               {
                  giantBoulderHit(0);
                  return false;
               }
               break;
            case 3:
               if(get_player().hasStatusEffect(StatusEffects.GiantGrabbed))
               {
                  clearOutput();
                  giantGrabFail(false);
                  tookAction = true;
                  return false;
               }
               if(get_player().hasStatusEffect(StatusEffects.GiantBoulder))
               {
                  clearOutput();
                  giantBoulderMiss();
                  tookAction = true;
                  return false;
               }
         }
         return true;
      }
      
      override public function performCombatAction() : void
      {
         var _loc1_:MonsterAI = new MonsterAI().add(giantAttackPunch,6,true,0,FATIGUE_NONE,CombatRange.Melee);
         _loc1_.add(giantGrab,3,true,10,FATIGUE_PHYSICAL,CombatRange.Melee);
         _loc1_.add(giantBoulderThrow,1,true,10,FATIGUE_PHYSICAL,CombatRange.Ranged);
         _loc1_.exec();
      }
      
      public function giantStrengthLoss(param1:int = 0) : void
      {
         var _loc2_:GiantStrLossDebuff = get_player().createOrFindStatusEffect(StatusEffects.GiantStrLoss);
         _loc2_.applyEffect(param1);
      }
      
      public function giantGrabSuccess() : void
      {
         clearOutput();
         if(get_player().get_str() >= 100)
         {
            outputText("你咆哮着强行掰开巨人的手。他惊讶地喘着粗气，用另一只手把你关在里面，但那时已经太晚了。你跳到地上滚开，准备下一次攻击。");
         }
         if(get_player().get_str() >= 80 && get_player().get_str() < 100)
         {
            outputText("你推、拉、挤、扭，终于逃脱了巨人的掌控。你掉在地上打滚，拉开距离，然后准备好武器。");
         }
         if(get_player().get_str() >= 60 && get_player().get_str() < 80)
         {
            outputText("你费了不小的力气，从巨人的紧握中挣脱出来。你跑上他的手臂，从他的背上跳下来，拉开距离。");
         }
         if(get_player().get_str() >= 40 && get_player().get_str() < 60)
         {
            outputText("尽管巨人的手冰冷坚硬，你还是设法从他的手中滑落，掉在地上，然后爬起来，逃离愤怒的巨人。");
         }
         if(get_player().get_str() >= 20 && get_player().get_str() < 40)
         {
            outputText("浑身酸痛的你，趁着他握力稍松的瞬间，重重地摔在地上。你强迫自己站起来，拼命地跑，拖着隐隐作痛的[ass]能跑多快跑多快。");
         }
         if(get_player().get_str() < 20)
         {
            outputText("你拼尽全力挣扎，终于成功地挠了巨人的痒痒，让他把你放了下来。你有些尴尬地尽量远离巨人，但又不敢直接逃跑，并准备好了武器。你觉得尝试逃跑才是明智之举。");
         }
         get_player().removeStatusEffect(StatusEffects.GiantGrabbed);
      }
      
      public function giantGrabStruggle() : void
      {
         if(Utils.rand(100) >= get_player().get_str() || Utils.rand(10) == 0)
         {
            giantGrabFail();
         }
         else
         {
            giantGrabSuccess();
         }
         tookAction = true;
      }
      
      public function giantGrabFail(param1:Boolean = true) : void
      {
         var _loc2_:int = 0;
         if(param1)
         {
            clearOutput();
            if(get_player().get_str() >= 80)
            {
               outputText("你用尽全力推、拉、挤、扭，但这只会让巨人抓得更紧。");
            }
            else if(get_player().get_str() >= 60 && get_player().get_str() < 80)
            {
               outputText("你的力量没能帮你逃脱这个冰冷的困境，不过挣扎产生的热量在这片荒原上倒是挺舒服的，甚至让你差点睡着。不过巨人可不会让这种事发生。");
               giantStrengthLoss(1);
            }
            else if(get_player().get_str() >= 40 && get_player().get_str() < 60)
            {
               outputText("尽管你拼尽全力，巨人的握力对你虚弱的身体来说还是太大了；你最多只能扭动几下，摇晃一下。他的握力依然如故。");
               giantStrengthLoss(2);
            }
            else if(get_player().get_str() >= 20 && get_player().get_str() < 40)
            {
               outputText("巨人的握力几乎要把你捏碎了；纯粹的意志力让你得以挣扎和抵抗，尽管这被证明是徒劳的。");
               if(!get_player().hasPerk(PerkLib.Juggernaut) && get_armorPerk() != "Heavy")
               {
                  _loc2_ = 10 + Utils.rand(get_str() * 0.5);
                  get_player().takeDamage(_loc2_,true);
               }
            }
            else if(get_player().get_str() < 20)
            {
               outputText("巨人毫不留情地挤压你，你身体承受的压力达到了临界点。幸运的是，巨人似乎并不想谋杀你，所以他稍微松开了手。不过还是没有逃脱的机会。");
               if(!get_player().hasPerk(PerkLib.Juggernaut) && get_armorPerk() != "Heavy")
               {
                  _loc2_ = 20 + Utils.rand(get_str() * 0.75);
                  get_player().takeDamage(_loc2_,true);
               }
            }
            if(get_game().ceraphScene.hasBondage())
            {
               outputText("被束缚的想法让你有点兴奋。");
               if(int([DynStat.Lust(5)].length) == 0)
               {
                  get_game().player.dynStats();
               }
               else if(int([DynStat.Lust(5)].length) == 1)
               {
                  get_game().player.dynStats([DynStat.Lust(5)][0]);
               }
               else if(int([DynStat.Lust(5)].length) == 2)
               {
                  get_game().player.dynStats([DynStat.Lust(5)][0],[DynStat.Lust(5)][1]);
               }
               else if(int([DynStat.Lust(5)].length) == 3)
               {
                  get_game().player.dynStats([DynStat.Lust(5)][0],[DynStat.Lust(5)][1],[DynStat.Lust(5)][2]);
               }
               else if(int([DynStat.Lust(5)].length) == 4)
               {
                  get_game().player.dynStats([DynStat.Lust(5)][0],[DynStat.Lust(5)][1],[DynStat.Lust(5)][2],[DynStat.Lust(5)][3]);
               }
               else if(int([DynStat.Lust(5)].length) == 5)
               {
                  get_game().player.dynStats([DynStat.Lust(5)][0],[DynStat.Lust(5)][1],[DynStat.Lust(5)][2],[DynStat.Lust(5)][3],[DynStat.Lust(5)][4]);
               }
               else if(int([DynStat.Lust(5)].length) == 6)
               {
                  get_game().player.dynStats([DynStat.Lust(5)][0],[DynStat.Lust(5)][1],[DynStat.Lust(5)][2],[DynStat.Lust(5)][3],[DynStat.Lust(5)][4],[DynStat.Lust(5)][5]);
               }
               else if(int([DynStat.Lust(5)].length) == 7)
               {
                  get_game().player.dynStats([DynStat.Lust(5)][0],[DynStat.Lust(5)][1],[DynStat.Lust(5)][2],[DynStat.Lust(5)][3],[DynStat.Lust(5)][4],[DynStat.Lust(5)][5],[DynStat.Lust(5)][6]);
               }
               else if(int([DynStat.Lust(5)].length) == 8)
               {
                  get_game().player.dynStats([DynStat.Lust(5)][0],[DynStat.Lust(5)][1],[DynStat.Lust(5)][2],[DynStat.Lust(5)][3],[DynStat.Lust(5)][4],[DynStat.Lust(5)][5],[DynStat.Lust(5)][6],[DynStat.Lust(5)][7]);
               }
               else if(int([DynStat.Lust(5)].length) == 9)
               {
                  get_game().player.dynStats([DynStat.Lust(5)][0],[DynStat.Lust(5)][1],[DynStat.Lust(5)][2],[DynStat.Lust(5)][3],[DynStat.Lust(5)][4],[DynStat.Lust(5)][5],[DynStat.Lust(5)][6],[DynStat.Lust(5)][7],[DynStat.Lust(5)][8]);
               }
               else if(int([DynStat.Lust(5)].length) == 10)
               {
                  get_game().player.dynStats([DynStat.Lust(5)][0],[DynStat.Lust(5)][1],[DynStat.Lust(5)][2],[DynStat.Lust(5)][3],[DynStat.Lust(5)][4],[DynStat.Lust(5)][5],[DynStat.Lust(5)][6],[DynStat.Lust(5)][7],[DynStat.Lust(5)][8],[DynStat.Lust(5)][9]);
               }
               else if(int([DynStat.Lust(5)].length) == 11)
               {
                  get_game().player.dynStats([DynStat.Lust(5)][0],[DynStat.Lust(5)][1],[DynStat.Lust(5)][2],[DynStat.Lust(5)][3],[DynStat.Lust(5)][4],[DynStat.Lust(5)][5],[DynStat.Lust(5)][6],[DynStat.Lust(5)][7],[DynStat.Lust(5)][8],[DynStat.Lust(5)][9],[DynStat.Lust(5)][10]);
               }
               else if(int([DynStat.Lust(5)].length) == 12)
               {
                  get_game().player.dynStats([DynStat.Lust(5)][0],[DynStat.Lust(5)][1],[DynStat.Lust(5)][2],[DynStat.Lust(5)][3],[DynStat.Lust(5)][4],[DynStat.Lust(5)][5],[DynStat.Lust(5)][6],[DynStat.Lust(5)][7],[DynStat.Lust(5)][8],[DynStat.Lust(5)][9],[DynStat.Lust(5)][10],[DynStat.Lust(5)][11]);
               }
               else if(int([DynStat.Lust(5)].length) == 13)
               {
                  get_game().player.dynStats([DynStat.Lust(5)][0],[DynStat.Lust(5)][1],[DynStat.Lust(5)][2],[DynStat.Lust(5)][3],[DynStat.Lust(5)][4],[DynStat.Lust(5)][5],[DynStat.Lust(5)][6],[DynStat.Lust(5)][7],[DynStat.Lust(5)][8],[DynStat.Lust(5)][9],[DynStat.Lust(5)][10],[DynStat.Lust(5)][11],[DynStat.Lust(5)][12]);
               }
               else if(int([DynStat.Lust(5)].length) == 14)
               {
                  get_game().player.dynStats([DynStat.Lust(5)][0],[DynStat.Lust(5)][1],[DynStat.Lust(5)][2],[DynStat.Lust(5)][3],[DynStat.Lust(5)][4],[DynStat.Lust(5)][5],[DynStat.Lust(5)][6],[DynStat.Lust(5)][7],[DynStat.Lust(5)][8],[DynStat.Lust(5)][9],[DynStat.Lust(5)][10],[DynStat.Lust(5)][11],[DynStat.Lust(5)][12],[DynStat.Lust(5)][13]);
               }
               else if(int([DynStat.Lust(5)].length) == 15)
               {
                  get_game().player.dynStats([DynStat.Lust(5)][0],[DynStat.Lust(5)][1],[DynStat.Lust(5)][2],[DynStat.Lust(5)][3],[DynStat.Lust(5)][4],[DynStat.Lust(5)][5],[DynStat.Lust(5)][6],[DynStat.Lust(5)][7],[DynStat.Lust(5)][8],[DynStat.Lust(5)][9],[DynStat.Lust(5)][10],[DynStat.Lust(5)][11],[DynStat.Lust(5)][12],[DynStat.Lust(5)][13],[DynStat.Lust(5)][14]);
               }
               else if(int([DynStat.Lust(5)].length) == 16)
               {
                  get_game().player.dynStats([DynStat.Lust(5)][0],[DynStat.Lust(5)][1],[DynStat.Lust(5)][2],[DynStat.Lust(5)][3],[DynStat.Lust(5)][4],[DynStat.Lust(5)][5],[DynStat.Lust(5)][6],[DynStat.Lust(5)][7],[DynStat.Lust(5)][8],[DynStat.Lust(5)][9],[DynStat.Lust(5)][10],[DynStat.Lust(5)][11],[DynStat.Lust(5)][12],[DynStat.Lust(5)][13],[DynStat.Lust(5)][14],[DynStat.Lust(5)][15]);
               }
               else if(int([DynStat.Lust(5)].length) == 17)
               {
                  get_game().player.dynStats([DynStat.Lust(5)][0],[DynStat.Lust(5)][1],[DynStat.Lust(5)][2],[DynStat.Lust(5)][3],[DynStat.Lust(5)][4],[DynStat.Lust(5)][5],[DynStat.Lust(5)][6],[DynStat.Lust(5)][7],[DynStat.Lust(5)][8],[DynStat.Lust(5)][9],[DynStat.Lust(5)][10],[DynStat.Lust(5)][11],[DynStat.Lust(5)][12],[DynStat.Lust(5)][13],[DynStat.Lust(5)][14],[DynStat.Lust(5)][15],[DynStat.Lust(5)][16]);
               }
               else if(int([DynStat.Lust(5)].length) == 18)
               {
                  get_game().player.dynStats([DynStat.Lust(5)][0],[DynStat.Lust(5)][1],[DynStat.Lust(5)][2],[DynStat.Lust(5)][3],[DynStat.Lust(5)][4],[DynStat.Lust(5)][5],[DynStat.Lust(5)][6],[DynStat.Lust(5)][7],[DynStat.Lust(5)][8],[DynStat.Lust(5)][9],[DynStat.Lust(5)][10],[DynStat.Lust(5)][11],[DynStat.Lust(5)][12],[DynStat.Lust(5)][13],[DynStat.Lust(5)][14],[DynStat.Lust(5)][15],[DynStat.Lust(5)][16],[DynStat.Lust(5)][17]);
               }
               else if(int([DynStat.Lust(5)].length) == 19)
               {
                  get_game().player.dynStats([DynStat.Lust(5)][0],[DynStat.Lust(5)][1],[DynStat.Lust(5)][2],[DynStat.Lust(5)][3],[DynStat.Lust(5)][4],[DynStat.Lust(5)][5],[DynStat.Lust(5)][6],[DynStat.Lust(5)][7],[DynStat.Lust(5)][8],[DynStat.Lust(5)][9],[DynStat.Lust(5)][10],[DynStat.Lust(5)][11],[DynStat.Lust(5)][12],[DynStat.Lust(5)][13],[DynStat.Lust(5)][14],[DynStat.Lust(5)][15],[DynStat.Lust(5)][16],[DynStat.Lust(5)][17],[DynStat.Lust(5)][18]);
               }
               else
               {
                  if(int([DynStat.Lust(5)].length) != 20)
                  {
                     throw "Too many rest arguments";
                  }
                  get_game().player.dynStats([DynStat.Lust(5)][0],[DynStat.Lust(5)][1],[DynStat.Lust(5)][2],[DynStat.Lust(5)][3],[DynStat.Lust(5)][4],[DynStat.Lust(5)][5],[DynStat.Lust(5)][6],[DynStat.Lust(5)][7],[DynStat.Lust(5)][8],[DynStat.Lust(5)][9],[DynStat.Lust(5)][10],[DynStat.Lust(5)][11],[DynStat.Lust(5)][12],[DynStat.Lust(5)][13],[DynStat.Lust(5)][14],[DynStat.Lust(5)][15],[DynStat.Lust(5)][16],[DynStat.Lust(5)][17],[DynStat.Lust(5)][18],[DynStat.Lust(5)][19]);
               }
            }
            outputText("[pg]");
         }
         else
         {
            if(get_game().ceraphScene.hasBondage())
            {
               outputText("被束缚的想法让你有点兴奋。");
               if(int([DynStat.Lust(5)].length) == 0)
               {
                  get_game().player.dynStats();
               }
               else if(int([DynStat.Lust(5)].length) == 1)
               {
                  get_game().player.dynStats([DynStat.Lust(5)][0]);
               }
               else if(int([DynStat.Lust(5)].length) == 2)
               {
                  get_game().player.dynStats([DynStat.Lust(5)][0],[DynStat.Lust(5)][1]);
               }
               else if(int([DynStat.Lust(5)].length) == 3)
               {
                  get_game().player.dynStats([DynStat.Lust(5)][0],[DynStat.Lust(5)][1],[DynStat.Lust(5)][2]);
               }
               else if(int([DynStat.Lust(5)].length) == 4)
               {
                  get_game().player.dynStats([DynStat.Lust(5)][0],[DynStat.Lust(5)][1],[DynStat.Lust(5)][2],[DynStat.Lust(5)][3]);
               }
               else if(int([DynStat.Lust(5)].length) == 5)
               {
                  get_game().player.dynStats([DynStat.Lust(5)][0],[DynStat.Lust(5)][1],[DynStat.Lust(5)][2],[DynStat.Lust(5)][3],[DynStat.Lust(5)][4]);
               }
               else if(int([DynStat.Lust(5)].length) == 6)
               {
                  get_game().player.dynStats([DynStat.Lust(5)][0],[DynStat.Lust(5)][1],[DynStat.Lust(5)][2],[DynStat.Lust(5)][3],[DynStat.Lust(5)][4],[DynStat.Lust(5)][5]);
               }
               else if(int([DynStat.Lust(5)].length) == 7)
               {
                  get_game().player.dynStats([DynStat.Lust(5)][0],[DynStat.Lust(5)][1],[DynStat.Lust(5)][2],[DynStat.Lust(5)][3],[DynStat.Lust(5)][4],[DynStat.Lust(5)][5],[DynStat.Lust(5)][6]);
               }
               else if(int([DynStat.Lust(5)].length) == 8)
               {
                  get_game().player.dynStats([DynStat.Lust(5)][0],[DynStat.Lust(5)][1],[DynStat.Lust(5)][2],[DynStat.Lust(5)][3],[DynStat.Lust(5)][4],[DynStat.Lust(5)][5],[DynStat.Lust(5)][6],[DynStat.Lust(5)][7]);
               }
               else if(int([DynStat.Lust(5)].length) == 9)
               {
                  get_game().player.dynStats([DynStat.Lust(5)][0],[DynStat.Lust(5)][1],[DynStat.Lust(5)][2],[DynStat.Lust(5)][3],[DynStat.Lust(5)][4],[DynStat.Lust(5)][5],[DynStat.Lust(5)][6],[DynStat.Lust(5)][7],[DynStat.Lust(5)][8]);
               }
               else if(int([DynStat.Lust(5)].length) == 10)
               {
                  get_game().player.dynStats([DynStat.Lust(5)][0],[DynStat.Lust(5)][1],[DynStat.Lust(5)][2],[DynStat.Lust(5)][3],[DynStat.Lust(5)][4],[DynStat.Lust(5)][5],[DynStat.Lust(5)][6],[DynStat.Lust(5)][7],[DynStat.Lust(5)][8],[DynStat.Lust(5)][9]);
               }
               else if(int([DynStat.Lust(5)].length) == 11)
               {
                  get_game().player.dynStats([DynStat.Lust(5)][0],[DynStat.Lust(5)][1],[DynStat.Lust(5)][2],[DynStat.Lust(5)][3],[DynStat.Lust(5)][4],[DynStat.Lust(5)][5],[DynStat.Lust(5)][6],[DynStat.Lust(5)][7],[DynStat.Lust(5)][8],[DynStat.Lust(5)][9],[DynStat.Lust(5)][10]);
               }
               else if(int([DynStat.Lust(5)].length) == 12)
               {
                  get_game().player.dynStats([DynStat.Lust(5)][0],[DynStat.Lust(5)][1],[DynStat.Lust(5)][2],[DynStat.Lust(5)][3],[DynStat.Lust(5)][4],[DynStat.Lust(5)][5],[DynStat.Lust(5)][6],[DynStat.Lust(5)][7],[DynStat.Lust(5)][8],[DynStat.Lust(5)][9],[DynStat.Lust(5)][10],[DynStat.Lust(5)][11]);
               }
               else if(int([DynStat.Lust(5)].length) == 13)
               {
                  get_game().player.dynStats([DynStat.Lust(5)][0],[DynStat.Lust(5)][1],[DynStat.Lust(5)][2],[DynStat.Lust(5)][3],[DynStat.Lust(5)][4],[DynStat.Lust(5)][5],[DynStat.Lust(5)][6],[DynStat.Lust(5)][7],[DynStat.Lust(5)][8],[DynStat.Lust(5)][9],[DynStat.Lust(5)][10],[DynStat.Lust(5)][11],[DynStat.Lust(5)][12]);
               }
               else if(int([DynStat.Lust(5)].length) == 14)
               {
                  get_game().player.dynStats([DynStat.Lust(5)][0],[DynStat.Lust(5)][1],[DynStat.Lust(5)][2],[DynStat.Lust(5)][3],[DynStat.Lust(5)][4],[DynStat.Lust(5)][5],[DynStat.Lust(5)][6],[DynStat.Lust(5)][7],[DynStat.Lust(5)][8],[DynStat.Lust(5)][9],[DynStat.Lust(5)][10],[DynStat.Lust(5)][11],[DynStat.Lust(5)][12],[DynStat.Lust(5)][13]);
               }
               else if(int([DynStat.Lust(5)].length) == 15)
               {
                  get_game().player.dynStats([DynStat.Lust(5)][0],[DynStat.Lust(5)][1],[DynStat.Lust(5)][2],[DynStat.Lust(5)][3],[DynStat.Lust(5)][4],[DynStat.Lust(5)][5],[DynStat.Lust(5)][6],[DynStat.Lust(5)][7],[DynStat.Lust(5)][8],[DynStat.Lust(5)][9],[DynStat.Lust(5)][10],[DynStat.Lust(5)][11],[DynStat.Lust(5)][12],[DynStat.Lust(5)][13],[DynStat.Lust(5)][14]);
               }
               else if(int([DynStat.Lust(5)].length) == 16)
               {
                  get_game().player.dynStats([DynStat.Lust(5)][0],[DynStat.Lust(5)][1],[DynStat.Lust(5)][2],[DynStat.Lust(5)][3],[DynStat.Lust(5)][4],[DynStat.Lust(5)][5],[DynStat.Lust(5)][6],[DynStat.Lust(5)][7],[DynStat.Lust(5)][8],[DynStat.Lust(5)][9],[DynStat.Lust(5)][10],[DynStat.Lust(5)][11],[DynStat.Lust(5)][12],[DynStat.Lust(5)][13],[DynStat.Lust(5)][14],[DynStat.Lust(5)][15]);
               }
               else if(int([DynStat.Lust(5)].length) == 17)
               {
                  get_game().player.dynStats([DynStat.Lust(5)][0],[DynStat.Lust(5)][1],[DynStat.Lust(5)][2],[DynStat.Lust(5)][3],[DynStat.Lust(5)][4],[DynStat.Lust(5)][5],[DynStat.Lust(5)][6],[DynStat.Lust(5)][7],[DynStat.Lust(5)][8],[DynStat.Lust(5)][9],[DynStat.Lust(5)][10],[DynStat.Lust(5)][11],[DynStat.Lust(5)][12],[DynStat.Lust(5)][13],[DynStat.Lust(5)][14],[DynStat.Lust(5)][15],[DynStat.Lust(5)][16]);
               }
               else if(int([DynStat.Lust(5)].length) == 18)
               {
                  get_game().player.dynStats([DynStat.Lust(5)][0],[DynStat.Lust(5)][1],[DynStat.Lust(5)][2],[DynStat.Lust(5)][3],[DynStat.Lust(5)][4],[DynStat.Lust(5)][5],[DynStat.Lust(5)][6],[DynStat.Lust(5)][7],[DynStat.Lust(5)][8],[DynStat.Lust(5)][9],[DynStat.Lust(5)][10],[DynStat.Lust(5)][11],[DynStat.Lust(5)][12],[DynStat.Lust(5)][13],[DynStat.Lust(5)][14],[DynStat.Lust(5)][15],[DynStat.Lust(5)][16],[DynStat.Lust(5)][17]);
               }
               else if(int([DynStat.Lust(5)].length) == 19)
               {
                  get_game().player.dynStats([DynStat.Lust(5)][0],[DynStat.Lust(5)][1],[DynStat.Lust(5)][2],[DynStat.Lust(5)][3],[DynStat.Lust(5)][4],[DynStat.Lust(5)][5],[DynStat.Lust(5)][6],[DynStat.Lust(5)][7],[DynStat.Lust(5)][8],[DynStat.Lust(5)][9],[DynStat.Lust(5)][10],[DynStat.Lust(5)][11],[DynStat.Lust(5)][12],[DynStat.Lust(5)][13],[DynStat.Lust(5)][14],[DynStat.Lust(5)][15],[DynStat.Lust(5)][16],[DynStat.Lust(5)][17],[DynStat.Lust(5)][18]);
               }
               else
               {
                  if(int([DynStat.Lust(5)].length) != 20)
                  {
                     throw "Too many rest arguments";
                  }
                  get_game().player.dynStats([DynStat.Lust(5)][0],[DynStat.Lust(5)][1],[DynStat.Lust(5)][2],[DynStat.Lust(5)][3],[DynStat.Lust(5)][4],[DynStat.Lust(5)][5],[DynStat.Lust(5)][6],[DynStat.Lust(5)][7],[DynStat.Lust(5)][8],[DynStat.Lust(5)][9],[DynStat.Lust(5)][10],[DynStat.Lust(5)][11],[DynStat.Lust(5)][12],[DynStat.Lust(5)][13],[DynStat.Lust(5)][14],[DynStat.Lust(5)][15],[DynStat.Lust(5)][16],[DynStat.Lust(5)][17],[DynStat.Lust(5)][18],[DynStat.Lust(5)][19]);
               }
            }
            outputText("[pg]");
         }
         switch(Utils.rand(6))
         {
            case 0:
            case 1:
            case 2:
               outputText("[say: 哈哈哈！微不足道的小[race]！你逃不出我的手掌心！] 他弹了一下你的头，差点扭断你的脖子，你眼前冒了一会儿金星。");
               get_player().removeStatusEffect(StatusEffects.GiantGrabbed);
               _loc2_ = 10 + Utils.rand(get_str() * 0.5);
               _loc2_ = get_player().reduceDamage(_loc2_,this);
               get_player().takeDamage(_loc2_,true);
               break;
            case 3:
            case 4:
               outputText("巨人把你举到他面前对你大吼。他的尖叫声可能是你听过的最大的声音，当你的耳朵还在嗡嗡作响时，他把你举高，再举高，然后用尽全力砸向地面。");
               outputText("这一拳的力量让你晕眩了一段时间；在他试图做其他事情之前，你恢复了理智。");
               get_player().removeStatusEffect(StatusEffects.GiantGrabbed);
               _loc2_ = 100 + Utils.rand(get_str() * 1.5);
               _loc2_ = get_player().reduceDamage(_loc2_,this);
               get_player().takeDamage(_loc2_,true);
               break;
            case 5:
               outputText("[say: 哦，小[race]想被放走？哈！那就走吧！] 他向后仰身，用尽全力把你扔向最近的岩壁。幸运的是，他瞄准偏了，把你扔进了一片雪地里。雪起到了缓冲作用，但你仍然感到非常迷失方向。");
               get_player().removeStatusEffect(StatusEffects.GiantGrabbed);
               get_player().createStatusEffect(StatusEffects.Stunned,1 + Utils.rand(2),0,0,0);
               _loc2_ = 20 + Utils.rand(get_str());
               _loc2_ = get_player().reduceDamage(_loc2_,this);
               if(_loc2_ < 20)
               {
                  _loc2_ = 20;
               }
               get_player().takeDamage(_loc2_,true);
         }
      }
      
      public function giantGrab() : void
      {
         outputText("巨人大喊着你听不懂的话，伸出双手向你冲来！");
         if(Boolean(combatAvoidDamage(new AvoidDamageParameters(true,false,false,null,null,null,null,null)).attackFailed))
         {
            outputText("你");
            if(Utils.rand(get_player().get_spe()) < get_spe())
            {
               outputText("勉强");
            }
            else
            {
               outputText("地");
            }
            outputText("躲开了他的冲锋，及时跳起避开了他的双手，然后是他的双脚。他没能及时停下，一头撞上了一块比他脑袋略小的巨石。");
            takeDamage(10 + Utils.rand(20),true);
            outputText("<b>巨人被击晕了！</b>");
            createStatusEffect(StatusEffects.Stunned,1,0,0,0);
         }
         else
         {
            outputText("你试图躲开的尝试失败了，巨人用他那非常大、非常冷、非常强壮的双手抓住了你。[say: 现在，你去死吧！]");
            get_player().createStatusEffect(StatusEffects.GiantGrabbed,2,0,0,0);
         }
      }
      
      public function giantBoulderThrow() : void
      {
         outputText("巨人走到一块比你大得多的巨石前，把它举了起来。你最好等一下，准备好闪避，否则情况会非常糟糕。");
         outputText("<b>伴随着一声低吼，巨人用力将巨石直接向你砸来！</b>");
         if(!get_player().hasStatusEffect(StatusEffects.GiantBoulder))
         {
            get_player().createStatusEffect(StatusEffects.GiantBoulder,0,0,0,0);
         }
      }
      
      public function giantBoulderMiss() : void
      {
         clearOutput();
         outputText("如果你站着不动，他的瞄准堪称完美。看着他把巨石扔向你，给了你充足的时间来躲避这块大石头，尽管撞击产生的碎石可能会留下一些瘀伤。");
         if(get_player().hasStatusEffect(StatusEffects.GiantBoulder))
         {
            get_player().removeStatusEffect(StatusEffects.GiantBoulder);
         }
         var _loc1_:int = 10 + Utils.rand(get_str() / 2);
         _loc1_ = get_player().reduceDamage(_loc1_,this);
         get_player().takeDamage(_loc1_,true);
         outputText("[pg]");
      }
      
      public function giantBoulderHit(param1:int = 0) : void
      {
         clearOutput();
         if(param1 == 0)
         {
            outputText("你向巨人冲去，拼尽全力奔跑，希望能在他扔出巨石之前赶到他身边。然而，你的靠近反而让他更容易击中你，他也确实这么做了。巨石的全部力量结结实实地砸在你的上半身，直接把你砸进了雪地里，而巨石则仁慈地落在了几码外。");
         }
         else if(param1 == 1)
         {
            outputText("，但你及时抬起头，险险避开了他扔过来的巨石。你手忙脚乱地做出反应，向旁边跳去，却发现自己选错了方向。巨石击中了你的背部，把你撞飞了出去。你被打得遍体鳞伤，挣扎着想要站起来，这时巨人把你抓了起来，发出一阵深沉有力的狂笑，然后一脚把你踢过了山头。你落进了一个几英尺深的雪堆里，在视线模糊之前，你看到有什么东西朝你飞来。");
         }
         else
         {
            outputText("你开始施法，全神贯注地召唤魔法。然而你太专注了，以至于没注意到巨人将巨石以抛物线向你砸来。你及时发现了巨石，没有被它压碎，但它还是击中了你，你飞出几十码远，撞在了一块漂亮的锯齿状岩壁上。");
         }
         if(get_player().hasStatusEffect(StatusEffects.GiantBoulder))
         {
            get_player().removeStatusEffect(StatusEffects.GiantBoulder);
         }
         var _loc2_:int = int(get_str() * 2 + 100 + Utils.rand(250));
         _loc2_ = get_player().reduceDamage(_loc2_,this);
         if(_loc2_ < 200)
         {
            _loc2_ = 200;
         }
         get_player().takeDamage(_loc2_,true);
         outputText("[pg]");
      }
      
      public function giantBoulderFantasize() : void
      {
         outputText("你纳闷自己怎么能操这么大的东西。");
         if(int(get_player().cocks.length) > 0)
         {
            if(get_player().biggestCockArea() >= 24)
            {
               outputText("哦等等，你完全可以用你的");
               if(int(get_player().cocks.length) > 1)
               {
                  outputText("一堆鸡巴操他的屁股。");
               }
               else
               {
                  outputText("一根超大鸡巴操他的屁股。");
               }
               outputText("他可能有个漂亮的鼻子……你试图估量一下他鼻子的大小。他离得太远了，你看不清");
            }
            else if(get_player().biggestCockArea() < 24)
            {
               outputText("你觉得你可以试着操一个通常不用于性交的较小的洞……也许是他的鼻子？你从这里看不清他鼻孔的大小");
            }
         }
         else
         {
            outputText("你可以直接爬到他身上的某个部位摩擦，虽然他看起来很冷，不适合做这种事。你想知道有没有办法操点别的……也许是他的鼻子？你从这里看不出他的鼻尖突不突出");
         }
         giantBoulderHit(1);
      }
      
      public function giantAttackPunch() : void
      {
         var _loc1_:int = 0;
         outputText("巨人向你大步走来，拉近距离的速度比你跑得还快。他向后仰起身子，向你发起攻击！");
         if(Boolean(combatAvoidDamage(new AvoidDamageParameters(true,false,false,null,null,null,null,null)).attackFailed))
         {
            outputText("你灵巧地躲过了这个巨型霜巨人的微弱一击，迅速旋转身体，用你的[weapon]攻击他的手，留下了一道看起来像裂缝的痕迹。巨人愤怒地咆哮着，震落了树上的雪，让你的[armor]也随之震动。他看起来比以前更生气了。");
         }
         else if(Utils.rand(get_player().get_spe() + 40) < get_spe())
         {
            outputText("你承受了他这记重击的全部力量，被击飞了足足40英尺，一头栽进了一个雪堆里。当你站稳身子时，他的笑声震动了大地，[say: 弱小！哈！]");
            _loc1_ = int(get_str() + 50 + Utils.rand(100));
            _loc1_ = get_player().reduceDamage(_loc1_,this);
            if(_loc1_ < 40)
            {
               _loc1_ = 40;
            }
            get_player().takeDamage(_loc1_,true);
         }
         else
         {
            outputText("你险些没躲过巨人的拳头，在重新站稳时踉跄了一下。巨人发出一声低沉的咆哮，大喊道：[say: 呸！算你走运！]");
            _loc1_ = Utils.rand(get_str());
            _loc1_ = get_player().reduceDamage(_loc1_,this);
            get_player().takeDamage(_loc1_,true);
         }
      }
      
      override public function defeated(param1:Boolean) : void
      {
         get_game().glacialRift.giantScene.winAgainstGiant();
      }
   }
}

