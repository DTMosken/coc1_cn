package classes.scenes.dungeons.lethicesKeep
{
   import classes.Appearance;
   import classes.CoC;
   import classes.Creature;
   import classes.DynStat;
   import classes.Monster;
   import classes.PerkLib;
   import classes.Player;
   import classes.ReactionContext;
   import classes.StatusEffects;
   import classes.internals.Utils;
   import classes.scenes.combat.AvoidDamageParameters;
   import flash.Boot;
   
   public class SuccubusGardener extends Monster
   {
      
      public function SuccubusGardener()
      {
         if(Boot.skip_constructor)
         {
            return;
         }
         super();
         set_a("");
         set_short("succubus gardener");
         imageName = "succubusgardener";
         set_long("这只魅魔拥有你对她这个种族所期望的一切：能让女人嫉妒发狂的胸部，能融化传教士信念的腰臀，圆润得仿佛天生就该被揉捏的屁股，以及一张同时散发着诱惑与霸道笑容的迷人脸庞。她乌黑的头发如瀑布般垂落在闪耀着抛光象牙光泽的公羊角周围，红色的眼睛贪婪地注视着你的一举一动。她所穿的衣服只是为了增强她那猖獗的性感，不知为何，这让她看起来比一丝不挂还要赤裸。\n\n在她的身后，灌木丛本身已经活了过来，露出了具有非人力量的粗壮藤蔓，有些藤蔓的顶端还渗出液体，形似阳具。有几根藤蔓像你的手臂一样粗，顶端长着喘息着、肿胀的嘴唇，或者是紫色的、绽放的小穴。还有一些则没有任何装饰。这团植物毫无规律可言：只有一个主题，那就是猖獗、过度生长的性感，被催生到了淫秽的程度。");
         set_race("Demon");
         createVagina(false,3,3);
         createBreastRow(Appearance.breastCupInverse("FF"));
         ass.analLooseness = 3;
         ass.analWetness = 0;
         set_tallness(96);
         hips.rating = 4;
         butt.rating = 2;
         set_weaponName("tentacles");
         set_weaponVerb("lash");
         set_weaponAttack(22);
         normalAttackAvoid.doParry = false;
         normalAttackAvoid.doCounter = false;
         set_armorName("tentaclothes");
         initStrTouSpeInte(85,60,85,100);
         initLibSensCor(85,60,100);
         bonusHP = 600;
         set_fatigue(0);
         set_gems(50 + Utils.rand(33));
         level = 20;
         lustVuln = 0;
         set_drop(NO_DROP);
         checkMonster();
         createStatusEffect(StatusEffects.TentagrappleCooldown,10,0,0,0);
      }
      
      override public function won(param1:Boolean, param2:Boolean = false) : void
      {
         cleanupEffects();
         get_game().lethicesKeep.succubusGardener.surrenderToTheGardener(param1);
      }
      
      public function vineHeal() : void
      {
         if(!hasStatusEffect(StatusEffects.VineHealUsed))
         {
            createStatusEffect(StatusEffects.VineHealUsed,0,0,0,0);
         }
         if(!hasStatusEffect(StatusEffects.Stunned))
         {
            outputText("魅魔园丁向后倾倒，任由自己跌入身后蠕动的触手中，嘴巴大张着迎接。触手轻轻接住了她，并没有蹂躏她毫无防备的身体，而是聚集在她微张的双唇上方，滴下浓稠的粉色黏液。她吞咽着，喉咙上下滚动，伤势在几秒钟内便消失无踪。藤蔓将她推起，让她重新站稳。她笑得有些痴傻。");
            if(lustVuln <= 0.15)
            {
               outputText("<b>你不确定，但她似乎更加明目张胆地用色眯眯的眼神看着你了。</b>");
            }
            else if(lustVuln <= 0.45)
            {
               outputText("<b>她现在绝对是在色眯眯地盯着你。</b>");
            }
            else
            {
               outputText("<b>她用目光强暴你时，脸上那好色的表情根本掩饰不住。</b>");
            }
            if(lustVuln <= 0.3)
            {
               outputText("无论那治愈花蜜里有什么，肯定削弱了她的自控力。");
            }
         }
         else
         {
            outputText("在某种看不见的信号作用下，触手森林开始行动，用一层扭动的绿色面纱包围了它们失去知觉的女主人。透过翠绿面纱的缝隙，可以看到一束滴着粘液的藤蔓，极其小心地悬挂在它们的恶魔看护者上方，将粘稠的粉红色液体滴入她的嘴里。她的喉咙蠕动着吞咽下去，一秒钟后当她出现时，她的伤势已经消失，她的眼睛");
            if(lustVuln <= 0.15)
            {
               outputText("略显呆滞。");
            }
            else if(lustVuln <= 0.45)
            {
               outputText("更加呆滞了。");
            }
            else
            {
               outputText("瞳孔放大，反应有些迟钝。");
            }
            if(lustVuln <= 0.3)
            {
               outputText("无论那治愈花蜜里有什么，肯定削弱了她的自控力。");
            }
         }
         set_HP(maxHP());
         lustVuln += 0.3;
         set_fatigue(get_fatigue() + 5);
         if(get_fatigue() >= 100)
         {
            outputText("<b>看来藤蔓的粉色粘液已经用完了。</b>");
            set_fatigue(100);
         }
      }
      
      public function tentagrapple() : void
      {
         createStatusEffect(StatusEffects.TentagrappleCooldown,10,0,0,0);
         outputText("一张由交织的藤蔓组成的网从魅魔身后猛扑过来，不知为何，她却没有被这波推进的绿色植物触碰到。它们试图抓住你！");
         if(Boolean(combatAvoidDamage(new AvoidDamageParameters(true,false,false,null,null,null,null,null)).attackFailed))
         {
            outputText("你在最后一刻闪到一边，勉强避开了被这团蠕动的物体包裹。它猛地缩了回去，也许是到了它能够触及的极限，让你再次与这位迷人的园丁四目相对。");
         }
         else
         {
            outputText("你扭身躲避，但其中一根缠住了你的手腕。另一根绕住了你的[leg]，接着，如雪崩般渗出粘液的触手落在了你身体的其他部位，将你紧紧缠绕。它们的抓握力既像铁钳一般，又像情人的爱抚。你最好在它们真正开始对你下手之前挣脱出来！");
            get_player().createStatusEffect(StatusEffects.Tentagrappled,0,0,0,0);
         }
      }
      
      public function taunt() : void
      {
         outputText("[say:你指望怎么打败我，[name]？]这位有着绿色拇指的诱惑者歪着头问道。[say:你只有一个人，而我们有很多。你有着灵魂的脆弱和弱点。我拥有你无法理解的力量和经验。除了心甘情愿地屈服，你还能做什么？]她撅起丰满的嘴唇，思考着。[say:如果你心甘情愿地屈服，我会允许你把头靠在我的乳房之间，让我的植物以你为食。那将是一次相当不错的体验。]");
      }
      
      public function tasteTheEcstasy() : void
      {
         outputText("三根触手像有生命的肉矛一样向你刺来，但你轻松地躲开了它们……却直接撞进了魅魔的怀里！你这才意识到刚才的攻击只是佯攻，但为时已晚！她那巨大的乳房紧紧贴在你的背上，当她在你身上摩擦时，你感觉到一股湿润顺着你的[leg]流下。与此同时，她在你耳边低语：[say: 尝一口吧……体验一下这种狂喜。你会发现，沉迷其中是你所能做的最美好的事情。]");
         outputText("[pg]其中一根触手现在就在你的上方，它向下指着，形状明显像阴茎。末端的裂口张开，一团白色的粘液冒了出来。");
         if(Utils.rand(get_player().get_str() - 30) + 30 > get_str())
         {
            outputText("[pg]它在那里悬停了片刻，而魅魔猛地掰开你的嘴，刚好接住了那无疑被下了药的精液。它在你的舌头上几乎发出嘶嘶声，尝起来有杏仁和核桃的味道，还有明显的果味余香。你的嘴不由自主地把它吞了下去，随着意识逐渐清晰，你明白了魅魔为什么会对这些植物如此痴迷。当植物的精液被你的身体吸收时，你的下体急切地发热。你的瞳孔放大。天哪，感觉太棒了！");
            outputText("[pg]你甚至都没意识到这个诱惑者已经退开了。你怎么可能抵抗得了这个？");
            get_player().takeLustDamage(8 + (int(get_player().lib / 20 + get_player().cor / 25)),true);
            if(int([DynStat.Cor(5)].length) == 0)
            {
               get_game().player.dynStats();
            }
            else if(int([DynStat.Cor(5)].length) == 1)
            {
               get_game().player.dynStats([DynStat.Cor(5)][0]);
            }
            else if(int([DynStat.Cor(5)].length) == 2)
            {
               get_game().player.dynStats([DynStat.Cor(5)][0],[DynStat.Cor(5)][1]);
            }
            else if(int([DynStat.Cor(5)].length) == 3)
            {
               get_game().player.dynStats([DynStat.Cor(5)][0],[DynStat.Cor(5)][1],[DynStat.Cor(5)][2]);
            }
            else if(int([DynStat.Cor(5)].length) == 4)
            {
               get_game().player.dynStats([DynStat.Cor(5)][0],[DynStat.Cor(5)][1],[DynStat.Cor(5)][2],[DynStat.Cor(5)][3]);
            }
            else if(int([DynStat.Cor(5)].length) == 5)
            {
               get_game().player.dynStats([DynStat.Cor(5)][0],[DynStat.Cor(5)][1],[DynStat.Cor(5)][2],[DynStat.Cor(5)][3],[DynStat.Cor(5)][4]);
            }
            else if(int([DynStat.Cor(5)].length) == 6)
            {
               get_game().player.dynStats([DynStat.Cor(5)][0],[DynStat.Cor(5)][1],[DynStat.Cor(5)][2],[DynStat.Cor(5)][3],[DynStat.Cor(5)][4],[DynStat.Cor(5)][5]);
            }
            else if(int([DynStat.Cor(5)].length) == 7)
            {
               get_game().player.dynStats([DynStat.Cor(5)][0],[DynStat.Cor(5)][1],[DynStat.Cor(5)][2],[DynStat.Cor(5)][3],[DynStat.Cor(5)][4],[DynStat.Cor(5)][5],[DynStat.Cor(5)][6]);
            }
            else if(int([DynStat.Cor(5)].length) == 8)
            {
               get_game().player.dynStats([DynStat.Cor(5)][0],[DynStat.Cor(5)][1],[DynStat.Cor(5)][2],[DynStat.Cor(5)][3],[DynStat.Cor(5)][4],[DynStat.Cor(5)][5],[DynStat.Cor(5)][6],[DynStat.Cor(5)][7]);
            }
            else if(int([DynStat.Cor(5)].length) == 9)
            {
               get_game().player.dynStats([DynStat.Cor(5)][0],[DynStat.Cor(5)][1],[DynStat.Cor(5)][2],[DynStat.Cor(5)][3],[DynStat.Cor(5)][4],[DynStat.Cor(5)][5],[DynStat.Cor(5)][6],[DynStat.Cor(5)][7],[DynStat.Cor(5)][8]);
            }
            else if(int([DynStat.Cor(5)].length) == 10)
            {
               get_game().player.dynStats([DynStat.Cor(5)][0],[DynStat.Cor(5)][1],[DynStat.Cor(5)][2],[DynStat.Cor(5)][3],[DynStat.Cor(5)][4],[DynStat.Cor(5)][5],[DynStat.Cor(5)][6],[DynStat.Cor(5)][7],[DynStat.Cor(5)][8],[DynStat.Cor(5)][9]);
            }
            else if(int([DynStat.Cor(5)].length) == 11)
            {
               get_game().player.dynStats([DynStat.Cor(5)][0],[DynStat.Cor(5)][1],[DynStat.Cor(5)][2],[DynStat.Cor(5)][3],[DynStat.Cor(5)][4],[DynStat.Cor(5)][5],[DynStat.Cor(5)][6],[DynStat.Cor(5)][7],[DynStat.Cor(5)][8],[DynStat.Cor(5)][9],[DynStat.Cor(5)][10]);
            }
            else if(int([DynStat.Cor(5)].length) == 12)
            {
               get_game().player.dynStats([DynStat.Cor(5)][0],[DynStat.Cor(5)][1],[DynStat.Cor(5)][2],[DynStat.Cor(5)][3],[DynStat.Cor(5)][4],[DynStat.Cor(5)][5],[DynStat.Cor(5)][6],[DynStat.Cor(5)][7],[DynStat.Cor(5)][8],[DynStat.Cor(5)][9],[DynStat.Cor(5)][10],[DynStat.Cor(5)][11]);
            }
            else if(int([DynStat.Cor(5)].length) == 13)
            {
               get_game().player.dynStats([DynStat.Cor(5)][0],[DynStat.Cor(5)][1],[DynStat.Cor(5)][2],[DynStat.Cor(5)][3],[DynStat.Cor(5)][4],[DynStat.Cor(5)][5],[DynStat.Cor(5)][6],[DynStat.Cor(5)][7],[DynStat.Cor(5)][8],[DynStat.Cor(5)][9],[DynStat.Cor(5)][10],[DynStat.Cor(5)][11],[DynStat.Cor(5)][12]);
            }
            else if(int([DynStat.Cor(5)].length) == 14)
            {
               get_game().player.dynStats([DynStat.Cor(5)][0],[DynStat.Cor(5)][1],[DynStat.Cor(5)][2],[DynStat.Cor(5)][3],[DynStat.Cor(5)][4],[DynStat.Cor(5)][5],[DynStat.Cor(5)][6],[DynStat.Cor(5)][7],[DynStat.Cor(5)][8],[DynStat.Cor(5)][9],[DynStat.Cor(5)][10],[DynStat.Cor(5)][11],[DynStat.Cor(5)][12],[DynStat.Cor(5)][13]);
            }
            else if(int([DynStat.Cor(5)].length) == 15)
            {
               get_game().player.dynStats([DynStat.Cor(5)][0],[DynStat.Cor(5)][1],[DynStat.Cor(5)][2],[DynStat.Cor(5)][3],[DynStat.Cor(5)][4],[DynStat.Cor(5)][5],[DynStat.Cor(5)][6],[DynStat.Cor(5)][7],[DynStat.Cor(5)][8],[DynStat.Cor(5)][9],[DynStat.Cor(5)][10],[DynStat.Cor(5)][11],[DynStat.Cor(5)][12],[DynStat.Cor(5)][13],[DynStat.Cor(5)][14]);
            }
            else if(int([DynStat.Cor(5)].length) == 16)
            {
               get_game().player.dynStats([DynStat.Cor(5)][0],[DynStat.Cor(5)][1],[DynStat.Cor(5)][2],[DynStat.Cor(5)][3],[DynStat.Cor(5)][4],[DynStat.Cor(5)][5],[DynStat.Cor(5)][6],[DynStat.Cor(5)][7],[DynStat.Cor(5)][8],[DynStat.Cor(5)][9],[DynStat.Cor(5)][10],[DynStat.Cor(5)][11],[DynStat.Cor(5)][12],[DynStat.Cor(5)][13],[DynStat.Cor(5)][14],[DynStat.Cor(5)][15]);
            }
            else if(int([DynStat.Cor(5)].length) == 17)
            {
               get_game().player.dynStats([DynStat.Cor(5)][0],[DynStat.Cor(5)][1],[DynStat.Cor(5)][2],[DynStat.Cor(5)][3],[DynStat.Cor(5)][4],[DynStat.Cor(5)][5],[DynStat.Cor(5)][6],[DynStat.Cor(5)][7],[DynStat.Cor(5)][8],[DynStat.Cor(5)][9],[DynStat.Cor(5)][10],[DynStat.Cor(5)][11],[DynStat.Cor(5)][12],[DynStat.Cor(5)][13],[DynStat.Cor(5)][14],[DynStat.Cor(5)][15],[DynStat.Cor(5)][16]);
            }
            else if(int([DynStat.Cor(5)].length) == 18)
            {
               get_game().player.dynStats([DynStat.Cor(5)][0],[DynStat.Cor(5)][1],[DynStat.Cor(5)][2],[DynStat.Cor(5)][3],[DynStat.Cor(5)][4],[DynStat.Cor(5)][5],[DynStat.Cor(5)][6],[DynStat.Cor(5)][7],[DynStat.Cor(5)][8],[DynStat.Cor(5)][9],[DynStat.Cor(5)][10],[DynStat.Cor(5)][11],[DynStat.Cor(5)][12],[DynStat.Cor(5)][13],[DynStat.Cor(5)][14],[DynStat.Cor(5)][15],[DynStat.Cor(5)][16],[DynStat.Cor(5)][17]);
            }
            else if(int([DynStat.Cor(5)].length) == 19)
            {
               get_game().player.dynStats([DynStat.Cor(5)][0],[DynStat.Cor(5)][1],[DynStat.Cor(5)][2],[DynStat.Cor(5)][3],[DynStat.Cor(5)][4],[DynStat.Cor(5)][5],[DynStat.Cor(5)][6],[DynStat.Cor(5)][7],[DynStat.Cor(5)][8],[DynStat.Cor(5)][9],[DynStat.Cor(5)][10],[DynStat.Cor(5)][11],[DynStat.Cor(5)][12],[DynStat.Cor(5)][13],[DynStat.Cor(5)][14],[DynStat.Cor(5)][15],[DynStat.Cor(5)][16],[DynStat.Cor(5)][17],[DynStat.Cor(5)][18]);
            }
            else
            {
               if(int([DynStat.Cor(5)].length) != 20)
               {
                  throw "Too many rest arguments";
               }
               get_game().player.dynStats([DynStat.Cor(5)][0],[DynStat.Cor(5)][1],[DynStat.Cor(5)][2],[DynStat.Cor(5)][3],[DynStat.Cor(5)][4],[DynStat.Cor(5)][5],[DynStat.Cor(5)][6],[DynStat.Cor(5)][7],[DynStat.Cor(5)][8],[DynStat.Cor(5)][9],[DynStat.Cor(5)][10],[DynStat.Cor(5)][11],[DynStat.Cor(5)][12],[DynStat.Cor(5)][13],[DynStat.Cor(5)][14],[DynStat.Cor(5)][15],[DynStat.Cor(5)][16],[DynStat.Cor(5)][17],[DynStat.Cor(5)][18],[DynStat.Cor(5)][19]);
            }
         }
         else
         {
            outputText("[pg]这就是你需要加倍努力的全部警告。在肾上腺素飙升的驱使下，你在这个诱惑者给你喂下更多堕落之物前，挣脱了她的束缚。");
            outputText("[pg]她嘟起嘴。[say: 来嘛，就尝一口！]");
         }
      }
      
      override public function struggle() : void
      {
         var _loc1_:int = 0;
         if(get_player().hasStatusEffect(StatusEffects.Tentagrappled))
         {
            clearOutput();
            _loc1_ = int(get_player().statusEffectv1(StatusEffects.Tentagrappled));
            if(Utils.rand(get_player().get_str()) > get_str() / (1 + _loc1_ / 2))
            {
               outputText("你拼命地抓挠着包裹你身体的触手，对抗着紧紧箍住你四肢的铁钳般的抓握。你一次又一次地拉扯它们，最后用尽全力猛地一挣，终于摆脱了它们的控制！");
               get_player().removeStatusEffect(StatusEffects.Tentagrappled);
            }
            else
            {
               outputText("你拼命地抓挠着包裹你身体的触手，对抗着紧紧箍住你四肢的铁钳般的抓握。你一次又一次地拉扯它们");
               if(Utils.rand(2) == 0)
               {
                  outputText("，但是环绕着你的藤蔓把你勒得更紧了，它们在你的[skinFurScales]上扭动滑行，把你压得更紧。呼吸变得困难，但与此同时，其中一些藤蔓钻进了你的[armor]，以涂了油般的顺滑滑过你最敏感的地方，而其背后的力量更是让这种感觉变得更加令人兴奋。");
               }
               else
               {
                  outputText("。你清楚地感觉到植物团从各个角度压迫着你，对你倾注着如此强烈的关注，以至于它们威胁要挤出你身体里的每一丝呼吸。这根本无法忽视。你尽力呼吸，试图无视这起伏不定的爱意，但即使是你也无法否认它让你心跳加速的方式。");
               }
               get_player().addStatusValue(StatusEffects.Tentagrappled,1,1);
               if(!get_player().hasPerk(PerkLib.Juggernaut) && get_armorPerk() != "Heavy")
               {
                  get_player().takeDamage(75 + Utils.rand(15));
               }
               get_player().takeLustDamage(3 + Utils.rand(3),true);
               if(get_game().ceraphScene.hasBondage())
               {
                  get_player().takeLustDamage(7,true);
               }
            }
            tookAction = true;
         }
      }
      
      public function squeeze() : void
      {
         if(Utils.rand(2) == 0)
         {
            outputText("环绕着你的藤蔓把你勒得更紧了，它们在你的[skinFurScales]上扭动滑行，把你压得更紧。呼吸变得困难，但与此同时，其中一些藤蔓钻进了你的[armor]，以涂了油般的顺滑滑过你最敏感的地方，而其背后的力量更是让这种感觉变得更加令人兴奋。");
         }
         else
         {
            outputText("你清楚地感觉到植物团从各个角度压迫着你，对你倾注着如此强烈的关注，以至于它们威胁要挤出你身体里的每一丝呼吸。这根本无法忽视。你尽力呼吸，试图无视这起伏不定的爱意，但即使是你也无法否认它让你心跳加速的方式。");
         }
         get_player().addStatusValue(StatusEffects.Tentagrappled,1,1);
         if(!get_player().hasPerk(PerkLib.Juggernaut) && get_armorPerk() != "Heavy")
         {
            get_player().takeDamage(75 + Utils.rand(15));
         }
         get_player().takeLustDamage(3 + Utils.rand(3),true);
      }
      
      public function sicem() : void
      {
         var _loc3_:int = 0;
         outputText("园丁令人愉悦地抖动着身体，转了个圈，指向你的方向。[say: 咬[himHer]，宝贝们！]根本没有时间反驳，只有一波无情的绿色植物向你猛扑过来！");
         var _loc1_:Number = 0;
         var _loc2_:int = 0;
         while(_loc2_ < 10)
         {
            _loc3_ = _loc2_++;
            if(Boolean(combatAvoidDamage(new AvoidDamageParameters(true,false,false,null,null,null,null,null)).attackHit))
            {
               _loc1_ += 2 + Utils.rand(1 + get_player().lib / 20) + Utils.rand(1 + get_player().sens / 20);
            }
         }
         if(_loc1_ >= 0)
         {
            outputText("蜿蜒的植物触手像十几条小鞭子一样向你抽来！你本已做好迎接刺痛的准备，但当它们在最后一刻收回，性感地爱抚你最敏感的地方时，你有些吃惊！");
            get_player().takeLustDamage(_loc1_,true);
         }
         else
         {
            outputText("那些蜿蜒的植物触手像十几条小鞭子一样向你袭来，但不知怎么的，你竟然躲过了它们的每一次抽打！");
         }
      }
      
      public function showerDotEffect() : void
      {
         var _loc1_:int = 2 + Utils.rand(2);
         get_player().takeLustDamage(_loc1_,false);
         get_player().addStatusValue(StatusEffects.ShowerDotEffect,1,-1);
         if(get_player().get_lust100() < 50)
         {
            outputText("触手的淫液仍然覆盖着你——仍然在慢慢地唤起你的情欲。你现在还能很好地控制住。");
         }
         else if(get_player().get_lust100() < 60)
         {
            outputText("你试图从手掌上擦去一些芳香的精液，但你所做的只是把它抹到了你的[hips]上。");
            if(get_player().cor < 50)
            {
               outputText("你羞于承认");
            }
            else
            {
               outputText("你有些恼火地承认");
            }
            outputText("这感觉开始变得非常舒服。");
         }
         else if(get_player().get_lust100() < 70)
         {
            outputText("当被污染的触手的液体在你身上起作用时，你对包裹着你[skinFurScales]的温暖滑腻感发出呻吟。你无能为力，只能努力忍受。如果被淋透的感觉不是那么……火热就好了。如果你最终输了，你希望她能再来一次……");
         }
         else if(get_player().get_lust100() < 80)
         {
            outputText("当阴险的植物精液在你脆弱的[skindesc]上起作用时，你发出呜咽，以微小、坚持不懈的增量建立起致命的欲望。越来越难以集中注意力……越来越难以不去想那些触手在你体内和身上，抚摸你最私密的地方会有多舒服。");
         }
         else if(get_player().get_lust100() < 90)
         {
            outputText("你在原地颤抖，随着你的热情升至狂热的顶点，你茫然地跌跌撞撞。很快，你就会变得太兴奋而无法抵抗，当那发生时，那些触手就会占有你。最糟糕的部分？这对你来说开始听起来非常、非常……非常好。没有挣扎，没有紧张……只是屈服于你身体的渴望并享受它。");
         }
         else if(get_player().get_lust100() < 100)
         {
            outputText("哦哦哦，你现在很接近了。你能感觉到那种需求在你体内敲打，通过你的[skinFurScales]渗入，将你[legs]之间的火焰煽动成熊熊烈火，即使你想抵抗也无法抵抗。然后……然后你就可以自由地高潮了。你摇摇头。必须坚持住");
            if(get_player().hasCock())
            {
               outputText("，即使你坚挺的肉棒" + (int(get_player().cocks.length) > 1 ? "正在" : "正在") + "不受阻碍地滴下成串的先列腺液。");
            }
            else if(get_player().hasVagina())
            {
               outputText("湿透的阴户威胁着要" + (get_player().wetness() == 4 ? "淹没" : "进一步浸湿") + "你的[legs]。");
            }
            else
            {
               outputText("。");
            }
         }
         else
         {
            outputText("哦，操，现在已经无法抑制了。你就要这么做了，即使你想阻止也无能为力。你打算跪下，脱掉你的[armor]。你打算给这个美丽的女恶魔她想要的。你打算让她操你、使用你，只要她允许你高潮。只要你高潮了，你就会没事的，即使这意味着放弃打败莉希丝的机会。");
         }
         outputText(get_game().combat.getLustText(_loc1_));
         if(get_player().statusEffectv1(StatusEffects.ShowerDotEffect) < 0 && get_player().get_lust100() < 100)
         {
            get_player().removeStatusEffect(StatusEffects.ShowerDotEffect);
            outputText("[pg-]<b>植物精液的催情效果似乎已经消散了……</b>[pg]");
         }
      }
      
      public function sapSpeed() : void
      {
         outputText("在触手仆从的掩护下，园艺魅魔托起她的乳房，柔声说道：[say: 稍微慢一点，欣赏一下风景，不好吗？] 她用力一挤，闪烁的乳汁（或者是树液？）从她拉长的乳头中喷涌而出，化作连续的液柱射向你的[feet]。你在最后一刻试图躲避，但那液柱如影随形，最终在你身上覆盖了一层琥珀色的乳汁树液。");
         outputText("[pg]这种乳状粘合剂有效地减缓了你的动作。你再也不能那么灵活地躲闪了，但至少你能看着魅魔呻吟扭动，从她胀满的乳房里揉捏出最后几滴金色的液体。她一边看着你，一边微笑着舔去手指上残留的汁液。[say: 准备好放弃了吗？]");
         get_player().createOrFindStatusEffect(StatusEffects.GardenerSapSpeed);
      }
      
      override public function react(param1:ReactionContext) : Boolean
      {
         if(param1.index == 3)
         {
            if(get_player().hasStatusEffect(StatusEffects.Tentagrappled))
            {
               clearOutput();
               squeeze();
               tookAction = true;
               return false;
            }
         }
         return true;
      }
      
      override public function performCombatAction() : void
      {
         var _loc1_:* = null as Array;
         if(hasStatusEffect(StatusEffects.TentagrappleCooldown))
         {
            addStatusValue(StatusEffects.TentagrappleCooldown,1,-1);
            if(statusEffectv1(StatusEffects.TentagrappleCooldown) <= 0)
            {
               removeStatusEffect(StatusEffects.TentagrappleCooldown);
            }
         }
         if(get_player().hasStatusEffect(StatusEffects.ShowerDotEffect))
         {
            showerDotEffect();
            if(get_player().get_lust() >= get_player().maxLust())
            {
               return;
            }
         }
         if(HPRatio() <= 0.6 && get_fatigue() < 100)
         {
            vineHeal();
         }
         else if(!hasStatusEffect(StatusEffects.TentagrappleCooldown))
         {
            tentagrapple();
         }
         else if(!get_player().hasStatusEffect(StatusEffects.GardenerSapSpeed) && hasStatusEffect(StatusEffects.VineHealUsed))
         {
            sapSpeed();
         }
         else
         {
            _loc1_ = [sicem,corruptiveShower,lustAuraCast];
            if(get_lust() < 40)
            {
               _loc1_.push(taunt);
            }
            if(get_lust() >= 40)
            {
               _loc1_.push(motorboat);
            }
            if(get_lust() >= 40)
            {
               _loc1_.push(tasteTheEcstasy);
            }
            _loc1_[Utils.rand(int(_loc1_.length))]();
         }
         statScreenRefresh();
      }
      
      public function motorboat() : void
      {
         outputText("[say:哦，去他妈的，]女恶魔咆哮着，大步向前走去。[say:我们都需要这个，不是吗，宠物？]她滑入你的防线，将她下垂的巨乳压在你的脸上");
         if(get_player().get_tallness() <= get_tallness() - 6)
         {
            outputText("，尽管身高有差异，但不知怎么的，她还是够矮。");
         }
         else if(get_player().get_tallness() >= get_tallness() + 6)
         {
            outputText("，尽管身高有差距，但不知怎么的刚好够得着。");
         }
         outputText("它们是如此柔软，像枕头一样，让你忍不住享受它们贴在皮肤上的感觉，你深吸了一口满足的气息，然后才想起自己身在何处，挣扎着从那片乳白色的深谷中逃脱出来。");
         outputText("[pg]你的敌人咯咯笑着，给了你一个飞吻。她的乳头明显变硬了一点，不过话又说回来，你的也是。");
      }
      
      public function lustAuraCast() : void
      {
         outputText("女恶魔闭上眼睛，皱起眉头集中精神。随后那双红色的眼眸猛地睁大，她微笑着舔了舔嘴唇。她周围的空气变得更加温暖，也更加充满麝香的味道，仿佛她的存在让空气中都弥漫着情欲。");
         if(hasStatusEffect(StatusEffects.LustAura))
         {
            outputText("当空气中欲望的味道钻进你的体内时，你的眼神因突如其来的感觉而变得迷离。那强烈的气息很快消退，但它已经完成了它的使命。");
            get_player().takeLustDamage(8 + (int(get_player().lib / 20 + get_player().cor / 25)),true);
         }
         else
         {
            createStatusEffect(StatusEffects.LustAura,0,0,0,0);
         }
      }
      
      override public function handleStun() : Boolean
      {
         if(HPRatio() <= 0.6)
         {
            return true;
         }
         return Boolean(super.handleStun());
      }
      
      override public function defeated(param1:Boolean) : void
      {
         cleanupEffects();
         get_game().lethicesKeep.succubusGardener.fuckUpTheGardener(param1);
      }
      
      public function corruptiveShower() : void
      {
         outputText("魅魔举起双手，说道：[say:何不尝尝我提供的欢愉？]在她的上方，形成了一片由腐败、纠结的植物组成的顶篷，渗出明显的性液——既有男性的，也有女性的。精液和淫水像腐化的雨帘一样落下，它们的气味让空气中弥漫着令人陶醉的麝香。");
         if(Boolean(combatAvoidDamage(new AvoidDamageParameters(true,false,false,null,null,null,null,null)).attackFailed))
         {
            outputText("不知怎么的，你设法从那片有机的雨云下扭身躲开，没有沾染上一滴液体，尽管你的呼吸已经加快，而且不仅仅是因为体力的消耗。");
         }
         else
         {
            if(!get_player().hasStatusEffect(StatusEffects.ShowerDotEffect))
            {
               get_player().createStatusEffect(StatusEffects.ShowerDotEffect,3,0,0,0);
            }
            else
            {
               get_player().addStatusValue(StatusEffects.ShowerDotEffect,1,3);
            }
            outputText("你尽力躲避那灰白色的攻势，但你的努力是徒劳的。滑腻的液体溅射到你身上和周围，让地面变得如此湿滑，你差点摔倒。不幸的是，这危险的立足点给了园丁的植物充足的时间来完成它们邪恶的工作，将混合的黏液层层涂抹在你身上，直到你浑身滴水。你在失望和不断增长的性奋中呻吟，不舒服地意识到这些汁液在渗入你的皮肤时是如何刺激你的。");
         }
      }
      
      public function cleanupEffects() : void
      {
         if(get_player().hasStatusEffect(StatusEffects.Tentagrappled))
         {
            get_player().removeStatusEffect(StatusEffects.Tentagrappled);
         }
         if(get_player().hasStatusEffect(StatusEffects.ShowerDotEffect))
         {
            get_player().removeStatusEffect(StatusEffects.ShowerDotEffect);
         }
      }
   }
}

