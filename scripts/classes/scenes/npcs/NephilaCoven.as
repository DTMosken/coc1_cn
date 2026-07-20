package classes.scenes.npcs
{
   import classes.Appearance;
   import classes.CoC;
   import classes.DynStat;
   import classes.ItemType;
   import classes.Monster;
   import classes.PerkLib;
   import classes.Player;
   import classes.ReactionContext;
   import classes.StatusEffects;
   import classes._FlagDict.FlagDict_Impl_;
   import classes.internals.Utils;
   import classes.internals.WeightedChoice;
   import classes.items.ConsumableLib;
   import flash.Boot;
   import haxe.IMap;
   
   public class NephilaCoven extends Monster
   {
      
      public function NephilaCoven()
      {
         if(Boot.skip_constructor)
         {
            return;
         }
         super();
         set_a("");
         set_short("nephila coven sister");
         imageName = "nephilaCoven";
         set_long("这名络新妇集会姐妹几乎要撑破那件淫荡的白色修女服，她的黏液将衣服浸湿至透明。她那肥胖如牛般的乳房随着她的动作在肚子上剧烈晃动。她那两座肉山上渗出白色黏液的肉体闪烁着一层薄薄的汗光，诱惑着你伸手去抚摸和揉捏那滑溜溜的表面。她的眼睛是纯黑色的，尽管外表怪异，却流露出一种混合着愉悦和欲望的神情。这只黏液生物那流着口水的小穴里不仅漏出触手，还流出着淫液。");
         set_race("Goo-Girl");
         createVagina(false,5,3);
         createStatusEffect(StatusEffects.BonusVCapacity,20,0,0,0);
         createBreastRow(Appearance.breastCupInverse("I"));
         ass.analLooseness = 4;
         ass.analWetness = 0;
         createStatusEffect(StatusEffects.BonusACapacity,15,0,0,0);
         set_tallness(66);
         hips.rating = 10;
         butt.rating = 6;
         lowerBody.type = 8;
         skin.tone = "opaque white";
         hair.color = "opaque white";
         hair.length = 50;
         initStrTouSpeInte(65,40,80,80);
         initLibSensCor(75,15,100);
         set_weaponName("back tentacles");
         set_weaponVerb("tentacle strikes");
         set_weaponAttack(15);
         set_armorName("soaked nun\'s habit");
         bonusHP = 200;
         set_lust(30);
         lustVuln = 0.75;
         temperment = 2;
         level = 9;
         set_gems(Utils.rand(5) + 38);
         set_drop(new WeightedChoice().addMany(1,get_consumables().OVIELIX,get_consumables().LACTAID,get_consumables().LABOVA_,get_consumables().B__BOOK,get_consumables().SLIMYCL,null));
         special1 = nephilaCovenSpecial1;
         special2 = nephilaCovenSpecial2;
         special3 = nephilaCovenSpecial3;
         checkMonster();
      }
      
      override public function won(param1:Boolean, param2:Boolean = false) : void
      {
         if(param2)
         {
            outputText("[pg]你的敌人似乎还没有恶心到要离开的地步……");
            doNext(get_game().combat.endLustLoss);
         }
         else
         {
            get_game().nephilaCovenScene.nephilaCovenRapesYou();
         }
      }
      
      override public function struggle() : void
      {
         clearOutput();
         if(get_player().hasStatusEffect(StatusEffects.Bound))
         {
            outputText("你在紧紧的束缚中扭动，拼尽全力想要逃脱。");
            if(get_player().statusEffectv1(StatusEffects.Bound) - 1 <= 0)
            {
               outputText("随着你用力地扭动和拉扯，姐妹的触手突然松开并从你身上退去。你重获了自由");
               if(get_game().ceraphScene.hasBondage())
               {
                  outputText("，尽管你有些怀念那紧致黏滑的拥抱");
               }
               outputText("！");
               get_player().removeStatusEffect(StatusEffects.Bound);
            }
            else
            {
               outputText("尽管你疯狂挣扎，却几乎无法挣脱她紧致滑溜的拥抱。");
               if(get_game().ceraphScene.hasBondage())
               {
                  outputText("被如此有效地束缚让你感到燥热难耐，也许你该干脆接受它？");
               }
               get_player().addStatusValue(StatusEffects.Bound,1,-1);
               if(get_player().get_str() > 65 && Utils.rand(get_player().get_str()) > 45)
               {
                  outputText("尽管你没有挣脱，但你大力的挣扎似乎让她的抓握稍微松动了一些……");
                  get_player().addStatusValue(StatusEffects.Bound,1,-1);
               }
            }
            outputText("[pg]");
         }
      }
      
      override public function react(param1:ReactionContext) : Boolean
      {
         if(param1.index == 3)
         {
            clearOutput();
            if(get_player().hasStatusEffect(StatusEffects.Bound))
            {
               if(!get_player().hasPerk(PerkLib.NephilaArchQueen))
               {
                  outputText("[say: 何必抵抗呢？]她问道。[say: 我们还有那么多奇妙的东西要展示给你看。]");
               }
               else
               {
                  outputText("[say: 何必抵抗呢？]她问道。[say: 难道你不想进入<b>后续节目</b>吗？]");
               }
               if(get_game().ceraphScene.hasBondage())
               {
                  outputText("你在她的触手中扭动，变得越来越兴奋，希望这位姐妹能剥去你的护甲，向你展示她到底是什么意思。");
                  get_player().takeLustDamage(5,true);
               }
               get_player().takeLustDamage(get_player().lib / 20 + 5 + Utils.rand(5),true);
               outputText("[pg]");
               return false;
            }
         }
         return true;
      }
      
      override public function performCombatAction() : void
      {
         var _loc1_:Number = Utils.rand(4);
         if(get_player().hasStatusEffect(StatusEffects.Bound))
         {
            nephilaCovenSpecial2();
            return;
         }
         if(hasStatusEffect(StatusEffects.Uber))
         {
            nephilaCovenSpecial1();
            return;
         }
         var _loc2_:Number = _loc1_;
         if(_loc2_ == 0)
         {
            eAttack();
         }
         else if(_loc2_ == 1)
         {
            nephilaCovenSpecial1();
         }
         else if(_loc2_ == 2)
         {
            nephilaCovenSpecial2();
         }
         else if(_loc2_ == 3)
         {
            nephilaCovenSpecial3();
         }
         else
         {
            eAttack();
         }
      }
      
      public function nephilaCovenSpecial3() : void
      {
         if(get_lust100() >= 75)
         {
            outputText("络新妇集会姐妹张开双腿，将三根手指埋入她湿透的小穴中。她子宫里的触手随着她的刺激从小穴中伸出，然后缠绕在她的身体上，在她臃肿的身体上形成了一层由扭动、黏滑的附肢组成的糖衣。[pg]");
            outputText("史莱姆娘发出一声低沉的叹息，在触手退回体内时向你眨了眨眼。令人惊讶的是，在孩子们的服侍下，络新妇集会姐妹的身体似乎变得更强壮了。");
            XP += 10;
            level += 1;
            set_str(get_str() + 10);
            set_tou(get_tou() + 10);
            set_HP(get_HP() + 20);
            set_lust(33);
            if(int([DynStat.Lust(3)].length) == 0)
            {
               get_game().player.dynStats();
            }
            else if(int([DynStat.Lust(3)].length) == 1)
            {
               get_game().player.dynStats([DynStat.Lust(3)][0]);
            }
            else if(int([DynStat.Lust(3)].length) == 2)
            {
               get_game().player.dynStats([DynStat.Lust(3)][0],[DynStat.Lust(3)][1]);
            }
            else if(int([DynStat.Lust(3)].length) == 3)
            {
               get_game().player.dynStats([DynStat.Lust(3)][0],[DynStat.Lust(3)][1],[DynStat.Lust(3)][2]);
            }
            else if(int([DynStat.Lust(3)].length) == 4)
            {
               get_game().player.dynStats([DynStat.Lust(3)][0],[DynStat.Lust(3)][1],[DynStat.Lust(3)][2],[DynStat.Lust(3)][3]);
            }
            else if(int([DynStat.Lust(3)].length) == 5)
            {
               get_game().player.dynStats([DynStat.Lust(3)][0],[DynStat.Lust(3)][1],[DynStat.Lust(3)][2],[DynStat.Lust(3)][3],[DynStat.Lust(3)][4]);
            }
            else if(int([DynStat.Lust(3)].length) == 6)
            {
               get_game().player.dynStats([DynStat.Lust(3)][0],[DynStat.Lust(3)][1],[DynStat.Lust(3)][2],[DynStat.Lust(3)][3],[DynStat.Lust(3)][4],[DynStat.Lust(3)][5]);
            }
            else if(int([DynStat.Lust(3)].length) == 7)
            {
               get_game().player.dynStats([DynStat.Lust(3)][0],[DynStat.Lust(3)][1],[DynStat.Lust(3)][2],[DynStat.Lust(3)][3],[DynStat.Lust(3)][4],[DynStat.Lust(3)][5],[DynStat.Lust(3)][6]);
            }
            else if(int([DynStat.Lust(3)].length) == 8)
            {
               get_game().player.dynStats([DynStat.Lust(3)][0],[DynStat.Lust(3)][1],[DynStat.Lust(3)][2],[DynStat.Lust(3)][3],[DynStat.Lust(3)][4],[DynStat.Lust(3)][5],[DynStat.Lust(3)][6],[DynStat.Lust(3)][7]);
            }
            else if(int([DynStat.Lust(3)].length) == 9)
            {
               get_game().player.dynStats([DynStat.Lust(3)][0],[DynStat.Lust(3)][1],[DynStat.Lust(3)][2],[DynStat.Lust(3)][3],[DynStat.Lust(3)][4],[DynStat.Lust(3)][5],[DynStat.Lust(3)][6],[DynStat.Lust(3)][7],[DynStat.Lust(3)][8]);
            }
            else if(int([DynStat.Lust(3)].length) == 10)
            {
               get_game().player.dynStats([DynStat.Lust(3)][0],[DynStat.Lust(3)][1],[DynStat.Lust(3)][2],[DynStat.Lust(3)][3],[DynStat.Lust(3)][4],[DynStat.Lust(3)][5],[DynStat.Lust(3)][6],[DynStat.Lust(3)][7],[DynStat.Lust(3)][8],[DynStat.Lust(3)][9]);
            }
            else if(int([DynStat.Lust(3)].length) == 11)
            {
               get_game().player.dynStats([DynStat.Lust(3)][0],[DynStat.Lust(3)][1],[DynStat.Lust(3)][2],[DynStat.Lust(3)][3],[DynStat.Lust(3)][4],[DynStat.Lust(3)][5],[DynStat.Lust(3)][6],[DynStat.Lust(3)][7],[DynStat.Lust(3)][8],[DynStat.Lust(3)][9],[DynStat.Lust(3)][10]);
            }
            else if(int([DynStat.Lust(3)].length) == 12)
            {
               get_game().player.dynStats([DynStat.Lust(3)][0],[DynStat.Lust(3)][1],[DynStat.Lust(3)][2],[DynStat.Lust(3)][3],[DynStat.Lust(3)][4],[DynStat.Lust(3)][5],[DynStat.Lust(3)][6],[DynStat.Lust(3)][7],[DynStat.Lust(3)][8],[DynStat.Lust(3)][9],[DynStat.Lust(3)][10],[DynStat.Lust(3)][11]);
            }
            else if(int([DynStat.Lust(3)].length) == 13)
            {
               get_game().player.dynStats([DynStat.Lust(3)][0],[DynStat.Lust(3)][1],[DynStat.Lust(3)][2],[DynStat.Lust(3)][3],[DynStat.Lust(3)][4],[DynStat.Lust(3)][5],[DynStat.Lust(3)][6],[DynStat.Lust(3)][7],[DynStat.Lust(3)][8],[DynStat.Lust(3)][9],[DynStat.Lust(3)][10],[DynStat.Lust(3)][11],[DynStat.Lust(3)][12]);
            }
            else if(int([DynStat.Lust(3)].length) == 14)
            {
               get_game().player.dynStats([DynStat.Lust(3)][0],[DynStat.Lust(3)][1],[DynStat.Lust(3)][2],[DynStat.Lust(3)][3],[DynStat.Lust(3)][4],[DynStat.Lust(3)][5],[DynStat.Lust(3)][6],[DynStat.Lust(3)][7],[DynStat.Lust(3)][8],[DynStat.Lust(3)][9],[DynStat.Lust(3)][10],[DynStat.Lust(3)][11],[DynStat.Lust(3)][12],[DynStat.Lust(3)][13]);
            }
            else if(int([DynStat.Lust(3)].length) == 15)
            {
               get_game().player.dynStats([DynStat.Lust(3)][0],[DynStat.Lust(3)][1],[DynStat.Lust(3)][2],[DynStat.Lust(3)][3],[DynStat.Lust(3)][4],[DynStat.Lust(3)][5],[DynStat.Lust(3)][6],[DynStat.Lust(3)][7],[DynStat.Lust(3)][8],[DynStat.Lust(3)][9],[DynStat.Lust(3)][10],[DynStat.Lust(3)][11],[DynStat.Lust(3)][12],[DynStat.Lust(3)][13],[DynStat.Lust(3)][14]);
            }
            else if(int([DynStat.Lust(3)].length) == 16)
            {
               get_game().player.dynStats([DynStat.Lust(3)][0],[DynStat.Lust(3)][1],[DynStat.Lust(3)][2],[DynStat.Lust(3)][3],[DynStat.Lust(3)][4],[DynStat.Lust(3)][5],[DynStat.Lust(3)][6],[DynStat.Lust(3)][7],[DynStat.Lust(3)][8],[DynStat.Lust(3)][9],[DynStat.Lust(3)][10],[DynStat.Lust(3)][11],[DynStat.Lust(3)][12],[DynStat.Lust(3)][13],[DynStat.Lust(3)][14],[DynStat.Lust(3)][15]);
            }
            else if(int([DynStat.Lust(3)].length) == 17)
            {
               get_game().player.dynStats([DynStat.Lust(3)][0],[DynStat.Lust(3)][1],[DynStat.Lust(3)][2],[DynStat.Lust(3)][3],[DynStat.Lust(3)][4],[DynStat.Lust(3)][5],[DynStat.Lust(3)][6],[DynStat.Lust(3)][7],[DynStat.Lust(3)][8],[DynStat.Lust(3)][9],[DynStat.Lust(3)][10],[DynStat.Lust(3)][11],[DynStat.Lust(3)][12],[DynStat.Lust(3)][13],[DynStat.Lust(3)][14],[DynStat.Lust(3)][15],[DynStat.Lust(3)][16]);
            }
            else if(int([DynStat.Lust(3)].length) == 18)
            {
               get_game().player.dynStats([DynStat.Lust(3)][0],[DynStat.Lust(3)][1],[DynStat.Lust(3)][2],[DynStat.Lust(3)][3],[DynStat.Lust(3)][4],[DynStat.Lust(3)][5],[DynStat.Lust(3)][6],[DynStat.Lust(3)][7],[DynStat.Lust(3)][8],[DynStat.Lust(3)][9],[DynStat.Lust(3)][10],[DynStat.Lust(3)][11],[DynStat.Lust(3)][12],[DynStat.Lust(3)][13],[DynStat.Lust(3)][14],[DynStat.Lust(3)][15],[DynStat.Lust(3)][16],[DynStat.Lust(3)][17]);
            }
            else if(int([DynStat.Lust(3)].length) == 19)
            {
               get_game().player.dynStats([DynStat.Lust(3)][0],[DynStat.Lust(3)][1],[DynStat.Lust(3)][2],[DynStat.Lust(3)][3],[DynStat.Lust(3)][4],[DynStat.Lust(3)][5],[DynStat.Lust(3)][6],[DynStat.Lust(3)][7],[DynStat.Lust(3)][8],[DynStat.Lust(3)][9],[DynStat.Lust(3)][10],[DynStat.Lust(3)][11],[DynStat.Lust(3)][12],[DynStat.Lust(3)][13],[DynStat.Lust(3)][14],[DynStat.Lust(3)][15],[DynStat.Lust(3)][16],[DynStat.Lust(3)][17],[DynStat.Lust(3)][18]);
            }
            else
            {
               if(int([DynStat.Lust(3)].length) != 20)
               {
                  throw "Too many rest arguments";
               }
               get_game().player.dynStats([DynStat.Lust(3)][0],[DynStat.Lust(3)][1],[DynStat.Lust(3)][2],[DynStat.Lust(3)][3],[DynStat.Lust(3)][4],[DynStat.Lust(3)][5],[DynStat.Lust(3)][6],[DynStat.Lust(3)][7],[DynStat.Lust(3)][8],[DynStat.Lust(3)][9],[DynStat.Lust(3)][10],[DynStat.Lust(3)][11],[DynStat.Lust(3)][12],[DynStat.Lust(3)][13],[DynStat.Lust(3)][14],[DynStat.Lust(3)][15],[DynStat.Lust(3)][16],[DynStat.Lust(3)][17],[DynStat.Lust(3)][18],[DynStat.Lust(3)][19]);
            }
            outputText("\n");
            return;
         }
         var _loc1_:Number = 0;
         outputText("史莱姆娘将身体向前倾，向前翻滚，并向你甩出她的触手头发，触手在空中来回穿梭，划破空气，滴落着黏液。眨眼间，她连续快速地抽打了两次！\n");
         createStatusEffect(StatusEffects.Attacks,2,0,0,0);
         eAttack();
      }
      
      public function nephilaCovenSpecial2() : void
      {
         if(!get_player().hasStatusEffect(StatusEffects.Bound))
         {
            outputText("络新妇集会姐妹的触手如闪电般向你袭来。你无法躲避她快得令人目眩的攻击，发现自己从头到脚都被她黏糊糊的触手肉体缠住了。她将你被束缚的身体拉向她，把你的脸按进她那看起来像怀孕一样鼓胀的黏液肚子里，但并没有伤害你。");
            if(get_game().ceraphScene.hasBondage())
            {
               outputText("[say: 噢，]她说道，[say: 看来有人很高兴见到我呢。]");
               get_player().takeLustDamage(5,true);
            }
            get_player().createStatusEffect(StatusEffects.Bound,2 + Utils.rand(5),0,0,0);
         }
         else if(Utils.rand(2) == 0)
         {
            outputText("络新妇集会姐妹依偎着你，温柔地拥抱着你。她那异常丰满的胸部挤压着你的侧腹，黏糊糊的肉体蔓延到你的[skindesc]上。她的双手在你被束缚的身体上滑动，悄悄伸进你的[armor]下，在你任她摆布时更加亲密地抚摸你。");
            get_player().takeLustDamage(9 + get_player().sens / 10,true);
         }
         else
         {
            outputText("络新妇集会姐妹在你的耳边吹着热吻，在你身上滑动摩擦，滑过来拥抱你的正面。她深情地抚摸着你被黏液胀满的子宫，在你的[skindesc]上留下黏液的痕迹。她的黏液像水浸入海绵一样渗入你身体的感觉，让人极度兴奋。");
            if(get_player().get_lust() < 33)
            {
               outputText("这让你感到浑身发热，面红耳赤。");
            }
            else if(get_player().get_lust() < 60)
            {
               outputText("它进入你的体内，让你兴奋起来，煽动着你欲望的火焰。");
            }
            else if(get_player().get_lust() < 80)
            {
               outputText("这让你欲火焚身，你开始怀疑是否还值得抵抗。");
            }
            else
            {
               outputText("这让你因渴望而疼痛颤抖，简直是在乞求下一次抚摸。");
            }
            get_player().takeLustDamage(5 + get_player().cor / 10 + get_player().lib / 20,true);
         }
      }
      
      public function nephilaCovenSpecial1() : void
      {
         if(!hasStatusEffect(StatusEffects.Uber))
         {
            if(Utils.rand(2) == 0)
            {
               outputText("络新妇集会姐妹用她的触手抚摸着你那丰饶的身体。[say: 真美，]她说。[say: 你比我想象的要大得多。][pg]");
            }
            else
            {
               outputText("络新妇集会姐妹揉着她那肿胀、凝胶状的肚子。[say: 这是你的杰作，母亲大人，]她说。[saystart]你把我们塞满了你的孩子，我们都");
               if(!get_player().hasPerk(PerkLib.NephilaArchQueen))
               {
                  outputText("</i>非常、非常兴奋<i>终于能见到您了。[sayend][pg]");
               }
               else
               {
                  outputText("</i>非常<i>高兴我们的生命中能有您。[sayend][pg]");
               }
            }
            outputText("她翻身趴下，张开双腿向你展示她那渗出液体的阴部，并开始用她粗壮的背部触手扩张自己。[say: 我准备好了，母亲大人，]她说，[say: 您呢？]一群五颜六色的粘液触手从她那被蹂躏的阴户中挤出，以淫秽的方式抓住史莱姆女孩粗壮的背部触手。");
            createStatusEffect(StatusEffects.Uber,0,0,0,0);
         }
         else if(statusEffectv1(StatusEffects.Uber) == 0)
         {
            addStatusValue(StatusEffects.Uber,1,1);
            if(Utils.rand(2) == 0)
            {
               outputText("看起来像天使一样的史莱姆女孩呻吟着，向后倒在她的背部触手上，紧紧抓住她那淫秽的乳房和孕育着生命的隆起。她的肚子因强烈的内部活动而剧烈晃动，然后在一阵短暂的喷发中向外凸起，停下来时比以前大得多。");
            }
            else
            {
               outputText("史莱姆在攻击中途停了下来，呻吟着跪倒在地，当它在地上汇聚成一滩时，让你清楚地看到了它那疯狂的肚子。它向外膨胀，晃动着，最后停下来时比以前大得多。");
            }
            outputText("<b>她的肚子发出不祥的呻吟声，你心中充满了强烈的不安。</b>");
            if(get_player().get_inte() > 50)
            {
               outputText("你最好等一下，这样你才有机会避开即将到来的东西。");
            }
         }
         else
         {
            removeStatusEffect(StatusEffects.Uber);
            if(FlagDict_Impl_.arrayReadInt(get_flags(),22) == 1)
            {
               outputText("她那嘎吱作响、黏糊糊的肚子终于承受不住内部巨大的压力，在一团蠕动的触手和白色史莱姆中爆炸开来。多亏了你的谨慎，你成功躲开了喷射物[pg]");
               outputText("那些受挫的触手爬回正在重组身体的络新妇集会姐妹那里。她叹了口气，问道：[say: 你为什么要躲开？那会让你感觉超——爽的！]");
            }
            else
            {
               outputText("你无视了脑海深处担忧的声音，向前猛扑，击中了络新妇集会姐妹那嘎吱作响的肚子。不堪重负的器官在一团蠕动的触手和白色史莱姆中爆炸开来。由于你将太多的精力投入到攻击中，你根本没有机会有效地躲避爆炸。你被正面击中。被触手覆盖的你，身体的每一寸都在被蹂躏时嗡嗡作响，你在性愉悦中扭动和抽搐。爆炸的史莱姆重组了自己，恢复到原来的大小，然后走向你被束缚和抽搐的身体。");
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
         }
      }
      
      override public function defeated(param1:Boolean) : void
      {
         get_game().nephilaCovenScene.winRapeChoices();
      }
   }
}

