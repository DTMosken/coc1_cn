package classes.scenes.areas.forest
{
   import classes.Appearance;
   import classes.CoC;
   import classes.Creature;
   import classes.Monster;
   import classes.Player;
   import classes.ReactionContext;
   import classes.StatusEffects;
   import classes._FlagDict.FlagDict_Impl_;
   import classes.internals.MonsterAI;
   import classes.internals.Utils;
   import classes.internals.WeightedChoice;
   import classes.scenes.combat.AvoidDamageParameters;
   import classes.scenes.combat.CombatRange;
   import flash.Boot;
   import haxe.IMap;
   
   public class Dullahan extends Monster
   {
      
      public var determined:Number;
      
      public function Dullahan()
      {
         if(Boot.skip_constructor)
         {
            return;
         }
         determined = 0;
         super();
         set_a("");
         set_short("Dullahan");
         imageName = "dullahan";
         set_long("站在你面前的是一位女骑士。除了苍蓝色的皮肤和带有金色瞳孔的黑色眼睛外，她看起来几乎和人类无异。她整洁的头发非常长，一直垂到大腿。她穿着类似装甲束腰的衣服；紧身的皮革几乎遮不住她的双乳。虽然她的前臂、腹部和小腿都覆盖着黑色的钢板，但她却穿着过膝袜和一条勉强遮住双腿的纯白短裙。在盔甲外面，她披着一件长得没必要的斗篷，像围巾一样缠在脖子上。她神情冷酷而坚定，架势表明她有着丰富的剑术经验。");
         createVagina(false,1,1);
         createBreastRow(Appearance.breastCupInverse("E"));
         ass.analLooseness = 1;
         ass.analWetness = 1;
         set_tallness(60);
         hips.rating = 2;
         butt.rating = 4;
         skin.tone = "pale blue";
         skin.type = 0;
         hair.color = "white";
         hair.length = 20;
         initStrTouSpeInte(85,70,80,60);
         initLibSensCor(40,50,15);
         set_weaponName("saber");
         set_weaponVerb("slash");
         set_fatigue(0);
         set_weaponAttack(FlagDict_Impl_.arrayReadInt(get_flags(),2660) == 2 ? 50 : 20);
         set_armorName("black and gold armor");
         set_armorDef(30);
         bonusHP = FlagDict_Impl_.arrayReadInt(get_flags(),2660) == 2 ? 1500 : 380;
         set_lust(5 + Utils.rand(15));
         lustVuln = FlagDict_Impl_.arrayReadInt(get_flags(),2660) == 2 ? 0 : 0.46;
         temperment = 1;
         level = FlagDict_Impl_.arrayReadInt(get_flags(),2660) == 2 ? 25 : 18;
         set_gems(30);
         set_drop(new WeightedChoice());
         checkMonster();
      }
      
      override public function won(param1:Boolean, param2:Boolean = false) : void
      {
         if(FlagDict_Impl_.arrayReadInt(get_flags(),2660) == 2)
         {
            get_game().forest.dullahanScene.dullahanFinishesYouOff();
         }
         else if(hasStatusEffect(StatusEffects.Spar))
         {
            get_game().forest.dullahanScene.defeatedDullahanVictoryFriendly();
         }
         else
         {
            get_game().forest.dullahanScene.dullahanVictory();
         }
      }
      
      override public function runCheck() : void
      {
         outputText("当你逃跑时，骑士盯着你，发出了不祥的笑声。");
         get_game().combat.doRunAway();
      }
      
      override public function react(param1:ReactionContext) : Boolean
      {
         var _loc2_:Number = NaN;
         var _loc3_:Number = NaN;
         switch(param1.index)
         {
            case 1:
               _loc2_ = 90;
               if(hasStatusEffect(StatusEffects.Blind))
               {
                  _loc2_ -= 30;
               }
               if(FlagDict_Impl_.arrayReadInt(get_flags(),2660) == 2)
               {
                  _loc2_ += 25;
               }
               _loc2_ -= get_player().get_spe() / 3;
               _loc2_ -= get_lust() / 2;
               if(Utils.rand(100) < _loc2_)
               {
                  if(!get_game().combat.isWieldingRangedWeapon())
                  {
                     _loc3_ = calcDamage() * 0.75 + Utils.rand(15);
                     outputText("无头骑士熟练地格挡并反击了你的攻击，对你造成了伤害！<b>(<font color=\"" + get_game().mainViewManager.colorHpMinus() + "\">" + _loc3_ + "</font>)</b>");
                     get_player().takeDamage(_loc3_);
                  }
                  else
                  {
                     outputText("无头骑士挥舞军刀，熟练地弹开了你的投掷物！");
                  }
                  get_game().combat.damage = 0;
                  return false;
               }
               break;
            case 3:
               clearOutput();
               if(get_player().hasStatusEffect(StatusEffects.Disarmed))
               {
                  outputText("你拼命跑向你的武器并一把抓起它。无头骑士保持沉默，但脸上写满了不悦。[pg]");
                  set_weaponName("saber");
                  set_weaponVerb("挥砍");
                  set_weaponAttack(50);
                  set_spe(get_spe() - 20);
                  get_player().rearm();
               }
               else
               {
                  outputText("你决定这一回合不采取任何行动。[pg]");
               }
               return false;
         }
         return true;
      }
      
      public function pommelBash() : void
      {
         var _loc2_:Number = NaN;
         outputText("无头骑士挥舞着剑向你冲来。你准备防御，但在最后一秒，她改变了攻击方向，将马刀的配重球向下猛砸向你的头部！");
         var _loc1_:* = combatAvoidDamage(new AvoidDamageParameters(true,false,false,null,null,null,null,null));
         if(_loc1_.dodge != null)
         {
            outputText("你成功躲过了这奇特的攻击，毫发无伤。");
         }
         else
         {
            outputText("配重球重重地砸在你的头骨上，造成的疼痛远超你对这种攻击的预期。");
            _loc2_ = get_player().reduceDamage(get_str(),this);
            get_player().takeDamage(_loc2_,true);
            if(get_player().stun(1,100))
            {
               outputText("攻击的震荡力让你<b>眩晕</b>了！");
            }
         }
      }
      
      override public function performCombatAction() : void
      {
         if(HPRatio() <= 0.5 && FlagDict_Impl_.arrayReadInt(get_flags(),2660) == 2 && determined == 0)
         {
            determination();
            return;
         }
         if(HPRatio() <= 0.25 && FlagDict_Impl_.arrayReadInt(get_flags(),2660) == 2 && determined == 1)
         {
            determination();
            return;
         }
         var _loc1_:MonsterAI = new MonsterAI().add(eAttack,2,true,0,FATIGUE_NONE,CombatRange.Melee);
         _loc1_.add(pommelBash,3,get_player().hasStatusEffect(StatusEffects.Disarmed),0,FATIGUE_NONE,CombatRange.Melee);
         _loc1_.add(dullahanDisarm,1,get_player().canDisarm() && FlagDict_Impl_.arrayReadInt(get_flags(),2660) == 2,10,FATIGUE_PHYSICAL,CombatRange.Melee);
         _loc1_.add(flurryAttack,1,!get_player().hasStatusEffect(StatusEffects.Disarmed),15,FATIGUE_PHYSICAL,CombatRange.Melee);
         _loc1_.add(horror,1,!get_player().hasStatusEffect(StatusEffects.Disarmed) && HPRatio() < 0.6,15,FATIGUE_MAGICAL,CombatRange.Ranged);
         _loc1_.exec();
      }
      
      public function horror() : void
      {
         outputText("无头骑士向后冲刺，用斗篷将自己完全包裹起来。她转过身，似乎在准备什么。");
         outputText("[pg]当你决定攻击时，你惊讶地发现她转过身来，左手托着自己的头，另一只手指向你。她用令人毛骨悚然的声音尖叫着，眼睛闪烁着险恶的紫光。");
         if(FlagDict_Impl_.arrayReadInt(get_flags(),2660) == 2)
         {
            outputText("[say: 深渊广阔无垠，它在等待着我们所有人。欢迎它的到来，[name]。这就是你所追求的。]");
         }
         else
         {
            outputText("[say: [name]！我，死亡骑士，来索取你的灵魂了！]");
         }
         if(Utils.rand(get_player().get_inte()) > 50)
         {
            outputText("当她开始变形成一个高大、令人作呕和恐惧的幽灵时，你集中了注意力。\n费了一番功夫，你看穿了她的幻象。无头骑士注意到了，当她重新装上头颅并回到战斗姿态时，似乎有一瞬间的慌乱。");
            return;
         }
         outputText("当她变形成一个高大、令人作呕和恐惧的幽灵，用一种未知的语言发出死者的哀嚎时，你畏缩了。\n天哪，你竟然挑衅了死亡骑士，一个来自遗忘深渊的未知实体！你无法面对这样的敌人，这不可能，这简直是疯了！");
         get_player().createStatusEffect(StatusEffects.Whispered,0,0,0,0);
      }
      
      override public function handleStun() : Boolean
      {
         if(FlagDict_Impl_.arrayReadInt(get_flags(),2660) == 2 && Utils.rand(2) == 0)
         {
            outputText("[say: 还……不够好！]无头骑士找回了更多的决心，从恍惚中恢复了过来！[pg]");
            removeStatusEffect(StatusEffects.Stunned);
            return true;
         }
         outputText("尽管无头骑士的头颅明显迷失了方向，但身体仍在继续行动，不过由于缺乏视觉和听觉，动作并不十分精确。[pg]");
         removeStatusEffect(StatusEffects.Stunned);
         createStatusEffect(StatusEffects.Blind,3,0,0,0);
         return true;
      }
      
      override public function handleFear() : Boolean
      {
         if(FlagDict_Impl_.arrayReadInt(get_flags(),2660) == 2)
         {
            outputText("[say: 你知道我都见过些什么，[name]。任何微不足道的幻象都无法压倒那些真实的梦魇。][pg]");
         }
         else
         {
            outputText("无头骑士对你的尝试大笑不止。[say: 你无法吓倒<b>死亡</b>本身！]她尖叫道。虽然她试图让声音听起来更低沉时破音了，但她实际上并没有受到你尝试的影响！[pg]");
         }
         removeStatusEffect(StatusEffects.Fear);
         return true;
      }
      
      override public function handleCombatLossText(param1:Boolean, param2:int) : int
      {
         if(hasStatusEffect(StatusEffects.Spar))
         {
            if(get_player().get_HP() <= 0)
            {
               get_player().set_HP(1);
            }
            return 1;
         }
         return int(super.handleCombatLossText(false,10));
      }
      
      public function flurryAttack() : void
      {
         var _loc2_:int = 0;
         var _loc3_:int = 0;
         outputText("无头骑士向后仰身蓄力，然后向前猛冲，发出一连串的斩击！第一次攻击出奇地容易躲闪");
         var _loc1_:Array = ["[BLIND]，你退开一步，看着无头骑士盲目的攻击只打中了空气。 ","[SPEED]，你成功躲开了她的后续攻击！","[EVADE]，多亏了你惊人的闪避能力，你躲开了剩余的连击！","[MISDIRECTION]，你用自己熟练的误导反击了她的佯攻，避开了所有的攻击！","[FLEXIBILITY]，你弯曲扭动身体，勉强躲开了她的攻击，剩下的攻击也没有命中！","[UNHANDLED]，你成功躲开了她的后续攻击！","[BLOCK]，你及时举起盾牌，挡住了她剩下的连击！","[PARRY]，你用你的[weapon]成功招架了剩下的攻击。"];
         if(!playerAvoidDamage(new AvoidDamageParameters(true,true,true,null,false,null,null,null),_loc1_))
         {
            outputText("，但这只是个假动作！你躲闪的位置刚好方便她攻击，在你退到安全距离之前，她已经连续击中了你好几次！");
            _loc2_ = 2 + Utils.rand(2);
            if(FlagDict_Impl_.arrayReadInt(get_flags(),2660) == 2)
            {
               _loc2_ += 4;
            }
            _loc3_ = 0;
            while(_loc2_ > 0)
            {
               _loc3_ += int(get_str() + Utils.rand(50));
               _loc3_ = get_player().reduceDamage(_loc3_,this);
               _loc2_--;
            }
            get_player().takeDamage(_loc3_,true);
         }
      }
      
      public function dullahanDisarm() : void
      {
         outputText("无头骑士向你冲来并发动攻击，但她的剑刃并没有瞄准你。她将剑与你的[weapon]相交，将剑刃滑下至握把，然后猛烈地拉扯！");
         if(Utils.rand(get_player().get_str()) < Utils.rand(get_str() + 30))
         {
            outputText("她成功地将你的武器从你手中夺走，扔到了你够不到的地方！");
            outputText("[pg]无头骑士后退一步，嘲弄地看着你。[say: 捡起来。]");
            get_player().disarm();
            set_weaponAttack(15);
            set_weaponName("saber pommel");
            set_weaponVerb("bash");
            set_spe(get_spe() + 20);
         }
         else
         {
            outputText("\n尽管她拼命争夺，你还是赢得了这场角力，保住了你的武器。");
         }
      }
      
      public function determination() : void
      {
         if(determined == 0)
         {
            outputText("[say: 你以为我会乖乖躺下接受你的剑刃吗，[name]？不。尽管我外表如此，但我并不欢迎死亡。而你，似乎在自寻死路！]");
         }
         else
         {
            outputText("[say: 我受了太多的苦，不能倒在这里。太多了。我绝不！]");
         }
         outputText("\n无头骑士似乎比以前更加专注了！");
         set_str(get_str() + 10);
         set_spe(get_spe() + 30);
         set_weaponAttack(get_weaponAttack() + 10);
         determined += 1;
         var _loc1_:Number = maxHP() * 0.25;
         addHP(maxHP() * 0.25);
         outputText("<b>(<font color=\"" + get_game().mainViewManager.colorHpPlus() + "\">" + _loc1_ + "</font>)</b>");
      }
      
      override public function defeated(param1:Boolean) : void
      {
         if(FlagDict_Impl_.arrayReadInt(get_flags(),2660) == 2)
         {
            get_game().forest.dullahanScene.defeatedDullahanFinishHerOff(param1);
         }
         else if(hasStatusEffect(StatusEffects.Spar))
         {
            get_game().forest.dullahanScene.defeatedDullahanFriendly(param1);
         }
         else
         {
            get_game().forest.dullahanScene.defeatedDullahan(param1);
         }
      }
   }
}

