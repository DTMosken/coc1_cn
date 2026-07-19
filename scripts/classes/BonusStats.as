package classes
{
   public class BonusStats
   {
      
      public function BonusStats()
      {
      }
      
      public static function boostsDodge(param1:BonusStatsInterface, param2:Function, param3:Boolean = false) : BonusStatsInterface
      {
         param1.boost("闪避几率",param2,param3);
         return param1;
      }
      
      public static function boostsSpellMod(param1:BonusStatsInterface, param2:Function, param3:Boolean = false) : BonusStatsInterface
      {
         param1.boost("法术修正",param2,param3);
         return param1;
      }
      
      public static function boostsCritChance(param1:BonusStatsInterface, param2:Function, param3:Boolean = false) : BonusStatsInterface
      {
         param1.boost("暴击率",param2,param3);
         return param1;
      }
      
      public static function boostsWeaponCritChance(param1:BonusStatsInterface, param2:Function, param3:Boolean = false) : BonusStatsInterface
      {
         param1.boost("武器暴击率",param2,param3);
         return param1;
      }
      
      public static function boostsCritDamage(param1:BonusStatsInterface, param2:Function, param3:Boolean = false) : BonusStatsInterface
      {
         param1.boost("暴击伤害",param2,param3);
         return param1;
      }
      
      public static function boostsMaxHealth(param1:BonusStatsInterface, param2:Function, param3:Boolean = false) : BonusStatsInterface
      {
         param1.boost("最大生命值",param2,param3);
         return param1;
      }
      
      public static function boostsSpellCost(param1:BonusStatsInterface, param2:Function, param3:Boolean = false) : BonusStatsInterface
      {
         param1.boost("法术消耗",param2,param3);
         return param1;
      }
      
      public static function boostsAccuracy(param1:BonusStatsInterface, param2:Function, param3:Boolean = false) : BonusStatsInterface
      {
         param1.boost("命中率",param2,param3);
         return param1;
      }
      
      public static function boostsPhysDamage(param1:BonusStatsInterface, param2:Function, param3:Boolean = false) : BonusStatsInterface
      {
         param1.boost("物理伤害",param2,param3);
         return param1;
      }
      
      public static function boostsHealthRegenPercentage(param1:BonusStatsInterface, param2:Function, param3:Boolean = false) : BonusStatsInterface
      {
         param1.boost("生命恢复 (%)",param2,param3);
         return param1;
      }
      
      public static function boostsHealthRegenFlat(param1:BonusStatsInterface, param2:Function, param3:Boolean = false) : BonusStatsInterface
      {
         param1.boost("生命恢复 (固定值)",param2,param3);
         return param1;
      }
      
      public static function boostsMinLust(param1:BonusStatsInterface, param2:Function, param3:Boolean = false) : BonusStatsInterface
      {
         param1.boost("最低欲望",param2,param3);
         return param1;
      }
      
      public static function boostsLustResistance(param1:BonusStatsInterface, param2:Function, param3:Boolean = false) : BonusStatsInterface
      {
         param1.boost("欲望抗性",param2,param3);
         return param1;
      }
      
      public static function boostsMovementChance(param1:BonusStatsInterface, param2:Function, param3:Boolean = false) : BonusStatsInterface
      {
         param1.boost("移动几率",param2,param3);
         return param1;
      }
      
      public static function boostsTeaseChance(param1:BonusStatsInterface, param2:Function, param3:Boolean = false) : BonusStatsInterface
      {
         param1.boost("挑逗几率",param2,param3);
         return param1;
      }
      
      public static function boostsTeaseDamage(param1:BonusStatsInterface, param2:Function, param3:Boolean = false) : BonusStatsInterface
      {
         param1.boost("挑逗伤害",param2,param3);
         return param1;
      }
      
      public static function boostsAttackDamage(param1:BonusStatsInterface, param2:Function, param3:Boolean = false) : BonusStatsInterface
      {
         param1.boost("攻击伤害",param2,param3);
         return param1;
      }
      
      public static function boostsGlobalDamage(param1:BonusStatsInterface, param2:Function, param3:Boolean = false) : BonusStatsInterface
      {
         param1.boost("全局伤害",param2,param3);
         return param1;
      }
      
      public static function boostsWeaponDamage(param1:BonusStatsInterface, param2:Function, param3:Boolean = false) : BonusStatsInterface
      {
         param1.boost("武器伤害",param2,param3);
         return param1;
      }
      
      public static function boostsMaxFatigue(param1:BonusStatsInterface, param2:Function, param3:Boolean = false) : BonusStatsInterface
      {
         param1.boost("最大疲劳度",param2,param3);
         return param1;
      }
      
      public static function boostsDamageTaken(param1:BonusStatsInterface, param2:Function, param3:Boolean = false) : BonusStatsInterface
      {
         param1.boost("受到伤害",param2,param3);
         return param1;
      }
      
      public static function boostsArmor(param1:BonusStatsInterface, param2:Function, param3:Boolean = false) : BonusStatsInterface
      {
         param1.boost("护甲",param2,param3);
         return param1;
      }
      
      public static function boostsArmorPenetration(param1:BonusStatsInterface, param2:Function, param3:Boolean = false) : BonusStatsInterface
      {
         param1.boost("护甲穿透",param2,param3);
         return param1;
      }
      
      public static function boostsParryChance(param1:BonusStatsInterface, param2:Function, param3:Boolean = false) : BonusStatsInterface
      {
         param1.boost("招架几率",param2,param3);
         return param1;
      }
      
      public static function boostsBodyDamage(param1:BonusStatsInterface, param2:Function, param3:Boolean = false) : BonusStatsInterface
      {
         param1.boost("肉体伤害",param2,param3);
         return param1;
      }
      
      public static function boostsXPGain(param1:BonusStatsInterface, param2:Function, param3:Boolean = false) : BonusStatsInterface
      {
         param1.boost("经验获取",param2,param3);
         return param1;
      }
      
      public static function boostsStatGain(param1:BonusStatsInterface, param2:Function, param3:Boolean = false) : BonusStatsInterface
      {
         param1.boost("属性增益",param2,param3);
         return param1;
      }
      
      public static function boostsStrGain(param1:BonusStatsInterface, param2:Function, param3:Boolean = false) : BonusStatsInterface
      {
         param1.boost("力量增益",param2,param3);
         return param1;
      }
      
      public static function boostsTouGain(param1:BonusStatsInterface, param2:Function, param3:Boolean = false) : BonusStatsInterface
      {
         param1.boost("体质增益",param2,param3);
         return param1;
      }
      
      public static function boostsSpeGain(param1:BonusStatsInterface, param2:Function, param3:Boolean = false) : BonusStatsInterface
      {
         param1.boost("速度增益",param2,param3);
         return param1;
      }
      
      public static function boostsIntGain(param1:BonusStatsInterface, param2:Function, param3:Boolean = false) : BonusStatsInterface
      {
         param1.boost("智力增益",param2,param3);
         return param1;
      }
      
      public static function boostsLibGain(param1:BonusStatsInterface, param2:Function, param3:Boolean = false) : BonusStatsInterface
      {
         param1.boost("性欲增加",param2,param3);
         return param1;
      }
      
      public static function boostsSenGain(param1:BonusStatsInterface, param2:Function, param3:Boolean = false) : BonusStatsInterface
      {
         param1.boost("敏感度增加",param2,param3);
         return param1;
      }
      
      public static function boostsCorGain(param1:BonusStatsInterface, param2:Function, param3:Boolean = false) : BonusStatsInterface
      {
         param1.boost("腐化增加",param2,param3);
         return param1;
      }
      
      public static function boostsStatLoss(param1:BonusStatsInterface, param2:Function, param3:Boolean = false) : BonusStatsInterface
      {
         param1.boost("属性减少",param2,param3);
         return param1;
      }
      
      public static function boostsStrLoss(param1:BonusStatsInterface, param2:Function, param3:Boolean = false) : BonusStatsInterface
      {
         param1.boost("力量减少",param2,param3);
         return param1;
      }
      
      public static function boostsTouLoss(param1:BonusStatsInterface, param2:Function, param3:Boolean = false) : BonusStatsInterface
      {
         param1.boost("体质损失",param2,param3);
         return param1;
      }
      
      public static function boostsSpeLoss(param1:BonusStatsInterface, param2:Function, param3:Boolean = false) : BonusStatsInterface
      {
         param1.boost("速度损失",param2,param3);
         return param1;
      }
      
      public static function boostsIntLoss(param1:BonusStatsInterface, param2:Function, param3:Boolean = false) : BonusStatsInterface
      {
         param1.boost("智力损失",param2,param3);
         return param1;
      }
      
      public static function boostsLibLoss(param1:BonusStatsInterface, param2:Function, param3:Boolean = false) : BonusStatsInterface
      {
         param1.boost("性欲损失",param2,param3);
         return param1;
      }
      
      public static function boostsSenLoss(param1:BonusStatsInterface, param2:Function, param3:Boolean = false) : BonusStatsInterface
      {
         param1.boost("敏感度损失",param2,param3);
         return param1;
      }
      
      public static function boostsCorLoss(param1:BonusStatsInterface, param2:Function, param3:Boolean = false) : BonusStatsInterface
      {
         param1.boost("腐化降低",param2,param3);
         return param1;
      }
      
      public static function boostsMinLib(param1:BonusStatsInterface, param2:Function, param3:Boolean = false) : BonusStatsInterface
      {
         param1.boost("最低性欲",param2,param3);
         return param1;
      }
      
      public static function boostsMinSens(param1:BonusStatsInterface, param2:Function, param3:Boolean = false) : BonusStatsInterface
      {
         param1.boost("最低敏感度",param2,param3);
         return param1;
      }
   }
}

