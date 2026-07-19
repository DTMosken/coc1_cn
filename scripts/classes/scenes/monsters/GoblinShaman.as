package classes.scenes.monsters
{
   import classes.Appearance;
   import classes.CoC;
   import classes.Player;
   import classes.StatusEffects;
   import classes.internals.MonsterAI;
   import classes.internals.Utils;
   import classes.internals.WeightedChoice;
   import classes.items.ConsumableLib;
   import classes.items.JewelryLib;
   import classes.items.UndergarmentLib;
   import classes.items.WeaponLib;
   import classes.scenes.combat.CombatRange;
   import flash.Boot;
   
   public class GoblinShaman extends Goblin
   {
      
      public var spellCostWhitefire:int;
      
      public var spellCostMight:int;
      
      public var spellCostHeal:int;
      
      public var spellCostCharge:int;
      
      public var spellCostBlind:int;
      
      public var spellCostArouse:int;
      
      public function GoblinShaman()
      {
         if(Boot.skip_constructor)
         {
            return;
         }
         spellCostMight = 10;
         spellCostHeal = 15;
         spellCostArouse = 10;
         spellCostWhitefire = 15;
         spellCostBlind = 8;
         spellCostCharge = 10;
         super(true);
         set_a("");
         set_short("goblin shaman");
         imageName = "goblinshaman";
         set_long("你面前的这个地精大约有三英尺半高。她的耳朵上似乎打了比普通地精更多的耳洞。她的头发是深靛蓝色的。她和你见过的多数地精都不一样。她右手拿着一根法杖。除了覆盖在身上的绑带，她还戴着一条似乎是用鲨鱼牙齿雕刻而成的项链。她还穿着一条破烂的缠腰布，不像大多数地精那样会炫耀她们的小穴。从她法杖一端发出的光芒来看，她显然是个萨满！");
         set_race("Goblin");
         if(get_player().hasCock())
         {
            set_long(get_long() + " 她显然打算用魔法让你屈服，好强迫你让她怀孕。");
         }
         createVagina(false,4,1);
         createStatusEffect(StatusEffects.BonusVCapacity,40,0,0,0);
         createBreastRow(Appearance.breastCupInverse("E"));
         ass.analLooseness = 1;
         ass.analWetness = 0;
         createStatusEffect(StatusEffects.BonusACapacity,30,0,0,0);
         set_tallness(44 + Utils.rand(7));
         hips.rating = 8;
         butt.rating = 8;
         skin.tone = "dark green";
         hair.color = "indigo";
         hair.length = 4;
         initStrTouSpeInte(75,50,70,87);
         initLibSensCor(45,45,60);
         set_weaponName("wizard staff");
         set_weaponVerb("bludgeon");
         set_weaponAttack(14);
         set_armorName("fur loincloth");
         set_armorDef(6);
         set_fatigue(0);
         bonusHP = 275;
         set_lust(35);
         lustVuln = 0.4;
         temperment = 2;
         level = 14;
         set_gems(Utils.rand(15) + 15);
         set_drop(new WeightedChoice().add(get_consumables().GOB_ALE,5).add(get_weapons().W_STAFF,1).add(get_undergarments().FURLOIN,1).add(get_jewelries().MYSTRN1,1).add(get_jewelries().LIFERN1,1).addMany(1,get_consumables().L_DRAFT,get_consumables().PINKDYE,get_consumables().BLUEDYE,get_consumables().ORANGDY,get_consumables().GREEN_D,get_consumables().PURPDYE));
         checkMonster();
      }
      
      override public function won(param1:Boolean, param2:Boolean = false) : void
      {
         if(get_player().get_gender() == 0)
         {
            outputText("你倒在地精面前，伤得太重无法继续战斗。她咆哮着踢了你的头，让你眼冒金星。随着视线模糊，你听到她嘟囔着：[say: 操，连根鸡巴或者小穴都懒得长。]");
            get_game().combat.cleanupAfterCombat();
         }
         else
         {
            get_game().goblinShamanScene.goblinShamanBeatYaUp();
         }
      }
      
      public function whitefire() : void
      {
         outputText("地精眯起眼睛，带着致命的意图集中精神。她打了个响指，你被一阵白色的火焰包围了！");
         var _loc1_:int = int(get_inte() + Utils.rand(50) * spellMultiplier());
         get_game().combat.monsterDamageType = "Fire";
         get_player().takeDamage(_loc1_,true);
      }
      
      public function spellMultiplier() : Number
      {
         var _loc1_:Number = 1;
         return _loc1_ + get_player().newGamePlusMod() * 0.5;
      }
      
      override public function performCombatAction() : void
      {
         var _loc1_:MonsterAI = new MonsterAI();
         _loc1_.add(whitefire,1,get_lust() < 50,spellCostWhitefire,FATIGUE_MAGICAL,CombatRange.Ranged);
         _loc1_.add(blind,1,get_lust() < 50 && !get_player().hasStatusEffect(StatusEffects.Blind),spellCostBlind,FATIGUE_MAGICAL,CombatRange.Ranged);
         _loc1_.add(chargeweapon,1,get_lust() < 50,spellCostCharge,FATIGUE_MAGICAL,CombatRange.Self);
         _loc1_.add(heal,1,get_lust() > 60,spellCostHeal,FATIGUE_MAGICAL_HEAL,CombatRange.Self);
         _loc1_.add(might,1,get_lust() > 50,spellCostMight,FATIGUE_MAGICAL,CombatRange.Self);
         _loc1_.add(arouse,1,get_lust() < 50,spellCostWhitefire,FATIGUE_MAGICAL,CombatRange.Ranged);
         _loc1_.add(whitefire,1,get_lust() < 50,spellCostWhitefire,FATIGUE_MAGICAL,CombatRange.Ranged);
         _loc1_.add(goblinDrugAttack,1,true,10,FATIGUE_PHYSICAL,CombatRange.Ranged);
         _loc1_.add(goblinTeaseAttack,1,true,0,FATIGUE_NONE,CombatRange.Tease);
         _loc1_.add(eAttack,1,true,0,FATIGUE_NONE,CombatRange.Melee);
         _loc1_.exec();
      }
      
      public function might() : void
      {
         outputText("她涨红了脸，利用身体的欲望来强化肌肉，让自己变得更坚韧。");
         outputText("[pg-]成功与力量的快感流遍她的全身。她觉得自己无所不能！");
         createStatusEffect(StatusEffects.Might,20 * spellMultiplier(),20 * spellMultiplier(),0,0);
         set_str(get_str() + 20 * spellMultiplier());
         set_tou(get_tou() + 20 * spellMultiplier());
      }
      
      public function heal() : void
      {
         outputText("她将注意力集中在自己的身体和消除痛苦的渴望上，试图利用自己的性欲而不去增强它。");
         var _loc1_:int = int((int(10 + get_inte() / 2 + Utils.rand(get_inte() / 3))) * spellMultiplier());
         outputText("[pg-]随着伤口开始愈合，她因成功而涨红了脸！" + get_game().combat.getHealText(_loc1_));
         addHP(_loc1_);
      }
      
      override public function defeated(param1:Boolean) : void
      {
         get_game().goblinShamanScene.goblinShamanRapeIntro();
      }
      
      public function chargeweapon() : void
      {
         outputText("地精念出力量之语，在她的法杖周围召唤出电荷。<b>看起来她现在会造成更多的物理伤害了！</b>");
         createStatusEffect(StatusEffects.ChargeWeapon,25 * spellMultiplier(),0,0,0);
      }
      
      public function blind() : void
      {
         outputText("地精瞪着你，指着你！一道耀眼的闪光在你面前爆发！");
         if(Utils.rand(get_player().get_inte() / 5) <= 4)
         {
            outputText("<b>你失明了！</b>");
            get_player().createStatusEffect(StatusEffects.Blind,1 + Utils.rand(3),0,0,0);
         }
         else
         {
            outputText("你在千钧一发之际眨了眨眼！");
         }
      }
      
      public function arouse() : void
      {
         outputText("她做了一系列神秘的手势，利用她的欲望将其施加在你身上！");
         var _loc1_:int = int(get_inte() / 10 + get_player().lib / 10 + Utils.rand(10) * spellMultiplier());
         get_player().takeLustDamage(_loc1_,true);
      }
   }
}

