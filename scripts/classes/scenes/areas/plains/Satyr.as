package classes.scenes.areas.plains
{
   import classes.CoC;
   import classes.CockTypesEnum;
   import classes.Creature;
   import classes.Monster;
   import classes.Player;
   import classes.StatusEffects;
   import classes.internals.ChainedDrop;
   import classes.internals.MonsterAI;
   import classes.internals.Utils;
   import classes.items.ConsumableLib;
   import classes.scenes.combat.AvoidDamageParameters;
   import classes.scenes.combat.CombatRange;
   import flash.Boot;
   
   public class Satyr extends Monster
   {
      
      public var charged:Boolean;
      
      public function Satyr()
      {
         if(Boot.skip_constructor)
         {
            return;
         }
         charged = false;
         super();
         set_a("");
         set_short("satyr");
         imageName = "satyr";
         set_long("从腰部往上，你的对手完全是人类的模样，除了他那卷曲的、像山羊一样的角和他尖尖的、像精灵一样的耳朵。他肌肉发达的胸膛裸露着，闪烁着汗水，而他粗犷、充满男子气概的五官扭曲成一种野蛮情欲的表情。看着他的腰部，你注意到他有点大肚子，毫无疑问这是大量饮酒的结果，从他身上散发出的几乎令人难以忍受的酒精和性爱的气味就可以判断出来。再往下看，你会看到他的腿是两足山羊粗糙、长满硬毛的腿，分叉的蹄子不耐烦地刨着地，巨大的男性器官在微风中自由地摇摆着。");
         set_race("Satyr");
         createCock(Utils.rand(13) + 14,1.5 + Utils.rand(20) / 2,CockTypesEnum.HUMAN);
         balls = 2;
         ballSize = 2 + Utils.rand(13);
         cumMultiplier = 1.5;
         set_hoursSinceCum(ballSize * 10);
         createBreastRow(0);
         ass.analLooseness = 4;
         ass.analWetness = 1;
         createStatusEffect(StatusEffects.BonusACapacity,20,0,0,0);
         set_tallness(Utils.rand(37) + 64);
         hips.rating = 4;
         butt.rating = 5;
         lowerBody.type = 1;
         skin.tone = "tan";
         var _loc1_:Array = ["black","brown"];
         var _loc2_:String = _loc1_[Utils.rand(int(_loc1_.length))];
         hair.color = _loc2_;
         var _loc3_:int = Utils.rand(20);
         hair.length = 3 + _loc3_;
         face.type = 3;
         initStrTouSpeInte(75,70,110,70);
         initLibSensCor(60,35,45);
         set_weaponName("fist");
         set_weaponVerb("punch");
         set_armorName("thick fur");
         bonusHP = 300;
         set_lust(20);
         lustVuln = 0.3;
         temperment = 1;
         level = 14;
         set_gems(Utils.rand(25) + 25);
         set_drop(new ChainedDrop().add(get_consumables().INCUBID,0.5));
         tail.type = 4;
         checkMonster();
      }
      
      override public function won(param1:Boolean, param2:Boolean = false) : void
      {
         if(param2)
         {
            outputText("[pg]萨堤尔对你的急切放声大笑……");
            doNext(get_game().combat.endLustLoss);
         }
         else
         {
            get_game().plains.satyrScene.loseToSatyr();
         }
      }
      
      public function satyrCharge() : void
      {
         var _loc1_:* = null;
         var _loc2_:Number = NaN;
         outputText("萨堤尔低下头上的角，用蹄子刨着地，开始打响鼻；他显然在盘算着什么。");
         if(hasStatusEffect(StatusEffects.Blind) && Utils.rand(3) < 1)
         {
            outputText(get_capitalA() + Utils.cnName(get_short()) + "因为失明完全没有打中你！\n");
         }
         else
         {
            _loc1_ = combatAvoidDamage(new AvoidDamageParameters(true,false,false,null,null,null,null,null));
            if(_loc1_.dodge == EVASION_EVADE)
            {
               outputText("他大叫一声向你冲来，但你凭借闪避技巧灵活地躲开了，并用你的[weapon]进行了猛烈的反击，将他击倒在地，疼得大叫。(5)");
               set_HP(get_HP() - 5);
            }
            else if(_loc1_.dodge == EVASION_FLEXIBILITY)
            {
               outputText("他大叫一声向你冲来，但你凭借柔韧性灵活地躲开了，并用你的[weapon]进行了猛烈的反击，将他击倒在地，疼得大叫。(5)");
               set_HP(get_HP() - 5);
            }
            else if(_loc1_.dodge == EVASION_MISDIRECTION)
            {
               outputText("他大叫一声向你冲来，但你凭借误导技巧灵活地躲开了，并用你的[weapon]进行了猛烈的反击，将他击倒在地，疼得大叫。(5)");
               set_HP(get_HP() - 5);
            }
            else if(_loc1_.dodge == EVASION_SPEED || _loc1_.dodge != null)
            {
               outputText("他大叫一声向你冲来，但你灵活地躲开了，并用你的[weapon]进行了猛烈的反击，将他击倒在地，疼得大叫。(5)");
               set_HP(get_HP() - 5);
            }
            else
            {
               _loc2_ = get_player().reduceDamage(get_str() + get_weaponAttack(),this);
               if(_loc2_ > 0)
               {
                  outputText("他大叫一声向你冲来，让你猝不及防，将你撞飞倒地。");
                  if(get_player().stun(0,33))
                  {
                     outputText("撞击的疼痛如此剧烈，让你感到完全头晕目眩，几乎眼冒金星。");
                  }
                  get_player().takeDamage(_loc2_,true);
               }
               else
               {
                  outputText("他向你冲来，但你在最后一秒成功地将其弹开。");
               }
            }
         }
         charged = true;
      }
      
      public function satyrBate() : void
      {
         outputText("他瞪着你，喘着粗气，舌头伸在外面，开始自慰。你几乎能从他的眼睛里看到他淫荡的想法，先列腺液在他的巨根上形成珠状，并开始顺着勃起的肉棒滑落。");
         get_player().takeLustDamage(get_player().lib / 5 + 4,true);
         set_lust(get_lust() + 5);
      }
      
      public function satyrAttack() : void
      {
         var _loc1_:Number = NaN;
         outputText("萨堤尔挥舞着长满老茧的拳头向你打来。");
         if(hasStatusEffect(StatusEffects.Blind) && Utils.rand(3) < 1)
         {
            outputText(get_capitalA() + Utils.cnName(get_short()) + "盲目的一拳完全没有打中你！\n");
         }
         else if(Boolean(combatAvoidDamage(new AvoidDamageParameters(true,true,false,null,null,null,null,null)).attackFailed))
         {
            outputText("你躲过了他的攻击，拳头在空中无害地挥舞着，他愤怒地咆哮起来。");
         }
         else
         {
            _loc1_ = get_player().reduceDamage(get_str() + get_weaponAttack(),this);
            if(_loc1_ > 0)
            {
               outputText("感觉就像被木棍击中了一样！");
               get_player().takeDamage(_loc1_,true);
            }
            else
            {
               outputText("你成功地挡住了它。");
            }
         }
      }
      
      override public function performCombatAction() : void
      {
         var _loc1_:MonsterAI = new MonsterAI();
         _loc1_.add(highLustChugRape,1,get_lust() >= 75,0,FATIGUE_NONE,CombatRange.Melee);
         _loc1_.add(satyrBate,1,get_lust() < 75,5,FATIGUE_NONE,CombatRange.Tease);
         _loc1_.add(bottleChug,2,true,0,FATIGUE_NONE,CombatRange.Self);
         _loc1_.add(satyrCharge,1,!charged,10,FATIGUE_PHYSICAL,CombatRange.ChargingMelee);
         _loc1_.add(satyrAttack,1,true,0,FATIGUE_NONE,CombatRange.Melee);
         _loc1_.exec();
      }
      
      public function highLustChugRape() : void
      {
         outputText("萨堤尔喘着粗气，几乎无法抑制自己的欲望，他向你冲来，试图将你撞倒在地。");
         if(hasStatusEffect(StatusEffects.Blind) && Utils.rand(3) < 1)
         {
            outputText(get_capitalA() + Utils.cnName(get_short()) + "因为失明完全没有打中你！\n");
         }
         else if(Boolean(combatAvoidDamage(new AvoidDamageParameters(true,false,false,null,null,null,null,null)).attackFailed))
         {
            outputText("当他冲向你时，你抓住他的角并转过身，将他甩开。");
         }
         else
         {
            outputText("你伴随着<b>砰</b>的一声重重摔倒在地，萨堤尔甚至懒得脱掉你的衣服，就开始用他巨大的肉棒在你的身体上摩擦，直到他射精，用黏糊糊的滚烫精液弄脏了你的[armor]和[skinfurscales]。随着精液在你身上摩擦，你因不情愿的兴奋而颤抖。");
            set_lust(get_lust() - 50);
            get_player().takeLustDamage(get_player().sens / 5 + 20,true);
         }
      }
      
      override public function defeated(param1:Boolean) : void
      {
         get_game().plains.satyrScene.defeatASatyr();
      }
      
      public function bottleChug() : void
      {
         outputText("他不知从哪儿掏出一瓶酒，开始大口灌下去，然后朝你打了个响亮的嗝。那气味太难闻了，你厌恶地捂住鼻子，但当你吸入一些恶臭的气味时，你感到浑身发热。");
         get_player().takeLustDamage(get_player().lib / 5,true);
         set_lust(get_lust() + 5);
      }
   }
}

