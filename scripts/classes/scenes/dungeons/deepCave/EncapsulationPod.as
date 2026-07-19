package classes.scenes.dungeons.deepCave
{
   import classes.CoC;
   import classes.DynStat;
   import classes.ItemType;
   import classes.Monster;
   import classes.Player;
   import classes.StatusEffects;
   import classes.internals.WeightedChoice;
   import classes.items.Weapon;
   import classes.items.WeaponLib;
   import flash.Boot;
   
   public class EncapsulationPod extends Monster
   {
      
      public function EncapsulationPod()
      {
         if(Boot.skip_constructor)
         {
            return;
         }
         super();
         set_a("");
         set_short("pod");
         imageName = "pod";
         set_long("");
         set_race("Abomination");
         initGenderless();
         createBreastRow(0,0);
         set_tallness(120);
         hips.rating = 2;
         butt.rating = 0;
         skin.tone = "purple";
         skin.type = 0;
         skin.desc = "covering";
         hair.color = "black";
         hair.length = 0;
         initStrTouSpeInte(90,1,1,1);
         initLibSensCor(1,1,100);
         set_weaponName("pod");
         set_weaponVerb("pod");
         set_armorName("pod");
         bonusHP = 450;
         set_lust(10);
         lustVuln = 0;
         temperment = 2;
         level = 12;
         set_gems(0);
         additionalXP = 80;
         set_drop(new WeightedChoice(get_weapons().JRAPIER,1));
         checkMonster();
      }
      
      override public function won(param1:Boolean, param2:Boolean = false) : void
      {
         doNext(get_game().dungeons.deepcave.loseToThisShitPartII);
      }
      
      override public function replacesDescribeAttacked(param1:Weapon, param2:int, param3:Boolean = false) : Boolean
      {
         var _loc4_:Boolean = false;
         var _loc5_:Boolean = false;
         var _loc6_:Boolean = false;
         if(!param1.isChanneling())
         {
            _loc4_ = param2 < 15 || param2 < maxHP() * 0.05;
            _loc5_ = param2 < 50 || param2 < maxHP() * 0.2;
            _loc6_ = param2 < 100 || param2 < maxHP() * 0.33;
            if(param2 <= 0)
            {
               outputText(get_Themonster() + "在你的" + param1.get_attackNoun() + "下摇晃，但似乎没有受伤。");
            }
            else if(_loc4_)
            {
               outputText("你的" + param1.get_attackNoun() + "几乎没有在" + get_themonster() + get_possessive() + "墙壁上留下划痕。");
            }
            else if(_loc5_)
            {
               outputText("你的" + param1.get_attackNoun() + "撕裂了" + get_themonster() + "！");
            }
            else if(_loc6_)
            {
               outputText("你用" + param1.get_attackNoun() + "的力量使" + get_themonster() + "踉跄了一下！");
            }
            else
            {
               outputText("你用强大的" + param1.get_attackNoun() + "撕碎了" + get_themonster() + get_possessive() + "的墙壁！");
            }
            if(param3)
            {
               outputText("[b:暴击！]");
            }
            outputText(get_game().combat.getDamageText(param2));
            return true;
         }
         return false;
      }
      
      override public function performCombatAction() : void
      {
         if(!isCrippled)
         {
            encapsulationPodAI();
         }
         else
         {
            outputText("你的家依然舒适。");
         }
      }
      
      override public function handleAwardItemText(param1:ItemType) : void
      {
         outputText("你从被击败的怪物旁边拿起了镶满宝石的细剑。");
      }
      
      override public function get_long() : String
      {
         var _loc1_:* = null as String;
         if(!hasStatusEffect(StatusEffects.Round))
         {
            _loc1_ = "你完全被困在肉荚里了！墙壁黏糊糊的，渗出的水分让空气变得甜得发腻。这让你感到有些头晕。触手正顺着你的" + get_game().player.legs() + "爬向你的胯部，拼命想钻进你的" + get_game().player.get_armorName() + "下面。触手太多了，根本扯不开。你逃脱的唯一机会就是自己开辟一条出路！";
         }
         else if(statusEffectv1(StatusEffects.Round) == 2)
         {
            _loc1_ = "你仍然被困在肉荚里！现在墙壁已经完全被某种粘稠的黏液浸透了。那种气味甜得让人难以忍受，你不得不把一只手扶在墙上以稳住自己。温暖的触手在你的盔甲下卷曲扭动，抚摸着你的每一寸";
            if(get_player().hasFur())
            {
               _loc1_ += "毛茸茸的";
            }
            if(get_player().hasScales())
            {
               _loc1_ += "长满鳞片的";
            }
            _loc1_ += "" + get_player().legs() + "、胯部和" + get_game().player.assDescript() + "。";
         }
         else if(statusEffectv1(StatusEffects.Round) == 3)
         {
            _loc1_ = "你被困在肉荚里，正被它的许多触手强暴！积聚的黏液不断上涨，过不了多久就会淹没你的腹股沟。粘稠的污泥让你难以移动，而它的气味让你更难思考或站立。袭击你腹股沟的触手一刻也没有停止移动，尽管你不愿意，但你身体的某一部分却非常渴望它们能让你高潮。";
         }
         else
         {
            _loc1_ = "你被困在肉荚里，肩膀以下正被触手侵犯！你腰部周围的黏液现在上涨得更快了。它可能很快就会淹没";
            if(get_player().biggestTitSize() >= 1)
            {
               _loc1_ += "你下方的" + get_game().player.allBreastsDescript();
            }
            else
            {
               _loc1_ += "你的胸部";
            }
            _loc1_ += "。你正被一群触手操弄，而你的乳头则被";
            if(!get_player().hasFuckableNipples())
            {
               _loc1_ += "被爱抚着";
            }
            else
            {
               _loc1_ += "被操弄着";
            }
            _loc1_ += "被更多滑溜溜的真菌突起物侵犯。只要向后靠在液体中放松，让它在给你带来快感的同时拥抱你，那该有多容易。你几乎闻不到之前那种甜美、让人失去思考能力的香气了，但你的臀部却在不由自主地摇摆，每次试图移动都会踉跄。你的抵抗力就要崩溃了！";
         }
         if(HPRatio() > 0.8)
         {
            _loc1_ += " 脉动的光芒继续以规律的节奏闪烁着。你对这东西造成的伤害还不足以对它产生丝毫影响。";
         }
         else if(HPRatio() > 0.6)
         {
            _loc1_ += " 你的攻击使墙壁的一部分变成了病态的黑色，它不再与你所在腔室的其余部分一起发光。";
         }
         else if(HPRatio() > 0.4)
         {
            _loc1_ += " 你的攻击在墙上打出了凹陷。它永久变形了，并且因为你的挣扎而变成了纯黑色。在海绵状的表面下，你能感觉到一个坚如磐石的核心开始屈服。";
         }
         else if(HPRatio() > 0.2)
         {
            _loc1_ += " 你不得不不断眨眼，因为肉荚的生物发光照明变得疯狂起来。你攻击的那部分墙壁显然已经死了，但你真菌监狱的其余部分却在以一种疯狂、恐慌的方式闪烁着。";
         }
         else
         {
            _loc1_ += " 你能透过面前破裂的墙壁看到光！再来一次结实的打击就能让你逃脱了！";
         }
         return _loc1_;
      }
      
      override public function getEvasionChance() : Number
      {
         return 0;
      }
      
      public function encapsulationPodAI() : void
      {
         if(!hasStatusEffect(StatusEffects.Round))
         {
            outputText("温暖湿润的感觉顺着你的[legs]爬上来，让你浑身发抖。触手刷过你的");
            if(get_player().balls > 0)
            {
               outputText("[balls]");
               if(get_player().hasVagina())
               {
                  outputText("和");
               }
            }
            if(get_player().hasVagina())
            {
               outputText("[vagina]");
            }
            else if(get_player().balls == 0)
            {
               outputText("会阴");
            }
            outputText("，随着它们在你身上越爬越高。尽管你极力克制，但还是感觉到一丝情欲在脑海中蔓延。");
            if(get_player().get_lust() < 35)
            {
               statScreenRefresh();
            }
            outputText("\n");
         }
         else if(statusEffectv1(StatusEffects.Round) == 2)
         {
            outputText("你[armor]下的触手在你身上蠕动，寻找着可以插入的缝隙和可以抚摸的生殖器。");
            if(get_player().balls > 0)
            {
               outputText("其中一根缠绕在你的[sack]顶部，它的尖端在你的[balls]上滑动。另一根");
            }
            else
            {
               outputText("一根");
            }
            if(get_player().cockTotal() > 0)
            {
               outputText("戳了戳你的[cock]，然后像蛇一样缠绕上去。一旦它将你从[cockhead]到");
               if(!get_player().hasSheath())
               {
                  outputText("根部");
               }
               else
               {
                  outputText("包皮");
               }
               outputText("完全包裹，它便开始以令人愉悦的节奏收缩和放松。");
            }
            else if(get_player().hasVagina())
            {
               outputText("戳弄着你的腹股沟，刻意在你的" + get_player().vaginaDescript(0) + "周围打转，仿佛在寻找其他可以把玩的玩具。");
               if(get_player().getClitLength() > 4)
               {
                  outputText("它拂过你的[clit]，然后卷住它，以缓慢而愉悦的节奏轻轻挤压和抚摸。");
               }
            }
            else
            {
               outputText("戳了戳你的腹股沟，然后卷起来调皮地在你的[asshole]周围打转。整根触须以一种令人愉悦、放松的方式跳动着。");
            }
            if(get_player().cockTotal() > 1)
            {
               outputText("你的其他");
               if(get_player().cockTotal() == 2)
               {
                  outputText(get_player().cockDescript(1) + "也受到了同样的待遇，很快你的两根[cocks]都非常享受这里的服务。");
               }
               else
               {
                  outputText("[cocks]也受到了同样的待遇，很快就感到十分愉悦。");
               }
            }
            if(get_player().hasVagina())
            {
               outputText("对你" + get_player().vaginaDescript() + "的侵犯迅速且毫无痛苦。真菌滑腻的润滑液让它很容易就滑了进去，尽管你想要逃跑，但你发现自己的[vagina]却因快感而充血。触手折叠起来，以便用它的茎秆摩擦你的[clit]，");
               if(get_player().getClitLength() > 3)
               {
                  outputText("一旦它发现它有多大，就会缠绕上去并挤压。感觉真爽！");
               }
               else
               {
                  outputText("它轻而易举地让你的花蕾变得坚挺而敏感。持续的摩擦感觉真好！");
               }
            }
            outputText("一根“幸运”的触须找到了你的[asshole]。它一碰到你的后庭“入口”，就猛地向前刺入。触手表面覆盖的液体让你的肌肉放松，使它能够轻松地滑入你的体内。[pg]");
            outputText("其余的肉块继续在你身上向上爬。它们在你的");
            if(get_player().get_pregnancyIncubation() > 0 && get_player().get_pregnancyIncubation() < 120)
            {
               outputText("怀孕的");
            }
            outputText("肚子上挠痒痒，越来越靠近");
            if(get_player().biggestTitSize() < 1)
            {
               outputText("你的胸部");
            }
            else
            {
               outputText("你的" + get_player().allBreastsDescript() + "的下侧");
            }
            outputText("。天哪，这让你兴奋起来了！你的下半身正在以各种可以想象的方式被侵犯，但这只会让你更加饥渴。在令人麻木的气味和性侵犯之间，你很难集中注意力。");
            if(get_player().get_lust() < 65)
            {
               get_player().takeLustDamage(65 - get_player().get_lust(),true,false);
               statScreenRefresh();
            }
            outputText("\n");
         }
         else
         {
            if(statusEffectv1(StatusEffects.Round) != 3)
            {
               outputText("你的双眼变得迷离，你屈服了。");
               if(int([DynStat.Lust(1)].length) == 0)
               {
                  get_game().player.dynStats();
               }
               else if(int([DynStat.Lust(1)].length) == 1)
               {
                  get_game().player.dynStats([DynStat.Lust(1)][0]);
               }
               else if(int([DynStat.Lust(1)].length) == 2)
               {
                  get_game().player.dynStats([DynStat.Lust(1)][0],[DynStat.Lust(1)][1]);
               }
               else if(int([DynStat.Lust(1)].length) == 3)
               {
                  get_game().player.dynStats([DynStat.Lust(1)][0],[DynStat.Lust(1)][1],[DynStat.Lust(1)][2]);
               }
               else if(int([DynStat.Lust(1)].length) == 4)
               {
                  get_game().player.dynStats([DynStat.Lust(1)][0],[DynStat.Lust(1)][1],[DynStat.Lust(1)][2],[DynStat.Lust(1)][3]);
               }
               else if(int([DynStat.Lust(1)].length) == 5)
               {
                  get_game().player.dynStats([DynStat.Lust(1)][0],[DynStat.Lust(1)][1],[DynStat.Lust(1)][2],[DynStat.Lust(1)][3],[DynStat.Lust(1)][4]);
               }
               else if(int([DynStat.Lust(1)].length) == 6)
               {
                  get_game().player.dynStats([DynStat.Lust(1)][0],[DynStat.Lust(1)][1],[DynStat.Lust(1)][2],[DynStat.Lust(1)][3],[DynStat.Lust(1)][4],[DynStat.Lust(1)][5]);
               }
               else if(int([DynStat.Lust(1)].length) == 7)
               {
                  get_game().player.dynStats([DynStat.Lust(1)][0],[DynStat.Lust(1)][1],[DynStat.Lust(1)][2],[DynStat.Lust(1)][3],[DynStat.Lust(1)][4],[DynStat.Lust(1)][5],[DynStat.Lust(1)][6]);
               }
               else if(int([DynStat.Lust(1)].length) == 8)
               {
                  get_game().player.dynStats([DynStat.Lust(1)][0],[DynStat.Lust(1)][1],[DynStat.Lust(1)][2],[DynStat.Lust(1)][3],[DynStat.Lust(1)][4],[DynStat.Lust(1)][5],[DynStat.Lust(1)][6],[DynStat.Lust(1)][7]);
               }
               else if(int([DynStat.Lust(1)].length) == 9)
               {
                  get_game().player.dynStats([DynStat.Lust(1)][0],[DynStat.Lust(1)][1],[DynStat.Lust(1)][2],[DynStat.Lust(1)][3],[DynStat.Lust(1)][4],[DynStat.Lust(1)][5],[DynStat.Lust(1)][6],[DynStat.Lust(1)][7],[DynStat.Lust(1)][8]);
               }
               else if(int([DynStat.Lust(1)].length) == 10)
               {
                  get_game().player.dynStats([DynStat.Lust(1)][0],[DynStat.Lust(1)][1],[DynStat.Lust(1)][2],[DynStat.Lust(1)][3],[DynStat.Lust(1)][4],[DynStat.Lust(1)][5],[DynStat.Lust(1)][6],[DynStat.Lust(1)][7],[DynStat.Lust(1)][8],[DynStat.Lust(1)][9]);
               }
               else if(int([DynStat.Lust(1)].length) == 11)
               {
                  get_game().player.dynStats([DynStat.Lust(1)][0],[DynStat.Lust(1)][1],[DynStat.Lust(1)][2],[DynStat.Lust(1)][3],[DynStat.Lust(1)][4],[DynStat.Lust(1)][5],[DynStat.Lust(1)][6],[DynStat.Lust(1)][7],[DynStat.Lust(1)][8],[DynStat.Lust(1)][9],[DynStat.Lust(1)][10]);
               }
               else if(int([DynStat.Lust(1)].length) == 12)
               {
                  get_game().player.dynStats([DynStat.Lust(1)][0],[DynStat.Lust(1)][1],[DynStat.Lust(1)][2],[DynStat.Lust(1)][3],[DynStat.Lust(1)][4],[DynStat.Lust(1)][5],[DynStat.Lust(1)][6],[DynStat.Lust(1)][7],[DynStat.Lust(1)][8],[DynStat.Lust(1)][9],[DynStat.Lust(1)][10],[DynStat.Lust(1)][11]);
               }
               else if(int([DynStat.Lust(1)].length) == 13)
               {
                  get_game().player.dynStats([DynStat.Lust(1)][0],[DynStat.Lust(1)][1],[DynStat.Lust(1)][2],[DynStat.Lust(1)][3],[DynStat.Lust(1)][4],[DynStat.Lust(1)][5],[DynStat.Lust(1)][6],[DynStat.Lust(1)][7],[DynStat.Lust(1)][8],[DynStat.Lust(1)][9],[DynStat.Lust(1)][10],[DynStat.Lust(1)][11],[DynStat.Lust(1)][12]);
               }
               else if(int([DynStat.Lust(1)].length) == 14)
               {
                  get_game().player.dynStats([DynStat.Lust(1)][0],[DynStat.Lust(1)][1],[DynStat.Lust(1)][2],[DynStat.Lust(1)][3],[DynStat.Lust(1)][4],[DynStat.Lust(1)][5],[DynStat.Lust(1)][6],[DynStat.Lust(1)][7],[DynStat.Lust(1)][8],[DynStat.Lust(1)][9],[DynStat.Lust(1)][10],[DynStat.Lust(1)][11],[DynStat.Lust(1)][12],[DynStat.Lust(1)][13]);
               }
               else if(int([DynStat.Lust(1)].length) == 15)
               {
                  get_game().player.dynStats([DynStat.Lust(1)][0],[DynStat.Lust(1)][1],[DynStat.Lust(1)][2],[DynStat.Lust(1)][3],[DynStat.Lust(1)][4],[DynStat.Lust(1)][5],[DynStat.Lust(1)][6],[DynStat.Lust(1)][7],[DynStat.Lust(1)][8],[DynStat.Lust(1)][9],[DynStat.Lust(1)][10],[DynStat.Lust(1)][11],[DynStat.Lust(1)][12],[DynStat.Lust(1)][13],[DynStat.Lust(1)][14]);
               }
               else if(int([DynStat.Lust(1)].length) == 16)
               {
                  get_game().player.dynStats([DynStat.Lust(1)][0],[DynStat.Lust(1)][1],[DynStat.Lust(1)][2],[DynStat.Lust(1)][3],[DynStat.Lust(1)][4],[DynStat.Lust(1)][5],[DynStat.Lust(1)][6],[DynStat.Lust(1)][7],[DynStat.Lust(1)][8],[DynStat.Lust(1)][9],[DynStat.Lust(1)][10],[DynStat.Lust(1)][11],[DynStat.Lust(1)][12],[DynStat.Lust(1)][13],[DynStat.Lust(1)][14],[DynStat.Lust(1)][15]);
               }
               else if(int([DynStat.Lust(1)].length) == 17)
               {
                  get_game().player.dynStats([DynStat.Lust(1)][0],[DynStat.Lust(1)][1],[DynStat.Lust(1)][2],[DynStat.Lust(1)][3],[DynStat.Lust(1)][4],[DynStat.Lust(1)][5],[DynStat.Lust(1)][6],[DynStat.Lust(1)][7],[DynStat.Lust(1)][8],[DynStat.Lust(1)][9],[DynStat.Lust(1)][10],[DynStat.Lust(1)][11],[DynStat.Lust(1)][12],[DynStat.Lust(1)][13],[DynStat.Lust(1)][14],[DynStat.Lust(1)][15],[DynStat.Lust(1)][16]);
               }
               else if(int([DynStat.Lust(1)].length) == 18)
               {
                  get_game().player.dynStats([DynStat.Lust(1)][0],[DynStat.Lust(1)][1],[DynStat.Lust(1)][2],[DynStat.Lust(1)][3],[DynStat.Lust(1)][4],[DynStat.Lust(1)][5],[DynStat.Lust(1)][6],[DynStat.Lust(1)][7],[DynStat.Lust(1)][8],[DynStat.Lust(1)][9],[DynStat.Lust(1)][10],[DynStat.Lust(1)][11],[DynStat.Lust(1)][12],[DynStat.Lust(1)][13],[DynStat.Lust(1)][14],[DynStat.Lust(1)][15],[DynStat.Lust(1)][16],[DynStat.Lust(1)][17]);
               }
               else if(int([DynStat.Lust(1)].length) == 19)
               {
                  get_game().player.dynStats([DynStat.Lust(1)][0],[DynStat.Lust(1)][1],[DynStat.Lust(1)][2],[DynStat.Lust(1)][3],[DynStat.Lust(1)][4],[DynStat.Lust(1)][5],[DynStat.Lust(1)][6],[DynStat.Lust(1)][7],[DynStat.Lust(1)][8],[DynStat.Lust(1)][9],[DynStat.Lust(1)][10],[DynStat.Lust(1)][11],[DynStat.Lust(1)][12],[DynStat.Lust(1)][13],[DynStat.Lust(1)][14],[DynStat.Lust(1)][15],[DynStat.Lust(1)][16],[DynStat.Lust(1)][17],[DynStat.Lust(1)][18]);
               }
               else
               {
                  if(int([DynStat.Lust(1)].length) != 20)
                  {
                     throw "Too many rest arguments";
                  }
                  get_game().player.dynStats([DynStat.Lust(1)][0],[DynStat.Lust(1)][1],[DynStat.Lust(1)][2],[DynStat.Lust(1)][3],[DynStat.Lust(1)][4],[DynStat.Lust(1)][5],[DynStat.Lust(1)][6],[DynStat.Lust(1)][7],[DynStat.Lust(1)][8],[DynStat.Lust(1)][9],[DynStat.Lust(1)][10],[DynStat.Lust(1)][11],[DynStat.Lust(1)][12],[DynStat.Lust(1)][13],[DynStat.Lust(1)][14],[DynStat.Lust(1)][15],[DynStat.Lust(1)][16],[DynStat.Lust(1)][17],[DynStat.Lust(1)][18],[DynStat.Lust(1)][19]);
               }
               get_player().set_lust(get_player().maxLust());
               statScreenRefresh();
               doNext(get_game().dungeons.deepcave.loseToThisShitPartII);
               return;
            }
            outputText("真菌突起物在你身上向上蠕动，那种湿润、温暖的压迫感带来的快感简直不讲道理。这感觉就像是洗了个热水澡再加上温柔的按摩，再结合空气中令人麻木的气味，你几乎无法抗拒地放松下来。几秒钟内，这团触手就钻进了你的[armor]下面，在你的胸部和" + get_player().nippleDescript(0) + "上摩擦。你被这种感觉迷得神魂颠倒，背靠在墙上，任由它们抚摸和爱抚你，挑逗着你敏感的[nipple]。");
            if(get_player().hasFuckableNipples())
            {
               outputText("随着入口为试探的触手敞开，你发情的证据从每个[nipple]中渗出。它们欢快地钻进去，开始操弄你的乳房，让你的快感加倍。");
            }
            outputText("呻吟声从你嘴里溢出，你的臀部开始随着触手的节奏和真菌肉荚脉动的光芒摇摆。在这里很容易迷失自我。你大声呻吟，声音大到足以让你自己回过神来。你必须逃出去！[pg]");
            outputText("那些没有忙于对付你" + get_player().allBreastsDescript() + "的触手已经爬得更高了，粘液也已经没过了你的腰部。如果说有什么不同的话，那就是它实际上让持续的侵犯变得更加强烈和令人放松。你开始沉沦其中，但你猛地清醒过来，把自己拉了回来。不！你必须战斗！");
            if(get_player().get_lust() < 85)
            {
               get_player().takeLustDamage(85 - get_player().get_lust(),true,false);
               statScreenRefresh();
            }
            outputText("\n");
         }
         if(!hasStatusEffect(StatusEffects.Round))
         {
            createStatusEffect(StatusEffects.Round,2,0,0,0);
         }
         else
         {
            addStatusValue(StatusEffects.Round,1,1);
         }
      }
      
      override public function defeated(param1:Boolean) : void
      {
         get_game().dungeons.deepcave.encapsulationVictory();
      }
   }
}

