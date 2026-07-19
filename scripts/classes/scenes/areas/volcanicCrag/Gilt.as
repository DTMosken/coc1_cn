package classes.scenes.areas.volcanicCrag
{
   import classes.Appearance;
   import classes.CoC;
   import classes.ItemType;
   import classes.Monster;
   import classes.PerkLib;
   import classes.Player;
   import classes._FlagDict.FlagDict_Impl_;
   import classes.internals.MonsterAI;
   import classes.internals.Utils;
   import classes.internals.WeightedChoice;
   import classes.items.ConsumableLib;
   import classes.items.WeaponLib;
   import classes.parser._Parser.TagFun_Impl_;
   import classes.scenes.combat.CombatAttackBuilder;
   import classes.scenes.combat.CombatDistance;
   import classes.scenes.combat.CombatRange;
   import flash.Boot;
   import haxe.IMap;
   
   public class Gilt extends Monster
   {
      
      public function Gilt()
      {
         var _gthis:Gilt;
         if(Boot.skip_constructor)
         {
            return;
         }
         _gthis = this;
         super();
         set_a("");
         set_short("gilt");
         imageName = "Gilt";
         get_game().registerTag("isflying",TagFun_Impl_.fromBoolFun(function():Boolean
         {
            return _gthis.isFlying;
         }));
         set_long("[if (isflying) {在半空与火山灰云之间滑翔|四肢大张地趴在地上}]，巨大的蝙蝠状翅膀占据了这只怪物的大部分轮廓。这只母猪恶魔有着光滑的古铜色皮肤，仿佛在峭壁的高温中烤过一般，她的头上长着一簇闪亮的深色羽毛，被长而有脊的蝙蝠耳朵分开。她宽大的桶状胸膛上覆盖着一层褪色的金属板，这些金属板交织在一起，保护着为那对肉翼提供动力的强健肌肉。突出的髋骨勾勒出她暴露在外的纤细腹肌，她的腿上也有一些稀疏的盔甲。她的胫骨上用链条拴着一把[if (isflying) {摇晃的镰刀|被她的爪子紧紧握住的镰刀}]。");
         set_race("Bat-demon");
         createVagina(false,1,1);
         createBreastRow(Appearance.breastCupInverse("A"));
         set_tallness(78);
         hips.rating = 2;
         butt.rating = 2;
         skin.tone = "golden-brown";
         hair.color = "dark iridescent";
         hair.length = 10;
         hair.type = 1;
         wings.type = 7;
         lowerBody.type = 33;
         face.type = 30;
         ears.type = 24;
         initStrTouSpeInte(75,65,50,20);
         initLibSensCor(55,25,100);
         set_weaponName("sickle");
         set_weaponVerb("slash");
         set_weaponAttack(25);
         bonusHP = 300;
         set_armorName("discolored metal plates laced together");
         set_armorDef(15);
         set_lust(0);
         temperment = 2;
         if(get_player().hasBigEars())
         {
            lustVuln = 1.1;
         }
         level = 22;
         set_drop(new WeightedChoice().add(get_consumables().BEONDEG,4).add(get_consumables().GLDSEED,1).add(get_weapons().BAT,get_game().get_silly() ? 1 : 0).add(null,5));
         set_gems(Utils.rand(50) + 50);
         createPerk(PerkLib.BlindImmune,0,0,0,0);
         createPerk(PerkLib.Flying,0,0,0,0);
         checkMonster();
      }
      
      override public function won(param1:Boolean, param2:Boolean = false) : void
      {
         get_game().volcanicCrag.giltScene.giltLose(param1);
      }
      
      override public function performCombatAction() : void
      {
         if(distance == CombatDistance.Distant && !isFlying && fatigueLeft() >= 10)
         {
            giltDistancedFly();
         }
         var _loc1_:MonsterAI = new MonsterAI().add(giltDive,1,isFlying && fatigueLeft() <= 10,0,FATIGUE_NONE,CombatRange.FlyingMelee).add(eAttack,1,isFlying && fatigueLeft() >= 10,10,FATIGUE_PHYSICAL,CombatRange.FlyingMelee).add(eAttack,1,!isFlying,0,FATIGUE_NONE,CombatRange.Melee).add(giltFly,0.1,!isFlying,10,FATIGUE_PHYSICAL,CombatRange.Self);
         _loc1_.exec();
      }
      
      override public function outputAttack(param1:int) : void
      {
         if(isFlying)
         {
            outputText("恶魔蝙蝠在头顶滑翔，拖着镰刀试图钩住你！");
         }
         else
         {
            outputText("这只母猪恶魔跃起，她的翅膀兜住空气，将挥舞着镰刀的下半身向前甩去！");
         }
         if(FlagDict_Impl_.arrayReadInt(get_flags(),2138) > 0)
         {
            outputText("[b:暴击！]");
         }
         outputText(get_game().combat.getDamageText(param1));
      }
      
      public function giltFly() : void
      {
         outputText("蝙蝠女用翅膀撑起身体并拍打着，将泥土和灰尘扬到空中，然后飞了起来。");
         fly();
      }
      
      public function giltDive() : void
      {
         outputText("这只母猪恶魔没有掠过，而是径直向你俯冲，伸出利爪发起攻击");
         if(get_player().hasWaited())
         {
            outputText("，但你做好了准备并冲出了她的攻击路线，看着这只恶魔重重地落在干燥的泥土和岩石上。");
            return;
         }
         var _loc1_:CombatAttackBuilder = new CombatAttackBuilder().canBlock().canDodge().setCustomBlock("，当她撞击你的盾牌时，将你掀翻在地。").setCustomAvoid("，险些命中。");
         if(_loc1_.executeAttack().isSuccessfulHit())
         {
            outputText("，将你重重地摔在地上！");
            get_player().takeDamage(get_player().reduceDamage(eBaseDamage(),this),true);
         }
         if(_loc1_.isSuccessfulHit() || _loc1_.isBlocked())
         {
            get_player().stun(1);
         }
         isFlying = false;
      }
      
      public function giltDistancedFly() : void
      {
         outputText("这只母猪恶魔开始四肢着地疾驰，然后跃入空中飞了起来。[pg]");
         changeFatigue(10);
         fly();
      }
      
      override public function defeated(param1:Boolean) : void
      {
         get_game().volcanicCrag.giltScene.giltWinChoices(param1);
      }
   }
}

