package classes.scenes.monsters
{
   import classes.CoC;
   import classes.CockTypesEnum;
   import classes.Monster;
   import classes.PerkLib;
   import classes.Player;
   import classes.StatusEffects;
   import classes.internals.MonsterAI;
   import classes.internals.Utils;
   import classes.internals.WeightedChoice;
   import classes.items.ConsumableLib;
   import classes.scenes.combat.CombatAbility;
   import classes.scenes.combat.CombatAttackBuilder;
   import classes.scenes.combat.CombatDistance;
   import classes.scenes.combat.CombatRange;
   import flash.Boot;
   import haxe.IMap;
   import haxe.ds.StringMap;
   
   public class PlaceholderDodgyMonster extends Monster
   {
      
      public var tossedDagger:String;
      
      public var dodgeStance:Boolean;
      
      public var abilityDodgeChance:IMap;
      
      public function PlaceholderDodgyMonster(param1:Boolean = false)
      {
         if(Boot.skip_constructor)
         {
            return;
         }
         tossedDagger = "";
         dodgeStance = false;
         abilityDodgeChance = new StringMap();
         super();
         if(param1)
         {
            return;
         }
         set_a("");
         set_short("A dodgy dog placeholder");
         imageName = "ArenaDog";
         set_long("站在你面前的是一个头发灰白、伤痕累累的犬娘。他身高五英尺九英寸，全身覆盖着黑色的短毛。他穿着简单的布裤和一件轻便、风化的皮甲，可能是为了避免任何会妨碍他敏捷性的东西。他挥舞着一对长长的锯齿匕首，如果真的击中，肯定会造成深深的撕裂伤。他棕色的眼睛坚定不移地盯着你，你每动一块肌肉，他尖尖的耳朵就会竖起来指向你。毫无疑问，他非常专注。");
         set_race("dog-morph");
         createCock(6,2,CockTypesEnum.DOG);
         balls = 2;
         ballSize = 3;
         createBreastRow(0);
         ass.analLooseness = 1;
         ass.analWetness = 1;
         set_tallness(69);
         hips.rating = 0;
         butt.rating = 2;
         skin.tone = "light gray";
         hair.color = "light gray";
         hair.length = 0;
         horns.type = 0;
         initStrTouSpeInte(90,75,100,40);
         initLibSensCor(30,30,25);
         set_weaponName("serrated daggers");
         set_weaponVerb("stab");
         set_weaponAttack(25);
         set_armorName("leather armor");
         set_armorDef(5);
         set_lust(5);
         temperment = 1;
         level = 20;
         createPerk(PerkLib.Prescience);
         createPerk(PerkLib.Bloodhound);
         createPerk(PerkLib.Tactician);
         if(!get_game().bazaar.demonFistFighterScene.saveContent.shookDogHand)
         {
            set_weaponAttack(get_weaponAttack() + 10);
         }
         set_gems(Utils.rand(5) + 250);
         set_drop(new WeightedChoice().add(get_consumables().DBLPEPP,2));
         checkMonster();
      }
      
      override public function won(param1:Boolean, param2:Boolean = false) : void
      {
      }
      
      public function tossDagger() : void
      {
         outputText("[say: 真烦人，]他说道，对你们之间的距离感到沮丧。他将右手的匕首抛向空中，然后抓住刀尖。接着，他眯起眼睛，以惊人的速度将匕首向你掷来！");
         var _loc1_:CombatAttackBuilder = new CombatAttackBuilder().canDodge().canBlock().setHitChance(get_player().standardDodgeFunc(this,10));
         _loc1_.setCustomBlock("你及时举起盾牌挡住了飞来的刀刃，刀尖深深地扎进了盾牌表面。你不禁想，如果它真的刺中[i: you]，会刺得多深。你的对手因为攻击失败而呻吟，他意识到自己现在的战斗力大打折扣了。");
         _loc1_.setCustomAvoid("你及时地一个翻滚，刀刃呼啸着擦过你的身体。匕首深深地扎进了擂台周围的一根柱子上。你不禁想，如果它真的击中了[i:你]，会扎得多深。你的对手因为攻击失败而呻吟了一声，他意识到自己现在的战斗力大打折扣了。");
         if(_loc1_.isSuccessfulHit())
         {
            outputText("[pg]你没能及时躲开，匕首击中了你，深深地扎进了你的肩膀。你痛苦地呻吟着，用颤抖的手摸向那把入侵的利刃，但锯齿状的边缘提醒你，拔出它可能和刺入时造成的伤害一样大。你觉得现在最好还是把它留在那里。");
            get_player().takeDamage(calcDamage() * 0.75);
            tossedDagger = "hit";
         }
         if(_loc1_.isDodged())
         {
            tossedDagger = "dodged";
         }
         if(_loc1_.isBlocked())
         {
            tossedDagger = "blocked";
         }
      }
      
      public function retrieveDagger() : void
      {
         var _loc1_:String = tossedDagger;
         if(_loc1_ == "blocked")
         {
            outputText("[Themonster]向前猛扑，似乎准备进行一次简单的正面刺击。你准备好防御这出乎意料的简单攻击，举起盾牌准备。然后他暴露了他的佯攻，迅速改变姿势，抓住卡在你盾牌上的刀刃。他抬起一条腿，将其放在盾牌表面，试图获得一些杠杆作用将其拔出。注意到他的企图，你试图将他击退，但你的企图只是给了他拔出刀刃并在过程中拉开距离所需的动力，利用你的装备作为跳板。");
            outputText("[pg]他分析他取回的刀刃，看看它是否还能用于战斗。他确认了这一点，并重新进入战斗姿态。");
         }
         else if(_loc1_ == "dodged")
         {
            outputText("[Themonster]向前猛扑，似乎准备进行一次简单的正面攻击。你准备好防御，但[monster.he]在最后一秒暴露了他的佯攻，将他的猛扑变成了一个前滚翻。他翻滚的额外动力迅速让[monster.him]绕到了你的身后，你迅速转身再次面对你的攻击者。令你惊讶的是，你发现他在擂台的另一个角落，就在他意外卡住匕首的柱子旁边。他用力一拉，拔出了武器，迅速分析刀刃，看看它是否还能用于战斗。他确认了这一点，并重新进入战斗姿态。");
         }
         else if(_loc1_ == "hit")
         {
            outputText("[Themonster]向前猛扑，似乎准备进行一次简单的正面攻击。你准备好防御，但[monster.he]在最后一秒暴露了他的佯攻，将他的猛扑变成了一个前滚翻，让你措手不及。他翻滚的额外动力迅速让[monster.him]绕到了你的身后，你迅速转身再次面对你的攻击者。你几乎没有时间注意到[monster.his]举起的手就在那把卡住的匕首旁边，[monster.his]对你下一步行动的预测完全准确。");
            if(!get_game().bazaar.demonFistFighterScene.saveContent.shookDogHand)
            {
               outputText("[pg]你的肩膀一阵剧痛，因为他的手在你自己转身的动力的帮助下，将刀刃更深地刺入了你的身体。");
               if(get_player().hasPerk(PerkLib.Resolute))
               {
                  outputText("然而，你咬紧牙关忍住疼痛，在[monster.he]抓住他丢失的武器时抓住了[monster.his]的手腕。注意到你没有被疼痛惊呆，[monster.he]迅速踢了你的肋骨一脚，足以让你失去注意力并放开他。他拔出刀刃，一股小血柱从伤口喷涌而出，并迅速拉开距离。[pg][monster.He]盯着你笑了笑，尊重你没有因疼痛而崩溃的意志力。");
               }
               else
               {
                  outputText("你被疼痛压倒了，除了呻吟之外什么也做不了。他笑了笑，花了一些时间幸灾乐祸。[say:真可悲。]他慢慢地拔出刀刃，一股小血柱从伤口喷涌而出，然后漫不经心地走回去拉开距离，抛接他取回的武器。");
               }
            }
            else
            {
               outputText("[pg]他利用意外疼痛创造的机会，迅速抓住匕首的刀柄并将其拔出，随着液体开始从现在敞开的伤口中涌出，在空中形成了一道令人印象深刻的血弧。");
               if(get_player().hasPerk(PerkLib.Resolute))
               {
                  outputText("[pg]他决定给你一个公平的机会让你恢复，但惊讶地发现你设法咬紧牙关忍住了疼痛。他露出尊重的微笑，并点头示意你攻击。");
               }
               else
               {
                  outputText("[pg]他决定给你一个公平的机会让你恢复。你绷紧身体，恢复了理智，绝对庆幸他没有利用这个机会发动另一次攻击。");
               }
            }
            get_player().bleed(this);
         }
      }
      
      override public function performCombatAction() : void
      {
         var _loc1_:* = null as String;
         var _loc2_:int = 0;
         var _loc3_:* = null as IMap;
         var _loc4_:* = null as StringMap;
         var _loc5_:* = null as Object;
         var _loc6_:int = 0;
         var _loc7_:* = null as StringMap;
         if(get_game().combat.currAbilityUsed != null)
         {
            _loc1_ = get_game().combat.currAbilityUsed.spellName;
            _loc2_ = get_game().bazaar.demonFistFighterScene.saveContent.shookDogHand ? 20 : 15;
            _loc3_ = abilityDodgeChance;
            _loc4_ = abilityDodgeChance;
            _loc5_ = _loc1_ in StringMap.reserved ? _loc4_.getReserved(_loc1_) : _loc4_.h[_loc1_];
            _loc6_ = (_loc5_ != null ? int(_loc5_) : 0) + _loc2_;
            _loc7_ = _loc3_;
            if(_loc1_ in StringMap.reserved)
            {
               _loc7_.setReserved(_loc1_,_loc6_);
            }
            else
            {
               _loc7_.h[_loc1_] = _loc6_;
            }
         }
         var _loc8_:MonsterAI = new MonsterAI();
         _loc8_.add(eAttack,1,true,10,FATIGUE_PHYSICAL,CombatRange.Ranged);
         _loc8_.add(dodgeExec,99,dodgeStance && hasStatusEffect(StatusEffects.DodgedAttack),10,FATIGUE_PHYSICAL,CombatRange.Melee);
         _loc8_.add(tossDagger,1,distance == CombatDistance.Distant,10,FATIGUE_PHYSICAL,CombatRange.Ranged);
         _loc8_.add(retrieveDagger,3,tossedDagger != "",5,FATIGUE_PHYSICAL,CombatRange.Ranged);
         _loc8_.exec();
         if(hasFatigue(10,FATIGUE_PHYSICAL) && Utils.rand(4) == 0 && !dodgeStance)
         {
            dodgePrepare();
         }
         else
         {
            dodgeStance = false;
         }
      }
      
      override public function getEvasionChance() : Number
      {
         var _loc2_:* = null as IMap;
         var _loc3_:* = null as String;
         var _loc4_:* = null as StringMap;
         var _loc5_:* = null as Object;
         var _loc1_:Number = Number(super.getEvasionChance());
         if(get_game().combat.currAbilityUsed != null)
         {
            _loc2_ = abilityDodgeChance;
            _loc3_ = get_game().combat.currAbilityUsed.spellName;
            _loc4_ = _loc2_;
            _loc5_ = _loc3_ in StringMap.reserved ? _loc4_.getReserved(_loc3_) : _loc4_.h[_loc3_];
            _loc1_ += _loc5_ != null ? int(_loc5_) : 0;
         }
         return _loc1_;
      }
      
      override public function eAttack() : void
      {
         if(tossedDagger != "")
         {
            createStatusEffect(StatusEffects.Attacks,2);
         }
         super.eAttack();
      }
      
      public function dodgePrepare() : void
      {
         outputText("[pg][Themonster]放下了武器，变得更加放松，歪着头看着你。[he]是在嘲讽你吗？");
         dodgeStance = true;
      }
      
      public function dodgeExec() : void
      {
         outputText("[Themonster]以不可思议的速度离开了你的视线，让你失去了他的踪迹。然而，你的困惑是短暂的，因为你随后感觉到几颗牙齿刺穿了你的脖子，他的下巴紧紧咬住了它！");
         if(get_player().get_str() > 75 && Utils.rand(get_player().get_str()) > 70 && get_player().get_tou() > 80)
         {
            outputText("[pg]你强忍着剧痛，把手伸向脑后抓住他的下巴，试图把它们掰开，远离你的脖子。你所处的位置让这变得极其困难，但你还是用尽全力做到了。尽管仍在与他的力量抗衡，但在他的下巴被撬开后，你猛地向后仰头，用后脑勺撞击他的鼻子，导致他发出一声非常像犬类的呜咽并退缩了。好险！");
         }
         else
         {
            outputText("[pg]突如其来的剧痛和他的力量让你不知所措，你几乎无法阻止他的攻击。他大声而狂暴地摇晃和甩动他的头，而他的下巴仍然紧紧咬住你的脖子，造成了可怕的、极深的恶性伤口。你拼命地试图击打你的攻击者，当他的一次狂野动作使他靠近你的一只手臂时，你试图用手肘击打他。这花了令人痛苦的几秒钟，但你成功地击中了他的肋骨，夺走了他的势头，并削弱了他，足以让你把他推开。");
            get_player().takeDamage(get_player().reduceDamage(get_str() * 2 + Utils.rand(60),this,0.7),true);
            if(get_player().bleed(this,3,3))
            {
               outputText("[pg]鲜血从你脖子上的伤口大量喷涌而出。你感到头晕目眩，虚弱无力，当你看着你的对手时，他露出了胜利的冷笑。");
            }
         }
      }
      
      override public function defeated(param1:Boolean) : void
      {
      }
   }
}

