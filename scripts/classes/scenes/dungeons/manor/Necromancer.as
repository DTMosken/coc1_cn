package classes.scenes.dungeons.manor
{
   import classes.Appearance;
   import classes.CoC;
   import classes.Monster;
   import classes.StatusEffects;
   import classes._FlagDict.FlagDict_Impl_;
   import classes.internals.MonsterAI;
   import classes.internals.Utils;
   import classes.internals.WeightedChoice;
   import classes.scenes.combat.CombatRange;
   import flash.Boot;
   import haxe.IMap;
   
   public class Necromancer extends Monster
   {
      
      public var skellyHordeLocation:int;
      
      public var hasSummonedElite:Boolean;
      
      public function Necromancer(param1:Boolean = false)
      {
         if(Boot.skip_constructor)
         {
            return;
         }
         skellyHordeLocation = 1;
         hasSummonedElite = false;
         super();
         if(param1)
         {
            return;
         }
         set_a("");
         set_short("Necromancer");
         imageName = "necromancer";
         set_long("站在你面前的是一个高耸的怪物，一个噩梦般的存在。死灵法师披着一件红色斗篷，呼吸缓慢，似乎对即将到来的胜利胸有成竹。他周围立着几堆白骨，骷髅正从骨堆中拼凑起来，准备攻击你。");
         set_initedGenitals(true);
         pronoun1 = "他";
         pronoun2 = "他";
         pronoun3 = "他的";
         createBreastRow(Appearance.breastCupInverse("E"));
         ass.analLooseness = 1;
         ass.analWetness = 0;
         createStatusEffect(StatusEffects.BonusACapacity,30,0,0,0);
         set_tallness(82);
         hips.rating = 8;
         butt.rating = 8;
         skin.tone = "dark gray";
         hair.color = "gray";
         hair.length = 4;
         initStrTouSpeInte(90,100,80,160);
         initLibSensCor(10,10,100);
         set_weaponName("clawed fingers");
         set_weaponVerb("claw");
         set_weaponAttack(40);
         set_armorName("crimson cloak");
         bonusHP = 2500;
         set_lust(0);
         temperment = 2;
         set_drop(new WeightedChoice());
         level = 25;
         set_gems(Utils.rand(15) + 250);
         lustVuln = 0;
         checkMonster();
      }
      
      override public function won(param1:Boolean, param2:Boolean = false) : void
      {
         get_game().dungeons.manor.loseToNecro();
      }
      
      public function raiseElite() : void
      {
         hasSummonedElite = true;
         outputText("[say: 死亡只是未启蒙者的幻觉。]死灵法师用他那把被诅咒的匕首刺向自己的手臂，并指向大厅的一个黑暗角落。\n");
         var _loc1_:Number = Utils.rand(2);
         var _loc2_:Number = _loc1_;
         if(_loc2_ == 0)
         {
            outputText("你听到了之前击败过的那个庞大骷髅的沉重脚步声；<b>骸骨守卫</b>被复活了！");
            get_game().monsterArray.push(new BoneGeneral());
         }
         else if(_loc2_ == 1)
         {
            outputText("你听到了不死小丑头饰的叮当声；<b>白骨小丑</b>被复活了！");
            get_game().monsterArray.push(new BoneJester());
         }
         else if(_loc2_ == 2)
         {
            outputText("你听到阴影中传出更多诡异的低语；<b>白骨巫师</b>被复活了！");
            get_game().monsterArray.push(new BoneCourtier());
         }
      }
      
      public function raiseDead() : void
      {
         outputText("死灵法师举起双臂，念诵着某种咒语。[say: 我们都是一体的，而这一体是永恒的。]几根骨头自己动了起来，拼凑成了另一具骷髅！");
         var _temp_1:* = get_game().monsterArray[skellyHordeLocation];
         _temp_1.unitAmount = _temp_1.unitAmount + 1;
         var _loc1_:Monster = get_game().monsterArray[skellyHordeLocation];
         _loc1_.set_HP(_loc1_.get_HP() + 100);
         var _temp_2:* = get_game().monsterArray[skellyHordeLocation];
         _temp_2.bonusHP = _temp_2.bonusHP + 100;
      }
      
      override public function performCombatAction() : void
      {
         var _loc1_:int = 0;
         if(int(get_game().monsterArray.length) > 1)
         {
            _loc1_ = 0;
            while(_loc1_ < int(get_game().monsterArray.length))
            {
               if(get_game().monsterArray[_loc1_] is SkeletonHorde)
               {
                  skellyHordeLocation = _loc1_;
                  break;
               }
               _loc1_++;
            }
         }
         if(!hasSummonedElite && HPRatio() < 0.5)
         {
            raiseElite();
            return;
         }
         var _loc2_:MonsterAI = new MonsterAI();
         _loc2_.add(raiseDead,2,get_game().monsterArray[skellyHordeLocation].unitAmount < 10 && (FlagDict_Impl_.arrayReadInt(get_flags(),2671) & 0x0200) == 0 || get_game().monsterArray[skellyHordeLocation].unitAmount < 5 && (FlagDict_Impl_.arrayReadInt(get_flags(),2671) & 0x0200) != 0,0,FATIGUE_NONE,CombatRange.Self);
         _loc2_.add(eAttack,1,true,0,FATIGUE_NONE,CombatRange.ChargingMelee);
         _loc2_.exec();
      }
      
      override public function handleFear() : Boolean
      {
         outputText("死灵法师没有受到任何恐怖幻象的影响！[pg]");
         removeStatusEffect(StatusEffects.Fear);
         return true;
      }
      
      override public function defeated(param1:Boolean) : void
      {
         get_game().dungeons.manor.defeatNecro();
      }
   }
}

