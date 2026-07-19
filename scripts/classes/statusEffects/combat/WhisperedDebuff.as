package classes.statusEffects.combat
{
   import classes.CoC;
   import classes.Creature;
   import classes.DynStat;
   import classes.PerkLib;
   import classes.Player;
   import classes.StatusEffect;
   import classes.StatusEffectType;
   import classes.StatusEffects;
   import classes.internals.Utils;
   import flash.Boot;
   
   public class WhisperedDebuff extends CombatBuff
   {
      
      public static var init__:Boolean;
      
      public static var TYPE:StatusEffectType;
      
      public function WhisperedDebuff()
      {
         if(Boot.skip_constructor)
         {
            return;
         }
         super(WhisperedDebuff.TYPE,"inte");
      }
      
      override public function onCombatRound() : void
      {
         var _loc1_:int = 0;
         var _loc2_:int = 0;
         if(value2 > 0)
         {
            _loc1_ = int(Math.max(10,get_host().get_inte() / 5));
            _loc2_ = int(Math.max(20,50 - get_host().get_inte() / 4));
         }
         else
         {
            _loc1_ = int(Math.max(10,get_host().get_inte() / 4));
            _loc2_ = int(Math.max(10,25 - get_host().get_inte() / 4));
         }
         if(get_host().hasPerk(PerkLib.Resolute))
         {
            _loc1_ *= 2;
            _loc2_ /= 2;
         }
         if(Utils.rand(100) < _loc1_)
         {
            if(get_playerHost() != null)
            {
               StatusEffect.get_game().outputText("[pg-][b:你设法集中精神，摆脱了持续不断的" + (value2 > 0 ? "精神攻击" : "低语") + "。][pg-]");
            }
            remove();
         }
         else
         {
            if(get_playerHost() != null)
            {
               StatusEffect.get_game().outputText("[pg-][b:一阵" + (value2 > 0 ? "尖锐的尖叫声" : "低语声") + "在你的脑海中回荡，让你充满不安的想法，难以集中注意力。]");
               if(value2 > 0)
               {
                  get_host().takeLustDamage(1 + Utils.rand(5),true);
                  buffHost(DynStat.Inte(-5));
               }
               StatusEffect.get_game().outputText("[pg-]");
            }
            if(Utils.rand(100) < _loc2_)
            {
               get_host().createStatusEffect(StatusEffects.Whispered,0,0,0,0);
            }
         }
      }
      
      override public function apply(param1:Boolean) : void
      {
         if(param1)
         {
            buffHost(DynStat.Inte(-5));
            get_host().createStatusEffect(StatusEffects.Whispered,0,0,0,0);
         }
         super.apply(param1);
      }
   }
}

