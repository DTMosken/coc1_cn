package classes.scenes.areas.forest
{
   import classes.Appearance;
   import classes.CoC;
   import classes.CockTypesEnum;
   import classes.PerkLib;
   import classes.Player;
   import classes.ReactionContext;
   import classes.StatusEffects;
   import classes._FlagDict.FlagDict_Impl_;
   import classes.globalFlags.KFLAGS;
   import classes.internals.MonsterAI;
   import classes.internals.Utils;
   import classes.internals.WeightedChoice;
   import classes.items.ConsumableLib;
   import classes.scenes.combat.CombatRange;
   import flash.Boot;
   import haxe.IMap;
   import haxe.ds.StringMap;
   
   public class Kitsune extends BaseKitsune
   {
      
      public function Kitsune(param1:String = undefined)
      {
         if(Boot.skip_constructor)
         {
            return;
         }
         super();
         init(param1);
      }
      
      override public function won(param1:Boolean, param2:Boolean = false) : void
      {
         if(param2)
         {
            outputText("[pg]狐妖退缩了，然后跑开了，对你不再感兴趣……");
            get_game().combat.cleanupAfterCombat();
         }
         else
         {
            get_game().forest.kitsuneScene.loseToKitsunes();
         }
      }
      
      override public function react(param1:ReactionContext) : Boolean
      {
         if(param1.index == 3)
         {
            if(hasStatusEffect(StatusEffects.PCTailTangle))
            {
               kitsuneWait();
               tookAction = true;
               return false;
            }
         }
         return true;
      }
      
      override public function performCombatAction() : void
      {
         var _g:Kitsune;
         var _loc1_:MonsterAI = new MonsterAI().add(foxFireAttack,2);
         _loc1_.add(kitSuneTeases,2,true,0,FATIGUE_NONE,CombatRange.Tease);
         _g = this;
         _loc1_.add(function():void
         {
            _g.kitsuneSealAttack();
         },2,!get_player().hasStatusEffect(StatusEffects.Sealed),10,FATIGUE_MAGICAL,CombatRange.Ranged);
         _loc1_.add(kitsuneEntwine,1,!hasStatusEffect(StatusEffects.PCTailTangle),10,FATIGUE_PHYSICAL,CombatRange.Melee);
         _loc1_.add(illusionKitsuneAttack,1,!hasStatusEffect(StatusEffects.Illusion),10,FATIGUE_MAGICAL,CombatRange.Self);
         _loc1_.exec();
      }
      
      public function kitsuneWait() : void
      {
         clearOutput();
         outputText("你高兴地瘫倒在毛茸茸的尾巴里，引来狐妖一阵被逗乐的咯咯笑声。");
         if(get_game().get_silly())
         {
            outputText("你很高兴能摸到毛茸茸的尾巴。");
         }
         outputText("[pg]她舔了舔嘴唇，双手在你身上游走，抚摸着每一寸裸露的肌肤。她的指尖留下一道道耀眼的蓝色光晕，让你欲火焚身——你必须尽快挣脱她的掌控，否则你就会像她手中的软泥一样任其摆布！");
         var _loc1_:int = int(5 + get_player().sens / 10);
         get_player().takeLustDamage(_loc1_,true);
      }
      
      public function kitsuneStruggle() : void
      {
         var _loc1_:int = 0;
         clearOutput();
         outputText("你拼尽全力挣脱狐妖的尾巴，拼命想在她得逞之前挣脱出来。");
         if(Utils.rand(20) + get_player().get_str() / 20 + statusEffectv1(StatusEffects.PCTailTangle) >= 12)
         {
            outputText("召唤出你不知道自己拥有的力量储备，你挣脱了她的尾巴，把她推开。[pg]");
            removeStatusEffect(StatusEffects.PCTailTangle);
         }
         else
         {
            outputText("尽管你英勇地努力，但你的扭动只会让你更深地陷入毛茸茸的尾巴中，引来狐妖一阵被逗乐的咯咯笑声。");
            outputText("[pg]她舔了舔嘴唇，双手在你身上游走，抚摸着每一寸裸露的肌肤。她的指尖留下一道道耀眼的蓝色光晕，让你欲火焚身——你必须尽快挣脱她的掌控，否则你就会像她手中的软泥一样任其摆布！");
            _loc1_ = int(5 + get_player().sens / 10);
            get_player().takeLustDamage(_loc1_,true);
            addStatusValue(StatusEffects.PCTailTangle,1,3);
         }
         tookAction = true;
      }
      
      public function kitsuneEntwine() : void
      {
         outputText("狐妖向你逼近，眼中闪烁着调皮的光芒。你提高警惕，眼睛紧紧盯着她，以确保她不会耍什么花招。突然，你感觉到有什么东西缠住了你的[leg]，你发出一声惊呼，因为你突然被抛到了半空中，被狐妖的尾巴缠住了！");
         outputText("[pg]你的四肢被紧紧地束缚着，而令人愉悦的柔软皮毛在四面八方抚摸着你。除了在毛茸茸的束缚中挣扎之外，你什么也做不了，因为她尾巴不断的蠕动让你脊背发凉。");
         createStatusEffect(StatusEffects.PCTailTangle,0,0,0,0);
         var _loc1_:int = int(10 + get_player().sens / 8);
         get_player().takeLustDamage(_loc1_,true);
      }
      
      public function kitSuneTeases() : void
      {
         var _loc1_:int = Utils.rand(3);
         if(hair.color == "red" && Utils.rand(2) == 0)
         {
            _loc1_ = 3;
         }
         if(_loc1_ == 0)
         {
            outputText("你揉了揉眼睛，突然看到三重幻影，发现自己被一群狐妖的分身包围了。她们的双手在你身上游走，挑逗着你，宠溺着你，她们的尾巴抚摸着你身体的每一寸肌肤。你被打了个措手不及，甚至忘了反击，直到她们已经散去，重新融合成一个狐妖。");
         }
         else if(_loc1_ == 1)
         {
            outputText("狐妖向前弯下腰，双手顺着乳房滑下，诱人地抖动着，并将它们挤在一起。她用手指勾住长袍，向下滑动，将长袍拉到一边，直到乳头勉强被遮住，然后带着戏谑的冷笑，又将长袍拉了上去，让你欲罢不能。");
         }
         else if(_loc1_ == 2)
         {
            outputText("狐妖转过身背对着你，展开她的尾巴，一边回头看，一边掀起长袍的下摆，露出丰满的臀部。她的尾巴不断地移动和扭曲，挡住了你的视线，但这只会让你<i>更</i>想要，你满怀期待地舔了舔嘴唇。");
         }
         else
         {
            outputText("狐妖突然出现在你面前，诱人地扭动着臀部，在你的身侧摩擦着。她挑逗的抚摸让你因兴奋而颤抖，你能感觉到有什么又粗又热的东西压在你的[hips]上。她从你身边离开时，给了你一个苦笑，长袍下明显顶起了一个帐篷。[say:你等着瞧……]");
         }
         var _loc2_:int = int(5 + get_player().sens / 7);
         get_player().takeLustDamage(_loc2_,true);
      }
      
      public function init(param1:String) : void
      {
         var _loc2_:IMap = new StringMap();
         if("blonde" in StringMap.reserved)
         {
            _loc2_.setReserved("blonde","亚麻色长");
         }
         else
         {
            _loc2_.h["blonde"] = "亚麻色长";
         }
         if("black" in StringMap.reserved)
         {
            _loc2_.setReserved("black","及臀的亮黑色");
         }
         else
         {
            _loc2_.h["black"] = "及臀的亮黑色";
         }
         if("red" in StringMap.reserved)
         {
            _loc2_.setReserved("red","齐肩的凌乱微红色");
         }
         else
         {
            _loc2_.h["red"] = "齐肩的凌乱微红色";
         }
         var _loc3_:IMap = _loc2_;
         if(Utils.rand(3) > 0)
         {
            FlagDict_Impl_.arrayWriteInt(KFLAGS.flags,627,1);
         }
         set_a("");
         set_short("kitsune");
         imageName = "kitsune";
         set_long("一只狐妖站在你面前，大约五英尺半高。她长着一头" + (param1 in StringMap.reserved ? _loc3_.getReserved(param1) : _loc3_.h[param1]) + "发。除了从头发里探出的一对毛茸茸的大耳朵，以及身后在空中摇曳的六条华丽柔顺的尾巴外，她看起来和人类差不多。她的长袍很暴露，但看起来很舒适，紧贴着她丰满的曲线，露出了大片带有纹身的肌肤。一层华丽的纹身覆盖在她裸露的皮肤上，很好地凸显了她女性的曲线，她的每一个动作都会让丰满的臀部和硕大的乳房产生令人愉悦的晃动。");
         set_race("Kitsune");
         if(param1 == "red" && FlagDict_Impl_.arrayReadInt(KFLAGS.flags,627) == 1)
         {
            createCock(Utils.rand(13) + 14,1.5 + Utils.rand(20) / 2,CockTypesEnum.HUMAN);
            balls = 2;
            ballSize = 2 + Utils.rand(13);
            cumMultiplier = 1.5;
            set_hoursSinceCum(ballSize * 10);
         }
         createVagina(false,3,1);
         createStatusEffect(StatusEffects.BonusVCapacity,20,0,0,0);
         createBreastRow(Appearance.breastCupInverse("D"));
         ass.analLooseness = 1;
         ass.analWetness = 1;
         createStatusEffect(StatusEffects.BonusACapacity,20,0,0,0);
         set_tallness(Utils.rand(24) + 60);
         hips.rating = 6;
         butt.rating = 5;
         skin.tone = "pale";
         hair.color = param1;
         var _loc4_:int = Utils.rand(20);
         hair.length = 13 + _loc4_;
         initStrTouSpeInte(35,45,90,95);
         initLibSensCor(60,65,45);
         set_weaponName("claws");
         set_weaponVerb("punch");
         set_armorName("skin");
         bonusHP = 120;
         set_lust(20);
         lustVuln = 0.9;
         temperment = 1;
         level = 6;
         set_gems(Utils.rand(10) + 10);
         set_drop(new WeightedChoice(get_consumables().FOXJEWL,1));
         createPerk(PerkLib.EnlightenedNinetails);
         createPerk(PerkLib.SpellcastingAffinity,25);
         tail.type = 13;
         checkMonster();
      }
      
      public function illusionKitsuneAttack() : void
      {
         outputText("你努力将视线锁定在狐妖身上，当你转来转去试图追踪她的动作时，幽灵般的笑声在你周围回荡。现实的边缘似乎在她周围变得模糊，严重扭曲了你的感知，让你很难跟上她的动作。如果她继续这样下去，要击中她就难上加难了！");
         var _loc1_:int = calculateAttackResist();
         if(Utils.rand(100) < _loc1_)
         {
            outputText("[pg]狐妖似乎在你眼前融化了片刻，仿佛现实的边缘在她周围变得模糊。你集中注意力，眼睛紧紧盯着她，她突然痛苦地向后退去，捂着额头，重新出现在你的视野中。她发出一声沮丧的叹息，意识到你已经抵抗了她的幻觉。");
         }
         else
         {
            createStatusEffect(StatusEffects.Illusion,0,0,0,0);
            set_spe(get_spe() + 20);
         }
      }
      
      public function foxFireAttack() : void
      {
         outputText("狐妖用手指在空中画了一个小圈，伴随着打火石敲击钢铁的声音，在掌心变出了一团淡蓝色的火焰。她撅起嘴唇，伴随着一个飞吻，将火焰吹向你。");
         outputText("[pg]火焰猛烈地燃烧着，却给你全身带来一种极其愉悦的酥麻感。你的皮肤因兴奋而泛红，你能感觉到血液涌向四肢，让你舒服得直打颤。");
         get_game().combat.monsterDamageType = "Fire";
         var _loc1_:int = 5 + Utils.rand(20);
         get_player().takeDamage(_loc1_,true);
         get_player().takeLustDamage(15 + get_player().sens / 10);
      }
      
      override public function defeated(param1:Boolean) : void
      {
         get_game().forest.kitsuneScene.defeatTheKitsunes();
      }
   }
}

