package classes.scenes.areas.highMountains
{
   import classes.Appearance;
   import classes.CoC;
   import classes.Creature;
   import classes.DynStat;
   import classes.Monster;
   import classes.Player;
   import classes.StatusEffects;
   import classes._FlagDict.FlagDict_Impl_;
   import classes.internals.MonsterAI;
   import classes.internals.Utils;
   import classes.internals.WeightedChoice;
   import classes.items.ConsumableLib;
   import classes.scenes.combat.AvoidDamageParameters;
   import classes.scenes.combat.CombatRange;
   import flash.Boot;
   import haxe.IMap;
   
   public class Minerva extends Monster
   {
      
      public function Minerva()
      {
         if(Boot.skip_constructor)
         {
            return;
         }
         super();
         set_a("");
         set_short("Minerva");
         if(FlagDict_Impl_.arrayReadInt(get_flags(),2087) >= 10)
         {
            imageName = "minervapure";
         }
         else if(FlagDict_Impl_.arrayReadInt(get_flags(),2092) >= 10)
         {
            imageName = "minervacorrupt";
         }
         else
         {
            imageName = "minerva";
         }
         if(FlagDict_Impl_.arrayReadInt(get_flags(),2087) >= 10)
         {
            set_long("你正在与被净化的塞壬米内瓦战斗。她身高约八英尺，挥舞着一把同样高的武器，是一股不可忽视的力量。她的皮肤是金黄色的，不过她的腹部、脖子和大腿内侧却像天上的云朵一样洁白，肚脐上还装饰着一个金色的脐环。白色的条纹点缀着她的双腿、尾巴和背部。两只巨大的翅膀从她背上长出，羽毛是引人注目的纯白色。她穿着一件抹胸，包裹着她G罩杯的双峰，宽阔的腰间穿着一条超短裤，似乎正勒着一个巨大的凸起。\n\n她的武器是一把戟，由闪亮的银色金属制成，似乎散发着一种不自然的光芒。");
         }
         else if(FlagDict_Impl_.arrayReadInt(get_flags(),2092) >= 10)
         {
            set_long("你正在与堕落的塞壬米内瓦战斗。");
         }
         else
         {
            set_long("你正在与被污染的塞壬米内瓦战斗。她身高约八英尺，挥舞着一把同样高的武器，是一股不可忽视的力量。她的皮肤是深海军蓝色的，不过她的腹部、脖子和大腿内侧却像天上的云朵一样洁白，肚脐上还装饰着一个金色的脐环。橙白相间的条纹点缀着她的双腿、尾巴和背部。两只巨大的翅膀从她背上长出，羽毛是引人注目的红橙混合色。她穿着一件抹胸，包裹着她DD罩杯的双峰，宽阔的腰间穿着一条超短裤，似乎正勒着一个巨大的凸起。\n\n她的武器是一把戟，由闪亮的银色金属制成，似乎散发着一种不自然的光芒。");
         }
         set_race("Siren");
         createCock(16,3);
         if(FlagDict_Impl_.arrayReadInt(get_flags(),2092) >= 10)
         {
            createCock(16,3);
         }
         balls = 2;
         ballSize = 3;
         if(FlagDict_Impl_.arrayReadInt(get_flags(),2087) >= 10 || FlagDict_Impl_.arrayReadInt(get_flags(),2092) >= 10)
         {
            ballSize += 2;
         }
         cumMultiplier = 3;
         createVagina(false,3,1);
         if(FlagDict_Impl_.arrayReadInt(get_flags(),2087) >= 10)
         {
            createBreastRow(Appearance.breastCupInverse("G"));
         }
         else if(FlagDict_Impl_.arrayReadInt(get_flags(),2092) >= 10)
         {
            createBreastRow(Appearance.breastCupInverse("E"));
         }
         else
         {
            createBreastRow(Appearance.breastCupInverse("DD"));
         }
         ass.analLooseness = 1;
         ass.analWetness = 0;
         set_tallness(100);
         hips.rating = 10;
         butt.rating = 9;
         skin.tone = "blue";
         hair.color = "red";
         hair.length = 25;
         initStrTouSpeInte(50,65,95,75);
         initLibSensCor(30,25,45);
         if(FlagDict_Impl_.arrayReadInt(get_flags(),2087) >= 10)
         {
            cor = 0;
         }
         if(FlagDict_Impl_.arrayReadInt(get_flags(),2092) >= 10)
         {
            cor = 80;
         }
         set_weaponName("halberd");
         set_weaponVerb("slash");
         set_weaponAttack(30);
         set_weaponPerk([]);
         set_weaponValue(150);
         set_armorName(get_game().armors.TUBETOP.get_name());
         set_armorDef(1);
         set_armorPerk("");
         set_armorValue(5);
         bonusHP = 470;
         set_lust(20);
         lustVuln = 0.2;
         temperment = 3;
         level = 16;
         set_gems(Utils.rand(25) + 10);
         additionalXP = 50;
         set_drop(new WeightedChoice(get_consumables().PURPEAC,1));
         wings.type = 9;
         checkMonster();
      }
      
      override public function won(param1:Boolean, param2:Boolean = false) : void
      {
         get_game().highMountains.minervaScene.loseToMinerva();
      }
      
      public function tailWhip() : void
      {
         var _loc1_:int = get_player().reduceDamage(get_str() + 35,this);
         outputText("她向你跑来，握着武器，好像要砍向你的侧面。你做好准备，但当她离你只有几英尺远时，她开始转动身体。");
         if(_loc1_ <= 0)
         {
            outputText("你猛地踢出一脚，拦截了尾巴的抽击，你的[foot]撞击在她强壮的附肢上，完全抵消了它的动量。");
         }
         else
         {
            outputText("她的鲨鱼尾巴猛击你，将你击倒在地。你迅速挣扎着回到原位");
            if(get_player().get_armorDef() > 0)
            {
               outputText("，但你的防御力降低了");
            }
            outputText("！");
            get_player().takeDamage(_loc1_,true);
            if(hasStatusEffect(StatusEffects.TailWhip))
            {
               addStatusValue(StatusEffects.TailWhip,1,10);
            }
            else
            {
               createStatusEffect(StatusEffects.TailWhip,10,0,0,0);
            }
         }
      }
      
      public function sirensSong() : void
      {
         if(!hasStatusEffect(StatusEffects.SirenSong))
         {
            outputText("米内瓦开始哼唱一首悦耳的曲子。最好退后一步，看看她想干什么！");
            createStatusEffect(StatusEffects.SirenSong,0,0,0,0);
         }
         else
         {
            outputText("她的哼唱变成了一首歌。一首没有歌词的华丽歌曲，这种声音无论是人类还是任何生物，按理说都不可能自然地发出来。");
            if(FlagDict_Impl_.arrayReadInt(get_flags(),22) == 1)
            {
               outputText("在她张开嘴唇之前，你就捂住了耳朵，警惕着它的力量。尽管你只听到了一点点声音，但从你体内翻腾的微弱快感来看，这大概是明智之举。");
            }
            else
            {
               outputText("当歌声流入你的耳朵，让你的脑海充满甜蜜的幸福感时，你的意识变得模糊。你放下了你的[weapon]，如梦似幻地走进了塞壬甜蜜的怀抱。你心不在焉地脱下衣服，越走越近，每走一步歌声就变得越发响亮，直到你最终将自己埋进塞壬柔软的胸膛，她用长满羽毛的手臂环抱住你的身体。她停止了那美妙的歌唱，在你的耳边低语，[say: 你现在完全是我的了。]");
               if(int([DynStat.Lust(999)].length) == 0)
               {
                  get_game().player.dynStats();
               }
               else if(int([DynStat.Lust(999)].length) == 1)
               {
                  get_game().player.dynStats([DynStat.Lust(999)][0]);
               }
               else if(int([DynStat.Lust(999)].length) == 2)
               {
                  get_game().player.dynStats([DynStat.Lust(999)][0],[DynStat.Lust(999)][1]);
               }
               else if(int([DynStat.Lust(999)].length) == 3)
               {
                  get_game().player.dynStats([DynStat.Lust(999)][0],[DynStat.Lust(999)][1],[DynStat.Lust(999)][2]);
               }
               else if(int([DynStat.Lust(999)].length) == 4)
               {
                  get_game().player.dynStats([DynStat.Lust(999)][0],[DynStat.Lust(999)][1],[DynStat.Lust(999)][2],[DynStat.Lust(999)][3]);
               }
               else if(int([DynStat.Lust(999)].length) == 5)
               {
                  get_game().player.dynStats([DynStat.Lust(999)][0],[DynStat.Lust(999)][1],[DynStat.Lust(999)][2],[DynStat.Lust(999)][3],[DynStat.Lust(999)][4]);
               }
               else if(int([DynStat.Lust(999)].length) == 6)
               {
                  get_game().player.dynStats([DynStat.Lust(999)][0],[DynStat.Lust(999)][1],[DynStat.Lust(999)][2],[DynStat.Lust(999)][3],[DynStat.Lust(999)][4],[DynStat.Lust(999)][5]);
               }
               else if(int([DynStat.Lust(999)].length) == 7)
               {
                  get_game().player.dynStats([DynStat.Lust(999)][0],[DynStat.Lust(999)][1],[DynStat.Lust(999)][2],[DynStat.Lust(999)][3],[DynStat.Lust(999)][4],[DynStat.Lust(999)][5],[DynStat.Lust(999)][6]);
               }
               else if(int([DynStat.Lust(999)].length) == 8)
               {
                  get_game().player.dynStats([DynStat.Lust(999)][0],[DynStat.Lust(999)][1],[DynStat.Lust(999)][2],[DynStat.Lust(999)][3],[DynStat.Lust(999)][4],[DynStat.Lust(999)][5],[DynStat.Lust(999)][6],[DynStat.Lust(999)][7]);
               }
               else if(int([DynStat.Lust(999)].length) == 9)
               {
                  get_game().player.dynStats([DynStat.Lust(999)][0],[DynStat.Lust(999)][1],[DynStat.Lust(999)][2],[DynStat.Lust(999)][3],[DynStat.Lust(999)][4],[DynStat.Lust(999)][5],[DynStat.Lust(999)][6],[DynStat.Lust(999)][7],[DynStat.Lust(999)][8]);
               }
               else if(int([DynStat.Lust(999)].length) == 10)
               {
                  get_game().player.dynStats([DynStat.Lust(999)][0],[DynStat.Lust(999)][1],[DynStat.Lust(999)][2],[DynStat.Lust(999)][3],[DynStat.Lust(999)][4],[DynStat.Lust(999)][5],[DynStat.Lust(999)][6],[DynStat.Lust(999)][7],[DynStat.Lust(999)][8],[DynStat.Lust(999)][9]);
               }
               else if(int([DynStat.Lust(999)].length) == 11)
               {
                  get_game().player.dynStats([DynStat.Lust(999)][0],[DynStat.Lust(999)][1],[DynStat.Lust(999)][2],[DynStat.Lust(999)][3],[DynStat.Lust(999)][4],[DynStat.Lust(999)][5],[DynStat.Lust(999)][6],[DynStat.Lust(999)][7],[DynStat.Lust(999)][8],[DynStat.Lust(999)][9],[DynStat.Lust(999)][10]);
               }
               else if(int([DynStat.Lust(999)].length) == 12)
               {
                  get_game().player.dynStats([DynStat.Lust(999)][0],[DynStat.Lust(999)][1],[DynStat.Lust(999)][2],[DynStat.Lust(999)][3],[DynStat.Lust(999)][4],[DynStat.Lust(999)][5],[DynStat.Lust(999)][6],[DynStat.Lust(999)][7],[DynStat.Lust(999)][8],[DynStat.Lust(999)][9],[DynStat.Lust(999)][10],[DynStat.Lust(999)][11]);
               }
               else if(int([DynStat.Lust(999)].length) == 13)
               {
                  get_game().player.dynStats([DynStat.Lust(999)][0],[DynStat.Lust(999)][1],[DynStat.Lust(999)][2],[DynStat.Lust(999)][3],[DynStat.Lust(999)][4],[DynStat.Lust(999)][5],[DynStat.Lust(999)][6],[DynStat.Lust(999)][7],[DynStat.Lust(999)][8],[DynStat.Lust(999)][9],[DynStat.Lust(999)][10],[DynStat.Lust(999)][11],[DynStat.Lust(999)][12]);
               }
               else if(int([DynStat.Lust(999)].length) == 14)
               {
                  get_game().player.dynStats([DynStat.Lust(999)][0],[DynStat.Lust(999)][1],[DynStat.Lust(999)][2],[DynStat.Lust(999)][3],[DynStat.Lust(999)][4],[DynStat.Lust(999)][5],[DynStat.Lust(999)][6],[DynStat.Lust(999)][7],[DynStat.Lust(999)][8],[DynStat.Lust(999)][9],[DynStat.Lust(999)][10],[DynStat.Lust(999)][11],[DynStat.Lust(999)][12],[DynStat.Lust(999)][13]);
               }
               else if(int([DynStat.Lust(999)].length) == 15)
               {
                  get_game().player.dynStats([DynStat.Lust(999)][0],[DynStat.Lust(999)][1],[DynStat.Lust(999)][2],[DynStat.Lust(999)][3],[DynStat.Lust(999)][4],[DynStat.Lust(999)][5],[DynStat.Lust(999)][6],[DynStat.Lust(999)][7],[DynStat.Lust(999)][8],[DynStat.Lust(999)][9],[DynStat.Lust(999)][10],[DynStat.Lust(999)][11],[DynStat.Lust(999)][12],[DynStat.Lust(999)][13],[DynStat.Lust(999)][14]);
               }
               else if(int([DynStat.Lust(999)].length) == 16)
               {
                  get_game().player.dynStats([DynStat.Lust(999)][0],[DynStat.Lust(999)][1],[DynStat.Lust(999)][2],[DynStat.Lust(999)][3],[DynStat.Lust(999)][4],[DynStat.Lust(999)][5],[DynStat.Lust(999)][6],[DynStat.Lust(999)][7],[DynStat.Lust(999)][8],[DynStat.Lust(999)][9],[DynStat.Lust(999)][10],[DynStat.Lust(999)][11],[DynStat.Lust(999)][12],[DynStat.Lust(999)][13],[DynStat.Lust(999)][14],[DynStat.Lust(999)][15]);
               }
               else if(int([DynStat.Lust(999)].length) == 17)
               {
                  get_game().player.dynStats([DynStat.Lust(999)][0],[DynStat.Lust(999)][1],[DynStat.Lust(999)][2],[DynStat.Lust(999)][3],[DynStat.Lust(999)][4],[DynStat.Lust(999)][5],[DynStat.Lust(999)][6],[DynStat.Lust(999)][7],[DynStat.Lust(999)][8],[DynStat.Lust(999)][9],[DynStat.Lust(999)][10],[DynStat.Lust(999)][11],[DynStat.Lust(999)][12],[DynStat.Lust(999)][13],[DynStat.Lust(999)][14],[DynStat.Lust(999)][15],[DynStat.Lust(999)][16]);
               }
               else if(int([DynStat.Lust(999)].length) == 18)
               {
                  get_game().player.dynStats([DynStat.Lust(999)][0],[DynStat.Lust(999)][1],[DynStat.Lust(999)][2],[DynStat.Lust(999)][3],[DynStat.Lust(999)][4],[DynStat.Lust(999)][5],[DynStat.Lust(999)][6],[DynStat.Lust(999)][7],[DynStat.Lust(999)][8],[DynStat.Lust(999)][9],[DynStat.Lust(999)][10],[DynStat.Lust(999)][11],[DynStat.Lust(999)][12],[DynStat.Lust(999)][13],[DynStat.Lust(999)][14],[DynStat.Lust(999)][15],[DynStat.Lust(999)][16],[DynStat.Lust(999)][17]);
               }
               else if(int([DynStat.Lust(999)].length) == 19)
               {
                  get_game().player.dynStats([DynStat.Lust(999)][0],[DynStat.Lust(999)][1],[DynStat.Lust(999)][2],[DynStat.Lust(999)][3],[DynStat.Lust(999)][4],[DynStat.Lust(999)][5],[DynStat.Lust(999)][6],[DynStat.Lust(999)][7],[DynStat.Lust(999)][8],[DynStat.Lust(999)][9],[DynStat.Lust(999)][10],[DynStat.Lust(999)][11],[DynStat.Lust(999)][12],[DynStat.Lust(999)][13],[DynStat.Lust(999)][14],[DynStat.Lust(999)][15],[DynStat.Lust(999)][16],[DynStat.Lust(999)][17],[DynStat.Lust(999)][18]);
               }
               else
               {
                  if(int([DynStat.Lust(999)].length) != 20)
                  {
                     throw "Too many rest arguments";
                  }
                  get_game().player.dynStats([DynStat.Lust(999)][0],[DynStat.Lust(999)][1],[DynStat.Lust(999)][2],[DynStat.Lust(999)][3],[DynStat.Lust(999)][4],[DynStat.Lust(999)][5],[DynStat.Lust(999)][6],[DynStat.Lust(999)][7],[DynStat.Lust(999)][8],[DynStat.Lust(999)][9],[DynStat.Lust(999)][10],[DynStat.Lust(999)][11],[DynStat.Lust(999)][12],[DynStat.Lust(999)][13],[DynStat.Lust(999)][14],[DynStat.Lust(999)][15],[DynStat.Lust(999)][16],[DynStat.Lust(999)][17],[DynStat.Lust(999)][18],[DynStat.Lust(999)][19]);
               }
            }
            removeStatusEffect(StatusEffects.SirenSong);
         }
      }
      
      override public function performCombatAction() : void
      {
         var _loc1_:* = null as MonsterAI;
         if(hasStatusEffect(StatusEffects.SirenSong))
         {
            sirensSong();
         }
         else if(Utils.rand(25) == 0 || get_HP() < 100 && Utils.rand(2) == 0)
         {
            sirensSong();
         }
         else
         {
            _loc1_ = new MonsterAI();
            _loc1_.add(bootyShortInYoFaceSon,1,true,0,FATIGUE_NONE,CombatRange.Tease);
            _loc1_.add(kiteFire,1,true,10,FATIGUE_MAGICAL,CombatRange.Ranged);
            _loc1_.add(minervaUsesHalberdCHOP,1,true,10,FATIGUE_PHYSICAL,CombatRange.Melee);
            _loc1_.add(minervaUsesHalberdStab,1,true,0,FATIGUE_NONE,CombatRange.Melee);
            _loc1_.add(tailWhip,1,true,5,FATIGUE_NONE,CombatRange.Melee);
            _loc1_.add(minervaKnowsKungfu,1,true,10,FATIGUE_PHYSICAL,CombatRange.Melee);
            _loc1_.add(minervaBite,1,true,0,FATIGUE_NONE,CombatRange.Melee);
            _loc1_.add(lickDatPole,1,true,0,FATIGUE_NONE,CombatRange.Tease);
            _loc1_.exec();
         }
      }
      
      public function minervaUsesHalberdStab() : void
      {
         outputText("米内瓦向你冲来，挥舞着她的长戟，锋利的尖端指向你。");
         var _loc1_:int = get_player().reduceDamage(get_str() + get_weaponAttack(),this,20);
         if(Boolean(combatAvoidDamage(new AvoidDamageParameters(true,false,false,null,null,null,null,null)).attackFailed))
         {
            outputText("就在她将戟尖刺过你脸颊的瞬间，你侧身躲开了攻击。");
         }
         else if(_loc1_ < 0)
         {
            outputText("你用尽全力挥动你的[weapon]，击中米内瓦长戟的侧面，将这致命的一击偏转开来。");
         }
         else
         {
            outputText("她刺中了你的肩膀！你痛苦地退缩，后退一步，再次脱离了她的攻击范围。");
            get_player().takeDamage(_loc1_,true);
         }
      }
      
      public function minervaUsesHalberdCHOP() : void
      {
         outputText("她靠得很近，几乎就在你面前，举起了长戟。");
         var _loc1_:int = get_player().reduceDamage(get_str() + 100,this);
         if(Boolean(combatAvoidDamage(new AvoidDamageParameters(true,false,false,null,null,null,null,null)).attackFailed))
         {
            outputText("你迅速躲开，她的攻击深深地砍进了泥土里。");
         }
         else if(_loc1_ < 0)
         {
            outputText("在一场纯粹技巧的疯狂展示中，你举起双手，紧紧夹住长戟刀刃的两侧，冷酷地阻止了米内瓦的攻击，让这个塞壬感到困惑。");
         }
         else
         {
            outputText("你没有时间躲避向下的劈砍，斧刃直接砍进了你的肩胛骨！你痛苦地大叫，但尽管受到了残酷的打击，你仍然可以移动你的手臂。");
            get_player().takeDamage(_loc1_,true);
         }
      }
      
      public function minervaKnowsKungfu() : void
      {
         outputText("这位蓝色的美人拍打着翅膀腾空而起。当她升到最高处时，便向你俯冲而来，用她那恶魔般的利爪率先发起攻击。");
         var _loc1_:int = get_player().reduceDamage(get_str() + get_weaponAttack() + 100,this);
         set_spe(get_spe() - 70);
         if(Boolean(combatAvoidDamage(new AvoidDamageParameters(true,false,false,null,null,null,null,null)).attackFailed))
         {
            outputText("你及时跳出了着陆区，米内瓦猛地砸在地上，泥土四处飞溅。");
         }
         else if(_loc1_ <= 0)
         {
            outputText("你稳住身形，伸出手，在米内瓦试图对你进行重击时抓住了她。你用力闷哼一声，将她拉向自己，然后把这个塞壬完全扔到一边，阻止了她的攻击。");
         }
         else
         {
            outputText("她正中你的胸口，将你击倒在地，她全身的重量都压在了你身上。这个性感尤物从你胸口跳下，准备继续战斗。");
            get_player().takeDamage(_loc1_,true);
         }
         set_spe(get_spe() + 70);
      }
      
      public function minervaBite() : void
      {
         outputText("塞壬在你周围绕圈踱步，等待着合适的时机发动攻击。多亏了她长着爪子的脚，她出乎意料地快，全速向你冲来。她张开大嘴想咬你，露出了一排排闪闪发光、锋利如剃刀的牙齿。");
         var _loc1_:int = get_player().reduceDamage(get_str() + 85,this);
         if(Boolean(combatAvoidDamage(new AvoidDamageParameters(true,false,false,null,null,null,null,null)).attackFailed))
         {
            outputText("你及时躲开了，米内瓦只咬到了空气，发出一声响亮的空咬声。");
         }
         else if(combatBlock(true))
         {
            outputText("你及时举起[shield]，挡开了她的撕咬。");
         }
         else if(_loc1_ <= 0)
         {
            outputText("你双手猛地挥出，在她试图咬你时将她的头打向一侧。攻击被偏转后，米内瓦只咬到了空气，发出一声响亮的空咬声。");
         }
         else
         {
            outputText("她的牙齿深深刺入你的手臂！经过一番挣扎，你成功挣脱了出来。伤势看起来并不太严重。");
            get_player().takeDamage(_loc1_,true);
         }
      }
      
      public function lickDatPole() : void
      {
         outputText("米内瓦站着，把她的长戟笔直地举在身旁，用诱惑的目光打量着它。她给了你一个暗示的眼神，从嘴里伸出一条两英尺长的舌头，舔了舔这把巨大的武器的很大一部分，甚至用舌头缠绕了它几次。突然，她把舌头缩回嘴里，给了你一个小小的微笑，仿佛在说 [say: 是的，我能做到……甚至更多。]");
         get_player().takeLustDamage(20 + get_player().lib / 10 + Utils.rand(5),true);
      }
      
      public function kiteFire() : void
      {
         outputText("塞壬伸出手，对你露出狡黠的笑容，打了个响指。你的整个身体被白热的火焰吞没，灼烧着你的肉体，烧毁了你的[armor]。突如其来的高温和火焰引起了你内心深处的恐慌，让你大叫着在地上打滚以扑灭火焰。烧伤并不太严重，但你知道你不能继续这样被击中了！");
         var _loc1_:int = int(10 + (get_inte() / 3 + Utils.rand(get_inte() / 2)) * 1.5);
         get_player().takeDamage(_loc1_,true);
      }
      
      override public function defeated(param1:Boolean) : void
      {
         get_game().highMountains.minervaScene.beatUpDatSharpie();
      }
      
      public function bootyShortInYoFaceSon() : void
      {
         outputText("这位蓝色的美人转过身，弯下腰，用她的长戟像杆子一样支撑着自己。她抬起她的鲨鱼尾巴，让你看到她的超短裤完美地贴合着她丰满的臀部。她的尾巴向左向右摇摆，为你做了一个小小的电臀舞。塞壬在她的丰臀上狠狠地拍了一下，回声在塔壁上回荡，让它抖动得更厉害了。她迅速转过身面对你，对她刚才做的事露出得意的笑容。");
         get_player().takeLustDamage(20 + get_player().lib / 10 + Utils.rand(5),true);
      }
   }
}

