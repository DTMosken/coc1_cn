package classes.scenes.areas.volcanicCrag
{
   import classes.CoC;
   import classes.Creature;
   import classes.Monster;
   import classes.PerkLib;
   import classes.Player;
   import classes.ReactionContext;
   import classes.StatusEffects;
   import classes._FlagDict.FlagDict_Impl_;
   import classes.internals.Utils;
   import classes.items.Weapon;
   import classes.scenes.combat.AvoidDamageParameters;
   import classes.scenes.combat.CombatDistance;
   import flash.Boot;
   import haxe.IMap;
   
   public class VolcanicGolem extends Monster
   {
      
      public function VolcanicGolem()
      {
         if(Boot.skip_constructor)
         {
            return;
         }
         super();
         set_a("");
         set_short("Volcanic Golem");
         imageName = "vgolem";
         set_long("在你面前矗立着一个巨大的石头构造体，足有[if (metric) {5米|16英尺}]高，两肩之间[if (metric) {将近两米|超过6英尺}]宽。它的身体由几块形状和大小各异的岩板组成。在岩板之间的缝隙中，你可以看到魔像的内部，那里红热滚烫，充满了看起来像熔岩的东西。每当它移动或攻击时，岩浆就会从缝隙中溢出，这是它每次动作所承受的难以置信的压力和重量造成的。");
         initGenderless();
         createBreastRow(0);
         set_tallness(199);
         skin.tone = "black";
         initStrTouSpeInte(125,100,80,105);
         initLibSensCor(0,0,0);
         set_weaponName("Stone Fists");
         set_weaponVerb("crush");
         set_weaponAttack(120);
         set_armorName("Rock Plates");
         set_armorDef(300);
         set_fireRes(0.2);
         bonusHP = FlagDict_Impl_.arrayReadFloat(get_flags(),2647);
         set_lust(0);
         lustVuln = 0;
         temperment = 1;
         level = 50;
         set_gems(60 + Utils.rand(30));
         set_drop(NO_DROP);
         additionalXP = 2500;
         createPerk(PerkLib.PoisonImmune,0,0,0,0);
         createPerk(PerkLib.BleedImmune,0,0,0,0);
         createPerk(PerkLib.BlindImmune);
         createPerk(PerkLib.StunImmune,0,0,0,0);
         checkMonster();
      }
      
      override public function won(param1:Boolean, param2:Boolean = false) : void
      {
         FlagDict_Impl_.arrayWriteFloat(get_flags(),2647,get_HP() - 50);
         if(param2)
         {
            outputText("[pg]你的对手似乎并不在意。");
            doNext(get_game().volcanicCrag.volcanicGolemScene.loseToGolem);
         }
         else
         {
            get_game().volcanicCrag.volcanicGolemScene.loseToGolem();
         }
      }
      
      public function volcanicStatus() : void
      {
         if(hasStatusEffect(StatusEffects.VolcanicWeapRed))
         {
            addStatusValue(StatusEffects.VolcanicWeapRed,1,-1);
            if(statusEffectv1(StatusEffects.VolcanicWeapRed) < 0)
            {
               outputText("[pg]魔像的手臂完全重新长出。它的伤害恢复正常了！[pg-]");
               set_weaponAttack(get_weaponAttack() + 40);
               if(get_weaponAttack() > 120 && !hasStatusEffect(StatusEffects.VolcanicFrenzy))
               {
                  set_weaponAttack(120);
               }
               else if(get_weaponAttack() > 400)
               {
                  set_weaponAttack(400);
               }
            }
         }
         if(hasStatusEffect(StatusEffects.VolcanicArmorRed))
         {
            addStatusValue(StatusEffects.VolcanicArmorRed,1,-1);
            if(statusEffectv1(StatusEffects.VolcanicArmorRed) < 0)
            {
               removeStatusEffect(StatusEffects.VolcanicArmorRed);
            }
            if(statusEffectv1(StatusEffects.VolcanicArmorRed) % 3 == 0 && hasStatusEffect(StatusEffects.VolcanicArmorRed))
            {
               addStatusValue(StatusEffects.VolcanicArmorRed,2,-1);
               set_armorDef(get_armorDef() + 150);
               outputText("[pg]一些缺失的岩板无视重力，滑回了魔像的外部。它的一些防御力恢复了！[pg-]");
            }
            if(statusEffectv1(StatusEffects.VolcanicArmorRed) < 0)
            {
               outputText("[pg]缺失的岩板无视重力，滑回了魔像的外部。它的防御力恢复正常了。[pg-]");
               removeStatusEffect(StatusEffects.VolcanicArmorRed);
            }
         }
         if(hasStatusEffect(StatusEffects.VolcanicFrenzy))
         {
            addStatusValue(StatusEffects.VolcanicFrenzy,1,-1);
            if(statusEffectv1(StatusEffects.VolcanicFrenzy) < 0)
            {
               removeStatusEffect(StatusEffects.VolcanicFrenzy);
               outputText("[pg]魔像似乎平静了一点，岩板之间的光芒恢复了正常的亮度。[pg-]");
               set_weaponAttack(120);
            }
         }
         if(hasStatusEffect(StatusEffects.Stunned))
         {
            outputText("[pg]魔像静止不动，岩石板违背重力，缓缓滑回熔岩内部。[pg-]");
            set_armorDef(0);
            if(statusEffectv1(StatusEffects.Stunned) < 0)
            {
               removeStatusEffect(StatusEffects.Stunned);
               outputText("[pg]魔像的装甲再次完全包裹住它的身体，这个构造体似乎对被这样击晕感到非常不满！岩石板之间炽热的红光变得更加明亮，魔像似乎变得更强了！[pg-]");
               createStatusEffect(StatusEffects.VolcanicFrenzy,3,0,0,0);
               set_weaponAttack(400);
               set_armorDef(300);
            }
            else
            {
               addStatusValue(StatusEffects.Stunned,1,-1);
            }
            return;
         }
         if(hasStatusEffect(StatusEffects.VolcanicFistProblem))
         {
            if(hasPerk(PerkLib.StunImmune))
            {
               removePerk(PerkLib.StunImmune);
            }
            addStatusValue(StatusEffects.VolcanicFistProblem,1,-1);
         }
         else
         {
            removeStatusEffect(StatusEffects.VolcanicFistProblem);
            if(!hasPerk(PerkLib.StunImmune))
            {
               createPerk(PerkLib.StunImmune,0,0,0,0);
            }
         }
         if(get_armorDef() < 0)
         {
            set_armorDef(0);
         }
      }
      
      public function volcanicGolemWait() : void
      {
         var _loc1_:int = 0;
         outputText("魔像对你的逃跑感到愤怒，从自己身上撕下几块岩石和岩浆向你掷来！");
         if(Boolean(combatAvoidDamage(new AvoidDamageParameters(true,false,false,null,null,null,null,null)).attackFailed))
         {
            outputText("你成功地滚到一边，岩石和熔岩球砸在地上，散落成嘶嘶作响的炽热卵石。[pg-]");
         }
         else
         {
            outputText("巨石撞击到你身上，在爆炸并散落成嘶嘶作响的炽热卵石之前，燃烧并碾压着你的身体。");
            get_game().combat.monsterDamageType = "Fire";
            _loc1_ = int(get_str() + 200);
            _loc1_ = get_player().reduceDamage(_loc1_,this);
            get_player().takeDamage(_loc1_,true);
         }
         outputText("[pg]你注意到魔像的核心暴露得更多了。<b>魔像的防御力下降了！</b>");
         if(hasStatusEffect(StatusEffects.VolcanicArmorRed))
         {
            addStatusValue(StatusEffects.VolcanicArmorRed,1,3);
            addStatusValue(StatusEffects.VolcanicArmorRed,2,1);
            set_armorDef(get_armorDef() - 150);
            if(get_armorDef() < 0)
            {
               set_armorDef(0);
            }
         }
         else
         {
            createStatusEffect(StatusEffects.VolcanicArmorRed,3,1,0,0);
            set_armorDef(get_armorDef() - 150);
            if(get_armorDef() < 0)
            {
               set_armorDef(0);
            }
         }
      }
      
      override public function shouldMove(param1:CombatDistance, param2:Boolean = false) : Boolean
      {
         return false;
      }
      
      override public function runCheck() : void
      {
         if(hasStatusEffect(StatusEffects.Uber) || hasStatusEffect(StatusEffects.VolcanicUberHEAL))
         {
            outputText("你做出了明智的决定，尽可能快、尽可能远地逃跑。片刻之后，你已经跑得足够远，几乎看不到魔像了，你感到背部传来沉重的热量，几乎要烧伤它。如果你站在那里，你肯定已经死了。");
            get_game().combat.doRunAway();
         }
         else
         {
            super.runCheck();
         }
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
               outputText("你的" + param1.get_attackNoun() + "从" + get_themonster() + "身上弹开，没有造成任何伤害。");
            }
            else if(_loc4_)
            {
               outputText("你对" + get_themonster() + "造成了擦伤！");
            }
            else if(_loc5_)
            {
               outputText("你" + param1.get_attackVerb() + "了" + get_themonster() + "，把" + pronoun2 + "打得碎片四溅！");
            }
            else if(_loc6_)
            {
               outputText(get_Themonster() + "在你强力的" + param1.get_attackNoun() + "下受到了重创！");
            }
            else
            {
               outputText("你用强力的" + param1.get_attackNoun() + "[b:粉碎]了" + get_themonster() + "！");
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
      
      public function reinforce() : void
      {
         outputText("[pg]魔像发出一声震耳欲聋的咆哮，并闪烁着耀眼的光芒，瞬间变成了纯白色。片刻之后，它恢复了之前的光芒，你注意到<b>它的装甲已经完全恢复了。</b>");
         set_armorDef(300);
      }
      
      override public function react(param1:ReactionContext) : Boolean
      {
         var _loc2_:int = 0;
         switch(param1.index)
         {
            case 2:
               if(get_game().combat.damageType == "PhysicalM")
               {
                  get_game().combat.monsterDamageType = "Fire";
                  _loc2_ = get_player().reduceDamage(Utils.rand(30) + 15,this);
                  get_player().takeDamage(_loc2_);
                  outputText("[pg-]岩浆从岩板之间溢出并击中了你，剧烈地燃烧着。<b>(<font color=\"#ff8d29\">" + _loc2_ + "</font>)</b>");
               }
               break;
            case 5:
               outputText("[pg-]魔像似乎没有受到影响！它那被魔法赋予生命的眼睛不受法术的影响！");
               return false;
            case 6:
               outputText("火焰似乎并没有对这只火热的魔像造成太大的困扰，尽管你攻击的魔法性质使它无法完全抵抗。");
         }
         return true;
      }
      
      public function nuke() : void
      {
         var _loc1_:Number = NaN;
         if(!hasStatusEffect(StatusEffects.Uber))
         {
            outputText("魔像蜷缩成一个球，开始发出耀眼的光芒。也许它在积蓄什么力量。[pg]");
            createStatusEffect(StatusEffects.Uber,0,0,0,0);
            return;
         }
         _loc1_ = statusEffectv1(StatusEffects.Uber);
         if(_loc1_ == 0)
         {
            addStatusValue(StatusEffects.Uber,1,1);
            outputText("[pg]怪物变得更加明亮，你几乎无法在不被极度高温烧伤的情况下站在它附近。");
            if(get_player().get_inte() > 50)
            {
               outputText("[pg-]你不确定是否要继续战斗。");
            }
         }
         else if(_loc1_ == 1)
         {
            addStatusValue(StatusEffects.Uber,1,1);
            outputText("[pg]怪物变得更加明亮，由于难以想象的高温，它周围的光线发生了严重的扭曲。");
            if(get_player().get_inte() > 50)
            {
               outputText("[pg-]你也许应该逃跑！");
            }
         }
         else if(_loc1_ == 2)
         {
            outputText("[pg]魔像突然伴随着一声震天动地的咆哮站了起来，温度上升到了致命的程度。一股毁灭性的热浪从构造体向外扩散。它的速度太快，范围太广，你根本无法躲避。");
            outputText("[pg]你被完全击中，但你甚至没有时间感到任何疼痛。你在不到一秒钟的时间内被蒸发，彻底灰飞烟灭。唯一剩下的只有你的影子，被魔像散发出的极端热辐射印在了大地上。");
            outputText("[pg]魔像不知为何没有受到自己攻击的影响，继续在火山岩中漫无目的地游荡。");
            get_game().combat.monsterDamageType = "Fire";
            get_player().takeDamage(9999);
            get_game().volcanicCrag.volcanicGolemScene.volcanicGolemDead();
         }
      }
      
      override public function maxHP() : Number
      {
         return FlagDict_Impl_.arrayReadFloat(get_flags(),2647);
      }
      
      public function heal() : void
      {
         if(!hasStatusEffect(StatusEffects.VolcanicUberHEAL))
         {
            outputText("魔像蜷缩成一个球，并在周围制造了一个闪烁的护盾。它似乎在准备某种漫长的法术。[pg]");
            createStatusEffect(StatusEffects.VolcanicUberHEAL,2,0,0,0);
            FlagDict_Impl_.arrayWriteFloat(get_flags(),2648,100);
            return;
         }
         if(statusEffectv1(StatusEffects.VolcanicUberHEAL) != 0)
         {
            addStatusValue(StatusEffects.VolcanicUberHEAL,1,-1);
            outputText("[pg]闪烁的护盾继续阻挡着你的攻击。[pg-]");
            if(get_player().get_inte() > 70)
            {
               outputText("护盾可以吸收较弱的攻击，但也许一次足够强大的攻击就能击破它。");
            }
            return;
         }
         removeStatusEffect(StatusEffects.VolcanicUberHEAL);
         outputText("[pg]魔像瞬间闪烁着金色的光环，闪烁的护盾消散了。它似乎治愈了自己！[pg-]");
         set_HP(get_HP() + 2000);
         if(get_HP() > FlagDict_Impl_.arrayReadFloat(get_flags(),2647))
         {
            set_HP(FlagDict_Impl_.arrayReadFloat(get_flags(),2647));
         }
      }
      
      override public function handleDamaged(param1:Number, param2:Boolean = true) : Number
      {
         var _loc3_:* = null as IMap;
         if(hasStatusEffect(StatusEffects.Uber))
         {
            if(param1 >= 150)
            {
               if(param2)
               {
                  outputText("[pg-]你的攻击如此猛烈，以至于将魔像从其充能法术中击退！它倒在地上，<b>被击晕了</b>！");
               }
               set_armorDef(0);
               createStatusEffect(StatusEffects.Stunned,1,0,0,0);
               removeStatusEffect(StatusEffects.Uber);
            }
         }
         if(hasStatusEffect(StatusEffects.VolcanicUberHEAL))
         {
            if(param1 < 100)
            {
               if(param2)
               {
                  if(param2)
                  {
                     outputText("[pg-]你的攻击被闪烁的护盾吸收，对其造成了轻微伤害。[pg-]");
                  }
               }
               param1 = Math.round(param1 * 0.3);
               _loc3_ = get_flags();
               FlagDict_Impl_.arrayWriteFloat(_loc3_,2648,FlagDict_Impl_.arrayReadFloat(_loc3_,2648) - param1);
               if(FlagDict_Impl_.arrayReadFloat(get_flags(),2648) == 0)
               {
                  if(param2)
                  {
                     outputText("你成功击破了护盾，打断了魔像的技能！");
                  }
                  set_armorDef(0);
                  removeStatusEffect(StatusEffects.VolcanicUberHEAL);
               }
               param1 = 1;
            }
            else
            {
               if(param2)
               {
                  outputText("你强大的攻击彻底击碎了闪烁的护盾，在此过程中<b>击晕了</b>魔像！[pg-]");
               }
               set_armorDef(0);
               removeStatusEffect(StatusEffects.VolcanicUberHEAL);
               createStatusEffect(StatusEffects.Stunned,2,0,0,0);
               param1 = 1;
            }
         }
         return param1;
      }
      
      public function earthshatter() : void
      {
         var _loc1_:int = 0;
         outputText("可怕的魔像发出一声震天动地的咆哮，以不可思议的力量重重地踩在地上！随着它咆哮的冲击波迅速逼近，大地朝着你的方向裂开。[pg-]");
         if(combatBlock(true))
         {
            outputText("你迅速将你的[shield]挡在身前，挡住了大部分攻击，只是稍微踉跄了一下。[pg-]");
            return;
         }
         if(get_player().stun(1,50))
         {
            outputText("再高的敏捷也无法帮你躲过这巨大的冲击波。你被击中，重重地摔在地上，头晕目眩，摇摇晃晃。<b>你被击晕了。</b>[pg-]");
            return;
         }
         _loc1_ = int(get_str() / 2 + Utils.rand(10));
         _loc1_ = get_player().reduceDamage(_loc1_,this);
         if(_loc1_ < 10)
         {
            _loc1_ = 10;
         }
         outputText("你被冲击波完全击中，但设法保持了平衡，没有摔倒在地上。");
         get_player().takeDamage(_loc1_,true);
      }
      
      override public function doAI() : void
      {
         volcanicStatus();
         if(distance != CombatDistance.Melee)
         {
            distanceAnger();
         }
         else if(!hasStatusEffect(StatusEffects.Stunned))
         {
            if(!hasStatusEffect(StatusEffects.Uber) && !hasStatusEffect(StatusEffects.VolcanicUberHEAL))
            {
               if(Math.round(FlagDict_Impl_.arrayReadFloat(get_flags(),2647) / get_HP()) >= 3 && Utils.rand(4) == 0)
               {
                  heal();
               }
               else if(get_armorDef() < 50 && Utils.rand(3) == 0)
               {
                  reinforce();
               }
               else if(Utils.rand(3) == 0 && !get_player().hasStatusEffect(StatusEffects.Stunned) && !get_player().hasPerk(PerkLib.Resolute) || Utils.rand(5) == 0 && get_player().hasPerk(PerkLib.Resolute))
               {
                  earthshatter();
               }
               else if(Utils.rand(10) == 0 && Math.round(FlagDict_Impl_.arrayReadFloat(get_flags(),2647) / get_HP()) >= 2 || Utils.rand(20) == 0)
               {
                  nuke();
               }
               else
               {
                  eAttack();
               }
               return;
            }
            if(!hasStatusEffect(StatusEffects.VolcanicUberHEAL))
            {
               nuke();
            }
            else
            {
               heal();
            }
         }
      }
      
      public function distanceAnger() : void
      {
         get_game().combatRangeData.closeDistance(this);
         if(!hasStatusEffect(StatusEffects.Uber) && !hasStatusEffect(StatusEffects.VolcanicUberHEAL))
         {
            if(get_player().get_spe() < 70 && Utils.rand(4) == 0 || get_player().get_spe() >= 70 && Utils.rand(2) == 0)
            {
               outputText("迟缓的魔像冲锋并攻击了你几秒钟前站立的地面，在焦土上挖出了一个巨大的坑，并将自己的拳头刺入了地下。呼！");
               outputText("[pg]这个构造体似乎在挣扎着把拳头从地里拔出来。<b>如果你立即用适当的攻击行动，你也许能利用魔像的失误！[pg-]</b>");
               createStatusEffect(StatusEffects.VolcanicFistProblem,2,0,0,0);
               volcanicStatus();
            }
            else
            {
               volcanicGolemWait();
            }
         }
         else
         {
            clearOutput();
            outputText("魔像不在乎你的撤退，继续发出更亮的光芒。");
            if(!hasStatusEffect(StatusEffects.VolcanicUberHEAL))
            {
               nuke();
            }
            else
            {
               heal();
            }
         }
      }
      
      override public function defeated(param1:Boolean) : void
      {
         get_game().volcanicCrag.volcanicGolemScene.winAgainstGolem();
      }
   }
}

