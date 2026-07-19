package classes.scenes.areas.bog
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
   
   public class InfestedChameleonGirl extends Monster
   {
      
      public function InfestedChameleonGirl()
      {
         if(Boot.skip_constructor)
         {
            return;
         }
         super();
         set_a("");
         set_short("infested chameleon girl");
         imageName = "infestedchameleongirl";
         set_long("这个变色龙女孩和你见过的其他同类很像，但也有明显的不同。她的D罩杯乳房明显更大。她的皮肤在黑色和粉色之间闪烁，你注意到她的阴道正滴落着浓稠的粘液。她的腹部有时会鼓起移动的肿块，暗示着她的子宫里有什么东西在活着。她的步态比其他变色龙女孩更性感，而且她一直盯着你的下体。");
         createVagina(false,5,2);
         createBreastRow(Appearance.breastCupInverse("D"));
         ass.analLooseness = 2;
         ass.analWetness = 0;
         set_tallness(Utils.rand(2) + 68);
         hips.rating = 8;
         butt.rating = 8;
         skin.tone = "dark";
         skin.type = 0;
         skin.desc = "skin";
         skin.adj = "pink";
         hair.color = "black";
         hair.length = 15;
         initStrTouSpeInte(65,65,95,85);
         initLibSensCor(50,45,70);
         set_weaponName("claws");
         set_weaponVerb("claw");
         set_weaponAttack(50);
         set_armorName("skin");
         set_armorDef(20);
         bonusHP = 350;
         set_lust(30);
         lustVuln = 0.25;
         temperment = 3;
         level = 14;
         set_gems(10 + Utils.rand(50));
         set_drop(NO_DROP);
         checkMonster();
      }
      
      override public function won(param1:Boolean, param2:Boolean = false) : void
      {
         if(get_player().hasCock() && !get_player().hasStatusEffect(StatusEffects.ParasiteSlug) && !get_player().hasPerk(PerkLib.ParasiteMusk) && !get_player().hasStatusEffect(StatusEffects.Infested) && Utils.randomChance(get_game().get_parasiteRating() * 20))
         {
            get_player().createStatusEffect(StatusEffects.ParasiteSlug,72,0,0,0);
         }
         if(param2)
         {
            outputText("[pg]变色龙女孩退缩了。[say: 真恶心。你的精液不行，]她嘲笑着跑开了，留下你独自从失败中恢复。");
            get_game().combat.cleanupAfterCombat();
         }
         else
         {
            get_game().bog.infestedChameleonGirlScene.loseToChameleonGirl();
         }
      }
      
      public function rollKickClawWhatTheFuckComboIsThisShit() : void
      {
         var _loc1_:Number = NaN;
         if(Boolean(combatAvoidDamage(new AvoidDamageParameters(true,true,false,null,false,null,null,null)).attackFailed))
         {
            _loc1_ = 1 + Utils.rand(10);
            outputText("变色龙女孩朝你的方向跃起，翻滚，然后踢向你。你侧身躲开她飞驰而来的冲锋，并从下面推了她一把，确保她脸朝下摔进沼泽里。");
            get_player().takeDamage(_loc1_,true);
         }
         else
         {
            _loc1_ = get_player().reduceDamage(get_str() + get_weaponAttack(),this) + 25;
            if(_loc1_ > 0)
            {
               outputText("变色龙朝你的方向跃起，翻滚，在上升时一脚踢在你的肩膀上，打得你踉跄后退。当一排锋利的爪子划过你的胸膛时，你痛苦地闷哼了一声。");
               get_player().takeDamage(_loc1_,true);
            }
            else
            {
               outputText("变色龙朝你的方向翻滚，并向上踢向你的胸口，但你把她打到一边，没有受到任何伤害……");
            }
         }
      }
      
      override public function performCombatAction() : void
      {
         get_game().spriteSelect(null);
         var _loc1_:MonsterAI = new MonsterAI().add(chameleonClaws,1,true,0,FATIGUE_NONE,CombatRange.Melee);
         _loc1_.add(rollKickClawWhatTheFuckComboIsThisShit,1,true,0,FATIGUE_NONE,CombatRange.Melee);
         _loc1_.add(chameleonBizarreTease,1,true,0,FATIGUE_NONE,CombatRange.Tease);
         _loc1_.add(gooBlind,1,get_player().hasStatusEffect(StatusEffects.Blind),10,FATIGUE_PHYSICAL,CombatRange.Ranged);
         _loc1_.exec();
      }
      
      override public function outputPlayerDodged(param1:int) : void
      {
         outputText("变色龙女孩猛地转过头，将舌头飞向你，但你跳到一边，成功躲开了。粉红色的残影以极快的速度飞回她的嘴里，她看起来非常生气，因为她没有击中目标。\n");
      }
      
      override public function outputAttack(param1:int) : void
      {
         if(param1 <= 0)
         {
            outputText("变色龙女孩猛地伸出舌头，但你用手臂挡开了这个黏糊糊的抛射物，成功地防御了它。当她把肌肉吸回嘴里时，她看起来很不高兴。");
         }
         else
         {
            outputText("变色龙猛地向前甩头，将舌头飞向你。它击中了你的肚子，其背后惊人的力量让你踉跄了一下。粉红色的残影以极快的速度飞回她的嘴里，当你恢复站立时，她嘲弄地笑着。<b>(<font color=\"" + get_game().mainViewManager.colorHpMinus() + "\">" + param1 + "</font>)</b>");
         }
      }
      
      public function gooBlind() : void
      {
         var _loc2_:Number = NaN;
         outputText("变色龙女孩松开舌头，将其伸向她流着口水的小穴。她把舌头插进去，抽插了几下，然后拔出来，舌尖上沾满了浓稠的液体。还没等你反应过来，她就甩出舌头，把黏液甩向了你！[pg]");
         var _loc1_:Array = ["[BLIND]" + get_capitalA() + Utils.cnName(get_short()) + "因为失明无法瞄准，没有打中你。\n","[SPEED]你的速度足够快，躲开了她那迅猛的攻击。\n","[EVADE]你利用闪避技巧，预判并侧身躲开了" + get_a() + Utils.cnName(get_short()) + "的攻击。\n","[MISDIRECTION]你运用拉斐尔的教导和紧身衣赋予的灵活性，预判并侧身躲开了" + get_a() + Utils.cnName(get_short()) + "的攻击。\n","[FLEXIBILITY]凭借惊人的柔韧性，你扭动身体躲开了" + get_a() + Utils.cnName(get_short()) + "的舌头。","[BLOCK]你举起盾牌，成功挡住了那团粘稠的液体。","[UNHANDLED]你成功躲开了那团粘稠的液体。"];
         if(!playerAvoidDamage(new AvoidDamageParameters(true,false,false,null,false,null,null,null),_loc1_))
         {
            outputText("还没等你反应过来，就被她的舌头击中了。对头部的打击并没有造成太大的伤害，但你的脸上沾满了浓稠黏滑的液体，你什么都看不见了！<b>你失明了！</b>");
            get_player().createStatusEffect(StatusEffects.Blind,1 + Utils.rand(3),0,0,0);
            _loc2_ = get_player().reduceDamage(get_str() / 2 + get_weaponAttack() / 2,this);
            get_player().takeDamage(_loc2_,true);
         }
         changeFatigue(10,FATIGUE_PHYSICAL);
      }
      
      override public function defeated(param1:Boolean) : void
      {
         get_game().bog.infestedChameleonGirlScene.defeatChameleonGirl();
      }
      
      public function chameleonClaws() : void
      {
         var _loc1_:Number = NaN;
         if(Boolean(combatAvoidDamage(new AvoidDamageParameters(true,false,false,null,false,null,null,null)).attackFailed))
         {
            outputText("变色龙女孩的爪子向你挥来，但你侧身躲开，它们化作一团无害的残影从你身旁掠过。");
         }
         else
         {
            _loc1_ = get_player().reduceDamage(get_str() + get_weaponAttack(),this);
            if(_loc1_ > 0)
            {
               outputText("变色龙向你挥舞手臂，用爪子抓住了你。当它们划破你的皮肤，留下一道道细长的伤口时，你痛得皱起了眉头。");
               get_player().takeDamage(_loc1_,true);
            }
            else
            {
               outputText("变色龙向你挥舞手臂，用爪子抓住了你。你挡下了这锋利如刀的攻击。");
            }
         }
      }
      
      public function chameleonBizarreTease() : void
      {
         outputText("变色龙女孩停止了战斗。她脱下湿漉漉的丁字裤，把手伸向她的小穴。令你惊讶的是，几根触手从她的阴道里钻了出来，吞噬了她的手，强迫她自慰，这让她发出了愉悦的呻吟。");
         outputText("[pg]在发出一声特别响亮的呻吟后，触手松开了她的手，上面覆盖着粘稠的液体。[pg]");
         if(get_player().get_gender() == 3)
         {
            outputText("[say:你根本不知道它们感觉有多棒。我会弄点你的精液，然后也许你也能得到它们中的一个！]她舔着手说道。\n");
         }
         if(get_player().get_gender() == 1)
         {
            outputText("[say:太棒了。可惜它们不喜欢屁股。你只能将就着让我把你榨干了。]她舔着手说道。\n");
         }
         if(get_player().get_gender() == 2)
         {
            outputText("[say:啊，太棒了！别嫉妒，我很快就会给你一个的。]她舔着手说道。\n");
         }
         if(get_player().get_gender() == 0)
         {
            outputText("[say:可惜它们不喜欢屁股。我只能把你打晕了。]她舔着手说道。\n");
         }
         if(get_player().cor < 40)
         {
            outputText("你打了个寒颤。她怎么了？");
         }
         else
         {
            outputText("这景象显然很怪异，但还是有点色情。");
            get_player().takeLustDamage(30);
         }
      }
   }
}

