package classes.items
{
   import classes.BaseContent;
   import classes.DynStat;
   import classes.StatusEffects;
   import classes.internals.Utils;
   import flash.Boot;
   
   public class WeaponEffects extends BaseContent
   {
      
      public function WeaponEffects()
      {
         if(Boot.skip_constructor)
         {
            return;
         }
         super();
      }
      
      public function summonedDrain(param1:int = 5) : void
      {
         get_player().changeFatigue(param1);
         if(get_player().fatigueLeft() <= 0)
         {
            outputText("\n由于无法维持法术，你的[weapon]消失了。");
            get_player().setUnarmed();
         }
      }
      
      public function stunAndBleed(param1:int = 10, param2:int = 50) : void
      {
         stun(param1);
         bleed(param2);
      }
      
      public function stun(param1:int = 10) : void
      {
         if(get_monster().stun(Utils.rand(3),param1))
         {
            outputText("\n[Themonster]被这残暴的一击打得连连后退，陷入了眩晕。");
         }
      }
      
      public function strongRecoil() : void
      {
         if(get_player().stun(0,int(150 - get_player().get_str())))
         {
            outputText("\n武器的后坐力对你来说太强了！枪械猛地跳起，砸在你的脸上，<b>将你击晕了！</b>");
         }
      }
      
      public function none() : void
      {
      }
      
      public function lustPoison(param1:int = 5, param2:int = 10, param3:String = undefined) : void
      {
         if(param3 == null)
         {
            param3 = "poison";
         }
         if(get_monster().lustVuln > 0)
         {
            if(param3 == "poison")
            {
               outputText("\n[Themonster]浑身颤抖，你武器上的“毒药”开始起作用了。");
            }
            if(param3 == "coiled")
            {
               if(!get_monster().get_plural())
               {
                  outputText("\n[Themonster]浑身颤抖，被鞭打得兴奋起来。");
               }
               else
               {
                  outputText("\n[Themonster]因为鞭打而颤抖并兴奋起来。");
               }
            }
            get_monster().teased(get_monster().lustVuln * (param1 + get_player().cor / param2));
         }
      }
      
      public function dullahanDrain(param1:int = 30, param2:int = 10) : void
      {
         outputText("\n你感觉到镰刀在吸取你的生命原力。");
         get_player().takeDamage(param1 + Utils.rand(param2),true);
      }
      
      public function corruptedTease(param1:int = 50, param2:int = 20, param3:int = 15) : void
      {
         if(Utils.rand(100) <= param1 && get_monster().lustVuln > 0)
         {
            if(get_player().cor < 60)
            {
               dynStats(DynStat.Cor(0.1));
            }
            if(get_player().cor < 90)
            {
               dynStats(DynStat.Cor(0.05));
            }
            if(!get_monster().get_plural())
            {
               outputText("\n[Themonster]因为鞭子的触碰而不由自主地颤抖和呻吟。");
            }
            else
            {
               outputText("\n[Themonster]因为鞭子的触碰而不由自主地颤抖和呻吟。");
            }
            get_monster().teased(get_monster().lustVuln * (param2 + get_player().cor / param3));
            if(Utils.rand(2) == 0)
            {
               outputText("你从中获得了性快感。");
               dynStats(DynStat.Lust(1));
            }
         }
      }
      
      public function bleed(param1:int = 50, param2:Number = 1) : void
      {
         if(Utils.rand(100) <= param1 && !get_monster().hasStatusEffect(StatusEffects.IzmaBleed))
         {
            if(!get_monster().bleed(get_player(),3,param2))
            {
               outputText("\n[Themonster]似乎不会流血！");
            }
            else if(get_monster().get_plural())
            {
               outputText("\n[Themonster]身上被你的[weapon]留下了许多血淋淋的伤口，鲜血从中喷涌而出。");
            }
            else
            {
               outputText("\n[Themonster]身上被你的[weapon]留下了许多血淋淋的伤口，鲜血从中喷涌而出。");
            }
         }
      }
   }
}

