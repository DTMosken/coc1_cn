package classes.scenes.monsters
{
   import classes.Appearance;
   import classes.CoC;
   import classes.Creature;
   import classes.PerkLib;
   import classes.Player;
   import classes.StatusEffects;
   import classes._FlagDict.FlagDict_Impl_;
   import classes.internals.MonsterAI;
   import classes.internals.Utils;
   import classes.internals.WeightedChoice;
   import classes.items.ConsumableLib;
   import classes.items.JewelryLib;
   import classes.items.UseableLib;
   import classes.scenes.combat.AvoidDamageParameters;
   import classes.scenes.combat.CombatRange;
   import flash.Boot;
   import haxe.IMap;
   
   public class GoblinElder extends Goblin
   {
      
      public var spellCostWhitefire:int;
      
      public var spellCostMight:int;
      
      public var spellCostHeal:int;
      
      public var spellCostCharge:int;
      
      public var spellCostBlind:int;
      
      public var spellCostArouse:int;
      
      public function GoblinElder()
      {
         if(Boot.skip_constructor)
         {
            return;
         }
         spellCostMight = 10;
         spellCostHeal = 8;
         spellCostArouse = 6;
         spellCostWhitefire = 12;
         spellCostBlind = 8;
         spellCostCharge = 6;
         super(true);
         set_a("");
         set_short("goblin elder");
         if(FlagDict_Impl_.arrayReadInt(get_flags(),2211) > 0)
         {
            set_a("");
            set_short("Priscilla");
         }
         imageName = "goblinelder";
         set_long("面前这只地精身高略超四英尺。地精因其堕落本性而难以判断年龄，但这一只看起来格外与众不同。她的皮肤呈黄绿色，发色是深红近黑。她的身上涂满了小恶魔与牛头人的血，以此震慑任何胆敢侵犯她的人。她戴着一条鲨鱼牙项链，耳朵上穿着看似莱希石制成的耳环。尽管考虑到她的\"年龄\"，她的双乳看起来足有FF罩杯。与大多数地精不同，她武装精良：手持一把粗糙铸造的金属剑和一面大型方形金属盾。她穿着一条蜘蛛丝缠腰布，几颗小恶魔头骨挂在束住缠腰布的皮带上。她的头盔由牛头人的头骨打造而成，胸甲看似从牛头人的肋骨上凿出。她的护肩同样由骨骼制成。尽管甲胄如此齐备，她那穿着莱希石饰品的乳头却依然裸露在外。她显然已经跋涉了相当长的路程，也斩杀了为数不少的牛头人与小恶魔。她能活到今天，多亏了缩形膏让她的双乳保持在正常大小。");
         createVagina(false,4,1);
         createStatusEffect(StatusEffects.BonusVCapacity,40,0,0,0);
         createBreastRow(Appearance.breastCupInverse("FF"));
         ass.analLooseness = 1;
         ass.analWetness = 0;
         createStatusEffect(StatusEffects.BonusACapacity,30,0,0,0);
         set_tallness(48);
         hips.rating = 8;
         butt.rating = 8;
         skin.tone = "yellowish-green";
         hair.color = "dark green";
         hair.length = 4;
         initStrTouSpeInte(95,75,70,100);
         initLibSensCor(55,35,45);
         set_weaponName("primal sword");
         set_weaponVerb("slash");
         set_weaponAttack(25);
         set_armorName("bone armor");
         set_armorDef(50);
         canBlock = true;
         set_shieldName("方形金属盾");
         set_shieldBlock(20);
         set_fatigue(0);
         bonusHP = 425;
         set_lust(35);
         lustVuln = 0.4;
         temperment = 2;
         level = 20;
         set_gems(Utils.rand(15) + 25);
         set_drop(new WeightedChoice().add(get_consumables().GOB_ALE,5).add(get_consumables().REDUCTO,2).add(get_jewelries().POWRRN1,1).add(get_useables().LETHITE,1).addMany(1,get_consumables().L_DRAFT,get_consumables().PINKDYE,get_consumables().BLUEDYE,get_consumables().ORANGDY,get_consumables().GREEN_D,get_consumables().PURPDYE));
         createPerk(PerkLib.Tank,0,0,0,0);
         createPerk(PerkLib.Tank2,0,0,0,0);
         checkMonster();
      }
      
      override public function won(param1:Boolean, param2:Boolean = false) : void
      {
         if(get_player().get_gender() == 0)
         {
            outputText("你倒在地精面前，伤得太重无法战斗。她咆哮着踢了你的头，让你眼冒金星。随着你的视线变暗，你听到她嘟囔着，[say:他妈的混蛋，连长个鸡巴或屄都不愿意。]");
            get_game().combat.cleanupAfterCombat();
         }
         else
         {
            get_game().goblinElderScene.goblinElderBeatYaUp();
         }
      }
      
      public function spellMultiplier() : Number
      {
         var _loc1_:Number = 1;
         return _loc1_ + 0.5 * get_player().newGamePlusMod();
      }
      
      public function slash() : void
      {
         var _loc1_:int = 0;
         outputText("地精挥舞着剑向你冲来！她一靠近你，就挥舞起她的剑！");
         if(Boolean(combatAvoidDamage(new AvoidDamageParameters(true,false,false,null,null,null,null,null)).attackFailed))
         {
            outputText("你躲开了她的斩击！");
         }
         else
         {
            outputText("她的攻击击中了你！");
            _loc1_ = int(get_str() + get_weaponAttack() + Utils.rand(40));
            _loc1_ = get_player().reduceDamage(_loc1_,this);
            if(_loc1_ < 10)
            {
               _loc1_ = 10;
            }
            get_player().takeDamage(_loc1_,true);
         }
      }
      
      public function shieldBash() : void
      {
         var _loc1_:int = 0;
         outputText("地精举着盾牌向你冲来！");
         if(Boolean(combatAvoidDamage(new AvoidDamageParameters(true,false,false,null,null,null,null,null)).attackFailed))
         {
            outputText("你躲开了她的盾击！");
         }
         else
         {
            outputText("她的盾牌击中了你！");
            if(get_player().stun(1,40))
            {
               outputText("盾牌的冲击力让你脑震荡了。<b>你被击晕了。</b>");
            }
            _loc1_ = int(get_str() + Utils.rand(10));
            _loc1_ = get_player().reduceDamage(_loc1_,this);
            if(_loc1_ < 10)
            {
               _loc1_ = 10;
            }
            get_player().takeDamage(_loc1_,true);
         }
      }
      
      override public function performCombatAction() : void
      {
         var _loc1_:MonsterAI = new MonsterAI();
         _loc1_.add(goblinDrugAttack,1,true,10,FATIGUE_PHYSICAL,CombatRange.Ranged);
         _loc1_.add(goblinTeaseAttack,1,true,0,FATIGUE_NONE,CombatRange.Tease);
         _loc1_.add(eAttack,1,true,0,FATIGUE_NONE,CombatRange.Melee);
         _loc1_.exec();
      }
      
      override public function defeated(param1:Boolean) : void
      {
         get_game().goblinElderScene.goblinElderRapeIntro();
      }
      
      public function castSpell() : void
      {
         var _loc2_:int = 0;
         var _loc1_:int = Utils.rand(6);
         if(get_lust() < 50)
         {
            _loc1_ = Utils.rand(3);
         }
         if(get_lust() > 75)
         {
            _loc1_ = Utils.rand(3) + 3;
         }
         if(_loc1_ == 0 && hasStatusEffect(StatusEffects.ChargeWeapon))
         {
            _loc1_ = Utils.rand(5) + 1;
         }
         if(_loc1_ == 4 && HPRatio() >= 0.7)
         {
            _loc1_++;
         }
         if(_loc1_ == 5 && hasStatusEffect(StatusEffects.Might))
         {
            _loc1_ = Utils.rand(5);
            if(_loc1_ == 0 && hasStatusEffect(StatusEffects.ChargeWeapon))
            {
               _loc1_++;
            }
         }
         if(_loc1_ == 0 && get_fatigue() <= 100 - spellCostCharge)
         {
            outputText("地精念出力量之语，在她的剑周围召唤出一股电荷。<b>看来她现在能造成更多的物理伤害了！</b>");
            createStatusEffect(StatusEffects.ChargeWeapon,15 * spellMultiplier(),0,0,0);
            set_fatigue(get_fatigue() + spellCostCharge);
         }
         else if(_loc1_ == 1 && get_fatigue() <= 100 - spellCostBlind)
         {
            outputText("地精怒视着你，并指着你！一道刺眼的闪光在你面前爆发！");
            if(Utils.rand(get_player().get_inte() / 5) <= 4)
            {
               outputText("<b>你失明了！</b>");
               get_player().createStatusEffect(StatusEffects.Blind,1 + Utils.rand(3),0,0,0);
            }
            else
            {
               outputText("你在千钧一发之际眨了眨眼！");
            }
            set_fatigue(get_fatigue() + spellCostBlind);
         }
         else if(_loc1_ == 2 && get_fatigue() <= 100 - spellCostWhitefire)
         {
            outputText("地精眯起眼睛，带着致命的意图集中精神。她打了个响指，你被一团白色的火焰吞噬了！");
            _loc2_ = int(get_inte() + Utils.rand(50) * spellMultiplier());
            get_game().combat.monsterDamageType = "Fire";
            get_player().takeDamage(_loc2_,true);
            set_fatigue(get_fatigue() + spellCostWhitefire);
         }
         else if(_loc1_ == 3 && get_fatigue() <= 100 - spellCostArouse)
         {
            outputText("她做出一连串神秘的手势，利用她的欲望将其施加在你身上！");
            _loc2_ = int(get_inte() / 10 + get_player().lib / 10 + Utils.rand(10) * spellMultiplier());
            get_player().takeLustDamage(_loc2_);
            set_fatigue(get_fatigue() + spellCostArouse);
         }
         else if(_loc1_ == 4 && get_fatigue() <= 100 - spellCostHeal)
         {
            outputText("她专注于自己的身体和结束痛苦的渴望，试图在不增强性欲的情况下利用它。");
            _loc2_ = int((int(10 + get_inte() / 2 + Utils.rand(get_inte() / 3))) * spellMultiplier());
            outputText("当她的伤口开始愈合时，她因成功而涨红了脸！<b>(<font color=\"" + get_game().mainViewManager.colorHpPlus() + "\">+" + _loc2_ + "</font>)</b>。");
            addHP(_loc2_);
            set_fatigue(get_fatigue() + spellCostHeal);
         }
         else if(_loc1_ == 5 && get_fatigue() <= 100 - spellCostMight)
         {
            outputText("她涨红了脸，利用身体的欲望来强化肌肉，让自己变得更坚韧。");
            outputText("成功和力量的冲击流遍她的全身。她觉得自己无所不能！");
            createStatusEffect(StatusEffects.Might,15 * spellMultiplier(),15 * spellMultiplier(),0,0);
            set_str(get_str() + 15 * spellMultiplier());
            set_tou(get_tou() + 15 * spellMultiplier());
            set_fatigue(get_fatigue() + spellCostMight);
         }
      }
   }
}

