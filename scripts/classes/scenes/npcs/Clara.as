package classes.scenes.npcs
{
   import classes.Appearance;
   import classes.CoC;
   import classes.Monster;
   import classes.PerkLib;
   import classes.Player;
   import classes.StatusEffects;
   import classes.internals.MonsterAI;
   import classes.internals.Utils;
   import classes.scenes.combat.CombatRange;
   import flash.Boot;
   
   public class Clara extends Monster
   {
      
      public function Clara()
      {
         if(Boot.skip_constructor)
         {
            return;
         }
         super();
         set_a("");
         set_short("Clara");
         imageName = "marble";
         set_long("你正在和玛布尔的妹妹克拉拉战斗！这个牛娘看起来气疯了，决心要把你从她姐姐那里抢走，让你成为她的产奶奴隶，她的乳房露在外面，所有人都能看到。幸运的是，她看起来没有她姐姐那么高大强壮，你也不认为她像玛布尔那样受过战斗训练。尽管如此，谁也说不准她有什么花招，而且她手里还拿着一把看起来非常凶狠的重型狼牙棒。");
         set_race("Cow-Girl");
         createVagina(false,1,1);
         createBreastRow(Appearance.breastCupInverse("F"));
         ass.analLooseness = 0;
         ass.analWetness = 0;
         set_tallness(76);
         hips.rating = 10;
         butt.rating = 8;
         lowerBody.type = 1;
         skin.tone = "pale";
         hair.color = "brown";
         hair.length = 13;
         initStrTouSpeInte(37,55,35,60);
         initLibSensCor(25,45,40);
         set_weaponName("mace");
         set_weaponVerb("smack");
         set_weaponAttack(10);
         set_armorName("tough hide");
         set_armorDef(5);
         temperment = 2;
         level = 5;
         bonusHP = 30;
         set_gems(Utils.rand(5) + 25);
         set_drop(NO_DROP);
         tail.type = 4;
         checkMonster();
      }
      
      override public function won(param1:Boolean, param2:Boolean = false) : void
      {
         get_game().marblePurification.loseToClara();
      }
      
      override public function performCombatAction() : void
      {
         var _loc1_:MonsterAI = new MonsterAI();
         if(get_player().hasStatusEffect(StatusEffects.ClaraFoughtInCamp) && get_player().statusEffectv1(StatusEffects.ClaraCombatRounds) >= 10)
         {
            set_HP(0);
         }
         if(get_HP() < 50 && Utils.rand(2) == 0)
         {
            notMurbleEnjoysTheLacticAcid();
         }
         else if(get_player().hasStatusEffect(StatusEffects.Blind))
         {
            claraGropesBlindPCs();
         }
         else
         {
            _loc1_.add(eAttack,1,true,0,FATIGUE_NONE,CombatRange.Melee);
            _loc1_.add(claraDrugAttack,1,true,5,FATIGUE_PHYSICAL,CombatRange.Ranged);
            _loc1_.add(claraTeaseAttack,1,true,0,FATIGUE_NONE,CombatRange.Tease);
            _loc1_.add(claraCastsBlind,1,true,10,FATIGUE_MAGICAL,CombatRange.Ranged);
            _loc1_.exec();
         }
         if(!get_player().hasStatusEffect(StatusEffects.ClaraCombatRounds))
         {
            get_player().createStatusEffect(StatusEffects.ClaraCombatRounds,1,0,0,0);
         }
         else
         {
            get_player().addStatusValue(StatusEffects.ClaraCombatRounds,1,1);
         }
         if(get_HP() > 0 && get_lust() < maxLust() && !get_player().hasStatusEffect(StatusEffects.ClaraFoughtInCamp))
         {
            claraBonusBaseLustDamage();
         }
      }
      
      public function notMurbleEnjoysTheLacticAcid() : void
      {
         outputText("克拉拉突然开始粗暴地揉捏她的乳房，大声地把它塞进嘴里，开始吸吮和流口水。泡沫状的乳汁很快弄脏了她的嘴，她松开乳房，让它落回原处。她打了个嗝，摆出姿势再次准备防御；你可以看到你造成的伤害实际上正在消退，因为她乳汁的治愈力量充满了她。");
         set_HP(get_HP() + 45);
         set_lust(get_lust() + 5);
         get_player().takeLustDamage(5 + get_player().lib / 5,true);
      }
      
      override public function defeated(param1:Boolean) : void
      {
         if(!(get_player().hasStatusEffect(StatusEffects.ClaraFoughtInCamp) && get_player().statusEffectv1(StatusEffects.ClaraCombatRounds) >= 10))
         {
            clearOutput();
            if(get_HP() <= 0)
            {
               outputText("气急败坏的牛娘终于瘫倒在地。她试图再次站起来，却发现自己做不到。[say: 不！]她沮丧地哭喊着，[say: 你是完美的奴隶！我们注定要在一起的！][pg]");
            }
            else
            {
               outputText("愤怒和狂躁最终屈服于你帮克拉拉唤起的压倒性情欲。她再也无法战斗，一屁股跌坐在地上。她开始抚摸自己，拼命地求你操她。[pg]");
            }
         }
         get_game().marblePurification.defeatClaraCuntInAFight();
      }
      
      public function claraTeaseAttack() : void
      {
         if(Utils.rand(3) == 0)
         {
            outputText("克拉拉犹豫了一下，然后撩起裙子，向你展示她的女性私处。接着她缓缓说道：[say: 你知道吗，我还是个处女。你将是第一个进入这个小穴的人，这是玛布尔永远给不了你的。]那会是什么感觉呢？你恍惚了片刻，随后回过神来，努力将注意力重新集中在战斗上。");
         }
         else if(Utils.rand(2) == 0)
         {
            outputText("克拉拉似乎放松了片刻，双手托着乳房颠了颠。[say: 来吧，你知道喝牛娘的奶有多爽，放弃抵抗吧！]她娇声劝诱道。你情不自禁地回想起那种滋味，发现自己竟然被唤起了性欲。");
         }
         else
         {
            outputText("克拉拉没有攻击，而是用双手在自己身上游走，凸显出她所有的曲线。[say: 你天生就是做产奶奴隶的料，别再反抗了！]她几乎是气急败坏地说。即便如此，你的目光还是不由自主地在那些曲线上流连。");
         }
         get_player().takeLustDamage(5 + get_player().lib / 20,true);
      }
      
      public function claraGropesBlindPCs() : void
      {
         if(get_player().hasCock() && (!get_player().hasVagina() || Utils.rand(2) == 0))
         {
            outputText("突然，克拉拉用一只手臂搂住你，另一只手伸进了你的[armor]！在你推开她之前，她狠狠地抚摸了一把你的" + Std.string(get_player().multiCockDescriptLight) + "。[say: 承认吧——我让你硬得不行了，不是吗？]她在你眼花缭乱的视线后嘲笑着你。");
         }
         else if(get_player().hasVagina())
         {
            outputText("克拉拉急促的蹄声是你受到攻击前唯一的警告，你试图举起防备，却被她灵巧地绕过防御，把手伸进了你的[armor]！在你把她推开之前，她成功地摸到了你的[vagina]，并捏了捏你的[clit]！[say: 嗯，是啊，你为我湿透了呢，]她在你眼花缭乱的视线后嘲笑着你。");
         }
         else
         {
            outputText("由于克拉拉剥夺了你的视力，你失去了她的踪迹。她趁机从背后抓住你，用她那丰满的巨乳摩擦你毫无防备的后背！过了一会儿你才把她推开，但她还是趁机在你的[ass]上拍了一巴掌。[say: 等你终于不再反抗我的时候，大家都会开心得多的！]她在你眼花缭乱的视线后嘲笑着你。");
         }
         get_player().takeLustDamage(7 + get_player().lib / 15,true);
      }
      
      public function claraDrugAttack() : void
      {
         var _loc1_:Number = Utils.rand(2);
         var _loc2_:String = "";
         if(_loc1_ == 0)
         {
            _loc2_ = "red";
         }
         if(_loc1_ == 1)
         {
            _loc2_ = "black";
         }
         outputText("克拉拉突然从腰间的袋子里抓出什么东西。[say: 尝尝这个，小可爱！]她咆哮着，朝你扔来一瓶药水。");
         if(get_player().hasPerk(PerkLib.Evade) && Utils.rand(10) <= 3 || Utils.rand(100) < get_player().get_spe() / 5)
         {
            outputText("\n你险险地避开了喷涌而出的炼金液体！\n");
         }
         else
         {
            if(_loc2_ == "red")
            {
               outputText("\n红色的液体击中了你，瞬间渗入你的皮肤消失不见。你的皮肤泛起红晕，感觉浑身发热。糟了……\n");
               if(!get_player().hasStatusEffect(StatusEffects.TemporaryHeat))
               {
                  get_player().createStatusEffect(StatusEffects.TemporaryHeat,0,1,0,0);
               }
            }
            if(_loc2_ == "black")
            {
               outputText("\n黑色的液体溅了你一身，几乎瞬间就渗入了你的皮肤。这让你感到疲惫和昏昏欲睡。\n");
               get_player().changeFatigue(10 + Utils.rand(25));
            }
         }
      }
      
      public function claraCastsBlind() : void
      {
         outputText("克拉拉恶狠狠地瞪着你，显然已经精疲力竭。接着，奇怪的光芒开始在她的手上跳跃，她将手指向了你。");
         if(get_player().get_inte() / 5 + Utils.rand(20) + 1 < 14)
         {
            outputText("\n一道刺眼的强光在你面前爆发，闪瞎了你的眼睛！你拼命地眨眼、揉眼睛，而克拉拉则在一旁得意地咯咯大笑。");
            get_player().createStatusEffect(StatusEffects.Blind,1,0,0,0);
         }
         else
         {
            outputText("\n你及时闭上了眼睛，避免了被面前爆发的强光闪瞎！看到你没有受到她魔法的影响，克拉拉咒骂了一声。");
         }
      }
      
      public function claraBonusBaseLustDamage() : void
      {
         outputText("\n上瘾的初期症状让你越来越难以继续战斗。你必须尽快结束战斗，否则你就会屈服于那些冲动。");
         get_player().takeLustDamage(2 + get_player().lib / 20,true);
      }
   }
}

