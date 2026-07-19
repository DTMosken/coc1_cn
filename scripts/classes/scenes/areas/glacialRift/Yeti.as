package classes.scenes.areas.glacialRift
{
   import classes.Appearance;
   import classes.CoC;
   import classes.CockTypesEnum;
   import classes.Creature;
   import classes.Monster;
   import classes.Player;
   import classes.StatusEffects;
   import classes.internals.MonsterAI;
   import classes.internals.Utils;
   import classes.scenes.combat.AvoidDamageParameters;
   import classes.scenes.combat.CombatRange;
   import flash.Boot;
   
   public class Yeti extends Monster
   {
      
      public var tempSpeedLoss:Number;
      
      public function Yeti()
      {
         if(Boot.skip_constructor)
         {
            return;
         }
         tempSpeedLoss = 0;
         super();
         set_a("");
         set_short("yeti");
         imageName = "yeti";
         set_long("你正在与一只冰雪人战斗，这是一种北方的野蛮生物，天生就能在无情的严寒中生存和狩猎。它身体的每一寸都覆盖着厚厚的白色毛皮，尽管你仍然能看出下面隆起的肌肉轮廓。它的脸像野兽一样，眼睛狭长，鼻子像猫一样扁平，长着一张长满参差不齐的锋利牙齿的大嘴。它看起来很吓人，站起来大约有八英尺高，长着树干一样粗的四肢，末端的爪子锋利得足以挖进厚厚的冰层。它的性别毫无疑问；它显然是雄性。一个巨大而厚实的包皮保护着他的男子气概免受严寒的侵袭，下面是一对棒球大小的睾丸，被一个沉重、长满毛的阴囊紧紧地贴在他温暖的身体上。");
         set_race("Yeti");
         createCock(12,1.5,CockTypesEnum.HUMAN);
         balls = 2;
         ballSize = 2;
         cumMultiplier = 2;
         createBreastRow(Appearance.breastCupInverse("flat"));
         ass.analLooseness = 1;
         ass.analWetness = 1;
         set_tallness(96);
         hips.rating = 0;
         butt.rating = 2;
         skin.tone = "light";
         skin.setType(1);
         hair.color = "white";
         hair.length = 8;
         initStrTouSpeInte(95,80,60,50);
         initLibSensCor(40,20,45);
         set_weaponName("fists");
         set_weaponVerb("punch");
         set_weaponAttack(8);
         set_armorName("thick fur");
         set_armorDef(3);
         bonusHP = 400;
         set_lust(10);
         lustVuln = 0.4;
         temperment = 1;
         level = 20;
         set_gems(35 + Utils.rand(25));
         set_drop(NO_DROP);
         createStatusEffect(StatusEffects.GenericRunDisabled,0,0,0,0);
         checkMonster();
      }
      
      public function yetiTease() : void
      {
         if(Utils.rand(get_player().lib + get_player().cor) >= 30 && Utils.rand(3) > 0)
         {
            outputText("你死死盯着这头野兽，不过他看起来有些分心，一只手正伸下去抚摸自己的阴囊。随着你的视线跟过去，你看到一个粗壮的红色龟头从他的包皮里探了出来，看起来滑溜溜的，还在空气中散发着一丝热气。在这个冰冷的洞穴里，看着如此淫荡的画面让你的身体泛起一阵暖意，你开始怀疑他到底是想吃掉你还是操你。");
            get_player().takeLustDamage(20 + Utils.rand(10));
         }
         else
         {
            outputText("你面前的野兽似乎有些分心，一只手伸下去抚摸着他的阴囊，但你依然将注意力集中在怪物的脸上，不愿让自己的警惕有片刻的松懈。");
         }
      }
      
      public function yetiTackleTumble() : void
      {
         var _loc1_:Number = NaN;
         if(Boolean(combatAvoidDamage(new AvoidDamageParameters(true,false,false,null,null,null,null,null)).attackFailed))
         {
            outputText("当你听到野兽脚下冰层破裂的声音时，你察觉到了它的意图，当野兽向你扑来时，你向侧面闪去。冰雪人瞪大了眼睛，脸朝下撞到了洞穴的墙壁上，发出一声咆哮。它揉了揉脸，恶狠狠地瞪着你。");
            _loc1_ = 30 + Utils.rand(50);
            set_HP(get_HP() - _loc1_);
            outputText("野兽受到了<b><font color=\"" + get_game().mainViewManager.colorHpMinus() + "\">" + _loc1_ + "</font></b>点伤害。");
         }
         else
         {
            outputText("野兽的后爪深深地扎进冰里，然后他巨大的毛茸茸的身体向你扑来，在一次残酷的擒抱中与你相撞。你们俩在地上滚来滚去，你和这只毛茸茸的野兽互相攻击，然后他把你举起来扔到一边，你的身体撞到冰墙上，发出一声呻吟。你摇摇晃晃地站了起来。");
            _loc1_ = get_str() + 50 + Utils.rand(150);
            _loc1_ = get_player().reduceDamage(_loc1_,this);
            get_player().takeDamage(_loc1_,true);
         }
      }
      
      public function yetiSnowball() : void
      {
         var _loc1_:Number = NaN;
         if(Boolean(combatAvoidDamage(new AvoidDamageParameters(true,false,false,null,null,null,null,null)).attackFailed))
         {
            outputText("野兽后退了一步，魔法将雾气凝结成他手中的冰。你眯起眼睛，准备好身体，当冰霜球向你袭来时，你向侧面闪去，躲开了它。冰块无用地在墙上碎裂，冰雪人看起来非常恼火地看着你的方向。");
         }
         else
         {
            if(hasStatusEffect(StatusEffects.Blind) && Utils.rand(3) > 0)
            {
               outputText("野兽后退了一步，雾气在他紧握的拳头中凝聚成一个球。它在你眼前凝结成冰球，伴随着一声低吼，野兽将它向你掷来。由于他被致盲了，冰球最终没有击中你，而是砸在了墙上。");
               return;
            }
            outputText("野兽后退了一步，雾气在他紧握的拳头中凝聚成一个球。它在你眼前凝结成冰球，伴随着一声低吼，野兽将它向你掷来。冰球猛地砸在你的[armor]上并炸裂成冰霜，刺痛感让你倒吸一口凉气。冰霜也限制了你的行动。");
            _loc1_ = get_str() / 2 + Utils.rand(20);
            _loc1_ = get_player().reduceDamage(_loc1_,this);
            get_player().takeDamage(_loc1_,true);
            get_player().addCombatBuff("spe",-10);
         }
      }
      
      public function yetiClawAndPunch() : void
      {
         var _loc1_:Number = NaN;
         if(Boolean(combatAvoidDamage(new AvoidDamageParameters(true,false,false,null,null,null,null,null)).attackFailed))
         {
            outputText("雪人野兽向你冲来，但当你在冰面上敏捷地移动时，他的爪子只抓到了空气。野兽发出一声恼怒的咆哮。");
         }
         else
         {
            if(hasStatusEffect(StatusEffects.Blind) && Utils.rand(3) > 0)
            {
               outputText("雪人愤怒地向你冲来，但他因为失明，结果脸朝下撞到了墙上。");
               _loc1_ = 30 + Utils.rand(50);
               set_HP(get_HP() - _loc1_);
               outputText("野兽受到了<b><font color=\"" + get_game().mainViewManager.colorHpMinus() + "\">" + _loc1_ + "</font></b>点伤害。");
               if(Utils.rand(2) == 0)
               {
                  outputText("<b>他现在被击晕了。</b>");
                  createStatusEffect(StatusEffects.Stunned,2,0,0,0);
               }
               return;
            }
            outputText("雪人像一道白色的模糊影子向你冲来，用爪子攻击你，在你的[armor]上划过，然后一拳打在你的侧面，让你在冰面上滑行。");
            _loc1_ = get_str() + 25 + Utils.rand(50);
            _loc1_ = get_player().reduceDamage(_loc1_,this);
            get_player().takeDamage(_loc1_,true);
         }
      }
      
      override public function won(param1:Boolean, param2:Boolean = false) : void
      {
         get_game().glacialRift.yetiScene.loseToYeti();
      }
      
      override public function performCombatAction() : void
      {
         var _loc1_:MonsterAI = new MonsterAI().add(eAttack,1,true,0,FATIGUE_NONE,CombatRange.Melee);
         _loc1_.add(yetiClawAndPunch,4,true,10,FATIGUE_PHYSICAL,CombatRange.Melee);
         _loc1_.add(yetiTackleTumble,3,true,10,FATIGUE_PHYSICAL,CombatRange.Melee);
         _loc1_.add(yetiTease,2,true,0,FATIGUE_NONE,CombatRange.Tease);
         _loc1_.add(yetiSnowball,1,true,0,FATIGUE_NONE,CombatRange.Ranged);
         _loc1_.exec();
      }
      
      override public function defeated(param1:Boolean) : void
      {
         get_game().glacialRift.yetiScene.winAgainstYeti();
      }
   }
}

