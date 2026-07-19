package classes.scenes.npcs
{
   import classes.Appearance;
   import classes.CoC;
   import classes.CockTypesEnum;
   import classes.DynStat;
   import classes.Monster;
   import classes.Player;
   import classes.ReactionContext;
   import classes.StatusEffects;
   import classes._FlagDict.FlagDict_Impl_;
   import classes.display.SpriteDb;
   import classes.internals.Utils;
   import flash.Boot;
   import haxe.IMap;
   
   public class Ceraph extends Monster
   {
      
      public function Ceraph()
      {
         if(Boot.skip_constructor)
         {
            return;
         }
         super();
         set_a("");
         set_short("Ceraph");
         imageName = "ceraph";
         set_long("公共汽车塞拉芙一丝不挂，并沉醉其中。她那大而挺拔的双乳随着她的动作在胸前剧烈地晃动。她那两座完美无瑕的紫色肉丘上闪烁着一层薄薄的汗水，诱惑着你去触摸，让你的手指在它们光滑的表面上摩擦。她的眼睛是纯黑色的，尽管外表怪异，却传达出一种混合着愉悦和欲望的神情。这个恶魔的胯部是两性的结合——一个流着淫液的小穴，上面顶着一根粗壮的恶魔肉棒，从本该是阴蒂的地方长出来。");
         set_race("Demon");
         createCock(10,2,CockTypesEnum.DEMON);
         createVagina(false,5,3);
         createStatusEffect(StatusEffects.BonusVCapacity,20,0,0,0);
         createBreastRow(Appearance.breastCupInverse("E"));
         ass.analLooseness = 4;
         ass.analWetness = 0;
         createStatusEffect(StatusEffects.BonusACapacity,15,0,0,0);
         set_tallness(66);
         hips.rating = 10;
         butt.rating = 6;
         lowerBody.type = 5;
         skin.tone = "purple";
         hair.color = "black";
         hair.length = 20;
         initStrTouSpeInte(65,40,80,80);
         initLibSensCor(75,15,100);
         set_weaponName("flaming whip");
         set_weaponVerb("flame-whip");
         normalAttackAvoid.doParry = false;
         normalAttackAvoid.doCounter = false;
         set_weaponAttack(15);
         set_armorName("demon-skin");
         bonusHP = 200;
         set_lust(30);
         lustVuln = 0.75;
         temperment = 2;
         level = 9;
         set_gems(Utils.rand(5) + 38);
         set_drop(NO_DROP);
         special1 = ceraphSpecial1;
         special2 = ceraphSpecial2;
         special3 = ceraphSpecial3;
         checkMonster();
      }
      
      override public function won(param1:Boolean, param2:Boolean = false) : void
      {
         if(param2)
         {
            outputText("[pg]你的敌人似乎并没有觉得恶心到要离开……");
            doNext(get_game().combat.endLustLoss);
         }
         else
         {
            get_game().ceraphScene.loseFUCKME();
         }
      }
      
      override public function struggle() : void
      {
         clearOutput();
         if(get_player().hasStatusEffect(StatusEffects.Bound))
         {
            outputText("你在紧绷的束缚中扭动，拼尽全力想要逃脱。");
            if(get_player().statusEffectv1(StatusEffects.Bound) - 1 <= 0)
            {
               outputText("伴随着一次用力的扭动和拉扯，鞭子突然松开，从你身上解开了。你重获自由");
               if(get_game().ceraphScene.hasBondage())
               {
                  outputText("，尽管你有些怀念那紧致的皮革拥抱");
               }
               outputText("！");
               get_player().removeStatusEffect(StatusEffects.Bound);
            }
            else
            {
               outputText("尽管你疯狂挣扎，但你所能做的只是在紧绷的皮鞭上摩擦。");
               if(get_game().ceraphScene.hasBondage())
               {
                  outputText("被如此有效地束缚让你感到燥热难耐，也许你该直接接受它？");
               }
               get_player().addStatusValue(StatusEffects.Bound,1,-1);
               if(get_player().get_str() > 65 && Utils.rand(get_player().get_str()) > 45)
               {
                  outputText("虽然你没有挣脱，但你大力的挣扎似乎让鞭子稍微松了一些……");
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
               outputText("为什么要抵抗呢？皮革紧紧包裹着你，勒进你的[skindesc]的感觉令人陶醉。");
               if(get_game().ceraphScene.hasBondage())
               {
                  outputText("你在束缚中扭动，变得越来越兴奋，希望塞拉芙能剥去你的盔甲，强迫你作为她被束缚的裸体宠物四处游街。");
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
            ceraphSpecial2();
            return;
         }
         if(hasStatusEffect(StatusEffects.Uber))
         {
            ceraphSpecial1();
            return;
         }
         var _loc2_:Number = _loc1_;
         if(_loc2_ == 0)
         {
            eAttack();
         }
         else if(_loc2_ == 1)
         {
            ceraphSpecial1();
         }
         else if(_loc2_ == 2)
         {
            ceraphSpecial2();
         }
         else if(_loc2_ == 3)
         {
            ceraphSpecial3();
         }
         else
         {
            eAttack();
         }
      }
      
      override public function defeated(param1:Boolean) : void
      {
         get_game().ceraphScene.winRapeChoices();
      }
      
      public function ceraphSpecial3() : void
      {
         if(get_lust100() >= 75)
         {
            outputText("塞拉芙张开双腿，将三根手指埋入她湿透的小穴中，拇指用力地摩擦着她那凹凸不平的肉棒根部。她的另一只手握住那根肉棒，开始快速套弄。在一个熟练的动作中，她停下套弄，将鞭子缠绕在她布满结节的恶魔肉棒上，把它当作阴茎环使用。由于血液被迫流动，器官膨胀起来，在经过几秒钟激烈的自慰后，女恶魔高潮了。她的小穴喷得满手都是，清澈的女性淫液顺着她的大腿滴落。塞拉芙的男性器官脉动着、抽搐着，喷射出两股浓稠的精液，然后才减缓成涓涓细流。\n");
            outputText("恶魔发出一声沙哑的叹息，解开了她自己造成的束缚，并向你眨了眨眼。你真的就站在那里看完了全程吗？令人惊讶的是，在这样粗俗的展示之后，塞拉芙似乎变得更强了……");
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
         outputText("女恶魔在空中挥舞着她的鞭子，你几乎能听到它像蛇一样滑行的声音，在来回挥舞时划破空气，上面依然闪烁着魔法火焰。眨眼间，她连续快速地抽打了两次！\n");
         createStatusEffect(StatusEffects.Attacks,2,0,0,0);
         eAttack();
      }
      
      public function ceraphSpecial2() : void
      {
         if(!get_player().hasStatusEffect(StatusEffects.Bound))
         {
            outputText("塞拉芙快如闪电般地向你挥舞鞭子。你无法躲避她那令人眼花缭乱的攻击速度，发现自己从头到脚都被她那结实的皮鞭缠住了。值得注意的是，鞭子触碰到你的地方，火焰都熄灭了，让你被束缚但毫发无损。");
            if(get_game().ceraphScene.hasBondage())
            {
               outputText("天哪，这让你欲火焚身！");
               get_player().takeLustDamage(5,true);
            }
            get_player().createStatusEffect(StatusEffects.Bound,2 + Utils.rand(5),0,0,0);
         }
         else if(Utils.rand(2) == 0)
         {
            outputText("塞拉芙依偎着你，温柔地拥抱着你。她那丰满的胸部压在你的侧腹上，她的恶魔肉棒在你的[skindesc]上摩擦着，把她的淫液涂抹在上面。她的双手滑过你被束缚的身体，潜入你的[armor]下面，在你任她摆布的时候更亲密地抚摸你。");
            get_player().takeLustDamage(9 + get_player().sens / 10,true);
         }
         else
         {
            outputText("塞拉芙在你的耳边吹着热吻，在滑过来拥抱你的正面时，在你身上滑动和摩擦。她举起一根手指，舔了舔，然后来回摆动。它开始发出粉红色的光芒，起初很暗淡，然后亮度不断增加。当它达到耀眼的强度时，这根闪闪发光的手指被粗暴地插入你的嘴里。你能感觉到黑暗魔法渗透进你的身体，就像水渗入海绵一样。");
            if(get_player().get_lust() < 33)
            {
               outputText("这让你感到温暖和脸红。");
            }
            else if(get_player().get_lust() < 60)
            {
               outputText("它钻进你的体内，让你兴奋起来，煽动着你欲望的火焰。");
            }
            else if(get_player().get_lust() < 80)
            {
               outputText("它让你非常饥渴，你开始怀疑是否值得抵抗。");
            }
            else
            {
               outputText("它让你因渴望而疼痛颤抖，几乎在乞求下一次的抚摸。");
            }
            get_player().takeLustDamage(5 + get_player().cor / 10 + get_player().lib / 20,true);
         }
      }
      
      public function ceraphSpecial1() : void
      {
         get_game().spriteSelect(SpriteDb.get_s_ceraph());
         if(!hasStatusEffect(StatusEffects.Uber))
         {
            if(Utils.rand(2) == 0)
            {
               outputText("塞拉芙眨了眨眼，说道：[say:你有没有在不被触碰的情况下高潮过？你会的。][pg]");
            }
            else
            {
               outputText("塞拉芙窃笑着，[say:让我向你展示双性魅魔的真正力量。][pg]");
            }
            outputText("尽管她风情万种地挑逗着你，但你能看出来她正在酝酿什么大招……");
            createStatusEffect(StatusEffects.Uber,0,0,0,0);
         }
         else if(statusEffectv1(StatusEffects.Uber) == 0)
         {
            addStatusValue(StatusEffects.Uber,1,1);
            if(Utils.rand(2) == 0)
            {
               outputText("这个恶魔双性人开始在她面前的空气中绘制恶魔符号，每一个都闪烁着明亮的粉红色光芒，然后在一片朦胧中模糊消散。");
            }
            else
            {
               outputText("这个女恶魔用双手做出淫秽的动作，仿佛在手淫一根想象中的阴茎或阴道，而她的双手则被粉红色的火焰环绕着。");
            }
            outputText("<b>她要释放什么大招了！</b>");
            if(get_player().get_inte() > 50)
            {
               outputText("你最好等待一下，这样你才有机会躲避即将到来的攻击。");
            }
         }
         else
         {
            removeStatusEffect(StatusEffects.Uber);
            if(FlagDict_Impl_.arrayReadInt(get_flags(),22) == 1)
            {
               outputText("她猛地伸出双手，手心朝向你，一股粉红色的火焰向你席卷而来。多亏了你决定等待，你轻松地躲过了汹涌的火焰和她的攻击。[pg]");
               outputText("塞拉芙叹了口气，问道：[say:你为什么要躲开？那会让你感觉超级舒服的！]");
            }
            else
            {
               outputText("她猛地伸出双手，手心朝向你，一股粉红色的火焰向你席卷而来。你正忙于自己的攻击，无法有效躲闪，被粉红色的火焰结结实实地击中了。令人难以置信的是，它并没有燃烧。火焰似乎真的流进了你的体内，消失在你的皮肤里。你踉跄了一下，困惑了一秒钟，但随后它就击中了你。你身体的每一寸都在因快感而嗡嗡作响，几乎在性愉悦中扭动和抽搐。你瘫倒在地，抽搐着，喘息着，感觉到持续不断的性释放感从你的头部一直蔓延到你的[feet]。你太饥渴、太舒服了，无法抗拒，你躺下来颤抖着，偶尔摩擦自己以增强这种极乐感。");
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
   }
}

