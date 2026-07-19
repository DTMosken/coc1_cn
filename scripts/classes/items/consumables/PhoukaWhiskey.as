package classes.items.consumables
{
   import classes.DynStat;
   import classes.Player;
   import classes.StatusEffects;
   import classes._FlagDict.FlagDict_Impl_;
   import classes.globalFlags.KFLAGS;
   import classes.internals.Utils;
   import classes.items.Consumable;
   import flash.Boot;
   import haxe.IMap;
   
   public class PhoukaWhiskey extends Consumable
   {
      
      public function PhoukaWhiskey()
      {
         if(Boot.skip_constructor)
         {
            return;
         }
         super("P_Whsky","Ph. Whiskey","a small bottle of whiskey",20,"A small, corked glass bottle with a dark amber liquid inside. The whiskey smells strongly of peat.");
         _headerName = "普卡威士忌";
         addTags("Fluid");
      }
      
      override public function useItem() : Boolean
      {
         get_player().slimeFeed();
         switch(phoukaWhiskeyDrink(get_player()))
         {
            case 0:
               outputText("你拔开瓶塞，喝了一些威士忌，希望能让你放松一会儿。");
               outputText("[pg]这酒很烈，喝完后你对未来的担忧少了一些。事情最终肯定会好起来的。");
               dynStats(DynStat.Cor(Utils.rand(2) + 1),DynStat.Lust(Utils.rand(8) + 1));
               break;
            case 1:
               outputText("你拔开瓶塞，喝了一些威士忌，希望能缓解自从这个婴儿在你体内生长以来，你对酒精的渴望。");
               outputText("[pg]你一口气把酒喝光，一种满足感涌上心头。看来你的乘客很享受这顿饭。");
               break;
            case 2:
               outputText("起初你感觉到你的宝宝在抗拒威士忌，然后它似乎变得满足并享受它。");
               break;
            case 3:
               outputText("你感到恶心，想吐。你的肚子一阵疼痛，你意识到你怀的宝宝一点也不喜欢这样。");
         }
         var _loc1_:IMap = KFLAGS.flags;
         FlagDict_Impl_.arrayWriteInt(_loc1_,1174,FlagDict_Impl_.arrayReadInt(_loc1_,1174) + 1);
         phoukaWhiskeyAddStatus(get_player());
         return false;
      }
      
      public function phoukaWhiskeyExpires(param1:Player) : void
      {
         var _loc2_:int = int(param1.statusEffectv2(StatusEffects.PhoukaWhiskeyAffect));
         var _loc3_:int = int(param1.statusEffectv3(StatusEffects.PhoukaWhiskeyAffect));
         var _loc4_:int = int(param1.statusEffectv4(StatusEffects.PhoukaWhiskeyAffect));
         var _loc5_:int = _loc3_ & 0xFF;
         var _loc6_:int = int((_loc3_ - _loc5_) / 256);
         var _loc7_:int = _loc4_ & 0xFF;
         var _loc8_:int = int((_loc4_ - _loc7_) / 256);
         dynStats(DynStat.Lib(-_loc6_),DynStat.Sens(_loc5_),DynStat.Spe(_loc8_),DynStat.Inte(_loc7_));
         param1.removeStatusEffect(StatusEffects.PhoukaWhiskeyAffect);
         if(_loc2_ > 3)
         {
            outputText("<b>眩晕感消失了，取而代之的是一种从头骨开始，然后似乎蔓延到全身的剧痛，让你的关节僵硬，胃里翻江倒海。世界感觉像是失去了平衡，你没有任何状态去面对它。你想你可以再喝一杯威士忌，但现在这似乎不是个好主意。</b>\n");
         }
         else if(_loc2_ > 1)
         {
            outputText("<b>那种模糊、快乐的感觉消退了。随之而去的是温暖和无忧无虑的感觉。你的头很痛，你想知道你是否应该再喝一杯威士忌，只是为了帮你度过难关。</b>\n");
         }
         else
         {
            outputText("<b>那种模糊、快乐的感觉消退了。世界问题的重担似乎再次压在了你的身上。这种感觉持续的时候很美好，你不介意再喝一杯威士忌。</b>\n");
         }
         statScreenRefresh();
      }
      
      public function phoukaWhiskeyDrink(param1:Player) : int
      {
         if(param1.get_pregnancyIncubation() == 0 && param1.get_buttPregnancyIncubation() == 0)
         {
            return 0;
         }
         if(param1.get_pregnancyType() == 24)
         {
            if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,1174) == 0)
            {
               return 2;
            }
            if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,1174) < 0)
            {
               return 3;
            }
         }
         return 1;
      }
      
      public function phoukaWhiskeyAddStatus(param1:Player) : void
      {
         var _loc6_:int = 0;
         var _loc2_:int = int(param1.lib + 25 > 100 ? int(100 - param1.lib) : 25);
         var _loc3_:int = int(param1.sens < 10 ? int(param1.sens) : 10);
         var _loc4_:int = int(param1.get_spe() < 20 ? int(param1.get_spe()) : 20);
         var _loc5_:int = int(param1.get_inte() < 20 ? int(param1.get_inte()) : 20);
         if(param1.hasStatusEffect(StatusEffects.PhoukaWhiskeyAffect))
         {
            _loc6_ = int(param1.statusEffectv2(StatusEffects.PhoukaWhiskeyAffect));
            if(_loc6_ < 4)
            {
               param1.addStatusValue(StatusEffects.PhoukaWhiskeyAffect,1,8 - 2 * _loc6_);
            }
            else
            {
               param1.addStatusValue(StatusEffects.PhoukaWhiskeyAffect,1,1);
            }
            param1.addStatusValue(StatusEffects.PhoukaWhiskeyAffect,2,1);
            param1.addStatusValue(StatusEffects.PhoukaWhiskeyAffect,3,256 * _loc2_ + _loc3_);
            param1.addStatusValue(StatusEffects.PhoukaWhiskeyAffect,4,256 * _loc4_ + _loc5_);
            outputText("[pg]哦，味道真好。这东西顺着你的喉咙滑了下去。");
            dynStats(DynStat.Lib(_loc2_),DynStat.Sens(-_loc3_),DynStat.Spe(-_loc4_),DynStat.Inte(-_loc5_));
         }
         else
         {
            param1.createStatusEffect(StatusEffects.PhoukaWhiskeyAffect,8,1,256 * _loc2_ + _loc3_,256 * _loc4_ + _loc5_);
            dynStats(DynStat.Lib(_loc2_),DynStat.Sens(-_loc3_),DynStat.Spe(-_loc4_),DynStat.Inte(-_loc5_));
         }
         statScreenRefresh();
      }
      
      public function phoukaWhiskeyAcceptable(param1:Player) : int
      {
         if(param1.get_pregnancyIncubation() == 0)
         {
            if(param1.get_buttPregnancyIncubation() == 0)
            {
               return 0;
            }
            if(param1.get_buttPregnancyType() == 19)
            {
               return 2;
            }
            return -2;
         }
         if(param1.get_buttPregnancyIncubation() == 0)
         {
            if(param1.get_pregnancyType() == 19)
            {
               return 1;
            }
            if(param1.get_pregnancyType() == 24)
            {
               return 1;
            }
            return -1;
         }
         var _loc2_:Boolean = param1.get_pregnancyType() == 19 || param1.get_pregnancyType() == 24;
         var _loc3_:Boolean = param1.get_buttPregnancyType() == 19;
         if(_loc2_ && _loc3_)
         {
            return 3;
         }
         if(!_loc2_ && !_loc3_)
         {
            return -3;
         }
         return -4;
      }
      
      override public function canUse() : Boolean
      {
         var _loc1_:int = phoukaWhiskeyAcceptable(get_player());
         if(_loc1_ == -4)
         {
            outputText("你盯着瓶子看了一会儿，但决定不冒险伤害你体内孕育的某个孩子。[pg]");
            return false;
         }
         if(_loc1_ == -3)
         {
            outputText("你盯着瓶子看了一会儿，但决定不冒险伤害你体内孕育的两个孩子。[pg]");
            return false;
         }
         if(_loc1_ == -2)
         {
            outputText("你盯着瓶子看了一会儿，但决定不冒险伤害你肠道里孕育的孩子。[pg]");
            return false;
         }
         if(_loc1_ == -1)
         {
            outputText("你盯着瓶子看了一会儿，但决定不冒险伤害你子宫里孕育的孩子。[pg]");
            return false;
         }
         return true;
      }
   }
}

