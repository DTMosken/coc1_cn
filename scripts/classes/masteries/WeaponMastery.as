package classes.masteries
{
   import classes.MasteryType;
   import flash.Boot;
   
   public class WeaponMastery extends MasteryType
   {
      
      public function WeaponMastery(param1:String = undefined, param2:String = undefined, param3:String = undefined, param4:String = undefined, param5:Number = 1.5, param6:int = 5, param7:Boolean = true)
      {
         if(param3 == null)
         {
            param3 = "Weapon";
         }
         if(param4 == null)
         {
            param4 = "";
         }
         if(Boot.skip_constructor)
         {
            return;
         }
         super(param1,param2,"Weapon",param4,param5,param6,param7);
      }
      
      override public function onLevel(param1:int, param2:Boolean = true) : void
      {
         super.onLevel(param1,param2);
         var _loc3_:String = "伤害和精准度略微提升。";
         switch(param1)
         {
            case 1:
               break;
            case 2:
               if(get_player().get_weapon().isWhip())
               {
                  _loc3_ += "[pg-]<b>鞭绊</b>已解锁！";
               }
               if(get_player().get_weapon().isOneHandedMelee())
               {
                  _loc3_ += "[pg-]<b>无尽连打</b>已解锁！";
               }
               if(get_player().get_weapon().isLarge())
               {
                  _loc3_ += "[pg-]<b>复仇之弧</b>已解锁！";
               }
               if(get_player().get_weapon().isKnife())
               {
                  _loc3_ += "[pg-]<b>背刺</b>已解锁！";
               }
               if(get_player().get_weapon().isSpear())
               {
                  _loc3_ += "[pg-]<b>巨力突刺</b>已解锁！";
               }
               if(get_player().get_weapon().isFirearm())
               {
                  _loc3_ += "[pg-][b:瞄准射击]已解锁！";
               }
               if(get_player().get_weapon().isAxe())
               {
                  _loc3_ += "[pg-][b:撕裂]已解锁！";
               }
               break;
            case 3:
            case 4:
               _loc3_ += " 特殊技能的疲劳消耗降低。";
               break;
            case 5:
               _loc3_ += " 特殊技能的疲劳消耗降低。";
               _loc3_ += "[pg-]你的技巧已经达到了极高的水平，普通攻击几乎毫不费力，让你在攻击时能恢复更多疲劳值。";
         }
         if(get_player().get_weapon().isHybrid())
         {
            _loc3_ += "[pg-]（你目前使用的是混合武器，其熟练度取所有适用武器熟练度的平均值）";
         }
         if(param2 && _loc3_ != "")
         {
            outputText(_loc3_ + "[pg-]");
         }
      }
   }
}

