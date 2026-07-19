package classes.scenes.areas.mountain
{
   import classes.Appearance;
   import classes.CoC;
   import classes.Creature;
   import classes.ItemType;
   import classes.Monster;
   import classes.Player;
   import classes.StatusEffects;
   import classes.internals.MonsterAI;
   import classes.internals.Utils;
   import classes.internals.WeightedChoice;
   import classes.items.ConsumableLib;
   import classes.scenes.combat.AvoidDamageParameters;
   import classes.scenes.combat.CombatRange;
   import flash.Boot;
   
   public class NephilaSlime extends Monster
   {
      
      public function NephilaSlime()
      {
         if(Boot.skip_constructor)
         {
            return;
         }
         super();
         set_a("");
         set_short("nephila slime");
         imageName = "nephilaslime";
         set_long("这个史莱姆女孩与你见过的其他同类相似，却有几处关键差异。她那丰润的双乳明显更为硕大。她的\"皮肤\"是不透明的，而非透明，你注意到她的阴道正淌着一股浓稠黏腻的液体。她的腹部因子宫内一窝蠕动的生物而大幅鼓起——你不知道那是什么——暗示着某种生物群落正栖居其中。若非她背后生出的四条粗壮黏腻的触手状附肢，她看起来几乎要被这份重负压垮。乍看之下，那些触手仿佛生有羽毛，但细看才会发现，那些\"羽毛\"不过是史莱姆形成的异常结构。她那垂及地面的史莱姆发丝也如触手般、带着类似背部触手的羽状纹理，只是纤细许多。她的步态比其他史莱姆女孩更为妩媚撩人，眼神始终热切地盯着你的裆部。");
         createVagina(false,5,2);
         createBreastRow(Appearance.breastCupInverse("I"));
         ass.analLooseness = 2;
         ass.analWetness = 0;
         set_tallness(Utils.rand(2) + 68);
         hips.rating = 9;
         butt.rating = 8;
         skin.tone = "light";
         skin.type = 3;
         skin.desc = "gooey skin";
         skin.adj = "white";
         hair.color = "white";
         hair.length = 45;
         initStrTouSpeInte(65,65,95,85);
         initLibSensCor(50,45,70);
         set_weaponName("tentacles");
         set_weaponVerb("constrict and pound");
         set_weaponAttack(50);
         set_armorName("goo skin");
         set_armorDef(20);
         bonusHP = 350;
         set_lust(30);
         lustVuln = 0.25;
         temperment = 3;
         level = 14;
         set_gems(10 + Utils.rand(50));
         set_drop(new WeightedChoice().addMany(1,get_consumables().OVIELIX,get_consumables().LACTAID,get_consumables().SLIMYCL,null));
         checkMonster();
      }
      
      override public function won(param1:Boolean, param2:Boolean = false) : void
      {
         if(param2)
         {
            outputText("[pg]史莱姆女孩退缩了。[say: 恶心。你的精液不行，]她嘲讽着跑开了，留下你独自从失败中恢复。");
            get_game().combat.cleanupAfterCombat();
         }
         else
         {
            get_game().mountain.nephilaSlimeScene.loseToNephilaSlime();
         }
      }
      
      public function rollKickClawWhatTheFuckComboIsThisShit() : void
      {
         var _loc1_:Number = NaN;
         if(Boolean(combatAvoidDamage(new AvoidDamageParameters(true,false,false,null,false,null,null,null)).attackFailed))
         {
            _loc1_ = 1 + Utils.rand(10);
            outputText("史莱姆女孩朝你的方向跃起，向前翻滚，压在她那令人虚弱的孕肚上，同时用四根主触手向你猛抽。你侧身躲开她的飞扑，并从下面推了她一把，确保她脸朝下摔在泥土里。");
            get_player().takeDamage(_loc1_,true);
         }
         else
         {
            _loc1_ = get_player().reduceDamage(get_str() + get_weaponAttack(),this) + 25;
            if(_loc1_ > 0)
            {
               outputText("史莱姆女孩朝你的方向跃起，向前翻滚压在她那令人虚弱的孕肚上，同时用四根主触手向你猛击，正中你的肩膀，打得你踉跄后退。当一排锋利且黏糊糊的“羽毛”划过你的胸膛时，你痛苦地闷哼了一声。");
               get_player().takeDamage(_loc1_,true);
            }
            else
            {
               outputText("史莱姆女孩朝你的方向跃起，向前翻滚，压在她那令人虚弱的孕肚上，同时用四根主触手向你猛抽，但你把她打到一边，没有受到任何伤害。");
            }
         }
      }
      
      override public function performCombatAction() : void
      {
         get_game().spriteSelect(null);
         var _loc1_:MonsterAI = new MonsterAI().add(nephilaClaws,1,true,0,FATIGUE_NONE,CombatRange.Melee);
         _loc1_.add(rollKickClawWhatTheFuckComboIsThisShit,1,true,0,FATIGUE_NONE,CombatRange.Melee);
         _loc1_.add(nephilaBizarreTease,1,true,0,FATIGUE_NONE,CombatRange.Tease);
         _loc1_.add(gooBlind,1,get_player().hasStatusEffect(StatusEffects.Blind),10,FATIGUE_PHYSICAL,CombatRange.Ranged);
         _loc1_.exec();
      }
      
      override public function outputPlayerDodged(param1:int) : void
      {
         outputText("史莱姆女孩猛地甩头，让黏糊糊的头发飞向你，但你跳到一边，成功躲开了。白色的突起物重新落回她的背上，她看起来对没有击中目标感到非常生气。\n");
      }
      
      override public function outputAttack(param1:int) : void
      {
         if(param1 <= 0)
         {
            outputText("史莱姆女孩用触手猛烈攻击，但你用手臂挡开了这些黏糊糊的东西，成功地防御了它们。当她把它们收回身后时，她看起来很不高兴。");
         }
         else
         {
            outputText("史莱姆猛地向前甩头，让羽毛状的头发触手飞向你。它击中了你的肚子，其背后惊人的力量让你踉跄了一下。白色的模糊残影以和它飞来时一样快的速度飞回她的脸庞，当你恢复站稳时，她嘲弄地笑着。<b>(<font color=\"" + get_game().mainViewManager.colorHpMinus() + "\">" + param1 + "</font>)</b>");
         }
      }
      
      public function nephilaClaws() : void
      {
         var _loc1_:Number = NaN;
         if(Boolean(combatAvoidDamage(new AvoidDamageParameters(true,false,false,null,false,null,null,null)).attackFailed))
         {
            outputText("史莱姆女孩的爪子向你挥来，但你侧身躲开，它们化作一团无害的模糊残影从你身边掠过。");
         }
         else
         {
            _loc1_ = get_player().reduceDamage(get_str() + get_weaponAttack(),this);
            if(_loc1_ > 0)
            {
               outputText("史莱姆向你挥舞手臂，用羽毛状的“爪子”抓住了你。当它们划破你的皮肤，留下一道道细长的伤口时，你痛苦地皱起了眉头。");
               get_player().takeDamage(_loc1_,true);
            }
            else
            {
               outputText("史莱姆向你挥舞手臂，用羽毛状的“爪子”抓住了你。你防住了这锋利如刀的攻击。");
            }
         }
      }
      
      public function nephilaBizarreTease() : void
      {
         var _loc1_:Number = NaN;
         outputText("史莱姆女孩停止了战斗。她脱下湿漉漉的丁字裤，把手伸向自己的小穴。令你惊讶的是，几根五颜六色的史莱姆触手从她的阴道里喷涌而出，吞没了她的手，强迫她自慰，让她在呻吟中享受着极大的快感。");
         outputText("[pg]在一声特别响亮的呻吟之后，触手松开了她的手，上面覆盖着粘稠的液体。[pg]");
         if(get_player().get_gender() == 3)
         {
            outputText("[say: 你根本不知道它们感觉有多棒。我会弄点你的精液，然后也许你也能得到它们中的一个！]她说着，举起双手揉搓着她巨大的肚子。\n");
         }
         if(get_player().get_gender() == 1)
         {
            outputText("[say: 太棒了。可惜它们不喜欢屁股。你只能满足于让我榨干你所有的精液了。]她说着，举起双手揉搓着她巨大的肚子。\n");
         }
         if(get_player().get_gender() == 2)
         {
            outputText("[say: 啊，太棒了！别嫉妒，你很快就会因为它们而肿胀起来的。]她说着，举起双手揉搓着她巨大的肚子。\n");
         }
         if(get_player().get_gender() == 0)
         {
            outputText("[say: 可惜它们不喜欢屁股。我只能把你打晕了。]她说着，举起双手揉搓着她巨大的肚子。\n");
         }
         if(get_player().cor < 40)
         {
            outputText("你打了个寒颤。她怎么了？");
         }
         else
         {
            outputText("这景象显然很怪异，但还是有点色情。");
            _loc1_ = Math.round(30 * get_player().lustPercent() / 100);
            get_player().takeLustDamage(_loc1_);
         }
      }
      
      public function gooBlind() : void
      {
         var _loc2_:Number = NaN;
         outputText("史莱姆女孩松开触手，将它们引向她流着口水的小穴。她把它们插进去，抽插了几下，然后拔出来，触手尖端滴落着浓稠的液体。还没等你反应过来，她就挥动触手，把黏液扔向你！[pg]");
         var _loc1_:Array = ["[BLIND]" + get_capitalA() + Utils.cnName(get_short()) + "没有击中你，失明让她无法准确瞄准。\n","[SPEED]你足够敏捷，迅速躲开了她那迅猛的攻击。\n","[EVADE]利用你躲避攻击的技巧，你预判并侧身躲开了" + get_a() + Utils.cnName(get_short()) + "的攻击。\n","[MISDIRECTION]利用拉斐尔的教导和紧身衣提供的灵活性，你预判并侧身躲开了" + get_a() + Utils.cnName(get_short()) + "的攻击。\n","[FLEXIBILITY]凭借你惊人的柔韧性，你扭动身体躲开了" + get_a() + Utils.cnName(get_short()) + "的粘液。","[BLOCK]你举起盾牌，成功挡住了那团粘稠的液体。","[UNHANDLED]你成功躲开了那团粘稠的液体。"];
         if(!playerAvoidDamage(new AvoidDamageParameters(true,false,false,null,false,null,null,null),_loc1_))
         {
            outputText("你还没来得及反应，就被她的黏液击中了。对你头部的打击并没有造成特别大的伤害，但你的脸被一层浓稠的黏液覆盖，你什么也看不见了！<b>你失明了！</b>");
            get_player().createStatusEffect(StatusEffects.Blind,1 + Utils.rand(3),0,0,0);
            _loc2_ = get_player().reduceDamage(get_str() / 2 + get_weaponAttack() / 2,this);
            get_player().takeDamage(_loc2_,true);
         }
         changeFatigue(10,FATIGUE_PHYSICAL);
      }
      
      override public function defeated(param1:Boolean) : void
      {
         get_game().mountain.nephilaSlimeScene.defeatNephilaSlime();
      }
   }
}

