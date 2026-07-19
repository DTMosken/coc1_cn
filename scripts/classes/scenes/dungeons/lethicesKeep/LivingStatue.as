package classes.scenes.dungeons.lethicesKeep
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
   
   public class LivingStatue extends Monster
   {
      
      public function LivingStatue()
      {
         if(Boot.skip_constructor)
         {
            return;
         }
         super();
         set_a("");
         set_short("living statue");
         imageName = "livingstatue";
         set_long("这座栩栩如生的大理石雕像有着许多磨损的痕迹，但依然像刚雕刻出来时那样坚固稳定。它珍珠般洁白的皮肤上有些地方因年代久远而坑坑洼洼，然而那雪花石膏般的肌肉却似乎以一种近乎流动的优雅在运动。你感觉这座雕像是在恶魔出现之前雕刻的，然后在不久之后被赋予了生命。它完全没有生殖器——只有一片雕刻得完美无瑕的叶子遮挡着它的下体。它挥舞着一把由与它身体其余部分相同材料雕刻而成的锤子。");
         set_race("Statue");
         initStrTouSpeInte(100,80,25,50);
         initLibSensCor(10,10,0);
         lustVuln = 0;
         set_tallness(192);
         createBreastRow(0,1);
         initGenderless();
         set_fireRes(0);
         set_drop(NO_DROP);
         level = 22;
         bonusHP = 1000;
         set_weaponName("stone greathammer");
         set_weaponVerb("smash");
         set_weaponAttack(25);
         set_armorName("cracked stone");
         createPerk(PerkLib.StunImmune,0,0,0,0);
         createPerk(PerkLib.PoisonImmune,0,0,0,0);
         createPerk(PerkLib.BleedImmune,0,0,0,0);
         createPerk(PerkLib.BlindImmune);
         checkMonster();
      }
      
      override public function won(param1:Boolean, param2:Boolean = false) : void
      {
         get_game().lethicesKeep.livingStatue.fuckinMarbleOP(param1,param2);
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
               outputText("你的" + param1.get_attackNoun() + "被" + get_themonster() + "毫发无损地弹开了。");
            }
            else if(_loc4_)
            {
               outputText("你对" + get_themonster() + "造成了擦伤！");
            }
            else if(_loc5_)
            {
               outputText("你" + param1.get_attackVerb() + "了" + get_themonster() + "，打得" + pronoun2 + "碎片四溅！");
            }
            else if(_loc6_)
            {
               outputText(get_Themonster() + "在你强力的" + param1.get_attackNoun() + "下碎裂了！");
            }
            else
            {
               outputText("你用强大的" + param1.get_attackNoun() + "[b:粉碎]了" + get_themonster() + "！");
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
      
      override public function react(param1:ReactionContext) : Boolean
      {
         if(param1.index == 5)
         {
            outputText("[pg]魔像似乎没有受到影响！它那被魔法赋予生命的眼睛不受法术的影响！[pg]");
            return false;
         }
         return true;
      }
      
      override public function performCombatAction() : void
      {
         var _loc1_:* = null as Array;
         if(HPRatio() < 0.7 && distance != CombatDistance.Distant && Utils.rand(2) == 0)
         {
            backhand();
         }
         else if(HPRatio() < 0.4 && !hasStatusEffect(StatusEffects.Disarmed) && get_player().canDisarm() && Utils.rand(2) == 0)
         {
            disarm();
         }
         else
         {
            _loc1_ = [];
            if(!get_player().hasStatusEffect(StatusEffects.Blind) && !get_player().hasStatusEffect(StatusEffects.Stunned))
            {
               _loc1_.push(dirtKick);
            }
            if(!get_player().hasStatusEffect(StatusEffects.Blind) && !get_player().hasStatusEffect(StatusEffects.Stunned))
            {
               _loc1_.push(concussiveBlow);
            }
            _loc1_.push(cycloneStrike);
            _loc1_.push(cycloneStrike);
            _loc1_.push(overhandSmash);
            _loc1_[Utils.rand(int(_loc1_.length))]();
         }
      }
      
      public function overhandSmash() : void
      {
         outputText("巨人将锤子高高举过头顶，迅速地砸下，给了你惩罚性的一击！");
         var _loc1_:Number = 175 + get_player().reduceDamage(get_str() + get_weaponAttack(),this);
         if(_loc1_ <= 0 || Utils.rand(100) < 25 || Boolean(combatAvoidDamage(new AvoidDamageParameters(true,false,false,null,null,null,null,null)).attackFailed))
         {
            outputText("你及时侧身躲开了。");
         }
         else
         {
            outputText("震荡的打击以粉碎骨头的力量冲击着你。");
            get_player().takeDamage(_loc1_,true);
         }
      }
      
      override public function handleStun() : Boolean
      {
         get_game().outputText("石巨人的无情肉体似乎无法被击晕。");
         return true;
      }
      
      override public function handleFear() : Boolean
      {
         get_game().outputText("石巨人对你试图恐吓它的行为毫不在意。");
         return true;
      }
      
      override public function handleBlind() : Boolean
      {
         return true;
      }
      
      public function disarm() : void
      {
         outputText("这尊活过来的雕像旋转着它的锤子，用锤柄敲击你的[weapon]。");
         if(Boolean(combatAvoidDamage(new AvoidDamageParameters(true,false,false,null,null,get_player().standardDodgeFunc(this,-30),null,null)).attackFailed))
         {
            outputText("你暂时还能握住你的装备。");
         }
         else
         {
            outputText("你的装备飞到了灌木丛里！你只能换种方式战斗了。");
            get_player().disarm();
            createStatusEffect(StatusEffects.Disarmed,0,0,0,0);
         }
      }
      
      public function dirtKick() : void
      {
         outputText("这尊活过来的雕像挥动右脚，以极高的速度在花园里拖行，连根拔起了十几丛灌木。一阵由灌木和泥土组成的烟尘向你席卷而来！");
         if(Utils.rand(2) == 0 && !get_player().hasStatusEffect(StatusEffects.Blind))
         {
            get_player().createStatusEffect(StatusEffects.Blind,2,0,0,0);
            outputText("<b>你失明了！</b>");
         }
         else
         {
            outputText("你闭上眼睛，直到烟尘散去，然后继续战斗！");
         }
      }
      
      override public function defeated(param1:Boolean) : void
      {
         FlagDict_Impl_.arrayWriteInt(get_flags(),1248,1);
         get_game().lethicesKeep.livingStatue.beatUpDaStatue(param1);
      }
      
      public function cycloneStrike() : void
      {
         outputText("巨人向后扭转身躯，突然开始原地旋转。它的锤子贴近地面，旋转的轨迹在原本原始的花园中撕裂出一条毁灭的路径，并且正朝你袭来！");
         var _loc1_:Number = (175 + get_player().reduceDamage(get_str() + get_weaponAttack(),this)) / (Utils.rand(3) + 2);
         if(_loc1_ <= 0 || Boolean(combatAvoidDamage(new AvoidDamageParameters(true,false,false,null,null,null,null,null)).attackFailed))
         {
            outputText("在神明的庇佑下，你不知怎么地躲过了旋转的锤子。");
         }
         else
         {
            outputText("你被旋转的锤子结结实实地击中了。");
            get_player().takeDamage(_loc1_,true);
         }
      }
      
      public function concussiveBlow() : void
      {
         outputText("巨人举起锤子，明显是要向下砸击。当它向下挥舞时，大理石般的肌肉紧绷着。你能够跳开这明显有预谋的攻击，但当它在地面砸出一个坑时，你却对它发出的冲击波毫无防备。");
         if(get_player().stun(2,33,100,false))
         {
            outputText("<b>震动让你感到惊慌失措，头晕目眩。你需要一点时间来恢复！</b>");
         }
         else
         {
            outputText("你立刻摆脱了震动的影响。想阻止你，这点程度还不够！");
         }
         var _loc1_:Number = 100 * (get_inte() / get_player().get_inte() / 4);
         get_player().takeDamage(_loc1_,true);
      }
      
      public function backhand() : void
      {
         outputText("大理石魔像的面容扭曲成愤怒的表情，它挥动着手，恶毒地向你反手打来。");
         var _loc1_:Number = get_player().reduceDamage(get_str() + get_weaponAttack(),this);
         if(_loc1_ <= 0 || Boolean(combatAvoidDamage(new AvoidDamageParameters(true,false,false,null,null,null,null,null)).attackFailed))
         {
            outputText("你从这突如其来的挥击下躲了过去！");
         }
         else
         {
            outputText("它正中你的胸口。巨大的冲击力让你在空中飞了出去。你伴随着碎裂声撞在墙上。<b>你必须跑回巨人身边才能再次与它近战。</b>");
            distance = CombatDistance.Distant;
            get_player().takeDamage(_loc1_,true);
         }
      }
   }
}

