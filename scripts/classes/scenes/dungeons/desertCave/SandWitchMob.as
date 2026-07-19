package classes.scenes.dungeons.desertCave
{
   import classes.Appearance;
   import classes.CoC;
   import classes.Creature;
   import classes.Monster;
   import classes.PerkLib;
   import classes.Player;
   import classes.StatusEffects;
   import classes.internals.MonsterAI;
   import classes.internals.Utils;
   import classes.scenes.combat.AvoidDamageParameters;
   import classes.scenes.combat.CombatRange;
   import flash.Boot;
   
   public class SandWitchMob extends Monster
   {
      
      public function SandWitchMob()
      {
         if(Boot.skip_constructor)
         {
            return;
         }
         super();
         set_a("");
         set_short("sand witches");
         imageName = "sandwitchmob";
         set_long("你被一大群沙漠女巫包围了。就像那些在沙地里游荡的女巫一样，她们穿着简单的长袍，留着金发，四个大乳房毫不掩饰地顶着遮挡的布料。这群女性施法者恶狠狠地盯着你，准备用数量优势把你拖垮。");
         set_race("Humans?");
         set_plural(true);
         pronoun1 = "她们";
         pronoun2 = "她们";
         pronoun3 = "她们的";
         createVagina(false,2,2);
         createBreastRow(Appearance.breastCupInverse("DD"));
         createBreastRow(Appearance.breastCupInverse("DD"));
         ass.analLooseness = 1;
         ass.analWetness = 1;
         set_tallness(Utils.rand(12) + 55);
         hips.rating = 10;
         butt.rating = 8;
         skin.tone = "bronzed";
         hair.color = "sandy-blonde";
         hair.length = 15;
         initStrTouSpeInte(25,25,35,45);
         initLibSensCor(55,40,30);
         set_weaponName("fists");
         set_weaponVerb("punches");
         set_weaponAttack(0);
         set_weaponPerk([]);
         set_weaponValue(150);
         set_armorName("robes");
         set_armorDef(1);
         set_armorPerk("");
         set_armorValue(5);
         bonusHP = 80;
         set_lust(30);
         lustVuln = 0.5;
         temperment = 3;
         level = 4;
         set_gems(Utils.rand(15) + 5);
         set_drop(NO_DROP);
         createPerk(PerkLib.Immovable);
         checkMonster();
      }
      
      override public function won(param1:Boolean, param2:Boolean = false) : void
      {
         get_game().dungeons.desertcave.loseToSammitchMob();
      }
      
      public function sandstonesAreCool() : void
      {
         outputText("房间里旋转的沙暴突然停止，所有微小的沙粒聚集成球，变成几块光滑的石头。然后，所有的沙石落到地上，向你滑行过来。");
         var _loc1_:int = 0;
         if(Boolean(combatAvoidDamage(new AvoidDamageParameters(true,false,false,null,null,null,null,null)).attackHit))
         {
            if(!get_player().isGoo())
            {
               outputText("[pg]它们顺着你的[legs]爬上来。你试图把它们全拍掉，但数量太多了。");
               if(get_player().cockTotal() == 1)
               {
                  outputText("一块石头爬上了你的[cock]。");
               }
               if(get_player().cockTotal() > 1)
               {
                  outputText("一群石头爬上了你的[cocks]。");
               }
               if(get_player().hasCock())
               {
                  _loc1_++;
               }
               if(get_player().hasVagina())
               {
                  outputText("一块石头滑上你的大腿内侧");
                  if(get_player().balls > 0)
                  {
                     outputText("绕到你的[sack]后面");
                  }
                  outputText("然后直接钻进你的[vagina]" + (get_player().hasVirginVagina() ? "，夺走了你的童贞，一丝鲜血顺着你的[leg]流下。" : "。"));
                  _loc1_++;
               }
               if(get_player().balls > 0)
               {
                  outputText("一小堆石头停在你的[balls]上。");
                  _loc1_++;
               }
               outputText("" + Utils.num2Text(get_player().totalNipples()) + "块石头爬上你的胸膛，覆在最上面的[nipples]上");
               if(get_player().bRows() > 1)
               {
                  if(get_player().bRows() == 2)
                  {
                     outputText("以及");
                  }
                  else
                  {
                     outputText("，");
                  }
                  outputText("你中间的" + get_player().nippleDescript(1) + "");
                  _loc1_++;
               }
               if(get_player().bRows() > 2)
               {
                  outputText("，以及你底部的" + get_player().nippleDescript(2) + "");
                  _loc1_++;
               }
               outputText("。");
               outputText("最后一块石头顺着你的[legs]后侧往上爬，直接滑进了你的[asshole]。");
               outputText("[pg]你试图把这些石头从身上弄下来，但某种魔法让它们像胶水一样粘在你身上。一个沙漠女巫打了个响指，所有光滑的石头都开始震动，产生令人麻木的快感，让你的身体颤抖起来。<b>你必须尽快结束这一切，否则就糟了！</b>");
            }
            else
            {
               outputText("[pg]这些石头射入你黏糊糊的身体。你尽力想把这些异物从体内弄出来，但某种魔法将它们固定在原位。一个沙漠女巫打了个响指，所有的石头都开始震动，在你敏感的黏液身体中激起阵阵涟漪。感觉你现在的整个身体就像一个巨大的快感炸弹。你最好快点结束这场战斗！");
               _loc1_ = 5;
            }
            get_player().createStatusEffect(StatusEffects.LustStones,_loc1_,0,0,0);
            get_player().takeLustDamage(_loc1_ * 2 + 5 + get_player().sens / 7,true);
         }
         else
         {
            outputText("\n石头随后九十度转弯飞入紫色的火焰中，然后就消失了。一个沙漠女巫拍了另一个女巫的后脑勺，大喊着要集中注意力之类的话。");
         }
         removeStatusEffect(StatusEffects.Sandstorm);
      }
      
      public function sandWitchMobAI() : void
      {
         var _loc1_:MonsterAI = new MonsterAI();
         _loc1_.add(sandStormAttack,1,!hasStatusEffect(StatusEffects.Sandstorm),10,FATIGUE_MAGICAL,CombatRange.Ranged);
         _loc1_.add(drankSomeMialk,2,HPRatio() < 0.5,10,FATIGUE_PHYSICAL,CombatRange.Self);
         _loc1_.add(sandstonesAreCool,0.33,hasStatusEffect(StatusEffects.Sandstorm) && Utils.rand(2) == 0 && !get_player().hasStatusEffect(StatusEffects.LustStones),10,FATIGUE_MAGICAL,CombatRange.Ranged);
         _loc1_.add(gangrush,1,true,0,FATIGUE_NONE,CombatRange.Melee);
         _loc1_.exec();
      }
      
      public function sandStormAttack() : void
      {
         outputText("女巫们手拉手开始一起吟唱，她们高声歌唱，松散的沙子从每个角落、每个门口，甚至天花板上滴落下来。[say:沙漠将会介入！] 一团咬人、刺痛的沙云在房间里盘旋，遮蔽了你的视线，刺痛了你的皮肤。它会在每一回合都让你失明并伤害你！");
         createStatusEffect(StatusEffects.Sandstorm,0,0,0,0);
      }
      
      override public function performCombatAction() : void
      {
         sandWitchMobAI();
      }
      
      public function headbuttABitch() : void
      {
         outputText("人群分开，一个更矮壮结实的女巫慢吞吞地走出来，举起双拳，头向后仰。她作势要打你，却在最后一秒收回拳头，猛地向前一记强力头槌！你几乎没有时间反应！");
         var _loc1_:int = get_player().reduceDamage(get_str() + get_weaponAttack() + 10,this);
         if(Boolean(combatAvoidDamage(new AvoidDamageParameters(true,false,false,null,null,null,null,null)).attackFailed))
         {
            outputText("\n你猛地闪到一边，成功躲开了这一击。你的敌人退回姐妹们中间时，看起来很不高兴。");
         }
         else if(_loc1_ <= 0)
         {
            outputText("\n你用前臂挡住了这一击，硬生生拦下了她。这个粗暴的女人退回姐妹们中间时咆哮了一声，对只造成这么点伤害感到失望。");
         }
         else
         {
            outputText("\n她正中你的面门，打得你满脸是血，让你痛苦地踉跄后退。");
            get_player().takeDamage(_loc1_,true);
         }
      }
      
      public function gangrush() : void
      {
         outputText("女巫们收拢阵型，举起拳头向前推进，企图把你打得屈服！\n");
         set_str(get_str() - 10);
         createStatusEffect(StatusEffects.Attacks,2 + Utils.rand(3),0,0,0);
         eAttack();
         set_str(get_str() + 10);
      }
      
      public function drankSomeMialk() : void
      {
         outputText("其中一个金发美女转向另一个问道，[say:喝一杯吗，姐妹？和这个入侵者战斗让我口渴得厉害。] 另一个女人一言不发地敞开长袍，露出乳房，将四个起伏的、充满乳汁的肉团暴露在空气中，然后另一个女人含住了一个乳头。另外三个人也挤过来吸吮露出的乳头，她们的臀部满足地摇晃着，快速地吃着零食。");
         outputText("[pg]擦去嘴唇上多余的乳汁后，她们合上长袍，重新摆出战斗姿态，看起来比以前更健康了。");
         get_player().takeLustDamage(4 + get_player().lib / 10,true);
         addHP(30);
      }
      
      override public function defeated(param1:Boolean) : void
      {
         get_game().dungeons.desertcave.yoYouBeatUpSomeSandWitchesYOUMONSTER();
      }
   }
}

