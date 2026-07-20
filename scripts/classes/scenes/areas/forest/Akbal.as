package classes.scenes.areas.forest
{
   import classes.CoC;
   import classes.CockTypesEnum;
   import classes.Creature;
   import classes.Monster;
   import classes.PerkLib;
   import classes.Player;
   import classes.StatusEffect;
   import classes.StatusEffectType;
   import classes.StatusEffects;
   import classes._FlagDict.FlagDict_Impl_;
   import classes.internals.MonsterAI;
   import classes.internals.Utils;
   import classes.internals.WeightedChoice;
   import classes.items.ConsumableLib;
   import classes.items.WeaponLib;
   import classes.scenes.combat.AvoidDamageParameters;
   import classes.scenes.combat.CombatRange;
   import classes.statusEffects.combat.AkbalSpeedDebuff;
   import flash.Boot;
   import haxe.IMap;
   
   public class Akbal extends Monster
   {
      
      public var fierceAkbal:Boolean;
      
      public function Akbal()
      {
         if(Boot.skip_constructor)
         {
            return;
         }
         fierceAkbal = false;
         super();
         fierceAkbal = FlagDict_Impl_.arrayReadInt(get_flags(),2715) > 0;
         set_a("");
         set_short("Akbal");
         imageName = "akbal";
         if(fierceAkbal)
         {
            set_long("这只长着黑色斑点的黄褐色美洲豹绷紧了身体，蓄势待发，似乎随时都会发动猛烈的攻击。他翠绿色的眼睛里燃烧着决心和狂热。这只野兽可不会手下留情；这不仅仅是又一个徒劳地击退那些误入他领地的无知小动物的日子，这是他的使命。他不需要用他的心灵感应说一句话就能让你明白这一点。");
            initStrTouSpeInte(65,63,65,85);
            initLibSensCor(30,30,100);
            set_weaponAttack(20);
            set_armorDef(14);
            bonusHP = 200;
            set_lust(20);
            lustVuln = 0.7;
            level = 15;
            set_gems(Utils.rand(15) + 25);
            additionalXP = 250;
            createPerk(PerkLib.ExtraDodge,10,0,0,0);
         }
         else
         {
            set_long("阿克巴尔，“地炎之神”，在你周围盘旋。他那光滑而肌肉发达的身体上覆盖着黄褐色的皮毛，当你看着它们时，那些黑色的斑点似乎在跳动。他的嘴里有两颗象牙色的门牙，在稀疏的[sun]光下闪闪发光，他的嘴唇随着无休止的咆哮声而颤抖。他的每只爪子都隐藏着致命的利爪，能够将人类和恶魔撕成碎片。当你看着他那双巨大而令人作呕的迷人亮绿色眼睛时，它们预示着难以忍受的痛苦。");
            initStrTouSpeInte(55,53,50,75);
            initLibSensCor(50,50,100);
            set_weaponAttack(5);
            set_armorDef(5);
            bonusHP = 20;
            set_lust(30);
            lustVuln = 0.8;
            level = 6;
            set_gems(15);
            additionalXP = 150;
         }
         set_race("Demon");
         createCock(15,2.5,CockTypesEnum.CAT);
         balls = 2;
         ballSize = 4;
         cumMultiplier = 6;
         set_hoursSinceCum(400);
         createBreastRow();
         createBreastRow();
         createBreastRow();
         createBreastRow();
         ass.analLooseness = 1;
         ass.analWetness = 1;
         set_tallness(48);
         hips.rating = 2;
         butt.rating = 2;
         skin.tone = "spotted";
         skin.setType(1);
         set_weaponName("claws");
         set_weaponVerb("claw-slash");
         set_armorName("shimmering pelt");
         temperment = 1;
         createPerk(PerkLib.BlindImmune,0,0,0,0);
         set_drop(new WeightedChoice().add(get_consumables().INCUBID,4).add(get_consumables().W_FRUIT,3).add(get_consumables().AKBALSL,2).add(get_weapons().PIPE,1));
         tail.type = 8;
         checkMonster();
      }
      
      override public function won(param1:Boolean, param2:Boolean = false) : void
      {
         if(fierceAkbal)
         {
            switch(FlagDict_Impl_.arrayReadInt(get_flags(),2717))
            {
               case 0:
                  get_game().forest.akbalScene.akbalEventGoblinLose();
                  break;
               case 1:
                  get_game().forest.akbalScene.akbalEventAliceLose();
                  break;
               case 2:
                  get_game().forest.akbalScene.akbalEventKitsuneLose();
                  break;
               default:
                  outputText("错误：无效的阿克巴尔事件标志");
                  get_game().combat.cleanupAfterCombat();
            }
         }
         else
         {
            get_game().forest.akbalScene.akbalWon(param1,param2);
         }
      }
      
      override public function performCombatAction() : void
      {
         var _loc1_:MonsterAI = new MonsterAI().add(eAttack,1,true,0,FATIGUE_NONE,CombatRange.Melee);
         _loc1_.add(akbalSpecial,1,true,10,FATIGUE_MAGICAL,CombatRange.Ranged);
         _loc1_.add(akbalLustAttack,1,true,10,FATIGUE_MAGICAL,CombatRange.Omni);
         _loc1_.add(akbalHeal,1,fierceAkbal ? HPRatio() < 0.6 : true,0,FATIGUE_NONE,CombatRange.Self);
         _loc1_.exec();
      }
      
      override public function handleCombatLossText(param1:Boolean, param2:int) : int
      {
         if(fierceAkbal)
         {
            outputText("[pg]你回到了你的营地……");
            return 1;
         }
         return int(super.handleCombatLossText(false,param2));
      }
      
      override public function eAttack() : void
      {
         var _loc1_:Number = 0;
         if(hasStatusEffect(StatusEffects.Blind))
         {
            outputText("尽管阿克巴尔是个瞎子，但他似乎能毫无障碍地引导攻击向你袭来。\n");
         }
         var _loc2_:AvoidDamageParameters = new AvoidDamageParameters(true,true,true,null,true,null,null,null);
         if(playerAvoidDamage(_loc2_))
         {
            return;
         }
         if(Utils.rand(2) == 0)
         {
            _loc1_ = get_player().reduceDamage(get_str() + get_weaponAttack(),this,fierceAkbal ? 20 : 0);
            if(_loc1_ <= 0)
            {
               outputText("阿克巴尔向前猛扑，但凭借你的坚韧");
               if(get_player().get_armorDef() > 0)
               {
                  outputText("和[armor]，他未能造成任何伤害。");
               }
               else
               {
                  outputText("他未能造成任何伤害。");
               }
            }
            else
            {
               outputText("阿克巴尔向你冲来，他的爪子快如闪电，在你的肚子上留下了四道火辣辣的血痕。");
               get_player().takeDamage(_loc1_,true);
            }
         }
         else
         {
            _loc1_ = get_player().reduceDamage(get_str() + 25 + get_weaponAttack(),this,fierceAkbal ? 20 : 0);
            if(_loc1_ == 0)
            {
               outputText("阿克巴尔向前猛扑，但在你的坚韧");
               if(get_player().get_armorDef() > 0)
               {
                  outputText("和[armor]的保护下，他未能造成任何伤害。");
               }
            }
            else
            {
               outputText("阿克巴尔咆哮着向你飞扑过来，象牙般的牙齿咬在你的手臂上。你痛苦地尖叫着，把他甩开。");
               get_player().takeDamage(_loc1_,true);
            }
         }
      }
      
      override public function defeated(param1:Boolean) : void
      {
         if(fierceAkbal)
         {
            switch(FlagDict_Impl_.arrayReadInt(get_flags(),2717))
            {
               case 0:
                  get_game().combat.cleanupAfterCombat(get_game().forest.akbalScene.akbalEventGoblinWin);
                  break;
               case 1:
                  get_game().combat.cleanupAfterCombat(get_game().forest.akbalScene.akbalEventAliceWin);
                  break;
               case 2:
                  get_game().combat.cleanupAfterCombat(get_game().forest.akbalScene.akbalEventKitsuneWin);
                  break;
               default:
                  outputText("错误：无效的阿克巴尔事件标志");
                  get_game().combat.cleanupAfterCombat();
            }
         }
         else
         {
            get_game().forest.akbalScene.akbalDefeated(param1);
         }
      }
      
      public function akbalSpecial() : void
      {
         var _loc1_:* = null as AkbalSpeedDebuff;
         var _loc2_:* = null as Array;
         var _loc3_:* = null as Array;
         var _loc4_:* = null as Array;
         if(Utils.rand(2) == 0 && get_player().get_spe() > 20)
         {
            outputText("阿克巴尔的眼睛里充满了光芒，一种奇怪的恐惧感开始麻痹你的四肢。");
            _loc1_ = get_player().createOrFindStatusEffect(StatusEffects.AkbalSpeed);
            _loc1_.increase();
            if(fierceAkbal)
            {
               _loc1_.increase();
            }
         }
         else
         {
            outputText("阿克巴尔发出一声震耳欲聋的咆哮，向你喷吐出一股翠绿色的火焰洪流。\n");
            _loc2_ = ["你险险避开了阿克巴尔的火焰！","你以极快的速度躲开了阿克巴尔的火焰！","你灵巧地避开了阿克巴尔的吐息。"];
            _loc3_ = _loc2_;
            _loc4_ = ["[SPEED]" + _loc3_[Utils.rand(int(_loc3_.length))],"[EVADE]利用你闪避攻击的技巧，你预判并侧身躲开了阿克巴尔的吐息。","[MISDIRECTION]利用拉斐尔的教导，你预判并侧身躲开了阿克巴尔的吐息。","[FLEXIBILITY]利用你猫一般的敏捷，你扭动身体避开了阿克巴尔的吐息。","[UNHANDLED]你成功躲开了阿克巴尔的吐息。"];
            if(!playerAvoidDamage(new AvoidDamageParameters(true,false,false,null,null,null,null,null),_loc4_))
            {
               outputText("你被火焰严重烧伤了！");
               get_game().combat.monsterDamageType = "Fire";
               get_player().takeDamage(fierceAkbal ? 80 + Utils.rand(20) : 40,true);
            }
            else if(fierceAkbal)
            {
               outputText("\n他烧焦的地面仍然被火焰吞噬着！你现在可以机动的空间变小了。");
               if(get_player().hasStatusEffect(StatusEffects.AkbalFlameDebuff))
               {
                  get_player().addStatusValue(StatusEffects.AkbalFlameDebuff,1,1);
               }
               else
               {
                  get_player().createStatusEffect(StatusEffects.AkbalFlameDebuff,1,0,0,0);
               }
            }
         }
      }
      
      public function akbalLustAttack() : void
      {
         var _loc1_:int = 0;
         var _loc2_:* = null as StatusEffectType;
         if(!(get_player().hasStatusEffect(StatusEffects.Whispered) || get_player().hasStatusEffect(StatusEffects.TrueWhispered)))
         {
            if(fierceAkbal)
            {
               outputText("你开始听到脑海中的低语，阿克巴尔空灵的声音穿透了你的思绪。[say:你挡了我的路，现在屈服吧，否则等我办完事，我会让你痛不欲生。]");
            }
            else
            {
               outputText("你听到脑海中的低语。阿克巴尔一边绕着你转圈，一边开始对你说话，告诉你一旦他把你打得毫无还手之力，他会用各种方式支配你。");
            }
            _loc1_ = int(7 + (100 - get_player().get_inte()) / 10);
            if(fierceAkbal)
            {
               _loc1_ *= 2;
            }
            get_player().takeLustDamage(_loc1_,true);
            _loc2_ = fierceAkbal ? StatusEffects.TrueWhispered : StatusEffects.Whispered;
            get_player().createStatusEffect(_loc2_,0,0,0,0);
         }
         else
         {
            if(fierceAkbal)
            {
               outputText("你脑海中的低语越来越大，许多雌雄莫辨的声音告诉你恶魔想对你做的所有事情。\n你隐约感觉到他那长满倒刺的猫科肉棒在你的体内粗暴无情地刮擦着。");
               if(get_player().hasPerk(PerkLib.Masochist))
               {
                  outputText("你那受虐狂的一面被这种充满攻击性的幻想给狠狠地挑逗起来了。");
               }
            }
            else
            {
               outputText("你脑海中的低语声越来越大，许多雌雄莫辨的声音告诉你这只恶魔想对你做的所有事情。你只能红着脸。");
            }
            _loc1_ = int(12 + (100 - get_player().get_inte()) / 10);
            if(fierceAkbal)
            {
               _loc1_ *= 2;
            }
            get_player().takeLustDamage(_loc1_,true);
            get_player().createOrFindStatusEffect(StatusEffects.Whispered);
         }
      }
      
      public function akbalHeal() : void
      {
         if(HPRatio() >= 1)
         {
            outputText("阿克巴尔舔了舔自己，暂时无视了你。");
         }
         else
         {
            outputText("阿克巴尔舔了舔自己的一个伤口，你皱起眉头，因为伤口很快就愈合了。");
         }
         addHP(maxHP() * 0.12);
         if(!fierceAkbal)
         {
            set_lust(get_lust() + 10);
         }
      }
   }
}

