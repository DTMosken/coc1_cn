package classes.scenes.npcs
{
   import classes.Appearance;
   import classes.CoC;
   import classes.Creature;
   import classes.Monster;
   import classes.PerkLib;
   import classes.Player;
   import classes.ReactionContext;
   import classes.StatusEffectType;
   import classes.StatusEffects;
   import classes.internals.MonsterAI;
   import classes.internals.Utils;
   import classes.scenes.combat.AvoidDamageParameters;
   import classes.scenes.combat.CombatRange;
   import flash.Boot;
   
   public class Isabella extends Monster
   {
      
      public function Isabella()
      {
         if(Boot.skip_constructor)
         {
            return;
         }
         super();
         set_a("");
         set_short("Isabella");
         imageName = "isabella";
         set_long("伊莎贝拉是一个七英尺高、红头发、愤怒的牛娘。她从巨大的盾牌后面向你咆哮，烦躁地跺着蹄子，准备向你发起攻击。她的皮肤是暗褐色的，除了身上散布着一些白斑外，几乎是巧克力色。她穿着一件紧身的丝绸衬衫和一件几乎无法支撑她丰满胸部的紧身胸衣，但在她巨大的盾牌后面很难看清。");
         set_race("Cow-Girl");
         createVagina(false,4,3);
         createStatusEffect(StatusEffects.BonusVCapacity,45,0,0,0);
         createBreastRow(Appearance.breastCupInverse("EE+"));
         ass.analLooseness = 0;
         ass.analWetness = 0;
         createStatusEffect(StatusEffects.BonusACapacity,38,0,0,0);
         set_tallness(90);
         hips.rating = 12;
         butt.rating = 9;
         skin.tone = "dusky";
         hair.color = "red";
         hair.length = 13;
         initStrTouSpeInte(70,98,75,65);
         initLibSensCor(65,25,40);
         set_weaponName("giant shield");
         set_weaponVerb("smash");
         set_weaponAttack(15);
         set_armorName("giant shield");
         set_armorDef(8);
         set_armorPerk("");
         set_armorValue(70);
         bonusHP = 700;
         set_lust(30);
         canBlock = true;
         set_shieldName("巨盾");
         set_shieldBlock(20);
         lustVuln = 0.35;
         temperment = 2;
         level = 15;
         set_gems(Utils.rand(5) + 20);
         tail.type = 4;
         tail.recharge = 0;
         set_drop(NO_DROP);
         checkMonster();
      }
      
      override public function won(param1:Boolean, param2:Boolean = false) : void
      {
         if(param2)
         {
            outputText("[pg][say: 恶心，]伊莎贝拉啧啧两声，转身准备离开……");
            get_game().combat.cleanupAfterCombat();
         }
         else
         {
            get_game().isabellaScene.isabellaDefeats();
         }
      }
      
      override public function react(param1:ReactionContext) : Boolean
      {
         var _loc2_:* = null as StatusEffectType;
         switch(param1.index)
         {
            case 10:
               if(hasStatusEffect(StatusEffects.Blind))
               {
                  outputText("伊莎贝拉听到了枪声，将盾牌转向枪声的方向，用她的钢铁之墙完全挡住了子弹。[pg-]");
               }
               else
               {
                  outputText("你的箭“笃”地一声射中了伊莎贝拉的盾牌，被那面钢铁之墙完全挡住了。[pg-]");
               }
               if(get_game().isabellaFollowerScene.isabellaAccent())
               {
                  outputText("[say: 你让我想起了那些马人。他们也对我的盾牌束手无策！]伊莎贝拉欢呼道。[pg-]");
               }
               else
               {
                  outputText("[say: 你让我想起了那些马人。他们也对我的盾牌束手无策！]伊莎贝拉欢呼道。[pg-]");
               }
               return false;
            case 11:
               _loc2_ = param1.params[0];
               if(_loc2_ == StatusEffects.Blind)
               {
                  if(get_game().isabellaFollowerScene.isabellaAccent())
                  {
                     outputText("[say: 不！我看不见了！]伊莎贝拉哭喊道。[pg-]");
                     break;
                  }
                  outputText("[say: 不！我看不见了！]伊莎贝拉大喊道。[pg-]");
               }
         }
         return true;
      }
      
      override public function performCombatAction() : void
      {
         var _loc1_:MonsterAI = new MonsterAI();
         _loc1_.add(drankMalkYaCunt,0.33,HPRatio() < 0.7,0,FATIGUE_NONE,CombatRange.Self);
         _loc1_.add(isabellaThroatPunch,0.5,get_player().hasSpells() && !get_player().hasStatusEffect(StatusEffects.ThroatPunch),10,FATIGUE_PHYSICAL,CombatRange.Melee);
         _loc1_.add(isabellaStun,0.25,!get_player().hasStatusEffect(StatusEffects.Stunned),10,FATIGUE_PHYSICAL,CombatRange.ChargingMelee);
         _loc1_.add(isabellaAttack,1,true,0,FATIGUE_NONE,CombatRange.ChargingMelee);
         _loc1_.exec();
      }
      
      public function isabellaThroatPunch() : void
      {
         var _loc2_:Number = NaN;
         var _loc1_:Array = ["[BLIND]伊莎贝拉盲目地试图向你冲锋，但完全没有打中。\n","[SPEED]你完全依靠你的速度，在最后一刻闪到了一边。\n","[EVADE]你轻松地躲开了她那直来直去的攻击。\n","[MISDIRECTION]你轻松地误导了她，并在最后一刻闪到了一边。\n","[FLEXIBILITY]你以猫一般的敏捷向后弯腰，躲开了她的攻击。\n","[UNHANDLED]不知怎么的，你设法躲开了她的拳头。","[BLOCK]你及时举起盾牌，她的拳头只打在了你坚硬的[shield]上。","[PARRY]你设法用你的[if (isunarmed) {own|[weapon]}]格挡了她的拳头。"];
         outputText("伊莎贝拉从盾牌后挥出一拳，直击你的喉咙！");
         if(!playerAvoidDamage(new AvoidDamageParameters(true,true,true,null,false,null,null,null),_loc1_))
         {
            _loc2_ = get_player().reduceDamage(get_str(),this);
            if(_loc2_ <= 0)
            {
               outputText("你设法用自己的拳头挡住了她。\n");
            }
            else if(get_player().hasPerk(PerkLib.Resolute) && get_player().get_tou() >= 75)
            {
               outputText("多亏了你惊人的体质，你果断地无视了这一击。\n");
            }
            else
            {
               outputText("你拼尽全力想要挡住这来势汹汹的一拳，但它还是结结实实地打在了你的喉咙上，几乎让你的气管完全塌陷。你喘着粗气，咳嗽着，努力想要呼吸，虽然很困难，但你还是勉强吸入了足够的空气，避免了窒息。<b>在这种状态下，你根本无法集中注意力施放法术！</b>");
               get_player().takeDamage(_loc2_,true);
               outputText("\n");
               get_player().createStatusEffect(StatusEffects.ThroatPunch,2,0,0,0);
            }
         }
      }
      
      public function isabellaStun() : void
      {
         var _loc2_:Number = NaN;
         var _loc1_:Array = ["[BLIND]伊莎贝拉盲目地试图向你冲锋，但完全没有命中。\n","[SPEED]你在最后一刻躲闪到一边，完全依靠你的速度。\n","[EVADE]你轻松地避开了她极其直线的攻击。\n","[MISDIRECTION]你轻松地误导了她，并在最后一刻闪到一边。\n","[FLEXIBILITY]你以猫娘般的敏捷向后弯腰，避开了她的攻击。\n","[UNHANDLED]不知怎么的，你设法翻滚着躲开了盾击。\n"];
         outputText("伊莎贝拉将盾牌转回，借着钢铁的重量，向你挥出一记强有力的反手击打。");
         if(!playerAvoidDamage(new AvoidDamageParameters(true,false,false,null,false,null,null,null),_loc1_))
         {
            _loc2_ = get_player().reduceDamage(eBaseDamage(),this);
            if(_loc2_ < 0)
            {
               outputText("你格挡开了她的攻击，没有受到任何伤害。\n");
            }
            else
            {
               outputText("你试图躲避，但她钢铁般的攻击还是击中了你，将你击退。你踉跄着试图稳住身形，但光是站稳就已经耗尽了你所有的力气。<b>伊莎贝拉将你击晕了！</b>");
               get_player().takeDamage(_loc2_,true);
               outputText("\n");
               get_player().stun(1,100);
            }
         }
      }
      
      public function isabellaAttack() : void
      {
         var _loc2_:Number = NaN;
         outputText("伊莎贝拉哼了一声，放低盾牌，片刻后便开始向你冲锋。她以惊人的速度拉近距离，蹄子在地上刨出巨大的坑洞！");
         var _loc1_:Array = ["[BLIND]伊莎贝拉盲目地试图向你冲锋，但完全没打中。\n","[SPEED]你在最后一刻闪到一边，完全依靠你的速度。\n","[EVADE]你轻松避开了她那直来直去的攻击。\n","[MISDIRECTION]你轻松误导了她，并在最后一刻闪到一边。\n","[FLEXIBILITY]你在最后一刻以猫娘般的敏捷将自己抛开，避开了她的攻击。\n","[UNHANDLED]不知怎么的，你设法跳起来并滚开，躲过了那可怕的冲锋。\n","[BLOCK]你举起自己的盾牌，正面接下了冲锋！你成功挡住了她的冲锋，这让她非常惊讶。"];
         if(!playerAvoidDamage(new AvoidDamageParameters(true,false,true,null,false,null,null,null),_loc1_))
         {
            _loc2_ = get_player().reduceDamage(get_weaponAttack() + get_str() + 20,this);
            if(_loc2_ < 0)
            {
               outputText("你稳住下盘，双手接住她的盾牌，双脚在泥土中拖行，硬生生将她的冲锋逼停。她低头看着你，完全被你展现出的力量惊呆了。");
            }
            else
            {
               outputText("她冲得太快，你根本来不及躲闪，只能被迫尝试阻止她。但这毫无作用。伊莎贝拉的盾牌狠狠地撞上了你，震得你耳鸣眼花，重重地摔在地上，浑身淤青。");
               get_player().takeDamage(_loc2_,true);
               outputText("\n");
            }
         }
      }
      
      public function drankMalkYaCunt() : void
      {
         outputText("伊莎贝拉从她低胸的衬衫里掏出一只乳房，开始吸吮其中一个多头的乳头。她的脸颊鼓起又瘪下，你目不转睛地看着，完全被迷住了。她吸完后，将那沉甸甸的肉球塞了回去，脸红得像个熟透的苹果。这短暂的饮用似乎让她重新焕发了活力，而看着这一幕也确实让你兴奋了起来。");
         addHP(100);
         set_lust(get_lust() + 5);
         get_player().takeLustDamage(10 + get_player().lib / 20,true);
      }
      
      override public function defeated(param1:Boolean) : void
      {
         get_game().isabellaScene.defeatIsabella();
      }
   }
}

